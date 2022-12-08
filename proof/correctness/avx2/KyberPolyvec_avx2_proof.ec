require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel.
require import Fq Array4 Array8 Array16 Array32 Array128 Array256 Array960 Array384 Array400 Array768 Array1152.
require import W16extra WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800.
require import AVX2_Ops.
require import Jkem_avx2 Jkem.
require import KyberPolyvec_avx2_prevec.
require import KyberPoly_avx2_vec.
require import KyberPoly_avx2_proof.
require import KyberPoly_avx2_vec.
require import Fq_avx2.
require import KyberPolyVec.
require import KyberPolyvec_avx2_vec.
require import NTT_avx2.
require import Kyber_AVX2_cf.
require import KyberINDCPA.

theory KyberPolyvecAVX.

import Fq.
import SignedReductions.
import Kyber.
import KyberSpec.
import Zq.
import KyberPolyAVX.
import KyberPolyAVXVec.
import KyberPolyVec.
import KyberPolyVecAVXVec.
import KyberPoly.
import KyberPoly.
import NTT_Avx2.
import AVX2_cf.
import KMatrix.

lemma polvec_add_corr_h _a _b ab bb:
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      hoare[Mprevec.polyvec_add2:
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\
           forall k, 0 <= k < 768 =>
             inFq (to_sint res.[k]) = _a.[k] + _b.[k]].
proof.
  move => abb bbb.
  proc.
  wp.
  call (KyberPolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[(2 * 256) + i])) (Array256.init (fun i => _b.[(2 * 256) + i])) ab bb abb bbb).
  wp.
  call (KyberPolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[256 + i])) (Array256.init (fun i => _b.[256 + i])) ab bb abb bbb).
  wp.
  call (KyberPolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[0 + i])) (Array256.init (fun i => _b.[0 + i])) ab bb abb bbb).
  wp. skip.
  move => /= &hr; rewrite /lift_array768 /lift_array256 !tP => [#] _a_def _b_def sgnd_bnd_rp sgnd_bnd_bp.
  split.
  + do split => /=; smt(@Array768 @Array256). 
    
  move => [#] ??? sgnd_bnd_bp_1 result_1 [#]  sgnd_bnd_res_1 res_1_def.
  split.
  + rewrite !tP;do split; move => *; rewrite !initiE; smt(@Array256 @Array768).
  move => [#] ???sgnd_bnd_bp_2 result_2 [#] sgnd_bnd_res_2 res_2_def.
  split.
  + rewrite !tP;do split; move => *; rewrite !initiE /= // ?mapiE //; smt(@Array256 @Array768).
  move => [#] ??? sgnd_bnd_bp_3 result_3 [#] sgnd_bnd_res_3 res_3_def.
  split.
  rewrite /signed_bound768_cxq.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_1.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_2.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_3.
  move => k k_i.
  do rewrite initiE //=.
  move : (sgnd_bnd_res_1 k) (sgnd_bnd_res_2 (k - 256)) (sgnd_bnd_res_3 (k - 512)).
  smt(@Array768 @Array256 @Int).
  move => k [#] k_lb k_ub.
  do rewrite initiE //=.
  case (0 <= k < 256) => k_si.
  move : (res_1_def k k_si).
  move : _a_def _b_def.
  smt(@Array256 @Array768 @KyberPolyAVX @Int).
  case (k < 512) => k_ssi.
  move : (res_2_def (k - 256)).
  rewrite (_: (0 <= k - 256 && k - 256 < 256) = true). move : k_si k_ub k_ssi => /#.
  simplify.
  move : _a_def _b_def.
  smt(@Array256 @Array768 @KyberPolyAVX @Int).
  move : (res_3_def (k - 512)).
  rewrite (_: (0 <= k - 512 && k - 512 < 256) = true). move : k_si k_ub k_ssi => /#.
  simplify.
  move : _a_def _b_def.
  rewrite -lezNgt in k_ssi.
  rewrite k_ub k_ssi //=.
  rewrite /lift_array256.
  do rewrite initiE 1:/#.
  smt(@Array256 @Array768 @KyberPolyAVX @Int).

qed.

lemma polyvec_add_ll : islossless Mprevec.polyvec_add2
  by proc; do 3!(wp; call KyberPolyAVX.poly_add_ll).

lemma polvec_add_corr _a _b ab bb:
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      phoare[Mprevec.polyvec_add2:
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\
           forall k, 0 <= k < 768 =>
             inFq (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r.
  move => abb bbb.
  conseq (polyvec_add_ll) (polvec_add_corr_h _a _b ab bb abb bbb).
  by smt().
qed.

lemma polyvec_csubq_corr_h ap :
  hoare[Mprevec.polyvec_csubq:
       ap = lift_array768 r /\
       pos_bound768_cxq r 0 768 2
       ==>
       ap = lift_array768 res /\
       pos_bound768_cxq res 0 768 1].
proof.
  proc; sp.
  wp.
  ecall (KyberPolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[2 * 256 + i])))).
  wp.
  ecall (KyberPolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[256 + i])))).
  wp.
  ecall (KyberPolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[i])))).
   wp. skip.
   rewrite /lift_array768 /lift_array256 /pos_bound256_cxq !tP;move => &hr [ap_def pos_bound_r]; split.
   split; trivial; smt(@Array256).
   move => [r_eq_r_1 pos_bound_r_1 res1 [r_eq_res_1 pos_bound_res_1] res_1_def]; split.
   split; trivial => k kb @/res_1_def; rewrite !initiE //=; smt(@Array768 @Array256 qE).
   move => [r_eq_r_2 pos_bound_r_2 res2 [r_eq_res_2 pos_bound_res_2] res_2_def]; split.
   split; trivial => k kb @/res_2_def; rewrite !initiE //=; smt(@Array768 @Array256 qE).
   move => [r_eq_r_3 pos_bound_r_3 res3 [r_eq_res_3 pos_bound_res_3] res_3_def]; split.
   rewrite /res_3_def /res_2_def /res_1_def /=.
   rewrite tP => k kb; rewrite ap_def // !mapiE //= initiE //=.
   case (512 <= k < 768) => k_si. 
   rewrite tP in r_eq_res_3; move : (r_eq_res_3 (k - 512) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.
   case (256 <= k < 512) => k_ssi.
   rewrite tP in r_eq_res_2; move : (r_eq_res_2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.
   rewrite tP in r_eq_res_1; move : (r_eq_res_1 (k ) _);  1:by smt().
   rewrite !mapiE 1,2:/# /=.
   do rewrite initiE 1:/# //=.
    by smt(). by smt().
   case (256 <= k < 512) => k_ssi.
   do rewrite initiE 1:/# //= k_ssi /=.
   rewrite tP in r_eq_res_2; move : (r_eq_res_2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=. smt().
   rewrite tP in r_eq_res_1; move : (r_eq_res_1 (k ) _);  1:by smt().
   rewrite !mapiE 1,2:/# /=.
   do rewrite initiE 1:/# //=.
    by smt(). 
   rewrite /pos_bound768_cxq => k k_i.
   do rewrite initiE //=.
   rewrite /pos_bound256_cxq /bpos16 //=in pos_bound_res_3.
   rewrite /pos_bound256_cxq /bpos16 //=in pos_bound_res_2.
   rewrite /pos_bound256_cxq /bpos16 //=in pos_bound_res_1.
   move : (pos_bound_res_3 (k - 512))  (pos_bound_res_2 (k - 256))  (pos_bound_res_1 k).
   smt(@Array256 @Array768).
qed.

lemma polyvec_csubq_ll: islossless Mprevec.polyvec_csubq.
  by proc; do 3!(wp; call KyberPolyAVX.poly_csubq_ll).
qed.

lemma polyvec_csubq_corr ap:
  phoare[Mprevec.polyvec_csubq:
       ap = lift_array768 r /\
       pos_bound768_cxq r 0 768 2
       ==>
       ap = lift_array768 res /\
       pos_bound768_cxq res 0 768 1] = 1%r.
  conseq (polyvec_csubq_ll) (polyvec_csubq_corr_h ap).
  by smt().
qed.

(* TODO: move to W8 theory ?? *)
lemma shl_shlw_w8 (k: int) (w: W8.t):
  0 <= k < W8.size =>
  w `<<` W8.of_int k = w `<<<` k.
proof.
  move=> *; rewrite /(`<<`) of_uintK (modz_small (k %% W8.modulus)).
   smt(modz_cmp).
  by rewrite modz_small //; smt(@W8).
qed.

lemma shr_shrw_w8 (k: int) (w: W8.t):
  0 <= k < W8.size =>
  w `>>` W8.of_int k = w `>>>` k.
proof.
  move=> *; rewrite /(`>>`) of_uintK (modz_small (k %% W8.modulus)).
   smt(modz_cmp).
  by rewrite pmod_small //; smt(@W8).
qed.

lemma sint_compress_rng a d :
   1 <= d < 12 =>
   0 <= W16.to_sint (W16.of_int (compress d a)) < 2^d.
proof.
  move => drng.
  rewrite of_sintK Montgomery16.smod_small.
    move : drng (compress_rng a d drng).
    rewrite andabP -(mem_iota 1 11 d).
    move : d.
    rewrite -List.allP -iotaredE //= => /#.
  by apply compress_rng.
qed.

lemma compress_aux_1 (x: W64.t) (i: int):
  0 <= i < 8 =>
  (x `>>` (W8.of_int 12) \bits8 i) = W8.of_int (W8.to_uint ((x \bits8 (i+1)) `>>>` 4) + (to_uint ((x \bits8 (i+2)) `<<<` 4))).
proof.
  move => ib.
  rewrite shr_shrw 1://= -{1}(W64.to_uintK x) shrDP 1://=.
  rewrite of_int_bits8_div 1:/#.
  rewrite (pmod_small (to_uint x) W64.modulus) 1:W64.to_uint_cmp.
  rewrite bits8_div 1:/# shrDP 1://= of_uintK.
  rewrite bits8_div 1:/# shlMP 1://= of_uintK.
  rewrite (pmod_small _ W8.modulus). smt(W8.to_uint_cmp @IntDiv).
  rewrite -divz_mulp 1://=. by move : ib; rewrite andabP -(mem_iota 0 8 i); move : i; rewrite -List.allP -iotaredE //=.
  rewrite -exprD_nneg 1..2:/#.
  rewrite mulzDr mulzDr //=.
  rewrite (modz_pow2_div 8 4 (to_uint x %/ 2 ^ (8 * i + 8))) 1://=.
  rewrite -divz_mulp 2://=. by move : ib; rewrite andabP -(mem_iota 0 8 i); move : i; rewrite -List.allP -iotaredE //=.
  rewrite -exprD_nneg 1..2:/# //=.
  rewrite -(W8.of_int_mod (_ %% 16 + _ %% 256)) modzDmr.
  rewrite (addzC (8*i) _) (addzC (8*i) _).
  rewrite (_: 2^(16 + 8 * i) = 2^(12 + 8*i) * 2^4); first by rewrite -exprD_nneg 1..2:/# //=.
  rewrite divz_mulp 2://=. by move : ib; rewrite andabP -(mem_iota 0 8 i); move : i; rewrite -List.allP -iotaredE //=.
  rewrite (addzC (_ %% 16) _) //= -(divz_eq _ 16).
  rewrite of_int_mod.
  reflexivity.
qed.

lemma compress_aux_2 (f: W16.t Array16.t) (i l: int):
  0 <= i < 8 =>
  0 <= l < 7 =>
  l %% 2 = 0 =>
  pack2_t
   ((W2u32.Pack.init
       (fun (j : int) =>
          ((init
              (fun (i0 : int) =>
                 ((init
                     (fun (i1 : int) =>
                        (of_int
                           (to_sint f.[2 * i1] *
                            to_sint
                              ((init
                                  (fun (i2 : int) =>
                                     (of_int (2 ^ (i2 %% 2 * 10)))%W16)))%Array16.[
                              2 * i1] +
                            to_sint f.[2 * i1 + 1] *
                            to_sint
                              ((init
                                  (fun (i2 : int) =>
                                     (of_int (2 ^ (i2 %% 2 * 10)))%W16)))%Array16.[
                              2 * i1 + 1]))%W32)))%Array8.[i0] `<<<`
                 to_uint
                   ((init
                       (fun (i1 : int) => (of_int ((i1 + 1) %% 2 * 12))%W32)))%Array8.[i0])))%Array8.[
          l + j]))) \bits8 i =
                   W8.of_int (W32.to_uint (W32.of_int
                                            (to_sint f.[(l + i %/ 4) * 2] +
                                             to_sint f.[(l + i %/ 4) * 2 + 1] * (2 ^ 10)) `<<<` (i %/ 4 + 1) %% 2 * 12) %/ 2 ^ (8 * (i %% 4))).
proof.
  move => ib lb l_even.
  rewrite {1}(divz_eq i 4) (mulzC _ 4).
  rewrite -W64_bits32_bits8 1:modz_cmp 1://=.
  rewrite -get_unpack32 1:/# pack2K.
  do (rewrite initiE 1:/# /=).
  rewrite (mulzC 2 (l + i %/ 4)).
  do (rewrite modzMl || rewrite modzMDl || rewrite mul0z).
  rewrite expr0 (W16.of_sintK 1) mulz1 //=.
  rewrite of_sintK (Montgomery16.smod_small 1024) 1://=.
  rewrite of_uintK (pmod_small _ W32.modulus); first by smt(modz_cmp).
  rewrite bits8_div 1:/#.
  rewrite -(addzA l _ _) -(modzDml l _ 2) l_even add0z.
  reflexivity.
qed.

lemma compress_truncate1 (a b: W16.t):
  W8.of_int (W8.to_uint (W8.of_int (W32.to_uint (W32.of_int (to_uint a + to_uint b * (2 ^ 10)) `<<<` 12) %/ 256) `>>>` 4) +
             W8.to_uint (W8.of_int (W32.to_uint (W32.of_int (to_uint a + to_uint b * (2 ^ 10)) `<<<` 12) %/ 65536) `<<<` 4))
  =
  W8.of_int (W16.to_uint a).
proof.
  rewrite shlMP 1://= of_uintK (modz_pow2_div 32 16 _) 1://= //=.
  rewrite (_: 65536 = 2^(8*2)) 1://= (divzMr _ (2^12) (2^4)) 1..2://= mulzK 1://=.
  rewrite shrDP 1://= of_uintK (modz_pow2_div 8 4 _) 1://= //=.
  rewrite -divzMr 1..2://= //= (modz_pow2_div 32 12 _) 1://= //= mulzK 1://=.
  rewrite (modz_dvd _ _ 16) 1://= (pmod_small _ 256); first by smt(modz_cmp).
  rewrite shlMP 1://= of_uintK mulz_modl 1://=.
  rewrite (_: 1024 = 2^2 * 2^4 * 2^4) 1://= -mulzA -mulzA (divzMDr _ _ (2^4)) 1://=.
  rewrite modz_dvd 1://= modzMDr.
  rewrite mulzDl (mulzA _ 16 16) modzMDl.
  rewrite -mulz_modl 1://= -(modz_pow2_div 8 4 _) 1://=.
  rewrite -(modz_dvd _ 256 16) 1://=.
  rewrite addzC -divz_eq.
  rewrite of_int_mod //=.
qed.

lemma compress_truncate2 (a b: W16.t):
  W8.of_int (W8.to_uint (W8.of_int (W32.to_uint (W32.of_int (to_uint a + to_uint b * (2 ^ 10)) `<<<` 12) %/ 65536) `>>>` 4) +
             W8.to_uint (W8.of_int (W32.to_uint (W32.of_int (to_uint a + to_uint b * (2 ^ 10)) `<<<` 12) %/ 16777216) `<<<` 4))
  =
  W8.of_int (W16.to_uint a %/ 256 + W16.to_uint b * 4).
proof.
  rewrite shlMP 1://= of_uintK (modz_pow2_div 32 16 _) 1://= //=.
  rewrite (_: 65536 = 2^(8*2)) 1://= (divzMr _ (2^12) (2^4)) 1..2://= mulzK 1://=.
  rewrite shrDP 1://= (modz_pow2_div 32 24 _) 1://= //=.
  rewrite (modz_dvd _ _ 256) 1://= (modz_pow2_div 8 4 _) 1://= -divzMr 1..2://= //=.
  rewrite {1}(_: 1024 = 4 * 256) 1://= -(mulzA _ 4 256) (divzMDr _ _ 256) 1://=.
  rewrite (pmod_small _ 256); first by smt(modz_cmp).
  rewrite (_: 16777216 = 2^(12+12)) 1://= (divzMr _ (2^12) (2^12)) 1..2://= mulzK 1://=.
  rewrite shlMP 1://= of_uintK (_: W8.modulus = 2^4*2^4) 1://=.
  rewrite -(mulz_modl 16 _ 16) 1://= modz_dvd 1://=.
  rewrite (_: 2^12 = 2^(8+4)) 1://= (divzMr _ (2^8) (2^4)) 1..2://=.
  rewrite (_: 1024 = 4 * 256) 1://= -(mulzA _ 4 256) (divzMDr _ _ 256) 1://=.
  rewrite mulz_modl 1://= //= -of_int_mod modzDmr.
  rewrite addzC -divz_eq addzC.
  rewrite of_int_mod //=.
qed.

lemma compress_truncate3 (a b c d: W16.t):
  0 <= to_uint a < 2^10 =>
  0 <= to_uint b < 2^10 =>
  0 <= to_uint c < 2^10 =>
  0 <= to_uint d < 2^10 =>
  W8.of_int (W8.to_uint (W8.of_int (W32.to_uint (W32.of_int (to_uint a + to_uint b * (2 ^ 10)) `<<<` 12) %/ 16777216) `>>>` 4) +
             W8.to_uint (W8.of_int (W32.to_uint (W32.of_int (to_uint c + to_uint d * (2 ^ 10)) `<<<` 0)) `<<<` 4))
  =
  W8.of_int (W16.to_uint b %/ 64 + W16.to_uint c * 16).
proof.
  move => a_bnd b_bnd c_bnd d_bnd.
  rewrite shlMP 1://= of_uintK (modz_pow2_div 32 24 _) 1://= //=.
  rewrite (_: 16777216 = 2^(12+12)) 1://= (divzMr _ (2^12) (2^12)) 1..2://= mulzK 1://=.
  rewrite shrDP 1://= modz_mod 1://= (modz_pow2_div 8 4 _) 1://= //=.
  rewrite (pmod_small _ 256); first by smt(modz_cmp).
  rewrite (_: 4096 = 1024 * 4) 1://= divzMr 1..2://= (divzMDr _ _ 1024) 1://= -divzMr 1..2://= //=.
  rewrite (pdiv_small _ 1024) 1:a_bnd addz0 (pmod_small _ 16); first by move : b_bnd => /#.
  rewrite shlMP 1://= of_uintK mulz1 (pmod_small _ W32.modulus); first by move : c_bnd d_bnd => /#.
  rewrite shlMP 1://= of_uintK mulzDl (mulzA _ 1024 16) //= (_: 16384 = 64 * 256) 1://= -mulzA modzMDr.
  rewrite -of_int_mod modzDmr of_int_mod //=.
qed.

lemma compress_truncate4 (a b: W16.t):
  W8.of_int (W8.to_uint (W8.of_int (W32.to_uint (W32.of_int (to_uint a + to_uint b * (2 ^ 10)) `<<<` 0)) `>>>` 4) +
             W8.to_uint (W8.of_int (W32.to_uint (W32.of_int (to_uint a + to_uint b * (2 ^ 10)) `<<<` 0) %/ 256) `<<<` 4))
  =
  W8.of_int (W16.to_uint a %/ 16 + W16.to_uint b * 64).
proof.
  rewrite shlMP 1://= of_uintK mulz1 (pmod_small _ W32.modulus) //=; first by move : (W16.to_uint_cmp a) (W16.to_uint_cmp b) => /#.
  rewrite shrDP 1://= of_uintK (modz_pow2_div 8 4 (_ + _ * 1024)) 1://= //=.
  rewrite (pmod_small _ 256); first by smt(modz_cmp).
  rewrite (_: 1024 = 64 * 16) 1://= -(mulzA _ 64 16) (divzMDr _ _ 16) 1://=.
  rewrite shlMP 1://= of_uintK.
  rewrite (_: 256 = 16 * 16) 1://= (divzMr _ 16 16) 1..2://= (divzMDr _ _ 16) 1://= //=.
  rewrite -of_int_mod modzDmr.
  rewrite addzC -divz_eq addzC.
  rewrite of_int_mod //=.
qed.

lemma compress_truncate5 (a b: W16.t):
  0 <= to_uint a < 2^10 =>
  0 <= to_uint b < 2^10 =>
  W8.of_int (W8.to_uint (W8.of_int (W32.to_uint (W32.of_int (to_uint a + to_uint b * (2 ^ 10)) `<<<` 0) %/ 256) `>>>` 4) +
             W8.to_uint (W8.of_int (W32.to_uint (W32.of_int (to_uint a + to_uint b * (2 ^ 10)) `<<<` 0) %/ 65536) `<<<` 4))
  =
  W8.of_int (W16.to_uint b %/ 4).
proof.
  move => a_bnd b_bnd.
  rewrite shlMP 1://= of_uintK mulz1 (pmod_small _ W32.modulus) //=; first by move : a_bnd b_bnd => /#.
  rewrite shrDP 1://= of_uintK (modz_pow2_div 8 4 _) 1://= //=.
  rewrite (pmod_small _ 256); first by smt(modz_cmp).
  rewrite -divzMr 1..2://= //= (_: 4096 = 1024 * 4) 1://= divzMr 1..2://= (divzMDr _ _ 1024) 1://=.
  rewrite (_: 65536 = 1024 * 64) 1://= divzMr 1..2://= (divzMDr _ _ 1024) 1://=.
  rewrite shlMP 1://= of_uintK -(mulz_modl 16 _ 16) 1://=.
  rewrite -(modz_pow2_div 10 6 _) 1://= //=.
  rewrite (pdiv_small _ 1024) 1:a_bnd addz0 (pmod_small _ 1024) 1:b_bnd.
  rewrite (_: 64 = 4 * 16) 1://= divzMr 1..2://=.
  rewrite addzC -divz_eq //=.
qed.

lemma in_sub_trans: forall (x y z h l: int), h <= x < l => y <= h /\ l < z => y <= x && x < z.
proof.
  move => x y z h l [#] H0 H1 [#] H2 H3 /#.
qed.

lemma unlift_compress_polyvec (a: W16.t Array768.t) (d: int):
  compress_polyvec d (lift_vector a) = Array768.map (compress d) (lift_array768 a).
proof.
  apply Array768.tP => i ib.
  rewrite /compress_polyvec /fromarray256 mapiE 1:ib /=.
  rewrite mapiE 1:ib /= initiE 1:ib /=.
  case (0 <= i && i < 256) => r.
    by rewrite liftarrayvector 1..2://=.
  case (256 <= i && i < 512) => r1.
    by rewrite liftarrayvector 1://= 1:/#.
    by rewrite liftarrayvector 1://= 1:/#.
qed.

lemma polyvec_compress_corr _a (_p : address) mem :
    equiv [ Mprevec.polyvec_compress ~ EncDec_AVX2.encode10_opt_vec :
             pos_bound768_cxq a{1} 0 768 2 /\
             lift_vector a{1} = _a /\
             a{2} = compress_polyvec 10 _a /\
             valid_ptr _p 960 /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             touches mem Glob.mem{1} _p 960 /\
             load_array960 Glob.mem{1} _p = res{2}].
proof.
  proc.
  cfold{1} 12.
  seq 12 2 : (#{/~a{1}}pre /\
              lift_vector a{1} = _a /\
              pos_bound768_cxq a{1} 0 768 1 /\
              to_uint rp{1} = _p /\
              v{1} = Array16.init (fun i => W16.of_int 20159) /\
              v8{1} = Array16.init (fun i => W16.of_int (20159 * 2^3)) /\
              off{1} = Array16.init (fun i => W16.of_int (2^4 - 1)) /\
              shift1{1} = Array16.init (fun i => W16.of_int (2^12)) /\
              mask{1} = Array16.init (fun i => W16.of_int (2^10-1)) /\
              shift2{1} = Array16.init (fun i => W16.of_int (2 ^ ((i %% 2) * 10))) /\
              sllvdidx{1} = Array8.init (fun i => W32.of_int (((i + 1)%% 2) * 12)) /\
              shufbidx{1} = pvc_shufbidx_s /\
              ={i} /\ i{1} = 0).
  inline Ops.iVPBROADCAST_4u64 Ops.iVPBROADCAST_16u16 Ops.iVPSLL_16u16; wp.
  ecall {1} (polyvec_csubq_corr (lift_array768 a{1})).
  skip; auto => />.
  move => &1 pos_bound_a rp_lb rp_ub result a_eq_res pos_bound_res />.
  do split.
    + rewrite eq_vectorP => i ib.
      rewrite tP => k kb.
      rewrite liftarrayvector 1:ib 1:kb.
      rewrite -a_eq_res.
      by rewrite liftarrayvector 1:ib 1:kb.
    + by rewrite -ext_eq_all /all_eq //=.
    + by rewrite -ext_eq_all /all_eq //= shl_shlw 1://= shlMP 1://=.
    + by rewrite /f4u64_t16u16 -ext_eq_all /all_eq //=.
    + by rewrite /f4u64_t8u32 -ext_eq_all /all_eq //=.
  wp.
  while(#{/~mem}{~i{1}=0}pre /\ ={i} /\ 0 <= i{1} <= 48 /\
        touches mem Glob.mem{1} _p (20*i{1}) /\
        forall k, 0 <= k < 20*i{1} => loadW8 Glob.mem{1} (_p + k ) = c{2}.[k]).
    seq 11 0: (#pre /\ forall k, 0 <= k < 16 => f0{1}.[k] = W16.of_int (compress 10 _a.[(16*i{1} + k) %/ 256].[(16*i{1} + k)%% 256])).
      inline *; wp; skip; auto => />.
      move => &1 &2 p_lb p_ub pos_bound_a i_lb i_ub mem_diff mem_eq i_tub />.
      move => k k_lb k_ub.
      do (rewrite initiE 1://= /=).
      rewrite /round_scalew /= /truncateu16 /= /wmulhs.
      rewrite of_sintK /= /(W16.smod 20159) /=.
      rewrite of_sintK /= /(W16.smod 4096) /=.
      rewrite (W16.and_mod 10 _) 1://=.
      rewrite of_uintK (modz_dvd _ _ (2^10)) 1://=.
      rewrite liftarrayvector 1..2:/# (mulzC 256 _) -(divz_eq _ 256) mapiE 1:/# /=.
      rewrite /pos_bound768_cxq /bpos16 /= in pos_bound_a.
      rewrite -compress_alt_compress_large /compress_alt_large /= qE.
      rewrite inFqK (pmod_small _ q) 1:pos_bound_a 1:/# /=.
      rewrite shl_shlw 1://= -(W16.to_uintK a{1}.[16 * i{2} + k]) shlMP 1://=.
      rewrite (W16.of_intM _ 30200) -W16.of_intD -W16.of_intS.
      rewrite /round.
      rewrite of_sintK (Montgomery16.smod_small (to_uint a{1}.[16 * i{2} + k] * 2 ^ 3)).
        rewrite -to_sint_unsigned; first by move : (pos_bound_a (16*i{2} + k)) => /#.
        move : (pos_bound_a (16*i{2} + k)) => /#.
      rewrite (W32.shr_shrw 14) 1://= -(W32.shlMP _ 12) 1://= W32.shlw_shrw_shrw 1://= /=.
      rewrite andmask_shrw 1://= (_: W32.masklsb (20 - 2) = W32.of_int (2 ^ 18 - 1)) 1://=.
      rewrite W32.and_mod 1://= -(W32.of_intD _ 1) shr_shrw 1://= (W32.shrDP _ 1) 1://=.
      rewrite of_uintK modz_dvd 1://= (pmod_small _ W32.modulus).
        pose tmp := W32.to_uint _.
       move : (modz_cmp tmp (2^18 + 1)) => /#.
      rewrite (to_sint_unsigned a{1}.[16 * i{2} + k]); first by move : (pos_bound_a (16*i{2} + k)) => /#.
      pose ai := to_uint a{1}.[_].
      rewrite shrDP 1://=.
      pose t := W16.invw _ `&` _.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (ai * 8 * 20159 %/ 65536))) <= 8192.
        rewrite to_sint_unsigned.
          rewrite of_sintK Montgomery16.smod_small.
            rewrite /ai -to_sint_unsigned; first by move : (pos_bound_a (16*i{2} + k)) => /#.
            move : (pos_bound_a (16*i{2} + k)) => /#.
          smt(W16.to_uint_cmp @W16).
        rewrite of_uintK /ai -to_sint_unsigned; first by move : (pos_bound_a (16*i{2} + k)) => /#.
        move : (pos_bound_a (16*i{2} + k)) => /#.
      have t_rng: 0 <= W16.to_sint (t `>>` (W8.of_int 15)) <= 8192.
          rewrite shr_shrw 1://= -to_uintK shrDP 1://=.
          rewrite to_sint_unsigned.
            rewrite of_sintK Montgomery16.smod_small.
              move : (W16.to_uint_cmp t) => /#.
            move : (W16.to_uint_cmp t) => /#.
          rewrite of_uintK.
          move : (W16.to_uint_cmp t) => /#.
      admit. (* FIXME *)
    seq 10 1: (#{~f0{1}}pre /\ forall k, 0 <= k < 20*i{1} + 20 => if 0 <= k < 20*i{1} then loadW8 Glob.mem{1} (_p + k ) = c{2}.[k]
                                                  else if (20*i{1} <= k < 20*i{1} + 16) then t0{1}.[k %% 20] = c{2}.[k]
                                                  else t1{1}.[k %% 4] = c{2}.[k]).
    inline *; wp; skip; auto => />.
    move => &1 &2 p_lb p_ub pos_bound_a i_lb i_ub mem_diff mem_eq i_tub f0_def />.
    do split.
      move => k k_lb k_ub />.
      rewrite filliE 1:/# /= lezNgt k_ub //=.
      by apply mem_eq.

      move => k k_lb k_ub.
      rewrite filliE 1:/# /=.
      case (k < 20 * i{2}) => k_tub.
        rewrite lezNgt k_tub /= (mem_eq k) //=.
      move : k_tub => -/lezNgt k_tlb.
      have uint_fdef: forall j, 0 <= j < 16 => W16.to_sint f0{1}.[j] = W16.to_uint f0{1}.[j].
        move => j jb.
        rewrite (f0_def j jb).
        pose ai := (lift_vector a{1}).[_].[_].
        rewrite to_sint_unsigned; first by move : (sint_compress_rng ai 10) => />.
        done.
      have fdef_bnd: forall j, 0 <= j < 16 => 0 <= W16.to_uint f0{1}.[j] < 2^10.
        move => j jb.
        rewrite (f0_def j jb).
        pose ai := (lift_vector a{1}).[_].[_].
        rewrite W16.of_uintK (pmod_small _ W16.modulus); first by rewrite (in_sub_trans _ 0 W16.modulus 0 (2^10)) 1:compress_rng 1..2://=.
        by apply compress_rng.
      case (k < 20 * i{2} + 16) => k_tub.
        rewrite k_tlb k_ub /=.
        rewrite /int_bit //=.
        rewrite -(modz_dvd k 20 5) 1://=.
        pose ki := k %% 20.
        have rk_b: ki \in iota_ 0 16.
          rewrite mem_iota /ki.
          split; first by move : (modz_cmp k 20) => />.
          move : k_tub => /#.
        rewrite initiE /=; first by rewrite andabP -(mem_iota 0 16 ki).
        have -> /=: 0 <= ki %/ 2 && ki %/ 2 < 8. by move : ki rk_b; rewrite -List.allP -iotaredE //=.
        move : ki rk_b.
        rewrite -List.allP.
        rewrite -iotaredE //=.
        do (rewrite initiE 1://= /= || rewrite /f32u8_t16u16 initiE 1://= /=).
        have H: forall (l: W32.t Array8.t), W2u32.Pack.init ("_.[_]" l) = W2u32.Pack.init (fun j => l.[0 + j]); first by simplify.
        do rewrite compress_aux_1 1://=.
        do rewrite add0z.
        do rewrite H.
        do rewrite compress_aux_2 1..3://=.
        simplify; trivial.
        do (rewrite uint_fdef 1://=).
        do (rewrite compress_truncate1 || rewrite compress_truncate2 || rewrite compress_truncate3 1..4:fdef_bnd 1..4://= ||
            rewrite compress_truncate4 || rewrite compress_truncate5 1..2:fdef_bnd 1..2://=).
        do (rewrite f0_def 1://= W16.of_uintK (pmod_small _ W16.modulus); first by rewrite (in_sub_trans _ 0 W16.modulus 0 (2^10)) 1:compress_rng 1..2://=).
        do (rewrite liftarrayvector 1..2:/# (mulzC 256 _) -divz_eq).
        do (rewrite unlift_compress_polyvec || rewrite (Array768.mapiE (fun x => compress 10 x) _ _) 1:/# //=).

      move : k_tub => -/lezNgt k_tlb1 />.
        rewrite k_tlb k_ub /=.
        rewrite /int_bit //=.
        rewrite -(modz_dvd k 20 5) 1://=.
        pose ki := k %% 20.
        have rk_b: ki \in iota_ 16 4.
          rewrite mem_iota /ki.
          move : (modz_cmp k 20) k_tlb1 k_ub => /#.
        have ->: k %% 4 = ki - 16.
          move : k_tlb1 k_ub => /#.
        rewrite initiE /=; first by move : ki rk_b; rewrite -List.allP -iotaredE //=.
        move : ki rk_b.
        rewrite -List.allP.
        rewrite -iotaredE //=.
        do (rewrite initiE 1://= /= || rewrite /f32u8_t16u16 initiE 1://= /=).
        do rewrite compress_aux_1 1://=.
        do rewrite compress_aux_2 1..3://=.
        simplify; trivial.
        do (rewrite uint_fdef 1://=).
        rewrite compress_truncate2 compress_truncate3 1..4:fdef_bnd 1..4://= compress_truncate4 compress_truncate5 1..2:fdef_bnd 1..2://=.
        do (rewrite f0_def 1://= W16.of_uintK (pmod_small _ W16.modulus); first by rewrite (in_sub_trans _ 0 W16.modulus 0 (2^10)) 1:compress_rng 1..2://=).
        do (rewrite liftarrayvector 1..2:/# (mulzC 256 _) -divz_eq).
        do (rewrite unlift_compress_polyvec || rewrite (Array768.mapiE (fun x => compress 10 x) _ _) 1:/# //=).

    inline *; wp; skip; auto => />.
    move => &1 &2 p_lb p_ub pos_bound_a i_lb i_ub mem_diff mem_eq i_tub mem_all_eq />.
    do split; first 2 by move : i_lb i_tub => /#.
    + rewrite /touches /= => j j_bnds.
      do rewrite get_storesE size_to_list.
      do ((rewrite to_uint_small; first by move : i_tub i_lb; smt(@W64 @Int)) || (rewrite to_uintD_small; first by rewrite of_uintK; move : p_ub i_tub i_lb; smt(@W64 @Int))).
      have -> /=: !(to_uint rp{1} + (20 * i{2} + 16) <= to_uint rp{1} + j && to_uint rp{1} + j < to_uint rp{1} + (20 * i{2} + 16) + 4).
        rewrite mulzDr mulz1 in j_bnds.
        move : j_bnds => /#.
      have -> /=: !(to_uint rp{1} + 20 * i{2} <= to_uint rp{1} + j && to_uint rp{1} + j < to_uint rp{1} + 20 * i{2} + 16).
        rewrite mulzDr mulz1 in j_bnds.
        move : j_bnds => /#.
      rewrite /touches in mem_diff.
      rewrite mem_diff //=; first by move : j_bnds => /#.
    + move => k k_lb; rewrite (mulzDr 20 _ _) mulz1 => k_ub />.
      case (k < 20 * i{2}) => k_tub.
        rewrite /loadW8 get_storesE.
        rewrite to_uintD_small.
          rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
          move : p_ub k_tub i_tub => /#.
        rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
        have -> /=: !(to_uint rp{1} + (20 * i{2} + 16) <= to_uint rp{1} + k). by rewrite -ltzNge; move : k_tub => /#.
        rewrite get_storesE.
        rewrite to_uintD_small.
          rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
          move : p_ub k_tub i_tub => /#.
        rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
        have -> /=: !(to_uint rp{1} + 20 * i{2} <= to_uint rp{1} + k). by rewrite -ltzNge; move : k_tub => /#.
        rewrite /loadW8 in mem_eq.
        by rewrite mem_eq.
      move : k_tub; rewrite -lezNgt => k_tlb.
      case (k < 20 * i{2} + 16) => k_tub.
        rewrite /loadW8 get_storesE.
        rewrite to_uintD_small.
          rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
          move : p_ub k_tub i_tub => /#.
        rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
        have -> /=: !(to_uint rp{1} + (20 * i{2} + 16) <= to_uint rp{1} + k). by rewrite -ltzNge; move : k_tub => /#.
        rewrite get_storesE.
        rewrite to_uintD_small.
          rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
          move : p_ub k_tub i_tub => /#.
        rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
        have -> /=: (to_uint rp{1} + 20 * i{2} <= to_uint rp{1} + k). by move : k_tlb => /#.
        rewrite size_to_list.
        have -> /=: (to_uint rp{1} + k < to_uint rp{1} + 20 * i{2} + 16). by move : k_tub => /#.
        rewrite (_: to_uint rp{1} + k - (to_uint rp{1} + 20 * i{2}) = k %% 20). move : k_tlb k_tub k_ub => /#.
        move : (mem_all_eq k); rewrite k_lb k_ub ltzNge k_tlb /= k_tub /=.
        smt(@Array16 @List @Int).

        move : k_tub => -/lezNgt k_ttlb.
        rewrite /loadW8 get_storesE.
        rewrite to_uintD_small.
          rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
          move : p_ub k_ub k_tlb i_tub => /#.
        rewrite of_uintK (pmod_small _ W64.modulus) 1:/#.
        rewrite Array4.size_to_list.
        rewrite lez_add2l -(addzA (to_uint rp{1}) _ 4) ltz_add2l /=.
        rewrite k_ttlb k_ub /=.
        rewrite (_: to_uint rp{1} + k - (to_uint rp{1} + (20 * i{2} + 16)) = k %% 4). move : k_ttlb k_ub => /#.
        move : (mem_all_eq k). rewrite k_lb k_ub ltzNge k_tlb ltzNge k_ttlb /=.
        smt(@Array16 @Array4 @List @Int).

  skip; auto => />.
  move => &1 &2 _p_lb _p_ub pos_bound_a />.
    split; first by smt(@Logic).
  move => memL c i i_tlb i_lb i_ub />.
    have -> /=: i = 48. move : i_tlb i_ub => /#.
    rewrite /loadW8.
  move => mem_diff mem_eq />.
    rewrite /load_array960 Array960.tP => j jb.
    by rewrite initiE 1:jb /= mem_eq 1:jb.
qed.

lemma polyvec_compress_1_corr _a mem :
    equiv [ Mprevec.polyvec_compress_1 ~ EncDec_AVX2.encode10_opt_vec :
             pos_bound768_cxq a{1} 0 768 2 /\
             lift_vector a{1} = _a /\
             a{2} = compress_polyvec 10 _a /\
             Glob.mem{1} = mem
              ==>
             Glob.mem{1} = mem /\
             ={res}].
proof.
  proc.
  cfold{1} 12.
  seq 12 2 : (#{/~a{1}}pre /\
              lift_vector a{1} = _a /\
              pos_bound768_cxq a{1} 0 768 1 /\
              v{1} = Array16.init (fun i => W16.of_int 20159) /\
              v8{1} = Array16.init (fun i => W16.of_int (20159 * 2^3)) /\
              off{1} = Array16.init (fun i => W16.of_int (2^4 - 1)) /\
              shift1{1} = Array16.init (fun i => W16.of_int (2^12)) /\
              mask{1} = Array16.init (fun i => W16.of_int (2^10-1)) /\
              shift2{1} = Array16.init (fun i => W16.of_int (2 ^ ((i %% 2) * 10))) /\
              sllvdidx{1} = Array8.init (fun i => W32.of_int (((i + 1)%% 2) * 12)) /\
              shufbidx{1} = pvc_shufbidx_s /\
              ={i} /\ i{1} = 0).
  inline Ops.iVPBROADCAST_4u64 Ops.iVPBROADCAST_16u16 Ops.iVPSLL_16u16; wp.
  ecall {1} (polyvec_csubq_corr (lift_array768 a{1})).
  skip; auto => />.
  move => &1 pos_bound_a result a_eq_res pos_bound_res />.
  do split.
    + rewrite eq_vectorP => i ib.
      rewrite tP => k kb.
      rewrite liftarrayvector 1:ib 1:kb.
      rewrite -a_eq_res.
      by rewrite liftarrayvector 1:ib 1:kb.
    + by rewrite -ext_eq_all /all_eq //=.
    + by rewrite -ext_eq_all /all_eq //= shl_shlw 1://= shlMP 1://=.
    + by rewrite /f4u64_t16u16 -ext_eq_all /all_eq //=.
    + by rewrite /f4u64_t8u32 -ext_eq_all /all_eq //=.
  wp.
  while(#{/~mem}{~i{1}=0}pre /\ ={i} /\ 0 <= i{1} <= 48 /\
        forall k, 0 <= k < 20*i{1} => rp{1}.[k] = c{2}.[k]).
    seq 11 0: (#pre /\ forall k, 0 <= k < 16 => f0{1}.[k] = W16.of_int (compress 10 _a.[(16*i{1} + k) %/ 256].[(16*i{1} + k)%% 256])).
      inline *; wp; skip; auto => />.
      move => &1 &2 pos_bound_a i_lb i_ub rp_eq i_tub />.
      move => k k_lb k_ub.
      do (rewrite initiE 1://= /=).
      rewrite /round_scalew /= /truncateu16 /= /wmulhs.
      rewrite of_sintK /= /(W16.smod 20159) /=.
      rewrite of_sintK /= /(W16.smod 4096) /=.
      rewrite (W16.and_mod 10 _) 1://=.
      rewrite of_uintK (modz_dvd _ _ (2^10)) 1://=.
      rewrite liftarrayvector 1..2:/# (mulzC 256 _) -(divz_eq _ 256) mapiE 1:/# /=.
      rewrite /pos_bound768_cxq /bpos16 /= in pos_bound_a.
      (* rewrite compress_alt_nice. *)
      rewrite -compress_alt_compress_large /compress_alt_large /= qE.
      rewrite inFqK (pmod_small _ q) 1:pos_bound_a 1:/# /=.
      rewrite shl_shlw 1://= -(W16.to_uintK a{1}.[16 * i{2} + k]) shlMP 1://=.
      rewrite (W16.of_intM _ 30200) -W16.of_intD -W16.of_intS.
      rewrite /round.
      rewrite of_sintK (Montgomery16.smod_small (to_uint a{1}.[16 * i{2} + k] * 2 ^ 3)).
        rewrite -to_sint_unsigned; first by move : (pos_bound_a (16*i{2} + k)) => /#.
        move : (pos_bound_a (16*i{2} + k)) => /#.
      rewrite (W32.shr_shrw 14) 1://= -(W32.shlMP _ 12) 1://= W32.shlw_shrw_shrw 1://= /=.
      rewrite andmask_shrw 1://= (_: W32.masklsb (20 - 2) = W32.of_int (2 ^ 18 - 1)) 1://=.
      rewrite W32.and_mod 1://= -(W32.of_intD _ 1) shr_shrw 1://= (W32.shrDP _ 1) 1://=.
      rewrite of_uintK modz_dvd 1://= (pmod_small _ W32.modulus).
        pose tmp := W32.to_uint _. 
       move : (modz_cmp tmp (2^18 + 1)) => /#.
      rewrite (to_sint_unsigned a{1}.[16 * i{2} + k]); first by move : (pos_bound_a (16*i{2} + k)) => /#.
      pose ai := to_uint a{1}.[_].
      rewrite shrDP 1://=.
      pose t := W16.invw _ `&` _.
      have a_mul_ub: 0 <= to_sint ((W16.of_int (ai * 8 * 20159 %/ 65536))) <= 8192.
        rewrite to_sint_unsigned.
          rewrite of_sintK Montgomery16.smod_small.
            rewrite /ai -to_sint_unsigned; first by move : (pos_bound_a (16*i{2} + k)) => /#.
            move : (pos_bound_a (16*i{2} + k)) => /#.
          smt(W16.to_uint_cmp @W16).
        rewrite of_uintK /ai -to_sint_unsigned; first by move : (pos_bound_a (16*i{2} + k)) => /#.
        move : (pos_bound_a (16*i{2} + k)) => /#.
      have t_rng: 0 <= W16.to_sint (t `>>` (W8.of_int 15)) <= 8192.
          rewrite shr_shrw 1://= -to_uintK shrDP 1://=.
          rewrite to_sint_unsigned.
            rewrite of_sintK Montgomery16.smod_small.
              move : (W16.to_uint_cmp t) => /#.
            move : (W16.to_uint_cmp t) => /#.
          rewrite of_uintK.
          move : (W16.to_uint_cmp t) => /#.
      admit. (* FIXME *)
    seq 10 1: (#{~f0{1}}pre /\ forall k, 0 <= k < 20*i{1} + 20 => if 0 <= k < 20*i{1} then rp{1}.[k] = c{2}.[k]
                                                  else if (20*i{1} <= k < 20*i{1} + 16) then t0{1}.[k %% 20] = c{2}.[k]
                                                  else t1{1}.[k %% 4] = c{2}.[k]).
    inline *; wp; skip; auto => />.
    move => &1 &2 pos_bound_a i_lb i_ub rp_eq i_tub f0_def />.
    do split.
      move => k k_lb k_ub />.
      rewrite filliE 1:/# /= lezNgt k_ub //=.
      by apply rp_eq.

      move => k k_lb k_ub.
      rewrite filliE 1:/# /=.
      case (k < 20 * i{2}) => k_tub.
        rewrite lezNgt k_tub /= (rp_eq k) //=.
      move : k_tub => -/lezNgt k_tlb.
      have uint_fdef: forall j, 0 <= j < 16 => W16.to_sint f0{1}.[j] = W16.to_uint f0{1}.[j].
        move => j jb.
        rewrite (f0_def j jb).
        pose ai := (lift_vector a{1}).[_].[_].
        rewrite to_sint_unsigned; first by move : (sint_compress_rng ai 10) => />.
        done.
      have fdef_bnd: forall j, 0 <= j < 16 => 0 <= W16.to_uint f0{1}.[j] < 2^10.
        move => j jb.
        rewrite (f0_def j jb).
        pose ai := (lift_vector a{1}).[_].[_].
        rewrite W16.of_uintK (pmod_small _ W16.modulus); first by rewrite (in_sub_trans _ 0 W16.modulus 0 (2^10)) 1:compress_rng 1..2://=.
        by apply compress_rng.
      case (k < 20 * i{2} + 16) => k_tub.
        rewrite k_tlb k_ub /=.
        rewrite /int_bit //=.
        rewrite -(modz_dvd k 20 5) 1://=.
        pose ki := k %% 20.
        have rk_b: ki \in iota_ 0 16.
          rewrite mem_iota /ki.
          split; first by move : (modz_cmp k 20) => />.
          move : k_tub => /#.
        rewrite initiE /=; first by rewrite andabP -(mem_iota 0 16 ki).
        have -> /=: 0 <= ki %/ 2 && ki %/ 2 < 8. by move : ki rk_b; rewrite -List.allP -iotaredE //=.
        move : ki rk_b.
        rewrite -List.allP.
        rewrite -iotaredE //=.
        do (rewrite initiE 1://= /= || rewrite /f32u8_t16u16 initiE 1://= /=).
        have H: forall (l: W32.t Array8.t), W2u32.Pack.init ("_.[_]" l) = W2u32.Pack.init (fun j => l.[0 + j]); first by simplify.
        do rewrite compress_aux_1 1://=.
        do rewrite add0z.
        do rewrite H.
        do rewrite compress_aux_2 1..3://=.
        simplify; trivial.
        do (rewrite uint_fdef 1://=).
        do (rewrite compress_truncate1 || rewrite compress_truncate2 || rewrite compress_truncate3 1..4:fdef_bnd 1..4://= ||
            rewrite compress_truncate4 || rewrite compress_truncate5 1..2:fdef_bnd 1..2://=).
        do (rewrite f0_def 1://= W16.of_uintK (pmod_small _ W16.modulus); first by rewrite (in_sub_trans _ 0 W16.modulus 0 (2^10)) 1:compress_rng 1..2://=).
        do (rewrite liftarrayvector 1..2:/# (mulzC 256 _) -divz_eq).
        do (rewrite unlift_compress_polyvec || rewrite (Array768.mapiE (fun x => compress 10 x) _ _) 1:/# //=).

      move : k_tub => -/lezNgt k_tlb1 />.
        rewrite k_tlb k_ub /=.
        rewrite /int_bit //=.
        rewrite -(modz_dvd k 20 5) 1://=.
        pose ki := k %% 20.
        have rk_b: ki \in iota_ 16 4.
          rewrite mem_iota /ki.
          move : (modz_cmp k 20) k_tlb1 k_ub => /#.
        have ->: k %% 4 = ki - 16.
          move : k_tlb1 k_ub => /#.
        rewrite initiE /=; first by move : ki rk_b; rewrite -List.allP -iotaredE //=.
        move : ki rk_b.
        rewrite -List.allP.
        rewrite -iotaredE //=.
        do (rewrite initiE 1://= /= || rewrite /f32u8_t16u16 initiE 1://= /=).
        do rewrite compress_aux_1 1://=.
        do rewrite compress_aux_2 1..3://=.
        simplify; trivial.
        do (rewrite uint_fdef 1://=).
        rewrite compress_truncate2 compress_truncate3 1..4:fdef_bnd 1..4://= compress_truncate4 compress_truncate5 1..2:fdef_bnd 1..2://=.
        do (rewrite f0_def 1://= W16.of_uintK (pmod_small _ W16.modulus); first by rewrite (in_sub_trans _ 0 W16.modulus 0 (2^10)) 1:compress_rng 1..2://=).
        do (rewrite liftarrayvector 1..2:/# (mulzC 256 _) -divz_eq).
        do (rewrite unlift_compress_polyvec || rewrite (Array768.mapiE (fun x => compress 10 x) _ _) 1:/# //=).

    inline *; wp; skip; auto => />.
    move => &1 &2 pos_bound_a i_lb i_ub rp_eq i_tub rp_all_eq />.
    do split; first 2 by move : i_lb i_tub => /#.
    + move => k.
      rewrite (mulzDr 20 i{2} 1) mulz1 => k_lb k_ub.
      rewrite filliE 1:/# filliE 1:/# //=.
      case (k < 20 * i{2}) => k_tub.
        have ->: !(20 * i{2} + 16 <= k). by rewrite -ltzNge; move : k_tub => /#.
        rewrite lezNgt k_tub //= (rp_eq k) //=.
      move : k_tub; rewrite -lezNgt => k_tlb.
      case (k < 20 * i{2} + 16) => k_tub.
        rewrite lezNgt k_tub k_tlb //=.
        move : (rp_all_eq k); rewrite k_lb k_ub ltzNge k_tlb /= k_tub //=.

        move : k_tub => -/lezNgt k_ttlb.
        rewrite k_ttlb k_ub /=.
        rewrite initiE 1:modz_cmp //=.
        move : (rp_all_eq k); rewrite k_lb k_ub ltzNge k_tlb ltzNge k_ttlb /= => />.

  skip; auto => />.
  move => &1 &2 pos_bound_a />.
    split; first by smt(@Logic).
  move => rpL c i i_tlb i_lb i_ub />.
    have -> /=: i = 48. move : i_tlb i_ub => /#.
    apply Array960.ext_eq.
qed.

lemma decompress_aux_1 (x: W32.t):
  ((x `<<<` 4 \bits16 0) `>>` ru_ones_s) `&` (W16.of_int 8184)
  = W16.of_int ((to_uint (x \bits8 0) + (to_uint (x \bits8 1)) %% 4 * 2^8)) `&` (W16.of_int 1023) `<<<` 3.
proof.
  apply W16.wordP => i ib.
    rewrite /(`>>`) andwE shrwE //= of_intwE /int_bit //= ib => />.
    rewrite of_intD bits8_div 1://= of_uintK bits8_div 1://= of_uintK -of_intD.
    rewrite modz_dvd 1://=.
    rewrite of_intwE of_intwE /int_bit //=.
    move : ib; rewrite andabP -(mem_iota 0 16 i).
    move : i; rewrite -List.allP -iotaredE //=.
      do split; first 10 by rewrite get_to_uint => /> /#.
qed.

lemma decompress_aux_2 (x: W32.t):
  ((x `<<<` 0 \bits16 0) `>>` ru_ones_s) `&` (W16.of_int 8184)
  = W16.of_int (to_uint (x \bits8 0) %/ 16 + (to_uint (x \bits8 1)) %% 64 * 2^4) `&` (W16.of_int 1023) `<<<` 3.
proof.
  apply W16.wordP => i ib.
    rewrite /(`>>`) andwE shrwE //= of_intwE /int_bit //= ib => />.
    rewrite of_intD bits8_div 1://= of_uintK bits8_div 1://= of_uintK -of_intD.
    rewrite modz_dvd 1://=.
    rewrite (modz_pow2_div 8 4 _) 1://= //=.
    rewrite of_intwE of_intwE /int_bit //=.
    move : ib; rewrite andabP -(mem_iota 0 16 i).
    move : i; rewrite -List.allP -iotaredE //=.
      (* n.b.: w/o the following rewrites EC pattern matching doesn't  allow modz_pow2_div to be used *)
      rewrite (_: 4 = 2^2) 1://= (_: 8 = 2^3) 1://= (_: 16 = 2^4) 1://= (_: 32 = 2^5) 1://= (_: 64 = 2^6) 1://=.
      rewrite (_: 128 = 2^7) 1://= (_: 256 = 2^8) 1://= (_: 512 = 2^9) 1://=.
      do (rewrite (modz_pow2_div 16 _ _) 1://= || rewrite modz_dvd 1://=).
      do split; first 10 by rewrite get_to_uint //= => /#.
qed.

lemma decompress_aux_3 (x: W32.t):
  ((x `<<<` 4 \bits16 1) `>>` ru_ones_s) `&` (W16.of_int 32736)
  = W16.of_int ((to_uint (x \bits8 2) %/ 4 + (to_uint (x \bits8 3)) %% 16 * 2^6)) `&` (W16.of_int 1023) `<<<` 5.
proof.
  apply W16.wordP => i ib.
    rewrite /(`>>`) andwE shrwE shlwE //= of_intwE /int_bit //= ib => />.
    rewrite of_intD bits8_div 1://= of_uintK bits8_div 1://= of_uintK -of_intD.
    rewrite (pmod_small (_ %/ (2^24)) W8.modulus); first by move : (W32.to_uint_cmp x) => /#.
    rewrite (modz_pow2_div 8 2) 1://= -divzMr 1..2://= /=.
    rewrite of_intwE of_intwE /int_bit //=.
    move : ib; rewrite andabP -(mem_iota 0 16 i).
    move : i; rewrite -List.allP -iotaredE //=.
      do split; first 10 by rewrite get_to_uint => /> /#.
qed.

lemma decompress_aux_4 (x: W32.t):
  ((x `<<<` 0 \bits16 1) `>>` ru_ones_s) `&` (W16.of_int 32736)
  = W16.of_int (to_uint (x \bits8 2) %/ 64 + (to_uint (x \bits8 3)) * 2^2) `&` (W16.of_int 1023) `<<<` 5.
proof.
  apply W16.wordP => i ib.
    rewrite /(`>>`) andwE shrwE //= of_intwE /int_bit //= ib => />.
    rewrite of_intD bits8_div 1://= of_uintK bits8_div 1://= of_uintK -of_intD.
    rewrite (pmod_small (_ %/ (2^24)) W8.modulus); first by move : (W32.to_uint_cmp x) => /#.
    rewrite (modz_pow2_div 8 6) 1://= -divzMr 1..2://= /=.
    rewrite of_intwE of_intwE /int_bit //=.
    move : ib; rewrite andabP -(mem_iota 0 16 i).
    move : i; rewrite -List.allP -iotaredE //=.
      do split; first 10 by rewrite get_to_uint => /> /#.
qed.

lemma decompress_decode (i j x y: int):
  0 <= i < 2 =>
  0 <= j < 2 =>
  j = (i + 1) %% 2 =>
  0 <= x + y < 1024 =>
  W16.to_sint
   (round_scalew
      (W16.to_sint (W16.of_int (x + y) `&` pvc_mask_s `<<<` (3 + 2*i)) *
       (3329*2^(2*j)))) =
  ((x + y) * 3329 + 2 ^ (10 - 1)) %/ 2 ^ 10.
proof.
  move => ib jb -> s_bnd.
  rewrite /round_scalew //= /to_sint to_uint_truncateu16.
  rewrite (W16.and_mod 10 _) 1://= //= of_uintK (modz_dvd _ W16.modulus 1024) 1://=.
  rewrite shlMP 1:/# of_uintK.
  rewrite (Montgomery16.smod_small (_ * 2^(3 + 2*i))).
    move : (modz_cmp (x+y) 1024) => />.
    move : ib; rewrite andabP => /(mem_iota 0 2 i).
    move : i; rewrite -List.allP -iotaredE //=.
    smt(@Int @Ring.IntID @IntDiv).
  rewrite shr_shrw 1://= shr_shrw 1://= shrDP 1://=.
  rewrite -W32.of_intD.
  rewrite (pmod_small _ W32.modulus).
    move : (modz_cmp (x+y) 1024) => />.
    move : ib; rewrite andabP => /(mem_iota 0 2 i).
    move : i; rewrite -List.allP -iotaredE //=.
    smt(@Int @Ring.IntID @IntDiv).
  rewrite (mulzC 3329 (2^(2 * ((i + 1) %% 2)))) (mulzA _ (2^(3 + 2*i)) _) -(mulzA (2^(3 + 2*i)) _ 3329).
  rewrite -(Ring.IntID.exprD_nneg 2 _ _) 1..2:/# (mulzC _ 3329) -mulzA.
  have ->: 2 ^ (3 + 2 * i + 2 * ((i + 1) %% 2)) = 2^5.
    move : ib; rewrite andabP => /(mem_iota 0 2 i).
    move : i; rewrite -List.allP -iotaredE //=.
  rewrite (_: 2^14 = 2^9 * 2^5) 1://= (divzMpr (2^5) _ _) 1://=.
  rewrite (addzC _ 1) -(divzMDr 1 _ 512) 1://= mul1z shrDP 1://=.
  rewrite (pmod_small _ W32.modulus); first by smt(modz_cmp).
  rewrite -divz_mulp 1..2://= //= of_uintK modz_dvd 1://=.
  rewrite Montgomery16.smod_small; first by smt(modz_cmp).
  rewrite (pmod_small _ 1024) 1:s_bnd.
  reflexivity.
qed.

lemma decompress_bnds (i j x y: int):
  0 <= i < 2 =>
  0 <= j < 2 =>
  j = (i + 1) %% 2 =>
  0 <= x + y < 1024 =>
  0 <= W16.to_sint
         (round_scalew
            (W16.to_sint (W16.of_int (x + y) `&` pvc_mask_s `<<<` (3 + 2*i)) *
             (3329*2^(2*j)))) /\
       W16.to_sint
         (round_scalew
            (W16.to_sint (W16.of_int (x + y) `&` pvc_mask_s `<<<` (3 + 2*i)) *
             (3329*2^(2*j)))) < 3329.
proof.
  move => ib jb j_eq_i s_bnd.
  rewrite decompress_decode 1..4://=.
  smt(modz_cmp @Int @Ring.IntID).
qed.

lemma polyvec_decompress_corr mem _p (_a : W8.t Array960.t): 
    equiv [ Mprevec.polyvec_decompress ~ EncDec_AVX2.decode10_opt_vec :
             valid_ptr _p 960 /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p /\
             load_array960 Glob.mem{1} _p = _a /\ u{2} = _a
              ==>
             Glob.mem{1} = mem /\
             lift_vector res{1} = decompress_polyvec 10 res{2} /\
             pos_bound768_cxq res{1} 0 768 1].
proof.
  proc.
  seq 9 2 : (#pre /\
             q{1} = Array16.init (fun i => if (i %% 2 = 0) then W16.of_int (4 * 3329) else  W16.of_int 3329)/\
             shufbidx{1} = pvd_shufbdidx_s /\
             sllvdidx{1} = Array8.init (fun i => if (i %% 2 = 0) then W32.of_int 4 else W32.zero) /\
             mask{1} = Array16.init (fun i => if (i %% 2 = 0) then W16.of_int (2^13 - 2^3) else W16.of_int (2^15 - 2^5)) /\
             ={k} /\ k{1} = 0).
    inline Ops.iVPBROADCAST_4u64 Ops.iVPBROADCAST_8u32; wp.
    skip; auto => />.
    move => &1 rp_lb rp_ub />.
    do split.
      + by rewrite /f8u32_t16u16 -ext_eq_all /all_eq //=.
      + by rewrite /f4u64_t8u32 -ext_eq_all /all_eq //=.
      + by rewrite /f8u32_t16u16 -ext_eq_all /all_eq //=.
  while(#{~k{1}=0}pre /\ 0 <= k{1} <= 3 /\
        (forall j, 0 <= j < 256 * k{1} => inFq (to_sint r{1}.[j]) = decompress 10 c{2}.[j]) /\
        (forall j, 0 <= j < 256 * k{1} => bpos16 r{1}.[j] q)).
    sp; elim * => k c2; wp.
    while {1} (#{~i{1}=0}pre /\ 0 <= i{1} <= 16 /\
               (forall j, 0 <= j < 256 * k{1} + 16 * i{1} => inFq (to_sint r{1}.[j]) = decompress 10 c{2}.[j]) /\
               (forall j, 0 <= j < 256 * k{1} + 16 * i{1} => bpos16 r{1}.[j] q)) (16 - i{1}).
      move => &m z.

      inline *; auto => />.
      move => &1 [#] rp_lb rp_ub k_lb k_ub r_def r_bnd k_tub i_lb i_ub r_ndef r_nbnd i_tub />.
      do split.
      + move => j j_lb j_ub.
        rewrite filliE 1:/# /=.
        have -> /=: !(256 * k + 16 * i{1} <= j). move : j_ub i_lb i_ub => /#.
        rewrite (r_def j) 1:// //=.
      + move => j j_lb j_ub.
        rewrite filliE 1:/# /=.
        have -> /=: !(256 * k + 16 * i{1} <= j). move : j_ub i_lb i_ub => /#.
        move : (r_bnd j) => /#.
      + move : i_lb => /#.
      + move : i_tub => /#.
      + rewrite (mulzDr 16) mulz1 addzA.
        move => j j_lb j_ub.
        rewrite filliE 1:/# /=.
        case (j < 256 * k + 16 * i{1}) => j_tub.
          have -> /=: !(256 * k + 16 * i{1} <= j). move : j_tub i_lb i_ub => /#.
          rewrite (r_ndef j) 1://= => /#.
        move : j_tub => -/lezNgt j_tlb.
          move : r_ndef => _.
          rewrite j_tlb j_ub.
          rewrite filliE 1:/# /=.
          have -> /=: (256 * k <= j && j < 256 * k + 256). move : j_tlb j_ub => /#.
          rewrite -(modz_dvd j 16 4) 1://=.
          have ->: j %/ 4 = 64 * k + 4 * i{1} + j %% 16 %/ 4.
            move : j_tlb j_ub => /#.
          pose ji := j %% 16.
          have r_jb: ji \in iota_ 0 16.
            rewrite mem_iota /ji.
            move : (modz_cmp j 16) => />.
          move : ji r_jb.
          rewrite -List.allP.
          rewrite -iotaredE //=.
          rewrite /f8u32_t16u16 /f32u8_t8u32.
          do (rewrite Array16.initiE 1://= /= || rewrite Array32.initiE 1://= /= || rewrite Array8.initiE 1://= /=).
          do (rewrite decompress_aux_1 || rewrite decompress_aux_2 || rewrite decompress_aux_3 || rewrite decompress_aux_4).
          do (rewrite W4u8.pack4bE 1://= || rewrite initiE 1:/# //=).
          rewrite /loadW8.
          do (rewrite to_uintD_small; first by rewrite of_uintK; move : rp_lb rp_ub k_lb k_ub => /#).
          rewrite of_uintK (pmod_small _ W64.modulus); first by move : k_lb k_ub => /#.
          do (rewrite (mulzDr 5 _ _) -(mulzA 5 _ _) -(mulzA 5 _ _) -(addzA (320 * k) (20 * i{1}) _) //=).
          do (rewrite -decompress_alt_decompress 1..2://= /decompress_alt /= qE).
          do (rewrite (W16.of_sintK 3329) Montgomery16.smod_small 1://= (_: 3329 = 3329 * 2^(2*0)) 1://=).
          do (rewrite (W16.of_sintK 13316) Montgomery16.smod_small 1://= (_: 13316 = 3329 * 2^(2*1)) 1://=).
          have H1: forall (x y: W8.t), 0 <= to_uint x + to_uint y %% 4 * 256 < 1024.
            move => x y.
            move : (W8.to_uint_cmp x) (modz_cmp (to_uint y) 4) => /#.
          have H2: forall (x y: W8.t), 0 <= to_uint x %/ 4 + to_uint y %% 16 * 64 < 1024.
            move => x y.
            move : (W8.to_uint_cmp x) (modz_cmp (to_uint y) 16) => /#.
          have H3: forall (x y: W8.t), 0 <= to_uint x %/ 16 + to_uint y %% 64 * 16 < 1024.
            move => x y.
            move : (W8.to_uint_cmp x) (modz_cmp (to_uint y) 64) => /#.
          have H4: forall (x y: W8.t), 0 <= to_uint x %/ 64 + to_uint y * 4 < 1024.
            move => x y.
            move : (W8.to_uint_cmp x) (W8.to_uint_cmp y) => /#.
          rewrite (_: 3 = 3 + 2*0) 1://=.
          rewrite (_: 5 = 3 + 2*1) 1://=.
          do (rewrite decompress_decode 1..3://= 1:/#).
          smt(@Int).
      + rewrite (mulzDr 16) mulz1 addzA.
        move => j j_lb j_ub.
        rewrite filliE 1:/# /=.
        case (j < 256 * k + 16 * i{1}) => j_tub.
          have -> /=: !(256 * k + 16 * i{1} <= j). move : j_tub i_lb i_ub => /#.
          move : (r_nbnd j) => /= /#.
        move : j_tub => -/lezNgt j_tlb.
          move : r_ndef => _.
          rewrite j_tlb j_ub.
          pose ji := j %% 16.
          have r_jb /=: ji \in iota_ 0 16.
            rewrite mem_iota /ji.
            move : (modz_cmp j 16) => />.
          move : ji r_jb.
          rewrite -List.allP.
          rewrite -iotaredE //=.
          rewrite /f8u32_t16u16 /f32u8_t8u32.
          do (rewrite Array16.initiE 1://= /= || rewrite Array32.initiE 1://= /= || rewrite Array8.initiE 1://= /=).
          do (rewrite decompress_aux_1 || rewrite decompress_aux_2 || rewrite decompress_aux_3 || rewrite decompress_aux_4).
          do (rewrite W4u8.pack4bE 1://= || rewrite initiE 1:/# //=).
          rewrite /loadW8.
          do (rewrite to_uintD_small; first by rewrite of_uintK; move : rp_lb rp_ub k_lb k_ub => /#).
          rewrite of_uintK (pmod_small _ W64.modulus); first by move : k_lb k_ub => /#.
          do (rewrite (W16.of_sintK 3329) Montgomery16.smod_small 1://= (_: 3329 = 3329 * 2^(2*0)) 1://=).
          do (rewrite (W16.of_sintK 13316) Montgomery16.smod_small 1://= (_: 13316 = 3329 * 2^(2*1)) 1://=).
          have H1: forall (x y: W8.t), 0 <= to_uint x + to_uint y %% 4 * 256 < 1024.
            move => x y.
            move : (W8.to_uint_cmp x) (modz_cmp (to_uint y) 4) => /#.
          have H2: forall (x y: W8.t), 0 <= to_uint x %/ 4 + to_uint y %% 16 * 64 < 1024.
            move => x y.
            move : (W8.to_uint_cmp x) (modz_cmp (to_uint y) 16) => /#.
          have H3: forall (x y: W8.t), 0 <= to_uint x %/ 16 + to_uint y %% 64 * 16 < 1024.
            move => x y.
            move : (W8.to_uint_cmp x) (modz_cmp (to_uint y) 64) => /#.
          have H4: forall (x y: W8.t), 0 <= to_uint x %/ 64 + to_uint y * 4 < 1024.
            move => x y.
            move : (W8.to_uint_cmp x) (W8.to_uint_cmp y) => /#.
          rewrite (_: 3 = 3 + 2*0) 1://=.
          rewrite (_: 5 = 3 + 2*1) 1://=.
          rewrite qE.
          do (rewrite -(and_impr (0 <= _) (_ < 3329)) decompress_bnds 1..3://= 1:/#).
          trivial.
        smt(@Int).
    skip; auto => />.
    move => &1 [#] rp_lb rp_ub k_lb k_ub r_def r_bnds k_tub />.
    split.
      move => j j_lb j_ub; rewrite filliE 1:/#.
      have -> /=: !(256 * k <= j). move : j_ub => /#.
      rewrite (r_def j) => />.
    move => [#] iL rL.
      split.
      move => [#] rL_def rl_bnds iL_lb iL_ub rL_ndef rL_nbnd iL_tlb.
      move : iL_tlb => /#.
    move => [#] iL_tlb rL_def rl_bnds iL_lb iL_ub.
    have -> /=: iL = 16.
      move : iL_tlb iL_ub => /#.
    move => rL_ndef rL_nbnd.
    do split; first 2 by move : k_lb k_tub => /#.
      + move => j; rewrite mulzDr mulz1 => j_lb j_ub.
        rewrite (rL_ndef j) 1..2://=.
      + move => j; rewrite mulzDr mulz1 => j_lb j_ub.
        rewrite -and_impr -andabP (rL_nbnd j) //=.
    skip; auto => />.
    move => &1 &2 rp_lb rp_ub.
    split.
      smt(@Logic).
    move => r c k k_tlb _ k_lb k_ub.
    have -> /=: k = 3. move : k_tlb k_ub => /#.
    move => r_def r_bnds.
    split.
    + rewrite eq_vectorP => i ib.
      rewrite tP => j jb.
      rewrite liftarrayvector 1:ib 1:jb.
      rewrite /decompress_polyvec mapiE 1:/# /=.
      rewrite KMatrix.Vector.offunvE 1:ib /= mapiE 1:jb /subarray256 initiE 1:/# /=.
      by rewrite (r_def (256 * i + j)); first by move : ib jb => /#.
    + apply r_bnds.
qed.


lemma polyvec_reduce_corr_h _a:
  hoare[Mprevec.polyvec_reduce:
       _a  = lift_array768 r ==>
       _a  = lift_array768 res /\
       forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)].
proof. 
  proc; sp.
  wp.
  ecall (KyberPolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[2 * 256 + i])))).
  wp.
  ecall (KyberPolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[256 + i])))).
  wp.
  ecall (KyberPolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[i])))).
  wp. skip.
  move => &hr _a_def.
  split; first by trivial.
  move => r_eq_r_1 res1 [r_eq_res1 res1_bound] res1_def res2 [r_eq_res2 res2_bound] res2_def res3 [r_eq_res3 res3_bound] res3_def.
  split.
  rewrite /res3_def /res2_def /res1_def /=.
  rewrite _a_def.
  rewrite /lift_array768 tP => k kb.
  rewrite !mapiE //=.
  do rewrite initiE 1:/# //=.
  do rewrite fun_if.
   case (512 <= k < 768) => k_si.
   rewrite /lift_array256 tP in r_eq_res3; move : (r_eq_res3 (k - 512) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.
   case (256 <= k < 512) => k_ssi.
   rewrite /lift_array256 tP in r_eq_res2; move : (r_eq_res2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=. smt(). smt(). 
   case (256 <= k < 512) => k_ssi.
   rewrite /lift_array256 tP in r_eq_res2; move : (r_eq_res2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=. smt().  
   rewrite /lift_array256 tP in r_eq_res1; move : (r_eq_res1 (k) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.   
   move => k k_i.
   do rewrite initiE //=.
   rewrite /bpos16 //=in res3_bound.
   rewrite /bpos16 //=in res2_bound.
   rewrite /bpos16 //=in res1_bound.
   move : (res3_bound (k - 512))  (res2_bound (k - 256))  (res1_bound k).
   smt(@Array256 @Array768).

qed.

lemma polyvec_reduce_ll : islossless Mprevec.polyvec_reduce
  by proc; do 3!(wp; call KyberPolyAVX.poly_reduce_ll).

lemma polvec_reduce_corr _a:
      phoare[Mprevec.polyvec_reduce:
       _a  = lift_array768 r ==>
       _a  = lift_array768 res /\
       forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)] = 1%r.
  conseq (polyvec_reduce_ll) (polyvec_reduce_corr_h _a).
  by smt().
qed.


lemma polyvec_frombytes_corr mem _p:
    equiv [ Mprevec.polyvec_frombytes ~ EncDec_AVX2.decode12_opt_vec :
             valid_ptr _p (3*384) /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array1152 Glob.mem{1} _p = a{2}
              ==>
             map W16.to_sint res{1} = (nttunpackv res{2})  /\
             pos_bound768_cxq res{1} 0 768  2 /\
             Glob.mem{1} = mem ].
proof.
  proc => /=.
  wp; ecall (KyberPolyAVX.poly_frombytes_corr Glob.mem{1} (to_uint pp{1}) (KyberPolyAVX.load_array384 Glob.mem{1} (_p + 768))).
  wp; ecall (KyberPolyAVX.poly_frombytes_corr Glob.mem{1} (to_uint pp{1}) (KyberPolyAVX.load_array384 Glob.mem{1} (_p + 384))).
  wp; ecall (KyberPolyAVX.poly_frombytes_corr Glob.mem{1} (to_uint pp{1}) (KyberPolyAVX.load_array384 Glob.mem{1} (_p))).
  auto => /> &1.
  rewrite /pos_bound768_cxq /pos_bound256_cxq /load_array384 /load_array1152 /subarray384 /lift_array768 /fromarray256 !tP.
  move => pbl pbh.
  split; 1: by  smt(Array384.initiE Array1152.initiE).

  move => *;split; 1: by rewrite to_uintD_small /=;  smt(Array384.initiE Array1152.initiE).
  move => *;split; 1: by rewrite to_uintD_small /=;  smt(Array384.initiE Array1152.initiE).
  move => *;split.
  + rewrite tP => k kb.
    rewrite !mapiE //= !initiE  //= initiE //=.
    case ( 512 <= k && k < 768).
    + move => kbb; rewrite (_: 0<= k <256 = false) 1:/# /= (_: 256<= k <512 = false) 1:/# /=.
      rewrite /subarray256 => />.
      rewrite  /nttunpack initiE 1:/# //= initiE 1:(nttunpack_inbounds (k-512)) 1:/# /=.
      rewrite Array768.initiE /=; first by move : (nttunpack_inbounds (k-512)) => /#.
      have ->: !(0 <= 512 + nttunpack_idx.[k - 512] && 512 + nttunpack_idx.[k - 512] < 256). move : nttunpack_inbounds => /#.
      have -> /=: !(256 <= 512 + nttunpack_idx.[k - 512] && 512 + nttunpack_idx.[k - 512] < 512). move : nttunpack_inbounds => /#.
      rewrite mapiE 1:(nttunpack_inbounds (k-512)) 1:/# /nttpack initiE 1:(nttunpack_inbounds (k-512)) 1:/# /=.
      move : nttpack_idxK; rewrite allP /= => ->. rewrite mem_iota -andabP; move : kbb kb => /#. trivial.
    case ( 256 <= k && k < 512).
    + move => kbb nkbb; rewrite (_: 0<= k <256 = false) 1:/# /=.
      rewrite /subarray256 => />.
      rewrite  /nttunpack initiE 1:/# //= initiE 1:(nttunpack_inbounds (k-256)) 1:/# /=.
      rewrite Array768.initiE /=; first by move : (nttunpack_inbounds (k-256)) => /#.
      have ->: !(0 <= 256 + nttunpack_idx.[k - 256] && 256 + nttunpack_idx.[k - 256] < 256). move : nttunpack_inbounds => /#.
      have -> /=: (256 <= 256 + nttunpack_idx.[k - 256] && 256 + nttunpack_idx.[k - 256] < 512). move : nttunpack_inbounds => /#.
      rewrite mapiE 1:(nttunpack_inbounds (k-256)) 1:/# /nttpack initiE 1:(nttunpack_inbounds (k-256)) 1:/# /=.
      move : nttpack_idxK; rewrite allP /= => ->. rewrite mem_iota -andabP; move : kbb kb => /#. trivial.
    + move => nkbb nkbbb; rewrite initiE 1:/# (_: 0<= k < 256 = true) 1:/# /= (_: 0<= k < 256 = true) 1:/# /=.
      rewrite /subarray256 => />.
      rewrite  /nttunpack initiE 1:/# //= initiE 1:(nttunpack_inbounds k) 1:/# /=.
      rewrite Array768.initiE /=; first by move : (nttunpack_inbounds k) => /#.
      rewrite (nttunpack_inbounds k) 1:/# /=.
      rewrite mapiE 1:(nttunpack_inbounds k) 1:/# /nttpack initiE 1:(nttunpack_inbounds k) 1:/# /=.
      move : nttpack_idxK; rewrite allP /= => ->. rewrite mem_iota -andabP; move : nkbb nkbbb kb => /#. trivial.
     
  move => k kb; rewrite initiE 1:/# /=.
  case ( 512 <= k && k < 768);1: by smt(). 
  case ( 256 <= k && k < 512). 
  + by move => kbb; rewrite (_: 512<= k <768 = false) 1:/# /= initiE /#.
  by move => kbb nkbb; rewrite !initiE 1:/# /= kbb /= !initiE /#.
qed.

lemma polyvec_frombytes_equiv :
    equiv [ Jkem_avx2.M.__polyvec_frombytes ~ Jkem.M.__polyvec_frombytes :
             valid_ptr (W64.to_uint ap{1}) (3*384) /\
             ={Glob.mem,ap} ==>
             lift_array768 res{1} = nttunpackv (lift_array768 res{2}) /\
             pos_bound768_cxq res{1} 0 768 2 /\
             pos_bound768_cxq res{2} 0 768 2 ].
proof.
  transitivity Mprevec.polyvec_frombytes
                   (valid_ptr (W64.to_uint ap{1}) 1152 /\ ={ap, Glob.mem} ==> ={res})
                   (valid_ptr (W64.to_uint ap{1}) 1152 /\ ={Glob.mem, ap} ==>
                    lift_array768 res{1} = nttunpackv (lift_array768 res{2}) /\
                    pos_bound768_cxq res{1} 0 768 2 /\
                    pos_bound768_cxq res{2} 0 768 2); first 2 by smt().
    + symmetry. proc * => /=. call prevec_eq_polyvec_frombytes => //=.
  transitivity EncDec_AVX2.decode12_opt_vec
               (valid_ptr (to_uint ap{1}) (3*384) /\ ={Glob.mem} /\ load_array1152 Glob.mem{1} (to_uint ap{1}) = a{2} ==>
                map W16.to_sint res{1} = (nttunpackv res{2})  /\
                pos_bound768_cxq res{1} 0 768 2 /\
                ={Glob.mem})
               (valid_ptr (to_uint ap{2}) (3*384) /\ ={Glob.mem} /\ load_array1152 Glob.mem{2} (to_uint ap{2}) = a{1} ==>
                res{1} = map W16.to_sint res{2} /\
                pos_bound768_cxq res{2} 0 768 2 /\
                ={Glob.mem}).
               auto => &1 &2 [#] ap_b -> <- />.
                 exists Glob.mem{2}.
                   exists (load_array1152 Glob.mem{2} (to_uint ap{1})).
                     + auto => />.
               auto => &1 &2 &m [#] H0 H1 H2 [#] H3 H4 H5 />.
                 rewrite nttunpackv_lift /lift_array768 Array768.tP => i i_bnds.
                 rewrite mapiE 1:i_bnds /= mapiE 1:i_bnds /=. congr.
                 rewrite -mapiE 1:i_bnds -(Array768.mapiE W16.to_sint _) 1:i_bnds.
                 move : i i_bnds. rewrite -tP.
                 rewrite H0 H3.
                 rewrite nttunpackv_mapsint //=.
    + proc * => /=.
      ecall (polyvec_frombytes_corr (Glob.mem{1}) (to_uint ap{1})) => //=.
  symmetry.
  transitivity EncDec.decode12_vec
               (valid_ptr (to_uint ap{1}) (3*384) /\ ={Glob.mem} /\ load_array1152 Glob.mem{1} (to_uint ap{1}) = a{2} ==>
                map W16.to_sint res{1} = res{2}  /\
                pos_bound768_cxq res{1} 0 768 2 /\
                ={Glob.mem})
                (={Glob.mem} /\ a{1} = a{2} ==>
                res{1} = res{2} /\
                ={Glob.mem}).
               auto => &1 &2 [#] ap_bnds mem_eq load_def />.
               exists Glob.mem{1}.
               exists (load_array1152 Glob.mem{1} (to_uint ap{1})).
               split.
                 trivial.
                 by rewrite mem_eq load_def.
               auto => />.
    + proc * => /=.
      ecall (KyberPolyVec.polyvec_frombytes_corr (Glob.mem{1}) (to_uint ap{1})) => //=.
  symmetry.
  proc * => /=.
  call decode12_opt_vec_corr.
  auto => />.
qed.

lemma polyvec_tobytes_corr mem _p _a:
    equiv [ Mprevec.polyvec_tobytes ~ EncDec_AVX2.encode12_opt_vec :
            pos_bound768_cxq a{1} 0 768 2 /\
            lift_array768 (nttpackv a{1}) = _a /\
            (forall i, 0<=i<768 => 0 <= a{2}.[i] <q) /\
            map inFq a{2} = _a /\  valid_ptr _p (3*384) /\
            Glob.mem{1} = mem /\ to_uint rp{1} = _p
             ==>
            touches mem Glob.mem{1} _p (3*384) /\
            load_array1152 Glob.mem{1} _p = res{2}
            ].
proof.
  proc => /=.
  wp;ecall (KyberPolyAVX.poly_tobytes_corr (lift_array256 (nttpack (Array256.init (fun (i : int) => a{1}.[2 * 256 + i])))) (to_uint pp{1}) Glob.mem{1}).
  wp;ecall (KyberPolyAVX.poly_tobytes_corr (lift_array256 (nttpack (Array256.init (fun (i : int) => a{1}.[256 + i])))) (to_uint pp{1}) Glob.mem{1}).
  wp;ecall (KyberPolyAVX.poly_tobytes_corr (lift_array256 (nttpack (Array256.init (fun (i : int) => a{1}.[i])))) (to_uint pp{1}) Glob.mem{1}).

  auto => /> &1 &2; rewrite /pos_bound768_cxq /pos_bound256_cxq /lift_array256 /lift_array768 /subarray256 !tP.
  move => bnda1 bnda2 vals pbl pbh.

  split.
  + do split; 1,2: by move => *; rewrite initiE /=; smt().
    + move => i ib; rewrite !mapiE // !initiE //=. move : (vals i); rewrite mapiE 1:/# mapiE 1:/# /=.
      have -> /=: (0 <= i < 768). by move : ib => /#.
      move => ->.
      rewrite /nttpackv initiE 1:/# /= ib /= /subarray256 //=.
    + move : pbh => /#.

  rewrite /touches;move => ????????touch0; split.

  + do split; 1: by  move => *; rewrite !initiE 1:/# /= !initiE  /#.
    + by move => *; rewrite initiE /=; smt().
    + rewrite tP => i ib; rewrite !mapiE // !initiE //=.
      move : (vals (256 + i)); rewrite mapiE 1:/# mapiE 1:/# /=.
      have -> /=: (0 <= 256 + i < 768). by move : ib => /#.
      move => ->.
      rewrite /nttpackv initiE 1:/# /=.
      have ->: !(0 <= 256 + i && 256 + i < 256). by move : ib => /#.
      have -> /=: (256 <= 256 + i && 256 + i < 512). by move : ib => /#.
      congr. congr. move : i ib; rewrite -tP. rewrite pack_ext_eq tP => i ib.
      rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
      have -> //=: !(0 <= 256 + i && 256 + i < 256). by move : ib => /#.
    + by rewrite to_uintD_small; smt().
    by rewrite to_uintD_small; smt().

  rewrite /touches;move => ????????touch1; split. 

  + do split; 1: by move => *; rewrite !initiE 1:/# /= !initiE 1:/# /= !initiE  /=  /#.
    + by move => *; rewrite initiE /=; smt().
    + rewrite tP => i ib; rewrite !mapiE // !initiE //=.
      move : (vals (512 + i)); rewrite mapiE 1:/# mapiE 1:/# /=.
      have -> /=: (0 <= 512 + i < 768). by move : ib => /#.
      move => ->.
      rewrite /nttpackv initiE 1:/# /=.
      have ->: !(0 <= 512 + i && 512 + i < 256). by move : ib => /#.
      have -> /=: !(256 <= 512 + i && 512 + i < 512). by move : ib => /#.
      congr. congr. move : i ib; rewrite -tP. rewrite pack_ext_eq tP => i ib.
      rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
      have ->: !(0 <= 512 + i && 512 + i < 256). by move : ib => /#.
      have -> //=: !(256 <= 512 + i && 512 + i < 512). by move : ib => /#.
    + by rewrite to_uintD_small; smt().
    by rewrite to_uintD_small; smt().

  rewrite /touches;move => ????????touch2.

  do split. 
  + move => k kb; move : (touch0 k _) (touch1 (k - 384) _) (touch2 (k - 768) _); 1..7: smt(). 
    by rewrite !to_uintD_small /= /#.

  rewrite /load_array1152 /fromarray384 /load_array384 tP => k kb; rewrite !initiE //=.
  case (0 <= k < 384).
  + move => kbb;  rewrite Array384.initiE //=.
    move : (touch2 (k - 768) _); 1:smt(). 
    rewrite to_uintD_small /=; 1: smt().
    rewrite (_: to_uint rp{1} + 768 + (k - 768) = to_uint rp{1} + k);1 : by ring.
    move => ->.
    move : (touch1 (k - 384) _); 1:smt(). 
    rewrite to_uintD_small /=; 1: smt().
    by rewrite (_: to_uint rp{1} + 384 + (k - 384) = to_uint rp{1} + k);1 : by ring.

  move=> nkb.
  case (384 <= k < 768).
  + move => kbb;  rewrite Array384.initiE 1:/# /=.
    move : (touch2 (k - 768) _); 1:smt(). 
    rewrite !to_uintD_small /=; 1,2: smt().
    rewrite (_: to_uint rp{1} + 768 + (k - 768) = to_uint rp{1} + k);1 : by ring.
    by rewrite (_: to_uint rp{1} + 384 + (k - 384) = to_uint rp{1} + k);1 : by ring.

  + move => kbb;  rewrite Array384.initiE 1:/# /=.
    rewrite !to_uintD_small /=; 1: smt().
    by rewrite (_: to_uint rp{1} + 768 + (k - 768) = to_uint rp{1} + k);1 : by ring.
qed.



end KyberPolyvecAVX.

