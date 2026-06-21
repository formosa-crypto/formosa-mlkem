(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array7.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array7.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 7,
  theory A    <- Array7.

(* -------------------------------------------------------------------- *)
clone BSA as BSA7 with
      op size <- 7,
  theory A    <- Array7

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_7u256 with
      op asize <- 7,
      op bsize <- 256,
  theory A     <- Array7,
  theory BSA   <- BSA7,
  theory W     <- W256 { rename "_XX" as "_256" },
  theory WE    <- WE256,
  theory BSW   <- BSW256.
