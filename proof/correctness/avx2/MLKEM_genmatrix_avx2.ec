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
   auto => /> &1 &2 a1 ?????H H0?;do split;1,2: smt(). 
   + move => kk jj ????.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = i{2} /\ jj = j{2}); 1: by smt().
     move => ?;case (kk < i{2});
      1: by move => ?;move : (H kk jj _ _);  smt().
     move => ?;move : (H0 jj _); smt().
   + move => kk ??.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = j{2}); 1: by smt().
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
   auto => /> &1 &2 a1 ?????H H0?;do split;1,2: smt(). 
   + move => kk jj ????.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = i{2} /\ jj = j{2}); 1: by smt().
     move => ?;case (kk < i{2});
      1: by move => ?;move : (H kk jj _ _);  smt().
     move => ?;move : (H0 jj _); smt().
   + move => kk ??.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = j{2}); 1: by smt().
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

lemma unlift_polyuE a:
 unlift_polyu a
 = Array256.map (fun x => W16.of_int (Zq.asint x)) a.
proof.
apply Array256.ext_eq => i Hi.
by rewrite initiE //= mapiE //.
qed.

lemma getm_setE (m:polymat) a b x i j:
 mrange i j =>
 (m.[a, b <- x].[i,j])%KMatrix.Matrix
 = if a=i /\ b=j then x else (m.[i,j])%KMatrix.Matrix.
proof.
by move=> H; rewrite setmE offunmE //= /#.
qed.

lemma unlift_polyu_getm (A: polymat) i j:
 0 <= i < 3 =>
 0 <= j < 3 =>
 unlift_polyu A.[(i,j)]%PolyMat
 = subarray256 (subarray768 (unlift_matrix A) i) j.
proof.
move=> Hi Hj.
apply Array256.ext_eq => k Hk.
rewrite initiE 1:/# initiE 1:/# /=.
rewrite initiE 1:/# /=.
rewrite initiE 1:/# /=.
congr; congr; congr; last smt().
rewrite -getmE; congr.
smt().
qed.

import Array536.
require import JWordList EclibExtra MLKEM_keccak_avx2.

abbrev bufl (buf: W8.t Array536.t) = to_list buf.

op buf_subl (buf: W8.t Array536.t) (first last: int): W8.t list =
 take (last-first) (drop first (bufl buf)).

lemma buf_subl0 buf s e:
 (e <= s)%Int =>
 buf_subl buf s e = [].
proof. by rewrite /buf_subl /#. qed.

lemma size_buf_subl buf bstart bend:
 0 <= bstart <= bend <= 536 =>
 size (buf_subl buf bstart bend) = bend - bstart.
proof.
by move=> H; rewrite size_take 1:/# size_drop 1:/# size_to_list /#.
qed.

lemma buf_sublE buf (i j: int):
 0 <= i <= j <= 536 =>
 buf_subl buf i j = sub buf i (j-i).
proof.
move=> H; rewrite /buf_subl /sub.
apply (eq_from_nth witness).
 by rewrite size_take 1:/# size_drop 1:/# !size_mkseq /#.
move=> k.
rewrite size_take 1:/# size_drop 1:/# size_to_list => Hk.
by rewrite nth_take 1..2:/# nth_drop 1..2:/# !nth_mkseq /#.
qed.

lemma sub2buf_subl (buf: W8.t Array536.t) (k len: int):
 0 <= k <= k+len <= 536 =>
 sub buf k len = buf_subl buf k (k+len).
proof.
move=> H; rewrite /buf_subl /sub.
apply (eq_from_nth witness).
 rewrite size_take 1:/# size_drop 1:/# !size_mkseq /#.
move=> i; rewrite size_mkseq => Hi.
by rewrite nth_take 1..2:/# nth_drop 1..2:/# !nth_mkseq /#.
qed.

lemma buf_subl_cat buf (o k n:int):
 0 <= o <= k <= n =>
 buf_subl buf o  k ++ buf_subl buf k n = buf_subl buf o n.
proof.
move=> H; rewrite /buf_subl /=.
rewrite -(cat_take_drop (k-o) (take (n-o) _)).
rewrite take_take ifT 1:/#; congr.
rewrite drop_take 1:/#; congr; first smt().
by rewrite drop_drop /#.
qed.

lemma buf_subl_sub buf o k n l:
 0 <= o <= k <= n =>
 buf_subl buf o n = l =>
 buf_subl buf o k = take (k-o) l.
proof.
move=> H; rewrite /buf_subl => <-.
by rewrite take_take ifT 1:/#.
qed.

hoare comp_u64_l_int_and_u64_l_int_h _a _i1 _b _i2:
 Jkem_avx2.M(Jkem_avx2.Syscall).comp_u64_l_int_and_u64_l_int
 : arg = (_a,_i1,_b,_i2)
   /\ _i1 %% W64.modulus = _i1 /\ _i2 %% W64.modulus = _i2
   ==>
   res = (to_uint _a < _i1 && to_uint _b < _i2).
proof.
proc; auto => />  E1 E2.
rewrite /_uLT /CMP_64 /_NEQ /_EQ /TEST_8.
rewrite /rflags_of_bwop /rflags_of_aluop /SETcc /ZF_of /=.
case: (to_uint _a < _i1) => C1.
 case: (to_uint _b < _i2) => C2.
  rewrite !to_uintD !to_uintN !of_uintK.
  by rewrite ifT 1:/# ifT 1:/# /= to_uint_eq /=.
 rewrite -lezNgt in C2.
 rewrite (W64.to_uintB _b).
  by rewrite /(\ule)  of_uintK E2.
 rewrite !to_uintD !to_uintN !of_uintK.
 by rewrite ifT 1:/# /=.
rewrite -lezNgt in C1.
rewrite (W64.to_uintB _a) //=.
by rewrite /(\ule)  of_uintK E1.
qed.

lemma comp_u64_l_int_and_u64_l_int_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall).comp_u64_l_int_and_u64_l_int.
proof. by islossless. qed.

phoare comp_u64_l_int_and_u64_l_int_ph _a _i1 _b _i2:
 [Jkem_avx2.M(Jkem_avx2.Syscall).comp_u64_l_int_and_u64_l_int
  : arg = (_a,_i1,_b,_i2)
    /\ _i1 %% W64.modulus = _i1 /\ _i2 %% W64.modulus = _i2
    ==>
    res = (to_uint _a < _i1 /\ to_uint _b < _i2)
 ] = 1%r.
proof.
conseq comp_u64_l_int_and_u64_l_int_ll (comp_u64_l_int_and_u64_l_int_h _a _i1 _b _i2).
smt().
qed.

hoare conditionloop_h _a _i1 _b _i2:
 Jkem_avx2.M(Jkem_avx2.Syscall).comp_u64_l_int_and_u64_l_int
  : arg = (_a,_i1+1,_b,_i2)
    /\ (_i1+1) %% W64.modulus = _i1+1
    /\ (_i2) %% W64.modulus = _i2
    ==>
    res = (to_uint _a <=_i1 /\ to_uint _b < _i2).
proof.
by conseq (comp_u64_l_int_and_u64_l_int_h _a (_i1+1) _b _i2) => /#.
qed.

phoare conditionloop_ph _a _i1 _b _i2:
 [Jkem_avx2.M(Jkem_avx2.Syscall).comp_u64_l_int_and_u64_l_int
  : arg = (_a,_i1+1,_b,_i2)
    /\ (_i1+1) %% W64.modulus = _i1+1
    /\ _i2 %% W64.modulus = _i2
    ==>
    res = (to_uint _a <= _i1 /\ to_uint _b < _i2)
 ] = 1%r.
proof.
by conseq comp_u64_l_int_and_u64_l_int_ll (conditionloop_h _a _i1 _b _i2).
qed.

op auxdata_ok (load_shuffle mask bounds ones: W256.t)
              (sst:  W8.t Array2048.Array2048.t) : bool =
 load_shuffle = W32u8.pack32 (to_list sample_load_shuffle)
 /\ mask = sample_mask
 /\ bounds = sample_q
 /\ ones = sample_ones
 /\ sst = sample_shuffle_table.

hoare buf_rejection_filter48_h _pol _ctr _buf _buf_offset:
 Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter48
 : counter = _ctr
   /\ to_uint _ctr <= 256-32
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ auxdata_ok load_shuffle mask bounds ones sst
   ==>
   let l = rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint _buf_offset + 48))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ res.`2 = W64.of_int (to_uint _ctr + size l).
proof.
admitted.

lemma buf_rejection_filter48_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter48
 by islossless.

phoare buf_rejection_filter48_ph _pol _ctr _buf _buf_offset:
 [Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter48
 : counter = _ctr
   /\ to_uint _ctr <= 256-32
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ auxdata_ok load_shuffle mask bounds ones sst
   ==>
   let l = rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint _buf_offset + 48))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ res.`2 = W64.of_int (to_uint _ctr + size l)] = 1%r.
proof.
by conseq buf_rejection_filter48_ll (buf_rejection_filter48_h _pol _ctr _buf _buf_offset).
qed.

hoare buf_rejection_filter24_h _pol _ctr _buf _buf_offset:
 Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter24
 : counter = _ctr
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ auxdata_ok load_shuffle mask bounds ones sst
   ==>
   let l = take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint _buf_offset + 24)))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ res.`2 = W64.of_int (to_uint _ctr + size l).
proof.
admitted.

lemma buf_rejection_filter24_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter24
 by islossless.

phoare buf_rejection_filter24_ph _pol _ctr _buf _buf_offset:
 [Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter24
 : counter = _ctr
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ auxdata_ok load_shuffle mask bounds ones sst
   ==>
   let l = take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint _buf_offset + 24)))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ res.`2 = W64.of_int (to_uint _ctr + size l)] = 1%r.
proof.
by conseq buf_rejection_filter24_ll (buf_rejection_filter24_h _pol _ctr _buf _buf_offset).
qed.

lemma take_rejection16_done n buf buf_o bo:
 0 <= buf_o <= bo <= 504 =>
 3 %| buf_o =>
 3 %| bo =>
 size (take n (rejection16 (buf_subl buf buf_o bo))) = n =>
 take n (rejection16 (buf_subl buf buf_o bo))
 = take n (rejection16 (buf_subl buf buf_o 504)).
proof.
move=> H H1 H2 /size_takel' [Hsz1].
rewrite size_map => Hsz2.
rewrite -(buf_subl_cat _ _ bo 504) 1:/# /rejection16 rejection_cat.
 by rewrite size_buf_subl /#.
rewrite -map_take eq_sym -map_take; congr.
by rewrite take_cat' ifT.
qed.

lemma pack32_sample_load_shuffle:
 pack32 (to_list sample_load_shuffle)
 = get256_direct ((init8 ("_.[_]" sample_load_shuffle)))%WArray32 0.
proof.
rewrite get256E; congr.
apply W32u8.Pack.all_eqP.
by rewrite of_listK 1:/# /all_eq /= !initiE /#.
qed.

lemma size_rejection16_le buf bstart bend1 bend2:
 3 %| bstart =>
 3 %| bend1 =>
 3 %| bend2 =>
 0 <= bstart <= bend1 <= bend2 <= 536 =>
 size (rejection16 (buf_subl buf bstart bend1))
 <= size (rejection16 (buf_subl buf bstart bend2)).
proof.
move=> H1 H2 H3 H.
rewrite /rejection16 !size_map.
rewrite -(buf_subl_cat _ _ bend1 bend2) 1:/#.
rewrite bytes2coeffs_cat.
 by rewrite size_buf_subl /#.
by rewrite filter_cat size_cat; smt(size_ge0).
qed.

lemma rejection16_cat l1 l2:
 3 %| size l1 =>
 rejection16 (l1++l2) = rejection16 l1 ++ rejection16 l2.
proof.
by move=> H; rewrite /rejection16 rejection_cat // map_cat.
qed.

hoare gen_matrix_buf_rejection_h _pol _ctr _buf _buf_offset:
 Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_buf_rejection
 : counter = _ctr
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ 0 <= to_uint counter < 256
   /\ (to_uint buf_offset = 0 \/ to_uint buf_offset = 2*168)
   ==>
   let l = take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) 504))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ res.`2 = W64.of_int (to_uint _ctr + size l).
proof.
proc; simplify.
while ( buf=_buf /\ 24 %| to_uint buf_offset /\ 3 %| to_uint _buf_offset /\
        0 <= to_uint _buf_offset <= to_uint buf_offset <= 504 /\
        0 <= to_uint _ctr <= to_uint counter <= 256 /\
        auxdata_ok load_shuffle mask bounds ones sst /\
        (plist pol (to_uint counter)
         = plist _pol (to_uint _ctr)
           ++ take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint buf_offset)))
        ) /\
        (condition_loop
          <=> (to_uint counter < 256 
               /\ to_uint buf_offset <= 504-24))).
 ecall (conditionloop_h buf_offset (3 * 168 - 24) counter 256); simplify.
 wp; ecall (buf_rejection_filter24_h pol counter buf buf_offset).
 auto => &m /> Hdvd1 Hdvd2 Ho1 Ho2 Ho3 Hctr1 Hctr2 Hctr3 H Hcond1 Hcond2.
 have Hsz: to_uint counter{m} = to_uint _ctr + min (256-to_uint _ctr) (size (rejection16 (buf_subl buf{m} (to_uint _buf_offset) (to_uint buf_offset{m})))).
  rewrite -(size_plist pol{m} (to_uint counter{m})) 1:/# H size_cat size_plist 1:/#; congr.
  by rewrite size_take_min /#.
 move: H; rewrite take_oversize 1:/# => H [p c' ms'] /= />.
 rewrite !of_uintK => Hstep.
 rewrite !to_uintD_small 1:/# !of_uintK; split; first smt().
 split.
  split; first by rewrite !modz_small //= /#.
  by move=> *; rewrite !modz_small //= /#.
 split.
  by rewrite size_take_min 1:/# modz_small; smt(size_ge0).
 rewrite modz_small; first smt(size_ge0 size_take_min).
 rewrite modz_small 1:/#.
 rewrite Hstep H -catA; congr.
 rewrite -(buf_subl_cat _ (to_uint _buf_offset) (to_uint buf_offset{m}) (to_uint buf_offset{m} + 24)) 1:/#.
 rewrite rejection16_cat.
  by rewrite size_buf_subl /#.
 by rewrite take_catr 1:/#; congr; congr; smt().
ecall (conditionloop_h buf_offset (3 * 168 - 24) counter 256).
wp.
while ( buf=_buf /\ 24 %| to_uint buf_offset /\ 3 %| to_uint _buf_offset /\
        0 <= to_uint _buf_offset <= to_uint buf_offset <= 504 /\
        0 <= to_uint _ctr <= to_uint counter <= 256 /\
        auxdata_ok load_shuffle mask bounds ones sst /\
        plist pol (to_uint counter)
        = plist _pol (to_uint _ctr)
           ++ rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint buf_offset)) /\
        to_uint _ctr + size (rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint buf_offset))) <= 256 /\
        (condition_loop
          <=> (to_uint counter <= 256-32
               /\ to_uint buf_offset <= 504-48))).
 ecall (conditionloop_h buf_offset (3 * 168 - 48) counter (256-32+1)); simplify.
 wp; ecall (buf_rejection_filter48_h pol counter buf buf_offset).
 auto => &m /> Hdvd1 Hdvd2 Ho1 Ho2 Ho3 Hctr1 Hctr2 Hctr3 H Hbo Hcond1 Hcond2 [p c'] /= /> Hstep. 
 rewrite !to_uintD_small 1:/# !of_uintK; split; first smt().
 split.
  by rewrite !modz_small //= /#.
 pose R:= rejection16 _.
 have ?: 0 <= size R <= 32.
  rewrite /rejection16 size_map; split; first smt(size_ge0).
  move=> _; apply (size_rejection_le' 48) => //=.
  by rewrite /buf_subl !size_take 1:/# !size_drop /#.
 rewrite !modz_small 1..2:/#.
 split; first smt().
 rewrite -andaE; split.
  rewrite -(buf_subl_cat _ (to_uint _buf_offset) (to_uint buf_offset{m}) (to_uint buf_offset{m} + 48)) 1:/#.
  rewrite Hstep H -catA; congr.
  rewrite rejection16_cat 2://.
  by rewrite size_buf_subl /#.
 move => HH. 
 have : size (plist p (to_uint counter{m} + size R)) <= 256.
  by rewrite size_plist /#.
 by rewrite HH size_cat size_plist /#.
ecall (conditionloop_h buf_offset (3 * 168 - 48) counter (256-32+1)); simplify.
wp; skip => &m /> Hctr1 Hctr2 Hbo; split.
 split; first smt().
 split; first smt().
 split; first smt().
 split; first smt().
 split.
  by rewrite pack32_sample_load_shuffle.
 split.
  by rewrite buf_subl0 1:/# /rejection16 rejection0 cats0.
 split; last smt().
 by rewrite buf_subl0 1:/# /rejection16 rejection0 /#.
move => buf_o cond ctr pol Hcond Hdvd1 Hdvd2 Hbo1 Hbo2 Hbo3 Hctr3 Hctr4 _ H Hsz Hterm; split.
by rewrite take_oversize /#. 
move=> buf_o2 cond2 ctr2 pol2 HC2 Hdvd3 Hbo4 Hbo5 Hctr5 Hctr6 HH.
case: (to_uint ctr2 < 256) => /= C1.
 move=> C2; move: HH; have ->: to_uint buf_o2 = 504 by smt().
 move => HH; rewrite andbC -andaE to_uint_eq of_uintK modz_small.
  split=> *; first smt(size_ge0).
  by rewrite size_take /#.
 split.
  rewrite -(size_plist pol2 (to_uint ctr2)) 1:/#.
  by rewrite HH size_cat size_plist 1:/#.  
 by move => E; move: HH; rewrite E => ->. 
have E: to_uint ctr2 = 256 by smt().
rewrite to_uint_eq andbC -andaE.
have HHsz: 256 = to_uint counter{m} + min (256 - to_uint counter{m})
      (size (rejection16 (buf_subl buf{m} (to_uint buf_offset{m}) (to_uint buf_o2)))).
 rewrite -(size_plist pol2 256) 1:/#.
 by rewrite -E HH size_cat size_plist 1:/# size_take_min /#.
rewrite size_take_min 1:/#.
rewrite of_uintK modz_small; first smt(size_ge0).
split; first smt(size_rejection16_le).
move => <-; rewrite HH; congr.
apply take_rejection16_done; first 3 smt().
by rewrite size_take_min /#.
qed.

lemma gen_matrix_buf_rejection_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_buf_rejection.
proof.
proc.
seq 11: (true) => //.
 wp; while (condition_loop
            <=> to_uint counter <= 256-32 
                /\ to_uint buf_offset <= 504-48)
           (504 - to_uint buf_offset).
  move=> z.
  exlim buf_offset => _buf_offset.
  seq 2: (#{~condition_loop}pre /\ to_uint buf_offset <= 504 - 48) => //.
    by call buf_rejection_filter48_ll; auto => />.
   exlim counter => _counter.
   call (conditionloop_ph (_buf_offset+W64.of_int 48) (3*168-48) _counter (256-32+1)); simplify.
   auto => /> *.
   by rewrite to_uintD_small ?of_uintK //= /#.
  by hoare; inline*; auto => />.
 exlim buf_offset => _buf_offset.
 exlim counter => _counter.
 call (conditionloop_ph (_buf_offset) (3*168-48) _counter (256-32+1)); simplify.
 by auto => /> /#.
while (condition_loop
       <=> to_uint counter < 256 
           /\ to_uint buf_offset <= 504-24)
      (504 - to_uint buf_offset).
 move=> z.
 exlim buf_offset => _buf_offset.
 seq 2: (#{~condition_loop}pre /\ to_uint buf_offset <= 504 - 24) => //.
   by call buf_rejection_filter24_ll; auto => />.
  exlim counter => _counter.
  call (conditionloop_ph (_buf_offset+W64.of_int 24) (3*168-24) _counter 256); simplify.
  auto => /> *.
  by rewrite to_uintD_small ?of_uintK //= /#.
 by hoare; inline*; auto => />.
exlim buf_offset => _buf_offset.
exlim counter => _counter.
call (conditionloop_ph (_buf_offset) (3*168-24) _counter 256); simplify.
inline*; auto => />. 
by auto => /> * /#.
qed.

phoare gen_matrix_buf_rejection_ph _pol _ctr _buf _buf_offset:
 [  Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_buf_rejection
 : counter = _ctr
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ 0 <= to_uint counter < 256
   /\ (to_uint buf_offset = 0 \/ to_uint buf_offset = 2*168)
   ==>
   let l = take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) 504))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ res.`2 = W64.of_int (to_uint _ctr + size l)
 ] = 1%r.
proof.
by conseq gen_matrix_buf_rejection_ll (gen_matrix_buf_rejection_h _pol _ctr _buf _buf_offset).
qed.

abbrev coeff2u16 x = W16.of_int (Zq.asint x).
abbrev coeffL2u16L = List.map coeff2u16.

require import FIPS202_Keccakf1600.
require import Keccak1600_Spec Keccakf1600_Spec.

lemma stavx2_bytes_squeeze at (buf: W8.t Array536.t) st stavx:
 stmatch_avx2 st stavx =>
 sub buf at 200 = stavx2bytes stavx =>
 0 <= at < at+200 <= 536 =>
 buf_subl buf at (at+168) = squeezestate st 168.
proof.
move => /stmatch_avx2_bytes Hm.
rewrite -Hm /squeezestate => <-.
rewrite /buf_subl (addzC _ 168) -addzA /= => Hat.
apply (eq_from_nth witness).
 by rewrite !size_take 1..2:/# size_drop 1:/# size_to_list size_mkseq 1:/#.
move=> i; rewrite size_take 1:/# size_drop 1:/# size_to_list /= => Hi.
by rewrite !nth_take 1..4:/# nth_drop 1..2:/# !nth_mkseq /#.
qed.

equiv fill_poly_eq:
 Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_fill_polynomial
 ~ ParseFilter.fill_poly
 : buf_subl buf{1} 0 (3*168) = buf{2}
   /\ sub buf{1} (2*168) 200 = state2bytes st{2}
   ==>
   res{1}.`1 = unlift_polyu res{2}.
proof.
proc; simplify.

while ( to_uint counter{1}=c{2} /\ 0 <= c{2} <= 256
      /\ to_uint buf_offset{1} = 2*168
      /\ state2bytes st{2} = sub buf{1} (2*168) 200
      /\ plist pol{1} c{2} = coeffL2u16L p{2}
      ).
 ecall {1} (gen_matrix_buf_rejection_ph pol{1} counter{1} buf{1} buf_offset{1}).
 ecall {1} (stavx2_unpack_at_ph stavx2{1} buf{1} buf_offset{1}).
 sp 0 1.
 elim* => st1.
 ecall {1} (keccakf1600_avx2_ph st1).
 ecall {1} (stavx2_pack_at_ph buf{1} buf_offset{1}).
 auto => /> &1 &2 Hctr1 _ -> Est1 Hpol _ Hctr2 stavx1 /=.
 move=> Est'; split.
  by rewrite stmatch_avx2_bytes; smt(sub2buf_subl).
 move=> Hst1 stavx2 Hst2 buf.
 rewrite -!(buf_sublE _ 0 336) 1..2:/#.
 move => Ebuf Hbuf [p ctr] /=.
 rewrite Hpol ultE !of_uintK.
 have Esq: squeezestate_i c256_r8 st1 0 = buf_subl buf 336 504.
  rewrite /squeezestate_i /st_i /= iter1.
  by rewrite /c256_r8 -(stavx2_bytes_squeeze 336 buf _ stavx2 Hst2 Hbuf) //.
 move => H Hc1; split.
  split.
   rewrite Hc1 of_uintK modz_small.
    smt(size_ge0 size_take).
   rewrite /rejection16 -map_take size_map.
   by congr; congr; congr => /#.
  split.
   split; first smt(size_ge0).
   move=> _; smt(size_take).
  split.
   by rewrite Hbuf -stmatch_avx2_bytes /st_i iter1.
  rewrite map_cat map_take Esq -H; congr; congr.
  smt(size_take size_map).
 split.
  rewrite Hc1 Esq of_uintK !modz_small //.
   smt(size_ge0 size_take).
  by rewrite !size_take 1..2:/# size_map.
 rewrite -(size_plist pol{1} (to_uint counter{1})) 1:/# Hpol.
 rewrite Hc1 of_uintK !modz_small //.
  smt(size_ge0 size_take).
 rewrite -Hpol size_plist 1:/#.
 smt(size_take size_map).
wp; ecall {1} (gen_matrix_buf_rejection_ph pol{1} counter{1} buf{1} buf_offset{1}).
auto => /> &1 &2 Hbuf [p c] /=; rewrite plist0 ultE /= => H ->.
rewrite of_uintK modz_small; first smt(size_ge0 size_take).
move: H; rewrite /rejection16 !size_take // size_map /= map_take.
move => H; split; first smt(size_ge0 size_take).
move => buf ctr p1 p2 st _?_?; have ->: to_uint ctr = 256 by smt().
move => _ HH.
have Hsz: size (coeffL2u16L p2) = 256.
 by rewrite -HH size_plist /#.
apply Array256.to_list_inj.
move: HH.
rewrite /Array256.to_list /plist /= => ->.
rewrite unlift_polyuE map_of_list /=.
rewrite -(eq_in_mkseq (nth (coeff2u16 witness) (coeffL2u16L p2))).
 by move => i Hi; rewrite get_of_list //.
by rewrite -Hsz mkseq_nth.
qed.

equiv parse_one_polynomial_eq:
 Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_sample_one_polynomial
 ~  ParseFilter.sample
 : ={rho} /\ W2u8.to_list rc{1} = [j{2}; i{2}]
   ==>
   res{1}.`1 = unlift_polyu res{2}.
proof.
transitivity ParseFilter.sample3buf
 (={rho} /\ W2u8.to_list rc{1} = [ji{2}.`1; ji{2}.`2]
   ==>
   res{1}.`1 = unlift_polyu res{2})
 ((rho,(j,i)){2}=arg{1} ==> ={res}); last first.
+ by symmetry; conseq sample_sample3buf.
+ move => /> &1 &2 -> *.
  exists (rho{2},(rc{1}\bits8 0, rc{1}\bits8 1)).
  smt().
+ by move=> />.
proc; call fill_poly_eq.
seq 2 1: ( stmatch_avx2 st{2} stavx2{1} ).
 by ecall {1} (xof_init_avx2_ph rho{1} rc{1}); auto => /> /#.
simplify.
unroll {1} 2; unroll {1} 3; unroll {1} 4.
rcondt {1} 2.
 by move=> &m; auto => />.
rcondt {1} 5.
 move=> &m; simplify.
 wp; ecall (stavx2_unpack_at_h stavx2 buf buf_offset).
 ecall (keccakf1600_avx2_h st{m}).
 by auto => />.
rcondt {1} 8.
 move=> &m; simplify.
 wp; ecall (stavx2_unpack_at_h stavx2 buf buf_offset).
 ecall (keccakf1600_avx2_h (Keccakf1600_Spec.keccak_f1600_op st{m})).
 wp; ecall (stavx2_unpack_at_h stavx2 buf buf_offset).
 ecall (keccakf1600_avx2_h st{m}).
 by auto => />.
rcondf {1} 11.
 move=> &m; simplify.
 wp; ecall (stavx2_unpack_at_h stavx2 buf buf_offset).
 ecall (keccakf1600_avx2_h (Keccakf1600_Spec.keccak_f1600_op (Keccakf1600_Spec.keccak_f1600_op st{m}))).
 wp; ecall (stavx2_unpack_at_h stavx2 buf buf_offset).
 ecall (keccakf1600_avx2_h (Keccakf1600_Spec.keccak_f1600_op st{m})).
 wp; ecall (stavx2_unpack_at_h stavx2 buf buf_offset).
 ecall (keccakf1600_avx2_h st{m}).
 by auto => />.
wp; ecall {1} (stavx2_unpack_at_ph stavx2{1} buf{1} buf_offset{1}).
ecall {1} (keccakf1600_avx2_ph (Keccakf1600_Spec.keccak_f1600_op (Keccakf1600_Spec.keccak_f1600_op st{2}))).
wp; ecall {1} (stavx2_unpack_at_ph stavx2{1} buf{1} buf_offset{1}).
ecall {1} (keccakf1600_avx2_ph (Keccakf1600_Spec.keccak_f1600_op st{2})).
wp; ecall {1} (stavx2_unpack_at_ph stavx2{1} buf{1} buf_offset{1}).
ecall {1} (keccakf1600_avx2_ph st{2}).
auto => /> &1 &2 St0 s1 St1 buf _.
move=> /(stavx2_bytes_squeeze 0 _ _ _ St1) /= S1. 
move=> s2 St2 buf1 B12.
move=> /(stavx2_bytes_squeeze 168 _ _ _ St2) /= S2.
move=> s3 St3 buf2 B23 S3'; move: (S3').
move=> /(stavx2_bytes_squeeze 336 _ _ _ St3) /= S3.
rewrite /squeezestate_i !st_i_add //.
rewrite /st_i !iterS // iter0 // iter1 // /c256_r8.
rewrite -S1 -S2 -S3.
move: S3' B12 B23.
rewrite !sub2buf_subl 1..5:/# /= => S3' B12 B23.
rewrite -(buf_subl_cat _ _ 336) // -B23.
rewrite -(buf_subl_cat _ _ 168) // -B12 /=.
by rewrite S3' eq_sym; apply stmatch_avx2_bytes.
qed.

phoare sample_last _rho :
 [ Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_sample_one_polynomial :
   rho = _rho /\ rc = W16.of_int (2*256+2) ==> 
   res.`1 = subarray256 (subarray768 (unlift_matrix (sampleA _rho)) 2) 2 ] = 1%r.
proof.
conseq parse_one_polynomial_eq (sampleFilter_sem _rho (W8.of_int 2) (W8.of_int 2)).
 move => /> &1 ->.
 by exists (rho{1}, W8.of_int 2, W8.of_int 2).
move=> /> &1 ->.
rewrite -unlift_polyu_getm 1..2:/#.
rewrite /sampleA /=; congr.
by rewrite getmE getm_setE.
qed.

op pack4poly ['a] (ps: 'a Array256.t * 'a Array256.t * 'a Array256.t * 'a Array256.t) =
 Array1024.of_list witness (to_list ps.`1 ++ to_list ps.`2 ++ to_list ps.`3 ++ to_list ps.`4).

op buf_ok (buf: W8.t Array536.t) (l: W8.t list, st: state): bool =
 buf_subl buf 0 504 = l /\ sub buf 336 200 = state2bytes st.

lemma stx4_bytes_squeeze at st0 st1 st2 st3 stx4 (buf0 buf1 buf2 buf3: W8.t Array536.t):
  match_state4x st0 st1 st2 st3 stx4 =>
  sub buf0 at 200 = state2bytes st0 =>
  sub buf1 at 200 = state2bytes st1 =>
  sub buf2 at 200 = state2bytes st2 =>
  sub buf3 at 200 = state2bytes st3 =>
  (0 <= at && at < at + 200) && at + 200 <= 536 =>
  buf_subl buf0 at (at + 168) = squeezestate st0 168
  /\ buf_subl buf1 at (at + 168) = squeezestate st1 168
  /\ buf_subl buf2 at (at + 168) = squeezestate st2 168
  /\ buf_subl buf3 at (at + 168) = squeezestate st3 168.
proof.
move => Hm H0 H1 H2 H3 H.
rewrite /squeezestate -H0 -H1 -H2 -H3.
by rewrite !sub2buf_subl 1..4:/# !take_take !ifT /#.
qed.

lemma gen_matrix_indexesE pos tr:
 0 <= pos < 8 =>
 [ gen_matrix_indexes.[b2i tr * 8 + pos] \bits8 0
 ; gen_matrix_indexes.[b2i tr * 8 + pos] \bits8 1]
 = [(pos2ji pos tr).`1; (pos2ji pos tr).`2].
proof.
move => Hpos.
have: pos \in iotared 0 8 by smt().
move: {Hpos} pos; apply /List.allP => /=.
elim: tr; rewrite ?b2i1 ?b2i0 /pos2ji !bits8E /=.
 by do split; rewrite -all_eqP /all_eq //= !of_intwE //=.
by do split; rewrite -all_eqP /all_eq //= !of_intwE //=.
qed.

equiv sample_four_polynomials_eq:
 Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_sample_four_polynomials
 ~  ParseFilter.sample3buf_x4'
 : ={rho} /\ to_uint mat_entry{1} = pos{2} /\ to_uint transposed{1} = b2i t{2} /\ (pos{2}=0 \/ pos{2}=4)
   ==>
  res{1}.`1 = pack4poly (unlift_polyu res{2}.`1, unlift_polyu res{2}.`2, unlift_polyu res{2}.`3, unlift_polyu res{2}.`4).
proof.
transitivity ParseFilter.sample3buf_x4
 (={rho} /\ to_uint mat_entry{1} = pos{2} /\ to_uint transposed{1} = b2i t{2} /\ (pos{2}=0 \/ pos{2}=4)
 ==> res{1}.`1 = pack4poly (unlift_polyu res{2}.`1, unlift_polyu res{2}.`2, unlift_polyu res{2}.`3, unlift_polyu res{2}.`4))
 (={arg} ==> ={res}); last first.
+ by apply sampleX4_sample3buf_4x.
+ move=> /> &1 &2 -> *.
  by exists (rho{2},pos{2},t{2}) => /#.
+ by move => />.
proc; simplify.
seq 9 27: ( buf_ok buf0{1} buf0{2} st0{2}
          /\ buf_ok buf1{1} buf1{2} st1{2}
          /\ buf_ok buf2{1} buf2{2} st2{2}
          /\ buf_ok buf3{1} buf3{2} st3{2} ).
 seq 7 7: ( match_state4x st0{2} st1{2} st2{2} st3{2} stx4{1} ).
  wp; ecall {1} (xof_init_x4_ph rho{1} indexes{1}).
  inline*; auto => /> &1 &2 Ht Hpos stavx.
  rewrite to_uintD to_uint_shl !of_uintK 1:/# !modz_small 1..15:/# Ht /= addzC -!addzA.
  by rewrite !gen_matrix_indexesE; auto => /#.
 rcondt {1} 2; first by auto.
 seq 4 4: ( buf_offset{1} = W64.of_int 168
          /\ match_state4x st0{2} st1{2} st2{2} st3{2} stx4{1}
          /\ buf_subl buf0{1} 0 168 = buf0{2}
          /\ buf_subl buf1{1} 0 168 = buf1{2}
          /\ buf_subl buf2{1} 0 168 = buf2{2}
          /\ buf_subl buf3{1} 0 168 = buf3{2} ).
  sp 0 4; elim* => _st3 _st2 _st1 _st0; simplify.
  wp; ecall{1} (st4x_unpack_at_ph st0{2} st1{2} st2{2} st3{2} buf0{1} buf1{1} buf2{1} buf3{1} buf_offset{1}).
  ecall{1} (keccakf1600_4x_ph stx4{1}).
  auto => /> &1 &2; rewrite /st_i !iter1; split.
   by apply stx4_map_keccakf.
  move=> Hst [b0 b1 b2 b3] _ _ _ _ /= H0 H1 H2 H3.
  smt(stx4_bytes_squeeze iter1).
 rcondt {1} 1; first by auto.
 seq 3 8: ( buf_offset{1} = W64.of_int (2*168)
          /\ match_state4x st0{2} st1{2} st2{2} st3{2} stx4{1}
          /\ buf_subl buf0{1} 0 (2*168) = buf0{2}
          /\ buf_subl buf1{1} 0 (2*168) = buf1{2}
          /\ buf_subl buf2{1} 0 (2*168) = buf2{2}
          /\ buf_subl buf3{1} 0 (2*168) = buf3{2} ).
  sp 0 8; elim* => _buf3 _st3 _buf2 _st2 _buf1 _st1 _buf0 _st0; simplify.
  wp; ecall{1} (st4x_unpack_at_ph st0{2} st1{2} st2{2} st3{2} buf0{1} buf1{1} buf2{1} buf3{1} buf_offset{1}).
  ecall{1} (keccakf1600_4x_ph stx4{1}).
  auto => /> &1 &2; rewrite /st_i !iter1; split.
   by apply stx4_map_keccakf.
  move=> Hst1 [b0 b1 b2 b3] /= Hb0 Hb1 Hb2 Hb3 /= H0 H1 H2 H3.
  rewrite -!(buf_subl_cat _ 0 168 336) //.
  rewrite !(buf_sublE _ 0 168) //.
  smt(stx4_bytes_squeeze iter1).
 rcondt {1} 1; first by auto.
 seq 3 8: ( buf_offset{1} = W64.of_int (3*168)
          /\ buf_ok buf0{1} buf0{2} st0{2}
          /\ buf_ok buf1{1} buf1{2} st1{2}
          /\ buf_ok buf2{1} buf2{2} st2{2}
          /\ buf_ok buf3{1} buf3{2} st3{2} ).
  sp 0 8; elim* => _buf3 _st3 _buf2 _st2 _buf1 _st1 _buf0 _st0; simplify.
  wp; ecall{1} (st4x_unpack_at_ph st0{2} st1{2} st2{2} st3{2} buf0{1} buf1{1} buf2{1} buf3{1} buf_offset{1}).
  ecall{1} (keccakf1600_4x_ph stx4{1}).
  auto => /> &1 &2; rewrite /st_i !iter1; split.
   by apply stx4_map_keccakf.
  move=> Hst1 [b0 b1 b2 b3] /= Hb0 Hb1 Hb2 Hb3 /= H0 H1 H2 H3.
  rewrite -!(buf_subl_cat _ 0 336 504) //.
  rewrite !(buf_sublE _ 0 336) //.
  smt(stx4_bytes_squeeze iter1).
 rcondf {1} 1; first by auto.
 by auto => />.
wp; call fill_poly_eq.
wp; call fill_poly_eq.
wp; call fill_poly_eq.
wp; call fill_poly_eq.
auto => /> &1 &2 Hst0 Hst1 Hst2 Hst3.
move=> [p0 buf0] p0R /= Hp0.
move=> [p1 buf1] p1R /= Hp1.
move=> [p2 buf2] p2R /= Hp2.
move=> [p3 buf3] p3R /= Hp3.
rewrite /pack4poly /=.
apply Array1024.ext_eq => i Hi.
rewrite initiE //= get_of_list //=.
case: (i < 256) => C0.
 rewrite ifF 1:/# initiE //=. 
 rewrite ifF 1:/# initiE //=. 
 rewrite ifF 1:/# initiE //=.
 rewrite ifT 1:/# Hp0 initiE 1:/# /=.
 rewrite -!catA nth_cat ifT. 
  by rewrite !size_to_list /#.
 by rewrite get_to_list initiE 1:/#.
case: (i < 512) => C1.
 rewrite ifF 1:/# initiE //=. 
 rewrite ifF 1:/# initiE //=.
 rewrite ifT 1:/# Hp1 initiE 1:/# /=.
 rewrite -!catA nth_cat ifF. 
  by rewrite !size_to_list /#.
 rewrite nth_cat ifT !size_to_list 1:/#. 
 by rewrite get_to_list initiE 1:/#.
case: (i < 768) => C2.
 rewrite ifF 1:/# initiE //=.
 rewrite ifT 1:/# Hp2 initiE 1:/# /=.
 rewrite -!catA nth_cat ifF !size_to_list 1:/#. 
 rewrite nth_cat ifF !size_to_list 1:/#. 
 rewrite nth_cat ifT.
  by rewrite !size_to_list /#.
 by rewrite get_to_list initiE 1:/#.
rewrite ifT 1:/# Hp3 initiE 1:/# /=.
rewrite -!catA nth_cat ifF !size_to_list 1:/#. 
rewrite nth_cat ifF !size_to_list 1:/#. 
rewrite nth_cat ifF !size_to_list 1:/#. 
by rewrite get_to_list initiE 1:/#.
qed.

op subarray1024 ['a] (x : 'a Array2304.t) (i : int) : 'a Array1024.t = 
        Array1024.init (fun (k : int) => x.[1024 * i + k]).


op mat4atPos (m: polymat) pos =
 ( m.[idx_from_pos pos]
 , m.[idx_from_pos (pos+1)]
 , m.[idx_from_pos (pos+2)]
 , m.[idx_from_pos (pos+3)])%KMatrix.Matrix.

lemma sample3buf_4x_ph _rho _pos _t:
 0 <= _pos <= 3*3 - 4 =>
 phoare [ ParseFilter.sample3buf_x4'
        :  rho=_rho /\ pos = _pos /\ t = _t
           ==>
           res = mat4atPos (if _t then trmx (sampleA _rho) else sampleA _rho) _pos ]
 = 1%r.
proof.
move=> Hpos.
proc; simplify.
call (sampleFilter_sem _rho (pos2ji (_pos+3) _t).`1 (pos2ji (_pos+3) _t).`2).
wp; call (sampleFilter_sem _rho (pos2ji (_pos+2) _t).`1 (pos2ji (_pos+2) _t).`2).
wp; call (sampleFilter_sem _rho (pos2ji (_pos+1) _t).`1 (pos2ji (_pos+1) _t).`2).
wp; call (sampleFilter_sem _rho (pos2ji _pos _t).`1 (pos2ji _pos _t).`2).
auto => />.
rewrite /sampleA /mat4atPos /pos2ji /idx_from_pos /=.
have: _pos \in iota_ 0 (9-3). rewrite -iotaredE /= /#.
clear Hpos; move: _pos.
apply/List.allP.
case: _t => ?.
 by rewrite -iotaredE /= !trmxE !getm_setE //=.
by rewrite -iotaredE /= !getm_setE //=.
qed.

lemma pack4poly_subarray1024 (A: polymat) p:
 0 <= p < 2 =>
 pack4poly ( unlift_polyu (mat4atPos A (4*p)).`1
           , unlift_polyu (mat4atPos A (4*p)).`2
           , unlift_polyu (mat4atPos A (4*p)).`3
           , unlift_polyu (mat4atPos A (4*p)).`4
           )
 = subarray1024 (unlift_matrix A) p.
proof.
move=> Hp; apply Array1024.ext_eq => i Hi.
rewrite initiE 1:/# initiE 1:/# /=.
rewrite initiE 1:/# /=.
rewrite -!catA nth_cat size_to_list /=.
case: (i < 256) => Hi1.
 rewrite initiE 1:/# /= /mat4atPos /=.
 by congr; congr; congr; smt().
rewrite nth_cat size_to_list /=.
case: (i-256 < 256) => Hi2.
 rewrite initiE 1:/# /= /mat4atPos /=.
 by congr; congr; congr; smt().
rewrite nth_cat size_to_list /=.
case: (i-512 < 256) => Hi3.
 rewrite initiE 1:/# /= /mat4atPos /=.
 by congr; congr; congr; smt().
rewrite initiE 1:/# /= /mat4atPos /=.
by congr; congr; congr; smt().
qed.

lemma sample_four _sd _rc b :
 (_rc = 0 \/ _rc = 4) =>
 phoare
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_sample_four_polynomials :
   rho = _sd /\ mat_entry = W64.of_int _rc /\ transposed = W64.of_int (b2i b) ==> 
   res.`1 = subarray1024 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) (_rc %/ 3) ] = 1%r.
proof.
move=> Hrc.
conseq sample_four_polynomials_eq  (sample3buf_4x_ph _sd _rc b _).
+ move => &1 /> -> ->.
  exists (rho{1},_rc,b) => /=.
  by rewrite !of_uintK /#.
+ move=> /> &1 ->.
  by rewrite -pack4poly_subarray1024 /#.
smt().
qed.

phoare _gen_matrix_avx2_sem _sd b :
 [  Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_avx2 : arg.`2 = _sd /\ arg.`3 = W64.of_int (b2i b)
                                         ==> res = if b 
                                             then nttunpackm (unlift_matrix (trmx (sampleA _sd))) 
                                             else nttunpackm (unlift_matrix (sampleA _sd)) ] = 1%r.
proof.
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

wp 21.
conseq (_:  (forall kk, 0 <= kk < 3 =>  subarray768 matrix kk = (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))).
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

unroll for 16.
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
