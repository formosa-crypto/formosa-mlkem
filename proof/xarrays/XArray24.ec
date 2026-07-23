(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings XWord12.
from JazzEC require import Array24.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array24.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 24,
  theory A    <- Array24.

(* -------------------------------------------------------------------- *)
clone BSA as BSA24 with
      op size <- 24,
  theory A    <- Array24

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_24u8 with
      op asize <- 24,
      op bsize <- 8,
  theory A     <- Array24,
  theory BSA   <- BSA24,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_24u8_12 with
      op asize   <- 24,
      op bsize   <- 8,
      op ssize   <- 12,
  theory A       <- Array24,
  theory BSA     <- BSA24,
  theory WB      <- W8  { rename "_XX" as "_8" },
  theory WEB     <- WE8,
  theory BSWB    <- BSW8,
  theory WS      <- W12  { rename "_XX" as "_12" },
  theory WES     <- WE12,
  theory BSWS    <- BSW12,
  theory BSWA    <- BSWA_24u8

  proof le_size by done.

require import BitEncoding.
import Array24 BitChunking.

lemma BSWAS_24u8_12_initE (a : W8.t Array24.t) o :
    0 <= o <= 24*8 - 12 =>
    BSWAS_24u8_12.sliceget a o = W12.init (fun j => a.[(o + j) %/ 8].[(o + j) %% 8]).
  proof.
  move => Ho; apply W12.wordP => k kb; rewrite initiE 1:/# /=.
  have //= := BSWAS_24u8_12.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP a o _ k _; 1,2: by smt().
  move => ->.
  rewrite nth_take 1,2:/# nth_drop 1,2:/# (nth_flatten false 8).
  + rewrite allP /= => x; rewrite mapP => He; elim He; smt(W8.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.
