require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array1152 Array1088 Array960 Array1410 Array768 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8 Array2.
from JazzEC require import WArray512 WArray128 WArray384 WArray32 WArray16 WArray1410 WArray160 WArray960 WArray1152 WArray1536.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem768.
from JazzEC require import Jkem768_avx2.
require import MLKEM_PolyVec_avx2_prevec.
require import MLKEM_Poly_avx2_prevec.
require import NTT_avx2 NTT_avx2_ntt NTT_avx2_invntt.
require import Fqmul_avx2 Red_x16_avx2.
require import Fq.
require import NTT_Fq.
require import MLKEM_Poly.
require import MLKEM_PolyVec.
require import MLKEM_avx2_auxlemmas.
require import MLKEM_Poly_avx2_proof.
require import MLKEM_PolyVec_avx2_proof.
require import MLKEM_Poly_avx2_vec.
require import MLKEM_PolyVec_avx2_vec.
require import MLKEM_InnerPKE.
require import MLKEMFCLib.

import GFq Rq Symmetric Symmetric768 Serialization Serialization768 Sampling VecMat VecMat768 InnerPKE768 MLKEM768 Correctness768 Fq SignedReductions.

import Zq.
import ZModP.
import Fq_avx2.
import NTT_Avx2.
import MLKEM_Poly.
import MLKEM_PolyVec.

import MLKEM_PolyAVX.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import MLKEM_PolyVecAVXVec.

require import Bindings.


import KMatrix Vector.

from JazzEC require import WArray1088 WArray2048.
require import Bindings BitEncoding.
import BitChunking BS2Int.


op compress4_circuit(a : W16.t) : W4.t = 
   if (a \ult W16.of_int 3329) then  
   truncateu32_4 (srl_32 ((sll_32 (zeroextu32 a) (W32.of_int 4) + W32.of_int 1665) * W32.of_int 80635) (W32.of_int 28))
   else 
   truncateu32_4 (srl_32 ((sll_32 (zeroextu32 (W16_sub a (W16.of_int 3329))) (W32.of_int 4) + W32.of_int 1665) * W32.of_int 80635) (W32.of_int 28)).  

lemma i_poly_compress_corr_ll : islossless Jkem768_avx2.M._i_poly_compress.
proof.
proc; inline *.
cfold 13.
do 2!(unroll for ^while).
auto.
qed.

lemma i_poly_compress_corr_h _aw  : 
    hoare [Jkem768_avx2.M._i_poly_compress  :
             pos_bound256_cxq a 0 256 2 /\
             a = _aw
              ==>
             res.`1 = encode4 (compress_poly 4 (lift_array256 _aw)) 
             ].
proof.
proc; inline *.
proc change 3: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change ^while.1: (sliceget256_16_256 rp0 (i0*256));1: by auto => /#.
proc change ^while.9: (sliceset256_16_256 rp0 (i0*256) r);1: by auto => /#.
proc change 8: (sliceget16_16_256 x16p 0); 1: by auto.
proc change 12: (sliceget8_32_256 pc_permidx_s 0); 1: by auto.
proc change ^while{2}.1: (sliceget256_16_256 a (4*i*256));1: by auto => /#.
proc change ^while{2}.2: (sliceget256_16_256 a ((4*i+1)*256));1: by auto => /#.
proc change ^while{2}.3: (sliceget256_16_256 a ((4*i+2)*256));1: by auto => /#.
proc change ^while{2}.4: (sliceget256_16_256 a ((4*i+3)*256));1: by auto => /#.
proc change ^while{2}.23 : (sliceset128_8_256 rp  (32*i*8) f0);1: by auto => /#.

cfold 13.
do 2!(unroll for ^while).
cfold ^i0<-.
wp -3.
bdep 16 4 [_aw] [a] [rp] compress4_circuit pcond_reduced. 

(* BDEP pre conseq *)
+ move => &hr />; rewrite flatten1 /= pre_lane_commute_in_aligned 1:/# //=.
  rewrite allP /pos_bound256_cxq /= => Hb. 
  rewrite /pcond_reduced /= /tolist /= => x.
  rewrite  mkseqP => He;elim He => /= i [ib?]; rewrite ultE /=.
  have := Hb i; rewrite ib /= qE /=.
  rewrite /to_sint /smod /=.
  smt(W16.to_uint_cmp).

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= H0 <- rr; rewrite /= !flatten1.
move => H1.

apply (inj_eq Array128.to_list Array128.to_list_inj).
apply (flatten_map_eq _ _ W8.w2bits 8 _ W8.w2bits_inj W8.size_w2bits);1:smt().
have -> := post_lane_commute_in_aligned (to_list a{hr}) (to_list rr) W16.w2bits W16.bits2w W8.w2bits W8.bits2w W4.w2bits W4.bits2w  compress4_circuit 16 4 8 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
    smt(Array128.size_to_list Array256.size_to_list W16.bits2wK BVA_Top_Bindings_W4_t.oflistP).

rewrite output_pack_128_8. 
+ rewrite (EclibExtra.size_flatten' 4);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=.

congr.
rewrite /compress4_circuit /compress_poly -map_comp -map_comp -map_comp /(\o) /=.  
apply (eq_from_nth witness); 1: by rewrite !size_map //.
rewrite size_map size_iota /max /= => i ib; rewrite !(nth_map witness) //=;1,2:smt(size_iota).
rewrite nth_iota 1:/# -(BVA_Top_Bindings_W4_t.oflistP (BS2Int.int2bs 4 (map (compress 4) (lift_array256 a{hr})).[i])); 1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Bindings_W4_t.ofintP /lift_array256;rewrite !mapiE;1,2:smt().

rewrite /truncateu4 to_uint_eq.
(* This is now the equivalence betwen specs. It's made slightly more verbose
   because the impl circuit is only proved correct wrt compress for values
   in the q range. *)
rewrite ultE /=. 
case (to_uint a{hr}.[i] < 3329) => /= *.
+ rewrite -compress_impl_small //=;1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).     
  by rewrite /srl_32 /sll_32 /(`<<`) /(`>>`) !of_uintK /= /#. 
have := H0;rewrite /pos_bound256_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))   /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -compress_impl_small //=;1:by smt().
by rewrite /srl_32 /sll_32 /(`<<`) /(`>>`) !of_uintK /= /#. 
qed.


lemma i_poly_compress_corr _aw  : 
    phoare [Jkem768_avx2.M._i_poly_compress  :
             pos_bound256_cxq a 0 256 2 /\
             a = _aw
              ==>
             res.`1 = encode4 (compress_poly 4 (lift_array256 _aw)) 
             ] = 1%r
 by conseq i_poly_compress_corr_ll (i_poly_compress_corr_h _aw).

equiv compressequiv_1 : 
 Jkem768_avx2.M._i_poly_compress ~  Jkem768.M._i_poly_compress :
     pos_bound256_cxq a{1} 0 256 2 /\
     pos_bound256_cxq a{2} 0 256 2 /\
    lift_array256 a{1} = lift_array256 a{2} 
    ==> 
    res.`1{1} = res.`1{2}.
proc*.
ecall {1} (i_poly_compress_corr a{1}).
ecall {2} (MLKEM_Poly.i_poly_compress_corr a{2}).
auto => /> /#.
qed.
