require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8.
from JazzEC require import WArray512 WArray32 WArray16.

require import W16extra.
require import AVX2_Ops MLKEM_Poly_avx2_prevec Fqmul_avx2 Red_x16_avx2 MLKEM_avx2_auxlemmas.
require import Fq NTT_Fq MLKEM_Poly MLKEMFCLib.
require import NTT_avx2_invntt NTT_avx2_ntt NTT_avx2.

from JazzEC require import Jkem1024_avx2 Jkem1024.

from CryptoSpecs require import GFq Rq Serialization VecMat Correctness1024.

theory MLKEM_PolyAVX.

import GFq.
import Fq.
import SignedReductions.
import Zq.
import ZModP.
import Fq_avx2.
import Fq_avx2_red.
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
  rewrite -_a_def 1:/# 1:// /=.

  rewrite /signed_bound_cxq => k [k_lb k_ub].
  rewrite lezNgt in k_lb.
  rewrite filliE 1:/# k_lb /=.
  rewrite -lezNgt in k_lb.
  move : sgnd_bnd_hrp_a => /#.

  rewrite /signed_bound_cxq => k [k_lb k_ub].
  rewrite filliE 1:/# /= initiE 1:/# /=.
  case (16 * i{hr} <= k) => k_tlb.
    + rewrite k_ub /=.
      do rewrite lift2poly_iso 1..2://.
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
      do (rewrite lift2poly_iso 1..2:// /=).
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
      rewrite lrp_def 1..2://.
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
  while (ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 2 /\ pos_bound256_cxq rp 0 (16*i) 1 /\ 0 <= i <= 16 /\ forall k, 0 <= k < 16 => _qx16.[k] = Jkem1024_avx2.jqx16.[k]).
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
    + rewrite initiE 1:/# /= -/(W16.onew).
      apply getsignNeg.
    + rewrite W16.sltE ltzNge -W16.sleE initiE 1:/# /=.
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
  rewrite /(Jkem1024_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite of_sintK /= /smod.
  have ->: Ring.IntID.(^) 2 (16 - 1) <= 3329 <=> false. smt().
  simplify.
  smt().
  rewrite _qx16_def => //=.
  rewrite /(Jkem1024_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  simplify.
  do rewrite (fun_if ((+) (to_sint rp{hr}.[16 * i{hr} + x %% 16])) _ _ _).
  smt().
  (****)
  
  rewrite to_sintN => //=.
  rewrite _qx16_def => //=.
  rewrite /(Jkem1024_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite of_sintK /= /smod.
  smt().
  rewrite _qx16_def => //=.
  rewrite /(Jkem1024_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite of_sintK /= /smod.
  smt().
  (****)
  
  rewrite _qx16_def => //=.
  rewrite (_: rp{hr}.[16 * i{hr} + x %% 16] = rp{hr}.[x]).
    by move : x_i x_mb => /#.
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  do rewrite of_sintK.
  rewrite /smod /=.
  smt().
  
  (******)
  rewrite to_sintD_small => />.
  rewrite to_sintN => />.
  rewrite _qx16_def => //=.
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
  rewrite get_of_list => />.
  rewrite to_sintB_small.
  do rewrite fun_if.
  rewrite of_sintK /= /smod /=.
  move : (H (16 * i{hr} + k %% 16)).
  rewrite idx_bounds => /> *.
  smt().

  move : _sr_lb rp_qx16_lb.
  rewrite _qx16_def => //=.
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
  rewrite get_of_list => />.
  do rewrite fun_if.
  rewrite to_sintN of_sintK => />.
  rewrite /smod => />.
  
  move : _r_lb.
  rewrite sltE.
  rewrite _qx16_def => //=.
  rewrite /(Jkem1024_avx2.jqx16).
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
  rewrite /(Jkem1024_avx2.jqx16).
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
         (forall k, 0 <= k < 16 => qx16.[k] = Jkem1024_avx2.jqx16.[k]) /\
         (forall k, 0 <= k < 16 => vx16.[k] = Jkem1024_avx2.jvx16.[k])); last first.
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
  
  wp; sp; ecall (barret_red16x_corr_hh (lift_array16 r)). auto => />.
  move => &hr i_lb i_rub rp_sbred rp_eq__rp qx16_def vx16_def i_ub result red16x_bred.
  split; first by move : i_lb i_ub => /#.
  pose rp_sub := ((lift_array16
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
  rewrite /(Jkem1024_avx2.jdmontx16) => />.
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
  rewrite /(Jkem1024_avx2.jqx16) => />.
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
  ecall (fqmulx16_corr_hh (lift_array16 t) (lift_array16 dmontx16)).
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
      rewrite shr_shrw 1:/#.
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
  do (rewrite -ext_eq_all /all_eq /=).
  rewrite /W8.int_bit => />.
  do (rewrite shl_shlw 1:/#; rewrite wlslE => />).
  do (rewrite shr_shrw 1:/#; rewrite wlsrE => />).
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


op pos_bound16_b (coefs : W16.t Array16.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] b.


end MLKEM_PolyAVX.
