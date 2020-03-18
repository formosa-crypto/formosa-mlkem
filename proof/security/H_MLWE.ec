require import AllCore Ring SmtMap Distr.
require (****) ROM.

(** NOTE: WHEN CLONING THIS THEORY ALL AXIOMS MUST BE PROVED *)

type seed.
type matrix.
type c_vector.
type r_vector.
type elem.

clone import IDomain as Elem with type t <- elem.

instance ring with elem
  op rzero = Elem.zeror
  op rone  = Elem.oner
  op add   = Elem.( + )
  op mul   = Elem.( * )
  op opp   = Elem.([-])

  proof oner_neq0 by apply/Elem.oner_neq0
  proof addr0     by apply/Elem.addr0
  proof addrA     by apply/Elem.addrA
  proof addrC     by apply/Elem.addrC
  proof addrN     by apply/Elem.addrN
  proof mulr1     by apply/Elem.mulr1
  proof mulrA     by apply/Elem.mulrA
  proof mulrC     by apply/Elem.mulrC
  proof mulrDl    by apply/Elem.mulrDl.

op H : seed -> matrix.

op m_transpose : matrix -> matrix.
op v_transpose : c_vector -> r_vector.

op (`|*|`)  : r_vector -> c_vector -> elem.
op (`|+|`) : c_vector -> c_vector -> c_vector.
op (`*|`) : matrix -> c_vector -> c_vector.
op (`|*`) : r_vector -> matrix -> r_vector.

op dseed : seed distr.
op dshort : c_vector distr.
op duni   : c_vector distr.
op duni_elem  : elem distr.
op dshort_elem  : elem distr.

axiom dseed_ll : is_lossless dseed.
axiom duni_ll : is_lossless duni.
axiom dshort_ll : is_lossless dshort.
axiom dshort_elem_ll : is_lossless dshort_elem.
axiom duni_elem_ll : is_lossless duni_elem.

op pe : real.
axiom duni_elem_fu: is_full duni_elem.
axiom duni_elemE: forall (s: elem), mu1 duni_elem s = pe.
lemma duni_elem_uni: is_funiform duni_elem.
proof. by move=> ??;rewrite !duni_elemE. qed.

hint exact random : duni_elem_fu duni_elem_ll duni_elem_uni.

module type Adv_T = {
   proc guess(sd : seed, t : c_vector, uv : c_vector * elem) : bool
}.

module H_MLWE(Adv : Adv_T) = {

   proc main(tr b : bool) : bool = {
      var sd, s, e, _A, u0, u1, t, e', v0, v1, b';

      sd <$ dseed;
      s <$ dshort;
      e <$ dshort;
      _A <- if tr then m_transpose (H sd) else H sd;
      u0 <- _A `*|` s `|+|` e;
      u1 <$ duni;

      t <$ duni;
      e' <$ dshort_elem;
      v0 <- v_transpose t `|*|` s + e';
      v1 <$ duni_elem;
      
      b' <@ Adv.guess(sd, t, if b then (u1,v1) else (u0,v0));
      return b';
   }
}.

(* We'll need these definitions to model H as a ROM *)

op duni_matrix : matrix distr.

axiom duni_matrix_ll : is_lossless duni_matrix. 
op pm : real.
axiom duni_matrix_fu: is_full duni_matrix.
axiom duni_matrixE: forall (m: matrix), mu1 duni_matrix m = pm.
lemma duni_matrix_uni: is_funiform duni_matrix.
proof. by move=> ??;rewrite !duni_matrixE. qed.

op dsample(sd : seed) = duni_matrix.

clone import ROM.Lazy as H_MLWE_ROM with
    type from <- seed,
    type to <- matrix,
    op   dsample <- dsample.
