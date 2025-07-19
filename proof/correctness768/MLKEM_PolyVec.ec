require import AllCore List IntDiv CoreMap.

from Jasmin require import JModel JMemory.
from JazzEC require import Array1152 Array960 Array256 Array384 Array128 Array768.
from CryptoSpecs require import GFq Rq Serialization VecMat MLKEM768 Correctness768.
require import W16extra.
require import Fq MLKEM_Poly NTT_Fq NTTAlgebra MLKEMFCLib.


from JazzEC require import Jkem768.

theory MLKEM_PolyVec.

import NTT_Fq.
import GFq.
import Zq.
import MLKEM_Poly.
import KMatrix.
import Serialization768.
import VecMat768.
import PolyVec.
import PolyMat.

lemma land_foo  p q: p && q <=> p /\ q by smt().

op lift_polyvec(vec: W16.t Array768.t) : polyvec =
    Vector.offunv (fun i => lift_array256 (subarray256 vec i)).


op scale_polyvec(v : polyvec, c : coeff) : polyvec = 
   Vector.offunv (fun i => (scale ((Vector.tofunv v) i) c)).

lemma liftarrayvector a i k : 0<=i<3 => 0<=k<256 =>
         ((lift_polyvec a).[i])%Vector.[k] = (lift_array768 a).[256*i+k].
move => ib lb; rewrite /lift_vector /lift_array768 offunvE // mapiE 1:/# /=.
by rewrite /lift_array256 /subarray256 mapiE //= initiE //=.
qed.


op unlift_polyvec(a : polyvec) = 
   Array768.init (fun i => W16.of_int (as_sint (a.[i %/ 256])%Vector.[i%%256])).

lemma vector_unlift a : 
    lift_polyvec (unlift_polyvec a) = a /\
    signed_bound768_cxq (unlift_polyvec a) 0 768 1.
proof.
split. 
+ rewrite /lift_vector /unlift_polyvec eq_vectorP => i ib.
  rewrite offunvE //= /subarray256 /lift_array256 /= tP => k kb.
  rewrite mapiE //= initiE //= initiE //= 1:/# /to_sint /smod /=.
  rewrite !of_uintK /=; rewrite /as_sint qE /=.
  by smt(rg_asint asintK).

rewrite /unlift_vector /signed_bound768_cxq => k kb; rewrite initiE //=.
rewrite /to_sint /smod /= !of_uintK /= /as_sint qE /=.
by smt(rg_asint).
qed.


lemma polyvec_csubq_corr_h ap :
      hoare[Jkem768.M.__polyvec_csubq :
           ap = lift_array768 r /\ pos_bound768_cxq r 0 768 2 
           ==>
           ap = lift_array768 res /\ pos_bound768_cxq res 0 768 1 ] . 
proof.
proc.
unroll for 2.
wp;ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[i])))).


skip; move => &hr [#].
rewrite /lift_array256 /pos_bound256_cxq /lift_array768 /pos_bound768_cxq /=.

move => -> bnd /=;split; 1: by move => *; rewrite initiE /#.

move => bnd1 result [#] rval rbnd; rewrite tP in rval.
split; 1: by move => *; rewrite !initiE //= !Array768.initiE /= /#.

move => bnd2 resul2 [#] rva2 rbnd2; rewrite tP in rva2.
rewrite !land_foo.
split;1:by   move => *; do 3!(rewrite initiE /= 1:/#)  => /#.

move => resul3 [#]  rva3 rbnd3; rewrite tP in rva3.

split. 

+ rewrite tP => k kb; rewrite !mapiE 1,2:/# /=;  do 3!(rewrite initiE /= 1:/#).

case (512 <= k && k < 768).
+ move => kb0 /=;move : (rva3 (k - 512) _); 1: smt().
  by rewrite !mapiE 1,2:/# //= !initiE 1:/# //= !initiE //= !initiE //= /#. 

move => case1;case (256 <= k && k < 512).
+ move => kb0 /=;move : (rva2 (k - 256) _); 1: smt().
  by rewrite !mapiE 1,2:/# //= !initiE 1:/# //= !initiE //= /#.  

move => case2;have : (0 <= k && k < 256); 1:smt().
move => kb0 /=;move : (rval (k) kb0).
  by rewrite !mapiE 1,2:/# //= !initiE /#.

by smt(Array768.initiE).
qed. 

lemma polyvec_csubq_ll : islossless Jkem768.M.__polyvec_csubq 
  by proc; unroll for 2;do 3! (wp;call poly_csubq_ll).

lemma polyvec_csubq_corr ap :
      phoare[Jkem768.M.__polyvec_csubq :
           ap = lift_array768 r /\ pos_bound768_cxq r 0 768 2 
           ==>
           ap = lift_array768 res /\ pos_bound768_cxq res 0 768 1 ] = 1%r
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

lemma polyvec_compress_corr_h mem _p _a :
    hoare [Jkem768.M.__polyvec_compress  :
             pos_bound768_cxq a 0 768 2 /\
             lift_array768 a = _a /\
             valid_ptr _p (3*320) /\
             Glob.mem = mem /\ to_uint rp = _p
              ==>
             touches mem Glob.mem _p (3*320) /\
             load_array960 Glob.mem _p = encode10_vec (map (compress 10) _a)].
admitted.

lemma polyvec_compress_corr mem _p _a :
    phoare [Jkem768.M.__polyvec_compress  :
             pos_bound768_cxq a 0 768 2 /\
             lift_array768 a = _a /\
             valid_ptr _p (3*320) /\
             Glob.mem = mem /\ to_uint rp = _p
              ==>
             touches mem Glob.mem _p (3*320) /\
             load_array960 Glob.mem _p = encode10_vec (map (compress 10) _a)] = 1%r.
admitted.

lemma i_polyvec_compress_corr_h _a :
    hoare [Jkem768.M.__i_polyvec_compress  :
             pos_bound768_cxq a 0 768 2 /\
             lift_array768 a = _a 
              ==>
             res = encode10_vec (map (compress 10) _a)
              ].
admitted.


lemma i_polyvec_compress_corr _a :
    phoare [Jkem768.M.__i_polyvec_compress  :
             pos_bound768_cxq a 0 768 2 /\
             lift_array768 a = _a 
              ==>
             res = encode10_vec (map (compress 10) _a)
              ] = 1%r.
admitted.

lemma polyvec_add_corr_h _a _b ab bb :
      0 <= ab <= 6 => 0 <= bb <= 3 =>
      hoare[Jkem768.M.__polyvec_add2 :
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb 
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\ 
           forall k, 0 <= k < 768 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]]. 
proof.
move => abb bbb;  move : (poly_add_corr_impl_h ab bb abb bbb) => H.
proc.
unroll for 2.
wp;ecall (H (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i]))) (lift_array256 (Array256.init (fun i => b.[(2 * 256) + i])))).
wp;ecall (H (lift_array256 (Array256.init (fun i => r.[256 + i]))) (lift_array256 (Array256.init (fun i => b.[256 + i])))).
wp;ecall (H (lift_array256 (Array256.init (fun i => r.[i]))) (lift_array256 (Array256.init (fun i => b.[i])))).
clear H.
skip => &hr.
rewrite /signed_bound768_cxq /signed_bound_cxq /lift_array768 /lift_array256 /=.
move => [#] ->-> 2?.
do split; 1..2: by move => *; rewrite !initiE //= /#.
move => [#] H H0 ?? res1 [#] resb1 resv1.
do split.
+ by move => k kb; move : (resb1 k kb); rewrite !initiE  //= !Array768.initiE  /#.
+ by move => k kb; move : (resb1 k kb); rewrite !initiE  //= /#.

move => [#]  vsofar bsofar ?? res2 [#] res2b res2v.
rewrite !land_foo.
do split.
+ move => k kb; rewrite !initiE  /=1:/# !Array768.initiE  /= 1:/#.
  rewrite  (_: (256 <= 512 + k && 512 + k < 512)=false) /= 1:/#.
  by rewrite !Array768.initiE  /= /#.
+ by move => k kb;rewrite !initiE  /= /#.

move => [#]  res3 [#] res3b res3v.
do split.
+ move => k kb; rewrite !initiE  /= 1:/# !Array768.initiE  /= 1:/#.
  case (512 <= k && k < 768); 1: by smt().
  case (256 <= k && k < 512); 1: by smt().
  by move => *; rewrite !initiE /= /#.

move => k [#] kbl kbh; rewrite !initiE  //= !Array768.initiE  /= 1:/# !mapiE //= !initiE //=.
case (512 <= k && k < 768).
+ move => kbb.
  rewrite (res3v (k - 512) _) 1:/# !mapiE /= 1..2:/# !initiE /= 1..2:/#.
  by rewrite !Array768.initiE /= 1:/# !Array768.initiE /= /#.

move => nkbb.
case (256 <= k && k < 512).
+ move => kbb.
  rewrite (res2v (k - 256) _) 1:/# !mapiE /= 1..2:/# !initiE /= 1..2:/#.
  by rewrite !Array768.initiE /= /#.

move => nkbb2.
have -> : 0 <= k < 256 by smt().
by rewrite (resv1 k _) 1:/# !mapiE /= 1..2:/# !initiE /= 1..2:/#.
qed.

lemma polyvec_add_ll  : islossless Jkem768.M.__polyvec_add2 by proc; unroll for 2;do 3! (wp; call poly_add_ll).

lemma polyvec_add_corr  _a _b ab bb:
    0 <= ab <= 6 => 0 <= bb <= 3 =>
   phoare[Jkem768.M.__polyvec_add2 :
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb 
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\ 
           forall k, 0 <= k < 768 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k] ]  = 1%r by 
  move => abb bbb; conseq polyvec_add_ll (polyvec_add_corr_h  _a _b ab bb abb bbb).

lemma polyvec_add_corr_impl  ab bb:
    0 <= ab <= 6 => 0 <= bb <= 3 =>
    forall _a _b,
   phoare[Jkem768.M.__polyvec_add2 :
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb 
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\ 
           forall k, 0 <= k < 768 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k] ]  = 1%r
  by move => abb bbb _a _b;  apply (polyvec_add_corr  _a _b ab bb abb bbb).

(******************************************************)

lemma polyvec_reduce_corr_h _a :
      hoare[Jkem768.M.__polyvec_reduce :
          _a = lift_array768 r ==> 
          _a = lift_array768 res /\
          forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)].
proof.
proc. 
unroll for 2.
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[i])))).
  
skip=>  &hr; rewrite /lift_array256 /lift_array768 => ->.
rewrite !land_foo; split => /=.

+ rewrite tP => k kb; rewrite !mapiE //= !initiE //= !Array768.initiE  /=.


move => res1 [#] res1v res1b res2 [#] res2v res2b res3 [#]  res3v res3b.

rewrite tP in res3v.
rewrite tP in res2v.
rewrite tP in res1v.

rewrite !tP.
split.
  move => k nkbb.
  case (256 <= k && k < 512).
  + move => kbb.
    move : (res2v (k - 256) _); 1:smt(); rewrite !mapiE /= 1..4:/# !initiE /= 1..2:/#.
    by rewrite !Array768.initiE  /=  /#. 

  move =>  nkbb2.
  rewrite !mapiE 1..2:/# !Array768.initiE  /=  1:/#.

  case (512 <= k && k < 768).
  + move => kbb.
  move : (res3v (k-512) _); 1:smt(); rewrite !mapiE /= 1,2:/# !initiE /= 1:/# !initiE /= 1:/# !initiE /= /#.

move => nkbb3.
rewrite !Array768.initiE  /=  1:/#.
rewrite !Array768.initiE  /=  1:/#.
  move : (res1v (k) _); 1:smt(); rewrite !mapiE /= 1..2:/# !initiE /= 1:/# /#.

smt(Array768.initiE).

qed.


(* TODO *)
lemma polyvec_reduce_ll: islossless Jkem768.M.__polyvec_reduce  by proc; unroll for 2;do 3! (wp; call poly_reduce_ll).

lemma polyvec_reduce_corr  _a :
      phoare[Jkem768.M.__polyvec_reduce :
          _a = lift_array768 r ==> 
          _a = lift_array768 res /\
          forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)]  = 1%r 
by conseq polyvec_reduce_ll (polyvec_reduce_corr_h  _a).

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

lemma polyvec_decompress_corr_h mem _p :
    hoare [Jkem768.M.__polyvec_decompress  :
             valid_ptr _p (3*320) /\
             Glob.mem = mem /\ to_uint ap = _p 
              ==>
             pos_bound768_cxq res 0 768 1 /\
             lift_polyvec res = decompress_polyvec 10 (decode10_vec (load_array960 mem _p)) /\
             Glob.mem = mem ].
admitted.

lemma polyvec_decompress_corr mem _p :
    phoare [Jkem768.M.__polyvec_decompress  :
             valid_ptr _p (3*320) /\
             Glob.mem = mem /\ to_uint ap = _p 
              ==>
             pos_bound768_cxq res 0 768 1 /\
             lift_polyvec res = decompress_polyvec 10 (decode10_vec (load_array960 mem _p)) /\
             Glob.mem = mem ] = 1%r.
admitted.

lemma polyvec_frombytes_corr_h mem _p :
    hoare [ Jkem768.M.__polyvec_frombytes :
             valid_ptr _p (3*384) /\
             Glob.mem = mem /\ to_uint ap = _p 
              ==>
             lift_array768 res = map incoeff (decode12_vec (load_array1152 mem _p))  /\
             pos_bound768_cxq res 0 768  2 /\
             Glob.mem = mem ].
admitted.

lemma polyvec_frombytes_corr mem _p :
    phoare [ Jkem768.M.__polyvec_frombytes :
             valid_ptr _p (3*384) /\
             Glob.mem = mem /\ to_uint ap = _p 
              ==>
             lift_array768 res = map incoeff (decode12_vec (load_array1152 mem _p))  /\
             pos_bound768_cxq res 0 768  2 /\
             Glob.mem = mem] = 1%r.
admitted.


(******************************************************)

lemma polyvec_ntt_correct_h _r:
   hoare[Jkem768.M.__polyvec_ntt :
        _r = r /\ signed_bound768_cxq r 0 768 2
          ==> 
        nttv (lift_polyvec _r) = lift_polyvec res /\
            pos_bound768_cxq res 0 768 2 ].
proof.
proc.
unroll for 2.
wp;ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[i])))).
skip; move => &hr; rewrite /signed_bound_cxq /signed_bound768_cxq => [# _r_def signed_bound_r].

split; 1: by auto => />;move => k kb kbl; rewrite initiE /#.

move =>  [#] r_eq_res1 ? res1 [#] res1v signed_bound_res1 res1_eq_res2.
split;1:by auto => />;move => k kb kbl; rewrite initiE 1:/# /=;smt(Array768.tP Array768.initiE).

move => signed_bound_r2 res2 [#] r_eq_res2 ? signed_bound_res2 />.

split; 1: by move => k k_bl kbh; rewrite !initiE 1:/# /= !initiE 1:/# /= !Array768.initiE 1:/# /= (fun_if W16.to_sint) /#.

move => signed_bound_r3 res3 r_eq_res3 signed_bound_res3 />.

split.
  rewrite /nttv /lift_polyvec !mapvE /= offunvK /vclamp /= eq_vectorP => k k_b.
  rewrite !offunvE //= k_b /= tP /= => i i_b.
  rewrite /lift_array256 /subarray256 /= !mapiE //.
  do (rewrite initiE 1:/# /= || rewrite fun_if /=).
  case (k = 0) => k_v.
    rewrite k_v /= i_b /=.
    have ->: !(256 <= i && i < 512). move : i_b => /#.
    have ->: !(512 <= i && i < 768). move : i_b => /#.
    rewrite (lift_array256_incoeff res1) 1:/# /= -res1v r_eq_res1 /= _r_def.
    congr. congr.
    apply Array256.tP => j j_b.
    by rewrite -lift_array256_incoeff 1:j_b initiE 1:j_b /= /lift_array256 /= mapiE // initiE 1:j_b //.
  move : k_v => ?.
  case (k = 1) => k_v.
    rewrite k_v /=.
    have ->: (256 <= 256 + i && 256 + i < 512). move : i_b => /#.
    have ->: !(512 <= 256 + i && 256 + i < 768). move : i_b => /#.
    rewrite (lift_array256_incoeff res2) 1:/# -r_eq_res2 /= _r_def /lift_array256  //.
    congr. congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_incoeff 1:j_b mapiE //=.
    do (rewrite initiE 1:/# /=).
    have ->: !(0 <= 256 + j && 256 + j < 256). move : j_b => /#.
    by trivial.
  move : k_v => ?.
  case (k = 2) => k_v.
    rewrite k_v /=.
    have ->: (512 <= 512 + i && 512 + i < 768). move : i_b => /#.
    rewrite (lift_array256_incoeff res3) 1:/# -r_eq_res3 /= _r_def.
    congr. congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_incoeff 1:j_b mapiE //=.
    do (rewrite initiE 1:/# /=).
    by smt().
  by smt().

  rewrite /pos_bound768_cxq => k k_b.
  do (rewrite initiE 1:k_b /= || rewrite (fun_if W16.to_sint)).
  move : (signed_bound_res3 (k - 512)) (signed_bound_res3 (k - 256)) (signed_bound_res1 k).
  by smt().
qed.

lemma polyvec_ntt_ll  : islossless Jkem768.M.__polyvec_ntt by  proc;unroll for 2;do 3! (wp;call(ntt_ll)).

lemma polyvec_ntt_corr _r:
   phoare[Jkem768.M.__polyvec_ntt :
        _r = r /\ signed_bound768_cxq r 0 768 2
          ==> 
       nttv (lift_polyvec _r) = lift_polyvec res /\
            pos_bound768_cxq res 0 768 2 ]  = 1%r 
by conseq polyvec_ntt_ll (polyvec_ntt_correct_h _r).

(******************************************************)

lemma polyvec_invntt_correct_h _r:
   hoare[Jkem768.M.__polyvec_invntt :
        _r = r /\
        signed_bound768_cxq r 0 768 4
          ==> 
            scale_polyvec (invnttv (lift_polyvec _r)) (incoeff Fq.SignedReductions.R) = lift_polyvec res /\
            forall (k : int), 0 <= k && k < 768 => b16 res.[k] (q) ].
proof.
proc.
unroll for 2.
wp;ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[i])))).

wp; skip; move => &hr; rewrite /signed_bound_cxq /signed_bound768_cxq => [ #_r_def signed_bound_r] *.

split; 1: by auto => />;move => k kb kbl; rewrite initiE /#.

move =>  [#] r_eq_res1 ? res1 [#] res1v signed_bound_res1 res1_eq_res2.
split;1:by auto => />;move => k kb kbl; rewrite initiE 1:/# /=;smt(Array768.tP Array768.initiE).

move => signed_bound_r2 res2 [#] r_eq_res2 ? signed_bound_res2 />.

split; 1: by move => k k_bl kbh; rewrite !initiE 1:/# /= !initiE 1:/# /= !Array768.initiE 1:/# /= (fun_if W16.to_sint) /#.

move => signed_bound_r3 res3 r_eq_res3 signed_bound_res3 />.

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
    by rewrite /= (lift_array256_incoeff res1) 1:/# -res1v -r_eq_res1 /= _r_def 
                   /lift_array256  //= mapiE //=.
  move => ?.
  case (k = 1) => k_v.
    rewrite k_v /=.
    have ->: (256 <= 256 + i && 256 + i < 512). move : i_b => /#.
    have ->: !(512 <= 256 + i && 256 + i < 768). move : i_b => /#.
    rewrite (lift_array256_incoeff res2) 1:/# -r_eq_res2 /= _r_def
         /lift_array256  //= mapiE //=.
    congr;congr;congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_incoeff 1:j_b !mapiE //=.
    do (rewrite initiE 1:/# /=).
    have ->: !(0 <= 256 + j && 256 + j < 256). move : j_b => /#.
    by trivial.
  move : k_v => ?.
  case (k = 2) => k_v.
    rewrite k_v /=.
    have ->: (512 <= 512 + i && 512 + i < 768). move : i_b => /#.
    rewrite (lift_array256_incoeff res3) 1:/# -r_eq_res3 /= _r_def
         /lift_array256  //= mapiE //=.
    congr;congr;congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_incoeff 1:j_b !mapiE //=.
    do (rewrite initiE 1:/# /=).
    by smt().
  by smt().

  move => k k_lb k_ub.
  do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
  move : (signed_bound_res3 (k - 512)) (signed_bound_res3 (k - 256)) (signed_bound_res1 k).
  by smt().
qed.

lemma polyvec_invntt_ll  :
      islossless Jkem768.M.__polyvec_invntt by  proc;unroll for 2;do 3! (wp;call(invntt_ll)).

lemma polyvec_invntt_corr _r:
   phoare[Jkem768.M.__polyvec_invntt :
    _r = r /\ signed_bound768_cxq r 0 768 4
      ==> 
     scale_polyvec (invnttv (lift_polyvec _r)) (incoeff Fq.SignedReductions.R) = lift_polyvec res /\
            forall (k : int), 0 <= k && k < 768 => b16 res.[k] (q) ]  = 1%r   
   by conseq polyvec_invntt_ll (polyvec_invntt_correct_h _r).

(******************************************************)

lemma polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 (_r : coeff Array256.t) :
  _p0 = scale (basemul _a0 _b0) (incoeff 169) =>
  _p1 = scale (basemul _a1 _b1) (incoeff 169) =>
  _p2 = scale (basemul _a2 _b2) (incoeff 169) =>
  (forall k, 0 <=  k < 256 =>
     _r.[k] = _p0.[k] + _p1.[k] + _p2.[k])  =>
  hoare [Jkem768.M.__polyvec_pointwise_acc : 
    _a0 = subarray256 (lift_array768 a) 0 /\
    _a1 = subarray256 (lift_array768 a) 1 /\
    _a2 = subarray256 (lift_array768 a) 2 /\
    _b0 = subarray256 (lift_array768 b) 0 /\
    _b1 = subarray256 (lift_array768 b) 1 /\
    _b2 = subarray256 (lift_array768 b)  2 /\
    signed_bound768_cxq a 0 768 2 /\ 
    signed_bound768_cxq b  0 768 2 
     ==> 
    lift_array256 res =  _r /\
    forall (k : int), 0 <= k && k < 256 => 
        bpos16 res.[k] (2 * q)
  ].
proof.
move => _p0_def _p1_def _p2_def _r_def; proc.
ecall (poly_reduce_corr_h (lift_array256 r)).
unroll for 5;wp.
have H:= (poly_add_corr_impl_h 6 3 _ _) => //; ecall (H (lift_array256 r) _p2); clear H.
call (poly_basemul_corr _a2 _b2).
have H:= (poly_add_corr_impl_h 3 3 _ _) => //; ecall (H _p0 _p1); clear H.
call (poly_basemul_corr _a1 _b1).
call (poly_basemul_corr _a0 _b0).

wp; skip; subst => &hr; rewrite /subarray256 /lift_array768 /lift_array256 /signed_bound768_cxq /signed_bound_cxq /=  => [#].

move => _a0_def _a1_def _a2_def _b0_def _b1_def _b2_def  signed_bound_a signed_bound_b.

split.
+ rewrite _a0_def _b0_def mapE.
  split.
  + apply Array256.ext_eq => k kb.
    by rewrite !initiE //= Array768.initiE /= 1:/# mapiE //= initiE //.
  split.
  +  apply Array256.ext_eq => k kb.
     by rewrite !initiE //= mapiE // 1: /# /= mapiE //= initiE //.
  by smt(Array256.initiE). 

move => [#] _a0_ddef _b0_ddef signed_bound_a0 signed_bound_b0 r0 [#] signed_bound_r0 a0tb0_eq_r0.
split. 
+ rewrite _a1_def _b1_def mapE.
  split.
  + apply Array256.ext_eq => k kb.
    by rewrite !initiE //= Array768.initiE /= 1:/# mapiE //= initiE //.
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
    by rewrite !initiE //= Array768.initiE /= 1:/# mapiE //= initiE //.
  split.
  +  apply Array256.ext_eq => k kb.
     by rewrite !initiE //= mapiE // 1: /# /= mapiE //= initiE //.
  by smt(Array256.initiE). 

move => [#] _a2_ddef _b2_ddef signed_bound_2 signed_bound_b2 r2 [#] signed_bound_r2 a2tb2_eq_r2.

do split; 1,2,3: by smt().

move => [#] _r2_ddef signed_bound_r2d signed_bound_res2d  ss2 [#] ss2b ss2v res3 [#] r3val r3b.

split; 1: by rewrite -r3val; rewrite tP => k kb; rewrite mapiE //= (ss2v k kb) mapiE //= res2val // _r_def //=.


by smt().
qed.

lemma polyvec_pointwise_acc_ll  :
      islossless Jkem768.M.__polyvec_pointwise_acc
by  proc;call poly_reduce_ll; unroll for 5;wp;do 2! (call poly_add_ll;call poly_basemul_ll); call poly_basemul_ll;auto.

lemma polyvec_pointwise_acc_corr _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 (_r : coeff Array256.t) :
  _p0 = scale (basemul _a0 _b0) (incoeff 169) =>
  _p1 = scale (basemul _a1 _b1) (incoeff 169) =>
  _p2 = scale (basemul _a2 _b2) (incoeff 169) =>
  (forall k, 0 <=  k < 256 =>
     _r.[k] = _p0.[k] + _p1.[k] + _p2.[k])  =>
  phoare [Jkem768.M.__polyvec_pointwise_acc : 
    _a0 = subarray256 (lift_array768 a) 0 /\
    _a1 = subarray256 (lift_array768 a) 1 /\
    _a2 = subarray256 (lift_array768 a) 2 /\
    _b0 = subarray256 (lift_array768 b) 0 /\
    _b1 = subarray256 (lift_array768 b) 1 /\
    _b2 = subarray256 (lift_array768 b)  2 /\
    signed_bound768_cxq a 0 768 2 /\ 
    signed_bound768_cxq b  0 768 2 
     ==> 
    lift_array256 res =  _r /\
    forall (k : int), 0 <= k && k < 256 => 
        bpos16 res.[k] (2 * q)
  ]  = 1%r by
move => *;conseq polyvec_pointwise_acc_ll (polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 _r _ _ _ _) => //.

(******************************************************)

lemma polyvec_tobytes_corr_h mem _p _a :
    hoare [Jkem768.M.__polyvec_tobytes  :
             pos_bound768_cxq a 0 768 2 /\
             lift_array768 a = _a /\
             valid_ptr _p (3*384) /\
             Glob.mem = mem /\ to_uint rp = _p
              ==>
             touches mem Glob.mem _p (3*384) /\
             load_array1152 Glob.mem _p = encode12_vec (map asint _a)
              ].
admitted.

lemma polyvec_tobytes_corr mem _p _a :
    phoare [Jkem768.M.__polyvec_tobytes  :
             pos_bound768_cxq a 0 768 2 /\
             lift_array768 a = _a /\
             valid_ptr _p (3*384) /\
             Glob.mem = mem /\ to_uint rp = _p
              ==>
             touches mem Glob.mem _p (3*384) /\
             load_array1152 Glob.mem _p = encode12_vec (map asint _a)
              ] = 1%r.
admitted.
(******************************************************)

lemma polyvec_pointwise_acc_corr_alg_h va vb :
  hoare [Jkem768.M.__polyvec_pointwise_acc :
    nttv va = lift_polyvec a /\
    nttv vb = lift_polyvec b /\
    signed_bound768_cxq a 0 768 2 /\
    signed_bound768_cxq b 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = scale (ntt (dotp va vb)) (incoeff 169)  ].
proof.
 move : (polyvec_pointwise_acc_corr_h (ntt va.[0])%PolyVec (ntt va.[1])%PolyVec 
      (ntt va.[2])%PolyVec (ntt vb.[0])%PolyVec (ntt vb.[1])%PolyVec (ntt vb.[2])%PolyVec 
          (scale (basemul (ntt va.[0]) (ntt vb.[0])) (incoeff 169))%PolyVec
          (scale (basemul (ntt va.[1]) (ntt vb.[1])) (incoeff 169))%PolyVec
          (scale (basemul (ntt va.[2]) (ntt vb.[2])) (incoeff 169))%PolyVec
          ((scale (basemul (ntt va.[0]) (ntt vb.[0])) (incoeff 169))%PolyVec &+
           (scale (basemul (ntt va.[1]) (ntt vb.[1])) (incoeff 169))%PolyVec &+
           (scale (basemul (ntt va.[2]) (ntt vb.[2])) (incoeff 169))%PolyVec)   _ _ _ _) => //=.
by move => k; rewrite /(&+) map2E map2E /= initE /= initE //= /#.
move => H; conseq (H).
move => &hr.
rewrite /nttv /lift_polyvec /lift_array256 /= /subarray256 /= /lift_array768 => />  H0 H1 H2 H3.
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

+ move : (H1 0 _) => //=.
  rewrite !mapvE !getvE !offunvE //= => ->; rewrite tP => k kb.
  by rewrite  !initiE // !mapiE 1,2:/# /= !initiE //.
+ move : (H1 1 _) => //.
  rewrite !mapvE !getvE !offunvE //= => ->; rewrite tP => k kb.
  by rewrite  !initiE // !mapiE 1:/# /= !initiE // mapiE // 1:/#.
+ move : (H1 2 _) => //.
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
rewrite map2E //=  !initiE => />.
rewrite map2E //=  !initiE => />.
rewrite nttZero.
rewrite /Rq.zero createE !initiE => />.
rewrite /basemul.
by ring.
qed.

lemma polyvec_pointwise_acc_corr_alg va vb :
  phoare [Jkem768.M.__polyvec_pointwise_acc :
    nttv va = lift_polyvec a /\
    nttv vb = lift_polyvec b /\
    signed_bound768_cxq a 0 768 2 /\
    signed_bound768_cxq b 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = scale (ntt (dotp va vb)) (incoeff 169)  ] = 1%r by
move => *;conseq polyvec_pointwise_acc_ll (polyvec_pointwise_acc_corr_alg_h va vb) => //.

module Aux = {
   proc inner_product(ai skpv : W16.t Array768.t) : W16.t Array256.t = {
        var polyi,r';
        polyi <@ Jkem768.M.__polyvec_pointwise_acc(ai,skpv);
        r' <@ Jkem768.M._poly_frommont(polyi);
        return r';
   }
}.

import Fq.SignedReductions.

lemma innerprod_corr_h va vb:
  hoare [ Aux.inner_product :
    nttv va = lift_polyvec ai /\
    nttv vb = lift_polyvec skpv /\
    signed_bound768_cxq ai 0 768 2 /\
    signed_bound768_cxq skpv 0 768 2
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
skip => &hr; rewrite /lift_polyvec /signed_bound768_cxq  /lift_polyvec /lift_array256 /signed_bound_cxq /scale /= !tP /=.
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
    signed_bound768_cxq ai 0 768 2 /\
    signed_bound768_cxq skpv 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = ntt (dotp va vb)  ]  = 1%r by
move => *;conseq inner_product_ll (innerprod_corr_h va vb) => //.

end MLKEM_PolyVec.

