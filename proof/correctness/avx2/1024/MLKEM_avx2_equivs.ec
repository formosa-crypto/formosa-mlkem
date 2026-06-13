require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array1536 Array1568 Array1408 Array1410 Array1024 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8 Array2.
from JazzEC require import WArray512 WArray384 WArray32 WArray16 WArray1410 WArray160.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem_avx2.
require import MLKEM_PolyVec_avx2.
require import MLKEM_Poly_avx2.
require import NTT_avx2.
require import MLKEM_W16_Rep.
require import Fq_avx2.
require import NTT_Fq.
require import MLKEM_avx2_auxlemmas.
require import MLKEM_Poly_avx2.
require import MLKEM_PolyVec_avx2.
require import MLKEM_Poly_avx2.
require import MLKEM_PolyVec_avx2.
require import MLKEMFCLib.
import MLKEMFCLib1024.

from Spec require import EncDecCorrectness1024.
import GFq Rq Symmetric Symmetric1024 Serialization Serialization1024 Sampling VecMat VecMat1024 InnerPKE1024 MLKEM1024 Correctness1024.

import Zq.
import ZModP.
import Fq_avx2.
import NTT_Avx2.

import MLKEM_PolyAVX.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import MLKEM_PolyVecAVXVec.

require import Mlkem_bindings.


import KMatrix Vector.

from JazzEC require import WArray1568 WArray2048.
require import Mlkem_bindings BitEncoding.
import BitChunking BS2Int.


(********** CIRCUIT-LEVEL OPS AND LEMMAS (relocated from ref) **************)

require import Fq.
import Fq.




lemma compress_rng a d :
   1 <= d < 12 =>
   0 <= compress d a < 2^d.
move => drng; rewrite /compress.
by apply modz_cmp; apply gt0_pow2.
qed.

lemma encode_compress_bits (p : W16.t Array256.t) (d : int) (i : int) (k : int) :
     0 <= d <= 12 =>
     0 <= i < 256*d %/ 8 =>
     0 <= k < 8 =>
       (encode d (to_list (compress_poly d (lift_array256 p)))).[i].[k] =
        ((compress d (incoeff (to_sint p.[(8 * i + k) %/ d])) %/ 2^((8 * i + k) %% d)) %% 2 <> 0).
proof.
move => Hd Hi Hk.
rewrite /encode /BitsToBytes (nth_map []).
+ rewrite size_chunk // (EclibExtra.size_flatten' d);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /= /#.
rewrite /W8.bits2w initiE 1:/# /=.
rewrite JWordList.nth_chunk 1,2:/#.
+ rewrite  (EclibExtra.size_flatten' d);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /= /#.
rewrite nth_take 1,2:/# nth_drop 1,2:/#.
+ have -> := nth_flatten false d; 1: by rewrite allP => ? /=;smt(mapP BS2Int.size_int2bs).
rewrite (nth_map witness); 1: by smt(Array256.size_to_list).
rewrite get_to_list /= /compress_poly (nth_map 0) /=;1:smt(size_iota).
by rewrite nth_iota 1:/# //= /lift_array256 !mapiE 1,2:/# /=.
qed.

op tobytes_circuit(a : W16.t) : W12.t = 
   if (a \ult W16.of_int 3329) then truncateu12 a else truncateu12 (W16_sub a (W16.of_int 3329)).

import W12.

lemma to_bytes_circuit_sem (p : W16.t Array256.t) (i k : int) :
    p.[(i * 8 + k) %/ 12] \ult W16.of_int (2*3329) =>
        0 <= i < 384 =>
        0 <= k < 8 =>
((tobytes_circuit p.[(i * 8 + k) %/ 12]).[(i * 8 + k) %% 12])%W12 =
(encode 12 (to_list (map asint (lift_array256 p)))).[i].[k].
proof.
rewrite /(\ult) /=  => bd Hi Hk.
rewrite /encode /BitsToBytes (nth_map []).
+ rewrite size_chunk // (EclibExtra.size_flatten' 12);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=.
rewrite JWordList.nth_chunk 1,2:/#.
+ rewrite (EclibExtra.size_flatten' 12);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /= /#.
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

lemma to_bytes_circuit_sem_polyvec (p : W16.t Array1024.t) (i k : int) :
    p.[(i * 8 + k) %/ 12] \ult W16.of_int (2*3329) =>
        0 <= i < 1536 =>
        0 <= k < 8 =>
((tobytes_circuit p.[(i * 8 + k) %/ 12]).[(i * 8 + k) %% 12])%W12 =
(encode 12 (to_list (map asint (lift_array1024 p)))).[i].[k].
proof.
rewrite /(\ult) /=  => bd Hi Hk.
rewrite /encode /BitsToBytes (nth_map []).
+ rewrite size_chunk // (EclibExtra.size_flatten' 12);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=.
rewrite JWordList.nth_chunk 1,2:/#.
+ rewrite (EclibExtra.size_flatten' 12);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /= /#.
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


op frombytes_circuit(a : W12.t) : W16.t = 
   zeroextu16 a.
   

op decompress11_circuit(c : W11.t) : W16.t = 
  truncateu16 (srl_32 (((zeroextu11_32 c) * W32.of_int 3329) + W32.of_int 1024) (W32.of_int 11)).


lemma pow2_11 : 2^11 = 2048 by auto.


lemma decompress11_circuit_sem (a : W8.t Array1408.t) (i : int) :
        0 <= i < 1024 =>
        incoeff (to_sint (decompress11_circuit (W11.init (fun (j : int) => a.[(i*11 + j) %/ 8].[(i*11 + j) %% 8])))) =
decompress 11 (decode11_vec a).[i].
proof.
move => ib. 
rewrite -decompress_alt_decompress // /decompress_alt;congr.
rewrite /decode11_vec /= get_of_list // /decode (nth_map []);
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
        incoeff (decode12_vec a).[i].
proof.
move => ib.
rewrite /decode12 /= get_of_list // /decode (nth_map []);
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


op compress1_circuit(a : W16.t) : bool = 
   if (a \ult W16.of_int 3329) then  
   (srl_32 ((sll_32 (zeroextu32 a) (W32.of_int 1) + W32.of_int 1665) * W32.of_int 80635) (W32.of_int 28)).[0]
   else 
   (srl_32 ((sll_32 (zeroextu32 (W16_sub a (W16.of_int 3329))) (W32.of_int 1) + W32.of_int 1665) * W32.of_int 80635) (W32.of_int 28)).[0].  

lemma compress1_circuit_sem (p : W16.t Array256.t) (i k : int) :
        0 <= i < 32 =>
        0 <= k < 8 =>
     pos_bound256_cxq p 0 256 2 =>
  compress1_circuit p.[i * 8 + k] =
  (compress 1 (incoeff (to_sint p.[8 * i + k])) %/ 2 ^ ((8 * i + k) %% 1) %% 2 <> 0).
proof.
move => Hi Hk /=; rewrite /compress1_circuit  /pos_bound256_cxq qE /= => H00.
rewrite ultE /= get_to_uint. 
case (to_uint p.[i*8+k] < 3329) => /= *.
+ rewrite -compress_impl_small //=;1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).  
  congr;congr;rewrite modz_mod;congr;congr.
  by rewrite /srl_32 /sll_32 /(`<<`) /(`>>`) /= /#.

have -> : (incoeff (to_sint p.[8*i+ k])) = (incoeff (to_sint (W16_sub p.[i*8+k] (W16.of_int 3329)))); last first.
+ rewrite -compress_impl_small //=.
  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=;smt(size_map size_iota).
  rewrite  /smod /= qE; have := H00 (i*8+k) _; 1:smt().
  by smt(W16.to_uint_cmp pow2_16).
+ by rewrite get_to_uint /= modz_mod /srl_32 /sll_32 /(`<<`) /(`>>`) /=. 

rewrite -eq_incoeff.
rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /smod /=; smt(size_map size_iota W16.to_uint_cmp).
qed.

op decompress1_circuit(c : bool) : W16.t = 
  truncateu16 (srl_32 (((if c then W32.one else W32.zero) * W32.of_int 3329) + W32.one) (W32.of_int 1)).


lemma decompress1_circuit_sem (a : W8.t Array32.t) (i : int) :
        0 <= i < 256 =>
        incoeff (to_sint (decompress1_circuit a.[i %/ 8].[i %% 8])) =
        decompress 1 (decode1 a).[i].
proof.
move => ib.
rewrite -decompress_alt_decompress // /decompress_alt;congr.
rewrite /decode1 /= get_of_list // /decode (nth_map []);
 1: by rewrite size_chunk // size_BytesToBits size_to_list /#.
rewrite /decompress1_circuit /to_sint to_uint_truncateu16 /srl_32 to_uint_shr //=.
have -> : (if a.[i %/ 8].[i %% 8] then W32.one else W32.zero) =
  W32.of_int (b2i a.[i %/ 8].[i %% 8])
   by case (a.[i %/ 8].[i %% 8]) => /=;rewrite /b2i /=. 
rewrite to_uintD_small /= of_uintK /= /b2i /= modz_small /= 1..3:/#.
rewrite /BytesToBits JWordList.nth_chunk //= 1:/#.
+ rewrite (EclibExtra.size_flatten' 8);smt(mapP W8.size_w2bits Array32.size_to_list size_map).
rewrite /smod /= modz_small;1:smt().
rewrite ifF 1:/# /=;congr;congr;congr;congr;2:smt().
rewrite /bs2int /= size_take // size_drop 1:/# /=.
rewrite (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits Array32.size_to_list size_map).
rewrite size_map /= size_to_list /=.
rewrite (: (if 1 < max 0 (256 - i) then 1 else max 0 (256 - i)) = 1) 1:/# /=.
rewrite /range /= -iotaredE /= StdBigop.Bigint.BIA.big_seq1 /= /b2i /=.
congr; rewrite nth_take // nth_drop 1:/# //= (nth_flatten false 8);
  1: by rewrite allP /= => x;  smt(mapP W8.size_w2bits).
rewrite (nth_map witness);1: by rewrite size_to_list /= /#.
by rewrite get_to_list get_w2bits.
qed.

lemma decompress1_circuit_rng  (a : W8.t Array32.t) (i : int) :
     0 <= to_sint (decompress1_circuit a.[i %/ 8].[i %% 8]) < 3329.
proof.
rewrite /decompress1_circuit.
rewrite /decompress1_circuit /to_sint to_uint_truncateu16 /srl_32 to_uint_shr //=.
have -> : (if a.[i %/ 8].[i %% 8] then W32.one else W32.zero) =
  W32.of_int (b2i a.[i %/ 8].[i %% 8])
   by case (a.[i %/ 8].[i %% 8]) => /=;rewrite /b2i /=. 
rewrite to_uintD_small /= of_uintK /= /b2i /= modz_small /= 1..3:/#.
rewrite /smod /= modz_small;smt().
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
(compress 5 (incoeff (to_sint p.[(8 * i + k) %/ 5])) %/ 2 ^ ((8 * i + k) %% 5) %% 2 <> 0).
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
  rewrite  /smod /= qE; have := H00 ((8 * i + k) %/ 5) _; by smt(W16.to_uint_cmp pow2_16).
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
decompress 5 (decode5 a).[i].
proof.
move => ib. 
rewrite -decompress_alt_decompress // /decompress_alt;congr.
rewrite /decode5 /= get_of_list // /decode (nth_map []);
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
(compress 11 (incoeff (to_sint p.[(8 * i + k) %/ 11])) %/ 2 ^ ((8 * i + k) %% 11) %% 2 <> 0).
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
  rewrite  /= /smod /= qE; have := H00 ((8 * i + k) %/ 11) _; by smt(W16.to_uint_cmp pow2_16).
  rewrite /truncateu64_11 of_uintK /=. 
  by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) /= /#.

rewrite -eq_incoeff.
rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))/= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).
qed.

lemma encode_vec_compress_bits (p : W16.t Array1024.t) (i : int) (k : int) :
     0 <= i < 1024*11 %/ 8 =>
     0 <= k < 8 =>
    (encode 11 (to_list (compress_polyvec 11 (lift_polyvec p)))).[i].[k] =
    ((compress 11 (incoeff (to_sint p.[(8 * i + k) %/ 11])) %/ 2^((8 * i + k) %% 11)) %% 2 <> 0).
move => Hi Hk.
rewrite /encode /BitsToBytes (nth_map []).
+ rewrite size_chunk // (EclibExtra.size_flatten' 11);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /= /#.
rewrite /W8.bits2w initiE 1:/# /=.
rewrite JWordList.nth_chunk 1,2:/#.
+ rewrite  (EclibExtra.size_flatten' 11);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /= /#.
rewrite nth_take 1,2:/# nth_drop 1,2:/#.
+ have -> := nth_flatten false 11; 1: by rewrite allP => ? /=;smt(mapP BS2Int.size_int2bs).
rewrite (nth_map witness); 1: by smt(Array1024.size_to_list).
rewrite get_to_list /= /compress_polyvec (nth_map 0) /=;1:smt(size_iota).
rewrite nth_iota 1:/# //= /lift_polyvec !mapiE 1:/# /=;congr;congr;congr;congr;congr;congr;congr.
rewrite /fromarray256 initiE 1:/# /=.
case (0 <= (8 * i + k) %/ 11 < 256) => ?;
  1: by rewrite getvE offunvE 1:/# /= /lift_array256 /subarray256 mapiE 1:/# /= initiE 1:/# /=.
case (256 <= (8 * i + k) %/ 11 < 512) => ?;
  1: by rewrite getvE offunvE 1:/# /= /lift_array256 /subarray256 mapiE 1:/# /= initiE 1:/# /=. 
case (512 <= (8 * i + k) %/ 11 < 768) => ?;
  by rewrite getvE offunvE 1:/# /= /lift_array256 /subarray256 mapiE 1:/# /= initiE 1:/# /=. 
qed.



(********** BEGIN BDEP PROOF OF CSUBQ **************)

lemma polyvec_csubq_avx2_ll :
   islossless Jkem_avx2.M.__polyvec_csubq.
by proc;inline *;do 5!(unroll for ^while);auto.
qed.

lemma poly_csubq_avx2_ll :
   islossless Jkem_avx2.M._poly_csubq.
by proc;inline *;unroll for ^while;auto.
qed.

op csubq_circuit(a : W16.t) : W16.t = 
   if (a \ult W16.of_int 3329) then  a
   else (W16_sub a (W16.of_int 3329)).

lemma poly_csubq_avx2_corr_h (_aw : W16.t Array256.t):
    hoare[ Jkem_avx2.M._poly_csubq  :
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
    phoare[ Jkem_avx2.M._poly_csubq  :
             rp = _aw /\
             pos_bound256_cxq rp 0 256 2 ==> 
             lift_array256 res = lift_array256 _aw /\
             pos_bound256_cxq res 0 256 1] = 1%r
  by conseq poly_csubq_avx2_ll (poly_csubq_avx2_corr_h _aw).


lemma polyvec_csubq_avx2_corr_h (_aw : W16.t Array1024.t):
    hoare[ Jkem_avx2.M.__polyvec_csubq  :
             r = _aw /\
             pos_bound1024_cxq r 0 1024 2 ==> 
             lift_array1024 res = lift_array1024 _aw /\
             pos_bound1024_cxq res 0 1024 1]. 
proof.
proc; inline *.
proc change ^while.1: {rp <- init_256_16 (fun i0 => r.[256*i+i0]);};1: by auto.
proc change ^while.2: {qx16 <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change ^while.^while.1: {r0 <- sliceget256_16_256 rp (i0*256);};1: by auto => /#.
proc change ^while.^while.9: {rp <- sliceset256_16_256 rp (i0*256) r0;};1: by auto => /#.
proc change ^while.6: {r <- init_1024_16 (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux.[i_0 - 256 * i] else r.[i_0]);};1: by auto. 

do 5!(unroll for ^while).
cfold ^i0<-.
wp -2.

conseq (: r = _aw /\ all (fun c => W16.zero \sle c && c \slt W16.of_int 6658) r ==>
       r = init_1024_16 (fun i => csubq_circuit _aw.[i])); last by circuit.

       
(* BDEP pre conseq *)
+ move => &hr />. rewrite /pos_bound1024_cxq /bpos16 qE /= => H.
  rewrite /(\slt) /(\sle) /= /smod /= allP /=.
  by exact H.

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= ->; rewrite /pos_bound256_cxq => Hb rr; rewrite /init_1024_16 /lift_array1024 /= => ->; split.

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


lemma polyvec_csubq_avx2_corr (_aw : W16.t Array1024.t):
    phoare[ Jkem_avx2.M.__polyvec_csubq  :
             r = _aw /\
             pos_bound1024_cxq r 0 1024 2 ==> 
             lift_array1024 res = lift_array1024 _aw /\
             pos_bound1024_cxq res 0 1024 1] = 1%r
  by conseq polyvec_csubq_avx2_ll (polyvec_csubq_avx2_corr_h _aw).



(********** END BDEP PROOF OF CSUBQ **************)


lemma polyvec_decompress_ll :
   islossless Jkem_avx2.M.__i_polyvec_decompress.
by proc;inline *;unroll for ^while; do 4!(cfold ^inc<-; unroll for ^while);auto.
qed.
(********** BEGIN BDEP PROOF OF DECOMPRESS **************)

lemma polyvec_decompress_corr_h (_aw : W8.t Array1408.t):
    hoare[ Jkem_avx2.M.__i_polyvec_decompress :
             Array1408.init (fun i => rp.[i]) = _aw ==> pos_bound1024_cxq res 0 1024 1 /\ lift_polyvec res = decompress_polyvec 11 (decode11_vec _aw)].
proc; inline *.
proc change 1: { q <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change 2: { shufbidx <- sliceget32_8_256 pvd_shufbidx_s 0;}; 1: by auto.
proc change 3: { srlvdidx <- sliceget8_32_256 pvd_srlvdidx_s 0;}; 1: by auto.
proc change 4: { srlvqidx <- sliceget4_64_256 pvd_srlvqidx_s 0;} ; 1: by auto.
proc change 5: { shift <- sliceget16_16_256 pvd_shift_s 0;}; 1: by auto.
proc change ^while.^while.1 : {f <- sliceget1568_8_256 rp ((352*k + 22*i)*8);}; 1: by auto => /> /#.
proc change ^while.^while.10 : {r <- sliceset1024_16_256 r ((16 * k + i)*256) f;}; 1: by auto => /> /#.
unroll for ^while.
cfold ^inc<-.
do 4!(unroll for ^while).
cfold ^i<-.
wp -3.

conseq (: rp = init_1568_8 (fun i => if i < 1408 then _aw.[i] else rp.[i])
        ==>
   r = init_1024_16 (fun i =>
     decompress11_circuit (W11.init (fun (j : int) => _aw.[(i*11 + j) %/ 8].[(i*11 + j) %% 8]))));last by circuit.
     
(* We start with some boilerplate *)
move => &hr /=;rewrite !tP  => H i ib.
by rewrite initE ib /=; case (i < 1408) => // ?; rewrite -H 1:/# initiE 1:/#.

move => &hr <- rr ->; split; last first.
+ rewrite eq_vectorP => k kb.
  rewrite tP => i ib.
  rewrite /lift_polyvec /init_1024_16 offunvE 1:/# /= !mapiE 1:/# /= -get_to_list /= initiE 1:/# /= initiE 1:/# /=.
  rewrite /decompress11_circuit decompress11_circuit_sem 1:/# /=.
  rewrite /decompress_polyvec /= !setvE /= offunvE 1:/# /=.
  case (3 = k) => ?; 1: 
   by rewrite mapiE 1:/# /= /subarray256 initiE 1:/# /= initiE 1:/# /= /decode11_vec get_of_list /#.
  rewrite offunvK /vclamp kb /=.
  case (2 = k) => ?; 1: 
   by rewrite mapiE 1:/# /= /subarray256 initiE 1:/# /= initiE 1:/# /= /decode11_vec get_of_list /#.
  rewrite offunvK /vclamp kb /=.
  case (1 = k) => ?; 1: 
   by rewrite mapiE 1:/# /= /subarray256 initiE 1:/# /= initiE 1:/# /= /decode11_vec get_of_list /#.
  rewrite offunvK /vclamp kb /=.
  by rewrite ifT 1:/# mapiE 1:/# /= /subarray256 initiE 1:/# /= initiE 1:/# /= /decode11_vec get_of_list /#.

  
rewrite /pos_bound1024_cxq qE /= => k kb. 
rewrite /init_1024_16 initiE 1:/# /=.
by apply decompress11_circuit_rng.
qed.


lemma polyvec_decompress_corr (_aw : W8.t Array1408.t):
    phoare[ Jkem_avx2.M.__i_polyvec_decompress :
             Array1408.init (fun i => rp.[i]) = _aw ==> pos_bound1024_cxq res 0 1024 1 /\ lift_polyvec res = decompress_polyvec 11 (decode11_vec _aw)] = 1%r
 by conseq polyvec_decompress_ll (polyvec_decompress_corr_h _aw).

(********** BEGIN BDEP PROOF OF COMPRESS  **************)

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


module AuxCompress11 = {
 proc __i_polyvec_compress(rp : W8.t Array1410.t, a : W16.t Array1024.t) : W8.t Array1410.t = {
    var inc : int;
    var v : W256.t;
    var v8 : W256.t;
    var off : W256.t;
    var shift1 : W256.t;
    var mask : W256.t;
    var shift2 : W256.t;
    var sllvdidx : W256.t;
    var srlvqidx : W256.t;
    var shufbidx : W256.t;
    var i : int;
    var f0 : W256.t;
    var f1 : W256.t;
    var f2 : W256.t;
    var t0 : W128.t;
    var t1 : W128.t;
    
    a <@ M.__polyvec_csubq(a);
    v <- get256 (WArray32.init16 (fun (i_0 : int) => jvx16.[i_0])) 0;
    v8 <- VPSLL_16u16 v (W128.of_int 3);
    off <- VPBROADCAST_16u16 pvc_off_s;
    shift1 <- VPBROADCAST_16u16 pvc_shift1_s;
    mask <- VPBROADCAST_16u16 pvc_mask_s;
    shift2 <- VPBROADCAST_4u64 pvc_shift2_s;
    sllvdidx <- VPBROADCAST_4u64 pvc_sllvdidx_s;
    srlvqidx <- get256 (WArray32.init64 (fun (i_0 : int) => pvc_srlvqidx.[i_0])) 0;
    shufbidx <- get256 (WArray32.init8 (fun (i_0 : int) => pvc_shufbidx_s.[i_0])) 0;
    inc <- 4 * 256 %/ 16;
    i <- 0;
    while (i < inc){
      f0 <- get256 (WArray2048.init16 (fun (i_0 : int) => a.[i_0])) i;
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
      f2 <- VPBROADCAST_8u32 keepodd11;
      f1 <- VPAND_256 f0 f2;
      f2 <- VPBROADCAST_8u32 keepeven11;
      f0 <- VPAND_256 f0 f2;
      f1 <- VPSRL_8u32 f1  (W128.of_int 5);
      f0 <- VPOR_256 f0 f1;
      f0 <- VPSLLV_8u32 f0 sllvdidx;
      f1 <- VPSRLDQ_256 f0 (W8.of_int 8);
      f0 <- VPSRLV_4u64 f0 srlvqidx;
      f1 <- VPSLL_4u64 f1 (W128.of_int 34);
      f0 <- f0 `|` f1;
      f0 <- VPSHUFB_256 f0 shufbidx;
      t0 <- truncateu128 f0;
      t1 <- VEXTRACTI128 f0 W8.one;
      t0 <- BLENDV_16u8 t0 t1 (truncateu128 shufbidx);
      rp <- Array1410.init (get8 (set128_direct (WArray1410.init8 (fun (i_0 : int) => rp.[i_0])) (22 * i) t0));
      rp <-
        Array1410.init
          (get8 (set64_direct (WArray1410.init8 (fun (i_0 : int) => rp.[i_0])) (22 * i + 16) (truncateu64 t1)));
      i <- i + 1;
    }
    
    return rp;
  }
}.

lemma auxcompress11_ll : islossless AuxCompress11.__i_polyvec_compress.
proc. cfold 11. unroll for ^while; wp => /=. 
inline *;unroll for ^while; do 4!(unroll for ^while);auto.
qed.




lemma auxcompress11_corr_h (_aw : W16.t Array1024.t):
    hoare[ AuxCompress11.__i_polyvec_compress  :
             a = _aw /\
             pos_bound1024_cxq a 0 1024 2 ==> 
      Array1408.init (fun i => res.[i])  = encode11_vec (compress_polyvec 11 (lift_polyvec _aw))].
proof.
proc; inline *.
proc change ^while.1: { rp0 <- init_256_16 (fun i => r.[256*i0+i]);};1: by auto.
proc change ^while.2: { qx16 <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change ^while.^while.1: { r0 <- sliceget256_16_256 rp0 (i1*256);};1: by auto => /#.
proc change ^while.^while.9: { rp0 <- sliceset256_16_256 rp0 (i1*256) r0;};1: by auto => /#.
proc change ^while.6: { r <- init_1024_16 (fun (i_0 : int) => if 256 * i0 <= i_0 < 256 * i0 + 256 then aux.[i_0 - 256 * i0] else r.[i_0]);};1: by auto. 
proc change 5: {v <- sliceget16_16_256 jvx16 0;}; 1: by auto.
proc change ^while{2}.1: {f0 <- sliceget1024_16_256 a (i*256);};1: by auto => /#.
proc change 12: { srlvqidx <- sliceget4_64_256 pvc_srlvqidx 0; }; 1: by auto.
proc change 13: { shufbidx <- sliceget32_8_256 pvc_shufbidx_s 0;}; 1: by auto.
proc change ^while{2}.27 : {rp <- sliceset1410_8_128 rp  (22*i*8) t0;};1: by auto => /#.
proc change ^while{2}.28 : {rp <- sliceset1410_8_64 rp  ((22*i+16)*8) (truncateu64 t1);}.
+ auto => />;move => *;rewrite /sliceset1410_8_64 tP => *.
  rewrite initiE /= 1:/# ifT 1:/# initiE 1:/#.
  do congr;smt().
  
unroll for ^while.
do 4!(unroll for ^while).
cfold ^inc<-.
unroll for ^while.
cfold ^i0<-. 
cfold ^i1<-. 
wp -4. 

conseq (: a = _aw /\
   Array1024.all (fun bv => W16.zero \sle bv /\ bv \sle (of_int (2 * 3329))) a
   ==> init_1408_8 (fun i => rp.[i]) = 
   let out = init_1024_11 (fun i => compress11_circuit _aw.[i]) in
   init_1408_8 (fun i =>
     W8.init (fun j =>
       (out.[(i*8+j) %/ 11]).[(i*8+j) %% 11]))); last by circuit.

      
(* BDEP pre conseq *)
+ move => &hr />; rewrite /pos_bound1024_cxq qE /= /(\sle) /(\slt) allP /=  => Hb i ib /=.
  rewrite /(to_sint W16.zero) /= /(W16.smod 0) /=.
  rewrite /(to_sint (W16.of_int 6658)) /= /(W16.smod 6658) /= /#.
  
(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= -> H0 rr; rewrite /= /init_1408_8 !tP => H i ib.
rewrite H // initiE 1:/# /=.
rewrite wordP => k kb; rewrite !initiE /= 1,2:/#.
rewrite encode_vec_compress_bits //=.
rewrite initiE 1:/# /=.
by apply compress11_circuit_sem.
qed.

(********** END BDEP PROOF OF COMPRESS **************)

lemma auxcompress11_corr (_aw : W16.t Array1024.t):
    phoare[ AuxCompress11.__i_polyvec_compress  :
             a = _aw /\
             pos_bound1024_cxq a 0 1024 2 ==> 
      Array1408.init (fun i => res.[i])  = encode11_vec (compress_polyvec 11 (lift_polyvec _aw))] = 1%r 
  by conseq auxcompress11_ll (auxcompress11_corr_h _aw).


lemma polyvec_compress_avx2_ll : islossless Jkem_avx2.M.__i_polyvec_compress.
proc. cfold 11. unroll for ^while; wp => /=. 
inline *;unroll for ^while; do 4!(unroll for ^while);auto.
qed.

lemma polyvec_compress_avx2_corr (_aw : W16.t Array1024.t):
    phoare[ Jkem_avx2.M.__i_polyvec_compress  :
             a = _aw /\
             pos_bound1024_cxq a 0 1024 2 ==> 
      Array1408.init (fun i => res.[i])  = encode11_vec (compress_polyvec 11 (lift_polyvec _aw))] = 1%r.
bypr => &m [->?].
have <- : Pr[ AuxCompress11.__i_polyvec_compress(rp{m}, _aw) @ &m :
   Array1408.init (fun (i : int) => res.[i]) = encode11_vec (compress_polyvec 11 (lift_polyvec _aw))] = 1%r
   by byphoare (auxcompress11_corr _aw)  =>/=;1:smt().
byequiv (: ={arg} /\ a{1} = _aw /\
             pos_bound1024_cxq a{1} 0 1024 2 ==> ={res}) => //.
proc. 
seq 1 1 : (={rp,a} /\ pos_bound1024_cxq a{1} 0 1024 1).
+ ecall {1} (polyvec_csubq_avx2_corr a{1}). 
  ecall {2} (polyvec_csubq_avx2_corr a{2}). 
  auto => />; rewrite /pos_bound1024_cxq /lift_array1024 /= qE /= => ? rr1.
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
have -> : 2047 = 2^11 -1 by auto.
rewrite and_mod 1:/# /= /smod /= /#.
qed.

lemma poly_decompress_ll : islossless Jkem_avx2.M._i_poly_decompress.
 proc; inline *;wp. cfold 5; unroll for ^while;auto. 
qed.

lemma poly_decompress_corr_h (_a : W8.t Array160.t): 
    hoare [Jkem_avx2.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 5 (decode5 _a) /\
             pos_bound256_cxq res 0 256 1 ].
proc; inline *.
proc change 1: { q <- sliceget16_16_256 jqx16 0;} ; 1: by auto.
proc change 2: { shufbidx <- sliceget32_8_256 pd_jshufbidx 0; }; 1: by auto.
proc change 3: { mask <- sliceget16_16_256 pd_mask_s 0;} ; 1: by auto.
proc change 4: { shift <- sliceget16_16_256 pd_shift_s 0; } ; 1: by auto.
proc change ^while.1 : { t <- zeroextu128 (sliceget160_8_64 a ((10*i)*8)); };1: by auto => /#.
proc change ^while.10 : { rp <- sliceset256_16_256 rp (i*256) f; };1: by auto => /#.
proc change ^while.2: { ti <- sliceget160_8_16 a ((10*i+8)*8); };1: by auto => /#.

cfold 5.
unroll for ^while.
cfold ^i<-.
wp -2.

conseq (: _ ==> rp = init_256_16 (fun i =>
     decompress5_circuit (W5.init (fun (j : int) => _a.[(i*5 + j) %/ 8].[(i*5 + j) %% 8])))); last  by circuit.

      
(* We start with some boilerplate *)
move => &hr [#]/= <- rr /= ->.

split.
+ rewrite tP => i ib.
  rewrite /init_256_16 !mapiE 1,2:/# /= -get_to_list /= initiE 1:/# /=.
  rewrite /decompress5_circuit decompress5_circuit_sem //.

rewrite /pos_bound256_cxq qE /= => k kb. 
rewrite /init_256_16 initiE 1:/# /=.
by apply decompress5_circuit_rng.
qed.

(********** END BDEP PROOF OF DECOMPRESS **************)

lemma poly_decompress_corr (_a : W8.t Array160.t): 
    phoare [Jkem_avx2.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 5 (decode5 _a) /\
             pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_decompress_ll (poly_decompress_corr_h _a).

lemma i_poly_compress_corr_ll : islossless Jkem_avx2.M._i_poly_compress.
proof.
proc; inline *.
cfold 13.
do 2!(unroll for ^while).
auto.
qed.

lemma i_poly_compress_corr_h _aw  : 
    hoare [Jkem_avx2.M._i_poly_compress  :
             pos_bound256_cxq a 0 256 2 /\
             a = _aw
              ==>
             res.`1 = encode5 (compress_poly 5 (lift_array256 _aw)) 
             ].
proof.
proc; inline *.
proc change 2: { qx16 <- sliceget16_16_256 jqx16 0;} ; 1: by auto.
proc change ^while.1: { r <- sliceget256_16_256 rp0 (i0*256);} ;1: by auto => /#.
proc change ^while.9: { rp0 <- sliceset256_16_256 rp0 (i0*256) r; } ;1: by auto => /#.
proc change 6: { v <- sliceget16_16_256 jvx16 0; }; 1: by auto.
proc change 12: { shufbidx <- sliceget32_8_256 pc_shufbidx_s 0; }; 1: by auto.
proc change ^while{2}.1: { f0 <- sliceget256_16_256 a (2*i*256);} ;1: by auto => /#.
proc change ^while{2}.2: { f1 <- sliceget256_16_256 a ((2*i+1)*256); };1: by auto => /#.
proc change ^while{2}.18 : { rp <- sliceset160_8_128 rp  (20*i*8) t0;};1: by auto => /#.
proc change ^while{2}.19 : { rp <- sliceset160_8_32 rp  ((20*i+16)*8) (truncateu32 t1);}.
+ by auto => /> &m; move: (truncateu32 t1{m}) => ? /#.

cfold 13.
do 2!(unroll for ^while).
cfold ^i0<-.
wp -3.

conseq (: a = _aw /\
   Array256.all (fun bv => W16.zero \sle bv /\ bv \slt (of_int (2 * 3329))) a
   ==> rp = init_160_8 (fun i =>
     W8.init (fun j =>
       (compress5_circuit _aw.[(i*8+j) %/ 5]).[(i*8+j) %% 5]))); last by circuit.
        
       
(* BDEP pre conseq *)
+ move => &hr />; rewrite /pos_bound256_cxq qE /= /(\sle) /(\slt) allP /=  => Hb i ib /=.
  rewrite /(to_sint W16.zero) /= /(W16.smod 0) /=.
  rewrite /(to_sint (W16.of_int 6658)) /= /(W16.smod 6658) /= /#.
  
(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= H0 <- rr ->; rewrite /= /init_128_8 tP => i ib.
rewrite wordP => k kb; rewrite !initiE 1..3:/# /=.
rewrite encode_compress_bits //=.
by apply compress5_circuit_sem.
qed.



(********** END BDEP PROOF OF COMPRESS **************)

lemma i_poly_compress_corr _aw  : 
    phoare [Jkem_avx2.M._i_poly_compress  :
             pos_bound256_cxq a 0 256 2 /\
             a = _aw
              ==>
             res.`1 = encode5 (compress_poly 5 (lift_array256 _aw)) 
             ] = 1%r
 by conseq i_poly_compress_corr_ll (i_poly_compress_corr_h _aw).

lemma polyvec_frombytes_ll : islossless Jkem_avx2.M.__i_polyvec_frombytes.
proc; inline *;wp. 
  while (0 <= i <= 4) (4-i); last by  auto =>  /> /#.
move => *. cfold 3. unroll for ^while;auto => /> /#.
qed.


op nttunpack_16 (rp : W16.t Array256.t) : W16.t Array256.t = init_256_16 (fun (i : int) => rp.[nttunpack_idx.[i]]).

op subarray256 (x: W16.t Array1024.t) (i: int) = init_256_16 (fun j => x.[256*i + j]).


op nttunpackv_16 (v : W16.t Array1024.t) : W16.t Array1024.t =
  init_1024_16
    (fun (i : int) =>
       if 0 <= i < 256 then (nttunpack_16 (subarray256 v 0)).[i]
       else
         if 256 <= i < 512 then (nttunpack_16 (subarray256 v 1)).[i - 256]
         else if 512 <= i < 768 then (nttunpack_16 (subarray256 v 2)).[i - 512] else (nttunpack_16 (subarray256 v 3)).[i - 768]). (* FIXME : 0 -> i - 768 *)

lemma nttunpackv_16E v: nttunpackv_16 v = nttunpackv v.
   rewrite /nttunpackv_16 /nttunpackv /nttunpack_16 /nttunpack.
   by rewrite /init_1024_16 /init_256_16.
   qed.

lemma polyvec_frombytes_corr_h (_aw : W8.t Array1536.t): 
    hoare [Jkem_avx2.M.__i_polyvec_frombytes  :
             a = _aw
              ==>
             lift_array1024 res = nttunpackv (map incoeff (decode12_vec _aw))  /\
             pos_bound1024_cxq res 0 1024  2].
proc; inline *.
proc change ^while.1: { rp <- init_256_16 (fun (i_0 : int) => r.[256 * i + i_0]); }; 1: by auto.
proc change ^while.2: { ap <- init_384_8 (fun (i_0 : int) => a.[384 * i + i_0]); }; 1: by auto.
proc change ^while.3: { mask <- sliceget16_16_256 maskx16 0; }; 1: by auto.
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
proc change ^while.7: { r <- init_1024_16 (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux.[i_0 - 256 * i] else r.[i_0]);}; 1: by auto.

unroll for ^while.
do 4!(unroll for ^while).
cfold ^i0<-.
wp -2.

conseq (: _ ==> r = nttunpackv_16 (init_1024_16 (fun i =>
     frombytes_circuit (
       W12.init (fun j =>
         let idx = i*12 + j in
         let aidx = idx %/ 8 in
         let bidx = idx %% 8 in
         _aw.[aidx].[bidx]
       )
     )))); last by circuit. (* FIXME: TAKES TOO LONG circuit. *)

move => &hr <- rr ->.
rewrite nttunpackv_16E;split.
+ rewrite  -nttunpackv_lift /lift_array1024 /=; congr; apply Array1024.tP => i ib.
  rewrite !mapiE 1,2:/# /= initiE 1:/# /= -frombytes_circuit_sem /#.

rewrite /pos_bound1024_cxq.
move => k kb.
have : Array1024.all (fun w => bpos16 w (2*q))
    (nttunpackv
       (init_1024_16
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

lemma polyvec_frombytes_corr (_aw : W8.t Array1536.t): 
    phoare [Jkem_avx2.M.__i_polyvec_frombytes  :
             a = _aw
              ==>
             lift_array1024 res = nttunpackv (map incoeff (decode12_vec _aw))  /\
             pos_bound1024_cxq res 0 1024  2] = 1%r
  by conseq polyvec_frombytes_ll (polyvec_frombytes_corr_h _aw).

lemma to_sintInj : injective W16.to_sint. 
rewrite /injective /to_sint /smod /=. 
move => x y. move => HHH. have : to_uint x = to_uint y; last by smt(W16.to_uint_eq).
move : HHH; move : (W16.to_uint_cmp x); move :  (W16.to_uint_cmp y) => /=; smt().
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

(********** BEGIN BDEP PROOF OF FROMMSG **************)

op pcond_true (w: bool) =  true.

lemma poly_frommsg_ll : islossless Jkem_avx2.M._i_poly_frommsg
 by proc; inline *;wp;while (0 <= i <= 32) (32-i);  by  auto =>  /> /#.

lemma poly_frommsg_corr_h (_m : W8.t Array32.t): 
    hoare [Jkem_avx2.M._i_poly_frommsg :
             ap =  _m 
              ==>
             lift_array256 res = decompress_poly 1 (decode1 _m) /\
             pos_bound256_cxq res 0 256 1 ].
proc; inline *.
proc change 1: { hqs <- sliceget16_16_256 hqx16_p1 0;};1: by auto.
proc change 2: { shift <- VPBROADCAST_2u128 (sliceget4_32_128 pfm_shift_s 0);};1: by auto.
proc change 3: { idx <- VPBROADCAST_2u128 (sliceget16_8_128 pfm_idx_s 0);};1: by auto.
proc change 4: {f <- sliceget32_8_256 ap 0;};1: by auto.
proc change ^while.23 : {rp <- sliceset256_16_256 rp (2*i*256) g0;}; 1: by auto => /#. 
proc change ^while.24 : {rp <- sliceset256_16_256 rp ((2*i+1)*256) g1;}; 1: by auto => /#. 
proc change ^while.25 : {rp <- sliceset256_16_256 rp ((2*i+8)*256) g2;}; 1: by auto => /#. 
proc change ^while.26 : {rp <- sliceset256_16_256 rp ((2*i+9)*256) g3;}; 1: by auto => /#. 


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
    phoare [Jkem_avx2.M._i_poly_frommsg :
             ap =  _m 
              ==>
             lift_array256 res = decompress_poly 1 (decode1 _m) /\
             pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_frommsg_ll (poly_frommsg_corr_h _m).

lemma compress_poly_rng i xs :
  1 <= i < 12 =>
  all (fun (x : int) => 0 <= x < 2^i) (compress_poly i xs).
rewrite /compress_poly /map allP => Hi j Hj. rewrite !initiE //=. rewrite compress_rng //. qed.


lemma poly_tomsg_ll : islossless Jkem_avx2.M._i_poly_tomsg.
proc.
cfold 7.
inline *.
do 2!(unroll for ^while).
auto.
qed.

(********** BEGIN BDEP PROOF OF TOMSG **************)


op pcond_reduced (w: W16.t) =   w \ult W16.of_int (2*3329).

lemma poly_tomsg_corr_h _aw : 
    hoare [Jkem_avx2.M._i_poly_tomsg :
             pos_bound256_cxq a 0 256 2 /\ 
              a = _aw
              ==>
             res.`1 = encode1 (compress_poly 1 (lift_array256 _aw))  ].
proof.
proc; inline *.
proc change 3 : { qx16 <- sliceget16_16_256 jqx16 0;};1: by auto.
proc change ^while.1: {r <- sliceget256_16_256 rp0 (i0*256);};1: by auto => /#.
proc change ^while.9: { rp0 <- sliceset256_16_256 rp0 (i0*256) r;};1: by auto => /#.
proc change 8: {hq <- sliceget16_16_256 px16 0;}; 1: by auto.
proc change 10: {hhq <- sliceget16_16_256 px16 0;}; 1: by auto.
proc change ^while{2}.1: {f0 <- sliceget256_16_256 a (2*i*256);};1: by auto => /#.
proc change ^while{2}.2: {f1 <- sliceget256_16_256 a ((2*i+1)*256);};1: by auto => /#.
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
    phoare [Jkem_avx2.M._i_poly_tomsg :
             pos_bound256_cxq a 0 256 2 /\ 
              a = _aw
              ==>
             res.`1 = encode1 (compress_poly 1 (lift_array256 _aw))  ] = 1%r
  by conseq poly_tomsg_ll (poly_tomsg_corr_h _aw).

lemma polyvec_tobytes_ll : islossless Jkem_avx2.M.__i_polyvec_tobytes.
proc.
inline *. 
do 9!(unroll for ^while); auto. 
qed.


abbrev mask12 = VPBROADCAST_16u16(W16.of_int 4095).

module AuxToBytes = {
proc __i_polyvec_tobytes(r : W8.t Array1536.t, a : W16.t Array1024.t) : W8.t Array1536.t = {
  var i,rp,a0,i0,t0,t1,t2,t3,t4,t5,t6,t7,tt,ttt,a1,b,t00,r00,t10,r1,a2,b0,t01,r01,t11,r10,a3,b1,t02,r02,t12,r11,a4,b2,t03,t13,a5,b3,t04,t14,a6,b4,t05,t15,a7,b5,r03,r12,a8,b6,r04,r13,a9,b7,r05,r14,a10,b8,r06,r15,a11,b9,r07,r16,a12,b10,r08,r17,aux,aux_0;
  i <- 0;                                                                                                                       
  while (i < 4) {                                                                                                              
    rp <- Array384.init (fun (i_0 : int) => r.[384 * i + i_0]);                                                                 
    a0 <- Array256.init (fun (i_0 : int) => a.[256 * i + i_0]);  
    a0 <@ Jkem_avx2.M._poly_csubq(a0);                                                           
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
    a <- Array1024.init (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux_0.[i_0 - 256 * i] else a.[i_0]);         
    i <- i + 1;                                                                                                                 
  }
  return r;
 }       
}.

op nttpack_16 (rp : W16.t Array256.t)  = init_256_16 (fun (i : int) => rp.[nttpack_idx.[i]]).

op nttpackv_16 (v : W16.t Array1024.t) =
  init_1024_16
    (fun (i : int) =>
       if 0 <= i < 256 then (nttpack_16 (subarray256 v 0)).[i]
       else
         if 256 <= i < 512 then (nttpack_16 (subarray256 v 1)).[i - 256]
         else if 512 <= i < 768 then (nttpack_16 (subarray256 v 2)).[i - 512] else (nttpack_16 (subarray256 v 3)).[i - 768]).

lemma nttpackv_16E v : nttpackv_16 v = nttpackv v.
rewrite /nttpackv_16 /init_1024_16 /nttpack_16 /init_256_16.
by rewrite /nttpackv /nttpack.
qed.

lemma auxtobytes_corr_h (_aw : W16.t Array1024.t):
    hoare[AuxToBytes.__i_polyvec_tobytes :
             pos_bound1024_cxq a 0 1024 2 /\ a = _aw ==> 
    res = encode12_vec (map asint (lift_array1024 (nttpackv _aw)))]. 
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
proc change ^while.11: { r <- init_1536_8 (fun (i_0 : int) => if 384 * i <= i_0 < 384 * i + 384 then aux.[i_0 - 384 * i] else r.[i_0]);}; 1: by auto.
proc change ^while.12: { a <- init_1024_16  (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux_0.[i_0 - 256 * i] else a.[i_0]);};1: by auto. 

unroll for ^while.
do 8!(unroll for ^while).
cfold ^i<-.
cfold ^i0<-.
cfold ^i1<-.
wp -4.

conseq (: 
 a = _aw /\
   Array1024.all (fun bv => W16.zero \sle bv /\ bv \slt (of_int (2 * 3329))) a
   ==> r =  let ret = init_1024_12 (fun j => tobytes_circuit (nttpackv_16 _aw).[j]) in
  init_1536_8 (fun i =>
    W8.init (fun j =>
      let idx = i*8 + j in
      let aidx = idx %/ 12 in
      let bidx = idx %% 12 in
      W12."_.[_]" (ret.[aidx]) bidx))); last by circuit.
      
+ move => &hr />; rewrite allP /= /pos_bound1024_cxq /(\sle) /(\slt) /= /qE /smod /=.
  by rewrite qE /= => H k ?; move : (H k _) => //=.

move => &hr [#]/=; rewrite /pos_bound1024_cxq /bpos16 => H0 <- rr ->.
rewrite /init_1536_8 /encode12 tP => i ib.
rewrite initiE 1:/# /= get_of_list 1:/# /= wordP => k kb.
rewrite initiE //= /init_256_12 initiE 1:/# /=.
have := nttpackv_pred a{hr} (fun c => bpos16 c (2 * q)).
rewrite !allP  /= iffE qE /= => [#_ H].
by rewrite nttpackv_16E  to_bytes_circuit_sem_polyvec;1..3:
 by rewrite /(\ult) /=; smt(W16.to_sint_unsigned).
 qed.

lemma auxtobytes_ll : islossless AuxToBytes.__i_polyvec_tobytes.
proc.
inline *. 
do 9!(unroll for ^while); auto. 
qed.

lemma auxtobytes_corr (_aw : W16.t Array1024.t):
    phoare[ AuxToBytes.__i_polyvec_tobytes :
             pos_bound1024_cxq a 0 1024 2 /\ a = _aw ==> 
    res = encode12_vec (map asint (lift_array1024 (nttpackv _aw)))] = 1%r
  by conseq auxtobytes_ll (auxtobytes_corr_h _aw).


lemma polyvec_tobytes_corr (_aw : W16.t Array1024.t):
    phoare[ Jkem_avx2.M.__i_polyvec_tobytes :
             pos_bound1024_cxq a 0 1024 2 /\ a = _aw ==> 
    res = encode12_vec (map asint (lift_array1024 (nttpackv _aw)))] = 1%r.
proof.
bypr => &m [??].
have <- : Pr[AuxToBytes.__i_polyvec_tobytes(r{m}, _aw) @ &m : res = encode12_vec (map asint (lift_array1024 (nttpackv _aw)))] = 1%r
 by byphoare (auxtobytes_corr _aw)  =>/=; 1:smt().
byequiv (: ={arg} /\ a{1} = _aw /\
             pos_bound1024_cxq a{1} 0 1024 2 ==> ={res}) => //.
proc => /=. 
inline M._i_poly_tobytes.
while (={r, a,i} /\ 0 <= i{1} <= 4 /\
   pos_bound1024_cxq a{1} 0 1024 2); last by auto => /> /#.
seq 3 3 : (#pre /\ ={rp,a0} /\
   pos_bound256_cxq a0{1} 0 256 1).
+ ecall {1} (poly_csubq_avx2_corr a0{1}).
  ecall {2} (poly_csubq_avx2_corr a0{2}).
  auto => /> &1; rewrite /pos_bound1024_cxq /pos_bound256_cxq /lift_array256 /= qE /= => ????;split; 1: by smt(Array256.initiE).
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
  rewrite /pos_bound1024_cxq => k kb; rewrite initiE 1:/# /= /#.

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


lemma signed_bound1024_cxq_small r (i j:int) :
  i <= j => signed_bound1024_cxq r 0 1024 i => signed_bound1024_cxq r 0 1024 j.
rewrite /signed_bound1024_cxq => />Hij H k Hk1 Hk2. move :(H k). rewrite Hk1 Hk2 => />. smt(). qed.

lemma eq_vectorP4 :
      forall (v1 v2 : PolyVec.polyvec),
        (v1 = v2) <=> ((KMatrix.Vector."_.[_]" v1 0 = KMatrix.Vector."_.[_]" v2 0) /\ (KMatrix.Vector."_.[_]" v1 1 = KMatrix.Vector."_.[_]" v2 1) /\ (KMatrix.Vector."_.[_]" v1 2 = KMatrix.Vector."_.[_]" v2 2) /\ (KMatrix.Vector."_.[_]" v1 3 = KMatrix.Vector."_.[_]" v2 3)).
smt(KMatrix.Vector.eq_vectorP). qed.
