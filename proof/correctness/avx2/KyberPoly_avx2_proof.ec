require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel.
require import Array400 Array384 Array256 Array128 Array64 Array32 Array16 Array4 Array8.
require import W16extra WArray512 WArray32 WArray16.
require import AVX2_Ops.
require import Kyber_AVX2_cf.
require import KyberCPA_avx2.
require import KyberPoly_avx2_prevec.
require import NTT_avx2.
require import Fq_avx2.
require import Fq.
require import NTT_Fq.
require import Jkem.
require import KyberPoly.

pragma +oldip. (* TODO: remove me *)

lemma lift2poly_iso (p: W16.t Array256.t) (i k: int):
    0 <= i < 16 =>
    16 * i <= k < 16 * i + 16 => (lift2poly (get256 (WArray512.init16 (fun j => p.[j])) i)).[k %% 16] = p.[k].
proof. admit. (*
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
*)qed.

lemma set_get_def (v : W16.t Array256.t) (w: W256.t) i j :
    0 <= i < 16 => 0 <= j < 256 =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16)
      else v.[j].
proof. admit. (*
  move => hx hs; rewrite set256E !get16E.
  rewrite -(W2u8.unpack8K (if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16) else v.[j])); congr.
  apply W2u8.Pack.ext_eq => k hk.
  rewrite W2u8.get_unpack8 //= W2u8.Pack.initiE 1:/# /=.
  rewrite initiE /=. move : hk hs => /#.
  rewrite initiE /=. move : hk hs => /#.
  have ->: (32 * i <= 2 * j + k < 32 * i + 32) = (16 * i <= j < 16 * i + 16) by smt().
  case : (16 * i <= j < 16 * i + 16) => h.
    + by rewrite W256_bits16_bits8 1:// /#.
c    + by rewrite /init16 /#.
*)qed.

lemma set_get_eq (v: W16.t Array256.t) (w: W256.t) i j:
    0 <= i < 16 => 0 <= j < 256 => 16 * i <= j < 16 * i + 16 =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      w \bits16 j %% 16.
proof. admit. (*
  by move => h1 h2 h3; rewrite set_get_def // h3.
*)qed.

lemma set_get_diff (v: W16.t Array256.t) (w: W256.t) i j:
    0 <= i < 16 => 0 <= j < 256 => !(16 * i <= j < 16 * i + 16) =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      v.[j].
proof. admit. (*
  move => h1 h2 h3; rewrite set_get_def // h3. auto.
*)qed.

lemma get_set_get_eqb (v: W16.t Array256.t) (w: W256.t) i:
  0 <= i < 16 => forall k, 0 <= k < i*16 =>
  v.[k] = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof. admit. (*
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i; smt.
  simplify.
  rewrite set_get_def => /#.
*)qed.

lemma get_set_get_eqa (v: W16.t Array256.t) (w: W256.t) i:
  0 <= i < 16 => forall k, i*16 + 16 <= k < 256 =>
  v.[k] = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof. admit. (*
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i => /#.
  simplify.
  rewrite set_get_def => /#.
*)qed.

lemma get_set_get_diff (v: W16.t Array256.t) (w: vt16u16) i:
  0 <= i < 16 => forall k, i*16 <= k < i*16 + 16 =>
  w \bits16 (k%%16) = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof. admit. (*
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i => /#.
  simplify.
  rewrite set_get_def => /#.
*)qed.

theory KyberPolyAVX.

import Kyber.
import Fq.
import SignedReductions.
import Zq.
import ZModP.
import Fq_avx2.
import NTT_Avx2.
import KyberPoly.

lemma get_lift_array256_eq (p: W16.t Array256.t):
  let p_lift = lift_array256 p in
  forall k, 0 <= k < 256 => p_lift.[k] = inFq (W16.to_sint p.[k]).
proof. admit. (*
  rewrite /lift_array256 => p_lift. rewrite /p_lift.
  move => k k_i.
  smt (@Array256).
*)qed.

lemma lift_array256E (x : W16.t Array256.t) k :
  0 <= k < 256 =>
  (lift_array256 x).[k] = inFq (to_sint x.[k]).
proof. admit. (*  by move => ?; rewrite /lift_array256 mapiE //. *)qed.

lemma poly_add_corr_h _a _b ab bb :
      0 <= ab <= 6 => 0 <= bb <= 3 =>
      hoare[ Mprevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\
           forall k, 0 <= k < 256 =>
             inFq (to_sint res.[k]) = _a.[k] + _b.[k]].
proof. admit. (*
  move => [ab_lb ab_ub] [bb_lb bb_ub].
  proc.
  sp.
  while (0 <= i <= 16 /\
           (forall k, 16*i <= k < 256 => inFq (to_sint rp.[k]) = _a.[k]) /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp (16*i) 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (16*i) (ab + bb) /\
           (forall k, 0 <= k < (16*i) =>
             inFq (to_sint rp.[k]) = _a.[k] + _b.[k])); last first.
  auto => />.
  move => &hr signed_bound_a signed_bound_b.
  do split; first 3 by smt(@Array256).
  move => i rp i_tlb i_lb i_ub _ _.
  have ->: i = 16. by move : i_tlb i_ub => /#.
  move => -> /=.
  smt(@Array256).

  inline Ops.iVPADD_16u16.
  wp; skip.
  move => &hr [#] i_lb i_ub _a_def _b_def sgnd_bnd_hrp_a sgnd_bnd_bp sgnd_bnd_lrp_ab lrp_def i_tub />.
  rewrite mulzDr /=.
  do split; first 2 by move : i_lb i_tub => /#.
  move => k k_lb k_ub.
  rewrite lezNgt in k_lb.
  rewrite filliE 1:/# k_lb /=.
  rewrite -lezNgt in k_lb.
  rewrite -_a_def 1:/# //=.

  rewrite /signed_bound_cxq => k [k_lb k_ub].
  rewrite lezNgt in k_lb.
  rewrite filliE 1:/# k_lb /=.
  rewrite -lezNgt in k_lb.
  move : sgnd_bnd_hrp_a => /#.

  rewrite /signed_bound_cxq => k [k_lb k_ub].
  rewrite filliE 1:/# /= initiE 1:/# /=.
  case (16 * i{hr} <= k) => k_tlb.
    + rewrite k_ub /=.
      do rewrite lift2poly_iso //=.
      move : (add_corr_qv rp{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 6 3 _ _ _ _ _ _) => />; first 2 by smt(@Array256).
      rewrite /signed_bound_cxq in sgnd_bnd_hrp_a.
      move : (sgnd_bnd_hrp_a k) ab_lb ab_ub.
      rewrite k_tlb /=.
      smt(@Array256 @Int).

      rewrite /signed_bound_cxq in sgnd_bnd_bp.
      move : (sgnd_bnd_bp k) bb_lb bb_ub.
      rewrite k_lb /=.
      smt(@Array256 @Int).

      move => rp_bp_def bp_lb bp_ub.

      rewrite to_sintD_small => />.
        move : (sgnd_bnd_hrp_a k _); first by smt().
        move : (sgnd_bnd_bp k _); first by smt().
        smt(b16E @Int @Array256).
      move : (sgnd_bnd_hrp_a k _) (sgnd_bnd_bp k _) => /#.
  + simplify.
    rewrite /signed_bound_cxq /b16 in sgnd_bnd_lrp_ab.
    rewrite (sgnd_bnd_lrp_ab k) 1:/#.

  move => k k_lb k_ub.
  rewrite filliE 1:/# /= initiE 1:/# /=.
  case (16 * i{hr} <= k) => k_tlb.
    + rewrite k_ub /=.
      do (rewrite lift2poly_iso //=).
      rewrite to_sintD_small => />.
        move : (sgnd_bnd_hrp_a k _); first by smt().
        move : (sgnd_bnd_bp k _); first by smt().
        smt(b16E @Int @Array256).
      rewrite inFqD.
      rewrite _a_def 1:/#; congr.
      rewrite /lift_array256 in _b_def.
      rewrite _b_def mapiE 1:/# //=.
    + simplify.
      rewrite -ltzNge in k_tlb.
      rewrite lrp_def //=.
*)qed.

lemma poly_add_ll : islossless Mprevec.poly_add2.
proof. admit. (*
  proc; while (0<= i <= 16) (16 - i).
  auto => />.
  inline Ops.iVPADD_16u16.
  auto => />.
  smt(@Int).
  auto => />.
  smt(@Int).
*)qed.

lemma poly_add_corr _a _b ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      phoare[ Mprevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
   by move => abb bbb; conseq poly_add_ll (poly_add_corr_h _a _b ab bb abb bbb).

lemma poly_sub_corr_h _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>
      hoare[ Mprevec.poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] - _b.[k]].
proof. admit. (*
  move => [ab_lb ab_ub] [bb_lb bb_ub].
  proc.
  while (0 <= i <= 16 /\
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (16*i) (ab + bb) /\
           forall k, 0 <= k < (16*i) =>
              inFq (to_sint rp.[k]) = _a.[k] - _b.[k]
  ); first last.
  auto => />.
  move => &hr signed_bound_a signed_bound_b.
  do split; first 3 by smt(@Array256).

  inline Ops.iVPSUB_16u16.
  wp; skip.
  move => &hr [#] i_lb i_ub _a_def _b_def sgnd_bnd_hap_a sgnd_bnd_bp sgnd_bnd_lrp_ab lrp_def i_tub />.

  rewrite mulzDr /=.
  do split; first 2 by move : i_lb i_tub => /#.
  
  rewrite /signed_bound_cxq => k [k_lb k_ub].
  rewrite filliE 1:/# /=.
  case (16 * i{hr} <= k) => k_tlb.
    + rewrite k_ub /= initiE 1:/# /=.
      do (rewrite lift2poly_iso 1:/# 1:/#).
      rewrite to_sintB_small => />.
        move : (sgnd_bnd_hap_a k _) (sgnd_bnd_bp k _) => /#.
        move : (sgnd_bnd_hap_a k _) (sgnd_bnd_bp k _) => /#.
    + simplify. rewrite -ltzNge in k_tlb.
      rewrite /signed_bound_cxq /b16 in sgnd_bnd_lrp_ab.
      rewrite (sgnd_bnd_lrp_ab k _); first by rewrite k_lb k_tlb.

  move => k k_lb k_ub.
  rewrite filliE 1:/# /= initiE 1:/# /=.
  case (16 * i{hr} <= k) => k_tlb.
    + rewrite k_ub /=.
      do (rewrite lift2poly_iso //=).
      rewrite to_sintB_small => />.
        move : (sgnd_bnd_hap_a k _) (sgnd_bnd_bp k _) => /#.
      rewrite inFqB.
      rewrite _b_def _a_def /lift_array256.
      rewrite mapiE 1:/# mapiE 1:/# //=.
    + simplify.
      rewrite -ltzNge in k_tlb.
      rewrite lrp_def //=.
*)qed.

lemma poly_sub_ll : islossless Mprevec.poly_sub.
proof. admit. (*
  proc; while (0<= i <= 16) (16 - i); auto => />.
  inline Ops.iVPSUB_16u16.
  auto => />; smt(@Int).
  auto => />; smt(@Int).
*)qed.

lemma poly_sub_corr _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>  
      phoare[ Mprevec.poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] - _b.[k]] = 1%r
  by move => *; conseq poly_sub_ll (poly_sub_corr_h _a _b ab bb _ _).

lemma poly_csubq_corr_h ap :
      hoare[ Mprevec.poly_csubq :
             ap = lift_array256 rp /\
             pos_bound256_cxq rp 0 256 2
             ==>
             ap = lift_array256 res /\
             pos_bound256_cxq res 0 256 1 ].
proof. admit. (*
  proc.
  while (ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 2 /\ pos_bound256_cxq rp 0 (16*i) 1 /\ 0 <= i <= 16 /\ forall k, 0 <= k < 16 => _qx16.[k] = KyberCPA_avx2.jqx16.[k]).
  seq 3 : (#pre /\ forall k, 0 <= k < 16 => _r.[k] = rp.[16 * i + k] - _qx16.[k]).
  inline Ops.iVPSUB_16u16.
  wp. skip. simplify.
  move => &hr [#] *.
  split.
  trivial.
  move => k k_i.
  rewrite initiE 1:k_i /=.
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
  case (_r{hr}.[k] \slt W16.zero).
    + rewrite initiE 1://= /= -/(W16.onew).
      apply getsignNeg.
    + rewrite W16.sltE ltzNge -W16.sleE initiE 1://= /=.
      apply getsignPos.
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
  inline Ops.iVPAND_16u16.
  auto => />.
  move => &hr pos_bound_2 pos_bound_1 i_lb i_eub _qx16_def i_ub _r_def  t_def k k_lb k_ub.
  rewrite initiE 1:/# /= t_def 1:/# /=.
  case (_r{hr}.[k] \slt W16.zero).
    + move => _r_ub.
      rewrite -/W16.onew and1w => //.
    + rewrite -/W16.zero and0w => //.
  wp.
  ecall (iVPADD_16u16_spec t _r).
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
  rewrite inFqD. ring.
  do rewrite (fun_if inFq _ _ _).
  do rewrite (fun_if Zq.([-]) _ _ _).
  rewrite to_sintE /smod to_uintN => />.
  
  (***)
  have zero_congr_3329: 3329 %% q = 0.
    by rewrite qE; smt.
  rewrite inFqN /zero /=.
  have ->: - - inFq 3329 = inFq 3329. do rewrite -inFqN /= asintK //=.
  rewrite -inFqN.
  do rewrite -(fun_if inFq _ _ _).
  rewrite -eq_inFq.
  move : zero_congr_3329 x_mb => /#.
  
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
*)qed.

lemma poly_csubq_ll : islossless Mprevec.poly_csubq.
proof. admit. (*
  proc.
  while (0 <= i <= 16) (16 - i); auto => />.
  inline Ops.iVPSUB_16u16 Ops.iVPSRA_16u16 Ops.iVPAND_16u16 Ops.iVPADD_16u16.
  auto => />.
  smt(@W16).
  smt(@W16).
*)qed.

lemma poly_csubq_corr ap :
      phoare[ Mprevec.poly_csubq :
           ap = lift_array256 rp /\
           pos_bound256_cxq rp 0 256 2
           ==>
           ap = lift_array256 res /\
           pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_csubq_ll (poly_csubq_corr_h ap).

lemma poly_reduce_corr_h (ap: Fq Array256.t):
     hoare[ Mprevec.poly_reduce :
          ap = lift_array256 rp ==>
          ap = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16 res.[k] (2*q)].
proof. admit. (*
  proc.
  while (0 <= i <= 16 /\
         (forall k, 0 <= k < 256 => ap.[k] = inFq (to_sint rp.[k])) /\
         (forall k, 0 <= k < 16 * i => bpos16 rp.[k] (2*q)) /\
         (forall k, 0 <= k < 16 => qx16.[k] = KyberCPA_avx2.jqx16.[k]) /\
         (forall k, 0 <= k < 16 => vx16.[k] = KyberCPA_avx2.jvx16.[k])); last first.
  wp. skip.
  move => &hr ap_def />.
  do split.
  rewrite ap_def /lift_array256 => k k_lb k_ub.
  rewrite mapiE 1:/# //=.
  
  smt(@Array256).
  
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
  
  move => i rpu i_tlb i_lb i_ub.
  have ->: i=16. by move : i_tlb i_ub => /#.
  simplify.
  move => ap_eq_rpu rpu_bnds jqx16_def vx16_def.
  split.
    + apply Array256.ext_eq => x x_i.
      rewrite /lift_array256 mapiE 1:x_i /= ap_eq_rpu 1:x_i //=.
    + move : rpu_bnds => /#.
  
  wp; sp; ecall (Fq_avx2.barret_red16x_corr_h (Fq_avx2.lift_array16 r)); auto => />.
  move => &hr i_lb i_rub rp_sbred rp_eq__rp qx16_def vx16_def i_ub result red16x_bred.
  split; first by move : i_lb i_ub => /#.
  pose rp_sub := ((Fq_avx2.lift_array16
                       (lift2poly
                          (get256 ((init16 ("_.[_]" rp{hr})))%WArray512 i{hr})))).
  split.
  move => k k_lb k_ub.
  rewrite filliE 1:/# /=.
  case (16 * i{hr} <= k && k < 16 * i{hr} + 16) => k_si.
    + have bred := (BREDCp_corr rp_sub.[k %% 16] 26 _ _ _ _ _ _);
        1..4,6: smt(qE pow2_16).
        rewrite /rp_sub /lift_array16 mapiE 1:/# /= /R.
        move : W16.to_sint_cmp => /#.
      move : bred => [bred_i bred_cgr].
      rewrite red16x_bred 1:/#.
      rewrite eq_inFq in bred_cgr.
      rewrite bred_cgr.
      rewrite /lift_array16 /= mapiE 1:/# /= lift2poly_iso //.
      rewrite (rp_sbred k _) //.
    + rewrite (rp_sbred k _) //.
  rewrite mulzDr mulz1 => k k_lb k_ub.
  rewrite filliE // 1:/# k_ub /=.
  case (16 * i{hr} <= k) => k_tlb.
    + have bred := (BREDCp_corr rp_sub.[k %% 16] 26 _ _ _ _ _ _);
        1..4,6: smt(qE pow2_16).
        rewrite /rp_sub /lift_array16 mapiE 1:/# /= /R.
        move : W16.to_sint_cmp => /#.
        move : bred; rewrite andabP; move => [[bred_lb bred_ub] bred_cgr].
        (* move : bred => /andabP [[bred_lb bred_ub] bred_cgr]. *)
        rewrite red16x_bred 1:/# -/rp_sub bred_lb bred_ub //=.
    + rewrite -ltzNge in k_tlb.
      move : (rp_eq__rp k); rewrite k_lb k_tlb /= => /#.
*)qed.

lemma poly_reduce_ll:
  islossless Mprevec.poly_reduce.
proof. admit. (*
  proc; while(0 <= i <= 16) (16 - i);
    move => *; inline *; auto => />.
  move => &hr i_lb i_ub i_tub.
  split.
  move : i_lb i_tub => /#.
  smt(@Int).
  smt(@W64).
*)qed.

lemma poly_reduce_corr ap:
  phoare[ Mprevec.poly_reduce :
        ap = lift_array256 rp ==>
        ap = lift_array256 res /\
        forall k, 0 <= k < 256 => bpos16 res.[k] (2*q)] = 1%r.
proof. admit. (* by conseq poly_reduce_ll (poly_reduce_corr_h ap). *)qed.

lemma poly_frommont_corr_h ap:
  hoare[ Mprevec.poly_frommont :
       ap = map W16.to_sint rp ==>
       map W16.to_sint res = map (fun x => SREDC (x * ((Ring.IntID.(^) R 2) %% q))) ap].
proof. admit. (*
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
  do rewrite mapiE //=.
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
  rewrite initiE //=; first by move : k_lb k_ub i_tub => /#.
  
  case (k < 16 * i{hr}).
    + move => /ltzNge k_tub.
      rewrite k_tub /=.
      apply (rp_sredc k); by move : k_lb k_tub => /#.
    + move => /lezNgt k_tlb.
      rewrite mulzDr mulz1 in k_ub.
      rewrite k_tlb k_ub => /=.
      rewrite result_def //.
      rewrite /lift_array16 mapiE //= lift2poly_iso // mapiE //=.
      rewrite dmontx16_def // of_sintK => />.
      rewrite rp_eq_ap //. rewrite k_tlb; move : k_ub i_tub => /#.
      rewrite /R qE /=.
      congr.
      rewrite /smod //=.
  
  move => k k_lb k_ub.
  rewrite initiE //=; first by move : k_lb i_lb k_ub => /#.
  rewrite mulzDr mulz1 lezNgt in k_lb.
  rewrite k_lb /=.
  apply rp_eq_ap; by move : k_lb k_ub => /#.
*)qed.

lemma poly_frommont_ll : islossless  Mprevec.poly_frommont.
proof. admit. (*
  proc.
  auto => />.
  cfold 4. wp; while (0 <= i <= 16) (16 - i).
  + move => *; inline*; auto => />. smt().
  + inline *; wp; auto => /> /#.
*)qed.

lemma poly_decompress_corr mem _p (_a : W8.t Array128.t): 
    equiv [ Mprevec.poly_decompress ~ EncDec_AVX2.decode4 :
             valid_ptr _p 128 /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array128 Glob.mem{1} _p = _a /\ a{2} = _a
              ==>
             Glob.mem{1} = mem /\
             lift_array256 res{1} = decompress_poly 4 res{2} /\
             pos_bound256_cxq res{1} 0 256 1].
proof. admit. (*
  proc.
  cfold{1} 7.
  wp.
  seq 6 1 : (#pre /\
             (forall k, 0 <= k < 16 => q{1}.[k] = W16.of_int 3329) /\
             (forall k, 0 <= k < 16 => mask{1}.[k] = if (k %% 2 = 0) then (W16.of_int (2^4-1)) else (W16.of_int (2^8-2^4))) /\
             (forall k, 0 <= k < 16 => shift{1}.[k] = if (k %% 2 = 0) then (W16.of_int (2^11)) else (W16.of_int (2^7))) /\
             (forall k, 0 <= k < 32 => shufbidx{1}.[k] = W8.of_int (k %/ 4))).
    + inline *. wp. skip.
      auto => />.
      move => &1 [#] ap_lb ap_ub.
      do split.
        + move => k k_lb k_ub.
          rewrite /(KyberCPA_avx2.jqx16) /=.
          do (rewrite initiE 1:/# /=). smt(@Array16 @List).
        + move => k k_lb k_ub.
          rewrite /(pd_mask_s) /=.
          do (rewrite initiE 1:/# /=).
          rewrite /(KyberCPA_avx2.pc_mask_s) /of_int.
          apply W16.wordP => x x_i.
          rewrite bits16E initiE 1:x_i /=.
          rewrite /int2bs /= /mkseq -iotaredE /= /bits2w /=.
          case (k %% 2 = 0) => k_even.
            + do (rewrite initiE 1:/# /=).
              smt(@Int @List).
            + do (rewrite initiE 1:/# /=).
              smt(@Int @List).
        + move => k k_lb k_ub.
          rewrite /(KyberCPA_avx2.pd_shift_s) /=.
          do (rewrite initiE 1:/# /=).
          rewrite /of_int.
          apply W16.wordP => x x_i.
          rewrite bits16E initiE 1:x_i /=.
          rewrite /int2bs /= /mkseq -iotaredE /= /bits2w /=.
          case (k %% 2 = 0) => k_even.
            + do (rewrite initiE 1:/# /=).
              smt(@Int @List).
            + do (rewrite initiE 1:/# /=).
              smt(@Int @List).
        + move => k k_lb k_ub.
          rewrite /(KyberCPA_avx2.pd_jshufbidx) /=.
          do (rewrite initiE 1:/# /=).
          smt(@Array32 @List).
  while (#pre /\ i{1} = i{2} /\ 0 <= i{1} <= 16 /\
         (forall k, 0 <= k < 16 * i{1} => inFq (to_sint rp{1}.[k]) = decompress 4 r{2}.[k] /\
                                         0 <= to_sint rp{1}.[k] < q)).
    + auto => />.
      move => &1 &2 [#] valid_p mem_eq ap_eq a_mem_eq _a_eq_a2 q_def mask_def shift_def shufbidx_def i1_eq_i2 i1_lb i1_ub rp_eq i1_tub i2_tub f r [#] _ _ r_eq i2_n rp_def i1_n />.
      rewrite /i1_n /i2_n i1_eq_i2 /=.
      split; first by rewrite -i1_eq_i2; move : i1_lb i1_tub => /#.
      rewrite mulzDr -i1_eq_i2 /= => k k_lb k_ub.
      rewrite mulzDr -i1_eq_i2 /= in r_eq.
      rewrite /rp_def.
      apply (r_eq k k_lb k_ub).
    + inline *; wp.
      unroll for {2} 2.    
      auto => />.
      move => &1 &2 [#] ap_lb  ap_ub q_def mask_def shift_def shufbidx_def i_lb i_ub rp_def i_tub.
      split; first by move : i_lb i_tub => /#.
      rewrite mulzDr /= => k k_lb k_ub.
      rewrite filliE 1:/# /=.
      do (rewrite initiE 1:/# /=).
      rewrite -decompress_alt_decompress 1,2://= /decompress_alt k_ub /=.
      case (16 * i{2} <= k) => k_tlb />.
        rewrite /loadW8.
        rewrite (_: (Array32.init (fun (i0 : int) =>
                                  (Array16.init (fun (i1 : int) =>
                                                mem.[W64.to_uint (ap{1} + (W64.of_int (8 * i{2}))) + i1])).[i0 %% 16])) =
                   (Array32.init (fun (i0 : int) =>
                                  mem.[W64.to_uint (ap{1} + (W64.of_int (8 * i{2}))) + i0 %% 16]))).
          apply Array32.ext_eq.
          move => x x_i.
          do (rewrite Array32.initiE 1:x_i /=).
          rewrite Array16.initiE 1:/# //=.
        rewrite (_: (Array32.init (fun (i1 : int) =>
                                  if 128 <= to_uint shufbidx{1}.[i1] then W8.zero
                                  else (Array32.init (fun (i0 : int) =>
                                          mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + i0 %% 16])).[16 * (i1 %/ 16) + to_uint shufbidx{1}.[i1] %% 16])) =
                    (Array32.init (fun (i0 : int) => mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + i0 %/ 4]))).
          apply Array32.ext_eq => x x_i.
          do (rewrite (Array32.initiE _ x) 1:x_i /=).
          rewrite initiE 1:/# /=.
          rewrite (shufbidx_def x x_i).
          have ->: !(128 <= W8.to_uint ((W8.of_int (x %/ 4)))).
            move : x_i => /#.
          simplify.
          smt(@Int @IntDiv).
        rewrite (_: (W2u8.Pack.init (fun (j: int) =>
                                       (Array32.init (fun (i0 : int) => mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + i0 %/ 4])).[2 * (k %% 16) + j])) =
                     
                    (W2u8.Pack.init (fun (j: int) => mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + (2 * (k %% 16)) %/ 4]))).
          apply W2u8.Pack.ext_eq => x x_i.
          do (rewrite initiE 1:/# /=).
          smt(@Int @IntDiv).
        split.
          congr.
          rewrite /round_scalew /round => />.
          rewrite /truncateu16.
          rewrite /wmulls => />.
          rewrite /truncateu16.
          rewrite of_uintK.
          rewrite shift_def 1:/# q_def 1:/# mask_def 1:/# modz_dvd //.
          rewrite (W16.of_sintK 3329) /smod //= of_sintK.
          pose b := pack2_t (W2u8.Pack.init (fun (_ : int) => mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 2 * (k %% 16) %/ 4])).
          case ((k %% 2) = 0) => k_even.
            + rewrite (_: pc_mask_s = (W16.of_int (2^4 - 1))). simplify. done.
              rewrite W16.and_mod 1://.
              rewrite /q.
              rewrite of_sintK.
              rewrite (W16.of_sintK 2048) //= /(W16.smod 2048) //=.
              rewrite modz_dvd 1://=.
              rewrite of_sintK (pmod_small _ W16.modulus). by move : (modz_cmp (to_uint b) 16) => /#.
              rewrite (_: W16.smod (to_uint b %% 16) = to_uint b %% 2 ^ 4). move : (modz_cmp (to_uint b) 16); rewrite /W16.smod => /#.
              rewrite (_: W16.smod (to_uint b %% 2 ^ 4 * 2048 %% W16.modulus) = to_uint b %% 2 ^ 4 * 2048).
                rewrite /smod /=.
                smt(pmod_small @Int @IntDiv @Ring.IntID).
              do rewrite shr_shrw 1://=.
              rewrite shrDP 1://=.
              rewrite (pmod_small _ W32.modulus). by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: ((to_uint b %% 2 ^ 4) * 2048 * 3329 %/ 2 ^ 14) = (to_uint b %% 2 ^ 4) * 3329 %/ 2 ^ 3). smt(@Int @IntDiv @Ring.IntID).
              rewrite -of_intD shrDP 1://= of_uintK.
              do (rewrite (pmod_small _ W32.modulus); first by smt(@Int @IntDiv @Ring.IntID)).
              rewrite (pmod_small _ W16.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: (to_uint b %% 2 ^ 4 * 3329 %/ 2 ^ 3 + 1) %/ 2 ^ 1 = (8 + to_uint b %% 2 ^ 4 * 3329) %/ 2 ^ 4); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: W16.smod ((8 + to_uint b %% 16 * 3329) %/ 2 ^ 4) = (8 + to_uint b %% 16 * 3329) %/ 2 ^ 4).
                move : (modz_cmp (to_uint b) 16) => />.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: to_uint b %% 16 = to_uint (b `&` (W16.of_int W8.max_uint)) %% 16).
                rewrite W16.and_mod 1://=.
                rewrite of_uintK (pmod_small _ W16.modulus) 1:/#.
                smt(@Int @IntDiv).
              rewrite -zeroext_truncateu8_and.
              rewrite to_uint_zeroextu16.
              rewrite (_: to_uint (truncateu8 b) = to_uint mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 2 * (k %% 16) %/ 4]). (* can be simplified *)
                rewrite to_uint_truncateu8 //=.
                rewrite -(divz1 (to_uint b)) -(Ring.IntID.expr0 2) (_: 0 = 8 * 0) 1://=.
                rewrite -(W8.of_uintK (to_uint b %/ 2 ^ (8 * 0))) -W2u8.of_int_bits8_div 1://=.
                rewrite to_uintK.
                rewrite -get_unpack8 1://= pack2K initiE 1://= //=.
              rewrite (_: 2 * (k %% 16) %/ 4 = k %% 16 %/ 2). smt(@IntDiv @Int).
              rewrite to_uintD of_uintK.
              rewrite (pmod_small (8 * i{2}) W64.modulus). move : i_tub i_lb => /#.
              rewrite (pmod_small _ W64.modulus).
                move : ap_lb ap_ub i_tub i_lb => /#.
              rewrite (addzC 8 _).
              do (rewrite get_setE 1:/#).
              smt(@Array256).
            + rewrite (_: b `&` (W16.of_int 240) = ((b `>>>` 4) `&` (W16.of_int (2^4 - 1))) `<<<` 4). (* can be simplified *)
                rewrite (_: 2^4 - 1 = 240 %% W16.modulus %/ 2^4). by trivial.
                rewrite -W16.shrDP 1://= shrw_and shrl_andmaskN 1://= -andwA.
                rewrite (_: (of_int 240)%W16 `&` invw ((W16.masklsb 4)) = (W16.of_int 240)).
                  rewrite /invw /max 1://=.
                  rewrite /of_int /(pc_mask_s).
                  rewrite W16.wordP => j j_i.
                    rewrite andwE.
                    rewrite /bits2w /= /int2bs /= /mkseq /= mapiE 1:j_i /=.
                    do rewrite initiE 1:j_i /=.
                    rewrite -iotaredE //=.
                    smt(@Int @List @Logic).
                 done.
              rewrite W16.and_mod 1://=.
              rewrite /q.
              rewrite shlMP 1://=.
              rewrite -to_sintM_small.
                rewrite (W16.of_sintK 128) /smod //= of_sintK.
                rewrite (_: W16.smod (to_uint (b `>>>` 4) %% 2 ^ 4 * 2^4 %% W16.modulus) = to_uint (b `>>>` 4) %% 2 ^ 4 * 2^4).
                  rewrite /smod /=.
                  smt(pmod_small @Int @IntDiv @Ring.IntID).
                smt(pmod_small @Int @IntDiv @Ring.IntID).
              rewrite of_intM.
              rewrite (mulzA _ (2^4) 128) //=.
              rewrite of_sintK.
              rewrite of_sintK.
              rewrite (_: W16.smod (to_uint (b `>>>` 4) %% 16 * 2048 %% W16.modulus) =
                          to_uint (b `>>>` 4) %% 16 * 2048).
                move : (modz_cmp (to_uint (b `>>>` 4)) 16). simplify.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              do rewrite shr_shrw 1://=.
              rewrite shrDP 1://=.
              rewrite -of_intD shrDP 1://= of_uintK.
              do (rewrite (modz_dvd _ W32.modulus W16.modulus) 1://=).
              rewrite (pmod_small (to_uint (b `>>>` 4) %% 16 * 2048) W16.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: W16.smod (to_uint (b `>>>` 4) %% 16 * 2048) =
                          to_uint (b `>>>` 4) %% 16 * 2048).
                move : (modz_cmp (to_uint (b `>>>` 4)) 16). simplify.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (pmod_small (to_uint (b `>>>` 4) %% 16 * 2048 * 3329) W32.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: to_uint (b `>>>` 4) %% 16 * 2048 * 3329 %/ 2 ^ 14 =  to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3).
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (pmod_small _ W32.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: (to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3 + 1) %/ 2 ^ 1 = (8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4).
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (pmod_small _ W16.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: W16.smod ((8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4) = (8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4).
                move : (modz_cmp (to_uint (b `>>>` 4)) 16) => />.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: (to_uint (b `>>>` 4) %% 16) = to_uint mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 2 * (k %% 16) %/ 4] %/ 16). (* can be simplified *)
                rewrite -(pmod_small (to_uint (b `>>>` 4) %% 16) W16.modulus) 1:/#.
                rewrite -(W16.of_uintK (to_uint (b `>>>` 4) %% 16)).
                rewrite (_: 16 = 2 ^ 4). by trivial.
                rewrite -W16.and_mod 1://=.
                have ->: (W16.of_int (2 ^ 4 - 1)) = W16.masklsb (8 - 4); first by trivial.
                rewrite -W16.andmask_shrw 1://=.
                rewrite -(W16.to_uintK' (b `&` (W16.masklsb 8))).
                rewrite shrDP 1://=.
                rewrite W16.and_mod 1://= /max //=.
                rewrite of_uintK of_uintK.
                rewrite (pmod_small _ W16.modulus); first by smt(@Int @IntDiv @Ring.IntID).
                rewrite modz_mod.
                rewrite (pmod_small _ W16.modulus); first by  smt(@Int @IntDiv @Ring.IntID).
                rewrite -(divz1 (to_uint b)) -(Ring.IntID.expr0 2) (_: 0 = 8 * 0) 1://=.
                rewrite -(W8.of_uintK (to_uint b %/ 2 ^ (8 * 0))) -W2u8.of_int_bits8_div 1://=.
                rewrite to_uintK.
                rewrite -get_unpack8 1://= pack2K initiE 1://= //=.
              rewrite (_: 2 * (k %% 16) %/ 4 = k %% 16 %/ 2). smt(@IntDiv @Int).
              rewrite to_uintD of_uintK.
              rewrite (pmod_small (8 * i{2}) W64.modulus). move : i_tub i_lb => /#.
              rewrite (pmod_small _ W64.modulus).
                move : ap_lb ap_ub i_tub i_lb => /#.
              rewrite (addzC 8 _).
              do (rewrite get_setE 1:/#).
              smt(@Array256).
        rewrite /round_scalew /round => />.
        rewrite /truncateu16.
        rewrite /wmulls => />.
        rewrite /truncateu16.
        rewrite of_uintK.
        rewrite shift_def 1:/# q_def 1:/# mask_def 1:/# modz_dvd //.
        rewrite (W16.of_sintK 3329) /(W16.smod 3329) //= of_sintK.
        pose b := pack2_t ((W2u8.Pack.init (fun (_ : int) => mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 2 * (k %% 16) %/ 4]))).
        case ((k %% 2) = 0) => k_even.
            + rewrite (_: pc_mask_s = (W16.of_int (2^4 - 1))). simplify. done.
              rewrite W16.and_mod 1://.
              rewrite /q.
              rewrite of_sintK.
              rewrite (W16.of_sintK 2048) //= /(W16.smod 2048) //=.
              rewrite modz_dvd 1://=.
              rewrite of_sintK (pmod_small _ W16.modulus). by move : (modz_cmp (to_uint b) 16) => /#.
              rewrite (_: W16.smod (to_uint b %% 16) = to_uint b %% 2 ^ 4). move : (modz_cmp (to_uint b) 16); rewrite /W16.smod => /#.
              rewrite (_: W16.smod (to_uint b %% 2 ^ 4 * 2048 %% W16.modulus) = to_uint b %% 2 ^ 4 * 2048).
                rewrite /smod /=.
                smt(pmod_small @Int @IntDiv @Ring.IntID).
              do rewrite shr_shrw 1://=.
              rewrite shrDP 1://=.
              rewrite /(W16.smod 3329) //=.
              rewrite (pmod_small _ W32.modulus). by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: ((to_uint b %% 2 ^ 4) * 2048 * 3329 %/ 2 ^ 14) = (to_uint b %% 2 ^ 4) * 3329 %/ 2 ^ 3). smt(@Int @IntDiv @Ring.IntID).
              rewrite shrDP 1://= of_uintK.
              do (rewrite (pmod_small _ W32.modulus); first by smt(@Int @IntDiv @Ring.IntID)).
              rewrite (pmod_small _ W16.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: (to_uint b %% 2 ^ 4 * 3329 %/ 2 ^ 3 + 1) %/ 2 ^ 1 = (8 + to_uint b %% 2 ^ 4 * 3329) %/ 2 ^ 4).
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: W16.smod ((8 + to_uint b %% 16 * 3329) %/ 2 ^ 4) = ((8 + to_uint b %% 16 * 3329) %/ 2 ^ 4)).
                move : (modz_cmp (to_uint b) 16) => />.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              move : (modz_cmp (to_uint b) 16) => />.
              smt(@Int @IntDiv @Ring.IntID).
            + rewrite (_: b `&` (W16.of_int 240) = ((b `>>>` 4) `&` (W16.of_int (2^4 - 1))) `<<<` 4).
                rewrite (_: 2^4 - 1 = 240 %% W16.modulus %/ 2^4). by trivial.
                rewrite -W16.shrDP 1://= shrw_and shrl_andmaskN 1://= -andwA.
                rewrite (_: (of_int 240)%W16 `&` invw ((W16.masklsb 4)) = (W16.of_int 240)).
                  rewrite /invw /max 1://=.
                  rewrite /of_int /(pc_mask_s).
                  rewrite W16.wordP => j j_i.
                    rewrite andwE.
                    rewrite /bits2w /= /int2bs /= /mkseq /= mapiE 1:j_i /=.
                    do rewrite initiE 1:j_i /=.
                    rewrite -iotaredE //=.
                    smt(@Int @List @Logic).
                 done.
              rewrite W16.and_mod 1://=.
              rewrite /q.
              rewrite shlMP 1://=.
              rewrite -to_sintM_small.
                rewrite (W16.of_sintK 128) /smod //= of_sintK.
                rewrite (_: W16.smod (to_uint (b `>>>` 4) %% 2 ^ 4 * 2^4 %% W16.modulus) = to_uint (b `>>>` 4) %% 2 ^ 4 * 2^4).
                  rewrite /smod /=.
                  smt(pmod_small @Int @IntDiv @Ring.IntID).
                smt(pmod_small @Int @IntDiv @Ring.IntID).
              rewrite of_intM.
              rewrite (mulzA _ (2^4) 128) //=.
              rewrite of_sintK.
              rewrite of_sintK.
              rewrite (_: W16.smod (to_uint (b `>>>` 4) %% 16 * 2048 %% W16.modulus) =
                          to_uint (b `>>>` 4) %% 16 * 2048).
                move : (modz_cmp (to_uint (b `>>>` 4)) 16). simplify.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              do rewrite shr_shrw 1://=.
              rewrite shrDP 1://=.
              rewrite -of_intD shrDP 1://= of_uintK.
              do (rewrite (modz_dvd _ W32.modulus W16.modulus) 1://=).
              rewrite (pmod_small (to_uint (b `>>>` 4) %% 16 * 2048) W16.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: W16.smod (to_uint (b `>>>` 4) %% 16 * 2048) =
                          to_uint (b `>>>` 4) %% 16 * 2048).
                move : (modz_cmp (to_uint (b `>>>` 4)) 16). simplify.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (pmod_small (to_uint (b `>>>` 4) %% 16 * 2048 * 3329) W32.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: to_uint (b `>>>` 4) %% 16 * 2048 * 3329 %/ 2 ^ 14 =  to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3).
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (pmod_small _ W32.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: (to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3 + 1) %/ 2 ^ 1 = (8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4).
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (pmod_small _ W16.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: W16.smod ((8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4) = (8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4).
                move : (modz_cmp (to_uint (b `>>>` 4)) 16) => />.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              move : (modz_cmp (to_uint b) 16) => />.
              smt(@Int @IntDiv @Ring.IntID).
        rewrite -ltzNge in k_tlb.
        split.
          move : (rp_def k).
          rewrite -decompress_alt_decompress 1,2://= /decompress_alt k_lb k_tlb /=.
          move => [#] -> _ _.
          do (rewrite get_setE 1:/#).
          smt(@Array256).
          move : (rp_def k) => /#.
  wp.
  auto => />.
  move => &1 &2 [#]*.
  split.
    smt(@Logic).
  move => rp i r i_tlb _ i_lb i_ub.
  have ->: i = 16. move : i_ub i_tlb => /#.
  move => /> rp_eq_r.
  rewrite /lift_array256 /decompress_poly /pos_bound256_cxq /=.
  split.
    + apply Array256.ext_eq => x x_i.
      do rewrite mapiE 1:x_i /=.
      move : (rp_eq_r x x_i) => /#.
    + move => k k_i.
      move : (rp_eq_r k k_i) => /#.
*)qed.

lemma poly_compress_corr _a (_p : address) mem :
    equiv [ Mprevec.poly_compress ~ EncDec_AVX2.encode4 :
             pos_bound256_cxq a{1} 0 256 2 /\
             lift_array256 a{1} = _a /\
             p{2} = compress_poly 4 _a /\
             valid_ptr _p 128 /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             lift_array256 res{1} = _a /\
             pos_bound256_cxq res{1} 0 256 1 /\
             touches mem Glob.mem{1} _p 128 /\
             load_array128 Glob.mem{1} _p = res{2}].
proof. admit. (*
  proc.
  cfold{1} 8.
  seq 1 1 : (#{~(pos_bound256_cxq a{1} 0 256 2)}pre /\
           pos_bound256_cxq a{1} 0 256 1 /\ lift_array256 a{1} = _a).
  wp; call{1} (poly_csubq_corr _a); auto => /#.
  seq 7 1 : (#pre /\ i{1} = i{2} /\ i{1} = 0 /\
             (forall k, 0 <= k < 16 => v{1}.[k] = W16.of_int 20159) /\
             (forall k, 0 <= k < 16 => shift1{1}.[k] = W16.of_int (2^9)) /\
             (forall k, 0 <= k < 16 => mask{1}.[k] = W16.of_int (2^4-1)) /\
             (forall k, 0 <= k < 32 => shift2_b{1}.[k] = (W8.one `<<<` (4 * (k %% 2)))) /\
             (forall k, 0 <= k < 8 => permidx{1}.[k] = W32.of_int (4 * (k %% 2) + (k %/ 2)))).
  inline *; wp; skip.
  auto => />.
  move => &1 [#] rp_lb rp_ub pos_bound_a.
  do split.
    + move => k k_lb k_ub.
      rewrite /(KyberCPA_avx2.jvx16) /=.
      do (rewrite initiE 1:/# /=). smt(@Array16 @List).
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
    + move => k k_lb k_ub.
      rewrite /f16u16_t32u8 /=.
      do (rewrite initiE 1:/# /=).
      rewrite shlMP 1:/# /=.
      rewrite /(KyberCPA_avx2.pc_shift2_s) /of_int.
      apply W8.wordP => x x_i.
      rewrite bits8E initiE 1:x_i /=.
      rewrite /int2bs /= /mkseq -iotaredE /= /bits2w /=.
      rewrite initiE 1:/# initiE 1:x_i.
      do (rewrite (pmod_small _ 256)).
        move : (modz_cmp k 2); rewrite exprM /=.
        rewrite andabP  => /(mem_iota 0 2 (k %% 2)).
        smt(@Int @List @IntDiv @Ring.IntID).
      case (k %% 2 = 0) => k_even.
        + rewrite k_even /=.
          smt(@Int @List).
        + have ->: (k %% 2 = 1). move : k_even => /#.    
          simplify.
          smt(@Int @List).
    + move => k k_lb k_ub.
      rewrite /(KyberCPA_avx2.pc_permidx_s) /=.
      do (rewrite initiE 1:/# /=).
      smt(@Int @List @IntDiv @Array8).
    wp.
    while (#{/~mem}{~i{1}=0}pre /\ i{1} = i{2} /\ 0 <= i{1} <= 4 /\
           touches mem Glob.mem{1} _p (32*i{1}) /\
           (forall k, 0 <= k < 32 * i{1} => loadW8 Glob.mem{1} (_p + k) = r{2}.[k])).
    + auto => />.
      move => &1 &2 [#] a_def p_def valid_p rp_def pos_bound_a _a_def i_eq v_def shift1_def mask1_def shift2_b_def permidx_def i1_eq_i2 i1_lb i1_ub mem_up mem_eq_res i1_tub i2_tub mem1 r1 [#] i2_n_lb i2_n_ub touch_memL mem1_eq_r i2_n i1_n />.
      rewrite /i1_n /i2_n i1_eq_i2 -rp_def /=.
      do split; first 4 by assumption.
    seq 16 0 : (#pre /\
                (forall k, 0 <= k < 16 => W16.to_sint f0{1}.[k] = compress 4 _a.[64*i{1} + k]) /\
                (forall k, 0 <= k < 16 => W16.to_sint f1{1}.[k] = compress 4 _a.[64*i{1} + 16 + k]) /\
                (forall k, 0 <= k < 16 => W16.to_sint f2{1}.[k] = compress 4 _a.[64*i{1} + 32 + k]) /\
                (forall k, 0 <= k < 16 => W16.to_sint f3{1}.[k] = compress 4 _a.[64*i{1} + 48 + k])).
    inline *.
    wp; skip; auto => />.
    move => &1 &2 [#] rp_lb rp_ub pos_bound_a v_def shift1_def mask1_def shift2_b_def permidx_def i_lb i_ub touch_mem_p mem_up i_tub />.
    do split.
    + move => k k_lb k_ub.
      do (rewrite initiE /=; first by rewrite k_lb k_ub).
      rewrite compress_alt_nice.
      rewrite /lift_array256 mapiE 1:/# /= inFqK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite (W16.of_sintK 20159) /smod //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite (_: to_sint pc_shift1_s = 2 ^ 9). by rewrite of_sintK /smod //=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite {3}/W16.to_sint of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt(@Int @IntDiv @W16).
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
      do rewrite of_sintK.
      rewrite (_: (W16.smod (to_sint a{1}.[64 * i{2} + k] * 20159 %/ 65536 %% W16.modulus)) = to_sint a{1}.[64 * i{2} + k] * 20159 %/ 65536 %% W16.modulus).
        rewrite /smod /=.
        move : a_mul_ub => /#.
      rewrite (modz_dvd _ W32.modulus (2^23)) 1:/# (pmod_small _ (2^23)) 1:/# (pmod_small _ W16.modulus) 1:/#.
      rewrite shrDP 1://= -of_intD (pmod_small _ W32.modulus) 1:/# (pmod_small _ W16.modulus) 1:/#.
      rewrite(_: to_sint a{1}.[64 * i{2} + k] * 20159 %/ 65536 %/ 2 ^ 5 = to_sint a{1}.[64 * i{2} + k] * 20159 %/ (2^21)) 1:/#.
      rewrite (addzC _ 1) -(divzMDl 1 _ (2^21)) 1://= mul1z.
      rewrite shrDP 1://= (pmod_small _ W32.modulus) 1:/#.
      rewrite (_: (2 ^ 21 + to_sint a{1}.[64 * i{2} + k] * 20159) %/ 2 ^ 21 %/ 2 ^ 1 = (2 ^ 21 + to_sint a{1}.[64 * i{2} + k] * 20159) %/ 2 ^ 22) 1:/#.
      do (rewrite of_uintK || rewrite (modz_dvd _ _ 16) 1:/#).
      rewrite (_: W16.smod ((2^21 + to_sint a{1}.[64 * i{2} + k] * 20159) %/ 2^22 %% 16) = ((2^21 + to_sint a{1}.[64 * i{2} + k] * 20159) %/ 2^22 %% 16)).
        rewrite /smod /=.
        smt(@IntDiv @Int).
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + 48 + k)).
      rewrite (_: 0 <= 64 * i{2} + 48 + k && 64 * i{2} + 48 + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + 48 + k])).
      smt(@Int @IntDiv @Ring.IntID @W16 @Array256).
    + move => k k_lb k_ub.
      do (rewrite initiE /=; first by rewrite k_lb k_ub).
      rewrite compress_alt_nice.
      rewrite /lift_array256 mapiE 1:/# /= inFqK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite (W16.of_sintK 20159) /smod //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + 16 + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite (_: to_sint pc_shift1_s = 2 ^ 9). by rewrite of_sintK /smod //=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + 16 + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite {3}/W16.to_sint of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + 16 + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt(@Int @IntDiv @W16).
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
      do rewrite of_sintK.
      rewrite (_: (W16.smod (to_sint a{1}.[64 * i{2} + 16 + k] * 20159 %/ 65536 %% W16.modulus)) = to_sint a{1}.[64 * i{2} + 16 + k] * 20159 %/ 65536 %% W16.modulus).
        rewrite /smod /=.
        move : a_mul_ub => /#.
      rewrite (modz_dvd _ W32.modulus (2^23)) 1:/# (pmod_small _ (2^23)) 1:/# (pmod_small _ W16.modulus) 1:/#.
      rewrite shrDP 1://= -of_intD (pmod_small _ W32.modulus) 1:/# (pmod_small _ W16.modulus) 1:/#.
      rewrite(_: to_sint a{1}.[64 * i{2} + 16 + k] * 20159 %/ 65536 %/ 2 ^ 5 = to_sint a{1}.[64 * i{2} + 16 + k] * 20159 %/ (2^21)) 1:/#.
      rewrite (addzC _ 1) -(divzMDl 1 _ (2^21)) 1://= mul1z.
      rewrite shrDP 1://= (pmod_small _ W32.modulus) 1:/#.
      rewrite (_: (2 ^ 21 + to_sint a{1}.[64 * i{2} + 16 + k] * 20159) %/ 2 ^ 21 %/ 2 ^ 1 = (2 ^ 21 + to_sint a{1}.[64 * i{2} + 16 + k] * 20159) %/ 2 ^ 22) 1:/#.
      do (rewrite of_uintK || rewrite (modz_dvd _ _ 16) 1:/#).
      rewrite (_: W16.smod ((2^21 + to_sint a{1}.[64 * i{2} + 16 + k] * 20159) %/ 2^22 %% 16) = ((2^21 + to_sint a{1}.[64 * i{2} + 16 + k] * 20159) %/ 2^22 %% 16)).
        rewrite /smod /=.
        smt(@IntDiv @Int).
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + 48 + k)).
      rewrite (_: 0 <= 64 * i{2} + 48 + k && 64 * i{2} + 48 + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + 48 + k])).
      smt(@Int @IntDiv @Ring.IntID @W16 @Array256).
    + move => k k_lb k_ub.
      do (rewrite initiE /=; first by rewrite k_lb k_ub).
      rewrite compress_alt_nice.
      rewrite /lift_array256 mapiE 1:/# /= inFqK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite (W16.of_sintK 20159) /smod //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + 32 + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite (_: to_sint pc_shift1_s = 2 ^ 9). by rewrite of_sintK /smod //=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + 32 + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite {3}/W16.to_sint of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + 32 + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt(@Int @IntDiv @W16).
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
      do rewrite of_sintK.
      rewrite (_: (W16.smod (to_sint a{1}.[64 * i{2} + 32 + k] * 20159 %/ 65536 %% W16.modulus)) = to_sint a{1}.[64 * i{2} + 32 + k] * 20159 %/ 65536 %% W16.modulus).
        rewrite /smod /=.
        move : a_mul_ub => /#.
      rewrite (modz_dvd _ W32.modulus (2^23)) 1:/# (pmod_small _ (2^23)) 1:/# (pmod_small _ W16.modulus) 1:/#.
      rewrite shrDP 1://= -of_intD (pmod_small _ W32.modulus) 1:/# (pmod_small _ W16.modulus) 1:/#.
      rewrite(_: to_sint a{1}.[64 * i{2} + 32 + k] * 20159 %/ 65536 %/ 2 ^ 5 = to_sint a{1}.[64 * i{2} + 32 + k] * 20159 %/ (2^21)) 1:/#.
      rewrite (addzC _ 1) -(divzMDl 1 _ (2^21)) 1://= mul1z.
      rewrite shrDP 1://= (pmod_small _ W32.modulus) 1:/#.
      rewrite (_: (2 ^ 21 + to_sint a{1}.[64 * i{2} + 32 + k] * 20159) %/ 2 ^ 21 %/ 2 ^ 1 = (2 ^ 21 + to_sint a{1}.[64 * i{2} + 32 + k] * 20159) %/ 2 ^ 22) 1:/#.
      do (rewrite of_uintK || rewrite (modz_dvd _ _ 16) 1:/#).
      rewrite (_: W16.smod ((2^21 + to_sint a{1}.[64 * i{2} + 32 + k] * 20159) %/ 2^22 %% 16) = ((2^21 + to_sint a{1}.[64 * i{2} + 32 + k] * 20159) %/ 2^22 %% 16)).
        rewrite /smod /=.
        smt(@IntDiv @Int).
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + 48 + k)).
      rewrite (_: 0 <= 64 * i{2} + 48 + k && 64 * i{2} + 48 + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + 48 + k])).
      smt(@Int @IntDiv @Ring.IntID @W16 @Array256).
    + move => k k_lb k_ub.
      do (rewrite initiE /=; first by rewrite k_lb k_ub).
      rewrite compress_alt_nice.
      rewrite /lift_array256 mapiE 1:/# /= inFqK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite (W16.of_sintK 20159) /smod //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + 48 + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite (_: to_sint pc_shift1_s = 2 ^ 9). by rewrite of_sintK /smod //=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + 48 + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite {3}/W16.to_sint of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + 48 + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt(@Int @IntDiv @W16).
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
      do rewrite of_sintK.
      rewrite (_: (W16.smod (to_sint a{1}.[64 * i{2} + 48 + k] * 20159 %/ 65536 %% W16.modulus)) = to_sint a{1}.[64 * i{2} + 48 + k] * 20159 %/ 65536 %% W16.modulus).
        rewrite /smod /=.
        move : a_mul_ub => /#.
      rewrite (modz_dvd _ W32.modulus (2^23)) 1:/# (pmod_small _ (2^23)) 1:/# (pmod_small _ W16.modulus) 1:/#.
      rewrite shrDP 1://= -of_intD (pmod_small _ W32.modulus) 1:/# (pmod_small _ W16.modulus) 1:/#.
      rewrite(_: to_sint a{1}.[64 * i{2} + 48 + k] * 20159 %/ 65536 %/ 2 ^ 5 = to_sint a{1}.[64 * i{2} + 48 + k] * 20159 %/ (2^21)) 1:/#.
      rewrite (addzC _ 1) -(divzMDl 1 _ (2^21)) 1://= mul1z.
      rewrite shrDP 1://= (pmod_small _ W32.modulus) 1:/#.
      rewrite (_: (2 ^ 21 + to_sint a{1}.[64 * i{2} + 48 + k] * 20159) %/ 2 ^ 21 %/ 2 ^ 1 = (2 ^ 21 + to_sint a{1}.[64 * i{2} + 48 + k] * 20159) %/ 2 ^ 22) 1:/#.
      do (rewrite of_uintK || rewrite (modz_dvd _ _ 16) 1:/#).
      rewrite (_: W16.smod ((2^21 + to_sint a{1}.[64 * i{2} + 48 + k] * 20159) %/ 2^22 %% 16) = ((2^21 + to_sint a{1}.[64 * i{2} + 48 + k] * 20159) %/ 2^22 %% 16)).
        rewrite /smod /=.
        smt(@IntDiv @Int).
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + 48 + k)).
      rewrite (_: 0 <= 64 * i{2} + 48 + k && 64 * i{2} + 48 + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + 48 + k])).
      smt(@Int @IntDiv @Ring.IntID @W16 @Array256).

    inline *.
    unroll for {2} 2.
    auto => />.
    move => &1 &2 [#] rp_lb rp_ub pos_bound_a v_def shift1_def mask1_def shift2_b_def permidx_def i_lb i_ub touch_mem_p mem_up i_tub f0_def f1_def f2_def f3_def />.
    split; first by move : i_lb i_tub => /#.
    split.
      (* TODO: clean up *)
      rewrite /touches /=.
      move => j.
      rewrite (mulzDr 32 i{2} 1) mulz1 => j_i.
      rewrite get_storesE size_to_list.
      rewrite to_uintD_small /=.
        rewrite of_uintK.
         move : rp_lb rp_ub i_tub => /#.
      rewrite of_uintK.
      rewrite (pmod_small _ W64.modulus); first by move : i_lb i_tub => /#.
      case (32 * i{2} <= j < 32 * i{2} + 32) => j_si.
      + have -> : ! (to_uint rp{1} + 32 * i{2} <= to_uint rp{1} + j && to_uint rp{1} + j < to_uint rp{1} + 32 * i{2} + 32).
          move : j_si => /#.
        move : touch_mem_p => /#.
      + rewrite andabP negb_and -ltzNge -lezNgt in j_si.
        rewrite andabP negb_and -ltzNge -lezNgt in j_i.
        case (j < 0) => j_lt0.
          have -> : ! (to_uint rp{1} + 32 * i{2} <= to_uint rp{1} + j && to_uint rp{1} + j < to_uint rp{1} + 32 * i{2} + 32).
            move : j_lt0 => /#.
          move : touch_mem_p => /#.
        case (32 * i{2} + 32 <= j) => j_bts.
          have -> : ! (to_uint rp{1} + 32 * i{2} <= to_uint rp{1} + j && to_uint rp{1} + j < to_uint rp{1} + 32 * i{2} + 32).
            move : j_bts => /#.
          move : touch_mem_p => /#.
        have j_ssi: 0 <= j < 32 * i{2}.
          move : j_i j_lt0 j_si j_bts => /#.
          have -> : ! (to_uint rp{1} + 32 * i{2} <= to_uint rp{1} + j && to_uint rp{1} + j < to_uint rp{1} + 32 * i{2} + 32).
            move : j_ssi => /#.
          move : touch_mem_p => /#.
    rewrite (mulzDr 32 i{2} 1) mulz1 => k k_lb k_ub.
    rewrite /loadW8 get_storesE size_to_list.
    rewrite to_uintD_small /=.
      rewrite of_uintK.
       move : rp_lb rp_ub i_tub => /#.
    rewrite of_uintK.
    rewrite (pmod_small _ W64.modulus); first by move : i_lb i_tub => /#.
    case (k < 32 * i{2}) => k_tub.
      have ->: !(to_uint rp{1} + 32 * i{2} <= to_uint rp{1} + k && to_uint rp{1} + k < to_uint rp{1} + 32 * i{2} + 32).
        move : k_tub => /#.
      move : (mem_up k) => />.
      rewrite k_lb k_tub /=.
      rewrite /loadW8 => ->.
      do (rewrite set_neqiE 1..2:/#).
      done.
    move : k_tub; rewrite -lezNgt => k_tlb.
    have ->: (to_uint rp{1} + 32 * i{2} <= to_uint rp{1} + k && to_uint rp{1} + k < to_uint rp{1} + 32 * i{2} + 32).
        move : k_tlb k_ub => /#.
    simplify.
    rewrite (_: to_uint rp{1} + k - (to_uint rp{1} + 32 * i{2}) = k - 32 * i{2}).
      smt(@Int).
    rewrite -Array32.get_of_list.
      move : k_tlb k_ub => /#.
    rewrite to_listK.

    rewrite (_: r{2}.[32 * i{2} <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2}] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 1] * 16))%W8].[
      32 * i{2} + 1 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 2] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 3] * 16))%W8].[
      32 * i{2} + 2 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 4] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 5] * 16))%W8].[
      32 * i{2} + 3 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 6] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 7] * 16))%W8].[
      32 * i{2} + 4 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 8] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 9] * 16))%W8].[
      32 * i{2} + 5 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 10] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 11] * 16))%W8].[
      32 * i{2} + 6 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 12] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 13] * 16))%W8].[
      32 * i{2} + 7 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 14] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 15] * 16))%W8].[
      32 * i{2} + 8 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 16] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 17] * 16))%W8].[
      32 * i{2} + 9 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 18] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 19] * 16))%W8].[
      32 * i{2} + 10 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 20] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 21] * 16))%W8].[
      32 * i{2} + 11 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 22] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 23] * 16))%W8].[
      32 * i{2} + 12 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 24] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 25] * 16))%W8].[
      32 * i{2} + 13 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 26] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 27] * 16))%W8].[
      32 * i{2} + 14 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 28] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 29] * 16))%W8].[
      32 * i{2} + 15 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 30] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 31] * 16))%W8].[
      32 * i{2} + 16 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 32] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 33] * 16))%W8].[
      32 * i{2} + 17 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 34] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 35] * 16))%W8].[
      32 * i{2} + 18 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 36] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 37] * 16))%W8].[
      32 * i{2} + 19 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 38] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 39] * 16))%W8].[
      32 * i{2} + 20 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 40] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 41] * 16))%W8].[
      32 * i{2} + 21 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 42] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 43] * 16))%W8].[
      32 * i{2} + 22 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 44] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 45] * 16))%W8].[
      32 * i{2} + 23 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 46] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 47] * 16))%W8].[
      32 * i{2} + 24 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 48] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 49] * 16))%W8].[
      32 * i{2} + 25 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 50] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 51] * 16))%W8].[
      32 * i{2} + 26 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 52] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 53] * 16))%W8].[
      32 * i{2} + 27 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 54] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 55] * 16))%W8].[
      32 * i{2} + 28 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 56] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 57] * 16))%W8].[
      32 * i{2} + 29 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 58] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 59] * 16))%W8].[
      32 * i{2} + 30 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 60] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 61] * 16))%W8].[
      32 * i{2} + 31 <-
      (of_int
         ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 62] +
          (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 63] * 16))%W8] =
      (fill (fun j => W8.of_int ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 2 * (j %% 32)] +
                                   (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 2 * (j %% 32) + 1] * 16)) (32 * i{2}) 32 r{2})).
      apply Array128.ext_eq.
      move => x x_i. rewrite filliE //=.
      case (32 * i{2} <= x && x < 32 * i{2} + 32) => x_si.
        do (rewrite get_setE; first by move : x_si i_lb i_ub => /# //=).
        smt(@Array128 @Int @IntDiv).
      do (rewrite set_neqiE; first 2 by move : x_si i_lb i_tub => /#).
      done.
    do rewrite initiE 1:/# /=.
    rewrite filliE 1:/# /= k_ub k_tlb /=.
    rewrite -get_unpack8 1:/# pack4K.
    rewrite W4u8.Pack.initiE 1:/# /=.
    rewrite permidx_def 1:/#.
    rewrite of_uintK.
    rewrite modz_dvd 1://=.
    rewrite -(divz_mulp _ 4 2) 1..2://=.
    rewrite (_: (4 * ((k - 32 * i{2}) %/ 4 %% 2) + (k - 32 * i{2}) %/ (4 * 2)) %% 8 =
                k %% 8 - k %% 4 + k %/ 8 - 4 * i{2}).
      rewrite -(modz_pow2_div 3 2 _) 1://=.
      rewrite (mulzC 4 _) (divzE _ 4).
      rewrite modz_dvd //=.
      rewrite (_: (k - 32 * i{2}) %% 8 =  k %% 8). move : k_tlb k_ub; smt(@Int @IntDiv).
      rewrite (_: (k - 32 * i{2}) %% 4 =  k %% 4). move : k_tlb k_ub; smt(@Int @IntDiv).
      rewrite (pmod_small (k %% 8 - k %% 4 + (k - 32 * i{2}) %/ 8) 8). move : k_tlb k_ub; smt(@Int @IntDiv).
      move : k_tlb k_ub; smt(@Int @IntDiv).
    rewrite (_: (k - 32 * i{2}) %% 4 = k %% 4).
      smt(@Int @IntDiv).
    rewrite (_: 4 * (k %% 8 - k %% 4 + (k %/ 8) - 4 * i{2}) + k %% 4 =  4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}).
      smt(@Int @IntDiv).
    do (rewrite initiE 1:/# //=).
    rewrite (_: (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}) %/ 8 %% 2 = (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8)) %% 16 %/ 8).
      rewrite (_: 2 = 2^1) 1://= {3}(_: 8 = 2^3) 1://=.
      rewrite -(modz_pow2_div 4 3) 1://= //=.
      rewrite (mulzC 16 _).
      smt(@Int @IntDiv).
    pose x := 4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}.
    rewrite (mulzDr 2 _ _) -(mulzA 2 _ _) //=.
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8)) %/ 8 %% 2 = x %% 8 %/ 4).
      smt(@Int @IntDiv).
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8) + 1) %/ 8 %% 2 = x %% 8 %/ 4).
      smt(@Int @IntDiv).
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8)) %/ 16 = (x %/ 16)).
      smt(@Int @IntDiv).
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8)) %% 8 = 2 * (x %% 8) %% 8).
      smt(@Int @IntDiv).
    rewrite (_: ((16 * (x %/ 16) + 2 * (x %% 8) + 1) %/ 16) = x %/ 16).
      smt(@Int @IntDiv).
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8) + 1) %% 8 = (2 * (x %% 8) + 1) %% 8).
      smt(@Int @IntDiv).
    rewrite /packus16.
    do (rewrite sltE sleE || rewrite of_sintK /smod //=).
    do (rewrite f0_def 1:/# f1_def 1:/# f2_def 1:/# f3_def 1:/#).
    do (rewrite /lift_array256 mapiE 1:/# //=).
    do (rewrite (_: forall c, !(compress 4 (inFq c) < 0)); first by move => c; move : (KyberPoly.compress_rng (inFq c) 4); rewrite -lezNgt //=).
    do (rewrite (_: forall c, !(255 <= compress 4 (inFq c))) /=; first by move => c; move : (KyberPoly.compress_rng (inFq c) 4); rewrite -ltzNge /= => /#).
    rewrite (_: 8 * (x %/ 16) + 2 * (x %% 8) %% 8 = 2 * (k %% 8)).
      have ?: k \in (iota_ (32 * i{2}) 32); first by rewrite mem_iota k_ub k_tlb.
      have ?: i{2} \in (iota_ 0 4); first by rewrite mem_iota i_tub i_lb.
      move : H0 H.
      rewrite /x.
      smt().
    rewrite (_: 8 * (x %/ 16) + (2 * (x %% 8) + 1) %% 8 = 2 * (k %% 8) + 1).
      have ?: k \in (iota_ (32 * i{2}) 32); first by rewrite mem_iota k_ub k_tlb.
      have ?: i{2} \in (iota_ 0 4); first by rewrite mem_iota i_tub i_lb.
      move : H0 H.
      rewrite /x.
      smt().
    do (rewrite shift2_b_def 1:/# /=).
    rewrite (_: 4 * ((16 * (x %/ 16) + 2 * (x %% 8) + 1) %% 2) = 4).
      smt(@Int @IntDiv).
    rewrite (_: 4 * ((16 * (x %/ 16) + 2 * (x %% 8)) %% 2) = 0).
      smt(@Int @IntDiv).
    rewrite shlMP 1://= of_sintK /smod //=.
    rewrite shlMP 1://= of_sintK /smod //=.
    have f0_b: forall k, 0 <= k < 16 => 0 <= to_sint f0{1}.[k] < 16.
      move => j j_i.
      rewrite (f0_def j j_i).
      apply compress_rng; first by trivial.
    have f1_b: forall k, 0 <= k < 16 => 0 <= to_sint f1{1}.[k] < 16.
      move => j j_i.
      rewrite (f1_def j j_i).
      apply compress_rng; first by trivial.
    have f2_b: forall k, 0 <= k < 16 => 0 <= to_sint f2{1}.[k] < 16.
      move => j j_i.
      rewrite (f2_def j j_i).
      apply compress_rng; first by trivial.
    have f3_b: forall k, 0 <= k < 16 => 0 <= to_sint f3{1}.[k] < 16.
      move => j j_i.
      rewrite (f3_def j j_i).
      apply compress_rng; first by trivial.
    rewrite (_: (if x %% 8 %/ 4 = 0 then f0{1}.[2 * (k %% 8)] \bits8 0
                 else f1{1}.[2 * (k %% 8)] \bits8 0) =
                (W16.of_int (compress 4 (inFq (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)]))) \bits8 0)).
      case (x %% 8 %/ 4 = 0) => Hx.
        + rewrite Hx //=.
          move : (f0_def (2 * (k %% 8))).
          rewrite mapiE 1:/# //=.
          move => <-; first by smt().
          rewrite to_sint_unsigned; first by move : (f0_b (2 * (k %% 8))) => /#.
          rewrite to_uintK' => //=.
        + have -> /=: x %% 8 %/ 4 = 1. move : Hx => /#.
          move : (f1_def (2 * (k %% 8))).
          rewrite mapiE 1:/# //=.
          move => <-; first by smt().
          rewrite to_sint_unsigned; first by move : (f1_b (2 * (k %% 8))) => /#.
          rewrite to_uintK' => //=.
    rewrite (_: (if x %% 8 %/ 4 = 0 then f0{1}.[2 * (k %% 8) + 1] \bits8 0
                 else f1{1}.[2 * (k %% 8) + 1] \bits8 0) =
                (W16.of_int (compress 4 (inFq (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1]))) \bits8 0)).
      case (x %% 8 %/ 4 = 0) => Hx.
        + rewrite Hx //=.
          move : (f0_def (2 * (k %% 8) + 1)).
          rewrite mapiE 1:/# //= addzA.
          move => <-; first by smt().
          rewrite to_sint_unsigned; first by move : (f0_b (2 * (k %% 8) + 1)) => /#.
          rewrite to_uintK' => //=.
        + have -> /=: x %% 8 %/ 4 = 1. move : Hx => /#.
          move : (f1_def (2 * (k %% 8) + 1)).
          rewrite mapiE 1:/# //= addzA.
          move => <-; first by smt().
          rewrite to_sint_unsigned; first by move : (f1_b (2 * (k %% 8) + 1)) => /#.
          rewrite to_uintK' => //=.
    rewrite (_: (if x %% 8 %/ 4 = 0 then f2{1}.[2 * (k %% 8)] \bits8 0
                 else f3{1}.[2 * (k %% 8)] \bits8 0) =
                (W16.of_int (compress 4 (inFq (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)]))) \bits8 0)).
      case (x %% 8 %/ 4 = 0) => Hx.
        + rewrite Hx //=.
          move : (f2_def (2 * (k %% 8))).
          rewrite mapiE 1:/# //=.
          move => <-; first by smt().
          rewrite to_sint_unsigned; first by move : (f2_b (2 * (k %% 8))) => /#.
          rewrite to_uintK' => //=.
        + have -> /=: x %% 8 %/ 4 = 1. move : Hx => /#.
          move : (f3_def (2 * (k %% 8))).
          rewrite mapiE 1:/# //=.
          move => <-; first by smt().
          rewrite to_sint_unsigned; first by move : (f3_b (2 * (k %% 8))) => /#.
          rewrite to_uintK' => //=.
    rewrite (_: (if x %% 8 %/ 4 = 0 then f2{1}.[2 * (k %% 8) + 1] \bits8 0
                 else f3{1}.[2 * (k %% 8) + 1] \bits8 0) =
                (W16.of_int (compress 4 (inFq (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1]))) \bits8 0)).
      case (x %% 8 %/ 4 = 0) => Hx.
        + rewrite Hx //=.
          move : (f2_def (2 * (k %% 8) + 1)).
          rewrite mapiE 1:/# //= addzA.
          move => <-; first by smt().
          rewrite to_sint_unsigned; first by move : (f2_b (2 * (k %% 8) + 1)) => /#.
          rewrite to_uintK' => //=.
        + have -> /=: x %% 8 %/ 4 = 1. move : Hx => /#.
          move : (f3_def (2 * (k %% 8) + 1)).
          rewrite mapiE 1:/# //= addzA.
          move => <-; first by smt().
          rewrite to_sint_unsigned; first by move : (f3_b (2 * (k %% 8) + 1)) => /#.
          rewrite to_uintK' => //=.
    do (rewrite of_int_bits8_div 1://= expr0 divz1).
    have pck_bnds: forall (c1 c2: Fq),
                     0 <= (compress 4 c1) + (compress 4 c2) * 16 < 256.
        move => c1 c2.
        move : (KyberPoly.compress_rng c1 4) (KyberPoly.compress_rng c2 4) => />.
        smt(@Int @W8 @IntDiv).
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (KyberPoly.compress_rng (inFq (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) 4) => />.
      smt(ltz_trans @Logic).
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (KyberPoly.compress_rng (inFq (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) 4) => />.
      smt(ltz_trans @Logic).
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (KyberPoly.compress_rng (inFq (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) 4) => />.
      smt(ltz_trans @Logic).
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (KyberPoly.compress_rng (inFq (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) 4) => />.
      smt(ltz_trans @Logic).
    have spck_id: forall c1 c2, to_sint (packssw ((compress 4 c1) + (compress 4 c2) * 16)) = (compress 4 c1) + (compress 4 c2) * 16.
      rewrite /packssw => c1 c2.
      move : (pck_bnds c1 c2).
      do rewrite (fun_if W16.to_sint).
      do (rewrite of_sintK /smod //=).
      smt(@Int @Logic @W16).
    have pck_id: forall c1 c2, packssw ((compress 4 c1) + (compress 4 c2) * 16) = W16.of_int ((compress 4 c1) + (compress 4 c2) * 16).
      rewrite /packssw => c1 c2.
      move : (pck_bnds c1 c2).
      smt(@Int @Logic @W16).
    do rewrite spck_id.
    do rewrite pck_id.
    do (rewrite (_: forall c1 c2, !(compress 4 c1 + (compress 4 c2) * 16 < 0)); first by move : pck_bnds => /#).
    simplify.
    do (rewrite of_int_bits8_div 1://= //=).
    have packusid: forall c1 c2, (if 255 <= compress 4 c1 + (compress 4 c2) * 16 then (W8.of_int 255)
                                  else W8.of_int (compress 4 c1 + (compress 4 c2) * 16)) =
                                  W8.of_int (compress 4 c1 + (compress 4 c2) * 16).
      move => c1 c2.
      move : (pck_bnds c1 c2).
      smt(@Int @W8).
    do rewrite packusid.
    rewrite (_: (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8)) %% 16 %/ 8 = k %% 32 %/ 16).
      have ?: k \in (iota_ (32 * i{2}) 32); first by rewrite mem_iota k_ub k_tlb.
      have ?: i{2} \in (iota_ 0 4); first by rewrite mem_iota i_tub i_lb.
      move : H0 H.
      smt().
    rewrite -(fun_if W8.of_int).
    congr.
    have ->: (if k %% 32 %/ 16 = 0 then
                compress 4 (inFq (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) +
                compress 4 (inFq (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) * 16
              else
                compress 4 (inFq (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) +
                compress 4 (inFq (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) * 16) =
              compress 4 (inFq (to_sint a{1}.[64 * i{2} + 32 * (k %% 32 %/ 16) + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) +
              compress 4 (inFq (to_sint a{1}.[64 * i{2} + 32 * (k %% 32 %/ 16) + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) * 16.
      rewrite (_: k %% 32 %/ 16 = k %/ 16 %% 2).
        smt(@Ring.IntID modz_pow2_div).
      case (k %/ 16 %% 2 = 0) => even.
        + rewrite even //=.
        + have -> /=: k %/ 16 %% 2 = 1. move : even => /#.
      done.
    smt(@Int @IntDiv @W16 @W8).    

  skip.
  auto => />.
  move => &1 &2 [#]*.
  split.
    smt(@Logic).
  move => memr i r i_tlb _ i_lb i_ub.
  have ->: i = 4. move : i_ub i_tlb => /#.
  move => /> mem_eq_memr memr_eq_r.
  rewrite /load_array128 /=.
  apply Array128.ext_eq => k k_i.
  rewrite initiE 1:k_i /=.
  move : (memr_eq_r k k_i).
  rewrite /loadW8.
  done.
*)qed.

lemma poly_compress_ll : islossless Mprevec.poly_compress.
proc.
auto => />.
  cfold 8. wp; while(0 <= i <= 4) (4-i).
    move => *; inline *; auto => />. smt().
  inline Ops.iVPBROADCAST_16u16; wp; call poly_csubq_ll; auto => /> /#.
qed.

lemma poly_tomsg_corr _a (_p : address) mem : 
  equiv [Mprevec.poly_tomsg ~ EncDec_AVX2.encode1 :
             pos_bound256_cxq a{1} 0 256 2 /\ 
             lift_array256 a{1} = _a /\ a{2} = compress_poly 1 _a /\ 
             valid_ptr _p 32 /\ Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             lift_array256 res{1} = _a /\
             pos_bound256_cxq res{1} 0 256 1 /\
             touches mem Glob.mem{1} _p 32 /\
             load_array32 Glob.mem{1} _p = res{2}].
proof. admit. (*
  proc.
  cfold{1} 4.
  seq 1 1 : (#{~(pos_bound256_cxq a{1} 0 256 2)}pre /\
           pos_bound256_cxq a{1} 0 256 1).
  wp; call{1} (poly_csubq_corr _a); auto => /#.
  seq 3 1 : (#pre /\ ={i} /\ i{1} = 0 /\
             (forall k, 0 <= k < 16 => hq{1}.[k] = W16.of_int 1664) /\
             (forall k, 0 <= k < 16 => hhq{1}.[k] = W16.of_int 832)).
  wp; skip; auto => />.
  move => &1 [#] rp_lb rp_ub pos_bound_a.
  split.
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
      rewrite /(KyberCPA_avx2.hqx16_m1) initiE 1:/# //=.
      smt(@List @Array16).
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
      rewrite /(KyberCPA_avx2.hhqx16) initiE 1:/# //=.
      smt(@List @Array16).
  wp.
  while (#{/~mem}{~i{1}=0}pre /\ 0 <= i{1} <= 8 /\
         touches mem Glob.mem{1} _p (4*i{1}) /\
         forall k, 0 <= k < 4*i{1} => loadW8 Glob.mem{1} (_p + k) = ra{2}.[k]).
  auto => />.
  move => &1 &2 [#] a1_def a2_def valid_p rp_def pos_bound_a i_eq hq_def hhq_def i1_lb i1_ub touch_mem _p_def i1_tub i2_tub c ra [#] i2n_lb i2n_ub touch_mem_c c_eq_ra i2_n mem1_def i1_n />.
  rewrite /mem1_def -rp_def /i1_n /i2_n i_eq /=.
  do split; first 4 by assumption.

  inline *; wp.
  unroll for {2} 2.
  auto => />.
  move => &1 &2 [#] rp_lb rp_ub pos_bound_a hq_def hhq_def i_lb i_ub touch_mem touch_mem_n i_tub />.
  split; first by move : i_lb i_tub => /#.
  do (rewrite hq_def 1://=).
  do (rewrite hhq_def 1://=).
  rewrite (_: r7{1}.[0 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 0]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 0] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[1 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 1]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 1] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[2 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 2]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 2] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[3 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 3]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 3] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[4 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 4]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 4] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[5 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 5]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 5] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[6 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 6]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 6] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[7 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 7]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 7] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[8 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 0]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 0] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[9 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 1]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 1] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[10 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 2]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 2] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[11 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 3]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 3] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[12 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 4]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 4] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[13 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 5]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 5] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[14 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 6]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 6] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[15 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 7]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 7] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[16 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 8]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 8] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[17 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 9]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 9] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[18 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 10]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 10] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[19 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 11]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 11] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[20 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 12]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 12] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[21 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 13]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 13] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[22 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 14]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 14] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[23 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 15]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 15] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[24 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 8]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 8] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[25 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 9]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 9] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[26 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 10]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 10] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[27 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 11]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 11] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[28 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 12]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 12] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[29 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 13]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 13] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[30 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 14]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 14] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))].[31 <-
          packss16
            (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 15]) `^`
             ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 + 15] `|>>`
              (of_int 15)%W8) -
             (W16.of_int 832))] =
      Array32.init (fun x => packss16 (((W16.of_int 1664) - a{1}.[32 * i{2} + 16 * ((x %/ 8) %% 2) + 8 * (x %/ 16) + x %% 8]) `^`
                                       ((W16.of_int 1664) - a{1}.[32 * i{2} + 16 * ((x %/ 8) %% 2) + 8 * (x %/ 16) + x %% 8] `|>>`
                                       (W8.of_int 15)) - (W16.of_int 832)))).
    apply Array32.ext_eq. move => x x_i. rewrite initiE //=.
    do 32!(rewrite Array32.get_setE; first by trivial).
    smt(@Array32 @Int @IntDiv).
  pose msg := W32.bits2w
                 (mkseq
                    (fun (i1 : int) =>
                       msb
                         ((init
                             (fun (i2 : int) =>
                                ((init
                                    (fun (x10 : int) =>
                                       packss16
                                         (((of_int 1664)%W16 -
                                           a{1}.[32 * i{2} + 16 * (x10 %/ 8 %% 2) +
                                                 8 * (x10 %/ 16) + x10 %% 8]) `^`
                                          ((of_int 1664)%W16 -
                                           a{1}.[32 * i{2} + 16 * (x10 %/ 8 %% 2) +
                                                 8 * (x10 %/ 16) + x10 %% 8] `|>>`
                                           (of_int 15)%W8) -
                                          (of_int 832)%W16))))%Array32.[8 *
                                                                        (216 %/
                                                                         4 ^
                                                                         (i2 %/ 8) %%
                                                                         4) +
                                                                        i2 %% 8])))%Array32.[i1])
                    32).
  rewrite to_uintD_small.
    rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
    move : rp_lb rp_ub => /#.
  rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
  split.
    rewrite /touches => j j_i.
    rewrite /storeW32 /stores /=.
    do (rewrite get_set_neqE_s; first by move : j_i => /#).
    move : touch_mem => /#.
  
    rewrite mulzDr mulz1 => k k_lb k_ub.
    rewrite /loadW8 /storeW32 get_storesE.
    rewrite (_: size (W4u8.to_list msg) = 4); first by smt(W4u8.Pack.size_to_list).
  rewrite (_: ra{2}.[4 * i{2} <-
                (init
                   (fun (j : int) =>
                      (int_bit (compress_poly 1 (lift_array256 a{1})).[32 * i{2} + j] 0)%W8))%W8].[
                4 * i{2} + 1 <-
                (init
                   (fun (j : int) =>
                      (int_bit (compress_poly 1 (lift_array256 a{1})).[32 * i{2} + 8 + j] 0)%W8))%W8].[
                4 * i{2} + 2 <-
                (init
                   (fun (j : int) =>
                      (int_bit (compress_poly 1 (lift_array256 a{1})).[32 * i{2} + 16 + j]
                         0)%W8))%W8].[4 * i{2} + 3 <-
                (init
                   (fun (j : int) =>
                      (int_bit (compress_poly 1 (lift_array256 a{1})).[32 * i{2} + 24 + j]
                         0)%W8))%W8] =
              fill (fun w => W8.init (fun (j : int) =>
                                      W8.int_bit (compress_poly 1 (lift_array256 a{1})).[32 * i{2} + 8 * (w %% 4) + j] 0)) (4*i{2}) 4 ra{2}).
    apply Array32.ext_eq => x x_i.
    rewrite filliE 1:x_i //=.
    case (4 * i{2} <= x && x < 4 * i{2} + 4)=> x_si.
      do (rewrite get_setE; first by move : x_si i_lb i_ub => /# //=).
      (* TODO: smt should solve this
        have Hx: x \in (iota_ (4 * i{2}) 4); first by rewrite mem_iota -andabP x_si.
        move : Hx.
        smt(@Int @IntDiv @W32 @List @Array256).
      *)
      case (x = 4 * i{2} + 3) => x_3.
        by have -> /=: (x %% 4) = 3; move : x_3 => /#.
      case (x = 4 * i{2} + 2) => x_2.
        by have -> /=: (x %% 4) = 2; move : x_2 => /#.
      case (x = 4 * i{2} + 1) => x_1.
        by have -> /=: (x %% 4) = 1; move : x_1 => /#.
      have -> /=: (x %% 4) = 0; move : x_si x_1 x_2 x_3 => /#.
    do (rewrite set_neqiE; first 2 by move : x_si i_lb i_tub => /#).
    done.

  rewrite filliE 1:/#.
  case (4 * i{2} <= k && k < 4 * i{2} + 4) => k_si.
    + have ->: to_uint rp{1} + 4 * i{2} <= to_uint rp{1} + k && to_uint rp{1} + k < to_uint rp{1} + 4 * i{2} + 4.
        move : k_si => /#.
      rewrite (_: to_uint rp{1} + k - (to_uint rp{1} + 4 * i{2}) = k %% 4). move : k_si; smt(@IntDiv @Int addzC addzA).
      rewrite nth_to_list 1:/# /=.
      rewrite bits8E /msg.
      rewrite wordP => j j_i.
      do (rewrite initiE 1:/# //=).
      rewrite W32.get_bits2w 1:/# nth_mkseq 1:/# //=.
      do (rewrite initiE 1:/# //=).
      rewrite /int_bit.
      rewrite /compress_poly mapiE 1:/# //=.
      rewrite lift_array256E 1:/#.
      rewrite (mulzC 8 _).
      do (rewrite modzMDl divzMDl //=).
      do (rewrite (pdiv_small _ 8) 1:j_i //= || rewrite (modz_small j 8) 1:j_i //=).
      rewrite {2 4}(_: 16 = 8 * 2). by trivial.
      rewrite modz_dvd 1://=.
      rewrite (_: (216 %/ 4 ^ (k %% 4) %% 4 * 8 + j) %/ (8 * 2) =
                  (216 %/ 4 ^ (k %% 4) %/ 2) %% 2).
        rewrite divz_mulp 1..2://=.
        rewrite divzMDl 1://= (pdiv_small j 8) 1:j_i //=.
        rewrite {1}(_:2 = 2^1) 1://= {3}(_:4 = 2^2) 1://=.
        rewrite modz_pow2_div 1://= //=.
      rewrite (_: 32 * i{2} + 16 * (216 %/ 4 ^ (k %% 4) %% 2) +
                    8 * (216 %/ 4 ^ (k %% 4) %/ 2 %% 2) = 32 * i{2} + 8 * (k %% 4)).
        ring.
        (* TODO: smt should solve this
        have Hi: i{2} \in (iota_ 0 8); first by rewrite mem_iota i_tub i_lb.
        have Hk: (k %% 4) \in (iota_ 0 4); first by rewrite mem_iota -andabP (modz_cmp k 4).
        smt(@Int @IntDiv @List @Ring.IntID).
        *)
        case (k %% 4 = 0) => k_0.
          rewrite k_0 //=.
        case (k %% 4 = 1) => k_1.
          rewrite k_1 //=.
        case (k %% 4 = 2) => k_2.
          rewrite k_2 //=.
        case (k %% 4 = 3) => k_3.
          rewrite k_3 //=.
        move : (modz_cmp k 4) => /#.

      do rewrite modz_dvd 1://=.
      rewrite compress_avx2_impl_small 1:pos_bound_a 1:/#.
      rewrite b_decode_sem.
      smt(@Int @IntDiv @Logic).
    + have ->: !(to_uint rp{1} + 4 * i{2} <= to_uint rp{1} + k && to_uint rp{1} + k < to_uint rp{1} + 4 * i{2} + 4).
        move : k_si k_ub => /#.
      rewrite andabP negb_and -ltzNge -lezNgt in k_si.
      move: (touch_mem_n k) => />.
      rewrite k_lb /loadW8 => /#.

  wp.
  skip.
  auto => />.
  move => &1 &2 [#] rp_lb rp_ub pos_bound_a hhq_def hq_def.
  do split.
  smt(@Logic).
  move => mem1 i ra i_tlb _ i_lb i_ub.
  have ->: (i = 8).
    move : i_tlb i_ub => /#. 
 rewrite /load_array32 /loadW8 => /> mem1_eq_rp mem1_eq_ra.
  apply Array32.ext_eq => x x_i.
  rewrite initiE 1:x_i //= mem1_eq_ra 1:x_i //=.
*) qed.

lemma poly_tomsg_ll : islossless  Mprevec.poly_tomsg.
proc.
  cfold 4. wp; while (0 <= i <= 8) (8-i); last by wp; call (poly_csubq_ll); auto =>  /> /#.
  move => *.
  wp.
  inline *; wp; auto => /> /#.
qed.

(* TODO: move to spec/Kyber.ec *)
op s_encode (b: bool): int =
  asint (b_encode b).

(* TODO: simplify *)
lemma bit_decode (a: W8.t Array32.t) (i j: int):
  0 <= i < 32 =>
  0 <= j < 8 =>
  let f = f32u8_t8u32 a in
  let linear_idx = 8 * i + j in
  let di = linear_idx %/ 32 in
  let n = 3 - (linear_idx %% 4) in
  let k = ((linear_idx %% 32) + n) %/ 16 in
  let sl = W8.of_int (15 - (((linear_idx %% 32) + n) %% 16)) in
    s_encode a.[i].[j] = W16.to_sint (((((f.[di] `<<` (W8.of_int n)) \bits16 k) `<<` sl) `|>>` (W8.of_int 15)) `&` (W16.of_int 1665)).
proof. admit. (*
  move => i_i j_i f_def linear_idx di n k sl.
  rewrite /s_encode /b_encode /asint /trueval /falseval.
  have ->: ((q + 1) %/ 2) = 1665.
    rewrite qE. trivial.

  have x_msk:
    forall j0, 0 <= j0 < 16 => ((((f_def.[di] `<<` (W8.of_int n)) \bits16 k) `<<` sl) `|>>` (W8.of_int 15)).[j0]  = a.[i].[j].
      rewrite /W16.(`|>>`) /sar //=.
      move => j0 j0_i.
      do (rewrite initiE 1:/# //=).
      rewrite (_: min 15 (j0 + 15) = 15); first by smt().
      rewrite /W16.(`<<`) /W16.(`<<<`).
      rewrite /sl.
      rewrite of_uintK.
      rewrite pmod_small. by smt(@W8 @IntDiv @Int).
      rewrite pmod_small. by smt(@W8 @IntDiv @Int).
      rewrite initiE //=.
      rewrite (_: 15 - (15 - (linear_idx %% 32 + n) %% 16) = (linear_idx %% 32 + n) %% 16). smt(@Int).
      rewrite bits16E /k divzE.
      rewrite initiE 1:/# //=.
      rewrite -addzA addNz addz0.
      rewrite /W32.(`<<`) /W32.(`<<<`).
      rewrite initiE 1:/# //=.
      rewrite modz_dvd 1://= (pmod_small n) //=; first by smt(@Int @IntDiv).
      rewrite -(addzA _ n) addzN addz0.
      rewrite pack4wE 1:/# //=.
      rewrite initiE 1:/# //=.
      rewrite (_: linear_idx %% 32 %% 8 = j). by rewrite modz_dvd 1://= /linear_idx mulzC modzMDl pmod_small 1:j_i.
      rewrite (_: 4 * di + linear_idx %% 32 %/ 8 = i). rewrite /di /linear_idx; smt(@Int @IntDiv @Ring.IntID).
      done.

  case a.[i].[j] => a_i_j_1.
  have ->: ((((f_def.[di]) `<<` (of_int n)%W8 \bits16 k) `<<` sl) `|>>` (of_int 15)%W8) = W16.onew.
    rewrite wordP. move => j0 j0_i.
    rewrite (x_msk j0 j0_i).
    rewrite W16.onewE.
    rewrite j0_i a_i_j_1 //=.
  rewrite W16.and1w of_sintK /smod //=.
  rewrite /inFq Sub.insubdK 1:/# pmod_small 1:/# //=.

  move : a_i_j_1 => a_i_j_0.
 
  have ->: ((((f_def.[di]) `<<` (of_int n)%W8 \bits16 k) `<<` sl) `|>>` (of_int 15)%W8) = W16.zero.
    rewrite wordP. move => j0 j0_i.
    rewrite (x_msk j0 j0_i).
    rewrite W16.zerowE.
    rewrite a_i_j_0 //=.
  rewrite W16.and0w of_sintK /smod //=.
  rewrite /inFq Sub.insubdK 1:/# pmod_small 1:/# //=.
*) qed.

(* TODO: generalize *)
lemma true_32: forall x, 0 <= x < 8 => (W8.of_int 32).[x] = (x = 5).
proof. admit. (*
  move => x x_i.
  rewrite /of_int /= /int2bs /= /mkseq -iotaredE /=.
  rewrite /bits2w initiE 1:x_i /=.
  smt(@Int).
*)qed.

lemma true_49: forall x, 0 <= x < 8 => (W8.of_int 49).[x] = (x = 5 \/ x = 4 \/ x = 0).
proof. admit. (*
  move => x x_i.
  rewrite /of_int /= /int2bs /= /mkseq -iotaredE /=.
  rewrite /bits2w initiE 1:x_i /=.
  smt(@Int).
*)qed.

lemma poly_frommsg_corr mem _p (_m : W8.t Array32.t): 
    equiv [ Mprevec.poly_frommsg ~ EncDec_AVX2.decode1_opt :
             valid_ptr _p 32 /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array32 Glob.mem{1} _p = _m /\ a{2} = _m
              ==>
             Glob.mem{1} = mem /\
             lift_array256 res{1} = decompress_poly 1 res{2} /\
             pos_bound256_cxq res{1} 0 256 1 ].
proof. admit. (*
  proc.
  seq 5 2:(#pre /\
           ={i} /\ i{1} = 0 /\
           (forall k, 0 <= k < 16 => hqs{1}.[k] = (W16.of_int 1665)) /\
           (forall k, 0 <= k < 32 => idx{1}.[k] = pfm_idx_s.[k %% 16]) /\
           (forall k, 0 <= k < 8 => shift{1}.[k] = W32.of_int (3 - k %% 4)) /\
           (forall k, 0 <= k < 8 => f{1}.[k] = pack4_t (W4u8.Pack.init (fun i => a{2}.[4 * k + i])))).
  inline *.
  wp; skip; auto => />.
  move => &1 [#] ap_lb ap_ub.
  do split.
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
      rewrite /(KyberCPA_avx2.hqx16_m1) initiE 1:/# //=.
      smt(@List @Array16).
    + move => k k_lb k_ub.
      do (rewrite initiE 1:/# //=).
    + move => k k_lb k_ub.
      do (rewrite initiE 1:/# //=).
      smt(@Int @IntDiv @Array4 @W32).
    + move => k k_lb k_ub.
      do (rewrite initiE 1://= /=).
      apply W4u8.allP => />.
      do (rewrite /load_array32 initiE /=; first by move : k_lb k_ub => /#).
      rewrite /loadW32.
      do (rewrite -get_unpack8 1://= pack4K initiE 1://= /=).
      do rewrite addzA //=.

  while (#{~i{1}=0}pre /\ 0 <= i{1} <= 4 /\
         (forall k, 0 <= k < 32 * i{1} => inFq (to_sint rp{1}.[k]) = decompress 1 r{2}.[k]) /\
         (forall k, 128 <= k < 128 + 32 * i{1} => inFq (to_sint rp{1}.[k]) = decompress 1 r{2}.[k]) /\
         (forall k, 0 <= k < 32 * i{1} => 0 <= to_sint rp{1}.[k] < q) /\
         (forall k, 128 <= k < 128 + 32 * i{1} => 0 <= to_sint rp{1}.[k] < q)).
  auto => />.
  move => &1 &2 [#] valid_p mem_eq ap_eq_p _p_def a_def i_eq hqs_def idx_def shift_def f_def i_lb i_ub rpl_def rph_def rpl_bnd rph_bnd i1_tub i2_tub g0 g1 g2 g3 r [#] i2n_lb i2n_ub rpnl_def rpnh_def rpnl_bnd rpnh_bnd i2_n rpn i1_n />.
  rewrite /rpn /i1_n /i2_n i_eq /=.
  do split; first 6 by assumption.

  seq 16 0: (#pre /\
           (forall k, 0 <= k < 16 => W16.to_sint g0{1}.[k] = s_encode a{2}.[4 * i{1} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4)].[k %% 4]) /\
           (forall k, 0 <= k < 16 => W16.to_sint g1{1}.[k] = s_encode a{2}.[4 * i{1} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4)].[k %% 4 + 4]) /\
           (forall k, 0 <= k < 16 => W16.to_sint g2{1}.[k] = s_encode a{2}.[4 * i{1} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4) + 1].[k %% 4]) /\
           (forall k, 0 <= k < 16 => W16.to_sint g3{1}.[k] = s_encode a{2}.[4 * i{1} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4) + 1].[k %% 4 + 4])).
  inline *.
  wp; skip; auto => />.
  move => &1 &2 [#] ap_lb ap_ub hqs_def idx_def shift_def f_def i_lb i_ub rpl_def rph_def rpl_bnd rph_bnd i_tub />.
  split.
  move => k k_lb k_ub.

  have idx_in_bound: forall j, 0 <= j < 32 => ! 128 <= to_uint idx{1}.[j].
    move => j j_i.
    rewrite (idx_def j j_i).
    rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    smt(@Int @Array16 @IntDiv).

  rewrite /f8u32_t32u8 //=.
  do (rewrite initiE /=; first by rewrite k_lb k_ub /=).
  rewrite initiE /=; first by move : i_lb i_tub k_lb k_ub => /#.
  rewrite (pmod_small _ 256).
    move : i_lb i_tub => /#.

  rewrite (_: (Array8.init (fun (i1: int) => ((Array8.init (fun (i2 : int) => f{1}.[4 * (i2 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i2 %% 4))) %% 4]))).[i1] `<<<` to_uint shift{1}.[i1])) =
              (Array8.init (fun (i1: int) => f{1}.[4 * (i1 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i1 %% 4))) %% 4] `<<<` to_uint shift{1}.[i1]))).
    apply Array8.ext_eq.
    move => x x_i.
    do rewrite initiE //=.

  rewrite (_: (Array32.init (fun (i0: int) => (Array8.init (fun (i1 : int) =>
                                              f{1}.[4 * (i1 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i1 %% 4))) %% 4] `<<<` to_uint shift{1}.[i1])).[i0 %/ 4] \bits8 i0 %% 4)) =
              (Array32.init (fun (i0 : int) => (f{1}.[4 * (i0 %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((i0 %/ 4) %% 4))) %% 4] `<<<` to_uint shift{1}.[i0 %/ 4]) \bits8 i0 %% 4))).
    apply Array32.ext_eq.
    move => x x_i.
    do rewrite initiE //=.
      move : x_i => /#.
  pose tmp := (Array32.init (fun (i0 : int) => f{1}.[4 * (i0 %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i0 %/ 4 %% 4))) %% 4] `<<<`
                                                to_uint shift{1}.[i0 %/ 4] \bits8 i0 %% 4)).
  rewrite (_: (Array32.init (fun (i : int) => if 128 <= to_uint idx{1}.[i] then W8.zero
                                               else tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16])) =
               (Array32.init (fun (i: int) => tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16]))).
    apply Array32.ext_eq.
    move => x x_i.
    rewrite initiE //=.
    rewrite (idx_in_bound x x_i) //=.
    rewrite (Array32.initiE _ x) //=.

  rewrite (_: (W2u8.Pack.init (fun (j: int) => (Array32.init (fun (i : int) =>
                                                tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16])).[2 * k + j])) =
               W2u8.Pack.init (fun j => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]])).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do 2!(rewrite initiE 1:/# //=).
    rewrite W2u8.Pack.initiE 1://= //=.
    rewrite (pmod_small _ 16) //=.
      rewrite idx_def 1:/# /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @Array16 @IntDiv @Int).

    rewrite (_: W2u8.Pack.init (fun (j : int) => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]]) =
                W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                                 W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                                 \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite idx_def 1:/# /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    move : x_i k_lb k_ub => /#.

  rewrite (_: W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) +
                                                         85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) +
                                                         W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                               W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                               \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4) =
              W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((2 * k + j) %/ 16) +
                                                         85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4] `<<<`
                                               W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                               \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    rewrite initiE //=.
    rewrite initiE //=.
    have idx_bnds: forall w, 0 <= w < 32 => 0 <= to_uint idx{1}.[w] %/4 && to_uint idx{1}.[w] %/ 4 < 4.
      move => w w_i.
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @Array16 @IntDiv).
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %% 4 =
                to_uint idx{1}.[2 * k + x] %/ 4).
      move : (idx_bnds (2 * k + x)).
      smt(@Int @IntDiv).
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %/ 4 =
                (2 * k + x) %/ 16).
      move : (idx_bnds (2 * k + x)).
      smt(@Int @IntDiv).
    trivial.

  have f_idx: forall j, 0 <= j < 2 => 4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4 =
                                         4 * (k %/ 8) + i{2}.
    move => j j_i.
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite exprM //=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt(@Int @IntDiv).
    rewrite (pdiv_small _ 4) //=. by smt(@Int @IntDiv).
    rewrite (_: 4 * (k %/ 8) + 85 * i{2} %/ 4 ^ (k %% 4) %% 4 = 4 * (k %/ 8) + i{2} <=>
                85 * i{2} %/ 4 ^ (k %% 4) %% 4 = i{2}). by smt(@Int).
    rewrite (_: 85 * i{2} = (4 ^ 3) * i{2} + (4 ^ 2) * i{2} + (4 ^ 1) * i{2} + (4 ^ 0) * i{2}). smt(@Int @IntDiv @Ring.IntID).
    move : (modz_cmp k 4) => km_i.
    case (k %% 4 = 0) => k_0.
      rewrite k_0.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 1) => k_1.
      rewrite k_1.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 2) => k_2.
      rewrite k_2.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 3) => k_3.
      rewrite k_3.
      smt(@Int @Ring.IntID @IntDiv).
    smt(@List @Logic).

  have shift_idx: forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 = 4 * (k %/ 8) + k %% 4.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt(@Int).
    rewrite (divzMDl (4 * (k %/ 8)) _ 4) 1://=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt(@Int @IntDiv).
    rewrite (pdiv_small _ 4) //=. by smt(@Int @IntDiv).

  have bit_idx : forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4 = 2 * (k %% 8 %/ 4) + j.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt(@Int).
    smt(@Int @IntDiv).

  rewrite (_: W2u8.Pack.init (fun (j : int) =>
                              f{1}.[4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4] `<<<`
                              to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4] \bits8
                              (16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %% 4) =
              W2u8.Pack.init (fun (j: int) =>
                              f{1}.[4 * (k %/ 8) + i{2}] `<<<`
                              to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits8 2 * (k %% 8 %/ 4) + j)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite f_idx 1:// shift_idx 1://= bit_idx 1://=.
    trivial.

  rewrite (_: (pack2_t (W2u8.Pack.init (fun (j: int) =>
                                f{1}.[4 * (k %/ 8) + i{2}] `<<<`
                                to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits8 2 * (k %% 8 %/ 4) + j)))
               = f{1}.[4 * (k %/ 8) + i{2}] `<<<` to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits16 (k %% 8 %/ 4)).
    rewrite /pack2_t.
    rewrite W16.wordP.
    move => i i_i.
    rewrite initiE //= initiE 1:/# //=.
    rewrite bits8E bits16E.
    rewrite initiE //= initiE 1:/# //=.
    smt(@Int @IntDiv).

  pose idx := 4 * i{2} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4).
  pose linear_idx := 8 * idx + k %% 4.

  have ->: 4 * (k %/ 8) + i{2} = linear_idx %/ 32. by smt(@Int @IntDiv).
  rewrite shift_def /=; first by move : k_lb k_ub => /#.
  rewrite (mulzC 4 _) modzMDl modz_mod.
  rewrite of_uintK pmod_small 1:/#.
  rewrite hqs_def; first by rewrite k_lb k_ub /=.

  have ->: 3 - k %% 4 = 3 - linear_idx %% 4. by smt(@Int @IntDiv).
  have ->: k %% 8 %/ 4 = (linear_idx %% 32 + (3 - linear_idx %% 4)) %/ 16. by smt(@Int @IntDiv).
  have ->: 12 = 15 - ((linear_idx %% 32 + (3 - linear_idx %% 4)) %% 16). by smt(@Int @IntDiv).

  pose di := linear_idx %/ 32.
  pose n := 3 - linear_idx %% 4.
  pose kb := (linear_idx %% 32 + n) %/ 16.
  pose sl := W8.of_int (15 - (linear_idx %% 32 + n) %% 16).

  rewrite -W32.shl_shlw 1:/#.
  move : (bit_decode (load_array32 mem (to_uint ap{1})) idx (k %% 4)).
  have -> /=: (0 <= idx && idx < 32). by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  have -> /=: (0 <= k %% 4 && k %% 4 < 8). by move : (modz_cmp k 4) => /#.
  have ->: (f32u8_t8u32 (load_array32 mem (to_uint ap{1}))) = f{1}.
    rewrite /f32u8_t8u32.
    apply Array8.ext_eq => x x_i.
    rewrite f_def 1:x_i //= Array8.initiE 1:x_i /load_array32 //=.

  rewrite -/di -/n -/kb -/sl.
  rewrite /load_array32 /= initiE /=; first by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  smt(@Logic).


(* FIXME: same block x3 ****************************************************************)
  split.
  move => k k_lb k_ub.

  have idx_in_bound: forall j, 0 <= j < 32 => ! 128 <= to_uint idx{1}.[j].
    move => j j_i.
    rewrite (idx_def j j_i).
    rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    smt(@Int @Array16 @IntDiv).

  rewrite /f8u32_t32u8 //=.
  do (rewrite initiE /=; first by rewrite k_lb k_ub /=).
  rewrite initiE /=; first by move : i_lb i_tub k_lb k_ub => /#.
  rewrite (pmod_small _ 256).
    move : i_lb i_tub => /#.

  rewrite (_: (Array8.init (fun (i1: int) => ((Array8.init (fun (i2 : int) => f{1}.[4 * (i2 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i2 %% 4))) %% 4]))).[i1] `<<<` to_uint shift{1}.[i1])) =
              (Array8.init (fun (i1: int) => f{1}.[4 * (i1 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i1 %% 4))) %% 4] `<<<` to_uint shift{1}.[i1]))).
    apply Array8.ext_eq.
    move => x x_i.
    do rewrite initiE //=.

  rewrite (_: (Array32.init (fun (i0: int) => (Array8.init (fun (i1 : int) =>
                                              f{1}.[4 * (i1 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i1 %% 4))) %% 4] `<<<` to_uint shift{1}.[i1])).[i0 %/ 4] \bits8 i0 %% 4)) =
              (Array32.init (fun (i0 : int) => (f{1}.[4 * (i0 %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((i0 %/ 4) %% 4))) %% 4] `<<<` to_uint shift{1}.[i0 %/ 4]) \bits8 i0 %% 4))).
    apply Array32.ext_eq.
    move => x x_i.
    do rewrite initiE //=.
      move : x_i => /#.
  pose tmp := (Array32.init (fun (i0 : int) => f{1}.[4 * (i0 %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i0 %/ 4 %% 4))) %% 4] `<<<`
                                                to_uint shift{1}.[i0 %/ 4] \bits8 i0 %% 4)).
  rewrite (_: (Array32.init (fun (i : int) => if 128 <= to_uint idx{1}.[i] then W8.zero
                                               else tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16])) =
               (Array32.init (fun (i: int) => tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16]))).
    apply Array32.ext_eq.
    move => x x_i.
    rewrite initiE //=.
    rewrite (idx_in_bound x x_i) //=.
    rewrite (Array32.initiE _ x) //=.

  rewrite (_: (W2u8.Pack.init (fun (j: int) => (Array32.init (fun (i : int) =>
                                                tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16])).[2 * k + j])) =
               W2u8.Pack.init (fun j => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]])).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do 2!(rewrite initiE 1:/# //=).
    rewrite W2u8.Pack.initiE 1://= //=.
    rewrite (pmod_small _ 16) //=.
      rewrite idx_def 1:/# /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @Array16 @IntDiv @Int).

    rewrite (_: W2u8.Pack.init (fun (j : int) => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]]) =
                W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                                 W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                                 \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite idx_def 1:/# /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    move : x_i k_lb k_ub => /#.

  rewrite (_: W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) +
                                                         85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) +
                                                         W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                               W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                               \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4) =
              W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((2 * k + j) %/ 16) +
                                                         85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4] `<<<`
                                               W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                               \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    rewrite initiE //=.
    rewrite initiE //=.
    have idx_bnds: forall w, 0 <= w < 32 => 0 <= to_uint idx{1}.[w] %/4 && to_uint idx{1}.[w] %/ 4 < 4.
      move => w w_i.
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @Array16 @IntDiv).
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %% 4 =
                to_uint idx{1}.[2 * k + x] %/ 4).
      move : (idx_bnds (2 * k + x)).
      smt(@Int @IntDiv).
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %/ 4 =
                (2 * k + x) %/ 16).
      move : (idx_bnds (2 * k + x)).
      smt(@Int @IntDiv).
    trivial.

  have f_idx: forall j, 0 <= j < 2 => 4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4 =
                                         4 * (k %/ 8) + i{2}.
    move => j j_i.
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite exprM //=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt(@Int @IntDiv).
    rewrite (pdiv_small _ 4) //=. by smt(@Int @IntDiv).
    rewrite (_: 4 * (k %/ 8) + 85 * i{2} %/ 4 ^ (k %% 4) %% 4 = 4 * (k %/ 8) + i{2} <=>
                85 * i{2} %/ 4 ^ (k %% 4) %% 4 = i{2}). by smt(@Int).
    rewrite (_: 85 * i{2} = (4 ^ 3) * i{2} + (4 ^ 2) * i{2} + (4 ^ 1) * i{2} + (4 ^ 0) * i{2}). smt(@Int @IntDiv @Ring.IntID).
    move : (modz_cmp k 4) => km_i.
    case (k %% 4 = 0) => k_0.
      rewrite k_0.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 1) => k_1.
      rewrite k_1.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 2) => k_2.
      rewrite k_2.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 3) => k_3.
      rewrite k_3.
      smt(@Int @Ring.IntID @IntDiv).
    smt(@List @Logic).

  have shift_idx: forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 = 4 * (k %/ 8) + k %% 4.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt(@Int).
    rewrite (divzMDl (4 * (k %/ 8)) _ 4) 1://=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt(@Int @IntDiv).
    rewrite (pdiv_small _ 4) //=. by smt(@Int @IntDiv).

  have bit_idx : forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4 = 2 * (k %% 8 %/ 4) + j.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt(@Int).
    smt(@Int @IntDiv).

  rewrite (_: W2u8.Pack.init (fun (j : int) =>
                              f{1}.[4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4] `<<<`
                              to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4] \bits8
                              (16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %% 4) =
              W2u8.Pack.init (fun (j: int) =>
                              f{1}.[4 * (k %/ 8) + i{2}] `<<<`
                              to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits8 2 * (k %% 8 %/ 4) + j)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite f_idx 1:// shift_idx 1://= bit_idx 1://=.
    trivial.

  rewrite (_: (pack2_t (W2u8.Pack.init (fun (j: int) =>
                                f{1}.[4 * (k %/ 8) + i{2}] `<<<`
                                to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits8 2 * (k %% 8 %/ 4) + j)))
               = f{1}.[4 * (k %/ 8) + i{2}] `<<<` to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits16 (k %% 8 %/ 4)).
    rewrite /pack2_t.
    rewrite W16.wordP.
    move => i i_i.
    rewrite initiE //= initiE 1:/# //=.
    rewrite bits8E bits16E.
    rewrite initiE //= initiE 1:/# //=.
    smt(@Int @IntDiv).

  pose idx := 4 * i{2} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4).
  pose linear_idx := 8 * idx + k %% 4 + 4.

  have ->: 4 * (k %/ 8) + i{2} = linear_idx %/ 32. by smt(@Int @IntDiv).
  rewrite shift_def /=; first by move : k_lb k_ub => /#.
  rewrite (mulzC 4 _) modzMDl modz_mod.
  rewrite of_uintK pmod_small 1:/#.
  rewrite hqs_def; first by rewrite k_lb k_ub /=.

  have ->: 3 - k %% 4 = 3 - linear_idx %% 4. by smt(@Int @IntDiv).
  have ->: k %% 8 %/ 4 = (linear_idx %% 32 + (3 - linear_idx %% 4)) %/ 16. by smt(@Int @IntDiv).
  have ->: 8 = 15 - ((linear_idx %% 32 + (3 - linear_idx %% 4)) %% 16). by smt(@Int @IntDiv).

  pose di := linear_idx %/ 32.
  pose n := 3 - linear_idx %% 4.
  pose kb := (linear_idx %% 32 + n) %/ 16.
  pose sl := W8.of_int (15 - (linear_idx %% 32 + n) %% 16).

  rewrite -W32.shl_shlw 1:/#.
  move : (bit_decode (load_array32 mem (to_uint ap{1})) idx (k %% 4 + 4)).
  have -> /=: (0 <= idx && idx < 32). by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  have -> /=: (0 <= k %% 4 + 4 && k %% 4 + 4 < 8). by move : (modz_cmp k 4) => /#.
  have ->: (f32u8_t8u32 (load_array32 mem (to_uint ap{1}))) = f{1}.
    rewrite /f32u8_t8u32.
    apply Array8.ext_eq => x x_i.
    rewrite f_def 1:x_i //= Array8.initiE 1:x_i /load_array32 //=.

  rewrite -/di -/n -/kb -/sl.
  rewrite /load_array32 /= initiE /=; first by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  smt(@Logic).

  split.
  move => k k_lb k_ub.

  have idx_in_bound: forall j, 0 <= j < 32 => ! 128 <= to_uint idx{1}.[j].
    move => j j_i.
    rewrite (idx_def j j_i).
    rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    smt(@Int @Array16 @IntDiv).

  rewrite /f8u32_t32u8 //=.
  do (rewrite initiE /=; first by rewrite k_lb k_ub /=).
  rewrite initiE /=; first by move : i_lb i_tub k_lb k_ub => /#.
  rewrite (pmod_small _ 256).
    move : i_lb i_tub => /#.

  rewrite (_: (Array8.init (fun (i1: int) => ((Array8.init (fun (i2 : int) => f{1}.[4 * (i2 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i2 %% 4))) %% 4]))).[i1] `<<<` to_uint shift{1}.[i1])) =
              (Array8.init (fun (i1: int) => f{1}.[4 * (i1 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i1 %% 4))) %% 4] `<<<` to_uint shift{1}.[i1]))).
    apply Array8.ext_eq.
    move => x x_i.
    do rewrite initiE //=.

  rewrite (_: (Array32.init (fun (i0: int) => (Array8.init (fun (i1 : int) =>
                                              f{1}.[4 * (i1 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i1 %% 4))) %% 4] `<<<` to_uint shift{1}.[i1])).[i0 %/ 4] \bits8 i0 %% 4)) =
              (Array32.init (fun (i0 : int) => (f{1}.[4 * (i0 %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((i0 %/ 4) %% 4))) %% 4] `<<<` to_uint shift{1}.[i0 %/ 4]) \bits8 i0 %% 4))).
    apply Array32.ext_eq.
    move => x x_i.
    do rewrite initiE //=.
      move : x_i => /#.
  pose tmp := (Array32.init (fun (i0 : int) => f{1}.[4 * (i0 %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i0 %/ 4 %% 4))) %% 4] `<<<`
                                                to_uint shift{1}.[i0 %/ 4] \bits8 i0 %% 4)).
  rewrite (_: (Array32.init (fun (i : int) => if 128 <= to_uint idx{1}.[i] then W8.zero
                                               else tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16])) =
               (Array32.init (fun (i: int) => tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16]))).
    apply Array32.ext_eq.
    move => x x_i.
    rewrite initiE //=.
    rewrite (idx_in_bound x x_i) //=.
    rewrite (Array32.initiE _ x) //=.

  rewrite (_: (W2u8.Pack.init (fun (j: int) => (Array32.init (fun (i : int) =>
                                                tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16])).[2 * k + j])) =
               W2u8.Pack.init (fun j => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]])).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do 2!(rewrite initiE 1:/# //=).
    rewrite W2u8.Pack.initiE 1://= //=.
    rewrite (pmod_small _ 16) //=.
      rewrite idx_def 1:/# /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @Array16 @IntDiv @Int).

    rewrite (_: W2u8.Pack.init (fun (j : int) => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]]) =
                W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                                 W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                                 \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite idx_def 1:/# /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    move : x_i k_lb k_ub => /#.

  rewrite (_: W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) +
                                                         85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) +
                                                         W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                               W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                               \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4) =
              W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((2 * k + j) %/ 16) +
                                                         85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4] `<<<`
                                               W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                               \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    rewrite initiE //=.
    rewrite initiE //=.
    have idx_bnds: forall w, 0 <= w < 32 => 0 <= to_uint idx{1}.[w] %/4 && to_uint idx{1}.[w] %/ 4 < 4.
      move => w w_i.
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @Array16 @IntDiv).
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %% 4 =
                to_uint idx{1}.[2 * k + x] %/ 4).
      move : (idx_bnds (2 * k + x)).
      smt(@Int @IntDiv).
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %/ 4 =
                (2 * k + x) %/ 16).
      move : (idx_bnds (2 * k + x)).
      smt(@Int @IntDiv).
    trivial.

  have f_idx: forall j, 0 <= j < 2 => 4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4 =
                                         4 * (k %/ 8) + i{2}.
    move => j j_i.
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite exprM //=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt(@Int @IntDiv).
    rewrite (pdiv_small _ 4) //=. by smt(@Int @IntDiv).
    rewrite (_: 4 * (k %/ 8) + 85 * i{2} %/ 4 ^ (k %% 4) %% 4 = 4 * (k %/ 8) + i{2} <=>
                85 * i{2} %/ 4 ^ (k %% 4) %% 4 = i{2}). by smt(@Int).
    rewrite (_: 85 * i{2} = (4 ^ 3) * i{2} + (4 ^ 2) * i{2} + (4 ^ 1) * i{2} + (4 ^ 0) * i{2}). smt(@Int @IntDiv @Ring.IntID).
    move : (modz_cmp k 4) => km_i.
    case (k %% 4 = 0) => k_0.
      rewrite k_0.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 1) => k_1.
      rewrite k_1.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 2) => k_2.
      rewrite k_2.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 3) => k_3.
      rewrite k_3.
      smt(@Int @Ring.IntID @IntDiv).
    smt(@List @Logic).

  have shift_idx: forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 = 4 * (k %/ 8) + k %% 4.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt(@Int).
    rewrite (divzMDl (4 * (k %/ 8)) _ 4) 1://=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt(@Int @IntDiv).
    rewrite (pdiv_small _ 4) //=. by smt(@Int @IntDiv).

  have bit_idx : forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4 = 2 * (k %% 8 %/ 4) + j.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt(@Int).
    smt(@Int @IntDiv).

  rewrite (_: W2u8.Pack.init (fun (j : int) =>
                              f{1}.[4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4] `<<<`
                              to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4] \bits8
                              (16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %% 4) =
              W2u8.Pack.init (fun (j: int) =>
                              f{1}.[4 * (k %/ 8) + i{2}] `<<<`
                              to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits8 2 * (k %% 8 %/ 4) + j)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite f_idx 1:// shift_idx 1://= bit_idx 1://=.
    trivial.

  rewrite (_: (pack2_t (W2u8.Pack.init (fun (j: int) =>
                                f{1}.[4 * (k %/ 8) + i{2}] `<<<`
                                to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits8 2 * (k %% 8 %/ 4) + j)))
               = f{1}.[4 * (k %/ 8) + i{2}] `<<<` to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits16 (k %% 8 %/ 4)).
    rewrite /pack2_t.
    rewrite W16.wordP.
    move => i i_i.
    rewrite initiE //= initiE 1:/# //=.
    rewrite bits8E bits16E.
    rewrite initiE //= initiE 1:/# //=.
    smt(@Int @IntDiv).

  pose idx := 4 * i{2} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4) + 1.
  pose linear_idx := 8 * idx + k %% 4.

  have ->: 4 * (k %/ 8) + i{2} = linear_idx %/ 32. by smt(@Int @IntDiv).
  rewrite shift_def /=; first by move : k_lb k_ub => /#.
  rewrite (mulzC 4 _) modzMDl modz_mod.
  rewrite of_uintK pmod_small 1:/#.
  rewrite hqs_def; first by rewrite k_lb k_ub /=.

  have ->: 3 - k %% 4 = 3 - linear_idx %% 4. by smt(@Int @IntDiv).
  have ->: k %% 8 %/ 4 = (linear_idx %% 32 + (3 - linear_idx %% 4)) %/ 16. by smt(@Int @IntDiv).
  have ->: 4 = 15 - ((linear_idx %% 32 + (3 - linear_idx %% 4)) %% 16). by smt(@Int @IntDiv).

  pose di := linear_idx %/ 32.
  pose n := 3 - linear_idx %% 4.
  pose kb := (linear_idx %% 32 + n) %/ 16.
  pose sl := W8.of_int (15 - (linear_idx %% 32 + n) %% 16).

  rewrite -W32.shl_shlw 1:/#.
  move : (bit_decode (load_array32 mem (to_uint ap{1})) idx (k %% 4)).
  have -> /=: (0 <= idx && idx < 32). by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  have -> /=: (0 <= k %% 4 && k %% 4 < 8). by move : (modz_cmp k 4) => /#.
  have ->: (f32u8_t8u32 (load_array32 mem (to_uint ap{1}))) = f{1}.
    rewrite /f32u8_t8u32.
    apply Array8.ext_eq => x x_i.
    rewrite f_def 1:x_i //= Array8.initiE 1:x_i /load_array32 //=.

  rewrite -/di -/n -/kb -/sl.
  rewrite /load_array32 /= initiE /=; first by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  smt(@Logic).

  move => k k_lb k_ub.

  have idx_in_bound: forall j, 0 <= j < 32 => ! 128 <= to_uint idx{1}.[j].
    move => j j_i.
    rewrite (idx_def j j_i).
    rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    smt(@Int @Array16 @IntDiv).

  rewrite /f8u32_t32u8 //=.
  do (rewrite initiE /=; first by rewrite k_lb k_ub /=).
  rewrite initiE /=; first by move : i_lb i_tub k_lb k_ub => /#.
  rewrite (pmod_small _ 256).
    move : i_lb i_tub => /#.

  rewrite (_: (Array8.init (fun (i1: int) => ((Array8.init (fun (i2 : int) => f{1}.[4 * (i2 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i2 %% 4))) %% 4]))).[i1] `<<<` to_uint shift{1}.[i1])) =
              (Array8.init (fun (i1: int) => f{1}.[4 * (i1 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i1 %% 4))) %% 4] `<<<` to_uint shift{1}.[i1]))).
    apply Array8.ext_eq.
    move => x x_i.
    do rewrite initiE //=.

  rewrite (_: (Array32.init (fun (i0: int) => (Array8.init (fun (i1 : int) =>
                                              f{1}.[4 * (i1 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i1 %% 4))) %% 4] `<<<` to_uint shift{1}.[i1])).[i0 %/ 4] \bits8 i0 %% 4)) =
              (Array32.init (fun (i0 : int) => (f{1}.[4 * (i0 %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((i0 %/ 4) %% 4))) %% 4] `<<<` to_uint shift{1}.[i0 %/ 4]) \bits8 i0 %% 4))).
    apply Array32.ext_eq.
    move => x x_i.
    do rewrite initiE //=.
      move : x_i => /#.
  pose tmp := (Array32.init (fun (i0 : int) => f{1}.[4 * (i0 %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * (i0 %/ 4 %% 4))) %% 4] `<<<`
                                                to_uint shift{1}.[i0 %/ 4] \bits8 i0 %% 4)).
  rewrite (_: (Array32.init (fun (i : int) => if 128 <= to_uint idx{1}.[i] then W8.zero
                                               else tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16])) =
               (Array32.init (fun (i: int) => tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16]))).
    apply Array32.ext_eq.
    move => x x_i.
    rewrite initiE //=.
    rewrite (idx_in_bound x x_i) //=.
    rewrite (Array32.initiE _ x) //=.

  rewrite (_: (W2u8.Pack.init (fun (j: int) => (Array32.init (fun (i : int) =>
                                                tmp.[16 * (i %/ 16) + to_uint idx{1}.[i] %% 16])).[2 * k + j])) =
               W2u8.Pack.init (fun j => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]])).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do 2!(rewrite initiE 1:/# //=).
    rewrite W2u8.Pack.initiE 1://= //=.
    rewrite (pmod_small _ 16) //=.
      rewrite idx_def 1:/# /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @Array16 @IntDiv @Int).

    rewrite (_: W2u8.Pack.init (fun (j : int) => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]]) =
                W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                                 W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                                 \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite idx_def 1:/# /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    move : x_i k_lb k_ub => /#.

  rewrite (_: W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) +
                                                         85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) +
                                                         W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                               W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                               \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4) =
              W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((2 * k + j) %/ 16) +
                                                         85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4] `<<<`
                                               W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                               \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    rewrite initiE //=.
    rewrite initiE //=.
    have idx_bnds: forall w, 0 <= w < 32 => 0 <= to_uint idx{1}.[w] %/4 && to_uint idx{1}.[w] %/ 4 < 4.
      move => w w_i.
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @Array16 @IntDiv).
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %% 4 =
                to_uint idx{1}.[2 * k + x] %/ 4).
      move : (idx_bnds (2 * k + x)).
      smt(@Int @IntDiv).
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %/ 4 =
                (2 * k + x) %/ 16).
      move : (idx_bnds (2 * k + x)).
      smt(@Int @IntDiv).
    trivial.

  have f_idx: forall j, 0 <= j < 2 => 4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4 =
                                         4 * (k %/ 8) + i{2}.
    move => j j_i.
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite exprM //=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt(@Int @IntDiv).
    rewrite (pdiv_small _ 4) //=. by smt(@Int @IntDiv).
    rewrite (_: 4 * (k %/ 8) + 85 * i{2} %/ 4 ^ (k %% 4) %% 4 = 4 * (k %/ 8) + i{2} <=>
                85 * i{2} %/ 4 ^ (k %% 4) %% 4 = i{2}). by smt(@Int).
    rewrite (_: 85 * i{2} = (4 ^ 3) * i{2} + (4 ^ 2) * i{2} + (4 ^ 1) * i{2} + (4 ^ 0) * i{2}). smt(@Int @IntDiv @Ring.IntID).
    move : (modz_cmp k 4) => km_i.
    case (k %% 4 = 0) => k_0.
      rewrite k_0.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 1) => k_1.
      rewrite k_1.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 2) => k_2.
      rewrite k_2.
      smt(@Int @Ring.IntID @IntDiv).
    case (k %% 4 = 3) => k_3.
      rewrite k_3.
      smt(@Int @Ring.IntID @IntDiv).
    smt(@List @Logic).

  have shift_idx: forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 = 4 * (k %/ 8) + k %% 4.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt(@Int).
    rewrite (divzMDl (4 * (k %/ 8)) _ 4) 1://=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt(@Int @IntDiv).
    rewrite (pdiv_small _ 4) //=. by smt(@Int @IntDiv).

  have bit_idx : forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4 = 2 * (k %% 8 %/ 4) + j.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt(@Int).
    smt(@Int @IntDiv).

  rewrite (_: W2u8.Pack.init (fun (j : int) =>
                              f{1}.[4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4] `<<<`
                              to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4] \bits8
                              (16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %% 4) =
              W2u8.Pack.init (fun (j: int) =>
                              f{1}.[4 * (k %/ 8) + i{2}] `<<<`
                              to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits8 2 * (k %% 8 %/ 4) + j)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite f_idx 1:// shift_idx 1://= bit_idx 1://=.
    trivial.

  rewrite (_: (pack2_t (W2u8.Pack.init (fun (j: int) =>
                                f{1}.[4 * (k %/ 8) + i{2}] `<<<`
                                to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits8 2 * (k %% 8 %/ 4) + j)))
               = f{1}.[4 * (k %/ 8) + i{2}] `<<<` to_uint shift{1}.[4 *(k %/ 8) + k %% 4] \bits16 (k %% 8 %/ 4)).
    rewrite /pack2_t.
    rewrite W16.wordP.
    move => i i_i.
    rewrite initiE //= initiE 1:/# //=.
    rewrite bits8E bits16E.
    rewrite initiE //= initiE 1:/# //=.
    smt(@Int @IntDiv).

  pose idx := 4 * i{2} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4) + 1.
  pose linear_idx := 8 * idx + k %% 4 + 4.

  have ->: 4 * (k %/ 8) + i{2} = linear_idx %/ 32. by smt(@Int @IntDiv).
  rewrite shift_def /=; first by move : k_lb k_ub => /#.
  rewrite (mulzC 4 _) modzMDl modz_mod.
  rewrite of_uintK pmod_small 1:/#.
  rewrite hqs_def; first by rewrite k_lb k_ub /=.

  have ->: 3 - k %% 4 = 3 - linear_idx %% 4. by smt(@Int @IntDiv).
  have ->: k %% 8 %/ 4 = (linear_idx %% 32 + (3 - linear_idx %% 4)) %/ 16. by smt(@Int @IntDiv).
  (* have sl_0: 0 = 15 - ((linear_idx %% 32 + (3 - linear_idx %% 4)) %% 16). by smt(@Int @IntDiv). *)

  pose di := linear_idx %/ 32.
  pose n := 3 - linear_idx %% 4.
  pose kb := (linear_idx %% 32 + n) %/ 16.
  pose sl := W8.of_int (15 - (linear_idx %% 32 + n) %% 16).
  have sl_0: sl = W8.zero. by smt(@Int @IntDiv).

  rewrite -W32.shl_shlw 1:/#.
  move : (bit_decode (load_array32 mem (to_uint ap{1})) idx (k %% 4 + 4)).
  have -> /=: (0 <= idx && idx < 32). by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  have -> /=: (0 <= k %% 4 + 4 && k %% 4 + 4 < 8). by move : (modz_cmp k 4) => /#.
  have ->: (f32u8_t8u32 (load_array32 mem (to_uint ap{1}))) = f{1}.
    rewrite /f32u8_t8u32.
    apply Array8.ext_eq => x x_i.
    rewrite f_def 1:x_i //= Array8.initiE 1:x_i /load_array32 //=.

  rewrite (addzA _ (k %% 4) 4).

  rewrite -/linear_idx -/di -/n -/kb -/sl.
  rewrite /load_array32 /= initiE /=; first by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  rewrite sl_0 (W16.shl_shlw 0 _) 1://=.
  rewrite (_: (f{1}.[di] `<<` (of_int n)%W8 \bits16 kb) `<<<` 0 =
              (f{1}.[di] `<<` (of_int n)%W8 \bits16 kb)).
    rewrite /W16.(`<<<`).
    apply W16.wordP => x x_i.
    rewrite initiE 1:x_i //=.
  smt(@Logic).

(****************************************************************************************)

  inline *. wp.
  unroll for {2} 4.
  unroll for {2} 2.
  auto => />.
  move => &1 &2 [#] ap_lb ap_ub hqs_def idx_def shift_def f_def i_lb i_ub rpl_def rph_def rpl_bnd rph_bnd i_tub g0_def g1_def g2_def g3_def />.

  rewrite (_:
              (fill
                 (fun (k0 : int) =>
                    b2i (load_array32 mem (to_uint ap{1})).[k0 %/ 8].[k0 %% 8])
                 (152 + 32 * i{2}) 8
                 (fill
                    (fun (k0 : int) =>
                       b2i (load_array32 mem (to_uint ap{1})).[k0 %/ 8].[k0 %% 8])
                    (144 + 32 * i{2}) 8
                    (fill
                       (fun (k0 : int) =>
                          b2i (load_array32 mem (to_uint ap{1})).[k0 %/ 8].[k0 %% 8])
                       (136 + 32 * i{2}) 8
                       (fill
                          (fun (k0 : int) =>
                             b2i (load_array32 mem (to_uint ap{1})).[k0 %/ 8].[k0 %% 8])
                          (128 + 32 * i{2}) 8
                          (fill
                             (fun (k0 : int) =>
                                b2i
                                  (load_array32 mem (to_uint ap{1})).[k0 %/ 8].[
                                  k0 %% 8]) (32 * i{2} + 24) 8
                             (fill
                                (fun (k0 : int) =>
                                   b2i
                                     (load_array32 mem (to_uint ap{1})).[k0 %/ 8].[
                                     k0 %% 8]) (32 * i{2} + 16) 8
                                (fill
                                   (fun (k0 : int) =>
                                      b2i
                                        (load_array32 mem (to_uint ap{1})).[k0 %/ 8].[
                                        k0 %% 8]) (32 * i{2} + 8) 8
                                   (fill
                                      (fun (k0 : int) =>
                                         b2i
                                           (load_array32 mem (to_uint ap{1})).[k0 %/ 8].[
                                           k0 %% 8]) (32 * i{2}) 8 r{2})))))))) =

              (fill
                 (fun (k0 : int) =>
                    b2i (load_array32 mem (to_uint ap{1})).[k0 %/ 8].[k0 %% 8])
                 (128 + 32 * i{2}) 32
                 (fill
                    (fun (k0 : int) =>
                       b2i (load_array32 mem (to_uint ap{1})).[k0 %/ 8].[k0 %% 8])
                    (32 * i{2}) 32 r{2}))).
    apply Array256.ext_eq.
    move => x x_i.
    do (rewrite filliE 1:x_i //=).
    smt(@Logic @Array256 @Int).

  do split; first 2 by smt().

  move => k k_lb k_ub.
  do rewrite filliE 1:/# //=.
  do (rewrite (fun_if W16.to_sint)).

  have ->: !(144 + 32 * i{2} <= k && k < 160 + 32 * i{2}). by move : k_lb k_ub => /#.
  have ->: !(128 + 32 * i{2} <= k && k < 144 + 32 * i{2}). by move : k_lb k_ub => /#.
  have ->: !(128 + 32 * i{2} <= k && k < 160 + 32 * i{2}). by move : k_lb k_ub => /#.

  simplify.
  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if Array16."_.[_]") || rewrite if_arg).
  do (rewrite (fun_if W16.to_sint)).
  rewrite /g0_def /g1_def /g2_def /g3_def.
  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if W16.to_sint)).

  have ->: !(W8.int_bit 32 (4 * (k %% 16 %/ 8) + 3)).
    move : (true_32 (4 * (k %% 16 %/ 8) + 3)).
    rewrite of_intwE.
    have -> /=: 0 <= 4 * (k %% 16 %/ 8) + 3 && 4 * (k %% 16 %/ 8) + 3 < 8.
      move : (modz_cmp k 16) => /#.
    smt(@Int @IntDiv).

  have ->: !(W8.int_bit 32 (4 * (k %% 16 %/ 8))).
    move : (true_32 (4 * (k %% 16 %/ 8))).
    rewrite of_intwE.
    have -> /=: 0 <= 4 * (k %% 16 %/ 8) && 4 * (k %% 16 %/ 8) < 8.
      move : (modz_cmp k 16) => /#.
    smt(@Int @IntDiv).

  simplify.

  rewrite g0_def.
    rewrite modz_dvd 1://=.
    rewrite modz_dvd 1://=.
    smt(@IntDiv @Int).

  rewrite g1_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt(@IntDiv @Int).
    rewrite modz_dvd 1://=.
    smt(@IntDiv @Int).

  rewrite g2_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt(@IntDiv @Int).
    rewrite modz_dvd 1://=.
    smt(@IntDiv @Int).

  rewrite g3_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt(@IntDiv @Int).
    rewrite modz_dvd 1://=.
    smt(@IntDiv @Int).

  rewrite g0_def.
    move : (modz_cmp k 4) => /#.
  rewrite g1_def.
    move : (modz_cmp k 4) => /#.
  rewrite g2_def.
    move : (modz_cmp k 4) => /#.
  rewrite g3_def.
    move : (modz_cmp k 4) => /#.

  do (rewrite modz_dvd 1://=).
  rewrite (pdiv_small (k %% 8) 8). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %% 8 %/ 4) = 1). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %/ 8) = 0). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %% 4) = k %% 4). by smt(@IntDiv @Int).
  rewrite (_: k %% 8 %/ 4 %% 2 = k %/ 4 %% 2). by smt(@IntDiv @Int @Ring.IntID).
  rewrite (_: k %% 4 %% 8 %/ 4 = 0). by smt(@IntDiv @Int).
  rewrite (pdiv_small (k %% 4) 8). by smt(@IntDiv @Int).
  simplify.
  rewrite modz_mod.

  rewrite (_: (0 <= 4 * (k %% 16 %/ 8) + 1 && 4 * (k %% 16 %/ 8) + 1 < 8) = true) //=.
    by smt(@IntDiv @Int).

  rewrite /s_encode /load_array32.
  do (rewrite initiE /=; first by move : i_lb i_tub => /#).
  do (rewrite (fun_if inFq) || rewrite asintK).
  do (rewrite b_encode_sem /b2i).

  case (32 * i{2} + 16 <= k && k < 32 * i{2} + 32)  => k_ssi.
    case (32 * i{2} + 24 <= k && k < 32 * i{2} + 32) => k_sssi.
      have -> /=: W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
        move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      rewrite (_: (4 * i{2} + 3) = k %/ 8). move : k_ssi => /#.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).

      have -> /=: !W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
          move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      rewrite (_: (4 * i{2} + 2) = k %/ 8). move : k_ssi => /#.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).

  move : k_ssi => k_nssi.
  case (32 * i{2} <= k && k < 32 * i{2} + 16)  => k_ssi.
    case (32 * i{2} + 8 <= k && k < 32 * i{2} + 16) => k_sssi.
      have -> /=: W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
        move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      rewrite (_: (4 * i{2} + 1) = k %/ 8). move : k_ssi => /#.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).

      have -> /=: !W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
          move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      rewrite (_: (4 * i{2}) = k %/ 8). move : k_ssi => /#.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).

  have -> /=: !(32 * i{2} <= k && k < 32 * i{2} + 32).
    move : k_nssi k_ssi => /#.
  apply rpl_def.
  move : k_nssi k_ssi k_lb k_ub => /#.

  move => k k_lb k_ub.
  do rewrite filliE 1:/# //=.
  do (rewrite (fun_if W16.to_sint)).

  have ->: !(32 * i{2} + 16 <= k && k < 32 * i{2} + 32). by move : k_lb k_ub => /#.
  have ->: !(32 * i{2} <= k && k < 32 * i{2} + 16). by move : k_lb k_ub => /#.
  have -> /=: !(32 * i{2} <= k && k < 32 * i{2} + 32). by move : k_lb k_ub => /#.

  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if Array16."_.[_]") || rewrite if_arg).
  do (rewrite (fun_if W16.to_sint)).
  rewrite /g0_def /g1_def /g2_def /g3_def.
  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if W16.to_sint)).

  have -> /=: !(W8.int_bit 49 (4 * (k %% 16 %/ 8) + 3)).
    move : (true_49 (4 * (k %% 16 %/ 8) + 3)).
    rewrite of_intwE.
    have -> /=: 0 <= 4 * (k %% 16 %/ 8) + 3 && 4 * (k %% 16 %/ 8) + 3 < 8.
      move : (modz_cmp k 16) => /#.
    smt(@Int @IntDiv).

  do (rewrite modz_dvd 1://=).
  rewrite (_: (8 + k %% 8) %/ 8 = 1). by smt(@IntDiv @Int).
  rewrite (_: (8 + k %% 8) %/ 4 %% 2 = k %/ 4 %% 2). by smt(@IntDiv @Int).
  rewrite (_: k %% 8 %/ 4 %% 2 = k %/ 4 %% 2). by smt(@IntDiv @Int @Ring.IntID).
  rewrite (_: (8 + k %% 8) %% 4 = k %% 4). by smt(@IntDiv @Int).
  rewrite (pdiv_small (k %% 8) 8). by smt(@IntDiv @Int).
  have ->: 0 <= 4 * (k %% 16 %/ 8) && 4 * (k %% 16 %/ 8) < 8. by smt(@IntDiv @Int).
  have -> /=: 0 <= 4 * (k %% 16 %/ 8) + 1 && 4 * (k %% 16 %/ 8) + 1 < 8. by smt(@IntDiv @Int).

  do (rewrite g0_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g1_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g2_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g3_def; first by move : (modz_cmp k 4) => /#).

  rewrite (_: (12 + k %% 4) %/ 8 = 1). by smt(@IntDiv @Int).
  rewrite (_: (12 + k %% 4) %% 8 %/ 4 = 1). by smt(@IntDiv @Int).
  rewrite (_: (12 + k %% 4) %% 4 = k %% 4). by smt(@IntDiv @Int).
  rewrite (_: (8 + k %% 4) %/ 8 = 1). by smt(@IntDiv @Int).
  rewrite (_: (8 + k %% 4) %% 8 %/ 4 = 0). by smt(@IntDiv @Int).
  rewrite (_: (8 + k %% 4) %% 4 = k %% 4). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %% 8 %/ 4) = 1). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %/ 8) = 0). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %% 4) = k %% 4). by smt(@IntDiv @Int).
  rewrite (pdiv_small (k %% 4) 8). by smt(@IntDiv @Int).
  rewrite (pdiv_small (k %% 4 %% 8) 4). by smt(@IntDiv @Int).
  rewrite modz_mod /=.

  rewrite /s_encode /load_array32.
  do (rewrite initiE /=; first by move : i_lb i_tub => /#).
  do (rewrite (fun_if inFq) || rewrite asintK).
  do (rewrite b_encode_sem /b2i).

  case (144 + 32 * i{2} <= k && k < 160 + 32 * i{2}) => k_si.
    case (152 + 32 * i{2} <= k && k < 160 + 32 * i{2}) => k_ssi.
      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt(@W8 @Int @IntDiv).
      have -> /=: W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      rewrite (_: (4 * i{2} + 19) = k %/ 8). move : k_ssi => /#.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).

      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt(@W8 @Int @IntDiv).
      have -> /=: !W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      rewrite (_: (4 * i{2} + 18) = k %/ 8). move : k_ssi => /#.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).

  move : k_si => k_nsi.
  case (128 + 32 * i{2} <= k && k < 144 + 32 * i{2})  => k_si.
    case (136 + 32 * i{2} <= k && k < 144 + 32 * i{2})  => k_ssi.
      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt(@W8 @Int @IntDiv).
      have -> /=: W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      rewrite (_: (4 * i{2} + 17) = k %/ 8). move : k_ssi => /#.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).

      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt(@W8 @Int @IntDiv).
      have -> /=: !W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      rewrite (_: (4 * i{2} + 16) = k %/ 8). move : k_ssi => /#.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).

  have -> /=: !(128 + 32 * i{2} <= k && k < 160 + 32 * i{2}).
    move : k_nsi k_si => /#.
  apply rph_def; first by move : k_nsi k_si k_lb k_ub => /#.


(***************************************************************************************)

  move => k k_lb k_ub.
  do rewrite filliE 1:/# //=.
  do (rewrite (fun_if W16.to_sint)).

  have ->: !(144 + 32 * i{2} <= k && k < 160 + 32 * i{2}). by move : k_lb k_ub => /#.
  have ->: !(128 + 32 * i{2} <= k && k < 144 + 32 * i{2}). by move : k_lb k_ub => /#.

  simplify.
  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if Array16."_.[_]") || rewrite if_arg).
  do (rewrite (fun_if W16.to_sint)).
  rewrite /g0_def /g1_def /g2_def /g3_def.
  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if W16.to_sint)).

  have ->: !(W8.int_bit 32 (4 * (k %% 16 %/ 8) + 3)).
    move : (true_32 (4 * (k %% 16 %/ 8) + 3)).
    rewrite of_intwE.
    have -> /=: 0 <= 4 * (k %% 16 %/ 8) + 3 && 4 * (k %% 16 %/ 8) + 3 < 8.
      move : (modz_cmp k 16) => /#.
    smt(@Int @IntDiv).

  have ->/=: !(W8.int_bit 32 (4 * (k %% 16 %/ 8))).
    move : (true_32 (4 * (k %% 16 %/ 8))).
    rewrite of_intwE.
    have -> /=: 0 <= 4 * (k %% 16 %/ 8) && 4 * (k %% 16 %/ 8) < 8.
      move : (modz_cmp k 16) => /#.
    smt(@Int @IntDiv).

  rewrite g0_def.
    do (rewrite modz_dvd 1://=).
    move : k_lb k_ub i_lb i_tub => /#.

  rewrite g1_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt(@IntDiv @Int).
    rewrite modz_dvd 1://=.
    smt(@IntDiv @Int).

  rewrite g2_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt(@IntDiv @Int).
    rewrite modz_dvd 1://=.
    smt(@IntDiv @Int).

  rewrite g3_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt(@IntDiv @Int).
    rewrite modz_dvd 1://=.
    smt(@IntDiv @Int).

  rewrite g0_def.
    move : (modz_cmp k 4) => /#.
  rewrite g1_def.
    move : (modz_cmp k 4) => /#.
  rewrite g2_def.
    move : (modz_cmp k 4) => /#.
  rewrite g3_def.
    move : (modz_cmp k 4) => /#.

  do (rewrite modz_dvd 1://=).
  rewrite (pdiv_small (k %% 8) 8). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %% 8 %/ 4) = 1). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %/ 8) = 0). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %% 4) = k %% 4). by smt(@IntDiv @Int).
  rewrite (_: k %% 8 %/ 4 %% 2 = k %/ 4 %% 2). by smt(@IntDiv @Int @Ring.IntID).
  rewrite (_: k %% 4 %% 8 %/ 4 = 0). by smt(@IntDiv @Int).
  rewrite (pdiv_small (k %% 4) 8). by smt(@IntDiv @Int).
  simplify.
  rewrite modz_mod.

  rewrite (_: (0 <= 4 * (k %% 16 %/ 8) + 1 && 4 * (k %% 16 %/ 8) + 1 < 8) = true) //=.
    by smt(@IntDiv @Int).

  rewrite /s_encode /load_array32.
  do (rewrite initiE /=; first by move : i_lb i_tub => /#).
  rewrite /b_encode /trueval /falseval.
  do (rewrite (fun_if asint) || rewrite (fun_if inFq) || rewrite inFqK).
  do (rewrite (pmod_small _ q) 1:/#).

  (* move : (rpl_bnd k); smt(@Int @IntDiv @W16 @Array256 @Logic @List). *)

  (* Maybe not necessary *)
  case (32 * i{2} + 16 <= k && k < 32 * i{2} + 32)  => k_ssi.
    smt(@Int @IntDiv @W16 @Array256 @Logic @List).

  move : k_ssi => k_nssi.
  case (32 * i{2} <= k && k < 32 * i{2} + 16)  => k_ssi.
    smt(@Int @IntDiv @W16 @Array256 @Logic @List).

  move : (rpl_bnd k) => /#.

  move => k k_lb k_ub.
  do rewrite filliE 1:/# //=.
  do (rewrite (fun_if W16.to_sint)).

  have ->: !(32 * i{2} + 16 <= k && k < 32 * i{2} + 32). by move : k_lb k_ub => /#.
  have ->: !(32 * i{2} <= k && k < 32 * i{2} + 16). by move : k_lb k_ub => /#.

  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if Array16."_.[_]") || rewrite if_arg).
  do (rewrite (fun_if W16.to_sint)).
  rewrite /g0_def /g1_def /g2_def /g3_def.
  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if W16.to_sint)).

  have -> /=: !(W8.int_bit 49 (4 * (k %% 16 %/ 8) + 3)).
    move : (true_49 (4 * (k %% 16 %/ 8) + 3)).
    rewrite of_intwE.
    have -> /=: 0 <= 4 * (k %% 16 %/ 8) + 3 && 4 * (k %% 16 %/ 8) + 3 < 8.
      move : (modz_cmp k 16) => /#.
    smt(@Int @IntDiv).

  do (rewrite modz_dvd 1://=).
  rewrite (_: (8 + k %% 8) %/ 8 = 1). by smt(@IntDiv @Int).
  rewrite (_: (8 + k %% 8) %/ 4 %% 2 = k %/ 4 %% 2). by smt(@IntDiv @Int).
  rewrite (_: k %% 8 %/ 4 %% 2 = k %/ 4 %% 2). by smt(@IntDiv @Int @Ring.IntID).
  rewrite (_: (8 + k %% 8) %% 4 = k %% 4). by smt(@IntDiv @Int).
  rewrite (pdiv_small (k %% 8) 8). by smt(@IntDiv @Int).
  have ->: 0 <= 4 * (k %% 16 %/ 8) && 4 * (k %% 16 %/ 8) < 8. by smt(@IntDiv @Int).
  have -> /=: 0 <= 4 * (k %% 16 %/ 8) + 1 && 4 * (k %% 16 %/ 8) + 1 < 8. by smt(@IntDiv @Int).

  do (rewrite g0_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g1_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g2_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g3_def; first by move : (modz_cmp k 4) => /#).

  rewrite (_: (12 + k %% 4) %/ 8 = 1). by smt(@IntDiv @Int).
  rewrite (_: (12 + k %% 4) %% 8 %/ 4 = 1). by smt(@IntDiv @Int).
  rewrite (_: (12 + k %% 4) %% 4 = k %% 4). by smt(@IntDiv @Int).
  rewrite (_: (8 + k %% 4) %/ 8 = 1). by smt(@IntDiv @Int).
  rewrite (_: (8 + k %% 4) %% 8 %/ 4 = 0). by smt(@IntDiv @Int).
  rewrite (_: (8 + k %% 4) %% 4 = k %% 4). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %% 8 %/ 4) = 1). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %/ 8) = 0). by smt(@IntDiv @Int).
  rewrite (_: ((4 + k %% 4) %% 4) = k %% 4). by smt(@IntDiv @Int).
  rewrite (pdiv_small (k %% 4) 8). by smt(@IntDiv @Int).
  rewrite (pdiv_small (k %% 4 %% 8) 4). by smt(@IntDiv @Int).
  rewrite modz_mod /=.

  rewrite /s_encode /load_array32.
  do (rewrite initiE /=; first by move : i_lb i_tub => /#).
  rewrite /b_encode /trueval /falseval.
  do (rewrite (fun_if asint) || rewrite (fun_if inFq) || rewrite inFqK).
  do (rewrite (pmod_small _ q) 1:/#).

  case (144 + 32 * i{2} <= k && k < 160 + 32 * i{2}) => k_si.
    smt(@Int @IntDiv @W16 @Array256 @Logic @List).

  move : k_si => k_nsi.
  case (128 + 32 * i{2} <= k && k < 144 + 32 * i{2})  => k_si.
    smt(@Int @IntDiv @W16 @Array256 @Logic @List).

  move : (rph_bnd k) => /#.

(***************************************************************************************)

  sp. skip. simplify.
  auto => />.
  move => &1 &2 [#] ap_lb ap_ub hqs_def idx_def shift_def f_def.
  do split; first 4 by smt().
  move => rp i r.
  move => i_tlb _ i_lb i_ub.
  have -> /=: i = 4. by move : i_ub i_tlb => /#.
  move => rpl_def rph_def rpl_bnd rph_bnd.

  have rp_def: forall (k : int), 0 <= k && k < 256 => inFq (to_sint rp.[k]) = decompress 1 r.[k].
    move => k k_i.
    move : (rpl_def k) (rph_def k) => /#.

  split.

  apply Array256.ext_eq => x x_i.
  do (rewrite Array256.mapiE 1:x_i //=).
  apply (rp_def x x_i).

  rewrite /pos_bound256_cxq /bpos16 => x x_i.
 
  move : (rpl_bnd x) (rph_bnd x) => /#.
*)qed.

lemma poly_frommsg_ll : islossless  Mprevec.poly_frommsg.
proof. admit. (*
  proc; while (0 <= i <= 4) (4-i).
  move => *.
  inline *; wp; auto => /> /#.
  inline *; auto => /> /#.
*)qed.


op cmplx_mul_fq (a : Fq Array32.t, b : Fq Array32.t, zetas : Fq Array16.t) =
     let a0 = Array16.init (fun i => a.[i]) in
     let a1 = Array16.init (fun i => a.[16 + i]) in
     let b0 = Array16.init (fun i => b.[i]) in
     let b1 = Array16.init (fun i => b.[16 + i]) in
     (Array16.init (fun i => (a1.[i] * b1.[i] * zetas.[i]) + a0.[i] * b0.[i]),
      Array16.init (fun i => a0.[i] * b1.[i] + a1.[i] * b0.[i])).

op mul32x(a : Fq Array64.t, b : Fq Array64.t, zetas : Fq Array16.t) =
     let a_0 = Array32.init (fun i => a.[i]) in
     let b_0 = Array32.init (fun i => b.[i]) in
     let a_1 = Array32.init (fun i => a.[32 + i]) in
     let b_1 = Array32.init (fun i => b.[32 + i]) in
     let nzetas = Array16.init (fun i => -zetas.[i]) in
     (cmplx_mul_fq a_0 b_1 zetas, cmplx_mul_fq a_1 b_1 (nzetas)).

op isbasemul_avx(ap bp : Fq Array256.t, zetas : Fq Array128.t, 
            rs : Fq Array256.t, i : int) : bool =
    forall k, 0 <= k < i %/ 64 =>
      let a = Array64.init (fun i => ap.[64*k+i]) in
      let b = Array64.init (fun i => bp.[64*k+i]) in
      let lzetas = Array16.init(fun i => zetas.[16*i]) in (* FIXME *)
      let rs0  = Array16.init (fun i => rs.[64*k+i]) in
      let rs1  = Array16.init (fun i => rs.[64*k+16+i]) in
      let rs2  = Array16.init (fun i => rs.[64*k+32+i]) in
      let rs3  = Array16.init (fun i => rs.[64*k+48+i]) in
      ((rs0,rs1),(rs2,rs3)) =
      mul32x a b lzetas. (* FIXME: zeta index *)

op cmplx_mul_avx (ap : W16.t Array32.t, bp : W16.t Array32.t, zetas : W16.t Array16.t, sign: int) =
     let a = Array16.init (fun i => W16.to_sint ap.[i]) in
     let b = Array16.init (fun i => W16.to_sint ap.[16 + i]) in
     let c = Array16.init (fun i => W16.to_sint bp.[i]) in
     let d = Array16.init (fun i => W16.to_sint bp.[16 + i]) in
     let izetas = Array16.map W16.to_sint zetas in
     (Array16.init (fun i => if (sign = 0) then a.[i] * c.[i] + (SREDC (b.[i] * d.[i]) * izetas.[i])
                             else a.[i] * c.[i] - (SREDC (b.[i] * d.[i]) * izetas.[i])),
      Array16.init (fun i => a.[i] * d.[i] + b.[i] * c.[i])).

(* Multiplication can overflow 16 bit so need to expand to 32 bit *)
op schoolbook_mul (a : W16.t Array32.t, b : W16.t Array32.t, zetas : W16.t Array16.t, sign: int) =
    let (r0, r1) = cmplx_mul_avx a b zetas sign in
    let x0 = Array16.init(fun i => W32.of_int r0.[8 * (i %/ 8) + (i %% 8 %/ 2)] \bits16 (i %% 2)) in
    let x1 = Array16.init(fun i => W32.of_int r0.[4 + 8 * (i %/ 8) + (i %% 8 %/ 2)] \bits16 (i %% 2)) in
    let y0 = Array16.init(fun i => W32.of_int r1.[8 * (i %/ 8) + (i %% 8 %/ 2)] \bits16 (i %% 2)) in
    let y1 = Array16.init(fun i => W32.of_int r1.[4 + 8 * (i %/ 8) + (i %% 8 %/ 2)] \bits16 (i %% 2)) in
    (x0, x1, y0, y1).

op lift_array32 (p: W16.t Array32.t) =
  Array32.map (fun x => inFq (W16.to_sint x)) p.

op lift_array16 (p: W16.t Array16.t) =
  Array16.map (fun x => inFq (W16.to_sint x)) p.

op signed_bound32_cxq (coefs : W16.t Array32.t) (l u c : int) :
  bool =
  forall (k : int),
    l <= k && k < u => b16 (coefs.[k]) (c * q).

op signed_bound16_cxq (coefs : W16.t Array16.t) (l u c : int) :
  bool =
  forall (k : int),
    l <= k && k < u => b16 (coefs.[k]) (c * q).

lemma schoolbook_corr a b zetas isign:
  hoare[Mprevec.schoolbook :
        a = ap /\
        b = bp /\
        signed_bound32_cxq ap 0 32 2 /\
        signed_bound32_cxq bp 0 32 2 /\
        zetas = zeta_0 /\
        isign = sign /\
        (forall k, 0 <= k < 16 => qx16.[k] = KyberCPA_avx2.jqx16.[k]) /\
        (forall k, 0 <= k < 16 => qinvx16.[k] = KyberCPA_avx2.jqx16.[k]) ==>
        res = (schoolbook_mul a b zetas isign)].
proof. admit.
(* FIXME
  proc.
    inline (3 4) Ops.iVPADD_8u32; wp.
    seq 33 : (#pre /\
              (forall k, 0 <= k < 8 => ac0_dw.[k] = W32.of_int ((to_sint a.[8 * (k %/ 4) + (k %% 4)]) * (to_sint b.[8 * (k %/ 4) + (k %% 4)]))) /\
              (forall k, 0 <= k < 8 => ac1_dw.[k] = W32.of_int ((to_sint a.[4 + 8 * (k %/ 4) + (k %% 4)]) * (to_sint b.[4 + 8 * (k %/ 4) + (k %% 4)]))) /\
              (forall k, 0 <= k < 8 => rbd0_dw.[k] = W32.of_int ((to_sint a.[16 + 8 * (k %/ 4) + (k %% 4)]) * (to_sint b.[16 + 8 * (k %/ 4) + (k %% 4)]) * (to_sint zetas.[8 * (k %/ 4) + (k %% 4)]))) /\
              (forall k, 0 <= k < 8 => rbd1_dw.[k] = W32.of_int ((to_sint a.[20 + 8 * (k %/ 4) + (k %% 4)]) * (to_sint b.[20 + 8 * (k %/ 4) + (k %% 4)]) * (to_sint zetas.[4 + 8 * (k %/ 4) + (k %% 4)]))) /\
              (forall k, 0 <= k < 8 => bc0_dw.[k] = W32.of_int ((to_sint a.[16 + 8 * (k %/ 4) + (k %% 4)]) * (to_sint b.[8 * (k %/ 4) + (k %% 4)]))) /\
              (forall k, 0 <= k < 8 => bc1_dw.[k] = W32.of_int ((to_sint a.[20 + 8 * (k %/ 4) + (k %% 4)]) * (to_sint b.[4 + 8 * (k %/ 4) + (k %% 4)]))) /\
              (forall k, 0 <= k < 8 => ad0_dw.[k] = W32.of_int ((to_sint a.[8 * (k %/ 4) + (k %% 4)]) * (to_sint b.[16 + 8 * (k %/ 4) + (k %% 4)]))) /\
              (forall k, 0 <= k < 8 => ad1_dw.[k] = W32.of_int ((to_sint a.[4 + 8 * (k %/ 4) + (k %% 4)]) * (to_sint b.[20 + 8 * (k %/ 4) + (k %% 4)])))).
    inline *; wp; auto => />.
    move => &hr [#] sbnd_ap sbnd_bp qx16_def qinvx16_def />.
    (*************************************************************************************)
    do split.
      + move => k k_lb k_ub.
        rewrite /f16u16_t8u32.
        do (rewrite initiE 1:/# || rewrite mapiE 1:/# //=).
        apply W2u16.allP => />.
        split.
        + rewrite of_int_bits16_div 1://= expr0 divz1.
          do rewrite get_setE 1://=.
          rewrite /wmulls.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
        + rewrite of_int_bits16_div 1://=.
          do rewrite get_setE 1://=.
          rewrite /wmulhs.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
      + move => k k_lb k_ub.
        rewrite /f16u16_t8u32.
        do (rewrite initiE 1:/# || rewrite mapiE 1:/# //=).
        apply W2u16.allP => />.
        split.
        + rewrite of_int_bits16_div 1://= expr0 divz1.
          do rewrite get_setE 1://=.
          rewrite /wmulls.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
        + rewrite of_int_bits16_div 1://=.
          do rewrite get_setE 1://=.
          rewrite /wmulhs.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
      + move => k k_lb k_ub.
        rewrite /f16u16_t8u32.
        do (rewrite initiE 1:/# || rewrite mapiE 1:/# //=).
        apply W2u16.allP => />.
        split.
        + rewrite of_int_bits16_div 1://= expr0 divz1.
          do rewrite get_setE 1://=.
          rewrite /wmulls.
          do (rewrite qx16_def 1://= qinvx16_def 1://=).
          (* FIXME *)
          admit.
        + rewrite of_int_bits16_div 1://=.
          do rewrite get_setE 1://=.
          rewrite /wmulhs.
          admit.
          (* FIXME:
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
          *)
      + move => k k_lb k_ub.
        rewrite /f16u16_t8u32.
        do (rewrite initiE 1:/# || rewrite mapiE 1:/# //=).
        apply W2u16.allP => />.
        split.
        + rewrite of_int_bits16_div 1://= expr0 divz1.
          do rewrite get_setE 1://=.
          rewrite /wmulls.
          admit.
          (* FIXME:
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
          *)
        + rewrite of_int_bits16_div 1://=.
          do rewrite get_setE 1://=.
          rewrite /wmulhs.
          admit.
          (* FIXME:
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
          *)
      + move => k k_lb k_ub.
        rewrite /f16u16_t8u32.
        do (rewrite initiE 1:/# || rewrite mapiE 1:/# //=).
        apply W2u16.allP => />.
        split.
        + rewrite of_int_bits16_div 1://= expr0 divz1.
          do rewrite get_setE 1://=.
          rewrite /wmulls.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
        + rewrite of_int_bits16_div 1://=.
          do rewrite get_setE 1://=.
          rewrite /wmulhs.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
      + move => k k_lb k_ub.
        rewrite /f16u16_t8u32.
        do (rewrite initiE 1:/# || rewrite mapiE 1:/# //=).
        apply W2u16.allP => />.
        split.
        + rewrite of_int_bits16_div 1://= expr0 divz1.
          do rewrite get_setE 1://=.
          rewrite /wmulls.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
        + rewrite of_int_bits16_div 1://=.
          do rewrite get_setE 1://=.
          rewrite /wmulhs.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
      + move => k k_lb k_ub.
        rewrite /f16u16_t8u32.
        do (rewrite initiE 1:/# || rewrite mapiE 1:/# //=).
        apply W2u16.allP => />.
        split.
        + rewrite of_int_bits16_div 1://= expr0 divz1.
          do rewrite get_setE 1://=.
          rewrite /wmulls.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
        + rewrite of_int_bits16_div 1://=.
          do rewrite get_setE 1://=.
          rewrite /wmulhs.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
      + move => k k_lb k_ub.
        rewrite /f16u16_t8u32.
        do (rewrite initiE 1:/# || rewrite mapiE 1:/# //=).
        apply W2u16.allP => />.
        split.
        + rewrite of_int_bits16_div 1://= expr0 divz1.
          do rewrite get_setE 1://=.
          rewrite /wmulls.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
        + rewrite of_int_bits16_div 1://=.
          do rewrite get_setE 1://=.
          rewrite /wmulhs.
          rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (k %/ 4 * 4) 2) divzE.
          rewrite (mulzDr 2) //=.
          smt(@Array8 @W16 @Int @IntDiv).
    (*************************************************************************************)
    if{1}.
      + inline *; auto => />.
        move => &hr [#] sbnd_ap sbnd_bp qx16_def qinvx16_def ac0_def ac1_def rbd0_def rbd1_def bc0_def bc1_def ad0_def ad1_def />.
        rewrite /schoolbook_mul /cmplx_mul_avx => />.
        do split.
          + rewrite /f8u32_t16u16.
            apply Array16.ext_eq.
            move => x x_i.
            do (rewrite initiE 1:/# //=).
            rewrite ac0_def 1:/# rbd0_def 1:/# //= mapiE 1:/# //=.
            do 2!congr.
            rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (x %/ 2 %/ 4 * 4) 2) divzE.
            rewrite (mulzDr 2) //=.
            smt(@Int @IntDiv @Array16 @W16 @Array256).
          + rewrite /f8u32_t16u16.
            apply Array16.ext_eq.
            move => x x_i.
            do (rewrite initiE 1:/# //=).
            rewrite ac1_def 1:/# rbd1_def 1:/# //= mapiE 1:/# //=.
            do 2!congr.
            rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (x %/ 2 %/ 4 * 4) 2) divzE.
            rewrite (mulzDr 2) //=.
            smt(@Int @IntDiv @Array16 @W16 @Array256).
          + rewrite /f8u32_t16u16.
            apply Array16.ext_eq.
            move => x x_i.
            do (rewrite initiE 1:/# //=).
            rewrite ad0_def 1:/# bc0_def 1:/# //=.
            do 2!congr.
            rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (x %/ 2 %/ 4 * 4) 2) divzE.
            rewrite (mulzDr 2) //=.
            smt(@Int @IntDiv @Array16 @W16 @Array256).
          + rewrite /f8u32_t16u16.
            apply Array16.ext_eq.
            move => x x_i.
            do (rewrite initiE 1:/# //=).
            rewrite ad1_def 1:/# bc1_def 1:/# //=.
            do 2!congr.
            rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (x %/ 2 %/ 4 * 4) 2) divzE.
            rewrite (mulzDr 2) //=.
            smt(@Int @IntDiv @Array16 @W16 @Array256).
      + inline *; auto => />.
        move => &hr [#] sbnd_ap sbnd_bp qx16_def qinvx16_def ac0_def ac1_def rbd0_def rbd1_def bc0_def bc1_def ad0_def ad1_def isign_n0 />.
        rewrite /schoolbook_mul /cmplx_mul_avx isign_n0 => />.
        do split.
          + rewrite /f8u32_t16u16.
            apply Array16.ext_eq.
            move => x x_i.
            do (rewrite initiE 1:/# //=).
            rewrite ac0_def 1:/# rbd0_def 1:/# //= mapiE 1:/# //=.
            do 2!congr.
            rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (x %/ 2 %/ 4 * 4) 2) divzE.
            rewrite (mulzDr 2) //=.
            smt(@Int @IntDiv @Array16 @W16 @Array256).
          + rewrite /f8u32_t16u16.
            apply Array16.ext_eq.
            move => x x_i.
            do (rewrite initiE 1:/# //=).
            rewrite ac1_def 1:/# rbd1_def 1:/# //= mapiE 1:/# //=.
            do 2!congr.
            rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (x %/ 2 %/ 4 * 4) 2) divzE.
            rewrite (mulzDr 2) //=.
            smt(@Int @IntDiv @Array16 @W16 @Array256).
          + rewrite /f8u32_t16u16.
            apply Array16.ext_eq.
            move => x x_i.
            do (rewrite initiE 1:/# //=).
            rewrite ad0_def 1:/# bc0_def 1:/# //=.
            do 2!congr.
            rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (x %/ 2 %/ 4 * 4) 2) divzE.
            rewrite (mulzDr 2) //=.
            smt(@Int @IntDiv @Array16 @W16 @Array256).
          + rewrite /f8u32_t16u16.
            apply Array16.ext_eq.
            move => x x_i.
            do (rewrite initiE 1:/# //=).
            rewrite ad1_def 1:/# bc1_def 1:/# //=.
            do 2!congr.
            rewrite (mulzC 8 _) (_: 8 = 4 * 2) 1://= -mulzA (mulzC (x %/ 2 %/ 4 * 4) 2) divzE.
            rewrite (mulzDr 2) //=.
            smt(@Int @IntDiv @Array16 @W16 @Array256).
*)
qed.

op load_array384(m : global_mem_t, p : address) : W8.t Array384.t = 
      Array384.init (fun i => m.[p + i]).


lemma true_170: forall x, 0 <= x < 8 => (W8.of_int 170).[x] = (x %% 2 = 1).
proof.
  move => x x_i.
  rewrite /of_int /= /int2bs /= /mkseq -iotaredE /=.
  rewrite /bits2w initiE 1:x_i /=.
  smt(@Int).
qed.

lemma poly_tobytes_corr _a (_p : address) mem : 
    equiv [ Mprevec.poly_tobytes ~ EncDec_AVX2.encode12_opt :
             pos_bound256_cxq a{1} 0 256 2 /\  lift_array256 (nttpack a{1}) = _a /\
             (forall i, 0 <= i < 256 => 0 <= a{2}.[i] < q) /\
             map inFq a{2} = _a /\ valid_ptr _p 384 /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             pos_bound256_cxq res{1} 0 256 1 /\
             touches mem Glob.mem{1} _p 384 /\
             load_array384 Glob.mem{1} _p = res{2}].
proof.
  proc.
  seq 3 1 : (#{/~a{1}}pre /\
             i{1} = i{2} /\ i{1} = 0 /\
             (forall k, 0 <= k < 16 => qx16{1}.[k] = W16.of_int 3329) /\
             map W16.to_uint (nttpack a{1}) = a{2} /\
             pos_bound256_cxq a{1} 0 256 1).
  wp; ecall{1} (poly_csubq_corr (lift_array256 a{1})); auto => />.
  move => &1 &2 [#] pos_bound_a a2_bnd a_def rp_lb rp_ub a a1_eq_a pos_bound_an />.
  split.
    + move => k k_lb k_ub.
      rewrite /(KyberCPA_avx2.jqx16).
      do (rewrite initiE 1://= /=).
      smt(@List @Int @Array16).
    + rewrite Array256.tP => i i_i />.
      rewrite /lift_array256 Array256.tP in a1_eq_a.
      rewrite /lift_array256 Array256.tP in a_def.
      move : (a1_eq_a i i_i).
      rewrite -a_def 1:i_i.
      do rewrite mapiE 1:i_i /=.
      rewrite -!eq_inFq (modz_small (to_sint a.[i])) 1:/#.
      by rewrite -to_sint_unsigned /#.
  while (#{/~mem}{~i{1}=0}pre /\ i{1} = i{2} /\ 0 <= i{1} <= 2 /\
         touches mem Glob.mem{1} _p (192*i{1}) /\
         (forall k, 0 <= k < 192 * i{1} => loadW8 Glob.mem{1} (_p + k) = r{2}.[k])).
  seq 24 0: (#pre /\
             (forall k, 0 <= k < 16 => W16.to_uint tt{1}.[k] = 2^12 * ((asint _a.[128*i{1} + 16 + k]) %% 2^4) + (asint _a.[128*i{1} + k])) /\
             (forall k, 0 <= k < 16 => W16.to_uint t0{1}.[k] = 2^8 * ((asint _a.[128*i{1} + 32 + k]) %% 2^8) + (asint _a.[128*i{1} + 16 + k]) %/ 2^4) /\
             (forall k, 0 <= k < 16 => W16.to_uint t1{1}.[k] = 2^4 * (asint _a.[128*i{1} + 48 + k]) + ((asint _a.[128*i{1} + 32 + k]) %/ 2^8 %% 2^4)) /\
             (forall k, 0 <= k < 16 => W16.to_uint t2{1}.[k] = 2^12 * ((asint _a.[128*i{1} + 80 + k]) %% 2^4) + (asint _a.[128*i{1} + 64 + k])) /\
             (forall k, 0 <= k < 16 => W16.to_uint t3{1}.[k] = 2^8 * ((asint _a.[128*i{1} + 96 + k]) %% 2^8) + (asint _a.[128*i{1} + 80 + k]) %/ 2^4) /\
             (forall k, 0 <= k < 16 => W16.to_uint t4{1}.[k] = 2^4 * (asint _a.[128*i{1} + 112 + k]) + ((asint _a.[128*i{1} + 96 + k]) %/ 2^8 %% 2^4))).
    inline *; wp; skip; auto => />.
    move => &1 &2 [#] a1_bnd p_lb p_ub qx16_def pos_bound_a i_lb i_ub touch_l r2_def i_tub />.
    have b_bnd: forall k, 0 <= k < 256 => 0 <= to_uint a{1}.[k] < 2^12.
      move => k k_i.
      rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
      rewrite -to_sint_unsigned.
      move : (pos_bound_a k k_i) => /#.
      move : (pos_bound_a k k_i) => /#.
    have pos_ubound_a: forall k, 0 <= k < 256 => 0 <= to_uint a{1}.[k] < q.
      move => k k_i.
      rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
      rewrite -to_sint_unsigned.
      move : (pos_bound_a k k_i) => /#.
      move : (pos_bound_a k k_i) => /#.
    do split.
      + move => k k_lb k_ub.
        rewrite /lift_array256.
        do (rewrite initiE 1://= /= || rewrite mapiE 1:/# //=).
        rewrite inFqK inFqK.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite to_uint_orw_disjoint.
          + apply W16.ext_eq => x xb; rewrite /W16.(`&`) map2E initiE //=.
            case (!(0 <= x < 12)).
            + move => kbb; have -> : !(a{1}.[128 * i{2} + k]).[x]; last by smt().
              rewrite get_to_uint xb /= //=. 
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ 12 x  _); 1,2: smt().
              have -> : to_uint a{1}.[128 * i{2} + k] %/ 2 ^ x = 0; last by smt(mod0z).
              apply divz_small; move : (pos_ubound_a (128 * i{2} + k) _); 1: smt().
              by smt(qE).
            move => *; have -> : !(a{1}.[128 * i{2} + 16 + k] `<<` (of_int 12)%W8).[x]; last by smt().
            rewrite get_to_uint xb /= to_uint_shl // of_uintK /=.
            rewrite {1}(_: 65536 = 16 * 4096). trivial.
            rewrite -mulz_modl 1://=.
            have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ x 11  _); 1,2: smt().
            rewrite (_: 4096 = 2^12) // divMr; first by apply le_dvd_pow; smt(). 
            rewrite expz_div // 1:/# => *; move => *; apply dvdz_mull.
            + have -> : 2 %| 2 ^ (12 - x) = 2^1 %| 2 ^ (12 - x) by auto.  
            by apply le_dvd_pow; smt().
        
        rewrite shl_shlw 1://=  -(W16.to_uintK a{1}.[128 * i{2} + 16 + k]) shlMP 1://=.
        rewrite -of_intM W16.to_uintK to_uintM of_uintK //=.
        rewrite {1}(_: 65536 = 16 * 4096). trivial.
        rewrite -mulz_modl 1://= (mulzC _ 4096).
        reflexivity.
      + move => k k_lb k_ub.
        rewrite /lift_array256.
        do (rewrite initiE 1://= /= || rewrite mapiE 1:/# //=).
        rewrite inFqK inFqK.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite to_uint_orw_disjoint.
          + apply W16.ext_eq => x xb; rewrite /W16.(`&`) map2E initiE //=.
            case (!(0 <= x < 8)).
            + move => kbb; have -> : !(a{1}.[128 * i{2} + 16 + k] `>>` (of_int 4)%W8).[x]; last by smt().
              rewrite get_to_uint xb /= to_uint_shr // of_uintK /=.
              rewrite {2}(_: 16 = 2^4) // -divz_mulp //; 1: smt(gt0_pow2).
              rewrite -exprD_nneg //; 1:by smt().
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ 12 (4+x)  _); 1,2: smt().
              have -> : to_uint a{1}.[128 * i{2} + 16 + k] %/ 2 ^ (4 + x) = 0; last by smt(mod0z).
              apply divz_small; move : (pos_ubound_a (128 * i{2} + k) _); 1: smt().
              by smt(qE).
            move => *; have -> : !(a{1}.[128 * i{2} + 32 + k] `<<` (of_int 8)%W8).[x]; last by smt().
            rewrite get_to_uint xb /= to_uint_shl // of_uintK /=.
            rewrite (_: 65536 = 256 * 256). trivial.
            rewrite -mulz_modl 1://=.
            have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ x 8  _); 1,2: smt().
            rewrite (_: 256 = 2^8) // divMr; first by apply le_dvd_pow; smt(). 
            rewrite expz_div // 1:/# => *; move => *; apply dvdz_mull.
            + have -> : 2 %| 2 ^ (8 - x) = 2^1 %| 2 ^ (8 - x) by auto.  
            by apply le_dvd_pow; smt().

        rewrite shl_shlw 1://=  shr_shrw 1://= -(W16.to_uintK a{1}.[128 * i{2} + 16 + k]) shrDP 1://= -(W16.to_uintK a{1}.[128 * i{2} + 32 + k]) shlMP 1://=.
        rewrite -of_intM W16.to_uintK to_uintM of_uintK //=.
        rewrite {3}(_: 65536 = 256 * 256). trivial.
        rewrite -mulz_modl 1://= (mulzC _ 256).
        rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 16 + k]) 65536).
          move : (pos_ubound_a (128 * i{2} + 16 + k)) => /#.
        rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 16 + k] %/ 16) 65536).
          move : (pos_ubound_a (128 * i{2} + 16 + k)) => /#.
        ring.        
      + move => k k_lb k_ub.
        rewrite /lift_array256.
        do (rewrite initiE 1://= /= || rewrite mapiE 1:/# //=).
        rewrite inFqK inFqK.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite to_uint_orw_disjoint.
          + apply W16.ext_eq => x xb; rewrite /W16.(`&`) map2E initiE //=.
            case (!(0 <= x < 4)).
            + move => kbb; have -> : !(a{1}.[128 * i{2} + 32 + k] `>>` (of_int 8)%W8).[x]; last by smt().
              rewrite get_to_uint xb /= to_uint_shr // of_uintK /=.
              rewrite (_: 256 = 2^8) // -divz_mulp //; 1: smt(gt0_pow2).
              rewrite -exprD_nneg //; 1:by smt().
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ 12 (8+x)  _); 1,2: smt().
              have -> : to_uint a{1}.[128 * i{2} + 32 + k] %/ 2 ^ (8 + x) = 0; last by smt(mod0z).
              apply divz_small; move : (pos_ubound_a (128 * i{2} + 32 + k) _); 1: smt().
              by smt(qE).
            move => *; have -> : !(a{1}.[128 * i{2} + 48 + k] `<<` (of_int 4)%W8).[x]; last by smt().
            rewrite get_to_uint xb /= to_uint_shl // of_uintK /=.
            rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 48 + k] * 16) 65536).
              move : (pos_ubound_a (128 * i{2} + 48 + k)) => /#.
            have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ x 4  _); 1,2: smt().
            rewrite (_: 16 = 2^4) // divMr; first by apply le_dvd_pow; smt(). 
            rewrite expz_div // 1:/# => *; move => *; apply dvdz_mull.
            + have -> : 2 %| 2 ^ (4 - x) = 2^1 %| 2 ^ (4 - x) by auto.
            by apply le_dvd_pow; smt().

        rewrite shl_shlw 1://=  shr_shrw 1://= -(W16.to_uintK a{1}.[128 * i{2} + 32 + k]) shrDP 1://= -(W16.to_uintK a{1}.[128 * i{2} + 48 + k]) shlMP 1://=.
        rewrite -of_intM W16.to_uintK to_uintM of_uintK //=.
        rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 48 + k] * 16) 65536).
          move : (pos_ubound_a (128 * i{2} + 48 + k)) => /#.
        rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 32 + k]) 65536).
          move : (pos_ubound_a (128 * i{2} + 32 + k)) => /#.
        rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 32 + k] %/ 256) 65536).
          move : (pos_ubound_a (128 * i{2} + 32 + k)) => /#.
        rewrite (pmod_small _ 16); by move : (pos_ubound_a ((128 * i{2} + 32 + k))) => /#.
      + move => k k_lb k_ub.
        rewrite /lift_array256.
        do (rewrite initiE 1://= /= || rewrite mapiE 1:/# //=).
        rewrite inFqK inFqK.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite to_uint_orw_disjoint.
          + apply W16.ext_eq => x xb; rewrite /W16.(`&`) map2E initiE //=.
            case (!(0 <= x < 12)).
            + move => kbb; have -> : !(a{1}.[128 * i{2} + 64 + k]).[x]; last by smt().
              rewrite get_to_uint xb /= //=. 
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ 12 x  _); 1,2: smt().
              have -> : to_uint a{1}.[128 * i{2} + 64 + k] %/ 2 ^ x = 0; last by smt(mod0z).
              apply divz_small; move : (pos_ubound_a (128 * i{2} + 64 + k) _); 1: smt().
              by smt(qE).
            move => *; have -> : !(a{1}.[128 * i{2} + 80 + k] `<<` (of_int 12)%W8).[x]; last by smt().
            rewrite get_to_uint xb /= to_uint_shl // of_uintK /=.
            rewrite {1}(_: 65536 = 16 * 4096). trivial.
            rewrite -mulz_modl 1://=.
            have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ x 11  _); 1,2: smt().
            rewrite (_: 4096 = 2^12) // divMr; first by apply le_dvd_pow; smt(). 
            rewrite expz_div // 1:/# => *; move => *; apply dvdz_mull.
            + have -> : 2 %| 2 ^ (12 - x) = 2^1 %| 2 ^ (12 - x) by auto.  
            by apply le_dvd_pow; smt().

        rewrite shl_shlw 1://=  -(W16.to_uintK a{1}.[128 * i{2} + 80 + k]) shlMP 1://=.
        rewrite -of_intM W16.to_uintK to_uintM of_uintK //=.
        rewrite {1}(_: 65536 = 16 * 4096). trivial.
        rewrite -mulz_modl 1://= (mulzC _ 4096).
        reflexivity.

      + move => k k_lb k_ub.
        rewrite /lift_array256.
        do (rewrite initiE 1://= /= || rewrite mapiE 1:/# //=).
        rewrite inFqK inFqK.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite to_uint_orw_disjoint.
          + apply W16.ext_eq => x xb; rewrite /W16.(`&`) map2E initiE //=.
            case (!(0 <= x < 8)).
            + move => kbb; have -> : !(a{1}.[128 * i{2} + 80 + k] `>>` (of_int 4)%W8).[x]; last by smt().
              rewrite get_to_uint xb /= to_uint_shr // of_uintK /=.
              rewrite (_: 16 = 2^4) // -divz_mulp //; 1: smt(gt0_pow2).
              rewrite -exprD_nneg //; 1:by smt().
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ 12 (4+x)  _); 1,2: smt().
              have -> : to_uint a{1}.[128 * i{2} + 80 + k] %/ 2 ^ (4 + x) = 0; last by smt(mod0z).
              apply divz_small; move : (pos_ubound_a (128 * i{2} + 96 + k) _); 1: smt().
              by smt(qE).
            move => *; have -> : !(a{1}.[128 * i{2} + 96 + k] `<<` (of_int 8)%W8).[x]; last by smt().
            rewrite get_to_uint xb /= to_uint_shl // of_uintK /=.
            rewrite (_: 65536 = 256 * 256). trivial.
            rewrite -mulz_modl 1://=.
            have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ x 8  _); 1,2: smt().
            rewrite (_: 256 = 2^8) // divMr; first by apply le_dvd_pow; smt(). 
            rewrite expz_div // 1:/# => *; move => *; apply dvdz_mull.
            + have -> : 2 %| 2 ^ (8 - x) = 2^1 %| 2 ^ (8 - x) by auto.  
            by apply le_dvd_pow; smt().

        rewrite shl_shlw 1://=  shr_shrw 1://= -(W16.to_uintK a{1}.[128 * i{2} + 80 + k]) shrDP 1://= -(W16.to_uintK a{1}.[128 * i{2} + 96 + k]) shlMP 1://=.
        rewrite -of_intM W16.to_uintK to_uintM of_uintK //=.
        rewrite {3}(_: 65536 = 256 * 256). trivial.
        rewrite -mulz_modl 1://= (mulzC _ 256).
        rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 80 + k]) 65536).
          move : (pos_ubound_a (128 * i{2} + 80 + k)) => /#.
        rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 80 + k] %/ 16) 65536).
          move : (pos_ubound_a (128 * i{2} + 80 + k)) => /#.
        ring.
      + move => k k_lb k_ub.
        rewrite /lift_array256.
        do (rewrite initiE 1://= /= || rewrite mapiE 1:/# //=).
        rewrite inFqK inFqK.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite (pmod_small _ q). move : pos_ubound_a => /#.
        rewrite to_uint_orw_disjoint.
          + apply W16.ext_eq => x xb; rewrite /W16.(`&`) map2E initiE //=.
            case (!(0 <= x < 4)).
            + move => kbb; have -> : !(a{1}.[128 * i{2} + 96 + k] `>>` (of_int 8)%W8).[x]; last by smt().
              rewrite get_to_uint xb /= to_uint_shr // of_uintK /=.
              rewrite (_: 256 = 2^8) // -divz_mulp //; 1: smt(gt0_pow2).
              rewrite -exprD_nneg //; 1:by smt().
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ 12 (8+x)  _); 1,2: smt().
              have -> : to_uint a{1}.[128 * i{2} + 96 + k] %/ 2 ^ (8 + x) = 0; last by smt(mod0z).
              apply divz_small; move : (pos_ubound_a (128 * i{2} + 96 + k) _); 1: smt().
              by smt(qE).
            move => *; have -> : !(a{1}.[128 * i{2} + 112 + k] `<<` (of_int 4)%W8).[x]; last by smt().
            rewrite get_to_uint xb /= to_uint_shl // of_uintK /=.
            rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 112 + k] * 16) 65536).
              move : (pos_ubound_a (128 * i{2} + 112 + k)) => /#.
            have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ x 4  _); 1,2: smt().
            rewrite (_: 16 = 2^4) // divMr; first by apply le_dvd_pow; smt(). 
            rewrite expz_div // 1:/# => *; move => *; apply dvdz_mull.
            + have -> : 2 %| 2 ^ (4 - x) = 2^1 %| 2 ^ (4 - x) by auto.
            by apply le_dvd_pow; smt().

        rewrite shl_shlw 1://=  shr_shrw 1://= -(W16.to_uintK a{1}.[128 * i{2} + 96 + k]) shrDP 1://= -(W16.to_uintK a{1}.[128 * i{2} + 112 + k]) shlMP 1://=.
        rewrite -of_intM W16.to_uintK to_uintM of_uintK //=.
        rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 112 + k] * 16) 65536).
          move : (pos_ubound_a (128 * i{2} + 112 + k)) => /#.
        rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 96 + k]) 65536).
          move : (pos_ubound_a (128 * i{2} + 96 + k)) => /#.
        rewrite (pmod_small (to_uint a{1}.[128 * i{2} + 96 + k] %/ 256) 65536).
          move : (pos_ubound_a (128 * i{2} + 96 + k)) => /#.
        rewrite (pmod_small _ 16); by move : (pos_ubound_a ((128 * i{2} + 96 + k))) => /#.
  seq 18 1: (#{~tt{1}}{~t0{1}}{~t1{1}}{~t2{1}}{~t3{1}}{~t4{1}}pre /\
             (forall k, 0 <= k < 32 => t0_b{1}.[k] = r{2}.[192 * i{1} + k]) /\
             (forall k, 0 <= k < 32 => t2_b{1}.[k] = r{2}.[192 * i{1} + 32 + k]) /\
             (forall k, 0 <= k < 32 => t1_b{1}.[k] = r{2}.[192 * i{1} + 64 + k]) /\
             (forall k, 0 <= k < 32 => t3_b{1}.[k] = r{2}.[192 * i{1} + 80 + k]) /\
             (forall k, 0 <= k < 32 => ttt_b{1}.[k] = r{2}.[192 * i{1} + 96 + k]) /\
             (forall k, 0 <= k < 32 => t4_b{1}.[k] = r{2}.[192 * i{1} + 112 + k])).
  inline *; wp; skip; auto => />.
  move => &1 &2 [#] a1_bnd p_lb p_ub qx16_def pos_bound_a i_lb i_ub touch_mem_l r2_def i_tub tt_def t0_def t1_def t2_def t3_def t4_def />.
  do split.
    move => k k_lb k_ub.
    rewrite (r2_def k); first by rewrite k_lb k_ub.
    rewrite filliE 1:/#.
    rewrite lezNgt k_ub //=.

    move => k k_lb k_ub.
    rewrite /f16u16_t32u8 /f8u32_t16u16 /f16u16_t8u32 /f4u64_t16u16 /f16u16_t4u64.
    do (rewrite initiE 1:/# //= || rewrite mapiE 1:/# //=).
    have ->: !W8.int_bit 32 (4 * (k %/ 2 %/ 8) + 3).
      move : (true_32 (4 * (k %/ 2 %/ 8) + 3)).
      rewrite of_intwE.
      smt(@Int @IntDiv).
    have -> //=: !W8.int_bit 32 (4 * (k %/ 2 %/ 8)).
      move : (true_32 (4 * (k %/ 2 %/ 8))).
      rewrite of_intwE.
      smt(@Int @IntDiv).
    have -> //=: (0 <= 4 * (k %/ 2 %/ 8) + 1 && 4 * (k %/ 2 %/ 8) + 1 < 8).
      move : k_lb k_ub; smt(@Int @IntDiv).
    rewrite (_ : W8.int_bit 32 (4 * (k %/ 2 %/ 8) + 1) = (k %/ 16 = 1)).
      move : (true_32 (4 * (k %/ 2 %/ 8) + 1)).
      rewrite of_intwE.
      smt(@Int @IntDiv).
    do rewrite fun_if2.
    do (rewrite initiE 1:/# //= || rewrite mapiE 1:/# //=).
    rewrite (pdiv_small (k %/ 2 %% 8) 8) 1:modz_cmp //=.
    rewrite (pdiv_small (k %/ 2 %% 8 %% 4) 4) 1:modz_cmp //=.
    do (rewrite (modz_cmp _ 8) 1://= //=).
    do (rewrite (modz_dvd _ _ 4) 1://= || rewrite (modz_dvd _ _ 2) 1://=).
    rewrite (pdiv_small (k %/ 2 %% 2) 2) 1:modz_cmp //=.
    rewrite (pmod_small (k %/ 2 %% 4) 8) 1:/# //=.
    rewrite (pmod_small (k %/ 2 %% 2) 8) 1:/# //=.
    have -> //=: (0 <= k %/ 2 %% 4 %/ 2 && k %/ 2 %% 4 %/ 2 < 8). move : (modz_cmp (k %/ 2) 4) => /#.
    rewrite (_: k %/ 2 %% 4 %/ 2 = k %/ 4 %% 2). smt(@Int @IntDiv modz_pow2_div).
    rewrite (_: k %/ 2 %% 8 %/ 4 %% 2 = k %/ 8 %% 2). smt(@Int @IntDiv modz_pow2_div).
    rewrite (_: W8.int_bit 170 (k %/ 4 %% 2) = (k %/ 4 %% 2 = 1)).
      move : (true_170 (k %/ 4 %% 2)).
      rewrite of_intwE.
      smt(@Int @IntDiv).
    rewrite (_: W8.int_bit 170 (k %/ 2 %% 2) = (k %/ 2 %% 2 = 1)).
      move : (true_170 (k %/ 2 %% 2)).
      rewrite of_intwE.
      smt(@Int @IntDiv).
    rewrite (_: W8.int_bit 170 (k %/ 2 %% 4) = (k %/ 2 %% 2 = 1)).
      move : (true_170 (k %/ 2 %% 4)).
      rewrite of_intwE.
      smt(@Int @IntDiv).
    rewrite filliE 1://#.
    have -> //=: 192 * i{2} <= 192 * i{2} + k && 192 * i{2} + k < 192 * i{2} + 192.
      move : k_ub k_lb => /#.
  rewrite (_: (if k %/ 4 %% 2 = 1 then
                 if k %/ 2 %% 2 = 1 then t4{1}.[k %/ 2 %% 2]
                 else
                   pack2_t ((init ("_.[_]" t3{1})))%W2u16.Pack `>>` (of_int 16)%W8 \bits16
                   k %/ 2 %% 2
               else
                 if k %/ 2 %% 2 = 1 then t2{1}.[k %/ 2 %% 4]
                 else
                   pack2_t
                     ((init (fun (j : int) => t1{1}.[2 * (k %/ 4 %% 2) + j])))%W2u16.Pack `>>`
                   (of_int 16)%W8 \bits16 k %/ 2 %% 2) =
              (if k %/ 4 %% 2 = 1 then
                 if k %/ 2 %% 2 = 1 then t4{1}.[1]
                 else
                   pack2_t ((init ("_.[_]" t3{1})))%W2u16.Pack `>>` (of_int 16)%W8 \bits16 0
               else
                 if k %/ 2 %% 2 = 1 then t2{1}.[1]
                 else
                   pack2_t
                     ((init (fun (j : int) => t1{1}.[j])))%W2u16.Pack `>>`
                   (of_int 16)%W8 \bits16 0)).
    case (k %/ 4 %% 2 = 1) => if_1_t.
      + smt(@Logic).
      + have ->: k %/ 4 %% 2 = 0. move : if_1_t (modz_cmp (k %/ 4) 2) => /#.
        case (k %/ 2 %% 2 = 1) => if_2_t.
          move : if_1_t if_2_t; smt(@Int @IntDiv).
          have ->: k %/ 2 %% 2 = 0. move : if_2_t (modz_cmp (k %/ 2) 2) => /#.
          trivial.
  rewrite (_: (if k %/ 4 %% 2 = 1 then
                 if k %/ 2 %% 2 = 1 then
                   pack2_t
                     ((init (fun (j : int) => t2{1}.[2 * (k %/ 4 %% 2) + j])))%W2u16.Pack `<<`
                   (of_int 16)%W8 \bits16 k %/ 2 %% 2
                 else t1{1}.[k %/ 2 %% 4]
               else
                 pack4_t
                   ((init
                       ("_.[_]"
                          ((init
                              (fun (i0 : int) =>
                                 if (0 <= i0 %% 8 && i0 %% 8 < 8) /\
                                    (int_bit 170 (i0 %% 8))%W8 then
                                   ((init
                                       (fun (i1 : int) =>
                                          ((init
                                              (fun (i2 : int) =>
                                                 ((init
                                                     (fun (i3 : int) =>
                                                        pack2_t
                                                          ((init
                                                              (fun (j : int) =>
                                                                 t0{1}.[2 * i3 + j])))%W2u16.Pack)))%Array8.[i2] `<<`
                                                 (of_int 16)%W8)))%Array8.[i1 %/ 2] \bits16
                                          i1 %% 2)))%Array16.[i0]
                                 else tt{1}.[i0])))%Array16)))%W4u16.Pack `>>`
                 (of_int 32)%W8 \bits16 k %/ 2 %% 4) =
              (if k %/ 4 %% 2 = 1 then
                 if k %/ 2 %% 2 = 1 then
                   pack2_t
                     ((init (fun (j : int) => t2{1}.[2 + j])))%W2u16.Pack `<<`
                   (of_int 16)%W8 \bits16 1
                 else t1{1}.[2]
               else
                 pack4_t
                   ((init
                       ("_.[_]"
                          ((init
                              (fun (i0 : int) =>
                                 if (0 <= i0 %% 8 && i0 %% 8 < 8) /\
                                    (int_bit 170 (i0 %% 8))%W8 then
                                   ((init
                                       (fun (i1 : int) =>
                                          ((init
                                              (fun (i2 : int) =>
                                                 ((init
                                                     (fun (i3 : int) =>
                                                        pack2_t
                                                          ((init
                                                              (fun (j : int) =>
                                                                 t0{1}.[2 * i3 + j])))%W2u16.Pack)))%Array8.[i2] `<<`
                                                 (of_int 16)%W8)))%Array8.[i1 %/ 2] \bits16
                                          i1 %% 2)))%Array16.[i0]
                                 else tt{1}.[i0])))%Array16)))%W4u16.Pack `>>`
                 (of_int 32)%W8 \bits16 k %/ 2 %% 4)).
    case (k %/ 4 %% 2 = 1) => if_1_t.
      + case (k %/ 2 %% 2 = 1) => if_2_t.
          rewrite if_1_t if_2_t //=.
          move : if_1_t if_2_t; smt(@Int @IntDiv).
      + done.
  do (rewrite (fun_if2 (W2u8.\bits8))).
  do rewrite (mulzC 192 i{2}).
  rewrite modzMDl.
  do (rewrite mapiE 1:/# //=).
  do (rewrite shl_shlw 1://= || rewrite shr_shrw 1://=).
  pose t3_pack := pack2_t ((W2u16.Pack.init ("_.[_]" t3{1}))).
  pose t1_pack := pack2_t ((W2u16.Pack.init ("_.[_]" t1{1}))).
  pose t2_pack := pack2_t ((W2u16.Pack.init (fun (j : int) => t2{1}.[2 + j]))).
  rewrite -(W32.to_uintK t3_pack) -(W32.to_uintK t1_pack) -(W32.to_uintK t2_pack).
  rewrite shrDP 1://= (pmod_small _ W32.modulus) 1:W32.to_uint_cmp.
  rewrite shrDP 1://= (pmod_small _ W32.modulus) 1:W32.to_uint_cmp.
  rewrite (_: W16.modulus = 2 ^ (16 * 1)). by trivial.
  do (rewrite of_int_bits16_div 1://=).
  do (rewrite -divzMr 1..2://=).
  rewrite -exprD_nneg 1..2://=.
  do rewrite -(mulzDr 16 _ _).
  do (rewrite -W2u16.of_int_bits16_div 1://=).
  rewrite addz0 to_uintK -(W2u16.get_unpack16 _ 1) 1://= pack2K initiE 1://=.
  rewrite to_uintK -(W2u16.get_unpack16 _ 1) 1://= pack2K initiE 1://=.

  rewrite shlMP 1://=.
  rewrite of_int_bits16_div 1://=.
  rewrite (_: to_uint t2_pack * W16.modulus %/ 2 ^ (16 * 1) = to_uint t2_pack %/ 2 ^ (16 * 0)).
    by rewrite expr0 mulzK 1://= divz1.
  rewrite -W2u16.of_int_bits16_div 1://=.
  rewrite to_uintK -(W2u16.get_unpack16 _ 0) 1://= pack2K initiE 1://= //=.
  pose tt_t0_pack := pack4_t
     ((W4u16.Pack.init
         ("_.[_]"
            ((init
                (fun (i0 : int) =>
                   if (0 <= i0 %% 8 && i0 %% 8 < 8) /\
                      (int_bit 170 (i0 %% 8))%W8 then
                     ((init
                         (fun (i1 : int) =>
                            ((init
                                (fun (i2 : int) =>
                                   ((init
                                       (fun (i3 : int) =>
                                          pack2_t
                                            ((init
                                                (fun (j : int) =>
                                                   t0{1}.[2 * i3 + j])))%W2u16.Pack)))%Array8.[i2] `<<`
                                   (of_int 16)%W8)))%Array8.[i1 %/ 2] \bits16
                            i1 %% 2)))%Array16.[i0]
                   else tt{1}.[i0])))%Array16))).
  rewrite -(W64.to_uintK tt_t0_pack).  
  rewrite shrDP 1://= (pmod_small _ W64.modulus) 1:W64.to_uint_cmp.
  rewrite of_int_bits16_div 1:modz_cmp 1://=.
  rewrite -divzMr 1://=. move : (modz_cmp k 4); smt(@Int @IntDiv @Ring.IntID).
  rewrite -exprD_nneg 1://=. smt(@Int @IntDiv @Ring.IntID).
  rewrite (_: 32 = 16 * 2) 1://= -(mulzDr 16 _ _).
  rewrite (_: (if k %/ 8 %% 2 = 0 then
                 if k %/ 4 %% 2 = 1 then
                   if k %/ 2 %% 2 = 1 then t4{1}.[1] \bits8 k %% 2
                   else t3{1}.[1] \bits8 k %% 2
                 else
                   if k %/ 2 %% 2 = 1 then t2{1}.[1] \bits8 k %% 2
                   else t1{1}.[1] \bits8 k %% 2
               else
                 if k %/ 4 %% 2 = 1 then
                   if k %/ 2 %% 2 = 1 then t2{1}.[2] \bits8 k %% 2
                   else t1{1}.[2] \bits8 k %% 2
                 else
                  (of_int (to_uint tt_t0_pack %/ 2 ^ (16 * (2 + k %/ 2 %% 4))))%W16 \bits8
                  k %% 2) =
              (if k %/ 8 %% 2 = 0 then
                 if k %/ 4 %% 2 = 1 then
                   if k %/ 2 %% 2 = 1 then t4{1}.[1] \bits8 k %% 2
                   else t3{1}.[1] \bits8 k %% 2
                 else
                   if k %/ 2 %% 2 = 1 then t2{1}.[1] \bits8 k %% 2
                   else t1{1}.[1] \bits8 k %% 2
               else
                 if k %/ 4 %% 2 = 1 then
                   if k %/ 2 %% 2 = 1 then t2{1}.[2] \bits8 k %% 2
                   else t1{1}.[2] \bits8 k %% 2
                 else
                  (of_int (to_uint tt_t0_pack %/ 2 ^ (16 * (2 + k %/ 2 %% 2))))%W16 \bits8
                  k %% 2)).
    case (k %/ 8 %% 2 = 0) => />.
      + move => if_1_f.
        case (k %/ 4 %% 2 = 1) => />.
          + move => if_2_f.
            have if_1_fv: k %/ 8 %% 2 = 1. move : if_1_f (modz_cmp (k %/ 8) 2) => /#.
            have if_2_fv: k %/ 4 %% 2 = 0. move : if_2_f (modz_cmp (k %/ 4) 2) => /#.
            have ->: k %/ 2 %% 4 = k %/ 2 %% 2. move : if_2_fv if_1_fv; smt(@Int @IntDiv).
            done.
  rewrite -W4u16.of_int_bits16_div; first by move : (modz_cmp (k %/ 2) 2) => /#.
  rewrite to_uintK -W4u16.get_unpack16 1:/# pack4K.
  do (rewrite initiE 1:/# //=).
  rewrite (modz_cmp _ 8) 1://= //=.
  rewrite (_: 2 * ((2 + k %/ 2 %% 2) %/ 2) = 2).
    rewrite -(mul1z 2) divzMDl //= (pdiv_small (k %/ 2 %% 2) 2) 1:modz_cmp //=.
  rewrite (_: (2 + k %/ 2 %% 2) %% 2 = k %/ 2 %% 2). smt(@Int @IntDiv modz_mod).
  pose t0_pack := pack2_t ((W2u16.Pack.init (fun (j : int) => t0{1}.[2 + j]))).
  rewrite -(W32.to_uintK t0_pack).
  rewrite shl_shlw 1://= shlMP 1://=.
  rewrite of_int_bits16_div 1:/#.
  rewrite (_: W16.modulus = 2 ^ (16 * 1)). by trivial.
  rewrite (_: W8.int_bit 170 ((2 + k %/ 2 %% 2) %% 8) = (k %/ 2 %% 2 = 1)).
    move : (true_170 ((2 + k %/ 2 %% 2) %% 8)).
    rewrite of_intwE.
    smt(@Int @IntDiv).
  rewrite (fun_if2 (W2u8.\bits8)).
  rewrite (_: (if k %/ 2 %% 2 = 1 then
                 (W16.of_int (to_uint t0_pack * 2 ^ (16 * 1) %/ 2 ^ (16 * (k %/ 2 %% 2)))) \bits8 k%% 2
               else tt{1}.[2 + k %/ 2 %% 2] \bits8 k %% 2) =
              (if k %/ 2 %% 2 = 1 then
                 (W16.of_int (to_uint t0_pack * 2 ^ (16 * 1) %/ 2 ^ (16 * 1))) \bits8 k%% 2
               else tt{1}.[2] \bits8 k %% 2)).
    case (k %/ 2 %% 2 = 1) => if_1_t.
      rewrite if_1_t //=.
      have -> //=: k %/ 2 %% 2 = 0. move : if_1_t => /#.
  rewrite (_: to_uint t0_pack * W16.modulus %/ 2 ^ (16 * 1) = to_uint t0_pack %/ 2 ^ (16 * 0)).
    by rewrite expr0 mulzK 1://= divz1.
  rewrite -W2u16.of_int_bits16_div 1://=.
  rewrite to_uintK -(W2u16.get_unpack16 _ 0) 1://= pack2K initiE 1://= //=.
  do (rewrite bits8_div 1:/#).

  rewrite (_: (if k %/ 8 %% 2 = 0 then
                 if k %/ 4 %% 2 = 1 then
                   if k %/ 2 %% 2 = 1 then
                     (of_int
                        (to_uint
                           (pack2_t ((W2u16.Pack.init ("_.[_]" t2{1}))) `<<<` 16 \bits16 k %/ 2 %% 2) %/
                         2 ^ (8 * (k %% 2))))%W8
                   else (of_int (to_uint t1{1}.[k %/ 2 %% 2] %/ 2 ^ (8 * (k %% 2))))%W8
                 else
                   if k %/ 2 %% 2 = 1 then
                     (of_int
                        (to_uint
                           (pack2_t
                              ((init (fun (j : int) => t0{1}.[2 * (k %/ 4 %% 2) + j])))%W2u16.Pack `<<<`
                            16 \bits16 k %/ 2 %% 2) %/
                         2 ^ (8 * (k %% 2))))%W8
                   else (of_int (to_uint tt{1}.[k %/ 2 %% 4] %/ 2 ^ (8 * (k %% 2))))%W8
               else
                 if k %/ 4 %% 2 = 1 then
                   if k %/ 2 %% 2 = 1 then
                     (of_int (to_uint t0{1}.[k %/ 2 %% 2] %/ 2 ^ (8 * (k %% 2))))%W8
                   else
                     (of_int
                        (to_uint
                           (pack2_t ((init ("_.[_]" tt{1})))%W2u16.Pack `>>>` 16 \bits16
                            k %/ 2 %% 2) %/
                         2 ^ (8 * (k %% 2))))%W8
                 else
                   if k %/ 2 %% 2 = 1 then
                     (of_int
                        (to_uint
                           (pack2_t
                              ((init (fun (j : int) => t4{1}.[2 * (k %/ 4 %% 2) + j])))%W2u16.Pack `<<<`
                            16 \bits16 k %/ 2 %% 2) %/
                         2 ^ (8 * (k %% 2))))%W8
                   else (of_int (to_uint t3{1}.[k %/ 2 %% 4] %/ 2 ^ (8 * (k %% 2))))%W8) =
              (if k %/ 8 %% 2 = 0 then
                 if k %/ 4 %% 2 = 1 then
                   if k %/ 2 %% 2 = 1 then
                     (of_int
                        (to_uint
                           (pack2_t ((W2u16.Pack.init ("_.[_]" t2{1}))) `<<<` 16 \bits16 1) %/ 2 ^ (8 * (k %% 2))))%W8
                   else (of_int (to_uint t1{1}.[0] %/ 2 ^ (8 * (k %% 2))))%W8
                 else
                   if k %/ 2 %% 2 = 1 then
                     (of_int
                        (to_uint
                           (pack2_t
                              ((W2u16.Pack.init (fun (j : int) => t0{1}.[j]))) `<<<` 16 \bits16 1) %/ 2 ^ (8 * (k %% 2))))%W8
                   else (of_int (to_uint tt{1}.[0] %/ 2 ^ (8 * (k %% 2))))%W8
               else
                 if k %/ 4 %% 2 = 1 then
                   if k %/ 2 %% 2 = 1 then
                     (of_int (to_uint t0{1}.[1] %/ 2 ^ (8 * (k %% 2))))%W8
                   else
                     (of_int
                        (to_uint
                           (pack2_t ((W2u16.Pack.init ("_.[_]" tt{1}))) `>>>` 16 \bits16 0) %/ 2 ^ (8 * (k %% 2))))%W8
                 else
                   if k %/ 2 %% 2 = 1 then
                     (of_int
                        (to_uint
                           (pack2_t
                              ((W2u16.Pack.init (fun (j : int) => t4{1}.[j]))) `<<<` 16 \bits16 1) %/ 2 ^ (8 * (k %% 2))))%W8
                   else (of_int (to_uint t3{1}.[0] %/ 2 ^ (8 * (k %% 2))))%W8)).
    case(k %/ 8 %% 2 = 0) => if_1_t.
      case (k %/ 4 %% 2 = 1) => if_2_t.
        + smt(@Logic @Int @IntDiv).
        + have -> //=: k %/ 4 %% 2 = 0. move : if_2_t (modz_cmp (k %/ 4) 2 ) => /#.
          have ->: k %/ 2 %% 4 = k %/ 2 %% 2. move : if_2_t if_1_t; smt(@Int @IntDiv).
          smt(@Logic @Int @IntDiv).
      case (k %/ 4 %% 2 = 1) => if_2_t.
        + smt(@Logic @Int @IntDiv).
        + have -> //=: k %/ 4 %% 2 = 0. move : if_2_t (modz_cmp (k %/ 4) 2 ) => /#.
          have ->: k %/ 2 %% 4 = k %/ 2 %% 2. move : if_2_t if_1_t; smt(@Int @IntDiv).
          smt(@Logic @Int @IntDiv).
  move : t3_pack t1_pack t2_pack tt_t0_pack t0_pack => _ _ _ _ _.
  pose t0_pack := pack2_t ((W2u16.Pack.init (fun (j : int) => t0{1}.[j]))).
  pose t2_pack := pack2_t ((W2u16.Pack.init ("_.[_]" t2{1}))).
  pose t4_pack := pack2_t ((W2u16.Pack.init (fun (j : int) => t4{1}.[j]))).
  pose tt_pack := pack2_t ((W2u16.Pack.init ("_.[_]" tt{1}))).
  rewrite -(W32.to_uintK t0_pack) -(W32.to_uintK t2_pack) -(W32.to_uintK t4_pack) -(W32.to_uintK tt_pack).
  rewrite shrDP 1://= (pmod_small _ W32.modulus) 1:W32.to_uint_cmp.
  do (rewrite shlMP 1://=).
  rewrite (_: W16.modulus = 2 ^ (16 * 1)). by trivial.
  do (rewrite of_int_bits16_div 1://=).
  have H: forall (t: int), t * 2 ^ (16 * 1) %/ 2 ^ (16 * 1) = t %/ 2 ^ (16 * 0).
    by move => t; rewrite expr0 mulzK 1://= divz1.
  do rewrite H.
  do (rewrite -divzMr 1..2://=).
  rewrite -exprD_nneg 1..2://=.
  do rewrite -(mulzDr 16 _ _).
  do (rewrite -W2u16.of_int_bits16_div 1://=).
  rewrite addz0.
  rewrite (W32.to_uintK t2_pack) -(W2u16.get_unpack16 _ 0) 1://= pack2K initiE 1://=.
  rewrite (W32.to_uintK t0_pack) -(W2u16.get_unpack16 _ 0) 1://= pack2K initiE 1://=.
  rewrite (W32.to_uintK tt_pack) -(W2u16.get_unpack16 _ 1) 1://= pack2K initiE 1://=.
  rewrite (W32.to_uintK t4_pack) -(W2u16.get_unpack16 _ 0) 1://= pack2K initiE 1://= //=.

  (* HERE: repeat for other half *)
  do (rewrite t4_def 1://= || rewrite t3_def 1://= || rewrite t2_def 1://= ||
      rewrite t1_def 1://= || rewrite t0_def 1://= || rewrite tt_def 1://=).
  have k_iota: k \in (iota_ 0 32); first by rewrite mem_iota k_lb k_ub.
  rewrite (pmod_small k 192); first by move : k_lb k_ub => /#.
  rewrite (_: i{2} * 192 = (i{2} * 64) * 3); first by ring.
  rewrite (modzMDl _ _ 3).
  do (rewrite mapiE; first by move : i_lb i_tub => /#).
  rewrite /pos_bound256_cxq /bpos16 //= in pos_bound_a.
  have pos_ubound_a: forall (k : int), 0 <= k && k < 256 => 0 <= to_uint a{1}.[k] && to_uint a{1}.[k] < q.
    move => j j_i.
    rewrite -to_sint_unsigned.
    move : (pos_bound_a j j_i) => />.
    apply (pos_bound_a j j_i).
  do (rewrite inFqK (pmod_small _ q) 1:pos_ubound_a 1:/#).
  case (k = 1) => k_1.
    rewrite k_1 //=.
    smt(@Int @IntDiv @Array384 @W16 @W8 @Ring.IntID @W32 @List @Logic).
    move : H.
    rewrite -iotaredE /=.
    case
    smt(@Int @IntDiv @Array384 @W16 @W8 @Ring.IntID @W32 @List).

qed.
end KyberPolyAVX.
