(* -------------------------------------------------------------------- *)
require import AllCore.

(* -------------------------------------------------------------------- *)
from Jasmin require import JWord.

require import JWordExtra CircuitBindings.

(* -------------------------------------------------------------------- *)
clone export BitWordSH as W5 with
    op size <- 5
    rename "_XX" as "_5"
    proof gt0_size by done,
          size_le_256 by done.

clone WE as WE5 with
  op     size <- 5,
  theory W    <- W5 { rename "_XX" as "_5" }.

clone BSW as BSW5 with
  op     size <- 5,
  theory W    <- W5  { rename "_XX" as "_5" },
  theory WE   <- WE5 { rename "_XX" as "_5" }.

clone BS_WB_WS_U as BS_W32_W5_U with
        op sizeS <- 5,
        op sizeB <- 32,
    theory WS    <- W5  { rename "_XX" as "_5" },
    theory WSE   <- WE5,
    theory WB    <- W32  { rename "_XX" as "_32" },
    theory WBE   <- WE32,
    theory BSWS  <- BSW5,
    theory BSWB  <- BSW32

    rename "'S" as "5"
    rename "'B" as "32"

    proof le_size by done, *.
