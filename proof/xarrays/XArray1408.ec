(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array1408.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array1408.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 1408,
  theory A    <- Array1408.

(* -------------------------------------------------------------------- *)
clone BSA as BSA1408 with
      op size <- 1408,
  theory A    <- Array1408

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_1408u8 with
      op asize <- 1408,
      op bsize <- 8,
  theory A     <- Array1408,
  theory BSA   <- BSA1408,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.
