(* -------------------------------------------------------------------- *)
(* Concrete direct-index filter clones (SliceGet/SliceSet/ZExtend from    *)
(* CircuitBindingsExtra). Direct-index defs so the bdep `circuit` tactic   *)
(* bit-blasts them on symbolic inputs (BSWAS would need a get_direct       *)
(* bridge the filters don't have). Leaf file (no cycle with XArray32).     *)
(* -------------------------------------------------------------------- *)
require import AllCore IntDiv List.
from Jasmin require import JModel.
require import CircuitBindingsExtra XWord12.
require import XArray16 XArray24 XArray32 XArray40 XArray48 XArray56 XArray2048.
from JazzEC require import Array16 Array24 Array32 Array40 Array48 Array56 Array2048.
import BitEncoding.

(* ==================================================================== *)
(* DIAGNOSTIC A/B: explicit concrete init ops (mirroring the original    *)
(* mlkem_bindings init_arrayN_wM ops), explicitly bound to "ainit". Used  *)
(* to test whether BSWA init lowers differently than these.              *)
(* ==================================================================== *)
op init_array16_w16 (f : int -> W16.t) = Array16.init f.
bind op [W16.t & Array16.t] init_array16_w16 "ainit".
realize bvainitP.
proof. move=> f @/init_array16_w16; rewrite BVA_Top_Array16_Array16_t.tolistP.
by apply: eq_in_mkseq => i ? /=; rewrite Array16.initE ifT. qed.

op init_array24_w8 (f : int -> W8.t) = Array24.init f.
bind op [W8.t & Array24.t] init_array24_w8 "ainit".
realize bvainitP.
proof. move=> f @/init_array24_w8; rewrite BVA_Top_Array24_Array24_t.tolistP.
by apply: eq_in_mkseq => i ? /=; rewrite Array24.initE ifT. qed.

(* ---- sliceget (bound to asliceget; direct-index, bdep-friendly) ---- *)
(* [W8 & W256 & Array32] asliceget: a SECOND operator bound to the same      *)
(* "asliceget" circuit as the core's BSWAS_32u8_256.sliceget. Binding is     *)
(* per-operator, so this coexists. The filter program packs the symbolic     *)
(* buf via this direct-index sliceget (matching the original circuit), NOT   *)
(* the a2b u8_256_32 (different circuit).                                     *)
clone export SliceGet as SliceGet_8_256_32
  with op isize <- 8, op osize <- 256, op asize <- 32,
  theory IW <- W8, theory OW <- W256, theory A <- Array32
  rename "XX" as "8_256_32"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.
bind op [W8.t & W256.t & Array32.t] sliceget_8_256_32 "asliceget".
realize bvaslicegetP by apply/sliceget_8_256_32P.
realize le_size by auto.

clone export SliceGet as SliceGet_8_12_24
  with op isize <- 8, op osize <- 12, op asize <- 24,
  theory IW <- W8, theory OW <- W12, theory A <- Array24
  rename "XX" as "8_12_24"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.
bind op [W8.t & W12.t & Array24.t] sliceget_8_12_24 "asliceget".
realize bvaslicegetP by apply/sliceget_8_12_24P.
realize le_size by auto.

clone export SliceGet as SliceGet_8_12_48
  with op isize <- 8, op osize <- 12, op asize <- 48,
  theory IW <- W8, theory OW <- W12, theory A <- Array48
  rename "XX" as "8_12_48"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.
bind op [W8.t & W12.t & Array48.t] sliceget_8_12_48 "asliceget".
realize bvaslicegetP by apply/sliceget_8_12_48P.
realize le_size by auto.

clone export SliceGet as SliceGet_8_256_56
  with op isize <- 8, op osize <- 256, op asize <- 56,
  theory IW <- W8, theory OW <- W256, theory A <- Array56
  rename "XX" as "8_256_56"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.
bind op [W8.t & W256.t & Array56.t] sliceget_8_256_56 "asliceget".
realize bvaslicegetP by apply/sliceget_8_256_56P.
realize le_size by auto.

clone export SliceGet as SliceGet_8_64_2048
  with op isize <- 8, op osize <- 64, op asize <- 2048,
  theory IW <- W8, theory OW <- W64, theory A <- Array2048
  rename "XX" as "8_64_2048"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.
bind op [W8.t & W64.t & Array2048.t] sliceget_8_64_2048 "asliceget".
realize bvaslicegetP by apply/sliceget_8_64_2048P.
realize le_size by auto.

(* ---- sliceset (no bind; used in postconditions only) ---- *)
clone export SliceSet as SliceSet_16_128_16
  with op isize <- 16, op osize <- 128, op asize <- 16,
  theory IW <- W16, theory OW <- W128, theory A <- Array16
  rename "XX" as "16_128_16"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.

clone export SliceSet as SliceSet_16_128_40
  with op isize <- 16, op osize <- 128, op asize <- 40,
  theory IW <- W16, theory OW <- W128, theory A <- Array40
  rename "XX" as "16_128_40"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.

(* ---- zextend (bit-copy; bound to zextend except 12_16 which would     *)
(*      clash with XWord12's BS_W16_W12_U — kept unbound for post use)    *)
clone export ZExtend as ZExtend_8_64
  with op isize <- 8, op osize <- 64, theory IW <- W8, theory OW <- W64
  rename "XX" as "8_64"
  proof gt0_isize by done, gt0_osize by done, le_iosize by done.
bind op [W8.t & W64.t] zextend_8_64 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/zextend_8_64P.
realize le_size by auto.

clone export ZExtend as ZExtend_64_128
  with op isize <- 64, op osize <- 128, theory IW <- W64, theory OW <- W128
  rename "XX" as "64_128"
  proof gt0_isize by done, gt0_osize by done, le_iosize by done.
bind op [W64.t & W128.t] zextend_64_128 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/zextend_64_128P.
realize le_size by auto.

clone export ZExtend as ZExtend_64_256
  with op isize <- 64, op osize <- 256, theory IW <- W64, theory OW <- W256
  rename "XX" as "64_256"
  proof gt0_isize by done, gt0_osize by done, le_iosize by done.
bind op [W64.t & W256.t] zextend_64_256 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/zextend_64_256P.
realize le_size by auto.

(* [W12 & W16] zextend: a SECOND operator (bit-copy def) bound to the same   *)
(* "zextend" circuit as the core's BS_W16_W12_U.zeroextu16. Binding is        *)
(* per-operator, so this coexists with the core's bind. The filters' post     *)
(* circuits need this bit-copy def (matching extract_256_16's bit-copy), not  *)
(* the arithmetic zeroextu16 def. Qualified P-lemma avoids clashing with      *)
(* XWord12's same-named compat lemma.                                         *)
clone export ZExtend as ZExtend_12_16
  with op isize <- 12, op osize <- 16, theory IW <- W12, theory OW <- W16
  rename "XX" as "12_16"
  proof gt0_isize by done, gt0_osize by done, le_iosize by done.
bind op [W12.t & W16.t] zextend_12_16 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/ZExtend_12_16.zextend_12_16P.
realize le_size by auto.
