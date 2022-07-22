require import AllCore IntDiv List.
from Jasmin require import JModel.
require import Array32 Array128 Array256 Array768 Array960 Array1088 Array2304.
require import KyberPoly  KyberPolyVec KyberINDCPA.
require import KyberPoly_avx2_proof.
require import KyberPolyvec_avx2_proof.
require import Jkem_avx2 Jkem.
require import NTT_avx2.

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

equiv frommontequiv : 
  Jkem_avx2.M._poly_frommont ~   M._poly_frommont :
    arg{1} = nttunpack arg{2} ==> 
    res{1} = nttunpack res{2} /\
    signed_bound_cxq res{1} 0 768 2 /\ 
    signed_bound_cxq res{2} 0 768 2.
admitted.

equiv pointwiseequiv : 
  Jkem_avx2.M.__polyvec_pointwise_acc ~   M.__polyvec_pointwise_acc :
    arg{1}.`2 = nttunpackv arg{2}.`1 /\
    arg{1}.`3 = nttunpackv arg{2}.`2 /\
    signed_bound768_cxq arg{1}.`2 0 768 2 /\
    signed_bound768_cxq arg{1}.`3 0 768 2 /\
    signed_bound768_cxq arg{2}.`1 0 768 2 /\
    signed_bound768_cxq arg{2}.`2 0 768 2
    ==> 
    res{1} = nttunpack res{2} /\
    signed_bound_cxq res{1} 0 768 2 /\ 
    signed_bound_cxq res{2} 0 768 2.
admitted.

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

seq 8 4: (#pre /\ subarray256 pkpv{1} 0 = nttunpack (subarray256 pkpv{2} 0) /\
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

move => H13 H14 H15 H16 H17 r H19 H20;do split. 
+ rewrite tP /= => k kb.
  rewrite !initiE // 1:/# /= kb /= initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).
move => H21 r0 H23 H24;do split. 
+ rewrite /subarray256 tP => k kb.
  rewrite  !initiE //=.
  pose a:=nttunpack_idx.[k].
  rewrite  !initiE //=. smt().  smt(nttunpack_bnd Array256.allP).
  rewrite kb !initiE //=. smt().  smt(nttunpack_bnd Array256.allP).
  smt(Array768.initiE nttunpack_bnd Array256.allP). 
+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if kb /=.  smt().
+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if kb /=.  smt().

(* Second ip *)

seq 5 4: (#{/~i{1}}pre /\ subarray256 pkpv{1} 1 = nttunpack (subarray256 pkpv{2} 1) /\
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

move => H16 H17 H18 H19 r20 r0 H21 H22;do split. 
+ rewrite tP /= => k kb.
  rewrite !initiE //= initiE //=. smt(). rewrite ifT 1:/#. 
  pose a:=nttunpack_idx.[k].
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite -/a  !initiE //=; smt(nttunpack_bnd Array256.allP). 
move => H23 r1 H24 H25;do split. 
+ rewrite /subarray256 tP => k kb.
  rewrite  !initiE //=.
  pose a:=nttunpack_idx.[k].
  rewrite  !initiE //=. smt().  smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1:/# !initiE //=. smt().  smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1:/# !initiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite ifF.  smt(nttunpack_bnd Array256.allP).
  rewrite ifF.  smt(nttunpack_bnd Array256.allP). 
  move : H13; rewrite /subarray256 /= tP => HH.
  move : (HH k kb). rewrite !initiE /=;1,2: smt(nttunpack_bnd Array256.allP).
  rewrite -/a  !initiE /=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if ifF /=.  smt().
  rewrite !initiE  //=. smt(). smt().
+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if ifF /=.  smt().
  rewrite !initiE  //=. smt(). smt().
+ rewrite tP /= => k kb.
  rewrite !initiE //= initiE //=. smt(). rewrite ifT 1:/#. 
  pose a:=nttunpack_idx.[k].
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite -/a  !initiE //=; smt(nttunpack_bnd Array256.allP). 
+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if ifT /=.  smt().
  rewrite !initiE  //=. smt(). smt(nttunpack_bnd Array256.allP).
+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if ifT /=.  smt(). smt(nttunpack_bnd Array256.allP).

(* Third ip *)

seq 5 4: (#{/~i{1}}pre /\ subarray256 pkpv{1} 2 = nttunpack (subarray256 pkpv{2} 2) /\
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

move => H19 H20 H21 H22 r23 r1 H24 H25;do split. 
+ rewrite tP /= => k kb.
  rewrite !initiE //= initiE //=. smt(). rewrite ifT 1:/#. 
  pose a:=nttunpack_idx.[k].
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite -/a  !initiE //=; smt(nttunpack_bnd Array256.allP). 
move => H26 r2 H27 H28.  do split.
+ rewrite /subarray256 tP => k kb.
  rewrite  !initiE //=.
  pose a:=nttunpack_idx.[k].
  rewrite  !initiE //=. smt().  smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1:/# !initiE //=. smt().  smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1:/# !initiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite ifF.  smt(nttunpack_bnd Array256.allP).
  rewrite ifF.  smt(nttunpack_bnd Array256.allP). 
  move : H13; rewrite /subarray256 /= tP => HH.
  move : (HH k kb). rewrite !initiE /=;1,2: smt(nttunpack_bnd Array256.allP).
  rewrite -/a  !initiE /=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if ifF /=.  smt().
  rewrite !initiE  //=. smt(). smt().
+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if ifF /=.  smt().
  rewrite !initiE  //=. smt(). smt().
+ rewrite tP /= => k kb.
  rewrite !initiE //= initiE //=. smt(). rewrite ifF 1:/#. 
  pose a:=nttunpack_idx.[k].
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP). 
  rewrite ifF 1:/#.
  rewrite  !initiE //=; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite  !initiE //=; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP).
  move : H16; rewrite /subarray256 /= tP => HH.
  move : (HH k kb). rewrite !initiE /=;1,2: smt(nttunpack_bnd Array256.allP).
  rewrite -/a  !initiE /=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if ifF /=.  smt().
  rewrite !initiE  //=. smt(). smt().
+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if ifF /=.  smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite !initiE //= initiE //=. smt(). rewrite ifT 1:/#. 
  pose a:=nttunpack_idx.[k]. 
  rewrite /subarray256 !initiE //=;  1: smt(nttunpack_bnd Array256.allP). 
  rewrite -/a  !initiE /=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if ifT /=.  smt().
  rewrite !initiE  //=. smt(). smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite fun_if ifT /=.  smt(). smt(nttunpack_bnd Array256.allP).

auto => />.

move => &1 &2 ?????????????H1??H2??H3??. 
do split.
+ smt().
+ smt().
+ rewrite nttpackv_lift. congr. rewrite /packv tP => k kb.
  rewrite initiE //=.
  case (0 <= k && k < 256).
  + move => *. rewrite H1 nttunpackK. smt(Array256.initiE).
  case (256 <= k && k < 512).
  + move => *. rewrite H2 nttunpackK. smt(Array256.initiE).
  move => *. rewrite H3 nttunpackK. smt(Array256.initiE).
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
admitted. (* We should change the axv2 indcpa file to remove useless differences to the ref *)

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
