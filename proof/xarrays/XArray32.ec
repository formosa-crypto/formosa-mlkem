(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings CircuitBindingsExtra.
from JazzEC require import Array32.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array32.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 32,
  theory A    <- Array32.

(* -------------------------------------------------------------------- *)
clone BSA as BSA32 with
      op size <- 32,
  theory A    <- Array32

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_32u8 with
      op asize <- 32,
      op bsize <- 8,
  theory A     <- Array32,
  theory BSA   <- BSA32,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_32u16 with
      op asize <- 32,
      op bsize <- 16,
  theory A     <- Array32,
  theory BSA   <- BSA32,
  theory W     <- W16 { rename "_XX" as "_16" },
  theory WE    <- WE16,
  theory BSW   <- BSW16.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_32u8_256 with
      op asize   <- 32,
      op bsize   <- 8,
      op ssize   <- 256,
  theory A       <- Array32,
  theory BSA     <- BSA32,
  theory WB      <- W8  { rename "_XX" as "_8" },
  theory WEB     <- WE8,
  theory BSWB    <- BSW8,
  theory WS      <- W256  { rename "_XX" as "_256" },
  theory WES     <- WE256,
  theory BSWS    <- BSW256,
  theory BSWA    <- BSWA_32u8

  proof le_size by done.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_32u8_32 with
      op asize   <- 32,
      op bsize   <- 8,
      op ssize   <- 32,
  theory A       <- Array32,
  theory BSA     <- BSA32,
  theory WB      <- W8  { rename "_XX" as "_8" },
  theory WEB     <- WE8,
  theory BSWB    <- BSW8,
  theory WS      <- W32  { rename "_XX" as "_32" },
  theory WES     <- WE32,
  theory BSWS    <- BSW32,
  theory BSWA    <- BSWA_32u8

  proof le_size by done.

from JazzEC require import WArray32.
require import BitEncoding.
import Array32 BitChunking.

lemma BSWAS_32u8_256_slicegetE o (p : W8.t Array32.t):
    0 <= o*8 <= 32*8-256 =>
     get256_direct (WArray32.init8 (fun (i_0 : int) => p.[i_0])) o = BSWAS_32u8_256.sliceget p (o * 8).
  proof.
  move => Ho.
  rewrite /get256_direct /pack32_t;apply W256.wordP => k kb.
  have //= := BSWAS_32u8_256.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP p (o * 8) _; 1: by smt().
  move => -> //; rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  rewrite nth_take 1,2:/# nth_drop 1,2:/#  (nth_flatten false 8).
  + rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.

lemma BSWAS_32u8_32_slicesetE (t : W8.t Array32.t) o (s : W32.t) :
  0 <= (o*8) <= 8 * 32 - 32 =>
   BSWAS_32u8_32.sliceset t (o*8) s =
      Array32.init (get8 (set32_direct (WArray32.init8 (fun (i_0 : int) => t.[i_0])) o s)).
proof.
move => Ho.
rewrite tP => k kb.
rewrite wordP => i ib;rewrite initiE 1:/# /=.
have //= := BSWAS_32u8_32.BVA_asliceset_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicesetP t (o*8) s _ (k*8+i) _;1,2:by smt().
rewrite (nth_flatten false 8).
+ rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
rewrite get_to_list get_w2bits (: (k * 8 + i) %/ 8 = k) 1:/# (: (k * 8 + i) %% 8 = i) 1:/# => -> .
rewrite (nth_flatten false 8).
+ rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
rewrite get_w2bits get_to_list /get8 /set32_direct initiE 1:/# /= /(\bits8) initiE 1:/# /=.
by smt(W8.initiE).
qed.

(* -------------------------------------------------------------------- *)
(* a2b: Array32 of W8 -> W256 (used by the filters).                     *)
clone export A2B as A2B_8_256_32
  with op isize <- 8, op osize <- 256, op asize <- 32,
  theory IW <- W8, theory OW <- W256, theory A <- Array32
  rename "XX" as "8_256_32"
  proof gt0_isize by done, gt0_osize by done, ge0_asize by done, eq by done.
bind op [W256.t & W8.t & Array32.t] u8_256_32 "a2b".
realize a2bP by apply/u8_256_32P.
realize size_ok by auto.
