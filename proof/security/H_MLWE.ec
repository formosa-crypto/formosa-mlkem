require import AllCore Ring SmtMap Distr.
require (****) ROM KyberAlgebra.

clone include KyberAlgebra.
import Matrix_.
abbrev [-printing] m_transpose = trmx.

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

clone import ROM as H_MLWE_ROM with
  type in_t  <- seed,
  type out_t <- matrix,
  op dout    <- fun (sd : seed) => duni_matrix, 
  type d_in_t <- unit,
  type d_out_t <- bool.

import Lazy.

module type Adv_T = {
   proc guess(sd : seed, t : vector, uv : vector * R) : bool
}.

module H_MLWE(Adv : Adv_T) = {

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

