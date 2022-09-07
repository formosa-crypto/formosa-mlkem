require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel.
require import Fq Array16 Array32 Array128 Array256 Array400 Array768.
require import W16extra WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800.
require import AVX2_Ops.
require import Jkem_avx2 Jkem.
require import KyberPolyvec_avx2_prevec.
require import KyberPoly_avx2_proof.
require import Fq_avx2.
require import KyberPolyVec.
require import KyberPolyvec_avx2_vec.
require import NTT_avx2.

theory KyberPolyvecAVX.

import Fq.
import SignedReductions.
import Kyber. import KyberSpec.
import Zq.
import KyberPolyAVX.
import KyberPolyVec.
import KyberPoly.
import KyberPoly.
import NTT_Avx2.

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
             inFq (to_sint res.[k]) = _a.[k] + _b.[k]].
proof.
  move => abb bbb.
  proc.
  wp.
  call (KyberPolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[(2 * 256) + i])) (Array256.init (fun i => _b.[(2 * 256) + i])) ab bb abb bbb).
  wp.
  call (KyberPolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[256 + i])) (Array256.init (fun i => _b.[256 + i])) ab bb abb bbb).
  wp.
  call (KyberPolyAVX.poly_add_corr_h (Array256.init (fun i => _a.[0 + i])) (Array256.init (fun i => _b.[0 + i])) ab bb abb bbb).
  wp. skip.
  move => /= &hr; rewrite /lift_array768 /lift_array256 !tP => [#] _a_def _b_def sgnd_bnd_rp sgnd_bnd_bp.
  split.
  + do split => /=; smt(@Array768 @Array256). 
    
  move => [#] ??? sgnd_bnd_bp_1 result_1 [#]  sgnd_bnd_res_1 res_1_def.
  split.
  + rewrite !tP;do split; move => *; rewrite !initiE; smt(@Array256 @Array768).
  move => [#] ???sgnd_bnd_bp_2 result_2 [#] sgnd_bnd_res_2 res_2_def.
  split.
  + rewrite !tP;do split; move => *; rewrite !initiE /= // ?mapiE //; smt(@Array256 @Array768).
  move => [#] ??? sgnd_bnd_bp_3 result_3 [#] sgnd_bnd_res_3 res_3_def.
  split.
  rewrite /signed_bound768_cxq.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_1.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_2.
  rewrite /signed_bound_cxq /b16 in sgnd_bnd_res_3.
  move => k k_i.
  do rewrite initiE //=.
  move : (sgnd_bnd_res_1 k) (sgnd_bnd_res_2 (k - 256)) (sgnd_bnd_res_3 (k - 512)).
  smt(@Array768 @Array256 @Int).
  move => k [#] k_lb k_ub.
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
  do rewrite initiE 1:/#.
  smt(@Array256 @Array768 @KyberPolyAVX @Int).
qed.

lemma polyvec_add_ll : islossless Mprevec.polyvec_add2
  by proc; do 3!(wp; call KyberPolyAVX.poly_add_ll).

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
             inFq (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r.
  move => abb bbb.
  conseq (polyvec_add_ll) (polvec_add_corr_h _a _b ab bb abb bbb).
  by smt().
qed.

lemma polyvec_csubq_corr ap :
  hoare[Mprevec.polyvec_csubq:
       ap = lift_array768 r /\
       pos_bound768_cxq r 0 768 2
       ==>
       ap = lift_array768 res /\
       pos_bound768_cxq res 0 768 1].
proof.
  proc; sp.
  wp.
  ecall (KyberPolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[2 * 256 + i])))).
  wp.
  ecall (KyberPolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[256 + i])))).
  wp.
  ecall (KyberPolyAVX.poly_csubq_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[i])))).
   wp. skip.
   rewrite /lift_array768 /lift_array256 /pos_bound256_cxq !tP;move => &hr [ap_def pos_bound_r]; split.
   split; trivial; smt(@Array256).
   move => [r_eq_r_1 pos_bound_r_1 res1 [r_eq_res_1 pos_bound_res_1] res_1_def]; split.
   split; trivial => k kb @/res_1_def; rewrite !initiE //=; smt(@Array768 @Array256 qE).
   move => [r_eq_r_2 pos_bound_r_2 res2 [r_eq_res_2 pos_bound_res_2] res_2_def]; split.
   split; trivial => k kb @/res_2_def; rewrite !initiE //=; smt(@Array768 @Array256 qE).
   move => [r_eq_r_3 pos_bound_r_3 res3 [r_eq_res_3 pos_bound_res_3] res_3_def]; split.
   rewrite /res_3_def /res_2_def /res_1_def /=.
   rewrite tP => k kb; rewrite ap_def // !mapiE //= initiE //=.
   case (512 <= k < 768) => k_si. 
   rewrite tP in r_eq_res_3; move : (r_eq_res_3 (k - 512) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.
   case (256 <= k < 512) => k_ssi.
   rewrite tP in r_eq_res_2; move : (r_eq_res_2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=.
   rewrite tP in r_eq_res_1; move : (r_eq_res_1 (k ) _);  1:by smt().
   rewrite !mapiE 1,2:/# /=.
   do rewrite initiE 1:/# //=.
    by smt(). by smt().
   case (256 <= k < 512) => k_ssi.
   do rewrite initiE 1:/# //= k_ssi /=.
   rewrite tP in r_eq_res_2; move : (r_eq_res_2 (k - 256) _);  1:by smt().
   rewrite !mapiE 1,2:/# /= => <-.
   do rewrite initiE 1:/# //=. smt().
   rewrite tP in r_eq_res_1; move : (r_eq_res_1 (k ) _);  1:by smt().
   rewrite !mapiE 1,2:/# /=.
   do rewrite initiE 1:/# //=.
    by smt(). 
   rewrite /pos_bound768_cxq => k k_i.
   do rewrite initiE //=.
   rewrite /pos_bound256_cxq /bpos16 //=in pos_bound_res_3.
   rewrite /pos_bound256_cxq /bpos16 //=in pos_bound_res_2.
   rewrite /pos_bound256_cxq /bpos16 //=in pos_bound_res_1.
   move : (pos_bound_res_3 (k - 512))  (pos_bound_res_2 (k - 256))  (pos_bound_res_1 k).
   smt(@Array256 @Array768).
qed.


lemma polyvec_reduce_corr_h _a:
  hoare[Mprevec.polyvec_reduce:
       _a  = lift_array768 r ==>
       _a  = lift_array768 res /\
       forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)].
proof.
  proc; sp.
  wp.
  ecall (KyberPolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[2 * 256 + i])))).
  wp.
  ecall (KyberPolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[256 + i])))).
  wp.
  ecall (KyberPolyAVX.poly_reduce_corr_h (lift_array256 (Array256.init (fun (i : int) => r.[i])))).
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
   do rewrite initiE 1:/# //=.   
   move => k k_i.
   do rewrite initiE //=.
   rewrite /bpos16 //=in res3_bound.
   rewrite /bpos16 //=in res2_bound.
   rewrite /bpos16 //=in res1_bound.
   move : (res3_bound (k - 512))  (res2_bound (k - 256))  (res1_bound k).
   smt(@Array256 @Array768).
qed.

lemma polyvec_reduce_ll : islossless Mprevec.polyvec_reduce
  by proc; do 3!(wp; call KyberPolyAVX.poly_reduce_ll).

lemma polvec_reduce_corr _a:
      phoare[Mprevec.polyvec_reduce:
       _a  = lift_array768 r ==>
       _a  = lift_array768 res /\
       forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)] = 1%r.
  conseq (polyvec_reduce_ll) (polyvec_reduce_corr_h _a).
  by smt().
qed.


equiv compressequivvec mem _p : 
  Jkem_avx2.M.__polyvec_compress ~   M.__polyvec_compress :
     pos_bound768_cxq a{1} 0 768 2 /\
     pos_bound768_cxq a{2} 0 768 2 /\
    lift_array768 a{1} = lift_array768 a{2} /\ 
    ={Glob.mem} /\ Glob.mem{1} = mem /\   valid_ptr _p (3*128) /\ _p = to_uint rp{1}
    ==> 
    ={Glob.mem} /\  touches mem Glob.mem{1} _p (3*128).
admitted.

lemma polyvec_frombytes_equiv :
    equiv [ Jkem_avx2.M.__polyvec_frombytes ~ Jkem.M.__polyvec_frombytes :
             ={Glob.mem,ap} ==>
             lift_array768 res{1} = nttunpackv (lift_array768 res{2}) /\
             pos_bound768_cxq res{1} 0 768 2 /\
             pos_bound768_cxq res{2} 0 768 2 ].
admitted. (* Miguel *)

lemma polyvec_tobytes_equiv :
    equiv [ Jkem_avx2.M.__polyvec_tobytes ~ Jkem.M.__polyvec_tobytes :
             pos_bound768_cxq a{1} 0 768 2 /\
             pos_bound768_cxq a{2} 0 768 2 /\
             lift_array768 a{1} = nttunpackv (lift_array768 a{2}) /\ ={rp,Glob.mem} ==> ={Glob.mem} ].
admitted. (* Miguel *)


lemma polyvec_add2_equiv  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
  forall (_a _b : Fq Array768.t),
    equiv [ Jkem_avx2.M.__polyvec_add2 ~ Jkem.M.__polyvec_add2 :
      _a = lift_array768 r{2} /\
      _b = lift_array768 b{2} /\ signed_bound768_cxq r{2} 0 768 ab /\ signed_bound768_cxq b{2} 0 768 bb /\
      _a = nttpackv (lift_array768 r{1}) /\
      _b = nttpackv (lift_array768 b{1}) /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb
           ==> lift_array768 res{1} = nttunpackv (lift_array768  res{2}) /\
               signed_bound768_cxq res{1} 0 768 (ab + bb) /\
               signed_bound768_cxq res{2} 0 768 (ab + bb) 
              ].
proof. 
move => abb bbb _a _b;proc* => /=.
transitivity {1} {r0 <@ Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array768 r{2} /\
  _b = lift_array768 b{2} /\
  signed_bound768_cxq r{2} 0 768 ab /\
  signed_bound768_cxq b{2} 0 768 bb /\
  _a = nttpackv (lift_array768 r{1}) /\
  _b = nttpackv (lift_array768 b{1}) /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb   ==> 
      lift_array768 r0{1} = nttunpackv (lift_array768 r0{2}) /\ signed_bound768_cxq r0{1} 0 768 (ab + bb) /\ signed_bound768_cxq r0{2} 0 768 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_poly_add2 => //.
have corr1 := (polvec_add_corr (nttunpackv _a) (nttunpackv _b) ab bb abb bbb). call {1} corr1.
have corr2 := (polyvec_add_corr _a _b ab bb abb bbb); call {2} corr2.

auto => />. 
move => &1 &2 ????->->??rr?rval; do split; 1,2: by rewrite packvK.  
move => ??rr0?r0val.
rewrite tP => k kb.
rewrite /(lift_array768 rr0) mapiE //= r0val // !packvK.
have  -> : lift_array768 rr = 
   Array768.init (fun k => (nttpackv (lift_array768 r{1})).[k] + (nttpackv (lift_array768 b{1})).[k])
 by rewrite tP => kk kkb; rewrite initiE //= /(lift_array768 rr) mapiE //= /#.
rewrite /nttunpackv /nttpackv initiE //=.
case (0<=k<256).
+ move => *.
  rewrite /subarray256 /nttunpack initiE //= initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k].
  rewrite /nttpack initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
  pose b := nttpack_idx.[a].
  rewrite ifT. smt(nttunpack_bnd Array256.allP).
  rewrite ifT. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite -/b.
  rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite /b /a.
  move : nttpack_idxK; rewrite allP. smt(mem_iota).  

case (256<=k<512).
+ move => *.
  rewrite /subarray256 /nttunpack initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k - 256].
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite ifF. smt(nttunpack_bnd Array256.allP).
  rewrite ifT. smt(nttunpack_bnd Array256.allP).
  rewrite /nttpack initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
  pose b := nttpack_idx.[a].
  rewrite ifF. smt(nttunpack_bnd Array256.allP).
  rewrite ifT. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite /a.
  move : nttpack_idxK; rewrite allP. smt(mem_iota).  

move => *.
rewrite /subarray256 /nttunpack initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
pose a := nttunpack_idx.[k - 512].
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite ifF. smt(nttunpack_bnd Array256.allP).
rewrite ifF. smt(nttunpack_bnd Array256.allP).
rewrite /nttpack initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
pose b := nttpack_idx.[a].
rewrite ifF. smt(nttunpack_bnd Array256.allP).
rewrite ifF. smt(nttunpack_bnd Array256.allP).
rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
rewrite /a.
move : nttpack_idxK; rewrite allP. smt(mem_iota).  
qed.

lemma polyvec_add2_equiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
  forall (_a _b : Fq Array768.t),
    equiv [ Jkem_avx2.M.__polyvec_add2 ~ Jkem.M.__polyvec_add2 :
      _a = lift_array768 r{2} /\
      _b = lift_array768 b{2} /\ signed_bound768_cxq r{2} 0 768 ab /\ signed_bound768_cxq b{2} 0 768 bb /\
      _a = lift_array768 r{1} /\
      _b = lift_array768 b{1} /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb
           ==> lift_array768 res{1} = lift_array768  res{2} /\
               signed_bound768_cxq res{1} 0 768 (ab + bb) /\
               signed_bound768_cxq res{2} 0 768 (ab + bb) 
              ].
proof. 
move => abb bbb _a _b;proc* => /=.
transitivity {1} {r0 <@ Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array768 r{2} /\
  _b = lift_array768 b{2} /\
  signed_bound768_cxq r{2} 0 768 ab /\
  signed_bound768_cxq b{2} 0 768 bb /\
  _a =  (lift_array768 r{1}) /\
  _b =  (lift_array768 b{1}) /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb   ==> 
      lift_array768 r0{1} = (lift_array768 r0{2}) /\ signed_bound768_cxq r0{1} 0 768 (ab + bb) /\ signed_bound768_cxq r0{2} 0 768 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_poly_add2 => //.
have corr1 := (polvec_add_corr ( _a) ( _b) ab bb abb bbb). call {1} corr1.
have corr2 := (polyvec_add_corr _a _b ab bb abb bbb); call {2} corr2.

auto => />.  
move => &1 &2 ????????rr? H rval? H0. 
move : H H0; rewrite /lift_array768 !tP => ? ? k kb. 
rewrite !mapiE;smt(Array768.mapiE).
qed.

lemma polyvec_reduce_equiv_noperm _a :
    equiv [ Jkem_avx2.M.__polyvec_reduce ~ Jkem.M.__polyvec_reduce :
       _a  = lift_array768 r{2} /\  _a  = lift_array768 r{1}  ==>
       (forall k, 0 <= k < 768 => bpos16 res{1}.[k] (2*q)) /\
       (forall k, 0 <= k < 768 => bpos16 res{2}.[k] (2*q)) /\
              lift_array768 res{1} =  lift_array768 res{2} ].
proc*. 
transitivity {1} {r0 <@ Mprevec.polyvec_reduce(r); }
       (={r} ==> ={r0})
       (_a = lift_array768 r{2} /\ _a = (lift_array768 r{1})   ==> 
      (forall (k : int), 0 <= k && k < 768 => bpos16 r0{1}.[k] (2 * q)) /\
  (forall (k : int), 0 <= k && k < 768 => bpos16 r0{2}.[k] (2 * q)) /\
  lift_array768 r0{1} =  (lift_array768  r0{2})); 1,2: by smt().
  + symmetry. call prevec_eq_poly_reduce => //.
have corr1 := (polvec_reduce_corr ( _a)). call {1} corr1.
have corr2 := (polyvec_reduce_corr _a); call {2} corr2.

auto => /> /#. 
qed.

equiv pointwiseequiv : 
  Jkem_avx2.M.__polyvec_pointwise_acc ~   M.__polyvec_pointwise_acc :
    lift_array768 arg{1}.`2 = nttunpackv (lift_array768 arg{2}.`1) /\
    lift_array768 arg{1}.`3 = nttunpackv (lift_array768 arg{2}.`2) /\
    signed_bound768_cxq arg{1}.`2 0 768 2 /\
    signed_bound768_cxq arg{1}.`3 0 768 2 /\
    signed_bound768_cxq arg{2}.`1 0 768 2 /\
    signed_bound768_cxq arg{2}.`2 0 768 2
    ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 2 /\ 
    signed_bound_cxq res{2} 0 256 2.
proc => /=.
seq 2 3 :(#pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 3 /\
         signed_bound_cxq r{2} 0 256 3).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H k _); 1: smt(). rewrite !initiE//= 1:/# kb /=.
  rewrite /nttunpack !mapiE //= 1:/# !initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 k _); 1: smt(). rewrite !initiE//= 1:/# kb /=.
  rewrite /nttunpack !mapiE //= 1:/# !initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=.
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=.
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=.
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=.


seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 3 /\
         signed_bound_cxq t{2} 0 256 3).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H (256+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifT 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (256+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifT 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=. smt().
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=. smt().
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=. smt().
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=. smt().

seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 6 /\
         signed_bound_cxq r{2} 0 256 6).
have Hcall:= addequiv 3 3 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10. do split. 
+ rewrite lift256_nttunpack. apply H5.
+ rewrite lift256_nttunpack. apply H8.
move => ?? r2 r1 ???.
rewrite -lift256_nttunpack. assumption.

seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 3 /\
         signed_bound_cxq t{2} 0 256 3).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H (512+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifF 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (512+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifF 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=. smt().
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=. smt().
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=. smt().
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=. smt().


seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 9 /\
         signed_bound_cxq r{2} 0 256 9).
have Hcall:= addequiv 6 3 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 ????????????. do split. 
+ rewrite lift256_nttunpack. assumption.
+ rewrite lift256_nttunpack. assumption.
move => ?? r2 r1 ???.
rewrite -lift256_nttunpack. assumption.

call reduceequiv.
auto => />.
move => &1 &2 ????????? r1 r2 ?.
rewrite /pos_bound256_cxq /signed_bound_cxq => H H0. smt().
qed.


end KyberPolyvecAVX.

