require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array1536 Array1568 Array1408 Array1410 Array1024 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8 Array2.
from JazzEC require import WArray512 WArray384 WArray32 WArray16 WArray1410 WArray160.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem1024.
from JazzEC require import Jkem1024_avx2.
require import MLKEM_PolyVec_avx2_prevec.
require import MLKEM_Poly_avx2_prevec.
require import NTT_avx2 NTT_avx2_ntt NTT_avx2_invntt.
require import Fqmul_avx2 Red_x16_avx2.
require import Fq.
require import NTT_Fq.
require import MLKEM_Poly.
require import MLKEM_PolyVec.
require import MLKEM_avx2_auxlemmas.
require import MLKEM_Poly_avx2_proof.
require import MLKEM_PolyVec_avx2_proof.
require import MLKEM_Poly_avx2_vec.
require import MLKEM_PolyVec_avx2_vec.
require import MLKEM_InnerPKE.
require import MLKEMFCLib.

import GFq Rq Symmetric Symmetric1024 Serialization Serialization1024 Sampling VecMat VecMat1024 InnerPKE1024 MLKEM1024 Correctness1024 Fq SignedReductions.

import Zq.
import ZModP.
import Fq_avx2.
import NTT_Avx2.
import MLKEM_Poly.
import MLKEM_PolyVec.

import MLKEM_PolyAVX.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import MLKEM_PolyVecAVXVec.

require import Bindings.


import KMatrix Vector.

from JazzEC require import WArray1568 WArray2048.
require import Bindings BitEncoding.
import BitChunking BS2Int.


lemma polyvec_add2_equiv  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
  forall (_a _b : coeff Array1024.t),
    equiv [Jkem1024_avx2.M.__polyvec_add2 ~Jkem1024.M.__polyvec_add2 :
      _a = lift_array1024 r{2} /\
      _b = lift_array1024 b{2} /\ signed_bound1024_cxq r{2} 0 1024 ab /\ signed_bound1024_cxq b{2} 0 1024 bb /\
      _a = nttpackv (lift_array1024 r{1}) /\
      _b = nttpackv (lift_array1024 b{1}) /\ signed_bound1024_cxq r{1} 0 1024 ab /\ signed_bound1024_cxq b{1} 0 1024 bb
           ==> lift_array1024 res{1} = nttunpackv (lift_array1024  res{2}) /\
               signed_bound1024_cxq res{1} 0 1024 (ab + bb) /\
               signed_bound1024_cxq res{2} 0 1024 (ab + bb) 
              ].
proof. 
move => abb bbb _a _b;proc* => /=.
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array1024 r{2} /\
  _b = lift_array1024 b{2} /\
  signed_bound1024_cxq r{2} 0 1024 ab /\
  signed_bound1024_cxq b{2} 0 1024 bb /\
  _a = nttpackv (lift_array1024 r{1}) /\
  _b = nttpackv (lift_array1024 b{1}) /\ signed_bound1024_cxq r{1} 0 1024 ab /\ signed_bound1024_cxq b{1} 0 1024 bb   ==> 
      lift_array1024 r0{1} = nttunpackv (lift_array1024 r0{2}) /\ signed_bound1024_cxq r0{1} 0 1024 (ab + bb) /\ signed_bound1024_cxq r0{2} 0 1024 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_add2 => //.
have corr1 := (polvec_add_corr (nttunpackv _a) (nttunpackv _b) ab bb abb bbb). call {1} corr1.
have corr2 := (polyvec_add_corr _a _b ab bb abb bbb); call {2} corr2.

auto => />. 
move => &1 &2 ????->->??rr?rval; do split; 1,2: by rewrite packvK.  
move => ??rr0?r0val.
rewrite tP => k kb.
rewrite /(lift_array1024 rr0) mapiE //= r0val // !packvK.
have  -> : lift_array1024 rr = 
   Array1024.init (fun k => (nttpackv (lift_array1024 r{1})).[k] + (nttpackv (lift_array1024 b{1})).[k])
 by rewrite tP => kk kkb; rewrite initiE //= /(lift_array1024 rr) mapiE //= /#.
rewrite /nttunpackv /nttpackv initiE //=.
case (0<=k<256).
+ move => *.
  rewrite /subarray256 /nttunpack initiE //= initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k].
  do 4!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  do 2!(rewrite ifT; 1: smt(nttunpack_bnd Array256.allP);
   rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite -/b.
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  

case (256<=k<512).
+ move => *.
  rewrite /subarray256 /nttunpack initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k-256].
  do 3!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  do 2!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite -/b.
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  

case (512<=k<768).
+ move => *.
  rewrite /subarray256 /nttunpack initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k-512].
  do 3!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  do 2!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite -/b.
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  

+ move => *.
  rewrite /subarray256 /nttunpack initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k - 768].
  do 4!(rewrite initiE //=; 1:smt(nttunpack_bnd Array256.allP)).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  do 2!(rewrite /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  do 2!(rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite /a.
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  
qed.

lemma polyvec_add2_equiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
  forall (_a _b : coeff Array1024.t),
    equiv [Jkem1024_avx2.M.__polyvec_add2 ~Jkem1024.M.__polyvec_add2 :
      _a = lift_array1024 r{2} /\
      _b = lift_array1024 b{2} /\ signed_bound1024_cxq r{2} 0 1024 ab /\ signed_bound1024_cxq b{2} 0 1024 bb /\
      _a = lift_array1024 r{1} /\
      _b = lift_array1024 b{1} /\ signed_bound1024_cxq r{1} 0 1024 ab /\ signed_bound1024_cxq b{1} 0 1024 bb
           ==> lift_array1024 res{1} = lift_array1024  res{2} /\
               signed_bound1024_cxq res{1} 0 1024 (ab + bb) /\
               signed_bound1024_cxq res{2} 0 1024 (ab + bb) 
              ].
proof. 
move => abb bbb _a _b;proc* => /=.
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array1024 r{2} /\
  _b = lift_array1024 b{2} /\
  signed_bound1024_cxq r{2} 0 1024 ab /\
  signed_bound1024_cxq b{2} 0 1024 bb /\
  _a =  (lift_array1024 r{1}) /\
  _b =  (lift_array1024 b{1}) /\ signed_bound1024_cxq r{1} 0 1024 ab /\ signed_bound1024_cxq b{1} 0 1024 bb   ==> 
      lift_array1024 r0{1} = (lift_array1024 r0{2}) /\ signed_bound1024_cxq r0{1} 0 1024 (ab + bb) /\ signed_bound1024_cxq r0{2} 0 1024 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_add2 => //.
have corr1 := (polvec_add_corr ( _a) ( _b) ab bb abb bbb). call {1} corr1.
have corr2 := (polyvec_add_corr _a _b ab bb abb bbb); call {2} corr2.

auto => />.  
move => &1 &2 ????????rr? H rval? H0. 
move : H H0; rewrite /lift_array1024 !tP => ? ? k kb. 
rewrite !mapiE;smt(Array1024.mapiE).
qed.

lemma polyvec_reduce_equiv _a :
    equiv [Jkem1024_avx2.M.__polyvec_reduce ~Jkem1024.M.__polyvec_reduce :
       _a  = lift_array1024 r{2} /\  _a  = nttpackv (lift_array1024 r{1})  ==>
       (forall k, 0 <= k < 1024 => bpos16 res{1}.[k] (2*q)) /\
       (forall k, 0 <= k < 1024 => bpos16 res{2}.[k] (2*q)) /\
              lift_array1024 res{1} = nttunpackv (lift_array1024 res{2}) ].
proc*. 
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_reduce(r); }
       (={r} ==> ={r0})
       (_a = lift_array1024 r{2} /\ _a = nttpackv (lift_array1024 r{1})   ==> 
      (forall (k : int), 0 <= k && k < 1024 => bpos16 r0{1}.[k] (2 * q)) /\
  (forall (k : int), 0 <= k && k < 1024 => bpos16 r0{2}.[k] (2 * q)) /\
  lift_array1024 r0{1} = nttunpackv (lift_array1024  r0{2})); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_reduce => //.
have corr1 := (polvec_reduce_corr (nttunpackv _a)). call {1} corr1.
have corr2 := (polyvec_reduce_corr _a); call {2} corr2.

auto => />. 
move => &1 &2 ?????; do split;1: smt(packvK unpackvK). 
move => ??<-?.
smt(packvK unpackvK). 
qed.


lemma polyvec_reduce_equiv_noperm _a :
    equiv [Jkem1024_avx2.M.__polyvec_reduce ~Jkem1024.M.__polyvec_reduce :
       _a  = lift_array1024 r{2} /\  _a  = lift_array1024 r{1}  ==>
       (forall k, 0 <= k < 1024 => bpos16 res{1}.[k] (2*q)) /\
       (forall k, 0 <= k < 1024 => bpos16 res{2}.[k] (2*q)) /\
              lift_array1024 res{1} =  lift_array1024 res{2} ].
proc*. 
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_reduce(r); }
       (={r} ==> ={r0})
       (_a = lift_array1024 r{2} /\ _a = (lift_array1024 r{1})   ==> 
      (forall (k : int), 0 <= k && k < 1024 => bpos16 r0{1}.[k] (2 * q)) /\
  (forall (k : int), 0 <= k && k < 1024 => bpos16 r0{2}.[k] (2 * q)) /\
  lift_array1024 r0{1} =  (lift_array1024  r0{2})); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_reduce => //.
have corr1 := (polvec_reduce_corr ( _a)). call {1} corr1.
have corr2 := (polyvec_reduce_corr _a); call {2} corr2.

auto => /> /#. 
qed.
