(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings XWord12.
from JazzEC require import Array48.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array48.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 48,
  theory A    <- Array48.

(* -------------------------------------------------------------------- *)
clone BSA as BSA48 with
      op size <- 48,
  theory A    <- Array48

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_48u8 with
      op asize <- 48,
      op bsize <- 8,
  theory A     <- Array48,
  theory BSA   <- BSA48,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.
