require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel.
require import Array400 Array256 Array128 Array32 Array16 Array4 Array8.
require import W16extra WArray512 WArray32 WArray16.
require import AVX2_Ops.
require import Kyber_AVX2_cf.
require import KyberCPA_avx2.
require import KyberPoly_avx2_prevec.
require import Fq_avx2.
require import Fq.
require import NTT_Fq.
require import Jindcpa.

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
    + by rewrite /init16 /#.
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

op signed_bound_cxq(coefs : W16.t Array256.t, l u c : int) : bool =
  forall k, l <= k < u => b16 coefs.[k] (c*q).

op pos_bound256_cxq (coefs : W16.t Array256.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

op pos_bound256_b (coefs : W16.t Array256.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] b.

op lift_array256 (p: W16.t Array256.t) =
  Array256.map (fun x => inFq (W16.to_sint x)) p.

op lift_array128 (p: W16.t Array128.t) =
  Array128.map (fun x => inFq (W16.to_sint x)) p.

lemma lift_array256E (x : W16.t Array256.t) k :
  0 <= k < 256 =>
  (lift_array256 x).[k] = inFq (to_sint x.[k]).
proof. admit. (*  by move => ?; rewrite /lift_array256 mapiE //. *)qed.

lemma lift_array256P (x y : W16.t Array256.t) :
  lift_array256 x = lift_array256 y <=>
  (forall k, 0 <= k < 256 => inFq (to_sint x.[k]) = inFq (to_sint y.[k])).
proof. admit. (*
  split; first by rewrite tP => H *; rewrite -!lift_array256E // H //.
  by rewrite tP => H *; rewrite !lift_array256E // H //.
*)qed.

op touches (m m' : global_mem_t) (p : address) (len : int) =
    forall i, !(0 <= i < len) => m'.[p + i] = m.[p + i]. (* FIXME: merge w/ KyberPoly *)

op load_array32(m : global_mem_t, p : address) : W8.t Array32.t = 
      Array32.init (fun i => m.[p + i]).

lemma get_lift_array256_eq (p: W16.t Array256.t):
  let p_lift = lift_array256 p in
  forall k, 0 <= k < 256 => p_lift.[k] = inFq (W16.to_sint p.[k]).
proof. admit. (*
  rewrite /lift_array256 => p_lift. rewrite /p_lift.
  move => k k_i.
  smt (@Array256).
*)qed.

lemma poly_add_corr_h _a _b ab bb :
      0 <= ab <= 6 => 0 <= bb <= 3 =>
      hoare[ Mavx2_prevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\
           forall k, 0 <= k < 256 =>
             inFq (to_sint res.[k]) = _a.[k] + _b.[k]].
proof.
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

  inline Ops.ivadd16u256.
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
qed.

lemma poly_add_ll : islossless Mavx2_prevec.poly_add2.
  proc; while (0<= i <= 16) (16 - i).
  auto => />.
  inline Ops.ivadd16u256.
  auto => />.
  smt(@Int).
  auto => />.
  smt(@Int).
qed.

lemma poly_add_corr _a _b ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      phoare[ Mavx2_prevec.poly_add2 :
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
      hoare[ Mavx2_prevec.poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] - _b.[k]].
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
              inFq (to_sint rp.[k]) = _a.[k] - _b.[k]
  ); first last.
  auto => />.
  move => &hr signed_bound_a signed_bound_b.
  do split; first 3 by smt(@Array256).

  inline Ops.ivsub16u256.
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
qed.

lemma poly_sub_ll : islossless Mavx2_prevec.poly_sub.
  proc; while (0<= i <= 16) (16 - i); auto => />.
  inline Ops.ivsub16u256.
  auto => />; smt(@Int).
  auto => />; smt(@Int).
qed.

lemma poly_sub_corr _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>  
      phoare[ Mavx2_prevec.poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] - _b.[k]] = 1%r
  by move => *; conseq poly_sub_ll (poly_sub_corr_h _a _b ab bb _ _).


(* FIXME: dup from KyberPoly*)
lemma m1true x :
  0 <= x < 16 =>
    (W16.of_int 65535).[x].
proof. admit. (*
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
*)qed.

lemma getsign x :
      (x \slt W16.zero => x `|>>` (of_int 15)%W8 = (of_int 65535)%W16) /\
      (W16.zero \sle x => x `|>>` (of_int 15)%W8 = W16.zero).
proof. admit. (*
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
*)qed.


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
    + smt(getsign @Array16 @W16).
    + rewrite W16.sltE ltzNge -W16.sleE => /=.
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
  rewrite initiE 1:/# /= t_def 1:/# /=.
  case (_r{hr}.[k] \slt W16.zero).
    + move => _r_ub.
      rewrite -/W16.onew and1w => //.
    + rewrite -/W16.zero and0w => //.
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

lemma poly_reduce_corr_h (ap: Fq Array256.t):
     hoare[ Mavx2_prevec.poly_reduce :
          ap = lift_array256 rp ==>
          ap = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16 res.[k] (2*q)].
proof.
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
        forall k, 0 <= k < 256 => bpos16 res.[k] (2*q)] = 1%r.
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
      rewrite /R qE /= expr0 /=.
      congr.
      rewrite /smod //=.
  
  move => k k_lb k_ub.
  rewrite initiE //=; first by move : k_lb i_lb k_ub => /#.
  rewrite mulzDr mulz1 lezNgt in k_lb.
  rewrite k_lb /=.
  apply rp_eq_ap; by move : k_lb k_ub => /#.
qed.

lemma poly_frommont_ll : islossless  Mavx2_prevec.poly_frommont.
proc.
  auto => />.
  cfold 4. wp; while (0 <= i <= 16) (16 - i).
  + move => *; inline*; auto => />. smt().
  + inline *; wp; auto => /> /#.
qed.

op load_array128(m : global_mem_t, p : address) : W8.t Array128.t = 
      Array128.init (fun i => m.[p + i]).

op valid_ptr(p : int, o : int) = 0 <= o => 0 <= p /\ p + o < W64.modulus.

lemma poly_decompress_corr mem _p (_a : W8.t Array128.t): 
    equiv [ Mavx2_prevec.poly_decompress ~ EncDec_AVX2.decode4 :
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
          rewrite shift_def 1:/# q_def 1:/# mask_def 1:/# modz_dvd //.
          rewrite (W16.of_sintK 3329) /smod //= of_sintK.
          case ((k %% 2) = 0) => k_even.
            + rewrite (_: pc_mask_s = (W16.of_int (2^4 - 1))). simplify. done.
              rewrite W16.and_mod 1://.
              rewrite /q.
              pose b := pack2_t (W2u8.Pack.init (fun (_ : int) => mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 2 * (k %% 16) %/ 4])).
              rewrite of_intM of_sintK.
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
              rewrite (_: to_uint (truncateu8 b) = to_uint mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 2 * (k %% 16) %/ 4]).
                admit. (* FIXME *)
              rewrite (_: 2 * (k %% 16) %/ 4 = k %% 16 %/ 2). smt(@IntDiv @Int).
              rewrite to_uintD of_uintK.
              rewrite (pmod_small (8 * i{2}) W64.modulus). move : i_tub i_lb => /#.
              rewrite (pmod_small _ W64.modulus).
                move : ap_lb ap_ub i_tub i_lb => /#.
              rewrite (addzC 8 _).
              do (rewrite get_setE 1:/#).
              smt(@Array256).
            + pose b := pack2_t ((W2u8.Pack.init (fun (_ : int) => mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) +
                                                              2 * (k %% 16) %/ 4]))).
              rewrite (_: b `&` (W16.of_int 240) = ((b `>>>` 4) `&` (W16.of_int (2^4 - 1))) `<<<` 4).
                admit. (* FIXME: smt(@Int @IntDiv @W16 and_mod @Ring.IntID @W2u8). *)
              rewrite W16.and_mod 1://=.
              rewrite /q.
              rewrite shlMP 1://=.
              rewrite of_intM.
              rewrite (mulzA _ (2^4) 128) //=.
              rewrite of_sintK.
              rewrite (_: W16.smod (to_uint (b `>>>` 4) %% 16 * 2048 %% W16.modulus) =
                          to_uint (b `>>>` 4) %% 16 * 2048).
                move : (modz_cmp (to_uint (b `>>>` 4)) 16). simplify.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              do rewrite shr_shrw 1://=.
              rewrite shrDP 1://=.
              rewrite (pmod_small _ W32.modulus). by smt(@Int @IntDiv @Ring.IntID).
              rewrite -of_intD shrDP 1://= of_uintK.
              do (rewrite (pmod_small _ W32.modulus); first by smt(@Int @IntDiv @Ring.IntID)).
              rewrite (pmod_small _ W16.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: to_uint (b `>>>` 4) %% 16 * 2048 * 3329 %/ 2 ^ 14 =  to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3).
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: (to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3 + 1) %/ 2 ^ 1 = (8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4).
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: W16.smod ((8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4) = (8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4).
                move : (modz_cmp (to_uint (b `>>>` 4)) 16) => />.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: (to_uint (b `>>>` 4) %% 16) = to_uint mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 2 * (k %% 16) %/ 4] %/ 16).
                admit. (* FIXME *)
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
        pose b := pack2_t ((W2u8.Pack.init (fun (_ : int) => mem.[to_uint (ap{1} + (of_int (8 * i{2}))%W64) + 2 * (k %% 16) %/ 4]))).
        rewrite shift_def 1:/# q_def 1:/# mask_def 1:/# modz_dvd //.
        rewrite (W16.of_sintK 3329) /smod //= of_sintK.
        case ((k %% 2) = 0) => k_even.
            + rewrite (_: pc_mask_s = (W16.of_int (2^4 - 1))). simplify. done.
              rewrite W16.and_mod 1://.
              rewrite /q.
              rewrite of_intM of_sintK.
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
              rewrite (_: (to_uint b %% 2 ^ 4 * 3329 %/ 2 ^ 3 + 1) %/ 2 ^ 1 = (8 + to_uint b %% 2 ^ 4 * 3329) %/ 2 ^ 4).
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: W16.smod ((8 + to_uint b %% 16 * 3329) %/ 2 ^ 4) = ((8 + to_uint b %% 16 * 3329) %/ 2 ^ 4)).
                move : (modz_cmp (to_uint b) 16) => />.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              move : (modz_cmp (to_uint b) 16) => />.
              smt(@Int @IntDiv @Ring.IntID).
            + rewrite (_: b `&` (W16.of_int 240) = ((b `>>>` 4) `&` (W16.of_int (2^4 - 1))) `<<<` 4).
                admit. (* FIXME: smt(@Int @IntDiv @W16 and_mod @Ring.IntID @W2u8). *)
              rewrite W16.and_mod 1://=.
              rewrite /q.
              rewrite shlMP 1://=.
              rewrite of_intM.
              rewrite (mulzA _ (2^4) 128) //=.
              rewrite of_sintK.
              rewrite (_: W16.smod (to_uint (b `>>>` 4) %% 16 * 2048 %% W16.modulus) =
                          to_uint (b `>>>` 4) %% 16 * 2048).
                move : (modz_cmp (to_uint (b `>>>` 4)) 16). simplify.
                rewrite /smod.
                smt(@Int @IntDiv @Ring.IntID).
              do rewrite shr_shrw 1://=.
              rewrite shrDP 1://=.
              rewrite (pmod_small _ W32.modulus). by smt(@Int @IntDiv @Ring.IntID).
              rewrite -of_intD shrDP 1://= of_uintK.
              do (rewrite (pmod_small _ W32.modulus); first by smt(@Int @IntDiv @Ring.IntID)).
              rewrite (pmod_small _ W16.modulus); first by smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: to_uint (b `>>>` 4) %% 16 * 2048 * 3329 %/ 2 ^ 14 =  to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3).
                smt(@Int @IntDiv @Ring.IntID).
              rewrite (_: (to_uint (b `>>>` 4) %% 16 * 3329 %/ 2 ^ 3 + 1) %/ 2 ^ 1 = (8 + to_uint (b `>>>` 4) %% 16 * 3329) %/ 2 ^ 4).
                smt(@Int @IntDiv @Ring.IntID).
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
qed.

lemma poly_compress_corr _a (_p : address) mem :
    equiv [ Mavx2_prevec.poly_compress ~ EncDec_AVX2.encode4 :
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
    + inline *; wp.
      unroll for {2} 2.
      auto => />.
      move => &1 &2 [#] rp_lb rp_ub pos_bound_a v_def shift1_def mask1_def shift2_b_def permidx_def i_lb i_ub touch_mem_p mem_up i_tub />.
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
        (fill (fun j => W8.of_int ((compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 2*j] +
                                   (compress_poly 4 (lift_array256 a{1})).[64 * i{2} + 2*j + 1] * 16)) (32 * i{2}) 32 r{2})).
      apply Array128.ext_eq.
      move => x x_i. rewrite filliE //=.
      admit. (* FIXME *)
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
    pose x := (8 * ((4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}) %/ 16) +
               (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}) %% 8).
    rewrite (_: 2 * x %% 8 = (- 6 * k) %% 8).
      rewrite (mulzDr 2 _).
      rewrite -mulzA (mulzC _ 8) mulzA (mulzC 8 _) modzMDl.
      rewrite modzMmr.
      do rewrite (mulzDr 2 _) //=.
      do (rewrite -mulzA //= (mulzC 8 _)).
      do rewrite -addzA.
      rewrite modzMDl.
      rewrite (_: (k %/ 8 * 8 + 2 * - 16 * i{2}) = (k %/ 8 - 4 * i{2}) * 8). smt(@Int @IntDiv).
      rewrite modzMDr.
      smt(@Int @IntDiv mulz_modr modz_dvd).
    rewrite (_: (2 * x %/ 16) = (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}) %/ 16).
      rewrite mulzDr.
      rewrite -mulzA //= (mulzC 16 _) divzMDl 1://=.
      rewrite (pdiv_small (2 * ((4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}) %% 8)) 16).
        move : (modz_cmp (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}) 8).
        smt(@Int @IntDiv).
      done.
    rewrite (_: 2 * x %/ 8 %% 2 = ((k %% 8) + (k %/ 8) + (- 3 * (k %% 4)) %/ 4) %% 2).
      rewrite (_ : 2 * x %/ 8 %% 2 = x %% 8 %/ 4). smt(@Int @IntDiv).
      rewrite /x (mulzC 8 _) modzMDl.
      rewrite modz_mod.
      rewrite (_: (4 * (k %% 8) - 3 * (k %% 4) + 4 * (k %/ 8) - 16 * i{2}) %% 8 = (((k %% 8) + (k %/ 8)) * 4 - 3 * (k %% 4)) %% 8).
        smt(@Int @IntDiv).
      rewrite (_: (((k %% 8) + (k %/ 8)) * 4 - 3 * (k %% 4)) %% 8 %/ 4 = (((k %% 8) + (k %/ 8)) * 4 - 3 * (k %% 4)) %/ 4 %% 2).
        smt(@Int @IntDiv).
      rewrite divzMDl 1://=.
      done.     
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
qed.

(* FIXME: this seems too simple ???? *)
lemma poly_compress_ll : islossless Mavx2_prevec.poly_compress.
proc.
auto => />.
(*
  cfold 5. wp; while(0 <= i <= 4) (4-i).
    move => *; inline *; auto => />. smt().
  inline Ops.iVPBROADCAST_16u16; wp; call poly_csubq_ll; auto => /> /#.
*)
qed.

(* FIXME
lemma poly_compress_round_corr_h ap :
  hoare[Mavx2_prevec.poly_compress_round:
        ap = lift_array256 a /\
        pos_bound256_cxq a 0 256 2 ==>
        Array256.map Poly.roundc ap = lift_array256 res /\
        forall k,
          0 <= k < 256 => 0 <= to_sint res.[k] < 16].
proof. admit.
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
           inFq (W16.to_sint rp.[k]) = roundc ap.[k]) /\
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
   rewrite /roundc inFqK //=.
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
  rewrite ap_def /lift_array256 mapiE 1:/# inFqK //= qE.
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
qed. *)

(* TODO: move to IntDiv (again) *)
lemma smod_red : forall m, 0 < m => forall x, -m <= x < 0 => x %% m = x + m.
proof.
  move => m m_lb x0. smt(@Int @IntDiv).
qed.

lemma poly_tomsg_corr _a (_p : address) mem : 
  equiv [Mavx2_prevec.poly_tomsg ~ EncDec_AVX2.encode1 :
             pos_bound256_cxq a{1} 0 256 2 /\ 
             lift_array256 a{1} = _a /\ a{2} = compress_poly 1 _a /\ 
             valid_ptr _p 32 /\ Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             lift_array256 res{1} = _a /\
             pos_bound256_cxq res{1} 0 256 1 /\
             touches mem Glob.mem{1} _p 32 /\
             load_array32 Glob.mem{1} _p = res{2}].
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
    do (rewrite get_setE 1://= //).
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
              fill (fun k => W8.init (fun (j : int) =>
                                      W8.int_bit (compress_poly 1 (lift_array256 a{1})).[32 * i{2} + 8 * (k %% 4) + j] 0)) (4*i{2}) 4 ra{2}).
    apply Array32.ext_eq => x x_i.
    do (rewrite filliE 1:/# //=).
    case (4 * i{2} <= x && x < 4 * i{2} + 4) => x_si.
      + do (rewrite get_setE 1:/#).
        admit. (* FIXME: smt(@Int @IntDiv @Array32 @List @W8). *)
      + do(rewrite set_neqiE 1..2:/# //=).
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
        admit. (* FIXME *)
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
qed.

lemma poly_tomsg_ll : islossless  Mavx2_prevec.poly_tomsg.
proc.
  cfold 5. wp; while (0 <= i <= 8) (8-i); last by wp; call (poly_csubq_ll); auto =>  /> /#.
  move => *.
  wp.
  inline *; wp; auto => /> /#.
qed.

op lift_msg(bs: W256.t): bool Array256.t =
    Array256.init (fun i => bs.[i]).

(* TODO: move to spec/Kyber.ec *)
op s_encode (b: bool): int =
  asint (b_encode b).

(* TODO: simplify *)
lemma bit_encode (x: W256.t) (i: int):
  0 <= i < 256 =>
  let di = i %/ 32 in
  let n = 3 - (i %% 4) in
  let k = ((i %% 32) + n) %/ 16 in
  let sl = W8.of_int (15 - (((i %% 32) + n) %% 16)) in
    s_encode x.[i] = W16.to_sint ((((((x \bits32 di) `<<` (W8.of_int n)) \bits16 k) `<<` sl) `|>>` (W8.of_int 15)) `&` (W16.of_int 1665)).
proof.
  move => i_i di n k sl.
  rewrite /s_encode /b_encode /asint /trueval /falseval.
  have ->: ((q + 1) %/ 2) = 1665.
    rewrite qE. trivial.

  have x_msk:
    forall j, 0 <= j < 16 => (((((x \bits32 di) `<<` (W8.of_int n)) \bits16 k) `<<` sl) `|>>` (W8.of_int 15)).[j]  = x.[i].
      rewrite /W16.(`|>>`) /sar //=.
      move => j j_i.
      rewrite initiE //=.
      rewrite (_: min 15 (j + 15) = 15); first by smt().
      rewrite /W16.(`<<`) /W16.(`<<<`).
      rewrite /sl.
      rewrite of_uintK.
      rewrite pmod_small. by smt(@W8 @IntDiv @Int).
      rewrite pmod_small. by smt(@W8 @IntDiv @Int).
      rewrite initiE //=.
      rewrite (_: 15 - (15 - (i %% 32 + n) %% 16) = (i %% 32 + n) %% 16). smt(@Int).
      rewrite bits16E /k divzE.
      rewrite initiE 1:/# //=.
      rewrite -addzA addNz addz0.
      rewrite /W32.(`<<`) /W32.(`<<<`).
      rewrite initiE 1:/# //=.
      rewrite (pmod_small n). by smt(@IntDiv @Int).
      rewrite (pmod_small n). by smt(@IntDiv @Int).
      rewrite -(addzA _ n) addzN addz0.
      rewrite bits32E /di divzE.
      rewrite initiE 1:/# //=.
      rewrite -addzA addNz addz0 //=.

  case x.[i] => x_i_1.
  have ->: ((((x \bits32 di) `<<` (of_int n)%W8 \bits16 k) `<<` sl) `|>>` (of_int 15)%W8) = W16.onew.
    rewrite wordP. move => j j_i.
    rewrite (x_msk j j_i).
    rewrite W16.onewE.
    rewrite j_i x_i_1 //=.
  rewrite W16.and1w of_sintK /smod //=.
  rewrite /inFq Sub.insubdK 1:/# pmod_small 1:/# //=.

  move : x_i_1 => x_i_0.

  have ->: ((((x \bits32 di) `<<` (of_int n)%W8 \bits16 k) `<<` sl) `|>>` (of_int 15)%W8) = W16.zero.
    rewrite wordP. move => j j_i.
    rewrite (x_msk j j_i).
    rewrite W16.zerowE.
    rewrite x_i_0 //=.
  rewrite W16.and0w of_sintK /smod //=.
  rewrite /inFq Sub.insubdK 1:/# pmod_small 1:/# //=.
qed.

(* TODO: generalize *)
lemma true_32: forall x, 0 <= x < 8 => (W8.of_int 32).[x] = (x = 5).
proof.
  move => x x_i.
  rewrite /of_int /= /int2bs /= /mkseq -iotaredE /=.
  rewrite /bits2w initiE 1:x_i /=.
  smt(@Int).
qed.

lemma true_49: forall x, 0 <= x < 8 => (W8.of_int 49).[x] = (x = 5 \/ x = 4 \/ x = 0).
proof.
  move => x x_i.
  rewrite /of_int /= /int2bs /= /mkseq -iotaredE /=.
  rewrite /bits2w initiE 1:x_i /=.
  smt(@Int).
qed.

lemma poly_frommsg_corr mem _p (_m : W8.t Array32.t): 
    equiv [ Mavx2_prevec.poly_frommsg ~ EncDec_AVX2.decode1 :
             valid_ptr _p 32 /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array32 Glob.mem{1} _p = _m /\ a{2} = _m
              ==>
             Glob.mem{1} = mem /\
             lift_array256 res{1} = decompress_poly 1 res{2} /\
             pos_bound256_cxq res{1} 0 256 1 ].
proof.
  proc.
  seq 5 2:(#pre /\
           ={i} /\ i{1} = 0 /\
           (forall k, 0 <= k < 16 => hqs{1}.[k] = (W16.of_int 1665)) /\
           (forall k, 0 <= k < 32 => idx{1}.[k] = pfm_idx_s.[k %% 16]) /\
           (forall k, 0 <= k < 8 => shift{1}.[k] = W32.of_int (3 - k %% 4))).
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
  
  while (#{~i{1}=0}pre /\ 0 <= i{1} <= 4 /\
         (forall k, 0 <= k < i{1}*64 => inFq (to_sint rp{1}.[k]) = decompress 1 r{2}.[k]) /\
         (forall k, 0 <= k < i{1}*64 => 0 <= to_sint rp{1}.[k] < q)).
  auto => />.
  move => &1 &2 [#] valid_p mem_eq ap_eq_p _p_def a_def i_eq hqs_def idx_def shift_def i_lb i_ub rp_def rp_bnd i1_tub i2_tub g0 g1 g2 g3 r [#] i2n_lb i2n_ub rpn_def rn_bnd i2_n rpn i1_n />.
  rewrite /rpn /i1_n /i2_n i_eq /=.
  do split; first 4 by assumption.

  admit.
  (* FIXME:

  inline *; wp.
  unroll for {2} 2.
  auto => />.
  move => &1 &2 [#] valid_p mem_eq ap_eq_p _p_def a_def i_eq hqs_def idx_def shift_def i_lb i_ub rp_def rp_bnd i1_tub i2_tub g0 g1 g2 g3 r [#] i2n_lb i2n_ub rpn_def rn_bnd i2_n rpn i1_n />.

  seq 16: (#pre /\
           (forall k, 0 <= k < 16 => W16.to_sint g0.[k] = s_encode _a.[32 * i + 128 * (k %/ 8) + 16 * (k %% 8 %/ 4) + (k %% 4)]) /\
           (forall k, 0 <= k < 16 => W16.to_sint g1.[k] = s_encode _a.[32 * i + 128 * (k %/ 8) + 16 * (k %% 8 %/ 4) + (k %% 4) + 4]) /\
           (forall k, 0 <= k < 16 => W16.to_sint g2.[k] = s_encode _a.[32 * i + 128 * (k %/ 8) + 16 * (k %% 8 %/ 4) + (k %% 4) + 8]) /\
           (forall k, 0 <= k < 16 => W16.to_sint g3.[k] = s_encode _a.[32 * i + 128 * (k %/ 8) + 16 * (k %% 8 %/ 4) + (k %% 4) + 12])).

  inline *.
  wp. skip.
  simplify.
  move => &hr [#] _a_def f_def hqs_def pfm_idx_vdef pfm_shift_vdef i_lb i_ub rpl_def rph_def i_tub.
  rewrite _a_def i_lb i_ub //=.

  have idx_in_bound: forall k, 0 <= k < 32 => ! 128 <= to_uint idx{hr}.[k].
    move => k k_i.
    rewrite (pfm_idx_vdef k k_i).
    rewrite /(KyberCAP_avx2.pfm_idx_s) initiE //= 1:/#.
    do (rewrite (fun_if W8.to_uint) //=).
    smt(@Int @Array16 @IntDiv).

  split.
  do split.
  apply f_def.
  apply hqs_def.
  apply pfm_idx_vdef.
  apply pfm_shift_vdef.
  apply rpl_def.
  apply rph_def.
  apply i_tub.

  split.
  move => k k_i.
  rewrite /f8u32_t32u8 //=.
  do (rewrite initiE 1://= //=).
  rewrite hqs_def 1://=.
  rewrite (pmod_small _ 256).
    move : i_lb i_tub => /#.


  rewrite (_: (Array8.init (fun (i1: int) => ((Array8.init (fun (i2 : int) => f_dw{hr}.[4 * (i2 %/ 4) + 85 * i{hr} %/ (2 ^ (2 * (i2 %% 4))) %% 4]))).[i1] `<<<` to_uint shift{hr}.[i1])) =
              (Array8.init (fun (i1: int) => f_dw{hr}.[4 * (i1 %/ 4) + 85 * i{hr} %/ (2 ^ (2 * (i1 %% 4))) %% 4] `<<<` to_uint shift{hr}.[i1]))).
    apply Array8.ext_eq.
    move => x x_i.
    do rewrite initiE //=.

  rewrite (_: (Array32.init (fun (i0: int) => (Array8.init (fun (i1 : int) =>
                                              f_dw{hr}.[4 * (i1 %/ 4) + 85 * i{hr} %/ (2 ^ (2 * (i1 %% 4))) %% 4] `<<<` to_uint shift{hr}.[i1])).[i0 %/ 4] \bits8 i0 %% 4)) =
              (Array32.init (fun (i0 : int) => (f_dw{hr}.[4 * (i0 %/ 4 %/ 4) + 85 * i{hr} %/ (2 ^ (2 * ((i0 %/ 4) %% 4))) %% 4] `<<<` to_uint shift{hr}.[i0 %/ 4]) \bits8 i0 %% 4))).
    apply Array32.ext_eq.
    move => x x_i.
    do rewrite initiE //=.
      move : x_i => /#.
  pose tmp := (Array32.init (fun (i0 : int) => f_dw{hr}.[4 * (i0 %/ 4 %/ 4) + 85 * i{hr} %/ (2 ^ (2 * (i0 %/ 4 %% 4))) %% 4] `<<<`
                                                to_uint shift{hr}.[i0 %/ 4] \bits8 i0 %% 4)).
  rewrite (_: (Array32.init (fun (i : int) => if 128 <= to_uint idx{hr}.[i] then W8.zero
                                               else tmp.[16 * (i %/ 16) + to_uint idx{hr}.[i] %% 16])) =
               (Array32.init (fun (i: int) => tmp.[16 * (i %/ 16) + to_uint idx{hr}.[i] %% 16]))).
    apply Array32.ext_eq.
    move => x x_i.
    rewrite initiE //=.
    rewrite (idx_in_bound x x_i) //=.
    rewrite (Array32.initiE _ x) //=.

  rewrite (_: (W2u8.Pack.init (fun (j: int) => (Array32.init (fun (i : int) =>
                                                tmp.[16 * (i %/ 16) + to_uint idx{hr}.[i] %% 16])).[2 * k + j])) =
               W2u8.Pack.init (fun j => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{hr}.[2 * k + j]])).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do 2!(rewrite initiE 1:/# //=).
    rewrite W2u8.Pack.initiE 1://= //=.
    rewrite pmod_small.
      rewrite pfm_idx_vdef 1:/# /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @Array16 @IntDiv @Int).
    trivial.
    rewrite (_: W2u8.Pack.init (fun (j : int) => tmp.[16 * ((2 * k + j) %/ 16) + to_uint idx{hr}.[2 * k + j]]) =
                W2u8.Pack.init (fun (j : int) => f_dw{hr}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{hr}.[2 * k + j]) %/ 4 %/ 4) + 85 * i{hr} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) + W8.to_uint idx{hr}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                                 W32.to_uint shift{hr}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{hr}.[2 * k + j]) %/ 4]
                                                 \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{hr}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    rewrite initiE //=.
    rewrite initiE //=.
      rewrite pfm_idx_vdef 1:/# /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      move : x_i k_i => /#.
    rewrite initiE //=.

  rewrite (_: W2u8.Pack.init (fun (j : int) => f_dw{hr}.[4 * ((16 * ((2 * k + j) %/ 16) + to_uint idx{hr}.[2 * k + j]) %/ 4 %/ 4) +
                                                         85 * i{hr} %/ (2 ^ (2 * ((16 * ((2 * k + j) %/ 16) +
                                                         W8.to_uint idx{hr}.[2 * k + j]) %/ 4 %% 4))) %% 4] `<<<`
                                               W32.to_uint shift{hr}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{hr}.[2 * k + j]) %/ 4]
                                               \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{hr}.[2 * k + j]) %% 4) =
              W2u8.Pack.init (fun (j : int) => f_dw{hr}.[4 * ((2 * k + j) %/ 16) +
                                                         85 * i{hr} %/ (2 ^ (2 * (W8.to_uint idx{hr}.[2 * k + j] %/ 4))) %% 4] `<<<`
                                               W32.to_uint shift{hr}.[(16 * ((2 * k + j) %/ 16) + W8.to_uint idx{hr}.[2 * k + j]) %/ 4]
                                               \bits8  (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{hr}.[2 * k + j]) %% 4)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    rewrite initiE //=.
    rewrite initiE //=.
    have idx_bnds: forall w, 0 <= w < 32 => 0 <= to_uint idx{hr}.[w] %/4 && to_uint idx{hr}.[w] %/ 4 < 4.
      move => w w_i.
      rewrite pfm_idx_vdef 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @Array16 @IntDiv).
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{hr}.[2 * k + x]) %/ 4 %% 4 =
                to_uint idx{hr}.[2 * k + x] %/ 4).
      move : (idx_bnds (2 * k + x)).
      smt(@Int @IntDiv).
    rewrite (_: (16 * ((2 * k + x) %/ 16) + to_uint idx{hr}.[2 * k + x]) %/ 4 %/ 4 =
                (2 * k + x) %/ 16).
      move : (idx_bnds (2 * k + x)).
      smt(@Int @IntDiv).
    trivial.

  have f_dw_idx: forall j, 0 <= j < 2 => 4 * ((2 * k + j) %/ 16) + 85 * i{hr} %/ (2 ^ (2 * (W8.to_uint idx{hr}.[2 * k + j] %/ 4))) %% 4 =
                                         4 * (k %/ 8) + i{hr}.
    move => j j_i.
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: to_uint idx{hr}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite pfm_idx_vdef 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite exprM //=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt(@Int @IntDiv).
    rewrite (pdiv_small _ 4) //=. by smt(@Int @IntDiv).
    rewrite (_: 4 * (k %/ 8) + 85 * i{hr} %/ 4 ^ (k %% 4) %% 4 = 4 * (k %/ 8) + i{hr} <=>
                85 * i{hr} %/ 4 ^ (k %% 4) %% 4 = i{hr}). by smt(@Int).
    rewrite (_: 85 * i{hr} = (4 ^ 3) * i{hr} + (4 ^ 2) * i{hr} + (4 ^ 1) * i{hr} + (4 ^ 0) * i{hr}). smt(@Int @IntDiv @Ring.IntID).
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

  have shift_idx: forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{hr}.[2 * k + j]) %/ 4 = 4 * (k %/ 8) + k %% 4.
    move => j j_i.
    rewrite (_: to_uint idx{hr}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite pfm_idx_vdef 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt(@Int).
    rewrite (divzMDl (4 * (k %/ 8)) _ 4) 1://=.
    rewrite (_: (2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j) %/ 4 = (k %% 4) + (2 * (k %% 8 %/ 4) + j) %/ 4). by smt(@Int @IntDiv).
    rewrite (pdiv_small _ 4) //=. by smt(@Int @IntDiv).

  have bit_idx : forall j, 0 <= j < 2 => (16 * ((2 * k + j) %/ 16) + W8.to_uint idx{hr}.[2 * k + j]) %% 4 = 2 * (k %% 8 %/ 4) + j.
    move => j j_i.
    rewrite (_: to_uint idx{hr}.[2 * k + j] = 2 * (k %% 8 %/ 4) + 4 * (k %% 4) + j).
      rewrite pfm_idx_vdef 1:/#.
      rewrite /(KyberCPA_avx2.pfm_idx_s) initiE //= 1:/#.
      do (rewrite (fun_if W8.to_uint) //=).
      smt(@Int @IntDiv @Array16).
    rewrite (_: (2 * k + j) %/ 16 = k %/ 8). by smt(@Int @IntDiv).
    rewrite (_: 16 * (k %/ 8) = (4 * (k %/ 8)) * 4). smt(@Int).
    smt(@Int @IntDiv).

  rewrite (_: W2u8.Pack.init (fun (j : int) =>
                              f_dw{hr}.[4 * ((2 * k + j) %/ 16) + 85 * i{hr} %/ (2 ^ (2 * (W8.to_uint idx{hr}.[2 * k + j] %/ 4))) %% 4] `<<<`
                              to_uint shift{hr}.[(16 * ((2 * k + j) %/ 16) + to_uint idx{hr}.[2 * k + j]) %/ 4] \bits8
                              (16 * ((2 * k + j) %/ 16) + to_uint idx{hr}.[2 * k + j]) %% 4) =
              W2u8.Pack.init (fun (j: int) =>
                              f_dw{hr}.[4 * (k %/ 8) + i{hr}] `<<<`
                              to_uint shift{hr}.[4 *(k %/ 8) + k %% 4] \bits8 2 * (k %% 8 %/ 4) + j)).
    apply W2u8.Pack.ext_eq.
    move => x x_i.
    do (rewrite initiE //=).
    rewrite f_dw_idx 1:// shift_idx 1://= bit_idx 1://=.
    trivial.

  rewrite (_: (pack2_t (W2u8.Pack.init (fun (j: int) =>
                                f_dw{hr}.[4 * (k %/ 8) + i{hr}] `<<<`
                                to_uint shift{hr}.[4 *(k %/ 8) + k %% 4] \bits8 2 * (k %% 8 %/ 4) + j)))
               = f_dw{hr}.[4 * (k %/ 8) + i{hr}] `<<<` to_uint shift{hr}.[4 *(k %/ 8) + k %% 4] \bits16 (k %% 8 %/ 4)).
    rewrite /pack2_t.
    rewrite W16.wordP.
    move => i i_i.
    rewrite initiE //= initiE 1:/# //=.
    rewrite bits8E bits16E.
    rewrite initiE //= initiE 1:/# //=.
    smt(@Int @IntDiv).

  rewrite (_: f_dw{hr}.[4 * (k %/ 8) + i{hr}] = f{hr} \bits32 (4 * (k %/ 8) + i{hr})).
    rewrite W32.wordP.
    move => i i_i.
    rewrite bits32E.
    rewrite initiE //=.
    rewrite f_def 1:/#.
    smt(@IntDiv).

  pose idx := 32 * i{hr} + 128 * (k %/ 8) + 16 * (k %% 8 %/ 4) + k %% 4.
  have ->: 4 * (k %/ 8) + i{hr} = idx %/ 32. by smt(@Int @IntDiv).

  rewrite pfm_shift_vdef 1:/# //=.
  rewrite (mulzC 4 _) modzMDl modz_mod.
  rewrite of_uintK pmod_small 1:/#.

  have ->: 3 - k %% 4 = 3 - idx %% 4. by smt(@Int @IntDiv).
  have ->: k %% 8 %/ 4 = (idx %% 32 + (3 - idx %% 4)) %/ 16. by smt(@Int @IntDiv).
  have ->: 12 = 15 - ((idx %% 32 + (3 - idx %% 4)) %% 16). by smt(@Int @IntDiv).

  pose di := idx %/ 32.
  pose n := 3 - idx %% 4.
  pose kb := (idx %% 32 + n) %/ 16.
  pose sl := W8.of_int (15 - (idx %% 32 + n) %% 16).

  rewrite -W32.shl_shlw 1:/#.
  rewrite -_a_def /lift_msg initiE //= 1:/#.
  move : (bit_encode f{hr} idx).
  rewrite (_: (0 <= idx && idx < 256) = true) //=. move : k_i i_lb i_tub => /#.
  rewrite -/di -/n -/kb -/sl.
  smt(@Logic).

  admit. (* FIXME: same as previous block  *)

  inline *. wp. skip.
  move => &hr [#] _a_def f_def hqs_def pfm_idx_vdef pfm_shift_vdef i_lb i_ub rpl_def rph_def i_tub g0_def g1_def g2_def g3_def h0_def h2_def h1_def h3_def h0_h1_32 h0_h1_49 h2_h3_32 h2_h3_49 rp_fdef iu.
  simplify.
  do split; first 7 by smt().

  move => k k_i.
  rewrite /rp_fdef.
  do rewrite filliE 1:/# //=.
  do (rewrite (fun_if W16.to_sint)).

  have ->: !(144 + 32 * i{hr} <= k && k < 160 + 32 * i{hr}). by move : k_i => /#.
  have ->: !(128 + 32 * i{hr} <= k && k < 144 + 32 * i{hr}). by move : k_i => /#.

  simplify.
  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if Array16."_.[_]") || rewrite if_arg).
  do (rewrite (fun_if W16.to_sint)).
  rewrite /h0_def /h1_def /h2_def /h3_def.
  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if W16.to_sint)).

  rewrite /h0_h1_32 /h2_h3_32.

  have ->: !(W8.of_int 32).[4 * (k %% 16 %/ 8) + 3].
    rewrite true_32 1:/#.
    have k_vals: 0 <= k %% 16 %/ 8 < 2.
      move : (modz_cmp k 16) => /#.
    move : k_vals => /#.

  have ->: !(W8.of_int 32).[4 * (k %% 16 %/ 8)].
    rewrite true_32 1:/#.
    move : (modz_cmp k 16) => /#.

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

  case (32 * i{hr} + 16 <= k && k < 32 * i{hr} + 32)  => k_ssi.
    case (32 * i{hr} + 24 <= k && k < 32 * i{hr} + 32) => k_sssi.
      have ->: W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
        move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      simplify.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).
      have ->: !W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
          move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      simplify.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).
  move : k_ssi => k_nssi.
  case (32 * i{hr} <= k && k < 32 * i{hr} + 16)  => k_ssi.
    case (32 * i{hr} + 8 <= k && k < 32 * i{hr} + 16) => k_sssi.
      have ->: W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
        move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      simplify.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).
      have ->: !W8.int_bit 32 (4 * (k %% 16 %/ 8) + 1).
          move : (true_32 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      simplify.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).
  apply rpl_def.
  move : k_nssi k_ssi k_i => /#.

  move => k k_i.
  rewrite /rp_fdef.
  do rewrite filliE 1:/# //=.
  do (rewrite (fun_if W16.to_sint)).

  have ->: !(32 * i{hr} + 16 <= k && k < 32 * i{hr} + 32). by move : k_i => /#.
  have ->: !(32 * i{hr} <= k && k < 32 * i{hr} + 16). by move : k_i => /#.

  simplify.
  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if Array16."_.[_]") || rewrite if_arg).
  do (rewrite (fun_if W16.to_sint)).
  rewrite /h0_def /h1_def /h2_def /h3_def.
  do (rewrite initiE 1:/# //=).
  do (rewrite (fun_if W16.to_sint)).

  rewrite /h0_h1_49 /h2_h3_49.

  have ->: !(W8.of_int 49).[4 * (k %% 16 %/ 8) + 3].
    rewrite true_49 1:/#.
    move : (modz_cmp k 16) => /#.

  simplify.

  do (rewrite modz_dvd 1://=).
  rewrite (_: (8 + k %% 8) %/ 8 = 1). by smt(@IntDiv @Int).
  rewrite (_: (8 + k %% 8) %/ 4 %% 2 = k %/ 4 %% 2). by smt(@IntDiv @Int).
  rewrite (_: k %% 8 %/ 4 %% 2 = k %/ 4 %% 2). by smt(@IntDiv @Int @Ring.IntID).
  rewrite (_: (8 + k %% 8) %% 4 = k %% 4). by smt(@IntDiv @Int).
  rewrite (pdiv_small (k %% 8) 8). by smt(@IntDiv @Int).
  have ->: 0 <= 4 * (k %% 16 %/ 8) && 4 * (k %% 16 %/ 8) < 8. by smt(@IntDiv @Int).
  have ->: 0 <= 4 * (k %% 16 %/ 8) + 1 && 4 * (k %% 16 %/ 8) + 1 < 8. by smt(@IntDiv @Int).
  simplify.

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
  rewrite modz_mod.
  simplify.

  case (144 + 32 * i{hr} <= k && k < 160 + 32 * i{hr}) => k_si.
    case (152 + 32 * i{hr} <= k && k < 160 + 32 * i{hr}) => k_ssi.
      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt(@W8 @Int @IntDiv).
      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      simplify.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).
      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt(@W8 @Int @IntDiv).
      have ->: !W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).
  move : k_si => k_nsi.
  case (128 + 32 * i{hr} <= k && k < 144 + 32 * i{hr})  => k_si.
    case (136 + 32 * i{hr} <= k && k < 144 + 32 * i{hr})  => k_ssi.
      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt(@W8 @Int @IntDiv).
      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      simplify.
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).
      have ->: W8.int_bit 49 (4 * (k %% 16 %/ 8)).
        move : (true_49 (4 * (k %% 16 %/ 8))).
        smt(@W8 @Int @IntDiv).
      have ->: !W8.int_bit 49 (4 * (k %% 16 %/ 8) + 1).
        move : (true_49 (4 * (k %% 16 %/ 8) + 1)).
        smt(@W8 @Int @IntDiv).
      smt(@Int @IntDiv @W16 @Array256 @Logic @List).
  apply rph_def.
  move : k_nsi k_si k_i => /#.
  *)
  admit.
  (* FIXME:
  sp. skip. simplify.
  move => &hr [#] i_val _a_def f_def hqs_def pfm_idx_vdef pfm_shift_vdef.
  do split; first 5 by smt().
  rewrite i_val => /#.
  rewrite i_val => /#.
  rewrite i_val => /#.
  rewrite i_val => /#.

  move => [#] i rp i_tlb [#] _a_ddef f_ddef hqs_ddef pfm_idx_dvdef pfm_shift_dvdef i_lb i_ub.
  have i_nval: i = 4. by move : i_ub i_tlb => /#.
  rewrite i_nval //=.
  move => rpl_def rph_def.

  have rp_def: map W16.to_sint rp = map s_encode _a.
    rewrite /s_encode.
    apply Array256.ext_eq.
    move => x x_i.
    do (rewrite Array256.mapiE 1:x_i //=).
    move : rpl_def rph_def => /#.

  split.
  rewrite /pos_bound256_cxq /bpos16.
  move => k k_i /=.
  rewrite Array256.tP in rp_def.
  move : (rp_def k k_i).
  do rewrite mapiE //= => ->.
  rewrite /s_encode b_encode_int.
  smt(@Array256 @Int).

  rewrite /lift_array256 /m_encode.
  apply Array256.ext_eq => x x_i.
  do rewrite mapiE //=.

  rewrite Array256.tP in rp_def.
  move : (rp_def x x_i).
  do rewrite mapiE //=.
  rewrite /s_encode => ->.
  rewrite asintK //=.
  *)
qed.

lemma poly_frommsg_ll : islossless  Mavx2_prevec.poly_frommsg.
proof.
  proc; while (0 <= i <= 4) (4-i).
  move => *.
  inline *; wp; auto => /> /#.
  inline *; auto => /> /#.
qed.


end KyberPolyAVX.
