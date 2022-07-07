require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel JWord.
require import Fq Array16.
require import W16extra WArray512 WArray32 WArray16.
require import AVX2_Ops.
require import KyberCPA_avx2.
require import KyberPoly_avx2_prevec.
require import Kyber_AVX2_cf.
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

lemma barret_red16x_corr_h:
  equiv [Mprevec.red16x ~ Kyber_AVX2_cf.__red_x16 :
         ={r} /\
         (forall k, 0 <= k < 16 => qx16{1}.[k] = W16.of_int 3329) /\
         (forall k, 0 <= k < 16 => vx16{1}.[k] = W16.of_int 20159) ==>
         ={res}].
proof.
  proc.
  inline *.
  unroll for{2} 2.
  wp. skip. auto => />.
  move => &1 &2 [#] qx16_def vx16_def.
  rewrite (_: r{2}.[0 <-
                r{2}.[0] -
                truncateu16
                  ((sigextu32 r{2}.[0] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[1 <-
                r{2}.[1] -
                truncateu16
                  ((sigextu32 r{2}.[1] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[2 <-
                r{2}.[2] -
                truncateu16
                  ((sigextu32 r{2}.[2] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[3 <-
                r{2}.[3] -
                truncateu16
                  ((sigextu32 r{2}.[3] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[4 <-
                r{2}.[4] -
                truncateu16
                  ((sigextu32 r{2}.[4] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[5 <-
                r{2}.[5] -
                truncateu16
                  ((sigextu32 r{2}.[5] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[6 <-
                r{2}.[6] -
                truncateu16
                  ((sigextu32 r{2}.[6] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[7 <-
                r{2}.[7] -
                truncateu16
                  ((sigextu32 r{2}.[7] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[8 <-
                r{2}.[8] -
                truncateu16
                  ((sigextu32 r{2}.[8] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[9 <-
                r{2}.[9] -
                truncateu16
                  ((sigextu32 r{2}.[9] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[10 <-
                r{2}.[10] -
                truncateu16
                  ((sigextu32 r{2}.[10] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[11 <-
                r{2}.[11] -
                truncateu16
                  ((sigextu32 r{2}.[11] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[12 <-
                r{2}.[12] -
                truncateu16
                  ((sigextu32 r{2}.[12] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[13 <-
                r{2}.[13] -
                truncateu16
                  ((sigextu32 r{2}.[13] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[14 <-
                r{2}.[14] -
                truncateu16
                  ((sigextu32 r{2}.[14] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)].[15 <-
                r{2}.[15] -
                truncateu16
                  ((sigextu32 r{2}.[15] * (of_int 20159)%W32 `|>>` (of_int 26)%W8) *
                   (of_int 3329)%W32)] =
              Array16.init (fun i => r{2}.[i] -
                            truncateu16 ((sigextu32 r{2}.[i] * (W32.of_int 20159) `|>>` (W8.of_int 26)) * (W32.of_int 3329)))).
    apply Array16.ext_eq => x x_i.
    do (rewrite get_setE 1://= //=).
    rewrite initiE 1:x_i //=.
    smt(@Array16 @List @Int).

  apply Array16.ext_eq => x x_i.
  do (rewrite initiE 1:x_i //=).
  rewrite qx16_def 1:x_i vx16_def 1:x_i.
  rewrite /wmulls /wmulhs //=.
  rewrite SAR_sem10 /=.
  rewrite SAR_sem26 /=.
  rewrite (W16.of_sintK 20159) //= /(W16.smod 20159) //=.
  rewrite (W16.of_sintK 3329) //= /(W16.smod 3329) //=.
  rewrite /sigextu32 /truncateu16 /=.
  rewrite of_sintK.
  rewrite (_: 67108864 = 2^16 * 2^10). by trivial.
  rewrite divz_mulp 1..2://=.
  rewrite (_: (W32.smod (to_sint r{2}.[x] * 20159 %% W32.modulus)) %/ W16.modulus =
              (W16.smod (to_sint r{2}.[x] * 20159 %% W32.modulus %/ W16.modulus))).
    rewrite /smod /=.
    case (2147483648 <= to_sint r{2}.[x] * 20159 %% 4294967296) => lb.
      have -> /=: 32768 <= to_sint r{2}.[x] * 20159 %% 4294967296 %/ 65536.
        move : lb => /#.
      smt(@Int @IntDiv).
      have -> //=: ! 32768 <= to_sint r{2}.[x] * 20159 %% 4294967296 %/ 65536.
        move : lb => /#.
  rewrite (W16.of_sintK (to_sint r{2}.[x] * 20159 %/ 65536)).
  rewrite (modz_pow2_div 32 16 _) 1://= //=.
  pose w := to_sint r{2}.[x] * 20159.

  case (0 <= to_sint r{2}.[x]).
    move => r_gt0.

    move : (W16.to_sint_cmp r{2}.[x]) => rs_bnds.

    have w_tub: w <= to_sint r{2}.[x] * 2^15.
      rewrite /w. smt(@Int @IntDiv @W16).
    have ww_dub: to_sint r{2}.[x] * 2^15 %/ 65536 %% 65536 = to_sint r{2}.[x] * 2^15 %/ 65536.
      rewrite pmod_small. move : rs_bnds. smt(@Int @IntDiv @W16). trivial.

    have ww_ub : (w %/ 65536 %% 65536) <= W16.max_sint.
      rewrite /w. rewrite pmod_small. move : w_tub ww_dub. smt(@Int @IntDiv).
      apply (lez_trans (to_sint r{2}.[x] * 2^15 %/ 65536) _ W16.max_sint).
      move : w_tub. smt(@Int @IntDiv). move : rs_bnds. smt(@Int @IntDiv @W16).

    rewrite /W16.smod /=.
    rewrite (_: 32768 <= (w %/ 65536 %% 65536) = false) /=.
      move : ww_ub. smt(@W16 @Int).
    rewrite -(modz_pow2_div 32 16) //=.

    have wdw_dub: to_sint r{2}.[x] * 2^15 %% 4294967296 = to_sint r{2}.[x] * 2^15.
    rewrite pmod_small. move : rs_bnds. smt(@Int @IntDiv @W32). trivial.

    have wdw_ub : (w %% 4294967296) <= W32.max_sint.
      rewrite /w. rewrite pmod_small. move : w_tub wdw_dub. smt(@Int @IntDiv).
      apply (lez_trans (to_sint r{2}.[x] * 2^15) _ W32.max_sint).
      apply w_tub. move : rs_bnds. smt(@Int @IntDiv @W16).
     (* move : wdw_ub. smt(@W32 @W16 @Int). *)

    rewrite (_: w %% 4294967296 %/ 65536 %/ 1024 = w %% 4294967296 %/ 67108864) //=.
      smt(@Int @IntDiv).
    rewrite W16.of_sintK /= /W16.smod /=.
    have -> /=: !(32768 <= w %% 4294967296 %/ 67108864 %% 65536).  smt(@Int @IntDiv).
    rewrite of_uintK.
    rewrite (pmod_small _ W32.modulus).
      smt(@Int @IntDiv).
    rewrite (pmod_small _ W16.modulus).
      smt(@Int @IntDiv).
    rewrite of_uintK.
    smt(@Int @IntDiv).
  (*****)
  move => r_lt0.
    move : (W16.to_sint_cmp r{2}.[x]) => rs_bnds.
    rewrite of_uintK.
    (* TODO: move to IntDiv? *)
    have smod_red : forall m, 0 < m => forall x, -m <= x < 0 => x %% m = x + m.
      move => m m_lb x0. smt(@Int @IntDiv).
    have w_tub: to_sint r{2}.[x] * 2^15 <= w.
      rewrite /w. smt(@Int @IntDiv @W16).
    have w'_sl16_lb: W16.min_sint < to_sint r{2}.[x] * 2^15 %/ W16.modulus.
      move : rs_bnds. simplify. smt(@Int @IntDiv @W16).
    have w_sl16_lb: W16.min_sint < w %/ W16.modulus.
      move : rs_bnds. simplify. smt(@Int @IntDiv @W16).

    rewrite /smod /=.
    have -> //=: 32768 <= (w %/ 65536 %% 65536).
      rewrite /w.
      apply (lez_trans (to_sint r{2}.[x] * 2^15 %/ 65536 %% 65536) 32768 _).
      rewrite smod_red //=.
        by move : w'_sl16_lb; simplify; smt(@Int @IntDiv @W16).
      move : w'_sl16_lb. simplify. smt(@Int @IntDiv @W16).
      rewrite smod_red //=.
        by move : w'_sl16_lb; simplify; smt(@Int @IntDiv @W16).
      rewrite smod_red //=.
        by move : w_sl16_lb; simplify; smt(@Int @IntDiv @W16).
      apply lez_add2r. apply leq_div2r. apply w_tub. trivial.
    rewrite -(modz_pow2_div 32 16) //=.
    rewrite of_sintK.
    have wdw_lb : W32.max_sint < (w %% 4294967296).
      rewrite /w.
      apply (ltz_trans (to_sint r{2}.[x] * 2^15 %% 4294967296) W32.max_sint _).
      rewrite smod_red //=.
        by move : w'_sl16_lb; simplify; smt(@Int @IntDiv @W32).
      move : w'_sl16_lb. simplify. smt(@Int @IntDiv @W32).
      rewrite smod_red //=.
        by move : w'_sl16_lb; simplify; smt(@Int @IntDiv @W32).
      rewrite smod_red //=.
        by move : w_sl16_lb; simplify; smt(@Int @IntDiv @W32).
      apply ltz_add2r. move : r_lt0 w_tub. rewrite -ltzNge /w /=.
      smt(@Int @IntDiv @W16 @W32).
    have w_sr_lb: -32 <= (w %% 4294967296 %/ 65536 - 65536) %/ 1024.
      rewrite {2}(_: 65536 = 64 * 1024). by trivial.
      have ->: (w %% 4294967296 %/ 65536 - 64 * 1024) %/ 1024 = w %% 4294967296 %/ 65536 %/ 1024 - 64.
        smt(@Int @IntDiv).
      have w_sr_tlb: 32 <= w %% 4294967296 %/ 65536 %/ 1024.
        move : wdw_lb => /#.
      move : w_sr_tlb => /#.
    have ->: W16.smod ((w %% 4294967296 %/ 65536 - 65536) %/ 1024 %% W16.modulus) =
             (w %% 4294967296 %/ 65536 - 65536) %/ 1024 %% W16.modulus - 65536.
      rewrite /smod /=.
      rewrite (smod_red 65536) 1://=.
      move : w_sr_lb => /#.
    have -> //=: 32768 <= (w %% 4294967296 %/ 65536 - 65536) %/ 1024 + 65536.
      smt(@Int @IntDiv).
    have w_sr_ub: (w %% 4294967296 %/ 65536 - 65536) %/ 1024 < 0.
      rewrite {2}(_: 65536 = 64 * 1024). by trivial.
      have ->: (w %% 4294967296 %/ 65536 - 64 * 1024) %/ 1024 = w %% 4294967296 %/ 65536 %/ 1024 - 64.
        smt(@Int @IntDiv).
      have w_sr_tub: w %% 4294967296 %/ 65536 %/ 1024 < 64.
        move : wdw_lb => /#.
      move : w_sr_tub => /#.
    rewrite (smod_red 65536) 1://= //=. by move : w_sr_lb w_sr_ub => /#.
    rewrite of_uintK.
    done.
qed.

lemma barret_red16x_ll:
  islossless Mprevec.red16x by proc; islossless.

lemma barret_red16x_corr a:
  phoare [Mprevec.red16x:
          a = lift_array16 r /\
          (forall k, 0 <= k < 16 => qx16.[k] = KyberCPA_avx2.jqx16.[k]) /\
          (forall k, 0 <= k < 16 => vx16.[k] = KyberCPA_avx2.jvx16.[k]) ==>
          forall k, 0 <= k < 16 => W16.to_sint res.[k] = BREDC a.[k] 26] = 1%r.
proof.
admit. (* FIXME: by conseq barret_red16x_ll (barret_red16x_corr_h). *)
qed.

lemma fqmulx16_corr_h:
  equiv [Mprevec.fqmulx16 ~ Kyber_AVX2_cf.__fqmul_x16 :
         ={a, b} /\
         (forall k, 0 <= k < 16 => qx16{1}.[k] = W16.of_int 3329) /\
         (forall k, 0 <= k < 16 => qinvx16{1}.[k] = W16.of_int (-3327)) ==>
         ={res}].
proof.
  proc.
  inline *.
  unroll for{2} 2.
  wp; skip; auto => />.
  move => &1 &2 [#] qx16_def qinvx16_def.

  rewrite (_: rd{2}.[0 <-
  truncateu16
    (sigextu32 a{2}.[0] * sigextu32 b{2}.[0] -
     ((sigextu32 a{2}.[0] * sigextu32 b{2}.[0] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[1 <-
  truncateu16
    (sigextu32 a{2}.[1] * sigextu32 b{2}.[1] -
     ((sigextu32 a{2}.[1] * sigextu32 b{2}.[1] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[2 <-
  truncateu16
    (sigextu32 a{2}.[2] * sigextu32 b{2}.[2] -
     ((sigextu32 a{2}.[2] * sigextu32 b{2}.[2] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[3 <-
  truncateu16
    (sigextu32 a{2}.[3] * sigextu32 b{2}.[3] -
     ((sigextu32 a{2}.[3] * sigextu32 b{2}.[3] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[4 <-
  truncateu16
    (sigextu32 a{2}.[4] * sigextu32 b{2}.[4] -
     ((sigextu32 a{2}.[4] * sigextu32 b{2}.[4] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[5 <-
  truncateu16
    (sigextu32 a{2}.[5] * sigextu32 b{2}.[5] -
     ((sigextu32 a{2}.[5] * sigextu32 b{2}.[5] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[6 <-
  truncateu16
    (sigextu32 a{2}.[6] * sigextu32 b{2}.[6] -
     ((sigextu32 a{2}.[6] * sigextu32 b{2}.[6] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[7 <-
  truncateu16
    (sigextu32 a{2}.[7] * sigextu32 b{2}.[7] -
     ((sigextu32 a{2}.[7] * sigextu32 b{2}.[7] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[8 <-
  truncateu16
    (sigextu32 a{2}.[8] * sigextu32 b{2}.[8] -
     ((sigextu32 a{2}.[8] * sigextu32 b{2}.[8] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[9 <-
  truncateu16
    (sigextu32 a{2}.[9] * sigextu32 b{2}.[9] -
     ((sigextu32 a{2}.[9] * sigextu32 b{2}.[9] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[10 <-
  truncateu16
    (sigextu32 a{2}.[10] * sigextu32 b{2}.[10] -
     ((sigextu32 a{2}.[10] * sigextu32 b{2}.[10] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[11 <-
  truncateu16
    (sigextu32 a{2}.[11] * sigextu32 b{2}.[11] -
     ((sigextu32 a{2}.[11] * sigextu32 b{2}.[11] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[12 <-
  truncateu16
    (sigextu32 a{2}.[12] * sigextu32 b{2}.[12] -
     ((sigextu32 a{2}.[12] * sigextu32 b{2}.[12] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[13 <-
  truncateu16
    (sigextu32 a{2}.[13] * sigextu32 b{2}.[13] -
     ((sigextu32 a{2}.[13] * sigextu32 b{2}.[13] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[14 <-
  truncateu16
    (sigextu32 a{2}.[14] * sigextu32 b{2}.[14] -
     ((sigextu32 a{2}.[14] * sigextu32 b{2}.[14] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)].[15 <-
  truncateu16
    (sigextu32 a{2}.[15] * sigextu32 b{2}.[15] -
     ((sigextu32 a{2}.[15] * sigextu32 b{2}.[15] * (of_int 62209)%W32 `<<`
       (of_int 16)%W8) `|>>`
      (of_int 16)%W8) *
     (of_int 3329)%W32 `|>>` (of_int 16)%W8)] =
  Array16.init (fun i =>  truncateu16 (sigextu32 a{2}.[i] * sigextu32 b{2}.[i] -
                          ((sigextu32 a{2}.[i] * sigextu32 b{2}.[i] * (W32.of_int 62209) `<<`
                          (W8.of_int 16)) `|>>` (W8.of_int 16)) * (W32.of_int 3329) `|>>` (W8.of_int 16)))).
    apply Array16.ext_eq => x x_i.
    do (rewrite get_setE 1://= //=).
    rewrite initiE 1:x_i //=.
    smt(@Array16 @List @Int).

  apply Array16.ext_eq => x x_i.
  do (rewrite initiE 1:x_i //=).
  rewrite qx16_def 1:x_i qinvx16_def 1:x_i.
  rewrite /wmulhs /wmulls //=.
  rewrite SAR_sem16 SAR_sem16 /=.
  rewrite W16.of_sintK /(`<<`) /sigextu32 /truncateu16 /=.
  rewrite shlMP; first by smt().
  rewrite W32.to_sintE W32.of_uintK W32.of_uintK W32.of_sintK /= /R /=.
  rewrite of_sintK.
  rewrite of_sintK 1:/=.
  rewrite (W16.of_sintK 3329) /= /(W16.smod 3329) /=.
  rewrite /(W16.smod 62209) /=.
  congr.
  rewrite -(mulz_modl W16.modulus _ W16.modulus) 1://=.
  do rewrite of_uintK.
  do (rewrite modz_dvd 1://=).
  rewrite (_: (W16.smod (to_sint a{2}.[x] * to_sint b{2}.[x] %% 65536) * - 3327) %% 65536 =
              to_sint a{2}.[x] * to_sint b{2}.[x] %% 65536 * (-3327) %% 65536).
    rewrite /smod.
    case (2 ^ (16 - 1) <= to_sint a{2}.[x] * to_sint b{2}.[x] %% 65536) => lb.
      rewrite mulzDl.
      rewrite (_: (- W16.modulus) * -3327 = W16.modulus * 3327). by trivial.
      smt(@Int @IntDiv).
    trivial.
  rewrite modzMml (pmod_small 3327 65536) 1://= -modzMmr //=.
  have ->: W32.smod (to_sint a{2}.[x] * to_sint b{2}.[x] * 62209 %% 65536 * 65536) %/ 65536 =
           W16.smod (to_sint a{2}.[x] * to_sint b{2}.[x] * 62209 %% 65536 * 65536 %/ 65536).
    rewrite /smod /=.
    case (2147483648 <= to_sint a{2}.[x] * to_sint b{2}.[x] * 62209 %% 65536 * 65536) => lb.
      have -> /=: 32768 <= to_sint a{2}.[x] * to_sint b{2}.[x] * 62209 %% 65536 * 65536 %/ 65536.
        move : lb => /#.
      smt(@Int @IntDiv).
      have -> //=: ! 32768 <= to_sint a{2}.[x] * to_sint b{2}.[x] * 62209 %% 65536 * 65536 %/ 65536.
        move : lb => /#.

  rewrite mulzK 1://=.
  pose tmp := (to_sint a{2}.[x] * to_sint b{2}.[x] - (smod (to_sint a{2}.[x] * to_sint b{2}.[x] * 62209 %% 65536))%W16 * 3329) %% 4294967296.
  rewrite (_: W32.smod tmp %/ 65536 = W16.smod (tmp %/ 65536)).
    rewrite /smod /=.
    case (2147483648 <= tmp) => lb.
      have -> /=: 32768 <= tmp %/ 65536.
        move : lb => /#.
      smt(@Int @IntDiv).
      have -> //=: !32768 <= tmp %/ 65536.
        move : lb => /#.
  rewrite /tmp.
  rewrite (modz_pow2_div 32 16 _) 1://= //=.
  move : tmp => _.
  pose tmp := to_sint a{2}.[x] * to_sint b{2}.[x] * 62209 %% 65536.
  have a_b_bns: -2^30 + 2^15 <= to_sint a{2}.[x] * to_sint b{2}.[x] <= 2^30.
    move : (W16.to_sint_cmp a{2}.[x]) (W16.to_sint_cmp b{2}.[x]) => />.
    smt(@Int @IntDiv).
  admit.
  (* FIXME:
  case (2^16 <= to_sint a{2}.[x] * to_sint b{2}.[x]) => a_b_tlb.
    have a_b_rep: forall d, 0 <= d => to_sint a{2}.[x] * to_sint b{2}.[x] = 2^16 + d.
      move => d d_i.
      move : a_b_tlb a_b_bns.
  *)
qed.

lemma fqmulx16_ll:
  islossless Mprevec.fqmulx16 by proc; islossless.

lemma fqmulx16_corr _a _b:
  phoare [Mprevec.fqmulx16 :
          _a = lift_array16 a /\
          _b = lift_array16 b /\
          (forall k, 0 <= k < 16 => qx16.[k] = W16.of_int 3329) /\
          (forall k, 0 <= k < 16 => qinvx16.[k] = W16.of_int (-3327)) ==>
          forall k, 0 <= k < 16 => to_sint res.[k] = SREDC (_a.[k] * _b.[k])] = 1%r.
proof.
admit. (* FIXME:
  conseq fqmulx16_ll. progress. (fqmulx16_corr_h _a _b). qed.
*)
qed.

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
    rewrite (_: W16.of_int 65535 = W16.onew). by rewrite /W16.onew //=.
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
