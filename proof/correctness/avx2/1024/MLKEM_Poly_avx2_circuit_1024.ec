require import AllCore List Int IntDiv CoreMap Real Number Ring StdOrder BitEncoding.

from Jasmin require import JModel.
from JazzEC require import Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array8 Array4 Array2.
from JazzEC require import WArray512 WArray128 WArray384 WArray32 WArray16 WArray160.
from JazzEC require import Jkem_avx2.

require import AVX2_Ops W16extra.
require import Fq NTT_Fq MLKEMFCLib MLKEM_W16_Rep MLKEM1024_prelude.
require import Fq_avx2 NTT_avx2 NTT_avx2_poly AVX2_Ops MLKEMFCLib.
require import MLKEM_Poly_avx2.
require import Mlkem_bindings CircuitBindings.
require import XWord5 XWord12.
require import XArray16 XArray32 XArray160 XArray256.
require import Circuit_semantics Circuit_sem_1024.
from Spec require import GFq Rq Serialization VecMat Sampling EncDecCorrectness Correctness.

import BitChunking BS2Int.
import Fq.
import GFq Rq Serialization VecMat.
import Zq ZModP.
import Fq_avx2 NTT_Avx2.
import MLKEMFCLib1024.
import MLKEM_PolyAVX.
import W12.

abbrev encode5 (a : ipoly) : W8.t Array160.t = Array160.of_list W8.zero (ByteEncode 5 (to_list a)).


lemma poly_decompress_ll : islossless Jkem_avx2.M._i_poly_decompress.
 proc; inline *;wp. cfold 5; unroll for ^while;auto. 
qed.

lemma poly_decompress_corr_h (_a : W8.t Array160.t): 
    hoare [Jkem_avx2.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 5 (decode5 _a) /\
             pos_bound256_cxq res 0 256 1 ].
proc; inline *.
proc change 1: { q <- BSWAS_16u16_256.sliceget jqx16 0;} ; 1: by auto; move => &1 &2 ?; rewrite BSWAS_16u16_256_slicegetE /#.
proc change 2: { shufbidx <- BSWAS_32u8_256.sliceget pd_jshufbidx 0; }; 1: by auto; move => &1 &2 ?; rewrite BSWAS_32u8_256_slicegetE /#.
proc change 3: { mask <- BSWAS_16u16_256.sliceget pd_mask_s 0;} ; 1: by auto; move => &1 &2 ?; rewrite BSWAS_16u16_256_slicegetE /#.
proc change 4: { shift <- BSWAS_16u16_256.sliceget pd_shift_s 0; } ; 1: by auto; move => &1 &2 ?; rewrite BSWAS_16u16_256_slicegetE /#.
proc change ^while.1 : { t <- zeroextu128 (if (0 <= (10*i)*8 <= 160*8-64) then BSWAS_160u8_64.sliceget a ((10*i)*8) else get64_direct (WArray160.init8 (fun (i_0 : int) => a.[i_0])) (10*i)); };
1: by auto; move => &1 &2 [#] -> ->; case (0 <= (10 * i{2}) * 8 <= 160*8-64); [ move => ?; rewrite BSWAS_160u8_64_slicegetE /# | by auto ].
proc change ^while.10 : { rp <- if (0 <= (32*i)*8 <= 256*16-256) then BSWAS_256u16_256.sliceset rp ((32*i)*8) f else Array256.init (fun (i0:int) => WArray512.get16 (WArray512.set256 (WArray512.init16 (fun (i_0 : int) => rp.[i_0])) i f) i0) ; };
1: by auto; move => &1 &2 [#] _ -> -> ->; case (0 <= (32*i{2})*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicesetE // | by auto ].
proc change ^while.2: { ti <- if (0 <= (10*i+8)*8 <= 160*8-16) then BSWAS_160u8_16.sliceget a ((10*i+8)*8) else get16_direct (WArray160.init8 (fun (i_0 : int) => a.[i_0])) (10*i+8) ; };
1: by auto; move => &1 &2 [#] -> ->; case (0 <= (10*i{2}+8)*8 <= 160*8-16); [ move => ?; rewrite BSWAS_160u8_16_slicegetE /# | by auto ].

cfold 5.
unroll for ^while.
cfold ^i<-.
wp -2.

conseq (: _ ==> rp = BSWA_256u16.init (fun i =>
     decompress5_circuit (W5.init (fun (j : int) => _a.[(i*5 + j) %/ 8].[(i*5 + j) %% 8])))); last  by circuit.

      
(* We start with some boilerplate *)
move => &hr [#]/= <- rr /= ->.

split.
+ rewrite tP => i ib.
  rewrite /BSWA_256u16.init !mapiE 1,2:/# /= -get_to_list /= initiE 1:/# /=.
  rewrite /decompress5_circuit decompress5_circuit_sem //.

rewrite /pos_bound256_cxq qE /= => k kb. 
rewrite /BSWA_256u16.init initiE 1:/# /=.
by apply decompress5_circuit_rng.
qed.

(********** END BDEP PROOF OF DECOMPRESS **************)

lemma poly_decompress_corr (_a : W8.t Array160.t): 
    phoare [Jkem_avx2.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 5 (decode5 _a) /\
             pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_decompress_ll (poly_decompress_corr_h _a).

lemma i_poly_compress_corr_ll : islossless Jkem_avx2.M._i_poly_compress.
proof.
proc; inline *.
cfold 13.
do 2!(unroll for ^while).
auto.
qed.

lemma i_poly_compress_corr_h _aw  : 
    hoare [Jkem_avx2.M._i_poly_compress  :
             pos_bound256_cxq a 0 256 2 /\
             a = _aw
              ==>
             res.`1 = encode5 (compress_poly 5 (lift_array256 _aw)) 
             ].
proof.
proc; inline *.
proc change 2: { qx16 <- BSWAS_16u16_256.sliceget jqx16 0;} ; 1: by auto; move => &1 &2 ?; rewrite BSWAS_16u16_256_slicegetE /#.
proc change ^while.1: { r <- if (0 <= (32*i0)*8 <= 256*16-256) then BSWAS_256u16_256.sliceget rp0 ((32*i0)*8) else get256_direct (WArray512.init16 (fun (i_0 : int) => rp0.[i_0])) (32*i0) ; };
1: by auto; move => &1 &2 [#] _ _ -> ->; case (0 <= (32*i0{2})*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicegetE /# | by auto ].
proc change ^while.9: { rp0 <- if (0 <= (32*i0)*8 <= 256*16-256) then BSWAS_256u16_256.sliceset rp0 ((32*i0)*8) r else Array256.init (fun (i1:int) => WArray512.get16 (WArray512.set256 (WArray512.init16 (fun (i_0 : int) => rp0.[i_0])) i0 r) i1) ; };
1: by auto; move => &1 &2 [#] _ _ -> -> ->; case (0 <= (32*i0{2})*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicesetE // | by auto ].
proc change 6: { v <- BSWAS_16u16_256.sliceget jvx16 0; }; 1: by auto; move => &1 &2 ?; rewrite BSWAS_16u16_256_slicegetE /#.
proc change 12: { shufbidx <- BSWAS_32u8_256.sliceget pc_shufbidx_s 0; }; 1: by auto; move => &1 &2 ?; rewrite BSWAS_32u8_256_slicegetE /#.
proc change ^while{2}.1: { f0 <- if (0 <= (32*(2*i))*8 <= 256*16-256) then BSWAS_256u16_256.sliceget a ((32*(2*i))*8) else get256_direct (WArray512.init16 (fun (i_0 : int) => a.[i_0])) (32*(2*i)) ; };
1: by auto; move => &1 &2 [#] -> ->; case (0 <= (32*(2*i{2}))*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicegetE /# | by auto ].
proc change ^while{2}.2: { f1 <- if (0 <= (32*(2*i+1))*8 <= 256*16-256) then BSWAS_256u16_256.sliceget a ((32*(2*i+1))*8) else get256_direct (WArray512.init16 (fun (i_0 : int) => a.[i_0])) (32*(2*i+1)) ; };
1: by auto; move => &1 &2 [#] -> ->; case (0 <= (32*(2*i{2}+1))*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicegetE /# | by auto ].
proc change ^while{2}.18 : { rp <- if (0 <= 20*i*8 <= 8*160-128) then BSWAS_160u8_128.sliceset rp (20*i*8) t0 else Array160.init (WArray160.get8 (WArray160.set128_direct (WArray160.init8 (fun (i_0 : int) => rp.[i_0])) (20*i) t0)) ; };
1: by auto; move => &1 &2 [#] -> -> ->; case (0 <= 20*i{2}*8 <= 8*160-128); [ move => ?; rewrite BSWAS_160u8_128_slicesetE // | by auto ].
proc change ^while{2}.19 : { rp <- if (0 <= (20*i+16)*8 <= 8*160-32) then BSWAS_160u8_32.sliceset rp ((20*i+16)*8) (truncateu32 t1) else Array160.init (WArray160.get8 (WArray160.set32_direct (WArray160.init8 (fun (i_0 : int) => rp.[i_0])) (20*i+16) (truncateu32 t1))) ; };
1: by auto; move => &1 &2 [#] -> -> ->; case (0 <= (20*i{2}+16)*8 <= 8*160-32); [ move => ?; rewrite BSWAS_160u8_32_slicesetE // | by auto ].

cfold 13.
do 2!(unroll for ^while).
cfold ^i0<-.
wp -3.

conseq (: a = _aw /\
   Array256.all (fun bv => W16.zero \sle bv /\ bv \slt (of_int (2 * 3329))) a
   ==> rp = BSWA_160u8.init (fun i =>
     W8.init (fun j =>
       (compress5_circuit _aw.[(i*8+j) %/ 5]).[(i*8+j) %% 5]))); last by circuit.
        
       
(* BDEP pre conseq *)
+ move => &hr />; rewrite /pos_bound256_cxq qE /= /(\sle) /(\slt) allP /=  => Hb i ib /=.
  rewrite /(to_sint W16.zero) /= /(W16.smod 0) /=.
  rewrite /(to_sint (W16.of_int 6658)) /= /(W16.smod 6658) /= /#.
  
(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= H0 <- rr ->; rewrite /= tP => i ib.
rewrite wordP => k kb; rewrite !initiE 1..3:/# /=.
rewrite encode_compress_bits //=.
by apply compress5_circuit_sem.
qed.



(********** END BDEP PROOF OF COMPRESS **************)

lemma i_poly_compress_corr _aw  : 
    phoare [Jkem_avx2.M._i_poly_compress  :
             pos_bound256_cxq a 0 256 2 /\
             a = _aw
              ==>
             res.`1 = encode5 (compress_poly 5 (lift_array256 _aw)) 
             ] = 1%r
 by conseq i_poly_compress_corr_ll (i_poly_compress_corr_h _aw).
