require import AllCore Ring SmtMap Distr.
require (****) ROM KyberAlgebra.

clone include  KyberAlgebra.
import Matrix_.

type seed.

op H : seed -> matrix.

abbrev m_transpose = trmx.

op dseed : seed distr.
op duni_R  : R distr.
op dshort_R  : R distr.

op pe : real.
op pv : real. 

axiom dseed_ll : is_lossless dseed.
axiom dshort_R_ll : is_lossless dshort_R.
axiom duni_R_ll : is_lossless duni_R.

axiom duni_R_fu: is_full duni_R.
axiom duni_RE: forall (s: R), mu1 duni_R s = pe.
lemma duni_R_uni: is_funiform duni_R.
proof. by move=> ??;rewrite !duni_RE. qed.

hint exact random : duni_R_fu duni_R_ll duni_R_uni.

op dshort = dvector dshort_R.
op duni = dvector duni_R.

lemma duni_ll : is_lossless duni by rewrite /duni /dvector; smt.
axiom duni_vectorE: forall (v: vector), mu1 duni v = pv.
lemma duni_vector_uni: is_funiform duni.
proof. by move=> ??;rewrite !duni_vectorE. qed.

lemma dshort_ll : is_lossless dshort by rewrite /dshort /dvector => />;smt.

op duni_matrix = dmatrix duni_R.

lemma duni_matrix_ll : is_lossless duni_matrix 
     by rewrite /duni_matrix /dmatrix => />; smt.

op pm : real.
axiom duni_matrixE: forall (m: matrix), mu1 duni_matrix m = pm.
lemma duni_matrix_uni: is_funiform duni_matrix.
proof. by move=> ??;rewrite !duni_matrixE. qed.

op dsample(sd : seed) = duni_matrix.

clone import ROM as H_MLWE_ROM with
  type in_t  <- seed,
  type out_t <- matrix,
  op dout    <- dsample,
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

