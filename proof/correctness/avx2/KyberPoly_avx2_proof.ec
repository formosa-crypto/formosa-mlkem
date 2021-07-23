require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel JMemory JWord.
require import Array256 Fq Array16 Array16p Array4 Array4p Array8 Array8p.
require import W16extra WArray512 WArray32 WArray16.
require import Ops.
require import List_hakyber.
require import KyberPoly_avx2.
require import KyberPoly_avx2_prevec.
require import Fq_avx2.

pragma +oldip.

lemma lift2poly_iso (p: W16.t Array256.t) i:
    0 <= i < 16 =>
    let x = lift2poly (get256 (WArray512.init16 (fun j => p.[j])) i) in
    forall k, 16 * i <= k < 16 * i + 16 => x.[k %% 16] = p.[k].
proof.
move => i_b x k k_b.
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
move : i_i k_i; smt.
simplify.
rewrite set_get_def => /#.
qed.

lemma get_set_get_diff (v: W16.t Array256.t) (w: vt16u16) i:
  0 <= i < 16 => forall k, i*16 <= k < i*16 + 16 =>
  w \bits16 (k%%16) = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof.
move => i_i k k_i.
rewrite Array256.initiE.
move : i_i k_i; smt.
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

op lift_array256 (p: W16.t Array256.t) =
  Array256.map (fun x => inzmod (W16.to_sint x)) p.

lemma get_lift_array256_eq (p: W16.t Array256.t):
  let p_lift = lift_array256 p in
  forall k, 0 <= k < 256 => p_lift.[k] = inzmod (W16.to_sint p.[k]).
proof.
rewrite /lift_array256 => p_lift. rewrite /p_lift.
move => k k_i.
smt (@Array256).
qed.

lemma poly_add_corr _a _b ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 =>
      hoare[ Mavx2_prevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
             inzmod (to_sint res.[k]) = _a.[k] + _b.[k]].
proof.
move => a_i b_i.
  proc => /=.
  while (
  0 <= i <= 16 /\
  (forall k, i*16 <= k < 256 =>
    inzmod (to_sint rp.[k]) = _a.[k]) /\
  _b = lift_array256 bp /\
    signed_bound_cxq rp (i*16) 256 ab /\
    signed_bound_cxq bp 0 256 bb /\
    signed_bound_cxq rp 0 (i*16) (ab + bb) /\
  (forall k, 0 <= k < i*16 =>
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
inline Ops.ivadd16u256. wp; skip.
move => &hr [#] H1 H2 H3 H4 H5 H6 H7 H8 H9 x y r rpu i.
have rpu_eqb_rp: forall k, 0 <= k < (i-1)*16 => rp{hr}.[k] = rpu.[k].
  by rewrite /rpu /i; apply get_set_get_eqb.
have rpu_eqa_rp: forall k, i*16 <= k < 256 => rp{hr}.[k] = rpu.[k].
  by rewrite /rpu /i mulzDl; apply get_set_get_eqa.
have rpu_eqm_ab: forall k, (i-1)*16 <= k < i*16 => rp{hr}.[k] + bp{hr}.[k] = rpu.[k].
  rewrite /rpu. rewrite /i. do rewrite mulzDl => />. move => k k_lb k_ub. rewrite -get_set_get_diff.
  smt. rewrite k_lb k_ub => />. rewrite -get_unpack16. smt. rewrite pack16K. rewrite get_of_list. smt. rewrite /r. do rewrite get_set_if => />.
  rewrite /x /y. rewrite -(lift2poly_iso rp{hr} (i-1)). smt. smt. rewrite -(lift2poly_iso bp{hr} (i-1)). smt. smt. smt.
do split. 
  rewrite /i. apply ltzW. apply ltzS. auto. move => H10. move : H9. rewrite /i. apply ltzE.
  move => k k_i. rewrite -rpu_eqa_rp. apply k_i. apply H3. move : k_i => /#.
  apply H4.
  rewrite /signed_bound_cxq. move => k k_i. rewrite -rpu_eqa_rp. apply k_i. apply H5. move : k_i => /#.
  apply H6.
  rewrite /signed_bound_cxq => k k_i.
case (k < (i-1)*16).
  move => k_ni.
  rewrite -rpu_eqb_rp.
  rewrite k_ni => /=.
  move : k_i => //.
  apply H7.
  rewrite /i in k_ni.
  rewrite k_ni => /=.
  move : k_i. trivial.
rewrite -lezNgt => k_ni.
rewrite /b16.
rewrite -rpu_eqm_ab.
rewrite k_ni => /#.

move : (add_corr_qv rp{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 6 3 _ _ _ _ _ _) => />; first 2 by smt(@Array256).

split.
  move : (H5 k _) => /#. move : (H5 k _) => /#.
  move : (H6 k _) => /#. 

move => *.
rewrite to_sintD_small => />.
move : (H5 k _); first by smt().
move : (H6 k _); first by smt().
move => *.
rewrite /b16 in H11.
rewrite /b16 in H12.
split.
move : H11 => /#.
move : H12 => /#.
split.
move : (H5 k _) (H6 k _) => /#.
move : (H5 k _) (H6 k _) => /#.

move => k k_i.
case (k < (i-1)*16).
  move => k_ni.
  rewrite -rpu_eqb_rp.
  rewrite k_ni => /=.
  move : k_i => //.
  apply H8.
  rewrite k_ni => /=.
  move : k_i => //.
  rewrite -lezNgt => k_ni.
rewrite -rpu_eqm_ab.
smt.

move : (add_corr_qv rp{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 6 3 _ _ _ _ _ _) => />.
move : (H3 k _) => /#.
move : H4. rewrite /lift_array256. smt(@Array256).

split.
  move : (H5 k _) => /#. 
  move : (H5 k _) => /#.
  move : (H6 k _) => /#. 
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
           signed_bound_cxq rp 0 (i*16) (ab + bb) /\ 
           forall k, 0 <= k < (i*16) =>
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
move => &hr [#] H1 H2 H3 H4 H5 H6 H7 H8 H9 x y r rpu i.
have rpu_eqb_rp: forall k, 0 <= k < (i-1)*16 => rp{hr}.[k] = rpu.[k].
   by rewrite /rpu /i; apply get_set_get_eqb.
have rpu_eqa_rp: forall k, i*16 <= k < 256 => rp{hr}.[k] = rpu.[k].
  by rewrite /rpu /i mulzDl; apply get_set_get_eqa.
have rpu_eqm_ab: forall k, (i-1)*16 <= k < i*16 => ap{hr}.[k] - bp{hr}.[k] = rpu.[k].
  rewrite /rpu. rewrite /i. do rewrite mulzDl => />. move => k k_lb k_ub. rewrite -get_set_get_diff.
  smt. rewrite k_lb k_ub => />. rewrite -get_unpack16. smt. rewrite pack16K. rewrite get_of_list. smt. rewrite /r. do rewrite get_set_if => />.
  rewrite /x /y. rewrite -(lift2poly_iso ap{hr} (i-1)). smt. smt. rewrite -(lift2poly_iso bp{hr} (i-1)). smt. smt. smt.
split.
 rewrite /i; move : H1 H9 => /#.
do split.
 apply H3.
 apply H4.
 apply H5.
 apply H6.
 rewrite /signed_bound_cxq => k k_i.
case (k < (i-1) * 16).
  move => k_ni.
  rewrite -rpu_eqb_rp.
  rewrite k_ni => /=.
  move : k_i => //.
  apply H7.
  rewrite /i in k_ni.
  rewrite k_ni => /=.
  move : k_i => />.
rewrite -lezNgt => k_ni.
rewrite /b16.
rewrite -rpu_eqm_ab.
rewrite k_ni => /#.

move : (sub_corr ap{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 14 14 _ _ _ _ _ _) => />; first 2 by smt(@Array256).

move : (H5 k _) => /#.
move : (H6 k _) => /#.

move => *.
rewrite to_sintB_small => />.
move : (H5 k _) (H6 k _) => /#.
move : (H5 k _) (H6 k _) => /#.

move => k k_i.
case (k < (i-1)*16).
move => k_ub.
rewrite -rpu_eqb_rp => /=.
rewrite k_ub; move : k_i => />.
apply H8.
rewrite k_ub; move : k_i => />.
rewrite -lezNgt => k_ni.

rewrite -rpu_eqm_ab.
rewrite k_ni => /#.

move : (sub_corr ap{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 14 14 _ _ _ _ _ _) => />; first 2 by smt(@Array256).
move : (H5 k _) => /#.
move : (H6 k _) => /#.
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
while (ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 2 /\ pos_bound256_cxq rp 0 (16*i) 1 /\ 0 <= i <= 16 /\ forall k, 0 <= k < 16 => _qx16.[k] = KyberPoly_avx2.jqx16.[k]).
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
rewrite /(KyberPoly_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: Ring.IntID.(^) 2 (16 - 1) <= 3329 <=> false. smt().
simplify.
smt.
rewrite _qx16_def => //=.
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: Ring.IntID.(^) 2 (16 - 1) <= 3329 <=> false. smt().
simplify.
smt.
rewrite _qx16_def => //=.
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
rewrite get_of_list => />.
do rewrite fun_if.
rewrite to_sintN of_sintK => />.
rewrite /smod => />.

move : _r_lb.
rewrite sltE.
rewrite _qx16_def => //=.
rewrite /(KyberPoly_avx2.jqx16).
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
rewrite /(KyberPoly_avx2.jqx16).
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
       (forall k, 0 <= k < 16 => qx16.[k] = KyberPoly_avx2.jqx16.[k]) /\
       (forall k, 0 <= k < 16 => vx16.[k] = KyberPoly_avx2.jvx16.[k])); last first.
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

end KyberPolyAVX.
