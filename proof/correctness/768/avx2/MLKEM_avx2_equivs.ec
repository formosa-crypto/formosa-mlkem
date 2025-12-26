require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array1152 Array1088 Array960 Array1410 Array768 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8 Array2.
from JazzEC require import WArray512 WArray128 WArray384 WArray32 WArray16 WArray1410 WArray160 WArray960 WArray1152 WArray1536.

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
(* require import MLKEM_InnerPKE. *)
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

require import Mlkem_bindings.


import KMatrix Vector.

from JazzEC require import WArray1088 WArray2048.
require import Mlkem_bindings BitEncoding.
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
proc change 1: { qx16 <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change ^while.1: { r <- sliceget256_16_256 rp (i*256);};1: by auto => /#.
proc change ^while.9: { rp <-sliceset256_16_256 rp (i*256) r;};1: by auto => /#.
unroll for ^while.
cfold ^i<-.
wp -1.
conseq (: rp = _aw /\ all (fun c => W16.zero \sle c && c \slt W16.of_int 6658) rp ==>
       rp = init_256_16 (fun i => csubq_circuit _aw.[i])); last by circuit.

       
(* BDEP pre conseq *)
+ move => &hr />. rewrite /pos_bound256_cxq /bpos16 qE /= => H.
  rewrite /(\slt) /(\sle) /= /smod /= allP /=.
  by exact H.

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= ->; rewrite /pos_bound256_cxq => Hb rr; rewrite /init_256_16 /lift_array256 /= => ->; split.

rewrite tP => i ib.
rewrite !mapiE 1,2:/# /= initiE 1:/# /=.
rewrite /csubq_circuit ultE /W16_sub /=.
move : (Hb i ib);rewrite /bpos16 qE /= /to_sint /smod /=.
case (to_uint _aw.[i] < 3329) => *//;1:
have ->/= : !32768 <= to_uint _aw.[i] by smt(W16.to_uint_cmp).
rewrite to_uintB /=;1: by rewrite uleE => /#.
have ->/= : !32768 <= to_uint _aw.[i] - 3329;  by smt(W16.to_uint_cmp).

move => i ib.
rewrite initiE 1:/# /= /csubq_circuit ultE /W16_sub /=.
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
proc change ^while.1: {rp <- init_256_16 (fun i0 => r.[256*i+i0]);};1: by auto.
proc change ^while.2: {qx16 <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change ^while.^while.1: {r0 <- sliceget256_16_256 rp (i0*256);};1: by auto => /#.
proc change ^while.^while.9: {rp <- sliceset256_16_256 rp (i0*256) r0;};1: by auto => /#.
proc change ^while.6: {r <- init_768_16 (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux.[i_0 - 256 * i] else r.[i_0]);};1: by auto. 

do 4!(unroll for ^while).
cfold ^i0<-.
wp -2.

conseq (: r = _aw /\ all (fun c => W16.zero \sle c && c \slt W16.of_int 6658) r ==>
       r = init_768_16 (fun i => csubq_circuit _aw.[i])); last by circuit.

       
(* BDEP pre conseq *)
+ move => &hr />. rewrite /pos_bound768_cxq /bpos16 qE /= => H.
  rewrite /(\slt) /(\sle) /= /smod /= allP /=.
  by exact H.

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= ->; rewrite /pos_bound256_cxq => Hb rr; rewrite  /= => ->; split.

rewrite tP => i ib.
rewrite !mapiE 1,2:/# /= initiE 1:/# /=.
rewrite /csubq_circuit ultE /W16_sub /=.
move : (Hb i ib);rewrite /bpos16 qE /= /to_sint /smod /=.
case (to_uint _aw.[i] < 3329) => *//;1:
have ->/= : !32768 <= to_uint _aw.[i] by smt(W16.to_uint_cmp).
rewrite to_uintB /=;1: by rewrite uleE => /#.
have ->/= : !32768 <= to_uint _aw.[i] - 3329;  by smt(W16.to_uint_cmp).

move => i ib.
rewrite initiE 1:/# /= /csubq_circuit ultE /W16_sub /=.
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

lemma polyvec_decompress_corr_h (_aw : W8.t Array960.t):
    hoare[ Jkem768_avx2.M.__i_polyvec_decompress :
             Array960.init (fun i => rp.[i]) = _aw ==> pos_bound768_cxq res 0 768 1 /\ lift_polyvec res = decompress_polyvec 10 (decode10_vec _aw)].
proc; inline *.
proc change 3: { shufbidx <- sliceget32_8_256 pvd_shufbdidx_s 0;}; 1: by auto.
proc change ^while.^while.1 : {f <- sliceget1088_8_256 rp ((320*k + 20*i)*8);}; 1: by auto => /> /#.
proc change ^while.^while.8 : {r <- sliceset768_16_256 r ((16 * k + i)*256) f;}; 1: by auto => /> /#.
unroll for ^while.
cfold ^inc<-.
do 3!(unroll for ^while).
cfold ^i<-.
wp -3.


conseq (: rp = init_1088_8 (fun i => if i < 960 then _aw.[i] else rp.[i])
        ==>
   r = init_768_16 (fun i =>
     decompress10_circuit (W10.init (fun (j : int) => _aw.[(i*10 + j) %/ 8].[(i*10 + j) %% 8]))));last  circuit. 
     
(* We start with some boilerplate *)
move => &hr /=;rewrite !tP  => H i ib.
by rewrite initE ib /=; case (i < 960) => // ?; rewrite -H 1:/# initiE 1:/#.

move => &hr <- rr ->; split; last first.
+ rewrite eq_vectorP => k kb.
  rewrite tP => i ib.
  rewrite /lift_polyvec /init_768_16 offunvE 1:/# /= !mapiE 1:/# /= -get_to_list /= initiE 1:/# /= initiE 1:/# /=.
  rewrite /decompress10_circuit decompress10_circuit_sem 1:/# /=.
  rewrite /decompress_polyvec /= !setvE /= offunvE 1:/# /=.
  case (2 = k) => ?; 1: 
   by rewrite mapiE 1:/# /= /subarray256 initiE 1:/# /= initiE 1:/# /= /decode10_vec get_of_list /#.
  rewrite offunvK /vclamp kb /=.
  case (1 = k) => ?; 1: 
   by rewrite mapiE 1:/# /= /subarray256 initiE 1:/# /= initiE 1:/# /= /decode10_vec get_of_list /#.
  rewrite offunvK /vclamp kb /=.
  by rewrite ifT 1:/# mapiE 1:/# /= /subarray256 initiE 1:/# /= initiE 1:/# /= /decode10_vec get_of_list /#.

  
rewrite /pos_bound768_cxq qE /= => k kb. 
rewrite /init_768_16 initiE 1:/# /=.
by apply decompress10_circuit_rng.
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
+ move => /= H;rewrite /VPMADDWD_256 /VPMADDWD_alt /=.  
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
proc change ^while.1: { rp0 <- init_256_16 (fun i => r.[256*i0+i]);};1: by auto.
proc change ^while.2: { qx16 <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change ^while.^while.1: {r0 <- sliceget256_16_256 rp0 (i1*256);};1: by auto => /#.
proc change ^while.^while.9: { rp0 <- sliceset256_16_256 rp0 (i1*256) r0;};1: by auto => /#.
proc change ^while.6: { r <- init_768_16 (fun (i_0 : int) => if 256 * i0 <= i_0 < 256 * i0 + 256 then aux.[i_0 - 256 * i0] else r.[i_0]);};1: by auto. 
proc change 7: { v <- sliceget16_16_256 x16p 0;}; 1: by auto.
proc change ^while{2}.1: {f0 <- sliceget768_16_256 a (i*256);};1: by auto => /#.
proc change 14: { shufbidx <- sliceget32_8_256 pvc_shufbidx_s 0;}; 1: by auto.
proc change ^while{2}.19 : { rp <- sliceset960_8_128 rp  (20*i*8) t0;};1: by auto => /#.
proc change ^while{2}.20 : { rp <- sliceset960_8_32 rp  ((20*i+16)*8) (truncateu32 t1);}.
+ auto => />;move => *;rewrite /sliceset960_8_32 tP => *.
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

conseq (: a = _aw /\
   Array768.all (fun bv => W16.zero \sle bv /\ bv \slt (of_int (2 * 3329))) a
   ==> rp = init_960_8 (fun i =>
     W8.init (fun j =>
       (compress10_circuit _aw.[(i*8+j) %/ 10]).[(i*8+j) %% 10]))); last by circuit.

      
(* BDEP pre conseq *)
+ move => &hr />; rewrite /pos_bound768_cxq qE /= /(\sle) /(\slt) allP /=  => Hb i ib /=.
  rewrite /(to_sint W16.zero) /= /(W16.smod 0) /=.
  rewrite /(to_sint (W16.of_int 6658)) /= /(W16.smod 6658) /= /#.
  
(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= -> H0 rr; rewrite /= /init_960_8 !tP => H i ib.
rewrite H // initiE 1:/# /=.
rewrite wordP => k kb; rewrite !initiE /= 1,2:/#.
rewrite encode_vec_compress_bits //=.
by apply compress10_circuit_sem.
qed.

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
ecall {2} (i_polyvec_compress_corr a{2}) => /=.
ecall {1} (polyvec_compress_avx2_corr a{1}).
+ auto => /> &1 &2 ??;rewrite !tP => H k kb. 
   rewrite  /encode10_vec get_of_list 1:/# initiE 1:/# /= get_of_list 1:/# /=; do 4!(congr). 
   rewrite /lift_polyvec eq_vectorP => i ib.
   rewrite tP => j jb.
   rewrite !liftarrayvector /#.
qed.

(***************)

(********** BEGIN BDEP PROOF OF DECOMPRESS **************)


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
proc change 4: { q <- sliceget16_16_256 x16p 0;}; 1: by auto.
proc change 6: { shufbidx <- sliceget32_8_256 x32p 0;}; 1: by auto.
proc change ^while.1 : { h <- zeroextu128 (sliceget128_8_64 a ((8*i)*8));};1: by auto => /#.
proc change ^while.8 : { rp <- sliceset256_16_256 rp (i*256) f;};1: by auto => /#.

cfold 9.
unroll for ^while.
cfold ^i<-.
wp -2.
conseq (: _ ==> rp = init_256_16 (fun i =>
     decompress4_circuit (W4.init (fun (j : int) => _a.[i %/ 2].[i %% 2 * 4 + j])))); last  by circuit.

      
(* We start with some boilerplate *)
move => &hr [#]/= <- rr /= ->.

split.
+ rewrite tP => i ib.
  rewrite /init_256_16 !mapiE 1,2:/# /= -get_to_list /= initiE 1:/# /=.
  by rewrite  -decompress4_circuit_sem 1:/# /=. 

rewrite /pos_bound256_cxq qE /= => k kb. 
rewrite /init_256_16 initiE 1:/# /=.
by apply decompress4_circuit_rng.
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
proc change 3: { qx16 <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change ^while.1: { r <- sliceget256_16_256 rp0 (i0*256);};1: by auto => /#.
proc change ^while.9: { rp0 <- sliceset256_16_256 rp0 (i0*256) r;};1: by auto => /#.
proc change 8: { v <- sliceget16_16_256 x16p 0;}; 1: by auto.
proc change 12: { permidx <- sliceget8_32_256 pc_permidx_s 0;}; 1: by auto.
proc change ^while{2}.1: { f0 <- sliceget256_16_256 a (4*i*256);};1: by auto => /#.
proc change ^while{2}.2: { f1 <- sliceget256_16_256 a ((4*i+1)*256);};1: by auto => /#.
proc change ^while{2}.3: { f2 <- sliceget256_16_256 a ((4*i+2)*256);};1: by auto => /#.
proc change ^while{2}.4: { f3 <- sliceget256_16_256 a ((4*i+3)*256);};1: by auto => /#.
proc change ^while{2}.23 : { rp <- sliceset128_8_256 rp  (32*i*8) f0;};1: by auto => /#.

cfold 13.
do 2!(unroll for ^while).
cfold ^i0<-.
wp -3.


conseq (: a = _aw /\
   Array256.all (fun bv => W16.zero \sle bv /\ bv \slt (of_int (2 * 3329))) a
   ==> rp = init_128_8 (fun i =>
     W8.init (fun j =>
       (compress4_circuit _aw.[j %/ 4 + i * 2]).[j %% 4]))); last by circuit.
        
       
(* BDEP pre conseq *)
+ move => &hr />; rewrite /pos_bound256_cxq qE /= /(\sle) /(\slt) allP /=  => Hb i ib /=.
  rewrite /(to_sint W16.zero) /= /(W16.smod 0) /=.
  rewrite /(to_sint (W16.of_int 6658)) /= /(W16.smod 6658) /= /#.
  
(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= H0 <- rr ->; rewrite /= /init_128_8 tP => i ib.
rewrite wordP => k kb; rewrite !initiE 1..3:/# /=.
rewrite encode_compress_bits //=.
by apply compress4_circuit_sem.
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


lemma polyvec_frombytes_ll : islossless Jkem768_avx2.M.__i_polyvec_frombytes.
proc; inline *;wp. 
  while (0 <= i <= 4) (4-i); last by  auto =>  /> /#.
move => *. cfold 3. unroll for ^while;auto => /> /#.
qed.

op nttunpack_16 (rp : W16.t Array256.t) : W16.t Array256.t = init_256_16 (fun (i : int) => rp.[nttunpack_idx.[i]]).


op nttunpackv_16 (v : W16.t Array768.t) : W16.t Array768.t =
  init_768_16
    (fun (i : int) =>
       if 0 <= i < 256 then (nttunpack_16 (subarray256 v 0)).[i]
       else
         if 256 <= i < 512 then (nttunpack_16 (subarray256 v 1)).[i - 256]
         else  (nttunpack_16 (subarray256 v 2)).[i - 512]).

lemma nttunpackv_16E v: nttunpackv_16 v = nttunpackv v.
   rewrite /nttunpackv_16 /nttunpackv /nttunpack_16 /nttunpack.
   by rewrite /init_768_16 /init_256_16.
   qed.


lemma polyvec_frombytes_corr_h (_aw : W8.t Array1152.t): 
    hoare [Jkem768_avx2.M.__i_polyvec_frombytes  :
             a = _aw
              ==>
             lift_array768 res = nttunpackv (map incoeff (decode12_vec _aw))  /\
             pos_bound768_cxq res 0 768  2].
proc; inline *.
proc change ^while.1: { rp <- init_256_16 (fun (i_0 : int) => r.[256 * i + i_0]);}; 1: by auto.
proc change ^while.2: { ap <- init_384_8 (fun (i_0 : int) => a.[384 * i + i_0]);}; 1: by auto.
proc change ^while.3: { mask <- sliceget16_16_256 maskx16 0;}; 1: by auto.
proc change ^while.^while.1 : { t0 <- sliceget384_8_256 ap (192*i0*8);}; 1: by auto => /> /#.
proc change ^while.^while.2 : { t1 <- sliceget384_8_256 ap ((192*i0+32)*8);}; 1: by auto => /> /#.
proc change ^while.^while.3 : { t2 <- sliceget384_8_256 ap ((192*i0+64)*8);}; 1: by auto => /> /#.
proc change ^while.^while.4 : { t3 <- sliceget384_8_256 ap ((192*i0+96)*8);}; 1: by auto => /> /#.
proc change ^while.^while.5 : { t4 <- sliceget384_8_256 ap ((192*i0+128)*8);}; 1: by auto => /> /#.
proc change ^while.^while.6 : { t5 <- sliceget384_8_256 ap ((192*i0+160)*8);}; 1: by auto => /> /#.
proc change ^while.^while.101 : { rp <- sliceset256_16_256 rp (8*i0 *256) t6;};1: by auto => /> /#.
proc change ^while.^while.102 : { rp <- sliceset256_16_256 rp ((8*i0+1) *256) t7;};1: by auto => /> /#.
proc change ^while.^while.103 : { rp <- sliceset256_16_256 rp ((8*i0+2) *256) t8;};1: by auto => /> /#.
proc change ^while.^while.104 : { rp <- sliceset256_16_256 rp ((8*i0+3) *256) t9;};1: by auto => /> /#.
proc change ^while.^while.105 : { rp <- sliceset256_16_256 rp ((8*i0+4) *256) t4;};1: by auto => /> /#.
proc change ^while.^while.106 : { rp <- sliceset256_16_256 rp ((8*i0+5) *256) t10;};1: by auto => /> /#.
proc change ^while.^while.107 : { rp <- sliceset256_16_256 rp ((8*i0+6) *256) t11;};1: by auto => /> /#.
proc change ^while.^while.108 : { rp <- sliceset256_16_256 rp ((8*i0+7) *256) tt;};1: by auto => /> /#.
proc change ^while.7: { r <- init_768_16 (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux.[i_0 - 256 * i] else r.[i_0]);}; 1: by auto.

unroll for ^while.
do 3!(unroll for ^while).
cfold ^i0<-.
wp -2. 

conseq (: _ ==> r = nttunpackv_16 (init_768_16 (fun i =>
     frombytes_circuit (
       W12.init (fun j =>
         let idx = i*12 + j in
         let aidx = idx %/ 8 in
         let bidx = idx %% 8 in
         _aw.[aidx].[bidx]
       )
     )))); last by  circuit.
     
move => &hr <- rr ->.
rewrite nttunpackv_16E;split.
+ rewrite  -nttunpackv_lift /lift_array768 /=; congr; apply Array768.tP => i ib.
  rewrite !mapiE 1,2:/# /= initiE 1:/# /= -frombytes_circuit_sem /#.

rewrite /pos_bound768_cxq.
move => k kb.
have : Array768.all (fun w => bpos16 w (2*q))
    (nttunpackv
       (init_768_16
          (fun (i : int) =>
             frombytes_circuit
               (W12.init
                  (fun (j : int) =>
                     let idx = i * 12 + j in let aidx = idx %/ 8 in let bidx = idx %% 8 in a{hr}.[aidx].[bidx]))))); last first.
 + by rewrite allP => H; have /= := H k _;1:smt().
 
   
apply nttunpackv_pred.
rewrite allP => i ib; rewrite initiE 1:/# /= qE /=.
have := frombytes_circuit_rng a{hr} i.
smt().
qed.


(********** END BDEP PROOF OF FROMBYTES **************)

lemma polyvec_frombytes_corr (_aw : W8.t Array1152.t): 
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


lemma poly_frommsg_ll : islossless Jkem768_avx2.M._i_poly_frommsg 
 by proc; inline *;wp;while (0 <= i <= 32) (32-i);  by  auto =>  /> /#.

lemma poly_frommsg_corr_h (_m : W8.t Array32.t): 
    hoare [Jkem768_avx2.M._i_poly_frommsg :
             ap =  _m 
              ==>
             lift_array256 res = decompress_poly 1 (decode1 _m) /\
             pos_bound256_cxq res 0 256 1 ].
proc; inline *.
proc change 1: { hqs <- sliceget16_16_256 hqx16_p1 0;};1: by auto.
proc change 2: { shift <- VPBROADCAST_2u128 (sliceget4_32_128 pfm_shift_s 0);};1: by auto.
proc change 3: { idx <- VPBROADCAST_2u128 (sliceget16_8_128 pfm_idx_s 0);};1: by auto.
proc change 4: { f <- sliceget32_8_256 ap 0;};1: by auto.
proc change ^while.23 : { rp <- sliceset256_16_256 rp (2*i*256) g0;}; 1: by auto => /#. 
proc change ^while.24 : { rp <- sliceset256_16_256 rp ((2*i+1)*256) g1;}; 1: by auto => /#. 
proc change ^while.25 : { rp <- sliceset256_16_256 rp ((2*i+8)*256) g2;}; 1: by auto => /#. 
proc change ^while.26 : { rp <- sliceset256_16_256 rp ((2*i+9)*256) g3;}; 1: by auto => /#. 


unroll for ^while.
wp -1.


conseq (: _ ==> rp = init_256_16 (fun i => decompress1_circuit _m.[i %/ 8].[i %% 8]));
 2: by circuit.

(* BDEP post conseq *)

move => &hr [#]/= <- rr /= ->.

split.
+ rewrite tP => i ib.
  rewrite /init_256_16 !mapiE 1,2:/# /= -get_to_list /= initiE 1:/# /=.
  by rewrite /decompress1_circuit decompress1_circuit_sem //.

rewrite /pos_bound256_cxq qE /= => k kb. 
rewrite /init_256_16 initiE 1:/# /=.
by smt(decompress1_circuit_rng).
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
proc change 3 : { qx16 <- sliceget16_16_256 jqx16 0;};1: by auto.
proc change ^while.1: { r <- sliceget256_16_256 rp0 (i0*256);};1: by auto => /#.
proc change ^while.9: { rp0 <- sliceset256_16_256 rp0 (i0*256) r;};1: by auto => /#.
proc change 8: {hq <- sliceget16_16_256 px16 0;}; 1: by auto.
proc change 10: {hhq <- sliceget16_16_256 px16 0;}; 1: by auto.
proc change ^while{2}.1: { f0 <- sliceget256_16_256 a (2*i*256);};1: by auto => /#.
proc change ^while{2}.2: { f1 <- sliceget256_16_256 a ((2*i+1)*256);};1: by auto => /#.
proc change ^while{2}.14 : { rp <- sliceset32_8_32 rp  (i*32) c;};1: by auto => /#.


cfold 11.
unroll for ^while.
cfold ^i0<-.
unroll for ^while.
wp -3. 


conseq (: a = _aw /\
   Array256.all (fun bv => W16.zero \sle bv /\ bv \sle (of_int (2 * 3329))) a ==> rp = init_32_8 (fun i => W8.init (fun j => compress1_circuit _aw.[i*8+j]))); last  by circuit.

(* conseq pre *)
+ move => &hr />; rewrite /pos_bound256_cxq qE /= /(\sle) allP /=  => Hb i ib /=.
  rewrite /(to_sint W16.zero) /= /(W16.smod 0) /=.
  rewrite /(to_sint (W16.of_int 6658)) /= /(W16.smod 6658) /= /#.

(* BDEP post conseq *)
move => &hr [#]/= H0 <- rr ->; rewrite /= /init_32_8 tP => i ib.
rewrite wordP => k kb; rewrite !initiE 1..3:/# /=.
rewrite encode_compress_bits //=.
by apply compress1_circuit_sem.
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

lemma polyvec_tobytes_ll : islossless Jkem768_avx2.M.__i_polyvec_tobytes.
proc.
inline *. 
do 7!(unroll for ^while); auto. 
qed.

abbrev mask12 = VPBROADCAST_16u16(W16.of_int 4095).

module AuxToBytes = {
proc __i_polyvec_tobytes(r : W8.t Array1152.t, a : W16.t Array768.t) : W8.t Array1152.t = {
  var i,rp,a0,i0,t0,t1,t2,t3,t4,t5,t6,t7,tt,ttt,a1,b,t00,r00,t10,r1,a2,b0,t01,r01,t11,r10,a3,b1,t02,r02,t12,r11,a4,b2,t03,t13,a5,b3,t04,t14,a6,b4,t05,t15,a7,b5,r03,r12,a8,b6,r04,r13,a9,b7,r05,r14,a10,b8,r06,r15,a11,b9,r07,r16,a12,b10,r08,r17,aux,aux_0;
  i <- 0;                                                                                                                       
  while (i < 3) {                                                                                                              
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
    r <- Array1152.init (fun (i_0 : int) => if 384 * i <= i_0 < 384 * i + 384 then aux.[i_0 - 384 * i] else r.[i_0]);           
    a <- Array768.init (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux_0.[i_0 - 256 * i] else a.[i_0]);         
    i <- i + 1;                                                                                                                 
  }
  return r;
 }       
}.

op nttpack_16 (rp : W16.t Array256.t)  = init_256_16 (fun (i : int) => rp.[nttpack_idx.[i]]).

op nttpackv_16 (v : W16.t Array768.t) =
  init_768_16
    (fun (i : int) =>
       if 0 <= i < 256 then (nttpack_16 (subarray256 v 0)).[i]
       else
         if 256 <= i < 512 then (nttpack_16 (subarray256 v 1)).[i - 256]
         else  (nttpack_16 (subarray256 v 2)).[i - 512]).

lemma nttpackv_16E v : nttpackv_16 v = nttpackv v.
rewrite /nttpackv_16 /init_768_16 /nttpack_16 /init_256_16.
by rewrite /nttpackv /nttpack.
qed.



lemma auxtobytes_corr_h (_aw : W16.t Array768.t):
    hoare[AuxToBytes.__i_polyvec_tobytes :
             pos_bound768_cxq a 0 768 2 /\ a = _aw ==> 
    res = encode12_vec (map asint (lift_array768 (nttpackv _aw)))]. 
proc;inline *.
proc change ^while.1: {rp <- init_384_8 (fun i_0 => r.[384 * i + i_0]);};1: by auto.
proc change ^while.2: {a0 <- init_256_16 (fun i_0 => a.[256 * i + i_0]);};1: by auto.
(* FIXME: CHECK qx16 initialization inside while *)
proc change ^while.4: {qx16 <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change ^while.^while.1: { r0 <- sliceget256_16_256 rp0 (i1*256);}; 1: by auto => /#.
proc change ^while.^while.9 : {rp0 <- sliceset256_16_256 rp0 (i1*256) r0;}; 1: by auto => /> /#.
proc change ^while.^while{2}.1 : {t0 <- sliceget256_16_256 a0 (8*i0*256);};1: by auto => /#.
proc change ^while.^while{2}.2 : {t1 <- sliceget256_16_256 a0 ((8*i0+1)*256);};1: by auto => /#.
proc change ^while.^while{2}.3 : {t2 <- sliceget256_16_256 a0 ((8*i0+2)*256);};1: by auto => /#.
proc change ^while.^while{2}.4 : {t3 <- sliceget256_16_256 a0 ((8*i0+3)*256);};1: by auto => /#.
proc change ^while.^while{2}.5 : {t4 <- sliceget256_16_256 a0 ((8*i0+4)*256);};1: by auto => /#.
proc change ^while.^while{2}.6 : {t5 <- sliceget256_16_256 a0 ((8*i0+5)*256);};1: by auto => /#.
proc change ^while.^while{2}.7 : {t6 <- sliceget256_16_256 a0 ((8*i0+6)*256);};1: by auto => /#.
proc change ^while.^while{2}.8 : {t7 <- sliceget256_16_256 a0 ((8*i0+7)*256);};1: by auto => /#.
proc change ^while.^while{2}.105 : {rp <- sliceset384_8_256 rp (192*i0*8) t0;};1: by auto => /#.
proc change ^while.^while{2}.106 : {rp <- sliceset384_8_256 rp ((192*i0+32)*8) t2;};1: by auto => /#.
proc change ^while.^while{2}.107 : {rp <- sliceset384_8_256 rp ((192*i0+64)*8) t1;};1: by auto => /#.
proc change ^while.^while{2}.108 : {rp <- sliceset384_8_256 rp ((192*i0+96)*8) t3;};1: by auto => /#.
proc change ^while.^while{2}.109 : {rp <- sliceset384_8_256 rp ((192*i0+128)*8) ttt;};1: by auto => /#.
proc change ^while.^while{2}.110 : {rp <- sliceset384_8_256 rp ((192*i0+160)*8) t4;};1: by auto => /#.
proc change ^while.11: { r <- init_1152_8 (fun (i_0 : int) => if 384 * i <= i_0 < 384 * i + 384 then aux.[i_0 - 384 * i] else r.[i_0]);}; 1: by auto.
proc change ^while.12: { a <- init_768_16  (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux_0.[i_0 - 256 * i] else a.[i_0]);};1: by auto. 

unroll for ^while.
do 6!(unroll for ^while).
cfold ^i<-.
cfold ^i0<-.
cfold ^i1<-.
wp -3.


conseq (: 
 a = _aw /\
   Array768.all (fun bv => W16.zero \sle bv /\ bv \slt (of_int (2 * 3329))) a
   ==> r =  let ret = init_768_12 (fun j => tobytes_circuit (nttpackv_16 _aw).[j]) in
  init_1152_8 (fun i =>
    W8.init (fun j =>
      let idx = i*8 + j in
      let aidx = idx %/ 12 in
      let bidx = idx %% 12 in
      W12."_.[_]" (ret.[aidx]) bidx))); last by circuit.
      
+ move => &hr />; rewrite allP /= /pos_bound768_cxq /(\sle) /(\slt) /= /qE /smod /=.
  by rewrite qE /= => H k ?; move : (H k _) => //=.

move => &hr [#]/=; rewrite /pos_bound768_cxq /bpos16 => H0 <- rr ->.
rewrite /init_1152_8 /encode12 tP => i ib.
rewrite initiE 1:/# /= get_of_list 1:/# /= wordP => k kb.
rewrite initiE //= /init_256_12 initiE 1:/# /=.
have := nttpackv_pred a{hr} (fun c => bpos16 c (2 * q)).
rewrite !allP  /= iffE qE /= => [#_ H].
by rewrite nttpackv_16E  to_bytes_circuit_sem;1..3:
 by rewrite /(\ult) /=; smt(W16.to_sint_unsigned).
 qed.


lemma auxtobytes_ll : islossless AuxToBytes.__i_polyvec_tobytes.
proc.
inline *. 
do 7!(unroll for ^while); auto. 
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

+ move => *.
  rewrite /subarray256 /nttunpack initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k - 512].
  do 4!(rewrite initiE //=; 1:smt(nttunpack_bnd Array256.allP)).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  do 2!(rewrite /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
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
  rewrite ifF 1:/# /= ifF 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (512+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /= ifF 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
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
  rewrite ifF  1:/# ifF 1:/# initiE //= 1:/#.
  pose a := nttunpack_idx.[k-512].
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  rewrite initiE //= 1: /# !mapiE //= 1: /#. 
  move : (HHH (a) _); 1: smt(). 
  rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/# initiE//= 1:/#.
  rewrite ifF 1: /# ifF 1:/# initiE//= 1:/# initiE//= 1:/#. 
  pose b := nttpack_idx.[a].
  move : nttpack_idxK; rewrite allP => Hidx.
  move : (Hidx (k-512) _)=>//; smt(mem_iota).

by smt().
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

lemma eq_vectorP3 :
      forall (v1 v2 : PolyVec.polyvec),
        (v1 = v2) <=> ((KMatrix.Vector."_.[_]" v1 0 = KMatrix.Vector."_.[_]" v2 0) /\ (KMatrix.Vector."_.[_]" v1 1 = KMatrix.Vector."_.[_]" v2 1) /\ (KMatrix.Vector."_.[_]" v1 2 = KMatrix.Vector."_.[_]" v2 2)).
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
move :Hr1; rewrite !mapvE /lift_polyvec eq_vectorP3 !KMatrix.Vector.offunvE //=. 
rewrite /lift_array256 /subarray256 /map !tP -!andaE. 
apply andaW. 
move => Hr10. 
apply andaW. 
move => Hr11. 
move :Hs1;rewrite /scale_vector /lift_polyvec eq_vectorP3 !KMatrix.Vector.offunvE //=.
rewrite /scale /lift_array256 /subarray256 /map !tP -!andaE.
apply andaW. 
move => Hs10. 
apply andaW. 
move => Hs11 Hs12 Hs21.  
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
 + move :(Hs12 (j-512)). rewrite Hj_3 !initiE //= !initiE //= => <-.
 + move :(Hs21 (j-512)). rewrite Hj_3 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
smt().
qed.
