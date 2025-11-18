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

equiv polyinvnttequiv :
Jkem1024_avx2.M._poly_invntt ~Jkem1024.M._poly_invntt : 
   lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) /\ 
   signed_bound_cxq arg{1} 0 256 4 /\ 
   signed_bound_cxq arg{2} 0 256 4 ==>
   lift_array256 res{1} = lift_array256 res{2} /\ 
   signed_bound_cxq res{1} 0 256 1 /\
   signed_bound_cxq res{2} 0 256 1.
proc*.
ecall{2} (invntt_correct (lift_array256 rp{2})) => /=.
conseq />; 1: by move => &1 &2 *;do split;  smt(). 
ecall{1} (poly_invntt_avx2_corr rp{2}) => /=. 
auto => /> &1 &2. rewrite lift_nttpack => -> H1 H2. rewrite nttunpackK //= => r <- H3. move => r0 <- H4. 
rewrite /scale /map /lift_array256 /R tP => /> i Hi1 Hi2. rewrite !initiE //=. rewrite Zq.ComRing.mulrC //. qed.

lemma signed_bound1024_cxq_small r (i j:int) :
  i <= j => signed_bound1024_cxq r 0 1024 i => signed_bound1024_cxq r 0 1024 j.
rewrite /signed_bound1024_cxq => />Hij H k Hk1 Hk2. move :(H k). rewrite Hk1 Hk2 => />. smt(). qed.

lemma eq_vectorP4 :
      forall (v1 v2 : PolyVec.polyvec),
        (v1 = v2) <=> ((KMatrix.Vector."_.[_]" v1 0 = KMatrix.Vector."_.[_]" v2 0) /\ (KMatrix.Vector."_.[_]" v1 1 = KMatrix.Vector."_.[_]" v2 1) /\ (KMatrix.Vector."_.[_]" v1 2 = KMatrix.Vector."_.[_]" v2 2) /\ (KMatrix.Vector."_.[_]" v1 3 = KMatrix.Vector."_.[_]" v2 3)).
smt(KMatrix.Vector.eq_vectorP). qed.

equiv invnttequiv :
Jkem1024_avx2.M.__polyvec_invntt ~Jkem1024.M.__polyvec_invntt : 
   lift_array1024 arg{1} = nttunpackv (lift_array1024 arg{2}) /\ 
   signed_bound1024_cxq arg{1} 0 1024 4 /\ 
   signed_bound1024_cxq arg{2} 0 1024 4 ==>
   lift_array1024 res{1} = lift_array1024 res{2} /\ 
   signed_bound1024_cxq res{1} 0 1024 1 /\ 
   signed_bound1024_cxq res{2} 0 1024 1.
proc *.
ecall {2} (polyvec_invntt_corr r{2}) => /=.
conseq />;1: smt().
ecall {1} (polyvec_invntt_avx2_corr r{2}) => /=. 
auto => /> &1 &2 -> Hm1 Hm2. rewrite unpackvK //= => r Hr1 Hr2 s Hs1 Hs2.
rewrite /lift_array1024 /map tP => />j Hj1 Hj2. rewrite !initiE //=.
move :Hr1; rewrite !mapvE /lift_polyvec eq_vectorP4 !KMatrix.Vector.offunvE //=. 
rewrite /lift_array256 /subarray256 /map !tP -!andaE. 
apply andaW. 
move => Hr10. 
apply andaW. 
move => Hr11. 
apply andaW. 
move =>  Hr12 Hr21.   
move :Hs1;rewrite /scale_vector /lift_polyvec eq_vectorP4 !KMatrix.Vector.offunvE //=.
rewrite /scale /lift_array256 /subarray256 /map !tP -!andaE.
apply andaW. 
move => Hs10. 
apply andaW. 
move => Hs11.
apply andaW. 
move =>  Hs12 Hs21.  
case (0 <= j < 256) => Hj_0.
 + move :(Hr10 j). rewrite Hj_0 !initiE //= !initiE //= => <-.
 + move :(Hs10 j). rewrite Hj_0 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
case (256 <= j < 512). move => Hj_1.
 + have Hj_2: 0 <= j - 256 && j - 256 < 256. smt().
 + move :(Hr11 (j-256)). rewrite Hj_2 !initiE //= !initiE //= => <-.
 + move :(Hs11 (j-256)). rewrite Hj_2 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
case (512 <= j < 768). move => ?Hj_2.
 + have Hj_3: 0 <= j - 512 && j - 512 < 256. smt().
 + move :(Hr12 (j-512)). rewrite Hj_3 !initiE //= !initiE //= => <-.
 + move :(Hs12 (j-512)). rewrite Hj_3 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
move =>? Hj_3.
 + have Hj_4: 0 <= j - 768 && j - 768 < 256. smt().
 + move :(Hr21 (j-768)). rewrite Hj_4 !initiE //= !initiE //= => <-.
 + move :(Hs21 (j-768)). rewrite Hj_4 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
qed.
