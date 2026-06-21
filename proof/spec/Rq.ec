require import AllCore.
require import IntDiv.
require import List.
require import Ring.

from JazzEC require import Array256.

require import GFq.
import Zq.

(******************************************************)
(* Representations of polynomials in Zq[X]/(X^256+1)  *)
(* We use an array representation for both Rq and ntt *)
(* domain.                                            *)
(******************************************************)

type poly = coeff Array256.t.

op zero : poly = Array256.create Zq.zero.
op one : poly = zero.[0<-Zq.one].

(* Ring multiplication: schoolbook multiplication in this
ring is essentially generating a square matrix of coefficient
multiplications and summing over the columns. *)
op (&*) (pa pb : poly) : poly =
  Array256.init (fun (i : int) => foldr (fun (k : int) (ci : coeff) =>
  if (0 <= i - k) 
  then ci + pa.[k] * pb.[i - k] 
  else ci - pa.[k] * pb.[256 + (i - k)]) 
  Zq.zero (iota_ 0 256)).

op (&+) (pa pb : poly) : poly = 
  map2 (fun a b : coeff  => Zq.(+) a b) pa pb.

op (&-) (p : poly) : poly =  map Zq.([-]) p.

(* Compression/decompression of polys *)

op compress_poly(d : int, p : poly) : int Array256.t =  map (Compress d) p.

op decompress_poly(d : int, p : int Array256.t) : poly =  map (Decompress d) p.


(**************************************************)
(**************************************************)

(* The NTT operation over ring elements *)

require (****) Bigalg.
clone import Bigalg.BigComRing as BigDom with
type  CR.t     <- coeff,
op  CR.zeror <- Zq.zero,
op  CR.oner  <- Zq.one,
op  CR.(+)   <- Zq.(+),
op  CR.([-]) <- Zq.([-]),
op  CR.( * ) <- Zq.( * ),
op  CR.invr  <- Zq.inv,
op  CR.ofint <- ZqRing.ofint,
pred  CR.unit  <- Zq.unit
proof *.

realize CR.addrA     by apply ZqRing.addrA.
realize CR.addrC     by apply ZqRing.addrC.
realize CR.add0r     by apply ZqRing.add0r.
realize CR.addNr     by apply ZqRing.addNr.
realize CR.oner_neq0 by apply ZqRing.oner_neq0.
realize CR.mulrA     by apply ZqRing.mulrA.
realize CR.mulrC     by apply ZqRing.mulrC.
realize CR.mul1r     by apply ZqRing.mul1r.
realize CR.mulrDl    by apply ZqRing.mulrDl.
realize CR.mulVr     by apply ZqRing.mulVr.
realize CR.unitP     by apply ZqRing.unitP.
realize CR.unitout   by apply ZqRing.unitout.

op zroot = incoeff 17.

op br = BitEncoding.BitReverse.bsrev 7.

op ntt(p : poly) = Array256.init (fun i => 
  if i %% 2  = 0
  then let ii = i %/ 2 in BAdd.bigi predT (fun j => p.[2*j]   * ZqRing.exp zroot ((2 * br ii + 1) * j)) 0 128
  else let ii = i %/ 2 in BAdd.bigi predT (fun j => p.[2*j+1] * ZqRing.exp zroot ((2 * br ii + 1) * j)) 0 128) axiomatized by nttE.


op invntt(p : poly) = Array256.init (fun i => 
  if i %% 2  = 0 
  then let ii = i %/ 2 in BAdd.bigi predT (fun j => inv (incoeff 128) * p.[2*j]   * ZqRing.exp zroot (-((2 * br j + 1) * ii))) 0 128
  else let ii = i %/ 2 in BAdd.bigi predT (fun j => inv (incoeff 128) * p.[2*j+1] * ZqRing.exp zroot (-((2 * br j + 1) * ii))) 0 128) axiomatized by invnttE.

(* This is multiplication of two degree-1 polynomials in coeff modulo X^2 - zroot.
  
  (a1 + a2 X) * (b1 + b2 X) mod (X^2 - zroot) = (a2b2zroot + a1b1) + (a1b2 + a2b1)X 

  and its extension to two products, one over   (X^2 - zroot) and another one over (X^2 + zroot) 
  *)
op cmplx_mul (a :coeff * coeff, b : coeff * coeff, zzeta : coeff) : coeff * coeff =
(a.`2 * b.`2 * zzeta + a.`1*b.`1, a.`1 * b.`2 + a.`2 * b.`1).

(* The base multiplication in the NTT domain is defined in the spec as follows. *)

op basemul(a b : poly) :  poly = Array256.init (fun i =>
  if i %% 2  = 0 
  then let ii = i %/ 2     in 
  (cmplx_mul (a.[2*ii],a.[2*ii+1]) (b.[2*ii],b.[2*ii+1]) (ZqRing.exp zroot ((2 * br ii + 1)))).`1
  else let ii = i %/ 2 in 
  (cmplx_mul (a.[2*ii],a.[2*ii+1]) (b.[2*ii],b.[2*ii+1]) (ZqRing.exp zroot ((2 * br ii + 1)))).`2).


(* ------------------------------------------------------------------ *)
(* Algebraic poly-ring bridge: poly = coeff Array256.t viewed as the
   PolyReduce ring Zq[X]/(X^256+1) (AlgR), with poly2polyr/polyr2poly
   conversions and the lift lemmas. Relocated here (was in Correctness768)
   so the algebraic Matrix clone in VecMat can sit at the top of the
   type hierarchy, mirroring formosa-mldsa. *)
(* ------------------------------------------------------------------ *)

require import PolyReduce. 
clone import PolyReduce as RqTheory with
   op n <- 256,
   type coeff <- coeff,
   op Coeff.(+) <- Zq.(+),
   op Coeff.( *) <- Zq.( *),
   op Coeff.zeror <- Zq.zero,
   op Coeff.oner <- Zq.one,
   op Coeff.([-]) <- Zq.([-]),
   op Coeff.invr <- Zq.inv,
   pred Coeff.unit <- Zq.unit
   rename "polyXnD1" as "AlgR"
   rename "poly" as "basepoly"
   proof Coeff.addrA by apply ZqRing.addrA
   proof Coeff.addrC by apply ZqRing.addrC
   proof Coeff.add0r by apply ZqRing.add0r 
   proof Coeff.addNr by apply ZqRing.addNr 
   proof Coeff.oner_neq0 by apply ZqRing.oner_neq0
   proof Coeff.mulrA by apply ZqRing.mulrA
   proof Coeff.mulrC by apply ZqRing.mulrC 
   proof Coeff.mul1r by apply ZqRing.mul1r 
   proof Coeff.mulrDl by apply ZqRing.mulrDl 
   proof Coeff.mulVr by apply ZqRing.mulVr
   proof Coeff.unitP by apply ZqRing.unitP 
   proof Coeff.unitout by apply ZqRing.unitout
   proof gt0_n by auto.
   (* proof *. fix me *)

op poly2polyr(p : poly) : AlgR = pi (oget (BasePoly.to_basepoly 
                              (fun i => if 0<=i<256 then p.[i] else Zq.zero))).
op polyr2poly(p : AlgR) : poly = Array256.init (fun i => p.[i]).

lemma poly2polyrP i p :  0<=i<256 => (poly2polyr p).[i] = p.[i].
move => ib.
have H := (BasePoly.to_basepolyT (fun (i0 : int) => if 0 <= i0 && i0 < 256 then p.[i0] else Zq.zero) _).
 split; first smt(). 
 by exists 256; smt().
rewrite /poly2polyr /"_.[_]".
rewrite piK. 
+ rewrite reducedP /=.
  apply BasePoly.deg_leP => //. 
  move=> j Hj /=. 
  move: H; pose P:= BasePoly.to_basepoly _.
  have: P=P by done.
  by move: {1}P => [|pol] /#.
move: H; pose P:= BasePoly.to_basepoly _.
have: P=P by done.
by move: {1}P => [|pol] /#.
qed.

lemma polyr2polyP i p :  0<=i<256 => (polyr2poly p).[i] = p.[i].
move => ib;rewrite /polyr2poly /"_.[_]" initiE //=.
qed.


lemma polyr2polyK : cancel poly2polyr polyr2poly.
rewrite /cancel => x; apply Array256.tP => i ib.
by rewrite polyr2polyP // poly2polyrP //=.
qed.

lemma poly2polyrK : cancel polyr2poly poly2polyr.
rewrite /cancel => x;  apply AlgR_eqP => i ib.
by rewrite poly2polyrP // polyr2polyP //=.
qed.

lemma add_lift a b : a &+ b = polyr2poly (poly2polyr a + poly2polyr b). 
apply Array256.tP => i ib.
rewrite polyr2polyP // rcoeffD !poly2polyrP //.
by rewrite /(&+) /= map2E /= initiE //=.
qed.

lemma sub_lift a : (&-) a = polyr2poly (- poly2polyr a). 
apply Array256.tP => i ib.
rewrite polyr2polyP // -rcoeffN !poly2polyrP //.
by rewrite /(&-) /= mapE /= initiE //=.
qed.

lemma mul_lift a b : a &* b = polyr2poly (poly2polyr a * poly2polyr b). 
apply Array256.tP => i ib.
rewrite polyr2polyP // rcoeffM //. 
rewrite /(&*) /= /BasePoly.BigCf.BCA.big filter_predT /range /= initiE  //= foldr_map /=.
have : forall x, x \in (iota_ 0 256) => 0 <= x < 256 by smt(mem_iota).
elim (iota_ 0 256).
+ by auto.
move => x l H H1 /=.
case (0 <= i - x).
 + move => * /=.
   rewrite (H _) /=.
    by move=> y Hy; apply H1 => /= /#.
   ring.
   have -> : (poly2polyr b).[256 + i - x] = Zq.zero by smt(lt0_rcoeff gered_rcoeff).
   rewrite poly2polyrP; 1: by smt(mem_head). 
   rewrite poly2polyrP; 1: by smt().
   by ring.
move => * /=.
rewrite (H _) /=. 
 by move=> y Hy; apply H1 => /= /#.
ring.
rewrite poly2polyrP; 1: smt().
rewrite poly2polyrP; 1: by smt(mem_head). 
   have -> : (poly2polyr b).[i - x] = Zq.zero by smt(lt0_rcoeff gered_rcoeff).
   have -> : 256 + (i - x) = 256 + i - x by smt().
   by ring.
qed.

lemma zero_lift : zero = polyr2poly zeroXnD1. 
apply Array256.tP => i ib.
by rewrite polyr2polyP // /zero /create initiE //= rcoeff0.
qed.

lemma one_lift : one = polyr2poly oneXnD1. 
apply Array256.tP => i ib.
rewrite polyr2polyP // /one /zero /create.
case (i = 0).
move => *;rewrite set_eqiE //;1: 
  by smt(BasePoly.lc1 creprK piK reduced1 BasePoly.deg1).
by move => *; rewrite set_neqiE // initiE //=;
 smt(BasePoly.gedeg_coeff creprK piK reduced1 BasePoly.deg1).
qed.

lemma polyr2poly_inj : injective polyr2poly.
by apply (can_inj _ poly2polyr); apply poly2polyrK.
qed.

lemma poly2polyr_inj : injective poly2polyr.
by apply (can_inj _ polyr2poly); apply polyr2polyK.
qed.

(* Fix me PY: We currently don't care about inverting polynomials *)
op unit(p : poly) = exists q, q &* p = one.
op invr(p : poly) = choiceb (fun q => q &* p = one) p.
