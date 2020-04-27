require import Core Int IntDiv IntExtra Ring StdOrder.
import Ring.IntID IntOrder.

op ceil a b = -((-a)%/b).

lemma ceilP a b :
  0 < b =>
  a <= b * (ceil a b) < a + b.
proof.
  move => ltz0b.
  rewrite /ceil mulrN. (*FIXME*)
  split.
  + rewrite - subz_le0 oppzK addrC - (oppzK a) subz_le0 oppzK mulrC.
    apply lez_floor.
    apply neq_ltz.
    by right.
  + move => ineq_floor.
    rewrite - subz_gt0 oppzK - (oppzK a) addrC (addrC _ b) addrA subz_gt0 oppzK - (mulr1 b) - mulrA - mulrDr mul1r mulr1 mulrC.
    by apply ltz_ceil.
qed.

lemma div_val a b m :
  0 < b =>
  (b * m <= a < b * (m+1) <=> a %/ b = m).
proof.
  move => ltz0b.
  split.
  + move => [leza ltza].
    apply lez_anti.
    split.
    - rewrite - (lez_add2l 1) lez_add1r - (ltr_pmul2l b) // addzC - lez_add1r.
      apply (lez_trans (1+a)).
      * rewrite lez_add2l mulrC.
        apply lez_floor.
        apply neq_ltz.
        by right.
      * by rewrite lez_add1r.
    - move => lezm.
      rewrite - (lez_add2l 1) lez_add1r addzC - (ltr_pmul2l b) // - lez_add1r - (lez_add2l (-1)) addzA /=.
      apply (lez_trans a) => //.
      rewrite - (lez_add2l 1) addzA /= lez_add1r mulzC.
      by apply ltz_ceil.
  + move => eqm.
    rewrite - eqm.
    split.
    - rewrite mulzC.
      apply lez_floor.
      apply neq_ltz.
      by right.
    - move => lea.
      rewrite mulzC.
      by apply ltz_ceil.
qed.

op barrett_ppqe (pp q e : int) = pp %/ q + e.
op barrett_fun_aux (a pp ppqe : int) = a * ppqe %/ pp.
op barrett_seq (pp ppqe m: int) = ceil (pp * m) ppqe.

lemma barrett_seq_eq a pp ppqe m :
  0 < pp =>
  0 < ppqe =>
  barrett_seq pp ppqe m <= a < barrett_seq pp ppqe (m+1) <=>
  barrett_fun_aux a pp ppqe = m.
proof.
  rewrite /barrett_seq /barrett_fun_aux. (*FIXME*)
  move => ltz0pp ltz0ppqe.
  split.
  + move => [leza ltza].
    apply div_val => //.
    split.
    - apply (lez_trans ((ceil (pp * m) ppqe) * ppqe)).
      * rewrite (mulrC _ ppqe).
        by case (ceilP (pp*m) ppqe ltz0ppqe).
      * by rewrite ler_pmul2r.
    - move => _.
      rewrite - lez_add1r.
      apply (lez_trans (1 + (ceil (pp * (m + 1)) ppqe * ppqe - ppqe))).
      * rewrite lez_add2l - (mul1z ppqe) - mulzA - mulzA - mulNr - mulzDl // ler_pmul2r //= addzC.
        apply (lez_add2l 1).
        by rewrite addzA /= lez_add1r.
      * rewrite (mulzC _ ppqe).
        case (ceilP (pp*(m+1)) ppqe ltz0ppqe) => lezceil ltzceil.
        rewrite lez_add1r.
        apply (ltz_add2r ppqe).
        by rewrite - addzA.
  + move => eqm.
    rewrite - eqm.
    split.
    - case (ceilP (pp * (a * ppqe %/ pp)) ppqe ltz0ppqe) => _ ltzceil.
      rewrite - (lez_add2l 1) lez_add1r addrC - (ltr_pmul2l ppqe) // mulzDr /= - lez_add1r.
      apply (lez_trans (pp * (a * ppqe %/ pp) + ppqe)).
      * by rewrite lez_add1r.
      * rewrite lez_add2r (mulrC a) (mulrC pp).
        apply lez_floor.
        apply neq_ltz.
        by right.
    - move => lezceil.
      case (ceilP (pp * (a * ppqe %/ pp + 1)) ppqe ltz0ppqe) => lezfloor _.
      rewrite - (ltr_pmul2l ppqe) - lez_add1r ; [by rewrite lez_add1r|].
      apply (lez_trans (pp * (a * ppqe %/ pp + 1))) => //.
      rewrite (mulrC pp) (mulrC a) lez_add1r.
      by apply ltz_ceil.
qed.

op barrett_fun (a pp q ppqe : int) = a - (barrett_fun_aux a pp ppqe) * q.

lemma barrett_fun_increasing pp q ppqe :
  forall m a b ,
  0 < pp =>
  0 < ppqe =>
  barrett_seq pp ppqe m <= a <= b < barrett_seq pp ppqe (m+1) =>
  barrett_fun a pp q ppqe <= barrett_fun b pp q ppqe.
proof.
  move => m a b ltz0pp ltz0ppqe [[lez_seq_a lez_a_b] ltz_b_seq].
  rewrite /barrett_fun. (*FIXME*)
  case (barrett_seq_eq a pp ppqe m ltz0pp ltz0ppqe) => eq_barrett_a_m _.
  rewrite eq_barrett_a_m ; [by split ; [ |move => _ ; rewrite - lez_add1r ; apply (lez_trans (1+b)) ; [rewrite lez_add2l|rewrite lez_add1r]] | ].
  case (barrett_seq_eq b pp ppqe m ltz0pp ltz0ppqe) => eq_barrett_b_m _.
  rewrite eq_barrett_b_m ; [by split ; [apply (lez_trans a)| ] | ].
  by rewrite lez_add2r.
qed.

pred barrett_pred_low (a pp q ppqe : int) = 0 <= barrett_fun a pp q ppqe.
pred barrett_pred_high (a pp q ppqe : int) = barrett_fun a pp q ppqe <= q.
pred barrett_pred (a pp q ppqe : int) = (barrett_pred_low a pp q ppqe) /\ (barrett_pred_high a pp q ppqe).

lemma barrett_pred_low_reduction pp q ppqe :
  forall m ,
  0 < pp =>
  0 < ppqe =>
  barrett_pred_low (barrett_seq pp ppqe m) pp q ppqe =>
  forall a ,
  barrett_seq pp ppqe m <= a < barrett_seq pp ppqe (m+1) => barrett_pred_low a pp q ppqe.
proof.
  move => m ltz0pp ltz0ppqe barrett_pred_low_seq a [lez_seq_a ltz_a_seq].
  apply (lez_trans (barrett_fun (barrett_seq pp ppqe m) pp q ppqe)) => //.
  by apply (barrett_fun_increasing pp q ppqe m (barrett_seq pp ppqe m) a).
qed.

lemma barrett_pred_high_reduction pp q ppqe :
  forall m ,
  0 < pp =>
  0 < ppqe =>
  barrett_pred_high ((barrett_seq pp ppqe (m+1))-1) pp q ppqe =>
  forall a ,
  barrett_seq pp ppqe m <= a < barrett_seq pp ppqe (m+1) => barrett_pred_high a pp q ppqe.
proof.
  move => m ltz0pp ltz0ppqe barrett_pred_high_seq a [lez_seq_a ltz_a_seq].
  apply (lez_trans (barrett_fun ((barrett_seq pp ppqe (m+1))-1) pp q ppqe)) => //.
  apply (barrett_fun_increasing pp q ppqe m a ((barrett_seq pp ppqe (m+1))-1)) => //.
  split => //.
  split => //.
  + move => _.
    by rewrite (addzC _ (-1)) - (lez_add2l 1) addzA lez_add1r.
  + move => _.
    by rewrite (addzC _ (-1)) - lez_add1r addzA.
qed.

op barrett_seq_label_min amin pp ppqe = ((amin-1) * ppqe) %/ pp + 1.
op barrett_seq_label_max amax pp ppqe = barrett_seq_label_min amax pp ppqe.

lemma barrett_seq_label_min_min amin pp ppqe :
  forall m ,
  0 < pp =>
  0 < ppqe =>
  amin <= barrett_seq pp ppqe m <=> barrett_seq_label_min amin pp ppqe <= m.
proof.
  move => m ltz0pp ltz0ppqe.
  split ; [move => lez_amin_seq | move => lez_label_m].
  + rewrite /barrett_seq_label_min addzC lez_add1r - (ltr_pmul2r pp) // - lez_add1r. (*FIXME*)
    apply (lez_trans (1 + ((amin - 1) * ppqe))).
    - rewrite lez_add2l.
      apply lez_floor.
      rewrite neq_ltz.
      by right.
    - apply (lez_trans (1 + (barrett_seq pp ppqe m) * ppqe - ppqe)).
      * by rewrite - addzA lez_add2l mulzDl mulNr /= lez_add2r ler_pmul2r.
      * rewrite - addzA lez_add1r - (ltz_add2r ppqe) - addzA /= (mulzC m) (mulzC _ ppqe).
        by case (ceilP (pp*m) ppqe ltz0ppqe).
  + rewrite /barrett_seq. (*FIXME*)
    by admit.
qed.

(*Use the fact that we are in classical logic fo this one*)
lemma barrett_seq_label_max_max amax pp ppqe :
  forall m ,
  0 < pp =>
  0 < ppqe =>
  barrett_seq pp ppqe m < amax <=> m < barrett_seq_label_max amax pp ppqe.
proof.
  move => m ltz0pp ltz0ppqe.
  apply iff_negb.
  by split ; [move => lez_amin_seq | move => lez_label_m] ; apply lezNgt ; rewrite /barrett_seq_label_max ; apply barrett_seq_label_min_min => // ; apply lezNgt. (*FIXME*)
qed.

lemma barrett_fun_seq pp q ppqe :
  forall m ,
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  barrett_fun (barrett_seq pp ppqe m) pp q ppqe = ceil ((pp - ppqe * q) * m) ppqe.
proof.
  move => m ltz0pp ltz0ppqe lezppqepp.
  case (barrett_seq_eq (barrett_seq pp ppqe m) pp ppqe m ltz0pp ltz0ppqe) => eq_aux _.
  rewrite /barrett_fun. (*FIXME*)
  rewrite eq_aux.
  split => //.
  move => ineq.
  rewrite /barrett_seq. (*FIXME*)
  + rewrite /ceil. (*FIXME*)
    search (_<_-_).
    rewrite - subr_gt0 opprK addzC subr_gt0 - mulNr mulzDr mulNr /=.
    apply ltz_divLR => //.
    rewrite - lez_add1r.
    apply (lez_trans (1 + ((- pp * m) - ppqe))).
    - by rewrite lez_add2l lez_add2l - subr_ge0 opprK addzC subr_ge0.
    - rewrite lez_add1r - (ltz_add2r ppqe) - addzA /= - (mul1r ppqe) - mulzA - mulzDl /=.
      by apply ltz_ceil.
  + rewrite /barrett_seq /ceil. (*FIXME*)
    rewrite - (mulNr (pp - ppqe * q)) opprB mulzDl mulzA (mulzC ppqe) divzMDl.
    - apply neq_ltz.
      by right.
    - by rewrite opprD (mulrC q) (addzC (- m*q)) mulNr.
qed.

(*pp is 2 ^ kk and e is 1 in our case*)
(*Why do Ihave to specify that amin and amax are integers here?*)
lemma barrett_overZ_generalized (amin amax a pp q ppqe : int) :
  amin <= a < amax =>
  0 < pp =>
  0 < ppqe =>
  barrett_pred a pp q ppqe.
proof.
admitted.
