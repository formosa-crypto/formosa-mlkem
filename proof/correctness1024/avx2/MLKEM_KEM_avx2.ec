require import AllCore IntDiv List.

from JazzEC require import Jkem1024_avx2.

from JazzEC require import Array1152 Array32 Array1408 Array1568 Array1536 Array64 Array128 Array160 Array3168 WArray3168 WArray1568 WArray64.
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

lemma verify_correct_h mem (_ctp : int) ctp1 :
  hoare [Jkem1024_avx2.M.__verify : 
             Glob.mem = mem /\ valid_ptr _ctp 1568 /\
             to_uint ctp = _ctp /\ ctpc = ctp1 ==>
             Glob.mem = mem /\
             (Array1568.init (fun i => loadW8 mem (_ctp + i)) = ctp1 => 
                       res = W64.of_int 0) /\
             (Array1568.init (fun i => loadW8 mem (_ctp + i)) <> ctp1 => 
                       res = W64.of_int 1)].
proc => /=.
seq 8 : (#post); last first.
wp. conseq />. while(i=1568 /\ inc=1568 /\ #pre); 1: by auto => />. 
+ (*conseq />; 1: by smt(). *)
  conseq />; first by move => /> *; split; smt().
  auto => />.  
  move => &hr H H1 _cnd H2 H3.
  split. 
  + by move => H4; move : (H2 H4) => -> /=; rewrite W64.WRingA.oppr0 to_uint_eq W64.shr_div_le //.
  + move => H5; move : (H3 H5) => -> /=; rewrite W64.minus_one /= wordP => i ib.
    by rewrite /(`>>`) shrwE ib /= /(W64.one) /= /bits2w /= initiE //= /int2bs /= /mkseq /= -iotaredE /= /#. 

wp; while (#pre /\ 0 <= i{hr} <= 49 /\ inc{hr} = 49 /\ 0<=to_uint cnd<256 /\
           (to_uint h{hr} = 0 <=> 
            forall k, 0 <= k < i{hr}*32 => loadW8 mem (_ctp + k) = ctp1.[k])); last first.
+ auto => /> &hr ??; split; 1: by smt().
  move => h i ??? [HL HR]; split; last first.
  + rewrite tP => H1.
    rewrite /VPTEST_256 /= /ZF_of /= ifT //.
    move : H1; rewrite negb_forall /= => [[k H]]. 
    move : H; rewrite negb_imply  /= => [# H1 H2 H3].
    rewrite initiE //= in H3.
    rewrite implybE in HL; elim HL; smt(to_uint0). 

  + rewrite tP => H1.
    rewrite /VPTEST_256 /= /ZF_of /= ifF //.
    rewrite implybE in HR; elim HR.
    +  rewrite negb_forall /= => [[k H]].  
       move : H; rewrite negb_imply  /= => [# H2 H3 H4].
       smt(Array1568.initiE).
    smt(W256.to_uint_eq W256.to_uint0).

auto => /> &hr ?????? [HL HR] ?.
pose x := 
      ((WArray1568.WArray1568.get256 ((WArray1568.WArray1568.init8 ("_.[_]" ctp1)))%WArray1568.WArray1568 i{hr})) `^`
        loadW256 mem (to_uint (ctp{hr} + (of_int (32 * i{hr}))%W64)).
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
  rewrite to_uintD_small /=; 1: by rewrite /= of_uintK /=; by smt(W64.to_uint_cmp).  
  rewrite /= of_uintK /= (modz_small _  18446744073709551616) 1:/#.
  rewrite WArray1568.WArray1568.initiE 1:/# /=. smt().

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
  rewrite to_uintD_small /=; 1: by rewrite /= of_uintK /=; by smt(W64.to_uint_cmp).  
  rewrite /= of_uintK /= (modz_small _  18446744073709551616) 1:/#.
  rewrite WArray1568.WArray1568.initiE 1:/# /=. smt().
qed.

lemma verify_ll : islossless Jkem1024_avx2.M.__verify.
proc.
seq 8 : (#post) => //; last first.
wp. conseq />. while(i=1568 /\ inc=1568 /\ #pre) (1568 - inc); 1,2:   by auto => />. 
wp.
while (0 <= i{hr} <= 49 /\ inc{hr} = 49) (49 - i{hr}).
auto => /> /#.
auto => /> /#. 
qed.

lemma verify_correct mem (_ctp : int) ctp1 :
  phoare [Jkem1024_avx2.M.__verify : 
             Glob.mem = mem /\ valid_ptr _ctp 1568 /\
             to_uint ctp = _ctp /\ ctpc = ctp1 ==>
             Glob.mem = mem /\
             (Array1568.init (fun i => loadW8 mem (_ctp + i)) = ctp1 => 
                       res = W64.of_int 0) /\
             (Array1568.init (fun i => loadW8 mem (_ctp + i)) <> ctp1 => 
                       res = W64.of_int 1)] = 1%r 
   by conseq verify_ll (verify_correct_h mem _ctp ctp1).

lemma cmov_correct_h _dst _src _cnd mem:
   hoare [Jkem1024_avx2.M.__cmov : 
             Glob.mem = mem /\ valid_ptr _dst 32 /\
             src = _src /\ cnd = _cnd /\ to_uint dst = _dst ==>
             touches mem Glob.mem _dst 32 /\
             (_cnd = W64.of_int 0 => 
               (Array32.init (fun i => loadW8 Glob.mem (_dst + i))) = _src) /\
             (_cnd = W64.of_int 1 => 
               (Array32.init (fun i => loadW8 Glob.mem (_dst + i))) = 
                (Array32.init (fun i => loadW8 mem (_dst + i))))].
proc => /=.
seq 1 : (#{/~cnd}pre /\ (_cnd = W64.zero => cnd = W64.zero) /\
                (_cnd = W64.one => cnd = W64.onew));
  1: by auto => /> &1 ?? /=; split; [ by ring | by rewrite W64.minus_one /=].

unroll ^while.

seq 5 : (#post /\ inc{hr}= 1 /\ i{hr}=1); last first.
+ wp; conseq />; while(i=1 /\ inc=1 /\ #pre); auto => /> /#. 

rcondt 5; 1: by move => *; auto => />.

auto => /> &hr H H0 H1 H2.

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

do split.
+ rewrite /touches => a ab.
  rewrite /storeW256 /loadW256 /loads /stores /=.
  by do 32!(rewrite get_setE ifF 1:/#);smt().

+ move =>czero; move : (H1 czero) => -> /=;rewrite tP => k kb.
rewrite initiE //= /storeW256 /=.
have HH : forall ii, 0<=ii <32 => VPBLENDVB_256 ((WArray32.WArray32.get256_direct ((WArray32.WArray32.init8 ("_.[_]" _src))) 0))
          (loadW256 mem (to_uint dst{hr})) (VPBROADCAST_4u64 W64.zero) \bits8
        ii = _src.[ii]; last first. 
+ rewrite !HH //=.
  by rewrite /loadW8 /stores /= !get_setE /= /#.
move => ii iib.
rewrite /get256_direct /init8 /loadW256 /loadW8 /= wordP => i ib.
rewrite /VPBLENDVB_256 /VPBROADCAST_4u64 /(\bits8) -iotaredE /= /VPBLENDVB_128 /= !msb0 //=  initiE //=.
rewrite pack32E initiE /= 1:/# /of_list initiE /= /#.
 
+ move =>cone; move : (H2 cone) => -> /=;rewrite tP => k kb.
rewrite initiE //= /storeW256 /=.
have HH : forall ii, 0<=ii <32 => VPBLENDVB_256 ((WArray32.WArray32.get256_direct ((WArray32.WArray32.init8 ("_.[_]" _src))) 0))
        (loadW256 mem (to_uint dst{hr})) (VPBROADCAST_4u64 W64.onew) \bits8
              ii = ((init (fun (i0 : int) => loadW8 mem (to_uint dst{hr} + i0))))%Array32.[ii]; last first. 
+ rewrite !HH //=.
  by rewrite initiE //= /loadW8 /stores /= !get_setE /= /#.
move => ii iib.
rewrite /get256_direct /init8 /loadW256 /loadW8 /= wordP => i ib.
rewrite /VPBLENDVB_256 /VPBROADCAST_4u64 /(\bits8) -iotaredE /= /VPBLENDVB_128 /= !msb1 //=  initiE //=.
by rewrite pack32E initiE /= 1:/# /of_list !initiE /= /#.
qed.

lemma cmov_ll : islossless Jkem1024_avx2.M.__cmov.
proc => /=.
unroll 6.

+ wp; conseq />; while(i=1 /\ inc=1 /\ #pre) (1-i); auto => /> /#. 
qed.


lemma cmov_correct _dst _src _cnd mem:
   phoare [Jkem1024_avx2.M.__cmov : 
             Glob.mem = mem /\ valid_ptr _dst 32 /\
             src = _src /\ cnd = _cnd /\ to_uint dst = _dst ==>
             touches mem Glob.mem _dst 32 /\
             (_cnd = W64.of_int 0 => 
               (Array32.init (fun i => loadW8 Glob.mem (_dst + i))) = _src) /\
             (_cnd = W64.of_int 1 => 
               (Array32.init (fun i => loadW8 Glob.mem (_dst + i))) = 
                (Array32.init (fun i => loadW8 mem (_dst + i))))] = 1%r
    by conseq cmov_ll (cmov_correct_h _dst _src _cnd mem).

lemma mlkem_kem_correct_dec mem _ctp _skp _shkp : 
   equiv [Jkem1024_avx2.M.__crypto_kem_dec_jazz ~ MLKEM1024.dec: 
     valid_ptr _ctp (4*352+160) /\
     valid_ptr _skp (384*4 + 384*4 + 32 + 32 + 32+ 32) /\
     valid_ptr _shkp 32 /\
     Glob.mem{1} = mem /\ 
     to_uint shkp{1} = _shkp /\
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2}.`1 = Array1536.init (fun i =>  _skp /\
     sk{2}.`2.`1 = Array1536.init (fun i =>  (_skp + 1536) /\
     sk{2}.`2.`2 = Array32.init (fun i =>  (_skp + 1536 + 1536) /\
     sk{2}.`3 = Array32.init (fun i =>  (_skp + 1536 + 1536 + 32) /\
     sk{2}.`4 = Array32.init (fun i =>  (_skp + 1536 + 1536 + 32 + 32) /\
     let (c1,c2) = cph{2} in
       c1 = load_array1408 Glob.mem{1} _ctp /\
       c2 = load_array160 Glob.mem{1} (_ctp + 1408)
       ==> 
     touches Glob.mem{1} mem _shkp 32 /\
     res{2} = Array32.init (fun i =>  _shkp
].
proc => /=. sp 0 1. swap {1} [4..5] 12.

seq 4 1 : (#pre /\ aux{1} = m{2}); 
  1: by call (mlkem_correct_dec mem _ctp _skp); 1: by auto => /> /#.

swap {1} 7 1.
seq 7 1 : (#pre /\ 
           (forall k, 0<=k<32 => buf{1}.[k] = m{2}.[k]) /\
           (forall k, 0<=k<32 => kr{1}.[k] = _K{2}.[k]) /\
           (forall k, 0<=k<32 => kr{1}.[k+32] = r{2}.[k])).
ecall {1} (sha3_512A_A64_ph buf{1}).
wp; conseq (_: _ ==> 
   (forall k, 0<=k<32 => buf{1}.[k] = m{2}.[k]) /\
   (forall k, 32<=k<64 => buf{1}.[k] = mem.[_skp + 3104 + k - 32]) /\
   (forall k, 0<=k<32 => buf{1}.[k] = aux{1}.[k])).
+ auto => /> &1 &2; rewrite /load_array32 !tP => ?????????buf bvl bvh ; split.
  + move => k kbl kbh; rewrite initiE 1:/# /= kbh /= /G_mhpk; congr; congr;congr.
    rewrite tP => i ib; rewrite initiE //= /#.
    by rewrite tP => i ib; rewrite !initiE  /#. 
  + move => k kbl kbh; rewrite initiE 1:/# /= ifF 1:/# /= /G_mhpk; congr; congr;congr.
    rewrite tP => i ib; rewrite initiE //= /#.
    by rewrite tP => i ib; rewrite !initiE  /#. 
while {1} (0<=i{1}<=4 /\ inc{1} = 4  /\ to_uint hp{1} = _skp + 3104 /\ Glob.mem{1} = mem /\
             valid_ptr _skp (384*4 + 384*4 + 32 + 32 + 32+ 32) /\
             (forall (k : int), 32 <= k && k < 32 + 8*i{1} => buf{1}.[k] = mem.[_skp + 3104 + k - 32]) /\
             forall (k : int), 0 <= k && k < 32 => buf{1}.[k] = aux{1}.[k]) (4 - i{1}); last first. 
  + auto => /> &1 &2; rewrite /valid_ptr => ???????? /=.
    have -> /= : cph{2} = (cph{2}.`1,cph{2}.`2) by smt().
    rewrite /load_array1408 /load_array160 !tP => [#] cph1v cph2v.
    do split.
    + by rewrite /(`|>>`) /(`<<`) /= to_uintD_small of_uintK /= /#. 
    + by smt().
    + by move => k kbl kbh; rewrite initiE /= /#.
    by smt().
  move => *; auto => /> &hr ????????; do split; 1..2,5: by smt().
  + move => k kbl kbh; rewrite initiE //= 1:/#.
    rewrite /storeW64 /loadW64 /stores  /=. 
    rewrite WArray64.WArray64.get8_set64_directE 1..2:/#.
    case (32 + 8 * i{hr} <= k && k < 32 + 8 * i{hr} + 8).
    + by move => *; rewrite pack8bE 1:/# initiE /= 1:/# to_uintD_small /= of_uintK /= modz_small /#. 
    by move => *; rewrite /WArray64.WArray64.get8 WArray64.WArray64.initiE /= /#.  
  move => k kbl kbh; rewrite initiE /= 1:/# WArray64.WArray64.get8_set64_directE 1..2:/#. 
  case (32 + 8 * i{hr} <= k && k < 32 + 8 * i{hr} + 8).
  + by move => *; rewrite pack8bE 1:/# initiE /= 1:/# to_uintD_small /= of_uintK /= modz_small /#. 
  by move => *; rewrite /WArray64.WArray64.get8 WArray64.WArray64.initiE /= /#.  
  
swap {2} 1 1.  
seq 4 1 : (#pre /\ to_uint s_skp{1} = _skp /\ 
           ctpc{1} = Array1568.init (fun i => if i < 1408 then c{2}.`1.[i] else c{2}.`2.[i-1408])).
+ wp;call (mlkem_correct_enc_1_avx2 mem (_skp + 1536)).

  auto => /> &1 &2 ???????; rewrite /load_array1536 /load_array32 /load_array1408 !tP => ?????; do split; 1..2: by smt().
  + by move => i ib; rewrite initiE /= /#.
  + by rewrite /(`|>>`) /(`<<`) /= to_uintD_small of_uintK /= /#. 
  + by move => i ib; rewrite initiE /= /#.
  move => /= ? ? bufv ? krv rl rr H. 
  rewrite (_: rr = (rr.`1,rr.`2)) 1:/# /= in H.
  rewrite tP => i ib.
  rewrite !initiE //=. by  smt(Array160.initiE Array1408.initiE).

sp 3 0; seq 1 0 : (#pre /\ 
                  (c{2}  = cph{2} => cnd{1} = W64.of_int 0) /\
                  (c{2}  <> cph{2} => cnd{1} = W64.of_int 1)).
+  conseq (_: _ ==> (c{2}  = cph{2} => cnd{1} = W64.of_int 0) /\
                  (c{2}  <> cph{2} => cnd{1} = W64.of_int 1)); 1: smt(). 
   ecall {1} (verify_correct mem _ctp ctpc{1}).
   auto => /> &1 &2; rewrite /load_array1408 /load_array160 !tP.
   move  => ????????cphv????rst Heq Hdiff.
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
     (Array1568.init (fun (i1 : int) => loadW8 mem (to_uint s_ctp{1} + i1))).[i0] <>
     (Array1568.init (fun (i1 : int) => if i1 < 1408 then c{2}.`1.[i1] else c{2}.`2.[i1 - 1408])).[i0]; last by smt().
   case (c{2}.`1 <> cph{2}.`1).
   + move => neq1. rewrite tP in neq1.   
     have [k kb] : exists k, 0<=k<1408 /\ c{2}.`1.[k] <> cph{2}.`1.[k] by smt().
     exists k; split; 1: by smt().
     rewrite !initiE /= 1,2:/#. 
     move : (cphv1 k _); 1: smt().
     by rewrite initiE /= /#.
   + move => eq1. 
     have neq2 : c{2}.`2 <> cph{2}.`2 by move : neq eq1; smt().
     rewrite tP in neq2.   
     have [k kb] : exists k, 0<=k<160 /\ c{2}.`2.[k] <> cph{2}.`2.[k] by smt().
     exists (k + 1408); split; 1: by smt().
     rewrite !initiE /= 1,2:/#. 
     move : (cphv2 k _); 1: smt().
     by rewrite initiE /= /#.
  done.


ecall {1} (cmov_correct (to_uint shkp{1}) (Array32.init (fun (i_0 : int) => kr{1}.[0 + i_0])) cnd{1} Glob.mem{1}).

wp;ecall{1} (shake256_M32__M32_M1600_ph  Glob.mem{1} (to_uint shkp{1}) (to_uint zp{1}) (to_uint ctp{1})).

+ auto => /> &1 &2 ???????; rewrite /load_array1536 /load_array32 !tP => ?cphv????ceq cdif.
do split;1,2:
  by rewrite /(`|>>`) /(`<<`) /= to_uintD_small of_uintK /= /#. 
move => ??????mm0 tt0 hashv;do split.
+ move => badc mm back c0 c1;split.
  + by move : back tt0 => /#.
  + have -> : (init (fun (i0 : int) => mm.[to_uint shkp{1} + i0]))%Array32 =
              (init (fun (i0 : int) => mm0.[to_uint shkp{1} + i0]))%Array32.
    move : (c1 (cdif badc)).
    rewrite !tP => H k kb.
    by rewrite (H k kb) !initiE 1,2:/# /= /loadW8 /loads.
  rewrite hashv /J;congr.
  + rewrite tP => k kb; rewrite !initiE 1,2:/# /=.
    by rewrite /(`|>>`) /(`<<`) /= to_uintD_small of_uintK /= /#. 
  rewrite (_: cph{2} = (cph{2}.`1, cph{2}.`2)) 1: /# /=.
  rewrite (_: cph{2} = (cph{2}.`1, cph{2}.`2)) 1: /# /= in cphv.
  by move : cphv => [-> ->]; rewrite /load_array1408 /load_array160 /#.

move => goodc mm back c0 c1;split.
  + by move : back tt0 => /#.
  + move : (c0 (ceq goodc)).
    rewrite !tP => H k kb.
    by rewrite (H k kb) initiE /#.
qed.
