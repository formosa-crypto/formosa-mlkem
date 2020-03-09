require import List Int IntExtra IntDiv CoreMap.
from Jasmin require  import JModel.

require import Poly.
require import Fq.

theory R2.

op e : int = 17 axiomatized by eE.

print Poly.

clone include PolyQPrincipalIdeal
  with type elem <- Fq.ZModP.zmod,
         op Poly.Elem.zeror  <- Fq.ZModP.zero ,
         op Poly.Elem.oner   <- Fq.ZModP.one  ,
         op Poly.Elem.( + )  <- Fq.ZModP.( + ),
         op Poly.Elem.([-])  <- Fq.ZModP.([-]),
         op Poly.Elem.( * )  <- Fq.ZModP.( * ),
         op Poly.Elem.invr   <- Fq.ZModP.inv  ,
       pred Poly.Elem.unit   <- Fq.ZModP.unit ,
         op P                = Poly.of_list [ Fq.ZModP.([-]) (Fq.ZModP.inzmod e); 
                                              Fq.ZModP.zero; 
                                              Fq.ZModP.one].

export Poly.

op proj_r(a : qt) : Fq.ZModP.zmod = (val a).[0].
op proj_i(a : qt) : Fq.ZModP.zmod = (val a).[1].

(* We should somehow have that we can deal
with degree one polynomials as representatives *)
lemma complex_rep (a : qt):
   val a = of_list [proj_r a; proj_i a].
admitted.

lemma complex_injr (ar ai : Fq.ZModP.zmod) : 
   proj_r (inj (of_list [ar; ai])) = ar.
admitted.

lemma complex_inji (ar ai : Fq.ZModP.zmod) : 
   proj_i (inj (of_list [ar; ai])) = ai.
admitted.

abbrev ezqt = inj (of_list [Fq.ZModP.inzmod e]).
abbrev X2 = inj (of_list [ Fq.ZModP.([-]) Fq.ZModP.zero; 
                                          Fq.ZModP.zero; 
                                          Fq.ZModP.one]).

lemma complex_e : ezqt = X2.
proof. 
have ?: (X2 - ezqt = zero); last by smt.
have ?: inj (X*X - (Poly.intmul Poly.one e)) = inj P; first by smt.
rewrite (_: X2 - ezqt = inj (X * X - intmul Poly.one e)).

 first by smt(sub_inj).
by rewrite -zero_inj. 
qed.

lemma explicit_inj (a : poly):
   exists r, inP (a - r).
proof.
exists (a - P). 
rewrite /inP. 
rewrite (_: a - (a - P) = P). smt(@Poly).
exists (Poly.one). smt(@Poly).
qed.


lemma zero_inj  :
   R2.zero = inj P. 
proof.
admitted.


end R2.