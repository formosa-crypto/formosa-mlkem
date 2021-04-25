require import AllCore StdOrder List Ring.
require import CoreReal Real RealExp.
(*---*) import RField.
require import IntMin IntDiv.
(*---*) import IntOrder.


(*TODO: move stuff in EasyCrypt when needed.*)
(*TODO: should I add nosmt to most of these lemmas?*)


(*-----------------------------------------------------------------------------*)

lemma andb_id2 a b c d : (a <=> b) => (c <=> d) => ((a /\ c) <=> (b /\ d)).
proof. by move => [Hab Hba] [Hcd Hdc]; split => [[Ha Hb]|[Hc Hd]]; split; [apply Hab|apply Hcd|apply Hba|apply Hdc]. qed.

lemma or_andl a b : (a \/ b) <=> ((a /\ !b) \/ b).
proof. by rewrite -iff_negb !negb_or; split => [[Hna Hnb]|[Hab Hnb]]; rewrite Hnb //=; move: Hab; rewrite Hnb. qed.

lemma or_andr a b : (a \/ b) <=> (a \/ (!a /\ b)).
proof. by rewrite orbC or_andl andbC orbC. qed.

lemma negb_eqbl a b : ! (a <=> b) <=> (!a <=> b).
proof. by split => [Hneq|<<-]; [split|] => [/neqF ->>|/eqT ->>| ]; [case b|case a|case a]. qed.

lemma negb_eqbr a b : ! (a <=> b) <=> (a <=> !b).
proof. by rewrite -!(eqboolP a) !(eq_sym a) !eqboolP negb_eqbl. qed.


(*-----------------------------------------------------------------------------*)

lemma pmin_nmem E i : ! sempty (pcap E) => 0 <= i < pmin E => ! E i.
proof.
move => Hnsempty [le0i ltipmin]; apply/negP => HEi.
by move: (ltr_le_trans _ _ _ ltipmin (pmin_min _ _ Hnsempty le0i HEi)).
qed.

lemma pmin_max E i : ! sempty (pcap E) => 0 <= i => (forall j , 0 <= j < i => ! E j) => i <= pmin E.
proof.
move=> h ge0_i min_i; rewrite lerNgt; apply/negP=> gti.
by apply/(min_i (pmin E))/pmin_mem => //; rewrite ge0_pmin.
qed.


(*-----------------------------------------------------------------------------*)

lemma divrK: forall (u v : real) , v <> 0%r => u = u / v * v.
proof. by move => u v neqv0; rewrite -mulrA mulVf. qed.


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
admit.
qed.


(*-----------------------------------------------------------------------------*)

lemma logM (a x y : real) : 0%r < x => 0%r < y => log a (x * y) = log a x + log a y.
proof. by move => lt0x lt0y; rewrite -mulrDl -lnM. qed.

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

lemma ilog_2_67_6 : ilog 2 67 = 6.
proof. by simplify. qed.


(*-----------------------------------------------------------------------------*)

lemma nosmt eq_div_range m d n : 0 < d =>  m %/ d = n <=> m \in range (n * d) ((n + 1) * d).
proof.
move => lt0d; rewrite mem_range andabP eq_sym eqz_leq; apply andb_id2.
+ by apply lez_divRL.
by rewrite -ltz_divLR // ltzS.
qed.

abbrev (%\) (m d : int) : int = - ((- m) %/ d).

lemma lez_ceil m d : d <> 0 => m <= m %\ d * d.
proof. by rewrite mulNr => neqd0; apply/ler_oppr/lez_floor. qed.

lemma ltz_floor m d : 0 < d => (m %\ d - 1) * d < m.
proof. by rewrite -opprD mulNr => lt0d; apply/ltr_oppl/ltz_ceil. qed.

lemma lez_NdivNLR (d m n : int) : 0 < d => d %| n => m <= n %\ d <=> m * d <= n.
proof.
move => lt0d dvddn; rewrite ler_oppr lez_divLR //; first by apply dvdzN.
by rewrite mulNr ler_opp2.
qed.

lemma lez_NdivNRL (m n d : int) : 0 < d => m %\ d <= n <=> m <= n * d.
proof. by move => lt0d; rewrite ler_oppl lez_divRL // mulNr ler_opp2. qed.

lemma ltz_NdivNLR (m n d : int) : 0 < d => m < n %\ d <=> m * d < n.
proof. by move => lt0d; rewrite ltr_oppr ltz_divLR // mulNr ltr_opp2. qed.

lemma ltz_NdivNRL (d m n : int) : 0 < d => d %| m => m %\ d < n  <=> m < n * d.
move => lt0d dvddm; rewrite ltr_oppl ltz_divRL //; first by apply dvdzN.
by rewrite mulNr ltr_opp2.
qed.


(*-----------------------------------------------------------------------------*)

lemma le_exp_pow (b n : int) : 1 < b => 0 <= n => n < b ^ n.
proof.
move => lt1b; elim n; [by rewrite expr0|move => n le0n len_].
apply/(ler_lt_trans (b ^ n)); first by apply/ltzE.
rewrite IntID.exprSr //; move: (ltr_pmul2l (b ^ n) _ 1 b); first by apply expr_gt0; smt().
by move => /= ->.
qed.

lemma ler_weexpn2r (b x y : int) : 1 < b => 0 <= x => 0 <= y => b ^ x <= b ^ y => x <= y.
proof.
move => lt1b le0x le0y lepowxy; rewrite -(ilog_powK b x) // -(ilog_powK b y) //.
by apply ilog_mono => //; apply/expr_gt0/(ltz_trans 1).
qed.


(*-----------------------------------------------------------------------------*)

abbrev Evp (b x n : int) = ! (b ^ n) %| x.

abbrev vp (b x : int) = if (b <= 1) \/ (x = 0) then 0 else pmin (Evp b x) - 1.

abbrev vp_rem b x = x %/ (b ^ (vp b x)).

lemma vp_nsempty (b x : int) : 1 < b => x <> 0 => ! sempty (pcap (Evp b x)).
proof.
move => lt1b neqx0; apply/semptyNP; exists (`|x|); split; [by apply normr_ge0|].
apply/negP => Hdiv; move: (dvdz_le _ _ neqx0 Hdiv); rewrite normrX_nat; first by apply/normr_ge0.
apply/negP/ltzNge/le_exp_pow; first by apply/ltr_normr; left.
by apply/normr_ge0.
qed.

lemma vp_ge0 b x : 0 <= vp b x.
proof.
case ((b <= 1) \/ (x = 0)) => // /negb_or [/ltrNge lt1b neqx0].
rewrite -ler_subl_addr /=; apply pmin_max => //; first by apply vp_nsempty.
move => // j [le0j]; rewrite ltzE -subr_le0 /= => lej0; move: (eqz_leq j 0).
by rewrite le0j lej0 /= => ->>; rewrite expr0 dvd1z.
qed.

lemma vp_pow_dvd b x : 1 < b => x <> 0 => (b ^ (vp b x)) %| x.
proof.
move => lt1b neqx0.
(*TODO: why can't this be a one liner?*)
have Hnsempty:= (vp_nsempty _ _ lt1b neqx0).
apply (pmin_nmem (Evp b x) (vp b x) Hnsempty).
by rewrite vp_ge0 /= lerNgt lt1b neqx0 /=; apply/ltzE.
qed.

lemma vp_rem_powK b x : 1 < b => x <> 0 => (vp_rem b x) * (b ^ (vp b x)) = x.
proof. by move => lt1b neqx0; rewrite divzK; move: (vp_pow_dvd b _ lt1b neqx0). qed.

lemma vp_rem_ndvd b x :  1 < b => x <> 0 => !(b %| vp_rem b x).
proof.
(*TODO: weird, seems to work that way?*)
move => lt1b neqx0; move: (pmin_mem (Evp b x) (vp_nsempty b x _ _)) => //=; rewrite implybNN => dvdb_.
move: (dvdz_mul _ (b ^ (vp b x)) _ (b ^ (vp b x)) dvdb_); rewrite dvdzz /= vp_rem_powK //.
by move: (vp_ge0 b x); rewrite (lerNgt b) lt1b neqx0 /= => le0_; rewrite -exprS.
qed.

lemma vp_mul b x y : 1 < b => x <> 0 => y <> 0 => vp b x + vp b y <= vp b (x * y).
proof.
move => lt1b neqx0 neqy0; rewrite {3}(lerNgt b) lt1b IntID.mulf_eq0 {2}neqx0 {2}neqy0 /= ler_subr_addr.
apply (pmin_max _ _ (vp_nsempty _ _ lt1b _)).
+ by rewrite IntID.mulf_eq0 negb_or; split.
+ by apply/addr_ge0 => //; apply/addr_ge0/vp_ge0/vp_ge0.
admit.
qed.

lemma vp_mul_prime b x y : 1 < b => x <> 0 => y <> 0 => prime b => vp b x + vp b y = vp b (x * y).
proof.
admit.
qed.

lemma vp0 b x : (b <= 1) \/ (x = 0) \/ (x %% b <> 0) => vp b x = 0.
proof.
case ((b <= 1) \/ (x = 0)) => // /negb_or [/ltrNge lt1b neqx0]; rewrite -dvdzE Domain.subr_eq0.
move => [leb1|[eqx0|ndvdbx]] => //; first by move: (ltr_le_trans _ _ _ lt1b leb1).
apply pmin_eq => //= [|j [le0j /ltzE /ler_subr_addr /= lej0]]; first by rewrite expr1.
by move: (eqz_leq j 0); rewrite le0j lej0 /= => ->>; rewrite expr0 dvd1z.
qed.

lemma vp_dvd b x : 1 < b => x <> 0 => x %% b = 0 => vp b x = vp b (x %/ b) + 1.
proof.
(*TODO: weird side effet of rewrite when abbrev is used.*)
move => lt1b neqx0; rewrite -dvdzE dvdz_eq => {1 2}<-.

admit.
qed.

(*TODO: what?*)
hint simplify vp0, vp_dvd.


lemma eq_vp_3_54_3 : vp 3 54 = 3.
proof. by simplify. qed.
