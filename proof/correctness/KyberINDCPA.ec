
require import AllCore List IntDiv CoreMap.
from Jasmin require import JModel.

require import Fq.
require import KyberPoly.
require import KyberPolyVec.
require import KyberAlgLift.
require import NTT_Fq.

require import Array4 Array5 Array24 Array25 Array32 Array33 Array34 Array64
               Array128 Array168 Array256 Array768.
require import WArray20 WArray32 WArray33 WArray34 WArray40 WArray64
               WArray128 WArray168 WArray192 WArray200 WArray256 WArray512
               WArray1536.

require import IndcpaDerand.

import MLWE_PKE.
import MLWE_PKE.

(* WE DEFINE ALTERNATIVE VERSIONS OF THE EXTRACTED CODE TO
   MODULARIZE RANDOMNESS SAMPLINGS *)


(***************************************************)
(* Now we can prove that the deterministic 
   computations are correct assuming that H maps
   to gen_matrix.
*)

import Fq.Kyber_.
import MLWEPKE.
import KyberPoly KyberPolyVec.

import H_MLWE.
import Matrix_.
import Vector.
import Matrix.
import NTT_Fq.

op ntt_matrix (m : matrix) : matrix = offunm (fun (i j :int) => ntt (m.[(i,j)])).
op row_i(m:matrix, r : int) : vector  = offunv (fun (i : int) => m.[r,i]).

lemma ntt_vector_matrix (m : matrix) (i : int) :
  0 <= i < 3 =>
    polyvec_ntt (row_i m i) = row_i (ntt_matrix m) i.
move => *.
rewrite /ntt_matrix /polyvec_ntt /row_i offunvK /vclamp => />.
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunmE => />.
by rewrite H0 => />.
qed.

lemma aux_oflist_lift (a : W16.t Array768.t) k :
 0 <= k < 3 =>
 Array256.of_list witness (sub (lift_array768 a) (256*k) 256) = 
  (Array256.init (fun (i : int) => (ZModField.inzmod (to_sint a.[256*k+i])))).
proof.
move => kb.
rewrite /Array256.of_list.
apply Array256.ext_eq.
move => x xb.
rewrite !initiE //=.
rewrite /sub /lift_array768 mapE /=.
rewrite nth_mkseq_if xb /=.
rewrite initiE; first by smt().
by auto => />.
qed.

lemma scale_scale_cancel v: 
scale (scale v (ZModField.inzmod 169)) (ZModField.inzmod Fq.SignedReductions.R) = v.
proof.
rewrite /scale. rewrite !mapE /=. 
apply Array256.ext_eq.
move => x xb.
rewrite initiE //=.
rewrite initiE //=.
move : Fq.SignedReductions.RRinv.
rewrite ZModField.eq_inzmod ZModField.inzmodM ZModField.ComRing.mulrC.
rewrite -ZModField.ComRing.mulrA => ->.
rewrite -ZModField.oneE. 
rewrite ZModField.asintK.
by ring.
qed.

lemma lift_equiv a b :
  lift_array768 a = lift_array768 b =>
    lift_vector a = lift_vector b.
proof.
rewrite /lift_array768 /lift_vector /lift_polyvec !mapE /=.
rewrite tP eq_vectorP /=. 
move => ? i ib.
rewrite !offunvE //=. 
apply Array256.ext_eq => x xb.
move : (H (256*i + x) _); first by smt().
by rewrite !initiE //=; smt().
qed. 

axiom gen_matrix s :
  hoare [ Mderand.gen_matrix  :
    s = seed /\ transposed = W64.zero ==>
      ntt_matrix (H s) = lift_matrix res /\
       signed_bound768_cxq res.`1 0 768 2 /\
       signed_bound768_cxq res.`2 0 768 2 /\
       signed_bound768_cxq res.`3 0 768 2
  ].

axiom gen_matrix_t s :
  hoare [ Mderand.gen_matrix  :
    s = seed /\ transposed = W64.one ==>
      trmx (ntt_matrix (H s)) = lift_matrix res /\
       signed_bound768_cxq res.`1 0 768 2 /\
       signed_bound768_cxq res.`2 0 768 2 /\
       signed_bound768_cxq res.`3 0 768 2
  ].

lemma kg_correct sd s_ e_ : 
   array_mont zetas_const = lift_array128 Jindcpa.jzetas =>
   hoare  [ Mderand.indcpa_keypair_compute :  
    sd = publicseed  /\ lift_vector skpv = s_ /\ lift_vector e = e_ /\
     signed_bound768_cxq skpv{hr} 0 768 2 /\
     signed_bound768_cxq e{hr} 0 768 2 ==> 
      lift_vector res.`1 = polyvec_ntt s_ /\
      lift_vector res.`2 = polyvec_ntt (H(sd) *^ s_ + e_) /\
      signed_bound768_cxq res.`1 0 768 2 /\
      signed_bound768_cxq res.`2 0 768 2 ].
proof.
move => *.
proc => //=. 
seq 3 : #pre; first by auto => />.
(******)
seq 2 : (#pre /\
   lift_vector a0 = row_i (ntt_matrix (H sd)) 0 /\
   lift_vector a1 = row_i (ntt_matrix (H sd)) 1 /\
   lift_vector a2 = row_i (ntt_matrix (H sd)) 2 /\
   signed_bound768_cxq a0 0 768 2 /\
   signed_bound768_cxq a1 0 768 2 /\
   signed_bound768_cxq a2 0 768 2).
ecall (gen_matrix sd).
auto => /> &hr ??? -> *.
rewrite /row_i /lift_vector /lift_matrix /ntt_matrix /lift_polyvec => />.
do split.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
(******)
seq 1 : (#{/~skpv}pre /\
   lift_vector skpv = polyvec_ntt s_ /\
   signed_bound768_cxq skpv 0 768 2
   ).
ecall(polyvec_ntt_correct (lift_array768 skpv)).
skip => /> &hr ?.
rewrite /row_i /lift_vector /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split; last  by smt(@Array768). 
rewrite eq_vectorP  => /> *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H13 =>  />.
case (i = 0).
move => -> />.
rewrite -H9 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />.
rewrite  mapiE; first by smt().
by auto => />.
move => *.
case (i = 1).
move => -> />.
rewrite -H10 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by auto => />.
case (i = 2).
move => -> />.
rewrite -H11 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by auto => />.
smt().
(******)
seq 1 : (#{/~e}pre /\
   lift_vector e = polyvec_ntt e_ /\
   signed_bound768_cxq e 0 768 2
   ).
ecall(polyvec_ntt_correct (lift_array768 e)).
skip => /> &hr ?.
rewrite /row_i /lift_vector /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split;  last  by smt(@Array768). 
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H14 =>  />.
case (i = 0).
move => -> />.
rewrite -H10 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />.
rewrite  mapiE; first by smt().
by auto => />.
move => *.
case (i = 1).
move => -> />.
rewrite -H11 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by auto => />.
case (i = 2).
move => -> />.
rewrite -H12 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by auto => />.
smt().
(*****)
seq 1 : (#pre /\
    signed_bound_cxq poly0 0 256 2 /\ lift_array256 poly0 = ntt ((row_i (H sd) 0) `<*>` s_)).
call (innerprod_corr (row_i (H sd) 0) s_ H).
auto => /> &hr.
rewrite  /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split. 
(*****)
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H10.
case (i = 0).
move => iis0.
apply Array256.ext_eq => x xb.
move : H0.
rewrite iis0 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H publicseed{hr}))%MLWEPKE.H_MLWE.[0, 0]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H publicseed{hr}))%MLWEPKE.H_MLWE).[0, i0])).[0]).
by rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H0.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 1).
move => iis1.
apply Array256.ext_eq => x xb.
move : H0.
rewrite iis1 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H publicseed{hr}))%MLWEPKE.H_MLWE.[0, 1]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H publicseed{hr}))%MLWEPKE.H_MLWE).[0, i0])).[1]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H0.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 2).
move => iis2.
apply Array256.ext_eq => x xb.
move : H0.
rewrite iis2 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H publicseed{hr}))%MLWEPKE.H_MLWE.[0, 2]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H publicseed{hr}))%MLWEPKE.H_MLWE).[0, i0])).[2]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H0.
rewrite offunvE => />.
by rewrite initiE.
smt().
(*****)
by rewrite H6.
(****)
(*****)
seq 1 : (#pre /\
    signed_bound_cxq poly1 0 256 2 /\ lift_array256 poly1 = ntt ((row_i (H sd) 1) `<*>` s_)).
call (innerprod_corr (row_i (H sd) 1) s_ H).
auto => /> &hr.
rewrite  /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split. 
(*****)
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H12.
case (i = 0).
move => iis0.
apply Array256.ext_eq => x xb.
move : H1.
rewrite iis0 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H publicseed{hr}))%MLWEPKE.H_MLWE.[1, 0]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H publicseed{hr}))%MLWEPKE.H_MLWE).[1, i0])).[0]).
by rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H1.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 1).
move => iis1.
apply Array256.ext_eq => x xb.
move : H1.
rewrite iis1 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H publicseed{hr}))%MLWEPKE.H_MLWE.[1, 1]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H publicseed{hr}))%MLWEPKE.H_MLWE).[1, i0])).[1]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H1.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 2).
move => iis2.
apply Array256.ext_eq => x xb.
move : H1.
rewrite iis2 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H publicseed{hr}))%MLWEPKE.H_MLWE.[1, 2]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H publicseed{hr}))%MLWEPKE.H_MLWE).[1, i0])).[2]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H1.
rewrite offunvE => />.
by rewrite initiE.
smt().
(*****)
by rewrite H6.
(****)
(*****)
seq 1 : (#pre /\
    signed_bound_cxq poly2 0 256 2 /\ lift_array256 poly2 = ntt ((row_i (H sd) 2) `<*>` s_)).
call (innerprod_corr (row_i (H sd) 2) s_ H).
auto => /> &hr.
rewrite  /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split. 
(*****)
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H14.
case (i = 0).
move => iis0.
apply Array256.ext_eq => x xb.
move : H2.
rewrite iis0 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H publicseed{hr}))%MLWEPKE.H_MLWE.[2, 0]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H publicseed{hr}))%MLWEPKE.H_MLWE).[2, i0])).[0]).
by rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H2.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 1).
move => iis1.
apply Array256.ext_eq => x xb.
move : H2.
rewrite iis1 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H publicseed{hr}))%MLWEPKE.H_MLWE.[2, 1]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H publicseed{hr}))%MLWEPKE.H_MLWE).[2, i0])).[1]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H2.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 2).
move => iis2.
apply Array256.ext_eq => x xb.
move : H2.
rewrite iis2 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H publicseed{hr}))%MLWEPKE.H_MLWE.[2, 2]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H publicseed{hr}))%MLWEPKE.H_MLWE).[2, i0])).[2]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H2.
rewrite offunvE => />.
by rewrite initiE.
smt().
(*****)
by rewrite H6.
(*********************************)
seq 1 : (#pre /\
             signed_bound768_cxq pkpv 0 768 2 /\
             polyvec_ntt (H(sd) *^ s_) = lift_vector pkpv).
ecall (polyvec_frompolys_corr_h poly0 poly1 poly2
         (ntt (row_i ((H sd))%MLWEPKE.H_MLWE 0 `<*>` s_))
         (ntt (row_i ((H sd))%MLWEPKE.H_MLWE 1 `<*>` s_))
         (ntt (row_i ((H sd))%MLWEPKE.H_MLWE 2 `<*>` s_)) 2  ).
auto => /> &hr.
move => *.
split; first by smt().
rewrite /(`<*>`); move => *.

rewrite /lift_vector /polyvec_ntt /lift_polyvec => />.
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
case (i = 0).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite initiE => />.
rewrite (H23 k kb).
rewrite /row_i => />.
do congr.
rewrite  /( *^) offunvK /vclamp. 
rewrite /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=. 
by rewrite !offunvE => />.
case (i = 1).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite initiE => />.
rewrite  (_: 256 + k = k + 256); first by smt().
rewrite (H24 k kb) =>/> *.
rewrite /row_i => />.
do congr.
rewrite  /( *^) offunvK /vclamp. 
rewrite /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=. 
by rewrite !offunvE => />.
case (i = 2).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite initiE => />.
rewrite  (_: 512 + k = k + 512); first by smt().
rewrite (H25 k kb) =>/> *.
rewrite /row_i => />.
do congr.
rewrite  /( *^) offunvK /vclamp. 
rewrite /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=. 
by rewrite !offunvE => />.
smt().
seq 1 : (#{/~pkpv}pre /\
    signed_bound768_cxq pkpv 0 768 4 /\ polyvec_ntt ((H sd)%MLWEPKE.H_MLWE *^ s_ + e_) = lift_vector pkpv).
exists *(lift_array768 pkpv) ,(lift_array768 e). elim * => _p _e.
call (polyvec_add_corr _p _e 2 2).
auto => /> *.
(***************************************)
rewrite polyvec_ntt_add.
rewrite H17 -H8 /lift_vector /polyvec_ntt /lift_polyvec //=.
rewrite !eq_vectorP  //=  => *.
rewrite !offunvE //=.
rewrite /(Poly.(+)) map2E //=.
apply Array256.ext_eq => x xb. 
rewrite !initiE //=.
case (i = 0).
move => -> //=.
rewrite !initiE => //=.
move : (H19 x _); first by smt().
rewrite /lift_array768 //= !mapiE //=; first  2 by smt().
rewrite  -ZModField.inzmodD.
by move => ->.
case (i = 1).
move => -> //=.
rewrite !initiE => //=.
move : (H19 (256 + x) _); first by smt().
rewrite /lift_array768 //= !mapiE //=; first  2 by smt().
rewrite  -ZModField.inzmodD.
by move => ->.
case (i = 2).
move => -> //=.
rewrite !initiE => //=.
move : (H19 (512 + x) _); first by smt().
rewrite /lift_array768 //= !mapiE //=; first  2 by smt().
rewrite  -ZModField.inzmodD.
by move => ->.
by smt().
(***************************************)
ecall (polyvec_reduce_corr (lift_array768 pkpv)).
auto => /> *.
split; last by rewrite /signed_bound768_cxq;smt(@Array768).
move : H17 H18; rewrite /polyvec_ntt  /lift_vector /lift_array768 /lift_polyvec  !mapE.
rewrite (Array768.tP 
  ((Array768.init (fun (i : int) => (fun (x : W16.t) => (ZModField.inzmod (to_sint x))%ZModField) pkpv{hr}.[i])))
  ((Array768.init (fun (i : int) => (fun (x : W16.t) => (ZModField.inzmod (to_sint x))%ZModField) result.[i])))).
rewrite !eq_vectorP  //=  => *.
rewrite (H17 i H20) //.
rewrite !offunvE //=.
apply Array256.ext_eq => k kb.
case  (i = 0).
move => -> //=.
move  : (H18 k _) => //; first by smt().
rewrite !initiE; first 4 by smt().
by move => ->.
move => *.
case  (i = 1).
move => -> //=.
move  : (H18 (256 + k) _) => //; first by smt().
rewrite !initiE; first 4 by smt().
by move => ->.
move => *.
case  (i = 2).
move => -> //=.
move  : (H18 (512 + k) _) => //; first by smt().
rewrite !initiE; first 4 by smt().
by move => ->.
by smt().
qed.

lemma enc_correct _msg sd t_ r_ e_ ep_ : 
   array_mont_inv zetas_inv_const = lift_array128 Jindcpa.jzetas_inv =>
   array_mont zetas_const = lift_array128 Jindcpa.jzetas =>
   hoare  [ Mderand.indcpa_enc_compute :  
    msgp = Array256.map (fun (x : bool) => if x then W16.one else W16.zero) _msg /\
    sd = publicseed  /\ lift_vector pkpv = polyvec_ntt t_ /\ 
     lift_vector ep = e_ /\ lift_array256 epp = ep_ /\  lift_vector  sp_0  = r_ /\
     signed_bound768_cxq pkpv{hr} 0 768 2 /\
     signed_bound768_cxq sp_0{hr} 0 768 2 /\
     signed_bound_cxq epp{hr} 0 256 2 /\
     signed_bound768_cxq ep{hr} 0 768 2 ==> 
      (lift_vector res.`1,lift_array256 res.`2) = 
         c_encode ((((m_transpose (H sd)) *^ r_) + e_),
                   ((t_ `<*>` r_) +& ep_ +& (m_encode _msg))) /\
      (forall k, 0 <= k < 768 => 0 <= to_sint res.`1.[k] < 1024) /\
      (forall k, 0 <= k < 256 => 0 <= to_sint res.`2.[k] < 16)  ].
(*********)
(*********)
proof.
move => Hzinv Hz.
proc => //=. 
(*****)
seq 1 : (#pre /\ lift_array256 k = (m_encode _msg) /\ 
         pos_bound256_cxq k 0 256 1).
call  (poly_frommsg_corr_h _msg).
by auto  =>  />.
(******)
seq 2 : (#pre /\
   lift_vector at0 = row_i (m_transpose (ntt_matrix (H sd))) 0 /\
   lift_vector at1 = row_i (m_transpose (ntt_matrix (H sd))) 1 /\
   lift_vector at2 = row_i (m_transpose (ntt_matrix (H sd))) 2 /\
   signed_bound768_cxq at0 0 768 2 /\
   signed_bound768_cxq at1 0 768 2 /\
   signed_bound768_cxq at2 0 768 2).
ecall (gen_matrix_t sd).
auto => /> &hr ???????? -> *. 
rewrite /row_i /lift_vector /lift_matrix /ntt_matrix /lift_polyvec => />.
do split.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
(******)
seq 1 : (#{/~sp_0}pre /\
   lift_vector sp_0 = polyvec_ntt r_ /\
   signed_bound768_cxq sp_0 0 768 2
   ).
ecall(polyvec_ntt_correct (lift_array768 sp_0)).
skip => /> &hr ?.
rewrite /row_i /lift_vector /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split; last  by smt(@Array768). 
rewrite eq_vectorP  => /= *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H17 =>  />.
case (i = 0).
move => -> />.
rewrite -H13 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />.
rewrite  mapiE; first by smt().
by auto => />.
move => *.
case (i = 1).
move => -> />.
rewrite -H14 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by auto => />.
case (i = 2).
move => -> />.
rewrite -H15 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by auto => />.
smt().
(*****)
seq 1 : (#pre /\
    signed_bound_cxq poly0 0 256 2 /\ lift_array256 poly0 = scale (ntt ((row_i (m_transpose (H sd)) 0) `<*>` r_)) (ZModField.inzmod 169)).
call (polyvec_pointwise_acc_corr_alg (row_i (m_transpose (H sd)) 0) r_ Hz).
auto => /> &hr.
rewrite  /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split. 
(*****)
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H13 /=.
case (i = 0).
move => iis0.
apply Array256.ext_eq => x xb.
move : H5.
rewrite iis0 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt (m_transpose (H publicseed{hr}))%MLWEPKE.H_MLWE.[0, 0]) = 
   (offunv (fun (i0 : int) => (m_transpose (ntt_matrix ((H publicseed{hr})))%MLWEPKE.H_MLWE).[0, i0])).[0]).
rewrite /ntt_matrix offunvE //=  !offunmE  => />.
by  rewrite !offunmE  => />.
rewrite -H5.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 1).
move => iis1.
apply Array256.ext_eq => x xb.
move : H5.
rewrite iis1 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt (m_transpose (H publicseed{hr}))%MLWEPKE.H_MLWE.[0, 1]) = 
   (offunv (fun (i0 : int) => (m_transpose (ntt_matrix ((H publicseed{hr})))%MLWEPKE.H_MLWE).[0, i0])).[1]).
rewrite /ntt_matrix offunvE //= offunmE //= !offunmE  => />.
by  rewrite !offunmE  => />.
rewrite -H5.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 2).
move => iis2.
apply Array256.ext_eq => x xb.
move : H5.
rewrite iis2 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt (m_transpose (H publicseed{hr}))%MLWEPKE.H_MLWE.[0, 2]) = 
   (offunv (fun (i0 : int) => (m_transpose (ntt_matrix ((H publicseed{hr})))%MLWEPKE.H_MLWE).[0, i0])).[2]).
rewrite /ntt_matrix offunvE //= offunmE //= !offunmE  => />.
by  rewrite !offunmE  => />.
rewrite -H5.
rewrite offunvE => />.
by rewrite initiE.
smt().
(*****)
by rewrite H11.
(****)
seq 1 : (#pre /\
    signed_bound_cxq poly1 0 256 2 /\ lift_array256 poly1 = scale (ntt ((row_i (m_transpose (H sd)) 1) `<*>` r_)) (ZModField.inzmod 169)).
call (polyvec_pointwise_acc_corr_alg (row_i (m_transpose (H sd)) 1) r_ Hz).
auto => /> &hr.
rewrite  /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split. 
(*****)
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H15 /=.
case (i = 0).
move => iis0.
apply Array256.ext_eq => x xb.
move : H6.
rewrite iis0 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt (m_transpose (H publicseed{hr}))%MLWEPKE.H_MLWE.[1, 0]) = 
   (offunv (fun (i0 : int) => (m_transpose (ntt_matrix ((H publicseed{hr})))%MLWEPKE.H_MLWE).[1, i0])).[0]).
rewrite /ntt_matrix offunvE //=  !offunmE  => />.
by  rewrite !offunmE  => />.
rewrite -H6.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 1).
move => iis1.
apply Array256.ext_eq => x xb.
move : H6.
rewrite iis1 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt (m_transpose (H publicseed{hr}))%MLWEPKE.H_MLWE.[1, 1]) = 
   (offunv (fun (i0 : int) => (m_transpose (ntt_matrix ((H publicseed{hr})))%MLWEPKE.H_MLWE).[1, i0])).[1]).
rewrite /ntt_matrix offunvE //= offunmE //= !offunmE  => />.
by  rewrite !offunmE  => />.
rewrite -H6.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 2).
move => iis2.
apply Array256.ext_eq => x xb.
move : H6.
rewrite iis2 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt (m_transpose (H publicseed{hr}))%MLWEPKE.H_MLWE.[1, 2]) = 
   (offunv (fun (i0 : int) => (m_transpose (ntt_matrix ((H publicseed{hr})))%MLWEPKE.H_MLWE).[1, i0])).[2]).
rewrite /ntt_matrix offunvE //= offunmE //= !offunmE  => />.
by  rewrite !offunmE  => />.
rewrite -H6.
rewrite offunvE => />.
by rewrite initiE.
smt().
(*****)
by rewrite H11.
(******)
seq 1 : (#pre /\
    signed_bound_cxq poly2 0 256 2 /\ lift_array256 poly2 = scale (ntt ((row_i (m_transpose (H sd)) 2) `<*>` r_)) (ZModField.inzmod 169)).
call (polyvec_pointwise_acc_corr_alg (row_i (m_transpose (H sd)) 2) r_ Hz).
auto => /> &hr.
rewrite  /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split. 
(*****)
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H17 /=.
case (i = 0).
move => iis0.
apply Array256.ext_eq => x xb.
move : H7.
rewrite iis0 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt (m_transpose (H publicseed{hr}))%MLWEPKE.H_MLWE.[2, 0]) = 
   (offunv (fun (i0 : int) => (m_transpose (ntt_matrix ((H publicseed{hr})))%MLWEPKE.H_MLWE).[2, i0])).[0]).
rewrite /ntt_matrix offunvE //=  !offunmE  => />.
by  rewrite !offunmE  => />.
rewrite -H7.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 1).
move => iis1.
apply Array256.ext_eq => x xb.
move : H7.
rewrite iis1 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt (m_transpose (H publicseed{hr}))%MLWEPKE.H_MLWE.[2, 1]) = 
   (offunv (fun (i0 : int) => (m_transpose (ntt_matrix ((H publicseed{hr})))%MLWEPKE.H_MLWE).[2, i0])).[1]).
rewrite /ntt_matrix offunvE //= offunmE //= !offunmE  => />.
by  rewrite !offunmE  => />.
rewrite -H7.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 2).
move => iis2.
apply Array256.ext_eq => x xb.
move : H7.
rewrite iis2 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt (m_transpose (H publicseed{hr}))%MLWEPKE.H_MLWE.[2, 2]) = 
   (offunv (fun (i0 : int) => (m_transpose (ntt_matrix ((H publicseed{hr})))%MLWEPKE.H_MLWE).[2, i0])).[2]).
rewrite /ntt_matrix offunvE //= offunmE //= !offunmE  => />.
by  rewrite !offunmE  => />.
rewrite -H7.
rewrite offunvE => />.
by rewrite initiE.
smt().
(*****)
by rewrite H11.

(*********************************)
seq 1 : (#pre /\
             signed_bound768_cxq bp 0 768 2 /\
             scale_vector (polyvec_ntt ((m_transpose (H(sd))) *^ r_)) (ZModField.inzmod 169) = lift_vector bp).
ecall (polyvec_frompolys_corr_h poly0 poly1 poly2
         (scale (ntt (row_i (m_transpose (H sd))%MLWEPKE.H_MLWE 0 `<*>` r_)) (ZModField.inzmod 169))
          (scale (ntt (row_i (m_transpose (H sd))%MLWEPKE.H_MLWE 1 `<*>` r_)) (ZModField.inzmod 169))
          (scale  (ntt (row_i (m_transpose (H sd))%MLWEPKE.H_MLWE 2 `<*>` r_)) (ZModField.inzmod 169)) 2  ).
auto => /> &hr.
rewrite /(`<*>`); move => *.
split; first by smt().
move => *.

rewrite /lift_vector /polyvec_ntt /lift_polyvec => />.
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
case (i = 0).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite initiE => />.
rewrite (H26 k kb).
rewrite /row_i => />.
do congr.
rewrite  /( *^) offunvK /vclamp. 
rewrite /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=. 
by rewrite !offunvE //= offunvK => />.
case (i = 1).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite initiE => />.
rewrite  (_: 256 + k = k + 256); first by smt().
rewrite (H27 k kb) =>/> *.
rewrite /row_i => />.
do congr.
rewrite  /( *^) offunvK /vclamp. 
rewrite /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=. 
by rewrite !offunvE //= offunvK => />.
case (i = 2).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite initiE => />.
rewrite  (_: 512 + k = k + 512); first by smt().
rewrite (H28 k kb) =>/> *.
rewrite /row_i => />.
do congr.
rewrite  /( *^) offunvK /vclamp. 
rewrite /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=. 
by rewrite !offunvE //= offunvK => />.
smt().
(***********)
(*****)
seq 1 : (#pre /\
    signed_bound_cxq v 0 256 2 /\ lift_array256 v = scale (ntt (t_ `<*>` r_)) (ZModField.inzmod 169)).
call (polyvec_pointwise_acc_corr_alg (t_) (r_) Hz).
auto => /> &hr.
rewrite  /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
by rewrite H H11. 
(*****)
seq 1 : (#{/~bp}pre /\
signed_bound768_cxq bp 0 768 2 /\
   (m_transpose ((H sd))%MLWEPKE.H_MLWE *^ r_) = lift_vector bp).
ecall (polyvec_invntt_correct (lift_array768 bp)).
auto=> />.
move  => *.
split; first by rewrite /signed_bound768_cxq;smt(@Array768 qE).

have ? : (
scale (ntt (m_transpose ((H publicseed{hr}))%MLWEPKE.H_MLWE *^ r_).[0]) (ZModField.inzmod 169)  = (Array256.of_list witness (sub (lift_array768 bp{hr}) 0 256))).
move :  H20; rewrite /polyvec_ntt /scale_vector /lift_vector /lift_polyvec eq_vectorP  => * //.
move : (H20 0 _) => // ; rewrite !offunvE //=. 
rewrite (aux_oflist_lift bp{hr} 0) //.
move => <-.
congr => /=.
by rewrite /( *^) !offunvK /vclamp /=.  

have ? : (
scale (ntt (m_transpose ((H publicseed{hr}))%MLWEPKE.H_MLWE *^ r_).[1]) ((ZModField.inzmod 169))%ZModField = (Array256.of_list witness (sub (lift_array768 bp{hr}) 256 256))).
move :  H20; rewrite /polyvec_ntt /scale_vector /lift_vector /lift_polyvec eq_vectorP  => * //.
move : (H20 1 _) => // ; rewrite !offunvE //=. 
rewrite (aux_oflist_lift bp{hr} 1) //.
move => <-.
congr => /=.
by rewrite /( *^) !offunvK /vclamp /=.  

have ? : (
scale (ntt (m_transpose ((H publicseed{hr}))%MLWEPKE.H_MLWE *^ r_).[2]) ((ZModField.inzmod 169))%ZModField = (Array256.of_list witness (sub (lift_array768 bp{hr}) 512 256))).
move :  H20; rewrite /polyvec_ntt /scale_vector /lift_vector /lift_polyvec eq_vectorP  => * //.
move : (H20 2 _) => // ; rewrite !offunvE //=. 
rewrite (aux_oflist_lift bp{hr} 2) //.
move => <-.
congr => /=.
by rewrite /( *^) !offunvK /vclamp /=.  

move : H24  H25 H26; rewrite /scale_vector /lift_vector /lift_polyvec /= => *.
apply  eq_vectorP => i ib.
rewrite !offunvE //=.

case (i = 0).
move => -> /=.
rewrite -H24.
rewrite -H28 invntt_scale invnttK.
rewrite scale_scale_cancel.
rewrite /( *^) /=.
rewrite /big !foldr_map /=. 
rewrite /predT /=.
by rewrite offunvE //.

move =>  *.
case (i = 1).
move => -> /=.
rewrite -H25.
rewrite -H29 invntt_scale invnttK.
rewrite scale_scale_cancel.
rewrite /( *^) /=.
rewrite /big !foldr_map /=. 
rewrite /predT /=.
by rewrite offunvE //.

move =>  *.
case (i = 2).
move => -> /=.
rewrite -H26.
rewrite -H30 invntt_scale invnttK.
rewrite scale_scale_cancel.
rewrite /( *^) /=.
rewrite /big !foldr_map /=. 
rewrite /predT /=.
by rewrite offunvE //.

smt().

(********)
(*****)
seq 1 : (#{/~v}pre /\
signed_bound_cxq v 0 256 2 /\
lift_array256 v = (t_ `<*>` r_)).
ecall (invntt_correct_h (lift_array256 v)).
auto=> />.
move  => *.
split; first by rewrite /signed_bound_cxq;smt(@Array256 qE).
rewrite -H24 H20 invntt_scale invnttK.
by rewrite scale_scale_cancel.

(********)
(********)
(*****)
seq 1 : (#{/~bp}pre /\
signed_bound768_cxq bp 0 768 4 /\
   (m_transpose ((H sd))%MLWEPKE.H_MLWE *^ r_ + e_) = lift_vector bp).
exists *bp, ep. elim* => bpp epp.
call (polyvec_add_corr (lift_array768 bpp) (lift_array768 epp) (2) (2) _ _).
auto=> />.
move  => *.
rewrite H20 /(+) /= /lift_vector. 
rewrite eq_vectorP => i ib.
rewrite !offunvE //= map2E /= !offunvE //=.
rewrite/lift_polyvec /=.
apply Array256.ext_eq => x xb.
rewrite !initiE //=.
rewrite (H24 (i * 256 + x)); first by smt().
by rewrite /lift_array768 /= !mapE /= !initiE //; first 2 by smt().

(********)
(*****)
seq 1 : (#{/~v}pre /\
signed_bound_cxq v 0 256 4 /\
   (lift_array256 v = (t_ `<*>` r_) + ep_)).
exists *v, epp. elim* => vp eppp.
call (poly_add_corr (lift_array256 vp) (lift_array256 eppp) (2) (2) _ _).
auto=> />.
move  => *.
rewrite -H20 /lift_array256 /= /Poly.(+) /= map2E /=. 
apply Array256.ext_eq => x xb.
rewrite !initiE //= mapiE //=.
rewrite (H24 (x) _); first by smt().
by rewrite /lift_array256 /=.

(********)
(*****)
seq 1 : (#{/~v}pre /\
signed_bound_cxq v 0 256 5 /\
   (lift_array256 v = (t_ `<*>` r_) + ep_ + m_encode _msg)).
exists *v, k. elim* => vp kp.
call (poly_add_corr (lift_array256 vp) (lift_array256 kp) (4) (1) _ _).
auto=> />.
move  => *.
split; first by move : H4; rewrite /pos_bound256_cxq  /signed_bound_cxq /=; smt(@Array256 @Fq).
move => *.
rewrite -H22 /lift_array256 /= /Poly.(+) /= map2E /=. 
apply Array256.ext_eq => x xb.
rewrite !initiE //= mapiE //=.
rewrite (H25 (x) _); first by smt().
rewrite H3.
by rewrite /lift_array256 /=.
(********)
(*****)
(*****)
seq 1 : (#{/~bp}pre /\
pos_bound768_cxq bp 0 768 2 /\
   (m_transpose ((H sd))%MLWEPKE.H_MLWE *^ r_ + e_) = lift_vector bp).
exists *bp. elim* => bpp.
call(polyvec_reduce_corr (lift_array768 bpp)).
auto => />.
move => *. 
by rewrite -(lift_equiv bp{hr} result H23) -H20.

(********)
(*****)
seq 1 : (#{/~v}pre /\
pos_bound256_cxq v 0 256 2 /\
   (lift_array256 v = (t_ `<*>` r_) + ep_ + m_encode _msg)).
exists *v. elim* => vp.
call(poly_reduce_corr_h (lift_array256 vp)).
auto => />.
move => *. 
by rewrite -H23 H20.

(********)
(*****)
seq 1 : (#pre /\
   (offunv (fun (i : int) => (PolyVec.round_poly (tofunv (m_transpose (H sd) *^ r_ + e_) i)))) = lift_vector r1 /\ (forall k, 0 <= k < 768 => 0 <= to_sint r1.[k] < 1024)).

ecall (polyvec_compress_round_corr (lift_array768 bp)).

auto  => />.
move => *.
move : H23 H20.
rewrite /lift_array768 /lift_vector /lift_polyvec /=.
rewrite Array768.tP  => ?.
rewrite eq_vectorP => ?.

apply eq_vectorP => i ib.
rewrite !offunvE //=.
rewrite /round_poly /=.

apply Array256.ext_eq => x xb.
move : (H20 (i*256+x) _) => /=; first by smt().
move : (H23 i ib).

rewrite !mapE !initiE  //=; first 2 by smt().
move => ? <-.
congr.
rewrite initiE /=; first by smt().
move : H25; rewrite !offunvE //=. 
rewrite tP  => ?.
move : (H25 x xb).
rewrite initiE //=.
move => <-.
congr => /=.
rewrite /(+) /= !offunvK /vclamp ib /=. 
by rewrite !map2E /= !offunvE //.

(********)
(*****)
seq 1 : (#pre /\
   round_poly ((t_ `<*>` r_) +& ep_ +& m_encode _msg)  = lift_array256 r2 /\ forall k, 0 <= k < 256 => 0 <= to_sint r2.[k] < 16).

ecall (poly_compress_round_corr_h (lift_array256 v)).
auto  => />.
move => *.
by rewrite -H25 H22 /round_poly.

(*******)
auto  => />.
move => *.
by rewrite -H25 -H23 /c_encode /=.
qed.

(*******)
(*XXXXXX*)
(*******)

op lift_polyvec32 (row : W32.t Array768.t) (c : int) : ZModField.zmod Array256.t =
  (Array256.init (fun (i : int) => (ZModField.inzmod (to_sint row.[c * 256 + i])))).

op lift_vector32(a : W32.t Array768.t) = 
    offunv (fun (i : int) => lift_polyvec32 a i).

op b32(a : W32.t, b : int) = (-b <= to_sint a && to_sint a < b)
   axiomatized by b32E.


op signed_bound_cxq32 (coefs : W32.t Array256.t) (l u c : int) : bool =
  forall (k : int), l <= k && k < u => (b32 coefs.[k] (c * q)).

op lift_array256_32 (p : W32.t Array256.t) : ZModField.zmod Array256.t =
  Array256.map (fun (x : W32.t) => (ZModField.inzmod (to_sint x))) p.

lemma dec_correct s_ c1_ c2_ : 
   array_mont_inv zetas_inv_const = lift_array128 Jindcpa.jzetas_inv =>
   array_mont zetas_const = lift_array128 Jindcpa.jzetas =>
   hoare  [ Mderand.indcpa_dec_compute : 
       polyvec_ntt s_ = lift_vector skpv /\
       signed_bound768_cxq skpv 0 768 2 /\
       c1_ = lift_vector32 r1 /\
       c2_ = lift_array256 r2 /\
       (forall  k, 0 <= k < 768 => 0 <= to_sint r1.[k] < 1024) /\
       (forall  k, 0 <= k < 256 => 0 <= to_sint r2.[k] < 16)
        ==> 
       res = let (u,v) = c_decode (c1_,c2_) in
          Array256.map (fun (x : bool) => if x then W32.one else W32.zero)
                     (m_decode (v -& (s_ `<*>` u))) ].
(*********)
(*********)
proof.
move => Hzinv Hz.
proc => //=. 
(*****)
seq 1 : #pre; first by auto => />.
(*****)
seq 1 : (#pre /\
  lift_vector bp = offunv (fun (i : int) => (PolyVec.unround_poly (tofunv c1_ i))) /\
  signed_bound768_cxq bp 0 768 1).
ecall(polyvec_decompress_restore_corr (lift_array768_32 r1)).
auto => />.
move => *.
split.
+ rewrite /pos_bound768_b_32 => k kb.
  by rewrite bpos32E; apply (H1 k kb).
move => *.
move : H4.
rewrite /lift_vector /lift_vector32 /unround_poly /lift_array768_32 /lift_array768 /lift_polyvec32  /= offunvK /vclamp /lift_polyvec /=.
rewrite tP => *.
apply eq_vectorP => i ib.
rewrite !offunvE /= ib //=.
apply Array256.ext_eq => x xb.
move : (H4 (i*256 + x) _); first by smt().
rewrite !mapiE  /=; first 4 by smt().
by rewrite !initiE //= => <-.
(********)
seq 1 : (#pre /\
  lift_array256 v = Poly.unround_poly c2_ /\
  signed_bound_cxq v 0 256 1).
ecall(poly_decompress_restore_corr (lift_array256 r2)).
by auto => /> /#.
(********)
seq 1 : (#{/~bp}pre /\
   lift_vector bp = polyvec_ntt (offunv (fun (i : int) => (PolyVec.unround_poly (tofunv c1_ i)))) /\
   signed_bound768_cxq bp 0 768 2
   ).
ecall(polyvec_ntt_correct (lift_array768 bp)).
skip => /> &hr ?.
rewrite /lift_vector /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split; first  by smt(@Array768). 
move => *.
split; last  by smt(@Array768). 
rewrite eq_vectorP  => /= *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H13 =>  />.
move : H3; rewrite eq_vectorP => *.
move : (H3 i H13).
rewrite !offunvE //=. 
case (i = 0).
move => -> /> *.
rewrite -H9 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />.
rewrite  mapiE /=; first by smt().
by rewrite -H14 initiE //.
move => ?.
case (i = 1).
move => -> /> *.
rewrite -H10 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by rewrite -H15 initiE //.
case (i = 2).
move => -> />  *.
rewrite -H11 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by rewrite -H15 initiE //.
smt().
(************)
(*****)
seq 1 : (#pre /\
    signed_bound_cxq t 0 256 2 /\ lift_array256 t = scale (ntt (s_ `<*>` ((offunv (fun (i : int) => (PolyVec.unround_poly (tofunv c1_ i))%PolyVec))))) (ZModField.inzmod 169)).
call (polyvec_pointwise_acc_corr_alg s_ ((offunv (fun (i : int) => (PolyVec.unround_poly (tofunv c1_ i))%PolyVec))) Hz).
auto => /> &hr.
rewrite  /lift_vector /lift_vector32 /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 => /> *.
(*****)
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H7 /=.
case (i = 0).
move => iis0.
move : H5.
rewrite iis0 /=.
rewrite eq_vectorP => *.
move : (H5 i H7).
rewrite !offunvE //=.
rewrite iis0 /= => ->.
by rewrite !offunvK /vclamp /=.

move => *.
case (i = 1).
move => iis1.
move : H5.
rewrite iis1 /=.
rewrite eq_vectorP => *.
move : (H5 i H7).
rewrite !offunvE //=.
rewrite iis1 /= => ->.
by rewrite !offunvK /vclamp /=.

move => *.
case (i = 2).
move => iis2.
move : H5.
rewrite iis2 /=.
rewrite eq_vectorP => *.
move : (H5 i H7).
rewrite !offunvE //=.
rewrite iis2 /= => ->.
by rewrite !offunvK /vclamp /=.

smt().
(*****)
(*****)
seq 1 : (#{/~t}pre /\
signed_bound_cxq t 0 256 2 /\
lift_array256 t = ((s_ `<*>` offunv (fun (i : int) => (PolyVec.unround_poly (tofunv c1_ i))%PolyVec)))).
ecall (invntt_correct_h (lift_array256 t)).
auto=> />.
move  => *.
split; first by rewrite /signed_bound_cxq;smt(@Array256 qE).
rewrite -H10 H8 invntt_scale invnttK.
by rewrite scale_scale_cancel.
(*****)
seq 1 : (#pre /\
  lift_array256 mp = 
    (unround_poly c2_) -& ((s_ `<*>` offunv (fun (i : int) => (PolyVec.unround_poly (tofunv c1_ i))%PolyVec))) /\
     signed_bound_cxq mp 0 256 3).
call(poly_sub_corr (unround_poly c2_) (s_ `<*>` offunv (fun (i : int) => (PolyVec.unround_poly (tofunv c1_ i))%PolyVec))
        1 2).
auto => />.
move => *.
split; first by rewrite H3 H8 /=.
move => *.
rewrite /(-&) /Poly.(+) /Poly.([-]) map2E /= mapE /=.
rewrite /lift_array256.
apply Array256.ext_eq => x xb.
rewrite !mapiE //=. 
rewrite initiE //=.
rewrite (H12 x xb) => /=.
rewrite  /lift_array256.
by rewrite initiE //=.
(***********)
seq 1 : (#{/~mp}pre /\
pos_bound256_cxq mp 0 256 2 /\
   (lift_array256 mp = unround_poly c2_ -& (s_ `<*>` offunv (fun (i : int) => (PolyVec.unround_poly (tofunv c1_ i)))))).
exists *mp. elim* => mp.
call(poly_reduce_corr_h (lift_array256 mp)).
auto => />.
move => *. 
by rewrite -H11 H9.
(***********)

ecall(poly_tomsg_corr_h (lift_array256 mp)).
auto => />.
move => *.
rewrite /c_decode /=.
move : H11; rewrite H10 => <-.
apply Array256.ext_eq => x xb.
rewrite mapiE //= mapiE //=.
by smt().
qed.



section.

declare module H : H_MLWE_ROM.POracle.

lemma kg_corr : 
  equiv [ MLWE_PKE(H).kg ~ Mderand.kg :
     true ==> true ].
proc.
inline Mderand.indcpa_keypair_jazz.
have indhop : 
   equiv [ MLWE_PKE(H).kg ~ Mderand.indcpa_keypair_jazz :
     true ==> true ].
proc.
admitted.

lemma enc_corr &m : 
  equiv [ MLWE_PKE(H).enc ~ Mderand.indcpa_enc_jazz :
     true ==> true ].
proc.
admitted.


lemma dec_corr &m : 
  equiv [ MLWE_PKE(H).dec ~ Mderand.indcpa_dec_jazz :
     true ==> true ].
proc.
admitted.

end section.
