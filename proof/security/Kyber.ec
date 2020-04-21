require import AllCore Array256 IntDiv IntExtra Distr List DList.
require (****) ZModP.
require import MLWE_PKE.

op q : int = 3329 axiomatized by qE.

clone ZModP as Fq with op p <- q proof le2_p by smt(qE).

type elem = Fq.zmod.
op trueval = q %/ 2. (* Is this it? *)
op falseval = 0. (* Is this it? *)

op dshort : elem distr.
op duni : elem distr.
op pe = 1%r /q%r.


theory Poly.

type poly = elem t.

op zero : poly = create Fq.zero.
op one : poly = zero.[0<-Fq.one].

(* These are specified by the NTT_Fq 
   algorithm specifications lifted to
   lists. *)
op ntt : poly -> poly.
op invntt : poly -> poly.

(* This will specified similarly to 
   what is in KyberPoly. *)
op basemul : poly -> poly -> poly.

op ( *) (pa pb : poly) = 
  invntt (basemul (ntt pa) (ntt pb)).

print Array256.
op ( +) (pa pb : poly) : poly = 
  map2 (fun a b : elem  => Fq.(+) a b) pa pb.

op ([-]) (p : poly) : poly = 
  map Fq.([-]) p.

type message = bool t.

op m_encode(m : message) : poly =
   map (fun b => if b 
                 then Fq.inzmod trueval 
                 else Fq.inzmod falseval) m.

op m_decode(mp : poly) : message =
   map (fun c => - q%/4 <= Fq.asint c < q%/ 4) mp.

op roundc(c : elem) : elem = 
    Fq.inzmod (((Fq.asint c * 2^3 + (q %/ 2)) %/q) %% 2^3) 
      axiomatized by roundcE.

op roundc_err(c: elem) : elem = Fq.(+) (roundc c) (Fq.([-]) c).

lemma roundc_errE c: Fq.(+) c (roundc_err c) = roundc c 
      by rewrite /roundc_err; ring.

op round_poly(p : poly) : poly = 
   map roundc p.

op round_poly_err(p : poly) : poly = 
   map roundc_err p.

lemma round_poly_errE p : p + (round_poly_err p) = (round_poly p).
proof. 
rewrite /round_poly_err /round_poly /Poly.(+); apply ext_eq => /> x xl xh.
by rewrite map2iE //= mapiE //= mapiE => />; apply roundc_errE.
qed.

op dshort : poly distr = 
   dmap (dlist dshort 256) (of_list witness).

op duni : poly distr = 
   dmap (dlist duni 256) (of_list witness).

op pe = pe^256.

end Poly.

export Poly.

theory PolyVec.

op roundc(c : elem) : elem = 
    Fq.inzmod (((Fq.asint c * 2^11 + (q %/ 2)) %/q) %% 2^11) 
     axiomatized by roundcE.

op roundc_err(c: elem) : elem = Fq.(+) (roundc c) (Fq.([-]) c).

lemma roundc_errE c: Fq.(+) c (roundc_err c) = roundc c 
    by rewrite /roundc_err; ring.

op round_poly(p : poly) : poly = 
   map roundc p.

op round_poly_err(p : poly) : poly = 
   map roundc_err p.

lemma round_poly_errE p: p + (round_poly_err p) = round_poly p.
proof. 
rewrite /round_poly_err /round_poly /Poly.(+); apply ext_eq => /> x xl xh.
by rewrite map2iE //= mapiE //= mapiE => />; apply roundc_errE.
qed.
(*
op round_polyvec(pv : polyvec) : polyvec = 
   offunv (fun i => (round_poly ((tofunv pv) i))).

op round_polyvec_err(pv : polyvec) : polyvec =
   offunv (fun i => (round_poly_err ((tofunv pv) i))).

lemma round_polyvec_errE p : p `|+|` (round_polyvec_err p) = 
      round_polyvec p.
proof. 
rewrite /round_polyvec_err /round_polyvec.
apply eq_vectorP => /> i il ih.
rewrite offunvE //= offunvE //=  (offunvE _ _ _) => />.
by apply round_poly_errE.
qed.
*)
end PolyVec.

theory Kyber.

op kvec : int. 
op noise_val (p : poly) =
      foldr (fun c cc => max (Fq.asint c) cc) 
                  (Fq.asint (head witness (to_list p))) 
                                   (behead (to_list p)).

op cv_bound : int = 104. (* computed in sec estimates, must be
                            proved *)
op fail_prob : real. (* Need to compute exact value or replace
      with suitable bound *)

(*
lemma encode_noise (u : polyvec) (v : poly):
       (round_polyvec (u, v).`1, Poly.round_poly (u, v).`2) =
         ( u `|+|` (round_polyvec_err u), v + Poly.round_poly_err v) 
     by smt (round_polyvec_errE Poly.round_poly_errE).

lemma matrix_props1 (_A : polyvec2) (s e r : polyvec):
    _A `*|` s `|+|` e `|*|` r = 
         (s `|*` transpose _A `|*|` r) + (e `|*|` r).
proof.
admit.
qed.*)

(* Should the ring structure for R come from here? *)
clone import MLWE_PKE as MLWEPKE with
  type H_MLWE.M.R <- poly,
  op H_MLWE.M.ZR.zeror <- Poly.zero,
  op H_MLWE.M.ZR.(+) <- Poly.(+),
  op H_MLWE.M.ZR.([-]) <- Poly.([-]),
  op H_MLWE.M.ZR.oner <- Poly.one, 
  op H_MLWE.M.ZR.( * ) <- Poly.( *),
  op H_MLWE.M.size <- kvec,
  op H_MLWE.dshort_R <- Poly.dshort,
  op H_MLWE.duni_R <- Poly.duni,
  op H_MLWE.pe <- Poly.pe,
  type plaintext <- bool t,
  type ciphertext <- H_MLWE.M.vector * Poly.poly,
  op m_encode <- Poly.m_encode,
  op m_decode <- Poly.m_decode,
  op c_encode <- fun (c : H_MLWE.M.vector * Poly.poly) => 
          (H_MLWE.M.Vector.offunv 
             (fun i => (PolyVec.round_poly ((H_MLWE.M.Vector.tofunv c.`1) i))), 
                 Poly.round_poly c.`2),
  op c_decode <- idfun,
  op rnd_err_v <- Poly.round_poly_err,
  op rnd_err_u <- fun u => H_MLWE.M.Vector.offunv (fun i => (round_poly_err ((H_MLWE.M.Vector.tofunv u) i))),
  op noise_val <- noise_val,
  op noise_bound <- q %/ 4,
  op cv_bound <- cv_bound,
  op fail_prob <- fail_prob
  proof H_MLWE.M.ge0_size by admit
  proof H_MLWE.dshort_R_ll  by admit
  proof H_MLWE.duni_R_ll by admit
  proof H_MLWE.duni_R_fu by admit
  proof H_MLWE.duni_RE by admit
  proof H_MLWE.duni_matrixE by admit
  proof encode_noise by admit
  proof matrix_props1 by admit
  proof matrix_props2 by admit
  proof good_decode by admit
  proof cv_bound_valid by admit
  proof noise_commutes by admit.

  (* We get security but we need to prove the correctness bound to 
     obtain the final theorem. *)
section.

import H_MLWE.H_MLWE_ROM.
declare module A : CAdversary {RO}.
axiom All (O <: ARO{A}):
     islossless O.o =>
     islossless A(O).find.

lemma fail_prob &m : 
   Pr[ CorrectnessBound.main() @ &m : res] = fail_prob.
admitted.

print correctness_bound.
lemma kyber_correctness &m : 
  Pr[ AdvCorrectness(MLWE_PKE,A,RO).main() @ &m : res]  >=
  1%r - fail_prob by
   apply (correctness_bound A All fail_prob &m).
end section.

end Kyber.