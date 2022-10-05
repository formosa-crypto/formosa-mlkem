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
