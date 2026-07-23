(* -------------------------------------------------------------------- *)
require import AllCore.

(* -------------------------------------------------------------------- *)
from Jasmin require import JWord.

require import JWordExtra CircuitBindings.

(* -------------------------------------------------------------------- *)
clone export BitWordSH as W10 with
    op size <- 10
    rename "_XX" as "_10"
    proof gt0_size by done,
          size_le_256 by done.

clone WE as WE10 with
  op     size <- 10,
  theory W    <- W10 { rename "_XX" as "_10" }.

clone BSW as BSW10 with
  op     size <- 10,
  theory W    <- W10  { rename "_XX" as "_10" },
  theory WE   <- WE10 { rename "_XX" as "_10" }.

clone BS_WB_WS_U as BS_W32_W10_U with
        op sizeS <- 10,
        op sizeB <- 32,
    theory WS    <- W10  { rename "_XX" as "_10" },
    theory WSE   <- WE10,
    theory WB    <- W32  { rename "_XX" as "_32" },
    theory WBE   <- WE32,
    theory BSWS  <- BSW10,
    theory BSWB  <- BSW32

    rename "'S" as "10"
    rename "'B" as "32"

    proof le_size by done, *.

clone BS_WB_WS_U as BS_W64_W10_U with
        op sizeS <- 10,
        op sizeB <- 64,
    theory WS    <- W10  { rename "_XX" as "_10" },
    theory WSE   <- WE10,
    theory WB    <- W64  { rename "_XX" as "_64" },
    theory WBE   <- WE64,
    theory BSWS  <- BSW10,
    theory BSWB  <- BSW64

    rename "'S" as "10"
    rename "'B" as "64"

    proof le_size by done, *.
