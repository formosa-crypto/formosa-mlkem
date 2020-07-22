require import AllCore Ring SmtMap Distr.
require (****) ROM Matrix.

(** NOTE: WHEN CLONING THIS THEORY ALL AXIOMS MUST BE PROVED *)

type seed.

clone import Matrix as M.

abbrev (+&) = ZR.(+).
op (-&) = ZR.(-).
op (`<*>`) a b = dotp a b axiomatized by dotpEE.

import ZR.
lemma exprS: forall (x : R) (n : int), 0 <= n => exp x (n + 1) = x * exp x n.
move => *; rewrite /exp => />. 
rewrite (_: n+1 < 0 = false) /= /iterop /=; first  by smt(). 
rewrite (_: n < 0 = false) /=; first by smt().
rewrite iteriS => />.
case (n = 0); last by smt.
move => />.
rewrite iteri0 => />. 
by rewrite mulrC mul1r.
qed.

lemma ofintS: forall (n : int), 0 <= n => ofint (n + 1) = oner +& (ofint n). 
move => *.
rewrite /ofint /intmul => />.
rewrite (_: n+1 < 0 = false) /= /iterop /=; first  by smt(). 
rewrite (_: n < 0 = false) /=; first by smt().
rewrite iteriS => />.
case (n = 0); last by smt.
move => />.
rewrite iteri0 => />. 
by rewrite addrC add0r.
qed.

lemma ofintN: forall (n : int), ofint (-n) = (- ofint n).
admitted.


instance ring with R
  op rzero = ZR.zeror
  op rone  = ZR.oner
  op add   = ZR.( + )
  op opp   = ZR.([-])
  op mul   = ZR.( * )
  op expr  = ZR.exp
  op sub   = (-&)
  op ofint = ZR.ofint

  proof oner_neq0 by apply ZR.oner_neq0
  proof addrA     by apply ZR.addrA
  proof addrC     by apply ZR.addrC
  proof addr0     by (move => *;rewrite ZR.addrC; apply ZR.add0r)
  proof addrN     by (move => *;rewrite ZR.addrC; apply ZR.addNr)
  proof mulr1     by (move => *;rewrite ZR.mulrC; apply ZR.mul1r)
  proof mulrA     by apply ZR.mulrA
  proof mulrC     by apply ZR.mulrC
  proof mulrDl    by apply ZR.mulrDl
  proof expr0     by smt
  proof subrE     by smt
  proof ofint0    by smt
  proof ofint1    by smt
  proof exprS     by apply exprS
  proof ofintS    by apply ofintS
  proof ofintN    by apply ofintN.
 
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

lemma duni_ll : is_lossless duni by rewrite /duni /dvector => />; smt.
op pv : real. (* Needs to be instantiated *)
axiom duni_vectorE: forall (v: vector), mu1 duni v = pv.
lemma duni_vector_uni: is_funiform duni.
proof. by move=> ??;rewrite !duni_vectorE. qed.

lemma dshort_ll : is_lossless dshort by rewrite /dshort /dvector => />;smt.

op duni_matrix = dmatrix duni_R.

lemma duni_matrix_ll : is_lossless duni_matrix by 
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
(*
clone import ROM.Lazy as H_MLWE_ROM with
    type from <- seed,
    type to <- matrix,
    op   dsample <- dsample. *)

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

