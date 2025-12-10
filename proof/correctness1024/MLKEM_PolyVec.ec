require import AllCore List IntDiv CoreMap.

from Jasmin require import JModel JMemory.
from JazzEC require import Array1152 Array1408 Array1536 Array1568 Array256 Array384 Array128 Array1024 Array5.
from CryptoSpecs require import GFq Rq Serialization VecMat MLKEM1024 Correctness1024.
require import W16extra.
require import Fq MLKEM_Poly NTT_Fq NTTAlgebra MLKEMFCLib.


from JazzEC require import Jkem1024.

theory MLKEM_PolyVec.

import NTT_Fq.
import GFq.
import Zq.
import MLKEM_Poly.
import KMatrix.
import Serialization1024.
import VecMat1024.
import PolyVec.
import PolyMat.

lemma land_foo  p q: p && q <=> p /\ q by smt().

op lift_polyvec(vec: W16.t Array1024.t) : polyvec =
    Vector.offunv (fun i => lift_array256 (subarray256 vec i)).


op scale_polyvec(v : polyvec, c : coeff) : polyvec = 
   Vector.offunv (fun i => (scale ((Vector.tofunv v) i) c)).

lemma liftarrayvector a i k : 0<=i<4 => 0<=k<256 =>
         ((lift_polyvec a).[i])%Vector.[k] = (lift_array1024 a).[256*i+k].
move => ib lb; rewrite /lift_vector /lift_array1024 offunvE // mapiE 1:/# /=.
by rewrite /lift_array256 /subarray256 mapiE //= initiE //=.
qed.


op unlift_polyvec(a : polyvec) = 
   Array1024.init (fun i => W16.of_int (as_sint (a.[i %/ 256])%Vector.[i%%256])).

lemma vector_unlift a : 
    lift_polyvec (unlift_polyvec a) = a /\
    signed_bound1024_cxq (unlift_polyvec a) 0 1024 1.
proof.
split. 
+ rewrite /lift_vector /unlift_polyvec eq_vectorP => i ib.
  rewrite offunvE //= /subarray256 /lift_array256 /= tP => k kb.
  rewrite mapiE //= initiE //= initiE //= 1:/# /to_sint /smod /=.
  rewrite !of_uintK /=; rewrite /as_sint qE /=.
  by smt(rg_asint asintK).

rewrite /unlift_vector /signed_bound1024_cxq => k kb; rewrite initiE //=.
rewrite /to_sint /smod /= !of_uintK /= /as_sint qE /=.
by smt(rg_asint).
qed.


lemma polyvec_csubq_corr_h ap :
      hoare[Jkem1024.M.__polyvec_csubq :
           ap = lift_array1024 r /\ pos_bound1024_cxq r 0 1024 2 
           ==>
           ap = lift_array1024 res /\ pos_bound1024_cxq res 0 1024 1 ] . 
proof.
proc.
unroll for 2.
wp;ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[(3 * 256) + i])))).
wp;ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[i])))).


skip; move => &hr [#].
rewrite /lift_array256 /pos_bound256_cxq /lift_array1024 /pos_bound1024_cxq /=.

move => -> bnd /=;split; 1: by move => *; rewrite initiE /#.

move => bnd1 result [#] rval rbnd; rewrite tP in rval.
split; 1: by move => *; rewrite !initiE //= !Array1024.initiE /= /#.

move => bnd2 resul2 [#] rva2 rbnd2; rewrite tP in rva2.
rewrite !land_foo.
split;1:by   move => *; do 3!(rewrite initiE /= 1:/#)  => /#.

move => resul3 [#]  rva3 rbnd3; rewrite tP in rva3.
rewrite !land_foo.
split;1:by   move => *; do 4!(rewrite initiE /= 1:/#)  => /#.

move => resul4 [#]  rva4 rbnd4; rewrite tP in rva4.

split. 

+ rewrite tP => k kb; rewrite !mapiE 1,2:/# /=;  do 3!(rewrite initiE /= 1:/#).

case (768 <= k && k < 1024).
+ move => kb0 /=;move : (rva4 (k - 768) _); 1: smt().
  by rewrite !mapiE 1,2:/# //= !initiE 1:/# //= !initiE 1:/# //= !initiE //= !initiE //= /#. 

case (512 <= k && k < 768).
+ move => kb0 /=;move : (rva3 (k - 512) _); 1: smt().
  by rewrite !mapiE 1,2:/# //= !initiE 1:/# //= !initiE //= !initiE //= /#. 

move => case1;case (256 <= k && k < 512).
+ move => kb0 /=;move : (rva2 (k - 256) _); 1: smt().
  by rewrite !mapiE 1,2:/# //= !initiE 1:/# //= !initiE //= /#.  

move => *;have : (0 <= k && k < 256); 1:smt().
move => kb0 /=;move : (rval (k) kb0).
  by rewrite !mapiE 1,2:/# //= !initiE /#.

by smt(Array1024.initiE).
qed. 

lemma polyvec_csubq_ll : islossless Jkem1024.M.__polyvec_csubq 
  by proc; unroll for 2;do 4! (wp;call poly_csubq_ll).

lemma polyvec_csubq_corr ap :
      phoare[Jkem1024.M.__polyvec_csubq :
           ap = lift_array1024 r /\ pos_bound1024_cxq r 0 1024 2 
           ==>
           ap = lift_array1024 res /\ pos_bound1024_cxq res 0 1024 1 ] = 1%r
  by conseq polyvec_csubq_ll (polyvec_csubq_corr_h ap). 

lemma truncation1 x :
truncateu8 (truncateu16 (x `&` W64.of_int 1023) `&` W16.of_int 255) = 
W8.of_int (to_uint x %% 1024).
proof. rewrite /truncateu8; 
have -> : 255 = 2^8-1 by auto.
have -> : 1023 = 2^10-1 by auto.
rewrite !and_mod //=.
rewrite to_uint_truncateu16 /= !of_uintK /=.
rewrite (modz_small _ 18446744073709551616); 1: smt().
rewrite !(modz_small _ 65536); 1..3: smt().
by apply W8.to_uint_eq; rewrite !of_uintK /= /#.
qed.

lemma truncation2 x y d:
2 <= d <= 6 =>
truncateu8
  ((truncateu16 (y `&` (of_int 1023)%W64) `<<` (of_int d)%W8) `|`
   (truncateu16 (x `&` (of_int 1023)%W64) `>>` (of_int (10-d))%W8)) =
(of_int (to_uint x %% 1024 %/ 2^(10-d) + to_uint y %% 1024 * 2^d))%W8.
move => db;rewrite /truncateu8 /=; congr.

have /= ? : 2^2 <= 2^d <= 2^6 /\ 2^ 4 <= 2^(10 - d) by
  do split; [ move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 2 d) => // /# |
              move : (StdOrder.IntOrder.ler_weexpn2l 2 _ d 6) => // /# |
              move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 4 (10 - d)) => // /#].

rewrite orw_disjoint. 
+ rewrite /W16.(`&`); apply W16.ext_eq => k kb.
  rewrite !map2iE // zerowE.
  rewrite /truncateu16 (_:1023 = 2^10-1) // !W64.and_mod //= /(`<<`) /(`>>`) /= kb /=.
  rewrite !(modz_small _ 256) 1,2:/#.
  case (!(d <= k < 6+d)); first by smt(W16.get_out).
  move => *; rewrite !get_to_uint.  
  rewrite !of_uintK /= !(modz_small _ 18446744073709551616) 1,2:/# !(modz_small _ 65536) 1,2:/# /=.
  by rewrite (_: 1024 = 2^10); move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 10 (k+10-d)) => // /#.
  
have -> : 1023 = 2^10-1 by auto;rewrite !and_mod //.
rewrite /truncateu16 !W64.and_mod //= /(`<<`) /(`>>`) /=. 
  rewrite to_uintD_small.
+ rewrite !(modz_small _ 256) 1,2:/#.
  rewrite !of_uintK /= !(modz_small _ 18446744073709551616) 1,2:/#.
  rewrite W16.to_uint_shr 1:/# W16.to_uint_shl 1:/# /=.
  by rewrite !of_uintK /=  !(modz_small _ 65536) /#.
rewrite shlMP /= 1:/# shrDP /= 1:/# !of_uintK /=. 
rewrite !(modz_small _ 18446744073709551616) 1,2:/# .
rewrite !(modz_small _ 256) 1,2:/#.
by rewrite !(modz_small _ 65536) /#.
qed.

lemma truncation3 x :
truncateu8 (x `&` (of_int 1023)%W64 `>>` (of_int 2)%W8) = (of_int (to_uint x %% 1024 %/ 4))%W8.
proof.
have -> : 1023 = 2^10-1 by auto.
rewrite !and_mod //=.
rewrite /(`>>`) shrDP /= 1:/#. 
rewrite /truncateu8 /= !of_uintK /=.
by rewrite !(modz_small _ 18446744073709551616); 1..3: smt().
qed.

lemma i_poly_compress_ll : islossless Jkem1024.M._i_poly_compress.
proc.
while (0 <=  i <= 280) (280-i); last 
   by wp; call (poly_csubq_ll); auto =>  /> /#. 
by move => *; unroll for ^while;auto => /#.
qed.


(********** BEGIN BDEP PROOF OF COMPRESS  **************)
require import Bindings.

lemma i_polyvec_compress_ll : islossless Jkem1024.M.__i_polyvec_compress.
proc.
wp;while (0 <=  i <= 1040) (1040-i); last 
   by wp; call (polyvec_csubq_ll); auto =>  /> /#. 
by move => *;unroll for ^while;auto => /> /#.
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
+ rewrite -Fq.compress_impl_large //=; 1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).  
  congr;congr;congr;congr;congr;congr; 2: by smt().
  rewrite /truncateu64_11 of_uintK /=. 
  by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) /= /#.

  
have -> : (incoeff (to_sint p.[(8 * i + k) %/ 11])) = (incoeff (to_sint (W16_sub p.[(8 * i + k) %/ 11] (W16.of_int 3329)))); last first.
+ rewrite -Fq.compress_impl_large //=.
  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota).
  rewrite of_sintK /= /smod /= qE; have := H00 ((8 * i + k) %/ 11) _; by smt(W16.to_uint_cmp pow2_16).
  rewrite /truncateu64_11 of_uintK /=. 
  by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) /= /#.

rewrite -eq_incoeff.
rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).
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

lemma i_polyvec_compress_corr_h _aw  : 
    hoare [Jkem1024.M.__i_polyvec_compress  :
             pos_bound1024_cxq a 0 1024 2 /\
             a = _aw
              ==>
             res = encode11_vec (compress_polyvec 11 (lift_polyvec _aw)) 
             ].
proof.
proc; inline *.
proc change ^while.1: { rp0 <- init_256_16 (fun i => r.[256*i0+i]);};1: by auto.
proc change ^while.^while.2: { t0 <- W16_sub t0 (W16.of_int 3329);}; 1: by auto.
proc change ^while.^while.4 : {b0 <- sra_16 b0 (W16.of_int 15);}; 1: by auto.
proc change ^while.5: {r <- init_1024_16 (fun (i_0 : int) => if 256 * i0 <= i_0 < 256 * i0 + 256 then aux.[i_0 - 256 * i0] else r.[i_0]);};1: by auto.
proc change ^while{2}.^while.2: {d0 <- sll_64 d0 (W64.of_int 11);}; 1: by auto.
proc change ^while{2}.^while.5: {d0 <- srl_64 d0 (W64.of_int 31);}; 1: by auto.
proc change ^while{2}.7:   { b <- srl_16 b (W16.of_int 8);}; 1: by auto.
proc change ^while{2}.9:   { c <- sll_16 c (W16.of_int 3);}; 1: by auto.
proc change ^while{2}.14:  { b <- srl_16 b (W16.of_int 5);}; 1: by auto.
proc change ^while{2}.16:  { c <- sll_16 c (W16.of_int 6);}; 1: by auto.
proc change ^while{2}.21:  { b <- srl_16 b (W16.of_int 2);}; 1: by auto.
proc change ^while{2}.25:  { b <- srl_16 b (W16.of_int 10);}; 1: by auto.
proc change ^while{2}.27:  { c <- sll_16 c (W16.of_int 1);}; 1: by auto.
proc change ^while{2}.32:  { b <- srl_16 b (W16.of_int 7);}; 1: by auto.
proc change ^while{2}.34:  { c <- sll_16 c (W16.of_int 4);}; 1: by auto.
proc change ^while{2}.39:  { b <- srl_16 b (W16.of_int 4);}; 1: by auto.
proc change ^while{2}.41:  { c <- sll_16 c (W16.of_int 7);}; 1: by auto.
proc change ^while{2}.46:  { b <- srl_16 b (W16.of_int 1);}; 1: by auto.
proc change ^while{2}.50:  { b <- srl_16 b (W16.of_int 9);}; 1: by auto.
proc change ^while{2}.52:  { c <- sll_16 c (W16.of_int 2);}; 1: by auto.
proc change ^while{2}.57:  { b <- srl_16 b (W16.of_int 6);}; 1: by auto.
proc change ^while{2}.59:  { c <- sll_16 c (W16.of_int 5);}; 1: by auto.
proc change ^while{2}.63:  { t <- t.[7<-srl_16 t.[7] (W16.of_int 3)];}; 1: by auto.

swap 3 5.
unroll for ^while.
do 133!(unroll for ^while).
cfold ^j<-.
cfold ^i<-.
cfold ^k<-.
cfold ^i1<-.
cfold ^i0<-.
wp -5.

conseq (: a = _aw /\
   Array1024.all (fun bv => W16.zero \sle bv /\ bv \slt (of_int (2 * 3329))) a
   ==> rp = let cc = init_1024_11 (fun i => compress11_circuit _aw.[i]) in
   init_1408_8 (fun i =>
     W8.init (fun j =>
       (cc.[(i*8+j) %/ 11]).[(i*8+j) %% 11]))); last by circuit.
        
       
(* BDEP pre conseq *)
+ move => &hr />; rewrite /pos_bound1024_cxq qE /= /(\sle) /(\slt) allP /=  => Hb i ib /=.
  rewrite /(to_sint W16.zero) /= /(W16.smod 0) /=.
  rewrite /(to_sint (W16.of_int 6658)) /= /(W16.smod 6658) /= /#.
  
(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= H0 <- rr ->; rewrite /= /init_1408_8 tP => i ib.
rewrite wordP => k kb; rewrite !initiE 1..3:/# /= initiE 1:/# /=.
rewrite encode_vec_compress_bits //=.
by apply compress11_circuit_sem.
qed.


(********** END BDEP PROOF OF COMPRESS **************)


lemma i_polyvec_compress_corr _aw :
    phoare [Jkem1024.M.__i_polyvec_compress  :
pos_bound1024_cxq a 0 1024 2 /\
             a = _aw
              ==>
             res = encode11_vec (compress_polyvec 11 (lift_polyvec _aw)) 
              ] = 1%r
  by conseq i_polyvec_compress_ll (i_polyvec_compress_corr_h _aw).

lemma polyvec_add_corr_h _a _b ab bb :
      0 <= ab <= 6 => 0 <= bb <= 3 =>
      hoare[Jkem1024.M.__polyvec_add2 :
           _a = lift_array1024 r /\
           _b = lift_array1024 b /\
           signed_bound1024_cxq r 0 1024 ab /\
           signed_bound1024_cxq b 0 1024 bb 
           ==>
           signed_bound1024_cxq res 0 1024 (ab + bb) /\ 
           forall k, 0 <= k < 1024 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]]. 
proof.
move => abb bbb;  move : (poly_add_corr_impl_h ab bb abb bbb) => H.
proc.
unroll for 2.
wp;ecall (H (lift_array256 (Array256.init (fun i => r.[(3 * 256) + i]))) (lift_array256 (Array256.init (fun i => b.[(3 * 256) + i])))).
wp;ecall (H (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i]))) (lift_array256 (Array256.init (fun i => b.[(2 * 256) + i])))).
wp;ecall (H (lift_array256 (Array256.init (fun i => r.[256 + i]))) (lift_array256 (Array256.init (fun i => b.[256 + i])))).
wp;ecall (H (lift_array256 (Array256.init (fun i => r.[i]))) (lift_array256 (Array256.init (fun i => b.[i])))).
clear H.
skip => &hr.
rewrite /signed_bound1024_cxq /signed_bound_cxq /lift_array1024 /lift_array256 /=.
move => [#] ->-> 2?.
do split; 1..2: by move => *; rewrite !initiE //= /#.
move => [#] H H0 ?? res1 [#] resb1 resv1.
do split.
+ by move => k kb; move : (resb1 k kb); rewrite !initiE  //= !Array1024.initiE  /#.
+ by move => k kb; move : (resb1 k kb); rewrite !initiE  //= /#.

move => [#]  vsofar bsofar ?? res2 [#] res2b res2v.
rewrite !land_foo.
do split.
+ move => k kb; rewrite !initiE  /=1:/# !Array1024.initiE  /= 1:/#.
  rewrite  (_: (256 <= 512 + k && 512 + k < 512)=false) /= 1:/#.
  by rewrite !Array1024.initiE  /= /#.
+ by move => k kb;rewrite !initiE  /= /#.

move => [#]  res3 [#] res3b res3v.
rewrite !land_foo.
do split.
+ move => k kb; rewrite !initiE  /= 1:/# !Array1024.initiE  /= 1:/#. 
  rewrite  (_: (512 <= 768 + k && 768 + k < 768)=false) /= 1:/#.
  by rewrite !Array1024.initiE  /= 1:/# /= !Array1024.initiE  /= /#.
+ by move => k kb;rewrite !initiE  /# /=. 

move => [#]  res4 [#] res4b res4v.
do split.
+ move => k kb; rewrite !initiE  /= 1:/# !Array1024.initiE  /= 1:/#;  smt(Array1024.initiE).


move => k [#] kbl kbh; rewrite !initiE  //= !Array1024.initiE  /= 1:/# !mapiE //= !initiE //=.
case (768 <= k && k < 1024).
+ move => kbb.
  rewrite (res4v (k - 768) _) 1:/# !mapiE /= 1..2:/# !initiE /= 1..2:/#.
  by rewrite !Array1024.initiE /= 1:/# !Array1024.initiE /= 1:/# !Array1024.initiE /= /#.

case (512 <= k && k < 768).
+ move => kbb.
  rewrite (res3v (k - 512) _) 1:/# !mapiE /= 1..2:/# !initiE /= 1..2:/#.
  by rewrite !Array1024.initiE /= 1:/# !Array1024.initiE /= /#.

move => nkbb.
case (256 <= k && k < 512).
+ move => kbb.
  rewrite (res2v (k - 256) _) 1:/# !mapiE /= 1..2:/# !initiE /= 1..2:/#.
  by rewrite !Array1024.initiE /= /#.

move => *.
rewrite initiE 1:/# /=. 
have -> : 0 <= k < 256 by smt().
by rewrite (resv1 k _) 1:/# !mapiE /= 1..2:/# !initiE /= 1..2:/#.
qed.

lemma polyvec_add_ll  : islossless Jkem1024.M.__polyvec_add2 by proc; unroll for 2;do 4! (wp; call poly_add_ll).

lemma polyvec_add_corr  _a _b ab bb:
    0 <= ab <= 6 => 0 <= bb <= 3 =>
   phoare[Jkem1024.M.__polyvec_add2 :
           _a = lift_array1024 r /\
           _b = lift_array1024 b /\
           signed_bound1024_cxq r 0 1024 ab /\
           signed_bound1024_cxq b 0 1024 bb 
           ==>
           signed_bound1024_cxq res 0 1024 (ab + bb) /\ 
           forall k, 0 <= k < 1024 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k] ]  = 1%r by 
                move => abb bbb; conseq polyvec_add_ll (polyvec_add_corr_h  _a _b ab bb abb bbb). 

lemma polyvec_add_corr_impl  ab bb:
    0 <= ab <= 6 => 0 <= bb <= 3 =>
    forall _a _b,
   phoare[Jkem1024.M.__polyvec_add2 :
           _a = lift_array1024 r /\
           _b = lift_array1024 b /\
           signed_bound1024_cxq r 0 1024 ab /\
           signed_bound1024_cxq b 0 1024 bb 
           ==>
           signed_bound1024_cxq res 0 1024 (ab + bb) /\ 
           forall k, 0 <= k < 1024 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k] ]  = 1%r
  by move => abb bbb _a _b;  apply (polyvec_add_corr  _a _b ab bb abb bbb).

(******************************************************)

lemma polyvec_reduce_corr_h _a :
      hoare[Jkem1024.M.__polyvec_reduce :
          _a = lift_array1024 r ==> 
          _a = lift_array1024 res /\
          forall k, 0 <= k < 1024 => bpos16 res.[k] (2*q)].
proof.
proc. 
unroll for 2.
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[(3 * 256) + i])))).
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[i])))).
  
skip=>  &hr; rewrite /lift_array256 /lift_array1024 => ->.
rewrite !land_foo; split => /=.

+ rewrite tP => k kb; rewrite !mapiE //= !initiE //= !Array1024.initiE  /=.


move => res1 [#] res1v res1b res2 [#] res2v res2b res3 [#]  res3v res3b res4 [#]  res4v res4b.

rewrite tP in res4v.
rewrite tP in res3v.
rewrite tP in res2v.
rewrite tP in res1v.

rewrite !tP.
split.
  move => k nkbb.
  case (256 <= k && k < 512).
  + move => kbb.
    move : (res2v (k - 256) _); 1:smt(); rewrite !mapiE /= 1..4:/# !initiE /= 1..2:/#.
     rewrite !Array1024.initiE  /=  1,2:/#  !Array1024.initiE  /=  /#. 

  move =>  nkbb2.
  rewrite !mapiE 1..2:/# !Array1024.initiE  /=  1:/#.

  case (512 <= k && k < 768).
  + move => kbb.
  move : (res3v (k-512) _); 1:smt(); rewrite !mapiE /= 1,2:/# !initiE /= 1,2:/# !initiE /= 1:/# !initiE /= /#.

  case (768 <= k && k < 1024).
  + move => kbb.
  move : (res4v (k-768) _); 1:smt().
   rewrite !mapiE /= 1,2:/# !initiE /= 1:/# !initiE /= 1:/#  !initiE /= 1:/# !initiE /= /#.

move => *.
rewrite !Array1024.initiE  /=  1:/#.
rewrite !Array1024.initiE  /=  1:/#.
  move : (res1v (k) _); 1:smt(); rewrite !mapiE /= 1,2:/# !initiE /#.

smt(Array1024.initiE).

qed.


(* TODO *)
lemma polyvec_reduce_ll: islossless Jkem1024.M.__polyvec_reduce  by proc; unroll for 2;do 4! (wp; call poly_reduce_ll).

lemma polyvec_reduce_corr  _a :
      phoare[Jkem1024.M.__polyvec_reduce :
          _a = lift_array1024 r ==> 
          _a = lift_array1024 res /\
          forall k, 0 <= k < 1024 => bpos16 res.[k] (2*q)]  = 1%r 
by  conseq polyvec_reduce_ll (polyvec_reduce_corr_h  _a). 

(******************************************************)
(* Fix me: these are all very similar *)

lemma untruncate1 (a b : W8.t) :
   to_uint (zeroextu32 a `|` (zeroextu32 b `&` (of_int 3)%W32 `<<` (of_int 8)%W8)) =
   to_uint a + to_uint b %% 4 * 256.
proof.
rewrite orw_disjoint; last first.
+ rewrite to_uintD_small /=.
  + rewrite /(`<<`) to_uint_shl //=.
    rewrite (_: 3 = 2^2-1) // and_mod //= !of_uintK /=.
    rewrite !(modz_small _ 4294967296); 1..9:smt(W8.to_uint_cmp pow2_8).
  rewrite (_: 3 = 2^2-1) // and_mod //= !of_uintK /=.
  rewrite /(`<<`) shlMP //= of_uintK /=. 
  by rewrite !(modz_small _ 4294967296); 1..4:smt(W8.to_uint_cmp pow2_8).
apply W32.ext_eq => k kb.
rewrite /W32.(`&`) map2iE // (_: 3 = 2^2-1) // and_mod //= !of_uintK /=.
rewrite !(modz_small _ 4294967296); 1:smt(W8.to_uint_cmp pow2_8).
rewrite /(`<<`) shlMP //=.
rewrite !W32.get_to_uint /= kb //= !of_uintK /=.
rewrite !(modz_small _ 4294967296); 1..2:smt(W8.to_uint_cmp pow2_8).
case(8 <= k); 1: by rewrite (_: 256 = 2^8); move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 8 k) => //=;smt(W8.to_uint_cmp pow2_8).
move => *; have -> : to_uint b %% 4 * 256 %/ 2 ^ k %% 2 = 0; last by smt().
rewrite (_: 256 = 2^8) // Montgomery.div_mulr //;1: by apply dvdz_exp2l; 1:smt(). 
rewrite expz_div; 1,2: smt().
move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 1 (8-k) _) => //=; 1: smt(). 
rewrite -modzMml; have : 2 ^ (8 - k) %% 2 = 0; last by smt().
by rewrite (_ : 2 = 2^1) //;apply dvdz_exp2l; smt().
qed.

lemma untruncate2 (a b : W8.t) :
   to_uint ((zeroextu32 a `>>` (of_int 2)%W8)  `|` 
           (zeroextu32 b `&` (of_int 15)%W32 `<<` (of_int 6)%W8)) =
   to_uint a %/4 + to_uint b %% 16 * 64.
proof.
rewrite orw_disjoint; last first.
+ rewrite to_uintD_small /=.
  + rewrite /(`<<`) to_uint_shl //= /(`>>`) to_uint_shr //=.
    rewrite (_: 15 = 2^4-1) // and_mod //= !of_uintK /=.
    rewrite !(modz_small _ 4294967296); 1..9:smt(W8.to_uint_cmp pow2_8).
  rewrite (_: 15 = 2^4-1) // and_mod //= !of_uintK /=.
  rewrite /(`<<`) shlMP //= of_uintK /= /(`>>`) shrDP //= of_uintK. 
  by rewrite !(modz_small _ 4294967296); 1..6:smt(W8.to_uint_cmp pow2_8).
apply W32.ext_eq => k kb.
rewrite /W32.(`&`) map2iE // (_: 15 = 2^4-1) // and_mod //= !of_uintK /=.
rewrite !(modz_small _ 4294967296); 1:smt(W8.to_uint_cmp pow2_8).
rewrite /(`<<`) shlMP //= /(`>>`) shrDP //=. 
rewrite !W32.get_to_uint /= kb //= !of_uintK /=.
rewrite !(modz_small _ 4294967296); 1..4:smt(W8.to_uint_cmp pow2_8).
case(6 <= k); 1: by rewrite (_: 64 = 2^6); move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 6 k) => //=;smt(W8.to_uint_cmp pow2_8).
move => *; have -> : to_uint b %% 16 * 64 %/ 2 ^ k %% 2 = 0; last by smt().
rewrite (_: 64 = 2^6) // Montgomery.div_mulr //;1: by apply dvdz_exp2l; 1:smt(). 
rewrite expz_div; 1,2: smt().
move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 1 (6-k) _) => //=; 1: smt(). 
rewrite -modzMml; have : 2 ^ (6 - k) %% 2 = 0; last by smt().
by rewrite (_ : 2 = 2^1) //;apply dvdz_exp2l; smt().
qed.

lemma untruncate3 (a b : W8.t) :
   to_uint ((zeroextu32 a `>>` (of_int 4)%W8)  `|` 
           (zeroextu32 b `&` (of_int 63)%W32 `<<` (of_int 4)%W8)) =
   to_uint a %/16 + to_uint b %% 64 * 16.
rewrite orw_disjoint; last first.
+ rewrite to_uintD_small /=.
  + rewrite /(`<<`) to_uint_shl //= /(`>>`) to_uint_shr //=.
    rewrite (_: 63 = 2^6-1) // and_mod //= !of_uintK /=.
    rewrite !(modz_small _ 4294967296); 1..9:smt(W8.to_uint_cmp pow2_8).
  rewrite (_: 63 = 2^6-1) // and_mod //= !of_uintK /=.
  rewrite /(`<<`) shlMP //= of_uintK /= /(`>>`) shrDP //= of_uintK. 
  by rewrite !(modz_small _ 4294967296); 1..6:smt(W8.to_uint_cmp pow2_8).
apply W32.ext_eq => k kb.
rewrite /W32.(`&`) map2iE // (_: 63 = 2^6-1) // and_mod //= !of_uintK /=.
rewrite !(modz_small _ 4294967296); 1:smt(W8.to_uint_cmp pow2_8).
rewrite /(`<<`) shlMP //= /(`>>`) shrDP //=. 
rewrite !W32.get_to_uint /= kb //= !of_uintK /=.
rewrite !(modz_small _ 4294967296); 1..4:smt(W8.to_uint_cmp pow2_8).
case(4 <= k); 1: by rewrite (_: 16 = 2^4); move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 4 k) => //=;smt(W8.to_uint_cmp pow2_8).
move => *; have -> : to_uint b %% 64 * 16 %/ 2 ^ k %% 2 = 0; last by smt().
rewrite (_: 16 = 2^4) // Montgomery.div_mulr //; 1: by apply dvdz_exp2l;  smt(). 
rewrite expz_div; 1,2: smt().
move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 1 (4-k) _) => //=; 1: smt(). 
rewrite -modzMml; have : 2 ^ (4 - k) %% 2 = 0; last by smt().
by rewrite (_ : 2 = 2^1) //;apply dvdz_exp2l; smt().
qed.

lemma untruncate4 (a b : W8.t) :
   to_uint ((zeroextu32 a `>>` (of_int 6)%W8)  `|` 
           ((zeroextu32 b `<<` (of_int 2)%W8))) =
   to_uint a %/64 + to_uint b * 4.
proof.
rewrite orw_disjoint; last first.
+ rewrite to_uintD_small /=.
  + rewrite /(`<<`) to_uint_shl //= /(`>>`) to_uint_shr //= !to_uint_zeroextu32.
    rewrite !(modz_small _ 4294967296); 1..2:smt(W8.to_uint_cmp pow2_8).
  rewrite /(`<<`) shlMP //= of_uintK /= /(`>>`) shrDP //= of_uintK /=. 
  by rewrite !(modz_small _ 4294967296); 1..4:smt(W8.to_uint_cmp pow2_8).
apply W32.ext_eq => k kb.
rewrite /W32.(`&`) map2iE //=.
rewrite /(`<<`) shlMP //= /(`>>`) shrDP //=. 
rewrite !W32.get_to_uint /= kb //= !of_uintK /=.
rewrite !(modz_small _ 4294967296); 1..4:smt(W8.to_uint_cmp pow2_8).
case(2 <= k); 1: by rewrite (_: 64 = 2^6); move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 2 k) => //=;smt(W8.to_uint_cmp pow2_8).
move => *; have -> : to_uint b * 4 %/ 2 ^ k %% 2  = 0; last by smt().
rewrite (_: 4 = 2^2) // Montgomery.div_mulr //; 1: by apply dvdz_exp2l;  smt(). 
rewrite expz_div; 1,2: smt().
move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 1 (2-k) _) => //=; 1: smt(). 
rewrite -modzMml; have : 2 ^ (2- k) %% 2 = 0; last by smt().
by rewrite (_ : 2 = 2^1) //;apply dvdz_exp2l; smt().
qed.


(********** BEGIN BDEP PROOF OF DECOMPRESS **************)

op decompress11_circuit(c : W11.t) : W16.t = 
  truncateu16 (srl_32 (((zeroextu11_32 c) * W32.of_int 3329) + W32.of_int 1024) (W32.of_int 11)).

lemma polyvec_decompress_ll : islossless Jkem1024.M.__i_polyvec_decompress.
 proc; inline *;wp. 
  while (0 <= i <= 1408) (1408-i); last by  auto =>  /> /#.
move => *;auto => /> /#.
qed.

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

lemma polyvec_decompress_corr_h (_aw : W8.t Array1408.t): 
    hoare [Jkem1024.M.__i_polyvec_decompress  :
             ap = _aw
              ==>
             pos_bound1024_cxq res 0 1024 1 /\
             lift_polyvec res = decompress_polyvec 11 (decode11_vec _aw) ].
proc; inline *.
proc change ^while.6:  { d1 <- sll_32 d1 (W32.of_int 8);};1: by auto.
proc change ^while.11: { t0 <- srl_32 t0 (W32.of_int 11);}; 1: by auto.
proc change ^while.16: { d0 <- srl_32 d0 (W32.of_int 3);};1: by auto.
proc change ^while.18: { d1 <- sll_32 d1 (W32.of_int 5);}; 1: by auto.
proc change ^while.23: { d0 <- srl_32 d0 (W32.of_int 11);};1: by auto.
proc change ^while.29: { t0 <- srl_32 t0 (W32.of_int 6);};1: by auto.
proc change ^while.31: { d0 <- sll_32 d0 (W32.of_int 2);};1: by auto.
proc change ^while.33: { d1 <- sll_32 d1 (W32.of_int 10);};1: by auto.
proc change ^while.39: { d0 <- srl_32 d0 (W32.of_int 11);};1: by auto.
proc change ^while.44: { d0 <- srl_32 d0 (W32.of_int 1);};1: by auto.
proc change ^while.46: { d1 <- sll_32 d1 (W32.of_int 7);};1: by auto.
proc change ^while.51: { d0 <- srl_32 d0 (W32.of_int 11);};1: by auto.
proc change ^while.56: { d0 <- srl_32 d0 (W32.of_int 4);};1: by auto.
proc change ^while.58: { d1 <- sll_32 d1 (W32.of_int 4);};1: by auto.
proc change ^while.63: { d0 <- srl_32 d0 (W32.of_int 11);};1: by auto.
proc change ^while.69: { t1 <- srl_32 t1 (W32.of_int 7);};1: by auto.
proc change ^while.71: { d0 <- sll_32 d0 (W32.of_int 1);};1: by auto.
proc change ^while.73: { d1 <- sll_32 d1 (W32.of_int 9);};1: by auto.
proc change ^while.79: { d0 <- srl_32 d0 (W32.of_int 11);};1: by auto.
proc change ^while.84: { d0 <- srl_32 d0 (W32.of_int 2);};1: by auto.
proc change ^while.86: { d1 <- sll_32 d1 (W32.of_int 6);};1: by auto.
proc change ^while.79: { d0 <- srl_32 d0 (W32.of_int 11);};1: by auto.
proc change ^while.91: { d0 <- srl_32 d0 (W32.of_int 11);};1: by auto.
proc change ^while.96: { d0 <- srl_32 d0 (W32.of_int 5);};1: by auto.
proc change ^while.98: { d1 <- sll_32 d1 (W32.of_int 3);};1: by auto.
proc change ^while.103:{ d0 <- srl_32 d0 (W32.of_int 11);};1: by auto.

swap 1 1.
unroll for ^while.
cfold ^i<-.
cfold ^j<-.
wp -2.

conseq (: _ ==> rp = init_1024_16 (fun i =>
     decompress11_circuit (W11.init (fun (j : int) => _aw.[(i*11 + j) %/ 8].[(i*11 + j) %% 8]))));
      last by circuit.

      
(* We start with some boilerplate *)
move => &hr [#]/= <- rr /= ->.

split; last first.
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


(********** END BDEP PROOF OF DECOMPRESS **************)


lemma polyvec_decompress_corr _aw :
    phoare [Jkem1024.M.__i_polyvec_decompress  :
             ap = _aw
              ==>
             pos_bound1024_cxq res 0 1024 1 /\
             lift_polyvec res = decompress_polyvec 11 (decode11_vec _aw) ] = 1%r
  by conseq polyvec_decompress_ll (polyvec_decompress_corr_h _aw).


(********** BEGIN BDEP PROOF OF FROMBYTES **************)

lemma polyvec_frombytes_ll : islossless Jkem1024.M.__i_polyvec_frombytes.
proc; inline *;wp. 
  while (0 <= i <= 4) (4-i); last by  auto =>  /> /#.
move => *. cfold 3. unroll for ^while;auto => /> /#.
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


lemma polyvec_frombytes_corr_h (_aw : W8.t Array1536.t): 
    hoare [Jkem1024.M.__i_polyvec_frombytes  :
             ap = _aw
              ==>
             lift_array1024 res = map incoeff (decode12_vec _aw)  /\
             pos_bound1024_cxq res 0 1024  2].
proc; inline *.
proc change ^while.1: { rp <- init_256_16 (fun (i_0 : int) => r.[256 * i + i_0]);}; 1: by auto.
proc change ^while.2: { ap0 <- init_384_8 (fun (i_0 : int) => ap.[384 * i + i_0]); }; 1: by auto.
proc change ^while.^while.7: { t <- sll_16 t (W16.of_int 8);}; 1: by auto.
proc change ^while.^while.10: {d1 <- sll_16 d1 (W16.of_int 4);}; 1: by auto.
proc change ^while.^while.12: {t <- srl_16 t (W16.of_int 4);}; 1: by auto.
proc change ^while.7:{ r <- init_1024_16 (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux.[i_0 - 256 * i] else r.[i_0]); }; 1: by auto.
unroll for ^while.
cfold 4.
do 4!(unroll for ^while).
cfold ^i0<-.
wp -3.


conseq (_ : _ ==> r = init_1024_16 (fun i =>
     frombytes_circuit (
       W12.init (fun j =>
         let idx = i*12 + j in
         let aidx = idx %/ 8 in
         let bidx = idx %% 8 in
         _aw.[aidx].[bidx]
       )
     )
   )); last by circuit.

move => &hr [#]/= <- rr /= ->.
split.

rewrite  /lift_array1024 tP => i ib.
by rewrite mapiE 1:/# /= mapiE 1:/# initiE 1:/# frombytes_circuit_sem /#.
rewrite /pos_bound1024_cxq => k kb; rewrite initiE 1:/# /= qE /=. 
have := frombytes_circuit_rng ap{hr} k.
by smt().
qed.

(********** END BDEP PROOF OF FROMBYTES **************)

lemma polyvec_frombytes_corr _aw :
    phoare [ Jkem1024.M.__i_polyvec_frombytes :
             ap = _aw
              ==>
             lift_array1024 res = map incoeff (decode12_vec _aw)  /\
             pos_bound1024_cxq res 0 1024  2 ] = 1%r
   by conseq polyvec_frombytes_ll (polyvec_frombytes_corr_h _aw).

(******************************************************)

import W12.
lemma to_bytes_circuit_sem (p : W16.t Array1024.t) (i k : int) :
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

lemma poly_tobytes_ll : islossless Jkem1024.M._poly_tobytes.
proc.
wp;while (0 <= i <= 257) (257-i); last by wp; call (poly_csubq_ll); auto =>  /> /#.
move => *; auto => /> /#.
qed.

from JazzEC require import WArray384.

lemma polyvec_tobytes_corr_h  _aw :
    hoare [Jkem1024.M.__i_polyvec_tobytes  :
             pos_bound1024_cxq a 0 1024 2 /\
             a = _aw 
              ==>
             res = encode12_vec (map asint (lift_array1024 _aw))
              ].
proc;inline *.
proc change ^while.^while.2: { t <- (W16_sub t (W16.of_int 3329)); }; 1: by auto. 
proc change ^while.^while.4 : { b <- (sra_16 b (W16.of_int 15)); }; 1: by auto.
proc change ^while.^while{2}.7 : { t0 <- (srl_16 t0 (W16.of_int 8));}; 1: by auto.
proc change ^while.^while{2}.11 : { d <- (sll_16 d (W16.of_int 4));}; 1: by auto.
proc change ^while.^while{2}.15 : { t1 <- (srl_16 t1 (W16.of_int 4));}; 1: by auto.
proc change ^while.^while{2}.5 : { rp0 <- rp0.[j <- truncateu8 d]; }.
+ auto => /> &hr; rewrite tP => k kb; rewrite initiE 1:/# /get8. 
  case (0 <= j{hr} < 384) => *.
  + rewrite get_setE 1:/# initiE 1:/# /= get_setE /#.
  rewrite !setE /= !initiE 1,2:/# /= initiE /#.
proc change ^while.^while{2}.13 : { rp0 <- rp0.[j <- truncateu8 d]; }.
+ auto => /> &hr; rewrite tP => k kb; rewrite initiE 1:/# /get8. 
  case (0 <= j{hr} < 384) => *.
  + rewrite get_setE 1:/# initiE 1:/# /= get_setE /#.
  rewrite !setE /= !initiE 1,2:/# /= initiE /#.
proc change ^while.^while{2}.16 : { rp0 <- rp0.[j <- truncateu8 t1]; }.
+ auto => /> &hr; rewrite tP => k kb; rewrite initiE 1:/# /get8. 
  case (0 <= j{hr} < 384) => *.
  + rewrite get_setE 1:/# initiE 1:/# /= get_setE /#.
  rewrite !setE /= !initiE 1,2:/# /= initiE /#.
proc change ^while.1 : { rp0 <- init_384_8  (fun (i_0 : int) => rp.[384 * i + i_0]);}; 1: by by auto.
proc change ^while.2 : { a0 <- init_256_16 (fun (i_0 : int) => a.[256 * i + i_0]);};1: by auto.
proc change ^while.11: {rp <- init_1536_8 (fun (i_0 : int) => if 384 * i <= i_0 < 384 * i + 384 then aux.[i_0 - 384 * i] else rp.[i_0]);};1 : by auto.

do 9!(unroll for ^while).
cfold ^i0<-.
cfold ^i<-.
cfold ^j<-.
cfold ^i1<-.
wp -5.
conseq (: 
 a = _aw /\
   Array1024.all (fun bv => W16.zero \sle bv /\ bv \slt (of_int (2 * 3329))) a
   ==> rp =  let ret = init_1024_12 (fun j => tobytes_circuit _aw.[j]) in
  init_1536_8 (fun i =>
    W8.init (fun j =>
      let idx = i*8 + j in
      let aidx = idx %/ 12 in
      let bidx = idx %% 12 in
      W12."_.[_]" (ret.[aidx]) bidx)));last by circuit.

+ move => &hr />; rewrite allP /= /pos_bound1024_cxq /(\sle) /(\slt) /= qE  /to_sint /smod /=.
  by move => H k ?; move : (H k _) => //=.

move => &hr [#]/=; rewrite /pos_bound1024_cxq /bpos16 => H0 <- rr ->.
rewrite /init_1536_8 /encode12 tP => i ib.
rewrite initiE 1:/# /= get_of_list 1:/# /= wordP => k kb.
rewrite initiE //= /init_256_12 initiE 1:/# /=.
by rewrite  to_bytes_circuit_sem;1..3:
 by rewrite /(\ult) /=; smt(W16.to_sint_unsigned).
 qed.

lemma polyvec_tobytes_ll  : islossless Jkem1024.M.__i_polyvec_tobytes.
proc. unroll for 3.
do 4!(wp;call poly_tobytes_ll); auto.
qed.

lemma polyvec_tobytes_corr  _aw : 
    phoare [Jkem1024.M.__i_polyvec_tobytes  :
             pos_bound1024_cxq a 0 1024 2 /\
             a = _aw 
              ==>
             res = encode12_vec (map asint (lift_array1024 _aw))
              ] = 1%r
   by conseq polyvec_tobytes_ll (polyvec_tobytes_corr_h _aw).

(******************************************************)

lemma polyvec_ntt_correct_h _r:
   hoare[Jkem1024.M.__polyvec_ntt :
        _r = r /\ signed_bound1024_cxq r 0 1024 2
          ==> 
        nttv (lift_polyvec _r) = lift_polyvec res /\
            pos_bound1024_cxq res 0 1024 2 ].
proof.
proc.
unroll for 2.
wp;ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[(3 * 256) + i])))).
wp;ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[i])))).
skip; move => &hr; rewrite /signed_bound_cxq /signed_bound1024_cxq => [# _r_def signed_bound_r].

split; 1: by auto => />;move => k kb kbl; rewrite initiE /#.

move =>  [#] r_eq_res1 ? res1 [#] res1v signed_bound_res1 res1_eq_res2.
split;1:by auto => />;move => k kb kbl; rewrite initiE 1:/# /=;smt(Array1024.tP Array1024.initiE).

move => signed_bound_r2 res2 [#] r_eq_res2  signed_bound_res2 /=.

split; 1: by move => k k_bl; rewrite !initiE 1:/# /= !initiE 1:/# /= !Array1024.initiE 1:/# /= (fun_if W16.to_sint) /#.

move => signed_bound_r3 res3 [#] r_eq_res3 signed_bound_res3 /=.
rewrite !andabP.
split; 1: by move => k k_bl; rewrite !initiE 1:/# /= !initiE 1:/# /= !initiE 1:/# /= !initiE 1:/# /= (fun_if W16.to_sint) /#.

move => res4 [#] r_eq_res4 signed_bound_res4 /=.

split.
  rewrite /nttv /lift_polyvec !mapvE /= offunvK /vclamp /= eq_vectorP => k k_b.
  rewrite !offunvE //= k_b /= tP /= => i i_b.
  rewrite /lift_array256 /subarray256 /= !mapiE //.
  do (rewrite initiE 1:/# /= || rewrite fun_if /=).
  case (k = 0) => k_v.
    rewrite k_v /= i_b /=.
    have ->: !(256 <= i && i < 512). move : i_b => /#.
    have ->: !(512 <= i && i < 768). move : i_b => /#.
    have ->: !(768 <= i && i < 1024). move : i_b => /#.
    rewrite (lift_array256_incoeff res1) 1:/# /= -res1v r_eq_res1 /= _r_def.
    congr. congr.
    apply Array256.tP => j j_b.
    by rewrite -lift_array256_incoeff 1:j_b initiE 1:j_b /= /lift_array256 /= mapiE // initiE 1:j_b //.

  move : k_v => ?.
  case (k = 1) => k_v.
    rewrite k_v /=.
    have ->: (256 <= 256 + i && 256 + i < 512). move : i_b => /#.
    have ->: !(512 <= 256 + i && 256 + i < 768). move : i_b => /#.
   have ->: !(768 <= 256+i && 256+i < 1024). move : i_b => /#.
    rewrite (lift_array256_incoeff res2) 1:/# -r_eq_res2 /= _r_def /lift_array256  //.
    congr. congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_incoeff 1:j_b mapiE //=.
    rewrite initiE 1:/# /= initiE 1:/# /= /res1_eq_res2 initiE 1:/# /=.
    have ->: !(0 <= 256 + j && 256 + j < 256). move : j_b => /#.
    by trivial.
  move : k_v => ?.
  case (k = 2) => k_v.
    rewrite k_v /=.
    have ->: (512 <= 512 + i && 512 + i < 768). move : i_b => /#.
    have ->: !(768 <= 512 + i && 512 + i < 1024). move : i_b => /#.
    rewrite (lift_array256_incoeff res3) 1:/# -r_eq_res3 /= _r_def.
    congr. congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_incoeff 1:j_b mapiE //=.
    do (rewrite initiE 1:/# /=).
    by smt().

  move : k_v => ?.
  case (k = 3) => k_v.
    rewrite k_v /=.
    have ->: (768 <= 768 + i && 768 + i < 1024). move : i_b => /#.
    rewrite (lift_array256_incoeff res4) 1:/# -r_eq_res4 /= _r_def.
    congr. congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_incoeff 1:j_b mapiE //=.
    do (rewrite initiE 1:/# /=).
    by smt().

  by smt().

  rewrite /pos_bound1024_cxq => k k_b.
  do (rewrite initiE 1:k_b /= || rewrite (fun_if W16.to_sint)).
  move : (signed_bound_res4 (k - 768)) (signed_bound_res3 (k - 512)) (signed_bound_res3 (k - 256)) (signed_bound_res1 k).
  by smt().
qed.

lemma polyvec_ntt_ll  : islossless Jkem1024.M.__polyvec_ntt by  proc;unroll for 2;do 4! (wp;call(ntt_ll)).

lemma polyvec_ntt_corr _r:
   phoare[Jkem1024.M.__polyvec_ntt :
        _r = r /\ signed_bound1024_cxq r 0 1024 2
          ==> 
       nttv (lift_polyvec _r) = lift_polyvec res /\
            pos_bound1024_cxq res 0 1024 2 ]  = 1%r 
by conseq polyvec_ntt_ll (polyvec_ntt_correct_h _r).

(******************************************************)

lemma polyvec_invntt_correct_h _r:
   hoare[Jkem1024.M.__polyvec_invntt :
        _r = r /\
        signed_bound1024_cxq r 0 1024 4
          ==> 
            scale_polyvec (invnttv (lift_polyvec _r)) (incoeff Fq.SignedReductions.R) = lift_polyvec res /\
            forall (k : int), 0 <= k && k < 1024 => b16 res.[k] (q) ].
proof.
proc.
unroll for 2.
wp;ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[(3 * 256) + i])))).
wp;ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[i])))).

wp; skip; move => &hr; rewrite /signed_bound_cxq /signed_bound1024_cxq => [ #_r_def signed_bound_r] *.

split; 1: by auto => />;move => k kb kbl; rewrite initiE /#.

move =>  [#] r_eq_res1 ? res1 [#] res1v signed_bound_res1 res1_eq_res2.
split;1:by auto => />;move => k kb kbl; rewrite initiE 1:/# /=;smt(Array1024.tP Array1024.initiE).

move => signed_bound_r2 res2 [#] r_eq_res2 ? signed_bound_res2 /=.

split; 1: by move => k k_bl ; rewrite !initiE 1:/# /= !initiE 1:/# /= !Array1024.initiE 1:/# /= (fun_if W16.to_sint) /#.

move => signed_bound_r3 res3 [#] r_eq_res3  signed_bound_res3 /=.

split; 1: by move => k k_bl ; rewrite !initiE 1:/# /= !initiE 1:/# /=  !initiE 1:/# /= !Array1024.initiE 1:/# /= (fun_if W16.to_sint) /#.

move => signed_bound_r4 res4 [#] r_eq_res4 signed_bound_res4 /=.

split.
  rewrite /scale_polyvec /invnttv /lift_polyvec !mapvE /= offunvK /vclamp /= eq_vectorP => k k_b.
  rewrite !offunvE //= k_b /= tP /= => i i_b.
  rewrite offunvK /vclamp /= k_b /=.
  rewrite /lift_array256 /subarray256 /= !mapiE //.
  do (rewrite initiE 1:/# /= || rewrite fun_if /=).
  case (k = 0). 
  + move => k_v.
    rewrite k_v /= i_b /=.
    have ->: !(256 <= i && i < 512). move : i_b => /#.
    have ->: !(512 <= i && i < 768). move : i_b => /#.
    have ->: !(768 <= i && i < 1024). move : i_b => /#.
    by rewrite /= (lift_array256_incoeff res1) 1:/# -res1v -r_eq_res1 /= _r_def 
                   /lift_array256  //= mapiE //=.
  move => ?.
  case (k = 1) => k_v.
    rewrite k_v /=.
    have ->: (256 <= 256 + i && 256 + i < 512). move : i_b => /#.
    have ->: !(512 <= 256+i && 256+i < 768). move : i_b => /#.
    have ->: !(768 <= 256+i && 256+i < 1024). move : i_b => /#.
    rewrite (lift_array256_incoeff res2) 1:/# -r_eq_res2 /= _r_def
         /lift_array256  //= mapiE //=.
    congr;congr;congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_incoeff 1:j_b !mapiE //=.
    do (rewrite initiE 1:/# /=).
    by smt().
  case (k = 2) => k_v2.
    rewrite k_v2 /=.
    have ->: !(256 <= 512 + i && 512 + i < 512). move : i_b => /#.
    have ->: (512 <= 512+i && 512+i < 768). move : i_b => /#.
    have ->: !(768 <= 512+i && 512+i < 1024). move : i_b => /#.
    rewrite (lift_array256_incoeff res3) 1:/# -r_eq_res3 /= _r_def
         /lift_array256  //= mapiE //=.
    congr;congr;congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_incoeff 1:j_b !mapiE //=.
    do (rewrite initiE 1:/# /=).
    by smt().
  move : k_v => ?.
  case (k = 3) => k_v.
    rewrite k_v /=.
    have ->: !(256 <= 768 + i && 768 + i < 512). move : i_b => /#.
    have ->: !(512 <= 768+i && 768+i < 768). move : i_b => /#.
    have ->: (768 <= 768+i && 768+i < 1024). move : i_b => /#.
    rewrite (lift_array256_incoeff res4) 1:/# -r_eq_res4 /= _r_def
         /lift_array256  //= mapiE //=.
    congr;congr;congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_incoeff 1:j_b !mapiE //=.
    do (rewrite initiE 1:/# /=).
    by smt().
  by smt().

  move => k k_lb.
  do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
  move : (signed_bound_res4 (k - 768))  (signed_bound_res3 (k - 512)) (signed_bound_res3 (k - 256)) (signed_bound_res1 k).
  by smt().
qed.

lemma polyvec_invntt_ll  :
      islossless Jkem1024.M.__polyvec_invntt by  proc;unroll for 2;do 4! (wp;call(invntt_ll)).

lemma polyvec_invntt_corr _r:
   phoare[Jkem1024.M.__polyvec_invntt :
    _r = r /\ signed_bound1024_cxq r 0 1024 4
      ==> 
     scale_polyvec (invnttv (lift_polyvec _r)) (incoeff Fq.SignedReductions.R) = lift_polyvec res /\
            forall (k : int), 0 <= k && k < 1024 => b16 res.[k] (q) ]  = 1%r   
   by  conseq polyvec_invntt_ll (polyvec_invntt_correct_h _r). 

(******************************************************)

lemma polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _a3 _b0 _b1 _b2 _b3 _p0 _p1 _p2 _p3 (_r : coeff Array256.t) :
  _p0 = scale (basemul _a0 _b0) (incoeff 169) =>
  _p1 = scale (basemul _a1 _b1) (incoeff 169) =>
  _p2 = scale (basemul _a2 _b2) (incoeff 169) =>
  _p3 = scale (basemul _a3 _b3) (incoeff 169) =>
  (forall k, 0 <=  k < 256 =>
     _r.[k] = _p0.[k] + _p1.[k] + _p2.[k] + _p3.[k])  =>
  hoare [Jkem1024.M.__polyvec_pointwise_acc : 
    _a0 = subarray256 (lift_array1024 a) 0 /\
    _a1 = subarray256 (lift_array1024 a) 1 /\
    _a2 = subarray256 (lift_array1024 a) 2 /\
    _a3 = subarray256 (lift_array1024 a) 3 /\
    _b0 = subarray256 (lift_array1024 b) 0 /\
    _b1 = subarray256 (lift_array1024 b) 1 /\
    _b2 = subarray256 (lift_array1024 b) 2 /\
    _b3 = subarray256 (lift_array1024 b) 3 /\
    signed_bound1024_cxq a 0 1024 2 /\ 
    signed_bound1024_cxq b  0 1024 2 
     ==> 
    lift_array256 res =  _r /\
    forall (k : int), 0 <= k && k < 256 => 
        bpos16 res.[k] (2 * q)
  ].
proof.
move => _p0_def _p1_def _p2_def  _p3_def _r_def; proc.
ecall (poly_reduce_corr_h (lift_array256 r)).
unroll for 5;wp.
have H:= (poly_add_corr_impl_h 6 2 _ _) => //; ecall (H (lift_array256 r) _p3); clear H.
call (poly_basemul_corr _a3 _b3).
have H:= (poly_add_corr_impl_h 4 2 _ _) => //; ecall (H (lift_array256 r) _p2); clear H.
call (poly_basemul_corr _a2 _b2).
have H:= (poly_add_corr_impl_h 2 2 _ _) => //; ecall (H _p0 _p1); clear H.
call (poly_basemul_corr _a1 _b1).
call (poly_basemul_corr _a0 _b0).

wp; skip; subst => &hr; rewrite /subarray256 /lift_array1024 /lift_array256 /signed_bound1024_cxq /signed_bound_cxq /=  => [#].

move => _a0_def _a1_def _a2_def _a3_def _b0_def _b1_def _b2_def _b3_def  signed_bound_a signed_bound_b.

split.
+ rewrite _a0_def _b0_def mapE.
  split.
  + apply Array256.ext_eq => k kb.
    by rewrite !initiE //= Array1024.initiE /= 1:/# mapiE //= initiE //.
  split.
  +  apply Array256.ext_eq => k kb.
     by rewrite !initiE //= mapiE // 1: /# /= mapiE //= initiE //.
  by smt(Array256.initiE). 

move => [#] _a0_ddef _b0_ddef signed_bound_a0 signed_bound_b0 r0 [#] signed_bound_r0 a0tb0_eq_r0.
split. 
+ rewrite _a1_def _b1_def mapE.
  split.
  + apply Array256.ext_eq => k kb.
    by rewrite !initiE //= Array1024.initiE /= 1:/# mapiE //= initiE //.
  split.
  +  apply Array256.ext_eq => k kb.
     by rewrite !initiE //= mapiE // 1: /# /= mapiE //= initiE //.
  by smt(Array256.initiE). 

move => [#] _a1_ddef _b1_ddef signed_bound_a1 signed_bound_b1 r1 [#] signed_bound_r1 a1tb1_eq_r1.

split; 1: by rewrite a0tb0_eq_r0 a1tb1_eq_r1 //=.

move => [#] a0tb0f_eq_r0 a1tb1f_eq_r1 signed_bound_res0 signed_bound_res1 res2 [#] res2bound res2val.

split.
+ rewrite _a2_def _b2_def /lift_polyvec /lift_array256 mapE.
  split.
  + apply Array256.ext_eq => k kb.
    by rewrite !initiE //= Array1024.initiE /= 1:/# mapiE //= initiE //.
  split.
  +  apply Array256.ext_eq => k kb.
     by rewrite !initiE //= mapiE // 1: /# /= mapiE //= initiE //.
  by smt(Array256.initiE). 

move => [#] _a2_ddef _b2_ddef signed_bound_2 signed_bound_b2 r2 [#] signed_bound_r2 a2tb2_eq_r2.

split;1: by rewrite a2tb2_eq_r2 //=.

move => [#] a2tb2f_eq_r2 signed_bound_res2 signed_bound_rr2 res3 [#] res3bound res3val.

split.
+ rewrite _a3_def _b3_def /lift_polyvec /lift_array256 mapE.
  split.
  + apply Array256.ext_eq => k kb.
    by rewrite !initiE //= Array1024.initiE /= 1:/# mapiE //= initiE //.
  split.
  +  apply Array256.ext_eq => k kb.
     by rewrite !initiE //= mapiE // 1: /# /= mapiE //= initiE //.
  by smt(Array256.initiE). 


move => [#] _a3_ddef _b3_ddef signed_bound_3 signed_bound_b3 r3 [#] signed_bound_r3 a3tb3_eq_r3.

do split; 1,2,3: by smt().

move => [#] _r3_ddef signed_bound_r3d signed_bound_res3d  ss3 [#] ss3b ss3v res4 [#] r4val r4b.

split.
 by rewrite -r4val; rewrite tP => k kb; rewrite mapiE //= (ss3v k kb) mapiE //= res3val // _r_def //= mapiE //= res2val // _r_def //=.


by smt().
qed.

lemma polyvec_pointwise_acc_ll  :
      islossless Jkem1024.M.__polyvec_pointwise_acc
by  proc;call poly_reduce_ll; unroll for 5;wp;do 3! (call poly_add_ll;call poly_basemul_ll); call poly_basemul_ll;auto.

lemma polyvec_pointwise_acc_corr _a0 _a1 _a2 _a3 _b0 _b1 _b2 _b3 _p0 _p1 _p2 _p3 (_r : coeff Array256.t) :
  _p0 = scale (basemul _a0 _b0) (incoeff 169) =>
  _p1 = scale (basemul _a1 _b1) (incoeff 169) =>
  _p2 = scale (basemul _a2 _b2) (incoeff 169) =>
  _p3 = scale (basemul _a3 _b3) (incoeff 169) =>
  (forall k, 0 <=  k < 256 =>
     _r.[k] = _p0.[k] + _p1.[k] + _p2.[k] + _p3.[k])  =>
  phoare [Jkem1024.M.__polyvec_pointwise_acc : 
    _a0 = subarray256 (lift_array1024 a) 0 /\
    _a1 = subarray256 (lift_array1024 a) 1 /\
    _a2 = subarray256 (lift_array1024 a) 2 /\
    _a3 = subarray256 (lift_array1024 a) 3 /\
    _b0 = subarray256 (lift_array1024 b) 0 /\
    _b1 = subarray256 (lift_array1024 b) 1 /\
    _b2 = subarray256 (lift_array1024 b) 2 /\
    _b3 = subarray256 (lift_array1024 b) 3 /\
    signed_bound1024_cxq a 0 1024 2 /\ 
    signed_bound1024_cxq b  0 1024 2 
     ==> 
    lift_array256 res =  _r /\
    forall (k : int), 0 <= k && k < 256 => 
        bpos16 res.[k] (2 * q)
  ]  = 1%r by 
move => *; conseq polyvec_pointwise_acc_ll (polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _a3 _b0 _b1 _b2 _b3 _p0 _p1 _p2 _p3 _r _ _ _ _ _) => //. 


(******************************************************)

lemma polyvec_pointwise_acc_corr_alg_h va vb :
  hoare [Jkem1024.M.__polyvec_pointwise_acc :
    nttv va = lift_polyvec a /\
    nttv vb = lift_polyvec b /\
    signed_bound1024_cxq a 0 1024 2 /\
    signed_bound1024_cxq b 0 1024 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = scale (ntt (dotp va vb)) (incoeff 169)  ].
proof.
 move : (polyvec_pointwise_acc_corr_h (ntt va.[0])%PolyVec (ntt va.[1])%PolyVec 
      (ntt va.[2])%PolyVec (ntt va.[3])%PolyVec (ntt vb.[0])%PolyVec (ntt vb.[1])%PolyVec (ntt vb.[2])%PolyVec (ntt vb.[3])%PolyVec
          (scale (basemul (ntt va.[0]) (ntt vb.[0])) (incoeff 169))%PolyVec
          (scale (basemul (ntt va.[1]) (ntt vb.[1])) (incoeff 169))%PolyVec
          (scale (basemul (ntt va.[2]) (ntt vb.[2])) (incoeff 169))%PolyVec
          (scale (basemul (ntt va.[3]) (ntt vb.[3])) (incoeff 169))%PolyVec
          ((scale (basemul (ntt va.[0]) (ntt vb.[0])) (incoeff 169))%PolyVec &+
           (scale (basemul (ntt va.[1]) (ntt vb.[1])) (incoeff 169))%PolyVec &+
           (scale (basemul (ntt va.[2]) (ntt vb.[2])) (incoeff 169))%PolyVec &+
           (scale (basemul (ntt va.[3]) (ntt vb.[3])) (incoeff 169))%PolyVec)   _ _ _ _ _) => //=.
by move => k; rewrite /(&+) map2E map2E map2E /= initE /= initE //= initE //=   /#.
move => H; conseq (H).
move => &hr.
rewrite /nttv /lift_polyvec /lift_array256 /= /subarray256 /= /lift_array1024 => />  H0 H1 H2 H3.
move : H0 H1; rewrite !eq_vectorP => /> H0 H1. 
do split.
+ move : (H0 0 _) => //=.
  rewrite !mapvE !getvE !offunvE //= => ->; rewrite tP => k kb.
  by rewrite  !initiE // !mapiE 1,2:/# /= !initiE //.
+ move : (H0 1 _) => //.
  rewrite !mapvE !getvE !offunvE //= => ->; rewrite tP => k kb.
  by rewrite  !initiE // !mapiE 1:/# /= !initiE // mapiE // 1:/#.
+ move : (H0 2 _) => //.
  rewrite !mapvE !getvE !offunvE //= => ->; rewrite tP => k kb.
  by rewrite  !initiE // !mapiE 1:/# /= !initiE // mapiE // 1:/#.
+ move : (H0 3 _) => //.
  rewrite !mapvE !getvE !offunvE //= => ->; rewrite tP => k kb.
  by rewrite  !initiE // !mapiE 1:/# /= !initiE // mapiE // 1:/#.

+ move : (H1 0 _) => //=.
  rewrite !mapvE !getvE !offunvE //= => ->; rewrite tP => k kb.
  by rewrite  !initiE // !mapiE 1,2:/# /= !initiE //.
+ move : (H1 1 _) => //.
  rewrite !mapvE !getvE !offunvE //= => ->; rewrite tP => k kb.
  by rewrite  !initiE // !mapiE 1:/# /= !initiE // mapiE // 1:/#.
+ move : (H1 2 _) => //.
  rewrite !mapvE !getvE !offunvE //= => ->; rewrite tP => k kb.
  by rewrite  !initiE // !mapiE 1:/# /= !initiE // mapiE // 1:/#.
+ move : (H1 3 _) => //.
  rewrite !mapvE !getvE !offunvE //= => ->; rewrite tP => k kb.
  by rewrite  !initiE // !mapiE 1:/# /= !initiE // mapiE // 1:/#.

move => &hr [#] H0 H1 H2 H3 result H4.
move : H4 =>  [# H4 H5].
split; first by rewrite /signed_bound_cxq; smt().
rewrite H4 /dotp  /kvec //=.
rewrite !Big.BAdd.big_consT //= Big.BAdd.big_nil //=. 
rewrite /scale !add_comm_ntt !mul_comm_ntt.  
apply Array256.ext_eq => x xb.
rewrite !getvE !mapE   => />.
rewrite /(&+) map2E //=  !initiE => />.
rewrite /(&+) map2E //=  !initiE => />.
rewrite /(&+) map2E //=  !initiE => />.
rewrite /(&+) map2E //=  !initiE => />.
rewrite map2E //=  !initiE => />.
rewrite map2E //=  !initiE => />.
rewrite map2E //=  !initiE => />.
rewrite nttZero.
rewrite /Rq.zero createE !initiE => />.
rewrite /basemul.
by ring.
qed.

lemma polyvec_pointwise_acc_corr_alg va vb :
  phoare [Jkem1024.M.__polyvec_pointwise_acc :
    nttv va = lift_polyvec a /\
    nttv vb = lift_polyvec b /\
    signed_bound1024_cxq a 0 1024 2 /\
    signed_bound1024_cxq b 0 1024 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = scale (ntt (dotp va vb)) (incoeff 169)  ] = 1%r by
move => *;conseq polyvec_pointwise_acc_ll (polyvec_pointwise_acc_corr_alg_h va vb) => //.

module Aux = {
   proc inner_product(ai skpv : W16.t Array1024.t) : W16.t Array256.t = {
        var polyi,r';
        polyi <@ Jkem1024.M.__polyvec_pointwise_acc(ai,skpv);
        r' <@ Jkem1024.M._poly_frommont(polyi);
        return r';
   }
}.

import Fq.SignedReductions.

lemma innerprod_corr_h va vb:
  hoare [ Aux.inner_product :
    nttv va = lift_polyvec ai /\
    nttv vb = lift_polyvec skpv /\
    signed_bound1024_cxq ai 0 1024 2 /\
    signed_bound1024_cxq skpv 0 1024 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = ntt (dotp va vb)  ].
proof.
proc.
seq 1 : (#pre /\
    signed_bound_cxq polyi 0 256 2 /\
    lift_array256 polyi =  scale (ntt (dotp va vb)) (incoeff 169)
    ).
by call (polyvec_pointwise_acc_corr_alg_h va vb); auto => />.

ecall(poly_frommont_corr_h (map W16.to_sint polyi)).
skip => &hr; rewrite /lift_polyvec /signed_bound1024_cxq  /lift_polyvec /lift_array256 /signed_bound_cxq /scale /= !tP /=.
move => /> VA VB AB BB H H0. 

split; 1: by move => k kbl kbh; move : (H k _) => //; rewrite !mapiE //=.
move => polyval result rval.

split.

move => k kbl kbh; move : (rval k _) => //; rewrite mapiE // => ->. 

by move : (SREDCp_corr (to_sint polyi{hr}.[k] * (Fq.SignedReductions.R * Fq.SignedReductions.R %% q)) _ _); rewrite /R;smt(qE).

rewrite tP => k kb; rewrite mapiE //= (rval k kb) mapiE //.

have [#] redbl redbh redv := (SREDCp_corr (to_sint polyi{hr}.[k] * (Fq.SignedReductions.R * Fq.SignedReductions.R %% q)) _ _); 1,2 : by rewrite /R;smt(qE).

have -> : incoeff (SREDC (to_sint polyi{hr}.[k] * (Fq.SignedReductions.R * Fq.SignedReductions.R %% q)))  = 
          incoeff (to_sint polyi{hr}.[k] * (Fq.SignedReductions.R * Fq.SignedReductions.R %% q)  * 169) by rewrite -eq_incoeff; apply redv.

rewrite !incoeffM;move : (H0 k kb); rewrite !mapiE //= => ->.

have -> : incoeff (Fq.SignedReductions.R * Fq.SignedReductions.R %% q)  = incoeff Fq.SignedReductions.R * incoeff Fq.SignedReductions.R; 1: by rewrite -incoeffM -eq_incoeff modz_mod. 

have -> : (ntt (dotp va vb)).[k] * incoeff 169 * (incoeff Fq.SignedReductions.R * incoeff Fq.SignedReductions.R) * incoeff 169 = 
          (ntt (dotp va vb)).[k] * (incoeff Fq.SignedReductions.R * incoeff 169) * (incoeff Fq.SignedReductions.R * incoeff 169) by ring.

by rewrite rrinvcoeff; ring.
qed.

lemma inner_product_ll  :  islossless Aux.inner_product by proc; call poly_frommont_ll;call polyvec_pointwise_acc_ll.

lemma innerprod_corr va vb:
  phoare [ Aux.inner_product :
    nttv va = lift_polyvec ai /\
    nttv vb = lift_polyvec skpv /\
    signed_bound1024_cxq ai 0 1024 2 /\
    signed_bound1024_cxq skpv 0 1024 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = ntt (dotp va vb)  ]  = 1%r by
move => *;conseq inner_product_ll (innerprod_corr_h va vb) => //.

end MLKEM_PolyVec.

