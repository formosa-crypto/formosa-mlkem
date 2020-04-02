require import Core Int IntDiv IntExtra Ring StdOrder.
import Ring.IntID IntOrder.

op k : { int | 2 < k } as gt2_k.

op R = 2^k.

op q: int.
axiom q_bnd: 0 < q /\ q < R %/2.
axiom q_odd1: 2 %| (q + 1).
axiom q_odd2: 2 %| (q - 1).

(*I also had to add that a must be smaller than 2 ^ kk.*)
lemma barrett_overZ a kk:
      0 <= a =>
      a <= 2 ^ kk =>
      1 < kk =>
      q < 2^kk =>
      2^kk %/ q * q < 2^kk =>
      0 <= a - a*(2^kk %/ q) %/ 2^kk * q < 2*q.
proof.
move => ineq0a ineqap ineqkk ineqq ineq.
split.
rewrite subr_ge0.
rewrite - (ler_pmul2r (2 ^ kk)).
by apply (powPos 2 kk).
rewrite mulrAC.
apply (ler_trans (a * (2 ^ kk %/ q) * q)).
apply ler_wpmul2r => //.
by case: q_bnd => /ltrW.
rewrite lez_floor.
rewrite neq_ltz.
right.
by apply (powPos 2 kk).
rewrite mulzA.
apply ler_wpmul2l => //.
rewrite lez_floor.
rewrite neq_ltz.
right.
by case: q_bnd.
move => ineq0.
rewrite &(ltr_pmul2r (2 ^ kk)) //.
by apply (powPos 2 kk).
rewrite mulrBl mulrAC divzE.
rewrite mulrBl opprB addrA.
rewrite (mulzC a (2 ^ kk %/ q)).
pose c := ((2 ^ kk) %/ q) * a * q.
have ->: c = (2 ^ kk) * a - a * ((2 ^ kk) %% q).
by rewrite /c mulrAC divzE mulrBl ; congr; rewrite mulrC.
rewrite opprD opprK addrA (addrAC (a * (2 ^ kk))) (mulrC (2 ^ kk) a) subrr /=.
have mul2r: 2 * q = q + q.
by ring.
rewrite mul2r mulrDl ltr_le_add.
rewrite (mulrC q _) ltr_pmul2r //.
by case q_bnd ; trivial.
rewrite ltz_pmod.
by apply (powPos 2 kk).
rewrite (mulrC q) &(ler_pmul) //.
rewrite modz_ge0 gtr_eqF.
by case q_bnd ; trivial.
by trivial.
apply/ltrW/ltz_pmod.
by case: q_bnd ; trivial.
qed.
