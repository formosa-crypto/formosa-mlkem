require import AllCore IntDiv List.

from Jasmin require import JModel.

from JazzEC require import WArray512 WArray256 WArray128 WArray8 WArray2 WArray32.
from JazzEC require import Array2 Array8 Array16 Array25 Array32 Array33 Array128 Array136 Array768 Array960 Array1024 Array1088 Array2304 Array2144 Array536 Array256.

require import MLKEM_InnerPKE NTT_avx2_invntt MLKEMFCLib AVX2_Ops NTT_AVX_Fq_ntt NTT_AVX_Fq_basemul NTT_AVX_Fq_invntt MLKEM_Poly_avx2_vec.

require import NTT_avx2_ntt NTT_avx2.

require import MLKEM_keccak_avx2.

import NTT_Avx2.

from JazzEC require import Jkem768_avx2 Jkem768.

import GFq Rq Sampling Serialization Symmetric VecMat InnerPKE768 MLKEM768 Fq Correctness768.
import Symmetric768 Serialization768 VecMat768 PolyMat.
import KMatrix.Matrix.
import MLKEM_PolyAVXVec.


module HmoduleLow = {
   proc __gen_matrix(sd : W8.t Array32.t, trans : bool) : W16.t Array2304.t = {
       var aa : polymat;
       if (trans) {
          aa <@ Hmodule.sampleAT(sd);
       }
       else {
          aa <@ Hmodule.sampleA(sd);
       }
       return (unlift_matrix aa);
   }
}.

equiv Hmodule_connection :
   HmoduleLow.__gen_matrix ~ AuxMLKEM.__gen_matrix :
    ={arg} ==> ={res}.
proc. 
case (trans{1});last first.
+ rcondf{1} 1; 1: by auto.
  inline {1} 1;wp. 
  conseq (: _ ==> ={a}) => //.  
  while (0<=i{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i} /\ !trans{1} /\
         (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat);
   last by auto => />;smt(eq_matrixP getmE). 
  wp;conseq />;1:smt().
  while (0<=i{1}<kvec /\ 0<=j{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i,j} /\ !trans{1} /\
         (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat /\
         (forall kk, 0<=kk<j{1} => a{1}.[i{1},kk] = a{2}.[i{1},kk])%PolyMat);
   last by auto => />;smt(getmE). 
   inline XOF.init; sp;wp. 
   exlim rho{2}, i0{2}, j0{2}  => _rho _i _j.
   call {2} (parse_sem (SHAKE128_ABSORB_34 _rho (W8.of_int _i) (W8.of_int _j)) _rho (W8.of_int _i) (W8.of_int _j)).
   auto => /> &1 &2 a1 ?????H H0?;do split;1,2: smt(). 
   + move => kk jj ????.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = i{2} /\ jj = j{2}); 1: by smt().
     move => ?;case (kk < i{2});
      1: by move => ?;move : (H kk jj _ _);  smt().
     move => ?;move : (H0 jj _); smt().
   + move => kk ??.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = j{2}); 1: by smt().
     by move => ?;move : (H0 kk _); smt().
rcondt{1} 1; 1: by auto.
inline {1} 1;wp. 
conseq (: _ ==> ={a}) => //.  
while (0<=i{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i} /\ trans{1} /\
       (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat);
 last by auto => />;smt(eq_matrixP getmE). 
wp;conseq />;1:smt().
while (0<=i{1}<kvec /\ 0<=j{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i,j} /\ trans{1} /\
       (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat /\
       (forall kk, 0<=kk<j{1} => a{1}.[i{1},kk] = a{2}.[i{1},kk])%PolyMat);
 last by auto => />;smt(getmE). 
 inline XOF.init; sp;wp. 
 exlim rho{2}, i0{2}, j0{2}  => _rho _i _j.
 call {2} (parse_sem (SHAKE128_ABSORB_34 _rho (W8.of_int _i) (W8.of_int _j)) _rho (W8.of_int _i) (W8.of_int _j)).
   auto => /> &1 &2 a1 ?????H H0?;do split;1,2: smt(). 
   + move => kk jj ????.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = i{2} /\ jj = j{2}); 1: by smt().
     move => ?;case (kk < i{2});
      1: by move => ?;move : (H kk jj _ _);  smt().
     move => ?;move : (H0 jj _); smt().
   + move => kk ??.  
     move : H H0;rewrite !setmE !getmE /= => H H0.
     rewrite !offunmE /=; 1,2:smt().
     case (kk = j{2}); 1: by smt().
     by move => ?;move : (H0 kk _); smt().
qed.

phoare Hmodule_low_sem _sd b :
 [  HmoduleLow.__gen_matrix : arg=(_sd,b) ==> res = if b 
                                             then unlift_matrix (trmx (sampleA _sd)) 
                                             else unlift_matrix (sampleA _sd) ] = 1%r. 
proc;case trans;last first.
+ rcondf 1;1: by auto. 
  by call (sampleA_sem _sd);auto => />.
rcondt 1;1: by auto. 
call (sampleAT_sem _sd);auto => />.
qed.



op unlift_polyu(a : poly) = Array256.init (fun i => W16.of_int (Zq.asint a.[i])).

lemma unlift_polyuE a:
 unlift_polyu a
 = Array256.map (fun x => W16.of_int (Zq.asint x)) a.
proof.
apply Array256.ext_eq => i Hi.
by rewrite initiE //= mapiE //.
qed.

lemma getm_setE (m:polymat) a b x i j:
 mrange i j =>
 (m.[a, b <- x].[i,j])%KMatrix.Matrix
 = if a=i /\ b=j then x else (m.[i,j])%KMatrix.Matrix.
proof.
by move=> H; rewrite setmE offunmE //= /#.
qed.

lemma unlift_polyu_getm (A: polymat) i j:
 0 <= i < 3 =>
 0 <= j < 3 =>
 unlift_polyu A.[(i,j)]%PolyMat
 = subarray256 (subarray768 (unlift_matrix A) i) j.
proof.
move=> Hi Hj.
apply Array256.ext_eq => k Hk.
rewrite initiE 1:/# initiE 1:/# /=.
rewrite initiE 1:/# /=.
rewrite initiE 1:/# /=.
congr; congr; congr; last smt().
rewrite -getmE; congr.
smt().
qed.

from CryptoSpecs require import JWordList EclibExtra.
from Keccak require import Keccak1600_avx2x4.
require import MLKEM_keccak_avx2.
require import Mlkem_filters_bridge_24.
require import Mlkem_filters_bridge_48.

lemma take_rejection16_done n buf buf_o bo:
 0 <= buf_o <= bo <= 504 =>
 3 %| buf_o =>
 3 %| bo =>
 size (take n (rejection16 (buf_subl buf buf_o bo))) = n =>
 take n (rejection16 (buf_subl buf buf_o bo))
 = take n (rejection16 (buf_subl buf buf_o 504)).
proof.
move=> H H1 H2 /size_takel' [Hsz1].
rewrite size_map => Hsz2.
rewrite -(buf_subl_cat _ _ bo 504) 1:/# /rejection16 rejection_cat.
 by rewrite size_buf_subl /#.
rewrite -map_take eq_sym -map_take; congr.
by rewrite take_cat' ifT.
qed.

lemma pack32_sample_load_shuffle:
 pack32 (to_list sample_load_shuffle)
 = get256_direct ((init8 ("_.[_]" sample_load_shuffle)))%WArray32 0.
proof.
rewrite get256E; congr.
apply W32u8.Pack.all_eqP.
by rewrite of_listK 1:/# /all_eq /= !initiE /#.
qed.

lemma size_rejection16_le buf bstart bend1 bend2:
 3 %| bstart =>
 3 %| bend1 =>
 3 %| bend2 =>
 0 <= bstart <= bend1 <= bend2 <= 536 =>
 size (rejection16 (buf_subl buf bstart bend1))
 <= size (rejection16 (buf_subl buf bstart bend2)).
proof.
move=> H1 H2 H3 H.
rewrite /rejection16 !size_map.
rewrite -(buf_subl_cat _ _ bend1 bend2) 1:/#.
rewrite bytes2coeffs_cat.
 by rewrite size_buf_subl /#.
by rewrite filter_cat size_cat; smt(size_ge0).
qed.

lemma rejection16_cat l1 l2:
 3 %| size l1 =>
 rejection16 (l1++l2) = rejection16 l1 ++ rejection16 l2.
proof.
by move=> H; rewrite /rejection16 rejection_cat 1:// map_cat.
qed.

hoare gen_matrix_buf_rejection_h _pol _ctr _buf _buf_offset:
 Jkem768_avx2.M._gen_matrix_buf_rejection
 : counter = _ctr
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ 0 <= to_uint counter < 256
   /\ (to_uint buf_offset = 0 \/ to_uint buf_offset = 2*168)
   ==>
   let l = take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) 504))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ to_uint _ctr + size l = min 256 (to_uint res.`2).
proof.
proc; simplify.
while ( buf=_buf /\ 24 %| to_uint buf_offset /\ 3 %| to_uint _buf_offset /\
        0 <= to_uint _buf_offset <= to_uint buf_offset <= 504 /\
        0 <= to_uint _ctr < 256 /\
        to_uint _ctr <= to_uint counter /\
        auxdata_ok load_shuffle mask bounds ones sst /\
        (plist pol (min 256 (to_uint counter))
         = plist _pol (to_uint _ctr)
           ++ take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint buf_offset)))
        ) /\
        (condition_loop <=> to_uint buf_offset <= 504-24)).
 wp.
 seq 2: (#{/~condition_loop}pre /\ to_uint buf_offset <= 504 - 24 /\ (condition_loop <=> to_uint counter < 256)).
 + by auto => /> &m *; rewrite ultE.
 if; last first.
 + auto => /> &m Hdvd1 Hdvd2 Ho1 Ho2 Ho3 Hctr1 Hctr2 Hctr3 H Hcond1 Hcond2; split; first smt().
   have : size (take (256 - to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint buf_offset{m})))) = 256 - to_uint _ctr.
   * have : size (plist pol{m} (min 256 (to_uint counter{m}))) = 256 by rewrite size_plist; smt().
     rewrite H size_cat size_plist; smt().
   rewrite size_takel' => - [] _ Hsz.
   move: H; rewrite take_rejection16_done 1, 3:/#; first by [].
   * rewrite size_take; first smt().
     by rewrite -/(min _ _) lez_minl.
   exact.
 wp; ecall (buf_rejection_filter24_h pol counter buf buf_offset).
 auto => &m /> Hdvd1 Hdvd2 Ho1 Ho2 Ho3 Hctr1 Hctr2 Hctr3 H Hcond1 Hcond2.
 have Hsz: min 256 (to_uint counter{m}) = to_uint _ctr + min (256-to_uint _ctr) (size (rejection16 (buf_subl buf{m} (to_uint _buf_offset) (to_uint buf_offset{m})))).
  rewrite -(size_plist pol{m} (min 256 (to_uint counter{m}))) 1:/# H size_cat size_plist 1:/#; congr.
  by rewrite size_take_min /#.
 move: H; rewrite take_oversize 1:/# lez_minr 1:/# => H; split; first smt(). 
 move=> Hoff Hcounter [p c' ms'] /= /> Hstep.
 rewrite !to_uintD_small 1:/# !of_uintK=> Hc'; split; first smt().
 split.
  split; first by rewrite !modz_small 1:// /= /#.
  by move=> *; rewrite !modz_small 1:// /= /#.
 split; first smt(size_ge0). 
 rewrite modz_small; first smt(size_ge0 size_take_min).
 split; last rewrite ultE to_uintD_small /#.
 rewrite Hc'.
 rewrite Hstep H -catA; congr.
 rewrite -(buf_subl_cat _ (to_uint _buf_offset) (to_uint buf_offset{m}) (to_uint buf_offset{m} + 24)) 1:/#.
 rewrite rejection16_cat.
  by rewrite size_buf_subl /#.
 by rewrite take_catr 1:/#; congr; congr; smt().
wp.
while ( buf=_buf /\ 24 %| to_uint saved_buf_offset /\ 3 %| to_uint _buf_offset /\
        0 <= to_uint _buf_offset <= to_uint saved_buf_offset <= 504 /\
        0 <= to_uint _ctr <= to_uint counter <= 256 /\
        auxdata_ok load_shuffle mask bounds ones sst /\
        plist pol (min 256 (to_uint counter))
        = plist _pol (to_uint _ctr)
           ++ rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint saved_buf_offset)) /\
        to_uint _ctr + size (rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint saved_buf_offset))) <= 256 /\
        (condition_loop <=> to_uint buf_offset <= 504-48) /\
        (to_uint buf_offset <= 504 - 48 => saved_buf_offset = buf_offset)).
 seq 2: (#{/~condition_loop}pre /\ to_uint buf_offset <= 504 - 48 /\ saved_buf_offset = buf_offset /\ (condition_loop <=> to_uint counter <= 256 - 32)).
 + auto => &m /> *; rewrite ultE /#.
 if; last by auto.
 wp; ecall (buf_rejection_filter48_h pol counter buf buf_offset).
 auto; rewrite /protect_64 => &m />.
 move => Hdvd1 Hdvd2 Ho1 Ho2 Ho3 Hctr1 Hctr2 Hctr3 + Hbo Hctr4 Hbo4.
 have -> : (min 256 (to_uint counter{m})) = to_uint counter{m} by smt().
 move => H.
 split;1:smt().
 move => ? [p c'] /= /> Hstep. 
 rewrite !to_uintD_small 1:/# !of_uintK; split; first smt().
 split;1: by rewrite !modz_small 1:// /= /#.
 pose R:= rejection16 _.
 have ?: 0 <= size R <= 32.
  rewrite /rejection16 size_map; split; first smt(size_ge0).
  move=> _; apply (size_rejection_le' 48); 1:done => /=.
  by rewrite /buf_subl !size_take 1:/# !size_drop /#.
 rewrite !modz_small 1..2:/#.
  have -> : (min 256 (to_uint counter{m} + size R)) = to_uint counter{m} + size R by smt().
 split; first smt().
 rewrite -andaE; split.
  rewrite -(buf_subl_cat _ (to_uint _buf_offset) (to_uint buf_offset{m}) (to_uint buf_offset{m} + 48)) 1:/#.
  rewrite Hstep H -catA; congr.
  rewrite rejection16_cat 2://.
  by rewrite size_buf_subl /#.
 move => HH. 
 have : size (plist p (to_uint counter{m} + size R)) <= 256.
  by rewrite size_plist /#.
 by rewrite HH size_cat size_plist 1:/# ultE to_uintD_small /#.
auto; rewrite /protect_64 => &m /> Hctr1 Hctr2 Hbo; split.
 split; first smt().
 split; first smt().
 split; first smt().
 split; first smt().
 split; 1:  by rewrite pack32_sample_load_shuffle.
 have -> : (min 256 (to_uint counter{m})) = to_uint counter{m} by smt().
 split; 1: by rewrite buf_subl0 1:/# /rejection16 rejection0 cats0.
 split; last by rewrite ultE /#.
 by rewrite buf_subl0 1:/# /rejection16 rejection0 /#.
move => buf_o cond ctr pol saved_buf_offset Hcond Hdvd1 Hdvd2 Hbo1 Hbo2 Hbo3 Hctr3 Hctr4 _ H Hsz Hterm; split.
 by rewrite ultE take_oversize /#.
move=> buf_o2 cond2 ctr2 pol2 HC2 Hdvd3 Hbo4 Hbo5 Hctr5 HH.
case: (to_uint ctr2 < 256) => /= C1.
 move=> C2; move: HH; have ->: to_uint buf_o2 = 504 by smt().
 rewrite lez_minr 1:/#.
 move => HH; rewrite andbC -andaE; split.
  rewrite -(size_plist pol2 (to_uint ctr2)) 1:/# HH.
  by rewrite size_cat size_plist 1:/#.
 by move => E; move: HH; rewrite -E => ->.
move: HH.
have E: min 256 (to_uint ctr2) = 256 by smt().
rewrite !E => HH.
rewrite andbC -andaE.
have HHsz: 256 = to_uint counter{m} + min (256 - to_uint counter{m})
      (size (rejection16 (buf_subl buf{m} (to_uint buf_offset{m}) (to_uint buf_o2)))).
 rewrite -(size_plist pol2 256) 1:/#.
 by rewrite HH size_cat size_plist 1:/# size_take_min /#.
rewrite size_take_min 1:/#.
move => _.
split; first smt(size_rejection16_le).
move => ->; rewrite HH; congr.
apply take_rejection16_done; first 3 smt().
by rewrite size_take_min /#.
qed.

lemma gen_matrix_buf_rejection_ll:
 islossless Jkem768_avx2.M._gen_matrix_buf_rejection.
proof.
proc.
seq 13: (true)=> //.
 wp; while ((condition_loop
            <=> to_uint buf_offset <= 504-48) /\ (condition_loop => saved_buf_offset = buf_offset))
           (504 - to_uint buf_offset).
  move=> z.
  exlim buf_offset => _buf_offset.
  seq 2: (#{~condition_loop} pre /\ saved_buf_offset = buf_offset /\ to_uint buf_offset <= 504 - 48) => //.
  - by auto => &m />.
  - if; last by auto => &m /> /#.
    wp; call buf_rejection_filter48_ll; auto => &m /> H _.
    rewrite ultE to_uintD_small /#.
  by hoare; auto => />.
 auto => &m />.
 rewrite ultE /#.
 exlim buf_offset => _buf_offset.
 exlim counter => _counter.
while (condition_loop
       <=> to_uint buf_offset <= 504-24)
      (504 - to_uint buf_offset).
 move=> z.
 seq 2: (#{~condition_loop}pre /\ to_uint buf_offset <= 504 - 24) => //.
 - auto.
 - if; last auto => &m /> /#.
    wp; call buf_rejection_filter24_ll; auto => &m /> H _.
    rewrite /protect_64 ultE to_uintD_small /#.
 by hoare; auto.
auto => &m />.
rewrite ultE /#.
qed.

phoare gen_matrix_buf_rejection_ph _pol _ctr _buf _buf_offset:
 [ Jkem768_avx2.M._gen_matrix_buf_rejection
 : counter = _ctr
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ 0 <= to_uint counter < 256
   /\ (to_uint buf_offset = 0 \/ to_uint buf_offset = 2*168)
   ==>
   let l = take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) 504))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ to_uint _ctr + size l = min 256 (to_uint res.`2)
 ] = 1%r.
proof.
by conseq gen_matrix_buf_rejection_ll (gen_matrix_buf_rejection_h _pol _ctr _buf _buf_offset).
qed.
