(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array56.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array56.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 56,
  theory A    <- Array56.

(* -------------------------------------------------------------------- *)
clone BSA as BSA56 with
      op size <- 56,
  theory A    <- Array56
  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_56u8 with
      op asize <- 56,
      op bsize <- 8,
  theory A     <- Array56,
  theory BSA   <- BSA56,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.
