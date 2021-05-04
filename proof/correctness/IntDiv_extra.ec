require import AllCore StdOrder.
require import IntDiv.
(*---*) import IntOrder.


(*-----------------------------------------------------------------------------*)

lemma divz_eqP (m d n : int) :
  0 < d => m %/ d = n <=> n * d <= m < (n + 1) * d.
proof.
  move => lt0d; split => [<<-|[le_m ltm_]].
  + by split => [|_]; [apply/lez_floor/gtr_eqF|apply/ltz_ceil].
  by apply/eqz_leq; split; [apply/ltzS/ltz_divLR|apply/lez_divRL].
qed.

lemma divz_mulp (n d1 d2 : int) : 
  0 < d1 =>
  0 < d2 =>
  n %/ (d1 * d2) = n %/ d1 %/ d2.
proof.
  (*TODO: seems that mulzA and mulrA are not written the same way? Pierre-Yves*)
  print mulzA.
  print mulrA.
  print associative.
  move => lt0d1 lt0d2; rewrite (mulzC d1); apply divz_eqP; [by apply mulr_gt0|split => [|_]].
  + by rewrite mulrA; apply (lez_trans (n %/ d1 * d1));
    [apply/ler_pmul2r => //|]; apply/lez_floor/gtr_eqF.
  by rewrite mulrA; apply (ltr_le_trans ((n %/ d1 + 1) * d1));
  [|apply/ler_pmul2r => //; apply/ltzE]; apply/ltz_ceil.
qed.

lemma divz_mul (n d1 d2 : int) :
  0 <= d1 =>
  n %/ (d1 * d2) = n %/ d1 %/ d2.
proof.
move => /lez_eqVlt [<<- //=|lt0d1];
(case (0 <= d2) => [/lez_eqVlt [<<- //=|lt0d2]|/ltzNge ltd20]).
+ by rewrite divz_mulp.
by rewrite -(oppzK d2) mulrN 2!divzN eqr_opp divz_mulp // ltr_oppr.
qed.

lemma divzpMr p m d : d %| m => p * (m %/ d) = p * m %/ d.
proof. by move => /dvdzP [q ->>]; case (d = 0) => [->> //|neqd0]; rewrite mulrA !mulzK. qed.

lemma dvdNdiv x y : x <> 0 => x %| y => (-y) %/ x = - y %/ x.
proof. by move => neqx0 /dvdzP [z ->>]; rewrite -mulNr !mulzK. qed.

lemma exprD_subz (x m n : int) : x <> 0 => 0 <= n <= m => x ^ (m - n) = (x ^ m) %/ (x ^ n).
proof.
move => neqx0 [le0n lenm]; rewrite eq_sym -(eqz_mul (x ^ n) (x ^ m) (x ^ (m - n))).
+ by move: neqx0; rewrite implybNN expf_eq0.
+ by apply dvdz_exp2l.
by rewrite -exprD_nneg ?subrK // ler_subr_addr.
qed.
