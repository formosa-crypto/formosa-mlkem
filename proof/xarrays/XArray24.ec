(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings XWord12.
from JazzEC require import Array24.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array24.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 24,
  theory A    <- Array24.

(* -------------------------------------------------------------------- *)
clone BSA as BSA24 with
      op size <- 24,
  theory A    <- Array24

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_24u8 with
      op asize <- 24,
      op bsize <- 8,
  theory A     <- Array24,
  theory BSA   <- BSA24,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.
