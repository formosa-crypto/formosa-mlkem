require import AllCore List Int IntDiv CoreMap Real Number Ring StdOrder BitEncoding.

from Jasmin require import JModel.
from JazzEC require import Array256 Array128 Array64 Array32 Array16 Array8 Array4 Array2.
from JazzEC require import Array768 Array960 Array1152 Array1024 Array1408 Array1536 Array160 Array2304.
from JazzEC require import Jkem_avx2.

require import AVX2_Ops W16extra.
require import Fq NTT_Fq MLKEMFCLib MLKEM_W16_Rep MLKEM1024_prelude.
require import Mlkem_bindings.
require import Circuit_semantics.
from Spec require import GFq Rq Serialization VecMat Sampling EncDecCorrectness Correctness.

import BitChunking BS2Int.
import Fq.
import GFq Rq Serialization VecMat.
import Zq ZModP IntOrder BitReverse.
import PolyVec PolyMat.
import MLKEMFCLib1024.
import W12.

abbrev decode11_vec (a : W8.t Array1408.t) : ipolyvec = IPVec.of_list 0 (ByteDecode 11 (to_list a)).
abbrev decode5 (a : W8.t Array160.t) : ipoly = Array256.of_list 0 (ByteDecode 5 (to_list a)).


lemma to_bytes_circuit_sem_polyvec (p : W16.t Array1024.t) (i k : int) :
    p.[(i * 8 + k) %/ 12] \ult W16.of_int (2*3329) =>
        0 <= i < 1536 =>
        0 <= k < 8 =>
((tobytes_circuit p.[(i * 8 + k) %/ 12]).[(i * 8 + k) %% 12])%W12 =
(ByteEncode 12 (to_list (map asint (lift_array1024 p)))).[i].[k].
proof.
rewrite /(\ult) /=  => bd Hi Hk.
rewrite /ByteEncode /BitsToBytes (nth_map []).
+ rewrite size_chunk // (EclibExtra.size_flatten' 12);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=.
rewrite JWordList.nth_chunk 1,2:/#.
+ rewrite (EclibExtra.size_flatten' 12);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=; smt(kvec_val).
rewrite get_bits2w // nth_take 1,2:/# nth_drop 1,2:/#.
rewrite (nth_flatten false 12);1:by  rewrite allP;smt(mapP BS2Int.size_int2bs).
rewrite (nth_map witness);1: rewrite size_to_list /#.
rewrite get_to_list mapiE 1:/# /lift_array256 mapiE 1:/# /= incoeffK.
rewrite /tobytes_circuit /(\ult) /=.
case (to_uint p.[(i * 8 + k) %/ 12] < 3329) => ?.
+ rewrite /truncateu12 /of_int get_bits2w 1:/# /= modz_small;1:smt(W16.to_uint_cmp).
  rewrite qE (modz_small _ 3329); 1,2: by rewrite /to_sint /smod /=;smt(W16.to_uint_cmp pow2_16).
have -> : (W16_sub p.[(i * 8 + k) %/ 12] (W16.of_int 3329))=
          W16.of_int (to_sint p.[(8 * i + k) %/ 12] %% q); last first.
+ rewrite /truncateu12 of_uintK  /= modz_small;1:smt(W16.to_uint_cmp).
  rewrite /of_int get_bits2w 1:/# /= /#.
rewrite /W16_sub /= to_uint_eq of_uintK modz_small;1:smt(W16.to_uint_cmp).
rewrite to_uintB /=;1: rewrite /(\ule) /= /#.
rewrite /to_sint /smod /= /#.
qed.


op decompress11_circuit(c : W11.t) : W16.t = 
  truncateu16 (srl_32 (((zeroextu11_32 c) * W32.of_int 3329) + W32.of_int 1024) (W32.of_int 11)).


lemma pow2_11 : 2^11 = 2048 by auto.


lemma decompress11_circuit_sem (a : W8.t Array1408.t) (i : int) :
        0 <= i < 1024 =>
        incoeff (to_sint (decompress11_circuit (W11.init (fun (j : int) => a.[(i*11 + j) %/ 8].[(i*11 + j) %% 8])))) =
Decompress 11 (decode11_vec a).[i].
proof.
move => ib. 
rewrite -decompress_alt_decompress // /decompress_alt;congr.
rewrite get_of_list; 1: by smt(kvec_val).
rewrite /ByteDecode (nth_map []);
 1: by rewrite size_chunk // size_BytesToBits size_to_list /#.
rewrite /decompress11_circuit /to_sint to_uint_truncateu16 /srl_32 to_uint_shr //=.
rewrite to_uintD_small /=.
+ rewrite to_uintM_small /zeroextu11_32 of_uintK /= modz_small /=;by smt(W11.to_uint_cmp pow2_11).  
rewrite to_uintM_small /=; 1: by rewrite /zeroextu11_32 of_uintK //= modz_small /=;by smt(W11.to_uint_cmp pow2_11).
rewrite /smod ifF /=; 1: by rewrite /zeroextu5_32 of_uintK /= modz_small /=;by smt(W11.to_uint_cmp pow2_11).
rewrite /zeroextu11_32 of_uintK /= modz_small /=;1: by smt(W11.to_uint_cmp pow2_11).
rewrite modz_small /=;1: by smt(W11.to_uint_cmp pow2_11).
rewrite /to_uint;congr;congr;congr;congr;last by smt().
congr;apply (eq_from_nth false).
+ by rewrite size_w2bits size_nth_chunk // size_BytesToBits size_to_list /#.
move => k; rewrite size_w2bits => kb.
rewrite get_w2bits initiE 1:/# /=  JWordList.nth_chunk 1,2:/#.
+ by rewrite size_BytesToBits size_to_list /#.
rewrite /BytesToBits nth_take 1,2:/# nth_drop 1,2:/#.
rewrite (nth_flatten false 8); 1:by  rewrite allP; smt(mapP W8.size_w2bits  size_map).
rewrite (nth_map witness);1: by rewrite size_to_list /= /#.
rewrite (nth_map witness);1: by rewrite size_iota /= /#.
by rewrite nth_iota /#.
qed.

lemma decompress11_circuit_rng  (a : W8.t Array1408.t) (i : int) :
     0 <= i < 1024 =>   
     0 <= to_sint (decompress11_circuit (W11.init (fun (j : int) => a.[(i*11 + j) %/ 8].[(i*11 + j) %% 8]))) < 3329.
proof.
move => ib.
rewrite /decompress11_circuit /to_sint to_uint_truncateu16 /srl_32 to_uint_shr //=.
rewrite to_uintD_small /=.
+ rewrite to_uintM_small /zeroextu11_32 of_uintK /= modz_small /=;by smt(W11.to_uint_cmp pow2_11).  
rewrite to_uintM_small /=; 1: by rewrite /zeroextu5_32 of_uintK //= modz_small /=;by smt(W11.to_uint_cmp pow2_11).
rewrite /smod ifF /=; 1: by rewrite /zeroextu5_32 of_uintK /= modz_small /=;by smt(W11.to_uint_cmp pow2_11).
rewrite /zeroextu11_32 of_uintK /= modz_small /=;1: by smt(W11.to_uint_cmp pow2_11).
rewrite modz_small /=; by smt(W11.to_uint_cmp pow2_11).
qed.

lemma frombytes_circuit_sem (a : W8.t Array1536.t) (i : int) :
        0 <= i < 1024 =>
        incoeff (to_sint (frombytes_circuit
             (W12.init (fun (j : int) => a.[(i * 12 + j) %/ 8].[(i * 12 + j) %% 8])))) =
        incoeff (IPVec.of_list 0 (ByteDecode 12 (to_list a))).[i].
proof.
move => ib.
rewrite get_of_list; 1: by smt(kvec_val).
rewrite /ByteDecode (nth_map []);
 1: by rewrite size_chunk // size_BytesToBits size_to_list /#.
rewrite /frombytes_circuit /to_sint /zeroextu16 of_uintK /= modz_small /=; 1: by have :=  W12.to_uint_cmp => /= /#.
rewrite /BytesToBits JWordList.nth_chunk 1,2:/#.
rewrite (EclibExtra.size_flatten' 8);1,2:smt(mapP W8.size_w2bits Array1536.size_to_list size_map).
congr.
rewrite /smod /=.
rewrite ifF; 1: by have :=  W12.to_uint_cmp => /= /#.
rewrite /to_uint;congr;apply (eq_from_nth false).
+ rewrite W12.size_w2bits size_take 1:/# size_drop 1:/#.
  rewrite (EclibExtra.size_flatten' 8);1,2:smt(mapP W8.size_w2bits Array1536.size_to_list size_map).
move => k; rewrite W12.size_w2bits => kb.
rewrite W12.get_w2bits W12.initiE 1:/# /=.
rewrite nth_take 1,2:/# nth_drop 1,2:/#.
rewrite (nth_flatten false 8);1: by rewrite allP => x;rewrite mapP => Hx;elim Hx;smt(W8.size_w2bits).
rewrite (nth_map witness);1: by rewrite size_to_list /= /#.
rewrite get_to_list get_w2bits /#.
qed.

lemma frombytes_circuit_rng  (a : W8.t Array1536.t) (i : int) :
     0 <= to_sint (frombytes_circuit
             (W12.init (fun (j : int) => a.[(i * 12 + j) %/ 8].[(i * 12 + j) %% 8])))< 4096.
proof.
rewrite /frombytes_circuit.
rewrite  /to_sint  /to_sint /zeroextu16 of_uintK /= modz_small /=; 1: by have :=  W12.to_uint_cmp => /= /#.
rewrite /smod /=.
have :=  W12.to_uint_cmp => /=/#.
qed.


op compress5_circuit(a : W16.t) : W5.t = 
   if (a \ult W16.of_int 3329) then  
   truncateu32_5 (srl_32 ((sll_32 (zeroextu32 a) (W32.of_int 5) + W32.of_int 1664) * W32.of_int 40318) (W32.of_int 27))
   else 
   truncateu32_5 (srl_32 ((sll_32 (zeroextu32 (W16_sub a (W16.of_int 3329))) (W32.of_int 5) + W32.of_int 1664) * W32.of_int 40318) (W32.of_int 27)).  

 

lemma compress5_circuit_sem (p : W16.t Array256.t) (i k : int) :
        0 <= i < 160 =>
        0 <= k < 8 =>
     pos_bound256_cxq p 0 256 2 =>
(compress5_circuit p.[(i * 8 + k) %/ 5]).[(i * 8 + k) %% 5] =
(Compress 5 (incoeff (to_sint p.[(8 * i + k) %/ 5])) %/ 2 ^ ((8 * i + k) %% 5) %% 2 <> 0).
proof.
move => Hi Hk /=; rewrite /compress5_circuit  /pos_bound256_cxq qE /= => H00.
rewrite ultE /= get_to_uint.
have ->/= : (0 <= (i * 8 + k) %% 5 < 5) by smt().
case (to_uint p.[(i * 8 + k) %/ 5] < 3329) => /= *. 
+ rewrite -Fq.Fq1024.compress_impl5 //=; 1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).  
  congr;congr;congr;congr;congr;congr; 2: by smt().
  rewrite /truncateu32_4 of_uintK /=. 
  by rewrite /srl_32 /sll_32 /(`<<`) /(`>>`) /= /#.

  
have -> : (incoeff (to_sint p.[(8 * i + k) %/ 5])) = (incoeff (to_sint (W16_sub p.[(8 * i + k) %/ 5] (W16.of_int 3329)))); last first.
+ rewrite -Fq.Fq1024.compress_impl5 //=.
  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota).
  rewrite  /smod /= qE; have := H00 ((8 * i + k) %/ 5) _; 1: by smt().
  move => Hb; have E: to_sint (W16.of_int 3329) = 3329 by rewrite /to_sint /smod /=.
  by rewrite E; smt(W16.to_uint_cmp pow2_16 W16.to_sintE).
  rewrite /truncateu32_4 of_uintK /=.
  by rewrite /srl_32 /sll_32 /(`<<`) /(`>>`) /= /#.

rewrite -eq_incoeff.
rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /smod /=; smt(size_map size_iota W16.to_uint_cmp).
qed.

op decompress5_circuit(c : W5.t) : W16.t =
  truncateu16 (srl_32 (((zeroextu5_32 c) * W32.of_int 3329) + W32.of_int 16) (W32.of_int 5)).

lemma decompress5_circuit_sem (a : W8.t Array160.t) (i : int) :
        0 <= i < 256 =>
        incoeff (to_sint (decompress5_circuit (W5.init (fun (j : int) => a.[(i*5 + j) %/ 8].[(i*5 + j) %% 8])))) =
Decompress 5 (decode5 a).[i].
proof.
move => ib. 
rewrite -decompress_alt_decompress // /decompress_alt;congr.
rewrite /decode5 /= get_of_list // /ByteDecode (nth_map []);
 1: by rewrite size_chunk // size_BytesToBits size_to_list /#.
rewrite /decompress5_circuit /to_sint to_uint_truncateu16 /srl_32 to_uint_shr //=.
rewrite to_uintD_small /=.
+ rewrite to_uintM_small /zeroextu5_32 of_uintK /= modz_small /=;by smt(W5.to_uint_cmp pow2_5).  
rewrite to_uintM_small /=; 1: by rewrite /zeroextu5_32 of_uintK //= modz_small /=;by smt(W5.to_uint_cmp pow2_5).
rewrite /smod ifF /=; 1: by rewrite /zeroextu5_32 of_uintK /= modz_small /=;by smt(W5.to_uint_cmp pow2_5).
rewrite /zeroextu5_32 of_uintK /= modz_small /=;1: by smt(W5.to_uint_cmp pow2_5).
rewrite modz_small /=;1: by smt(W5.to_uint_cmp pow2_5).
rewrite /to_uint;congr;congr;congr;congr;last by smt().
congr;apply (eq_from_nth false).
+ by rewrite size_w2bits size_nth_chunk // size_BytesToBits size_to_list /#.
move => k; rewrite size_w2bits => kb.
rewrite get_w2bits initiE 1:/# /=  JWordList.nth_chunk 1,2:/#.
+ by rewrite size_BytesToBits size_to_list /#.
rewrite /BytesToBits nth_take 1,2:/# nth_drop 1,2:/#.
rewrite (nth_flatten false 8); 1:by  rewrite allP; smt(mapP W8.size_w2bits Array32.size_to_list size_map).
rewrite (nth_map witness);1: by rewrite size_to_list /= /#.
rewrite (nth_map witness);1: by rewrite size_iota /= /#.
by rewrite nth_iota /#.
qed.

lemma decompress5_circuit_rng  (a : W8.t Array160.t) (i : int) :
     0 <= i < 256 =>   
     0 <= to_sint (decompress5_circuit (W5.init (fun (j : int) => a.[(i*5 + j) %/ 8].[(i*5 + j) %% 8]))) < 3329.
proof.
move => ib.
rewrite /decompress5_circuit /to_sint to_uint_truncateu16 /srl_32 to_uint_shr //=.
rewrite to_uintD_small /=.
+ rewrite to_uintM_small /zeroextu5_32 of_uintK /= modz_small /=;by smt(W5.to_uint_cmp pow2_5).  
rewrite to_uintM_small /=; 1: by rewrite /zeroextu5_32 of_uintK //= modz_small /=;by smt(W5.to_uint_cmp pow2_5).
rewrite /smod ifF /=; 1: by rewrite /zeroextu5_32 of_uintK /= modz_small /=;by smt(W5.to_uint_cmp pow2_5).
rewrite /zeroextu5_32 of_uintK /= modz_small /=;1: by smt(W5.to_uint_cmp pow2_5).
rewrite modz_small /=; by smt(W5.to_uint_cmp pow2_5).
qed.

op compress11_circuit(a : W16.t) : W11.t = 
   if (a \ult W16.of_int 3329) then  
   truncate64_11 (srl_64 ((sll_64 (zeroextu64 a) (W64.of_int 11) + W64.of_int 1664) * W64.of_int 645084) (W64.of_int 31))
   else 
   truncate64_11 (srl_64 ((sll_64 (zeroextu64 (W16_sub a (W16.of_int 3329))) (W64.of_int 11) + W64.of_int 1664) * W64.of_int 645084) (W64.of_int 31)).

   
import BitEncoding BS2Int BitChunking.
from JazzEC require import Array8.


lemma compress11_circuit_sem (p : W16.t Array1024.t) (i k : int) :
        0 <= i < 1408 =>
        0 <= k < 8 =>
     pos_bound1024_cxq p 0 1024 2 =>
(compress11_circuit p.[(i * 8 + k) %/ 11]).[(i * 8 + k) %% 11] =
(Compress 11 (incoeff (to_sint p.[(8 * i + k) %/ 11])) %/ 2 ^ ((8 * i + k) %% 11) %% 2 <> 0).
proof.
move => Hi Hk /=; rewrite /compress11_circuit  /pos_bound1024_cxq qE /= => H00.
rewrite ultE /= get_to_uint.
have ->/= : (0 <= (i * 8 + k) %% 11 < 11) by smt().
case (to_uint p.[(i * 8 + k) %/ 11] < 3329) => /= *. 
+ rewrite -Fq.Fq1024.compress_impl_large //=; 1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).  
  congr;congr;congr;congr;congr;congr; 2: by smt().
  rewrite /truncateu64_11 of_uintK /=. 
  by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) /= /#.

  
have -> : (incoeff (to_sint p.[(8 * i + k) %/ 11])) = (incoeff (to_sint (W16_sub p.[(8 * i + k) %/ 11] (W16.of_int 3329)))); last first.
+ rewrite -Fq.Fq1024.compress_impl_large //=.
  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota).
  rewrite  /= /smod /= qE; have Hub := H00 ((8 * i + k) %/ 11) _; 1: by smt().
  have E: to_sint (W16.of_int 3329) = 3329 by rewrite /to_sint /smod /=.
  by rewrite E; smt(W16.to_uint_cmp pow2_16 W16.to_sintE qE).
  rewrite /truncateu64_11 of_uintK /=.
  by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) /= /#.

rewrite -eq_incoeff.
rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))/= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).
qed.

lemma encode_vec_compress_bits (p : W16.t Array1024.t) (i : int) (k : int) :
     0 <= i < 1024*11 %/ 8 =>
     0 <= k < 8 =>
    (ByteEncode 11 (to_list (compress_polyvec 11 (lift_polyvec p)))).[i].[k] =
    ((Compress 11 (incoeff (to_sint p.[(8 * i + k) %/ 11])) %/ 2^((8 * i + k) %% 11)) %% 2 <> 0).
move => Hi Hk.
rewrite /ByteEncode /BitsToBytes (nth_map []).
+ rewrite size_chunk // (EclibExtra.size_flatten' 11);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=; smt(kvec_val).
rewrite /W8.bits2w initiE 1:/# /=.
rewrite JWordList.nth_chunk 1,2:/#.
+ rewrite  (EclibExtra.size_flatten' 11);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=; smt(kvec_val).
rewrite nth_take 1,2:/# nth_drop 1,2:/#.
+ have -> := nth_flatten false 11; 1: by rewrite allP => ? /=;smt(mapP BS2Int.size_int2bs).
rewrite (nth_map witness); 1: by rewrite size_to_list; smt(kvec_val).
rewrite get_to_list /= /compress_polyvec (nth_map 0) /=;1:smt(size_iota).
rewrite initiE; 1: by smt(kvec_val).
rewrite /= nth_iota 1:/#.
rewrite /lift_polyvec KVec.initiE; 1: by smt(kvec_val).
simplify.
rewrite /lift_array256 mapiE 1:/#.
rewrite /= /subarray256 initiE 1:/#.
simplify; have ->: 256 * ((8 * i + k) %/ 11 %/ 256) + (8 * i + k) %/ 11 %% 256 = (8 * i + k) %/ 11 by smt().
done.
qed.



(********** BEGIN BDEP PROOF OF CSUBQ **************)

abbrev keepodd11 = (W32.of_int 134152192).
abbrev keepeven11 = (W32.of_int 2047).

op VPMADDWD_alt(f0 m : W256.t) : W256.t =
    if m <> (VPBROADCAST_4u64 (W64.of_int 576460756732608513)) then
       VPMADDWD_256 f0 m
    else
    let f2 = VPBROADCAST_8u32 keepodd11 in
    let f1 = VPAND_256 f0 f2  in
    let f2 = VPBROADCAST_8u32 keepeven11 in
    let f0 = VPAND_256 f0 f2  in
    let f1 = VPSRL_8u32 f1  (W128.of_int 5) in
        VPOR_256 f0 f1.


lemma keepeven_bits b:
  0 <= b < 32 =>
   keepeven11.[b] <=> 0<=b<11.
move => bb.
have  : all (fun b => keepeven11.[b] <=> 0 <= b < 11) (iota_ 0 32); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
by rewrite /of_int  /int2bs /mkseq -iotaredE /=.
qed.

lemma keepodd_bits b: 
  0 <= b < 32 =>
   keepodd11.[b] <=> 16<=b<27.
move => bb.
have  : all (fun b => keepodd11.[b] <=> 16 <= b < 27) (iota_ 0 32); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
by rewrite /of_int  /int2bs /mkseq -iotaredE /=.
qed.

lemma lowbits_keep (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 0 => 
  0 <= b < 11 =>
    (f \bits16 i).[b] = ((f \bits32 i%/2)  `&` keepeven11).[b].
proof. 
move => bi Hi Hb. 
have H := W16u16.get_bits16 f (16*i + b) _;1:smt().
have H0 := W8u32.get_bits32 f (16*i + b) _;1:smt().
rewrite andE map2iE 1:/# /=.
by smt(keepeven_bits).
qed.

lemma lowbits_drop (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 0 => 
  11 <= b < 16 =>
  !((f \bits32 i%/2)  `&` keepeven11).[b].
proof. 
move => bi Hi Hb. 
rewrite andE map2iE 1:/# /=.
by smt(keepeven_bits).
qed.

lemma highbits_keep (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 1 => 0 <= b < 11 =>
    (f \bits16 i).[b] = ((f \bits32 i%/2)  `&` keepodd11).[b + 16].
proof. 
move => bi Hi Hb. 
have H := W16u16.get_bits16 f (16*i + b) _;1:smt().
have H0 := W8u32.get_bits32 f (16*i + b) _;1:smt().
rewrite andE map2iE 1:/# /=.
by smt(keepodd_bits).
qed.

lemma highbits_drop (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 1 =>11 <= b < 15 =>
    !((f \bits32 i%/2)  `&` keepodd11).[b + 16].
proof. 
move => bi Hi Hb. 
rewrite andE map2iE 1:/# /=.
by smt(keepodd_bits).
qed.


lemma lowbits_ofint_keep (f0 f1 : W16.t) b :
  0 <= b < 11 =>
  0<= to_sint f0 < 2048 =>
  0<= to_sint f1 < 2048 =>
  (W32.of_int (to_sint f0 + to_sint f1 * 2048)).[b] = f0.[b].
move => ?.
rewrite /to_sint /smod /= => ??.
have  : all (fun b => (W32.of_int
   ((if 32768 <= to_uint f0 then to_uint f0 - 65536 else to_uint f0) +
    (if 32768 <= to_uint f1 then to_uint f1 - 65536 else to_uint f1) * 2048)).[b] =
f0.[b]) (iota_ 0 11); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
 rewrite  /of_int /int2bs /mkseq -iotaredE /=;do split; rewrite get_to_uint /= /#.
qed.

lemma highbits_ofint_keep (f0 f1 : W16.t) b :
  0<= to_sint f0 < 2048 =>
  0<= to_sint f1 < 2048 =>
  11 <= b < 22 =>
  (W32.of_int (to_sint f0 + to_sint f1 * 2048)).[b] = f1.[b-11].
move => ?.
rewrite /to_sint /smod /= => ??.
have  : all (fun b => (W32.of_int
   ((if 32768 <= to_uint f0 then to_uint f0 - 65536 else to_uint f0) +
    (if 32768 <= to_uint f1 then to_uint f1 - 65536 else to_uint f1) * 2048)).[b] =
f1.[b - 11]) (iota_ 11 22); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
 rewrite  /of_int /int2bs /mkseq -iotaredE /=;do split; rewrite get_to_uint /=; smt(pow2_16 pow2_32). 
qed.


lemma highbits_ofint_drop (f0 f1 : W16.t) b :
  0<= to_sint f0 < 2048 =>
  0<= to_sint f1 < 2048 =>
  22 <= b < 32 =>
  !(W32.of_int (to_sint f0 + to_sint f1 * 2048)).[b].
move => ?.
rewrite /to_sint /smod /= => ??.
have  : all (fun b => ! (W32.of_int
     ((if 32768 <= to_uint f0 then to_uint f0 - 65536 else to_uint f0) +
      (if 32768 <= to_uint f1 then to_uint f1 - 65536 else to_uint f1) * 2048)).[b]) (iota_ 22 32); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
 rewrite  /of_int /int2bs /mkseq -iotaredE /=;do split; smt(pow2_16 pow2_32). 
qed.


lemma unand (f : W256.t) (i : int) (b : int) :
  0 <= i < 8 => 0<=b<32 =>
   (W32.init (fun (j : int) => (f \bits32 i).[j + 5] /\ keepodd11.[j + 5])).[b] = ((f \bits32 i) `&` keepodd11).[b + 5].
proof.
move => ??.
by rewrite initiE 1:/# /=.
qed.

lemma vpmaddwd_alt_corr (f0 shift2 : W256.t) :
   (forall i, 0 <= i < 16 => 0<= to_sint (f0 \bits16 i) < 2^11) =>
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
  have /= H3 := highbits_keep f0 (i*2+1) (b-11) _ _;1,2: smt().
  have /= H4 := highbits_drop f0 (i*2+1) (b-11) _ _;1,2: smt().
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

