require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel.
require import Array1152 Array960 Array768 Array400 Array384 Array256 Array128 Array64 Array32 Array16 Array4 Array8.
require import W16extra WArray512 WArray32 WArray16.
require import AVX2_Ops.
require import Kyber_AVX2_cf.
require import Jkem.
require import Jkem_avx2.
require import KyberPolyvec_avx2_prevec.
require import KyberPoly_avx2_prevec.
require import NTT_avx2.
require import Fq_avx2.
require import Fq.
require import NTT_Fq.
require import KyberPoly.
require import KyberPolyVec.
require import Kyber_AVX_AuxLemmas.
require import KyberPoly_avx2_proof.
require import KyberPolyvec_avx2_proof.
require import KyberPoly_avx2_vec.
require import KyberPolyvec_avx2_vec.

import Kyber.
import Fq.
import SignedReductions.
import Zq.
import ZModP.
import Fq_avx2.
import NTT_Avx2.
import KyberPoly.
import KyberPolyVec.
import AVX2_cf.

import KyberPolyAVX.
import KyberPolyvecAVX.
import KyberPolyAVXVec.
import KyberPolyVecAVXVec.

equiv compressequivvec mem _p : 
  M.__polyvec_compress ~   Jkem.M.__polyvec_compress :
     pos_bound768_cxq a{1} 0 768 2 /\
     pos_bound768_cxq a{2} 0 768 2 /\
    lift_array768 a{1} = lift_array768 a{2} /\ 
    ={rp,Glob.mem} /\ Glob.mem{1} = mem /\   valid_ptr _p (3*320) /\ _p = to_uint rp{1}
    ==> 
    ={Glob.mem} /\  touches mem Glob.mem{1} _p (3*320).
proof.
  transitivity KyberPolyvec_avx2_prevec.Mprevec.polyvec_compress
               (={rp, a, Glob.mem} /\ valid_ptr (W64.to_uint rp{1}) (3*320) /\ _p = to_uint rp{1} ==> 
                   ={res, Glob.mem})
               (valid_ptr (W64.to_uint rp{1}) (3*320) /\
                pos_bound768_cxq a{1} 0 768 2 /\
                pos_bound768_cxq a{2} 0 768 2 /\
                lift_array768 a{1} = lift_array768 a{2} /\ ={rp,Glob.mem} /\ Glob.mem{1} = mem /\
                _p = to_uint rp{1} ==>
                ={Glob.mem}  /\  touches mem Glob.mem{1} _p (3*320)); 1,2: smt().  
    + symmetry. proc * => /=. call prevec_eq_polyvec_compress => //=.
  transitivity EncDec_AVX2.encode10_opt_vec
               (a{2} = compress_polyvec 10  (lift_vector a{1}) /\
                pos_bound768_cxq a{1} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{2}.[i] < q) /\
                to_uint rp{1} = _p /\ valid_ptr _p (3*320) /\ Glob.mem{1} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{1} _p (3*320) /\
                load_array960 Glob.mem{1} _p = res{2})
               (pos_bound768_cxq a{2} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{1}.[i] < q) /\
                a{1} = compress_polyvec 10 (lift_vector a{2}) /\
                to_uint rp{2} = _p /\ valid_ptr _p 960 /\ Glob.mem{2} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{2} _p 960 /\
                load_array960 Glob.mem{2} _p = res{1}).
    auto => &1 &2 [#] valid_p pos_bound_al pos_bound_ar al_eq_ar p_eq />.
    exists Glob.mem{2}.
      exists (compress_polyvec 10 (lift_vector a{1})).
        rewrite pos_bound_al pos_bound_ar /=.
        do split.
        + move => i ib; rewrite /compress_polyvec /lift_vector !mapiE //=. 
          pose x := fromarray256 _ _ _.
          move : (compress_rng x.[i] 10 _) => //=; smt (qE).
        + smt().
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
        + move => i ib; rewrite /compress_polyvec /lift_vector !mapiE //=. 
          pose x := fromarray256 _ _ _.
          move : (compress_rng x.[i] 10 _) => //=; smt (qE).
        + congr; rewrite /lift_vector KMatrix.Vector.eq_vectorP => i ib /=.
          rewrite !KMatrix.Vector.offunvE /kvec //=.
          rewrite /lift_array768 /subarray256 /lift_array256 tP => k kb.
          rewrite !mapiE //= !initiE //=.
          smt(@Array768).
        + smt().
        + smt().
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
    rewrite /touches; auto => &1 &m &2 [#] H0 H1 [#] H2 H3 /> *; split ; last by smt().
    apply mem_eq_ext => i.
    have ->: forall (j: address), Glob.mem{1}.[j] = if _p + 0 <= j < _p + 960 then res{m}.[j - _p]
                                                      else mem.[j].
      move => j.
      case (_p + 0 <= j < _p + 960) => jbb.
        + move : H1; rewrite /load_array960 Array960.tP => H1.
          rewrite -H1. move : jbb; smt(@IntDiv @Int @List).
          rewrite initiE /=; first by move : jbb; smt(@IntDiv @Int @List).
          by move : jbb; smt(@IntDiv @Int @List).
        + move : (H0 (j - _p)) => /#.
    have ->: forall (j: address), Glob.mem{2}.[j] = if _p + 0 <= j < _p + 960 then res{m}.[j - _p]
                                                     else mem.[j].
      move => j.
      case (_p + 0 <= j < _p + 960) => jbb.
        + move : H3; rewrite /load_array960 Array960.tP => H3.
          rewrite -H3. move : jbb; smt(@IntDiv @Int @List).
          rewrite initiE /=; first by move : jbb; smt(@IntDiv @Int @List).
          by move : jbb; smt(@IntDiv @Int @List).
        + move : (H2 (j - _p)) => /#.
    trivial.
    + proc * => /=.
      ecall (polyvec_compress_corr (lift_vector a{1}) _p  mem) => //=. 
  symmetry.
  transitivity EncDec.encode10_vec
               (u{2} = compress_polyvec 10 (lift_vector a{1}) /\
                pos_bound768_cxq a{1} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= u{2}.[i] < q) /\
                to_uint rp{1} = _p /\ valid_ptr _p 960 /\ Glob.mem{1} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{1} _p 960 /\
                load_array960 Glob.mem{1} _p = res{2})
               ((forall i, 0<=i<768 => 0 <= u{1}.[i] < q) /\
                u{1} = a{2} /\
                ={Glob.mem} ==> ={Glob.mem, res}). 
               auto => &1 &2 [#] pos_bound_a a2_bnd a1_eq_a2 _p_eq_urp valid_p />.
               exists Glob.mem{1}.
                 exists (compress_polyvec 10 (lift_vector a{1})).
                   auto => />;do split.
                   + move => i ibl ibh; rewrite /compress_polyvec /lift_vector !mapiE //=. 
                     pose x := fromarray256 _ _ _.
                     move : (compress_rng x.[i] 10 _) => //=; smt (qE).
                   + move => i ibl ibh; rewrite /compress_polyvec /lift_vector !mapiE //=. 
                     pose x := fromarray256 _ _ _.
                     move : (compress_rng x.[i] 10 _) => //=; smt (qE).
                   + smt().
               smt().
    + proc * => /=.
      ecall (KyberPolyVec.polyvec_compress_corr mem _p (lift_array768 a{1})) => //=.
      auto => /> &1 H H0 H1 H2.
        + rewrite /compress_polyvec; congr. 
          rewrite /fromarray256 /lift_vector /lift_array768 tP => i ib /=.
          rewrite !initiE //= !mapiE //= !KMatrix.Vector.offunvE //=.
          rewrite /subarray256 /lift_array256 /=.
          smt(@Array256).
  symmetry.
  proc * => /=.
  call encode10_opt_corr.
  auto => />.
qed.

equiv compressequivvec_1 mem : 
  M.__polyvec_compress_1 ~   Jkem.M.__i_polyvec_compress :
     pos_bound768_cxq a{1} 0 768 2 /\
     pos_bound768_cxq a{2} 0 768 2 /\
    lift_array768 a{1} = lift_array768 a{2} /\ 
    ={Glob.mem} /\ Glob.mem{1} = mem 
    ==> 
    ={Glob.mem,res} /\  Glob.mem{1} = mem.
admitted. (* Miguel/MBB: need to add to Mprevec *)


lemma poly_decompress_equiv mem _p : 
    equiv [ M._poly_decompress ~   Jkem.M._poly_decompress  :
             valid_ptr _p 128 /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             ={Glob.mem,ap}
              ==>
             ={Glob.mem,res} /\ Glob.mem{1} = mem /\
             lift_array256 res{1} = lift_array256 res{2} /\
             pos_bound256_cxq res{1} 0 256 1 /\
             pos_bound256_cxq res{2} 0 256 1 ].
proof.
  transitivity KyberPoly_avx2_prevec.Mprevec.poly_decompress
               (={ap, Glob.mem} /\ valid_ptr _p 128 /\ Glob.mem{1} = mem /\ _p = to_uint ap{1} ==> 
                   ={res, Glob.mem})
               (={ap, Glob.mem} /\ valid_ptr _p 128 /\ Glob.mem{1} = mem /\ _p = to_uint ap{2} ==>
                ={res, Glob.mem} /\
                Glob.mem{1} = mem /\
                lift_array256 res{1} = lift_array256 res{2} /\
                pos_bound256_cxq res{1} 0 256 1 /\
                pos_bound256_cxq res{2} 0 256 1); 1,2: smt().
    symmetry. proc * => /=. call prevec_eq_poly_decompress => //=.
  transitivity EncDec_AVX2.decode4
               (valid_ptr _p 128 /\ ={Glob.mem} /\
                Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
                load_array128 Glob.mem{1} _p = a{2} ==>
                ={Glob.mem} /\ Glob.mem{1} = mem /\
                lift_array256 res{1} = decompress_poly 4 res{2} /\
                pos_bound256_cxq res{1} 0 256 1)
               (valid_ptr _p 128 /\ ={Glob.mem} /\
                Glob.mem{2} = mem /\ to_uint ap{2} = _p /\
                load_array128 Glob.mem{2} _p = a{1} ==>
                ={Glob.mem} /\ Glob.mem{2} = mem /\
                lift_array256 res{2} = decompress_poly 4 res{1} /\
                pos_bound256_cxq res{2} 0 256 1).
    auto => &1 &2 [#] ap_eq mem_eq valid_p mem_def _p_def />.
    exists mem.
      exists (load_array128 mem _p).
        rewrite valid_p -mem_eq -ap_eq mem_def ap_eq _p_def //=.
        auto => &1 &m &2 [#] H0 H1 H2 H3 [#] H4 H5 H6 H7 />.
        do split.
        + rewrite /lift_array256 /decompress_poly /decompress Array256.tP in H2.
          rewrite /pos_bound256_cxq /bpos16 in H3.
          rewrite /pos_bound256_cxq /bpos16 in H7.
          rewrite /lift_array256 /decompress_poly /decompress Array256.tP in H6.
          apply Array256.ext_eq => x x_b.
            rewrite to_uint_eq -to_sint_unsigned. by move : H3 => /#.
            rewrite -to_sint_unsigned. by move : H7 => /#.
            move : (H2 x x_b); rewrite mapiE 1:x_b mapiE 1:x_b /= -eq_inFq (pmod_small _ q) 1:H3 1:x_b => ->.
            move : (H6 x x_b); rewrite mapiE 1:x_b mapiE 1:x_b /= -eq_inFq (pmod_small _ q) 1:H7 1:x_b => -> //=.
        + by rewrite H0 H4.
        + by rewrite H2 H6.
        + proc * => /=.
          ecall (poly_decompress_corr (Glob.mem{1}) (to_uint ap{1}) (load_array128 Glob.mem{1} _p)) => //=.
  symmetry.
  transitivity EncDec.decode4
               (valid_ptr _p 128 /\
                Glob.mem{1} = mem /\ _p = to_uint ap{1} /\
                load_array128 Glob.mem{1} _p = a{2} ==>
                Glob.mem{1} = mem /\
                lift_array256 res{1} = decompress_poly 4 res{2} /\
                pos_bound256_cxq res{1} 0 256 1)
               (mem = Glob.mem{2} /\ a{1} = a{2} ==>
                ={res} /\ mem = Glob.mem{2}).
    auto => &1 &2 [#] H0 H1 H2 H3 H4 />.
    exists (load_array128 Glob.mem{1} _p).
        rewrite H0 H1 H4 H2 H3 //=.
      auto => />.
    proc * => /=.
    ecall (KyberPoly.poly_decompress_corr mem (to_uint ap{1}) (load_array128 mem _p)) => //=.
  symmetry.
  proc * => /=.
  call eq_decode4.
  auto => />.
qed.

lemma polyvec_decompress_equiv mem _p : 
    equiv [ M.__polyvec_decompress ~   Jkem.M.__polyvec_decompress  :
             valid_ptr _p (3*128) /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p /\
             ={Glob.mem} /\ rp{1} = ap{2}
              ==>
             ={Glob.mem,res} /\ Glob.mem{1} = mem /\
             lift_array768 res{1} = lift_array768 res{2} /\
             pos_bound768_cxq res{1} 0 768 1 /\
             pos_bound768_cxq res{2} 0 768 1 ].
admitted. (* MIGUEL/MBB *)


equiv compressequiv_1 mem : 
  M._poly_compress_1 ~   Jkem.M._i_poly_compress :
     pos_bound256_cxq a{1} 0 256 2 /\
     pos_bound256_cxq a{2} 0 256 2 /\
    lift_array256 a{1} = lift_array256 a{2} /\ 
    ={Glob.mem} /\ Glob.mem{1} = mem   
    ==> 
    ={Glob.mem} /\  Glob.mem{1} = mem /\
    res.`1{1} = res.`1{2}.
admitted. (* MIGUEL/MBB: we need to add this to Mprevec *)

equiv compressequiv mem _p : 
  M._poly_compress ~   Jkem.M._poly_compress :
     pos_bound256_cxq a{1} 0 256 2 /\
     pos_bound256_cxq a{2} 0 256 2 /\
    lift_array256 a{1} = lift_array256 a{2} /\ 
    ={Glob.mem,rp} /\ Glob.mem{1} = mem /\   valid_ptr _p 128 /\ _p = to_uint rp{1}
    ==> 
    ={Glob.mem} /\  touches mem Glob.mem{1} _p 128.
proof.
  transitivity KyberPoly_avx2_prevec.Mprevec.poly_compress
               (={rp, a, Glob.mem} /\ valid_ptr (W64.to_uint rp{1}) 128 /\ _p = to_uint rp{1} ==> 
                   ={res, Glob.mem})
               (valid_ptr (W64.to_uint rp{1}) 128 /\
                pos_bound256_cxq a{1} 0 256 2 /\
                pos_bound256_cxq a{2} 0 256 2 /\
                lift_array256 a{1} = lift_array256 a{2} /\ ={rp,Glob.mem} /\ Glob.mem{1} = mem /\
                _p = to_uint rp{1} ==>
                ={Glob.mem}  /\  touches mem Glob.mem{1} _p 128); 1,2: smt().  
    + symmetry. proc * => /=. call prevec_eq_poly_compress => //=. 
  transitivity EncDec_AVX2.encode4
               (p{2} = compress_poly 4 (lift_array256 a{1}) /\
                pos_bound256_cxq a{1} 0 256 2 /\ (forall i, 0<=i<256 => 0 <= p{2}.[i] < q) /\
                to_uint rp{1} = _p /\ valid_ptr _p 128 /\ Glob.mem{1} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{1} _p 128 /\
                load_array128 Glob.mem{1} _p = res{2})
               (pos_bound256_cxq a{2} 0 256 2 /\ (forall i, 0<=i<256 => 0 <= p{1}.[i] < q) /\
                p{1} = compress_poly 4 (lift_array256 a{2}) /\
                to_uint rp{2} = _p /\ valid_ptr _p 128 /\ Glob.mem{2} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{2} _p 128 /\
                load_array128 Glob.mem{2} _p = res{1}).
    auto => &1 &2 [#] valid_p pos_bound_al pos_bound_ar al_eq_ar p_eq />.
    exists Glob.mem{2}.
      exists (compress_poly 4 (lift_array256 a{1})).
        rewrite pos_bound_al pos_bound_ar /=.
        do split.
        + move => i ib; rewrite /compress_poly /lift_array256 !mapiE //=. 
          move : (compress_rng (inFq (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
        + smt().
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
        + move => i ib; rewrite /compress_poly /lift_array256 !mapiE //=. 
          move : (compress_rng (inFq (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
        + smt().
        + smt().
        + smt().
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
    rewrite /touches; auto => &1 &m &2 [#] H0 H1 [#] H2 H3 />.
    apply mem_eq_ext => i.
    have ->: forall (j: address), Glob.mem{1}.[j] = if _p + 0 <= j < _p + 128 then res{m}.[j - _p]
                                                      else mem.[j].
      move => j.
      case (_p + 0 <= j < _p + 128) => jbb.
        + move : H1; rewrite /load_array128 Array128.tP => H1.
          rewrite -H1. move : jbb; smt(@IntDiv @Int @List).
          rewrite initiE /=; first by move : jbb; smt(@IntDiv @Int @List).
          by move : jbb; smt(@IntDiv @Int @List).
        + move : (H0 (j - _p)) => /#.
    have ->: forall (j: address), Glob.mem{2}.[j] = if _p + 0 <= j < _p + 128 then res{m}.[j - _p]
                                                     else mem.[j].
      move => j.
      case (_p + 0 <= j < _p + 128) => jbb.
        + move : H3; rewrite /load_array128 Array128.tP => H3.
          rewrite -H3. move : jbb; smt(@IntDiv @Int @List).
          rewrite initiE /=; first by move : jbb; smt(@IntDiv @Int @List).
          by move : jbb; smt(@IntDiv @Int @List).
        + move : (H2 (j - _p)) => /#.
    trivial.
    + proc * => /=.
      ecall (poly_compress_corr (lift_array256 a{1}) _p  mem) => //=. 
  symmetry.
  transitivity EncDec.encode4
               (p{2} = compress_poly 4 (lift_array256 a{1}) /\
                pos_bound256_cxq a{1} 0 256 2 /\ (forall i, 0<=i<256 => 0 <= p{2}.[i] < q) /\
                to_uint rp{1} = _p /\ valid_ptr _p 128 /\ Glob.mem{1} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{1} _p 128 /\
                load_array128 Glob.mem{1} _p = res{2})
               ((forall i, 0<=i<256 => 0 <= p{1}.[i] < q) /\
                p{1} = p{2} /\
                ={Glob.mem} ==> ={Glob.mem, res}). 
               auto => &1 &2 [#] pos_bound_a a2_bnd a1_eq_a2 _p_eq_urp valid_p />.
               exists Glob.mem{1}.
                 exists (compress_poly 4 (lift_array256 a{1})).
                   auto => />;do split.
                   + move => i ibl ibh; rewrite /load_array256 !mapiE //=.
                     move : (compress_rng (inFq (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
                   + move => i ibl ibh; rewrite /load_array256 !mapiE //=.
                     move : (compress_rng (inFq (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
                   + smt().
               smt().
    + proc * => /=.
      ecall (KyberPoly.poly_compress_corr (lift_array256 a{1}) _p mem) => //=.
  symmetry.
  proc * => /=.
  call eq_encode4.
  auto => />.
qed.


lemma subequiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
    equiv [ M._poly_sub ~ Jkem.M._poly_sub :
      lift_array256 ap{1} = lift_array256 ( ap{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
      signed_bound_cxq ap{2} 0 256 ab /\ 
      signed_bound_cxq bp{2} 0 256 bb /\
      signed_bound_cxq ap{1} 0 256 ab /\ 
      signed_bound_cxq bp{1} 0 256 bb
           ==> lift_array256 res{1} = lift_array256  ( res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab + bb) /\
               signed_bound_cxq res{2} 0 256 (ab + bb) 
              ].
move => boundab boundbb; proc => /=.
exists* ap{2}, bp{2}. elim* => _ap2 _bp2.
while {2} (#pre /\ 0<= to_uint i{2} <= 256 /\ forall k, 0<=k<to_uint i{2} => rp{2}.[k] = _ap2.[k] -_bp2.[k]) (256 - to_uint i{2}); 
 1: by move => &1 ?; auto => /> => &2 ?????????; rewrite ultE /=  !to_uintD_small 1:/# ;
  smt(Array256.set_neqiE Array256.set_eqiE).

exists* ap{1}, bp{1}. elim* => _ap1 _bp1.
while {1} (#pre /\ 0<= i{1} <= 16 /\ forall k, 0<=k<16*i{1} => rp{1}.[k] = _ap1.[k] -_bp1.[k]) (16 - i{1}); last first.
+ auto => />.
  move => &1 &2 H H0 H1 H2 H3 H4; split; 1: smt(). 
  move => i1 res1; split; 1: smt().
  move => ??? res1v; split; 1: smt().
  move => i2 res2; rewrite ultE /=; split; 1: smt().
  move => ??? res2v.
  do split; first last.
  + do 2!( move : H3 H4;rewrite /signed_bound_cxq => H3 H4 k kb; rewrite res1v // 1:/#; 
    move : (H3 k _) (H4 k _)=> // ;
    rewrite /b16 qE to_sintB_small /= /#).
  + do 2!( move : H1 H2;rewrite /signed_bound_cxq => H1 H2 k kb; rewrite res2v // 1:/#; 
    move : (H1 k _) (H2 k _)=> // ;
    rewrite /b16 qE to_sintB_small /= /#).
  rewrite /lift_array256 tP => k kbl; rewrite !mapiE //= res1v 1:/# res2v 1: /#.
  rewrite !to_sintB_small => /=.
  + do 2!( move : H3 H4;rewrite /signed_bound_cxq => H3 H4; 
    move : (H3 k _) (H4 k _)=> // ;
    rewrite /b16 qE /= /#).
  + do 2!( move : H1 H2;rewrite /signed_bound_cxq => H1 H2; 
    move : (H1 k _) (H2 k _)=> // ;
    rewrite /b16 qE /= /#).
   move : H H0; rewrite /lift_array256 !tP => H H0.
   move : (H k _); 1: smt(); rewrite !mapiE //=.  
   move : (H0 k _); 1: smt(); rewrite !mapiE //=.  
   rewrite -!eq_inFq /#.

move => &1 ?; auto => /> => &2 ??????????; do split; 1,2,4: smt().

move => k kbl kbh; rewrite initiE /= 1: /#.
case (k < 16*i{2}); 1: by move => kdif; rewrite set_get_diff // /#. 
move => *; rewrite set_get_eq //= 1,2:/#.
rewrite /VPSUB_16u16; rewrite map2bE 1: /# /=.
congr.
+ rewrite get256E /= ifT 1:/# /= !initiE /= 1,2:/# !initiE 1,2:/# /=.
  rewrite -(W16.to_uintK (_ap1.[k])) of_uint_pack2  /= -iotaredE /=.
  have -> : (32 * i{2} + 2 * (k %% 16)) %/ 2 = k by smt().
  have -> : (32 * i{2} + 2 * (k %% 16)) %% 2 = 0 by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %/ 2 = k by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %% 2 = 1 by smt().
  rewrite !bits8_div //=. 
  congr.
  apply W2u8.Pack.ext_eq => i ib.
  case (i = 0); 1:  by move => -> /=; apply W8.to_uint_eq; smt(). 
  move => *; have -> : i = 1 by smt().
  apply W8.to_uint_eq; smt(). 

congr.
rewrite get256E /= ifT 1:/# /= !initiE /= 1,2:/# !initiE 1,2:/# /=.
  rewrite -(W16.to_uintK (_bp1.[k])) of_uint_pack2  /= -iotaredE /=.
  have -> : (32 * i{2} + 2 * (k %% 16)) %/ 2 = k by smt().
  have -> : (32 * i{2} + 2 * (k %% 16)) %% 2 = 0 by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %/ 2 = k by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %% 2 = 1 by smt().
  rewrite !bits8_div //=. 
  congr.
  apply W2u8.Pack.ext_eq => i ib.
  case (i = 0); 1:  by move => -> /=; apply W8.to_uint_eq; smt(). 
  move => *; have -> : i = 1 by smt().
  apply W8.to_uint_eq; smt(). 
qed.

lemma to_sintInj : injective W16.to_sint. 
rewrite /injective /to_sint /smod /=. 
move => x y. move => HHH. have : to_uint x = to_uint y; last by smt(W16.to_uint_eq).
move : HHH; move : (W16.to_uint_cmp x); move :  (W16.to_uint_cmp y) => /=; smt().
qed.

equiv frommontequiv : 
  M._poly_frommont ~   Jkem.M._poly_frommont :
    lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 2 /\ 
    signed_bound_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_frommont(rp); }
     (={rp} ==> ={r}) 
     (lift_array256  rp{1} = nttunpack (lift_array256 rp{2}) ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    signed_bound_cxq r{1} 0 256 2 /\ 
    signed_bound_cxq r{2} 0 256 2); 1,2: smt(). 
symmetry. call prevec_eq_poly_frommont. auto => />.

ecall{2} (KyberPoly.poly_frommont_corr (map W16.to_sint rp{2})).
ecall{1} (KyberPolyAVX.poly_frommont_corr (map W16.to_sint rp{1})).

auto => />.
move => &1 &2 Hvals r1 H.

split.  
+ by move => k kbl kbh ;rewrite mapE //= initiE //=.
move => H1 _r0 H0.
move : H; rewrite tP => H.

move : H H0;  rewrite qE /Fq.SignedReductions.R /= => H H0.

do split. 
+ rewrite tP => k kb.
  rewrite /lift_array256 /= mapiE //= /nttunpack initiE //=.
  pose a:= nttunpack_idx.[k].
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  move : (H k kb); rewrite !mapiE //= => ->.
  move : (H0 (nttunpack_idx.[k]) _). move : nttunpack_bnd; rewrite allP /#. 
  rewrite -/a => ->.
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{1}.[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{1}.[k] * 1353 && to_sint rp{1}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  move => [corr11 corr12].
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{2}.[a] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{2}.[a] * 1353 && to_sint rp{2}.[a] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  move => [corr21 corr22].
  move : Hvals; rewrite /lift_array256 tP => Hvals.
  move : (Hvals k kb).
  rewrite /lift_array256 /= mapiE //= /nttunpack initiE //=.
  rewrite -/a.
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  rewrite -!Zq.eq_inFq /= /#.

+ rewrite /signed_bound_cxq /= => k kb.
  move : (H k kb); rewrite !mapiE //= => HH.
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{1}.[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{1}.[k] * 1353 && to_sint rp{1}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  smt().

+ rewrite /signed_bound_cxq /= => k kb.
  move : (H0 k kb); rewrite !mapiE //= => HH.
  move : (Fq.SignedReductions.SREDCp_corr ((map W16.to_sint rp{2}).[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  rewrite !mapiE //=.
  have -> /= : -109084672 <= to_sint rp{2}.[k] * 1353 && to_sint rp{2}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  smt().

qed.

equiv reduceequiv : 
  M.__poly_reduce ~   Jkem.M.__poly_reduce :
    lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    pos_bound256_cxq res{1} 0 256 2 /\ 
    pos_bound256_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_reduce(rp); }
     (={rp} ==> ={r}) 
     (lift_array256 rp{1} = nttunpack (lift_array256 rp{2}) ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    pos_bound256_cxq r{1} 0 256 2 /\ 
    pos_bound256_cxq r{2} 0 256 2);1,2: smt(). 
symmetry. call prevec_eq_poly_reduce. auto => />.

ecall{2} (KyberPoly.poly_reduce_corr (lift_array256 rp{2})).
ecall{1} (KyberPolyAVX.poly_reduce_corr (lift_array256 rp{1})).

auto => />.
move => &1 &2; rewrite /lift_array256 tP => Hvals r1; rewrite tP => r1val r1rng r2; rewrite tP => r2val r2rng.

rewrite tP => k kb ;rewrite mapE //= initiE //=.
rewrite /nttunpack initiE //=.
pose a:= nttunpack_idx.[k].
rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
move : (Hvals k kb). rewrite mapiE //=.
rewrite /nttunpack initiE //= -/a mapiE //=. move : nttunpack_bnd; rewrite allP /#.
smt(Array256.mapiE nttunpack_bnd Array256.allP).
qed.

equiv reduceequiv_noperm : 
  M.__poly_reduce ~   Jkem.M.__poly_reduce :
    lift_array256 arg{1} = lift_array256 arg{2} ==> 
    lift_array256 res{1} = lift_array256 res{2} /\
    pos_bound256_cxq res{1} 0 256 2 /\ 
    pos_bound256_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_reduce(rp); }
     (={rp} ==> ={r}) 
     (lift_array256 rp{1} =  (lift_array256 rp{2}) ==> 
    lift_array256 r{1} =  (lift_array256 r{2}) /\
    pos_bound256_cxq r{1} 0 256 2 /\ 
    pos_bound256_cxq r{2} 0 256 2); 1,2: smt(). 
symmetry. call prevec_eq_poly_reduce. auto => />.

ecall{2} (KyberPoly.poly_reduce_corr (lift_array256 rp{2})).
ecall{1} (KyberPolyAVX.poly_reduce_corr (lift_array256 rp{1})).

auto => />.
move => &1 &2; rewrite /lift_array256 tP => Hvals r1; rewrite tP => r1val r1rng r2; rewrite tP => r2val r2rng.

rewrite tP => k kb ;rewrite mapE //= initiE //=.
rewrite !mapiE /=;1: smt().  
move : (Hvals k kb). rewrite mapiE //=.
rewrite  mapiE //=. 
smt(Array256.mapiE).
qed.


import Zq. 


equiv basemulequiv : 
  M._poly_basemul ~   Jkem.M._poly_basemul :
    lift_array256 ap{1} = nttunpack (lift_array256 ap{2}) /\
    lift_array256 bp{1} = nttunpack (lift_array256 bp{2}) /\
    signed_bound_cxq ap{1} 0 256 2 /\  
    signed_bound_cxq bp{1} 0 256 2 /\
    signed_bound_cxq ap{2} 0 256 2 /\  
    signed_bound_cxq bp{2} 0 256 2
                              ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 3 /\ 
    signed_bound_cxq res{2} 0 256 3.
proc*.  
transitivity {1} { r <@ Mprevec.poly_basemul(rp,ap,bp); }
     (={ap,bp} ==> ={r}) 
    (lift_array256 ap{1} = nttunpack (lift_array256 ap{2}) /\
    lift_array256 bp{1} = nttunpack (lift_array256 bp{2}) /\
    signed_bound_cxq ap{1} 0 256 2 /\  
    signed_bound_cxq bp{1} 0 256 2 /\
    signed_bound_cxq ap{2} 0 256 2 /\  
    signed_bound_cxq bp{2} 0 256 2
                              ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    signed_bound_cxq r{1} 0 256 3 /\ 
    signed_bound_cxq r{2} 0 256 3); 1,2: smt(). 
symmetry. call prevec_eq_poly_basemul. auto => />.

ecall{2} (poly_basemul_correct (lift_array256 ap{2}) (lift_array256 bp{2})).
ecall{1} (poly_basemul_avx2_correct (nttpack (lift_array256 ap{1})) (nttpack (lift_array256  bp{1}))).

auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 r2 H6 H7 r1 H8 H9.
rewrite -(nttpackK (lift_array256 r2)) H7 H9 H0 H1. 
by rewrite !nttunpackK.
qed.

lemma poly_add_corr_avx_impl ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 => 
  forall _a _b,
      phoare[ Mprevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
   by move => abb bbb _a _b; apply (KyberPolyAVX.poly_add_corr _a _b ab bb abb bbb).

lemma addequiv  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
    equiv [ M._poly_add2 ~ Jkem.M._poly_add2 :
      lift_array256 rp{1} = lift_array256 (nttunpack rp{2}) /\
      lift_array256 bp{1} = lift_array256 (nttunpack bp{2}) /\
      signed_bound_cxq rp{2} 0 256 ab /\ 
      signed_bound_cxq bp{2} 0 256 bb /\
      signed_bound_cxq rp{1} 0 256 ab /\ 
      signed_bound_cxq bp{1} 0 256 bb
           ==> lift_array256 res{1} = lift_array256  (nttunpack res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab + bb) /\
               signed_bound_cxq res{2} 0 256 (ab + bb) 
              ].
move => abb bbb.
proc*.  
transitivity {1} { r <@ Mprevec.poly_add2(rp,bp); }
     (={rp,bp} ==> ={r}) 
     (lift_array256 rp{1} = lift_array256 (nttunpack rp{2}) /\
      lift_array256 bp{1} = lift_array256 (nttunpack bp{2}) /\
    signed_bound_cxq rp{1} 0 256 ab /\  
    signed_bound_cxq bp{1} 0 256 bb /\
    signed_bound_cxq rp{2} 0 256 ab /\  
    signed_bound_cxq bp{2} 0 256 bb
                              ==> 
    lift_array256 r{1} = lift_array256 (nttunpack r{2}) /\
    signed_bound_cxq r{1} 0 256 (ab+bb) /\ 
    signed_bound_cxq r{2} 0 256 (ab+bb)); 1,2: smt(). 
symmetry. call prevec_eq_poly_add2. auto => />.

have Hright :=  (poly_add_correct_impl ab bb abb bbb).
ecall{2} (Hright (lift_array256 rp{2}) (lift_array256 bp{2})).
have Hleft :=  (poly_add_corr_avx_impl ab bb abb bbb).
ecall{1} (Hleft (lift_array256 rp{1}) (lift_array256  bp{1})).

auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 r2 H6 H7 r1 H8 H9.
rewrite /lift_array256 tP => k kb.
rewrite !mapiE //=.
rewrite /nttunpack initiE //=.
pose a:= nttunpack_idx.[k].
rewrite H7 // H9; 1: smt(nttunpack_bnd Array256.allP).
rewrite /lift_array256 !mapiE //=;1,2: smt(nttunpack_bnd Array256.allP). 
rewrite /lift_array256 !tP in H0.
rewrite /lift_array256 !tP in H1.
move : (H0 k kb); rewrite !mapiE //=.
move : (H1 k kb); rewrite !mapiE //=.
smt(Array256.initiE).
qed.

lemma addequiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
    equiv [ M._poly_add2 ~ Jkem.M._poly_add2 :
      lift_array256 rp{1} = lift_array256 ( rp{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
      signed_bound_cxq rp{2} 0 256 ab /\ 
      signed_bound_cxq bp{2} 0 256 bb /\
      signed_bound_cxq rp{1} 0 256 ab /\ 
      signed_bound_cxq bp{1} 0 256 bb
           ==> lift_array256 res{1} = lift_array256  ( res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab + bb) /\
               signed_bound_cxq res{2} 0 256 (ab + bb) 
              ].
move => abb bbb.
proc*.  
transitivity {1} { r <@ Mprevec.poly_add2(rp,bp); }
     (={rp,bp} ==> ={r}) 
     (lift_array256 rp{1} = lift_array256 ( rp{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
    signed_bound_cxq rp{1} 0 256 ab /\  
    signed_bound_cxq bp{1} 0 256 bb /\
    signed_bound_cxq rp{2} 0 256 ab /\  
    signed_bound_cxq bp{2} 0 256 bb
                              ==> 
    lift_array256 r{1} = lift_array256 ( r{2}) /\
    signed_bound_cxq r{1} 0 256 (ab+bb) /\ 
    signed_bound_cxq r{2} 0 256 (ab+bb)); 1,2: smt().
symmetry. call prevec_eq_poly_add2. auto => />.

have Hright :=  (poly_add_correct_impl ab bb abb bbb).
ecall{2} (Hright (lift_array256 rp{2}) (lift_array256 bp{2})).
have Hleft :=  (poly_add_corr_avx_impl ab bb abb bbb).
ecall{1} (Hleft (lift_array256 rp{1}) (lift_array256  bp{1})).

auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 r2 H6 H7 r1 H8 H9.
rewrite /lift_array256 tP => k kb.
rewrite !mapiE //=.
rewrite H7 // H9 /#.
qed.

equiv frommsgequiv_noperm  : 
  M._poly_frommsg_1 ~   Jkem.M._i_poly_frommsg :
    ={ap} ==> 
    lift_array256 res{1} = lift_array256 res{2} /\
    pos_bound256_cxq res{1} 0 256 1 /\ 
    pos_bound256_cxq res{2} 0 256 1.
transitivity Mprevec.poly_frommsg_1
     (={ap,rp} ==> ={res}) 
     (={ap}
                              ==> 
    lift_array256 res{1} = lift_array256 ( res{2}) /\
    pos_bound256_cxq res{1} 0 256 1 /\
    pos_bound256_cxq res{2} 0 256 1);1,2: smt().
symmetry. proc*; call prevec_eq_poly_frommsg. auto => />.

  transitivity EncDec_AVX2.decode1_opt
               (
    ap{1} = a{2} ==> 
    lift_array256 res{1} = decompress_poly 1 res{2} /\
    pos_bound256_cxq res{1} 0 256 1)
               (
    a{1} = ap{2} ==> 
    decompress_poly 1 res{1} = lift_array256 ( res{2}) /\
    pos_bound256_cxq res{2} 0 256 1);1,2: smt(). 
    proc*; ecall (poly_frommsg_corr ap{1}). auto => />.
    transitivity EncDec.decode1 
      (={a} ==> ={res})
               (
    a{1} = ap{2} ==> 
    decompress_poly 1 res{1} = lift_array256 ( res{2}) /\
    pos_bound256_cxq res{2} 0 256 1);1,2: smt(). 
    proc*. admit. (* Reify ecall (eq_decode1_opt). auto => />. *)
    
    symmetry; proc*; ecall  (KyberPoly.poly_frommsg_corr ap{1}); auto => />;smt().
qed.

equiv tomsgequiv_noperm  : 
  M._poly_tomsg_1 ~   Jkem.M._i_poly_tomsg :
    lift_array256 a{1} = lift_array256 a{2} /\
    pos_bound256_cxq a{1} 0 256 2 /\ 
    pos_bound256_cxq a{2} 0 256 2 ==>
    res{1}.`1 = res{2}.`1.
transitivity Mprevec.poly_tomsg_1
     (={a,rp} ==> res{1}.`1 = res{2}.`1) 
     (lift_array256 a{1} = lift_array256 ( a{2}) /\
    pos_bound256_cxq a{1} 0 256 2 /\
    pos_bound256_cxq a{2} 0 256 2
                              ==> 
    res{1}.`1 = res{2}.`1);1,2: smt(). 
symmetry. proc*; call prevec_eq_poly_tomsg. auto => />.

  transitivity EncDec_AVX2.encode1
               (
    a{2} = compress_poly 1 (lift_array256 a{1}) /\
    pos_bound256_cxq a{1} 0 256 2
                              ==> 
    res{1}.`1 = res{2})
               (
    a{1} = compress_poly 1 (lift_array256 a{2}) /\
    pos_bound256_cxq a{2} 0 256 2
                              ==> 
    res{2}.`1 = res{1});1,2: smt(). 
    proc*; ecall (poly_tomsg_corr (lift_array256 a{1})). auto => />.
    transitivity EncDec.encode1 
      (={a} ==> ={res})
               (
    a{1} = compress_poly 1 (lift_array256 a{2}) /\
    pos_bound256_cxq a{2} 0 256 2
                              ==> 
    res{2}.`1 = res{1});1,2: smt(). 
    proc*. admit. (* Reify ecall (eq_encode1). auto => />. *)
    
    symmetry; proc*; ecall  (KyberPoly.poly_tomsg_corr (lift_array256 a{1})); auto => />. 
qed.

lemma polyvec_tobytes_equiv :
    forall (_p : int),
    equiv [ Jkem_avx2.M.__polyvec_tobytes ~ Jkem.M.__polyvec_tobytes :
             _p = to_uint rp{1} /\
             valid_ptr (W64.to_uint rp{1}) (3*384) /\
             pos_bound768_cxq a{1} 0 768 2 /\
             pos_bound768_cxq a{2} 0 768 2 /\
             lift_array768 a{1} = nttunpackv (lift_array768 a{2}) /\ ={rp,Glob.mem} ==> ={Glob.mem} ].
proof.
  move => _p.
  transitivity KyberPolyvec_avx2_prevec.Mprevec.polyvec_tobytes
               (={rp, a, Glob.mem} /\ valid_ptr (W64.to_uint rp{1}) 1152 /\ _p = to_uint rp{1} ==> ={res, Glob.mem})
               (valid_ptr (W64.to_uint rp{1}) 1152 /\
                pos_bound768_cxq a{1} 0 768 2 /\
                pos_bound768_cxq a{2} 0 768 2 /\
                lift_array768 a{1} = nttunpackv (lift_array768 a{2}) /\ ={rp,Glob.mem} /\
                _p = to_uint rp{1} ==>
                ={Glob.mem}); first 2 by smt().
    + symmetry. proc * => /=. call prevec_eq_polyvec_tobytes => //=.
  transitivity EncDec_AVX2.encode12_opt_vec
               (map inFq a{2} = lift_array768 (nttpackv a{1}) /\
                pos_bound768_cxq a{1} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{2}.[i] < q) /\
                to_uint rp{1} = _p /\ valid_ptr _p (3*384) /\
                ={Glob.mem} ==>
                touches Glob.mem{2} Glob.mem{1} _p (3*384) /\
                load_array1152 Glob.mem{1} _p = res{2})
               (pos_bound768_cxq a{2} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{1}.[i] < q) /\
                map inFq a{1} = lift_array768 a{2} /\
                to_uint rp{2} = _p /\ valid_ptr _p (3*384) /\
                ={Glob.mem} ==>
                touches Glob.mem{1} Glob.mem{2} _p (3*384) /\
                load_array1152 Glob.mem{2} _p = res{1}).
    auto => &1 &2 [#] valid_p pos_bound_al pos_bound_ar al_eq_ar p_eq />.
    exists Glob.mem{2}.
      exists (map (fun x => (W16.to_sint x) %% q) (nttpackv a{1})).
        rewrite pos_bound_al pos_bound_ar /=.
        do split.
        + rewrite /lift_array768 tP => i i_b.
          rewrite mapiE 1://= mapiE 1://= mapiE 1://= //=.
          rewrite -eq_inFq modz_mod => />.
        + move => i i_b.
          rewrite mapiE 1:i_b /=.
          rewrite modz_cmp 1:qE //=.
        + move : (W64.to_uint_cmp rp{1}) => //=.
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
        + move => i i_b.
          rewrite mapiE 1:i_b /=.
          rewrite modz_cmp 1:qE //=.
        + rewrite /lift_array768 tP => i i_b.
          rewrite mapiE 1://= mapiE 1://= mapiE 1://= //=.
          rewrite -eq_inFq modz_mod eq_inFq => />.
          rewrite -(Array768.mapiE (fun x => inFq (W16.to_sint x))) 1:i_b.
          rewrite (_: (map (fun x => inFq (W16.to_sint x)) (nttpackv a{1})) = lift_array768 (nttpackv a{1})) => />.
          rewrite -nttpackv_lift al_eq_ar unpackvK //=.
          rewrite /lift_array768 mapiE 1:i_b //=.
        + rewrite p_eq //=.
        + move : (W64.to_uint_cmp rp{1}) => //=.
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
    rewrite /touches; auto => &1 &m &2 [#] H0 H1 [#] H2 H3 />.
    apply mem_eq_ext => i.
    have ->: forall (j: address), Glob.mem{1}.[j] = if _p + 0 <= j < _p + 1152 then res{m}.[j - _p]
                                                      else Glob.mem{m}.[_p + (j - _p)].
      move => j.
      case (_p + 0 <= j < _p + 1152) => jbb.
        + move : H1; rewrite /load_array1152 Array1152.tP => H1.
          rewrite -H1. move : jbb; smt(@IntDiv @Int @List).
          rewrite initiE /=; first by move : jbb; smt(@IntDiv @Int @List).
          by move : jbb; smt(@IntDiv @Int @List).
        + rewrite -H0. move : jbb; smt(@IntDiv @Int @List).
          move : jbb => /#.
    have ->: forall (j: address), Glob.mem{2}.[j] = if _p + 0 <= j < _p + 1152 then res{m}.[j - _p]
                                                     else Glob.mem{m}.[_p + (j - _p)].
      move => j.
      case (_p + 0 <= j < _p + 1152) => jbb.
        + move : H3; rewrite /load_array1152 Array1152.tP => H3.
          rewrite -H3. move : jbb; smt(@IntDiv @Int @List).
          rewrite initiE /=; first by move : jbb; smt(@IntDiv @Int @List).
          by move : jbb; smt(@IntDiv @Int @List).
        + rewrite -H2. move : jbb; smt(@IntDiv @Int @List).
          move : jbb => /#.
    trivial.
    + proc * => /=.
      ecall (polyvec_tobytes_corr (Glob.mem{1}) (to_uint rp{1}) (lift_array768 (nttpackv a{1}))) => //=.
  symmetry.
  transitivity EncDec.encode12_vec
               (pos_bound768_cxq a{1} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{2}.[i] < q) /\
                map inFq a{2} = lift_array768 a{1} /\
                to_uint rp{1} = _p /\ valid_ptr _p (3*384) /\
                ={Glob.mem} ==>
                touches Glob.mem{2} Glob.mem{1} _p (3*384) /\
                load_array1152 Glob.mem{1} _p = res{2})
               ((forall i, 0<=i<768 => 0 <= a{1}.[i] < q) /\
                a{1} = a{2} /\
                ={Glob.mem} ==> ={Glob.mem, res}).
               auto => &1 &2 [#] pos_bound_a a2_bnd a1_eq_a2 _p_eq_urp valid_p />.
               exists Glob.mem{1}.
                 exists (arg{2}).
                   split.
                   + auto => />.
                     rewrite valid_p 1:/= //=.
                   + auto => />.
               auto => />.
    + proc * => /=.
      ecall (KyberPolyVec.polyvec_tobytes_corr (Glob.mem{1}) (to_uint rp{1}) (lift_array768 a{1})) => //=.
      auto => />.
  symmetry.
  proc * => /=.
  call encode12_opt_vec_corr.
  auto => />.
qed.


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
transitivity {1} {r0 <@ KyberPolyvec_avx2_prevec.Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array768 r{2} /\
  _b = lift_array768 b{2} /\
  signed_bound768_cxq r{2} 0 768 ab /\
  signed_bound768_cxq b{2} 0 768 bb /\
  _a = nttpackv (lift_array768 r{1}) /\
  _b = nttpackv (lift_array768 b{1}) /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb   ==> 
      lift_array768 r0{1} = nttunpackv (lift_array768 r0{2}) /\ signed_bound768_cxq r0{1} 0 768 (ab + bb) /\ signed_bound768_cxq r0{2} 0 768 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_add2 => //.
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
  rewrite /subarray256 /nttunpack initiE //= initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k].
  do 4!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  do 2!(rewrite ifT; 1: smt(nttunpack_bnd Array256.allP);
   rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite -/b.
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  

case (256<=k<512).
+ move => *.
  rewrite /subarray256 /nttunpack initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k-256].
  do 3!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  do 2!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite -/b.
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  

+ move => *.
  rewrite /subarray256 /nttunpack initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k - 512].
  do 4!(rewrite initiE //=; 1:smt(nttunpack_bnd Array256.allP)).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  do 2!(rewrite /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  do 2!(rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite /a.
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  
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
transitivity {1} {r0 <@ KyberPolyvec_avx2_prevec.Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array768 r{2} /\
  _b = lift_array768 b{2} /\
  signed_bound768_cxq r{2} 0 768 ab /\
  signed_bound768_cxq b{2} 0 768 bb /\
  _a =  (lift_array768 r{1}) /\
  _b =  (lift_array768 b{1}) /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb   ==> 
      lift_array768 r0{1} = (lift_array768 r0{2}) /\ signed_bound768_cxq r0{1} 0 768 (ab + bb) /\ signed_bound768_cxq r0{2} 0 768 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_add2 => //.
have corr1 := (polvec_add_corr ( _a) ( _b) ab bb abb bbb). call {1} corr1.
have corr2 := (polyvec_add_corr _a _b ab bb abb bbb); call {2} corr2.

auto => />.  
move => &1 &2 ????????rr? H rval? H0. 
move : H H0; rewrite /lift_array768 !tP => ? ? k kb. 
rewrite !mapiE;smt(Array768.mapiE).
qed.

lemma polyvec_reduce_equiv _a :
    equiv [ Jkem_avx2.M.__polyvec_reduce ~ Jkem.M.__polyvec_reduce :
       _a  = lift_array768 r{2} /\  _a  = nttpackv (lift_array768 r{1})  ==>
       (forall k, 0 <= k < 768 => bpos16 res{1}.[k] (2*q)) /\
       (forall k, 0 <= k < 768 => bpos16 res{2}.[k] (2*q)) /\
              lift_array768 res{1} = nttunpackv (lift_array768 res{2}) ].
proc*. 
transitivity {1} {r0 <@ KyberPolyvec_avx2_prevec.Mprevec.polyvec_reduce(r); }
       (={r} ==> ={r0})
       (_a = lift_array768 r{2} /\ _a = nttpackv (lift_array768 r{1})   ==> 
      (forall (k : int), 0 <= k && k < 768 => bpos16 r0{1}.[k] (2 * q)) /\
  (forall (k : int), 0 <= k && k < 768 => bpos16 r0{2}.[k] (2 * q)) /\
  lift_array768 r0{1} = nttunpackv (lift_array768  r0{2})); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_reduce => //.
have corr1 := (polvec_reduce_corr (nttunpackv _a)). call {1} corr1.
have corr2 := (polyvec_reduce_corr _a); call {2} corr2.

auto => />. 
move => &1 &2 ?????; do split;1: smt(packvK unpackvK). 
move => ??<-?.
smt(packvK unpackvK). 
qed.

lemma polyvec_reduce_equiv_noperm _a :
    equiv [ Jkem_avx2.M.__polyvec_reduce ~ Jkem.M.__polyvec_reduce :
       _a  = lift_array768 r{2} /\  _a  = lift_array768 r{1}  ==>
       (forall k, 0 <= k < 768 => bpos16 res{1}.[k] (2*q)) /\
       (forall k, 0 <= k < 768 => bpos16 res{2}.[k] (2*q)) /\
              lift_array768 res{1} =  lift_array768 res{2} ].
proc*. 
transitivity {1} {r0 <@ KyberPolyvec_avx2_prevec.Mprevec.polyvec_reduce(r); }
       (={r} ==> ={r0})
       (_a = lift_array768 r{2} /\ _a = (lift_array768 r{1})   ==> 
      (forall (k : int), 0 <= k && k < 768 => bpos16 r0{1}.[k] (2 * q)) /\
  (forall (k : int), 0 <= k && k < 768 => bpos16 r0{2}.[k] (2 * q)) /\
  lift_array768 r0{1} =  (lift_array768  r0{2})); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_reduce => //.
have corr1 := (polvec_reduce_corr ( _a)). call {1} corr1.
have corr2 := (polyvec_reduce_corr _a); call {2} corr2.

auto => /> /#. 
qed.

equiv pointwiseequiv : 
  M.__polyvec_pointwise_acc ~   Jkem.M.__polyvec_pointwise_acc :
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
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=;1:smt().

seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 6 /\
         signed_bound_cxq r{2} 0 256 6).
have Hcall:= addequiv 3 3 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10. do split. 
+ rewrite lift256_nttunpack; apply H5.
+ rewrite lift256_nttunpack; apply H8.
move => ?? r2 r1 ???.
rewrite -lift256_nttunpack;1: assumption.

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
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=;1: smt().


seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 9 /\
         signed_bound_cxq r{2} 0 256 9).
have Hcall:= addequiv 6 3 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 ????????????. do split. 
+ rewrite lift256_nttunpack;1: assumption.
+ rewrite lift256_nttunpack;1: assumption.
move => ?? r2 r1 ???.
rewrite -lift256_nttunpack;1: assumption.

call reduceequiv.
auto => />.
move => &1 &2 ????????? r1 r2 ?.
rewrite /pos_bound256_cxq /signed_bound_cxq => H H0;1: smt().
qed.


equiv nttequiv :
 Jkem_avx2.M.__polyvec_ntt ~ Jkem.M.__polyvec_ntt : 
   lift_array768 arg{1} = lift_array768 arg{2} /\ 
   signed_bound768_cxq arg{1} 0 768 2 /\ 
   signed_bound768_cxq arg{2} 0 768 2 ==>
   lift_array768 res{1} = nttunpackv (lift_array768 res{2}) /\ 
   pos_bound768_cxq res{1} 0 768 2 /\ 
   pos_bound768_cxq res{2} 0 768 2.
proc *. 
ecall {2} (polyvec_ntt_corr r{2}) => /=.
conseq />;1: smt().
ecall {1} (polyvec_ntt_avx2_corr r{1}) => /=.
auto => /> &1 &2 HH?? r H H0 r2 H1 H2. 
have  : lift_vector (nttpackv r) = lift_vector r2.
+ rewrite -H1 -H;congr.
  rewrite /lift_vector KMatrix.Vector.eq_vectorP => k kb.
  rewrite !KMatrix.Vector.offunvE //=.
  rewrite /lift_array768 tP in HH.
  rewrite /subarray256 /lift_array256 tP => i ib.
  move : (HH (k*256+i) _); 1: by smt().
  rewrite !mapiE //= 1,2: /# !initiE //= /#.
rewrite /lift_vector /lift_array768 tP KMatrix.Vector.eq_vectorP => H3 k kb. 
rewrite !mapiE //=.
case (0<=k<256).
+ move => kbb; move : (H3 0 _) => //; rewrite !KMatrix.Vector.offunvE //=.
  rewrite /nttpackv /nttunpackv initiE//= kbb /= /nttunpack initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  move : (HHH a _); 1: smt(). 
  rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/#.
  rewrite initiE//= 1:/# initiE//= 1:/#. 
  pose b := nttpack_idx.[a].
  rewrite ifT 1:/# /nttpack initiE//= 1:/# initiE//= 1:/# mapiE //= 1:/#. 
  move : nttpack_idxK; rewrite allP => Hidx.
  move : (Hidx k _)=>//; smt(mem_iota).

case (256 <= k < 512).
+ move => kbb ?; move : (H3 1 _) => //; rewrite !KMatrix.Vector.offunvE //=.
  rewrite /nttpackv /nttunpackv /= /nttpack /nttunpack initiE//=.
  rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
  rewrite ifF //= ifT //= initiE //= 1:/#.
  pose a := nttunpack_idx.[k-256].
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  rewrite initiE //= 1: /# !mapiE //= 1: /#. 
  move : (HHH (a) _); 1: smt(). 
  rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/# initiE//= 1:/#.
  rewrite ifF 1: /# initiE//= 1:/# initiE//= 1:/#. 
  rewrite ifT 1: /#. 
  pose b := nttpack_idx.[a].
  move : nttpack_idxK; rewrite allP => Hidx.
  move : (Hidx (k-256) _)=>//; smt(mem_iota).

move => *; move : (H3 2 _) => //; rewrite !KMatrix.Vector.offunvE //=.
rewrite /nttpackv /nttunpackv /= /nttpack /nttunpack initiE//=.
rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
rewrite ifF //= ifF //= initiE //= 1:/#.
pose a := nttunpack_idx.[k-512].
move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
rewrite initiE //= 1: /# !mapiE //= 1: /#. 
move : (HHH (a) _); 1: smt(). 
rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/# initiE//= 1:/#.
rewrite ifF 1: /# ifF 1:/# initiE//= 1:/#. 
pose b := nttpack_idx.[a].
rewrite initiE//=  1:/# . 
move : nttpack_idxK; rewrite allP => Hidx.
move : (Hidx (k-512) _)=>//; smt(mem_iota).
qed.

equiv polyinvnttequiv :
 Jkem_avx2.M._poly_invntt ~ Jkem.M._poly_invntt : 
   lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) /\ 
   signed_bound_cxq arg{1} 0 256 2 /\ 
   signed_bound_cxq arg{2} 0 256 2 ==>
   lift_array256 res{1} = lift_array256 res{2} /\ 
   pos_bound256_cxq res{1} 0 256 2 /\ 
   pos_bound256_cxq res{2} 0 256 2.
   admitted. (* MBB *)

equiv invnttequiv :
 Jkem_avx2.M.__polyvec_invntt ~ Jkem.M.__polyvec_invntt : 
   lift_array768 arg{1} = nttunpackv (lift_array768 arg{2}) /\ 
   signed_bound768_cxq arg{1} 0 768 2 /\ 
   signed_bound768_cxq arg{2} 0 768 2 ==>
   lift_array768 res{1} = lift_array768 res{2} /\ 
   pos_bound768_cxq res{1} 0 768 2 /\ 
   pos_bound768_cxq res{2} 0 768 2.
   admitted. (* MBB *)

