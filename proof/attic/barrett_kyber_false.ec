require import Core Int IntDiv IntExtra Ring StdOrder.
import Ring.IntID IntOrder.

op k : { int | 2 < k } as gt2_k.

op R = 2^k.

op q : int.
axiom q_bnd: 0 < q /\ q < R %/2.
axiom q_odd1: 2 %| (q + 1).
axiom q_odd2: 2 %| (q - 1).


lemma barrett_overZ a kk:
      1 < kk =>
      q < 2^kk =>
      2^kk %/ q * q < 2^kk =>
      0 <= a - a*(2^kk %/ q + 1) %/ 2^kk * q < 2*q.
proof.
admitted.

(*Take q = 3, kk = 2, a = 2, k = 3 and you should be able to prove false.*)
lemma wrong : q = 3 => 0 <= 2 - 2*(2^2 %/ 3 + 1) %/ 2^2 * 3 .
proof.
move => eqq .
have := (barrett_overZ 2 2 _ _) => //=.
rewrite eqq.
by rewrite ( powS 1) // pow1.
rewrite eqq.
rewrite ( powS 1) // pow1.
by apply.
qed.

lemma correct : 2 - 2*(2^2 %/ 3 + 1) %/ 2^2 * 3 <= -1 by rewrite ( powS 1) // pow1 /=.

lemma zeroltzzero : q = 3 => 0 < 0.
proof.
move => eqq.
rewrite - lez_add1r.
rewrite - (lez_add2l (-1)) .
rewrite (lez_trans (2 - 2*(2^2 %/ 3 + 1) %/ 2^2 * 3)).
rewrite wrong.
by exact eqq.
by rewrite correct.
qed.

lemma eqq3impfalse : q = 3 => false.
proof.
move => eqq.
rewrite zeroltzzero.
by exact eqq.
qed.
