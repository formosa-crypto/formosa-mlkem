require import AllCore StdOrder.
(*---*) import IntOrder.
require import Logic_extra.


(*-----------------------------------------------------------------------------*)

lemma argmin_out (f : int -> 'a) p: (forall i, 0 <= i => !p (f i)) => argmin f p = 0.
proof.
move=> pN; rewrite /argmin choiceb_dfl => //= x; rewrite !negb_and -implybE => le0x.
by rewrite -implybE => px; move: (pN _ le0x).
qed.

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
+ by move=> x; apply/negP=> [# le0x Hpfx Hnpfx]; apply/h; exists x.
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
(*TODO: why no one liner? Pierre-Yves*)
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
