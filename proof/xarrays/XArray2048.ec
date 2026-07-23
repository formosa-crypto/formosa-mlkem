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

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_2048u8_64 with
      op asize   <- 2048,
      op bsize   <- 8,
      op ssize   <- 64,
  theory A       <- Array2048,
  theory BSA     <- BSA2048,
  theory WB      <- W8  { rename "_XX" as "_8" },
  theory WEB     <- WE8,
  theory BSWB    <- BSW8,
  theory WS      <- W64  { rename "_XX" as "_64" },
  theory WES     <- WE64,
  theory BSWS    <- BSW64,
  theory BSWA    <- BSWA_2048u8

  proof le_size by done.

require import BitEncoding.
import Array2048 BitChunking.

lemma BSWAS_2048u8_64_initE (a : W8.t Array2048.t) o :
    0 <= o <= 2048*8 - 64 =>
    BSWAS_2048u8_64.sliceget a o = W64.init (fun j => a.[(o + j) %/ 8].[(o + j) %% 8]).
  proof.
  move => Ho; apply W64.wordP => k kb; rewrite initiE 1:/# /=.
  have //= := BSWAS_2048u8_64.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP a o _ k _; 1,2: by smt().
  move => ->.
  rewrite nth_take 1,2:/# nth_drop 1,2:/# (nth_flatten false 8).
  + rewrite allP /= => x; rewrite mapP => He; elim He; smt(W8.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.
