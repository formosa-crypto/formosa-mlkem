require import AllCore Ring SmtMap Distr.
require (****) ROM Matrix.

theory MLWE.

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

(* add duni_R_ll, duni_R_uni, duni_R_fu *)
(* FIXME: without adding the hint explicitely the hint are lost after cloning *)
(* hint solve 0 random : duni_R_ll duni_R_uni duni_R_fu. *)
(* hint solve 0 random : dshort_R_ll. *)
(* add dshort_R_ll *)
(* hint solve 0 random : duni_ll duni_fu duni_uni duni_funi. *)
(* hint solve 0 random : dshort_ll. *)
(* hint solve 0 random : duni_matrix_ll duni_matrix_fu duni_matrix_uni duni_matrix_funi. *)

end MLWE.

theory MLWE_H.

clone include MLWE.

import Matrix_.

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

end MLWE_H.

(****************************************************************************)
(* Clearly the MLWE assumption and the H_MLWE assumption are the same when 
 *  one gets the matrix from from a random oracle.                          *)
(****************************************************************************)

theory MLWE_ROM.


end MLWE_ROM.

theory MLWE_SMP.

clone include MLWE.
import Matrix_.

clone import ROM as RO.

import Lazy.

(* --------------------------------------------------------------------------- *)
type seed.

(* --------------------------------------------------------------------------- *)
op [lossless] dseed : seed distr.


(* --------------------------------------------------------------------------- *)
module type Sampler(O : POracle) = {
    proc sample(sd : seed) : matrix
}.

module type PSampler = {
    proc sample(sd : seed) : matrix
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
    Adv(O).interact(sd,t); (* Allow Adv to run the sampler *)
    _A <@ S(O).sample(sd);

    s <$ dshort;
    e <$ dshort;
    u0 <- (if tr then m_transpose _A else _A) *^ s + e;
    u1 <$ duni;
    
    e' <$ dshort_R;
    v0 <- (t `<*>` s) &+ e';
    v1 <$ duni_R;
    
    b' <@ Adv(O).guess(if b then (u1,v1) else (u0,v0));
    return b';
   }

}.

end MLWE_SMP.
