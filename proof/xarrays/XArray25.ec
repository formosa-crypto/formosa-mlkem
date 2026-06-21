(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array25.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array25.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 25,
  theory A    <- Array25.

(* -------------------------------------------------------------------- *)
clone BSA as BSA25 with
      op size <- 25,
  theory A    <- Array25

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_25u64 with
      op asize <- 25,
      op bsize <- 64,
  theory A     <- Array25,
  theory BSA   <- BSA25,
  theory W     <- W64 { rename "_XX" as "_64" },
  theory WE    <- WE64,
  theory BSW   <- BSW64.
