require import AllCore List IntDiv CoreMap.
from Jasmin require  import JModel JMemory.
require import W16extra Array256 Array128 Array768.
require import Fq.
require import KyberPoly.
require import NTT_Fq.



theory KyberPolyVec.

import KyberPoly.
import Fq.
import Kyber_.
import ZModField.

import MLWEPKE.H_MLWE.Matrix_.

require import IndcpaDerand.
import NTT_Fq.

(* AUX *)

lemma mulvec a b :
   dotp a b = 
    invntt (basemul (ntt a.[0]) (ntt b.[0])) +
    invntt (basemul (ntt a.[1]) (ntt b.[1])) +
    invntt (basemul (ntt a.[2]) (ntt b.[2])).
proof.
rewrite -!mul_comm_ntt !invnttK.
rewrite /dotp => />. 
rewrite /Big.BAdd.big /predT /=.
admit. (* FIXME: by smt(@Big.CR). *)
qed.

op lift_array768 (p : W16.t Array768.t) =
  Array768.map (fun x => inzmod (W16.to_sint x)) p.

op lift_polyvec(row :  W16.t Array768.t, c : int) = 
   Array256.init (fun i => inzmod (W16.to_sint row.[c*256 + i])). 

op signed_bound768_cxq (coefs : W16.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => b16 coefs.[k] (c * q).

op pos_bound768_cxq (coefs : W16.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

op pos_bound768_b (coefs : W16.t Array768.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] b.

lemma lift_array768_inzmod (a : W16.t t) k :
  0 <= k < 768 =>
  inzmod (to_sint a.[k]) = (lift_array768 a).[k].
proof. by move => H; rewrite /lift_array768 mapE /= initE H. qed.

lemma lift_array256_inzmod (a : W16.t Array256.t) k :
  0 <= k < 256 =>
  inzmod (to_sint a.[k]) = (lift_array256 a).[k].
proof. by move => H; rewrite /lift_array256 mapE /= initE H. qed.

lemma lift_array256_sub_768 a (b : W16.t Array256.t) x n :
  0 <= n =>
  lift_array768 a = x =>
  (forall (k : int), 0 <= k < 256 => inzmod (to_sint b.[k]) = x.[k+n]) =>
  (forall (k : int), 0 <= k < 256 => b.[k] = a.[k+n]) =>
  lift_array256 b = Array256.of_list witness (sub x n 256).
proof.
  rewrite /lift_array768 => H H0 H1 H2.
  rewrite /lift_array256 tP => j H3.
  rewrite mapE /of_list !initE H3 /=.
  by rewrite H1 // nth_sub // addzC.
qed.

lemma inzmod_lift_array256 (x : W16.t t) y n :
  0 <= n <= 512 =>
  (forall (k : int), 0 <= k < 256 => inzmod (to_sint x.[k+n]) = (lift_array256 y).[k]) =>
  lift_array256 y = Array256.of_list witness (sub (lift_array768 x) n 256).
proof.
  move => H H0; rewrite tP => j H1.
  rewrite -H0 //.
  rewrite /of_list initE H1 /= nth_sub // /lift_array768 mapiE // /#. 
qed.

lemma lift_array768E (x : W16.t t) k :
  0 <= k < 768 =>
  (lift_array768 x).[k] = inzmod (to_sint x.[k]).
proof.  by move => ?; rewrite /lift_array768 mapiE //. qed.

lemma lift_array768_eq (x y : W16.t t) :
  (forall k, 0 <= k < 256 =>
    inzmod (to_sint x.[k]) = (Array256.of_list witness (sub (lift_array768 y) 0 256)).[k]) =>
  (forall k, 0 <= k < 256 =>
    inzmod (to_sint x.[k+256]) = (Array256.of_list witness (sub (lift_array768 y) 256 256)).[k]) =>
  (forall k, 0 <= k < 256 =>
    inzmod (to_sint x.[k+512]) = (Array256.of_list witness (sub (lift_array768 y) 512 256)).[k]) =>
  lift_array768 x = lift_array768 y.
proof.
  move => H H0 H1; rewrite tP => k H2.
  rewrite lift_array768E //.
  case (k < 256) => H3.
    by rewrite H 1:/# get_of_list 1:/# nth_sub 1:/#.
  case (k < 512) => H4.
    move : (H0 (k-256)).
    have ->: 0 <= k - 256 < 256 by smt().
    by move=> /= ->; rewrite /= get_of_list 1:/# nth_sub 1,2:/#.
  move : (H1 (k-512)).
  have -> /= H5: 0 <= k - 512 < 256 by smt().
  by rewrite H5 get_of_list 1:/# nth_sub 1,2:/#.
qed.

lemma lift_array768P (x y : W16.t t) :
  lift_array768 x = lift_array768 y <=>
  (forall k, 0 <= k < 768 => inzmod (to_sint x.[k]) = inzmod (to_sint y.[k])).
proof. 
  split; first by rewrite tP => H *; rewrite -!lift_array768E // H //. 
  by rewrite tP => H *; rewrite !lift_array768E // H //. 
qed.

op lift_array768_32 (p : W32.t Array768.t) =
  Array768.map (fun x => inzmod (W32.to_sint x)) p.

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
lemma polyvec_csubq_corr ap :
      hoare[ Mderand.__polyvec_csubq :
           ap = lift_array768 r /\
           pos_bound768_cxq r 0 768 2 
           ==>
           ap = lift_array768 res /\
           pos_bound768_cxq res 0 768 1 ] . 
proof.
  move => *; proc; sp.
  wp.
  ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
  wp.
  ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
  wp.
  ecall (poly_csubq_corr_h (lift_array256 (Array256.init (fun i => r.[i])))).
  skip; move => &hr [ap_def pos_bound_r] />.
  split; first by smt(@Array256).
  move => pos_bound_r_1 res1 r_eq_res1 pos_bound_res1.
  split; first by smt(@Array256 @Array768).
  move => pos_bound_r_2 res2 r_eq_res2 pos_bound_res2.
  split.
  rewrite /pos_bound256_cxq => k k_i. do (rewrite initiE 1:/# //=).
  smt(@Array256 @Array768).
  move => pos_bound_r_3 res3 r_eq_res3 pos_bound_res3.
  split.
  rewrite ap_def lift_array768P => k k_i.
  do (rewrite initiE 1:k_i /= || rewrite fun_if).
  (* ========== *)
  (* TODO: replace with aux lemmas *)
  case (512 <= k < 768) => k_si.
    rewrite lift_array256_inzmod 1:/# -r_eq_res3.
    rewrite -lift_array256_inzmod 1:/#.
    smt(@Array768 @Array256).
  move : k_si => ?.
  case (256 <= k < 512) => k_si.
    rewrite lift_array256_inzmod 1:/# -r_eq_res2.
    rewrite -lift_array256_inzmod 1:/#.
    smt(@Array768 @Array256).
  move : k_si => ?.
  case (0 <= k < 256) => k_si.
    rewrite lift_array256_inzmod 1:/# -r_eq_res1.
    rewrite -lift_array256_inzmod 1:/#.
    smt(@Array768 @Array256).
    trivial.

  rewrite /pos_bound768_cxq => k k_i.
  do (rewrite initiE 1:k_i /= || rewrite fun_if).
  case (512 <= k < 768) => k_si.
    move : pos_bound_res3 => /#.
  move : k_si => ?.
  case (256 <= k < 512) => k_si.
    move : pos_bound_res2 => /#.
  move : k_si => ?.
  case (0 <= k < 256) => k_si.
    move : pos_bound_res1 => /#.
  smt(@Array768 @Array256).
  (* ========== *)
qed.

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

lemma roundcimpl64 (a : W16.t) :
  bpos16 a q =>
  inzmod
  (to_sint (truncateu16
         ((((zeroextu64 a `<<` (of_int 10)%W8) + (of_int 1665)%W64) * (of_int 1290167)%W64 `>>`
           (of_int 32)%W8) `&`
          (of_int 1023)%W64))) = PolyVec.roundc (inzmod (to_sint a)).
proof.
rewrite /zeroextu64 /truncateu16 PolyVec.roundcE qE => /> *.
rewrite (_: W64.of_int 1023 = W64.masklsb 10); first by rewrite /max /=.
rewrite W64.and_mod 1:// /max /= !W64.of_uintK to_sintE /(`<<`) /(`>>`) W64.shlMP 1:/#.
rewrite W64.to_uint_shr 1:/# W16.of_uintK; congr.
rewrite inzmodK to_sintE qE /=.
rewrite IntDiv.pmod_small /= 1:/#.
rewrite IntDiv.pmod_small /= 1:/#. 
rewrite (IntDiv.pmod_small _ 3329) /= 1:/#.
rewrite (_: W16.smod (to_uint a) = to_uint a); 1:smt(@W16).
pose xx := (to_uint a * 1024 + 1665).
rewrite W64.of_uintK => />.
pose yy := xx * 1290167 %% 18446744073709551616 %/ 4294967296 %% 1024.
have ? : (0 <= yy < 2^16) by smt(@W16).
rewrite (_: W16.smod yy = yy). 
+ by rewrite /smod /= /#.
rewrite /yy (_: 1290167 = 4294967296 %/ 3329) 1://.
rewrite /xx formula_polyvec 2://.
by rewrite -to_sint_unsigned.
qed.

lemma roundcimpl_rng (a : W16.t) :
  bpos16 a q =>
  0 <= to_sint (truncateu16
         ((((zeroextu64 a `<<` (of_int 10)%W8) + (of_int 1665)%W64) * (of_int 1290167)%W64 `>>`
           (of_int 32)%W8) `&`
          (of_int 1023)%W64)) < 1024.
proof.
rewrite to_sintE => /> *.
rewrite (_: W64.of_int 1023 = W64.masklsb 10); first by rewrite /max /=.
rewrite W64.and_mod => />. 
pose xx := (W64.of_int
             (to_uint
                (((zeroextu64 a `<<` (of_int 10)%W8) + (of_int 1665)%W64) * (of_int 1290167)%W64 `>>` (of_int 32)%W8) %%
              1024)).
have ? : 0<= to_uint xx < 1024.
  split; first by smt(@W64).
  move => xx_lb.
  rewrite of_uintK pmod_small.
  smt(modz_cmp).
  smt(modz_cmp).
have ? : 0<= to_uint (truncateu16 xx) < 1024.
  rewrite /truncateu16. 
  do 4!(rewrite of_uintK pmod_small || smt(@IntDiv @Int)).
by rewrite /max /smod /=;  smt(@W16).
qed.

lemma polyvec_compress_round_corr ap :
      hoare[ Mderand.polyvec_compress_round :
           ap = lift_array768 a /\
           pos_bound768_cxq a 0 768 2 
           ==>
           Array768.map PolyVec.roundc ap = lift_array768 res /\
           forall k, 0 <= k < 768 => 0 <= to_sint res.[k] < 1024 ] . 
proof.
proc.
while (#pre /\ 0 <= to_uint i <= 768 + 3 /\ to_uint i %% 4 = 0 /\ 
        ap = lift_array768 aa /\ pos_bound768_cxq aa 0 768 1 /\
        (forall k,
          0 <= k < to_uint i =>
           inzmod (W16.to_sint r.[k]) = PolyVec.roundc ap.[k]) /\ 
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

(******************************************************)
(* FIXME: this is a durty hack, it should be defined like that in KyberPoly *)
lemma poly_add_corr (_a _b : zmod Array256.t) (ab bb : int) :
    hoare[ Jindcpa.M._poly_add2 :
           (0 <= ab <= 6 /\ 0 <= bb <= 3) /\

            _a = lift_array256 rp /\
            _b = lift_array256 bp /\ signed_bound_cxq rp 0 256 ab /\ signed_bound_cxq bp 0 256 bb ==>
            signed_bound_cxq res 0 256 (ab + bb) /\
            forall (k : int), 0 <= k && k < 256 => inzmod (to_sint res.[k]) = _a.[k] + _b.[k]].
bypr => &m [[h1 h2] h].
byphoare (_ : _a = lift_array256 rp /\
            _b = lift_array256 bp /\ signed_bound_cxq rp 0 256 ab /\ signed_bound_cxq bp 0 256 bb ==>
            !(signed_bound_cxq res 0 256 (ab + bb) /\
              forall (k : int), 0 <= k && k < 256 => inzmod (to_sint res.[k]) = _a.[k] + _b.[k]) ) => //.
hoare; apply (poly_add_corr _a _b ab bb h1 h2).
qed.

lemma polyvec_add_corr _a _b ab bb :
      hoare[ Mderand.__polyvec_add2 :
            0 <= ab <= 6 /\ 0 <= bb <= 3 /\
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb 
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\ 
           forall k, 0 <= k < 768 =>
              inzmod (to_sint res.[k]) = _a.[k] + _b.[k]]. 
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
  rewrite /signed_bound_cxq => k k_i />.
  do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
  move : signed_bound_res2 signed_bound_res1.
  smt(@Array256 @Array768).
  move : signed_bound_b; smt(@Array256 @Array768).
  move => signed_bound_r_3 signed_bound_b_3 res3 signed_bound_res3 res3_eq_rb.
  do split.
  rewrite /signed_bound768_cxq => k k_i />.
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
  rewrite _a_def _b_def /= -lift_array768_inzmod 1:/#  -lift_array768_inzmod 1:/#.
  do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint) (fun_if inzmod)).

  case (512 <= k < 768) => k_si.
    rewrite res3_eq_rb 1:/#.
    do (rewrite -lift_array256_inzmod 1:/#).
    do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint) (fun_if inzmod)).
    smt(@Array768 @Array256).
  move : k_si => ?.
  case (256 <= k < 512) => k_si.
    rewrite res2_eq_rb 1:/#.
    do (rewrite -lift_array256_inzmod 1:/#).
    do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint) (fun_if inzmod)).
    smt(@Array768 @Array256).
  move : k_si => ?.
  case (0 <= k < 256) => k_si.
    rewrite res1_eq_rb 1:/#.
    do (rewrite -lift_array256_inzmod 1:/# || rewrite initiE 1:/# /=).
    done.
  smt(@Array768 @Array256).
  (* ========== *)
qed.   

(******************************************************)

lemma polyvec_reduce_corr _a :
      hoare[ Mderand.__polyvec_reduce :
          _a = lift_array768 r ==> 
          _a = lift_array768 res /\
          forall k, 0 <= k < 768 => bpos16 res.[k] (2*Kyber_.q)].
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
  rewrite _a_def lift_array768P => k k_i.
  do (rewrite initiE 1:k_i /= || rewrite fun_if).

  (* ========== *)
  (* TODO: replace with aux lemmas *)
  case (512 <= k < 768) => k_si.
    rewrite lift_array256_inzmod 1:/# -res3_eq_r.
    rewrite -lift_array256_inzmod 1:/#.
    smt(@Array768 @Array256).
  move : k_si => ?.
  case (256 <= k < 512) => k_si.
    rewrite lift_array256_inzmod 1:/# -res2_eq_r.
    rewrite -lift_array256_inzmod 1:/#.
    smt(@Array768 @Array256).
  move : k_si => ?.
  case (0 <= k < 256) => k_si.
    rewrite lift_array256_inzmod 1:/# -res1_eq_r.
    rewrite -lift_array256_inzmod 1:/#.
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

import Array5.
lemma polyvec_decompress_restore_corr ap :
      hoare[ Mderand.polyvec_decompress_restore :
           ap = lift_array768_32 rp /\
           pos_bound768_b_32 rp 0 768 (2^10) 
           ==>
           Array768.map PolyVec.unroundc ap = lift_array768 res /\
           signed_bound768_cxq res 0 768 1 ] . 
proof.
proc.
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
  by rewrite /lift_array768 !mapiE 1..3:// /= PolyVec.unroundcE inzmodK qE h.
move=> k hk; rewrite b16E h 1:// /= qE. 
by move: (H k hk); rewrite bpos32E /#.
qed.

require import Jindcpa.

lemma ntt_correct_h (_r0 : zmod Array256.t):
      hoare[ Mderand._poly_ntt :
               _r0 = lift_array256 arg /\
               array_mont zetas_const = lift_array128 jzetas /\ signed_bound_cxq arg 0 256 2 ==>
               ntt _r0 = lift_array256 res /\
               forall (k : int), 0 <= k && k < 256 => bpos16 res.[k] (2 * q)]
 by conseq (ntt_correct _r0). 

lemma polyvec_ntt_correct _r:
   hoare[ Mderand.__polyvec_ntt :
        _r = lift_array768 r /\
        array_mont zetas_const = 
           lift_array128  jzetas /\
        signed_bound768_cxq r 0 768 2
          ==> 
            ntt (Array256.of_list witness (sub _r 0 256)) = lift_polyvec res 0 /\
            ntt (Array256.of_list witness (sub _r 256 256)) = lift_polyvec res 1 /\
            ntt (Array256.of_list witness (sub _r 512 256)) = lift_polyvec res 2 /\
            pos_bound768_cxq res 0 768 2 ].
proof.
proc; sp.
wp.
ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp.
ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp.
ecall (ntt_correct_h (lift_array256 (Array256.init (fun i => r.[i])))).
skip; move => &hr [_r_def [zetas_const_def signed_bound_r]] />.
split.
rewrite /signed_bound_cxq => k k_i;  rewrite /signed_bound768_cxq in signed_bound_r; rewrite initiE 1:/# (signed_bound_r k) 1:/#.

move => zetas1_def signed_bound_r1 res1 r_eq_res1 signed_bound_res1.
split.
rewrite /signed_bound_cxq => k k_i.
rewrite initiE 1:k_i /= initiE 1:/# /= (fun_if W16.to_sint).
have ->: !(0 <= 256 + k && 256 + k < 256).
  move : k_i => /#.
rewrite /signed_bound768_cxq /b16 in signed_bound_r; rewrite (signed_bound_r (256 + k)) 1:/#.

move => signed_bound_r2 res2 r_eq_res2 signed_bound_res2 />.
split.
rewrite /signed_bound_cxq => k k_i.
do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
have ->: !(256 <= 512 + k && 512 + k < 512).
  move : k_i => /#.
have ->: !(0 <= 512 + k && 512 + k < 256).
  move : k_i => /#.
simplify.
rewrite /signed_bound768_cxq /b16 in signed_bound_r; rewrite (signed_bound_r (512 + k)) 1:/#.

move => signed_bound_r3 res3 r_eq_res3 signed_bound_res3 />.
(* ========== *)
(* TODO: replace with aux lemmas *)
split.
  apply Array256.tP => k k_i.
  rewrite /lift_polyvec /=.
  do (rewrite initiE 1:/# /= || rewrite fun_if).
  rewrite k_i /=.
  rewrite (lift_array256_inzmod res1) 1:/# -r_eq_res1.
  rewrite -(lift_array256_sub_768 r{hr} (Array256.init ("_.[_]" r{hr})) _r 0) 1:/= // 1:_r_def //.
  move => k0 k0_i.
  rewrite _r_def addz0 /lift_array768 mapiE 1:/# /=.
  smt(@Array768 @Array256).
  move => k0 k0_i.
  rewrite initiE 1:k0_i => /#.
  smt(@Array768 @Array256 @List).

split.
  apply Array256.tP => i i_i.
  rewrite /lift_polyvec /=.
  do (rewrite initiE 1:/# /= || rewrite fun_if).
  have ->: 256 <= 256 + i && 256 + i < 512. move : i_i => /#.
  have ->: !(512 <= 256 + i && 256 + i < 768). move : i_i => /#.
  simplify.
  rewrite (lift_array256_inzmod res2) 1:/# -r_eq_res2 /=.
  rewrite (lift_array256_sub_768 r{hr} _ _r 256) 1:/= // 1:_r_def //.
  move => k0 k0_i.
  rewrite _r_def /lift_array768 mapiE 1:/# /=.
  smt(@Array768 @Array256).
  move => k0 k0_i.
  rewrite initiE 1:k0_i /= initiE 1:/# /=.
  smt(@Array768 @Array256).

split.
  apply Array256.tP => i i_i.
  rewrite /lift_polyvec /=.
  do (rewrite initiE 1:/# /= || rewrite fun_if).
  have ->: 512 <= 512 + i && 512 + i < 768. move : i_i => /#.
  simplify.
  rewrite (lift_array256_inzmod res3) 1:/# -r_eq_res3 /=.
  rewrite (lift_array256_sub_768 r{hr} _ _r 512) 1:/= // 1:_r_def //.
  move => k0 k0_i.
  rewrite _r_def /lift_array768 mapiE 1:/# /=.
  smt(@Array768 @Array256).
  move => k0 k0_i.
  rewrite initiE 1:k0_i /= initiE 1:/# /=.
  smt(@Array768 @Array256).

  rewrite /pos_bound768_cxq => k k_i.
  do (rewrite initiE 1:k_i /= || rewrite (fun_if W16.to_sint)).
  move : (signed_bound_res3 (k - 512)) (signed_bound_res2 (k - 256)) (signed_bound_res1 k).
  smt(bpos16E @Int @Array768 @Array256).
  (* ========== *)
qed.

lemma invntt_correct_h (_r : zmod Array256.t):
      hoare[  Mderand._poly_invntt :
             _r = lift_array256 arg /\
             array_mont_inv zetas_inv_const = lift_array128 jzetas_inv /\ signed_bound_cxq arg 0 256 2 ==>
             scale (invntt _r) (inzmod SignedReductions.R) = lift_array256 res /\
             forall (k : int), 0 <= k && k < 256 => b16 res.[k] (q + 1)]
by conseq (invntt_correct _r). 

lemma polyvec_invntt_correct _r:
   hoare[ Mderand.__polyvec_invntt :
        _r = lift_array768 r /\
        array_mont_inv zetas_inv_const = 
           lift_array128  jzetas_inv /\
        signed_bound768_cxq r 0 768 2
          ==> 
            scale (invntt (Array256.of_list witness (sub _r 0 256))) (inzmod SignedReductions.R) = lift_polyvec res 0 /\
            scale (invntt (Array256.of_list witness (sub _r 256 256))) (inzmod SignedReductions.R) = lift_polyvec res 1 /\
            scale (invntt (Array256.of_list witness (sub _r 512 256))) (inzmod SignedReductions.R) = lift_polyvec res 2 /\
            forall (k : int), 0 <= k && k < 768 => b16 res.[k] (q + 1) ].
proof.
proc; sp.
wp.
ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i])))).
wp.
ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[256 + i])))).
wp.
ecall (invntt_correct_h (lift_array256 (Array256.init (fun i => r.[i])))).

wp; skip; move => &hr [_r_def [zetas_inv_const signed_bound_r]] * />.
split.
rewrite /signed_bound_cxq => k k_i;  rewrite /signed_bound768_cxq in signed_bound_r; rewrite initiE 1:/# (signed_bound_r k) 1:/#.

move => zetas1_def signed_bound_r1 res1 r_eq_res1 signed_bound_res1.
split.
rewrite /signed_bound_cxq => k k_i.
rewrite initiE 1:k_i /= initiE 1:/# /= (fun_if W16.to_sint).
have ->: !(0 <= 256 + k && 256 + k < 256).
  move : k_i => /#.
rewrite /signed_bound768_cxq /b16 in signed_bound_r; rewrite (signed_bound_r (256 + k)) 1:/#.

move => signed_bound_r2 res2 r_eq_res2 signed_bound_res2 />.
split.
rewrite /signed_bound_cxq => k k_i.
do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
have ->: !(256 <= 512 + k && 512 + k < 512).
  move : k_i => /#.
have ->: !(0 <= 512 + k && 512 + k < 256).
  move : k_i => /#.
simplify.
rewrite /signed_bound768_cxq /b16 in signed_bound_r; rewrite (signed_bound_r (512 + k)) 1:/#.

move => signed_bound_r3 res3 r_eq_res3 signed_bound_res3 />.
(* ========== *)
(* TODO: replace with aux lemmas *)
split.
  apply Array256.tP => k k_i.
  rewrite /lift_polyvec /=.
  do (rewrite initiE 1:/# /= || rewrite fun_if).
  rewrite k_i /=.
  rewrite (lift_array256_inzmod res1) 1:/# -r_eq_res1.
  rewrite -(lift_array256_sub_768 r{hr} (Array256.init ("_.[_]" r{hr})) _r 0) 1:/= // 1:_r_def //.
  move => k0 k0_i.
  rewrite _r_def addz0 /lift_array768 mapiE 1:/# /=.
  smt(@Array768 @Array256).
  move => k0 k0_i.
  rewrite initiE 1:k0_i => /#.
  smt(@Array768 @Array256 @List).

split.
  apply Array256.tP => i i_i.
  rewrite /lift_polyvec /=.
  do (rewrite initiE 1:/# /= || rewrite fun_if).
  have ->: 256 <= 256 + i && 256 + i < 512. move : i_i => /#.
  have ->: !(512 <= 256 + i && 256 + i < 768). move : i_i => /#.
  simplify.
  rewrite (lift_array256_inzmod res2) 1:/# -r_eq_res2 /=.
  rewrite (lift_array256_sub_768 r{hr} _ _r 256) 1:/= // 1:_r_def //.
  move => k0 k0_i.
  rewrite _r_def /lift_array768 mapiE 1:/# /=.
  smt(@Array768 @Array256).
  move => k0 k0_i.
  rewrite initiE 1:k0_i /= initiE 1:/# /=.
  smt(@Array768 @Array256).

split.
  apply Array256.tP => i i_i.
  rewrite /lift_polyvec /=.
  do (rewrite initiE 1:/# /= || rewrite fun_if).
  have ->: 512 <= 512 + i && 512 + i < 768. move : i_i => /#.
  simplify.
  rewrite (lift_array256_inzmod res3) 1:/# -r_eq_res3 /=.
  rewrite (lift_array256_sub_768 r{hr} _ _r 512) 1:/= // 1:_r_def //.
  move => k0 k0_i.
  rewrite _r_def /lift_array768 mapiE 1:/# /=.
  smt(@Array768 @Array256).
  move => k0 k0_i.
  rewrite initiE 1:k0_i /= initiE 1:/# /=.
  smt(@Array768 @Array256).

  move => k k_lb k_ub.
  do (rewrite initiE 1:/# /= || rewrite (fun_if W16.to_sint)).
  move : (signed_bound_res3 (k - 512)) (signed_bound_res2 (k - 256)) (signed_bound_res1 k).
  smt(bpos16E @Int @Array768 @Array256).
  (* ========== *)
qed.

lemma polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 (_r : zmod Array256.t) :
  array_mont zetas_const = lift_array128 jzetas =>
  _p0 = scale (basemul _a0 _b0) (inzmod 169) =>
  _p1 = scale (basemul _a1 _b1) (inzmod 169) =>
  _p2 = scale (basemul _a2 _b2) (inzmod 169) =>
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
move => zetas_def _p0_def _p1_def _p2_def _r_def; proc.
ecall (poly_reduce_corr_h (lift_array256 r)).
ecall (poly_add_corr (lift_array256 r) _p2 6 3).
call (poly_basemul_corr _a2 _b2 zetas_const).
call (poly_add_corr _p0 _p1 3 3).
call (poly_basemul_corr _a1 _b1 zetas_const).
call (poly_basemul_corr _a0 _b0 zetas_const).

wp; skip; subst => &hr [_a0_def [_a1_def [_a2_def [_b0_def [_b1_def [_b2_def [signed_bound_a signed_bound_b]]]]]]] * />.

split.
+ rewrite _a0_def _b0_def /lift_polyvec /lift_array256 mapE.
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split; first by move : signed_bound_a; smt(@Array256 @Array768).
  by move : signed_bound_b; smt(@Array256 @Array768).

move => _ _a0_ddef _b0_ddef signed_bound_a0 signed_bound_b0 r0 signed_bound_r0 a0tb0_eq_r0.
split.
+ rewrite _a1_def _b1_def /lift_polyvec /lift_array256 mapE.
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split; first by move : signed_bound_a; smt(@Array256 @Array768).
  by move : signed_bound_b; smt(@Array256 @Array768).

move => _a1_ddef _b1_ddef signed_bound_a1 signed_bound_b1 r1 signed_bound_r1 a1tb1_eq_r1.
split.
+ smt(basemul_scales).

move => a0tb0f_eq_r0 a1tb1f_eq_r1 res1 signed_bound_res1 res1_def.

split.
+ rewrite _a2_def _b2_def /lift_polyvec /lift_array256 mapE.
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split. apply Array256.ext_eq; smt(Array256.initiE).
  split; first by move : signed_bound_a; smt(@Array256 @Array768).
  by move : signed_bound_b; smt(@Array256 @Array768).

move => _a2_ddef _b2_ddef signed_bound_a2 signed_bound_b2 r2 signed_bound_r2 a2tb2_eq_r2.
split.
+ smt(basemul_scales).

move => a2tb2f_eq_r2 res2 signed_bound_res2 res2_eq_a2tb2red r4 r2_eq_r4 signed_bound_r4.
rewrite -r2_eq_r4.
apply Array256.ext_eq => x x_i.
rewrite /lift_array256 mapiE 1:x_i /= res2_eq_a2tb2red 1:x_i.
rewrite /lift_array256 mapiE 1:x_i /= res1_def 1:x_i.
rewrite _r_def 1:x_i.
rewrite _a0_def _a1_def _a2_def /= /lift_polyvec /=.
rewrite _b0_def _b1_def _b2_def /= /lift_polyvec /=.
do congr; by apply Array256.ext_eq => k k_i; rewrite -lift_array256_inzmod 1:k_i; smt(@Array256 @Array768).
qed.

end KyberPolyVec.

