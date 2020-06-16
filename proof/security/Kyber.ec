require import AllCore Array128 Array256 Array768 IntDiv IntExtra Distr List DList Real RealExp RealExtra.
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

(* Concrete distributions *)
axiom supp_dshort_elem x : -2 <= (if q %/2 <= (asint x) then (asint x -q) else (asint x)) <= 2 <=> x \in dshort_elem.
axiom dshort_elem1E_2 : mu1 duni_elem (inzmod 2) = 1%r / 16%r.
axiom dshort_elem1E_m2 : mu1 duni_elem (inzmod (q-2)) = 1%r / 16%r.
axiom dshort_elem1E_1 : mu1 duni_elem (inzmod 1) = 1%r / 4%r.
axiom dshort_elem1E_m1 : mu1 duni_elem (inzmod (q-1)) = 1%r / 4%r.
axiom dshort_elem1E_0 : mu1 duni_elem (inzmod (0)) = 3%r / 8%r.

axiom supp_duni_elem x : 0 <= asint x < q <=> x \in duni_elem.
axiom duni_elem1E x : mu1 duni_elem x = pe.

axiom dshort_elem_ll : is_lossless dshort_elem.
axiom duni_elem_ll : is_lossless duni_elem.
(***********************************************)

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

(* This is specified similarly to 
   what is in KyberPoly, but should come
   from polynomial theory somehow *)

op cmplx_mul (a :zmod * zmod, b : zmod * zmod, zzeta : zmod) =
     (a.`2 * b.`2 * zzeta + a.`1*b.`1, 
      a.`1 * b.`2 + a.`2 * b.`1).

op dcmplx_mul(a1 : zmod * zmod, b1 : zmod * zmod, 
              a2 : zmod * zmod, b2 : zmod * zmod, zzeta : zmod) = 
     (cmplx_mul a1 b1 zzeta, cmplx_mul a2 b2 (-zzeta)).

op basemul : poly -> poly -> poly.

axiom basemul_sem (ap bp rs: poly) :
   rs = basemul ap bp <=> 
   forall k, 0 <= k < 64 =>
     ((rs.[4*k],rs.[4*k+1]),(rs.[4*k+2],rs.[4*k+3])) =
         (dcmplx_mul (ap.[4*k],ap.[4*k+1]) (bp.[4*k],bp.[4*k+1])
                    (ap.[4*k+2],ap.[4*k+3]) (bp.[4*k+2],bp.[4*k+3]) (zetas.[k+64])).

op ( *) (pa pb : poly) : poly =
  Array256.init (fun (i : int) => foldr (fun (k : int) (ci : elem) =>
     if (0 <= i - k) 
     then ci + pa.[k] * pb.[i - k] 
     else ci - pa.[k] * pb.[256 - (i - k)]) 
      ZModRing.zero (iota_ 0 256)).

op scale(p : poly, c : elem) : poly = 
  Array256.map (fun x => x * c) p.

(* This should be proved in polynomial theory *)
axiom mul_sem (pa pb : poly) (c : elem) : 
  invntt (scale (basemul (ntt pa) (ntt pb)) c) = 
   scale (pa * pb) c.

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

import H_MLWE.
import M.
import Matrix.
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
  type H_MLWE.M.R <- poly,
  op H_MLWE.M.ZR.zeror <- Poly.zero,
  op H_MLWE.M.ZR.(+) <- Poly.(+),
  op H_MLWE.M.ZR.([-]) <- Poly.([-]),
  op H_MLWE.M.ZR.oner <- Poly.one, 
  op H_MLWE.M.ZR.( * ) <- Poly.( *),
  op H_MLWE.M.size <- kvec,
  op H_MLWE.dshort_R <- Kyber.Poly.dshort_R,
  op H_MLWE.duni_R <- Kyber.Poly.duni_R,
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
  op c_decode <- idfun, (* FIXME : change to put back bits *)
  op rnd_err_v <- Poly.round_poly_err,
  op rnd_err_u <- fun u => H_MLWE.M.Vector.offunv 
          (fun i => (PolyVec.round_poly_err ((H_MLWE.M.Vector.tofunv u) i))),
  op noise_val <- noise_val,
  op noise_bound <- q %/ 4,
  op cv_bound <- cv_bound,
  op fail_prob <- fail_prob
  proof H_MLWE.M.ge0_size by smt(kvec_ge3)
  proof H_MLWE.dshort_R_ll  by apply Kyber.Poly.dshort_R_ll
  proof H_MLWE.duni_R_ll by apply Kyber.Poly.duni_R_ll
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
proof.
  rewrite /is_full /Poly.duni_R => p.
  rewrite supp_dmap; exists (Array256.to_list p).
  split.
    rewrite supp_dlist //; split; first by rewrite size_to_list.
    rewrite allP => *. 
    by rewrite -supp_duni_elem 1:smt(@ZModRing).
    by rewrite Array256.to_listK.
qed.

realize H_MLWE.duni_RE.
proof.
  rewrite /Poly.duni_R /pe_R  /Kyber.pe => p.
  rewrite (dmap1E_can _ _ (Array256.to_list) _); first by by rewrite Array256.to_listK.
    by move => a; rewrite supp_dlist // => /> *; rewrite of_listK.
  rewrite dlist1E //.
  cut ->: 256 = size (to_list p) by rewrite size_to_list.
  rewrite /StdBigop.Bigreal.BRM.big filter_predT /=.
  elim (to_list p) => /=; first by rewrite powr0 1:/#.
  move => x l hind /=.
    by rewrite hind duni_elem1E /pe addzC powrS; first by smt(size_ge0).
qed.



realize H_MLWE.duni_matrixE.
proof.
  rewrite /H_MLWE.duni_matrix => m.
  rewrite M.Matrix.dmatrix1E /StdBigop.Bigreal.BRM.big /StdBigop.Bigreal.BRM.big filter_predT !foldr_map /=.
  cut ->: (fun (x : int) (z : real) => foldr Real.( * ) 1%r 
            (map (fun (j : int) => mu1 Poly.duni_R (M.Matrix."_.[_]" m (x, j))) (range 0 kvec)) * z) =
          (fun (x : int) => Real.( * ) (foldr (fun (x0 : int) (z : real) => (1%r / q%r)^256 * z) 
            1%r (range 0 kvec))).
    rewrite fun_ext /(==) => x.
    rewrite foldr_map => /=.
    congr. congr.
    rewrite fun_ext /(==) => y.
    by rewrite H_MLWE.duni_RE /pe_R /pe.
  rewrite /pm /pe_R /pe /=.
  have aux : forall (x : real) (y : int), 0 <= y => 
              (foldr (fun (_ : int) (z : real) => x * z) 1%r (range 0 y)) = x ^ y.
    move => x y; elim y.
    by rewrite range_geq //= ; rewrite powr0 /#.
    move => j *; rewrite range_ltn 1:/# /= powrS // -H0.
    have mulrC : forall (x y : real), x * y = y * x by smt(). (* how to use lemma?? *)
    rewrite mulrC; congr.
    by rewrite (foldr_eq_size (Real.( * )) (range 1 (j + 1)) (range 0 j) _ _);
      first by rewrite !size_range.
  cut ->: (foldr (fun (_ : int) (z : real) => inv q%r ^ 256 * z) 1%r (range 0 kvec)) = inv q%r ^ 256 ^ kvec
    by rewrite aux; first by smt(kvec_ge3).
  cut ->: foldr (fun (_ : int) => ( * ) (inv q%r ^ 256 ^ kvec)) 1%r (range 0 kvec) = 
            foldr (fun (_ : int) (z : real) => (inv q%r ^ 256 ^ kvec) * z) 1%r (range 0 kvec) by smt().
  rewrite aux; first by smt(kvec_ge3). 
  pose a := inv q%r ^ 256.
  rewrite (_: a^kvec = a^(kvec%r)). smt.
  rewrite (_: a^(kvec%r)^kvec = a^(kvec%r)^(kvec%r)). smt.
  rewrite (_: a^(kvec*kvec) = a^(kvec%r*kvec%r)). smt.
  rewrite (rpowM (inv q%r ^ 256)). smt. done.
qed.

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
(*move => /> *.
search H_MLWE.M.Matrix.trmx.
rewrite -H_MLWE.M.Matrix.mulmxTv H_MLWE.M.Matrix.trmxK.
rewrite !H_MLWE.M.Vector.dotpDr.
ring. 
rewrite (H_MLWE.M.Matrix.mulmxTv _A r).
rewrite (H_MLWE.M.Vector.dotpC s _).
rewrite (H_MLWE.M.Vector.dotpC _ r).
rewrite (H_MLWE.M.Vector.dotpC _ s) - H_MLWE.M.Matrix.dotp_mulmxv ( H_MLWE.M.Vector.dotpC r). by ring.
qed.*)
admitted.

realize good_decode.
rewrite /good_noise /m_encode /m_decode /noise_val /trueval /falseval  qE  => m n hgood.
apply Array256.ext_eq => /> x h0x hx256.
rewrite mapiE; first by smt().
auto => />.
rewrite /Poly.(+) map2E => />. 
rewrite initiE; first by smt().
rewrite /balasint qE=> />.
rewrite ZModRing.addE  qE => />.
rewrite mapiE; first by smt().
auto => />.
have ? : -832 < (if 1664 < asint n.[x] then asint n.[x] - 3329 else asint n.[x])< 832; last first. 
+ case (m.[x]). move => * />. rewrite inzmodK qE => />. 
  move : H.
  case (1664 < asint n.[x]); smt().  
  by move => *; case (1664 < asint n.[x]); smt(@ZModRing). 
pose F := fun (cc : int) (c : zmod) => if `|cc| < `|balasint c| then balasint c else cc.
have hgen: 
  forall c0, `|foldl F c0 (to_list n)| < 832 => `|c0| < 832 /\ forall x, x \in (to_list n) => `|balasint x| < 832.
+ move=> {x h0x hx256 hgood}.
  elim: (to_list n) => [ | c tl ih] //= c0 /ih /#.  
have [_ h]:= hgen 0 _; 1: smt().
have := h n.[x] _.
+ by rewrite -Array256.get_to_list; apply: mem_nth; rewrite Array256.size_to_list.
rewrite /balasint qE /= /#.
qed.

realize cv_bound_valid.
admitted. (* We need concrete distriburtions *)

realize noise_commutes.
move => n n' b *.
move : H H0; rewrite /noise_val /good_noise.
pose F := fun (cc : int) (c : zmod) => if `|cc| < `|balasint c| then balasint c else cc.
move  => *.
(* one *)
have hgenn: 
  forall c0, `|foldl F c0 (to_list n)| < q %/ 4 - b => `|c0| < q %/ 4 - b /\ forall x, x \in (to_list n) => `|balasint x| < q %/ 4 - b.
  elim: (to_list n) => [ | c tl ih] //= c0 /ih /#.  
(* another *)
have hgenn': 
  forall c0, `|foldl F c0 (to_list n')| < b => `|c0| < b /\ forall x, x \in (to_list n') => `|balasint x| < b.
  elim: (to_list n') => [ | c tl ih] //= c0 /ih /#.  
(* both *)
move : (hgenn 0 _); first by smt(). move => [#] *.
move : (hgenn' 0 _); first by smt(). move => [#] *.
have ? : `|foldl F 0 (to_list (Poly.(+) n n'))| < q%/4; last by smt().
have ?:  forall x, x \in (to_list (Poly.(+) n n')) => `|balasint x| < q %/4; last first.
rewrite /Poly.(+).
rewrite map2E => />.
admit.
admit.
qed.

section.

import H_MLWE.H_MLWE_ROM Lazy.
declare module A : CAdversary {LRO}.
axiom All (O <: POracle{A}):
     islossless O.o =>
     islossless A(O).find.

lemma fail_prob &m : 
   Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob.
byphoare.
proc.

print comp_distr.
rnd.
skip.
auto => />.
rewrite /comp_distr /noise_exp_final /noise_exp_part /rdistr.
rewrite /good_noise /cv_bound /noise_val.
admitted. (* We need concrete distributions *)

print correctness_bound.
lemma kyber_correctness &m : 
  Pr[ AdvCorrectness(MLWE_PKE,A,LRO).main() @ &m : res]  >=
  1%r - fail_prob by
   apply (correctness_bound A All fail_prob &m).
end section.

(* At this point we can write down some intermediate results that
   we will need to connect this theory with the implementation *)

op polyvec_ntt(v : H_MLWE.M.vector) : H_MLWE.M.vector =
   H_MLWE.M.Vector.offunv 
             (fun i => (ntt ((H_MLWE.M.Vector.tofunv v) i))).

end Kyber.
