require import AllCore IntDiv List.
from Jasmin require import JModel.
require import Array32 Array128 Array256 Array768 Array960 Array1088 Array2304.
require import KyberPoly  KyberPolyVec KyberINDCPA.
require import KyberPoly_avx2_proof.
require import KyberPolyvec_avx2_proof.
require import Jkem_avx2 Jkem.

import Kyber.
import KyberSpec.
import KyberPoly.
import KyberPolyVec.
import KyberPolyvecAVX.

equiv sha3equiv :
 Jkem_avx2.M._sha3_512_32 ~ M._sha3512_32 : ={arg} ==> ={res}.
admitted. 

lemma all_iota P (v : 'a Array256.t) : 
   Array256.all P v <=> all P (map (fun i => v.[i]) (iotared 0 256)).
rewrite iotaredE all_map /= /preim /= /#.
qed.

lemma pack_bnd : 
  all (fun x => 0 <= x < 256) nttpack_idx by rewrite all_iota /=.

lemma unpack_bnd : 
  all (fun x => 0 <= x < 256) nttunpack_idx by rewrite all_iota /=.

op unpackm(v : 'a Array2304.t) = 
   Array2304.init (fun i =>
      if 0 <= i < 768 
      then (unpackv (subarray768 v 0)).[i]
      else if 768 <= i < 2*768
           then (unpackv (subarray768 v 1)).[i-768]
           else (unpackv (subarray768 v 2)).[i-2*768]).

op packm(v : 'a Array2304.t) = 
   Array2304.init (fun i =>
      if 0 <= i < 768 
      then (packv (subarray768 v 0)).[i]
      else if 768 <= i < 2*768
           then (packv (subarray768 v 1)).[i-768]
           else (packv (subarray768 v 2)).[i-2*768]).

lemma pack_pred (v : 'a Array256.t) P: 
   (all P (pack v)) <=>
   (all P v).
rewrite /pack /=; split.
+ rewrite all_iota /=;smt(Array256.initiE Array256.allP).
rewrite allP all_iota /= /#.
qed.

lemma unpack_pred (v : 'a Array256.t) P: 
   (all P (unpack v)) <=>
   (all P v).
rewrite /unpack /=; split.
+ rewrite all_iota /=;smt(Array256.initiE Array256.allP).
rewrite allP all_iota /= /#.
qed.
(*
lemma packv_sub v P :
   (all P (pack (subarray256 v 0 256)) /\
    all P (pack (subarray256 v 256 256)) /\
    all P (pack (subarray256 v 512 256))) <=>
    app P (packv v).
*)
lemma packv_pred (v : 'a Array768.t) P: 
   (all P (packv v)) <=>
   (all P v).
rewrite /packv !allP; split.
move => H i ib. 
case (0 <= i < 256).
+ move => ibb; move : (H (nttunpack_idx.[i]) _); 1: smt(Array256.allP unpack_bnd).
  rewrite initiE //=; 1: smt(Array256.allP unpack_bnd). 
  have -> /= : (0 <= nttunpack_idx.[i] && nttunpack_idx.[i] < 256) by smt(Array256.allP unpack_bnd).
  rewrite /pack /subarray256 /= !initiE //=; 1: by smt(Array256.allP unpack_bnd).
  rewrite initiE //=; 1: by smt(Array256.allP unpack_bnd pack_bnd).


admitted.

lemma unpackv_pred (v : 'a Array768.t) P i: 
   (0 <= i < 256 => P ((unpackv v).[i])) <=>
   (0 <= i < 256 => P (v.[i])).
admitted.

equiv genmatrixequiv b :
  Jkem_avx2.M.__gen_matrix ~  M.__gen_matrix :
    arg{1}.`1 = arg{2}.`1 /\ arg{1}.`2 = b2i b /\ arg{2}.`2 =  W64.of_int (b2i b) ==>
    res{1} = unpackm res{2} /\
    pos_bound2304_cxq res{1} 0 2304 2 /\
    pos_bound2304_cxq res{2} 0 2304 2.
admitted.

equiv nttequiv :
 Jkem_avx2.M.__polyvec_ntt ~ M.__polyvec_ntt : 
   ={arg} /\ 
   signed_bound768_cxq arg{1} 0 768 2 /\ 
   signed_bound768_cxq arg{2} 0 768 2 ==>
   res{1} = unpackv res{2} /\ 
   pos_bound768_cxq res{1} 0 768 2 /\ 
   pos_bound768_cxq res{2} 0 768 2.
admitted.

equiv frommontequiv : 
  Jkem_avx2.M._poly_frommont ~   M._poly_frommont :
    arg{1} = unpack arg{2} ==> 
    res{1} = unpack res{2} /\
    signed_bound_cxq res{1} 0 768 2 /\ 
    signed_bound_cxq res{2} 0 768 2.
admitted.

equiv pointwiseequiv : 
  Jkem_avx2.M.__polyvec_pointwise_acc ~   M.__polyvec_pointwise_acc :
    arg{1}.`2 = unpackv arg{2}.`1 /\
    arg{1}.`3 = unpackv arg{2}.`2 /\
    signed_bound768_cxq arg{1}.`2 0 768 2 /\
    signed_bound768_cxq arg{1}.`3 0 768 2 /\
    signed_bound768_cxq arg{2}.`1 0 768 2 /\
    signed_bound768_cxq arg{2}.`2 0 768 2
    ==> 
    res{1} = unpack res{2} /\
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

seq 1 2 : (#pre /\ aa{1} = unpackm a{2} /\
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
           skpv{1} = unpackv skpv{2} /\
           e{1} = unpackv e{2} /\
           pos_bound768_cxq skpv{1} 0 768 2 /\
           pos_bound768_cxq skpv{2} 0 768 2 /\
           pos_bound768_cxq e{1} 0 768 2 /\
           pos_bound768_cxq e{2} 0 768 2); 1: 
 by  conseq />; call (nttequiv); call (nttequiv); auto => /> /#.

do 3!(wp; call frommontequiv; wp; call pointwiseequiv); auto => />.

move => &1 &2 *.
do split. 
+ rewrite /unpackm /unpackv tP /= => k kb.
  by rewrite !initiE // 1:/# /= kb /= initiE //=.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
+ rewrite /signed_bound768_cxq => k kb; rewrite initiE //=. 
  rewrite fun_if. 
  case (0<=k<256).
  + move => kbb;rewrite /subarray256. 
    move : (unpack_pred (Array256.init (fun (k0 : int) => skpv{2}.[256 * 0 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q) k).
    move => /= [H0 H1]. rewrite H1. move => *. rewrite initiE //=. smt(). smt().
  case (256<=k<512).
  + move => kbb;rewrite /subarray256. 
    move : (unpack_pred (Array256.init (fun (k0 : int) => skpv{2}.[256 * 1 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q) (k-256)).
    move => /= [H0 H1]. rewrite H1. move => *. rewrite initiE //=. smt(). smt(). done.
  case (512<=k<768).
  + move => kbb;rewrite /subarray256. 
    move : (unpack_pred (Array256.init (fun (k0 : int) => skpv{2}.[256 * 2 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q) (k-512)).
    move => /= [H0 H1]. rewrite H1. move => *. rewrite initiE //=. smt(). smt(). done.
  by smt().
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
+ by smt().
move => *.
do split. 
+ rewrite tP => k kb.
  rewrite !initiE //= 1:/# kb /=.
  rewrite initiE //=.
  rewrite initiE //=. 
  rewrite initiE //=. smt(). 
  rewrite initiE //=. smt(). 
  smt().
move => *.
do split.
+ admit.
+ admit. 
+ admit. 
move => *.
do split. 
+ admit. 
move => *.
do split. 
+ admit.
+ admit.
+ admit.
move => *.
do split. 
+ admit.
move => *.
do split. 
+ admit.
+ smt().
+ admit.
+ admit.
+ admit.
+ admit.
move => *.
do split.
+ admit.
move => *; do split.
+ admit.
+ admit.
+ admit.
move => *.
do split. 
+ smt().
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
