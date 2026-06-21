(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array2048.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array2048.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 2048,
  theory A    <- Array2048.

(* -------------------------------------------------------------------- *)
clone BSA as BSA2048 with
      op size <- 2048,
  theory A    <- Array2048
  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_2048u8 with
      op asize <- 2048,
      op bsize <- 8,
  theory A     <- Array2048,
  theory BSA   <- BSA2048,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.
