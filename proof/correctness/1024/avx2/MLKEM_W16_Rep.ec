require import AllCore List Int IntDiv BitEncoding.
from Jasmin require import JModel.
from JazzEC require import Array256 Array1024 Array1536 Array4096.
from Spec require import GFq Rq VecMat Serialization Correctness1024 EncDecCorrectness1024.
require import MLKEMFCLib.
import MLKEMFCLib1024.
import Zq.
import VecMat1024 PolyVec PolyMat Serialization1024 KMatrix.
import KMatrix.Matrix.
import BitChunking BS2Int.

op lift_polyvec (vec: W16.t Array1024.t) : polyvec =
  Vector.offunv (fun i => lift_array256 (subarray256 vec i)).

op lift_matrix( a : W16.t Array4096.t) : polymat =
   Matrix.offunm (fun i j => subarray256 (subarray1024 (lift_array4096 a) i) j).

(* toipolyvec/lift_polyvec bridge (relocated from ref's MLKEM_InnerPKE.ec). *)
lemma toipolivec_lift (_v : W16.t Array1024.t) :
  toipolyvec (lift_polyvec _v) = map asint (lift_array1024 _v).
proof.
rewrite /toipolyvec /lift_polyvec /lift_array1024 /fromarray256;congr => /=;rewrite tP => k kb.
rewrite mapiE 1:/# /= initiE 1:/# /= /lift_array256 /subarray256.
case (0<=k<256) => * /=.
+ by rewrite getvE offunvE /= 1:/# mapiE 1:/# /= initiE 1:/# /=.
case (256<=k<512) => * /=.
+ by rewrite getvE offunvE /= 1:/# mapiE 1:/# /= initiE 1:/# /=.
case (512<=k<768) => * /=.
+ by rewrite getvE offunvE /= 1:/# mapiE 1:/# /= initiE 1:/# /=.
by rewrite getvE offunvE /= 1:/# mapiE 1:/# /= initiE 1:/# /=.
qed.

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

(* polyvec variant of decode_range, 1024 *)
lemma decode_range_vec dfl (l : W8.t list) n :
  1 < n <= 12 =>
    size l = 1024*n %/ 8 =>
  size (decode n l) = 1024 /\
  (forall k, 0<=k<1024 => 0<= nth dfl (decode n l) k <2^n).
move => ? Hsl *.
rewrite -andaE;split.
+ rewrite /decode size_map size_chunk 1:/# size_BytesToBits Hsl /#.
move => ? k kb.
rewrite /decode.
have := size_nth_chunk witness (BytesToBits l) k n; rewrite size_BytesToBits /= => H.
rewrite (nth_map witness);1: by rewrite size_chunk 1:/# size_BytesToBits Hsl /#.
split => *; 1: smt(BS2Int.bs2int_ge0).
have ? : 8 * size l %/ n = 1024; last by  smt(BS2Int.bs2int_le2Xs).
by rewrite Hsl;smt().
qed.

(* Spec-side bound on decoded 12-bit ints. *)
lemma decode12_vec_bnd (a : W8.t Array1536.t) (k : int) :
  0 <= k < 1024 => 0 <= (decode12_vec a).[k] < 4096.
proof.
move => ?; rewrite /decode12_vec get_of_list 1:/# /decode (nth_map witness).
+ by rewrite size_chunk 1:/# size_BytesToBits size_to_list //=.
have := bs2int_le2Xs (nth witness (chunk 12 (BytesToBits (to_list a))) k).
rewrite size_nth_chunk //=;1: by rewrite size_BytesToBits size_to_list //=.
by smt(bs2int_ge0).
qed.

op unlift_polyvec(a : polyvec) =
   Array1024.init (fun i => W16.of_int (as_sint (a.[i %/ 256])%Vector.[i%%256])).

lemma vector_unlift a :
    lift_polyvec (unlift_polyvec a) = a /\
    signed_bound1024_cxq (unlift_polyvec a) 0 1024 1.
proof.
split.
+ rewrite /lift_vector /unlift_polyvec eq_vectorP => i ib.
  rewrite offunvE //= /subarray256 /lift_array256 /= tP => k kb.
  rewrite mapiE //= initiE //= initiE //= 1:/# /to_sint /smod /=.
  rewrite !of_uintK /=; rewrite /as_sint qE /=.
  by smt(rg_asint asintK).
rewrite /unlift_vector /signed_bound1024_cxq => k kb; rewrite initiE //=.
rewrite /to_sint /smod /= !of_uintK /= /as_sint qE /=.
by smt(rg_asint).
qed.

lemma ofipolyvec_lift vi vw :
  all (fun i => 0 <= i < 32768) vi =>
  lift_array1024 vw = map incoeff vi =>
  ofipolyvec vi = lift_polyvec vw.
rewrite allP /= => ?.
rewrite /lift_array1024 tP => H.
rewrite /ofipolyvec /lift_polyvec !setvE /= eq_vectorP => r rb.
rewrite !offunvE 1,2:/# /= !offunvK /vclamp /= /subarray256 /lift_array256.
case(3 = r).
+ move => r0; rewrite r0 /=.
  rewrite tP => k kb; rewrite !mapiE 1,2:/#  /= !initiE 1,2:/# /=.
  have := H (256*r+k) _;1:smt().
  rewrite !mapiE /#.
case(2 = r).
+ move => r0?; rewrite r0 /= ifT 1:/#.
  rewrite tP => k kb; rewrite !mapiE 1,2:/#  /= !initiE 1,2:/# /=.
  have := H (256*r+k) _;1:smt().
  rewrite !mapiE /#.
case(1 = r).
+ move => r0??; rewrite r0 /= ifT 1:/# ifT 1:/#.
  rewrite tP => k kb; rewrite !mapiE 1,2:/#  /= !initiE 1,2:/# /=.
  have := H (256*r+k) _;1:smt().
  rewrite !mapiE /#.
move => *.
have -> /= : r= 0 by smt().
rewrite !ifT 1..3:/#.
rewrite tP => k kb; rewrite !mapiE 1,2:/#  /= !initiE 1,2:/# /=.
have := H (256*r+k) _;1:smt().
rewrite !mapiE /#.
qed.
