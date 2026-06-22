(* -------------------------------------------------------------------- *)
(* mlkem-specific QFABV circuit primitives NOT present in CircuitBindings *)
(* (the faithful mldsa copy): "extract", "concat", "a2b".  Everything     *)
(* else the filters need (zextend/shr/asliceget/asliceset/array/wordchunk)*)
(* maps onto existing CircuitBindings theories — clone those instead.     *)
(* This file is purely additive abstract machinery; it binds nothing.     *)
(* -------------------------------------------------------------------- *)
require import AllCore IntDiv List StdBigop.
from Jasmin require import JModel.
require import JWordExtra CircuitBindings.
import W8 BitEncoding BS2Int BitChunking.

(* -------------------------------------------------------------------- *)
theory WBits.
  op size : { int | 0 < size } as gt0_size.

  type t.

  op init : (int -> bool) -> t.

  op "_.[_]" : t -> int -> bool.

  op w2bits : t -> bool list.

  op bits2w : bool list -> t.

  op to_uint : t -> int.

  axiom initE (f : int -> bool) (i : int) :
    (init f).[i] = if 0 <= i && i < size then f i else false.

  axiom size_w2bits (w : t) : size (w2bits w) = size.

  axiom get_w2bits (w : t) (i : int) : nth false (w2bits w) i = w.[i].

  axiom get_bits2w (s : bool list) (i : int) :
    0 <= i && i < size => (bits2w s).[i] = nth false s i.

  axiom to_uintE (w : t) : to_uint w = bs2int (w2bits w).

  axiom w2bitsE (w : t) : w2bits w = mkseq (fun (i : int) => w.[i]) size.

  axiom get_out (w : t) (i : int) : ! (0 <= i && i < size) => w.[i] = false.

  axiom ext_eq (w1 w2 : t) :
    (forall (x : int), 0 <= x && x < size => w1.[x] = w2.[x]) => w1 = w2.
end WBits.

(* -------------------------------------------------------------------- *)
abstract theory Extract.
  op isize : { int | 0 < isize } as gt0_isize.
  op osize : { int | 0 < osize } as gt0_osize.

  clone import WBits as IW with op size <- isize
  proof gt0_size by exact/gt0_isize.

  clone import WBits as OW with op size <- osize
  proof gt0_size by exact/gt0_osize.

  op extract_XX (w : IW.t) (i : int) : OW.t =
    OW.init (fun j => w.[i + j]).

  lemma extract_XXE (w : IW.t) (i : int) (j : int) :
    0 <= j < osize => (extract_XX w i).[j] = w.[i + j].
  proof. by move=> rgj @/extract_XX; rewrite OW.initE rgj /=. qed.

  lemma extract_XXP (w : IW.t) (i : int) : 0 <= i => i + osize <= isize =>
    take osize (drop i (IW.w2bits w)) = OW.w2bits (extract_XX w i).
  proof.
  have hi := gt0_isize; have ho := gt0_osize.
  move=> ge0_i hlt; apply/(eq_from_nth false).
  - rewrite size_w2bits size_take 1:/# size_drop 1://.
    by rewrite size_w2bits lez_maxr /#.
  move=> j rgj; rewrite get_w2bits extract_XXE.
  - smt(size_take_le).
  rewrite nth_take ~-1:#smt:(size_take_le) nth_drop ~-1:/#.
  by rewrite get_w2bits.
  qed.
end Extract.

(* -------------------------------------------------------------------- *)
abstract theory A2B.
  op isize : { int | 0 <  isize } as gt0_isize.
  op osize : { int | 0 <  osize } as gt0_osize.
  op asize : { int | 0 <= asize } as ge0_asize.

  axiom eq : isize * asize = osize.

  clone import WBits as IW with op size <- isize proof gt0_size by apply/gt0_isize.
  clone import WBits as OW with op size <- osize proof gt0_size by apply/gt0_osize.

  clone import PolyArray as A with op size <- asize proof ge0_size by apply/ge0_asize.

  op uXX (a : IW.t A.t) : OW.t = OW.init (fun i => a.[i %/ isize].[i %% isize]).

  lemma uXXP (a : IW.t A.t) : flatten (map IW.w2bits (A.to_list a)) = w2bits (uXX a).
  proof.
  have eq_sz: size (flatten (map IW.w2bits (to_list a))) = osize.
  - rewrite size_flatten -map_comp -(eq_map (fun _ => isize)) /=.
    - by move=> wis; rewrite /(\o) size_w2bits.
    by rewrite map_nseq size_to_list Bigint.sumz_nseq; smt(ge0_asize eq).
  apply/(eq_from_nth false); first by rewrite eq_sz size_w2bits.
  rewrite eq_sz => i rgi; rewrite (nth_flatten _ isize).
  - by apply/List.allP=> s /mapP[wis /=] [_ ->]; rewrite size_w2bits.
  rewrite (nth_map witness) ?size_to_list 1:#smt:(gt0_size gt0_osize ge0_asize eq).
  by rewrite !get_w2bits initE rgi.
  qed.
end A2B.

(* -------------------------------------------------------------------- *)
abstract theory Concat.
  op lsize : { int | 0 < lsize } as gt0_lsize.
  op hsize : { int | 0 < hsize } as gt0_hsize.
  op osize : { int | 0 < osize } as gt0_osize.

  axiom eq : lsize + hsize = osize.

  clone import WBits as LW with op size <- lsize proof gt0_size by exact/gt0_lsize.
  clone import WBits as HW with op size <- hsize proof gt0_size by exact/gt0_hsize.
  clone import WBits as OW with op size <- osize proof gt0_size by exact/gt0_osize.

  op concat_XX (l : LW.t) (h : HW.t) : OW.t =
    OW.init (fun i => if i < lsize then l.[i] else h.[i - lsize]).

  lemma w2bits_concat_XX (l : LW.t) (h : HW.t) :
    OW.w2bits (concat_XX l h) = LW.w2bits l ++ HW.w2bits h.
  proof.
  have hl := gt0_lsize; have hh := gt0_hsize; have ho := gt0_osize; have he := eq.
  apply/(eq_from_nth false); first by rewrite OW.size_w2bits size_cat LW.size_w2bits HW.size_w2bits /#.
  rewrite OW.size_w2bits => i rgi.
  rewrite OW.get_w2bits /concat_XX OW.initE rgi /= nth_cat LW.size_w2bits.
  by rewrite LW.get_w2bits HW.get_w2bits.
  qed.
end Concat.

(* ==================================================================== *)
(* Concrete standard-word clones + binds (extract/concat over words that *)
(* CircuitBindings already bound). Same op names the filters use, so     *)
(* their references stay unchanged. W512/Array clones live in XWord512 / *)
(* the filter XArrays.                                                    *)
(* ==================================================================== *)
import BitEncoding.

clone export Extract as Extract_256_128
  with op isize <- 256, op osize <- 128, theory IW <- W256, theory OW <- W128
  rename "XX" as "256_128"
  proof gt0_isize by done, gt0_osize by done.
bind op [W256.t & W128.t] extract_256_128 "extract".
realize bvextractP by exact/extract_256_128P.
realize le_size by auto.

clone export Extract as Extract_256_16
  with op isize <- 256, op osize <- 16, theory IW <- W256, theory OW <- W16
  rename "XX" as "256_16"
  proof gt0_isize by done, gt0_osize by done.
bind op [W256.t & W16.t] extract_256_16 "extract".
realize bvextractP by exact/extract_256_16P.
realize le_size by auto.

clone export Extract as Extract_128_16
  with op isize <- 128, op osize <- 16, theory IW <- W128, theory OW <- W16
  rename "XX" as "128_16"
  proof gt0_isize by done, gt0_osize by done.
bind op [W128.t & W16.t] extract_128_16 "extract".
realize bvextractP by exact/extract_128_16P.
realize le_size by auto.

clone export Extract as Extract_64_8
  with op isize <- 64, op osize <- 8, theory IW <- W64, theory OW <- W8
  rename "XX" as "64_8"
  proof gt0_isize by done, gt0_osize by done.
bind op [W64.t & W8.t] extract_64_8 "extract".
realize bvextractP by exact/extract_64_8P.
realize le_size by auto.

op concat_2u128 (l h : W128.t) = W2u128.pack2 [l; h].
bind op [W128.t & W128.t & W256.t] concat_2u128 "concat".
realize bvconcatP.
proof.
move=> w1 w2; apply/(eq_from_nth false); first by rewrite size_cat !size_w2bits.
rewrite size_w2bits => i rgi; rewrite nth_cat !get_w2bits !size_w2bits.
by rewrite /concat_2u128 pack2wE 1:// get_of_list /#.
qed.
realize eq_size by auto.

(* ==================================================================== *)
(* Direct-index slice/zextend abstract theories. Unlike CircuitBindings' *)
(* BSWAS (bits2w/flatten), these have OW.init-style defs that the bdep   *)
(* circuit tactic bit-blasts directly — required because the filters use *)
(* sliceget/sliceset/zextend on symbolic inputs without a get_direct     *)
(* bridge. (Same shape the filters were proven against.)                 *)
(* ==================================================================== *)
abstract theory ZExtend.
  op isize : { int | 0 < isize } as gt0_isize.
  op osize : { int | 0 < osize } as gt0_osize.

  axiom le_iosize : isize <= osize.

  clone import WBits as IW with op size <- isize
  proof gt0_size by exact/gt0_isize.

  clone import WBits as OW with op size <- osize
  proof gt0_size by exact/gt0_osize.

  op zextend_XX (w : IW.t) = OW.init (fun i => w.[i]).

  lemma w2bits_zextend_XXE (w : IW.t) :
    w2bits (zextend_XX w) = w2bits w ++ nseq (osize - isize) false.
  proof.
  have leio := le_iosize; have geo := gt0_osize; have gei := gt0_isize.
  apply/(eq_from_nth false); first by rewrite size_cat !size_w2bits size_nseq /#.
  rewrite size_w2bits => i rgi @/zextend_XX.
  rewrite nth_cat size_w2bits get_w2bits nth_nseq_if if_same /=.
  rewrite initE iftrue 1:// get_w2bits; smt(IW.get_out).
  qed.

  lemma zextend_XXP (w : IW.t) : to_uint (zextend_XX w) = to_uint w.
  proof. by rewrite !to_uintE w2bits_zextend_XXE -bs2int_pad. qed.
end ZExtend.

(* -------------------------------------------------------------------- *)
abstract theory SliceSet.
  op isize : { int | 0 <  isize } as gt0_isize.
  op osize : { int | 0 <  osize } as gt0_osize.
  op asize : { int | 0 <= asize } as ge0_asize.

  clone import WBits as IW with op size <- isize proof gt0_size by apply/gt0_isize.
  clone import WBits as OW with op size <- osize proof gt0_size by apply/gt0_osize.

  clone import PolyArray as A with op size <- asize proof ge0_size by apply/ge0_asize.

  op sliceset_XX (a : IW.t A.t) (offset : int) (w : OW.t) : IW.t A.t =
    A.init (fun i => IW.init (fun j =>
      let index = i * isize + j in
      if offset <= index < offset + osize then
        w.[index - offset]
      else a.[i].[j]
    )).
end SliceSet.
