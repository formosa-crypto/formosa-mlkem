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

op decompress1_circuit(c : bool) : W16.t = 
  truncateu16 (srl_32 (((if c then W32.one else W32.zero) * W32.of_int 3329) + W32.one) (W32.of_int 1)).

op pcond_true (w: bool) =  true. 

lemma poly_frommsg_ll : islossless Jkem768_avx2.M._i_poly_frommsg 
 by proc; inline *;wp;while (0 <= i <= 32) (32-i);  by  auto =>  /> /#.

lemma poly_frommsg_corr_h (_m : W8.t Array32.t): 
    hoare [Jkem768_avx2.M._i_poly_frommsg :
             ap =  _m 
              ==>
             lift_array256 res = decompress_poly 1 (decode1 _m) /\
             pos_bound256_cxq res 0 256 1 ].
proc; inline *.
proc change 1: (sliceget16_16_256 hqx16_p1 0);1: by auto.
proc change 2: (VPBROADCAST_2u128 (sliceget4_32_128 pfm_shift_s 0));1: by auto.
proc change 3: (VPBROADCAST_2u128 (sliceget16_8_128 pfm_idx_s 0));1: by auto.
proc change 4: (sliceget32_8_256 ap 0);1: by auto.
proc change ^while.23 : (sliceset256_16_256 rp (2*i*256) g0); 1: by auto => /#. 
proc change ^while.24 : (sliceset256_16_256 rp ((2*i+1)*256) g1); 1: by auto => /#. 
proc change ^while.25 : (sliceset256_16_256 rp ((2*i+8)*256) g2); 1: by auto => /#. 
proc change ^while.26 : (sliceset256_16_256 rp ((2*i+9)*256) g3); 1: by auto => /#. 


unroll for ^while.
wp -1.

bdep 1 16 [_m] [ap] [rp] decompress1_circuit pcond_true. 

(* BDEP pre conseq *)
+ by move => &hr />; rewrite allP /pcond_true /=. 

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= <- rr; rewrite /= !flatten1.
move => H1; have H2 := post_lane_commute_out_aligned (to_list ap{hr}) (to_list rr) W8.w2bits W8.bits2w bool2bits bits2bool W16.w2bits W16.bits2w  decompress1_circuit 8 1 16 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
smt(Array32.size_to_list Array256.size_to_list W16.bits2wK BVA_Top_Pervasive_bool.oflistP).

have H3 : 
   map decompress1_circuit (map bits2bool (chunk 1 (flatten (map W8.w2bits (to_list ap{hr}))))) =
   map (W16.of_int \o asint) (to_list (decompress_poly 1 (decode1 ap{hr}))).
+ rewrite /decode1 /decompress_poly Array256.map_of_list Array256.of_listK;1:smt(size_map Array256.size_to_list).
  rewrite /decode -map_comp  -(map_comp _ (decompress 1)) -(map_comp _ BS2Int.bs2int) /=.
  apply eq_in_map => x xb.
  rewrite /(\o) /decompress1_circuit /bits2bool -decompress_alt_decompress /decompress_alt //=.
  have := size_nth_chunk [] (flatten (map W8.w2bits (to_list ap{hr}))).
  have := nthP witness (chunk 1 (flatten (map W8.w2bits (to_list ap{hr})))) x.
  rewrite xb /= => He;elim He; rewrite size_chunk //= => k*. 
  have ? : size x = 1 
   by  have := size_nth_chunk witness (flatten (map W8.w2bits (to_list ap{hr}))) k 1 =>/= /#.
  rewrite qE to_uint_eq to_uint_truncateu16 /= /srl_32 /= of_uintK /=;congr;congr.
  rewrite to_uint_shr //=.
  case (x = [true]).
  + move => -> /=;rewrite bs2int_cons /= BS2Int.bs2int_nil /= /b2i /=;smt(@Zq).
  case (x = [false]); last by smt(@List).
  by  move => -> /=;rewrite bs2int_cons /= BS2Int.bs2int_nil /= /b2i /=;smt(@Zq).

split.
+ rewrite tP => i ib.
  rewrite !mapiE 1,2:/# /= -get_to_list H2 H3 /decompress_poly.
  rewrite (nth_map witness);1: by smt(Array256.size_to_list).
  rewrite get_to_list /= /(\o) mapiE 1:/# /=.
  pose c := (decompress 1 (decode1 ap{hr}).[i]).
  rewrite /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  

rewrite /pos_bound256_cxq qE /= => k kb. 
rewrite -get_to_list  H2 H3 /decompress_poly.
  rewrite (nth_map witness);1: by smt(Array256.size_to_list).
  rewrite get_to_list /= /(\o) mapiE 1:/# /=.
  rewrite  /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  
qed.

(********** END BDEP PROOF OF FROMMSG **************)


lemma poly_frommsg_corr (_m : W8.t Array32.t): 
    phoare [Jkem768_avx2.M._i_poly_frommsg :
             ap =  _m 
              ==>
             lift_array256 res = decompress_poly 1 (decode1 _m) /\
             pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_frommsg_ll (poly_frommsg_corr_h _m).

equiv frommsgequiv_noperm  : 
 Jkem768_avx2.M._i_poly_frommsg ~  Jkem768.M._i_poly_frommsg :
    ={ap} ==> 
    lift_array256 res{1} = lift_array256 res{2} /\
    pos_bound256_cxq res{1} 0 256 1 /\ 
    pos_bound256_cxq res{2} 0 256 1.
proc*.
ecall {1} (poly_frommsg_corr ap{1}).
ecall {2} (MLKEM_Poly.poly_frommsg_corr ap{1}).
by auto => /> /#.
qed.
