require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel.
require import Fq Array16 Array32 Array128 Array256 Array400 Array768.
require import W16extra WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800.
require import Ops.
require import List_hakyber.
require import KyberCPA_avx2.
require import KyberPolyvec_avx2_prevec.
require import KyberPoly_avx2_proof.
require import Fq_avx2.

theory KyberPolyvecAVX2.

import Fq.
import SignedReductions.
import Kyber_.
import ZModField.
import KyberPolyAVX.

op lift_array768 (p: W16.t Array768.t) =
  Array768.map (fun x => inzmod (W16.to_sint x)) p.

op signed_bound768_cxq(coefs : W16.t Array768.t, l u c : int) : bool =
  forall k, l <= k < u => b16 coefs.[k] (c*Kyber_.q).

lemma polvec_add_corr_h _a _b ab bb:
      hoare[ Mavx2_prevec.polyvec_add2:
           (0 <= ab <= 6 /\ 0 <= bb <= 3) /\
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\
           forall k, 0 <= k < 768 =>
             inzmod (to_sint res.[k]) = _a.[k] + _b.[k]].
proof.
  proc.
  wp.
  ecall (KyberPolyAVX.poly_add_corr (lift_array256 (Array256.init (fun i => r.[(2 * 256) + i]))) (lift_array256 (Array256.init (fun i => b.[(2 * 256) + i]))) ab bb).
  wp.
  ecall (KyberPolyAVX.poly_add_corr (lift_array256 (Array256.init (fun i => r.[256 + i]))) (lift_array256 (Array256.init (fun i => b.[256 + i]))) ab bb).
  wp.
  ecall (KyberPolyAVX.poly_add_corr (lift_array256 (Array256.init (fun i => r.[0 + i]))) (lift_array256 (Array256.init (fun i => b.[0 + i]))) ab bb).
  wp. skip.
  move => &hr [[a_i b_i] [_a_def] [_b_def] [sgnd_bnd_rp] sgnd_bnd_bp].
  rewrite a_i b_i => />.
  split.
  smt(@Array768 @Array256).
  move => sgnd_bnd_rp_1 sgnd_bnd_bp_1 result_1 sgnd_bnd_res_1 res_1_def.
  split.
  smt(@Array256 @Array768).
  move => sgnd_bnd_rp_2 sgnd_bnd_bp_2 result_2 sgnd_bnd_res_2 res_2_def.
  split.
  smt(@Array256 @Array768).
  move => sgnd_bnd_rp_3 sgnd_bnd_bp_3 result_3 sgnd_bnd_res_3 res_3_def.
  split.
  rewrite /signed_bound768_cxq.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_1.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_2.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_3.
  move => k k_i.
  do rewrite initiE //=.
  move : (sgnd_bnd_res_1 k) (sgnd_bnd_res_2 (k - 256)) (sgnd_bnd_res_3 (k - 512)).
  smt(@Array768 @Array256 @Int).
  move => k k_lb k_ub.
  do rewrite initiE //=.
  case (0 <= k < 256) => k_si.
  move : (res_1_def k k_si).
  move : _a_def _b_def.
  smt(@Array256 @Array768 @KyberPolyAVX @Int).
  case (k < 512) => k_ssi.
  move : (res_2_def (k - 256)).
  rewrite (_: (0 <= k - 256 && k - 256 < 256) = true). move : k_si k_ub k_ssi => /#.
  simplify.
  move : _a_def _b_def.
  smt(@Array256 @Array768 @KyberPolyAVX @Int).
  move : (res_3_def (k - 512)).
  rewrite (_: (0 <= k - 512 && k - 512 < 256) = true). move : k_si k_ub k_ssi => /#.
  simplify.
  move : _a_def _b_def.
  rewrite -lezNgt in k_ssi.
  rewrite k_ub k_ssi //=.
  rewrite /lift_array256.
  do rewrite mapiE 1:/#.
  do rewrite initiE 1:/#.
  smt(@Array256 @Array768 @KyberPolyAVX @Int).
qed.
