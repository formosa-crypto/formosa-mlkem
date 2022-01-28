require import AllCore List IntDiv CoreMap.
from Jasmin require  import JModel JMemory.
require import W16extra Array256 Array128 Array768.
require import Fq.
require import KyberPoly.
require import NTT_Fq.
require import Kyber.


require import Jindcpa.

theory KyberPolyVec.

import NTT_Fq.
import MLWEPKE.MLWE_.Matrix_.
import Zq.
import KyberPoly.

(* AUX *)

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

op lift_polyvec(row :  W16.t Array768.t, c : int) = 
   Array256.init (fun i => inFq (W16.to_sint row.[c*256 + i])). 

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

lemma lift_array256_sub_768 a (b : W16.t Array256.t) x n :
  0 <= n =>
  lift_array768 a = x =>
  (forall (k : int), 0 <= k < 256 => inFq (to_sint b.[k]) = x.[k+n]) =>
  (forall (k : int), 0 <= k < 256 => b.[k] = a.[k+n]) =>
  lift_array256 b = Array256.of_list witness (sub x n 256).
proof.
  rewrite /lift_array768 => H H0 H1 H2.
  rewrite /lift_array256 tP => j H3.
  rewrite mapE /of_list !initE H3 /=.
  by rewrite H1 // nth_sub // addzC.
qed.

lemma inFq_lift_array256 (x : W16.t t) y n :
  0 <= n <= 512 =>
  (forall (k : int), 0 <= k < 256 => inFq (to_sint x.[k+n]) = (lift_array256 y).[k]) =>
  lift_array256 y = Array256.of_list witness (sub (lift_array768 x) n 256).
proof.
  move => H H0; rewrite tP => j H1.
  rewrite -H0 //.
  rewrite /of_list initE H1 /= nth_sub // /lift_array768 mapiE // /#. 
qed.

lemma lift_array768E (x : W16.t t) k :
  0 <= k < 768 =>
  (lift_array768 x).[k] = inFq (to_sint x.[k]).
proof.  by move => ?; rewrite /lift_array768 mapiE //. qed.

lemma lift_array768_eq (x y : W16.t t) :
  (forall k, 0 <= k < 256 =>
    inFq (to_sint x.[k]) = (Array256.of_list witness (sub (lift_array768 y) 0 256)).[k]) =>
  (forall k, 0 <= k < 256 =>
    inFq (to_sint x.[k+256]) = (Array256.of_list witness (sub (lift_array768 y) 256 256)).[k]) =>
  (forall k, 0 <= k < 256 =>
    inFq (to_sint x.[k+512]) = (Array256.of_list witness (sub (lift_array768 y) 512 256)).[k]) =>
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

(* END AUX *)

lemma polyvec_topolys_corr_h ap ab pv' :
      hoare[ M.polyvec_topolys :
           pv = pv' /\ ap = lift_array768 pv /\
           signed_bound768_cxq pv 0 768 ab 
           ==>
           signed_bound_cxq res.`1 0 256 ab /\ 
           signed_bound_cxq res.`2 0 256 ab /\ 
           signed_bound_cxq res.`3 0 256 ab /\ 
           (forall k, 0 <= k < 256 => res.`1.[k] = pv'.[k]) /\
           (forall k, 0 <= k < 256 => res.`2.[k] = pv'.[k+256]) /\
           (forall k, 0 <= k < 256 => res.`3.[k] = pv'.[k+512]) /\
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`1.[k]) = ap.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`2.[k]) = ap.[256+k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`3.[k]) = ap.[512+k])]. 
proof.
  proc. 
  while ((forall k, 0 <= k < to_uint i => r2.[k] = pv.[k + 512]) /\ 
          0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 512).
  + wp; skip => /> &hr; rewrite /(\ult) /= => *.
    by rewrite !to_uintD_small /= 1,2:/#; smt (Array256.get_setE).
  wp; while ((forall k, 0 <= k < to_uint i => r1.[k] = pv.[k + 256]) /\ 
              0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 256).
  + wp; skip => /> &hr; rewrite /(\ult) /= => *.
    by rewrite !to_uintD_small /= 1,2:/#; smt (Array256.get_setE).
  wp; while ((forall k, 0 <= k < to_uint i => r0.[k] = pv.[k]) /\
              0 <= to_uint i <= 256).
  + wp; skip => /> &hr; rewrite /(\ult) /= => *.
    by rewrite to_uintD_small /= 1:/#; smt (Array256.get_setE).
  wp; skip => /> => &hr; rewrite /(\ult) /=. 
  smt (lift_array768_inFq).
qed.

lemma polyvec_topolys_ll  :
      islossless M.polyvec_topolys.
proof.
admitted.

lemma polyvec_topolys_corr ap ab pv' :
      phoare[ M.polyvec_topolys :
           pv = pv' /\ ap = lift_array768 pv /\
           signed_bound768_cxq pv 0 768 ab 
           ==>
           signed_bound_cxq res.`1 0 256 ab /\ 
           signed_bound_cxq res.`2 0 256 ab /\ 
           signed_bound_cxq res.`3 0 256 ab /\ 
           (forall k, 0 <= k < 256 => res.`1.[k] = pv'.[k]) /\
           (forall k, 0 <= k < 256 => res.`2.[k] = pv'.[k+256]) /\
           (forall k, 0 <= k < 256 => res.`3.[k] = pv'.[k+512]) /\
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`1.[k]) = ap.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`2.[k]) = ap.[256+k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`3.[k]) = ap.[512+k])] = 1%r 
by conseq polyvec_topolys_ll (polyvec_topolys_corr_h ap ab pv').
 
lemma polyvec_frompolys_corr_h _p0 _p1 _p2 a1p a2p a3p ab :
      hoare[ M.polyvec_frompolys :
           a1p = lift_array256 p0 /\
           signed_bound_cxq p0 0 256 ab /\
           a2p = lift_array256 p1 /\
           signed_bound_cxq p1 0 256 ab /\
           a3p = lift_array256 p2 /\
           signed_bound_cxq p2 0 256 ab /\
           _p0 = p0 /\ _p1 = p1 /\ _p2 = p2
           ==>
           signed_bound768_cxq res 0 768 ab /\ 
           (forall k, 0 <= k < 256 => res.[k] = _p0.[k]) /\
           (forall k, 0 <= k < 256 => res.[k+256] = _p1.[k]) /\
           (forall k, 0 <= k < 256 => res.[k+512] = _p2.[k]) /\
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = a1p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k+256]) = a2p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k+512]) = a3p.[k])].
proof.
  proc; while ((forall k, 0 <= k < 256 => r.[k] = p0.[k]) /\ 
                (forall k, 0 <= k < 256 => r.[k+256] = p1.[k]) /\ 
                (forall k, 0 <= k < to_uint i => r.[k+512] = p2.[k]) /\ 
                0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 512).
    wp; skip => /> &hr; rewrite /(\ult) /= => *. 
    rewrite !to_uintD_small /= 1,2:/#;smt(get_setE).
  wp; while ((forall k, 0 <= k < 256 => r.[k] = p0.[k]) /\ 
                (forall k, 0 <= k < to_uint i => r.[k+256] = p1.[k]) /\ 
                0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 256).
    wp; skip => /> &hr; rewrite /(\ult) /= => *.
    rewrite !to_uintD_small /= 1,2:/#; smt(get_setE).
  wp; while ((forall k, 0 <= k < to_uint i => r.[k] = p0.[k]) /\ 0 <= to_uint i <= 256).
    wp; skip => /> &hr; rewrite /(\ult) /= => *.
    rewrite to_uintD_small 1:/#; smt(get_setE).
  wp; skip => /> *; rewrite /(\ult) /= => *.
  do split => //. smt(). 
  move => *.
  do split => //. smt(). smt().
  move => *. 
  do split => //.  smt().  smt(). 
  move => *. 
  do split => //; first last.  
  smt().  
  smt (lift_array256_inFq).
  smt (lift_array256_inFq).
  smt (lift_array256_inFq).
  rewrite /signed_bound768_cxq => k *.
  case (0 <= k < 256). smt().
  case (256 <= k < 512). smt().
  smt().  
qed.

lemma polyvec_frompolys_ll  :
      islossless M.polyvec_frompolys.
admitted.

lemma polyvec_frompolys_corr _p0 _p1 _p2 a1p a2p a3p ab :
      phoare[ M.polyvec_frompolys :
           a1p = lift_array256 p0 /\
           signed_bound_cxq p0 0 256 ab /\
           a2p = lift_array256 p1 /\
           signed_bound_cxq p1 0 256 ab /\
           a3p = lift_array256 p2 /\
           signed_bound_cxq p2 0 256 ab /\
           _p0 = p0 /\ _p1 = p1 /\ _p2 = p2
           ==>
           signed_bound768_cxq res 0 768 ab /\ 
           (forall k, 0 <= k < 256 => res.[k] = _p0.[k]) /\
           (forall k, 0 <= k < 256 => res.[k+256] = _p1.[k]) /\
           (forall k, 0 <= k < 256 => res.[k+512] = _p2.[k]) /\
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = a1p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k+256]) = a2p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k+512]) = a3p.[k])]  = 1%r 
by conseq polyvec_frompolys_ll (polyvec_frompolys_corr_h _p0 _p1 _p2 a1p a2p a3p ab).
 
lemma polyvec_csubq_corr ap :
      hoare[ M.polyvec_csubq :
           ap = lift_array768 r /\
           pos_bound768_cxq r 0 768 2 
           ==>
           ap = lift_array768 res /\
           pos_bound768_cxq res 0 768 1 ] . 
proof.
  move => *; proc; sp. 
  ecall (polyvec_frompolys_corr_h r0 r1 r2
                               (Array256.of_list witness (sub ap 0 256)) 
                               (Array256.of_list witness (sub ap 256 256)) 
                               (Array256.of_list witness (sub ap 512 256)) 1).
  ecall (poly_csubq_corr_h (Array256.of_list witness (sub ap 512 256))).
  ecall (poly_csubq_corr_h (Array256.of_list witness (sub ap 256 256))).
  ecall (poly_csubq_corr_h (Array256.of_list witness (sub ap 0 256))).
  ecall (polyvec_topolys_corr_h ap 2 r); skip => />.
  move=> &hr H. 
  split; 1: smt().
  move=> H0 result H1 H2 H3 H4 H5 H6 H7 H8 H9; split; 1:smt(lift_array256_sub_768).
  move=> H10 H11 result0 H12 H13; split; 1:smt(lift_array256_sub_768).
  move=> H14 H15 result1 H16 H17; split; 1:smt(lift_array256_sub_768).
  move=> H18 H19 result2 H20 H21; split; 1:smt().
  move=> H22 H23 H24 result3 H25 H26 H27 H28 H29 H30 H31; split; 1:smt(lift_array768_eq).
  rewrite /pos_bound768_cxq => k *.
  case (0 <= k < 256). smt().
  case (256 <= k < 512).
  move => *. pose kp := k - 256.
   have -> : result3.[k] = result3.[kp + 256]; 1: smt().
    rewrite (H27 kp _); smt().
  move => *. pose kp := k - 512.
   have -> : result3.[k] = result3.[kp + 512]; 1: smt().
    rewrite (H28 kp _); smt().
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

lemma compressimpl64 (a : W16.t) :
  bpos16 a q =>
  inFq
  (to_sint (truncateu16
         ((((zeroextu64 a `<<` (of_int 10)%W8) + (of_int 1665)%W64) * (of_int 1290167)%W64 `>>`
           (of_int 32)%W8) `&`
          (of_int 1023)%W64))) = compress 10 (inFq (to_sint a)).
proof.
rewrite /zeroextu64 /truncateu16 -compress_alt_compress; 1..2 : smt(). 
rewrite /compress_alt qE => /> *.
rewrite (_: W64.of_int 1023 = W64.masklsb 10); first by rewrite /max /=.
rewrite W64.and_mod 1:// /max /= !W64.of_uintK to_sintE /(`<<`) /(`>>`) W64.shlMP 1:/#.
rewrite W64.to_uint_shr 1:/# W16.of_uintK; congr.
rewrite inFqK to_sintE qE /=.
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

lemma compress_rng (a : W16.t) :
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
have ? : 0<= to_uint xx < 1024 by smt(@W64).
have ? : 0<= to_uint (truncateu16 xx) < 1024.
+ rewrite /truncateu16; smt(@W16 @W64).
by rewrite /max /smod /=;  smt(@W16).
qed.

(*
lemma polyvec_compress_round_corr ap :
      hoare[ M.polyvec_compress_round :
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
  smt(roundcimpl_rng get_setE).
call (polyvec_csubq_corr ap). 
wp; skip => /> *; split; 1: smt().
rewrite /(\ult) /= => i0 r0 *; split; 2: smt().
rewrite tP => j *; rewrite mapiE //; smt(@Array768).
qed.
*)

(******************************************************)
(* FIXME: this is a dirty hack, it should be defined like that in KyberPoly *)
lemma poly_add_corr (_a _b : Fq Array256.t) (ab bb : int) :
    hoare[ Jindcpa.M.poly_add2 :
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

lemma polyvec_add_corr _a _b ab bb :
      hoare[ M.polyvec_add2 :
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
proc.
ecall (polyvec_frompolys_corr_h r0 r1 r2 (lift_array256 r0) (lift_array256 r1) (lift_array256 r2) (ab + bb)).
ecall (poly_add_corr (lift_array256 r2) (lift_array256 b2) ab bb).
ecall (poly_add_corr (lift_array256 r1) (lift_array256 b1) ab bb).
ecall (poly_add_corr (lift_array256 r0) (lift_array256 b0) ab bb).
ecall (polyvec_topolys_corr_h _b bb b).
ecall (polyvec_topolys_corr_h _a ab r).
wp; skip => />.
move => &hr ?????????? H11 H12 H13 H14 H15 H16????????? ?? H17 H18 ?  H19 H20 ? H21 ?? H22 H23 H24 H25 H26?? k??.
case (0 <= k < 256).
by smt(@Array768 @Array256).
case (256 <= k < 512).
move => *. 
pose kp := k - 256.
have -> : k = kp + 256; 1:  smt().
rewrite H24; 1: smt(). 
by smt(@Array768 @Array256).
move => *. 
pose kp := k - 512.
have -> : k = kp + 512; 1:  smt().
rewrite H25; 1: smt(). 
by smt(@Array768 @Array256).
qed.

(******************************************************)

lemma polyvec_topolys_corr_aux ap pv' :
      hoare[ M.polyvec_topolys :
           pv = pv' /\ ap = lift_array768 pv
           ==>
           (forall k, 0 <= k < 256 => res.`1.[k] = pv'.[k]) /\
           (forall k, 0 <= k < 256 => res.`2.[k] = pv'.[k+256]) /\
           (forall k, 0 <= k < 256 => res.`3.[k] = pv'.[k+512]) /\
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`1.[k]) = ap.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`2.[k]) = ap.[256+k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`3.[k]) = ap.[512+k])]. 
proof.
  proc.
  while ((forall k, 0 <= k < to_uint i => r2.[k] = pv.[k + 512]) /\ 
                0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 512).
  + wp; skip => /> &hr; rewrite /(\ult) /= => *.
    rewrite !to_uintD_small /= 1,2:/# => *; smt(Array256.get_setE).
  wp; while ((forall k, 0 <= k < to_uint i => r1.[k] = pv.[k + 256]) /\ 
              0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 256).
    wp; skip => /> &hr; rewrite /(\ult) /= => *. 
    rewrite !to_uintD_small /= 1,2:/#; smt(Array256.get_setE).
  wp; while ((forall k, 0 <= k < to_uint i => r0.[k] = pv.[k]) /\
              0 <= to_uint i <= 256).
    wp; skip => /> &hr; rewrite /(\ult) /= => *. 
    rewrite to_uintD_small /= 1:/#; smt(Array256.get_setE).
  wp; skip => /> => *; rewrite /(\ult) /=; smt (lift_array768_inFq).
qed.

lemma polyvec_reduce_corr _a :
      hoare[ M.polyvec_reduce :
          _a = lift_array768 r ==> 
          _a = lift_array768 res /\
          forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)].
proof.
proc.
ecall (polyvec_frompolys_corr_h r0 r1 r2 (lift_array256 r0) (lift_array256 r1) (lift_array256 r2) 2).
ecall (poly_reduce_corr_h (lift_array256 r2)).
ecall (poly_reduce_corr_h (lift_array256 r1)).
ecall (poly_reduce_corr_h (lift_array256 r0)).
ecall (polyvec_topolys_corr_aux _a r).
wp; skip => /> &hr ???? ????????????.
split; 1: by rewrite /signed_bound_cxq; smt (b16E).
move=> ?????H H0 H1 H2 H3 H4; split.
apply tP => k *.
rewrite /lift_array768 => *.
rewrite !Array768.mapiE //=.
case (0 <= k < 256). 
move => *; rewrite H; 1: smt(). 
smt(lift_array768_inFq lift_array256_inFq).
case (256 <= k < 512).
pose kp := k - 256.
have -> : k = kp + 256; 1: smt(). 
move => *; rewrite H0; 1: smt(). 
smt(lift_array768_inFq lift_array256_inFq).
smt(lift_array768_inFq lift_array256_inFq).
move => k *.
case (0 <= k < 256). 
move => *; rewrite H; 1: smt(). 
smt(lift_array768_inFq lift_array256_inFq).
case (256 <= k < 512).
pose kp := k - 256.
have -> : k = kp + 256; 1: smt(). 
move => *; rewrite H0; 1: smt(). 
smt(lift_array768_inFq lift_array256_inFq).
pose kp := k - 512.
have -> : k = kp + 512; 1: smt(). 
move => *; rewrite H1; 1: smt(). 
smt(lift_array768_inFq lift_array256_inFq).
qed.

(*
import Array5.
lemma polyvec_decompress_restore_corr ap :
      hoare[ M.polyvec_decompress_restore :
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
   + auto => /> &hr *.
     by rewrite to_uintD_small /= 1:/#; smt (Array5.get_setE Array768.get_setE). 
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

require import Jindcpa.

lemma ntt_correct_h (_r0 : Fq Array256.t):
      hoare[ M.poly_ntt :
               _r0 = lift_array256 arg /\
               array_mont zetas_const = lift_array128 jzetas /\ signed_bound_cxq arg 0 256 2 ==>
               ntt _r0 = lift_array256 res /\
               forall (k : int), 0 <= k && k < 256 => bpos16 res.[k] (2 * q)]
 by conseq (ntt_correct _r0). 

lemma polyvec_ntt_correct _r:
   hoare[ M.polyvec_ntt :
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
proc.
ecall (polyvec_frompolys_corr_h r0 r1 r2 (lift_array256 r0) (lift_array256 r1) (lift_array256 r2) 2).
ecall (ntt_correct_h (lift_array256 r2)).
ecall (ntt_correct_h (lift_array256 r1)).
ecall (ntt_correct_h (lift_array256 r0)).
ecall (polyvec_topolys_corr_h _r 2 r).
wp; skip => /> &hr 2? result 6? H1 H2 H3 ? H4 ? ? H5 ? ? H6 ?.
split.
 + rewrite /signed_bound_cxq=> />; do split; smt(b16E). 
move=>5? H7 H8 H9 H10 H11 H12; split.
+ apply Array256.tP => i hi.
  rewrite /lift_polyvec /= initiE 1:// /= H10 1:// -H4.
  congr; congr.
  apply Array256.tP => j hj.
  smt(@Array256 @Array768).
split.
+ apply Array256.tP => i hi.
  rewrite /lift_polyvec /= initiE 1:// /= addzC H11 1:// -H5.
  congr; congr.
  apply Array256.tP => j hj.
  smt(@Array256 @Array768).
split.
  apply Array256.tP => i hi.
  rewrite /lift_polyvec /= initiE 1:// /= addzC H12 1:// -H6.
  congr; congr.
  apply Array256.tP => j hj.
  smt(@Array256 @Array768).
rewrite /pos_bound768_cxq.
move => k *.
case (0 <= k < 256).
 smt (bpos16E). 
case (256 <= k < 512).
move => *.
pose kp := k - 256.
have -> : k = kp + 256; 1: smt().
rewrite H8; 1: smt().
 smt (bpos16E). 
case (512 <= k < 768).
move => *.
pose kp := k - 512.
have -> : k = kp + 512; 1: smt().
rewrite H9; 1: smt().
 smt (bpos16E). 
 smt (). 
qed.

lemma invntt_correct_h (_r : Fq Array256.t):
      hoare[  M.poly_invntt :
             _r = lift_array256 arg /\
             array_mont_inv zetas_inv_const = lift_array128 jzetas_inv /\ signed_bound_cxq arg 0 256 2 ==>
             scale (invntt _r) (inFq Fq.SignedReductions.R) = lift_array256 res /\
             forall (k : int), 0 <= k && k < 256 => b16 res.[k] (q + 1)]
by conseq (invntt_correct _r). 

lemma polyvec_invntt_correct _r:
   hoare[ M.polyvec_invntt :
        _r = lift_array768 r /\
        array_mont_inv zetas_inv_const = 
           lift_array128  jzetas_inv /\
        signed_bound768_cxq r 0 768 2
          ==> 
            scale (invntt (Array256.of_list witness (sub _r 0 256))) (inFq Fq.SignedReductions.R) = lift_polyvec res 0 /\
            scale (invntt (Array256.of_list witness (sub _r 256 256))) (inFq Fq.SignedReductions.R) = lift_polyvec res 1 /\
            scale (invntt (Array256.of_list witness (sub _r 512 256))) (inFq Fq.SignedReductions.R) = lift_polyvec res 2 /\
            forall (k : int), 0 <= k && k < 768 => b16 res.[k] (q + 1) ].
proof.
proc.
ecall (polyvec_frompolys_corr_h r0 r1 r2 (lift_array256 r0) (lift_array256 r1) (lift_array256 r2) 2).
ecall (invntt_correct_h (lift_array256 r2)).
ecall (invntt_correct_h (lift_array256 r1)).
ecall (invntt_correct_h (lift_array256 r0)).
ecall (polyvec_topolys_corr_h _r 2 r).
wp; skip => /> &hr ?? result 9? result0 h0 ? result1 h1 ? result2 h2 ?.
split. do split; smt (b16E qE).
move=> 5? H1 H2 H3 H4 H5 H6. 
rewrite /lift_polyvec.
split.
+ apply Array256.tP => i hi.
  rewrite initiE 1:// /=. 
  rewrite H4 1:// -h0.
  congr; congr; congr.
  apply Array256.tP => j hj.
  smt(@Array256 @Array768).
split.
+ apply Array256.tP => i hi.
  rewrite initiE 1:// /=. 
  rewrite addzC H5 1:// -h1.
  congr; congr; congr.
  apply Array256.tP => j hj.
  smt(@Array256 @Array768).
split.
+ apply Array256.tP => i hi.
  rewrite initiE 1:// /=. 
  rewrite addzC H6 1:// -h2.
  congr; congr; congr.
  apply Array256.tP => j hj.
  smt(@Array256 @Array768).
move => k *.
case (0 <= k < 256).
 smt (). 
case (256 <= k < 512).
move => *.
pose kp := k - 256.
have -> : k = kp + 256; 1: smt().
rewrite H2; 1: smt().
 smt (). 
case (512 <= k < 768).
move => *.
pose kp := k - 512.
have -> : k = kp + 512; 1: smt().
rewrite H3; 1: smt().
 smt (). 
 smt (). 
qed.

lemma polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 (_r : Fq Array256.t) :
  array_mont zetas_const = lift_array128 jzetas =>
  _p0 = scale (basemul _a0 _b0) (inFq 169) =>
  _p1 = scale (basemul _a1 _b1) (inFq 169) =>
  _p2 = scale (basemul _a2 _b2) (inFq 169) =>
  (forall k, 0 <=  k < 256 =>
     _r.[k] = _p0.[k] + _p1.[k] + _p2.[k])  =>
  hoare [ M.polyvec_pointwise_acc : 
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
move => *.
proc.
ecall (poly_reduce_corr_h (lift_array256 r)).
ecall (poly_add_corr (lift_array256 r) _p2 6 3).
call (poly_basemul_corr _a2 _b2 zetas_const).
call (poly_add_corr _p0 _p1 3 3).
call (poly_basemul_corr _a1 _b1 zetas_const).
call (poly_basemul_corr _a0 _b0 zetas_const).
ecall (polyvec_topolys_corr_h (lift_array768 b) 2 b).
ecall (polyvec_topolys_corr_h (lift_array768 a) 2 a).
wp; skip; subst => /> &hr /> *.
split.
+ rewrite /lift_polyvec /lift_array256 mapE. 
  split; apply Array256.ext_eq; smt(Array256.initiE). 
move=> *;split.
+ rewrite /lift_polyvec /lift_array256 mapE. 
  split; apply Array256.ext_eq; smt(Array256.initiE).
move=> *; split. 
+ smt(basemul_scales).
move=> *; split.
+ rewrite /lift_polyvec /lift_array256 mapE. 
  split; apply Array256.ext_eq; smt(Array256.initiE).
move=> *; split.
+ smt(basemul_scales).
move=> *; apply Array256.ext_eq; smt(@Array256).
qed.

end KyberPolyVec.

