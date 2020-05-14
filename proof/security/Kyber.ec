require import AllCore Array128 Array256 Array768 IntDiv IntExtra Distr List DList.
require import ZModP.
require import MLWE_PKE.

theory Kyber.

op q : int = 3329 axiomatized by qE.

clone import ZModRing with op p <- q proof ge2_p by smt(qE).

type elem = zmod.
op trueval = (q+1) %/ 2.
op falseval = 0.

op dshort_elem : elem distr.
op duni_elem : elem distr.
op pe = 1%r /q%r.

axiom dshort_elem_ll : is_lossless dshort_elem.
axiom duni_elem_ll : is_lossless duni_elem.

theory Poly.

type poly = elem Array256.t.

op zero : poly = Array256.create ZModRing.zero.
op one : poly = zero.[0<-ZModRing.one].

(* These are specified by the NTT_Fq 
   algorithm specifications lifted to
   lists. *)
op zetas : elem Array128.t.
op zetas_inv : elem Array128.t.
op ntt : poly -> poly.
op invntt : poly -> poly.

(* This will specified similarly to 
   what is in KyberPoly. *)
op basemul : poly -> poly -> poly.

op ( *) (pa pb : poly) = 
  invntt (basemul (ntt pa) (ntt pb)).

op ( +) (pa pb : poly) : poly = 
  map2 (fun a b : elem  => ZModRing.(+) a b) pa pb.

op ([-]) (p : poly) : poly = 
  map ZModRing.([-]) p.

type message = bool Array256.t.

op m_encode(m : message) : poly =
   map (fun b => if b 
                 then ZModRing.inzmod trueval 
                 else ZModRing.inzmod falseval) m.

op balasint c = if q %/ 2 < (ZModRing.asint c) 
                     then ((ZModRing.asint c) - q) 
                     else (ZModRing.asint c).


op m_decode(mp : poly) : message =
   map (fun c => ! (`| balasint c | < q%/ 4 + 1)) mp.

op roundc(c : elem) : elem = 
    ZModRing.inzmod (((ZModRing.asint c * 2^4 + (q %/ 2)) %/q) %% 2^4) 
      axiomatized by roundcE.

op roundc_err(c: elem) : elem = ZModRing.(+) (roundc c) (ZModRing.([-]) c).

lemma roundc_errE c: ZModRing.(+) c (roundc_err c) = roundc c 
      by rewrite /roundc_err; ring.

op round_poly(p : poly) : poly = 
   map roundc p.

op round_poly_err(p : poly) : poly = 
   map roundc_err p.

lemma round_poly_errE p : p + (round_poly_err p) = (round_poly p).
proof. 
rewrite /round_poly_err /round_poly /Poly.(+); apply Array256.ext_eq => /> x xl xh.
by rewrite map2iE //= mapiE //= mapiE => />; apply roundc_errE.
qed.

op dshort_R : poly distr = 
   dmap (dlist dshort_elem 256) (Array256.of_list witness).

lemma dshort_R_ll : is_lossless dshort_R
 by rewrite /dshort_R; apply dmap_ll; apply dlist_ll; apply dshort_elem_ll.

op duni_R : poly distr = 
   dmap (dlist duni_elem 256) (Array256.of_list witness).

lemma duni_R_ll : is_lossless duni_R
 by rewrite /duni_R; apply dmap_ll; apply dlist_ll; apply duni_elem_ll.

op pe_R = pe^256.

end Poly.

export Poly.

theory PolyVec.

op roundc(c : elem) : elem = 
    ZModRing.inzmod (((ZModRing.asint c * 2^10 + (q %/ 2)) %/q) %% 2^10) 
     axiomatized by roundcE.

op roundc_err(c: elem) : elem = ZModRing.(+) (roundc c) (ZModRing.([-]) c).

lemma roundc_errE c: ZModRing.(+) c (roundc_err c) = roundc c 
    by rewrite /roundc_err; ring.

op round_poly(p : poly) : poly = 
   map roundc p.

op round_poly_err(p : poly) : poly = 
   map roundc_err p.

lemma round_poly_errE p: p + (round_poly_err p) = round_poly p.
proof. 
rewrite /round_poly_err /round_poly /Poly.(+); apply Array256.ext_eq => /> x xl xh.
by rewrite map2iE //= mapiE //= mapiE => />; apply roundc_errE.
qed.


end PolyVec.

op kvec : int. 
axiom kvec_ge3 : 3 <= kvec.


op pm = pe_R^(kvec^2).

op noise_val (p : poly) : int =
       foldl (fun (cc : int) c => if `|cc| < `| balasint c|
                          then balasint c else cc) 
                              0 (to_list p).

op cv_bound : int = 104. (* computed in sec estimates, must be
                            proved *)
op fail_prob : real. (* Need to compute exact value or replace
                        with suitable bound *)

(* Should the ring structure for R come from here? *)
clone import MLWE_PKE as MLWEPKE with
  type H_MLWE.M.R <- poly,
  op H_MLWE.M.ZR.zeror <- Poly.zero,
  op H_MLWE.M.ZR.(+) <- Poly.(+),
  op H_MLWE.M.ZR.([-]) <- Poly.([-]),
  op H_MLWE.M.ZR.oner <- Poly.one, 
  op H_MLWE.M.ZR.( * ) <- Poly.( *),
  op H_MLWE.M.size <- kvec,
  op H_MLWE.dshort_R <- dshort_R,
  op H_MLWE.duni_R <- duni_R,
  op H_MLWE.pe <- pe_R,
  op H_MLWE.pm <- pm,
  type plaintext <- message,
  type ciphertext <- H_MLWE.M.vector * poly,
  op m_encode <- m_encode,
  op m_decode <- m_decode,
  op c_encode <- fun (c : H_MLWE.M.vector * poly) => 
          (H_MLWE.M.Vector.offunv 
             (fun i => (PolyVec.round_poly ((H_MLWE.M.Vector.tofunv c.`1) i))), 
                 Poly.round_poly c.`2),
  op c_decode <- idfun,
  op rnd_err_v <- Poly.round_poly_err,
  op rnd_err_u <- fun u => H_MLWE.M.Vector.offunv 
          (fun i => (PolyVec.round_poly_err ((H_MLWE.M.Vector.tofunv u) i))),
  op noise_val <- noise_val,
  op noise_bound <- q %/ 4,
  op cv_bound <- cv_bound,
  op fail_prob <- fail_prob
  proof H_MLWE.M.ge0_size by smt(kvec_ge3)
  proof H_MLWE.dshort_R_ll  by apply dshort_R_ll
  proof H_MLWE.duni_R_ll by apply duni_R_ll
  proof H_MLWE.duni_R_fu
  proof H_MLWE.duni_RE
  proof H_MLWE.duni_matrixE
  proof encode_noise 
  proof matrix_props1 by smt
  proof matrix_props2
  proof good_decode 
  proof cv_bound_valid 
  proof noise_commutes.

realize H_MLWE.duni_R_fu.
admitted.

realize H_MLWE.duni_RE.
admitted.

realize H_MLWE.duni_matrixE.
admitted.

realize encode_noise.
move => /> *.
split; last by smt.
rewrite /round_poly /round_poly_err /roundc_err  => />.
apply H_MLWE.M.Vector.eq_vectorP => /> *.
rewrite H_MLWE.M.Vector.offunvE; first by smt().
rewrite H_MLWE.M.Vector.offunvE; first by smt().
auto=> />. 
apply Array256.ext_eq => /> *.
rewrite mapiE; first by smt().
rewrite map2iE; first by smt().
rewrite mapiE; first by smt().
auto => />.
rewrite PolyVec.roundc_errE.  
by congr.
qed.

realize matrix_props2.
move => /> *.
search H_MLWE.M.Matrix.trmx.
rewrite -H_MLWE.M.Matrix.mulmxTv H_MLWE.M.Matrix.trmxK.
rewrite !H_MLWE.M.Vector.dotpDr.
ring. 
admit.
qed.

realize good_decode.
rewrite /good_noise /m_encode /m_decode /noise_val /trueval /falseval  qE  => *.
apply Array256.ext_eq => /> *.
rewrite mapiE; first by smt().
auto => />.
rewrite /Poly.(+) map2E => />. 
rewrite initiE; first by smt().
rewrite /balasint qE=> />.
rewrite ZModRing.addE  qE => />.
rewrite mapiE; first by smt().
auto => />.
have ? : -832 < (if 1664 < asint n.[x] then asint n.[x] - 3329 else asint n.[x])< 832; last first. 
case (m.[x]). move => * />. rewrite inzmodK qE => />. 
move : H.
case (1664 < asint n.[x]); smt().  
move => *. 
case (1664 < asint n.[x]); smt(@ZModRing). 
rewrite (_: n.[x] = nth witness (to_list n) x). smt(@Array256).
have?: (to_list n <> []); first by smt(@Array256).
have?: (0 <= x < size (to_list n)); first by smt(@Array256).

move :H H2 H3.
elim (to_list n).
by auto => />.
move => *.
admit.
qed. 

realize cv_bound_valid.
admitted.

realize noise_commutes.
admitted. 

section.

import H_MLWE.H_MLWE_ROM.
declare module A : CAdversary {RO}.
axiom All (O <: ARO{A}):
     islossless O.o =>
     islossless A(O).find.

lemma fail_prob &m : 
   Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob.
byphoare.
proc.
rnd.
skip.
auto => />.
rewrite /comp_distr /noise_exp_final /noise_exp_part /rdistr.
rewrite /good_noise /cv_bound /noise_val.
admitted.

print correctness_bound.
lemma kyber_correctness &m : 
  Pr[ AdvCorrectness(MLWE_PKE,A,RO).main() @ &m : res]  >=
  1%r - fail_prob by
   apply (correctness_bound A All fail_prob &m).
end section.

(* At this point we can write down some intermediate results that
   we will need to connect this theory with the implementation *)

op polyvec_ntt(v : H_MLWE.M.vector) : H_MLWE.M.vector =
   H_MLWE.M.Vector.offunv 
             (fun i => (ntt ((H_MLWE.M.Vector.tofunv v) i))).

end Kyber.