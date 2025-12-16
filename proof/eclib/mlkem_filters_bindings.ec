(* -------------------------------------------------------------------- *)
(* ----- *) require import AllCore IntDiv List.
from Jasmin require import JModel.
require export Mlkem_bindings.
(* ----- *) require import Genbindings.
(* ----- *) (* - *) import W8.

(* taken from "proof/eclib/bindings.ec" (commented there, to avoid perfomance issues)
   Note however that those issues appear to have been already addressed by "irreducible branch"
   But the W512 theory is not standard after all (for AVX2), reason why we keep it here.

  TODO: move relevant parts to "Bindings@CryptoSpecs".
 *)
theory W512.
  abbrev [-printing] size = 512.
  clone include BitWord with op size <- size
  rename "_XX" as "_256"
  proof gt0_size by done.
end W512.

import W512.
import BitEncoding BS2Int.

bind bitstring W512.w2bits W512.bits2w W512.to_uint W512.to_sint W512.of_int W512.t 512.
realize size_tolist by auto.
realize tolistP     by auto.
realize oflistP     by smt(W512.bits2wK).
realize ofintP      by move=> *; rewrite /of_int int2bs_mod.
realize touintP     by smt().

realize tosintP.
proof.
move=> bv /= @/to_sint @/smod @/msb.
rewrite (_ : nth _ _ _ = 2 ^ (512 - 1) <= to_uint bv) -1:/#.
rewrite /to_uint -{2}(cat_take_drop 511 (w2bits bv)).
rewrite bs2int_cat size_take ~-1:// W512.size_w2bits /=.
rewrite -bs2int_div ~-1:// /= get_to_uint ~-1:// /=.
rewrite -bs2int_mod ~-1:// /= /to_uint.
have ?: W512.modulus = 13407807929942597099574024998205846127479365820592393377723561443721764030073546976801874298166903427690031858186486050853753882811946569946433649006084096 by done.
by smt(bs2int_range mem_range W512.size_w2bits).
qed.

realize gt0_size by auto.

(* -------------------------------------------------------------------- *)
clone export WordChunk as WordChunk_16_256
  with op isize <- 16, op osize <- 256,
  theory IW <- W16, theory OW <- W256
  rename "XX" as "16_256"
  proof gt0_isize by done, gt0_osize by done, le_iosize by done.

(* -------------------------------------------------------------------- *)
clone export WordChunk as WordChunk_16_512
  with op isize <- 16, op osize <- 512,
  theory IW <- W16, theory OW <- W512
  rename "XX" as "16_512"
  proof gt0_isize by done, gt0_osize by done, le_iosize by done.

(* -------------------------------------------------------------------- *)
clone export Extract as Extract_512_16
  with op isize  <- 512,
       op osize  <-  16,
       theory IW <- W512,
       theory OW <- W16
       rename "XX" as "512_16"
       proof gt0_isize by done
       proof gt0_osize by done.

bind op [W512.t & W16.t] extract_512_16 "extract".
realize bvextractP by exact/extract_512_16P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
op concat_2u256 (l h : W256.t) = W512.init (fun i => (nth W256.zero [l; h] (i %/ 256)).[i %% 256]).

lemma w2bits_concat_2u256 (w1 w2 : W256.t) :
  w2bits (concat_2u256 w1 w2) = flatten [w2bits w1; w2bits w2].
proof.
rewrite flatten_cons flatten1; apply/(eq_from_nth false).
- by rewrite size_cat !size_w2bits.
rewrite size_w2bits => i rgi; rewrite nth_cat !get_w2bits !size_w2bits.
by rewrite /concat_2u256 initE /#.
qed.

bind op [W256.t & W256.t & W512.t] concat_2u256 "concat".
realize bvconcatP.
proof.
move=> l h; have := w2bits_concat_2u256 l h.
by rewrite flatten_cons flatten1.
qed.

realize eq_size by auto.

(* ----- *)

from JazzEC require import Array2048 Array256 Array64 Array56 Array48 Array40 Array32 Array24 Array16.

(* -------------------------------------------------------------------- *)
abbrev "_.[_]" ['a] = nth<:'a> witness.

(* -------------------------------------------------------------------- *)
clone export A2B as A2B_8_256_32
  with op isize <- 8, op osize <- 256, op asize <- 32,
  theory IW <- W8, theory OW <- W256, theory A <- Array32
  rename "XX" as "8_256_32"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done, eq by done.

bind op [W256.t & W8.t & Array32.t] u8_256_32 "a2b".
realize a2bP by apply/u8_256_32P.
realize size_ok by auto.

(* -------------------------------------------------------------------- *)
bind array Array2048."_.[_]" Array2048."_.[_<-_]" Array2048.to_list Array2048.of_list Array2048.t 2048.
realize tolistP  by done.
realize get_setP by smt(Array2048.get_setE). 
realize eqP      by smt(Array2048.tP).
realize get_out  by smt(Array2048.get_out).
realize gt0_size by auto.

(* -------------------------------------------------------------------- *)
bind array Array56."_.[_]" Array56."_.[_<-_]" Array56.to_list Array56.of_list Array56.t 56.
realize tolistP  by done.
realize get_setP by smt(Array56.get_setE). 
realize eqP      by smt(Array56.tP).
realize get_out  by smt(Array56.get_out).
realize gt0_size by auto.

(* -------------------------------------------------------------------- *)
bind array Array64."_.[_]" Array64."_.[_<-_]" Array64.to_list Array64.of_list Array64.t 64.
realize tolistP  by done.
realize get_setP by smt(Array64.get_setE). 
realize eqP      by smt(Array64.tP).
realize get_out  by smt(Array64.get_out).
realize gt0_size by auto.


(* -------------------------------------------------------------------- *)
clone export SliceGet as SliceGet_8_256_32
  with op isize <- 8, op osize <- 256, op asize <- 32,
  theory IW <- W8, theory OW <- W256, theory A <- Array32
  rename "XX" as "8_256_32"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.

bind op [W8.t & W256.t & Array32.t] sliceget_8_256_32 "asliceget".
realize bvaslicegetP by apply/sliceget_8_256_32P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export SliceGet as SliceGet_8_256_56
  with op isize <- 8, op osize <- 256, op asize <- 56,
  theory IW <- W8, theory OW <- W256, theory A <- Array56
  rename "XX" as "8_256_56"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.

bind op [W8.t & W256.t & Array56.t] sliceget_8_256_56 "asliceget".
realize bvaslicegetP by apply/sliceget_8_256_56P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export SliceGet as SliceGet_8_12_48
  with op isize <- 8, op osize <- 12, op asize <- 48,
  theory IW <- W8, theory OW <- W12, theory A <- Array48
  rename "XX" as "8_12_48"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.

bind op [W8.t & W12.t & Array48.t] sliceget_8_12_48 "asliceget".
realize bvaslicegetP by apply/sliceget_8_12_48P.
realize le_size by auto.


(* -------------------------------------------------------------------- *)
clone export SliceGet as SliceGet_8_12_32
  with op isize <- 8, op osize <- 12, op asize <- 32,
  theory IW <- W8, theory OW <- W12, theory A <- Array32
  rename "XX" as "8_12_32"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.

bind op [W8.t & W12.t & Array32.t] sliceget_8_12_32 "asliceget".
realize bvaslicegetP by apply/sliceget_8_12_32P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export SliceGet as SliceGet_8_12_24
  with op isize <- 8, op osize <- 12, op asize <- 24,
  theory IW <- W8, theory OW <- W12, theory A <- Array24
  rename "XX" as "8_12_24"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.

bind op [W8.t & W12.t & Array24.t] sliceget_8_12_24 "asliceget".
realize bvaslicegetP by apply/sliceget_8_12_24P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export SliceGet as SliceGet_8_12_56
  with op isize <- 8, op osize <- 12, op asize <- 56,
  theory IW <- W8, theory OW <- W12, theory A <- Array56
  rename "XX" as "8_12_56"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.

bind op [W8.t & W12.t & Array56.t] sliceget_8_12_56 "asliceget".
realize bvaslicegetP by apply/sliceget_8_12_56P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export SliceGet as SliceGet_8_64_2048
  with op isize <- 8, op osize <- 64, op asize <- 2048,
  theory IW <- W8, theory OW <- W64, theory A <- Array2048
  rename "XX" as "8_64_2048"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.

bind op [W8.t & W64.t & Array2048.t] sliceget_8_64_2048 "asliceget".
realize bvaslicegetP by apply/sliceget_8_64_2048P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export SliceSet as SliceSet_16_128_16
  with op isize <- 16, op osize <- 128, op asize <- 16,
  theory IW <- W16, theory OW <- W128, theory A <- Array16
  rename "XX" as "16_128_16"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.

(* -------------------------------------------------------------------- *)
clone export SliceSet as SliceSet_16_128_40
  with op isize <- 16, op osize <- 128, op asize <- 40,
  theory IW <- W16, theory OW <- W128, theory A <- Array40
  rename "XX" as "16_128_40"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.


(* -------------------------------------------------------------------- *)
clone export Extract as Extract_256_128
  with op isize  <- 256,
       op osize  <- 128,
       theory IW <- W256,
       theory OW <- W128
       rename "XX" as "256_128"
       proof gt0_isize by done
       proof gt0_osize by done.

bind op [W256.t & W128.t] extract_256_128 "extract".
realize bvextractP by exact/extract_256_128P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export Extract as Extract_256_16
  with op isize  <- 256,
       op osize  <-  16,
       theory IW <- W256,
       theory OW <- W16
       rename "XX" as "256_16"
       proof gt0_isize by done
       proof gt0_osize by done.

bind op [W256.t & W16.t] extract_256_16 "extract".
realize bvextractP by exact/extract_256_16P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export Extract as Extract_128_16
  with op isize  <- 128,
       op osize  <-  16,
       theory IW <- W128,
       theory OW <- W16
       rename "XX" as "128_16"
       proof gt0_isize by done
       proof gt0_osize by done.

bind op [W128.t & W16.t] extract_128_16 "extract".
realize bvextractP by exact/extract_128_16P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export Extract as Extract_64_8
  with op isize  <- 64,
       op osize  <-  8,
       theory IW <- W64,
       theory OW <- W8
       rename "XX" as "64_8"
       proof gt0_isize by done
       proof gt0_osize by done.

bind op [W64.t & W8.t] extract_64_8 "extract".
realize bvextractP by exact/extract_64_8P.
realize le_size by auto.


(* -------------------------------------------------------------------- *)
op concat_2u128 (l h : W128.t) = W2u128.pack2 [l; h].

bind op [W128.t & W128.t & W256.t] concat_2u128 "concat".

realize bvconcatP.
proof.
move=> w1 w2; apply/(eq_from_nth false); first by rewrite size_cat !size_w2bits.
rewrite size_w2bits => i rgi; rewrite nth_cat !get_w2bits !size_w2bits.
by rewrite /concat_2u128 pack2wE 1:// get_of_list /#.
qed.
realize eq_size by auto.

(* -------------------------------------------------------------------- *)
clone export ZExtend as ZExtend_8_64
  with op isize  <-  8,
       op osize  <- 64,
       theory IW <- W8,
       theory OW <- W64
       rename "XX" as "8_64"
       proof gt0_isize by done
       proof gt0_osize by done
       proof le_iosize by done.

bind op [W8.t & W64.t] zextend_8_64 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/zextend_8_64P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export ZExtend as ZExtend_12_16
  with op isize  <- 12,
       op osize  <- 16,
       theory IW <- W12,
       theory OW <- W16
       rename "XX" as "12_16"
       proof gt0_isize by done
       proof gt0_osize by done
       proof le_iosize by done.

bind op [W12.t & W16.t] zextend_12_16 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/zextend_12_16P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export ZExtend as ZExtend_64_256
  with op isize  <- 64,
       op osize  <- 256,
       theory IW <- W64,
       theory OW <- W256
       rename "XX" as "64_256"
       proof gt0_isize by done
       proof gt0_osize by done
       proof le_iosize by done.

bind op [W64.t & W256.t] zextend_64_256 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/zextend_64_256P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
clone export ZExtend as ZExtend_64_128
  with op isize  <- 64,
       op osize  <- 128,
       theory IW <- W64,
       theory OW <- W128
       rename "XX" as "64_128"
       proof gt0_isize by done
       proof gt0_osize by done
       proof le_iosize by done.

bind op [W64.t & W128.t] zextend_64_128 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/zextend_64_128P.
realize le_size by auto.

(* -------------------------------------------------------------------- *)
op popcount_64 (w : W64.t) : W64.t =
  (POPCNT_64 w).`6.

lemma popcount_64E (w : W64.t) :
  (POPCNT_64 w).`6 = popcount_64 w.
proof. done. qed.

(* -------------------------------------------------------------------- *)
op shiftr64 (w1 w2 : W64.t) = w1 `>>>` W64.to_uint w2.

bind op [W64.t] shiftr64 "shr".

realize bvshrP.
proof. by move=> w1 w2 @/shiftr64; rewrite to_uint_shr 1:#smt:(W64.to_uint_cmp). qed.

(* -------------------------------------------------------------------- *)
op shift64R (w : W64.t) (i : W8.t) =
  shiftr64 w (zextend_8_64 i).

lemma shift64RE (w : W64.t) (i : W8.t) : w `>>` i = shift64R w i.
proof.
by rewrite /shift64R /shiftr64 zextend_8_64P /(`>>`).
qed.

(* -------------------------------------------------------------------- *)
op VPINC_8u8 : W64.t -> W64.t.

(* -------------------------------------------------------------------- *)
op VPUNPCKL_16u8 : W64.t -> W64.t -> W128.t.


(* -------------------------------------------------------------------- *)
bind circuit
 VPSRL_16u16    <-   "VPSRL_16u16",
 VPBLENDW_256   <-   "VPBLEND_16u16",
 VPSHUFB_256    <-   "VPSHUFB_256",
 VINSERTI128    <-   "VPINSERTI128",
 VEXTRACTI128   <-   "VPEXTRACTI128",
 VPERMQ         <-   "VPERMQ",
 VPADD_32u8     <-   "VPADD_32u8",
 VPUNPCKL_32u8  <-   "VPUNPCKL_32u8",
 VPSHUFB_128    <-   "VPSHUFB_128",
 VPCMPGT_16u16  <-   "VPCMPGT_16u16",
 VPACKSS_16u16  <-   "VPACKSS_16u16",
 VPUNPCKL_16u8  <- "VPUNPCKL_16u8",
 VPINC_8u8      <- "VPINC_8u8" 
  from "/usr/local/lib/easycrypt/config/avx2.spec".

from JazzEC require import Array16.
op init_array16_w16(f : int -> W16.t) = Array16.init f.
bind op [W16.t & Array16.t] init_array16_w16 "ainit".
realize bvainitP by admit.

from JazzEC require import Array24.
op init_array24_w8(f : int -> W8.t) = Array24.init f.
bind op [W8.t & Array24.t] init_array24_w8 "ainit".
realize bvainitP by admit.

bind op [bool & W16.t] W16.init "init".
realize size_1 by auto.
realize bvinitP by admit.
