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
  + rewrite !tP;do split; move => *; rewrite !initiE /= // ?mapiE //=;
     by  smt(Array256.initiE Array1024.initiE Array1024.set_eqiE Array1024.set_neqiE).

  move => [#] ???sgnd_bnd_bp_3 result_3 [#] sgnd_bnd_res_3 res_3_def.
  split.
  + rewrite !tP;do split; move => *; rewrite !initiE /= // ?mapiE //=;
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

lemma polyvec_compress_corr _a (_p : address) mem :
    equiv [ Mprevec.polyvec_compress ~ EncDec_AVX2.encode11_opt_vec :
             pos_bound1024_cxq a{1} 0 1024 2 /\
             lift_polyvec a{1} = _a /\
             a{2} = compress_polyvec 11 _a /\
             valid_ptr _p 1408 /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             touches mem Glob.mem{1} _p 1408 /\
             load_array1408 Glob.mem{1} _p = res{2}].
admitted.

lemma polyvec_compress_1_corr _a mem :
    equiv [ Mprevec.polyvec_compress_1 ~ EncDec_AVX2.encode11_opt_vec :
             pos_bound1024_cxq a{1} 0 1024 2 /\
             lift_polyvec a{1} = _a /\
             a{2} = compress_polyvec 11 _a /\
             Glob.mem{1} = mem
              ==>
             Glob.mem{1} = mem /\
             ={res}].
admitted.


lemma polyvec_decompress_corr mem _p (_a : W8.t Array1408.t): 
    equiv [ Mprevec.polyvec_decompress ~ EncDec_AVX2.decode11_opt_vec :
             valid_ptr _p 1408 /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p /\
             load_array1408 Glob.mem{1} _p = _a /\ u{2} = _a
              ==>
             Glob.mem{1} = mem /\
             lift_polyvec res{1} = decompress_polyvec 11 res{2} /\
             pos_bound1024_cxq res{1} 0 1024 1].
admitted.

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

lemma polyvec_frombytes_corr mem _p:
    equiv [ Mprevec.polyvec_frombytes ~ EncDec_AVX2.decode12_opt_vec :
             valid_ptr _p (4*384) /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array1536 Glob.mem{1} _p = a{2}
              ==>
             map W16.to_sint res{1} = (nttunpackv res{2})  /\
             pos_bound1024_cxq res{1} 0 1024  2 /\
             Glob.mem{1} = mem ].
proof.
  proc => /=.
  wp; ecall (MLKEM_PolyAVX.poly_frombytes_corr Glob.mem{1} (to_uint pp{1}) (MLKEM_PolyAVX.load_array384 Glob.mem{1} (_p + 1152))).
  wp; ecall (MLKEM_PolyAVX.poly_frombytes_corr Glob.mem{1} (to_uint pp{1}) (MLKEM_PolyAVX.load_array384 Glob.mem{1} (_p + 768))).
  wp; ecall (MLKEM_PolyAVX.poly_frombytes_corr Glob.mem{1} (to_uint pp{1}) (MLKEM_PolyAVX.load_array384 Glob.mem{1} (_p + 384))).
  wp; ecall (MLKEM_PolyAVX.poly_frombytes_corr Glob.mem{1} (to_uint pp{1}) (MLKEM_PolyAVX.load_array384 Glob.mem{1} (_p))).
  auto => /> &1.
  rewrite /pos_bound1024_cxq /pos_bound256_cxq /load_array384 /load_array1536 /subarray384 /lift_array1024 /fromarray256 !tP.
  move => pbl pbh.
  split; 1: by  smt(Array384.initiE Array1536.initiE).

  move => *;split; 1: by rewrite to_uintD_small /=;  smt(Array384.initiE Array1536.initiE).
  move => *;split; 1: by rewrite to_uintD_small /=;  smt(Array384.initiE Array1536.initiE).
  move => *;split; 1: by rewrite to_uintD_small /=;  smt(Array384.initiE Array1536.initiE).
  move => *;split. 
  + rewrite tP => k kb.
    rewrite !mapiE //= !initiE  //= initiE //=.
    case ( 768 <= k && k < 1024).
    + move => kbb; rewrite (_: 0<= k <256 = false) 1:/# /=  (_: 256 <= k <512 = false) 1:/# /= (_: 512<= k <768 = false) 1:/# /=.
      rewrite /subarray256 => />.
      rewrite  /nttunpack initiE 1:/# //= initiE 1:(nttunpack_inbounds (k-768)) 1:/# /=.
      rewrite Array1024.initiE /=; first by move : (nttunpack_inbounds (k-768)) => /#.
      have -> /=: !(0 <= 768 + nttunpack_idx.[k - 768] && 768 + nttunpack_idx.[k - 768] < 256). move : nttunpack_inbounds => /#.
      have -> /=: !(256 <= 768 + nttunpack_idx.[k - 768] && 768 + nttunpack_idx.[k - 768] < 512). move : nttunpack_inbounds => /#.
      have -> /=: !(512 <= 768 + nttunpack_idx.[k - 768] && 768 + nttunpack_idx.[k - 768] < 768). move : nttunpack_inbounds => /#.
      rewrite mapiE 1:(nttunpack_inbounds (k-768)) 1:/# /nttpack initiE 1:(nttunpack_inbounds (k-768)) 1:/# /=.
      move : nttpack_idxK; rewrite allP /= => ->. rewrite mem_iota -andabP; move : kbb kb => /#. by trivial.
    move => kbbb.
    case ( 512 <= k && k < 768).
    + move => kbb; rewrite (_: 0<= k <256 = false) 1:/# /= (_: 256<= k <512 = false) 1:/# /=.
      rewrite /subarray256 => />.
      rewrite  /nttunpack initiE 1:/# //= initiE 1:(nttunpack_inbounds (k-512)) 1:/# /=.
      rewrite Array1024.initiE /=; first by move : (nttunpack_inbounds (k-512)) => /#.
      have ->: !(0 <= 512 + nttunpack_idx.[k - 512] && 512 + nttunpack_idx.[k - 512] < 256). move : nttunpack_inbounds => /#.
      have -> /=: !(256 <= 512 + nttunpack_idx.[k - 512] && 512 + nttunpack_idx.[k - 512] < 512). move : nttunpack_inbounds => /#.
      have -> /=: (512 <= 512 + nttunpack_idx.[k - 512] && 512 + nttunpack_idx.[k - 512] < 768). move : nttunpack_inbounds => /#.
      rewrite mapiE 1:(nttunpack_inbounds (k-512)) 1:/# /nttpack initiE 1:(nttunpack_inbounds (k-512)) 1:/# /=.
      move : nttpack_idxK; rewrite allP /= => ->. rewrite mem_iota -andabP; move : kbb kb => /#. by trivial.
    case ( 256 <= k && k < 512).
    + move => kbb nkbb; rewrite (_: 0<= k <256 = false) 1:/# /=.
      rewrite /subarray256 => />.
      rewrite  /nttunpack initiE 1:/# //= initiE 1:/# //= initiE 1:/# //=  initiE 1:(nttunpack_inbounds (k-256)) 1:/# /=.
      rewrite Array1024.initiE /=; first by move : (nttunpack_inbounds (k-256)) => /#.
      have ->: !(0 <= 256 + nttunpack_idx.[k - 256] && 256 + nttunpack_idx.[k - 256] < 256). move : nttunpack_inbounds => /#.
      have -> /=: (256 <= 256 + nttunpack_idx.[k - 256] && 256 + nttunpack_idx.[k - 256] < 512). move : nttunpack_inbounds => /#.
      rewrite mapiE 1:(nttunpack_inbounds (k-256)) 1:/# /nttpack initiE 1:(nttunpack_inbounds (k-256)) 1:/# /=.
      rewrite ifT /= 1:/#.
      move : nttpack_idxK; rewrite allP /= => ->. rewrite mem_iota -andabP; move : kbb kb => /#. by trivial.
    + move => nkbb nkbbb; rewrite initiE 1:/# (_: 0<= k < 256 = true) 1:/# /=  
        initiE 1:/# (_: 256 <= k < 512 = false) 1:/# /= (_: 0<= k < 256 = true) 1:/# /= .
      rewrite /subarray256 => />.
      rewrite  /nttunpack initiE 1:/# //= initiE 1:(nttunpack_inbounds k) 1:/# /=.
      rewrite Array1024.initiE /=; first by move : (nttunpack_inbounds k) => /#.
      rewrite (nttunpack_inbounds k) 1:/# /=.
      rewrite mapiE 1:(nttunpack_inbounds k) 1:/# /nttpack initiE 1:(nttunpack_inbounds k) 1:/# /=.
      move : nttpack_idxK; rewrite allP /= => ->. rewrite mem_iota -andabP; move : nkbb nkbbb kb => /#. by trivial.
     
  move => k kb; rewrite initiE 1:/# /=.
  case ( 768 <= k && k < 1024);1: by smt().
   rewrite initiE 1:/# /=. 
  case ( 512 <= k && k < 768);1: by smt(). 
  case ( 256 <= k && k < 512). 
  + by move => kbb; rewrite (_: 512<= k <768 = false) 1:/# /= initiE /#.
  by move => kbb nkbb; rewrite !initiE 1:/# /= kbb /= !initiE /#.
qed.

lemma polyvec_frombytes_equiv :
    equiv [Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_frombytes ~Jkem1024.M(Jkem1024.Syscall).__polyvec_frombytes :
             valid_ptr (W64.to_uint ap{1}) (4*384) /\
             ={Glob.mem,ap} ==>
             lift_array1024 res{1} = nttunpackv (lift_array1024 res{2}) /\
             pos_bound1024_cxq res{1} 0 1024 2 /\
             pos_bound1024_cxq res{2} 0 1024 2 ].
proof.
  transitivity Mprevec.polyvec_frombytes
                   (valid_ptr (W64.to_uint ap{1}) 1536 /\ ={ap, Glob.mem} ==> ={res})
                   (valid_ptr (W64.to_uint ap{1}) 1536 /\ ={Glob.mem, ap} ==>
                    lift_array1024 res{1} = nttunpackv (lift_array1024 res{2}) /\
                    pos_bound1024_cxq res{1} 0 1024 2 /\
                    pos_bound1024_cxq res{2} 0 1024 2); first 2 by smt().
    + symmetry. proc * => /=. call prevec_eq_polyvec_frombytes => //=.
  transitivity EncDec_AVX2.decode12_opt_vec
               (valid_ptr (to_uint ap{1}) (4*384) /\ ={Glob.mem} /\ load_array1536 Glob.mem{1} (to_uint ap{1}) = a{2} ==>
                map W16.to_sint res{1} = (nttunpackv res{2})  /\
                pos_bound1024_cxq res{1} 0 1024 2 /\
                ={Glob.mem})
               (valid_ptr (to_uint ap{2}) (4*384) /\ ={Glob.mem} /\ load_array1536 Glob.mem{2} (to_uint ap{2}) = a{1} ==>
                res{1} = map W16.to_sint res{2} /\
                pos_bound1024_cxq res{2} 0 1024 2 /\
                ={Glob.mem}).
               auto => &1 &2 [#] ap_b -> <- />.
                 exists Glob.mem{2}.
                   exists (load_array1536 Glob.mem{2} (to_uint ap{1})).
                     + auto => />.
               auto => &1 &2 &m [#] H0 H1 H2 [#] H3 H4 H5 />.
                 rewrite nttunpackv_lift /lift_array1024 Array1024.tP => i i_bnds.
                 rewrite mapiE 1:i_bnds /= mapiE 1:i_bnds /=. congr.
                 rewrite -mapiE 1:i_bnds -(Array1024.mapiE W16.to_sint _) 1:i_bnds.
                 move : i i_bnds. rewrite -tP.
                 rewrite H0 H3.
                 rewrite nttunpackv_mapsint //=.
    + proc * => /=.
      ecall (polyvec_frombytes_corr (Glob.mem{1}) (to_uint ap{1})) => //=.
  symmetry.
  transitivity EncDec.decode12_vec
               (valid_ptr (to_uint ap{1}) (4*384) /\ ={Glob.mem} /\ load_array1536 Glob.mem{1} (to_uint ap{1}) = a{2} ==>
                map W16.to_sint res{1} = res{2}  /\
                pos_bound1024_cxq res{1} 0 1024 2 /\
                ={Glob.mem})
                (={Glob.mem} /\ a{1} = a{2} ==>
                res{1} = res{2} /\
                ={Glob.mem}).
               auto => &1 &2 [#] ap_bnds mem_eq load_def />.
               exists Glob.mem{1}.
               exists (load_array1536 Glob.mem{1} (to_uint ap{1})).
               split.
                 trivial.
                 by rewrite mem_eq load_def.
               auto => />.
    + proc * => /=.
      ecall (MLKEM_PolyVec.polyvec_frombytes_corr (Glob.mem{1}) (to_uint ap{1})) => //=.
  symmetry.
  proc * => /=.
  call decode12_opt_vec_corr.
  auto => />.
qed.

lemma polyvec_tobytes_corr mem _p _a:
    equiv [ Mprevec.polyvec_tobytes ~ EncDec_AVX2.encode12_opt_vec :
            pos_bound1024_cxq a{1} 0 1024 2 /\
            lift_array1024 (nttpackv a{1}) = _a /\
            (forall i, 0<=i<1024 => 0 <= a{2}.[i] <q) /\
            map incoeff a{2} = _a /\  valid_ptr _p (4*384) /\
            Glob.mem{1} = mem /\ to_uint rp{1} = _p
             ==>
            touches mem Glob.mem{1} _p (4*384) /\
            load_array1536 Glob.mem{1} _p = res{2}
            ].
proof.
  proc => /=.
  wp;ecall (MLKEM_PolyAVX.poly_tobytes_corr (lift_array256 (nttpack (Array256.init (fun (i : int) => a{1}.[3 * 256 + i])))) (to_uint pp{1}) Glob.mem{1}).
  wp;ecall (MLKEM_PolyAVX.poly_tobytes_corr (lift_array256 (nttpack (Array256.init (fun (i : int) => a{1}.[2 * 256 + i])))) (to_uint pp{1}) Glob.mem{1}).
  wp;ecall (MLKEM_PolyAVX.poly_tobytes_corr (lift_array256 (nttpack (Array256.init (fun (i : int) => a{1}.[256 + i])))) (to_uint pp{1}) Glob.mem{1}).
  wp;ecall (MLKEM_PolyAVX.poly_tobytes_corr (lift_array256 (nttpack (Array256.init (fun (i : int) => a{1}.[i])))) (to_uint pp{1}) Glob.mem{1}).

  auto => /> &1 &2; rewrite /pos_bound1024_cxq /pos_bound256_cxq /lift_array256 /lift_array1024 /subarray256 !tP.
  move => bnda1 bnda2 vals pbl pbh.

  split.
  + do split; 1,2: by move => *; rewrite initiE /=; smt().
    + move => i ib; rewrite !mapiE // !initiE //=. move : (vals i); rewrite mapiE 1:/# mapiE 1:/# /=.
      have -> /=: (0 <= i < 1024). by move : ib => /#.
      move => ->.
      rewrite /nttpackv initiE 1:/# /= ib /= /subarray256 //=.
    + move : pbh => /#.

  rewrite /touches;move => ????????touch0; split.

  + do split; 1: by  move => *; rewrite !initiE 1:/# /= !initiE  /#.
    + by move => *; rewrite initiE /=; smt().
    + rewrite tP => i ib; rewrite !mapiE // !initiE //=.
      move : (vals (256 + i)); rewrite mapiE 1:/# mapiE 1:/# /=.
      have -> /=: (0 <= 256 + i < 1024). by move : ib => /#.
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
      have -> /=: (0 <= 512 + i < 1024). by move : ib => /#.
      move => ->.
      rewrite /nttpackv initiE 1:/# /=.
      have ->: !(0 <= 512 + i && 512 + i < 256). by move : ib => /#.
      have -> /=: !(256 <= 512 + i && 512 + i < 512). by move : ib => /#.
      have -> /=: (512 <= 512 + i && 512 + i < 768). by move : ib => /#.
      congr. congr. move : i ib; rewrite -tP. rewrite pack_ext_eq tP => i ib.
      rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
      have ->: !(0 <= 512 + i && 512 + i < 256). by move : ib => /#.
      have -> //=: !(256 <= 512 + i && 512 + i < 512). by move : ib => /#.
    + by rewrite to_uintD_small; smt().
    by rewrite to_uintD_small; smt().

  rewrite /touches;move => ????????touch2; split. 

  + do split;1:by move => *; rewrite !initiE 1:/# /= !initiE 1:/# /= !initiE  /= 1:/# !initiE  /= 1:/#  /#.
    + by move => *; rewrite initiE /=; smt().
    + rewrite tP => i ib; rewrite !mapiE // !initiE //=.
      move : (vals (768 + i)); rewrite mapiE 1:/# mapiE 1:/# /=.
      have -> /=: (0 <= 768 + i < 1024). by move : ib => /#.
      move => ->.
      rewrite /nttpackv initiE 1:/# /=.
      have ->: !(0 <= 768 + i && 768 + i < 256). by move : ib => /#.
      have -> /=: !(256 <= 768 + i && 768 + i < 512). by move : ib => /#.
      have -> /=: !(512 <= 768 + i && 768 + i < 768). by move : ib => /#.
      congr. congr. move : i ib; rewrite -tP. rewrite pack_ext_eq tP => i ib.
      rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
      have ->: !(512 <= 768 + i && 768 + i < 768). by move : ib => /#.
      have -> //=: !(256 <= 768 + i && 768 + i < 512). by move : ib => /#. by smt().
    + by rewrite to_uintD_small; smt().
    by rewrite to_uintD_small; smt().

  rewrite /touches;move => ????????touch3.

  do split. 
  + move => k kb; move : (touch0 k _) (touch1 (k - 384) _) (touch2 (k - 768) _) (touch3 (k - 1152) _); 1..15: smt(). 
    by rewrite !to_uintD_small /= /#.

  rewrite /load_array1536 /fromarray384 /load_array384 tP => k kb; rewrite !initiE //=.
  case (0 <= k < 384).
  + move => kbb;  rewrite Array384.initiE //=.
    move : (touch3 (k - 1152) _); 1:smt(). 
    move : (touch2 (k - 768) _); 1:smt(). 
    rewrite !to_uintD_small /=; 1,2: smt().
    rewrite (_: to_uint rp{1} + 1152 + (k - 1152) = to_uint rp{1} + k);1 : by ring.
    move : (touch1 (k - 384) _); 1:smt(). 
    rewrite !to_uintD_small /=; 1: smt(). smt().

  case (384 <= k < 768).
  + move => kbb;  rewrite Array384.initiE //= 1:/#. 
    move : (touch3 (k - 1152) _); 1:smt(). 
    move : (touch2 (k - 768) _); 1:smt().  
    rewrite !to_uintD_small /=; 1..3: smt().
    rewrite (_: to_uint rp{1} + 1152 + (k - 1152) = to_uint rp{1} + k);1 : by ring.  
    rewrite (_: to_uint rp{1} + 768 + (k - 768) = to_uint rp{1} + k);1 : by ring.  
    rewrite (_: to_uint rp{1} + 384 + (k - 384) = to_uint rp{1} + k);1 : by ring. 
    by smt(). 

  move=> nkb nkbb.
  case (768 <= k < 1152).
  + move => kbb;  rewrite Array384.initiE 1:/# /=.
    move : (touch3 (k - 1152) _); 1:smt(). 
    rewrite !to_uintD_small /=; 1,2: smt().
    rewrite (_: to_uint rp{1} + 1152 + (k - 1152) = to_uint rp{1} + k);1 : by ring.
    by smt().

  + move => kbb;  rewrite Array384.initiE 1:/# /=.
    rewrite !to_uintD_small /=; 1: smt().
    by rewrite (_: to_uint rp{1} + 1152 + (k - 1152) = to_uint rp{1} + k);1 : by ring.
qed.



end MLKEM_PolyvecAVX.

