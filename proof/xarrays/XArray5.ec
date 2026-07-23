(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array5.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array5.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 5,
  theory A    <- Array5.

(* -------------------------------------------------------------------- *)
clone BSA as BSA5 with
      op size <- 5,
  theory A    <- Array5

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_5u32 with
      op asize <- 5,
      op bsize <- 32,
  theory A     <- Array5,
  theory BSA   <- BSA5,
  theory W     <- W32 { rename "_XX" as "_32" },
  theory WE    <- WE32,
  theory BSW   <- BSW32.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_5u64 with
      op asize <- 5,
      op bsize <- 64,
  theory A     <- Array5,
  theory BSA   <- BSA5,
  theory W     <- W64 { rename "_XX" as "_64" },
  theory WE    <- WE64,
  theory BSW   <- BSW64.
