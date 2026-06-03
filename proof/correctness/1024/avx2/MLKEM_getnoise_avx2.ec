(* Ref-free AVX2 noise sampling machinery.
   Builds the chain
     Jkem1024_avx2.M._poly_getnoise_eta1_4x  ~  4x cbd2sample (PRF seed nonce_i)
   without dragging ref-Jasmin via AuxMLKEM / ref's _poly_getnoise.

   This file relocates pure W8 bit-algebra lemmas (parallel_noisesum_low/high
   and their dependencies) from proof/correctness/768/ref/MLKEM_InnerPKE.ec,
   where they were historically proved.  The lemma bodies are verbatim copies. *)

require import AllCore IntDiv List.
from Jasmin require import JModel JUtils.
from JazzEC require import Array8 Array16 Array32 Array33 Array128 Array256.
from JazzEC require import WArray128.
from JazzEC require import Jkem1024_avx2.
from Spec require import GFq Rq Sampling Symmetric InnerPKE1024_Op.
require import MLKEMFCLib NTT_AVX_Fq AVX2_Ops Montgomery16.
import MLKEMFCLib1024.
require import MLKEM_keccak_avx2.

import Zq.

(* ============================================================
   Pure W8 helpers (relocated from ref/MLKEM_InnerPKE.ec).
   ============================================================ *)

lemma sigextu16_to_sint (a : W8.t) : W16.to_sint (sigextu16 a) = to_sint a.
proof.
rewrite /sigextu16 of_sintK /smod /=.
case (0 <= to_sint a).
+ by smt(modz_small W8.to_uint_cmp pow2_8).
move => *.
pose x := -to_sint a; have ->: to_sint a = -x by auto.
by rewrite !modNz; smt(modz_small W8.to_uint_cmp pow2_8).
qed.

(* Arithmetic rearrangements used inside even85bits. *)
lemma rearrange1 a b c d :
  a + 4 * b + 16 * c + 64 * d = (32*d + 8*c + 2*b)*2 + a by ring.
lemma rearrange2 a b c d :
  a + 4 * b + 16 * c + 64 * d = (16*d + 4*c + b)*4 + a by ring.
lemma rearrange3 a b c d :
  a + 4 * b + 16 * c + 64 * d = (8*d + 2*c)*8 + (b * 4 + a) by ring.
lemma rearrange4 a b c d :
  a + 4 * b + 16 * c + 64 * d = (4*d + c)*16 + (b * 4 + a) by ring.
lemma rearrange5 a b c d :
  a + 4 * b + 16 * c + 64 * d = (2*d)*32 + (16*c + b * 4 + a) by ring.
lemma rearrange6 a b c d :
  a + 4 * b + 16 * c + 64 * d = d*64 + (16*c + b * 4 + a) by ring.

(* 0x55 = 0b01010101 = "even" bits.  Mask-and-or characterization. *)
lemma even85bits a :
   a `&` W8.of_int 85 =
          W8.of_int (b2i a.[0] + 4*b2i a.[2] + 16*b2i a.[4] + 64*b2i a.[6]).
proof.
apply W8.ext_eq => x xb; rewrite /W8.(`&`) map2E /= initiE //= /W8.int_bit /= /b2i /=. 
case (x = 0); 1: by move => -> /=; rewrite (modz_small _ 256); smt(mod2_b2i).
case (x = 1); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange1 edivz_eq /#.
case (x = 2); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange2 edivz_eq;smt(mod2_b2i).
case (x = 3); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange3 edivz_eq /#.
case (x = 4); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange4 edivz_eq;smt(mod2_b2i).
case (x = 5); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange5 edivz_eq /#.
case (x = 6); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange6 edivz_eq;smt(mod2_b2i).
move => *; have -> /= : x = 7 by smt().
by rewrite (modz_small _ 256) /#.
qed.

lemma nice_shift (a : W8.t) i :
   1 <= i < 8 => b2i a.[i] = b2i (a `>>>` 1).[i-1] by smt(shrwE).

lemma odd85bits (a : W8.t) :
  (a `>>>` 1) `&` W8.of_int 85 =
          W8.of_int (b2i a.[1] + 4*b2i a.[3] + 16*b2i a.[5] + 64*b2i a.[7]).
proof.
rewrite (nice_shift a 1) // (nice_shift a 3) // (nice_shift a 5) // (nice_shift a 7) //.
by apply even85bits.
qed.

lemma mask85_sum (a : W8.t) (i : int) :
  0 <= i < 4 =>
      to_uint ((((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8)) `>>` W8.of_int (2*i)) %% 4 =
      b2i a.[2*i] + b2i a.[2*i + 1].
proof.
move=> hi.
rewrite /(`>>`)   W8.to_uint_small /= 1:/#.
rewrite (modz_small (2*i)) 1:/# W8.to_uint_shr 1:/#.
rewrite to_uintD modz_pow2_div 1:/#.
have -> : 4 = 2^2 by done.
rewrite JUtils.modz_mod_pow2.
have -> : min (`|8 - 2 * i|) (`|2|) = 2 by smt().
rewrite odd85bits even85bits !W8.to_uint_small /= 1,2:/#.
rewrite -(W8.to_uintK' a).
have := W8.to_uint_cmp a.
move: (to_uint a) => {a} x hx.
rewrite !W8.of_intwE /=.
move /mem_range: hi; rewrite /range -JUtils.iotaredE.
apply: List.allP i => /=.
move /mem_range: hx; rewrite /range -JUtils.iotaredE.
apply: List.allP x.
by cbv delta.
qed.

(* The noise function lemmas. *)
lemma parallel_noisesum_low (a : W8.t) :
  to_uint ((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8) %% 4 -
  to_uint ((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8 `>>` (of_int 2)%W8) %% 4 =
     b2i a.[0] + b2i a.[1] - (b2i a.[2] + b2i a.[3]).
proof.
have -> : to_uint ((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8) %% 4 =
          to_uint (((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8) `>>` W8.of_int 0) %% 4
  by rewrite /(`>>`) /= to_uint_shr //=.
by move : (mask85_sum a 0) => /= ->; move : (mask85_sum a 1) => /= ->.
qed.

lemma parallel_noisesum_high (a : W8.t) :
  to_uint ((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8 `>>` (of_int 4)%W8) %% 4 -
  to_uint ((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8 `>>` (of_int 6)%W8) %% 4 =
    b2i a.[4] + b2i a.[5] - (b2i a.[6] + b2i a.[7]).
proof.
by move : (mask85_sum a 2) => /= ->; move : (mask85_sum a 3) => /= ->.
qed.

(* ============================================================
   noise_coef + AuxMLKEMAvx2 module (relocated from OLD
   MLKEM_InnerPKE_avx2.ec).  Ref-free: uses only Jkem1024_avx2.M's
   _shake256_128_33 (AVX2 Jasmin) inside _poly_getnoise.
   ============================================================ *)

(* int value of jth noise coefficient *)
op noise_coef (bytes: W8.t Array128.t) (j: int): int =
  let b = bytes.[j%/2] in b2i b.[j%%2*4] + b2i b.[j%%2*4+1] - (b2i b.[j%%2*4+2] + b2i b.[j%%2*4+3]).

(* === AVX2 cbd algebra chain (relocated from OLD MLKEM_InnerPKE_avx2.ec lines 153-568). === *)

op B2Ri (bytes: W8.t Array128.t) (j: int): W256.t =
 get256 (WArray128.init8 (fun i => bytes.[i])) j.

lemma bytes_getR (bytes: W8.t Array128.t) (k: int):
 0 <= k && k < 128 =>
 bytes.[k] = B2Ri bytes (k %/ 32) \bits8 (k %% 32).
proof.
move=> Hk; rewrite /B2Ri /get256_direct pack32bE 1:/# initiE 1:/# /=.
by rewrite mulrC -divz_eq /init8 initiE.
qed.

abbrev mask55u256 = VPBROADCAST_8u32 (W32.of_int 1431655765).
abbrev mask33u256 = VPBROADCAST_8u32 (W32.of_int 858993459).
abbrev mask03u256 = VPBROADCAST_8u32 (W32.of_int 50529027).
abbrev mask0Fu256 = VPBROADCAST_8u32 (W32.of_int 252645135).

abbrev mask55u16 = W16.of_int 21845. (* 21845 = 0x5555 *)
abbrev mask33u16 = W16.of_int 13107. (* 13107 = 0x3333 *)
abbrev mask03u16 = W16.of_int 771. (* 771 = 0x0303 *)
abbrev mask0Fu16 = W16.of_int 3855. (* 3855 = 0x0F0F *)

abbrev mask55u8 = W8.of_int 85. (* 85 = 0x55 *)
abbrev mask33u8 = W8.of_int 51. (* 51 = 0x33 *)
abbrev mask03u8 = W8.of_int 3. (* 3 = 0x03 *)
abbrev mask0Fu8 = W8.of_int 15. (* 15 = 0x0F *)

lemma mask55_bits16 k:
 0 <= k < 16 =>
 mask55u256 \bits16 k = mask55u16.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits16_W8u32 Hk  /= get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%2 \in iota_ 0 2) by smt(mem_iota).
by move: (k%%2); rewrite -allP -iotaredE /= W2u16.bits16_div .
qed.

lemma mask55_bits8 k:
 0 <= k < 32 =>
 mask55u256 \bits8 k = mask55u8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div.
qed.

lemma mask33_bits16 k:
 0 <= k < 16 =>
 mask33u256 \bits16 k = mask33u16.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits16_W8u32 Hk  get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%2 \in iota_ 0 2) by smt(mem_iota).
by move: (k%%2); rewrite -allP -iotaredE /= W2u16.bits16_div .
qed.

lemma mask33_bits8 k:
 0 <= k < 32 =>
 mask33u256 \bits8 k = mask33u8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk  get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div .
qed.

lemma mask03_bits8 k:
 0 <= k < 32 =>
 mask03u256 \bits8 k = mask03u8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk  get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div .
qed.

lemma mask0F_bits16 k:
 0 <= k < 16 =>
 mask0Fu256 \bits16 k = mask0Fu16.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits16_W8u32 Hk  get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%2 \in iota_ 0 2) by smt(mem_iota).
by move: (k%%2); rewrite -allP -iotaredE /= W2u16.bits16_div .
qed.

lemma mask0F_bits8 k:
 0 <= k < 32 =>
 mask0Fu256 \bits8 k = mask0Fu8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk  get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div .
qed.

require import W8extra.
lemma VPSRL1_ANDmask55 w k:
 0 <= k < 32 =>
 mask55u256 `&` (VPSRL_16u16 w (W128.of_int 1)) \bits8 k
 = mask55u8 `&` ((w \bits8 k) `>>` (W8.of_int 1)).
proof.
move=> Hk.
rewrite {1}(_:k=2*(k%/2) + (k%%2)); first smt(divz_eq).
rewrite -W256_bits16_bits8 1:/# andb16E /VPSRL_16u16 mapbE 1:/# /=.
rewrite W256_bits16_bits8 1:/# mask55_bits8 1:/#.
apply wordP_red. rewrite -allP /=.
have: (k\in iota_ 0 32) by smt(mem_iota).
by move: {Hk} k; rewrite -allP -iotaredE /= /(`>>`)  !W8.shrwE /int_bit /=.
qed.

lemma VPSRL2_ANDmask33 w k:
 0 <= k < 32 =>
 mask33u256 `&` (VPSRL_16u16 w (W128.of_int 2)) \bits8 k
 = mask33u8 `&` ((w \bits8 k) `>>` (W8.of_int 2)).
proof.
move=> Hk.
rewrite {1}(_:k=2*(k%/2) + (k%%2)); first smt(divz_eq).
rewrite -W256_bits16_bits8 1:/# andb16E /VPSRL_16u16 mapbE 1:/# /=.
rewrite W256_bits16_bits8 1:/# mask33_bits8 1:/#.
apply W8extra.wordP_red. rewrite -allP /=.
have: (k\in iota_ 0 32) by smt(mem_iota).
by move: {Hk} k; rewrite -allP -iotaredE /= /(`>>`) !W8.shrwE /int_bit /=.
qed.

lemma VPSRL4_ANDmask0F w k:
 0 <= k < 32 =>
 VPAND_256 mask0Fu256 (VPSRL_16u16 w (W128.of_int 4)) \bits8 k
 = mask0Fu8 `&` ((w \bits8 k) `>>` (W8.of_int 4)).
proof.
move=> Hk.
rewrite {1}(_:k=2*(k%/2) + (k%%2)); first smt(divz_eq).
rewrite -W256_bits16_bits8 1:/# andb16E /VPSRL_16u16 mapbE 1:/# /=.
rewrite W256_bits16_bits8 1:/# mask0F_bits8 1:/#.
apply W8extra.wordP_red. rewrite -allP /=.
have: (k\in iota_ 0 32) by smt(mem_iota).
by move: {Hk} k; rewrite -allP -iotaredE /= /(`>>`) !W8.shrwE /int_bit /=.
qed.

lemma to_uint_mask33 (w:W8.t):
 to_uint (mask33u8 `&` w)
 = to_uint w %% 4 + to_uint w %/ 16 %% 4 * 16.
proof.
have ->: mask33u8 = (mask03u8 `<<<` 4) `|` mask03u8.
 apply W8.wordP => k; rewrite -mem_range /range /=. 
 by move: k; apply/List.allP; rewrite -iotaredE /int_bit /=.
rewrite andwC andw_orwDr orw_disjoint.
 apply W8.wordP => k; rewrite -mem_range /range /=. 
 by move: k; apply/List.allP; rewrite -iotaredE /int_bit /=.
have ->: w `&` (mask03u8 `<<<` 4)
        = ((w `>>>` 4) `&` W8.masklsb (6-4)) `<<<` 4.
rewrite -shlw_andmask 1:/# shrl_andmaskN 1:/# -andwA /=.
congr.
rewrite /max /=.
 apply W8.wordP => k; rewrite -mem_range /range /=. 
 by move: k; apply/List.allP; rewrite -iotaredE /int_bit /=.
have E1: to_uint (w `&` mask03u8) = to_uint w %% 4.
 by rewrite (W8.to_uint_and_mod 2).
have /= E2: to_uint ((w `>>>` 4) `&` (masklsb (6-4))%W8 `<<<` 4) = to_uint w %/ 16 %% 4 * 16.
 rewrite /max /= to_uint_shl 1:/# (W8.to_uint_and_mod 2) 1:/#.
 by rewrite to_uint_shr 1:/# /= modz_small /#.
rewrite to_uintD_small /=.
 by rewrite E1 E2 /#.
by rewrite E1 E2 /#.
qed.


abbrev ru_ones_s = W8.of_int 1.
lemma aux_coef_pos b:
 to_uint (mask33u8 `&` (mask55u8 `&` b  + mask55u8 `&` (b `>>` ru_ones_s)))
 = b2i b.[0] + b2i b.[1] + 16 * (b2i b.[4] + b2i b.[5]).
proof.
rewrite addrC -(mask85_sum b 0) 1:/# -(mask85_sum b 2) 1:/# /= !(W8.andwC mask55u8).
by rewrite to_uint_mask33 /(`>>`) to_uint_shr 1:/# /= to_uint_shr 1:/# /= /#.
qed.

lemma aux_coef_neg b:
 to_uint (mask33u8 `&` ((mask55u8 `&` b + mask55u8 `&` (b `>>` ru_ones_s)) `>>` W8.of_int 2))
 = b2i b.[2] + b2i b.[3] + 16 * (b2i b.[6] + b2i b.[7]).
proof.
rewrite to_uint_mask33 to_uint_shr 1:/# /= -divz_mul 1:/# /= !(W8.andwC mask55u8).
rewrite -{1}pow2_2  -pow2_6 -(mask85_sum b 1) 1:/# /= -(mask85_sum b 3) 1:/# /=. 
rewrite to_uint_shr 1:/# /= to_uint_shr 1:/# /=.
congr.
+ by do 5!congr; rewrite addrC.
rewrite mulrC;congr.
by do 5!congr; rewrite addrC.
qed.

lemma noise_coef_avx2_aux bytes j:
 3 + noise_coef bytes j
 = let b = bytes.[j%/2] in
   let x = mask55u8 `&` b + mask55u8 `&` (b `>>` W8.one) in
   let y = mask33u8 `&` x + mask33u8 - mask33u8 `&` (x `>>` (W8.of_int 2))in
   to_uint y %/ 2^(j%%2*4) %% 16.
proof.
have LL1: forall (x y z:int), (x + z*y) %% z = x %% z.
 by move=> x1 x2 x3; rewrite -modzDm modzMr /= modz_mod.
have LL2: forall (x y z:int), (x - z*y) %% z = x %% z.
 by move=> x1 x2 x3; rewrite -modzDm -modzNm modzMr /= modz_mod.
move=> /=.
pose b:= bytes.[j %/ 2].
pose x:= mask55u8 `&` b  + mask55u8 `&` (b `>>` ru_ones_s).
case: (j %% 2 = 0) => C.
 rewrite C /=. 
 rewrite -addrA to_uintD /= modz_dvd 1:/#.
 rewrite aux_coef_pos W8.to_uintB.
  by rewrite ule_andw.
 rewrite -modzDm LL1 modzDm aux_coef_neg.
 rewrite Ring.IntID.opprD !addzA LL2 /=.
 by rewrite -modzDml -(modzDmr _ 51) /= modzDml modz_small /#. 
have ->/=: j%%2 = 1 by smt().
rewrite -addrA to_uintD.
rewrite -pow2_4 modz_pow_div 1,2:/# /= modz_mod.
rewrite aux_coef_pos W8.to_uintB.
 by rewrite ule_andw.
rewrite aux_coef_neg /= (divz_eq 51 16).
pose X:= (b2i _ + _ + _ + _)%W8.
have /=->: X 
   = b2i b.[0] + b2i b.[1] + (51 %% 16) - (b2i b.[2] + b2i b.[3]) 
     + 16 * (b2i b.[4] + b2i b.[5] + (51 %/ 16) - (b2i b.[6] + b2i b.[7])).
 by rewrite /X /=; ring.
by rewrite mulzC divzMDr 1:/# /= divz_small 1:/# /= /#.
qed.

lemma noise_coef_avx2 bytes j:
 noise_coef bytes j
 = let b = bytes.[j%/2] in
   let x = mask55u8 `&` b + mask55u8 `&` (b `>>` W8.one) in
   let y = mask33u8 `&` x + mask33u8 - mask33u8 `&` (x `>>` (W8.of_int 2)) in
   if j%%2 = 0
   then to_sint (mask0Fu8 `&` y - mask03u8)
   else to_sint (mask0Fu8 `&` (y `>>` (W8.of_int 4)) - mask03u8).
proof.
have L1: forall x, W8.to_uint x < 128 => W8.to_sint x = to_uint x. 
 by move=> x; rewrite to_sintE /smod /= /#.
rewrite /noise_coef /=.
pose b:= bytes.[j %/ 2].
pose x:= b `&` mask55u8 + (b `>>` ru_ones_s) `&` mask55u8.
pose y:= x `&` mask33u8 + mask33u8 - (x `>>` (W8.of_int 2)) `&` mask33u8.
case: (j %% 2 = 0) => C.
 rewrite C /= andwC W8_to_sintB_small.
  by rewrite !to_sintE  (W8.to_uint_and_mod 4) /smod 1:/# /= /#.
 rewrite L1 (W8.to_uint_and_mod 4) 1:/# /= /smod /= 1,2:/#.
 move: (noise_coef_avx2_aux bytes j) => /=.
 by rewrite C to_sintE /smod => <- /#. 
have C': j %% 2 = 1 by smt().
rewrite C' /= andwC W8_to_sintB_small.
 by rewrite !to_sintE  (W8.to_uint_and_mod 4) /smod 1:/# /= /#.
rewrite L1 (W8.to_uint_and_mod 4) 1:/# /= /smod /= 1,2:/#.
move: (noise_coef_avx2_aux bytes j) => /=.
by rewrite /noise_coef C' to_sintE /smod to_uint_shr 1:/# /= => <- /#.
qed.

lemma  to_sint8_mod x:
 W8.to_sint x %% W8.modulus = to_uint x.
proof.
rewrite /to_sint /smod.
case: (2 ^ (8 - 1) <= to_uint x) => C.
 rewrite -modzDm -modzNm modzz /= modz_mod.
 rewrite modz_small 2:/#.
 by apply JUtils.bound_abs; apply W8.to_uint_cmp.
rewrite modz_small 2:/#.
by apply JUtils.bound_abs; apply W8.to_uint_cmp.
qed.

lemma to_sint8K (x:W8.t): W8.of_int (to_sint x) = x.
proof. by rewrite -of_int_mod to_sint8_mod to_uintK. qed.

lemma truncateu128_bits128 (w:W256.t):
 truncateu128 w = w \bits128 0.
proof. by rewrite /truncateu128 to_uint_eq of_uintK bits128_div 1:/# /= of_uintK. qed.

hoare cbd2_avx2_h _bytes:
 Jkem1024_avx2.M.__cbd2: buf=_bytes ==> res = Array256.init (fun k => W16.of_int (noise_coef _bytes k)).
proof.
proc.
sp; simplify.
while (0 <= i <= 4 /\ #{~i}pre /\ List.all (fun k => rp.[k]=W16.of_int (noise_coef _bytes k)) (iota_ 0 (64*i))).
 seq 15: (#pre /\ 
          all (fun k=> if k%%2 = 0
                       then to_sint (f0 \bits8 (k %/ 2)) = noise_coef _bytes (64*i+k)
                       else to_sint (f1 \bits8 (k %/ 2)) = noise_coef _bytes (64*i+k))
              (iota_ 0 64)).
  auto => &m |> ?_ /List.allP H ?; apply/List.allP => k; rewrite mem_iota /= => *.
  case: (k%%2=0) => C1.
   move: (noise_coef_avx2 buf{m} (64*i{m}+k)).
   have ->: (64 * i{m} + k) %% 2 = 0 by smt().
   rewrite /= => ->.
   have:= (bytes_getR buf{m} ((64*i{m}+k)%/2) _); first smt().
   rewrite /B2Ri /= -!divz_mul 1:/# /=. 
   have ->: (64 * i{m} + k) %/ 64 = i{m}.
    by rewrite (mulzC 64) divzMDl 1:/# (divz_small _ 64) 1:/# /=.
   have ->: (64 * i{m} + k) %/ 2 %% 32 = k %/ 2.
    rewrite -(modz_pow_div 2 6 1) 1,2:/# /=.
    by rewrite (mulzC 64) modzMDl modz_small /#.
   move => Eb.
   rewrite map2bE 1:/# /= mask0F_bits8 1:/# /=.
   rewrite map2bE 1:/#. beta. 
   rewrite VPSRL2_ANDmask33 1:/#.
   rewrite map2bE 1:/#; beta.
   rewrite map2bE 1:/#; beta.
   rewrite VPSRL1_ANDmask55 1:/#.
   rewrite mask33_bits8 1:/# /=.
   rewrite map2bE 1:/#; beta.
   rewrite VPSRL1_ANDmask55 1:/#.
   rewrite mask33_bits8 1:/# /=.
   rewrite mask55_bits8 1:/# /=.
   rewrite mask03_bits8 1:/# -!Eb.
   by congr.
  have C2: k %% 2 = 1 by smt().
  move: (noise_coef_avx2 buf{m} (64*i{m}+k)).
  have ->: (64 * i{m} + k) %% 2 = 1 by smt().
  rewrite /= => ->.
  have:= (bytes_getR buf{m} ((64*i{m}+k)%/2) _); first smt().
  rewrite /B2Ri /= -!divz_mul 1:/# /=. 
  have ->: (64 * i{m} + k) %/ 64 = i{m}.
   by rewrite (mulzC 64) divzMDl 1:/# (divz_small _ 64) 1:/# /=.
  have ->: (64 * i{m} + k) %/ 2 %% 32 = k %/ 2.
   rewrite -(modz_pow_div 2 6 1) 1,2:/# /=.
   by rewrite (mulzC 64) modzMDl modz_small /#.
  move => Eb.
  rewrite map2bE 1:/#; beta.
  rewrite VPSRL4_ANDmask0F 1:/#.
  rewrite map2bE 1:/#; beta.
  rewrite map2bE 1:/#; beta.
  rewrite VPSRL2_ANDmask33 1:/#.
  rewrite map2bE 1:/#; beta.
  rewrite VPSRL1_ANDmask55 1:/#.
  rewrite mask33_bits8 1:/# /=.
  rewrite map2bE 1:/#; beta.
  rewrite VPSRL1_ANDmask55 1:/#.
  rewrite mask33_bits8 1:/# /=.
  rewrite mask55_bits8 1:/# /=.
  rewrite mask03_bits8 1:/# -!Eb.
  by congr.
 seq 10: (#[/:-2]pre /\
          all (fun (k : int) =>
                if k %/ 16 = 0 
                then f0 \bits16 k%%16 = W16.of_int (noise_coef _bytes (64*i+k))
                else if k %/ 16 = 1
                then f2 \bits16 k%%16 = W16.of_int (noise_coef _bytes (64*i+k))
                else if k %/ 16 = 2
                then f1 \bits16 k%%16 = W16.of_int (noise_coef _bytes (64*i+k))
                else f3 \bits16 k%%16 = W16.of_int (noise_coef _bytes (64*i+k)))
              (iota_ 0 64)).
  auto => &m |> ?_ /List.allP IH ?.
  rewrite -{1}iotaredE /= => |> *.
  rewrite -iotaredE /=.
  do 32! (split; first by 
   rewrite /VPMOVSX_16u8_16u16 /VPUNPCKL_32u8 /VPUNPCKL_16u8 /VPUNPCKH_32u8 /VPUNPCKH_16u8 /MOVSX_u16s8 truncateu128_bits128 /interleave_gen /get_lo_2u64 /get_hi_2u64 /= /#).
  do 31! (split; first by
   rewrite /VPMOVSX_16u8_16u16 /VPUNPCKL_32u8 /VPUNPCKL_16u8 /VPUNPCKH_32u8 /VPUNPCKH_16u8 /MOVSX_u16s8 /VEXTRACTI128 /interleave_gen /get_lo_2u64 /get_hi_2u64 /b2i /= /int_bit /= /#).
  by rewrite /VPMOVSX_16u8_16u16 /VPUNPCKL_32u8 /VPUNPCKL_16u8 /VPUNPCKH_32u8 /VPUNPCKH_16u8 /MOVSX_u16s8 /VEXTRACTI128 /interleave_gen /get_lo_2u64 /get_hi_2u64 /b2i /= /int_bit /= /#.
 auto => |> &m ? _ /List.allP IH ? /List.allP H.
 split; first smt().
 rewrite -!NTT_AVX_Fq.PURE 1..4:/#. 
 apply/List.allP => k; rewrite mem_iota /= => |> *.
 rewrite !NTT_AVX_Fq.PUR_get 1..8:/#.
 case: (k %/ 16 = 4 * i{m} + 3) => C1.
  move: (H (k %% 64) _) => /=; first smt(mem_iota).
  rewrite (modz_pow_div 2 6 4) 1,2:/# /= C1 (mulzC 4) modzMDl /=.
  rewrite (modz_dvd_pow 4 6 _ 2) 1:/#.
  have ->: 64 * i{m} + k %% 64 = k by smt().
  by rewrite /R2C /= Array16.initiE /#.
 case: (k %/ 16 = 4 * i{m} + 2) => C2.
  move: (H (k %% 64) _) => /=; first smt(mem_iota).
  rewrite (modz_pow_div 2 6 4) 1,2:/# /= C2 (mulzC 4) modzMDl /=.
  rewrite (modz_dvd_pow 4 6 _ 2) 1:/#.
  have ->: 64 * i{m} + k %% 64 = k by smt().
  by rewrite /R2C /= Array16.initiE /#.
 case: (k %/ 16 = 4 * i{m} + 1) => C3.
  move: (H (k %% 64) _) => /=; first smt(mem_iota).
  rewrite (modz_pow_div 2 6 4) 1,2:/# /= C3 (mulzC 4) modzMDl /=.
  rewrite (modz_dvd_pow 4 6 _ 2) 1:/#.
  have ->: 64 * i{m} + k %% 64 = k by smt().
  by rewrite /R2C /= Array16.initiE /#.
 case: (k %/ 16 = 4 * i{m}) => C4.
  move: (H (k %% 64) _) => /=; first smt(mem_iota).
  rewrite (modz_pow_div 2 6 4) 1,2:/# /= C4 modzMr. 
  rewrite (modz_dvd_pow 4 6 _ 2) 1:/#.
  have ->: 64 * i{m} + k %% 64 = k by smt().
  by rewrite /R2C /= Array16.initiE /#.
 have ?: k < 64*i{m} by smt().   
 by move: (IH k _) => /=; first smt(mem_iota).
auto => &m |> *.
split; first by rewrite iota0.
move => i rp ???; rewrite (_:i=4) 1:/# /=.
move => /List.allP H.
rewrite tP => k Hk; rewrite (H k _); first smt(mem_iota).
by rewrite initiE /#.
qed.

lemma cbd2_ll : islossless Jkem1024_avx2.M.__cbd2.
proc. inline *. sp; wp. while (true) (4-i). move => z.
auto => /> &hr H. smt().
auto => />i. smt(). qed. 

phoare cbd2_avx2_ph _bytes:
 [Jkem1024_avx2.M.__cbd2: buf=_bytes ==> res = Array256.init (fun k => W16.of_int (noise_coef _bytes k))] = 1%r.
conseq cbd2_ll (cbd2_avx2_h _bytes) => />. qed.
module AuxMLKEMAvx2 = {
  proc cbd2_ref (rp:W16.t Array256.t, buf:W8.t Array128.t) : W16.t Array256.t = {
    var k: int;
    var a, b, c: W8.t;
    var i: int;
    var t: W16.t;
    i <- 0;
    while ((i < (2 * 256 %/ 4))) {
      c <- buf.[i];
      a <- c;
      a <- (a `&` (W8.of_int 85));
      c <- (c `>>` (W8.of_int 1));
      c <- (c `&` (W8.of_int 85));
      c <- (c + a);
      a <- c;
      a <- (a `&` (W8.of_int 3));
      b <- c;
      b <- (b `>>` (W8.of_int 2));
      b <- (b `&` (W8.of_int 3));
      a <- (a - b);
      t <- (sigextu16 a);
      rp.[2 * i] <- t;
      a <- c;
      a <- (a `>>` (W8.of_int 4));
      a <- (a `&` (W8.of_int 3));
      b <- (c `>>` (W8.of_int 6));
      b <- (b `&` (W8.of_int 3));
      a <- (a - b);
      t <- (sigextu16 a);
      rp.[2 * i + 1] <- t;
      i <- i + 1;
    }
    return (rp);
  }

  proc _poly_getnoise (rp:W16.t Array256.t, seed:W8.t Array32.t, nonce:W8.t)
    : W16.t Array256.t = {
    var buf:W8.t Array128.t;
    var r;
    buf <- SHAKE256_33_128 seed nonce;   (* operator, not proc *)
    r <@ cbd2_ref(rp,buf);
    return r;
  }

  proc __poly_getnoise_eta1_4x(aux3 aux2 aux1 aux0 : W16.t Array256.t,
                               noiseseed : W8.t Array32.t, nonce : W8.t) :
      W16.t Array256.t * W16.t Array256.t * W16.t Array256.t * W16.t Array256.t = {
      var n3, n2, n1, n0 : W8.t;
      var aux_3, aux_2, aux_1, aux_0 : W16.t Array256.t;
      n0 <- nonce + W8.of_int 3;
      n1 <- nonce + W8.of_int 2;
      n2 <- nonce + W8.of_int 1;
      n3 <- nonce;
      aux_3 <@ _poly_getnoise(aux3, noiseseed, n3);
      aux_2 <@ _poly_getnoise(aux2, noiseseed, n2);
      aux_1 <@ _poly_getnoise(aux1, noiseseed, n1);
      aux_0 <@ _poly_getnoise(aux0, noiseseed, n0);
      return (aux_3, aux_2, aux_1, aux_0);
  }
}.

(* ============================================================
   AuxMLKEMAvx2._poly_getnoise ~ CBD2.sample.
   The "noise function" semantic equivalence.
   ============================================================ *)

equiv aux_poly_getnoise_cbd2sample :
  AuxMLKEMAvx2._poly_getnoise ~ CBD2.sample :
    arg{2} = SHAKE256_33_128 arg{1}.`2 arg{1}.`3
    ==>
    lift_array256 res{1} = res{2} /\
    forall k, 0 <= k < 256 => -5 < to_sint res{1}.[k] < 5.
proof.
proc.
inline AuxMLKEMAvx2.cbd2_ref.
sp; wp.
while (={i} /\ 0 <= i{2} <= 128 /\ j{2} = 2*i{2} /\ buf0{1} = bytes{2} /\
       (forall k, 0 <= k < 2*i{2} =>
          incoeff (to_sint rp0{1}.[k]) = rr{2}.[k]) /\
       (forall k, 0 <= k < 2*i{2} =>
          -5 < to_sint rp0{1}.[k] < 5));
last first.
+ auto => /> &1 *; split; 1: smt().
  move => *.
  rewrite /lift_array256 tP; move => *; split; last by smt().
  by move => *; rewrite mapiE //=; smt().
auto => /> &1 &2 *.
do split; 1..3: smt().
+ move => k kbl kbh.
  case (k < 2 * i{2}); 1: by move => *; rewrite !set_neqiE; smt().
  case (k = 2 * i{2}).
  + move => -> *.
    rewrite set_neqiE 1:/# !get_setE 1..3:/# ifF 1:/# !ifT 1,2:/#.
    congr.
    rewrite sigextu16_to_sint (_: 3 = 2^2 - 1) // !and_mod //= W8_of_sintK_signed /=; 1: smt().
    have -> /= : 2 * i{2} %% 2 = 0 by smt().
    by apply parallel_noisesum_low.
  move => *; have ? : k = 2 * i{2} + 1 by smt().
  do 2! (rewrite set_eqiE 1,2:/#); congr.
  rewrite sigextu16_to_sint (_: 3 = 2^2 - 1) // !and_mod //= W8_of_sintK_signed /=; 1: smt().
  have -> /= : (2 * i{2} + 1) %% 2 = 1 by smt().
  by apply parallel_noisesum_high.
move => k kbl kbh.
case (k < 2 * i{2}); 1: by move => *; rewrite !set_neqiE /#.
case (k = 2 * i{2}).
+ move => *; rewrite set_neqiE 1,2:/# set_eqiE 1,2:/#.
  by rewrite sigextu16_to_sint (_: 3 = 2^2 - 1) // !and_mod //= W8_of_sintK_signed /=; smt().
move => *; have ? : k = 2 * i{2} + 1 by smt().
by rewrite set_eqiE 1,2:/# sigextu16_to_sint (_: 3 = 2^2 - 1) //
     !and_mod //= W8_of_sintK_signed /=; smt().
qed.

(* ============================================================
   1x phoare derived from the equiv + losslessness.
   ============================================================ *)

lemma cbd2_ref_ll' : islossless AuxMLKEMAvx2.cbd2_ref.
proof.
proc; while (0 <= i <= 128) (128 - i); 1: by move => z; auto => /> /#.
auto => /> /#.
qed.

hoare cbd2_ref_h _bytes:
 AuxMLKEMAvx2.cbd2_ref: buf=_bytes ==> res = Array256.init (fun k => W16.of_int (noise_coef _bytes k)).
proof.
proc.
while ( i <= 128 /\ #pre /\ List.all (fun k => rp.[k]=W16.of_int (noise_coef _bytes k)) (iota_ 0 (2 * i))).
 auto => &m |>; rewrite /(\ult) => _ /List.allP IH /= Hi.
 split; first smt().
 apply/List.allP => k; rewrite mem_iota /=; move => [? Hk].
 case: (k = 2 *  i{m}) => C1.
  rewrite /noise_coef !get_setE 1..2:/# C1 /= ifF 1:/#.
  have ->/=: 2 *  i{m} %/ 2 =  i{m} by smt().
  rewrite -to_sint_eq sigextu16_to_sint (_: 3 = 2^2 -1) 1:/# !and_mod 1,2:/# /= W8_of_sintK_signed /=; 1: smt().
  have ->  /= : 2 * i{m} %% 2 = 0 by smt().
  by rewrite -parallel_noisesum_low /to_sint of_uintK smod_small  /#.
 case: (k = 2 *  i{m}+1) => C2.
  rewrite /noise_coef !get_setE 1..2:/# C2 /=.
  have ->/=: (2 * i{m} + 1) %/ 2 =  i{m} by smt().
  rewrite -to_sint_eq sigextu16_to_sint (_: 3 = 2^2 -1) 1:/# !and_mod 1,2:/# /= W8_of_sintK_signed /=; 1: smt().
  have ->  /= : (2 *  i{m}+1) %% 2 = 1 by smt().
  by rewrite -parallel_noisesum_high /to_sint of_uintK smod_small  /#.
 rewrite !get_setE 1..2:/# C1 C2 /=; apply IH.
 smt(mem_iota).
auto => &m |> *.
split; first by rewrite iota0.
move=> i rp => |> ??.
have ->/=:  i = 128 by smt().
rewrite tP => /List.allP H k Hk.
rewrite (H k _) /=.
 smt(mem_iota).
by rewrite initiE /#.
qed.

phoare cbd2_ref_ph _bytes:
 [AuxMLKEMAvx2.cbd2_ref: buf=_bytes ==> res = Array256.init (fun k => W16.of_int (noise_coef _bytes k))] = 1%r.
proof. conseq cbd2_ref_ll' (cbd2_ref_h _bytes) => />. qed.

lemma cbd2_ref_ll : islossless AuxMLKEMAvx2.cbd2_ref.
proof. apply cbd2_ref_ll'. qed.

lemma aux_poly_getnoise_ll : islossless AuxMLKEMAvx2._poly_getnoise.
proof. proc; call cbd2_ref_ll; auto. qed.

lemma CBD2_sample_ll : islossless CBD2.sample.
proof.
proc; while (0 <= i <= 128) (128 - i); 1: by move => z; auto => /> /#.
auto => /> /#.
qed.

phoare aux_poly_getnoise_ph _seed _nonce :
  [AuxMLKEMAvx2._poly_getnoise :
    seed = _seed /\ nonce = _nonce
    ==>
    lift_array256 res = cbd2sample (SHAKE256_33_128 _seed _nonce) /\
    forall k, 0 <= k < 256 => -5 < to_sint res.[k] < 5] = 1%r.
proof.
bypr => &m [-> ->].
have <-: Pr[CBD2.sample(SHAKE256_33_128 _seed _nonce) @ &m :
            res = cbd2sample (SHAKE256_33_128 _seed _nonce)] = 1%r
  by byphoare (cbd2sample_ph (SHAKE256_33_128 _seed _nonce)).
byequiv aux_poly_getnoise_cbd2sample => />; smt().
qed.

(* ============================================================
   4x phoare: chain 4 calls to the 1x phoare.
   ============================================================ *)

(* ============================================================
   Cross-equiv: AVX2 Jasmin proc ~ AuxMLKEMAvx2 (operator-form).
   The cbd_eta1 1x equivalence (lifted from OLD).
   ============================================================ *)

equiv getnoise_1x_equiv_avx :
  Jkem1024_avx2.M.__poly_cbd_eta1 ~ AuxMLKEMAvx2.cbd2_ref : ={arg} ==> ={res}.
proof.
proc*. inline Jkem1024_avx2.M.__poly_cbd_eta1.  sp;wp.
ecall{1} (cbd2_avx2_ph buf{1}) => />.
ecall{2} (cbd2_ref_ph buf{2}) => />.
auto => /> &2. rewrite tP => i Hi. rewrite initiE /#.
qed.

(* ============================================================
   Cross-equiv: 4x version, ref-free.
   ============================================================ *)

equiv getnoise_4x_avx_aux :
  Jkem1024_avx2.M._poly_getnoise_eta1_4x ~ AuxMLKEMAvx2.__poly_getnoise_eta1_4x :
    seed{1} = noiseseed{2} /\ nonce{1} = nonce{2} /\
    r0{1} = aux3{2} /\ r1{1} = aux2{2} /\ r2{1} = aux1{2} /\ r3{1} = aux0{2}
    ==> ={res}.
proof.
proc.
inline AuxMLKEMAvx2._poly_getnoise.
swap{2} [21..22] 4.    (* g3 cbd past g4 prefix → [25..26] *)
swap{2} [15..16] 8.    (* g2 cbd past g3+g4 prefixes → [23..24] *)
swap{2} [9..10] 12.    (* g1 cbd past g2+g3+g4 prefixes → [21..22] *)
seq 22 20 :
  ( buf0{1} = buf{2}  /\ buf1{1} = buf0{2}
 /\ buf2{1} = buf1{2} /\ buf3{1} = buf2{2}
 /\ r0{1} = rp{2}     /\ r1{1} = rp0{2}
 /\ r2{1} = rp1{2}    /\ r3{1} = rp2{2} ).
+ sp => /=.
  wp;ecall{1} (shake256x4_A128__A32_A1_ph seed{1} nonces{1}).
  by auto => /> &1 &2 rr H0 H1 H2 H3.
wp;call getnoise_1x_equiv_avx.
wp;call getnoise_1x_equiv_avx.
wp;call getnoise_1x_equiv_avx.
wp;call getnoise_1x_equiv_avx.
by auto => />.
qed.

(* ============================================================
   Jasmin-side phoare: bridge for Step 2b consumption.
   ============================================================ *)


phoare aux_poly_getnoise_4x_ph _seed _nonce :
  [AuxMLKEMAvx2.__poly_getnoise_eta1_4x :
    noiseseed = _seed /\ nonce = _nonce
    ==>
    lift_array256 res.`1 = cbd2sample (SHAKE256_33_128 _seed _nonce) /\
    lift_array256 res.`2 = cbd2sample (SHAKE256_33_128 _seed (_nonce + W8.of_int 1)) /\
    lift_array256 res.`3 = cbd2sample (SHAKE256_33_128 _seed (_nonce + W8.of_int 2)) /\
    lift_array256 res.`4 = cbd2sample (SHAKE256_33_128 _seed (_nonce + W8.of_int 3)) /\
    (forall k, 0 <= k < 256 => -5 < to_sint res.`1.[k] < 5) /\
    (forall k, 0 <= k < 256 => -5 < to_sint res.`2.[k] < 5) /\
    (forall k, 0 <= k < 256 => -5 < to_sint res.`3.[k] < 5) /\
    (forall k, 0 <= k < 256 => -5 < to_sint res.`4.[k] < 5)] = 1%r.
proof.
proc.
call (aux_poly_getnoise_ph _seed (_nonce + W8.of_int 3)).
call (aux_poly_getnoise_ph _seed (_nonce + W8.of_int 2)).
call (aux_poly_getnoise_ph _seed (_nonce + W8.of_int 1)).
call (aux_poly_getnoise_ph _seed _nonce).
auto => /> /#.
qed.

phoare jkem_getnoise_4x_ph _seed _nonce :
  [Jkem1024_avx2.M._poly_getnoise_eta1_4x :
    seed = _seed /\ nonce = _nonce
    ==>
    lift_array256 res.`1 = cbd2sample (SHAKE256_33_128 _seed _nonce) /\
    lift_array256 res.`2 = cbd2sample (SHAKE256_33_128 _seed (_nonce + W8.of_int 1)) /\
    lift_array256 res.`3 = cbd2sample (SHAKE256_33_128 _seed (_nonce + W8.of_int 2)) /\
    lift_array256 res.`4 = cbd2sample (SHAKE256_33_128 _seed (_nonce + W8.of_int 3)) /\
    (forall k, 0 <= k < 256 => -5 < to_sint res.`1.[k] < 5) /\
    (forall k, 0 <= k < 256 => -5 < to_sint res.`2.[k] < 5) /\
    (forall k, 0 <= k < 256 => -5 < to_sint res.`3.[k] < 5) /\
    (forall k, 0 <= k < 256 => -5 < to_sint res.`4.[k] < 5)] = 1%r.
proof.
bypr => &m [-> ->].
have <-: Pr[AuxMLKEMAvx2.__poly_getnoise_eta1_4x
              (r0{m}, r1{m}, r2{m}, r3{m}, _seed, _nonce) @ &m :
            lift_array256 res.`1 = cbd2sample (SHAKE256_33_128 _seed _nonce) /\
            lift_array256 res.`2 = cbd2sample (SHAKE256_33_128 _seed (_nonce + W8.of_int 1)) /\
            lift_array256 res.`3 = cbd2sample (SHAKE256_33_128 _seed (_nonce + W8.of_int 2)) /\
            lift_array256 res.`4 = cbd2sample (SHAKE256_33_128 _seed (_nonce + W8.of_int 3)) /\
            (forall k, 0 <= k < 256 => -5 < to_sint res.`1.[k] < 5) /\
            (forall k, 0 <= k < 256 => -5 < to_sint res.`2.[k] < 5) /\
            (forall k, 0 <= k < 256 => -5 < to_sint res.`3.[k] < 5) /\
            (forall k, 0 <= k < 256 => -5 < to_sint res.`4.[k] < 5)] = 1%r
  by byphoare (aux_poly_getnoise_4x_ph _seed _nonce).
by byequiv getnoise_4x_avx_aux => />.
qed.

(* ============================================================
   Single-poly eta2 phoare (1024 only — needed for enc's epp).
   ============================================================ *)

equiv getnoise_eta2_avx_aux :
    Jkem1024_avx2.M._poly_getnoise_eta2 ~ AuxMLKEMAvx2._poly_getnoise :
    ={rp, seed, nonce} ==> ={res}.
proof.
proc.
wp; call getnoise_1x_equiv_avx.
sp; conseq />.
ecall {1} (shake256_128A_A33_ph seed{1} nonce_s{1}).
auto => /> &2 r0; rewrite /SHAKE256_33_128 /=.
have <- := (Array128.to_listK W8.zero r0); rewrite of_listK; 1: by rewrite size_to_list.
move => ->.
congr; congr; congr.
by rewrite /to_list mkseq1 /=.
qed.

phoare jkem_getnoise_eta2_ph _seed _nonce :
  [Jkem1024_avx2.M._poly_getnoise_eta2 :
    seed = _seed /\ nonce = _nonce
    ==>
    lift_array256 res = cbd2sample (SHAKE256_33_128 _seed _nonce) /\
    (forall k, 0 <= k < 256 => -5 < to_sint res.[k] < 5)] = 1%r.
proof.
bypr => &m [-> ->].
have <-: Pr[AuxMLKEMAvx2._poly_getnoise(rp{m}, _seed, _nonce) @ &m :
            lift_array256 res = cbd2sample (SHAKE256_33_128 _seed _nonce) /\
            forall k, 0 <= k < 256 => -5 < to_sint res.[k] < 5] = 1%r
  by byphoare (aux_poly_getnoise_ph _seed _nonce).
by byequiv getnoise_eta2_avx_aux => />.
qed.
