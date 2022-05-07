require import AllCore IntDiv.
require import Jkem Kyber KyberINDCPA KyberPoly KyberPolyVec.
require import Array1152 Array32 Array960 Array1184 Array1088 Array64 Array128.
from Jasmin require import JModel.

import KyberSpec.
import KyberPKE.
import RO.
import KyberPoly.
import KyberPolyVec.

axiom pkH_sha mem _ptr inp: 
    phoare [ M._isha3_256 :
          arg = (inp,W64.of_int _ptr,W64.of_int (3*384+32)) /\
          valid_ptr _ptr 1184 /\
          Glob.mem = mem
          ==> 
          Glob.mem = mem /\
          res = SHA3_256_1184_32
            (Array1184.init (fun k =>  mem.[_ptr+k]))] = 1%r.

axiom cH_sha mem _ptr inp: 
    phoare [ M._isha3_256 :
          arg = (inp,W64.of_int _ptr,W64.of_int (3*320+128)) /\
          valid_ptr _ptr 1088 /\
          Glob.mem = mem
          ==> 
          Glob.mem = mem /\
          res = SHA3_256_1088_32
            (Array1088.init (fun k =>  mem.[_ptr+k]))] = 1%r.

lemma pack_inj : injective W8u8.pack8_t by apply (can_inj W8u8.pack8_t W8u8.unpack8 W8u8.pack8K).

lemma kyber_kem_correct_kg mem _pkp _skp _randomnessp : 
   equiv [ M.__crypto_kem_keypair_jazz ~ KyberKEM(KHS,XOF,KPRF,KHS_KEM,KemH,H).kg_derand : 
       Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp /\ to_uint skp{1} = _skp /\ 
       to_uint randomnessp{1} = _randomnessp /\
       seed{2} = (load_array32 Glob.mem{1} _randomnessp,
                 load_array32 Glob.mem{1} (_randomnessp + 32)) /\
       valid_ptr _randomnessp 64 /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3 + 384*3 + 32 + 32 + 32 + 32) /\
       valid_disj_reg _pkp (384*3+32) _randomnessp (64) /\
       valid_disj_reg _randomnessp (64) _skp (384*3 + 384*3 + 32 + 32 + 32 + 32) 
        ==> 
       touches2 Glob.mem{1} mem _pkp (384*3+32) _skp (384*3 + 384*3 + 32 + 32 + 32+ 32) /\
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk.`1 = load_array1152 Glob.mem{1} _skp /\
         sk.`2.`1 = load_array1152 Glob.mem{1} (_skp + 1152) /\
         sk.`2.`2 = load_array32 Glob.mem{1} (_skp + 1152 + 1152) /\
         sk.`3 = load_array32 Glob.mem{1} (_skp + 1152 + 1152 + 32) /\
         sk.`4 = load_array32 Glob.mem{1} (_skp + 1152 + 1152 + 32 + 32) /\
         t = load_array1152 Glob.mem{1} _pkp  /\
         rho = load_array32 Glob.mem{1} (_pkp+1152)].
proc => /=.

swap {1} [6..8] 13.
swap {1} 2 16.

seq 17 4 : (
      valid_ptr _randomnessp 64 /\
      to_uint randomnessp{1} = _randomnessp /\
      z{2} = load_array32 mem (_randomnessp + 32) /\
      to_uint skp{1} = _skp +  1152 + 1152 + 32 + 32 /\
      valid_disj_reg _pkp (384*3+32) _skp (384*3 + 384*3 + 32 + 32 + 32 + 32) /\
      valid_disj_reg _pkp (384*3+32) _randomnessp (64) /\
      valid_disj_reg _randomnessp (64) _skp (384*3 + 384*3 + 32 + 32 + 32 + 32) /\
      touches2 Glob.mem{1} mem _pkp (384 * 3 + 32) _skp (384*3 + 384*3 + 32 + 32 + 32 + 32) /\
      sk{2} = load_array1152 Glob.mem{1} _skp /\
      pk{2}.`1 = load_array1152 Glob.mem{1} (_skp + 1152) /\
      pk{2}.`2 = load_array32 Glob.mem{1} (_skp + 1152 + 1152) /\
      hpk{2} = load_array32 Glob.mem{1} (_skp + 1152 + 1152 + 32) /\
      pk{2}.`1 = load_array1152 Glob.mem{1} (_pkp) /\
      pk{2}.`2 = load_array32 Glob.mem{1} (_pkp + 1152)
); last first.
+ while {1} (aux{1} = 4 /\
       valid_ptr _randomnessp 64 /\
       to_uint randomnessp{1} = _randomnessp + 32 /\
       z{2} = load_array32 mem (_randomnessp + 32) /\
       to_uint skp{1} = _skp +  1152 + 1152 + 32 + 32 + i{1}*8 /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3 + 384*3 + 32 + 32 + 32 + 32) /\
       valid_disj_reg _pkp (384*3+32) _randomnessp (64) /\
       valid_disj_reg _randomnessp (64) _skp (384*3 + 384*3 + 32 + 32 + 32 + 32) /\
       touches2 Glob.mem{1} mem _pkp (384 * 3 + 32) _skp (384*3 + 384*3 + 32 + 32 + 32 + 32) /\
       sk{2} = load_array1152 Glob.mem{1} _skp /\
       pk{2}.`1 = load_array1152 Glob.mem{1} (_skp + 1152) /\
       pk{2}.`2 = load_array32 Glob.mem{1} (_skp + 1152 + 1152) /\
       hpk{2} = load_array32 Glob.mem{1} (_skp + 1152 + 1152 + 32) /\
       pk{2}.`1 = load_array1152 Glob.mem{1} (_pkp) /\
       pk{2}.`2 = load_array32 Glob.mem{1} (_pkp + 1152) /\
       0 <= i{1} <= 4 /\ 
       forall k, 0<=k<i{1} =>
           loadW64 Glob.mem{1} (_skp + 2368 + k*8) =
                 pack8_t (W8u8.Pack.init (fun i => z{2}.[k*8+i])))
          (4 - i{1}).
  + move => &m z0; auto => /> &hr; rewrite /touches2 /load_array1152 /load_array32 !tP => 
       ??????????????????? touch pk1vs pk2vs pk1v pk2v ??prev? ; rewrite !to_uintD_small /=.
    + by smt(). 
    + by rewrite of_uintK /= modz_small /=; 1,2: smt(). 
    do split; 1,9,12: by smt().
    + by move => a H1 H2; rewrite /storeW64 /loadW64 /stores /= !get_set_neqE_s /#.
    + by move => k kb; rewrite !initiE //= /storeW64 /loadW64 /stores /= !get_set_neqE_s /#.
    + move => k kb; rewrite !initiE //= /storeW64 /loadW64 
          /stores /= !get_set_neqE_s; 1..8: smt().     
      by rewrite pk1vs // initiE //=.
    + move => k kb; rewrite !initiE //= /storeW64 /loadW64 
         /stores /= !get_set_neqE_s; 1..8: smt().     
      by rewrite pk2vs // initiE //=.
    + by move => k kb; rewrite !initiE //= /storeW64 /loadW64 
         /stores /= !get_set_neqE_s;smt().
    + move => k kb; rewrite !initiE //= /storeW64 /loadW64 
         /stores /= !get_set_neqE_s; 1..8: smt(). 
    by rewrite pk1v // initiE //=.
    + move => k kb; rewrite !initiE //= /storeW64 /loadW64 
        /stores /= !get_set_neqE_s; 1..8: smt(). 
    by rewrite pk2v // initiE //=.
    + by smt().
    + move => k kbl kbh.
      case (k < i{hr}).
      + move => hk. 
        rewrite /storeW64 /loadW64 /stores /=; congr. 
        rewrite W8u8.Pack.packP => i ib; rewrite !initiE /=; 1,2: smt(). 
        rewrite !get_set_neqE_s; 1..8: smt(). 
        move : (prev k _); 1: by smt().
        rewrite !initiE 1:/# /storeW64 /loadW64 /stores /=.
        rewrite (inj_eq W8u8.pack8_t pack_inj) packP => H.
        move : (H i _); 1: smt().
        by rewrite !initiE //= initiE;  smt().
     move => hk.
     rewrite /storeW64 /loadW64 /stores /= of_uintK /= !modz_small; 1: smt().  
     congr;rewrite W8u8.Pack.packP => i ib; rewrite !initiE /=; 1..2: smt(). 
     rewrite initiE /=; 1: smt().
     by smt(get_set_neqE_s get_set_eqE_s).

  auto => />;move => ????????????????????touch????; do split. 
  + rewrite to_uintD_small /=; by smt(). 
  +  smt().
  move => memL iL skpL; rewrite !to_uintD_small; 1: smt().  
  split; 1: smt().
  move => ???touch2????????store???. 
  rewrite /load_array32 tP => k kb.
  rewrite !initiE //=.
  move : (store (k %/ 8) _); 1: smt().
  rewrite /storeW64 /loadW64 /stores /load_array32 /=. 
  rewrite (inj_eq W8u8.pack8_t pack_inj) packP => H.
  move : (H (k %%8) _); 1: smt().
  rewrite !initiE //=; 1,2:smt().
  by rewrite !initiE //=; smt(). 

swap {2} 2 2. 
swap {1} 1 12; sp 2 1.

wp;conseq (_: _ ==>
to_uint skp{1} = _skp + 2368 /\
  touches2 Glob.mem{1} mem (_pkp) 1184 (_skp) 2432 /\
  sk{2} = load_array1152 Glob.mem{1} (_skp) /\
  pk{2}.`1 = load_array1152 Glob.mem{1} (_skp + 1152) /\
  pk{2}.`2 = load_array32 Glob.mem{1} (_skp + 2304) /\
  hpk{2} = load_array32 Glob.mem{1} (_skp + 2336) /\
  pk{2}.`1 = load_array1152 Glob.mem{1} ( _pkp) /\ 
  pk{2}.`2 = load_array32 Glob.mem{1} (_pkp + 1152)); 1: by smt().

seq 1 1 : (#{/~Glob.mem{1}=mem}pre /\
  touches2 Glob.mem{1} mem _pkp 1184 _skp 2432 /\
  sk{2} = load_array1152 Glob.mem{1} _skp /\
  pk{2}.`1 = load_array1152 Glob.mem{1} _pkp /\ 
  pk{2}.`2 = load_array32 Glob.mem{1} (_pkp + 1152)).
 
call (kyber_correct_kg mem _pkp _skp _randomnessp).
auto => /> &1; rewrite /load_array1152 /load_array32 !tP /touches2 => ?????????????????.
do split; 1,2,3: smt().
+ move =>  touch ??????? [[resr11 resr12] resr2] memL touch2 /= [#]; rewrite !tP => r2 r11 r12. 
  do split.
  + by move => k kb; rewrite !initiE /#.
  + by move => k kb; rewrite !initiE  /= 1,2: /# touch2 /#. 
  + by smt().
  + by move => k kb;  move : (r2 k _) => //; rewrite !initiE //.
  + by move => k kb;  move : (r11 k _) => //; rewrite !initiE //.
  by move => k kb;  move : (r12 k _) => //; rewrite !initiE //.

swap {1} 3 2. swap {1} 12 -4.

seq 8 0 : (#{/~to_uint skp{1} = _skp}pre /\
   to_uint skp{1} = _skp + 3*384 + 3*384 + 32 /\
   pk{2}.`1 = load_array1152 Glob.mem{1} (_skp + 1152) /\
  pk{2}.`2 = load_array32 Glob.mem{1} (_skp+ 2304)
).

+ wp;while {1} (#{/~to_uint skp{1} = _skp}{~s_skp{1} = skp{1}}pre /\ 
    aux{1} = (3 * 384 + 32) %/ 8 /\ 0<=i{1} <= aux{1} /\
    to_uint skp{1} = _skp + 3*384 + i{1}*8 /\
    (forall k, 0<= k < min (8 * i{1}) 1152  => 
         pk{2}.`1.[k] = Glob.mem{1}.[_skp + 3*384 + k]) /\
    (forall k, min (8 * i{1}) 1152 <= k < min (8 * i{1}) (1152 + 32) => 
         pk{2}.`2.[k-1152] = Glob.mem{1}.[_skp + 3*384 +  k])) 
    ((3 * 384 + 32) %/ 8 - i{1}).
  move => &m z;auto => /> &hr. rewrite /load_array32 /load_array1152 !tP /touches2.
  move => ?????????????????touch pkv1 pkv2???prev1 prev2 ?;rewrite !to_uintD_small /=.
  + by rewrite of_uintK /= modz_small /=; smt().
  by smt().
  do split; 7..8:smt().
  + move => i ib; rewrite !initiE //=.
    rewrite /storeW64 /loadW64 /stores  /=. 
     by smt(get_set_neqE_s get_set_eqE_s).
  + move => i ib; rewrite !initiE //=.
    rewrite /storeW64 /loadW64 /stores  /=. 
     by smt(get_set_neqE_s get_set_eqE_s).
  + move => i ib ibb.
    rewrite /storeW64 /loadW64 /stores  /=.
    rewrite !get_set_neqE_s; 1..8:smt().
    by smt(get_set_neqE_s get_set_eqE_s).
  + move => i ib; rewrite !initiE //=.
    rewrite /storeW64 /loadW64 /stores  /=.
    rewrite !get_set_neqE_s; 1..8:smt().
    by smt(get_set_neqE_s get_set_eqE_s).
  + move => k kb; rewrite !initiE //=.
    rewrite /storeW64 /loadW64 /stores  /=.
    rewrite !get_set_neqE_s; 1..8:smt().
    by move : (pkv1 k kb); rewrite initiE //=.
  + move => k kb; rewrite !initiE //=.
    rewrite /storeW64 /loadW64 /stores  /=.
    rewrite !get_set_neqE_s; 1..8:smt().
    by move : (pkv2 k kb); rewrite initiE //=.
  + by smt().
  + move => kk kkbl kkbh.
    rewrite /storeW64 /loadW64 /stores  /=.
    case (kk < i{hr} * 8).
    + by move => *; rewrite !get_set_neqE_s; smt().
    move => ?.
    rewrite !of_uintK /= modz_small;1:smt().
    move : (pkv1 kk _); 1: smt().
    rewrite initiE /=; 1: smt().
    by smt(get_set_neqE_s get_set_eqE_s).
  + move => kk kkbl kkbh.
    rewrite /storeW64 /loadW64 /stores  /=.
    case (kk < i{hr} * 8).
    + by move => *; rewrite !get_set_neqE_s; smt().
    move => ?.
    rewrite !of_uintK /= modz_small;1:smt().
    move : (pkv2 (kk - 1152) _); 1: smt().
    rewrite initiE /=; 1: smt().
    by smt(get_set_neqE_s get_set_eqE_s).
  + by smt().
  auto => /> &1 &2; rewrite /load_array1152 /load_array32 !tP.
  move =>  ????????????????????.
  rewrite to_uintD_small /=; 1: by smt().
  do split; 1..2: by smt(). 
  move => meml il skpl.
  rewrite !tP; split; 1: smt().
  move => ????????????; do split; 1: smt().
  + by move => *; rewrite initiE //= /#.
  by move => *; rewrite initiE //= /#.
   
seq 4 1 : 
(to_uint skp{1} = _skp + 2336 /\
   valid_disj_reg _pkp 1184 _skp 2432 /\
   valid_disj_reg _pkp 1184 _randomnessp 64 /\
   valid_disj_reg _randomnessp 64 _skp 2432 /\
  touches2 Glob.mem{1} mem _pkp 1184 _skp 2432 /\
  sk{2} = load_array1152 Glob.mem{1} _skp /\
  pk{2}.`1 = load_array1152 Glob.mem{1} (_skp + 1152) /\
  pk{2}.`2 = load_array32 Glob.mem{1} (_skp + 2304) /\
  hpk{2} = h_pk{1} /\
  pk{2}.`1 = load_array1152 Glob.mem{1} _pkp /\ pk{2}.`2 = load_array32 Glob.mem{1} (_pkp + 1152)).

ecall {1} (pkH_sha (Glob.mem{1}) (_pkp) (h_pk{1})).
inline *; auto => /> &1 &2; rewrite /touches /touches2 /load_array1152 /load_array32 !tP => ????????????????????? pk1v pk2v .
+ move => i ib;congr; congr; rewrite tP => ii iib; rewrite !initiE /=; 1..2: smt(). 
  case (ii < 1152).
  + by move => iibb;move : (pk1v ii _); smt(Array1152.initiE).
  by move => iibb;move : (pk2v (ii-1152) _); smt(Array32.initiE).

while {1} (#{/~to_uint skp{1} = _skp + 2336}pre /\ 0 <= i{1} <= 4 /\ to_uint skp{1} = _skp + 2336 + 8*i{1} /\ forall k, 0 <= k < i{1} * 8 => Glob.mem{1}.[_skp + 2336 + k] = hpk{2}.[k]) (4 - i{1}).
move => &m z; auto => /> &1 &2; rewrite /load_array1152 /load_array32 /touches2 !tP.
move => ???????????????pkv1s pkv2s pkv1 pkv2 ??? prev ?. 
rewrite !to_uintD_small /= 1:/#.
do split.
+ move => i ib ih.
  rewrite /storeW64 /loadW64 /stores  /=. 
  by smt(get_set_neqE_s get_set_eqE_s).
+ move => i ib; rewrite !initiE //=.
  rewrite /storeW64 /loadW64 /stores  /=. 
  by smt(get_set_neqE_s get_set_eqE_s).
+ move => i ib; rewrite !initiE //=.
  rewrite /storeW64 /loadW64 /stores  /=.
  rewrite !get_set_neqE_s;1..8:smt().
  by move : (pkv1s i ib); rewrite initiE //=.
+ move => i ib; rewrite !initiE //=.
  rewrite /storeW64 /loadW64 /stores  /=.
  rewrite !get_set_neqE_s;1..8:smt().
  by move : (pkv2s i ib); rewrite initiE //=.
+ move => i ib; rewrite !initiE //=.
  rewrite /storeW64 /loadW64 /stores  /=.
  rewrite !get_set_neqE_s;1..8:smt().
  by move : (pkv1 i ib); rewrite initiE //=.
+ move => i ib; rewrite !initiE //=.
  rewrite /storeW64 /loadW64 /stores  /=.
  rewrite !get_set_neqE_s;1..8:smt().
  by move : (pkv2 i ib); rewrite initiE //=.
+ by smt().
+ by smt().
+ by smt().
+ move => k kbl kbh.
  case (k < (i{1} * 8)).
  + by move => kl;rewrite /storeW64 /loadW64 /stores  /=  !get_set_neqE_s;smt().
  move => kh. rewrite /storeW64 /loadW64 /stores  /=. 
  have -> :  hpk{m}.[k] = 
              (WArray32.WArray32.get64 ((WArray32.WArray32.init8 ("_.[_]" hpk{m})))%WArray32.WArray32 i{1})%WArray32.WArray32 \bits8 (k %% 8); last by smt(get_set_neqE_s get_set_eqE_s).
  rewrite /WArray32.WArray32.get64_direct.
  by rewrite pack8bE 1:/# initiE /= 1:/# /WArray32.WArray32.init8 WArray32.WArray32.initiE /#.

by smt().

auto => /> &1 &2.
rewrite /load_array1152 /load_array32 /touches2 !tP.
move => ?????????????????pkv1s pkv2s pkv1 pkv2. 
do split.
+ move => i ib ih.
  rewrite /storeW64 /loadW64 /stores  /=. 
  by smt(get_set_neqE_s get_set_eqE_s).
move => memL iL skL; do split; 1: by smt().
move => *; split; 1: by smt().
by rewrite tP => i ib; rewrite initiE //= /#.
qed.

axiom kdf_sha mem _ptr (inp : W8.t Array64.t): 
    phoare [ M._shake256_64 :
          arg = (W64.of_int _ptr,W64.of_int 32,inp) /\
          valid_ptr _ptr 32 /\
          Glob.mem = mem
          ==> 
          touches Glob.mem mem _ptr 32 /\
          (Array32.init (fun k =>  Glob.mem.[_ptr+k])) = SHAKE256_64_32 inp] = 1%r.

axiom sha_g buf inp: 
    phoare [ M._sha3_512_64 :
          arg = (inp,buf)
          ==> 
          res = SHA3_256_64_64 buf] = 1%r.

axiom sha_khs mem _ptr inp: 
    phoare [ M._isha3_256 :
          arg = (inp,W64.of_int _ptr,W64.of_int 32) /\
          valid_ptr _ptr 32 /\
          Glob.mem = mem
          ==> 
          Glob.mem = mem /\
          res = SHA3_256_32_32
            (Array32.init (fun k =>  mem.[_ptr+k])) ()] = 1%r.

lemma kyber_kem_correct_enc mem _ctp _pkp _rp _kp : 
   equiv [ M.__crypto_kem_enc_jazz ~ KyberKEM(KHS,XOF,KPRF,KHS_KEM,KemH,H).enc_derand: 
     valid_ptr _pkp (384*3 + 32) /\
     valid_ptr _rp (32) /\
     valid_disj_reg _ctp (3*320+128) _kp (32) /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\ 
     to_uint pkp{1} = _pkp /\
     to_uint randomnessp{1} = _rp /\
     to_uint shkp{1} = _kp /\
     prem{2} = load_array32 mem _rp /\
     pk{2}.`1 = load_array1152 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 3*384)
       ==> 
     touches2 Glob.mem{1} mem _ctp (3*320+128) _kp (32) /\
     let (c,k) = res{2} in
     c.`1 = load_array960 Glob.mem{1} _ctp /\
     c.`2 = load_array128 Glob.mem{1} (_ctp + 960) /\
     k = load_array32 Glob.mem{1} _kp
].
proc.
inline {2} 6. inline {2} 5. 
wp;ecall {1} (kdf_sha Glob.mem{1} _kp kr{1}).
wp;ecall {1} (cH_sha Glob.mem{1} _ctp (Array32.init (fun (i : int) => kr{1}.[32 + i]))).
wp;call (kyber_correct_enc mem _ctp _pkp).
inline {2} 3. 
wp;ecall {1} (sha_g buf{1} kr{1}).
inline {2} 2. 
wp;ecall {1} (pkH_sha mem (_pkp) ((Array32.init (fun (i : int) => buf{1}.[32 + i])))).
inline {2} 1. inline {2} 2.
wp;ecall {1} (sha_khs mem (_rp) ((Array32.init (fun (i : int) => buf{1}.[0 + i])))).
auto => /> &1 &2; rewrite /load_array1152 /load_array32 /load_array128 /load_array960 /touches2 /touches !tP.
move => ????????? pkv1 pkv2.
do split.
+ move => i ib; rewrite !initiE /= 1,2: /#.
  have -> /= : !(32 <= i && i < 64) by smt().
  by rewrite initiE /= 1:/# ib /=.
+ move => i ib; rewrite !initiE /= 1,2: /#.
  congr; last by smt().
  congr. 
  rewrite tP => k kb; rewrite !initiE /= 1,2: /#.
  case (0 <=k < 32).
  + move => kbb.
    have -> /= : !(32 <= k && k < 64) by smt().
    by rewrite initiE /= 1:/# kbb /= /#.
  move => kbb.  
  have -> /= : (32 <= k && k < 64) by smt(). 
  have -> /= : !(k < 32) by smt().
  congr.
  congr. 
  rewrite tP => kk kkb; rewrite !initiE /= 1,2: /#.
  case (kk < 1152).
  + move => kkbb; move : (pkv1 kk _); 1: by smt().
    by rewrite !initiE /=/#.
  move => kkbb; move : (pkv2 (kk-1152) _); 1: by smt().
  by rewrite !initiE /=/#.

move => ?? [cR1 cR2] /= memR touch [-> ->] memL touchL ->; do split; 1: by smt().
+ rewrite tP => i ib; rewrite !initiE //=.
  have -> :  to_uint ctp{1} + i = to_uint shkp{1} + (to_uint ctp{1} + i  - to_uint shkp{1}) by ring. 
  by rewrite -touchL;  smt().
+ rewrite tP => i ib; rewrite !initiE //=.
  have -> :  to_uint ctp{1} + 960 + i = to_uint shkp{1} + (to_uint ctp{1} + 960 + i - to_uint shkp{1}) by ring. 
  by rewrite -touchL;  smt().

congr.
rewrite tP => k kb; rewrite !initiE //=.
case (k < 32).
+ move => kbb /=; have -> /=: !(32 <= k && k < 64 ) by smt().
  rewrite initiE //= 1: /#; congr; congr.
  rewrite tP => kk kkb; rewrite !initiE //=.
  case (kk < 32).
  + move => kkbb /=; have -> /=: !(32 <= kk && kk < 64 ) by smt().
    by rewrite initiE //= 1: /#.  
  + move => kkbb /=; have -> /=: (32 <= kk && kk < 64 ) by smt().
    congr;congr; rewrite tP => i ib. 
    rewrite !initiE //=. 
    case (i < 1152).
    + move => ibb; move : (pkv1 i _); 1: by smt().
      by rewrite !initiE /=/#.
  move => ibb; move : (pkv2 (i-1152) _); 1: by smt().
  by rewrite !initiE /=/#.
      
move => kbb /=; have -> /=: (32 <= k && k < 64 ) by smt().  
congr;congr; rewrite tP => i ib. 
rewrite !initiE //=. 
case (i < 960).
+ by move => ibb; rewrite !initiE /=/#.
by move => ibb; rewrite !initiE /=/#.
qed.

lemma kyber_kem_correct_dec mem _ctp _skp _shkp : 
   equiv [ M.__crypto_kem_dec_jazz ~ KyberKEM(KHS,XOF,KPRF,KHS_KEM,KemH,H).dec: 
     valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp (384*3 + 384*3 + 32 + 32 + 32+ 32) /\
     valid_ptr _shkp 32 /\
     Glob.mem{1} = mem /\ 
     to_uint shkp{1} = _shkp /\
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2}.`1 = load_array1152 Glob.mem{1} _skp /\
     sk{2}.`2.`1 = load_array1152 Glob.mem{1} (_skp + 1152) /\
     sk{2}.`2.`2 = load_array32 Glob.mem{1} (_skp + 1152 + 1152) /\
     sk{2}.`3 = load_array32 Glob.mem{1} (_skp + 1152 + 1152 + 32) /\
     sk{2}.`4 = load_array32 Glob.mem{1} (_skp + 1152 + 1152 + 32 + 32) /\
     let (c1,c2) = cph{2} in
       c1 = load_array960 Glob.mem{1} _ctp /\
       c2 = load_array128 Glob.mem{1} (_ctp + 960)
       ==> 
     touches Glob.mem{1} mem _shkp 32 /\
     res{2} = load_array32 Glob.mem{1} _shkp
].
proc => /=. sp 0 1. swap {1} [4..5] 12.

seq 4 1 : (#pre /\ aux{1} = oget m{2}); 
  1: by call (kyber_correct_dec mem _ctp _skp); 1: by auto => /> /#.

swap {1} 7 1.
seq 7 1 : (#pre /\ 
           (forall k, 0<=k<32 => buf{1}.[k] = (oget m{2}).[k]) /\
           (forall k, 0<=k<32 => kr{1}.[k] = _Kt{2}.[k]) /\
           (forall k, 0<=k<32 => kr{1}.[k+32] = r{2}.[k])).
inline {2} 1.
ecall {1} (sha_g buf{1} kr{1}).
wp; conseq (_: _ ==> 
   (forall k, 0<=k<32 => buf{1}.[k] = (oget m{2}).[k]) /\
   (forall k, 32<=k<64 => buf{1}.[k] = mem.[_skp + 2336 + k - 32]) /\
   (forall k, 0<=k<32 => buf{1}.[k] = aux{1}.[k])).
+ auto => /> &1 &2; rewrite /load_array32 !tP => ?????????buf bvl bvh ; split.
  + move => k kbl kbh; rewrite initiE //=; congr; congr.
    rewrite tP => i ib; rewrite initiE //=.
    case (i < 32); 1: by smt().
    by move => ibb; rewrite initiE //= /#. 
  move => k kbl kbh; rewrite initiE //=; congr; congr.
  rewrite tP => i ib; rewrite initiE //=.
  case (i < 32); 1: by smt().
  by move => ibb; rewrite initiE //= /#. 
  while {1} (0<=i{1}<=4 /\ aux_0{1} = 4  /\ to_uint hp{1} = _skp + 2336 /\ Glob.mem{1} = mem /\
             valid_ptr _skp (384*3 + 384*3 + 32 + 32 + 32+ 32) /\
             (forall (k : int), 32 <= k && k < 32 + 8*i{1} => buf{1}.[k] = mem.[_skp + 2336 + k - 32]) /\
             forall (k : int), 0 <= k && k < 32 => buf{1}.[k] = aux{1}.[k]) (4 - i{1}); last first. 
  + auto => /> &1 &2; rewrite /valid_ptr => ???????? /=.
    have -> /= : cph{2} = (cph{2}.`1,cph{2}.`2) by smt().
    rewrite /load_array960 /load_array128 !tP => [#] cph1v cph2v.
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
    
seq 4 1 : (#pre /\ ctpc{1} = Array1088.init (fun i => if i < 960 then c{2}.`1.[i] else c{2}.`2.[i-960])).
+ wp;call (kyber_correct_ienc mem (_skp + 1152)).
  auto => /> &1 &2 ???????; rewrite /load_array1152 /load_array32 /load_array960 !tP => ?????; do split; 1..2: by smt().
  + by move => i ib; rewrite initiE /= /#.
  + by rewrite /(`|>>`) /(`<<`) /= to_uintD_small of_uintK /= /#. 
  + by move => i ib; rewrite initiE /= /#.
  move => ? ? bufv ? krv c; rewrite tP => i ib.
  by rewrite !initiE //=; smt().

admitted.
