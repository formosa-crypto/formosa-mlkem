

theory Z_3329_X__X_256.

op n : int =  256 axiomatized by nE.
op e : int = 17 axiomatized by eE.

clone import Fq with op p <- q proof le2_p by smt(qE).

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
import Fq.
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


