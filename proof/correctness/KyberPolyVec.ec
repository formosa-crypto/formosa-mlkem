require import List Int IntExtra IntDiv CoreMap IntDiv.
from Jasmin require  import JModel JMemory.
require import W16extra Array256 Array128 Array768.
require import Fq.
require import KyberPoly.

theory KyberPolyVec.

import KyberPoly.
import Fq.
import Kyber_.
import ZModRing.

op lift_array768 (p : W16.t Array768.t) =
  Array768.map (fun x => inzmod (W16.to_sint x)) p.

op lift_polyvec(row :  W16.t Array768.t, c : int) = 
   Array256.init (fun i => inzmod (W16.to_sint row.[c*256 + i])). 

op signed_bound768_cxq (coefs : W16.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => b16 coefs.[k] (c * q).

op pos_bound768_cxq (coefs : W16.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).


import MLWEPKE.H_MLWE.M.


require import IndcpaDerand.

print Mderand.


lemma mulvec a b :
   dotp a b = 
    invntt (basemul (ntt a.[0]) (ntt b.[0])) +
    invntt (basemul (ntt a.[1]) (ntt b.[1])) +
    invntt (basemul (ntt a.[2]) (ntt b.[2])).
move : (mul_sem a.[0] b.[0] Fq.Kyber_.ZModRing.one).
move : (mul_sem a.[1] b.[1] Fq.Kyber_.ZModRing.one).
move : (mul_sem a.[2] b.[2] Fq.Kyber_.ZModRing.one).
rewrite /scale /basemul /( *) => *.
rewrite /dotp  /Big.BAdd.big /( *) /range /predT => />; ring.
rewrite (_: b.[2] * a.[2] = invntt (basemul (ntt a.[2]) (ntt b.[2]))).
rewrite (_:  invntt (basemul (ntt a.[2]) (ntt b.[2])) = 
    invntt (map (fun (x : zmod) => inzmod (asint x * asint ZModRing.one)) (basemul (ntt a.[2]) (ntt b.[2])))).
congr; apply Array256.ext_eq => *.
rewrite Array256.mapiE => />. 
move : H; rewrite (_: asint ZModRing.one = 1); first by smt(@ZModRing).
by auto => />; rewrite asintK.
rewrite H (_: asint ZModRing.one = 1); first by smt(@ZModRing).
auto => />; rewrite (_: (fun (x : zmod) => inzmod (asint x))  = idfun).
by apply fun_ext => *; rewrite asintK.
by apply Array256.ext_eq => *; rewrite mapiE /idfun => />; congr; ring.
rewrite (_: b.[1] * a.[1] = invntt (basemul (ntt a.[1]) (ntt b.[1]))).
rewrite (_:  invntt (basemul (ntt a.[1]) (ntt b.[1])) = 
    invntt (map (fun (x : zmod) => inzmod (asint x * asint ZModRing.one)) (basemul (ntt a.[1]) (ntt b.[1])))).
congr; apply Array256.ext_eq => *.
rewrite Array256.mapiE => />. 
move : H; rewrite (_: asint ZModRing.one = 1); first by smt(@ZModRing).
by auto => />; rewrite asintK.
rewrite H0 (_: asint ZModRing.one = 1); first by smt(@ZModRing).
auto => />; rewrite (_: (fun (x : zmod) => inzmod (asint x))  = idfun).
by apply fun_ext => *; rewrite asintK.
by apply Array256.ext_eq => *; rewrite mapiE /idfun => />; congr; ring.
rewrite (_: b.[0] * a.[0] = invntt (basemul (ntt a.[0]) (ntt b.[0]))).
rewrite (_:  invntt (basemul (ntt a.[0]) (ntt b.[0])) = 
    invntt (map (fun (x : zmod) => inzmod (asint x * asint ZModRing.one)) (basemul (ntt a.[0]) (ntt b.[0])))).
congr; apply Array256.ext_eq => *.
rewrite Array256.mapiE => />. 
move : H; rewrite (_: asint ZModRing.one = 1); first by smt(@ZModRing).
by auto => />; rewrite asintK.
rewrite H1 (_: asint ZModRing.one = 1); first by smt(@ZModRing).
auto => />; rewrite (_: (fun (x : zmod) => inzmod (asint x))  = idfun).
by apply fun_ext => *; rewrite asintK.
by apply Array256.ext_eq => *; rewrite mapiE /idfun => />; congr; ring.
by ring.
qed.

require import IndcpaDerand.

lemma lift_array768_inzmod (a : W16.t t) k :
  0 <= k < 768 =>
  inzmod (to_sint a.[k]) = (lift_array768 a).[k].
proof. by move => ?; rewrite /lift_array768 mapE /= initE H. qed.

lemma signed_bound768_signed_bound (a : W16.t t) (b : W16.t Array256.t) n i (sa sb : int) x :
  0 <= n <= sa - sb => 0 <= i <= 256 =>
  signed_bound768_cxq a i sa x =>
  (forall k, 0 <= k < sb => b.[k] = a.[k+n]) =>
  signed_bound_cxq b i sb x.
proof.
  rewrite /signed_bound768_cxq /signed_bound_cxq => *.
  by rewrite H2 1:/# H1 1:/#.
qed.

lemma polyvec_topolys_corr ap ab pv' :
      hoare[ Mderand.polyvec_topolys :
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
              inzmod (to_sint res.`1.[k]) = ap.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inzmod (to_sint res.`2.[k]) = ap.[256+k]) /\ 
           (forall k, 0 <= k < 256 =>
              inzmod (to_sint res.`3.[k]) = ap.[512+k])]. 
proof.
  proc. while ((forall i, 0 <= i < 256 => r0.[i] = pv.[i]) /\ 
                (forall i, 0 <= i < 256 => r1.[i] = pv.[i + 256]) /\ 
                (forall k, 0 <= k < to_uint i => r2.[k] = pv.[k + 512]) /\ 
                0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 512).
    wp; skip => /> *; split => *.
      rewrite get_setE.
        by move : H5; rewrite ultE of_uintK pmod_small //. 
        case (k = to_uint i{hr}) => ?; first by smt().
          by rewrite H1; move : H7; rewrite to_uintD_small 1,2:/#.
      split; first split.
        by move : H5; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
        by move : H5; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
        by rewrite !to_uintD_small 1,2:/# /#.
  wp; while ((forall i, 0 <= i < 256 => r0.[i] = pv.[i]) /\ 
              (forall k, 0 <= k < to_uint i => r1.[k] = pv.[k + 256]) /\ 
              0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 256).
    wp; skip => /> *; split => *.
      rewrite get_setE.
        by move : H4; rewrite ultE of_uintK pmod_small //. 
        case (k = to_uint i{hr}) => ?; first by smt().
          by rewrite H0; move : H6; rewrite to_uintD_small 1,2:/#.
      split; first split.
        by move : H4; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
        by move : H4; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
        by rewrite !to_uintD_small 1,2:/# /#.
  wp; while ((forall k, 0 <= k < to_uint i => r0.[k] = pv.[k]) /\
              0 <= to_uint i <= 256).
    wp; skip => /> *; split => *.
      rewrite get_setE.
        by move : H2; rewrite ultE of_uintK pmod_small //. 
        case (k = to_uint i{hr}) => ?; first by smt().
          by rewrite H; move : H4; rewrite to_uintD_small 1,2:/#.
    split.
      by move : H2; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
      by move : H2; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
  wp; skip => /> => *; split; first by smt().
  move => *; split; first split.
    by move => *; rewrite H1; move : H0; rewrite ultE of_uintK pmod_small // /#.
    by smt().
  move => *; split; first split.
    by move => *; rewrite H6; move : H4; rewrite ultE of_uintK pmod_small // /#.
    by smt().
  move => *. 
  have ?: to_uint i2 = 256 by move : H10; rewrite ultE of_uintK pmod_small // /#.
  do split.
    by rewrite (signed_bound768_signed_bound pv{hr} _ 0 _ 768 _ _).
    by rewrite (signed_bound768_signed_bound pv{hr} _ 256 _ 768 _ _).
    by rewrite (signed_bound768_signed_bound pv{hr} _ 512 _ 768 _ _) // /#.
    by move => *; rewrite H12 // /#.
    by move => *; rewrite H5 // lift_array768_inzmod 1:/#.
    by move => *; rewrite H11 // lift_array768_inzmod 1:/# addzC.
    by move => *; rewrite H12 1:/# lift_array768_inzmod 1:/# addzC.
qed.

lemma lift_array256_inzmod (a : W16.t Array256.t) k :
  0 <= k < 256 =>
  inzmod (to_sint a.[k]) = (lift_array256 a).[k].
proof. by move => ?; rewrite /lift_array256 mapE /= initE H. qed.

lemma signed_bound256_signed_bound (a : W16.t t) (b c d : W16.t Array256.t) x :
  signed_bound_cxq b 0 256 x =>
  signed_bound_cxq c 0 256 x =>
  signed_bound_cxq d 0 256 x =>
  (forall k, 0 <= k < 256 => a.[k] = b.[k]) =>
  (forall k, 256 <= k < 512 => a.[k] = c.[k-256]) =>
  (forall k, 512 <= k < 768 => a.[k] = d.[k-512]) =>
  signed_bound768_cxq a 0 768 x.
proof.
  rewrite /signed_bound768_cxq /signed_bound_cxq => *.
  case (k < 256) => hb.
    by rewrite H2 1:/# H 1:/#.
  case (k < 512) => hc.
    by rewrite H3 1:/# H0 1:/#.
  by rewrite H4 1:/# H1 1:/#.
qed.

lemma pos_bound256_pos_bound768 (a : W16.t t) (b c d : W16.t Array256.t) x :
  pos_bound256_cxq b 0 256 x =>
  pos_bound256_cxq c 0 256 x =>
  pos_bound256_cxq d 0 256 x =>
  (forall k, 0 <= k < 256 => a.[k] = b.[k]) =>
  (forall k, 256 <= k < 512 => a.[k] = c.[k-256]) =>
  (forall k, 512 <= k < 768 => a.[k] = d.[k-512]) =>
  pos_bound768_cxq a 0 768 x.
proof.
  rewrite /pos_bound768_cxq /pos_bound256_cxq => *.
  case (k < 256) => hb.
    by rewrite H2 1:/# H 1:/#.
  case (k < 512) => hc.
    by rewrite H3 1:/# H0 1:/#.
  by rewrite H4 1:/# H1 1:/#.
qed.

lemma polyvec_frompolys_corr a1p a2p a3p ab :
      hoare[ Mderand.polyvec_frompolys :
           a1p = lift_array256 p0 /\
           signed_bound_cxq p0 0 256 ab /\
           a2p = lift_array256 p1 /\
           signed_bound_cxq p1 0 256 ab /\
           a3p = lift_array256 p2 /\
           signed_bound_cxq p2 0 256 ab 
           ==>
           signed_bound768_cxq res 0 768 ab /\ 
           (forall k, 0 <= k < 256 =>
              inzmod (to_sint res.[k]) = a1p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inzmod (to_sint res.[k+256]) = a2p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inzmod (to_sint res.[k+512]) = a3p.[k])].
proof.
  proc; while ((forall k, 0 <= k < 256 => r.[k] = p0.[k]) /\ 
                (forall k, 0 <= k < 256 => r.[k+256] = p1.[k]) /\ 
                (forall k, 0 <= k < to_uint i => r.[k+512] = p2.[k]) /\ 
                0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 512).
    wp; skip => /> *; do split.
      move => *; rewrite get_setE; first by move : H5; rewrite ultE of_uintK pmod_small // /#. 
      cut ->: k = to_uint j{hr} <=> false by smt().
      by rewrite H //.
      move => *; rewrite get_setE; first by move : H5; rewrite ultE of_uintK pmod_small // /#. 
      cut ->: k + 256 = to_uint j{hr} <=> false by smt().
      by rewrite H0 //.
      move => *; rewrite get_setE; first by move : H5; rewrite ultE of_uintK pmod_small // /#. 
      case (k + 512 = to_uint j{hr}) => ?; first by smt().
        by rewrite H1; move : H7; rewrite to_uintD_small 1,2:/#.
      by move : H5; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
      by move : H5; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
      by rewrite !to_uintD_small 1,2:/# /#.
  wp; while ((forall k, 0 <= k < 256 => r.[k] = p0.[k]) /\ 
                (forall k, 0 <= k < to_uint i => r.[k+256] = p1.[k]) /\ 
                0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 256).
    wp; skip => /> *; do split.
      move => *; rewrite get_setE; first by move : H4; rewrite ultE of_uintK pmod_small // /#. 
      cut ->: k = to_uint j{hr} <=> false by smt().
      by rewrite H //.
      move => *; rewrite get_setE; first by move : H4; rewrite ultE of_uintK pmod_small // /#. 
      case (k + 256 = to_uint j{hr}) => ?; first by smt().
        by rewrite H0; move : H6; rewrite to_uintD_small 1,2:/#.
      by move : H4; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
      by move : H4; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
      by rewrite !to_uintD_small 1,2:/# /#.
  wp; while ((forall k, 0 <= k < to_uint i => r.[k] = p0.[k]) /\ 0 <= to_uint i <= 256).
    wp; skip => /> *; do split.
      move => *; rewrite get_setE; first by move : H2; rewrite ultE of_uintK pmod_small // /#. 
      case (k = to_uint i{hr}) => ?; first by smt().
        by rewrite H; move : H4; rewrite to_uintD_small 1,2:/#.
      by move : H2; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
      by move : H2; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
  wp; skip => /> *; split; first by smt().
    move => *; do split.
      by move => *; rewrite H3; move : H2; rewrite ultE of_uintK pmod_small // /#.
      by smt().
    move => *; do split.
      by move => *; rewrite H8; move : H6; rewrite ultE of_uintK pmod_small // /#.
      by smt().
    move => *.
    have ?: to_uint i2 = 256 by move : H12; rewrite ultE of_uintK pmod_small // /#.
    do split.
      by rewrite (signed_bound256_signed_bound r2 p0{hr} p1{hr} p2{hr} ab) // /#.
      by move => *; rewrite H13 // lift_array256_inzmod 1:/#.
      by move => *; rewrite H14 // lift_array256_inzmod 1:/#.
      by move => *; rewrite H15 1:/# lift_array256_inzmod 1:/#.
qed.

lemma pos_polyvec_frompolys_corr a1p a2p a3p ab :
      hoare[ Mderand.polyvec_frompolys :
           a1p = lift_array256 p0 /\
           pos_bound256_cxq p0 0 256 ab /\
           a2p = lift_array256 p1 /\
           pos_bound256_cxq p1 0 256 ab /\
           a3p = lift_array256 p2 /\
           pos_bound256_cxq p2 0 256 ab 
           ==>
           pos_bound768_cxq res 0 768 ab /\ 
           (forall k, 0 <= k < 256 =>
              inzmod (to_sint res.[k]) = a1p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inzmod (to_sint res.[k+256]) = a2p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inzmod (to_sint res.[k+512]) = a3p.[k])].
proof.
  proc; while ((forall k, 0 <= k < 256 => r.[k] = p0.[k]) /\ 
                (forall k, 0 <= k < 256 => r.[k+256] = p1.[k]) /\ 
                (forall k, 0 <= k < to_uint i => r.[k+512] = p2.[k]) /\ 
                0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 512).
    wp; skip => /> *; do split.
      move => *; rewrite get_setE; first by move : H5; rewrite ultE of_uintK pmod_small // /#. 
      cut ->: k = to_uint j{hr} <=> false by smt().
      by rewrite H //.
      move => *; rewrite get_setE; first by move : H5; rewrite ultE of_uintK pmod_small // /#. 
      cut ->: k + 256 = to_uint j{hr} <=> false by smt().
      by rewrite H0 //.
      move => *; rewrite get_setE; first by move : H5; rewrite ultE of_uintK pmod_small // /#. 
      case (k + 512 = to_uint j{hr}) => ?; first by smt().
        by rewrite H1; move : H7; rewrite to_uintD_small 1,2:/#.
      by move : H5; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
      by move : H5; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
      by rewrite !to_uintD_small 1,2:/# /#.
  wp; while ((forall k, 0 <= k < 256 => r.[k] = p0.[k]) /\ 
                (forall k, 0 <= k < to_uint i => r.[k+256] = p1.[k]) /\ 
                0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 256).
    wp; skip => /> *; do split.
      move => *; rewrite get_setE; first by move : H4; rewrite ultE of_uintK pmod_small // /#. 
      cut ->: k = to_uint j{hr} <=> false by smt().
      by rewrite H //.
      move => *; rewrite get_setE; first by move : H4; rewrite ultE of_uintK pmod_small // /#. 
      case (k + 256 = to_uint j{hr}) => ?; first by smt().
        by rewrite H0; move : H6; rewrite to_uintD_small 1,2:/#.
      by move : H4; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
      by move : H4; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
      by rewrite !to_uintD_small 1,2:/# /#.
  wp; while ((forall k, 0 <= k < to_uint i => r.[k] = p0.[k]) /\ 0 <= to_uint i <= 256).
    wp; skip => /> *; do split.
      move => *; rewrite get_setE; first by move : H2; rewrite ultE of_uintK pmod_small // /#. 
      case (k = to_uint i{hr}) => ?; first by smt().
        by rewrite H; move : H4; rewrite to_uintD_small 1,2:/#.
      by move : H2; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
      by move : H2; rewrite ultE of_uintK pmod_small //; rewrite to_uintD_small 1,2:/#.
  wp; skip => /> *; split; first by smt().
    move => *; do split.
      by move => *; rewrite H3; move : H2; rewrite ultE of_uintK pmod_small // /#.
      by smt().
    move => *; do split.
      by move => *; rewrite H8; move : H6; rewrite ultE of_uintK pmod_small // /#.
      by smt().
    move => *.
    have ?: to_uint i2 = 256 by move : H12; rewrite ultE of_uintK pmod_small // /#.
    do split.
      by rewrite (pos_bound256_pos_bound768 r2 p0{hr} p1{hr} p2{hr} ab) // /#.
      by move => *; rewrite H13 // lift_array256_inzmod 1:/#.
      by move => *; rewrite H14 // lift_array256_inzmod 1:/#.
      by move => *; rewrite H15 1:/# lift_array256_inzmod 1:/#.
qed.

lemma pos_bound768_pos_bound (a : W16.t t) (b : W16.t Array256.t) i n (sa sb : int) x :
  0 <= n <= sa - sb => 0 <= i <= 256 =>
  pos_bound768_cxq a i sa x =>
  (forall k, 0 <= k < sb => b.[k] = a.[k+n]) =>
  pos_bound256_cxq b i sb x.
proof.
  rewrite /pos_bound768_cxq /pos_bound256_cxq => *.
  by rewrite H2 1:/# H1 1:/#.
qed.

lemma poly_csubq_corr ap ab :
1 < ab =>
      hoare[ Mderand.poly_csubq :
           ap = lift_array256 rp /\
           pos_bound256_cxq rp 0 256 ab 
           ==>
           ap = lift_array256 res /\
           pos_bound256_cxq res 0 256 (ab-1) ] . 
proof.
move => *.
proc.
while (ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 ab /\ pos_bound256_cxq rp 0 i (ab-1) /\ 0 <= i<=256).
seq 2 : (#pre /\ t = rp.[i] - W16.of_int 3329); first by auto => />.
seq 3 : (#pre /\ 
        (t \slt W16.zero => b = W16.of_int q) /\ 
        (W16.zero \sle t => b = W16.of_int 0)).
seq 2 : (#pre /\ 
        (t \slt W16.zero => b = W16.of_int (W16.modulus -1)) /\ 
        (W16.zero \sle t => b = W16.of_int 0)).
auto => /> *.
pose x := rp{hr}.[i{hr}] - (of_int 3329)%W16.
smt (getsign @W16).
auto => />.
move =>  *.
split. 
move => asp.
rewrite (H5 asp) qE  => />. 
apply W16.ext_eq => /> *.
rewrite m1true => />.
move => asp.
by rewrite (H6 asp)=> />. 
auto => />.
move => * />.
split. 
case (rp{hr}.[i{hr}] - (of_int 3329)%W16 \slt W16.zero).
move => asp.
rewrite (H5 asp) qE => />. 
rewrite /lift_array256 => />.
apply Array256.ext_eq => /> *.
rewrite mapiE => />.
rewrite mapiE => />.
case (x = i{hr}); last by smt(@Array256).
move => ->.
rewrite set_eqiE => />.
by rewrite (_: rp{hr}.[i{hr}] - (of_int 3329)%W16 + (of_int 3329)%W16 = rp{hr}.[i{hr}]);  ring.

move => *.
have asp : (W16.zero \sle rp{hr}.[i{hr}] - (of_int 3329)%W16); first by smt(@W16).
rewrite (H6 asp) => />. 
apply Array256.ext_eq => /> *.
rewrite mapiE => />.
rewrite mapiE => />.
case (x = i{hr}); last by smt(@Array256).
move => ->.
rewrite set_eqiE => />.
rewrite to_sintD_small => />.
move : H0; rewrite /pos_bound256_cxq => bnd.
move : (bnd i{hr} _); first by smt().
auto => />.
rewrite qE => /> *.
split. 
rewrite !to_sintE.
rewrite /smod.
case (2 ^ (16 - 1) <= to_uint rp{hr}.[i{hr}]) => ?.
cut ->: 2 ^ (16 - 1) <= to_uint (- (W16.of_int 3329)).
smt(@W16).
simplify.
smt(@W16).
smt(@W16).
move => *.
rewrite (_: to_sint (- (of_int 3329)%W16) = -3329). 
   by rewrite to_sintE /smod to_uintN => />. 

(***)
rewrite !to_sintE.
rewrite /smod.
case (2 ^ (16 - 1) <= to_uint rp{hr}.[i{hr}]) => ?.
smt(@W16).
have ?: to_uint rp{hr}.[i{hr}] < 32768.
move : H12.
simplify.
smt().
smt().
(***)

rewrite inzmodD. ring. 
rewrite to_sintE /smod to_uintN => />. 

(***)
have ?: 3329 %% q = 0.
rewrite qE.
smt().
rewrite inzmodN.
rewrite /zero.
cut ->: - - inzmod 3329 = inzmod 3329. smt(@ZModRing).
rewrite -eq_inzmod.
smt().
(***)

move : H0 H1; rewrite /pos_bound256_cxq => /> *.
split.
move => k.
case (i{hr} = k); last first.
move => *.
rewrite set_neqiE => />; first by smt().
by move : (H0 k); rewrite /bpos16 => /#.
move => *.
rewrite set_eqiE => />; first by smt().
case (rp{hr}.[i{hr}] - (of_int 3329)%W16 \slt W16.zero).
move => asp.
rewrite (H5 asp) qE => />.
rewrite (_: rp{hr}.[i{hr}] - (of_int 3329)%W16 + (of_int 3329)%W16 =
              (rp{hr}.[i{hr}])); first by ring.
split. 

(***)
move : (H0 k).
smt().
move => ?.
move : (H0 k).
rewrite qE.
smt().
(***)

move => *.
rewrite (H6 _); first by smt(@W16).
auto => />.
split.

(***)
move : H10.
rewrite sltE.
cut ->: to_sint W16.zero = 0.
rewrite of_sintK.
simplify.
rewrite /smod.
smt().
smt().
(***)

move => *.
rewrite to_sintD_small => />.
rewrite to_sintN => />. 
rewrite of_sintK => />.
rewrite of_sintK => />.
rewrite /smod => />.
split; first by smt(@W16).
move => *. 

(***)
rewrite !to_sintE.
rewrite /smod.
case (2 ^ (16 - 1) <= to_uint rp{hr}.[i{hr}]) => ?.
smt(@W16).
have ?: to_uint rp{hr}.[i{hr}] < 32768.
move : H13.
simplify.
smt().
smt().
(***)

rewrite qE to_sintN of_sintK => />.
rewrite /smod => />. 

(***)
move : H10.
rewrite sltE.
cut ->: to_sint W16.zero = 0.
rewrite of_sintK.
simplify.
rewrite /smod.
smt().
move => *.
smt.
(***)

split; last by smt().
move => *.
case (0 <= k < i{hr}).
move => *.
move : (H1 k _) => /> *.
by rewrite !set_neqiE => />;  smt().
move => *.
rewrite !set_eqiE => />; first by smt().

case (rp{hr}.[i{hr}] - (of_int 3329)%W16 \slt W16.zero).
move => asp.
rewrite (H5 asp) qE => />.
rewrite (_: rp{hr}.[i{hr}] - (of_int 3329)%W16 + (of_int 3329)%W16 =
              (rp{hr}.[i{hr}])); first by ring.
split; first by smt(@W16).

(***)
move => *.
move : asp.
rewrite sltE.
cut ->: to_sint W16.zero = 0.
rewrite of_sintK.
simplify.
rewrite /smod.
smt().
move => *.

have ?: to_sint (rp{hr}.[i{hr}]) < 3329.

have ? : to_sint (rp{hr}.[i{hr}]) < to_sint (W16.of_int 3329).
rewrite to_sintb_lt0.
done.
rewrite to_sintE.
rewrite of_uintK.
rewrite pmod_small.
done.
rewrite /smod.
simplify.
done.
done.
move : H12.
rewrite to_sintE.
cut ->: to_sint ((W16.of_int 3329)) = 3329.
rewrite to_sintE of_uintK pmod_small. done.
rewrite /smod. simplify.
done.
done.

smt(@W16).
(***)

move => *.
rewrite (H6 _); first by smt(@W16).
auto => />.
split.

(***)
move : H10.
rewrite sltE.
cut ->: to_sint W16.zero = 0.
rewrite of_sintK.
simplify.
rewrite /smod.
smt().
move => *.
smt().
(***)

move => *.
rewrite to_sintD_small => />.
rewrite to_sintN => />. 
rewrite of_sintK => />.
rewrite of_sintK => />.
rewrite /smod => />.
split; first by smt(@W16).
move => *. 

(***)
rewrite !to_sintE.
rewrite /smod.
case (2 ^ (16 - 1) <= to_uint rp{hr}.[i{hr}]) => ?.
smt(@W16).
have ?: to_uint rp{hr}.[i{hr}] < 32768.
move : H13.
simplify.
smt().
smt().
(***)

rewrite qE to_sintN of_sintK => />.
rewrite /smod => />. smt.
by auto => /> /#. 
qed.

lemma lift_array256_sub_768 a (b : W16.t Array256.t) x n :
  0 <= n =>
  lift_array768 a = x =>
  (forall (k : int), 0 <= k < 256 => inzmod (to_sint b.[k]) = x.[k+n]) =>
  (forall (k : int), 0 <= k < 256 => b.[k] = a.[k+n]) =>
  lift_array256 b = Array256.of_list witness (sub x n 256).
proof.
  rewrite /lift_array768 => *.
  rewrite /lift_array256 tP => j ?.
  rewrite mapE /of_list !initE H3 /=.
  by rewrite H1 // nth_sub // addzC.
qed.

lemma inzmod_lift_array256 (x : W16.t t) y n :
  0 <= n <= 512 =>
  (forall (k : int), 0 <= k < 256 => inzmod (to_sint x.[k+n]) = (lift_array256 y).[k]) =>
  lift_array256 y = Array256.of_list witness (sub (lift_array768 x) n 256).
proof.
  move => *; rewrite tP => j ?.
  rewrite -H0 //.
  rewrite /of_list initE H1 /= nth_sub // /lift_array768 mapiE //.
  cut ->: 0 <= n + j < 768 by smt() => //.
  by done.
  by simplify => /#.
qed.

lemma pos_bound256_signed_boundD (r : W16.t Array256.t) x :
  pos_bound256_cxq r 0 256 x =>
  signed_bound_cxq r 0 256 x.
proof.
  rewrite /pos_bound256_cxq /signed_bound_cxq.
  cut ->: (forall (k : int), 0 <= k < 256 => bpos16 r.[k] (x * q)) =
          (forall (k : int), 0 <= k < 256 => 0 <= to_sint r.[k] < (x * q)) by done.
  by move => *; rewrite b16E /#.
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
  move => *; rewrite tP => k *.
  rewrite lift_array768E //.
  case (k < 256) => ?.
    by rewrite H 1:/# get_of_list 1:/# nth_sub 1:/#.
  case (k < 512) => ?.
    move : (H0 (k-256)).
    cut ->: 0 <= k - 256 < 256 by smt().
    by simplify => *; rewrite H5 /= get_of_list 1:/# nth_sub 1,2:/#.
  move : (H1 (k-512)).
  cut ->: 0 <= k - 512 < 256 by smt().
  simplify => *.
  by rewrite H5 get_of_list 1:/# nth_sub 1,2:/#.
qed.

lemma lift_array768P (x y : W16.t t) :
  lift_array768 x = lift_array768 y <=>
  (forall k, 0 <= k < 768 => inzmod (to_sint x.[k]) = inzmod (to_sint y.[k])).
proof. 
  split; first by rewrite tP => *; rewrite -!lift_array768E // H //. 
  by rewrite tP => *; rewrite !lift_array768E // H //. 
qed.

lemma pos_bound768_signed_bound768 a i j x :
  pos_bound768_cxq a i j x => signed_bound768_cxq a i j x.
proof.
  rewrite /pos_bound768_cxq /signed_bound768_cxq.
  cut ->: (forall (k : int), i <= k < j => bpos16 a.[k] (x * q)) = 
          (forall (k : int), i <= k < j => 0 <= to_sint a.[k] < (x * q)) by done.
  by move => *; rewrite b16E /#.
qed.

lemma pos_bound256_cxqD a i j x :
  1 < x => pos_bound256_cxq a i j (x-1) => pos_bound256_cxq a i j x.
proof.
  move => ?; rewrite /pos_bound256_cxq. 
  cut ->: (forall (k : int), i <= k < j => bpos16 a.[k] ((x - 1) * q)) =
          (forall (k : int), i <= k < j => 0 <= to_sint a.[k] < ((x - 1) * q)) by done.
  move => *; rewrite bpos16E.
  move : (H0 k); rewrite H1 /= => /> *; smt. (* why?? *)
qed.

lemma pos_bound256_signed_bound a i j x :
  pos_bound256_cxq a i j x => signed_bound_cxq a i j x.
proof.
  rewrite /pos_bound256_cxq /signed_bound_cxq.
  cut ->: (forall (k : int), i <= k < j => bpos16 a.[k] (x * q)) = 
          (forall (k : int), i <= k < j => 0 <= to_sint a.[k] < (x * q)) by done.
  by move => *; rewrite b16E /#.
qed.

lemma pos_bound256_cxqP a i j x :
  pos_bound256_cxq a i j x <=> (forall k, i <= k < j => 0 <= to_sint a.[k] < x * q).
proof. by split; rewrite /pos_bound256_cxq. qed.

lemma pos_bound768_cxqP a i j x :
  pos_bound768_cxq a i j x <=> (forall k, i <= k < j => 0 <= to_sint a.[k] < x * q).
proof. by split; rewrite /pos_bound768_cxq. qed.

lemma polyvec_csubq_corr ap ab :
    1 < ab<9 =>
      hoare[ Mderand.polyvec_csubq :
           ap = lift_array768 r /\
           pos_bound768_cxq r 0 768 ab 
           ==>
           ap = lift_array768 res /\
           pos_bound768_cxq res 0 768 (ab-1) ] . 
proof.
  move => *; proc; sp. 
  exists* r; elim* => r'.
  seq 1 : (r = r' /\ pos_bound768_cxq r 0 768 ab /\ signed_bound768_cxq r 0 768 ab /\ ap = lift_array768 r /\
          pos_bound256_cxq r0 0 256 ab /\ pos_bound256_cxq r1 0 256 ab /\ pos_bound256_cxq r2 0 256 ab /\
          (forall k, 0 <= k < 256 => r0.[k] = r.[k]) /\
          (forall k, 0 <= k < 256 => inzmod (to_sint r0.[k]) = ap.[k]) /\ 
          (forall k, 0 <= k < 256 => r1.[k] = r.[k+256]) /\
          (forall k, 0 <= k < 256 => inzmod (to_sint r1.[k]) = ap.[256+k]) /\ 
          (forall k, 0 <= k < 256 => r2.[k] = r.[k+512]) /\
          (forall k, 0 <= k < 256 => inzmod (to_sint r2.[k]) = ap.[512+k]) /\
          lift_array256 r0 = Array256.of_list witness (sub (lift_array768 r) 0 256) /\
          lift_array256 r1 = Array256.of_list witness (sub ap 256 256) /\
          lift_array256 r2 = Array256.of_list witness (sub ap 512 256)).
    call (polyvec_topolys_corr ap ab r').
      skip => /> *; split; first by apply pos_bound768_signed_bound768.
      move => *; do split.
        by rewrite (pos_bound768_pos_bound r{hr} result.`1 0 0 768 256 ab) //.
        by rewrite (pos_bound768_pos_bound r{hr} result.`2 0 256 768 256 ab) //.
        by rewrite (pos_bound768_pos_bound r{hr} result.`3 0 512 768 256 ab) //.
        by rewrite (lift_array256_sub_768 r{hr} _ (lift_array768 r{hr}) 0) //.
        by rewrite (lift_array256_sub_768 r{hr} _ (lift_array768 r{hr}) 256) // /#.
        rewrite (lift_array256_sub_768 r{hr} _ (lift_array768 r{hr}) 512) // /#.
  seq 1 : (#[/1:8,10:]pre /\ pos_bound256_cxq r0 0 256 (ab-1)).
    exists* r0; elim* => r0'; call (poly_csubq_corr (Array256.of_list witness (sub ap 0 256)) ab); [smt() | ].
    skip => /> *; split; first by rewrite H11 //.
    move => ? *; do split.
      by rewrite pos_bound256_cxqD /#.
      by rewrite /pos_bound256_cxq /#.
  seq 1 : (#[/1:8,10:]pre /\ pos_bound256_cxq r1 0 256 (ab-1)).
    exists* r1; elim* => r1'; call (poly_csubq_corr (Array256.of_list witness (sub ap 256 256)) ab); [smt() | ].
    skip => /> *; split; first by rewrite H10 //.
    move => ? *; do split.
      by rewrite pos_bound256_cxqD /#.
      by rewrite /pos_bound256_cxq /#.
  seq 1 : (#[/1:8,10:]pre /\ pos_bound256_cxq r2 0 256 (ab-1)).
    exists* r2; elim* => r2'; call (poly_csubq_corr (Array256.of_list witness (sub ap 512 256)) ab); [smt() | ].
    skip => /> *; split; first by rewrite H9 //.
    move => ? *; do split.
      by rewrite pos_bound256_cxqD /#.
      by rewrite /pos_bound256_cxq /#.
  call (pos_polyvec_frompolys_corr (Array256.of_list witness (sub ap 0 256)) 
                               (Array256.of_list witness (sub ap 256 256)) 
                               (Array256.of_list witness (sub ap 512 256)) (ab - 1)).
  skip => /> *; do split; [by rewrite H5 // | by rewrite H6 // | by rewrite H7 // |].
  by move => *; rewrite -(lift_array768_eq result r{hr}) //.
qed.

(***********************************************************)
lemma poly_csubq_corr_ab ap ab :
      hoare[ Mderand.poly_csubq :
           ap = lift_array256 rp /\
           pos_bound256_cxq rp 0 256 ab 
           ==>
           ap = lift_array256 res /\
           pos_bound256_cxq res 0 256 ab ] . 
proof.
move => *.
proc.
while (ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 ab /\ 0 <= i<=256).
seq 2 : (#pre /\ t = rp.[i] - W16.of_int 3329); first by auto => />.
seq 3 : (#pre /\ 
        (t \slt W16.zero => b = W16.of_int q) /\ 
        (W16.zero \sle t => b = W16.of_int 0)).
seq 2 : (#pre /\ 
        (t \slt W16.zero => b = W16.of_int (W16.modulus -1)) /\ 
        (W16.zero \sle t => b = W16.of_int 0)).
auto => /> *.
pose x := rp{hr}.[i{hr}] - (of_int 3329)%W16.
smt (getsign @W16).
auto => />.
move =>  *.
split. 
move => asp.
rewrite (H3 asp) qE  => />. 
apply W16.ext_eq => /> *.
rewrite m1true => />.
move => asp.
by rewrite (H4 asp)=> />. 
auto => />.
move => * />.
split. 
case (rp{hr}.[i{hr}] - (of_int 3329)%W16 \slt W16.zero).
move => asp.
rewrite (H3 asp) qE => />. 
rewrite /lift_array256 => />.
apply Array256.ext_eq => /> *.
rewrite mapiE => />.
rewrite mapiE => />.
case (x = i{hr}); last by smt(@Array256).
move => ->.
rewrite set_eqiE => />.
by rewrite (_: rp{hr}.[i{hr}] - (of_int 3329)%W16 + (of_int 3329)%W16 = rp{hr}.[i{hr}]);  ring.

move => *.
have asp : (W16.zero \sle rp{hr}.[i{hr}] - (of_int 3329)%W16); first by smt(@W16).
rewrite (H4 asp) => />. 
apply Array256.ext_eq => /> *.
rewrite mapiE => />.
rewrite mapiE => />.
case (x = i{hr}); last by smt(@Array256).
move => ->.
rewrite set_eqiE => />.
rewrite to_sintD_small => />.
move : H; rewrite /pos_bound256_cxq => bnd.
move : (bnd i{hr} _); first by smt().
auto => />.
rewrite qE => /> *.
split. 
rewrite !to_sintE.
rewrite /smod.
case (2 ^ (16 - 1) <= to_uint rp{hr}.[i{hr}]) => ?.
cut ->: 2 ^ (16 - 1) <= to_uint (- (W16.of_int 3329)).
smt(@W16).
simplify.
smt(@W16).
smt(@W16).
move => *.
rewrite (_: to_sint (- (of_int 3329)%W16) = -3329). 
   by rewrite to_sintE /smod to_uintN => />. 

(***)
rewrite !to_sintE.
rewrite /smod.
case (2 ^ (16 - 1) <= to_uint rp{hr}.[i{hr}]) => ?.
smt(@W16).
have ?: to_uint rp{hr}.[i{hr}] < 32768.
move : H10.
simplify.
smt().
smt().
(***)

rewrite inzmodD. ring. 
rewrite to_sintE /smod to_uintN => />. 

(***)
have ?: 3329 %% q = 0.
rewrite qE.
smt().
rewrite inzmodN.
rewrite /zero.
cut ->: - - inzmod 3329 = inzmod 3329. smt(@ZModRing).
rewrite -eq_inzmod.
smt().
(***)

move : H; rewrite /pos_bound256_cxq => /> *.
split.
move => k.
case (i{hr} = k); last first.
move => *.
rewrite set_neqiE => />; first by smt().
by move : (H k); rewrite /bpos16 => /#.
move => *.
rewrite set_eqiE => />; first by smt().
case (rp{hr}.[i{hr}] - (of_int 3329)%W16 \slt W16.zero).
move => asp.
rewrite (H3 asp) qE => />.
rewrite (_: rp{hr}.[i{hr}] - (of_int 3329)%W16 + (of_int 3329)%W16 =
              (rp{hr}.[i{hr}])); first by ring.
split. 

(***)
move : (H k).
smt().
move => ?.
move : (H k).
rewrite qE.
smt().
(***)

move => *.
rewrite (H4 _); first by smt(@W16).
auto => />.
split.

(***)
move : H8.
rewrite sltE.
cut ->: to_sint W16.zero = 0.
rewrite of_sintK.
simplify.
rewrite /smod.
smt().
smt().
(***)

move => *.
rewrite to_sintD_small => />.
rewrite to_sintN => />. 
rewrite of_sintK => />.
rewrite of_sintK => />.
rewrite /smod => />.
split; first by smt(@W16).
move => *.

(***)
rewrite !to_sintE.
rewrite /smod.
case (2 ^ (16 - 1) <= to_uint rp{hr}.[i{hr}]) => ?.
smt(@W16).
have ?: to_uint rp{hr}.[i{hr}] < 32768.
move : H11.
simplify.
smt().
smt().
(***)

rewrite qE to_sintN of_sintK => />.
rewrite /smod => />. 

(***)
move : H8.
rewrite sltE.
cut ->: to_sint W16.zero = 0.
rewrite of_sintK.
simplify.
rewrite /smod.
smt().
move => *.
smt.
(***)

smt().

by auto => /> /#. 
qed.

lemma polyvec_csubq_corr_ab ap ab :
      hoare[ Mderand.polyvec_csubq :
           ap = lift_array768 r /\
           pos_bound768_cxq r 0 768 ab 
           ==>
           ap = lift_array768 res /\
           pos_bound768_cxq res 0 768 ab ] . 
proof.
  move => *; proc; sp. 
  exists* r; elim* => r'.
  seq 1 : (r = r' /\ pos_bound768_cxq r 0 768 ab /\ signed_bound768_cxq r 0 768 ab /\ ap = lift_array768 r /\
          pos_bound256_cxq r0 0 256 ab /\ pos_bound256_cxq r1 0 256 ab /\ pos_bound256_cxq r2 0 256 ab /\
          (forall k, 0 <= k < 256 => r0.[k] = r.[k]) /\
          (forall k, 0 <= k < 256 => inzmod (to_sint r0.[k]) = ap.[k]) /\ 
          (forall k, 0 <= k < 256 => r1.[k] = r.[k+256]) /\
          (forall k, 0 <= k < 256 => inzmod (to_sint r1.[k]) = ap.[256+k]) /\ 
          (forall k, 0 <= k < 256 => r2.[k] = r.[k+512]) /\
          (forall k, 0 <= k < 256 => inzmod (to_sint r2.[k]) = ap.[512+k]) /\
          lift_array256 r0 = Array256.of_list witness (sub (lift_array768 r) 0 256) /\
          lift_array256 r1 = Array256.of_list witness (sub ap 256 256) /\
          lift_array256 r2 = Array256.of_list witness (sub ap 512 256)).
    call (polyvec_topolys_corr ap ab r').
      skip => /> *; split; first by apply pos_bound768_signed_bound768.
      move => *; do split.
        by rewrite (pos_bound768_pos_bound r{hr} result.`1 0 0 768 256 ab) //.
        by rewrite (pos_bound768_pos_bound r{hr} result.`2 0 256 768 256 ab) //.
        by rewrite (pos_bound768_pos_bound r{hr} result.`3 0 512 768 256 ab) //.
        by rewrite (lift_array256_sub_768 r{hr} _ (lift_array768 r{hr}) 0) //.
        by rewrite (lift_array256_sub_768 r{hr} _ (lift_array768 r{hr}) 256) // /#.
        rewrite (lift_array256_sub_768 r{hr} _ (lift_array768 r{hr}) 512) // /#.
  seq 1 : (#[/1:8,10:]pre).
    exists* r0; elim* => r0'; call (poly_csubq_corr_ab (Array256.of_list witness (sub ap 0 256)) ab).
    skip => /> *; split; first by rewrite H10 //.
    by move => ? *; rewrite H14.
  seq 1 : (#[/1:8,10:]pre).
    exists* r1; elim* => r1'; call (poly_csubq_corr_ab (Array256.of_list witness (sub ap 256 256)) ab).
    skip => /> *; split; first by rewrite H9 //.
    by move => ? *; rewrite H12.
  seq 1 : (#[/1:8,10:]pre).
    exists* r2; elim* => r2'; call (poly_csubq_corr_ab (Array256.of_list witness (sub ap 512 256)) ab).
    skip => /> *; split; first by rewrite H8 //.
    by move => ? *; rewrite H10.
  call (pos_polyvec_frompolys_corr (Array256.of_list witness (sub ap 0 256)) 
                               (Array256.of_list witness (sub ap 256 256)) 
                               (Array256.of_list witness (sub ap 512 256)) ab).
  skip => /> *; do split; [by rewrite H4 // | by rewrite H5 // | by rewrite H6 // |].
  by move => *; rewrite -(lift_array768_eq result r{hr}) //.
qed.

lemma formula_polyvec x : 
  0 <= x < 3329 =>
  (x * 1024 + 1664) * (4294967296 %/ 3329 + 1) %% 18446744073709551616 %/ 4294967296 %% 1024 =
  (x * 1024 + 1664) %/ 3329 %% 1024.
proof.  
have ? :  
   (all
     (fun x => (x * 1024 + 1664) * (4294967296 %/ 3329 + 1) %% 18446744073709551616 %/ 4294967296 %% 1024 =
(x * 1024 + 1664) %/ 3329 %% 1024)
     (range 0 3329)).
by [] => />.
smt tmo=30. (* This should be very easy to prove. It should be discarded by smt() but it does not and takes forever to use allP *)
qed.

lemma roundcimpl64 (a : W16.t) :
  bpos16 a q =>
  inzmod
  (to_sint (truncateu16
         ((((zeroextu64 a `<<` (of_int 10)%W8) + (of_int 1664)%W64) * (of_int 1290168)%W64 `>>`
           (of_int 32)%W8) `&`
          (of_int 1023)%W64))) = PolyVec.roundc (inzmod (to_sint a)).
proof.
rewrite /zeroextu64 /truncateu16 PolyVec.roundcE qE => /> *.
rewrite (_: W64.of_int 1023 = W64.masklsb 10); first by smt(@W64).
rewrite W64.and_mod => />. 
rewrite W64.of_uintK to_sintE.
rewrite /(`<<`) /(`>>`).
rewrite W64.shlMP; first by smt().
rewrite W64.to_uint_shr; first by smt().
rewrite W16.of_uintK.
congr.
rewrite inzmodK.
rewrite to_sintE.
rewrite qE.
simplify.
rewrite IntDiv.pmod_small. smt(@W64).
rewrite IntDiv.pmod_small. smt(@W64).
rewrite (IntDiv.pmod_small _ 3329). smt(@W16).
rewrite (_: (smod (to_uint a))%W16 = to_uint a). smt(@W16).
pose xx := (to_uint a * 1024 + 1664).
rewrite W64.of_uintK => />.
pose yy := xx * 1290168 %% 18446744073709551616 %/ 4294967296 %% 1024.
have ? : (0 <= yy < 2^16). smt(@W16).
rewrite (_: W16.smod yy =  yy). 
rewrite /smod.
simplify.
case (32768 <= yy) => ?. smt().
done.
rewrite /yy.
rewrite (_: 1290168 = 4294967296 %/ 3329 + 1). smt().

rewrite /xx.
pose x := to_uint a.
rewrite formula_polyvec.
rewrite /x. 
have to_sint_geq0 : to_sint a = to_uint a.
smt(@W16).
rewrite -to_sint_geq0.
done.
done.
qed.

lemma roundcimpl_rng (a : W16.t) :
  bpos16 a q =>
  0 <= to_sint (truncateu16
         ((((zeroextu64 a `<<` (of_int 10)%W8) + (of_int 1664)%W64) * (of_int 1290168)%W64 `>>`
           (of_int 32)%W8) `&`
          (of_int 1023)%W64)) < 1024.
proof.
rewrite to_sintE; move => /> *.
rewrite (_: W64.of_int 1023 = W64.masklsb 10); first by smt(@W64).
rewrite W64.and_mod => />. 
pose xx := (W64.of_int
             (to_uint
                (((zeroextu64 a `<<` (of_int 10)%W8) + (of_int 1664)%W64) * (of_int 1290168)%W64 `>>` (of_int 32)%W8) %%
              1024)).
have ? : 0<= to_uint  xx < 1024; first by smt(@W64).
have ? : 0<= to_uint  (truncateu16 xx) < 1024.

  rewrite /truncateu16; smt(@W16 @W64).
  by rewrite /smod;  smt(@W16).
qed.

lemma polyvec_compress_round_corr ap :
      hoare[ Mderand.polyvec_compress_round :
           ap = lift_array768 a /\
           pos_bound768_cxq a 0 768 1 
           ==>
           Array768.map PolyVec.roundc ap = lift_array768 res /\
           signed_bound768_cxq res 0 768 1 ] . 
proof.
  move => *; proc.

while (#pre /\ 0 <= to_uint i <= 768 + 3 /\ to_uint i %% 4 = 0 /\ 
        ap = lift_array768 aa /\ pos_bound768_cxq aa 0 768 1 /\
        (forall k,
          0 <= k < to_uint i =>
           inzmod (W16.to_sint r.[k]) = PolyVec.roundc ap.[k]) /\ 
        (forall k,
            0<= k < to_uint i => 0 <= to_sint r.[k] < 1024)).
      unroll 2; unroll 3; unroll 4; unroll 5.
      (rcondt 2; first by wp; skip); (rcondt 10; first by wp; skip); (rcondt 18; first by wp; skip);
        (rcondt 26; first by wp; skip); (rcondf 34; first by wp; skip).
      wp; skip => /> *.
        split. split.
          + by rewrite to_uintD_small 1,2:/#.
          + by rewrite to_uintD_small // 1:/#; move : H7; rewrite ultE of_uintK pmod_small // /#. 
        split.
          + by rewrite !to_uintD_small 1,2:/#.
      split; move => k ?.
        + rewrite !to_uintD_small 1..4:/#.
        + rewrite !of_uintK !pmod_small 1..4:/# /=.
        move => *.
rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr} + 3) => ?. 
rewrite roundcimpl64.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
rewrite H10 H3.
rewrite lift_array768E.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
done.

rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr} + 2) => ?. 
rewrite roundcimpl64.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
rewrite H11 H3.
rewrite lift_array768E.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
done.

rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr} + 1) => ?. 
rewrite roundcimpl64.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
rewrite H12 H3.
rewrite lift_array768E.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
done.

rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr}) => ?. 
rewrite roundcimpl64.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
rewrite H13 H3.
rewrite lift_array768E.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
done.

rewrite H5.
smt().
done.

        + rewrite !to_uintD_small 1..4:/#.
        + rewrite !of_uintK !pmod_small 1..4:/# /=.
        move => *.
split.
rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr} + 3) => ?.
move : (roundcimpl_rng (aa{hr}.[to_uint i{hr} + 3])).
cut ->: bpos16 aa{hr}.[to_uint i{hr} + 3] q.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
simplify.
smt().

rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr} + 2) => ?.
move : (roundcimpl_rng (aa{hr}.[to_uint i{hr} + 2])).
cut ->: bpos16 aa{hr}.[to_uint i{hr} + 2] q.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
simplify.
smt().

rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr} + 1) => ?.
move : (roundcimpl_rng (aa{hr}.[to_uint i{hr} + 1])).
cut ->: bpos16 aa{hr}.[to_uint i{hr} + 1] q.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
simplify.
smt().

rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr}) => ?.
move : (roundcimpl_rng (aa{hr}.[to_uint i{hr}])).
cut ->: bpos16 aa{hr}.[to_uint i{hr}] q.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
simplify.
smt().

smt().

move => ?.
clear H10.
rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr} + 3) => ?.
move : (roundcimpl_rng (aa{hr}.[to_uint i{hr} + 3])).
cut ->: bpos16 aa{hr}.[to_uint i{hr} + 3] q.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
simplify.
smt().

rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr} + 2) => ?.
move : (roundcimpl_rng (aa{hr}.[to_uint i{hr} + 2])).
cut ->: bpos16 aa{hr}.[to_uint i{hr} + 2] q.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
simplify.
smt().

rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr} + 1) => ?.
move : (roundcimpl_rng (aa{hr}.[to_uint i{hr} + 1])).
cut ->: bpos16 aa{hr}.[to_uint i{hr} + 1] q.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
simplify.
smt().

rewrite get_setE; first by move : H7; rewrite ultE of_uintK pmod_small // /#. 
case (k = to_uint i{hr}) => ?.
move : (roundcimpl_rng (aa{hr}.[to_uint i{hr}])).
cut ->: bpos16 aa{hr}.[to_uint i{hr}] q.
move : H4.
rewrite /pos_bound768_cxq /= => *.
rewrite H4.
move : H7; rewrite ultE of_uintK pmod_small // /#. 
simplify.
smt().

smt().

call (polyvec_csubq_corr_ab ap 1).
wp; skip => /> *.

split.
smt().

move => k r.
rewrite ultE of_uintK pmod_small.
done.
move => *.
have ?: to_uint k = 768.
smt().

split.
rewrite tP => j *.
rewrite mapiE //.
rewrite -H6.
smt().
rewrite lift_array768E //.

rewrite /signed_bound768_cxq => j *.
rewrite b16E.
split.
have ?: 0 <= to_sint r.[j]. smt().
smt.
move => *.
have ?: to_sint r.[j] < 1024. smt().
rewrite qE /=.
smt().
qed.

(*
  proc polyvec_add(a : W16.t t, b : W16.t t) : W16.t t = Indcpa.M.polyvec_add
  
  proc polyvec_pointwise_acc(a : W16.t t, b : W16.t t) : W16.t Array256.t = Indcpa.M.polyvec_pointwise_acc
  
  proc polyvec_ntt(r : W16.t t) : W16.t t = Indcpa.M.polyvec_ntt
  
  proc polyvec_invntt(r : W16.t t) : W16.t t = Indcpa.M.polyvec_invntt
  
  proc polyvec_reduce(r : W16.t t) : W16.t t = Indcpa.M.polyvec_reduce

  proc polyvec_decompress_restore(rp : W32.t t) : W16.t t

*)


end KyberPolyVec.

