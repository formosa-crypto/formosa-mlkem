require import AllCore.
require (****) Matrix.
pragma +oldip.

clone import Matrix as Matrix_.

abbrev (+&) = ZR.(+).
op (-&) = ZR.(-).
op (`<*>`) a b = dotp a b.

import ZR.
lemma exprS: forall (x : R) (n : int), 0 <= n => exp x (n + 1) = x * exp x n.
move => *; rewrite /exp => />. 
rewrite (_: n+1 < 0 = false) /= /iterop /=; first  by smt(). 
rewrite (_: n < 0 = false) /=; first by smt().
rewrite iteriS => />.
case (n = 0); last by smt().
move => />.
rewrite iteri0 => />. 
by rewrite mulrC mul1r.
qed.

lemma ofintS: forall (n : int), 0 <= n => ofint (n + 1) = oner +& (ofint n). 
move => *.
rewrite /ofint /intmul => />.
rewrite (_: n+1 < 0 = false) /= /iterop /=; first  by smt(). 
rewrite (_: n < 0 = false) /=; first by smt().
rewrite iteriS => />.
case (n = 0); last by smt().
move => />.
rewrite iteri0 => />. 
by rewrite addrC add0r.
qed.

lemma ofintN: forall (n : int), ofint (-n) = (- ofint n).
rewrite /ofint /intmul =>*.
case (n=0); first by move => -> /=; rewrite iterop0; smt(@ZR).
by smt(@ZR).
qed.

instance ring with R
  op rzero = ZR.zeror
  op rone  = ZR.oner
  op add   = ZR.( + )
  op opp   = ZR.([-])
  op mul   = ZR.( * )
  op expr  = ZR.exp
  op sub   = (-&)
  op ofint = ZR.ofint

  proof oner_neq0 by apply ZR.oner_neq0
  proof addrA     by apply ZR.addrA
  proof addrC     by apply ZR.addrC
  proof addr0     by (move => *;rewrite ZR.addrC; apply ZR.add0r)
  proof addrN     by (move => *;rewrite ZR.addrC; apply ZR.addNr)
  proof mulr1     by (move => *;rewrite ZR.mulrC; apply ZR.mul1r)
  proof mulrA     by apply ZR.mulrA
  proof mulrC     by apply ZR.mulrC
  proof mulrDl    by apply ZR.mulrDl
  proof expr0     by smt
  proof subrE     by smt
  proof ofint0    by smt
  proof ofint1    by smt
  proof exprS     by apply exprS
  proof ofintS    by apply ofintS
  proof ofintN    by apply ofintN.
 
(*************)
