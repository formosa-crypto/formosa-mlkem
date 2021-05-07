require import AllCore StdOrder Ring.
require import RealExp.
(*---*) import RField.
require import IntDiv.
(*---*) import IntOrder.
require import Real_extra.


(*-----------------------------------------------------------------------------*)

lemma logM (a x y : real) : 0%r < x => 0%r < y => log a (x * y) = log a x + log a y.
proof. by move => lt0x lt0y; rewrite -mulrDl -lnM. qed.


(*-----------------------------------------------------------------------------*)

lemma ilog_eq (b x n : int) : 1 < b => 0 < x => 0 <= n => ilog b x = n <=> b ^ n <= x < b ^ (n + 1).
proof.
move => lt1b lt0x le0n; split => [<<-|]; first by apply ilogP; smt().
move => [lepowx ltxpow]; apply/floorP; split => [|_].
+ rewrite -(logK b%r n%r) 1,2:/# log_mono 1,3:/#.
  - by rewrite rpow_int 1:/# RealOrder.expr_gt0 /#.
  by rewrite rpow_int 1:/# RField.fromintXn 1:/# le_fromint.
rewrite -fromintD -(logK b%r (n + 1)%r) 1,2:/# RealOrder.ltrNge -negP log_mono 1,3:/#.
+ by rewrite rpow_int 1:/# RealOrder.expr_gt0 /#.
by rewrite negP -RealOrder.ltrNge rpow_int 1:/# RField.fromintXn 1:/# lt_fromint.
qed.

lemma ilog_powK (b n : int) : 1 < b => 0 <= n => ilog b (b ^ n) = n.
proof.
move => lt1b le0n; rewrite /ilog -RField.fromintXn // -rpow_int 1: /#.
by rewrite logK 1,2:/#; apply from_int_floor.
qed.

op is_pow b x = b ^ (ilog b x) = x.

lemma is_powP (b x : int) : 1 < b => 0 < x => is_pow b x <=> exists n , 0 <= n /\ x = b ^ n.
proof.
move => lt1b lt0x; split.
+ by move => His_pow; exists (ilog b x); rewrite His_pow /= ilog_ge0 /#.
by move => [n [le0n ->]]; rewrite /is_pow ilog_powK.
qed.

lemma ilog_mull (b x y : int) : 1 < b => 0 < x => 0 < y => is_pow b x => ilog b (x * y) = ilog b x + ilog b y.
proof.
move => lt1b lt0x lt0y /(is_powP _ _ lt1b lt0x) [n [le0n ->>]].
rewrite /ilog -RField.fromintXn // -rpow_int 1:/# fromintM logM //.
+ by rewrite lt_fromint; apply expr_gt0; move: (ltr_naddr 1 (-1) b _ lt1b) => // ->.
+ by rewrite lt_fromint.
rewrite -RField.fromintXn // -rpow_int 1:/# logK ?le_fromint // 1,2:/#.
by rewrite from_int_floor from_int_floor_addl.
qed.

lemma ilog_mulr (b x y : int) : 1 < b => 0 < x => 0 < y => is_pow b y => ilog b (x * y) = ilog b x + ilog b y.
proof. by move => lt1b lt0x lt0y; rewrite mulrC addrC; apply ilog_mull. qed.

lemma ilog_b b : 1 < b => ilog b b = 1.
proof. by move => lt1b; rewrite -(ilog_powK b 1) // expr1. qed.

lemma ilog_mono b x y : 1 < b => 0 < x => x <= y => ilog b x <= ilog b y.
proof. by move => lt1b lt0x lt0y; apply/floor_mono/log_mono; rewrite ?le_fromint ?lt_fromint //; apply (ltr_le_trans x). qed.

lemma ilog_small b x : 1 < b => 0 < x < b => ilog b x = 0.
proof.
move => lt1b [lt0x ltxb]; rewrite floorP -fromintD /=; split => [|_]; first by apply/log_ge0 => /#.
by rewrite -(logK b%r 1%r) 1,2:/# rpow_int 1:/# expr1 RealOrder.ltrNge log_mono; smt().
qed.

lemma ilog_dvd (b x : int) : 0 < x => 1 < b => b <= x => ilog b x = ilog b (x %/ b) + 1.
proof.
move => lt0x lt1b lebx; apply ilog_eq => //; first by smt(ilog_ge0).
have []:= (ilogP b (x %/ b) _ _) => //; first by rewrite lez_divRL //= /#.
by rewrite lez_divRL 1:/# ltz_divLR 1:/# -!IntID.exprSr //; smt(ilog_ge0).
qed.

hint simplify ilog_small, ilog_dvd.
