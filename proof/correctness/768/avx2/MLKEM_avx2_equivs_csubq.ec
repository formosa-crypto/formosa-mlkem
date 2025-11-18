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

