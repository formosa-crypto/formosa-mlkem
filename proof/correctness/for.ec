require import AllCore StdOrder IntMin IntDiv List.

import IntOrder.

require import IntDiv_extra RealExp.

abstract theory FOR.

  type t, it, ct.

  op incr : it -> t -> t.
  op cond : ct -> t -> bool.
  op out : it -> ct -> t -> int.
  op finite : it -> ct -> t -> bool.
  op val : it -> t -> int -> t.

  op ncond_val i c x n = ! cond c (val i x n).
  (*TODO: anything such as exists n \in range r , P n ?*)
  op inv i c x v = exists n : int , (n \in (range 0 (out i c x + 1))) /\ (v = (val i x n)).

  axiom val_iter i x n : 0 <= n => val i x n = (iter n (incr i) x).
  axiom finite_nsempty i c x : finite i c x => ! sempty (pcap (ncond_val i c x)).
  axiom pmin_out i c x : finite i c x => pmin (ncond_val i c x) = out i c x.

  lemma inv_loop_post i c x v : finite i c x => inv i c x v => cond c v => inv i c x (incr i v).
  proof.
    move => Hfin [n [/mem_range [le0n /ltzS /ler_eqVlt [->>|ltnout]] ->>]] Hcond.
    + by have:= pmin_mem _ (finite_nsempty _ _ _ Hfin); rewrite (pmin_out _ _ _ Hfin) /= => /negP Hncond; have:= (Hncond Hcond).
    exists (n+1); split; first apply/mem_range; split.
    + by apply addr_ge0.
    + by move => _; apply ltz_add2r.
    by rewrite !val_iter ?addr_ge0 // iterS.
  qed.

  lemma inv_loopP i c x v : finite i c x => inv i c x v => cond c v => exists n , (n \in (range 0 (out i c x))) /\ (v = (val i x n)).
  proof.
    move => Hfin [n [/mem_range [le0n /ltzS /ler_eqVlt [eqnout|ltnout]] ->>]] Hcond;
    exists n; split => //; apply/mem_range; split => // _.
    have //: false; move: eqnout Hcond => ->>; rewrite -(pmin_out _ _ _ Hfin); apply/negP.
    (*TODO: why is this necessary?*)
    by move: (pmin_mem (ncond_val i c x) (finite_nsempty i c x _)).
  qed.

  lemma inv_in i c x : finite i c x => inv i c x x.
  proof.
    move => Hfin; exists 0; rewrite val_iter // iter0 //=.
    rewrite -(pmin_out _ _ _ Hfin); apply/mem_range => //=; apply/ltzS.
    by apply ge0_pmin.
  qed.

  lemma inv_outP i c x v : finite i c x => inv i c x v => ! cond c v => v = val i x (out i c x).
  proof.
    move => Hfin [n [/mem_range [le0n /ltzS /ler_eqVlt [-> //|ltnout]] ->>]] Hncond.
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
    op out = (fun i c x : int => if c <= x then 0 else (c - x) %\ i),
    op finite <- (fun i c x : int => (c <= x) \/ (0 < i)),
    op val <- (fun i x n : int => x + n * i)
    proof *.

    realize val_iter.
    proof. by move => i x; elim; [rewrite iter0|move => n le0n; rewrite mulzDl addzA iterS // => <- /=]. qed.

    realize finite_nsempty.
    proof.
      move => i c x /or_andr [lecx|[nlecx lt0i]]; apply semptyNP; exists (out i c x); rewrite /out.
      + by rewrite lecx /=; split => //; rewrite /ncond_val /= ler_gtF.
      rewrite nlecx /=; move: nlecx => /ltzNge ltxc; split.
      + by rewrite ltrW ltz_NdivNLR //= ltr_subr_addr.
      by apply/lezNgt/ler_subl_addl/lez_ceil/gtr_eqF.
    qed.

    realize pmin_out.
    proof.
      move => i c x /or_andr [lecx|[nlecx lt0i]]; [rewrite /out lecx /=|rewrite /out nlecx /=]; apply pmin_eq => //.
      + by rewrite /ncond_val /= ler_gtF.
      + by move => j [le0j ltj0]; move: (ler_lt_trans _ _ _ le0j ltj0).
      + by apply ltrW; rewrite ltz_NdivNLR //= subr_gt0 ltrNge.
      + by apply/lezNgt/ler_subl_addl/lez_ceil/gtr_eqF.
      by move => j [le0j ltj_]; rewrite /ncond_val /= -ltr_subr_addl -ltz_NdivNLR.
    qed.

end FOR_INT_ADD_LT.



theory FOR_NAT_MUL_LE.

  clone include FOR with 
    type t <- int,
    type it <- int,
    type ct <- int,
    op incr <- (fun i x : int => x * i),
    op cond <- (fun c x : int => x <= c),
    op out = (fun i c x : int =>
                if (c < x) then 0
                else ilog i (c %/ x) + 1),
    op finite <- (fun i c x : int => (c < x) \/ (1 < i /\ (0 < x))),
    op val <- (fun i x n : int => x * (i ^ n))
    proof *.

    realize val_iter.
    proof. by move => i x; elim; [rewrite iter0 // expr0|move => n le0n; rewrite exprSr // mulrA iterS //= => ->]. qed.

    realize finite_nsempty.
    proof.
      move => i c x /or_andr [ltcx|[nltcx [lt1i lt0x]]];
      apply semptyNP; exists (out i c x); rewrite /out.
      + by rewrite ltcx /=; split => //; rewrite /ncond_val lerNgt expr0.
      rewrite nltcx /ncond_val /=; split.
      + by apply addz_ge0 => //; apply ilog_ge0 => //;
        [apply/ltzW|apply lez_divRL => //=; apply lezNgt].
      apply/ltzNge; rewrite mulzC; apply/ltz_divLR => //; case (ilogP i (c %/ x) _ _) => //.
      by apply lez_divRL => //=; apply lezNgt.
    qed.

    realize pmin_out.
    proof.
      move => i c x /or_andr [ltcx|[nltcx [lt1i lt0x]]]; [rewrite /out ltcx /=|rewrite /out nltcx /=]; apply pmin_eq => //.
      + by rewrite /ncond_val expr0 /= lezNgt.
      + by move => j [le0j ltj0]; move: (ler_lt_trans _ _ _ le0j ltj0).
      + by apply addz_ge0 => //; apply ilog_ge0 => //;
        [apply/ltzW|apply lez_divRL => //=; apply lezNgt].
      + apply/ltzNge; rewrite mulzC; apply/ltz_divLR => //; case (ilogP i (c %/ x) _ _) => //.
        by apply lez_divRL => //=; apply lezNgt.
      move => j [le0j ltj_]; rewrite /ncond_val /= mulzC -lez_divRL //.
      apply/(lez_trans (i ^ (ilog i (c %/ x)))).
      + by apply ler_weexpn2l; [apply ltzW|split => // _; apply ltzS].
      by case (ilogP i (c %/ x) _ _) => //; apply lez_divRL => //=; apply lezNgt.
    qed.

end FOR_NAT_MUL_LE.


theory FOR_NAT_DIV_GE.

  clone include FOR with 
    type t <- int,
    type it <- int,
    type ct <- int,
    op incr <- (fun i x : int => x %/ i),
    op cond <- (fun c x : int => c <= x),
    op out = (fun i c x : int =>
                if (x < c) then 0
                else ilog i (x %/ c) + 1),
    op finite <- (fun i c x : int => (x < c) \/ (1 < i /\ (0 < x))),
    op val <- (fun i x n : int => x %/ (i ^ n))
    proof *.

    realize val_iter.
    proof.
      move => i x; elim; first by rewrite iter0 // expr0.
      move => n le0n.
      rewrite exprSr //. mulrA iterS //= => ->.
    qed.

    realize finite_nsempty.
    proof.
      move => i c x /or_andr [ltcx|[nltcx [lt1i lt0x]]];
      apply semptyNP; exists (out i c x); rewrite /out.
      + by rewrite ltcx /=; split => //; rewrite /ncond_val lerNgt expr0.
      rewrite nltcx /ncond_val /=; split.
      + by apply addz_ge0 => //; apply ilog_ge0 => //;
        [apply/ltzW|apply lez_divRL => //=; apply lezNgt].
      apply/ltzNge; rewrite mulzC; apply/ltz_divLR => //; case (ilogP i (c %/ x) _ _) => //.
      by apply lez_divRL => //=; apply lezNgt.
    qed.

    realize pmin_out.
    proof.
      move => i c x /or_andr [ltcx|[nltcx [lt1i lt0x]]]; [rewrite /out ltcx /=|rewrite /out nltcx /=]; apply pmin_eq => //.
      + by rewrite /ncond_val expr0 /= lezNgt.
      + by move => j [le0j ltj0]; move: (ler_lt_trans _ _ _ le0j ltj0).
      + by apply addz_ge0 => //; apply ilog_ge0 => //;
        [apply/ltzW|apply lez_divRL => //=; apply lezNgt].
      + apply/ltzNge; rewrite mulzC; apply/ltz_divLR => //; case (ilogP i (c %/ x) _ _) => //.
        by apply lez_divRL => //=; apply lezNgt.
      move => j [le0j ltj_]; rewrite /ncond_val /= mulzC -lez_divRL //.
      apply/(lez_trans (i ^ (ilog i (c %/ x)))).
      + by apply ler_weexpn2l; [apply ltzW|split => // _; apply ltzS].
      by case (ilogP i (c %/ x) _ _) => //; apply lez_divRL => //=; apply lezNgt.
    qed.

end FOR_NAT_DIV_GE.



(*TODO: the beefier version.*)
(*
theory FOR_INT_MUL_LE.

  clone include FOR with 
    type t <- int,
    type it <- int,
    type ct <- int,
    op incr <- (fun i x : int => x * i),
    op cond <- (fun c x : int => x <= c),
    op out = (fun i c x : int =>
                if (c < x) then 0
                else if (c < x * i) then 1
                else if (1 < i) \/ (x < 0 <=> ilog `|i| (`|c| %/ `|x|) %% 2 = 0) then ilog `|i| (`|c| %/ `|x|) + 1
                else ilog `|i| (`|c| %/ `|x|) + 2),
    op finite <- (fun i c x : int => (c < x) \/ (c < x * i) \/ (1 < `|i| /\ (x <> 0) /\ (1 < i => 0 < x))),
    op val <- (fun i x n : int => x * (i ^ n))
    proof *.

    realize val_iter.
    proof. by move => i x; elim; [rewrite iter0 // expr0|move => n le0n; rewrite exprSr // mulrA iterS //= => ->]. qed.

    realize finite_nsempty.
    proof.
      move => i c x /or_andr [ltcx|[nltcx /or_andr [ltc_|[nltc_ [lt1normi [neqx0 Hix]]]]]]; apply semptyNP; exists (out i c x); rewrite /out.
      + by rewrite ltcx /=; split => //; rewrite /ncond_val lerNgt expr0.
      + by rewrite nltcx ltc_ /=; split => //; rewrite /ncond_val lerNgt expr1.
      rewrite nltcx nltc_ /=.
      (*TODO: why does this not put the case in the context?*)
      (*case (_ \/ (_ <=> _)).*)
      case (1 < i \/ (x < 0 <=> ilog (`|i|) (`|c| %/ `|x|) %% 2 = 0)) => [/or_andr [lt1i|[nlt1i Heq]]|/negb_or [nlt1i /negb_eqbl Heq]];
      (split; first by apply/addr_ge0 => //; apply/ilog_ge0; [apply/ltzW|apply/lez_divRL; smt()]).
      + rewrite /ncond_val lerNgt /= mulrC -ltz_divLR ?Hix // !gtr0_norm 1,2,3:/#.
        by move: (ilogP i (c %/ x) _ _) => //=; apply/lez_divRL; smt().
      + rewrite /ncond_val lerNgt /= mulrC; move: lt1normi => /ltr_normr; case => // ltinegi.
        search _ (_ < `|_|)%Int.
        admit.
      admit.
    qed.

    realize pmin_out.
    proof.
      admit.
    qed.

end FOR_INT_MUL_LE.



theory FOR_INT_DIV_GE.

end FOR_INT_DIV_GE.
*)
