require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array1152 Array1088 Array960 Array1410 Array768 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8 Array2.
from JazzEC require import WArray512 WArray128 WArray384 WArray32 WArray16 WArray1410 WArray160 WArray960 WArray1152 WArray1536.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem768.
from JazzEC require import Jkem768_avx2.
require import MLKEM_PolyVec_avx2_prevec.
require import MLKEM_Poly_avx2_prevec.
require import NTT_avx2 NTT_avx2_ntt NTT_avx2_invntt.
require import Fqmul_avx2 Red_x16_avx2.
require import Fq.
require import NTT_Fq.
require import MLKEM_Poly.
require import MLKEM_PolyVec.
require import MLKEM_avx2_auxlemmas.
require import MLKEM_Poly_avx2_proof.
require import MLKEM_PolyVec_avx2_proof.
require import MLKEM_Poly_avx2_vec.
require import MLKEM_PolyVec_avx2_vec.
require import MLKEM_InnerPKE.
require import MLKEMFCLib.

import GFq Rq Symmetric Symmetric768 Serialization Serialization768 Sampling VecMat VecMat768 InnerPKE768 MLKEM768 Correctness768 Fq SignedReductions.

import Zq.
import ZModP.
import Fq_avx2.
import NTT_Avx2.
import MLKEM_Poly.
import MLKEM_PolyVec.

import MLKEM_PolyAVX.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import MLKEM_PolyVecAVXVec.

require import Bindings.


import KMatrix Vector.

from JazzEC require import WArray1088 WArray2048.
require import Bindings BitEncoding.
import BitChunking BS2Int.

require import MLKEM_avx2_equivs_csubq.

op compress10_circuit(a : W16.t) : W10.t = 
   if (a \ult W16.of_int 3329) then  
   truncate64_10 (srl_64 ((sll_64 (zeroextu64 a) (W64.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) (W64.of_int 32))
   else 
   truncate64_10 (srl_64 ((sll_64 (zeroextu64 (W16_sub a (W16.of_int 3329))) (W64.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) (W64.of_int 32)).

abbrev keepodd10 = (W32.of_int 67043328).
abbrev keepeven10 = (W32.of_int 1023).

op VPMADDWD_alt(f0 m : W256.t) : W256.t =
    if m <> (VPBROADCAST_4u64 (W64.of_int 288230380513787905)) then
       VPMADDWD_256 f0 m
    else 
    let f2 = VPBROADCAST_8u32 keepodd10 in
    let f1 = VPAND_256 f0 f2  in
    let f2 = VPBROADCAST_8u32 keepeven10 in
    let f0 = VPAND_256 f0 f2  in
    let f1 = VPSRL_8u32 f1  (W128.of_int 6) in
        VPOR_256 f0 f1.


lemma keepeven_bits b: 
  0 <= b < 32 =>
   keepeven10.[b] <=> 0<=b<10.
move => bb.
have  : all (fun b => keepeven10.[b] <=> 0 <= b < 10) (iota_ 0 32); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
by rewrite /of_int  /int2bs /mkseq -iotaredE /=.
qed.

lemma keepodd_bits b: 
  0 <= b < 32 =>
   keepodd10.[b] <=> 16<=b<26.
move => bb.
have  : all (fun b => keepodd10.[b] <=> 16 <= b < 26) (iota_ 0 32); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
by rewrite /of_int  /int2bs /mkseq -iotaredE /=.
qed.

lemma lowbits_keep (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 0 => 
  0 <= b < 10 =>
    (f \bits16 i).[b] = ((f \bits32 i%/2)  `&` keepeven10).[b].
proof. 
move => bi Hi Hb. 
have H := W16u16.get_bits16 f (16*i + b) _;1:smt().
have H0 := W8u32.get_bits32 f (16*i + b) _;1:smt().
rewrite andE map2iE 1:/# /=.
by smt(keepeven_bits).
qed.

lemma lowbits_drop (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 0 => 
  10 <= b < 16 =>
  !((f \bits32 i%/2)  `&` keepeven10).[b].
proof. 
move => bi Hi Hb. 
rewrite andE map2iE 1:/# /=.
by smt(keepeven_bits).
qed.

lemma highbits_keep (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 1 => 0 <= b < 10 =>
    (f \bits16 i).[b] = ((f \bits32 i%/2)  `&` keepodd10).[b + 16].
proof. 
move => bi Hi Hb. 
have H := W16u16.get_bits16 f (16*i + b) _;1:smt().
have H0 := W8u32.get_bits32 f (16*i + b) _;1:smt().
rewrite andE map2iE 1:/# /=.
by smt(keepodd_bits).
qed.

lemma highbits_drop (f : W256.t) (i : int) (b : int) :
  0 <= i < 16 => i %% 2 = 1 =>10 <= b < 15 =>
    !((f \bits32 i%/2)  `&` keepodd10).[b + 16].
proof. 
move => bi Hi Hb. 
rewrite andE map2iE 1:/# /=.
by smt(keepodd_bits).
qed.


lemma lowbits_ofint_keep (f0 f1 : W16.t) b :
  0 <= b < 10 =>
  0<= to_sint f0 < 1024 =>
  0<= to_sint f1 < 1024 =>
  (W32.of_int (to_sint f0 + to_sint f1 * 1024)).[b] = f0.[b].
move => ?.
rewrite /to_sint /smod /= => ??.
have  : all (fun b => (W32.of_int
   ((if 32768 <= to_uint f0 then to_uint f0 - 65536 else to_uint f0) +
    (if 32768 <= to_uint f1 then to_uint f1 - 65536 else to_uint f1) * 1024)).[b] =
f0.[b]) (iota_ 0 10); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
 rewrite  /of_int /int2bs /mkseq -iotaredE /=;do split; rewrite get_to_uint /= /#.
qed.

lemma highbits_ofint_keep (f0 f1 : W16.t) b :
  0<= to_sint f0 < 1024 =>
  0<= to_sint f1 < 1024 =>
  10 <= b < 20 =>
  (W32.of_int (to_sint f0 + to_sint f1 * 1024)).[b] = f1.[b-10].
move => ?.
rewrite /to_sint /smod /= => ??.
have  : all (fun b => (W32.of_int
   ((if 32768 <= to_uint f0 then to_uint f0 - 65536 else to_uint f0) +
    (if 32768 <= to_uint f1 then to_uint f1 - 65536 else to_uint f1) * 1024)).[b] =
f1.[b - 10]) (iota_ 10 20); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
 rewrite  /of_int /int2bs /mkseq -iotaredE /=;do split; rewrite get_to_uint /=; smt(pow2_16 pow2_32). 
qed.


lemma highbits_ofint_drop (f0 f1 : W16.t) b :
  0<= to_sint f0 < 1024 =>
  0<= to_sint f1 < 1024 =>
  20 <= b < 32 =>
  !(W32.of_int (to_sint f0 + to_sint f1 * 1024)).[b].
move => ?.
rewrite /to_sint /smod /= => ??.
have  : all (fun b => ! (W32.of_int
     ((if 32768 <= to_uint f0 then to_uint f0 - 65536 else to_uint f0) +
      (if 32768 <= to_uint f1 then to_uint f1 - 65536 else to_uint f1) * 1024)).[b]) (iota_ 20 32); last by rewrite allP => H; move : (H b _); smt(mem_iota allP). 
 rewrite  /of_int /int2bs /mkseq -iotaredE /=;do split; smt(pow2_16 pow2_32). 
qed.


lemma unand (f : W256.t) (i : int) (b : int) :
  0 <= i < 8 => 0<=b<32 =>
   (W32.init (fun (j : int) => (f \bits32 i).[j + 6] /\ keepodd10.[j + 6])).[b] = ((f \bits32 i) `&` keepodd10).[b + 6].
proof.
move => ??.
by rewrite initiE 1:/# /=.
qed.

lemma vpmaddwd_alt_corr (f0 shift2 : W256.t) :
   (forall i, 0 <= i < 16 => 0<= to_sint (f0 \bits16 i) < 2^10) =>
   VPMADDWD_256 f0 shift2 = VPMADDWD_alt f0 shift2.
+ move => /= H;rewrite /VPMADDWD_256 /VPMADDWD_alt /=.  print pvc_shift2_s.
  case (shift2 = VPBROADCAST_4u64 pvc_shift2_s);2: by auto. 
  move => -> /=; rewrite /VPBROADCAST_4u64 /= -!(iotaredE) /=. 
  pose f00 := (f0 \bits16 0).
  pose f01 := (f0 \bits16 1).
  pose f02 := (f0 \bits16 2).
  pose f03 := (f0 \bits16 3).
  pose f04 := (f0 \bits16 4).
  pose f05 := (f0 \bits16 5).
  pose f06 := (f0 \bits16 6).
  pose f07 := (f0 \bits16 7).
  pose f08 := (f0 \bits16 8).
  pose f09 := (f0 \bits16 9).
  pose f010 := (f0 \bits16 10).
  pose f011 := (f0 \bits16 11).
  pose f012 := (f0 \bits16 12).
  pose f013 := (f0 \bits16 13).
  pose f014 := (f0 \bits16 14).
  pose f015 := (f0 \bits16 15).
  rewrite  /(\bits16) /= !W16.init_bits2w -!iotaredE /= /W64.of_int /= /int2bs /mkseq -!iotaredE /=; do 16!(rewrite /(to_sint (W16.bits2w _)) /smod /= /(W16.to_uint (W16.bits2w (_::_)))). 
  rewrite  !bits2wK //= !JUtils.bs2int_cons /b2i /= !bs2int_nil /=.
  rewrite !hadd_cons2 hadd_nil /=.
  rewrite /VPBROADCAST_8u32 -!iotaredE /= /VPSRL_8u32 /= /(`>>>`) /= -(unpack32K f0) andb8u32E !orb8u32E;congr;rewrite /unpack32 init_of_list -iotaredE /= orE.
  congr;apply (eq_from_nth witness) => //= => i ib. 
  apply W32.wordP => b bb. 
  have /= H3 := highbits_keep f0 (i*2+1) (b-10) _ _;1,2: smt().
  have /= H4 := highbits_drop f0 (i*2+1) (b-10) _ _;1,2: smt().
  have /= H5 := lowbits_keep f0  (i*2) b _ _;1,2: smt().
  have /= H6 := lowbits_drop f0 (i*2) b _ _;1,2: smt(). 
  case (i = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f00 f01 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f00 f01 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f00 f01 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 1 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f02 f03 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f02 f03 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f02 f03 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 2 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f04 f05 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f04 f05 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f04 f05 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 3 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f06 f07 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f06 f07 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f06 f07 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 4 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f08 f09 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f08 f09 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f08 f09 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 5 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f010 f011 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f010 f011 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f010 f011 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 6 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f012 f013 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f012 f013 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f012 f013 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
  case (i - 7 = 0) => *.
  + rewrite map2iE 1:/# unand 1,2:/#.
    have /= H0 := highbits_ofint_drop f014 f015 b _ _;1,2:smt().
    have /= H1 := highbits_ofint_keep f014 f015 b _ _;1,2:smt().
    have /= H2 := lowbits_ofint_keep f014 f015 b.
    smt(keepodd_bits keepeven_bits W32.get_out).
by smt().
qed.

module AuxCompress10 = {

proc __i_polyvec_compress(rp : W8.t Array960.t, a : W16.t Array768.t) : W8.t Array960.t = {
    var inc : int;
    var x16p : W16.t Array16.t;
    var v : W256.t;
    var v8 : W256.t;
    var off : W256.t;
    var shift1 : W256.t;
    var mask : W256.t;
    var shift2 : W256.t;
    var sllvdidx : W256.t;
    var shufbidx : W256.t;
    var i : int;
    var f0 : W256.t;
    var f1 : W256.t;
    var f2 : W256.t;
    var t0 : W128.t;
    var t1 : W128.t;
    x16p <- witness;
    a <@ M.__polyvec_csubq(a);
    x16p <- jvx16;
    v <- get256 (WArray32.init16 (fun (i_0 : int) => x16p.[i_0])) 0;
    v8 <- VPSLL_16u16 v (W128.of_int 3);
    off <- VPBROADCAST_16u16 pc_mask_s;
    shift1 <- VPBROADCAST_16u16 pvc_shift1_s;
    mask <- VPBROADCAST_16u16 pvc_mask_s;
    shift2 <- VPBROADCAST_4u64 pvc_shift2_s;
    sllvdidx <- VPBROADCAST_4u64 pvc_sllvdidx_s;
    shufbidx <- get256 (WArray32.init8 (fun (i_0 : int) => pvc_shufbidx_s.[i_0])) 0;
    inc <- 3 * 256 %/ 16;
    i <- 0;
    while (i < inc){
      f0 <- get256 (WArray1536.init16 (fun (i_0 : int) => a.[i_0])) i;
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
      f0 <- VPMADDWD_alt f0 shift2;
      f0 <- VPSLLV_8u32 f0 sllvdidx;
      f0 <- VPSRL_4u64 f0 (W128.of_int 12);
      f0 <- VPSHUFB_256 f0 shufbidx;
      t0 <- truncateu128 f0;
      t1 <- VEXTRACTI128 f0 W8.one;
      t0 <- VPBLENDW_128 t0 t1 (W8.of_int 224);
      rp <-
        Array960.init
          (WArray960.get8
             (WArray960.set128_direct (WArray960.init8 (fun (i_0 : int) => rp.[i_0])) (20 * i) t0));
      rp <-
        Array960.init
          (WArray960.get8
             (WArray960.set32_direct (WArray960.init8 (fun (i_0 : int) => rp.[i_0])) (
                20 * i + 16) (VPEXTR_32 t1 W8.zero)));
      i <- i + 1;
    }
    
    return rp;
  }
}.

lemma auxcompress10_ll : islossless AuxCompress10.__i_polyvec_compress.
proc. cfold 12. unroll for ^while; wp => /=. 
inline *;unroll for ^while; do 3!(unroll for ^while);auto.
qed.

lemma auxcompress10_corr_h (_aw : W16.t Array768.t):
    hoare[ AuxCompress10.__i_polyvec_compress  :
             a = _aw /\
             pos_bound768_cxq a 0 768 2 ==> 
      res = encode10_vec (compress_polyvec 10 (lift_polyvec _aw))].
proof.
proc; inline *.
proc change ^while.1: (init_256_16 (fun i => r.[256*i0+i]));1: by auto.
proc change ^while.2: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change ^while.^while.1: (sliceget256_16_256 rp0 (i1*256));1: by auto => /#.
proc change ^while.^while.9: (sliceset256_16_256 rp0 (i1*256) r0);1: by auto => /#.
proc change ^while.6: (init_768_16 (fun (i_0 : int) => if 256 * i0 <= i_0 < 256 * i0 + 256 then aux.[i_0 - 256 * i0] else r.[i_0]));1: by auto. 
proc change 7: (sliceget16_16_256 x16p 0); 1: by auto.
proc change ^while{2}.1: (sliceget768_16_256 a (i*256));1: by auto => /#.
proc change 14: (sliceget32_8_256 pvc_shufbidx_s 0); 1: by auto.
proc change ^while{2}.19 : (sliceset960_8_128 rp  (20*i*8) t0);1: by auto => /#.
proc change ^while{2}.20 : (sliceset960_8_32 rp  ((20*i+16)*8) (truncateu32 t1)).
+ move => *;rewrite /sliceset960_8_32 tP => *.
  rewrite initiE /= 1:/# ifT 1:/# initiE 1:/#.
  do congr;1: smt(). 
  by rewrite /VPEXTR_32 /truncateu32 to_uint_eq /= bits32_div //.
unroll for ^while.
do 3!(unroll for ^while).
cfold ^inc<-.
unroll for ^while.
cfold ^i0<-. 
cfold ^i1<-. 
wp -4. 
bdep 16 10 [_aw] [a] [rp] compress10_circuit pcond_reduced. 


(* BDEP pre conseq *)
+ move => &hr />; rewrite flatten1 /= pre_lane_commute_in_aligned 1:/# //=.
  rewrite allP /pos_bound768_cxq /= => Hb. 
  rewrite /pcond_reduced /= /tolist /= => x.
  rewrite  mkseqP => He;elim He => /= i [ib?]; rewrite ultE /=.
  have := Hb i; rewrite ib /= qE /=.
  rewrite /to_sint /smod /=.
  smt(W16.to_uint_cmp).

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= <- H0  rr; rewrite /= !flatten1.
move => H1.

apply (inj_eq Array960.to_list Array960.to_list_inj).
apply (flatten_map_eq _ _ W8.w2bits 8 _ W8.w2bits_inj W8.size_w2bits);1:smt().
have -> := post_lane_commute_in_aligned (to_list a{hr}) (to_list rr) W16.w2bits W16.bits2w W8.w2bits W8.bits2w W10.w2bits W10.bits2w  compress10_circuit 16 10 8 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
    smt(Array960.size_to_list Array768.size_to_list W16.bits2wK BVA_Top_Bindings_W10_t.oflistP).

rewrite output_pack_960_8. 
+ rewrite (EclibExtra.size_flatten' 10);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=.

congr.
rewrite /compress10_circuit /compress_polyvec /fromarray256  -map_comp -map_comp -map_comp /(\o) /=.  
apply (eq_from_nth witness); 1: by rewrite !size_map //.
rewrite size_map size_iota /max /= => i ib; rewrite !(nth_map witness) //=;1,2:smt(size_iota).
rewrite nth_iota 1:/# mapiE 1:/# initiE 1:/# /= /lift_polyvec /=.
case (0<=i<256).
+ move => ? /=.
  rewrite  !getvE offunvE 1:/# /= -(BVA_Top_Bindings_W10_t.oflistP (int2bs 10 (compress 10 (lift_array256 (subarray256 a{hr} 0)).[i]))); 1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Bindings_W10_t.ofintP /lift_array256 /subarray256 !mapiE 1:/# /= initiE 1:/# /=. 

rewrite /truncate64_10 to_uint_eq.
(* This is now the equivalence betwen specs. It's made slightly more verbose
   because the impl circuit is only proved correct wrt compress for values
   in the q range. *)
rewrite ultE /=. 
case (to_uint a{hr}.[i] < 3329) => /= *.
+ rewrite -Fq.compress_impl_large //=; 1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).     
  rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 
have := H0;rewrite /pos_bound768_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /smod /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329)) /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -Fq.compress_impl_large //=;1:by smt().
by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 

case (256<=i<512).
+ move => ?? /=.
  rewrite  !getvE offunvE 1:/# /= -(BVA_Top_Bindings_W10_t.oflistP (int2bs 10 (compress 10 (lift_array256 (subarray256 a{hr} 1)).[i-256]))); 1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Bindings_W10_t.ofintP /lift_array256 /subarray256 !mapiE 1:/# /= initiE 1:/# /=. 

rewrite /truncate64_11 to_uint_eq.
(* This is now the equivalence betwen specs. It's made slightly more verbose
   because the impl circuit is only proved correct wrt compress for values
   in the q range. *)
rewrite ultE /=. 
case (to_uint a{hr}.[i] < 3329) => /= *.
+ rewrite -Fq.compress_impl_large //=; 1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).     
  rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 
have := H0;rewrite /pos_bound768_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))   /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -Fq.compress_impl_large //=;1:by smt().
by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 

+ move => ?? /=.
  rewrite  !getvE offunvE 1:/# /= -(BVA_Top_Bindings_W10_t.oflistP (int2bs 10 (compress 10 (lift_array256 (subarray256 a{hr} 2)).[i-512]))); 1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Bindings_W10_t.ofintP /lift_array256 /subarray256 !mapiE 1:/# /= initiE 1:/# /=. 

rewrite /truncate64_10 to_uint_eq.
(* This is now the equivalence betwen specs. It's made slightly more verbose
   because the impl circuit is only proved correct wrt compress for values
   in the q range. *)
rewrite ultE /=. 
case (to_uint a{hr}.[i] < 3329) => /= *.
+ rewrite -Fq.compress_impl_large //=; 1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).     
  rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 
have := H0;rewrite /pos_bound768_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -Fq.compress_impl_large //=;1:by smt().
by rewrite /srl_64 /sll_64 /(`<<`) /(`>>`) !of_uintK /= /#. 

qed.



lemma auxcompress10_corr (_aw : W16.t Array768.t):
    phoare[ AuxCompress10.__i_polyvec_compress  :
             a = _aw /\
             pos_bound768_cxq a 0 768 2 ==> 
      res  = encode10_vec (compress_polyvec 10 (lift_polyvec _aw))] = 1%r 
  by conseq auxcompress10_ll (auxcompress10_corr_h _aw).


lemma polyvec_compress_avx2_ll : islossless Jkem768_avx2.M.__i_polyvec_compress.
proc. cfold 12. unroll for ^while; wp => /=. 
inline *;unroll for ^while; do 3!(unroll for ^while);auto.
qed.

lemma polyvec_compress_avx2_corr (_aw : W16.t Array768.t):
    phoare[ Jkem768_avx2.M.__i_polyvec_compress  :
             a = _aw /\
             pos_bound768_cxq a 0 768 2 ==> 
      res  = encode10_vec (compress_polyvec 10 (lift_polyvec _aw))] = 1%r.
bypr => &m [->?].
have <- : Pr[ AuxCompress10.__i_polyvec_compress(rp{m}, _aw) @ &m :
   res = encode10_vec (compress_polyvec 10 (lift_polyvec _aw))] = 1%r
   by byphoare (auxcompress10_corr _aw)  =>/=;1:smt().
byequiv (: ={arg} /\ a{1} = _aw /\
             pos_bound768_cxq a{1} 0 768 2 ==> ={res}) => //.
proc.
seq 2 2 : (={rp,a} /\ pos_bound768_cxq a{1} 0 768 1).
+ ecall {1} (polyvec_csubq_avx2_corr a{1}). 
  ecall {2} (polyvec_csubq_avx2_corr a{2}). 
  auto => />; rewrite /pos_bound768_cxq /lift_array768 /= qE /= => ? rr1.
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
have -> : 1023 = 2^10 -1 by auto.
rewrite and_mod 1:/# /= /smod /= /#.
qed.

equiv compressequivvec  : 
 Jkem768_avx2.M.__i_polyvec_compress ~  Jkem768.M.__i_polyvec_compress :
     pos_bound768_cxq a{1} 0 768 2 /\
     pos_bound768_cxq a{2} 0 768 2 /\
    lift_array768 a{1} = lift_array768 a{2} 
    ==> 
    res{2} = Array960.init (fun i => res{1}.[i]).
proc*.
print MLKEM_PolyVec.
ecall {2} (i_polyvec_compress_corr a{2}) => /=.
ecall {1} (polyvec_compress_avx2_corr a{1}).
+ auto => /> &1 &2 ??;rewrite !tP => H k kb. 
   rewrite  /encode10_vec get_of_list 1:/# initiE 1:/# /= get_of_list 1:/# /=; do 4!(congr). 
   rewrite /lift_polyvec eq_vectorP => i ib.
   rewrite tP => j jb.
   smt(liftarrayvector).
qed.
