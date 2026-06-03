require import AllCore List Int IntDiv BitEncoding.
from Jasmin require import JModel.
from JazzEC require import Array256 Array768 Array1152 Array2304.
from Spec require import GFq Rq VecMat Serialization Correctness768 EncDecCorrectness768.
require import MLKEMFCLib.
import MLKEMFCLib768.
import Zq.
import VecMat768 PolyVec PolyMat Serialization768 KMatrix.
import KMatrix.Matrix.
import BitChunking BS2Int.

op lift_polyvec (vec: W16.t Array768.t) : polyvec =
  Vector.offunv (fun i => lift_array256 (subarray256 vec i)).

(* lift_matrix / unlift_matrix are now in Correctness768.ec (spec side) --
   no duplicate here. *)

op lift_matrix( a : W16.t Array2304.t) : polymat =
   Matrix.offunm (fun i j => subarray256 (subarray768 (lift_array2304 a) i) j).

(* Bound on decode (relocated from ref/MLKEM_Poly.ec, size-256 variant). *)
lemma decode_range dfl (l : W8.t list) n :
  1 < n <= 12 =>
    size l = 256*n %/ 8 =>
  size (decode n l) = 256 /\
  (forall k, 0<=k<256 => 0<= nth dfl (decode n l) k <2^n).
move => ? Hsl *.
rewrite -andaE;split.
+ rewrite /decode size_map size_chunk 1:/# size_BytesToBits Hsl /#.
move => ? k kb.
rewrite /decode.
have := size_nth_chunk witness (BytesToBits l) k n; rewrite size_BytesToBits /= => H.
rewrite (nth_map witness);1: by rewrite size_chunk 1:/# size_BytesToBits Hsl /#.
split => *; 1: smt(BS2Int.bs2int_ge0).
have ? : 8 * size l %/ n = 256; last by  smt(BS2Int.bs2int_le2Xs).
by rewrite Hsl;smt().
qed.

(* polyvec variant of decode_range *)
lemma decode_range_vec dfl (l : W8.t list) n :
  1 < n <= 12 =>
    size l = 768*n %/ 8 =>
  size (decode n l) = 768 /\
  (forall k, 0<=k<768 => 0<= nth dfl (decode n l) k <2^n).
move => ? Hsl *.
rewrite -andaE;split;1: by rewrite /decode size_map size_chunk 1:/# size_BytesToBits /#.
move => ? k kb.
rewrite /decode.
have := size_nth_chunk witness (BytesToBits l) k n; rewrite size_BytesToBits /= => H.
rewrite (nth_map witness);1: by rewrite size_chunk 1:/# size_BytesToBits Hsl /#.
split => *; 1: smt(BS2Int.bs2int_ge0).
have ? : 8 * size l %/ n = 768; last by  smt(BS2Int.bs2int_le2Xs).
by rewrite Hsl;smt().
qed.

(* Spec-side bound on decoded 12-bit ints (analog of EncDecCorrectness768.decode1_bnd
   but for decode12_vec). Proof modeled on decode1_bnd. *)
lemma decode12_vec_bnd (a : W8.t Array1152.t) (k : int) :
  0 <= k < 768 => 0 <= (decode12_vec a).[k] < 4096.
proof.
move => ?; rewrite /decode12_vec get_of_list 1:/# /decode (nth_map witness).
+ by rewrite size_chunk 1:/# size_BytesToBits size_to_list //=.
have := bs2int_le2Xs (nth witness (chunk 12 (BytesToBits (to_list a))) k).
rewrite size_nth_chunk //=;1: by rewrite size_BytesToBits size_to_list //=.
by smt(bs2int_ge0).
qed.

op unlift_polyvec(a : polyvec) =
   Array768.init (fun i => W16.of_int (as_sint (a.[i %/ 256])%Vector.[i%%256])).

lemma vector_unlift a :
    lift_polyvec (unlift_polyvec a) = a /\
    signed_bound768_cxq (unlift_polyvec a) 0 768 1.
proof.
split.
+ rewrite /lift_vector /unlift_polyvec eq_vectorP => i ib.
  rewrite offunvE //= /subarray256 /lift_array256 /= tP => k kb.
  rewrite mapiE //= initiE //= initiE //= 1:/# /to_sint /smod /=.
  rewrite !of_uintK /=; rewrite /as_sint qE /=.
  by smt(rg_asint asintK).
rewrite /unlift_vector /signed_bound768_cxq => k kb; rewrite initiE //=.
rewrite /to_sint /smod /= !of_uintK /= /as_sint qE /=.
by smt(rg_asint).
qed.

lemma ofipolyvec_lift vi vw :
  all (fun i => 0 <= i < 32768) vi =>
  lift_array768 vw = map incoeff vi =>
  ofipolyvec vi = lift_polyvec vw.
rewrite allP /= => ?.
rewrite /lift_array768 tP => H.
rewrite /ofipolyvec /lift_polyvec !setvE /= eq_vectorP => r rb.
rewrite !offunvE 1,2:/# /= !offunvK /vclamp /= /subarray256 /lift_array256.
case(2 = r).
+ move => r0; rewrite r0 /=.
  rewrite tP => k kb; rewrite !mapiE 1,2:/#  /= !initiE 1,2:/# /=.
  have := H (256*r+k) _;1:smt().
  rewrite !mapiE /#.
case(1 = r).
+ move => r0?; rewrite r0 /= ifT 1:/#.
  rewrite tP => k kb; rewrite !mapiE 1,2:/#  /= !initiE 1,2:/# /=.
  have := H (256*r+k) _;1:smt().
  rewrite !mapiE /#.
move => *.
have -> /= : r= 0 by smt().
rewrite !ifT 1..2:/#.
rewrite tP => k kb; rewrite !mapiE 1,2:/#  /= !initiE 1,2:/# /=.
have := H (256*r+k) _;1:smt().
rewrite !mapiE /#.
qed.

(* Relocated from proof/correctness/768/ref/MLKEM_InnerPKE.ec.
   Generic identity: lifting a W16-Array via lift_polyvec then taking
   toipolyvec yields the same int array as mapping asint over lift_array768. *)
lemma toipolivec_lift (_v : W16.t Array768.t) :
  toipolyvec (lift_polyvec _v) = map asint (lift_array768 _v).
proof.
rewrite /toipolyvec /lift_polyvec /lift_array768 /fromarray256; congr => /=; rewrite tP => k kb.
rewrite mapiE 1:/# /= initiE 1:/# /= /lift_array256 /subarray256.
case (0 <= k < 256) => *; first by rewrite getvE offunvE /= 1:/# mapiE 1:/# /= initiE 1:/# /=.
case (256 <= k < 512) => *; first by rewrite getvE offunvE /= 1:/# mapiE 1:/# /= initiE 1:/# /=.
by rewrite getvE offunvE /= 1:/# mapiE 1:/# /= initiE 1:/# /=.
qed.
