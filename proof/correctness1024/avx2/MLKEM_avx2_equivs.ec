require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array1536 Array1568 Array1408 Array1410 Array1024 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8 Array2 Array1 Array3.
from JazzEC require import WArray512 WArray32 WArray16 WArray1410 WArray160.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem1024.
from JazzEC require import Jkem1024_avx2.
require import MLKEM_PolyVec_avx2_prevec.
require import MLKEM_Poly_avx2_prevec.
require import NTT_avx2.
require import Fq_avx2.
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

module DecompressBridge = {
   proc __i_polyvec_decompress(r : W16.t Array1024.t, rp : W8.t Array1408.t, rrp : W8.t Array160.t) :  W16.t Array1024.t = {
      var rp0 :  W8.t Array1568.t;
      rp0 <- init_1568_8 (fun i => if 0 <= i < 1408 then rp.[i] else rrp.[i-1408]);
      r <@ Jkem1024_avx2.M.__i_polyvec_decompress(r,rp0);
      return r;
  } 
}.

import KMatrix Vector.

from JazzEC require import WArray1568 WArray2048.
require import Bindings BitEncoding.
import BitChunking BS2Int.



(********** BEGIN BDEP PROOF OF DECOMPRESS **************)

op decompress11_circuit(c : W11.t) : W16.t = 
  truncateu16 (srl_32 (((zeroextu11_32 c) * W32.of_int 3329) + W32.of_int 1024) (W32.of_int 11)).

op pcond_true11(_: W11.t) = true.

lemma polyvec_decompress_bridge_ll : islossless DecompressBridge.__i_polyvec_decompress.
 proc; inline *;wp. 
unroll for ^while.
cfold ^inc<-.
do 4!(unroll for ^while).
auto.
qed.



lemma polyvec_decompress_bridge_corr_h (_aw : W8.t Array1408.t):
    hoare[ DecompressBridge.__i_polyvec_decompress :
             rp = _aw ==> pos_bound1024_cxq res 0 1024 1 /\ lift_polyvec res = decompress_polyvec 11 (decode11_vec _aw)].
proc; inline *.
proc change 4: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change 5: (sliceget32_8_256 pvd_shufbidx_s 0); 1: by auto.
proc change 6: (sliceget8_32_256 pvd_srlvdidx_s 0); 1: by auto.
proc change 7: (sliceget4_64_256 pvd_srlvqidx_s 0); 1: by auto.
proc change 8: (sliceget16_16_256 pvd_shift_s 0); 1: by auto.
proc change ^while.^while.1 : (sliceget1568_8_256 rp1 ((352*k + 22*i)*8)); 1: by auto => /> /#.
proc change ^while.^while.10 : (sliceset1024_16_256 r0 ((16 * k + i)*256) f); 1: by auto => /> /#.
unroll for ^while.
cfold ^inc<-.
do 4!(unroll for ^while).
cfold ^i<-.
wp -4.
bdep 11 16 [_aw] [rp] [r0] decompress11_circuit pcond_true11. 


(* BDEP pre conseq *)
+ by move => &hr />; rewrite allP /pcond_true11 /=. 

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= <- rr; rewrite /= !flatten1.
move => H1; have H2 := post_lane_commute_out_aligned (to_list rp{hr}) (to_list rr) W8.w2bits W8.bits2w W11.w2bits W11.bits2w W16.w2bits W16.bits2w  decompress11_circuit 8 11 16 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
smt(Array1408.size_to_list Array1024.size_to_list W16.bits2wK BVA_Top_Bindings_W11_t.oflistP).

have H3 : 
   map decompress11_circuit (map W11.bits2w (chunk 11 (flatten (map W8.w2bits (to_list rp{hr}))))) =
   map (W16.of_int \o asint) (to_list (decompress_polyvec 11 (decode11_vec rp{hr})).[0] ++ 
                              to_list (decompress_polyvec 11 (decode11_vec rp{hr})).[1] ++ 
                              to_list (decompress_polyvec 11 (decode11_vec rp{hr})).[2] ++ 
                              to_list (decompress_polyvec 11 (decode11_vec rp{hr})).[3])%Vector.
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
  have Hs := size_nth_chunk [] (flatten (map W8.w2bits (to_list rp{hr}))) i 11 _ _ => //.
  + rewrite (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
    by rewrite size_map size_to_list /#.
  rewrite to_uint_eq to_uint_truncateu16 /= /srl_32 /= of_uintK /=;congr;congr.
  have ? : 2^11 = 2048 by auto.
  rewrite to_uint_shr //= /zeroextu11_32 to_uintD_small /=;1: by rewrite of_uintK /=; smt(modz_small W11.to_uint_cmp). 
  rewrite of_uintK /= modz_small;1:by smt( W11.to_uint_cmp). 
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
  have Hs := size_nth_chunk [] (flatten (map W8.w2bits (to_list rp{hr}))) i 11 _ _ => //.
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
  have Hs := size_nth_chunk [] (flatten (map W8.w2bits (to_list rp{hr}))) i 11 _ _ => //.
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
  have Hs := size_nth_chunk [] (flatten (map W8.w2bits (to_list rp{hr}))) i 11 _ _ => //.
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
  pose c := (decompress 11 (nth 0 (decode 11 (to_list rp{hr})) (768 + k))).
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
  pose c := decompress 11 (nth 0 (decode 11 (to_list rp{hr})) (512 + k)).
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
    pose c := (decompress 11 (nth 0 (decode 11 (to_list rp{hr})) (256 + k))).
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
    pose c := (decompress 11 (nth 0 (decode 11 (to_list rp{hr})) (k))).
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


lemma polyvec_decompress_bridge_corr (_aw : W8.t Array1408.t):
    phoare[ DecompressBridge.__i_polyvec_decompress :
             rp = _aw ==> pos_bound1024_cxq res 0 1024 1 /\ lift_polyvec res = decompress_polyvec 11 (decode11_vec _aw)] = 1%r
 by conseq polyvec_decompress_bridge_ll (polyvec_decompress_bridge_corr_h _aw).

lemma polyvec_decompress_equiv  :
    equiv [Jkem1024_avx2.M.__i_polyvec_decompress ~  Jkem1024.M.__i_polyvec_decompress  :
             Array1408.init(fun i => arg{1}.`2.[i]) =arg{2}.`2
              ==>
             lift_array1024 res{1} = lift_array1024 res{2} /\
             pos_bound1024_cxq res{1} 0 1024 1 /\
             pos_bound1024_cxq res{2} 0 1024 1 ].
proc*. 
transitivity {1} {r0<@ DecompressBridge.__i_polyvec_decompress(r,Array1408.init(fun i => rp.[i]), Array160.init(fun i => rp.[i+1408]));}
    (={rp,r} ==> ={r0})
    (Array1408.init(fun i => rp{1}.[i]) = ap{2}
      ==> lift_array1024 r0{1} = lift_array1024 r{2} /\
             pos_bound1024_cxq r0{1} 0 1024 1 /\
             pos_bound1024_cxq r{2} 0 1024 1); 1,2:smt().
inline {2} 1;sim;auto => /> &1. 
+ rewrite /init_1568_8 tP => i*.
  rewrite initiE 1:/# /=.
  case (0 <= i < 1408) => *; rewrite initiE 1:/# /= /#.
  
ecall {2} (polyvec_decompress_corr ap{2}) => /=.
ecall {1} (polyvec_decompress_bridge_corr (Array1408.init (fun (i : int) => rp{1}.[i]))).
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

(***********************)


(********** BEGIN BDEP PROOF OF COMPRESS  **************)

op compress11_circuit(a : W16.t) : W11.t = 
   if (a \ult W16.of_int 3329) then  
   truncate64_11 (srl_64 ((sll_64 (zeroextu64 a) (W64.of_int 11) + W64.of_int 1664) * W64.of_int 645084) (W64.of_int 31))
   else 
   truncate64_11 (srl_64 ((sll_64 (zeroextu64 (W16_sub a (W16.of_int 3329))) (W64.of_int 11) + W64.of_int 1664) * W64.of_int 645084) (W64.of_int 31)).
z
lemma polyvec_compress_avx2_corr_h (_aw : W16.t Array1024.t):
    hoare[ Jkem1024_avx2.M.__i_polyvec_compress  :
             a = _aw /\
             pos_bound1024_cxq a 0 1024 2 ==> 
      Array1408.init (fun i => res.[i])  = encode11_vec (compress_polyvec 11 (lift_polyvec _aw))].
proof.
proc; inline *.
proc change ^while.1: (init_256_16 (fun i => r.[256*i0+i]));1: by auto.
proc change ^while.2: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change ^while.^while.1: (sliceget256_16_256 rp0 (i1*256));1: by auto => /#.
proc change ^while.^while.9: (sliceset256_16_256 rp0 (i1*256) r0);1: by auto => /#.
proc change ^while.6: (init_1024_16 (fun (i_0 : int) => if 256 * i0 <= i_0 < 256 * i0 + 256 then aux.[i_0 - 256 * i0] else r.[i_0]));1: by auto.
proc change 5: (sliceget16_16_256 jvx16 0); 1: by auto.
proc change ^while{2}.1: (sliceget1024_16_256 a (i*256));1: by auto => /#.
proc change 12: (sliceget4_64_256 pvc_srlvqidx 0); 1: by auto.
proc change 13: (sliceget32_8_256 pvc_shufbidx_s 0); 1: by auto.
proc change ^while{2}.22 : (sliceset1410_8_128 rp  (22*i*8) t0);1: by auto => /#.
proc change ^while{2}.23 : (sliceset1410_8_64 rp  ((22*i+16)*8) (truncateu64 t1));1: by auto => /#.

unroll for ^while.
do 4!(unroll for ^while).
cfold ^inc<-.
unroll for ^while.
cfold ^i0<-.
cfold ^i1<-.
wp -4.
admitted. (* dependency error. something wrong in bound circuits? *)
(* 
bdep 16 11 [_aw] [a] [rp[Array1408.t:0]] compress11_circuit pcond_reduced. 

(* BDEP pre conseq *)
+ move => &hr />; rewrite flatten1 /= pre_lane_commute_in_aligned 1:/# //=.
  rewrite allP /pos_bound1024_cxq /= => Hb. 
  rewrite /pcond_reduced /= /tolist /= => x.
  rewrite  mkseqP => He;elim He => /= i [ib?]; rewrite ultE /=.
  have := Hb i; rewrite ib /= qE /=.
  rewrite /to_sint /smod /=.
  smt(W16.to_uint_cmp).

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= H0 <- rr; rewrite /= !flatten1.
move => H1.

apply (inj_eq Array1408.to_list Array1408.to_list_inj).
apply (flatten_map_eq _ _ W8.w2bits 8 _ W8.w2bits_inj W8.size_w2bits);1:smt().
have -> := post_lane_commute_in_aligned (to_list a{hr}) (to_list rr) W16.w2bits W16.bits2w W8.w2bits W8.bits2w W11.w2bits W11.bits2w  compress11_circuit 16 11 8 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
    smt(Array1408.size_to_list Array1024.size_to_list W16.bits2wK BVA_Top_Bindings_W11_t.oflistP).

rewrite output_pack_1408_8. 
+ rewrite (EclibExtra.size_flatten' 11);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=.

congr.
rewrite /compress11_circuit /compress_polyvec /fromarray256  -map_comp -map_comp -map_comp /(\o) /=.  
apply (eq_from_nth witness); 1: by rewrite !size_map //.
rewrite size_map size_iota /max /= => i ib; rewrite !(nth_map witness) //=;1,2:smt(size_iota).
rewrite nth_iota 1:/# mapiE 1:/# initiE 1:/# /= /lift_polyvec /=.
case (0<=i<256).
+ move => ? /=.
  rewrite  !getvE offunvE 1:/# /= -(BVA_Top_Bindings_W11_t.oflistP (int2bs 11 (compress 11 (lift_array256 (subarray256 a{hr} 0)).[i]))); 1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Bindings_W11_t.ofintP /lift_array256 /subarray256 !mapiE 1:/# /= initiE 1:/# /=. 

rewrite /truncate64_11 to_uint_eq.
(* This is now the equivalence betwen specs. It's made slightly more verbose
   because the impl circuit is only proved correct wrt compress for values
   in the q range. *)
rewrite ultE /=. 
case (to_uint a{hr}.[i] < 3329) => /= *.
+ rewrite -Fq.compress_impl_large //=; 1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).     
  rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 
have := H0;rewrite /pos_bound1024_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -Fq.compress_impl_large //=;1:by smt().
by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 

case (256<=i<512).
+ move => ?? /=.
  rewrite  !getvE offunvE 1:/# /= -(BVA_Top_Bindings_W11_t.oflistP (int2bs 11 (compress 11 (lift_array256 (subarray256 a{hr} 1)).[i-256]))); 1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Bindings_W11_t.ofintP /lift_array256 /subarray256 !mapiE 1:/# /= initiE 1:/# /=. 

rewrite /truncate64_11 to_uint_eq.
(* This is now the equivalence betwen specs. It's made slightly more verbose
   because the impl circuit is only proved correct wrt compress for values
   in the q range. *)
rewrite ultE /=. 
case (to_uint a{hr}.[i] < 3329) => /= *.
+ rewrite -Fq.compress_impl_large //=; 1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).     
  rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 
have := H0;rewrite /pos_bound1024_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -Fq.compress_impl_large //=;1:by smt().
by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 

case (512<=i<768).
+ move => ??? /=.
  rewrite  !getvE offunvE 1:/# /= -(BVA_Top_Bindings_W11_t.oflistP (int2bs 11 (compress 11 (lift_array256 (subarray256 a{hr} 2)).[i-512]))); 1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Bindings_W11_t.ofintP /lift_array256 /subarray256 !mapiE 1:/# /= initiE 1:/# /=. 

rewrite /truncate64_11 to_uint_eq.
(* This is now the equivalence betwen specs. It's made slightly more verbose
   because the impl circuit is only proved correct wrt compress for values
   in the q range. *)
rewrite ultE /=. 
case (to_uint a{hr}.[i] < 3329) => /= *.
+ rewrite -Fq.compress_impl_large //=; 1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).     
  rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 
have := H0;rewrite /pos_bound1024_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -Fq.compress_impl_large //=;1:by smt().
by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 

 move => ??? /=.
  rewrite  !getvE offunvE 1:/# /= -(BVA_Top_Bindings_W11_t.oflistP (int2bs 11 (compress 11 (lift_array256 (subarray256 a{hr} 3)).[i-768]))); 1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Bindings_W11_t.ofintP /lift_array256 /subarray256 !mapiE 1:/# /= initiE 1:/# /=. 

rewrite /truncate64_10 to_uint_eq.
(* This is now the equivalence betwen specs. It's made slightly more verbose
   because the impl circuit is only proved correct wrt compress for values
   in the q range. *)
rewrite ultE /=. 
case (to_uint a{hr}.[i] < 3329) => /= *.
+ rewrite -Fq.compress_impl_large //=; 1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).     
  rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 
have := H0;rewrite /pos_bound1024_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -Fq.compress_impl_large //=;1:by smt().
by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 

qed.
*)

(********** END BDEP PROOF OF COMPRESS **************)


lemma polyvec_compress_avx2_ll : islossless Jkem1024_avx2.M.__i_polyvec_compress.
proc. cfold 11. unroll for ^while; wp => /=. 
inline *;unroll for ^while; do 4!(unroll for ^while);auto.
qed.

lemma polyvec_compress_avx2_corr (_aw : W16.t Array1024.t):
    phoare[ Jkem1024_avx2.M.__i_polyvec_compress  :
             a = _aw /\
             pos_bound1024_cxq a 0 1024 2 ==> 
      Array1408.init (fun i => res.[i])  = encode11_vec (compress_polyvec 11 (lift_polyvec _aw))] = 1%r
   by conseq polyvec_compress_avx2_ll (polyvec_compress_avx2_corr_h _aw).


equiv compressequivvec  : 
 Jkem1024_avx2.M.__i_polyvec_compress ~  Jkem1024.M.__i_polyvec_compress :
     pos_bound1024_cxq a{1} 0 1024 2 /\
     pos_bound1024_cxq a{2} 0 1024 2 /\
    lift_array1024 a{1} = lift_array1024 a{2} 
    ==> 
    res{2} = Array1408.init (fun i => res{1}.[i]).
proc*.
print MLKEM_PolyVec.
ecall {2} (i_polyvec_compress_corr a{2}) => /=.
ecall {1} (polyvec_compress_avx2_corr a{1}).
+ auto => /> &1 &2 ??? rr;rewrite !tP => H k kb. 
   rewrite initiE 1:/# /= H 1:/# /encode11_vec get_of_list 1:/#;do 4!(congr). 
   rewrite eq_vectorP => i ib.
   rewrite tP => j jb.
   smt(liftarrayvector).
qed.

(***************)

(********** BEGIN BDEP PROOF OF DECOMPRESS **************)

op decompress5_circuit(c : W5.t) : W16.t =
  truncateu16 (srl_32 (((zeroextu5_32 c) * W32.of_int 3329) + W32.of_int 16) (W32.of_int 5)).
op pcond_true5(_: W5.t) = true.

lemma poly_decompress_ll : islossless Jkem1024_avx2.M._i_poly_decompress.
 proc; inline *;wp. cfold 5; unroll for ^while;auto. 
qed.

lemma poly_decompress_corr_h (_a : W8.t Array160.t): 
    hoare [Jkem1024_avx2.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 5 (decode5 _a) /\
             pos_bound256_cxq res 0 256 1 ].
proc; inline *.
proc change 1: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change 2: (sliceget32_8_256 pd_jshufbidx 0); 1: by auto.
proc change 3: (sliceget16_16_256 pd_mask_s 0); 1: by auto.
proc change 4: (sliceget16_16_256 pd_shift_s 0); 1: by auto.
proc change ^while.1 : (zeroextu128 (sliceget160_8_64 a ((10*i)*8)));1: by auto => /#.
proc change ^while.10 : (sliceset256_16_256 rp (i*256) f);1: by auto => /#.
proc change ^while.2: (sliceget160_8_16 a ((10*i+8)*8));1: by auto => /#.

cfold 5.
unroll for ^while.
cfold ^i<-.
wp -2.

bdep 5 16 [_a] [a] [rp] decompress5_circuit pcond_true5. 

(* BDEP pre conseq *)
+ by move => &hr />; rewrite allP /pcond_true5 /=. 

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= <- rr; rewrite /= !flatten1.
move => H1; have H2 := post_lane_commute_out_aligned (to_list a{hr}) (to_list rr) W8.w2bits W8.bits2w W5.w2bits W5.bits2w W16.w2bits W16.bits2w  decompress5_circuit 8 5 16 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
smt(Array160.size_to_list Array256.size_to_list W16.bits2wK BVA_Top_Bindings_W5_t.oflistP).

have H3 : 
   map decompress5_circuit (map W5.bits2w (chunk 5 (flatten (map W8.w2bits (to_list a{hr}))))) =
   map (W16.of_int \o asint) (to_list (decompress_poly 5 (decode5 a{hr}))).
+ rewrite /decode5 /decompress_poly Array256.map_of_list Array256.of_listK;1:smt(size_map Array256.size_to_list).
  rewrite /decode -map_comp  -(map_comp _ (decompress 5)) -(map_comp _ BS2Int.bs2int) /=.
  apply eq_in_map => x xb. 
  rewrite /(\o) /decompress5_circuit  -decompress_alt_decompress /decompress_alt //=.
  have := size_nth_chunk [] (flatten (map W8.w2bits (to_list a{hr}))).
  have := nthP witness (chunk 5 (flatten (map W8.w2bits (to_list a{hr})))) x.
  rewrite xb /= => He;elim He; rewrite size_chunk //= => k*. 
  have ? : size x = 5
   by  have := size_nth_chunk witness (flatten (map W8.w2bits (to_list a{hr}))) k 5 =>/= /#.
  rewrite qE to_uint_eq to_uint_truncateu16 /= /srl_32 /= of_uintK /=;congr;congr.
  rewrite to_uint_shr //= /zeroextu5_32 to_uintD_small /=;1: by rewrite of_uintK /=;smt(modz_small W5.to_uint_cmp pow2_5). 
  rewrite of_uintK /= modz_small;1:by smt( W5.to_uint_cmp pow2_5). 
  rewrite /to_uint bits2wK 1:/# incoeffK qE /=. 
  by smt(BS2Int.bs2int_ge0 BS2Int.bs2int_le2Xs modz_small W5.to_uint_cmp pow2_5). 

split.
+ rewrite tP => i ib.
  rewrite !mapiE 1,2:/# /= -get_to_list H2 H3 /decompress_poly.
  rewrite (nth_map witness);1: by smt(Array256.size_to_list).
  rewrite get_to_list /= /(\o) mapiE 1:/# /=.
  pose c := (decompress 5 (decode5 a{hr}).[i]).
  rewrite  /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  

rewrite /pos_bound256_cxq qE /= => k kb. 
rewrite -get_to_list  H2 H3 /decompress_poly.
  rewrite (nth_map witness);1: by smt(Array256.size_to_list).
  rewrite get_to_list /= /(\o) mapiE 1:/# /=.
  rewrite/= /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  
qed.
(********** END BDEP PROOF OF DECOMPRESS **************)

lemma poly_decompress_corr (_a : W8.t Array160.t): 
    phoare [Jkem1024_avx2.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 5 (decode5 _a) /\
             pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_decompress_ll (poly_decompress_corr_h _a).

lemma poly_decompcress_equiv  : 
    equiv [Jkem1024_avx2.M._i_poly_decompress ~  Jkem1024.M._i_poly_decompress  :
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


(********** BEGIN BDEP PROOF OF COMPRESS  **************)
op compress5_circuit(a : W16.t) : W5.t = 
   if (a \ult W16.of_int 3329) then  
   truncateu32_5 (srl_32 ((sll_32 (zeroextu32 a) (W32.of_int 5) + W32.of_int 1664) * W32.of_int 40318) (W32.of_int 27))
   else 
   truncateu32_5 (srl_32 ((sll_32 (zeroextu32 (W16_sub a (W16.of_int 3329))) (W32.of_int 5) + W32.of_int 1664) * W32.of_int 40318) (W32.of_int 27)).  

lemma i_poly_compress_corr_ll : islossless Jkem1024_avx2.M._i_poly_compress.
proof.
proc; inline *.
cfold 13.
do 2!(unroll for ^while).
auto.
qed.

lemma i_poly_compress_corr_h _aw  : 
    hoare [Jkem1024_avx2.M._i_poly_compress  :
             pos_bound256_cxq a 0 256 2 /\
             a = _aw
              ==>
             res.`1 = encode5 (compress_poly 5 (lift_array256 _aw)) 
             ].
proof.
proc; inline *.
proc change 2: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change ^while.1: (sliceget256_16_256 rp0 (i0*256));1: by auto => /#.
proc change ^while.9: (sliceset256_16_256 rp0 (i0*256) r);1: by auto => /#.
proc change 6: (sliceget16_16_256 jvx16 0); 1: by auto.
proc change 12: (sliceget32_8_256 pc_shufbidx_s 0); 1: by auto.
proc change ^while{2}.1: (sliceget256_16_256 a (2*i*256));1: by auto => /#.
proc change ^while{2}.2: (sliceget256_16_256 a ((2*i+1)*256));1: by auto => /#.
proc change ^while{2}.18 : (sliceset160_8_128 rp  (20*i*8) t0);1: by auto => /#.
proc change ^while{2}.19 : (sliceset160_8_32 rp  ((20*i+16)*8) (truncateu32 t1));1: by auto => /#.

cfold 13.
do 2!(unroll for ^while).
cfold ^i0<-.
wp -3.
admitted. (* In the reference implementation I needed to add a mask before or-ing
             to allow bdep to conclude there was no dependence. This also probably
             needs to be done here *)
(*

bdep 16 5 [_aw] [a] [rp] compress5_circuit pcond_reduced. 

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

apply (inj_eq Array160.to_list Array160.to_list_inj).
apply (flatten_map_eq _ _ W8.w2bits 8 _ W8.w2bits_inj W8.size_w2bits);1:smt().
have -> := post_lane_commute_in_aligned (to_list a{hr}) (to_list rr) W16.w2bits W16.bits2w W8.w2bits W8.bits2w W5.w2bits W5.bits2w  compress5_circuit 16 5 8 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
    smt(Array160.size_to_list Array256.size_to_list W16.bits2wK BVA_Top_Bindings_W5_t.oflistP).

rewrite output_pack_160_8. 
+ rewrite (EclibExtra.size_flatten' 5);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=.

congr.
rewrite /compress5_circuit /compress_poly -map_comp -map_comp -map_comp /(\o) /=.  
apply (eq_from_nth witness); 1: by rewrite !size_map //.
rewrite size_map size_iota /max /= => i ib; rewrite !(nth_map witness) //=;1,2:smt(size_iota).
rewrite nth_iota 1:/# -(BVA_Top_Bindings_W5_t.oflistP (BS2Int.int2bs 5 (map (compress 5) (lift_array256 a{hr})).[i])); 1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Bindings_W5_t.ofintP /lift_array256;rewrite !mapiE;1,2:smt().

rewrite /truncateu4 to_uint_eq.
(* This is now the equivalence betwen specs. It's made slightly more verbose
   because the impl circuit is only proved correct wrt compress for values
   in the q range. *)
rewrite ultE /=. 
case (to_uint a{hr}.[i] < 3329) => /= *.
+ rewrite -compress_impl5 //=;1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).     
  by rewrite /srl_32 /sll_32 /(`<<`) /(`>>`) !of_uintK /= /#. 
have := H0;rewrite /pos_bound256_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -compress_impl5 //=;1:by smt().
by rewrite /srl_32 /sll_32 /(`<<`) /(`>>`) !of_uintK /= /#. 
qed.
*)
(********** END BDEP PROOF OF COMPRESS **************)

lemma i_poly_compress_corr _aw  : 
    phoare [Jkem1024_avx2.M._i_poly_compress  :
             pos_bound256_cxq a 0 256 2 /\
             a = _aw
              ==>
             res.`1 = encode5 (compress_poly 5 (lift_array256 _aw)) 
             ] = 1%r
 by conseq i_poly_compress_corr_ll (i_poly_compress_corr_h _aw).

equiv compressequiv_1 : 
 Jkem1024_avx2.M._i_poly_compress ~  Jkem1024.M._i_poly_compress :
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


(********** BEGIN BDEP PROOF OF FROMBYTES **************)

from JazzEC require import WArray384.

op frombytes_circuit(c : W12.t) : W16.t = 
  zeroextu16 c.


lemma polyvec_frombytes_ll : islossless Jkem1024_avx2.M.__i_polyvec_frombytes.
proc; inline *;wp. 
  while (0 <= i <= 4) (4-i); last by  auto =>  /> /#.
move => *. cfold 3. unroll for ^while;auto => /> /#.
qed.

lemma polyvec_frombytes_corr_h (_aw : W8.t Array1536.t): 
    hoare [Jkem1024_avx2.M.__i_polyvec_frombytes  :
             a = _aw
              ==>
             lift_array1024 res = nttunpackv (map incoeff (decode12_vec _aw))  /\
             pos_bound1024_cxq res 0 1024  2].
proc; inline *.
proc change ^while.1: (init_256_16 (fun (i_0 : int) => r.[256 * i + i_0])); 1: by auto.
proc change ^while.2: (init_384_8 (fun (i_0 : int) => a.[384 * i + i_0])  ); 1: by auto.
proc change ^while.3: (sliceget16_16_256 maskx16 0); 1: by auto.
proc change ^while.^while.1 : (sliceget384_8_256 ap (192*i0*8)); 1: by auto => /> /#.
proc change ^while.^while.2 : (sliceget384_8_256 ap ((192*i0+32)*8)); 1: by auto => /> /#.
proc change ^while.^while.3 : (sliceget384_8_256 ap ((192*i0+64)*8)); 1: by auto => /> /#.
proc change ^while.^while.4 : (sliceget384_8_256 ap ((192*i0+96)*8)); 1: by auto => /> /#.
proc change ^while.^while.5 : (sliceget384_8_256 ap ((192*i0+128)*8)); 1: by auto => /> /#.
proc change ^while.^while.6 : (sliceget384_8_256 ap ((192*i0+160)*8)); 1: by auto => /> /#.
proc change ^while.^while.101 : (sliceset256_16_256 rp (8*i0 *256) t6);1: by auto => /> /#.
proc change ^while.^while.102 : (sliceset256_16_256 rp ((8*i0+1) *256) t7);1: by auto => /> /#.
proc change ^while.^while.103 : (sliceset256_16_256 rp ((8*i0+2) *256) t8);1: by auto => /> /#.
proc change ^while.^while.104 : (sliceset256_16_256 rp ((8*i0+3) *256) t9);1: by auto => /> /#.
proc change ^while.^while.105 : (sliceset256_16_256 rp ((8*i0+4) *256) t4);1: by auto => /> /#.
proc change ^while.^while.106 : (sliceset256_16_256 rp ((8*i0+5) *256) t10);1: by auto => /> /#.
proc change ^while.^while.107 : (sliceset256_16_256 rp ((8*i0+6) *256) t11);1: by auto => /> /#.
proc change ^while.^while.108 : (sliceset256_16_256 rp ((8*i0+7) *256) tt);1: by auto => /> /#.
proc change ^while.7: (init_1024_16 (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux.[i_0 - 256 * i] else r.[i_0])); 1: by auto.

unroll for ^while.
do 4!(unroll for ^while).
cfold ^i0<-.
wp -2. 
admitted. (* Lanes are modulo a permutation. *)
(* 
bdep 12 16 [_aw] [a] [r] frombytes_circuit pcond_true12. 

(* BDEP pre conseq *)
+ by move => &hr />; rewrite allP /pcond_true12 /=. 

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= <- rr; rewrite /= !flatten1.
move => H1; have H2 := post_lane_commute_out_aligned (to_list ap{hr}) (to_list rr) W8.w2bits W8.bits2w W12.w2bits W12.bits2w W16.w2bits W16.bits2w  frombytes_circuit 8 12 16 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
smt(Array1536.size_to_list Array1024.size_to_list W16.bits2wK BVA_Top_Bindings_W12_t.oflistP).

  have /=? := decode_range_vec 0 (to_list ap{hr}) 12 _ _;1,2:smt(Array1536.size_to_list).

have H3 : 
  map frombytes_circuit (map W12.bits2w (chunk 12 (flatten (map W8.w2bits (to_list ap{hr}))))) =
   to_list (map W16.of_int  (decode12_vec ap{hr})).
+ rewrite /decode12_vec Array1024.map_of_list Array1024.of_listK;1: smt(size_map). 
  rewrite /decode -map_comp -(map_comp _ BS2Int.bs2int) /=.
  apply eq_in_map => x xb.
  rewrite /(\o) /frombytes_circuit /zeroextu16.
  have ? : size x = 12 by smt(@BitChunking).
  congr;rewrite /to_uint W12.bits2wK;1 :  by smt(@BitChunking).
  done.


split.
+ rewrite tP => i ib.
  rewrite !mapiE 1,2:/# /= /= -get_to_list H2 H3 /decode12.
  rewrite get_to_list mapiE 1:/# get_of_list 1:/# of_sintK /=.
  by rewrite /smod /= ifF 1:/# modz_small 1:/#.

  rewrite /pos_bound1024_cxq qE /= => k kb. 
  have /=? := decode_range_vec witness (to_list ap{hr}) 12 _ _;1..2:smt(Array1536.size_to_list).
  rewrite -get_to_list  H2 H3 /decode12_vec.
  rewrite get_to_list /= get_of_list 1:/#.
  rewrite (nth_map witness) 1:/#.  
rewrite of_sintK /= /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  
qed.

*)

(********** END BDEP PROOF OF FROMBYTES **************)

lemma polyvec_frombytes_corr (_aw : W8.t Array1536.t): 
    phoare [Jkem1024_avx2.M.__i_polyvec_frombytes  :
             a = _aw
              ==>
             lift_array1024 res = nttunpackv (map incoeff (decode12_vec _aw))  /\
             pos_bound1024_cxq res 0 1024  2] = 1%r
  by conseq polyvec_frombytes_ll (polyvec_frombytes_corr_h _aw).

lemma polyvec_frombytes_equiv :
    equiv [Jkem1024_avx2.M.__i_polyvec_frombytes ~Jkem1024.M.__i_polyvec_frombytes :
             a{1}=ap{2} ==>
             lift_array1024 res{1} = nttunpackv (lift_array1024 res{2}) /\
             pos_bound1024_cxq res{1} 0 1024 2 /\
             pos_bound1024_cxq res{2} 0 1024 2 ].
proc*.
ecall{1} (polyvec_frombytes_corr a{1}).
ecall{2} (MLKEM_PolyVec.polyvec_frombytes_corr ap{2}).
auto => /> &2 rr1 -> ? rr2 -> ? //.
qed.


lemma subequiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
    equiv [Jkem1024_avx2.M._poly_sub ~Jkem1024.M._poly_sub :
      lift_array256 ap{1} = lift_array256 ( ap{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
      signed_bound_cxq ap{2} 0 256 ab /\ 
      signed_bound_cxq bp{2} 0 256 bb /\
      signed_bound_cxq ap{1} 0 256 ab /\ 
      signed_bound_cxq bp{1} 0 256 bb
           ==> lift_array256 res{1} = lift_array256  ( res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab + bb) /\
               signed_bound_cxq res{2} 0 256 (ab + bb) 
              ].
move => boundab boundbb; proc => /=.
exists* ap{2}, bp{2}. elim* => _ap2 _bp2.
while {2} (#pre /\ 0<= i{2} <= 256 /\ forall k, 0<=k<i{2} => rp{2}.[k] = _ap2.[k] -_bp2.[k]) (256 -  i{2}); 
 1: by move => &1 ?; auto => />;smt(Array256.set_neqiE Array256.set_eqiE).

exists* ap{1}, bp{1}. elim* => _ap1 _bp1.
while {1} (#pre /\ 0<= i{1} <= 16 /\ forall k, 0<=k<16*i{1} => rp{1}.[k] = _ap1.[k] -_bp1.[k]) (16 - i{1}); last first.
+ auto => />.
  move => &1 &2 H H0 H1 H2 H3 H4; split; 1: smt(). 
  move => i1 res1; split; 1: smt().
  move => ??? res1v; split; 1: smt().
  move => i2 res2; split; 1: smt().
  move => ??? res2v.
  do split; first last.
  + do 2!( move : H3 H4;rewrite /signed_bound_cxq => H3 H4 k kb; rewrite res1v // 1:/#; 
    move : (H3 k _) (H4 k _)=> // ;
    rewrite /b16 qE to_sintB_small /= /#).
  + do 2!( move : H1 H2;rewrite /signed_bound_cxq => H1 H2 k kb; rewrite res2v // 1:/#; 
    move : (H1 k _) (H2 k _)=> // ;
    rewrite /b16 qE to_sintB_small /= /#).
  rewrite /lift_array256 tP => k kbl; rewrite !mapiE //= res1v 1:/# res2v 1: /#.
  rewrite !to_sintB_small => /=.
  + do 2!( move : H3 H4;rewrite /signed_bound_cxq => H3 H4; 
    move : (H3 k _) (H4 k _)=> // ;
    rewrite /b16 qE /= /#).
  + do 2!( move : H1 H2;rewrite /signed_bound_cxq => H1 H2; 
    move : (H1 k _) (H2 k _)=> // ;
    rewrite /b16 qE /= /#).
   move : H H0; rewrite /lift_array256 !tP => H H0.
   move : (H k _); 1: smt(); rewrite !mapiE //=.  
   move : (H0 k _); 1: smt(); rewrite !mapiE //=.  
   rewrite -!eq_incoeff /#.

move => &1 ?; auto => /> => &2 ??????????; do split; 1,2,4: smt().

move => k kbl kbh; rewrite initiE /= 1: /#.
case (k < 16*i{2}); 1: by move => kdif; rewrite set_get_diff // /#. 
move => *; rewrite set_get_eq //= 1,2:/#.
rewrite /VPSUB_16u16; rewrite map2bE 1: /# /=.
congr.
+ rewrite get256E /= ifT 1:/# /= !initiE /= 1,2:/# !initiE 1,2:/# /=.
  rewrite -(W16.to_uintK (_ap1.[k])) of_uint_pack2  /= -iotaredE /=.
  have -> : (32 * i{2} + 2 * (k %% 16)) %/ 2 = k by smt().
  have -> : (32 * i{2} + 2 * (k %% 16)) %% 2 = 0 by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %/ 2 = k by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %% 2 = 1 by smt().
  rewrite !bits8_div //=. 
  congr.
  apply W2u8.Pack.ext_eq => i ib.
  case (i = 0); 1:  by move => -> /=; apply W8.to_uint_eq; smt(). 
  move => *; have -> : i = 1 by smt().
  apply W8.to_uint_eq; smt(). 

congr.
rewrite get256E /= ifT 1:/# /= !initiE /= 1,2:/# !initiE 1,2:/# /=.
  rewrite -(W16.to_uintK (_bp1.[k])) of_uint_pack2  /= -iotaredE /=.
  have -> : (32 * i{2} + 2 * (k %% 16)) %/ 2 = k by smt().
  have -> : (32 * i{2} + 2 * (k %% 16)) %% 2 = 0 by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %/ 2 = k by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %% 2 = 1 by smt().
  rewrite !bits8_div //=. 
  congr.
  apply W2u8.Pack.ext_eq => i ib.
  case (i = 0); 1:  by move => -> /=; apply W8.to_uint_eq; smt(). 
  move => *; have -> : i = 1 by smt().
  apply W8.to_uint_eq; smt(). 
qed.

lemma to_sintInj : injective W16.to_sint. 
rewrite /injective /to_sint /smod /=. 
move => x y. move => HHH. have : to_uint x = to_uint y; last by smt(W16.to_uint_eq).
move : HHH; move : (W16.to_uint_cmp x); move :  (W16.to_uint_cmp y) => /=; smt().
qed.

equiv frommontequiv : 
 Jkem1024_avx2.M._poly_frommont ~  Jkem1024.M._poly_frommont :
    lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 2 /\ 
    signed_bound_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_frommont(rp); }
     (={rp} ==> ={r}) 
     (lift_array256  rp{1} = nttunpack (lift_array256 rp{2}) ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    signed_bound_cxq r{1} 0 256 2 /\ 
    signed_bound_cxq r{2} 0 256 2); 1,2: smt(). 
symmetry. call prevec_eq_poly_frommont. auto => />.

ecall{2} (MLKEM_Poly.poly_frommont_corr (map W16.to_sint rp{2})).
ecall{1} (MLKEM_PolyAVX.poly_frommont_corr (map W16.to_sint rp{1})).

auto => />.
move => &1 &2 Hvals r1 H.

split.  
+ by move => k kbl kbh ;rewrite mapE //= initiE //=.
move => H1 _r0 H0.
move : H; rewrite tP => H.

move : H H0;  rewrite qE /Fq.SignedReductions.R /= => H H0.

do split. 
+ rewrite tP => k kb.
  rewrite /lift_array256 /= mapiE //= /nttunpack initiE //=.
  pose a:= nttunpack_idx.[k].
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  move : (H k kb); rewrite !mapiE //= => ->.
  move : (H0 (nttunpack_idx.[k]) _). move : nttunpack_bnd; rewrite allP /#. 
  rewrite -/a => ->.
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{1}.[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{1}.[k] * 1353 && to_sint rp{1}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  move => [corr11 corr12].
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{2}.[a] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{2}.[a] * 1353 && to_sint rp{2}.[a] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  move => [corr21 corr22].
  move : Hvals; rewrite /lift_array256 tP => Hvals.
  move : (Hvals k kb).
  rewrite /lift_array256 /= mapiE //= /nttunpack initiE //=.
  rewrite -/a.
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  rewrite -!Zq.eq_incoeff /= /#.

+ rewrite /signed_bound_cxq /= => k kb.
  move : (H k kb); rewrite !mapiE //= => HH.
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{1}.[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{1}.[k] * 1353 && to_sint rp{1}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  smt().

+ rewrite /signed_bound_cxq /= => k kb.
  move : (H0 k kb); rewrite !mapiE //= => HH.
  move : (Fq.SignedReductions.SREDCp_corr ((map W16.to_sint rp{2}).[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  rewrite !mapiE //=.
  have -> /= : -109084672 <= to_sint rp{2}.[k] * 1353 && to_sint rp{2}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  smt().

qed.

equiv reduceequiv : 
 Jkem1024_avx2.M.__poly_reduce ~  Jkem1024.M.__poly_reduce :
    lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    pos_bound256_cxq res{1} 0 256 2 /\ 
    pos_bound256_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_reduce(rp); }
     (={rp} ==> ={r}) 
     (lift_array256 rp{1} = nttunpack (lift_array256 rp{2}) ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    pos_bound256_cxq r{1} 0 256 2 /\ 
    pos_bound256_cxq r{2} 0 256 2);1,2: smt(). 
symmetry. call prevec_eq_poly_reduce. auto => />.

ecall{2} (MLKEM_Poly.poly_reduce_corr (lift_array256 rp{2})).
ecall{1} (MLKEM_PolyAVX.poly_reduce_corr (lift_array256 rp{1})).

auto => />.
move => &1 &2; rewrite /lift_array256 tP => Hvals r1; rewrite tP => r1val r1rng r2; rewrite tP => r2val r2rng.

rewrite tP => k kb ;rewrite mapE //= initiE //=.
rewrite /nttunpack initiE //=.
pose a:= nttunpack_idx.[k].
rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
move : (Hvals k kb). rewrite mapiE //=.
rewrite /nttunpack initiE //= -/a mapiE //=. move : nttunpack_bnd; rewrite allP /#.
smt(Array256.mapiE nttunpack_bnd Array256.allP).
qed.

equiv reduceequiv_noperm : 
 Jkem1024_avx2.M.__poly_reduce ~  Jkem1024.M.__poly_reduce :
    lift_array256 arg{1} = lift_array256 arg{2} ==> 
    lift_array256 res{1} = lift_array256 res{2} /\
    pos_bound256_cxq res{1} 0 256 2 /\ 
    pos_bound256_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_reduce(rp); }
     (={rp} ==> ={r}) 
     (lift_array256 rp{1} =  (lift_array256 rp{2}) ==> 
    lift_array256 r{1} =  (lift_array256 r{2}) /\
    pos_bound256_cxq r{1} 0 256 2 /\ 
    pos_bound256_cxq r{2} 0 256 2); 1,2: smt(). 
symmetry. call prevec_eq_poly_reduce. auto => />.

ecall{2} (MLKEM_Poly.poly_reduce_corr (lift_array256 rp{2})).
ecall{1} (MLKEM_PolyAVX.poly_reduce_corr (lift_array256 rp{1})).

auto => />.
move => &1 &2; rewrite /lift_array256 tP => Hvals r1; rewrite tP => r1val r1rng r2; rewrite tP => r2val r2rng.

rewrite tP => k kb ;rewrite mapE //= initiE //=.
rewrite !mapiE /=;1: smt().  
move : (Hvals k kb). rewrite mapiE //=.
rewrite  mapiE //=. 
smt(Array256.mapiE).
qed.


import Zq. 

require import NTT_AVX_j.

equiv basemulequiv : 
 Jkem1024_avx2.M._poly_basemul ~Jkem1024.M._poly_basemul :
    lift_array256 ap{1} = nttunpack (lift_array256 ap{2}) /\
    lift_array256 bp{1} = nttunpack (lift_array256 bp{2}) /\
    signed_bound_cxq ap{1} 0 256 2 /\  
    signed_bound_cxq bp{1} 0 256 2 /\
    signed_bound_cxq ap{2} 0 256 2 /\  
    signed_bound_cxq bp{2} 0 256 2
                              ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 1 /\ 
    signed_bound_cxq res{2} 0 256 2.
proof.
proc*; simplify.
ecall{2} (poly_basemul_correct (lift_array256 ap{2}) (lift_array256 bp{2})).
ecall{1} (poly_basemul_avx2_ph (nttpack (lift_array256 ap{1})) (nttpack (lift_array256  bp{1}))).
auto => />.
move => &1 &2 /> E1 E2 *. 
rewrite !nttpackK => /> r1 -> Hb1 r2 Hb2 ->.
by rewrite E1 E2 !nttunpackK.
qed.

lemma poly_add_corr_avx_impl ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 => 
  forall _a _b,
      phoare[ Mprevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
   by move => abb bbb _a _b; apply (MLKEM_PolyAVX.poly_add_corr _a _b ab bb abb bbb).

lemma addequiv  (ab1 bb1 ab2 bb2 : int):
    0 <= ab1 && ab1 <= 6 =>
    0 <= ab2 && ab2 <= 6 =>
    0 <= bb1 && bb1 <= 3 =>
    0 <= bb2 && bb2 <= 3 =>
    equiv [Jkem1024_avx2.M._poly_add2 ~Jkem1024.M._poly_add2 :
      lift_array256 rp{1} = lift_array256 (nttunpack rp{2}) /\
      lift_array256 bp{1} = lift_array256 (nttunpack bp{2}) /\
      signed_bound_cxq rp{2} 0 256 ab2 /\ 
      signed_bound_cxq bp{2} 0 256 bb2 /\
      signed_bound_cxq rp{1} 0 256 ab1 /\ 
      signed_bound_cxq bp{1} 0 256 bb1
           ==> lift_array256 res{1} = lift_array256  (nttunpack res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab1 + bb1) /\
               signed_bound_cxq res{2} 0 256 (ab2 + bb2) 
              ].
proof.
move => abb1 abb2 bbb1 bbb2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_add2(rp,bp); }
     (={rp,bp} ==> ={r}) 
     (lift_array256 rp{1} = lift_array256 (nttunpack rp{2}) /\
      lift_array256 bp{1} = lift_array256 (nttunpack bp{2}) /\
    signed_bound_cxq rp{1} 0 256 ab1 /\  
    signed_bound_cxq bp{1} 0 256 bb1 /\
    signed_bound_cxq rp{2} 0 256 ab2 /\  
    signed_bound_cxq bp{2} 0 256 bb2
                              ==> 
    lift_array256 r{1} = lift_array256 (nttunpack r{2}) /\
    signed_bound_cxq r{1} 0 256 (ab1+bb1) /\ 
    signed_bound_cxq r{2} 0 256 (ab2+bb2)); 1,2: smt(). 
symmetry. call prevec_eq_poly_add2. auto => />.

have Hright :=  (poly_add_correct_impl ab2 bb2 abb2 bbb2).
ecall{2} (Hright (lift_array256 rp{2}) (lift_array256 bp{2})).
have Hleft :=  (poly_add_corr_avx_impl ab1 bb1 abb1 bbb1).
ecall{1} (Hleft (lift_array256 rp{1}) (lift_array256  bp{1})).

auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 r2 H6 H7 r1 H8 H9.
rewrite /lift_array256 tP => k kb.
rewrite !mapiE //=.
rewrite /nttunpack initiE //=.
pose a:= nttunpack_idx.[k].
rewrite H7 // H9; 1: smt(nttunpack_bnd Array256.allP).
rewrite /lift_array256 !mapiE //=;1,2: smt(nttunpack_bnd Array256.allP). 
rewrite /lift_array256 !tP in H0.
rewrite /lift_array256 !tP in H1.
move : (H0 k kb); rewrite !mapiE //=.
move : (H1 k kb); rewrite !mapiE //=.
smt(Array256.initiE).
qed.

lemma addequiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
    equiv [Jkem1024_avx2.M._poly_add2 ~Jkem1024.M._poly_add2 :
      lift_array256 rp{1} = lift_array256 ( rp{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
      signed_bound_cxq rp{2} 0 256 ab /\ 
      signed_bound_cxq bp{2} 0 256 bb /\
      signed_bound_cxq rp{1} 0 256 ab /\ 
      signed_bound_cxq bp{1} 0 256 bb
           ==> lift_array256 res{1} = lift_array256  ( res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab + bb) /\
               signed_bound_cxq res{2} 0 256 (ab + bb) 
              ].
move => abb bbb.
proc*.  
transitivity {1} { r <@ Mprevec.poly_add2(rp,bp); }
     (={rp,bp} ==> ={r}) 
     (lift_array256 rp{1} = lift_array256 ( rp{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
    signed_bound_cxq rp{1} 0 256 ab /\  
    signed_bound_cxq bp{1} 0 256 bb /\
    signed_bound_cxq rp{2} 0 256 ab /\  
    signed_bound_cxq bp{2} 0 256 bb
                              ==> 
    lift_array256 r{1} = lift_array256 ( r{2}) /\
    signed_bound_cxq r{1} 0 256 (ab+bb) /\ 
    signed_bound_cxq r{2} 0 256 (ab+bb)); 1,2: smt().
symmetry. call prevec_eq_poly_add2. auto => />.

have Hright :=  (poly_add_correct_impl ab bb abb bbb).
ecall{2} (Hright (lift_array256 rp{2}) (lift_array256 bp{2})).
have Hleft :=  (poly_add_corr_avx_impl ab bb abb bbb).
ecall{1} (Hleft (lift_array256 rp{1}) (lift_array256  bp{1})).

auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 r2 H6 H7 r1 H8 H9.
rewrite /lift_array256 tP => k kb.
rewrite !mapiE //=.
rewrite H7 // H9 /#.
qed.

equiv frommsgequiv_noperm  : 
 Jkem1024_avx2.M._i_poly_frommsg ~  Jkem1024.M._i_poly_frommsg :
    ={ap} ==> 
    lift_array256 res{1} = lift_array256 res{2} /\
    pos_bound256_cxq res{1} 0 256 1 /\ 
    pos_bound256_cxq res{2} 0 256 1.
admitted.

lemma compress_poly_rng i xs :
  1 <= i < 12 =>
  all (fun (x : int) => 0 <= x < 2^i) (compress_poly i xs).
rewrite /compress_poly /map allP => Hi j Hj. rewrite !initiE //=. rewrite compress_rng //. qed.

equiv tomsgequiv_noperm  : 
 Jkem1024_avx2.M._i_poly_tomsg ~  Jkem1024.M._i_poly_tomsg :
    lift_array256 a{1} = lift_array256 a{2} /\
    pos_bound256_cxq a{1} 0 256 2 /\ 
    pos_bound256_cxq a{2} 0 256 2 ==>
    res{1}.`1 = res{2}.`1.
admitted.


lemma polyvec_tobytes_equiv :
    equiv [Jkem1024_avx2.M.__i_polyvec_tobytes ~Jkem1024.M.__i_polyvec_tobytes :
             pos_bound1024_cxq a{1} 0 1024 2 /\
             pos_bound1024_cxq a{2} 0 1024 2 /\
             lift_array1024 a{1} = nttunpackv (lift_array1024 a{2}) ==> ={res} ].
admitted.


lemma polyvec_add2_equiv  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
  forall (_a _b : coeff Array1024.t),
    equiv [Jkem1024_avx2.M.__polyvec_add2 ~Jkem1024.M.__polyvec_add2 :
      _a = lift_array1024 r{2} /\
      _b = lift_array1024 b{2} /\ signed_bound1024_cxq r{2} 0 1024 ab /\ signed_bound1024_cxq b{2} 0 1024 bb /\
      _a = nttpackv (lift_array1024 r{1}) /\
      _b = nttpackv (lift_array1024 b{1}) /\ signed_bound1024_cxq r{1} 0 1024 ab /\ signed_bound1024_cxq b{1} 0 1024 bb
           ==> lift_array1024 res{1} = nttunpackv (lift_array1024  res{2}) /\
               signed_bound1024_cxq res{1} 0 1024 (ab + bb) /\
               signed_bound1024_cxq res{2} 0 1024 (ab + bb) 
              ].
proof. 
move => abb bbb _a _b;proc* => /=.
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array1024 r{2} /\
  _b = lift_array1024 b{2} /\
  signed_bound1024_cxq r{2} 0 1024 ab /\
  signed_bound1024_cxq b{2} 0 1024 bb /\
  _a = nttpackv (lift_array1024 r{1}) /\
  _b = nttpackv (lift_array1024 b{1}) /\ signed_bound1024_cxq r{1} 0 1024 ab /\ signed_bound1024_cxq b{1} 0 1024 bb   ==> 
      lift_array1024 r0{1} = nttunpackv (lift_array1024 r0{2}) /\ signed_bound1024_cxq r0{1} 0 1024 (ab + bb) /\ signed_bound1024_cxq r0{2} 0 1024 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_add2 => //.
have corr1 := (polvec_add_corr (nttunpackv _a) (nttunpackv _b) ab bb abb bbb). call {1} corr1.
have corr2 := (polyvec_add_corr _a _b ab bb abb bbb); call {2} corr2.

auto => />. 
move => &1 &2 ????->->??rr?rval; do split; 1,2: by rewrite packvK.  
move => ??rr0?r0val.
rewrite tP => k kb.
rewrite /(lift_array1024 rr0) mapiE //= r0val // !packvK.
have  -> : lift_array1024 rr = 
   Array1024.init (fun k => (nttpackv (lift_array1024 r{1})).[k] + (nttpackv (lift_array1024 b{1})).[k])
 by rewrite tP => kk kkb; rewrite initiE //= /(lift_array1024 rr) mapiE //= /#.
rewrite /nttunpackv /nttpackv initiE //=.
case (0<=k<256).
+ move => *.
  rewrite /subarray256 /nttunpack initiE //= initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k].
  do 4!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  do 2!(rewrite ifT; 1: smt(nttunpack_bnd Array256.allP);
   rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite -/b.
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  

case (256<=k<512).
+ move => *.
  rewrite /subarray256 /nttunpack initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k-256].
  do 3!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  do 2!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite -/b.
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  

case (512<=k<768).
+ move => *.
  rewrite /subarray256 /nttunpack initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k-512].
  do 3!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  do 2!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite -/b.
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  

+ move => *.
  rewrite /subarray256 /nttunpack initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k - 768].
  do 4!(rewrite initiE //=; 1:smt(nttunpack_bnd Array256.allP)).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  do 2!(rewrite /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  do 2!(rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite /a.
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  
qed.

lemma polyvec_add2_equiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
  forall (_a _b : coeff Array1024.t),
    equiv [Jkem1024_avx2.M.__polyvec_add2 ~Jkem1024.M.__polyvec_add2 :
      _a = lift_array1024 r{2} /\
      _b = lift_array1024 b{2} /\ signed_bound1024_cxq r{2} 0 1024 ab /\ signed_bound1024_cxq b{2} 0 1024 bb /\
      _a = lift_array1024 r{1} /\
      _b = lift_array1024 b{1} /\ signed_bound1024_cxq r{1} 0 1024 ab /\ signed_bound1024_cxq b{1} 0 1024 bb
           ==> lift_array1024 res{1} = lift_array1024  res{2} /\
               signed_bound1024_cxq res{1} 0 1024 (ab + bb) /\
               signed_bound1024_cxq res{2} 0 1024 (ab + bb) 
              ].
proof. 
move => abb bbb _a _b;proc* => /=.
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array1024 r{2} /\
  _b = lift_array1024 b{2} /\
  signed_bound1024_cxq r{2} 0 1024 ab /\
  signed_bound1024_cxq b{2} 0 1024 bb /\
  _a =  (lift_array1024 r{1}) /\
  _b =  (lift_array1024 b{1}) /\ signed_bound1024_cxq r{1} 0 1024 ab /\ signed_bound1024_cxq b{1} 0 1024 bb   ==> 
      lift_array1024 r0{1} = (lift_array1024 r0{2}) /\ signed_bound1024_cxq r0{1} 0 1024 (ab + bb) /\ signed_bound1024_cxq r0{2} 0 1024 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_add2 => //.
have corr1 := (polvec_add_corr ( _a) ( _b) ab bb abb bbb). call {1} corr1.
have corr2 := (polyvec_add_corr _a _b ab bb abb bbb); call {2} corr2.

auto => />.  
move => &1 &2 ????????rr? H rval? H0. 
move : H H0; rewrite /lift_array1024 !tP => ? ? k kb. 
rewrite !mapiE;smt(Array1024.mapiE).
qed.

lemma polyvec_reduce_equiv _a :
    equiv [Jkem1024_avx2.M.__polyvec_reduce ~Jkem1024.M.__polyvec_reduce :
       _a  = lift_array1024 r{2} /\  _a  = nttpackv (lift_array1024 r{1})  ==>
       (forall k, 0 <= k < 1024 => bpos16 res{1}.[k] (2*q)) /\
       (forall k, 0 <= k < 1024 => bpos16 res{2}.[k] (2*q)) /\
              lift_array1024 res{1} = nttunpackv (lift_array1024 res{2}) ].
proc*. 
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_reduce(r); }
       (={r} ==> ={r0})
       (_a = lift_array1024 r{2} /\ _a = nttpackv (lift_array1024 r{1})   ==> 
      (forall (k : int), 0 <= k && k < 1024 => bpos16 r0{1}.[k] (2 * q)) /\
  (forall (k : int), 0 <= k && k < 1024 => bpos16 r0{2}.[k] (2 * q)) /\
  lift_array1024 r0{1} = nttunpackv (lift_array1024  r0{2})); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_reduce => //.
have corr1 := (polvec_reduce_corr (nttunpackv _a)). call {1} corr1.
have corr2 := (polyvec_reduce_corr _a); call {2} corr2.

auto => />. 
move => &1 &2 ?????; do split;1: smt(packvK unpackvK). 
move => ??<-?.
smt(packvK unpackvK). 
qed.


lemma polyvec_reduce_equiv_noperm _a :
    equiv [Jkem1024_avx2.M.__polyvec_reduce ~Jkem1024.M.__polyvec_reduce :
       _a  = lift_array1024 r{2} /\  _a  = lift_array1024 r{1}  ==>
       (forall k, 0 <= k < 1024 => bpos16 res{1}.[k] (2*q)) /\
       (forall k, 0 <= k < 1024 => bpos16 res{2}.[k] (2*q)) /\
              lift_array1024 res{1} =  lift_array1024 res{2} ].
proc*. 
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_reduce(r); }
       (={r} ==> ={r0})
       (_a = lift_array1024 r{2} /\ _a = (lift_array1024 r{1})   ==> 
      (forall (k : int), 0 <= k && k < 1024 => bpos16 r0{1}.[k] (2 * q)) /\
  (forall (k : int), 0 <= k && k < 1024 => bpos16 r0{2}.[k] (2 * q)) /\
  lift_array1024 r0{1} =  (lift_array1024  r0{2})); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_reduce => //.
have corr1 := (polvec_reduce_corr ( _a)). call {1} corr1.
have corr2 := (polyvec_reduce_corr _a); call {2} corr2.

auto => /> /#. 
qed.

equiv pointwiseequiv : 
 Jkem1024_avx2.M.__polyvec_pointwise_acc ~  Jkem1024.M.__polyvec_pointwise_acc :
    lift_array1024 arg{1}.`2 = nttunpackv (lift_array1024 arg{2}.`1) /\
    lift_array1024 arg{1}.`3 = nttunpackv (lift_array1024 arg{2}.`2) /\
    signed_bound1024_cxq arg{1}.`2 0 1024 2 /\
    signed_bound1024_cxq arg{1}.`3 0 1024 2 /\
    signed_bound1024_cxq arg{2}.`1 0 1024 2 /\
    signed_bound1024_cxq arg{2}.`2 0 1024 2
    ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 4 /\ 
    signed_bound_cxq res{2} 0 256 2.
proof.
proc => /=.
seq 2 3 :(#pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 1 /\
         signed_bound_cxq r{2} 0 256 2).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H k _); 1: smt(). rewrite !initiE//= 1:/# kb /=.
  rewrite /nttunpack !mapiE //= 1:/# !initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 k _); 1: smt(). rewrite !initiE//= 1:/# kb /=.
  rewrite /nttunpack !mapiE //= 1:/# !initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=.
move : H2; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=.
+ move : H3; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=.
move : H4; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=.

unroll for {1} 2; unroll for {2} 2.
seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 1 /\
         signed_bound_cxq t{2} 0 256 2).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H (256+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifT 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (256+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifT 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=;1:smt().

seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 2 /\
         signed_bound_cxq r{2} 0 256 4).
have Hcall:= addequiv 1 1 2 2 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10. do split. 
+ rewrite lift256_nttunpack; apply H5.
+ rewrite lift256_nttunpack; apply H8.
move => ?? r2 r1 ???.
rewrite -lift256_nttunpack;1: assumption.

seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 1 /\
         signed_bound_cxq t{2} 0 256 2).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H (512+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /= ifF 1:/# ifT 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (512+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /= ifF 1:/# ifT 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=;1: smt().


seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 3 /\
         signed_bound_cxq r{2} 0 256 6).
have Hcall:= addequiv 2 1 4 2 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 ????????????. do split. 
+ rewrite lift256_nttunpack;1: assumption.
+ rewrite lift256_nttunpack;1: assumption.
move => ?? r1 r2 ???.
rewrite -lift256_nttunpack;1: assumption.

seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 1 /\
         signed_bound_cxq t{2} 0 256 2).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H (768+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /= ifF 1:/# ifF 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (768+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /= ifF 1:/# ifF 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=;1: smt().


seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 4 /\
         signed_bound_cxq r{2} 0 256 8).
have Hcall:= addequiv 3 1 6 2 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 ????????????. do split. 
+ rewrite lift256_nttunpack;1: assumption.
+ rewrite lift256_nttunpack;1: assumption.
move => ?? r1 r2 ???.
rewrite -lift256_nttunpack;1: assumption.

ecall{2} (MLKEM_Poly.poly_reduce_corr (lift_array256 r{2})).
auto => />.
move => &1 &2 ?????? H H1 ? rr.
move: H; rewrite /lift_array256 => H H2 ?.
split.
 by rewrite H H2.
smt().
qed.

equiv nttequiv :
Jkem1024_avx2.M.__polyvec_ntt ~Jkem1024.M.__polyvec_ntt : 
   lift_array1024 arg{1} = lift_array1024 arg{2} /\ 
   signed_bound1024_cxq arg{1} 0 1024 2 /\ 
   signed_bound1024_cxq arg{2} 0 1024 2 ==>
   lift_array1024 res{1} = nttunpackv (lift_array1024 res{2}) /\ 
   pos_bound1024_cxq res{1} 0 1024 2 /\ 
   pos_bound1024_cxq res{2} 0 1024 2.
proc *. 
ecall {2} (polyvec_ntt_corr r{2}) => /=.
conseq />;1: smt().
ecall {1} (polyvec_ntt_avx2_corr r{1}) => /=.
auto => /> &1 &2 HH?? r H H0 r2 H1 H2. 
have  : lift_polyvec (nttpackv r) = lift_polyvec r2.
+ rewrite -H1 -H;congr.
  rewrite /lift_polyvec KMatrix.Vector.eq_vectorP => k kb.
  rewrite !KMatrix.Vector.offunvE //=.
  rewrite /lift_array1024 tP in HH.
  rewrite /subarray256 /lift_array256 tP => i ib.
  move : (HH (k*256+i) _); 1: by smt().
  rewrite !mapiE //= 1,2: /# !initiE //= /#.
rewrite /lift_polyvec /lift_array1024 tP KMatrix.Vector.eq_vectorP => H3 k kb. 
rewrite !mapiE //=.
case (0<=k<256).
+ move => kbb; move : (H3 0 _) => //; rewrite !KMatrix.Vector.offunvE //=.
  rewrite /nttpackv /nttunpackv initiE//= kbb /= /nttunpack initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  move : (HHH a _); 1: smt(). 
  rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/#.
  rewrite initiE//= 1:/# initiE//= 1:/#. 
  pose b := nttpack_idx.[a].
  rewrite ifT 1:/# /nttpack initiE//= 1:/# initiE//= 1:/# mapiE //= 1:/#. 
  move : nttpack_idxK; rewrite allP => Hidx.
  move : (Hidx k _)=>//; smt(mem_iota).

case (256 <= k < 512).
+ move => kbb ?; move : (H3 1 _) => //; rewrite !KMatrix.Vector.offunvE //=.
  rewrite /nttpackv /nttunpackv /= /nttpack /nttunpack initiE//=.
  rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
  rewrite ifF //= ifT //= initiE //= 1:/#.
  pose a := nttunpack_idx.[k-256].
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  rewrite initiE //= 1: /# !mapiE //= 1: /#. 
  move : (HHH (a) _); 1: smt(). 
  rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/# initiE//= 1:/#.
  rewrite ifF 1: /# initiE//= 1:/# initiE//= 1:/#. 
  rewrite ifT 1: /#. 
  pose b := nttpack_idx.[a].
  move : nttpack_idxK; rewrite allP => Hidx.
  move : (Hidx (k-256) _)=>//; smt(mem_iota).

case (512 <= k < 768).
+ move => kbb ?; move : (H3 2 _) => //; rewrite !KMatrix.Vector.offunvE //=.
  rewrite /nttpackv /nttunpackv /= /nttpack /nttunpack initiE//=.
  rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
  rewrite ifF  1:/# ifF 1:/# ifT 1:/# initiE //= 1:/#.
  pose a := nttunpack_idx.[k-512].
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  rewrite initiE //= 1: /# !mapiE //= 1: /#. 
  move : (HHH (a) _); 1: smt(). 
  rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/# initiE//= 1:/#.
  rewrite ifF 1: /# ifF 1:/# initiE//= 1:/# initiE//= 1:/#. 
  rewrite ifT 1: /#. 
  pose b := nttpack_idx.[a].
  move : nttpack_idxK; rewrite allP => Hidx.
  move : (Hidx (k-512) _)=>//; smt(mem_iota).

move => *; move : (H3 3 _) => //; rewrite !KMatrix.Vector.offunvE //=.
rewrite /nttpackv /nttunpackv /= /nttpack /nttunpack initiE//=.
rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
rewrite ifF  1:/# ifF 1:/# ifF 1:/# initiE //= 1:/#.
pose a := nttunpack_idx.[k-768].
move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
rewrite initiE //= 1: /# !mapiE //= 1: /#. 
move : (HHH (a) _); 1: smt(). 
rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/# initiE//= 1:/#.
rewrite ifF 1: /# ifF 1:/# ifF 1:/# initiE//= 1:/#. 
pose b := nttpack_idx.[a].
rewrite initiE//=  1:/# . 
move : nttpack_idxK; rewrite allP => Hidx.
move : (Hidx (k-768) _)=>//; smt(mem_iota).
qed.

equiv polyinvnttequiv :
Jkem1024_avx2.M._poly_invntt ~Jkem1024.M._poly_invntt : 
   lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) /\ 
   signed_bound_cxq arg{1} 0 256 4 /\ 
   signed_bound_cxq arg{2} 0 256 4 ==>
   lift_array256 res{1} = lift_array256 res{2} /\ 
   signed_bound_cxq res{1} 0 256 1 /\
   signed_bound_cxq res{2} 0 256 1.
proc*.
ecall{2} (invntt_correct (lift_array256 rp{2})) => /=.
conseq />; 1: by move => &1 &2 *;do split;  smt(). 
ecall{1} (poly_invntt_avx2_corr rp{2}) => /=. 
auto => /> &1 &2. rewrite lift_nttpack => -> H1 H2. rewrite nttunpackK //= => r <- H3. move => r0 <- H4. 
rewrite /scale /map /lift_array256 /R tP => /> i Hi1 Hi2. rewrite !initiE //=. rewrite Zq.ComRing.mulrC //. qed.

lemma signed_bound1024_cxq_small r (i j:int) :
  i <= j => signed_bound1024_cxq r 0 1024 i => signed_bound1024_cxq r 0 1024 j.
rewrite /signed_bound1024_cxq => />Hij H k Hk1 Hk2. move :(H k). rewrite Hk1 Hk2 => />. smt(). qed.

lemma eq_vectorP4 :
      forall (v1 v2 : PolyVec.polyvec),
        (v1 = v2) <=> ((KMatrix.Vector."_.[_]" v1 0 = KMatrix.Vector."_.[_]" v2 0) /\ (KMatrix.Vector."_.[_]" v1 1 = KMatrix.Vector."_.[_]" v2 1) /\ (KMatrix.Vector."_.[_]" v1 2 = KMatrix.Vector."_.[_]" v2 2) /\ (KMatrix.Vector."_.[_]" v1 3 = KMatrix.Vector."_.[_]" v2 3)).
smt(KMatrix.Vector.eq_vectorP). qed.

equiv invnttequiv :
Jkem1024_avx2.M.__polyvec_invntt ~Jkem1024.M.__polyvec_invntt : 
   lift_array1024 arg{1} = nttunpackv (lift_array1024 arg{2}) /\ 
   signed_bound1024_cxq arg{1} 0 1024 4 /\ 
   signed_bound1024_cxq arg{2} 0 1024 4 ==>
   lift_array1024 res{1} = lift_array1024 res{2} /\ 
   signed_bound1024_cxq res{1} 0 1024 1 /\ 
   signed_bound1024_cxq res{2} 0 1024 1.
proc *.
ecall {2} (polyvec_invntt_corr r{2}) => /=.
conseq />;1: smt().
ecall {1} (polyvec_invntt_avx2_corr r{2}) => /=. 
auto => /> &1 &2 -> Hm1 Hm2. rewrite unpackvK //= => r Hr1 Hr2 s Hs1 Hs2.
rewrite /lift_array1024 /map tP => />j Hj1 Hj2. rewrite !initiE //=.
move :Hr1; rewrite !mapvE /lift_polyvec eq_vectorP4 !KMatrix.Vector.offunvE //=. 
rewrite /lift_array256 /subarray256 /map !tP -!andaE. 
apply andaW. 
move => Hr10. 
apply andaW. 
move => Hr11. 
apply andaW. 
move =>  Hr12 Hr21.   
move :Hs1;rewrite /scale_vector /lift_polyvec eq_vectorP4 !KMatrix.Vector.offunvE //=.
rewrite /scale /lift_array256 /subarray256 /map !tP -!andaE.
apply andaW. 
move => Hs10. 
apply andaW. 
move => Hs11.
apply andaW. 
move =>  Hs12 Hs21.  
case (0 <= j < 256) => Hj_0.
 + move :(Hr10 j). rewrite Hj_0 !initiE //= !initiE //= => <-.
 + move :(Hs10 j). rewrite Hj_0 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
case (256 <= j < 512). move => Hj_1.
 + have Hj_2: 0 <= j - 256 && j - 256 < 256. smt().
 + move :(Hr11 (j-256)). rewrite Hj_2 !initiE //= !initiE //= => <-.
 + move :(Hs11 (j-256)). rewrite Hj_2 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
case (512 <= j < 768). move => ?Hj_2.
 + have Hj_3: 0 <= j - 512 && j - 512 < 256. smt().
 + move :(Hr12 (j-512)). rewrite Hj_3 !initiE //= !initiE //= => <-.
 + move :(Hs12 (j-512)). rewrite Hj_3 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
move =>? Hj_3.
 + have Hj_4: 0 <= j - 768 && j - 768 < 256. smt().
 + move :(Hr21 (j-768)). rewrite Hj_4 !initiE //= !initiE //= => <-.
 + move :(Hs21 (j-768)). rewrite Hj_4 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
qed.
