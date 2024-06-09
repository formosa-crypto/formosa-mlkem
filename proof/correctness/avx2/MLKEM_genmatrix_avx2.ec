require import AllCore IntDiv List.
from Jasmin require import JModel.

require import Array16 Array25 Array32 Array33 Array128 Array136 Array256 Array768 Array960 Array1024 Array1088 Array2304.

require import MLKEM_InnerPKE NTT_avx2 MLKEMFCLib AVX2_Ops NTT_AVX_Fq MLKEM_Poly_avx2_vec.

import NTT_Avx2.

require import Jkem_avx2 Jkem.

import GFq Rq Sampling Serialization Symmetric VecMat InnerPKE MLKEM Fq Correctness.
import PolyMat.
import KMatrix.Matrix.
import MLKEM_PolyAVXVec.
import WArray136 WArray32 WArray128.
import WArray512 WArray256.


(********* MOVED HERE TO AVOID CIRCULAR DEPS ************)

(* move somewhere else *)

lemma prod (x:'a*'b) :
 x = (x.`1,x.`2). smt(). qed.

lemma bits8_W32u8 ws i :
  W32u8.pack32_t ws \bits8 i = if 0 <= i < 32 then ws.[i] else W8.zero.
apply W8.wordP => j hj.
case (0 <= i < 32) => hi. rewrite  W32u8.pack32bE //. rewrite get_out //. qed.

lemma ianda a b c : a => (b => c) => ((a => b) => c). smt(). qed.

lemma if_eq (a:bool) (b c d:'a) : (a => (b=d)) => (!a => (c=d)) => (if a then b else c) = d.
move => T F. case a => />. qed.


lemma rng_iotared i n :
  (0 <= i < n) = (i \in iotared 0 n).
rewrite iotaredE mem_iota //= andaE //. qed.

op pack16x8 (x:('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)) : 'a Array128.t = Array128.init (fun i =>
 if 0 <= i < 16 then x.`1.[i%%16]
 else if 16 <= i < 32 then x.`2.[i%%16]
 else if 32 <= i < 48 then x.`3.[i%%16]
 else if 48 <= i < 64 then x.`4.[i%%16]
 else if 64 <= i < 80 then x.`5.[i%%16]
 else if 80 <= i < 96 then x.`6.[i%%16]
 else if 96 <= i < 112 then x.`7.[i%%16]
 else x.`8.[i%%16]) axiomatized by pack16x8E.

op unpack16x8 (x:'a Array128.t) : ('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t) =
 (Array16.init (fun i => x.[i+16*0])
 ,Array16.init (fun i => x.[i+16*1])
 ,Array16.init (fun i => x.[i+16*2])
 ,Array16.init (fun i => x.[i+16*3])
 ,Array16.init (fun i => x.[i+16*4])
 ,Array16.init (fun i => x.[i+16*5])
 ,Array16.init (fun i => x.[i+16*6])
 ,Array16.init (fun i => x.[i+16*7])) axiomatized by unpack16x8E.

lemma unpack16x8K (w:'a Array128.t) :
  pack16x8 (unpack16x8 w) = w.
rewrite pack16x8E unpack16x8E tP => i Hi. rewrite !initiE //=. rewrite !initiE //= 1..8:/#.
smt(). qed.

lemma pack16x8K (w:('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)) :
  unpack16x8 (pack16x8 w) = w.
rewrite pack16x8E unpack16x8E => />. rewrite (_:w=(w.`1,w.`2,w.`3,w.`4,w.`5,w.`6,w.`7,w.`8)) => />. smt(). progress.
rewrite tP => i Hi. rewrite !initiE //= /#. 
rewrite tP => i Hi; rewrite !initiE //= !initiE //= /#.
rewrite tP => i Hi. rewrite !initiE //= !initiE //= /#. 
rewrite tP => i Hi. rewrite !initiE //= !initiE //= /#. 
rewrite tP => i Hi. rewrite !initiE //= !initiE //= /#. 
rewrite tP => i Hi. rewrite !initiE //= !initiE //= /#.
rewrite tP => i Hi. rewrite !initiE //= !initiE //= /#.
rewrite tP => i Hi. rewrite !initiE //= !initiE //= /#.
qed.

op pack128x2 (x:'a Array128.t * 'a Array128.t) : 'a Array256.t = Array256.init (fun i =>
  if 0 <= i < 128 then x.`1.[i%%128]
  else x.`2.[i%%128]) axiomatized by pack128x2E.

op unpack128x2 (x:'a Array256.t) : ('a Array128.t * 'a Array128.t) =
 (Array128.init (fun i => x.[i+128*0])
 ,Array128.init (fun i => x.[i+128*1])) axiomatized by unpack128x2E.

lemma unpack128x2K (w:'a Array256.t) :
  pack128x2 (unpack128x2 w) = w.
rewrite pack128x2E unpack128x2E tP => i Hi. rewrite !initiE //=. rewrite !initiE //= 1..2:/#.
smt(). qed.

lemma pack128x2K (w:('a Array128.t)*('a Array128.t)) :
  unpack128x2 (pack128x2 w) = w.
rewrite pack128x2E unpack128x2E => />. rewrite (_:w=(w.`1,w.`2)) => />. smt(). progress.
rewrite tP => i Hi. rewrite !initiE //= /#. 
rewrite tP => i Hi. rewrite !initiE //= !initiE //= /#. 
qed.

abbrev is16u16x8 (x:t16u16*t16u16*t16u16*t16u16*t16u16*t16u16*t16u16*t16u16) (y:vt16u16*vt16u16*vt16u16*vt16u16*vt16u16*vt16u16*vt16u16*vt16u16) = is16u16 x.`1 y.`1 /\ is16u16 x.`2 y.`2 /\ is16u16 x.`3 y.`3 /\ is16u16 x.`4 y.`4 /\ is16u16 x.`5 y.`5 /\ is16u16 x.`6 y.`6 /\ is16u16 x.`7 y.`7 /\ is16u16 x.`8 y.`8.

abbrev nttunpack128x16 ['a] (x:('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)*('a Array16.t)) = unpack16x8 (nttunpack128 (pack16x8 x)).

lemma rng_perm_nttunpack128 i :
  0 <= i < 128 => 
  0 <= nth witness perm_nttunpack128 i < 128.
move => *. rewrite perm_nttunpack128E => />. smt(). qed.

lemma nttunpack128x2 (w:'a Array256.t) :
  unpack128x2 (nttunpack w) = (nttunpack128 (unpack128x2 w).`1,nttunpack128 (unpack128x2 w).`2).
rewrite !unpack128x2E /nttunpack128 //=. split.
+ rewrite tP => i Hi. rewrite !initiE //=. rewrite !initiE //=. rewrite rng_perm_nttunpack128 //.
rewrite /nttunpack /perm_nttunpack128 initiE //= 1:/#.
move:Hi. rewrite rng_iotared => />. do 128!(try (move => Hi; case Hi => />)). 
+ rewrite tP => i Hi. rewrite !initiE //=. rewrite !initiE //=. rewrite rng_perm_nttunpack128 //.
rewrite /nttunpack /perm_nttunpack128 initiE //= 1:/#.
move:Hi. rewrite rng_iotared => />. do 128!(try (move => Hi; case Hi => />)). 
qed.

lemma inj_unpack16x8 (x y : 'a Array128.t) :
  (unpack16x8 x = unpack16x8 y) => (x = y).
rewrite -(unpack16x8K x) -(unpack16x8K y). rewrite !pack16x8K => ->. rewrite unpack16x8K //. qed.

lemma inj_unpack128x2 (x y : 'a Array256.t) :
  (unpack128x2 x = unpack128x2 y) => (x = y).
rewrite -(unpack128x2K x) -(unpack128x2K y). rewrite !pack128x2K => ->. rewrite unpack128x2K //. qed.

lemma nttunpack128_corr_h a :
 hoare[ Jkem_avx2.M(Jkem_avx2.Syscall).__nttunpack128 :
   is16u16x8 a arg ==> is16u16x8 (nttunpack128x16 a) res].
proc.
(*shuffle8*)
pose r0_8 := (shuf8 a.`1 a.`5).`1.
pose r1_8 := (shuf8 a.`2 a.`6).`1.
pose r2_8 := (shuf8 a.`3 a.`7).`1.
pose r3_8 := (shuf8 a.`4 a.`8).`1.
pose r4_8 := (shuf8 a.`1 a.`5).`2.
pose r5_8 := (shuf8 a.`2 a.`6).`2.
pose r6_8 := (shuf8 a.`3 a.`7).`2.
pose r7_8 := (shuf8 a.`4 a.`8).`2.
seq 1 : (is16u16x8 (r0_8,a.`2,a.`3,a.`4,r4_8,a.`6,a.`7,a.`8) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle8_corr_h a.`1 a.`5) => />. auto => />. 
seq 1 : (is16u16x8 (r0_8,r1_8,a.`3,a.`4,r4_8,r5_8,a.`7,a.`8) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle8_corr_h a.`2 a.`6) => />. auto => />.
seq 1 : (is16u16x8 (r0_8,r1_8,r2_8,a.`4,r4_8,r5_8,r6_8,a.`8) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle8_corr_h a.`3 a.`7) => />. auto => />.
seq 1 : (is16u16x8 (r0_8,r1_8,r2_8,r3_8,r4_8,r5_8,r6_8,r7_8) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle8_corr_h a.`4 a.`8) => />. auto => />.
(*shuffle4*)
pose r0_4 := (shuf4 r0_8 r2_8).`1.
pose r1_4 := (shuf4 r1_8 r3_8).`1.
pose r2_4 := (shuf4 r0_8 r2_8).`2.
pose r3_4 := (shuf4 r1_8 r3_8).`2.
pose r4_4 := (shuf4 r4_8 r6_8).`1.
pose r5_4 := (shuf4 r5_8 r7_8).`1.
pose r6_4 := (shuf4 r4_8 r6_8).`2.
pose r7_4 := (shuf4 r5_8 r7_8).`2.
seq 1 : (is16u16x8 (r0_4,r1_8,r2_4,r3_8,r4_8,r5_8,r6_8,r7_8) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle4_corr_h r0_8 r2_8) => />. auto => />.
seq 1 : (is16u16x8 (r0_4,r1_8,r2_4,r3_8,r4_4,r5_8,r6_4,r7_8) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle4_corr_h r4_8 r6_8) => />. auto => />.
seq 1 : (is16u16x8 (r0_4,r1_4,r2_4,r3_4,r4_4,r5_8,r6_4,r7_8) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle4_corr_h r1_8 r3_8) => />. auto => />.
seq 1 : (is16u16x8 (r0_4,r1_4,r2_4,r3_4,r4_4,r5_4,r6_4,r7_4) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle4_corr_h r5_8 r7_8) => />. auto => />.
(*shuffle2*)
pose r0_2 := (shuf2 r0_4 r1_4).`1.
pose r1_2 := (shuf2 r0_4 r1_4).`2.
pose r2_2 := (shuf2 r2_4 r3_4).`1.
pose r3_2 := (shuf2 r2_4 r3_4).`2.
pose r4_2 := (shuf2 r4_4 r5_4).`1.
pose r5_2 := (shuf2 r4_4 r5_4).`2.
pose r6_2 := (shuf2 r6_4 r7_4).`1.
pose r7_2 := (shuf2 r6_4 r7_4).`2.
seq 1 : (is16u16x8 (r0_2,r1_2,r2_4,r3_4,r4_4,r5_4,r6_4,r7_4) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle2_corr_h r0_4 r1_4) => />. auto => />.
seq 1 : (is16u16x8 (r0_2,r1_2,r2_2,r3_2,r4_4,r5_4,r6_4,r7_4) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle2_corr_h r2_4 r3_4) => />. auto => />.
seq 1 : (is16u16x8 (r0_2,r1_2,r2_2,r3_2,r4_2,r5_2,r6_4,r7_4) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle2_corr_h r4_4 r5_4) => />. auto => />.
seq 1 : (is16u16x8 (r0_2,r1_2,r2_2,r3_2,r4_2,r5_2,r6_2,r7_2) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle2_corr_h r6_4 r7_4) => />. auto => />.
(*shuffle1*)
pose r0_1 := (shuf1 r0_2 r4_2).`1.
pose r1_1 := (shuf1 r1_2 r5_2).`1.
pose r2_1 := (shuf1 r2_2 r6_2).`1.
pose r3_1 := (shuf1 r3_2 r7_2).`1.
pose r4_1 := (shuf1 r0_2 r4_2).`2.
pose r5_1 := (shuf1 r1_2 r5_2).`2.
pose r6_1 := (shuf1 r2_2 r6_2).`2.
pose r7_1 := (shuf1 r3_2 r7_2).`2.
seq 1 : (is16u16x8 (r0_1,r1_2,r2_2,r3_2,r4_1,r5_2,r6_2,r7_2) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle1_corr_h r0_2 r4_2) => />. auto => />.
seq 1 : (is16u16x8 (r0_1,r1_1,r2_2,r3_2,r4_1,r5_1,r6_2,r7_2) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle1_corr_h r1_2 r5_2) => />. auto => />.
seq 1 : (is16u16x8 (r0_1,r1_1,r2_1,r3_2,r4_1,r5_1,r6_1,r7_2) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle1_corr_h r2_2 r6_2) => />. auto => />.
seq 1 : (is16u16x8 (r0_1,r1_1,r2_1,r3_1,r4_1,r5_1,r6_1,r7_1) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (avx2_shuffle1_corr_h r3_2 r7_2) => />. auto => />.
(*end*)
auto => /> &m -> -> -> -> -> -> -> ->. 
do 8!(try split; first by
 apply W16u16.wordP => i Hi; rewrite !bits16_W16u16 // Hi //= !of_listE !list_arr16 !initiE //=; rewrite /to_list !nth_mkseq //=; move:Hi; rewrite rng_iotared => />;
 do 16!(try(move => Hi; case Hi => />); first by rewrite /nttunpack128 /perm_nttunpack128 unpack16x8E pack16x8E => />)).
qed.

lemma __nttunpack128_ll: islossless Jkem_avx2.M(Jkem_avx2.Syscall).__nttunpack128 by islossless.

phoare nttunpack128_corr a :
 [ Jkem_avx2.M(Jkem_avx2.Syscall).__nttunpack128 :
   is16u16x8 a arg ==> is16u16x8 (nttunpack128x16 a) res] = 1%r.
conseq __nttunpack128_ll (nttunpack128_corr_h a) => />. qed.

lemma nttunpack_corr_h a :
 hoare[ Jkem_avx2.M(Jkem_avx2.Syscall)._nttunpack : arg = a ==> res = nttunpack a].
proc. sp. 
seq 1 : (rp=a /\ is16u16x8 (nttunpack128x16 (unpack16x8 (unpack128x2 a).`1)) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (nttunpack128_corr_h (unpack16x8 (unpack128x2 a).`1)) => />. auto => />.
do 8!(try split; first by
 apply W16u16.wordP => i Hi; rewrite bits16_W16u16 // Hi //=; rewrite /get256_direct bits16_W32u8 Hi //=; rewrite unpack16x8E unpack128x2E //=; move :Hi; rewrite rng_iotared;
 do 16!(try (move => Hi; case Hi => />); first by rewrite !initiE //= pack2_bits8 //)).
seq 8 : ((unpack128x2 rp).`2 = (unpack128x2 a).`2 /\ (unpack128x2 rp).`1 = (unpack128x2 (nttunpack a)).`1 ).
wp. skip => /> &m -> -> -> -> -> -> -> ->. rewrite nttunpack128x2. rewrite !unpack128x2E => />. split.
+ rewrite tP => j Hj. rewrite !initiE //=. rewrite !initiE //= 1:/#. rewrite !list_arr16 /=.
  do 8!(rewrite set256_directE 1:/#; rewrite get16_set256E //=; rewrite ifF 1:/#; rewrite get16_init16 1:/#; try(rewrite !initiE //=1:/#)). trivial.
+ rewrite tP => j Hj. rewrite !initiE //= 1:/#. rewrite !list_arr16.
  do 7!(rewrite set256_directE 1:/#; rewrite get16_set256E //=; rewrite get16_init16 1:/#; rewrite initiE //= 1:/#).
  rewrite set256_directE 1:/#. rewrite get16_set256E //=. rewrite get16_init16 1:/#. 
  rewrite !bits16_W16u16. rewrite !unpack16x8K. rewrite !of_listE !initE //= /to_list !nth_mkseq_if //=. rewrite rng_perm_nttunpack128 //=. rewrite !unpack16x8E //=. rewrite !initE //=. rewrite /nttunpack128 !initE //=. rewrite !initE //=. rewrite !rng_perm_nttunpack128 //=. smt().
sp. 
seq 1 : ((unpack128x2 rp).`2 = (unpack128x2 a).`2 /\ (unpack128x2 rp).`1 = (unpack128x2 (nttunpack a)).`1 /\ is16u16x8 (nttunpack128x16 (unpack16x8 (unpack128x2 a).`2)) (r0,r1,r2,r3,r4,r5,r6,r7)). auto => />. call (nttunpack128_corr_h (unpack16x8 (unpack128x2 a).`2)) => />. auto => /> &m <- H2.
do 8!(try split; first by
 apply W16u16.wordP => i Hi; rewrite bits16_W16u16 // Hi //=; rewrite /get256_direct bits16_W32u8 Hi //=; rewrite unpack16x8E unpack128x2E //=; move :Hi; rewrite rng_iotared => />;
 do 16!(try (move => Hi; case Hi => />); first by rewrite !initiE //= pack2_bits8 //)).
auto => /> &m H1 H2 -> -> -> -> -> -> -> ->.
apply inj_unpack128x2 => />. rewrite -(unpack128x2K rp{m}) (prod (unpack128x2 rp{m})). rewrite (prod (unpack128x2 (nttunpack a))). 
move :H1 H2. move => -> ->.
rewrite nttunpack128x2 !unpack16x8K !list_arr16 !unpack128x2E !pack128x2E => />. split.
+ rewrite tP => i Hi.
  rewrite !initiE //= 1:/#. rewrite !initiE //=. rewrite rng_perm_nttunpack128 //.
  do 8!(rewrite set256_directE 1:/# get16_set256E //=; rewrite ifF 1:/#; rewrite get16_init16 1:/#; rewrite !initiE //= 1:/#).
  rewrite ifT //=. rewrite /nttunpack128 !initiE //= 1:/#. rewrite !initiE //=. rewrite rng_perm_nttunpack128 1:/#. smt().
+ rewrite tP => i Hi. rewrite !initiE //=. rewrite !initiE //= 1:/#. rewrite rng_perm_nttunpack128 //.
  do 8!(rewrite set256_directE 1:/# get16_set256E //=; rewrite get16_init16 1:/#; rewrite !initiE //= 1:/#).
  rewrite !bits16_W16u16. rewrite !of_listE !initE //= /to_list !nth_mkseq_if //=. rewrite !unpack16x8E //=. rewrite !initE //=. rewrite /nttunpack128 !initE //=. rewrite !initE //=. rewrite !rng_perm_nttunpack128 //= 1..2:/#.
qed.

lemma _nttunpack_ll: islossless Jkem_avx2.M(Jkem_avx2.Syscall)._nttunpack by islossless.

phoare nttunpack_corr a :
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._nttunpack : arg = a ==> res = nttunpack a] = 1%r.
conseq _nttunpack_ll (nttunpack_corr_h a) => />. qed.



lemma lift768_nttunpack (v : W16.t Array768.t):
  lift_array768 (nttunpackv v) = nttunpackv (lift_array768 v).
rewrite /lift_array768 /nttunpackv tP => k kb.
rewrite mapiE //= !initiE //=.
case (0<=k <256).
+ move => *; rewrite /subarray256 /nttunpack !initiE //=.
  pose a:=nttunpack_idx.[k].
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite mapiE //=. smt(nttunpack_bnd Array256.allP).
case (256<=k <512).
+ move => *; rewrite /subarray256 /nttunpack !initiE //=. smt(). smt().
  pose a:=nttunpack_idx.[k-256].
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite mapiE //=. smt(nttunpack_bnd Array256.allP).
move => *; rewrite /subarray256 /nttunpack !initiE //=. smt(). smt().
pose a:=nttunpack_idx.[k-512].
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite mapiE //=. smt(nttunpack_bnd Array256.allP).
qed.
(********************************************************)


module HmoduleLow = {
   proc __gen_matrix(sd : W8.t Array32.t, trans : bool) : W16.t Array2304.t = {
       var aa : polymat;
       if (trans) {
          aa <@ Hmodule.sampleAT(sd);
       }
       else {
          aa <@ Hmodule.sampleA(sd);
       }
       return (unlift_matrix aa);
   }
}.

equiv Hmodule_connection :
   HmoduleLow.__gen_matrix ~ AuxMLKEM.__gen_matrix :
    ={arg} ==> ={res}.
proc. 
case (trans{1});last first.
+ rcondf{1} 1; 1: by auto.
  inline {1} 1;wp. 
  conseq (: _ ==> ={a}) => //.  
  while (0<=i{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i} /\ !trans{1} /\
         (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat);
   last by auto => />;smt(eq_matrixP getmE). 
  wp;conseq />;1:smt().
  while (0<=i{1}<kvec /\ 0<=j{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i,j} /\ !trans{1} /\
         (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat /\
         (forall kk, 0<=kk<j{1} => a{1}.[i{1},kk] = a{2}.[i{1},kk])%PolyMat);
   last by auto => />;smt(getmE). 
   inline XOF.init; sp;wp. 
   exlim rho{2}, i0{2}, j0{2}  => _rho _i _j.
   call {2} (parse_sem (SHAKE128_ABSORB_34 _rho (W8.of_int _i) (W8.of_int _j)) _rho (W8.of_int _i) (W8.of_int _j)).
   auto => /> &1 a1 ?????H H0?;do split;1,2: smt(). 
   + move => kk jj ????.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = i{1} /\ jj = j{1}); 1: by smt().
     move => ?;case (kk < i{1});
      1: by move => ?;move : (H kk jj _ _);  smt().
     move => ?;move : (H0 jj _); smt().
   + move => kk ??.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = j{1}); 1: by smt().
     by move => ?;move : (H0 kk _); smt().
rcondt{1} 1; 1: by auto.
inline {1} 1;wp. 
conseq (: _ ==> ={a}) => //.  
while (0<=i{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i} /\ trans{1} /\
       (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat);
 last by auto => />;smt(eq_matrixP getmE). 
wp;conseq />;1:smt().
while (0<=i{1}<kvec /\ 0<=j{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i,j} /\ trans{1} /\
       (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat /\
       (forall kk, 0<=kk<j{1} => a{1}.[i{1},kk] = a{2}.[i{1},kk])%PolyMat);
 last by auto => />;smt(getmE). 
 inline XOF.init; sp;wp. 
 exlim rho{2}, i0{2}, j0{2}  => _rho _i _j.
 call {2} (parse_sem (SHAKE128_ABSORB_34 _rho (W8.of_int _i) (W8.of_int _j)) _rho (W8.of_int _i) (W8.of_int _j)).
   auto => /> &1 a1 ?????H H0?;do split;1,2: smt(). 
   + move => kk jj ????.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = i{1} /\ jj = j{1}); 1: by smt().
     move => ?;case (kk < i{1});
      1: by move => ?;move : (H kk jj _ _);  smt().
     move => ?;move : (H0 jj _); smt().
   + move => kk ??.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = j{1}); 1: by smt().
     by move => ?;move : (H0 kk _); smt().
qed.

phoare Hmodule_low_sem _sd b :
 [  HmoduleLow.__gen_matrix : arg=(_sd,b) ==> res = if b 
                                             then unlift_matrix (trmx (sampleA _sd)) 
                                             else unlift_matrix (sampleA _sd) ] = 1%r. 
proc;case trans;last first.
+ rcondf 1;1: by auto. 
  by call (sampleA_sem _sd);auto => />.
rcondt 1;1: by auto. 
call (sampleAT_sem _sd);auto => />.
qed.


op unlift_polyu(a : poly) = Array256.init (fun i => W16.of_int (Zq.asint a.[i])).

lemma sampleA_pos r c _sd b:
  0 <= r < 3 =>
  0 <= c < 3 =>
  subarray256
    (subarray768
       (unlift_matrix (if b then sampleA _sd else sampleA _sd)) r) c = 
     unlift_polyu ((if b then sampleA _sd else sampleA _sd).[r,c])%PolyMat.
move => rb cb.
rewrite /subarray256 /unlift_poly tP => k kb.
rewrite !Array256.initiE 1,2:/# /= /subarray768 Array768.initiE 1:/# /=.
rewrite /unlift_matrix Array2304.initiE 1:/# /= getmE /=.
smt().
qed.

phoare sample_last _rho :
 [ Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_sample_one_polynomial :
   rho = _rho /\ rc = W16.of_int (2*256+2) ==> 
   res.`1 = subarray256 (subarray768 (unlift_matrix (sampleA _rho)) 2) 2 ] = 1%r.
have -> : subarray256 (subarray768 (unlift_matrix (sampleA _rho)) 2) 2 = unlift_polyu (parse (SHAKE128_ABSORB_34 _rho ((of_int 2))%W8 ((W8.of_int 2)))).`1.
+  have //=  -> := sampleA_pos 2 2 _rho false _ _ => //.
   by rewrite /sampleA /=;congr; rewrite setmE getmE /= offunmE /#. 
proc => /=.
do 3!(unroll ^while).
rcondt ^if;1: by wp;call(:true) => //.
rcondt ^if;1: by do 3!(wp;call(:true) => //). 
rcondt ^if;1: by do 5!(wp;call(:true) => //). 
admitted.

op subarray1024 ['a] (x : 'a Array2304.t) (i : int) : 'a Array1024.t = 
        Array1024.init (fun (k : int) => x.[1024 * i + k]).

lemma sample_four _sd _rc b :
 (_rc = 0 \/ _rc = 4) =>
 phoare
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_sample_four_polynomials :
   rho = _sd /\ mat_entry = W64.of_int _rc /\ transposed = W64.of_int (b2i b) ==> 
   res.`1 = subarray1024 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) (_rc %% 3) ] = 1%r.
admitted.

phoare _gen_matrix_avx2_sem _sd b :
 [  Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_avx2 : arg.`2 = _sd /\ arg.`3 = W64.of_int (b2i b)
                                         ==> res = if b 
                                             then nttunpackm (unlift_matrix (trmx (sampleA _sd))) 
                                             else nttunpackm (unlift_matrix (sampleA _sd)) ] = 1%r. 
proc => /=. 
while (0<=i<=3 /\ rho = _sd /\ 
    ((forall kk, 0 <= kk < i => subarray768 matrix kk = nttunpackv (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))) /\
     (forall kk, i <= kk < 3 => subarray768 matrix kk = (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))) (kvec-i).
+ move => *;wp => />;1:smt(). 
  while (0<=i<3 /\ 0 <= j <= 3 /\ rho = _sd /\
    ((forall kk, 0 <= kk < i => subarray768 matrix kk = nttunpackv (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))) /\
     (forall kk, i+1 <= kk < 3 => subarray768 matrix kk = (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk)) /\
     (forall kk, 0 <= kk < j => subarray256 (subarray768 matrix i) kk = nttunpack (subarray256 (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) i) kk)) /\
     (forall kk, j <= kk < 3 => subarray256 (subarray768 matrix i) kk = subarray256 (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) i) kk)) (kvec-j); last first.
  + auto => /> &hr ?? H H0 ?;do split;1..3:smt().
    + move => j0 m;do split;1:smt().
      move => ??? H1 H2 H3 H4;do split;1,2,4..:smt(). 
      move => kk kkbl kkbh;case(kk=i{hr});2: by smt().
      move => ->;rewrite /nttunpackv /= tP => ii iib.
      rewrite !initiE //=.
      case(0 <= ii && ii < 256).
      + by move => kb;rewrite -H3 1:/# initiE //= initiE /#.
      case(256 <= ii && ii < 512).
      + by  move => ?kb;rewrite -H3 1:/# initiE 1:/# //= initiE /#.
      by  move => ?kb;rewrite -H3 1:/# initiE 1:/# //= initiE /#.
  move => *.
  exlim matrix, i, j => _m _i _j.
  wp;call(nttunpack_corr ((init (fun (i_0 : int) => _m.[_i * (3 * 256) + _j * 256 + i_0]))%Array256)).
  auto => /> ?? H H0 H1 H2 H3 H4 ?;do split; 1,2,7..:smt(). 
  + move => ii??. 
    rewrite  tP => kk kkb.
    have -> : (subarray768
   ((init
       (fun (i_0 : int) =>
          if _i * 768 + _j * 256 <= i_0 && i_0 < _i * 768 + _j * 256 + 256 then
            (nttunpack ((init (fun (i_0_0 : int) => _m.[_i * 768 + _j * 256 + i_0_0])))%Array256).[
            i_0 - (_i * 768 + _j * 256)]
          else _m.[i_0])))%Array2304 ii) =
          subarray768 _m ii; last by smt().
     by rewrite tP => jj jjb; rewrite !initiE //= initiE 1:/# /= ifF 1:/#.  
 + move => ii iibl iibh.    
    have -> : (subarray768
   ((init
       (fun (i_0 : int) =>
          if _i * 768 + _j * 256 <= i_0 && i_0 < _i * 768 + _j * 256 + 256 then
            (nttunpack ((init (fun (i_0_0 : int) => _m.[_i * 768 + _j * 256 + i_0_0])))%Array256).[
            i_0 - (_i * 768 + _j * 256)]
          else _m.[i_0])))%Array2304 ii) =
          subarray768 _m ii; last by smt().
     by rewrite tP => jj jjb; rewrite !initiE //= initiE 1:/# /= ifF 1:/#.  
 + move => ii iibl iibh.
   case (ii = _j); last first.  
   + move => iibb;rewrite -H3 1:/#.
     rewrite /subarray256 /subarray768 tP => *.
     by rewrite !initiE //= !initiE //= 1,2:/# initiE /#.
   move => ->. 
   rewrite /subarray256 /subarray768  tP => *.
   rewrite initiE //= initiE 1:/# /= initiE 1:/# /= ifT 1:/#;congr;2:smt().
   congr;rewrite tP => i0 i0b; rewrite !initiE 1,2:/# /= initiE 1:/# /=.
   move : (H4 _j _); 1:smt().
   rewrite tP => H4u. 
   move : (H4u i0 _);1:smt().
   by smt(Array768.initiE Array256.initiE).

 + move => ii iibl iibh.
   rewrite -H4 1:/#.
   rewrite /subarray256 /subarray768  tP => *.
   by rewrite initiE //= initiE 1:/# /= initiE 1:/# /= ifF 1:/# initiE 1:/# /= initiE /#. 

wp 15;conseq (_:  (forall kk, 0 <= kk < 3 =>  subarray768 matrix kk = (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))).
move =>/> m0 H; split;1:smt().
case b => hb.
+ move => i1 m1 *; split;1: smt(). 
  move => ???H0 H1. 
  rewrite /nttunpackm tP => k kb; rewrite !initiE //=.
  case (0 <= k && k < 768).
  + by move => kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.  
  case (768 <= k && k < 1536).
  + by move =>? kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.  
  by move =>? kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.
move => i1 m1 *; split;1: smt(). 
move => ???H0 H1. 
rewrite /nttunpackm tP => k kb; rewrite !initiE //=.
case (0 <= k && k < 768).
+ by move => kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.  
case (768 <= k && k < 1536).
+ by move =>? kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.  
by move =>? kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.

unroll for 9.
wp;call (sample_last _sd). 
wp;call (sample_four _sd 4 b _).
wp;call (sample_four _sd 0 b _).

auto => /> &hr a -> a0 -> a1 -> row ??.
congr; rewrite tP => kk ?.
pose xx := (unlift_matrix (if b then trmx (sampleA _sd) else sampleA _sd)).[kk].
rewrite initiE 1:/# /=.
case (2048 <= kk && kk < 2304).
+ move => lastpos;rewrite /subarray256 /subarray768 initiE 1:/# /= initiE 1:/# /=.
  rewrite /xx;  case (!(b = true)); 1: by smt().
  move => /= ->;rewrite /unlift_matrix !initiE 1,2:/# /=;congr;congr.
  by rewrite /trmx offunmE 1:/# /= /#.

move => notlast.
rewrite initiE 1:/# /=.
case (1024 <= kk && kk < 2048).
+ by move => middlepos;rewrite /subarray1024 initiE /#.
move => *;rewrite initiE 1:/# /=.
by rewrite /subarray1024 initiE /#.
qed.

equiv genmatrixequiv_aux b : 
    Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_avx2    ~   AuxMLKEM.__gen_matrix :
 rho{1} = seed{2} /\ transposed{1} = (of_int (b2i b))%W64 /\ trans{2} = b ==>
res{1} = nttunpackm res{2} /\ pos_bound2304_cxq res{1} 0 2304 2 /\ pos_bound2304_cxq res{2} 0 2304 2.
proc* => //.
transitivity {2} { r <@ HmoduleLow.__gen_matrix(seed,trans); }
    (rho{1} = seed{2} /\ transposed{1} = (W64.of_int (b2i b)) /\ trans{2} = b ==> 
     r{1} = nttunpackm r{2} /\ pos_bound2304_cxq r{1} 0 2304 2 /\ pos_bound2304_cxq r{2} 0 2304 2)
    (={seed,trans} ==> ={r});1,2:smt();last by call Hmodule_connection => />.
ecall {2} (Hmodule_low_sem seed{2} trans{2}) => /=.
ecall {1} (_gen_matrix_avx2_sem rho{1} trans{2}) => /=.
auto => /> &1;split;1:smt().
split; 2: by smt(matrix_unlift).
rewrite /nttunpack /nttunpackm.
rewrite /pos_bound2304_cxq => k kb.
case b => Hb.
+ rewrite !initiE //=. 
  case (0<= k < 768).  
  + move => kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix (trmx (sampleA seed{1}))) 0))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
  case (768<= k < 1536).  
  + move => ? kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix (trmx (sampleA seed{1}))) 1))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
  move => ??; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix (trmx (sampleA seed{1}))) 2))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
+ rewrite !initiE //=. 
  case (0<= k < 768).  
  + move => kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix ( (sampleA seed{1}))) 0))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
  case (768<= k < 1536).  
  + move => ? kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix ( (sampleA seed{1}))) 1))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
  move => ??; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix ( (sampleA seed{1}))) 2))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
qed.
