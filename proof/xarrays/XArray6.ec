(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array6.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array6.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 6,
  theory A    <- Array6.

(* -------------------------------------------------------------------- *)
clone BSA as BSA6 with
      op size <- 6,
  theory A    <- Array6

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_6u256 with
      op asize <- 6,
      op bsize <- 256,
  theory A     <- Array6,
  theory BSA   <- BSA6,
  theory W     <- W256 { rename "_XX" as "_256" },
  theory WE    <- WE256,
  theory BSW   <- BSW256.
