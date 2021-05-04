require import AllCore StdOrder.
(*---*) import RField.
(*---*) import IntOrder.


(*-----------------------------------------------------------------------------*)

lemma divrK (u v : real) : v <> 0%r => u = u / v * v.
proof. by move => neqv0; rewrite -mulrA mulVf. qed.


(*-----------------------------------------------------------------------------*)

lemma floorP x n : floor x = n <=> n%r <= x < n%r + 1%r.
proof.
split => [<<-|].
+ move: (floor_bound x) => /= [? ?]; split => // _.
  by apply/RealOrder.ltr_subl_addr.
move => [lenx ltx_]; apply/eqz_leq; split.
+ by apply/ltzS/lt_fromint/(RealOrder.ler_lt_trans _ _ _ (floor_le x)); rewrite fromintD.
apply/ltzS/ltr_subl_addr/lt_fromint/(RealOrder.ler_lt_trans _ _ _ _ (floor_gt x)).
by rewrite fromintD fromintN RealOrder.ler_add2r.
qed.

lemma from_int_floor_addl n x : floor (n%r + x) = n + floor x.
proof. by rewrite floorP fromintD -addrA RealOrder.ler_add2l RealOrder.ltr_add2l -floorP. qed.

lemma from_int_floor_addr n x : floor (x + n%r) = floor x + n.
proof. by rewrite (addrC x) (addzC _ n) from_int_floor_addl. qed.

lemma floor_mono (x y : real) : x <= y => floor x <= floor y.
proof.
move => lexy.
case (y < (floor x)%r + 1%r) => [lty_|/RealOrder.lerNgt le_y].
+ by apply/lerr_eq/eq_sym/floorP; rewrite lty_ /=; apply (RealOrder.ler_trans x) => //; apply floor_le.
apply/le_fromint/(RealOrder.ler_trans (y - 1%r)); first by apply/RealOrder.ler_subr_addr.
by apply/RealOrder.ltrW/floor_gt.
qed.
