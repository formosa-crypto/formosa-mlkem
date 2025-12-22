require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array4 Array8 Array16 Array32 Array128 Array256 Array1408 Array384 Array400 Array1024 Array1536.
from JazzEC require import WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800.
require import Fq AVX2_Ops W16extra.
from JazzEC require import Jkem1024_avx2 Jkem1024.
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

from CryptoSpecs require import GFq Rq VecMat Serialization Correctness1024.
import Serialization1024 VecMat1024.

theory MLKEM_PolyvecAVX.

import Fq.
import SignedReductions.
import MLKEM1024.
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
           _a = lift_array1024 r /\
           _b = lift_array1024 b /\
           signed_bound1024_cxq r 0 1024 ab /\
           signed_bound1024_cxq b 0 1024 bb
           ==>
           signed_bound1024_cxq res 0 1024 (ab + bb) /\
           forall k, 0 <= k < 1024 =>
             incoeff (to_sint res.[k]) = _a.[k] + _b.[k]].
proof.
  move => abb bbb.
  proc.
  wp.
  call (MLKEM_PolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[(3 * 256) + i])) (Array256.init (fun i => _b.[(3 * 256) + i])) ab bb abb bbb).
  wp.
  call (MLKEM_PolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[(2 * 256) + i])) (Array256.init (fun i => _b.[(2 * 256) + i])) ab bb abb bbb).
  wp.
  call (MLKEM_PolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[256 + i])) (Array256.init (fun i => _b.[256 + i])) ab bb abb bbb).
  wp.
  call (MLKEM_PolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[0 + i])) (Array256.init (fun i => _b.[0 + i])) ab bb abb bbb).
  wp. skip.
  move => /= &hr; rewrite /lift_array1024 /lift_array256 !tP => [#] _a_def _b_def sgnd_bnd_rp sgnd_bnd_bp.
  split.
  + do split => /=; smt(Array256.mapiE Array256.initiE Array1024.mapiE Array1024.initiE). 
    
  move => [#] ??? sgnd_bnd_bp_1 result_1 [#]  sgnd_bnd_res_1 res_1_def.
  split.
  + rewrite !tP;do split; move => *; rewrite !initiE; smt(Array256.mapiE Array256.initiE Array1024.mapiE Array1024.initiE). 

  move => [#] ???sgnd_bnd_bp_2 result_2 [#] sgnd_bnd_res_2 res_2_def.
  split.
  + rewrite !tP;do split; move =>  i ib; rewrite !initiE /= // ?mapiE //=;
        have := res_2_def i ib;
     by  smt(Array256.initiE Array1024.initiE Array1024.set_eqiE Array1024.set_neqiE).

  move => [#] ???sgnd_bnd_bp_3 result_3 [#] sgnd_bnd_res_3 res_3_def.
  split.
  + rewrite !tP;do split; move =>  i ib; rewrite !initiE /= // ?mapiE //=;
        have := res_3_def i ib;
     by  smt(Array256.initiE Array1024.initiE Array1024.set_eqiE Array1024.set_neqiE).

  move => [#] ??? sgnd_bnd_bp_4 result_4 [#] sgnd_bnd_res_4 res_4_def.
  split.
  rewrite /signed_bound1024_cxq.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_1.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_2.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_3.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_4.
  move => k k_i.
  do rewrite initiE //=.
  move : (sgnd_bnd_res_1 k) (sgnd_bnd_res_2 (k - 256)) (sgnd_bnd_res_3 (k - 512)) (sgnd_bnd_res_3 (k - 768)).
  smt().
  move => k [#] k_lb k_ub.
  do rewrite initiE //=.
  case (0 <= k < 256) => k_si.
  move : (res_1_def k k_si).
  move : _a_def _b_def.
  smt(Array256.mapiE Array256.initiE Array1024.mapiE Array1024.initiE). 
  case (k < 512) => k_ssi.
  move : (res_2_def (k - 256)).
  rewrite (_: (0 <= k - 256 && k - 256 < 256) = true). move : k_si k_ub k_ssi => /#.
  simplify.
  move : _a_def _b_def.
  smt(Array256.mapiE Array256.initiE Array1024.mapiE Array1024.initiE). 
  case (k < 768) => k_sssi.
  move : (res_3_def (k - 512)).
  rewrite (_: (0 <= k - 512 && k - 512 < 256) = true). move : k_si k_ub k_ssi => /#.
  simplify.
  move : _a_def _b_def.
  smt(Array256.mapiE Array256.initiE Array1024.mapiE Array1024.initiE). 
  move : (res_4_def (k - 768)).
  rewrite (_: (0 <= k - 768 && k - 768 < 256) = true). move : k_si k_ub k_ssi => /#.
  simplify.
  move : _a_def _b_def.
  rewrite -lezNgt in k_sssi.
  rewrite k_ub k_sssi //=.
  rewrite /lift_array256.
  do rewrite initiE 1:/#.
  smt(Array256.mapiE Array256.initiE Array1024.mapiE Array1024.initiE). 
qed.

lemma polyvec_add_ll : islossless Mprevec.polyvec_add2
  by proc; do 4!(wp; call MLKEM_PolyAVX.poly_add_ll).

lemma polvec_add_corr _a _b ab bb:
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      phoare[Mprevec.polyvec_add2:
           _a = lift_array1024 r /\
           _b = lift_array1024 b /\
           signed_bound1024_cxq r 0 1024 ab /\
           signed_bound1024_cxq b 0 1024 bb
           ==>
           signed_bound1024_cxq res 0 1024 (ab + bb) /\
           forall k, 0 <= k < 1024 =>
             incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r.
  move => abb bbb.
  conseq (polyvec_add_ll) (polvec_add_corr_h _a _b ab bb abb bbb).
  by smt().
qed.
(* 
lemma polyvec_csubq_corr_h ap :
  hoare[Mprevec.polyvec_csubq:
       ap = lift_array1024 r /\
       pos_bound1024_cxq r 0 1024 2
       ==>
       ap = lift_array1024 res /\
       pos_bound1024_cxq res 0 1024 1].
proof.
  proc; sp.
  wp.
  ecall (MLKEM_PolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[3 * 256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[2 * 256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[i])))).
   wp. skip => &hr.
   rewrite /lift_array1024 /lift_array256 /pos_bound256_cxq !tP;move =>  [ap_def pos_bound_r]; split.

   split; trivial; smt(Array256.mapiE Array256.initiE Array1024.mapiE Array1024.initiE). 

   move => [r_eq_r_1 pos_bound_r_1 res1 [r_eq_res_1 pos_bound_res_1] res_1_def]; split.
   split; trivial => k kb @/res_1_def; rewrite !initiE //=.
   smt(Array256.mapiE Array256.initiE Array1024.mapiE Array1024.initiE).  

   move => [r_eq_r_2 pos_bound_r_2 res2 [r_eq_res_2 pos_bound_res_2] res_2_def]; split.
   split; trivial => k kb @/res_2_def; rewrite !initiE //=; smt(Array1024.initiE qE).

   move => [r_eq_r_3 pos_bound_r_3 res3 [r_eq_res_3 pos_bound_res_3] res_3_def]; split.
   split; trivial => k kb @/res_2_def; rewrite !initiE //=; smt(Array1024.initiE qE).

   move => [r_eq_r_4 pos_bound_r_4 res4 [r_eq_res_4 pos_bound_res_4] res_4_def]; split.
   rewrite /res_4_def /res_3_def /res_2_def /res_1_def /=.
   rewrite tP => k kb; rewrite ap_def // !mapiE //= initiE //=.
   case (768 <= k < 1024) => k_si. 
   rewrite tP in r_eq_res_4; move : (r_eq_res_4 (k - 768) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.
   case (512 <= k < 768) => k_ssi.
   rewrite tP in r_eq_res_3; move : (r_eq_res_3 (k - 512) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.
   case (256 <= k < 512) => k_sssi.
   rewrite tP in r_eq_res_2; move : (r_eq_res_2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.
   rewrite tP in r_eq_res_1; move : (r_eq_res_1 (k ) _);  1:by smt().
   rewrite !mapiE 1,2:/# /=.
   do rewrite initiE 1:/# //=.
    by smt(). by smt(). by smt().
   do rewrite initiE 1:/# //=.
   case (512 <= k < 768) => k_sssi.
   rewrite tP in r_eq_res_3; move : (r_eq_res_3 (k - 512) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=. smt(). 
   case (256 <= k < 512) => k_ssssi. 
   rewrite tP in r_eq_res_2; move : (r_eq_res_2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=. smt().
   rewrite tP in r_eq_res_1; move : (r_eq_res_1 (k ) _);  1:by smt().
   rewrite !mapiE 1,2:/# /=.
   do rewrite initiE 1:/# //=.
    by smt(). 
   rewrite /pos_bound1024_cxq => k k_i.
   do rewrite initiE //=.
   rewrite /pos_bound256_cxq /bpos16 //=in pos_bound_res_4.
   rewrite /pos_bound256_cxq /bpos16 //=in pos_bound_res_3.
   rewrite /pos_bound256_cxq /bpos16 //=in pos_bound_res_2.
   rewrite /pos_bound256_cxq /bpos16 //=in pos_bound_res_1.
   move : (pos_bound_res_4 (k - 768)) (pos_bound_res_3 (k - 512))  (pos_bound_res_2 (k - 256))  (pos_bound_res_1 k).
   smt(Array256.mapiE Array256.initiE Array1024.mapiE Array1024.initiE).    
qed.

lemma polyvec_csubq_ll: islossless Mprevec.polyvec_csubq.
  by proc; do 4!(wp; call MLKEM_PolyAVX.poly_csubq_ll).
qed.

lemma polyvec_csubq_corr ap:
  phoare[Mprevec.polyvec_csubq:
       ap = lift_array1024 r /\
       pos_bound1024_cxq r 0 1024 2
       ==>
       ap = lift_array1024 res /\
       pos_bound1024_cxq res 0 1024 1] = 1%r.
  conseq (polyvec_csubq_ll) (polyvec_csubq_corr_h ap).
  by smt().
qed.

*)
lemma polyvec_reduce_corr_h _a:
  hoare[Mprevec.polyvec_reduce:
       _a  = lift_array1024 r ==>
       _a  = lift_array1024 res /\
       forall k, 0 <= k < 1024 => bpos16 res.[k] (2*q)].
proof. 
  proc; sp.
  wp.
  ecall (MLKEM_PolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[3 * 256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[2 * 256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[i])))).
  wp. skip.
  move => &hr _a_def.
  split; first by trivial.
  move => r_eq_r_1 res1 [r_eq_res1 res1_bound] res1_def res2 [r_eq_res2 res2_bound] res2_def 
          res3 [r_eq_res3 res3_bound] res3_def res4 [r_eq_res4 res4_bound] res4_def.
  split.
  rewrite /res4_def /res3_def /res2_def /res1_def /=.
  rewrite _a_def.
  rewrite /lift_array1024 tP => k kb.
  rewrite !mapiE //=.
  do rewrite initiE 1:/# //=.
  do rewrite fun_if.
   case (768 <= k < 1024) => k_si.
   rewrite /lift_array256 tP in r_eq_res4; move : (r_eq_res4 (k - 768) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.
   case (512 <= k < 768) => k_ssi.
   rewrite /lift_array256 tP in r_eq_res3; move : (r_eq_res3 (k - 512) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.
   case (256 <= k < 512) => k_sssi.
   rewrite /lift_array256 tP in r_eq_res2; move : (r_eq_res2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=. smt(). smt(). smt().
   case (512 <= k < 768) => k_sssi. 
   rewrite /lift_array256 tP in r_eq_res3; move : (r_eq_res3 (k - 512) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=. smt().  
   case (256 <= k < 512) => k_ssi. 
   rewrite /lift_array256 tP in r_eq_res2; move : (r_eq_res2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=. smt().  
   rewrite /lift_array256 tP in r_eq_res1; move : (r_eq_res1 (k) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //= => *; smt().
   move => k k_i.
   do rewrite initiE //=.
   rewrite /bpos16 //=in res4_bound.
   rewrite /bpos16 //=in res3_bound.
   rewrite /bpos16 //=in res2_bound.
   rewrite /bpos16 //=in res1_bound.
   move :  (res4_bound (k - 768)) (res3_bound (k - 512))  (res2_bound (k - 256))  (res1_bound k).
   smt().
qed.

lemma polyvec_reduce_ll : islossless Mprevec.polyvec_reduce
  by proc; do 4!(wp; call MLKEM_PolyAVX.poly_reduce_ll).

lemma polvec_reduce_corr _a:
      phoare[Mprevec.polyvec_reduce:
       _a  = lift_array1024 r ==>
       _a  = lift_array1024 res /\
       forall k, 0 <= k < 1024 => bpos16 res.[k] (2*q)] = 1%r.
  conseq (polyvec_reduce_ll) (polyvec_reduce_corr_h _a).
  by smt().
qed.


end MLKEM_PolyvecAVX.

