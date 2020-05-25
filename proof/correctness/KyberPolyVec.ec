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
rewrite /smod => />. smt.
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

lemma polyvec_csubq_corr ap ab :
    1 < ab<9 =>
      hoare[ Mderand.polyvec_csubq :
           ap = lift_array768 r /\
           pos_bound768_cxq r 0 768 ab 
           ==>
           ap = lift_array768 res /\
           pos_bound768_cxq res 0 768 (ab-1) ] . 
proof.
move => *; proc.
  sp. 

exists* r; elim* => r'.

seq 1 : (r = r' /\ pos_bound768_cxq r 0 768 ab /\ signed_bound768_cxq r 0 768 ab /\ ap = lift_array768 r /\
          pos_bound256_cxq r0 0 256 ab /\
          pos_bound256_cxq r1 0 256 ab /\
          pos_bound256_cxq r2 0 256 ab /\
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
    skip => />. move => &hr *. split. 

move : H0. rewrite /pos_bound768_cxq. rewrite /signed_bound768_cxq.

cut ->: (forall (k : int), 0 <= k < 768 => bpos16 r{hr}.[k] (ab * q)) =
        (forall (k : int), 0 <= k < 768 => 0 <= to_sint r{hr}.[k] < (ab * q)).
done.
move => *.
rewrite b16E.
smt().

move => *.
split.
rewrite (pos_bound768_pos_bound r{hr} result.`1 0 0 768 256 ab) //.
split.
rewrite (pos_bound768_pos_bound r{hr} result.`2 0 256 768 256 ab) //.
rewrite (pos_bound768_pos_bound r{hr} result.`3 0 512 768 256 ab) //.

do split => //.
rewrite (lift_array256_sub_768 r{hr} _ (lift_array768 r{hr}) 0).
done.
done.
smt().
smt().
done.

rewrite (lift_array256_sub_768 r{hr} _ (lift_array768 r{hr}) 256).
done.
done.
smt().
smt().
done.

rewrite (lift_array256_sub_768 r{hr} _ (lift_array768 r{hr}) 512).
done.
done.
smt().
smt().
done.

seq 1 : (#[/1,2,3,4,5,6,7,10:]pre /\ pos_bound256_cxq r0 0 256 (ab-1)).
exists* r0; elim* => r0'.
call (poly_csubq_corr (Array256.of_list witness (sub ap 0 256)) ab).
smt(). skip => /> *.
split.
rewrite H11 //.
move => ? *.
split.
move : H16.
rewrite /pos_bound256_cxq.
smt().
smt().

seq 1 : (#[/1,2,3,4,5,6,7,10:]pre /\ pos_bound256_cxq r1 0 256 (ab-1)).
exists* r1; elim* => r1'.
print poly_csubq_corr.
call (poly_csubq_corr (Array256.of_list witness (sub (lift_array768 r') 256 256)) ab).
smt(). skip => /> *.
split.
rewrite H10 //.
move => ? *.
split.
move : H15.
rewrite /pos_bound256_cxq.
smt().
smt().

seq 1 : (#[/1,2,3,4,5,6,7,10:]pre /\ pos_bound256_cxq r2 0 256 (ab-1)).
exists* r2; elim* => r2'.
print poly_csubq_corr.
call (poly_csubq_corr (Array256.of_list witness (sub (lift_array768 r') 512 256)) ab).
smt(). skip => /> *.
split.
rewrite H9 //.
move => ? *.
split.
move : H14.
rewrite /pos_bound256_cxq.
smt().
smt().

call (polyvec_frompolys_corr (Array256.of_list witness (sub ap 0 256)) (Array256.of_list witness (sub ap 256 256)) (Array256.of_list witness (sub ap 512 256)) (ab - 1)).

skip => /> *.
split. split.
rewrite H5 //.
split.
move : H8.
rewrite /pos_bound256_cxq /signed_bound_cxq.
cut ->: (forall (k : int), 0 <= k < 256 => bpos16 r0{hr}.[k] ((ab - 1) * q)) =
        (forall (k : int), 0 <= k < 256 => 0 <= to_sint r0{hr}.[k] < ((ab - 1) * q)).
done.
move => *.
rewrite b16E.
smt().

split.
rewrite H6 //.
split.
move : H9.
rewrite /pos_bound256_cxq /signed_bound_cxq.
cut ->: (forall (k : int), 0 <= k < 256 => bpos16 r1{hr}.[k] ((ab - 1) * q)) =
        (forall (k : int), 0 <= k < 256 => 0 <= to_sint r1{hr}.[k] < ((ab - 1) * q)).
done.
move => *.
rewrite b16E.
smt().

split.
rewrite H7 //.
move : H10.
rewrite /pos_bound256_cxq /signed_bound_cxq.
cut ->: (forall (k : int), 0 <= k < 256 => bpos16 r2{hr}.[k] ((ab - 1) * q)) =
        (forall (k : int), 0 <= k < 256 => 0 <= to_sint r2{hr}.[k] < ((ab - 1) * q)).
done.
move => *.
rewrite b16E.
smt().

move => *.
split.

move : H18 H19 H20.
rewrite !H11 H13 H15.
move => *.
rewrite /lift_array768.
rewrite tP => *.
rewrite !mapE.
rewrite !initE.
rewrite H21.
simplify.

case (i < 256) => ?.
rewrite H18.
smt().
move : H5.
rewrite /lift_array256.
rewrite tP.
progress.
rewrite H5.
smt().
rewrite /of_list.
rewrite initE.
cut ->: 0 <= i < 256. smt().
simplify.
rewrite nth_sub.
smt().
rewrite /lift_array768.
rewrite mapE.
rewrite initE.
cut ->: 0 <= 0 + i < 768.
smt().
simplify.
done.

case (i < 512) => ?.
have ?: forall (k : int), 256 <= k < 512 => inzmod (to_sint result.[k]) = (lift_array256 r1{hr}).[k-256].
smt().
rewrite H24.
smt().
move : H6.
rewrite /lift_array256.
rewrite tP.
progress.
rewrite H6.
smt().
rewrite /of_list.
rewrite initE.
cut ->: 0 <= i - 256 < 256. smt().
simplify.
rewrite nth_sub.
smt().
rewrite /lift_array768.
rewrite mapiE.
smt().
simplify.
done.

have ?: forall (k : int), 512 <= k < 768 => inzmod (to_sint result.[k]) = (lift_array256 r2{hr}).[k-512].
smt().
rewrite H24.
smt().
move : H7.
rewrite /lift_array256.
rewrite tP.
progress.
rewrite H7.
smt().
rewrite /of_list.
rewrite initE.
cut ->: 0 <= i - 512 < 256. smt().
simplify.
rewrite nth_sub.
smt().
rewrite /lift_array768.
rewrite mapiE.
smt().
simplify.
done.

move : H17.
rewrite /signed_bound768_cxq /pos_bound768_cxq.
cut ->: (forall (k : int), 0 <= k < 768 => b16 result.[k] ((ab - 1) * q)) =
        (forall (k : int), 0 <= k < 768 => - ((ab - 1) * q) <= to_sint result.[k] < ((ab - 1) * q)).
done.
move => *.
rewrite bpos16E.
admitted.


lemma polyvec_compress_round_corr ap :
      hoare[ Mderand.polyvec_compress_round :
           ap = lift_array768 a /\
           pos_bound768_cxq a 0 768 1 
           ==>
           Array768.map PolyVec.roundc ap = lift_array768 res /\
           signed_bound768_cxq res 0 768 1 ] . 
proof.
move => *.
proc.
admitted.

(*
  proc polyvec_add(a : W16.t t, b : W16.t t) : W16.t t = Indcpa.M.polyvec_add
  
  proc polyvec_pointwise_acc(a : W16.t t, b : W16.t t) : W16.t Array256.t = Indcpa.M.polyvec_pointwise_acc
  
  proc polyvec_ntt(r : W16.t t) : W16.t t = Indcpa.M.polyvec_ntt
  
  proc polyvec_invntt(r : W16.t t) : W16.t t = Indcpa.M.polyvec_invntt
  
  proc polyvec_reduce(r : W16.t t) : W16.t t = Indcpa.M.polyvec_reduce

  proc polyvec_decompress_restore(rp : W32.t t) : W16.t t

*)


end KyberPolyVec.

