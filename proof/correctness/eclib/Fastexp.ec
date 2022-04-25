require import AllCore StdOrder List Ring Int IntDiv IntMin BitEncoding RealExp.
(*---*) import IntOrder BS2Int BitReverse.

abstract theory Fastexp.

  clone import ComRing as CR.

  section.

  local abbrev fastexp_nbits_aux N x n =
    foldr
      (fun b (p : CR.t * CR.t) =>
        let (em, ep) = p in
        (em * (if b then ep else oner), ep * ep))
      (CR.oner, x) (rev (int2bs N n)).

  op fastexp_nbits N x n =
    fst (fastexp_nbits_aux N x n).

  op fastexp x n =
    if n < 0
    then invr (fastexp_nbits (ilog 2 (-n) + 1) x (-n))
    else if n = 0
    then oner
    else       fastexp_nbits (ilog 2 n    + 1) x n.

  local lemma fastexp_nbits_auxP N x n :
    0 <= N =>
    n \in range 0 (2 ^ N) =>
    fastexp_nbits_aux N x n =
    (exp x n, exp x (2 ^ N)).
  proof.
    move => le0N; rewrite -(mul1r (exp x n)); move: {2 3}oner x.
    elim: N le0N n => [n y x|N le0N IHN n y x mem_range_n].
    + rewrite expr0 int2bs0s_le //= -(eq_range n 0) => ->.
      by rewrite /exp /= (iteropS 0) // iterop0 // iter0 // mulr1.
    rewrite int2bsS // rev_rcons /= -int2bs_mod IHN.
    + move: (mem_range_mod n (2 ^ N)); rewrite normrX_nat //= => -> //.
      by rewrite gtr_eqF // expr_gt0.
    rewrite /= -expr2 -!exprM exprSr //; split => //.
    rewrite {3}(divz_eq n (2 ^ N)).
    rewrite (modzE _ 2) subr_eq0; move: (range_div_range n (2 ^ N) 0 2).
    rewrite expr_gt0 //= -exprS // mem_range_n /=.
    rewrite range_ltn //= range_ltn //= range_geq //=.
    case => ->; rewrite ?mulr1 //=.
    rewrite -mulrA; congr => //; rewrite mulrC exprD_nneg //.
    + by rewrite expr_ge0.
    by rewrite modz_ge0 gtr_eqF // expr_gt0.
  qed.

  lemma fastexp_nbitsP N x n :
    0 <= N =>
    n \in range 0 (2 ^ N) =>
    fastexp_nbits N x n = exp x n.
  proof. by move => ? ?; rewrite /fastexp_nbits fastexp_nbits_auxP. qed.

  lemma fastexpP x n :
    fastexp x n = exp x n.
  proof.
    rewrite /fastexp; case: (n < 0) => [/subr_gt0|/lezNgt] //=.
    + move => lt0n; rewrite fastexp_nbitsP //=.
      - by rewrite addr_ge0 // ilog_ge0 //; rewrite ltzE in lt0n.
      - rewrite mem_range ltzW //=; move: (ilogP 2 (-n)) => /=.
        by rewrite ltzE /= in lt0n; rewrite lt0n /= => -[].
      by rewrite exprN invrK.
    case: (n = 0) => [->>|le0n neqn0].
    + by rewrite expr0.
    move: (ltz_def 0 n); rewrite le0n neqn0 /=.
    move => lt0n; rewrite fastexp_nbitsP //=.
    + by rewrite addr_ge0 // ilog_ge0 //; rewrite ltzE in lt0n.
    rewrite mem_range ltzW //=; move: (ilogP 2 n) => /=.
    by rewrite ltzE /= in lt0n; rewrite lt0n /= => -[].
  qed.
  end section.

end Fastexp.
