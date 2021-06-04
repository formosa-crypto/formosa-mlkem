require import AllCore StdOrder IntMin IntDiv List.
(*---*) import IntOrder.
require import Logic_extra List_extra IntDiv_extra RealExp BitEncoding_extra.


abstract theory FOR.

  type t, it, ct.

  op incr : it -> t -> t.
  op cond : ct -> t -> bool.
  op out : it -> ct -> t -> int.
  op finite : it -> ct -> t -> bool.
  op val : it -> t -> int -> t.

  op ncond_val i c x n = ! cond c (val i x n).
  op inv i c x v = exists n : int , (n \in (range 0 (out i c x + 1))) /\ (v = (val i x n)).

  axiom val_iter i x n : 0 <= n => val i x n = (iter n (incr i) x).
  axiom finite_nsempty i c x : finite i c x => ! sempty (pcap (ncond_val i c x)).
  axiom pmin_out i c x : finite i c x => pmin (ncond_val i c x) = out i c x.

  lemma out_ge0 i c x : finite i c x => 0 <= out i c x.
  proof. by move => Hfin; rewrite -pmin_out // ge0_pmin. qed.

  lemma inv_loop_post i c x v : finite i c x => cond c v => inv i c x v => inv i c x (incr i v).
  proof.
    move => Hfin Hcond [n [/mem_range [le0n /ltzS /ler_eqVlt [->>|ltnout]] ->>]].
    + have:= pmin_mem _ (finite_nsempty _ _ _ Hfin).
      by rewrite (pmin_out _ _ _ Hfin) /= => /negP Hncond; have:= (Hncond Hcond).
    exists (n+1); split; first apply/mem_range; split.
    + by apply addr_ge0.
    + by move => _; apply ltz_add2r.
    by rewrite !val_iter ?addr_ge0 // iterS.
  qed.

  lemma inv_loopP i c x v : finite i c x => cond c v => inv i c x v => exists n , (n \in (range 0 (out i c x))) /\ (v = (val i x n)).
  proof.
    move => Hfin Hcond [n [/mem_range [le0n /ltzS /ler_eqVlt [eqnout|ltnout]] ->>]];
    exists n; split => //; apply/mem_range; split => // _.
    have //: false; move: eqnout Hcond => ->>; rewrite -(pmin_out _ _ _ Hfin); apply/negP.
    by move: (pmin_mem (ncond_val i c x) (finite_nsempty i c x _)).
  qed.

  lemma inv_in i c x : finite i c x => inv i c x x.
  proof.
    move => Hfin; exists 0; rewrite val_iter // iter0 //=.
    rewrite -(pmin_out _ _ _ Hfin); apply/mem_range => //=; apply/ltzS.
    by apply ge0_pmin.
  qed.

  lemma inv_outP i c x v : finite i c x => ! cond c v => inv i c x v => v = val i x (out i c x).
  proof.
    move => Hfin Hncond [n [/mem_range [le0n /ltzS /ler_eqVlt [-> //|ltnout]] ->>]].
    have:= (pmin_min _ _ (finite_nsempty _ _ _ Hfin) le0n Hncond).
    by rewrite (pmin_out _ _ _ Hfin) => /lezNgt /negP nltnout; move: (nltnout ltnout).
  qed.

end FOR.


theory FOR_INT_ADD_LT.

  abbrev a_out (i c x : int) = if c <= x then 0 else (c - x) %\ i.

  clone include FOR with 
    type t <= int,
    type it <= int,
    type ct <= int,
    op incr <= (fun i x : int => x + i),
    op cond <= (fun c x : int => x < c),
    op out <= a_out,
    op finite <= (fun i c x : int => (c <= x) \/ (0 < i)),
    op val <= (fun i x n : int => x + n * i)
    proof *.

    realize val_iter.
    proof. by move => i x; elim; [rewrite iter0|move => n le0n; rewrite mulzDl addzA iterS // => <- /=]. qed.

    realize finite_nsempty.
    proof.
      move => i c x /or_andr [lecx|[nlecx lt0i]]; apply semptyNP; exists (a_out i c x); rewrite /out.
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

  abbrev a_out (i c x : int) = if (c < x) then 0 else ilog i (c %/ x) + 1.

  clone include FOR with 
    type t    <= int,
    type it   <= int,
    type ct   <= int,
    op incr   <= (fun i x : int => x * i),
    op cond   <= (fun c x : int => x <= c),
    op out    <= a_out,
    op finite <= (fun i c x : int => (c < x) \/ (1 < i /\ (0 < x))),
    op val    <= (fun i x n : int => x * (i ^ n))
    proof *.

    realize val_iter.
    proof. by move => i x; elim; [rewrite iter0 // expr0|move => n le0n; rewrite exprSr // mulrA iterS //= => ->]. qed.

    realize finite_nsempty.
    proof.
      move => i c x /or_andr [ltcx|[nltcx [lt1i lt0x]]];
      apply semptyNP; exists (a_out i c x); rewrite /out.
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

  abbrev a_out (i c x : int) = if (x < c) then 0 else ilog i (x %/ c) + 1.

  clone include FOR with 
    type t    <= int,
    type it   <= int,
    type ct   <= int,
    op incr   <= (fun i x : int => x %/ i),
    op cond   <= (fun c x : int => c <= x),
    op out    <= a_out,
    op finite <= (fun i c x : int => (x < c) \/ (1 < i /\ (0 < c))),
    op val    <= (fun i x n : int =>
                 if 0 <= i then x %/ (i ^ n)
                 else iter n (transpose (%/)%Int i) x)
    proof *.

    realize val_iter.
    proof.
      move => i; case (0 <= i) => [le0i|_ //].
      move => x; elim; first by rewrite iter0 // expr0.
      move => n le0n; rewrite exprSr // iterS //= => <-.
      by rewrite divz_mul // expr_ge0.
    qed.

    realize finite_nsempty.
    proof.
      move => i c x /or_andr [ltcx|[nltcx [lt1i lt0x]]];
      apply semptyNP; exists (a_out i c x).
      + by rewrite ltcx /=; split => //; rewrite /ncond_val expr0 iter0 //=; apply/ltrNge; case (0 <= i).
      rewrite nltcx /ncond_val /=; split.
      + by apply addz_ge0 => //; apply ilog_ge0 => //;
        [apply/ltzW|apply lez_divRL => //=; apply lezNgt].
      have -> /=: (0 <= i) by apply/ltzW/ltzE/ltzW.
      apply/ltzNge/ltz_divLR; first by apply/expr_gt0/ltzE/ltzW.
      rewrite mulzC; apply/ltz_divLR => //; case (ilogP i (x %/ c) _ _) => //.
      by apply lez_divRL => //=; apply lezNgt.
    qed.

    realize pmin_out.
    proof.
      move => i c x /or_andr [ltcx|[nltcx [lt1i lt0x]]]; [rewrite /out ltcx /=|rewrite /out nltcx /=]; apply pmin_eq => //=.
      + by rewrite /ncond_val expr0 iter0 //= lezNgt.
      + by move => j [le0j ltj0]; move: (ler_lt_trans _ _ _ le0j ltj0).
      + by apply addz_ge0 => //; apply ilog_ge0 => //;
        [apply/ltzW|apply lez_divRL => //=; apply lezNgt].
      + apply/ltzNge; have -> /=: (0 <= i) by apply/ltzW/ltzE/ltzW.
        apply/ltz_divLR => //; first by apply/expr_gt0/ltzE/ltzW.
        rewrite mulzC; apply/ltz_divLR => //; case (ilogP i (x %/ c) _ _) => //.
        by apply lez_divRL => //=; apply lezNgt.
      move => j [le0j ltj_]; rewrite /ncond_val /=.
      have -> /=: (0 <= i) by apply/ltzW/ltzE/ltzW.
      apply/lez_divRL; first by apply/expr_gt0/ltzE/ltzW.
      rewrite mulzC -lez_divRL //; apply/(lez_trans (i ^ (ilog i (x %/ c)))).
      + by apply ler_weexpn2l; [apply ltzW|split => // _; apply ltzS].
      by case (ilogP i (x %/ c) _ _) => //; apply lez_divRL => //=; apply lezNgt.
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
    qed.

    realize pmin_out.
    proof.
    qed.

end FOR_INT_MUL_LE.



theory FOR_INT_DIV_GE.

end FOR_INT_DIV_GE.
*)



abstract theory FOLDR_FOR.

  (*TODO: any way to clone import and then replace some lemmas?
    Or maybe make even more abstract class cloned by everybody?*)
  clone import FOR.

  abbrev lt i x n = rev (map (val i x) (range 0 n)).

  op inv ['u] f z (t : 'u) i c x v =
    exists n ,
      n \in range 0 (out i c x + 1) /\
      v = (val i x n) /\
      t = foldr f z (lt i x n).

  lemma inv_loop_post ['u] f z (t : 'u) i c x v :
    finite i c x =>
    cond c v =>
    inv f z t i c x v =>
    inv f z (f v t) i c x (incr i v).
  proof.
    move => Hfin Hcond [n [Hn_range [->> ->>]]].
    move: Hn_range; rewrite {1}rangeSr ?out_ge0 // mem_rcons /=; case => [->>|Hn_range].
    + have:= pmin_mem _ (finite_nsempty _ _ _ Hfin).
      by rewrite (pmin_out _ _ _ Hfin) /= => /negP; rewrite Hcond.
    exists (n + 1); do!split.
    + apply/(range_incl _ 1 (out i c x + 1) _ _ _ _ _) => //.
      by move: (range_add _ 1 _ _ Hn_range).
    + by rewrite !val_iter ?addr_ge0 // ?iterS; move/mem_range: Hn_range.
    by rewrite rangeSr ?map_rcons ?rev_rcons /(\o) //=; move/mem_range: Hn_range.
  qed.

  lemma inv_loopP ['u] f z (t : 'u) i c x v :
    finite i c x =>
    cond c v =>
    inv f z t i c x v =>
    exists n ,
      n \in (range 0 (out i c x)) /\
      v = (val i x n) /\
      t = foldr f z (lt i x n).
  proof.
    move => Hfin Hcond [n [/mem_range [le0n /ltzS /ler_eqVlt [eqnout|ltnout]] [->> ->>]]];
    exists n; split => //; apply/mem_range; split => // _.
    have //: false; move: eqnout Hcond => ->>; rewrite -(pmin_out _ _ _ Hfin); apply/negP.
    by move: (pmin_mem (ncond_val i c x) (finite_nsempty i c x _)).
  qed.

  lemma inv_in ['u] f (z : 'u) i c x :
    finite i c x =>
    inv f z z i c x x.
  proof.
    move => Hfin; exists 0; rewrite !val_iter // !iter0 //= (range_geq 0 0) //= rev_nil //=.
    rewrite -(pmin_out _ _ _ Hfin); apply/mem_range => //=; apply/ltzS.
    by apply ge0_pmin.
  qed.

  lemma inv_outP ['u] f z (t : 'u) i c x v :
    finite i c x =>
    ! cond c v =>
    inv f z t i c x v =>
    v = val i x (FOR.out i c x) /\
    t = foldr f z (lt i x (out i c x)).
  proof.
    move => Hfin Hncond [n [Hn_range [->> ->>]]].
    move: Hn_range; rewrite {1}rangeSr ?out_ge0 // mem_rcons /=; case => [->>|Hn_range].
    + by rewrite //=; apply foldr_perm_in.
    have:= (pmin_min _ n (finite_nsempty _ _ _ Hfin) _ Hncond).
    + by move/mem_range: Hn_range.
    by rewrite (FOR.pmin_out _ _ _ Hfin) => /lezNgt; move/mem_range: Hn_range => [_ ->].
  qed.

end FOLDR_FOR.



abstract theory RHL_FOR.

  clone import FOR as FOR1.
  clone import FOR as FOR2.

  op inv i1 c1 x1 v1 i2 x2 v2 =
    exists n ,
      n \in range 0 (FOR1.out i1 c1 x1 + 1) /\
      v1 = (FOR1.val i1 x1 n) /\
      v2 = (FOR2.val i2 x2 n).

  lemma inv_loop_post i1 c1 x1 v1 i2 c2 x2 v2 :
    FOR1.finite i1 c1 x1 =>
    FOR2.finite i2 c2 x2 =>
    FOR1.cond c1 v1 =>
    FOR2.cond c2 v2 =>
    inv i1 c1 x1 v1 i2 x2 v2 =>
    inv i1 c1 x1 (FOR1.incr i1 v1) i2 x2 (FOR2.incr i2 v2).
  proof.
    move => Hfin1 Hfin2 Hcond1 Hcond2 [n [Hn_range [->> ->>]]].
    move: Hn_range; rewrite {1}rangeSr ?FOR1.out_ge0 // mem_rcons /=; case => [->>|Hn_range].
    + have:= pmin_mem _ (FOR1.finite_nsempty _ _ _ Hfin1).
      by rewrite (FOR1.pmin_out _ _ _ Hfin1) /= => /negP; rewrite Hcond1.
    exists (n + 1); do!split.
    + apply/(range_incl _ 1 (out i1 c1 x1 + 1) _ _ _ _ _) => //.
      by move: (range_add _ 1 _ _ Hn_range).
    + by rewrite !val_iter ?addr_ge0 // ?iterS; move/mem_range: Hn_range.
    by rewrite !val_iter ?addr_ge0 // ?iterS; move/mem_range: Hn_range.
  qed.

  lemma inv_loopP i1 c1 x1 v1 i2 c2 x2 v2 :
    FOR1.finite i1 c1 x1 =>
    FOR2.finite i2 c2 x2 =>
    FOR1.cond c1 v1 =>
    FOR2.cond c2 v2 =>
    inv i1 c1 x1 v1 i2 x2 v2 =>
    exists n ,
      n \in (range 0 (FOR1.out i1 c1 x1)) /\
      v1 = (FOR1.val i1 x1 n) /\
      v2 = (FOR2.val i2 x2 n).
  proof.
    move => Hfin1 Hfin2 Hcond1 Hcond2 [n [/mem_range [le0n /ltzS /ler_eqVlt [eqnout|ltnout]] [->> ->>]]];
    exists n; split => //; apply/mem_range; split => // _.
    have //: false; move: eqnout Hcond1 => ->>; rewrite -(FOR1.pmin_out _ _ _ Hfin1); apply/negP.
    by move: (pmin_mem (ncond_val i1 c1 x1) (FOR1.finite_nsempty i1 c1 x1 _)).
  qed.

  lemma inv_in i1 c1 x1 i2 x2 :
    FOR1.finite i1 c1 x1 =>
    inv i1 c1 x1 x1 i2 x2 x2.
  proof.
    move => Hfin1; exists 0; rewrite !val_iter // !iter0 //=.
    rewrite -(FOR1.pmin_out _ _ _ Hfin1); apply/mem_range => //=; apply/ltzS.
    by apply ge0_pmin.
  qed.

  lemma inv_outP i1 c1 x1 v1 i2 c2 x2 v2 :
    FOR1.out i1 c1 x1 = FOR2.out i2 c2 x2 =>
    FOR1.finite i1 c1 x1 =>
    FOR2.finite i2 c2 x2 =>
    ! FOR1.cond c1 v1 =>
    inv i1 c1 x1 v1 i2 x2 v2 =>
    v1 = FOR1.val i1 x1 (FOR1.out i1 c1 x1) /\
    v2 = FOR2.val i2 x2 (FOR2.out i2 c2 x2).
  proof.
    move => Heq_out Hfin1 Hfin2 Hncond1 [n [Hn_range [->> ->>]]].
    move: Hn_range; rewrite {1}rangeSr ?FOR1.out_ge0 // mem_rcons /=; case => [->>|Hn_range].
    + by rewrite Heq_out.
    have:= (pmin_min _ n (FOR1.finite_nsempty _ _ _ Hfin1) _ Hncond1); first by move/mem_range: Hn_range.
    by rewrite (FOR1.pmin_out _ _ _ Hfin1) => /lezNgt; move/mem_range: Hn_range => [_ ->].
  qed.

end RHL_FOR.



abstract theory FOLDR_RHL_FOR.

  clone import FOLDR_FOR as FOLDR_FOR1.
  clone import FOLDR_FOR as FOLDR_FOR2.

  op inv ['u]
    f1 z1 (t1 : 'u) i1 c1 x1 v1
    f2 z2 (t2 : 'u) i2 x2 v2 =
    exists n ,
      n \in range 0 (FOLDR_FOR1.FOR.out i1 c1 x1 + 1) /\
      v1 = (FOLDR_FOR1.FOR.val i1 x1 n) /\
      v2 = (FOLDR_FOR2.FOR.val i2 x2 n) /\
      t1 = foldr f1 z1 (FOLDR_FOR1.lt i1 x1 n) /\
      t2 = foldr f2 z2 (FOLDR_FOR2.lt i2 x2 n).

  lemma inv_loop_post ['u]
    f1 z1 (t1 : 'u) i1 c1 x1 v1
    f2 z2 (t2 : 'u) i2 c2 x2 v2 :
    FOLDR_FOR1.FOR.finite i1 c1 x1 =>
    FOLDR_FOR2.FOR.finite i2 c2 x2 =>
    FOLDR_FOR1.FOR.cond c1 v1 =>
    FOLDR_FOR2.FOR.cond c2 v2 =>
    inv f1 z1 t1 i1 c1 x1 v1 f2 z2 t2 i2 x2 v2 =>
    inv
      f1 z1 (f1 v1 t1) i1 c1 x1 (FOLDR_FOR1.FOR.incr i1 v1)
      f2 z2 (f2 v2 t2) i2    x2 (FOLDR_FOR2.FOR.incr i2 v2).
  proof.
    move => Hfin1 Hfin2 Hcond1 Hcond2 [n [Hn_range [->> [->> [->> ->>]]]]].
    move: Hn_range; rewrite {1}rangeSr ?FOLDR_FOR1.FOR.out_ge0 // mem_rcons /=; case => [->>|Hn_range].
    + have:= pmin_mem _ (FOLDR_FOR1.FOR.finite_nsempty _ _ _ Hfin1).
      by rewrite (FOLDR_FOR1.FOR.pmin_out _ _ _ Hfin1) /= => /negP; rewrite Hcond1.
    exists (n + 1); do!split.
    + apply/(range_incl _ 1 (FOLDR_FOR1.FOR.out i1 c1 x1 + 1) _ _ _ _ _) => //.
      by move: (range_add _ 1 _ _ Hn_range).
    + by rewrite !FOLDR_FOR1.FOR.val_iter ?addr_ge0 // ?iterS; move/mem_range: Hn_range.
    + by rewrite !FOLDR_FOR2.FOR.val_iter ?addr_ge0 // ?iterS; move/mem_range: Hn_range.
    + by rewrite rangeSr ?map_rcons ?rev_rcons /(\o) //=; move/mem_range: Hn_range.
    by rewrite rangeSr ?map_rcons ?rev_rcons /(\o) //=; move/mem_range: Hn_range.
  qed.

  lemma inv_loopP  ['u]
    f1 z1 (t1 : 'u) i1 c1 x1 v1
    f2 z2 (t2 : 'u) i2 c2 x2 v2 :
    FOLDR_FOR1.FOR.finite i1 c1 x1 =>
    FOLDR_FOR2.FOR.finite i2 c2 x2 =>
    FOLDR_FOR1.FOR.cond c1 v1 =>
    FOLDR_FOR2.FOR.cond c2 v2 =>
    inv f1 z1 t1 i1 c1 x1 v1 f2 z2 t2 i2 x2 v2 =>
    exists n ,
      n \in (range 0 (FOLDR_FOR1.FOR.out i1 c1 x1)) /\
      v1 = (FOLDR_FOR1.FOR.val i1 x1 n) /\
      v2 = (FOLDR_FOR2.FOR.val i2 x2 n) /\
      t1 = foldr f1 z1 (FOLDR_FOR1.lt i1 x1 n) /\
      t2 = foldr f2 z2 (FOLDR_FOR2.lt i2 x2 n).
  proof.
    move => Hfin1 Hfin2 Hcond1 Hcond2 [n [/mem_range [le0n /ltzS /ler_eqVlt [eqnout|ltnout]] [->> [->> [->> ->>]]]]];
    exists n; split => //; apply/mem_range; split => // _.
    have //: false; move: eqnout Hcond1 => ->>; rewrite -(FOLDR_FOR1.FOR.pmin_out _ _ _ Hfin1); apply/negP.
    by move: (pmin_mem (FOLDR_FOR1.FOR.ncond_val i1 c1 x1) (FOLDR_FOR1.FOR.finite_nsempty i1 c1 x1 _)).
  qed.

  lemma inv_in ['u]
    f1 (z1 : 'u) i1 c1 x1
    f2 (z2 : 'u) i2 x2 :
    FOLDR_FOR1.FOR.finite i1 c1 x1 =>
    inv f1 z1 z1 i1 c1 x1 x1 f2 z2 z2 i2 x2 x2.
  proof.
    move => Hfin1; exists 0; rewrite FOLDR_FOR1.FOR.val_iter // FOLDR_FOR2.FOR.val_iter //.
    rewrite !iter0 //= (range_geq 0 0) //= rev_nil //=.
    rewrite -(FOLDR_FOR1.FOR.pmin_out _ _ _ Hfin1) rev_nil /=; apply/mem_range => //=; apply/ltzS.
    by apply ge0_pmin.
  qed.

  lemma inv_outP ['u]
    f1 z1 (t1 : 'u) i1 c1 x1 v1
    f2 z2 (t2 : 'u) i2 c2 x2 v2 :
    FOLDR_FOR1.FOR.out i1 c1 x1 = FOLDR_FOR2.FOR.out i2 c2 x2 =>
    FOLDR_FOR1.FOR.finite i1 c1 x1 =>
    FOLDR_FOR2.FOR.finite i2 c2 x2 =>
    ! FOLDR_FOR1.FOR.cond c1 v1 =>
    inv f1 z1 t1 i1 c1 x1 v1 f2 z2 t2 i2 x2 v2 =>
    v1 = FOLDR_FOR1.FOR.val i1 x1 (FOLDR_FOR1.FOR.out i1 c1 x1) /\
    v2 = FOLDR_FOR2.FOR.val i2 x2 (FOLDR_FOR2.FOR.out i2 c2 x2) /\
    t1 = foldr f1 z1 (FOLDR_FOR1.lt i1 x1 (FOLDR_FOR1.FOR.out i1 c1 x1)) /\
    t2 = foldr f2 z2 (FOLDR_FOR2.lt i2 x2 (FOLDR_FOR2.FOR.out i2 c2 x2)).
  proof.
    move => Heq_out Hfin1 Hfin2 Hncond1 [n [Hn_range [->> [->> [->> ->>]]]]].
    move: Hn_range; rewrite {1}rangeSr ?FOLDR_FOR1.FOR.out_ge0 // mem_rcons /=; case => [->>|Hn_range].
    + by rewrite Heq_out.
    have:= (pmin_min _ n (FOLDR_FOR1.FOR.finite_nsempty _ _ _ Hfin1) _ Hncond1).
    + by move/mem_range: Hn_range.
    by rewrite (FOLDR_FOR1.FOR.pmin_out _ _ _ Hfin1) => /lezNgt; move/mem_range: Hn_range => [_ ->].
  qed.

end FOLDR_RHL_FOR.



clone FOLDR_RHL_FOR as FOLDR_RHL_FOR_NAT_DIV_GE_MUL_LE with
  theory FOLDR_FOR1.FOR <- FOR_NAT_DIV_GE ,
  theory FOLDR_FOR2.FOR <- FOR_NAT_MUL_LE.



clone FOLDR_RHL_FOR as FOLDR_RHL_FOR_INT_ADD_LT2 with
  theory FOLDR_FOR1.FOR <- FOR_INT_ADD_LT,
  theory FOLDR_FOR2.FOR <- FOR_INT_ADD_LT.
