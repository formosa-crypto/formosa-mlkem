require import AllCore StdOrder List Ring.
require import CoreReal Real RealExp.
(*---*) import RField.
require import IntMin IntDiv.
(*---*) import IntOrder.


(*TODO: move stuff in EasyCrypt when needed.*)


(*-----------------------------------------------------------------------------*)

lemma andb_id2 a b c d : (a <=> b) => (c <=> d) => ((a /\ c) <=> (b /\ d)).
proof. by case a; case b; case c; case d. qed.

lemma or_andl a b : (a \/ b) <=> ((a /\ !b) \/ b).
proof. by case a; case b. qed.

lemma or_andr a b : (a \/ b) <=> (a \/ (!a /\ b)).
proof. by case a; case b. qed.

lemma and_impl a b : (a /\ b) <=> ((b => a) /\ b).
proof. by case a; case b. qed.

lemma and_impr a b : (a /\ b) <=> ( a /\ (a => b)).
proof. by case a; case b. qed.

lemma negb_eqbl a b : ! (a <=> b) <=> (!a <=> b).
proof. by case a; case b. qed.

lemma negb_eqbr a b : ! (a <=> b) <=> (a <=> !b).
proof. by case a; case b. qed.


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


(*-----------------------------------------------------------------------------*)

lemma divrK: forall (u v : real) , v <> 0%r => u = u / v * v.
proof. by move => u v neqv0; rewrite -mulrA mulVf. qed.


(*-----------------------------------------------------------------------------*)

lemma nosmt eq_div_range m d n : 0 < d =>  m %/ d = n <=> m \in range (n * d) ((n + 1) * d).
proof.
move => lt0d; rewrite mem_range andabP eq_sym eqz_leq; apply andb_id2.
+ by apply lez_divRL.
by rewrite -ltz_divLR // ltzS.
qed.


(*-----------------------------------------------------------------------------*)

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

lemma ilog_2_67_6 : ilog 2 67 = 6.
proof. by simplify. qed.


(*-----------------------------------------------------------------------------*)

lemma argmin_out (f : int -> 'a) p: (forall i, 0 <= i => !p (f i)) => argmin f p = 0.
proof.
move=> pN; rewrite /argmin choiceb_dfl => //= x; rewrite !negb_and -implybE => le0x.
by rewrite -implybE => px; move: (pN _ le0x).
qed.

(*TODO: naming: le, ge, _, ...*)
lemma le_argmin ['a] f p i :
  0 <= i =>
  ((exists j, (0 <= j) /\ (p (f j))) => (exists j, (0 <= j <= i) /\ (p (f j)))) <=>
  (argmin<:'a> f p <= i).
proof.
move => le0i; case (exists j, (0 <= j) /\ (p (f j))) => /= [[j [le0j pj]]|].
+ split => [|le_i]; last by exists (argmin f p); rewrite le_i ge0_argmin /=; apply/(argminP _ _ j).
  move => [k [[le0k leki] pk]]; apply/lezNgt/negP => lti_; apply/(argmin_min f p k) => //.
  by split => // _; apply/(ler_lt_trans i).
by move => /negb_exists /= Npj; rewrite argmin_out // => j; move: (Npj j); rewrite negb_and -implybE.
qed.

lemma ge_argmin ['a] f p i :
  0 < i =>
  ((exists j, (0 <= j) /\ (p (f j))) /\ (forall j, (0 <= j < i) => !(p (f j)))) <=>
  (i <= argmin<:'a> f p).
proof.
move => lt0i; case (exists j, (0 <= j) /\ (p (f j))) => /= [[j [le0j pj]]|].
+ split => [|lei_ k [le0k ltki]]; last by apply argmin_min; rewrite le0k /=; apply (ltr_le_trans i).
  move => Npk; apply/lezNgt/negP => lt_i; apply (Npk (argmin f p)); first by rewrite lt_i ge0_argmin.
  by apply (argminP _ _ j).
move => /negb_exists /= Npj; apply/ltrNge; rewrite argmin_out // => j.
by move: (Npj j); rewrite negb_and -implybE.
qed.

lemma argmin_le ['a] f p q :
  (exists j, (0 <= j) /\ (p (f j))) =>
  (forall j, 0 <= j => p (f j) => q (f j)) =>
  argmin<:'a> f q <= argmin<:'a> f p.
proof.
move=> pj le_pq; apply/le_argmin; first by apply/ge0_argmin.
move=> [j [le0j qj]]; exists (argmin f p); rewrite ge0_argmin /=.
by apply le_pq; [rewrite ge0_argmin|move: pj => [k [le0k pk]]; apply (argminP _ _ k)].
qed.


(*-----------------------------------------------------------------------------*)

op argmax ['a] (f : int -> 'a) (p : 'a -> bool) : int =
  choiceb (fun (j : int) => 0 <= j /\ p (f j) /\ forall (i : int), j < i => ! p (f i)) 0.

lemma argmax_out (f : int -> 'a) p:
(forall i, 0 <= i => !p (f i)) \/
(forall i, 0 <= i => exists j, i <= j /\ p (f j)) =>
argmax f p = 0.
proof.
move=> [pN|pij]; rewrite /argmax choiceb_dfl => //= x; rewrite !negb_and -implybE => le0x; rewrite -implybE => px; first by move: (pN _ le0x).
by rewrite negb_forall /=; move: (pij (x + 1) _); [rewrite addz_ge0|move => [j [lejx pj]]; exists j; rewrite negb_imply ltzE].
qed.

lemma argmaxP_r (f : int -> 'a) p i j:
  0 <= i =>
  0 <= j =>
  p (f i) =>
  (forall k, j <= k => !(p (f k))) =>
     0 <= argmax f p
  /\ p (f (argmax f p))
  /\ forall i, (argmax f p) < i => !p (f i).
proof.
pose F := fun i0 => forall (j : int), i0 < j => !p (f j).
move=> ge0_i ge0_j pi pnj; have: exists k, 0 <= k /\ p (f k) /\ F k.
  elim/sintind: j ge0_j pnj => j ge0_j ih pnj.
  case: (exists k, (0 <= k < j) /\ (forall (l : int), k <= l => ! p (f l))); first by case=> k [/ih].
  move=> h; exists (j-1); apply/and_impr; split => [|le0_]; [|split].
    by move/ler_eqVlt: ge0_j => [<<-|]; [move: (pnj i); rewrite ge0_i pi|move/ltzE/ler_subr_addr].
    by apply/negbNE/negP => pn_; apply/h; exists (j-1); rewrite le0_ ltzE //= => l /ler_eqVlt [<<- //|/ltzE /= /pnj].
  by move => k /ltzE /=; apply pnj.
by move/choicebP/(_ 0); apply.
qed.

lemma argmaxP (f : int -> 'a) p i j:
  0 <= i =>
  0 <= j =>
  p (f i) =>
  (forall k, j <= k => !(p (f k))) =>
  p (f (argmax f p)).
proof. by move => ge0i ge0j Hpfi Hnpfj; move: (argmaxP_r _ _ _ _ _ _ Hpfi Hnpfj). qed.

lemma ge0_argmax (f : int -> 'a) p:
  0 <= argmax f p.
proof.                          (* FIXME: choice_spec *)
case: (exists i j, 0 <= i /\ 0 <= j /\ p (f i) /\ (forall k, j <= k => !(p (f k)))).
+ by case=> i j [? [? [Hpfi Hnpfj]]]; move: (argmaxP_r _ _ _ _ _ _ Hpfi Hnpfj).
move=> h; rewrite /argmax choiceb_dfl ?lez_lt_asym //=.
move=> x; apply/negP=> [# ge0_x px xmax]; apply/h; exists x; exists (x + 1).
by do!split => //; [apply addz_ge0|move => k; rewrite -ltzE; apply xmax].
qed.

lemma argmax_max (f : int -> 'a) p j:
  0 <= j =>
  (forall k, j <= k => !(p (f k))) =>
  forall j, argmax f p < j => !p (f j).
proof.                          (* FIXME: choice_spec *)
case: (exists i, 0 <= i /\ p (f i)).
+ by case=> i [? Hpfi] ? Hnpfj; move: (argmaxP_r _ _ _ _ _ _ Hpfi Hnpfj).
move=> h i; rewrite /argmax choiceb_dfl ?lez_lt_asym //=.
+ (*TODO: what does [# _] do?*)
  by move=> x; apply/negP=> [# le0x Hpfx Hnpfx]; apply/h; exists x.
by move => _ k lt0k; apply/negP => Hpfk; apply/h; exists k; split => //; apply/ltzW.
qed.

lemma argmax_eq ['a] f p i :
  0 <= i => p (f i) => (forall j, i < j => !p (f j)) => argmax<:'a> f p = i.
proof.
move=> ge0_i pfi Npfj @/argmax.
pose Q j := 0 <= j /\ p (f j) /\ forall i, j < i => !p (f i).
by have /# := choicebP Q 0 _; exists i.
qed.

lemma le_argmax ['a] f p i :
  0 <= i =>
  ((exists j, (0 <= j) /\ (forall k, (j <= k) => !(p (f k)))) => (forall j, i < j => !(p (f j)))) <=>
  (argmax<:'a> f p <= i).
proof.
move => le0i; case ((forall i, 0 <= i => !p (f i)) \/ (forall i, 0 <= i => exists j, i <= j /\ p (f j))) => /=.
+ move => Hor; rewrite argmax_out // le0i /=; case Hor => [Npj _ j ltij|]; first by apply/Npj/(lez_trans i) => //; apply ltzW.
  by move => pj [j [le0j Npk]]; case (pj _ le0j) => k [lejk pkj]; move: (Npk _ lejk).
move => /negb_or [/negb_forall [j /= /negb_imply [le0j /= pj]] /negb_forall [k /= /negb_imply [le0k /negb_exists /= Npl]]].
have ->/=: (exists (l : int), 0 <= l /\ forall (m : int), l <= m => ! p (f m)).
+ by exists k; split => // l ltkl; move: (Npl l) => /negb_and; rewrite ltkl.
split => [Npi|le_i l leil].
+ apply/lezNgt/negP => /(Npi _); apply/negP => /=; apply/(argmaxP _ _ _ (i + 1) le0j _ pj _); first by apply addz_ge0.
  by move => l /ltzE; apply Npi.
apply (argmax_max _ _ _ le0k _ _ _); last by apply (ler_lt_trans i) => //.
by move => m lekm; move: (Npl m) => /negb_and; rewrite lekm.
qed.

lemma ge_argmax ['a] f p i :
  0 < i =>
  ((exists j, (0 <= j) /\ (forall k, (j <= k) => !(p (f k)))) /\ (exists j, (i <= j) /\ (p (f j)))) <=>
  (i <= argmax<:'a> f p).
proof.
move => lt0i; case ((forall i, 0 <= i => !p (f i)) \/ (forall i, 0 <= i => exists j, i <= j /\ p (f j))) => /=.
+ move => Hor; rewrite argmax_out // (lezNgt i) lt0i /=; apply/negb_and; case Hor => [Npj|pj].
  - by right; apply/negb_exists => /= j; apply/negb_and/implybE => leij; apply/Npj/(lez_trans i) => //; apply/ltzW.
  left; apply/negb_exists => /= j; apply/negb_and/implybE => le0j; apply/negb_forall; move: (pj _ le0j).
  by move => /= [k [lejk pk]]; exists k; apply/negb_imply; split.
move => /negb_or [/negb_forall [j /= /negb_imply [le0j /= pj]] /negb_forall [k /= /negb_imply [le0k /negb_exists /= Npl]]].
have ->/=: (exists (l : int), 0 <= l /\ forall (m : int), l <= m => ! p (f m)).
+ by exists k; split => // l ltkl; move: (Npl l) => /negb_and; rewrite ltkl.
split => [[l [leil pl]]|lei_]; last by exists (argmax f p); split => //; apply/(argmaxP _ _ _ k le0j le0k pj _) => l lekl; move: (Npl l); rewrite lekl.
apply/lezNgt/negP => lt_i.
(*TODO: why no one liner?*)
have lt_l:= (ltr_le_trans _ _ _ lt_i leil).
by move: (argmax_max _ _ _ le0k _ _ lt_l); [move => m lekm; move: (Npl m); rewrite lekm|].
qed.

lemma argmax_le ['a] f p q :
  (exists j, (0 <= j) /\ (forall k, (j <= k) => !(q (f k)))) =>
  (forall j, 0 <= j => p (f j) => q (f j)) =>
  argmax<:'a> f p <= argmax<:'a> f q.
proof.
move => [i [le0i Nqk]] le_pq; apply le_argmax; first by apply ge0_argmax.
move => [j [le0j Npk]] k /ltzE /ler_subr_addr le__; move: (le__); rewrite -le_argmax.
+ by apply/(lez_trans (argmax f q)) => //; apply/ge0_argmax.
move => HNq; apply/negP => pk; apply (HNq _ k); [by exists i|by apply/ltzE| ].
apply le_pq => //; apply (lez_trans (argmax f q)); first apply ge0_argmax.
by apply (lez_trans (k-1)) => //; apply/ltzW/ltzE.
qed.


(*-----------------------------------------------------------------------------*)

op vp (b x : int) = argmax ((^) b) (transpose (%|) x).

abbrev vp_rem b x = x %/ (b ^ (vp b x)).

lemma vp_bound b x : 1 < b => x <> 0 => forall n, `|x| <= n => ! b ^ n %| x.
proof.
move => lt1b neqx0 n le_n; apply/negP => dvd_x; move: (dvdz_le _ _ neqx0 dvd_x); apply/negP/ltrNge.
apply (ler_lt_trans n) => //; rewrite normrX_nat; first by apply/(lez_trans _ _ _ _ le_n)/normr_ge0.
by apply/lt_exp_pow; [apply/ltr_normr; left|apply/(lez_trans _ _ _ _ le_n)/normr_ge0].
qed.

lemma ge0_vp b x : 0 <= vp b x.
proof. by rewrite /vp; apply/ge0_argmax. qed.

lemma vp_pow_dvd b x : 1 < b => x <> 0 => (b ^ (vp b x)) %| x.
proof.
by move => lt1b neqx0; rewrite /vp; apply/(argmaxP ((^) b) (transpose (%|) x) 0 `|x| _ _ _ _) => //=;
[apply/normr_ge0|rewrite expr0 dvd1z|apply vp_bound].
qed.

lemma vp_rem_powK b x : 1 < b => x <> 0 => (vp_rem b x) * (b ^ (vp b x)) = x.
proof. by move => lt1b neqx0; rewrite divzK; move: (vp_pow_dvd b _ lt1b neqx0). qed.

lemma vp_rem_ndvd b x :  1 < b => x <> 0 => !(b %| vp_rem b x).
proof.
move => lt1b neqx0; apply/negP => dvdb_; move: (dvdz_mul _ (b ^ (vp b x)) _ (b ^ (vp b x)) dvdb_).
rewrite dvdzz /= vp_rem_powK // -IntID.exprS 1:ge0_vp.
move: (argmax_max ((^) b) (transpose (%|) x) `|x|).
by move=> /= -> //=; [apply normr_ge0|apply vp_bound|rewrite /vp ltzE].
qed.

lemma vp0 b x : 1 < b => x <> 0 => x %% b <> 0 => vp b x = 0.
proof.
rewrite -dvdzE /vp => lt1b neqx0 Ndvdbx; apply argmax_eq => //=; first by rewrite expr0 dvd1z.
by move=> j /ltzE /= le1j; move: Ndvdbx; apply/implybNN/dvdz_trans; move: (dvdz_exp2l b 1 j); rewrite expr1 le1j.
qed.

lemma vp_dvd b x : 1 < b => x <> 0 => x %% b = 0 => vp b x = vp b (x %/ b) + 1.
proof.
rewrite -dvdzE /vp => lt1b neqx0 /dvdz_eq eq_x; rewrite -{1}eq_x; apply argmax_eq => //=.
+ by apply addz_ge0; rewrite // ge0_argmax.
+ rewrite exprSr ?ge0_argmax /=; apply dvdz_mul; last by rewrite dvdzz.
  by apply vp_pow_dvd => //; move: neqx0; rewrite-{1} eq_x; apply implybNN => ->.
move=> j /ltr_subr_addr ltvp_; move: (argmax_max _ _ `|x %/ b| _ _ _ ltvp_); first by apply normr_ge0.
+ move => n /=; apply vp_bound => //; first by move: neqx0; rewrite-{1} eq_x; apply implybNN => ->.
apply implybNN => /= /dvdzP [q eq__]; apply/dvdzP; exists q; move: eq__.
rewrite -{1}(IntID.subrK j 1) exprSr; first by apply (lez_trans _ _ _ (ge0_argmax _ _) (ltzW _ _ ltvp_)).
by rewrite mulrA; apply/IntID.mulIf/neq_ltz; right; apply/(ltz_trans 1).
qed.

hint simplify vp0, vp_dvd.


lemma eq_vp_3_54_3 : vp 3 54 = 3.
proof. by simplify. qed.
