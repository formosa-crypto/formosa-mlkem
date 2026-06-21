(* -------------------------------------------------------------------- *)
require import AllCore.

(* -------------------------------------------------------------------- *)
from Jasmin require import JWord.

require import JWordExtra CircuitBindings.

(* -------------------------------------------------------------------- *)
clone export BitWordSH as W4 with
    op size <- 4
    rename "_XX" as "_4"
    proof gt0_size by done,
          size_le_256 by done.

clone WE as WE4 with
  op     size <- 4,
  theory W    <- W4 { rename "_XX" as "_4" }.

clone BSW as BSW4 with
  op     size <- 4,
  theory W    <- W4  { rename "_XX" as "_4" },
  theory WE   <- WE4 { rename "_XX" as "_4" }.

clone BS_WB_WS_U as BS_W32_W4_U with
        op sizeS <- 4,
        op sizeB <- 32,
    theory WS    <- W4  { rename "_XX" as "_4" },
    theory WSE   <- WE4,
    theory WB    <- W32  { rename "_XX" as "_32" },
    theory WBE   <- WE32,
    theory BSWS  <- BSW4,
    theory BSWB  <- BSW32

    rename "'S" as "4"
    rename "'B" as "32"

    proof le_size by done, *.
