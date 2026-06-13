require import AllCore List Int IntDiv BitEncoding.
from Jasmin require import JModel.
from JazzEC require import Array256 Array768 Array1152 Array2304.
from Spec require import GFq Rq Parameters VecMat Serialization Correctness EncDecCorrectness.
require import MLKEMFCLib.
require import MLKEM768_prelude.
import MLKEMFCLib768.
import Zq.
import VecMat PolyVec PolyMat Serialization KMatrix.
import KMatrix.Matrix.
import BitChunking BS2Int.

op lift_polyvec (vec: W16.t Array768.t) : polyvec =
  KVec.init (fun i => lift_array256 (subarray256 vec i)).

(* lift_matrix / unlift_matrix are now in Correctness768.ec (spec side) --
   no duplicate here. *)

op lift_matrix( a : W16.t Array2304.t) : polymat =
   KMat.init (fun flat => subarray256 (subarray768 (lift_array2304 a) (flat %/ kvec)) (flat %% kvec)).

(* Spec-side bound on decoded 12-bit ints (analog of EncDecCorrectness768.decode1_bnd
   but for decode12_vec). Proof modeled on decode1_bnd. *)
lemma decode12_vec_bnd (a : W8.t BytesPKVec.t) (k : int) :
  0 <= k < 768 => 0 <= (decode12_vec a).[k] < 4096.
proof.
move => ?; have kv := kvec_val.
rewrite /decode12_vec IPVec.get_of_list 1:/# /ByteDecode (nth_map witness).
+ rewrite size_chunk 1:/# size_BytesToBits size_to_list; smt().
have := bs2int_le2Xs (nth witness (chunk 12 (BytesToBits (to_list a))) k).
rewrite size_nth_chunk //=;1: by (rewrite size_BytesToBits size_to_list; smt()).
by smt(bs2int_ge0).
qed.

op unlift_polyvec(a : polyvec) =
   Array768.init (fun i => W16.of_int (as_sint a.[i %/ 256].[i%%256])).

lemma vector_unlift a :
    lift_polyvec (unlift_polyvec a) = a /\
    signed_bound768_cxq (unlift_polyvec a) 0 768 1.
proof.
have kv := kvec_val.
split.
+ rewrite /unlift_polyvec; apply KVec.tP => i ib.
  rewrite /lift_polyvec KVec.initiE 1:/# /= /subarray256 /lift_array256 /= tP => k kb.
  rewrite mapiE //= initiE //= initiE //= 1:/# /to_sint /smod /=.
  rewrite !of_uintK /=; smt(rg_crepr as_sintK qE).
rewrite /unlift_polyvec /signed_bound768_cxq => k kb; rewrite initiE //=.
rewrite /to_sint /smod /= !of_uintK /=; smt(rg_crepr qE).
qed.

(* Relocated from proof/correctness/768/ref/MLKEM_InnerPKE.ec.
   Generic identity: lifting a W16-Array via lift_polyvec then taking
   toipolyvec yields the same int array as mapping asint over lift_array768. *)
lemma toipolivec_lift (_v : W16.t Array768.t) :
  toipolyvec (lift_polyvec _v) = IPVec.init (fun idx => asint (lift_array768 _v).[idx]).
proof.
have kv := kvec_val.
rewrite /toipolyvec; apply IPVec.tP => idx ib.
rewrite !IPVec.initiE 1,2:/# /=; congr.
rewrite /lift_polyvec KVec.initiE 1:/#.
rewrite /= /lift_array256 mapiE 1:/#.
rewrite mapiE 1:/# /subarray256 initiE 1:/# /=.
by have ->: 256 * (idx %/ 256) + idx %% 256 = idx by smt().
qed.
