require import AllCore IntDiv List.

from JazzEC require import Jkem1024.

require import MLKEM_InnerPKE MLKEM_Poly MLKEM_PolyVec.

from JazzEC require import Array1536 Array32 Array1408 Array1568 Array1568 Array3168 Array64 Array160 WArray3168 WArray32 WArray1568 WArray64.
from Jasmin require import JModel.

import MLKEM_Poly.
import MLKEM_PolyVec.

from CryptoSpecs require import GFq Rq VecMat Sampling Symmetric Serialization InnerPKE1024 MLKEM1024.
import Symmetric1024 Serialization1024 VecMat1024.

require import MLKEMFCLib.
require import MLKEM_keccak_ref.

lemma pack_inj : injective W8u8.pack8_t by apply (can_inj W8u8.pack8_t W8u8.unpack8 W8u8.pack8K).
print InnerPKE1024.skey.
lemma mlkem_kem_correct_kg  : 
   equiv [Jkem1024.M.__crypto_kem_keypair_jazz ~ MLKEM1024.kg_derand : 
       coins{2}.`1 = Array32.init (fun i => randomnessp{1}.[0 + i]) /\ 
       coins{2}.`2 = Array32.init (fun i => randomnessp{1}.[32 + i])
        ==> 
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk.`1 = Array1536.init(fun i => res{1}.`2.[i]) /\
         sk.`2.`1 = Array1536.init(fun i => res{1}.`2.[i+1536]) /\
         sk.`2.`2 = Array32.init(fun i => res{1}.`2.[i+1536+1536]) /\
         sk.`3 = Array32.init(fun i => res{1}.`2.[i+1536+1536+32])  /\
         sk.`4 = Array32.init(fun i => res{1}.`2.[i+1536+1536+32+32])  /\
         t = Array1536.init(fun i => res{1}.`1.[i])  /\
         rho = Array32.init(fun i => res{1}.`1.[i+1536])].
proc => /=.


swap {1} 1 15.
swap {1} 6 15.
sp 0 2.
seq 5 0 : #pre; 1: by auto.

wp => /=.

seq 15 1 :
 (
  kgs{2} = coins{2}.`1 /\ z{2} = coins{2}.`2 /\ H_pk pk{2} = h_pk{1} /\
  coins{2}.`1 = Array32.init (fun (i0 : int) => randomnessp{1}.[i0]) /\
  coins{2}.`2 = Array32.init (fun (i0 : int) => randomnessp{1}.[32 + i0]) /\  sk{2} = Array1536.init ("_.[_]" sk{1}) /\ 
 H_pk pk{2} = Array32.init (fun (i0 : int) => sk{1}.[i0 + 2*1536+32]) /\
 let (t, rho) = pk{2} in
  pk{2}.`1 = Array1536.init (fun (i0 : int) => sk{1}.[i0 + 1536]) /\
  pk{2}.`2 = Array32.init (fun (i0 : int) => sk{1}.[i0 + 2*1536]) /\
  t = Array1536.init ("_.[_]" pk{1}) /\ rho = Array32.init (fun (i0 : int) => pk{1}.[i0 + 1536])); last first.

while {1} (inc{1} = 4 /\
       kgs{2} = coins{2}.`1 /\
  z{2} = coins{2}.`2 /\ H_pk pk{2} = h_pk{1} /\
  coins{2}.`1 = Array32.init (fun (i0 : int) => randomnessp{1}.[i0]) /\
  coins{2}.`2 = Array32.init (fun (i0 : int) => randomnessp{1}.[32 + i0]) /\ randomnessp2{1} = coins{2}.`2 /\
      sk{2} = Array1536.init(fun i => sk{1}.[i]) /\
      pk{2}.`1 = Array1536.init(fun i => sk{1}.[i+1536]) /\
      pk{2}.`2 = Array32.init(fun i => sk{1}.[i+1536+1536]) /\
      H_pk pk{2} = Array32.init(fun i => sk{1}.[i+1536+1536+32])  /\
         pk{2}.`1 = Array1536.init(fun i => pk{1}.[i])  /\
         pk{2}.`2 = Array32.init(fun i => pk{1}.[i+1536]) /\
       0 <= i{1} <= 4 /\ 
       forall k, 0<=k<i{1}*8 =>
           z{2}.[k] = sk{1}.[k+1536+1536+32+32] )
          (4 - i{1}).
  + move => &2 z0; auto => /> &1; rewrite !tP => 
       cc1 cc2  skv pk1vs pk2vs pk1v pk2v ??prev?; do split;5,8..:smt().
    + by move => *;rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= get8_set64_directE 1,2:/# ifF 1:/# /init8 /get8 initiE 1:/# /=.
    + by move => *;rewrite initiE 1:/# /= initiE 1:/# /= get8_set64_directE 1,2:/# ifF 1:/# /init8 /get8 initiE 1:/# /=;smt(Array1536.initiE).
    + by move => *;rewrite initiE 1:/# /= initiE 1:/# /= get8_set64_directE 1,2:/# ifF 1:/# /init8 /get8 initiE 1:/# /=;smt(Array32.initiE).
    + move => *;rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= get8_set64_directE 1,2:/# ifF 1:/# /init8 /get8 initiE 1:/# /=;smt(Array32.initiE).
    + by smt(). 
    + move => k ??;rewrite initiE 1:/# /=get8_set64_directE 1,2:/#.
      case ((392 + i{1}) * 8 <= k + 3136 < (392 + i{1}) * 8 + 8).
      + rewrite /get64_direct /(\bits8) /= wordP => *. 
        rewrite initiE 1:/# /= /pack8_t initiE 1:/# /=  initiE 1:/# /=  initiE 1:/# /= /#. 
      move => ?; rewrite /get8 initiE 1:/# /= /#.

auto => /> &1 &2 *; do split;1..6:smt(). 
move => i sk *; do split => *;1: smt(). 
by rewrite tP => *; rewrite initiE /# /=. 

seq 13 1 : (
kgs{2} = coins{2}.`1 /\
  z{2} = coins{2}.`2 /\
  H_pk pk{2} = h_pk{1} /\
  coins{2}.`1 = Array32.init (fun (i0 : int) => randomnessp{1}.[i0]) /\
  coins{2}.`2 = Array32.init (fun (i0 : int) => randomnessp{1}.[32 + i0]) /\
  sk{2} = Array1536.init ("_.[_]" sk{1}) /\
  let (t, rho) = pk{2} in
  pk{2}.`1 = Array1536.init (fun (i0 : int) => sk{1}.[i0 + 1536]) /\
  pk{2}.`2 = Array32.init (fun (i0 : int) => sk{1}.[i0 + 2*1536]) /\
  t = Array1536.init ("_.[_]" pk{1}) /\ rho = Array32.init (fun (i0 : int) => pk{1}.[i0 + 1536])
); last first.

wp => /=.
while {1} (
       kgs{2} = coins{2}.`1 /\
  z{2} = coins{2}.`2 /\
  coins{2}.`1 = Array32.init (fun (i0 : int) => randomnessp{1}.[i0]) /\
  coins{2}.`2 = Array32.init (fun (i0 : int) => randomnessp{1}.[32 + i0]) /\   H_pk pk{2} = h_pk{1} /\
      sk{2} = Array1536.init(fun i => sk{1}.[i]) /\
      pk{2}.`1 = Array1536.init(fun i => sk{1}.[i+1536]) /\
      pk{2}.`2 = Array32.init(fun i => sk{1}.[i+1536+1536]) /\
         pk{2}.`1 = Array1536.init(fun i => pk{1}.[i])  /\
         pk{2}.`2 = Array32.init(fun i => pk{1}.[i+1536]) /\
       0 <= i{1} <= 4 /\ 
       forall k, 0<=k<i{1}*8 =>
           (H_pk pk{2}).[k] = sk{1}.[k+1536+1536+32] )
          (4 - i{1}).
  + move => &m z0; auto => /> &hr; rewrite !tP => 
       cc1 cc2 pk1vs pk2vs pk1v pk2v ??prev?; do split;5,7..:smt().
    + by move => *;rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= get8_set64_directE 1,2:/# ifF 1:/# /init8 /get8 initiE 1:/# /=.
    + by move => *;rewrite initiE 1:/# /= initiE 1:/# /= get8_set64_directE 1,2:/# ifF 1:/# /init8 /get8 initiE 1:/# /=;smt(Array1536.initiE).
    + by move => *;rewrite initiE 1:/# /= initiE 1:/# /= get8_set64_directE 1,2:/# ifF 1:/# /init8 /get8 initiE 1:/# /=;smt(Array32.initiE).
    + by smt(). 
    + move => k ??;rewrite initiE 1:/# /=get8_set64_directE 1,2:/#.
      case ( (388 + i{hr}) * 8 <= k + 3104 < (388 + i{hr}) * 8 + 8).
      + rewrite /get64_direct /(\bits8) /= wordP => *. 
        rewrite initiE 1:/# /= /pack8_t initiE 1:/# /=  initiE 1:/# /=  initiE 1:/# /= /#. 
      move => ?; rewrite /get8 initiE 1:/# /= /#.

auto => /> &1 &2 *; do split; 1..5:smt(). 
move => i sk *; do split => *;1: smt(). 
rewrite tP => kk*; smt(Array32.initiE). 

seq 9 1 : 
(
kgs{2} = coins{2}.`1 /\
  z{2} = coins{2}.`2 /\
  coins{2}.`1 = Array32.init (fun (i0 : int) => randomnessp{1}.[i0]) /\
  coins{2}.`2 = Array32.init (fun (i0 : int) => randomnessp{1}.[32 + i0]) /\
  sk{2} = Array1536.init ("_.[_]" sk{1}) /\
  let (t, rho) = pk{2} in
  pk{2}.`1 = Array1536.init (fun (i0 : int) => sk{1}.[i0 + 1536]) /\
  pk{2}.`2 = Array32.init (fun (i0 : int) => sk{1}.[i0 + 2*1536]) /\
  t = Array1536.init ("_.[_]" pk{1}) /\ rho = Array32.init (fun (i0 : int) => pk{1}.[i0 + 1536])
); last first.

wp; ecall{1} (pkH_sha pk{1});wp;auto => /> &1 &2 /#.

sp; seq 3 1 : (#{/~s_skp{1} = sk{1}}pre /\
  sk{2} = Array1536.init(fun i => sk{1}.[i]) /\
  pk{2}.`1 = Array1536.init(fun i => pk{1}.[i])  /\
  pk{2}.`2 = Array32.init(fun i => pk{1}.[i+1536])).
wp; ecall (mlkem_correct_kg);auto => /> &1 &2 ??;do split; 1:smt().
move => ? rr1 [[rr21 rr22] rr2] /=[#]; rewrite !tP => H H0 H1;do split. 
+ by move => *;rewrite initiE 1:/# /= initiE 1:/# /= /#.
+  move => i*; rewrite initiE 1:/# /= initiE 1:/# /=;
smt(Array1536.initiE  Array32.initiE).
+ by move => *;rewrite initiE 1:/# /=;smt(Array1536.initiE  Array32.initiE).
+ by move => *;rewrite initiE 1:/# /=;smt(Array1536.initiE  Array32.initiE).

while {1} (inc{1} = 196  /\
  (let (t, rho) = pk{2} in
  t = Array1536.init ("_.[_]" pk{1}) /\ rho = Array32.init (fun (i0 : int) => pk{1}.[i0 + 1536])) /\
  sk{2} = Array1536.init ("_.[_]" sk{1}) /\
       0 <= i{1} <= 196 /\ 
        (i{1}*8 < 1536  => 
           forall k, 0<=k<i{1}*8 =>
              pk{2}.`1.[k] = sk{1}.[1536+k]) /\
        (1536 <= i{1}*8  => 
           (forall k, 0<=k<1536 =>
              pk{2}.`1.[k] = sk{1}.[1536+k]) /\
           (forall k, 1536<=k<i{1}*8 =>
            pk{2}.`2.[k-1536] = sk{1}.[1536+k]))
  )
          (196 - i{1}).
  + move => &2 z0; auto => /> &1; rewrite !tP => 
      ? ??prev1 prev2?; do split;6..:smt().
    + by move => *;rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= get8_set64_directE 1,2:/# ifF 1:/# /init8 /get8 initiE 1:/# /=.
    + by smt().
    + by smt().
    +  move => ?k ??;rewrite initiE 1:/# /= get8_set64_directE 1,2:/#.
       case (k < i{1} * 8).
       +  move => ?; rewrite ifF 1:/#.  
          rewrite /get8 /init8 wordP => *.
          rewrite /pack8_t /(\bits8) initiE /#.
       +  move => ?; rewrite ifT 1:/#.  
          rewrite /get64_direct /(\bits8) /= wordP => *. 
          rewrite initiE 1:/# /= /pack8_t initiE 1:/# /=  initiE 1:/# /= initiE 1:/# /=; smt(@Array32 @Array1536).
    +  move => ?;split.
       move => k ??;rewrite initiE 1:/# /= get8_set64_directE 1,2:/#.
       case (k < i{1} * 8).
       +  move => ?; rewrite ifF 1:/#.  
          rewrite /get8 /init8 wordP => *.
          rewrite /pack8_t /(\bits8) initiE /#.
       +  move => ?; rewrite ifT 1:/#.  
          rewrite /get64_direct /(\bits8) /= wordP => *. 
          rewrite initiE 1:/# /= /pack8_t initiE 1:/# /=  initiE 1:/# /= initiE 1:/# /=; smt(@Array32 @Array1536).
       move => k ??;rewrite initiE 1:/# /= get8_set64_directE 1,2:/#.
       case (k < i{1} * 8).
       +  move => ?; rewrite ifF 1:/#.  
          rewrite /get8 /init8 wordP => *.
          rewrite /pack8_t /(\bits8) initiE /#.
       +  move => ?; rewrite ifT 1:/#.  
          rewrite /get64_direct /(\bits8) /= wordP => *. 
          rewrite initiE 1:/# /= /pack8_t initiE 1:/# /=  initiE 1:/# /= initiE 1:/# /=; smt(@Array32 @Array1536).
 
auto => /> &1 &2 *;split;1: smt(). 
move => ii skk *; do split. move => *. smt(). 
move => /> H1 H2 H3 H4 H5 H6 H7 x1 x2 ?;rewrite !tP => *.
split => i ib;rewrite initiE 1:/# /=;1:smt(Array32.mapiE Array1536.mapiE Array1536.initiE Array32.initiE Array1536.tP Array32.tP).
have := H7 _;1:smt().
have -> : x2 = pk{2}.`2 by smt().
move => [# HH HH1].
have := HH1 (i+1536) _;
smt(Array32.mapiE Array1536.mapiE Array1536.initiE Array32.initiE Array1536.tP Array32.tP).
qed.


lemma mlkem_kem_correct_enc : 
   equiv [Jkem1024.M.__crypto_kem_enc_jazz ~ MLKEM1024.enc_derand: 
     pk{2}.`1 = Array1536.init(fun i => pk{1}.[i]) /\
     pk{2}.`2 = Array32.init(fun i => pk{1}.[i+1536]) /\
     randomnessp{1} = coins{2} 
       ==> 
     let (c,k) = res{2} in
     c.`1 = Array1408.init(fun i => res{1}.`1.[i])/\
     c.`2 = Array160.init(fun i => res{1}.`1.[i+1408]) /\
     k = res{1}.`2
].
proc => /=.
seq 15 4 : (#[/1:-2]post /\
      (forall k, 0<=k<32 => kr{1}.[k]=_K{2}.[k])); last first.
+ while {1} (#pre
      /\ inc{1} = 4 
      /\ 0<=i{1}<=4 
      /\ (forall k, 0<=k<8*i{1} =>  _K{2}.[k] = shk{1}.[k]) 
      /\ (forall k, 0<=k<32 => kr{1}.[k]=_K{2}.[k])) (inc{1} - i{1}).
  + auto => /> &hr H H0 H1 H2 H3 H4 H5 ;do split;1,2,4:smt().
    + move => k ??;rewrite initiE 1:/# /=get8_set64_directE 1,2:/#.
      case (8 * i{hr} <= k < 8 * i{hr} + 8 ).
      + rewrite /get64_direct /(\bits8) /= wordP => *. 
        rewrite initiE 1:/# /= /pack8_t /init8 initiE 1:/# /=  initiE 1:/# /=initiE 1:/# /= /#. 
      move => ?; rewrite /get8 initiE 1:/# /= /#.

auto => /> &1 &2 *;do split => *;1: smt(Array32.tP).
+ split => *;1:smt().
  rewrite tP => *; smt(). 


wp;ecall (mlkem_correct_enc pk{1}).
wp;ecall {1} (sha_g buf{1}).
wp;ecall {1} (pkH_sha pk{1}).

seq 11 0 : (#pre /\ Array32.init (fun i => buf{1}.[i]) = coins{2} /\ s_shk{1} = shk{1} /\ s_pk{1} = pk{1}); last first.

auto => /> &1 &2;rewrite !tP => ??;do split.
+ move => i *;rewrite initiE 1:/# /= initiE 1:/# /= ifF 1:/# initiE /#.
+ move => i *;rewrite initiE 1:/# /= initiE 1:/# /= ifF 1:/# /G_mhpk /H_pk;congr;congr;congr.
  + rewrite tP => k *; rewrite initiE 1:/# /= initiE 1:/# /=ifF 1:/# initiE /#.
  rewrite tP => k *; rewrite initiE 1:/# /= initiE 1:/# /=ifT 1:/# initiE 1:/# /= /SHA3_256_1184_32 get_of_list 1:/#;congr;congr;congr;congr; rewrite tP => *;  smt(Array1536.initiE Array32.initiE Array1536.tP Array32.tP).
  + smt().
+ move => ???? rr cph1 cph2; do split;1,2: smt().
  move => k*.
  rewrite /G_mhpk initiE 1:/# /= ifT 1:/#;congr;congr;congr. 
  + rewrite tP => kk *; rewrite initiE 1:/# /= initiE 1:/# /=ifF 1:/# initiE /#.
  rewrite tP => kk *; rewrite /H_pk initiE 1:/# /= initiE 1:/# /=ifT 1:/# initiE 1:/# /= /SHA3_256_1184_32 get_of_list 1:/#;congr;congr;congr;congr; rewrite tP => *;  smt(Array1536.initiE Array32.initiE Array1536.tP Array32.tP).

seq 4 0 :#pre; 1: by auto.
sp;conseq />.
  while {1} (0<=i{1}<=inc{1} /\ inc{1} = 4 /\ randomnessp{1} = coins{2} /\  (forall k, 0<=k<i{1}*8 => randomnessp{1}.[k] = buf{1}.[k])) (inc{1} - i{1}); last first.
  + auto => /> &1 &2 *; split; 1: by smt().  
    move => buf i1; split; 1: smt(). 
    by move => *; rewrite tP => k kn; rewrite initiE //= /#. 
  move => &2 ?.
  auto => /> &1 il ih premv ihh; do split; 1,2,4:smt().
  move => k kl kh; rewrite initiE 1:/# /=.
  rewrite get8_set64_directE 1..2:/#.
  case (8 * i{1} <= k && k < 8 * i{1} + 8).
  + move => *. 
     rewrite WArray32.get64E pack8bE 1:/# !initiE 1:/# /= /init8.  
     by rewrite !WArray32.initiE /#.
  by move => *; rewrite /get8; rewrite WArray64.initiE /#.
qed.

require import StdOrder. 
import IntOrder.

lemma verify_correct_h ctp ctp1 :
  hoare [Jkem1024.M.__verify : 
             arg = (ctp,ctp1) ==>
             (ctp = ctp1 => 
                       res = W64.of_int 0) /\
             (ctp <> ctp1 => 
                       res = W64.of_int 1)].
proc => /=.
wp; while (#pre /\ 0 <= i{hr} <= 1568 /\ inc{hr} = 1568 /\ 0<=to_uint cnd<256 /\
           (to_uint cnd{hr} = 0 <=> 
            forall k, 0 <= k < i{hr} => ctp.[k] = ctp1.[k])); last first.
+ auto => />; split; 1: by smt().
  move => cnd i ????? [HL HR]; split. 
  rewrite tP => H1.
  rewrite /(`>>`) /= to_uint_eq to_uint_shr // to_uintNE /= (HR _); 2..: by smt(). 
  + by move => k kb; rewrite -H1 1: /# /#. 
  rewrite tP /= => H.
  have HH : to_uint cnd <> 0.
  + have : exists k, 0 <= k < 1568 /\ ctp.[k] <> ctp1.[k] by smt().
    by smt().
  rewrite /(`>>`) /= to_uint_eq to_uint_shr // to_uintNE /=.
  by  smt(W64.to_uint_cmp pow2_64). 

auto => /> &hr ???? [HL HR] ?.

pose x := 
      ((WArray1568.get8 ((WArray1568.init8 ("_.[_]" ctp1))) i{hr}) `^` ctp.[i{hr}]).

have H : 0 <= to_uint (cnd{hr} `|` zeroextu64 x) < 256.
+ split; 1: by smt(W64.to_uint_cmp).
  move => *.
  have -> : cnd{hr} `|` zeroextu64 x = zeroextu64 (truncateu8 cnd{hr} `|` x); last by
     rewrite to_uint_zeroextu64; move :  W8.to_uint_cmp => /= /#.
  rewrite wordP => k kb. rewrite zeroextu64_bit !orwE /= zeroextu64_bit /=. 
  case (0 <= k && k < 8).
  + by move => /= kbb; congr; rewrite !get_to_uint kb  kbb /= to_uint_truncateu8 /= /#.
  move => /= *; rewrite get_to_uint kb /=. 
  have : 256 = 2^8 by auto. 
  move : (ler_weexpn2l 2 _ 8 k) => //=.
  by smt(divz_small).

do split; 1..4: by smt(W64.to_uint_cmp).

+ move => H0 k kbl kbh.

  have H1 : to_uint cnd{hr} = 0. 
  + have : cnd{hr} = W64.zero; last by rewrite to_uint_eq /=.
    have : (cnd{hr} `|` zeroextu64 x) = W64.zero by rewrite to_uint_eq  H0 /=.
    by rewrite !wordP; smt(orwE zerowE).

  have H2 : x = W8.zero.
  + have : (cnd{hr} `|` zeroextu64 x) = W64.zero by rewrite to_uint_eq  H0 /=. 
    by rewrite !wordP; smt(orwE zerowE W8u8.zeroextu64_bit).

  case (k < i{hr}); 1: by move => *; apply (HL _ _) => // /#. 

  move : H2; rewrite /x W8.WRing.addr_eq0 /oppw /=. 
  rewrite /init8 /get8 /= WArray1568.initiE /= 1:/#.
  by smt(). 
  
move => H0.
have -> : cnd{hr} = W64.zero by rewrite to_uint_eq /= /#.
rewrite or0w;have -> : zeroextu64 x = W64.zero; last by auto.
rewrite wordP => k kb; rewrite zerowE.
case (8 <= k); 1: by smt(W8u8.zeroextu64_bit).
move => kbb; rewrite W8u8.zeroextu64_bit.
have -> /= : 0 <= k && k < 8 by smt().

rewrite /x. 
rewrite /init8 /get8 /= WArray1568.initiE /= 1:/#.
by rewrite -(H0 i{hr} _); 1: by smt().
qed.

lemma verify_ll : islossless Jkem1024.M.__verify.
proc.
wp; while (0 <= i{hr} <= 1568 /\ inc{hr} = 1568) (1568 - i{hr}); last by auto => /> /#.
by move => *; auto => /> /#. 
qed.

lemma verify_correct ctp ctp1 :
  phoare [Jkem1024.M.__verify : 
             arg = (ctp,ctp1) ==>
             (ctp = ctp1 => 
                       res = W64.of_int 0) /\
             (ctp <> ctp1 => 
                       res = W64.of_int 1)] = 1%r 
   by conseq verify_ll (verify_correct_h  ctp ctp1).

lemma cmov_correct_h _dst _src _cnd:
   hoare [Jkem1024.M.__cmov : 
             src = _src /\ cnd = _cnd /\  dst = _dst ==>
             (_cnd = W64.of_int 0 => res = _src) /\
             (_cnd = W64.of_int 1 => res = _dst)].
proc => /=.
seq 1 : (#{/~cnd}pre /\ (_cnd = W64.zero => cnd = W64.zero) /\
                (_cnd = W64.one => cnd = W64.onew));
  1: by auto => />  /=; split; [ by ring | by rewrite W64.minus_one /=].

while (#{/~dst}pre /\ 0 <= i{hr} <=32 /\ 
           (_cnd = W64.zero => forall k, 0<=k<i{hr} => dst.[k] = _src.[k]) /\
           (_cnd = W64.one =>forall k, 0<=k<i{hr} => dst.[k] = _dst.[k]) /\
           (forall k, i{hr} <= k < 32 => dst.[k] = _dst.[k]));  last first.
+ auto => />  &hr case0 case1; do split; 1: smt(). 
  move => dd????; rewrite !tP => H0 H1 ?; do split.
  + by move => c i ib;rewrite H0 /#. 
  + by move => c i ib;rewrite H1 /#. 

auto => /> &hr  case0 case1 ??cc0 cc1 back ?; do split; 1..2: by smt().
+ move => cs k kbl kb.
  case (k = i{hr}); last first.
  + by move => *;rewrite -cc0 1,2:/# /init8 /get8 /= WArray32.initiE /= 1:/# get_setE /#.
  move => vk; rewrite vk /=; rewrite get_setE /= 1:/#. 
  have -> : truncateu8 cnd{hr} = W8.zero
     by apply  W8.to_uint_eq; rewrite to_uint_truncateu8 /= (case0 cs) /=.
  by rewrite   W8.andw0 /=  /init8 /get8 /= WArray32.initiE /=.

+ move => cs k kbl kb.
  case (k = i{hr}); last first.
  + by move => *;rewrite -cc1 1,2:/# /init8 /get8 /= WArray32.initiE /= 1:/# get_setE /#.
  move => vk; rewrite vk /=; rewrite get_setE /= 1:/#. 
  have -> : truncateu8 cnd{hr} = W8.onew 
     by apply  W8.to_uint_eq; rewrite to_uint_truncateu8 /= (case1 cs) /= to_uint_onew W8.to_uint_onew /=. 
   rewrite W8.andw1  xorwC -xorwA xorwK xorw0_s -back /#. 

+ move => k kbl kbh.
  by move => *; rewrite /init8 /get8 /= WArray32.initiE /= 1:/# get_setE /#.

qed.

lemma cmov_ll : islossless Jkem1024.M.__cmov by proc; unroll for 3; islossless.

lemma cmov_correct _dst _src _cnd:
   phoare [Jkem1024.M.__cmov : 
              src = _src /\ cnd = _cnd /\  dst = _dst ==>
             (_cnd = W64.of_int 0 => res = _src) /\
             (_cnd = W64.of_int 1 => res = _dst)] = 1%r
    by conseq cmov_ll (cmov_correct_h _dst _src _cnd).

lemma mlkem_kem_correct_dec : 
   equiv [Jkem1024.M.__crypto_kem_dec_jazz ~ MLKEM1024.dec: 
     sk{2}.`1 = Array1536.init (fun i => sk{1}.[i]) /\
     sk{2}.`2.`1 = Array1536.init (fun i => sk{1}.[i+1536]) /\
     sk{2}.`2.`2 = Array32.init (fun i => sk{1}.[i +  1536 + 1536]) /\
     sk{2}.`3 = Array32.init (fun i => sk{1}.[i+ 1536 + 1536 + 32]) /\
     sk{2}.`4 = Array32.init (fun i => sk{1}.[i+ 1536 + 1536 + 32 + 32]) /\
     let (c1,c2) = cph{2} in
       c1 = Array1408.init (fun i => ct{1}.[i]) /\
       c2 = Array160.init (fun i => ct{1}.[i + 1408])
       ==> 
     ={res}
].
proc => /=. sp 0 1. swap {1} 8 8. 

seq 6 0: #pre; 1: by auto.
sp;
seq 1 1 : (#pre /\ aux{1} =  m{2}); 
  1: by call (mlkem_correct_dec); 1: by auto => /> /#.

seq 5 1 : (#pre /\ 
           (forall k, 0<=k<32 => buf{1}.[k] = m{2}.[k]) /\
           (forall k, 0<=k<32 => kr{1}.[k] = _K{2}.[k]) /\
           (forall k, 0<=k<32 => kr{1}.[k+32] = r{2}.[k])).
ecall {1} (sha_g buf{1}).
wp; conseq (_: _ ==> 
   (forall k, 0<=k<32 => buf{1}.[k] = m{2}.[k]) /\
   (forall k, 32<=k<64 => buf{1}.[k] =  sk{1}.[3104 + k - 32]) /\
   (forall k, 0<=k<32 => buf{1}.[k] = aux{1}.[k])).
+ auto => /> &1 &2; rewrite  !tP => ???buf bvl bvh ; split.
  + move => k kbl kbh; rewrite initiE 1:/# /= kbh /= /G_mhpk; congr; congr;congr.
    rewrite tP => i ib; rewrite initiE //= /#.
    by rewrite tP => i ib; rewrite !initiE  /#. 
  + move => k kbl kbh; rewrite initiE 1:/# /= ifF 1:/# /= /G_mhpk; congr; congr;congr.
    rewrite tP => i ib; rewrite initiE //= /#.
    by rewrite tP => i ib; rewrite !initiE  /#. 
  
while {1} (0<=i{1}<=4 /\ inc{1} = 4  /\ s_sk{1} = sk{1} /\
             (forall (k : int), 32 <= k && k < 32 + 8*i{1} => buf{1}.[k] = sk{1}.[3104 + k - 32]) /\
             forall (k : int), 0 <= k && k < 32 => buf{1}.[k] = aux{1}.[k]) (4 - i{1}); last first. 
  + auto => /> &1 &2 ?? /=.
    have -> /= : cph{2} = (cph{2}.`1,cph{2}.`2) by smt().
    rewrite !tP => [#] cph1v cph2v.
    do split.
    + by smt().
    + by move => k kbl kbh; rewrite initiE /= /#.
    by smt().
  move => *; auto => /> &hr ?????; do split; 1..2,5: by smt().
  + move => k kbl kbh; rewrite initiE //= 1:/#.
    rewrite WArray64.get8_set64_directE 1..2:/#.
    case ((i{hr} + 4) * 8 <= k < (i{hr} + 4) * 8 + 8).
    + move => *; rewrite /get64_direct pack8bE 1:/# initiE /= 1:/# initiE /#. 
    by move => *; rewrite /WArray64.get8 WArray64.initiE /= /#.  
  + move => k kbl kbh; rewrite initiE //= 1:/#.
    rewrite WArray64.get8_set64_directE 1..2:/#.
    case ((i{hr} + 4) * 8 <= k < (i{hr} + 4) * 8 + 8).
    + move => *; rewrite /get64_direct pack8bE 1:/# initiE /= 1:/# initiE /#. 
    by move => *; rewrite /WArray64.get8 WArray64.initiE /= /#.  

swap {2} 1 1.


seq 1 1 : (#pre /\ 
           ctc{1} = Array1568.init (fun i => if i < 1408 then c{2}.`1.[i] else c{2}.`2.[i-1408])). 
+ wp;ecall (mlkem_correct_enc 
   (Array1568.init  (fun (i_0 : int) => s_sk{1}.[4 * 384 + i_0]))).
  auto => /> &1 &2 /=;rewrite  !tP => ??????; do split. 
  + by move => i ib; rewrite initiE /= /#.
  + by move => i ib; rewrite initiE /= /#. 
  + move => i ib; rewrite initiE /= 1:/# /= initiE 1:/# /=;smt(Array1536.initiE).
  + move => i ib; rewrite initiE /= 1:/# /= initiE 1:/# /=;smt(Array32.initiE).
 move => ? ? bufv ? krv c.
 have -> /= : (c = (c.`1,c.`2)) by smt().
  rewrite !tP /= => [#] H0 H1 i ib.
 rewrite !initiE 1:/# /=.
 case (i < 1408) => *.
 + rewrite H0;  smt(Array1408.initiE Array160.initiE).
  have ? := H1 (i-1408); smt(Array1408.initiE Array160.initiE).

sp 2 0; seq 1 0 : (#pre /\ 
                  (c{2}  = cph{2} => cnd{1} = W64.of_int 0) /\
                  (c{2}  <> cph{2} => cnd{1} = W64.of_int 1)).
+  conseq (_: _ ==> (c{2}  = cph{2} => cnd{1} = W64.of_int 0) /\
                  (c{2}  <> cph{2} => cnd{1} = W64.of_int 1)); 1: smt(). 
   ecall {1} (verify_correct ct{1} ctc{1}).
   auto => /> &1 &2; rewrite  !tP.
   move  => ??cphv???rst Heq Hdiff.
   rewrite (_: cph{2} = (cph{2}.`1, cph{2}.`2)) /= in cphv; 1: by smt().
   move : cphv;rewrite !tP ; move => [cphv1 cphv2].
   split.
   + move => ceq; rewrite (Heq _); last by done.
     move => i0 ib; rewrite !initiE //=. 
     case (i0 < 1408).
     + by move => ibb; rewrite ceq cphv1 1: /# initiE /= /#.
     by move => ibb; rewrite ceq cphv2 1: /# initiE /= /#. 
   move => neq;rewrite Hdiff. 
   pose cc := (Array1568.init (fun (i1 : int) => if i1 < 1408 then c{2}.`1.[i1] else c{2}.`2.[i1 - 1408])).
   have : exists i0, 0<= i0 < 1568 /\ cc.[i0] <> s_ct{1}.[i0]; last by smt().
   case (c{2}.`1 <> cph{2}.`1).
   + move => neq1. rewrite tP in neq1.   
     have [k kb] : exists k, 0<=k<1408 /\ c{2}.`1.[k] <> cph{2}.`1.[k] by smt().
     exists k; split; 1: by smt().
     rewrite !initiE /= 1:/#. 
     move : (cphv1 k _); 1: smt().
     by rewrite initiE /= /#.
   + move => eq1. 
     have neq2 : c{2}.`2 <> cph{2}.`2 by move : neq eq1; smt().
     rewrite tP in neq2.   
     have [k kb] : exists k, 0<=k<160 /\ c{2}.`2.[k] <> cph{2}.`2.[k] by smt().
     exists (k + 1408); split; 1: by smt().
     rewrite !initiE /= 1:/#. 
     move : (cphv2 k _); 1: smt().
     by rewrite initiE /= /#.
  done.

ecall {1} (cmov_correct shk{1} 
   (Array32.init (fun (i_0 : int) => kr{1}.[0 + i_0])) cnd{1}) => /=.

wp;ecall{1} (j_shake
  (Array32.init  (fun (i_0 : int) =>   s_sk{1}.[4 * 384 + (4 * 384 + 32) + 32 + 32 - 32 + i_0]))
  ct{1}) => /=.

+ auto => /> &1 &2.
   move  => ??cphv??rst Heq Hdiff.
   rewrite (_: cph{2} = (cph{2}.`1, cph{2}.`2)) /= in cphv; 1: by smt().

do split.
+ move => badc  back c0 c1.
  + by rewrite c1 1:/# /J;congr;  smt().
  + move => ? rr H?; rewrite H;1:smt().
    rewrite tP => *; rewrite initiE /#. 
qed.
