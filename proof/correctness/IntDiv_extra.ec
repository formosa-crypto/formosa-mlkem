require import AllCore StdOrder List Ring.
require import CoreReal Real RealExp.
(*---*) import RField.
require import IntMin IntDiv.
(*---*) import IntOrder.


(*TODO: move stuff in EasyCrypt when needed.*)


(*-----------------------------------------------------------------------------*)
lemma nosmt andb_id2 a b c d : (a <=> b) => (c <=> d) => ((a /\ c) <=> (b /\ d)).
proof.
by move => [Hab Hba] [Hcd Hdc]; split => [[Ha Hb]|[Hc Hd]]; split; [apply Hab|apply Hcd|apply Hba|apply Hdc].
qed.


(*-----------------------------------------------------------------------------*)
lemma from_int_floor_addl n x : floor (n%r + x) = n + floor x.
proof.
admit.
qed.

lemma logM (a x y : real) : 0%r < x => 0%r < y => log a (x * y) = log a x + log a y.
proof. by move => lt0x lt0y; rewrite -mulrDl -lnM. qed.

lemma ilog_powK (b n : int) : 0 <= n => 1 < b => ilog b (b ^ n) = n.
proof.
move => le0n lt1b; rewrite /ilog -RField.fromintXn // -rpow_int 1: /#.
by rewrite logK 1,2:/#; apply from_int_floor.
qed.

op is_pow b x = b ^ (ilog b x) = x.

lemma is_powP (b x : int) : 1 < b => is_pow b x <=> exists n , 0 <= n /\ x = b ^ n.
proof.
move => lt1b; split.
+ move => His_pow; exists (ilog b x); rewrite His_pow /= ilog_ge0.
  admit.
by move => [n [le0n ->]]; rewrite /is_pow ilog_powK.
qed.

lemma ilog_mull (b x y : int) : 0 < y => 1 < b => is_pow b x => ilog b (x * y) = ilog b x + ilog b y.
proof.
move => lt0y lt1b /(is_powP _ _ lt1b) [n [le0n ->>]].
rewrite /ilog -RField.fromintXn // -rpow_int 1:/# fromintM logM //.
+ by rewrite lt_fromint; apply expr_gt0; move: (ltr_naddr 1 (-1) b _ lt1b) => // ->.
+ by rewrite lt_fromint.
rewrite -RField.fromintXn // -rpow_int 1:/# logK ?le_fromint // 1,2:/#.
by rewrite from_int_floor from_int_floor_addl.
qed.

lemma ilog_mulr (b x y : int) : 1 < b => is_pow b y => ilog b (x * y) = ilog b x + ilog b y.
proof. rewrite mulrC addrC; apply ilog_mull. qed.

lemma ilog_powK (b n : int) : 0 <= n => 1 < b => ilog b (b ^ n) = n.
proof.
move => le0n lt1b; rewrite /ilog -RField.fromintXn // -rpow_int 1: /#.
by rewrite logK 1,2:/#; apply from_int_floor.
qed.

lemma ilog_one b : 1 < b => ilog b 1 = 0.
proof. by move => lt1b; rewrite -(ilog_powK b 0) // expr0. qed.

lemma ilog_b b : 1 < b => ilog b b = 1.
proof. by move => lt1b; rewrite -(ilog_powK b 1) // expr1. qed.

lemma ilog_dvd (b x : int) : 0 <= x => 1 < b => x %% b = 0 => ilog b x = 1 + ilog b (x %/ b).
proof.
rewrite -dvdzE dvdzP => le0x lt1b [y ->>]; rewrite mulzK.
+ by apply lt0r_neq0; move: (ltr_naddr 1 (-1) b _ lt1b) => // ->.
rewrite ilog_mulr //; first by rewrite /is_pow ilog_b // expr1.
by rewrite ilog_b // addrC.
qed.

hint simplify ilog_one, ilog_dvd.

(*-----------------------------------------------------------------------------*)

lemma nosmt eq_div_range m d n : 0 < d =>  m %/ d = n <=> m \in range (n * d) ((n + 1) * d).
proof.
move => lt0d; rewrite mem_range andabP eq_sym eqz_leq; apply andb_id2.
+ by apply lez_divRL.
by rewrite -ltz_divLR // ltzS.
qed.

abbrev (%\) (m d : int) : int = - ((- m) %/ d).

lemma nosmt lez_ceil m d : d <> 0 => m <= m %\ d * d.
proof. by rewrite mulNr => neqd0; apply/ler_oppr/lez_floor. qed.

lemma nosmt ltz_floor m d : 0 < d => (m %\ d - 1) * d < m.
proof. by rewrite -opprD mulNr => lt0d; apply/ltr_oppl/ltz_ceil. qed.


(*-----------------------------------------------------------------------------*)
(*TODO: also need something to turn n into b ^ k * m with !(b%|m), and to compute it.*)
op vp (b x : int) : int.

op vp_rem b x = x %/ (b ^ (vp b x)).

axiom vp_spec b x : ((b ^ (vp b x)) %| x) /\ !(b %| vp_rem b x).




(*TODO: any tactic language in EasyCrypt?*)
