require import AllCore StdOrder Ring.
(*---*) import IntOrder.


(*-----------------------------------------------------------------------------*)

lemma mulrD1l x y : (x + 1) * y = x * y + y.
proof. by rewrite mulrDl. qed.

lemma addr_double (x : int) : x + x = x * 2.
proof. by ring. qed.


(*-----------------------------------------------------------------------------*)

lemma lt_exp_pow (b n : int) : 1 < b => 0 <= n => n < b ^ n.
proof.
move => lt1b; elim n; [by rewrite expr0|move => n le0n len_].
apply/(ler_lt_trans (b ^ n)); first by apply/ltzE.
rewrite IntID.exprSr //; move: (ltr_pmul2l (b ^ n) _ 1 b); first by apply expr_gt0; smt().
by move => /= ->.
qed.

lemma ler_weexpn2r (b x y : int) : 1 < b => 0 <= x => 0 <= y => b ^ x <= b ^ y => x <= y.
proof.
move => lt1b le0x le0y; rewrite -implybNN -!ltrNge ltzE => le_x; apply (ltr_le_trans (b ^ (y + 1))).
+ by rewrite IntID.exprS //; apply ltr_pmull => //; apply (ler_lt_trans y) => //; apply lt_exp_pow.
by apply ler_weexpn2l;[apply ltzW|split => //; apply addz_ge0].
qed.
