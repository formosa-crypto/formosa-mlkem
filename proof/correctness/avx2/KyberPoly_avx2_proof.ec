require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel JMemory JWord.
require import Array256 Fq Array16 Array16p Array4 Array4p Array8 Array8p.
require import W16extra WArray512 WArray32 WArray16.
require import Ops.
require import List_hakyber.
require import KyberCPA_avx2.
require import KyberPoly_avx2_prevec.
require import Fq_avx2.

pragma +oldip.

lemma lift2poly_iso (p: W16.t Array256.t) (i k: int):
    0 <= i < 16 =>
    16 * i <= k < 16 * i + 16 => (lift2poly (get256 (WArray512.init16 (fun j => p.[j])) i)).[k %% 16] = p.[k].
proof.
move => i_b k_b.
have k_mb: 0 <= k %% 16 < 16.
  smt(@IntDiv).
rewrite /x.
rewrite /lift2poly initiE => />.
rewrite get256E => />.
rewrite k_mb //=.
rewrite initiE. move : k_mb => /#.
rewrite initiE. move : k_mb => /#.
simplify.
rewrite /init16.
rewrite initiE. move : k_mb => /#.
rewrite initiE. move : k_mb => /#.
simplify.
rewrite (_: (32 * i + (2 * (k %% 16) + 1)) %/ 2 = (32 * i + 2 * (k %% 16)) %/ 2).
  smt(@IntDiv).
rewrite (_: (32 * i + 2 * (k %% 16)) %% 2 = 0).
  smt(@IntDiv).
rewrite (_: (32 * i + (2 * (k %% 16) + 1)) %% 2 = 1).
  smt(@IntDiv).
rewrite pack2_bits8.
smt(@IntDiv).
qed.

lemma set_get_def (v : W16.t Array256.t) (w: W256.t) i j :
    0 <= i < 16 => 0 <= j < 256 =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16)
      else v.[j].
    proof.
    move => hx hs; rewrite set256E !get16E.
      rewrite -(W2u8.unpack8K (if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16) else v.[j])); congr.
      apply W2u8.Pack.ext_eq => k hk.
      rewrite W2u8.get_unpack8 //= W2u8.Pack.initiE 1:/# /=.
      rewrite initiE /=. move : hk hs => /#.
      rewrite initiE /=. move : hk hs => /#.
      have ->: (32 * i <= 2 * j + k < 32 * i + 32) = (16 * i <= j < 16 * i + 16) by smt().
      case : (16 * i <= j < 16 * i + 16) => h.
      + by rewrite W256_bits16_bits8 1:// /#.
      + by rewrite /init16 /#.
    qed.

lemma set_get_eq (v: W16.t Array256.t) (w: W256.t) i j:
    0 <= i < 16 => 0 <= j < 256 => 16 * i <= j < 16 * i + 16 =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      w \bits16 j %% 16.
    proof.
    by move => h1 h2 h3; rewrite set_get_def // h3.
  qed.

lemma set_get_diff (v: W16.t Array256.t) (w: W256.t) i j:
    0 <= i < 16 => 0 <= j < 256 => !(16 * i <= j < 16 * i + 16) =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      v.[j].
    proof.
    move => h1 h2 h3; rewrite set_get_def // h3. auto.
  qed.

lemma get_set_get_eqb (v: W16.t Array256.t) (w: W256.t) i:
  0 <= i < 16 => forall k, 0 <= k < i*16 =>
  v.[k] = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof.
move => i_i k k_i.
rewrite Array256.initiE.
move : i_i k_i; smt.
simplify.
rewrite set_get_def => /#.
qed.

lemma get_set_get_eqa (v: W16.t Array256.t) (w: W256.t) i:
  0 <= i < 16 => forall k, i*16 + 16 <= k < 256 =>
  v.[k] = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof.
move => i_i k k_i.
rewrite Array256.initiE.
move : i_i k_i => /#.
simplify.
rewrite set_get_def => /#.
qed.

lemma get_set_get_diff (v: W16.t Array256.t) (w: vt16u16) i:
  0 <= i < 16 => forall k, i*16 <= k < i*16 + 16 =>
  w \bits16 (k%%16) = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof.
move => i_i k k_i.
rewrite Array256.initiE.
move : i_i k_i => /#.
simplify.
rewrite set_get_def => /#.
qed.

theory KyberPolyAVX.

import Fq.
import SignedReductions.
import Kyber_.
import ZModField.


op signed_bound_cxq(coefs : W16.t Array256.t, l u c : int) : bool =
  forall k, l <= k < u => b16 coefs.[k] (c*Kyber_.q).

op pos_bound256_cxq (coefs : W16.t Array256.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

op pos_bound256_b (coefs : W16.t Array256.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] b.

op lift_array256 (p: W16.t Array256.t) =
  Array256.map (fun x => inzmod (W16.to_sint x)) p.

lemma lift_array256E (x : W16.t Array256.t) k :
  0 <= k < 256 =>
  (lift_array256 x).[k] = inzmod (to_sint x.[k]).
proof.  by move => ?; rewrite /lift_array256 mapiE //. qed.

lemma lift_array256P (x y : W16.t Array256.t) :
  lift_array256 x = lift_array256 y <=>
  (forall k, 0 <= k < 256 => inzmod (to_sint x.[k]) = inzmod (to_sint y.[k])).
proof.
  split; first by rewrite tP => H *; rewrite -!lift_array256E // H //.
  by rewrite tP => H *; rewrite !lift_array256E // H //.
qed.

lemma get_lift_array256_eq (p: W16.t Array256.t):
  let p_lift = lift_array256 p in
  forall k, 0 <= k < 256 => p_lift.[k] = inzmod (W16.to_sint p.[k]).
proof.
rewrite /lift_array256 => p_lift. rewrite /p_lift.
move => k k_i.
smt (@Array256).
qed.

lemma poly_add_corr _a _b ab bb :
      hoare[ Mavx2_prevec.poly_add2 :
           (0 <= ab <= 6 /\ 0 <= bb <= 3) /\
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
             inzmod (to_sint res.[k]) = _a.[k] + _b.[k]].
bypr => &m [[ma_i mb_i] [_ma_def] [_mb_def] [msgnd_bnd_rp] msgnd_bnd_bp].
byphoare (_ : _a = lift_array256 rp /\
              _b = lift_array256 bp /\
              signed_bound_cxq rp 0 256 ab /\
              signed_bound_cxq bp 0 256 bb ==>
              !(signed_bound_cxq res 0 256 (ab + bb) /\
              forall (k : int), 0 <= k && k < 256 => inzmod (to_sint res.[k]) = _a.[k] + _b.[k]) ) => //.
hoare.
simplify.
  proc.
  sp.
  while (
  0 <= i <= 16 /\
  (forall k, 16*i <= k < 256 =>
    inzmod (to_sint rp.[k]) = _a.[k]) /\
  _b = lift_array256 bp /\
    signed_bound_cxq rp (16*i) 256 ab /\
    signed_bound_cxq bp 0 256 bb /\
    signed_bound_cxq rp 0 (16*i) (ab + bb) /\
  (forall k, 0 <= k < (16*i) =>
    inzmod (to_sint rp.[k]) = _a.[k] + _b.[k])
); last first.
auto => />.
move => *.
do split.
  smt(@Array256).
  smt().
  smt(@Array256).
move => *.
split. 
  smt(@Array256).
  smt(@Array256).
inline Ops.ivadd16u256.
wp; skip.
move => &hr [#] i_lb i_ub _a_def _b_def sgnd_bnd_rp_b sgnd_bnd_bp sgnd_bnd_rp_a _a_plus_b i_tub x y.
rewrite (_:
r0{hr}.[0 <- x.[0] + y.[0]].[1 <- x.[1] + y.[1]]
      .[2 <- x.[2] + y.[2]].[3 <- x.[3] + y.[3]]
      .[4 <- x.[4] + y.[4]].[5 <- x.[5] + y.[5]]
      .[6 <- x.[6] + y.[6]].[7 <- x.[7] + y.[7]]
      .[8 <- x.[8] + y.[8]].[9 <- x.[9] + y.[9]]
      .[10 <- x.[10] + y.[10]].[11 <- x.[11] + y.[11]]
      .[12 <- x.[12] + y.[12]].[13 <- x.[13] + y.[13]]
      .[14 <- x.[14] + y.[14]].[15 <- x.[15] + y.[15]]
= fill (fun k => x.[k] + y.[k]) 0 16 r0{hr}).
  apply  Array16.ext_eq => /> x0 x0_lb x0_ub.
  do rewrite get_setE; first 16 (move : x0_lb x0_ub => /#).
  rewrite filliE => //.
  smt(@Array16).
move => r i.
rewrite /i /r.
do split. 
  move : i_lb => /#.
  move : i_tub => /#. 
  move => k k_i.
  rewrite filliE. move : k_i i_lb => /#.
  rewrite -_a_def. move : k_i i_lb => /#.
move : k_i.
rewrite mulzDr /=.
smt(@Array256).
apply _b_def.

rewrite /signed_bound_cxq => k k_i.
rewrite filliE. move : i_lb k_i => /#.
move : sgnd_bnd_rp_b.
rewrite /signed_bound_cxq.
move : k_i.
smt(@Array256 @Array16).
apply sgnd_bnd_bp.

rewrite /signed_bound_cxq => k k_i.

case (k < 16 * (i - 1)).
rewrite filliE => //. move : k_i i_tub => /#.
move => k_ub.
rewrite /i -addzA addzN addz0 ltzNge /= in k_ub.
rewrite k_ub /=.
rewrite -ltzNge in k_ub.
move : sgnd_bnd_rp_a => /#.

rewrite -lezNgt /i -addzA addzN addz0 => k_ub.
rewrite filliE. move : k_i i_tub => /#.
have ->: ((16 * (i-1) <= k && k < 16 * (i-1) + 16) = true).
  by smt(@Int @IntDiv).
simplify.
have k_mb: 0 <= k %% 16 < 16.
  smt(@IntDiv).
rewrite filliE => />.
rewrite k_mb /=.

rewrite /x /y.
do rewrite lift2poly_iso //=.
move : k_i k_ub => /#.
move : k_i k_ub => /#.

move : (add_corr_qv rp{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 6 3 _ _ _ _ _ _) => />; first 2 by smt(@Array256).

split.
  move : (sgnd_bnd_rp_b k _) => /#. move : (sgnd_bnd_rp_b k _) => /#.
  move : (sgnd_bnd_bp k _) => /#. 

move => *.
rewrite to_sintD_small => />.
move : (sgnd_bnd_rp_b k _); first by smt().
move : (sgnd_bnd_bp k _); first by smt().
move => *.
rewrite /b16 in H2.
rewrite /b16 in H3.
split.
move : H2 => /#.
move : H3 => /#.
split.
move : (sgnd_bnd_rp_b k _) (sgnd_bnd_bp k _) => /#.
move : (sgnd_bnd_rp_b k _) (sgnd_bnd_bp k _) => /#.

move => k k_i.
case (k < 16 * (i - 1)).
rewrite filliE => //. move : k_i i_tub => /#.
move => k_ub.
rewrite /i -addzA addzN addz0 ltzNge /= in k_ub.
rewrite k_ub /=.
rewrite -ltzNge in k_ub.
apply (_a_plus_b k).
move : k_i k_ub => /#.

rewrite -lezNgt /i -addzA addzN addz0 => k_ub.
rewrite filliE. move : k_i i_tub => /#.
have ->: ((16 * (i-1) <= k && k < 16 * (i-1) + 16) = true).
  by smt(@Int @IntDiv).
simplify.
have k_mb: 0 <= k %% 16 < 16.
  smt(@IntDiv).
rewrite filliE => />.
rewrite k_mb /=.
rewrite /x /y.
do rewrite lift2poly_iso //=.
move : k_i k_ub => /#.
move : k_i k_ub => /#.

move : (add_corr_qv rp{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 6 3 _ _ _ _ _ _) => />.
move : (_a_def k _) => /#.
move : _b_def. rewrite /lift_array256. smt(@Array256).

split.
  move : (sgnd_bnd_rp_b k _) => /#. 
  move : (sgnd_bnd_rp_b k _) => /#.
  move : (sgnd_bnd_bp k _) => /#. 
qed.


lemma poly_sub_corr _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>  
      hoare[ Mavx2_prevec.poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inzmod (to_sint res.[k]) = _a.[k] - _b.[k]]. 
proof.
move => *.
proc. 
while (
           0 <= i <= 16 /\
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (16*i) (ab + bb) /\ 
           forall k, 0 <= k < (16*i) =>
              inzmod (to_sint rp.[k]) = _a.[k] - _b.[k]
); first last.
auto => />.
move => *.
do split.
 smt(@Array256).
 smt.
 smt(@Array256).
move => *.
 inline Ops.ivsub16u256; wp; skip.
move => &hr [#] i_lb i_ub _a_def _b_def sgnd_bnd_ap_b sgnd_bnd_bp sgnd_bnd_ap_a _a_minus_b i_tub x y.
rewrite (_:
r0{hr}.[0 <- x.[0] - y.[0]].[1 <- x.[1] - y.[1]]
      .[2 <- x.[2] - y.[2]].[3 <- x.[3] - y.[3]]
      .[4 <- x.[4] - y.[4]].[5 <- x.[5] - y.[5]]
      .[6 <- x.[6] - y.[6]].[7 <- x.[7] - y.[7]]
      .[8 <- x.[8] - y.[8]].[9 <- x.[9] - y.[9]]
      .[10 <- x.[10] - y.[10]].[11 <- x.[11] - y.[11]]
      .[12 <- x.[12] - y.[12]].[13 <- x.[13] - y.[13]]
      .[14 <- x.[14] - y.[14]].[15 <- x.[15] - y.[15]]
= fill (fun k => x.[k] - y.[k]) 0 16 r0{hr}).
  apply  Array16.ext_eq => /> x0 x0_lb x0_ub.
  do rewrite get_setE; first 16 (move : x0_lb x0_ub => /#).
  rewrite filliE => //.
  smt(@Array16).
move => r i.
split.
 rewrite /i; move : i_lb i_tub => /#.
do split.
apply _a_def.
apply _b_def.
apply sgnd_bnd_ap_b.
apply sgnd_bnd_bp.

rewrite /signed_bound_cxq => k k_i.
have k_mb: 0 <= k %% 16 < 16.
  by smt(@IntDiv).
rewrite /r.
rewrite filliE. move : k_i i_tub => /#.
simplify.
rewrite filliE //=.
rewrite k_mb //=.

case (k < 16 * (i - 1)).
rewrite /i -addzA addzN addz0 ltzNge => k_ub.
rewrite k_ub /=.
rewrite -ltzNge in k_ub.
apply (sgnd_bnd_ap_a k).
move : k_i k_ub => /#.

rewrite -lezNgt /i -addzA addzN addz0 => k_lb.
rewrite /i mulzDr /= in k_i.
have ->: ((16 * (i-1) <= k && k < 16 * (i-1) + 16) = true).
  by smt(@Int @IntDiv).
simplify.
rewrite /x /y.
do rewrite lift2poly_iso //=.
move : k_i k_lb => /#.
move : k_i k_lb => /#.

move : (sub_corr ap{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 14 14 _ _ _ _ _ _) => />; first 2 by smt(@Array256).

move : (sgnd_bnd_ap_b k _) => /#.
move : (sgnd_bnd_bp k _) => /#.

move => *.
rewrite to_sintB_small => />.
move : (sgnd_bnd_ap_b k _) (sgnd_bnd_bp k _) => /#.
move : (sgnd_bnd_ap_b k _) (sgnd_bnd_bp k _) => /#.

move => k k_i.
have k_mb: 0 <= k %% 16 < 16.
  by smt(@IntDiv).

rewrite /r.
rewrite filliE. move : k_i i_tub => /#.
simplify.
rewrite filliE //=.
rewrite k_mb //=.

case (k < 16 * (i-1)).
rewrite /i -addzA addzN addz0 ltzNge => k_ub.
rewrite k_ub /=.
rewrite -ltzNge in k_ub.
apply _a_minus_b.
move : k_i k_ub => /#.

rewrite -lezNgt /i -addzA addzN addz0 => k_lb.
rewrite /i mulzDr /= in k_i.
have ->: ((16 * (i-1) <= k && k < 16 * (i-1) + 16) = true).
  by smt(@Int @IntDiv).
simplify.
rewrite /x /y.
do rewrite lift2poly_iso //=.
move : k_i k_lb => /#.
move : k_i k_lb => /#.

move : (sub_corr ap{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 14 14 _ _ _ _ _ _) => />; first 2 by smt(@Array256).
move : (sgnd_bnd_ap_b k _) => /#.
move : (sgnd_bnd_bp k _) => /#.
qed.

(* FIXME: dup from KyberPoly*)
lemma m1true x :
  0 <= x < 16 =>
    (W16.of_int 65535).[x].
proof.
move => *.
rewrite of_intwE => />.
rewrite /int_bit => />. 
case (x = 0); first by smt(@Ring.IntID) => />.
move => *; case(x=1); first by auto => />.
move => *; case(x=2); first by auto => />.
move => *; case(x=3); first by auto => />.
move => *; case(x=4); first by auto => />.
move => *; case(x=5); first by auto => />.
move => *; case(x=6); first by auto => />.
move => *; case(x=7); first by auto => />.
move => *; case(x=8); first by auto => />.
move => *; case(x=9); first by auto => />.
move => *; case(x=10); first by auto => />.
move => *; case(x=11); first by auto => />.
move => *; case(x=12); first by auto => />.
move => *; case(x=13); first by auto => />.
move => *; case(x=14); first by auto => />.
move => *; case(x=15); first by auto => />.
smt().
qed.

lemma getsign x :
      (x \slt W16.zero => x `|>>` (of_int 15)%W8 = (of_int 65535)%W16) /\
      (W16.zero \sle x => x `|>>` (of_int 15)%W8 = W16.zero).
proof.
rewrite /(`|>>`) sarE sltE sleE !to_sintE /smod => />.
split; move => hh.
  have  xb : (32768 <= to_uint x); first by smt(W16.to_uint_cmp).
  apply W16.ext_eq => k kb; rewrite initiE => />.
  rewrite (_: min 15 (k+15) = 15); first by smt().
  by rewrite m1true // get_to_uint => />;smt().
have  xb : (0 <= to_uint x < 32768).
   split; first by smt().
   case (32768 <= to_uint x).
      move => *.
      have ? : false;  move : (W16.to_uint_cmp x) => />; smt().
      smt(). 
move => *.
  apply W16.ext_eq => k kb; rewrite initiE => />.
  rewrite (_: min 15 (k+15) = 15); first by smt().
  by rewrite get_to_uint => />;smt().
qed.


lemma poly_csubq_corr_h ap :
      hoare[ Mavx2_prevec.poly_csubq :
             ap = lift_array256 rp /\
             pos_bound256_cxq rp 0 256 2
             ==>
             ap = lift_array256 res /\
             pos_bound256_cxq res 0 256 1 ].
proof.
proc.
while (ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 2 /\ pos_bound256_cxq rp 0 (16*i) 1 /\ 0 <= i <= 16 /\ forall k, 0 <= k < 16 => _qx16.[k] = KyberCPA_avx2.jqx16.[k]).
seq 3 : (#pre /\ forall k, 0 <= k < 16 => _r.[k] = rp.[16 * i + k] - _qx16.[k]).
inline Ops.ivsub16u256.
wp. skip. simplify.
move => &hr [#] *.
split.
trivial.
move => k k_i.
do rewrite get_set_if => />.
rewrite -(lift2poly_iso _ i{hr}) => /#.
seq 2 : (#pre /\
         (forall k, 0 <= k < 16 => (t.[k] = if _r.[k] \slt W16.zero then _qx16.[k] else W16.zero))).
seq 1 : (#pre /\
         (forall k, 0 <= k < 16 => (t.[k] = if _r.[k] \slt W16.zero then W16.of_int (W16.modulus - 1) else W16.zero))).
auto => />.
move => &hr [#] *.
do split.
apply H.
apply H0.
apply H1.
apply H2.
move => *; apply H3.
apply H4.
apply H5.
move => k k_i.
move : H6 => /#.
move : H6 => /#.
inline Ops.iVPSRA_16u16.
auto => />.
move => &hr [#] *.
do rewrite get_set_if => />.
case (_r{hr}.[k] \slt W16.zero).
smt(getsign @Array16 @W16).
rewrite W16.sltE ltzNge -W16.sleE => /=.
smt(getsign @Array16 @W16).
auto => />.
move => &hr [#] *.
do split.
apply H.
apply H0.
apply H1.
apply H2.
move => *; apply H3.
apply H4.
move : H5 => //=.
move : H6 => /#.
move : H7 => /#.
inline Ops.ivpand16u16.
auto => />.
move => &hr pos_bound_2 pos_bound_1 i_lb i_eub _qx16_def i_ub _r_def  t_def k k_lb k_ub.
rewrite (_:
r0{hr}.[0 <- t{hr}.[0] `&` _qx16{hr}.[0]].[1 <- t{hr}.[1] `&` _qx16{hr}.[1]]
      .[2 <- t{hr}.[2] `&` _qx16{hr}.[2]].[3 <- t{hr}.[3] `&` _qx16{hr}.[3]]
      .[4 <- t{hr}.[4] `&` _qx16{hr}.[4]].[5 <- t{hr}.[5] `&` _qx16{hr}.[5]]
      .[6 <- t{hr}.[6] `&` _qx16{hr}.[6]].[7 <- t{hr}.[7] `&` _qx16{hr}.[7]]
      .[8 <- t{hr}.[8] `&` _qx16{hr}.[8]].[9 <- t{hr}.[9] `&` _qx16{hr}.[9]]
      .[10 <- t{hr}.[10] `&` _qx16{hr}.[10]].[11 <- t{hr}.[11] `&` _qx16{hr}.[11]]
      .[12 <- t{hr}.[12] `&` _qx16{hr}.[12]].[13 <- t{hr}.[13] `&` _qx16{hr}.[13]]
      .[14 <- t{hr}.[14] `&` _qx16{hr}.[14]].[15 <- t{hr}.[15] `&` _qx16{hr}.[15]]
= fill (fun k => t{hr}.[k] `&` _qx16{hr}.[k]) 0 16 r0{hr}).
  rewrite fillE. apply  Array16.ext_eq => /> *.
  do rewrite get_setE; first 16 (move : i_lb i_ub => /#).
  rewrite initiE => //.
  smt(@Array16).
rewrite filliE => //.
rewrite k_lb k_ub=> />.
rewrite t_def.
rewrite k_lb k_ub=> />.
case (_r{hr}.[k] \slt W16.zero).
move => _r_ub.
rewrite -/W16.onew and1w => //.
rewrite -/W16.zero and0w => //.
wp.
ecall (ivadd16u256_spec t _r).
auto => />.
move => &hr pos_bound_2 pos_bound_1 i_lb i_eub _qx16_def i_ub _r_def t_def result result_def.
split.
rewrite /lift_array256 => />.
apply Array256.ext_eq.
move => x x_b.
do rewrite mapiE => />.
have x_mb : 0 <= x %% 16 && x %% 16 < 16.
  move : x_b => /#.
rewrite filliE => />.
rewrite (result_def (x %% 16)).
rewrite fun_if fun_if.
rewrite _r_def //.
rewrite t_def //.
case (16 * i{hr} <= x < 16 * i{hr} + 16); first last.
trivial.
move => x_i.
case (_r{hr}.[x %% 16] \slt W16.zero).
rewrite (W16.WRingA.addrC _qx16{hr}.[_] _).
rewrite subrK.
smt(@Array256 @W16).
rewrite add0r_s.
move => _r_ub.
rewrite to_sintD_small.
move : pos_bound_2; rewrite /pos_bound256_cxq => bnd.
move : (bnd (16 * i{hr} + x %% 16) _); first by smt(@W64).
auto => />.
rewrite qE => /> *.
split.

(****)
rewrite to_sintN => //=.
rewrite (_qx16_def (x%% 16))  => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: Ring.IntID.(^) 2 (16 - 1) <= 3329 <=> false. smt().
simplify.
smt.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
do rewrite (fun_if ((+) (to_sint rp{hr}.[16 * i{hr} + x %% 16])) _ _ _).
smt.
(****)

rewrite to_sintN => //=.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: Ring.IntID.(^) 2 (16 - 1) <= 3329 <=> false. smt().
simplify.
smt.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: Ring.IntID.(^) 2 (16 - 1) <= 3329 <=> false. smt().
simplify.
smt.
(****)

rewrite _qx16_def => //=.
rewrite (_: rp{hr}.[16 * i{hr} + x %% 16] = rp{hr}.[x]).
  by move : x_i x_mb => /#.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite inzmodD. ring.
do rewrite (fun_if inzmod _ _ _).
do rewrite (fun_if  ZModField.([-]) _ _ _).
rewrite to_sintE /smod to_uintN => />.

(***)
have zero_congr_3329: 3329 %% q = 0.
  by rewrite qE; smt.
rewrite inzmodN.
rewrite /zero.
have ->: - - inzmod 3329 = inzmod 3329. smt(@ZModField).
rewrite -inzmodN.
do rewrite -(fun_if inzmod _ _ _).
rewrite -eq_inzmod.
smt.

(****)
move : pos_bound_2 pos_bound_1; rewrite /pos_bound256_cxq => /> *.
split.
move => k k_lb k_ub.
have k_mb : 0 <= k %% 16 && k %% 16 < 16.
  move : k_lb k_ub => /#.
rewrite filliE => />.
rewrite (result_def (k %% 16)).
rewrite fun_if fun_if.
rewrite _r_def //.
rewrite t_def //.
case (16 * i{hr} <= k < 16 * i{hr} + 16); last first.
by move : (H k); rewrite /bpos16 => /#.
move => k_b.
have idx_bounds: 0 <= 16 * i{hr} + k %% 16 && 16 * i{hr} + k %% 16 < 256.
  move : k_b i_lb i_ub => /#.
case (_r{hr}.[k %% 16] \slt W16.zero).
move => _r_ub.
rewrite addrC.
rewrite (_: rp{hr}.[16 * i{hr} +  k %% 16] - _qx16{hr}.[k%%16] + _qx16{hr}.[k%%16] = rp{hr}.[16 * i{hr} + k %% 16]). ring.
split.
move : (H (16 * i{hr} + k %% 16) _).
move : k_b k_mb => /#.
trivial.

(*****)
rewrite qE => />.
move => sint_rp_lb.
rewrite to_sint_unsigned.
done.
rewrite -to_sint_unsigned.
done.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds.
simplify.
rewrite qE.
simplify.
smt.

(*****)
move => _r_lb.
auto => />.
split.

(*****)
move : _r_lb.
rewrite _r_def => //.
rewrite W16.sltE.
rewrite to_sintB_small.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
do rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds.
simplify.
rewrite qE.
simplify.
smt().
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
do rewrite of_sintK.
simplify.
rewrite /smod /=.
smt.

(******)
rewrite to_sintD_small => />.
rewrite to_sintN => />.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
do rewrite of_sintK => />.
rewrite /smod => />.
smt.
split.

(******)
move : _r_lb.
rewrite _r_def => //.
rewrite sltE.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
rewrite to_sintB_small.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds.
simplify.
rewrite qE.
simplify.
smt().
do rewrite fun_if.
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move => *.
smt().
(******)

move => rp_qx16_lb.

(******)
move : _r_lb.
rewrite _r_def => //.
rewrite sltE.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
rewrite to_sintB_small.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds.
simplify.
rewrite qE.
simplify.
smt().
do rewrite fun_if.
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move : rp_qx16_lb.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds.
simplify.
rewrite qE.
simplify.
smt().
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite to_sintN /=.
  rewrite of_sintK. simplify. rewrite /smod => />.
rewrite of_sintK /=.
rewrite /smod /=.
move => rp_q_lb.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds.
simplify.
rewrite qE.
simplify.
smt().

(******)
split; last by smt(@W64).
move => k k_lb k_ub.
have k_mb : 0 <= k %% 16 && k %% 16 < 16.
  move : k_lb k_ub => /#.
rewrite filliE => />.
move : i_ub k_ub => /#.
rewrite (result_def (k %% 16)).
rewrite fun_if fun_if.
rewrite _r_def //.
rewrite t_def //.
case (16 * i{hr} <= k < 16 * i{hr} + 16); last first.
rewrite andaE negb_and.
rewrite -lezNgt -ltzNge.
move => k_i.
move : (H0 k _) => /> *.
move : k_ub k_i => /#.

move => k_i.
have idx_bounds: 0 <= 16 * i{hr} + k %% 16 && 16 * i{hr} + k %% 16 < 256.
  move : k_i i_lb i_ub => /#.
case (_r{hr}.[k %% 16] \slt W16.zero).
move => _r_ub.
rewrite qE => />.
rewrite addrC.
rewrite (_: rp{hr}.[16 * i{hr} + k %% 16] - _qx16{hr}.[k %% 16] + _qx16{hr}.[k %% 16] =  (rp{hr}.[16 * i{hr} + k %% 16])); first by ring.
split.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds.
simplify.
trivial.

(******)
move => rp_lb.
rewrite _r_def in _r_ub => //.
move : _r_ub.
rewrite sltE.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
rewrite to_sintB_small.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds => /> *.
smt(@W64).
do rewrite fun_if.
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move => *.
smt.

(******)
move => _r_lb.
rewrite _r_def in _r_lb.
auto => />.
split.

(******)
move : _r_lb.
rewrite sltE.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
rewrite to_sintB_small.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds => /> *.
smt(@W64).
do rewrite fun_if.
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move => *.
smt.
(******)

move => _sr_lb.
simplify.
rewrite to_sintD_small => />.
rewrite to_sintN => />.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite of_sintK => />.
rewrite /smod => />.
smt.
split.

(******)
move : _r_lb.
rewrite sltE.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
rewrite to_sintB_small.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds => /> *.
smt(@W64).
do rewrite fun_if.
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move => *.
smt.

(******)
move => rp_qx16_lb.
move : _r_lb.
rewrite sltE.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
rewrite to_sintB_small.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds => /> *.
smt(@W64).
do rewrite fun_if.
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move => _r_lb.
move : _sr_lb rp_qx16_lb.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
rewrite to_sintB_small.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds => /> *.
smt(@W64).
do rewrite fun_if.
rewrite of_sintK /=.
rewrite /smod /=.
move => rp_qx16_lb_0 rp_qx16_lb_word.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds => /> *.
smt(@W64).

rewrite qE.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite to_sintN of_sintK => />.
rewrite /smod => />.

move : _r_lb.
rewrite sltE.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
rewrite to_sintB_small.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds => /> *.
smt(@W64).
do rewrite fun_if.
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move => rp_q_lb_neg.
move : _sr_lb.
rewrite _qx16_def => //=.
rewrite /(KyberCPA_avx2.jqx16).
rewrite get_of_list => />.
rewrite to_sintB_small.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (16 * i{hr} + k %% 16)).
rewrite idx_bounds => /> *.
smt(@W64).
do rewrite fun_if.
rewrite of_sintK /=.
rewrite /smod /=.
move => rp_q_lb.
move : H H0 rp_q_lb_neg rp_q_lb; rewrite qE => />.
trivial.
move => rp_2q_bnd rp_q_bnd rp_q_lb_neg rp_q_lb.
move : (rp_2q_bnd (16 * i{hr} + k %% 16)).
rewrite idx_bounds => />.
smt.
(******)

auto => />.
move => &hr *.
split.
split. smt.

move => k k_lb k_ub.
rewrite /lift2poly initiE => />.
rewrite /get256_direct => />.
rewrite k_lb k_ub => /=.
rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
rewrite initiE. move : k_lb k_ub => /#. simplify.
rewrite initiE. move : k_lb k_ub => /#. simplify.
rewrite (_:(2*k + 1) %/2 = 2*k %/ 2).
  smt(@Int @IntDiv).
rewrite (_: 2*k %% 2 = 0).
  smt(@IntDiv).
rewrite (_: (2*k + 1) %% 2 = 1).
  smt(@IntDiv).
rewrite pack2_bits8.
smt(@IntDiv).
move => i0 rp0.
auto => /> /#.
qed.

lemma poly_csubq_ll : islossless Mavx2_prevec.poly_csubq.
proof.
proc.
while (0 <= i <= 16) (16 - i); auto => />.
inline Ops.ivsub16u256 Ops.iVPSRA_16u16 Ops.ivpand16u16 Ops.ivadd16u256.
auto => />.
smt(@W16).
smt(@W16).
qed.

lemma poly_csubq_corr ap :
      phoare[ Mavx2_prevec.poly_csubq :
           ap = lift_array256 rp /\
           pos_bound256_cxq rp 0 256 2 
           ==>
           ap = lift_array256 res /\
           pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_csubq_ll (poly_csubq_corr_h ap).

lemma poly_reduce_corr_h (ap: zmod Array256.t):
     hoare[ Mavx2_prevec.poly_reduce :
          ap = lift_array256 rp ==>
          ap = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16 res.[k] (2*Kyber_.q)].
proof.
proc.
exists *rp; elim* => _rp.
conseq (_:
  _rp = rp /\
 (forall i, 0<= i < 256 =>
              inzmod (to_sint rp.[i]) = ap.[i]) ==> 
           forall i, 0<= i < 256 =>
              to_sint rp.[i] = BREDC (to_sint _rp.[i]) 26
). 
move => &hr.
rewrite /lift_array256 => />*.
rewrite mapiE => />.
move => &hr.
rewrite /lift_array256 => />*.
split.
apply Array256.ext_eq => />.
move => x x_lb x_ub.
rewrite !mapiE => />.
move : (H x _).
rewrite x_lb x_ub => //.
move : (BREDCp_corr (to_sint rp{hr}.[x]) 26 _ _ _ _ _ _) => />.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.

rewrite /R => />.

split.
rewrite to_sintE.
have uint_non_neg: 0 <= to_uint rp{hr}.[x] < W16.modulus by rewrite to_uint_cmp.
rewrite /smod /=.
case (32768 <= to_uint rp{hr}.[x]).
smt.
smt.

move => *.
rewrite !to_sintE.
rewrite /smod.
move : (W16.to_uint_cmp rp{hr}.[x]); smt().

move => a; rewrite /R /= => a_lb a_ub.
rewrite qE /=.
split.
rewrite /Barrett_kyber_general.barrett_pred_low.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().
rewrite /Barrett_kyber_general.barrett_pred_high.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().

admit. (* FIXME: by smt(@W16 @Ring.IntID @JWord.W16.WRingA @IntDiv to_sint_unsigned b16E qE). *)

move => k k_lb k_ub.
move : (H k _ ) => />.
move => rp_bred.
move : (BREDCp_corr (to_sint rp{hr}.[k]) 26  _ _ _ _ _ _) => />.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.

rewrite ?qE /R => />.

split.
rewrite to_sintE.
have rp_uint_bounds: 0 <= to_uint rp{hr}.[k] < W16.modulus by rewrite to_uint_cmp.
rewrite /smod /=.
case (32768 <= to_uint rp{hr}.[k]) => ?.
smt().
smt().

move => rp_sint_lb.
rewrite !to_sintE.
rewrite /smod.
move : (W16.to_uint_cmp rp{hr}.[k]); smt().

move => a; rewrite /R /= => a_lb a_ub.
split.
rewrite /Barrett_kyber_general.barrett_pred_low.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().
rewrite /Barrett_kyber_general.barrett_pred_high.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().

by smt(@W16 @Ring.IntID @JWord.W16.WRingA @IntDiv to_sint_unsigned b16E).
while (0 <= i <= 16 /\
       (forall k, 0 <= k < 16 * i => to_sint rp.[k] = (BREDC (to_sint _rp.[k]) 26)) /\
       (forall k, 16 * i <= k < 256 => to_sint rp.[k] =  (to_sint _rp.[k])) /\
       (forall k, 0 <= k < 16 => qx16.[k] = KyberCPA_avx2.jqx16.[k]) /\
       (forall k, 0 <= k < 16 => vx16.[k] = KyberCPA_avx2.jvx16.[k])); last first.
auto => /> H.
do split; first by smt().

move => k k_lb k_ub.
rewrite /lift2poly initiE => />.
rewrite /get256_direct => />.
rewrite k_lb k_ub => /=.
rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
rewrite initiE. move : k_lb k_ub => /#. simplify.
rewrite initiE. move : k_lb k_ub => /#. simplify.
rewrite (_:(2*k + 1) %/2 = 2*k %/ 2).
  smt(@Int @IntDiv).
rewrite (_: 2*k %% 2 = 0).
  smt(@IntDiv).
rewrite (_: (2*k + 1) %% 2 = 1).
  smt(@IntDiv).
rewrite pack2_bits8.
smt(@IntDiv).

move => k k_lb k_ub.
rewrite /lift2poly initiE => />.
rewrite /get256_direct => />.
rewrite k_lb k_ub => /=.
rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
rewrite initiE. move : k_lb k_ub => /#. simplify.
rewrite initiE. move : k_lb k_ub => /#. simplify.
rewrite (_:(2*k + 1) %/2 = 2*k %/ 2).
  smt(@Int @IntDiv).
rewrite (_: 2*k %% 2 = 0).
  smt(@IntDiv).
rewrite (_: (2*k + 1) %% 2 = 1).
  smt(@IntDiv).
rewrite pack2_bits8.
smt(@IntDiv).

move => i0 rp0.
move : H; simplify. admit. (* FIXME: smt(@W16 @W64). *)
wp; sp; ecall (Fq_avx2.barret_red16x_corr_h (Fq_avx2.lift_array16 r)); auto => />.
move => &hr i_lb i_rub rp_sbred rp_eq__rp qx16_def vx16_def i_ub result red16x_bred.
do split.
move : i_lb => /#.
move : i_ub => /#.
rewrite mulzDr mulz1.
move => k k_lb k_ub.
rewrite filliE.
rewrite k_lb /=.
move : i_ub k_ub => /#.
case (k < 16*i{hr}) => k_tub.
rewrite ltzNge in k_tub.
rewrite k_tub /=.
rewrite -ltzNge in k_tub.
rewrite (rp_sbred k _) //.
move : k_tub.
rewrite -lezNgt.
move => k_tlb.
rewrite k_tlb k_ub /=.
rewrite (red16x_bred (k %% 16) _).
move : k_tlb k_ub => /#.
rewrite /lift_array16 /=.
rewrite mapiE.
move : k_tlb k_ub => /#.
rewrite lift2poly_iso //.
rewrite rp_eq__rp.
rewrite k_tlb /=.
move : i_ub k_ub => /#.
trivial.
rewrite mulzDr mulz1.
move => k k_lb k_ub.
rewrite filliE //.
move : k_lb k_ub => /#.
simplify.
rewrite lezNgt in k_lb.
rewrite k_lb /=.
rewrite -lezNgt in k_lb.
rewrite rp_eq__rp.
rewrite k_ub //; move : k_lb => /#.
trivial.
qed.

lemma poly_reduce_ll:
  islossless Mavx2_prevec.poly_reduce.
proof.
proc; while(0 <= i <= 16) (16 - i);
  move => *; inline *; auto => />.
move => &hr i_lb i_ub i_tub.
split.
move : i_lb i_tub => /#.
smt(@Int).
smt(@W64).
qed.

lemma poly_reduce_corr ap:
  phoare[ Mavx2_prevec.poly_reduce :
        ap = lift_array256 rp ==>
        ap = lift_array256 res /\
        forall k, 0 <= k < 256 => bpos16 res.[k] (2*Kyber_.q)] = 1%r.
proof. by conseq poly_reduce_ll (poly_reduce_corr_h ap). qed.

lemma poly_frommont_corr_h ap:
  hoare[ Mavx2_prevec.poly_frommont :
       ap = map W16.to_sint rp ==>
       map W16.to_sint res = map (fun x => SREDC (x * ((Ring.IntID.(^) R 2) %% q))) ap].
proof.
proc.
while(0 <= i <= 16 /\ aux = 16 /\
      (forall k, 0 <= k < 16 => dmontx16.[k] = W16.of_int 1353) /\
      (forall k, 0 <= k < 16 => qx16.[k] = W16.of_int 3329) /\
      (forall k, 0 <= k < 16 => qinvx16.[k] = W16.of_int (-3327)) /\
      (forall k, 0 <= k < 16 * i => W16.to_sint rp.[k] = SREDC (ap.[k] * ((Ring.IntID.(^) R 2) %% q))) /\
      (forall k, 16 * i <= k < 256 => W16.to_sint rp.[k] = ap.[k])); last first.
auto => />.
move => &hr.
do split.

move => k k_lb k_ub.
rewrite /lift2poly //=.
rewrite initiE //.
rewrite /get256_direct //=.
rewrite k_lb k_ub /=.
rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
rewrite (_: (2 * k + 1) %/ 2 = (2 * k) %/ 2).
  by smt(@IntDiv).
rewrite (_: 2 * k %% 2 = 0).
  by smt(@IntDiv).
rewrite (_: (2 * k + 1) %% 2 = 1).
  by smt(@IntDiv).
rewrite pack2_bits8.
rewrite /(KyberCPA_avx2.jdmontx16) => />.
rewrite initiE => />. move : k_lb k_ub => /#.
smt(@Array16).

move => k k_lb k_ub.
rewrite /lift2poly //=.
rewrite initiE //.
rewrite /get256_direct //=.
rewrite k_lb k_ub /=.
rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
rewrite (_: (2 * k + 1) %/ 2 = (2 * k) %/ 2).
  by smt(@IntDiv).
rewrite (_: 2 * k %% 2 = 0).
  by smt(@IntDiv).
rewrite (_: (2 * k + 1) %% 2 = 1).
  by smt(@IntDiv).
rewrite pack2_bits8.
rewrite /(KyberCPA_avx2.jqx16) => />.
rewrite initiE => />. move : k_lb k_ub => /#.
smt(@Array16).

move => k k_lb k_ub.
rewrite /lift2poly //=.
rewrite initiE //.
rewrite /get256_direct //=.
rewrite k_lb k_ub /=.
rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
rewrite (_: (2 * k + 1) %/ 2 = (2 * k) %/ 2).
  by smt(@IntDiv).
rewrite (_: 2 * k %% 2 = 0).
  by smt(@IntDiv).
rewrite (_: (2 * k + 1) %% 2 = 1).
  by smt(@IntDiv).
rewrite pack2_bits8.
rewrite initiE => />. move : k_lb k_ub => /#.
smt(@Array16).

smt(@Array256).
smt(@Array256).
move => i rp i_tlb i_lb i_ub jdmontx16_def jqinvx16_def jqx16_def rp_sredc rp_sint_rp0.
apply Array256.ext_eq.
move => x x_bnds.
do rewrite mapiE => //.
simplify.
rewrite -lezNgt in i_tlb.
rewrite (rp_sredc x).
move : i_tlb i_ub x_bnds => /#.
rewrite mapiE //.
sp. wp.
ecall (Fq_avx2.fqmulx16_corr_h (Fq_avx2.lift_array16 t) (Fq_avx2.lift_array16 dmontx16)).
auto => />.
move => &hr i_lb i_ub dmontx16_def qx16_def qinvx16_def rp_sredc rp_eq_ap i_tub result result_def.
split.
move : i_lb i_tub => /#.

rewrite fillE.
split.

move => k k_lb k_ub.
have k_mb: 0 <= k %% 16 < 16.
  by smt(@IntDiv).
rewrite initiE.
move : k_lb k_ub i_tub => /#.
simplify.

case (k < 16 * i{hr}).
move => k_tub.
rewrite ltzNge in k_tub.
rewrite k_tub /=.
rewrite -ltzNge in k_tub.
apply (rp_sredc k).
rewrite k_lb k_tub //.

move => k_tlb.
rewrite -lezNgt in k_tlb.
rewrite mulzDr mulz1 in k_ub.
rewrite k_tlb k_ub => /=.
rewrite result_def //.
rewrite /lift_array16 //=.
rewrite mapiE //=.
rewrite lift2poly_iso //.
rewrite mapiE //=.
rewrite dmontx16_def //.
rewrite rp_eq_ap //. rewrite k_tlb; move : k_ub i_tub => /#.
rewrite /R qE /=.
congr. rewrite of_sintK => />.
rewrite expr0 /=.
by rewrite /smod /=.

move => k k_lb k_ub.
rewrite initiE //. move : k_lb i_lb k_ub => /#.
simplify.
rewrite mulzDr mulz1 lezNgt in k_lb.
rewrite k_lb /=.
rewrite -lezNgt in k_lb.
apply rp_eq_ap.
move : k_lb k_ub => /#.
qed.


lemma poly_decompress_restore_corr (ap: zmod Array256.t) :
  hoare[Mavx2_prevec.poly_decompress_restore :
        (forall k, 0 <= k < 256 => ap.[k] = if (k %% 2 = 0) then inzmod(to_sint(r.[k])) else inzmod(to_sint(r.[k]) %/ 2^4)) /\
        (forall k, 0 <= k < 256 => (if k %% 2 = 0 then bpos16 r{hr}.[k] (2 ^ 4) else (forall m, 0 <= m < (2^4) => to_sint r{hr}.[k] = (2^4) * m)))
        ==>
        Array256.map Poly.unroundc ap = lift_array256 res /\
        signed_bound_cxq res 0 256 1].
proof.
  proc.
  cfold 4.
  wp.
  while(#pre /\ 0 <= i <= 16 /\
        (forall k, 0 <= k < 16 => q.[k] = W16.of_int 3329) /\
        (forall k, 0 <= k < 16 => shift.[k] = if (k %% 2 = 0) then (W16.of_int (2^11)) else (W16.of_int (2^7))) /\
        (forall k, 0 <= k < 16*i => rp.[k] = round_scalew (to_sint (r.[k] * shift.[k %% 16]) * to_sint q.[k %% 16]))).
  inline *.
  wp. skip.
  simplify.
  move => &hr [#] ap_def pos_bound_r i_lb i_ub q_def shift_def rp_def i_tub.
  do split; first 6 by smt().
  rewrite mulzDr /=.
  move => k k_i.
  rewrite filliE //=; first by smt().
  case (16 * i{hr} <= k && k < 16 * i{hr} + 16); last first.
  move => k_b.
  rewrite rp_def.
  move : k_i k_b => /#.
  trivial.
  move => k_b.
  have H: forall k, 0 <= k < 16 => (lift2poly (get256 ((init16 ("_.[_]" r{hr})))%WArray512 i{hr})).[k] = r{hr}.[16 * i{hr} + k].
    by move => k0 k0_i; rewrite -(lift2poly_iso r{hr} i{hr}) /#.
  do rewrite H //.
  rewrite (_: r1{hr}.[0 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 0] * shift{hr}.[0]) * to_sint q{hr}.[0])].[1 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 1] * shift{hr}.[1]) * to_sint q{hr}.[1])].[2 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 2] * shift{hr}.[2]) * to_sint q{hr}.[2])].[3 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 3] * shift{hr}.[3]) * to_sint q{hr}.[3])].[4 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 4] * shift{hr}.[4]) * to_sint q{hr}.[4])].[5 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 5] * shift{hr}.[5]) * to_sint q{hr}.[5])].[6 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 6] * shift{hr}.[6]) * to_sint q{hr}.[6])].[7 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 7] * shift{hr}.[7]) * to_sint q{hr}.[7])].[8 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 8] * shift{hr}.[8]) * to_sint q{hr}.[8])].[9 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 9] * shift{hr}.[9]) * to_sint q{hr}.[9])].[10 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 10] * shift{hr}.[10]) * to_sint q{hr}.[10])].[11 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 11] * shift{hr}.[11]) * to_sint q{hr}.[11])].[12 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 12] * shift{hr}.[12]) * to_sint q{hr}.[12])].[13 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 13] * shift{hr}.[13]) * to_sint q{hr}.[13])].[14 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 14] * shift{hr}.[14]) * to_sint q{hr}.[14])].[15 <-
  round_scalew
    (to_sint (r{hr}.[16 * i{hr} + 15] * shift{hr}.[15]) * to_sint q{hr}.[15])] =
     Array16.init (fun k => round_scalew (to_sint (r{hr}.[16 * i{hr} + k] * shift{hr}.[k]) * to_sint q{hr}.[k]))).
    apply Array16.ext_eq. move => x x_i. rewrite initiE //=.
    do rewrite get_setE //.
    smt(@Array16).
  rewrite initiE 1:/# //=.
  rewrite (_: 16 * i{hr} + k %% 16 = k). by move : k_i k_b => /#.
  trivial.

  sp.
  inline *.
  wp.
  skip.
  move => &hr [#] q_def ap_def pos_bound_r pd_shift_s shift_def.
  simplify.
  split.
  do split.
  apply ap_def.
  rewrite /bpos16 in pos_bound_r.
  apply pos_bound_r.
  rewrite q_def.
  rewrite /lift2poly //=.
  move => k k_i.
  rewrite initiE //=.
  rewrite /init16.
  rewrite get256E //= k_i //=.
  do rewrite W32u8.Pack.initiE //= 1:/#.
  do rewrite WArray32.initiE //= 1:/#.
  rewrite (_: (2 * k + 1) %/ 2 = (2 * k) %/ 2). by smt(@IntDiv).
  rewrite {2 4}mulzC.
  rewrite modzMDl modzMl //=.
  rewrite pack2_bits8.
  rewrite /(jqx16).
  rewrite initiE //= 1:/#.
  smt(@List @Array16).
  rewrite /shift_def.
  move => k k_i.
  rewrite (_: r0{hr}.[0 <- pd_shift_s].[1 <- pd_shift_s].[2 <- pd_shift_s].[3 <-
                      pd_shift_s].[4 <- pd_shift_s].[5 <- pd_shift_s].[6 <-
                      pd_shift_s].[7 <- pd_shift_s] =
              Array8.init (fun i => pd_shift_s)).
    apply Array8.ext_eq. move => x x_i. rewrite initiE //=.
    do rewrite get_setE //.
    smt(@Array8).
  rewrite /f8u32_t16u16.
  rewrite initiE //=.
  rewrite initiE //= 1:/#.
  rewrite /pd_shift_s /(KyberCPA_avx2.pd_shift_s).
  simplify.
  rewrite bits16E.
  rewrite /int2bs /bits2w.
  rewrite W16.wordP.
  move => i i_i.
  rewrite initiE //= initiE //= 1:/#.
  case (k %% 2 = 0) => k_even.
  rewrite of_intwE i_i //=.
  rewrite /int_bit //=.
  rewrite nth_mkseq 1:/# //=.
  congr. congr.
  rewrite k_even //=.
  move : i_i.
  rewrite andabP => /(mem_iota 0 16 i).
  smt(@List).
  rewrite of_intwE i_i //=.
  rewrite /int_bit //=.
  rewrite nth_mkseq 1:/# //=.
  congr. congr.
  have ->: (k %% 2) = 1. smt(@IntDiv @Int).
  move : i_i.
  rewrite andabP => /(mem_iota 0 16 i).
  smt(@List).
  smt().

  move => i rp i_tlb [#] ap_defd pos_bound_rd i_lb i_ub q_defd shift_defd rp_def.
  have i_eq: i = 16.
    move : i_lb i_ub i_tlb => /#.
  split.
  apply Array256.ext_eq.
  move => x x_i.
  rewrite /lift_array256 //=.
  do rewrite mapiE //=.
  rewrite ap_def 1://=.
  rewrite rp_def 1:/#.
  rewrite /unroundc qE.
  rewrite fun_if.
  do rewrite inzmodK.
  do rewrite (pmod_small _ q).
    move : (pos_bound_r x x_i) => /#.
    move : (pos_bound_r x x_i) => /#.
  rewrite /round_scalew => />.
  rewrite /truncateu16.
  rewrite shift_defd 1:/#.
  rewrite modz_dvd //.
  rewrite q_defd 1:/#.
  rewrite to_sintM_small.
    move : (pos_bound_r x x_i).
    case (x %% 2 = 0) => x_even.
    rewrite /bpos16.
    rewrite of_sintK /smod //=.
    smt().
    move => x_odd.
    rewrite of_sintK /smod //=.
    smt().
  rewrite (fun_if W16.to_sint).
  rewrite (W16.of_sintK 2048) (W16.of_sintK 128) (W16.of_sintK 3329) /smod //=.
  do rewrite shr_shrw 1://=.
  rewrite shrDP 1://=.
  rewrite addrC -of_intD.
  rewrite -divzMDl 1://=.
  rewrite (_: (1 * 2 ^ 14 + to_sint r{hr}.[x] * (if x %% 2 = 0 then 2048 else 128) * 3329 %% W32.modulus) =
              (1 * 2 ^ 14 + to_sint r{hr}.[x] * (if x %% 2 = 0 then 2048 else 128) * 3329) %% W32.modulus).
    smt().
  rewrite -shrDP 1://= shrw_add //= shrDP 1://=.
  move : (pos_bound_r x x_i).
  rewrite /bpos16.
  case(x %% 2 = 0).
  move => x_even r_bounds_even.
  rewrite (_: 16384 = 2^11 * 2^3). by trivial.
  rewrite (_: 2048 = 2^11). by trivial.
  rewrite (mulzC _ (2^11)) mulzA -(mulzDr (2^11) _ _) (mulzC (2^11)).
  rewrite (_: (2 ^ 3 + to_sint r{hr}.[x] * 3329) =
              (2 ^ 3 + to_sint r{hr}.[x] * 3329) %% W32.modulus).
    smt().
  rewrite -shrDP 1:// -shlMP 1://= W32.shlw_shrw_shrw 1://= //=.
  rewrite (_: (W32.masklsb 21) = (W32.of_int (2 ^ 21 - 1))); first by rewrite /max /=.
  rewrite W32.and_mod. by rewrite /max /=.
  rewrite pmod_small.
    rewrite pmod_small.
    move : r_bounds_even => /#.
    rewrite of_uintK.
    move : r_bounds_even => /#.
  rewrite of_uintK.
  rewrite pmod_small.
    move : r_bounds_even => /#.
  rewrite shrDP 1://=.
  rewrite of_uintK.
  rewrite (_: ((8 + to_sint r{hr}.[x] * 3329) %% 4294967296 %% W32.modulus %/ 2 ^ 4 %% W32.modulus) =
              (8 + to_sint r{hr}.[x] * 3329) %/ 2 ^ 4).
    move : r_bounds_even => /#.
  rewrite of_sintK.
  rewrite pmod_small.
    move : r_bounds_even => /#.
  rewrite /smod //=.
  have ->: ! 32768 <= (8 + to_sint r{hr}.[x] * 3329) %/ 16.
    smt().
  smt().

  move => x_odd r_bounds_odd.
  rewrite (_: 16384 = 2^7 * 2^7). by trivial.
  rewrite (_: to_sint r{hr}.[x] * 128 * 3329 = 2^7 * (to_sint r{hr}.[x] * 3329)). by smt(@Int).
  rewrite -(mulzDr (2^7) _ _) (mulzC (2^7)).
  rewrite (_: (2 ^ 7 + to_sint r{hr}.[x] * 3329) =
              (2 ^ 7 + to_sint r{hr}.[x] * 3329) %% W32.modulus).
    smt().
  rewrite -shrDP 1:// -shlMP 1://= W32.shlw_shrw_shrw 1://= //=.
  rewrite (_: (W32.masklsb 25) = (W32.of_int (2 ^ 25 - 1))); first by rewrite /max /=.
  rewrite W32.and_mod. by rewrite /max /=.
  rewrite pmod_small.
    rewrite pmod_small.
    move : r_bounds_odd => /#.
    rewrite of_uintK.
    move : r_bounds_odd => /#.
  rewrite of_uintK.
  rewrite pmod_small.
    move : r_bounds_odd => /#.
  rewrite shrDP 1://=.
  rewrite of_uintK.
  rewrite (_: ((128 + to_sint r{hr}.[x] * 3329) %% 4294967296 %% W32.modulus %/ 2 ^ 8 %% W32.modulus) =
              (128 + to_sint r{hr}.[x] * 3329) %/ (2^4) %/ (2^4)).
    move : r_bounds_odd => /#.
  rewrite of_sintK.
  rewrite pmod_small.
    move : r_bounds_odd => /#.
  rewrite /smod //=.
  have ->: ! 32768 <= (128 + to_sint r{hr}.[x] * 3329) %/ 16 %/ 16.
    smt().
  simplify.
  rewrite (addzC 128 _).
  rewrite (divzDr _ 128 _) 1://=.
  rewrite (_: to_sint r{hr}.[x] * 3329 %/ 16 = to_sint r{hr}.[x] %/ 16 * 3329).
    move : r_bounds_odd.
    smt().
  trivial.

  rewrite /signed_bound_cxq.
  rewrite /b16 //=.
  move => k k_i.
  rewrite rp_def 1:/#.
  rewrite /round_scalew (shift_defd (k%%16)) 1:/#  (q_defd (k%%16)) 1:/# //=.
  rewrite /truncateu16.
  move : (pos_bound_rd k k_i). 
  rewrite modz_dvd //.

  case(k %% 2 = 0).
  move => k_even r_bounds_even.
  rewrite shr_shrw 1://=.
  rewrite to_sintM_small.
    rewrite of_sintK /smod //= => /#.
  rewrite (W16.of_sintK 2048) /smod //=.
  rewrite (_: to_sint r{hr}.[k] * 2048 * to_sint ((W16.of_int 3329)) =
              (to_sint r{hr}.[k] * 3329) * 2048).
    rewrite W16.of_sintK /smod //=.
    rewrite mulzA mulzA (mulzC 2048 3329).
    trivial.
  rewrite (_: 2048 = 2^11). by trivial.
  rewrite -shlMP 1://=.
  do rewrite shr_shrw 1://=.
  rewrite W32.shlw_shrw_shrw 1://= //=.
  rewrite (_: (W32.masklsb 21) = (W32.of_int (2 ^ 21 - 1))); first by rewrite /max /=.
  rewrite W32.and_mod. by rewrite /max /=.
  rewrite of_uintK.
  rewrite pmod_small.
    move : r_bounds_even => /#.
  rewrite shrDP 1://=.
  rewrite -of_intD.
  rewrite addrC.
  rewrite -divzMDl 1://=.
  rewrite (_: (1 * 2 ^ 3 + to_sint r{hr}.[k] * 3329 %% W32.modulus %% W32.modulus) =
              (8 +  to_sint r{hr}.[k] * 3329) %% W32.modulus).
    move : r_bounds_even => /#.
  rewrite -shrDP 1://= shrw_add //= shrDP 1://=.
  rewrite of_uintK.
  do (rewrite pmod_small; first by move : r_bounds_even => /#).
  rewrite of_sintK.
  rewrite pmod_small.
    move : r_bounds_even => /#.
  rewrite /smod //=.
  have ->: ! 32768 <= (8 + to_sint r{hr}.[k] * 3329) %/ 16.
    smt().
  smt().

  move => k_odd r_bounds_odd.
  rewrite shr_shrw 1://=.
  rewrite to_sintM_small.
    rewrite of_sintK /smod //= => /#.
  rewrite (W16.of_sintK 128) /smod //=.
  rewrite (_: to_sint r{hr}.[k] * 128 * to_sint ((W16.of_int 3329)) =
              (to_sint r{hr}.[k] * 3329) * 128).
    rewrite W16.of_sintK /smod //=.
    rewrite mulzA mulzA (mulzC 128 3329).
    trivial.
  rewrite (_: 128 = 2^7). by trivial.
  rewrite -shlMP 1://=.
  do rewrite shr_shrw 1://=.
  rewrite W32.shlw_shrw_shrw 1://= //=.
  rewrite (_: (W32.masklsb 25) = (W32.of_int (2 ^ 25 - 1))); first by rewrite /max /=.
  rewrite W32.and_mod. by rewrite /max /=.
  rewrite of_uintK.
  rewrite pmod_small.
    move : r_bounds_odd => /#.
  rewrite shrDP 1://=.
  rewrite -of_intD.
  rewrite addrC.
  rewrite -divzMDl 1://=.
  rewrite (_: (1 * 2 ^ 7 + to_sint r{hr}.[k] * 3329 %% W32.modulus %% W32.modulus) =
              (128 +  to_sint r{hr}.[k] * 3329) %% W32.modulus).
    move : r_bounds_odd => /#.
  rewrite -shrDP 1://= shrw_add //= shrDP 1://=.
  rewrite of_uintK.
  do (rewrite pmod_small; first by move : r_bounds_odd => /#).
  rewrite of_sintK.
  rewrite pmod_small.
    move : r_bounds_odd => /#.
  rewrite /smod //=.
  have ->: ! 32768 <= (128 + to_sint r{hr}.[k] * 3329) %/ 256.
    smt().
  smt().
qed.


lemma poly_compress_round_corr_h ap :
  hoare[Mavx2_prevec.poly_compress_round:
        ap = lift_array256 a /\
        pos_bound256_cxq a 0 256 2 ==>
        Array256.map Poly.roundc ap = lift_array256 res /\
        forall k,
          0 <= k < 256 => 0 <= to_sint res.[k] < 16].
proof.
  proc.
  seq 1 : (ap = lift_array256 a /\
           pos_bound256_cxq a 0 256 1).
  call (poly_csubq_corr_h ap) => />; first by auto => />.
  cfold 4.
  wp.
  seq 3 : (#pre /\
           (forall k, 0 <= k < 16 => v.[k] = W16.of_int 20159) /\
           (forall k, 0 <= k < 16 => shift1.[k] = W16.of_int 512) /\
           (forall k, 0 <= k < 16 => mask.[k] = W16.of_int 15)).
  inline *.
  wp. skip.
  move => &hr [#] ap_def pos_bound_a shift1_def mask_def.
  split.
  rewrite ap_def pos_bound_a //=.
  split.
  move => k k_i.
  rewrite /lift2poly //=.
  rewrite initiE //.
  rewrite /get256_direct //=.
  rewrite k_i.
  rewrite W32u8.Pack.initiE //=. move : k_i => /#.
  rewrite W32u8.Pack.initiE //=. move : k_i => /#.
  rewrite WArray32.initiE //=. move : k_i => /#.
  rewrite WArray32.initiE //=. move : k_i => /#.
  rewrite (_: (2 * k + 1) %/ 2 = (2 * k) %/ 2). by smt(@IntDiv).
  rewrite (_: 2 * k %% 2 = 0). by smt(@IntDiv).
  rewrite (_: (2 * k + 1) %% 2 = 1). by smt(@IntDiv).
  rewrite pack2_bits8 /(KyberCPA_avx2.jvx16) => />.
  rewrite initiE => />. move : k_i => /#.
  smt(@Array16).
  rewrite /shift1_def /mask_def.
  rewrite /(pc_shift1_s) /(pc_mask_s).
  split.
  move => k k_i.
  do rewrite get_setE //=.
  smt(@Array16 @W16 @List).
  move => k k_i.
  do rewrite get_setE //=.
  smt(@Array16 @W16 @List).

  while(#pre /\
        (forall k,
           0 <= k < 64*i =>
           inzmod (W16.to_sint rp.[k]) = roundc ap.[k]) /\
       (forall k,
            0<= k < 64*i  => 0<= to_sint rp.[k] < 16) /\
       0 <= i <= 4); last first.
  wp. skip.
  move => &hr [#] ap_def pos_bound_a v_def shift1_def mask_def.
  simplify.
  rewrite ap_def pos_bound_a //=.
  split.
  smt().
  move => i rp i_tlb [#] v_defd shift1_defd mask_defd rp_def rp_bounds i_lb i_ub.
  have i_val: i = 4. by move : i_tlb i_lb i_ub => /#.
  move : rp_def rp_bounds. rewrite i_val //=.
  move => rp_def rp_bounds.
  split.
  apply Array256.ext_eq => k k_i.
  rewrite {2}/lift_array256 //=.
  rewrite mapiE //=.
  rewrite (Array256.mapiE _ rp _) //=.
  rewrite (rp_def k k_i) //=.
  apply rp_bounds.

  inline *.
  wp. skip.
  simplify.
  move => &hr [#] ap_def pos_bound_a v_def shift1_def mask_def rp_def rp_bounds i_lb i_ub i_tub.
  rewrite ap_def pos_bound_a //=.
  split.
  do split.
  apply v_def.
  apply shift1_def.
  apply mask_def.
  have H: forall off, 0 <= off < 4 => (forall k, 0 <= k < 16 => (lift2poly (get256 ((init16 (fun j => a{hr}.[j])))%WArray512 (4 * i{hr} + off))).[k] = a{hr}.[64 * i{hr} + 16 * off + k]).
    move => off off_i k k_i; rewrite -(lift2poly_iso a{hr} (4*i{hr}+off)); move : i_lb i_tub => /#; rewrite -mulzA /=; smt(@Int); do smt(@Int @IntDiv).
  rewrite -(addz0 (4 * i{hr})).
  do (rewrite H 1://= 1://=).
  rewrite (_: r10{hr}.[0 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 0] v{hr}.[0]) *
                to_sint shift1{hr}.[0]) `&`
             mask{hr}.[0]].[1 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 1] v{hr}.[1]) *
                to_sint shift1{hr}.[1]) `&`
             mask{hr}.[1]].[2 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 2] v{hr}.[2]) *
                to_sint shift1{hr}.[2]) `&`
             mask{hr}.[2]].[3 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 3] v{hr}.[3]) *
                to_sint shift1{hr}.[3]) `&`
             mask{hr}.[3]].[4 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 4] v{hr}.[4]) *
                to_sint shift1{hr}.[4]) `&`
             mask{hr}.[4]].[5 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 5] v{hr}.[5]) *
                to_sint shift1{hr}.[5]) `&`
             mask{hr}.[5]].[6 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 6] v{hr}.[6]) *
                to_sint shift1{hr}.[6]) `&`
             mask{hr}.[6]].[7 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 7] v{hr}.[7]) *
                to_sint shift1{hr}.[7]) `&`
             mask{hr}.[7]].[8 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 8] v{hr}.[8]) *
                to_sint shift1{hr}.[8]) `&`
             mask{hr}.[8]].[9 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 9] v{hr}.[9]) *
                to_sint shift1{hr}.[9]) `&`
             mask{hr}.[9]].[10 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 10] v{hr}.[10]) *
                to_sint shift1{hr}.[10]) `&`
             mask{hr}.[10]].[11 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 11] v{hr}.[11]) *
                to_sint shift1{hr}.[11]) `&`
             mask{hr}.[11]].[12 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 12] v{hr}.[12]) *
                to_sint shift1{hr}.[12]) `&`
             mask{hr}.[12]].[13 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 13] v{hr}.[13]) *
                to_sint shift1{hr}.[13]) `&`
             mask{hr}.[13]].[14 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 14] v{hr}.[14]) *
                to_sint shift1{hr}.[14]) `&`
             mask{hr}.[14]].[15 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + 15] v{hr}.[15]) *
                to_sint shift1{hr}.[15]) `&`
             mask{hr}.[15]] = Array16.init (fun k => round_scalew (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + k] v{hr}.[k]) *
                                                                   to_sint shift1{hr}.[k]) `&` mask{hr}.[k])).
    apply Array16.ext_eq. move => x x_i. rewrite initiE //=.
    do rewrite get_setE //.
    smt(@Array16).
  rewrite (_: r9{hr}.[0 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 0] v{hr}.[0]) *
                to_sint shift1{hr}.[0]) `&`
             mask{hr}.[0]].[1 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 1] v{hr}.[1]) *
                to_sint shift1{hr}.[1]) `&`
             mask{hr}.[1]].[2 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 2] v{hr}.[2]) *
                to_sint shift1{hr}.[2]) `&`
             mask{hr}.[2]].[3 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 3] v{hr}.[3]) *
                to_sint shift1{hr}.[3]) `&`
             mask{hr}.[3]].[4 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 4] v{hr}.[4]) *
                to_sint shift1{hr}.[4]) `&`
             mask{hr}.[4]].[5 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 5] v{hr}.[5]) *
                to_sint shift1{hr}.[5]) `&`
             mask{hr}.[5]].[6 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 6] v{hr}.[6]) *
                to_sint shift1{hr}.[6]) `&`
             mask{hr}.[6]].[7 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 7] v{hr}.[7]) *
                to_sint shift1{hr}.[7]) `&`
             mask{hr}.[7]].[8 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 8] v{hr}.[8]) *
                to_sint shift1{hr}.[8]) `&`
             mask{hr}.[8]].[9 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 9] v{hr}.[9]) *
                to_sint shift1{hr}.[9]) `&`
             mask{hr}.[9]].[10 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 10] v{hr}.[10]) *
                to_sint shift1{hr}.[10]) `&`
             mask{hr}.[10]].[11 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 11] v{hr}.[11]) *
                to_sint shift1{hr}.[11]) `&`
             mask{hr}.[11]].[12 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 12] v{hr}.[12]) *
                to_sint shift1{hr}.[12]) `&`
             mask{hr}.[12]].[13 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 13] v{hr}.[13]) *
                to_sint shift1{hr}.[13]) `&`
             mask{hr}.[13]].[14 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 14] v{hr}.[14]) *
                to_sint shift1{hr}.[14]) `&`
             mask{hr}.[14]].[15 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + 15] v{hr}.[15]) *
                to_sint shift1{hr}.[15]) `&`
             mask{hr}.[15]] = Array16.init (fun k => round_scalew (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + k] v{hr}.[k]) *
                                                                   to_sint shift1{hr}.[k]) `&` mask{hr}.[k])).
    apply Array16.ext_eq. move => x x_i. rewrite initiE //=.
    do rewrite get_setE //.
    smt(@Array16).
  rewrite (_: r8{hr}.[0 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 0] v{hr}.[0]) *
                to_sint shift1{hr}.[0]) `&`
             mask{hr}.[0]].[1 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 1] v{hr}.[1]) *
                to_sint shift1{hr}.[1]) `&`
             mask{hr}.[1]].[2 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 2] v{hr}.[2]) *
                to_sint shift1{hr}.[2]) `&`
             mask{hr}.[2]].[3 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 3] v{hr}.[3]) *
                to_sint shift1{hr}.[3]) `&`
             mask{hr}.[3]].[4 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 4] v{hr}.[4]) *
                to_sint shift1{hr}.[4]) `&`
             mask{hr}.[4]].[5 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 5] v{hr}.[5]) *
                to_sint shift1{hr}.[5]) `&`
             mask{hr}.[5]].[6 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 6] v{hr}.[6]) *
                to_sint shift1{hr}.[6]) `&`
             mask{hr}.[6]].[7 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 7] v{hr}.[7]) *
                to_sint shift1{hr}.[7]) `&`
             mask{hr}.[7]].[8 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 8] v{hr}.[8]) *
                to_sint shift1{hr}.[8]) `&`
             mask{hr}.[8]].[9 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 9] v{hr}.[9]) *
                to_sint shift1{hr}.[9]) `&`
             mask{hr}.[9]].[10 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 10] v{hr}.[10]) *
                to_sint shift1{hr}.[10]) `&`
             mask{hr}.[10]].[11 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 11] v{hr}.[11]) *
                to_sint shift1{hr}.[11]) `&`
             mask{hr}.[11]].[12 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 12] v{hr}.[12]) *
                to_sint shift1{hr}.[12]) `&`
             mask{hr}.[12]].[13 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 13] v{hr}.[13]) *
                to_sint shift1{hr}.[13]) `&`
             mask{hr}.[13]].[14 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 14] v{hr}.[14]) *
                to_sint shift1{hr}.[14]) `&`
             mask{hr}.[14]].[15 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + 15] v{hr}.[15]) *
                to_sint shift1{hr}.[15]) `&`
             mask{hr}.[15]] = Array16.init (fun k => round_scalew (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + k] v{hr}.[k]) *
                                                                   to_sint shift1{hr}.[k]) `&` mask{hr}.[k])).
    apply Array16.ext_eq. move => x x_i. rewrite initiE //=.
    do rewrite get_setE //.
    smt(@Array16).
  rewrite (_: r7{hr}.[0 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 0] v{hr}.[0]) *
                to_sint shift1{hr}.[0]) `&`
             mask{hr}.[0]].[1 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 1] v{hr}.[1]) *
                to_sint shift1{hr}.[1]) `&`
             mask{hr}.[1]].[2 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 2] v{hr}.[2]) *
                to_sint shift1{hr}.[2]) `&`
             mask{hr}.[2]].[3 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 3] v{hr}.[3]) *
                to_sint shift1{hr}.[3]) `&`
             mask{hr}.[3]].[4 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 4] v{hr}.[4]) *
                to_sint shift1{hr}.[4]) `&`
             mask{hr}.[4]].[5 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 5] v{hr}.[5]) *
                to_sint shift1{hr}.[5]) `&`
             mask{hr}.[5]].[6 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 6] v{hr}.[6]) *
                to_sint shift1{hr}.[6]) `&`
             mask{hr}.[6]].[7 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 7] v{hr}.[7]) *
                to_sint shift1{hr}.[7]) `&`
             mask{hr}.[7]].[8 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 8] v{hr}.[8]) *
                to_sint shift1{hr}.[8]) `&`
             mask{hr}.[8]].[9 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 9] v{hr}.[9]) *
                to_sint shift1{hr}.[9]) `&`
             mask{hr}.[9]].[10 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 10] v{hr}.[10]) *
                to_sint shift1{hr}.[10]) `&`
             mask{hr}.[10]].[11 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 11] v{hr}.[11]) *
                to_sint shift1{hr}.[11]) `&`
             mask{hr}.[11]].[12 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 12] v{hr}.[12]) *
                to_sint shift1{hr}.[12]) `&`
             mask{hr}.[12]].[13 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 13] v{hr}.[13]) *
                to_sint shift1{hr}.[13]) `&`
             mask{hr}.[13]].[14 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 14] v{hr}.[14]) *
                to_sint shift1{hr}.[14]) `&`
             mask{hr}.[14]].[15 <-
             round_scalew
               (to_sint (wmulhs a{hr}.[64 * i{hr} + 16 * 0 + 15] v{hr}.[15]) *
                to_sint shift1{hr}.[15]) `&`
             mask{hr}.[15]] = Array16.init (fun k => round_scalew (to_sint (wmulhs a{hr}.[64 * i{hr} + k] v{hr}.[k]) *
                                                                   to_sint shift1{hr}.[k]) `&` mask{hr}.[k])).
    apply Array16.ext_eq. move => x x_i. rewrite initiE //=.
    do rewrite get_setE //.
    smt(@Array16).

  rewrite (_: fill
           (fun (k0 : int) =>
              ((init
                  (fun (k1 : int) =>
                     round_scalew
                       (to_sint
                          (wmulhs a{hr}.[64 * i{hr} + 16 * 3 + k1] v{hr}.[k1]) *
                        to_sint shift1{hr}.[k1]) `&`
                     mask{hr}.[k1])))%Array16.[k0 %% 16]) (64 * i{hr} + 48)
           16
           (fill
              (fun (k0 : int) =>
                 ((init
                     (fun (k1 : int) =>
                        round_scalew
                          (to_sint
                             (wmulhs a{hr}.[64 * i{hr} + 16 * 2 + k1]
                                v{hr}.[k1]) *
                           to_sint shift1{hr}.[k1]) `&`
                        mask{hr}.[k1])))%Array16.[k0 %% 16])
              (64 * i{hr} + 32) 16
              (fill
                 (fun (k0 : int) =>
                    ((init
                        (fun (k1 : int) =>
                           round_scalew
                             (to_sint
                                (wmulhs a{hr}.[64 * i{hr} + 16 * 1 + k1]
                                   v{hr}.[k1]) *
                              to_sint shift1{hr}.[k1]) `&`
                           mask{hr}.[k1])))%Array16.[k0 %% 16])
                 (64 * i{hr} + 16) 16
                 (fill
                    (fun (k0 : int) =>
                       ((init
                           (fun (k1 : int) =>
                              round_scalew
                                (to_sint
                                   (wmulhs a{hr}.[64 * i{hr} + k1] v{hr}.[k1]) *
                                 to_sint shift1{hr}.[k1]) `&`
                              mask{hr}.[k1])))%Array16.[k0 %% 16])
                    (64 * i{hr}) 16 rp{hr}))) =
           fill (fun k =>   round_scalew (to_sint (wmulhs a{hr}.[k] v{hr}.[k %% 16]) *
                                          to_sint shift1{hr}.[k %% 16]) `&` mask{hr}.[k %% 16]) (64 * i{hr}) 64 rp{hr}).
    apply Array256.ext_eq. move => x x_i. do rewrite filliE //=.
    case (!64 * i{hr} <= x) => x_ub.
      rewrite x_ub //=.
      rewrite (_: ! 64 * i{hr} + 16 <= x) //=. move : x_ub => /#.
      rewrite (_: ! 64 * i{hr} + 32 <= x) //=. move : x_ub => /#.
      rewrite (_: ! 64 * i{hr} + 48 <= x) //=. move : x_ub => /#.
    case (!x < 64 * i{hr} + 64) => x_lb.
      rewrite x_lb //=.
      rewrite (_: ! x < 64 * i{hr} + 48) //=. move : x_lb => /#.
      rewrite (_: ! x < 64 * i{hr} + 32) //=. move : x_lb => /#.
      rewrite (_: ! x < 64 * i{hr} + 16) //=. move : x_lb => /#.
    apply negbNE in x_ub.
    apply negbNE in x_lb.
    rewrite (_: (64 * i{hr} <= x && x < 64 * i{hr} + 64) = true) //=. by rewrite x_lb x_ub //=.
    do (rewrite initiE 1:/# //=).
    smt(@Array256 @IntDiv @Int).

  rewrite mulzDr mulz1.
  split.

  move => k k_i.
  rewrite /lift_array256 /=.
  rewrite mapiE //=. move : i_lb i_tub => /#.
   rewrite /roundc inzmodK //=.
  rewrite filliE 1:/# //=.
  rewrite (v_def (k %% 16)) 1:/# (mask_def (k %% 16)) 1:/# (shift1_def (k %% 16)) 1:/# qE.
  rewrite /wmulhs /round_scalew //=.
  do rewrite shr_shrw 1://=.
  rewrite (W16.of_sintK 20159) /smod //= /truncateu16.
  rewrite (pmod_small (to_sint a{hr}.[k]) 3329).
    move : pos_bound_a => /#.
  rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
  rewrite W16.and_mod 1://=.
  rewrite (_: to_sint pc_shift1_s = 2 ^ 9). by rewrite of_sintK /smod //=.
  do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
  rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
  rewrite W32.and_mod 1:/# of_uintK.
  have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{hr}.[k] * 20159 %/ 65536))) <= 1024.
    rewrite to_sint_unsigned.
      rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
      move : (pos_bound_a k).
      rewrite {3}/W16.to_sint of_uintK /smod /=.
    have ->: ! 32768 <= to_sint a{hr}.[k] * 20159 %/ 65536 %% 65536.
      by move : pos_bound_a => /#.
    rewrite qE //=.
    smt(@Int @IntDiv @W16).
    rewrite of_uintK.
    rewrite pmod_small. by move : pos_bound_a => /#.
    by move : (pos_bound_a k) => /#.
  do rewrite of_sintK.
  rewrite (_: (W16.smod (to_sint a{hr}.[k] * 20159 %/ 65536 %% W16.modulus)) = to_sint a{hr}.[k] * 20159 %/ 65536 %% W16.modulus).
    rewrite /smod /=.
    move : a_mul_ub => /#.
  rewrite (modz_dvd _ W32.modulus (2^23)) 1:/# (pmod_small _ (2^23)) 1:/# (pmod_small _ W16.modulus) 1:/#.
  rewrite shrDP 1://= -of_intD (pmod_small _ W32.modulus) 1:/#.
  rewrite(_: to_sint a{hr}.[k] * 20159 %/ 65536 %/ 2 ^ 5 = to_sint a{hr}.[k] * 20159 %/ (2^21)) 1:/#.
  rewrite (addzC _ 1) -(divzMDl 1 _ (2^21)) 1://= mul1z.
  rewrite shrDP 1://= (pmod_small _ W32.modulus) 1:/#.
  rewrite (_: (2 ^ 21 + to_sint a{hr}.[k] * 20159) %/ 2 ^ 21 %/ 2 ^ 1 = (2 ^ 21 + to_sint a{hr}.[k] * 20159) %/ 2 ^ 22) 1:/#.
  do (rewrite of_uintK || rewrite (modz_dvd _ _ 16) 1:/#).
  rewrite fun_if fun_if of_sintK.
  rewrite (_: (W16.smod ((2^21 + to_sint a{hr}.[k] * 20159) %/ 2^22 %% 16 %% W16.modulus)) = ((2^21 + to_sint a{hr}.[k] * 20159) %/ 2^22 %% 16)).
    rewrite (pmod_small _ W16.modulus) 1:/#.
    rewrite /smod /=.
    smt(@IntDiv @Int).

  case (64 * i{hr} <= k && k < 64 * i{hr} + 64) => k_si.
    rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a k).
      rewrite (_: 0 <= k && k < 256) //=. by move : i_lb i_tub k_i => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{hr}.[k])).
    smt().

  rewrite rp_def 1:/# /roundc qE //=.
  rewrite ap_def /lift_array256 mapiE 1:/# inzmodK //= qE.
  rewrite (pmod_small _ 3329). move : pos_bound_a => /#.
  trivial.

  split.
  move => k k_i.
  rewrite filliE 1:/# //=.
  rewrite (v_def (k %% 16)) 1:/# (mask_def (k %% 16)) 1:/# (shift1_def (k %% 16)) 1:/#.
  rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
  rewrite W16.and_mod 1://=.
  rewrite (fun_if W16.to_sint) of_sintK.
  rewrite (pmod_small _ W16.modulus) 1:/#.
  rewrite (_: W16.smod (to_uint (round_scalew (to_sint (wmulhs a{hr}.[k] ((of_int 20159))%W16) *
              to_sint pc_shift1_s)) %% 2 ^ 4) =
              to_uint (round_scalew (to_sint (wmulhs a{hr}.[k] ((of_int 20159))%W16) *
              to_sint pc_shift1_s)) %% 2 ^ 4).
    rewrite /smod /=. smt(@IntDiv).
  case (64 * i{hr} <= k && k < 64 * i{hr} + 64) => k_si.
  rewrite modz_ge0 1://= ltz_pmod 1://= //=.
  apply (rp_bounds k). move : k_si k_i => /#.

  move : i_lb i_tub => /#.
qed.


lemma poly_compress_ll : islossless Mavx2_prevec.poly_compress_round.
proof.
  proc.
  cfold 5. wp; while(0 <= i <= 4) (4-i).
    move => *; inline *; auto => />. smt().
  inline Ops.iVPBROADCAST_16u16; wp; call poly_csubq_ll; auto => /> /#.
qed.


lemma poly_compress_round_corr ap :
  phoare[Mavx2_prevec.poly_compress_round :
         ap = lift_array256 a /\
         pos_bound256_cxq a 0 256 2
         ==>
         Array256.map Poly.roundc ap = lift_array256 res /\
         forall k,
          0 <= k < 256  => 0 <= to_sint res.[k] < 16] = 1%r.
proof.  by conseq poly_compress_ll (poly_compress_round_corr_h ap). qed.


lemma poly_tomsg_corr_h _a:
   hoare[Mavx2_prevec.poly_tomsg_decode:
         pos_bound256_cxq a 0 256 2 /\
         lift_array256 a = _a ==>
         map (fun x => x = W32.one) res = m_decode _a /\
         forall k, 0 <= k && k < 256 =>
           res.[k] <> W32.zero => res.[k] = W32.one].
proof.
  proc.
  seq 1 : #pre; first by auto => />.
  cfold 4.
  seq 1: (pos_bound256_cxq a 0 256 1 /\ lift_array256 a = _a).
  ecall (poly_csubq_corr_h _a) => />. smt(). auto => />. smt().
  wp.
  while(0 <= i <= 8 /\
      lift_array256 a = _a /\
      (forall k, 0 <= k < 16 => hhqx16.[k] = W16.of_int 832) /\
      (forall k, 0 <= k < 16 => hqx16_m1.[k] = W16.of_int 1664) /\
      (forall k, 0 <= k < 32 * i => (rp.[k] = W32.one) = s_decode _a.[k]) /\
      (forall k, 0 <= k < 32 * i => rp.[k] <> W32.zero => rp.[k] = W32.one)).
  sp.
  inline *; wp; skip; simplify.
  move => &hr [#] f0_def f1_def i_lb i_ub _a_def hhqx16_def hqx16_m1_def rp_eq_decode__a rp_def i_tub.
  split.
  move : i_lb i_tub => /#.
  split.
  apply _a_def.
  split.
  apply hhqx16_def.
  split.
  apply hqx16_m1_def.
  split.
  move => k k_i.
  rewrite f0_def.
  have H: forall k, 0 <= k < 16 => (lift2poly (get256 ((init16 (fun j => a{hr}.[j])))%WArray512 (2 * i{hr}))).[k] = a{hr}.[32 * i{hr} + k].
    move => k0 k0_i; rewrite -(lift2poly_iso a{hr} (2*i{hr})); move : i_lb i_tub => /#; rewrite -mulzA /=; smt(@Int); smt(@Int @IntDiv).
  do rewrite H //.
  admit.
  admit.
  wp.
  skip.
  move => &hr [#] pos_bound_a _a_def.
  do split.
  apply _a_def.
  rewrite /(KyberCPA_avx2.hhqx16) => />.
    smt(@List @Array16).
  rewrite /(KyberCPA_avx2.hqx16_m1) => />.
    smt(@List @Array16).
  admit.
  admit.
  simplify.
  auto => />.
  move => [#] i rp0 i_tlb i_lb i_ub _a_ddef hhqx16_def hqx16_m1_def.
  have ->: i = 8.
    by move : i_tlb i_ub => /#.
  simplify.
  move => rp0_eq_decode__a rp0_def.
  split.
  apply Array256.ext_eq.
  rewrite /m_decode.
  move => x x_i.
  rewrite mapiE //=.
  rewrite mapiE //=.
  rewrite /s_decode in rp0_eq_decode__a.
  rewrite rp0_eq_decode__a //.
  move => x x_lb x_ub.
  apply rp0_def.
  rewrite x_lb x_ub //=.
qed.
end KyberPolyAVX.
