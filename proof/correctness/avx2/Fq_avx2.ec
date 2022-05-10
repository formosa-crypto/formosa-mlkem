require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel JWord.
require import Fq Array16.
require import W16extra WArray512 WArray32 WArray16.
require import AVX2_Ops.
require import KyberCPA_avx2.
require import KyberPoly_avx2_prevec.
require import KyberPoly.
require import NTT_Fq.
require import Jkem.

pragma +oldip.

theory Fq_avx2.

import Kyber.
import KyberPoly.
import Fq.
import SignedReductions.
import Zq.
import ZModP.

op lift_array16 (p: W16.t Array16.t) =
  Array16.map (fun x => (W16.to_sint x)) p.

lemma barret_red16x_corr_h a :
  hoare[ Mavx2_prevec.red16x :
       a = lift_array16 r /\
       (forall k, 0 <= k < 16 => qx16.[k] = KyberCPA_avx2.jqx16.[k]) /\
       (forall k, 0 <= k < 16 => vx16.[k] = KyberCPA_avx2.jvx16.[k]) ==>
       forall k, 0 <= k < 16 => W16.to_sint res.[k] = BREDC a.[k] 26].
proof.
proc.
inline *.
wp; skip.
move => &hr.
simplify.
move => [#] a_def q_def v_def.
 move => k k_i.

have jvx16_val : forall k, 0 <= k < 16 => jvx16.[k] = W16.of_int 20159.
  move => k0 k0_i. rewrite get_of_list => />. smt(@Array16).
have jqx16_val : forall k, 0 <= k < 16 => jqx16.[k] = W16.of_int 3329.
  move => k0 k0_i. rewrite get_of_list => />. smt(@Array16).

do (rewrite initiE //=).
rewrite a_def /lift_array16 /=.
rewrite mapiE => />.
rewrite /wmulhs /=.
rewrite SAR_sem10 /=.
rewrite of_sintK.
rewrite v_def => //.
rewrite q_def => //.
rewrite (jvx16_val k k_i).
rewrite (jqx16_val k k_i).
rewrite of_sintK /=.
rewrite /(W16.smod 20159) /=.

pose x := (smod (to_sint r{hr}.[k] * 20159 %/ 65536 %% 65536))%W16 %/ 1024 * 3329.
rewrite W16.to_sintE /=.
rewrite to_uintD /=.
rewrite (_:to_uint (- (of_int x)%W16) = W16.to_uint (W16.of_int (-x))).
 rewrite of_intN'. trivial.

rewrite /BREDC.
rewrite  (_: R^2 = W32.modulus); first by rewrite /R.
rewrite !smod_W32 /=.
rewrite !smod_W16.
rewrite (_: to_sint r{hr}.[k] %% R = to_uint r{hr}.[k]).
rewrite to_sintE /smod.
case (2 ^ (16 - 1) <= to_uint r{hr}.[k]).
rewrite (_: R = W16.modulus); first by rewrite /R => />; smt().
rewrite (_: to_uint r{hr}.[k] - W16.modulus = to_uint r{hr}.[k] + (-1) * W16.modulus); first by smt().
rewrite modzMDr.
move => *.
by move : (W16.to_uint_cmp (r{hr}.[k]));auto => />;smt().
rewrite /R.
by move : (W16.to_uint_cmp (r{hr}.[k]));auto => />;smt().
rewrite (_: W16.to_uint (W16.of_int (-x)) = (-x) %% R).
  by rewrite /R of_uintK.
congr.
rewrite /x qE /R /=.
pose w := to_sint r{hr}.[k] * 20159.
do rewrite modzDmr.
case (0 <= to_sint r{hr}.[k]).
move => r_gt0.

move : (W16.to_sint_cmp r{hr}.[k]) => rs_bnds.

have w_tub: w <= to_sint r{hr}.[k] * 2^15.
  rewrite /w. smt(@Int @IntDiv @W16).

have ww_dub: to_sint r{hr}.[k] * 2^15 %/ 65536 %% 65536 = to_sint r{hr}.[k] * 2^15 %/ 65536.
  rewrite pmod_small. move : rs_bnds. smt(@Int @IntDiv @W16). trivial.

have ww_ub : (w %/ 65536 %% 65536) <= W16.max_sint.
  rewrite /w. rewrite pmod_small. move : w_tub ww_dub. smt(@Int @IntDiv).
  apply (lez_trans (to_sint r{hr}.[k] * 2^15 %/ 65536) _ W16.max_sint).
  move : w_tub. smt(@Int @IntDiv). move : rs_bnds. smt(@Int @IntDiv @W16).

rewrite /W16.smod /=.
rewrite (_: 32768 <= (w %/ 65536 %% 65536) = false) /=.
 move : ww_ub. smt(@W16 @Int).
rewrite -(modz_pow2_div 32 16) //=.

have wdw_dub: to_sint r{hr}.[k] * 2^15 %% 4294967296 = to_sint r{hr}.[k] * 2^15.
  rewrite pmod_small. move : rs_bnds. smt(@Int @IntDiv @W32). trivial.

have wdw_ub : (w %% 4294967296) <= W32.max_sint.
  rewrite /w. rewrite pmod_small. move : w_tub wdw_dub. smt(@Int @IntDiv).
  apply (lez_trans (to_sint r{hr}.[k] * 2^15) _ W32.max_sint).
  apply w_tub. move : rs_bnds. smt(@Int @IntDiv @W16).

rewrite /W32.smod /=.
rewrite (_: 2147483648 <= w %% 4294967296 = false) /=.
 move : wdw_ub. smt(@W32 @W16 @Int).

rewrite (_: w %% 4294967296 %/ 65536 %/ 1024 = w %% 4294967296 %/ 67108864) //=.
  smt(@Int @IntDiv).

(*****)
move => r_lt0.

move : (W16.to_sint_cmp r{hr}.[k]) => rs_bnds.

(* TODO: move to IntDiv? *)
have smod_red : forall m, 0 < m => forall x, -m <= x < 0 => x %% m = x + m.
  move => m m_lb x0. smt(@Int @IntDiv).

have w_tub: to_sint r{hr}.[k] * 2^15 <= w.
  rewrite /w. smt(@Int @IntDiv @W16).

have w'_sl16_lb: W16.min_sint < to_sint r{hr}.[k] * 2^15 %/ W16.modulus.
  move : rs_bnds. simplify. smt(@Int @IntDiv @W16).

have w_sl16_lb: W16.min_sint < w %/ W16.modulus.
  move : rs_bnds. simplify. smt(@Int @IntDiv @W16).

have ww_lb : 32768 <= (w %/ 65536 %% 65536).
  rewrite /w.
  apply (lez_trans (to_sint r{hr}.[k] * 2^15 %/ 65536 %% 65536) 32768 _).
  rewrite smod_red //=.
    by move : w'_sl16_lb; simplify; smt(@Int @IntDiv @W16).
  move : w'_sl16_lb. simplify. smt(@Int @IntDiv @W16).
  rewrite smod_red //=.
    by move : w'_sl16_lb; simplify; smt(@Int @IntDiv @W16).
  rewrite smod_red //=.
    by move : w_sl16_lb; simplify; smt(@Int @IntDiv @W16).
  apply lez_add2r. apply leq_div2r. apply w_tub. trivial.

rewrite /W16.smod /=.
rewrite ww_lb //=.
rewrite -(modz_pow2_div 32 16) //=.

have wdw_lb : W32.max_sint < (w %% 4294967296).
  rewrite /w.
  apply (ltz_trans (to_sint r{hr}.[k] * 2^15 %% 4294967296) W32.max_sint _).
  rewrite smod_red //=.
    by move : w'_sl16_lb; simplify; smt(@Int @IntDiv @W32).
  move : w'_sl16_lb. simplify. smt(@Int @IntDiv @W32).
  rewrite smod_red //=.
    by move : w'_sl16_lb; simplify; smt(@Int @IntDiv @W32).
  rewrite smod_red //=.
    by move : w_sl16_lb; simplify; smt(@Int @IntDiv @W32).
  apply ltz_add2r. move : r_lt0 w_tub. rewrite -ltzNge /w /=.
  smt(@Int @IntDiv @W16 @W32).

rewrite /W32.smod /=.
rewrite (_: 2147483648 <= w %% 4294967296 = true) /=.
 move : wdw_lb. smt(@W32 @W16 @Int).
rewrite (_: w %% 4294967296 %/ 65536 - 65536 = w %% 4294967296 %/ 65536 - 64*1024).
  trivial.
rewrite (_: w %% 4294967296 - 4294967296 = w %% 4294967296 - 64*67108864).
  trivial.
rewrite (divzMDr (-64) _ 1024) //.
rewrite (divzMDr (-64) _ 67108864) //.
rewrite (_: w %% 4294967296 %/ 65536 %/ 1024 = w %% 4294967296 %/ 67108864) //=.
  smt(@Int @IntDiv).
qed.

lemma barret_red16x_ll:
  islossless Mavx2_prevec.red16x by proc; islossless.

lemma barret_red16x_corr a:
  phoare [Mavx2_prevec.red16x:
          a = lift_array16 r /\
          (forall k, 0 <= k < 16 => qx16.[k] = KyberCPA_avx2.jqx16.[k]) /\
          (forall k, 0 <= k < 16 => vx16.[k] = KyberCPA_avx2.jvx16.[k]) ==>
          forall k, 0 <= k < 16 => W16.to_sint res.[k] = BREDC a.[k] 26] = 1%r.
proof.
by conseq barret_red16x_ll (barret_red16x_corr_h a). qed.

lemma fqmulx16_corr_h _a _b:
  hoare[ Mavx2_prevec.fqmulx16:
       _a = lift_array16 a /\
       _b = lift_array16 b /\
       (forall k, 0 <= k < 16 => qx16.[k] = W16.of_int 3329) /\
       (forall k, 0 <= k < 16 => qinvx16.[k] = W16.of_int (-3327)) ==>
       forall k, 0 <= k < 16 => W16.to_sint res.[k] = SREDC (_a.[k] * _b.[k])].
proof.
proc.
inline *.
wp; skip.
move => &hr.
simplify.
move => [#] _a_def _b_def qx16_def qinvx16_def.

move => k k_bnds.
do (rewrite initiE //=).

pose _c := _a.[k] * _b.[k].
rewrite /wmulhs.
rewrite /SREDC /=.

rewrite (_: R*(R *R^0) = W32.modulus); first by rewrite expr0 /R  => />.
rewrite (_: R = W16.modulus); first by rewrite /R => />.
rewrite smod_W32 smod_W32 smod_W16.
rewrite qE /=.

rewrite /lift_array16 in _a_def.
rewrite /lift_array16 in _b_def.

rewrite of_sintK.
rewrite qx16_def 1:// qinvx16_def 1://.
rewrite of_sintK 1:/= /(W16.smod 3329) /=.
rewrite {3}/W16.to_sint.
rewrite to_uintM.
rewrite of_uintK.
rewrite modzMmr /=.
rewrite /W16.( * ) /ulift2.
rewrite of_uintK.
rewrite modzMml /=.
congr.

rewrite (modz_dvd _ 4294967296 65536) //.
rewrite -of_sintK of_intD /_c -of_intM.
rewrite (_: to_sint a{hr}.[k] = _a.[k]) _a_def /= mapiE //.
rewrite (_: to_sint b{hr}.[k] = _b.[k]) _b_def /= mapiE //.
rewrite of_intD of_intN /=.

rewrite {5 6}/W16.to_sint.
rewrite (_: (smod (to_uint a{hr}.[k]))%W16 * (smod (to_uint b{hr}.[k]))%W16 * 62209 * 65536 %% 4294967296 =
            to_uint a{hr}.[k] * to_uint b{hr}.[k] * 62209 * 65536 %% 4294967296).
  rewrite /smod.
  case (2 ^ (16 - 1) <= to_uint a{hr}.[k]) => ua_lb.
    case (2 ^ (16 - 1) <= to_uint b{hr}.[k]) => ub_lb.
    + smt(@Int @IntDiv).
    + smt(@Int @IntDiv).
    case (2 ^ (16 - 1) <= to_uint b{hr}.[k]) => ub_lb.
    + smt(@Int @IntDiv).
    + smt(@Int @IntDiv).

rewrite of_sintK.
rewrite (_: (smod ((to_sint a{hr}.[k] * to_sint b{hr}.[k] -
            (smod (to_uint a{hr}.[k] * to_uint b{hr}.[k] * 62209 * 65536 %% 4294967296))%W32 %/
            65536 * 3329) %% W32.modulus))%W32 %/ 65536 %% 65536 =
            ((to_sint a{hr}.[k] * to_sint b{hr}.[k] -
            (smod (to_uint a{hr}.[k] * to_uint b{hr}.[k] * 62209 * 65536 %% 4294967296))%W32 %/
            65536 * 3329) %% W32.modulus)%W32 %/ 65536 %% 65536).
  pose tmpv :=  ((to_sint a{hr}.[k] * to_sint b{hr}.[k] -
                (smod (to_uint a{hr}.[k] * to_uint b{hr}.[k] * 62209 * 65536 %% 4294967296))%W32 %/
                65536 * 3329) %% W32.modulus).
  rewrite /smod /=.
  case (2147483648 <= tmpv) => tmpv_lb.
  + rewrite(_: -4294967296 = (-65536) * 65536); trivial. rewrite divzMDr //. smt(@Int @IntDiv).
  + reflexivity.

rewrite (modz_pow2_div 32 16 _) 1:// /= modz_mod.
have ->: forall (x: int), x * 65536 %% 4294967296 = x %% 65536 * 65536.
  by move => x; smt(@Int @IntDiv).

rewrite (_: (smod (to_uint a{hr}.[k] * to_uint b{hr}.[k] * 62209 %% 65536 * 65536))%W32 %/ 65536 =
            (smod (to_uint a{hr}.[k] * to_uint b{hr}.[k] * 62209 %% 65536))%W16).
  rewrite /smod.
  case ((2^(32-1) <= to_uint a{hr}.[k] * to_uint b{hr}.[k] * 62209 %% 65536 * 65536)) => m_lb.
  + have ->: (2^(16-1) <= to_uint a{hr}.[k] * to_uint b{hr}.[k] * 62209 %% 65536). move : m_lb. smt(@Int @IntDiv @W32 @W16).
    simplify. rewrite divzMDl //.
  + have ->: (! 2^(16-1) <= to_uint a{hr}.[k] * to_uint b{hr}.[k] * 62209 %% 65536). move : m_lb. smt(@Int @IntDiv @W32 @W16).
    simplify. rewrite mulzK //.
  admit.
qed.

lemma fqmulx16_ll:
  islossless Mavx2_prevec.fqmulx16 by proc; islossless.

lemma fqmulx16_corr _a _b :
  phoare [Mavx2_prevec.fqmulx16 :
          _a = lift_array16 a /\
          _b = lift_array16 b /\
          (forall k, 0 <= k < 16 => qx16.[k] = W16.of_int 3329) /\
          (forall k, 0 <= k < 16 => qinvx16.[k] = W16.of_int (-3327)) ==>
          forall k, 0 <= k < 16 => to_sint res.[k] = SREDC (_a.[k] * _b.[k])] = 1%r.
proof. by conseq fqmulx16_ll (fqmulx16_corr_h _a _b). qed.

(* *)
lemma compress_avx2_impl_small (a: W16.t):
  bpos16 a q =>
  msb
  (packss16
     (((W16.of_int 1664) - a) `^` ((W16.of_int 1664) - a `|>>` (W8.of_int 15)) - (W16.of_int 832))) =
  b_decode (inFq (W16.to_sint a)).
proof.
  rewrite /bpos16 qE => abnd.
  rewrite /b_decode /=.
  rewrite /as_sint //=.
  rewrite qE (_: 3329 %/ 2 = 1664) 1://=.
  rewrite /packss16 //=.
  do rewrite (fun_if W8.msb).

  rewrite inFqK (pmod_small _ q); first by rewrite qE abnd.

  case ((W16.of_int 1664) \slt a) => a_gt_hq.
    have hq_s_a_lt0: ((W16.of_int 1664) - a) \slt W16.zero.
      move : a_gt_hq. rewrite /W16.(\slt).
      rewrite to_sintB_small.
       rewrite of_sintK /smod //=.
       move : abnd => /#.
      do (rewrite of_sintK /smod //=).
      smt(@Int @W16).
    rewrite getsignNeg 1:hq_s_a_lt0 1:/W16.onew //=.
    have ->/=: 1664 < to_sint a.
      move : a_gt_hq. rewrite /W16.(\slt).
    do (rewrite of_sintK /smod //=).
    rewrite /msb //=.
    rewrite W16.sltE W16.sleE -lezNgt.
    do (rewrite of_sintK /smod //=).

    rewrite (_: `|to_sint a - 3329| = 3329 - to_sint a).
      move : abnd => /#.
    rewrite (_: W16.of_int 65535 = W16.onew) . by rewrite /W16.onew //=.
    rewrite xorw1 (_: invw ((W16.of_int 1664) - a) = -((W16.of_int 1664) - a) - W16.one).
          move : (W16.twos_compl ((W16.of_int 1664) - a)). smt(@W16 @Int).
    do !(rewrite to_sintB_small || rewrite to_sintN || rewrite of_sintK /smod //=); first 15 by move : hq_s_a_lt0 a_gt_hq abnd => /#.
    rewrite bits8_div 1://= //=.
    do (rewrite to_uintD || rewrite to_uintN || rewrite to_uintK //= || rewrite of_uintK //=).
    rewrite -to_sint_unsigned. by move : a_gt_hq => /#.
    rewrite modzNm.
    rewrite (_: (- to_sint a) %% 65536 = - to_sint a + 65536) 1://=.
      move : a_gt_hq. rewrite sltE of_sintK /smod //=.
      move : abnd => /#.
    rewrite (_: (- (1664 + ((- to_sint a) + 65536))) %% 65536 =
                (to_sint a - 1664) %% 65536).
      smt(@Int @IntDiv modzNm modzDr).
    rewrite (pmod_small (to_sint a - 1664) 65536).
      move : a_gt_hq. rewrite sltE of_sintK /smod //=.
      move : abnd => /#.
    rewrite (_: - (1664 - to_sint a) - 833 =
                to_sint a - 2497).
      smt(@Int @IntDiv).
    rewrite -subz_ge0 //= subz_ge0 -subz_lt0 //= subz_lt0.
    move : a_gt_hq hq_s_a_lt0.
    do (rewrite sltE || rewrite of_sintK /smod //=).
    smt(@Int @W16 @W32 @IntDiv).

  move : a_gt_hq.
  rewrite /W16.(\slt) -lezNgt -/W16.(\sle) -W16.sleE => hq_gte_a.
  have hq_s_a_gt0: W16.zero \sle ((W16.of_int 1664) - a).
    move : hq_gte_a. rewrite /W16.(\sle).
    rewrite to_sintB_small of_sintK /smod //=.
    move : abnd.
    smt(@W16 @W32 @Int).
    do (rewrite of_sintK /smod //=).
    smt(@Int @W16).
  rewrite (_: (W16.of_int 1664) - a `|>>` (W8.of_int 15) = W16.zero).
    move : hq_s_a_gt0.
    smt(getsignPos).
  simplify.
  have ->: !1664 < to_sint a.
    move : hq_gte_a. rewrite /W16.(\sle).
    rewrite of_sintK /smod //= lezNgt //=.
  rewrite /msb //=.
  rewrite of_sintK /smod //=.
  rewrite W16.sleE -lezNgt -ltzNge.
  rewrite to_sintB_small.
    rewrite to_sintB_small.
      + rewrite of_sintK /smod //=. move : abnd. smt(@Int @W16).
    do (rewrite of_sintK /smod //=). move : abnd. smt(@Int @W16).
  rewrite to_sintB_small.
    rewrite of_sintK /smod //=. move : abnd. smt(@Int @W16).
  do (rewrite of_sintK /smod //=).
  rewrite (_: `|to_sint a| = to_sint a).
    move : abnd => /#.
  rewrite bits8_div 1://= //=.
  rewrite to_uintD to_uintN to_uintD to_uintN //=.
  rewrite -to_sint_unsigned.
    move : abnd => /#.
  case (to_sint a = 0) => a_0.
    rewrite a_0 //=.
    smt(@W32).
qed.



end Fq_avx2.
