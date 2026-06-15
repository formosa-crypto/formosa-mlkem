require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel.
from JazzEC require import Array2304 Array1184 Array1152 Array1088 Array960 Array1410 Array768 Array400 Array384 Array256 Array160 Array128 Array64 Array33 Array32 Array16 Array4 Array8 Array2.
from JazzEC require import WArray64 WArray1184 WArray512 WArray128 WArray384 WArray33 WArray32 WArray16 WArray1410 WArray160 WArray960 WArray1152 WArray1536.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem_avx2.
require import MLKEM_PolyVec_avx2.
require import MLKEM_Poly_avx2.
require import NTT_avx2 NTT_avx2_poly.
require import MLKEM_W16_Rep.
require import MLKEM768_prelude.
require import Fq_avx2.
require import NTT_Fq.
require import AVX2_Ops MLKEMFCLib.
require import MLKEM_Poly_avx2.
require import MLKEM_PolyVec_avx2.
require import MLKEM_Poly_avx2.
require import MLKEM_PolyVec_avx2.
require import MLKEMFCLib.
import MLKEMFCLib768.
require import MLKEM_avx2_equivs.
require import MLKEM_keccak_avx2.
require import MLKEM_genmatrix_avx2.
require import MLKEM_getnoise_avx2.

from Spec require import EncDecCorrectness.
from Spec require import InnerPKE_Op.
import GFq Rq Symmetric Symmetric Serialization Serialization Sampling VecMat VecMat KPKE MLKEM Correctness.
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
import KPKE.
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
  have ->: 1%r = Pr[MLKEM_Poly_avx2.Mprevec.poly_add2(rp{m}, bp{m}) @ &m :
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
  have ->: 1%r = Pr[MLKEM_Poly_avx2.Mprevec.poly_sub(rp{m}, ap{m}, bp{m}) @ &m :
                signed_bound_cxq res 0 256 (ab + bb) /\
                forall k, 0 <= k < 256 => incoeff (to_sint res.[k]) = _a.[k] - _b.[k]].
  + by byphoare (MLKEM_PolyAVX.poly_sub_corr _a _b ab bb abbnd bbbnd) => //=; smt().
  byequiv => //. symmetry. proc*. call prevec_eq_poly_sub. auto.
qed.

lemma polyvec_add_corr_avx ab bb :
  0 <= ab <= 6 => 0 <= bb <= 3 =>
  forall _a _b,
  phoare [Jkem_avx2.M.__polyvec_add2 :
    _a = lift_array768 r /\ _b = lift_array768 b /\
    signed_bound768_cxq r 0 768 ab /\ signed_bound768_cxq b 0 768 bb
    ==>
    signed_bound768_cxq res 0 768 (ab + bb) /\
    forall k, 0 <= k < 768 =>
      incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r.
proof.
  move => abbnd bbbnd _a _b.
  bypr => &m Hpre.
  have ->: 1%r = Pr[MLKEM_PolyVec_avx2.Mprevec.polyvec_add2(r{m}, b{m}) @ &m :
                signed_bound768_cxq res 0 768 (ab + bb) /\
                forall k, 0 <= k < 768 => incoeff (to_sint res.[k]) = _a.[k] + _b.[k]].
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
  have ->: 1%r = Pr[MLKEM_Poly_avx2.Mprevec.poly_reduce(rp{m}) @ &m :
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
      map (fun x => SignedReductions_W16.SREDC (x * ((Ring.IntID.(^) SignedReductions_W16.R 2) %% q))) ap] = 1%r.
proof.
  bypr => &m Hpre.
  have ->: 1%r = Pr[MLKEM_Poly_avx2.Mprevec.poly_frommont(rp{m}) @ &m :
                map W16.to_sint res =
                  map (fun x => SignedReductions_W16.SREDC (x * ((Ring.IntID.(^) SignedReductions_W16.R 2) %% q))) ap].
  + by byphoare (MLKEM_PolyAVX.poly_frommont_corr ap) => //=; smt().
  byequiv => //. symmetry. proc*. call prevec_eq_poly_frommont. auto.
qed.

lemma polyvec_reduce_corr_avx _a :
  phoare [Jkem_avx2.M.__polyvec_reduce :
    _a = lift_array768 r
    ==>
    _a = lift_array768 res /\
    forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)] = 1%r.
proof.
  bypr => &m Hpre.
  have ->: 1%r = Pr[MLKEM_PolyVec_avx2.Mprevec.polyvec_reduce(r{m}) @ &m :
                _a = lift_array768 res /\
                forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)].
  + by byphoare (MLKEM_PolyvecAVX.polvec_reduce_corr _a) => //=; smt().
  byequiv => //. symmetry. proc*. call prevec_eq_polyvec_reduce. auto.
qed.

(********** AVX2 pointwise-acc phoare: inner-product / accadd  **************)
(* Mirrors ref's polyvec_pointwise_acc_corr_alg, but with nttunpackv/nttunpack
   threaded through (avx2 NTT lands on the permuted form). *)


(* Helper: when ahr's lift is the nttunpackv of aref's lift, then ahr's
   j-th 256-slice (as a chunk for the basemul call) equals the nttunpack
   of aref's j-th subarray (lifted). Used 6 times below — once per basemul
   call pre-condition (a and b sides, 3 calls). *)
lemma lift_subarray_nttunpackvE (aref ahr : W16.t Array768.t) (j : int) :
  0 <= j < 3 =>
  lift_array768 ahr = nttunpackv (lift_array768 aref) =>
  lift_array256 (Array256.init (fun (i : int) => ahr.[256*j + i])) =
    nttunpack (lift_array256 (subarray256 aref j)).
proof.
move => jb Hlift.
(* turn LHS into slice of lift_array768 ahr *)
have HkR : 0 <= 256*j <= 512 by smt().
rewrite (lift_array_256_768_k ahr (256*j) HkR) Hlift.
(* both sides depend on j; case-split *)
have ->: lift_array256 (subarray256 aref j) = subarray256 (lift_array768 aref) j.
+ rewrite /lift_array256 /lift_array768 /subarray256 /map tP => k kb.
  by rewrite !initiE //= initiE 1:/# /= initiE //= /#.
rewrite tP => i ib; rewrite initiE //= /nttunpack initiE //=.
have Hidxbnd : 0 <= nttunpack_idx.[i] < 256
  by smt(nttunpack_bnd Array256.allP mem_iota).
rewrite /subarray256 initiE //=.
have -> : (nttunpackv (lift_array768 aref)).[256 * j + i] =
          (nttunpack (subarray256 (lift_array768 aref) j)).[i].
+ rewrite /nttunpackv initiE 1:/#.
  have Hjr : j = 0 \/ j = 1 \/ j = 2 by smt().
  case Hjr => [-> | [-> | ->]] /=.
  - by rewrite ifT 1:/#.
  - by rewrite ifF 1:/# ifT 1:/#; congr; smt().
  - by rewrite ifF 1:/# ifF 1:/#; congr; smt().
by rewrite /nttunpack /subarray256 initiE //= initiE 1:/#.
qed.

(* avx2 port of ref's polyvec_pointwise_acc_corr_h. Parameterized over the
   three coefficient-array pairs and their pre-computed scaled basemuls;
   the algebraic close (dotpw expansion, nttZero) lives in _alg_avx below.
   Stated as phoare directly (= 1%r) since our basemul/add wrappers are
   already phoare — avoids writing hoare versions of those. *)
lemma polyvec_pointwise_acc_corr_avx_ph
  (a_ref b_ref : W16.t Array768.t)
  _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 (_r : coeff Array256.t) :
  _p0 = scale (basemul _a0 _b0) (incoeff 169) =>
  _p1 = scale (basemul _a1 _b1) (incoeff 169) =>
  _p2 = scale (basemul _a2 _b2) (incoeff 169) =>
  (forall k, 0 <= k < 256 => _r.[k] = _p0.[k] + _p1.[k] + _p2.[k]) =>
  phoare [Jkem_avx2.M.__polyvec_pointwise_acc :
    _a0 = lift_array256 (subarray256 a_ref 0) /\
    _a1 = lift_array256 (subarray256 a_ref 1) /\
    _a2 = lift_array256 (subarray256 a_ref 2) /\
    _b0 = lift_array256 (subarray256 b_ref 0) /\
    _b1 = lift_array256 (subarray256 b_ref 1) /\
    _b2 = lift_array256 (subarray256 b_ref 2) /\
    lift_array768 a = nttunpackv (lift_array768 a_ref) /\
    lift_array768 b = nttunpackv (lift_array768 b_ref) /\
    signed_bound768_cxq a 0 768 2 /\
    signed_bound768_cxq b 0 768 2
    ==>
    lift_array256 res = nttunpack _r /\
    signed_bound_cxq res 0 256 3] = 1%r.
proof.
move => _p0_def _p1_def _p2_def _r_def; proc.
unroll for 4.
have Hadd21 := poly_add_corr_avx 2 1 _ _ => //.
have Hadd11 := poly_add_corr_avx 1 1 _ _ => //.
wp; call (Hadd21 (nttunpack (_p0 &+ _p1)) (nttunpack _p2)).
wp; call (poly_basemul_avx2_ph _a2 _b2).
wp; call (Hadd11 (nttunpack _p0) (nttunpack _p1)).
wp; call (poly_basemul_avx2_ph _a1 _b1).
wp; call (poly_basemul_avx2_ph _a0 _b0).
auto.
move => &hr [_a0d [_a1d [_a2d [_b0d [_b1d [_b2d [Halift [Hblift [Habnd Hbbnd]]]]]]]]].
(* Reusable helpers across the 5 sub-call discharges. *)
have HboundA : forall k, 0 <= k <= 512 =>
    signed_bound_cxq (Array256.init (fun (i : int) => a{hr}.[k + i])) 0 256 2
  by move => k Hk i Hi; rewrite initiE //=; smt(Array256.initiE).
have HboundB : forall k, 0 <= k <= 512 =>
    signed_bound_cxq (Array256.init (fun (i : int) => b{hr}.[k + i])) 0 256 2
  by move => k Hk i Hi; rewrite initiE //=; smt(Array256.initiE).
have HUA0 := lift_subarray_nttunpackvE a_ref a{hr} 0 _ Halift; first by smt().
have HUA1 := lift_subarray_nttunpackvE a_ref a{hr} 1 _ Halift; first by smt().
have HUA2 := lift_subarray_nttunpackvE a_ref a{hr} 2 _ Halift; first by smt().
have HUB0 := lift_subarray_nttunpackvE b_ref b{hr} 0 _ Hblift; first by smt().
have HUB1 := lift_subarray_nttunpackvE b_ref b{hr} 1 _ Hblift; first by smt().
have HUB2 := lift_subarray_nttunpackvE b_ref b{hr} 2 _ Hblift; first by smt().
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

move => [#] Hva2 ? Hvb2 ? result2 [Hres2lift Hres2bnd].
do split;2..4:smt().
+ rewrite tP => k kb;rewrite /lift_array256 mapiE 1:/#.
   have := Hres1k k kb.
   pose a:= NTT_AVX_j.incoeffW16 result1.[k].
   rewrite -/a => ->.
   by rewrite /(&+) map2E /nttunpack !initiE //= initiE //=;1:smt(nttunpack_inbounds).
move => [#] ???? result3 [Hres3bnd Hres3k]; split; 2:smt().
+ rewrite tP => k kb;rewrite /lift_array256 mapiE 1:/#.
   have := Hres3k k kb.
   pose a:= NTT_AVX_j.incoeffW16 result3.[k].
   rewrite -/a => ->.
   rewrite /(&+) map2E /nttunpack !initiE //= initiE //=;1:smt(nttunpack_inbounds).
   by rewrite _r_def;1:smt(nttunpack_inbounds).
qed.

lemma polyvec_pointwise_acc_corr_alg_avx (va vb : PolyVec.polyvec) (a_ref b_ref : W16.t Array768.t) :
  phoare [Jkem_avx2.M.__polyvec_pointwise_acc :
    PolyVec.nttv va = lift_polyvec a_ref /\
    signed_bound768_cxq a_ref 0 768 2 /\
    PolyVec.nttv vb = lift_polyvec b_ref /\
    signed_bound768_cxq b_ref 0 768 2 /\
    lift_array768 a = nttunpackv (lift_array768 a_ref) /\
    lift_array768 b = nttunpackv (lift_array768 b_ref) /\
    signed_bound768_cxq a 0 768 2 /\
    signed_bound768_cxq b 0 768 2
    ==>
    signed_bound_cxq res 0 256 3 /\
    lift_array256 res = nttunpack (scale (ntt (dotpw va vb)) (incoeff 169))
  ] = 1%r.
proof.
pose A0 := (PolyVec.nttv va).[0]%PolyVec; pose A1 := (PolyVec.nttv va).[1]%PolyVec; pose A2 := (PolyVec.nttv va).[2]%PolyVec.
pose B0 := (PolyVec.nttv vb).[0]%PolyVec; pose B1 := (PolyVec.nttv vb).[1]%PolyVec; pose B2 := (PolyVec.nttv vb).[2]%PolyVec.
pose P0 := scale (basemul A0 B0) (incoeff 169).
pose P1 := scale (basemul A1 B1) (incoeff 169).
pose P2 := scale (basemul A2 B2) (incoeff 169).
pose R := P0 &+ P1 &+ P2.
have H := polyvec_pointwise_acc_corr_avx_ph a_ref b_ref
            A0 A1 A2 B0 B1 B2 P0 P1 P2 R _ _ _ _.
+ done.
+ done.
+ done.
+ by move => k kb; rewrite /R /(&+) /= map2E !initiE //= map2E !initiE //=.
conseq H.
move => &hr [Hva [Habnd [Hvb [Hbbnd [Halift [Hblift [Hab Hbb]]]]]]]; do split => //.
by rewrite /A0 Hva /lift_polyvec KVec.initiE; smt(kvec_val).
by rewrite /A1 Hva /lift_polyvec KVec.initiE; smt(kvec_val).
by rewrite /A2 Hva /lift_polyvec KVec.initiE; smt(kvec_val).
by rewrite /B0 Hvb /lift_polyvec KVec.initiE; smt(kvec_val).
by rewrite /B1 Hvb /lift_polyvec KVec.initiE; smt(kvec_val).
by rewrite /B2 Hvb /lift_polyvec KVec.initiE; smt(kvec_val).
move => &hr Hpre result; have ->: nttunpack (scale (ntt (dotpw va vb)) (incoeff 169)) = nttunpack R; last done.
congr; rewrite dotpwE mulvec kvec_val.
rewrite (Big.BAdd.big_int_recl 2) // (Big.BAdd.big_int_recl 1) // (Big.BAdd.big_int_recl 0) // Big.BAdd.big_geq //=.
rewrite !add_comm_ntt !nttK.
rewrite !poly2algE.
smt(kvec_val). smt(kvec_val). smt(kvec_val). smt(kvec_val). smt(kvec_val). smt(kvec_val).
rewrite /R /P0 /P1 /P2 /A0 /A1 /A2 /B0 /B1 /B2.
rewrite nttZero !nttvE.
smt(kvec_val). smt(kvec_val). smt(kvec_val). smt(kvec_val). smt(kvec_val). smt(kvec_val).
rewrite /scale /(&+) tP => k kb.
rewrite !mapiE //= !map2iE //= !mapiE //=.
rewrite /zero Array256.createiE 1:/#.
have ->: incoeff 0 = Zq.zero by done.
by ring.
qed.


(********** BRIDGE LEMMAS **************)
lemma lift_array768_nttunpackv_nttpackv (x : W16.t Array768.t) :
  nttunpackv (lift_array768 (nttpackv x)) = lift_array768 x.
proof. by rewrite -nttpackv_lift packvK. qed.

(* nttpackv distributes over pointwise add at the lift_polyvec level. *)
lemma lift_polyvec_nttpackv_add (X Y Z : W16.t Array768.t) :
  (forall k, 0 <= k < 768 =>
     (lift_array768 Z).[k] = (lift_array768 X).[k] + (lift_array768 Y).[k]) =>
  lift_polyvec (nttpackv Z) = (lift_polyvec (nttpackv X) + lift_polyvec (nttpackv Y)).
proof.
move => Hpw.
have kv := kvec_val.
apply KVec.tP => j Hj.
rewrite polyvec_addE; 1: smt(kvec_val).
rewrite /lift_polyvec !KVec.initiE; 1,2,3: smt(kvec_val).
simplify.
rewrite tP => k Hk.
rewrite /(&+) Array256.map2iE 1:/# /=.
rewrite /lift_array256 /subarray256 !mapiE //= !initiE //=.
have peel : forall (W : W16.t Array768.t),
            (nttpackv W).[256*j + k] = W.[256*j + nttpack_idx.[k]].
+ move => W; rewrite /nttpackv initiE 1:/# /= initiE 1:/# /=.
  have Hjr : j = 0 \/ j = 1 \/ j = 2 by smt(kvec_val).
  case Hjr => [-> | [-> | ->]] /=.
  - rewrite ifT 1:/# /nttpack initiE /=;1:smt(nttpack_bnd Array256.allP mem_iota).
    rewrite /subarray256 initiE /=; 1:smt(nttpack_bnd Array256.allP mem_iota).
  - by rewrite  initiE /=; 1:smt(nttpack_bnd Array256.allP mem_iota).
  - rewrite ifF 1:/# /nttpack initiE /=; 1:smt(nttpack_bnd Array256.allP mem_iota).
    rewrite /subarray256 initiE /=; 1:smt(nttpack_bnd Array256.allP mem_iota).
  - rewrite ifT 1:/# initiE /=;smt(nttpack_bnd Array256.allP mem_iota).
  - rewrite ifF 1:/# ifF 1:/# /nttpack initiE /=;1:smt().
    rewrite /subarray256 initiE /=; 1:smt(nttpack_bnd Array256.allP mem_iota).
  by rewrite  initiE /=; 1:smt(nttpack_bnd Array256.allP mem_iota).
rewrite !peel.
move: (Hpw (256*j + nttpack_idx.[k]) _); first smt(nttpack_bnd Array256.allP mem_iota).
rewrite /lift_array768 !mapiE /=; 1..3:smt(nttpack_bnd Array256.allP mem_iota).
smt().
qed.

lemma lift_array768_unlift_ofipolyvec (vi : int Array768.t) :
  all (fun i => 0 <= i < 32768) vi =>
  lift_array768 (unlift_polyvec (ofipolyvec vi)) = map incoeff vi.
proof.
rewrite allP => Hbnd.
rewrite /lift_array768 /unlift_polyvec /ofipolyvec tP => k kb.
rewrite !mapiE //= initiE 1://;beta.
rewrite !setvE;beta;rewrite !offunvK /vclamp; beta. 
rewrite offunvE 1:/# /kvec;beta. 
have Hkr : k = 256 * (k %/ 256) + k %% 256 by smt().
have Hkdiv : k %/ 256 = 0 \/ k %/ 256 = 1 \/ k %/ 256 = 2 by smt().
case Hkdiv => [H0 | [H0 | H0]]; rewrite H0.
+ rewrite ifF 1:/# ifT 1:/# ifF 1:/# ifT 1:/# ifT 1:/#.
  rewrite mapiE 1:/# /subarray256 initiE 1:/#;beta.
  rewrite of_sintK Montgomery16.smod_small.
  + have := as_sint_range (incoeff vi.[256 * 0 + k %% 256]); smt(qE).
    by rewrite as_sintK; have -> : 256 * 0 + k %% 256 = k by smt(). 
+ rewrite ifF 1:/# ifT 1:/# ifT 1:/#.
  rewrite mapiE 1:/# /subarray256 initiE 1:/#;beta.
  rewrite of_sintK Montgomery16.smod_small.
  + have := as_sint_range (incoeff vi.[256 * 1 + k %% 256]); smt(qE).
  by rewrite as_sintK; have -> : 256 * 1 + k %% 256 = k by move: Hkr; smt().
+ rewrite ifT 1:/#.
  rewrite mapiE 1:/# /subarray256 initiE 1:/#;beta.
  rewrite of_sintK Montgomery16.smod_small.
  + have := as_sint_range (incoeff vi.[256 * 2 + k %% 256]); smt(qE).
  by rewrite as_sintK; have -> : 256 * 2 + k %% 256 = k by move: Hkr; smt().
qed.

lemma ntt_dotp_invnttv (s u : PolyVec.polyvec) :
  ntt (dotpw (PolyVec.invnttv s) u) = ntt_dotp s (PolyVec.nttv u).
proof. by rewrite dotpwE comm_ntt_dotp nttK. qed.

(* Row extraction from unlift_matrix: the j-th poly of the i-th row of an
   unlifted matrix (viewed as a polyvec) is exactly the (i,j) coefficient
   block of the original polymat. Same coordinate computation as ref's
   `matrix_unlift` (proof/correctness/768/ref/MLKEM_InnerPKE.ec:35), but
   stated at the polyvec slot level so the kg proof can use it directly. *)
lemma lift_polyvec_subarray768_unlift_matrix (a : polymat) (i j : int) :
  0 <= i < 3 => 0 <= j < 3 =>
  (lift_polyvec (subarray768 (unlift_matrix a) i)).[j]%Vector = a.[i, j]%Matrix.
proof.
move => Hi Hj.
rewrite /lift_polyvec offunvE 1:/# /= /lift_array256 tP => k Hk.
rewrite /subarray256 /subarray768 mapiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
rewrite /unlift_matrix initiE 1:/# /=.
have ->: (768 * i + (256 * j + k)) %/ 768 = i by smt().
have ->: (768 * i + (256 * j + k)) %% 768 = 256 * j + k by smt().
have ->: (256 * j + k) %/ 256 = j by smt().
have ->: (768 * i + (256 * j + k)) %% 256 = k by smt().
rewrite /to_sint  /= modz_small; 1: by smt(rg_asint qE).
rewrite /smod /=.
have ->: (32768 <= asint a.[i, j]%Matrix.[k]) = false by smt(rg_asint qE).
by rewrite /= asintK.
qed.


(* Step 2a will eventually need a direct avx2 <-> Hmodule.sampleA equiv
   `gen_matrix_avx2_sampleA_equiv` -- *not* via MLKEM_genmatrix_avx2.ec,
   which drags ref-Jasmin through AuxMLKEM.  Frontier work:
     - copy the spec-clean parts of MLKEM_genmatrix_avx2's chain
       (sample_four_polynomials_eq + sample3buf phoares) into a new
       ref-free module, then re-prove _gen_matrix_avx2_sem against
       Hmodule.sampleA directly (skipping the AuxMLKEM transitivity). *)

lemma frommont_cancels_at_slot (rr0 rr1 : W16.t Array256.t) (X : poly) :
  signed_bound_cxq rr0 0 256 3 =>
  (forall (k : int), 0 <= k < 256 =>
     to_sint rr1.[k]
     = SignedReductions_W16.SREDC
         (to_sint rr0.[k] * (SignedReductions_W16.R ^ 2 %% q))) =>
  lift_array256 rr0 = nttunpack (scale X (incoeff 169)) =>
  lift_array256 rr1 = nttunpack X.
proof.
move => Hrr0v Hrr1k Hrr0b.
rewrite /lift_array256 tP => k Hk.
rewrite mapiE //=.
have ->: NTT_AVX_j.incoeffW16 rr1.[k] = incoeff (to_sint rr1.[k]) by done.
rewrite Hrr1k //.
have [? Hredv] :=
  SignedReductions_W16.SREDCp_corr
    (to_sint rr0.[k] * (SignedReductions_W16.R ^ 2 %% q)) _ _.
+ by rewrite /SignedReductions_W16.R; smt(qE).
+ have := Hrr0v k _; 1: smt().
  by rewrite /SignedReductions_W16.R; smt(qE @SignedReductions_W16).
have ->: incoeff
   (SignedReductions_W16.SREDC
      (to_sint rr0.[k] * (SignedReductions_W16.R ^ 2 %% q)))
       = incoeff
   (to_sint rr0.[k] * (SignedReductions_W16.R ^ 2 %% q) * 169)
  by rewrite -eq_incoeff; apply Hredv.
rewrite !incoeffM.
have Hresk : incoeff (to_sint rr0.[k])
           = (nttunpack (scale X (incoeff 169))).[k].
+ by move: Hrr0b; rewrite /lift_array256 tP => /(_ k _) //; rewrite mapiE //= => ->.
rewrite Hresk.
rewrite /nttunpack initiE //= /scale mapiE //=;
  1: smt(nttunpack_bnd Array256.allP mem_iota).
have ->: incoeff (SignedReductions_W16.R ^ 2 %% q)
       = incoeff SignedReductions_W16.R * incoeff SignedReductions_W16.R.
+ rewrite -incoeffM -eq_incoeff modz_mod.
  have ->: SignedReductions_W16.R ^ 2
         = SignedReductions_W16.R * SignedReductions_W16.R by ring.
  done.
have ->: X.[nttunpack_idx.[k]] * incoeff 169
        * (incoeff SignedReductions_W16.R * incoeff SignedReductions_W16.R)
        * incoeff 169
       = X.[nttunpack_idx.[k]]
        * (incoeff SignedReductions_W16.R * incoeff 169)
        * (incoeff SignedReductions_W16.R * incoeff 169) by ring.
rewrite rrinvcoeff !ZqField.mulr1.
smt(Array256.initiE). 
qed.

lemma subarray256_double_init_fallthrough
  (pkpv : W16.t Array768.t) (rr0 rr1 : W16.t Array256.t) (i j : int) :
  0 <= j < i => 0 <= i < 3 =>
  subarray256
    (Array768.init (fun (i_0 : int) =>
       if i * 256 <= i_0 < i * 256 + 256 then rr1.[i_0 - i * 256]
       else (Array768.init (fun (i_0_0 : int) =>
              if i * 256 <= i_0_0 < i * 256 + 256
              then rr0.[i_0_0 - i * 256] else pkpv.[i_0_0])).[i_0])) j
  = subarray256 pkpv j.
proof.
move => Hji Hi.
rewrite /subarray256; apply Array256.tP => k Hk.
by rewrite initiE //= initiE //= initiE 1:/# /= ifF 1:/# initiE 1:/# /= /= ifF 1:/#.
qed.

lemma kg_loop_post_to_target (pkpv : W16.t Array768.t) (mm : PolyVec.polyvec) :
  (forall (j : int), 0 <= j < 3 =>
     lift_array256 (subarray256 pkpv j) = nttunpack mm.[j]%PolyVec) =>
  lift_polyvec (nttpackv pkpv) = mm.
proof.
move => Hslots.
rewrite eq_vectorP => j jb.
have := Hslots j; rewrite jb /= getvE => Hslotsj.
rewrite -(nttunpackK (mm.[j])%Vector).
rewrite -Hslotsj.
rewrite /lift_polyvec offunvE 1:/# /=.
have lift_subarrayE : forall (X : W16.t Array768.t) (jj : int),
  0 <= jj < 3 =>
  lift_array256 (subarray256 X jj) = subarray256 (lift_array768 X) jj.
+ move => X jj jjb.
  rewrite /lift_array256 /lift_array768 /subarray256 /map tP => k kb.
  by rewrite !initiE //= initiE 1:/# /= initiE //= /#.
rewrite !(lift_subarrayE _ _ _) 1..2:/# -nttpackv_lift.
rewrite /subarray256 /nttpackv tP => k Hk.
rewrite initiE 1:/# /= initiE 1:/# /=.
case (j = 0) => Hj0; 1: by rewrite Hj0 /= ifT 1:/#.
case (j = 1) => Hj1.
+ rewrite ifF 1:/# ifT 1:/#; congr; 2: smt().
  congr; rewrite tP => kk kkb.
  rewrite initiE 1:/# /= initiE /#.
have ->: j = 2 by smt().
rewrite ifF 1:/# ifF 1:/#; congr; 2: smt().
congr; rewrite tP => kk kkb.
rewrite initiE 1:/# /= initiE /#.
qed.

lemma nttpackv_subarray768_nttunpackm (M : 'a Array2304.t) (i : int) :
  0 <= i < 3 =>
  nttpackv (subarray768 (nttunpackm M) i) = subarray768 M i.
proof.
move => Hi.
rewrite -(unpackvK (subarray768 M i)); congr.
apply Array768.tP => kk Hkk.
rewrite /subarray768 !initiE 1,2:/# /=.
rewrite /nttunpackm initiE 1:/# /=.
have Hjk : 0 <= 768 * i + kk < 2304 by smt().
case (i = 0) => Hi0.
+ rewrite Hi0 /= ifT 1:/#.
  rewrite /nttunpackv initiE 1:/# /=.
  case (0 <= kk < 256) => ?.
  + congr; rewrite /subarray256 /subarray768 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  case (256 <= kk < 512) => ?.
  + congr; rewrite /subarray256 /subarray768 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  + congr; rewrite /subarray256 /subarray768 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
case (i = 1) => Hi1.
+ rewrite Hi1 /= ifF 1:/# ifT 1:/#.
  rewrite /nttunpackv initiE 1:/# /=.
  case (0 <= kk < 256) => ?.
  + congr; rewrite /subarray256 /subarray768 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  case (256 <= kk < 512) => ?.
  + congr; rewrite /subarray256 /subarray768 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  + congr; rewrite /subarray256 /subarray768 tP => kk2 Hkk2.
    congr; congr; rewrite tP => ii iib.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
have Hi2 : i = 2 by smt().
rewrite Hi2 /= ifF 1:/# ifF 1:/#.
rewrite /nttunpackv initiE 1:/# /=.
case (0 <= kk < 256) => ?.
+ congr; rewrite /subarray256 /subarray768 tP => kk2 Hkk2.
  congr; congr; rewrite tP => ii iib.
  rewrite initiE 1:/# /= initiE 1:/# /= /#.
case (256 <= kk < 512) => ?.
+ congr; rewrite /subarray256 /subarray768 tP => kk2 Hkk2.
  congr; congr; rewrite tP => ii iib.
  rewrite initiE 1:/# /= initiE 1:/# /= /#.
+ congr; rewrite /subarray256 /subarray768 tP => kk2 Hkk2.
  congr; congr; rewrite tP => ii iib.
  rewrite initiE 1:/# /= initiE 1:/# /= /#.
qed.

lemma ntt_dotp_row_eq_ntt_mmul (a : polymat) (sv : W16.t Array768.t) (i : int) :
  0 <= i < 3 =>
  ntt (dotpw (PolyVec.invnttv (lift_polyvec
              (nttpackv (subarray768 (nttunpackm (unlift_matrix a)) i))))
            (PolyVec.invnttv (lift_polyvec (nttpackv sv))))
  = (ntt_mmul a (lift_polyvec (nttpackv sv))).[i]%PolyVec.
proof.
move => Hi.
rewrite ntt_dotp_invnttv nttvK.
rewrite (nttpackv_subarray768_nttunpackm (unlift_matrix a) i _) //=.
rewrite /ntt_dotp !getvE !(lift_polyvec_subarray768_unlift_matrix a i _ _) //=.
case (i = 0) => Hi0.
+ by rewrite Hi0 /= !offunvE //= /ntt_mmul !setvE !offunvE //= offunvK /vclamp ifT 1:/# /= offunvK /vclamp ifT 1:/# /= !getvE /= !getmE /lift_polyvec !offunvE //=.
case (i = 1) => Hi1.
+ by rewrite Hi1 /= !offunvE //= /ntt_mmul !setvE !offunvE //= offunvK /vclamp ifT 1:/# /= !getvE /= !getmE /lift_polyvec !offunvE //=.
have -> : (i = 2) by smt().
by rewrite !offunvE //= /ntt_mmul !setvE !offunvE //= !getvE /= !getmE /lift_polyvec !offunvE //=.
qed.

lemma poly_add2_avx_ll : islossless Jkem_avx2.M._poly_add2.
proof. proc; while (true) (16 - i); auto; smt(). qed.

lemma poly_basemul_avx_ll : islossless Jkem_avx2.M._poly_basemul.
proof. proc; islossless. qed.

lemma polyvec_pointwise_acc_avx_ll :
  islossless Jkem_avx2.M.__polyvec_pointwise_acc.
proof.
proc; while (true) (3 - i).
+ move => z; wp; call poly_add2_avx_ll; call poly_basemul_avx_ll; auto; smt().
wp; call poly_basemul_avx_ll; auto; smt().
qed.

lemma mlkem_correct_enc_avx2_op _pkp :
  equiv [Jkem_avx2.M.__indcpa_enc ~ InnerPKE_Op.enc_derand :
    msgp{1} = m{2} /\ pk{1} = _pkp /\
    noiseseed{1} = r{2} /\
    pk{2}.`1 = Array1152.init (fun i => pk{1}.[i]) /\
    pk{2}.`2 = Array32.init (fun i => pk{1}.[i+1152])
    ==>
    let (c1,c2) = res{2} in
    c1 = Array960.init (fun i => res{1}.[i]) /\
    c2 = Array128.init (fun i => res{1}.[i+960])].
proof.
proc => /=.

(* === Step 1: pkpv decode + publicseed extraction + message decompress.
     LHS: 9 witnesses + pkpv frombytes + inc + w + publicseed-while + k frommsg
          = 14 stmts.
     RHS: 5 witnesses + prg_enc_inner + pk-unpack + decode12_vec + ofipolyvec
          = 9 stmts.
     Analogous to:
       - dec Step 3 (polyvec_frombytes_corr → pkpv lands on nttunpackv form);
       - kg Step 1b-1c (publicseed extraction loop);
       - new: poly_frommsg_corr for k.
     === *)
seq 14 9 : (#pre /\
            publicseed{1} = rho{2} /\
            lift_array768 pkpv{1} = nttunpackv (map incoeff (decode12_vec pk{2}.`1)) /\
            pos_bound768_cxq pkpv{1} 0 768 2 /\
            that{2} = ofipolyvec (decode12_vec pk{2}.`1) /\
            lift_array256 k{1} = decompress_poly 1 (decode1 m{2}) /\
            pos_bound256_cxq k{1} 0 256 1 /\
            (rv{2}, e1{2}, e2{2}) = prg_enc_inner r{2}).
       seq 9 5 : #pre; 1: by auto.
       wp; ecall {1} (poly_frommsg_corr msgp{1}).
       wp; while {1} (0 <= w{1} <= 4 /\ inc{1} = 4 /\ pk{1} = _pkp /\
                      (forall k, 0 <= k < w{1}*8 => publicseed{1}.[k] = pk{1}.[1152+k]))
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
       wp; ecall {1} (polyvec_frombytes_corr (Array1152.init (fun i => pk{1}.[i]))).
       auto => /> &1 &2 Hpk1 Hpk2 result Hlift Hbnd.
       split; 1: smt().
       move => publicseed_L w_L; split; 1: smt().
       move => Hncond Hwl Hwh Hcov result0 Hlift0 Hbnd0.
       split; last by rewrite Hpk1.
       apply Array32.tP => k Hk.
       rewrite Hpk2 initiE 1:/# /=; smt().

(* === Step 2: matrix gen, transposed.
     LHS: transposed <- 1; aat <@ _gen_matrix_avx2  = 2 stmts.
     RHS: aT <- nttm (trmx (H rho))                 = 1 stmt.
     Analogous to kg Step 2 (line 718) but with `_gen_matrix_avx2_sem rho true`,
     which yields `nttunpackm (unlift_matrix (trmx (sampleA rho)))`. *)
seq 2 1 : (#pre /\
           aat{1} = nttunpackm (unlift_matrix aT{2}) /\
           aT{2} = trmx (sampleA rho{2}) /\
           pos_bound2304_cxq aat{1} 0 2304 2).
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
       + rewrite /pos_bound2304_cxq /nttunpackm => k kb.
         rewrite initiE 1:/# /=.
         case (0 <= k < 768) => kbb.
         + have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
             (nttunpackv (subarray768 (unlift_matrix (trmx (sampleA rho{2}))) 0)));
                 last by smt(Array768.allP).
           rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE 1:/# /=.
           move : (matrix_unlift (trmx (sampleA rho{2}))); smt().
         case (768 <= k < 1536) => kbb'.
          + have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
             (nttunpackv (subarray768 (unlift_matrix (trmx (sampleA rho{2}))) 1)));
                last by smt(Array768.allP).
             rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE 1:/# /=.
             move : (matrix_unlift (trmx (sampleA rho{2}))); smt().
         have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
           (nttunpackv (subarray768 (unlift_matrix (trmx (sampleA rho{2}))) 2)));
               last by smt(Array768.allP).
         rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE 1:/# /=.
         move : (matrix_unlift (trmx (sampleA rho{2}))); smt().


(* === Step 3: first getnoise_4x call.  Samples (nonce 0,1,2,3) →
     sp_0 slots 0,1,2 (rv side) + ep slot 0 (e1 first poly).
     LHS: nonce<-0; getnoise; 4 slot inits = 6 stmts.  RHS: 0 stmts.
     Analogous to kg Step 3a (line 748). *)
seq 6 0 : (#pre /\
           (forall i, 0 <= i < 3 =>
              lift_array256 (Array256.init (fun k => sp_0{1}.[256*i + k])) =
                cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int i))) /\
           lift_array256 (Array256.init (fun k => ep{1}.[k])) =
             cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int 3)) /\
           signed_bound768_cxq sp_0{1} 0 768 1 /\
           signed_bound768_cxq ep{1} 0 256 1).
+  (* WIP Step 3.
     Proposed: copy kg Step 3a tactic verbatim (lines 750-776), with
     `noiseseed{1}` and `(W8.of_int 0)`.  Replace `skpv` → `sp_0`,
     `e` → `ep` in the slot-init bookkeeping. *)
  sp 1 0.
  wp.
  ecall {1} (jkem_getnoise_4x_ph noiseseed{1} (W8.of_int 0)).
  auto => /> &1 &2 Hpk1 Hpk2 Hpk3 Hpk4 Hk1 Hk2 _ result Hr1 Hr2 Hr3 Hr4 Hb1 Hb2 Hb3 Hb4.
  do split.
  + move => i ibl ibh; rewrite /PRF /lift_array256 tP => k Hk.
    rewrite mapiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=  initiE 1:/# /=.
    case (i = 0) => Hi0.
    + rewrite ifF 1:/# ifF 1:/# Hi0 -Hr1 /lift_array256 mapiE 1:/# /#.
    case (i = 1) => Hi1.
    + rewrite ifF 1:/# ifT 1:/# Hi1 -Hr2 /lift_array256 mapiE 1:/# /#.
    have Hi2 :  (i = 2) by smt().
    + rewrite ifT 1:/#  Hi2 -Hr3 /lift_array256 mapiE 1:/# /#.
  + rewrite tP => k kb; rewrite -Hr4 /lift_array256 !mapiE 1,2:/# /= initiE 1:/# /= initiE 1:/# /= kb /= /#.
  + move => kk kkb.
    rewrite  initiE 1:/# /= initiE 1:/# /=.
    case (0<=kk<256) => Hkk;1: by rewrite ifF 1:/# ifF 1:/# initiE /=; smt(qE).
    case (256<=kk<512) => Hkk1;1: by rewrite ifF 1:/#; smt(qE).
    rewrite ifT 1:/# /#.
  + move => kk kkb.
    rewrite  initiE 1:/# /=.
    case (0<=kk<256) => Hkk;1: by  smt(qE).
    by  smt(qE).

(* === Step 4: second getnoise_4x call.  Samples (nonce 4,5,6,7) →
     ep slots 1,2 (e1 last two) + epp (e2) + bp slot 0 (UNUSED — overwritten
     by mmul loop below).  Establish full sp_0 ↔ rv, ep ↔ e1, epp ↔ e2.
     LHS: nonce<-4; getnoise; 4 slot inits = 6 stmts.  RHS: 0 stmts.
     Analogous to kg Step 3b (line 785). *)
seq 6 0 : (#{/~forall i, 0 <= i < 3 =>
                lift_array256 (Array256.init (fun k => sp_0{1}.[256*i + k])) =
                  cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int i))}
            {/~lift_array256 (Array256.init (fun k => ep{1}.[k])) =
                cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int 3))}
            {/~signed_bound768_cxq sp_0{1} 0 768 1}
            {/~signed_bound768_cxq ep{1} 0 256 1}pre /\
           lift_polyvec sp_0{1} = rv{2} /\
           lift_polyvec ep{1} = e1{2} /\
           lift_array256 epp{1} = e2{2} /\
           signed_bound768_cxq sp_0{1} 0 768 1 /\
           signed_bound768_cxq ep{1} 0 768 1 /\
           signed_bound_cxq epp{1} 0 256 1).
+  (* WIP Step 4.
     Proposed: copy kg Step 3b tactic verbatim (lines 787-820), with
     `(W8.of_int 4)` and the bookkeeping `aux→ep[256..]`, `aux_0→ep[512..]`,
     `aux_1→epp`, `aux_2→bp[0..256]` (last one unused, just provide bound).
     The `lift_polyvec sp_0 = rv` step unfolds `prg_enc_inner.`1` via
     `eq_vectorP` + `offunvE` + `getv_setvE`, identical pattern to kg's
     `lift_polyvec skpv = (prg_kg_inner coins).`2`. *)
  sp 1 0.
  wp.
  ecall {1} (jkem_getnoise_4x_ph noiseseed{1} (W8.of_int 4)).
  auto => /> &1 &2 ???????Hsp He?? result Hr1 Hr2 Hr3 Hr4 Hb1 Hb2 Hb3 Hb4.
  do split.
  + rewrite eq_vectorP => kk kkb.
    by rewrite offunvE 1:/# /= Hsp 1:/# offunvE 1:/# /=.
  + rewrite eq_vectorP => i0 i0b.
    rewrite /PRF offunvE 1:/# /= offunvE 1:/# /=.
    case (i0 = 0) => Ci0.
    + rewrite Ci0 /kvec /= -He /lift_array256 tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifF /#.
    case (i0 = 1) => Ci1.
    + rewrite Ci1 /kvec /= -Hr1 /lift_array256 tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifT /#.
    have ->: i0 = 2 by smt().
    rewrite /kvec /= -Hr2 /lift_array256 tP => k Hk.
    rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= ifT /#.
  + (* signed_bound768_cxq skpv 0 768 1 from Hb1, Hb2, Hb3 *)
    move => k Hk1.
    rewrite initiE 1:/# /=.
    case (512 <= k < 768) => Ck; first by smt().
    rewrite initiE 1:/# /=.
    case (256 <= k < 512) => Ck'; first by smt().
    by smt().
  + (* signed_bound768_cxq e 0 256 1 from Hb4 *)
    move => k Hk1;smt() .
    

(* === Step 5: NTT(sp_0).
     LHS: 1 stmt (sp_0 <@ __polyvec_ntt(sp_0)).  RHS: 0 stmts (rhat = nttv rv
     is handled implicitly by the post: nttv rv = lift_polyvec (nttpackv sp_0)).
     Analogous to dec Step 4 (line 1120). *)
seq 1 0 : (#{/~lift_polyvec sp_0{1} = rv{2}}
            {/~signed_bound768_cxq sp_0{1} 0 768 1}pre /\
           PolyVec.nttv rv{2} = lift_polyvec (nttpackv sp_0{1}) /\
           pos_bound768_cxq sp_0{1} 0 768 2).
   ecall{1}(polyvec_ntt_avx2_corr sp_0{1}).
   auto => |> &1 &2 *;split;1,2:smt().

(* === Step 6: mmul while loop — bp gets ntt_mmul aT sp_0 slot-by-slot.
     LHS: w<-0; while (w<3) {pointwise_acc; bp slot update; w++}  = 2 stmts.
     RHS: 0 stmts.
     Mirror kg's Mmul while (line ~933 of kg) WITHOUT the inner
     `poly_frommont` (the Montgomery factor cancels via invNTT in Step 8). *)
seq 2 0 : (#pre /\
           (forall j, 0 <= j < 3 =>
              lift_array256 (subarray256 bp{1} j) =
                nttunpack (scale (ntt_mmul aT{2}
                                   (lift_polyvec (nttpackv sp_0{1}))).[j]%Vector
                                  (incoeff 169))) /\
           signed_bound768_cxq bp{1} 0 768 3).
+      while {1} (
         0 <= w{1} <= 3 /\
         publicseed{1} = rho{2} /\
         aat{1} = nttunpackm (unlift_matrix aT{2}) /\
         aT{2} = trmx (sampleA rho{2}) /\
         pos_bound2304_cxq aat{1} 0 2304 2 /\
         PolyVec.nttv rv{2} = lift_polyvec (nttpackv sp_0{1}) /\
         pos_bound768_cxq sp_0{1} 0 768 2 /\
         (forall j, 0 <= j < w{1} =>
            lift_array256 (subarray256 bp{1} j) =
              nttunpack (scale (ntt_mmul aT{2}
                                 (lift_polyvec (nttpackv sp_0{1}))).[j]%Vector
                                (incoeff 169))) /\
         (forall j, 0 <= j < 3 =>
            signed_bound768_cxq (nttpackv (subarray768 aat{1} j)) 0 768 2) /\
         signed_bound768_cxq bp{1} 0 (w{1} * 256) 3
       ) (3 - w{1}).
       + move => &m z.
         wp; ecall (polyvec_pointwise_acc_corr_alg_avx
           (PolyVec.invnttv (lift_polyvec (nttpackv (subarray768 aat w))))
           (PolyVec.invnttv (lift_polyvec (nttpackv sp_0)))
           (nttpackv (subarray768 aat w))
           (nttpackv sp_0)).
         auto => |> &hr ?????Hbpv ? Hbpb?;do split.
         + by rewrite nttvK.
         + smt().
         + by rewrite nttvK.
         + have : all (fun (c : W16.t) => b16 c (2 * q)) (nttpackv sp_0{hr});
             last by rewrite allP => *; smt().
           rewrite nttpackv_pred allP /= => k Hk; smt().
         + rewrite -nttpackv_lift packvK; rewrite /subarray768.
           apply Array768.tP => i Hi.
           rewrite /lift_array768 !mapiE 1,2:/# !initiE 1,2:/# /=; congr.
           have ->: 768 * w{hr} = w{hr} * 768 by ring.
           by ring.
         + by rewrite -nttpackv_lift packvK.
         + rewrite /signed_bound768_cxq => k Hk; rewrite initiE 1:/# /=; smt().
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
          + rewrite /signed_bound768_cxq => j jb; rewrite initiE 1:/# /=.
             case (j < w{hr}*256) => Hj.
             + rewrite ifF 1:/#.
               have :=  Hbpb j _;smt().
             rewrite ifT 1:/#.
             have := Hrb; rewrite  /signed_bound_cxq /#.

       auto => |> &1 &2  ????????? H H0 H1.
       do split; 1,3..: smt().
       move => j Hjl Hjh.
       rewrite nttpackv_subarray768_nttunpackm 1:/#.
       rewrite /signed_bound768_cxq => k Hk; rewrite /subarray768 initiE 1:/# /=.
       have := matrix_unlift (trmx (sampleA rho{2})).
       rewrite /pos_bound2304_cxq /bpos16 /b16; smt().

(* === Step 7: pointwise_acc for v = pkpv · sp_0.
     LHS: 1 stmt (v <@ __polyvec_pointwise_acc(v, pkpv, sp_0)).  RHS: 0 stmts.
     Mirror dec Step 5 (line 1129). *)
seq 1 0 : (#pre /\
           lift_array256 v{1} =
             nttunpack (scale (ntt_dotp that{2} (PolyVec.nttv rv{2}))
                              (incoeff 169)) /\
           signed_bound_cxq v{1} 0 256 3).
+ ecall{1}(polyvec_pointwise_acc_corr_alg_avx (PolyVec.invnttv that{2}) rv{2}
            (unlift_polyvec that{2}) (nttpackv sp_0{1})).
  auto => |> &1 &2 ?? Hpkpv Hthat Hpkb Hrv Hspb Hpqeq ???H0??.
  (* Hpre carries (among others):
       Hpkpv : lift_array768 pkpv{1} = nttunpackv (map incoeff (decode12_vec pk{2}.`1))
       Hthat : that{2} = ofipolyvec (decode12_vec pk{2}.`1)
       Hpkb  : pos_bound768_cxq pkpv{1} 0 768 2
       Hrv   : PolyVec.nttv rv{2} = lift_polyvec (nttpackv sp_0{1})
       Hspb  : pos_bound768_cxq sp_0{1} 0 768 2
       Hpkeq : pk{2}.`1 = Array1152.init (fun i => pk{1}.[i])
     Extract them explicitly when filling the destructure pattern. *)
  split.
  + do split.
    + smt(nttvK vector_unlift).
    + have [_ ] := vector_unlift (ofipolyvec (decode12_vec pk{2}.`1)). 
      rewrite /signed_bound768_cxq /#.
    + have : all (fun (c : W16.t) => b16 c (2 * q)) (nttpackv sp_0{1});
        last by rewrite allP => *; smt().  
      rewrite nttpackv_pred  allP /= => k Hk.
      have := H0; rewrite  /pos_bound768_cxq /#.
    + (* lift_array768 pkpv = nttunpackv (...) = nttunpackv (lift_array768 (unlift_polyvec that)) *)
      rewrite Hpkpv; congr; rewrite lift_array768_unlift_ofipolyvec.
      + rewrite allP => k kb /=.
        have := decode12_vec_bnd pk{2}.`1 k _; smt().
      by smt().
    + by rewrite lift_array768_nttunpackv_nttpackv.
    + move: Hthat; rewrite /pos_bound768_cxq /signed_bound768_cxq /bpos16 /b16 /#.
    + move: H0; rewrite /pos_bound768_cxq /signed_bound768_cxq /bpos16 /b16 /#.
  move => ??????? result Hb Hr.
  by rewrite Hr; rewrite ntt_dotp_invnttv.

(* === Step 8: invNTT bp.  Each slot becomes invntt of the ntt-domain value.
     The Montgomery factor (incoeff 169) cancels with invNTT's R² scaling.
     LHS: 1 stmt.  RHS: 0 stmts.
     Per-slot mirror of dec Step 6 (lines 1163-1175). *)
seq 1 0 : (#{/~forall j, 0 <= j < 3 =>
                lift_array256 (subarray256 bp{1} j) =
                  nttunpack (scale (ntt_mmul aT{2}
                                     (lift_polyvec (nttpackv sp_0{1}))).[j]%Vector
                                    (incoeff 169))}
            {/~signed_bound768_cxq bp{1} 0 768 3}pre /\
           (forall j, 0 <= j < 3 =>
              lift_array256 (subarray256 bp{1} j) =
                (invntt (ntt_mmul aT{2}
                          (lift_polyvec (nttpackv sp_0{1}))).[j]%Vector)) /\
           signed_bound768_cxq bp{1} 0 768 1).
+ ecall{1} (polyvec_invntt_avx2_corr (nttpackv bp{1})).
  auto => |> &1 &2 ???????????? Hslots Hbnd ??.
  split.
  + split; first by rewrite nttpackv_lift.
    by move: Hbnd; rewrite /signed_bound768_cxq /b16; smt(qE).
  move => ?? result Hres Hresbnd.
  move => j Hjbl Hjbh.
  (* (1) Project Hres to slot j — gives  lift_array256(subarray256 result j) 
       = scale (invntt (lift_polyvec (nttpackv bp{1})).[j]%Vector) (incoeff 65536) *)
  have HrsJ : lift_array256 (subarray256 result j) =
            scale (invntt (lift_polyvec (nttpackv bp{1})).[j]%Vector) (incoeff 65536).
  + have <- : (lift_polyvec result).[j]%Vector = lift_array256 (subarray256 result j)
       by rewrite /lift_polyvec offunvE 1:/# //.
    rewrite -Hres /scale mapvE /= offunvE 1:/# //=;congr;1:smt().
    rewrite /invnttv mapvE !offunvE 1:/# //= offunvK /vclamp ifT 1:/#.
    by rewrite /lift_polyvec offunvK /vclamp ifT 1:/#.

(* (2) Use kg_loop_post_to_target on bp{1} to lift the per-row invariant up to a
       polyvec equality, then take .[j] to get
       (lift_polyvec (nttpackv bp{1})).[j] = scale (mmul.[j]) (incoeff 169). *)
pose mm := offunv (fun jj =>
  scale (ntt_mmul (trmx (sampleA rho{2})) (lift_polyvec (nttpackv sp_0{1}))).[jj]%Vector (incoeff 169)).
have Hbp_polyvec : lift_polyvec (nttpackv bp{1}) = mm.
+ apply kg_loop_post_to_target => jj jjb.
  by rewrite /mm getvE offunvE 1:/# //= Hslots 1:/#.
  
(* (3) Chain. Substitute Hbp_polyvec into HrsJ, then algebra. *)
rewrite HrsJ Hbp_polyvec /mm offunvE 1:/# //=.
rewrite invntt_scale.
rewrite /scale /mul1x256 tP => k Hk.
rewrite !mapiE //=.
pose x := invntt _.
rewrite -ComRing.mulrA -(ComRing.mulrC _ (incoeff 169)).
have ->: incoeff 65536 * incoeff 169 = Zq.one.
+ by rewrite -rrinvcoeff.
by ring.

(* === Step 9: invNTT v.  Same shape as dec Step 6 verbatim.
     LHS: 1 stmt.  RHS: 0 stmts. *)
seq 1 0 : (#{/~lift_array256 v{1} =
                nttunpack (scale (ntt_dotp that{2} (PolyVec.nttv rv{2}))
                                 (incoeff 169))}
            {/~signed_bound_cxq v{1} 0 256 3}pre /\
           lift_array256 v{1} =
             invntt (ntt_dotp that{2} (PolyVec.nttv rv{2})) /\
           signed_bound_cxq v{1} 0 256 1).
+ ecall{1}(poly_invntt_avx2_corr (nttpack v{1})).
  auto => |> &1 &2 ?? Hpkv Hpkb Hkv Hkb; rewrite /prg_enc_inner => [#] Hrv Hep Hepp Hmb Hepb Heppb Hrvv Hspb Hvv Hvb Hmk Hbpb.
  split. move : Hvb; rewrite /signed_bound_cxq;  smt(qE).
  move => ? result Hresv Hresb. 
  rewrite -Hresv lift_nttpack Hrvv Hvv nttunpackK invntt_scale.
  rewrite /scale /mul1x256 tP => k kb.
  rewrite !mapiE //=.
  rewrite ZqField.mulrCA.
  have ->: incoeff 65536 * incoeff 169 = Zq.one by rewrite -rrinvcoeff.
  by rewrite ComRing.mulrC ComRing.mul1r;do congr.

(* === Step 10: bp += ep.  Spec-side u = invnttv (ntt_mmul aT rhat) + e1.
     LHS: 1 stmt (bp <@ __polyvec_add2(bp, ep)).  RHS: 0 stmts. *)
seq 1 0 : (#{/~forall j, 0 <= j < 3 =>
                lift_array256 (subarray256 bp{1} j) =
                  (invntt (ntt_mmul aT{2}
                            (lift_polyvec (nttpackv sp_0{1}))).[j])%Vector}
            {/~signed_bound768_cxq bp{1} 0 768 1}pre /\
           lift_polyvec bp{1} =
             (PolyVec.invnttv (ntt_mmul aT{2}
                                (lift_polyvec (nttpackv sp_0{1}))) + e1{2})%PolyVec /\
           signed_bound768_cxq bp{1} 0 768 2).
+ have H := polyvec_add_corr_avx 1 1 _ _ => //.
  ecall{1} (H (lift_array768 bp{1}) (lift_array768 ep{1})).
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


(* === Step 11: v += epp.  Spec-side v = ... &+ e2.
     LHS: 1 stmt.  RHS: 0 stmts. *)
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

(* === Step 12: v += k.  Spec-side v = ... &+ e2 &+ decompress_poly 1 mp.
     LHS: 1 stmt.  RHS: 0 stmts. *)
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

(* === Step 13: bp reduce.  Establishes pos_bound768_cxq bp 0 768 2.
     LHS: 1 stmt.  RHS: 0 stmts. *)
seq 1 0 : (#{/~signed_bound768_cxq bp{1} 0 768 2}pre /\
           pos_bound768_cxq bp{1} 0 768 2).
+ ecall{1} (polyvec_reduce_corr_avx (lift_array768 bp{1})).
  auto => |>  &1 &2 ?? Hpkv Hpkb Hkv Hkb ; rewrite /prg_enc_inner => [#] Hrv Hep Hepp Hmb Hepb Heppb Hrvv Hspb Hbpv Hbpb Hvv Hvb result Hresbnd Hresk.
  rewrite /lift_polyvec eq_vectorP => i ib.
  rewrite offunvE //= tP => k kb.
  have := Hbpv; rewrite eq_vectorP => Hbpk.
  have := Hbpk i ib; rewrite  offunvE 1:/# /= tP => <-;1:smt().
  by rewrite !subliftsub 1..4:/# -Hresbnd mapiE 1:/# /=.

(* === Step 14: v reduce.
     LHS: 1 stmt.  RHS: 0 stmts. *)
seq 1 0 : (#{/~signed_bound_cxq v{1} 0 256 3}pre /\
           pos_bound256_cxq v{1} 0 256 2).
+ ecall{1} (poly_reduce_corr_avx (lift_array256 v{1})).
  auto =>  |> &1 &2 ?? Hpkv Hpkb Hkv Hkb ; rewrite /prg_enc_inner => [#] Hrv Hep Hepp Hmb Hepb Heppb Hrvv Hspb Hbpv Hbpb Hvv Hvb result Hresbnd Hresk.
    rewrite  tP => k kb.
  have := Hbpv; rewrite eq_vectorP => Hbpk.
  rewrite -Hresbnd mapiE 1:/# /=.
  by rewrite -Hbpb; rewrite  mapiE 1:/# /=.

(* === Steps 15+16: compress bp into ct[0..960) and v into ct[960..1088).
     Consume the remaining RHS tail (rhat, u, mp, v, c1, c2) here via wp.
     LHS: 4 stmts (2 compress + 2 ct init).  RHS: 6 stmts. *)
wp; ecall {1} (i_poly_compress_corr v{1}).
wp; ecall {1} (polyvec_compress_avx2_corr bp{1}).
auto =>  |> &1 &2 ?? Hpkv Hpkb Hkv Hkb; rewrite /prg_enc_inner => [#] Hrv Hep Hepp Hmb Hepb Heppb Hrvv Hspb Hbpv Hvv Hvb Hbpb result Hresv; split.
+ rewrite tP => k kn.
  rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifT 1:/# initiE 1:/# /=;do congr.
  by rewrite Hbpv;do congr.
rewrite tP => k kn.
by rewrite initiE 1:/# /=  initiE 1:/# /=  initiE 1:/# /= ifT 1:/# Hresv Hvv initiE 1:/# /=.
qed.

lemma mlkem_correct_enc_1_avx2 _pkp :
  equiv [Jkem_avx2.M.__indcpa_enc ~ KPKE.enc_derand :
    msgp{1} = m{2} /\ pk{1} = _pkp /\
    noiseseed{1} = coins{2} /\
    pk{2}.`1 = Array1152.init (fun i => pk{1}.[i]) /\
    pk{2}.`2 = Array32.init (fun i => pk{1}.[i+1152])
    ==>
    let (c1,c2) = res{2} in
    c1 = Array960.init (fun i => res{1}.[i]) /\
    c2 = Array128.init (fun i => res{1}.[i+960])].
proof.
transitivity InnerPKE_Op.enc_derand
  (msgp{1} = m{2} /\ pk{1} = _pkp /\
   noiseseed{1} = r{2} /\
   pk{2}.`1 = Array1152.init (fun i => pk{1}.[i]) /\
   pk{2}.`2 = Array32.init (fun i => pk{1}.[i+1152])
   ==>
   let (c1,c2) = res{2} in
   c1 = Array960.init (fun i => res{1}.[i]) /\
   c2 = Array128.init (fun i => res{1}.[i+960]))
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
      t = Array1152.init (fun i => res{1}.`1.[i]) /\
      rho = Array32.init (fun i => res{1}.`1.[1152+i])].
proof.
proc => /=.

(* === Step 1: seed expansion (AVX2 SHA3-512 + byte (un)packing).
   RHS absorbs 4 witnesses + (rho,s,e)<-prg_kg_inner coins (5 stmts total).
   After this, rho{2} = (G_coins_ds coins{2}).`1 = publicseed{1}, and
   noiseseed{1} = (G_coins_ds coins{2}).`2 (what would have been sig in
   the inline-while spec).  LHS work mirrors the old proof's Step 1. === *)
seq 16 5 : (#pre /\ publicseed{1} = rho{2} /\
            noiseseed{1} = (G_coins_ds coins{2}).`2 /\
            s{2} = (prg_kg_inner coins{2}).`2 /\
            e{2} = (prg_kg_inner coins{2}).`3).
+ (* Step 1a: inbuf-packing while loop -- coins ++ kvec -> inbuf.
     RHS absorbs 4 witnesses + (rho,s,e)<-prg_kg_inner = 5 stmts.
     LHS: 8 witnesses + inc<-4 + i<-0 + while = 11 stmts. *)
  seq 11 5 : (randomnessp{1} = coins{2} /\
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
  (* Step 1b: inbuf[32]<-kvec, then SHA3-512 -> buf.  No RHS stmts left. *)
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
        
   (* AUTHORIZED: inner-body byte algebra (get8/set64/get64/pack8). *)
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
           pos_bound2304_cxq aa{1} 0 2304 2).
+ sp 1 1.
  ecall {1} (_gen_matrix_avx2_sem publicseed{1} false).
  auto => /> &2 ?; do split;1,2: smt(nttmK).
  rewrite /pos_bound2304_cxq /nttunpackm => k kb.
  rewrite initiE 1:/# /=.
  case (0 <= k < 768) => kbb.
  + have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
             (nttunpackv (subarray768 (unlift_matrix (sampleA rho{2})) 0)));
      last by smt(Array768.allP).
    rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE 1:/# /=.
    by smt(matrix_unlift).
  case (768 <= k < 1536) => kbb'.
  + have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
             (nttunpackv (subarray768 (unlift_matrix (sampleA rho{2})) 1)));
      last by smt(Array768.allP).
    rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE 1:/# /=.
    by smt(matrix_unlift).
  have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
           (nttunpackv (subarray768 (unlift_matrix (sampleA rho{2})) 2)));
    last by smt(Array768.allP).
  rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE 1:/# /=.
  by smt(matrix_unlift).

seq 6 0 : (#pre /\
  (forall i, 0 <= i < 3 =>
     lift_array256 (Array256.init (fun k => skpv{1}.[256*i + k])) =
       cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int i))) /\
  lift_array256 (Array256.init (fun k => e{1}.[k])) =
    cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int 3)) /\
  signed_bound768_cxq skpv{1} 0 768 1 /\
  signed_bound768_cxq e{1} 0 256 1).
+ sp 1 0.
  wp.
  ecall {1} (jkem_getnoise_4x_ph noiseseed{1} (W8.of_int 0)).
  auto => /> &1 &2 _ result Hr1 Hr2 Hr3 Hr4 Hb1 Hb2 Hb3 Hb4.
  do split.
  + move => i0 ??.
    rewrite /PRF.
    case (i0 = 0) => Ci0.
    + rewrite Ci0 -Hr1 /lift_array256 tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifF /#.
    case (i0 = 1) => Ci1.
    + rewrite Ci1 -Hr2 /lift_array256 tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifT /#.
    have ->: i0 = 2 by smt().
    rewrite -Hr3 /lift_array256 tP => k Hk.
    rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= ifT /#.
  + rewrite /PRF -Hr4 /lift_array256 tP => k Hk.
    rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= ifT /#.
  + (* signed_bound768_cxq skpv 0 768 1 from Hb1, Hb2, Hb3 *)
    move => k Hk1.
    rewrite initiE 1:/# /=.
    case (512 <= k < 768) => Ck; first by smt().
    rewrite initiE 1:/# /=.
    case (256 <= k < 512) => Ck'; first by smt().
    rewrite initiE 1:/# /= /#.
  + (* signed_bound768_cxq e 0 256 1 from Hb4 *)
    move => k Hk1 .
    rewrite initiE 1:/# /= ifT 1:/#.
    by smt().

seq 6 0 : (#pre /\
  lift_polyvec skpv{1} = (prg_kg_inner coins{2}).`2 /\
  lift_polyvec e{1} = (prg_kg_inner coins{2}).`3 /\
  signed_bound768_cxq skpv{1} 0 768 1 /\
  signed_bound768_cxq e{1} 0 768 1).
+ sp 1 0.
  wp.
  ecall {1} (jkem_getnoise_4x_ph noiseseed{1} (W8.of_int 4)).
  auto => /> &1 &2 _ Hs He Hbs He256 result Hr1 Hr2 Hr3 Hr4 Hb1 Hb2 Hb3 Hb4.
  do split.
  + (* lift_array256 (init e_final[0..256]) = cbd2sample (PRF _seed 3) -- e_final[0..256] = e{1}[0..256] *)
    rewrite /PRF -He /lift_array256 tP => k Hk.
    rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=  initiE 1:/# /= ifF 1:/# ifF /#.
  + (* signed_bound768_cxq e_final 0 256 1 -- from He256 *)
    move => k Hk1.
    rewrite  initiE 1:/# /= initiE 1:/# /= /= ifF 1:/# ifF /#.
  + (* lift_polyvec skpv{1} = prg_kg_inner.`2 -- carried from Hs *)
    rewrite /lift_polyvec /prg_kg_inner /=.
    apply eq_vectorP => i Hi.
    rewrite offunvE //=.
    rewrite /subarray256 Hs 1:/# /PRF.
    rewrite /lift_array256 tP => k Hk; rewrite offunvE /#.
  + (* lift_polyvec e_final = prg_kg_inner.`3 *)
    rewrite /lift_polyvec /prg_kg_inner /=.
    apply eq_vectorP => i Hi.
    rewrite offunvE //=.
    rewrite /subarray256 /PRF.
    case (i = 0) => Ci0.
    + rewrite Ci0 offunvE 1:/# /= /PRF /lift_array256 -He tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifF /#.
    case (i = 1) => Ci1.
    + rewrite Ci1 offunvE 1:/# /= -Hr1 /lift_array256 tP => k Hk.
      rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= ifF 1:/# ifT /#.
    have ->: i = 2 by smt().
    rewrite offunvE 1:/# /= -Hr2 /lift_array256 tP => k Hk.
    rewrite !mapiE 1,2:/# initiE 1:/# /= initiE 1:/# /= ifT /#.
  + (* signed_bound768_cxq e_final 0 768 1 *)
    move => k Hk1.
    rewrite initiE 1:/# /=.
    case (512 <= k < 768) => Ck; first by smt().
    rewrite initiE 1:/# /=.
    case (256 <= k < 512) => Ck'; first by smt().
    by smt().

seq 2 2 : (#{/~s{2} = (prg_kg_inner coins{2}).`2}
            {/~e{2} = (prg_kg_inner coins{2}).`3}
            {/~lift_polyvec skpv{1} = (prg_kg_inner coins{2}).`2}
            {/~lift_polyvec e{1} = (prg_kg_inner coins{2}).`3}
            {/~signed_bound768_cxq skpv{1} 0 768 1}
            {/~signed_bound768_cxq e{1} 0 768 1}
            {/~signed_bound768_cxq e{1} 0 256 1}
            {/~forall i, 0 <= i < 3 =>
                 lift_array256 (Array256.init (fun k => skpv{1}.[256*i + k])) =
                 cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int i))}
            {/~lift_array256 (Array256.init (fun k => e{1}.[k])) =
                cbd2sample (Symmetric.PRF noiseseed{1} (W8.of_int 3))}pre /\
           s{2} = lift_polyvec (nttpackv skpv{1}) /\
           e{2} = lift_polyvec (nttpackv e{1}) /\
           pos_bound768_cxq skpv{1} 0 768 2 /\
           pos_bound768_cxq e{1} 0 768 2).
+ ecall{1}(polyvec_ntt_avx2_corr e{1}).
  ecall{1}(polyvec_ntt_avx2_corr skpv{1}).
  auto => /> &1 &2 ? Hs He ?? Hs1 Hs2 ?;split;1:smt().
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
             (forall k, 0 <= k < 1152 => pk{1}.[k] = aux_3{1}.[k]) /\
             (forall k, 0 <= k < i{1}*8 => pk{1}.[1152+k] = publicseed{1}.[k]))
            (4 - i{1}).
  + move => &m z; auto => /> &hr Hpk_low Hpk_high Hi0 Hi1 Hlt.
    do split; 1,2,5:smt().
    + move => k kbl kbh; rewrite initiE 1:/# /= get8_set64_directE 1,2:/# ifF 1:/#.
      rewrite /get8 /init8 initiE 1:/# /=; smt().
    (* pk[1152..1152+(i+1)*8] coverage *)
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

ecall {1} (polyvec_tobytes_corr pkpv{1}).                 (* LHS5 *)
ecall {1} (polyvec_tobytes_corr skpv{1}).                 (* LHS4 *)
ecall {1} (polyvec_reduce_corr_avx (lift_array768 pkpv{1})). (* LHS3 *)
ecall {1} (polyvec_add_corr_avx 2 2 _ _ (lift_array768 pkpv{1}) (lift_array768 e{1})) => //. (* LHS2 *)

wp.

conseq (: _ ==>
  publicseed{1} = rho{2} /\
  s{2} = lift_polyvec (nttpackv skpv{1}) /\
  e{2} = lift_polyvec (nttpackv e{1}) /\
  pos_bound768_cxq skpv{1} 0 768 2 /\
  pos_bound768_cxq e{1} 0 768 2 /\
  lift_polyvec (nttpackv pkpv{1}) = ntt_mmul a{2} s{2} /\
  signed_bound768_cxq pkpv{1} 0 768 2).
+ move => |> &1 &2 ? Hskb Heb _pk Hmmul Hpkb.
  do split; 1: smt().
  move => ? rr Hrrb Hrrv rr1 Hrr1v ? Hrr1b.
  split.
  + congr.
    by rewrite -toipolivec_lift.
  congr.
  have Hrr1_lift : forall k, 0 <= k < 768 =>
      (lift_array768 rr1).[k] = (lift_array768 _pk).[k] + (lift_array768 e{1}).[k].
  + move => k Hk; rewrite -Hrr1v /lift_array768 mapiE 1:/# /=.
    by move: (Hrrv k Hk); rewrite /lift_array768 !mapiE 1..3:/# /=.
  have Hpoly : lift_polyvec (nttpackv rr1) =
               (lift_polyvec (nttpackv _pk) + lift_polyvec (nttpackv e{1}))%Vector
    by apply (lift_polyvec_nttpackv_add _pk e{1} rr1 Hrr1_lift).
  rewrite -Hmmul.
  have := Hpoly; rewrite -toipolivec_lift => ->.
  by rewrite polyvecD.

conseq |>.

sp 1 0.

(* Mmul while loop -- LHS-only (RHS has no while since the spec mmul is one op).
   Use a while {1} invariant that grows slot by slot: at iteration i, slots
   [0..i) hold the correct ntt_mmul rows and are bounded.  The body uses the
   new ecall on FbdHoareS arm (our recent EC patch) to call frommont and
   pointwise_acc directly with program-variable arguments. *)
while {1} (
  0 <= i{1} <= 3 /\
  publicseed{1} = rho{2} /\
  aa{1} = nttunpackm (unlift_matrix a{2}) /\
  pos_bound2304_cxq aa{1} 0 2304 2 /\
  s{2} = lift_polyvec (nttpackv skpv{1}) /\
  e{2} = lift_polyvec (nttpackv e{1}) /\
  pos_bound768_cxq skpv{1} 0 768 2 /\
  pos_bound768_cxq e{1} 0 768 2 /\
  (forall j, 0 <= j < i{1} =>
     lift_array256 (subarray256 pkpv{1} j) =
     nttunpack ((ntt_mmul a{2} s{2}).[j]%PolyVec)) /\
  (forall j, 0 <= j < 3 =>
     signed_bound768_cxq (nttpackv (subarray768 aa{1} j)) 0 768 2) /\
  signed_bound768_cxq pkpv{1} 0 (i{1} * 256) 2
) (3 - i{1}).
+ move => &m z.
  wp; ecall (poly_frommont_corr_avx
               (map W16.to_sint (Array256.init (fun k => pkpv.[i * 256 + k])))); last first.
  + by call polyvec_pointwise_acc_avx_ll.
  wp; ecall (polyvec_pointwise_acc_corr_alg_avx
               (PolyVec.invnttv (lift_polyvec (nttpackv (subarray768 aa i))))
               (PolyVec.invnttv (lift_polyvec (nttpackv skpv)))
               (nttpackv (subarray768 aa i))
               (nttpackv skpv)).
  auto => |> &hr ?? H H0 H1 H2 H3 H4 ?.
  + split; rewrite !nttvK /=.
    do split; 1,6: smt().
    + rewrite /signed_bound768_cxq /nttpackv => k kb.
      rewrite initiE 1:/# /=.
      pose P := fun (c : W16.t) => - 2 * q <= to_sint c < 2 * q.
      case (0 <= k < 256) => ?.
      + have : all P (nttpack (subarray256 skpv{hr} 0));
          last by rewrite allP /P; smt(Array256.allP).
        rewrite nttpack_pred allP /P /subarray256 => kk Hkk.
        rewrite initiE 1:/# /= /#.
      case (256 <= k < 512) => ?.
      + have : all P (nttpack (subarray256 skpv{hr} 1));
          last by rewrite allP /P; smt(Array256.allP).
        rewrite nttpack_pred allP /P /subarray256 => kk Hkk.
        rewrite initiE 1:/# /= /#.
      have : all P (nttpack (subarray256 skpv{hr} 2));
        last by rewrite allP /P; smt(Array256.allP).
      rewrite nttpack_pred allP /P /subarray256 => kk Hkk.
      rewrite initiE 1:/# /= /#.
    + have ->: init (fun (i_0 : int) => (nttunpackm (unlift_matrix a{m})).[i{hr} * 768 + i_0])
             = subarray768 (nttunpackm (unlift_matrix a{m})) i{hr}.
      + rewrite /subarray768; apply Array768.tP => k Hk.
        by rewrite !initiE //=; congr; ring.
      by rewrite -nttpackv_lift packvK.
    + by rewrite -nttpackv_lift packvK.
    + rewrite /signed_bound768_cxq => k Hk.
      rewrite initiE 1:/# /=.
      move: H; rewrite /pos_bound2304_cxq => H.
      by have := H (i{hr} * 768 + k) _; smt().
  move => ?????? rr0 Hrr0v Hrr0b rr1 Hrr1; do split; 1,2,5..: smt().
  + move => j Hj0 Hji.
    have Hcase : j < i{hr} \/ j = i{hr} by smt().
    case Hcase => [Hjlt | Hjeq].
    + rewrite (subarray256_double_init_fallthrough pkpv{hr} rr0 rr1 i{hr} j) 1,2:/#; smt().
    rewrite Hjeq.
    have ->: subarray256
      (init
        (fun (i_0 : int) =>
           if i{hr} * 256 <= i_0 < i{hr} * 256 + 256 then rr1.[i_0 - i{hr} * 256]
           else
             (Array768.init
                (fun (i_0_0 : int) =>
                   if i{hr} * 256 <= i_0_0 < i{hr} * 256 + 256 then rr0.[i_0_0 - i{hr} * 256] else pkpv{hr}.[i_0_0])).[i_0])) i{hr} = rr1.
    + rewrite /subarray256; apply Array256.tP => k Hk.
      by rewrite initiE 1:/# /= initiE 1:/# /= ifT 1:/# /=; congr; ring.
    rewrite -(ntt_dotp_row_eq_ntt_mmul a{m} skpv{hr} i{hr}) 1:/#.
    apply (frommont_cancels_at_slot rr0 rr1 _) => //.
    move => k Hk.
    move: Hrr1; rewrite tP => /(_ k _) //; rewrite !mapiE //= => ->.
    by rewrite initiE 1:/# /= initiE 1:/# /= ifT 1:/# /#.
  rewrite /signed_bound768_cxq => k Hk.
  rewrite initiE 1:/# /=.
  case (i{hr} * 256 <= k < i{hr} * 256 + 256) => Hk1.
  + have Hrr1k : to_sint rr1.[k - i{hr} * 256]
               = SignedReductions_W16.SREDC
                   (to_sint rr0.[k - i{hr} * 256]
                    * (SignedReductions_W16.R ^ 2 %% q)).
    + move: Hrr1; rewrite tP => /(_ (k - i{hr} * 256) _); 1: smt().
      rewrite !mapiE 1..3:/# /= initiE 1:/# /= initiE 1:/# /= ifT 1:/# /=.
      by have ->: i{hr} * 256 + (k - i{hr} * 256) - i{hr} * 256 = k - i{hr} * 256 by ring.
    have [#] := SignedReductions_W16.SREDCp_corr
                  (to_sint rr0.[k - i{hr} * 256]
                   * (SignedReductions_W16.R ^ 2 %% q)) _ _.
    + by rewrite /SignedReductions_W16.R; smt(qE).
    + have := Hrr0v (k - i{hr} * 256) _; 1: smt().
      by rewrite /SignedReductions_W16.R; smt(qE @SignedReductions_W16).
    move => Hl Hh _; rewrite /b16 Hrr1k.
    have := SignedReductions_W16.SREDCp_corr
              (to_sint rr0.[k - i{hr} * 256] * (SignedReductions_W16.R ^ 2 %% q)) _ _.
    + by rewrite /SignedReductions_W16.R; smt(qE).
    + have := Hrr0v (k - i{hr} * 256) _; 1: smt().
      by rewrite /SignedReductions_W16.R; smt(qE @SignedReductions_W16).
    smt().
  rewrite initiE 1:/# /= ifF 1:/#.
  move: H4; rewrite /signed_bound768_cxq => H4'.
  by have := H4' k _; smt().


auto => |> &1 &2 H H0 H1.
do split; 1,3: smt().
+ move => j Hj0 Hj3; rewrite /signed_bound768_cxq.
  have : all (fun (c : W16.t) => b16 c (2 * q))
           (nttpackv (subarray768 (nttunpackm (unlift_matrix (sampleA rho{2}))) j));
    last by smt(Array768.allP).
  rewrite nttpackv_pred allP /subarray768 => kk Hkk.
  rewrite initiE 1:/# /=.
  move: H; rewrite /pos_bound2304_cxq => Hpb.
  by have := Hpb (768 * j + kk) _; smt().

(* Post-loop: invariant at i=3 implies the conseq target *)
move => i pkpv; split; 1: smt().
move => Hi0 Hi1 Hgt Hslots Hbnd ?.
have Hi3: i = 3 by smt().
do split; 2: smt().
+ apply (kg_loop_post_to_target pkpv _) => j jb.
  by apply Hslots; smt().
qed.

(* DERIVED: original target via transitivity through InnerPKE_Op (operator
   form spec) using kg_op_eq from InnerPKE_Op. *)
lemma mlkem_correct_kg_avx2 :
  equiv [Jkem_avx2.M.__indcpa_keypair ~ KPKE.kg_derand :
    randomnessp{1} = coins{2}
    ==>
    let (pk,sk) = res{2} in let (t,rho) = pk in
      sk = res{1}.`2 /\
      t = Array1152.init (fun i => res{1}.`1.[i]) /\
      rho = Array32.init (fun i => res{1}.`1.[1152+i])].
proof.
transitivity InnerPKE_Op.kg_derand
  (randomnessp{1} = coins{2} ==>
     let (pk,sk) = res{2} in let (t,rho) = pk in
       sk = res{1}.`2 /\
       t = Array1152.init (fun i => res{1}.`1.[i]) /\
       rho = Array32.init (fun i => res{1}.`1.[1152+i]))
  (={arg} ==> ={res}).
+ smt().
+ smt().
+ exact mlkem_correct_kg_avx2_op.
+ conseq kg_op_eq.
qed.

lemma mlkem_correct_dec :
  equiv [Jkem_avx2.M.__indcpa_dec ~ KPKE.dec :
    ={sk} /\
    let (c1,c2) = cph{2} in
      c1 = Array960.init (fun i => ct{1}.[i]) /\
      c2 = Array128.init (fun i => ct{1}.[960+i])
    ==>
    res{1} = res{2}].
proof.
proc => /=.
(* spec-side swaps to align with avx2 order *)
swap {2} 3 -2.
sp 0 1.
swap {2} [3..4] -1.
swap {1} 6 -4.

(* Step 1: decompress c1 -> u  (avx2: __i_polyvec_decompress) *)
seq 2 3 : (#pre /\ u{2} = lift_polyvec bp{1} /\
           signed_bound768_cxq bp{1} 0 768 2).
+ wp; ecall{1}(polyvec_decompress_corr (Array960.init (fun (i : int) => ct{1}.[0 + i]))).
  auto => /> /#.

swap {2} [2..3] -1.
swap {1} 2 -1.
swap {1} [4..5] -2.

(* Step 2: decompress c2 -> v  (avx2: _i_poly_decompress) *)
seq 3 2 : (#{/~ct{1}}pre /\ v{2} = lift_array256 v{1} /\
           signed_bound_cxq v{1} 0 256 1).
+ wp; ecall{1}(poly_decompress_corr (Array128.init (fun (i : int) => ct{1}.[3 * 320 + i]))).
  auto => /> /#.

swap {1} 2 -1.
swap {1} 3 -2.

(* Step 3: frombytes sk -> skpv  (avx2: __i_polyvec_frombytes; lands on nttunpackv) *)
seq 1 3 : (#pre /\ lift_array768 skpv{1} = nttunpackv (map incoeff (decode12_vec sk{1})) /\
           s{2} = ofipolyvec (decode12_vec sk{2}) /\
           pos_bound768_cxq skpv{1} 0 768 2).
+ wp; ecall{1}(polyvec_frombytes_corr sk{1}).
  auto => /> /#.

swap {1} 3 -2.

(* Step 4: NTT bp  (avx2: __polyvec_ntt; lands on nttunpackv) *)
seq 1 0 : (#{/~u{2} = lift_polyvec bp{1}}{/~signed_bound768_cxq bp{1} 0 768 2}pre /\
           PolyVec.nttv u{2} = lift_polyvec (nttpackv bp{1}) /\
           pos_bound768_cxq bp{1} 0 768 2).
+ ecall{1}(polyvec_ntt_avx2_corr bp{1}).
  auto => /> /#.

swap {1} 2 2.

(* Step 5: pointwise-acc s · u (avx2: __polyvec_pointwise_acc *)
seq 2 0 : (#pre /\
           lift_array256 t{1} = nttunpack (scale (ntt_dotp s{2} (PolyVec.nttv u{2})) (incoeff 169)) /\
           signed_bound_cxq t{1} 0 256 3).
+ ecall{1}(polyvec_pointwise_acc_corr_alg_avx (PolyVec.invnttv s{2}) u{2}
            (unlift_polyvec s{2}) (nttpackv bp{1})).
  auto.
  move => &1 &2 [[? [Heqsk [? [? [Hskpv [Hs2 Hsk]]]]]] [Hu Hbound]].
  split.
  + do split.
    + smt(nttvK vector_unlift).
    + smt(vector_unlift qE).
    + smt(vector_unlift qE).
    + have : all (fun (c : W16.t) => b16 c (2 * q)) (nttpackv bp{1});
        last by smt(Array768.allP).
      rewrite nttpackv_pred allP => k Hk.
      move: Hbound; rewrite /pos_bound768_cxq => Hb.
      by have := Hb k Hk; rewrite /b16; smt(qE).
    + rewrite Hskpv Hs2; congr; rewrite lift_array768_unlift_ofipolyvec.
      + rewrite allP => k kb /=.
        have := decode12_vec_bnd sk{2} k _; smt().
      by rewrite Heqsk.
    + by rewrite lift_array768_nttunpackv_nttpackv.
    + move: Hsk; rewrite /pos_bound768_cxq /signed_bound768_cxq /bpos16 /b16 /#.
    + move: Hbound; rewrite /pos_bound768_cxq /signed_bound768_cxq /bpos16 /b16 /#.
  move => _ result [Hb Hr].
  do split => //; by rewrite Hr ntt_dotp_invnttv.

(* Step 6: invNTT t  (avx2: _poly_invntt; introduces W16.modulus scaling) *)
seq 1 0 : (#{/~lift_array256 t{1} = nttunpack (scale (ntt_dotp s{2} (PolyVec.nttv u{2})) (incoeff 169))}{/~signed_bound_cxq t{1} 0 256 3}pre /\
           lift_array256 t{1} = invntt (ntt_dotp s{2} (PolyVec.nttv u{2})) /\
           signed_bound_cxq t{1} 0 256 1).
+ ecall{1}(poly_invntt_avx2_corr (nttpack t{1})).
  auto.
  move => &1 &2 [Hpre [Htsh Htbnd]].
  split; first by move: Htbnd; rewrite /signed_bound_cxq /b16; smt(qE).
  move => _ result [Hres Hresbnd]; split; first by smt().
  split; last by smt().
  rewrite -Hres lift_nttpack Htsh nttunpackK invntt_scale.
  rewrite /scale /mul1x256 tP => k kb.
  rewrite !mapiE //=.
  rewrite ZqField.mulrCA.
  have ->: incoeff 65536 * incoeff 169 = Zq.one by rewrite -rrinvcoeff.
  by ring.

(* Step 7: mp = v - t  (avx2: _poly_sub) *)
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

(* Step 8: reduce mp  (avx2: __poly_reduce) *)
seq 1 1 : (pos_bound256_cxq mp{1} 0 256 2 /\
           lift_array256 mp{1} = mp{2}).
+ ecall{1}(poly_reduce_corr_avx (lift_array256 mp{1})).
  auto.
  move => &1 &2 Hpre result [Hres Hbnd].
  by rewrite /pos_bound256_cxq; smt().

(* Step 9: tomsg  (avx2: _i_poly_tomsg) *)
ecall{1}(poly_tomsg_corr mp{1}).
by auto => /> /#.
qed.
