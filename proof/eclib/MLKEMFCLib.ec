require import AllCore List IntDiv.

from Jasmin require import JModel.
from JazzEC require import Array128 Array160 Array256 Array32 Array16 Array768 Array1024 Array2304 Array4096 Array1536 Array320 Array384 Array960 Array1408 Array1152 WArray512 WArray128.

from CryptoSpecs require import GFq Rq VecMat Serialization Correctness768.
import Serialization768 VecMat768 PolyVec PolyMat KMatrix.
require import W16extra Montgomery.

import Zq.

from Jasmin require import JModel.

lemma aux16_0 x :
  16 <= x < 32 =>
   (W32.of_int 4294901760).[x] = true.
proof.
rewrite of_intwE => />. 
rewrite /int_bit => />.
case (x = 16); first by move =>  -> />. 
move => *;case (x = 17); first by move =>  -> />. 
move => *;case (x = 18); first by move =>  -> />. 
move => *;case (x = 19); first by move =>  -> />. 
move => *;case (x = 20); first by move =>  -> />. 
move => *;case (x = 21); first by move =>  -> />. 
move => *;case (x = 22); first by move =>  -> />. 
move => *;case (x = 23); first by move =>  -> />. 
move => *;case (x = 24); first by move =>  -> />. 
move => *;case (x = 25); first by move =>  -> />. 
move => *;case (x = 26); first by move =>  -> />. 
move => *;case (x = 27); first by move =>  -> />. 
move => *;case (x = 28); first by move =>  -> />. 
move => *;case (x = 29); first by move =>  -> />. 
move => *;case (x = 30); first by move =>  -> />. 
move => *;case (x = 31); first by move =>  -> />. 
by smt().
qed.

lemma aux16_1 x :
  0 <= x < 16 =>
   (W32.of_int 4294901760).[x] = false.
proof.
rewrite of_intwE => />. 
rewrite /int_bit => />. 
case (x = 0); first by move =>  -> />. 
move => *;case (x = 1); first by move =>  -> />. 
move => *;case (x = 2); first by move =>  -> />. 
move => *;case (x = 3); first by move =>  -> />. 
move => *;case (x = 4); first by move =>  -> />. 
move => *;case (x = 5); first by move =>  -> />. 
move => *;case (x = 6); first by move =>  -> />. 
move => *;case (x = 7); first by move =>  -> />. 
move => *;case (x = 8); first by move =>  -> />. 
move => *;case (x = 9); first by move =>  -> />. 
move => *;case (x = 10); first by move =>  -> />. 
move => *;case (x = 11); first by move =>  -> />. 
move => *;case (x = 12); first by move =>  -> />. 
move => *;case (x = 13); first by move =>  -> />. 
move => *;case (x = 14); first by move =>  -> />. 
move => *;case (x = 15); first by move =>  -> />. 
by smt().
qed.

lemma aux16_2 (a : W32.t) :
  (a `>>>` 16) + (of_int 4294901760)%W32
              = (a `>>>` 16) `|` (of_int 4294901760)%W32.
proof. 
rewrite orw_xpnd.
have -> : (a `>>>` 16) `&` (of_int 4294901760)%W32 = W32.of_int 0.
+ have ? : (0 <= to_uint (a `>>>` 16) < 65536) by 
    rewrite to_uint_shr => />; smt(divz_ge0 ltz_divLR pow2_32 W32.to_uint_cmp).
  apply W32.ext_eq =>  x xbnd.
  case (0 <= x < 16); 1: by move => smallx; rewrite andwE aux16_1 => /> /#.
  move => largex; rewrite /(`>>>`) /of_int /bits2w /= /int2bs /= /mkseq /= !initiE //=. 
  rewrite !(nth_map 0 false _ x (iota_ 0 32)); 1, 2: by smt(size_iota).
  by rewrite !nth_iota //=; smt(W32.get_out).
by ring.
qed.

(* FIX ME: Generalize and move to JWord *)
lemma SAR_sem16 (a : W32.t) : a `|>>` W8.of_int 16 = W32.of_int (to_sint a %/ 2^16).
proof.
rewrite /(`|>>`) to_sintE /smod sarE.
rewrite W8.of_uintK; apply W32.ext_eq => x x_b; rewrite initiE => />.
case (2147483648 <= to_uint a); last first. (* positive numbers *)
+ move => ab; rewrite W32.of_intwE x_b /= /int_bit /=. 
  rewrite /min  /= get_to_uint /= (modz_small _ 4294967296); 1: smt(W32.to_uint_cmp).
  case (31 < x + 16). (*high bits*)
  + move => hb /=;rewrite pdiv_small; 1: by smt(W32.to_uint_cmp).
    rewrite mod0z /=.
    have -> : to_uint a %/ 65536 %/ 2 ^ x = 0; last by smt(mod0z). 
    apply  (divz_eq0 (to_uint a %/ 65536) (2^x)); 1: by smt(gt0_pow2). 
    split; 1: by smt(divz_ge0 W32.to_uint_cmp).
    have /= ? : 2^15 <= 2^x by  apply StdOrder.IntOrder.ler_weexpn2l=> // /#.
    by smt(leq_div2r).
 move => /= lb.
 have -> : to_uint a %/ 2 ^ (x + 16) = to_uint a %/ 65536 %/ 2 ^ x; last by smt().
 rewrite -pow2_16 {1}(divz_eq (to_uint a) (2^16)) exprD_nneg //=; 1: smt().
 rewrite divmod_mul;
 by smt(divmod_mul gt0_pow2). 

move => neg.
rewrite divzDr //= -pow2_16 -to_uint_shr //=.
rewrite of_intS to_uintK /W32.([-]) /ulift1  aux16_2 orwE /=.
case (31 < x + 16); last by  move => x_tub; rewrite aux16_1 /= /#.
move => x_tlb; rewrite /min x_tlb aux16_0 /=; 1: by smt().
rewrite get_to_uint => />.
by smt(W32.to_uint_cmp pow2_32).
qed.

lemma aux10_0 x :
  6 <= x < 16 =>
   (W16.of_int 65472).[x] = true.
proof.
rewrite of_intwE /= /int_bit => />.
case (x = 6); first by move =>  -> />.
move => *;case (x = 7); first by move =>  -> />.
move => *;case (x = 8); first by move =>  -> />.
move => *;case (x = 9); first by move =>  -> />.
move => *;case (x = 10); first by move =>  -> />.
move => *;case (x = 11); first by move =>  -> />.
move => *;case (x = 12); first by move =>  -> />.
move => *;case (x = 13); first by move =>  -> />.
move => *;case (x = 14); first by move =>  -> />.
move => *;case (x = 15); first by move =>  -> />.
by smt().
qed.

lemma aux10_1 x :
  0 <= x < 6 =>
   (W16.of_int 65472).[x] = false.
proof.
rewrite of_intwE /= /int_bit => />.
case (x = 0); first by move =>  -> />.
move => *;case (x = 1); first by move =>  -> />.
move => *;case (x = 2); first by move =>  -> />.
move => *;case (x = 3); first by move =>  -> />.
move => *;case (x = 4); first by move =>  -> />.
move => *;case (x = 5); first by move =>  -> />.
by smt().
qed.

lemma aux10_2 (a : W16.t) :
  (a `>>>` 10) + (of_int 65472)%W16
              = (a `>>>` 10) `|` (of_int 65472)%W16.
proof.
rewrite orw_xpnd.
have -> : (a `>>>` 10) `&` (of_int 65472)%W16 = W16.of_int 0.
+ have ? : (0 <= to_uint (a `>>>` 10) < 1024) by
    rewrite to_uint_shr => />; smt(divz_ge0 ltz_divLR pow2_16 W16.to_uint_cmp).
  apply W16.ext_eq =>  x xb.
  case (0 <= x < 6); 1: by move => smallx; rewrite andwE aux10_1 => /> /#.
  move => largex; rewrite /(`>>>`) /of_int /bits2w /= /int2bs /= /mkseq /= !initiE //=. 
  rewrite !(nth_map 0 false _ x (iota_ 0 16)); 1, 2: by smt(size_iota).
  by rewrite !nth_iota //=; smt(W16.get_out).
by ring.
qed.

(* FIX ME: Generalize and move to JWord *)
lemma SAR_sem10 (a : W16.t) :
   a `|>>` W8.of_int 10 = W16.of_int (to_sint a %/ 2^10).
proof.
rewrite /(`|>>`) to_sintE /smod sarE.
rewrite W8.of_uintK; apply W16.ext_eq => x x_b; rewrite initiE => />.
case (32768 <= to_uint a); last first. (* positive numbers *)
+ move => ab; rewrite W16.of_intwE x_b /= /int_bit /=. 
  rewrite /min  /= get_to_uint /= (modz_small _ 65536); 1: smt(W16.to_uint_cmp).
  case (15 < x + 10). (*high bits*)
  + move => hb /=;rewrite pdiv_small; 1: by smt(W16.to_uint_cmp).
    rewrite mod0z /=.
    have -> : to_uint a %/ 1024 %/ 2 ^ x = 0; last by smt(mod0z). 
    apply  (divz_eq0 (to_uint a %/ 1024) (2^x)); 1: by smt(gt0_pow2). 
    split; 1: by smt(divz_ge0 W16.to_uint_cmp).
    have /= ? : 2^6 <= 2^x by  apply StdOrder.IntOrder.ler_weexpn2l=> // /#.
    by smt(leq_div2r).
 move => /= lb.
 have -> : to_uint a %/ 2 ^ (x + 10) = to_uint a %/ 1024 %/ 2 ^ x; last by smt().
 rewrite (_: 1024 = 2^10) // {1}(divz_eq (to_uint a) (2^10)) exprD_nneg //; 1: smt().
 rewrite divmod_mul;
 by smt(divmod_mul gt0_pow2). 

move => neg.
rewrite divzDr //= (_: 1024 = 2^10) // -to_uint_shr //=.
rewrite of_intS to_uintK /W16.([-]) /ulift1  aux10_2 orwE /=.
case (15 < x + 10); last by  move => x_tub; rewrite aux10_1 /= /#.
move => x_tlb; rewrite /min x_tlb aux10_0 /=; 1: by smt().
rewrite get_to_uint => />.
by smt(W16.to_uint_cmp pow2_16).
qed.


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
  r.[0 <- f0].[1 <- f1].[2 <- f2].[3 <- f3].[4 <- f4].[5 <- f5].[6 <- f6].[7 <- f7].[8 <- f8].[9 <- f9].[10 <- f10].[11 <- f11].[12 <- f12].[13 <- f13].[14 <- f14].[15 <- f15].[16 <- f16].[17 <- f17].[18 <- f18].[19 <- f19].[20 <- f20].[21 <- f21].[22 <- f22].[23 <- f23].[24 <- f24].[25 <- f25].[26 <- f26].[27 <- f27].[28 <- f28].[29 <- f29].[30 <- f30].[31 <- f31] = Array32.init f.
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

lemma  set_neqiE (t : coeff Array256.t) x y a :
  y <> x => t.[x <- a].[y] = t.[y].
proof. by rewrite get_set_if => /neqF ->. qed.

lemma init_id (r : 'a Array256.t) :
  Array256.init ("_.[_]" r) = r.
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

lemma tP_red256 (t1 t2: 'a Array256.t) :
  (forall i, i \in iotared 0 256 => t1.[i] = t2.[i]) => t1 = t2.
  rewrite tP => />H i Hi1 Hi2. smt(). qed.

lemma foldl_upd_range_i (upd: int -> 'a -> 'a) (r:'a Array256.t) n : forall j, n <= 256 =>
  (foldl (fun r i => r.[i <- upd i (r.[i])%Array256 ]) r (range 0 n)).[j] = if 0 <= j < n then upd j r.[j] else r.[j].
proof.
elim/natind: n => />.
(*n=0*)
move => n Hn1 j Hn2. rewrite range_geq => />. smt().
(*n>0*)
move => n Hn1 R j Hn2. rewrite rangeSr // foldl_rcons //=. rewrite R //. smt(). rewrite get_setE => />. smt(). rewrite R //. smt(). smt(). qed.

lemma foldl_upd_range (upd: int -> 'a -> 'a) (r:'a Array256.t) : 
  foldl (fun r i => r.[i <- upd i (r.[i])%Array256 ]) r (range 0 256) = Array256.init (fun i => upd i r.[i]).
proof.
rewrite tP => />i Hi1 Hi2. rewrite foldl_upd_range_i // initiE => />. rewrite ifT //. qed.

op lift_array2304 (p : W16.t Array2304.t) =
  Array2304.map (fun x => incoeff (W16.to_sint x)) p.

op [a] subarray768(x: 'a Array2304.t, i : int) : 'a Array768.t =
    Array768.init (fun (k : int) => x.[768 * i + k]).

op pos_bound2304_cxq (coefs : W16.t Array2304.t) (l u c : int) : bool =
  forall (k : int), l <= k && k < u => bpos16 coefs.[k] (c * q).


op pos_bound4096_cxq (coefs : W16.t Array4096.t) (l u c : int) : bool =
  forall (k : int), l <= k && k < u => bpos16 coefs.[k] (c * q).

op lift_array4096 (p : W16.t Array4096.t) =
  Array4096.map (fun x => incoeff (W16.to_sint x)) p.

op [a] subarray1024(x: 'a Array4096.t, i : int) : 'a Array1024.t =
    Array1024.init (fun (k : int) => x.[1024 * i + k]).

op lift_array256 (p : W16.t Array256.t) =
  Array256.map (fun x => incoeff (W16.to_sint x)) p.

op lift_array128 (p : W16.t Array128.t) =
  Array128.map (fun x => incoeff (W16.to_sint x)) p.
op signed_bound_cxq(coefs : W16.t Array256.t, l u c : int) : bool =
   forall k, l <= k < u => b16 coefs.[k] (c*q).

op minimum_residues(zetas : W16.t Array128.t) : bool =
   forall k, 0 <= k < 128 => bpos16  zetas.[k] q.

op pos_bound256_cxq (coefs : W16.t Array256.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

op pos_bound256_b (coefs : W16.t Array256.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] b.

op touches (m m' : global_mem_t) (p : address) (len : int) =
    forall i, !(0 <= i < len) => m'.[p + i] = m.[p + i].

op load_array32(m : global_mem_t, p : address) : W8.t Array32.t = 
      Array32.init (fun i => m.[p + i]).

op load_array128(m : global_mem_t, p : address) : W8.t Array128.t = 
      Array128.init (fun i => m.[p + i]).

op load_array160(m : global_mem_t, p : address) : W8.t Array160.t = 
      Array160.init (fun i => m.[p + i]).

op load_array320(m : global_mem_t, p : address) : W8.t Array320.t = 
      Array320.init (fun i => m.[p + i]).

op load_array384(m : global_mem_t, p : address) : W8.t Array384.t = 
      Array384.init (fun i => m.[p + i]).

op load_array1536(m : global_mem_t, p : address) : W8.t Array1536.t = 
      Array1536.init (fun i => m.[p + i]).

op valid_ptr(p : int, o : int) = 0 <= o => 0 <= p /\ p + o < W64.modulus.

op array_mont (p : coeff Array128.t) =
  Array128.map (fun x => x *  (incoeff W16.modulus)) p.

op array_mont_inv (p : coeff Array128.t) =
  let vv = Array128.map (fun x => x *  (incoeff W16.modulus)) p in
      vv.[127 <- p.[127] * (incoeff W16.modulus) * (incoeff W16.modulus)].


(* AUX *)

op lift_array768 (p : W16.t Array768.t) =
  Array768.map (fun x => incoeff (W16.to_sint x)) p.

op lift_array1024 (p : W16.t Array1024.t) =
  Array1024.map (fun x => incoeff (W16.to_sint x)) p.


op signed_bound768_cxq (coefs : W16.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => b16 coefs.[k] (c * q).

op signed_bound1024_cxq (coefs : W16.t Array1024.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => b16 coefs.[k] (c * q).

op pos_bound768_cxq (coefs : W16.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

op pos_bound1024_cxq (coefs : W16.t Array1024.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

op pos_bound768_b (coefs : W16.t Array768.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] b.

lemma lift_array256_incoeff (a : W16.t Array256.t) k :
  0 <= k < 256 =>
  incoeff (to_sint a.[k]) = (lift_array256 a).[k].
proof. by move => H; rewrite /lift_array256 mapE /= initE H. qed.

op load_array960 (m : global_mem_t) (p : address) : W8.t Array960.t = 
  (Array960.init (fun (i : int) => m.[p + i])).

op load_array1408 (m : global_mem_t) (p : address) : W8.t Array1408.t = 
  (Array1408.init (fun (i : int) => m.[p + i])).

op load_array1152 (m : global_mem_t) (p : address) : W8.t Array1152.t = 
  (Array1152.init (fun (i : int) => m.[p + i])).


(* TODO: write aux lemma to deal w/ subarrays cleanly *)

(* END AUX *)

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
  a = (W16.of_int (as_sint (incoeff (to_sint a)))).
proof.
rewrite qE /=; move => [#] bndl bndh.
rewrite /as_sint fun_if /= !incoeffK qE /=.
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

lemma bits8_W2u8 ws i :
  W2u8.pack2_t ws \bits8 i = if 0 <= i < 2 then ws.[i] else W8.zero.
rewrite wordP => j Hj. rewrite W2u8.bits8iE //. case (0 <= i < 2) => Hi.
rewrite pack2wE /#. rewrite get_out /#. qed.

lemma bits16_W16u16 ws i :
  W16u16.pack16_t ws \bits16 i = if 0 <= i < 16 then ws.[i] else W16.zero.
rewrite wordP => j Hj. rewrite W16u16.bits16iE //. case (0 <= i < 16) => Hi.
rewrite pack16wE /#. rewrite get_out /#. qed.

(* MOVE TO: JWord_array.ec *)
lemma get16_set256E t x y w :
 0 <= x => 32*(x + 1) <= 512 =>
 get16 (WArray512.set256 t x w) y
 = if 32*x <= 2*y < 32*(x+1)
   then w \bits16 (y - 16*x)
   else get16 t y.
proof.        
move=> hx hs; rewrite get16E.
case: ( 32*x <= 2*y < 32*(x+1) ). 
 rewrite mulrDr /= => Hy.
 rewrite -(W2u8.unpack8K (w \bits16 (y-16*x))) unpack8E; congr.
 by rewrite -W2u8.Pack.all_eqP /all_eq /= -/WArray512.get8
      !get8_set256_directE 1..4:/# Hy /= /#.
rewrite mulrDr /= => Hy.
rewrite -(W2u8.unpack8K (get16 t y)) unpack8E; congr.
rewrite -W2u8.Pack.all_eqP /all_eq /= -/WArray512.get8
      !get8_set256_directE 1..4:/#.
by rewrite  Hy /= get16E pack2bE // ifF /#. 
qed.

lemma set256_directE (t:WArray512.t) (i:int) (w:W256.t) :
  i %% 32 = 0 => 
  set256_direct t i w = set256 t (i%/32) w.
  smt(). qed.

lemma get16_init16 f i:
 0 <= 2*i < 512 =>
 get16 (WArray512.init16 f) i
 = f i.
proof.
move => Hi.
rewrite get16E /init16 /=.
rewrite -(W2u8.unpack8K (f i)) /unpack8K; congr.
by rewrite -W2u8.Pack.all_eqP /all_eq /= !initiE /#.
qed.
(* END MOVE *)

lemma pack2_bits8 (w: W16.t):
 pack2 [w \bits8 0; w \bits8 1] = w.
proof.
rewrite -{-1}(W2u8.unpack8K w) unpack8E; congr.
by apply W2u8.Pack.all_eq_eq; rewrite /all_eq.
qed.


(** Aux *)
op valid_disj_reg(p1 : address, l1 : int, p2 : address, l2 : int) =
      valid_ptr p1 l1 /\ valid_ptr p2 l2 /\ ((p1 + l1) <= p2  || (p2 + l2) <= p1).

lemma mergebytes b1 b2 :
  to_uint (zeroextu16 b1 `|` (zeroextu16 b2 `&` (of_int 15)%W16 `<<` (of_int 8)%W8)) =
  to_uint b1 + 256 * (to_uint b2 %% 16).
proof.
rewrite (_:15 = 2^4-1) // !W16.and_mod //= /(`<<`) /=.
rewrite orw_disjoint. 
+ rewrite /W16.(`&`); apply W16.ext_eq => k kb.
  rewrite !map2iE // zerowE.
  rewrite to_uint_zeroextu16.
  case (!(8 <= k < 16)); first by smt(W16.get_out).
  move => /= ?; rewrite !get_to_uint kb /= (_: 0 <= k - 8 && k - 8 < 16) 1:/# /=.  
  rewrite !of_uintK /= (modz_small _ 65536) /=; 1:smt(W8.to_uint_cmp pow2_8).
  rewrite (modz_small _ 65536) 1:/# /=.
  move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 8 k _) => //= ;1:smt().
  move => *;rewrite divz_small; 1: by smt(pow2_8 W8.to_uint_cmp). 
  by smt(mod0z).
rewrite !to_uint_zeroextu16 /= to_uintD_small /= to_uint_zeroextu16 to_uint_shl //=.
+ rewrite of_uintK /= (modz_small (to_uint b2 %% 16) 65536); 1: smt().
  by rewrite (modz_small _ 65536);  smt(W8.to_uint_cmp pow2_8).
rewrite of_uintK /= (modz_small (to_uint b2 %% 16) 65536); 1: smt().
by rewrite (modz_small _ 65536);  smt(W8.to_uint_cmp pow2_8).
qed.

lemma mergebytes2 b1 b2 :
to_uint ((zeroextu16 b1 `>>` (of_int 4)%W8) `|` (zeroextu16 b2 `<<` (of_int 4)%W8)) =
to_uint b1 %/ 16 + 16 * to_uint b2.
proof.
rewrite /(`<<`) /(`>>`) /=.
rewrite orw_disjoint. 
+ rewrite /W16.(`&`); apply W16.ext_eq => k kb.
  by rewrite !map2iE // zerowE /(`>>>`) /(`<<<`) !initiE //= !zeroextu16_bit /#.
by rewrite to_uintD_small /= to_uint_shl //= to_uint_shr //= 
    !to_uint_zeroextu16 /=;smt(W8.to_uint_cmp pow2_8).
qed.

lemma extract_msb  (x : W64.t): (x `>>` W8.of_int 63 = W64.zero) =  !x.[63].
proof.
rewrite /(`>>`) /= wordP /=.  
have -> : (forall (i0 : int), 0 <= i0 && i0 < 64 => ((0 <= i0 && i0 < 64) && x.[i0 + 63]) = false) = ((x.[0 + 63] = false)  /\ (forall (i0 : int), 1 <= i0 && i0 < 64 => x.[i0 + 63] = false)); 1: by smt().
by have ? : (forall (i0 : int), 1 <= i0 && i0 < 64 => (x.[i0 + 63] = false)); smt(W64.get_out).
qed.
