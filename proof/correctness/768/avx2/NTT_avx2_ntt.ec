require import AllCore List Int IntDiv CoreMap Real Number Ring StdOrder BitEncoding.

from Jasmin require import JModel.
from JazzEC require import Array256 Array128  Array16.
from JazzEC require import Array256 Array128 Array32 Array16 Array768 Array2304.

require import MLKEMFCLib.
require import MLKEM_PolyVec.
require import NTT_Fq.
require import AVX2_Ops.

from CryptoSpecs require import GFq Rq Serialization VecMat Correctness768.
import VecMat768 Serialization768.

import MLKEM_PolyVec.
import Zq IntOrder BitReverse.
import PolyVec PolyMat.

require import NTT_avx2 NTT_AVX_j NTT_AVX_j_ntt.
from JazzEC require import Jkem768_avx2 Jkem768.
require import NTT_AVX_Fq_basemul NTT_AVX_Fq_ntt NTT_AVX_j_invntt.

import NTT_Avx2.

lemma perm_ntt_nttpackE ['a] (p: 'a Array256.t):
  perm_ntt NTT_AVX_Fq_basemul.perm_nttpack128 p = NTT_Avx2.nttpack p.
proof.
by apply Array256.all_eq_eq; rewrite /all_eq 
   /perm_ntt /perm_nttpack128 /NTT_Avx2.nttpack /=.
qed.

phoare poly_basemul_avx2_ph _a _b:
 [Jkem768_avx2.M._poly_basemul:
    (lift_array256 ap) = NTT_Avx2.nttunpack _a /\ signed_bound_cxq ap 0 256 2
    /\ (lift_array256 bp) = NTT_Avx2.nttunpack _b /\ signed_bound_cxq bp 0 256 2
   ==>
    (lift_array256 res)
    = NTT_Avx2.nttunpack (scale (basemul (_a) (_b)) (incoeff 169))
    /\ signed_bound_cxq res 0 256 1 ] = 1%r.
proof. 
conseq poly_basemul_avx2_eq (__basemul_ph (NTT_Avx2.nttunpack _a) (NTT_Avx2.nttunpack _b)) => //.
 move => /> &1 *.
 by exists ((lift_array256 rp{1}), (lift_array256 ap{1}), (lift_array256 bp{1})) => //=.
move=> /> &m <- Hb.
move: (basemul_avx2E (NTT_Avx2.nttunpack _a) (NTT_Avx2.nttunpack _b)).
rewrite !perm_ntt_nttpackE !NTT_Avx2.nttunpackK => <-.
by rewrite /scale -map_pack NTT_Avx2.nttpackK.
qed.

lemma poly_ntt_avx2_corr _r :
  phoare [Jkem768_avx2.M._poly_ntt :
    rp = _r /\ signed_bound_cxq rp 0 256 2 ==>
    ntt (lift_array256 _r) = lift_array256 (NTT_Avx2.nttpack res) /\
    pos_bound256_cxq res 0 256 2] = 1%r.
proof.
conseq poly_ntt_avx2_eq (ntt_avx_spec (lift_array256 _r)).
 by move => &1 [-> H] /#.
move=> &1 &2 [-> H] <-.
by rewrite NTT_Avx2.lift_nttpack perm_ntt_nttpackE.
qed.

import KMatrix.
import Vector.
lemma polyvec_ntt_avx2_corr _r :
  phoare [Jkem768_avx2.M.__polyvec_ntt :
     r = _r /\ signed_bound768_cxq r 0 768 2==>
    nttv (lift_polyvec _r) = lift_polyvec (NTT_Avx2.nttpackv res) /\
   pos_bound768_cxq res 0 768 2] = 1%r.
proc. 
unroll for 2.
wp;call (poly_ntt_avx2_corr (Array256.init (fun (i : int) => _r.[2 * 256 + i]))).
wp;call (poly_ntt_avx2_corr (Array256.init (fun (i : int) => _r.[256 + i]))).
wp;call (poly_ntt_avx2_corr (Array256.init (fun (i : int) => _r.[0 + i]))).
skip => &hr [#] ->  H; do split; 1:by smt(Array256.initiE).
move => H0 r [#] H1 H2; do split. 
+ by rewrite tP => k kb; rewrite !initiE //= !initiE //= /#.
+ rewrite /signed_bound_cxq => k kb; rewrite !initiE //= !initiE //= /#.
move => [#] H3 H4 r0 H5 H6. do split.
+ rewrite tP => k kb; rewrite !initiE //= initiE //= 1: /# ifF 1:/# initiE //= /#.
+ rewrite /signed_bound_cxq => k kb; rewrite !initiE //= initiE //= 1: /# ifF 1:/# initiE //= /#.
move => [#] H7 H8 r1 H9 H10. do split.
+ rewrite /nttv /lift_polyvec eq_vectorP => k kb.
  rewrite mapvE !offunvE //= KMatrix.Vector.offunvK /vclamp kb /=.
  rewrite /lift_array256 /subarray256 tP => i ib.
  rewrite mapiE //= initiE //= /NTT_Avx2.nttpackv initiE //= 1:/#.
  move :NTT_Avx2.nttunpack_bnd NTT_Avx2.nttpack_bnd; rewrite !allP => pb upb.
  case(k = 0).
   + move => ->. rewrite ifT //= /NTT_Avx2.nttpack /subarray256 initiE //=. 
     pose a:=NTT_Avx2.nttpack_idx.[i].
     rewrite initiE //= 1:/# initiE //= 1:/# ifF 1:/# initiE //= 1:/#.
     rewrite ifF 1:/# initiE //= 1:/# ifT 1:/#.
     move : H1; rewrite /lift_array256 /NTT_Avx2.nttpack tP => H1.
     rewrite (H1 i ib) mapiE //= initiE /#.
  case(k = 1).
   + move => -> *. rewrite ifF 1:/# ifT 1:/# /NTT_Avx2.nttpack /subarray256 initiE //=. 
     pose a:=NTT_Avx2.nttpack_idx.[i].
     rewrite initiE //= 1:/# initiE //= 1:/# ifF 1:/# initiE //= 1:/#.
     rewrite ifT 1:/#.
     move : H5; rewrite /lift_array256 /NTT_Avx2.nttpack tP => [#] H5 ?.
     rewrite (H5 i ib) mapiE //= initiE /#.
  move => *; have -> : k = 2 by smt().
  rewrite ifF 1:/# ifF 1:/# /NTT_Avx2.nttpack /subarray256 initiE //=. 
  pose a:=NTT_Avx2.nttpack_idx.[i].
  rewrite initiE //= 1:/# initiE //= 1:/# ifT 1:/#.
  move : H9; rewrite /lift_array256 /NTT_Avx2.nttpack tP => [#] H9 ?.
  rewrite (H9 i ib) mapiE //= initiE /#.  

rewrite /pos_bound768_cxq => k kb; rewrite initiE //=.
  case(512 <= k < 768). smt().
  move => *;case(256 <= k < 512). 
  + move => *; rewrite initiE //=. smt(). 
  move => *; rewrite initiE //= ifF 1:/# initiE //= /#. 
qed.
