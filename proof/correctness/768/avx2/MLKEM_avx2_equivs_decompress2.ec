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




op decompress4_circuit(c : W4.t) : W16.t =
  truncateu16 (srl_32 (((zeroextu4_32 c) * W32.of_int 3329) + W32.of_int 8) (W32.of_int 4)).

op pcond_true4(_: W4.t) = true.

lemma poly_decompress_ll : islossless Jkem768_avx2.M._i_poly_decompress.
 proc; inline *;wp. cfold 9; unroll for ^while;auto.
qed.

lemma poly_decompress_corr_h (_a : W8.t Array128.t): 
    hoare [Jkem768_avx2.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 4 (decode4 _a) /\
             pos_bound256_cxq res 0 256 1 ].
proc; inline *.
proc change 4: (sliceget16_16_256 x16p 0); 1: by auto.
proc change 6: (sliceget32_8_256 x32p 0); 1: by auto.
proc change ^while.1 : (zeroextu128 (sliceget128_8_64 a ((8*i)*8)));1: by auto => /#.
proc change ^while.8 : (sliceset256_16_256 rp (i*256) f);1: by auto => /#.

cfold 9.
unroll for ^while.
cfold ^i<-.
wp -2.

bdep 4 16 [_a] [a] [rp] decompress4_circuit pcond_true4. 

(* BDEP pre conseq *)
+ by move => &hr />; rewrite allP /pcond_true4 /=. 

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= <- rr; rewrite /= !flatten1.
move => H1; have H2 := post_lane_commute_out_aligned (to_list a{hr}) (to_list rr) W8.w2bits W8.bits2w W4.w2bits W4.bits2w W16.w2bits W16.bits2w  decompress4_circuit 8 4 16 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
smt(Array128.size_to_list Array256.size_to_list W16.bits2wK BVA_Top_Bindings_W4_t.oflistP).

have H3 : 
   map decompress4_circuit (map W4.bits2w (chunk 4 (flatten (map W8.w2bits (to_list a{hr}))))) =
   map (W16.of_int \o asint) (to_list (decompress_poly 4 (decode4 a{hr}))).
+ rewrite /decode4 /decompress_poly Array256.map_of_list Array256.of_listK;1:smt(size_map Array256.size_to_list).
  rewrite /decode -map_comp  -(map_comp _ (decompress 4)) -(map_comp _ BS2Int.bs2int) /=.
  apply eq_in_map => x xb. 
  rewrite /(\o) /decompress4_circuit  -decompress_alt_decompress /decompress_alt //=.
  have := size_nth_chunk [] (flatten (map W8.w2bits (to_list a{hr}))).
  have := nthP witness (chunk 4 (flatten (map W8.w2bits (to_list a{hr})))) x.
  rewrite xb /= => He;elim He; rewrite size_chunk //= => k*. 
  have ? : size x = 4
   by  have := size_nth_chunk witness (flatten (map W8.w2bits (to_list a{hr}))) k 4 =>/= /#.
  rewrite qE to_uint_eq to_uint_truncateu16 /= /srl_32 /= of_uintK /=;congr;congr.
  rewrite to_uint_shr //= /zeroextu4_32 to_uintD_small /=;1: by rewrite of_uintK /=;smt(modz_small W4.to_uint_cmp pow2_4). 
  rewrite of_uintK /= modz_small;1:by smt( W4.to_uint_cmp pow2_4). 
  rewrite /to_uint bits2wK 1:/# incoeffK qE /=. 
  by smt(BS2Int.bs2int_ge0 BS2Int.bs2int_le2Xs modz_small W4.to_uint_cmp pow2_4). 

split.
+ rewrite tP => i ib.
  rewrite !mapiE 1,2:/# /= -get_to_list H2 H3 /decompress_poly.
  rewrite (nth_map witness);1: by smt(Array256.size_to_list).
  rewrite get_to_list /= /(\o) mapiE 1:/# /=.
  pose c := (decompress 4 (decode4 a{hr}).[i]).
  rewrite  /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  

rewrite /pos_bound256_cxq qE /= => k kb. 
rewrite -get_to_list  H2 H3 /decompress_poly.
  rewrite (nth_map witness);1: by smt(Array256.size_to_list).
  rewrite get_to_list /= /(\o) mapiE 1:/# /=.
  rewrite/= /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  
qed.

lemma poly_decompress_corr (_a : W8.t Array128.t): 
    phoare [Jkem768_avx2.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 4 (decode4 _a) /\
             pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_decompress_ll (poly_decompress_corr_h _a).

lemma poly_decompress_equiv  : 
    equiv [Jkem768_avx2.M._i_poly_decompress ~  Jkem768.M._i_poly_decompress  :
             a{1} = ap{2}
              ==>
             lift_array256 res{1} = lift_array256 res{2} /\
             pos_bound256_cxq res{1} 0 256 1 /\
             pos_bound256_cxq res{2} 0 256 1 ].
proc*.
ecall{1} (poly_decompress_corr a{1}).
ecall{2} (MLKEM_Poly.poly_decompress_corr ap{2}).
auto => /> &1; rewrite /lift_array256 => rr1 H H0 rr2 H1 H2.
rewrite tP in H.
rewrite tP in H1.
rewrite tP => i ib; rewrite H // H1 //.
qed.

