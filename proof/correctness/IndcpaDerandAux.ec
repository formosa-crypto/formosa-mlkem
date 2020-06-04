require import List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.

require import Array4 Array5 Array24 Array25 Array32 Array33 Array34 Array64
               Array128 Array168 Array256 Array768.
require import WArray20 WArray32 WArray33 WArray34 WArray40 WArray64
               WArray128 WArray168 WArray192 WArray200 WArray256 WArray512
               WArray1536.

lemma formula x :
  0 <= x < 4294967296 =>
    x %% 256 = x %% 65536 %% 256.
proof. smt tmo=60. qed.
(* proved in Why3 *)
(*why3 prove example.mlw -P alt-ergo -t=0*)

lemma truncate8_16K (a : W32.t) : truncateu8 a = truncateu8 (truncateu16 a).
proof.
rewrite wordP => k *.
rewrite /truncateu8 !of_intE.
rewrite (BitEncoding.BS2Int.bs2int_eq 8 (to_uint a %% W8.modulus) (to_uint ((bits2w ((BitEncoding.BS2Int.int2bs 16 (to_uint a %% W16.modulus)))%BitEncoding.BS2Int))%W16 %% W8.modulus)) 1,2:/#.
by rewrite -of_intE of_uintK !modz_mod formula; first by rewrite to_uint_cmp.
by done.
qed.

axiom formula2 (x k : int) :
  0 <= k < 16 => 0 <= x < 4294967296 => 
  x * 16 %% 4294967296 %% 65536 %/ 2 ^ k %% 2 = 0.
(* proved in Why3 *)

axiom formula3 (x k : int) :
  4 <= k < 16 => 0 <= x < 4294967296 => 
  x %% 65536 %/ 2 ^ (k-4) %% 2 = 0.
(* proved in Why3 *)

lemma truncate16_wlslE (a : W32.t) : 
  truncateu16 (a `<<` (of_int 4)%W8) = truncateu16 a `<<` (of_int 4)%W8.
proof.
rewrite wordP => k *.
rewrite /(`<<`).
rewrite shlwE.
rewrite of_uintK.
rewrite pmod_small.
done.
rewrite pmod_small.
done.

rewrite /truncateu16.
rewrite !of_intE.



rewrite get_bits2w.
done.
rewrite /int2bs.
rewrite !nth_mkseq.
done.
simplify.
rewrite H. simplify.
rewrite bits2wE.
rewrite initE.

case (k < 4) => ?.
cut ->: 0 <= k - 4 < 16 <=> false. smt().
simplify.
rewrite to_uint_shl.
done.
simplify.
rewrite formula2.
smt().
rewrite to_uint_cmp.
done.

case (k < 8) => ?.
cut ->: 0 <= k - 4 < 16.
smt().
simplify.
rewrite nth_mkseq.
smt().
simplify.
rewrite to_uint_shl.
done.
simplify.

rewrite formula2.
smt().
rewrite to_uint_cmp.
rewrite formula3.
smt().
rewrite to_uint_cmp.
done.

case (k < 12) => ?.
cut ->: 0 <= k - 4 < 16.
smt().
simplify.
rewrite nth_mkseq.
smt().
simplify.
rewrite to_uint_shl.
done.
simplify.

rewrite formula2.
smt().
rewrite to_uint_cmp.
rewrite formula3.
smt().
rewrite to_uint_cmp.
done.

case (k < 16) => ?.
cut ->: 0 <= k - 4 < 16.
smt().
simplify.
rewrite nth_mkseq.
smt().
simplify.
rewrite to_uint_shl.
done.
simplify.

rewrite formula2.
smt().
rewrite to_uint_cmp.
rewrite formula3.
smt().
rewrite to_uint_cmp.
done.

smt().
qed.

axiom formula4 (x k : int) :
  0 <= k < 16 => 0 <= x < 4294967296 => 
  x %% 65536 %/ 2 ^ k %% 2 = 0.
(* proved in Why3 *)

lemma truncate16_orw (a b : W32.t) : truncateu16 (a `|` b) = (truncateu16 a `|` truncateu16 b).
proof.
rewrite wordP => k *.
rewrite /truncateu16.
rewrite of_intE.
rewrite get_bits2w.
done.
rewrite /int2bs.
rewrite nth_mkseq.
done.
simplify.

rewrite of_intE.
rewrite get_bits2w.
done.
rewrite /int2bs.
rewrite nth_mkseq.
done.
simplify.

rewrite of_intE.
rewrite get_bits2w.
done.
rewrite /int2bs.
rewrite nth_mkseq.
done.
simplify.

rewrite formula4.
done.
rewrite to_uint_cmp.
rewrite formula4.
done.
rewrite to_uint_cmp.
rewrite formula4.
done.
rewrite to_uint_cmp.
done.
qed.
