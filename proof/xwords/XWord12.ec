(* -------------------------------------------------------------------- *)
require import AllCore.

(* -------------------------------------------------------------------- *)
from Jasmin require import JWord.

require import JWordExtra CircuitBindings CircuitBindingsExtra.

(* -------------------------------------------------------------------- *)
clone export BitWordSH as W12 with
    op size <- 12
    rename "_XX" as "_12"
    proof gt0_size by done,
          size_le_256 by done.

clone WE as WE12 with
  op     size <- 12,
  theory W    <- W12 { rename "_XX" as "_12" }.

clone BSW as BSW12 with
  op     size <- 12,
  theory W    <- W12  { rename "_XX" as "_12" },
  theory WE   <- WE12 { rename "_XX" as "_12" }.

clone BS_WB_WS_U as BS_W16_W12_U with
        op sizeS <- 12,
        op sizeB <- 16,
    theory WS    <- W12  { rename "_XX" as "_12" },
    theory WSE   <- WE12,
    theory WB    <- W16  { rename "_XX" as "_16" },
    theory WBE   <- WE16,
    theory BSWS  <- BSW12,
    theory BSWB  <- BSW16

    rename "'S" as "12"
    rename "'B" as "16"

    proof le_size by done, *.

clone export ZExtend as ZExtend_12_16
  with op isize <- 12, op osize <- 16, theory IW <- W12, theory OW <- W16
  rename "XX" as "12_16"
  proof gt0_isize by done, gt0_osize by done, le_iosize by done.
bind op [W12.t & W16.t] zextend_12_16 "zextend".
realize bvzextendP by move=> ?; apply/eq_sym/ZExtend_12_16.zextend_12_16P.
realize le_size by auto.
