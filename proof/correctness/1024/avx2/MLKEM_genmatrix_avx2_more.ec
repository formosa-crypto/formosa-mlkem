require import AllCore IntDiv List.

from Jasmin require import JModel.

from JazzEC require import WArray512 WArray256 WArray128 WArray8 WArray2 WArray64 WArray32.
from JazzEC require import Array2 Array8 Array16 Array25 Array32 Array33 Array64 Array128 Array136 Array1024 Array1408 Array1024 Array1536 Array4096 Array2144 Array536 Array256.

require import MLKEM_InnerPKE NTT_avx2_invntt MLKEMFCLib AVX2_Ops NTT_AVX_Fq_ntt NTT_AVX_Fq_basemul NTT_AVX_Fq_invntt MLKEM_Poly_avx2_vec.

require import NTT_avx2_ntt NTT_avx2.

require import MLKEM_keccak_avx2.

import NTT_Avx2.

from JazzEC require import Jkem1024_avx2 Jkem1024.

import GFq Rq Sampling Serialization Symmetric VecMat InnerPKE1024 MLKEM1024 Fq Correctness1024.
import Symmetric1024 Serialization1024 VecMat1024 PolyMat.
import KMatrix.Matrix.
import MLKEM_PolyAVXVec.

from CryptoSpecs require import JWordList EclibExtra.
from Keccak require import Keccak1600_avx2x4.
require import MLKEM_keccak_avx2.
require import Mlkem_filters_bridge_24.
require import Mlkem_filters_bridge_48.

require import MLKEM_genmatrix_avx2.
require import MLKEM_ntt_pack_avx2.

abbrev coeff2u16 x = W16.of_int (Zq.asint x).
abbrev coeffL2u16L = List.map coeff2u16.

equiv fill_poly_eq:
 Jkem1024_avx2.M.__gen_matrix_fill_polynomial
 ~ ParseFilter.fill_poly
 : buf_subl buf{1} 0 (3*168) = buf{2}
   /\ sub buf{1} (2*168) 200 = state2bytes st{2}
   ==>
   res{1}.`1 = unlift_polyu res{2}.
proof.
proc; simplify.
while ( min 256 (to_uint counter{1})=c{2} /\ 0 <= c{2} <= 256
      /\ to_uint buf_offset{1} = 2*168
      /\ state2bytes st{2} = sub buf{1} (2*168) 200
      /\ plist pol{1} c{2} = coeffL2u16L p{2}
      ).
 ecall {1} (gen_matrix_buf_rejection_ph pol{1} counter{1} buf{1} buf_offset{1}).
 ecall {1} (shake128_next_state_ph buf{1}).
 sp 0 1.
 elim* => /= st1.
 auto => /> &1 &2 ? ? -> Est1 Hpol _ Hctr1 buf1 Est2; split; 1:smt().
 move => ?? [pol ctr] /=.
 pose bnd := 256 - to_uint counter{1}.
 move: Hpol; rewrite lez_minr 1:/# => Hpol.
 rewrite Hpol buf_sublE 1:// /= => Hpol1 Ectr.
 have : squeezestate_i c256_r8 (bytes2state (sub buf{1} 336 200)) 0 = buf_subl buf1 336 504.
  rewrite buf_sublE 1:// /=.
  rewrite /squeezestate_i /st_i /= iter1.
  rewrite /squeezestate /= /c256_r8.
  rewrite -Est2 take_mkseq 1:/# /sub /#.
 rewrite buf_sublE 1:// /= -Est1.
 rewrite state2bytesK => ->.
 move: Ectr; rewrite /rejection16 -map_take size_map => Ectr.
 rewrite -Ectr; split.
  split; first smt(). 
  split; first smt(size_ge0 size_take).
  split.
   rewrite Est2 /st_i iter1; congr; congr.
   by rewrite -Est1 state2bytesK.
  move: Hpol1; rewrite /rejection16.
  rewrite -map_take map_cat => <-. 
  by rewrite size_map.
 rewrite ultE !of_uintK /=; smt(size_ge0 size_take size_rejection_le).
wp; ecall {1} (gen_matrix_buf_rejection_ph pol{1} counter{1} buf{1} buf_offset{1}).
auto => /> &1 &2 Hbuf [p c] /=; rewrite plist0 ultE /=.
rewrite /rejection16 !size_take // size_map /= map_take => H Ectr.
split; first smt(W64.to_uint_cmp size_ge0 size_take).
move => buf ctr p1 p2 st => _?_?.
have ->: min 256 (to_uint ctr) = 256 by smt().
move => _ HH.
have Hsz: size (coeffL2u16L p2) = 256.
 by rewrite -HH size_plist /#.
apply Array256.to_list_inj.
move: HH.
rewrite /Array256.to_list /plist /= => ->.
rewrite unlift_polyuE map_of_list /=.
rewrite -(eq_in_mkseq (nth (coeff2u16 witness) (coeffL2u16L p2))).
 by move => i Hi; rewrite get_of_list //.
by rewrite -Hsz mkseq_nth.
qed.

lemma pack2_rc (pos: W8.t Array2.t) rc:
Array2.init
 (WArray2.get8
  (WArray2.set16_direct
   (WArray2.init8 (fun i=> pos.[i])) 0 rc))
=
Array2.of_list witness [rc \bits8 0; rc \bits8 1].
proof. by apply Array2.all_eq_eq; rewrite /all_eq /=. qed.


op pack4poly ['a] (ps: 'a Array256.t * 'a Array256.t * 'a Array256.t * 'a Array256.t) =
 Array1024.of_list witness (to_list ps.`1 ++ to_list ps.`2 ++ to_list ps.`3 ++ to_list ps.`4).

op buf_ok (buf: W8.t Array536.t) (l: W8.t list, st: state): bool =
 buf_subl buf 0 504 = l /\ sub buf 336 200 = state2bytes st.

abbrev pack4buf (b:W8.t Array2144.t) (b0 b1 b2 b3: W8.t Array536.t) = 
 Array2144.init
  (fun i => 
    if 1608 <= i && i < 2144
    then b3.[i - 1608]
    else (Array2144.init
           (fun i0 =>
             if 1072 <= i0 && i0 < 1608
             then b2.[i0 - 1072]
             else (Array2144.init
                    (fun i1 =>
                      if 536 <= i1 && i1 < 1072
                      then b1.[i1 - 536]
                      else (Array2144.init
                             (fun i2 =>
                               if 0 <= i2 && i2 < 536
                               then b0.[i2]
                               else b.[i2])).[i1])).[i0])).[i]).

op buf4x_buf (bufx4 : W8.t Array2144.t) (pos : int) : W8.t Array536.t =
 Array536.init (fun i => bufx4.[pos*536+i]).

hoare gen_matrix_get_indexes_h _pos _transpose:
 Jkem1024_avx2.M.gen_matrix_get_indexes
 : to_uint b = 2*_pos /\ to_uint _t = b2i _transpose /\ (_pos=0 \/ _pos=4 \/ _pos = 8 \/ _pos = 12)
 ==>
   res = W8u8.pack8 (sub gen_matrix_indexes (2*_pos+32*b2i _transpose) 8).
proof.
proc => /=.
seq 5: (idxs=gen_matrix_indexes /\ to_uint b = 2*_pos + 32*b2i _transpose /\ (_pos=0 \/ _pos=4 \/ _pos=8 \/ _pos = 12)) => //=.
 auto => /> &m Hb Ht Hpos.
 by rewrite to_uintD_small to_uint_shl !of_uintK 1,3:// /#.
auto => /> &m -> Hpos.
rewrite get64E; congr; apply W8u8.Pack.ext_eq => i Hi.
rewrite initiE 1:// get_of_list 1:// /=.
by rewrite initiE 1:/# /sub nth_mkseq 1://.
qed.

lemma gen_matrix_get_indexes_ll: islossless Jkem1024_avx2.M.gen_matrix_get_indexes
by islossless.

phoare gen_matrix_get_indexes_ph _pos _transpose:
 [ Jkem1024_avx2.M.gen_matrix_get_indexes
 : to_uint b = 2*_pos /\ to_uint _t = b2i _transpose /\ (_pos=0 \/ _pos=4 \/ _pos = 8 \/ _pos = 12)
 ==>
   res = W8u8.pack8 (sub gen_matrix_indexes (2*_pos+32*b2i _transpose) 8)
 ] = 1%r.
proof. by conseq gen_matrix_get_indexes_ll (gen_matrix_get_indexes_h _pos _transpose). qed.

lemma sub_buf4x_buf bx4 k a b:
 0 <= k < 4 =>
 0 <= a <= a+b <= 536 =>
 sub (buf4x_buf bx4 k) a b = sub bx4 (k*536+a) b.
proof.
move => Hk Hab.
rewrite /buf4x_buf /sub; apply eq_in_mkseq => i Hi /=.
by rewrite initiE 1:/# /#.
qed.
locate idx_from_pos.
lemma sub_gen_matrix_indexes idxs _pos _t _k (_a:WArray8.t):
 (_pos = 0 \/ _pos = 4 \/ _pos = 8 \/ _pos = 12) =>
 0 <= _k < 4 =>
 idxs = Array8.init
   (get8
      (set64_direct _a 0
         (pack8 (sub gen_matrix_indexes (2 * _pos + 32 * b2i _t) 8)))) =>
 sub idxs (2*_k) 2 = [(pos2ji (_pos+_k) _t).`1; (pos2ji (_pos+_k) _t).`2].
proof.
move=> Hpos Hk ->.
have: _k \in iotared 0 4 by smt().
move: {Hk} _k; apply /List.allP => /=.
 case Hpos;1 : by case: _t;rewrite ?b2i1 ?b2i0 /pos2ji /sub /mkseq -iotaredE //=. 
 move => Hpos.
 case Hpos;1 : by case: _t;rewrite ?b2i1 ?b2i0 /pos2ji /sub /mkseq -iotaredE //=. 
 move => Hpos.
 case Hpos;1 : by case: _t;rewrite ?b2i1 ?b2i0 /pos2ji /sub /mkseq -iotaredE //=. 
 move => Hpos.
 by rewrite Hpos;case: _t;rewrite ?b2i1 ?b2i0 /pos2ji /sub /mkseq -iotaredE //=. 
qed.

equiv sample_four_polynomials_eq:
 Jkem1024_avx2.M._gen_matrix_sample_four_polynomials
 ~  ParseFilter.sample3buf_x4'
 : ={rho} /\ to_uint pos_entry{1} = 2*pos{2} /\ to_uint transposed{1} = b2i t{2} /\ (pos{2}=0 \/ pos{2}=4 \/ pos{2}=8 \/ pos{2}=12)
   ==>
  res{1}.`1 = pack4poly (unlift_polyu res{2}.`1, unlift_polyu res{2}.`2, unlift_polyu res{2}.`3, unlift_polyu res{2}.`4).
proof.
transitivity ParseFilter.sample3buf_x4
 (={rho} /\ to_uint pos_entry{1} = 2*pos{2} /\ to_uint transposed{1} = b2i t{2} /\ (pos{2}=0 \/ pos{2}=4  \/ pos{2}=8 \/ pos{2}=12)
 ==> res{1}.`1 = pack4poly (unlift_polyu res{2}.`1, unlift_polyu res{2}.`2, unlift_polyu res{2}.`3, unlift_polyu res{2}.`4))
 (={arg} ==> ={res}); last first.
+ by apply sampleX4_sample3buf_4x.
+ move=> /> &1 &2 -> *.
  by exists (rho{2},pos{2},t{2}) => /#.
+ by move => />.
proc; simplify.
seq 12 27: ( buf_ok (buf4x_buf buf{1} 0) buf0{2} st0{2}
          /\ buf_ok (buf4x_buf buf{1} 1) buf1{2} st1{2}
          /\ buf_ok (buf4x_buf buf{1} 2) buf2{2} st2{2}
          /\ buf_ok (buf4x_buf buf{1} 3) buf3{2} st3{2} ).
 seq 9 7: ( match_state4x st0{2} st1{2} st2{2} st3{2} stx4{1} ).
  wp; ecall {1} (shake128x4_absorb_A32_A2_ph rho{1} indexes{1}) => /=.
  wp; ecall {1} (gen_matrix_get_indexes_ph pos{2} t{2}) => /=.
  auto => &1 &2 [# -> Epos Ht Hpos]; split; first smt().
  move=> _ idxs -> st; pose a:= WArray8.init8 _.  print sub_gen_matrix_indexes.
  rewrite (sub_gen_matrix_indexes _ pos{2} t{2} 0 a _ _) 1..3://.
  rewrite (sub_gen_matrix_indexes _ pos{2} t{2} 1 a _ _) 1..3://.
  rewrite (sub_gen_matrix_indexes _ pos{2} t{2} 2 a _ _) 1..3://.
  rewrite (sub_gen_matrix_indexes _ pos{2} t{2} 3 a _ _) 1..3://.
  done.
 wp; ecall {1} (shake128x4_squeeze3blocks_ph st0{2} st1{2} st2{2} st3{2}) => /=.
 auto => /> &1 &2 Hmatch [stx4 bufx4] /=.
 rewrite !buf_sublE 1..4:// /=.
 rewrite !sub_buf4x_buf 1..17:// /= => -> -> -> -> -> -> -> ->.
  rewrite /SQUEEZE1600 /c256_r8 /= /squeezeblocks -iotaredE /flatten /= !cats0 !take_oversize;
   first 4 by rewrite !size_cat !size_squeezestate_i //.
  by rewrite /squeezestate_i /st_i (:3=2+1) 1:// !iterS 1..20:// !iter2 1:// !iter1 !iter0 1..12:// !catA /#.
wp; call fill_poly_eq.
wp; call fill_poly_eq.
wp; call fill_poly_eq.
wp; call fill_poly_eq.
auto => /> &1 &2 Hst0 Hst1 Hst2 Hst3 _ _.
move=> [p0 buf0] p0R /= Hp0.
pose B1:= Array536.init _.
have ->: B1 = buf4x_buf buf{1} 1.
 apply Array536.ext_eq => i Hi /=.
 by rewrite initiE //= initiE 1:/# initiE 1:/# /= ifF 1:/#.
split; first done.
move=> _ _ {B1} [p1 buf1] p1R /= Hp1.
pose B2:= Array536.init _.
have ->: B2 = buf4x_buf buf{1} 2.
 apply Array536.ext_eq => i Hi /=.
 rewrite initiE /= 1:/# initiE 1:/# initiE 1:/# /= ifF 1:/#.
 by rewrite /buf4x_buf /= initiE /#.
split; first done.
move=> _ _ {B2} [p2 buf2] p2R /= Hp2.
pose B3:= Array536.init _.
have ->: B3 = buf4x_buf buf{1} 3.
 apply Array536.ext_eq => i Hi /=.
 rewrite initiE /= 1:/# initiE 1:/# initiE 1:/# /= ifF 1:/#.
 by rewrite /buf4x_buf initiE 1:/# /= ifF 1:/# initiE /#.
split; first done.
move=> _ _ {B3} [p3 buf3] p3R /= Hp3.
rewrite /pack4poly /=.
apply Array1024.ext_eq => i Hi.
rewrite initiE //= get_of_list //=.
case: (i < 256) => C0.
 rewrite ifF 1:/# initiE 1:// /=. 
 rewrite ifF 1:/# initiE 1:// /=. 
 rewrite ifF 1:/# initiE 1:// /=.
 rewrite ifT 1:/# Hp0 initiE 1:/# /=.
 rewrite -!catA nth_cat ifT. 
  by rewrite !size_to_list /#.
 by rewrite get_to_list initiE 1:/#.
case: (i < 512) => C1.
 rewrite ifF 1:/# initiE 1:// /=. 
 rewrite ifF 1:/# initiE 1:// /=.
 rewrite ifT 1:/# Hp1 initiE 1:/# /=.
 rewrite -!catA nth_cat ifF. 
  by rewrite !size_to_list /#.
 rewrite nth_cat ifT !size_to_list 1:/#. 
 by rewrite get_to_list initiE 1:/#.
case: (i < 768) => C2.
 rewrite ifF 1:/# initiE 1:// /=.
 rewrite ifT 1:/# Hp2 initiE 1:/# /=.
 rewrite -!catA nth_cat ifF !size_to_list 1:/#. 
 rewrite nth_cat ifF !size_to_list 1:/#. 
 rewrite nth_cat ifT.
  by rewrite !size_to_list /#.
 by rewrite get_to_list initiE 1:/#.
rewrite ifT 1:/# Hp3 initiE 1:/# /=.
rewrite -!catA nth_cat ifF !size_to_list 1:/#. 
rewrite nth_cat ifF !size_to_list 1:/#. 
rewrite nth_cat ifF !size_to_list 1:/#. 
by rewrite get_to_list initiE 1:/#.
qed.



op mat4atPos (m: polymat) pos =
 ( m.[idx_from_pos pos]
 , m.[idx_from_pos (pos+1)]
 , m.[idx_from_pos (pos+2)]
 , m.[idx_from_pos (pos+3)])%KMatrix.Matrix.

lemma sample3buf_4x_ph _rho _pos _t:
 0 <= _pos <= 4*4 - 4 =>
 phoare [ ParseFilter.sample3buf_x4'
        :  rho=_rho /\ pos = _pos /\ t = _t
           ==>
           res = mat4atPos (if _t then trmx (sampleA _rho) else sampleA _rho) _pos ]
 = 1%r.
proof.
move=> Hpos.
proc; simplify.
call (sampleFilter_sem _rho (pos2ji (_pos+3) _t).`1 (pos2ji (_pos+3) _t).`2).
wp; call (sampleFilter_sem _rho (pos2ji (_pos+2) _t).`1 (pos2ji (_pos+2) _t).`2).
wp; call (sampleFilter_sem _rho (pos2ji (_pos+1) _t).`1 (pos2ji (_pos+1) _t).`2).
wp; call (sampleFilter_sem _rho (pos2ji _pos _t).`1 (pos2ji _pos _t).`2).
auto => />.
rewrite /sampleA /mat4atPos /pos2ji /idx_from_pos /=.
have: _pos \in iota_ 0 (16-3). rewrite -iotaredE /= /#.
clear Hpos; move: _pos.
apply/List.allP.
case: _t => ?.
 by rewrite -iotaredE /= !trmxE !getm_setE //=.
by rewrite -iotaredE /= !getm_setE //=.
qed.

lemma pack4poly_subarray1024 (A: polymat) p:
 0 <= p < 4 =>
 pack4poly ( unlift_polyu (mat4atPos A (4*p)).`1
           , unlift_polyu (mat4atPos A (4*p)).`2
           , unlift_polyu (mat4atPos A (4*p)).`3
           , unlift_polyu (mat4atPos A (4*p)).`4
           )
 = subarray1024 (unlift_matrix A) p.
proof.
move=> Hp; apply Array1024.ext_eq => i Hi.
rewrite initiE 1:/# initiE 1:/# /=.
rewrite initiE 1:/# /=.
rewrite -!catA nth_cat size_to_list /=.
case: (i < 256) => Hi1.
 rewrite initiE 1:/# /= /mat4atPos /=.
 by congr; congr; congr; smt().
rewrite nth_cat size_to_list /=.
case: (i-256 < 256) => Hi2.
 rewrite initiE 1:/# /= /mat4atPos /=.
 by congr; congr; congr; smt().
rewrite nth_cat size_to_list /=.
case: (i-512 < 256) => Hi3.
 rewrite initiE 1:/# /= /mat4atPos /=.
 by congr; congr; congr; smt().
rewrite initiE 1:/# /= /mat4atPos /=.
by congr; congr; congr; smt().
qed.

lemma sample_four _sd _rc b :
 (_rc = 0 \/ _rc = 4 \/ _rc = 8 \/ _rc = 12) =>
 phoare
 [ Jkem1024_avx2.M._gen_matrix_sample_four_polynomials :
   rho = _sd /\ pos_entry = W64.of_int (2*_rc) /\ transposed = W64.of_int (b2i b) ==> 
   res.`1 = subarray1024 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) (_rc %/ 4) ] = 1%r.
proof.
move=> Hrc.
conseq sample_four_polynomials_eq  (sample3buf_4x_ph _sd _rc b _).
+ move => &1 /> -> ->.
  exists (rho{1},_rc,b) => /=.
  by rewrite !of_uintK /#.
+ move=> /> &1 ->. 
  by rewrite -pack4poly_subarray1024 /#.
smt().
qed.

phoare _gen_matrix_avx2_sem _sd b :
 [  Jkem1024_avx2.M._gen_matrix_avx2 : arg.`2 = _sd /\ arg.`3 = W64.of_int (b2i b)
                                         ==> res = if b 
                                             then nttunpackm (unlift_matrix (trmx (sampleA _sd))) 
                                             else nttunpackm (unlift_matrix (sampleA _sd)) ] = 1%r.
proof.
proc => /=. 
while (0<=i<=4 /\ rho = _sd /\ 
    ((forall kk, 0 <= kk < i => subarray1024 matrix kk = nttunpackv (subarray1024 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))) /\
     (forall kk, i <= kk < 4 => subarray1024 matrix kk = (subarray1024 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))) (kvec-i).
+ move => *;wp => />;1:smt(). 
  while (0<=i<4 /\ 0 <= j <= 4 /\ rho = _sd /\
    ((forall kk, 0 <= kk < i => subarray1024 matrix kk = nttunpackv (subarray1024 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))) /\
     (forall kk, i+1 <= kk < 4 => subarray1024 matrix kk = (subarray1024 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk)) /\
     (forall kk, 0 <= kk < j => subarray256 (subarray1024 matrix i) kk = nttunpack (subarray256 (subarray1024 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) i) kk)) /\
     (forall kk, j <= kk < 4 => subarray256 (subarray1024 matrix i) kk = subarray256 (subarray1024 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) i) kk)) (kvec-j); last first.
  + auto => /> &hr ?? H H0 ?;do split;1..3:smt().
    + move => j0 m;do split;1:smt().
      move => ??? H1 H2 H3 H4;do split;1,2,4..:smt(). 
      move => kk kkbl kkbh;case(kk=i{hr});2: by smt().
      move => ->;rewrite /nttunpackv /= tP => ii iib.
      rewrite !initiE //=.
      case(0 <= ii && ii < 256).
      + by move => kb;rewrite -H3 1:/# initiE //= initiE /#.
      case(256 <= ii && ii < 512).
      + by  move => ?kb;rewrite -H3 1:/# initiE 1:/# //= initiE /#.
      case(512 <= ii && ii < 768).
      + by  move => ?kb;rewrite -H3 1:/# initiE 1:/# //= initiE /#.
      by  move => ??kb;rewrite -H3 1:/# initiE 1:/# //= initiE 1:/# //= initiE /#.
  move => *.
  exlim matrix, i, j => _m _i _j.
  wp;call(nttunpack_corr ((init (fun (i_0 : int) => _m.[_i * (4 * 256) + _j * 256 + i_0]))%Array256)).
  auto => /> ?? H H0 H1 H2 H3 H4 ?;do split; 1,2,7..:smt(). 
  + move => ii??. 
    rewrite  tP => kk kkb.
    have -> : (subarray1024
   ((init
       (fun (i_0 : int) =>
          if _i * 1024 + _j * 256 <= i_0 && i_0 < _i * 1024 + _j * 256 + 256 then
            (nttunpack ((init (fun (i_0_0 : int) => _m.[_i * 1024 + _j * 256 + i_0_0])))%Array256).[
            i_0 - (_i * 1024 + _j * 256)]
          else _m.[i_0])))%Array4096 ii) =
          subarray1024 _m ii; last by smt().
     by rewrite tP => jj jjb; rewrite !initiE //= initiE 1:/# /= ifF 1:/#.  
 + move => ii iibl iibh.    
    have -> : (subarray1024
   ((init
       (fun (i_0 : int) =>
          if _i * 1024 + _j * 256 <= i_0 && i_0 < _i * 1024 + _j * 256 + 256 then
            (nttunpack ((init (fun (i_0_0 : int) => _m.[_i * 1024 + _j * 256 + i_0_0])))%Array256).[
            i_0 - (_i * 1024 + _j * 256)]
          else _m.[i_0])))%Array4096 ii) =
          subarray1024 _m ii; last by smt().
     by rewrite tP => jj jjb; rewrite !initiE //= initiE 1:/# /= ifF 1:/#.  
 + move => ii iibl iibh.
   case (ii = _j); last first.  
   + move => iibb;rewrite -H3 1:/#.
     rewrite /subarray256 /subarray1024 tP => *.
     by rewrite !initiE 1,2:/# /= !initiE 1:/# /= 1:/# initiE /#.
   move => ->. 
   rewrite /subarray256 /subarray1024  tP => *.
   rewrite initiE /= 1:/# initiE 1:/# /= initiE 1:/# /= ifT 1:/#;congr;2:smt().
   congr;rewrite tP => i0 i0b; rewrite !initiE 1,2:/# /= initiE 1:/# /=.
   move : (H4 _j _); 1:smt().
   rewrite tP => H4u. 
   move : (H4u i0 _);1:smt().
   by smt(Array1024.initiE Array256.initiE).

 + move => ii iibl iibh.
   rewrite -H4 1:/#.
   rewrite /subarray256 /subarray1024  tP => *.
   by rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# initiE 1:/# /= ifF /#. 

wp;conseq (_:  (forall kk, 0 <= kk < 4 =>  subarray1024 matrix kk = (subarray1024 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))).
move =>/> m0 rr; split;1:smt().
case b => hb.
+ move => i1 m1 *; split;1: smt(). 
  move => ???H0 H1. 
  rewrite /nttunpackm tP => k kb; rewrite !initiE //=.
  case (0 <= k && k < 1024).
  + by move => kbb;rewrite -H0 1:/# /subarray1024 initiE 1:/# /=.  
  case (1024 <= k && k < 2048).
  + by move =>? kbb;rewrite -H0 1:/# /subarray1024 initiE 1:/# /=.  
  case (2048 <= k && k < 3072).
  + by move =>? kbb;rewrite -H0 1:/# /subarray1024 initiE 1:/# /=.  
  by move =>? ?kbb;rewrite -H0 1:/# /subarray1024 initiE 1:/# /=.
move => i1 m1 *; split;1: smt(). 
move => ???H0 H1. 
rewrite /nttunpackm tP => k kb; rewrite !initiE //=.
case (0 <= k && k < 1024).
+ by move => kbb;rewrite -H0 1:/# /subarray1024 initiE 1:/# /=.  
case (1024 <= k && k < 2048).
+ by move =>? kbb;rewrite -H0 1:/# /subarray1024 initiE 1:/# /=.  
  case (2048 <= k && k < 3072).
  + by move =>? kbb;rewrite -H0 1:/# /subarray1024 initiE 1:/# /=.  
by move =>?? kbb;rewrite -H0 1:/# /subarray1024 initiE 1:/# /=.

unroll for 6.
wp;call (sample_four _sd 12 b _).
wp;call (sample_four _sd 8 b _).
wp;call (sample_four _sd 4 b _).
wp;call (sample_four _sd 0 b _).

auto => /> &hr a0 -> a1 -> a2 -> a3 -> row ??.
congr; rewrite tP => kk ?.
pose xx := (unlift_matrix (if b then trmx (sampleA _sd) else sampleA _sd)).[kk].
rewrite initiE 1:/# /=.
case (3072 <= kk && kk < 4096).
+ move => lastpos;rewrite /subarray256 /subarray1024 initiE 1:/# /= initiE 1:/# /=.
  rewrite /xx;  case (!b).  
  + by move => /= ->;rewrite /unlift_matrix !initiE 1,2:/# /=;congr;congr.
  + by move => /= ->;rewrite /unlift_matrix !initiE 1,2:/# /=;congr;congr.

move => ?;rewrite initiE 1:/# /=.
case (2048 <= kk && kk < 3072).
+ move => lastpos;rewrite /subarray256 /subarray1024 initiE 1:/# /= initiE 1:/# /=.
  rewrite /xx;  case (!b).  
  + by move => /= ->;rewrite /unlift_matrix !initiE 1,2:/# /=;congr;congr.
  + by move => /= ->;rewrite /unlift_matrix !initiE 1,2:/# /=;congr;congr.
move => notlast.
rewrite initiE 1:/# /= initiE 1:/# /=.
case (1024 <= kk && kk < 2048).
+ by move => middlepos;rewrite /subarray1024 initiE /#.

move => *;rewrite initiE 1:/# /= initiE 1:/# /= ifT 1:/#.
  rewrite /xx;  case (!b).  
  + by move => /= ->;rewrite /unlift_matrix !initiE 1,2:/# /=;congr;congr.
  + by move => /= ->;rewrite /unlift_matrix !initiE 1,2:/# /=;congr;congr.
qed.

equiv genmatrixequiv_aux b : 
    Jkem1024_avx2.M._gen_matrix_avx2    ~   AuxMLKEM.__gen_matrix :
 rho{1} = seed{2} /\ transposed{1} = (of_int (b2i b))%W64 /\ trans{2} = b ==>
res{1} = nttunpackm res{2} /\ pos_bound4096_cxq res{1} 0 4096 2 /\ pos_bound4096_cxq res{2} 0 4096 2.
proc* => //.
transitivity {2} { r <@ HmoduleLow.__gen_matrix(seed,trans); }
    (rho{1} = seed{2} /\ transposed{1} = (W64.of_int (b2i b)) /\ trans{2} = b ==> 
     r{1} = nttunpackm r{2} /\ pos_bound4096_cxq r{1} 0 4096 2 /\ pos_bound4096_cxq r{2} 0 4096 2)
    (={seed,trans} ==> ={r});1,2:smt();last by call Hmodule_connection => />.
ecall {2} (Hmodule_low_sem seed{2} trans{2}) => /=.
ecall {1} (_gen_matrix_avx2_sem rho{1} trans{2}) => /=.
auto => /> &1;split;1:smt().
split; 2: by smt(matrix_unlift).
rewrite  /nttunpackm.
rewrite /pos_bound4096_cxq => k kb.
case b => Hb.
+ rewrite !initiE 1:/# /=. 
  case (0<= k < 1024).  
  + move => kbb.
    have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray1024 (unlift_matrix (trmx (sampleA seed{1}))) 0))); last  by smt(Array1024.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.    by smt(matrix_unlift).

  case (1024<= k < 2048).  
  + move => ? kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray1024 (unlift_matrix (trmx (sampleA seed{1}))) 1))); last by smt(Array1024.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.  
   by smt(matrix_unlift).
 
  case (2048<= k < 3072).  
  + move => ? kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray1024 (unlift_matrix (trmx (sampleA seed{1}))) 2))); last by smt(Array1024.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.     by smt(matrix_unlift).

move => *; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray1024 (unlift_matrix (trmx (sampleA seed{1}))) 3))); last by smt(Array1024.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.     by smt(matrix_unlift).
 
+ rewrite !initiE 1:/# /=. 
  case (0<= k < 1024).  
  + move => kbb.
    have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray1024 (unlift_matrix ( (sampleA seed{1}))) 0))); last  by smt(Array1024.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.    by smt(matrix_unlift).

  case (1024<= k < 2048).  
  + move => ? kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray1024 (unlift_matrix ( (sampleA seed{1}))) 1))); last by smt(Array1024.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.  
   by smt(matrix_unlift).
 
  case (2048<= k < 3072).  
  + move => ? kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray1024 (unlift_matrix ( (sampleA seed{1}))) 2))); last by smt(Array1024.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.     by smt(matrix_unlift).

move => *; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray1024 (unlift_matrix ( (sampleA seed{1}))) 3))); last by smt(Array1024.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray1024 initiE 1:/# /=.     by smt(matrix_unlift).

qed.
