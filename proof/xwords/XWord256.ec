(* -------------------------------------------------------------------- *)
require import AllCore IntDiv List StdBigop StdOrder.
from Jasmin require import JModel.
require import CircuitBindings CircuitBindingsExtra.
import BitEncoding BS2Int.

bind op [W256.t & W128.t] W2u128.truncateu128 "truncate".
realize bvtruncateP.
move => mv; rewrite /truncateu128 /W256.w2bits take_mkseq 1:// /= /w2bits.
apply (eq_from_nth witness);1: by smt(size_mkseq).
move => i; rewrite size_mkseq /= /max /= => ib.
rewrite !nth_mkseq 1..2:// /of_int /to_uint /= get_bits2w 1://
        nth_mkseq 1:// /= get_to_uint /= /to_uint /=.
have -> /=: (0 <= i && i < 256) by smt().
pose a := bs2int (w2bits mv).
rewrite {1}(divz_eq a (2^(128-i)*2^i)) !mulrA divzMDl;
   1: by smt(StdOrder.IntOrder.expr_gt0).
rewrite dvdz_modzDl; 1: by
 have ->  : 2^(128-i) = 2^((128-i-1)+1); [ by smt() |
    rewrite exprS 1:/#; smt(dvdz_mull dvdz_mulr)].
by have -> : (2 ^ (128 - i) * 2 ^ i) = 340282366920938463463374607431768211456;
  [ rewrite -StdBigop.Bigint.Num.Domain.exprD_nneg
     1,2:/# /= -!addrA /= | done ].
qed.
realize le_size by done.

clone export ZExtend as ZExtend_64_256
  with op isize <- 64, op osize <- 256, theory IW <- W64, theory OW <- W256
  rename "XX" as "64_256"
  proof gt0_isize by done, gt0_osize by done, le_iosize by done.
bind op [W64.t & W256.t] zextend_64_256 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/zextend_64_256P.
realize le_size by auto.
