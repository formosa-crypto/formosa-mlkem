(* General EC imports *)
require import AllCore IntDiv List.

from Jasmin require import JWord JArray.

from JazzEC require import Array32 Array256 Array384.

import BitEncoding BS2Int BitChunking.

(* Imports of "lower-level" MLKEM spec parts *)
require import GFq.
import Zq.
require import Rq.
require import Parameters.
import MLKEMParams.
require import VecMat.
import VecMat.PolyVec VecMat.PolyMat.

type ipoly = int Array256.t.
op toipoly(p : poly) : ipoly = map asint p.
op ofipoly(p : ipoly)  : poly = map incoeff p.

(* Encode/Decode Operators as Defined in the MLKEM Spec (variant-independent) *)
op BytesToBits(bytes : W8.t list) : bool list = flatten (map W8.w2bits bytes).
op BitsToBytes(bits : bool list) : W8.t list = map W8.bits2w (chunk 8 bits).
op ByteEncode(l : int, ints : int list) : W8.t list = BitsToBytes (flatten (map (int2bs l) ints)).
op ByteDecode(l : int, bytes : W8.t list) : int list = map bs2int (chunk l (BytesToBits (bytes))).

op encode12(a : ipoly) :  W8.t Array384.t = Array384.of_list W8.zero (ByteEncode 12 (to_list a)).
op encode1(a : ipoly) :  W8.t Array32.t = Array32.of_list W8.zero (ByteEncode 1 (to_list a)).

op decode12(a : W8.t Array384.t) : ipoly = Array256.of_list 0 (ByteDecode 12 (to_list a)).
op decode1(a : W8.t Array32.t) : ipoly =  Array256.of_list 0 (ByteDecode 1 (to_list a)).

(* ------------------------------------------------------------------ *)
(* Parameterized vector/poly (de)serialization over the global dimension k and
   the ciphertext compression widths du (vector) / dv (poly).  ipolyvec and the
   byte outputs are size-(k/du/dv) PolyArray clones; the concrete variant sizes
   are pinned by the per-variant avx2 prelude axioms (k/du/dv). *)
(* ------------------------------------------------------------------ *)

clone export PolyArray as IPVec with
  op size <- 256 * kvec
  proof ge0_size by smt(gt0_k).

type ipolyvec = int IPVec.t.

op [a] subarray256 (x : 'a IPVec.t, i : int) : 'a Array256.t =
  Array256.init (fun j => x.[256 * i + j]).

(* generic (kvec-wide) gluing: combine the k 256-chunks produced by a
   function into one IPVec; inverse of subarray256. *)
op [a] fromarray256 (f : int -> 'a Array256.t) : 'a IPVec.t =
  IPVec.init (fun idx => (f (idx %/ 256)).[idx %% 256]).

lemma subarray256K (f : int -> 'a Array256.t) i :
  0 <= i < kvec => subarray256 (fromarray256 f) i = f i.
proof.
move=> hi; rewrite /subarray256 /fromarray256; apply Array256.tP => j jb.
rewrite Array256.initiE 1:/# /= IPVec.initiE 1:/# /=.
have ->: (256 * i + j) %/ 256 = i by rewrite mulzC divzMDl 1:/# divz_small /#.
by have ->: (256 * i + j) %% 256 = j by rewrite mulzC modzMDl modz_small /#.
qed.

lemma fromarray256K (x : 'a IPVec.t) : fromarray256 (subarray256 x) = x.
proof.
rewrite /fromarray256 /subarray256; apply IPVec.tP => i ib.
rewrite IPVec.initiE 1:ib /= Array256.initiE 1:/# /=.
by congr; smt(divz_eq).
qed.

op toipolyvec (p : polyvec) : ipolyvec =
  IPVec.init (fun idx => asint p.[idx %/ 256].[idx %% 256]).

op ofipolyvec (p : ipolyvec) : polyvec =
  KVec.init (fun i => map incoeff (subarray256 p i)).

op compress_polyvec (d : int, p : polyvec) : ipolyvec =
  IPVec.init (fun idx => Compress d p.[idx %/ 256].[idx %% 256]).

op decompress_polyvec (d : int, p : ipolyvec) : polyvec =
  KVec.init (fun i => map (Decompress d) (subarray256 p i)).

(* poly-level compression encode/decode: width dv (FIPS d_v) *)
clone export PolyArray as BytesPoly with
  op size <- 32 * dv
  proof ge0_size by smt(gt0_dv).

op encode_poly (a : ipoly) : W8.t BytesPoly.t = BytesPoly.of_list W8.zero (ByteEncode dv (to_list a)).
op decode_poly (a : W8.t BytesPoly.t) : ipoly = Array256.of_list 0 (ByteDecode dv (to_list a)).

(* vector compression encode/decode: width du (FIPS d_u) *)
clone export PolyArray as BytesCtVec with
  op size <- 32 * du * kvec
  proof ge0_size by smt(gt0_k gt0_du).

op encode_vec (a : ipolyvec) : W8.t BytesCtVec.t = BytesCtVec.of_list W8.zero (ByteEncode du (to_list a)).
op decode_vec (a : W8.t BytesCtVec.t) : ipolyvec = IPVec.of_list 0 (ByteDecode du (to_list a)).

(* public-key vector encode/decode: fixed width 12 *)
clone export PolyArray as BytesPKVec with
  op size <- 384 * kvec
  proof ge0_size by smt(gt0_k).

op encode12_vec (a : ipolyvec) : W8.t BytesPKVec.t = BytesPKVec.of_list W8.zero (ByteEncode 12 (to_list a)).
op decode12_vec (a : W8.t BytesPKVec.t) : ipolyvec = IPVec.of_list 0 (ByteDecode 12 (to_list a)).

(* per-poly 384-byte slicing of the packed public-key vector (width 12),
   and its kvec-wide inverse — analogues of subarray256/fromarray256. *)
op [a] subarray384 (x : 'a BytesPKVec.t, i : int) : 'a Array384.t =
  Array384.init (fun j => x.[384 * i + j]).

op [a] fromarray384 (f : int -> 'a Array384.t) : 'a BytesPKVec.t =
  BytesPKVec.init (fun idx => (f (idx %/ 384)).[idx %% 384]).

lemma subarray384K (f : int -> 'a Array384.t) i :
  0 <= i < kvec => subarray384 (fromarray384 f) i = f i.
proof.
move=> hi; rewrite /subarray384 /fromarray384; apply Array384.tP => j jb.
rewrite Array384.initiE 1:/# /= BytesPKVec.initiE 1:/# /=.
have ->: (384 * i + j) %/ 384 = i by rewrite mulzC divzMDl 1:/# divz_small /#.
by have ->: (384 * i + j) %% 384 = j by rewrite mulzC modzMDl modz_small /#.
qed.

lemma fromarray384K (x : 'a BytesPKVec.t) : fromarray384 (subarray384 x) = x.
proof.
rewrite /fromarray384 /subarray384; apply BytesPKVec.tP => i ib.
rewrite BytesPKVec.initiE 1:ib /= Array384.initiE 1:/# /=.
by congr; smt(divz_eq).
qed.
