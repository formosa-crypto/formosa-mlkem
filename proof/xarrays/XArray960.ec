(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array960.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array960.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 960,
  theory A    <- Array960.

(* -------------------------------------------------------------------- *)
clone BSA as BSA960 with
      op size <- 960,
  theory A    <- Array960

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_960u8 with
      op asize <- 960,
      op bsize <- 8,
  theory A     <- Array960,
  theory BSA   <- BSA960,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_960u8_128 with
      op asize <- 960, op bsize <- 8, op ssize <- 128,
  theory A    <- Array960, theory BSA <- BSA960,
  theory WB   <- W8   { rename "_XX" as "_8" }, theory WEB <- WE8, theory BSWB <- BSW8,
  theory WS   <- W128 { rename "_XX" as "_128" }, theory WES <- WE128, theory BSWS <- BSW128,
  theory BSWA <- BSWA_960u8
  proof le_size by done.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_960u8_32 with
      op asize <- 960, op bsize <- 8, op ssize <- 32,
  theory A    <- Array960, theory BSA <- BSA960,
  theory WB   <- W8  { rename "_XX" as "_8" }, theory WEB <- WE8, theory BSWB <- BSW8,
  theory WS   <- W32 { rename "_XX" as "_32" }, theory WES <- WE32, theory BSWS <- BSW32,
  theory BSWA <- BSWA_960u8
  proof le_size by done.

from JazzEC require import WArray960.
require import BitEncoding.
import Array960 BitChunking.

lemma BSWAS_960u8_128_slicesetE (t : W8.t Array960.t) o (s : W128.t) :
  0 <= (o*8) <= 8 * 960 - 128 =>
   BSWAS_960u8_128.sliceset t (o*8) s =
      Array960.init (get8 (set128_direct (WArray960.init8 (fun (i_0 : int) => t.[i_0])) o s)).
proof.
move => Ho.
rewrite tP => k kb.
rewrite wordP => i ib;rewrite initiE 1:/# /=.
have //= := BSWAS_960u8_128.BVA_asliceset_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicesetP t (o*8) s _ (k*8+i) _;1,2:by smt().
rewrite (nth_flatten false 8).
+ rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
rewrite get_to_list get_w2bits (: (k * 8 + i) %/ 8 = k) 1:/# (: (k * 8 + i) %% 8 = i) 1:/# => -> .
rewrite (nth_flatten false 8).
+ rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
rewrite get_w2bits get_to_list /get8 /set128_direct initiE 1:/# /= /(\bits8) initiE 1:/# /=.
by smt(W8.initiE).
qed.

lemma BSWAS_960u8_32_slicesetE (t : W8.t Array960.t) o (s : W32.t) :
  0 <= (o*8) <= 8 * 960 - 32 =>
   BSWAS_960u8_32.sliceset t (o*8) s =
      Array960.init (get8 (set32_direct (WArray960.init8 (fun (i_0 : int) => t.[i_0])) o s)).
proof.
move => Ho.
rewrite tP => k kb.
rewrite wordP => i ib;rewrite initiE 1:/# /=.
have //= := BSWAS_960u8_32.BVA_asliceset_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicesetP t (o*8) s _ (k*8+i) _;1,2:by smt().
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
