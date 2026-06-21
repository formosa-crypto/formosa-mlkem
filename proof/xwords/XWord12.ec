(* -------------------------------------------------------------------- *)
require import AllCore.

(* -------------------------------------------------------------------- *)
from Jasmin require import JWord.

require import JWordExtra CircuitBindings.

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

(* compat lemma: filters use zextend_12_16P (to_uint preservation). *)
lemma zextend_12_16P (w : W12.t) :
  W16.to_uint (BS_W16_W12_U.zeroextu16 w) = W12.to_uint w.
proof. rewrite /BS_W16_W12_U.zeroextu16 W16.of_uintK; have := W12.to_uint_cmp w; smt(). qed.
