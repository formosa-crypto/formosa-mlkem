require import Core Int IntDiv IntExtra Ring StdOrder. 
import Ring.IntID IntOrder.

(* [`R] is a power of 2 *)
op k : { int | 2 < k } as gt2_k.

op R = 2^k.

(* [q] is the modulus *)
op q: int.
axiom q_bnd: 0 < q /\ q < R %/2.
axiom q_odd1: 2 %| (q + 1).
axiom q_odd2: 2 %| (q - 1). 

lemma barrett_overZ a kk:
      1 < kk =>
      q < 2^kk =>
      2^kk %/ q * q < 2^kk =>
      0 <= a - a*(2^kk %/ q + 1) %/ 2^kk * q < 2*q.  
    proof.
      move => ineqkk ineqq ineq.
    qed.
