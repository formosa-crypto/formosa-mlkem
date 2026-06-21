(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array384.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array384.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 384,
  theory A    <- Array384.

(* -------------------------------------------------------------------- *)
clone BSA as BSA384 with
      op size <- 384,
  theory A    <- Array384

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_384u8 with
      op asize <- 384,
      op bsize <- 8,
  theory A     <- Array384,
  theory BSA   <- BSA384,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_384u8_256 with
      op asize   <- 384,
      op bsize   <- 8,
      op ssize   <- 256,
  theory A       <- Array384,
  theory BSA     <- BSA384,
  theory WB      <- W8  { rename "_XX" as "_8" },
  theory WEB     <- WE8,
  theory BSWB    <- BSW8,
  theory WS      <- W256  { rename "_XX" as "_256" },
  theory WES     <- WE256,
  theory BSWS    <- BSW256,
  theory BSWA    <- BSWA_384u8

  proof le_size by done.

from JazzEC require import WArray384.
require import BitEncoding.
import Array384 BitChunking.

lemma BSWAS_384u8_256_slicegetE o (p : W8.t Array384.t):
    0 <= o*8 <= 384*8-256 =>
     get256_direct (WArray384.init8 (fun (i_0 : int) => p.[i_0])) o = BSWAS_384u8_256.sliceget p (o * 8).
  proof.
  move => Ho.
  rewrite /get256_direct /pack32_t;apply W256.wordP => k kb.
  have //= := BSWAS_384u8_256.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP p (o * 8) _; 1: by smt().
  move => -> //; rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  rewrite nth_take 1,2:/# nth_drop 1,2:/#  (nth_flatten false 8).
  + rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.

lemma BSWAS_384u8_256_slicesetE (t : W8.t Array384.t) o (s : W256.t) :
  0 <= (o*8) <= 8 * 384 - 256 =>
   BSWAS_384u8_256.sliceset t (o*8) s =
      Array384.init (get8 (set256_direct (WArray384.init8 (fun (i_0 : int) => t.[i_0])) o s)).
proof.
move => Ho.
rewrite tP => k kb.
rewrite wordP => i ib;rewrite initiE 1:/# /=.
have //= := BSWAS_384u8_256.BVA_asliceset_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicesetP t (o*8) s _ (k*8+i) _;1,2:by smt().
rewrite (nth_flatten false 8).
+ rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
rewrite get_to_list get_w2bits (: (k * 8 + i) %/ 8 = k) 1:/# (: (k * 8 + i) %% 8 = i) 1:/# => -> .
rewrite (nth_flatten false 8).
+ rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
rewrite get_w2bits get_to_list /get8 /set256_direct initiE 1:/# /= /(\bits8) initiE 1:/# /=.
by smt(W8.initiE).
qed.
