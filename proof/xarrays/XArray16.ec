(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array16.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array16.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 16,
  theory A    <- Array16.

(* -------------------------------------------------------------------- *)
clone BSA as BSA16 with
      op size <- 16,
  theory A    <- Array16

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_16u16 with
      op asize <- 16,
      op bsize <- 16,
  theory A     <- Array16,
  theory BSA   <- BSA16,
  theory W     <- W16 { rename "_XX" as "_16" },
  theory WE    <- WE16,
  theory BSW   <- BSW16.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_16u16_256 with
      op asize   <- 16,
      op bsize   <- 16,
      op ssize   <- 256,
  theory A       <- Array16,
  theory BSA     <- BSA16,
  theory WB      <- W16  { rename "_XX" as "_16" },
  theory WEB     <- WE16,
  theory BSWB    <- BSW16,
  theory WS      <- W256  { rename "_XX" as "_256" },
  theory WES     <- WE256,
  theory BSWS    <- BSW256,
  theory BSWA    <- BSWA_16u16

  proof le_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_16u8 with
      op asize <- 16,
      op bsize <- 8,
  theory A     <- Array16,
  theory BSA   <- BSA16,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_16u8_128 with
      op asize   <- 16,
      op bsize   <- 8,
      op ssize   <- 128,
  theory A       <- Array16,
  theory BSA     <- BSA16,
  theory WB      <- W8  { rename "_XX" as "_8" },
  theory WEB     <- WE8,
  theory BSWB    <- BSW8,
  theory WS      <- W128  { rename "_XX" as "_128" },
  theory WES     <- WE128,
  theory BSWS    <- BSW128,
  theory BSWA    <- BSWA_16u8

  proof le_size by done.

from JazzEC require import WArray16 WArray32.
require import BitEncoding.
import Array16 BitChunking.

lemma BSWAS_16u16_256_slicegetE o (p : W16.t Array16.t):
    0 <= o*8 <= 16*16-256 =>
     get256_direct (WArray32.init16 (fun (i_0 : int) => p.[i_0])) o = BSWAS_16u16_256.sliceget p (o * 8).
  proof.
  move => Ho.
  rewrite /get256_direct /pack32_t;apply W256.wordP => k kb.
  have //= := BSWAS_16u16_256.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP p (o * 8) _; 1: by smt().
  move => -> //; rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /(\bits8) initiE 1:/# /=.
  rewrite nth_take 1,2:/# nth_drop 1,2:/#  (nth_flatten false 16).
  + rewrite allP /= => x; rewrite mapP => He; elim He;smt(W16.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.

lemma BSWAS_16u8_128_slicegetE o (p : W8.t Array16.t):
    0 <= o*8 <= 16*8-128 =>
     get128_direct (WArray16.init8 (fun (i_0 : int) => p.[i_0])) o = BSWAS_16u8_128.sliceget p (o * 8).
  proof.
  move => Ho.
  rewrite /get128_direct /pack16_t;apply W128.wordP => k kb.
  have //= := BSWAS_16u8_128.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP p (o * 8) _; 1: by smt().
  move => -> //; rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  rewrite nth_take 1,2:/# nth_drop 1,2:/#  (nth_flatten false 8).
  + rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.
