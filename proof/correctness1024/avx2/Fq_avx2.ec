require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel JWord.
from JazzEC require import Array16 WArray512 WArray32 WArray16.

require import W16extra.

require import Fq MLKEM_Poly MLKEMFCLib.
require import AVX2_Ops MLKEM_Poly_avx2_prevec.
require import Montgomery16.

(* require import NTT_Fq.
require import Jkem1024. *)

import Fq MLKEM_Poly.
import SignedReductions.

theory Fq_avx2.

from JazzEC require import Jkem1024_avx2.

(*
import MLKEM.
import MLKEM_Poly.
import Fq.
import Zq.
import ZModP.
*)

op lift_array16 (p: W16.t Array16.t) =
  Array16.map (fun x => (W16.to_sint x)) p.

module MLKEM_avx2_encdec = {
  proc __fqmul_x16 (a b: W16.t Array16.t) : W16.t Array16.t = {
    var i;
    var t: W16.t;
    var rd:W16.t Array16.t;
    rd <- witness;
    i <- 0;
    while(i < 16) {
      t <@ Fq.FQMUL_AVX.__fqmul(a.[i], b.[i]);
      rd.[i] <- t;
      i <- i + 1;
    }

    return (rd);
  }

  proc __red_x16 (r: W16.t Array16.t) : W16.t Array16.t = {
    var i;
    var t: W16.t;

    i <- 0;
    while(i < 16) {
      t <@Jkem1024.M.__barrett_reduce(r.[i]);
      r.[i] <- t;
      i <- i + 1;
    }

    return (r);
  }
}.


lemma barret_red16x_corr_h:
  equiv [Mprevec.red16x ~ MLKEM_avx2_encdec.__red_x16 :
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
    smt().

  apply Array16.ext_eq => x x_i.
  do (rewrite initiE 1:x_i //=).
  rewrite qx16_def 1:x_i vx16_def 1:x_i.
  rewrite /wmulls /wmulhs //=.
  rewrite SAR_sem10 /=.
  rewrite SAR_sem26 /=.
  rewrite /(W16.smod 20159) //=.
  rewrite /sigextu32 /truncateu16 /=.
  rewrite of_sintK.
  rewrite (_: 67108864 = 2^16 * 2^10). by trivial.
  rewrite divz_mulp 1..2://=.
  rewrite (_: (W32.smod (to_sint r{2}.[x] * 20159 %% W32.modulus)) %/ W16.modulus =
              (W16.smod (to_sint r{2}.[x] * 20159 %% W32.modulus %/ W16.modulus))).
    rewrite /smod /=.
    case (2147483648 <= to_sint r{2}.[x] * 20159 %% 4294967296) => lb.
      have -> /=: 32768 <= to_sint r{2}.[x] * 20159 %% 4294967296 %/ 65536.
        move : lb => /#. smt().
      have -> //=: ! 32768 <= to_sint r{2}.[x] * 20159 %% 4294967296 %/ 65536.
        move : lb => /#.
  (* rewrite (W16.of_sintK (to_sint r{2}.[x] * 20159 %/ 65536)). *)
  rewrite (modz_pow2_div 32 16 _) 1://= //=.
  pose w := to_sint r{2}.[x] * 20159.

  case (0 <= to_sint r{2}.[x]).
    move => r_gt0.

    move : (W16.to_sint_cmp r{2}.[x]) => rs_bnds.

    have w_tub: w <= to_sint r{2}.[x] * 2^15.
      rewrite /w. smt(). 
    have ww_dub: to_sint r{2}.[x] * 2^15 %/ 65536 %% 65536 = to_sint r{2}.[x] * 2^15 %/ 65536.
      rewrite pmod_small. move : rs_bnds. smt(). trivial.

    have ww_ub : (w %/ 65536 %% 65536) <= W16.max_sint.
      rewrite /w. rewrite pmod_small. move : w_tub ww_dub. smt().
      apply (lez_trans (to_sint r{2}.[x] * 2^15 %/ 65536) _ W16.max_sint).
      move : w_tub. smt(). move : rs_bnds. smt().

    rewrite /W16.smod /=.
    rewrite (_: 32768 <= (w %/ 65536 %% 65536) = false) /=.
      move : ww_ub. smt().
    rewrite -(modz_pow2_div 32 16) //=.

    have wdw_dub: to_sint r{2}.[x] * 2^15 %% 4294967296 = to_sint r{2}.[x] * 2^15.
    rewrite pmod_small. move : rs_bnds. smt(). trivial.

    have wdw_ub : (w %% 4294967296) <= W32.max_sint.
      rewrite /w. rewrite pmod_small. move : w_tub wdw_dub. smt().
      apply (lez_trans (to_sint r{2}.[x] * 2^15) _ W32.max_sint).
      apply w_tub. move : rs_bnds. smt().

    rewrite (_: w %% 4294967296 %/ 65536 %/ 1024 = w %% 4294967296 %/ 67108864) //=.
      smt().
    rewrite W32.of_uintK /= /W16.smod /= /#.
  (*****)
  move =>  /= r_lt0.
    move : (W16.to_sint_cmp r{2}.[x]) => /= rs_bnds.
    rewrite of_uintK /=.
    have smod_red : forall m, 0 < m => forall x, -m <= x < 0 => x %% m = x + m.
      move => m m_lb x0. smt().
    have w_tub: to_sint r{2}.[x] * 2^15 <= w.
      rewrite /w. smt().
    have /= w'_sl16_lb: W16.min_sint < to_sint r{2}.[x] * 2^15 %/ W16.modulus.
      move : rs_bnds. simplify. smt().
    have /= w_sl16_lb: W16.min_sint < w %/ W16.modulus.
      move : rs_bnds. simplify. smt().

    rewrite /smod /=.
    have -> //=: 32768 <= (w %/ 65536 %% 65536).
      rewrite /w.
      apply (lez_trans (to_sint r{2}.[x] * 2^15 %/ 65536 %% 65536) 32768 _).
      rewrite smod_red //=.
        by move : w'_sl16_lb; simplify; smt().
      move : w'_sl16_lb. simplify. smt().
      rewrite smod_red //=.
        by move : w'_sl16_lb; simplify; smt().
      rewrite smod_red //=.
        by move : w_sl16_lb; simplify; smt().
      apply lez_add2r. apply leq_div2r. apply w_tub. trivial.
    rewrite -(modz_pow2_div 32 16) //=. 
    congr; congr. 

    apply W16.to_uint_eq; rewrite !of_uintK /=.
    smt().
qed.

lemma barret_red16x_ll:
  islossless Mprevec.red16x by proc; islossless.

lemma barret_red16x_corr _a:
  phoare [Mprevec.red16x:
          _a = lift_array16 r /\
          (forall k, 0 <= k < 16 => qx16.[k] = jqx16.[k]) /\
          (forall k, 0 <= k < 16 => vx16.[k] = jvx16.[k]) ==>
          forall k, 0 <= k < 16 => W16.to_sint res.[k] = BREDC _a.[k] 26] = 1%r.
proof.
bypr => &m [#] /= H H0 H1.
have -> : 1%r = 
Pr[MLKEM_avx2_encdec.__red_x16(r{m}) @ &m :
   forall (k : int), 0 <= k && k < 16 => to_sint res.[k] = BREDC (_a.[k]) 26]; last first. 
+ byequiv barret_red16x_corr_h => //=; split. 
  + by move => k kb; rewrite (H0 k kb) /= get_of_list // /= /#. 
   by move => k kb; rewrite (H1 k kb) /= get_of_list // /= /#. 

byphoare (_: r = r{m} ==> forall (k : int), 0 <= k && k < 16 => to_sint res.[k] = BREDC (_a.[k]) 26)=> //=.
proc; unroll for 2.
wp; call (barrett_reduce_corr _a.[15]).
wp; call (barrett_reduce_corr _a.[14]).
wp; call (barrett_reduce_corr _a.[13]).
wp; call (barrett_reduce_corr _a.[12]).
wp; call (barrett_reduce_corr _a.[11]).
wp; call (barrett_reduce_corr _a.[10]).
wp; call (barrett_reduce_corr _a.[9]).
wp; call (barrett_reduce_corr _a.[8]).
wp; call (barrett_reduce_corr _a.[7]).
wp; call (barrett_reduce_corr _a.[6]).
wp; call (barrett_reduce_corr _a.[5]).
wp; call (barrett_reduce_corr _a.[4]).
wp; call (barrett_reduce_corr _a.[3]).
wp; call (barrett_reduce_corr _a.[2]).
wp; call (barrett_reduce_corr _a.[1]).
wp; call (barrett_reduce_corr _a.[0]).
auto => />. 
rewrite /lift_array16 tP /= in H.
split; 1: by  move : (H 0 _)  => //; rewrite mapiE //= => -> /=. 
move => ???;split; 1: by  move : (H 1 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 2 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 3 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 4 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 5 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 6 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 7 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 8 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 9 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 10 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 11 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 12 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 13 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 14 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???;split; 1: by  move : (H 15 _)  => //; rewrite mapiE //= => ->  /=. 
move => ???k??. 
case (k = 0); 1: by move => *; do 15!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 1); 1: by move => *; do 14!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 2); 1: by move => *; do 13!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 3); 1: by move => *; do 12!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 4); 1: by move => *; do 11!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 5); 1: by move => *; do 10!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 6); 1: by move => *; do 9!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 7); 1: by move => *; do 8!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 8); 1: by move => *; do 7!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 9); 1: by move => *; do 6!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 10); 1: by move => *; do 5!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 11); 1: by move => *; do 4!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 12); 1: by move => *; do 3!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 13); 1: by move => *; do 2!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 14); 1: by move => *; do 1!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 15); 1: by move => *; rewrite Array16.set_eqiE /#.
by smt().
qed.

lemma barret_red16x_corr_hh _a:
  hoare [Mprevec.red16x:
          _a = lift_array16 r /\
          (forall k, 0 <= k < 16 => qx16.[k] = jqx16.[k]) /\
          (forall k, 0 <= k < 16 => vx16.[k] = jvx16.[k]) ==>
          forall k, 0 <= k < 16 => W16.to_sint res.[k] = BREDC _a.[k] 26].
hoare.
bypr => &m; rewrite Pr[ mu_not] => [#] ???. 
have -> : Pr[Mprevec.red16x(r{m}, qx16{m}, vx16{m}) @ &m :
   forall (k : int), 0 <= k && k < 16 => to_sint res.[k] = BREDC _a.[k] 26] = 1%r.
+ byphoare (_: _a = lift_array16 r /\
          (forall k, 0 <= k < 16 => qx16.[k] = jqx16.[k]) /\
          (forall k, 0 <= k < 16 => vx16.[k] = jvx16.[k]) ==>
          forall k, 0 <= k < 16 => W16.to_sint res.[k] = BREDC _a.[k] 26) => //.
  by apply barret_red16x_corr.

have -> : Pr[Mprevec.red16x(r{m}, qx16{m}, vx16{m}) @ &m : true] = 1%r; last by auto.

byphoare => //; apply barret_red16x_ll.
qed.

lemma fqmulx16_corr_h:
  equiv [Mprevec.fqmulx16 ~ MLKEM_avx2_encdec.__fqmul_x16 :
         ={a, b} /\
         (forall k, 0 <= k < 16 => qx16{1}.[k] = W16.of_int 3329) /\
         (forall k, 0 <= k < 16 => qinvx16{1}.[k] = W16.of_int (-3327)) ==>
         ={res}].
proof.
  proc.
  inline *.
  unroll for{2} 3.
  wp; skip; auto => />.
  move => &1 &2 [#] qx16_def qinvx16_def.

  rewrite (_: witness<:W16.t Array16.t>.[0 <-
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
    do (rewrite get_setE 1://= 1:// /=).
    rewrite initiE 1:x_i //=.
    smt().


  apply Array16.ext_eq => x x_i.
  do (rewrite initiE 1:x_i //=).
  rewrite qx16_def 1:x_i qinvx16_def 1:x_i.

  rewrite /wmulhs //=.
  rewrite SAR_sem16 SAR_sem16 /=.
  rewrite /(`<<`) /sigextu32 /truncateu16 /=.
  rewrite shlMP; first by smt().
  rewrite W32.to_sintE W32.of_uintK W32.of_uintK W32.of_sintK /= /R /=.

  apply W16.to_uint_eq; rewrite !of_uintK /=.
  rewrite  /(W16.smod 3329) /= /(W16.smod 62209) /=.

  rewrite -(mulz_modl W16.modulus _ W16.modulus) 1://= /=.

  rewrite /(to_sint (a{2}.[x] * b{2}.[x] * (of_int 62209)%W16)) /= to_uintM /= modz_dvd //=.

  pose abxs := to_sint a{2}.[x] * to_sint b{2}.[x].

  pose abxu := to_uint (a{2}.[x] * b{2}.[x]).

  pose abxuexp := W16.smod (abxu * 62209 %% 65536) * 3329.

  pose abxsexp := W32.smod (abxs * 62209 %% 65536 * 65536) %/ 65536 * 3329.


  have -> : abxsexp = abxuexp.
  + rewrite /abxsexp /abxuexp /W16.smod /W32.smod /=; congr.
    case (2147483648 <= abxs * 62209 %% 65536 * 65536).
    + move => H; have -> /= :  32768 <= abxu * 62209 %% 65536.
      + have  : 32768 <= abxs * 62209 %% 65536. smt().
        rewrite /abxs /abxu /to_sint /smod /=. 
        case (32768 <= to_uint a{2}.[x]);
         case (32768 <= to_uint b{2}.[x]);  
           rewrite to_uintM /= /#.
      have -> : 4294967296 = 65536 * 65536 by auto.
      rewrite divzMDl //=;congr.
      rewrite /abxu /abxs to_uintM /= modzMml -(modzMml _ 62209 _) -(modzMml (to_uint a{2}.[x] * to_uint b{2}.[x]) 62209 _). congr. congr. congr.
      rewrite /to_sint /smod /= fun_if fun_if/=. 
      case (32768 <= to_uint b{2}.[x]).
      + case(32768 <= to_uint a{2}.[x]).
        + by move => *; rewrite -modzMml  -modzDm -modzMmr /= modz_mod -modzDm /= modz_mod modzMmr modzMml. 
        by move => *; rewrite -modzMml  -modzMmr /= -modzDm /= modz_mod modzMmr modzMml. 
      + case(32768 <= to_uint a{2}.[x]).
        + by move => *; rewrite -modzMml  -modzDm -modzMmr /= modz_mod /= modzMmr modzMml. 
        by move => *; rewrite -modzMml  -modzMmr /=. 
    move => H; have -> /= :  !(32768 <= abxu * 62209 %% 65536).
      + have  : !(32768 <= abxs * 62209 %% 65536). smt().
        rewrite /abxs /abxu /to_sint /smod /=. 
        case (32768 <= to_uint a{2}.[x]);
         case (32768 <= to_uint b{2}.[x]);  
           rewrite to_uintM /= /#.
    rewrite /abxu /abxs to_uintM /=  mulzK //=. 
    rewrite  modzMml -(modzMml _ 62209 _) -(modzMml (to_uint a{2}.[x] * to_uint b{2}.[x]) 62209 _). congr. congr. congr.
      rewrite /to_sint /smod /= fun_if fun_if/=. 
      case (32768 <= to_uint b{2}.[x]).
      + case(32768 <= to_uint a{2}.[x]).
        + by move => *; rewrite -modzMml  -modzDm -modzMmr /= modz_mod -modzDm /= modz_mod modzMmr modzMml. 
        by move => *; rewrite -modzMml  -modzMmr /= -modzDm /= modz_mod modzMmr modzMml. 
      + case(32768 <= to_uint a{2}.[x]).
        + by move => *; rewrite -modzMml  -modzDm -modzMmr /= modz_mod /= modzMmr modzMml. 
        by move => *; rewrite -modzMml  -modzMmr /=. 

rewrite /smod /=.
case (2147483648 <= (abxs - abxuexp) %% 4294967296).
+ move => *.
  have -> : 4294967296 = 65536 * 65536 by auto.
  rewrite -(Ring.IntID.mulNr 65536 65536) divzMDr //= -(modzDml (-65536)) /=. 

  have /= ? : -32768 * 32768 %/ 65536 <= abxs %/ 65536 <= 32768 * 32768 %/ 65536.
  + have : - 32768 * 32768 <= abxs <= 32768 * 32768; last by smt().
    have /= := W16.to_sint_cmp a{2}.[x].
    have /= := W16.to_sint_cmp b{2}.[x].
    have := interval_prod 32768 32768 32768 32768;smt().
  have /= ? : -32768 * 3329 %/ 65536 -1 <= abxuexp %/ 65536 <= 32768 * 3329 %/ 65536. move : W16.to_uint_cmp => /=. rewrite /abxuexp /abxu /smod /=.  smt().
  case (0 <= (abxs - abxuexp)). smt().
  move => *.
  have -> : (abxs - abxuexp) = -(abxuexp - abxs) by ring.
  rewrite modNz /=; 1, 2: by smt().
  rewrite -(modzDml _ (-1)) /= -(modzDmr _ (-1)) /= modzDml.
  have -> := (modz_add_carry (abxuexp - abxs) 4294967295 4294967296 _ _ _);1..3: smt(). 
  have -> : 4294967295 - (abxuexp - abxs + 4294967295 - 4294967296) = 
            abxs - abxuexp + 4294967296 by ring. 
  have -> : 4294967296 = 65536*65536 by auto. rewrite divzMDr // modzDl.
  congr; congr. 
  have -> : abxs - abxuexp = abxs %/ 65536 * 65536 + abxs %% 65536 - abxuexp %/ 65536 * 65536 - abxuexp %% 65536 by smt(divz_eq).
  have -> : abxs %% 65536 = abxuexp %% 65536; last by smt().
  apply modzB_eq0 => //. rewrite /abxs /abxuexp /abxu.
  have -> : W16.smod (to_uint (a{2}.[x] * b{2}.[x]) * 62209 %% 65536) =
             (to_sint (a{2}.[x] * b{2}.[x] * (of_int 62209)%W16))
     by rewrite /to_sint /=  (W16.to_uintM _ (W16.of_int 62209)) /=. 
  rewrite -modzDm /= modzM_sint /=.
  have -> : 3329 = -(to_sint (of_int (-3329)))%W16 by rewrite /to_sint /smod /=.
  rewrite -Ring.IntID.mulNr Ring.IntID.mulrNN modzM_sint /= to_uintM /= to_uintM /=.
  smt().

  move => H.
case (0 <= abxs - abxuexp). 
+ move => *. rewrite (modz_small _ 4294967296) /=. 
  have /= ? : -32768 * 32768 %/ 65536 <= abxs %/ 65536 <= 32768 * 32768 %/ 65536.
      have /= := W16.to_sint_cmp a{2}.[x].
    have /= := W16.to_sint_cmp b{2}.[x].
    have := interval_prod 32768 32768 32768 32768;smt().

  have /= ? : -32768 * 3329 %/ 65536 -1 <= abxuexp %/ 65536 <= 32768 * 3329 %/ 65536. move : W16.to_uint_cmp => /=. rewrite /abxuexp /abxu /smod /=.  smt().
  + rewrite StdOrder.IntOrder.ger0_norm //=. smt().
  congr; congr. 
  have -> : abxs - abxuexp = abxs %/ 65536 * 65536 + abxs %% 65536 - abxuexp %/ 65536 * 65536 - abxuexp %% 65536 by smt(divz_eq).
  have -> : abxs %% 65536 = abxuexp %% 65536; last by smt().
  apply modzB_eq0 => //. rewrite /abxs /abxuexp /abxu.
  have -> : W16.smod (to_uint (a{2}.[x] * b{2}.[x]) * 62209 %% 65536) =
             (to_sint (a{2}.[x] * b{2}.[x] * (of_int 62209)%W16))
     by rewrite /to_sint /=  (W16.to_uintM _ (W16.of_int 62209)) /=. 
  rewrite -modzDm /= modzM_sint /=.
  have -> : 3329 = -(to_sint (of_int (-3329)))%W16 by rewrite /to_sint /smod /=.
  rewrite -Ring.IntID.mulNr Ring.IntID.mulrNN modzM_sint /= to_uintM /= to_uintM /=.
  smt().

move => HH.
have -> : abxs - abxuexp = -(abxuexp - abxs) by ring.
rewrite modNz /= 1,2:/#. 
  rewrite -(modzDml _ (-1)) /= -(modzDmr _ (-1)) /= modzDml.
  have /= ? : -32768 * 32768 %/ 65536 <= abxs %/ 65536 <= 32768 * 32768 %/ 65536.
      have /= := W16.to_sint_cmp a{2}.[x].
    have /= := W16.to_sint_cmp b{2}.[x].
    have := interval_prod 32768 32768 32768 32768;smt().

  have /= ? : -32768 * 3329 %/ 65536 -1 <= abxuexp %/ 65536 <= 32768 * 3329 %/ 65536. move : W16.to_uint_cmp => /=. rewrite /abxuexp /abxu /smod /=.  smt().
  have -> := (modz_add_carry (abxuexp - abxs) 4294967295 4294967296 _ _ _). 
    smt().  smt(). smt(). 
  have -> : 4294967295 - (abxuexp - abxs + 4294967295 - 4294967296) = 
            abxs - abxuexp + 4294967296 by ring. 
  have -> : 4294967296 = 65536*65536 by auto. rewrite divzMDr // modzDl.
  congr; congr. 
  have -> : abxs - abxuexp = abxs %/ 65536 * 65536 + abxs %% 65536 - abxuexp %/ 65536 * 65536 - abxuexp %% 65536 by smt(divz_eq).
  have -> : abxs %% 65536 = abxuexp %% 65536; last by smt().
  apply modzB_eq0 => //. rewrite /abxs /abxuexp /abxu.
  have -> : W16.smod (to_uint (a{2}.[x] * b{2}.[x]) * 62209 %% 65536) =
             (to_sint (a{2}.[x] * b{2}.[x] * (of_int 62209)%W16))
     by rewrite /to_sint /=  (W16.to_uintM _ (W16.of_int 62209)) /=. 
  rewrite -modzDm /= modzM_sint /=.
  have -> : 3329 = -(to_sint (of_int (-3329)))%W16 by rewrite /to_sint /smod /=.
  rewrite -Ring.IntID.mulNr Ring.IntID.mulrNN modzM_sint /= to_uintM /= to_uintM /=.
  smt().

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
bypr => &m [#] /= H H0 H1 H2.
have -> : 1%r = 
Pr[MLKEM_avx2_encdec.__fqmul_x16(a{m}, b{m}) @ &m :
   forall (k : int), 0 <= k && k < 16 => to_sint res.[k] = SREDC (_a.[k] * _b.[k])]; last by  byequiv fqmulx16_corr_h => //=. 
byphoare (_: a = a{m} /\ b = b{m} ==> forall (k : int), 0 <= k && k < 16 => to_sint res.[k] = SREDC (_a.[k] * _b.[k]))=> //=.
proc; unroll for 3.
wp; call (fqmul_old_corr _a.[15] _b.[15]).
wp; call (fqmul_old_corr _a.[14] _b.[14]).
wp; call (fqmul_old_corr _a.[13] _b.[13]).
wp; call (fqmul_old_corr _a.[12] _b.[12]).
wp; call (fqmul_old_corr _a.[11] _b.[11]).
wp; call (fqmul_old_corr _a.[10] _b.[10]).
wp; call (fqmul_old_corr _a.[9] _b.[9]).
wp; call (fqmul_old_corr _a.[8] _b.[8]).
wp; call (fqmul_old_corr _a.[7] _b.[7]).
wp; call (fqmul_old_corr _a.[6] _b.[6]).
wp; call (fqmul_old_corr _a.[5] _b.[5]).
wp; call (fqmul_old_corr _a.[4] _b.[4]).
wp; call (fqmul_old_corr _a.[3] _b.[3]).
wp; call (fqmul_old_corr _a.[2] _b.[2]).
wp; call (fqmul_old_corr _a.[1] _b.[1]).
wp; call (fqmul_old_corr _a.[0] _b.[0]).
auto => />. 
rewrite /lift_array16 tP /= in H.
rewrite /lift_array16 tP /= in H0.
split; 1: by  move : (H 0 _) (H0 0 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 1 _) (H0 1 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 2 _) (H0 2 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 3 _) (H0 3 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 4 _) (H0 4 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 5 _) (H0 5 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 6 _) (H0 6 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 7 _) (H0 7 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 8 _) (H0 8 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 9 _) (H0 9 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 10 _) (H0 10 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 11 _) (H0 11 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 12 _) (H0 12 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 13 _) (H0 13 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 14 _) (H0 14 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????;split; 1: by  move : (H 15 _) (H0 15 _) => //; rewrite mapiE //= => -> -> /=. 
move => ????k??. 
case (k = 0); 1: by move => *; do 15!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 1); 1: by move => *; do 14!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 2); 1: by move => *; do 13!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 3); 1: by move => *; do 12!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 4); 1: by move => *; do 11!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 5); 1: by move => *; do 10!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 6); 1: by move => *; do 9!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 7); 1: by move => *; do 8!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 8); 1: by move => *; do 7!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 9); 1: by move => *; do 6!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 10); 1: by move => *; do 5!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 11); 1: by move => *; do 4!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 12); 1: by move => *; do 3!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 13); 1: by move => *; do 2!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 14); 1: by move => *; do 1!(rewrite Array16.set_neqiE 1,2:/#); rewrite Array16.set_eqiE /#.
case (k = 15); 1: by move => *; rewrite Array16.set_eqiE /#.
by smt().
qed.


lemma fqmulx16_corr_hh _a _b:
  hoare [Mprevec.fqmulx16 :
          _a = lift_array16 a /\
          _b = lift_array16 b /\
          (forall k, 0 <= k < 16 => qx16.[k] = W16.of_int 3329) /\
          (forall k, 0 <= k < 16 => qinvx16.[k] = W16.of_int (-3327)) ==>
          forall k, 0 <= k < 16 => to_sint res.[k] = SREDC (_a.[k] * _b.[k])].
hoare.
bypr => &m; rewrite Pr[ mu_not] => [#] ???H. 
have -> : Pr[Mprevec.fqmulx16(a{m}, b{m}, qx16{m}, qinvx16{m}) @ &m :
   forall (k : int), 0 <= k && k < 16 => to_sint res.[k] = SREDC (_a.[k] * _b.[k])] = 1%r.
+ byphoare (_: _a = lift_array16 a /\
          _b = lift_array16 b /\
          (forall k, 0 <= k < 16 => qx16.[k] = W16.of_int 3329) /\
          (forall k, 0 <= k < 16 => qinvx16.[k] = W16.of_int (-3327)) ==>
          forall k, 0 <= k < 16 => to_sint res.[k] = SREDC (_a.[k] * _b.[k])) => //=.
  + by apply fqmulx16_corr. 
  do split; 1..3: by auto.
  by move => k kb; rewrite H //.
have -> : Pr[Mprevec.fqmulx16(a{m}, b{m}, qx16{m}, qinvx16{m}) @ &m : true] = 1%r; last by auto.

byphoare => //; apply fqmulx16_ll.
qed.

from CryptoSpecs require import GFq Correctness1024.
import Zq.

lemma compress_avx2_impl_small (a: W16.t):
  bpos16 a q =>
  msb
  (packss16
     (((W16.of_int 1664) - a) `^` ((W16.of_int 1664) - a `|>>` (W8.of_int 15)) - (W16.of_int 832))) =
  b_decode (incoeff (W16.to_sint a)).
proof.
  rewrite /bpos16 qE => abnd.
  rewrite /b_decode /=.
  rewrite /as_sint //=.
  rewrite qE (_: 3329 %/ 2 = 1664) 1://=.
  rewrite /packss16 //=.
  do rewrite (fun_if W8.msb).

  rewrite incoeffK (pmod_small _ q); first by rewrite qE abnd.

  case ((W16.of_int 1664) \slt a) => a_gt_hq.
    have hq_s_a_lt0: ((W16.of_int 1664) - a) \slt W16.zero.
      move : a_gt_hq. rewrite /W16.(\slt).
      rewrite to_sintB_small.
       rewrite of_sintK /smod //=.
       move : abnd => /#.
      do (rewrite of_sintK /smod //=).
      rewrite /to_sint /smod /= /#.
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
          move : (W16.twos_compl ((W16.of_int 1664) - a)). 
          by move => ->;ring.
    do !(rewrite to_sintB_small || rewrite to_sintN || rewrite /smod //=); first 7 by move : hq_s_a_lt0 a_gt_hq abnd => /#.
    rewrite bits8_div 1://= //=.
    do (rewrite to_uintD || rewrite to_uintN || rewrite to_uintK //= || rewrite of_uintK //=).
    rewrite -to_sint_unsigned. by move : a_gt_hq => /#.
    rewrite modzNm.
    rewrite (_: (- to_sint a) %% 65536 = - to_sint a + 65536) 1://=.
      move : a_gt_hq. rewrite sltE of_sintK /smod //=.
      move : abnd => /#.
    rewrite (_: (- (1664 + ((- to_sint a) + 65536))) %% 65536 =
                (to_sint a - 1664) %% 65536).
      smt(modzNm modzDr).
    rewrite (pmod_small (to_sint a - 1664) 65536).
      move : a_gt_hq. rewrite sltE of_sintK /smod //=.
      move : abnd => /#.
      smt().

  move : a_gt_hq. 
  rewrite /W16.(\slt) -lezNgt -/W16.(\sle) -W16.sleE => hq_gte_a.
  have hq_s_a_gt0: W16.zero \sle ((W16.of_int 1664) - a).
    move : hq_gte_a. rewrite /W16.(\sle).
    rewrite to_sintB_small of_sintK /smod //=.
    move : abnd.
    smt().
    do (rewrite /smod //=).
    smt().
  rewrite (_: (W16.of_int 1664) - a `|>>` (W8.of_int 15) = W16.zero).
    move : hq_s_a_gt0.
    smt(getsignPos).
  simplify.
  have ->: !1664 < to_sint a.
    move : hq_gte_a. rewrite /W16.(\sle).
    rewrite of_sintK /smod //= lezNgt //=.
  rewrite /msb //=.
  rewrite /smod //=.
  rewrite W16.sleE -lezNgt -ltzNge.
  rewrite to_sintB_small.
    rewrite to_sintB_small.
      + rewrite of_sintK /smod //=. move : abnd. smt().
    do (rewrite  /smod //=). move : abnd. smt().
  rewrite to_sintB_small.
    rewrite of_sintK /smod //=. move : abnd. smt().
  do (rewrite /smod //=).
  rewrite (_: `|to_sint a| = to_sint a).
    move : abnd => /#.
  rewrite bits8_div 1://= //=.
  rewrite to_uintD to_uintN to_uintD to_uintN //=.
  rewrite -to_sint_unsigned.
    move : abnd => /#.
  case (to_sint a = 0) => a_0.
    rewrite a_0 //=.
    smt(). 
qed.

end Fq_avx2.
