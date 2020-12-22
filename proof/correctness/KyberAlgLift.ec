require import AllCore IntDiv List.
from Jasmin require import JModel.
require import Array256 Array768 W16extra Montgomery.

require import NTT_Fq.
require import KyberPoly.
require import KyberPolyVec.
require import Fq.

import Fq.
import Kyber_.
import MLWEPKE.
import H_MLWE.
import Matrix_.
import NTT_Fq.
import Kyber_.ZModField. 
import KyberPolyVec.
import SignedReductions.

(* The base ring type R of vectors is poly 

type poly = elem Array256.Array256.t.

We cloned M with this type, but so far we have not
proved the ring lemmas. At some point these should
come from the poly theory.

*)

(* OPERATIONS OVER R *)

import KyberPoly.

lemma poly_add_corr_R _a _b ab bb :
  0 <= ab <= 6 =>
  0 <= bb <= 3 =>
  hoare [ Jindcpa.M.poly_add2 :
    _a = lift_array256 rp /\
    _b = lift_array256 bp /\ 
    signed_bound_cxq rp 0 256 ab /\ 
    signed_bound_cxq bp 0 256 bb
     ==>
    signed_bound_cxq res 0 256 (ab + bb)%Int /\
    lift_array256 res = _a +& _b].
move => AB BB.
conseq (_: _ ==>
     signed_bound_cxq res 0 256 (ab + bb) /\
     forall (k : int),
        0 <= k && k < 256 =>
            inzmod (to_sint res.[k]) = _a.[k] + _b.[k]).
move => ? [#] ????? [#] ? sum.
split; first smt().
rewrite /lift_array256 /Poly.(+) mapE map2E => />.
apply Array256.ext_eq => x xb.
rewrite initiE; first  by apply xb.
auto => />.
rewrite (sum x xb).
rewrite initiE; first  by apply xb.
by auto => />.
by apply (poly_add_corr _a _b ab bb AB BB).
qed.

(* OPERATIONS OVER VECTORS *)

op lift_vector(vec: W16.t Array768.t) : vector =
    Vector.offunv (fun i => KyberPolyVec.lift_polyvec vec i).

op polyvec_ntt(v : vector) : vector =
   Vector.offunv 
       (fun i => (ntt ((Vector.tofunv v) i))).

op scale_vector(v : vector, c : zmod) : vector = 
   Vector.offunv 
       (fun i => (scale ((Vector.tofunv v) i) c)).

lemma polyvec_ntt_add (v1 v2 : vector) :
   polyvec_ntt (v1 + v2) = 
    polyvec_ntt v1 + polyvec_ntt v2.
proof.
rewrite /polyvec_ntt. 
rewrite eq_vectorP => *.
rewrite !offunvE //= offunvK /vclamp H //= !offunvE //=. by rewrite add_comm_ntt.
qed.

op polyvec_invntt(v : vector) : vector =
   Vector.offunv 
       (fun i => (invntt ((Vector.tofunv v) i))).

lemma polyvec_pointwise_acc_corr_alg va vb :
  array_mont zetas_const = lift_array128 Jindcpa.jzetas =>
  hoare [ IndcpaDerand.Mderand.polyvec_pointwise_acc :
    polyvec_ntt va = lift_vector a /\
    polyvec_ntt vb = lift_vector b /\
    signed_bound768_cxq a 0 768 2 /\
    signed_bound768_cxq b 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = scale (ntt (va `<*>` vb)) (inzmod 169)  ].
proof.
move => zetasasp.
 move : (polyvec_pointwise_acc_corr_h (ntt va.[0]) (ntt va.[1]) 
               (ntt va.[2]) (ntt vb.[0]) (ntt vb.[1]) (ntt vb.[2]) 
          (scale (basemul (ntt va.[0]) (ntt vb.[0])) (inzmod 169))
          (scale (basemul (ntt va.[1]) (ntt vb.[1])) (inzmod 169))
          (scale (basemul (ntt va.[2]) (ntt vb.[2])) (inzmod 169))
          ((scale (basemul (ntt va.[0]) (ntt vb.[0])) (inzmod 169)) +&
           (scale (basemul (ntt va.[1]) (ntt vb.[1])) (inzmod 169)) +&
           (scale (basemul (ntt va.[2]) (ntt vb.[2])) (inzmod 169)))  zetasasp _ _ _ _) => //= *.
rewrite /Poly.(+) map2E /Poly.(+) map2E /= initE H /= initE H //=.
conseq (H).
move => &hr.
rewrite /polyvec_ntt /lift_vector /lift_polyvec  => /> *.
move : H0 H1 H2; rewrite !eq_vectorP => />*. 
do split.
by move : (H0 0 _) => //; rewrite !offunvE => />.
by move : (H0 1 _) => //; rewrite !offunvE => />.
by move : (H0 2 _) => //; rewrite !offunvE => />.
by move : (H1 0 _) => //; rewrite !offunvE => />.
by move : (H1 1 _) => //; rewrite !offunvE => />.
by move : (H1 2 _) => //; rewrite !offunvE => />.
move => &hr [#] *.
move : H4 =>  [# *].
split; first by rewrite /signed_bound_cxq; smt().
rewrite H4 /(`<*>`) /dotp //= !Big.BAdd.big_consT //= Big.BAdd.big_nil //=. 
rewrite /scale !add_comm_ntt !mul_comm_ntt.  
apply Array256.ext_eq => x xb.
rewrite !mapE   => />.
rewrite /Poly.(+) map2E //=  !initiE => />.
rewrite /Poly.(+) map2E //=  !initiE => />.
rewrite /Poly.(+) map2E //=  !initiE => />.
rewrite map2E //=  !initiE => />.
rewrite map2E //=  !initiE => />.
rewrite nttZero.
rewrite /Poly.zero createE initiE => />.
by  ring.
qed.

lemma innerprod_corr va vb:
  array_mont zetas_const = lift_array128 Jindcpa.jzetas =>
  hoare [ IndcpaDerand.Mderand.aux_inner_prod :
    polyvec_ntt va = lift_vector ai /\
    polyvec_ntt vb = lift_vector skpv /\
    signed_bound768_cxq ai 0 768 2 /\
    signed_bound768_cxq skpv 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = ntt (va `<*>` vb)  ].
proof.
move => zetasasp.
proc.
seq 1 : (#pre /\
    signed_bound_cxq polyi 0 256 2 /\
    lift_array256 polyi =  scale (ntt (va `<*>` vb)) (inzmod 169)
    ).
by call (polyvec_pointwise_acc_corr_alg va vb); auto => />.

ecall(poly_frommont_corr_h (map W16.to_sint polyi)).
skip => &hr.
rewrite /(`<*>`); move => /> VA VB AB BB  ???.
rewrite (Array256.tP (Array256.map W16.to_sint result)
                         (map
        (fun (x : int) =>
           (SREDC (x * (SignedReductions.R * (SignedReductions.R * SignedReductions.R ^ 0) %% q)%IntDiv))%SignedReductions)
        (map W16.to_sint polyi{hr}))).
move => rval.

split.
rewrite /signed_bound_cxq qE => k kb => />.
move : (rval k kb); rewrite !mapiE /R => />.
rewrite qE (_: 65536 ^ 0 = 1); first by smt(@Int).
rewrite (_: 65536 * (65536 * 1) %% 3329 = 1353); first smt().
move => ->.
move : (SignedReductions.SREDCp_corr (to_sint polyi{hr}.[k] * 1353) _ _); rewrite qE /R => />.
by move : (H k kb); rewrite qE => />; smt(@W16).
by  smt(@W16).

move :H0; rewrite /lift_array256 /scale.
rewrite (Array256.tP (map (fun (x : W16.t) => inzmod (to_sint x)) polyi{hr})
        (map (transpose ZModField.( * ) (inzmod 169)) (ntt (dotp va vb)))) => *.
apply Array256.ext_eq => k kb.
move : (H0 k kb).
move : (rval k kb).
rewrite !mapiE /R => /> -> *.
rewrite qE (_: 65536 ^ 0 = 1); first by smt(@Int).
rewrite (_: 65536 * (65536 * 1) %% 3329 = 1353); first smt().
move : (SignedReductions.SREDCp_corr (to_sint polyi{hr}.[k] * 1353) _ _); rewrite qE /R => />.
by move : (H k kb); rewrite qE => />; smt(@W16).
move => *.
rewrite (_: inzmod (SREDC (to_sint polyi{hr}.[k] * 1353)) = inzmod (to_sint polyi{hr}.[k] * 1353 * 169 %% 3329)); first by rewrite -H4 -qE -inzmodK asintK.
rewrite -qE -(inzmodK (to_sint polyi{hr}.[k] * 1353 * 169)) asintK  !inzmodM H1.
rewrite (_: inzmod 1353 = inzmod (R*R)); first by  rewrite /R //= -eq_inzmod; smt(qE).
rewrite inzmodM. 
rewrite ZModField.ComRing.mulrA.

rewrite (_:(ntt (dotp va vb)).[k] * inzmod 169 * inzmod R * inzmod R * inzmod 169
        =(ntt (dotp va vb)).[k] * (inzmod R * inzmod 169) * (inzmod R * inzmod 169)); first by ring.
rewrite  (_: inzmod R * inzmod 169 = ZModField.one); first by rewrite -inzmodM; smt(@ZModP RRinv).
by ring.
qed.


(* OPERATIONS OVER MATRICES *)

op lift_matrix( rows : W16.t Array768.t * W16.t Array768.t * W16.t Array768.t) : 
     matrix =
       Matrix.offunm (fun i j => 
        if i = 0
        then KyberPolyVec.lift_polyvec rows.`1 j
        else if i = 1
             then KyberPolyVec.lift_polyvec rows.`2 j
             else KyberPolyVec.lift_polyvec rows.`3 j).
