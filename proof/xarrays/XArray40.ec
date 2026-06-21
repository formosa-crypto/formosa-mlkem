(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array40.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array40.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 40,
  theory A    <- Array40.

(* -------------------------------------------------------------------- *)
clone BSA as BSA40 with
      op size <- 40,
  theory A    <- Array40
  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_40u16 with
      op asize <- 40,
      op bsize <- 16,
  theory A     <- Array40,
  theory BSA   <- BSA40,
  theory W     <- W16 { rename "_XX" as "_16" },
  theory WE    <- WE16,
  theory BSW   <- BSW16
  proof *.
