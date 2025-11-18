require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array1536 Array1568 Array1408 Array1410 Array1024 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8 Array2.
from JazzEC require import WArray512 WArray384 WArray32 WArray16 WArray1410 WArray160.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem1024.
from JazzEC require import Jkem1024_avx2.
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

import GFq Rq Symmetric Symmetric1024 Serialization Serialization1024 Sampling VecMat VecMat1024 InnerPKE1024 MLKEM1024 Correctness1024 Fq SignedReductions.

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

from JazzEC require import WArray1568 WArray2048.
require import Bindings BitEncoding.
import BitChunking BS2Int.


lemma polyvec_decompress_ll :
   islossless Jkem1024_avx2.M.__i_polyvec_decompress.
by proc;inline *;unroll for ^while; do 4!(cfold ^inc<-; unroll for ^while);auto.
qed.
(********** BEGIN BDEP PROOF OF DECOMPRESS **************)

op decompress11_circuit(c : W11.t) : W16.t = 
  truncateu16 (srl_32 (((zeroextu11_32 c) * W32.of_int 3329) + W32.of_int 1024) (W32.of_int 11)).

op pcond_true11(_: W11.t) = true.

lemma init_id (rp0 : W8.t Array1568.t):
  (Array1408.init ("_.[_]" (Array1408.init ("_.[_]" rp0)))) =
    Array1408.init  ("_.[_]" rp0).
rewrite tP => *.
by rewrite initiE 1:/# /=.
qed.

lemma polyvec_decompress_corr_h (_aw : W8.t Array1408.t):
    hoare[ Jkem1024_avx2.M.__i_polyvec_decompress :
             Array1408.init (fun i => rp.[i]) = _aw ==> pos_bound1024_cxq res 0 1024 1 /\ lift_polyvec res = decompress_polyvec 11 (decode11_vec _aw)].
proc; inline *.
proc change 1: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change 2: (sliceget32_8_256 pvd_shufbidx_s 0); 1: by auto.
proc change 3: (sliceget8_32_256 pvd_srlvdidx_s 0); 1: by auto.
proc change 4: (sliceget4_64_256 pvd_srlvqidx_s 0); 1: by auto.
proc change 5: (sliceget16_16_256 pvd_shift_s 0); 1: by auto.
proc change ^while.^while.1 : (sliceget1568_8_256 rp ((352*k + 22*i)*8)); 1: by auto => /> /#.
proc change ^while.^while.10 : (sliceset1024_16_256 r ((16 * k + i)*256) f); 1: by auto => /> /#.
unroll for ^while.
cfold ^inc<-.
do 4!(unroll for ^while).
cfold ^i<-.
wp -3.
bdep 11 16 [_aw[Array1408.t:0]] [rp[Array1408.t:0]] [r] decompress11_circuit pcond_true11. 

(* BDEP pre conseq *)
+ move => &hr />; rewrite /pcond_true11 /=;split. 
  + rewrite allP /#. 
  have {2}<- := init_id rp{hr}; smt().

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= <- rr; rewrite /= !flatten1.
rewrite init_id.
move => H1; have H2 := post_lane_commute_out_aligned (to_list (Array1408.init ("_.[_]" rp{hr}))) (to_list rr) W8.w2bits W8.bits2w W11.w2bits W11.bits2w W16.w2bits W16.bits2w  decompress11_circuit 8 11 16 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
smt(Array1408.size_to_list Array1024.size_to_list W16.bits2wK BVA_Top_Bindings_W11_t.oflistP).

have H3 : 
   map decompress11_circuit (map W11.bits2w (chunk 11 (flatten (map W8.w2bits (to_list (Array1408.init ("_.[_]" rp{hr}))))))) =
   map (W16.of_int \o asint) (to_list (decompress_polyvec 11 (decode11_vec (Array1408.init ("_.[_]" rp{hr})))).[0] ++ 
                              to_list (decompress_polyvec 11 (decode11_vec (Array1408.init ("_.[_]" rp{hr})))).[1] ++ 
                              to_list (decompress_polyvec 11 (decode11_vec (Array1408.init ("_.[_]" rp{hr})))).[2] ++ 
                              to_list (decompress_polyvec 11 (decode11_vec (Array1408.init ("_.[_]" rp{hr})))).[3])%Vector.
+ rewrite /decode11_vec /decompress_polyvec !map_cat !setvE !offunvE 1..4:/# /= !offunvK /vclamp /kvec /= /subarray256 /=.
  apply (eq_from_nth witness).
  + rewrite !size_map !size_cat !size_map !size_iota /max /=.
     rewrite (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
     by rewrite size_map size_to_list /=.
  move => i.
  rewrite !size_map size_iota.
  rewrite (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
   rewrite size_map size_to_list /max  /= => ib.
  rewrite !nth_cat !size_map !size_cat !size_map !size_iota /max /=. 
  case (i <256).
  + move => ?;rewrite ifT 1:/# ifT 1:/#.
    rewrite (nth_map witness).
    + rewrite size_map size_chunk 1:/# (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
      rewrite size_map size_to_list /= /#.
    rewrite (nth_map []).
    + rewrite  size_chunk 1:/# (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
      rewrite size_map size_to_list /= /#.
    rewrite (nth_map witness _ ((W16.of_int \o asint))) /=.
    + rewrite size_to_list /= /#.
   rewrite /(\o) /= mapiE 1:/# /= initiE 1:/# /=.  
  rewrite /(\o) /decompress11_circuit -decompress_alt_decompress /decompress_alt //=.
  rewrite get_of_list 1:/# /= qE /=.
  have Hs := size_nth_chunk [] (flatten (map W8.w2bits (to_list(Array1408.init ("_.[_]" rp{hr}))))) i 11 _ _ => //.
  + rewrite (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
    by rewrite size_map size_to_list /#.
  rewrite to_uint_eq to_uint_truncateu16 /= /srl_32 /= of_uintK /=;congr;congr.
  have ? : 2^11 = 2048 by auto.
  rewrite to_uint_shr //= /zeroextu11_32 to_uintD_small /=;1: by rewrite of_uintK /=; smt(modz_small W11.to_uint_cmp). 
  rewrite of_uintK /= modz_small /=;1:by smt( W11.to_uint_cmp). 
  rewrite /to_uint bits2wK 1:/# incoeffK qE /= /decode (nth_map [] _ bs2int) /=.
  + rewrite size_chunk 1:/# size_BytesToBits size_to_list /= /#.
  by smt(BS2Int.bs2int_ge0 BS2Int.bs2int_le2Xs modz_small W11.to_uint_cmp). 

  case (i <512).
  + move => ??;rewrite ifT 1:/#.
    rewrite (nth_map witness).
    + rewrite size_map size_chunk 1:/# (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
      rewrite size_map size_to_list /= /#.
    rewrite (nth_map []).
    + rewrite  size_chunk 1:/# (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
      rewrite size_map size_to_list /= /#.
    rewrite (nth_map witness _ ((W16.of_int \o asint))) /=.
    + rewrite size_to_list /= /#.
   rewrite /(\o) /= mapiE 1:/# /= initiE 1:/# /=.  
  rewrite /(\o) /decompress11_circuit -decompress_alt_decompress /decompress_alt //=.
  rewrite get_of_list 1:/# /= qE /=.
  have Hs := size_nth_chunk [] (flatten (map W8.w2bits (to_list (Array1408.init ("_.[_]" rp{hr}))))) i 11 _ _ => //.
  + rewrite (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
    by rewrite size_map size_to_list /#.
  rewrite to_uint_eq to_uint_truncateu16 /= /srl_32 /= of_uintK /=;congr;congr.
  have ? : 2^11 = 2048 by auto.
  rewrite to_uint_shr //= /zeroextu11_32 to_uintD_small /=;1: by rewrite of_uintK /=; smt(modz_small W11.to_uint_cmp). 
  rewrite of_uintK /= modz_small;1:by smt( W11.to_uint_cmp). 
  rewrite /to_uint bits2wK 1:/# incoeffK qE /= /decode (nth_map [] _ bs2int) /=.
  + rewrite size_chunk 1:/# size_BytesToBits size_to_list /= /#.
  by smt(BS2Int.bs2int_ge0 BS2Int.bs2int_le2Xs modz_small W11.to_uint_cmp). 

  case (i <768).
  + move => ???.
    rewrite (nth_map witness).
    + rewrite size_map size_chunk 1:/# (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
      rewrite size_map size_to_list /= /#.
    rewrite (nth_map []).
    + rewrite  size_chunk 1:/# (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
      rewrite size_map size_to_list /= /#.
    rewrite (nth_map witness _ ((W16.of_int \o asint))) /=.
    + rewrite size_to_list /= /#.
   rewrite /(\o) /= mapiE 1:/# /= initiE 1:/# /=.  
  rewrite /(\o) /decompress11_circuit -decompress_alt_decompress /decompress_alt //=.
  rewrite get_of_list 1:/# /= qE /=.
  have Hs := size_nth_chunk [] (flatten (map W8.w2bits (to_list (Array1408.init ("_.[_]" rp{hr}))))) i 11 _ _ => //.
  + rewrite (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
    by rewrite size_map size_to_list /#.
  rewrite to_uint_eq to_uint_truncateu16 /= /srl_32 /= of_uintK /=;congr;congr.
  have ? : 2^11 = 2048 by auto.
  rewrite to_uint_shr //= /zeroextu11_32 to_uintD_small /=;1: by rewrite of_uintK /=; smt(modz_small W11.to_uint_cmp). 
  rewrite of_uintK /= modz_small;1:by smt( W11.to_uint_cmp). 
  rewrite /to_uint bits2wK 1:/# incoeffK qE /= /decode (nth_map [] _ bs2int) /=.
  + rewrite size_chunk 1:/# size_BytesToBits size_to_list /= /#.
  by smt(BS2Int.bs2int_ge0 BS2Int.bs2int_le2Xs modz_small W11.to_uint_cmp). 

  + move => ???.
    rewrite (nth_map witness).
    + rewrite size_map size_chunk 1:/# (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
      rewrite size_map size_to_list /= /#.
    rewrite (nth_map []).
    + rewrite  size_chunk 1:/# (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
      rewrite size_map size_to_list /= /#.
    rewrite (nth_map witness _ ((W16.of_int \o asint))) /=.
    + rewrite size_to_list /= /#.
   rewrite /(\o) /= mapiE 1:/# /= initiE 1:/# /=.  
  rewrite /(\o) /decompress11_circuit -decompress_alt_decompress /decompress_alt //=.
  rewrite get_of_list 1:/# /= qE /=.
  have Hs := size_nth_chunk [] (flatten (map W8.w2bits (to_list (Array1408.init ("_.[_]" rp{hr}))))) i 11 _ _ => //.
  + rewrite (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
    by rewrite size_map size_to_list /#.
  rewrite to_uint_eq to_uint_truncateu16 /= /srl_32 /= of_uintK /=;congr;congr.
  have ? : 2^11 = 2048 by auto.
  rewrite to_uint_shr //= /zeroextu11_32 to_uintD_small /=;1: by rewrite of_uintK /=; smt(modz_small W11.to_uint_cmp). 
  rewrite of_uintK /= modz_small;1:by smt( W11.to_uint_cmp). 
  rewrite /to_uint bits2wK 1:/# incoeffK qE /= /decode (nth_map [] _ bs2int) /=.
  + rewrite size_chunk 1:/# size_BytesToBits size_to_list /= /#.
  by smt(BS2Int.bs2int_ge0 BS2Int.bs2int_le2Xs modz_small W11.to_uint_cmp). 


split; last first.
+ rewrite eq_vectorP => i @/kvec ib.
  rewrite /lift_polyvec /decompress_polyvec !setvE !offunvE 1..2:/# /= !offunvK /vclamp /kvec /= ib /=. 
  case (3 = i) => Hi.
  + rewrite tP => k kb. 
    rewrite -Hi !mapiE 1,2:/# !initiE 1,2:/# /= /= -get_to_list H2 H3.
  rewrite (nth_map witness);1: by smt(Array256.size_to_list size_cat).
  rewrite (nth_cat witness).
  + rewrite !size_cat !size_to_list /= ifF 1:/# /decompress_polyvec.
    rewrite !setvE !offunvE 1:/# /=.
    rewrite initiE 1:/# /= mapiE 1:/# initiE 1:/# /=.
    rewrite get_of_list 1:/# /=.
  pose c := (decompress 11 (nth 0 (decode 11 (to_list (Array1408.init ("_.[_]" rp{hr})))) (768 + k))).
  rewrite of_sintK /= /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  

  case (2 = i) => Hi2.
  + rewrite tP => k kb. 
    rewrite -Hi2 !mapiE 1,2:/# !initiE 1,2:/# /= /= -get_to_list H2 H3.
  rewrite (nth_map witness);1: by smt(Array256.size_to_list size_cat).
  rewrite (nth_cat witness).
  + rewrite !size_cat !size_to_list /= ifT 1:/# /decompress_polyvec.
    rewrite !setvE !offunvE 1..3:/# /=  !offunvK /vclamp /= !ifT 1..6:/#.
  rewrite (nth_cat witness).
  + rewrite !size_cat !size_to_list /= ifF 1:/# /decompress_polyvec.
    rewrite  mapiE 1:/# initiE 1:/# /= initiE 1:/# /=.
    rewrite of_sintK /= /smod /= ifF;1:smt(@Zq).
  pose c := decompress 11 (nth 0 (decode 11 (to_list (Array1408.init ("_.[_]" rp{hr})))) (512 + k)).
  rewrite modz_small; smt(@Zq).  

  case (1 = i) => Hi1.
  + rewrite tP => k kb. 
    rewrite -Hi1 !mapiE 1,2:/# !initiE 1,2:/# /= /= -get_to_list H2 H3.
  rewrite (nth_map witness);1: by smt(Array256.size_to_list size_cat).
  rewrite (nth_cat witness).
  + rewrite !size_cat !size_to_list /= ifT 1:/# /decompress_polyvec.
    rewrite !setvE !offunvE 1..3:/# /= !offunvK /vclamp /= !ifT 1..6:/#.
  rewrite (nth_cat witness).
  + rewrite !size_cat !size_to_list /= ifT 1:/# /decompress_polyvec.
  rewrite (nth_cat witness).
  + rewrite !size_to_list /= ifF 1:/# /decompress_polyvec.
    rewrite  mapiE 1:/# initiE 1:/# /= initiE 1:/# /=.
    rewrite of_sintK /= /smod /= ifF;1:smt(@Zq).
    pose c := (decompress 11 (nth 0 (decode 11 (to_list (Array1408.init ("_.[_]" rp{hr})))) (256 + k))).
  rewrite modz_small; smt(@Zq).  

  have Hi3 :(0 = i) by smt().
  + rewrite tP => k kb.
    rewrite -Hi3 /= !mapiE 1,2:/# /= initiE 1:/# /= -( Array1024.get_to_list rr) H2 H3.
  rewrite (nth_map witness);1: by smt(Array256.size_to_list size_cat).
  rewrite (nth_cat witness).
  + rewrite !size_cat !size_to_list /= ifT 1:/# /decompress_polyvec.
    rewrite !setvE !offunvE 1..3:/# /= !offunvK /vclamp /= !ifT 1..6:/#.
  rewrite (nth_cat witness).
  + rewrite !size_cat !size_to_list /= ifT 1:/# /decompress_polyvec.
  rewrite (nth_cat witness).
  + rewrite !size_to_list /= ifT 1:/# /decompress_polyvec.
    rewrite  mapiE 1:/# initiE 1:/# /= initiE 1:/# /=.
    rewrite of_sintK /= /smod /= ifF;1:smt(@Zq).
    pose c := (decompress 11 (nth 0 (decode 11 (to_list (Array1408.init ("_.[_]" rp{hr})))) (k))).
  rewrite modz_small; smt(@Zq).  


rewrite /pos_bound1024_cxq qE /= => k kb. 
rewrite -get_to_list  H2 H3 /decompress_poly.
rewrite (nth_map witness);1: by smt(size_cat Array256.size_to_list).
rewrite (nth_cat witness) !size_cat !size_to_list /=. 
rewrite (nth_cat witness) !size_cat !size_to_list /=. 
rewrite (nth_cat witness)  !size_to_list /=. 
rewrite /decompress_polyvec !setvE /= !offunvE 1..4:/# /= !offunvK /= /vclamp /kvec/=.
case (k < 256).
+ move => *; rewrite ifT 1:/# .
  rewrite mapiE 1:/# initiE 1:/# /=.
  rewrite of_sintK /= /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  
case (k < 512).
+ move => *.
  rewrite mapiE 1:/# initiE 1:/# /=.
  rewrite of_sintK /= /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  
case (k < 768).
+ move => *.
  rewrite mapiE 1:/# initiE 1:/# /=.
  rewrite of_sintK /= /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  
+ move => *.
  rewrite mapiE 1:/# initiE 1:/# /=.
  rewrite of_sintK /= /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  

qed.


lemma polyvec_decompress_corr (_aw : W8.t Array1408.t):
    phoare[ Jkem1024_avx2.M.__i_polyvec_decompress :
             Array1408.init (fun i => rp.[i]) = _aw ==> pos_bound1024_cxq res 0 1024 1 /\ lift_polyvec res = decompress_polyvec 11 (decode11_vec _aw)] = 1%r
 by conseq polyvec_decompress_ll (polyvec_decompress_corr_h _aw).

lemma polyvec_decompress_equiv  :
    equiv [Jkem1024_avx2.M.__i_polyvec_decompress ~  Jkem1024.M.__i_polyvec_decompress  :
             Array1408.init(fun i => arg{1}.`2.[i]) =arg{2}.`2
              ==>
             lift_array1024 res{1} = lift_array1024 res{2} /\
             pos_bound1024_cxq res{1} 0 1024 1 /\
             pos_bound1024_cxq res{2} 0 1024 1 ].
proc*. 
ecall {2} (MLKEM_PolyVec.polyvec_decompress_corr ap{2}) => /=.
ecall {1} (polyvec_decompress_corr (Array1408.init (fun (i : int) => rp{1}.[i]))).
+ auto => /> &1 r1 ? <- rr ?; rewrite /lift_array1024 /lift_polyvec /lift_array256 /subarray256 !eq_vectorP /kvec tP =>H i ib.
  rewrite !mapiE 1,2:/# /=.
  case (0<= i < 256) => Hi0.
  + have  := (H 0 _);1:by auto.
    rewrite !offunvE /= /kvec //= tP => Hi.
    by have := (Hi i Hi0); rewrite !mapiE 1,2:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  case (256<= i < 512) => Hi1.
  + have  := (H 1 _);1:by auto.
    rewrite !offunvE /= /kvec //= tP => Hi.
    have := (Hi (i - 256) _); 1:smt(). 
    by rewrite !mapiE 1,2:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  case (512<= i < 768) => Hi2.
  + have  := (H 2 _);1:by auto.
    rewrite !offunvE /= /kvec //= tP => Hi.
    have := (Hi (i - 512) _); 1:smt(). 
    by rewrite !mapiE 1,2:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  have Hi3 :  (768<= i < 1024)  by smt().
    have  := (H 3 _);1:by auto.
    rewrite !offunvE /= /kvec //= tP => Hi.
    have := (Hi (i - 768) _); 1:smt(). 
    by rewrite !mapiE 1,2:/# /= initiE 1:/# /= initiE 1:/# /= /#.
qed.
