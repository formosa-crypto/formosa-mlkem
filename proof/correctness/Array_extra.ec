require import AllCore List.
require import Array32.
require import GFq.

import Zq.

from Jasmin require import JUtils.

lemma tP_red32 (t1 t2: 'a Array32.t) :
  (forall i, i \in iotared 0 32 => t1.[i] = t2.[i]) => t1 = t2.
  rewrite tP => />H i Hi1 Hi2. smt(). qed.

lemma initEq32 (f g: int -> 'a) : 
   (Array32.init f = Array32.init g) <=> forall i, 0 <= i < 32 => f i = g i.
   rewrite tP => />. split.
   move => H i Hi1 Hi2. move :(H i). rewrite Hi1 Hi2 !initE /= Hi1 Hi2 => />.
   move => H i Hi1 Hi2. rewrite !initE /= Hi1 Hi2 H => />.
   qed.

lemma initSet (r : 'a Array32.t) (f : int -> 'a) f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 f20 f21 f22 f23 f24 f25 f26 f27 f28 f29 f30 f31 :
  f0 = f 0 => f1 = f 1 => f2 = f 2 => f3 = f 3 => f4 = f 4 => f5 = f 5 => f6 = f 6 => f7 = f 7 => f8 = f 8 => f9 = f 9 => f10 = f 10 => f11 = f 11 => f12 = f 12 => f13 = f 13 => f14 = f 14 => f15 = f 15 => f16 = f 16 => f17 = f 17 => f18 = f 18 => f19 = f 19 => f20 = f 20 => f21 = f 21 => f22 = f 22 => f23 = f 23 => f24 = f 24 => f25 = f 25 => f26 = f 26 => f27 = f 27 => f28 = f 28 => f29 = f 29 => f30 = f 30 => f31 = f 31 =>
  r.[0 <- f0].[1 <- f1].[2 <- f2].[3 <- f3].[4 <- f4].[5 <- f5].[6 <- f6].[7 <- f7].[8 <- f8].[9 <- f9].[10 <- f10].[11 <- f11].[12 <- f12].[13 <- f13].[14 <- f14].[15 <- f15].[16 <- f16].[17 <- f17].[18 <- f18].[19 <- f19].[20 <- f20].[21 <- f21].[22 <- f22].[23 <- f23].[24 <- f24].[25 <- f25].[26 <- f26].[27 <- f27].[28 <- f28].[29 <- f29].[30 <- f30].[31 <- f31] = init f.
move => -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> ->. apply tP_red32 => /> i.
do 31!(move => Hi; case Hi => |>). qed.


lemma tP_red128 (t1 t2: 'a Array128.t) :
  (forall i, i \in iotared 0 128 => t1.[i] = t2.[i]) => t1 = t2.
  rewrite tP => />H i Hi1 Hi2. smt(). qed.

lemma tP_red16 (t1 t2: 'a Array16.t) :
  (forall i, i \in iotared 0 16 => t1.[i] = t2.[i]) => t1 = t2.
  rewrite tP => />H i Hi1 Hi2. smt(). qed.

lemma initEq16 (f g: int -> 'a) : 
   (Array16.init f = Array16.init g) <=> forall i, 0 <= i < 16 => f i = g i.
   rewrite tP => />. split.
   move => H i Hi1 Hi2. move :(H i). rewrite Hi1 Hi2 !initE /= Hi1 Hi2 => />.
   move => H i Hi1 Hi2. rewrite !initE /= Hi1 Hi2 H => />.
   qed.


(*-----------------------------------------------------------------------------*)

lemma nosmt set_neqiE (t : coeff Array256.t) x y a :
  y <> x => t.[x <- a].[y] = t.[y].
proof. by rewrite get_set_if => /neqF ->. qed.

lemma init_id (r : 'a Array256.t) :
  init ("_.[_]" r) = r.
rewrite tP => />i Hi1 Hi2. rewrite initiE //. qed.

(*-----------------------------------------------------------------------------*)

op is_perm f =
  perm_eq (range 0 256) (map f (range 0 256)).

op perm f (t : coeff Array256.t) =
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

abbrev set2_add_mulr (p : coeff Array256.t, z : coeff, a b : int) =
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

abbrev set2_mul_addr (p : coeff Array256.t, z : coeff, a b : int) =
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

lemma tP_red236 (t1 t2: 'a Array256.t) :
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


lemma matrixcols (m : 'a Array2304.t) (f : 'a -> 'b) i j : 0 <= i < 3 => 0<=j <3 =>
    Array256.map f (subarray256 ((Array768.init ((fun (i_0 : int) => m.[j*768 + i_0])))) i) =
                      (subarray256 (subarray768 (map f m) j) i).
move => ib jb;rewrite /subarray256 /subarray768 tP => k kb.
by rewrite mapiE //= !initiE //= !initiE 1,2:/# /= mapiE /#.
qed. 

lemma subliftsub (a : W16.t Array768.t) i k: 0<=i <3 => 0<=k<256 =>
    (lift_array256 (subarray256 a i)).[k] = (lift_array768 a).[256*i+k].
move => ib kb; rewrite /subarray256 /lift_array256 /lift_array768.
by rewrite !mapiE 1,2:/# /= !initiE /#.
qed.

lemma subsublift (a : W16.t Array2304.t) i j k:
  0 <= i < 3 => 0<= j < 3 => 0 <=  k < 256 =>
  (subarray256 (subarray768 (lift_array2304 a) i) j).[k] =
(lift_array768 ((init (fun x => a.[i*768 + x])))%Array768).[256 * j + k].
move => *; rewrite /subarray256 /subarray768 /lift_array2304 /lift_array768.
by rewrite !mapiE 1:/# /= !initiE 1,2:/# /= !initiE 1:/# /= mapiE /#.
qed.

lemma liftarrayvector a i k : 0<=i<3 => 0<=k<256 =>
         (lift_vector a).[i].[k] = (lift_array768 a).[256*i+k].
move => ib lb; rewrite /lift_vector /lift_array768 offunvE // mapiE 1:/# /=.
by rewrite /lift_array256 /subarray256 mapiE //= initiE //=.
qed.

op unlift_matrix(a : matrix) = Array2304.init 
   (fun i => W16.of_int (asint a.[i %/ 768,i %% 768 %/ 256].[i %% 256])).

lemma matrix_unlift a : 
    lift_matrix (unlift_matrix a) = a /\
    pos_bound2304_cxq (unlift_matrix a) 0 2304 2.
proof.
split. 
+ rewrite /lift_matrix /unlift_matrix eq_matrixP => i j bounds.
  rewrite offunmE //= /subarray256 /subarray768 /lift_array2304 /= tP => k kb.
  rewrite initiE //= initiE 1:/# /= mapiE 1:/# /= initiE 1:/# /= /to_sint /smod /=.
  rewrite !of_uintK /= !(modz_small _ 65536); 1: smt(rg_asint). 
  rewrite !(mulzC 768) !(edivz_eq) 1:/# !(emodz_eq) 1:/# fun_if !asintK. 
  rewrite !(mulzC 256) !(edivz_eq) 1:/#. 
  rewrite (_: i*768 = (3*i)*256) 1:/# !modzMDl.
  by smt(rg_asint).
rewrite /unlift_matrix /pos_bound2304_cxq => k kb; rewrite initiE //=.
rewrite to_sint_unsigned.
+ rewrite /to_sint of_uintK /= modz_small; 1: by smt(rg_asint). 
  by rewrite /smod /=; smt(rg_asint qE).
rewrite of_uintK /= modz_small; 1: by smt(rg_asint). 
  by rewrite /smod /=; smt(rg_asint qE).
qed.

op unlift_vector(a : vector) = 
   Array768.init (fun i => W16.of_int (as_sint a.[i %/ 256].[i%%256])).

lemma vector_unlift a : 
    lift_vector (unlift_vector a) = a /\
    signed_bound768_cxq (unlift_vector a) 0 768 1.
proof.
split. 
+ rewrite /lift_vector /unlift_vector eq_vectorP => i ib.
  rewrite offunvE //= /subarray256 /lift_array256 /= tP => k kb.
  rewrite mapiE //= initiE //= initiE //= 1:/# /to_sint /smod /=.
  rewrite !of_uintK /=; rewrite /as_sint qE /=.
  by smt(rg_asint asintK).

rewrite /unlift_vector /signed_bound768_cxq => k kb; rewrite initiE //=.
rewrite /to_sint /smod /= !of_uintK /= /as_sint qE /=.
by smt(rg_asint).
qed.

op unlift_poly(a : poly) = Array256.init (fun i => W16.of_int (as_sint a.[i])).

lemma poly_unlift a : 
    lift_array256 (unlift_poly a) = a /\
    signed_bound_cxq (unlift_poly a) 0 256 1.
proof.
split. 
+ rewrite /lift_array256 /unlift_poly /= tP => k kb.
  rewrite mapiE //= initiE //= /to_sint /smod /=.
  rewrite !of_uintK /=; rewrite /as_sint qE /=.
  by smt(rg_asint asintK).

rewrite /unlift_poly /signed_bound_cxq => k kb; rewrite initiE //=.
rewrite /to_sint /smod /= !of_uintK /= /as_sint qE /=.
by smt(rg_asint).
qed.

lemma inFq_to_sint (a : W16.t) :
  -(q-1)%/ 2 < to_sint a < (q-1)%/ 2 =>
  a = (W16.of_int (as_sint (inFq (to_sint a)))).
proof.
rewrite qE /=; move => [#] bndl bndh.
rewrite /as_sint fun_if /= !inFqK qE /=.
case(0<= to_sint a).
+ move => ?; rewrite !modz_small 1:/#.
  have -> : !(1664 < to_sint a) by smt().
  by rewrite to_sint_unsigned 1:/# to_uintK.
+ move => ?; pose x := - (to_sint a); have -> : to_sint a = -x by ring.
  have xbnd : 0 < x < 1664 by smt(). 
  rewrite modNz 1:/# //= !modz_small 1:/# /=.
  have -> /= : 1664 < 3328 - (x - 1) by smt().
  have -> : a = W16.of_int (to_sint a); last by ring.
  rewrite /to_sint /smod fun_if /= of_intS to_uintK.
  case(32768 <= to_uint a); 2:auto.
  by move => *; ring.
qed.

