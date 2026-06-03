require import AllCore List IntDiv.
require import BitEncoding.
require import StdOrder.

import Ring.IntID.
import IntOrder.
import BS2Int.

from Jasmin require import JModel.

(* misc *)

lemma size_drop' ['a] (s: 'a list) n:
 size (drop n s) = max 0 (size s - max 0 n).
proof.
elim: s n => //=.
 smt().
move=> x xs IH n /=.
by case: (n <= 0) => C; smt(size_ge0).
qed.

lemma size_take' ['a] (s: 'a list) n:
 size (take n s) = min (max 0 n) (size s).
proof.
elim: s n => //=.
 smt().
move=> x xs IH n /=.
by case: (n <= 0) => C; smt(size_ge0).
qed.

(* add to JWord.ec *)

(* W16 *)

(*
lemma W16_to_sint_pos (w: W16.t):
 to_uint w < 2^(W16.size - 1) =>
 to_sint w = to_uint w.
proof.
rewrite to_sintE /smod /= => H.
by rewrite ifF 1:/#.
qed.
*)

lemma W16_get_ule (w: W16.t) k:
 w.[k] => 2^k <= W16.to_uint w.
proof.
rewrite get_to_uint => [[Hk H]].
smt(W16.to_uint_cmp gt0_pow2).
qed.

lemma W16_msbE (w: W16.t):
 msb w <=> w.[W16.size-1].
proof.
rewrite /msb; split; last by apply W16_get_ule.
rewrite get_to_uint => H.
have L0: 0 < to_uint w %/ 2^(W16.size-1).
 move: H; rewrite /=; smt(W16.to_uint_cmp).
have: to_uint w \in range (1 * 2^(W16.size-1)) ((1 + 1) * 2^(W16.size-1)).
 rewrite /range /= mem_iota; split => //=.
 by move: (W16.to_uint_cmp w) => /= /#.
by rewrite -eq_div_range // /#.
qed.

lemma W16_min_sintE:
 W16.of_int W16.min_sint
 = W16.zero.[W16.size-1 <- true].
proof.
rewrite to_uint_eq of_uintK /= to_uint_bits.
rewrite /bits /mkseq -iotaredE /=.
have:= bs2int_pow2 (W16.size-1) 0.
rewrite nseq0 /max -mkseq_nseq /mkseq -iotaredE /= /#.
qed.

lemma W16_msb_sar (w: W16.t) k:
 0 <= k =>
 msb (sar w k) = msb w.
proof.
move=> Hk.
by rewrite !W16_msbE /(`|>>>`) /sar /= /#.
qed.

lemma W16_msb_sign (w: W16.t):
 msb w <=> to_sint w < 0.
proof.
rewrite /msb to_sintE /smod.
by move: (W16.to_uint_cmp w); smt().
qed.

lemma W16_to_sint_neg (w: W16.t):
 msb w =>
 to_sint w  = to_uint w - W16.modulus.
proof.
rewrite /msb to_sintE /smod.
by move: (W16.to_uint_cmp w); smt().
qed.

lemma W16_to_sint_pos (w: W16.t):
 !msb w =>
 to_sint w  = to_uint w.
proof.
rewrite /msb to_sintE /smod.
by move: (W16.to_uint_cmp w); smt().
qed.

lemma W16_sar_pos (w: W16.t) k:
 0 <= k =>
 !msb w =>
 sar w k = w `>>>` k.
proof.
rewrite W16_msbE /= => Hk Hpos.
apply W16.ext_eq => i Hi.
rewrite /(`|>>>`) initiE //=.
rewrite /(`>>>`) Hi /=.
case: (W16.size-1 < (i + k)) => E.
 by rewrite lez_minl 1:/# eq_sym get_out /#.
by rewrite lez_minr 1:/#.
qed.

lemma W16_shl_onew k:
 0 < k =>
 W16.onew `>>>` k
 = W16.of_int (2^(max 0 (W16.size - k)) -1).
proof.
move => Hk.
apply W16.ext_eq => i Hi.
by rewrite /(`>>>`) initiE  //= /#.
qed.

lemma W16_sarE_neg (w: W16.t) k:
 0 <= k =>
 msb w =>
 sar w k 
 = (w `>>>` k) `|` invw (W16.onew `>>>` k).
proof.
rewrite W16_msbE /= => Hk Hmsb.
apply W16.ext_eq => i Hi.
rewrite /(`|>>>`) initiE //=.
rewrite /(`>>>`) !Hi //=.
have ->/=: 0 <= i + k by smt().
case: (i + k < W16.size) => C.
 by rewrite lez_minr 1:/#.
by rewrite lez_minl 1:/# Hmsb.
qed.

lemma W16_to_uint_sar_neg (w: W16.t) k:
 0 <= k =>
 msb w =>
 to_uint (sar w k)
 = W16.modulus + (to_sint w %/ 2^k).
proof.
move=> Hk Hmbs.
have [Hw0 Hw1]:= W16.to_uint_cmp w.
rewrite W16_sarE_neg // W16.to_uint_orw_disjoint.
 apply W16.ext_eq => i Hi.
 rewrite /(`>>`) /(`>>>`) /= !initiE Hi //=.
 have ->/=: 0 <= i + k by smt().
 case: (i + k < W16.size) => C //=.
 by rewrite get_out /#.
case: (k = 0) => Ek0.
 rewrite !Ek0 /= to_uint_shr 1:/#.
 rewrite to_uint_invw to_uint_shr 1:/#.
 by rewrite W16_to_sint_neg // to_uint_onew /#.
case: (W16.size <= k) => Eksz.
 rewrite to_uint_shr 1:/# divz_small /=.
  smt(ler_weexpn2l).
 have ->: to_sint w %/ 2 ^ k = -1.
  rewrite W16_to_sint_neg //.
  have ->: to_uint w - W16.modulus
           = - (W16.modulus - to_uint w) by ring.
  rewrite divNz.
    by rewrite subr_gt0; apply Hw1.
   smt(expr_gt0).
  rewrite divz_small //.
  apply bound_abs; split.
   rewrite /= in Hw1.
   by rewrite /= /#.
  move=> ?.
  apply (ltr_le_trans W16.modulus); first smt().
  by apply ler_weexpn2l => /#.
 rewrite to_uint_invw to_uint_shr 1:/# to_uint_onew divz_small //.
 apply bound_abs; split; first done.
 move=> ?; apply (ltr_le_trans W16.modulus); first smt().
 by apply ler_weexpn2l.
rewrite to_uint_shr; first smt(to_uint_cmp).
rewrite W16_shl_onew; first smt(to_uint_cmp).
rewrite lez_maxr 1:/# to_uint_invw.
rewrite of_uintK modz_small.
 apply bound_abs; split; first smt(@IntDiv).
 move => ?.
 have /=?: 2 ^ (W16.size - k) <= W16.modulus.
  by apply ler_weexpn2l => // /#.
 by rewrite /= /#.
have Hkk: W16.modulus = 2^(W16.size-k) * 2^k.
 rewrite -exprD_nneg // 1:/#.
 by rewrite -addzA /=.
have ->: W16.max_uint - (2 ^ (W16.size - k) - 1)
         = W16.modulus - W16.modulus %/ 2^k.
 rewrite {3}Hkk mulzK /#.
rewrite addzC -addzA; congr.
rewrite addzC W16_to_sint_neg //.
have ->: (to_uint w - W16.modulus)
 = to_uint w + (- 2^(W16.size-k)) * 2^k.
 by rewrite Hkk; ring.
rewrite divzMDr 1:/# addzC; congr.
have ->: W16.modulus = 2^(W16.size - k + k).
 by congr; smt().
congr.
by rewrite exprD_nneg 1:/# // /#.
qed.

lemma W16_sar_div (w1 : W16.t) k:
 0 <= k =>
 to_sint (sar w1 k)
 = to_sint w1 %/ 2 ^ k.
proof.
case: (msb w1) => Hk C.
 rewrite W16_to_sint_neg 1:W16_msb_sar //.
 by rewrite W16_to_uint_sar_neg //.
rewrite W16_to_sint_pos 1:W16_msb_sar //.
by rewrite W16_sar_pos // to_uint_shr /#.
qed.


(* W32 *)

lemma W32_get_ule (w: W32.t) k:
 w.[k] => 2^k <= W32.to_uint w.
proof.
rewrite get_to_uint => [[Hk H]].
smt(W32.to_uint_cmp gt0_pow2).
qed.

lemma W32_msbE (w: W32.t):
 msb w <=> w.[W32.size-1].
proof.
rewrite /msb; split; last by apply W32_get_ule.
rewrite get_to_uint => H.
have L0: 0 < to_uint w %/ 2^(W32.size-1).
 move: H; rewrite /=; smt(W32.to_uint_cmp).
have: to_uint w \in range (1 * 2^(W32.size-1)) ((1 + 1) * 2^(W32.size-1)).
 rewrite /range /= mem_iota; split => //=.
 by move: (W32.to_uint_cmp w) => /= /#.
by rewrite -eq_div_range // /#.
qed.

lemma W32_min_sintE:
 W32.of_int W32.min_sint
 = W32.zero.[W32.size-1 <- true].
proof.
rewrite to_uint_eq of_uintK /= to_uint_bits.
rewrite /bits /mkseq -iotaredE /=.
have:= bs2int_pow2 (W32.size-1) 0.
rewrite nseq0 /max -mkseq_nseq /mkseq -iotaredE /= /#.
qed.

lemma W32_msb_sar (w: W32.t) k:
 0 <= k =>
 msb (sar w k) = msb w.
proof.
move=> Hk.
by rewrite !W32_msbE /(`|>>>`) /sar /= /#.
qed.

lemma W32_msb_sign (w: W32.t):
 msb w <=> to_sint w < 0.
proof.
rewrite /msb to_sintE /smod.
by move: (W32.to_uint_cmp w); smt().
qed.

lemma W32_to_sint_neg (w: W32.t):
 msb w =>
 to_sint w  = to_uint w - W32.modulus.
proof.
rewrite /msb to_sintE /smod.
by move: (W32.to_uint_cmp w); smt().
qed.

lemma W32_to_sint_pos (w: W32.t):
 !msb w =>
 to_sint w  = to_uint w.
proof.
rewrite /msb to_sintE /smod.
by move: (W32.to_uint_cmp w); smt().
qed.

lemma W32_sar_pos (w: W32.t) k:
 0 <= k =>
 !msb w =>
 sar w k = w `>>>` k.
proof.
rewrite W32_msbE /= => Hk Hpos.
apply W32.ext_eq => i Hi.
rewrite /(`|>>>`) initiE //=.
rewrite /(`>>>`) Hi /=.
case: (W32.size-1 < (i + k)) => E.
 by rewrite lez_minl 1:/# eq_sym get_out /#.
by rewrite lez_minr 1:/#.
qed.

lemma W32_shl_onew k:
 0 < k =>
 W32.onew `>>>` k
 = W32.of_int (2^(max 0 (W32.size - k)) -1).
proof.
move => Hk.
apply W32.ext_eq => i Hi.
by rewrite /(`>>>`) initiE  //= /#.
qed.

lemma W32_sarE_neg (w: W32.t) k:
 0 <= k =>
 msb w =>
 sar w k 
 = (w `>>>` k) `|` invw (W32.onew `>>>` k).
proof.
rewrite W32_msbE /= => Hk Hmsb.
apply W32.ext_eq => i Hi.
rewrite /(`|>>>`) initiE //=.
rewrite /(`>>>`) !Hi //=.
have ->/=: 0 <= i + k by smt().
case: (i + k < W32.size) => C.
 by rewrite lez_minr 1:/#.
by rewrite lez_minl 1:/# Hmsb.
qed.

lemma W32_to_uint_sar_neg (w: W32.t) k:
 0 <= k =>
 msb w =>
 to_uint (sar w k)
 = W32.modulus + (to_sint w %/ 2^k).
proof.
move=> Hk Hmbs.
have [Hw0 Hw1]:= W32.to_uint_cmp w.
rewrite W32_sarE_neg // W32.to_uint_orw_disjoint.
 apply W32.ext_eq => i Hi.
 rewrite /(`>>`) /(`>>>`) /= !initiE Hi //=.
 have ->/=: 0 <= i + k by smt().
 case: (i + k < W32.size) => C //=.
 by rewrite get_out /#.
case: (k = 0) => Ek0.
 rewrite !Ek0 /= to_uint_shr 1:/#.
 rewrite to_uint_invw to_uint_shr 1:/#.
 by rewrite W32_to_sint_neg // to_uint_onew /#.
case: (W32.size <= k) => Eksz.
 rewrite to_uint_shr 1:/# divz_small /=.
  smt(ler_weexpn2l).
 have ->: to_sint w %/ 2 ^ k = -1.
  rewrite W32_to_sint_neg //.
  have ->: to_uint w - W32.modulus
           = - (W32.modulus - to_uint w) by ring.
  rewrite divNz.
    by rewrite subr_gt0; apply Hw1.
   smt(expr_gt0).
  rewrite divz_small //.
  apply bound_abs; split.
   rewrite /= in Hw1.
   by rewrite /= /#.
  move=> ?.
  apply (ltr_le_trans W32.modulus); first smt().
  by apply ler_weexpn2l => /#.
 rewrite to_uint_invw to_uint_shr 1:/# to_uint_onew divz_small //.
 apply bound_abs; split; first done.
 move=> ?; apply (ltr_le_trans W32.modulus); first smt().
 by apply ler_weexpn2l.
rewrite to_uint_shr; first smt(to_uint_cmp).
rewrite W32_shl_onew; first smt(to_uint_cmp).
rewrite lez_maxr 1:/# to_uint_invw.
rewrite of_uintK modz_small.
 apply bound_abs; split; first smt(@IntDiv).
 move => ?.
 have /=?: 2 ^ (W32.size - k) <= W32.modulus.
  by apply ler_weexpn2l => // /#.
 by rewrite /= /#.
have Hkk: W32.modulus = 2^(W32.size-k) * 2^k.
 rewrite -exprD_nneg // 1:/#.
 by rewrite -addzA /=.
have ->: W32.max_uint - (2 ^ (W32.size - k) - 1)
         = W32.modulus - W32.modulus %/ 2^k.
 rewrite {3}Hkk mulzK /#.
rewrite addzC -addzA; congr.
rewrite addzC W32_to_sint_neg //.
have ->: (to_uint w - W32.modulus)
 = to_uint w + (- 2^(W32.size-k)) * 2^k.
 by rewrite Hkk; ring.
rewrite divzMDr 1:/# addzC; congr.
have ->: W32.modulus = 2^(W32.size - k + k).
 by congr; smt().
by rewrite exprD_nneg 1:/# // /#.
qed.

lemma W32_sar_div (w1 : W32.t) k:
 0 <= k =>
 to_sint (sar w1 k)
 = to_sint w1 %/ 2 ^ k.
proof.
case: (msb w1) => Hk C.
 rewrite W32_to_sint_neg 1:W32_msb_sar //.
 by rewrite W32_to_uint_sar_neg //.
rewrite W32_to_sint_pos 1:W32_msb_sar //.
by rewrite W32_sar_pos // to_uint_shr /#.
qed.
