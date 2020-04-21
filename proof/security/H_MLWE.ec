require import AllCore Ring SmtMap Distr.
require (****) ROM Matrix.

(** NOTE: WHEN CLONING THIS THEORY ALL AXIOMS MUST BE PROVED *)

type seed.

clone import Matrix as M.

abbrev (+&) = ZR.(+).
op (-&) = ZR.(-).
op (`<*>`) a b = dotp a b axiomatized by dotpEE.

(* To remove *)
print ZR.

instance ring with R
  op rzero = ZR.zeror
  op rone  = ZR.oner
  op add   = ZR.( + )
  op opp   = ZR.([-])
  op mul   = ZR.( * )
  op expr  = ZR.exp
  op sub   = (-&)
  op ofint = ZR.ofint

  proof oner_neq0 by admit
  proof addr0     by admit
  proof addrA     by admit
  proof addrC     by admit
  proof addrN     by admit
  proof mulr1     by admit
  proof mulrA     by admit
  proof mulrC     by admit
  proof mulrDl    by admit
  proof expr0     by admit
  proof exprS     by admit
  proof subrE     by admit
  proof ofint0    by admit
  proof ofint1    by admit
  proof ofintS    by admit
  proof ofintN    by admit.

(*************)


hint simplify dotpEE.

op H : seed -> matrix.

abbrev m_transpose = trmx.

op dseed : seed distr.
op duni_R  : R distr.
op dshort_R  : R distr.

axiom dseed_ll : is_lossless dseed.
axiom dshort_R_ll : is_lossless dshort_R.
axiom duni_R_ll : is_lossless duni_R.

op pe : real.

axiom duni_R_fu: is_full duni_R.
axiom duni_RE: forall (s: R), mu1 duni_R s = pe.
lemma duni_R_uni: is_funiform duni_R.
proof. by move=> ??;rewrite !duni_RE. qed.

hint exact random : duni_R_fu duni_R_ll duni_R_uni.

op dshort = dvector dshort_R.
op duni = dvector duni_R.

lemma duni_ll : is_lossless duni by admit.
lemma dshort_ll : is_lossless dshort by admit.

op duni_matrix = dmatrix duni_R.

lemma duni_matrix_ll : is_lossless duni_matrix by admit.
lemma duni_matrix_fu: is_full duni_matrix by admit.

op pm : real.
axiom duni_matrixE: forall (m: matrix), mu1 duni_matrix m = pm.
lemma duni_matrix_uni: is_funiform duni_matrix.
proof. by move=> ??;rewrite !duni_matrixE. qed.

op dsample(sd : seed) = duni_matrix.

clone import ROM.Lazy as H_MLWE_ROM with
    type from <- seed,
    type to <- matrix,
    op   dsample <- dsample.

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

