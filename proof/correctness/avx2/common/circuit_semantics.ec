require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array256 Array128 Array64 Array32 Array16 Array8 Array4 Array2.
from JazzEC require import Array768 Array960 Array1152 Array1024 Array1408 Array1536 Array160.

require import AVX2_Ops W16extra.
require import Fq MLKEMFCLib.
require import Mlkem_bindings BitEncoding.
import BitChunking BS2Int.
import Fq.

from Spec require import GFq Rq Serialization Sampling EncDecCorrectness Correctness.
import GFq Rq Serialization.
import Zq ZModP.


lemma compress_rng a d :
   1 <= d < 12 =>
   0 <= Compress d a < 2^d.
move => drng; rewrite /Compress.
by apply modz_cmp; apply gt0_pow2.
qed.

lemma encode_compress_bits (p : W16.t Array256.t) (d : int) (i : int) (k : int) :
     0 <= d <= 12 =>
     0 <= i < 256*d %/ 8 =>
     0 <= k < 8 =>
       (ByteEncode d (to_list (compress_poly d (lift_array256 p)))).[i].[k] =
        ((Compress d (incoeff (to_sint p.[(8 * i + k) %/ d])) %/ 2^((8 * i + k) %% d)) %% 2 <> 0).
proof.
move => Hd Hi Hk.
rewrite /ByteEncode /BitsToBytes (nth_map []).
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
(ByteEncode 12 (to_list (map asint (lift_array256 p)))).[i].[k].
proof.
rewrite /(\ult) /=  => bd Hi Hk.
rewrite /ByteEncode /BitsToBytes (nth_map []).
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
  (Compress 1 (incoeff (to_sint p.[8 * i + k])) %/ 2 ^ ((8 * i + k) %% 1) %% 2 <> 0).
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
  move => Hb; have E: to_sint (W16.of_int 3329) = 3329 by rewrite /to_sint /smod /=.
  by rewrite E; smt(W16.to_uint_cmp pow2_16 W16.to_sintE).
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
        Decompress 1 (decode1 a).[i].
proof.
move => ib.
rewrite -decompress_alt_decompress // /decompress_alt;congr.
rewrite /decode1 /= get_of_list // /ByteDecode (nth_map []);
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

op csubq_circuit(a : W16.t) : W16.t = 
   if (a \ult W16.of_int 3329) then  a
   else (W16_sub a (W16.of_int 3329)).

lemma to_sintInj : injective W16.to_sint. 
rewrite /injective /to_sint /smod /=. 
move => x y. move => HHH. have : to_uint x = to_uint y; last by smt(W16.to_uint_eq).
move : HHH; move : (W16.to_uint_cmp x); move :  (W16.to_uint_cmp y) => /=; smt().
qed.

lemma compress_poly_rng i xs :
  1 <= i < 12 =>
  all (fun (x : int) => 0 <= x < 2^i) (compress_poly i xs).
rewrite /compress_poly /map allP => Hi j Hj. rewrite !initiE //=. rewrite compress_rng //. qed.

