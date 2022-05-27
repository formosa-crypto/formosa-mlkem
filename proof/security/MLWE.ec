require import AllCore Ring SmtMap Distr.
require (****) ROM Matrix.

clone import Matrix as Matrix_.

(***************************************************)
(* FIXME: THIS INSTANCE SHOULD COME FROM MATRIX    *)

instance ring with R
  op rzero = ZR.zeror
  op rone  = ZR.oner
  op add   = ZR.( + )
  op opp   = ZR.([-])
  op mul   = ZR.( * )
  op expr  = ZR.exp
  op ofint = ZR.ofint

  proof oner_neq0 by apply ZR.oner_neq0
  proof addrA     by apply ZR.addrA
  proof addrC     by apply ZR.addrC
  proof addr0     by apply ZR.addr0
  proof addrN     by apply ZR.addrN
  proof mulr1     by apply ZR.mulr1
  proof mulrA     by apply ZR.mulrA
  proof mulrC     by apply ZR.mulrC
  proof mulrDl    by apply ZR.mulrDl
  proof expr0     by apply ZR.expr0
  proof ofint0    by apply ZR.ofint0
  proof ofint1    by apply ZR.ofint1
  proof exprS     by apply ZR.exprS
  proof ofintS    by apply ZR.ofintS
  proof ofintN    by apply ZR.ofintN.


(* --------------------------------------------------------------------------- *)
(* Uniform distribution over R *)
op [lossless uniform full] duni_R : R distr.

lemma duni_R_funi : is_funiform duni_R.
proof. apply is_full_funiform; [apply duni_R_fu | apply duni_R_uni]. qed.

(* --------------------------------------------------------------------------- *)
(* Distribution over R (short values) *)

op [lossless] dshort_R  : R distr.

(* --------------------------------------------------------------------------- *)
(* Extention of those definitions to vector *) 
op duni = dvector duni_R.
op dshort = dvector dshort_R.

lemma duni_ll : is_lossless duni.
proof. apply/dvector_ll/duni_R_ll. qed.

lemma duni_fu : is_full duni.
proof. apply /dvector_fu /duni_R_fu. qed.

lemma duni_uni : is_uniform duni.
proof. apply /dvector_uni/duni_R_uni. qed.

lemma duni_funi : is_funiform duni.
proof. apply /is_full_funiform; [apply duni_fu | apply duni_uni]. qed.

lemma dshort_ll : is_lossless dshort.
proof. apply/dvector_ll/dshort_R_ll. qed.

(* --------------------------------------------------------------------------- *)
(* Extention of those definitions to matrix *) 

op duni_matrix = dmatrix duni_R.

lemma duni_matrix_ll : is_lossless duni_matrix.
proof. apply/dmatrix_ll/duni_R_ll. qed.

lemma duni_matrix_fu : is_full duni_matrix.
proof. apply /dmatrix_fu/duni_R_fu. qed.

lemma duni_matrix_uni : is_uniform duni_matrix.
proof. apply /dmatrix_uni/duni_R_uni. qed.

lemma duni_matrix_funi : is_funiform duni_matrix.
proof. apply /is_full_funiform; [apply duni_matrix_fu | apply duni_matrix_uni]. qed.

module type Adv_T = {
   proc guess(A : matrix, t : vector, uv : vector * R) : bool
}.

abbrev [-printing] m_transpose = trmx.
abbrev (`<*>`) = dotp.
abbrev (&+) = ZR.(+).
abbrev (&-) = ZR.(-).

module MLWE(Adv : Adv_T) = {

  proc main(b : bool) : bool = {
    var s, e, _A, u0, u1, t, e', v0, v1, b';
    
    _A <$ duni_matrix;
    s <$ dshort;
    e <$ dshort;
    u0 <- _A *^ s + e;
    u1 <$ duni;
    
    t <$ duni;
    e' <$ dshort_R;
    v0 <- (t `<*>` s) &+ e';
    v1 <$ duni_R;
    
    b' <@ Adv.guess(_A, t, if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

(* --------------------------------------------------------------------------- *)
(* Version of MLWE using a concrete hash function to derive the matrix         *)
(* --------------------------------------------------------------------------- *)
type seed.
op H : seed -> matrix.

(* --------------------------------------------------------------------------- *)
op [lossless] dseed : seed distr.

module type HAdv_T = {
   proc guess(sd : seed, t : vector, uv : vector * R) : bool
}.

module MLWE_H(Adv : HAdv_T) = {

  proc main(tr b : bool) : bool = {
    var sd, s, e, _A, u0, u1, t, e', v0, v1, b';
    
    sd <$ dseed;
    s <$ dshort;
    e <$ dshort;
    _A <- if tr then m_transpose (H sd) else H sd;
    u0 <- _A *^ s + e;
    u1 <$ duni;
    
    t <$ duni;
    e' <$ dshort_R;
    v0 <- (t `<*>` s) &+ e';
    v1 <$ duni_R;
    
    b' <@ Adv.guess(sd, t, if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

(****************************************************************************)
(* Clearly the MLWE assumption and the H_MLWE assumption are the same when 
 *  one gets the matrix from from a random oracle.                          *)
(****************************************************************************)

theory MLWE_ROM.

clone import ROM as RO_H with
  type in_t  = seed,
  type out_t = matrix,
  op dout    = fun (sd : seed) => duni_matrix, 
  type d_in_t = bool,
  type d_out_t = bool.

import Lazy.

module type ROAdv_T(O : POracle) = {
   proc guess(sd : seed, t : vector, uv : vector * R) : bool
}.

module MLWE_RO(Adv : ROAdv_T, O : Oracle) = {

  proc main(tr : bool, b : bool) : bool = {
    var sd, s, e, _A, u0, u1, t, e', v0, v1, b';
    
    O.init();
    sd <$ dseed;
    s <$ dshort;
    e <$ dshort;
    _A <@ O.o(sd);
    _A <- if tr then m_transpose _A else _A;
    u0 <- _A *^ s + e;
    u1 <$ duni;
    
    t <$ duni;
    e' <$ dshort_R;
    v0 <- (t `<*>` s) &+ e';
    v1 <$ duni_R;
    
    b' <@ Adv(O).guess(sd, t, if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

theory MLWE_vs_MLWE_ROM.

module B(A : ROAdv_T, O : Oracle) : Adv_T = {
  var _sd : seed
  var __A : matrix

  module FakeRO  = {
      proc o(sd : seed) : matrix = {
           var _Ares;
           _Ares <- __A;
           if (sd <> _sd) {
              _Ares <@ O.o(sd);
           }
           return _Ares;
      }
  }
  
  proc guess(_A : matrix, t : vector, uv : vector * R) : bool = {
    var sd, b;
    sd <$ dseed;
    _sd <- sd;
    __A <- _A;
    O.init();
    b <@ A(FakeRO).guess(sd,t,uv);
    return b;
  }

}.

module Bt(A : ROAdv_T, O : Oracle) : Adv_T = {
  var _sd : seed
  var __A : matrix

  module FakeRO  = {
      proc o(sd : seed) : matrix = {
           var _Ares;
           _Ares <- __A;
           if (sd <> _sd) {
              _Ares <@ O.o(sd);
           }
           return _Ares;
      }
  }
  
  proc guess(_A : matrix, t : vector, uv : vector * R) : bool = {
    var sd, b;
    sd <$ dseed;
    _sd <- sd;
    __A <- m_transpose _A;
    O.init();
    b <@ A(FakeRO).guess(sd,t,uv);
    return b;
  }

}.

lemma MLWE_RO_equiv b &m (A <: ROAdv_T {-LRO,-B}):
  Pr[  MLWE_RO(A,LRO).main(false,b) @ &m : res ] =
  Pr[  MLWE(B(A,LRO)).main(b) @ &m : res].
proof.
byequiv => //.
proc; inline B(A,LRO).guess.
swap {2} 16 -15.
swap {2} 11 -8.
swap {2} 14 -13.
swap {2} [15..16] -10.
swap {1} 5 -2.
seq 3 6 : (#pre /\ ={b,_A,sd} /\ (LRO.m{1}.[B._sd{2}] = Some B.__A{2}) /\ 
          B.__A{2} = _A{2} /\ B._sd{2} = sd{2} /\ 
          (forall x, x <> B._sd{2} => LRO.m{1}.[x] = LRO.m{2}.[x]));
 first by inline *; auto => />; smt(@SmtMap).
wp;call(: (LRO.m{1}.[B._sd{2}] = Some B.__A{2}) /\ 
            forall x, x <> B._sd{2} => LRO.m{1}.[x] = LRO.m{2}.[x]).
proc;inline *.
case (sd{2} = B._sd{2}).
+ rcondf{1} 2; first by auto => /> /#.
  rcondf{2} 2; first by auto.
  by auto => />; smt(duni_matrix_ll).
+ rcondt{2} 2; first by auto.
  by auto => />;smt(get_setE).
by auto => />.
qed.

lemma MLWE_RO_equiv_t b &m (A <: ROAdv_T {-LRO,-Bt}):
  Pr[  MLWE_RO(A,LRO).main(true,b) @ &m : res ] =
  Pr[  MLWE(Bt(A,LRO)).main(b) @ &m : res].
proof.
byequiv => //.
proc; inline Bt(A,LRO).guess.
swap {2} 16 -15.
swap {2} 11 -8.
swap {2} 14 -13.
swap {2} [15..16] -10.
swap {1} 5 -2.
seq 3 6 : (#pre /\ ={b,sd} /\ _A{1} = m_transpose _A{2} /\ 
           LRO.m{1}.[Bt._sd{2}] = Some Bt.__A{2} /\ 
           Bt.__A{2} = m_transpose _A{2} /\ Bt._sd{2} = sd{2} /\ 
           (forall x, x <> Bt._sd{2} => LRO.m{1}.[x] = LRO.m{2}.[x])).
+ inline *; wp; rnd (fun m => m_transpose m) (fun m => m_transpose m).
  by auto => />;   smt(@SmtMap trmxK duni_matrix_funi). 
wp;call(: (LRO.m{1}.[Bt._sd{2}] = Some Bt.__A{2}) /\ 
            forall x, x <> Bt._sd{2} => LRO.m{1}.[x] = LRO.m{2}.[x]).
proc;inline *.
case (sd{2} = Bt._sd{2}).
+ rcondf{1} 2; first by auto => />/#.
  rcondf{2} 2; first by auto.
  by auto => />;smt(duni_matrix_ll).
+ rcondt{2} 2; first by auto.
  by auto => />;smt(get_setE).
by auto => />;smt(trmxK).
qed.

end MLWE_vs_MLWE_ROM.

end MLWE_ROM.

(****************************************************************************)
(* For Kyber it is more convenient to reduce the security of the spec
   to the following assumption, which is based on a matrix sampler that
   calls the ROM in a possibly intricate way. 
   To Do. Prove equivalence to MLWE for the Kyber sampler                   *)
(****************************************************************************)

theory MLWE_SMP.

clone import ROM as RO_SMP.

import Lazy.

(* --------------------------------------------------------------------------- *)
module type Sampler(O : POracle) = {
    proc sampleA(sd : seed) : matrix
    proc sampleAT(sd : seed) : matrix
}.

module type PSampler = {
    proc sampleA(sd : seed) : matrix
    proc sampleAT(sd : seed) : matrix
}.

(* --------------------------------------------------------------------------- *)
module type SAdv_T(O : POracle) = {
   proc interact(sd : seed, t : vector) : unit
   proc guess(uv : vector * R) : bool
}.

module MLWE_SMP(Adv : SAdv_T, S: Sampler, O : Oracle) = {

  proc main(tr : bool, b : bool) : bool = {
    var sd, s, e, _A, u0, u1, t, e', v0, v1, b';
    
    O.init();

    sd <$ dseed;
    t <$ duni;
    Adv(O).interact(sd,t); (* Allow Adv to create some O state *)

    if (tr) { _A <@ S(O).sampleAT(sd); }
    else    { _A <@ S(O).sampleA(sd);  }

    s <$ dshort;
    e <$ dshort;
    u0 <- _A *^ s + e;
    u1 <$ duni;
    
    e' <$ dshort_R;
    v0 <- (t `<*>` s) &+ e';
    v1 <$ duni_R;
    
    b' <@ Adv(O).guess(if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

end MLWE_SMP.

(* We can go back to MLWE with a trivial sampler and the RO proof
   but we need LazyEager here, and so the input type to the RO
   feeding the sampler must be finite. *)
theory SMP_vs_ROM.

import MLWE_ROM.

clone import MLWE_SMP with
  theory RO_SMP <- RO_H.

import RO_H.
import Lazy.

module (S : Sampler) (O : POracle) = {
  proc sampleA(sd : seed) : matrix = {
      var _A;
      _A <@ O.o(sd);
      return _A;
  }
  proc sampleAT(sd : seed) : matrix = {
      var _A;
      _A <@ O.o(sd);
      return trmx _A;
  }
}.

module (BS(Adv : SAdv_T, S : Sampler) : ROAdv_T) (O : POracle) = {
   proc guess(sd : seed, t : vector,uv : vector * R) = {
       var b;
       Adv(O).interact(sd,t);
       b <@ Adv(O).guess(uv);
       return b;
   }
}.

import MLWE_vs_MLWE_ROM.

module DLeftAux(A : SAdv_T)  (O : POracle) = {
     proc run(tr : bool,b : bool) : bool = {
        var sd,t,_A,s,e,u0,u1,e',v0,v1,b';     
        sd <$ dseed;
        s <$ dshort;
        e <$ dshort;
        _A <@ O.o(sd);
        _A <- if tr then trmx _A else _A;
        u0 <- _A *^ s + e;
        u1 <$ duni;
        t <$ duni;
        e' <$ dshort_R;
        v0 <- (t `<*>` s) &+ e';
        v1 <$ duni_R;
        b' <@ BS(A, S, O).guess(sd, t,if b then (u1, v1) else (u0, v0)); 
        return b';
     }
}.

module (DLeft(A : SAdv_T) : Distinguisher)  (O : POracle) = {
     proc run(b : bool) : bool = {
         var b';
         b' <@ DLeftAux(A,O).run(false,b);
         return b';
     }
}.

module (DLeftT(A : SAdv_T) : Distinguisher)  (O : POracle) = {
     proc run(b : bool) : bool = {
         var b';
         b' <@ DLeftAux(A,O).run(true,b);
         return b';
     }
}.

module DRightAux(A : SAdv_T)   (O : POracle) = {
     proc run(tr : bool, b : bool) : bool = {
        var sd,t,_A,s,e,u0,u1,e',v0,v1,b';
        sd <$ dseed;
        t <$ duni;
        A(O).interact(sd, t);
        if (tr) { _A <@ S(O).sampleAT(sd); }
        else    { _A <@ S(O).sampleA(sd);  }
        s <$ dshort;
        e <$ dshort;
        u0 <- _A *^ s + e;
        u1 <$ duni;
        e' <$ dshort_R;
        v0 <- (t `<*>` s) &+ e';
        v1 <$ duni_R;
        b' <@ A(O).guess(if b then (u1, v1) else (u0, v0));
        return b';
     }
}.

module (DRight(A : SAdv_T) : Distinguisher)  (O : POracle) = {
     proc run(b : bool) : bool = {
         var b';
         b' <@ DRightAux(A,O).run(false,b);
         return b';
     }
}.

module (DRightT(A : SAdv_T) : Distinguisher)  (O : POracle) = {
     proc run(b : bool) : bool = {
         var b';
         b' <@ DRightAux(A,O).run(true,b);
         return b';
     }
}.

clone import LazyEager.

lemma MLWE_SMP_equiv_lel tr b &m (A <: SAdv_T {-ERO, -LRO,-B,-Bt, -BS}):
  Pr[  MLWE_RO(BS(A,S),LRO).main(tr,b) @ &m : res] =
  Pr[  MLWE_RO(BS(A,S),ERO).main(tr,b) @ &m : res].
case (tr = false).
+ move => ->.
  have left : forall &m0,
           Pr[  MLWE_RO(BS(A,S),LRO).main(false, b) @ &m0 : res] = 
           Pr[  Exp(LRO,DLeft(A)).main(b) @ &m0 : res].
  + move => &m0; byequiv => //; last by smt().  
    by proc; inline {2} 2;  inline {2} 3; sim; wp; conseq />;  sim.
  have right : forall &m1, Pr[  MLWE_RO(BS(A,S),ERO).main(false,b) @ &m1 : res] = 
                         Pr[  Exp(ERO,DLeft(A)).main(b) @ &m1 : res].
  + move => &m0; byequiv => //; last by smt().  
    by proc; inline {2} 2; inline {2} 3; sim; wp; conseq />;  sim.
  have le : 
     equiv [ Exp(LRO, DLeft(A)).main ~ Exp(ERO, DLeft(A)).main : 
       ={glob DLeft(A),arg} ==> ={res}] by apply (eq_eager_sampling (DLeft(A)) _); smt(duni_matrix_ll).
  have ? : forall &m0 &m1 ,
     (glob DLeft(A)){m0} = (glob DLeft(A)){m1} =>
       Pr[Exp(LRO, DLeft(A)).main(b) @ &m0 : res] =
       Pr[Exp(ERO, DLeft(A)).main(b) @ &m1 : res] 
   by move => &m0 &m1 eqB; byequiv (le); smt().
  by smt().
move => *; have -> : tr by smt().
have left : forall &m0,
         Pr[  MLWE_RO(BS(A,S),LRO).main(true, b) @ &m0 : res] = 
         Pr[  Exp(LRO,DLeftT(A)).main(b) @ &m0 : res].
+ move => &m0; byequiv => //; last by smt().  
  by proc; inline {2} 2;  inline {2} 3; sim; wp; conseq />;  sim.
have right : forall &m1, Pr[  MLWE_RO(BS(A,S),ERO).main(true,b) @ &m1 : res] = 
                         Pr[  Exp(ERO,DLeftT(A)).main(b) @ &m1 : res].
+ move => &m0; byequiv => //; last by smt().  
  by proc; inline {2} 2; inline {2} 3; sim; wp; conseq />;  sim.
have le : 
   equiv [ Exp(LRO, DLeftT(A)).main ~ Exp(ERO, DLeftT(A)).main : 
       ={glob DLeftT(A),arg} ==> ={res}] by apply (eq_eager_sampling (DLeftT(A)) _); smt(duni_matrix_ll).
have ? : forall &m0 &m1 ,
     (glob DLeft(A)){m0} = (glob DLeft(A)){m1} =>
       Pr[Exp(LRO, DLeftT(A)).main(b) @ &m0 : res] =
       Pr[Exp(ERO, DLeftT(A)).main(b) @ &m1 : res] 
 by move => &m0 &m1 eqB; byequiv (le); smt().
by smt().
qed.

lemma MLWE_SMP_equiv_ler tr b &m (A <: SAdv_T {-ERO,-LRO,-B,-Bt, -BS}):
  Pr[  MLWE_SMP(A,S,LRO).main(tr,b) @ &m : res]=
  Pr[  MLWE_SMP(A,S,ERO).main(tr,b) @ &m : res].
case (tr = false).
move => ->.
+ have left : forall &m0,  
          Pr[  MLWE_SMP(A,S,LRO).main(false,b) @ &m0 : res] = 
          Pr[ Exp(LRO,DRight(A)).main(b) @ &m0 : res].
  + move => &m0; byequiv => //=; last by smt().
    by proc; inline {2} 2; inline {2} 3;sim; inline *; auto => />.
  have right : forall &m1,
             Pr[  MLWE_SMP(A,S,ERO).main(false,b) @ &m1 : res] = 
             Pr[ Exp(ERO,DRight(A)).main(b) @ &m1 : res].
  + move => &m1; byequiv => //=; last by smt().
    by proc; inline {2} 2; inline {2} 3; sim; wp; conseq />; sim.
  have le : 
     equiv [ Exp(LRO, DRight(A)).main ~ Exp(ERO, DRight(A)).main : 
     ={glob DRight(A),arg} ==> ={res}] by apply (eq_eager_sampling (DRight(A)) _); smt(duni_matrix_ll).
  have ? : forall &m0 &m1 ,
     (glob DLeft(A)){m0} = (glob DLeft(A)){m1} =>
       Pr[Exp(LRO, DRight(A)).main(b) @ &m0 : res] =
       Pr[Exp(ERO, DRight(A)).main(b) @ &m1 : res] 
     by move => &m0 &m1 eqB; byequiv (le); smt().
  by smt().
move => *; have -> : tr by smt().
have left : forall &m0,  
          Pr[  MLWE_SMP(A,S,LRO).main(true,b) @ &m0 : res] = 
          Pr[ Exp(LRO,DRightT(A)).main(b) @ &m0 : res].
+ move => &m0; byequiv => //=; last by smt().
  by proc; inline {2} 2; inline {2} 3; sim; inline *; auto => />.
have right : forall &m1,
             Pr[  MLWE_SMP(A,S,ERO).main(true,b) @ &m1 : res] = 
             Pr[ Exp(ERO,DRightT(A)).main(b) @ &m1 : res].
+ move => &m1; byequiv => //=; last by smt().
  by proc; inline {2} 2; inline {2} 3; sim; wp; conseq />; sim.
have le : 
   equiv [ Exp(LRO, DRightT(A)).main ~ Exp(ERO, DRightT(A)).main : 
     ={glob DRightT(A),arg} ==> ={res}] by apply (eq_eager_sampling (DRightT(A))  _); smt(duni_matrix_ll).
have ? : forall &m0 &m1 ,
     (glob DLeft(A)){m0} = (glob DLeft(A)){m1} =>
       Pr[Exp(LRO, DRightT(A)).main(b) @ &m0 : res] =
       Pr[Exp(ERO, DRightT(A)).main(b) @ &m1 : res] 
   by move => &m0 &m1 eqB; byequiv (le); smt().
by smt().
qed.

lemma MLWE_SMP_equiv b &m (A <: SAdv_T {-ERO,-LRO,-B,-Bt, -BS}):
  Pr[  MLWE(B(BS(A,S),LRO)).main(b) @ &m : res] =
  Pr[  MLWE_SMP(A,S,LRO).main(false,b) @ &m : res].
proof.
rewrite -(MLWE_RO_equiv b &m (BS(A,S))).
rewrite (MLWE_SMP_equiv_lel false b &m A).
rewrite (MLWE_SMP_equiv_ler false b &m A).
byequiv =>//;proc.
rcondf{2} 5; 1: by move => *; auto => />.  
inline {1} 13. inline {2} 5.
swap {1} [8..10] -3. swap{1} 12 -4. swap {1} 13 -10. swap {1} 14 -6. swap {1} 16 -4. 
swap {2} [8..9] -5. swap{2} 11 -6. swap{2} 12 -5. swap {2} 14 -6. swap {2} 10 -7.
swap {1} 1 9. swap {2} 1 8. swap {2} 11 -1. 
seq 9 8 : (!tr{2} /\  ={tr,b,glob A,sd,sd0,s,e,u1,t,e',v1} /\ sd0{1} = sd{2} /\ t0{1} = t{2}); 
   1: by inline *; auto.
wp; call (_: ={glob ERO}); 1: by sim.
wp;conseq (_: ={glob A, sd, sd0} /\ sd0{1} = sd{2} /\ t0{1} = t{2} 
          ==> ={glob A, ERO.m}   /\ _A{1} = _A0{2}); 1,2: by smt().
by sim.
qed.

lemma MLWE_SMP_equiv_t b &m (A <: SAdv_T {-ERO,-LRO,-B,-Bt, -BS}):
  Pr[  MLWE(Bt(BS(A,S),LRO)).main(b) @ &m : res] =
  Pr[  MLWE_SMP(A,S,LRO).main(true,b) @ &m : res].
proof.
rewrite -(MLWE_RO_equiv_t b &m (BS(A,S))).
rewrite (MLWE_SMP_equiv_lel true b &m A).
rewrite (MLWE_SMP_equiv_ler true b &m A).
byequiv =>//;proc.  
rcondt{2} 5; 1: by move => *; auto => />.  
inline {1} 13. inline {2} 5.
swap {1} [8..10] -3. swap{1} 12 -4. swap {1} 13 -10. swap {1} 14 -6. swap {1} 16 -4. 
swap {2} [8..9] -5. swap{2} 11 -6. swap{2} 12 -5. swap {2} 14 -6. swap {2} 10 -7.
swap {1} 1 9. swap {2} 1 8. swap {2} 11 -1. 
seq 9 8 : (tr{2} /\  ={tr,b,glob A,sd,sd0,s,e,u1,t,e',v1} /\ sd0{1} = sd{2} /\ t0{1} = t{2}); 
   1: by inline *; auto.
wp; call (_: ={glob ERO}); 1: by sim.
wp;conseq (_: ={glob A, sd, sd0} /\ sd0{1} = sd{2} /\ t0{1} = t{2} 
          ==> ={glob A, ERO.m}   /\ _A{1} = _A0{2}); 1,2: by smt().
by sim.
qed.

end SMP_vs_ROM.

(* More interestingly, if one can prove a form of indifferentiability
   from the RO that samples matrices, we can go back to MLWE. *)
theory SMP_vs_ROM_IND.

import MLWE_ROM.

import MLWE_SMP.

module type Simulator_t(O : RO_H.POracle) = {
   include RO_SMP.POracle
}.

module type Distinguisher_t(S : PSampler, O : RO_SMP.POracle) = {
   proc distinguish(tr b : bool, sd : seed) : bool 
}.

module WIndfReal(D : Distinguisher_t, S : Sampler, O : RO_SMP.Oracle) = {
   proc main(tr b : bool) : bool = {
        var sd,b';
        O.init();
        sd <$ dseed;
        b' <@ D(S(O),O).distinguish(tr, b ,sd);
        return b';
   }
}.

module WIndfIdeal(D : Distinguisher_t, Sim : Simulator_t, O : RO_H.Oracle) = {

   proc main(tr b : bool) : bool = {
        var sd,b';
        O.init();
        sd <$ dseed;
        b' <@ D(SMP_vs_ROM.S(O),Sim(O)).distinguish(tr, b,sd);
        return b';
   }
}.

module (BS(Adv : SAdv_T, Sim : Simulator_t) : ROAdv_T) (O : RO_H.POracle) = {
   proc guess(sd : seed, t : vector,uv : vector * R) = {
       var b;
       Adv(Sim(O)).interact(sd,t);
       b <@ Adv(Sim(O)).guess(uv);
       return b;
   }
}.

import MLWE_vs_MLWE_ROM.

module O = RO_H.Lazy.LRO.
module OS = RO_SMP.Lazy.LRO.

module (D(A : SAdv_T) : Distinguisher_t) (S : PSampler, O : RO_SMP.POracle) = {
  proc distinguish(tr b : bool, sd : seed) : bool = {
    var _A,t,s,e,u0,u1,e',v0,v1,b';        
    t <$ duni;
    A(O).interact(sd,t); 
    if (tr) { _A <@ S.sampleAT(sd); }
    else    { _A <@ S.sampleA(sd);  }
    s <$ dshort;                                             
    e <$ dshort;                                              
    u0 <- _A *^ s + e;            
    u1 <$ duni;                                               
    e' <$ dshort_R;                                          
    v0 <- (t `<*>` s) &+ e';                                    
    v1 <$ duni_R;                                    
    b' <@ A(O).guess(if b then (u1, v1) else (u0, v0));
    return b';
  }
}.


import RO_H.
clone import LazyEager.

module DLeftAux(A : SAdv_T, Sim : Simulator_t)  (O : RO_H.POracle) = {
     proc run(tr : bool,b : bool) : bool = {
        var sd,t,_A,s,e,u0,u1,e',v0,v1,b';     
        sd <$ dseed;
        s <$ dshort;
        e <$ dshort;
        _A <@ O.o(sd);
        _A <- if tr then trmx _A else _A;
        u0 <- _A *^ s + e;
        u1 <$ duni;
        t <$ duni;
        e' <$ dshort_R;
        v0 <- (t `<*>` s) &+ e';
        v1 <$ duni_R;
        b' <@ BS(A, Sim, O).guess(sd, t,if b then (u1, v1) else (u0, v0)); 
        return b';
     }
}.

module (DLeft(A : SAdv_T, Sim : Simulator_t) : Distinguisher)  (O : RO_H.POracle) = {
     proc run(b : bool) : bool = {
         var b';
         b' <@ DLeftAux(A,Sim,O).run(false,b);
         return b';
     }
}.

module (DLeftT(A : SAdv_T, Sim : Simulator_t) : Distinguisher)  (O : POracle) = {
     proc run(b : bool) : bool = {
         var b';
         b' <@ DLeftAux(A,Sim,O).run(true,b);
         return b';
     }
}.

module DRightAux(A : SAdv_T, Sim : Simulator_t)   (O : POracle) = {
     proc run(tr : bool, b : bool) : bool = {
        var sd,t,_A,s,e,u0,u1,e',v0,v1,b';
        sd <$ dseed;
        t <$ duni;
        A(Sim(O)).interact(sd, t);
        if (tr) { _A <@ O.o(sd);  _A <- trmx _A; } 
        else {  _A <@ O.o(sd); }
        s <$ dshort;
        e <$ dshort;
        u0 <- _A *^ s + e;
        u1 <$ duni;
        e' <$ dshort_R;
        v0 <- (t `<*>` s) &+ e';
        v1 <$ duni_R;
        b' <@ A(Sim(O)).guess(if b then (u1, v1) else (u0, v0));
        return b';
     }
}.

module (DRight(A : SAdv_T, Sim : Simulator_t) : Distinguisher)  (O : POracle) = {
     proc run(b : bool) : bool = {
         var b';
         b' <@ DRightAux(A,Sim,O).run(false,b);
         return b';
     }
}.

module (DRightT(A : SAdv_T, Sim : Simulator_t) : Distinguisher)  (O : POracle) = {
     proc run(b : bool) : bool = {
         var b';
         b' <@ DRightAux(A,Sim,O).run(true,b);
         return b';
     }
}.


lemma MLWE_SMP_equiv_lel tr b &m (A <: SAdv_T {-ERO, -RO_H.Lazy.LRO,-B,-Bt, -BS}) 
                                 (Sim <: Simulator_t {-ERO, -RO_H.Lazy.LRO,-B,-Bt, -BS, -A}):
  Pr[  MLWE_RO(BS(A,Sim),RO_H.Lazy.LRO).main(tr,b) @ &m : res] =
  Pr[  MLWE_RO(BS(A,Sim),ERO).main(tr,b) @ &m : res].
case (tr = false).
+ move => ->.
  have left : forall &m0,
           Pr[  MLWE_RO(BS(A,Sim),RO_H.Lazy.LRO).main(false, b) @ &m0 : res] = 
           Pr[  Exp(RO_H.Lazy.LRO,DLeft(A,Sim)).main(b) @ &m0 : res].
  + move => &m0; byequiv => //; last by smt().  
    by proc; inline {2} 2;  inline {2} 3; sim; wp; conseq />;  sim.
  have right : forall &m1, Pr[  MLWE_RO(BS(A,Sim),ERO).main(false,b) @ &m1 : res] = 
                         Pr[  Exp(ERO,DLeft(A,Sim)).main(b) @ &m1 : res].
  + move => &m0; byequiv => //; last by smt().  
    by proc; inline {2} 2; inline {2} 3; sim; wp; conseq />;  sim.
  have le : 
     equiv [ Exp(RO_H.Lazy.LRO, DLeft(A,Sim)).main ~ Exp(ERO, DLeft(A,Sim)).main : 
       ={glob DLeft(A,Sim),arg} ==> ={res}] by apply (eq_eager_sampling (DLeft(A,Sim))  _); smt(duni_matrix_ll).
  have ? : forall &m0 &m1 ,
     (glob DLeft(A,Sim)){m0} = (glob DLeft(A,Sim)){m1} =>
       Pr[Exp(RO_H.Lazy.LRO, DLeft(A, Sim)).main(b) @ &m0 : res] =
       Pr[Exp(ERO, DLeft(A,Sim)).main(b) @ &m1 : res] 
   by move => &m0 &m1 eqB; byequiv (le); smt().
  by smt().
move => *; have -> : tr by smt().
have left : forall &m0,
         Pr[  MLWE_RO(BS(A,Sim),RO_H.Lazy.LRO).main(true, b) @ &m0 : res] = 
         Pr[  Exp(RO_H.Lazy.LRO,DLeftT(A,Sim)).main(b) @ &m0 : res].
+ move => &m0; byequiv => //; last by smt().  
  by proc; inline {2} 2;  inline {2} 3; sim; wp; conseq />;  sim.
have right : forall &m1, Pr[  MLWE_RO(BS(A,Sim),ERO).main(true,b) @ &m1 : res] = 
                         Pr[  Exp(ERO,DLeftT(A,Sim)).main(b) @ &m1 : res].
+ move => &m0; byequiv => //; last by smt().  
  by proc; inline {2} 2; inline {2} 3; sim; wp; conseq />;  sim.
have le : 
   equiv [ Exp(RO_H.Lazy.LRO, DLeftT(A,Sim)).main ~ Exp(ERO, DLeftT(A,Sim)).main : 
       ={glob DLeftT(A,Sim),arg} ==> ={res}] by apply (eq_eager_sampling (DLeftT(A,Sim))  _); smt(duni_matrix_ll).
have ? : forall &m0 &m1 ,
     (glob DLeft(A,Sim)){m0} = (glob DLeft(A,Sim)){m1} =>
       Pr[Exp(RO_H.Lazy.LRO, DLeftT(A,Sim)).main(b) @ &m0 : res] =
       Pr[Exp(ERO, DLeftT(A,Sim)).main(b) @ &m1 : res] 
 by move => &m0 &m1 eqB; byequiv (le); smt().
by smt().
qed.

lemma MLWE_SMP_equiv_ler tr b &m (A <: SAdv_T {-ERO,-RO_H.Lazy.LRO,-B,-Bt, -BS, -D})
                                 (Sim <: Simulator_t {-A,-ERO,-RO_H.Lazy.LRO,-B,-Bt, -BS, -D}):
  Pr[WIndfIdeal(D(A), Sim, O).main(tr, b) @ &m : res]=
  Pr[WIndfIdeal(D(A), Sim, ERO).main(tr, b) @ &m : res].
case (tr = false).
move => ->.
+ have left : forall &m0,  
          Pr[WIndfIdeal(D(A), Sim, O).main(false, b) @ &m0 : res] = 
          Pr[Exp(RO_H.Lazy.LRO,DRight(A,Sim)).main(b) @ &m0 : res].
  + move => &m0; byequiv => //=; last by smt().
    proc; inline {1} 3; inline {2} 2; inline {2} 3.
    rcondf{1} 8; 1: by move => *; call(_: true); auto => />.
    rcondf{2} 8; 1: by move => *; call(_: true); auto => />.
    by inline *;sim. 
  have right : forall &m1,
             Pr[ WIndfIdeal(D(A), Sim, ERO).main(false, b) @ &m1 : res] = 
             Pr[ Exp(ERO,DRight(A,Sim)).main(b) @ &m1 : res].
  + move => &m1; byequiv => //=; last by smt().
    proc; inline {1} 3; inline {2} 2; inline {2} 3.
    rcondf{1} 8; 1: by move => *; call(_: true); auto => />.
    rcondf{2} 8; 1: by move => *; call(_: true); auto => />.
    by inline *;sim. 
  have le : 
     equiv [ Exp(RO_H.Lazy.LRO, DRight(A,Sim)).main ~ Exp(ERO, DRight(A,Sim)).main : 
     ={glob DRight(A,Sim),arg} ==> ={res}] by apply (eq_eager_sampling (DRight(A,Sim)) _); smt(duni_matrix_ll).
  have ? : forall &m0 &m1 ,
     (glob DLeft(A,Sim)){m0} = (glob DLeft(A,Sim)){m1} =>
       Pr[Exp(RO_H.Lazy.LRO, DRight(A,Sim)).main(b) @ &m0 : res] =
       Pr[Exp(ERO, DRight(A,Sim)).main(b) @ &m1 : res] 
     by move => &m0 &m1 eqB; byequiv (le); smt().
  by smt().
move => *; have -> : tr by smt().
have left : forall &m0,  
      Pr[WIndfIdeal(D(A), Sim, O).main(true, b) @ &m0 : res] = 
      Pr[ Exp(RO_H.Lazy.LRO,DRightT(A,Sim)).main(b) @ &m0 : res].
  + move => &m0; byequiv => //=; last by smt().
    proc; inline {1} 3; inline {2} 2; inline {2} 3.
    rcondt{1} 8; 1: by move => *; call(_: true); auto => />.
    rcondt{2} 8; 1: by move => *; call(_: true); auto => />.
    by inline *;sim. 
  have right : forall &m1,
             Pr[ WIndfIdeal(D(A), Sim, ERO).main(true, b) @ &m1 : res] = 
             Pr[ Exp(ERO,DRightT(A,Sim)).main(b) @ &m1 : res].
  + move => &m1; byequiv => //=; last by smt().
    proc; inline {1} 3; inline {2} 2; inline {2} 3.
    rcondt{1} 8; 1: by move => *; call(_: true); auto => />.
    rcondt{2} 8; 1: by move => *; call(_: true); auto => />.
    by inline *;sim. 
  have le : 
     equiv [ Exp(RO_H.Lazy.LRO, DRightT(A,Sim)).main ~ Exp(ERO, DRightT(A,Sim)).main : 
     ={glob DRightT(A,Sim),arg} ==> ={res}] by apply (eq_eager_sampling (DRightT(A,Sim)) _); smt(duni_matrix_ll).
  have ? : forall &m0 &m1 ,
     (glob DLeftT(A,Sim)){m0} = (glob DLeftT(A,Sim)){m1} =>
       Pr[Exp(RO_H.Lazy.LRO, DRightT(A,Sim)).main(b) @ &m0 : res] =
       Pr[Exp(ERO, DRightT(A,Sim)).main(b) @ &m1 : res] 
     by move => &m0 &m1 eqB; byequiv (le); smt().
  by smt().
qed.

lemma MLWE_SMP_equiv _b &m  (S <: Sampler {-O, -OS, -D}) 
       (A <: SAdv_T {-ERO,-O, -OS, -B, -S, -D}) 
       (Sim <: Simulator_t {-ERO, -O, -OS,-B,-Bt, -BS, -A, -D}):
  Pr[ WIndfReal(D(A),S,OS).main(false,_b) @ &m : res] = 
     Pr[ WIndfIdeal(D(A),Sim,O).main(false,_b) @ &m : res] =>
  Pr[  MLWE(B(BS(A,Sim),O)).main(_b) @ &m : res] =
  Pr[  MLWE_SMP(A,S,OS).main(false,_b) @ &m : res].
proof.
move => HSIM.
rewrite -(MLWE_RO_equiv _b &m (BS(A,Sim))).
have -> : 
    Pr[MLWE_SMP(A, S, OS).main(false, _b) @ &m : res] = 
    Pr[ WIndfReal(D(A),S,OS).main(false,_b) @ &m : res] by
 byequiv => //; proc; inline {2} 3;  sim.
rewrite HSIM.
rewrite (MLWE_SMP_equiv_lel false _b &m A Sim).
rewrite (MLWE_SMP_equiv_ler false _b &m A Sim).
byequiv =>//;proc.  
inline {1} 13. inline {2} 3.
rcondf {2} 8; 1: by  move=> *; call(_: true); auto => />.
swap {1} [8..10] -3. swap{1} 12 -4. swap {1} 13 -10. swap {1} 14 -6. swap {1} 16 -4. 
swap {2} 5 -2. swap {2} [9..10] -5. swap{2} 12 -6. swap{2} 13 -6. swap {2} 15 -7. swap {2} 11 -4. 
swap {1} 1 9. swap {2} 1 10. 
seq 9 10 : (!tr{2} /\  ={tr,b,glob A,glob Sim,sd,sd0,t,s,e,u1,e',v1} /\ sd0{1} = sd{2} /\ t0{1} = t{2} /\ b0{2} = b{1} /\ tr0{2} = tr{1}); 
   1: by inline *; auto. 
wp; call (_: ={glob ERO,glob Sim}); 1: by sim.
wp;conseq (_: ={glob A, glob Sim, sd, sd0, t,b} /\  sd0{1} = sd{2} /\ t0{1} = t{2} /\ tr0{2} = tr{1} /\ b0{2} = b{1} 
          ==> ={glob A, glob Sim, ERO.m} /\ t{2} = t0{1} /\ _A{1} = _A{2}); 1,2: by smt(). 
by inline *; swap{1} 6 -2; sim; smt().
qed.

lemma MLWE_SMP_equiv_t _b &m  (S <: Sampler {-O, -OS, -D}) 
       (A <: SAdv_T {-ERO,-O, -OS, -B, -S, -D}) 
       (Sim <: Simulator_t {-ERO, -O, -OS,-B,-Bt, -BS, -A, -D}):
     Pr[ WIndfReal(D(A),S,OS).main(true,_b) @ &m : res] = 
     Pr[ WIndfIdeal(D(A),Sim,O).main(true,_b) @ &m : res] =>
  Pr[  MLWE(Bt(BS(A,Sim),O)).main(_b) @ &m : res] =
  Pr[  MLWE_SMP(A,S,OS).main(true,_b) @ &m : res].
proof.
move => HSIM.
rewrite -(MLWE_RO_equiv_t _b &m (BS(A,Sim))).
have -> : 
    Pr[MLWE_SMP(A, S, OS).main(true, _b) @ &m : res] = 
    Pr[ WIndfReal(D(A),S,OS).main(true,_b) @ &m : res] by
 byequiv => //; proc; inline {2} 3;  sim.
rewrite HSIM.
rewrite (MLWE_SMP_equiv_lel true _b &m A Sim).
rewrite (MLWE_SMP_equiv_ler true _b &m A Sim).
byequiv =>//;proc.  
inline {1} 13. inline {2} 3.
rcondt {2} 8; 1: by  move=> *; call(_: true); auto => />.
swap {1} [8..10] -3. swap{1} 12 -4. swap {1} 13 -10. swap {1} 14 -6. swap {1} 16 -4. 
swap {2} 5 -2. swap {2} [9..10] -5. swap{2} 12 -6. swap{2} 13 -6. swap {2} 15 -7. swap {2} 11 -4. 
swap {1} 1 9. swap {2} 1 10. 
seq 9 10 : (tr{2} /\  ={tr,b,glob A,glob Sim,sd,sd0,t,s,e,u1,e',v1} /\ sd0{1} = sd{2} /\ t0{1} = t{2} /\ b0{2} = b{1} /\ tr0{2} = tr{1}); 
   1: by inline *; auto. 
wp; call (_: ={glob ERO,glob Sim}); 1: by sim.
inline {2} 3.
wp;conseq (_: ={glob A, glob Sim, sd, sd0, t,b} /\  sd0{1} = sd{2} /\ t0{1} = t{2} /\ tr0{2} = tr{1} /\ b0{2} = b{1} 
          ==> ={glob A, glob Sim, ERO.m} /\ t{2} = t0{1} /\ _A{1} = _A0{2}); 1,2: by smt(). 
by inline *; swap{1} 6 -2; sim; smt().
qed.

end SMP_vs_ROM_IND.

(* FIXME: THESE HINTS MAKE RND IMPOSSIBLY SLOW *)
(* add duni_R_ll, duni_R_uni, duni_R_fu *)
(* FIXME: without adding the hint explicitely the hint are lost after cloning *)
(* hint solve 0 random : duni_R_ll duni_R_uni duni_R_fu. *)
(* hint solve 0 random : dshort_R_ll. *)
(* add dshort_R_ll *)
(* hint solve 0 random : duni_ll duni_fu duni_uni duni_funi. *)
(* hint solve 0 random : dshort_ll. *)
(* hint solve 0 random : duni_matrix_ll duni_matrix_fu duni_matrix_uni duni_matrix_funi. *)
