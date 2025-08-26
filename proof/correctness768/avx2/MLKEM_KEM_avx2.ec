require import AllCore IntDiv List.

from JazzEC require import Jkem1024_avx2.

from JazzEC require import Array1152 Array32 Array1408 Array1568 Array1536 Array64 Array128 Array160 Array3168 WArray3168 WArray1568 WArray64 Array1600.
from Jasmin require import JModel.

from CryptoSpecs require import GFq Rq Sampling Serialization Symmetric VecMat InnerPKE1024 MLKEM1024 Correctness1024.
import Serialization1024 Symmetric1024 VecMat1024.
require import Fq MLKEM_Poly MLKEM_PolyVec MLKEM_InnerPKE MLKEM_InnerPKE_avx2 MLKEMFCLib.

import MLKEM_Poly.
import MLKEM_PolyVec.

require import MLKEM_keccak_avx2.

lemma pack_inj : injective W8u8.pack8_t by apply (can_inj W8u8.pack8_t W8u8.unpack8 W8u8.pack8K).

lemma mlkem_kem_correct_kg  : 
   equiv [Jkem1024_avx2.M.__crypto_kem_keypair_jazz ~ MLKEM1024.kg_derand : 
        coins{2}.`1 = Array32.init(fun i => randomnessp{1}.[0 + i]) /\
        coins{2}.`2 = Array32.init(fun i => randomnessp{1}.[32 + i])
        ==> 
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk.`1 = Array1536.init (fun i => res{1}.`2.[i]) /\
         sk.`2.`1 = Array1536.init (fun i =>  res{1}.`2.[i + 1536]) /\
         sk.`2.`2 = Array32.init (fun i =>  res{1}.`2.[i + 1536 + 1536]) /\
         sk.`3 = Array32.init (fun i => res{1}.`2.[i + 1536 + 1536 + 32]) /\
         sk.`4 = Array32.init (fun i => res{1}.`2.[i + 1536 + 1536 + 32 + 32]) /\
         t = Array1536.init (fun i => res{1}.`1.[i])  /\
         rho = Array32.init (fun i => res{1}.`1.[i+1536])].
proof.
proc => /=.
seq 4 0 : #pre;1: by auto.
swap {1} 1 11. sp.
seq 3 1 : (#{/~skcpa{1}}{~sk{1}}pre /\  
   (forall k, 0 <= k < 1536 => sk{1}.[k] = sk{2}.[k]) /\
   pk{2}.`1 = Array1536.init (fun i => pk{1}.[i])  /\
   pk{2}.`2 = Array32.init (fun i => pk{1}.[i+1536])).
+ wp;call (mlkem_correct_kg_avx2);auto => /> &1 &2;rewrite !tP => ??;split.
  + move => *; rewrite initiE 1:/#;smt(Array32.initiE).
  move => ? rl [[rr11 rr12] rr2] /= [#];rewrite !tP => *; do split. 
  + move => *; rewrite initiE 1:/# /= /#. 
  + by move => *; rewrite initiE 1:/# /=; smt(Array1536.initiE).
  + by move => *; rewrite initiE 1:/# /=; smt(Array32.initiE).

seq 3 0 : (#pre /\
 (forall (k : int), 0 <= k < 1568 => sk{1}.[k+1536] = pk{1}.[k])).
+ while {1} (#pre /\ inc{1} = 196 /\ 0 <= i{1} <= 196 /\
    (forall k, 0 <= k < i{1}*8 =>
        sk{1}.[k+1536] = pk{1}.[k])) (196-i{1}); last by auto => />; smt().
  move => &2 ?; auto => /> &1 ?????????;do split;2..3,5..:smt().
  + move => k kbl kbh;rewrite initiE 1:/# /= get8_set64_directE 1,2:/#.
    case ((192 + i{1}) * 8 <= k < (192 + i{1}) * 8 + 8 ) => *.
    +  rewrite /get64 /init8 /(\bits8) wordP => *.
       by rewrite initiE 1:/# /=  /get64_direct /pack8_t initiE 1:/# /= initiE 1:/# /= initiE 1:/# /#. 
    rewrite /get8 /init8 /(\bits8) wordP => *.
    rewrite initiE 1:/# /= /#.
  + move => k kbl kbh;rewrite initiE 1:/# /= get8_set64_directE 1,2:/#.
    case ((192 + i{1}) * 8 <= k + 1536 < (192 + i{1}) * 8 + 8 ) => *.
    +  rewrite /get64 /init8 /(\bits8) wordP => *.
       by rewrite initiE 1:/# /=  /get64_direct /pack8_t initiE 1:/# /= initiE 1:/# /= initiE 1:/# /#. 
    rewrite /get8 /init8 /(\bits8) wordP => *.
    rewrite initiE 1:/# /= /#.
    
seq 2 1 : (#pre /\
    (forall (k : int), 0 <= k < 32 => sk{1}.[k+1536 + 1568] = hpk{2}.[k])).
wp;ecall {1} (sha3_256A_M1568_ph pk{1}).
+ auto => /> &1 &2 ??????; do split.
  + move => *; rewrite initiE 1:/# /= /#. 
  + by move => *; rewrite initiE 1:/# /=; smt(Array1536.initiE).
  + by move => *; rewrite initiE 1:/# /=; smt(Array32.initiE).

seq  5 0 : (#pre /\
    (forall (k : int), 0 <= k < 32 => sk{1}.[k+1536 + 1568 + 32] =randomnessp{1}.[k+32])).
+ while {1} (#pre /\ inc{1} = 4 /\ 0 <= i{1} <= 4 /\
    (forall k, 0 <= k < i{1}*8 =>
        sk{1}.[k+1536+1568+32] = randomnessp{1}.[k+32])) (4-i{1}); last by auto => /> /#.
+  move => &2 ?; auto => /> &1 ???????????;do split;4,5,7..:smt().
  + move => k kbl kbh;rewrite initiE 1:/# /= get8_set64_directE 1,2:/#.
    case ((392 + i{1}) * 8 <= k < (392 + i{1}) * 8 + 8 ) => *.
    +  rewrite /get64 /init8 /(\bits8) wordP => *.
       by rewrite initiE 1:/# /=  /get64_direct /pack8_t initiE 1:/# /= initiE 1:/# /= /#.
    rewrite /get8 /init8 /(\bits8) wordP => *.
    rewrite initiE 1:/# /= /#.
  + move => k kbl kbh;rewrite initiE 1:/# /= get8_set64_directE 1,2:/#.
    case ((392 + i{1}) * 8 <= k + 1536 < (392 + i{1}) * 8 + 8 ) => *.
    +  rewrite /get64 /init8 /(\bits8) wordP => *.
       by rewrite initiE 1:/# /=  /get64_direct /pack8_t initiE 1:/# /= initiE 1:/# /= /#. 
    rewrite /get8 /init8 /(\bits8) wordP => *.
    rewrite initiE 1:/# /= /#.
  + move => k kbl kbh;rewrite initiE 1:/# /= get8_set64_directE 1,2:/#.
    case ((392 + i{1}) * 8 <= k + 3104 < (392 + i{1}) * 8 + 8) => *.
    +  rewrite /get64 /init8 /(\bits8) wordP => *.
       by rewrite initiE 1:/# /=  /get64_direct /pack8_t initiE 1:/# /= initiE 1:/# /= /#. 
    rewrite /get8 /init8 /(\bits8) wordP => *.
    rewrite initiE 1:/# /= /#.
  + move => k kbl kbh;rewrite initiE 1:/# /= get8_set64_directE 1,2:/#.
    case (k < i{1}*8) => *. 
    + rewrite ifF 1:/#. 
      rewrite /get8 /init8 /(\bits8) wordP => kk kkb.
      rewrite initiE 1:/# /= /#.
    rewrite ifT 1:/#.
    rewrite /get64 /init8 /(\bits8) wordP => kk kkb.
    rewrite initiE 1:/# /=  /get64_direct /pack8_t initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.

auto => /> &1 &2; rewrite !tP => *;do split.
  + move => *; rewrite initiE 1:/# /= /#. 
  + by move => *; rewrite tP => *; rewrite initiE 1:/# /=  ; smt(Array1536.initiE).
  + by move => *; rewrite tP => *; rewrite initiE 1:/# /=  ; smt(Array32.initiE).
  + move => *; rewrite initiE 1:/# /=;smt(Array32.initiE).
  + by move => *; rewrite initiE 1:/# /=; smt(Array32.initiE).
 
qed.

from JazzEC require import WArray32 Array4.

lemma mlkem_kem_correct_enc  : 
   equiv [Jkem1024_avx2.M.__crypto_kem_enc_jazz ~ MLKEM1024.enc_derand: 
     randomnessp{1} = coins{2} /\
     pk{2}.`1 = Array1536.init( fun i => pk{1}.[i]) /\
     pk{2}.`2 = Array32.init( fun i => pk{1}.[1536+i])
       ==> 
     let (c,k) = res{2} in
     c.`1 = Array1408.init (fun i => res{1}.`1.[i]) /\
     c.`2 = Array160.init (fun i => res{1}.`1.[i+1408]) /\
     k = res{1}.`2
].
proc => /=;sp 0 1.
seq 6 2 : (#pre /\
    Array32.init (fun (i : int) => kr{1}.[0 + i]) = _K{2} /\
    Array32.init (fun (i : int) => kr{1}.[32 + i]) = r{2} /\
    Array32.init (fun (i : int) => buf{1}.[i]) = m{2}).
    wp; ecall {1} (sha3_512A_A64_ph buf{1}). 
    wp; ecall {1} (sha3_256A_M1568_ph pk{1}). 
    
auto => /> &1 &2;rewrite !tP => *;do split => *.
+ rewrite initiE 1:/# /= initiE 1:/# /= ifT 1:/# /= /G_mhpk;congr;congr;congr.
   + rewrite tP => *; rewrite  initiE 1:/# /= initiE 1:/# /= ifF 1:/# /= initiE 1:/# /= ifT 1:/# /= initiE 1:/# /get8 initiE 1:/# /= initiE 1:/# /= /get64_direct wordP => *.
   rewrite /pack8_t /= /(\bits8) initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
   + rewrite tP => *; rewrite  initiE 1:/# /= initiE 1:/# /= ifT 1:/# /= initiE 1:/# /= /H_pk /SHA3_256_1568_32 get_of_list 1:/#;congr;congr;congr.
      + congr;rewrite tP => *; rewrite initiE 1:/# /=;smt(Array1536.initiE). 
      + congr;rewrite tP => *; rewrite initiE 1:/# /=;smt(Array32.initiE). 


+ rewrite initiE 1:/# /= initiE 1:/# /= ifF 1:/# /= /G_mhpk;congr;congr;
congr.
   + rewrite tP => *; rewrite  initiE 1:/# /= initiE 1:/# /= ifF 1:/# /= initiE 1:/# /= ifT 1:/# /= initiE 1:/# /get8 initiE 1:/# /= initiE 1:/# /= /get64_direct wordP => *.
   rewrite /pack8_t /= /(\bits8) initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
   + rewrite tP => *; rewrite  initiE 1:/# /= initiE 1:/# /= ifT 1:/# /= initiE 1:/# /= /H_pk /SHA3_256_1568_32 get_of_list 1:/#;congr;congr;congr.
      + congr;rewrite tP => *; rewrite initiE 1:/# /=;smt(Array1536.initiE). 
      + congr;rewrite tP => *; rewrite initiE 1:/# /=;smt(Array32.initiE). 

+ rewrite initiE 1:/# /= initiE 1:/# /= ifF 1:/# /= initiE 1:/# /= ifT 1:/# /= initiE 1:/# /= /get8 initiE 1:/# /= initiE 1:/# /= /get64_direct wordP => *.
   rewrite /pack8_t /= /(\bits8) initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.

wp; ecall (mlkem_correct_enc_1_avx2 pk{1}) => /=.
auto => /> &1 &2; rewrite tP => *;do split;1:smt().
move => ? r0 [r111 r12] /= [#]; rewrite !tP => *;do split;1,2:smt().
move => *;rewrite !initiE 1,2:/# /= /get8 initiE 1:/# /= initiE 1:/# /= /get64_direct wordP => *.
   rewrite /pack8_t /= /(\bits8) initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#. 
qed.

require import StdOrder. 
import IntOrder.
lemma verify_correct_h _ct _ct1 :
  hoare [Jkem1024_avx2.M.__verify : 
             ct = _ct /\ ctpc =_ct1 ==>
             (_ct = _ct1 => res = W64.of_int 0) /\
             (_ct <> _ct1 => res = W64.of_int 1) 
].
proc => /=.

wp; while (#pre /\ 0 <= i{hr} <= 49 /\ inc{hr} = 49 /\ 0<=to_uint cnd<256 /\
           (to_uint h{hr} = 0 <=> 
            (forall k, 0 <= k < i{hr}*32 => ct.[k] = ctpc.[k]))); last first.
+ auto => />; split; 1: by smt().
  move => h i ??? [HL HR]; split; last first.
  + rewrite tP => H1.
    rewrite /VPTEST_256 /= /ZF_of /= ifT //.
    move : H1; rewrite negb_forall /= => [[k H]]. 
    move : H; rewrite negb_imply  /= => [# H1 H2 H3].
    rewrite implybE in HL; elim HL; smt(to_uint0). 

  + rewrite tP => H1.
    rewrite /VPTEST_256 /= /ZF_of /= ifF //.
    rewrite implybE in HR; elim HR.
    +  rewrite negb_forall /= => [[k H]].  
       move : H; rewrite negb_imply  /= => [# H2 H3 H4].
       smt(Array1568.initiE).
    smt(W256.to_uint_eq W256.to_uint0).

auto => /> &hr ???? [HL HR] ?.
pose x := get256 (WArray1568.init8 ("_.[_]" _ct1)) i{hr} `^` get256 (WArray1568.init8 ("_.[_]" _ct)) i{hr}.
do split; 1..2: by smt().
+ move => H0 k kbl kbh.

  have H1 : to_uint h{hr} = 0. 
  + have : h{hr} = W256.zero; last by rewrite to_uint_eq /=.
    have : (h{hr} `|` x) = W256.zero by rewrite to_uint_eq  H0 /=.
    by rewrite !wordP; smt(orwE zerowE).

  have H2 : x = W256.zero.
  + have : (h{hr} `|` x) = W256.zero by rewrite to_uint_eq  H0 /=. 
    by rewrite !wordP; smt(orwE zerowE).

  case (k < i{hr}*32); 1: by move => *; apply (HL _ _) => // /#. 
 
  move => kv.
  move : H2; rewrite /x W256.WRing.addr_eq0 /oppw /=. 
  rewrite /init8 /loadW256 /loadW8 /get256_direct wordP => H2.
  apply W8.wordP => j jb.
  move : (H2 ((k - i{hr} * 32) * 8 + j) _). smt().
  rewrite !pack32wE /=; 1,2: smt().
  rewrite !initiE /=; 1,2: smt().
  rewrite !WArray1568.initiE 1,2:/# /=; smt().

move => H0.
have -> : h{hr} = W256.zero by rewrite to_uint_eq /= /#.
rewrite or0w;have -> : x = W256.zero; last by auto.
rewrite wordP => k kb; rewrite zerowE /x.
move : H0;rewrite /init8 /loadW256 /loadW8 /get256_direct => H0. 
pose xx := pack32_t _.
pose yy := pack32_t _.
have -> : xx = yy; last by rewrite xorwK_s //.
rewrite /xx /yy wordP => j jb.
  rewrite !pack32wE /=; 1,2: smt().
  rewrite !initiE /=; 1,2: smt().
  rewrite !WArray1568.initiE 1,2:/# /=; smt().
qed.

lemma verify_ll : islossless Jkem1024_avx2.M.__verify.
proc.
wp.
while (0 <= i{hr} <= 49 /\ inc{hr} = 49) (49 - i{hr}).
auto => /> /#.
auto => /> /#. 
qed.

lemma verify_correct  _ct _ct1 :
  phoare [Jkem1024_avx2.M.__verify : 
              ct = _ct /\ ctpc =_ct1 ==>
             (_ct = _ct1 => res = W64.of_int 0) /\
             (_ct <> _ct1 => res = W64.of_int 1) ] = 1%r 
   by conseq verify_ll (verify_correct_h  _ct _ct1).

lemma cmov_correct_h _dst _src _cnd :
   hoare [Jkem1024_avx2.M.__cmov : 
             src = _src /\ cnd = _cnd /\  dst = _dst ==>
             (_cnd = W64.of_int 0 => res = _src)/\
             (_cnd = W64.of_int 1 => res = _dst)].
proc => /=.
seq 1 : (#{/~cnd}pre /\ (_cnd = W64.zero => cnd = W64.zero) /\
                (_cnd = W64.one => cnd = W64.onew));
  1: by auto => />   /=; split; [ by ring | by rewrite W64.minus_one /=].

have msb1 : forall i,  0 <= i < 8 => msb (W64.onew \bits8 i) = true.
+ move => i ib; rewrite /msb /=.
  have -> : W64.onew \bits8 i = W8.onew.
  + rewrite wordP => k kb.
    rewrite onewE /= kb /= bits8iE //= /#.
  by rewrite  to_uint_onew /=.

have msb0 : forall i, 0 <= i <8 => msb (W64.zero \bits8 i) = false.
+ move => i ib; rewrite /msb /=.
  have -> : W64.zero \bits8 i = W8.zero.
  + rewrite wordP => k kb.
    rewrite zerowE  /= bits8iE //= /#.
  by rewrite to_uint0 /=.

auto => /> &hr H H0;split.

+ move =>czero; move : (H czero) => -> /=;rewrite tP => k kb.
rewrite !initiE //= kb /=.
have HH : forall ii, 0<=ii <32 => VPBLENDVB_256 ((WArray32.get256_direct ((WArray32.init8 ("_.[_]" _src))) 0))
          (get256_direct (WArray32.init8 ("_.[_]" _dst)) 0) (VPBROADCAST_4u64 W64.zero) \bits8
        ii = _src.[ii]; last by rewrite HH. 
move => ii iib.
rewrite /get256_direct /init8 /loadW256 /loadW8 /= wordP => i ib.
rewrite /VPBLENDVB_256 /VPBROADCAST_4u64 /(\bits8) -iotaredE /= /VPBLENDVB_128 /= !msb0 //=  initiE //=.
rewrite pack32E initiE /= 1:/# /of_list initiE /= /#.
 
+ move =>cone; move : (H0 cone) => -> /=;rewrite tP => k kb.
rewrite initiE //= /storeW256 kb /=.
have HH : forall ii, 0<=ii <32 => VPBLENDVB_256 ((WArray32.get256_direct ((WArray32.init8 ("_.[_]" _src))) 0))
        (get256_direct (WArray32.init8 ("_.[_]" _dst)) 0) (VPBROADCAST_4u64 W64.onew) \bits8
              ii = _dst.[ii]; last by rewrite HH. 
move => ii iib.
rewrite /get256_direct /init8 /loadW256 /loadW8 /= wordP => i ib.
rewrite /VPBLENDVB_256 /VPBROADCAST_4u64 /(\bits8) -iotaredE /= /VPBLENDVB_128 /= !msb1 //=  initiE //=.
by rewrite pack32E initiE /= 1:/# /of_list !initiE /= /#.
qed.

lemma cmov_ll : islossless Jkem1024_avx2.M.__cmov by islossless.


lemma cmov_correct _dst _src _cnd:
   phoare [Jkem1024_avx2.M.__cmov : 
            src = _src /\ cnd = _cnd /\  dst = _dst ==>
             (_cnd = W64.of_int 0 => res = _src)/\
             (_cnd = W64.of_int 1 => res = _dst)] = 1%r
    by conseq cmov_ll (cmov_correct_h _dst _src _cnd).

from JazzEC require import Array196.
lemma mlkem_kem_correct_dec  : 
   equiv [Jkem1024_avx2.M.__crypto_kem_dec_jazz ~ MLKEM1024.dec: 
     sk{2}.`1 = Array1536.init (fun i =>  sk{1}.[i]) /\
     sk{2}.`2.`1 = Array1536.init (fun i => sk{1}.[i + 1536]) /\
     sk{2}.`2.`2 = Array32.init (fun i =>  sk{1}.[i + 1536 + 1536]) /\
     sk{2}.`3 = Array32.init (fun i => sk{1}.[i + 1536 + 1536 + 32]) /\
     sk{2}.`4 = Array32.init (fun i => sk{1}.[i+ 1536 + 1536 + 32 + 32]) /\
     let (c1,c2) = cph{2} in
       c1 = Array1408.init(fun i => ct{1}.[i]) /\
       c2 = Array160.init(fun i => ct{1}.[i + 1408])
       ==> ={res}].
proc => /=. sp 0 1. swap {1} [4..5] 6.

seq 4 1 : (#pre /\ aux{1} = m{2}); 
  1: by call (mlkem_correct_dec); 1: by auto => /> /#.

seq 3 1 : (#pre /\ 
           (forall k, 0<=k<32 => buf{1}.[k] = m{2}.[k]) /\
           (forall k, 0<=k<32 => kr{1}.[k] = _K{2}.[k]) /\
           (forall k, 0<=k<32 => kr{1}.[k+32] = r{2}.[k])).
ecall {1} (sha3_512A_A64_ph buf{1}).
+ auto => /> &1 &2; rewrite !tP => buf bvl bvh ; do split.
  +  move => k kbl kbh; rewrite initiE 1:/# /= ifF 1:/# initiE 1:/# /#. 
  + move => k kbl kbh; rewrite initiE 1:/# /= kbh /= /G_mhpk; congr; congr;congr.
    + rewrite tP => i ib; rewrite initiE 1:/# /= initiE  1:/# /= ifF 1: /# initiE /#.
    rewrite tP => i ib; rewrite initiE 1:/# /= initiE  1:/# /= ifT 1: /# initiE 1:/# /= initiE 1:/# /=.
    rewrite /get8 initiE 1:/# /= initiE 1:/# /= /get64 /(\bits8) wordP => *.
    rewrite initiE 1:/# /= /init8 /get64_direct /pack8_t initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  + move => k kbl kbh; rewrite initiE 1:/# /= ifF 1:/# /= /G_mhpk; congr; congr;congr.
    + rewrite tP => i ib; rewrite initiE 1:/# /= initiE  1:/# /= ifF 1: /# initiE /#.
    rewrite tP => i ib; rewrite initiE 1:/# /= initiE  1:/# /= ifT 1: /# initiE 1:/# /= initiE 1:/# /=.
    rewrite /get8 initiE 1:/# /= initiE 1:/# /= /get64 /(\bits8) wordP => *.
    rewrite initiE 1:/# /= /init8 /get64_direct /pack8_t initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.

swap {2} 1 1.

seq 1 1 : (#pre /\ 
           ctc{1} = Array1568.init (fun i => if i < 1408 then c{2}.`1.[i] else c{2}.`2.[i-1408])).
print mlkem_correct_enc_1_avx2.
+ wp;ecall (mlkem_correct_enc_1_avx2 (Array1568.init (fun (i : int) => sk{1}.[4 * 384 + i]))).

  auto => /> &1 &2; rewrite !tP => ??????; do split.
  + by move => i ib; rewrite initiE /= /#.
  + by move => i ib; rewrite initiE /= /#.
  + move => i ib; rewrite initiE /= 1:/# initiE /= 1:/#;smt(Array1536.initiE).
  + move => i ib; rewrite initiE /= 1:/# initiE /= 1:/#;smt(Array32.initiE).
  move => /= ?  bufv ? krv rl [rr1 rr2] /=;rewrite !tP => H. 
  by move => *;rewrite !initiE 1:/# /=; by  smt(Array160.initiE Array1408.initiE).

seq 1 0 : (#pre /\ 
                  (c{2}  = cph{2} => cnd{1} = W64.of_int 0) /\
                  (c{2}  <> cph{2} => cnd{1} = W64.of_int 1)).
   ecall {1} (verify_correct ct{1} ctc{1}). 
   auto => /> &1 &2; rewrite !tP.
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
   have : exists i0, 0<= i0 < 1568 /\ 
     ct{1}.[i0] <>
     (Array1568.init (fun (i1 : int) => if i1 < 1408 then c{2}.`1.[i1] else c{2}.`2.[i1 - 1408])).[i0]; last by smt().
   case (c{2}.`1 <> cph{2}.`1).
   + move => neq1. rewrite tP in neq1.   
     have [k kb] : exists k, 0<=k<1408 /\ c{2}.`1.[k] <> cph{2}.`1.[k] by smt().
     exists k; split; 1: by smt().
     rewrite initiE /= 1:/#. 
     move : (cphv1 k _); 1: smt().
     by rewrite initiE /= /#.
   + move => eq1. 
     have neq2 : c{2}.`2 <> cph{2}.`2 by move : neq eq1; smt().
     rewrite tP in neq2.   
     have [k kb] : exists k, 0<=k<160 /\ c{2}.`2.[k] <> cph{2}.`2.[k] by smt().
     exists (k + 1408); split; 1: by smt().
     rewrite initiE /= 1:/#. 
     move : (cphv2 k _); 1: smt().
     by rewrite initiE /= /#.
  done.


ecall {1} (cmov_correct shk{1} (Array32.init (fun (i : int) => kr{1}.[0 + i])) cnd{1}).
wp;ecall{1} (shake256_A32_A1600_ph zp_ct{1}).

+ auto => /> &1 &2; rewrite  !tP =>??.
  have ->/= : (cph{2} = (cph{2}.`1,cph{2}.`2)) by smt(). 
  move =>[#]; rewrite !tP => cphv1 cphv2 ???ceq cdif.
do split. 
+ move => badc back c0 c1.
  +  move : (c1 (cdif badc)).
    rewrite !tP => H k kb.
    rewrite (H k kb) !initiE 1,2:/# /=.
    rewrite /J; congr; congr;congr;congr.
    + congr;rewrite tP => kk kkb; rewrite !initiE 1..3:/# /= ifF 1:/# initiE 1:/# /=kkb /= initiE 1:/#.
      rewrite /get8 initiE 1:/# /= initiE 1:/# /= /get64 /(\bits8) wordP => *.
    rewrite initiE 1:/# /= /init8 /get64_direct /pack8_t initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
    + congr;rewrite tP => kk kkb; rewrite !initiE 1:/# /= initiE 1:/# /= ifT 1:/# /= initiE 1:/# /=.
      rewrite /get8 initiE 1:/# /= initiE 1:/# /= /get64 /(\bits8) wordP => *.
    rewrite initiE 1:/# /= /init8 /get64_direct /pack8_t initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
    smt(Array1408.initiE Array160.initiE).

  rewrite tP => kk kkb; rewrite !initiE 1:/# /= initiE 1:/# /= ifT 1:/# /= initiE 1:/# /=.
      rewrite /get8 initiE 1:/# /= initiE 1:/# /= /get64 /(\bits8) wordP => *.
    rewrite initiE 1:/# /= /init8 /get64_direct /pack8_t initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
    smt(Array1408.initiE Array160.initiE).

move => goodc  back c0 c1.
  + move : (c0 (ceq goodc)).
    rewrite !tP => H k kb.
    by rewrite (H k kb) initiE /#.
qed.
