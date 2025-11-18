require import AllCore List Int IntDiv CoreMap Real Number Ring StdOrder BitEncoding.

from Jasmin require import JModel.
from JazzEC require import Array256 Array128  Array16.
from JazzEC require import Array256 Array128 Array32 Array16 Array1024 Array4096.

require import MLKEMFCLib.
require import MLKEM_PolyVec.
require import NTT_Fq.
require import AVX2_Ops.

from CryptoSpecs require import GFq Rq Serialization VecMat Correctness1024.
import VecMat1024 Serialization1024.

import MLKEM_PolyVec.
import Zq IntOrder BitReverse.
import PolyVec PolyMat.

require import NTT_AVX_Fq_basemul NTT_AVX_Fq_ntt NTT_AVX_Fq_invntt NTT_AVX_j_invntt NTT_AVX_j_ntt NTT_AVX_j.

require import NTT_avx2 NTT_avx2_ntt.

import NTT_Avx2.

import KMatrix.
import Vector.

lemma poly_invntt_avx2_corr _r :
  phoare [Jkem1024_avx2.M._poly_invntt :
    lift_array256 (nttpack rp) = lift_array256 _r /\ signed_bound_cxq rp 0 256 4 ==>
    mul1x256 (incoeff W16.modulus) (invntt (lift_array256 _r)) = (lift_array256 res) /\
    signed_bound_cxq res 0 256 1] = 1%r.
proof.
conseq poly_invntt_avx2_eq (invntt_avx_spec (lift_array256 _r)).
move => &1 [<- H]. exists (lift_array256 arg{1}) => />. rewrite lift_nttpack perm_ntt_nttpackE //.
move => &1 &2 [<- H] -> /#. 
qed.

lemma nttpack_subarray1024 (r : 'a Array1024.t) :
  nttpack (Array256.init ("_.[_]" r)) = Array256.init ("_.[_]" (nttpackv r)).
rewrite /nttpack tP => />i Hi1 Hi2. rewrite !initiE /= 1..3:/#. rewrite ifT 1:/#.
rewrite /nttpack. rewrite initiE /=. rewrite nttpack_inbounds //.
rewrite eq_sym initiE /= 1:/#. rewrite /subarray256 initiE //. rewrite nttpack_inbounds //.
qed.

lemma nttpack_subarray1024_k (r : 'a Array1024.t) k :
  k = 256 || k = 512  || k = 768 =>
  nttpack (Array256.init (fun i => r.[k+i])) = Array256.init (fun i => (nttpackv r).[k+i]).
move => Hk. rewrite /nttpack tP => /> i Hi1 Hi2. rewrite !initiE /= 1..2:/#. rewrite initiE //= /nttpack 1:/#. rewrite initiE //=. rewrite nttpack_inbounds //. pose a := nttpack_idx.[i].
case Hk => />.
 + rewrite ifF 1:/#. rewrite ifT 1:/#. rewrite /subarray256 initiE //= initiE //=. rewrite nttpack_inbounds //. 
move => ?Hk.
case Hk => />. 
+ rewrite ifF 1:/#. rewrite ifF 1:/#. rewrite ifT 1:/#.  rewrite /subarray256 initiE //= initiE //= . rewrite nttpack_inbounds //. 
 + rewrite ifF 1:/#. rewrite ifF 1:/#. rewrite ifF 1:/#.  rewrite /subarray256 initiE //= initiE //=. rewrite nttpack_inbounds //. 
qed.

lemma lift_array_256_1024 (r : W16.t Array1024.t) :
  lift_array256 (Array256.init ("_.[_]" r)) = Array256.init ("_.[_]" (lift_array1024 r)).
rewrite /lift_array256 /lift_array1024 /map tP => />i Hi1 Hi2. rewrite !initiE //= 1:/#. rewrite initiE //=. qed.

lemma lift_array_256_1024_k (r : W16.t Array1024.t) k :
  0 <= k <= 768 =>
  lift_array256 (Array256.init (fun (i : int) => r.[k+ i])) = (Array256.init (fun (i : int) => (lift_array1024 r).[k + i])).
move => Hk. rewrite /lift_array256 /lift_array1024 /map tP => />i Hi1 Hi2. rewrite !initiE //=. rewrite initiE //= 1:/#. rewrite !initiE //=. qed.

abbrev mul1x256v i v = mapv (mul1x256 i) v.

lemma polyvec_invntt_avx2_corr _r :
  phoare [Jkem1024_avx2.M.__polyvec_invntt :
     nttpackv (lift_array1024 r) = lift_array1024 _r /\ signed_bound1024_cxq r 0 1024 4 ==>
    mul1x256v (incoeff W16.modulus) (invnttv (lift_polyvec _r)) = lift_polyvec (res) /\
   signed_bound1024_cxq res 0 1024 1] = 1%r.

proc. 
unroll for 2.
wp;call (poly_invntt_avx2_corr (Array256.init (fun (i : int) => _r.[3 * 256 + i]))).
wp;call (poly_invntt_avx2_corr (Array256.init (fun (i : int) => _r.[2 * 256 + i]))).
wp;call (poly_invntt_avx2_corr (Array256.init (fun (i : int) => _r.[256 + i]))).
wp;call (poly_invntt_avx2_corr (Array256.init (fun (i : int) => _r.[0 + i]))).

skip =>  &m [#] /= H_r Hb.

rewrite !land_foo.
do split. 
+ move :Hb; rewrite /signed_bound_cxq /signed_bound1024_cxq => Hb; rewrite lift_nttpack /= lift_array_256_1024 /= nttpack_subarray1024 H_r tP => k kb.
  rewrite initiE 1:/# !mapiE 1,2:/# /= initiE /#. 
+ move  => k Hk; move :(Hb k); rewrite !initiE //= /#. 

move => r.  
rewrite lift_nttpack =>  [#] Hr H4.
do split. 
 + rewrite !lift_array_256_1024_k 1..2:/#; rewrite -H_r; rewrite nttpack_subarray1024_k //.
   by rewrite tP => />i Hi1 Hi2; rewrite !initiE //= /nttpackv /lift_array1024 /map !initiE //= 1..2:/# ifF 1:/# ifT 1:/# ifF 1:/# ifT 1:/#; congr; congr; rewrite /subarray256 tP => />j Hj1 Hj2; rewrite !initiE //= initiE //= 1:/# !initiE //= /#.
 + by rewrite /signed_bound_cxq => i Hi; rewrite !initiE //= !initiE //= /#.

move => [#] H5 H6 r0.
rewrite lift_nttpack =>  [#] Hr0 H7. 
rewrite !land_foo.
do split. 
 + rewrite !lift_array_256_1024_k 1..2:/#; rewrite -H_r; rewrite nttpack_subarray1024_k //.
    by rewrite tP => />i Hi1 Hi2; rewrite !initiE //= /nttpackv /lift_array1024 /map !initiE //= 1..2:/# ifF 1:/# ifF 1:/# ifT 1:/# ifF 1:/# ifF 1:/# ifT 1:/#;congr; congr; rewrite /subarray256 tP => />j Hj1 Hj2; rewrite !initiE //= initiE //= 1:/# !initiE //= 1,2:/#  !initiE //= /#.
 + rewrite /signed_bound_cxq => i Hi; rewrite !initiE 1:/# /=  !initiE 1:/# /= !initiE /#.

move => r1.  
rewrite lift_nttpack =>  [#] Hr1 H8.
rewrite !land_foo.
do split. 
 + rewrite !lift_array_256_1024_k 1..2:/#; rewrite -H_r; rewrite nttpack_subarray1024_k //.
   rewrite tP => />i Hi1 Hi2; rewrite !initiE //= /nttpackv /lift_array1024 /map !initiE //= 1..2:/# ifF 1:/# ifF 1:/# ifF 1:/# ifF 1:/# ifF 1:/# ifF 1:/# ; congr; congr; rewrite /subarray256 tP => />j Hj1 Hj2; rewrite !initiE //= initiE //= 1:/# initiE //= 1:/# !initiE //= 1,2:/# initiE //= /#.
 + by rewrite /signed_bound_cxq => i Hi; rewrite !initiE 1:/# /= !initiE 1:/# /=  !initiE 1:/# /= !initiE 1:/# /=/#.

move => r2 [#] Hr2 H10.  
do split. 
 + rewrite /lift_polyvec eq_vectorP => k Hk; rewrite !offunvE //=.
   rewrite /lift_array256 /subarray256 tP => i Hi.
   rewrite !mapiE //= initiE //= /nttpackv initiE //= 1:/# /nttv /invnttv. 
 + case (k=0).
  + move => ->; rewrite ifF 1:/# initiE //= 1:/# ifF 1:/# initiE //= 1:/# ifF 1:/# // initiE 1:/# /= ifT 1:/# //.
    move :Hr; rewrite /lift_array256 tP => /> Hr.  move :(Hr i); rewrite Hi /map !initiE //=. move => H12. 
    rewrite !mapvE /= !offunvE /= 1:/# initiE 1:/# /=.
    rewrite !offunvK /vclamp !ifT 1,2:/# /= /#.
 + case (k=1).
  + move => -> ?. rewrite ifF 1:/# initiE //= 1:/# ifF 1:/#.  
  + move :Hr0. rewrite !mapvE /lift_array256 tP => /> Hr0. move :(Hr0 i). 
    rewrite Hi /map !initiE //= 1:/# ifT 1:/# !offunvK /vclamp /= !offunvE /= 1:/# initiE /#.  
 + case (k=2).
  + move => -> ? ?. rewrite ifF 1:/# initiE //= 1:/# ifT 1:/# /=.  
  + move :Hr1. rewrite !mapvE /lift_array256 tP => /> Hr1. move :(Hr1 i). 
    rewrite Hi /map !initiE //=. rewrite !offunvK /vclamp /= !offunvE /= 1:/# initiE /#.  
 + move => *; have -> : k = 3 by smt().
  + rewrite ifT 1:/#.
  + move :Hr2. rewrite !mapvE /lift_array256 tP => /> Hr2. 
    move :(Hr2 i). rewrite Hi /map !initiE //=.
    rewrite !offunvK /vclamp /= !offunvE /= 1:/# initiE /#. 
  + rewrite /signed_bound1024_cxq => k Hk; rewrite initiE /= 1:/#.
 + case(768 <= k < 1024). smt().
 + move => *;case(512 <= k < 768). 
 + move => *; rewrite initiE /= /#.
 + move => *;case(256 <= k < 512). 
 + move => *; rewrite initiE 1:/# /= initiE /#.
 + move => *; rewrite initiE 1:/# /=  ifF 1:/# initiE //= initiE //= /#. 
qed.
 
