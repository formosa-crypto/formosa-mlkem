(* -------------------------------------------------------------------- *)
require import AllCore IntDiv List.
from Jasmin require import JModel.
require import CircuitBindingsExtra.
import BitEncoding.

clone export ZExtend as ZExtend_8_64
  with op isize <- 8, op osize <- 64, theory IW <- W8, theory OW <- W64
  rename "XX" as "8_64"
  proof gt0_isize by done, gt0_osize by done, le_iosize by done.
bind op [W8.t & W64.t] zextend_8_64 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/zextend_8_64P.
realize le_size by auto.
