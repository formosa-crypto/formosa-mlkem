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

clone include Ring.IDomain with
  type t <- poly, op zeror <- zero, op oner <- one.

op "_.[_]" : poly -> int -> elem.
op eval : poly -> elem -> elem.

abbrev root (p : poly) x = eval p x = zeror.
end Poly.

abstract theory PolyQPrincipalIdeal.
type elem.
type poly.

clone import Poly with type elem <- elem, type poly <- poly.

type qt.

op P : poly.

axiom ne1_P : P <> Poly.one.          (* We do not support trivial rings *)
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

type elem = W16.t.

op q = W16.of_int 3329 axiomatized by qE.

op add (a b : W16.t) = (a + b).

op bw16 (a : W16.t) i = -2^i <= to_sint a < 2^i.

lemma add_corr (a b : W16.t): 
   bw16 a 13 => bw16 b 13 =>
       W16.to_sint (add a b) = 
           W16.to_sint a + W16.to_sint b /\
           bw16 (add a b) 14.
admit.

