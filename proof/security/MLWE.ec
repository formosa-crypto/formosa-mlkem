require import AllCore Ring SmtMap Distr.
require (****) ROM Matrix.

clone import Matrix as Matrix_.

(***************************************************)
(* FIXME: THIS SHOULD COME FROM MATRIX             *)

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
  proof addr0     by smt(@ZR)
  proof addrN     by smt(@ZR)
  proof mulr1     by smt(@ZR)
  proof mulrA     by apply ZR.mulrA
  proof mulrC     by apply ZR.mulrC
  proof mulrDl    by apply ZR.mulrDl
  proof expr0     by smt
  proof ofint0    by smt
  proof ofint1    by smt
  proof exprS     by admit
  proof ofintS    by admit
  proof ofintN    by admit.


(* --------------------------------------------------------------------------- *)
type seed.
op H : seed -> matrix.

(* --------------------------------------------------------------------------- *)
op [lossless] dseed : seed distr.
(* this automatically add the axiom dseed_ll : is_lossless dseed. *)
hint solve 0 random : dseed_ll.

(* --------------------------------------------------------------------------- *)
(* Uniform distribution over R *)
op [lossless uniform full] duni_R : R distr.
(* add duni_R_ll, duni_R_uni, duni_R_fu *)
(* FIXME: without adding the hint explicitely the hint are lost after cloning *)
hint solve 0 random : duni_R_ll duni_R_uni duni_R_fu.

lemma duni_R_funi : is_funiform duni_R.
proof. apply is_full_funiform; [apply duni_R_fu | apply duni_R_uni]. qed.

(* --------------------------------------------------------------------------- *)
(* Distribution over R (short values) *)

op [lossless] dshort_R  : R distr.
hint solve 0 random : dshort_R_ll.
(* add dshort_R_ll *)

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

hint solve 0 random : duni_ll duni_fu duni_uni duni_funi.

lemma dshort_ll : is_lossless dshort.
proof. apply/dvector_ll/dshort_R_ll. qed.

hint solve 0 random : dshort_ll.

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

hint solve 0 random : duni_matrix_ll duni_matrix_fu duni_matrix_uni duni_matrix_funi.

module type Adv_T = {
   proc guess(A : matrix, t : vector, uv : vector * R) : bool
}.

module type HAdv_T = {
   proc guess(sd : seed, t : vector, uv : vector * R) : bool
}.

abbrev [-printing] m_transpose = trmx.
abbrev (`<*>`) = dotp.
abbrev (+&) = ZR.(+).
abbrev (-&) = ZR.(-).

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
    v0 <- (t `<*>` s) +& e';
    v1 <$ duni_R;
    
    b' <@ Adv.guess(_A, t, if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

module H_MLWE(Adv : HAdv_T) = {

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
    v0 <- (t `<*>` s) +& e';
    v1 <$ duni_R;
    
    b' <@ Adv.guess(sd, t, if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

(****************************************************************************)
(* Clearly the MLWE assumption and the H_MLWE assumption are the same when 
 *  one gets the matrix from from a random oracle.                          *)
(****************************************************************************)

clone import ROM as RO with
  type in_t  <- seed,
  type out_t <- matrix,
  op dout    <- fun (sd : seed) => duni_matrix, 
  type d_in_t <- unit,
  type d_out_t <- bool.

import Lazy.

module type HAdv_RO_T(O : POracle) = {
  include HAdv_T
}.

module H_MLWE_RO(Adv : HAdv_RO_T, O : Oracle) = {

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
    v0 <- (t `<*>` s) +& e';
    v1 <$ duni_R;
    
    b' <@ Adv(O).guess(sd, t, if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

module B(A : HAdv_RO_T, O : Oracle) : Adv_T = {
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

module Bt(A : HAdv_RO_T, O : Oracle) : Adv_T = {
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

lemma H_MLWE_RO_equiv b &m (A <: HAdv_RO_T {-LRO,-B}):
  Pr[  H_MLWE_RO(A,LRO).main(false,b) @ &m : res ] =
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
+ rcondf{1} 2; first by auto => />; smt(@SmtMap).
  rcondf{2} 2; first by auto.
  by auto => /> /#.
+ rcondt{2} 2; first by auto.
  by auto => />;smt(@SmtMap).
by auto => />.
qed.

lemma H_MLWE_RO_equiv_t b &m (A <: HAdv_RO_T {-LRO,-Bt}):
  Pr[  H_MLWE_RO(A,LRO).main(true,b) @ &m : res ] =
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
  by auto => /> *;   smt(@SmtMap trmxK). 
wp;call(: (LRO.m{1}.[Bt._sd{2}] = Some Bt.__A{2}) /\ 
            forall x, x <> Bt._sd{2} => LRO.m{1}.[x] = LRO.m{2}.[x]).
proc;inline *.
case (sd{2} = Bt._sd{2}).
+ rcondf{1} 2; first by auto => />; smt(@SmtMap).
  rcondf{2} 2; first by auto.
  by auto => /> /#.
+ rcondt{2} 2; first by auto.
  by auto => />;smt(@SmtMap).
by auto => />;smt(trmxK).
qed.
