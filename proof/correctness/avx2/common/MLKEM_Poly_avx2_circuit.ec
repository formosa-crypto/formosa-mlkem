require import AllCore List Int IntDiv CoreMap Real Number Ring StdOrder BitEncoding.

from Jasmin require import JModel.
from JazzEC require import Array400 Array384 Array256 Array128 Array64 Array32 Array16 Array8 Array4 Array2.
from JazzEC require import WArray512 WArray128 WArray384 WArray32 WArray16.
from JazzEC require import Jkem_avx2.

require import AVX2_Ops W16extra.
require import Fq NTT_Fq MLKEMFCLib.
require import Fq_avx2 NTT_avx2_poly.
require import MLKEM_Poly_avx2.
require import Mlkem_bindings.
require import Circuit_semantics.
from Spec require import GFq Rq Serialization VecMat Sampling EncDecCorrectness Correctness.

import BitChunking BS2Int.
import Fq.
import GFq Rq Serialization VecMat.
import Zq ZModP.
import Fq_avx2.
import MLKEM_PolyAVX.


lemma poly_csubq_avx2_ll :
   islossless Jkem_avx2.M._poly_csubq.
by proc;inline *;unroll for ^while;auto.
qed.

lemma poly_csubq_avx2_corr_h (_aw : W16.t Array256.t):
    hoare[ Jkem_avx2.M._poly_csubq  :
             rp = _aw /\
             pos_bound256_cxq rp 0 256 2 ==> 
             lift_array256 res = lift_array256 _aw /\
             pos_bound256_cxq res 0 256 1]. 
proof.
proc; inline *.
proc change 1: { qx16 <- sliceget16_16_256 jqx16 0;}; 1: by auto.
proc change ^while.1: { r <- sliceget256_16_256 rp (i*256);};1: by auto => /#.
proc change ^while.9: { rp <-sliceset256_16_256 rp (i*256) r;};1: by auto => /#.
unroll for ^while.
cfold ^i<-.
wp -1.
conseq (: rp = _aw /\ all (fun c => W16.zero \sle c && c \slt W16.of_int 6658) rp ==>
       rp = init_256_16 (fun i => csubq_circuit _aw.[i])); last by circuit.

       
(* BDEP pre conseq *)
+ move => &hr />. rewrite /pos_bound256_cxq /bpos16 qE /= => H.
  rewrite /(\slt) /(\sle) /= /smod /= allP /=.
  by exact H.

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= ->; rewrite /pos_bound256_cxq => Hb rr; rewrite /init_256_16 /lift_array256 /= => ->; split.

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

lemma poly_csubq_avx2_corr (_aw : W16.t Array256.t):
    phoare[ Jkem_avx2.M._poly_csubq  :
             rp = _aw /\
             pos_bound256_cxq rp 0 256 2 ==> 
             lift_array256 res = lift_array256 _aw /\
             pos_bound256_cxq res 0 256 1] = 1%r
  by conseq poly_csubq_avx2_ll (poly_csubq_avx2_corr_h _aw).


lemma poly_add_corr_avx_impl ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 => 
  forall _a _b,
      phoare[ Mprevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
   by move => abb bbb _a _b; apply (MLKEM_PolyAVX.poly_add_corr _a _b ab bb abb bbb).

lemma poly_frommsg_ll : islossless Jkem_avx2.M._i_poly_frommsg 
 by proc; inline *;wp;while (0 <= i <= 32) (32-i);  by  auto =>  /> /#.

lemma poly_frommsg_corr_h (_m : W8.t Array32.t): 
    hoare [Jkem_avx2.M._i_poly_frommsg :
             ap =  _m 
              ==>
             lift_array256 res = decompress_poly 1 (decode1 _m) /\
             pos_bound256_cxq res 0 256 1 ].
proc; inline *.
proc change 1: { hqs <- sliceget16_16_256 hqx16_p1 0;};1: by auto.
proc change 2: { shift <- VPBROADCAST_2u128 (sliceget4_32_128 pfm_shift_s 0);};1: by auto.
proc change 3: { idx <- VPBROADCAST_2u128 (sliceget16_8_128 pfm_idx_s 0);};1: by auto.
proc change 4: { f <- sliceget32_8_256 ap 0;};1: by auto.
proc change ^while.23 : { rp <- sliceset256_16_256 rp (2*i*256) g0;}; 1: by auto => /#. 
proc change ^while.24 : { rp <- sliceset256_16_256 rp ((2*i+1)*256) g1;}; 1: by auto => /#. 
proc change ^while.25 : { rp <- sliceset256_16_256 rp ((2*i+8)*256) g2;}; 1: by auto => /#. 
proc change ^while.26 : { rp <- sliceset256_16_256 rp ((2*i+9)*256) g3;}; 1: by auto => /#. 


unroll for ^while.
wp -1.


conseq (: _ ==> rp = init_256_16 (fun i => decompress1_circuit _m.[i %/ 8].[i %% 8]));
 2: by circuit.

(* BDEP post conseq *)

move => &hr [#]/= <- rr /= ->.

split.
+ rewrite tP => i ib.
  rewrite /init_256_16 !mapiE 1,2:/# /= -get_to_list /= initiE 1:/# /=.
  by rewrite /decompress1_circuit decompress1_circuit_sem //.

rewrite /pos_bound256_cxq qE /= => k kb. 
rewrite /init_256_16 initiE 1:/# /=.
by smt(decompress1_circuit_rng).
qed.


(********** END BDEP PROOF OF FROMMSG **************)


lemma poly_frommsg_corr (_m : W8.t Array32.t): 
    phoare [Jkem_avx2.M._i_poly_frommsg :
             ap =  _m 
              ==>
             lift_array256 res = decompress_poly 1 (decode1 _m) /\
             pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_frommsg_ll (poly_frommsg_corr_h _m).

lemma poly_tomsg_ll : islossless Jkem_avx2.M._i_poly_tomsg.
proc.
cfold 7.
inline *.
do 2!(unroll for ^while).
auto.
qed.

(********** BEGIN BDEP PROOF OF TOMSG **************)


lemma poly_tomsg_corr_h _aw : 
    hoare [Jkem_avx2.M._i_poly_tomsg :
             pos_bound256_cxq a 0 256 2 /\ 
              a = _aw
              ==>
             res.`1 = encode1 (compress_poly 1 (lift_array256 _aw))  ].
proof.
proc; inline *.
proc change 3 : { qx16 <- sliceget16_16_256 jqx16 0;};1: by auto.
proc change ^while.1: { r <- sliceget256_16_256 rp0 (i0*256);};1: by auto => /#.
proc change ^while.9: { rp0 <- sliceset256_16_256 rp0 (i0*256) r;};1: by auto => /#.
proc change 8: {hq <- sliceget16_16_256 px16 0;}; 1: by auto.
proc change 10: {hhq <- sliceget16_16_256 px16 0;}; 1: by auto.
proc change ^while{2}.1: { f0 <- sliceget256_16_256 a (2*i*256);};1: by auto => /#.
proc change ^while{2}.2: { f1 <- sliceget256_16_256 a ((2*i+1)*256);};1: by auto => /#.
proc change ^while{2}.14 : { rp <- sliceset32_8_32 rp  (i*32) c;};1: by auto => /#.


cfold 11.
unroll for ^while.
cfold ^i0<-.
unroll for ^while.
wp -3. 


conseq (: a = _aw /\
   Array256.all (fun bv => W16.zero \sle bv /\ bv \sle (of_int (2 * 3329))) a ==> rp = init_32_8 (fun i => W8.init (fun j => compress1_circuit _aw.[i*8+j]))); last  by circuit.

(* conseq pre *)
+ move => &hr />; rewrite /pos_bound256_cxq qE /= /(\sle) allP /=  => Hb i ib /=.
  rewrite /(to_sint W16.zero) /= /(W16.smod 0) /=.
  rewrite /(to_sint (W16.of_int 6658)) /= /(W16.smod 6658) /= /#.

(* BDEP post conseq *)
move => &hr [#]/= H0 <- rr ->; rewrite /= /init_32_8 tP => i ib.
rewrite wordP => k kb; rewrite !initiE 1..3:/# /=.
rewrite encode_compress_bits //=.
by apply compress1_circuit_sem.
qed.


(********** END BDEP PROOF OF TOMSG **************)


lemma poly_tomsg_corr _aw : 
    phoare [Jkem_avx2.M._i_poly_tomsg :
             pos_bound256_cxq a 0 256 2 /\ 
              a = _aw
              ==>
             res.`1 = encode1 (compress_poly 1 (lift_array256 _aw))  ] = 1%r
  by conseq poly_tomsg_ll (poly_tomsg_corr_h _aw).
