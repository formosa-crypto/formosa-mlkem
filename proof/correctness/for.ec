require import AllCore StdOrder IntMin IntDiv.

import IntOrder.

abstract theory FOR.

  type t, it, ct.

  op incr : it -> t -> t.
  op cond : ct -> t -> bool.
  op out : it -> ct -> t -> int.
  op finite : it -> ct -> t -> bool.
  op val : it -> t -> int -> t.

  abbrev ncond_val i c x n = ! cond c (val i x n).
  abbrev form i c x n = (0 <= n <= out i c x).
  op inv i c x v = exists n , (v = (val i x n)) /\ (form i c x n).

  axiom val_iter i x n : 0 <= n => val i x n = (iter n (incr i) x).
  axiom finite_nsempty i c x : finite i c x => ! sempty (pcap (ncond_val i c x)).
  axiom pmin_out i c x : finite i c x => pmin (ncond_val i c x) = out i c x.

  lemma inv_loop i c x v : finite i c x => inv i c x v => cond c v => inv i c x (incr i v).
  proof.
    move => Hfin [n [->> [le0n /ler_eqVlt lenout]]] Hcond.
    case lenout => [->>|ltnout].
    + by have:= pmin_mem _ (finite_nsempty _ _ _ Hfin); rewrite (pmin_out _ _ _ Hfin) /= => /negP Hncond; have:= (Hncond Hcond).
    exists (n+1); do!split.
    + by rewrite !val_iter ?addr_ge0 // iterS.
    + by apply addr_ge0.
    by move => _; apply ltzE.
  qed.

  lemma inv_in i c x : finite i c x => inv i c x x.
  proof.
    move => Hfin; exists 0; rewrite val_iter // iter0 //=.
    rewrite -(pmin_out _ _ _ Hfin).
    by apply ge0_pmin.
  qed.

  lemma inv_out i c x v : finite i c x => inv i c x v => !(cond c v) => v = (val i x (out i c x)).
  proof.
    move => Hfin [n [->> [le0n /ler_eqVlt lenout]]] Hncond.
    case lenout => [-> //|ltnout].
    have:= (pmin_min _ _ (finite_nsempty _ _ _ Hfin) le0n Hncond).
    by rewrite (pmin_out _ _ _ Hfin) => /lezNgt /negP nltnout; move: (nltnout ltnout).
  qed.

end FOR.



theory FOR_INT_ADD_LT.

  clone include FOR with 
    type t <- int,
    type it <- int,
    type ct <- int,
    op incr <- (fun i x : int => x + i),
    op cond <- (fun c x : int => x < c),
    op out = (fun i c x : int => max (- (x - c) %/ i) 0),
    op finite <- (fun i c x : int => (0 < i)),
    op val <- (fun i x n : int => x + n * i)
    proof *.

    realize val_iter.
    proof.
      by move => i x; elim; [rewrite iter0|move => n le0n; rewrite mulzDl addzA iterS // => <- /=].
    qed.

    realize finite_nsempty.
    proof.
      move => i c x lt0i; apply semptyNP.
      exists (out i c x); rewrite /out maxrE.
      case: (0 <= - (x - c) %/ i) => [le0_|/ltzNge lt_0]; split => //=.
      + apply/negP => /ltr_subr_addl; rewrite mulNr => /ltr_oppl; rewrite opprB /=.
        by apply /ler_gtF; apply lez_floor; apply gtr_eqF.
      move: lt_0 => /ltr_oppl /= lt0_; apply/ltr_gtF/subr_gt0.
      by apply (ltr_le_trans ((x - c) %/ i * i)); [apply mulr_gt0|apply/lez_floor/gtr_eqF].
    qed.

    (*TODO: use new lemmas on pmin.*)
    realize pmin_out.
    proof.
      move => i c x lt0i.
      admit.
    qed.

end FOR_INT_ADD_LT.



(*TODO: an int logarithm or something for a FOR_INT_DIV_GE ?*)

require import RealExp.

search _ ilog.
