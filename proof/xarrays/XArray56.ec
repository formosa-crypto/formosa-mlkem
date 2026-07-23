(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array56.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array56.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 56,
  theory A    <- Array56.

(* -------------------------------------------------------------------- *)
clone BSA as BSA56 with
      op size <- 56,
  theory A    <- Array56
  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_56u8 with
      op asize <- 56,
      op bsize <- 8,
  theory A     <- Array56,
  theory BSA   <- BSA56,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_56u8_256 with
      op asize   <- 56,
      op bsize   <- 8,
      op ssize   <- 256,
  theory A       <- Array56,
  theory BSA     <- BSA56,
  theory WB      <- W8  { rename "_XX" as "_8" },
  theory WEB     <- WE8,
  theory BSWB    <- BSW8,
  theory WS      <- W256  { rename "_XX" as "_256" },
  theory WES     <- WE256,
  theory BSWS    <- BSW256,
  theory BSWA    <- BSWA_56u8

  proof le_size by done.

require import BitEncoding.
import Array56 BitChunking.

lemma BSWAS_56u8_256_initE (a : W8.t Array56.t) o :
    0 <= o <= 56*8 - 256 =>
    BSWAS_56u8_256.sliceget a o = W256.init (fun j => a.[(o + j) %/ 8].[(o + j) %% 8]).
  proof.
  move => Ho; apply W256.wordP => k kb; rewrite initiE 1:/# /=.
  have //= := BSWAS_56u8_256.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP a o _ k _; 1,2: by smt().
  move => ->.
  rewrite nth_take 1,2:/# nth_drop 1,2:/# (nth_flatten false 8).
  + rewrite allP /= => x; rewrite mapP => He; elim He; smt(W8.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.
