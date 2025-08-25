require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array1536 Array1088 Array960 Array1410 Array768 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8 Array2.
from JazzEC require import WArray512 WArray128 WArray384 WArray32 WArray16 WArray1410 WArray160 WArray960 WArray1536.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem768.
from JazzEC require import Jkem768_avx2.
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

(********** BEGIN BDEP PROOF OF CSUBQ **************)

lemma polyvec_csubq_avx2_ll :
   islossless Jkem768_avx2.M.__polyvec_csubq.
by proc;inline *;do 4!(unroll for ^while);auto.
qed.

lemma poly_csubq_avx2_ll :
   islossless Jkem768_avx2.M._poly_csubq.
by proc;inline *;unroll for ^while;auto.
qed.

op csubq_circuit(a : W16.t) : W16.t = 
   if (a \ult W16.of_int 3329) then  a
   else (W16_sub a (W16.of_int 3329)).

lemma poly_csubq_avx2_corr_h (_aw : W16.t Array256.t):
    hoare[ Jkem768_avx2.M._poly_csubq  :
             rp = _aw /\
             pos_bound256_cxq rp 0 256 2 ==> 
             lift_array256 res = lift_array256 _aw /\
             pos_bound256_cxq res 0 256 1]. 
proof.
proc; inline *.
proc change 1: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change ^while.1: (sliceget256_16_256 rp (i*256));1: by auto => /#.
proc change ^while.9: (sliceset256_16_256 rp (i*256) r);1: by auto => /#.

unroll for ^while.
cfold ^i<-.
wp -1. 
bdep 16 16 [_aw] [rp] [rp] csubq_circuit pcond_reduced. 

(* BDEP pre conseq *)
+ move => &hr />; rewrite flatten1 /= pre_lane_commute_in_aligned 1:/# //=.
  rewrite allP /pos_bound768_cxq /= => Hb. 
  rewrite /pcond_reduced /= /tolist /= => x.
  rewrite  mkseqP => He;elim He => /= i [ib?]; rewrite ultE /=.
  have := Hb i; rewrite ib /= qE /=.
  rewrite /to_sint /smod /=.
  smt(W16.to_uint_cmp).

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= ->; rewrite /pos_bound256_cxq => Hb rr; rewrite /= !flatten1.
rewrite !flattenK;1..4:smt(mapP W16.size_w2bits).
rewrite -2!(map_comp) /(\o) /= -(map_comp W16.bits2w) /(\o).
have -> := (eq_map (fun (x : W16.t) => W16.bits2w (w2bits x)) idfun);1: by move => ?/=/#.
rewrite map_id.
rewrite /lift_array256 /pos_bound256_cxq /= => H.
rewrite -(Array256.to_listK witness rr) -H qE; split.

rewrite tP => i ib.
rewrite !mapiE 1,2:/# /= get_of_list 1:/# (nth_map witness); 1:smt(Array256.size_to_list).
rewrite (Array256.get_to_list _aw i).
rewrite /csubq_circuit ultE /W16_sub /=.
move : (Hb i ib);rewrite /bpos16 qE /= /to_sint /smod /=.
case (to_uint _aw.[i] < 3329) => *//;1:
have ->/= : !32768 <= to_uint _aw.[i] by smt(W16.to_uint_cmp).
rewrite to_uintB /=;1: by rewrite uleE => /#.
have ->/= : !32768 <= to_uint _aw.[i] - 3329;  by smt(W16.to_uint_cmp).

move => i ib.
rewrite Array256.get_of_list 1:/# (nth_map witness); 1:smt(Array256.size_to_list).
rewrite (nth_map witness) /=;1:smt(size_iota).
rewrite nth_iota 1:/#.
rewrite /csubq_circuit ultE /W16_sub /=.
move : (Hb i ib);rewrite /bpos16 qE /= /to_sint /smod /=.
case (to_uint _aw.[i] < 3329) => *//;1:
have ->/= : !32768 <= to_uint _aw.[i] by smt(W16.to_uint_cmp).
by smt(W16.to_uint_cmp).
rewrite to_uintB /=;1: by rewrite uleE => /#.
have ->/= : !32768 <= to_uint _aw.[i] - 3329;  by smt(W16.to_uint_cmp).
qed.

lemma poly_csubq_avx2_corr (_aw : W16.t Array256.t):
    phoare[ Jkem768_avx2.M._poly_csubq  :
             rp = _aw /\
             pos_bound256_cxq rp 0 256 2 ==> 
             lift_array256 res = lift_array256 _aw /\
             pos_bound256_cxq res 0 256 1] = 1%r
  by conseq poly_csubq_avx2_ll (poly_csubq_avx2_corr_h _aw).


lemma polyvec_csubq_avx2_corr_h (_aw : W16.t Array768.t):
    hoare[ Jkem768_avx2.M.__polyvec_csubq  :
             r = _aw /\
             pos_bound768_cxq r 0 768 2 ==> 
             lift_array768 res = lift_array768 _aw /\
             pos_bound768_cxq res 0 768 1]. 
proof.
proc; inline *.
proc change ^while.1: (init_256_16 (fun i0 => r.[256*i+i0]));1: by auto.
proc change ^while.2: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change ^while.^while.1: (sliceget256_16_256 rp (i0*256));1: by auto => /#.
proc change ^while.^while.9: (sliceset256_16_256 rp (i0*256) r0);1: by auto => /#.
proc change ^while.6: (init_768_16 (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux.[i_0 - 256 * i] else r.[i_0]));1: by auto. 

do 4!(unroll for ^while).
cfold ^i0<-.
wp -2. 
bdep 16 16 [_aw] [r] [r] csubq_circuit pcond_reduced. 

(* BDEP pre conseq *)
+ move => &hr />; rewrite flatten1 /= pre_lane_commute_in_aligned 1:/# //=.
  rewrite allP /pos_bound768_cxq /= => Hb. 
  rewrite /pcond_reduced /= /tolist /= => x.
  rewrite  mkseqP => He;elim He => /= i [ib?]; rewrite ultE /=.
  have := Hb i; rewrite ib /= qE /=.
  rewrite /to_sint /smod /=.
  smt(W16.to_uint_cmp).

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= ->; rewrite /pos_bound768_cxq => Hb rr; rewrite /= !flatten1.
rewrite !flattenK;1..4:smt(mapP W16.size_w2bits).
rewrite -2!(map_comp) /(\o) /= -(map_comp W16.bits2w) /(\o).
have -> := (eq_map (fun (x : W16.t) => W16.bits2w (w2bits x)) idfun);1: by move => ?/=/#.
rewrite map_id.
rewrite /lift_array768 /pos_bound768_cxq /= => H.
rewrite -(Array768.to_listK witness rr) -H qE; split.

rewrite tP => i ib.
rewrite !mapiE 1,2:/# /= get_of_list 1:/# (nth_map witness); 1:smt(Array768.size_to_list).
rewrite (Array768.get_to_list _aw i).
rewrite /csubq_circuit ultE /W16_sub /=.
move : (Hb i ib);rewrite /bpos16 qE /= /to_sint /smod /=.
case (to_uint _aw.[i] < 3329) => *//;1:
have ->/= : !32768 <= to_uint _aw.[i] by smt(W16.to_uint_cmp).
rewrite to_uintB /=;1: by rewrite uleE => /#.
have ->/= : !32768 <= to_uint _aw.[i] - 3329;  by smt(W16.to_uint_cmp).

move => i ib.
rewrite Array768.get_of_list 1:/# (nth_map witness); 1:smt(Array768.size_to_list).
rewrite (nth_map witness) /=;1:smt(size_iota).
rewrite nth_iota 1:/#.
rewrite /csubq_circuit ultE /W16_sub /=.
move : (Hb i ib);rewrite /bpos16 qE /= /to_sint /smod /=.
case (to_uint _aw.[i] < 3329) => *//;1:
have ->/= : !32768 <= to_uint _aw.[i] by smt(W16.to_uint_cmp).
by smt(W16.to_uint_cmp).
rewrite to_uintB /=;1: by rewrite uleE => /#.
have ->/= : !32768 <= to_uint _aw.[i] - 3329;  by smt(W16.to_uint_cmp).
qed.

lemma polyvec_csubq_avx2_corr (_aw : W16.t Array768.t):
    phoare[ Jkem768_avx2.M.__polyvec_csubq  :
             r = _aw /\
             pos_bound768_cxq r 0 768 2 ==> 
             lift_array768 res = lift_array768 _aw /\
             pos_bound768_cxq res 0 768 1] = 1%r
  by conseq polyvec_csubq_avx2_ll (polyvec_csubq_avx2_corr_h _aw).



(********** END BDEP PROOF OF CSUBQ **************)


lemma polyvec_decompress_ll :
   islossless Jkem768_avx2.M.__i_polyvec_decompress.
by proc;inline *;unroll for ^while; do 3!(cfold ^inc<-; unroll for ^while);auto.
qed.
(********** BEGIN BDEP PROOF OF DECOMPRESS **************)
op decompress10_circuit(c : W10.t) : W16.t = 
  truncateu16 (srl_32 (((zeroextu10_32 c) * W32.of_int 3329) + W32.of_int 512) (W32.of_int 10)).

op pcond_true10(_: W10.t) = true.

lemma init_id (rp0 : W8.t Array1088.t):
  (Array960.init ("_.[_]" (Array960.init ("_.[_]" rp0)))) =
    Array960.init  ("_.[_]" rp0).
rewrite tP => *.
by rewrite initiE 1:/# /=.
qed.

lemma polyvec_decompress_corr_h (_aw : W8.t Array960.t):
    hoare[ Jkem768_avx2.M.__i_polyvec_decompress :
             Array960.init (fun i => rp.[i]) = _aw ==> pos_bound768_cxq res 0 768 1 /\ lift_polyvec res = decompress_polyvec 10 (decode10_vec _aw)].
proc; inline *.
proc change 3: (sliceget32_8_256 pvd_shufbdidx_s 0); 1: by auto.
proc change ^while.^while.1 : (sliceget1088_8_256 rp ((320*k + 20*i)*8)); 1: by auto => /> /#.
proc change ^while.^while.8 : (sliceset768_16_256 r ((16 * k + i)*256) f); 1: by auto => /> /#.
unroll for ^while.
cfold ^inc<-.
do 3!(unroll for ^while).
cfold ^i<-.
wp -3.
bdep 10 16 [_aw[Array960.t:0]] [rp[Array960.t:0]] [r] decompress10_circuit pcond_true10. 

(* BDEP pre conseq *)
+ move => &hr />; rewrite /pcond_true10 /=;split. 
  + rewrite allP /#. 
  have {2}<- := init_id rp{hr}; smt().

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= <- rr; rewrite /= !flatten1.
rewrite init_id.
move => H1; have H2 := post_lane_commute_out_aligned (to_list (Array960.init ("_.[_]" rp{hr}))) (to_list rr) W8.w2bits W8.bits2w W10.w2bits W10.bits2w W16.w2bits W16.bits2w  decompress10_circuit 8 10 16 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
smt(Array960.size_to_list Array768.size_to_list W16.bits2wK BVA_Top_Bindings_W10_t.oflistP).

have H3 : 
   map decompress10_circuit (map W10.bits2w (chunk 10 (flatten (map W8.w2bits (to_list (Array960.init ("_.[_]" rp{hr}))))))) =
   map (W16.of_int \o asint) (to_list (decompress_polyvec 10 (decode10_vec (Array960.init ("_.[_]" rp{hr})))).[0] ++ 
                              to_list (decompress_polyvec 10 (decode10_vec (Array960.init ("_.[_]" rp{hr})))).[1] ++ 
                              to_list (decompress_polyvec 10 (decode10_vec (Array960.init ("_.[_]" rp{hr})))).[2])%Vector.
+ rewrite /decode10_vec /decompress_polyvec !map_cat !setvE !offunvE 1..3:/# /= !offunvK /vclamp /kvec /= /subarray256 /=.
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
  + move => ?;rewrite ifT 1:/#.
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
  have Hs := size_nth_chunk [] (flatten (map W8.w2bits (to_list(Array960.init ("_.[_]" rp{hr}))))) i 10 _ _ => //.
  + rewrite (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
    by rewrite size_map size_to_list /#.
  rewrite to_uint_eq to_uint_truncateu16 /= /srl_32 /= of_uintK /=;congr;congr.
  have ? : 2^10 = 1024 by auto.
  rewrite to_uint_shr //= /zeroextu10_32 to_uintD_small /=;1: by rewrite of_uintK /=; smt(modz_small W10.to_uint_cmp). 
  rewrite of_uintK /= modz_small /=;1:by smt( W10.to_uint_cmp). 
  rewrite /to_uint bits2wK 1:/# incoeffK qE /= /decode (nth_map [] _ bs2int) /=.
  + rewrite size_chunk 1:/# size_BytesToBits size_to_list /= /#.
  by smt(BS2Int.bs2int_ge0 BS2Int.bs2int_le2Xs modz_small W10.to_uint_cmp). 

  case (i <512).
  + move => ??.
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
  have Hs := size_nth_chunk [] (flatten (map W8.w2bits (to_list (Array960.init ("_.[_]" rp{hr}))))) i 10 _ _ => //.
  + rewrite (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
    by rewrite size_map size_to_list /#.
  rewrite to_uint_eq to_uint_truncateu16 /= /srl_32 /= of_uintK /=;congr;congr.
  have ? : 2^10 = 1024 by auto.
  rewrite to_uint_shr //= /zeroextu10_32 to_uintD_small /=;1: by rewrite of_uintK /=; smt(modz_small W10.to_uint_cmp). 
  rewrite of_uintK /= modz_small;1:by smt( W10.to_uint_cmp). 
  rewrite /to_uint bits2wK 1:/# incoeffK qE /= /decode (nth_map [] _ bs2int) /=.
  + rewrite size_chunk 1:/# size_BytesToBits size_to_list /= /#.
  by smt(BS2Int.bs2int_ge0 BS2Int.bs2int_le2Xs modz_small W10.to_uint_cmp). 

  + move => ??.
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
  have Hs := size_nth_chunk [] (flatten (map W8.w2bits (to_list (Array960.init ("_.[_]" rp{hr}))))) i 10 _ _ => //.
  + rewrite (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits). 
    by rewrite size_map size_to_list /#.
  rewrite to_uint_eq to_uint_truncateu16 /= /srl_32 /= of_uintK /=;congr;congr.
  have ? : 2^10 = 1024 by auto.
  rewrite to_uint_shr //= /zeroextu10_32 to_uintD_small /=;1: by rewrite of_uintK /=; smt(modz_small W10.to_uint_cmp). 
  rewrite of_uintK /= modz_small;1:by smt( W10.to_uint_cmp). 
  rewrite /to_uint bits2wK 1:/# incoeffK qE /= /decode (nth_map [] _ bs2int) /=.
  + rewrite size_chunk 1:/# size_BytesToBits size_to_list /= /#.
  by smt(BS2Int.bs2int_ge0 BS2Int.bs2int_le2Xs modz_small W10.to_uint_cmp). 


split; last first.
+ rewrite eq_vectorP => i @/kvec ib.
  rewrite /lift_polyvec /decompress_polyvec !setvE !offunvE 1..2:/# /= !offunvK /vclamp /kvec /= ib /=. 

  case (2 = i) => Hi2.
  + rewrite tP => k kb. 
    rewrite -Hi2 !mapiE 1,2:/# !initiE 1,2:/# /= /= -get_to_list H2 H3 /(\o) /=.
  rewrite (nth_map witness) /=;1: by smt(Array256.size_to_list size_cat).
  rewrite (nth_cat witness).
  + rewrite !size_cat !size_to_list /= ifF 1:/# /decompress_polyvec.
    rewrite !setvE !offunvE 1:/# /=.
  rewrite get_of_list 1:/# /decode10_vec mapiE 1:/# /= initiE 1:/# /= get_of_list 1:/# /= /smod /=.
  pose c := decompress 10 (nth 0 (decode 10 (to_list (Array960.init ("_.[_]" rp{hr})))) (512 + k)).
  rewrite modz_small; smt(@Zq).  

  case (1 = i) => Hi1.
  + rewrite tP => k kb. 
    rewrite -Hi1 !mapiE 1,2:/# !initiE 1,2:/# /= /= -get_to_list H2 H3 /(\o) /=.
  rewrite (nth_map witness) /=;1: by smt(Array256.size_to_list size_cat).
  rewrite (nth_cat witness).
  + rewrite !size_cat !size_to_list /= ifT 1:/# /decompress_polyvec.
    rewrite !setvE !offunvE 1,2:/# /= !offunvK /vclamp /= !ifT 1..3:/#.
  rewrite (nth_cat witness).
  + rewrite !size_to_list /= ifF 1:/# /decompress_polyvec.
  rewrite get_of_list 1:/# /decode10_vec mapiE 1:/# /= initiE 1:/# /= get_of_list 1:/# /= /smod /=.
  pose c := decompress 10 (nth 0 (decode 10 (to_list (Array960.init ("_.[_]" rp{hr})))) (256 + k)).
  rewrite modz_small; smt(@Zq).  


  have Hi0 :(0 = i) by smt().
  + rewrite tP => k kb.
    rewrite -Hi0 /= !mapiE 1,2:/# /= initiE 1:/# /= -( Array768.get_to_list rr) H2 H3.
  rewrite (nth_map witness);1: by smt(Array256.size_to_list size_cat).
  rewrite (nth_cat witness).
  + rewrite !size_cat !size_to_list /= ifT 1:/# /decompress_polyvec.
    rewrite !setvE !offunvE 1..2:/# /= !offunvK /vclamp /= !ifT 1..3:/#.
  rewrite (nth_cat witness).
  + rewrite  !size_to_list /= ifT 1:/# /decompress_polyvec.
    rewrite  mapiE 1:/# initiE 1:/# /= initiE 1:/# /=.
    rewrite of_sintK /= /smod /= ifF;1:smt(@Zq).
    pose c := (decompress 10 (nth 0 (decode 10 (to_list (Array960.init ("_.[_]" rp{hr})))) (k))).
  rewrite modz_small; smt(@Zq).  


rewrite /pos_bound768_cxq qE /= => k kb. 
rewrite -get_to_list  H2 H3 /decompress_poly.
rewrite (nth_map witness);1: by smt(size_cat Array256.size_to_list).
rewrite (nth_cat witness) !size_cat !size_to_list /=. 
rewrite (nth_cat witness)  !size_to_list /=. 
rewrite /decompress_polyvec !setvE /= !offunvE 1..3:/# /= !offunvK /= /vclamp /kvec/=.
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
+ move => *.
  rewrite mapiE 1:/# initiE 1:/# /=.
  rewrite of_sintK /= /smod /= ifF;1:smt(@Zq).
  rewrite modz_small; smt(@Zq).  

qed.


lemma polyvec_decompress_corr (_aw : W8.t Array960.t):
    phoare[ Jkem768_avx2.M.__i_polyvec_decompress :
             Array960.init (fun i => rp.[i]) = _aw ==> pos_bound768_cxq res 0 768 1 /\ lift_polyvec res = decompress_polyvec 10 (decode10_vec _aw)] = 1%r
 by conseq polyvec_decompress_ll (polyvec_decompress_corr_h _aw).

lemma polyvec_decompress_equiv  :
    equiv [Jkem768_avx2.M.__i_polyvec_decompress ~  Jkem768.M.__i_polyvec_decompress  :
             Array960.init(fun i => arg{1}.[i]) =arg{2}.`2
              ==>
             lift_array768 res{1} = lift_array768 res{2} /\
             pos_bound768_cxq res{1} 0 768 1 /\
             pos_bound768_cxq res{2} 0 768 1 ].
proc*. 
ecall {2} (MLKEM_PolyVec.polyvec_decompress_corr ap{2}) => /=.
ecall {1} (polyvec_decompress_corr (Array960.init (fun (i : int) => rp{1}.[i]))).
+ auto => /> &1 r1 ? <- rr ?; rewrite /lift_array768 /lift_polyvec /lift_array256 /subarray256 !eq_vectorP /kvec tP =>H i ib.
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
  have Hi3 :  (512<= i < 768)  by smt().
    have  := (H 2 _);1:by auto.
    rewrite !offunvE /= /kvec //= tP => Hi.
    have := (Hi (i - 512) _); 1:smt(). 
    by rewrite !mapiE 1,2:/# /= initiE 1:/# /= initiE 1:/# /= /#.
qed.

(***********************)


(********** BEGIN BDEP PROOF OF COMPRESS  **************)

op compress10_circuit(a : W16.t) : W10.t = 
   if (a \ult W16.of_int 3329) then  
   truncate64_10 (srl_64 ((sll_64 (zeroextu64 a) (W64.of_int 10) + W64.of_int 1664) * W64.of_int 1290167) (W64.of_int 32))
   else 
   truncate64_10 (srl_64 ((sll_64 (zeroextu64 (W16_sub a (W16.of_int 3329))) (W64.of_int 10) + W64.of_int 1664) * W64.of_int 1290167) (W64.of_int 32)).

abbrev keepodd10 = (W32.of_int 67043328).
abbrev keepeven10 = (W32.of_int 1023).

op VPMADDWD_alt(f0 m : W256.t) : W256.t =
    if m <> (VPBROADCAST_4u64 (W64.of_int 288230380513787905)) then
       VPMADDWD_256 f0 m
    else 
    let f2 = VPBROADCAST_8u32 keepodd10 in
    let f1 = VPAND_256 f0 f2  in
    let f2 = VPBROADCAST_8u32 keepeven10 in
    let f0 = VPAND_256 f0 f2  in
    let f1 = VPSRL_8u32 f1  (W128.of_int 6) in
        VPOR_256 f0 f1.


lemma keepeven_bits b: 
  0 <= b < 32 =>
   keepeven10.[b] <=> 0<=b<10.
move => bb.
have  : all (fun b => keepeven10.[b] <=> 0 <= b < 10) (iota_ 0 32); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
by rewrite /of_int  /int2bs /mkseq -iotaredE /=.
qed.

lemma keepodd_bits b: 
  0 <= b < 32 =>
   keepodd10.[b] <=> 16<=b<26.
move => bb.
have  : all (fun b => keepodd10.[b] <=> 16 <= b < 26) (iota_ 0 32); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
by rewrite /of_int  /int2bs /mkseq -iotaredE /=.
qed.

lemma lowbits_keep (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 0 => 
  0 <= b < 10 =>
    (f \bits16 i).[b] = ((f \bits32 i%/2)  `&` keepeven10).[b].
proof. 
move => bi Hi Hb. 
have H := W16u16.get_bits16 f (16*i + b) _;1:smt().
have H0 := W8u32.get_bits32 f (16*i + b) _;1:smt().
rewrite andE map2iE 1:/# /=.
by smt(keepeven_bits).
qed.

lemma lowbits_drop (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 0 => 
  10 <= b < 16 =>
  !((f \bits32 i%/2)  `&` keepeven10).[b].
proof. 
move => bi Hi Hb. 
rewrite andE map2iE 1:/# /=.
by smt(keepeven_bits).
qed.

lemma highbits_keep (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 1 => 0 <= b < 10 =>
    (f \bits16 i).[b] = ((f \bits32 i%/2)  `&` keepodd10).[b + 16].
proof. 
move => bi Hi Hb. 
have H := W16u16.get_bits16 f (16*i + b) _;1:smt().
have H0 := W8u32.get_bits32 f (16*i + b) _;1:smt().
rewrite andE map2iE 1:/# /=.
by smt(keepodd_bits).
qed.

lemma highbits_drop (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 1 =>10 <= b < 15 =>
    !((f \bits32 i%/2)  `&` keepodd10).[b + 16].
proof. 
move => bi Hi Hb. 
rewrite andE map2iE 1:/# /=.
by smt(keepodd_bits).
qed.


lemma lowbits_ofint_keep (f0 f1 : W16.t) b :
  0 <= b < 10 =>
  0<= to_sint f0 < 1024 =>
  0<= to_sint f1 < 1024 =>
  (W32.of_int (to_sint f0 + to_sint f1 * 1024)).[b] = f0.[b].
move => ?.
rewrite /to_sint /smod /= => ??.
have  : all (fun b => (W32.of_int
   ((if 32768 <= to_uint f0 then to_uint f0 - 65536 else to_uint f0) +
    (if 32768 <= to_uint f1 then to_uint f1 - 65536 else to_uint f1) * 1024)).[b] =
f0.[b]) (iota_ 0 10); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
 rewrite  /of_int /int2bs /mkseq -iotaredE /=;do split; rewrite get_to_uint /= /#.
qed.

lemma highbits_ofint_keep (f0 f1 : W16.t) b :
  0<= to_sint f0 < 1024 =>
  0<= to_sint f1 < 1024 =>
  10 <= b < 20 =>
  (W32.of_int (to_sint f0 + to_sint f1 * 1024)).[b] = f1.[b-10].
move => ?.
rewrite /to_sint /smod /= => ??.
have  : all (fun b => (W32.of_int
   ((if 32768 <= to_uint f0 then to_uint f0 - 65536 else to_uint f0) +
    (if 32768 <= to_uint f1 then to_uint f1 - 65536 else to_uint f1) * 1024)).[b] =
f1.[b - 10]) (iota_ 10 20); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
 rewrite  /of_int /int2bs /mkseq -iotaredE /=;do split; rewrite get_to_uint /=; smt(pow2_16 pow2_32). 
qed.


lemma highbits_ofint_drop (f0 f1 : W16.t) b :
  0<= to_sint f0 < 1024 =>
  0<= to_sint f1 < 1024 =>
  20 <= b < 32 =>
  !(W32.of_int (to_sint f0 + to_sint f1 * 1024)).[b].
move => ?.
rewrite /to_sint /smod /= => ??.
have  : all (fun b => ! (W32.of_int
     ((if 32768 <= to_uint f0 then to_uint f0 - 65536 else to_uint f0) +
      (if 32768 <= to_uint f1 then to_uint f1 - 65536 else to_uint f1) * 1024)).[b]) (iota_ 20 32); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
 rewrite  /of_int /int2bs /mkseq -iotaredE /=;do split; smt(pow2_16 pow2_32). 
qed.


lemma unand (f : W256.t) (i : int) (b : int) :
  0 <= i < 8 => 0<=b<32 =>
   (W32.init (fun (j : int) => (f \bits32 i).[j + 6] /\ keepodd10.[j + 6])).[b] = ((f \bits32 i) `&` keepodd10).[b + 6].
proof.
move => ??.
by rewrite initiE 1:/# /=.
qed.

lemma vpmaddwd_alt_corr (f0 shift2 : W256.t) :
   (forall i, 0 <= i < 16 => 0<= to_sint (f0 \bits16 i) < 2^10) =>
   VPMADDWD_256 f0 shift2 = VPMADDWD_alt f0 shift2.
+ move => /= H;rewrite /VPMADDWD_256 /VPMADDWD_alt /=.  print pvc_shift2_s.
  case (shift2 = VPBROADCAST_4u64 pvc_shift2_s);2: by auto. 
  move => -> /=; rewrite /VPBROADCAST_4u64 /= -!(iotaredE) /=. 
  pose f00 := (f0 \bits16 0).
  pose f01 := (f0 \bits16 1).
  pose f02 := (f0 \bits16 2).
  pose f03 := (f0 \bits16 3).
  pose f04 := (f0 \bits16 4).
  pose f05 := (f0 \bits16 5).
  pose f06 := (f0 \bits16 6).
  pose f07 := (f0 \bits16 7).
  pose f08 := (f0 \bits16 8).
  pose f09 := (f0 \bits16 9).
  pose f010 := (f0 \bits16 10).
  pose f011 := (f0 \bits16 11).
  pose f012 := (f0 \bits16 12).
  pose f013 := (f0 \bits16 13).
  pose f014 := (f0 \bits16 14).
  pose f015 := (f0 \bits16 15).
  rewrite  /(\bits16) /= !W16.init_bits2w -!iotaredE /= /W64.of_int /= /int2bs /mkseq -!iotaredE /=; do 16!(rewrite /(to_sint (W16.bits2w _)) /smod /= /(W16.to_uint (W16.bits2w (_::_)))). 
  rewrite  !bits2wK //= !JUtils.bs2int_cons /b2i /= !bs2int_nil /=.
  rewrite !hadd_cons2 hadd_nil /=.
  rewrite /VPBROADCAST_8u32 -!iotaredE /= /VPSRL_8u32 /= /(`>>>`) /= -(unpack32K f0) andb8u32E !orb8u32E;congr;rewrite /unpack32 init_of_list -iotaredE /= orE.
  congr;apply (eq_from_nth witness) => //= => i ib. 
  apply W32.wordP => b bb. 
  have /= H3 := highbits_keep f0 (i*2+1) (b-10) _ _;1,2: smt().
  have /= H4 := highbits_drop f0 (i*2+1) (b-10) _ _;1,2: smt().
  have /= H5 := lowbits_keep f0  (i*2) b _ _;1,2: smt().
  have /= H6 := lowbits_drop f0 (i*2) b _ _;1,2: smt(). 
  case (i = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f00 f01 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f00 f01 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f00 f01 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 1 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f02 f03 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f02 f03 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f02 f03 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 2 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f04 f05 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f04 f05 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f04 f05 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 3 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f06 f07 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f06 f07 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f06 f07 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 4 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f08 f09 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f08 f09 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f08 f09 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 5 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f010 f011 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f010 f011 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f010 f011 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 6 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f012 f013 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f012 f013 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f012 f013 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 7 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f014 f015 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f014 f015 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f014 f015 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
by smt().
qed.

module AuxCompress10 = {

proc __i_polyvec_compress(rp : W8.t Array960.t, a : W16.t Array768.t) : W8.t Array960.t = {
    var inc : int;
    var x16p : W16.t Array16.t;
    var v : W256.t;
    var v8 : W256.t;
    var off : W256.t;
    var shift1 : W256.t;
    var mask : W256.t;
    var shift2 : W256.t;
    var sllvdidx : W256.t;
    var shufbidx : W256.t;
    var i : int;
    var f0 : W256.t;
    var f1 : W256.t;
    var f2 : W256.t;
    var t0 : W128.t;
    var t1 : W128.t;
    x16p <- witness;
    a <@ M.__polyvec_csubq(a);
    x16p <- jvx16;
    v <- get256 (WArray32.init16 (fun (i_0 : int) => x16p.[i_0])) 0;
    v8 <- VPSLL_16u16 v (W128.of_int 3);
    off <- VPBROADCAST_16u16 pc_mask_s;
    shift1 <- VPBROADCAST_16u16 pvc_shift1_s;
    mask <- VPBROADCAST_16u16 pvc_mask_s;
    shift2 <- VPBROADCAST_4u64 pvc_shift2_s;
    sllvdidx <- VPBROADCAST_4u64 pvc_sllvdidx_s;
    shufbidx <- get256 (WArray32.init8 (fun (i_0 : int) => pvc_shufbidx_s.[i_0])) 0;
    inc <- 3 * 256 %/ 16;
    i <- 0;
    while (i < inc){
      f0 <- get256 (WArray1536.init16 (fun (i_0 : int) => a.[i_0])) i;
      f1 <- VPMULL_16u16 f0 v8;
      f2 <- VPADD_16u16 f0 off;
      f0 <- VPSLL_16u16 f0 (W128.of_int 3);
      f0 <- VPMULH_16u16 f0 v;
      f2 <- VPSUB_16u16 f1 f2;
      f1 <- invw f1 `&` f2;
      f1 <- VPSRL_16u16 f1 (W128.of_int 15);
      f0 <- VPSUB_16u16 f0 f1;
      f0 <- VPMULHRS_16u16 f0 shift1;
      f0 <- f0 `&` mask;
      f0 <- VPMADDWD_alt f0 shift2;
      f0 <- VPSLLV_8u32 f0 sllvdidx;
      f0 <- VPSRL_4u64 f0 (W128.of_int 12);
      f0 <- VPSHUFB_256 f0 shufbidx;
      t0 <- truncateu128 f0;
      t1 <- VEXTRACTI128 f0 W8.one;
      t0 <- VPBLENDW_128 t0 t1 (W8.of_int 224);
      rp <-
        Array960.init
          (WArray960.get8
             (WArray960.set128_direct (WArray960.init8 (fun (i_0 : int) => rp.[i_0])) (20 * i) t0));
      rp <-
        Array960.init
          (WArray960.get8
             (WArray960.set32_direct (WArray960.init8 (fun (i_0 : int) => rp.[i_0])) (
                20 * i + 16) (VPEXTR_32 t1 W8.zero)));
      i <- i + 1;
    }
    
    return rp;
  }
}.

lemma auxcompress10_ll : islossless AuxCompress10.__i_polyvec_compress.
proc. cfold 12. unroll for ^while; wp => /=. 
inline *;unroll for ^while; do 3!(unroll for ^while);auto.
qed.

lemma auxcompress10_corr_h (_aw : W16.t Array768.t):
    hoare[ AuxCompress10.__i_polyvec_compress  :
             a = _aw /\
             pos_bound768_cxq a 0 768 2 ==> 
      res = encode10_vec (compress_polyvec 10 (lift_polyvec _aw))].
proof.
proc; inline *.
proc change ^while.1: (init_256_16 (fun i => r.[256*i0+i]));1: by auto.
proc change ^while.2: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change ^while.^while.1: (sliceget256_16_256 rp0 (i1*256));1: by auto => /#.
proc change ^while.^while.9: (sliceset256_16_256 rp0 (i1*256) r0);1: by auto => /#.
proc change ^while.6: (init_768_16 (fun (i_0 : int) => if 256 * i0 <= i_0 < 256 * i0 + 256 then aux.[i_0 - 256 * i0] else r.[i_0]));1: by auto. 
proc change 7: (sliceget16_16_256 x16p 0); 1: by auto.
proc change ^while{2}.1: (sliceget768_16_256 a (i*256));1: by auto => /#.
proc change 14: (sliceget32_8_256 pvc_shufbidx_s 0); 1: by auto.
proc change ^while{2}.19 : (sliceset960_8_128 rp  (20*i*8) t0);1: by auto => /#.
proc change ^while{2}.20 : (sliceset960_8_32 rp  ((20*i+16)*8) (truncateu32 t1)).
+ move => *;rewrite /sliceset960_8_32 tP => *.
  rewrite initiE /= 1:/# ifT 1:/# initiE 1:/#.
  do congr;1: smt(). 
  by rewrite /VPEXTR_32 /truncateu32 to_uint_eq /= bits32_div //.
unroll for ^while.
do 3!(unroll for ^while).
cfold ^inc<-.
unroll for ^while.
cfold ^i0<-. 
cfold ^i1<-. 
wp -4. 
admitted. (* 
bdep 16 10 [_aw] [a] [rp] compress10_circuit pcond_reduced. 


(* BDEP pre conseq *)
+ move => &hr />; rewrite flatten1 /= pre_lane_commute_in_aligned 1:/# //=.
  rewrite allP /pos_bound768_cxq /= => Hb. 
  rewrite /pcond_reduced /= /tolist /= => x.
  rewrite  mkseqP => He;elim He => /= i [ib?]; rewrite ultE /=.
  have := Hb i; rewrite ib /= qE /=.
  rewrite /to_sint /smod /=.
  smt(W16.to_uint_cmp).

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= <- H0  rr; rewrite /= !flatten1.
move => H1.

apply (inj_eq Array960.to_list Array960.to_list_inj).
apply (flatten_map_eq _ _ W8.w2bits 8 _ W8.w2bits_inj W8.size_w2bits);1:smt().
have -> := post_lane_commute_in_aligned (to_list a{hr}) (to_list (Array960.init ("_.[_]" rr))) W16.w2bits W16.bits2w W8.w2bits W8.bits2w W11.w2bits W11.bits2w  compress11_circuit 16 11 8 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
    smt(Array960.size_to_list Array768.size_to_list W16.bits2wK BVA_Top_Bindings_W11_t.oflistP).

rewrite output_pack_960_8. 
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
have := H0;rewrite /pos_bound768_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /smod /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329)) /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

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
have := H0;rewrite /pos_bound768_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))   /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

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
have := H0;rewrite /pos_bound768_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

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
have := H0;rewrite /pos_bound768_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -Fq.compress_impl_large //=;1:by smt().
by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 

qed.
*)
(********** END BDEP PROOF OF COMPRESS **************)

lemma auxcompress10_corr (_aw : W16.t Array768.t):
    phoare[ AuxCompress10.__i_polyvec_compress  :
             a = _aw /\
             pos_bound768_cxq a 0 768 2 ==> 
      res  = encode10_vec (compress_polyvec 10 (lift_polyvec _aw))] = 1%r 
  by conseq auxcompress10_ll (auxcompress10_corr_h _aw).


lemma polyvec_compress_avx2_ll : islossless Jkem768_avx2.M.__i_polyvec_compress.
proc. cfold 12. unroll for ^while; wp => /=. 
inline *;unroll for ^while; do 3!(unroll for ^while);auto.
qed.

lemma polyvec_compress_avx2_corr (_aw : W16.t Array768.t):
    phoare[ Jkem768_avx2.M.__i_polyvec_compress  :
             a = _aw /\
             pos_bound768_cxq a 0 768 2 ==> 
      res  = encode10_vec (compress_polyvec 10 (lift_polyvec _aw))] = 1%r.
bypr => &m [->?].
have <- : Pr[ AuxCompress10.__i_polyvec_compress(rp{m}, _aw) @ &m :
   res = encode10_vec (compress_polyvec 10 (lift_polyvec _aw))] = 1%r
   by byphoare (auxcompress10_corr _aw)  =>/=;1:smt().
byequiv (: ={arg} /\ a{1} = _aw /\
             pos_bound768_cxq a{1} 0 768 2 ==> ={res}) => //.
proc.
seq 2 2 : (={rp,a} /\ pos_bound768_cxq a{1} 0 768 1).
+ ecall {1} (polyvec_csubq_avx2_corr a{1}). 
  ecall {2} (polyvec_csubq_avx2_corr a{2}). 
  auto => />; rewrite /pos_bound768_cxq /lift_array768 /= qE /= => ? rr1.
  rewrite !tP;move =>  Hrr11 Hrr12 rr2.
  rewrite !tP;move =>  Hrr21 Hrr22.
  move => i ib. 
  have := Hrr11 i ib; rewrite !mapiE 1,2:/# /=. 
  have := Hrr12 i ib.  
  have := Hrr21 i ib; rewrite !mapiE 1,2:/# /=. 
  have := Hrr22 i ib.  
  rewrite /to_sint /smod /=. 
  move => Hrr11i Hrr12i Hrr21i Hrr22i.
  have Hn1 : !(32768 <= to_uint rr2.[i]) by smt(W16.to_uint_cmp pow2_16).
  have Hn2 : !(32768 <= to_uint rr1.[i]) by smt(W16.to_uint_cmp pow2_16).
  have Hn3 : !(32768 <= to_uint _aw.[i]) by smt(W16.to_uint_cmp pow2_16).
  move : Hrr11i Hrr12i Hrr21i Hrr22i; rewrite Hn1 Hn2 Hn3 /=.
  move => Hrr11i Hrr12i Hrr21i Hrr22i.
  move : Hrr12i; rewrite -Hrr22i -eq_incoeff.  
  by rewrite !modz_small ?qE /= 1,2:/# to_uint_eq /#.

cfold {1} ^inc<-. 
cfold {2} ^inc<-. 
sp 9 9.
wp;while (#pre /\ ={i} /\ 0 <= i{1} <=64); last by auto.
wp -1 -1; conseq (: _ ==> ={rp}); 1: by auto => /#.
sim;conseq />.
seq 10 10 : (#pre /\ ={f0}); 1: by conseq />;sim.
auto => /> &1;rewrite vpmaddwd_alt_corr; last by rewrite /VPMADDWD_alt /=.
move => i ib /=; rewrite /VPBROADCAST_16u16 /=.
rewrite Montgomery16.bits16_W16u16 ib /= get_of_list 1:/# /= (nth_map witness) /=;1:smt(size_iota).
have -> : 1023 = 2^10 -1 by auto.
rewrite and_mod 1:/# /= /smod /= /#.
qed.

equiv compressequivvec  : 
 Jkem768_avx2.M.__i_polyvec_compress ~  Jkem768.M.__i_polyvec_compress :
     pos_bound768_cxq a{1} 0 768 2 /\
     pos_bound768_cxq a{2} 0 768 2 /\
    lift_array768 a{1} = lift_array768 a{2} 
    ==> 
    res{2} = Array960.init (fun i => res{1}.[i]).
proc*.
print MLKEM_PolyVec.
ecall {2} (i_polyvec_compress_corr a{2}) => /=.
ecall {1} (polyvec_compress_avx2_corr a{1}).
+ auto => /> &1 &2 ??;rewrite !tP => H k kb. 
   rewrite  /encode10_vec get_of_list 1:/# initiE 1:/# /= get_of_list 1:/# /=; do 4!(congr). 
   rewrite /lift_polyvec eq_vectorP => i ib.
   rewrite tP => j jb.
   smt(liftarrayvector).
qed.

(***************)

(********** BEGIN BDEP PROOF OF DECOMPRESS **************)

op decompress4_circuit(c : W4.t) : W16.t =
  truncateu16 (srl_32 (((zeroextu4_32 c) * W32.of_int 3329) + W32.of_int 8) (W32.of_int 4)).

op pcond_true4(_: W4.t) = true.

lemma poly_decompress_ll : islossless Jkem768_avx2.M._i_poly_decompress.
 proc; inline *;wp. cfold 10; unroll for ^while;auto. 
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

cfold 10.
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
(********** END BDEP PROOF OF DECOMPRESS **************)

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


(********** BEGIN BDEP PROOF OF COMPRESS  **************)
print compress_alt.
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

(********** END BDEP PROOF OF COMPRESS **************)

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

(********** BEGIN BDEP PROOF OF FROMBYTES **************)

from JazzEC require import WArray384.

op frombytes_circuit(c : W12.t) : W16.t = 
  zeroextu16 c.


lemma polyvec_frombytes_ll : islossless Jkem768_avx2.M.__i_polyvec_frombytes.
proc; inline *;wp. 
  while (0 <= i <= 4) (4-i); last by  auto =>  /> /#.
move => *. cfold 3. unroll for ^while;auto => /> /#.
qed.

op  perm_nttunpackv(i : int) : int =  nth (-1) 
  [0; 8; 16; 24; 32; 40; 48; 56; 64; 72; 80; 88; 96; 104; 112; 120; 1; 9; 17; 25; 33; 41; 49; 57; 65; 73; 81; 89; 97;
     105; 113; 121; 2; 10; 18; 26; 34; 42; 50; 58; 66; 74; 82; 90; 98; 106; 114; 122; 3; 11; 19; 27; 35; 43; 51; 59;
     67; 75; 83; 91; 99; 107; 115; 123; 4; 12; 20; 28; 36; 44; 52; 60; 68; 76; 84; 92; 100; 108; 116; 124; 5; 13; 21;
     29; 37; 45; 53; 61; 69; 77; 85; 93; 101; 109; 117; 125; 6; 14; 22; 30; 38; 46; 54; 62; 70; 78; 86; 94; 102; 110;
     118; 126; 7; 15; 23; 31; 39; 47; 55; 63; 71; 79; 87; 95; 103; 111; 119; 127; 128; 136; 144; 152; 160; 168; 176;
     184; 192; 200; 208; 216; 224; 232; 240; 248; 129; 137; 145; 153; 161; 169; 177; 185; 193; 201; 209; 217; 225; 233;
     241; 249; 130; 138; 146; 154; 162; 170; 178; 186; 194; 202; 210; 218; 226; 234; 242; 250; 131; 139; 147; 155; 163;
     171; 179; 187; 195; 203; 211; 219; 227; 235; 243; 251; 132; 140; 148; 156; 164; 172; 180; 188; 196; 204; 212; 220;
     228; 236; 244; 252; 133; 141; 149; 157; 165; 173; 181; 189; 197; 205; 213; 221; 229; 237; 245; 253; 134; 142; 150;
     158; 166; 174; 182; 190; 198; 206; 214; 222; 230; 238; 246; 254; 135; 143; 151; 159; 167; 175; 183; 191; 199; 207;
     215; 223; 231; 239; 247; 255; 256; 264; 272; 280; 288; 296; 304; 312; 320; 328; 336; 344; 352; 360; 368; 376; 257;
     265; 273; 281; 289; 297; 305; 313; 321; 329; 337; 345; 353; 361; 369; 377; 258; 266; 274; 282; 290; 298; 306; 314;
     322; 330; 338; 346; 354; 362; 370; 378; 259; 267; 275; 283; 291; 299; 307; 315; 323; 331; 339; 347; 355; 363; 371;
     379; 260; 268; 276; 284; 292; 300; 308; 316; 324; 332; 340; 348; 356; 364; 372; 380; 261; 269; 277; 285; 293; 301;
     309; 317; 325; 333; 341; 349; 357; 365; 373; 381; 262; 270; 278; 286; 294; 302; 310; 318; 326; 334; 342; 350; 358;
     366; 374; 382; 263; 271; 279; 287; 295; 303; 311; 319; 327; 335; 343; 351; 359; 367; 375; 383; 384; 392; 400; 408;
     416; 424; 432; 440; 448; 456; 464; 472; 480; 488; 496; 504; 385; 393; 401; 409; 417; 425; 433; 441; 449; 457; 465;
     473; 481; 489; 497; 505; 386; 394; 402; 410; 418; 426; 434; 442; 450; 458; 466; 474; 482; 490; 498; 506; 387; 395;
     403; 411; 419; 427; 435; 443; 451; 459; 467; 475; 483; 491; 499; 507; 388; 396; 404; 412; 420; 428; 436; 444; 452;
     460; 468; 476; 484; 492; 500; 508; 389; 397; 405; 413; 421; 429; 437; 445; 453; 461; 469; 477; 485; 493; 501; 509;
     390; 398; 406; 414; 422; 430; 438; 446; 454; 462; 470; 478; 486; 494; 502; 510; 391; 399; 407; 415; 423; 431; 439;
     447; 455; 463; 471; 479; 487; 495; 503; 511; 512; 520; 528; 536; 544; 552; 560; 568; 576; 584; 592; 600; 608; 616;
     624; 632; 513; 521; 529; 537; 545; 553; 561; 569; 577; 585; 593; 601; 609; 617; 625; 633; 514; 522; 530; 538; 546;
     554; 562; 570; 578; 586; 594; 602; 610; 618; 626; 634; 515; 523; 531; 539; 547; 555; 563; 571; 579; 587; 595; 603;
     611; 619; 627; 635; 516; 524; 532; 540; 548; 556; 564; 572; 580; 588; 596; 604; 612; 620; 628; 636; 517; 525; 533;
     541; 549; 557; 565; 573; 581; 589; 597; 605; 613; 621; 629; 637; 518; 526; 534; 542; 550; 558; 566; 574; 582; 590;
     598; 606; 614; 622; 630; 638; 519; 527; 535; 543; 551; 559; 567; 575; 583; 591; 599; 607; 615; 623; 631; 639; 640;
     648; 656; 664; 672; 680; 688; 696; 704; 712; 720; 728; 736; 744; 752; 760; 641; 649; 657; 665; 673; 681; 689; 697;
     705; 713; 721; 729; 737; 745; 753; 761; 642; 650; 658; 666; 674; 682; 690; 698; 706; 714; 722; 730; 738; 746; 754;
     762; 643; 651; 659; 667; 675; 683; 691; 699; 707; 715; 723; 731; 739; 747; 755; 763; 644; 652; 660; 668; 676; 684;
     692; 700; 708; 716; 724; 732; 740; 748; 756; 764; 645; 653; 661; 669; 677; 685; 693; 701; 709; 717; 725; 733; 741;
     749; 757; 765; 646; 654; 662; 670; 678; 686; 694; 702; 710; 718; 726; 734; 742; 750; 758; 766; 647; 655; 663; 671;
     679; 687; 695; 703; 711; 719; 727; 735; 743; 751; 759; 767; 768; 776; 784; 792; 800; 808; 816; 824; 832; 840; 848;
     856; 864; 872; 880; 888; 769; 777; 785; 793; 801; 809; 817; 825; 833; 841; 849; 857; 865; 873; 881; 889; 770; 778;
     786; 794; 802; 810; 818; 826; 834; 842; 850; 858; 866; 874; 882; 890; 771; 779; 787; 795; 803; 811; 819; 827; 835;
     843; 851; 859; 867; 875; 883; 891; 772; 780; 788; 796; 804; 812; 820; 828; 836; 844; 852; 860; 868; 876; 884; 892;
     773; 781; 789; 797; 805; 813; 821; 829; 837; 845; 853; 861; 869; 877; 885; 893; 774; 782; 790; 798; 806; 814; 822;
     830; 838; 846; 854; 862; 870; 878; 886; 894; 775; 783; 791; 799; 807; 815; 823; 831; 839; 847; 855; 863; 871; 879;
     887; 895; 896; 904; 912; 920; 928; 936; 944; 952; 960; 968; 976; 984; 992; 1000; 1008; 1016; 897; 905; 913; 921;
     929; 937; 945; 953; 961; 969; 977; 985; 993; 1001; 1009; 1017; 898; 906; 914; 922; 930; 938; 946; 954; 962; 970;
     978; 986; 994; 1002; 1010; 1018; 899; 907; 915; 923; 931; 939; 947; 955; 963; 971; 979; 987; 995; 1003; 1011;
     1019; 900; 908; 916; 924; 932; 940; 948; 956; 964; 972; 980; 988; 996; 1004; 1012; 1020; 901; 909; 917; 925; 933;
     941; 949; 957; 965; 973; 981; 989; 997; 1005; 1013; 1021; 902; 910; 918; 926; 934; 942; 950; 958; 966; 974; 982;
     990; 998; 1006; 1014; 1022; 903; 911; 919; 927; 935; 943; 951; 959; 967; 975; 983; 991; 999; 1007; 1015; 1023] i. 

op  perm_nttpackv(i : int) =  nth (-1) 
  [0; 16; 32; 48; 64; 80; 96; 112; 1; 17; 33; 49; 65; 81; 97; 113; 2; 18; 34; 50; 66; 82; 98; 114; 3; 19; 35; 51;
        67; 83; 99; 115; 4; 20; 36; 52; 68; 84; 100; 116; 5; 21; 37; 53; 69; 85; 101; 117; 6; 22; 38; 54; 70; 86; 102;
        118; 7; 23; 39; 55; 71; 87; 103; 119; 8; 24; 40; 56; 72; 88; 104; 120; 9; 25; 41; 57; 73; 89; 105; 121; 10; 26;
        42; 58; 74; 90; 106; 122; 11; 27; 43; 59; 75; 91; 107; 123; 12; 28; 44; 60; 76; 92; 108; 124; 13; 29; 45; 61;
        77; 93; 109; 125; 14; 30; 46; 62; 78; 94; 110; 126; 15; 31; 47; 63; 79; 95; 111; 127; 128; 144; 160; 176; 192;
        208; 224; 240; 129; 145; 161; 177; 193; 209; 225; 241; 130; 146; 162; 178; 194; 210; 226; 242; 131; 147; 163;
        179; 195; 211; 227; 243; 132; 148; 164; 180; 196; 212; 228; 244; 133; 149; 165; 181; 197; 213; 229; 245; 134;
        150; 166; 182; 198; 214; 230; 246; 135; 151; 167; 183; 199; 215; 231; 247; 136; 152; 168; 184; 200; 216; 232;
        248; 137; 153; 169; 185; 201; 217; 233; 249; 138; 154; 170; 186; 202; 218; 234; 250; 139; 155; 171; 187; 203;
        219; 235; 251; 140; 156; 172; 188; 204; 220; 236; 252; 141; 157; 173; 189; 205; 221; 237; 253; 142; 158; 174;
        190; 206; 222; 238; 254; 143; 159; 175; 191; 207; 223; 239; 255; 256; 272; 288; 304; 320; 336; 352; 368; 257;
        273; 289; 305; 321; 337; 353; 369; 258; 274; 290; 306; 322; 338; 354; 370; 259; 275; 291; 307; 323; 339; 355;
        371; 260; 276; 292; 308; 324; 340; 356; 372; 261; 277; 293; 309; 325; 341; 357; 373; 262; 278; 294; 310; 326;
        342; 358; 374; 263; 279; 295; 311; 327; 343; 359; 375; 264; 280; 296; 312; 328; 344; 360; 376; 265; 281; 297;
        313; 329; 345; 361; 377; 266; 282; 298; 314; 330; 346; 362; 378; 267; 283; 299; 315; 331; 347; 363; 379; 268;
        284; 300; 316; 332; 348; 364; 380; 269; 285; 301; 317; 333; 349; 365; 381; 270; 286; 302; 318; 334; 350; 366;
        382; 271; 287; 303; 319; 335; 351; 367; 383; 384; 400; 416; 432; 448; 464; 480; 496; 385; 401; 417; 433; 449;
        465; 481; 497; 386; 402; 418; 434; 450; 466; 482; 498; 387; 403; 419; 435; 451; 467; 483; 499; 388; 404; 420;
        436; 452; 468; 484; 500; 389; 405; 421; 437; 453; 469; 485; 501; 390; 406; 422; 438; 454; 470; 486; 502; 391;
        407; 423; 439; 455; 471; 487; 503; 392; 408; 424; 440; 456; 472; 488; 504; 393; 409; 425; 441; 457; 473; 489;
        505; 394; 410; 426; 442; 458; 474; 490; 506; 395; 411; 427; 443; 459; 475; 491; 507; 396; 412; 428; 444; 460;
        476; 492; 508; 397; 413; 429; 445; 461; 477; 493; 509; 398; 414; 430; 446; 462; 478; 494; 510; 399; 415; 431;
        447; 463; 479; 495; 511; 512; 528; 544; 560; 576; 592; 608; 624; 513; 529; 545; 561; 577; 593; 609; 625; 514;
        530; 546; 562; 578; 594; 610; 626; 515; 531; 547; 563; 579; 595; 611; 627; 516; 532; 548; 564; 580; 596; 612;
        628; 517; 533; 549; 565; 581; 597; 613; 629; 518; 534; 550; 566; 582; 598; 614; 630; 519; 535; 551; 567; 583;
        599; 615; 631; 520; 536; 552; 568; 584; 600; 616; 632; 521; 537; 553; 569; 585; 601; 617; 633; 522; 538; 554;
        570; 586; 602; 618; 634; 523; 539; 555; 571; 587; 603; 619; 635; 524; 540; 556; 572; 588; 604; 620; 636; 525;
        541; 557; 573; 589; 605; 621; 637; 526; 542; 558; 574; 590; 606; 622; 638; 527; 543; 559; 575; 591; 607; 623;
        639; 640; 656; 672; 688; 704; 720; 736; 752; 641; 657; 673; 689; 705; 721; 737; 753; 642; 658; 674; 690; 706;
        722; 738; 754; 643; 659; 675; 691; 707; 723; 739; 755; 644; 660; 676; 692; 708; 724; 740; 756; 645; 661; 677;
        693; 709; 725; 741; 757; 646; 662; 678; 694; 710; 726; 742; 758; 647; 663; 679; 695; 711; 727; 743; 759; 648;
        664; 680; 696; 712; 728; 744; 760; 649; 665; 681; 697; 713; 729; 745; 761; 650; 666; 682; 698; 714; 730; 746;
        762; 651; 667; 683; 699; 715; 731; 747; 763; 652; 668; 684; 700; 716; 732; 748; 764; 653; 669; 685; 701; 717;
        733; 749; 765; 654; 670; 686; 702; 718; 734; 750; 766; 655; 671; 687; 703; 719; 735; 751; 767; 768; 784; 800;
        816; 832; 848; 864; 880; 769; 785; 801; 817; 833; 849; 865; 881; 770; 786; 802; 818; 834; 850; 866; 882; 771;
        787; 803; 819; 835; 851; 867; 883; 772; 788; 804; 820; 836; 852; 868; 884; 773; 789; 805; 821; 837; 853; 869;
        885; 774; 790; 806; 822; 838; 854; 870; 886; 775; 791; 807; 823; 839; 855; 871; 887; 776; 792; 808; 824; 840;
        856; 872; 888; 777; 793; 809; 825; 841; 857; 873; 889; 778; 794; 810; 826; 842; 858; 874; 890; 779; 795; 811;
        827; 843; 859; 875; 891; 780; 796; 812; 828; 844; 860; 876; 892; 781; 797; 813; 829; 845; 861; 877; 893; 782;
        798; 814; 830; 846; 862; 878; 894; 783; 799; 815; 831; 847; 863; 879; 895; 896; 912; 928; 944; 960; 976; 992;
        1008; 897; 913; 929; 945; 961; 977; 993; 1009; 898; 914; 930; 946; 962; 978; 994; 1010; 899; 915; 931; 947;
        963; 979; 995; 1011; 900; 916; 932; 948; 964; 980; 996; 1012; 901; 917; 933; 949; 965; 981; 997; 1013; 902;
        918; 934; 950; 966; 982; 998; 1014; 903; 919; 935; 951; 967; 983; 999; 1015; 904; 920; 936; 952; 968; 984;
        1000; 1016; 905; 921; 937; 953; 969; 985; 1001; 1017; 906; 922; 938; 954; 970; 986; 1002; 1018; 907; 923; 939;
        955; 971; 987; 1003; 1019; 908; 924; 940; 956; 972; 988; 1004; 1020; 909; 925; 941; 957; 973; 989; 1005; 1021;
        910; 926; 942; 958; 974; 990; 1006; 1022; 911; 927; 943; 959; 975; 991; 1007; 1023] i. 

lemma perm_nttunpackv_rng i :
  0 <= i < 768 => 0<= perm_nttunpackv i <768.
proof.
  have : all (fun i => 0 <= perm_nttunpackv i < 768) (iota_ 0 768).
  + by rewrite /perm_nttunpackv  -iotaredE /=.
  move => H Hi; rewrite allP in H; move : (H i _);by smt(mem_iota). 
qed.

lemma perm_nttpackv_rng i :
  0 <= i < 768 => 0<= perm_nttpackv i <768.
proof.
  have : all (fun i => 0 <= perm_nttpackv i < 768) (iota_ 0 768).
  + by rewrite /perm_nttpackv  -iotaredE /=.
  move => H Hi; rewrite allP in H; move : (H i _);by smt(mem_iota). 
qed. 


lemma post_lane_commute_out_aligned_perm ['a 'b 'c]
    (lic : 'a list) 
    (lo : 'c list) 
    (tobitsic : 'a -> bool list)
    (ofbitsic : bool list -> 'a)
    (tobitsi : 'b -> bool list)
    (ofbitsi : bool list -> 'b)
    (tobitso : 'c -> bool list)
    (ofbitso : bool list -> 'c)
    (f : 'b -> 'c)
    (nic ni no  : int) 
    (perm : int -> int)
    (permi : int -> int):
  0 < nic =>  0 < ni => 0 < no => 
  ni %| nic*size lic =>
  size lo = (nic*size lic) %/ ni =>
  (forall x, size (tobitsic x) = nic) =>
  (forall x, ofbitsic (tobitsic x) = x) =>
  (forall x, size (tobitsi x) = ni) =>
  (forall x, ofbitsi (tobitsi x) = x) =>
  (forall x, size x = ni => tobitsi (ofbitsi x) = x) =>
  (forall x, size (tobitso x) = no) =>
  (forall x, ofbitso (tobitso x) = x) =>
  (forall ii, 0 <= ii < size lo => 0 <= perm ii < size lo) =>
  (forall ii, 0 <= ii < size lo => permi (perm ii) = ii) =>
map f (map ofbitsi (chunk ni (flatten (map tobitsic lic)))) =
mkseq (fun (i1 : int) => nth witness
(map ofbitso (chunk no (flatten (map tobitso lo)))) (permi i1)) 
   (size (map ofbitso (chunk no (flatten (map tobitso lo))))) => 
   lo =
   mkseq (fun (i1 : int) => nth witness 
      (map f (map ofbitsi (chunk ni (flatten (map tobitsic lic)))))
         (perm i1)) (size ((map f (map ofbitsi (chunk ni (flatten (map tobitsic lic))))))).
move => ??????????????; rewrite  !map_chunk_flatten_id 1..3:/#.
move => H.
apply (eq_from_nth witness).
+ rewrite size_mkseq. 
  rewrite !size_map size_iota (EclibExtra.size_flatten' nic);1:smt(mapP).
  rewrite size_map; smt(size_ge0).   
move => i ib.
rewrite nth_mkseq /=.
+ rewrite !size_map size_iota (EclibExtra.size_flatten' nic);1:smt(mapP).
  rewrite size_map; smt(size_ge0).   
rewrite H.
rewrite nth_mkseq /=;1,2:smt().
qed.

lemma nttpermsK i :
 0 <= i < 768 => 
   perm_nttpackv (perm_nttunpackv i) = i.
proof.
move => Hi.
have : all (fun i => perm_nttpackv (perm_nttunpackv i) = i) (iota_ 0 768); 
  last by rewrite allP /= => H; rewrite H; smt(mem_iota).
rewrite  /perm_nttunpackv /perm_nttpackv /nttpackv /nttunpackv.
rewrite /nttpack /nttunpack /subarray256 -iotaredE /=;do split;smt().
qed. 

lemma nttpermsKi i :
 0 <= i < 768 => 
   perm_nttunpackv (perm_nttpackv i) = i.
proof.
move => Hi.
have : all (fun i => perm_nttunpackv (perm_nttpackv i) = i) (iota_ 0 768); 
  last by rewrite allP /= => H; rewrite H; smt(mem_iota).
rewrite  /perm_nttunpackv /perm_nttpackv /nttpackv /nttunpackv.
rewrite /nttpack /nttunpack /subarray256 -iotaredE /=;do split;smt().
qed. 

lemma polyvec_frombytes_corr_h (_aw : W8.t Array1536.t): 
    hoare [Jkem768_avx2.M.__i_polyvec_frombytes  :
             a = _aw
              ==>
             lift_array768 res = nttunpackv (map incoeff (decode12_vec _aw))  /\
             pos_bound768_cxq res 0 768  2].
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
proc change ^while.7: (init_768_16 (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux.[i_0 - 256 * i] else r.[i_0])); 1: by auto.

unroll for ^while.
do 4!(unroll for ^while).
cfold ^i0<-.
wp -2. 

bdep 12 16 [_aw] [a] [r] frombytes_circuit pcond_true12 perm_nttpackv. 

(* BDEP pre conseq *)
+ by move => &hr />; rewrite allP /pcond_true12 /=. 

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= <- rr; rewrite /= !flatten1.

move => H1; have H2 := post_lane_commute_out_aligned_perm (to_list a{hr}) (to_list rr) W8.w2bits W8.bits2w W12.w2bits W12.bits2w W16.w2bits W16.bits2w  frombytes_circuit 8 12 16 perm_nttunpackv perm_nttpackv _ _ _ _ _ _ _ _ _ _ _ _ _ _ _;1..12:
smt(Array1536.size_to_list Array768.size_to_list W16.bits2wK BVA_Top_Bindings_W12_t.oflistP).
+ smt(perm_nttunpackv_rng Array768.size_to_list).
+ move => ?; rewrite Array768.size_to_list => ?;smt(nttpermsK). 

  have /=? := decode_range_vec 0 (to_list a{hr}) 12 _ _;1,2:smt(Array1536.size_to_list).

+ by smt().

have H3 : 
  map frombytes_circuit (map W12.bits2w (chunk 12 (flatten (map W8.w2bits (to_list a{hr}))))) =
   to_list (map W16.of_int  (decode12_vec a{hr})).
+ rewrite /decode12_vec Array768.map_of_list Array768.of_listK;1:by rewrite !size_map /decode size_iota size_BytesToBits size_to_list /#.
  rewrite /decode -map_comp -(map_comp _ BS2Int.bs2int) /=.
  apply eq_in_map => x xb.
  rewrite /(\o) /frombytes_circuit /zeroextu16.
  have ? : size x = 12 by smt(@BitChunking).
  congr;rewrite /to_uint W12.bits2wK;1 :  by smt(@BitChunking).
  done.

split.
+ rewrite tP => i ib.
  rewrite mapiE 1:/# /= initiE 1:/# /=.
  case (0<=i<256) => *.
  + rewrite /nttunpack initiE 1:/# /= /subarray256 initiE /=;1:smt( nttunpack_inbounds).
    rewrite mapiE /=;1:smt( nttunpack_inbounds).
    rewrite -(Array768.get_to_list rr) H2 H3 /decode12.
    rewrite nth_mkseq /=;1: by smt(Array768.size_to_list).
    + rewrite  mapiE;1: by smt(perm_nttunpackv_rng).
    congr; rewrite of_sintK /=.
     rewrite /smod /= ifF. 
     + rewrite /decode12_vec get_of_list;1: smt(perm_nttunpackv_rng). 
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite modz_small. 
    + rewrite /decode12_vec get_of_list; 1: smt(perm_nttunpackv_rng).
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite /perm_nttunpackv /nttunpackv initiE 1:/# /= /#.

  case (256<=i<512) => *.
  + rewrite /nttunpack initiE 1:/# /= /subarray256 initiE /=;1:smt( nttunpack_inbounds).
    rewrite mapiE /=;1:smt( nttunpack_inbounds).
    rewrite -(Array768.get_to_list rr) H2 H3 /decode12.
    rewrite nth_mkseq /=;1: by smt(Array768.size_to_list).
    + rewrite  mapiE;1: by smt(perm_nttunpackv_rng).
    congr; rewrite of_sintK /=.
     rewrite /smod /= ifF. 
     + rewrite /decode12_vec get_of_list;1: smt(perm_nttunpackv_rng). 
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite modz_small. 
    + rewrite /decode12_vec get_of_list; 1: smt(perm_nttunpackv_rng).
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite /perm_nttunpackv /nttunpackv initiE 1:/# /= /#.

  case (512<=i<768) => *.
  + rewrite /nttunpack initiE 1:/# /= /subarray256 initiE /=;1:smt( nttunpack_inbounds).
    rewrite mapiE /=;1:smt( nttunpack_inbounds).
    rewrite -(Array768.get_to_list rr) H2 H3 /decode12.
    rewrite nth_mkseq /=;1: by smt(Array768.size_to_list).
    + rewrite  mapiE;1: by smt(perm_nttunpackv_rng).
    congr; rewrite of_sintK /=.
     rewrite /smod /= ifF. 
     + rewrite /decode12_vec get_of_list;1: smt(perm_nttunpackv_rng). 
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite modz_small. 
    + rewrite /decode12_vec get_of_list; 1: smt(perm_nttunpackv_rng).
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite /perm_nttunpackv /nttunpackv initiE 1:/# /= /#.

  + rewrite /nttunpack initiE 1:/# /= /subarray256 initiE /=;1:smt( nttunpack_inbounds).
    rewrite mapiE /=;1:smt( nttunpack_inbounds).
    rewrite -(Array768.get_to_list rr) H2 H3 /decode12.
    rewrite nth_mkseq /=;1: by smt(Array768.size_to_list).
    + rewrite  mapiE;1: by smt(perm_nttunpackv_rng).
    congr; rewrite of_sintK /=.
     rewrite /smod /= ifF. 
     + rewrite /decode12_vec get_of_list;1: smt(perm_nttunpackv_rng). 
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite modz_small. 
    + rewrite /decode12_vec get_of_list; 1: smt(perm_nttunpackv_rng).
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite /perm_nttunpackv /nttunpackv initiE 1:/# /= /#.

  rewrite /pos_bound768_cxq qE /= => k kb. 
  have /=? := decode_range_vec witness (to_list a{hr}) 12 _ _;1..2:smt(Array1536.size_to_list).
  rewrite -get_to_list  H2 H3 /decode12_vec.
  rewrite nth_mkseq /=;1: by rewrite size_map size_iota /#. 
  rewrite get_of_list;1:smt(perm_nttunpackv_rng). 
  rewrite (nth_map witness);1:smt(perm_nttunpackv_rng). 
rewrite of_sintK /= /smod /= ifF;1:smt(@Zq perm_nttunpackv_rng).
  rewrite modz_small;1,2:  smt(perm_nttunpackv_rng).  
   
qed.

(********** END BDEP PROOF OF FROMBYTES **************)

lemma polyvec_frombytes_corr (_aw : W8.t Array1536.t): 
    phoare [Jkem768_avx2.M.__i_polyvec_frombytes  :
             a = _aw
              ==>
             lift_array768 res = nttunpackv (map incoeff (decode12_vec _aw))  /\
             pos_bound768_cxq res 0 768  2] = 1%r
  by conseq polyvec_frombytes_ll (polyvec_frombytes_corr_h _aw).

lemma polyvec_frombytes_equiv :
    equiv [Jkem768_avx2.M.__i_polyvec_frombytes ~Jkem768.M.__i_polyvec_frombytes :
             a{1}=ap{2} ==>
             lift_array768 res{1} = nttunpackv (lift_array768 res{2}) /\
             pos_bound768_cxq res{1} 0 768 2 /\
             pos_bound768_cxq res{2} 0 768 2 ].
proc*.
ecall{1} (polyvec_frombytes_corr a{1}).
ecall{2} (MLKEM_PolyVec.polyvec_frombytes_corr ap{2}).
auto => /> &2 rr1 -> ? rr2 -> ? //.
qed.


lemma subequiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
    equiv [Jkem768_avx2.M._poly_sub ~Jkem768.M._poly_sub :
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
 Jkem768_avx2.M._poly_frommont ~  Jkem768.M._poly_frommont :
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
 Jkem768_avx2.M.__poly_reduce ~  Jkem768.M.__poly_reduce :
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
 Jkem768_avx2.M.__poly_reduce ~  Jkem768.M.__poly_reduce :
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
 Jkem768_avx2.M._poly_basemul ~Jkem768.M._poly_basemul :
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
    equiv [Jkem768_avx2.M._poly_add2 ~Jkem768.M._poly_add2 :
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
    equiv [Jkem768_avx2.M._poly_add2 ~Jkem768.M._poly_add2 :
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



(********** BEGIN BDEP PROOF OF FROMMSG **************)

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

lemma compress_poly_rng i xs :
  1 <= i < 12 =>
  all (fun (x : int) => 0 <= x < 2^i) (compress_poly i xs).
rewrite /compress_poly /map allP => Hi j Hj. rewrite !initiE //=. rewrite compress_rng //. qed.


lemma poly_tomsg_ll : islossless Jkem768_avx2.M._i_poly_tomsg.
proc.
cfold 7.
inline *.
do 2!(unroll for ^while).
auto.
qed.

(********** BEGIN BDEP PROOF OF TOMSG **************)


op compress1_circuit(a : W16.t) : bool = 
   if (a \ult W16.of_int 3329) then  
   (srl_32 ((sll_32 (zeroextu32 a) (W32.of_int 1) + W32.of_int 1665) * W32.of_int 80635) (W32.of_int 28)).[0]
   else 
   (srl_32 ((sll_32 (zeroextu32 (W16_sub a (W16.of_int 3329))) (W32.of_int 1) + W32.of_int 1665) * W32.of_int 80635) (W32.of_int 28)).[0].  

op pcond_reduced (w: W16.t) =   w \ult W16.of_int (2*3329). 

lemma poly_tomsg_corr_h _aw : 
    hoare [Jkem768_avx2.M._i_poly_tomsg :
             pos_bound256_cxq a 0 256 2 /\ 
              a = _aw
              ==>
             res.`1 = encode1 (compress_poly 1 (lift_array256 _aw))  ].
proof.
proc; inline *.
proc change 3 : (sliceget16_16_256 jqx16 0);1: by auto.
proc change ^while.1: (sliceget256_16_256 rp0 (i0*256));1: by auto => /#.
proc change ^while.9: (sliceset256_16_256 rp0 (i0*256) r);1: by auto => /#.
proc change 8: (sliceget16_16_256 px16 0); 1: by auto.
proc change 10: (sliceget16_16_256 px16 0); 1: by auto.
proc change ^while{2}.1: (sliceget256_16_256 a (2*i*256));1: by auto => /#.
proc change ^while{2}.2: (sliceget256_16_256 a ((2*i+1)*256));1: by auto => /#.
proc change ^while{2}.14 : (sliceset32_8_32 rp  (i*32) c);1: by auto => /#.


cfold 11.
unroll for ^while.
cfold ^i0<-.
unroll for ^while.
wp -3. 

bdep 16 1 [_aw] [a] [rp] compress1_circuit pcond_reduced. 

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

apply (inj_eq Array32.to_list Array32.to_list_inj).
apply (flatten_map_eq _ _ W8.w2bits 8 _ W8.w2bits_inj W8.size_w2bits);1:smt().
have -> := post_lane_commute_in_aligned (to_list a{hr}) (to_list rr) W16.w2bits W16.bits2w W8.w2bits W8.bits2w bool2bits bits2bool  compress1_circuit 16 1 8 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
    smt(Array32.size_to_list Array256.size_to_list W16.bits2wK BVA_Top_Pervasive_bool.oflistP).

rewrite output_pack_32_8. 
+ rewrite (EclibExtra.size_flatten' 1);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=.

congr.
rewrite /compress1_circuit /compress_poly -map_comp -map_comp -map_comp /(\o) /=.  
apply (eq_from_nth witness); 1: by rewrite !size_map //.
rewrite size_map size_iota /max /= => i ib; rewrite !(nth_map witness) //=;1,2:smt(size_iota).
rewrite nth_iota 1:/# -(BVA_Top_Pervasive_bool.oflistP (BS2Int.int2bs 1 (map (compress 1) (lift_array256 a{hr})).[i]));1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Pervasive_bool.ofintP /lift_array256;rewrite !mapiE;1,2:smt().

rewrite /i2b !get_to_uint /=.

(* This is now the equivalence betwen specs. It's made slightly more verbose
   because the impl circuit is only proved correct wrt compress for values
   in the q range. *)
rewrite ultE /=. 
case (to_uint a{hr}.[i] < 3329) => /= *.
+ rewrite -compress_impl_small //=;1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).  
  congr;congr;rewrite modz_mod;congr;congr.
  by rewrite /srl_32 /sll_32 /(`<<`) /(`>>`).

have := H0;rewrite /pos_bound256_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -compress_impl_small //=;1:by smt().
by rewrite modz_mod /srl_32 /sll_32 /(`<<`) /(`>>`).
qed.

(********** END BDEP PROOF OF TOMSG **************)


lemma poly_tomsg_corr _aw : 
    phoare [Jkem768_avx2.M._i_poly_tomsg :
             pos_bound256_cxq a 0 256 2 /\ 
              a = _aw
              ==>
             res.`1 = encode1 (compress_poly 1 (lift_array256 _aw))  ] = 1%r
  by conseq poly_tomsg_ll (poly_tomsg_corr_h _aw).

equiv tomsgequiv_noperm  : 
 Jkem768_avx2.M._i_poly_tomsg ~  Jkem768.M._i_poly_tomsg :
    lift_array256 a{1} = lift_array256 a{2} /\
    pos_bound256_cxq a{1} 0 256 2 /\ 
    pos_bound256_cxq a{2} 0 256 2 ==>
    res{1}.`1 = res{2}.`1.
proc *.
ecall {1} (poly_tomsg_corr a{1}).
ecall {2} (MLKEM_Poly.poly_tomsg_corr a{2}).
auto => /#. 
qed.

(********** BEGIN BDEP PROOF OF TOBYTES **************)

op tobytes_circuit(a : W16.t) : W12.t = 
   if (a \ult W16.of_int 3329) then truncateu12 a else truncateu12 (W16_sub a (W16.of_int 3329)).  

lemma polyvec_tobytes_ll : islossless Jkem768_avx2.M.__i_polyvec_tobytes.
proc.
inline *. 
do 9!(unroll for ^while); auto. 
qed.

lemma post_lane_commute_in_aligned_perm ['a 'b 'c]
    (li : 'a list) 
    (loc : 'b list) 
    (tobitsi : 'a -> bool list)
    (ofbitsi : bool list -> 'a)
    (tobitsoc : 'b -> bool list)
    (ofbitsoc : bool list -> 'b)
    (tobitso : 'c -> bool list)
    (ofbitso : bool list -> 'c)
    (f : 'a -> 'c)
    (ni no noc  : int) 
    (perm : int -> int)
    (permi : int -> int):
  0 < ni =>  0 < no => 0 < noc => 
  no %| noc*size loc =>
  size li = (noc*size loc) %/ no =>
  (forall x, size (tobitsi x) = ni) =>
  (forall x, ofbitsi (tobitsi x) = x) =>
  (forall x, size (tobitso x) = no) =>
  (forall x, ofbitso (tobitso x) = x) =>
  (forall x, size x = no => tobitso (ofbitso x) = x) =>
  (forall x, size (tobitsoc x) = noc) =>
  (forall x, ofbitsoc (tobitsoc x) = x) =>
  (forall ii, 0 <= ii < size li => 0 <= permi ii < size li) =>
  (forall ii, 0 <= ii < size li => perm (permi ii) = ii) =>
map f (map ofbitsi (chunk ni (flatten (map tobitsi  li)))) =
mkseq (fun i => nth witness
     (map ofbitso (chunk no (flatten (map tobitsoc loc)))) (perm i)) 
      (size (map ofbitso (chunk no (flatten (map tobitsoc loc))))) => 
   flatten (map tobitsoc loc) =
   flatten (map tobitso (map f (mkseq (fun i => nth witness li (permi i)) (size li)))).
move => 14?.
rewrite map_chunk_flatten_id 1..3:/#.
move => H.
rewrite map_mkseq /(\o) /=.
have -> : (mkseq (fun (x : int) => f (nth witness li (permi x))) (size li)) =
   (mkseq (fun (x : int) =>  (nth witness (map f li) (permi x))) (size li)).
+ apply eq_in_mkseq => i ib /=.
  by rewrite (nth_map witness) 1:/#.
rewrite H.
have -> : (mkseq
        (fun (x : int) =>
           nth witness
             (mkseq (fun (i : int) => nth witness (map ofbitso (chunk no (flatten (map tobitsoc loc)))) (perm i))
                (size (map ofbitso (chunk no (flatten (map tobitsoc loc)))))) (
             permi x)) (size li)) =
   map ofbitso (mkseq
        (fun (x : int) =>
           nth witness
             (mkseq (fun (i : int) => nth witness (chunk no (flatten (map tobitsoc loc))) (perm i))
                (size (map ofbitso (chunk no (flatten (map tobitsoc loc)))))) (
             permi x)) (size li)).
have -> := map_mkseq ofbitso
     (fun (x : int) =>
        nth witness
          (mkseq (fun (i : int) => nth witness (chunk no (flatten (map tobitsoc loc))) (perm i))
             (size (map ofbitso (chunk no (flatten (map tobitsoc loc)))))) (
          permi x)) (size li).
+ apply eq_in_mkseq => i ib /=.
  rewrite /(\o) /= !(nth_mkseq) /=;1,2: by 
  rewrite size_map size_chunk 1:/#  (EclibExtra.size_flatten' noc);smt(mapP size_map).
  by rewrite (nth_map witness);1: by
   rewrite size_chunk 1:/# (EclibExtra.size_flatten' noc);smt(mapP size_map).

rewrite -map_comp /(\o) /=.

have -> : (mkseq
        (fun (x : int) =>
           nth witness
             (mkseq (fun (i : int) => nth witness (chunk no (flatten (map tobitsoc loc))) (perm i))
                (size (map ofbitso (chunk no (flatten (map tobitsoc loc)))))) (
             permi x)) (size li))
 = (chunk no (flatten (map tobitsoc loc))) .
+ apply (eq_from_nth witness).
  + rewrite size_mkseq size_chunk 1:/# (EclibExtra.size_flatten' noc);1: smt(mapP).
    rewrite size_map;smt(size_ge0).
  move => i; rewrite size_mkseq /max => ib.
  rewrite nth_mkseq 1:/# /= nth_mkseq /=.  
  + rewrite size_map size_chunk 1:/# (EclibExtra.size_flatten' noc);1: smt(mapP).
    rewrite size_map;smt(size_ge0).
  by smt().
have /= [-> x] := eq_in_map (fun (x : bool list) => tobitso (ofbitso x)) idfun (chunk no (flatten (map tobitsoc loc))).
have := in_chunk_size no (flatten (map tobitsoc loc)) x _;smt().

rewrite map_id chunkK 1:/#; last by done.
rewrite (EclibExtra.size_flatten' noc); smt(size_map mapP).
qed.

lemma output_pack_1536_8(l : bool list) :
 size l = 768*12 =>
 flatten
  (map W8.w2bits
     (to_list (Array1536.of_list W8.zero (BitsToBytes l)))) = l.
move => *.
rewrite of_listK; 1: by rewrite size_BitsToBytes /#.
have ? : size (flatten (map W8.w2bits (BitsToBytes l))) = size l.
+ rewrite (EclibExtra.size_flatten' 8);1: smt(mapP W8.size_w2bits).
  by rewrite size_map size_BitsToBytes /#.

apply (eq_from_nth witness); 1: smt().
move => i ib.
rewrite (nth_flatten _ 8);1: by rewrite allP => *; smt( mapP W8.size_w2bits).
rewrite (nth_map witness);1: smt(size_BitsToBytes).
rewrite /BitsToBytes (nth_map []);1:by smt(size_chunk).
rewrite bits2wK;1: smt(size_nth_chunk).
rewrite -(nth_flatten _ 8);1: by rewrite allP => * /=;smt(in_chunk_size). 
by rewrite chunkK /#.
qed.

lemma nttpackv_alt (a : W16.t Array768.t) i :
 0 <= i < 768 =>
  a.[perm_nttpackv i] = (nttpackv a).[i].
proof.
move => ?;have : all (fun i => a.[perm_nttpackv i] = (nttpackv a).[i]) (iota_ 0 768);
  last by rewrite allP => H; move : (H i);smt(mem_iota).
by rewrite /nttpackv /subarray256 /nttpack /perm_nttpackv -iotaredE /=.
qed. 

abbrev mask12 = VPBROADCAST_16u16(W16.of_int 4095).

module AuxToBytes = {
proc __i_polyvec_tobytes(r : W8.t Array1536.t, a : W16.t Array768.t) : W8.t Array1536.t = {
  var i,rp,a0,i0,t0,t1,t2,t3,t4,t5,t6,t7,tt,ttt,a1,b,t00,r00,t10,r1,a2,b0,t01,r01,t11,r10,a3,b1,t02,r02,t12,r11,a4,b2,t03,t13,a5,b3,t04,t14,a6,b4,t05,t15,a7,b5,r03,r12,a8,b6,r04,r13,a9,b7,r05,r14,a10,b8,r06,r15,a11,b9,r07,r16,a12,b10,r08,r17,aux,aux_0;
  i <- 0;                                                                                                                       
  while (i < 4) {                                                                                                              
    rp <- Array384.init (fun (i_0 : int) => r.[384 * i + i_0]);                                                                 
    a0 <- Array256.init (fun (i_0 : int) => a.[256 * i + i_0]);  
    a0 <@ Jkem768_avx2.M._poly_csubq(a0);                                                           
    i0 <- 0;                                                                                                                    
    while (i0 < 2) {                                                                                                           
      t0 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0);                                                   
      t1 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 1);                                               
      t2 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 2);                                               
      t3 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 3);                                               
      t4 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 4);                                               
      t5 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 5);                                               
      t6 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 6);                                               
      t7 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 7);                                               
      t0 <- t0 `&` mask12;                                                                                                      
      t1 <- t1 `&` mask12;                                                                                                      
      t2 <- t2 `&` mask12;                                                                                                      
      t3 <- t3 `&` mask12;                                                                                                      
      t4 <- t4 `&` mask12;                                                                                                      
      t5 <- t5 `&` mask12;                                                                                                      
      t6 <- t6 `&` mask12;                                                                                                      
      t7 <- t7 `&` mask12;                                                                                                      
      tt <- VPSLL_16u16 t1 (W128.of_int 12);                                                                                    
      tt <- tt `|` t0;                                                                                                          
      t0 <- VPSRL_16u16 t1 (W128.of_int 4);                                                                                     
      t1 <- VPSLL_16u16 t2 (W128.of_int 8);                                                                                     
      t0 <- t0 `|` t1;                                                                                                          
      t1 <- VPSRL_16u16 t2 (W128.of_int 8);                                                                                     
      t2 <- VPSLL_16u16 t3 (W128.of_int 4);                                                                                     
      t1 <- t1 `|` t2;                                                                                                          
      t2 <- VPSLL_16u16 t5 (W128.of_int 12);                                                                                    
      t2 <- t2 `|` t4;                                                                                                          
      t3 <- VPSRL_16u16 t5 (W128.of_int 4);                                                                                     
      t4 <- VPSLL_16u16 t6 (W128.of_int 8);                                                                                     
      t3 <- t3 `|` t4;                                                                                                         
      t4 <- VPSRL_16u16 t6 (W128.of_int 8);                                                                                     
      t5 <- VPSLL_16u16 t7 (W128.of_int 4);                                                                                     
      t4 <- t4 `|` t5;                                                                                                          
      a1 <- tt;                                                                                                                 
      b <- t0;                                                                                                                  
      t00 <- VPSLL_8u32 b (W128.of_int 16);                                                                                     
      r00 <- VPBLENDW_256 a1 t00 (W8.of_int 170);                                                                               
      t10 <- VPSRL_8u32 a1 (W128.of_int 16);                                                                                    
      r1 <- VPBLENDW_256 t10 b (W8.of_int 170);                                                                                 
      (ttt, t0) <- (r00, r1);                                                                                                   
      a2 <- t1;                                                                                                                 
      b0 <- t2;                                                                                                                 
      t01 <- VPSLL_8u32 b0 (W128.of_int 16);                                                                                    
      r01 <- VPBLENDW_256 a2 t01 (W8.of_int 170);                                                                               
      t11 <- VPSRL_8u32 a2 (W128.of_int 16);                                                                                    
      r10 <- VPBLENDW_256 t11 b0 (W8.of_int 170);                                                                               
      (tt, t2) <- (r01, r10);                                                                                                   
      a3 <- t3;                                                                                                                 
      b1 <- t4;                                                                                                                
      t02 <- VPSLL_8u32 b1 (W128.of_int 16);                                                                                    
      r02 <- VPBLENDW_256 a3 t02 (W8.of_int 170);                                                                               
      t12 <- VPSRL_8u32 a3 (W128.of_int 16);                                                                                    
      r11 <- VPBLENDW_256 t12 b1 (W8.of_int 170);                                                                               
      (t1, t4) <- (r02, r11);                                                                                                   
      a4 <- ttt;                                                                                                               
      b2 <- tt;                                                                                                                 
      t03 <- VMOVSLDUP_256 b2;                                                                                                  
      t03 <- VPBLENDD_256 a4 t03 (W8.of_int 170);                                                                               
      a4 <- VPSRL_4u64 a4 (W128.of_int 32);                                                                                     
      t13 <- VPBLENDD_256 a4 b2 (W8.of_int 170);                                                                                
      (t3, tt) <- (t03, t13);                                                                                                   
      a5 <- t1;                                                                                                                 
      b3 <- t0;                                                                                                                 
      t04 <- VMOVSLDUP_256 b3;                                                                                                  
      t04 <- VPBLENDD_256 a5 t04 (W8.of_int 170);                                                                               
      a5 <- VPSRL_4u64 a5 (W128.of_int 32);                                                                                     
      t14 <- VPBLENDD_256 a5 b3 (W8.of_int 170);                                                                                
      (ttt, t0) <- (t04, t14);                                                                                                  
      a6 <- t2;                                                                                                                 
      b4 <- t4;                                                                                                                 
      t05 <- VMOVSLDUP_256 b4;                                                                                                  
      t05 <- VPBLENDD_256 a6 t05 (W8.of_int 170);                                                                               
      a6 <- VPSRL_4u64 a6 (W128.of_int 32);                                                                                     
      t15 <- VPBLENDD_256 a6 b4 (W8.of_int 170);                                                                                
      (t1, t4) <- (t05, t15);                                                                                                   
      a7 <- t3;                                                                                                                 
      b5 <- ttt;                                                                                                                
      r03 <- VPUNPCKL_4u64 a7 b5;                                                                                               
      r12 <- VPUNPCKH_4u64 a7 b5;                                                                                               
      (t2, ttt) <- (r03, r12);                                                                                                  
      a8 <- t1;                                                                                                                 
      b6 <- tt;                                                                                                                 
      r04 <- VPUNPCKL_4u64 a8 b6;                                                                                               
      r13 <- VPUNPCKH_4u64 a8 b6;                                                                                               
      (t3, tt) <- (r04, r13);                                                                                                   
      a9 <- t0;                                                                                                                 
      b7 <- t4;                                                                                                                 
      r05 <- VPUNPCKL_4u64 a9 b7;                                                                                               
      r14 <- VPUNPCKH_4u64 a9 b7;                                                                                               
      (t1, t4) <- (r05, r14);                                                                                                   
      a10 <- t2;                                                                                                                
      b8 <- t3;                                                                                                                 
      r06 <- VPERM2I128 a10 b8 (W8.of_int 32);                                                                                  
      r15 <- VPERM2I128 a10 b8 (W8.of_int 49);                                                                                  
      (t0, t3) <- (r06, r15);                                                                                                   
      a11 <- t1;                                                                                                                
      b9 <- ttt;                                                                                                                
      r07 <- VPERM2I128 a11 b9 (W8.of_int 32) ;                                                                                 
      r16 <- VPERM2I128 a11 b9 (W8.of_int 49) ;                                                                                 
      (t2, ttt) <- (r07, r16);                                                                                                  
      a12 <- tt;                                                                                                                
      b10 <- t4;                                                                                                                
      r08 <- VPERM2I128 a12 b10 (W8.of_int 32);                                                                                 
      r17 <- VPERM2I128 a12 b10 (W8.of_int 49);                                                                                 
      (t1, t4) <- (r08, r17);                                                                                                   
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0) t0));      
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 32) t2)); 
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 64) t1)); 
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 96) t3)); 
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (                    
                192 * i0 + 128) ttt));                                                                                          
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 160) t4));
      i0 <- i0 + 1;                                                                                                             
    }                                                                                                                          
    (aux, aux_0) <- (rp, a0);                                                                                                   
    r <- Array1536.init (fun (i_0 : int) => if 384 * i <= i_0 < 384 * i + 384 then aux.[i_0 - 384 * i] else r.[i_0]);           
    a <- Array768.init (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux_0.[i_0 - 256 * i] else a.[i_0]);         
    i <- i + 1;                                                                                                                 
  }
  return r;
 }       
}.

lemma auxtobytes_corr_h (_aw : W16.t Array768.t):
    hoare[AuxToBytes.__i_polyvec_tobytes :
             pos_bound768_cxq a 0 768 2 /\ a = _aw ==> 
    res = encode12_vec (map asint (lift_array768 (nttpackv _aw)))]. 
proc;inline *.
proc change ^while.1: (init_384_8 (fun i_0 => r.[384 * i + i_0]));1: by auto.
proc change ^while.2: (init_256_16 (fun i_0 => a.[256 * i + i_0]));1: by auto.
(* FIXME: CHECK qx16 initialization inside while *)
proc change ^while.4: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change ^while.^while.1: (sliceget256_16_256 rp0 (i1*256)); 1: by auto => /#.
proc change ^while.^while.9 : (sliceset256_16_256 rp0 (i1*256) r0); 1: by auto => /> /#.
proc change ^while.^while{2}.1 : (sliceget256_16_256 a0 (8*i0*256));1: by auto => /#.
proc change ^while.^while{2}.2 : (sliceget256_16_256 a0 ((8*i0+1)*256));1: by auto => /#.
proc change ^while.^while{2}.3 : (sliceget256_16_256 a0 ((8*i0+2)*256));1: by auto => /#.
proc change ^while.^while{2}.4 : (sliceget256_16_256 a0 ((8*i0+3)*256));1: by auto => /#.
proc change ^while.^while{2}.5 : (sliceget256_16_256 a0 ((8*i0+4)*256));1: by auto => /#.
proc change ^while.^while{2}.6 : (sliceget256_16_256 a0 ((8*i0+5)*256));1: by auto => /#.
proc change ^while.^while{2}.7 : (sliceget256_16_256 a0 ((8*i0+6)*256));1: by auto => /#.
proc change ^while.^while{2}.8 : (sliceget256_16_256 a0 ((8*i0+7)*256));1: by auto => /#.
proc change ^while.^while{2}.105 : (sliceset384_8_256 rp (192*i0*8) t0);1: by auto => /#.
proc change ^while.^while{2}.106 : (sliceset384_8_256 rp ((192*i0+32)*8) t2);1: by auto => /#.
proc change ^while.^while{2}.107 : (sliceset384_8_256 rp ((192*i0+64)*8) t1);1: by auto => /#.
proc change ^while.^while{2}.108 : (sliceset384_8_256 rp ((192*i0+96)*8) t3);1: by auto => /#.
proc change ^while.^while{2}.109 : (sliceset384_8_256 rp ((192*i0+128)*8) ttt);1: by auto => /#.
proc change ^while.^while{2}.110 : (sliceset384_8_256 rp ((192*i0+160)*8) t4);1: by auto => /#.
proc change ^while.11: (init_1536_8 (fun (i_0 : int) => if 384 * i <= i_0 < 384 * i + 384 then aux.[i_0 - 384 * i] else r.[i_0])  ); 1: by auto.
proc change ^while.12: (init_768_16  (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux_0.[i_0 - 256 * i] else a.[i_0]));1: by auto. 

unroll for ^while.
do 8!(unroll for ^while).
cfold ^i<-.
cfold ^i0<-.
cfold ^i1<-.
wp -4.

bdep 16 12 [_aw] [a] [r] tobytes_circuit pcond_reduced perm_nttunpackv. 

(* BDEP pre conseq *)
+ move => &hr />; rewrite flatten1 /= pre_lane_commute_in_aligned 1:/# //=.
  rewrite allP /pos_bound124_cxq /= => Hb. 
  rewrite /pcond_reduced /= /tolist /= => x.
  rewrite  mkseqP => He;elim He => /= i [ib?]; rewrite ultE /=.
  have := Hb i; rewrite ib /= qE /=.
  rewrite /to_sint /smod /=.
  smt(W16.to_uint_cmp).

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= H0 <- rr; rewrite /= !flatten1.
move => H1.
apply (inj_eq Array1536.to_list Array1536.to_list_inj).
apply (flatten_map_eq _ _ W8.w2bits 8 _ W8.w2bits_inj W8.size_w2bits);1:smt().
have -> := post_lane_commute_in_aligned_perm (to_list a{hr}) (to_list rr) W16.w2bits W16.bits2w W8.w2bits W8.bits2w W12.w2bits W12.bits2w  tobytes_circuit 16 12 8 perm_nttunpackv perm_nttpackv _ _ _ _ _ _ _ _ _ _ _ _ _ _ _;1..12:
smt(Array1536.size_to_list Array768.size_to_list W16.bits2wK BVA_Top_Bindings_W12_t.oflistP).
+ smt(perm_nttpackv_rng Array768.size_to_list).
+ move => ?; rewrite Array768.size_to_list => ?;smt(nttpermsKi). 
+ by smt().

rewrite output_pack_1536_8. 
+ rewrite (EclibExtra.size_flatten' 12);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=.

congr.
rewrite /tobytes_circuit -map_comp -map_comp -map_comp /(\o) /=.
apply (eq_from_nth witness);1: by  rewrite !size_map //;smt(size_iota).
rewrite size_map !size_iota /max /= => i; rewrite size_to_list /= => ib; rewrite !(nth_map witness) //=;1,2:smt(size_iota).
rewrite nth_iota 1:/# -(BVA_Top_Bindings_W12_t.oflistP (BS2Int.int2bs 12 (map asint (lift_array768 (nttpackv a{hr}))).[i])); 1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Bindings_W12_t.ofintP /lift_array256;rewrite !mapiE 1,2:/#.

(* This is now the equivalence betwen specs.*)
rewrite ultE /=; have HH := nttpackv_alt a{hr} i ib.
have HG := perm_nttpackv_rng i ib.
rewrite HH.

case (to_uint (nttpackv a{hr}).[i] < 3329) => /= *.
+ rewrite  /truncateu12;congr. 
  rewrite incoeffK qE /to_sint /= /smod /= ifF 1:/#  modz_small;smt(W16.to_uint_cmp). 

have := H0;rewrite /pos_bound768_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub (nttpackv a{hr}).[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=;smt(size_map size_iota). 
   rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;   smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub (nttpackv a{hr}).[i] (W16.of_int 3329))) = to_sint (nttpackv a{hr}).[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint (nttpackv a{hr}).[i])) = (incoeff (to_sint (W16_sub (nttpackv a{hr}).[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff; smt(). 

+ rewrite  /truncateu12;congr. 
  rewrite incoeffK qE modz_small;smt(W16.to_uint_cmp). 
 
qed.

lemma auxtobytes_ll : islossless AuxToBytes.__i_polyvec_tobytes.
proc.
inline *. 
do 9!(unroll for ^while); auto. 
qed.

lemma auxtobytes_corr (_aw : W16.t Array768.t):
    phoare[ AuxToBytes.__i_polyvec_tobytes :
             pos_bound768_cxq a 0 768 2 /\ a = _aw ==> 
    res = encode12_vec (map asint (lift_array768 (nttpackv _aw)))] = 1%r
  by conseq auxtobytes_ll (auxtobytes_corr_h _aw).


lemma polyvec_tobytes_corr (_aw : W16.t Array768.t):
    phoare[ Jkem768_avx2.M.__i_polyvec_tobytes :
             pos_bound768_cxq a 0 768 2 /\ a = _aw ==> 
    res = encode12_vec (map asint (lift_array768 (nttpackv _aw)))] = 1%r.
proof.
bypr => &m [??].
have <- : Pr[AuxToBytes.__i_polyvec_tobytes(r{m}, _aw) @ &m : res = encode12_vec (map asint (lift_array768 (nttpackv _aw)))] = 1%r
 by byphoare (auxtobytes_corr _aw)  =>/=; 1:smt().
byequiv (: ={arg} /\ a{1} = _aw /\
             pos_bound768_cxq a{1} 0 768 2 ==> ={res}) => //.
proc => /=. 
inline M._i_poly_tobytes.
while (={r, a,i} /\ 0 <= i{1} <= 4 /\
   pos_bound768_cxq a{1} 0 768 2); last by auto => /> /#.
seq 3 3 : (#pre /\ ={rp,a0} /\
   pos_bound256_cxq a0{1} 0 256 1).
+ ecall {1} (poly_csubq_avx2_corr a0{1}).
  ecall {2} (poly_csubq_avx2_corr a0{2}).
  auto => /> &1; rewrite /pos_bound768_cxq /pos_bound256_cxq /lift_array256 /= qE /= => ????;split; 1: by smt(Array256.initiE).
  move => ? rr1.
  rewrite !tP;move =>  Hrr11 Hrr12 rr2.
  rewrite !tP;move =>  Hrr21 Hrr22.
  move => ii iib. 
  have := Hrr11 ii iib; rewrite !mapiE 1,2:/# /=. 
  have := Hrr12 ii iib.  
  have := Hrr21 ii iib; rewrite !mapiE 1,2:/# /=. 
  have := Hrr22 ii iib.  
  rewrite /to_sint /smod /=. 
  move => Hrr11i Hrr12i Hrr21i Hrr22i.
  have Hn1 : !(32768 <= to_uint rr2.[ii]) by smt(W16.to_uint_cmp pow2_16).
  have Hn2 : !(32768 <= to_uint rr1.[ii]) by smt(W16.to_uint_cmp pow2_16).
  have Hn3 : !(32768 <= to_uint _aw.[ii]) by smt(W16.to_uint_cmp pow2_16).
  move : Hrr11i Hrr12i Hrr21i Hrr22i; rewrite Hn1 Hn2 /=.
  move => Hrr11i Hrr12i Hrr21i Hrr22i.
  move : Hrr12i; rewrite -Hrr22i -eq_incoeff.  
  by rewrite !modz_small ?qE /= 1,2:/# to_uint_eq /#.

wp;while (#pre /\ ={i0} /\ 0<=i0{1}<=2); last first.
+ auto => /> &2 ?????i0r????;split;1:smt().
  rewrite /pos_bound768_cxq => k kb; rewrite initiE 1:/# /= /#.

wp -1 -1; conseq (: _ ==> ={rp}); 1: by smt().

inline *;sim; auto => /> &1 &2 ???;rewrite /pos_bound256_cxq qE /= => Hb ???.

have Hpos : forall jj kk ii, 0 <= jj < 8 => 0 <= kk < 16 => 0 <= ii < 16 => (get256 (WArray512.init16 ("_.[_]" a0{1})) (8 * i0{1} + jj) \bits16 kk).[ii] = a0{1}.[kk + 16*jj + i0{1}*128].[ii] by
  move => jj kk ii jjb kkb iib; rewrite get256E /pack32_t /(\bits16) initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /(\bits8) initiE 1:/# /= /#.

have bits : forall kk ii, 0 <= kk < 256 => 12 <= ii < 16 => !a0{1}.[kk].[ii].
+ move => kk ii kkb iib; have := Hb kk kkb;rewrite /to_sint /smod /= => Hn.
  have Hn1 : !32768 <= to_uint a0{1}.[kk] by smt(W16.to_uint_cmp pow2_16).
  move : Hn; rewrite Hn1 /= get_to_uint . 
  have ? : 4096 <= 2^ii;last by smt().
  have ? : 4096 = 2^12 by auto.
  smt(@StdOrder.IntOrder). 

have bitsC : forall  ii, 0 <= ii < 16 => (W16.of_int 4095).[ii] <=> 0<=ii<12.
+ move => ii iib.
  have : all (fun i => (W16.of_int 4095).[i] <=> 0 <= i < 12) (iota_ 0 16); 
  last by rewrite allP => H; move : (H ii _);smt(mem_iota).
  by rewrite -iotaredE /= !get_to_uint /=.


do split; rewrite /VPBROADCAST_16u16 /= -(W16u16.unpack16K (WArray512.get256 _ _)) -(W16u16.unpack16K (W16u16.pack16 _)) !andb16u16E;congr;rewrite packP => k kb;rewrite map2iE 1:/# /= andE wordP => ii iib;rewrite map2iE 1:/# /= get_of_list 1:/# /= (nth_map witness)  /=;1,3,5,7,9,11,13,15:smt(size_iota); rewrite unpack16E initiE 1:/# /=;1..7: by rewrite Hpos /#.
      have /= -> := Hpos 0;smt().
qed.


lemma polyvec_tobytes_equiv :
    equiv [Jkem768_avx2.M.__i_polyvec_tobytes ~Jkem768.M.__i_polyvec_tobytes :
             pos_bound768_cxq a{1} 0 768 2 /\
             pos_bound768_cxq a{2} 0 768 2 /\
             lift_array768 a{1} = nttunpackv (lift_array768 a{2}) ==> ={res} ].
proof.
proc*.
ecall{1} (polyvec_tobytes_corr a{1}).
ecall{2} (MLKEM_PolyVec.polyvec_tobytes_corr a{2}).
by auto => /> &1 &2 ??; rewrite -nttpackv_lift => ->; rewrite  unpackvK.
qed.


lemma polyvec_add2_equiv  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
  forall (_a _b : coeff Array768.t),
    equiv [Jkem768_avx2.M.__polyvec_add2 ~Jkem768.M.__polyvec_add2 :
      _a = lift_array768 r{2} /\
      _b = lift_array768 b{2} /\ signed_bound768_cxq r{2} 0 768 ab /\ signed_bound768_cxq b{2} 0 768 bb /\
      _a = nttpackv (lift_array768 r{1}) /\
      _b = nttpackv (lift_array768 b{1}) /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb
           ==> lift_array768 res{1} = nttunpackv (lift_array768  res{2}) /\
               signed_bound768_cxq res{1} 0 768 (ab + bb) /\
               signed_bound768_cxq res{2} 0 768 (ab + bb) 
              ].
proof. 
move => abb bbb _a _b;proc* => /=.
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array768 r{2} /\
  _b = lift_array768 b{2} /\
  signed_bound768_cxq r{2} 0 768 ab /\
  signed_bound768_cxq b{2} 0 768 bb /\
  _a = nttpackv (lift_array768 r{1}) /\
  _b = nttpackv (lift_array768 b{1}) /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb   ==> 
      lift_array768 r0{1} = nttunpackv (lift_array768 r0{2}) /\ signed_bound768_cxq r0{1} 0 768 (ab + bb) /\ signed_bound768_cxq r0{2} 0 768 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_add2 => //.
have corr1 := (polvec_add_corr (nttunpackv _a) (nttunpackv _b) ab bb abb bbb). call {1} corr1.
have corr2 := (polyvec_add_corr _a _b ab bb abb bbb); call {2} corr2.

auto => />. 
move => &1 &2 ????->->??rr?rval; do split; 1,2: by rewrite packvK.  
move => ??rr0?r0val.
rewrite tP => k kb.
rewrite /(lift_array768 rr0) mapiE //= r0val // !packvK.
have  -> : lift_array768 rr = 
   Array768.init (fun k => (nttpackv (lift_array768 r{1})).[k] + (nttpackv (lift_array768 b{1})).[k])
 by rewrite tP => kk kkb; rewrite initiE //= /(lift_array768 rr) mapiE //= /#.
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
  forall (_a _b : coeff Array768.t),
    equiv [Jkem768_avx2.M.__polyvec_add2 ~Jkem768.M.__polyvec_add2 :
      _a = lift_array768 r{2} /\
      _b = lift_array768 b{2} /\ signed_bound768_cxq r{2} 0 768 ab /\ signed_bound768_cxq b{2} 0 768 bb /\
      _a = lift_array768 r{1} /\
      _b = lift_array768 b{1} /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb
           ==> lift_array768 res{1} = lift_array768  res{2} /\
               signed_bound768_cxq res{1} 0 768 (ab + bb) /\
               signed_bound768_cxq res{2} 0 768 (ab + bb) 
              ].
proof. 
move => abb bbb _a _b;proc* => /=.
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array768 r{2} /\
  _b = lift_array768 b{2} /\
  signed_bound768_cxq r{2} 0 768 ab /\
  signed_bound768_cxq b{2} 0 768 bb /\
  _a =  (lift_array768 r{1}) /\
  _b =  (lift_array768 b{1}) /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb   ==> 
      lift_array768 r0{1} = (lift_array768 r0{2}) /\ signed_bound768_cxq r0{1} 0 768 (ab + bb) /\ signed_bound768_cxq r0{2} 0 768 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_add2 => //.
have corr1 := (polvec_add_corr ( _a) ( _b) ab bb abb bbb). call {1} corr1.
have corr2 := (polyvec_add_corr _a _b ab bb abb bbb); call {2} corr2.

auto => />.  
move => &1 &2 ????????rr? H rval? H0. 
move : H H0; rewrite /lift_array768 !tP => ? ? k kb. 
rewrite !mapiE;smt(Array768.mapiE).
qed.

lemma polyvec_reduce_equiv _a :
    equiv [Jkem768_avx2.M.__polyvec_reduce ~Jkem768.M.__polyvec_reduce :
       _a  = lift_array768 r{2} /\  _a  = nttpackv (lift_array768 r{1})  ==>
       (forall k, 0 <= k < 768 => bpos16 res{1}.[k] (2*q)) /\
       (forall k, 0 <= k < 768 => bpos16 res{2}.[k] (2*q)) /\
              lift_array768 res{1} = nttunpackv (lift_array768 res{2}) ].
proc*. 
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_reduce(r); }
       (={r} ==> ={r0})
       (_a = lift_array768 r{2} /\ _a = nttpackv (lift_array768 r{1})   ==> 
      (forall (k : int), 0 <= k && k < 768 => bpos16 r0{1}.[k] (2 * q)) /\
  (forall (k : int), 0 <= k && k < 768 => bpos16 r0{2}.[k] (2 * q)) /\
  lift_array768 r0{1} = nttunpackv (lift_array768  r0{2})); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_reduce => //.
have corr1 := (polvec_reduce_corr (nttunpackv _a)). call {1} corr1.
have corr2 := (polyvec_reduce_corr _a); call {2} corr2.

auto => />. 
move => &1 &2 ?????; do split;1: smt(packvK unpackvK). 
move => ??<-?.
smt(packvK unpackvK). 
qed.


lemma polyvec_reduce_equiv_noperm _a :
    equiv [Jkem768_avx2.M.__polyvec_reduce ~Jkem768.M.__polyvec_reduce :
       _a  = lift_array768 r{2} /\  _a  = lift_array768 r{1}  ==>
       (forall k, 0 <= k < 768 => bpos16 res{1}.[k] (2*q)) /\
       (forall k, 0 <= k < 768 => bpos16 res{2}.[k] (2*q)) /\
              lift_array768 res{1} =  lift_array768 res{2} ].
proc*. 
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_reduce(r); }
       (={r} ==> ={r0})
       (_a = lift_array768 r{2} /\ _a = (lift_array768 r{1})   ==> 
      (forall (k : int), 0 <= k && k < 768 => bpos16 r0{1}.[k] (2 * q)) /\
  (forall (k : int), 0 <= k && k < 768 => bpos16 r0{2}.[k] (2 * q)) /\
  lift_array768 r0{1} =  (lift_array768  r0{2})); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_reduce => //.
have corr1 := (polvec_reduce_corr ( _a)). call {1} corr1.
have corr2 := (polyvec_reduce_corr _a); call {2} corr2.

auto => /> /#. 
qed.

equiv pointwiseequiv : 
 Jkem768_avx2.M.__polyvec_pointwise_acc ~  Jkem768.M.__polyvec_pointwise_acc :
    lift_array768 arg{1}.`2 = nttunpackv (lift_array768 arg{2}.`1) /\
    lift_array768 arg{1}.`3 = nttunpackv (lift_array768 arg{2}.`2) /\
    signed_bound768_cxq arg{1}.`2 0 768 2 /\
    signed_bound768_cxq arg{1}.`3 0 768 2 /\
    signed_bound768_cxq arg{2}.`1 0 768 2 /\
    signed_bound768_cxq arg{2}.`2 0 768 2
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
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 k _); 1: smt(). rewrite !initiE//= 1:/# kb /=.
  rewrite /nttunpack !mapiE //= 1:/# !initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=.
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=.
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=.
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
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
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (256+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifT 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
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
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (512+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /= ifF 1:/# ifT 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
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
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (768+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /= ifF 1:/# ifF 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
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
Jkem768_avx2.M.__polyvec_ntt ~Jkem768.M.__polyvec_ntt : 
   lift_array768 arg{1} = lift_array768 arg{2} /\ 
   signed_bound768_cxq arg{1} 0 768 2 /\ 
   signed_bound768_cxq arg{2} 0 768 2 ==>
   lift_array768 res{1} = nttunpackv (lift_array768 res{2}) /\ 
   pos_bound768_cxq res{1} 0 768 2 /\ 
   pos_bound768_cxq res{2} 0 768 2.
proc *. 
ecall {2} (polyvec_ntt_corr r{2}) => /=.
conseq />;1: smt().
ecall {1} (polyvec_ntt_avx2_corr r{1}) => /=.
auto => /> &1 &2 HH?? r H H0 r2 H1 H2. 
have  : lift_polyvec (nttpackv r) = lift_polyvec r2.
+ rewrite -H1 -H;congr.
  rewrite /lift_polyvec KMatrix.Vector.eq_vectorP => k kb.
  rewrite !KMatrix.Vector.offunvE //=.
  rewrite /lift_array768 tP in HH.
  rewrite /subarray256 /lift_array256 tP => i ib.
  move : (HH (k*256+i) _); 1: by smt().
  rewrite !mapiE //= 1,2: /# !initiE //= /#.
rewrite /lift_polyvec /lift_array768 tP KMatrix.Vector.eq_vectorP => H3 k kb. 
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
Jkem768_avx2.M._poly_invntt ~Jkem768.M._poly_invntt : 
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

lemma signed_bound768_cxq_small r (i j:int) :
  i <= j => signed_bound768_cxq r 0 768 i => signed_bound768_cxq r 0 768 j.
rewrite /signed_bound768_cxq => />Hij H k Hk1 Hk2. move :(H k). rewrite Hk1 Hk2 => />. smt(). qed.

lemma eq_vectorP4 :
      forall (v1 v2 : PolyVec.polyvec),
        (v1 = v2) <=> ((KMatrix.Vector."_.[_]" v1 0 = KMatrix.Vector."_.[_]" v2 0) /\ (KMatrix.Vector."_.[_]" v1 1 = KMatrix.Vector."_.[_]" v2 1) /\ (KMatrix.Vector."_.[_]" v1 2 = KMatrix.Vector."_.[_]" v2 2) /\ (KMatrix.Vector."_.[_]" v1 3 = KMatrix.Vector."_.[_]" v2 3)).
smt(KMatrix.Vector.eq_vectorP). qed.

equiv invnttequiv :
Jkem768_avx2.M.__polyvec_invntt ~Jkem768.M.__polyvec_invntt : 
   lift_array768 arg{1} = nttunpackv (lift_array768 arg{2}) /\ 
   signed_bound768_cxq arg{1} 0 768 4 /\ 
   signed_bound768_cxq arg{2} 0 768 4 ==>
   lift_array768 res{1} = lift_array768 res{2} /\ 
   signed_bound768_cxq res{1} 0 768 1 /\ 
   signed_bound768_cxq res{2} 0 768 1.
proc *.
ecall {2} (polyvec_invntt_corr r{2}) => /=.
conseq />;1: smt().
ecall {1} (polyvec_invntt_avx2_corr r{2}) => /=. 
auto => /> &1 &2 -> Hm1 Hm2. rewrite unpackvK //= => r Hr1 Hr2 s Hs1 Hs2.
rewrite /lift_array768 /map tP => />j Hj1 Hj2. rewrite !initiE //=.
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
