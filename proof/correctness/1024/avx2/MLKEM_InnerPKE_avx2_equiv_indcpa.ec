require import AllCore IntDiv List.

from Jasmin require import JModel.
from JazzEC require import Array4 Array33 Array128  Array16 Array25 Array32 Array33 Array64 Array128 Array160 Array136 Array256 Array1024 Array1408 Array1410 Array1536 Array4096 Array1536 Array1568.
from JazzEC require import WArray512 WArray256 WArray32 WArray33 WArray128 WArray160.

require import List_extra.
require import MLKEM_Poly  MLKEM_PolyVec MLKEM_InnerPKE.
require import MLKEM_Poly_avx2_proof.
require import MLKEM_Poly_avx2_vec.
require import MLKEM_Poly_avx2_prevec.
require import MLKEM_PolyVec_avx2_proof.
require import MLKEM_PolyVec_avx2_vec.
require import MLKEMFCLib.
from JazzEC require import Jkem1024_avx2 Jkem1024.
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

from CryptoSpecs require import GFq Rq Sampling Serialization Symmetric VecMat InnerPKE1024 MLKEM1024 Correctness1024.

import Serialization1024 Symmetric1024 VecMat1024.

import MLKEM_Poly.
import MLKEM_PolyVec.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import NTT_Avx2.

import WArray128.
require import W8extra.
import InnerPKE1024.

lemma mlkem_correct_kg_avx2   : 
   equiv [Jkem1024_avx2.M.__indcpa_keypair ~ InnerPKE1024.kg_derand : 
       randomnessp{1} = coins{2}  
        ==> 
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk = res{1}.`2 /\
         t = Array1536.init (fun i => res{1}.`1.[i])  /\
         rho = Array32.init (fun i => res{1}.`1.[1536+i])].
proc*.
transitivity {1} {r <@Jkem1024.M.__indcpa_keypair(pk, sk, randomnessp);} 
(={pk,sk,randomnessp} ==> ={r}) 
( randomnessp{1} = coins{2}  
        ==> 
       let (pk,sk) = r{2} in let (t,rho) = pk in
         sk = r{1}.`2 /\
         t = Array1536.init (fun i => r{1}.`1.[i])  /\
         rho = Array32.init (fun i => r{1}.`1.[1536+i]));1,2:smt(); last by 
  call(mlkem_correct_kg); auto => />  [r11 r12] [[r211 r212] r22] /= => [#] H H0 H1 r1 r2 [<-<-] r3 r4 [<-<-];
  smt(Array1536.tP Array1536.initiE Array32.tP Array32.initiE).  


inline{1} 1; inline {2} 1. sim 41 33. 

call (polyvec_tobytes_equiv).
call (polyvec_tobytes_equiv).
wp;conseq />.
ecall (polyvec_reduce_equiv (lift_array1024 pkpv{2})).

have H := polyvec_add2_equiv 2 2 _ _;1,2:smt().
ecall (H (lift_array1024 pkpv{2}) (lift_array1024 e{2})); clear H.

unroll for* {1} ^while{3}.
(*unroll for* {1} 37.*)

sp 3 3.

seq 16 16  : (#pre /\ ={publicseed, noiseseed,e,skpv,pkpv}).

 sp; conseq />.
 sim 3 3. 
 ecall{2} (sha3_512_33_64 inbuf{1}).
 ecall{1} (sha3_512A_A33_ph inbuf{1}) => /=.
 wp; while (={i, inc, randomnessp0, inbuf}); first by auto.
 auto => />  ???? inbuf HH r.
   rewrite /SHA3_512_33_64 /=.
 rewrite !tP => H1 H2 i ?.
 case: (0 <= i < 32) => C.
  move: (H1 i _); first done.
  rewrite initiE 1:/# /= !get_of_list 1:/# /= nth_take 1,2:/#   => ->.
   rewrite -(get_to_list) HH; smt (size_SQUEEZE1600 nth_change_dfl).
 move: (H2 (i-32) _); first smt().
 rewrite initiE 1:/# get_of_list 1:/# nth_drop 1..2:/# /= => ->.    
  rewrite -(get_to_list) HH; smt (size_SQUEEZE1600 nth_change_dfl).


seq 2 2 : (#pre /\ aa{1} = nttunpackm aa{2} /\
           pos_bound4096_cxq aa{1} 0 4096 2 /\
           pos_bound4096_cxq aa{2} 0 4096 2); 1: by 
   conseq />; call (genmatrixequiv false); auto => />.

(* swap {1} [11..12] 2. *)
do 2!(unroll for {2} ^while).
seq 12 26 : (#pre  /\
    signed_bound1024_cxq skpv{1} 0 1024 1 /\
    signed_bound1024_cxq e{1} 0 1024 1 /\
    signed_bound1024_cxq skpv{2} 0 1024 1 /\
    signed_bound1024_cxq e{2} 0 1024 1). 
+ conseq />.
  transitivity {1} { (skpv,e) <@ GetNoiseAVX2.sample_noise_kg(skpv,e,noiseseed);} (={noiseseed,skpv,pkpv,e} ==> ={skpv,e}) 
   ((
   (pk0{2} = pk{2} /\
    sk0{2} = sk{2} /\
    randomnessp0{2} = randomnessp{2} /\
    pk0{1} = pk{1} /\
    sk0{1} = sk{1} /\
    randomnessp0{1} = randomnessp{1} /\
    ={pk, sk, randomnessp} /\
   ={publicseed, noiseseed, e, skpv, pkpv}) /\
  aa{1} = nttunpackm aa{2} /\ pos_bound4096_cxq aa{1} 0 4096 2 /\ pos_bound4096_cxq aa{2} 0 4096 2)

   ==> 
    ={skpv, e} /\
  signed_bound1024_cxq skpv{1} 0 1024 1 /\
  signed_bound1024_cxq e{1} 0 1024 1 /\ signed_bound1024_cxq skpv{2} 0 1024 1 /\ signed_bound1024_cxq e{2} 0 1024 1
  ); 1,2:smt().
   
  + inline {2} 1;do 2!(wp; call getnoiseequiv_avx);auto => />. 
  inline {1} 1. inline GetNoiseAVX2._poly_getnoise_eta1_4x.
  wp;do 8!(wp; call  getnoiseequiv). 
  wp;skip  => &1 &2 [#] ????????????????R? => /=;do split.
  +  rewrite tP => k kb; rewrite !initiE //=/#.
  +  by smt().
  move => ?R0??; do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /#.
  + by smt().
  move => ?R1??. rewrite !andabP;do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /=  initiE 1:/# /=  /#.
  + by smt().
  move => ?R2?.  rewrite !andabP;do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /=  initiE 1:/# /=  initiE 1:/# /=  /#.
  + by smt().
  move => ?R3?; do split.
  +  rewrite tP => k kb; rewrite !initiE //=/#.
  + by smt().
  move => ?R4??; do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /=  /#.
  + by smt().
  move => ?R5??. rewrite !andabP;do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /=  /#.
  + by smt().
  move => ?R6?; rewrite !andabP;do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /=  initiE 1:/# /=  /#.
  + by smt().
  move => ?R7?;do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /=  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /=  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.

  + rewrite /signed_bound1024_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound1024_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound1024_cxq => x xb /=.
    rewrite !andabP !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound1024_cxq => x xb /=.
    rewrite !andabP !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().

seq 2 2 : (#{/~skpv{1}}{~e{1}}{~skpv{2}}{~e{2}}pre /\ 
           lift_array1024 skpv{1} = nttunpackv (lift_array1024 skpv{2}) /\
           lift_array1024 e{1} = nttunpackv (lift_array1024 e{2}) /\
           pos_bound1024_cxq skpv{1} 0 1024 2 /\
           pos_bound1024_cxq skpv{2} 0 1024 2 /\
           pos_bound1024_cxq e{1} 0 1024 2 /\
           pos_bound1024_cxq e{2} 0 1024 2); 1: 
 by  conseq />; call (nttequiv); call (nttequiv); auto => /> /#.

(* First ip *)
unroll for {2} ^while.
seq 6 4: (#{/~pkpv{2}}pre /\ 
              lift_array256 (subarray256 pkpv{1} 0) = nttunpack (lift_array256 (subarray256 pkpv{2} 0)) /\
              signed_bound1024_cxq pkpv{1} 0 256 2 /\
              signed_bound1024_cxq pkpv{2} 0 256 2 /\ i{1} = 1).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE // 1:/# /= kb /= initiE //=. 
+ rewrite /signed_bound1024_cxq => k kb; rewrite initiE //=. 
+ rewrite /unpackm /unpackv /=.
  rewrite !initiE // 1:/# /= kb /= initiE //=.
  rewrite fun_if. 
  case (0<=k<256).
  + move => kbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray1024 aa{2} 0).[256 * 0 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array1024.initiE). smt().
  case (256<=k<512).
  + move => kbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray1024 aa{2} 0).[256 * 1 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array1024.initiE). smt(). auto.
  case (512<=k<768).
  + move => kbbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray1024 aa{2} 0).[256 * 2 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array1024.initiE). smt(). auto.
  case (768<=k<1024).
  + move => kbbbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray1024 aa{2} 0).[256 * 3 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array1024.initiE). smt(). auto.
  by smt().
+ move : H9; rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.
+ move : H8; rewrite /pos_bound1024_cxq /signed_bound_1024_cxq; smt(Array1024.initiE).
+ move : H9; rewrite /pos_bound1024_cxq /signed_bound_1024_cxq; smt(Array1024.initiE).

move => H15 H16 H17 H18 H19 r1 r2 H20 H21 H22;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H20; rewrite /lift_array256 tP => H20.
  move : (H20 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

move => H23 r3 r4 H24 H25 H26;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H24; rewrite /lift_array256 tP => H24.
  move : (H24 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).


+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

(* Second ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 1) = nttunpack (lift_array256 (subarray256 pkpv{2} 1)) /\
              signed_bound1024_cxq pkpv{1} 256 512 2 /\
              signed_bound1024_cxq pkpv{2} 256 512 2 /\ i{1} = 2).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 ; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.

move => H18 H19 H20 H21 H22 r1 r2 H23 H24 H25;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1,2: smt(nttunpack_bnd Array256.allP).
  move : H23; rewrite /lift_array256 tP => H23.
  move : (H23 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

move => H26 r3 r4 H27 H28 H29;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H10; rewrite /lift_array256 /subarray256 tP => H15.
  move : (H15 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H27; rewrite /lift_array256 /subarray256 tP => H27.
  move : (H27 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

(* Third ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 2) = nttunpack (lift_array256 (subarray256 pkpv{2} 2)) /\
              signed_bound1024_cxq pkpv{1} 512 768 2 /\
              signed_bound1024_cxq pkpv{2} 512 768 2 /\ i{1} = 3).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 ; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.

move => H21 H22 H23 H24 H25 r1 r2 H26 H27 H28;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1,2: smt(nttunpack_bnd Array256.allP).
  move : H26; rewrite /lift_array256 tP => H26.
  move : (H26 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

  move => H29 r3 r4 H30 H31 H32;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H10; rewrite /lift_array256 /subarray256 tP => H10.
  move : (H10 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
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

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H30; rewrite /lift_array256 /subarray256 tP => H30.
  move : (H30 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

(* Fourth ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 3) = nttunpack (lift_array256 (subarray256 pkpv{2} 3)) /\
              signed_bound1024_cxq pkpv{1} 768 1024 2 /\
              signed_bound1024_cxq pkpv{2} 768 1024 2).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# ifF 1:/# initiE //=. 
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.

move => H21 H22 H23 H24 H25 r1 r2 H26 H27 H28;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1,2: smt(nttunpack_bnd Array256.allP).
  move : H26; rewrite /lift_array256 tP => H26.
  move : (H26 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

  move => H29 r3 r4 H30 H31 H32;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H10; rewrite /lift_array256 /subarray256 tP => H10.
  move : (H10 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
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

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1:smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1:smt(nttunpack_bnd Array256.allP).
  move : H16; rewrite /lift_array256 /subarray256 tP => H16.
  move : (H16 k kb).
  rewrite /nttunpack Array256.initiE //= -/a !mapiE //=;1: smt(nttunpack_bnd Array256.allP).
  by rewrite !initiE /=;1..2:smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H30; rewrite /lift_array256 /subarray256 tP => H30.
  move : (H30 k kb).
  by rewrite /nttunpack Array256.initiE //= -/a !mapiE //=;1: smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().


auto => />.

move => &1 &2 ????????H1??H2??H3??H4??. 
do split.
+ smt().
+ smt(). 
+ rewrite /lift_array256 /subarray256 tP in H1.
  rewrite /lift_array256 /subarray256 tP in H2.
  rewrite /lift_array256 /subarray256 tP in H3.
  rewrite /lift_array256 /subarray256 tP in H4.
  rewrite /nttpackv tP => k kb.
  rewrite initiE //=.
  case (0 <= k && k < 256).
  + move => kbb.
    move : (H1 (nttpack_idx.[k]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack !initiE //=; 1..2: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite /lift_array1024 /subarray256 /=.
    pose c := nttpack_idx.[k].
  rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite /nttpack initiE //=.
  rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

  case (256 <= k && k < 512).
  + move => kbb ?.
    move : (H2 (nttpack_idx.[k-256]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k-256].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /lift_array1024 /subarray256 /=.
    pose c := nttpack_idx.[k-256].
  rewrite /nttpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-256. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

  case (512 <= k && k < 768).
  + move => kbb ?.
    move : (H3 (nttpack_idx.[k-512]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k-512].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /lift_array1024 /subarray256 /=.
    pose c := nttpack_idx.[k-512].
  rewrite /nttpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-512. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

  + move => *.
    move : (H4 (nttpack_idx.[k-768]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k-768].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /lift_array1024 /subarray256 /=.
    pose c := nttpack_idx.[k-768].
  rewrite /nttpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-768. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

+  smt(unpackvK).
+ smt().
+ smt().
by smt(unpackvK).
qed.
