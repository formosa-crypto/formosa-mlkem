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
lemma mulvec a b :
   dotp a b = 
    invntt (basemul (ntt a.[0]) (ntt b.[0])) +
    invntt (basemul (ntt a.[1]) (ntt b.[1])) +
    invntt (basemul (ntt a.[2]) (ntt b.[2])).
admitted.

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

lemma polyvec_topolys_corr ap ab :
      hoare[ Mderand.polyvec_topolys :
           ap = lift_array768 pv /\
           signed_bound768_cxq pv 0 768 ab 
           ==>
           signed_bound_cxq res.`1 0 256 ab /\ 
           signed_bound_cxq res.`2 0 256 ab /\ 
           signed_bound_cxq res.`3 0 256 ab /\ 
           (forall k, 0 <= k < 256 =>
              inzmod (to_sint res.`1.[k]) = ap.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inzmod (to_sint res.`2.[k]) = ap.[256+k]) /\ 
           (forall k, 0 <= k < 256 =>
              inzmod (to_sint res.`3.[k]) = ap.[512+k])]. 
proof.
  proc; while ((forall i, 0 <= i < 256 => r0.[i] = pv.[i]) /\ 
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
    by move => *; rewrite H5 // lift_array768_inzmod 1:/#.
    by move => *; rewrite H11 // lift_array768_inzmod 1:/# addzC.
    by move => *; rewrite H12 1:/# lift_array768_inzmod 1:/# addzC.
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
proc.
admitted.

lemma polyvec_csubq_corr ap ab :
    1 < ab<9 =>
      hoare[ Mderand.polyvec_csubq :
           ap = lift_array768 r /\
           pos_bound768_cxq r 0 768 ab 
           ==>
           ap = lift_array768 res /\
           pos_bound768_cxq res 0 768 (ab-1) ] 
. 
move => *.
proc.
admitted.

lemma polyvec_compress_round_corr ap :
      hoare[ Mderand.polyvec_compress_round :
           ap = lift_array768 a /\
           pos_bound768_cxq a 0 768 1 
           ==>
           Array768.map PolyVec.roundc ap = lift_array768 res /\
           signed_bound768_cxq res 0 768 1 ] 
. 
move => *.
proc.
admitted.



end KyberPolyVec.

