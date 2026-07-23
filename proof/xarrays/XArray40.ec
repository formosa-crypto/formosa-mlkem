(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings CircuitBindingsExtra.
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

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_40u16_128 with
      op asize   <- 40,
      op bsize   <- 16,
      op ssize   <- 128,
  theory A       <- Array40,
  theory BSA     <- BSA40,
  theory WB      <- W16  { rename "_XX" as "_16" },
  theory WEB     <- WE16,
  theory BSWB    <- BSW16,
  theory WS      <- W128  { rename "_XX" as "_128" },
  theory WES     <- WE128,
  theory BSWS    <- BSW128,
  theory BSWA    <- BSWA_40u16

  proof le_size by done.

clone export SliceSet as SliceSet_16_128_40
  with op isize <- 16, op osize <- 128, op asize <- 40,
  theory IW <- W16, theory OW <- W128, theory A <- Array40
  rename "XX" as "16_128_40"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done.
