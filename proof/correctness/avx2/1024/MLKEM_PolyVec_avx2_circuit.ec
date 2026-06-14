require import AllCore List Int IntDiv CoreMap Real Number Ring StdOrder BitEncoding.

from Jasmin require import JModel.
from JazzEC require import Array2304 Array1568 Array1536 Array1410 Array1408 Array1152 Array1088 Array1024 Array960 Array768 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array8 Array4 Array2.
from JazzEC require import WArray2048 WArray1568 WArray1536 WArray1410 WArray1152 WArray960 WArray512 WArray384 WArray160 WArray128 WArray32 WArray16.
from JazzEC require import Jkem_avx2.

require import AVX2_Ops W16extra.
require import Fq NTT_Fq MLKEMFCLib MLKEM_W16_Rep MLKEM1024_prelude.
require import Fq_avx2 NTT_avx2 NTT_avx2_poly AVX2_Ops MLKEMFCLib.
require import MLKEM_Poly_avx2 MLKEM_PolyVec_avx2.
require import MLKEM_Poly_avx2_circuit MLKEM_Poly_avx2_circuit_1024.
require import Mlkem_bindings.
require import Circuit_semantics Circuit_sem_1024.
from Spec require import GFq Rq Serialization VecMat Sampling EncDecCorrectness Correctness.

import BitChunking BS2Int.
import Fq.
import GFq Rq Serialization VecMat.
import Zq ZModP.
import Fq_avx2 NTT_Avx2.
import MLKEMFCLib1024.
import MLKEM_PolyAVX MLKEM_PolyvecAVX MLKEM_PolyAVXVec.
import PolyVec PolyMat.
import W12.

abbrev encode11_vec (a : ipolyvec) : W8.t Array1408.t = Array1408.of_list W8.zero (ByteEncode 11 (to_list a)).


lemma polyvec_csubq_avx2_ll :
   islossless Jkem_avx2.M.__polyvec_csubq.
by proc;inline *;do 5!(unroll for ^while);auto.
qed.

lemma polyvec_csubq_avx2_corr_h (_aw : W16.t Array1024.t):
    hoare[ Jkem_avx2.M.__polyvec_csubq  :
             r = _aw /\
             pos_bound1024_cxq r 0 1024 2 ==> 
             lift_array1024 res = lift_array1024 _aw /\
             pos_bound1024_cxq res 0 1024 1]. 
proof.
proc; inline *.
proc change ^while.1: {rp <- init_256_16 (fun i0 => r.[256*i+i0]);};1: by auto.
proc change ^while.2: {qx16 <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change ^while.^while.1: {r0 <- sliceget256_16_256 rp (i0*256);};1: by auto => /#.
proc change ^while.^while.9: {rp <- sliceset256_16_256 rp (i0*256) r0;};1: by auto => /#.
proc change ^while.6: {r <- init_1024_16 (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux.[i_0 - 256 * i] else r.[i_0]);};1: by auto. 

do 5!(unroll for ^while).
cfold ^i0<-.
wp -2.

conseq (: r = _aw /\ all (fun c => W16.zero \sle c && c \slt W16.of_int 6658) r ==>
       r = init_1024_16 (fun i => csubq_circuit _aw.[i])); last by circuit.

       
(* BDEP pre conseq *)
+ move => &hr />. rewrite /pos_bound1024_cxq /bpos16 qE /= => H.
  rewrite /(\slt) /(\sle) /= /smod /= allP /=.
  by exact H.

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= ->; rewrite /pos_bound256_cxq => Hb rr; rewrite /init_1024_16 /lift_array1024 /= => ->; split.

rewrite tP => i ib.
rewrite !mapiE 1,2:/# /= initiE 1:/# /=.
rewrite /csubq_circuit ultE /W16_sub /=.
move : (Hb i ib);rewrite /bpos16 qE /= /to_sint /smod /=.
case (to_uint _aw.[i] < 3329) => *//;1:
have ->/= : !32768 <= to_uint _aw.[i] by smt(W16.to_uint_cmp).
rewrite to_uintB /=;1: by rewrite uleE => /#.
have ->/= : !32768 <= to_uint _aw.[i] - 3329;  by smt(W16.to_uint_cmp).

move => i ib.
rewrite initiE 1:/# /= /csubq_circuit ultE /W16_sub /=.
move : (Hb i ib);rewrite /bpos16 qE /= /to_sint /smod /=.
case (to_uint _aw.[i] < 3329) => *//;1:
have ->/= : !32768 <= to_uint _aw.[i] by smt(W16.to_uint_cmp).
by smt(W16.to_uint_cmp).
rewrite to_uintB /=;1: by rewrite uleE => /#.
have ->/= : !32768 <= to_uint _aw.[i] - 3329;  by smt(W16.to_uint_cmp).
qed.


lemma polyvec_csubq_avx2_corr (_aw : W16.t Array1024.t):
    phoare[ Jkem_avx2.M.__polyvec_csubq  :
             r = _aw /\
             pos_bound1024_cxq r 0 1024 2 ==> 
             lift_array1024 res = lift_array1024 _aw /\
             pos_bound1024_cxq res 0 1024 1] = 1%r
  by conseq polyvec_csubq_avx2_ll (polyvec_csubq_avx2_corr_h _aw).



(********** END BDEP PROOF OF CSUBQ **************)


lemma polyvec_decompress_ll :
   islossless Jkem_avx2.M.__i_polyvec_decompress.
by proc;inline *;unroll for ^while; do 4!(cfold ^inc<-; unroll for ^while);auto.
qed.
(********** BEGIN BDEP PROOF OF DECOMPRESS **************)

lemma polyvec_decompress_corr_h (_aw : W8.t Array1408.t):
    hoare[ Jkem_avx2.M.__i_polyvec_decompress :
             Array1408.init (fun i => rp.[i]) = _aw ==> pos_bound1024_cxq res 0 1024 1 /\ lift_polyvec res = decompress_polyvec 11 (decode11_vec _aw)].
proc; inline *.
proc change 1: { q <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change 2: { shufbidx <- sliceget32_8_256 pvd_shufbidx_s 0;}; 1: by auto.
proc change 3: { srlvdidx <- sliceget8_32_256 pvd_srlvdidx_s 0;}; 1: by auto.
proc change 4: { srlvqidx <- sliceget4_64_256 pvd_srlvqidx_s 0;} ; 1: by auto.
proc change 5: { shift <- sliceget16_16_256 pvd_shift_s 0;}; 1: by auto.
proc change ^while.^while.1 : {f <- sliceget1568_8_256 rp ((352*k + 22*i)*8);}; 1: by auto => /> /#.
proc change ^while.^while.10 : {r <- sliceset1024_16_256 r ((16 * k + i)*256) f;}; 1: by auto => /> /#.
unroll for ^while.
cfold ^inc<-.
do 4!(unroll for ^while).
cfold ^i<-.
wp -3.

conseq (: rp = init_1568_8 (fun i => if i < 1408 then _aw.[i] else rp.[i])
        ==>
   r = init_1024_16 (fun i =>
     decompress11_circuit (W11.init (fun (j : int) => _aw.[(i*11 + j) %/ 8].[(i*11 + j) %% 8]))));last by circuit.
     
(* We start with some boilerplate *)
move => &hr /=;rewrite !tP  => H i ib.
by rewrite initE ib /=; case (i < 1408) => // ?; rewrite -H 1:/# initiE 1:/#.

move => &hr <- rr ->; split; last first.
+ rewrite KVec.tP => k kb.
  rewrite tP => i ib.
  rewrite /lift_polyvec /init_1024_16 KVec.initiE 1:/# /= !mapiE 1:/# /= -get_to_list /= initiE 1:/# /= initiE 1:/# /=.
  rewrite initiE; 1: by smt(kvec_val).
  simplify.
  rewrite mapiE 1:/#.
  rewrite /subarray256 initiE 1:/#.
  simplify.
  rewrite decompress11_circuit_sem; 1: by smt(kvec_val).
  done.

  
rewrite /pos_bound1024_cxq qE /= => k kb. 
rewrite /init_1024_16 initiE 1:/# /=.
by apply decompress11_circuit_rng.
qed.


lemma polyvec_decompress_corr (_aw : W8.t Array1408.t):
    phoare[ Jkem_avx2.M.__i_polyvec_decompress :
             Array1408.init (fun i => rp.[i]) = _aw ==> pos_bound1024_cxq res 0 1024 1 /\ lift_polyvec res = decompress_polyvec 11 (decode11_vec _aw)] = 1%r
 by conseq polyvec_decompress_ll (polyvec_decompress_corr_h _aw).

(********** BEGIN BDEP PROOF OF COMPRESS  **************)

module AuxCompress11 = {
 proc __i_polyvec_compress(rp : W8.t Array1410.t, a : W16.t Array1024.t) : W8.t Array1410.t = {
    var inc : int;
    var v : W256.t;
    var v8 : W256.t;
    var off : W256.t;
    var shift1 : W256.t;
    var mask : W256.t;
    var shift2 : W256.t;
    var sllvdidx : W256.t;
    var srlvqidx : W256.t;
    var shufbidx : W256.t;
    var i : int;
    var f0 : W256.t;
    var f1 : W256.t;
    var f2 : W256.t;
    var t0 : W128.t;
    var t1 : W128.t;
    
    a <@ M.__polyvec_csubq(a);
    v <- get256 (WArray32.init16 (fun (i_0 : int) => jvx16.[i_0])) 0;
    v8 <- VPSLL_16u16 v (W128.of_int 3);
    off <- VPBROADCAST_16u16 pvc_off_s;
    shift1 <- VPBROADCAST_16u16 pvc_shift1_s;
    mask <- VPBROADCAST_16u16 pvc_mask_s;
    shift2 <- VPBROADCAST_4u64 pvc_shift2_s;
    sllvdidx <- VPBROADCAST_4u64 pvc_sllvdidx_s;
    srlvqidx <- get256 (WArray32.init64 (fun (i_0 : int) => pvc_srlvqidx.[i_0])) 0;
    shufbidx <- get256 (WArray32.init8 (fun (i_0 : int) => pvc_shufbidx_s.[i_0])) 0;
    inc <- 4 * 256 %/ 16;
    i <- 0;
    while (i < inc){
      f0 <- get256 (WArray2048.init16 (fun (i_0 : int) => a.[i_0])) i;
      f1 <- VPMULL_16u16 f0 v8;
      f2 <- VPADD_16u16 f0 off;
      f0 <- VPSLL_16u16 f0 (W128.of_int 3);
      f0 <- VPMULH_16u16 f0 v;
      f2 <- VPSUB_16u16 f1 f2;
      f1 <- invw f1 `&` f2;
      f1 <- VPSRL_16u16 f1 (W128.of_int 15);
      f0 <- VPSUB_16u16 f0 f1;
      f0 <- VPMULHRS_16u16 f0 shift1;
      f0 <- f0 `&` mask;
      f2 <- VPBROADCAST_8u32 keepodd11;
      f1 <- VPAND_256 f0 f2;
      f2 <- VPBROADCAST_8u32 keepeven11;
      f0 <- VPAND_256 f0 f2;
      f1 <- VPSRL_8u32 f1  (W128.of_int 5);
      f0 <- VPOR_256 f0 f1;
      f0 <- VPSLLV_8u32 f0 sllvdidx;
      f1 <- VPSRLDQ_256 f0 (W8.of_int 8);
      f0 <- VPSRLV_4u64 f0 srlvqidx;
      f1 <- VPSLL_4u64 f1 (W128.of_int 34);
      f0 <- f0 `|` f1;
      f0 <- VPSHUFB_256 f0 shufbidx;
      t0 <- truncateu128 f0;
      t1 <- VEXTRACTI128 f0 W8.one;
      t0 <- BLENDV_16u8 t0 t1 (truncateu128 shufbidx);
      rp <- Array1410.init (get8 (set128_direct (WArray1410.init8 (fun (i_0 : int) => rp.[i_0])) (22 * i) t0));
      rp <-
        Array1410.init
          (get8 (set64_direct (WArray1410.init8 (fun (i_0 : int) => rp.[i_0])) (22 * i + 16) (truncateu64 t1)));
      i <- i + 1;
    }
    
    return rp;
  }
}.

lemma auxcompress11_ll : islossless AuxCompress11.__i_polyvec_compress.
proc. cfold 11. unroll for ^while; wp => /=. 
inline *;unroll for ^while; do 4!(unroll for ^while);auto.
qed.




lemma auxcompress11_corr_h (_aw : W16.t Array1024.t):
    hoare[ AuxCompress11.__i_polyvec_compress  :
             a = _aw /\
             pos_bound1024_cxq a 0 1024 2 ==> 
      Array1408.init (fun i => res.[i])  = encode11_vec (compress_polyvec 11 (lift_polyvec _aw))].
proof.
proc; inline *.
proc change ^while.1: { rp0 <- init_256_16 (fun i => r.[256*i0+i]);};1: by auto.
proc change ^while.2: { qx16 <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change ^while.^while.1: { r0 <- sliceget256_16_256 rp0 (i1*256);};1: by auto => /#.
proc change ^while.^while.9: { rp0 <- sliceset256_16_256 rp0 (i1*256) r0;};1: by auto => /#.
proc change ^while.6: { r <- init_1024_16 (fun (i_0 : int) => if 256 * i0 <= i_0 < 256 * i0 + 256 then aux.[i_0 - 256 * i0] else r.[i_0]);};1: by auto. 
proc change 5: {v <- sliceget16_16_256 jvx16 0;}; 1: by auto.
proc change ^while{2}.1: {f0 <- sliceget1024_16_256 a (i*256);};1: by auto => /#.
proc change 12: { srlvqidx <- sliceget4_64_256 pvc_srlvqidx 0; }; 1: by auto.
proc change 13: { shufbidx <- sliceget32_8_256 pvc_shufbidx_s 0;}; 1: by auto.
proc change ^while{2}.27 : {rp <- sliceset1410_8_128 rp  (22*i*8) t0;};1: by auto => /#.
proc change ^while{2}.28 : {rp <- sliceset1410_8_64 rp  ((22*i+16)*8) (truncateu64 t1);}.
+ auto => />;move => *;rewrite /sliceset1410_8_64 tP => *.
  rewrite initiE /= 1:/# ifT 1:/# initiE 1:/#.
  do congr;smt().
  
unroll for ^while.
do 4!(unroll for ^while).
cfold ^inc<-.
unroll for ^while.
cfold ^i0<-. 
cfold ^i1<-. 
wp -4. 

conseq (: a = _aw /\
   Array1024.all (fun bv => W16.zero \sle bv /\ bv \sle (of_int (2 * 3329))) a
   ==> init_1408_8 (fun i => rp.[i]) = 
   let out = init_1024_11 (fun i => compress11_circuit _aw.[i]) in
   init_1408_8 (fun i =>
     W8.init (fun j =>
       (out.[(i*8+j) %/ 11]).[(i*8+j) %% 11]))); last by circuit.

      
(* BDEP pre conseq *)
+ move => &hr />; rewrite /pos_bound1024_cxq qE /= /(\sle) /(\slt) allP /=  => Hb i ib /=.
  rewrite /(to_sint W16.zero) /= /(W16.smod 0) /=.
  rewrite /(to_sint (W16.of_int 6658)) /= /(W16.smod 6658) /= /#.
  
(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= -> H0 rr; rewrite /= /init_1408_8 !tP => H i ib.
rewrite H // initiE 1:/# /=.
rewrite wordP => k kb; rewrite !initiE /= 1,2:/#.
rewrite encode_vec_compress_bits //=.
rewrite initiE 1:/# /=.
by apply compress11_circuit_sem.
qed.

(********** END BDEP PROOF OF COMPRESS **************)

lemma auxcompress11_corr (_aw : W16.t Array1024.t):
    phoare[ AuxCompress11.__i_polyvec_compress  :
             a = _aw /\
             pos_bound1024_cxq a 0 1024 2 ==> 
      Array1408.init (fun i => res.[i])  = encode11_vec (compress_polyvec 11 (lift_polyvec _aw))] = 1%r 
  by conseq auxcompress11_ll (auxcompress11_corr_h _aw).


lemma polyvec_compress_avx2_ll : islossless Jkem_avx2.M.__i_polyvec_compress.
proc. cfold 11. unroll for ^while; wp => /=. 
inline *;unroll for ^while; do 4!(unroll for ^while);auto.
qed.

lemma polyvec_compress_avx2_corr (_aw : W16.t Array1024.t):
    phoare[ Jkem_avx2.M.__i_polyvec_compress  :
             a = _aw /\
             pos_bound1024_cxq a 0 1024 2 ==> 
      Array1408.init (fun i => res.[i])  = encode11_vec (compress_polyvec 11 (lift_polyvec _aw))] = 1%r.
bypr => &m [->?].
have <- : Pr[ AuxCompress11.__i_polyvec_compress(rp{m}, _aw) @ &m :
   Array1408.init (fun (i : int) => res.[i]) = encode11_vec (compress_polyvec 11 (lift_polyvec _aw))] = 1%r
   by byphoare (auxcompress11_corr _aw)  =>/=;1:smt().
byequiv (: ={arg} /\ a{1} = _aw /\
             pos_bound1024_cxq a{1} 0 1024 2 ==> ={res}) => //.
proc. 
seq 1 1 : (={rp,a} /\ pos_bound1024_cxq a{1} 0 1024 1).
+ ecall {1} (polyvec_csubq_avx2_corr a{1}). 
  ecall {2} (polyvec_csubq_avx2_corr a{2}). 
  auto => />; rewrite /pos_bound1024_cxq /lift_array1024 /= qE /= => ? rr1.
  rewrite !tP;move =>  Hrr11 Hrr12 rr2.
  rewrite !tP;move =>  Hrr21 Hrr22.
  move => i ib. 
  have := Hrr11 i ib; rewrite !mapiE 1,2:/# /=. 
  have := Hrr12 i ib.  
  have := Hrr21 i ib; rewrite !mapiE 1,2:/# /=. 
  have := Hrr22 i ib.  
  rewrite /to_sint /smod /=. 
  move => Hrr11i Hrr12i Hrr21i Hrr22i.
  have Hn1 : !(32768 <= to_uint rr2.[i]) by smt(W16.to_uint_cmp pow2_16).
  have Hn2 : !(32768 <= to_uint rr1.[i]) by smt(W16.to_uint_cmp pow2_16).
  have Hn3 : !(32768 <= to_uint _aw.[i]) by smt(W16.to_uint_cmp pow2_16).
  move : Hrr11i Hrr12i Hrr21i Hrr22i; rewrite Hn1 Hn2 Hn3 /=.
  move => Hrr11i Hrr12i Hrr21i Hrr22i.
  move : Hrr12i; rewrite -Hrr22i -eq_incoeff.  
  by rewrite !modz_small ?qE /= 1,2:/# to_uint_eq /#.

cfold {1} ^inc<-. 
cfold {2} ^inc<-. 
sp 9 9.
wp;while (#pre /\ ={i} /\ 0 <= i{1} <=64); last by auto.
wp -1 -1; conseq (: _ ==> ={rp}); 1: by auto => /#.
sim;conseq />.
seq 10 10 : (#pre /\ ={f0}); 1: by conseq />;sim.
auto => /> &1;rewrite vpmaddwd_alt_corr; last by rewrite /VPMADDWD_alt /=.
move => i ib /=; rewrite /VPBROADCAST_16u16 /=.
rewrite Montgomery16.bits16_W16u16 ib /= get_of_list 1:/# /= (nth_map witness) /=;1:smt(size_iota).
have -> : 2047 = 2^11 -1 by auto.
rewrite and_mod 1:/# /= /smod /= /#.
qed.

lemma polyvec_frombytes_ll : islossless Jkem_avx2.M.__i_polyvec_frombytes.
proc; inline *;wp. 
  while (0 <= i <= 4) (4-i); last by  auto =>  /> /#.
move => *. cfold 3. unroll for ^while;auto => /> /#.
qed.


op nttunpack_16 (rp : W16.t Array256.t) : W16.t Array256.t = init_256_16 (fun (i : int) => rp.[nttunpack_idx.[i]]).

op subarray256 (x: W16.t Array1024.t) (i: int) = init_256_16 (fun j => x.[256*i + j]).


op nttunpackv_16 (v : W16.t Array1024.t) : W16.t Array1024.t =
  init_1024_16
    (fun (i : int) =>
       if 0 <= i < 256 then (nttunpack_16 (subarray256 v 0)).[i]
       else
         if 256 <= i < 512 then (nttunpack_16 (subarray256 v 1)).[i - 256]
         else if 512 <= i < 768 then (nttunpack_16 (subarray256 v 2)).[i - 512] else (nttunpack_16 (subarray256 v 3)).[i - 768]). (* FIXME : 0 -> i - 768 *)

lemma nttunpackv_16E v: nttunpackv_16 v = nttunpackv v.
   rewrite /nttunpackv_16 /nttunpackv /nttunpack_16 /nttunpack.
   by rewrite /init_1024_16 /init_256_16.
   qed.

lemma polyvec_frombytes_corr_h (_aw : W8.t Array1536.t): 
    hoare [Jkem_avx2.M.__i_polyvec_frombytes  :
             a = _aw
              ==>
             lift_array1024 res = nttunpackv (map incoeff (Array1024.of_list 0 (ByteDecode 12 (to_list _aw))))  /\
             pos_bound1024_cxq res 0 1024  2].
proc; inline *.
proc change ^while.1: { rp <- init_256_16 (fun (i_0 : int) => r.[256 * i + i_0]); }; 1: by auto.
proc change ^while.2: { ap <- init_384_8 (fun (i_0 : int) => a.[384 * i + i_0]); }; 1: by auto.
proc change ^while.3: { mask <- sliceget16_16_256 maskx16 0; }; 1: by auto.
proc change ^while.^while.1 : { t0 <- sliceget384_8_256 ap (192*i0*8);}; 1: by auto => /> /#.
proc change ^while.^while.2 : { t1 <- sliceget384_8_256 ap ((192*i0+32)*8);}; 1: by auto => /> /#.
proc change ^while.^while.3 : { t2 <- sliceget384_8_256 ap ((192*i0+64)*8);}; 1: by auto => /> /#.
proc change ^while.^while.4 : { t3 <- sliceget384_8_256 ap ((192*i0+96)*8);}; 1: by auto => /> /#.
proc change ^while.^while.5 : { t4 <- sliceget384_8_256 ap ((192*i0+128)*8);}; 1: by auto => /> /#.
proc change ^while.^while.6 : { t5 <- sliceget384_8_256 ap ((192*i0+160)*8);}; 1: by auto => /> /#.
proc change ^while.^while.101 : { rp <- sliceset256_16_256 rp (8*i0 *256) t6;};1: by auto => /> /#.
proc change ^while.^while.102 : { rp <- sliceset256_16_256 rp ((8*i0+1) *256) t7;};1: by auto => /> /#.
proc change ^while.^while.103 : { rp <- sliceset256_16_256 rp ((8*i0+2) *256) t8;};1: by auto => /> /#.
proc change ^while.^while.104 : { rp <- sliceset256_16_256 rp ((8*i0+3) *256) t9;};1: by auto => /> /#.
proc change ^while.^while.105 : { rp <- sliceset256_16_256 rp ((8*i0+4) *256) t4;};1: by auto => /> /#.
proc change ^while.^while.106 : { rp <- sliceset256_16_256 rp ((8*i0+5) *256) t10;};1: by auto => /> /#.
proc change ^while.^while.107 : { rp <- sliceset256_16_256 rp ((8*i0+6) *256) t11;};1: by auto => /> /#.
proc change ^while.^while.108 : { rp <- sliceset256_16_256 rp ((8*i0+7) *256) tt;};1: by auto => /> /#.
proc change ^while.7: { r <- init_1024_16 (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux.[i_0 - 256 * i] else r.[i_0]);}; 1: by auto.

unroll for ^while.
do 4!(unroll for ^while).
cfold ^i0<-.
wp -2.

conseq (: _ ==> r = nttunpackv_16 (init_1024_16 (fun i =>
     frombytes_circuit (
       W12.init (fun j =>
         let idx = i*12 + j in
         let aidx = idx %/ 8 in
         let bidx = idx %% 8 in
         _aw.[aidx].[bidx]
       )
     )))); last by circuit. (* FIXME: TAKES TOO LONG circuit. *)

move => &hr <- rr ->.
rewrite nttunpackv_16E;split.
+ rewrite  -nttunpackv_lift /lift_array1024 /=; congr; apply Array1024.tP => i ib.
  rewrite mapiE 1:/# /init_1024_16 initiE 1:/#.
  simplify.
  rewrite frombytes_circuit_sem; 1: by smt().
  rewrite get_of_list; 1: by smt(kvec_val).
  rewrite get_of_list 1:/#.
  rewrite (nth_map 0).
  by rewrite /ByteDecode size_map size_chunk // size_BytesToBits size_to_list /#.
  done.

rewrite /pos_bound1024_cxq.
move => k kb.
have : Array1024.all (fun w => bpos16 w (2*q))
    (nttunpackv
       (init_1024_16
          (fun (i : int) =>
             frombytes_circuit
               (W12.init
                  (fun (j : int) =>
                     let idx = i * 12 + j in let aidx = idx %/ 8 in let bidx = idx %% 8 in a{hr}.[aidx].[bidx]))))); last first.
 + by rewrite allP => H; have /= := H k _;1:smt().
 
   
apply nttunpackv_pred.
rewrite allP => i ib; rewrite initiE 1:/# /= qE /=.
have := frombytes_circuit_rng a{hr} i.
smt().
qed.

(********** END BDEP PROOF OF FROMBYTES **************)

lemma polyvec_frombytes_corr (_aw : W8.t Array1536.t): 
    phoare [Jkem_avx2.M.__i_polyvec_frombytes  :
             a = _aw
              ==>
             lift_array1024 res = nttunpackv (map incoeff (Array1024.of_list 0 (ByteDecode 12 (to_list _aw))))  /\
             pos_bound1024_cxq res 0 1024  2] = 1%r
  by conseq polyvec_frombytes_ll (polyvec_frombytes_corr_h _aw).

op pcond_true (w: bool) =  true.

op pcond_reduced (w: W16.t) =   w \ult W16.of_int (2*3329).

lemma polyvec_tobytes_ll : islossless Jkem_avx2.M.__i_polyvec_tobytes.
proc.
inline *. 
do 9!(unroll for ^while); auto. 
qed.


abbrev mask12 = VPBROADCAST_16u16(W16.of_int 4095).

module AuxToBytes = {
proc __i_polyvec_tobytes(r : W8.t Array1536.t, a : W16.t Array1024.t) : W8.t Array1536.t = {
  var i,rp,a0,i0,t0,t1,t2,t3,t4,t5,t6,t7,tt,ttt,a1,b,t00,r00,t10,r1,a2,b0,t01,r01,t11,r10,a3,b1,t02,r02,t12,r11,a4,b2,t03,t13,a5,b3,t04,t14,a6,b4,t05,t15,a7,b5,r03,r12,a8,b6,r04,r13,a9,b7,r05,r14,a10,b8,r06,r15,a11,b9,r07,r16,a12,b10,r08,r17,aux,aux_0;
  i <- 0;                                                                                                                       
  while (i < 4) {                                                                                                              
    rp <- Array384.init (fun (i_0 : int) => r.[384 * i + i_0]);                                                                 
    a0 <- Array256.init (fun (i_0 : int) => a.[256 * i + i_0]);  
    a0 <@ Jkem_avx2.M._poly_csubq(a0);                                                           
    i0 <- 0;                                                                                                                    
    while (i0 < 2) {                                                                                                           
      t0 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0);                                                   
      t1 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 1);                                               
      t2 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 2);                                               
      t3 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 3);                                               
      t4 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 4);                                               
      t5 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 5);                                               
      t6 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 6);                                               
      t7 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 7);                                               
      t0 <- t0 `&` mask12;                                                                                                      
      t1 <- t1 `&` mask12;                                                                                                      
      t2 <- t2 `&` mask12;                                                                                                      
      t3 <- t3 `&` mask12;                                                                                                      
      t4 <- t4 `&` mask12;                                                                                                      
      t5 <- t5 `&` mask12;                                                                                                      
      t6 <- t6 `&` mask12;                                                                                                      
      t7 <- t7 `&` mask12;                                                                                                      
      tt <- VPSLL_16u16 t1 (W128.of_int 12);                                                                                    
      tt <- tt `|` t0;                                                                                                          
      t0 <- VPSRL_16u16 t1 (W128.of_int 4);                                                                                     
      t1 <- VPSLL_16u16 t2 (W128.of_int 8);                                                                                     
      t0 <- t0 `|` t1;                                                                                                          
      t1 <- VPSRL_16u16 t2 (W128.of_int 8);                                                                                     
      t2 <- VPSLL_16u16 t3 (W128.of_int 4);                                                                                     
      t1 <- t1 `|` t2;                                                                                                          
      t2 <- VPSLL_16u16 t5 (W128.of_int 12);                                                                                    
      t2 <- t2 `|` t4;                                                                                                          
      t3 <- VPSRL_16u16 t5 (W128.of_int 4);                                                                                     
      t4 <- VPSLL_16u16 t6 (W128.of_int 8);                                                                                     
      t3 <- t3 `|` t4;                                                                                                         
      t4 <- VPSRL_16u16 t6 (W128.of_int 8);                                                                                     
      t5 <- VPSLL_16u16 t7 (W128.of_int 4);                                                                                     
      t4 <- t4 `|` t5;                                                                                                          
      a1 <- tt;                                                                                                                 
      b <- t0;                                                                                                                  
      t00 <- VPSLL_8u32 b (W128.of_int 16);                                                                                     
      r00 <- VPBLENDW_256 a1 t00 (W8.of_int 170);                                                                               
      t10 <- VPSRL_8u32 a1 (W128.of_int 16);                                                                                    
      r1 <- VPBLENDW_256 t10 b (W8.of_int 170);                                                                                 
      (ttt, t0) <- (r00, r1);                                                                                                   
      a2 <- t1;                                                                                                                 
      b0 <- t2;                                                                                                                 
      t01 <- VPSLL_8u32 b0 (W128.of_int 16);                                                                                    
      r01 <- VPBLENDW_256 a2 t01 (W8.of_int 170);                                                                               
      t11 <- VPSRL_8u32 a2 (W128.of_int 16);                                                                                    
      r10 <- VPBLENDW_256 t11 b0 (W8.of_int 170);                                                                               
      (tt, t2) <- (r01, r10);                                                                                                   
      a3 <- t3;                                                                                                                 
      b1 <- t4;                                                                                                                
      t02 <- VPSLL_8u32 b1 (W128.of_int 16);                                                                                    
      r02 <- VPBLENDW_256 a3 t02 (W8.of_int 170);                                                                               
      t12 <- VPSRL_8u32 a3 (W128.of_int 16);                                                                                    
      r11 <- VPBLENDW_256 t12 b1 (W8.of_int 170);                                                                               
      (t1, t4) <- (r02, r11);                                                                                                   
      a4 <- ttt;                                                                                                               
      b2 <- tt;                                                                                                                 
      t03 <- VMOVSLDUP_256 b2;                                                                                                  
      t03 <- VPBLENDD_256 a4 t03 (W8.of_int 170);                                                                               
      a4 <- VPSRL_4u64 a4 (W128.of_int 32);                                                                                     
      t13 <- VPBLENDD_256 a4 b2 (W8.of_int 170);                                                                                
      (t3, tt) <- (t03, t13);                                                                                                   
      a5 <- t1;                                                                                                                 
      b3 <- t0;                                                                                                                 
      t04 <- VMOVSLDUP_256 b3;                                                                                                  
      t04 <- VPBLENDD_256 a5 t04 (W8.of_int 170);                                                                               
      a5 <- VPSRL_4u64 a5 (W128.of_int 32);                                                                                     
      t14 <- VPBLENDD_256 a5 b3 (W8.of_int 170);                                                                                
      (ttt, t0) <- (t04, t14);                                                                                                  
      a6 <- t2;                                                                                                                 
      b4 <- t4;                                                                                                                 
      t05 <- VMOVSLDUP_256 b4;                                                                                                  
      t05 <- VPBLENDD_256 a6 t05 (W8.of_int 170);                                                                               
      a6 <- VPSRL_4u64 a6 (W128.of_int 32);                                                                                     
      t15 <- VPBLENDD_256 a6 b4 (W8.of_int 170);                                                                                
      (t1, t4) <- (t05, t15);                                                                                                   
      a7 <- t3;                                                                                                                 
      b5 <- ttt;                                                                                                                
      r03 <- VPUNPCKL_4u64 a7 b5;                                                                                               
      r12 <- VPUNPCKH_4u64 a7 b5;                                                                                               
      (t2, ttt) <- (r03, r12);                                                                                                  
      a8 <- t1;                                                                                                                 
      b6 <- tt;                                                                                                                 
      r04 <- VPUNPCKL_4u64 a8 b6;                                                                                               
      r13 <- VPUNPCKH_4u64 a8 b6;                                                                                               
      (t3, tt) <- (r04, r13);                                                                                                   
      a9 <- t0;                                                                                                                 
      b7 <- t4;                                                                                                                 
      r05 <- VPUNPCKL_4u64 a9 b7;                                                                                               
      r14 <- VPUNPCKH_4u64 a9 b7;                                                                                               
      (t1, t4) <- (r05, r14);                                                                                                   
      a10 <- t2;                                                                                                                
      b8 <- t3;                                                                                                                 
      r06 <- VPERM2I128 a10 b8 (W8.of_int 32);                                                                                  
      r15 <- VPERM2I128 a10 b8 (W8.of_int 49);                                                                                  
      (t0, t3) <- (r06, r15);                                                                                                   
      a11 <- t1;                                                                                                                
      b9 <- ttt;                                                                                                                
      r07 <- VPERM2I128 a11 b9 (W8.of_int 32) ;                                                                                 
      r16 <- VPERM2I128 a11 b9 (W8.of_int 49) ;                                                                                 
      (t2, ttt) <- (r07, r16);                                                                                                  
      a12 <- tt;                                                                                                                
      b10 <- t4;                                                                                                                
      r08 <- VPERM2I128 a12 b10 (W8.of_int 32);                                                                                 
      r17 <- VPERM2I128 a12 b10 (W8.of_int 49);                                                                                 
      (t1, t4) <- (r08, r17);                                                                                                   
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0) t0));      
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 32) t2)); 
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 64) t1)); 
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 96) t3)); 
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (                    
                192 * i0 + 128) ttt));                                                                                          
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 160) t4));
      i0 <- i0 + 1;                                                                                                             
    }                                                                                                                          
    (aux, aux_0) <- (rp, a0);                                                                                                   
    r <- Array1536.init (fun (i_0 : int) => if 384 * i <= i_0 < 384 * i + 384 then aux.[i_0 - 384 * i] else r.[i_0]);           
    a <- Array1024.init (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux_0.[i_0 - 256 * i] else a.[i_0]);         
    i <- i + 1;                                                                                                                 
  }
  return r;
 }       
}.

op nttpack_16 (rp : W16.t Array256.t)  = init_256_16 (fun (i : int) => rp.[nttpack_idx.[i]]).

op nttpackv_16 (v : W16.t Array1024.t) =
  init_1024_16
    (fun (i : int) =>
       if 0 <= i < 256 then (nttpack_16 (subarray256 v 0)).[i]
       else
         if 256 <= i < 512 then (nttpack_16 (subarray256 v 1)).[i - 256]
         else if 512 <= i < 768 then (nttpack_16 (subarray256 v 2)).[i - 512] else (nttpack_16 (subarray256 v 3)).[i - 768]).

lemma nttpackv_16E v : nttpackv_16 v = nttpackv v.
rewrite /nttpackv_16 /init_1024_16 /nttpack_16 /init_256_16.
by rewrite /nttpackv /nttpack.
qed.

lemma auxtobytes_corr_h (_aw : W16.t Array1024.t):
    hoare[AuxToBytes.__i_polyvec_tobytes :
             pos_bound1024_cxq a 0 1024 2 /\ a = _aw ==> 
    res = Array1536.of_list W8.zero (ByteEncode 12 (to_list (map asint (lift_array1024 (nttpackv _aw)))))]. 
proc;inline *.
proc change ^while.1: {rp <- init_384_8 (fun i_0 => r.[384 * i + i_0]);};1: by auto.
proc change ^while.2: {a0 <- init_256_16 (fun i_0 => a.[256 * i + i_0]);};1: by auto.
(* FIXME: CHECK qx16 initialization inside while *)
proc change ^while.4: {qx16 <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change ^while.^while.1: { r0 <- sliceget256_16_256 rp0 (i1*256);}; 1: by auto => /#.
proc change ^while.^while.9 : {rp0 <- sliceset256_16_256 rp0 (i1*256) r0;}; 1: by auto => /> /#.
proc change ^while.^while{2}.1 : {t0 <- sliceget256_16_256 a0 (8*i0*256);};1: by auto => /#.
proc change ^while.^while{2}.2 : {t1 <- sliceget256_16_256 a0 ((8*i0+1)*256);};1: by auto => /#.
proc change ^while.^while{2}.3 : {t2 <- sliceget256_16_256 a0 ((8*i0+2)*256);};1: by auto => /#.
proc change ^while.^while{2}.4 : {t3 <- sliceget256_16_256 a0 ((8*i0+3)*256);};1: by auto => /#.
proc change ^while.^while{2}.5 : {t4 <- sliceget256_16_256 a0 ((8*i0+4)*256);};1: by auto => /#.
proc change ^while.^while{2}.6 : {t5 <- sliceget256_16_256 a0 ((8*i0+5)*256);};1: by auto => /#.
proc change ^while.^while{2}.7 : {t6 <- sliceget256_16_256 a0 ((8*i0+6)*256);};1: by auto => /#.
proc change ^while.^while{2}.8 : {t7 <- sliceget256_16_256 a0 ((8*i0+7)*256);};1: by auto => /#.
proc change ^while.^while{2}.105 : {rp <- sliceset384_8_256 rp (192*i0*8) t0;};1: by auto => /#.
proc change ^while.^while{2}.106 : {rp <- sliceset384_8_256 rp ((192*i0+32)*8) t2;};1: by auto => /#.
proc change ^while.^while{2}.107 : {rp <- sliceset384_8_256 rp ((192*i0+64)*8) t1;};1: by auto => /#.
proc change ^while.^while{2}.108 : {rp <- sliceset384_8_256 rp ((192*i0+96)*8) t3;};1: by auto => /#.
proc change ^while.^while{2}.109 : {rp <- sliceset384_8_256 rp ((192*i0+128)*8) ttt;};1: by auto => /#.
proc change ^while.^while{2}.110 : {rp <- sliceset384_8_256 rp ((192*i0+160)*8) t4;};1: by auto => /#.
proc change ^while.11: { r <- init_1536_8 (fun (i_0 : int) => if 384 * i <= i_0 < 384 * i + 384 then aux.[i_0 - 384 * i] else r.[i_0]);}; 1: by auto.
proc change ^while.12: { a <- init_1024_16  (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux_0.[i_0 - 256 * i] else a.[i_0]);};1: by auto. 

unroll for ^while.
do 8!(unroll for ^while).
cfold ^i<-.
cfold ^i0<-.
cfold ^i1<-.
wp -4.

conseq (: 
 a = _aw /\
   Array1024.all (fun bv => W16.zero \sle bv /\ bv \slt (of_int (2 * 3329))) a
   ==> r =  let ret = init_1024_12 (fun j => tobytes_circuit (nttpackv_16 _aw).[j]) in
  init_1536_8 (fun i =>
    W8.init (fun j =>
      let idx = i*8 + j in
      let aidx = idx %/ 12 in
      let bidx = idx %% 12 in
      W12."_.[_]" (ret.[aidx]) bidx))); last by circuit.
      
+ move => &hr />; rewrite allP /= /pos_bound1024_cxq /(\sle) /(\slt) /= /qE /smod /=.
  by rewrite qE /= => H k ?; move : (H k _) => //=.

move => &hr [#]/=; rewrite /pos_bound1024_cxq /bpos16 => H0 <- rr ->.
rewrite /init_1536_8 /encode12 tP => i ib.
rewrite initiE 1:/# /= get_of_list 1:/# /= wordP => k kb.
rewrite initiE //= /init_256_12 initiE 1:/# /=.
have := nttpackv_pred a{hr} (fun c => bpos16 c (2 * q)).
rewrite !allP  /= iffE qE /= => [#_ H].
by rewrite nttpackv_16E  to_bytes_circuit_sem_polyvec;1..3:
 by rewrite /(\ult) /=; smt(W16.to_sint_unsigned).
 qed.

lemma auxtobytes_ll : islossless AuxToBytes.__i_polyvec_tobytes.
proc.
inline *. 
do 9!(unroll for ^while); auto. 
qed.

lemma auxtobytes_corr (_aw : W16.t Array1024.t):
    phoare[ AuxToBytes.__i_polyvec_tobytes :
             pos_bound1024_cxq a 0 1024 2 /\ a = _aw ==> 
    res = Array1536.of_list W8.zero (ByteEncode 12 (to_list (map asint (lift_array1024 (nttpackv _aw)))))] = 1%r
  by conseq auxtobytes_ll (auxtobytes_corr_h _aw).


lemma polyvec_tobytes_corr (_aw : W16.t Array1024.t):
    phoare[ Jkem_avx2.M.__i_polyvec_tobytes :
             pos_bound1024_cxq a 0 1024 2 /\ a = _aw ==> 
    res = Array1536.of_list W8.zero (ByteEncode 12 (to_list (map asint (lift_array1024 (nttpackv _aw)))))] = 1%r.
proof.
bypr => &m [??].
have <- : Pr[AuxToBytes.__i_polyvec_tobytes(r{m}, _aw) @ &m : res = Array1536.of_list W8.zero (ByteEncode 12 (to_list (map asint (lift_array1024 (nttpackv _aw)))))] = 1%r
 by byphoare (auxtobytes_corr _aw)  =>/=; 1:smt().
byequiv (: ={arg} /\ a{1} = _aw /\
             pos_bound1024_cxq a{1} 0 1024 2 ==> ={res}) => //.
proc => /=. 
inline M._i_poly_tobytes.
while (={r, a,i} /\ 0 <= i{1} <= 4 /\
   pos_bound1024_cxq a{1} 0 1024 2); last by auto => /> /#.
seq 3 3 : (#pre /\ ={rp,a0} /\
   pos_bound256_cxq a0{1} 0 256 1).
+ ecall {1} (poly_csubq_avx2_corr a0{1}).
  ecall {2} (poly_csubq_avx2_corr a0{2}).
  auto => /> &1; rewrite /pos_bound1024_cxq /pos_bound256_cxq /lift_array256 /= qE /= => ????;split; 1: by smt(Array256.initiE).
  move => ? rr1.
  rewrite !tP;move =>  Hrr11 Hrr12 rr2.
  rewrite !tP;move =>  Hrr21 Hrr22.
  move => ii iib. 
  have := Hrr11 ii iib; rewrite !mapiE 1,2:/# /=. 
  have := Hrr12 ii iib.  
  have := Hrr21 ii iib; rewrite !mapiE 1,2:/# /=. 
  have := Hrr22 ii iib.  
  rewrite /to_sint /smod /=. 
  move => Hrr11i Hrr12i Hrr21i Hrr22i.
  have Hn1 : !(32768 <= to_uint rr2.[ii]) by smt(W16.to_uint_cmp pow2_16).
  have Hn2 : !(32768 <= to_uint rr1.[ii]) by smt(W16.to_uint_cmp pow2_16).
  have Hn3 : !(32768 <= to_uint _aw.[ii]) by smt(W16.to_uint_cmp pow2_16).
  move : Hrr11i Hrr12i Hrr21i Hrr22i; rewrite Hn1 Hn2 /=.
  move => Hrr11i Hrr12i Hrr21i Hrr22i.
  move : Hrr12i; rewrite -Hrr22i -eq_incoeff.  
  by rewrite !modz_small ?qE /= 1,2:/# to_uint_eq /#.

wp;while (#pre /\ ={i0} /\ 0<=i0{1}<=2); last first.
+ auto => /> &2 ?????i0r????;split;1:smt().
  rewrite /pos_bound1024_cxq => k kb; rewrite initiE 1:/# /= /#.

wp -1 -1; conseq (: _ ==> ={rp}); 1: by smt().

inline *;sim; auto => /> &1 &2 ???;rewrite /pos_bound256_cxq qE /= => Hb ???.

have Hpos : forall jj kk ii, 0 <= jj < 8 => 0 <= kk < 16 => 0 <= ii < 16 => (get256 (WArray512.init16 ("_.[_]" a0{1})) (8 * i0{1} + jj) \bits16 kk).[ii] = a0{1}.[kk + 16*jj + i0{1}*128].[ii] by
  move => jj kk ii jjb kkb iib; rewrite get256E /pack32_t /(\bits16) initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /(\bits8) initiE 1:/# /= /#.

have bits : forall kk ii, 0 <= kk < 256 => 12 <= ii < 16 => !a0{1}.[kk].[ii].
+ move => kk ii kkb iib; have := Hb kk kkb;rewrite /to_sint /smod /= => Hn.
  have Hn1 : !32768 <= to_uint a0{1}.[kk] by smt(W16.to_uint_cmp pow2_16).
  move : Hn; rewrite Hn1 /= get_to_uint . 
  have ? : 4096 <= 2^ii;last by smt().
  have ? : 4096 = 2^12 by auto.
  smt(@StdOrder.IntOrder). 

have bitsC : forall  ii, 0 <= ii < 16 => (W16.of_int 4095).[ii] <=> 0<=ii<12.
+ move => ii iib.
  have : all (fun i => (W16.of_int 4095).[i] <=> 0 <= i < 12) (iota_ 0 16); 
  last by rewrite allP => H; move : (H ii _);smt(mem_iota).
  by rewrite -iotaredE /= !get_to_uint /=.


do split; rewrite /VPBROADCAST_16u16 /= -(W16u16.unpack16K (WArray512.get256 _ _)) -(W16u16.unpack16K (W16u16.pack16 _)) !andb16u16E;congr;rewrite packP => k kb;rewrite map2iE 1:/# /= andE wordP => ii iib;rewrite map2iE 1:/# /= get_of_list 1:/# /= (nth_map witness)  /=;1,3,5,7,9,11,13,15:smt(size_iota); rewrite unpack16E initiE 1:/# /=;1..7: by rewrite Hpos /#.
      have /= -> := Hpos 0;smt().
qed.


lemma signed_bound1024_cxq_small r (i j:int) :
  i <= j => signed_bound1024_cxq r 0 1024 i => signed_bound1024_cxq r 0 1024 j.
rewrite /signed_bound1024_cxq => />Hij H k Hk1 Hk2. move :(H k). rewrite Hk1 Hk2 => />. smt(). qed.

