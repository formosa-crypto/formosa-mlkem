require import AllCore List Int IntDiv CoreMap Real Number Ring StdOrder BitEncoding.

from Jasmin require import JModel.
from JazzEC require import Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array8 Array4 Array2.
from JazzEC require import WArray512 WArray128 WArray384 WArray32 WArray16.
from JazzEC require import Jkem_avx2.

require import AVX2_Ops W16extra.
require import Fq NTT_Fq MLKEMFCLib MLKEM_W16_Rep MLKEM768_prelude.
require import Fq_avx2 NTT_avx2 NTT_avx2_poly AVX2_Ops MLKEMFCLib.
require import MLKEM_Poly_avx2.
require import Mlkem_bindings CircuitBindings.
require import XWord4 XWord12.
require import XArray8 XArray16 XArray32 XArray128 XArray256.
require import Circuit_semantics Circuit_sem_768.
from Spec require import GFq Rq Serialization VecMat Sampling EncDecCorrectness Correctness.

import BitChunking BS2Int.
import Fq.
import GFq Rq Serialization VecMat.
import Zq ZModP.
import Fq_avx2 NTT_Avx2.
import MLKEMFCLib768.
import MLKEM_PolyAVX.
import W12.

abbrev encode4 (a : ipoly) : W8.t Array128.t = Array128.of_list W8.zero (ByteEncode 4 (to_list a)).


lemma poly_decompress_ll : islossless Jkem_avx2.M._i_poly_decompress.
 proc; inline *;wp. cfold 9; unroll for ^while;auto.
qed.

lemma poly_decompress_corr_h (_a : W8.t Array128.t): 
    hoare [Jkem_avx2.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 4 (decode4 _a) /\
             pos_bound256_cxq res 0 256 1 ].
proc; inline *.
proc change 4: { q <- BSWAS_16u16_256.sliceget x16p 0;}; 1: by auto; move => &1 &2 ?; rewrite BSWAS_16u16_256_slicegetE /#.
proc change 6: { shufbidx <- BSWAS_32u8_256.sliceget x32p 0;}; 1: by auto; move => &1 &2 ?; rewrite BSWAS_32u8_256_slicegetE /#.
proc change ^while.1 : { h <- zeroextu128 (if (0 <= (8*i)*8 <= 128*8-64) then BSWAS_128u8_64.sliceget a ((8*i)*8) else get64_direct (WArray128.init8 (fun (i_0 : int) => a.[i_0])) (8*i)); };
1: by auto; move => &1 &2 [#] -> ->; case (0 <= (8*i{2})*8 <= 128*8-64); [ move => ?; rewrite BSWAS_128u8_64_slicegetE /# | by auto ].
proc change ^while.8 : { rp <- if (0 <= (32*i)*8 <= 256*16-256) then BSWAS_256u16_256.sliceset rp ((32*i)*8) f else Array256.init (fun (i1:int) => WArray512.get16 (WArray512.set256 (WArray512.init16 (fun (i_0 : int) => rp.[i_0])) i f) i1) ; };
1: by auto; move => &1 &2 [#] _ -> -> ->; case (0 <= (32*i{2})*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicesetE // | by auto ].

cfold 9.
unroll for ^while.
cfold ^i<-.
wp -2.
conseq (: _ ==> rp = BSWA_256u16.init (fun i =>
     decompress4_circuit (W4.init (fun (j : int) => _a.[i %/ 2].[i %% 2 * 4 + j])))); last  by circuit.

      
(* We start with some boilerplate *)
move => &hr [#]/= <- rr /= ->.

split.
+ rewrite tP => i ib.
  rewrite /BSWA_256u16.init !mapiE 1,2:/# /= -get_to_list /= initiE 1:/# /=.
  by rewrite  -decompress4_circuit_sem 1:/# /=. 

rewrite /pos_bound256_cxq qE /= => k kb. 
rewrite /BSWA_256u16.init initiE 1:/# /=.
by apply decompress4_circuit_rng.
qed.

(********** END BDEP PROOF OF DECOMPRESS **************)

lemma poly_decompress_corr (_a : W8.t Array128.t): 
    phoare [Jkem_avx2.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 4 (decode4 _a) /\
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
             res.`1 = encode4 (compress_poly 4 (lift_array256 _aw)) 
             ].
proof.
proc; inline *.
proc change 3: { qx16 <- BSWAS_16u16_256.sliceget jqx16 0;}; 1: by auto; move => &1 &2 ?; rewrite BSWAS_16u16_256_slicegetE /#.
proc change ^while.1: { r <- if (0 <= (32*i0)*8 <= 256*16-256) then BSWAS_256u16_256.sliceget rp0 ((32*i0)*8) else get256_direct (WArray512.init16 (fun (i_0 : int) => rp0.[i_0])) (32*i0) ; };
1: by auto; move => &1 &2 [#] _ _ -> ->; case (0 <= (32*i0{2})*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicegetE /# | by auto ].
proc change ^while.9: { rp0 <- if (0 <= (32*i0)*8 <= 256*16-256) then BSWAS_256u16_256.sliceset rp0 ((32*i0)*8) r else Array256.init (fun (i1:int) => WArray512.get16 (WArray512.set256 (WArray512.init16 (fun (i_0 : int) => rp0.[i_0])) i0 r) i1) ; };
1: by auto; move => &1 &2 [#] _ _ -> -> ->; case (0 <= (32*i0{2})*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicesetE // | by auto ].
proc change 8: { v <- BSWAS_16u16_256.sliceget x16p 0;}; 1: by auto; move => &1 &2 ?; rewrite BSWAS_16u16_256_slicegetE /#.
proc change 12: { permidx <- BSWAS_8u32_256.sliceget pc_permidx_s 0;}; 1: by auto; move => &1 &2 ?; rewrite BSWAS_8u32_256_slicegetE /#.
proc change ^while{2}.1: { f0 <- if (0 <= (32*(4*i))*8 <= 256*16-256) then BSWAS_256u16_256.sliceget a ((32*(4*i))*8) else get256_direct (WArray512.init16 (fun (i_0 : int) => a.[i_0])) (32*(4*i)) ; };
1: by auto; move => &1 &2 [#] -> ->; case (0 <= (32*(4*i{2}))*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicegetE /# | by auto ].
proc change ^while{2}.2: { f1 <- if (0 <= (32*(4*i+1))*8 <= 256*16-256) then BSWAS_256u16_256.sliceget a ((32*(4*i+1))*8) else get256_direct (WArray512.init16 (fun (i_0 : int) => a.[i_0])) (32*(4*i+1)) ; };
1: by auto; move => &1 &2 [#] -> ->; case (0 <= (32*(4*i{2}+1))*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicegetE /# | by auto ].
proc change ^while{2}.3: { f2 <- if (0 <= (32*(4*i+2))*8 <= 256*16-256) then BSWAS_256u16_256.sliceget a ((32*(4*i+2))*8) else get256_direct (WArray512.init16 (fun (i_0 : int) => a.[i_0])) (32*(4*i+2)) ; };
1: by auto; move => &1 &2 [#] -> ->; case (0 <= (32*(4*i{2}+2))*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicegetE /# | by auto ].
proc change ^while{2}.4: { f3 <- if (0 <= (32*(4*i+3))*8 <= 256*16-256) then BSWAS_256u16_256.sliceget a ((32*(4*i+3))*8) else get256_direct (WArray512.init16 (fun (i_0 : int) => a.[i_0])) (32*(4*i+3)) ; };
1: by auto; move => &1 &2 [#] -> ->; case (0 <= (32*(4*i{2}+3))*8 <= 256*16-256); [ move => ?; rewrite BSWAS_256u16_256_slicegetE /# | by auto ].
proc change ^while{2}.23 : { rp <- if (0 <= 32*i*8 <= 8*128-256) then BSWAS_128u8_256.sliceset rp (32*i*8) f0 else Array128.init (WArray128.get8 (WArray128.set256_direct (WArray128.init8 (fun (i_0 : int) => rp.[i_0])) (32*i) f0)) ; };
1: by auto; move => &1 &2 [#] -> -> ->; case (0 <= 32*i{2}*8 <= 8*128-256); [ move => ?; rewrite BSWAS_128u8_256_slicesetE // | by auto ].

cfold 13.
do 2!(unroll for ^while).
cfold ^i0<-.
wp -3.


conseq (: a = _aw /\
   Array256.all (fun bv => W16.zero \sle bv /\ bv \slt (of_int (2 * 3329))) a
   ==> rp = BSWA_128u8.init (fun i =>
     W8.init (fun j =>
       (compress4_circuit _aw.[j %/ 4 + i * 2]).[j %% 4]))); last by circuit.
        
       
(* BDEP pre conseq *)
+ move => &hr />; rewrite /pos_bound256_cxq qE /= /(\sle) /(\slt) allP /=  => Hb i ib /=.
  rewrite /(to_sint W16.zero) /= /(W16.smod 0) /=.
  rewrite /(to_sint (W16.of_int 6658)) /= /(W16.smod 6658) /= /#.
  
(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= H0 <- rr ->; rewrite /= /BSWA_128u8.init tP => i ib.
rewrite wordP => k kb; rewrite !initiE 1..3:/# /=.
rewrite encode_compress_bits //=.
by apply compress4_circuit_sem.
qed.
(********** END BDEP PROOF OF COMPRESS **************)

lemma i_poly_compress_corr _aw  : 
    phoare [Jkem_avx2.M._i_poly_compress  :
             pos_bound256_cxq a 0 256 2 /\
             a = _aw
              ==>
             res.`1 = encode4 (compress_poly 4 (lift_array256 _aw)) 
             ] = 1%r
 by conseq i_poly_compress_corr_ll (i_poly_compress_corr_h _aw).
