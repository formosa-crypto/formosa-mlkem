(* ==== from MLKEM_PolyVec_avx2_prevec.ec ==== *)
require import AllCore List Int IntDiv CoreMap.

from Jasmin require import JModel.
from JazzEC require import Array4 Array16 Array32 Array128 Array256 Array400 Array768 Array960.
from JazzEC require import WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800.

require import AVX2_Ops.
from JazzEC require import Jkem_avx2.
require import MLKEM_Poly_avx2.
require import AVX2_Ops MLKEMFCLib.

module Mprevec = {
  proc polyvec_add2 (r:W16.t Array768.t, b:W16.t Array768.t) : W16.t Array768.t = {
    var aux: W16.t Array256.t;
    
    aux <@ MLKEM_Poly_avx2.Mprevec.poly_add2 ((Array256.init (fun i => r.[0 + i])),
    (Array256.init (fun i => b.[0 + i])));
    r <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2.Mprevec.poly_add2 ((Array256.init (fun i => r.[256 + i])),
    (Array256.init (fun i => b.[256 + i])));
    r <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2.Mprevec.poly_add2 ((Array256.init (fun i => r.[(2 * 256) + i])),
    (Array256.init (fun i => b.[(2 * 256) + i])));
    r <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    return (r);
  }


  proc polyvec_reduce (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux: W16.t Array256.t;
    
    
    
    aux <@ MLKEM_Poly_avx2.Mprevec.poly_reduce ((Array256.init (fun i => r.[0 + i])));
    r <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2.Mprevec.poly_reduce ((Array256.init (fun i => r.[256 + i])));
    r <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2.Mprevec.poly_reduce ((Array256.init (fun i => r.[(2 * 256) + i])));
    r <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    return (r);
  }


}.

(* ==== from MLKEM_PolyVec_avx2_vec.ec ==== *)
require import AllCore List Int IntDiv CoreMap.

from Jasmin require import JModel.
from JazzEC require import Array16 Array32 Array128 Array256 Array400 Array768 Array960.
from JazzEC require import WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800 WArray960.
require import AVX2_Ops.
from JazzEC require import Jkem_avx2.


require import AVX2_Ops MLKEMFCLib.

module Mvec = {
  proc polyvec_add2 (r:W16.t Array768.t, b:W16.t Array768.t) : W16.t Array768.t = {
    var aux: W16.t Array256.t;
    
    aux <@ MLKEM_Poly_avx2.Mvec.poly_add2 ((Array256.init (fun i => r.[0 + i])),
    (Array256.init (fun i => b.[0 + i])));
    r <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2.Mvec.poly_add2 ((Array256.init (fun i => r.[256 + i])),
    (Array256.init (fun i => b.[256 + i])));
    r <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2.Mvec.poly_add2 ((Array256.init (fun i => r.[(2 * 256) + i])),
    (Array256.init (fun i => b.[(2 * 256) + i])));
    r <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    return (r);
  }


  proc polyvec_reduce (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux: W16.t Array256.t;
    
    
    
    aux <@ MLKEM_Poly_avx2.Mvec.poly_reduce ((Array256.init (fun i => r.[0 + i])));
    r <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2.Mvec.poly_reduce ((Array256.init (fun i => r.[256 + i])));
    r <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2.Mvec.poly_reduce ((Array256.init (fun i => r.[(2 * 256) + i])));
    r <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    return (r);
  }
}.

theory MLKEM_PolyVecAVXVec.

import MLKEM_PolyAVXVec.

equiv eq_polyvec_add2 :
  Mprevec.polyvec_add2 ~ Mvec.polyvec_add2: ={r, b} ==> ={res}.
proof.
  proc.
  do 3!(wp; call eq_poly_add2).
  auto => />.
qed.


equiv eq_polyvec_reduce :
  Mprevec.polyvec_reduce ~ Mvec.polyvec_reduce: ={r} ==> ={res}.
proof.
  proc.
  do 3!(wp; call eq_poly_reduce).
  auto => />.
qed.

equiv veceq_polyvec_add2 :
  Mvec.polyvec_add2 ~Jkem_avx2.M.__polyvec_add2: ={r, b} ==> ={res}.
proof.
  proc.
  unroll for {2}  2.
  do 3!(wp; call veceq_poly_add2).
  auto => />.
qed.

equiv veceq_polyvec_reduce :
  Mvec.polyvec_reduce ~ Jkem_avx2.M.__polyvec_reduce: ={r} ==> ={res}.
proof.
  proc.
  unroll for {2}  2.
  do 3!(wp; call veceq_poly_reduce).
  auto => />.
qed.

equiv prevec_eq_polyvec_add2 :
  Mprevec.polyvec_add2 ~Jkem_avx2.M.__polyvec_add2: ={r, b} ==> ={res}.
proof.
  transitivity Mvec.polyvec_add2 (={r, b} ==> ={res}) (={r, b} ==> ={res}).
smt(). trivial.
apply eq_polyvec_add2.
apply veceq_polyvec_add2.
qed.


equiv prevec_eq_polyvec_reduce :
  Mprevec.polyvec_reduce ~Jkem_avx2.M.__polyvec_reduce: ={r} ==> ={res}.
proof.
  transitivity Mvec.polyvec_reduce (={r} ==> ={res}) (={r} ==> ={res}).
smt(). trivial.
apply eq_polyvec_reduce.
apply veceq_polyvec_reduce.
qed.


end MLKEM_PolyVecAVXVec.

(* ==== from MLKEM_PolyVec_avx2_proof.ec ==== *)
require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array4 Array8 Array16 Array32 Array128 Array256 Array960 Array384 Array400 Array768 Array1152.
from JazzEC require import WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800.
require import AVX2_Ops W16extra.
from JazzEC require import Jkem_avx2.




require import Fq_avx2.

require import NTT_avx2.
require import MLKEMFCLib.
import MLKEMFCLib768.
require import AVX2_Ops MLKEMFCLib.

from Spec require import GFq Rq VecMat Serialization Correctness.
import Serialization VecMat.

theory MLKEM_PolyvecAVX.


import Zq.
import MLKEM_PolyAVX.
import MLKEM_PolyAVXVec.
import MLKEM_PolyVecAVXVec.
import NTT_Avx2.
import KMatrix.

lemma polvec_add_corr_h _a _b ab bb:
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      hoare[Mprevec.polyvec_add2:
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\
           forall k, 0 <= k < 768 =>
             incoeff (to_sint res.[k]) = _a.[k] + _b.[k]].
proof.
  move => abb bbb.
  proc.
  wp.
  call (MLKEM_PolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[(2 * 256) + i])) (Array256.init (fun i => _b.[(2 * 256) + i])) ab bb abb bbb).
  wp.
  call (MLKEM_PolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[256 + i])) (Array256.init (fun i => _b.[256 + i])) ab bb abb bbb).
  wp.
  call (MLKEM_PolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[0 + i])) (Array256.init (fun i => _b.[0 + i])) ab bb abb bbb).
  wp. skip.
  move => /= &hr; rewrite /lift_array768 /lift_array256 !tP => [#] _a_def _b_def sgnd_bnd_rp sgnd_bnd_bp.
  split.
  + do split => /=; smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE). 
    
  move => [#] ??? sgnd_bnd_bp_1 result_1 [#]  sgnd_bnd_res_1 res_1_def.
  split.
  + rewrite !tP;do split; move => *; rewrite !initiE; smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE). 
  move => [#] ???sgnd_bnd_bp_2 result_2 [#] sgnd_bnd_res_2 res_2_def.
  split.
  + rewrite !tP;do split; move =>  i ib; rewrite !initiE /= // ?mapiE //=;
        have := res_2_def i ib;
     by  smt(Array256.initiE Array768.initiE Array768.set_eqiE Array768.set_neqiE).
     
  move => [#] ??? sgnd_bnd_bp_3 result_3 [#] sgnd_bnd_res_3 res_3_def.
  split.
  rewrite /signed_bound768_cxq.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_1.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_2.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_3.
  move => k k_i.
  do rewrite initiE //=.
  move : (sgnd_bnd_res_1 k) (sgnd_bnd_res_2 (k - 256)) (sgnd_bnd_res_3 (k - 512)).
  smt().
  move => k [#] k_lb k_ub.
  do rewrite initiE //=.
  case (0 <= k < 256) => k_si.
  move : (res_1_def k k_si).
  move : _a_def _b_def.
  smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE). 
  case (k < 512) => k_ssi.
  move : (res_2_def (k - 256)).
  rewrite (_: (0 <= k - 256 && k - 256 < 256) = true). move : k_si k_ub k_ssi => /#.
  simplify.
  move : _a_def _b_def.
  smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE). 
  move : (res_3_def (k - 512)).
  rewrite (_: (0 <= k - 512 && k - 512 < 256) = true). move : k_si k_ub k_ssi => /#.
  simplify.
  move : _a_def _b_def.
  rewrite -lezNgt in k_ssi.
  rewrite k_ub k_ssi //=.
  rewrite /lift_array256.
  do rewrite initiE 1:/#.
  smt(Array256.mapiE Array256.initiE Array768.mapiE Array768.initiE). 
qed.

lemma polyvec_add_ll : islossless Mprevec.polyvec_add2
  by proc; do 3!(wp; call MLKEM_PolyAVX.poly_add_ll).

lemma polvec_add_corr _a _b ab bb:
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      phoare[Mprevec.polyvec_add2:
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\
           forall k, 0 <= k < 768 =>
             incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r.
  move => abb bbb.
  conseq (polyvec_add_ll) (polvec_add_corr_h _a _b ab bb abb bbb).
  by smt().
qed.

lemma polyvec_reduce_corr_h _a:
  hoare[Mprevec.polyvec_reduce:
       _a  = lift_array768 r ==>
       _a  = lift_array768 res /\
       forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)].
proof. 
  proc; sp.
  wp.
  ecall (MLKEM_PolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[2 * 256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[256 + i])))).
  wp.
  ecall (MLKEM_PolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[i])))).
  wp. skip.
  move => &hr _a_def.
  split; first by trivial.
  move => r_eq_r_1 res1 [r_eq_res1 res1_bound] res1_def res2 [r_eq_res2 res2_bound] res2_def res3 [r_eq_res3 res3_bound] res3_def.
  split.
  rewrite /res3_def /res2_def /res1_def /=.
  rewrite _a_def.
  rewrite /lift_array768 tP => k kb.
  rewrite !mapiE //=.
  do rewrite initiE 1:/# //=.
  do rewrite fun_if.
   case (512 <= k < 768) => k_si.
   rewrite /lift_array256 tP in r_eq_res3; move : (r_eq_res3 (k - 512) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.
   case (256 <= k < 512) => k_ssi.
   rewrite /lift_array256 tP in r_eq_res2; move : (r_eq_res2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=. smt(). smt(). 
   case (256 <= k < 512) => k_ssi.
   rewrite /lift_array256 tP in r_eq_res2; move : (r_eq_res2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=. smt().  
   rewrite /lift_array256 tP in r_eq_res1; move : (r_eq_res1 (k) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //= => *; smt().
   move => k k_i.
   do rewrite initiE //=.
   rewrite /bpos16 //=in res3_bound.
   rewrite /bpos16 //=in res2_bound.
   rewrite /bpos16 //=in res1_bound.
   move : (res3_bound (k - 512))  (res2_bound (k - 256))  (res1_bound k).
   smt().
qed.

lemma polyvec_reduce_ll : islossless Mprevec.polyvec_reduce
  by proc; do 3!(wp; call MLKEM_PolyAVX.poly_reduce_ll).

lemma polvec_reduce_corr _a:
      phoare[Mprevec.polyvec_reduce:
       _a  = lift_array768 r ==>
       _a  = lift_array768 res /\
       forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)] = 1%r.
  conseq (polyvec_reduce_ll) (polyvec_reduce_corr_h _a).
  by smt().
qed.



end MLKEM_PolyvecAVX.

