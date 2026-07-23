(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array1152.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array1152.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 1152,
  theory A    <- Array1152.

(* -------------------------------------------------------------------- *)
clone BSA as BSA1152 with
      op size <- 1152,
  theory A    <- Array1152

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_1152u8 with
      op asize <- 1152,
      op bsize <- 8,
  theory A     <- Array1152,
  theory BSA   <- BSA1152,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.
