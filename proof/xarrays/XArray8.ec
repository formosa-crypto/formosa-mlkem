(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array8.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array8.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 8,
  theory A    <- Array8.

(* -------------------------------------------------------------------- *)
clone BSA as BSA8 with
      op size <- 8,
  theory A    <- Array8

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_8u8 with
      op asize <- 8,
      op bsize <- 8,
  theory A     <- Array8,
  theory BSA   <- BSA8,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_8u16 with
      op asize <- 8,
      op bsize <- 16,
  theory A     <- Array8,
  theory BSA   <- BSA8,
  theory W     <- W16 { rename "_XX" as "_16" },
  theory WE    <- WE16,
  theory BSW   <- BSW16.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_8u32 with
      op asize <- 8,
      op bsize <- 32,
  theory A     <- Array8,
  theory BSA   <- BSA8,
  theory W     <- W32 { rename "_XX" as "_32" },
  theory WE    <- WE32,
  theory BSW   <- BSW32.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_8u32_256 with
      op asize <- 8, op bsize <- 32, op ssize <- 256,
  theory A    <- Array8, theory BSA <- BSA8,
  theory WB   <- W32  { rename "_XX" as "_32" }, theory WEB <- WE32, theory BSWB <- BSW32,
  theory WS   <- W256 { rename "_XX" as "_256" }, theory WES <- WE256, theory BSWS <- BSW256,
  theory BSWA <- BSWA_8u32
  proof le_size by done.

from JazzEC require import WArray32.
require import BitEncoding.
import Array8 BitChunking.

lemma BSWAS_8u32_256_slicegetE o (p : W32.t Array8.t):
    0 <= o*8 <= 8*32-256 =>
     get256_direct (WArray32.init32 (fun (i_0 : int) => p.[i_0])) o = BSWAS_8u32_256.sliceget p (o * 8).
  proof.
  move => Ho.
  rewrite /get256_direct /pack32_t;apply W256.wordP => k kb.
  have //= := BSWAS_8u32_256.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP p (o * 8) _; 1: by smt().
  move => -> //; rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /(\bits8) initiE 1:/# /=.
  rewrite nth_take 1,2:/# nth_drop 1,2:/#  (nth_flatten false 32).
  + rewrite allP /= => x; rewrite mapP => He; elim He;smt(W32.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.
