require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array1536 Array1408 Array1410 Array1024 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8.
from JazzEC require import WArray512 WArray32 WArray16.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem1024.
from JazzEC require import Jkem1024_avx2.
require import MLKEM_PolyVec_avx2_prevec.
require import MLKEM_Poly_avx2_prevec.
require import NTT_avx2.
require import Fq_avx2.
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
lemma polyvec_decompress_equiv  :
    equiv [Jkem1024_avx2.M.__i_polyvec_decompress ~  Jkem1024.M.__i_polyvec_decompress  :
             arg{1}=arg{2}
              ==>
             lift_array1024 res{1} = lift_array1024 res{2} /\
             pos_bound1024_cxq res{1} 0 1024 1 /\
             pos_bound1024_cxq res{2} 0 1024 1 ].
admitted.

equiv compressequivvec  : 
 Jkem1024_avx2.M.__i_polyvec_compress ~  Jkem1024.M.__i_polyvec_compress :
     pos_bound1024_cxq a{1} 0 1024 2 /\
     pos_bound1024_cxq a{2} 0 1024 2 /\
    lift_array1024 a{1} = lift_array1024 a{2} 
    ==> 
    res{2} = Array1408.init (fun i => res{1}.[i]).
admitted.

lemma poly_decompress_equiv  : 
    equiv [Jkem1024_avx2.M._i_poly_decompress ~  Jkem1024.M._i_poly_decompress  :
             a{1} = ap{2}
              ==>
             lift_array256 res{1} = lift_array256 res{2} /\
             pos_bound256_cxq res{1} 0 256 1 /\
             pos_bound256_cxq res{2} 0 256 1 ].
admitted.

equiv compressequiv_1 : 
 Jkem1024_avx2.M._i_poly_compress ~  Jkem1024.M._i_poly_compress :
     pos_bound256_cxq a{1} 0 256 2 /\
     pos_bound256_cxq a{2} 0 256 2 /\
    lift_array256 a{1} = lift_array256 a{2} 
    ==> 
    res.`1{1} = res.`1{2}.
admitted.

lemma polyvec_frombytes_equiv :
    equiv [Jkem1024_avx2.M.__i_polyvec_frombytes ~Jkem1024.M.__i_polyvec_frombytes :
             ={ap} ==>
             lift_array1024 res{1} = nttunpackv (lift_array1024 res{2}) /\
             pos_bound1024_cxq res{1} 0 1024 2 /\
             pos_bound1024_cxq res{2} 0 1024 2 ].
admitted.



lemma subequiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
    equiv [Jkem1024_avx2.M._poly_sub ~Jkem1024.M._poly_sub :
      lift_array256 ap{1} = lift_array256 ( ap{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
      signed_bound_cxq ap{2} 0 256 ab /\ 
      signed_bound_cxq bp{2} 0 256 bb /\
      signed_bound_cxq ap{1} 0 256 ab /\ 
      signed_bound_cxq bp{1} 0 256 bb
           ==> lift_array256 res{1} = lift_array256  ( res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab + bb) /\
               signed_bound_cxq res{2} 0 256 (ab + bb) 
              ].
move => boundab boundbb; proc => /=.
exists* ap{2}, bp{2}. elim* => _ap2 _bp2.
while {2} (#pre /\ 0<= i{2} <= 256 /\ forall k, 0<=k<i{2} => rp{2}.[k] = _ap2.[k] -_bp2.[k]) (256 -  i{2}); 
 1: by move => &1 ?; auto => />;smt(Array256.set_neqiE Array256.set_eqiE).

exists* ap{1}, bp{1}. elim* => _ap1 _bp1.
while {1} (#pre /\ 0<= i{1} <= 16 /\ forall k, 0<=k<16*i{1} => rp{1}.[k] = _ap1.[k] -_bp1.[k]) (16 - i{1}); last first.
+ auto => />.
  move => &1 &2 H H0 H1 H2 H3 H4; split; 1: smt(). 
  move => i1 res1; split; 1: smt().
  move => ??? res1v; split; 1: smt().
  move => i2 res2; split; 1: smt().
  move => ??? res2v.
  do split; first last.
  + do 2!( move : H3 H4;rewrite /signed_bound_cxq => H3 H4 k kb; rewrite res1v // 1:/#; 
    move : (H3 k _) (H4 k _)=> // ;
    rewrite /b16 qE to_sintB_small /= /#).
  + do 2!( move : H1 H2;rewrite /signed_bound_cxq => H1 H2 k kb; rewrite res2v // 1:/#; 
    move : (H1 k _) (H2 k _)=> // ;
    rewrite /b16 qE to_sintB_small /= /#).
  rewrite /lift_array256 tP => k kbl; rewrite !mapiE //= res1v 1:/# res2v 1: /#.
  rewrite !to_sintB_small => /=.
  + do 2!( move : H3 H4;rewrite /signed_bound_cxq => H3 H4; 
    move : (H3 k _) (H4 k _)=> // ;
    rewrite /b16 qE /= /#).
  + do 2!( move : H1 H2;rewrite /signed_bound_cxq => H1 H2; 
    move : (H1 k _) (H2 k _)=> // ;
    rewrite /b16 qE /= /#).
   move : H H0; rewrite /lift_array256 !tP => H H0.
   move : (H k _); 1: smt(); rewrite !mapiE //=.  
   move : (H0 k _); 1: smt(); rewrite !mapiE //=.  
   rewrite -!eq_incoeff /#.

move => &1 ?; auto => /> => &2 ??????????; do split; 1,2,4: smt().

move => k kbl kbh; rewrite initiE /= 1: /#.
case (k < 16*i{2}); 1: by move => kdif; rewrite set_get_diff // /#. 
move => *; rewrite set_get_eq //= 1,2:/#.
rewrite /VPSUB_16u16; rewrite map2bE 1: /# /=.
congr.
+ rewrite get256E /= ifT 1:/# /= !initiE /= 1,2:/# !initiE 1,2:/# /=.
  rewrite -(W16.to_uintK (_ap1.[k])) of_uint_pack2  /= -iotaredE /=.
  have -> : (32 * i{2} + 2 * (k %% 16)) %/ 2 = k by smt().
  have -> : (32 * i{2} + 2 * (k %% 16)) %% 2 = 0 by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %/ 2 = k by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %% 2 = 1 by smt().
  rewrite !bits8_div //=. 
  congr.
  apply W2u8.Pack.ext_eq => i ib.
  case (i = 0); 1:  by move => -> /=; apply W8.to_uint_eq; smt(). 
  move => *; have -> : i = 1 by smt().
  apply W8.to_uint_eq; smt(). 

congr.
rewrite get256E /= ifT 1:/# /= !initiE /= 1,2:/# !initiE 1,2:/# /=.
  rewrite -(W16.to_uintK (_bp1.[k])) of_uint_pack2  /= -iotaredE /=.
  have -> : (32 * i{2} + 2 * (k %% 16)) %/ 2 = k by smt().
  have -> : (32 * i{2} + 2 * (k %% 16)) %% 2 = 0 by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %/ 2 = k by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %% 2 = 1 by smt().
  rewrite !bits8_div //=. 
  congr.
  apply W2u8.Pack.ext_eq => i ib.
  case (i = 0); 1:  by move => -> /=; apply W8.to_uint_eq; smt(). 
  move => *; have -> : i = 1 by smt().
  apply W8.to_uint_eq; smt(). 
qed.

lemma to_sintInj : injective W16.to_sint. 
rewrite /injective /to_sint /smod /=. 
move => x y. move => HHH. have : to_uint x = to_uint y; last by smt(W16.to_uint_eq).
move : HHH; move : (W16.to_uint_cmp x); move :  (W16.to_uint_cmp y) => /=; smt().
qed.

equiv frommontequiv : 
 Jkem1024_avx2.M._poly_frommont ~  Jkem1024.M._poly_frommont :
    lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 2 /\ 
    signed_bound_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_frommont(rp); }
     (={rp} ==> ={r}) 
     (lift_array256  rp{1} = nttunpack (lift_array256 rp{2}) ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    signed_bound_cxq r{1} 0 256 2 /\ 
    signed_bound_cxq r{2} 0 256 2); 1,2: smt(). 
symmetry. call prevec_eq_poly_frommont. auto => />.

ecall{2} (MLKEM_Poly.poly_frommont_corr (map W16.to_sint rp{2})).
ecall{1} (MLKEM_PolyAVX.poly_frommont_corr (map W16.to_sint rp{1})).

auto => />.
move => &1 &2 Hvals r1 H.

split.  
+ by move => k kbl kbh ;rewrite mapE //= initiE //=.
move => H1 _r0 H0.
move : H; rewrite tP => H.

move : H H0;  rewrite qE /Fq.SignedReductions.R /= => H H0.

do split. 
+ rewrite tP => k kb.
  rewrite /lift_array256 /= mapiE //= /nttunpack initiE //=.
  pose a:= nttunpack_idx.[k].
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  move : (H k kb); rewrite !mapiE //= => ->.
  move : (H0 (nttunpack_idx.[k]) _). move : nttunpack_bnd; rewrite allP /#. 
  rewrite -/a => ->.
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{1}.[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{1}.[k] * 1353 && to_sint rp{1}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  move => [corr11 corr12].
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{2}.[a] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{2}.[a] * 1353 && to_sint rp{2}.[a] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  move => [corr21 corr22].
  move : Hvals; rewrite /lift_array256 tP => Hvals.
  move : (Hvals k kb).
  rewrite /lift_array256 /= mapiE //= /nttunpack initiE //=.
  rewrite -/a.
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  rewrite -!Zq.eq_incoeff /= /#.

+ rewrite /signed_bound_cxq /= => k kb.
  move : (H k kb); rewrite !mapiE //= => HH.
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{1}.[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{1}.[k] * 1353 && to_sint rp{1}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  smt().

+ rewrite /signed_bound_cxq /= => k kb.
  move : (H0 k kb); rewrite !mapiE //= => HH.
  move : (Fq.SignedReductions.SREDCp_corr ((map W16.to_sint rp{2}).[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  rewrite !mapiE //=.
  have -> /= : -109084672 <= to_sint rp{2}.[k] * 1353 && to_sint rp{2}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  smt().

qed.

equiv reduceequiv : 
 Jkem1024_avx2.M.__poly_reduce ~  Jkem1024.M.__poly_reduce :
    lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    pos_bound256_cxq res{1} 0 256 2 /\ 
    pos_bound256_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_reduce(rp); }
     (={rp} ==> ={r}) 
     (lift_array256 rp{1} = nttunpack (lift_array256 rp{2}) ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    pos_bound256_cxq r{1} 0 256 2 /\ 
    pos_bound256_cxq r{2} 0 256 2);1,2: smt(). 
symmetry. call prevec_eq_poly_reduce. auto => />.

ecall{2} (MLKEM_Poly.poly_reduce_corr (lift_array256 rp{2})).
ecall{1} (MLKEM_PolyAVX.poly_reduce_corr (lift_array256 rp{1})).

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

equiv reduceequiv_noperm : 
 Jkem1024_avx2.M.__poly_reduce ~  Jkem1024.M.__poly_reduce :
    lift_array256 arg{1} = lift_array256 arg{2} ==> 
    lift_array256 res{1} = lift_array256 res{2} /\
    pos_bound256_cxq res{1} 0 256 2 /\ 
    pos_bound256_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_reduce(rp); }
     (={rp} ==> ={r}) 
     (lift_array256 rp{1} =  (lift_array256 rp{2}) ==> 
    lift_array256 r{1} =  (lift_array256 r{2}) /\
    pos_bound256_cxq r{1} 0 256 2 /\ 
    pos_bound256_cxq r{2} 0 256 2); 1,2: smt(). 
symmetry. call prevec_eq_poly_reduce. auto => />.

ecall{2} (MLKEM_Poly.poly_reduce_corr (lift_array256 rp{2})).
ecall{1} (MLKEM_PolyAVX.poly_reduce_corr (lift_array256 rp{1})).

auto => />.
move => &1 &2; rewrite /lift_array256 tP => Hvals r1; rewrite tP => r1val r1rng r2; rewrite tP => r2val r2rng.

rewrite tP => k kb ;rewrite mapE //= initiE //=.
rewrite !mapiE /=;1: smt().  
move : (Hvals k kb). rewrite mapiE //=.
rewrite  mapiE //=. 
smt(Array256.mapiE).
qed.


import Zq. 

require import NTT_AVX_j.

equiv basemulequiv : 
 Jkem1024_avx2.M._poly_basemul ~Jkem1024.M._poly_basemul :
    lift_array256 ap{1} = nttunpack (lift_array256 ap{2}) /\
    lift_array256 bp{1} = nttunpack (lift_array256 bp{2}) /\
    signed_bound_cxq ap{1} 0 256 2 /\  
    signed_bound_cxq bp{1} 0 256 2 /\
    signed_bound_cxq ap{2} 0 256 2 /\  
    signed_bound_cxq bp{2} 0 256 2
                              ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 1 /\ 
    signed_bound_cxq res{2} 0 256 2.
proof.
proc*; simplify.
ecall{2} (poly_basemul_correct (lift_array256 ap{2}) (lift_array256 bp{2})).
ecall{1} (poly_basemul_avx2_ph (nttpack (lift_array256 ap{1})) (nttpack (lift_array256  bp{1}))).
auto => />.
move => &1 &2 /> E1 E2 *. 
rewrite !nttpackK => /> r1 -> Hb1 r2 Hb2 ->.
by rewrite E1 E2 !nttunpackK.
qed.

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
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
   by move => abb bbb _a _b; apply (MLKEM_PolyAVX.poly_add_corr _a _b ab bb abb bbb).

lemma addequiv  (ab1 bb1 ab2 bb2 : int):
    0 <= ab1 && ab1 <= 6 =>
    0 <= ab2 && ab2 <= 6 =>
    0 <= bb1 && bb1 <= 3 =>
    0 <= bb2 && bb2 <= 3 =>
    equiv [Jkem1024_avx2.M._poly_add2 ~Jkem1024.M._poly_add2 :
      lift_array256 rp{1} = lift_array256 (nttunpack rp{2}) /\
      lift_array256 bp{1} = lift_array256 (nttunpack bp{2}) /\
      signed_bound_cxq rp{2} 0 256 ab2 /\ 
      signed_bound_cxq bp{2} 0 256 bb2 /\
      signed_bound_cxq rp{1} 0 256 ab1 /\ 
      signed_bound_cxq bp{1} 0 256 bb1
           ==> lift_array256 res{1} = lift_array256  (nttunpack res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab1 + bb1) /\
               signed_bound_cxq res{2} 0 256 (ab2 + bb2) 
              ].
proof.
move => abb1 abb2 bbb1 bbb2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_add2(rp,bp); }
     (={rp,bp} ==> ={r}) 
     (lift_array256 rp{1} = lift_array256 (nttunpack rp{2}) /\
      lift_array256 bp{1} = lift_array256 (nttunpack bp{2}) /\
    signed_bound_cxq rp{1} 0 256 ab1 /\  
    signed_bound_cxq bp{1} 0 256 bb1 /\
    signed_bound_cxq rp{2} 0 256 ab2 /\  
    signed_bound_cxq bp{2} 0 256 bb2
                              ==> 
    lift_array256 r{1} = lift_array256 (nttunpack r{2}) /\
    signed_bound_cxq r{1} 0 256 (ab1+bb1) /\ 
    signed_bound_cxq r{2} 0 256 (ab2+bb2)); 1,2: smt(). 
symmetry. call prevec_eq_poly_add2. auto => />.

have Hright :=  (poly_add_correct_impl ab2 bb2 abb2 bbb2).
ecall{2} (Hright (lift_array256 rp{2}) (lift_array256 bp{2})).
have Hleft :=  (poly_add_corr_avx_impl ab1 bb1 abb1 bbb1).
ecall{1} (Hleft (lift_array256 rp{1}) (lift_array256  bp{1})).

auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 r2 H6 H7 r1 H8 H9.
rewrite /lift_array256 tP => k kb.
rewrite !mapiE //=.
rewrite /nttunpack initiE //=.
pose a:= nttunpack_idx.[k].
rewrite H7 // H9; 1: smt(nttunpack_bnd Array256.allP).
rewrite /lift_array256 !mapiE //=;1,2: smt(nttunpack_bnd Array256.allP). 
rewrite /lift_array256 !tP in H0.
rewrite /lift_array256 !tP in H1.
move : (H0 k kb); rewrite !mapiE //=.
move : (H1 k kb); rewrite !mapiE //=.
smt(Array256.initiE).
qed.

lemma addequiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
    equiv [Jkem1024_avx2.M._poly_add2 ~Jkem1024.M._poly_add2 :
      lift_array256 rp{1} = lift_array256 ( rp{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
      signed_bound_cxq rp{2} 0 256 ab /\ 
      signed_bound_cxq bp{2} 0 256 bb /\
      signed_bound_cxq rp{1} 0 256 ab /\ 
      signed_bound_cxq bp{1} 0 256 bb
           ==> lift_array256 res{1} = lift_array256  ( res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab + bb) /\
               signed_bound_cxq res{2} 0 256 (ab + bb) 
              ].
move => abb bbb.
proc*.  
transitivity {1} { r <@ Mprevec.poly_add2(rp,bp); }
     (={rp,bp} ==> ={r}) 
     (lift_array256 rp{1} = lift_array256 ( rp{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
    signed_bound_cxq rp{1} 0 256 ab /\  
    signed_bound_cxq bp{1} 0 256 bb /\
    signed_bound_cxq rp{2} 0 256 ab /\  
    signed_bound_cxq bp{2} 0 256 bb
                              ==> 
    lift_array256 r{1} = lift_array256 ( r{2}) /\
    signed_bound_cxq r{1} 0 256 (ab+bb) /\ 
    signed_bound_cxq r{2} 0 256 (ab+bb)); 1,2: smt().
symmetry. call prevec_eq_poly_add2. auto => />.

have Hright :=  (poly_add_correct_impl ab bb abb bbb).
ecall{2} (Hright (lift_array256 rp{2}) (lift_array256 bp{2})).
have Hleft :=  (poly_add_corr_avx_impl ab bb abb bbb).
ecall{1} (Hleft (lift_array256 rp{1}) (lift_array256  bp{1})).

auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 r2 H6 H7 r1 H8 H9.
rewrite /lift_array256 tP => k kb.
rewrite !mapiE //=.
rewrite H7 // H9 /#.
qed.

equiv frommsgequiv_noperm  : 
 Jkem1024_avx2.M._i_poly_frommsg ~  Jkem1024.M._i_poly_frommsg :
    ={ap} ==> 
    lift_array256 res{1} = lift_array256 res{2} /\
    pos_bound256_cxq res{1} 0 256 1 /\ 
    pos_bound256_cxq res{2} 0 256 1.
admitted.

lemma compress_poly_rng i xs :
  1 <= i < 12 =>
  all (fun (x : int) => 0 <= x < 2^i) (compress_poly i xs).
rewrite /compress_poly /map allP => Hi j Hj. rewrite !initiE //=. rewrite compress_rng //. qed.

equiv tomsgequiv_noperm  : 
 Jkem1024_avx2.M._i_poly_tomsg ~  Jkem1024.M._i_poly_tomsg :
    lift_array256 a{1} = lift_array256 a{2} /\
    pos_bound256_cxq a{1} 0 256 2 /\ 
    pos_bound256_cxq a{2} 0 256 2 ==>
    res{1}.`1 = res{2}.`1.
admitted.


lemma polyvec_tobytes_equiv :
    equiv [Jkem1024_avx2.M.__i_polyvec_tobytes ~Jkem1024.M.__i_polyvec_tobytes :
             pos_bound1024_cxq a{1} 0 1024 2 /\
             pos_bound1024_cxq a{2} 0 1024 2 /\
             lift_array1024 a{1} = nttunpackv (lift_array1024 a{2}) ==> ={res} ].
admitted.


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

equiv pointwiseequiv : 
 Jkem1024_avx2.M.__polyvec_pointwise_acc ~  Jkem1024.M.__polyvec_pointwise_acc :
    lift_array1024 arg{1}.`2 = nttunpackv (lift_array1024 arg{2}.`1) /\
    lift_array1024 arg{1}.`3 = nttunpackv (lift_array1024 arg{2}.`2) /\
    signed_bound1024_cxq arg{1}.`2 0 1024 2 /\
    signed_bound1024_cxq arg{1}.`3 0 1024 2 /\
    signed_bound1024_cxq arg{2}.`1 0 1024 2 /\
    signed_bound1024_cxq arg{2}.`2 0 1024 2
    ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 4 /\ 
    signed_bound_cxq res{2} 0 256 2.
proof.
proc => /=.
seq 2 3 :(#pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 1 /\
         signed_bound_cxq r{2} 0 256 2).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H k _); 1: smt(). rewrite !initiE//= 1:/# kb /=.
  rewrite /nttunpack !mapiE //= 1:/# !initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 k _); 1: smt(). rewrite !initiE//= 1:/# kb /=.
  rewrite /nttunpack !mapiE //= 1:/# !initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=.
move : H2; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=.
+ move : H3; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=.
move : H4; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=.

unroll for {1} 2; unroll for {2} 2.
seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 1 /\
         signed_bound_cxq t{2} 0 256 2).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H (256+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifT 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (256+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifT 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=;1:smt().

seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 2 /\
         signed_bound_cxq r{2} 0 256 4).
have Hcall:= addequiv 1 1 2 2 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10. do split. 
+ rewrite lift256_nttunpack; apply H5.
+ rewrite lift256_nttunpack; apply H8.
move => ?? r2 r1 ???.
rewrite -lift256_nttunpack;1: assumption.

seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 1 /\
         signed_bound_cxq t{2} 0 256 2).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H (512+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /= ifF 1:/# ifT 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (512+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /= ifF 1:/# ifT 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=;1: smt().


seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 3 /\
         signed_bound_cxq r{2} 0 256 6).
have Hcall:= addequiv 2 1 4 2 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 ????????????. do split. 
+ rewrite lift256_nttunpack;1: assumption.
+ rewrite lift256_nttunpack;1: assumption.
move => ?? r1 r2 ???.
rewrite -lift256_nttunpack;1: assumption.

seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 1 /\
         signed_bound_cxq t{2} 0 256 2).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H (768+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /= ifF 1:/# ifF 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (768+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /= ifF 1:/# ifF 1:/# /nttunpack !mapiE //= 1:/#  !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array1024;smt(Array1024.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound1024_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=;1: smt().


seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 4 /\
         signed_bound_cxq r{2} 0 256 8).
have Hcall:= addequiv 3 1 6 2 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 ????????????. do split. 
+ rewrite lift256_nttunpack;1: assumption.
+ rewrite lift256_nttunpack;1: assumption.
move => ?? r1 r2 ???.
rewrite -lift256_nttunpack;1: assumption.

ecall{2} (MLKEM_Poly.poly_reduce_corr (lift_array256 r{2})).
auto => />.
move => &1 &2 ?????? H H1 ? rr.
move: H; rewrite /lift_array256 => H H2 ?.
split.
 by rewrite H H2.
smt().
qed.

equiv nttequiv :
Jkem1024_avx2.M.__polyvec_ntt ~Jkem1024.M.__polyvec_ntt : 
   lift_array1024 arg{1} = lift_array1024 arg{2} /\ 
   signed_bound1024_cxq arg{1} 0 1024 2 /\ 
   signed_bound1024_cxq arg{2} 0 1024 2 ==>
   lift_array1024 res{1} = nttunpackv (lift_array1024 res{2}) /\ 
   pos_bound1024_cxq res{1} 0 1024 2 /\ 
   pos_bound1024_cxq res{2} 0 1024 2.
proc *. 
ecall {2} (polyvec_ntt_corr r{2}) => /=.
conseq />;1: smt().
ecall {1} (polyvec_ntt_avx2_corr r{1}) => /=.
auto => /> &1 &2 HH?? r H H0 r2 H1 H2. 
have  : lift_polyvec (nttpackv r) = lift_polyvec r2.
+ rewrite -H1 -H;congr.
  rewrite /lift_polyvec KMatrix.Vector.eq_vectorP => k kb.
  rewrite !KMatrix.Vector.offunvE //=.
  rewrite /lift_array1024 tP in HH.
  rewrite /subarray256 /lift_array256 tP => i ib.
  move : (HH (k*256+i) _); 1: by smt().
  rewrite !mapiE //= 1,2: /# !initiE //= /#.
rewrite /lift_polyvec /lift_array1024 tP KMatrix.Vector.eq_vectorP => H3 k kb. 
rewrite !mapiE //=.
case (0<=k<256).
+ move => kbb; move : (H3 0 _) => //; rewrite !KMatrix.Vector.offunvE //=.
  rewrite /nttpackv /nttunpackv initiE//= kbb /= /nttunpack initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  move : (HHH a _); 1: smt(). 
  rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/#.
  rewrite initiE//= 1:/# initiE//= 1:/#. 
  pose b := nttpack_idx.[a].
  rewrite ifT 1:/# /nttpack initiE//= 1:/# initiE//= 1:/# mapiE //= 1:/#. 
  move : nttpack_idxK; rewrite allP => Hidx.
  move : (Hidx k _)=>//; smt(mem_iota).

case (256 <= k < 512).
+ move => kbb ?; move : (H3 1 _) => //; rewrite !KMatrix.Vector.offunvE //=.
  rewrite /nttpackv /nttunpackv /= /nttpack /nttunpack initiE//=.
  rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
  rewrite ifF //= ifT //= initiE //= 1:/#.
  pose a := nttunpack_idx.[k-256].
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  rewrite initiE //= 1: /# !mapiE //= 1: /#. 
  move : (HHH (a) _); 1: smt(). 
  rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/# initiE//= 1:/#.
  rewrite ifF 1: /# initiE//= 1:/# initiE//= 1:/#. 
  rewrite ifT 1: /#. 
  pose b := nttpack_idx.[a].
  move : nttpack_idxK; rewrite allP => Hidx.
  move : (Hidx (k-256) _)=>//; smt(mem_iota).

case (512 <= k < 768).
+ move => kbb ?; move : (H3 2 _) => //; rewrite !KMatrix.Vector.offunvE //=.
  rewrite /nttpackv /nttunpackv /= /nttpack /nttunpack initiE//=.
  rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
  rewrite ifF  1:/# ifF 1:/# ifT 1:/# initiE //= 1:/#.
  pose a := nttunpack_idx.[k-512].
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  rewrite initiE //= 1: /# !mapiE //= 1: /#. 
  move : (HHH (a) _); 1: smt(). 
  rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/# initiE//= 1:/#.
  rewrite ifF 1: /# ifF 1:/# initiE//= 1:/# initiE//= 1:/#. 
  rewrite ifT 1: /#. 
  pose b := nttpack_idx.[a].
  move : nttpack_idxK; rewrite allP => Hidx.
  move : (Hidx (k-512) _)=>//; smt(mem_iota).

move => *; move : (H3 3 _) => //; rewrite !KMatrix.Vector.offunvE //=.
rewrite /nttpackv /nttunpackv /= /nttpack /nttunpack initiE//=.
rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
rewrite ifF  1:/# ifF 1:/# ifF 1:/# initiE //= 1:/#.
pose a := nttunpack_idx.[k-768].
move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
rewrite initiE //= 1: /# !mapiE //= 1: /#. 
move : (HHH (a) _); 1: smt(). 
rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/# initiE//= 1:/#.
rewrite ifF 1: /# ifF 1:/# ifF 1:/# initiE//= 1:/#. 
pose b := nttpack_idx.[a].
rewrite initiE//=  1:/# . 
move : nttpack_idxK; rewrite allP => Hidx.
move : (Hidx (k-768) _)=>//; smt(mem_iota).
qed.

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
