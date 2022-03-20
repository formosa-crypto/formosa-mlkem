require import AllCore List IntDiv CoreMap.
from Jasmin require  import JModel JMemory.
require import W16extra Array1152 Array960 Array256 Array128 Array768 .
require import Fq.
require import KyberPoly.
require import NTT_Fq.
require import Kyber.


require import Jindcpa.

theory KyberPolyVec.

import NTT_Fq.
import Zq.
import KyberPoly.
import Matrix_.
(* AUX *)

op lift_polyvec(row :  W16.t Array768.t, c : int) = 
   Array256.init (fun i => inFq (W16.to_sint row.[c*256 + i])). 

op lift_vector(vec: W16.t Array768.t) : vector =
    Vector.offunv (fun i => lift_polyvec vec i).

op scale_vector(v : vector, c : Fq) : vector = 
   Vector.offunv (fun i => (scale ((Vector.tofunv v) i) c)).

lemma nttv_add (v1 v2 : vector) :
   nttv (v1 + v2) = 
    nttv v1 + nttv v2.
proof.
rewrite /nttv /mapv. 
rewrite eq_vectorP => x H.
rewrite !offunvE //= offunvK /vclamp H //= !offunvE //=. 
by rewrite add_comm_ntt.
qed.

lemma mulvec a b :
   dotp a b = 
    invntt (basemul (ntt a.[0]) (ntt b.[0])) &+
    invntt (basemul (ntt a.[1]) (ntt b.[1])) &+
    invntt (basemul (ntt a.[2]) (ntt b.[2])).
proof.
rewrite -!mul_comm_ntt !invnttK.
rewrite /dotp => />. 
rewrite /Big.BAdd.big /predT /kvec => />.
by ring.
qed.

op lift_array768 (p : W16.t Array768.t) =
  Array768.map (fun x => inFq (W16.to_sint x)) p.

op signed_bound768_cxq (coefs : W16.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => b16 coefs.[k] (c * q).

op pos_bound768_cxq (coefs : W16.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

op pos_bound768_b (coefs : W16.t Array768.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] b.

lemma lift_array768_inFq (a : W16.t t) k :
  0 <= k < 768 =>
  inFq (to_sint a.[k]) = (lift_array768 a).[k].
proof. by move => H; rewrite /lift_array768 mapE /= initE H. qed.

lemma lift_array256_inFq (a : W16.t Array256.t) k :
  0 <= k < 256 =>
  inFq (to_sint a.[k]) = (lift_array256 a).[k].
proof. by move => H; rewrite /lift_array256 mapE /= initE H. qed.

op [a] subarray256(x : 'a Array768.t, i : int) =
   Array256.of_list witness (sub x (i*256) 256).

lemma lift_array256_sub_768 (a: W16.t Array768.t) (b : W16.t Array256.t) x n :
  0 <= n < 3 =>
  lift_array768 a = x =>
  (forall (k : int), 0 <= k < 256 => inFq (to_sint b.[k]) = x.[k+256*n]) =>
  (forall (k : int), 0 <= k < 256 => b.[k] = a.[k+256*n]) =>
  lift_array256 b = subarray256 x n.
proof.
  rewrite /lift_array768 => H H0 H1 H2.
  rewrite /lift_array256 tP => j H3.
  rewrite mapE /of_list !initE /=.
  by smt(nth_sub).
qed.

lemma inFq_lift_array256 (x : W16.t t) y n :
  0 <= n < 3 =>
  (forall (k : int), 0 <= k < 256 => 
     inFq (to_sint x.[k+n*256]) = (lift_array256 y).[k]) =>
  lift_array256 y = subarray256 (lift_array768 x) n.
proof.
  move => H H0; rewrite tP => j H1.
  rewrite -H0 // /of_list initE H1 /= nth_sub // /lift_array768 mapiE // /#. 
qed.

lemma lift_array768E (x : W16.t t) k :
  0 <= k < 768 =>
  (lift_array768 x).[k] = inFq (to_sint x.[k]).
proof.  by move => ?; rewrite /lift_array768 mapiE //. qed.

lemma lift_array768_eq (x y : W16.t t) :
  (forall k, 0 <= k < 256 =>
    inFq (to_sint x.[k]) = (subarray256 (lift_array768 y) 0).[k]) =>
  (forall k, 0 <= k < 256 =>
    inFq (to_sint x.[k+256]) = (subarray256 (lift_array768 y) 1).[k]) =>
  (forall k, 0 <= k < 256 =>
    inFq (to_sint x.[k+512]) = (subarray256 (lift_array768 y) 2).[k]) =>
               lift_array768 x = lift_array768 y.
proof.
  rewrite /subarray256; move => H H0 H1; rewrite tP => k H2; rewrite lift_array768E //.
  case (k < 256) => H3; 1: by rewrite H 1:/# get_of_list 1:/# nth_sub 1:/#.
  case (k < 512) => H4.
  + move : (H0 (k-256)).
    have ->: 0 <= k - 256 < 256 by smt().
    by move=> /= ->; rewrite /= get_of_list 1:/# nth_sub 1,2:/#.
  move : (H1 (k-512)).
  have -> /= H5: 0 <= k - 512 < 256 by smt().
  by rewrite H5 get_of_list 1:/# nth_sub 1,2:/#.
qed.

lemma lift_array768P (x y : W16.t t) :
  lift_array768 x = lift_array768 y <=>
  (forall k, 0 <= k < 768 => inFq (to_sint x.[k]) = inFq (to_sint y.[k])).
proof. 
  split; first by rewrite tP => H *; rewrite -!lift_array768E // H //. 
  by rewrite tP => H *; rewrite !lift_array768E // H //. 
qed.

op lift_array768_32 (p : W32.t Array768.t) =
  Array768.map (fun x => inFq (W32.to_sint x)) p.

op bpos32 a b = (0 <= W32.to_sint a && to_sint a < b)
  axiomatized by bpos32E.

op pos_bound768_cxq_32 (coefs : W32.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos32 coefs.[k] (c * q).

op pos_bound768_b_32 (coefs : W32.t Array768.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos32 coefs.[k] b.

lemma to_sint_unsigned32 : forall (x : W32.t), 
    0 <= to_sint x =>
    to_sint x = to_uint x.
proof.
  move => x; rewrite W32.to_sintE /smod.
  move : (W32.to_uint_cmp x) => /> ? ?.
  by case (2147483648 <= to_uint x) => ? // /#. 
qed.    

op load_array960 (m : global_mem_t) (p : address) : W8.t Array960.t = 
  (Array960.init (fun (i : int) => m.[p + i])).

op load_array1152 (m : global_mem_t) (p : address) : W8.t Array1152.t = 
  (Array1152.init (fun (i : int) => m.[p + i])).

(* TODO: write aux lemma to deal w/ subarrays cleanly *)

(* END AUX *)

lemma polyvec_csubq_corr_h ap :
      hoare[ M.__polyvec_csubq :
           ap = lift_array768 r /\ pos_bound768_cxq r 0 768 2 
           ==>
           ap = lift_array768 res /\ pos_bound768_cxq res 0 768 1 ] . 
proof.
proc.
wp;ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[i])))).

skip; move => &hr [#].
rewrite /lift_array256 /pos_bound256_cxq /lift_array768 /pos_bound768_cxq /= !tP.
move => apv bnd /=;split; 1: by move => *; rewrite initiE /#.

move => bnd1 result [#]; rewrite !tP => rval rbnd.
split; 1: by move => *; rewrite !initiE //= !Array768.initiE /= /#.

move => bnd2 resul2 [#]; rewrite !tP => rva2 rbnd2.
split; 1:by  move => *; rewrite !initiE //=;
  rewrite !Array768.initiE /= 1: /# !Array768.initiE /= /#.

move => bnd3 resul3 [#]; rewrite !tP =>  rva3 rbnd3.
split; last  by move => *; rewrite !initiE //=;
  rewrite !Array768.initiE /= 1: /# !Array768.initiE /= /#.

move => k kb; rewrite /= !mapiE //= !initiE //= !initiE //=.
move : (apv k kb); rewrite mapiE //= => ->.
case (512 <= k && k < 768).
+ move => kb0 /=;move : (rva3 (k - 512) _); 1: smt().
  by rewrite !mapiE 1,2:/# //= !initiE 1:/# //= !initiE //= !initiE //= /#. 

move => case1;case (256 <= k && k < 512).
+ move => kb0 /=;move : (rva2 (k - 256) _); 1: smt().
  by rewrite !mapiE 1,2:/# //= !initiE 1:/# //= !initiE //= /#.  

move => case2;have : (0 <= k && k < 256); 1:smt().
move => kb0 /=;move : (rval (k) kb0).
  by rewrite !mapiE 1,2:/# //= !initiE /#.

qed. 

lemma polyvec_csubq_ll : islossless M.__polyvec_csubq 
  by proc; do 3! (wp;call poly_csubq_ll).

lemma polyvec_csubq_corr ap :
      phoare[ M.__polyvec_csubq :
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
  rewrite !(modz_small _ 256) 1,2:/# !(modz_small _ 16) 1,2:/#.
  case (!(d <= k < 6+d)); first by smt(W16.get_out).
  move => *; rewrite !get_to_uint.  
  rewrite !of_uintK /= !(modz_small _ 18446744073709551616) 1,2:/# !(modz_small _ 65536) 1,2:/# /=.
  by rewrite (_: 1024 = 2^10); move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 10 (k+10-d)) => // /#.
  
have -> : 1023 = 2^10-1 by auto;rewrite !and_mod //.
rewrite /truncateu16 !W64.and_mod //= /(`<<`) /(`>>`) /=. 
  rewrite to_uintD_small.
+ rewrite !(modz_small _ 256) 1,2:/# !(modz_small _ 16) 1,2:/#.
  rewrite !of_uintK /= !(modz_small _ 18446744073709551616) 1,2:/#.
  rewrite W16.to_uint_shr 1:/# W16.to_uint_shl 1:/# /=.
  by rewrite !of_uintK /=  !(modz_small _ 65536) /#.
rewrite shlMP /= 1:/# shrDP /= 1:/# !of_uintK /=. 
rewrite !(modz_small _ 18446744073709551616) 1,2:/# .
rewrite !(modz_small _ 256) 1,2:/#  !(modz_small _ 16) 1,2:/#.
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
    equiv [ M.__polyvec_compress ~ EncDec.encode10_vec :
             pos_bound768_cxq a{1} 0 768 2 /\
             lift_array768 a{1} = _a /\
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
           pos_bound768_cxq aa{1} 0 768 1 /\ lift_array768 aa{1} = _a).
wp => /=.
ecall{1} (polyvec_csubq_corr _a); 1: by auto => /#.

while (#{/~mem}{~i{2}=0}{~j{2}=0}pre /\ to_uint i{1} = i{2} /\ 0<=i{2}<=768  /\ 
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
move =>  &1 &2 [#] ; rewrite /pos_bound768_cxq /lift_array768 /touches /storeW8  /loadW8 !tP /=.
rewrite  ultE of_uintK /= => 4? aav 8?. 
rewrite !to_uintD_small /=; 1..18: smt().

do split; 1..5:by smt(get_set_neqE_s). 

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

lemma polyvec_add_corr_h _a _b ab bb :
      0 <= ab <= 6 => 0 <= bb <= 3 =>
      hoare[ M.__polyvec_add2 :
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb 
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\ 
           forall k, 0 <= k < 768 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k]]. 
proof.
move => abb bbb;  move : (poly_add_corr_impl ab bb abb bbb) => H.
proc.
wp;ecall (H (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i]))) (lift_array256 (Array256.init (fun i => b.[(2 * 256) + i])))).
wp;ecall (H (lift_array256 (Array256.init (fun i => r.[256 + i]))) (lift_array256 (Array256.init (fun i => b.[256 + i])))).
wp;ecall (H (lift_array256 (Array256.init (fun i => r.[i]))) (lift_array256 (Array256.init (fun i => b.[i])))).
clear H.
auto => /> &hr.
rewrite /signed_bound768_cxq /signed_bound_cxq /lift_array768 /lift_array256 /=.
move => [#] 2?.
do split; 1..2: by move => *; rewrite !initiE //= /#.
move => H H0 res1 resb1 resv1.
do split.
+ by move => k kb; move : (resb1 k kb); rewrite !initiE  //= !Array768.initiE  /#.
+ by move => k kb; move : (resb1 k kb); rewrite !initiE  //= /#.

move => vsofar bsofar res2 res2b res2v.
do split.
+ move => k kb; rewrite !initiE  //= !Array768.initiE  /= 1:/#.
  rewrite  (_: (256 <= 512 + k && 512 + k < 512)=false) /= 1:/#.
  by rewrite !Array768.initiE  /= /#.
+ by move => k kb;rewrite !initiE  /= /#.

move => vsofar2 bsofar2 res3 res3b res3v.
do split.
+ move => k kb; rewrite !initiE  //= !Array768.initiE  /= 1:/#.
  case (512 <= k && k < 768); 1: by smt().
  case (256 <= k && k < 512); 1: by smt().
  by move => *; rewrite !initiE /= /#.

move => k kbl kbh; rewrite !initiE  //= !Array768.initiE  /= 1:/# !mapiE //= !initiE //=.
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

lemma polyvec_add_ll  : islossless M.__polyvec_add2 by proc; do 3! (wp; call poly_add_ll).

lemma polyvec_add_corr  _a _b ab bb:
    0 <= ab <= 6 => 0 <= bb <= 3 =>
   phoare[ M.__polyvec_add2 :
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb 
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\ 
           forall k, 0 <= k < 768 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k] ]  = 1%r by 
  move => abb bbb; conseq polyvec_add_ll (polyvec_add_corr_h  _a _b ab bb abb bbb).

(******************************************************)

lemma polyvec_reduce_corr_h _a :
      hoare[ M.__polyvec_reduce :
          _a = lift_array768 r ==> 
          _a = lift_array768 res /\
          forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)].
proof.
proc. 
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp;ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[i])))).
  
auto => /> &hr; rewrite /lift_array256 /lift_array768=> res1 res1v res1b res2 res2v res2b res3 res3v res3b.

rewrite tP in res3v.
rewrite tP in res2v.
rewrite tP in res1v.

split.

+ rewrite tP => k kb; rewrite !mapiE //= !initiE //= !Array768.initiE  /= 1:/#.
  case (512 <= k && k < 768).
  + move => kbb.
    move : (res3v (k - 512) _); 1:smt(); rewrite !mapiE /= 1,2:/# !initiE /= 1:/#.
    by rewrite !Array768.initiE  /= 1:/# !Array768.initiE  /= /#. 

  move => nkbb.
  case (256 <= k && k < 512).
  + move => kbb.
    move : (res2v (k - 256) _); 1:smt(); rewrite !mapiE /= 1,2:/# !initiE /= 1:/#.
    by rewrite !Array768.initiE  /=  /#. 

  move => nkbb2.
  rewrite !Array768.initiE  /=  1:/#.
  have -> : 0 <= k < 256 by smt().
  by move : (res1v (k) _); 1:smt(); rewrite !mapiE /= 1,2:/# !initiE /= /#.

move => k kbl kbh.

case (512 <= k && k < 768).
+ move => kbb.
  rewrite !initiE /= 1:/#.
  by rewrite !Array768.initiE  /= 1:/# !Array768.initiE  /= /#. 

move => nkbb.
case (256 <= k && k < 512).
+ move => kbb.
  rewrite !initiE /= 1:/#.
  by rewrite !Array768.initiE  /= 1:/# !Array768.initiE  /= /#. 

move => nkbb2.
rewrite !Array768.initiE  /=  1:/#.
rewrite !Array768.initiE  /=  1:/#.
by rewrite !initiE /= /#.
qed.


(* TODO *)
lemma polyvec_reduce_ll: islossless M.__polyvec_reduce  by proc; do 3! (wp; call poly_reduce_ll).

lemma polyvec_reduce_corr  _a :
      phoare[ M.__polyvec_reduce :
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

lemma polyvec_decompress_corr mem _p (_a : W8.t Array960.t) :
    equiv [ M.__polyvec_decompress ~ EncDec.decode10_vec :
             valid_ptr _p (3*320) /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array960 Glob.mem{1} _p = _a /\ u{2} = _a
              ==>
             pos_bound768_cxq res{1} 0 768 1 /\
             lift_vector res{1} = decompress_polyvec 10 res{2} /\
             Glob.mem{1} = mem ].
proof.
proc.
seq 4 3 : (#pre /\ to_uint i{1} = i{2} /\ i{2} = 0 /\ 
           to_uint j{1} = j{2} /\ j{2} = 0);
  first by auto => />.

while (#{~i{2}=0}{~j{2}=0}pre /\ to_uint i{1} = i{2} /\ 0<=i{2}<=768  /\ 
       to_uint j{1} = j{2} /\ 4*j{2} = 5*i{2} /\ i{2} %% 4 = 0 /\
       (forall k, 0<=k<i{2} => 
          inFq (to_sint r{1}.[k])  = decompress 10 c{2}.[k]) /\
       (forall k, 0<=k<i{2} => 
          0<=to_sint r{1}.[k] < q)); last first.  
+ auto => /> &1 &2; rewrite ultE of_uintK /load_array32 /loadW8 /ptr /= => 
    vpl vph ??; split; 1: by smt().
  move => i' j' r1 c2; rewrite ultE of_uintK  /= => exit _ ibl ibh jv  im0 vals bds.
  split; 1:  smt(). 
  rewrite /lift_vector /decompress_polyvec eq_vectorP => i ib; rewrite  !offunvE //= /lift_polyvec . 
  case (i = 0); 1: by move => iv; rewrite tP => x xv; rewrite !initiE //= /#.
  case (i = 1); 1: by move => iv niv; rewrite tP => x xv; rewrite !initiE //= /#.
  by move => *;rewrite tP => x xv; rewrite !initiE //= /#.
    
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
   hoare[ M.__polyvec_ntt :
        _r = r /\ signed_bound768_cxq r 0 768 2
          ==> 
        nttv (lift_vector _r) = lift_vector res /\
            pos_bound768_cxq res 0 768 2 ].
proof.
proc; sp.
wp.
ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp.
ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp.
ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[i])))).
skip; move => &hr [_r_def signed_bound_r] />.
split.
rewrite /signed_bound_cxq => k k_b;  rewrite /signed_bound768_cxq in signed_bound_r; rewrite initiE 1:/# (signed_bound_r k) 1:/#.

move => signed_bound_r1 res1 r_eq_res1 signed_bound_res1.
split.
rewrite /signed_bound_cxq => k k_b.
rewrite initiE 1:k_b /= initiE 1:/# /= (fun_if W16.to_sint).
have ->: !(0 <= 256 + k && 256 + k < 256).
  move : k_b => /#.
rewrite /signed_bound768_cxq /b16 in signed_bound_r; rewrite (signed_bound_r (256 + k)) 1:/#.

move => signed_bound_r2 res2 r_eq_res2 signed_bound_res2 />.
split.
rewrite /signed_bound_cxq => k k_b.
do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
have ->: !(256 <= 512 + k && 512 + k < 512).
  move : k_b => /#.
have ->: !(0 <= 512 + k && 512 + k < 256).
  move : k_b => /#.
simplify.
rewrite /signed_bound768_cxq /b16 in signed_bound_r; rewrite (signed_bound_r (512 + k)) 1:/#.

move => signed_bound_r3 res3 r_eq_res3 signed_bound_res3 />.
(* ========== *)
(* TODO: replace with aux lemmas *)
split.
  rewrite /nttv /lift_vector /mapv offunvK /vclamp /= eq_vectorP => k k_b.
  rewrite !offunvE //= k_b /= tP /= => i i_b.
  rewrite /lift_polyvec /=.
  do (rewrite initiE 1:/# /= || rewrite fun_if /=).
  case (k = 0) => k_v.
    rewrite k_v /= i_b /=.
    have ->: !(256 <= i && i < 512). move : i_b => /#.
    have ->: !(512 <= i && i < 768). move : i_b => /#.
    rewrite (lift_array256_inFq res1) 1:/# -r_eq_res1 /= _r_def.
    congr. congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_inFq 1:j_b initiE 1:j_b /= initiE 1:j_b //.
  move : k_v => ?.
  case (k = 1) => k_v.
    rewrite k_v /=.
    have ->: (256 <= 256 + i && 256 + i < 512). move : i_b => /#.
    have ->: !(512 <= 256 + i && 256 + i < 768). move : i_b => /#.
    rewrite (lift_array256_inFq res2) 1:/# -r_eq_res2 /= _r_def.
    congr. congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_inFq 1:j_b.
    do (rewrite initiE 1:/# /=).
    have ->: !(0 <= 256 + j && 256 + j < 256). move : j_b => /#.
    trivial.
  move : k_v => ?.
  case (k = 2) => k_v.
    rewrite k_v /=.
    have ->: (512 <= 512 + i && 512 + i < 768). move : i_b => /#.
    rewrite (lift_array256_inFq res3) 1:/# -r_eq_res3 /= _r_def.
    congr. congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_inFq 1:j_b.
    do (rewrite initiE 1:/# /=).
    smt(@Array768 @Array256).
  smt(@Array768 @Array256).

  rewrite /pos_bound768_cxq => k k_b.
  do (rewrite initiE 1:k_b /= || rewrite (fun_if W16.to_sint)).
  move : (signed_bound_res3 (k - 512)) (signed_bound_res2 (k - 256)) (signed_bound_res1 k).
  smt(bpos16E @Int @Array768 @Array256).
  (* ========== *)
qed.

lemma polyvec_ntt_ll  : islossless M.__polyvec_ntt by  proc;do 3! (wp;call(ntt_ll)).

lemma polyvec_ntt_corr _r:
   phoare[ M.__polyvec_ntt :
        _r = r /\
        signed_bound768_cxq r 0 768 2
          ==> 
            nttv (lift_vector _r) = lift_vector res /\
            pos_bound768_cxq res 0 768 2 ]  = 1%r 
by conseq polyvec_ntt_ll (polyvec_ntt_correct_h _r).

(******************************************************)

lemma polyvec_invntt_correct_h _r:
   hoare[ M.__polyvec_invntt :
        _r = r /\
        signed_bound768_cxq r 0 768 2
          ==> 
            scale_vector (invnttv (lift_vector _r)) (inFq Fq.SignedReductions.R) = lift_vector res /\
            forall (k : int), 0 <= k && k < 768 => b16 res.[k] (q + 1) ].
proof.
proc; sp.
wp.
ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp.
ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp.
ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[i])))).

wp; skip; move => &hr [_r_def signed_bound_r] * />.
split.
rewrite /signed_bound_cxq => k k_b;  rewrite /signed_bound768_cxq in signed_bound_r; rewrite initiE 1:/# (signed_bound_r k) 1:/#.

move => signed_bound_r1 res1 r_eq_res1 signed_bound_res1.
split.
rewrite /signed_bound_cxq => k k_b.
rewrite initiE 1:k_b /= initiE 1:/# /= (fun_if W16.to_sint).
have ->: !(0 <= 256 + k && 256 + k < 256).
  move : k_b => /#.
rewrite /signed_bound768_cxq /b16 in signed_bound_r; rewrite (signed_bound_r (256 + k)) 1:/#.

move => signed_bound_r2 res2 r_eq_res2 signed_bound_res2 />.
split.
rewrite /signed_bound_cxq => k k_b.
do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
have ->: !(256 <= 512 + k && 512 + k < 512).
  move : k_b => /#.
have ->: !(0 <= 512 + k && 512 + k < 256).
  move : k_b => /#.
simplify.
rewrite /signed_bound768_cxq /b16 in signed_bound_r; rewrite (signed_bound_r (512 + k)) 1:/#.

move => signed_bound_r3 res3 r_eq_res3 signed_bound_res3 />.
(* ========== *)
(* TODO: replace with aux lemmas *)
split.
  rewrite /scale_vector /invnttv /lift_vector /mapv offunvK /vclamp /= eq_vectorP => k k_b.
  rewrite !offunvE //= k_b /= tP /= => i i_b.
  rewrite offunvK /vclamp /= k_b /=.
  rewrite /lift_polyvec /=.
  do (rewrite initiE 1:/# /= || rewrite fun_if /=).
  case (k = 0) => k_v.
    rewrite k_v /= i_b /=.
    have ->: !(256 <= i && i < 512). move : i_b => /#.
    have ->: !(512 <= i && i < 768). move : i_b => /#.
    rewrite (lift_array256_inFq res1) 1:/# -r_eq_res1 /= _r_def.
    do congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_inFq 1:j_b initiE 1:j_b /= initiE 1:j_b //.
  move : k_v => ?.
  case (k = 1) => k_v.
    rewrite k_v /=.
    have ->: (256 <= 256 + i && 256 + i < 512). move : i_b => /#.
    have ->: !(512 <= 256 + i && 256 + i < 768). move : i_b => /#.
    rewrite (lift_array256_inFq res2) 1:/# -r_eq_res2 /= _r_def.
    do congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_inFq 1:j_b.
    do (rewrite initiE 1:/# /=).
    have ->: !(0 <= 256 + j && 256 + j < 256). move : j_b => /#.
    trivial.
  move : k_v => ?.
  case (k = 2) => k_v.
    rewrite k_v /=.
    have ->: (512 <= 512 + i && 512 + i < 768). move : i_b => /#.
    rewrite (lift_array256_inFq res3) 1:/# -r_eq_res3 /= _r_def.
    do congr.
    apply Array256.tP => j j_b.
    rewrite -lift_array256_inFq 1:j_b.
    do (rewrite initiE 1:/# /=).
    smt(@Array768 @Array256).
  smt(@Array768 @Array256).

  move => k k_lb k_ub.
  do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
  move : (signed_bound_res3 (k - 512)) (signed_bound_res2 (k - 256)) (signed_bound_res1 k).
  smt(bpos16E @Int @Array768 @Array256).
  (* ========== *)
qed.

lemma polyvec_invntt_ll  :
      islossless M.__polyvec_invntt by  proc;do 3! (wp;call(invntt_ll)).

lemma polyvec_invntt_corr _r:
   phoare[ M.__polyvec_invntt :
        _r = r /\
        signed_bound768_cxq r 0 768 2
          ==> 
            scale_vector (invnttv (lift_vector _r)) (inFq Fq.SignedReductions.R) = lift_vector res /\
            forall (k : int), 0 <= k && k < 768 => b16 res.[k] (q + 1) ]  = 1%r   
   by conseq polyvec_invntt_ll (polyvec_invntt_correct_h _r).

(******************************************************)
(* FIXME ?? *)
lemma polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 (_r : Fq Array256.t) :
  _p0 = scale (basemul _a0 _b0) (inFq 169) =>
  _p1 = scale (basemul _a1 _b1) (inFq 169) =>
  _p2 = scale (basemul _a2 _b2) (inFq 169) =>
  (forall k, 0 <=  k < 256 =>
     _r.[k] = _p0.[k] + _p1.[k] + _p2.[k])  =>
  hoare [ M.__polyvec_pointwise_acc : 
    _a0 = lift_polyvec a 0 /\
    _a1 = lift_polyvec a 1 /\
    _a2 = lift_polyvec a 2 /\
    _b0 = lift_polyvec b 0 /\
    _b1 = lift_polyvec b 1 /\
    _b2 = lift_polyvec b 2 /\
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
have H:= (poly_add_corr_impl 6 3 _ _) => //; ecall (H (lift_array256 r) _p2); clear H.
call (poly_basemul_corr _a2 _b2).
have H:= (poly_add_corr_impl 3 3 _ _) => //; ecall (H _p0 _p1); clear H.
call (poly_basemul_corr _a1 _b1).
call (poly_basemul_corr _a0 _b0).

wp; skip; subst => &hr [_a0_def [_a1_def [_a2_def [_b0_def [_b1_def [_b2_def [signed_bound_a signed_bound_b]]]]]]] * />.

split.
+ rewrite _a0_def _b0_def /lift_polyvec /lift_array256 mapE.
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split; first by move : signed_bound_a; smt(@Array256 @Array768).
  by move : signed_bound_b; smt(@Array256 @Array768).

move => _a0_ddef _b0_ddef signed_bound_a0 signed_bound_b0 r0 signed_bound_r0 a0tb0_eq_r0.
split.
+ rewrite _a1_def _b1_def /lift_polyvec /lift_array256 mapE.
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split; first by move : signed_bound_a; smt(@Array256 @Array768).
  by move : signed_bound_b; smt(@Array256 @Array768).

move => _a1_ddef _b1_ddef signed_bound_a1 signed_bound_b1 r1 signed_bound_r1 a1tb1_eq_r1.
split.
admit. (*
+ move : (basemul_scales (lift_polyvec a{hr} 0) (lift_polyvec b{hr} 0) (lift_array256 r0)) (basemul_scales (lift_polyvec a{hr} 1) (lift_polyvec b{hr} 1) (lift_array256 r1)) => /#.
*)
move => a0tb0f_eq_r0 a1tb1f_eq_r1 res1 signed_bound_res1 res1_def.

split.
+ rewrite _a2_def _b2_def /lift_polyvec /lift_array256 mapE.
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split; first by move : signed_bound_a; smt(@Array256 @Array768).
  by move : signed_bound_b; smt(@Array256 @Array768).

move => _a2_ddef _b2_ddef signed_bound_a2 signed_bound_b2 r2 signed_bound_r2 a2tb2_eq_r2.
split.
admit. (*
+ move : (basemul_scales (lift_polyvec a{hr} 2) (lift_polyvec b{hr} 2) (lift_array256 r2)) => /#.
*)
move => a2tb2f_eq_r2 res2 signed_bound_res2 res2_eq_a2tb2red r4 r2_eq_r4 signed_bound_r4.
rewrite -r2_eq_r4.
apply Array256.ext_eq => x x_b.
rewrite /lift_array256 mapiE 1:x_b /= res2_eq_a2tb2red 1:x_b.
rewrite /lift_array256 mapiE 1:x_b /= res1_def 1:x_b.
rewrite _r_def 1:x_b.
rewrite _a0_def _a1_def _a2_def /= /lift_polyvec /=.
rewrite _b0_def _b1_def _b2_def /= /lift_polyvec /=.
do congr; by apply Array256.ext_eq => k k_b; rewrite -lift_array256_inFq 1:k_b; smt(@Array256 @Array768).
qed.

(* TODO *)
lemma polyvec_pointwise_acc_ll  :
      islossless M.__polyvec_pointwise_acc
by  proc;call poly_reduce_ll; do 2! (call poly_add_ll;call poly_basemul_ll); call poly_basemul_ll;auto.

lemma polyvec_pointwise_acc_corr _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 (_r : Fq Array256.t) :
  _p0 = scale (basemul _a0 _b0) (inFq 169) =>
  _p1 = scale (basemul _a1 _b1) (inFq 169) =>
  _p2 = scale (basemul _a2 _b2) (inFq 169) =>
  (forall k, 0 <=  k < 256 =>
     _r.[k] = _p0.[k] + _p1.[k] + _p2.[k])  =>
  phoare [ M.__polyvec_pointwise_acc : 
    _a0 = lift_polyvec a 0 /\
    _a1 = lift_polyvec a 1 /\
    _a2 = lift_polyvec a 2 /\
    _b0 = lift_polyvec b 0 /\
    _b1 = lift_polyvec b 1 /\
    _b2 = lift_polyvec b 2 /\
    signed_bound768_cxq a 0 768 2 /\ 
    signed_bound768_cxq b  0 768 2 
     ==> 
    lift_array256 res =  _r /\
    forall (k : int), 0 <= k && k < 256 => 
        bpos16 res.[k] (2 * q)
  ]  = 1%r by
move => *;conseq polyvec_pointwise_acc_ll (polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 _r _ _ _ _) => //.

(******************************************************)
(* TODO *)
print compress_polyvec.
lemma polyvec_tobytes_corr mem _p _a :
    equiv [ M.__polyvec_tobytes ~ EncDec.encode12_vec :
             pos_bound768_cxq a{1} 0 768 2 /\
             lift_array768 a{1} = _a /\ u{2} = map (compress 12) _a /\
             valid_range W8 Glob.mem{1} _p (3*384) /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             touches mem Glob.mem{1} _p (3*384) /\
             load_array1152 Glob.mem{1} _p = res{2}
              ].
admitted.

(* TODO *) 
lemma polyvec_frombytes_corr mem _p (_a : W8.t Array1152.t) :
    equiv [ M.__polyvec_frombytes ~ EncDec.decode12_vec :
             valid_range W8 Glob.mem{1} _p (3*384) /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array1152 Glob.mem{1} _p = _a
              ==>
             lift_array768 res{1}= map (decompress 12) res{2} /\
             signed_bound768_cxq  res{1}0 256  1 /\
             Glob.mem{1} = mem ].
admitted.

(******************************************************)

lemma polyvec_pointwise_acc_corr_alg_h va vb :
  hoare [ M.__polyvec_pointwise_acc :
    nttv va = lift_vector a /\
    nttv vb = lift_vector b /\
    signed_bound768_cxq a 0 768 2 /\
    signed_bound768_cxq b 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = scale (ntt (dotp va vb)) (inFq 169)  ].
proof.
 move : (polyvec_pointwise_acc_corr_h (ntt va.[0]) (ntt va.[1]) 
               (ntt va.[2]) (ntt vb.[0]) (ntt vb.[1]) (ntt vb.[2]) 
          (scale (basemul (ntt va.[0]) (ntt vb.[0])) (inFq 169))
          (scale (basemul (ntt va.[1]) (ntt vb.[1])) (inFq 169))
          (scale (basemul (ntt va.[2]) (ntt vb.[2])) (inFq 169))
          ((scale (basemul (ntt va.[0]) (ntt vb.[0])) (inFq 169)) &+
           (scale (basemul (ntt va.[1]) (ntt vb.[1])) (inFq 169)) &+
           (scale (basemul (ntt va.[2]) (ntt vb.[2])) (inFq 169)))   _ _ _ _) => //=.
by move => k; rewrite /(&+) map2E map2E /= initE /= initE //= /#.
move => H; conseq (H).
move => &hr.
rewrite /nttv /lift_vector /lift_polyvec  => />  H0 H1 H2 H3.
move : H0 H1; rewrite !eq_vectorP => /> H0 H1. 
do split.
by move : (H0 0 _) => //; rewrite !offunvE => />.
by move : (H0 1 _) => //; rewrite !offunvE => />.
by move : (H0 2 _) => //; rewrite !offunvE => />.
by move : (H1 0 _) => //; rewrite !offunvE => />.
by move : (H1 1 _) => //; rewrite !offunvE => />.
by move : (H1 2 _) => //; rewrite !offunvE => />.
move => &hr [#] H0 H1 H2 H3 result H4.
move : H4 =>  [# H4 H5].
split; first by rewrite /signed_bound_cxq; smt().
rewrite H4 /dotp  /kvec //=.
rewrite !Big.BAdd.big_consT //= Big.BAdd.big_nil //=. 
rewrite /scale !add_comm_ntt !mul_comm_ntt.  
apply Array256.ext_eq => x xb.
rewrite !mapE   => />.
rewrite /(&+) map2E //=  !initiE => />.
rewrite /(&+) map2E //=  !initiE => />.
rewrite /(&+) map2E //=  !initiE => />.
rewrite map2E //=  !initiE => />.
rewrite map2E //=  !initiE => />.
rewrite nttZero.
rewrite /Poly.zero createE !initiE => />.
rewrite /basemul.
by ring.
qed.

lemma polyvec_pointwise_acc_corr_alg va vb :
  phoare [ M.__polyvec_pointwise_acc :
    nttv va = lift_vector a /\
    nttv vb = lift_vector b /\
    signed_bound768_cxq a 0 768 2 /\
    signed_bound768_cxq b 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = scale (ntt (dotp va vb)) (inFq 169)  ] = 1%r by
move => *;conseq polyvec_pointwise_acc_ll (polyvec_pointwise_acc_corr_alg_h va vb) => //.

module Aux = {
   proc inner_product(ai skpv : W16.t Array768.t) : W16.t Array256.t = {
        var polyi,r';
        polyi <@M.__polyvec_pointwise_acc(ai,skpv);
        r' <@M._poly_frommont(polyi);
        return r';
   }
}.

lemma innerprod_corr_h va vb:
  hoare [ Aux.inner_product :
    nttv va = lift_vector ai /\
    nttv vb = lift_vector skpv /\
    signed_bound768_cxq ai 0 768 2 /\
    signed_bound768_cxq skpv 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = ntt (dotp va vb)  ].
proof.
proc.
seq 1 : (#pre /\
    signed_bound_cxq polyi 0 256 2 /\
    lift_array256 polyi =  scale (ntt (dotp va vb)) (inFq 169)
    ).
by call (polyvec_pointwise_acc_corr_alg_h va vb); auto => />.

ecall(poly_frommont_corr_h (map W16.to_sint polyi)).
skip => &hr.
move => /> VA VB AB BB H H0. 
admit.
(* 
rewrite (Array256.tP (Array256.map W16.to_sint result)
                         (map
        (fun (x : int) =>
           (Fq.SignedReductions.SREDC (x * (Fq.SignedReductions.R * (Fq.SignedReductions.R * Fq.SignedReductions.R ^ 0) %% q)%IntDiv)))
        (map W16.to_sint polyi{hr}))).
move => rval.

split.
rewrite /signed_bound_cxq qE => k kb => />.
move : (rval k kb); rewrite !mapiE /R => />.
rewrite qE (_: 65536 ^ 0 = 1); first by smt(@Int).
rewrite (_: 65536 * (65536 * 1) %% 3329 = 1353); first smt().
move => ->.
move : (Fq.SignedReductions.SREDCp_corr (to_sint polyi{hr}.[k] * 1353) _ _); rewrite qE /R => />.
by move : (H k kb); rewrite qE => />; smt(@W16).
by  smt(@W16).

move :H0; rewrite /lift_array256 /scale.
rewrite (Array256.tP (map (fun (x : W16.t) => inFq (to_sint x)) polyi{hr})
        (map (transpose Zq.( * ) (inFq 169)) (ntt (dotp va vb)))) => H0.
apply Array256.ext_eq => k kb.
move : (H0 k kb).
move : (rval k kb).
rewrite !mapiE /R => /> -> H1.
rewrite qE (_: 65536 ^ 0 = 1); first by smt(@Int).
rewrite (_: 65536 * (65536 * 1) %% 3329 = 1353); first smt().
move : (Fq.SignedReductions.SREDCp_corr (to_sint polyi{hr}.[k] * 1353) _ _); rewrite qE /R => />.
by move : (H k kb); rewrite qE => />; smt(@W16).
move => H2 H3 H4.
rewrite (_: inFq (Fq.SignedReductions.SREDC (to_sint polyi{hr}.[k] * 1353)) = inFq (to_sint polyi{hr}.[k] * 1353 * 169 %% 3329)); first by rewrite -H4 -qE -inFqK asintK.
rewrite -qE -(inFqK (to_sint polyi{hr}.[k] * 1353 * 169)) asintK  !inFqM H1.
rewrite (_: inFq 1353 = inFq (Fq.SignedReductions.R*Fq.SignedReductions.R)); first by  rewrite /R //= -eq_inFq; smt(qE).
rewrite inFqM. 
rewrite Zq.ComRing.mulrA.

rewrite (_:(ntt (dotp va vb)).[k] * inFq 169 * inFq Fq.SignedReductions.R * inFq Fq.SignedReductions.R * inFq 169
        =(ntt (dotp va vb)).[k] * (inFq Fq.SignedReductions.R * inFq 169) * (inFq Fq.SignedReductions.R * inFq 169)); first by ring.
 rewrite  (_: inFq Fq.SignedReductions.R * inFq 169 = Zq.one).
   by rewrite -inFqM -eq_inFq Fq.SignedReductions.RRinv.
by ring. *)
qed.

(* TODO *)
lemma inner_product_ll  :
      islossless Aux.inner_product.
admitted.

lemma innerprod_corr va vb:
  phoare [ Aux.inner_product :
    nttv va = lift_vector ai /\
    nttv vb = lift_vector skpv /\
    signed_bound768_cxq ai 0 768 2 /\
    signed_bound768_cxq skpv 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = ntt (dotp va vb)  ]  = 1%r by
move => *;conseq inner_product_ll (innerprod_corr_h va vb) => //.

(* OPERATIONS OVER MATRICES *)

op lift_matrix( rows : W16.t Array768.t * W16.t Array768.t * W16.t Array768.t) : 
     matrix =
       Matrix.offunm (fun i j => 
        if i = 0
        then KyberPolyVec.lift_polyvec rows.`1 j
        else if i = 1
             then KyberPolyVec.lift_polyvec rows.`2 j
             else KyberPolyVec.lift_polyvec rows.`3 j).


end KyberPolyVec.

