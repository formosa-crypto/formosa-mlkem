
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
import M.
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
       signed_bound768_cxq res.`1 0 256 2 /\
       signed_bound768_cxq res.`2 0 256 2 /\
       signed_bound768_cxq res.`3 0 256 2
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
move => *.

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
rewrite  -ZModRing.inzmodD.
by move => ->.
case (i = 1).
move => -> //=.
rewrite !initiE => //=.
move : (H19 (256 + x) _); first by smt().
rewrite /lift_array768 //= !mapiE //=; first  2 by smt().
rewrite  -ZModRing.inzmodD.
by move => ->.
case (i = 2).
move => -> //=.
rewrite !initiE => //=.
move : (H19 (512 + x) _); first by smt().
rewrite /lift_array768 //= !mapiE //=; first  2 by smt().
rewrite  -ZModRing.inzmodD.
by move => ->.
by smt().
(***************************************)
ecall (polyvec_reduce_corr (lift_array768 pkpv)).
auto => /> *.
split; last by rewrite /signed_bound768_cxq;smt(@Array768).
move : H17 H18; rewrite /polyvec_ntt  /lift_vector /lift_array768 /lift_polyvec  !mapE.
rewrite (Array768.tP 
  ((Array768.init (fun (i : int) => (fun (x : W16.t) => (ZModRing.inzmod (to_sint x))%ZModRing) pkpv{hr}.[i])))
  ((Array768.init (fun (i : int) => (fun (x : W16.t) => (ZModRing.inzmod (to_sint x))%ZModRing) result.[i])))).
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
