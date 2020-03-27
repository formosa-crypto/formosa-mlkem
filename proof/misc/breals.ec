require import AllCore IntDiv Ring StdRing StdOrder.
(*---*) import Ring.IntID IntOrder.

op n : { int | 1 < n } as gt1_n.

op k0 : { int | 0 <= k0 } as ge0_k.

axiom lt_n_sqk0 : n < 2^k0.

op a : { int | 0 <= a < n ^ 2 } as rg_a.

lemma ge0_a : 0 <= a by case: rg_a.

hint exact : ge0_a.

abbrev k = k0 + 1.
abbrev p = 2 ^ k.

op m = p %/ n.
op q = (m * a) %/ p.
op r = a - q * n.

lemma ge0_p : 0 <= p by admit.
lemma ge0_n : 0 <= n by admit.

lemma gt0_p : 0 < p by admit.
lemma gt0_n : 0 < n by admit.

hint exact : ge0_p ge0_n.
hint exact : gt0_p gt0_n.

lemma mul2r x : 2 * x = x + x.
proof. by smt(). qed.

lemma foo : a <= p => r < 2 * n.
proof.
move=> le_ap; rewrite /r /q.
rewrite &(ltr_pmul2r p) // mulrBl mulrAC divzE.
rewrite mulrBl opprB addrA; pose c := m * a * n.
have ->: c = p * a - a * (p %% n).
+ by rewrite /c /m mulrAC divzE mulrBl; congr; rewrite mulrC.
rewrite opprD opprK addrA (addrAC (a * p)) (mulrC p a) subrr /=.
rewrite mul2r mulrDl ltr_le_add.
+ by rewrite (mulrC n _) ltr_pmul2r // ltz_pmod.
+ rewrite (mulrC n) &(ler_pmul) //.
  * by rewrite &(modz_ge0) gtr_eqF.
  * by apply/ltrW/ltz_pmod.
qed.  

lemma ge0_r : 0 <= r by admit.

lemma barrett : a <= p =>
  a %% n = if r < n then r else r - n.
proof.
move/foo => lt_r_2n; rewrite (_ : a = r + q * n) 1:[smt()].
rewrite modzMDr modzE; pose c := if _ then _ else _.
have ->{c}: c = r - (if r < n then 0 else 1) * n by smt().
do 3! congr; case: (r < n).
+ by move=> lt_rn; rewrite divz_small // ge0_r /= ger0_norm.
+ rewrite ltrNge /= => le_nr.
admitted.
