require import AllCore Ring SmtMap Distr PROM.
require (****) Matrix.

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

clone import FullRO as RO_H with
  type in_t    = seed,
  type out_t   = matrix,
  op   dout    = fun (sd : seed) => duni_matrix, 
  type d_in_t  = bool,
  type d_out_t = bool.

module type RO_t = {
  proc h(_: seed) : matrix
}.

module type ROAdv_T(O : RO_t) = {
   proc guess(sd : seed, t : vector, uv : vector * R) : bool
}.

module MLWE_RO(Adv : ROAdv_T,Hfu : RO_H.RO) = {

  module H = {
    proc init = Hfu.init
    proc h = Hfu.get
  }

  proc main(tr : bool, b : bool) : bool = {
    var sd, s, e, _A, u0, u1, t, e', v0, v1, b';
    
    H.init();
    sd <$ dseed;
    s <$ dshort;
    e <$ dshort;
    _A <@ H.h(sd);
    _A <- if tr then m_transpose _A else _A;
    u0 <- _A *^ s + e;
    u1 <$ duni;
    
    t <$ duni;
    e' <$ dshort_R;
    v0 <- (t `<*>` s) &+ e';
    v1 <$ duni_R;
    
    b' <@ Adv(H).guess(sd, t, if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

theory MLWE_vs_MLWE_ROM.

module B(A : ROAdv_T, H : RO_H.RO) : Adv_T = {
  var _sd : seed
  var __A : matrix

  module FakeRO  = {
      proc h(sd : seed) : matrix = {
           var _Ares;
           _Ares <- __A;
           if (sd <> _sd) {
              _Ares <@ H.get(sd);
           }
           return _Ares;
      }
  }
  
  proc guess(_A : matrix, t : vector, uv : vector * R) : bool = {
    var sd, b;
    sd <$ dseed;
    _sd <- sd;
    __A <- _A;
    H.init();
    b <@ A(FakeRO).guess(sd,t,uv);
    return b;
  }

}.

module Bt(A : ROAdv_T, H : RO_H.RO) : Adv_T = {
  var _sd : seed
  var __A : matrix

  module FakeRO  = {
      proc h(sd : seed) : matrix = {
           var _Ares;
           _Ares <- __A;
           if (sd <> _sd) {
              _Ares <@ H.get(sd);
           }
           return _Ares;
      }
  }
  
  proc guess(_A : matrix, t : vector, uv : vector * R) : bool = {
    var sd, b;
    sd <$ dseed;
    _sd <- sd;
    __A <- m_transpose _A;
    H.init();
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
seq 3 6 : (#pre /\ ={b,_A,sd} /\ (RO.m{1}.[B._sd{2}] = Some B.__A{2}) /\ 
          B.__A{2} = _A{2} /\ B._sd{2} = sd{2} /\ 
          (forall x, x <> B._sd{2} => RO.m{1}.[x] = RO.m{2}.[x]));
 first by inline *; auto => />; smt(@SmtMap).
wp;call(: (RO.m{1}.[B._sd{2}] = Some B.__A{2}) /\ 
            forall x, x <> B._sd{2} => RO.m{1}.[x] = RO.m{2}.[x]).
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
           RO.m{1}.[Bt._sd{2}] = Some Bt.__A{2} /\ 
           Bt.__A{2} = m_transpose _A{2} /\ Bt._sd{2} = sd{2} /\ 
           (forall x, x <> Bt._sd{2} => RO.m{1}.[x] = RO.m{2}.[x])).
+ inline *; wp; rnd (fun m => m_transpose m) (fun m => m_transpose m).
  by auto => />;   smt(@SmtMap trmxK duni_matrix_funi). 
wp;call(: (RO.m{1}.[Bt._sd{2}] = Some Bt.__A{2}) /\ 
            forall x, x <> Bt._sd{2} => RO.m{1}.[x] = RO.m{2}.[x]).
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

clone import FullRO as RO_SMP.

module type RO_t = {
  proc h(_: in_t) : out_t
}.


(* --------------------------------------------------------------------------- *)
module type Sampler(O : RO_SMP.RO) = {
    proc sampleA(sd : seed) : matrix
    proc sampleAT(sd : seed) : matrix
}.

module type PSampler = {
    proc sampleA(sd : seed) : matrix
    proc sampleAT(sd : seed) : matrix
}.


(* --------------------------------------------------------------------------- *)
module type SAdv_T(O : RO_t) = {
   proc interact(sd : seed, t : vector) : unit
   proc guess(uv : vector * R) : bool
}.

module MLWE_SMP(Adv : SAdv_T, S: Sampler, Hfu : RO_SMP.RO) = {

  module H = {
    proc init = Hfu.init
    proc h = Hfu.get
  }

  proc main(tr : bool, b : bool) : bool = {
    var sd, s, e, _A, u0, u1, t, e', v0, v1, b';
    
    H.init();

    sd <$ dseed;
    t <$ duni;
    Adv(H).interact(sd,t); (* Allow Adv to create some O state *)

    if (tr) { _A <@ S(Hfu).sampleAT(sd); }
    else    { _A <@ S(Hfu).sampleA(sd);  }

    s <$ dshort;
    e <$ dshort;
    u0 <- _A *^ s + e;
    u1 <$ duni;
    
    e' <$ dshort_R;
    v0 <- (t `<*>` s) &+ e';
    v1 <$ duni_R;
    
    b' <@ Adv(H).guess(if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

end MLWE_SMP.

(* We can go back to MLWE with a trivial sampler and the RO proof. *)
theory SMP_vs_ROM.

import MLWE_ROM.

clone import MLWE_SMP with
  theory RO_SMP <- RO_H.

import RO_H.

module (S : Sampler) (H : RO_H.RO) = {
  proc sampleA(sd : seed) : matrix = {
      var _A;
      _A <@ H.get(sd);
      return _A;
  }
  proc sampleAT(sd : seed) : matrix = {
      var _A;
      _A <@ H.get(sd);
      return trmx _A;
  }
}.

module (BS(Adv : SAdv_T, S : Sampler) : ROAdv_T) (O : RO_t) = {
   proc guess(sd : seed, t : vector,uv : vector * R) = {
       var b;
       Adv(O).interact(sd,t);
       b <@ Adv(O).guess(uv);
       return b;
   }
}.

import MLWE_vs_MLWE_ROM.

module MLWE_SMPs(Adv : SAdv_T, S: Sampler, Hfu : RO_H.RO) = {

  module H = {
    proc init = Hfu.init
    proc h = Hfu.get
  }

  proc main(tr : bool, b : bool) : bool = {
    var sd, s, e, _A, u0, u1, t, e', v0, v1, b';
    
    H.init();

    sd <$ dseed;
    t <$ duni;
    Hfu.sample(sd);
    Adv(H).interact(sd,t); (* Allow Adv to create some O state *)

    if (tr) { _A <@ S(Hfu).sampleAT(sd); }
    else    { _A <@ S(Hfu).sampleA(sd);  }

    s <$ dshort;
    e <$ dshort;
    u0 <- _A *^ s + e;
    u1 <$ duni;
    
    e' <$ dshort_R;
    v0 <- (t `<*>` s) &+ e';
    v1 <$ duni_R;
    
    b' <@ Adv(H).guess(if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

module MLWE_ROs(Adv : ROAdv_T,Hfu : RO_H.RO) = {

  module H = {
    proc init = Hfu.init
    proc h = Hfu.get
  }

  proc main(tr : bool, b : bool) : bool = {
    var sd, s, e, _A, u0, u1, t, e', v0, v1, b';
    
    H.init();
    sd <$ dseed;
    s <$ dshort;
    e <$ dshort;
    Hfu.sample(sd);
    _A <@ H.h(sd);
    _A <- if tr then m_transpose _A else _A;
    u0 <- _A *^ s + e;
    u1 <$ duni;
    
    t <$ duni;
    e' <$ dshort_R;
    v0 <- (t `<*>` s) &+ e';
    v1 <$ duni_R;
    
    b' <@ Adv(H).guess(sd, t, if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

module DLeftAux(A : SAdv_T)  (Hfu : RO) = {
      module H = {
        proc init = Hfu.init
        proc h = Hfu.get
     }

     proc run(tr : bool,b : bool) : bool = {
        var sd,t,_A,s,e,u0,u1,e',v0,v1,b';     
        sd <$ dseed;
        s <$ dshort;
        e <$ dshort;
        Hfu.sample(sd);
        _A <@ H.h(sd);
        _A <- if tr then trmx _A else _A;
        u0 <- _A *^ s + e;
        u1 <$ duni;
        t <$ duni;
        e' <$ dshort_R;
        v0 <- (t `<*>` s) &+ e';
        v1 <$ duni_R;
        b' <@ BS(A, S, H).guess(sd, t,if b then (u1, v1) else (u0, v0)); 
        return b';
     }
}.

module (DLeft(A : SAdv_T) : RO_Distinguisher)  (Hfu : RO) = {
     proc distinguish(b : bool) : bool = {
         var b';
         b' <@ DLeftAux(A,Hfu).run(false,b);
         return b';
     }
}.

module (DLeftT(A : SAdv_T) : RO_Distinguisher)  (Hfu : RO) = {
     proc distinguish(b : bool) : bool = {
         var b';
         b' <@ DLeftAux(A,Hfu).run(true,b);
         return b';
     }
}.

module DRightAux(A : SAdv_T)   (Hfu : RO) = {
     module H = {
        proc init = Hfu.init
        proc h = Hfu.get
     }

     proc run(tr : bool, b : bool) : bool = {
        var sd,t,_A,s,e,u0,u1,e',v0,v1,b';
        sd <$ dseed;
        t <$ duni;
        Hfu.sample(sd);
        A(H).interact(sd, t);
        if (tr) { _A <@ S(Hfu).sampleAT(sd); }
        else    { _A <@ S(Hfu).sampleA(sd);  }
        s <$ dshort;
        e <$ dshort;
        u0 <- _A *^ s + e;
        u1 <$ duni;
        e' <$ dshort_R;
        v0 <- (t `<*>` s) &+ e';
        v1 <$ duni_R;
        b' <@ A(H).guess(if b then (u1, v1) else (u0, v0));
        return b';
     }
}.

module (DRight(A : SAdv_T) : RO_Distinguisher)  (Hfu : RO) = {

     proc distinguish(b : bool) : bool = {
         var b';
         b' <@ DRightAux(A,Hfu).run(false,b);
         return b';
     }
}.

module (DRightT(A : SAdv_T) : RO_Distinguisher)  (Hfu : RO) = {
     proc distinguish(b : bool) : bool = {
         var b';
         b' <@ DRightAux(A,Hfu).run(true,b);
         return b';
     }
}.

import FullEager.

lemma MLWE_SMP_equiv_lel tr b &m (A <: SAdv_T {-RO, -LRO,-FRO,-B,-Bt, -BS}):
  Pr[  MLWE_ROs(BS(A,S),LRO).main(tr,b) @ &m : res] =
  Pr[  MLWE_ROs(BS(A,S),RO).main(tr,b) @ &m : res].
case (tr = false).
+ move => ->.
  have left : forall &m0,
           Pr[  MLWE_ROs(BS(A,S),LRO).main(false, b) @ &m0 : res] = 
           Pr[  MainD(DLeft(A),LRO).distinguish(b) @ &m0 : res].
  + move => &m0; byequiv => //.  
    by proc; inline {1} 5; inline {2} 2;  inline {2} 3; inline {2} 8;  sim; wp; conseq />;  sim.
  have right : forall &m1, Pr[  MLWE_ROs(BS(A,S),RO).main(false,b) @ &m1 : res] = 
                         Pr[  MainD(DLeft(A),RO).distinguish(b) @ &m1 : res].
  + move => &m0; byequiv => //.  
    by proc; inline {1} 5; inline {1} 6; inline {2} 2; inline {2} 3; inline {2} 8; inline {2} 9; sim; wp; conseq />;  sim.
  have le : 
     equiv [ MainD(DLeft(A),RO).distinguish ~ MainD(DLeft(A),LRO).distinguish : 
       ={glob DLeft(A),arg} ==> ={res,glob DLeft(A)}] by apply (RO_LRO (DLeft(A)) _); smt(duni_matrix_ll).
  have ? : forall &m0 &m1 ,
     (glob DLeft(A)){m0} = (glob DLeft(A)){m1} =>
       Pr[MainD(DLeft(A),RO).distinguish(b) @ &m0 : res] =
       Pr[MainD(DLeft(A), LRO).distinguish(b) @ &m1 : res] 
   by move => &m0 &m1 eqB; byequiv (le); smt().
  by smt().
move => *; have -> : tr by smt().
have left : forall &m0,
         Pr[  MLWE_ROs(BS(A,S),LRO).main(true, b) @ &m0 : res] = 
         Pr[  MainD(DLeftT(A),LRO).distinguish(b) @ &m0 : res].
+ move => &m0; byequiv => //.  
  by proc; inline {1} 5; inline {2} 2;  inline {2} 3; inline {2} 8; sim; wp; conseq />;  sim.
have right : forall &m1, Pr[  MLWE_ROs(BS(A,S),RO).main(true,b) @ &m1 : res] = 
                         Pr[  MainD(DLeftT(A),RO).distinguish(b) @ &m1 : res].
+ move => &m0; byequiv => //.  
  by proc; inline {2} 2; inline {2} 3; sim; wp; conseq />;  sim.
have le : 
   equiv [ MainD(DLeftT(A),RO).distinguish ~ MainD(DLeftT(A),LRO).distinguish : 
       ={glob DLeftT(A),arg} ==> ={res,glob DLeftT(A)}] by apply (RO_LRO (DLeftT(A)) _); smt(duni_matrix_ll).
have ? : forall &m0 &m1 ,
     (glob DLeft(A)){m0} = (glob DLeft(A)){m1} =>
       Pr[MainD(DLeftT(A),RO).distinguish(b) @ &m0 : res] =
       Pr[MainD(DLeftT(A),LRO).distinguish(b) @ &m1 : res] 
 by move => &m0 &m1 eqB; byequiv (le); smt().
by smt().
qed.

lemma MLWE_SMP_equiv_ler tr b &m (A <: SAdv_T {-RO,-LRO, -FRO,-B,-Bt, -BS}):
  Pr[  MLWE_SMPs(A,S,LRO).main(tr,b) @ &m : res]=
  Pr[  MLWE_SMPs(A,S,RO).main(tr,b) @ &m : res].
case (tr = false).
move => ->.
+ have left : forall &m0,  
          Pr[  MLWE_SMPs(A,S,LRO).main(false,b) @ &m0 : res] = 
          Pr[ MainD(DRight(A),LRO).distinguish(b) @ &m0 : res].
  + move => &m0; byequiv => //=.
    by proc; inline {2} 2; inline {2} 3;sim; inline *; auto => />.
  have right : forall &m1,
             Pr[ MLWE_SMPs(A,S,RO).main(false,b) @ &m1 : res] = 
             Pr[ MainD(DRight(A),RO).distinguish(b) @ &m1 : res].
  + move => &m1; byequiv => //=.
    by proc; inline {1} 4; inline {1} 5; inline {2} 2; inline {2} 3; inline {2} 7; inline{2} 8; sim; wp; conseq />; sim.
  have le : 
     equiv [ MainD(DRight(A),RO).distinguish ~ MainD(DRight(A), LRO).distinguish : 
     ={glob DRight(A),arg} ==> ={res,glob DRight(A)}] by apply (RO_LRO (DRight(A)) _); smt(duni_matrix_ll).
  have ? : forall &m0 &m1 ,
     (glob DLeft(A)){m0} = (glob DLeft(A)){m1} =>
       Pr[MainD(DRight(A),RO).distinguish(b) @ &m0 : res] =
       Pr[MainD(DRight(A),LRO).distinguish(b) @ &m1 : res] 
     by move => &m0 &m1 eqB; byequiv (le); smt().
  by smt().
move => *; have -> : tr by smt().
have left : forall &m0,  
          Pr[  MLWE_SMPs(A,S,LRO).main(true,b) @ &m0 : res] = 
          Pr[ MainD(DRightT(A),LRO).distinguish(b) @ &m0 : res].
+ move => &m0; byequiv => //=.
  by proc; inline {2} 2; inline {2} 3; sim; inline *; auto => />.
have right : forall &m1,
             Pr[  MLWE_SMPs(A,S,RO).main(true,b) @ &m1 : res] = 
             Pr[ MainD(DRightT(A),RO).distinguish(b) @ &m1 : res].
+ move => &m1; byequiv => //=.
  by proc; inline {2} 2; inline {2} 3; sim; wp; conseq />; sim.
have le : 
   equiv [ MainD(DRightT(A),RO).distinguish ~ MainD(DRightT(A),LRO).distinguish : 
     ={glob DRightT(A),arg} ==> ={res,glob DRightT(A)}] by apply (RO_LRO (DRightT(A))  _); smt(duni_matrix_ll).
have ? : forall &m0 &m1 ,
     (glob DLeft(A)){m0} = (glob DLeft(A)){m1} =>
       Pr[MainD(DRightT(A),RO).distinguish(b) @ &m0 : res] =
       Pr[MainD(DRightT(A),LRO).distinguish(b) @ &m1 : res] 
   by move => &m0 &m1 eqB; byequiv (le); smt().
by smt().
qed.

lemma MLWE_SMP_equiv b &m (A <: SAdv_T {-RO,-LRO,-FRO,-B,-Bt, -BS}):
  Pr[  MLWE(B(BS(A,S),LRO)).main(b) @ &m : res] =
  Pr[  MLWE_SMP(A,S,LRO).main(false,b) @ &m : res].
proof.
have -> : Pr[  MLWE_SMP(A,S,LRO).main(false,b) @ &m : res] = 
          Pr[  MLWE_SMPs(A,S,LRO).main(false,b) @ &m : res]
  by byequiv => //=;proc;inline *;sim.
rewrite -(MLWE_RO_equiv b &m (BS(A,S))).
have -> : Pr[MLWE_RO(BS(A, S), LRO).main(false, b) @ &m : res] = 
          Pr[MLWE_ROs(BS(A, S), LRO).main(false, b) @ &m : res]
  by byequiv => //=;proc;inline *;sim.
rewrite (MLWE_SMP_equiv_lel false b &m A).
rewrite (MLWE_SMP_equiv_ler false b &m A).
byequiv =>//;proc.
rcondf{2} 6; 1: by move => *; auto => />.  
inline {1} 14. inline {2} 6. 
swap {1} [9..11] -4. swap{1} 13 -5. swap {1} 14 -11. swap {1} 15 -7. swap {1} 17 -4. 
swap {2} [9..10] -6. swap{2} 12 -7. swap{2} 13 -6. swap {2} 15 -7. swap {2} 11 -8.
swap {1} 1 9. swap {2} 1 8.  
seq 9 8 : (!tr{2} /\  ={tr,b,glob A,sd,sd0,s,e,u1,t,e',v1} /\ sd0{1} = sd{2} /\ t0{1} = t{2}); 
   1: by inline *; auto.
wp; call (_: ={glob RO}); 1: by sim.
wp;conseq (_: ={glob A, sd, sd0} /\ sd0{1} = sd{2} /\ t0{1} = t{2} 
          ==> ={glob A, RO.m}   /\ _A{1} = _A0{2}); 1,2: by smt().
inline *.
seq 5 5 : (#pre /\ ={RO.m} /\ sd{1} \in RO.m{1}); 1:
  by auto => /> &2 r0 ?; rewrite mem_empty /= mem_set /=. 
seq 4 0 : (#pre /\ (_A = oget RO.m.[sd]){1}); 1:
  by auto => /> &1 &2; rewrite /dout duni_matrix_ll.
seq 1 1 : #pre; last by auto => /> &1 ?; rewrite /dout duni_matrix_ll.
exists* _A{1}, sd{1}; elim * => _A1 sd1.
call(: ={RO.m} /\ sd1 \in RO.m{1} /\ _A1 = oget RO.m{1}.[sd1]).
+ proc; auto => /> &2 rl ??; 1:smt(@SmtMap).
by auto => />.
qed.

lemma MLWE_SMP_equiv_t b &m (A <: SAdv_T {-RO,-LRO,-FRO,-B,-Bt, -BS}):
  Pr[  MLWE(Bt(BS(A,S),LRO)).main(b) @ &m : res] =
  Pr[  MLWE_SMP(A,S,LRO).main(true,b) @ &m : res].
proof.
have -> : Pr[  MLWE_SMP(A,S,LRO).main(true,b) @ &m : res] = 
          Pr[  MLWE_SMPs(A,S,LRO).main(true,b) @ &m : res]
  by byequiv => //=;proc;inline *;sim.
rewrite -(MLWE_RO_equiv_t b &m (BS(A,S))).
have -> : Pr[MLWE_RO(BS(A, S), LRO).main(true, b) @ &m : res] = 
          Pr[MLWE_ROs(BS(A, S), LRO).main(true, b) @ &m : res]
  by byequiv => //=;proc;inline *;sim.
rewrite (MLWE_SMP_equiv_lel true b &m A).
rewrite (MLWE_SMP_equiv_ler true b &m A).
byequiv =>//;proc.  
rcondt{2} 6; 1: by move => *; auto => />. 
inline {1} 14. inline {2} 6.
swap {1} [9..11] -4. swap{1} 13 -5. swap {1} 14 -11. swap {1} 15 -7. swap {1} 17 -4. 
swap {2} [9..10] -6. swap{2} 12 -7. swap{2} 13 -6. swap {2} 15 -7. swap {2} 11 -8.
swap {1} 1 9. swap {2} 1 8. 
seq 9 8 : (tr{2} /\  ={tr,b,glob A,sd,sd0,s,e,u1,t,e',v1} /\ sd0{1} = sd{2} /\ t0{1} = t{2}); 
   1: by inline *; auto.
wp; call (_: ={glob RO}); 1: by sim.
wp;conseq (_: ={glob A, sd, sd0} /\ sd0{1} = sd{2} /\ t0{1} = t{2} 
          ==> ={glob A, RO.m}   /\ _A{1} = _A0{2}); 1,2: by smt().
inline *.
seq 5 5 : (#pre /\ ={RO.m} /\ sd{1} \in RO.m{1}); 1:
  by auto => /> &2 r0 ?; rewrite mem_empty /= mem_set /=. 
seq 4 0 : (#pre /\ (_A = oget RO.m.[sd]){1}); 1:
  by auto => /> &1 &2; rewrite /dout duni_matrix_ll.
seq 1 1 : #pre; last by auto => /> &1 ?; rewrite /dout duni_matrix_ll.
exists* _A{1}, sd{1}; elim * => _A1 sd1.
call(: ={RO.m} /\ sd1 \in RO.m{1} /\ _A1 = oget RO.m{1}.[sd1]).
+ proc; auto => /> &2 rl ??; 1:smt(@SmtMap).
by auto => />.
qed.

end SMP_vs_ROM.

(* More interestingly, if one can prove a form of indifferentiability
   from the RO that samples matrices, we can go back to MLWE. *)
theory SMP_vs_ROM_IND.


module type Simulator_t(O : MLWE_ROM.RO_t) = {
   include MLWE_SMP.RO_t
}.

import MLWE_ROM.
import MLWE_SMP.

module type Distinguisher_t(S : PSampler, O : RO_t) = {
   proc distinguish(tr b : bool, sd : seed) : bool 
}.

module WIndfReal(D : Distinguisher_t, S : Sampler, Hfu : RO_SMP.RO) = {
  module H = {
    proc init = Hfu.init
    proc h = Hfu.get
  }

   proc main(tr b : bool) : bool = {
        var sd,b';
        H.init();
        sd <$ dseed;
        b' <@ D(S(Hfu),H).distinguish(tr, b ,sd);
        return b';
   }
}.

module WIndfIdeal(D : Distinguisher_t, Sim : Simulator_t, Hfu : RO_H.RO) = {

   module H = {
      proc init = Hfu.init
      proc h = Hfu.get
   }

   proc main(tr b : bool) : bool = {
        var sd,b';
        H.init();
        sd <$ dseed;
        b' <@ D(SMP_vs_ROM.S(Hfu),Sim(H)).distinguish(tr, b,sd);
        return b';
   }
}.

module (BS(Adv : SAdv_T, Sim : Simulator_t) : ROAdv_T) (H : MLWE_ROM.RO_t) = {
   proc guess(sd : seed, t : vector,uv : vector * R) = {
       var b;
       Adv(Sim(H)).interact(sd,t);
       b <@ Adv(Sim(H)).guess(uv);
       return b;
   }
}.

import MLWE_vs_MLWE_ROM.
(*
module O = RO_H.LRO.
module OS = RO_SMP.LRO.
*)
module (D(A : SAdv_T) : Distinguisher_t) (S : PSampler, H : RO_t) = {
  proc distinguish(tr b : bool, sd : seed) : bool = {
    var _A,t,s,e,u0,u1,e',v0,v1,b';        
    t <$ duni;
    A(H).interact(sd,t); 
    if (tr) { _A <@ S.sampleAT(sd); }
    else    { _A <@ S.sampleA(sd);  }
    s <$ dshort;                                             
    e <$ dshort;                                              
    u0 <- _A *^ s + e;            
    u1 <$ duni;                                               
    e' <$ dshort_R;                                          
    v0 <- (t `<*>` s) &+ e';                                    
    v1 <$ duni_R;                                    
    b' <@ A(H).guess(if b then (u1, v1) else (u0, v0));
    return b';
  }
}.


import RO_H.
import FullEager.

module DLeftAux(A : SAdv_T, Sim : Simulator_t)  (Hfu : RO) = {
  module H = {
    proc init = Hfu.init
    proc h = Hfu.get
  }

     proc run(tr : bool,b : bool) : bool = {
        var sd,t,_A,s,e,u0,u1,e',v0,v1,b';     
        sd <$ dseed;
        s <$ dshort;
        e <$ dshort;
        Hfu.sample(sd);
        _A <@ H.h(sd);
        _A <- if tr then trmx _A else _A;
        u0 <- _A *^ s + e;
        u1 <$ duni;
        t <$ duni;
        e' <$ dshort_R;
        v0 <- (t `<*>` s) &+ e';
        v1 <$ duni_R;
        b' <@ BS(A, Sim, H).guess(sd, t,if b then (u1, v1) else (u0, v0)); 
        return b';
     }
}.

module (DLeft(A : SAdv_T, Sim : Simulator_t) : RO_Distinguisher)  (Hfu : RO) = {
     proc distinguish(b : bool) : bool = {
         var b';
         b' <@ DLeftAux(A,Sim,Hfu).run(false,b);
         return b';
     }
}.

module (DLeftT(A : SAdv_T, Sim : Simulator_t) : RO_Distinguisher)  (Hfu : RO) = {
     proc distinguish(b : bool) : bool = {
         var b';
         b' <@ DLeftAux(A,Sim,Hfu).run(true,b);
         return b';
     }
}.

module DRightAux(A : SAdv_T, Sim : Simulator_t)   (Hfu : RO) = {
  module H = {
    proc init = Hfu.init
    proc h = Hfu.get
  }

     proc run(tr : bool, b : bool) : bool = {
        var sd,t,_A,s,e,u0,u1,e',v0,v1,b';
        sd <$ dseed;
        t <$ duni;
        Hfu.sample(sd);
        A(Sim(H)).interact(sd, t);
        if (tr) { _A <@ H.h(sd);  _A <- trmx _A; } 
        else {  _A <@ H.h(sd); }
        s <$ dshort;
        e <$ dshort;
        u0 <- _A *^ s + e;
        u1 <$ duni;
        e' <$ dshort_R;
        v0 <- (t `<*>` s) &+ e';
        v1 <$ duni_R;
        b' <@ A(Sim(H)).guess(if b then (u1, v1) else (u0, v0));
        return b';
     }
}.

module (DRight(A : SAdv_T, Sim : Simulator_t) : RO_Distinguisher)  (Hfu : RO) = {
     proc distinguish(b : bool) : bool = {
         var b';
         b' <@ DRightAux(A,Sim,Hfu).run(false,b);
         return b';
     }
}.

module (DRightT(A : SAdv_T, Sim : Simulator_t) : RO_Distinguisher)  (Hfu : RO) = {
     proc distinguish(b : bool) : bool = {
         var b';
         b' <@ DRightAux(A,Sim,Hfu).run(true,b);
         return b';
     }
}.

module MLWE_ROs(Adv : ROAdv_T,Hfu : RO) = {

  module H = {
    proc init = Hfu.init
    proc h = Hfu.get
  }

  proc main(tr : bool, b : bool) : bool = {
    var sd, s, e, _A, u0, u1, t, e', v0, v1, b';
    
    H.init();
    sd <$ dseed;
    s <$ dshort;
    e <$ dshort;
    Hfu.sample(sd);
    _A <@ H.h(sd);
    _A <- if tr then m_transpose _A else _A;
    u0 <- _A *^ s + e;
    u1 <$ duni;
    
    t <$ duni;
    e' <$ dshort_R;
    v0 <- (t `<*>` s) &+ e';
    v1 <$ duni_R;
    b' <@ Adv(H).guess(sd, t,if b then (u1, v1) else (u0, v0)); 
    return b';
   }

}.

module WIndfIdeals(D : Distinguisher_t, Sim : Simulator_t, Hfu : RO_H.RO) = {

   module H = {
      proc init = Hfu.init
      proc h = Hfu.get
   }

   proc main(tr b : bool) : bool = {
        var sd,b';
        H.init();
        sd <$ dseed;
        Hfu.sample(sd);
        b' <@ D(SMP_vs_ROM.S(Hfu),Sim(H)).distinguish(tr, b,sd);
        return b';
   }
}.


lemma MLWE_SMP_equiv_lel tr b &m (A <: SAdv_T {-RO, -LRO, -FRO, -B,-Bt, -BS}) 
                                 (Sim <: Simulator_t {-FRO, -LRO, -FRO,-B,-Bt, -BS, -A}):
  Pr[  MLWE_ROs(BS(A,Sim),LRO).main(tr,b) @ &m : res] =
  Pr[  MLWE_ROs(BS(A,Sim),RO).main(tr,b) @ &m : res].
case (tr = false).
+ move => ->.
  have left : forall &m0,
           Pr[  MLWE_ROs(BS(A,Sim),LRO).main(false, b) @ &m0 : res] = 
           Pr[  MainD(DLeft(A,Sim),LRO).distinguish(b) @ &m0 : res].
  + move => &m0; byequiv => //.  
    by proc; inline {2} 2;  inline {2} 3; inline{2} 8; inline {1} 5;  sim; wp; conseq />;  sim.
  have right : forall &m1, Pr[  MLWE_ROs(BS(A,Sim),RO).main(false,b) @ &m1 : res] = 
                         Pr[  MainD(DLeft(A,Sim),RO).distinguish(b) @ &m1 : res].
  + move => &m0; byequiv => //.  
    by proc; inline {1} 5; inline {2} 2; inline {2} 3; inline {2} 8; sim; wp; conseq />;sim.
  have le : 
     equiv [ MainD(DLeft(A,Sim),RO).distinguish ~ MainD(DLeft(A,Sim),LRO).distinguish : 
       ={glob DLeft(A,Sim),arg} ==> ={res,glob DLeft(A,Sim)}] by apply (RO_LRO (DLeft(A,Sim))  _); smt(duni_matrix_ll).
  have ? : forall &m0 &m1 ,
     (glob DLeft(A,Sim)){m0} = (glob DLeft(A,Sim)){m1} =>
       Pr[MainD(DLeft(A, Sim),RO).distinguish(b) @ &m0 : res] =
       Pr[MainD(DLeft(A,Sim),LRO).distinguish(b) @ &m1 : res] 
   by move => &m0 &m1 eqB; byequiv (le); smt().
  by smt().
move => *; have -> : tr by smt().
have left : forall &m0,
         Pr[  MLWE_ROs(BS(A,Sim),LRO).main(true, b) @ &m0 : res] = 
         Pr[  MainD(DLeftT(A,Sim),LRO).distinguish(b) @ &m0 : res].
+ move => &m0; byequiv => //.  
  by proc; inline {2} 2;  inline {2} 3; sim; wp; conseq />;  sim.
have right : forall &m1, Pr[  MLWE_ROs(BS(A,Sim),RO).main(true,b) @ &m1 : res] = 
                         Pr[  MainD(DLeftT(A,Sim),RO).distinguish(b) @ &m1 : res].
+ move => &m0; byequiv => //.  
  by proc; inline {1} 5; inline {2} 2; inline {2} 3; inline {2} 8; sim; wp; conseq />;sim.
have le : 
   equiv [ MainD(DLeftT(A,Sim),RO).distinguish ~ MainD(DLeftT(A,Sim),LRO).distinguish : 
       ={glob DLeftT(A,Sim),arg} ==> ={res,glob DLeftT(A,Sim)}] by apply (RO_LRO (DLeftT(A,Sim))  _); smt(duni_matrix_ll).
have ? : forall &m0 &m1 ,
     (glob DLeft(A,Sim)){m0} = (glob DLeft(A,Sim)){m1} =>
       Pr[MainD(DLeftT(A,Sim),RO).distinguish(b) @ &m0 : res] =
       Pr[MainD(DLeftT(A,Sim),LRO).distinguish(b) @ &m1 : res] 
 by move => &m0 &m1 eqB; byequiv (le); smt().
by smt().
qed.

lemma MLWE_SMP_equiv_ler tr b &m (A <: SAdv_T {-RO,-LRO,-FRO,-B,-Bt, -BS, -D})
                                 (Sim <: Simulator_t {-A,-RO,-LRO,-FRO,-B,-Bt, -BS, -D}):
  Pr[WIndfIdeals(D(A), Sim, LRO).main(tr, b) @ &m : res]=
  Pr[WIndfIdeals(D(A), Sim, RO).main(tr, b) @ &m : res].
case (tr = false).
move => ->.
+ have left : forall &m0,  
          Pr[WIndfIdeals(D(A), Sim, LRO).main(false, b) @ &m0 : res] = 
          Pr[MainD(DRight(A,Sim),LRO).distinguish(b) @ &m0 : res].
  + move => &m0; byequiv => //=.
    proc; inline {1} 3; inline {1} 4; inline {2} 2; inline {2} 3.
    rcondf{1} 9; 1: by move => *; call(_: true); auto => />.
    rcondf{2} 9; 1: by  move => *; inline *; call(_: true); auto => />.
    by inline *;sim. 
  have right : forall &m1,
             Pr[ WIndfIdeals(D(A), Sim, RO).main(false, b) @ &m1 : res] = 
             Pr[ MainD(DRight(A,Sim),RO).distinguish(b) @ &m1 : res].
  + move => &m1; byequiv => //=.
    proc; inline {1} 4; inline {2} 2; inline {2} 3.
    rcondf{1} 9; 1: by move => *; call(_: true); auto => />.
    rcondf{2} 9; 1: by move => *; inline *; call(_: true); auto => />.
    by inline *; swap {1} 10 -5; sim. 
    
  have le : 
     equiv [ MainD(DRight(A,Sim),RO).distinguish ~ MainD(DRight(A,Sim),LRO).distinguish : 
     ={glob DRight(A,Sim),arg} ==> ={res,glob DRight(A,Sim)}] by apply (RO_LRO (DRight(A,Sim)) _); smt(duni_matrix_ll).
  have ? : forall &m0 &m1 ,
     (glob DLeft(A,Sim)){m0} = (glob DLeft(A,Sim)){m1} =>
       Pr[MainD(DRight(A,Sim),RO).distinguish(b) @ &m0 : res] =
       Pr[MainD(DRight(A,Sim),LRO).distinguish(b) @ &m1 : res] 
     by move => &m0 &m1 eqB; byequiv (le); smt().
  by smt().
move => *; have -> : tr by smt().
have left : forall &m0,  
      Pr[WIndfIdeals(D(A), Sim, LRO).main(true, b) @ &m0 : res] = 
      Pr[ MainD(DRightT(A,Sim),LRO).distinguish(b) @ &m0 : res].
  + move => &m0; byequiv => //=.
    proc; inline {1} 3; inline {1} 4; inline {2} 2; inline {2} 3.
    rcondt{1} 9; 1: by move => *; call(_: true); auto => />.
    rcondt{2} 9; 1: by move => *; inline *;call(_: true); auto => />.
    by inline *;sim. 
  have right : forall &m1,
             Pr[ WIndfIdeals(D(A), Sim, RO).main(true, b) @ &m1 : res] = 
             Pr[ MainD(DRightT(A,Sim),RO).distinguish(b) @ &m1 : res].
  + move => &m1; byequiv => //=.
    proc; inline {1} 4; inline {2} 2; inline {2} 3.
    rcondt{1} 9; 1: by move => *; call(_: true); auto => />.
    rcondt{2} 9; 1: by move => *; inline *; call(_: true); auto => />.
    by inline *; swap {1} 10 -5; sim. 
  have le : 
     equiv [ MainD(DRightT(A,Sim),RO).distinguish ~ MainD(DRightT(A,Sim),LRO).distinguish : 
     ={glob DRightT(A,Sim),arg} ==> ={res,glob DRightT(A,Sim)}] by apply (RO_LRO (DRightT(A,Sim)) _); smt(duni_matrix_ll).
  have ? : forall &m0 &m1 ,
     (glob DLeftT(A,Sim)){m0} = (glob DLeftT(A,Sim)){m1} =>
       Pr[MainD(DRightT(A,Sim),RO).distinguish(b) @ &m0 : res] =
       Pr[MainD(DRightT(A,Sim),LRO).distinguish(b) @ &m1 : res] 
     by move => &m0 &m1 eqB; byequiv (le); smt().
  by smt().
qed.

lemma MLWE_SMP_equiv _b &m  (S <: Sampler {-LRO, -RO, -FRO, -RO_SMP.LRO, -D}) 
       (A <: SAdv_T {-RO,-LRO, -FRO, -RO_SMP.LRO, -B, -S, -D}) 
       (Sim <: Simulator_t {-RO, -LRO, -FRO,-B,-Bt, -BS, -A, -D}):
  Pr[ WIndfReal(D(A),S,RO_SMP.LRO).main(false,_b) @ &m : res] = 
     Pr[ WIndfIdeal(D(A),Sim,LRO).main(false,_b) @ &m : res] =>
  Pr[  MLWE(B(BS(A,Sim),LRO)).main(_b) @ &m : res] =
  Pr[  MLWE_SMP(A,S,RO_SMP.LRO).main(false,_b) @ &m : res].
proof.
move => HSIM.
rewrite -(MLWE_RO_equiv _b &m (BS(A,Sim))).
have -> : 
    Pr[MLWE_SMP(A, S, RO_SMP.LRO).main(false, _b) @ &m : res] = 
    Pr[ WIndfReal(D(A),S,RO_SMP.LRO).main(false,_b) @ &m : res] 
 by byequiv => //; proc; inline {2} 3;sim.
rewrite HSIM.
have -> : Pr[MLWE_RO(BS(A, Sim), LRO).main(false, _b) @ &m : res] = 
          Pr[MLWE_ROs(BS(A, Sim), LRO).main(false, _b) @ &m : res] by
   byequiv => //; proc; inline *; sim.
have -> : Pr[WIndfIdeal(D(A), Sim, LRO).main(false, _b) @ &m : res] = 
          Pr[WIndfIdeals(D(A), Sim, LRO).main(false, _b) @ &m : res] by
   byequiv => //; proc; inline *; sim.
rewrite (MLWE_SMP_equiv_lel false _b &m A Sim).
rewrite (MLWE_SMP_equiv_ler false _b &m A Sim).
byequiv =>//;proc.  
inline {1} 14. inline {2} 4.
rcondf {2} 9; 1: by  move=> *; call(_: true); auto => />.
swap {1} [9..11] -4. swap{1} 13 -5. swap {1} 14 -11. swap {1} 15 -7. swap {1} 17 -4. 
swap {2} 6 -3. swap {2} [10..11] -6. swap{2} 13 -7. swap{2} 14 -7. swap {2} 16 -8. swap {2} 12 -5. 
swap {1} 1 9. swap {2} 1 8. swap {2} [11..12] -2.
seq 9 10 : (!tr{2} /\  ={tr,b,glob A,glob Sim,sd,sd0,t,s,e,u1,e',v1} /\ sd0{1} = sd{2} /\ t0{1} = t{2} /\ b0{2} = b{1} /\ tr0{2} = tr{1}); 
  1: by inline *; auto. 
wp; call (_: ={glob RO,glob Sim}); 1: by sim.
wp;conseq (_: ={glob A, glob Sim, sd, sd0, t,b} /\  sd0{1} = sd{2} /\ t0{1} = t{2} /\ tr0{2} = tr{1} /\ b0{2} = b{1} 
          ==> ={glob A, glob Sim, RO.m} /\ t{2} = t0{1} /\ _A{1} = _A{2}); 1,2: by smt(). 

inline *.
seq 5 5 : (#pre /\ ={RO.m} /\ sd{1} \in RO.m{1}); 1:
  by auto => /> &2 r0 ?; rewrite mem_empty /= mem_set /=. 
seq 4 0 : (#pre /\ (_A = oget RO.m.[sd]){1}); 1:
  by auto => /> &1 &2; rewrite /dout duni_matrix_ll.
seq 1 1 : #pre; last by auto => /> &1 ?; rewrite /dout duni_matrix_ll.
exists* _A{1}, sd{1}; elim * => _A1 sd1.
call(: ={RO.m, glob Sim} /\ sd1 \in RO.m{1} /\ _A1 = oget RO.m{1}.[sd1]); last by auto => />.
admit. (* WTF? *)
qed.

lemma MLWE_SMP_equiv_t _b &m  (S <: Sampler {-LRO, -RO, -FRO, -RO_SMP.LRO, -D}) 
       (A <: SAdv_T {-RO,-LRO, -FRO, -RO_SMP.LRO, -B, -S, -D}) 
       (Sim <: Simulator_t  {-RO, -LRO, -FRO,-B,-Bt, -BS, -A, -D}):
     Pr[ WIndfReal(D(A),S,RO_SMP.LRO).main(true,_b) @ &m : res] = 
     Pr[ WIndfIdeal(D(A),Sim,LRO).main(true,_b) @ &m : res] =>
  Pr[  MLWE(Bt(BS(A,Sim),LRO)).main(_b) @ &m : res] =
  Pr[  MLWE_SMP(A,S,RO_SMP.LRO).main(true,_b) @ &m : res].
proof.
move => HSIM.
rewrite -(MLWE_RO_equiv_t _b &m (BS(A,Sim))).
have -> : 
    Pr[MLWE_SMP(A, S, RO_SMP.LRO).main(true, _b) @ &m : res] = 
    Pr[ WIndfReal(D(A),S,RO_SMP.LRO).main(true,_b) @ &m : res] by
 byequiv => //; proc; inline {2} 3;  sim.
rewrite HSIM.
have -> : Pr[MLWE_RO(BS(A, Sim), LRO).main(true, _b) @ &m : res] = 
          Pr[MLWE_ROs(BS(A, Sim), LRO).main(true, _b) @ &m : res] by
   byequiv => //; proc; inline *; sim.
have -> : Pr[WIndfIdeal(D(A), Sim, LRO).main(true, _b) @ &m : res] = 
          Pr[WIndfIdeals(D(A), Sim, LRO).main(true, _b) @ &m : res] by
   byequiv => //; proc; inline *; sim.
rewrite (MLWE_SMP_equiv_lel true _b &m A Sim).
rewrite (MLWE_SMP_equiv_ler true _b &m A Sim).
byequiv =>//;proc.  
inline {1} 14. inline {2} 4.
rcondt {2} 9; 1: by  move=> *; call(_: true); auto => />.
swap {1} [9..11] -4. swap{1} 13 -5. swap {1} 14 -11. swap {1} 15 -7. swap {1} 17 -4. 
swap {2} 6 -3. swap {2} [10..11] -6. swap{2} 13 -7. swap{2} 14 -7. swap {2} 16 -8. swap {2} 12 -5. 
swap {1} 1 9. swap {2} 1 8. swap {2} [11..12] -2.
seq 9 10 : (tr{2} /\  ={tr,b,glob A,glob Sim,sd,sd0,t,s,e,u1,e',v1} /\ sd0{1} = sd{2} /\ t0{1} = t{2} /\ b0{2} = b{1} /\ tr0{2} = tr{1}); 
  1: by inline *; auto. 
wp; call (_: ={glob RO,glob Sim}); 1: by sim.
inline {2} 4.
wp;conseq (_: ={glob A, glob Sim, sd, sd0, t,b} /\  sd0{1} = sd{2} /\ t0{1} = t{2} /\ tr0{2} = tr{1} /\ b0{2} = b{1} 
          ==> ={glob A, glob Sim, RO.m} /\ t{2} = t0{1} /\ _A{1} = _A0{2}); 1,2: by smt(). 

inline *.
seq 5 5 : (#pre /\ ={RO.m} /\ sd{1} \in RO.m{1}); 1:
  by auto => /> &2 r0 ?; rewrite mem_empty /= mem_set /=. 
seq 4 0 : (#pre /\ (_A = oget RO.m.[sd]){1}); 1:
  by auto => /> &1 &2; rewrite /dout duni_matrix_ll.
seq 1 1 : #pre; last by auto => /> &1 ?; rewrite /dout duni_matrix_ll.
exists* _A{1}, sd{1}; elim * => _A1 sd1.
call(: ={RO.m, glob Sim} /\ sd1 \in RO.m{1} /\ _A1 = oget RO.m{1}.[sd1]); last by auto => />.
admit. (* WTF? *)
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
