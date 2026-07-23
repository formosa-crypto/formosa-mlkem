(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array4.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array4.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 4,
  theory A    <- Array4.

(* -------------------------------------------------------------------- *)
clone BSA as BSA4 with
      op size <- 4,
  theory A    <- Array4

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_4u32 with
      op asize <- 4,
      op bsize <- 32,
  theory A     <- Array4,
  theory BSA   <- BSA4,
  theory W     <- W32 { rename "_XX" as "_32" },
  theory WE    <- WE32,
  theory BSW   <- BSW32.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_4u64 with
      op asize <- 4,
      op bsize <- 64,
  theory A     <- Array4,
  theory BSA   <- BSA4,
  theory W     <- W64 { rename "_XX" as "_64" },
  theory WE    <- WE64,
  theory BSW   <- BSW64.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_4u32_128 with
      op asize   <- 4,
      op bsize   <- 32,
      op ssize   <- 128,
  theory A       <- Array4,
  theory BSA     <- BSA4,
  theory WB      <- W32  { rename "_XX" as "_32" },
  theory WEB     <- WE32,
  theory BSWB    <- BSW32,
  theory WS      <- W128  { rename "_XX" as "_128" },
  theory WES     <- WE128,
  theory BSWS    <- BSW128,
  theory BSWA    <- BSWA_4u32

  proof le_size by done.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_4u64_256 with
      op asize   <- 4,
      op bsize   <- 64,
      op ssize   <- 256,
  theory A       <- Array4,
  theory BSA     <- BSA4,
  theory WB      <- W64  { rename "_XX" as "_64" },
  theory WEB     <- WE64,
  theory BSWB    <- BSW64,
  theory WS      <- W256  { rename "_XX" as "_256" },
  theory WES     <- WE256,
  theory BSWS    <- BSW256,
  theory BSWA    <- BSWA_4u64

  proof le_size by done.

from JazzEC require import WArray16 WArray32.
require import BitEncoding.
import Array4 BitChunking.

lemma BSWAS_4u32_128_slicegetE o (p : W32.t Array4.t):
    0 <= o*8 <= 4*32-128 =>
     get128_direct (WArray16.init32 (fun (i_0 : int) => p.[i_0])) o = BSWAS_4u32_128.sliceget p (o * 8).
  proof.
  move => Ho.
  rewrite /get128_direct /pack16_t;apply W128.wordP => k kb.
  have //= := BSWAS_4u32_128.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP p (o * 8) _; 1: by smt().
  move => -> //; rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /(\bits8) initiE 1:/# /=.
  rewrite nth_take 1,2:/# nth_drop 1,2:/#  (nth_flatten false 32).
  + rewrite allP /= => x; rewrite mapP => He; elim He;smt(W32.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.

lemma BSWAS_4u64_256_slicegetE o (p : W64.t Array4.t):
    0 <= o*8 <= 4*64-256 =>
     get256_direct (WArray32.init64 (fun (i_0 : int) => p.[i_0])) o = BSWAS_4u64_256.sliceget p (o * 8).
  proof.
  move => Ho.
  rewrite /get256_direct /pack32_t;apply W256.wordP => k kb.
  have //= := BSWAS_4u64_256.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP p (o * 8) _; 1: by smt().
  move => -> //; rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /(\bits8) initiE 1:/# /=.
  rewrite nth_take 1,2:/# nth_drop 1,2:/#  (nth_flatten false 64).
  + rewrite allP /= => x; rewrite mapP => He; elim He;smt(W64.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.
