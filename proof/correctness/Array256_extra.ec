require import AllCore List.
require import Array256.
require import Kyber.

import Zq.

from Jasmin require import JUtils.

(*-----------------------------------------------------------------------------*)

(*TODO: this lemma's version in Jasmin has a useless hypothesis.*)
lemma nosmt set_neqiE (t : Fq Array256.t) x y a :
  y <> x => t.[x <- a].[y] = t.[y].
proof. by rewrite get_set_if => /neqF ->. qed.


(*-----------------------------------------------------------------------------*)

op is_perm f =
  perm_eq (range 0 256) (map f (range 0 256)).

op perm f (t : Fq Array256.t) =
  Array256.init (fun i => t.[f i]).

lemma is_perm_stable f :
  is_perm f => forall i , 0 <= i < 256 => 0 <= f i < 256.
proof.
  move => is_perm_f i /mem_range mem_i_range; apply/mem_range.
  by move: is_perm_f => /perm_eq_mem /(_ (f i)) ->; apply/map_f.
qed.

lemma is_perm_injective_in f :
  is_perm f =>
  forall x y, x \in range 0 256 => y \in range 0 256 => f x = f y => x = y.
proof.
  move => /perm_eq_uniq uniq_f x y mem_x_range mem_y_range eq_f.
  by rewrite range_uniq /= in uniq_f; apply/(map_uniq_inj_in _ _ uniq_f).
qed.

lemma perm_perm f g t :
  is_perm f =>
  (perm f \o perm g) t = perm (g \o f) t.
proof.
  rewrite Array256.tP /(\o) => /is_perm_stable is_stable_f i mem_i_range /=.
  by rewrite !initiE //= initiE //= is_stable_f.
qed.

lemma get_permE f t x :
  (perm f t).[x] = if 0 <= x && x < 256 then t.[f x] else witness.
proof. by rewrite /Array256_perm initE. qed.

lemma get_permiE f t x :
  0 <= x && x < 256 =>
  (perm f t).[x] = t.[f x].
proof. by rewrite get_permE => ->. qed.

lemma perm_id f t :
  (forall x, 0 <= x < 256 => f x = x) =>
  perm f t = t.
proof.
  move => id_f; rewrite Array256.tP => i mem_i_range.
  by rewrite get_permiE // id_f.
qed.

lemma set_permE f t x a :
  is_perm f =>
  (perm f t).[x <- a] =
  if 0 <= x && x < 256 then perm f t.[f x <- a] else perm f t.
proof.
  rewrite Array256.tP => is_perm_f i mem_i_range; rewrite Array256.get_set_if initiE //=.
  case: (0 <= x && x < 256) => //=; [|by rewrite initiE].
  rewrite initiE //= get_set_if => mem_x_range.
  move: (is_perm_f) => /is_perm_stable /(_ x) -> //=.
  case: (f i = f x) => [eq_f|]; [|by case: (i = x) => // ->>].
  by rewrite (is_perm_injective_in _ is_perm_f i x) ?mem_range.
qed.

lemma set_permiE f t x a :
  is_perm f =>
  0 <= x && x < 256 =>
  (perm f t).[x <- a] =
  perm f t.[f x <- a].
proof. by move => ?; rewrite set_permE // => ->. qed.


(*-----------------------------------------------------------------------------*)

abbrev set2_add_mulr (p : Fq Array256.t, z : Fq, a b : int) =
  p.[b <- p.[a] + - z * p.[b]].[a <- p.[b <- p.[a] + - z * p.[b]].[a] + z * p.[b]].

lemma set2_add_mulr_eq1iE p z a b x :
  a <> b =>
  a \in range 0 256 =>
  x = a =>
  (set2_add_mulr p z a b).[x] = p.[a] + z * p.[b].
proof. by move => ? /mem_range ? ?; rewrite set_eqiE ?set_neqiE. qed.

lemma set2_add_mulr_eq2iE p z a b x :
  a <> b =>
  b \in range 0 256 =>
  x = b =>
  (set2_add_mulr p z a b).[x] = p.[a] + - z * p.[b].
proof. by move => ? /mem_range ? eqxb; rewrite set_neqiE ?set_eqiE // eqxb eq_sym. qed.

lemma set2_add_mulr_neqiE p z a b x :
  x <> a =>
  x <> b =>
  (set2_add_mulr p z a b).[x] = p.[x].
proof. by move => ? ?; rewrite !set_neqiE. qed.

lemma get_set2_add_mulr_if p z a b x :
  a \in range 0 256 =>
  b \in range 0 256 =>
  a <> b =>
  (set2_add_mulr p z a b).[x] =
  if x = a
  then p.[a] + z * p.[b]
  else if x = b
  then p.[a] + - z * p.[b]
  else p.[x].
proof.
  move => mem_a_range mem_b_range neq_ab.
  case: (x = a) => eqxa; [by rewrite set2_add_mulr_eq1iE|].
  case: (x = b) => eqxb; [by rewrite set2_add_mulr_eq2iE|].
  by rewrite set2_add_mulr_neqiE.
qed.

lemma set2_add_mulr_permiE f p z a b :
  is_perm f =>
  a \in range 0 256 =>
  b \in range 0 256 =>
  set2_add_mulr (perm f p) z a b =
  perm f (set2_add_mulr p z (f a) (f b)).
proof.
  move => is_perm_f mem_a_range mem_b_range.
  by rewrite !set_permiE // ?get_permiE //; apply mem_range.
qed.
  
lemma set2_add_mulr_set2_add_mulr_swap p z1 z2 a1 a2 b1 b2 :
  a1 \in range 0 256 =>
  a2 \in range 0 256 =>
  b1 \in range 0 256 =>
  b2 \in range 0 256 =>
  uniq [a1; a2; b1; b2] =>
  set2_add_mulr (set2_add_mulr p z1 a1 b1) z2 a2 b2 =
  set2_add_mulr (set2_add_mulr p z2 a2 b2) z1 a1 b1.
proof.
  move => mem_a1_range mem_a2_range mem_b1_range mem_b2_range.
  rewrite /= !negb_or => |> neqa neq1 neqa1b2 neqa2b1 neq2 neqb.
  rewrite tP => x /mem_range mem_x_range.
  rewrite get_set2_add_mulr_if //.
  case: (x = a2) => [->>|neqxa2].
  + rewrite set2_add_mulr_neqiE //; [by rewrite eq_sym|].
    rewrite set2_add_mulr_neqiE //; [by rewrite eq_sym|by rewrite eq_sym|].
    rewrite set2_add_mulr_neqiE //; [by rewrite eq_sym|].
    by rewrite set2_add_mulr_eq1iE.
  case: (x = b2) => [->>|neqxb2].
  + rewrite set2_add_mulr_neqiE //; [by rewrite eq_sym|].
    rewrite set2_add_mulr_neqiE //; [by rewrite eq_sym|by rewrite eq_sym|].
    rewrite set2_add_mulr_neqiE //; [by rewrite eq_sym|by rewrite eq_sym|].
    by rewrite set2_add_mulr_eq2iE.
  rewrite get_set2_add_mulr_if //.
  case: (x = a1) => [->>|neqxa1].
  + rewrite set2_add_mulr_eq1iE //.
    rewrite set2_add_mulr_neqiE //.
    by rewrite set2_add_mulr_neqiE //; rewrite eq_sym.
  case: (x = b1) => [->>|neqxb1].
  + rewrite set2_add_mulr_eq2iE //.
    rewrite set2_add_mulr_neqiE //.
    by rewrite set2_add_mulr_neqiE //; rewrite eq_sym.
  by rewrite set2_add_mulr_neqiE // set2_add_mulr_neqiE.
qed.


(*-----------------------------------------------------------------------------*)

abbrev set2_mul_addr (p : Fq Array256.t, z : Fq, a b : int) =
  p.[a <- p.[a] + p.[b]].[b <- z * p.[a <- p.[a] + p.[b]].[b <- p.[a] - p.[a <- p.[a] + p.[b]].[b]].[b]].

lemma set2_mul_addr_eq1iE p z a b x :
  a <> b =>
  a \in range 0 256 =>
  x = a =>
  (set2_mul_addr p z a b).[x] = p.[a] + p.[b].
proof. by move => ? /mem_range ? eqxa; rewrite set_neqiE ?set_eqiE // eqxa. qed.

lemma set2_mul_addr_eq2iE p z a b x :
  a <> b =>
  b \in range 0 256 =>
  x = b =>
  (set2_mul_addr p z a b).[x] = z * (p.[a] - p.[b]).
proof. by move => ? /mem_range ? eqxb; rewrite set_eqiE // set_eqiE // set_neqiE // eq_sym. qed.

lemma set2_mul_addr_neqiE p z a b x :
  x <> a =>
  x <> b =>
  (set2_mul_addr p z a b).[x] = p.[x].
proof. by move => ? ?; rewrite !set_neqiE. qed.

lemma get_set2_mul_addr_if p z a b x :
  a \in range 0 256 =>
  b \in range 0 256 =>
  a <> b =>
  (set2_mul_addr p z a b).[x] =
  if x = a
  then p.[a] + p.[b]
  else if x = b
  then z * (p.[a] - p.[b])
  else p.[x].
proof.
  move => mem_a_range mem_b_range neq_ab.
  case: (x = a) => eqxa; [by rewrite set2_mul_addr_eq1iE|].
  case: (x = b) => eqxb; [by rewrite set2_mul_addr_eq2iE|].
  by rewrite set2_mul_addr_neqiE.
qed.

lemma set2_mul_addr_permiE f p z a b :
  is_perm f =>
  a \in range 0 256 =>
  b \in range 0 256 =>
  set2_mul_addr (perm f p) z a b =
  perm f (set2_mul_addr p z (f a) (f b)).
proof.
  move => is_perm_f mem_a_range mem_b_range.
  by rewrite !set_permiE // ?get_permiE //; apply mem_range.
qed.
  
lemma set2_mul_addr_set2_mul_addr_swap p z1 z2 a1 a2 b1 b2 :
  a1 \in range 0 256 =>
  a2 \in range 0 256 =>
  b1 \in range 0 256 =>
  b2 \in range 0 256 =>
  uniq [a1; a2; b1; b2] =>
  set2_mul_addr (set2_mul_addr p z1 a1 b1) z2 a2 b2 =
  set2_mul_addr (set2_mul_addr p z2 a2 b2) z1 a1 b1.
proof.
  move => mem_a1_range mem_a2_range mem_b1_range mem_b2_range.
  rewrite /= !negb_or => |> neqa neq1 neqa1b2 neqa2b1 neq2 neqb.
  rewrite tP => x /mem_range mem_x_range.
  rewrite get_set2_mul_addr_if //.
  case: (x = a2) => [->>|neqxa2].
  + rewrite set2_mul_addr_neqiE //; [by rewrite eq_sym|].
    rewrite set2_mul_addr_neqiE //; [by rewrite eq_sym|by rewrite eq_sym|].
    rewrite set2_mul_addr_neqiE //; [by rewrite eq_sym|].
    by rewrite set2_mul_addr_eq1iE.
  case: (x = b2) => [->>|neqxb2].
  + rewrite set2_mul_addr_neqiE //; [by rewrite eq_sym|].
    rewrite set2_mul_addr_neqiE //; [by rewrite eq_sym|by rewrite eq_sym|].
    rewrite set2_mul_addr_neqiE //; [by rewrite eq_sym|by rewrite eq_sym|].
    by rewrite set2_mul_addr_eq2iE.
  rewrite get_set2_mul_addr_if //.
  case: (x = a1) => [->>|neqxa1].
  + rewrite set2_mul_addr_eq1iE //.
    rewrite set2_mul_addr_neqiE //.
    by rewrite set2_mul_addr_neqiE //; rewrite eq_sym.
  case: (x = b1) => [->>|neqxb1].
  + rewrite set2_mul_addr_eq2iE //.
    rewrite set2_mul_addr_neqiE //.
    by rewrite set2_mul_addr_neqiE //; rewrite eq_sym.
  by rewrite set2_mul_addr_neqiE // set2_mul_addr_neqiE.
qed.

lemma tP_red (t1 t2: 'a Array256.t) :
  (forall i, i \in iotared 0 256 => t1.[i] = t2.[i]) => t1 = t2.
  rewrite tP => />H i Hi1 Hi2. smt(). qed.

lemma foldl_upd_range_i (upd: int -> 'a -> 'a) (r:'a Array256.t) n : forall j, n <= 256 =>
  (foldl (fun r i => r.[i <- upd i r.[i] ]) r (range 0 n)).[j] = if 0 <= j < n then upd j r.[j] else r.[j].
proof.
elim/natind: n => />.
(*n=0*)
move => n Hn1 j Hn2. rewrite range_geq => />. smt().
(*n>0*)
move => n Hn1 R j Hn2. rewrite rangeSr // foldl_rcons //=. rewrite R //. smt(). rewrite get_setE => />. smt(). rewrite R //. smt(). smt(). qed.

lemma foldl_upd_range (upd: int -> 'a -> 'a) (r:'a Array256.t) : 
  foldl (fun r i => r.[i <- upd i r.[i] ]) r (range 0 256) = init (fun i => upd i r.[i]).
proof.
rewrite tP => />i Hi1 Hi2. rewrite foldl_upd_range_i // initiE => />. rewrite ifT //. qed.
