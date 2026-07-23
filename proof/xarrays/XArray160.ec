(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv JWordExtra CircuitBindings.
from JazzEC require import Array160.

from Jasmin require import JWord.

(* -------------------------------------------------------------------- *)
export Array160.

(* -------------------------------------------------------------------- *)
clone export PAE with
      op size <- 160,
  theory A    <- Array160.

(* -------------------------------------------------------------------- *)
clone BSA as BSA160 with
      op size <- 160,
  theory A    <- Array160

  proof gt0_size by done.

(* -------------------------------------------------------------------- *)
clone BSWA as BSWA_160u8 with
      op asize <- 160,
      op bsize <- 8,
  theory A     <- Array160,
  theory BSA   <- BSA160,
  theory W     <- W8 { rename "_XX" as "_8" },
  theory WE    <- WE8,
  theory BSW   <- BSW8
  proof *.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_160u8_64 with
      op asize <- 160, op bsize <- 8, op ssize <- 64,
  theory A    <- Array160, theory BSA <- BSA160,
  theory WB   <- W8  { rename "_XX" as "_8" }, theory WEB <- WE8, theory BSWB <- BSW8,
  theory WS   <- W64 { rename "_XX" as "_64" }, theory WES <- WE64, theory BSWS <- BSW64,
  theory BSWA <- BSWA_160u8
  proof le_size by done.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_160u8_16 with
      op asize <- 160, op bsize <- 8, op ssize <- 16,
  theory A    <- Array160, theory BSA <- BSA160,
  theory WB   <- W8  { rename "_XX" as "_8" }, theory WEB <- WE8, theory BSWB <- BSW8,
  theory WS   <- W16 { rename "_XX" as "_16" }, theory WES <- WE16, theory BSWS <- BSW16,
  theory BSWA <- BSWA_160u8
  proof le_size by done.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_160u8_128 with
      op asize <- 160, op bsize <- 8, op ssize <- 128,
  theory A    <- Array160, theory BSA <- BSA160,
  theory WB   <- W8   { rename "_XX" as "_8" }, theory WEB <- WE8, theory BSWB <- BSW8,
  theory WS   <- W128 { rename "_XX" as "_128" }, theory WES <- WE128, theory BSWS <- BSW128,
  theory BSWA <- BSWA_160u8
  proof le_size by done.

(* -------------------------------------------------------------------- *)
clone BSWAS as BSWAS_160u8_32 with
      op asize <- 160, op bsize <- 8, op ssize <- 32,
  theory A    <- Array160, theory BSA <- BSA160,
  theory WB   <- W8  { rename "_XX" as "_8" }, theory WEB <- WE8, theory BSWB <- BSW8,
  theory WS   <- W32 { rename "_XX" as "_32" }, theory WES <- WE32, theory BSWS <- BSW32,
  theory BSWA <- BSWA_160u8
  proof le_size by done.

from JazzEC require import WArray160.
require import BitEncoding.
import Array160 BitChunking.

lemma BSWAS_160u8_64_slicegetE o (p : W8.t Array160.t):
    0 <= o*8 <= 160*8-64 =>
     get64_direct (WArray160.init8 (fun (i_0 : int) => p.[i_0])) o = BSWAS_160u8_64.sliceget p (o * 8).
  proof.
  move => Ho.
  rewrite /get64_direct /pack8_t;apply W64.wordP => k kb.
  have //= := BSWAS_160u8_64.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP p (o * 8) _; 1: by smt().
  move => -> //; rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  rewrite nth_take 1,2:/# nth_drop 1,2:/#  (nth_flatten false 8).
  + rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.

lemma BSWAS_160u8_16_slicegetE o (p : W8.t Array160.t):
    0 <= o*8 <= 160*8-16 =>
     get16_direct (WArray160.init8 (fun (i_0 : int) => p.[i_0])) o = BSWAS_160u8_16.sliceget p (o * 8).
  proof.
  move => Ho.
  rewrite /get16_direct /pack2_t;apply W16.wordP => k kb.
  have //= := BSWAS_160u8_16.BVA_asliceget_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicegetP p (o * 8) _; 1: by smt().
  move => -> //; rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  rewrite nth_take 1,2:/# nth_drop 1,2:/#  (nth_flatten false 8).
  + rewrite allP /= => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
  rewrite (nth_map witness); 1: by rewrite size_to_list; smt().
  by rewrite get_to_list get_w2bits /#.
 qed.

lemma BSWAS_160u8_128_slicesetE (t : W8.t Array160.t) o (s : W128.t) :
  0 <= (o*8) <= 8 * 160 - 128 =>
   BSWAS_160u8_128.sliceset t (o*8) s =
      Array160.init (get8 (set128_direct (WArray160.init8 (fun (i_0 : int) => t.[i_0])) o s)).
proof.
move => Ho.
rewrite tP => k kb.
rewrite wordP => i ib;rewrite initiE 1:/# /=.
have //= := BSWAS_160u8_128.BVA_asliceset_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicesetP t (o*8) s _ (k*8+i) _;1,2:by smt().
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

lemma BSWAS_160u8_32_slicesetE (t : W8.t Array160.t) o (s : W32.t) :
  0 <= (o*8) <= 8 * 160 - 32 =>
   BSWAS_160u8_32.sliceset t (o*8) s =
      Array160.init (get8 (set32_direct (WArray160.init8 (fun (i_0 : int) => t.[i_0])) o s)).
proof.
move => Ho.
rewrite tP => k kb.
rewrite wordP => i ib;rewrite initiE 1:/# /=.
have //= := BSWAS_160u8_32.BVA_asliceset_Top_CircuitBindings_BSWAS_WB_t_Top_CircuitBindings_BSWAS_WS_t_Top_CircuitBindings_BSWAS_A_t.bvaslicesetP t (o*8) s _ (k*8+i) _;1,2:by smt().
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
