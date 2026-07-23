(* -------------------------------------------------------------------- *)
(* W512 is wider than 256, so it does NOT fit the BitWordSH/BSW/BS_WB_WS  *)
(* machinery of CircuitBindings (those require size <= 256). It is a      *)
(* plain BitWord + `bind bitstring`; its extract/concat/chunk go through  *)
(* the WBits-based theories in CircuitBindingsExtra. (Ported verbatim     *)
(* from the deleted mlkem_filters_bindings.ec.)                           *)
(* -------------------------------------------------------------------- *)
require import AllCore IntDiv List.
from Jasmin require import JModel.
require import CircuitBindings CircuitBindingsExtra.

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
(* W512-involving extract/concat (same op names the filters use).        *)
clone export Extract as Extract_512_16
  with op isize <- 512, op osize <- 16, theory IW <- W512, theory OW <- W16
  rename "XX" as "512_16"
  proof gt0_isize by done, gt0_osize by done.
bind op [W512.t & W16.t] extract_512_16 "extract".
realize bvextractP by exact/extract_512_16P.
realize le_size by auto.

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
