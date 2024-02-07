require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel.
require import Array400 Array384 Array256 Array128 Array64 Array32 Array16 Array4 Array8.
require import W16extra WArray512 WArray32 WArray16.
require import AVX2_Ops MLKEM_avx2_encdec MLKEM_Poly_avx2_prevec NTT_avx2 Fq_avx2 MLKEM_avx2_auxlemmas.
require import Jkem_avx2 Jkem.
require import Fq NTT_Fq MLKEM_Poly.
require import GFq Rq Serialization VecMat Correctness MLKEMFCLib.

theory MLKEM_PolyAVX.

import GFq.
import Fq.
import SignedReductions.
import Zq.
import ZModP.
import Fq_avx2.
import NTT_Avx2.
import MLKEM_Poly.

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
             incoeff (to_sint res.[k]) = _a.[k] + _b.[k]].
proof. 
  move => [ab_lb ab_ub] [bb_lb bb_ub].
  proc.
  sp.
  while (0 <= i <= 16 /\
           (forall k, 16*i <= k < 256 => incoeff (to_sint rp.[k]) = _a.[k]) /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp (16*i) 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (16*i) (ab + bb) /\
           (forall k, 0 <= k < (16*i) =>
             incoeff (to_sint rp.[k]) = _a.[k] + _b.[k])); last first.
  auto => />.
  move => &hr signed_bound_a signed_bound_b.
  do split; 1..3:by smt(Array256.initiE Array256.mapiE).
  move => i rp i_tlb i_lb i_ub _ _.
  have ->: i = 16. by move : i_tlb i_ub => /#.
  move => -> /=.
  smt().

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
      move : (add_corr_qv rp{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 6 3 _ _ _ _ _ _) => />;
        1,2:by smt(Array256.initiE Array256.mapiE Array256.tP).
      rewrite /signed_bound_cxq in sgnd_bnd_hrp_a.
      move : (sgnd_bnd_hrp_a k) ab_lb ab_ub.
      rewrite k_tlb /=. by smt().

      rewrite /signed_bound_cxq in sgnd_bnd_bp.
      move : (sgnd_bnd_bp k) bb_lb bb_ub.
      rewrite k_lb /=. by smt().


      move => rp_bp_def bp_lb bp_ub.

      rewrite to_sintD_small => />.
        move : (sgnd_bnd_hrp_a k _); first by smt().
        move : (sgnd_bnd_bp k _); first by smt().
        smt().
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
        smt().
      rewrite incoeffD.
      rewrite _a_def 1:/#; congr.
      rewrite /lift_array256 in _b_def.
      rewrite _b_def mapiE 1:/# //=.
    + simplify.
      rewrite -ltzNge in k_tlb.
      rewrite lrp_def //=.
qed.

lemma poly_add_ll : islossless Mprevec.poly_add2.
proof. 
  proc; while (0<= i <= 16) (16 - i).
  auto => />.
  inline Ops.iVPADD_16u16.
  auto => />.
  smt().
  auto => />.
  smt().
qed.

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
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
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
              incoeff (to_sint res.[k]) = _a.[k] - _b.[k]].
proof. 
  move => [ab_lb ab_ub] [bb_lb bb_ub].
  proc.
  while (0 <= i <= 16 /\
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (16*i) (ab + bb) /\
           forall k, 0 <= k < (16*i) =>
              incoeff (to_sint rp.[k]) = _a.[k] - _b.[k]
  ); first last.
  auto => />.
  move => &hr signed_bound_a signed_bound_b.
  do split; first 3 by smt().

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
      rewrite incoeffB.
      rewrite _b_def _a_def /lift_array256.
      rewrite mapiE 1:/# mapiE 1:/# //=.
    + simplify.
      rewrite -ltzNge in k_tlb.
      rewrite lrp_def //=.
qed.

lemma poly_sub_ll : islossless Mprevec.poly_sub.
proof. 
  proc; while (0<= i <= 16) (16 - i); auto => />.
  inline Ops.iVPSUB_16u16.
  auto => />; smt().
  auto => />; smt().
qed.

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
              incoeff (to_sint res.[k]) = _a.[k] - _b.[k]] = 1%r
  by move => *; conseq poly_sub_ll (poly_sub_corr_h _a _b ab bb _ _).

require import NTTAlgebra.
lemma poly_csubq_corr_h ap :
      hoare[ Mprevec.poly_csubq :
             ap = lift_array256 rp /\
             pos_bound256_cxq rp 0 256 2
             ==>
             ap = lift_array256 res /\
             pos_bound256_cxq res 0 256 1 ].
proof.
  proc.
  while (ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 2 /\ pos_bound256_cxq rp 0 (16*i) 1 /\ 0 <= i <= 16 /\ forall k, 0 <= k < 16 => _qx16.[k] = Jkem_avx2.jqx16.[k]).
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
  move => &hr [#] H H0 H1 H2 H3 H4 H5 H6 *.
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
  move => &hr [#] 7? k *.
  case (_r{hr}.[k] \slt W16.zero).
    + rewrite initiE 1://= /= -/(W16.onew).
      apply getsignNeg.
    + rewrite W16.sltE ltzNge -W16.sleE initiE 1://= /=.
      apply getsignPos.
  auto => />.
  move => &hr [#] H H0 H1 H2 H3 H4 H5 H6 H7 *.
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
  rewrite (result_def (x %% 16)) //.
  rewrite fun_if fun_if.
  rewrite _r_def //.
  rewrite t_def //.
  case (16 * i{hr} <= x < 16 * i{hr} + 16); first last.
  trivial.
  move => x_i.
  case (_r{hr}.[x %% 16] \slt W16.zero).
  rewrite (W16.WRingA.addrC _qx16{hr}.[_] _).
  rewrite subrK.
  smt().
  rewrite add0r_s.
  move => _r_ub.
  rewrite to_sintD_small.
  move : pos_bound_2; rewrite /pos_bound256_cxq => bnd.
  move : (bnd (16 * i{hr} + x %% 16) _); first by smt().
  auto => />.
  rewrite qE => /> *.
  split.
  
  (****)
  rewrite to_sintN => //=.
  rewrite (_qx16_def (x%% 16))  => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite of_sintK /= /smod.
  have ->: Ring.IntID.(^) 2 (16 - 1) <= 3329 <=> false. smt().
  simplify.
  smt().
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  simplify.
  do rewrite (fun_if ((+) (to_sint rp{hr}.[16 * i{hr} + x %% 16])) _ _ _).
  smt().
  (****)
  
  rewrite to_sintN => //=.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite of_sintK /= /smod.
  smt().
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite of_sintK /= /smod.
  smt().
  (****)
  
  rewrite _qx16_def => //=.
  rewrite (_: rp{hr}.[16 * i{hr} + x %% 16] = rp{hr}.[x]).
    by move : x_i x_mb => /#.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite incoeffD. ring.
  do rewrite (fun_if incoeff _ _ _).
  do rewrite (fun_if Zq.([-]) _ _ _).
  rewrite to_sintE /smod to_uintN => />.
  
  (***)
  have zero_congr_3329: 3329 %% q = 0.
    by rewrite qE; smt().
  rewrite incoeffN /zero /=.
  have ->: - - incoeff 3329 = incoeff 3329. do rewrite -incoeffN /= asintK //=.
  rewrite -incoeffN.
  do rewrite -(fun_if incoeff _ _ _). 
  have -> : NTTequiv.BigFq.CR.ofint 0 = incoeff 0 by rewrite /ofint /intmul /= /iterop /= iteri0 //=.
  rewrite -eq_incoeff.
  move : zero_congr_3329 x_mb => /#.
  
  (****)
  move : pos_bound_2 pos_bound_1; rewrite /pos_bound256_cxq => /> H H0.
  split.
  move => k k_lb k_ub.
  have k_mb : 0 <= k %% 16 && k %% 16 < 16.
    move : k_lb k_ub => /#.
  rewrite filliE => />.
  rewrite (result_def (k %% 16)) //.
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
  rewrite idx_bounds /= qE /=.
  smt().

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
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  do rewrite of_sintK.
  simplify.
  rewrite /smod.
  simplify.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds /= qE /=.
  smt().
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  do rewrite of_sintK.
  rewrite /smod /=.
  smt().
  
  (******)
  rewrite to_sintD_small => />.
  rewrite to_sintN => />.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  do rewrite of_sintK => />.
  rewrite /smod => />.
  smt().
  split.
  
  (******)
  move : _r_lb.
  rewrite _r_def => //.
  rewrite sltE.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  rewrite to_sintB_small.
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds.
  simplify.
  rewrite qE.
  simplify.
  smt().
  do rewrite fun_if.
  rewrite of_sintK /=.
  rewrite /smod /=.
  rewrite to_sintE /=.
  move => *.
  smt().
  (******)
  
  move => rp_qx16_lb.
  
  (******)
  move : _r_lb.
  rewrite _r_def => //.
  rewrite sltE.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
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
  rewrite to_sintE.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds /= qE /=.
  smt().

  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite to_sintN /=.
    rewrite /smod => />.
  rewrite /smod /=.
  move => rp_q_lb.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds /= qE /=.
  smt().
  
  (******)
  split; last by smt().
  move => k k_lb k_ub.
  have k_mb : 0 <= k %% 16 && k %% 16 < 16.
    move : k_lb k_ub => /#.
  rewrite filliE => />.
  move : i_ub k_ub => /#.
  rewrite (result_def (k %% 16)) //.
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
  rewrite idx_bounds //=.
  
  (******)
  move => rp_lb.
  rewrite _r_def in _r_ub => //.
  move : _r_ub.
  rewrite sltE.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  rewrite to_sintB_small.
  do rewrite fun_if.
  rewrite of_sintK.
  rewrite /smod /=.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds => /> *.
  smt().
  do rewrite fun_if.
  rewrite of_sintK /=.
  rewrite /smod /=.
  rewrite to_sintE /=.
  rewrite /smod /=.
  move => *.
  smt().
  
  (******)
  move => _r_lb.
  rewrite _r_def in _r_lb.
  auto => />.
  split.
  
  (******)
  move : _r_lb.
  rewrite sltE.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  rewrite to_sintB_small.
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds => /> *.
  smt().
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  rewrite to_sintE /= /smod /=.
  move => *.
  smt().
  (******)
  
  move => _sr_lb.
  simplify.
  rewrite to_sintD_small => />.
  rewrite to_sintN => />.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite of_sintK => />.
  rewrite /smod => />.
  smt().
  split.
  
  (******)
  move : _r_lb.
  rewrite sltE.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  rewrite to_sintB_small.
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds => /> *.
  smt().
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  rewrite to_sintE /smod /=.
  move => *.
  smt().
  
  (******)
  move => rp_qx16_lb.
  move : _r_lb.
  rewrite sltE.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  rewrite to_sintB_small.
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds => /> *.
  smt().

  move : _sr_lb rp_qx16_lb.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  rewrite to_sintB_small.
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds => /> *.
  smt().
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  move => rp_qx16_lb_0 rp_qx16_lb_word.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds => /> *.
  smt().
  
  rewrite qE.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite to_sintN of_sintK => />.
  rewrite /smod => />.
  
  move : _r_lb.
  rewrite sltE.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  rewrite to_sintB_small.
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds => /> *.
  smt().

  move => rp_q_lb_neg.
  move : _sr_lb.
  rewrite _qx16_def => //=.
  rewrite /(Jkem_avx2.jqx16).
  rewrite get_of_list => />.
  rewrite to_sintB_small.
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds => /> *.
  smt().
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  move => rp_q_lb.
  move : H H0 rp_q_lb_neg rp_q_lb; rewrite qE => />.
  trivial.
  move => rp_2q_bnd rp_q_bnd rp_q_lb_neg rp_q_lb.
  move : (rp_2q_bnd (16 * i{hr} + k %% 16)).
  rewrite idx_bounds => />.
  smt().
  (******)
  
  auto => />.
  move => &hr *.
  split.
  split. smt().
  
  move => k k_lb k_ub.
  rewrite /lift2poly initiE => />.
  rewrite /get256_direct => />.
  rewrite k_lb k_ub => /=.
  rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
  rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
  rewrite initiE. move : k_lb k_ub => /#. simplify.
  rewrite initiE. move : k_lb k_ub => /#. simplify.
  rewrite (_:(2*k + 1) %/2 = 2*k %/ 2).
    smt().
  rewrite (_: 2*k %% 2 = 0).
    smt().
  rewrite (_: (2*k + 1) %% 2 = 1).
    smt().
  rewrite pack2_bits8.
  smt().
  move => i0 rp0.
  auto => /> /#.
qed.

lemma poly_csubq_ll : islossless Mprevec.poly_csubq.
proof. 
  proc.
  while (0 <= i <= 16) (16 - i); auto => />.
  inline Ops.iVPSUB_16u16 Ops.iVPSRA_16u16 Ops.iVPAND_16u16 Ops.iVPADD_16u16.
  auto => />.
  smt().
  smt().
qed.

lemma poly_csubq_corr ap :
      phoare[ Mprevec.poly_csubq :
           ap = lift_array256 rp /\
           pos_bound256_cxq rp 0 256 2
           ==>
           ap = lift_array256 res /\
           pos_bound256_cxq res 0 256 1 ] = 1%r by 
  by conseq poly_csubq_ll (poly_csubq_corr_h ap).

lemma poly_reduce_corr_h (ap: coeff Array256.t):
     hoare[ Mprevec.poly_reduce :
          ap = lift_array256 rp ==>
          ap = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16 res.[k] (2*q)].
proof. 
  proc.
  while (0 <= i <= 16 /\
         (forall k, 0 <= k < 256 => ap.[k] = incoeff (to_sint rp.[k])) /\
         (forall k, 0 <= k < 16 * i => bpos16 rp.[k] (2*q)) /\
         (forall k, 0 <= k < 16 => qx16.[k] = Jkem_avx2.jqx16.[k]) /\
         (forall k, 0 <= k < 16 => vx16.[k] = Jkem_avx2.jvx16.[k])); last first.
  wp. skip.
  move => &hr ap_def />.
  do split.
  rewrite ap_def /lift_array256 => k k_lb k_ub.
  rewrite mapiE 1:/# //=.
  
  smt().
  
  move => k k_lb k_ub.
  rewrite /lift2poly initiE => />.
  rewrite /get256_direct => />.
  rewrite k_lb k_ub => /=.
  rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
  rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
  rewrite initiE. move : k_lb k_ub => /#. simplify.
  rewrite initiE. move : k_lb k_ub => /#. simplify.
  rewrite (_:(2*k + 1) %/2 = 2*k %/ 2).
    smt().
  rewrite (_: 2*k %% 2 = 0).
    smt().
  rewrite (_: (2*k + 1) %% 2 = 1).
    smt().
  rewrite pack2_bits8.
  smt().
  
  move => k k_lb k_ub.
  rewrite /lift2poly initiE => />.
  rewrite /get256_direct => />.
  rewrite k_lb k_ub => /=.
  rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
  rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
  rewrite initiE. move : k_lb k_ub => /#. simplify.
  rewrite initiE. move : k_lb k_ub => /#. simplify.
  rewrite (_:(2*k + 1) %/2 = 2*k %/ 2).
    smt().
  rewrite (_: 2*k %% 2 = 0).
    smt().
  rewrite (_: (2*k + 1) %% 2 = 1).
    smt().
  rewrite pack2_bits8.
  smt().
  
  move => i rpu i_tlb i_lb i_ub.
  have ->: i=16. by move : i_tlb i_ub => /#.
  simplify.
  move => ap_eq_rpu rpu_bnds jqx16_def vx16_def.
  split.
    + apply Array256.ext_eq => x x_i.
      rewrite /lift_array256 mapiE 1:x_i /= ap_eq_rpu 1:x_i //=.
    + move : rpu_bnds => /#.
  
  wp; sp; ecall (Fq_avx2.barret_red16x_corr_hh (Fq_avx2.lift_array16 r)). auto => />.
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
      rewrite eq_incoeff in bred_cgr.
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
qed.

lemma poly_reduce_ll:
  islossless Mprevec.poly_reduce.
proof. 
  proc; while(0 <= i <= 16) (16 - i);
    move => *; inline *; auto => />.
  move => &hr i_lb i_ub i_tub.
  split.
  move : i_lb i_tub => /#.
  smt().
  smt().
qed.

lemma poly_reduce_corr ap:
  phoare[ Mprevec.poly_reduce :
        ap = lift_array256 rp ==>
        ap = lift_array256 res /\
        forall k, 0 <= k < 256 => bpos16 res.[k] (2*q)] = 1%r.
proof.  by conseq poly_reduce_ll (poly_reduce_corr_h ap). qed.

lemma poly_frommont_corr_h ap:
  hoare[ Mprevec.poly_frommont :
       ap = map W16.to_sint rp ==>
       map W16.to_sint res = map (fun x => SREDC (x * ((Ring.IntID.(^) SignedReductions.R 2) %% q))) ap].
proof. 
  proc.
  while(0 <= i <= 16 /\ aux = 16 /\
        (forall k, 0 <= k < 16 => dmontx16.[k] = W16.of_int 1353) /\
        (forall k, 0 <= k < 16 => qx16.[k] = W16.of_int 3329) /\
        (forall k, 0 <= k < 16 => qinvx16.[k] = W16.of_int (-3327)) /\
        (forall k, 0 <= k < 16 * i => W16.to_sint rp.[k] = SREDC (ap.[k] * ((Ring.IntID.(^) SignedReductions.R 2) %% q))) /\
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
    by smt().
  rewrite (_: 2 * k %% 2 = 0).
    by smt().
  rewrite (_: (2 * k + 1) %% 2 = 1).
    by smt().
  rewrite pack2_bits8.
  rewrite /(Jkem_avx2.jdmontx16) => />.
  rewrite initiE => />. move : k_lb k_ub => /#.
  smt().
  
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
    by smt().
  rewrite (_: 2 * k %% 2 = 0).
    by smt().
  rewrite (_: (2 * k + 1) %% 2 = 1).
    by smt().
  rewrite pack2_bits8.
  rewrite /(Jkem_avx2.jqx16) => />.
  rewrite initiE => />. move : k_lb k_ub => /#.
  smt().
  
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
    by smt().
  rewrite (_: 2 * k %% 2 = 0).
    by smt().
  rewrite (_: (2 * k + 1) %% 2 = 1).
    by smt().
  rewrite pack2_bits8.
  rewrite initiE => />. move : k_lb k_ub => /#.
  smt().
  
  smt().
  smt(Array256.mapiE).
  move => i rp i_tlb i_lb i_ub jdmontx16_def jqinvx16_def jqx16_def rp_sredc rp_sint_rp0.
  apply Array256.ext_eq.
  move => x x_bnds.
  do rewrite mapiE //=.
  rewrite -lezNgt in i_tlb.
  rewrite (rp_sredc x).
  move : i_tlb i_ub x_bnds => /#.
  rewrite mapiE //.
  sp. wp.
  ecall (Fq_avx2.fqmulx16_corr_hh (Fq_avx2.lift_array16 t) (Fq_avx2.lift_array16 dmontx16)).
  auto => />.
  move => &hr i_lb i_ub dmontx16_def qx16_def qinvx16_def rp_sredc rp_eq_ap i_tub result result_def.
  split.
  move : i_lb i_tub => /#.
  
  rewrite fillE.
  split.
  
  move => k k_lb k_ub.
  have k_mb: 0 <= k %% 16 < 16.
    by smt().
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
qed.

lemma poly_frommont_ll : islossless  Mprevec.poly_frommont.
proof. 
  proc.
  auto => />.
  cfold 4. wp; while (0 <= i <= 16) (16 - i).
  + move => *; inline*; auto => />. smt().
  + inline *; wp; auto => /> /#.
qed.

lemma poly_frommont_corr ap:
  phoare[ Mprevec.poly_frommont :
       ap = map W16.to_sint rp ==>
       map W16.to_sint res = map (fun x => SREDC (x * ((Ring.IntID.(^) SignedReductions.R 2) %% q))) ap] = 1%r
 by conseq poly_frommont_ll (poly_frommont_corr_h ap) => />.

lemma array32_of_list16 (m : W8.t list) :
  Array32.init (fun (x : int) => (Array16.of_list witness m).[x %% 16]) = Array32.init (fun (x : int) => nth witness m (x %% 16)).
proof.
apply: Array32.ext_eq => x x_range.
rewrite !initiE // /=.
apply: Array16.get_of_list.
smt().
qed.

lemma poly_decompress_corr mem _p (_a : W8.t Array128.t): 
    equiv [ Mprevec.poly_decompress ~ EncDec_AVX2.decode4 :
            valid_ptr _p 128 /\
            Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
            load_array128 Glob.mem{1} _p = _a /\ a{2} = _a
             ==>
            Glob.mem{1} = mem /\
            lift_array256 res{1} = decompress_poly 4 res{2} /\
            pos_bound256_cxq res{1} 0 256 1].
proof.
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
          rewrite /(Jkem_avx2.jqx16) /=.
          do (rewrite initiE 1:/# /=). smt().
        + move => k k_lb k_ub.
          rewrite /(pd_mask_s) /=.
          do (rewrite initiE 1:/# /=).
          rewrite /(Jkem_avx2.pc_mask_s) /of_int.
          apply W16.wordP => x x_i.
          rewrite bits16E initiE 1:x_i /=.
          rewrite /int2bs /= /mkseq -iotaredE /= /bits2w /=.
          case (k %% 2 = 0) => k_even.
            + do (rewrite initiE 1:/# /=).
              smt().
            + do (rewrite initiE 1:/# /=).
              smt().
        + move => k k_lb k_ub.
          rewrite /(Jkem_avx2.pd_shift_s) /=.
          do (rewrite initiE 1:/# /=).
          rewrite /of_int.
          apply W16.wordP => x x_i.
          rewrite bits16E initiE 1:x_i /=.
          rewrite /int2bs /= /mkseq -iotaredE /= /bits2w /=.
          case (k %% 2 = 0) => k_even.
            + do (rewrite initiE 1:/# /=).
              smt().
            + do (rewrite initiE 1:/# /=).
              smt().
        + move => k k_lb k_ub.
          rewrite /(Jkem_avx2.pd_jshufbidx) /=.
          do (rewrite initiE 1:/# /=).
          smt().
  while (#pre /\ i{1} = i{2} /\ 0 <= i{1} <= 16 /\
         (forall k, 0 <= k < 16 * i{1} => incoeff (to_sint rp{1}.[k]) = decompress 4 r{2}.[k] /\
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
        rewrite array32_of_list16.
        rewrite (_: (Array32.init (fun (i1 : int) =>
                                  if 128 <= to_uint shufbidx{1}.[i1] then W8.zero
                                  else (Array32.init (fun (x3 : int) =>
                                   nth witness
                                     [mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64)];
                                      mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 1];
                                      mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 2];
                                      mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 3];
                                      mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 4];
                                      mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 5];
                                      mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 6];
                                      mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 7];
                                      W8.zero; W8.zero; W8.zero; W8.zero; W8.zero; W8.zero; W8.zero; W8.zero]
                                  (x3 %% 16))).[16 * (i1 %/ 16) + to_uint shufbidx{1}.[i1] %% 16])) =
                    (Array32.init (fun (i0 : int) => mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + i0 %/ 4]))).
          apply Array32.ext_eq => x x_i.
          do (rewrite (Array32.initiE _ x) 1:x_i /=).
          rewrite initiE 1:/# /=.
          rewrite (shufbidx_def x x_i).
          have ->: !(128 <= W8.to_uint ((W8.of_int (x %/ 4)))).
            move : x_i => /#.
          simplify.
          smt().
        rewrite (_: (W2u8.Pack.init (fun (j: int) =>
                                       (Array32.init (fun (i0 : int) => mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + i0 %/ 4])).[2 * (k %% 16) + j])) =
                     
                    (W2u8.Pack.init (fun (j: int) => mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + (2 * (k %% 16)) %/ 4]))).
          apply W2u8.Pack.ext_eq => x x_i.
          do (rewrite initiE 1:/# /=).
          smt().
        split.
          congr.
          rewrite /round_scalew /round => />.
          rewrite /truncateu16.
          rewrite to_uintD.
          rewrite of_uintK (pmod_small _ W64.modulus). by move : ap_lb ap_ub i_lb i_ub => /#.
          rewrite shift_def 1:/# q_def 1:/# mask_def 1:/# modz_dvd //.
          rewrite (W16.of_sintK 3329) /smod //=.
          rewrite (pmod_small _ W64.modulus). by move : i_lb i_ub => /#.
          pose b := pack2_t (W2u8.Pack.init (fun (_ : int) => mem.[to_uint ap{1} + 8 * i{2} + 2 * (k %% 16) %/ 4])).
          case ((k %% 2) = 0) => k_even.
            + rewrite (_: pc_mask_s = (W16.of_int (2^4 - 1))). simplify. done.
              rewrite W16.and_mod 1://.
              rewrite /q.
              rewrite to_sintM_small.
                rewrite (W16.of_sintK 2048) //= /(W16.smod 2048) //=.
                rewrite (Montgomery16.smod_small (to_uint b %% 16)). by move : (modz_cmp (to_uint b) 16) => /#.
                by move : (modz_cmp (to_uint b) 16) => /#.
              rewrite (W16.of_sintK (W16.to_uint b %% 2^4)) //= (Montgomery16.smod_small (to_uint b %% 16)). by move : (modz_cmp (to_uint b) 16) => /#.
              rewrite /(W16.smod 2048) //=.
              do rewrite shr_shrw 1://=.
              rewrite shrDP 1://=.
              rewrite (pmod_small _ W32.modulus). by smt().
              rewrite (_: ((to_uint b %% 2 ^ 4) * 2048 * 3329 %/ 2 ^ 14) = (to_uint b %% 2 ^ 4) * 3329 %/ 2 ^ 3). smt().
              rewrite -of_intD shrDP 1://= of_uintK.
              do (rewrite (pmod_small _ W32.modulus); first by smt()).
              rewrite (_: (to_uint b %% 2 ^ 4 * 3329 %/ 2 ^ 3 + 1) %/ 2 ^ 1 = (8 + to_uint b %% 2 ^ 4 * 3329) %/ 2 ^ 4); first by smt().
              rewrite (pmod_small _ W16.modulus); first by smt().
              rewrite (_: W16.smod ((8 + to_uint b %% 16 * 3329) %/ 2 ^ 4) = (8 + to_uint b %% 16 * 3329) %/ 2 ^ 4).
                move : (modz_cmp (to_uint b) 16) => />.
                rewrite /smod.
                smt().
              rewrite (_: to_uint b %% 16 = to_uint (b `&` (W16.of_int W8.max_uint)) %% 16).
                rewrite W16.and_mod 1://=.
                rewrite of_uintK (pmod_small _ W16.modulus) 1:/#.
                smt().
              rewrite -zeroext_truncateu8_and.
              rewrite to_uint_zeroextu16.
              rewrite (_: to_uint (truncateu8 b) = to_uint mem.[to_uint ap{1} + 8 * i{2} + 2 * (k %% 16) %/ 4]). (* can be simplified *)
                rewrite to_uint_truncateu8 //=.
                rewrite -(divz1 (to_uint b)) -(Ring.IntID.expr0 2) (_: 0 = 8 * 0) 1://=.
                rewrite -(W8.of_uintK (to_uint b %/ 2 ^ (8 * 0))) -W2u8.of_int_bits8_div 1://=.
                rewrite to_uintK.
                rewrite -get_unpack8 1://= pack2K initiE 1://= //=.
              rewrite (_: 2 * (k %% 16) %/ 4 = k %% 16 %/ 2). smt().
              rewrite (addzC 8 _).
              do (rewrite get_setE 1:/#).
              smt().
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
                    smt().
                 done.
              rewrite W16.and_mod 1://=.
              rewrite /q.
              rewrite shlMP 1://=.
              rewrite to_sintM_small.
                rewrite (W16.of_sintK 128) /smod //=.
                rewrite (Montgomery16.smod_small (to_uint (b `>>>` 4) %% 2 ^ 4 * 2^4)).
                  rewrite /smod /=.
                  smt(pmod_small @Int @IntDiv @Ring.IntID).
                smt(pmod_small @Int @IntDiv @Ring.IntID).
              rewrite (W16.of_sintK 128) (Montgomery16.smod_small 128). smt().
              rewrite of_sintK (Montgomery16.smod_small (to_uint (b `>>>` 4) %% 16 * 16)). by move : (modz_cmp (W16.to_uint (b `>>>` 4)) 16) => /#.
              rewrite (mulzA _ (2^4) 128) //=.
              do rewrite shr_shrw 1://=.
              rewrite shrDP 1://=.
              rewrite -of_intD shrDP 1://= of_uintK.
              rewrite (pmod_small (to_uint (b `>>>` 4) %% 16 * 2048 * 3329) W32.modulus); first by smt().
              rewrite (_: to_uint (b `>>>` 4) %% 16 * 2048 * 3329 %/ 2 ^ 14 =  to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3).
                smt().
              rewrite (pmod_small _ W32.modulus); first by smt().
              rewrite (pmod_small _ W32.modulus); first by smt().
              rewrite (_: (to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3 + 1) %/ 2 ^ 1 = (8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4).
                smt().
              rewrite Montgomery16.smod_small.
                move : (modz_cmp (to_uint (b `>>>` 4)) 16) => />.
                smt().
              rewrite (_: (to_uint (b `>>>` 4) %% 16) = to_uint mem.[to_uint ap{1} + 8 * i{2} + 2 * (k %% 16) %/ 4] %/ 16). (* can be simplified *)
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
                rewrite (pmod_small _ W16.modulus); first by smt().
                rewrite modz_mod.
                rewrite (pmod_small _ W16.modulus); first by  smt().
                rewrite -(divz1 (to_uint b)) -(Ring.IntID.expr0 2) (_: 0 = 8 * 0) 1://=.
                rewrite -(W8.of_uintK (to_uint b %/ 2 ^ (8 * 0))) -W2u8.of_int_bits8_div 1://=.
                rewrite to_uintK.
                rewrite -get_unpack8 1://= pack2K initiE 1://= //=.
              rewrite (_: 2 * (k %% 16) %/ 4 = k %% 16 %/ 2). smt().
              rewrite (addzC 8 _).
              do (rewrite get_setE 1:/#).
              smt().
        rewrite /round_scalew /round => />.
        rewrite /truncateu16.
        rewrite to_uintD.
        rewrite of_uintK (pmod_small _ W64.modulus). by move : ap_lb ap_ub i_lb i_ub => /#.
        rewrite shift_def 1:/# q_def 1:/# mask_def 1:/# modz_dvd //.
        rewrite (W16.of_sintK 3329) /(W16.smod 3329) //=.
          rewrite (pmod_small _ W64.modulus). by move : i_lb i_ub => /#.
        pose b := pack2_t ((W2u8.Pack.init (fun (_ : int) => mem.[to_uint ap{1} + 8 * i{2} + 2 * (k %% 16) %/ 4]))).
        case ((k %% 2) = 0) => k_even.
            + rewrite (_: pc_mask_s = (W16.of_int (2^4 - 1))). simplify. done.
              rewrite W16.and_mod 1://.
              rewrite /q.
              rewrite to_sintM_small.
                rewrite (W16.of_sintK 2048) //= /(W16.smod 2048) //=.
                rewrite (Montgomery16.smod_small (to_uint b %% 16)). by move : (modz_cmp (to_uint b) 16) => /#.
                by move : (modz_cmp (to_uint b) 16) => /#.
              rewrite (W16.of_sintK (W16.to_uint b %% 2^4)) //= (Montgomery16.smod_small (to_uint b %% 16)). by move : (modz_cmp (to_uint b) 16) => /#.
              rewrite /(W16.smod 2048) //=.
              rewrite /(W16.smod 3329) //=.
              do rewrite shr_shrw 1://=.
              rewrite shrDP 1://=.
              rewrite (pmod_small _ W32.modulus). by smt().
              rewrite (_: ((to_uint b %% 2 ^ 4) * 2048 * 3329 %/ 2 ^ 14) = (to_uint b %% 2 ^ 4) * 3329 %/ 2 ^ 3). smt().
              rewrite -of_intD.
              rewrite shrDP 1://= of_uintK.
              do (rewrite (pmod_small _ W32.modulus); first by smt()).
              rewrite (pmod_small _ W16.modulus); first by smt().
              rewrite (_: (to_uint b %% 2 ^ 4 * 3329 %/ 2 ^ 3 + 1) %/ 2 ^ 1 = (8 + to_uint b %% 2 ^ 4 * 3329) %/ 2 ^ 4).
                smt().
              rewrite (_: W16.smod ((8 + to_uint b %% 16 * 3329) %/ 2 ^ 4) = ((8 + to_uint b %% 16 * 3329) %/ 2 ^ 4)).
                move : (modz_cmp (to_uint b) 16) => />.
                rewrite /smod.
                smt().
              move : (modz_cmp (to_uint b) 16) => />.
              smt().
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
                    smt().
                 done.
              rewrite W16.and_mod 1://=.
              rewrite /q.
              rewrite shlMP 1://=.
              rewrite to_sintM_small.
                rewrite (W16.of_sintK 128) /smod //=.
                rewrite (_: W16.smod (to_uint (b `>>>` 4) %% 2 ^ 4 * 2^4 %% W16.modulus) = to_uint (b `>>>` 4) %% 2 ^ 4 * 2^4).
                  rewrite /smod /=.
                  smt(pmod_small @Int @IntDiv @Ring.IntID).
                smt(pmod_small @Int @IntDiv @Ring.IntID).
              rewrite (W16.of_sintK 128) /(W16.smod 128) //=.
              rewrite (Montgomery16.smod_small (to_uint (b `>>>` 4) %% 16 * 16)). by move : (modz_cmp (W16.to_uint (b `>>>` 4)) 16) => /#.
              rewrite /(W16.smod 3329) //=.
              rewrite (mulzA _ (2^4) 128) //=.
              do rewrite shr_shrw 1://=.
              rewrite shrDP 1://=.
              rewrite -of_intD shrDP 1://= of_uintK.
              do (rewrite (modz_dvd _ W32.modulus W16.modulus) 1://=).
              rewrite (pmod_small (to_uint (b `>>>` 4) %% 16 * 2048 * 3329) W32.modulus); first by smt().
              rewrite (_: to_uint (b `>>>` 4) %% 16 * 2048 * 3329 %/ 2 ^ 14 =  to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3).
                smt().
              rewrite (pmod_small _ W32.modulus); first by smt().
              rewrite (_: (to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3 + 1) %/ 2 ^ 1 = (8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4).
                smt().
              rewrite Montgomery16.smod_small.
                move : (modz_cmp (to_uint (b `>>>` 4)) 16) => />.
                smt().
              move : (modz_cmp (to_uint b) 16) => />.
              smt().
        rewrite -ltzNge in k_tlb.
        split.
          move : (rp_def k).
          rewrite -decompress_alt_decompress 1,2://= /decompress_alt k_lb k_tlb /=.
          move => [#] -> _ _.
          do (rewrite get_setE 1:/#).
          smt().
          move : (rp_def k) => /#.
  wp.
  auto => />.
  move => &1 &2 [#]*.
  split.
    smt().
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
qed.

lemma poly_compress_1_corr _a mem :
    equiv [ Mprevec.poly_compress_1 ~ EncDec_AVX2.encode4 :
             pos_bound256_cxq a{1} 0 256 2 /\
             lift_array256 a{1} = _a /\
             p{2} = compress_poly 4 _a /\
             Glob.mem{1} = mem
              ==>
             Glob.mem{1} = mem /\
             lift_array256 res{1}.`2 = _a /\
             pos_bound256_cxq res{1}.`2 0 256 1 /\
             res{1}.`1 = res{2}].
proof.
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
  move => &1 [#] pos_bound_a.
  do split.
    + move => k k_lb k_ub.
      rewrite /(Jkem_avx2.jvx16) /=.
      do (rewrite initiE 1:/# /=). smt().
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
    + move => k k_lb k_ub.
      rewrite /f16u16_t32u8 /=.
      do (rewrite initiE 1:/# /=).
      rewrite shlMP 1:/# /=.
      rewrite /(Jkem_avx2.pc_shift2_s) /of_int.
      apply W8.wordP => x x_i.
      rewrite bits8E initiE 1:x_i /=.
      rewrite /int2bs /= /mkseq -iotaredE /= /bits2w /=.
      rewrite initiE 1:/# initiE 1:x_i.
      do (rewrite (pmod_small _ 256)).
        move : (modz_cmp k 2); rewrite exprM /=.
        rewrite andabP  => /(mem_iota 0 2 (k %% 2)).
        move : (k %% 2); rewrite -List.allP -iotaredE //=.
      case (k %% 2 = 0) => k_even.
        + rewrite k_even /=.
          smt().
        + have ->: (k %% 2 = 1). move : k_even => /#.
          simplify.
          smt().
    + move => k k_lb k_ub.
      rewrite /(Jkem_avx2.pc_permidx_s) /=.
      do (rewrite initiE 1:/# /=).
      smt().
    wp.
    while (#{/~mem}{~i{1}=0}pre /\ i{1} = i{2} /\ 0 <= i{1} <= 4 /\
           (forall k, 0 <= k < 32 * i{1} => rp{1}.[k] = r{2}.[k])).
    + auto => />.
      move => &1 &2 [#] a_def p_def pos_bound_a _a_def i_eq v_def shift1_def mask1_def shift2_b_def permidx_def i1_eq_i2 i1_lb i1_ub r_eq_sub i1_tub i2_tub mem1 r1 [#] i2_n_lb i2_n_ub r_eq i2_n i1_n />.
      rewrite /i1_n /i2_n i1_eq_i2 /=.
      do split; first 3 by assumption.
    seq 16 0 : (#pre /\
                (forall k, 0 <= k < 16 => W16.to_sint f0{1}.[k] = compress 4 _a.[64*i{1} + k]) /\
                (forall k, 0 <= k < 16 => W16.to_sint f1{1}.[k] = compress 4 _a.[64*i{1} + 16 + k]) /\
                (forall k, 0 <= k < 16 => W16.to_sint f2{1}.[k] = compress 4 _a.[64*i{1} + 32 + k]) /\
                (forall k, 0 <= k < 16 => W16.to_sint f3{1}.[k] = compress 4 _a.[64*i{1} + 48 + k])).
    inline *.
    wp; skip; auto => />.
    move => &1 &2 [#] pos_bound_a v_def shift1_def mask1_def shift2_b_def permidx_def i_lb i_ub r_up i_tub />.
    do split.
    + move => k k_lb k_ub.
      do (rewrite initiE /=; first by rewrite k_lb k_ub).
      rewrite compress_alt_nice.
      rewrite /lift_array256 mapiE 1:/# /= incoeffK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite /(W16.smod 20159) //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite /(W16.smod 512) //= (_: 512 = 2 ^ 9) 1://=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite (W16.to_sintE (W16.of_int _)) of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt().
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
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
        smt().
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + k)).
      rewrite (_: 0 <= 64 * i{2} + k && 64 * i{2} + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + k])).
      move : (to_sint a{1}.[64 * i{2} + k]). apply /List.allP. rewrite /range iota_iota_red.
      cbv delta; done.
    + move => k k_lb k_ub.
      do (rewrite initiE /=; first by rewrite k_lb k_ub).
      rewrite compress_alt_nice.
      rewrite /lift_array256 mapiE 1:/# /= incoeffK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite /(W16.smod 20159) //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + 16 + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite /(W16.smod 512) //= (_: 512 = 2 ^ 9) 1://=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + 16 + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite (W16.to_sintE (W16.of_int _)) of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + 16 + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt().
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
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
        smt().
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + 16 + k)).
      rewrite (_: 0 <= 64 * i{2} + 16 + k && 64 * i{2} + 16 + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + 16 + k])).
      move : (to_sint a{1}.[64 * i{2} + 16 + k]). apply /List.allP. rewrite /range iota_iota_red.
      cbv delta; done.
    + move => k k_lb k_ub.
      do (rewrite initiE /=; first by rewrite k_lb k_ub).
      rewrite compress_alt_nice.
      rewrite /lift_array256 mapiE 1:/# /= incoeffK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite /(W16.smod 20159) //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + 32 + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite /(W16.smod 512) //= (_: 512 = 2 ^ 9) 1://=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + 32 + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite (W16.to_sintE (W16.of_int _)) of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + 32 + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt().
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
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
        smt().
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + 32 + k)).
      rewrite (_: 0 <= 64 * i{2} + 32 + k && 64 * i{2} + 32 + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + 32 + k])).
      move : (to_sint a{1}.[64 * i{2} + 32 + k]). apply /List.allP. rewrite /range iota_iota_red.
      cbv delta; done.
    + move => k k_lb k_ub.
      do (rewrite initiE /=; first by rewrite k_lb k_ub).
      rewrite compress_alt_nice.
      rewrite /lift_array256 mapiE 1:/# /= incoeffK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite /(W16.smod 20159) //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + 48 + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite /(W16.smod 512) //= (_: 512 = 2 ^ 9) 1://=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + 48 + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite (W16.to_sintE (W16.of_int _)) of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + 48 + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt().
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
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
        smt().
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + 48 + k)).
      rewrite (_: 0 <= 64 * i{2} + 48 + k && 64 * i{2} + 48 + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + 48 + k])).
      move : (to_sint a{1}.[64 * i{2} + 48 + k]). apply /List.allP. rewrite /range iota_iota_red.
      cbv delta; done.

    inline *.
    unroll for {2} 2.
    auto => />.
    move => &1 &2 [#] pos_bound_a v_def shift1_def mask1_def shift2_b_def permidx_def i_lb i_ub r_up i_tub f0_def f1_def f2_def f3_def />.
    split; first by move : i_lb i_tub => /#.
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
        smt().
      do (rewrite set_neqiE; first 2 by move : x_si i_lb i_tub => /#).
      done.

    move => k.
    rewrite (mulzDr 32 i{2} 1) mulz1 => k_lb k_ub.
    rewrite filliE 1:/# filliE 1:/# //=.
    case (k < 32 * i{2}) => k_tub.
      rewrite lezNgt k_tub //= (r_up k) //=.
    move : k_tub; rewrite -lezNgt => k_tlb.
    rewrite k_tlb k_ub //=.
 

    do rewrite initiE 1:/# /=.
    rewrite -get_unpack8 1:/# pack4K.
    rewrite W4u8.Pack.initiE 1:/# /=.
    rewrite permidx_def 1:/#.
    rewrite of_uintK.
    rewrite modz_dvd 1://=.
    rewrite -(divz_mulp _ 4 2) 1..2://=.
    rewrite (_: (4 * (k %% 32 %/ 4 %% 2) + k %% 32 %/ (4 * 2)) %% 8 =
                k %% 8 - k %% 4 + k %/ 8 - 4 * i{2}).
      rewrite -(modz_pow2_div 3 2 _) 1://=.
      rewrite (mulzC 4 _) (divzE _ 4).
      rewrite modz_dvd 1://= modz_dvd 1://= //=.
      rewrite (pmod_small (Int.(+) _ _) 8). move : k_tlb k_ub; smt().
      move : k_tlb k_ub; smt().
    rewrite (modz_dvd _ 32 4) 1://=.
    rewrite (_: 4 * (k %% 8 - k %% 4 + (k %/ 8) - 4 * i{2}) + k %% 4 =  4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}).
      smt().
    do (rewrite initiE 1:/# //=).
    rewrite (_: (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}) %/ 8 %% 2 = (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8)) %% 16 %/ 8).
      rewrite (_: 2 = 2^1) 1://= {3}(_: 8 = 2^3) 1://=.
      rewrite -(modz_pow2_div 4 3) 1://= //=.
      rewrite (mulzC 16 _).
      smt().
    pose x := 4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}.
    rewrite (mulzDr 2 _ _) -(mulzA 2 _ _) //=.
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8)) %/ 8 %% 2 = x %% 8 %/ 4).
      smt().
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8) + 1) %/ 8 %% 2 = x %% 8 %/ 4).
      smt().
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8)) %/ 16 = (x %/ 16)).
      smt().
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8)) %% 8 = 2 * (x %% 8) %% 8).
      smt().
    rewrite (_: ((16 * (x %/ 16) + 2 * (x %% 8) + 1) %/ 16) = x %/ 16).
      smt().
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8) + 1) %% 8 = (2 * (x %% 8) + 1) %% 8).
      smt().
    rewrite /packus16.
    do (rewrite sltE sleE || rewrite of_sintK /smod //=).
    do (rewrite f0_def 1:/# f1_def 1:/# f2_def 1:/# f3_def 1:/#).
    do (rewrite /lift_array256 mapiE 1:/# //=).
    do (rewrite (_: forall c, !(compress 4 (incoeff c) < 0)); first by move => c; move : (MLKEM_Poly.compress_rng (incoeff c) 4); rewrite -lezNgt //=).
    do (rewrite (_: forall c, !(255 <= compress 4 (incoeff c))) /=; first by move => c; move : (MLKEM_Poly.compress_rng (incoeff c) 4); rewrite -ltzNge /= => /#).
    rewrite (_: 8 * (x %/ 16) + 2 * (x %% 8) %% 8 = 2 * (k %% 8)).
      have H: k \in (iota_ (32 * i{2}) 32); first by rewrite mem_iota k_ub k_tlb.
      have H0: i{2} \in (iota_ 0 4); first by rewrite mem_iota i_tub i_lb.
      move : H0 H.
      rewrite /x.
      smt().
    rewrite (_: 8 * (x %/ 16) + (2 * (x %% 8) + 1) %% 8 = 2 * (k %% 8) + 1).
      have H: k \in (iota_ (32 * i{2}) 32); first by rewrite mem_iota k_ub k_tlb.
      have H0: i{2} \in (iota_ 0 4); first by rewrite mem_iota i_tub i_lb.
      move : H0 H.
      rewrite /x.
      smt().
    do (rewrite shift2_b_def 1:/# /=).
    rewrite (_: 4 * ((16 * (x %/ 16) + 2 * (x %% 8) + 1) %% 2) = 4).
      smt().
    rewrite (_: 4 * ((16 * (x %/ 16) + 2 * (x %% 8)) %% 2) = 0).
      smt().
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
                (W16.of_int (compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)]))) \bits8 0)).
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
                (W16.of_int (compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1]))) \bits8 0)).
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
                (W16.of_int (compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)]))) \bits8 0)).
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
                (W16.of_int (compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1]))) \bits8 0)).
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
    have pck_bnds: forall (c1 c2: coeff),
                     0 <= (compress 4 c1) + (compress 4 c2) * 16 < 256.
        move => c1 c2.
        move : (MLKEM_Poly.compress_rng c1 4) (MLKEM_Poly.compress_rng c2 4) => />.
        smt().
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (MLKEM_Poly.compress_rng (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) 4) => />.
      smt(ltz_trans @Logic).
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (MLKEM_Poly.compress_rng (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) 4) => />.
      smt(ltz_trans @Logic).
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (MLKEM_Poly.compress_rng (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) 4) => />.
      smt(ltz_trans @Logic).
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (MLKEM_Poly.compress_rng (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) 4) => />.
      smt(ltz_trans @Logic).
    have spck_id: forall c1 c2, to_sint (packssw ((compress 4 c1) + (compress 4 c2) * 16)) = (compress 4 c1) + (compress 4 c2) * 16.
      rewrite /packssw => c1 c2.
      move : (pck_bnds c1 c2).
      do rewrite (fun_if W16.to_sint).
      simplify.
      rewrite /smod //=.
      pose tmp := compress 4 c1 + compress 4 c2 * 16.
      smt().
    have pck_id: forall c1 c2, packssw ((compress 4 c1) + (compress 4 c2) * 16) = W16.of_int ((compress 4 c1) + (compress 4 c2) * 16).
      rewrite /packssw => c1 c2.
      move : (pck_bnds c1 c2).
      smt().
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
      smt().
    do rewrite packusid.
    rewrite (_: (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8)) %% 16 %/ 8 = k %% 32 %/ 16).
      have H: k \in (iota_ (32 * i{2}) 32); first by rewrite mem_iota k_ub k_tlb.
      have H0: i{2} \in (iota_ 0 4); first by rewrite mem_iota i_tub i_lb.
      move : H0 H.
      smt().
    rewrite -(fun_if W8.of_int).
    congr.
    have ->: (if k %% 32 %/ 16 = 0 then
                compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) +
                compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) * 16
              else
                compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) +
                compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) * 16) =
              compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 * (k %% 32 %/ 16) + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) +
              compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 * (k %% 32 %/ 16) + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) * 16.
      rewrite (_: k %% 32 %/ 16 = k %/ 16 %% 2).
        smt().
      case (k %/ 16 %% 2 = 0) => even.
        + rewrite even //=.
        + have -> /=: k %/ 16 %% 2 = 1. move : even => /#.
      done.
    smt().

  skip.
  auto => />.
  move => &1 &2 [#]*.
  split.
    smt().
  move => rpL i r i_tlb _ i_lb i_ub.
  have -> //=: i = 4. by move : i_ub i_tlb => /#.
  apply Array128.ext_eq.
qed.


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
proof. 
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
      rewrite /(Jkem_avx2.jvx16) /=.
      do (rewrite initiE 1:/# /=). smt().
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
    + move => k k_lb k_ub.
      rewrite /f16u16_t32u8 /=.
      do (rewrite initiE 1:/# /=).
      rewrite shlMP 1:/# /=.
      rewrite /(Jkem_avx2.pc_shift2_s) /of_int.
      apply W8.wordP => x x_i.
      rewrite bits8E initiE 1:x_i /=.
      rewrite /int2bs /= /mkseq -iotaredE /= /bits2w /=.
      rewrite initiE 1:/# initiE 1:x_i.
      do (rewrite (pmod_small _ 256)).
        move : (modz_cmp k 2); rewrite exprM /=.
        rewrite andabP  => /(mem_iota 0 2 (k %% 2)).
        move : (k %% 2); rewrite -List.allP -iotaredE //=.
      case (k %% 2 = 0) => k_even.
        + rewrite k_even /=.
          smt().
        + have ->: (k %% 2 = 1). move : k_even => /#.    
          simplify.
          smt().
    + move => k k_lb k_ub.
      rewrite /(Jkem_avx2.pc_permidx_s) /=.
      do (rewrite initiE 1:/# /=).
      smt().
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
      rewrite /lift_array256 mapiE 1:/# /= incoeffK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite /(W16.smod 20159) //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite /(W16.smod 512) //= (_: 512 = 2 ^ 9) 1://=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite (W16.to_sintE (W16.of_int _)) of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt().
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
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
        smt().
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + k)).
      rewrite (_: 0 <= 64 * i{2} + k && 64 * i{2} + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + k])).
      move : (to_sint a{1}.[64 * i{2} + k]). apply /List.allP. rewrite /range iota_iota_red.
      cbv delta; done.
    + move => k k_lb k_ub.
      do (rewrite initiE /=; first by rewrite k_lb k_ub).
      rewrite compress_alt_nice.
      rewrite /lift_array256 mapiE 1:/# /= incoeffK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite /(W16.smod 20159) //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + 16 + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite /(W16.smod 512) //= (_: 512 = 2 ^ 9) 1://=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + 16 + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite (W16.to_sintE (W16.of_int _)) of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + 16 + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt().
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
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
        smt().
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + 16 + k)).
      rewrite (_: 0 <= 64 * i{2} + 16 + k && 64 * i{2} + 16 + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + 16 + k])).
      move : (to_sint a{1}.[64 * i{2} + 16 + k]). apply /List.allP. rewrite /range iota_iota_red.
      cbv delta; done.
    + move => k k_lb k_ub.
      do (rewrite initiE /=; first by rewrite k_lb k_ub).
      rewrite compress_alt_nice.
      rewrite /lift_array256 mapiE 1:/# /= incoeffK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite /(W16.smod 20159) //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + 32 + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite /(W16.smod 512) //= (_: 512 = 2 ^ 9) 1://=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + 32 + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite (W16.to_sintE (W16.of_int _)) of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + 32 + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt().
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
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
        smt().
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + 32 + k)).
      rewrite (_: 0 <= 64 * i{2} + 32 + k && 64 * i{2} + 32 + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + 32 + k])).
      move : (to_sint a{1}.[64 * i{2} + 32 + k]). apply /List.allP. rewrite /range iota_iota_red.
      cbv delta; done.
    + move => k k_lb k_ub.
      do (rewrite initiE /=; first by rewrite k_lb k_ub).
      rewrite compress_alt_nice.
      rewrite /lift_array256 mapiE 1:/# /= incoeffK.
      rewrite (v_def k) 1:/# (mask1_def k) 1:/# (shift1_def k) 1:/# qE.
      rewrite /wmulhs /round_scalew //=.
      do rewrite shr_shrw 1://=.
      rewrite /(W16.smod 20159) //= /truncateu16.
      rewrite (pmod_small (to_sint a{1}.[64 * i{2} + 48 + k]) 3329).
        move : pos_bound_a => /#.
      rewrite (_: pc_mask_s = W16.of_int (2^4 - 1)). smt().
      rewrite W16.and_mod 1://=.
      rewrite /(W16.smod 512) //= (_: 512 = 2 ^ 9) 1://=.
      do (rewrite -shlMP 1://= || rewrite W32.shlw_shrw_shrw 1://= //=).
      rewrite (_: (W32.masklsb 23) = (W32.of_int (2 ^ 23 - 1))); first by rewrite /max /=.
      rewrite W32.and_mod 1:/# of_uintK.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (to_sint a{1}.[64 * i{2} + 48 + k] * 20159 %/ 65536))) <= 1024.
        rewrite to_sint_unsigned.
          rewrite /pos_bound256_cxq /bpos16 in pos_bound_a.
          move : (pos_bound_a k).
          rewrite (W16.to_sintE (W16.of_int _)) of_uintK /smod /=.
        have ->: ! 32768 <= to_sint a{1}.[64 * i{2} + 48 + k] * 20159 %/ 65536 %% 65536.
          by move : pos_bound_a => /#.
        rewrite qE //=.
        smt().
        rewrite of_uintK.
        rewrite pmod_small. by move : pos_bound_a => /#.
        by move : (pos_bound_a k) => /#.
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
        smt().
      rewrite /pos_bound256_cxq /bpos16 qE in pos_bound_a.
      move : (pos_bound_a (64 * i{2} + 48 + k)).
      rewrite (_: 0 <= 64 * i{2} + 48 + k && 64 * i{2} + 48 + k < 256) //=. by move : i_lb i_tub k_lb k_ub => /#.
      rewrite andabP => /(mem_iota 0 3329 (to_sint a{1}.[64 * i{2} + 48 + k])).
      move : (to_sint a{1}.[64 * i{2} + 48 + k]). apply /List.allP. rewrite /range iota_iota_red.
      cbv delta; done.

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
      smt().
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
        smt().
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
      rewrite (_: (k - 32 * i{2}) %% 8 =  k %% 8). move : k_tlb k_ub; smt().
      rewrite (_: (k - 32 * i{2}) %% 4 =  k %% 4). move : k_tlb k_ub; smt().
      rewrite (pmod_small (k %% 8 - k %% 4 + (k - 32 * i{2}) %/ 8) 8). move : k_tlb k_ub; smt().
      move : k_tlb k_ub; smt().
    rewrite (_: (k - 32 * i{2}) %% 4 = k %% 4).
      smt().
    rewrite (_: 4 * (k %% 8 - k %% 4 + (k %/ 8) - 4 * i{2}) + k %% 4 =  4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}).
      smt().
    do (rewrite initiE 1:/# //=).
    rewrite (_: (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}) %/ 8 %% 2 = (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8)) %% 16 %/ 8).
      rewrite (_: 2 = 2^1) 1://= {3}(_: 8 = 2^3) 1://=.
      rewrite -(modz_pow2_div 4 3) 1://= //=.
      rewrite (mulzC 16 _).
      smt().
    pose x := 4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}.
    rewrite (mulzDr 2 _ _) -(mulzA 2 _ _) //=.
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8)) %/ 8 %% 2 = x %% 8 %/ 4).
      smt().
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8) + 1) %/ 8 %% 2 = x %% 8 %/ 4).
      smt().
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8)) %/ 16 = (x %/ 16)).
      smt().
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8)) %% 8 = 2 * (x %% 8) %% 8).
      smt().
    rewrite (_: ((16 * (x %/ 16) + 2 * (x %% 8) + 1) %/ 16) = x %/ 16).
      smt().
    rewrite (_: (16 * (x %/ 16) + 2 * (x %% 8) + 1) %% 8 = (2 * (x %% 8) + 1) %% 8).
      smt().
    rewrite /packus16.
    do (rewrite sltE sleE || rewrite of_sintK /smod //=).
    do (rewrite f0_def 1:/# f1_def 1:/# f2_def 1:/# f3_def 1:/#).
    do (rewrite /lift_array256 mapiE 1:/# //=).
    do (rewrite (_: forall c, !(compress 4 (incoeff c) < 0)); first by move => c; move : (MLKEM_Poly.compress_rng (incoeff c) 4); rewrite -lezNgt //=).
    do (rewrite (_: forall c, !(255 <= compress 4 (incoeff c))) /=; first by move => c; move : (MLKEM_Poly.compress_rng (incoeff c) 4); rewrite -ltzNge /= => /#).
    rewrite (_: 8 * (x %/ 16) + 2 * (x %% 8) %% 8 = 2 * (k %% 8)).
      have : k \in (iota_ (32 * i{2}) 32); first by rewrite mem_iota k_ub k_tlb.
      have : i{2} \in (iota_ 0 4); first by rewrite mem_iota i_tub i_lb.
      smt().
    rewrite (_: 8 * (x %/ 16) + (2 * (x %% 8) + 1) %% 8 = 2 * (k %% 8) + 1).
      have ?: k \in (iota_ (32 * i{2}) 32); first by rewrite mem_iota k_ub k_tlb.
      have ?: i{2} \in (iota_ 0 4); first by rewrite mem_iota i_tub i_lb.
      smt().
    do (rewrite shift2_b_def 1:/# /=).
    rewrite (_: 4 * ((16 * (x %/ 16) + 2 * (x %% 8) + 1) %% 2) = 4).
      smt().
    rewrite (_: 4 * ((16 * (x %/ 16) + 2 * (x %% 8)) %% 2) = 0).
      smt().
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
                (W16.of_int (compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)]))) \bits8 0)).
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
                (W16.of_int (compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1]))) \bits8 0)).
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
                (W16.of_int (compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)]))) \bits8 0)).
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
                (W16.of_int (compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1]))) \bits8 0)).
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
    have pck_bnds: forall (c1 c2: coeff),
                     0 <= (compress 4 c1) + (compress 4 c2) * 16 < 256.
        move => c1 c2.
        move : (MLKEM_Poly.compress_rng c1 4) (MLKEM_Poly.compress_rng c2 4) => />.
        smt().
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (MLKEM_Poly.compress_rng (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) 4) => />.
      smt(ltz_trans @Logic).
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (MLKEM_Poly.compress_rng (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) 4) => />.
      smt(ltz_trans @Logic).
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (MLKEM_Poly.compress_rng (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) 4) => />.
      smt(ltz_trans @Logic).
    rewrite of_uintK (pmod_small _ W8.modulus).
      move : (MLKEM_Poly.compress_rng (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) 4) => />.
      smt(ltz_trans @Logic).
    have spck_id: forall c1 c2, to_sint (packssw ((compress 4 c1) + (compress 4 c2) * 16)) = (compress 4 c1) + (compress 4 c2) * 16.
      rewrite /packssw => c1 c2.
      move : (pck_bnds c1 c2).
      do rewrite (fun_if W16.to_sint).
      simplify.
      rewrite /smod //=.
      pose tmp := compress 4 c1 + compress 4 c2 * 16.
      smt().
    have pck_id: forall c1 c2, packssw ((compress 4 c1) + (compress 4 c2) * 16) = W16.of_int ((compress 4 c1) + (compress 4 c2) * 16).
      rewrite /packssw => c1 c2.
      move : (pck_bnds c1 c2).
      smt().
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
      smt().
    do rewrite packusid.
    rewrite (_: (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8)) %% 16 %/ 8 = k %% 32 %/ 16).
      have ?: k \in (iota_ (32 * i{2}) 32); first by rewrite mem_iota k_ub k_tlb.
      have ?: i{2} \in (iota_ 0 4); first by rewrite mem_iota i_tub i_lb.
      smt().
    rewrite -(fun_if W8.of_int).
    congr.
    have ->: (if k %% 32 %/ 16 = 0 then
                compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) +
                compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) * 16
              else
                compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) +
                compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) * 16) =
              compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 * (k %% 32 %/ 16) + 16 * (x %% 8 %/ 4) + 2 * (k %% 8)])) +
              compress 4 (incoeff (to_sint a{1}.[64 * i{2} + 32 * (k %% 32 %/ 16) + 16 * (x %% 8 %/ 4) + 2 * (k %% 8) + 1])) * 16.
      rewrite (_: k %% 32 %/ 16 = k %/ 16 %% 2).
        smt().
      case (k %/ 16 %% 2 = 0) => even.
        + rewrite even //=.
        + have -> /=: k %/ 16 %% 2 = 1. move : even => /#.
      done.
    smt().    

  skip.
  auto => />.
  move => &1 &2 [#]*.
  split.
    smt().
  move => memr i r i_tlb _ i_lb i_ub.
  have ->: i = 4. move : i_ub i_tlb => /#.
  move => /> mem_eq_memr memr_eq_r.
  rewrite /load_array128 /=.
  apply Array128.ext_eq => k k_i.
  rewrite initiE 1:k_i /=.
  move : (memr_eq_r k k_i).
  rewrite /loadW8.
  done.
qed.

lemma poly_compress_ll : islossless Mprevec.poly_compress.
proc.
auto => />.
  cfold 8. wp; while(0 <= i <= 4) (4-i).
    move => *; inline *; auto => />. smt().
  inline Ops.iVPBROADCAST_16u16; wp; call poly_csubq_ll; auto => /> /#.
qed.

lemma poly_tomsg_corr _a  : 
  equiv [Mprevec.poly_tomsg_1 ~ EncDec_AVX2.encode1 :
             pos_bound256_cxq a{1} 0 256 2 /\ 
             lift_array256 a{1} = _a /\ a{2} = compress_poly 1 _a 
              ==>
             lift_array256 res{1}.`2 = _a /\
             pos_bound256_cxq res{1}.`2 0 256 1 /\
             res{1}.`1 = res{2}].
proof.
  proc.
  cfold{1} 4.
  seq 1 1 : (#{~(pos_bound256_cxq a{1} 0 256 2)}pre /\
           pos_bound256_cxq a{1} 0 256 1).
  wp; call{1} (poly_csubq_corr _a); auto => /#.
  seq 3 1 : (#pre /\ ={i} /\ i{1} = 0 /\
             (forall k, 0 <= k < 16 => hq{1}.[k] = W16.of_int 1664) /\
             (forall k, 0 <= k < 16 => hhq{1}.[k] = W16.of_int 832)).
  wp; skip; auto => />.
  move => &1 [#] pos_bound_a.
  split.
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
      rewrite /(Jkem_avx2.hqx16_m1) initiE 1:/# //=.
      smt().
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
      rewrite /(Jkem_avx2.hhqx16) initiE 1:/# //=.
      smt().
  wp.
  while (#{~i{1}=0}pre /\ 0 <= i{1} <= 8 /\
         forall k, 0 <= k < 4*i{1} => rp{1}.[k] = ra{2}.[k]).
  auto => />.
  move => &1 &2 [#] a1_def a2_def rp_def pos_bound_a i_eq hq_def hhq_def i1_lb i1_ub  i1_tub i2_tub c ra [#] i2n_lb i2n_ub  c_eq_ra i2_n  i1_n />.
  by smt().

  inline *; wp.
  unroll for {2} 2.
  auto => />.
  move => &1 &2 [#]  pos_bound_a hq_def hhq_def i_lb i_ub rp_def i_tub />.
  split; first by move : i_lb i_tub => /#.
  do (rewrite hq_def 1://=).
  do (rewrite hhq_def 1://=).
  rewrite (_: witness<:W8.t Array32.t>.[0 <-
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
    smt().
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
        smt().
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

  move => k kbl kbh.
  rewrite filliE 1:/# initiE //= 1:/#.
  case (4 * i{2} <= k && k < 4 * i{2} + 4) => k_si.
    + rewrite /msg.
      rewrite wordP => j j_i.
      do (rewrite initiE 1:/# //=).
      rewrite get8_set32_directE 1,2:/# k_si /= bits8iE 1:/# W32.get_bits2w 1:/# nth_mkseq 1:/# //=.
      do (rewrite initiE 1:/# //=).
      rewrite /int_bit.
      rewrite /compress_poly mapiE 1:/# //=.
      rewrite lift_array256E 1:/#.
      rewrite (mulzC 8 _).
      do (rewrite modzMDl divzMDl //=).
      do (rewrite (pdiv_small _ 8) 1:j_i //= || rewrite (modz_small j 8) 1:j_i //=).
      rewrite {2 4}(_: 16 = 8 * 2). by trivial.
      rewrite !modz_dvd 1,2://=.
      have -> : 32 * i{2} + 8 * (k %% 4) + j = (8*(4*i{2} + k %% 4) + j) by ring.
      have ->  /= : 216 %/ 4 ^ (k - 4 * i{2}) %% 2 = if 2<= (k - 4*i{2}) then 1 else 0.  
          case (k - 4*i{2} = 0); 1:by move => -> /=.  
          case (k - 4*i{2} = 1); 1:by move => -> /=.  
          case (k - 4*i{2} = 2); 1:by move => -> /=.  
          case (k - 4*i{2} = 3); 1:by move => -> /=.  
          smt().
      have ->  /= : 216 %/ 4 ^ (k - 4 * i{2}) %% 4 = if  (k - 4*i{2}) = 0 then 0 else if  (k - 4*i{2}) = 1 then 2 else if  (k - 4*i{2}) = 2 then 1 else 3. 
          case (k - 4*i{2} = 0); 1:by move => -> /=.  
          case (k - 4*i{2} = 1); 1: by move => -> /=.  
          case (k - 4*i{2} = 2); 1:by move => -> /=.  
          case (k - 4*i{2} = 3); 1:by move => -> /=.  
          smt().
      pose x := _ + j.
      pose y := _ + j.
      have -> : x = y; last first.
      + rewrite compress_avx2_impl_small 1:pos_bound_a 1:/#.
        by rewrite b_decode_sem;  smt().
      case (k = 4*i{2}); 1: by  rewrite /x /y => -> /= /#.
      case (k = 4*i{2} + 1); 1: by  rewrite /x /y => -> /= /#.
      case (k = 4*i{2} + 2); 1: by  rewrite /x /y => -> /= /#.
      case (k = 4*i{2} + 3); 1: by  rewrite /x /y => -> /= /#.
      by smt().

    + rewrite get8_set32_directE 1,2:/# k_si /=.  smt(WArray32.initiE). 

  wp.
  skip.
  auto => />.
  move => &1 &2 [#]  pos_bound_a hhq_def hq_def.
  do split.
  smt().
  move =>  ra i i_tlb ? ? i_lb i_ub.
  have ->: (i = 8).
    move : i_tlb i_ub => /#. 
  apply Array32.ext_eq => x x_i.
qed.

lemma poly_tomsg_ll : islossless  Mprevec.poly_tomsg_1.
proc.
  cfold 4. wp; while (0 <= i <= 8) (8-i); last by wp; call (poly_csubq_ll); auto =>  /> /#.
  move => *.
  wp.
  inline *; wp; auto => /> /#.
qed.

(* TODO: move to spec/MLKEM.ec *)
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
proof. 
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
      rewrite pmod_small. by smt().
      rewrite pmod_small. by smt().
      rewrite initiE //=.
      rewrite (_: 15 - (15 - (linear_idx %% 32 + n) %% 16) = (linear_idx %% 32 + n) %% 16). smt().
      rewrite bits16E /k divzE.
      rewrite initiE 1:/# //=.
      rewrite -addzA addNz addz0.
      rewrite /W32.(`<<`) /W32.(`<<<`).
      rewrite initiE 1:/# //=.
      rewrite modz_dvd 1://= (pmod_small n) //=; first by smt().
      rewrite -(addzA _ n) addzN addz0.
      rewrite pack4wE 1:/# //=.
      rewrite initiE 1:/# //=.
      rewrite (_: linear_idx %% 32 %% 8 = j). by rewrite modz_dvd 1://= /linear_idx mulzC modzMDl pmod_small 1:j_i.
      rewrite (_: 4 * di + linear_idx %% 32 %/ 8 = i). rewrite /di /linear_idx; smt().
      done.

  case a.[i].[j] => a_i_j_1.
  have ->: ((((f_def.[di]) `<<` (of_int n)%W8 \bits16 k) `<<` sl) `|>>` (of_int 15)%W8) = W16.onew.
    rewrite wordP. move => j0 j0_i.
    rewrite (x_msk j0 j0_i).
    rewrite W16.onewE.
    rewrite j0_i a_i_j_1 //=.
  rewrite W16.and1w of_sintK /smod //=.
  rewrite /incoeff Sub.insubdK 1:/# pmod_small 1:/# //=.

  move : a_i_j_1 => a_i_j_0.
 
  have ->: ((((f_def.[di]) `<<` (of_int n)%W8 \bits16 k) `<<` sl) `|>>` (of_int 15)%W8) = W16.zero.
    rewrite wordP. move => j0 j0_i.
    rewrite (x_msk j0 j0_i).
    rewrite W16.zerowE.
    rewrite a_i_j_0 //=.
  rewrite W16.and0w of_sintK /smod //=.
  rewrite /incoeff Sub.insubdK 1:/# pmod_small 1:/# //=.
qed.

(* TODO: generalize *)
lemma true_32: forall x, 0 <= x < 8 => (W8.of_int 32).[x] = (x = 5).
proof.  
  move => x x_i.
  rewrite /of_int /= /int2bs /= /mkseq -iotaredE /=.
  rewrite /bits2w initiE 1:x_i /=.
  smt().
qed.

lemma true_49: forall x, 0 <= x < 8 => (W8.of_int 49).[x] = (x = 5 \/ x = 4 \/ x = 0).
proof.  
  move => x x_i.
  rewrite /of_int /= /int2bs /= /mkseq -iotaredE /=.
  rewrite /bits2w initiE 1:x_i /=.
  smt().
qed.

lemma poly_frommsg_corr  (_m : W8.t Array32.t): 
    equiv [ Mprevec.poly_frommsg_1 ~ EncDec_AVX2.decode1_opt :
             ap{1} = _m /\ a{2} = _m
              ==>
             lift_array256 res{1} = decompress_poly 1 res{2} /\
             pos_bound256_cxq res{1} 0 256 1 ].
proof. 
  proc.
  seq 5 2:(#pre /\
           ={i} /\ i{1} = 0 /\
           (forall k, 0 <= k < 16 => hqs{1}.[k] = (W16.of_int 1665)) /\
           (forall k, 0 <= k < 32 => idx{1}.[k] = pfm_idx_s.[k %% 16]) /\
           (forall k, 0 <= k < 8 => shift{1}.[k] = W32.of_int (3 - k %% 4)) /\
           (forall k, 0 <= k < 8 => f{1}.[k] = pack4_t (W4u8.Pack.init (fun i => a{2}.[4 * k + i])))).
  inline *.
  wp; skip; auto => />.
  do split.
    + move => k k_lb k_ub.
      rewrite initiE 1:/# //=.
      rewrite /(Jkem_avx2.hqx16_m1) initiE 1:/# //=.
      smt().
    + move => k k_lb k_ub.
      do (rewrite initiE 1:/# //=).
    + move => k k_lb k_ub.
      do (rewrite initiE 1:/# //=).
      smt().
    + move => k k_lb k_ub.
      do (rewrite initiE 1:/# //=).

  while (#{~i{1}=0}pre /\ 0 <= i{1} <= 4 /\
         (forall k, 0 <= k < 32 * i{1} => incoeff (to_sint rp{1}.[k]) = decompress 1 r{2}.[k]) /\
         (forall k, 128 <= k < 128 + 32 * i{1} => incoeff (to_sint rp{1}.[k]) = decompress 1 r{2}.[k]) /\
         (forall k, 0 <= k < 32 * i{1} => 0 <= to_sint rp{1}.[k] < q) /\
         (forall k, 128 <= k < 128 + 32 * i{1} => 0 <= to_sint rp{1}.[k] < q)).
  auto => />.
  move => &1 &2 [#] ap_def a_def i_eq hqs_def idx_def shift_def f_def i_lb i_ub.
  move =>  rpl_def rph_def rpl_bnd rph_bnd i1_tub i2_tub.
  move => g0 g1 g2 g3 r [#] i2n_lb i2n_ub rpnl_def rpnh_def rpnl_bnd rpnh_bnd i2_n rpn i1_n />.
  rewrite /rpn /i1_n /i2_n i_eq /=.
  do split; first 6 by assumption.

  seq 16 0: (#pre /\
           (forall k, 0 <= k < 16 => W16.to_sint g0{1}.[k] = s_encode a{2}.[4 * i{1} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4)].[k %% 4]) /\
           (forall k, 0 <= k < 16 => W16.to_sint g1{1}.[k] = s_encode a{2}.[4 * i{1} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4)].[k %% 4 + 4]) /\
           (forall k, 0 <= k < 16 => W16.to_sint g2{1}.[k] = s_encode a{2}.[4 * i{1} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4) + 1].[k %% 4]) /\
           (forall k, 0 <= k < 16 => W16.to_sint g3{1}.[k] = s_encode a{2}.[4 * i{1} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4) + 1].[k %% 4 + 4])).
  inline *.
  wp; skip; auto => />.
  move => &1 &2 [#]  hqs_def idx_def shift_def f_def i_lb i_ub rpl_def rph_def rpl_bnd rph_bnd i_tub />.
  split.
  move => k k_lb k_ub.

  have idx_in_bound: forall j, 0 <= j < 32 => ! 128 <= to_uint idx{1}.[j].
    move => j j_i.
    rewrite (idx_def j j_i).
    rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    smt().

  rewrite /f8u32_t32u8 //=.
  do (rewrite initiE /=; first by rewrite k_lb k_ub /=).
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
      rewrite idx_def 1:/# /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().

    rewrite (_: W2u8.Pack.init (fun (j : int) => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]]) =
                W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                                 W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                                 \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite idx_def 1:/# /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
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
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %% 4 =
                to_uint idx{1}.[2 * k + x] %/ 4).
      move : (idx_bnds (2 * k + x)).
      smt().
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %/ 4 =
                (2 * k + x) %/ 16).
      move : (idx_bnds (2 * k + x)).
      smt().
    trivial.

  have f_idx: forall j, 0 <= j < 2 => 4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4 =
                                         4 * (k %/ 8) + i{2}.
    move => j j_i.
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite exprM //=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt().
    rewrite (pdiv_small _ 4) //=. by smt().
    rewrite (_: 4 * (k %/ 8) + 85 * i{2} %/ 4 ^ (k %% 4) %% 4 = 4 * (k %/ 8) + i{2} <=>
                85 * i{2} %/ 4 ^ (k %% 4) %% 4 = i{2}). by smt().
    rewrite (_: 85 * i{2} = (4 ^ 3) * i{2} + (4 ^ 2) * i{2} + (4 ^ 1) * i{2} + (4 ^ 0) * i{2}). smt().
    move : (modz_cmp k 4) => km_i.
    case (k %% 4 = 0) => k_0.
      rewrite k_0.
      smt().
    case (k %% 4 = 1) => k_1.
      rewrite k_1.
      smt().
    case (k %% 4 = 2) => k_2.
      rewrite k_2.
      smt().
    case (k %% 4 = 3) => k_3.
      rewrite k_3.
      smt().
    smt().

  have shift_idx: forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 = 4 * (k %/ 8) + k %% 4.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt().
    rewrite (divzMDl (4 * (k %/ 8)) _ 4) 1://=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt().
    rewrite (pdiv_small _ 4) //=. by smt().

  have bit_idx : forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4 = 2 * (k %% 8 %/ 4) + j.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt().
    smt().

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
    smt().

  pose idx := 4 * i{2} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4).
  pose linear_idx := 8 * idx + k %% 4.

  have ->: 4 * (k %/ 8) + i{2} = linear_idx %/ 32. by smt().
  rewrite shift_def /=; first by move : k_lb k_ub => /#.
  rewrite (mulzC 4 _) modzMDl modz_mod.
  rewrite of_uintK pmod_small 1:/#.
  rewrite hqs_def; first by rewrite k_lb k_ub /=.

  have ->: 3 - k %% 4 = 3 - linear_idx %% 4. by smt().
  have ->: k %% 8 %/ 4 = (linear_idx %% 32 + (3 - linear_idx %% 4)) %/ 16. by smt().
  have ->: 12 = 15 - ((linear_idx %% 32 + (3 - linear_idx %% 4)) %% 16). by smt().

  pose di := linear_idx %/ 32.
  pose n := 3 - linear_idx %% 4.
  pose kb := (linear_idx %% 32 + n) %/ 16.
  pose sl := W8.of_int (15 - (linear_idx %% 32 + n) %% 16).

  rewrite -W32.shl_shlw 1:/#.
  move : (bit_decode _m idx (k %% 4)).
  have -> /=: (0 <= idx && idx < 32). by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  have -> /=: (0 <= k %% 4 && k %% 4 < 8). by move : (modz_cmp k 4) => /#.
  have ->: (f32u8_t8u32 _m = f{1}).
    rewrite /f32u8_t8u32.
    apply Array8.ext_eq => x x_i.
    rewrite f_def 1:x_i //= Array8.initiE 1:x_i  //=.

  smt().


(* FIXME: same block x3 ****************************************************************)
  split.
  move => k k_lb k_ub.

  have idx_in_bound: forall j, 0 <= j < 32 => ! 128 <= to_uint idx{1}.[j].
    move => j j_i.
    rewrite (idx_def j j_i).
    rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    smt().

  rewrite /f8u32_t32u8 //=.
  do (rewrite initiE /=; first by rewrite k_lb k_ub /=).
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
      rewrite idx_def 1:/# /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().

    rewrite (_: W2u8.Pack.init (fun (j : int) => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]]) =
                W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                                 W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                                 \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite idx_def 1:/# /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
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
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %% 4 =
                to_uint idx{1}.[2 * k + x] %/ 4).
      move : (idx_bnds (2 * k + x)).
      smt().
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %/ 4 =
                (2 * k + x) %/ 16).
      move : (idx_bnds (2 * k + x)).
      smt().
    trivial.

  have f_idx: forall j, 0 <= j < 2 => 4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4 =
                                         4 * (k %/ 8) + i{2}.
    move => j j_i.
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite exprM //=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt().
    rewrite (pdiv_small _ 4) //=. by smt().
    rewrite (_: 4 * (k %/ 8) + 85 * i{2} %/ 4 ^ (k %% 4) %% 4 = 4 * (k %/ 8) + i{2} <=>
                85 * i{2} %/ 4 ^ (k %% 4) %% 4 = i{2}). by smt().
    rewrite (_: 85 * i{2} = (4 ^ 3) * i{2} + (4 ^ 2) * i{2} + (4 ^ 1) * i{2} + (4 ^ 0) * i{2}). smt().
    move : (modz_cmp k 4) => km_i.
    case (k %% 4 = 0) => k_0.
      rewrite k_0.
      smt().
    case (k %% 4 = 1) => k_1.
      rewrite k_1.
      smt().
    case (k %% 4 = 2) => k_2.
      rewrite k_2.
      smt().
    case (k %% 4 = 3) => k_3.
      rewrite k_3.
      smt().
    smt().

  have shift_idx: forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 = 4 * (k %/ 8) + k %% 4.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt().
    rewrite (divzMDl (4 * (k %/ 8)) _ 4) 1://=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt().
    rewrite (pdiv_small _ 4) //=. by smt().

  have bit_idx : forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4 = 2 * (k %% 8 %/ 4) + j.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt().
    smt().

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
    smt().

  pose idx := 4 * i{2} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4).
  pose linear_idx := 8 * idx + k %% 4 + 4.

  have ->: 4 * (k %/ 8) + i{2} = linear_idx %/ 32. by smt().
  rewrite shift_def /=; first by move : k_lb k_ub => /#.
  rewrite (mulzC 4 _) modzMDl modz_mod.
  rewrite of_uintK pmod_small 1:/#.
  rewrite hqs_def; first by rewrite k_lb k_ub /=.

  have ->: 3 - k %% 4 = 3 - linear_idx %% 4. by smt().
  have ->: k %% 8 %/ 4 = (linear_idx %% 32 + (3 - linear_idx %% 4)) %/ 16. by smt().
  have ->: 8 = 15 - ((linear_idx %% 32 + (3 - linear_idx %% 4)) %% 16). by smt().

  pose di := linear_idx %/ 32.
  pose n := 3 - linear_idx %% 4.
  pose kb := (linear_idx %% 32 + n) %/ 16.
  pose sl := W8.of_int (15 - (linear_idx %% 32 + n) %% 16).

  rewrite -W32.shl_shlw 1:/#.
  move : (bit_decode _m idx (k %% 4 + 4)).
  have -> /=: (0 <= idx && idx < 32). by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  have -> /=: (0 <= k %% 4 + 4 && k %% 4 + 4 < 8). by move : (modz_cmp k 4) => /#.
  have ->: (f32u8_t8u32 _m) = f{1}.
    rewrite /f32u8_t8u32.
    apply Array8.ext_eq => x x_i.
    rewrite f_def 1:x_i //= Array8.initiE 1:x_i  //=.

  smt().

  split.
  move => k k_lb k_ub.

  have idx_in_bound: forall j, 0 <= j < 32 => ! 128 <= to_uint idx{1}.[j].
    move => j j_i.
    rewrite (idx_def j j_i).
    rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    smt().

  rewrite /f8u32_t32u8 //=.
  do (rewrite initiE /=; first by rewrite k_lb k_ub /=).
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
      rewrite idx_def 1:/# /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().

    rewrite (_: W2u8.Pack.init (fun (j : int) => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]]) =
                W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                                 W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                                 \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite idx_def 1:/# /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
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
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %% 4 =
                to_uint idx{1}.[2 * k + x] %/ 4).
      move : (idx_bnds (2 * k + x)).
      smt().
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %/ 4 =
                (2 * k + x) %/ 16).
      move : (idx_bnds (2 * k + x)).
      smt().
    trivial.

  have f_idx: forall j, 0 <= j < 2 => 4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4 =
                                         4 * (k %/ 8) + i{2}.
    move => j j_i.
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite exprM //=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt().
    rewrite (pdiv_small _ 4) //=. by smt().
    rewrite (_: 4 * (k %/ 8) + 85 * i{2} %/ 4 ^ (k %% 4) %% 4 = 4 * (k %/ 8) + i{2} <=>
                85 * i{2} %/ 4 ^ (k %% 4) %% 4 = i{2}). by smt().
    rewrite (_: 85 * i{2} = (4 ^ 3) * i{2} + (4 ^ 2) * i{2} + (4 ^ 1) * i{2} + (4 ^ 0) * i{2}). smt().
    move : (modz_cmp k 4) => km_i.
    case (k %% 4 = 0) => k_0.
      rewrite k_0.
      smt().
    case (k %% 4 = 1) => k_1.
      rewrite k_1.
      smt().
    case (k %% 4 = 2) => k_2.
      rewrite k_2.
      smt().
    case (k %% 4 = 3) => k_3.
      rewrite k_3.
      smt().
    smt().

  have shift_idx: forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 = 4 * (k %/ 8) + k %% 4.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt().
    rewrite (divzMDl (4 * (k %/ 8)) _ 4) 1://=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt().
    rewrite (pdiv_small _ 4) //=. by smt().

  have bit_idx : forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4 = 2 * (k %% 8 %/ 4) + j.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt().
    smt().

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
    smt().

  pose idx := 4 * i{2} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4) + 1.
  pose linear_idx := 8 * idx + k %% 4.

  have ->: 4 * (k %/ 8) + i{2} = linear_idx %/ 32. by smt().
  rewrite shift_def /=; first by move : k_lb k_ub => /#.
  rewrite (mulzC 4 _) modzMDl modz_mod.
  rewrite of_uintK pmod_small 1:/#.
  rewrite hqs_def; first by rewrite k_lb k_ub /=.

  have ->: 3 - k %% 4 = 3 - linear_idx %% 4. by smt().
  have ->: k %% 8 %/ 4 = (linear_idx %% 32 + (3 - linear_idx %% 4)) %/ 16. by smt().
  have ->: 4 = 15 - ((linear_idx %% 32 + (3 - linear_idx %% 4)) %% 16). by smt().

  pose di := linear_idx %/ 32.
  pose n := 3 - linear_idx %% 4.
  pose kb := (linear_idx %% 32 + n) %/ 16.
  pose sl := W8.of_int (15 - (linear_idx %% 32 + n) %% 16).

  rewrite -W32.shl_shlw 1:/#.
  move : (bit_decode _m idx (k %% 4)).
  have -> /=: (0 <= idx && idx < 32). by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  have -> /=: (0 <= k %% 4 && k %% 4 < 8). by move : (modz_cmp k 4) => /#.
  have ->: (f32u8_t8u32 _m) = f{1}.
    rewrite /f32u8_t8u32.
    apply Array8.ext_eq => x x_i.
    rewrite f_def 1:x_i //= Array8.initiE 1:x_i //=.

  smt().

  move => k k_lb k_ub.

  have idx_in_bound: forall j, 0 <= j < 32 => ! 128 <= to_uint idx{1}.[j].
    move => j j_i.
    rewrite (idx_def j j_i).
    rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    smt().

  rewrite /f8u32_t32u8 //=.
  do (rewrite initiE /=; first by rewrite k_lb k_ub /=).
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
      rewrite idx_def 1:/# /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().

    rewrite (_: W2u8.Pack.init (fun (j : int) => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]]) =
                W2u8.Pack.init (fun (j : int) => f{1}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{1}.[2 * k + j]) %/ 4 %/ 4) + 85 * i{2} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                                 W32.to_uint shift{1}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4]
                                                 \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite idx_def 1:/# /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
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
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %% 4 =
                to_uint idx{1}.[2 * k + x] %/ 4).
      move : (idx_bnds (2 * k + x)).
      smt().
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{1}.[2 * k + x]) %/ 4 %/ 4 =
                (2 * k + x) %/ 16).
      move : (idx_bnds (2 * k + x)).
      smt().
    trivial.

  have f_idx: forall j, 0 <= j < 2 => 4 * ((2 * k + j) %/ 16) + 85 * i{2} %/ (2 ^ (2 * (W8.to_uint idx{1}.[2 * k + j] %/ 4))) %% 4 =
                                         4 * (k %/ 8) + i{2}.
    move => j j_i.
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite exprM //=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt().
    rewrite (pdiv_small _ 4) //=. by smt().
    rewrite (_: 4 * (k %/ 8) + 85 * i{2} %/ 4 ^ (k %% 4) %% 4 = 4 * (k %/ 8) + i{2} <=>
                85 * i{2} %/ 4 ^ (k %% 4) %% 4 = i{2}). by smt().
    rewrite (_: 85 * i{2} = (4 ^ 3) * i{2} + (4 ^ 2) * i{2} + (4 ^ 1) * i{2} + (4 ^ 0) * i{2}). smt().
    move : (modz_cmp k 4) => km_i.
    case (k %% 4 = 0) => k_0.
      rewrite k_0.
      smt().
    case (k %% 4 = 1) => k_1.
      rewrite k_1.
      smt().
    case (k %% 4 = 2) => k_2.
      rewrite k_2.
      smt().
    case (k %% 4 = 3) => k_3.
      rewrite k_3.
      smt().
    smt().

  have shift_idx: forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %/ 4 = 4 * (k %/ 8) + k %% 4.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt().
    rewrite (divzMDl (4 * (k %/ 8)) _ 4) 1://=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt().
    rewrite (pdiv_small _ 4) //=. by smt().

  have bit_idx : forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{1}.[2 * k + j]) %% 4 = 2 * (k %% 8 %/ 4) + j.
    move => j j_i.
    rewrite (_: to_uint idx{1}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite idx_def 1:/#.
      rewrite /(Jkem_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt().
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt().
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt().
    smt().

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
    smt().

  pose idx := 4 * i{2} + 16 * (k %/ 8) + 2 * (k %% 8 %/ 4) + 1.
  pose linear_idx := 8 * idx + k %% 4 + 4.

  have ->: 4 * (k %/ 8) + i{2} = linear_idx %/ 32. by smt().
  rewrite shift_def /=; first by move : k_lb k_ub => /#.
  rewrite (mulzC 4 _) modzMDl modz_mod.
  rewrite of_uintK pmod_small 1:/#.
  rewrite hqs_def; first by rewrite k_lb k_ub /=.

  have ->: 3 - k %% 4 = 3 - linear_idx %% 4. by smt().
  have ->: k %% 8 %/ 4 = (linear_idx %% 32 + (3 - linear_idx %% 4)) %/ 16. by smt().
  (* have sl_0: 0 = 15 - ((linear_idx %% 32 + (3 - linear_idx %% 4)) %% 16). by smt() *)

  pose di := linear_idx %/ 32.
  pose n := 3 - linear_idx %% 4.
  pose kb := (linear_idx %% 32 + n) %/ 16.
  pose sl := W8.of_int (15 - (linear_idx %% 32 + n) %% 16).
  have sl_0: sl = W8.zero. by smt().

  rewrite -W32.shl_shlw 1:/#.
  move : (bit_decode _m idx (k %% 4 + 4)).
  have -> /=: (0 <= idx && idx < 32). by rewrite /idx; move : i_lb i_tub k_lb k_ub => /#.
  have -> /=: (0 <= k %% 4 + 4 && k %% 4 + 4 < 8). by move : (modz_cmp k 4) => /#.
  have ->: (f32u8_t8u32 _m) = f{1}.
    rewrite /f32u8_t8u32.
    apply Array8.ext_eq => x x_i.
    rewrite f_def 1:x_i //= Array8.initiE 1:x_i  //=.

  rewrite (addzA _ (k %% 4) 4).

  rewrite -/linear_idx -/di -/n -/kb -/sl.
  rewrite sl_0 (W16.shl_shlw 0 _) 1://=.
  rewrite (_: (f{1}.[di] `<<` (of_int n)%W8 \bits16 kb) `<<<` 0 =
              (f{1}.[di] `<<` (of_int n)%W8 \bits16 kb)).
    rewrite /W16.(`<<<`).
    apply W16.wordP => x x_i.
    rewrite initiE 1:x_i //=.
  smt().

(****************************************************************************************)

  inline *. wp.
  unroll for {2} 4.
  unroll for {2} 2.
  auto => />.
  move => &1 &2 [#] hqs_def idx_def shift_def f_def i_lb i_ub rpl_def rph_def rpl_bnd rph_bnd i_tub g0_def g1_def g2_def g3_def />.

  rewrite (_:
              (fill (fun (k0 : int) => b2i _m.[k0 %/ 8].[k0 %% 8]) (152 + 32 * i{2}) 8
        (fill (fun (k0 : int) => b2i _m.[k0 %/ 8].[k0 %% 8]) (144 + 32 * i{2}) 8
           (fill (fun (k0 : int) => b2i _m.[k0 %/ 8].[k0 %% 8]) (136 + 32 * i{2}) 8
              (fill (fun (k0 : int) => b2i _m.[k0 %/ 8].[k0 %% 8]) (128 + 32 * i{2}) 8
                 (fill (fun (k0 : int) => b2i _m.[k0 %/ 8].[k0 %% 8]) (
                    32 * i{2} + 24) 8
                    (fill (fun (k0 : int) => b2i _m.[k0 %/ 8].[k0 %% 8]) (
                       32 * i{2} + 16) 8
                       (fill (fun (k0 : int) => b2i _m.[k0 %/ 8].[k0 %% 8]) (
                          32 * i{2} + 8) 8 (fill (fun (k0 : int) => b2i _m.[k0 %/ 8].[k0 %% 8]) (32 * i{2}) 8 r{2})))))))) =

              (fill
                 (fun (k0 : int) =>
                    b2i _m.[k0 %/ 8].[k0 %% 8])
                 (128 + 32 * i{2}) 32
                 (fill
                    (fun (k0 : int) =>
                       b2i _m.[k0 %/ 8].[k0 %% 8])
                    (32 * i{2}) 32 r{2}))).
    apply Array256.ext_eq.
    move => x x_i.
    do (rewrite filliE 1:x_i //=).
    smt().

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
    smt().

  have ->: !(W8.int_bit 32 (4 * (k %% 16 %/ 8))).
    move : (true_32 (4 * (k %% 16 %/ 8))).
    rewrite of_intwE.
    have -> /=: 0 <= 4 * (k %% 16 %/ 8) && 4 * (k %% 16 %/ 8) < 8.
      move : (modz_cmp k 16) => /#.
    smt().

  simplify.

  rewrite g0_def.
    rewrite modz_dvd 1://=.
    rewrite modz_dvd 1://=.
    smt().

  rewrite g1_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt().
    rewrite modz_dvd 1://=.
    smt().

  rewrite g2_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt().
    rewrite modz_dvd 1://=.
    smt().

  rewrite g3_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt().
    rewrite modz_dvd 1://=.
    smt().

  rewrite g0_def.
    move : (modz_cmp k 4) => /#.
  rewrite g1_def.
    move : (modz_cmp k 4) => /#.
  rewrite g2_def.
    move : (modz_cmp k 4) => /#.
  rewrite g3_def.
    move : (modz_cmp k 4) => /#.

  do (rewrite modz_dvd 1://=).
  rewrite (pdiv_small (k %% 8) 8). by smt().
  rewrite (_: ((4 + k %% 4) %% 8 %/ 4) = 1). by smt().
  rewrite (_: ((4 + k %% 4) %/ 8) = 0). by smt().
  rewrite (_: ((4 + k %% 4) %% 4) = k %% 4). by smt().
  rewrite (_: k %% 8 %/ 4 %% 2 = k %/ 4 %% 2). by smt().
  rewrite (_: k %% 4 %% 8 %/ 4 = 0). by smt().
  rewrite (pdiv_small (k %% 4) 8). by smt().
  simplify.
  rewrite modz_mod.

  rewrite (_: (0 <= 4 * (k %% 16 %/ 8) + 1 && 4 * (k %% 16 %/ 8) + 1 < 8) = true) //=.
    by smt().

  rewrite /s_encode /load_array32.
  do (rewrite (fun_if incoeff) || rewrite asintK).
  do (rewrite b_encode_sem /b2i).

  case (32 * i{2} + 16 <= k && k < 32 * i{2} + 32)  => k_ssi.
    case (32 * i{2} + 24 <= k && k < 32 * i{2} + 32) => k_sssi.
      have -> /=: W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
        move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt().
      rewrite (_: (4 * i{2} + 3) = k %/ 8). move : k_ssi => /#.
      smt().

      have -> /=: !W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
          move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt().
      rewrite (_: (4 * i{2} + 2) = k %/ 8). move : k_ssi => /#.
      smt().

  move : k_ssi => k_nssi.
  case (32 * i{2} <= k && k < 32 * i{2} + 16)  => k_ssi.
    case (32 * i{2} + 8 <= k && k < 32 * i{2} + 16) => k_sssi.
      have -> /=: W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
        move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt().
      rewrite (_: (4 * i{2} + 1) = k %/ 8). move : k_ssi => /#.
      smt().

      have -> /=: !W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
          move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt().
      rewrite (_: (4 * i{2}) = k %/ 8). move : k_ssi => /#.
      smt().

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
    smt().

  do (rewrite modz_dvd 1://=).
  rewrite (_: (8 + k %% 8) %/ 8 = 1). by smt().
  rewrite (_: (8 + k %% 8) %/ 4 %% 2 = k %/ 4 %% 2). by smt().
  rewrite (_: k %% 8 %/ 4 %% 2 = k %/ 4 %% 2). by smt().
  rewrite (_: (8 + k %% 8) %% 4 = k %% 4). by smt().
  rewrite (pdiv_small (k %% 8) 8). by smt().
  have ->: 0 <= 4 * (k %% 16 %/ 8) && 4 * (k %% 16 %/ 8) < 8. by smt().
  have -> /=: 0 <= 4 * (k %% 16 %/ 8) + 1 && 4 * (k %% 16 %/ 8) + 1 < 8. by smt().

  do (rewrite g0_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g1_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g2_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g3_def; first by move : (modz_cmp k 4) => /#).

  rewrite (_: (12 + k %% 4) %/ 8 = 1). by smt().
  rewrite (_: (12 + k %% 4) %% 8 %/ 4 = 1). by smt().
  rewrite (_: (12 + k %% 4) %% 4 = k %% 4). by smt().
  rewrite (_: (8 + k %% 4) %/ 8 = 1). by smt().
  rewrite (_: (8 + k %% 4) %% 8 %/ 4 = 0). by smt().
  rewrite (_: (8 + k %% 4) %% 4 = k %% 4). by smt().
  rewrite (_: ((4 + k %% 4) %% 8 %/ 4) = 1). by smt().
  rewrite (_: ((4 + k %% 4) %/ 8) = 0). by smt().
  rewrite (_: ((4 + k %% 4) %% 4) = k %% 4). by smt().
  rewrite (pdiv_small (k %% 4) 8). by smt().
  rewrite (pdiv_small (k %% 4 %% 8) 4). by smt().
  rewrite modz_mod /=.

  rewrite /s_encode /load_array32.
  do (rewrite (fun_if incoeff) || rewrite asintK).
  do (rewrite b_encode_sem /b2i).

  case (144 + 32 * i{2} <= k && k < 160 + 32 * i{2}) => k_si.
    case (152 + 32 * i{2} <= k && k < 160 + 32 * i{2}) => k_ssi.
      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt().
      have -> /=: W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt().
      rewrite (_: (4 * i{2} + 19) = k %/ 8). move : k_ssi => /#.
      smt().

      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt().
      have -> /=: !W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt().
      rewrite (_: (4 * i{2} + 18) = k %/ 8). move : k_ssi => /#.
      smt().

  move : k_si => k_nsi.
  case (128 + 32 * i{2} <= k && k < 144 + 32 * i{2})  => k_si.
    case (136 + 32 * i{2} <= k && k < 144 + 32 * i{2})  => k_ssi.
      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt().
      have -> /=: W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt().
      rewrite (_: (4 * i{2} + 17) = k %/ 8). move : k_ssi => /#.
      smt().

      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt().
      have -> /=: !W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt().
      rewrite (_: (4 * i{2} + 16) = k %/ 8). move : k_ssi => /#.
      smt().

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
    smt().

  have ->/=: !(W8.int_bit 32 (4 * (k %% 16 %/ 8))).
    move : (true_32 (4 * (k %% 16 %/ 8))).
    rewrite of_intwE.
    have -> /=: 0 <= 4 * (k %% 16 %/ 8) && 4 * (k %% 16 %/ 8) < 8.
      move : (modz_cmp k 16) => /#.
    smt().

  rewrite g0_def.
    do (rewrite modz_dvd 1://=).
    move : k_lb k_ub i_lb i_tub => /#.

  rewrite g1_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt().
    rewrite modz_dvd 1://=.
    smt().

  rewrite g2_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt().
    rewrite modz_dvd 1://=.
    smt().

  rewrite g3_def.
    rewrite modz_dvd 1://=.
    rewrite (pdiv_small (k %% 8) 8). by smt().
    rewrite modz_dvd 1://=.
    smt().

  rewrite g0_def.
    move : (modz_cmp k 4) => /#.
  rewrite g1_def.
    move : (modz_cmp k 4) => /#.
  rewrite g2_def.
    move : (modz_cmp k 4) => /#.
  rewrite g3_def.
    move : (modz_cmp k 4) => /#.

  do (rewrite modz_dvd 1://=).
  rewrite (pdiv_small (k %% 8) 8). by smt().
  rewrite (_: ((4 + k %% 4) %% 8 %/ 4) = 1). by smt().
  rewrite (_: ((4 + k %% 4) %/ 8) = 0). by smt().
  rewrite (_: ((4 + k %% 4) %% 4) = k %% 4). by smt().
  rewrite (_: k %% 8 %/ 4 %% 2 = k %/ 4 %% 2). by smt().
  rewrite (_: k %% 4 %% 8 %/ 4 = 0). by smt().
  rewrite (pdiv_small (k %% 4) 8). by smt().
  simplify.
  rewrite modz_mod.

  rewrite (_: (0 <= 4 * (k %% 16 %/ 8) + 1 && 4 * (k %% 16 %/ 8) + 1 < 8) = true) //=.
    by smt().

  rewrite /s_encode /load_array32.
  rewrite /b_encode /trueval /falseval.
  do (rewrite (fun_if asint) || rewrite (fun_if incoeff) || rewrite incoeffK).
  do (rewrite (pmod_small _ q) 1:/#).

  (* move : (rpl_bnd k); smt() *)

  (* Maybe not necessary *)
  case (32 * i{2} + 16 <= k && k < 32 * i{2} + 32)  => k_ssi.
    smt().

  move : k_ssi => k_nssi.
  case (32 * i{2} <= k && k < 32 * i{2} + 16)  => k_ssi.
    smt().

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
    smt().

  do (rewrite modz_dvd 1://=).
  rewrite (_: (8 + k %% 8) %/ 8 = 1). by smt().
  rewrite (_: (8 + k %% 8) %/ 4 %% 2 = k %/ 4 %% 2). by smt().
  rewrite (_: k %% 8 %/ 4 %% 2 = k %/ 4 %% 2). by smt().
  rewrite (_: (8 + k %% 8) %% 4 = k %% 4). by smt().
  rewrite (pdiv_small (k %% 8) 8). by smt().
  have ->: 0 <= 4 * (k %% 16 %/ 8) && 4 * (k %% 16 %/ 8) < 8. by smt().
  have -> /=: 0 <= 4 * (k %% 16 %/ 8) + 1 && 4 * (k %% 16 %/ 8) + 1 < 8. by smt().

  do (rewrite g0_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g1_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g2_def; first by move : (modz_cmp k 4) => /#).
  do (rewrite g3_def; first by move : (modz_cmp k 4) => /#).

  rewrite (_: (12 + k %% 4) %/ 8 = 1). by smt().
  rewrite (_: (12 + k %% 4) %% 8 %/ 4 = 1). by smt().
  rewrite (_: (12 + k %% 4) %% 4 = k %% 4). by smt().
  rewrite (_: (8 + k %% 4) %/ 8 = 1). by smt().
  rewrite (_: (8 + k %% 4) %% 8 %/ 4 = 0). by smt().
  rewrite (_: (8 + k %% 4) %% 4 = k %% 4). by smt().
  rewrite (_: ((4 + k %% 4) %% 8 %/ 4) = 1). by smt().
  rewrite (_: ((4 + k %% 4) %/ 8) = 0). by smt().
  rewrite (_: ((4 + k %% 4) %% 4) = k %% 4). by smt().
  rewrite (pdiv_small (k %% 4) 8). by smt().
  rewrite (pdiv_small (k %% 4 %% 8) 4). by smt().
  rewrite modz_mod /=.

  rewrite /s_encode /load_array32.
  rewrite /b_encode /trueval /falseval.
  do (rewrite (fun_if asint) || rewrite (fun_if incoeff) || rewrite incoeffK).
  do (rewrite (pmod_small _ q) 1:/#).

  case (144 + 32 * i{2} <= k && k < 160 + 32 * i{2}) => k_si.
    smt().

  move : k_si => k_nsi.
  case (128 + 32 * i{2} <= k && k < 144 + 32 * i{2})  => k_si.
    smt().

  move : (rph_bnd k) => /#.

(***************************************************************************************)

  sp. skip. simplify.
  auto => />.
  move => &1 &2 [#] hqs_def idx_def shift_def f_def.
  do split; first 4 by smt().
  move => rp i r.
  move => i_tlb _ i_lb i_ub.
  have -> /=: i = 4. by move : i_ub i_tlb => /#.
  move => rpl_def rph_def rpl_bnd rph_bnd.

  have rp_def: forall (k : int), 0 <= k && k < 256 => incoeff (to_sint rp.[k]) = decompress 1 r.[k].
    move => k k_i.
    move : (rpl_def k) (rph_def k) => /#.

  split.

  apply Array256.ext_eq => x x_i.
  do (rewrite Array256.mapiE 1:x_i //=).
  apply (rp_def x x_i).

  rewrite /pos_bound256_cxq /bpos16 => x x_i.
 
  move : (rpl_bnd x) (rph_bnd x) => /#.
qed.

lemma poly_frommsg_ll : islossless  Mprevec.poly_frommsg_1.
proof. 
  proc; while (0 <= i <= 4) (4-i).
  move => *.
  inline *; wp; auto => /> /#.
  inline *; auto => /> /#.
qed.


op cmplx_mul_fq (a : coeff Array32.t, b : coeff Array32.t, zetas : coeff Array16.t) =
     let a0 = Array16.init (fun i => a.[i]) in
     let a1 = Array16.init (fun i => a.[16 + i]) in
     let b0 = Array16.init (fun i => b.[i]) in
     let b1 = Array16.init (fun i => b.[16 + i]) in
     (Array16.init (fun i => (a1.[i] * b1.[i] * zetas.[i]) + a0.[i] * b0.[i]),
      Array16.init (fun i => a0.[i] * b1.[i] + a1.[i] * b0.[i])).

op mul32x(a : coeff Array64.t, b : coeff Array64.t, zetas : coeff Array16.t) =
     let a_0 = Array32.init (fun i => a.[i]) in
     let b_0 = Array32.init (fun i => b.[i]) in
     let a_1 = Array32.init (fun i => a.[32 + i]) in
     let b_1 = Array32.init (fun i => b.[32 + i]) in
     let nzetas = Array16.init (fun i => -zetas.[i]) in
     (cmplx_mul_fq a_0 b_1 zetas, cmplx_mul_fq a_1 b_1 (nzetas)).

op isbasemul_avx(ap bp : coeff Array256.t, zetas : coeff Array128.t, 
            rs : coeff Array256.t, i : int) : bool =
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
  Array32.map (fun x => incoeff (W16.to_sint x)) p.

op lift_array16 (p: W16.t Array16.t) =
  Array16.map (fun x => incoeff (W16.to_sint x)) p.

op signed_bound32_cxq (coefs : W16.t Array32.t) (l u c : int) :
  bool =
  forall (k : int),
    l <= k && k < u => b16 (coefs.[k]) (c * q).

op signed_bound16_cxq (coefs : W16.t Array16.t) (l u c : int) :
  bool =
  forall (k : int),
    l <= k && k < u => b16 (coefs.[k]) (c * q).

op load_array384(m : global_mem_t, p : address) : W8.t Array384.t = 
      Array384.init (fun i => m.[p + i]).


lemma true_170: forall x, 0 <= x < 8 => (W8.of_int 170).[x] = (x %% 2 = 1).
proof. 
  move => x x_i.
  rewrite /of_int /= /int2bs /= /mkseq -iotaredE /=.
  rewrite /bits2w initiE 1:x_i /=.
  smt().
qed.

lemma shuffle8_corr_h _a _b:
      hoare[ Mprevec.shuffle8 :
           _a = a /\ _b = b
           ==>
           res.`1 = (shuf8 _a _b).`1 /\
           res.`2 = (shuf8 _a _b).`2].
proof.
  proc.
  wp; inline *; auto => />.
  split.
    + rewrite /shuf8 => />.
      rewrite -ext_eq_all /all_eq //=.
    + rewrite /shuf8 => />.
      rewrite -ext_eq_all /all_eq //=.
qed.

lemma shuffle8_ll: islossless Mprevec.shuffle8.
proof.
  proc.
  inline *; auto => />.
qed.

lemma shuffle8_corr _a _b:
      phoare[Mprevec.shuffle8:
             _a = a /\ _b = b
             ==>
             res.`1 = (shuf8 _a _b).`1 /\
             res.`2 = (shuf8 _a _b).`2] = 1%r
  by conseq shuffle8_ll (shuffle8_corr_h _a _b).

lemma shuffle4_corr_h _a _b:
      hoare[ Mprevec.shuffle4 :
           _a = a /\ _b = b
           ==>
           res.`1 = (shuf4 _a _b).`1 /\
           res.`2 = (shuf4 _a _b).`2].
proof.
  proc.
  wp; inline *; auto => />.
  split.
    + rewrite /shuf4 => />.
      rewrite -ext_eq_all /all_eq //=.
    + rewrite /shuf4 => />.
      rewrite -ext_eq_all /all_eq //=.
qed.

lemma shuffle4_ll: islossless Mprevec.shuffle4.
proof.
  proc.
  inline *; auto => />.
qed.

lemma shuffle4_corr _a _b:
      phoare[Mprevec.shuffle4:
             _a = a /\ _b = b
             ==>
             res.`1 = (shuf4 _a _b).`1 /\
             res.`2 = (shuf4 _a _b).`2] = 1%r
  by conseq shuffle4_ll (shuffle4_corr_h _a _b).


lemma shuffle2_corr_h _a _b:
      hoare[ Mprevec.shuffle2 :
           _a = a /\ _b = b
           ==>
           res.`1 = (shuf2 _a _b).`1 /\
           res.`2 = (shuf2 _a _b).`2].
proof.
  proc.
  wp; inline *; auto => />.
  split.
    + rewrite /shuf2 => />.
      rewrite -ext_eq_all /all_eq //=.
    + rewrite /shuf2 /f16u16_t4u64 /f4u64_t16u16 /lift_array16 => />.
      rewrite -ext_eq_all /all_eq => />.
      rewrite /W8.int_bit => />.
      rewrite shr_shrw 1://=.
      rewrite wlsrE => />.
      do split; first 8 by apply W16.all_eq_eq.
qed.

lemma shuffle2_ll: islossless Mprevec.shuffle2.
proof.
  proc.
  inline *; auto => />.
qed.

lemma shuffle2_corr _a _b:
      phoare[Mprevec.shuffle2:
             _a = a /\ _b = b
             ==>
             res.`1 = (shuf2 _a _b).`1 /\
             res.`2 = (shuf2 _a _b).`2] = 1%r
  by conseq shuffle2_ll (shuffle2_corr_h _a _b).

lemma shuffle1_corr_h _a _b:
      hoare[ Mprevec.shuffle1 :
           _a = a /\ _b = b
           ==>
           res.`1 = (shuf1 _a _b).`1 /\
           res.`2 = (shuf1 _a _b).`2].
proof.
  proc.
  wp; inline *; auto => />.
  rewrite /shuf1 /f8u32_t16u16 /f16u16_t8u32 /lift_array16 => />.
  do (rewrite -ext_eq_all /all_eq //=).
  rewrite /W8.int_bit => />.
  do (rewrite shl_shlw 1://=; rewrite wlslE => />).
  do (rewrite shr_shrw 1://=; rewrite wlsrE => />).
  do split; first 16 by apply W16.all_eq_eq.
qed.

lemma shuffle1_ll: islossless Mprevec.shuffle1.
proof.
  proc.
  inline *; auto => />.
qed.

lemma shuffle1_corr _a _b:
      phoare[Mprevec.shuffle1:
             _a = a /\ _b = b
             ==>
             res.`1 = (shuf1 _a _b).`1 /\
             res.`2 = (shuf1 _a _b).`2] = 1%r
  by conseq shuffle1_ll (shuffle1_corr_h _a _b).

lemma poly_tobytes_corr _a (_p : address) mem : 
    equiv [ Mprevec.poly_tobytes ~ EncDec_AVX2.encode12_opt :
             pos_bound256_cxq a{1} 0 256 2 /\
             lift_array256 (nttpack a{1}) = _a /\
             (forall i, 0 <= i < 256 => 0 <= a{2}.[i] < q) /\
             map incoeff a{2} = _a /\ valid_ptr _p 384 /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             pos_bound256_cxq res{1} 0 256 1 /\
             touches mem Glob.mem{1} _p 384 /\
             load_array384 Glob.mem{1} _p = res{2}].
proof. 
  proc.
  seq 3 2 : (#{/~a{1}}pre /\
             to_uint rp{1} = _p /\
             i{1} = i{2} /\ i{1} = 0 /\
             (forall k, 0 <= k < 16 => qx16{1}.[k] = W16.of_int 3329) /\
             map W16.to_uint (nttpack a{1}) = a{2} /\
             pos_bound256_cxq a{1} 0 256 1).
  wp; ecall{1} (poly_csubq_corr (lift_array256 a{1})); auto => />.
  move => &1 &2 [#] pos_bound_a a2_bnd a_def rp_lb rp_ub a a1_eq_a pos_bound_an />.
  split.
    + move => k k_lb k_ub.
      rewrite /(Jkem_avx2.jqx16).
      do (rewrite initiE 1://= /=).
      smt().
    + rewrite Array256.tP => i i_i />.
      rewrite -pack_ext_eq /lift_array256 Array256.tP  map_pack in a1_eq_a.
      rewrite /lift_array256 Array256.tP in a_def.
      move : (a1_eq_a i i_i).
      rewrite -a_def 1:i_i.
      do rewrite !mapiE 1,2:i_i /= map_pack.
      rewrite !mapiE 1:i_i /=.
      rewrite -!eq_incoeff (modz_small (to_sint (nttpack a).[i])) qE /=.
      move : pos_bound_an; rewrite /pos_bound256_cxq qE /= => H. apply pack_bounds; 1,2: smt(). 
      rewrite modz_small; 1: by smt( qE). 
      rewrite -to_sint_unsigned. 
      move : (pack_bounds a 0 q). 
      by move : pos_bound_an; rewrite /pos_bound256_cxq qE /#.
      by smt().
  while (#{/~mem}{~i{1}=0}pre /\ i{1} = i{2} /\ 0 <= i{1} <= 2 /\
         touches mem Glob.mem{1} _p (192*i{1}) /\
         (forall k, 0 <= k < 192 * i{1} => loadW8 Glob.mem{1} (_p + k) = r{2}.[k])).
  seq 24 0: (#pre /\
             (forall k, 0 <= k < 16 => W16.to_uint tt{1}.[k] = 2^12 * (asint _a.[128 * i{2} + 8 * k + 1] %% (2^4)) + asint _a.[128 * i{2} + 8 * k]) /\
             (forall k, 0 <= k < 16 => W16.to_uint t0{1}.[k] = 2^8 * (asint _a.[128 * i{2} + 8 * k + 2] %% 2^8) + (asint _a.[128 * i{2} + 8 * k + 1] %/ 2^4)) /\
             (forall k, 0 <= k < 16 => W16.to_uint t1{1}.[k] = 2^4 * (asint _a.[128 * i{2} + 8 * k + 3]) + (asint _a.[128 * i{2} + 8 * k + 2] %/ 2^8 %% 2^4)) /\
             (forall k, 0 <= k < 16 => W16.to_uint t2{1}.[k] = 2^12 * (asint _a.[128 * i{2} + 8 * k + 5] %% (2^4)) + asint _a.[128 * i{2} + 8 * k + 4]) /\
             (forall k, 0 <= k < 16 => W16.to_uint t3{1}.[k] = 2^8 * (asint _a.[128 * i{2} + 8 * k + 6] %% 2^8) + (asint _a.[128 * i{2} + 8 * k + 5] %/ 2^4)) /\
             (forall k, 0 <= k < 16 => W16.to_uint t4{1}.[k] = 2^4 * (asint _a.[128 * i{2} + 8 * k + 7]) + (asint _a.[128 * i{2} + 8 * k + 6] %/ 2^8 %% 2^4))).
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
        do (rewrite initiE 1:/# /=).
        do (rewrite (Array256.mapiE incoeff) 1:/#).
        rewrite incoeffK incoeffK.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        do (rewrite mapiE 1:/#).
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
        congr. do 3!(congr).
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.
      + move => k k_lb k_ub.
        rewrite /lift_array256.
        do (rewrite initiE 1:/# /=).
        do (rewrite (Array256.mapiE incoeff) 1:/#).
        rewrite incoeffK incoeffK.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        do (rewrite mapiE 1:/#).
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
        rewrite addzC. congr.
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.
      + move => k k_lb k_ub.
        rewrite /lift_array256.
        do (rewrite initiE 1:/# /=).
        do (rewrite (Array256.mapiE incoeff) 1:/#).
        rewrite incoeffK incoeffK.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        rewrite (pmod_small _ 16); first by move : a1_bnd => /#.
        do (rewrite mapiE 1:/#).
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
        rewrite addzC. congr.
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.

      + move => k k_lb k_ub.
        rewrite /lift_array256.
        do (rewrite initiE 1:/# /=).
        do (rewrite (Array256.mapiE incoeff) 1:/#).
        rewrite incoeffK incoeffK.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        do (rewrite mapiE 1:/#).
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
        congr.
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.

      + move => k k_lb k_ub.
        rewrite /lift_array256.
        do (rewrite initiE 1:/# /=).
        do (rewrite (Array256.mapiE incoeff) 1:/#).
        rewrite incoeffK incoeffK.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        do (rewrite mapiE 1:/#).
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
        rewrite addzC. congr.
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.

      + move => k k_lb k_ub.
        rewrite /lift_array256.
        do (rewrite initiE 1:/# /=).
        do (rewrite (Array256.mapiE incoeff) 1:/#).
        rewrite incoeffK incoeffK.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        rewrite (pmod_small _ q) 1:a1_bnd 1:/#.
        rewrite (pmod_small _ 16); first by move : a1_bnd => /#.
        do (rewrite mapiE 1:/#).
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
        rewrite addzC. congr.
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.
        rewrite /nttpack initiE 1:/# /=.
        rewrite /(nttpack_idx) //= initiE 1:/# => /#.


  seq 18 1: (#{~tt{1}}{~t0{1}}{~t1{1}}{~t2{1}}{~t3{1}}{~t4{1}}pre /\
             t0_b{1} = Array32.init (fun k => r{2}.[192 * i{1} + k]) /\
             t2_b{1} = Array32.init (fun k => r{2}.[192 * i{1} + 32 + k]) /\
             t1_b{1} = Array32.init (fun k => r{2}.[192 * i{1} + 64 + k]) /\
             t3_b{1} = Array32.init (fun k => r{2}.[192 * i{1} + 96 + k]) /\
             ttt_b{1} = Array32.init (fun k => r{2}.[192 * i{1} + 128 + k]) /\
             t4_b{1} = Array32.init (fun k => r{2}.[192 * i{1} + 160 + k])).
  wp.
  ecall{1} (shuffle8_corr tt{1} t4{1}).
  ecall{1} (shuffle8_corr t1{1} ttt{1}).
  ecall{1} (shuffle8_corr t2{1} t3{1}).
  ecall{1} (shuffle4_corr t0{1} t4{1}).
  ecall{1} (shuffle4_corr t1{1} tt{1}).
  ecall{1} (shuffle4_corr t3{1} ttt{1}).
  ecall{1} (shuffle2_corr t2{1} t4{1}).
  ecall{1} (shuffle2_corr t1{1} t0{1}).
  ecall{1} (shuffle2_corr ttt{1} tt{1}).
  ecall{1} (shuffle1_corr t3{1} t4{1}).
  ecall{1} (shuffle1_corr t1{1} t2{1}).
  ecall{1} (shuffle1_corr tt{1} t0{1}).

  skip; auto => />.

  move => &1 &2 [#] a1_bnd p_lb p_ub qx16_def pos_bound_a i_lb i_ub touch_mem_l r2_def i_tub tt_def t0_def t1_def t2_def t3_def t4_def />.
  move => res0 -> -> res1 -> -> res2 -> -> res3 -> -> res4 -> -> res5 -> ->
          res6 -> -> res7 -> -> res8 -> -> res9 res9_l res9_r res10 res10_l res10_r res11 res11_l res11_r />.
  split.
    + move => k k_lb k_ub.
      rewrite (r2_def k); first by rewrite k_lb k_ub.
      rewrite filliE 1:/#. 
      rewrite lezNgt k_ub //=.

    have tt_ddef: tt{1} = Array16.init (fun k => W16.of_int (4096 * (W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k + 1] %% 16) + W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k])).
      apply Array16.tP.
      move => x x_bnds.
      move : (tt_def x x_bnds).
      do (rewrite mapiE 1:/# /=).
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x + 1)); rewrite mapiE 1:/# => /# //=.
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x)); rewrite mapiE 1:/# => /# //=.
      rewrite initiE 1:x_bnds //=.
      rewrite -{2}(W16.to_uintK' tt{1}.[x]) => -> //=.

    have t0_ddef: t0{1} = Array16.init (fun k => W16.of_int (256 * (W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k + 2] %% 256) +
                                                             W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k + 1] %/ 16)).
      apply Array16.tP.
      move => x x_bnds.
      move : (t0_def x x_bnds).
      do (rewrite mapiE 1:/# /=).
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x + 2)); rewrite mapiE 1:/# => /# //=.
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x + 1)); rewrite mapiE 1:/# => /# //=.
      rewrite initiE 1:x_bnds //=.
      rewrite -{2}(W16.to_uintK' t0{1}.[x]) => -> //=.

    have t1_ddef: t1{1} = Array16.init (fun k => W16.of_int (16 * (W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k + 3]) +
                                                             W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k + 2] %/ 256 %% 16)).
      apply Array16.tP.
      move => x x_bnds.
      move : (t1_def x x_bnds).
      do (rewrite mapiE 1:/# /=).
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x + 3)); rewrite mapiE 1:/# => /# //=.
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x + 2)); rewrite mapiE 1:/# => /# //=.
      rewrite initiE 1:x_bnds //=.
      rewrite -{2}(W16.to_uintK' t1{1}.[x]) => -> //=.

    have t2_ddef: t2{1} = Array16.init (fun k => W16.of_int (4096 * (W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k + 5] %% 16) +
                                                             W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k + 4])).
      apply Array16.tP.
      move => x x_bnds.
      move : (t2_def x x_bnds).
      do (rewrite mapiE 1:/# /=).
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x + 5)); rewrite mapiE 1:/# => /# //=.
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x + 4)); rewrite mapiE 1:/# => /# //=.
      rewrite initiE 1:x_bnds //=.
      rewrite -{2}(W16.to_uintK' t2{1}.[x]) => -> //=.

    have t3_ddef: t3{1} = Array16.init (fun k => W16.of_int (256 * (W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k + 6] %% 256) +
                                                             W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k + 5] %/ 16)).
      apply Array16.tP.
      move => x x_bnds.
      move : (t3_def x x_bnds).
      do (rewrite mapiE 1:/# /=).
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x + 6)); rewrite mapiE 1:/# => /# //=.
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x + 5)); rewrite mapiE 1:/# => /# //=.
      rewrite initiE 1:x_bnds //=.
      rewrite -{2}(W16.to_uintK' t3{1}.[x]) => -> //=.

    have t4_ddef: t4{1} = Array16.init (fun k => W16.of_int (16 * (W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k + 7]) +
                                                             W16.to_uint (nttpack a{1}).[128 * i{2} + 8 * k + 6] %/ 256 %% 16)).
      apply Array16.tP.
      move => x x_bnds.
      move : (t4_def x x_bnds).
      do (rewrite mapiE 1:/# /=).
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x + 7)); rewrite mapiE 1:/# => /# //=.
      rewrite incoeffK (pmod_small _ q); first by move : (a1_bnd (128 * i{2} + 8 * x + 6)); rewrite mapiE 1:/# => /# //=.
      rewrite initiE 1:x_bnds //=.
      rewrite -{2}(W16.to_uintK' t4{1}.[x]) => -> //=.

    have a1_lbnd:
      forall (i0 : int),
          0 <= i0 && i0 < 256 =>
          0 <= W16.to_uint (nttpack a{1}).[i0] &&
          W16.to_uint (nttpack a{1}).[i0] < 4096.
      move => j j_bnds.
      move : (a1_bnd j j_bnds). smt(Array256.mapiE).

  do split.
    + rewrite -ext_eq_all /all_eq //=.
      do (rewrite /f16u16_t32u8 filliE 1:/# //=).
      have in_bnds: forall k, 0 <= k < 32 => 192 * i{2} <= 192 * i{2} + k && 192 * i{2} + k < 192 * i{2} + 192.
        move => k; rewrite -{1}(addz0 (192 * i{2})) lez_add2l ltz_add2l.
        smt().
      do (rewrite in_bnds 1://=).
      have -> //=: 192 * i{2} + 0 < 192 * i{2} + 192. smt().
      have idx_mod: forall k, 0 <= k < 32 => ((192 * i{2} + k) %% 3 = k %% 3). smt().
      do (rewrite idx_mod 1://=).
      rewrite (_: 192 * i{2} %% 3 = 0) //=. smt().
      rewrite modzMr.
      do (rewrite (mulzC 192 i{2}) || rewrite modzMDl || rewrite (pmod_small _ 192) 1://=).
      simplify.

      rewrite res9_l.
      rewrite tt_ddef t0_ddef t1_ddef t2_ddef t3_ddef t4_ddef /shuf8 /shuf4 /shuf2 /shuf1 => />.
      do (rewrite mapiE 1:/# //=).
      do (rewrite of_int_bits8_div 1://= //=).
      do (rewrite (mulzC 4096) (_: 4096 = 16 * 256) 1://= || rewrite -(mulzA _ 16 256)).
      do (rewrite (mulzC 256 (W16.to_uint _ %% 256))).
      do (rewrite -(W8.of_int_mod (_ * 256 + _)) || rewrite (modzMDl _ _ 256) || rewrite W8.of_int_mod).
      simplify.
      do (rewrite (divzMDl _ _ 256) 1://=).
      simplify.
      do (rewrite -(divzMr _ 16 256) 1..2://= || (rewrite (pdiv_small _ 4096); first by move : a1_lbnd => /#) ||
          rewrite addz0 || rewrite W8.of_int_mod).
      simplify.
      do (rewrite -(W8.of_int_mod (16 * _ + _)) || rewrite -(modzDm (16 * _) (_ %% 16) 256) || rewrite (pmod_small (_ %% 16) 256) 1:/#).
      do rewrite W8.of_int_mod.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (mulzC 16 (W16.to_uint _)) -(mulz_modl 16 _ 16) 1://=).
      simplify.
      do (rewrite (pmod_small (_ %/ 256) 16); first by move : a1_lbnd; smt()).
      simplify.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (divzMr _ 16 16) 1..2://= || rewrite (divzMDl _ _ 16) 1://= || (rewrite (pdiv_small (_ %/ 16 %/ 16) 16); first by move : a1_lbnd => /#)).
      rewrite addz0 //=.

    + rewrite -ext_eq_all /all_eq //=.
      do (rewrite /f16u16_t32u8 filliE 1:/# //=).
      have in_bnds: forall k, 32 <= k < 64 => 192 * i{2} <= 192 * i{2} + k && 192 * i{2} + k < 192 * i{2} + 192.
        move => k; rewrite -{1}(addz0 (192 * i{2})) lez_add2l ltz_add2l.
        smt().
      do (rewrite in_bnds 1://=).
      have idx_mod: forall k, 32 <= k < 64 => ((192 * i{2} + k) %% 3 = k %% 3). smt().
      do (rewrite idx_mod 1://=).
      do (rewrite (mulzC 192 i{2}) || rewrite modzMDl || rewrite (pmod_small _ 192) 1://=).
      simplify.

      rewrite res10_l.
      rewrite tt_ddef t0_ddef t1_ddef t2_ddef t3_ddef t4_ddef /shuf8 /shuf4 /shuf2 /shuf1 => />.
      do (rewrite mapiE 1:/# //=).
      do (rewrite of_int_bits8_div 1://= //=).
      do (rewrite (mulzC 4096) (_: 4096 = 16 * 256) 1://= || rewrite -(mulzA _ 16 256)).
      do (rewrite (mulzC 256 (W16.to_uint _ %% 256))).
      do (rewrite -(W8.of_int_mod (_ * 256 + _)) || rewrite (modzMDl _ _ 256) || rewrite W8.of_int_mod).
      simplify.
      do (rewrite (divzMDl _ _ 256) 1://=).
      simplify.
      do (rewrite -(divzMr _ 16 256) 1..2://= || (rewrite (pdiv_small _ 4096); first by move : a1_lbnd => /#) ||
          rewrite addz0 || rewrite W8.of_int_mod).
      simplify.
      simplify.
      do (rewrite -(W8.of_int_mod (16 * _ + _)) || rewrite -(modzDm (16 * _) (_ %% 16) 256) || rewrite (pmod_small (_ %% 16) 256) 1:/#).
      do rewrite W8.of_int_mod.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (mulzC 16 (W16.to_uint _)) -(mulz_modl 16 _ 16) 1://=).
      simplify.
      do (rewrite (pmod_small (_ %/ 256) 16); first by move : a1_lbnd; smt()).
      simplify.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (divzMr _ 16 16) 1..2://= || rewrite (divzMDl _ _ 16) 1://= || (rewrite (pdiv_small (_ %/ 16 %/ 16) 16); first by move : a1_lbnd => /#)).
      rewrite addz0 //=.

    + rewrite -ext_eq_all /all_eq //=.
      do (rewrite /f16u16_t32u8 filliE 1:/# //=).
      have in_bnds: forall k, 64 <= k < 96 => 192 * i{2} <= 192 * i{2} + k && 192 * i{2} + k < 192 * i{2} + 192.
        move => k; rewrite -{1}(addz0 (192 * i{2})) lez_add2l ltz_add2l.
        smt().
      do (rewrite in_bnds 1://=).
      have idx_mod: forall k, 64 <= k < 96 => ((192 * i{2} + k) %% 3 = k %% 3). smt().
      do (rewrite idx_mod 1://=).
      do (rewrite (mulzC 192 i{2}) || rewrite modzMDl || rewrite (pmod_small _ 192) 1://=).
      simplify.

      rewrite res11_l.
      rewrite tt_ddef t0_ddef t1_ddef t2_ddef t3_ddef t4_ddef /shuf8 /shuf4 /shuf2 /shuf1 => />.
      do (rewrite mapiE 1:/# //=).
      do (rewrite of_int_bits8_div 1://= //=).
      do (rewrite (mulzC 4096) (_: 4096 = 16 * 256) 1://= || rewrite -(mulzA _ 16 256)).
      do (rewrite (mulzC 256 (W16.to_uint _ %% 256))).
      do (rewrite -(W8.of_int_mod (_ * 256 + _)) || rewrite (modzMDl _ _ 256) || rewrite W8.of_int_mod).
      simplify.
      do (rewrite (divzMDl _ _ 256) 1://=).
      simplify.
      do (rewrite -(divzMr _ 16 256) 1..2://= || (rewrite (pdiv_small _ 4096); first by move : a1_lbnd => /#) ||
          rewrite addz0 || rewrite W8.of_int_mod).
      simplify.
      do (rewrite -(W8.of_int_mod (16 * _ + _)) || rewrite -(modzDm (16 * _) (_ %% 16) 256) || rewrite (pmod_small (_ %% 16) 256) 1:/#).
      do rewrite W8.of_int_mod.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (mulzC 16 (W16.to_uint _)) -(mulz_modl 16 _ 16) 1://=).
      simplify.
      do (rewrite (pmod_small (_ %/ 256) 16); first by move : a1_lbnd; smt()).
      simplify.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (divzMr _ 16 16) 1..2://= || rewrite (divzMDl _ _ 16) 1://= || (rewrite (pdiv_small (_ %/ 16 %/ 16) 16); first by move : a1_lbnd => /#)).
      rewrite addz0 //=.

    + rewrite -ext_eq_all /all_eq //=.
      do (rewrite /f16u16_t32u8 filliE 1:/# //=).
      have in_bnds: forall k, 96 <= k < 128 => 192 * i{2} <= 192 * i{2} + k && 192 * i{2} + k < 192 * i{2} + 192.
        move => k; rewrite -{1}(addz0 (192 * i{2})) lez_add2l ltz_add2l.
        smt().
      do (rewrite in_bnds 1://=).
      have idx_mod: forall k, 96 <= k < 128 => ((192 * i{2} + k) %% 3 = k %% 3). smt().
      do (rewrite idx_mod 1://=).
      do (rewrite (mulzC 192 i{2}) || rewrite modzMDl || rewrite (pmod_small _ 192) 1://=).
      simplify.

      rewrite res9_r.
      rewrite tt_ddef t0_ddef t1_ddef t2_ddef t3_ddef t4_ddef /shuf8 /shuf4 /shuf2 /shuf1 => />.
      do (rewrite mapiE 1:/# //=).
      do (rewrite of_int_bits8_div 1://= //=).
      do (rewrite (mulzC 4096) (_: 4096 = 16 * 256) 1://= || rewrite -(mulzA _ 16 256)).
      do (rewrite (mulzC 256 (W16.to_uint _ %% 256))).
      do (rewrite -(W8.of_int_mod (_ * 256 + _)) || rewrite (modzMDl _ _ 256) || rewrite W8.of_int_mod).
      simplify.
      do (rewrite (divzMDl _ _ 256) 1://=).
      simplify.
      do (rewrite -(divzMr _ 16 256) 1..2://= || (rewrite (pdiv_small _ 4096); first by move : a1_lbnd => /#) ||
          rewrite addz0 || rewrite W8.of_int_mod).
      simplify.
      do (rewrite -(W8.of_int_mod (16 * _ + _)) || rewrite -(modzDm (16 * _) (_ %% 16) 256) || rewrite (pmod_small (_ %% 16) 256) 1:/#).
      do rewrite W8.of_int_mod.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (mulzC 16 (W16.to_uint _)) -(mulz_modl 16 _ 16) 1://=).
      simplify.
      do (rewrite (pmod_small (_ %/ 256) 16); first by move : a1_lbnd; smt()).
      simplify.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (divzMr _ 16 16) 1..2://= || rewrite (divzMDl _ _ 16) 1://= || (rewrite (pdiv_small (_ %/ 16 %/ 16) 16); first by move : a1_lbnd => /#)).
      rewrite addz0 //=.

    + rewrite -ext_eq_all /all_eq //=.
      do (rewrite /f16u16_t32u8 filliE 1:/# //=).
      have in_bnds: forall k, 128 <= k < 160 => 192 * i{2} <= 192 * i{2} + k && 192 * i{2} + k < 192 * i{2} + 192.
        move => k; rewrite -{1}(addz0 (192 * i{2})) lez_add2l ltz_add2l.
        smt().
      do (rewrite in_bnds 1://=).
      have idx_mod: forall k, 128 <= k < 160 => ((192 * i{2} + k) %% 3 = k %% 3). smt().
      do (rewrite idx_mod 1://=).
      do (rewrite (mulzC 192 i{2}) || rewrite modzMDl || rewrite (pmod_small _ 192) 1://=).
      simplify.

      rewrite res10_r.
      rewrite tt_ddef t0_ddef t1_ddef t2_ddef t3_ddef t4_ddef /shuf8 /shuf4 /shuf2 /shuf1 => />.
      do (rewrite mapiE 1:/# //=).
      do (rewrite of_int_bits8_div 1://= //=).
      do (rewrite (mulzC 4096) (_: 4096 = 16 * 256) 1://= || rewrite -(mulzA _ 16 256)).
      do (rewrite (mulzC 256 (W16.to_uint _ %% 256))).
      do (rewrite -(W8.of_int_mod (_ * 256 + _)) || rewrite (modzMDl _ _ 256) || rewrite W8.of_int_mod).
      simplify.
      do (rewrite (divzMDl _ _ 256) 1://=).
      simplify.
      do (rewrite -(divzMr _ 16 256) 1..2://= || (rewrite (pdiv_small _ 4096); first by move : a1_lbnd => /#) ||
          rewrite addz0 || rewrite W8.of_int_mod).
      simplify.
      do (rewrite -(W8.of_int_mod (16 * _ + _)) || rewrite -(modzDm (16 * _) (_ %% 16) 256) || rewrite (pmod_small (_ %% 16) 256) 1:/#).
      do rewrite W8.of_int_mod.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (mulzC 16 (W16.to_uint _)) -(mulz_modl 16 _ 16) 1://=).
      simplify.
      do (rewrite (pmod_small (_ %/ 256) 16); first by move : a1_lbnd; smt()).
      simplify.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (divzMr _ 16 16) 1..2://= || rewrite (divzMDl _ _ 16) 1://= || (rewrite (pdiv_small (_ %/ 16 %/ 16) 16); first by move : a1_lbnd => /#)).
      rewrite addz0 //=.

    + rewrite -ext_eq_all /all_eq //=.
      do (rewrite /f16u16_t32u8 filliE 1:/# //=).
      have in_bnds: forall k, 160 <= k < 192 => 192 * i{2} <= 192 * i{2} + k && 192 * i{2} + k < 192 * i{2} + 192.
        move => k; rewrite -{1}(addz0 (192 * i{2})) lez_add2l ltz_add2l.
        smt().
      do (rewrite in_bnds 1://=).
      have idx_mod: forall k, 160 <= k < 192 => ((192 * i{2} + k) %% 3 = k %% 3). smt().
      do (rewrite idx_mod 1://=).
      do (rewrite (mulzC 192 i{2}) || rewrite modzMDl || rewrite (pmod_small _ 192) 1://=).
      simplify.

      rewrite res11_r.
      rewrite tt_ddef t0_ddef t1_ddef t2_ddef t3_ddef t4_ddef /shuf8 /shuf4 /shuf2 /shuf1 => />.
      do (rewrite mapiE 1:/# //=).
      do (rewrite of_int_bits8_div 1://= //=).
      do (rewrite (mulzC 4096) (_: 4096 = 16 * 256) 1://= || rewrite -(mulzA _ 16 256)).
      do (rewrite (mulzC 256 (W16.to_uint _ %% 256))).
      do (rewrite -(W8.of_int_mod (_ * 256 + _)) || rewrite (modzMDl _ _ 256) || rewrite W8.of_int_mod).
      simplify.
      do (rewrite (divzMDl _ _ 256) 1://=).
      simplify.
      do (rewrite -(divzMr _ 16 256) 1..2://= || (rewrite (pdiv_small _ 4096); first by move : a1_lbnd => /#) ||
          rewrite addz0 || rewrite W8.of_int_mod).
      simplify.
      do (rewrite -(W8.of_int_mod (16 * _ + _)) || rewrite -(modzDm (16 * _) (_ %% 16) 256) || rewrite (pmod_small (_ %% 16) 256) 1:/#).
      do rewrite W8.of_int_mod.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (mulzC 16 (W16.to_uint _)) -(mulz_modl 16 _ 16) 1://=).
      simplify.
      do (rewrite (pmod_small (_ %/ 256) 16); first by move : a1_lbnd; smt()).
      simplify.
      rewrite (_: 256 = 16 * 16) 1://=.
      do (rewrite (divzMr _ 16 16) 1..2://= || rewrite (divzMDl _ _ 16) 1://= || (rewrite (pdiv_small (_ %/ 16 %/ 16) 16); first by move : a1_lbnd => /#)).
      rewrite addz0 //=.

  inline*; wp; skip; auto => />.
  move => &1 &2 [#] a1_bnd p_lb p_ub qx16_def pos_bound_a i_lb i_ub touch_mem_l r2_def i_tub />.
  do split.
    + move : i_lb => /#.
    + move : i_tub => /#.
    + rewrite /touches /= => j j_bnds.
      do rewrite get_storesE size_to_list /=. 
      have out_bnds: forall k, 0 <= k <= 160 => !(to_uint rp{1} + (192 * i{2} + k) <= to_uint rp{1} + j && to_uint rp{1} + j < to_uint rp{1} + (192 * i{2} + k) + 32).
        move => k k_bnds.
        rewrite mulzDr mulz1 in j_bnds.
        move : j_bnds => /#.
      rewrite !to_uintD_small /= !of_uintK 1..6:/# /= !modz_small 1..6:/#. 
      rewrite -(addz0 (to_uint rp{1} + 192 * i{2})) -(addzA _ (192 * i{2}) 0).
      do (rewrite out_bnds 1://=).
      simplify.
      rewrite touch_mem_l //=; first by move : j_bnds => /#.
    + rewrite mulzDr mulz1 => k k_lb k_ub.
      rewrite /loadW8.
      do rewrite /stores size_to_list.
      rewrite !to_uintD_small /= !of_uintK 1..6:/# /= !modz_small 1..6:/#. 
      rewrite /to_list /mkseq -iotaredE /=. (* TODO: find or write lemma *)
      do (rewrite initiE 1://=).
      simplify.
      case (192 * i{2} <= k) => k_tlb.
        do (rewrite get_setE).
        smt().
      move : k_tlb; rewrite -ltzNge => k_tub.
        do (rewrite get_set_neqE_s; first  by move : k_lb k_tub => /#).
        apply r2_def; first by rewrite k_lb k_tub /=.
  skip; auto => />.
  move => &1 &2 [#] a1_bnd p_lb p_ub qx16_def pos_bound_a />.
  split.
    smt().
  move => memL iR r2 i_tlb i_lb i_ub />.
  have -> //=: iR = 2.
    move : i_tlb i_ub => /#.
  move => touch_mem r2_def />.
  rewrite /load_array384.
  apply Array384.tP => i i_bnds.
  rewrite -r2_def 1:i_bnds /loadW8 initiE 1:i_bnds //=.
qed.

lemma poly_tobytes_ll: islossless Mprevec.poly_tobytes.
proof.
  proc.
  while (0 <= i <= 2) (2-i).
    move => *; inline *; auto => />.
  move => &hr i_lb i_ub i_tub.
  split.
  move : i_lb i_tub => /#.
  rewrite ltz_add2l; smt().
  by wp; call (poly_csubq_ll); auto =>  /> /#.
qed.

op pos_bound16_b (coefs : W16.t Array16.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] b.

lemma poly_frombytes_corr mem _p (_a : W8.t Array384.t): 
    equiv [ Mprevec.poly_frombytes ~ EncDec_AVX2.decode12_opt :
            valid_ptr _p 384 /\
            Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
            load_array384 Glob.mem{1} _p = _a /\ a{2} = _a
            ==>
            Glob.mem{1} = mem /\
            map W16.to_sint (nttpack res{1}) = res{2} /\
            pos_bound256_cxq res{1} 0 256 2 ].
proof. 
  proc.
  seq 2 2 : (#pre /\
             to_uint ap{1} = _p /\
             i{1} = i{2} /\ i{1} = 0 /\
             mask{1} = Array16.init (fun i => W16.of_int (2^12-1))).
    wp; skip; auto => />.
    move => &1 ap_lb ap_ub.
      by rewrite -Array16.ext_eq_all /Array16.all_eq.
  while (#{~i{1}=0}pre /\ i{1} = i{2} /\ 0 <= i{1} <= 2 /\
         (forall k, 0 <= k < 128 * i{2} => W16.to_sint (nttpack rp{1}).[k] = r{2}.[k]) /\
         (forall k, 0 <= k < 128 * i{2} => bpos16 rp{1}.[k] 4096)).
  seq 6 0: (#pre /\
            t0_b{1} = Array32.init (fun k => a{2}.[192 * i{1} + k]) /\
            t1_b{1} = Array32.init (fun k => a{2}.[192 * i{1} + 32 + k]) /\
            t2_b{1} = Array32.init (fun k => a{2}.[192 * i{1} + 64 + k]) /\
            t3_b{1} = Array32.init (fun k => a{2}.[192 * i{1} + 96 + k]) /\
            t4_b{1} = Array32.init (fun k => a{2}.[192 * i{1} + 128 + k]) /\
            t5_b{1} = Array32.init (fun k => a{2}.[192 * i{1} + 160 + k])).
    inline *; wp; skip; auto => />.
    move => &1 &2 ap_lb ap_ub i_lb i_ub rp_def rp_bnd i_tub />.
    rewrite /load_array384 /= /loadW8 /=.
    do split.
        + apply Array32.tP => j j_bnds.
          do (rewrite initiE 1:j_bnds /=).
          rewrite initiE 1:/# /=.
          rewrite to_uintD_small. by rewrite of_uintK; move : ap_lb ap_ub i_lb i_tub => /#.
          rewrite addzA of_uintK (pmod_small _ W64.modulus) //=; first by move : i_lb i_tub => /#.
        + apply Array32.tP => j j_bnds.
          do (rewrite initiE 1:j_bnds /=).
          rewrite initiE 1:/# /=.
          rewrite to_uintD_small. by rewrite of_uintK; move : ap_lb ap_ub i_lb i_tub => /#.
          rewrite addzA of_uintK (pmod_small _ W64.modulus) //=; first by move : i_lb i_tub => /#.
        + apply Array32.tP => j j_bnds.
          do (rewrite initiE 1:j_bnds /=).
          rewrite initiE 1:/# /=.
          rewrite to_uintD_small. by rewrite of_uintK; move : ap_lb ap_ub i_lb i_tub => /#.
          rewrite addzA of_uintK (pmod_small _ W64.modulus) //=; first by move : i_lb i_tub => /#.
        + apply Array32.tP => j j_bnds.
          do (rewrite initiE 1:j_bnds /=).
          rewrite initiE 1:/# /=.
          rewrite to_uintD_small. by rewrite of_uintK; move : ap_lb ap_ub i_lb i_tub => /#.
          rewrite addzA of_uintK (pmod_small _ W64.modulus) //=; first by move : i_lb i_tub => /#.
        + apply Array32.tP => j j_bnds.
          do (rewrite initiE 1:j_bnds /=).
          rewrite initiE 1:/# /=.
          rewrite to_uintD_small. by rewrite of_uintK; move : ap_lb ap_ub i_lb i_tub => /#.
          rewrite addzA of_uintK (pmod_small _ W64.modulus) //=; first by move : i_lb i_tub => /#.
        + apply Array32.tP => j j_bnds.
          do (rewrite initiE 1:j_bnds /=).
          rewrite initiE 1:/# /=.
          rewrite to_uintD_small. by rewrite of_uintK; move : ap_lb ap_ub i_lb i_tub => /#.
          rewrite addzA of_uintK (pmod_small _ W64.modulus) //=; first by move : i_lb i_tub => /#.
  seq 18 1: (#pre /\
             t6{1} = Array16.init (fun k => W16.of_int (2^12 * (r{2}.[128 * i{2} + 8 * k + 1] %% (2^4)) + r{2}.[128 * i{2} + 8 * k])) /\
             t3{1} = Array16.init (fun k => W16.of_int (2^8 * (r{2}.[128 * i{2} + 8 * k + 2] %% 2^8) + (r{2}.[128 * i{2} + 8 * k + 1] %/ 2^4))) /\
             t0{1} = Array16.init (fun k => W16.of_int (2^4 * (r{2}.[128 * i{2} + 8 * k + 3]) + (r{2}.[128 * i{2} + 8 * k + 2] %/ 2^8 %% 2^4))) /\
             t4{1} = Array16.init (fun k => W16.of_int (2^12 * (r{2}.[128 * i{2} + 8 * k + 5] %% (2^4)) + r{2}.[128 * i{2} + 8 * k + 4])) /\
             t1{1} = Array16.init (fun k => W16.of_int (2^8 * (r{2}.[128 * i{2} + 8 * k + 6] %% 2^8) + (r{2}.[128 * i{2} + 8 * k + 5] %/ 2^4))) /\
             t5{1} = Array16.init (fun k => W16.of_int (2^4 * (r{2}.[128 * i{2} + 8 * k + 7]) + (r{2}.[128 * i{2} + 8 * k + 6] %/ 2^8 %% 2^4))) /\
             (forall k, 0 <= k < 128 * i{2} + 128 => 0 <= r{2}.[k] < 4096)).
    wp.
    ecall{1} (shuffle1_corr t2{1} t5{1}).
    ecall{1} (shuffle1_corr t1{1} t4{1}).
    ecall{1} (shuffle1_corr t0{1} t3{1}).
    ecall{1} (shuffle2_corr tt{1} t5{1}).
    ecall{1} (shuffle2_corr t4{1} t3{1}).
    ecall{1} (shuffle2_corr t2{1} t1{1}).
    ecall{1} (shuffle4_corr t0{1} t5{1}).
    ecall{1} (shuffle4_corr t3{1} t1{1}).
    ecall{1} (shuffle4_corr tt{1} t4{1}).
    ecall{1} (shuffle8_corr t2{1} t5{1}).
    ecall{1} (shuffle8_corr t1{1} t4{1}).
    ecall{1} (shuffle8_corr t0{1} t3{1}).
    wp; skip; auto => />.
    move => &1 &2 ap_lb ap_ub i_lb i_ub rp_def rp_bnd i_tub />.

    move => res0 -> -> res1 -> -> res2 -> -> res3 -> -> res4 -> -> res5 -> ->
            res6 -> -> res7 -> -> res8 -> -> res9 res9_l res9_r res10 res10_l res10_r res11 res11_l res11_r />.
      have idx_mod: forall k, 0 <= k < 128 => (128 * i{2} + k) %% 2 = k %% 2. smt().
      have idx_div: forall k, 0 <= k < 128 => (128 * i{2} + k) %/ 2 = 64 * i{2} + k %/ 2. smt().

      do split.
        + move => k k_lb k_ub.
          rewrite filliE 1:/# //= rp_def 1://=.
          by move : k_ub => /ltzNge -> />.
        + rewrite res9_l.
          rewrite /f32u8_t16u16.
          rewrite -ext_eq_all /all_eq //=.
          rewrite /shuf8 /shuf4 /shuf2 /shuf1 => />.
          do (rewrite filliE 1:/# //= || rewrite idx_mod 1://= || rewrite idx_div 1://=).
          rewrite (_: 128 * i{2} %% 2 = 0). by smt().
          rewrite (_: 128 * i{2} %/ 2 = 64 * i{2}). by smt().
          do (rewrite lez_addl || rewrite lez_add2l || rewrite ltz_add2l || rewrite ltz_addl).
          simplify.
          do (rewrite (mulzDr 3 _ _) || rewrite -(mulzA 3 _ _) //=).
          rewrite /load_array384 /= /loadW8 /=.
          do (rewrite initiE 1:/#).
          simplify.
          do (rewrite modzMDl || (rewrite (pmod_small (W8.to_uint _ %/ 16) 16); first by move : W8.to_uint_cmp => /#) ||
              rewrite (mulzC 4096) (_: 4096 = 16 * 256) 1://= -(mulzA _ 16 256) divzE).
          do split.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp. 
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
           apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.

        + rewrite res9_r.
          rewrite /f32u8_t16u16.
          rewrite -ext_eq_all /all_eq //=.
          rewrite /shuf8 /shuf4 /shuf2 /shuf1 => />.
          do (rewrite filliE 1:/# //= || rewrite idx_mod 1://= || rewrite idx_div 1://=).
          do (rewrite lez_addl || rewrite lez_add2l || rewrite ltz_add2l || rewrite ltz_addl).
          do (rewrite -(mulzA 3 _ _) || rewrite (mulzDr 3 _ _)).
          rewrite /load_array384 /= /loadW8 //=.
          do (rewrite initiE 1:/#).
          simplify.
          do (rewrite modzMDr || rewrite divzMDl 1://= || (rewrite (pdiv_small (W8.to_uint _ %/ 16) 16); first by move : W8.to_uint_cmp => /#)).
          do split. (* TODO: improve maybe ?? *)
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.

        + rewrite res10_l.
          rewrite /f32u8_t16u16.
          rewrite -ext_eq_all /all_eq //=.
          rewrite /shuf8 /shuf4 /shuf2 /shuf1 => />.
          do (rewrite filliE 1:/# //= || rewrite idx_mod 1://= || rewrite idx_div 1://=).
          do (rewrite lez_addl || rewrite lez_add2l || rewrite ltz_add2l || rewrite ltz_addl).
          do (rewrite -(mulzA 3 _ _) || rewrite (mulzDr 3 _ _)).
          rewrite /load_array384 /= /loadW8 //=.
          do (rewrite initiE 1:/#).
          simplify.
          do (rewrite (mulzDr 16 _ _) || rewrite (mulzA _ 16 16) //= || rewrite (mulzC 16 _) || rewrite divzMDr 1://= ||
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp //= || rewrite divzE || rewrite (pmod_small (W8.to_uint _ %% 16) 16) 1:modz_cmp 1://=).
          do split.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.

        + rewrite res10_r.
          rewrite /f32u8_t16u16.
          rewrite -ext_eq_all /all_eq //=.
          rewrite /shuf8 /shuf4 /shuf2 /shuf1 => />.
          do (rewrite filliE 1:/# //= || rewrite idx_mod 1://= || rewrite idx_div 1://=).
          do (rewrite lez_addl || rewrite lez_add2l || rewrite ltz_add2l || rewrite ltz_addl).
          simplify.
          do (rewrite -(mulzA 3 _ _) || rewrite (mulzDr 3 _ _)).
          rewrite /load_array384 /= /loadW8 /=.
          do (rewrite initiE 1:/#).
          simplify.
          do (rewrite modzMDl || (rewrite (pmod_small (W8.to_uint _ %/ 16) 16); first by move : W8.to_uint_cmp => /#) ||
              rewrite (mulzC 4096) (_: 4096 = 16 * 256) 1://= -(mulzA _ 16 256) divzE).
          do split.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite divzMDl 1://= divzMDr 1://=.
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modzMDr modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.

        + rewrite res11_l.
          rewrite /f32u8_t16u16.
          rewrite -ext_eq_all /all_eq //=.
          rewrite /shuf8 /shuf4 /shuf2 /shuf1 => />.
          do (rewrite filliE 1:/# //= || rewrite idx_mod 1://= || rewrite idx_div 1://=).
          do (rewrite lez_addl || rewrite lez_add2l || rewrite ltz_add2l || rewrite ltz_addl).
          do (rewrite -(mulzA 3 _ _) || rewrite (mulzDr 3 _ _)).
          rewrite /load_array384 /= /loadW8 //=.
          do (rewrite initiE 1:/#).
          simplify.
          do (rewrite modzMDr || rewrite divzMDl 1://= || (rewrite (pdiv_small (W8.to_uint _ %/ 16) 16); first by move : W8.to_uint_cmp => /#)).
          do split. (* TODO: improve maybe ?? *)
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
          apply W2u8.allP => //=.
            do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
            rewrite (mulzC 256 _) divzMDl 1://= (pdiv_small _ 256) 1:W8.to_uint_cmp (pmod_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.

        + rewrite res11_r.
          rewrite /f32u8_t16u16.
          rewrite -ext_eq_all /all_eq //=.
          rewrite /shuf8 /shuf4 /shuf2 /shuf1 => />.
          do (rewrite filliE 1:/# //= || rewrite idx_mod 1://= || rewrite idx_div 1://=).
          do (rewrite lez_addl || rewrite lez_add2l || rewrite ltz_add2l || rewrite ltz_addl).
          do (rewrite -(mulzA 3 _ _) || rewrite (mulzDr 3 _ _)).
          rewrite /load_array384 /= /loadW8 //=.
          do (rewrite initiE 1:/#).
          simplify.
          do (rewrite (mulzDr 16 _ _) || rewrite (mulzA _ 16 16) //= || rewrite (mulzC 16 _) || rewrite divzMDr 1://= ||
              rewrite (pdiv_small _ 256) 1:W8.to_uint_cmp //= || rewrite divzE || rewrite (pmod_small (W8.to_uint _ %% 16) 16) 1:modz_cmp 1://=).
          do split.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.
            apply W2u8.allP => //=.
              do (rewrite initiE 1:/# /= || rewrite of_int_bits8_div 1://= //=).
              rewrite -addzA divzMDl 1://= -(addzA _ _ (W8.to_uint _ %% 16)) addNz addz0 (pdiv_small _ 256) 1:W8.to_uint_cmp.
              split; 1: by rewrite - W8.of_int_mod /= modzMDl modz_small /=;
              smt(StdOrder.IntOrder.ger0_def W8.to_uint_cmp pow2_8). 
              by ring;rewrite W8.to_uintK;ring.

        + move => k k_lb k_ub.
          do (rewrite filliE 1:/# //=).
          do (rewrite /load_array384 /= /loadW8 /=).
          do (rewrite initiE /=; first by move : ap_lb ap_ub => /#).
          case (128 * i{2} <= k) => k_tlb.
            + rewrite k_ub //=.
              pose x := mem.[to_uint ap{1} + (3 * (k %/ 2) + k %% 2)].
              pose y := mem.[to_uint ap{1} + (3 * (k %/ 2) + k %% 2 + 1)].
              move : (W8.to_uint_cmp x) (W8.to_uint_cmp y).
              move : (modz_cmp (to_uint y) 16).
              smt().
            + simplify.
              rewrite -rp_def 1:/# //=.
              move : k_tlb => /ltzNge k_tub {k_ub}.
              move : (pack128_bounds rp{1} i{2} 0 4096) => /#.
  seq 22 0 : (#{~t6{1}}{~t7{1}}{~t8{1}}{~t9{1}}{~t10{1}}{~t4{1}}{~t11{1}}{~tt{1}}pre /\
              t6{1} = Array16.init (fun k => W16.of_int (nttunpack r{2}).[128 * i{1} + k]) /\
              t7{1} = Array16.init (fun k => W16.of_int (nttunpack r{2}).[128 * i{1} + 16 + k]) /\
              t8{1} = Array16.init (fun k => W16.of_int (nttunpack r{2}).[128 * i{1} + 32 + k]) /\
              t9{1} = Array16.init (fun k => W16.of_int (nttunpack r{2}).[128 * i{1} + 48 + k]) /\
              t4{1} = Array16.init (fun k => W16.of_int (nttunpack r{2}).[128 * i{1} + 64 + k]) /\
              t10{1} = Array16.init (fun k => W16.of_int (nttunpack r{2}).[128 * i{1} + 80 + k]) /\
              t11{1} = Array16.init (fun k => W16.of_int (nttunpack r{2}).[128 * i{1} + 96 + k]) /\
              tt{1} = Array16.init (fun k => W16.of_int (nttunpack r{2}).[128 * i{1} + 112 + k])).
  inline *; wp; skip; auto => />.
  move => &1 &2 [#] ap_lb ap_ub i_lb i_ub rp_def rp_bnds i_tub r2_bnds />.

  do split.
    + rewrite Array16.tP => j j_bnds.
      do (rewrite initiE 1:/# /=). 
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://= of_uintK (modz_dvd _ _ (2^12)) 1://=
              (mulzC 4096 _) (modzMDl _ _ 4096).
      rewrite (pmod_small _ 4096); first by apply r2_bnds; smt().
      rewrite /nttunpack initiE 1:/# //=.
      rewrite /(nttunpack_idx) //= initiE 1:/# => /#.
    + rewrite Array16.tP => j j_bnds.
      do (rewrite initiE 1:/# /=).
      rewrite shr_shrw 1://= shrDP 1://=.
      rewrite (pmod_small _ W16.modulus); first by move : r2_bnds; smt().
      rewrite (mulzC 4096 _) divzMDl 1://= (pdiv_small _ 4096) 1:r2_bnds 1:/# /=.
      rewrite andw_orwDr.
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://=.
      rewrite of_uintK modz_dvd 1://= (pmod_small _ 4096) 1:/#.
      rewrite shl_shlw 1://= shlMP 1://=.
      rewrite mulzDl (mulzC 256 _) mulzA //=.
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://=.
      rewrite of_uintK (modz_dvd _ W16.modulus) 1://= modzMDl (pmod_small _ 4096) 1:/#.
      rewrite orw_disjoint.
        + apply W16.ext_eq => x xb; rewrite /W16.(`&`) map2E initiE //=.
          case (!(0 <= x < 4)).
            + move => kbb; have -> : !(W16.of_int (r{2}.[128 * i{2} + 8 * j + 1] %% 16)).[x]; last by smt().
              rewrite get_to_uint xb /= //=. 
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ 4 x  _); 1,2: smt().
              rewrite of_uintK (pmod_small _ W16.modulus) 1:/#.
              have -> : r{2}.[128 * i{2} + 8 * j + 1] %% 16 %/ 2 ^ x = 0; last by smt(mod0z).
              apply pdiv_small; move : (modz_cmp r{2}.[128 * i{2} + 8 * j + 1] 16); 1: smt().
            + move => /negbNE xbb. have -> : !(W16.of_int (r{2}.[128 * i{2} + 8 * j + 1] %/ 16 * 16)).[x]; last by smt().
              rewrite get_to_uint xb /= //=.
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ x 3  _); 1,2: smt().
              rewrite of_uintK (pmod_small _ W16.modulus) 1:/#.
              rewrite (_: 16 = 2^4) // divMr; first by apply le_dvd_pow; smt().  
              rewrite expz_div // 1:/# => *; move => *; apply dvdz_mull.
              have -> : 2 %| 2 ^ (4 - x) = 2^1 %| 2 ^ (4 - x) by auto.  
              by apply le_dvd_pow; smt().
      rewrite divzE //= addzC -addzA //=.
      rewrite /nttunpack initiE 1:/# //=.
      rewrite /(nttunpack_idx) //= initiE 1:/# => /#.
    + rewrite Array16.tP => j j_bnds.
      do (rewrite initiE 1:/# /=).
      rewrite shr_shrw 1://= shrDP 1://=.
      rewrite (pmod_small _ W16.modulus); first by move : r2_bnds; smt().
      rewrite (mulzC 256 _) divzMDl 1://= -(divz_mulp _ 16 256) 1..2://= (pdiv_small _ 4096) 1:r2_bnds 1:/# //=.
      rewrite shl_shlw 1://= shlMP 1://=.
      rewrite mulzDl (mulzC 16 _) mulzA //=.
      rewrite andw_orwDr.
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://=.
      rewrite of_uintK modz_dvd 1://= (pmod_small _ 4096) 1:/#.
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://=.
      rewrite of_uintK (modz_dvd _ W16.modulus) 1://= modzMDl (pmod_small _ 4096) 1:/# (pmod_small _ 16) 1:/#.

      rewrite orw_disjoint.
        + apply W16.ext_eq => x xb; rewrite /W16.(`&`) map2E initiE //=.
          case (!(0 <= x < 8)).
            + move => kbb; have -> : !(W16.of_int (r{2}.[128 * i{2} + 8 * j + 2] %% 256)).[x]; last by smt().
              rewrite get_to_uint xb /= //=. 
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ 8 x  _); 1,2: smt().
              rewrite of_uintK (pmod_small _ W16.modulus) 1:/#.
              have -> : r{2}.[128 * i{2} + 8 * j + 2] %% 256 %/ 2 ^ x = 0; last by smt(mod0z).
              apply pdiv_small; move : (modz_cmp r{2}.[128 * i{2} + 8 * j + 2] 256); 1: smt().
            + move => /negbNE xbb. have -> : !(W16.of_int (r{2}.[128 * i{2} + 8 * j + 2] %/ 256 * 256)).[x]; last by smt().
              rewrite get_to_uint xb /= //=.
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ x 7  _); 1,2: smt().
              rewrite of_uintK (pmod_small _ W16.modulus) 1:/#.
              rewrite (_: 256 = 2^8) // divMr; first by apply le_dvd_pow; smt().  
              rewrite expz_div // 1:/# => *; move => *; apply dvdz_mull.
              have -> : 2 %| 2 ^ (8 - x) = 2^1 %| 2 ^ (8 - x) by auto.  
              by apply le_dvd_pow; smt().
      rewrite divzE //= addzC -addzA //=.
      rewrite /nttunpack initiE 1:/# //=.
      rewrite /(nttunpack_idx) //= initiE 1:/# => /#.
    + rewrite Array16.tP => j j_bnds.
      do (rewrite initiE 1:/# /=).
      rewrite shr_shrw 1://= shrDP 1://=.
      rewrite (pmod_small _ W16.modulus); first by move : r2_bnds; smt().
      rewrite (mulzC 16 _) divzMDl 1://= (pdiv_small _ 16) 1:modz_cmp 1://= //=.
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://=.
      rewrite of_uintK modz_dvd 1://= (pmod_small _ 4096) 1:r2_bnds 1:/#.
      rewrite /nttunpack initiE 1:/# //=.
      rewrite /(nttunpack_idx) //= initiE 1:/# => /#.
    + rewrite Array16.tP => j j_bnds.
      do (rewrite initiE 1:/# /=).
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://= of_uintK (modz_dvd _ _ (2^12)) 1://=
              (mulzC 4096 _) (modzMDl _ _ 4096).
      rewrite (pmod_small _ 4096); first by apply r2_bnds; smt().
      rewrite /nttunpack initiE 1:/# //=.
      rewrite /(nttunpack_idx) //= initiE 1:/# => /#.
    + rewrite Array16.tP => j j_bnds.
      do (rewrite initiE 1:/# /=).
      rewrite shr_shrw 1://= shrDP 1://=.
      rewrite (pmod_small _ W16.modulus); first by move : r2_bnds; smt().
      rewrite (mulzC 4096 _) divzMDl 1://= (pdiv_small _ 4096) 1:r2_bnds 1:/# /=.
      rewrite andw_orwDr.
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://=.
      rewrite of_uintK modz_dvd 1://= (pmod_small _ 4096) 1:/#.
      rewrite shl_shlw 1://= shlMP 1://=.
      rewrite mulzDl (mulzC 256 _) mulzA //=.
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://=.
      rewrite of_uintK (modz_dvd _ W16.modulus) 1://= modzMDl (pmod_small _ 4096) 1:/#.
      rewrite orw_disjoint.
        + apply W16.ext_eq => x xb; rewrite /W16.(`&`) map2E initiE //=.
          case (!(0 <= x < 4)).
            + move => kbb; have -> : !(W16.of_int (r{2}.[128 * i{2} + 8 * j + 5] %% 16)).[x]; last by smt().
              rewrite get_to_uint xb /= //=. 
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ 4 x  _); 1,2: smt().
              rewrite of_uintK (pmod_small _ W16.modulus) 1:/#.
              have -> : r{2}.[128 * i{2} + 8 * j + 5] %% 16 %/ 2 ^ x = 0; last by smt(mod0z).
              apply pdiv_small; move : (modz_cmp r{2}.[128 * i{2} + 8 * j + 5] 16); 1: smt().
            + move => /negbNE xbb. have -> : !(W16.of_int (r{2}.[128 * i{2} + 8 * j + 5] %/ 16 * 16)).[x]; last by smt().
              rewrite get_to_uint xb /= //=.
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ x 3  _); 1,2: smt().
              rewrite of_uintK (pmod_small _ W16.modulus) 1:/#.
              rewrite (_: 16 = 2^4) // divMr; first by apply le_dvd_pow; smt().  
              rewrite expz_div // 1:/# => *; move => *; apply dvdz_mull.
              have -> : 2 %| 2 ^ (4 - x) = 2^1 %| 2 ^ (4 - x) by auto.  
              by apply le_dvd_pow; smt().
      rewrite divzE //= addzC -addzA //=.
      rewrite /nttunpack initiE 1:/# //=.
      rewrite /(nttunpack_idx) //= initiE 1:/# => /#.
    + rewrite Array16.tP => j j_bnds.
      do (rewrite initiE 1:/# /=).
      rewrite shr_shrw 1://= shrDP 1://=.
      rewrite (pmod_small _ W16.modulus); first by move : r2_bnds; smt().
      rewrite (mulzC 256 _) divzMDl 1://= -(divz_mulp _ 16 256) 1..2://= (pdiv_small _ 4096) 1:r2_bnds 1:/# //=.
      rewrite shl_shlw 1://= shlMP 1://=.
      rewrite mulzDl (mulzC 16 _) mulzA //=.
      rewrite andw_orwDr.
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://=.
      rewrite of_uintK modz_dvd 1://= (pmod_small _ 4096) 1:/#.
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://=.
      rewrite of_uintK (modz_dvd _ W16.modulus) 1://= modzMDl (pmod_small _ 4096) 1:/# (pmod_small _ 16) 1:/#.

      rewrite orw_disjoint.
        + apply W16.ext_eq => x xb; rewrite /W16.(`&`) map2E initiE //=.
          case (!(0 <= x < 8)).
            + move => kbb; have -> : !(W16.of_int (r{2}.[128 * i{2} + 8 * j + 6] %% 256)).[x]; last by smt().
              rewrite get_to_uint xb /= //=. 
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ 8 x  _); 1,2: smt().
              rewrite of_uintK (pmod_small _ W16.modulus) 1:/#.
              have -> : r{2}.[128 * i{2} + 8 * j + 6] %% 256 %/ 2 ^ x = 0; last by smt(mod0z).
              apply pdiv_small; move : (modz_cmp r{2}.[128 * i{2} + 8 * j + 6] 256); 1: smt().
            + move => /negbNE xbb. have -> : !(W16.of_int (r{2}.[128 * i{2} + 8 * j + 6] %/ 256 * 256)).[x]; last by smt().
              rewrite get_to_uint xb /= //=.
              have /= expbnd:= (StdOrder.IntOrder.ler_weexpn2l 2 _ x 7  _); 1,2: smt().
              rewrite of_uintK (pmod_small _ W16.modulus) 1:/#.
              rewrite (_: 256 = 2^8) // divMr; first by apply le_dvd_pow; smt().  
              rewrite expz_div // 1:/# => *; move => *; apply dvdz_mull.
              have -> : 2 %| 2 ^ (8 - x) = 2^1 %| 2 ^ (8 - x) by auto.  
              by apply le_dvd_pow; smt().
      rewrite divzE //= addzC -addzA //=.
      rewrite /nttunpack initiE 1:/# //=.
      rewrite /(nttunpack_idx) //= initiE 1:/# => /#.
    + rewrite Array16.tP => j j_bnds.
      do (rewrite initiE 1:/# /=).
      rewrite shr_shrw 1://= shrDP 1://=.
      rewrite (pmod_small _ W16.modulus); first by move : r2_bnds; smt().
      rewrite (mulzC 16 _) divzMDl 1://= (pdiv_small _ 16) 1:modz_cmp 1://= //=.
      rewrite (W16.andwC (W16.of_int (2^12 - 1)) _) and_mod 1://=.
      rewrite of_uintK modz_dvd 1://= (pmod_small _ 4096) 1:r2_bnds 1:/#.
      rewrite /nttunpack initiE 1:/# //=.
      rewrite /(nttunpack_idx) //= initiE 1:/# => /#.

  wp; skip; auto => />.
  move => &1 &2 [#] ap_lb ap_ub i_lb i_ub rp_def rp_bnds i_tub r2_bnds />.
  do split; first 2 by move : i_lb i_tub => /#.
    + rewrite (mulzDr 128) mulz1 => k k_lb k_ub.
      rewrite /nttpack Array256.initiE 1:/# /=.
      do (rewrite Array256.filliE 1:nttpack_inbounds 1:/#).
      simplify.
      do rewrite Array16.initiE 1:modz_cmp 1://=.
      simplify.
      have HH: forall j, 0 <= j < 256 => (nttunpack r{2}).[nttpack_idx.[j]] = (nttpack (nttunpack r{2})).[j]. (* TODO: add lemma; use axiom ??? *)
        move => j j_bnds.
        rewrite /nttpack.
        rewrite (Array256.initiE (fun (i0 : int) => (nttunpack r{2}).[nttpack_idx.[i0]])) 1:j_bnds.
        trivial.
      case (128 * i{2} + 112 <= nttpack_idx.[k] && nttpack_idx.[k] < 128 * i{2} + 128) => k_s1.
        have ->: 128 * i{2} + 112 + nttpack_idx.[k] %% 16 = nttpack_idx.[k]. move : k_s1 => /#.
        rewrite HH; first by move : k_lb k_ub i_lb i_tub => /#.
        rewrite nttunpackK.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= r{2}.[k] %% 65536.
          move : (r2_bnds k) => /#.
        rewrite pmod_small; by move : (r2_bnds k) => /#.
      case (128 * i{2} + 96 <= nttpack_idx.[k] && nttpack_idx.[k] < 128 * i{2} + 112) => k_s2.
        have ->: 128 * i{2} + 96 + nttpack_idx.[k] %% 16 = nttpack_idx.[k]. move : k_s2 => /#.
        rewrite HH; first by move : k_lb k_ub i_lb i_tub => /#.
        rewrite nttunpackK.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= r{2}.[k] %% 65536.
          move : (r2_bnds k) => /#.
        rewrite pmod_small; by move : (r2_bnds k) => /#.
      case (128 * i{2} + 80 <= nttpack_idx.[k] && nttpack_idx.[k] < 128 * i{2} + 96) => k_s3.
        have ->: 128 * i{2} + 80 + nttpack_idx.[k] %% 16 = nttpack_idx.[k]. move : k_s3 => /#.
        rewrite HH; first by move : k_lb k_ub i_lb i_tub => /#.
        rewrite nttunpackK.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= r{2}.[k] %% 65536.
          move : (r2_bnds k) => /#.
        rewrite pmod_small; by move : (r2_bnds k) => /#.
      case (128 * i{2} + 64 <= nttpack_idx.[k] && nttpack_idx.[k] < 128 * i{2} + 80) => k_s4.
        have ->: 128 * i{2} + 64 + nttpack_idx.[k] %% 16 = nttpack_idx.[k]. move : k_s4 => /#.
        rewrite HH; first by move : k_lb k_ub i_lb i_tub => /#.
        rewrite nttunpackK.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= r{2}.[k] %% 65536.
          move : (r2_bnds k) => /#.
        rewrite pmod_small; by move : (r2_bnds k) => /#.
      case (128 * i{2} + 48 <= nttpack_idx.[k] && nttpack_idx.[k] < 128 * i{2} + 64) => k_s5.
        have ->: 128 * i{2} + 48 + nttpack_idx.[k] %% 16 = nttpack_idx.[k]. move : k_s5 => /#.
        rewrite HH; first by move : k_lb k_ub i_lb i_tub => /#.
        rewrite nttunpackK.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= r{2}.[k] %% 65536.
          move : (r2_bnds k) => /#.
        rewrite pmod_small; by move : (r2_bnds k) => /#.
      case (128 * i{2} + 32 <= nttpack_idx.[k] && nttpack_idx.[k] < 128 * i{2} + 48) => k_s6.
        have ->: 128 * i{2} + 32 + nttpack_idx.[k] %% 16 = nttpack_idx.[k]. move : k_s6 => /#.
        rewrite HH; first by move : k_lb k_ub i_lb i_tub => /#.
        rewrite nttunpackK.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= r{2}.[k] %% 65536.
          move : (r2_bnds k) => /#.
        rewrite pmod_small; by move : (r2_bnds k) => /#.
      case (128 * i{2} + 16 <= nttpack_idx.[k] && nttpack_idx.[k] < 128 * i{2} + 32) => k_s7.
        have ->: 128 * i{2} + 16 + nttpack_idx.[k] %% 16 = nttpack_idx.[k]. move : k_s7 => /#.
        rewrite HH; first by move : k_lb k_ub i_lb i_tub => /#.
        rewrite nttunpackK.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= r{2}.[k] %% 65536.
          move : (r2_bnds k) => /#.
        rewrite pmod_small; by move : (r2_bnds k) => /#.
      case (128 * i{2} <= nttpack_idx.[k] && nttpack_idx.[k] < 128 * i{2} + 16) => k_s8.
        have ->: 128 * i{2} + nttpack_idx.[k] %% 16 = nttpack_idx.[k]. move : k_s8 => /#.
        rewrite HH; first by move : k_lb k_ub i_lb i_tub => /#.
        rewrite nttunpackK.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= r{2}.[k] %% 65536.
          move : (r2_bnds k) => /#.
        rewrite pmod_small; by move : (r2_bnds k) => /#.
      case (i{2} = 0) => i_0.
        + move : k_ub; rewrite i_0 /= => k_ub.
          have kpck_tbnds: 0 <= nttpack_idx.[k] && nttpack_idx.[k] < 0.
            move : (nttpack128_bounds k) k_s1 k_s2 k_s3 k_s4 k_s5 k_s6 k_s7 k_s8 => /#.
          smt().
        + have i_1: i{2} = 1. by move : i_0 i_lb i_tub => /#.
          move : k_ub; rewrite i_1 /= => k_ub.
          have kpck_tbnds: 0 <= nttpack_idx.[k] && nttpack_idx.[k] < 128.
            move : (nttpack128_bounds k) k_s1 k_s2 k_s3 k_s4 k_s5 k_s6 k_s7 k_s8 => /#.
          rewrite -rp_def; first by move : (nttpack128_bounds k) => /#.
          rewrite /nttpack (Array256.initiE  (fun (i0 : int) => rp{1}.[nttpack_idx.[i0]])) 1://= //=.
    + rewrite (mulzDr 128) mulz1 => k k_lb k_ub.
      do (rewrite Array256.filliE 1:/# //=).
      do rewrite Array16.initiE 1:modz_cmp 1://=.
      simplify.

      have r2_unpack_bnds: forall (k : int), 0 <= k && k < 128 * i{2} + 128 => 0 <= (nttunpack r{2}).[k] && (nttunpack r{2}).[k] < 4096.
        move => j j_bnds.
        apply (unpack128_boundsi r{2} (i{2} + 1) 0 4096).
        move : i_lb i_tub => /#.
        rewrite mulzDr mulz1.
        apply r2_bnds.
        rewrite mulzDr mulz1 j_bnds.

      case (128 * i{2} + 112 <= k < 128 * i{2} + 128) => k_s1.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= (nttunpack r{2}).[128 * i{2} + 112 + k %% 16] %% 65536.
          move : (r2_unpack_bnds k) => /#.
        rewrite pmod_small; by move : (r2_unpack_bnds k) => /#.
      case (128 * i{2} + 96 <= k < 128 * i{2} + 112) => k_s2.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= (nttunpack r{2}).[128 * i{2} + 96 + k %% 16] %% 65536.
          move : (r2_unpack_bnds k) => /#.
        rewrite pmod_small; by move : (r2_unpack_bnds k) => /#.
      case (128 * i{2} + 80 <= k < 128 * i{2} + 96) => k_s3.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= (nttunpack r{2}).[128 * i{2} + 80 + k %% 16] %% 65536.
          move : (r2_unpack_bnds k) => /#.
        rewrite pmod_small; by move : (r2_unpack_bnds k) => /#.
      case (128 * i{2} + 64 <= k < 128 * i{2} + 80) => k_s4.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= (nttunpack r{2}).[128 * i{2} + 64 + k %% 16] %% 65536.
          move : (r2_unpack_bnds k) => /#.
        rewrite pmod_small; by move : (r2_unpack_bnds k) => /#.
      case (128 * i{2} + 48 <= k < 128 * i{2} + 64) => k_s5.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= (nttunpack r{2}).[128 * i{2} + 48 + k %% 16] %% 65536.
          move : (r2_unpack_bnds k) => /#.
        rewrite pmod_small; by move : (r2_unpack_bnds k) => /#.
      case (128 * i{2} + 32 <= k < 128 * i{2} + 48) => k_s6.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= (nttunpack r{2}).[128 * i{2} + 32 + k %% 16] %% 65536.
          move : (r2_unpack_bnds k) => /#.
        rewrite pmod_small; by move : (r2_unpack_bnds k) => /#.
      case (128 * i{2} + 16 <= k < 128 * i{2} + 32) => k_s7.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= (nttunpack r{2}).[128 * i{2} + 16 + k %% 16] %% 65536.
          move : (r2_unpack_bnds k) => /#.
        rewrite pmod_small; by move : (r2_unpack_bnds k) => /#.
      case (128 * i{2} <= k < 128 * i{2} + 16) => k_s8.
        rewrite of_sintK /smod /=.
        have -> //=: !32768 <= (nttunpack r{2}).[128 * i{2} + k %% 16] %% 65536.
          move : (r2_unpack_bnds k) => /#.
        rewrite pmod_small; by move : (r2_unpack_bnds k) => /#.
     have k_tbnds: 0 <= k < 128 * i{2}.
       move : k_s1 k_s2 k_s3 k_s4 k_s5 k_s6 k_s7 k_s8 => /#.
     move : (rp_def k k_tbnds) => /#.
  wp; skip; auto => />.
  move => &1 &2 [#] ap_lb ap_ub />.
  split.
    + smt().
    + move => rpL iR rR.
      rewrite -lezNgt => iR_tlb iR_lb iR_ub.
      have -> //=: iR = 2. move : iR_tlb iR_ub => /#.
      move => rp_def rp_bnds.
      split.
        + apply Array256.ext_eq => x x_bnds.
          rewrite mapiE 1:x_bnds /=.
          by apply rp_def.
        + rewrite /pos_bound256_cxq /bpos16 qE //= => x x_bnds.
          move : (rp_bnds x x_bnds) => /#.

qed.

lemma poly_frombytes_ll : islossless  Mprevec.poly_frombytes.
proof.
proc.
  while (0 <= i <= 2) (2-i).
    move => *; inline *; auto => /> /#.
  inline *; wp; auto => /> /#.
qed.


end MLKEM_PolyAVX.
