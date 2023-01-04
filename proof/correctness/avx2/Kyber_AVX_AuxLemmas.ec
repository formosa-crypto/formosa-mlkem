require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel.
require import Array768 Array400 Array384 Array256 Array128 Array64 Array32 Array16 Array4 Array8 Array2.
require import W16extra WArray1536 WArray512 WArray32 WArray16.
require import AVX2_Ops.
require import KyberPoly.
require import KyberINDCPA.
import Kyber.
import KyberPoly.
import Zq.
import BitEncoding.
import BS2Int.

op lift2poly (p: W256.t): W16.t Array16.t =
  Array16.init (fun (n : int) => p \bits16 n).

op f16u16_t8u32 (t: t16u16): t8u32 = Array8.init (fun i => pack2_t (W2u16.Pack.init (fun j => t.[2*i + j]))).
op f8u32_t16u16 (t: t8u32): t16u16 = Array16.init (fun i => t.[i %/ 2] \bits16 (i %% 2)).

op f32u8_t16u16 (t: t32u8): t16u16 = Array16.init (fun i => pack2_t (W2u8.Pack.init (fun j => t.[2*i + j]))).
op f16u16_t32u8 (t: t16u16): t32u8 = Array32.init (fun i => t.[i %/ 2] \bits8 (i %% 2)).

op f8u32_t4u64 (t: t8u32): t4u64 = Array4.init (fun i => pack2_t (W2u32.Pack.init (fun j => t.[2*i + j]))).
op f4u64_t8u32 (t: t4u64): t8u32 = Array8.init (fun i => t.[i %/ 2] \bits32 (i %% 2)).

op f32u8_t4u64 (t: t32u8): t4u64 = Array4.init (fun i => pack8_t (W8u8.Pack.init (fun j => t.[8*i + j]))).
op f4u64_t32u8 (t: t4u64): t32u8 = Array32.init (fun i => t.[i %/ 8] \bits8 (i %% 8)).

op f32u8_t8u32 (t: t32u8): t8u32 = Array8.init (fun i => pack4_t (W4u8.Pack.init (fun j => t.[4*i + j]))).
op f8u32_t32u8 (t: t8u32): t32u8 = Array32.init (fun i => t.[i %/ 4] \bits8 (i %% 4)).

op f16u16_t4u64 (t: t16u16): t4u64 = Array4.init (fun i => pack4_t (W4u16.Pack.init (fun j => t.[4*i + j]))).
op f4u64_t16u16 (t: t4u64): t16u16 = Array16.init (fun i => t.[i %/ 4] \bits16 (i %% 4)).

op f4u64_t2u128 (t: t4u64): t2u128 = Array2.init (fun i => pack2_t (W2u64.Pack.init (fun j => t.[2*i + j]))).
op f2u128_t4u64 (t: t2u128): t4u64 = Array4.init (fun i => t.[i %/ 2] \bits64 (i %% 2)).

op f16u16_t2u128 (t: t16u16): t2u128 = Array2.init (fun i => pack8_t (W8u16.Pack.init (fun j => t.[8*i + j]))).
op f2u128_t16u16 (t: t2u128): t16u16 = Array16.init (fun i => t.[i %/ 8] \bits16 (i %% 8)).

lemma lift2poly_iso (p: W16.t Array256.t) (i k: int):
    0 <= i < 16 =>
    16 * i <= k < 16 * i + 16 => (lift2poly (get256 (WArray512.init16 (fun j => p.[j])) i)).[k %% 16] = p.[k].
proof. 
  move => i_b k_b.
  have k_mb: 0 <= k %% 16 < 16.
    smt(@IntDiv).
  rewrite /x.
  rewrite /lift2poly initiE => />.
  rewrite get256E => />.
  rewrite k_mb //=.
  rewrite initiE. move : k_mb => /#.
  rewrite initiE. move : k_mb => /#.
  simplify.
  rewrite /init16.
  rewrite initiE. move : k_mb => /#.
  rewrite initiE. move : k_mb => /#.
  simplify.
  rewrite (_: (32 * i + (2 * (k %% 16) + 1)) %/ 2 = (32 * i + 2 * (k %% 16)) %/ 2).
    smt(@IntDiv).
  rewrite (_: (32 * i + 2 * (k %% 16)) %% 2 = 0).
    smt(@IntDiv).
  rewrite (_: (32 * i + (2 * (k %% 16) + 1)) %% 2 = 1).
    smt(@IntDiv).
  rewrite pack2_bits8.
  smt(@IntDiv).
qed.

lemma set_get_def (v : W16.t Array256.t) (w: W256.t) i j :
    0 <= i < 16 => 0 <= j < 256 =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16)
      else v.[j].
proof. 
  move => hx hs; rewrite set256E !get16E.
  rewrite -(W2u8.unpack8K (if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16) else v.[j])); congr.
  apply W2u8.Pack.ext_eq => k hk.
  rewrite W2u8.get_unpack8 //= W2u8.Pack.initiE 1:/# /=.
  rewrite initiE /=. move : hk hs => /#.
  rewrite initiE /=. move : hk hs => /#.
  have ->: (32 * i <= 2 * j + k < 32 * i + 32) = (16 * i <= j < 16 * i + 16) by smt().
  case : (16 * i <= j < 16 * i + 16) => h.
    + by rewrite W256_bits16_bits8 1:// /#.
    + by rewrite /init16 /#.
qed.

lemma set_get_def768 (v : W16.t Array768.t) (w: W256.t) i j :
    0 <= i < 48 => 0 <= j < 768 =>
    WArray1536.get16
    (WArray1536.set256 (WArray1536.init16 (fun i => v.[i])) i w) j =
      if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16)
      else v.[j].
proof.
  move => hx hs; rewrite set256E !get16E.
  rewrite -(W2u8.unpack8K (if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16) else v.[j])); congr.
  apply W2u8.Pack.ext_eq => k hk.
  rewrite W2u8.get_unpack8 //= W2u8.Pack.initiE 1:/# /=.
  rewrite initiE /=. move : hk hs => /#.
  rewrite initiE /=. move : hk hs => /#.
  have ->: (32 * i <= 2 * j + k < 32 * i + 32) = (16 * i <= j < 16 * i + 16) by smt().
  case : (16 * i <= j < 16 * i + 16) => h.
    + by rewrite W256_bits16_bits8 1:// /#.
    + by rewrite /init16 /#.
qed.

lemma set_get_eq (v: W16.t Array256.t) (w: W256.t) i j:
    0 <= i < 16 => 0 <= j < 256 => 16 * i <= j < 16 * i + 16 =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      w \bits16 j %% 16.
proof. 
  by move => h1 h2 h3; rewrite set_get_def // h3.
qed.

lemma set_get_diff (v: W16.t Array256.t) (w: W256.t) i j:
    0 <= i < 16 => 0 <= j < 256 => !(16 * i <= j < 16 * i + 16) =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      v.[j].
proof.
  move => h1 h2 h3; rewrite set_get_def // h3. auto.
qed.

lemma get_set_get_eqb (v: W16.t Array256.t) (w: W256.t) i:
  0 <= i < 16 => forall k, 0 <= k < i*16 =>
  v.[k] = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof. 
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i. smt().
  simplify.
  rewrite set_get_def => /#.
qed.

lemma get_set_get_eqa (v: W16.t Array256.t) (w: W256.t) i:
  0 <= i < 16 => forall k, i*16 + 16 <= k < 256 =>
  v.[k] = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof.
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i => /#.
  simplify.
  rewrite set_get_def => /#.
qed.

lemma get_set_get_diff (v: W16.t Array256.t) (w: vt16u16) i:
  0 <= i < 16 => forall k, i*16 <= k < i*16 + 16 =>
  w \bits16 (k%%16) = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof. 
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i => /#.
  simplify.
  rewrite set_get_def => /#.
qed.

lemma get_lift_array256_eq (p: W16.t Array256.t):
  let p_lift = lift_array256 p in
  forall k, 0 <= k < 256 => p_lift.[k] = inFq (W16.to_sint p.[k]).
proof. 
  rewrite /lift_array256 => p_lift. rewrite /p_lift.
  move => k k_i.
  smt (@Array256).
qed.

lemma lift_array256E (x : W16.t Array256.t) k :
  0 <= k < 256 =>
  (lift_array256 x).[k] = inFq (to_sint x.[k]).
proof. 
by move => ?; rewrite /lift_array256 mapiE //. 
qed.

(*********************************************************************)
(* TODO: CLEAN UP *)
op [opaque] iota_red = iota_.

lemma iota_red0 n : iota_red n 0 = [].
proof. by rewrite /iota_red iota0. qed.

lemma iota_red_gt n i : 0 < i => iota_red n i = n :: iota_red (n+1) (i-1).
proof. move=> hi; rewrite /iota_red -iotaS /#. qed.

hint simplify iota_red0, iota_red_gt.

lemma iota_iota_red n m : iota_ n m = iota_red n m.
proof. by rewrite /iota_red. qed.

(* hint simplify iotared0, iotaredS_minus. *)

op t1 (x:int) =
(W32.to_uint
((W32.of_int
(to_sint
((W16.of_int (x * 8 * 20159 %/ 65536)) -
(invw ((W16.of_int (x * 30200))) `&`
(W16.of_int (x * 30200 - (x + 15))) `>>` (W8.of_int 15))) %%
W32.modulus %/ 2 ^ 2))) %%
2 ^ 18 + 1) %/
2 ^ 1 %% 1024.

op t1' (x:int) =
(W32.to_uint
((W32.of_int
(to_sint
((W16.of_int (x * 8 * 20159 %/ 65536)) -
((((W16.of_int (-(x * 30200 + 1))))) `&`
(W16.of_int (x * 30200 - (x + 15))) `>>` (W8.of_int 15))) %%
W32.modulus %/ 2 ^ 2))) %%
2 ^ 18 + 1) %/
2 ^ 1 %% 1024.

lemma foo (w1 w2: W16.t) :
(w1 `&` w2) `>>>` 15 = W16.of_int (b2i (w1.[15] /\ w2.[15])).
proof.
  apply W16.all_eq_eq.
  rewrite /all_eq /=.
  cbv delta.
  do rewrite of_intwE /int_bit.
  simplify.
  smt(@Int @W16). (* can be improved *)
qed.


lemma foo' (w1 w2: int) :
(W16.of_int w1 `&` W16.of_int w2) `>>>` 15
= W16.of_int (b2i ((W16.int_bit w1 15) /\ (W16.int_bit w2 15))).
proof. by rewrite foo !W16.of_intwE. qed.

lemma of_int_invw (x: int): invw (W16.of_int x) = W16.of_int (-(x + 1)).
proof.
  rewrite -of_intN' of_intD.
  ring.
  rewrite addrC addrA -twos_compl => />.
  ring.
qed.

op t1'' (x:int) =
(W32.to_uint
((W32.of_int
(to_sint
((W16.of_int (x * 8 * 20159 %/ 65536)) -
(let w1 = -(x * 30200 + 1) in
let w2 = (x * 30200 - (x + 15)) in
W16.of_int (b2i ((W16.int_bit w1 15) /\ (W16.int_bit w2 15))))
) %%
W32.modulus %/ 2 ^ 2))) %%
2 ^ 18 + 1) %/
2 ^ 1 %% 1024.

(* op t0 i = ((1024*i + (Q-1)%/2)%/Q) %% 1024. *)
op t0 (x:int) =
(x * 1024 + (q + 1) %/ 2) * (W32.modulus %/ q) %/ W32.modulus %% 1024.

hint simplify W16.of_sintK.

lemma compress_comp_1 (x:int) : 0 <= x < 3329 => t0 x = t1'' x.
move=> /mem_range; move: x; apply /List.allP; rewrite /range iota_iota_red.
cbv delta; done.
qed.

lemma compress_comp_corr (x:int) : 0 <= x < 3329 => t1 x = t0 x.
proof.
  move => xb.
  rewrite /t1 of_int_invw (W16.shr_shrw 15 _) 1://= foo'.
  by rewrite compress_comp_1 1:xb /t1''.
qed.
(* TODO: CLEAN UP *)
(*********************************************************************)
