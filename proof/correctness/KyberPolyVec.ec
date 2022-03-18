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

lemma polyvec_csubq_ll : islossless M.__polyvec_csubq.
proof.
proc.
wp;call poly_csubq_ll.
wp;call poly_csubq_ll.
wp;call poly_csubq_ll.
done.
qed.

lemma polyvec_csubq_corr ap :
      phoare[ M.__polyvec_csubq :
           ap = lift_array768 r /\ pos_bound768_cxq r 0 768 2 
           ==>
           ap = lift_array768 res /\ pos_bound768_cxq res 0 768 1 ] = 1%r
  by conseq polyvec_csubq_ll (polyvec_csubq_corr_h ap). 


(*
lemma formula_polyvec x : 
  0 <= x < 3329 =>
  (x * 1024 + 1665) * (4294967296 %/ 3329) %% 18446744073709551616 %/ 4294967296 %% 1024 =
  (x * 1024 + 1664) %/ 3329 %% 1024.
proof.
move=> /mem_range.
have :  
   (all
     (fun x => (x * 1024 + 1665) * (4294967296 %/ 3329) %% 18446744073709551616 %/ 4294967296 %% 1024 =
               (x * 1024 + 1664) %/ 3329 %% 1024)
     (range 0 3329)).
by move=> />.
by rewrite allP => H /H /={H}.
qed.
*)


op load_array960 (m : global_mem_t) (p : address) : W8.t Array960.t = (Array960.init (fun (i : int) => m.[p + i])).


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
           pos_bound768_cxq aa{1} 0 256 1 /\ lift_array768 aa{1} = _a).
wp => /=.
ecall{1} (polyvec_csubq_corr _a); 1: by auto => /#.
XXXX
while (#{/~mem}{~i{2}=0}{~j{2}=0}pre /\ to_uint i{1} = i{2} /\ 0<=i{2}<=768  /\ 
       to_uint j{1} = j{2} /\ j{2} = 2* i{2} /\
       touches mem Glob.mem{1} _p j{2} /\ 
       forall k, 0<=k<j{2} => loadW8 Glob.mem{1} (_p + k) = c{2}.[i{2} %/ 256].[k %/ 5]); last first.  
+ auto => /> &1 &2; rewrite ultE of_uintK /load_array32 /loadW8 /ptr /= => 
    vpl vph bnd ??; split; 1: by smt().
  move => mem' i' j' ra'; rewrite ultE of_uintK  /= => exit _ ibl ibh jv  touch load.
  split; 1:  smt(). 
  by rewrite tP => k kb; rewrite initiE //= (load k _) /#.

auto => /> &1 &2 ??; rewrite /pos_bound256_cxq /touches /storeW8  /loadW8 /=.
rewrite  ultE of_uintK /= => ????????. 
rewrite !to_uintD_small /=; 1..4: smt().
do split; 1..4: by smt(get_set_neqE_s). 
+ move => k kbl kbh.
  case (k = to_uint i{1}); last first.
  + move => neq; rewrite get_set_neqE_s; 1: by smt().
    by rewrite set_neqiE // /#.
  move => eq; rewrite get_set_eqE_s; 1: by smt().
  rewrite set_eqiE //.
  have -> : W32.of_int 15 = W32.of_int (2^4 - 1) by auto.
  rewrite /lift_array256 !mapiE /=; 1..4: smt().
  rewrite -compress_impl_small //; 1: smt().
  rewrite  -compress_impl_small //; 1:smt().
  
  case (k = to_uint i{1}); last by smt(Array128.set_neqiE).
  move => iv; have -> : 15 = 2^4 - 1 by auto.
  by rewrite !and_mod //.
+ by rewrite ultE /= to_uintD_small; smt().

by rewrite ultE /= to_uintD_small; smt().
qed.



while (#pre /\ 0 <= to_uint i <= 768 + 3 /\ to_uint i %% 4 = 0 /\ 
        ap = lift_array768 aa /\ pos_bound768_cxq aa 0 768 1 /\
        (forall k,
          0 <= k < to_uint i =>
           inFq (W16.to_sint r.[k]) = PolyVec.roundc ap.[k]) /\ 
        (forall k,
            0<= k < to_uint i => 0 <= to_sint r.[k] < 1024)).
+ unroll for ^while; wp; skip => />;rewrite /(\ult) /= => &hr H H0 H1 H2 H3 H4 H5 H6 H7.
  rewrite !to_uintD_small /= 1..4:/# andbA; split; 1:smt().
  split; move => k [#] *.
  move : (H5 k).
  rewrite H3 !lift_array768E; 1: smt(). 
  rewrite -roundcimpl64; 1: smt(). 
  case (0 <= k && k < to_uint i{hr}) => /> *. 
  rewrite !get_setE; 1..4: smt().
  by smt().
  rewrite !get_setE; 1..4: smt().
  by smt().
  rewrite !get_setE; 1..4: smt().
  do (rewrite (fun_if W16.to_sint)).
  smt(roundcimpl_rng get_setE).
call (polyvec_csubq_corr ap). 
wp; skip => /> *; split; 1: smt().
rewrite /(\ult) /= => i0 r0 *; split; 2: smt().
rewrite tP => j *; rewrite mapiE //; smt(@Array768).
qed.
*)

(******************************************************)
(* FIXME: this is a durty hack, it should be defined like that in KyberPoly *)
lemma poly_add_corr (_a _b : Fq Array256.t) (ab bb : int) :
    hoare[ Jindcpa.M._poly_add2 :
           (0 <= ab <= 6 /\ 0 <= bb <= 3) /\

            _a = lift_array256 rp /\
            _b = lift_array256 bp /\ signed_bound_cxq rp 0 256 ab /\ signed_bound_cxq bp 0 256 bb ==>
            signed_bound_cxq res 0 256 (ab + bb) /\
            forall (k : int), 0 <= k && k < 256 => inFq (to_sint res.[k]) = _a.[k] + _b.[k]].
bypr => &m [[h1 h2] h].
byphoare (_ : _a = lift_array256 rp /\
            _b = lift_array256 bp /\ signed_bound_cxq rp 0 256 ab /\ signed_bound_cxq bp 0 256 bb ==>
            !(signed_bound_cxq res 0 256 (ab + bb) /\
              forall (k : int), 0 <= k && k < 256 => inFq (to_sint res.[k]) = _a.[k] + _b.[k]) ) => //.
hoare; apply (poly_add_corr _a _b ab bb h1 h2).
qed.

(* TODO *)
lemma poly_add_ll : islossless Jindcpa.M._poly_add2.
admitted.

lemma poly_add_corr_ph (_a _b : Fq Array256.t) (ab bb : int) :
    phoare[ Jindcpa.M._poly_add2 :
           (0 <= ab <= 6 /\ 0 <= bb <= 3) /\
            _a = lift_array256 rp /\
            _b = lift_array256 bp /\ signed_bound_cxq rp 0 256 ab /\ signed_bound_cxq bp 0 256 bb ==>
            signed_bound_cxq res 0 256 (ab + bb) /\
            forall (k : int), 0 <= k && k < 256 => inFq (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r 
by conseq poly_add_ll (poly_add_corr  _a _b ab bb).


lemma polyvec_add_corr_h _a _b ab bb :
      hoare[ M.__polyvec_add2 :
            0 <= ab <= 6 /\ 0 <= bb <= 3 /\
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb 
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\ 
           forall k, 0 <= k < 768 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k]]. 
proof.
  proc; sp.
  wp.
  ecall (poly_add_corr (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i]))) (lift_array256 (Array256.init (fun i => b.[(2 * 256) + i]))) ab bb).
  wp.
  ecall (poly_add_corr (lift_array256 (Array256.init (fun i => r.[256 + i]))) (lift_array256 (Array256.init (fun i => b.[256 + i]))) ab bb).
  wp.
  ecall (poly_add_corr (lift_array256 (Array256.init (fun i => r.[i]))) (lift_array256 (Array256.init (fun i => b.[i]))) ab bb).
  skip; move => &hr [[ab_lb ab_ub][[bb_lb bb_ub] [_a_def [_b_def [signed_bound_r signed_bound_b]]]]] />.
  rewrite ab_lb ab_ub bb_lb bb_ub /=.
  split. move : signed_bound_r signed_bound_b. smt(@Array256 @Array768).
  move => signed_bound_r_1 signed_bound_b_1 res1 signed_bound_res1 res1_eq_rb.
  split.
  smt(@Array768 @Array256).
  move => signed_bound_r_2 signed_bound_b_2 res2 signed_bound_res2 res2_eq_rb.
  do split.
  rewrite /signed_bound_cxq => k k_b />.
  do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
  move : signed_bound_res2 signed_bound_res1.
  smt(@Array256 @Array768).
  move : signed_bound_b; smt(@Array256 @Array768).
  move => signed_bound_r_3 signed_bound_b_3 res3 signed_bound_res3 res3_eq_rb.
  do split.
  rewrite /signed_bound768_cxq => k k_b />.
  do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
  (* ========== *)
  (* TODO: replace with aux lemmas *)
  case (512 <= k < 768) => k_si.
    move : signed_bound_res3 => /#.
  move : k_si => ?.
  case (256 <= k < 512) => k_si.
    move : signed_bound_res2 => /#.
  move : k_si => ?.
  case (0 <= k < 256) => k_si.
    move : signed_bound_res1 => /#.
  smt(@Array256 @Array768).

  move => k k_lb k_ub.
  rewrite _a_def _b_def /= -lift_array768_inFq 1:/#  -lift_array768_inFq 1:/#.
  do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint) (fun_if inFq)).

  case (512 <= k < 768) => k_si.
    rewrite res3_eq_rb 1:/#.
    do (rewrite -lift_array256_inFq 1:/#).
    do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint) (fun_if inFq)).
    smt(@Array768 @Array256).
  move : k_si => ?.
  case (256 <= k < 512) => k_si.
    rewrite res2_eq_rb 1:/#.
    do (rewrite -lift_array256_inFq 1:/#).
    do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint) (fun_if inFq)).
    smt(@Array768 @Array256).
  move : k_si => ?.
  case (0 <= k < 256) => k_si.
    rewrite res1_eq_rb 1:/#.
    do (rewrite -lift_array256_inFq 1:/# || rewrite initiE 1:/# /=).
    done.
  smt(@Array768 @Array256).
  (* ========== *)
qed.

(* TODO *)
lemma polyvec_add_ll  :
      islossless M.__polyvec_add2.
admitted.

lemma polyvec_add_corr  _a _b ab bb:
   phoare[ M.__polyvec_add2 :
            0 <= ab <= 6 /\ 0 <= bb <= 3 /\
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb 
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\ 
           forall k, 0 <= k < 768 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k] ]  = 1%r 
by conseq polyvec_add_ll (polyvec_add_corr_h  _a _b ab bb).

(******************************************************)

lemma polyvec_reduce_corr_h _a :
      hoare[ M.__polyvec_reduce :
          _a = lift_array768 r ==> 
          _a = lift_array768 res /\
          forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)].
proof.
  proc; sp.
  wp.
  ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
  wp.
  ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
  wp.
  ecall (poly_reduce_corr_h (lift_array256 (Array256.init (fun i => r.[i])))).
  skip; move => &hr _a_def />.
  move => res1 res1_eq_r signed_bound_res1 res2 res2_eq_r signed_bound_res2 res3 res3_eq_r signed_bound_res3.

  split.
  rewrite _a_def lift_array768P => k k_b.
  do (rewrite initiE 1:k_b /= || rewrite fun_if).

  (* ========== *)
  (* TODO: replace with aux lemmas *)
  case (512 <= k < 768) => k_si.
    rewrite lift_array256_inFq 1:/# -res3_eq_r.
    rewrite -lift_array256_inFq 1:/#.
    smt(@Array768 @Array256).
  move : k_si => ?.
  case (256 <= k < 512) => k_si.
    rewrite lift_array256_inFq 1:/# -res2_eq_r.
    rewrite -lift_array256_inFq 1:/#.
    smt(@Array768 @Array256).
  move : k_si => ?.
  case (0 <= k < 256) => k_si.
    rewrite lift_array256_inFq 1:/# -res1_eq_r.
    rewrite -lift_array256_inFq 1:/#.
    smt(@Array768 @Array256).
  trivial.

  move => k k_lb k_ub.
  do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
  case (512 <= k < 768) => k_si.
    move : signed_bound_res3 => /#.
  move : k_si => ?.
  case (256 <= k < 512) => k_si.
    move : signed_bound_res2 => /#.
  move : k_si => ?.
  case (0 <= k < 256) => k_si.
    move : signed_bound_res1 => /#.
  smt(@Array768 @Array256).
  (* ========== *)
qed.

(* TODO *)
lemma polyvec_reduce_ll  :
      islossless M.__polyvec_reduce.
admitted.

lemma polyvec_reduce_corr  _a :
      phoare[ M.__polyvec_reduce :
          _a = lift_array768 r ==> 
          _a = lift_array768 res /\
          forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)]  = 1%r 
by conseq polyvec_reduce_ll (polyvec_reduce_corr_h  _a).

(******************************************************)

lemma polyvec_decompress_corr mem _p (_a : (W8.t Array320.t) Array3.t) :
    equiv [ M.__polyvec_decompress ~ EncDec.decode10_vec :
             valid_range W8 Glob.mem{1} _p (3*320) /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array320 Glob.mem{1} _p = _a.[0] /\
             load_array320 Glob.mem{1} (_p + 320) = _a.[1] /\
             load_array320 Glob.mem{1} (_p + 640) = _a.[2]
              ==>
             lift_array256 (Array256.of_list witness (sub res{1} 0 256)) = decompress_poly 10 res{2}.[0] /\
             lift_array256 (Array256.of_list witness (sub res{1} 256 256)) = decompress_poly 10 res{2}.[1] /\
             lift_array256 (Array256.of_list witness (sub res{1} 512 256)) = decompress_poly 10 res{2}.[2] /\
             Glob.mem{1} = mem ].
admitted.
(*
while (#pre /\ 0 <= to_uint i <= 768 /\ to_uint i %% 4 = 0 /\
       forall k, 0 <= k < to_uint i => r.[k] = truncateu16 (((rp.[k] * W32.of_int 3329) + W32.of_int 512) `>>` 
                                               W8.of_int 10)).
 + exlim (to_uint i) => i0.
   while ((0 <= i0 && i0 < 768) /\ i0 %% 4 = 0 /\ to_uint i = i0 + k /\ 0 <= k <= 4 /\
          (forall z, k <= z < 5 => t.[z] = rp.[i0 + z]) /\
          forall k, 0 <= k < to_uint i => r.[k] = 
               truncateu16 (((rp.[k] * W32.of_int 3329) + W32.of_int 512) `>>` W8.of_int 10)).
   + auto => /> &hr i_lb i_ub i_mod_4 ui_val k_lb k_ub t_val r_val k_tub.
     split; first by rewrite to_uintD_small; smt(@Int @W64).
     split; first by move : k_lb k_tub; smt(@Int).
     split.
     move => z z_lb z_ub.
     rewrite Array5.set_neqiE 1:/# 1:/#.
     rewrite t_val 1:/# => />.

     move => z z_lb z_ub.
     do (rewrite get_setE 1:/# /=).
     case (z = to_uint i{hr}) => z_val.
       rewrite t_val 1:/#.
       smt(@Array768 @Array5).
       rewrite r_val 1:z_lb /=.
         move : z_val z_ub; rewrite to_uintD_small 1:/#. smt(@Int @W64).
       done.
   wp; while ((0 <= i0 && i0 < 768) /\ i0 %% 4 = 0 /\ to_uint i = i0 /\ 0 <= k <= 5 /\
           (forall z, 0 <= z < k=> t.[z] = rp.[i0 + z])).
   + auto => /> &hr; smt (Array5.get_setE).
   by auto => /> &hr; rewrite ultE /= /#.

wp; skip => /> &hr H; split; 1: smt().
rewrite /(\ult) /= => i0 r0 4?.
have -> hr0 : to_uint i0 = 768 by smt().
have h : forall k, 0 <= k && k < 768 => 
  to_sint r0.[k] = ((to_sint rp{hr}.[k] %% 3329 * 3329 + 512) %/ 2 ^ 10).
+ move=> k hk; rewrite hr0 1://.
  move: (H k hk); rewrite bpos32E => /> *.
  have heq : to_uint (rp{hr}.[k] * W32.of_int 3329) = to_uint rp{hr}.[k] * 3329.
  + by rewrite to_uintM_small /=; smt(to_sint_unsigned32).
  have heq1 : to_uint (rp{hr}.[k] * W32.of_int 3329 + W32.of_int 512) = 
              to_uint rp{hr}.[k] * 3329 + 512.
  + rewrite to_uintD_small /=; smt(to_sint_unsigned32).
  pose X := (W2u16.truncateu16 _).
  have heq2 : to_uint X = (to_sint rp{hr}.[k] %% 3329 * 3329 + 512) %/ 2 ^ 10.
  + rewrite to_uint_truncateu16 shr_div_le // /=. 
    rewrite heq1; smt(to_sint_unsigned32).
  rewrite (W16.to_sintE X) /smod /=.
  have -> /=: !(32768 <= to_uint X). 
  + rewrite heq2 /=; smt(to_sint_unsigned32).
  by rewrite heq2.
split.
+ apply Array768.tP => k hk.
  by rewrite /lift_array768 !mapiE 1..3:// /= PolyVec.unroundcE inFqK qE h.
move=> k hk; rewrite b16E h 1:// /= qE. 
by move: (H k hk); rewrite bpos32E /#.
qed.*)

(******************************************************)

require import Jindcpa.

lemma polyvec_ntt_correct_h _r:
   hoare[ M.__polyvec_ntt :
        _r = r /\
        signed_bound768_cxq r 0 768 2
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

(* TODO *)
lemma polyvec_ntt_ll  :
      islossless M.__polyvec_ntt.
admitted.

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

(* TODO *)
lemma polyvec_invntt_ll  :
      islossless M.__polyvec_invntt.
admitted.

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
ecall (poly_add_corr (lift_array256 r) _p2 6 3).
call (poly_basemul_corr _a2 _b2).
call (poly_add_corr _p0 _p1 3 3).
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
+ move : (basemul_scales (lift_polyvec a{hr} 0) (lift_polyvec b{hr} 0) (lift_array256 r0)) (basemul_scales (lift_polyvec a{hr} 1) (lift_polyvec b{hr} 1) (lift_array256 r1)) => /#.

move => a0tb0f_eq_r0 a1tb1f_eq_r1 res1 signed_bound_res1 res1_def.

split.
+ rewrite _a2_def _b2_def /lift_polyvec /lift_array256 mapE.
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split; first by move : signed_bound_a; smt(@Array256 @Array768).
  by move : signed_bound_b; smt(@Array256 @Array768).

move => _a2_ddef _b2_ddef signed_bound_a2 signed_bound_b2 r2 signed_bound_r2 a2tb2_eq_r2.
split.
+ move : (basemul_scales (lift_polyvec a{hr} 2) (lift_polyvec b{hr} 2) (lift_array256 r2)) => /#.

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
      islossless M.__polyvec_pointwise_acc.
admitted.

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
lemma polyvec_tobytes_corr mem _p _a :
    equiv [ M.__polyvec_tobytes ~ EncDec.encode12_vec :
             pos_bound768_cxq a{1} 0 768 2 /\
             lift_array768 a{1} = _a /\
             u{2}.[0] = Array256.of_list witness (sub _a 0 256) /\
             u{2}.[1] = Array256.of_list witness (sub _a 256 256) /\
             u{2}.[2] = Array256.of_list witness (sub _a 512 256) /\
             valid_range W8 Glob.mem{1} _p (3*384) /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             touches mem Glob.mem{1} _p (3*384) /\
             load_array384 Glob.mem{1} _p = res{2}.[0] /\
             load_array384 Glob.mem{1} (_p + 384) = res{2}.[1] /\
             load_array384 Glob.mem{1} (_p + 768) = res{2}.[2]
              ].
admitted.

(* TODO *)
lemma polyvec_frombytes_corr mem _p (_a : (W8.t Array384.t) Array3.t) :
    equiv [ M.__polyvec_frombytes ~ EncDec.decode12_vec :
             valid_range W8 Glob.mem{1} _p (3*384) /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array384 Glob.mem{1} _p = _a.[0] /\
             load_array384 Glob.mem{1} (_p + 384) = _a.[1] /\
             load_array384 Glob.mem{1} (_p + 768) = _a.[2]
              ==>
             lift_array256 (Array256.of_list witness (sub res{1} 0 384)) = res{2}.[0] /\
             lift_array256 (Array256.of_list witness (sub res{1} 384 384)) = res{2}.[1] /\
             lift_array256 (Array256.of_list witness (sub res{1} 768 384)) = res{2}.[2] /\
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
move => /> VA VB AB BB  H H0 result.
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
by ring.
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

