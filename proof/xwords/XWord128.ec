(* -------------------------------------------------------------------- *)
require import AllCore IntDiv List.
from Jasmin require import JModel.
require import CircuitBindingsExtra.
import BitEncoding.

clone export ZExtend as ZExtend_64_128
  with op isize <- 64, op osize <- 128, theory IW <- W64, theory OW <- W128
  rename "XX" as "64_128"
  proof gt0_isize by done, gt0_osize by done, le_iosize by done.
bind op [W64.t & W128.t] zextend_64_128 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/zextend_64_128P.
realize le_size by auto.
