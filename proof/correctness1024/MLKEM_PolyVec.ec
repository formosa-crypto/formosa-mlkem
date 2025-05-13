require import AllCore List IntDiv CoreMap.

from Jasmin require import JModel JMemory.
from JazzEC require import Array1152 Array960 Array256 Array384 Array128 Array1024.
from CryptoSpecs require import GFq Rq Serialization VecMat MLKEM Correctness1024.
require import W16extra.
require import Fq MLKEM_Poly NTT_Fq NTTAlgebra MLKEMFCLib.


from JazzEC require import Jkem1024.

theory MLKEM_PolyVec.

import NTT_Fq.
import GFq.
import Zq.
import MLKEM_Poly.
import KMatrix.
import PolyVec.
import PolyMat.

lemma land_foo  p q: p && q <=> p /\ q by smt().


lemma polyvec_csubq_corr_h ap :
      hoare[Jkem1024.M(Jkem1024.Syscall).__polyvec_csubq :
           ap = lift_array1024 r /\ pos_bound1024_cxq r 0 1024 2 
           ==>
           ap = lift_array1024 res /\ pos_bound1024_cxq res 0 1024 1 ] . 
proof.
proc.
unroll for 2.
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

split. 

+ rewrite tP => k kb; rewrite !mapiE 1,2:/# /=;  do 3!(rewrite initiE /= 1:/#).

case (512 <= k && k < 1024).
+ move => kb0 /=;move : (rva3 (k - 512) _); 1: smt().
  by rewrite !mapiE 1,2:/# //= !initiE 1:/# //= !initiE //= !initiE //= /#. 

move => case1;case (256 <= k && k < 512).
+ move => kb0 /=;move : (rva2 (k - 256) _); 1: smt().
  by rewrite !mapiE 1,2:/# //= !initiE 1:/# //= !initiE //= /#.  

move => case2;have : (0 <= k && k < 256); 1:smt().
move => kb0 /=;move : (rval (k) kb0).
  by rewrite !mapiE 1,2:/# //= !initiE /#.

by smt(Array1024.initiE).
qed. 

lemma polyvec_csubq_ll : islossless Jkem1024.M(Jkem1024.Syscall).__polyvec_csubq 
  by proc; unroll for 2;do 3! (wp;call poly_csubq_ll).

lemma polyvec_csubq_corr ap :
      phoare[Jkem1024.M(Jkem1024.Syscall).__polyvec_csubq :
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

lemma polyvec_compress_corr mem _p _a :
    equiv [Jkem1024.M(Jkem1024.Syscall).__polyvec_compress ~ EncDec.encode10_vec :
             pos_bound1024_cxq a{1} 0 1024 2 /\
             lift_array1024 a{1} = _a /\
             u{2} = map (compress 10) _a /\
             valid_ptr _p (3*320) /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             touches mem Glob.mem{1} _p (3*320) /\
             load_array960 Glob.mem{1} _p = res{2}
              ].
proof.
proc.
seq 5 3 : (#pre /\ to_uint i{1} = i{2} /\ i{2} = 0 /\ 
           to_uint j{1} = j{2} /\ j{2} = 0 /\
           pos_bound1024_cxq aa{1} 0 1024 1 /\ lift_array1024 aa{1} = _a).
wp => /=.
ecall{1} (polyvec_csubq_corr _a); 1: by auto => /#.

while (#{/~mem}{~i{2}=0}{~j{2}=0}pre /\ to_uint i{1} = i{2} /\ 0<=i{2}<=1024  /\ 
       to_uint j{1} = j{2} /\ 4*j{2} = 5*i{2} /\ i{2} %% 4 = 0 /\
       touches mem Glob.mem{1} _p j{2} /\ 
       (forall k, 0<=k<j{2} => 
         loadW8 Glob.mem{1} (_p + k) = c{2}.[k])); last first.  
+ auto => /> &1 &2; rewrite ultE of_uintK /load_array32 /loadW8 /ptr /= => 
    ? vpl vph ?? baa vaa; split; 1: by smt().
  move => mem' i' j' ra'; rewrite ultE of_uintK  /= => exit _ ibl ibh jv  im0 touch load.
  split; 1:  smt(). 
  by rewrite tP => k kb; rewrite initiE //= (load k _)/#.

unroll for {1} 2.
auto => />.
move =>  &1 &2 [#] ; rewrite /pos_bound1024_cxq /lift_array1024 /touches /storeW8  /loadW8 !tP /=.
rewrite  ultE of_uintK /= => 4? aav 8?. 
rewrite !to_uintD_small /=; 1..18: smt().

do split; 1..4:by smt(get_set_neqE_s). 

+ move => i0 i0b;rewrite !get_set_neqE_s /#. 

+ move => k kb kbh.
  case (k < to_uint j{1}).
  + move => neq; rewrite !get_set_neqE_s; 1..5: by smt().
    by rewrite !set_neqiE // /#.
  case (k = to_uint j{1}).
  + move => eq1 neq; do 4! (rewrite get_set_neqE_s; 1: by smt()).
    rewrite get_set_eqE_s; 1: by smt().
    do 4! (rewrite set_neqiE; 1,2:smt()).
    rewrite set_eqiE; 1,2:smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1}) _) //. 
    rewrite mapiE /=; 1: smt().
    rewrite -Fq.compress_impl_large //; 1: smt().
    by apply truncation1.  

  case (k = to_uint j{1} + 1).
  + move => eq2 neq1 neq; do 3! (rewrite get_set_neqE_s; 1: by smt()).
    rewrite get_set_eqE_s; 1: by smt().
    do 3! (rewrite set_neqiE; 1,2:smt()).
    rewrite set_eqiE; 1,2:smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1}) _) //. 
    rewrite mapiE /=; 1: smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1} + 1) _) 1:/#. 
    rewrite mapiE /=; 1: smt().
    rewrite -!Fq.compress_impl_large //; 1,2: smt().
    by apply truncation2.  

  case (k = to_uint j{1} + 2).
  + move => eq3 neq2 neq1 neq; do 2! (rewrite get_set_neqE_s; 1: by smt()).
    rewrite get_set_eqE_s; 1: by smt().
    do 2! (rewrite set_neqiE; 1,2:smt()).
    rewrite set_eqiE; 1,2:smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1}+1) _) 1:/#. 
    rewrite mapiE /=; 1: smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1} + 2) _) 1:/#. 
    rewrite mapiE /=; 1: smt().
    rewrite -!Fq.compress_impl_large //; 1,2: smt().
    by apply truncation2.  

  case (k = to_uint j{1} + 3).
  + move => eq4 neq3 neq2 neq1 neq; rewrite get_set_neqE_s; 1: by smt().
    rewrite get_set_eqE_s; 1: by smt().
    rewrite set_neqiE; 1,2:smt().
    rewrite set_eqiE; 1,2:smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1}+2) _) 1:/#. 
    rewrite mapiE /=; 1: smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1} + 3) _) 1:/#. 
    rewrite mapiE /=; 1: smt().
    rewrite -!Fq.compress_impl_large //; 1,2: smt().
    by apply truncation2.  

  move => neq4 neq3 neq2 neq1 neq.
  rewrite get_set_eqE_s; 1: by smt().
  rewrite set_eqiE; 1,2:smt().
  rewrite mapiE /=; 1: smt().
  rewrite -(aav (to_uint i{1}+3) _) 1:/#. 
  rewrite mapiE /=; 1: smt().
  rewrite -!Fq.compress_impl_large //; 1: smt().
  by apply truncation3.  

+ by rewrite ultE /= to_uintD_small; smt().

by rewrite ultE /= to_uintD_small; smt().
qed.

lemma i_polyvec_compress_corr _a :
    equiv [Jkem1024.M(Jkem1024.Syscall).__i_polyvec_compress ~ EncDec.encode10_vec :
             pos_bound1024_cxq a{1} 0 1024 2 /\
             lift_array1024 a{1} = _a /\
             u{2} = map (compress 10) _a
              ==>
             res{1} = res{2}
              ].
proof.
proc.
seq 5 3 : (#pre /\ to_uint i{1} = i{2} /\ i{2} = 0 /\ 
           to_uint j{1} = j{2} /\ j{2} = 0 /\
           pos_bound1024_cxq aa{1} 0 1024 1 /\ lift_array1024 aa{1} = _a).
wp => /=.
ecall{1} (polyvec_csubq_corr _a); 1: by auto => /#.

while (#{/~i{2}=0}{~j{2}=0}pre /\ to_uint i{1} = i{2} /\ 0<=i{2}<=1024  /\ 
       to_uint j{1} = j{2} /\ 4*j{2} = 5*i{2} /\ i{2} %% 4 = 0 /\ 
       (forall k, 0<=k<j{2} => 
         rp{1}.[k] = c{2}.[k])); last first.  
+ auto => /> &1 &2; rewrite ultE of_uintK /load_array32 /loadW8 /ptr /= => 
    ? ?? baa vaa; split; 1: by smt().
  move => i' j' ra'; rewrite ultE of_uintK  /= => rp exit _ ibl ibh jv  im0 prev.
  by rewrite tP => k kb /#.

unroll for {1} 2.
auto => />.
move =>  &1 &2 [#] ; rewrite /pos_bound1024_cxq /lift_array1024 !tP /=.
rewrite  ultE of_uintK /= => ?? aav 7?. 
rewrite !to_uintD_small /=; 1..9: smt().

do split; 1..4:by smt(). 

+ move => k kb kbh.
  case (k < to_uint j{1}).
  + by move => neq; rewrite !set_neqiE;  smt().
  case (k = to_uint j{1}).
  + move => eq1 neq; do 4! (rewrite set_neqiE; 1,2: by smt()).
    rewrite set_eqiE; 1,2: by smt().
    do 4! (rewrite set_neqiE; 1,2:smt()).
    rewrite set_eqiE; 1,2:smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1}) _) //. 
    rewrite mapiE /=; 1: smt().
    rewrite -Fq.compress_impl_large //; 1: smt().
    by apply truncation1.  

  case (k = to_uint j{1} + 1).
  + move => eq2 neq1 neq; do 3! (rewrite set_neqiE; 1,2: by smt()).
    rewrite set_eqiE; 1,2: by smt().
    do 3! (rewrite set_neqiE; 1,2:smt()).
    rewrite set_eqiE; 1,2:smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1}) _) //. 
    rewrite mapiE /=; 1: smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1} + 1) _) 1:/#. 
    rewrite mapiE /=; 1: smt().
    rewrite -!Fq.compress_impl_large //; 1,2: smt().
    by apply truncation2.  

  case (k = to_uint j{1} + 2).
  + move => eq3 neq2 neq1 neq; do 2! (rewrite set_neqiE; 1,2: by smt()).
    rewrite set_eqiE; 1,2: by smt().
    do 2! (rewrite set_neqiE; 1,2:smt()).
    rewrite set_eqiE; 1,2:smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1}+1) _) 1:/#. 
    rewrite mapiE /=; 1: smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1} + 2) _) 1:/#. 
    rewrite mapiE /=; 1: smt().
    rewrite -!Fq.compress_impl_large //; 1,2: smt().
    by apply truncation2.  

  case (k = to_uint j{1} + 3).
  + move => eq4 neq3 neq2 neq1 neq; rewrite set_neqiE; 1,2: by smt().
    rewrite set_eqiE; 1,2: by smt().
    rewrite set_neqiE; 1,2:smt().
    rewrite set_eqiE; 1,2:smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1}+2) _) 1:/#. 
    rewrite mapiE /=; 1: smt().
    rewrite mapiE /=; 1: smt().
    rewrite -(aav (to_uint i{1} + 3) _) 1:/#. 
    rewrite mapiE /=; 1: smt().
    rewrite -!Fq.compress_impl_large //; 1,2: smt().
    by apply truncation2.  

  move => neq4 neq3 neq2 neq1 neq.
  rewrite set_eqiE; 1,2: by smt().
  rewrite set_eqiE; 1,2:smt().
  rewrite mapiE /=; 1: smt().
  rewrite -(aav (to_uint i{1}+3) _) 1:/#. 
  rewrite mapiE /=; 1: smt().
  rewrite -!Fq.compress_impl_large //; 1: smt().
  by apply truncation3.  

+ by rewrite ultE /= to_uintD_small; smt().

by rewrite ultE /= to_uintD_small; smt().
qed.



lemma polyvec_add_corr_h _a _b ab bb :
      0 <= ab <= 6 => 0 <= bb <= 3 =>
      hoare[Jkem1024.M(Jkem1024.Syscall).__polyvec_add2 :
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
do split.
+ move => k kb; rewrite !initiE  /= 1:/# !Array1024.initiE  /= 1:/#.
  case (512 <= k && k < 1024); 1: by smt().
  case (256 <= k && k < 512); 1: by smt().
  by move => *; rewrite !initiE /= /#.

move => k [#] kbl kbh; rewrite !initiE  //= !Array1024.initiE  /= 1:/# !mapiE //= !initiE //=.
case (512 <= k && k < 1024).
+ move => kbb.
  rewrite (res3v (k - 512) _) 1:/# !mapiE /= 1..2:/# !initiE /= 1..2:/#.
  by rewrite !Array1024.initiE /= 1:/# !Array1024.initiE /= /#.

move => nkbb.
case (256 <= k && k < 512).
+ move => kbb.
  rewrite (res2v (k - 256) _) 1:/# !mapiE /= 1..2:/# !initiE /= 1..2:/#.
  by rewrite !Array1024.initiE /= /#.

move => nkbb2.
have -> : 0 <= k < 256 by smt().
by rewrite (resv1 k _) 1:/# !mapiE /= 1..2:/# !initiE /= 1..2:/#.
qed.

lemma polyvec_add_ll  : islossless Jkem1024.M(Jkem1024.Syscall).__polyvec_add2 by proc; unroll for 2;do 3! (wp; call poly_add_ll).

lemma polyvec_add_corr  _a _b ab bb:
    0 <= ab <= 6 => 0 <= bb <= 3 =>
   phoare[Jkem1024.M(Jkem1024.Syscall).__polyvec_add2 :
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
   phoare[Jkem1024.M(Jkem1024.Syscall).__polyvec_add2 :
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
      hoare[Jkem1024.M(Jkem1024.Syscall).__polyvec_reduce :
          _a = lift_array1024 r ==> 
          _a = lift_array1024 res /\
          forall k, 0 <= k < 1024 => bpos16 res.[k] (2*q)].
proof.
proc. 
unroll for 2.
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[i])))).
  
skip=>  &hr; rewrite /lift_array256 /lift_array1024 => ->.
rewrite !land_foo; split => /=.

+ rewrite tP => k kb; rewrite !mapiE //= !initiE //= !Array1024.initiE  /=.


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
    by rewrite !Array1024.initiE  /=  /#. 

  move =>  nkbb2.
  rewrite !mapiE 1..2:/# !Array1024.initiE  /=  1:/#.

  case (512 <= k && k < 1024).
  + move => kbb.
  move : (res3v (k-512) _); 1:smt(); rewrite !mapiE /= 1,2:/# !initiE /= 1:/# !initiE /= 1:/# !initiE /= /#.

move => nkbb3.
rewrite !Array1024.initiE  /=  1:/#.
rewrite !Array1024.initiE  /=  1:/#.
  move : (res1v (k) _); 1:smt(); rewrite !mapiE /= 1..2:/# !initiE /= 1:/# /#.

smt(Array1024.initiE).

qed.


(* TODO *)
lemma polyvec_reduce_ll: islossless Jkem1024.M(Jkem1024.Syscall).__polyvec_reduce  by proc; unroll for 2;do 3! (wp; call poly_reduce_ll).

lemma polyvec_reduce_corr  _a :
      phoare[Jkem1024.M(Jkem1024.Syscall).__polyvec_reduce :
          _a = lift_array1024 r ==> 
          _a = lift_array1024 res /\
          forall k, 0 <= k < 1024 => bpos16 res.[k] (2*q)]  = 1%r 
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

lemma polyvec_decompress_corr mem _p (_a : W8.t Array960.t) :
    equiv [Jkem1024.M(Jkem1024.Syscall).__polyvec_decompress ~ EncDec.decode10_vec :
             valid_ptr _p (3*320) /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array960 Glob.mem{1} _p = _a /\ u{2} = _a
              ==>
             pos_bound1024_cxq res{1} 0 1024 1 /\
             lift_polyvec res{1} = decompress_polyvec 10 res{2} /\
             Glob.mem{1} = mem ].
proof.
proc.
seq 4 3 : (#pre /\ to_uint i{1} = i{2} /\ i{2} = 0 /\ 
           to_uint j{1} = j{2} /\ j{2} = 0);
  first by auto => />.

while (#{~i{2}=0}{~j{2}=0}pre /\ to_uint i{1} = i{2} /\ 0<=i{2}<=1024  /\ 
       to_uint j{1} = j{2} /\ 4*j{2} = 5*i{2} /\ i{2} %% 4 = 0 /\
       (forall k, 0<=k<i{2} => 
          incoeff (to_sint r{1}.[k])  = decompress 10 c{2}.[k]) /\
       (forall k, 0<=k<i{2} => 
          0<=to_sint r{1}.[k] < q)); last first.  
+ auto => /> &1 &2; rewrite ultE of_uintK /load_array32 /loadW8 /ptr /= => 
    vpl vph ??; split; 1: by smt().
  move => i' j' r1 c2; rewrite ultE of_uintK  /= => exit _ ibl ibh jv  im0 vals bds.
  split; 1:  smt(). 
  rewrite /lift_polyvec /decompress_polyvec eq_vectorP => i ib.
  rewrite /lift_array256 /subarray256 !tP   !offunvE //=. 
  rewrite !setvE => k k_range.
  rewrite Array256.mapiE // Array256.initiE // offunvE // zerovE !offunvK /=.
  smt(Array256.mapiE Array256.initiE).

unroll for {1} 22; unroll for {1} 2.

auto => /> &1 &2 vpl vph il ih jv im0 prior priorb; rewrite ultE of_uintK /= => enter _.
rewrite /load_array960;split; 2: by rewrite ultE of_uintK /= to_uintD_small /#.
rewrite  !to_uintD_small /=; 1..18: by smt().
do split; 1..4: by smt().

+ move => k kl kh.
  case (k < to_uint i{1}); 1: by move => *;rewrite !set_neqiE /= /#.
  case (k = to_uint i{1}).
  + move => eq1 neq; do 3! (rewrite set_neqiE; 1,2: by smt()).
    rewrite set_eqiE; 1,2: by smt().
    do 3! (rewrite set_neqiE; 1,2:smt()).
    rewrite set_eqiE 1,2:/# !initiE /= 1,2:/#.
    rewrite -decompress_alt_decompress 1..2:/# /decompress_alt /= /to_sint. 
    congr; rewrite qE to_uint_truncateu16 /(W32.(`>>`) _ (W8.of_int 10)) W32.to_uint_shr //=.
    rewrite to_uintD_small /=; 1: rewrite to_uintM_small; 1,2: smt(untruncate1 W8.to_uint_cmp pow2_8).
    rewrite to_uintM_small /=;  1:smt(untruncate1 W8.to_uint_cmp pow2_8).
    rewrite modz_small; 1: smt(untruncate1 W8.to_uint_cmp pow2_8). 
    by rewrite /smod /=; smt(untruncate1 W8.to_uint_cmp pow2_8).  

  case (k = to_uint i{1} + 1).
  + move => eq2 neq1 neq; do 2! (rewrite set_neqiE; 1,2: by smt()).
    rewrite set_eqiE; 1,2: by smt().
    do 2! (rewrite set_neqiE; 1,2:smt()).
    rewrite set_eqiE 1,2:/# !initiE /= 1,2:/#.
    rewrite -decompress_alt_decompress 1..2:/# /decompress_alt /= /to_sint.
    congr; rewrite qE to_uint_truncateu16 /(W32.(`>>`) _ (W8.of_int 10)) W32.to_uint_shr //=.
    rewrite to_uintD_small /=; 1: rewrite to_uintM_small;  1,2: smt(untruncate2 W8.to_uint_cmp pow2_8).
    rewrite to_uintM_small /=;  1:smt(untruncate2 W8.to_uint_cmp pow2_8).
    rewrite modz_small; 1: smt(untruncate2 W8.to_uint_cmp pow2_8). 
    by rewrite /smod /=; smt(untruncate2 W8.to_uint_cmp pow2_8).  

  case (k = to_uint i{1} + 2).
  + move => eq3 neq2 neq1 neq; rewrite set_neqiE; 1,2: by smt().
    rewrite set_eqiE; 1,2: by smt().
    rewrite set_neqiE; 1,2:smt().
    rewrite set_eqiE 1,2:/# !initiE /= 1,2:/#.
    rewrite -decompress_alt_decompress 1..2:/# /decompress_alt /= /to_sint.
    congr; rewrite qE to_uint_truncateu16 /(W32.(`>>`) _ (W8.of_int 10)) W32.to_uint_shr //=.
    rewrite to_uintD_small /=; 1: rewrite to_uintM_small;  1,2: smt(untruncate3 W8.to_uint_cmp pow2_8).
    rewrite to_uintM_small /=;  1:smt(untruncate3 W8.to_uint_cmp pow2_8).
    rewrite modz_small; 1: smt(untruncate3 W8.to_uint_cmp pow2_8). 
    by rewrite /smod /=; smt(untruncate3 W8.to_uint_cmp pow2_8).  
    
  move => neq3 neq2 neq1 neq.
  rewrite !set_eqiE 1..4:/# !initiE /= 1,2:/#.
  rewrite -decompress_alt_decompress 1..2:/# /decompress_alt /= /to_sint.
  congr; rewrite qE to_uint_truncateu16 /(W32.(`>>`) _ (W8.of_int 10)) W32.to_uint_shr //=.
  rewrite to_uintD_small /=; 1: rewrite to_uintM_small;  1,2: smt(untruncate4 W8.to_uint_cmp pow2_8).
  rewrite to_uintM_small /=;  1:smt(untruncate4 W8.to_uint_cmp pow2_8).
  rewrite modz_small; 1: smt(untruncate4 W8.to_uint_cmp pow2_8). 
  by rewrite /smod /=; smt(untruncate4 W8.to_uint_cmp pow2_8).  

move => k kl kh.
case (k < to_uint i{1}); 1: by move => *;rewrite !set_neqiE /= /#.
case (k = to_uint i{1}).
+ move => eq1 neq; do 3! (rewrite set_neqiE; 1,2: by smt()).
  rewrite set_eqiE; 1,2: by smt().
  rewrite qE /to_sint to_uint_truncateu16 /(W32.(`>>`) _ (W8.of_int 10)) W32.to_uint_shr //=.
  rewrite to_uintD_small /=; 1: rewrite to_uintM_small;  1,2: smt(untruncate1 W8.to_uint_cmp pow2_8).
  rewrite to_uintM_small /=;  1:smt(untruncate1 W8.to_uint_cmp pow2_8).
  rewrite modz_small; 1: smt(untruncate1 W8.to_uint_cmp pow2_8). 
  by rewrite /smod /=; smt(untruncate1 W8.to_uint_cmp pow2_8).

case (k = to_uint i{1} + 1).
+ move => eq2 neq1 neq; do 2! (rewrite set_neqiE; 1,2: by smt()).
  rewrite set_eqiE; 1,2: by smt().
  rewrite qE /to_sint to_uint_truncateu16 /(W32.(`>>`) _ (W8.of_int 10)) W32.to_uint_shr //=.
  rewrite to_uintD_small /=; 1: rewrite to_uintM_small;  1,2: smt(untruncate2 W8.to_uint_cmp pow2_8).
  rewrite to_uintM_small /=;  1:smt(untruncate2 W8.to_uint_cmp pow2_8).
  rewrite modz_small; 1: smt(untruncate2 W8.to_uint_cmp pow2_8). 
  by rewrite /smod /=; smt(untruncate2 W8.to_uint_cmp pow2_8).

case (k = to_uint i{1} + 2).
+ move => eq3 neq2 neq1 neq; rewrite set_neqiE; 1,2: by smt().
  rewrite set_eqiE; 1,2: by smt().
  rewrite qE /to_sint to_uint_truncateu16 /(W32.(`>>`) _ (W8.of_int 10)) W32.to_uint_shr //=.
  rewrite to_uintD_small /=; 1: rewrite to_uintM_small;  1,2: smt(untruncate3 W8.to_uint_cmp pow2_8).
  rewrite to_uintM_small /=;  1:smt(untruncate3 W8.to_uint_cmp pow2_8).
  rewrite modz_small; 1: smt(untruncate3 W8.to_uint_cmp pow2_8). 
  by rewrite /smod /=; smt(untruncate3 W8.to_uint_cmp pow2_8).
    
move => neq3 neq2 neq1 neq.
rewrite !set_eqiE 1..2:/#.
  rewrite qE /to_sint to_uint_truncateu16 /(W32.(`>>`) _ (W8.of_int 10)) W32.to_uint_shr //=.
  rewrite to_uintD_small /=; 1: rewrite to_uintM_small;  1,2: smt(untruncate4 W8.to_uint_cmp pow2_8).
  rewrite to_uintM_small /=;  1:smt(untruncate4 W8.to_uint_cmp pow2_8).
  rewrite modz_small; 1: smt(untruncate4 W8.to_uint_cmp pow2_8). 
  by rewrite /smod /=; smt(untruncate4 W8.to_uint_cmp pow2_8).

qed.

(******************************************************)

lemma polyvec_ntt_correct_h _r:
   hoare[Jkem1024.M(Jkem1024.Syscall).__polyvec_ntt :
        _r = r /\ signed_bound1024_cxq r 0 1024 2
          ==> 
        nttv (lift_polyvec _r) = lift_polyvec res /\
            pos_bound1024_cxq res 0 1024 2 ].
proof.
proc.
unroll for 2.
wp;ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[i])))).
skip; move => &hr; rewrite /signed_bound_cxq /signed_bound1024_cxq => [# _r_def signed_bound_r].

split; 1: by auto => />;move => k kb kbl; rewrite initiE /#.

move =>  [#] r_eq_res1 ? res1 [#] res1v signed_bound_res1 res1_eq_res2.
split;1:by auto => />;move => k kb kbl; rewrite initiE 1:/# /=;smt(Array1024.tP Array1024.initiE).

move => signed_bound_r2 res2 [#] r_eq_res2 ? signed_bound_res2 />.

split; 1: by move => k k_bl kbh; rewrite !initiE 1:/# /= !initiE 1:/# /= !Array1024.initiE 1:/# /= (fun_if W16.to_sint) /#.

move => signed_bound_r3 res3 r_eq_res3 signed_bound_res3 />.

split.
  rewrite /nttv /lift_polyvec !mapvE /= offunvK /vclamp /= eq_vectorP => k k_b.
  rewrite !offunvE //= k_b /= tP /= => i i_b.
  rewrite /lift_array256 /subarray256 /= !mapiE //.
  do (rewrite initiE 1:/# /= || rewrite fun_if /=).
  case (k = 0) => k_v.
    rewrite k_v /= i_b /=.
    have ->: !(256 <= i && i < 512). move : i_b => /#.
    have ->: !(512 <= i && i < 1024). move : i_b => /#.
    rewrite (lift_array256_incoeff res1) 1:/# /= -res1v r_eq_res1 /= _r_def.
    congr. congr.
    apply Array256.tP => j j_b.
    by rewrite -lift_array256_incoeff 1:j_b initiE 1:j_b /= /lift_array256 /= mapiE // initiE 1:j_b //.
  move : k_v => ?.
  case (k = 1) => k_v.
    rewrite k_v /=.
    have ->: (256 <= 256 + i && 256 + i < 512). move : i_b => /#.
    have ->: !(512 <= 256 + i && 256 + i < 1024). move : i_b => /#.
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
    have ->: (512 <= 512 + i && 512 + i < 1024). move : i_b => /#.
    rewrite (lift_array256_incoeff res3) 1:/# -r_eq_res3 /= _r_def.
    congr. congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_incoeff 1:j_b mapiE //=.
    do (rewrite initiE 1:/# /=).
    by smt().
  by smt().

  rewrite /pos_bound1024_cxq => k k_b.
  do (rewrite initiE 1:k_b /= || rewrite (fun_if W16.to_sint)).
  move : (signed_bound_res3 (k - 512)) (signed_bound_res3 (k - 256)) (signed_bound_res1 k).
  by smt().
qed.

lemma polyvec_ntt_ll  : islossless Jkem1024.M(Jkem1024.Syscall).__polyvec_ntt by  proc;unroll for 2;do 3! (wp;call(ntt_ll)).

lemma polyvec_ntt_corr _r:
   phoare[Jkem1024.M(Jkem1024.Syscall).__polyvec_ntt :
        _r = r /\ signed_bound1024_cxq r 0 1024 2
          ==> 
       nttv (lift_polyvec _r) = lift_polyvec res /\
            pos_bound1024_cxq res 0 1024 2 ]  = 1%r 
by conseq polyvec_ntt_ll (polyvec_ntt_correct_h _r).

(******************************************************)

lemma polyvec_invntt_correct_h _r:
   hoare[Jkem1024.M(Jkem1024.Syscall).__polyvec_invntt :
        _r = r /\
        signed_bound1024_cxq r 0 1024 4
          ==> 
            scale_polyvec (invnttv (lift_polyvec _r)) (incoeff Fq.SignedReductions.R) = lift_polyvec res /\
            forall (k : int), 0 <= k && k < 1024 => b16 res.[k] (q) ].
proof.
proc.
unroll for 2.
wp;ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[i])))).

wp; skip; move => &hr; rewrite /signed_bound_cxq /signed_bound1024_cxq => [ #_r_def signed_bound_r] *.

split; 1: by auto => />;move => k kb kbl; rewrite initiE /#.

move =>  [#] r_eq_res1 ? res1 [#] res1v signed_bound_res1 res1_eq_res2.
split;1:by auto => />;move => k kb kbl; rewrite initiE 1:/# /=;smt(Array1024.tP Array1024.initiE).

move => signed_bound_r2 res2 [#] r_eq_res2 ? signed_bound_res2 />.

split; 1: by move => k k_bl kbh; rewrite !initiE 1:/# /= !initiE 1:/# /= !Array1024.initiE 1:/# /= (fun_if W16.to_sint) /#.

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
    have ->: !(512 <= i && i < 1024). move : i_b => /#.
    by rewrite /= (lift_array256_incoeff res1) 1:/# -res1v -r_eq_res1 /= _r_def 
                   /lift_array256  //= mapiE //=.
  move => ?.
  case (k = 1) => k_v.
    rewrite k_v /=.
    have ->: (256 <= 256 + i && 256 + i < 512). move : i_b => /#.
    have ->: !(512 <= 256 + i && 256 + i < 1024). move : i_b => /#.
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
    have ->: (512 <= 512 + i && 512 + i < 1024). move : i_b => /#.
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
      islossless Jkem1024.M(Jkem1024.Syscall).__polyvec_invntt by  proc;unroll for 2;do 3! (wp;call(invntt_ll)).

lemma polyvec_invntt_corr _r:
   phoare[Jkem1024.M(Jkem1024.Syscall).__polyvec_invntt :
    _r = r /\ signed_bound1024_cxq r 0 1024 4
      ==> 
     scale_polyvec (invnttv (lift_polyvec _r)) (incoeff Fq.SignedReductions.R) = lift_polyvec res /\
            forall (k : int), 0 <= k && k < 1024 => b16 res.[k] (q) ]  = 1%r   
   by conseq polyvec_invntt_ll (polyvec_invntt_correct_h _r).

(******************************************************)

lemma polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 (_r : coeff Array256.t) :
  _p0 = scale (basemul _a0 _b0) (incoeff 169) =>
  _p1 = scale (basemul _a1 _b1) (incoeff 169) =>
  _p2 = scale (basemul _a2 _b2) (incoeff 169) =>
  (forall k, 0 <=  k < 256 =>
     _r.[k] = _p0.[k] + _p1.[k] + _p2.[k])  =>
  hoare [Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc : 
    _a0 = subarray256 (lift_array1024 a) 0 /\
    _a1 = subarray256 (lift_array1024 a) 1 /\
    _a2 = subarray256 (lift_array1024 a) 2 /\
    _b0 = subarray256 (lift_array1024 b) 0 /\
    _b1 = subarray256 (lift_array1024 b) 1 /\
    _b2 = subarray256 (lift_array1024 b)  2 /\
    signed_bound1024_cxq a 0 1024 2 /\ 
    signed_bound1024_cxq b  0 1024 2 
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

wp; skip; subst => &hr; rewrite /subarray256 /lift_array1024 /lift_array256 /signed_bound1024_cxq /signed_bound_cxq /=  => [#].

move => _a0_def _a1_def _a2_def _b0_def _b1_def _b2_def  signed_bound_a signed_bound_b.

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

do split; 1,2,3: by smt().

move => [#] _r2_ddef signed_bound_r2d signed_bound_res2d  ss2 [#] ss2b ss2v res3 [#] r3val r3b.

split; 1: by rewrite -r3val; rewrite tP => k kb; rewrite mapiE //= (ss2v k kb) mapiE //= res2val // _r_def //=.


by smt().
qed.

lemma polyvec_pointwise_acc_ll  :
      islossless Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc
by  proc;call poly_reduce_ll; unroll for 5;wp;do 2! (call poly_add_ll;call poly_basemul_ll); call poly_basemul_ll;auto.

lemma polyvec_pointwise_acc_corr _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 (_r : coeff Array256.t) :
  _p0 = scale (basemul _a0 _b0) (incoeff 169) =>
  _p1 = scale (basemul _a1 _b1) (incoeff 169) =>
  _p2 = scale (basemul _a2 _b2) (incoeff 169) =>
  (forall k, 0 <=  k < 256 =>
     _r.[k] = _p0.[k] + _p1.[k] + _p2.[k])  =>
  phoare [Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc : 
    _a0 = subarray256 (lift_array1024 a) 0 /\
    _a1 = subarray256 (lift_array1024 a) 1 /\
    _a2 = subarray256 (lift_array1024 a) 2 /\
    _b0 = subarray256 (lift_array1024 b) 0 /\
    _b1 = subarray256 (lift_array1024 b) 1 /\
    _b2 = subarray256 (lift_array1024 b)  2 /\
    signed_bound1024_cxq a 0 1024 2 /\ 
    signed_bound1024_cxq b  0 1024 2 
     ==> 
    lift_array256 res =  _r /\
    forall (k : int), 0 <= k && k < 256 => 
        bpos16 res.[k] (2 * q)
  ]  = 1%r by
move => *;conseq polyvec_pointwise_acc_ll (polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 _r _ _ _ _) => //.

(******************************************************)

lemma polyvec_tobytes_corr mem _p _a :
    equiv [Jkem1024.M(Jkem1024.Syscall).__polyvec_tobytes ~ EncDec.encode12_vec :
             pos_bound1024_cxq a{1} 0 1024 2 /\
             lift_array1024 a{1} = _a /\
             (forall i, 0<=i<1024 => 0 <= a{2}.[i] <q) /\
             map incoeff a{2} = _a /\  valid_ptr _p (3*384) /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             touches mem Glob.mem{1} _p (3*384) /\
             load_array1152 Glob.mem{1} _p = res{2}
              ].
proc => /=.
unroll for {1} 3.
wp;ecall (poly_tobytes_corr 
            (lift_array256 ((Array256.init (fun (i : int) => a{1}.[2 * 256 + i])))) (to_uint pp{1}) Glob.mem{1}).
wp;ecall (poly_tobytes_corr 
            (lift_array256 ((Array256.init (fun (i : int) => a{1}.[256 + i])))) (to_uint pp{1}) Glob.mem{1}).
wp;ecall (poly_tobytes_corr 
            (lift_array256 ((Array256.init (fun (i : int) => a{1}.[i])))) (to_uint pp{1}) Glob.mem{1}).

wp;skip =>   &1 &2; rewrite /pos_bound1024_cxq /pos_bound256_cxq /lift_array256 /lift_array1024 /subarray256 !tP.
move => [#] bnda1 bnda2 vals pbl pbh => ??. 

split.

+ do split => />; 1..2:by move => *; rewrite initiE /=; smt().
  + move => i ??; rewrite !mapiE/= 1..2:/#  !initiE //=; smt(mapiE).
  + by smt(W64.to_uint_cmp).
  + by smt(W64.to_uint_cmp pow2_64).
  
rewrite /touches;move => ????[#] ?touch0<-? ppl; split. 

+ do split => />;1: by  move => *; rewrite !initiE 1:/# /= !initiE  /#.
  + by move => *; rewrite initiE /=; smt().
  + by rewrite tP => i ib; rewrite !mapiE // !initiE //= !initiE; smt(mapiE).
  + by rewrite to_uintD_small; smt(W64.to_uint_cmp pow2_64).
  by rewrite to_uintD_small; smt(W64.to_uint_cmp pow2_64).

rewrite /touches;move =>/= [#] ????????[#]?touch1<-; split. 

+ do split => />; 1: by move => *; rewrite !initiE 1:/# /= !initiE 1:/# /= !initiE  /=  /#.
  + by move => *; rewrite initiE /=; smt().
  + by rewrite tP => i ib; rewrite !mapiE // !initiE //= !initiE 1:/#  /= !initiE  /= ; smt(mapiE).
  + by rewrite to_uintD_small; smt(W64.to_uint_cmp pow2_64).
   by rewrite /ppl !to_uintD_small /=; smt(W64.to_uint_cmp pow2_64).

rewrite /touches;move => /= ????[#]?touch2 <-.

do split. 
+ move => k kb; move : (touch0 k _) (touch1 (k - 384) _) (touch2 (k - 1024) _); 1..7: smt(). 
  by rewrite !to_uintD_small /=; smt(W64.to_uint_cmp pow2_64).

rewrite /load_array1152 /fromarray384 /load_array384  tP => k kb; rewrite !initiE //=.
case (0 <= k < 384). 
+ move => kbb;  rewrite  Array384.initiE //=.
  move : (touch2 (k - 1024) _); 1:smt(). 
  rewrite to_uintD_small /=; 1: smt(W64.to_uint_cmp pow2_64).
  rewrite /ppl /= to_uintD_small /=; 1: smt(W64.to_uint_cmp pow2_64).
  rewrite (_: to_uint rp{1} + 1024 + (k - 1024) = to_uint rp{1} + k);1 : by ring.
  move : (touch1 (k - 384) _); 1:smt(). 
  rewrite to_uintD_small /=; smt(W64.to_uint_cmp pow2_64).

move=> nkb.
case (384 <= k < 1024).
+ move => kbb;  rewrite Array384.initiE 1:/# /=.
  move : (touch2 (k - 1024) _); 1:smt(). 
  rewrite !to_uintD_small /=; 1..3: smt(W64.to_uint_cmp pow2_64).
  rewrite (_: to_uint rp{1} + 1024 + (k - 1024) = to_uint rp{1} + k);1 : by ring.
  rewrite (_: to_uint rp{1} + 384 + (k - 384) = to_uint rp{1} + k);1 : by ring.
  by smt().


+ move => kbb;  rewrite Array384.initiE 1:/# /=.
  rewrite !to_uintD_small /=; 1..3:   smt(W64.to_uint_cmp pow2_64).
  rewrite (_: to_uint rp{1} + 1024 + (k - 1024) = to_uint rp{1} + k);1 : by ring.
  by smt().
qed.

lemma polyvec_frombytes_corr mem _p :
    equiv [Jkem1024.M(Jkem1024.Syscall).__polyvec_frombytes ~ EncDec.decode12_vec :
             valid_ptr _p (3*384) /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array1152 Glob.mem{1} _p = a{2}
              ==>
             map W16.to_sint res{1} = res{2}  /\
             pos_bound1024_cxq  res{1}0 1024  2 /\
             Glob.mem{1} = mem ].
proc => /=.  
unroll for {1} 4.
wp;ecall (poly_frombytes_corr Glob.mem{1} (to_uint pp{1}) (load_array384 Glob.mem{1} (_p + 1024))).
wp;ecall (poly_frombytes_corr Glob.mem{1} (to_uint pp{1}) (load_array384 Glob.mem{1} (_p + 384))).
wp;ecall (poly_frombytes_corr Glob.mem{1} (to_uint pp{1}) (load_array384 Glob.mem{1} (_p))).
auto => /> &1. 
rewrite /pos_bound1024_cxq /pos_bound256_cxq /load_array384 /load_array1152 /subarray384 /lift_array1024 /fromarray256 !tP.
move => pbl pbh. 

split; 1: by  smt(Array384.initiE Array1152.initiE).

move => *;split; 1: by rewrite to_uintD_small /=;  smt(Array384.initiE Array1152.initiE).

move => *;split; 1: by rewrite to_uintD_small /=;  smt(Array384.initiE Array1152.initiE).

move => *;split.

+ rewrite tP => k kb.
  rewrite !mapiE //= !initiE  //= initiE //=.
  case ( 512 <= k && k < 1024). 
  + by move => kbb; rewrite (_: 0<= k <256 = false) 1:/# /= (_: 256<= k <512 = false) 1:/# /= mapiE 1:/# /=.
  case ( 256 <= k && k < 512).
  + by move => kbb nkbb; rewrite (_: 0<= k <256 = false) 1:/#  /= mapiE 1:/# /=.
  by move => nkbb nkbbb; rewrite initiE 1:/# (_: 0<= k <256 = true) 1:/# /= mapiE /#.

move => k kb; rewrite initiE 1:/# /=.
case ( 512 <= k && k < 1024);1: by smt(). 
case ( 256 <= k && k < 512). 
+ by move => kbb; rewrite (_: 512<= k <1024 = false) 1:/# /= initiE /#.
by move => kbb nkbb; rewrite !initiE 1:/# /= kbb /= !initiE /#.
qed.

(******************************************************)

lemma polyvec_pointwise_acc_corr_alg_h va vb :
  hoare [Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc :
    nttv va = lift_polyvec a /\
    nttv vb = lift_polyvec b /\
    signed_bound1024_cxq a 0 1024 2 /\
    signed_bound1024_cxq b 0 1024 2
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
  phoare [Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc :
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
        polyi <@ Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc(ai,skpv);
        r' <@ Jkem1024.M(Jkem1024.Syscall)._poly_frommont(polyi);
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

