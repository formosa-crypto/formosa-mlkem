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
proc.
admitted.

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

(*
  proc polyvec_add(a : W16.t t, b : W16.t t) : W16.t t = Indcpa.M.polyvec_add
  
  proc polyvec_pointwise_acc(a : W16.t t, b : W16.t t) : W16.t Array256.t = Indcpa.M.polyvec_pointwise_acc
  
  proc polyvec_ntt(r : W16.t t) : W16.t t = Indcpa.M.polyvec_ntt
  
  proc polyvec_invntt(r : W16.t t) : W16.t t = Indcpa.M.polyvec_invntt
  
  proc polyvec_reduce(r : W16.t t) : W16.t t = Indcpa.M.polyvec_reduce

  proc polyvec_decompress_restore(rp : W32.t t) : W16.t t

*)


end KyberPolyVec.

