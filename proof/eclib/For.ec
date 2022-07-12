require import AllCore StdOrder IntDiv List RealExp.
(*---*) import IntOrder.


(*Abstract theory to deal with for loops in HL.*)
abstract theory HL_FOR.

  (*Loop increment and loop body.*)
  type in_t, state_t.

  (*The while loop condition.*)
  op cond : in_t -> bool.
  (*If it is Some n, then n is the number of times the loop will run.*)
  op out : int option.
  (*The value of the loop increment after n runs.*)
  op val : int -> in_t.
  (*Some predicate about the constants.*)
  op P : bool.
  (*Some predicate about the number of loop runs, the loop increment and the loop body.*)
  op Q : int -> in_t -> state_t -> bool.

  (*The invariant that must be used whith HL's while tactic.*)
  (*v is the loop increment, s is the loop body, P depends only of constants,
    Q depends of the number of loop runs, the loop increment and the state.*)
  op inv v s =
    P /\
    oapp
      (fun n =>
        exists k ,
          0 <= k <= n /\
          (v = val k) /\
          Q k v s)
      true out.

  op context v =
    P /\
    oapp
      (fun n =>
        exists k ,
          0 <= k < n /\
          (v = val k) )
      true out.

  axiom outP :
    oapp
      (fun n =>
        0 <= n /\
        (forall k , k \in range 0 n => cond (val k)) /\
        ! cond (val n))
      true out.

  lemma inv_const v s :
    inv v s => P.
  proof. by move => []. qed.

  lemma invP v s :
    (inv v s /\ cond v) =>
    P /\
    oapp
      (fun n =>
        exists k ,
          0 <= k < n /\
          (v = val k) /\
          Q k v s)
      true out.
  proof.
    rewrite /inv; case: out outP => [|n] //= [_ [_ Ncond]].
    move => [[-> [k [[le0k lekn] [->> Qk]]]] condv] /=; exists k.
    by rewrite le0k Qk /=; move/ler_eqVlt: lekn => [->>|->].
  qed.

  lemma inv_context v s :
    (inv v s /\ cond v) =>
    context v.
  proof.
    rewrite /inv /context; case: out outP => [|n] //= [_ [_ Ncond]].
    move => [[-> [k [[le0k lekn] [->> Qk]]]] condv] /=; exists k.
    by rewrite le0k /=; move/ler_eqVlt: lekn => [->>|->].
  qed.

  lemma inv_in v v' s s' :
    (P =>
     forall n ,
      out = Some n =>
      forall k ,
        k \in range 0 n =>
        v = val k =>
        Q k (val k) s =>
        v' = val (k + 1) /\
        Q (k + 1) (val (k + 1)) s') =>
    (inv v s /\ cond v) =>
    inv v' s'.
  proof.
    rewrite /inv; case: out outP => [|n] //= [_ [_ Ncond]] imp_P [[P_ exists_] cond_v].
    move: imp_P exists_; rewrite P_ /= => /(_ n) /= forall_Q [k [[le_0_k le_k_n] [->> Q_k]]].
    exists (k + 1); move: (forall_Q k); rewrite Q_k /= mem_range le_0_k /=.
    by rewrite -ltzE addr_ge0 //=; move: le_k_n => /ler_eqVlt [->>|->].
  qed.

  lemma inv_in_outerloop R v v' s s' :
    (P =>
     forall n ,
      out = Some n =>
      forall k ,
        k \in range 0 n =>
        v = val k =>
        Q k (val k) s =>
        v' = val (k + 1) /\
        (R (val k) s' => Q (k + 1) (val (k + 1)) s')) =>
    (inv v s /\ cond v) =>
    R v s' =>
    inv v' s'.
  proof.
    rewrite /inv; case: out outP => [|n] //= [_ [_ Ncond]] imp_P [[P_ exists_] cond_v] R_.
    move: imp_P exists_; rewrite P_ /= => /(_ n) /= forall_Q [k [[le_0_k le_k_n] [->> Q_k]]].
    exists (k + 1); move: (forall_Q k); rewrite Q_k /= mem_range le_0_k /=.
    rewrite -ltzE addr_ge0 //=; move: le_k_n => /ler_eqVlt [->>|->] //=.
    by move => [->>] //= ->.
  qed.

  lemma inv_0 v s :
    P =>
    v = val 0 =>
    Q 0 v s =>
    inv v s.
  proof.
    move => P_ ->> Q_0; rewrite /inv P_ /=.
    by case: out outP => [|n] //= [? _]; exists 0 => /=; split.
  qed.

  lemma inv_out R :
    (P =>
     forall s,
      oapp
        (fun n =>
         ! cond (val n) /\
         Q n (val n) s =>
         R (val n) s)
        false out) =>
    forall v s ,
      ! cond v =>
      inv v s =>
      R v s.
  proof.
    move => imp_post v s Ncond_v; rewrite /inv => -[P_]; move: imp_post.
    rewrite P_ /=; case: out outP => [|n] //=.
    move => [le_0_n [cond_k Ncond_n]] imp_post [k [[le_0_k le_k_n] [->> Q_n]]].
    case/ler_eqVlt: le_k_n => [->>|lt_k_n]; first by apply/imp_post; split.
    by move: Ncond_v; rewrite (cond_k k) // mem_range; split.
  qed.

end HL_FOR.

(*Abstract theory to deal with for loops in RHL.*)
abstract theory RHL_FOR.

  clone import HL_FOR as FOR1.
  clone import HL_FOR as FOR2.

  type state_t.
  op P : bool.
  op Q : int -> FOR1.in_t -> FOR2.in_t -> state_t -> bool.

  op inv v1 v2 (s : state_t) =
    let o = FOR2.out in
    P /\
    oapp
      (fun n =>
        exists k ,
          0 <= k <= n /\
          (v1 = FOR1.val k) /\
          (v2 = FOR2.val k) /\
          Q k v1 v2 s)
      true FOR1.out.

  op context v1 v2 =
    let o = FOR2.out in
    P /\
    oapp
      (fun n =>
        exists k ,
          0 <= k < n /\
          (v1 = FOR1.val k) /\
          (v2 = FOR2.val k) )
      true FOR1.out.

  axiom eq_out :
    P =>
    exists n ,
      FOR1.out = Some n /\
      FOR2.out = Some n.

  lemma inv_const v1 v2 s :
    inv v1 v2 s => P.
  proof. by move => []. qed.

  lemma invP v1 v2 s :
    (inv v1 v2 s /\ FOR1.cond v1 /\ FOR2.cond v2) =>
    P /\
    oapp
      (fun n =>
        exists k ,
          0 <= k < n /\
          (v1 = FOR1.val k) /\
          (v2 = FOR2.val k) /\
          Q k v1 v2 s)
      true FOR1.out.
  proof.
    rewrite /inv => -[[-> oapp_out] [cond1 cond2]] /=; move: oapp_out.
    case: FOR1.out FOR1.outP => [|n] //= [_ [_ Ncond1]].
    move => [k [[le0k lekn] [->> [->> Qk]]]].
    by exists k; rewrite le0k Qk /=; move/ler_eqVlt: lekn => [<<-|->].
  qed.

  lemma inv_context v1 v2 s :
    (inv v1 v2 s /\ FOR1.cond v1 /\ FOR2.cond v2) =>
    context v1 v2.
  proof.
    rewrite /inv /context => -[[-> oapp_out] [cond1 cond2]] /=; move: oapp_out.
    case: FOR1.out FOR1.outP => [|n] //= [_ [_ Ncond1]].
    move => [k [[le0k lekn] [->> [->> Qk]]]].
    by exists k; rewrite le0k /=; move/ler_eqVlt: lekn => [<<-|->].
  qed.

  lemma inv_in v1 v2 v1' v2' s s' :
    (P =>
     forall n ,
       FOR1.out = Some n =>
       forall k ,
         k \in range 0 n =>
         v1 = FOR1.val k =>
         v2 = FOR2.val k =>
         Q k (FOR1.val k) (FOR2.val k) s =>
         v1' = FOR1.val (k + 1) /\
         v2' = FOR2.val (k + 1) /\
         Q (k + 1) (FOR1.val (k + 1)) (FOR2.val (k + 1)) s') =>
    (inv v1 v2 s /\ FOR1.cond v1 /\ FOR2.cond v2) =>
    inv v1' v2' s' /\ (FOR1.cond v1' <=> FOR2.cond v2').
  proof.
    rewrite /inv => imp_ [[P_ exists_] []]; move: imp_ exists_.
    case: FOR1.out (eq_out P_) FOR1.outP FOR2.outP => [|n] //= [? [<<- ->]] /=.
    move => [_ [imp_range_cond1 Ncond1]] [_ [imp_range_cond2 Ncond2]] imp_P exists_ cond_v1 cond_v2.
    move: imp_P exists_; rewrite P_ /= => /(_ n) /= forall_Q [k [[le_0_k le_k_n] [->> [->> Q_k]]]].
    move: (forall_Q k); rewrite Q_k /= mem_range le_0_k /=; move: le_k_n => /ler_eqVlt [->>|lt_k_n] //=.
    rewrite lt_k_n; move => [->> [->> Q_]]; split; [by exists (k + 1); rewrite -ltzE addr_ge0 //=|].
    move: lt_k_n (imp_range_cond1 (k + 1)) (imp_range_cond2 (k + 1)) Ncond1 Ncond2.
    by rewrite !mem_range addr_ge0 //= ltzE => /ler_eqVlt [<<-|->].
  qed.

  lemma inv_in_inv v1 v2 v1' v2' s s' :
    (P =>
     forall n ,
       FOR1.out = Some n =>
       forall k ,
         k \in range 0 n =>
         v1 = FOR1.val k =>
         v2 = FOR2.val k =>
         Q k (FOR1.val k) (FOR2.val k) s =>
         v1' = FOR1.val (k + 1) /\
         v2' = FOR2.val (k + 1) /\
         Q (k + 1) (FOR1.val (k + 1)) (FOR2.val (k + 1)) s') =>
    (inv v1 v2 s /\ FOR1.cond v1 /\ FOR2.cond v2) =>
    inv v1' v2' s'.
  proof. by move => imp_P inv_; case: (inv_in _ _ _ _ _ _ imp_P inv_). qed.

  lemma inv_in_outerloop R v1 v2 v1' v2' s s' :
    (P =>
     forall n ,
       FOR1.out = Some n =>
       forall k ,
         k \in range 0 n =>
         v1 = FOR1.val k =>
         v2 = FOR2.val k =>
         Q k (FOR1.val k) (FOR2.val k) s =>
         v1' = FOR1.val (k + 1) /\
         v2' = FOR2.val (k + 1) /\
         ( R (FOR1.val k) (FOR2.val k) s' =>
           Q (k + 1) (FOR1.val (k + 1)) (FOR2.val (k + 1)) s') ) =>
    (inv v1 v2 s /\ FOR1.cond v1 /\ FOR2.cond v2) =>
    R v1 v2 s' =>
    inv v1' v2' s' /\ (FOR1.cond v1' <=> FOR2.cond v2').
  proof.
    rewrite /inv => imp_ [[P_ exists_] []]; move: imp_ exists_.
    case: FOR1.out (eq_out P_) FOR1.outP FOR2.outP => [|n] //= [? [<<- ->]] /=.
    move => [_ [imp_range_cond1 Ncond1]] [_ [imp_range_cond2 Ncond2]].
    move => imp_P exists_ cond_v1 cond_v2 R_.
    move: imp_P exists_; rewrite P_ /= => /(_ n) /= forall_Q.
    move => [k [[le_0_k le_k_n] [->> [->> Q_k]]]].
    move: (forall_Q k); rewrite Q_k /= mem_range le_0_k /=.
    move: le_k_n => /ler_eqVlt [->>|lt_k_n] //=.
    rewrite lt_k_n; move => [->> [->> Q_]]; split.
    + by exists (k + 1); rewrite -ltzE addr_ge0 //=; split => //; apply/Q_.
    move: lt_k_n (imp_range_cond1 (k + 1)) (imp_range_cond2 (k + 1)) Ncond1 Ncond2.
    by rewrite !mem_range addr_ge0 //= ltzE => /ler_eqVlt [<<-|->].
  qed.

  lemma inv_in_outerloop_inv R v1 v2 v1' v2' s s' :
    (P =>
     forall n ,
       FOR1.out = Some n =>
       forall k ,
         k \in range 0 n =>
         v1 = FOR1.val k =>
         v2 = FOR2.val k =>
         Q k (FOR1.val k) (FOR2.val k) s =>
         v1' = FOR1.val (k + 1) /\
         v2' = FOR2.val (k + 1) /\
         ( R (FOR1.val k) (FOR2.val k) s' =>
           Q (k + 1) (FOR1.val (k + 1)) (FOR2.val (k + 1)) s') ) =>
    (inv v1 v2 s /\ FOR1.cond v1 /\ FOR2.cond v2) =>
    R v1 v2 s' =>
    inv v1' v2' s'.
  proof. by move => imp_P inv_ R_; case: (inv_in_outerloop _ _ _ _ _ _ _ imp_P inv_ R_). qed.

  lemma inv_0 v1 v2 s :
    P =>
    v1 = FOR1.val 0 =>
    v2 = FOR2.val 0 =>
    Q 0 v1 v2 s =>
    inv v1 v2 s /\
    (FOR1.cond v1 <=> FOR2.cond v2).
  proof.
    move => P_ ->> ->> Q_0; move: eq_out FOR1.outP FOR2.outP; rewrite /inv P_ /=.
    move => [n [-> ->]] /= [le_0_n]; rewrite le_0_n /=; move/ler_eqVlt: le_0_n.
    move => [<<- [_ ->] [_ ->] /=|lt_0_n]; [by exists 0|].
    move => [/(_ 0)]; rewrite mem_range lt_0_n //= => -> _.
    move => [/(_ 0)]; rewrite mem_range lt_0_n //= => -> _.
    by exists 0; rewrite /= ltzW.
  qed.

  lemma inv_0_inv v1 v2 s :
    P =>
    v1 = FOR1.val 0 =>
    v2 = FOR2.val 0 =>
    Q 0 v1 v2 s =>
    inv v1 v2 s.
  proof. by move => P_ eq1 eq2 Q_; case: (inv_0 _ _ _ P_ eq1 eq2 Q_). qed.

  lemma inv_out R :
    (P =>
     forall s,
      oapp
        (fun n =>
         ! FOR1.cond (FOR1.val n) /\
         ! FOR2.cond (FOR2.val n) /\
         Q n (FOR1.val n) (FOR2.val n) s =>
         R (FOR1.val n) (FOR2.val n) s)
        false FOR1.out) =>
    forall v1 v2 s ,
      ! FOR1.cond v1 =>
      ! FOR2.cond v2 =>
      inv v1 v2 s =>
      R v1 v2 s.
  proof.
    move => imp_post v1 v2 s Ncond_v1 Ncond_v2; rewrite /inv => -[P_]; move: imp_post.
    rewrite P_ /=; case: FOR1.out FOR1.outP => [|n] //=.
    move => [le_0_n [cond_k Ncond_n]] imp_post [k [[le_0_k le_k_n] [->> [->> Q_n]]]].
    case/ler_eqVlt: le_k_n => [->>|lt_k_n]; first by apply/imp_post; split.
    by move: Ncond_v1; rewrite (cond_k k) // mem_range; split.
  qed.

end RHL_FOR.


(*Intermediate abstract theories to deal with for loops in HL or RHL.*)
theory FOR_INT_ADD_LT.

  type _state_t.
  op c, i , x : int.

  abbrev a_out =
    if 0 < i
    then Some (if c <= x
               then 0
               else (c - x) %\ i)
    else None.

  clone include HL_FOR with
    type in_t <= int,
    type state_t <= _state_t,
    op cond <= (fun (v : int) => v < c),
    op out <= a_out,
    op val <= (fun n : int => x + n * i)
    proof *.

    realize outP.
    proof.
      case (c <= x) => [le_c_x|/ltrNge lt_x_c]; (case (0 < i) => [lt_0_i|] //=).
      + by rewrite range_geq //; split => [k|]; [rewrite in_nil|apply/lerNgt].
      split; [by apply/ltrW/ltz_NdivNLR; rewrite //= subr_gt0|].
      split; [by move => k /mem_range [? ?]; apply/ltr_subr_addl/ltz_NdivNLR|].
      by apply/lerNgt/ler_subl_addl/lez_ceil/gtr_eqF.
    qed.

end FOR_INT_ADD_LT.


abstract theory FOR_NAT_MUL_LE.

  type _state_t.
  op c, i , x : int.

  abbrev a_out =
    if (c < x) \/ (1 < i /\ (0 < x))
    then Some (if (c < x)
               then 0
               else ilog i (c %/ x) + 1)
    else None.

  clone include HL_FOR with
    type in_t <= int,
    type state_t <= _state_t,
    op cond   <= (fun v : int => v <= c),
    op out    <= a_out,
    op val    <= (fun n : int => x * (i ^ n))
    proof *.

    realize outP.
    proof.
      case: (c < x) => [lt_c_x|/lerNgt le_x_c] /=.
      + by rewrite range_geq // expr0 /= -ltrNge.
      case: (1 < i /\ 0 < x) => [[lt_1_i lt_0_x]|//]; split; [|split].
      + by apply/addr_ge0 => //; apply/ilog_ge0; [apply/ltrW|rewrite lez_divRL].
      + move => k mem_k_range; rewrite mulrC -lez_divRL //.
        apply/(ler_trans (i ^ (ilog i (c %/ x)))).
        - rewrite -(ger0_norm (i ^ k)); [by rewrite expr_ge0 ltzW ltzE ltzW|].
          rewrite -(ger0_norm (i ^ ilog _ _)); [by rewrite expr_ge0 ltzW ltzE ltzW|].
          rewrite dvdz_le; [by rewrite gtr_eqF // expr_gt0 ltzE ltzW|].
          by rewrite dvdz_exp2l; move: mem_k_range; rewrite mem_range ltzS.
        by case: (ilogP i (c %/ x) lt_1_i _); rewrite lez_divRL.
      apply/ltrNge; rewrite mulrC -ltz_divLR //.
      by case: (ilogP i (c %/ x) lt_1_i _); rewrite lez_divRL.
    qed.

end FOR_NAT_MUL_LE.


theory FOR_NAT_DIV_GE.

  type _state_t.
  op c, i , x : int.

  abbrev a_out =
    if (x < c) \/ (1 < i /\ (0 < c))
    then Some (if (x < c)
               then 0
               else ilog i (x %/ c) + 1)
    else None.

  clone include HL_FOR with
    type in_t <= int,
    type state_t <= _state_t,
    op cond   <= (fun v : int => c <= v),
    op out    <= a_out,
    op val    <= (fun k =>
                  if 0 <= i
                  then x %/ (i ^ k)
                  else iter k (transpose (%/)%Int i) x)
    proof *.

    realize outP.
    proof.
      case: (x < c) => [lt_x_c|/lerNgt le_c_x] /=.
      + by rewrite range_geq //= -ltrNge expr0 iter0.
      case: (1 < i /\ 0 < c) => [[lt_1_i lt_0_c]|] //.
      rewrite -ltrNge; have ->/=: 0 <= i by rewrite ltzW ltzE ltzW.
      split; [by rewrite addr_ge0 // ilog_ge0; [rewrite ltzW|rewrite lez_divRL]|].
      split.
      + move => k /mem_range [le_0_k /ltzS le_k_ilog].
        rewrite lez_divRL; [by rewrite expr_gt0 ltzE ltzW|].
        rewrite mulrC -lez_divRL //; apply/(ler_trans (i ^ (ilog i (x %/ c)))).
        - by apply ler_weexpn2l; [rewrite ltzW|split].
      by case: (ilogP i (x %/ c) lt_1_i _); rewrite lez_divRL.
      rewrite ltz_divLR; [by rewrite expr_gt0 ltzE ltzW|].
      rewrite mulrC -ltz_divLR //.
      by case: (ilogP i (x %/ c) lt_1_i _); rewrite lez_divRL.
    qed.

end FOR_NAT_DIV_GE.


(*Concrete theories to deal with for loops in HL.*)
theory HL_FOR_INT_ADD_LT.
  section.

  declare type __state_t.
  declare op c, i , x : int.
  declare op P : bool.
  declare op Q : int -> int -> __state_t -> bool.

  clone include FOR_INT_ADD_LT with
    type _state_t <= __state_t,
    op c <- c,
    op i <- i,
    op x <- x,
    op P <- P,
    op Q <- Q.

  end section.
end HL_FOR_INT_ADD_LT.


theory HL_FOR_NAT_MUL_LE.
  section.

  declare type __state_t.
  declare op c, i , x : int.
  declare op P : bool.
  declare op Q : int -> int -> __state_t -> bool.

  clone include FOR_NAT_MUL_LE with
    type _state_t <= __state_t,
    op c <- c,
    op i <- i,
    op x <- x,
    op P <- P,
    op Q <- Q.

  end section.
end HL_FOR_NAT_MUL_LE.


theory HL_FOR_NAT_DIV_GE.
  section.

  declare type __state_t.
  declare op c, i , x : int.
  declare op P : bool.
  declare op Q : int -> int -> __state_t -> bool.

  clone include FOR_NAT_DIV_GE with
    type _state_t <= __state_t,
    op c <- c,
    op i <- i,
    op x <- x,
    op P <- P,
    op Q <- Q.

  end section.
end HL_FOR_NAT_DIV_GE.


(*Concrete theories to deal with for loops in RHL.*)
theory RHL_FOR_INT_ADD_LT2.
  section.

  declare type _state_t.
  declare op c1, c2, i1, i2 , x1, x2 : int.
  declare op P : bool.
  declare op Q : int -> int -> int -> _state_t -> bool.
  declare axiom _eq_out :
    P =>
    ((0 < i1) /\ (0 < i2) /\
     ((if c1 <= x1 then 0 else (c1 - x1) %\ i1) =
      (if c2 <= x2 then 0 else (c2 - x2) %\ i2))).

  clone FOR_INT_ADD_LT as FOR1_ with
    type _state_t <- unit,
    op c <- c1,
    op i <- i1,
    op x <- x1.

  clone FOR_INT_ADD_LT as FOR2_ with
    type _state_t <- unit,
    op c <- c2,
    op i <- i2,
    op x <- x2.

  clone include RHL_FOR with
    theory FOR1 <- FOR1_,
    theory FOR2 <- FOR2_,
    type state_t <- _state_t,
    op P <- P,
    op Q <- Q
  proof *.

  realize eq_out.
  proof.
    move => P_; case: (_eq_out P_) => -> [-> ->] /=.
    by exists (if c2 <= x2 then 0 else (c2 - x2) %\ i2).
  qed.

  end section.
end RHL_FOR_INT_ADD_LT2.


theory RHL_FOR_NAT_DIV_GE_INT_ADD_LT.
  section.

  declare type _state_t.
  declare op c1, c2, i1, i2 , x1, x2 : int.
  declare op P : bool.
  declare op Q : int -> int -> int -> _state_t -> bool.
  declare axiom _eq_out :
    P =>
    (((x1 < c1) \/ (1 < i1 /\ (0 < c1))) /\
     (0 < i2) /\
     ((if (x1 < c1) then 0 else ilog i1 (x1 %/ c1) + 1) =
      (if c2 <= x2 then 0 else (c2 - x2) %\ i2))).

  clone FOR_NAT_DIV_GE as FOR1_ with
    type _state_t <- unit,
    op c <- c1,
    op i <- i1,
    op x <- x1.

  clone FOR_INT_ADD_LT as FOR2_ with
    type _state_t <- unit,
    op c <- c2,
    op i <- i2,
    op x <- x2.

  clone include RHL_FOR with
    theory FOR1 <- FOR1_,
    theory FOR2 <- FOR2_,
    type state_t <- _state_t,
    op P <- P,
    op Q <- Q
  proof *.

  realize eq_out.
  proof.
    move => P_; case: (_eq_out P_) => -> [-> ->] /=.
    by exists (if c2 <= x2 then 0 else (c2 - x2) %\ i2).
  qed.

  end section.
end RHL_FOR_NAT_DIV_GE_INT_ADD_LT.


theory RHL_FOR_NAT_MUL_LE_INT_ADD_LT.
  section.

  declare type _state_t.
  declare op c1, c2, i1, i2 , x1, x2 : int.
  declare op P : bool.
  declare op Q : int -> int -> int -> _state_t -> bool.
  declare axiom _eq_out :
    P =>
    (((c1 < x1) \/ (1 < i1 /\ (0 < x1))) /\
     (0 < i2) /\
     ((if (c1 < x1) then 0 else ilog i1 (c1 %/ x1) + 1) =
      (if c2 <= x2 then 0 else (c2 - x2) %\ i2))).

  clone FOR_NAT_MUL_LE as FOR1_ with
    type _state_t <- unit,
    op c <- c1,
    op i <- i1,
    op x <- x1.

  clone FOR_INT_ADD_LT as FOR2_ with
    type _state_t <- unit,
    op c <- c2,
    op i <- i2,
    op x <- x2.

  clone include RHL_FOR with
    theory FOR1 <- FOR1_,
    theory FOR2 <- FOR2_,
    type state_t <- _state_t,
    op P <- P,
    op Q <- Q
  proof *.

  realize eq_out.
  proof.
    move => P_; case: (_eq_out P_) => -> [-> ->] /=.
    by exists (if c2 <= x2 then 0 else (c2 - x2) %\ i2).
  qed.

  end section.
end RHL_FOR_NAT_MUL_LE_INT_ADD_LT.


theory RHL_FOR_NAT_DIV_GE2.
  section.

  declare type _state_t.
  declare op c1, c2, i1, i2 , x1, x2 : int.
  declare op P : bool.
  declare op Q : int -> int -> int -> _state_t -> bool.
  declare axiom _eq_out :
    P =>
    (((x1 < c1) \/ (1 < i1 /\ (0 < c1))) /\
     ((x2 < c2) \/ (1 < i2 /\ (0 < c2))) /\
     ((if (x1 < c1) then 0 else ilog i1 (x1 %/ c1) + 1) =
      (if (x2 < c2) then 0 else ilog i2 (x2 %/ c2) + 1))).

  clone FOR_NAT_DIV_GE as FOR1_ with
    type _state_t <- unit,
    op c <- c1,
    op i <- i1,
    op x <- x1.

  clone FOR_NAT_DIV_GE as FOR2_ with
    type _state_t <- unit,
    op c <- c2,
    op i <- i2,
    op x <- x2.

  clone include RHL_FOR with
    theory FOR1 <- FOR1_,
    theory FOR2 <- FOR2_,
    type state_t <- _state_t,
    op P <- P,
    op Q <- Q
  proof *.

  realize eq_out.
  proof.
    move => P_; case: (_eq_out P_) => -> [-> ->] /=.
    by exists (if (x2 < c2) then 0 else ilog i2 (x2 %/ c2) + 1).
  qed.

  end section.
end RHL_FOR_NAT_DIV_GE2.


theory RHL_FOR_NAT_MUL_LE2.
  section.

  declare type _state_t.
  declare op c1, c2, i1, i2 , x1, x2 : int.
  declare op P : bool.
  declare op Q : int -> int -> int -> _state_t -> bool.
  declare axiom _eq_out :
    P =>
    (((c1 < x1) \/ (1 < i1 /\ (0 < x1))) /\
     ((c2 < x2) \/ (1 < i2 /\ (0 < x2))) /\
     ((if (c1 < x1) then 0 else ilog i1 (c1 %/ x1) + 1) =
      (if (c2 < x2) then 0 else ilog i2 (c2 %/ x2) + 1))).

  clone FOR_NAT_MUL_LE as FOR1_ with
    type _state_t <- unit,
    op c <- c1,
    op i <- i1,
    op x <- x1.

  clone FOR_NAT_MUL_LE as FOR2_ with
    type _state_t <- unit,
    op c <- c2,
    op i <- i2,
    op x <- x2.

  clone include RHL_FOR with
    theory FOR1 <- FOR1_,
    theory FOR2 <- FOR2_,
    type state_t <- _state_t,
    op P <- P,
    op Q <- Q
  proof *.

  realize eq_out.
  proof.
    move => P_; case: (_eq_out P_) => -> [-> ->] /=.
    by exists (if c2 < x2 then 0 else ilog i2 (c2 %/ x2) + 1).
  qed.

  end section.
end RHL_FOR_NAT_MUL_LE2.


theory RHL_FOR_NAT_DIV_GE_MUL_LE.
  section.

  declare type _state_t.
  declare op c1, c2, i1, i2 , x1, x2 : int.
  declare op P : bool.
  declare op Q : int -> int -> int -> _state_t -> bool.
  declare axiom _eq_out :
    P =>
    (((x1 < c1) \/ (1 < i1 /\ (0 < c1))) /\
     ((c2 < x2) \/ (1 < i2 /\ (0 < x2))) /\
     ((if (x1 < c1) then 0 else ilog i1 (x1 %/ c1) + 1) =
      (if (c2 < x2) then 0 else ilog i2 (c2 %/ x2) + 1))).

  clone FOR_NAT_DIV_GE as FOR1_ with
    type _state_t <- unit,
    op c <- c1,
    op i <- i1,
    op x <- x1.

  clone FOR_NAT_MUL_LE as FOR2_ with
    type _state_t <- unit,
    op c <- c2,
    op i <- i2,
    op x <- x2.

  clone include RHL_FOR with
    theory FOR1 <- FOR1_,
    theory FOR2 <- FOR2_,
    type state_t <- _state_t,
    op P <- P,
    op Q <- Q
  proof *.

  realize eq_out.
  proof.
    move => P_; case: (_eq_out P_) => -> [-> ->] /=.
    by exists (if c2 < x2 then 0 else ilog i2 (c2 %/ x2) + 1).
  qed.

  end section.
end RHL_FOR_NAT_DIV_GE_MUL_LE.


theory RHL_FOR_NAT_MUL_LE_DIV_GE.
  section.

  declare type _state_t.
  declare op c1, c2, i1, i2 , x1, x2 : int.
  declare op P : bool.
  declare op Q : int -> int -> int -> _state_t -> bool.
  declare axiom _eq_out :
    P =>
    (((c1 < x1) \/ (1 < i1 /\ (0 < x1))) /\
     ((x2 < c2) \/ (1 < i2 /\ (0 < c2))) /\
     ((if (c1 < x1) then 0 else ilog i1 (c1 %/ x1) + 1) =
      (if (x2 < c2) then 0 else ilog i2 (x2 %/ c2) + 1))).

  clone FOR_NAT_MUL_LE as FOR1_ with
    type _state_t <- unit,
    op c <- c1,
    op i <- i1,
    op x <- x1.

  clone FOR_NAT_DIV_GE as FOR2_ with
    type _state_t <- unit,
    op c <- c2,
    op i <- i2,
    op x <- x2.

  clone include RHL_FOR with
    theory FOR1 <- FOR1_,
    theory FOR2 <- FOR2_,
    type state_t <- _state_t,
    op P <- P,
    op Q <- Q
  proof *.

  realize eq_out.
  proof.
    move => P_; case: (_eq_out P_) => -> [-> ->] /=.
    by exists (if x2 < c2 then 0 else ilog i2 (x2 %/ c2) + 1).
  qed.

  end section.
end RHL_FOR_NAT_MUL_LE_DIV_GE.
