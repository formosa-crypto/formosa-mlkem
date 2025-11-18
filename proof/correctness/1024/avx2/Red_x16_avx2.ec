require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel JWord.
from JazzEC require import Array16 WArray512 WArray32 WArray16.

require import W16extra.

require import Fq MLKEM_Poly MLKEMFCLib.
require import AVX2_Ops MLKEM_Poly_avx2_prevec.
require import Montgomery16.

import Fq MLKEM_Poly.
import SignedReductions.

theory Fq_avx2_red.

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

module MLKEM_avx2_encdec_red = {
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
  equiv [Mprevec.red16x ~ MLKEM_avx2_encdec_red.__red_x16 :
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
Pr[MLKEM_avx2_encdec_red.__red_x16(r{m}) @ &m :
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

end Fq_avx2_red.
