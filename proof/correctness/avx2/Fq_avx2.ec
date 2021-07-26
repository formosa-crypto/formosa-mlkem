require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel JWord.
require import Fq Array16 Array16p.
require import W16extra WArray512 WArray32 WArray16.
require import Ops.
require import List_hakyber.
require import KyberPoly_avx2.
require import KyberPoly_avx2_prevec.

pragma +oldip.

theory Fq_avx2.

import Fq.
import SignedReductions.
import Kyber_.
import ZModField.

op lift_array16 (p: W16.t Array16.t) =
  Array16.map (fun x => (W16.to_sint x)) p.

lemma barret_red16x_corr_h a :
  hoare[ Mavx2_prevec.red16x :
       a = lift_array16 r /\
       (forall k, 0 <= k < 16 => qx16.[k] = KyberPoly_avx2.jqx16.[k]) /\
       (forall k, 0 <= k < 16 => vx16.[k] = KyberPoly_avx2.jvx16.[k]) ==>
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

rewrite (_: r3{hr}.[0 <-
    r{hr}.[0] -
    (wmulhs r{hr}.[0] vx16{hr}.[0] `|>>` (of_int 10)%W8) * qx16{hr}.[0]].[1 <-
    r{hr}.[1] -
    (wmulhs r{hr}.[1] vx16{hr}.[1] `|>>` (of_int 10)%W8) * qx16{hr}.[1]].[2 <-
    r{hr}.[2] -
    (wmulhs r{hr}.[2] vx16{hr}.[2] `|>>` (of_int 10)%W8) * qx16{hr}.[2]].[3 <-
    r{hr}.[3] -
    (wmulhs r{hr}.[3] vx16{hr}.[3] `|>>` (of_int 10)%W8) * qx16{hr}.[3]].[4 <-
    r{hr}.[4] -
    (wmulhs r{hr}.[4] vx16{hr}.[4] `|>>` (of_int 10)%W8) * qx16{hr}.[4]].[5 <-
    r{hr}.[5] -
    (wmulhs r{hr}.[5] vx16{hr}.[5] `|>>` (of_int 10)%W8) * qx16{hr}.[5]].[6 <-
    r{hr}.[6] -
    (wmulhs r{hr}.[6] vx16{hr}.[6] `|>>` (of_int 10)%W8) * qx16{hr}.[6]].[7 <-
    r{hr}.[7] -
    (wmulhs r{hr}.[7] vx16{hr}.[7] `|>>` (of_int 10)%W8) * qx16{hr}.[7]].[8 <-
    r{hr}.[8] -
    (wmulhs r{hr}.[8] vx16{hr}.[8] `|>>` (of_int 10)%W8) * qx16{hr}.[8]].[9 <-
    r{hr}.[9] -
    (wmulhs r{hr}.[9] vx16{hr}.[9] `|>>` (of_int 10)%W8) * qx16{hr}.[9]].[10 <-
    r{hr}.[10] -
    (wmulhs r{hr}.[10] vx16{hr}.[10] `|>>` (of_int 10)%W8) * qx16{hr}.[10]].[11 <-
    r{hr}.[11] -
    (wmulhs r{hr}.[11] vx16{hr}.[11] `|>>` (of_int 10)%W8) * qx16{hr}.[11]].[12 <-
    r{hr}.[12] -
    (wmulhs r{hr}.[12] vx16{hr}.[12] `|>>` (of_int 10)%W8) * qx16{hr}.[12]].[13 <-
    r{hr}.[13] -
    (wmulhs r{hr}.[13] vx16{hr}.[13] `|>>` (of_int 10)%W8) * qx16{hr}.[13]].[14 <-
    r{hr}.[14] -
    (wmulhs r{hr}.[14] vx16{hr}.[14] `|>>` (of_int 10)%W8) * qx16{hr}.[14]].[15 <-
    r{hr}.[15] -
    (wmulhs r{hr}.[15] vx16{hr}.[15] `|>>` (of_int 10)%W8) * qx16{hr}.[15]] =
    Array16.init (fun k => r{hr}.[k] - (wmulhs r{hr}.[k] vx16{hr}.[k] `|>>` (of_int 10)%W8) * qx16{hr}.[k])).
  apply Array16.ext_eq => />. move => x4 x4_lb x4_ub.
  do (rewrite get_setE => />).
  do rewrite Array16.initiE => />.
  smt(@Array16).

rewrite initiE => />.
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
rewrite  (_: R^2 = W32.modulus); first by rewrite /R  /= expr0 /=.
rewrite !balmod_W32 /=.
rewrite !balmod_W16.
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
admit.
admit. (* FIXME:

by case (0<= -x < W16.modulus); smt(@W16).
by smt(@W16 qE).
*)
qed.

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
rewrite (_: r3{hr}.[0 <- wmulhs a{hr}.[0] b{hr}.[0] -
      wmulhs (a{hr}.[0] * b{hr}.[0] * qinvx16{hr}.[0]) qx16{hr}.[0]].[1 <-
      wmulhs a{hr}.[1] b{hr}.[1] -
      wmulhs (a{hr}.[1] * b{hr}.[1] * qinvx16{hr}.[1]) qx16{hr}.[1]].[2 <-
      wmulhs a{hr}.[2] b{hr}.[2] -
      wmulhs (a{hr}.[2] * b{hr}.[2] * qinvx16{hr}.[2]) qx16{hr}.[2]].[3 <-
      wmulhs a{hr}.[3] b{hr}.[3] -
      wmulhs (a{hr}.[3] * b{hr}.[3] * qinvx16{hr}.[3]) qx16{hr}.[3]].[4 <-
      wmulhs a{hr}.[4] b{hr}.[4] -
      wmulhs (a{hr}.[4] * b{hr}.[4] * qinvx16{hr}.[4]) qx16{hr}.[4]].[5 <-
      wmulhs a{hr}.[5] b{hr}.[5] -
      wmulhs (a{hr}.[5] * b{hr}.[5] * qinvx16{hr}.[5]) qx16{hr}.[5]].[6 <-
      wmulhs a{hr}.[6] b{hr}.[6] -
      wmulhs (a{hr}.[6] * b{hr}.[6] * qinvx16{hr}.[6]) qx16{hr}.[6]].[7 <-
      wmulhs a{hr}.[7] b{hr}.[7] -
      wmulhs (a{hr}.[7] * b{hr}.[7] * qinvx16{hr}.[7]) qx16{hr}.[7]].[8 <-
      wmulhs a{hr}.[8] b{hr}.[8] -
      wmulhs (a{hr}.[8] * b{hr}.[8] * qinvx16{hr}.[8]) qx16{hr}.[8]].[9 <-
      wmulhs a{hr}.[9] b{hr}.[9] -
      wmulhs (a{hr}.[9] * b{hr}.[9] * qinvx16{hr}.[9]) qx16{hr}.[9]].[10 <-
      wmulhs a{hr}.[10] b{hr}.[10] -
      wmulhs (a{hr}.[10] * b{hr}.[10] * qinvx16{hr}.[10]) qx16{hr}.[10]].[11 <-
      wmulhs a{hr}.[11] b{hr}.[11] -
      wmulhs (a{hr}.[11] * b{hr}.[11] * qinvx16{hr}.[11]) qx16{hr}.[11]].[12 <-
      wmulhs a{hr}.[12] b{hr}.[12] -
      wmulhs (a{hr}.[12] * b{hr}.[12] * qinvx16{hr}.[12]) qx16{hr}.[12]].[13 <-
      wmulhs a{hr}.[13] b{hr}.[13] -
      wmulhs (a{hr}.[13] * b{hr}.[13] * qinvx16{hr}.[13]) qx16{hr}.[13]].[14 <-
      wmulhs a{hr}.[14] b{hr}.[14] -
      wmulhs (a{hr}.[14] * b{hr}.[14] * qinvx16{hr}.[14]) qx16{hr}.[14]].[15 <-
      wmulhs a{hr}.[15] b{hr}.[15] -
      wmulhs (a{hr}.[15] * b{hr}.[15] * qinvx16{hr}.[15]) qx16{hr}.[15]] =
      Array16.init (fun k => wmulhs a{hr}.[k] b{hr}.[k] - wmulhs (a{hr}.[k] * b{hr}.[k] * qinvx16{hr}.[k]) qx16{hr}.[k])).
  apply Array16.ext_eq => />. move => x4 x4_lb x4_ub.
  do (rewrite get_setE => />).
  do rewrite Array16.initiE => />.
  smt(@Array16).

move => k k_bnds.
rewrite initiE //=.
pose _c := _a.[k] * _b.[k].
rewrite /SREDC.
rewrite /wmulhs /=.

rewrite (_: R*(R *R^0) = W32.modulus); first by rewrite expr0 /R  => />.
rewrite (_: R = W16.modulus); first by rewrite /R => />.
rewrite balmod_W32 balmod_W32 balmod_W16.
rewrite W16.of_sintK.
rewrite qE /=.
rewrite /lift_array16 in _a_def.
rewrite /lift_array16 in _b_def.
rewrite (_: to_sint a{hr}.[k] = _a.[k]).
  rewrite _a_def => /=. rewrite mapiE //.
rewrite (_: to_sint b{hr}.[k] = _b.[k]).
  rewrite _b_def /=. rewrite mapiE //.
rewrite qx16_def //; rewrite qinvx16_def //.
rewrite of_sintK /=.
rewrite -/_c.
rewrite /(W16.smod 3329) /=.

admit. (* FIXME *)

qed.

end Fq_avx2.
