(* -------------------------------------------------------------------- *)
require import AllCore.

(* -------------------------------------------------------------------- *)
from Jasmin require import JWord.

require import JWordExtra CircuitBindings.

(* -------------------------------------------------------------------- *)
clone export BitWordSH as W11 with
    op size <- 11
    rename "_XX" as "_11"
    proof gt0_size by done,
          size_le_256 by done.

clone WE as WE11 with
  op     size <- 11,
  theory W    <- W11 { rename "_XX" as "_11" }.

clone BSW as BSW11 with
  op     size <- 11,
  theory W    <- W11  { rename "_XX" as "_11" },
  theory WE   <- WE11 { rename "_XX" as "_11" }.

clone BS_WB_WS_U as BS_W32_W11_U with
        op sizeS <- 11,
        op sizeB <- 32,
    theory WS    <- W11  { rename "_XX" as "_11" },
    theory WSE   <- WE11,
    theory WB    <- W32  { rename "_XX" as "_32" },
    theory WBE   <- WE32,
    theory BSWS  <- BSW11,
    theory BSWB  <- BSW32

    rename "'S" as "11"
    rename "'B" as "32"

    proof le_size by done, *.

clone BS_WB_WS_U as BS_W64_W11_U with
        op sizeS <- 11,
        op sizeB <- 64,
    theory WS    <- W11  { rename "_XX" as "_11" },
    theory WSE   <- WE11,
    theory WB    <- W64  { rename "_XX" as "_64" },
    theory WBE   <- WE64,
    theory BSWS  <- BSW11,
    theory BSWB  <- BSW64

    rename "'S" as "11"
    rename "'B" as "64"

    proof le_size by done, *.
