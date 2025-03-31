(* -------------------------------------------------------------------- *)
(* ----- *) require import AllCore IntDiv List StdBigop.
from Jasmin require import JModel.
(* ----- *) (* - *) import W8 BitEncoding BS2Int BitChunking.

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
abstract theory SliceGet.
  op isize : { int | 0 <  isize } as gt0_isize.
  op osize : { int | 0 <  osize } as gt0_osize.
  op asize : { int | 0 <= asize } as ge0_asize.

  clone import WBits as IW with op size <- isize proof gt0_size by apply/gt0_isize.
  clone import WBits as OW with op size <- osize proof gt0_size by apply/gt0_osize.

  clone import PolyArray as A with op size <- asize proof ge0_size by apply/ge0_asize.

  op sliceget_XX (a : IW.t A.t) (i : int) : OW.t =
    OW.init (fun j => a.[(i + j) %/ isize].[(i + j) %% isize]).

  lemma sliceget_XXE (a : IW.t A.t) (i : int) (j : int) :
    0 <= j < osize => (sliceget_XX a i).[j] = a.[(i + j) %/ isize].[(i + j) %% isize].
  proof. by move=> rgj; rewrite initE rgj. qed.

  lemma sliceget_XX_chunkE x0 (a : IW.t A.t) (i : int) :
   0 <= i => osize * (i + 1) <= asize * isize => sliceget_XX a (osize * i) =
     OW.bits2w (nth x0 (chunk osize (flatten (map IW.w2bits (A.to_list a)))) i).
  proof.
  move=> ge0_i lt; apply/OW.ext_eq => j rgj; rewrite sliceget_XXE 1:/#.
  rewrite /chunk nth_mkseq /=.
  - rewrite size_flatten -map_comp (eq_map _ (fun _ => isize)).
    - by move=> wi @/(\o); rewrite size_w2bits.
    by rewrite map_nseq Bigint.sumz_nseq ?size_ge0 size_to_list /#.
  rewrite OW.get_bits2w 1:// nth_take ~-1:#smt:(gt0_osize).
  rewrite nth_drop ~-1:#smt:(gt0_osize) (nth_flatten _ isize).
  - by apply/List.allP=> s /mapP[/= sis] [_ ->]; rewrite size_w2bits.
  rewrite (nth_map witness) 1:size_to_list.
  - smt(gt0_isize gt0_osize ge0_asize).
  - by rewrite get_w2bits get_to_list.
  qed.

  lemma sliceget_XXP (a : IW.t A.t) :
    forall (i : int), 0 <= i <= isize * asize - osize =>
      let base = flatten (map IW.w2bits (to_list a)) in
      let ret  = sliceget_XX a i in
      forall (j : int),
        0 <= j && j < osize =>
          nth false (w2bits ret) j = nth false (take osize (drop i base)) j.
  proof.
  move=> i rgi /= j rgj; rewrite get_w2bits sliceget_XXE 1://.
  rewrite nth_take ~-1:/# nth_drop ~-1:/# (nth_flatten _ isize).
  - by apply/List.allP => s /mapP[/= sisz] [_ ->]; rewrite size_w2bits.
  rewrite (nth_map witness) 1:size_to_list; last first.
  - by rewrite get_w2bits get_to_list.
  - smt(gt0_isize gt0_osize ge0_asize).
  qed.
end SliceGet.

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

(* -------------------------------------------------------------------- *)
abstract theory WordChunk.
  op isize : { int | 0 < isize } as gt0_isize.
  op osize : { int | 0 < osize } as gt0_osize.

  axiom le_iosize : isize <= osize.

  clone import WBits as IW with op size <- isize
  proof gt0_size by exact/gt0_isize.

  clone import WBits as OW with op size <- osize
  proof gt0_size by exact/gt0_osize.

  lemma bits2w_chunk_w2bits_XXE x0 (w : OW.t) (i j : int) :
    0 <= i => (i + 1) * isize <= osize => 0 <= j < isize =>
      (IW.bits2w (nth x0 (chunk isize (OW.w2bits w)) i)).[j] = w.[isize * i + j].
  proof.
  move=> rgi lt rgj; rewrite get_bits2w 1:/# nth_mkseq /=.
  - by rewrite size_w2bits /#.
  rewrite nth_take ~-1:#smt:(gt0_isize) nth_drop ~-1:#smt:(gt0_isize).
  by rewrite get_w2bits.
  qed.
end WordChunk.
