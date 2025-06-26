require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array4 Array8 Array16 Array32 Array128 Array256 Array960 Array384 Array400 Array768 Array1152.
from JazzEC require import WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800.
require import Fq AVX2_Ops W16extra.
from JazzEC require import Jkem768_avx2 Jkem768.
require import MLKEM_PolyVec_avx2_prevec.
require import MLKEM_Poly_avx2_vec.
require import MLKEM_Poly_avx2_proof.
require import MLKEM_Poly_avx2_vec.
require import Fq_avx2.
require import MLKEM_PolyVec.
require import MLKEM_PolyVec_avx2_vec.
require import NTT_avx2.
require import MLKEMFCLib.
require import MLKEM_avx2_auxlemmas.

from CryptoSpecs require import GFq Rq VecMat Serialization Correctness768.
import Serialization768 VecMat768.

theory MLKEM_PolyvecAVX.

import Fq.
import SignedReductions.
import MLKEM768.
import Zq.
import MLKEM_PolyAVX.
import MLKEM_PolyAVXVec.
import MLKEM_PolyVec.
import MLKEM_PolyVecAVXVec.
import MLKEM_Poly.
import MLKEM_Poly.
import NTT_Avx2.
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
             incoeff (to_sint res.[k]) = _a.[k] + _b.[k]].
proof.
  move => abb bbb.
  proc.
  wp.
  call (MLKEM_PolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[(2 * 256) + i])) (Array256.init (fun i => _b.[(2 * 256) + i])) ab bb abb bbb).
  wp.
  call (MLKEM_PolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[256 + i])) (Array256.init (fun i => _b.[256 + i])) ab bb abb bbb).
  wp.
  call (MLKEM_PolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[0 + i])) (Array256.init (fun i => _b.[0 + i])) ab bb abb bbb).
  wp. skip.
  move => /= &hr; rewrite /lift_array768 /lift_array256 !tP => [#] _a_def _b_def sgnd_bnd_rp sgnd_bnd_bp.
  split.
  + do split => /=; smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE). 
    
  move => [#] ??? sgnd_bnd_bp_1 result_1 [#]  sgnd_bnd_res_1 res_1_def.
  split.
  + rewrite !tP;do split; move => *; rewrite !initiE; smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE). 
  move => [#] ???sgnd_bnd_bp_2 result_2 [#] sgnd_bnd_res_2 res_2_def.
  split.
  + rewrite !tP;do split; move => *; rewrite !initiE /= // ?mapiE //=;
     by  smt(Array256.initiE Array768.initiE Array768.set_eqiE Array768.set_neqiE).
  move => [#] ??? sgnd_bnd_bp_3 result_3 [#] sgnd_bnd_res_3 res_3_def.
  split.
  rewrite /signed_bound768_cxq.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_1.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_2.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_3.
  move => k k_i.
  do rewrite initiE //=.
  move : (sgnd_bnd_res_1 k) (sgnd_bnd_res_2 (k - 256)) (sgnd_bnd_res_3 (k - 512)).
  smt().
  move => k [#] k_lb k_ub.
  do rewrite initiE //=.
  case (0 <= k < 256) => k_si.
  move : (res_1_def k k_si).
  move : _a_def _b_def.
  smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE). 
  case (k < 512) => k_ssi.
  move : (res_2_def (k - 256)).
  rewrite (_: (0 <= k - 256 && k - 256 < 256) = true). move : k_si k_ub k_ssi => /#.
  simplify.
  move : _a_def _b_def.
  smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE). 
  move : (res_3_def (k - 512)).
  rewrite (_: (0 <= k - 512 && k - 512 < 256) = true). move : k_si k_ub k_ssi => /#.
  simplify.
  move : _a_def _b_def.
  rewrite -lezNgt in k_ssi.
  rewrite k_ub k_ssi //=.
  rewrite /lift_array256.
  do rewrite initiE 1:/#.
  smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE). 
qed.

lemma polyvec_add_ll : islossless Mprevec.polyvec_add2
  by proc; do 3!(wp; call MLKEM_PolyAVX.poly_add_ll).

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
             incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r.
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
  ecall (MLKEM_PolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[2 * 256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[i])))).
   wp. skip => &hr.
   rewrite /lift_array768 /lift_array256 /pos_bound256_cxq !tP;move =>  [ap_def pos_bound_r]; split.
   split; trivial; smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE). 
   move => [r_eq_r_1 pos_bound_r_1 res1 [r_eq_res_1 pos_bound_res_1] res_1_def]; split.
   split; trivial => k kb @/res_1_def; rewrite !initiE //=.
   smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE).  
   move => [r_eq_r_2 pos_bound_r_2 res2 [r_eq_res_2 pos_bound_res_2] res_2_def]; split.
   split; trivial => k kb @/res_2_def; rewrite !initiE //=; smt(Array768.initiE qE).
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
   smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE).    
qed.

lemma polyvec_csubq_ll: islossless Mprevec.polyvec_csubq.
  by proc; do 3!(wp; call MLKEM_PolyAVX.poly_csubq_ll).
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
  move=> *; rewrite /(`<<`) of_uintK.
  by rewrite modz_small //; smt().
qed.

lemma shr_shrw_w8 (k: int) (w: W8.t):
  0 <= k < W8.size =>
  w `>>` W8.of_int k = w `>>>` k.
proof.
  move=> *; rewrite /(`>>`) of_uintK.
  by rewrite pmod_small //; smt().
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
  rewrite expr0 mulz1 //=.
  rewrite (Montgomery16.smod_small 1024) 1://=.
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
  compress_polyvec d (lift_polyvec a) = Array768.map (compress d) (lift_array768 a).
proof.
  apply Array768.tP => i ib.
  rewrite /compress_polyvec /fromarray256 mapiE 1:ib /=.
  rewrite mapiE 1:ib /= initiE 1:ib /=.
  case (0 <= i && i < 256) => r.
    by rewrite getvE liftarrayvector 1..2://=.
  case (256 <= i && i < 512) => r1.
    by rewrite getvE liftarrayvector 1://= 1:/#.
    by rewrite getvE liftarrayvector 1://= 1:/#.
qed.

lemma polyvec_compress_corr _a (_p : address) mem :
    hoare [ Mprevec.polyvec_compress :
             pos_bound768_cxq a 0 768 2 /\
             lift_polyvec a = _a /\
             valid_ptr _p 960 /\
             Glob.mem = mem /\ to_uint rp = _p
              ==>
             touches mem Glob.mem _p 960 /\
             load_array960 Glob.mem _p = encode10_vec (compress_polyvec 10 _a)].
admitted.

lemma polyvec_compress_1_corr _a mem :
    hoare [ Mprevec.polyvec_compress_1 :
             pos_bound768_cxq a 0 768 2 /\
             lift_polyvec a = _a /\
             Glob.mem = mem
              ==>
             Glob.mem = mem /\
             res =  encode10_vec (compress_polyvec 10 _a)].
admitted.

abbrev ru_ones_s = W8.of_int 1.
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
    smt().
  rewrite shr_shrw 1://= shr_shrw 1://= shrDP 1://=.
  rewrite -W32.of_intD.
  rewrite (pmod_small _ W32.modulus).
    move : (modz_cmp (x+y) 1024) => />.
    move : ib; rewrite andabP => /(mem_iota 0 2 i).
    move : i; rewrite -List.allP -iotaredE //=.
    smt().
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
    hoare [ Mprevec.polyvec_decompress  :
             valid_ptr _p 960 /\
             Glob.mem = mem /\ to_uint rp = _p /\
             load_array960 Glob.mem _p = _a 
              ==>
             Glob.mem = mem /\
             lift_polyvec res = decompress_polyvec 10 (decode10_vec _a) /\
             pos_bound768_cxq res 0 768 1].
admitted.


lemma polyvec_reduce_corr_h _a:
  hoare[Mprevec.polyvec_reduce:
       _a  = lift_array768 r ==>
       _a  = lift_array768 res /\
       forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)].
proof. 
  proc; sp.
  wp.
  ecall (MLKEM_PolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[2 * 256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[i])))).
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
   do rewrite initiE 1:/# //= => *; smt().
   move => k k_i.
   do rewrite initiE //=.
   rewrite /bpos16 //=in res3_bound.
   rewrite /bpos16 //=in res2_bound.
   rewrite /bpos16 //=in res1_bound.
   move : (res3_bound (k - 512))  (res2_bound (k - 256))  (res1_bound k).
   smt().
qed.

lemma polyvec_reduce_ll : islossless Mprevec.polyvec_reduce
  by proc; do 3!(wp; call MLKEM_PolyAVX.poly_reduce_ll).

lemma polvec_reduce_corr _a:
      phoare[Mprevec.polyvec_reduce:
       _a  = lift_array768 r ==>
       _a  = lift_array768 res /\
       forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)] = 1%r.
  conseq (polyvec_reduce_ll) (polyvec_reduce_corr_h _a).
  by smt().
qed.

lemma polyvec_frombytes_corr_h mem _p _a:
    hoare [ Mprevec.polyvec_frombytes :
             valid_ptr _p (3*384) /\
             Glob.mem = mem /\ to_uint ap = _p /\
             load_array1152 Glob.mem _p = _a
              ==>
             nttpackv (lift_array768 res) = map incoeff (decode12_vec _a)  /\
             pos_bound768_cxq res 0 768  2 /\
             Glob.mem = mem ].
admitted.

lemma polyvec_frombytes_corr mem _p _a:
    phoare [ Mprevec.polyvec_frombytes :
             valid_ptr _p (3*384) /\
             Glob.mem = mem /\ to_uint ap = _p /\
             load_array1152 Glob.mem _p = _a
              ==>
             nttpackv (lift_array768 res) = map incoeff (decode12_vec _a)  /\
             pos_bound768_cxq res 0 768  2 /\
             Glob.mem = mem ] = 1%r.
admitted.

lemma polyvec_frombytes_equiv :
    equiv [Jkem768_avx2.M(Jkem768_avx2.Syscall).__polyvec_frombytes ~Jkem768.M(Jkem768.Syscall).__polyvec_frombytes :
             valid_ptr (W64.to_uint ap{1}) (3*384) /\
             ={Glob.mem,ap} ==>
             lift_array768 res{1} = nttunpackv (lift_array768 res{2}) /\
             pos_bound768_cxq res{1} 0 768 2 /\
             pos_bound768_cxq res{2} 0 768 2 ].
admitted.



end MLKEM_PolyvecAVX.

