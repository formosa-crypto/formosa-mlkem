(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array1568.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array1568.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 1568,
  theory A    <- Array1568.

(* -------------------------------------------------------------------- *)
clone BSA as BSA1568 with
      op size <- 1568,
  theory A    <- Array1568

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_1568u8 with
      op asize <- 1568,
      op bsize <- 8,
  theory A     <- Array1568,
  theory BSA   <- BSA1568,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_1568u8_256 with
      op asize <- 1568, op bsize <- 8, op ssize <- 256,
  theory A    <- Array1568, theory BSA <- BSA1568,
  theory WB   <- W8   { rename "_XX" as "_8" }, theory WEB <- WE8, theory BSWB <- BSW8,
  theory WS   <- W256 { rename "_XX" as "_256" }, theory WES <- WE256, theory BSWS <- BSW256,
  theory BSWA <- BSWA_1568u8
  proof le_size by done.

from JazzEC require import WArray1568.
require import BitEncoding.
import Array1568 BitChunking.

lemma BSWAS_1568u8_256_slicegetE o (p : W8.t Array1568.t):
    0 <= o*8 <= 1568*8-256 =>
     get256_direct (WArray1568.init8 (fun (i_0 : int) => p.[i_0])) o = BSWAS_1568u8_256.sliceget p (o * 8).
  proof.
  move => Ho.
  rewrite /get256_direct /pack32_t;apply W256.wordP => k kb.
  have //= := BSWAS_1568u8_256.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP p (o * 8) _; 1: by smt().
  move => -> //; rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  rewrite nth_take 1,2:/# nth_drop 1,2:/#  (nth_flatten false 8).
  + rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.
