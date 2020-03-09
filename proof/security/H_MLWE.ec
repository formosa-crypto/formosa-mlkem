require import AllCore SmtMap Distr.

theory H_MLWE.

type seed.
type matrix.
type c_vector.
type r_vector.
type elem.

op H : seed -> matrix.

op m_transpose : matrix -> matrix.
op v_transpose : c_vector -> r_vector.

op ( +)  : elem -> elem -> elem.
op ( -)  : elem -> elem -> elem.
op ( *)  : r_vector -> c_vector -> elem.
op (`|+|`) : c_vector -> c_vector -> c_vector.
op (`|*|`) : matrix -> c_vector -> c_vector.

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

op p : real.
axiom duni_elem_fu: is_full duni_elem.
axiom duni_elemE: forall (s: elem), mu1 duni_elem s = p.
lemma duni_elem_uni: is_funiform duni_elem.
proof. by move=> ??;rewrite !duni_elemE. qed.

hint exact random : duni_elem_fu duni_elem_ll duni_elem_uni.

axiom add_cancel1 a b :
  a = a - b + b.

axiom add_cancel2 a b :
  a = a + b - b.

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
      u0 <- _A `|*|` s `|+|` e;
      u1 <$ duni;

      t <$ duni;
      e' <$ dshort_elem;
      v0 <- v_transpose t * s + e';
      v1 <$ duni_elem;
      
      b' <@ Adv.guess(sd, t, if b then (u1,v1) else (u0,v0));
      return b';
   }
}.

end H_MLWE.
