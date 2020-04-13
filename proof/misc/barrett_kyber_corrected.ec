require import Core Int IntDiv IntExtra Ring StdOrder.
import Ring.IntID IntOrder.

op k : { int | 2 < k } as gt2_k.

op R = 2^k.

op kk = 16.
op n = 256.
op e = 13.
op q = n*e+1.

axiom q_bnd: 0 < q /\ q < R %/2.
lemma q_odd1: 2 %| (q + 1) by rewrite /=.
lemma q_odd2: 2 %| (q - 1) by rewrite /=.

lemma barrett_overZ a:
      - 2^15 <= a =>
      a < 2 ^ 15 =>
      0 <= a - a*(2^kk %/ q + 1) %/ 2^kk * q < 2*q.
proof.
rewrite /kk /q /n /e /(^) /(%/) //=. (*FIXME*) (*This should also compute the results of powers and divisions*)
move => genpa gtap.
have eq1 : (2 ^ 16 %/ 3329 + 1) = 20.
by admit.
rewrite eq1.
have eq2 : 2 ^ 16 = 65536.
by admit.
rewrite eq2.
have eq3 : a * 20 %/ 65536 = a * 5 %/ 16384.
by admit.
rewrite eq3.
split.
+ rewrite subz_ge0.
  by admit.
+ move => ge0t.
  by admit.
qed.

lemma dubious : false.
have := (barrett_overZ 29492).
rewrite /kk /q /n /e.
rewrite (powS 15) // (powS 14) // (powS 13) // (powS 12) // (powS 11) // (powS 10) // (powS 9) // (powS 8) // (powS 7) // (powS 6) // (powS 5) // (powS 4) // (powS 3) // (powS 2) // (powS 1) // (powS 0)  //=.
by rewrite pow0 //=.
qed.
