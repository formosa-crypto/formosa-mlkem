require import AllCore IntDiv List.
from Jasmin require import JModel.
require import Array32 Array128 Array256 Array768 Array960 Array1088 Array2304.
require import KyberPoly  KyberPolyVec KyberINDCPA.
require import KyberPoly_avx2_proof.
require import KyberPoly_avx2_vec.
require import KyberPoly_avx2_prevec.
require import KyberPolyvec_avx2_proof.
require import Jkem_avx2 Jkem.
require import NTT_avx2.
require import NTT_Fq.

import Kyber.
import KyberSpec.
import KyberPoly.
import KyberPolyVec.
import KyberPolyvecAVX.
import NTT_Avx2.

equiv sha3equiv :
 Jkem_avx2.M._sha3_512_32 ~ M._sha3512_32 : ={arg} ==> ={res}.
admitted. 

  
equiv genmatrixequiv b :
  Jkem_avx2.M.__gen_matrix ~  M.__gen_matrix :
    arg{1}.`1 = arg{2}.`1 /\ arg{1}.`2 = b2i b /\ arg{2}.`2 =  W64.of_int (b2i b) ==>
    res{1} = nttunpackm res{2} /\
    pos_bound2304_cxq res{1} 0 2304 2 /\
    pos_bound2304_cxq res{2} 0 2304 2.
admitted.

equiv nttequiv :
 Jkem_avx2.M.__polyvec_ntt ~ M.__polyvec_ntt : 
   ={arg} /\ 
   signed_bound768_cxq arg{1} 0 768 2 /\ 
   signed_bound768_cxq arg{2} 0 768 2 ==>
   res{1} = nttunpackv res{2} /\ 
   pos_bound768_cxq res{1} 0 768 2 /\ 
   pos_bound768_cxq res{2} 0 768 2.
admitted.

lemma to_sintInj : injective W16.to_sint. 
rewrite /injective /to_sint /smod /=. 
move => x y. move => HHH. have : to_uint x = to_uint y; last by smt(W16.to_uint_eq).
move : HHH; move : (W16.to_uint_cmp x); move :  (W16.to_uint_cmp y) => /=. smt().
qed.

equiv frommontequiv : 
  Jkem_avx2.M._poly_frommont ~   M._poly_frommont :
    lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 2 /\ 
    signed_bound_cxq res{2} 0 256 2.
(* Move to poly *)
proc*.  
transitivity {1} { r <@ Mprevec.poly_frommont(rp); }
     (={rp} ==> ={r}) 
     (lift_array256  rp{1} = nttunpack (lift_array256 rp{2}) ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    signed_bound_cxq r{1} 0 256 2 /\ 
    signed_bound_cxq r{2} 0 256 2). smt(). smt().
symmetry. call prevec_eq_poly_frommont. auto => />.

ecall{2} (poly_frommont_corr (map W16.to_sint rp{2})).
ecall{1} (KyberPolyAVX.poly_frommont_corr (map W16.to_sint rp{1})).

auto => />.
move => &1 &2 Hvals r1 H.

split.  
+ by move => k kbl kbh ;rewrite mapE //= initiE //=.
move => H1 _r0 H0.
move : H; rewrite tP => H.

move : H H0;  rewrite qE /Fq.Fq.SignedReductions.R /= => H H0.

do split. 
+ rewrite tP => k kb.
  rewrite /lift_array256 /= mapiE //= /nttunpack initiE //=.
  pose a:= nttunpack_idx.[k].
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  move : (H k kb); rewrite !mapiE //= => ->.
  move : (H0 (nttunpack_idx.[k]) _). move : nttunpack_bnd; rewrite allP /#. 
  rewrite -/a => ->.
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  move : (Fq.Fq.SignedReductions.SREDCp_corr (to_sint rp{1}.[k] * 1353)).
  rewrite qE /Fq.Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{1}.[k] * 1353 && to_sint rp{1}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=. smt(). 
  move => [corr11 corr12].
  move : (Fq.Fq.SignedReductions.SREDCp_corr (to_sint rp{2}.[a] * 1353)).
  rewrite qE /Fq.Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{2}.[a] * 1353 && to_sint rp{2}.[a] * 1353 < 109084672. move : W16.to_sint_cmp => /=. smt(). 
  move => [corr21 corr22].
  move : Hvals; rewrite /lift_array256 tP => Hvals.
  move : (Hvals k kb).
  rewrite /lift_array256 /= mapiE //= /nttunpack initiE //=.
  rewrite -/a.
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  rewrite -!Zq.eq_inFq /= /#.

+ rewrite /signed_bound_cxq /= => k kb.
  move : (H k kb); rewrite !mapiE //= => HH.
  move : (Fq.Fq.SignedReductions.SREDCp_corr (to_sint rp{1}.[k] * 1353)).
  rewrite qE /Fq.Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{1}.[k] * 1353 && to_sint rp{1}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=. smt(). 
  smt().

+ rewrite /signed_bound_cxq /= => k kb.
  move : (H0 k kb); rewrite !mapiE //= => HH.
  move : (Fq.Fq.SignedReductions.SREDCp_corr ((map W16.to_sint rp{2}).[k] * 1353)).
  rewrite qE /Fq.Fq.SignedReductions.R /=. 
  rewrite !mapiE //=.
  have -> /= : -109084672 <= to_sint rp{2}.[k] * 1353 && to_sint rp{2}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=. smt(). 
  smt().

qed.

equiv reduceequiv : 
  Jkem_avx2.M.__poly_reduce ~   M.__poly_reduce :
    lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    pos_bound256_cxq res{1} 0 256 2 /\ 
    pos_bound256_cxq res{2} 0 256 2.
(* Move to poly *)
proc*.  
transitivity {1} { r <@ Mprevec.poly_reduce(rp); }
     (={rp} ==> ={r}) 
     (lift_array256 rp{1} = nttunpack (lift_array256 rp{2}) ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    pos_bound256_cxq r{1} 0 256 2 /\ 
    pos_bound256_cxq r{2} 0 256 2). smt(). smt().
symmetry. call prevec_eq_poly_reduce. auto => />.

ecall{2} (poly_reduce_corr (lift_array256 rp{2})).
ecall{1} (KyberPolyAVX.poly_reduce_corr (lift_array256 rp{1})).

auto => />.
move => &1 &2; rewrite /lift_array256 tP => Hvals r1; rewrite tP => r1val r1rng r2; rewrite tP => r2val r2rng.

rewrite tP => k kb ;rewrite mapE //= initiE //=.
rewrite /nttunpack initiE //=.
pose a:= nttunpack_idx.[k].
rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
move : (Hvals k kb). rewrite mapiE //=.
rewrite /nttunpack initiE //= -/a mapiE //=. move : nttunpack_bnd; rewrite allP /#.
smt(Array256.mapiE nttunpack_bnd Array256.allP).
qed.

import Zq. 

lemma poly_basemul_correct _ap _bp:
   phoare[ M._poly_basemul :
     _ap = lift_array256 ap /\ _bp = lift_array256 bp /\
     signed_bound_cxq ap 0 256 2 /\  signed_bound_cxq bp 0 256 2 ==>
     signed_bound_cxq res 0 256 3 /\ 
     lift_array256 res = NTT_Properties.scale (basemul _ap _bp) (inFq 169)] =1%r 
  by conseq poly_basemul_ll (poly_basemul_corr _ap _bp). (* move to poly *)

lemma poly_basemul_avx2_correct _ap _bp:
   phoare[ Mprevec.poly_basemul :
     _ap = (lift_array256 (nttpack ap)) /\ _bp = (lift_array256 (nttpack bp)) /\
     signed_bound_cxq ap 0 256 2 /\  signed_bound_cxq bp 0 256 2 ==>
     signed_bound_cxq res 0 256 3 /\ 
     (lift_array256 (nttpack res)) = NTT_Properties.scale (basemul _ap _bp) (inFq 169)] =1%r.
admitted. (* move to polyavx2proof *)

lemma lift_nttpack v : lift_array256 (nttpack v) = nttpack (lift_array256 v).
proof. 
rewrite tP => k kb.
rewrite /lift_array256 mapiE //=.
rewrite /nttpack !initiE //=.
pose a := nttpack_idx.[k].
smt(Array256.mapiE nttpack_bnd Array256.allP).
qed.

equiv basemulequiv : 
  Jkem_avx2.M._poly_basemul ~   M._poly_basemul :
    ap{1} = nttunpack ap{2} /\
    bp{1} = nttunpack bp{2} /\
    signed_bound_cxq ap{1} 0 256 2 /\  
    signed_bound_cxq bp{1} 0 256 2 /\
    signed_bound_cxq ap{2} 0 256 2 /\  
    signed_bound_cxq bp{2} 0 256 2
                              ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 3 /\ 
    signed_bound_cxq res{2} 0 256 3.
(* Move to poly *)
proc*.  
transitivity {1} { r <@ Mprevec.poly_basemul(rp,ap,bp); }
     (={ap,bp} ==> ={r}) 
     (ap{1} = nttunpack ap{2} /\
    bp{1} = nttunpack bp{2} /\
    signed_bound_cxq ap{1} 0 256 2 /\  
    signed_bound_cxq bp{1} 0 256 2 /\
    signed_bound_cxq ap{2} 0 256 2 /\  
    signed_bound_cxq bp{2} 0 256 2
                              ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    signed_bound_cxq r{1} 0 256 3 /\ 
    signed_bound_cxq r{2} 0 256 3). smt(). smt().
symmetry. call prevec_eq_poly_basemul. auto => />.

ecall{2} (poly_basemul_correct (lift_array256 ap{2}) (lift_array256 bp{2})).
ecall{1} (poly_basemul_avx2_correct (lift_array256 (nttpack ap{1})) (lift_array256 (nttpack bp{1}))).

auto => />.
move => &2 H0 H1 H2 H3 r2 H4 H5 r1 H6 H7.
rewrite !nttunpackK in H5.
rewrite H7 -H5.
by rewrite lift_nttpack nttpackK.
qed.

lemma poly_add_correct_impl ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
    forall _a _b,
      phoare[ M._poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
   by move => abb bbb _a _b; conseq poly_add_ll (poly_add_corr_impl ab bb abb bbb _a _b ). (* move to poly *)

lemma poly_add_corr_avx_impl ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 => 
  forall _a _b,
      phoare[ Mprevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
   by move => abb bbb _a _b; apply (KyberPolyAVX.poly_add_corr _a _b ab bb abb bbb).
(* move to polyavxproof *)

lemma addequiv  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
    equiv [ Jkem_avx2.M._poly_add2 ~ Jkem.M._poly_add2 :
      lift_array256 rp{1} = lift_array256 (nttunpack rp{2}) /\
      lift_array256 bp{1} = lift_array256 (nttunpack bp{2}) /\
      signed_bound_cxq rp{2} 0 256 ab /\ 
      signed_bound_cxq bp{2} 0 256 bb /\
      signed_bound_cxq rp{1} 0 256 ab /\ 
      signed_bound_cxq bp{1} 0 256 bb
           ==> lift_array256 res{1} = lift_array256  (nttunpack res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab + bb) /\
               signed_bound_cxq res{2} 0 256 (ab + bb) 
              ].
move => abb bbb.
(* Move to poly *)
proc*.  
transitivity {1} { r <@ Mprevec.poly_add2(rp,bp); }
     (={rp,bp} ==> ={r}) 
     (lift_array256 rp{1} = lift_array256 (nttunpack rp{2}) /\
      lift_array256 bp{1} = lift_array256 (nttunpack bp{2}) /\
    signed_bound_cxq rp{1} 0 256 ab /\  
    signed_bound_cxq bp{1} 0 256 bb /\
    signed_bound_cxq rp{2} 0 256 ab /\  
    signed_bound_cxq bp{2} 0 256 bb
                              ==> 
    lift_array256 r{1} = lift_array256 (nttunpack r{2}) /\
    signed_bound_cxq r{1} 0 256 (ab+bb) /\ 
    signed_bound_cxq r{2} 0 256 (ab+bb)). smt(). smt().
symmetry. call prevec_eq_poly_add2. auto => />.

have Hright :=  (poly_add_correct_impl ab bb abb bbb).
ecall{2} (Hright (lift_array256 rp{2}) (lift_array256 bp{2})).
have Hleft :=  (poly_add_corr_avx_impl ab bb abb bbb).
ecall{1} (Hleft (lift_array256 rp{1}) (lift_array256  bp{1})).

auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 r2 H6 H7 r1 H8 H9.
rewrite /lift_array256 tP => k kb.
rewrite !mapiE //=.
rewrite /nttunpack initiE //=.
pose a:= nttunpack_idx.[k].
rewrite H7 // H9. smt(nttunpack_bnd Array256.allP).
rewrite /lift_array256 !mapiE //=. smt(nttunpack_bnd Array256.allP). smt(nttunpack_bnd Array256.allP).
rewrite /lift_array256 !tP in H0.
rewrite /lift_array256 !tP in H1.
move : (H0 k kb); rewrite !mapiE //=.
move : (H1 k kb); rewrite !mapiE //=.
smt(Array256.initiE).
qed.

lemma init_unpack (v : 'a Array768.t) :
  Array256.init ("_.[_]" (nttunpackv v)) = nttunpack (Array256.init ("_.[_]" v)).
rewrite /nttunpackv /nttunpack tP => k kb.
rewrite !initiE //= 1: /# kb /=.
pose a:= nttunpack_idx.[k].
rewrite initiE //=.
qed.

lemma init_unpack1 (v : 'a Array768.t) :
  Array256.init (fun (i : int) => (nttunpackv v).[256 + i]) = nttunpack (Array256.init (fun (i : int) => v.[256 + i])).
rewrite /nttunpackv /nttunpack tP => k kb.
rewrite initiE //=.
rewrite initiE //=. smt().
rewrite ifF 1:/#.
rewrite ifT 1:/#.
rewrite initiE //=.
pose a:= nttunpack_idx.[k].
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite initiE //=.
rewrite -/a initiE //=.
 smt(nttunpack_bnd Array256.allP).
qed.

lemma init_unpack2 (v : 'a Array768.t) :
  Array256.init (fun (i : int) => (nttunpackv v).[512 + i]) = nttunpack (Array256.init (fun (i : int) => v.[512 + i])).
rewrite /nttunpackv /nttunpack tP => k kb.
rewrite initiE //=.
rewrite initiE //=. smt().
rewrite ifF 1:/#.
rewrite ifF 1:/#.
rewrite initiE //=.
pose a:= nttunpack_idx.[k].
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite initiE //=.
rewrite -/a initiE //=.
 smt(nttunpack_bnd Array256.allP).
qed.

lemma lift256_nttunpack v :
  lift_array256 (nttunpack v) = nttunpack (lift_array256 v).
rewrite /lift_array256 /nttunpack tP => k kb.
rewrite mapiE //= initiE //=.
pose a:= nttunpack_idx.[k].
rewrite initiE //= mapiE //=. smt(nttunpack_bnd Array256.allP).
qed.

equiv pointwiseequiv : 
  Jkem_avx2.M.__polyvec_pointwise_acc ~   M.__polyvec_pointwise_acc :
    arg{1}.`2 = nttunpackv arg{2}.`1 /\
    arg{1}.`3 = nttunpackv arg{2}.`2 /\
    signed_bound768_cxq arg{1}.`2 0 768 2 /\
    signed_bound768_cxq arg{1}.`3 0 768 2 /\
    signed_bound768_cxq arg{2}.`1 0 768 2 /\
    signed_bound768_cxq arg{2}.`2 0 768 2
    ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 2 /\ 
    signed_bound_cxq res{2} 0 256 2.
proc => /=.
seq 2 3 :(#pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 3 /\
         signed_bound_cxq r{2} 0 256 3).
ecall (basemulequiv). auto => />.
move => &1 H H0 H1 H2. do split. 
+ by rewrite init_unpack /=.
+ by rewrite init_unpack /=.
+ rewrite init_unpack /=.
  move : H; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H k kb.
  move : (H k _); 1: smt(). rewrite !initiE//= 1:/# kb /=.
  pose a:= nttunpack_idx.[k].
  rewrite /subarray256 /nttunpack.
  rewrite !initiE//=. smt(nttunpack_bnd Array256.allP). 
  rewrite -/a !initiE //=. smt(nttunpack_bnd Array256.allP).
+ rewrite init_unpack /=.
  move : H0; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H0 k kb.
  move : (H0 k _); 1: smt(). rewrite !initiE//= 1:/# kb /=.
  pose a:= nttunpack_idx.[k].
  rewrite /subarray256 /nttunpack.
  rewrite !initiE//=. smt(nttunpack_bnd Array256.allP). 
  rewrite -/a !initiE //=. smt(nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=.
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=.


seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 3 /\
         signed_bound_cxq t{2} 0 256 3).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5. do split. 
+ by rewrite init_unpack1 /=.
+ by rewrite init_unpack1 /=.
+ rewrite init_unpack1 /=.
  move : H; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H k kb.
  move : (H (256+k) _); 1: smt(). rewrite !initiE//= 1:/# ifF 1:/# /=.
  pose a:= nttunpack_idx.[k].
  rewrite ifT 1:/# /subarray256 /nttunpack.
  rewrite !initiE//=. smt(nttunpack_bnd Array256.allP). 
  rewrite -/a !initiE //=. smt(nttunpack_bnd Array256.allP).
+ rewrite init_unpack1 /=.
  move : H0; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H0 k kb.
  move : (H0 (k+256) _); 1: smt(). rewrite !initiE//= 1:/# ifF 1:/# /=.
  pose a:= nttunpack_idx.[k].
  rewrite ifT 1:/# /subarray256 /nttunpack.
  rewrite !initiE//=. smt(nttunpack_bnd Array256.allP). 
  rewrite -/a !initiE //=. smt(nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 (256+k) _); 1: smt(). rewrite !initiE//=.
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 (256+k) _); 1: smt(). rewrite !initiE//=.

seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 6 /\
         signed_bound_cxq r{2} 0 256 6).
have Hcall:= addequiv 3 3 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7 H8. do split. 
+ rewrite lift256_nttunpack. apply H3.
+ rewrite lift256_nttunpack. apply H6.
move => ?? r2 r1 ???.
rewrite -lift256_nttunpack. assumption.

seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 3 /\
         signed_bound_cxq t{2} 0 256 3).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5. do split. 
+ by rewrite init_unpack2.
+ by rewrite init_unpack2.
+ rewrite init_unpack2 /=.
  move : H; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H k kb.
  move : (H (512+k) _); 1: smt(). rewrite !initiE//= 1:/# ifF 1:/# /=.
  pose a:= nttunpack_idx.[k].
  rewrite ifF 1:/# /subarray256 /nttunpack.
  rewrite !initiE//=. smt(nttunpack_bnd Array256.allP). 
  rewrite -/a !initiE //=. smt(nttunpack_bnd Array256.allP).
+ rewrite init_unpack2 /=.
  move : H0; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H0 k kb.
  move : (H0 (512+k) _); 1: smt(). rewrite !initiE//= 1:/# ifF 1:/# /=.
  pose a:= nttunpack_idx.[k].
  rewrite ifF 1:/# /subarray256 /nttunpack.
  rewrite !initiE//=. smt(nttunpack_bnd Array256.allP). 
  rewrite -/a !initiE //=. smt(nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 (512+k) _); 1: smt(). rewrite !initiE//=.
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 (512+k) _); 1: smt(). rewrite !initiE//=.

seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 9 /\
         signed_bound_cxq r{2} 0 256 9).
have Hcall:= addequiv 6 3 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 ??????????. do split. 
+ rewrite lift256_nttunpack. assumption.
+ rewrite lift256_nttunpack. assumption.
move => ?? r2 r1 ???.
rewrite -lift256_nttunpack. assumption.

call reduceequiv.
auto => />.
move => &1 &2 ??????? r1 r2 ?.
rewrite /pos_bound256_cxq /signed_bound_cxq => H H0. smt().
qed.


lemma kyber_correct_kg_avx2 mem _pkp _skp _randomnessp : 
   equiv [ Jkem_avx2.M.__indcpa_keypair ~ Kyber(KHS,XOF,KPRF,H).kg_derand : 
       Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp /\ to_uint skp{1} = _skp /\ 
       to_uint randomnessp{1} = _randomnessp /\
       seed{2} = Array32.init(fun i=> loadW8 Glob.mem{1} (to_uint randomnessp{1}  + i)) /\
       valid_ptr (to_uint randomnessp{1}) 32 /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3)
        ==> 
       touches2 Glob.mem{1} mem _pkp (384*3+32) _skp (384*3) /\
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk = load_array1152 Glob.mem{1} _skp /\
         t = load_array1152 Glob.mem{1} _pkp  /\
         rho = load_array32 Glob.mem{1} (_pkp+1152)].
proc*.
transitivity {1} { Jkem.M.__indcpa_keypair(pkp, skp, randomnessp);} 
(={Glob.mem,pkp,skp,randomnessp} /\ 
  Glob.mem{1} = mem /\
    to_uint pkp{1} = _pkp /\
    to_uint skp{1} = _skp /\
    to_uint randomnessp{1} = _randomnessp /\ 
       valid_ptr (to_uint randomnessp{1}) 32 /\
    valid_disj_reg _pkp (384 * 3 + 32) _skp (384 * 3) ==> ={Glob.mem}) 
(   Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp /\ to_uint skp{1} = _skp /\ 
       to_uint randomnessp{1} = _randomnessp /\
       seed{2} = Array32.init(fun i=> loadW8 Glob.mem{1} (to_uint randomnessp{1}  + i)) /\
       valid_ptr (to_uint randomnessp{1}) 32 /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3)
    ==> 
    touches2 Glob.mem{1} mem _pkp (384*3+32) _skp (384*3) /\
    let (pk, sk) = r{2} in
    let (t, rho) = pk in
        sk = load_array1152 Glob.mem{1} _skp /\
        t = load_array1152 Glob.mem{1} _pkp /\ 
        rho = load_array32 Glob.mem{1} (_pkp + 1152)); 1,2: smt(); 
   last by call(kyber_correct_kg mem _pkp _skp _randomnessp); auto => />. 

inline{1} 1; inline {2} 1. sim. 

call KyberPolyvecAVX.polyvec_tobytes_corr.
call KyberPolyvecAVX.polyvec_tobytes_corr.
wp;conseq />.
ecall (KyberPolyvecAVX.polyvec_reduce_corr (lift_array768 pkpv{2})).

have H := KyberPolyvecAVX.polyvec_add2_corr 2 2 _ _ => //.
ecall (H (lift_array768 pkpv{2}) (lift_array768 e{2})); clear H.
unroll for {1} 37.

sp 3 3.

seq 17 17  : (#pre /\ ={publicseed, noiseseed,sskp,spkp}); 1:  by conseq />; sim;  call( sha3equiv); conseq />; sim. 

seq 1 2 : (#pre /\ aa{1} = nttunpackm a{2} /\
           pos_bound2304_cxq aa{1} 0 2304 2 /\
           pos_bound2304_cxq a{2} 0 2304 2); 1: by 
   conseq />; call (genmatrixequiv false); auto => />.

swap {1} [11..12] 2.

seq 10 18 : (#pre /\ ={skpv,e} /\
    signed_bound768_cxq skpv{1} 0 768 1 /\
    signed_bound768_cxq e{1} 0 768 1 /\
    signed_bound768_cxq skpv{2} 0 768 1 /\
    signed_bound768_cxq e{2} 0 768 1). 
conseq />.
admit. (* to do *)

seq 2 2 : (#{/~skpv{1}}{~e{1}}{~skpv{2}}{~e{2}}pre /\ 
           skpv{1} = nttunpackv skpv{2} /\
           e{1} = nttunpackv e{2} /\
           pos_bound768_cxq skpv{1} 0 768 2 /\
           pos_bound768_cxq skpv{2} 0 768 2 /\
           pos_bound768_cxq e{1} 0 768 2 /\
           pos_bound768_cxq e{2} 0 768 2); 1: 
 by  conseq />; call (nttequiv); call (nttequiv); auto => /> /#.

(* First ip *)

seq 8 4: (#pre /\ 
              lift_array256 (subarray256 pkpv{1} 0) = nttunpack (lift_array256 (subarray256 pkpv{2} 0)) /\
              signed_bound768_cxq pkpv{1} 0 256 2 /\
              signed_bound768_cxq pkpv{2} 0 256 2 /\ i{1} = 1).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12; do split.
+ rewrite /unpackm /unpackv tP /= => k kb.
  by rewrite !initiE // 1:/# /= kb /= initiE //=.
+ rewrite /signed_bound768_cxq => k kb; rewrite initiE //=. 
+ rewrite /unpackm /unpackv /=.
  rewrite !initiE // 1:/# /= kb /= initiE //=.
  rewrite fun_if. 
  case (0<=k<256).
  + move => kbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray768 a{2} 0).[256 * 0 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array768.initiE). smt().
  case (256<=k<512).
  + move => kbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray768 a{2} 0).[256 * 1 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array768.initiE). smt(). auto.
  case (512<=k<768).
  + move => kbbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray768 a{2} 0).[256 * 2 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array768.initiE). smt(). auto.
  by smt().
+ move : H10; rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ move : H8; rewrite /pos_bound768_cxq /signed_bound_768_cxq; smt(Array768.initiE).
+ move : H10; rewrite /pos_bound768_cxq /signed_bound_768_cxq; smt(Array768.initiE).

move => H13 H14 H15 H16 H17 r1 r2 H19 H20 H21;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H19; rewrite /lift_array256 tP => H19.
  move : (H19 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

move => H22 r3 r4 H25 H26 H27;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H25; rewrite /lift_array256 tP => H25.
  move : (H25 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).


+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

(* Second ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 1) = nttunpack (lift_array256 (subarray256 pkpv{2} 1)) /\
              signed_bound768_cxq pkpv{1} 256 512 2 /\
              signed_bound768_cxq pkpv{2} 256 512 2 /\ i{1} = 2).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15; do split.
+ rewrite /unpackm /unpackv tP /= => k kb.
  rewrite !initiE //= initiE //=. smt(). rewrite ifF 1:/#. rewrite ifT 1:/#.
  by rewrite initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H16 H17 H18 H19 H20 r1 r2 H21 H22 H23;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1,2: smt(nttunpack_bnd Array256.allP).
  move : H21; rewrite /lift_array256 tP => H21.
  move : (H21 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

move => H24 r3 r4 H25 H26 H27;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H13; rewrite /lift_array256 /subarray256 tP => H13.
  move : (H13 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H25; rewrite /lift_array256 /subarray256 tP => H25.
  move : (H25 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

(* Third ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 2) = nttunpack (lift_array256 (subarray256 pkpv{2} 2)) /\
              signed_bound768_cxq pkpv{1} 512 768 2 /\
              signed_bound768_cxq pkpv{2} 512 768 2).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18; do split.
+ rewrite /unpackm /unpackv tP /= => k kb.
  rewrite !initiE //= initiE //=. smt(). rewrite ifF 1:/#. rewrite ifF 1:/#.
  by rewrite initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H19 H20 H21 H22 H23 r1 r2 H24 H25 H26;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1,2: smt(nttunpack_bnd Array256.allP).
  move : H24; rewrite /lift_array256 tP => H24.
  move : (H24 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

move => H27 r3 r4 H28 H29 H30;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H13; rewrite /lift_array256 /subarray256 tP => H13.
  move : (H13 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H16; rewrite /lift_array256 /subarray256 tP => H16.
  move : (H16 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H28; rewrite /lift_array256 /subarray256 tP => H28.
  move : (H28 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().


auto => />.

move => &1 &2 ?????????????H1??H2??H3??. 
do split.
+ smt().
+ smt(). 
+ rewrite /lift_array256 /subarray256 tP in H1.
  rewrite /lift_array256 /subarray256 tP in H2.
  rewrite /lift_array256 /subarray256 tP in H3.
  rewrite /nttpackv tP => k kb.
  rewrite initiE //=.
  case (0 <= k && k < 256).
  + move => kbb.
    move : (H1 (nttpack_idx.[k]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite !initiE //=; 1..2: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite /lift_array768 /subarray256 /=.
    pose c := nttpack_idx.[k].
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().
  case (256 <= k && k < 512).
  + move => kbb ?.
    move : (H2 (nttpack_idx.[k-256]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k-256].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /lift_array768 /subarray256 /=.
    pose c := nttpack_idx.[k-256].
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-256. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

  + move => *.
    move : (H3 (nttpack_idx.[k-512]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k-512].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /lift_array768 /subarray256 /=.
    pose c := nttpack_idx.[k-512].
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-512. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

+ rewrite nttpackv_lift. by rewrite unpackvK.
+ smt().
+ smt().
move => *.
do split. 
+ smt(unpackvK).
move => *.
do split. 
+ smt().
+ smt().
+ by rewrite nttunpackv_lift. 
smt().

qed.

(***************************************************)

lemma kyber_correct_enc_0_avx2 mem _ctp _pkp : 
   equiv [ Jkem_avx2.M.__indcpa_enc_0 ~ Kyber(KHS,XOF,KPRF,H).enc_derand: 
     valid_ptr _pkp (384*3 + 32) /\
     valid_ptr _ctp (3*320+128) /\
     Glob.mem{1} = mem /\ 
     msgp{1} = m{2} /\ 
     to_uint sctp{1} = _ctp /\ 
     to_uint pkp{1} = _pkp /\
     noiseseed{1} = r{2} /\
     pk{2}.`1 = load_array1152 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 3*384)
       ==> 
     touches Glob.mem{1} mem _ctp (3*320+128) /\
     let (c1,c2) = res{2} in
     c1 = load_array960 Glob.mem{1} _ctp /\
     c2 = load_array128 Glob.mem{1} (_ctp + 960)
].
proc*.
transitivity {1} { Jkem.M.__indcpa_enc(sctp,msgp,pkp,noiseseed);} 
(={Glob.mem,msgp,pkp,noiseseed,sctp} /\
  valid_ptr _pkp (384 * 3 + 32) /\
  valid_ptr _ctp (3 * 320 + 128) /\
  Glob.mem{1} = mem /\
  to_uint sctp{1} = _ctp /\
  to_uint pkp{1} = _pkp
   ==> ={Glob.mem,r}) 
( valid_ptr _pkp (384 * 3 + 32) /\
  valid_ptr _ctp (3 * 320 + 128) /\
  Glob.mem{1} = mem /\
  msgp{1} = m{2} /\
  to_uint sctp{1} = _ctp /\
  to_uint pkp{1} = _pkp /\
  noiseseed{1} = r{2} /\
  pk{2}.`1 = load_array1152 mem _pkp /\ 
  pk{2}.`2 = load_array32 mem (_pkp + 3 * 384)
  ==>
  touches Glob.mem{1} mem _ctp (3*320+128) /\
  let (c1, c2) = r0{2} in 
      c1 = load_array960 Glob.mem{1} _ctp /\ 
      c2 = load_array128 Glob.mem{1} (_ctp + 960)); 1,2: smt();  
   last by call(kyber_correct_enc mem _ctp _pkp); auto => />. 

inline{1} 1; inline {2} 1.
admitted. 
(***************************************************)

lemma kyber_correct_enc_1_avx2 mem _pkp : 
   equiv [ Jkem_avx2.M.__indcpa_enc_1 ~ Kyber(KHS,XOF,KPRF,H).enc_derand: 
     valid_ptr _pkp (384*3 + 32) /\
     Glob.mem{1} = mem /\ 
     msgp{1} = m{2} /\ 
     to_uint pkp{1} = _pkp /\
     noiseseed{1} = r{2} /\
     pk{2}.`1 = load_array1152 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 3*384)
       ==> 
     Glob.mem{1} = mem /\
     let (c1,c2) = res{2} in
     c1 = Array960.init (fun i => res{1}.[i]) /\
     c2 = Array128.init (fun i => res{1}.[i+960])
].
proc*.
transitivity {1} { r <@ Jkem.M.__iindcpa_enc(witness,msgp,pkp,noiseseed);} 
(={Glob.mem,msgp,pkp,noiseseed} /\
  valid_ptr _pkp (384 * 3 + 32) /\
  Glob.mem{1} = mem /\
  to_uint pkp{1} = _pkp 
   ==> ={Glob.mem,r} /\ Glob.mem{1} = mem) 
( valid_ptr _pkp (384 * 3 + 32) /\
  Glob.mem{1} = mem /\
  msgp{1} = m{2} /\
  to_uint pkp{1} = _pkp /\
  noiseseed{1} = r{2} /\
  pk{2}.`1 = load_array1152 mem _pkp /\ 
  pk{2}.`2 = load_array32 mem (_pkp + 3 * 384)
  ==>
  Glob.mem{1} = mem /\
  r{1} = (Array1088.init (fun (i : int) => if 0 <= i && i < 960 then r0{2}.`1.[i] else r0{2}.`2.[i - 960])));[ by smt() | | | by call(kyber_correct_ienc mem _pkp); auto => />].
  + move => /> c1 c2. 
    rewrite !tP;split;move => *.
    + by rewrite !initiE // 1:/# /= /#.
    by rewrite !initiE //= !initiE 1:/# /= /#.

inline{1} 1; inline {2} 1.
admitted. (* this proof should be almost identical to the prev one *)


lemma kyber_correct_dec mem _ctp _skp : 
   equiv [ Jkem_avx2.M.__indcpa_dec_1 ~ Kyber(KHS,XOF,KPRF,H).dec : 
     valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2} = load_array1152 Glob.mem{1} _skp /\
     let (c1,c2) = cph{2} in
       c1 = load_array960 Glob.mem{1} _ctp /\
       c2 = load_array128 Glob.mem{1} (_ctp + 960)
       ==> 
     Glob.mem{1} = mem /\
     res{1} = oget res{2}
].
proc*.
transitivity {1} { r <@ Jkem.M.__indcpa_dec(msgp,ctp,skp);} 
(={Glob.mem,ctp,skp} /\
  valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp 
   ==> ={Glob.mem,r} /\ Glob.mem{1} = mem) 
( valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2} = load_array1152 Glob.mem{1} _skp /\
     let (c1,c2) = cph{2} in
       c1 = load_array960 Glob.mem{1} _ctp /\
       c2 = load_array128 Glob.mem{1} (_ctp + 960)
       ==> 
     Glob.mem{1} = mem /\
     r{1} = oget r{2}); 1,2: smt();  
   last by call(kyber_correct_dec mem _ctp _skp); auto => />. 

inline{1} 1; inline {2} 1.
admitted. (* this one is a lot easier *)
