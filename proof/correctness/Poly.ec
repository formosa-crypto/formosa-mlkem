require import AllCore Ring List.
require (*--*) Quotient.
from Jasmin require import JModel.

abstract theory Poly.
type elem.

clone import Ring.IDomain as Elem with type t <- elem.
type poly.

op zero  : poly.
op one   : poly.
op X     : poly.
op deg : poly -> int.


op "_.[_]" : poly -> int -> elem.

axiom ext_eq a b :
   (a = b) = forall i, a.[i] = b.[i].

axiom zero_coeffs p k:
       (k < 0 \/ deg p < k) => p.[k] = Elem.zeror.

op of_list : elem list -> poly.
op to_list : poly -> elem list.

axiom zero_rep : to_list zero = [ Elem.zeror].
axiom one_rep : to_list one = [ Elem.oner].
axiom x_rep : to_list X = [ Elem.zeror; Elem.oner].

axiom of_list_degn0 l :
  l <> [] => 
  deg (of_list l) = (size l) - 1.

axiom to_list_size a :
  size (to_list a) = deg a + 1.

axiom of_list_coef l i :
  (of_list l).[i] = nth zeror l i.

lemma of_list_coef0 l i :
  !(0 <= i < size l) =>
  (of_list l).[i] = Elem.zeror  
by smt(@List zero_coeffs of_list_coef).

axiom to_list_coef a i :
  nth (Elem.zeror) (to_list a) i = a.[i].

lemma to_listK l : l <> [] => to_list (of_list l) = l.
proof.
rewrite /cancel => lnempty. 
apply (eq_from_nth Elem.zeror).
 smt(to_list_size of_list_degn0). 
smt(of_list_coef to_list_coef).
qed.

lemma of_listK : cancel to_list of_list. 
rewrite /cancel => x.
rewrite ext_eq => i. 
smt(of_list_coef to_list_coef).
qed.

op eval    : poly -> elem -> elem.
abbrev root (p : poly) x = eval p x = zeror.

axiom eval_sem p (x : elem) :
   eval p x =
     foldr (fun i b => p.[deg p - i] + b*x) (Elem.zeror) (iota_ 0 (deg p)).

op add : poly -> poly -> poly.

axiom add_sem a b i:
    (add a b).[i] = a.[i] + b.[i].    

op inv : poly -> poly.

axiom inv_sem a i:
    (inv a).[i] = -a.[i].    

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
smt().
auto => /> *.
rewrite H.
rewrite (_: a.[k - x] * b.[x] = zeror). 
 smt(@Elem zero_coeffs).
smt(@Elem).
qed.

clone include Ring.IDomain with
  type t <- poly, 
  op zeror <- zero, 
  op oner <- one, 
  op ( + ) = add, 
  op ( * ) = mul,
  op [-] = inv.


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
