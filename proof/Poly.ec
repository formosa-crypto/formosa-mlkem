require import AllCore Ring List.
require (*--*) ZModP Quotient.
from Jasmin require import JModel.

abstract theory Poly.
type elem.

clone import Ring.IDomain as Elem with type t <- elem.
type poly.

op zero  : poly.
op one   : poly.
op X     : poly.
op deg : poly -> int.

op eval    : poly -> elem -> elem.
abbrev root (p : poly) x = eval p x = zeror.

op "_.[_]" : poly -> int -> elem.

axiom ext_eq a b :
   (a = b) = forall i, a.[i] = b.[i].

axiom zero_coeffs p k:
       (k < 0 \/ deg p < k) => p.[k] = Elem.zeror.

op add : poly -> poly -> poly.

axiom add_sem a b i:
    (add a b).[i] = a.[i] + b.[i].    

op mul : poly -> poly -> poly.

axiom mul_sem a b k:
    (mul a b).[k] = 
       foldr Elem.(+) zeror 
          (map (fun j => a.[k-j] * b.[j]) (iota_ 0 k)).

lemma mul_zero_coeffs a b k:
    (0<= deg a + deg b < k) =>
       (mul a b).[k] = Elem.zeror.
proof.
rewrite mul_sem.
move => bound.
elim (iota_ 0 k).
smt.
progress.
rewrite H.
rewrite (_: a.[k - x] * b.[x] = zeror). smt.
smt.
qed.

clone include Ring.IDomain with
  type t <- poly, op zeror <- zero, op oner <- one, op ( + ) = add, op ( * ) = mul.

end Poly.

abstract theory PolyQPrincipalIdeal.
type elem.
type poly.

clone import Poly with type elem <- elem, type poly <- poly.

type qt.

op P : poly.

axiom ne1_P : P <> Poly.one.  (* We do not support trivial rings *)
axiom ne0_P : P <> Poly.zero.        

op inP (p : poly) = exists a : poly, p = a * P.

op val : qt -> poly.
op inj : poly -> qt.

axiom valK p : inP (p - val (inj p)).
axiom injK pqt : inj (val pqt) = pqt.

axiom polyqpideal_eqE (p q : qt) :
  (p = q) <=> (inP (val p - val q)).

op zero : qt.
op one : qt.

clone include Ring.IDomain with (* We have a principal ring *)
  type t <- qt, op zeror <- zero, op oner <- one.

end PolyQPrincipalIdeal.

theory Z_3329_X__X_256.
op q : int = 3329 axiomatized by qE.
op n : int =  256 axiomatized by nE.
op e : int = 17 axiomatized by eE.

clone import ZModP with op p <- q proof le2_p by smt(qE).

clone include PolyQPrincipalIdeal
  with type elem <- ZModP.zmod,
         op Poly.Elem.zeror  <- ZModP.zero ,
         op Poly.Elem.oner   <- ZModP.one  ,
         op Poly.Elem.( + )  <- ZModP.( + ),
         op Poly.Elem.([-])  <- ZModP.([-]),
         op Poly.Elem.( * )  <- ZModP.( * ),
         op Poly.Elem.invr   <- ZModP.inv  ,
       pred Poly.Elem.unit   <- ZModP.unit ,
         op P                <- Poly.( + ) (Poly.exp Poly.X n)  Poly.one.

export Poly.
end Z_3329_X__X_256.

export Z_3329_X__X_256.

theory KyberPoly.

clone import Z_3329_X__X_256.
import ZModP.

type elem = W16.t.

op q = W16.of_int 3329 axiomatized by qE.

op add (a b : W16.t) = (a + b).

op bw16 (a : W16.t) i =
     (* 0 <= *) i < 14 /\ 
     -2^i <= to_sint a < 2^i.

lemma add_corr (a b : W16.t) (a' b' : zmod) (asz bsz : int): 
   a' = inzmod (W16.to_sint a) =>
   b' = inzmod (W16.to_sint b) =>
   bw16 a asz => 
   bw16 b bsz =>
     inzmod (W16.to_sint (add a b)) = a' + b' /\
           bw16 (add a b) (max asz bsz + 1).
admitted.

require import Poly_add Array256.

type pelem = W16.t Array256.t.

print M.

op repres : pelem -> poly.

axiom repres_deg pelem :
      0 <= deg (repres pelem) < 256.

axiom repres_get (p : pelem) (i : int):
    (repres p).[i] = inzmod (W16.to_sint p.[i]).

op bwpol16 (p : pelem) (sz : int) =
    all (fun c => bw16 c sz) p axiomatized by bwpol16E.

lemma add_corr aap abp asz bsz:
   hoare [ M.poly_add :
      aap = repres ap /\
      abp = repres bp /\
      bwpol16 ap asz /\
      bwpol16 bp bsz ==>
         repres res = aap + abp /\
           bwpol16 res (max asz bsz + 1)].
proof.
proc.
unroll for 3.
wp; skip => />.
progress.
rewrite Poly.ext_eq.
progress.
rewrite !repres_get.
case (i0 = 0) => />.
rewrite add_sem !repres_get.
move : (add_corr (ap{hr}.[0]) (bp{hr}.[0])
(inzmod (to_sint ap{hr}.[0])) (inzmod (to_sint bp{hr}.[0])) asz bsz _ _ _ _) => //=.
move : H; rewrite bwpol16E.
smt.
move : H0; rewrite bwpol16E.
smt.
admit.
qed.

