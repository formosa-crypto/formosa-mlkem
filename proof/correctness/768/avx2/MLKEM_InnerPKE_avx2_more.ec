require import AllCore IntDiv List.

from Jasmin require import JModel.
from JazzEC require import Array4 Array33 Array128  Array16 Array25 Array32 Array33 Array64 Array128 Array160 Array136 Array256 Array768 Array1408 Array1410 Array1152 Array2304 Array1152 Array1184 Array2400 Array1088 Array960.
from JazzEC require import WArray512 WArray256 WArray32 WArray33 WArray128 WArray160.

require import List_extra.
require import MLKEM_Poly  MLKEM_PolyVec MLKEM_InnerPKE.
require import MLKEM_Poly_avx2_proof.
require import MLKEM_Poly_avx2_vec.
require import MLKEM_Poly_avx2_prevec.
require import MLKEM_PolyVec_avx2_proof.
require import MLKEM_PolyVec_avx2_vec.
require import MLKEMFCLib.
from JazzEC require import Jkem768_avx2 Jkem768.
require import NTT_avx2_invntt NTT_avx2_ntt NTT_avx2.
require import NTT_AVX_j_invntt NTT_AVX_j_ntt NTT_AVX_j.
require import Fq NTT_Fq NTT_AVX_Fq_ntt NTT_AVX_Fq_invntt NTT_AVX_Fq_basemul.
require import 
  MLKEM_avx2_equivs_basemul_add2 
  MLKEM_avx2_equivs_compress 
  MLKEM_avx2_equivs_compress2 
  MLKEM_avx2_equivs_csubq 
  MLKEM_avx2_equivs_decompress 
  MLKEM_avx2_equivs_decompress2 
  MLKEM_avx2_equivs_frombytes 
  MLKEM_avx2_equivs_frommont_reduce 
  MLKEM_avx2_equivs_frommsg 
  MLKEM_avx2_equivs_invntt 
  MLKEM_avx2_equivs_ntt 
  MLKEM_avx2_equivs_pointwise 
  MLKEM_avx2_equivs_polysub 
  MLKEM_avx2_equivs_polyvecadd2_reduce 
  MLKEM_avx2_equivs_tobytes 
  MLKEM_avx2_equivs_tomsg.
require import Montgomery16.
require import AVX2_Ops.
require import MLKEM_keccak_ref MLKEM_keccak_avx2.
require import MLKEM_ntt_pack_avx2 MLKEM_genmatrix_avx2 MLKEM_genmatrix_avx2_more.
require import MLKEM_InnerPKE_avx2.

from CryptoSpecs require import GFq Rq Sampling Serialization Symmetric VecMat InnerPKE768 MLKEM768 Correctness768.

import Serialization768 Symmetric768 VecMat768.

import MLKEM_Poly.
import MLKEM_PolyVec.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import NTT_Avx2.

import InnerPKE768.
import WArray128.
require import W8extra.


lemma mlkem_correct_enc_1_avx2 _pkp : 
   equiv [Jkem768_avx2.M.__indcpa_enc ~ InnerPKE768.enc_derand: 
     msgp{1} = m{2} /\  pk{1} = _pkp /\
     noiseseed{1} = coins{2} /\
     pk{2}.`1 = Array1152.init (fun i => pk{1}.[i]) /\
     pk{2}.`2 = Array32.init (fun i => pk{1}.[i+1152])
       ==> 
     let (c1,c2) = res{2} in
     c1 = Array960.init (fun i => res{1}.[i]) /\
     c2 = Array128.init (fun i => res{1}.[i+960])
].
proc*. 
transitivity {1} { r <@Jkem768.M.__indcpa_enc(ct,msgp,pk,noiseseed);} 
(={ct,msgp,pk,noiseseed}  ==> ={r}) 
( msgp{1} = m{2} /\ pk{1} = _pkp /\
     noiseseed{1} = coins{2} /\
     pk{2}.`1 = Array1152.init (fun i => pk{1}.[i]) /\
     pk{2}.`2 = Array32.init (fun i => pk{1}.[i+1152])
       ==> 
     let (c1,c2) = r{2} in
     c1 = Array960.init (fun i => r{1}.[i]) /\
     c2 = Array128.init (fun i => r{1}.[i+960]));[ by smt() | by auto | | by call(mlkem_correct_enc _pkp); auto => /> /#].

inline{1} 1; inline {2} 1. wp.

seq 45 47 : (
     (forall k, 0 <= k < 960 => ct0{1}.[k] = ct0{2}.[k]) /\
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
    lift_array256 v{1} = lift_array256 v{2}); last first. 

 call (compressequiv_1); auto => /> &1 &2 H ???rr1 rr2; rewrite !tP => ? kk *;rewrite !Array1088.initiE 1,2:/# /=; smt().

swap {2} 17 27. swap {2} 1 42.
seq 43  42 : (
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
     pos_bound768_cxq bp{1} 0 768 2 /\
     pos_bound768_cxq bp{2} 0 768 2 /\
    lift_array256 v{1} = lift_array256 v{2} /\ 
    lift_array768 bp{1} = lift_array768 bp{2}); last  first.
+ wp;call (compressequivvec); auto => />. 
  by move => &1 &2?????? rr k *;rewrite !initiE 1,2:/# /= initiE /#.

wp;conseq />.
call (reduceequiv_noperm).
ecall (polyvec_reduce_equiv_noperm (lift_array768 bp{2})).
call (addequiv_noperm 4 2 _ _) => //.
call (addequiv_noperm 2 2 _ _) => //.

have H := polyvec_add2_equiv_noperm 2 2 _ _ => //.
ecall (H (lift_array768 bp{2}) (lift_array768 ep{2})); clear H.

unroll for* {1} ^while{2}.

sp 4 3.
 
seq 16 20  : (#pre /\ ={publicseed, bp,ep,epp,v,sp_0,k} /\ ct{2} = ct0{1} /\ msgp0{2} = msgp{1} /\ pk0{2} = pk{1} /\
           s_noiseseed{2} = noiseseed0{2} /\
           pos_bound256_cxq k{1} 0 256 1 /\
           pos_bound256_cxq k{2} 0 256 1 /\
           lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
           pos_bound768_cxq pkpv{1} 0 768 2 /\
           pos_bound768_cxq pkpv{2} 0 768 2 /\
           aat{1} = nttunpackm aat{2} /\
           pos_bound2304_cxq aat{1} 0 2304 2 /\
           pos_bound2304_cxq aat{2} 0 2304 2). 
+ call (genmatrixequiv true).
  wp;call frommsgequiv_noperm. conseq />. smt().
  conseq (_: _ ==> lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\ 
       pos_bound768_cxq pkpv{1} 0 768 2 /\ pos_bound768_cxq pkpv{2} 0 768 2 /\ ={publicseed,pk,bp,ep,epp,v,sp_0,pk0}).
  auto => /> pkl pkr ??? rl rr H H0 H1 ?rr0??. 
  + rewrite tP => k kb.
    move : H; rewrite /lift_array256 tP => H.
    move : (H k kb); rewrite !mapiE //=. 
    move : H0 H1; rewrite /pos_bound256_cxq /bpos16 /= => H0 H1.
    move : (H0 k kb) (H1 k kb).
    rewrite -Zq.eq_incoeff /= qE. 
    move => HH0 HH1; rewrite !modz_small; 1,2: smt( StdOrder.IntOrder.gtr0_norm).    
    move : HH0 HH1; rewrite /to_sint /smod /= => HH0 HH1.
    rewrite  ifF. smt(W16.to_uint_cmp). 
    rewrite  ifF. smt(W16.to_uint_cmp).
    by smt(W16.to_uint_eq). 
    
  seq 10 13 : (#post /\ ={publicseed}).
  wp;sp; conseq />.
  call (polyvec_frombytes_equiv).
  by auto => />. 

  by conseq />; sim.

(* swap {1} [11..12] 2. *)

do 2!(unroll for {2} ^while). sp 0 1.
seq 12 23 : (#{/~bp{1}}pre  /\
    signed_bound768_cxq sp_0{1} 0 768 1 /\
    signed_bound768_cxq ep{1} 0 768 1 /\
    signed_bound_cxq epp{1} 0 256 1 /\
    signed_bound768_cxq sp_0{2} 0 768 1 /\
    signed_bound768_cxq ep{2} 0 768 1 /\ 
    signed_bound_cxq epp{1} 0 256 1).
+ conseq />.
  transitivity {1} { (sp_0,ep,bp,epp) <@ GetNoiseAVX2.samplenoise_enc(sp_0,ep,bp, epp,noiseseed);} 
    (noiseseed0{1} = noiseseed{2} /\ 
 ={sp_0,ep,bp,epp} ==> ={sp_0,ep,epp}) 
   (
   msgp0{2} = msgp{2} /\ noiseseed{2} = lnoiseseed{2} /\
   noiseseed0{2} = noiseseed{2} /\
   ct0{1} = ct{2} /\
   msgp0{2} = msgp{1} /\
   noiseseed0{1} = noiseseed{1} /\
   (={msgp, pk, noiseseed}) /\
   ={pk0} /\
  ={publicseed, bp, ep, epp, v, sp_0, k} /\
  s_noiseseed{2} = noiseseed0{2} /\
  pos_bound256_cxq k{1} 0 256 1 /\
  pos_bound256_cxq k{2} 0 256 1 /\
  lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
  pos_bound768_cxq pkpv{1} 0 768 2 /\
  pos_bound768_cxq pkpv{2} 0 768 2 /\
  aat{1} = nttunpackm aat{2} /\ pos_bound2304_cxq aat{1} 0 2304 2 /\ pos_bound2304_cxq aat{2} 0 2304 2
   ==> 
    ={ep, epp, sp_0} /\ lnoiseseed{2} = noiseseed{2} /\
  signed_bound768_cxq sp_0{1} 0 768 1 /\
  signed_bound768_cxq ep{1} 0 768 1 /\
  signed_bound_cxq epp{1} 0 256 1 /\
  signed_bound768_cxq sp_0{2} 0 768 1 /\ signed_bound768_cxq ep{2} 0 768 1 /\ signed_bound_cxq epp{1} 0 256 1
  );1,2: smt(). 
  + inline {2} 1. 
    by do 2!(wp; call getnoiseequiv_avx);auto => />. 
  inline {1} 1. 
  inline GetNoiseAVX2._poly_getnoise_eta1_4x.
  wp;call {1} polygetnoise_ll.
  do 7!(wp; call  getnoiseequiv). 
  wp;skip => &1 &2 [#] ->->->?->???->???->->?->->-> ????? ->??n ; rewrite andabP;split; 1:smt(). 
  move => rr1 rr2 [#] ->? sp0;rewrite andabP;split.
  + congr; 1: by
    rewrite tP => *; rewrite !initiE /= 1,2:/# /= /sp0 initiE /#.
    by rewrite /n; ring. 
  move => r1 r2 [#] ->? sp01; split .
  + congr.
    rewrite tP => *; rewrite !initiE /= 1,2:/# /= /sp01 /sp0 initiE 1:/# /= ifF 1:/# initiE 1:/# /= /#.
    by rewrite /n; ring. 

  move => ? r11 r12 [#] ->? sp011; split .
  + congr.
    by rewrite tP => *; rewrite !initiE /= 1,2:/# /= /sp011 /sp01 /sp0.
    by rewrite /n; ring. 

  move => ? r21 r22 [#] ->? sp021; split .
  + congr.
    by rewrite tP => *; rewrite !initiE /= 1,2:/#.

  move => ? r31 r32 [#] ->? sp031; split .
  + congr.
    rewrite tP => *; rewrite !initiE /= 1,2:/#  initiE 1:/# /= ifF 1:/# initiE 1:/# /= /sp021 initiE 1:/# /#. 
    by rewrite /n; ring. 

  move => ? r41 r42 [#] ->? sp041; split .
  + congr; auto.


  move => ? r81 r82 [#] ->?; do split .
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /= /#.
  + rewrite /sp021 /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /sp071 /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + by smt().


seq 1 1 : (#{/~sp_0{1}}{~sp_0{2}}pre /\ 
           lift_array768 sp_0{1} = nttunpackv (lift_array768 sp_0{2}) /\
           pos_bound768_cxq sp_0{1} 0 768 2 /\
           pos_bound768_cxq sp_0{2} 0 768 2);1: by conseq />; call (nttequiv); auto => /#.

(* First ip *)

unroll for {2} ^while.
seq 4 2 : (#{/~bp{1}}pre /\ 
              lift_array256 (subarray256 bp{1} 0) = nttunpack (lift_array256 (subarray256 bp{2} 0)) /\
              signed_bound768_cxq bp{1} 0 256 4 /\
              signed_bound768_cxq bp{2} 0 256 2 /\ w{1} = 1).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE // 1:/# /= kb /= initiE //=. 
+ rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
+ rewrite /signed_bound768_cxq => k kb; smt(). 
+ rewrite /signed_bound768_cxq => *; rewrite initiE //=; smt().
+ by smt().

move => H15 H16 H17 H18 H19 r1 r2 H20 H21 H22;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H20; rewrite /lift_array256 tP => H20.
  move : (H20 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

(* Second ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 1) = nttunpack (lift_array256 (subarray256 bp{2} 1)) /\
              signed_bound768_cxq bp{1} 256 512 4 /\
              signed_bound768_cxq bp{2} 256 512 2 /\ w{1} = 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H18 H19 H20 H21 H22 r1 r2 H23 H24 H25;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H11; rewrite /lift_array256 /subarray256 tP => H11.
  move : (H11 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1: /# /=. 
  move : H23; rewrite /lift_array256 tP => H23.
  move : (H23 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().


(* Third ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 2) = nttunpack (lift_array256 (subarray256 bp{2} 2)) /\
              signed_bound768_cxq bp{1} 512 768 4 /\
              signed_bound768_cxq bp{2} 512 768 2 /\ w{1} = 3).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H181; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H18 H19 H20 H21 H22 r1 r2 H23 H24 H25;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H13; rewrite /lift_array256 /subarray256 tP => H13.
  move : (H13 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H16; rewrite /lift_array256 /subarray256 tP => H16.
  move : (H16 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=.
  by smt(nttunpack_bnd Array256.allP Array256.initiE).  

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1:/# /=. 
  move : H23; rewrite /lift_array256 /subarray256 tP => H23.
  move : (H23 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //=.

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().


(* Fourth ip *)

seq 1 2: (#{/~v{1}}pre /\ lift_array256 v{1} = nttunpack (lift_array256 v{2}) /\
              signed_bound_cxq v{1} 0 256 4 /\
              signed_bound_cxq v{2} 0 256 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 ; do split.
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 

(* INV NTT!!! *)
seq 1 1 : (#{/~bp{2}}{~bp{1}}pre /\ lift_array768 bp{1} = lift_array768 bp{2} /\ signed_bound768_cxq bp{1} 0 768 2 /\ signed_bound768_cxq bp{2} 0 768 2).
conseq />.  call(invnttequiv). auto => />. move => &1 &2 ???????????H2??H1??H0??H??; split.
+ do split; 2,3: by smt().
  rewrite /nttunpackv.
  rewrite tP => k kb; rewrite initiE //=.
  move : H H0 H1 H2; rewrite !tP => H H0 H1 H2.
  case (0 <= k < 256).
  + move => kkb; move : (H2 k kkb). rewrite subliftsub //= => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  case (256 <= k < 512).
  + move => nkkb kkb. move : (H1 (k-256) _); 1: smt(). rewrite subliftsub //= 1: /# => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  case (512 <= k < 768).
  + move => nkkb kkb. move : (H0 (k-512) _); 1: smt(). rewrite subliftsub //= 1: /# => -> ?. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  smt().
smt().

seq 1 1 : (#{/~v{2}}{~v{1}}pre /\ lift_array256 v{1} = lift_array256 v{2} /\ signed_bound_cxq v{1} 0 256 2 /\ signed_bound_cxq v{2} 0 256 2).
conseq />.  call(polyinvnttequiv). auto => />. smt().

auto => /> /#.
qed.



lemma mlkem_correct_dec : 
   equiv [Jkem768_avx2.M.__indcpa_dec ~ InnerPKE768.dec : 
     ={sk} /\
     let (c1,c2) = cph{2} in
       c1 = Array960.init(fun i => ct{1}.[i]) /\
       c2 = Array128.init(fun i => ct{1}.[i+960])
       ==> 
     res{1} = res{2}
].
proc*.
transitivity {1} { r <@Jkem768.M.__indcpa_dec(msgp,ct,sk);} 
(={ct,sk} 
   ==> ={r}) 
( ={sk} /\
     let (c1,c2) = cph{2} in
       c1 = Array960.init(fun i => ct{1}.[i]) /\
       c2 = Array128.init(fun i => ct{1}.[960+i])
       ==> 
     r{1} = r{2}); 1,2: smt();  
   last by call(mlkem_correct_dec); auto => />.

inline{1} 1; inline {2} 1.
wp; ecall (tomsgequiv_noperm).
call (reduceequiv_noperm).
call (subequiv_noperm 2 2 _ _) => //.
call(polyinvnttequiv).
call pointwiseequiv.
call(nttequiv).
call (polyvec_frombytes_equiv).
ecall (poly_decompress_equiv).
wp; call (polyvec_decompress_equiv).
auto => />.
move => *;do split;1,2:smt().
move => *;do split;1..4:smt().
move => *;do split;1:smt().
move => *;do split;1..4:smt().
qed.
