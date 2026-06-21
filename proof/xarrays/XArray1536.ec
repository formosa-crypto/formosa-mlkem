(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array1536.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array1536.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 1536,
  theory A    <- Array1536.

(* -------------------------------------------------------------------- *)
clone BSA as BSA1536 with
      op size <- 1536,
  theory A    <- Array1536

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_1536u8 with
      op asize <- 1536,
      op bsize <- 8,
  theory A     <- Array1536,
  theory BSA   <- BSA1536,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.
