require import AllCore Array256 IntDiv IntExtra Distr List DList.
require (****) Bigop ZModP Matrix.
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
    Fq.inzmod (((Fq.asint c * 2^3 + (q %/ 2)) %/q) %% 2^3) axiomatized by roundcE.

op roundc_err(c: elem) : elem = Fq.(+) (roundc c) (Fq.([-]) c).

lemma roundc_errE c: Fq.(+) c (roundc_err c) = roundc c by rewrite /roundc_err; ring.

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

op kvec : int.

clone import Matrix as M with
  type R <- poly,
  op ZR.zeror <- Poly.zero,
  op ZR.(+) <- Poly.(+),
  op ZR.([-]) <- Poly.([-]),
  op ZR.oner <- Poly.one, 
  op ZR.( * ) <- Poly.( *),
  op size <- kvec.

theory PolyVec.

(* column vectors *)
type polyvec = vector.
print Vector.
op (`|*|`) = dotp.
op (`|+|`)  = Vector.(+).

type polyvec2 = matrix.

print Matrix.

op (`*|`) (pv2 : polyvec2, p : polyvec) : polyvec. (* TO DO *)

op transpose(pv2 : polyvec2) : polyvec2 = trmx pv2.

op (`|*`) (p : polyvec, pv2 : polyvec2) : polyvec. (* TO DO *)

op roundc(c : elem) : elem = 
    Fq.inzmod (((Fq.asint c * 2^11 + (q %/ 2)) %/q) %% 2^11) axiomatized by roundcE.

op roundc_err(c: elem) : elem = Fq.(+) (roundc c) (Fq.([-]) c).

lemma roundc_errE c: Fq.(+) c (roundc_err c) = roundc c by rewrite /roundc_err; ring.

op round_poly(p : poly) : poly = 
   map roundc p.

op round_poly_err(p : poly) : poly = 
   map roundc_err p.

lemma round_poly_errE p: p + (round_poly_err p) = round_poly p.
proof. 
rewrite /round_poly_err /round_poly /Poly.(+); apply ext_eq => /> x xl xh.
by rewrite map2iE //= mapiE //= mapiE => />; apply roundc_errE.
qed.

op round_polyvec(pv : polyvec) : polyvec
   (* TO DO  =  mx_map round_poly pv *).

op round_polyvec_err(pv : polyvec) : polyvec
   (*  = mx_map round_poly_err pv*).

lemma round_polyvec_errE p : p `|+|` (round_polyvec_err p) = round_polyvec p.
admitted.
(* 
proof. 
rewrite /round_polyvec_err /round_polyvec /(`|+|`).
admit.
qed.
*)

op dshort : polyvec distr (* = 
   dmap  Poly.dshort (fun p => oget (Supp.insub (mkprematrix kvec 1 (fun _ => p)))) *).


op duni : polyvec distr (* = 
   dmap  Poly.duni (fun p => oget (Supp.insub (mkprematrix kvec 1 (fun _ => p)))) *).

end PolyVec.

export PolyVec.

theory Kyber.

op noise_val (p : poly) = foldr 
                           (fun c cc => max (Fq.asint c) cc) 
                                      (Fq.asint (head witness p)) 
                                      (behead p).
op cv_bound : int = 104. (* computed in sec estimates, must be
                            proved *)
op fail_prob : real. (* Need to compute exact value or replace
      with suitable bound *)


lemma encode_noise (u : polyvec) (v : poly):
       (round_polyvec (u, v).`1, Poly.round_poly (u, v).`2) =
         ( u `|+|` (round_polyvec_err u), v + Poly.round_poly_err v) 
     by smt (round_polyvec_errE Poly.round_poly_errE).


axiom m_to_pv2K :
  cancel  m_to_pv2 pv2_to_m.

axiom m_to_pv2_size (m : matrix):
  is_polyvec2 (m_to_pv2 m).

lemma matrix_props1 (_A : matrix) (s e r : polyvec):
    _A `*|` s `|+|` e `|*|` r = 
         (s `|*` transpose _A `|*|` r) + (e `|*|` r).
proof.
rewrite /(`|*`).
rewrite transposeK. admit.
admit.
qed.

clone import MLWE_PKE with
   type H_MLWE.matrix <- PolyVec.matrix,
   type H_MLWE.c_vector <- PolyVec.polyvec,
   type H_MLWE.r_vector <- PolyVec.polyvec,
   type H_MLWE.elem <- Poly.poly,
   op H_MLWE.Elem.zeror <- Poly.zero,
   op H_MLWE.Elem.(+) <- Poly.(+),
   op H_MLWE.Elem.([-]) <- Poly.([-]),
   (* MULTIPLICATION IS ABSTRACT AS ALL IS HIDDEN BY NTT AND BASEMUL *)
   (* ENCODINGS TO AND FROM BYTES WILL BE ADDED ONLY AS
      MAPPINGS BETWEEN THIS SPECIFICATION SEMANTICS AND 
      THE IMPLEMENTATIONS *)
   (* BYTE STRING SEEDS ARE KEPT AS ABSTRACT TYPES, AS
      ARE ALL HASHING-RELATED FUNCTIONS *)
   op H_MLWE.m_transpose <- PolyVec.transpose,
   op H_MLWE.v_transpose <- idfun,
   op H_MLWE.(`|*|`)  <- PolyVec.(`|*|`),
   op H_MLWE.(`|+|`)  <- PolyVec.(`|+|`),
   op H_MLWE.( `*|`)  <- PolyVec.( `*|`),
   op H_MLWE.(`|*` )  <- PolyVec.(`|*` ),
   op H_MLWE.dshort <- PolyVec.dshort,
   op H_MLWE.duni <- PolyVec.duni,
   op H_MLWE.duni_elem <- Poly.duni,
   op H_MLWE.dshort_elem <- Poly.dshort,
   op H_MLWE.pe <- Poly.pe,
   type plaintext <- bool list,
   type ciphertext <- PolyVec.polyvec * Poly.poly,
   op m_encode <- Poly.m_encode,
   op m_decode <- Poly.m_decode,
   op c_encode <- fun (c : PolyVec.polyvec * Poly.poly) => 
            (PolyVec.round_polyvec c.`1, Poly.round_poly c.`2),
   op c_decode <- idfun,
   op rnd_err_v <- Poly.round_poly_err,
   op rnd_err_u <- PolyVec.round_polyvec_err,
   op noise_val <- noise_val,
   op noise_bound <- q %/ 4,
   op cv_bound <- cv_bound
   proof encode_noise by apply encode_noise
   proof matrix_props1 by apply matrix_props1
   proof matrix_props2 by admit
   proof good_decode by admit
   proof cv_bound_valid by admit
   proof noise_commutes by admit
   (* proof fail_prob this is the proof goal for correctness *).


end Kyber.