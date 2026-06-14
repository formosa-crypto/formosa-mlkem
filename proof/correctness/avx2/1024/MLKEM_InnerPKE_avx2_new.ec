require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel.
from JazzEC require import Array4096 Array1536 Array1568 Array1408 Array1410 Array1024 Array400 Array384 Array256 Array160 Array128 Array64 Array33 Array32 Array16 Array4 Array8 Array2.
from JazzEC require import WArray64 WArray1568 WArray512 WArray128 WArray384 WArray33 WArray32 WArray16 WArray1410 WArray160 WArray1408 WArray1536.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem_avx2.
require import MLKEM_PolyVec_avx2.
require import MLKEM_Poly_avx2.
require import NTT_avx2.
require import MLKEM_W16_Rep.
require import Fq_avx2.
require import NTT_Fq.
require import AVX2_Ops MLKEMFCLib.
require import MLKEM_Poly_avx2.
require import MLKEM_PolyVec_avx2.
require import MLKEM_Poly_avx2.
require import MLKEM_PolyVec_avx2.
require import MLKEMFCLib.
import MLKEMFCLib1024.
require import MLKEM_avx2_equivs.
require import MLKEM_keccak_avx2.
require import MLKEM_genmatrix_avx2.
require import MLKEM_getnoise_avx2.

from Spec require import EncDecCorrectness1024.
from Spec require import InnerPKE1024_Op.
import GFq Rq Symmetric Symmetric1024 Serialization Serialization1024 Sampling VecMat VecMat1024 InnerPKE1024 MLKEM1024 Correctness1024.
import PolyVec PolyMat KMatrix.

import Zq.
import ZModP.
import Fq_avx2.
import NTT_Avx2.

import MLKEM_PolyAVX.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import MLKEM_PolyVecAVXVec.

require import Mlkem_bindings.
import KMatrix Vector.
import InnerPKE1024.
require Montgomery.


(********** AVX2 PHOARE WRAPPERS on Jkem_avx2.M procs via Mprevec + prevec_eq **************)

lemma poly_add_corr_avx ab bb :
  0 <= ab <= 6 => 0 <= bb <= 3 =>
  forall _a _b,
  phoare [Jkem_avx2.M._poly_add2 :
    _a = lift_array256 rp /\ _b = lift_array256 bp /\
    signed_bound_cxq rp 0 256 ab /\ signed_bound_cxq bp 0 256 bb
    ==>
    signed_bound_cxq res 0 256 (ab + bb) /\
    forall k, 0 <= k < 256 =>
      incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r.
proof.
  move => abbnd bbbnd _a _b.
  bypr => &m Hpre.
  have ->: 1%r = Pr[Mprevec.poly_add2(rp{m}, bp{m}) @ &m :
                signed_bound_cxq res 0 256 (ab + bb) /\
                forall k, 0 <= k < 256 => incoeff (to_sint res.[k]) = _a.[k] + _b.[k]].
  + by byphoare (MLKEM_PolyAVX.poly_add_corr _a _b ab bb abbnd bbbnd) => //=; smt().
  byequiv => //. symmetry. proc*. call prevec_eq_poly_add2. auto.
qed.

lemma poly_sub_corr_avx ab bb :
  0 <= ab <= 4 => 0 <= bb <= 4 =>
  forall _a _b,
  phoare [Jkem_avx2.M._poly_sub :
    _a = lift_array256 ap /\ _b = lift_array256 bp /\
    signed_bound_cxq ap 0 256 ab /\ signed_bound_cxq bp 0 256 bb
    ==>
    signed_bound_cxq res 0 256 (ab + bb) /\
    forall k, 0 <= k < 256 =>
      incoeff (to_sint res.[k]) = _a.[k] - _b.[k]] = 1%r.
proof.
  move => abbnd bbbnd _a _b.
  bypr => &m Hpre.
  have ->: 1%r = Pr[Mprevec.poly_sub(rp{m}, ap{m}, bp{m}) @ &m :
                signed_bound_cxq res 0 256 (ab + bb) /\
                forall k, 0 <= k < 256 => incoeff (to_sint res.[k]) = _a.[k] - _b.[k]].
  + by byphoare (MLKEM_PolyAVX.poly_sub_corr _a _b ab bb abbnd bbbnd) => //=; smt().
  byequiv => //. symmetry. proc*. call prevec_eq_poly_sub. auto.
qed.

lemma polyvec_add_corr_avx ab bb :
  0 <= ab <= 6 => 0 <= bb <= 3 =>
  forall _a _b,
  phoare [Jkem_avx2.M.__polyvec_add2 :
    _a = lift_array1024 r /\ _b = lift_array1024 b /\
    signed_bound1024_cxq r 0 1024 ab /\ signed_bound1024_cxq b 0 1024 bb
    ==>
    signed_bound1024_cxq res 0 1024 (ab + bb) /\
    forall k, 0 <= k < 1024 =>
      incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r.
proof.
  move => abbnd bbbnd _a _b.
  bypr => &m Hpre.
  have ->: 1%r = Pr[MLKEM_PolyVec_avx2.Mprevec.polyvec_add2(r{m}, b{m}) @ &m :
                signed_bound1024_cxq res 0 1024 (ab + bb) /\
                forall k, 0 <= k < 1024 => incoeff (to_sint res.[k]) = _a.[k] + _b.[k]].
  + by byphoare (polvec_add_corr _a _b ab bb abbnd bbbnd) => //=; smt().
  byequiv => //. symmetry. proc*. call prevec_eq_polyvec_add2. auto.
qed.


lemma poly_reduce_corr_avx ap :
  phoare [Jkem_avx2.M.__poly_reduce :
    ap = lift_array256 rp
    ==>
    ap = lift_array256 res /\
    forall k, 0 <= k < 256 => bpos16 res.[k] (2*q)] = 1%r.
proof.
  bypr => &m Hpre.
  have ->: 1%r = Pr[Mprevec.poly_reduce(rp{m}) @ &m :
                ap = lift_array256 res /\
                forall k, 0 <= k < 256 => bpos16 res.[k] (2*q)].
  + by byphoare (MLKEM_PolyAVX.poly_reduce_corr ap) => //=; smt().
  byequiv => //. symmetry. proc*. call prevec_eq_poly_reduce. auto.
qed.

lemma poly_frommont_corr_avx ap :
  phoare [Jkem_avx2.M._poly_frommont :
    ap = map W16.to_sint rp
    ==>
    map W16.to_sint res =
      map (fun x => Fq.Fq.SignedReductions.SREDC (x * ((Ring.IntID.(^) Fq.Fq.SignedReductions.R 2) %% q))) ap] = 1%r.
proof.
  bypr => &m Hpre.
  have ->: 1%r = Pr[Mprevec.poly_frommont(rp{m}) @ &m :
                map W16.to_sint res =
                  map (fun x => Fq.Fq.SignedReductions.SREDC (x * ((Ring.IntID.(^) Fq.Fq.SignedReductions.R 2) %% q))) ap].
  + by byphoare (MLKEM_PolyAVX.poly_frommont_corr ap) => //=; smt().
  byequiv => //. symmetry. proc*. call prevec_eq_poly_frommont. auto.
qed.

lemma polyvec_reduce_corr_avx _a :
  phoare [Jkem_avx2.M.__polyvec_reduce :
    _a = lift_array1024 r
    ==>
    _a = lift_array1024 res /\
    forall k, 0 <= k < 1024 => bpos16 res.[k] (2*q)] = 1%r.
proof.
  bypr => &m Hpre.
  have ->: 1%r = Pr[MLKEM_PolyVec_avx2.Mprevec.polyvec_reduce(r{m}) @ &m :
                _a = lift_array1024 res /\
                forall k, 0 <= k < 1024 => bpos16 res.[k] (2*q)].
  + by byphoare (MLKEM_PolyvecAVX.polvec_reduce_corr _a) => //=; smt().
  byequiv => //. symmetry. proc*. call prevec_eq_polyvec_reduce. auto.
qed.


(********** AVX2 pointwise-acc phoare (1024 / kvec=4) **************)

lemma lift_subarray_nttunpackvE (aref ahr : W16.t Array1024.t) (j : int) :
  0 <= j < 4 =>
  lift_array1024 ahr = nttunpackv (lift_array1024 aref) =>
  lift_array256 (Array256.init (fun (i : int) => ahr.[256*j + i])) =
    nttunpack (lift_array256 (Serialization1024.subarray256 aref j)).
proof.
move => jb Hlift.
have HkR : 0 <= 256*j <= 768 by smt().
rewrite (lift_array_256_1024_k ahr (256*j) HkR) Hlift.
have ->: lift_array256 (Serialization1024.subarray256 aref j) = Serialization1024.subarray256 (lift_array1024 aref) j.
+ rewrite /lift_array256 /lift_array1024 /Serialization1024.subarray256 /map tP => k kb.
  by rewrite !initiE //= initiE 1:/# /= initiE //= /#.
rewrite tP => i ib; rewrite initiE //= /nttunpack initiE //=.
have Hidxbnd : 0 <= nttunpack_idx.[i] < 256
  by smt(nttunpack_bnd Array256.allP mem_iota).
rewrite /Serialization1024.subarray256 initiE //=.
have -> : (nttunpackv (lift_array1024 aref)).[256 * j + i] =
          (nttunpack (Serialization1024.subarray256 (lift_array1024 aref) j)).[i].
+ rewrite /nttunpackv initiE 1:/#.
  have Hjr : j = 0 \/ j = 1 \/ j = 2 \/ j = 3 by smt().
  case Hjr => [-> | [-> | [-> | ->]]] /=.
  - by rewrite ifT 1:/#.
  - by rewrite ifF 1:/# ifT 1:/#; congr; smt().
  - by rewrite ifF 1:/# ifF 1:/# ifT 1:/#; congr; smt().
  - by rewrite ifF 1:/# ifF 1:/# ifF 1:/#; congr; smt().
by rewrite /nttunpack /Serialization1024.subarray256 initiE //= initiE 1:/#.
qed.

lemma polyvec_pointwise_acc_corr_avx_ph
  (a_ref b_ref : W16.t Array1024.t)
  _a0 _a1 _a2 _a3 _b0 _b1 _b2 _b3 _p0 _p1 _p2 _p3 (_r : coeff Array256.t) :
  _p0 = scale (basemul _a0 _b0) (incoeff 169) =>
  _p1 = scale (basemul _a1 _b1) (incoeff 169) =>
  _p2 = scale (basemul _a2 _b2) (incoeff 169) =>
  _p3 = scale (basemul _a3 _b3) (incoeff 169) =>
  (forall k, 0 <= k < 256 => _r.[k] = _p0.[k] + _p1.[k] + _p2.[k] + _p3.[k]) =>
  phoare [Jkem_avx2.M.__polyvec_pointwise_acc :
    _a0 = lift_array256 (Serialization1024.subarray256 a_ref 0) /\
    _a1 = lift_array256 (Serialization1024.subarray256 a_ref 1) /\
    _a2 = lift_array256 (Serialization1024.subarray256 a_ref 2) /\
    _a3 = lift_array256 (Serialization1024.subarray256 a_ref 3) /\
    _b0 = lift_array256 (Serialization1024.subarray256 b_ref 0) /\
    _b1 = lift_array256 (Serialization1024.subarray256 b_ref 1) /\
    _b2 = lift_array256 (Serialization1024.subarray256 b_ref 2) /\
    _b3 = lift_array256 (Serialization1024.subarray256 b_ref 3) /\
    lift_array1024 a = nttunpackv (lift_array1024 a_ref) /\
    lift_array1024 b = nttunpackv (lift_array1024 b_ref) /\
    signed_bound1024_cxq a 0 1024 2 /\
    signed_bound1024_cxq b 0 1024 2
    ==>
    lift_array256 res = nttunpack _r /\
    signed_bound_cxq res 0 256 4] = 1%r.
proof.
move => _p0_def _p1_def _p2_def _p3_def _r_def; proc.
unroll for 4.
have Hadd31 := poly_add_corr_avx 3 1 _ _ => //.
have Hadd21 := poly_add_corr_avx 2 1 _ _ => //.
have Hadd11 := poly_add_corr_avx 1 1 _ _ => //.
wp; call (Hadd31 (nttunpack (_p0 &+ _p1 &+ _p2)) (nttunpack _p3)).
wp; call (poly_basemul_avx2_ph _a3 _b3).
wp; call (Hadd21 (nttunpack (_p0 &+ _p1)) (nttunpack _p2)).
wp; call (poly_basemul_avx2_ph _a2 _b2).
wp; call (Hadd11 (nttunpack _p0) (nttunpack _p1)).
wp; call (poly_basemul_avx2_ph _a1 _b1).
wp; call (poly_basemul_avx2_ph _a0 _b0).
auto.
move => &hr [_a0d [_a1d [_a2d [_a3d [_b0d [_b1d [_b2d [_b3d [Halift [Hblift [Habnd Hbbnd]]]]]]]]]]].
have HboundA : forall k, 0 <= k <= 768 =>
    signed_bound_cxq (Array256.init (fun (i : int) => a{hr}.[k + i])) 0 256 2
  by move => k Hk i Hi; rewrite initiE //=; smt(Array256.initiE).
have HboundB : forall k, 0 <= k <= 768 =>
    signed_bound_cxq (Array256.init (fun (i : int) => b{hr}.[k + i])) 0 256 2
  by move => k Hk i Hi; rewrite initiE //=; smt(Array256.initiE).
have HUA0 := lift_subarray_nttunpackvE a_ref a{hr} 0 _ Halift; first by smt().
have HUA1 := lift_subarray_nttunpackvE a_ref a{hr} 1 _ Halift; first by smt().
have HUA2 := lift_subarray_nttunpackvE a_ref a{hr} 2 _ Halift; first by smt().
have HUA3 := lift_subarray_nttunpackvE a_ref a{hr} 3 _ Halift; first by smt().
have HUB0 := lift_subarray_nttunpackvE b_ref b{hr} 0 _ Hblift; first by smt().
have HUB1 := lift_subarray_nttunpackvE b_ref b{hr} 1 _ Hblift; first by smt().
have HUB2 := lift_subarray_nttunpackvE b_ref b{hr} 2 _ Hblift; first by smt().
have HUB3 := lift_subarray_nttunpackvE b_ref b{hr} 3 _ Hblift; first by smt().
(* basemul₀ pre *)
split.
+ split; first by rewrite _a0d -HUA0; congr; rewrite tP => k kb; rewrite !initiE //=.
  split; first by move => i Hi; rewrite initiE //=; smt().
  split; first by rewrite _b0d -HUB0; congr; rewrite tP => k kb; rewrite !initiE //=.
  by move => i Hi; rewrite initiE //=; smt().
(* basemul₁ pre *)
move => _ result0 [Hres0lift Hres0bnd]; split.
+ split; first by rewrite _a1d -HUA1; congr; rewrite tP => k kb; rewrite !initiE //=.
  split; first by apply HboundA; smt().
  split; first by rewrite _b1d -HUB1; congr; rewrite tP => k kb; rewrite !initiE //=.
  by apply HboundB; smt().
(* add₁ pre *)
move => _ result [Hreslift Hresbnd]; split.
+ do split; [by rewrite _p0_def -Hres0lift | by rewrite _p1_def -Hreslift
            | exact Hres0bnd | exact Hresbnd].
(* basemul₂ pre *)
move => _ result1 [Hres1bnd Hres1k]; split.
+ split; first by rewrite _a2d -HUA2; congr; rewrite tP => k kb; rewrite !initiE //=.
  split; first by apply HboundA; smt().
  split; first by rewrite _b2d -HUB2; congr; rewrite tP => k kb; rewrite !initiE //=.
  by apply HboundB; smt().
(* add₂ pre *)
move => [#] Hva2 ? Hvb2 ? result2 [Hres2lift Hres2bnd]; split.
+ do split; 2..4: smt().
  rewrite tP => k kb; rewrite /lift_array256 mapiE 1:/#.
  have := Hres1k k kb.
  pose a := NTT_AVX_j.incoeffW16 result1.[k].
  rewrite -/a => ->.
  by rewrite /(&+) map2E /nttunpack !initiE //= initiE //=; 1:smt(nttunpack_inbounds).
(* basemul₃ pre *)
move => _ result3 [Hres3bnd Hres3k]; split.
+ split; first by rewrite _a3d -HUA3; congr; rewrite tP => k kb; rewrite !initiE //=.
  split; first by apply HboundA; smt().
  split; first by rewrite _b3d -HUB3; congr; rewrite tP => k kb; rewrite !initiE //=.
  by apply HboundB; smt().
(* add₃ pre + final close *)
move => [#] Hva3 ? Hvb3 ? result4 [Hres4lift Hres4bnd]; split.
+ do split; 2..4: smt().
  rewrite tP => k kb; rewrite /lift_array256 mapiE 1:/#.
  have Hibnd : 0 <= nttunpack_idx.[k] < 256 by smt(nttunpack_inbounds).
  have := Hres3k k kb.
  pose a := NTT_AVX_j.incoeffW16 result3.[k].
  rewrite -/a => ->.
  by rewrite /(&+) !map2E /nttunpack !initiE //=; smt(Array256.initiE).
move => [#] ???? result5 [Hres5bnd Hres5k]; split; 2:smt().
rewrite tP => k kb; rewrite /lift_array256 mapiE 1:/#.
have Hibnd : 0 <= nttunpack_idx.[k] < 256 by smt(nttunpack_inbounds).
have := Hres5k k kb.
pose a := NTT_AVX_j.incoeffW16 result5.[k].
rewrite -/a => ->.
rewrite /(&+) !map2E /nttunpack !initiE //=.
rewrite _r_def //=; smt(Array256.initiE).
qed.

lemma polyvec_pointwise_acc_corr_alg_avx (va vb : PolyVec.polyvec) (a_ref b_ref : W16.t Array1024.t) :
  phoare [Jkem_avx2.M.__polyvec_pointwise_acc :
    PolyVec.nttv va = lift_polyvec a_ref /\
    signed_bound1024_cxq a_ref 0 1024 2 /\
    PolyVec.nttv vb = lift_polyvec b_ref /\
    signed_bound1024_cxq b_ref 0 1024 2 /\
    lift_array1024 a = nttunpackv (lift_array1024 a_ref) /\
    lift_array1024 b = nttunpackv (lift_array1024 b_ref) /\
    signed_bound1024_cxq a 0 1024 2 /\
    signed_bound1024_cxq b 0 1024 2
    ==>
    signed_bound_cxq res 0 256 4 /\
    lift_array256 res = nttunpack (scale (ntt (dotp va vb)) (incoeff 169))
  ] = 1%r.
proof.
pose A0 := (PolyVec.nttv va).[0]%PolyVec; pose A1 := (PolyVec.nttv va).[1]%PolyVec.
pose A2 := (PolyVec.nttv va).[2]%PolyVec; pose A3 := (PolyVec.nttv va).[3]%PolyVec.
pose B0 := (PolyVec.nttv vb).[0]%PolyVec; pose B1 := (PolyVec.nttv vb).[1]%PolyVec.
pose B2 := (PolyVec.nttv vb).[2]%PolyVec; pose B3 := (PolyVec.nttv vb).[3]%PolyVec.
pose P0 := scale (basemul A0 B0) (incoeff 169).
pose P1 := scale (basemul A1 B1) (incoeff 169).
pose P2 := scale (basemul A2 B2) (incoeff 169).
pose P3 := scale (basemul A3 B3) (incoeff 169).
pose R := P0 &+ P1 &+ P2 &+ P3.
have H := polyvec_pointwise_acc_corr_avx_ph a_ref b_ref
            A0 A1 A2 A3 B0 B1 B2 B3 P0 P1 P2 P3 R _ _ _ _ _.
+ done.
+ done.
+ done.
+ done.
+ by move => k kb; rewrite /R /(&+) /= map2E !initiE //= map2E !initiE //= map2E !initiE //=.
conseq H.
+ move => &hr [Hva [Habnd [Hvb [Hbbnd [Halift [Hblift [Hab Hbb]]]]]]]; do split => //;
    rewrite /A0 /A1 /A2 /A3 /B0 /B1 /B2 /B3 ?Hva ?Hvb /lift_polyvec;
    rewrite tP => k kb; rewrite getvE; smt(Vector.offunvE).
move => &hr Hpre result; have ->: nttunpack (scale (ntt (dotp va vb)) (incoeff 169)) = nttunpack R; last done.
congr; rewrite mulvec.
rewrite !add_comm_ntt !nttK.
have HEva : forall i, 0 <= i < 4 => tofunv va i = va.[i]%Vector by smt().
have HEvb : forall i, 0 <= i < 4 => tofunv vb i = vb.[i]%Vector by smt().
rewrite /R /P0 /P1 /P2 /P3 /A0 /A1 /A2 /A3 /B0 /B1 /B2 /B3 /PolyVec.nttv /mapv
        /scale /(&+) tP => k kb.
rewrite !mapiE //= !map2iE //= !mapiE //=.
rewrite !mapvE /= !getvE !offunvE //=.
rewrite (HEva 0) // (HEva 1) // (HEva 2) // (HEva 3) //
        (HEvb 0) // (HEvb 1) // (HEvb 2) // (HEvb 3) //.
by  ring.
qed.


(********** BRIDGE LEMMAS **************)
lemma lift_array1024_nttunpackv_nttpackv (x : W16.t Array1024.t) :
  nttunpackv (lift_array1024 (nttpackv x)) = lift_array1024 x.
proof. by rewrite -nttpackv_lift packvK. qed.

(* nttpackv distributes over pointwise add at the lift_polyvec level. *)
lemma lift_polyvec_nttpackv_add (X Y Z : W16.t Array1024.t) :
  (forall k, 0 <= k < 1024 =>
     (lift_array1024 Z).[k] = (lift_array1024 X).[k] + (lift_array1024 Y).[k]) =>
  lift_polyvec (nttpackv Z) = (lift_polyvec (nttpackv X) + lift_polyvec (nttpackv Y))%Vector.
proof.
move => Hpw.
apply eq_vectorP => j Hj.
rewrite /lift_polyvec.
rewrite !KMatrix.Vector.offunvE 1..2:/# /=.
rewrite -!getvE.
rewrite /(&+).
rewrite tP => k Hk.
rewrite Array256.map2iE 1:/# /=.
rewrite /lift_array256 /subarray256 !mapiE 1:/# /= !initiE 1:/# /=.
have peel : forall (W : W16.t Array1024.t),
            (nttpackv W).[256*j + k] = W.[256*j + nttpack_idx.[k]].
+ move => W; rewrite /nttpackv initiE 1:/# /= initiE 1:/# /=.
  have Hjr : j = 0 \/ j = 1 \/ j = 2 \/ j = 3 by smt().
  case Hjr => [-> | [-> | [-> | ->]]] /=.
  - rewrite ifT 1:/# /nttpack initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
    rewrite /subarray256 initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
  - by rewrite initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
  - rewrite ifF 1:/# ifT 1:/# /nttpack initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
    rewrite /subarray256 initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
  - by rewrite initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
  - rewrite ifF 1:/# ifF 1:/# ifT 1:/# /nttpack initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
    rewrite /subarray256 initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
  - by rewrite initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
  - rewrite ifF 1:/# ifF 1:/# ifF 1:/# /nttpack initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
    rewrite /subarray256 initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
  by rewrite initiE /=; 1: smt(nttpack_bnd Array256.allP mem_iota).
rewrite peel.
rewrite !getvE !offunvE /=; 1..2: smt(nttpack_bnd Array256.allP mem_iota).
rewrite !mapiE /=; 1..2: smt(nttpack_bnd Array256.allP mem_iota).
pose a := NTT_AVX_j.incoeffW16 Z.[256 * j + nttpack_idx.[k]].
rewrite !initiE /=; 1,2: smt(nttpack_bnd Array256.allP mem_iota).
rewrite peel /a.
move: (Hpw (256*j + nttpack_idx.[k]) _); first smt(nttpack_bnd Array256.allP mem_iota).
rewrite /lift_array1024 !mapiE /=; 1..3: smt(nttpack_bnd Array256.allP mem_iota).
smt().
qed.

lemma lift_array1024_unlift_ofipolyvec (vi : int Array1024.t) :
  all (fun i => 0 <= i < 32768) vi =>
  lift_array1024 (unlift_polyvec (ofipolyvec vi)) = map incoeff vi.
proof.
rewrite allP => Hbnd.
rewrite /lift_array1024 /unlift_polyvec /ofipolyvec tP => k kb.
rewrite !mapiE //= initiE 1://;beta.
rewrite !setvE;beta;rewrite !offunvK /vclamp; beta.
rewrite offunvE 1:/# /kvec;beta.
have Hkr : k = 256 * (k %/ 256) + k %% 256 by smt().
have Hkdiv : k %/ 256 = 0 \/ k %/ 256 = 1 \/ k %/ 256 = 2 \/ k %/ 256 = 3 by smt().
case Hkdiv => [H0 | [H0 | [H0 | H0]]]; rewrite H0.
+ rewrite ifF 1:/# ifT 1:/# ifF 1:/# ifT 1:/# ifF 1:/# ifT 1:/# ifT 1:/#.
  rewrite mapiE 1:/# /Serialization1024.subarray256 initiE 1:/#;beta.
  rewrite of_sintK Montgomery16.smod_small.
  + have := as_sint_range (incoeff vi.[256 * 0 + k %% 256]); smt(qE).
  by rewrite as_sintK; have -> : 256 * 0 + k %% 256 = k by move : Hkr; smt().
+ rewrite ifF 1:/# ifT 1:/# ifF 1:/# ifT 1:/# ifT 1:/#.
  rewrite mapiE 1:/# /Serialization1024.subarray256 initiE 1:/#;beta.
  rewrite of_sintK Montgomery16.smod_small.
  + have := as_sint_range (incoeff vi.[256 * 1 + k %% 256]); smt(qE).
  by rewrite as_sintK; have -> : 256 * 1 + k %% 256 = k by move : Hkr; smt().
+ rewrite ifF 1:/# ifT 1:/# ifT 1:/#.
  rewrite mapiE 1:/# /Serialization1024.subarray256 initiE 1:/#;beta.
  rewrite of_sintK Montgomery16.smod_small.
  + have := as_sint_range (incoeff vi.[256 * 2 + k %% 256]); smt(qE).
  by rewrite as_sintK; have -> : 256 * 2 + k %% 256 = k by move : Hkr; smt().
+ rewrite ifT 1:/#.
  rewrite mapiE 1:/# /Serialization1024.subarray256 initiE 1:/#;beta.
  rewrite of_sintK Montgomery16.smod_small.
  + have := as_sint_range (incoeff vi.[256 * 3 + k %% 256]); smt(qE).
  by rewrite as_sintK; have -> : 256 * 3 + k %% 256 = k by move : Hkr; smt().
qed.

lemma ntt_dotp_invnttv (s u : PolyVec.polyvec) :
  ntt (dotp (PolyVec.invnttv s) u) = ntt_dotp s (PolyVec.nttv u).
proof. by rewrite comm_ntt_dotp nttK. qed.

(* j-th poly of the i-th row of an unlifted matrix (viewed as a polyvec) equals
   the (i,j) coefficient block of the original polymat. 1024 variant. *)
lemma lift_polyvec_subarray1024_unlift_matrix (a : polymat) (i j : int) :
  0 <= i < 4 => 0 <= j < 4 =>
  (lift_polyvec (subarray1024 (unlift_matrix a) i)).[j]%Vector = a.[i, j]%Matrix.
proof.
move => Hi Hj.
rewrite /lift_polyvec offunvE 1:/# /= /lift_array256 tP => k Hk.
rewrite /subarray256 /subarray1024 mapiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
rewrite /unlift_matrix initiE 1:/# /=.
have ->: (1024 * i + (256 * j + k)) %/ 1024 = i by smt().
have ->: (1024 * i + (256 * j + k)) %% 1024 = 256 * j + k by smt().
have ->: (256 * j + k) %/ 256 = j by smt().
have ->: (1024 * i + (256 * j + k)) %% 256 = k by smt().
rewrite /to_sint /= modz_small; 1: by smt(rg_asint qE).
rewrite /smod /=.
have ->: (32768 <= asint a.[i, j]%Matrix.[k]) = false by smt(rg_asint qE).
by rewrite /= asintK.
qed.

lemma frommont_cancels_at_slot (rr0 rr1 : W16.t Array256.t) (X : poly) :
  signed_bound_cxq rr0 0 256 4 =>
  (forall (k : int), 0 <= k < 256 =>
     to_sint rr1.[k]
     = Fq.Fq.SignedReductions.SREDC
         (to_sint rr0.[k] * (Fq.Fq.SignedReductions.R ^ 2 %% q))) =>
  lift_array256 rr0 = nttunpack (scale X (incoeff 169)) =>
  lift_array256 rr1 = nttunpack X.
proof.
move => Hrr0v Hrr1k Hrr0b.
rewrite /lift_array256 tP => k Hk.
rewrite mapiE //=.
have ->: NTT_AVX_j.incoeffW16 rr1.[k] = incoeff (to_sint rr1.[k]) by done.
rewrite Hrr1k //.
have [? Hredv] :=
  Fq.Fq.SignedReductions.SREDCp_corr
    (to_sint rr0.[k] * (Fq.Fq.SignedReductions.R ^ 2 %% q)) _ _.
+ by rewrite /Fq.Fq.SignedReductions.R; smt(qE).
+ have := Hrr0v k _; 1: smt().
  by rewrite /Fq.Fq.SignedReductions.R; smt(qE @Fq.Fq.SignedReductions).
have ->: incoeff
   (Fq.Fq.SignedReductions.SREDC
      (to_sint rr0.[k] * (Fq.Fq.SignedReductions.R ^ 2 %% q)))
       = incoeff
   (to_sint rr0.[k] * (Fq.Fq.SignedReductions.R ^ 2 %% q) * 169)
  by rewrite -eq_incoeff; apply Hredv.
rewrite !incoeffM.
have Hresk : incoeff (to_sint rr0.[k])
           = (nttunpack (scale X (incoeff 169))).[k].
+ by move: Hrr0b; rewrite /lift_array256 tP => /(_ k _) //; rewrite mapiE //= => ->.
rewrite Hresk.
rewrite /nttunpack initiE //= /scale mapiE //=;
  1: smt(nttunpack_bnd Array256.allP mem_iota).
have ->: incoeff (Fq.Fq.SignedReductions.R ^ 2 %% q)
       = incoeff Fq.Fq.SignedReductions.R * incoeff Fq.Fq.SignedReductions.R.
+ rewrite -incoeffM -eq_incoeff modz_mod.
  have ->: Fq.Fq.SignedReductions.R ^ 2
         = Fq.Fq.SignedReductions.R * Fq.Fq.SignedReductions.R by ring.
  done.
have ->: X.[nttunpack_idx.[k]] * incoeff 169
        * (incoeff Fq.Fq.SignedReductions.R * incoeff Fq.Fq.SignedReductions.R)
        * incoeff 169
       = X.[nttunpack_idx.[k]]
        * (incoeff Fq.Fq.SignedReductions.R * incoeff 169)
        * (incoeff Fq.Fq.SignedReductions.R * incoeff 169) by ring.
rewrite rrinvcoeff !ZqField.mulr1.
smt(Array256.initiE).
qed.

lemma subarray256_double_init_fallthrough
  (pkpv : W16.t Array1024.t) (rr0 rr1 : W16.t Array256.t) (i j : int) :
  0 <= j < i => 0 <= i < 4 =>
  Serialization1024.subarray256
    (Array1024.init (fun (i_0 : int) =>
       if i * 256 <= i_0 < i * 256 + 256 then rr1.[i_0 - i * 256]
       else (Array1024.init (fun (i_0_0 : int) =>
              if i * 256 <= i_0_0 < i * 256 + 256
              then rr0.[i_0_0 - i * 256] else pkpv.[i_0_0])).[i_0])) j
  = Serialization1024.subarray256 pkpv j.
proof.
move => Hji Hi.
rewrite /Serialization1024.subarray256; apply Array256.tP => k Hk.
by rewrite initiE //= initiE //= initiE 1:/# /= ifF 1:/# initiE 1:/# /= /= ifF 1:/#.
qed.

lemma kg_loop_post_to_target (pkpv : W16.t Array1024.t) (mm : PolyVec.polyvec) :
  (forall (j : int), 0 <= j < 4 =>
     lift_array256 (Serialization1024.subarray256 pkpv j) = nttunpack mm.[j]%PolyVec) =>
  lift_polyvec (nttpackv pkpv) = mm.
proof.
move => Hslots.
rewrite eq_vectorP => j jb.
have := Hslots j; rewrite jb /= getvE => Hslotsj.
rewrite -(nttunpackK (mm.[j])%Vector).
rewrite -Hslotsj.
rewrite /lift_polyvec offunvE 1:/# /=.
have lift_subarrayE : forall (X : W16.t Array1024.t) (jj : int),
  0 <= jj < 4 =>
  lift_array256 (Serialization1024.subarray256 X jj) =
    Serialization1024.subarray256 (lift_array1024 X) jj.
+ move => X jj jjb.
  rewrite /lift_array256 /lift_array1024 /Serialization1024.subarray256 /map tP => k kb.
  by rewrite !initiE //= initiE 1:/# /= initiE //= /#.
rewrite !(lift_subarrayE _ _ _) 1..2:/# -nttpackv_lift.
rewrite /Serialization1024.subarray256 /nttpackv tP => k Hk.
rewrite initiE 1:/# /= initiE 1:/# /=.
case (j = 0) => Hj0; 1: by rewrite Hj0 /= ifT 1:/#.
case (j = 1) => Hj1.
+ rewrite ifF 1:/# ifT 1:/#; congr; 2: smt().
  congr; rewrite tP => kk kkb.
  rewrite initiE 1:/# /= initiE /#.
case (j = 2) => Hj2.
+ rewrite ifF 1:/# ifF 1:/# ifT 1:/#; congr; 2: smt().
  congr; rewrite tP => kk kkb.
  rewrite initiE 1:/# /= initiE /#.
have ->: j = 3 by smt().
rewrite ifF 1:/# ifF 1:/# ifF 1:/#; congr; 2: smt().
congr; rewrite tP => kk kkb.
rewrite initiE 1:/# /= initiE /#.
qed.

lemma nttpackv_subarray1024_nttunpackm (M : 'a Array4096.t) (i : int) :
  0 <= i < 4 =>
  nttpackv (subarray1024 (nttunpackm M) i) = subarray1024 M i.
proof.
move => Hi.
rewrite -(unpackvK (subarray1024 M i)); congr.
apply Array1024.tP => kk Hkk.
rewrite /subarray1024 !initiE 1,2:/# /=.
rewrite /nttunpackm initiE 1:/# /=.
have Hjk : 0 <= 1024 * i + kk < 4096 by smt().
case (i = 0) => Hi0.
+ rewrite Hi0 /= ifT 1:/#.
  rewrite /nttunpackv initiE 1:/# /=.
  case (0 <= kk < 256) => ?.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  case (256 <= kk < 512) => ?.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  case (512 <= kk < 768) => ?.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
case (i = 1) => Hi1.
+ rewrite Hi1 /= ifF 1:/# ifT 1:/#.
  rewrite /nttunpackv initiE 1:/# /=.
  case (0 <= kk < 256) => ?.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  case (256 <= kk < 512) => ?.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  case (512 <= kk < 768) => ?.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
case (i = 2) => Hi2.
+ rewrite Hi2 /= ifF 1:/# ifF 1:/# ifT 1:/#.
  rewrite /nttunpackv initiE 1:/# /=.
  case (0 <= kk < 256) => ?.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  case (256 <= kk < 512) => ?.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  case (512 <= kk < 768) => ?.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  + congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
have Hi3 : i = 3 by smt().
rewrite Hi3 /= ifF 1:/# ifF 1:/# ifF 1:/#.
rewrite /nttunpackv initiE 1:/# /=.
case (0 <= kk < 256) => ?.
+ congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
  congr; congr; rewrite tP => ii iib.
  rewrite initiE 1:/# /= initiE 1:/# /= /#.
case (256 <= kk < 512) => ?.
+ congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
  congr; congr; rewrite tP => ii iib.
  rewrite initiE 1:/# /= initiE 1:/# /= /#.
case (512 <= kk < 768) => ?.
+ congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
  congr; congr; rewrite tP => ii iib.
  rewrite initiE 1:/# /= initiE 1:/# /= /#.
+ congr; rewrite /subarray256 /subarray1024 tP => kk2 Hkk2.
  congr; congr; rewrite tP => ii iib.
  rewrite initiE 1:/# /= initiE 1:/# /= /#.
qed.

lemma ntt_dotp_row_eq_ntt_mmul (a : polymat) (sv : W16.t Array1024.t) (i : int) :
  0 <= i < 4 =>
  ntt (dotp (PolyVec.invnttv (lift_polyvec
              (nttpackv (subarray1024 (nttunpackm (unlift_matrix a)) i))))
            (PolyVec.invnttv (lift_polyvec (nttpackv sv))))
  = (ntt_mmul a (lift_polyvec (nttpackv sv))).[i]%PolyVec.
proof.
move => Hi.
rewrite ntt_dotp_invnttv nttvK.
rewrite (nttpackv_subarray1024_nttunpackm (unlift_matrix a) i _) //=.
rewrite /ntt_dotp !getvE !(lift_polyvec_subarray1024_unlift_matrix a i _ _) //=.
case (i = 0) => Hi0.
+ by rewrite Hi0 /= !offunvE //= /ntt_mmul !setvE !offunvE //= offunvK /vclamp ifT 1:/# /= offunvK /vclamp ifT 1:/# /= offunvK /vclamp ifT 1:/# /= !getvE /= !getmE /lift_polyvec !offunvE //=.
case (i = 1) => Hi1.
+ by rewrite Hi1 /= !offunvE //= /ntt_mmul !setvE !offunvE //= offunvK /vclamp ifT 1:/# /= offunvK /vclamp ifT 1:/# /= !getvE /= !getmE /lift_polyvec !offunvE //=.
case (i = 2) => Hi2.
+ by rewrite Hi2 /= !offunvE //= /ntt_mmul !setvE !offunvE //= offunvK /vclamp ifT 1:/# /= !getvE /= !getmE /lift_polyvec !offunvE //=.
have -> : (i = 3) by smt().
by rewrite !offunvE //= /ntt_mmul !setvE !offunvE //= !getvE /= !getmE /lift_polyvec !offunvE //=.
qed.

lemma poly_add2_avx_ll : islossless Jkem_avx2.M._poly_add2.
proof. proc; while (true) (16 - i); auto; smt(). qed.

lemma poly_basemul_avx_ll : islossless Jkem_avx2.M._poly_basemul.
proof. proc; islossless. qed.

lemma polyvec_pointwise_acc_avx_ll :
  islossless Jkem_avx2.M.__polyvec_pointwise_acc.
proof.
proc; while (true) (4 - i).
+ move => z; wp; call poly_add2_avx_ll; call poly_basemul_avx_ll; auto; smt().
wp; call poly_basemul_avx_ll; auto; smt().
qed.


lemma mlkem_correct_enc_avx2_op _pkp :
  equiv [Jkem_avx2.M.__indcpa_enc ~ InnerPKE_Op.enc_derand :
    msgp{1} = m{2} /\ pk{1} = _pkp /\
    noiseseed{1} = r{2} /\
    pk{2}.`1 = Array1536.init (fun i => pk{1}.[i]) /\
    pk{2}.`2 = Array32.init (fun i => pk{1}.[i+1536])
    ==>
    let (c1,c2) = res{2} in
    c1 = Array1408.init (fun i => res{1}.[i]) /\
    c2 = Array160.init (fun i => res{1}.[i+1408])].
proof.
proc => /=.

(* === Step 1: pkpv decode + publicseed extraction + message decompress. === *)
seq 14 9 : (#pre /\
            publicseed{1} = rho{2} /\
            lift_array1024 pkpv{1} = nttunpackv (map incoeff (decode12_vec pk{2}.`1)) /\
            pos_bound1024_cxq pkpv{1} 0 1024 2 /\
            that{2} = ofipolyvec (decode12_vec pk{2}.`1) /\
            lift_array256 k{1} = decompress_poly 1 (decode1 m{2}) /\
            pos_bound256_cxq k{1} 0 256 1 /\
            (rv{2}, e1{2}, e2{2}) = prg_enc_inner r{2}).
       seq 9 5 : #pre; 1: by auto.
       wp; ecall {1} (poly_frommsg_corr msgp{1}).
       wp; while {1} (0 <= w{1} <= 4 /\ inc{1} = 4 /\ pk{1} = _pkp /\
                      (forall k, 0 <= k < w{1}*8 => publicseed{1}.[k] = pk{1}.[1536+k]))
                     (4 - w{1}).
       + move => &m z; auto => /> &hr Hwl Hwh Hcov Hlt.
         split; 2: smt().
         split; 1: smt().
         move => k Hkl Hkh; rewrite initiE 1:/# /=.
         case (w{hr} * 8 <= k < w{hr} * 8 + 8) => Hk.
         + rewrite get8_set64_directE 1,2:/# ifT 1:/# /get64_direct pack8bE 1:/# initiE 1:/# /=.
           rewrite /init8 initiE 1:/# /=; congr; smt().
         rewrite get8_set64_directE 1,2:/# ifF 1:/#.
         rewrite /get8 /init8 initiE 1:/# /=; smt().
       wp; ecall {1} (polyvec_frombytes_corr (Array1536.init (fun i => pk{1}.[i]))).
       auto => /> &1 &2 Hpk1 Hpk2 result Hlift Hbnd.
       split; 1: smt().
       move => publicseed_L w_L; split; 1: smt().
       move => Hncond Hwl Hwh Hcov result0 Hlift0 Hbnd0.
       split; last by rewrite Hpk1.
       apply Array32.tP => k Hk.
       rewrite Hpk2 initiE 1:/# /=; smt().

(* === Step 2: matrix gen, transposed. === *)
seq 2 1 : (#pre /\
           aat{1} = nttunpackm (unlift_matrix aT{2}) /\
           aT{2} = trmx (sampleA rho{2}) /\
           pos_bound4096_cxq aat{1} 0 4096 2).
+ sp 1 1.
       ecall {1} (_gen_matrix_avx2_sem publicseed{1} true).
       auto => /> &1 &2 ??????; do split.
       + congr;congr.
         rewrite /H; apply eq_matrixP => i j [Hi Hj].
          rewrite /nttm /invnttm !mapmE  !offunmE 1,2:/# /= /trmx offunmK /mclamp ifT 1:/#.
          rewrite offunmE 1:/# /= nttK /=; by smt(offunmE).
       + rewrite /H; apply eq_matrixP => i j [Hi Hj].
          rewrite /nttm /invnttm !mapmE  !offunmE 1,2:/# /= /trmx offunmK /mclamp ifT 1:/#.
          rewrite offunmE 1:/# /= nttK /=; by smt(offunmE).
       + rewrite /pos_bound4096_cxq /nttunpackm => k kb.
         rewrite initiE 1:/# /=.
         (* TODO 1024: 4-way case-split (was 3-way in 768) *)
         case (0 <= k < 1024) => kbb.
         + have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
             (nttunpackv (subarray1024 (unlift_matrix (trmx (sampleA rho{2}))) 0)));
                 last by smt(Array1024.allP).
           rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.
           move : (matrix_unlift (trmx (sampleA rho{2}))); smt().
         case (1024 <= k < 2048) => kbb'.
          + have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
             (nttunpackv (subarray1024 (unlift_matrix (trmx (sampleA rho{2}))) 1)));
                last by smt(Array1024.allP).
             rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.
             move : (matrix_unlift (trmx (sampleA rho{2}))); smt().
         case (2048 <= k < 3072) => kbb''.
          + have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
             (nttunpackv (subarray1024 (unlift_matrix (trmx (sampleA rho{2}))) 2)));
                last by smt(Array1024.allP).
             rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.
             move : (matrix_unlift (trmx (sampleA rho{2}))); smt().
         have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
           (nttunpackv (subarray1024 (unlift_matrix (trmx (sampleA rho{2}))) 3)));
               last by smt(Array1024.allP).
         rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.
         move : (matrix_unlift (trmx (sampleA rho{2}))); smt().


(* === Step 3: first getnoise_4x call (1024: fills sp_0 cleanly, no boundary).
     TODO 1024: structure differs from 768 — first call fills sp_0[0..3] entirely
     (4 polys), no e1 first-slot crossover. *)
seq 6 0 : (#pre /\
           (forall i, 0 <= i < 4 =>
              lift_array256 (Array256.init (fun k => sp_0{1}.[256*i + k])) =
                cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int i))) /\
           signed_bound1024_cxq sp_0{1} 0 1024 1).
+  sp 1 0.
  wp.
  ecall {1} (jkem_getnoise_4x_ph noiseseed{1} (W8.of_int 0)).
  auto => /> &1 &2 _ _ _ _ _ _ _ result Hr1 Hr2 Hr3 Hr4 Hb1 Hb2 Hb3 Hb4.
  split.
  + move => i Hi0 Hi4; rewrite /PRF.
    case (i = 0) => Ci0.
    + rewrite Ci0 -Hr1 /lift_array256 tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifF 1:/# ifF 1:/# ifT 1:/# /#.
    case (i = 1) => Ci1.
    + rewrite Ci1 -Hr2 /lift_array256 tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifF 1:/# ifT 1:/# /#.
    case (i = 2) => Ci2.
    + rewrite Ci2 -Hr3 /lift_array256 tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifT 1:/# /#.
    have ->: i = 3 by smt().
    rewrite -Hr4 /lift_array256 tP => k Hk.
    rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifT 1:/# /#.
  rewrite /signed_bound1024_cxq => k Hk; rewrite initiE 1:/# /=.
  case (768 <= k < 1024) => Ck4; first by smt(qE).
  rewrite initiE 1:/# /=.
  case (512 <= k < 768) => Ck3; first by smt(qE).
  rewrite initiE 1:/# /=.
  case (256 <= k < 512) => Ck2; first by smt(qE).
  rewrite initiE 1:/# /= ifT 1:/#; smt(qE).

(* === Step 4: second getnoise_4x call (1024: fills ep cleanly + epp).
     TODO 1024: structure differs — second call fills ep[0..3] (4 polys), epp from extra. *)
(* Step 4a: fill ep cleanly (4 polys) — mirrors Step 3 pattern. *)
seq 6 0 : (#{/~forall i, 0 <= i < 4 =>
                lift_array256 (Array256.init (fun k => sp_0{1}.[256*i + k])) =
                  cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int i))}
            {/~signed_bound1024_cxq sp_0{1} 0 1024 1}pre /\
           lift_polyvec sp_0{1} = rv{2} /\
           lift_polyvec ep{1} = e1{2} /\
           signed_bound1024_cxq sp_0{1} 0 1024 1 /\
           signed_bound1024_cxq ep{1} 0 1024 1).
+ sp 1 0.
  wp; ecall {1} (jkem_getnoise_4x_ph noiseseed{1} (W8.of_int 4)).
  auto => |>.
  move => &1 &2 Hpk1 Hpk2 Hpkpv Hpkb Hkv Hkb Hpge Haatb Hsp_fa Hsp_bnd result Hr1 Hr2 Hr3 Hr4 Hb1 Hb2 Hb3 Hb4.
  have Hrv_eq : rv{2} = (prg_enc_inner r{2}).`1 by smt().
  have Hep_eq : e1{2} = (prg_enc_inner r{2}).`2 by smt().
  do split.
  + (* lift_polyvec sp_0 = rv{2} *)
    have Hrv : forall i, 0 <= i < kvec => rv{2}.[i]%Vector = cbd2sample (PRF r{2} (W8.of_int i)).
    + move => i Hi.
      have ->: rv{2}.[i]%Vector = (prg_enc_inner r{2}).`1.[i]%Vector by rewrite Hrv_eq.
      by rewrite /prg_enc_inner /= offunvE 1:/# /=.
    rewrite eq_vectorP => i Hi.
    rewrite Hrv 1:/# offunvE 1:/# /=.
    have Hspi := Hsp_fa i _; first by smt().
    rewrite tP => k Hk.
    move: Hspi; rewrite /lift_array256 /subarray256 tP => /(_ k _); first by smt().
    by rewrite !mapiE 1:/# /=.
  + (* lift_polyvec ep = e1{2} *)
    rewrite eq_vectorP => i Hi.
    rewrite offunvE 1:/# /= /PRF.
    rewrite /lift_array256 /subarray256 tP => k Hk.
    rewrite mapiE 1:/# /= initiE 1:/# /=.
    case (i = 0) => Ci0.
    + rewrite Ci0 /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifF 1:/# ifF 1:/# ifT 1:/#.
      have := Hr1; rewrite /lift_array256 tP => /(_ k _); 1: smt(); rewrite mapiE 1:/# /= => ->.
      by congr; rewrite /kvec /= Hep_eq /prg_enc_inner /= offunvE 1:/# /#. 
    case (i = 1) => Ci1.
    + rewrite Ci1 /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifF 1:/# ifT 1:/#.
      have := Hr2; rewrite /lift_array256 tP => /(_ k _); 1: smt(); rewrite mapiE 1:/# /= => ->.
      by congr; rewrite /kvec /= Hep_eq /prg_enc_inner /= offunvE 1:/# /#. 
    case (i = 2) => Ci2.
    + rewrite Ci2 /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifT 1:/#.
      have := Hr3; rewrite /lift_array256 tP => /(_ k _); 1: smt(); rewrite mapiE 1:/# /= => ->.
      by congr; rewrite /kvec /= Hep_eq /prg_enc_inner /= offunvE 1:/# /#. 
    have ->: i = 3 by smt().
    rewrite /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifT 1:/#.
    have := Hr4; rewrite /lift_array256 tP => /(_ k _); 1: smt(); rewrite mapiE 1:/# /= => ->.
      by congr; rewrite /kvec /= Hep_eq /prg_enc_inner /= offunvE 1:/# /#. 
  + (* signed_bound1024_cxq sp_0 *)
    rewrite /signed_bound1024_cxq => k Hk; rewrite initiE 1:/# /=.
    case (768 <= k < 1024) => Ck4; first by smt(qE).
    rewrite initiE 1:/# /=.
    case (512 <= k < 768) => Ck3; first by smt(qE).
    rewrite initiE 1:/# /=.
    case (256 <= k < 512) => Ck2; first by smt(qE).
    rewrite initiE 1:/# /= ifT 1:/#; smt(qE).

(* Step 4b: fill epp via single-poly eta2. *)
seq 2 0 : (#pre /\
           lift_array256 epp{1} = e2{2} /\
           signed_bound_cxq epp{1} 0 256 1).
+ sp 1 0.
  wp; ecall {1} (jkem_getnoise_eta2_ph noiseseed{1} (W8.of_int 8)).
  auto => |> &1 &2;  rewrite /prg_enc_inner=>  ??????[#]?????? result Hepp_eq Hepp_bnd;split;smt().


(* === Step 5: NTT(sp_0) on LHS; rhat <- nttv rv on RHS. === *)
seq 1 0 : (#{/~lift_polyvec sp_0{1} = rv{2}}
            {/~signed_bound1024_cxq sp_0{1} 0 1024 1}pre /\
           PolyVec.nttv rv{2} = lift_polyvec (nttpackv sp_0{1}) /\
           pos_bound1024_cxq sp_0{1} 0 1024 2).
   ecall{1}(polyvec_ntt_avx2_corr sp_0{1}).
   auto => |> &1 &2 *;split;smt().

(* === Step 6: mmul while loop — bp gets ntt_mmul aT sp_0 slot-by-slot.
     TODO 1024: kvec=4 ⇒ variant (4 - w{1}), invariant 0 <= w{1} <= 4,
     and the slot-by-slot signed-bound case-split needs a 4th case. *)
seq 2 0 : (#pre /\
           (forall j, 0 <= j < 4 =>
              lift_array256 (subarray256 bp{1} j)%Serialization1024 =
                nttunpack (scale (ntt_mmul aT{2}
                                   (lift_polyvec (nttpackv sp_0{1}))).[j]%Vector
                                  (incoeff 169))) /\
           signed_bound1024_cxq bp{1} 0 1024 4).
+      while {1} (
         0 <= w{1} <= 4 /\
         publicseed{1} = rho{2} /\
         aat{1} = nttunpackm (unlift_matrix aT{2}) /\
         aT{2} = trmx (sampleA rho{2}) /\
         pos_bound4096_cxq aat{1} 0 4096 2 /\
         PolyVec.nttv rv{2} = lift_polyvec (nttpackv sp_0{1}) /\
         pos_bound1024_cxq sp_0{1} 0 1024 2 /\
         (forall j, 0 <= j < w{1} =>
            lift_array256 (subarray256 bp{1} j)%Serialization1024 =
              nttunpack (scale (ntt_mmul aT{2}
                                 (lift_polyvec (nttpackv sp_0{1}))).[j]%Vector
                                (incoeff 169))) /\
         (forall j, 0 <= j < 4 =>
            signed_bound1024_cxq (nttpackv (subarray1024 aat{1} j)) 0 1024 2) /\
         signed_bound1024_cxq bp{1} 0 (w{1} * 256) 4
       ) (4 - w{1}).
       + move => &m z.
         wp; ecall (polyvec_pointwise_acc_corr_alg_avx
           (PolyVec.invnttv (lift_polyvec (nttpackv (subarray1024 aat w))))
           (PolyVec.invnttv (lift_polyvec (nttpackv sp_0)))
           (nttpackv (subarray1024 aat w))
           (nttpackv sp_0)).
         auto => |> &hr ?????Hbpv ? Hbpb?;do split.
         + by rewrite nttvK.
         + smt().
         + by rewrite nttvK.
         + have : all (fun (c : W16.t) => b16 c (2 * q)) (nttpackv sp_0{hr});
             last by rewrite allP => *; smt().
           rewrite nttpackv_pred allP /= => k Hk; smt().
         + rewrite -nttpackv_lift packvK; rewrite /subarray1024.
           apply Array1024.tP => i Hi.
           rewrite /lift_array1024 !mapiE 1,2:/# !initiE 1,2:/# /=; congr.
           have ->: 1024 * w{hr} = w{hr} * 1024 by ring.
           by ring.
         + by rewrite -nttpackv_lift packvK.
         + rewrite /signed_bound1024_cxq => k Hk; rewrite initiE 1:/# /=; smt().
         + smt().
         + move => ???????? rr Hrb Hrv;do split;1,2,5..:smt().
           + move => j jbl jbh.
             rewrite tP => k kb.
             rewrite mapiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
             case (j < w{hr}) => Hj.
             + by rewrite ifF 1:/# -Hbpv 1:/#  mapiE 1:/# /= initiE 1:/# /=.
             rewrite ifT 1:/#.
             have := Hrv; rewrite tP => Hrvk.
             have := Hrvk (256 * j + k - w{hr} * 256) _;1:smt().
             rewrite mapiE 1:/# /= => ->;do congr.
             have -> : j = w{hr} by smt().
             by rewrite (ntt_dotp_row_eq_ntt_mmul (trmx (sampleA rho{m})) sp_0{hr} w{hr}) 1:/#;smt(getvE).
          + smt().
          + rewrite /signed_bound1024_cxq => j jb; rewrite initiE 1:/# /=.
             case (j < w{hr}*256) => Hj;smt().

       auto => |> &1 &2  ????????? H H0 H1.
       do split; 1,3..: smt().
       + move => j Hjl Hjh.
         rewrite nttpackv_subarray1024_nttunpackm 1:/#.
          rewrite /signed_bound1024_cxq => k Hk; rewrite /subarray1024 initiE 1:/# /=.
          have := matrix_unlift (trmx (sampleA rho{2})).
          rewrite /pos_bound4096_cxq /bpos16 /b16; smt().

(* === Step 7: pointwise_acc for v = pkpv · sp_0. === *)
seq 1 0 : (#pre /\
           lift_array256 v{1} =
             nttunpack (scale (ntt_dotp that{2} (PolyVec.nttv rv{2}))
                              (incoeff 169)) /\
           signed_bound_cxq v{1} 0 256 4).
+ ecall{1}(polyvec_pointwise_acc_corr_alg_avx (PolyVec.invnttv that{2}) rv{2}
            (unlift_polyvec that{2}) (nttpackv sp_0{1})).
  auto => |> &1 &2 ?? Hpkpv Hthat Hpkb Hrv Hspb Hpqeq ???H0??.
  split.
  + do split.
    + smt(nttvK vector_unlift).
    + have [_ ] := vector_unlift (ofipolyvec (decode12_vec pk{2}.`1)).
      rewrite /signed_bound1024_cxq /#.
    + have : all (fun (c : W16.t) => b16 c (2 * q)) (nttpackv sp_0{1});
        last by rewrite allP => *; smt().
      rewrite nttpackv_pred  allP /= => k Hk.
      have := H0; rewrite  /pos_bound1024_cxq /#.
    + rewrite Hpkpv; congr; rewrite lift_array1024_unlift_ofipolyvec.
      + rewrite allP => k kb /=.
        have := decode12_vec_bnd pk{2}.`1 k _; smt().
      by smt().
    + by rewrite lift_array1024_nttunpackv_nttpackv.
    + move: Hthat; rewrite /pos_bound1024_cxq /signed_bound1024_cxq /bpos16 /b16 /#.
    + move: H0; rewrite /pos_bound1024_cxq /signed_bound1024_cxq /bpos16 /b16 /#.
  move => ??????? result Hb Hr.
  by rewrite Hr; rewrite ntt_dotp_invnttv.

(* === Step 8: invNTT bp. === *)
seq 1 0 : (#{/~forall j, 0 <= j < 4 =>
                lift_array256 (subarray256 bp{1} j)%Serialization1024 =
                  nttunpack (scale (ntt_mmul aT{2}
                                     (lift_polyvec (nttpackv sp_0{1}))).[j]%Vector
                                    (incoeff 169))}
            {/~signed_bound1024_cxq bp{1} 0 1024 4}pre /\
           (forall j, 0 <= j < 4 =>
              lift_array256 (subarray256 bp{1} j)%Serialization1024 =
                (invntt (ntt_mmul aT{2}
                          (lift_polyvec (nttpackv sp_0{1}))).[j]%Vector)) /\
           signed_bound1024_cxq bp{1} 0 1024 1).
+ ecall{1} (polyvec_invntt_avx2_corr (nttpackv bp{1})).
  auto => |> &1 &2 ???????????? Hslots Hbnd ??.
  split; first by rewrite nttpackv_lift.
  move => ? result Hres Hresbnd.
  move => j Hjbl Hjbh.
  have HrsJ : lift_array256 (subarray256 result j)%Serialization1024 =
            scale (invntt (lift_polyvec (nttpackv bp{1})).[j]%Vector) (incoeff 65536).
  + have <- : (lift_polyvec result).[j]%Vector = lift_array256 (subarray256 result j)%Serialization1024
       by rewrite /lift_polyvec offunvE 1:/# //.
    rewrite -Hres /scale mapvE /= offunvE 1:/# //=;congr;1:smt().
    rewrite /invnttv mapvE !offunvE 1:/# //= offunvK /vclamp ifT 1:/#.
    by rewrite /lift_polyvec offunvK /vclamp ifT 1:/#.

pose mm := offunv (fun jj =>
  scale (ntt_mmul (trmx (sampleA rho{2})) (lift_polyvec (nttpackv sp_0{1}))).[jj]%Vector (incoeff 169)).
have Hbp_polyvec : lift_polyvec (nttpackv bp{1}) = mm.
+ apply kg_loop_post_to_target => jj jjb.
  by rewrite /mm getvE offunvE 1:/# //= Hslots 1:/#.

rewrite HrsJ Hbp_polyvec /mm offunvE 1:/# //=.
rewrite invntt_scale.
rewrite /scale /mul1x256 tP => k Hk.
rewrite !mapiE //=.
pose x := invntt _.
rewrite -ComRing.mulrA -(ComRing.mulrC _ (incoeff 169)).
have ->: incoeff 65536 * incoeff 169 = Zq.one.
+ by rewrite -rrinvcoeff.
by ring.

(* === Step 9: invNTT v. === *)
seq 1 0 : (#{/~lift_array256 v{1} =
                nttunpack (scale (ntt_dotp that{2} (PolyVec.nttv rv{2}))
                                 (incoeff 169))}
            {/~signed_bound_cxq v{1} 0 256 4}pre /\
           lift_array256 v{1} =
             invntt (ntt_dotp that{2} (PolyVec.nttv rv{2})) /\
           signed_bound_cxq v{1} 0 256 1).
+ ecall{1}(poly_invntt_avx2_corr (nttpack v{1})).
  auto => |> &1 &2 ?? Hpkv Hpkb Hkv Hkb; rewrite /prg_enc_inner => [#] Hrv Hep Hepp Hmb Hepb Heppb Hrvv Hspb Hvv Hvb Hmk Hbpb.
  move => result Hresv Hresb.
  rewrite -Hresv lift_nttpack Hrvv Hvv nttunpackK invntt_scale.
  rewrite /scale /mul1x256 tP => k kb.
  rewrite !mapiE //=.
  rewrite ZqField.mulrCA.
  have ->: incoeff 65536 * incoeff 169 = Zq.one by rewrite -rrinvcoeff.
  by rewrite ComRing.mulrC ComRing.mul1r;do congr.

(* === Step 10: bp += ep. === *)
seq 1 0 : (#{/~forall j, 0 <= j < 4 =>
                lift_array256 (subarray256 bp{1} j)%Serialization1024 =
                  (invntt (ntt_mmul aT{2}
                            (lift_polyvec (nttpackv sp_0{1}))).[j])%Vector}
            {/~signed_bound1024_cxq bp{1} 0 1024 1}pre /\
           lift_polyvec bp{1} =
             (PolyVec.invnttv (ntt_mmul aT{2}
                                (lift_polyvec (nttpackv sp_0{1}))) + e1{2})%PolyVec /\
           signed_bound1024_cxq bp{1} 0 1024 2).
+ have H := polyvec_add_corr_avx 1 1 _ _ => //.
  ecall{1} (H (lift_array1024 bp{1}) (lift_array1024 ep{1})).
  auto => |> &1 &2 ?? Hpkv Hpkb Hkv Hkb ; rewrite /prg_enc_inner => [#] Hrv Hep Hepp Hmb Hepb Heppb Hrvv Hspb  Hmk Hbpb Hvv Hvb result Hresbnd Hresk.
  apply eq_vectorP => j Hj.
  rewrite /lift_polyvec offunvE 1:/# /=.
  rewrite /subarray256 /lift_array256 tP => k kb.
  rewrite mapiE 1:/# /= initiE 1:/# /= Hresk 1:/# polyvecD /Vector.(+) offunvE 1:/# /=.
  rewrite offunvE 1:/# /= mapiE 1:/# /= mapiE 1:/# /=.
  rewrite /(&+) map2iE 1:/# /= mapiE 1:/# /= initiE 1:/# /=;congr.
  have := Hmk j _; first by smt().
  rewrite /lift_array256 tP => /(_ k _); first by smt().
  rewrite mapiE 1:/# /= initiE 1:/# /= => ->.
  by rewrite /invnttv mapvE offunvE;1: smt().

(* === Step 11: v += epp. === *)
seq 1 0 : (#{/~lift_array256 v{1} =
                invntt (ntt_dotp that{2} (PolyVec.nttv rv{2}))}
            {/~signed_bound_cxq v{1} 0 256 1}pre /\
           lift_array256 v{1} =
             invntt (ntt_dotp that{2} (PolyVec.nttv rv{2})) &+ e2{2} /\
           signed_bound_cxq v{1} 0 256 2).
+ have H := poly_add_corr_avx 1 1 _ _ => //.
  ecall{1} (H (lift_array256 v{1}) (lift_array256 epp{1})).
  auto => |> &1 &2 ?? Hpkv Hpkb Hkv Hkb ; rewrite /prg_enc_inner => [#] Hrv Hep Hepp Hmb Hepb Heppb Hrvv Hspb  Hmk Hbpb Hvv Hvb result Hresbnd Hresk.
  rewrite /(&+) tP => k kb.
  rewrite map2iE 1:/# mapiE //=.
  rewrite /lift_array256 mapiE //= Hresk //.
  have := Hepp;rewrite tP => Heppk.
  have  := Heppk k kb; rewrite mapiE 1:/# /= => ->;congr.
  by rewrite Hmk.

(* === Step 12: v += k. === *)
seq 1 0 : (#{/~lift_array256 v{1} =
                invntt (ntt_dotp that{2} (PolyVec.nttv rv{2})) &+ e2{2}}
            {/~signed_bound_cxq v{1} 0 256 2}pre /\
           lift_array256 v{1} =
             invntt (ntt_dotp that{2} (PolyVec.nttv rv{2}))
               &+ e2{2}
               &+ decompress_poly 1 (decode1 m{2}) /\
           signed_bound_cxq v{1} 0 256 3).
+ have H := poly_add_corr_avx 2 1 _ _ => //.
  ecall{1} (H (lift_array256 v{1}) (lift_array256 k{1})).
  auto => |> &1 &2 ?? Hpkv Hpkb Hkv Hkb ; rewrite /prg_enc_inner => [#] Hrv Hep Hepp Hmb Hepb Heppb Hrvv Hspb Hbpv Hbpb Hvv Hvb.
  split;1:by  move : Hkb;rewrite /pos_bound256_cxq /signed_bound_cxq; smt(qE).
  move => ? result Hresbnd Hresk.
  rewrite /(&+) tP => k0 kb.
  rewrite map2iE 1:/# mapiE //=.
  rewrite /lift_array256 mapiE //=.
  have  : lift_array256 k{1} = decompress_poly 1 (decode1 m{2}) by smt().
  rewrite tP => Hk_eq.
  have := Hk_eq k0 kb;rewrite /decompress_poly (Array256.mapiE (decompress 1)) 1:/# => <-.
  rewrite map2E initiE 1:/# /= mapiE 1:/# /= Hresk 1:/#;congr.
  rewrite Hvv /(&+) map2E initiE 1:/# /=;congr.
  by rewrite  /lift_array256 !mapiE //=.

(* === Step 13: bp reduce. === *)
seq 1 0 : (#{/~signed_bound1024_cxq bp{1} 0 1024 2}pre /\
           pos_bound1024_cxq bp{1} 0 1024 2).
+ ecall{1} (polyvec_reduce_corr_avx (lift_array1024 bp{1})).
  auto => |>  &1 &2 ?? Hpkv Hpkb Hkv Hkb ; rewrite /prg_enc_inner => [#] Hrv Hep Hepp Hmb Hepb Heppb Hrvv Hspb Hbpv Hbpb Hvv Hvb result Hresbnd Hresk.
  rewrite /lift_polyvec eq_vectorP => i ib.
  rewrite offunvE //= tP => k kb.
  have := Hbpv; rewrite eq_vectorP => Hbpk.
  have := Hbpk i ib; rewrite  offunvE 1:/# /= tP => <-;1:smt().
  by rewrite !subliftsub 1..4:/# -Hresbnd mapiE 1:/# /=.

(* === Step 14: v reduce. === *)
seq 1 0 : (#{/~signed_bound_cxq v{1} 0 256 3}pre /\
           pos_bound256_cxq v{1} 0 256 2).
+ ecall{1} (poly_reduce_corr_avx (lift_array256 v{1})).
  auto =>  |> &1 &2 ?? Hpkv Hpkb Hkv Hkb ; rewrite /prg_enc_inner => [#] Hrv Hep Hepp Hmb Hepb Heppb Hrvv Hspb Hbpv Hbpb Hvv Hvb result Hresbnd Hresk.
    rewrite  tP => k kb.
  have := Hbpv; rewrite eq_vectorP => Hbpk.
  rewrite -Hresbnd mapiE 1:/# /=.
  by rewrite -Hbpb; rewrite  mapiE 1:/# /=.

(* === Steps 15+16: compress bp into ct[0..1408) and v into ct[1408..1568).
     TODO 1024: compress widths are 11 (c1) and 5 (c2). *)
wp; ecall {1} (i_poly_compress_corr v{1}).
wp; ecall {1} (polyvec_compress_avx2_corr bp{1}).
auto =>  |>  &1 &2 ?? Hpkv Hpkb Hkv Hkb; rewrite /prg_enc_inner => [#] Hrv Hep Hepp Hmb Hepb Heppb Hrvv Hspb Hbpv Hvv Hvb Hbpb result Hresv result0 Hres0; split.
+ rewrite tP => k kn.
  rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifT 1:/#.
  have := Hresv; rewrite tP => Hresvk.
  have := Hresvk k kn; rewrite initiE 1:/# /= => ->.
  rewrite /encode11_vec get_of_list 1:/# /=;do congr;smt().
rewrite tP => k kb;rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifT 1:/# /= Hres0.
rewrite initiE 1:/# /=;do congr;smt().
qed.

lemma mlkem_correct_enc_1_avx2 _pkp :
  equiv [Jkem_avx2.M.__indcpa_enc ~ InnerPKE1024.enc_derand :
    msgp{1} = m{2} /\ pk{1} = _pkp /\
    noiseseed{1} = coins{2} /\
    pk{2}.`1 = Array1536.init (fun i => pk{1}.[i]) /\
    pk{2}.`2 = Array32.init (fun i => pk{1}.[i+1536])
    ==>
    let (c1,c2) = res{2} in
    c1 = Array1408.init (fun i => res{1}.[i]) /\
    c2 = Array160.init (fun i => res{1}.[i+1408])].
proof.
transitivity InnerPKE_Op.enc_derand
  (msgp{1} = m{2} /\ pk{1} = _pkp /\
   noiseseed{1} = r{2} /\
   pk{2}.`1 = Array1536.init (fun i => pk{1}.[i]) /\
   pk{2}.`2 = Array32.init (fun i => pk{1}.[i+1536])
   ==>
   let (c1,c2) = res{2} in
   c1 = Array1408.init (fun i => res{1}.[i]) /\
   c2 = Array160.init (fun i => res{1}.[i+1408]))
  (={arg} ==> ={res}).
+ smt().
+ smt().
+ exact (mlkem_correct_enc_avx2_op _pkp).
+ conseq enc_op_eq.
qed.

lemma mlkem_correct_kg_avx2_op :
  equiv [Jkem_avx2.M.__indcpa_keypair ~ InnerPKE_Op.kg_derand :
    randomnessp{1} = coins{2}
    ==>
    let (pk,sk) = res{2} in let (t,rho) = pk in
      sk = res{1}.`2 /\
      t = Array1536.init (fun i => res{1}.`1.[i]) /\
      rho = Array32.init (fun i => res{1}.`1.[1536+i])].
proof.
proc => /=.

(* === Step 1: seed expansion (mirrors 768 lines 1154-1230). === *)
seq 16 5 : (#pre /\ publicseed{1} = rho{2} /\
            noiseseed{1} = (G_coins_ds coins{2}).`2 /\
            s{2} = (prg_kg_inner coins{2}).`2 /\
            e{2} = (prg_kg_inner coins{2}).`3).
+ seq 11 5 : (randomnessp{1} = coins{2} /\
              rho{2} = (G_coins_ds coins{2}).`1 /\
              s{2} = (prg_kg_inner coins{2}).`2 /\
              e{2} = (prg_kg_inner coins{2}).`3 /\
              inc{1} = 4 /\
              (forall k, 0 <= k < 32 => inbuf{1}.[k] = randomnessp{1}.[k])).
  + wp; while {1} (inc{1} = 4 /\ 0 <= i{1} <= 4 /\ randomnessp{1} = coins{2} /\
                   (forall k, 0 <= k < i{1}*8 => inbuf{1}.[k] = randomnessp{1}.[k]))
                  (4 - i{1}).
    + move => &m z; auto => /> &hr Hi0 Hi1 Hbnd Hgi; do split; 1..2,4:smt().
      move => k kbl kbh; rewrite initiE 1:/# /= get8_set64E 1,2:/#.
      case (i{hr}*8 <= k < i{hr}*8+8) => Hk.
      + rewrite ifT 1:/# /get64 /get64_direct pack8bE 1:/# initiE 1:/# /=.
        rewrite /init8 initiE 1:/# /=; congr; smt().
      rewrite ifF 1:/# /get8 /init8 initiE 1:/# /=; smt().
    auto => /> /#.
  seq 2 0 : (randomnessp{1} = coins{2} /\
             rho{2} = (G_coins_ds coins{2}).`1 /\
             s{2} = (prg_kg_inner coins{2}).`2 /\
              e{2} = (prg_kg_inner coins{2}).`3 /\
             inbuf{1} = Array33.init (fun k => if k < 32 then coins{2}.[k]
                                               else W8.of_int kvec) /\
             to_list buf{1} = SHA3_512 (to_list inbuf{1})).
  + wp; ecall {1} (sha3_512A_A33_ph inbuf{1}); auto => />.
    move => &1 &2 Hbnd r Hr; rewrite tP => k kb; rewrite initiE 1:/# /= get_setE 1:/#.
    case (k = 32) => Hk.
    + by rewrite ifF 1:/# /kvec.
    by rewrite ifT 1:/# Hbnd /#.
  sp 2 0; conseq />.
  while {1} (0 <= i{1} <= inc{1} /\ inc{1} = 4 /\
             buf{1} = Array64.init (fun k =>
                if 0 <= k < 32 then rho{2}.[k]
                else (G_coins_ds coins{2}).`2.[k - 32]) /\
             (forall k, 0 <= k < i{1}*8 =>
                publicseed{1}.[k] = rho{2}.[k] /\
                noiseseed{1}.[k] = (G_coins_ds coins{2}).`2.[k]))
            (4 - i{1}); last first.
  + auto => /> &1 &2 Hbuf;do split;2:smt().
    + have <- := Array64.to_listK witness ( buf{1}); rewrite Hbuf.
      rewrite tP => k kb.
      rewrite get_of_list // initiE 1:/# /= /G_coins /SHA3_512_33_64 /=.
      case (0<=k<32) => ?.
      + rewrite get_of_list //.
        rewrite (nth_take W8.zero 32) 1,2:/#.
        rewrite !(nth_change_dfl W8.zero witness);smt(size_SQUEEZE1600).
      rewrite get_of_list 1:/#.
      rewrite (nth_drop W8.zero 32) 1,2:/#.
      rewrite !(nth_change_dfl W8.zero witness);smt(size_SQUEEZE1600).
   + move => ? ns ps;split;1:smt().
     move => ?????;do split; 1,2: by rewrite tP;smt().

  + move => &m z;auto => /> &hr ????;do split;1,2,4:smt().
    move => k kbl kbh;split;rewrite initiE 1:/# get8_set64E 1,2:/#.
    + case (8 * i{hr} <= k < 8 * (i{hr} + 1)) => ?; last first.
      + by rewrite /init8 /get8 initiE 1:/# /#.
      rewrite wordP => ii iib.
      rewrite  /(\bits8) initiE 1:/# /= /get64_direct pack8E initiE 1:/# /=.
      rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifT /#.
    + case (8 * i{hr} <= k < 8 * (i{hr} + 1)) => ?; last first.
      + by rewrite /init8 /get8 initiE 1:/# /#.
      rewrite wordP => ii iib.
      rewrite  /(\bits8) initiE 1:/# /= /get64_direct pack8E initiE 1:/# /=.
      rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF /#.

seq 2 1 : (#pre /\ aa{1} = nttunpackm (unlift_matrix a{2}) /\
           a{2} = sampleA rho{2} /\
           pos_bound4096_cxq aa{1} 0 4096 2).
+ sp 1 1.
  ecall {1} (_gen_matrix_avx2_sem publicseed{1} false).
  auto => /> &2 ?; do split;1,2: smt(nttmK).
  rewrite /pos_bound4096_cxq /nttunpackm => k kb.
  rewrite initiE 1:/# /=.
  (* TODO 1024: 4-way case-split. *)
  case (0 <= k < 1024) => kbb.
  + have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
             (nttunpackv (subarray1024 (unlift_matrix (sampleA rho{2})) 0)));
      last by smt(Array1024.allP).
    rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.
    by smt(matrix_unlift).
  case (1024 <= k < 2048) => kbb'.
  + have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
             (nttunpackv (subarray1024 (unlift_matrix (sampleA rho{2})) 1)));
      last by smt(Array1024.allP).
    rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.
    by smt(matrix_unlift).
  case (2048 <= k < 3072) => kbb''.
  + have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
             (nttunpackv (subarray1024 (unlift_matrix (sampleA rho{2})) 2)));
      last by smt(Array1024.allP).
    rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.
    by smt(matrix_unlift).
  have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
           (nttunpackv (subarray1024 (unlift_matrix (sampleA rho{2})) 3)));
    last by smt(Array1024.allP).
  rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.
  by smt(matrix_unlift).

(* === Step 3a: first getnoise_4x — 1024 fills skpv[0..3] cleanly.
     TODO 1024: 4-poly clean fill, no e[0] boundary. *)
seq 6 0 : (#pre /\
  (forall i, 0 <= i < 4 =>
     lift_array256 (Array256.init (fun k => skpv{1}.[256*i + k])) =
       cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int i))) /\
  signed_bound1024_cxq skpv{1} 0 1024 1).
+ sp 1 0.
  wp.
  ecall {1} (jkem_getnoise_4x_ph noiseseed{1} (W8.of_int 0)).
  auto => /> &1 &2 Hrho  result Hr1 Hr2 Hr3 Hr4 Hb1 Hb2 Hb3 Hb4.
  split.
  + move => i Hi0 Hi4; rewrite /PRF.
    case (i = 0) => Ci0.
    + rewrite Ci0 -Hr1 /lift_array256 tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifF 1:/# ifF 1:/# ifT 1:/# /#.
    case (i = 1) => Ci1.
    + rewrite Ci1 -Hr2 /lift_array256 tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifF 1:/# ifT 1:/# /#.
    case (i = 2) => Ci2.
    + rewrite Ci2 -Hr3 /lift_array256 tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifT 1:/# /#.
    have ->: i = 3 by smt().
    rewrite -Hr4 /lift_array256 tP => k Hk.
    rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifT 1:/# /#.
  rewrite /signed_bound1024_cxq => k Hk; rewrite initiE 1:/# /=.
  case (768 <= k < 1024) => Ck4; first by smt(qE).
  rewrite initiE 1:/# /=.
  case (512 <= k < 768) => Ck3; first by smt(qE).
  rewrite initiE 1:/# /=.
  case (256 <= k < 512) => Ck2; first by smt(qE).
  rewrite initiE 1:/# /= ifT 1:/#; smt(qE).

(* === Step 3b: second getnoise_4x — 1024 fills e[0..3] cleanly. === *)
seq 6 0 : (#pre /\
  lift_polyvec skpv{1} = (prg_kg_inner coins{2}).`2 /\
  lift_polyvec e{1} = (prg_kg_inner coins{2}).`3 /\
  signed_bound1024_cxq skpv{1} 0 1024 1 /\
  signed_bound1024_cxq e{1} 0 1024 1).
+ sp 1 0.
  wp.
  ecall {1} (jkem_getnoise_4x_ph noiseseed{1} (W8.of_int 4)).
  auto => |>.
  move => &1 &2 Haab Hskpv Hskpvb result Hr1 Hr2 Hr3 Hr4 Hb1 Hb2 Hb3 Hb4.
  have Hs2v : forall i, 0 <= i < kvec => (prg_kg_inner coins{2}).`2.[i]%Vector = cbd2sample (PRF (G_coins_ds coins{2}).`2 (W8.of_int i)).
  + by move => i Hi; rewrite /prg_kg_inner /= offunvE 1:/# /=.
  have He3v : forall i, 0 <= i < kvec => (prg_kg_inner coins{2}).`3.[i]%Vector = cbd2sample (PRF (G_coins_ds coins{2}).`2 (W8.of_int (i + kvec))).
  + by move => i Hi; rewrite /prg_kg_inner /= offunvE 1:/# /=.
  do split.
  + (* lift_polyvec skpv = (prg_kg_inner coins).`2 *)
    rewrite eq_vectorP => i Hi.
    rewrite Hs2v 1:/# offunvE 1:/# /=.
    have Hspi := Hskpv i _; first by smt().
    rewrite tP => k Hk.
    move: Hspi; rewrite /lift_array256 /subarray256 tP => /(_ k _); first by smt().
    by rewrite !mapiE 1:/# /=.
  + (* lift_polyvec e = (prg_kg_inner coins).`3 *)
    rewrite eq_vectorP => i Hi.
    rewrite He3v 1:/# /PRF offunvE 1:/# /=.
    rewrite /lift_array256 /subarray256 tP => k Hk.
    rewrite mapiE 1:/# /= initiE 1:/# /=.
    case (i = 0) => Ci0.
    + rewrite Ci0 /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifF 1:/# ifF 1:/# ifT 1:/#.
      have := Hr1; rewrite /lift_array256 tP => /(_ k _); 1: smt(); rewrite mapiE 1:/# /= => ->.
      by congr; rewrite /kvec /#.
    case (i = 1) => Ci1.
    + rewrite Ci1 /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifF 1:/# ifT 1:/#.
      have := Hr2; rewrite /lift_array256 tP => /(_ k _); 1: smt(); rewrite mapiE 1:/# /= => ->.
      by congr; rewrite /kvec /#.
    case (i = 2) => Ci2.
    + rewrite Ci2 /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifT 1:/#.
      have := Hr3; rewrite /lift_array256 tP => /(_ k _); 1: smt(); rewrite mapiE 1:/# /= => ->.
      by congr; rewrite /kvec /#.
    have ->: i = 3 by smt().
    rewrite /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifT 1:/#.
    have := Hr4; rewrite /lift_array256 tP => /(_ k _); 1: smt(); rewrite mapiE 1:/# /= => ->.
    by congr; rewrite /kvec /#.
  (* signed_bound1024_cxq e -- from Hb1..Hb4 *)
  rewrite /signed_bound1024_cxq => k Hk; rewrite initiE 1:/# /=.
  case (768 <= k < 1024) => Ck4; first by smt(qE).
  rewrite initiE 1:/# /=.
  case (512 <= k < 768) => Ck3; first by smt(qE).
  rewrite initiE 1:/# /=.
  case (256 <= k < 512) => Ck2; first by smt(qE).
  rewrite initiE 1:/# /= ifT 1:/#; smt(qE).

seq 2 2 : (#{/~s{2} = (prg_kg_inner coins{2}).`2}
            {/~e{2} = (prg_kg_inner coins{2}).`3}
            {/~lift_polyvec skpv{1} = (prg_kg_inner coins{2}).`2}
            {/~lift_polyvec e{1} = (prg_kg_inner coins{2}).`3}
            {/~signed_bound1024_cxq skpv{1} 0 1024 1}
            {/~signed_bound1024_cxq e{1} 0 1024 1}
            {/~forall i, 0 <= i < 4 =>
                 lift_array256 (Array256.init (fun k => skpv{1}.[256*i + k])) =
                 cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int i))}pre /\
           s{2} = lift_polyvec (nttpackv skpv{1}) /\
           e{2} = lift_polyvec (nttpackv e{1}) /\
           pos_bound1024_cxq skpv{1} 0 1024 2 /\
           pos_bound1024_cxq e{1} 0 1024 2).
+ ecall{1}(polyvec_ntt_avx2_corr e{1}).
  ecall{1}(polyvec_ntt_avx2_corr skpv{1}).
  auto => />  &1 &2 Hs He ? Hs1 Hs2 ?;split;1:smt().
  move => ? rr1 Hrr1 ?;split;1:smt().
  move => ? rr2 Hrr2 ?;split;1:smt().
  by smt().


seq 6 3 : (
  publicseed{1} = rho{2} /\
  sk{1} = sv{2} /\
  aux_3{1} = tv{2}); last first.
  sp 3 0.
  while {1} (inc{1} = 4 /\ 0 <= i{1} <= 4 /\
             publicseed{1} = rho{2} /\
             sk{1} = sv{2} /\
             aux_3{1} = tv{2} /\
             (forall k, 0 <= k < 1536 => pk{1}.[k] = aux_3{1}.[k]) /\
             (forall k, 0 <= k < i{1}*8 => pk{1}.[1536+k] = publicseed{1}.[k]))
            (4 - i{1}).
  + move => &m z; auto => /> &hr Hpk_low Hpk_high Hi0 Hi1 Hlt.
    do split; 1,2,5:smt().
    + move => k kbl kbh; rewrite initiE 1:/# /= get8_set64_directE 1,2:/# ifF 1:/#.
      rewrite /get8 /init8 initiE 1:/# /=; smt().
    (* pk[1536..1536+(i+1)*8] coverage *)
    move => k kbl kbh; rewrite initiE 1:/# /= get8_set64_directE 1,2:/#.
    case (i{hr}*8 <= k < i{hr}*8+8) => Hk.
    + rewrite ifT 1:/# /get64 /get64_direct pack8bE 1:/# initiE 1:/# /=.
      rewrite /init8 initiE 1:/# /=; congr; smt().
    rewrite ifF 1:/# /get8 /init8 initiE 1:/# /=; smt().
  auto => /> &1  Haux3.
  do split; 2:smt().
  + move => k kbl kbh; rewrite initiE 1:/# /= ifT 1:/#; smt().
  move => i pk;split;1:smt().
  move => Hi_neg Hi_lo Hi_hi Hpk_low Hpk_high.
  do split.
  + rewrite tP => k Hk; rewrite initiE 1:/# /=; smt().
  rewrite tP => k Hk; rewrite initiE 1:/# /=; smt().

ecall {1} (polyvec_tobytes_corr pkpv{1}).
ecall {1} (polyvec_tobytes_corr skpv{1}).
ecall {1} (polyvec_reduce_corr_avx (lift_array1024 pkpv{1})).
ecall {1} (polyvec_add_corr_avx 2 2 _ _ (lift_array1024 pkpv{1}) (lift_array1024 e{1})) => //.

wp.

conseq (: _ ==>
  publicseed{1} = rho{2} /\
  s{2} = lift_polyvec (nttpackv skpv{1}) /\
  e{2} = lift_polyvec (nttpackv e{1}) /\
  pos_bound1024_cxq skpv{1} 0 1024 2 /\
  pos_bound1024_cxq e{1} 0 1024 2 /\
  lift_polyvec (nttpackv pkpv{1}) = ntt_mmul a{2} s{2} /\
  signed_bound1024_cxq pkpv{1} 0 1024 2).
+ move => |> &1 &2 ? Hskb Heb _pk Hmmul Hpkb.
  do split; 1: smt().
  move => ? rr Hrrb Hrrv rr1 Hrr1v ? Hrr1b.
  split.
  + congr. 
    rewrite -toipolivec_lift.
  congr.
  have Hrr1_lift : forall k, 0 <= k < 1024 =>
      (lift_array1024 rr1).[k] = (lift_array1024 _pk).[k] + (lift_array1024 e{1}).[k].
  + move => k Hk; rewrite -Hrr1v /lift_array1024 mapiE 1:/# /=.
    by move: (Hrrv k Hk); rewrite /lift_array1024 !mapiE 1..3:/# /=.
  have Hpoly : lift_polyvec (nttpackv rr1) =
               (lift_polyvec (nttpackv _pk) + lift_polyvec (nttpackv e{1}))%Vector
    by apply (lift_polyvec_nttpackv_add _pk e{1} rr1 Hrr1_lift).
  rewrite -Hmmul.
  by have := Hpoly; rewrite -toipolivec_lift  polyvecD => <-.

conseq |>.

sp 1 0.

(* Mmul while loop — kvec=4. *)
while {1} (
  0 <= i{1} <= 4 /\
  publicseed{1} = rho{2} /\
  aa{1} = nttunpackm (unlift_matrix a{2}) /\
  pos_bound4096_cxq aa{1} 0 4096 2 /\
  s{2} = lift_polyvec (nttpackv skpv{1}) /\
  e{2} = lift_polyvec (nttpackv e{1}) /\
  pos_bound1024_cxq skpv{1} 0 1024 2 /\
  pos_bound1024_cxq e{1} 0 1024 2 /\
  (forall j, 0 <= j < i{1} =>
     lift_array256 (subarray256 pkpv{1} j)%Serialization1024 =
     nttunpack ((ntt_mmul a{2} s{2}).[j])%PolyVec) /\ 
  (forall j, 0 <= j < 4 =>
     signed_bound1024_cxq (nttpackv (subarray1024 aa{1} j)) 0 1024 2) /\
  signed_bound1024_cxq pkpv{1} 0 (i{1} * 256) 2
) (4 - i{1}).
+ move => &m z.
  wp; ecall (poly_frommont_corr_avx
               (map W16.to_sint (Array256.init (fun k => pkpv.[i * 256 + k])))); last first.
  + by call polyvec_pointwise_acc_avx_ll.
  wp; ecall (polyvec_pointwise_acc_corr_alg_avx
               (PolyVec.invnttv (lift_polyvec (nttpackv (subarray1024 aa i))))
               (PolyVec.invnttv (lift_polyvec (nttpackv skpv)))
               (nttpackv (subarray1024 aa i))
               (nttpackv skpv)).
  auto => |> &hr ?? H H0 H1 H2 H3 H4 ?.
  + split; rewrite !nttvK /=.
    do split; 1,6: smt().
    + rewrite /signed_bound1024_cxq /nttpackv => k kb.
      rewrite initiE 1:/# /=.
      pose P := fun (c : W16.t) => - 2 * q <= to_sint c < 2 * q.
      (* TODO 1024: 4-way case-split (was 3-way in 768) *)
      case (0 <= k < 256) => ?.
      + have : all P (nttpack (subarray256 skpv{hr} 0))%Serialization1024;
          last by rewrite allP /P; smt(Array256.allP).
        rewrite nttpack_pred allP /P /subarray256 => kk Hkk.
        rewrite initiE 1:/# /= /#.
      case (256 <= k < 512) => ?.
      + have : all P (nttpack (subarray256 skpv{hr} 1))%Serialization1024;
          last by rewrite allP /P; smt(Array256.allP).
        rewrite nttpack_pred allP /P /subarray256 => kk Hkk.
        rewrite initiE 1:/# /= /#.
      case (512 <= k < 768) => ?.
      + have : all P (nttpack (subarray256 skpv{hr} 2))%Serialization1024;
          last by rewrite allP /P; smt(Array256.allP).
        rewrite nttpack_pred allP /P /subarray256 => kk Hkk.
        rewrite initiE 1:/# /= /#.
      have : all P (nttpack (subarray256 skpv{hr} 3))%Serialization1024;
        last by rewrite allP /P; smt(Array256.allP).
      rewrite nttpack_pred allP /P /subarray256 => kk Hkk.
      rewrite initiE 1:/# /= /#.
    + have ->: init (fun (i_0 : int) => (nttunpackm (unlift_matrix a{m})).[i{hr} * 1024 + i_0])
             = subarray1024 (nttunpackm (unlift_matrix a{m})) i{hr}.
      + rewrite /subarray1024; apply Array1024.tP => k Hk.
        by rewrite !initiE //=; congr; ring.
      by rewrite -nttpackv_lift packvK.
    + by rewrite -nttpackv_lift packvK.
    + rewrite /signed_bound1024_cxq => k Hk.
      rewrite initiE 1:/# /=.
      move: H; rewrite /pos_bound4096_cxq => H.
      by have := H (i{hr} * 1024 + k) _; smt().
  move => ?????? rr0 Hrr0v Hrr0b rr1 Hrr1; do split; 1,2,5..: smt().
  + move => j Hj0 Hji.
    have Hcase : j < i{hr} \/ j = i{hr} by smt().
    case Hcase => [Hjlt | Hjeq].
    + rewrite (subarray256_double_init_fallthrough pkpv{hr} rr0 rr1 i{hr} j) 1,2:/#; smt().
    rewrite Hjeq.
    have ->: subarray256%Serialization1024
      (Array1024.init
        (fun (i_0 : int) =>
           if i{hr} * 256 <= i_0 < i{hr} * 256 + 256 then rr1.[i_0 - i{hr} * 256]
           else
             (Array1024.init
                (fun (i_0_0 : int) =>
                   if i{hr} * 256 <= i_0_0 < i{hr} * 256 + 256 then rr0.[i_0_0 - i{hr} * 256] else pkpv{hr}.[i_0_0])).[i_0])) i{hr} = rr1.
    + rewrite /subarray256; apply Array256.tP => k Hk.
      by rewrite initiE 1:/# /= initiE 1:/# /= ifT 1:/# /=; congr; ring.
    rewrite -(ntt_dotp_row_eq_ntt_mmul a{m} skpv{hr} i{hr}) 1:/#.
    apply (frommont_cancels_at_slot rr0 rr1 _) => //.

  + move => k Hk.
    move: Hrr1; rewrite tP => /(_ k _) //; rewrite !mapiE //= => ->.
    by rewrite initiE 1:/# /= initiE 1:/# /= ifT 1:/# /#.
  rewrite /signed_bound1024_cxq => k Hk.
  rewrite initiE 1:/# /=.
  case (i{hr} * 256 <= k < i{hr} * 256 + 256) => Hk1.
  + have Hrr1k : to_sint rr1.[k - i{hr} * 256]
               = Fq.Fq.SignedReductions.SREDC
                   (to_sint rr0.[k - i{hr} * 256]
                    * (Fq.Fq.SignedReductions.R ^ 2 %% q)).
    + move: Hrr1; rewrite tP => /(_ (k - i{hr} * 256) _); 1: smt().
      rewrite !mapiE 1..3:/# /= initiE 1:/# /= initiE 1:/# /= ifT 1:/# /=.
      by have ->: i{hr} * 256 + (k - i{hr} * 256) - i{hr} * 256 = k - i{hr} * 256 by ring.
    have [#] := Fq.Fq.SignedReductions.SREDCp_corr
                  (to_sint rr0.[k - i{hr} * 256]
                   * (Fq.Fq.SignedReductions.R ^ 2 %% q)) _ _.
    + by rewrite /Fq.Fq.SignedReductions.R; smt(qE).
    + have := Hrr0v (k - i{hr} * 256) _; 1: smt().
      by rewrite /Fq.Fq.SignedReductions.R; smt(qE @Fq.Fq.SignedReductions).
    move => Hl Hh _; rewrite /b16 Hrr1k.
    have := Fq.Fq.SignedReductions.SREDCp_corr
              (to_sint rr0.[k - i{hr} * 256] * (Fq.Fq.SignedReductions.R ^ 2 %% q)) _ _.
    + by rewrite /Fq.Fq.SignedReductions.R; smt(qE).
    + have := Hrr0v (k - i{hr} * 256) _; 1: smt().
      by rewrite /Fq.Fq.SignedReductions.R; smt(qE @Fq.Fq.SignedReductions).
    smt().
  rewrite initiE 1:/# /= ifF 1:/#.
  move: H4; rewrite /signed_bound1024_cxq => H4'.
  by have := H4' k _; smt().


auto => |> &1 &2 H H0 H1.
do split; 1,3: smt().
+ move => j Hj0 Hj3; rewrite /signed_bound1024_cxq.
  have : all (fun (c : W16.t) => b16 c (2 * q))
           (nttpackv (subarray1024 (nttunpackm (unlift_matrix (sampleA rho{2}))) j));
    last by smt(Array1024.allP).
  rewrite nttpackv_pred allP /subarray1024 => kk Hkk.
  rewrite initiE 1:/# /=.
  move: H; rewrite /pos_bound4096_cxq => Hpb.
  by have := Hpb (1024 * j + kk) _; smt().

move => i pkpv; split; 1: smt().
move => Hi0 Hi1 Hgt Hslots Hbnd ?.
have Hi4: i = 4 by smt().
do split; 2: smt().
+ apply (kg_loop_post_to_target pkpv _) => j jb.
  by apply Hslots; smt().
qed.

(* DERIVED: original target via transitivity through InnerPKE_Op (operator
   form spec) using kg_op_eq from InnerPKE1024_Op. *)
lemma mlkem_correct_kg_avx2 :
  equiv [Jkem_avx2.M.__indcpa_keypair ~ InnerPKE1024.kg_derand :
    randomnessp{1} = coins{2}
    ==>
    let (pk,sk) = res{2} in let (t,rho) = pk in
      sk = res{1}.`2 /\
      t = Array1536.init (fun i => res{1}.`1.[i]) /\
      rho = Array32.init (fun i => res{1}.`1.[1536+i])].
proof.
transitivity InnerPKE_Op.kg_derand
  (randomnessp{1} = coins{2} ==>
     let (pk,sk) = res{2} in let (t,rho) = pk in
       sk = res{1}.`2 /\
       t = Array1536.init (fun i => res{1}.`1.[i]) /\
       rho = Array32.init (fun i => res{1}.`1.[1536+i]))
  (={arg} ==> ={res}).
+ smt().
+ smt().
+ exact mlkem_correct_kg_avx2_op.
+ conseq kg_op_eq.
qed.


(********** TOP-LEVEL: mlkem_correct_dec for avx2 (1024) **************)

lemma mlkem_correct_dec :
  equiv [Jkem_avx2.M.__indcpa_dec ~ InnerPKE1024.dec :
    ={sk} /\
    let (c1,c2) = cph{2} in
      c1 = Array1408.init (fun i => ct{1}.[i]) /\
      c2 = Array160.init (fun i => ct{1}.[1408+i])
    ==>
    res{1} = res{2}].
proof.
proc => /=.
swap {2} 3 -2.
sp 0 1.
swap {2} [3..4] -1.
swap {1} 6 -4.

(* Step 1: decompress c1 -> u  (avx2: __i_polyvec_decompress, 11-bit) *)
seq 2 3 : (#pre /\ u{2} = lift_polyvec bp{1} /\
           signed_bound1024_cxq bp{1} 0 1024 2).
+ wp; ecall{1}(polyvec_decompress_corr (Array1408.init (fun (i : int) => ct{1}.[0 + i]))).
  auto => /> /#.

swap {2} [2..3] -1.
swap {1} 2 -1.
swap {1} [4..5] -2.

(* Step 2: decompress c2 -> v  (avx2: _i_poly_decompress, 5-bit) *)
seq 3 2 : (#{/~ct{1}}pre /\ v{2} = lift_array256 v{1} /\
           signed_bound_cxq v{1} 0 256 1).
+ wp; ecall{1}(poly_decompress_corr (Array160.init (fun (i : int) => ct{1}.[1408 + i]))).
  auto => /> /#.

swap {1} 2 -1.
swap {1} 3 -2.

(* Step 3: frombytes sk -> skpv *)
seq 1 3 : (#pre /\ lift_array1024 skpv{1} = nttunpackv (map incoeff (decode12_vec sk{1})) /\
           s{2} = ofipolyvec (decode12_vec sk{2}) /\
           pos_bound1024_cxq skpv{1} 0 1024 2).
+ wp; ecall{1}(polyvec_frombytes_corr sk{1}).
  auto => /> /#.

swap {1} 3 -2.

(* Step 4: NTT bp *)
seq 1 0 : (#{/~u{2} = lift_polyvec bp{1}}{/~signed_bound1024_cxq bp{1} 0 1024 2}pre /\
           PolyVec.nttv u{2} = lift_polyvec (nttpackv bp{1}) /\
           pos_bound1024_cxq bp{1} 0 1024 2).
+ ecall{1}(polyvec_ntt_avx2_corr bp{1}).
  auto => /> /#.

swap {1} 2 2.

(* Step 5: pointwise-acc s · u *)
seq 2 0 : (#pre /\
           lift_array256 t{1} = nttunpack (scale (ntt_dotp s{2} (PolyVec.nttv u{2})) (incoeff 169)) /\
           signed_bound_cxq t{1} 0 256 4).
+ ecall{1}(polyvec_pointwise_acc_corr_alg_avx (PolyVec.invnttv s{2}) u{2}
            (unlift_polyvec s{2}) (nttpackv bp{1})).
  auto.
  move => &1 &2 [[? [Heqsk [? [? [Hskpv [Hs2 Hsk]]]]]] [Hu Hbound]].
  split.
  + do split.
    + rewrite nttvK /= Hs2;smt(vector_unlift).
    + smt(vector_unlift signed_bound1024_cxq_small).
    + smt().
    + have H := nttpackv_pred bp{1} (fun (c : W16.t) => b16 c (2*q)).
      move : H Hbound; rewrite !allP /= iffE /= => [# _ Himpl] Hb.
      rewrite /signed_bound1024_cxq /b16; apply Himpl.
      move : Hb; rewrite /pos_bound1024_cxq /bpos16 => Hb i ib.
      have := Hb i ib; smt(qE).
    + rewrite Hskpv Hs2;congr;rewrite lift_array1024_unlift_ofipolyvec.
      + rewrite allP => k kb /=.
        have := decode12_vec_bnd sk{2} k _; smt().
      by rewrite Heqsk.
    + by rewrite lift_array1024_nttunpackv_nttpackv.
    + move : Hsk; rewrite /pos_bound1024_cxq /signed_bound1024_cxq /bpos16 /b16 /#.
    + move : Hbound; rewrite /pos_bound1024_cxq /signed_bound1024_cxq /bpos16 /b16 /#.
  move => _ result [Hb Hr].
  do split => //; first by rewrite Hr ntt_dotp_invnttv.

(* Step 6: invNTT t *)
seq 1 0 : (#{/~lift_array256 t{1} = nttunpack (scale (ntt_dotp s{2} (PolyVec.nttv u{2})) (incoeff 169))}{/~signed_bound_cxq t{1} 0 256 4}pre /\
           lift_array256 t{1} = invntt (ntt_dotp s{2} (PolyVec.nttv u{2})) /\
           signed_bound_cxq t{1} 0 256 1).
+ ecall{1}(poly_invntt_avx2_corr (nttpack t{1})).
  auto.
  move => &1 &2 [Hpre [Htsh Htbnd]].
  split; first done.
  move => _ result [Hres Hresbnd]; split; first by smt().
  split; last by smt().
  rewrite -Hres lift_nttpack Htsh nttunpackK invntt_scale.
  rewrite /scale /mul1x256 tP => k kb.
  rewrite !mapiE //=.
  rewrite ZqField.mulrCA.
  have ->: incoeff 65536 * incoeff 169 = Zq.one by rewrite -rrinvcoeff.
  by ring.

(* Step 7: mp = v - t *)
seq 2 0 : (#pre /\
           lift_array256 mp{1} = v{2} &+ (&-) (invntt (ntt_dotp s{2} (PolyVec.nttv u{2}))) /\
           signed_bound_cxq mp{1} 0 256 2).
+ have H := poly_sub_corr_avx 1 1 _ _ => //.
  ecall{1} (H (lift_array256 v{1}) (lift_array256 t{1})).
  auto.
  move => &1 &2 [Hpre [Htlift Htbnd]].
  split; first by smt().
  move => _ result [Hresbnd Hresk].
  split; first done.
  split; last by smt().
  rewrite /(&+) /(&-) tP => k kb.
  rewrite map2iE 1:/# mapiE //=.
  rewrite /lift_array256 mapiE //=.
  have Hveq : v{2} = lift_array256 v{1} by smt().
  have := Hresk k kb.
  by rewrite Hveq Htlift /lift_array256 !mapiE //=.

(* Step 8: reduce mp *)
seq 1 1 : (pos_bound256_cxq mp{1} 0 256 2 /\
           lift_array256 mp{1} = mp{2}).
+ ecall{1}(poly_reduce_corr_avx (lift_array256 mp{1})).
  auto.
  move => &1 &2 Hpre result [Hres Hbnd].
  by rewrite /pos_bound256_cxq; smt().

(* Step 9: tomsg *)
ecall{1}(poly_tomsg_corr mp{1}).
by auto => /> /#.
qed.
