require import AllCore Array128 Array256 Array768 IntDiv Distr List DList.
require import ZModP.
require import MLWE_PKE.
pragma +oldip.

import RField.

theory Kyber.

op q : int = 3329 axiomatized by qE.
axiom prime_q : prime q.

clone import ZModField with op p <- q proof  prime_p by apply prime_q.

type elem = zmod.
op trueval = (q+1) %/ 2.
op falseval = 0.

op dshort_elem : elem distr. 

axiom supp_dshort_elem x : -2 <= (if q %/2 <= (asint x) then (asint x -q) else (asint x)) <= 2 <=> x \in dshort_elem.
axiom dshort_elem1E_2 : mu1 dshort_elem (inzmod 2) = 1%r / 16%r.
axiom dshort_elem1E_m2 : mu1 dshort_elem (inzmod (q-2)) = 1%r / 16%r.
axiom dshort_elem1E_1 : mu1 dshort_elem (inzmod 1) = 1%r / 4%r.
axiom dshort_elem1E_m1 : mu1 dshort_elem (inzmod (q-1)) = 1%r / 4%r.
axiom dshort_elem1E_0 : mu1 dshort_elem (inzmod (0)) = 3%r / 8%r. 

axiom dshort_elem_ll : is_lossless dshort_elem.

op duni_elem : elem distr.
op pe = 1%r /q%r.

axiom supp_duni_elem x : 0 <= asint x < q <=> x \in duni_elem.
axiom duni_elem1E x : mu1 duni_elem x = pe.

axiom duni_elem_ll : is_lossless duni_elem.


(***********************************************)

theory Poly.

(***********************BEGIN CUT*****************************)
(* All these definitions should come from a polynomial theory *)

type poly = elem Array256.t.

op zero : poly = Array256.create ZModField.zero.
op one : poly = zero.[0<-ZModField.one].

op ( * ) (pa pb : poly) : poly =
  Array256.init (fun (i : int) => foldr (fun (k : int) (ci : elem) =>
     if (0 <= i - k) 
     then ci + pa.[k] * pb.[i - k] 
     else ci - pa.[k] * pb.[256 - (i - k)]) 
      ZModField.zero (iota_ 0 256)).

op ( +) (pa pb : poly) : poly = 
  map2 (fun a b : elem  => ZModField.(+) a b) pa pb.

op ([-]) (p : poly) : poly = 
  map ZModField.([-]) p.

(***********************END CUT*****************************)

type message = bool Array256.t.

op m_encode(m : message) : poly =
   map (fun b => if b 
                 then ZModField.inzmod trueval 
                 else ZModField.inzmod falseval) m.

op balasint c = if q %/ 2 < (ZModField.asint c) 
                     then ((ZModField.asint c) - q) 
                     else (ZModField.asint c).

op s_decode(c: zmod) : bool = ! `|balasint c| < q %/ 4 + 1.

op m_decode(mp : poly) : message =
   map (fun c => ! (`| balasint c | < q%/ 4 + 1)) mp.

op roundc(c : elem) : elem = 
    ZModField.inzmod (((ZModField.asint c * 2^4 + (q %/ 2)) %/q) %% 2^4) 
      axiomatized by roundcE.

op unroundc(c : elem) : elem = 
    ZModField.inzmod (((ZModField.asint c * q + 8) %/ 2^4)) 
      axiomatized by unroundcE.

op roundc_err(c: elem) : elem = ZModField.(+) (unroundc (roundc c)) (ZModField.([-]) c).

lemma roundc_errE c: ZModField.(+) c (roundc_err c) = unroundc (roundc c)
      by rewrite /roundc_err; ring.

op round_poly(p : poly) : poly = 
   map roundc p.

op unround_poly(p : poly) : poly = 
   map unroundc p.

op round_poly_err(p : poly) : poly = 
   map roundc_err p.

lemma round_poly_errE p : p + (round_poly_err p) = unround_poly (round_poly p).
proof. 
rewrite /round_poly_err /round_poly /Poly.(+); apply Array256.ext_eq => /> x xl xh.
rewrite map2iE //= mapiE //= !mapiE // /roundc_err. by ring.
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
    ZModField.inzmod (((ZModField.asint c * 2^10 + (q %/ 2)) %/q) %% 2^10) 
     axiomatized by roundcE.

op unroundc(c : elem) : elem =
    ZModField.inzmod (((ZModField.asint c * q + 512) %/ 2^10)) 
      axiomatized by unroundcE.

op roundc_err(c: elem) : elem = ZModField.(+) (unroundc (roundc c)) (ZModField.([-]) c).

lemma roundc_errE c: ZModField.(+) c (roundc_err c) = unroundc (roundc c)
    by rewrite /roundc_err; ring.

op round_poly(p : poly) : poly = 
   map roundc p.

op unround_poly(p : poly) : poly = 
   map unroundc p.

op round_poly_err(p : poly) : poly = 
   map roundc_err p.

lemma round_poly_errE p: p + (round_poly_err p) = unround_poly (round_poly p).
proof. 
rewrite /round_poly_err /round_poly /Poly.(+); apply Array256.ext_eq => /> x xl xh.
rewrite map2iE //= mapiE //= !mapiE /roundc_err /= => />. by ring. 
qed.


end PolyVec.

op kvec : int. 
axiom kvec_ge3 : 3 <= kvec.


op pv = pe_R^(kvec).
op pm = pe_R^(kvec^2).

op under_noise_bound (p : poly) (b : int) =
     all (fun cc => `| balasint cc| < b) p.

op cv_bound : int = 104. (* computed in sec estimates, must be
                            proved *)
op fail_prob : real. (* Need to compute exact value or replace
                        with suitable bound *)

op epsilon_hack : real. (* Assumed simplification loss *)

import H_MLWE.
import Matrix_.
import Vector.

(* auxiliary lemma *)
lemma foldr_eq_size (f : 'b -> 'b -> 'b) (s s' : 'a list) c z :
  size s = size s' =>
  foldr (fun (x : 'a) (y : 'b) => f c y) z s = foldr (fun (x : 'a) (y : 'b) => f c y) z s'.
proof.
  elim: s s' => /= s. 
    by rewrite (_ : 0 = size s <=> size s = 0) 1:/#; rewrite size_eq0 => -> /=.
  move => /> hind s'.
  elim s' => /=; first by smt(size_ge0).
  by move => s' hind' hsize /#.
qed.

(* Should the ring structure for R come from here? *)
clone import MLWE_PKE as MLWEPKE with
  type H_MLWE.R <- poly,
  op H_MLWE.R.zeror <- Poly.zero,
  op H_MLWE.R.(+) <- Poly.(+),
  op H_MLWE.R.([-]) <- Poly.([-]),
  op H_MLWE.R.oner <- Poly.one, 
  op H_MLWE.R.( * ) <- Poly.( *),
  op H_MLWE.Matrix_.size <- kvec,
  op H_MLWE.dshort_R <- Kyber.Poly.dshort_R,
  op H_MLWE.duni_R <- Kyber.Poly.duni_R,
  type plaintext = message,
  type ciphertext = H_MLWE.Matrix_.vector * poly,
  op m_encode <- m_encode,
  op m_decode <- m_decode,
  op c_encode = fun (c : H_MLWE.Matrix_.vector * poly) => 
          (H_MLWE.Matrix_.Vector.offunv 
             (fun i => (PolyVec.round_poly ((H_MLWE.Matrix_.Vector.tofunv c.`1) i))), 
                 Poly.round_poly c.`2),
  op c_decode = fun (c : H_MLWE.Matrix_.vector * poly) => 
          (H_MLWE.Matrix_.Vector.offunv 
             (fun i => (PolyVec.unround_poly ((H_MLWE.Matrix_.Vector.tofunv c.`1) i))), 
                 Poly.unround_poly c.`2),
  op rnd_err_v <- Poly.round_poly_err,
  op rnd_err_u <- fun u => H_MLWE.Matrix_.Vector.offunv 
          (fun i => (PolyVec.round_poly_err ((H_MLWE.Matrix_.Vector.tofunv u) i))),
  op under_noise_bound <- under_noise_bound,
  op max_noise <- q %/ 4,
  op cv_bound <- cv_bound,
  op fail_prob <- fail_prob,
  op epsilon_hack <- epsilon_hack
  proof H_MLWE.dshort_R_ll  by apply Kyber.Poly.dshort_R_ll
  proof H_MLWE.duni_R_ll by apply Kyber.Poly.duni_R_ll
  proof H_MLWE.Matrix_.ge0_size by smt(kvec_ge3)
  proof H_MLWE.duni_R_fu
  proof encode_noise
  proof good_decode
  proof cv_bound_valid
  proof noise_commutes.
  (* proof* a lot of unproved axioms coming from ring theories *)

realize H_MLWE.duni_R_fu.
proof.
  rewrite /is_full /Poly.duni_R => p.
  rewrite supp_dmap; exists (Array256.to_list p).
  split.
    rewrite supp_dlist //; split; first by rewrite size_to_list.
    rewrite allP => *. 
    by rewrite -supp_duni_elem 1:smt(@ZModField).
    by rewrite Array256.to_listK.
qed.


realize encode_noise.
move => /> *.
rewrite /c_decode /c_encode => />.
split; last  by rewrite round_poly_errE.
rewrite /round_poly /round_poly_err /roundc_err  => />.
apply H_MLWE.Matrix_.Vector.eq_vectorP => /> *.
rewrite H_MLWE.Matrix_.Vector.offunvE 1:/# H_MLWE.Matrix_.Vector.offunvE 1:/# /=.
apply Array256.ext_eq => /> *.
rewrite mapiE 1:// map2iE 1:// mapiE 1:// /= PolyVec.roundc_errE.  
congr => />.
smt.
qed.

realize good_decode.
rewrite /under_noise_bound /m_encode /m_decode /trueval /falseval  qE  => m n hgood.
apply Array256.ext_eq => /> x h0x hx256.
rewrite mapiE; first by smt().
auto => />.
rewrite /Poly.(+) map2E => />. 
rewrite initiE; first by smt().
rewrite /balasint qE=> />.
rewrite ZModField.addE  qE => />.
rewrite mapiE /=; first by smt().
have ? : -832 < (if 1664 < asint n.[x] then asint n.[x] - 3329 else asint n.[x])< 832; last first. 
+ case (m.[x]). move => * />. rewrite inzmodK qE => />. 
  move : H.
  case (1664 < asint n.[x]); smt().  
  by move => *; case (1664 < asint n.[x]); smt(@ZModField). 
pose F := fun (cc : int) (c : zmod) => if `|cc| < `|balasint c| then balasint c else cc.
move: hgood; rewrite allP  => *.
move : (H x _) => //=.
rewrite /balasint qE /#.
qed.

realize cv_bound_valid.
admitted. (* We need concrete distributions *)

realize noise_commutes.
move => n n' b *.
move : H H0; rewrite /under_noise_bound.
rewrite !allP.
move => Hn Hnp i ib.
move : (Hn i ib). 
move : (Hnp i ib) => /=. 
rewrite /balasint /Poly.(+) /= map2E !initiE //= addE qE /=  !StdOrder.IntOrder.ltr_norml /= => Hni Hnpi.
by smt().
qed.

section.

import H_MLWE.H_MLWE_ROM Lazy.
declare module A : CAdversary {LRO}.
axiom All (O <: POracle{A}):
     islossless O.o =>
     islossless A(O).find.

(* This is an assumption on what loss there could be wrt 
   correctness because we consider rounding of uniform 
   and independent coefficients *)
axiom correctness_hack &m :
  `| Pr[CorrectnessNoiseApprox.main() @ &m : res] - 
     Pr[CorrectnessBound.main() @ &m : res] | <= epsilon_hack.

(* This is the  exact bound one gets assuming the rounding
   of uniform and independent coefficients *)
lemma fail_prob &m : 
   Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob.
byphoare.
proc.
auto => />.
rewrite /comp_distr /noise_exp_final /noise_exp_part /rdistr.
rewrite /good_noise /cv_bound /noise_val.
admitted. (* We need concrete distributions *)

lemma kyber_correctness &m : 
 Pr[ AdvCorrectness(MLWE_PKE,A,LRO).main() @ &m : res]  >=
  1%r - fail_prob - epsilon_hack
  by  apply (correctness_bound A All correctness_hack fail_prob &m).
end section.


end Kyber.
