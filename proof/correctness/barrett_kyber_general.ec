require import AllCore IntDiv Ring StdOrder.
import Ring.IntID IntOrder.

op ceil (a b : int) = -((-a)%/b).

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

lemma barrett_seq_increasing pp ppqe:
  0 < pp =>
  0 < ppqe =>
  forall (a b : int) ,
  a <= b =>
  barrett_seq pp ppqe a <= barrett_seq pp ppqe b.
proof.
  move => ltz0pp ltz0ppqe a b lezab.
  rewrite /barrett_seq /ceil - subz_ge0 opprK addzC subz_ge0. (*FIXME*)
  apply leq_div2r.
  - by rewrite - subz_ge0 opprK addzC subz_ge0 ler_pmul2l.
  - apply lez_eqVlt.
    by right.
qed.

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
    rewrite  - (subrK amin 1) addzC lez_add1r - (ltr_pmul2l ppqe) - lez_add1r ; [by rewrite lez_add1r|].
    apply (lez_trans (pp*m)).
    apply (lez_trans (((ppqe * (amin - 1)) %/ pp + 1) * pp)).
    - rewrite lez_add1r.
      by apply ltz_ceil.
    - rewrite (mulzC ppqe) (mulzC pp) ler_pmul2r //.
    - by case (ceilP (pp*m) ppqe ltz0ppqe) => lezceil ltzceil.
qed.

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
  + split => //.
    move => ineq.
    rewrite /barrett_seq. (*FIXME*)
    rewrite /ceil. (*FIXME*)
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

lemma barrett_fun_seq_decr pp q ppqe :
  forall m ,
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  barrett_fun ((barrett_seq pp ppqe (m+1)) - 1) pp q ppqe = ceil (((pp - ppqe * q) * m) + (pp - ppqe)) ppqe.
proof.
  move => m ltz0pp ltz0ppqe lezppqepp.
  case (barrett_seq_eq ((barrett_seq pp ppqe (m+1)) - 1) pp ppqe m ltz0pp ltz0ppqe) => eq_aux _.
  rewrite /barrett_fun. (*FIXME*)
  rewrite eq_aux.
  split => //.
  + rewrite (addzC _ (-1)) - (lez_add2l 1) addzA /= lez_add1r.
    rewrite /barrett_seq. (*FIXME*)
    rewrite /ceil. (*FIXME*)
    rewrite - subr_gt0 opprK addzC subr_gt0 - mulNr mulzDr mulNr /=.
    apply ltz_divLR => //.
    rewrite - lez_add1r.
    apply (lez_trans (1 + ((- pp * m) - ppqe))).
    - by rewrite lez_add2l lez_add2l - subr_ge0 opprK addzC subr_ge0.
    - rewrite lez_add1r - (ltz_add2r ppqe) - addzA /= - (mul1r ppqe) - mulzA - mulzDl /=.
      by apply ltz_ceil.
  + move => lez_seq.
    by rewrite (addzC _ (-1)) - lez_add1r addzA /=.
  + rewrite /barrett_seq /ceil. (*FIXME*)
    rewrite - opprD - opprD.
    congr.
    rewrite opprD opprD - mulNr - mulNr opprD opprK opprK mulzDr /= - addzA addzC - divzMDr.
    - apply neq_ltz.
      by right.
    - by rewrite mulzDl mulzDl /= addzA addzA (mulzC _ ppqe) (mulzC m q) mulzA - addzA (addzC ppqe) addzA - (addzA ((-pp) * m)) (addzC (-pp)) addzA.
qed.

lemma barrett_fun_seq_increasing pp q ppqe :
  forall (a b : int) ,
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  0 < pp - ppqe * q =>
  a <= b =>
  barrett_fun (barrett_seq pp ppqe a) pp q ppqe <= barrett_fun (barrett_seq pp ppqe b) pp q ppqe.
proof.
  move => a b ltz0pp ltz0ppqe lezppqepp lezc lezab.
  rewrite barrett_fun_seq // barrett_fun_seq // /ceil - subz_ge0 opprK addzC subz_ge0.
  apply leq_div2r.
  + by rewrite - subz_ge0 opprK addzC subz_ge0 ler_pmul2l.
  + apply lez_eqVlt.
    by right.
qed.

lemma barrett_fun_seq_decreasing pp q ppqe :
  forall (a b : int) ,
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  pp - ppqe * q < 0 =>
  a <= b =>
  barrett_fun (barrett_seq pp ppqe b) pp q ppqe <= barrett_fun (barrett_seq pp ppqe a) pp q ppqe.
proof.
  move => a b ltz0pp ltz0ppqe lezppqepp lezc lezab.
  rewrite barrett_fun_seq // barrett_fun_seq // /ceil - subz_ge0 opprK addzC subz_ge0. (*FIXME*)
  apply leq_div2r.
  + rewrite - mulNr opprD opprK (addzC (-pp)) - mulNr opprD opprK (addzC (-pp)) ler_pmul2l //.
    by rewrite - subz_lt0 opprD opprK /= addzC.
  + apply lez_eqVlt.
    by right.
qed.

lemma barrett_fun_seq_constant pp q ppqe :
  forall (a b : int) ,
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  pp - ppqe * q = 0 =>
  barrett_fun (barrett_seq pp ppqe a) pp q ppqe = barrett_fun (barrett_seq pp ppqe b) pp q ppqe.
proof.
  move => a b ltz0pp ltz0ppqe lezppqepp lezc.
  by rewrite barrett_fun_seq // barrett_fun_seq // /ceil lezc.
qed.

lemma barrett_fun_seq_decr_increasing pp q ppqe :
  forall (a b : int) ,
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  0 < pp - ppqe * q =>
  a <= b =>
  barrett_fun ((barrett_seq pp ppqe (a+1)) - 1) pp q ppqe <= barrett_fun ((barrett_seq pp ppqe (b+1)) - 1) pp q ppqe.
proof.
  move => a b ltz0pp ltz0ppqe lezppqepp lezc lezab.
  rewrite barrett_fun_seq_decr // barrett_fun_seq_decr // /ceil - subz_ge0 opprK addzC subz_ge0.
  apply leq_div2r.
  + by rewrite - subz_ge0 opprK addzC subz_ge0 lez_add2r ler_pmul2l.
  + apply lez_eqVlt.
    by right.
qed.

lemma barrett_fun_seq_decr_decreasing pp q ppqe :
  forall (a b : int) ,
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  pp - ppqe * q < 0 =>
  a <= b =>
  barrett_fun ((barrett_seq pp ppqe (b+1)) - 1) pp q ppqe <= barrett_fun ((barrett_seq pp ppqe (a+1)) - 1) pp q ppqe.
proof.
  move => a b ltz0pp ltz0ppqe lezppqepp lezc lezab.
  rewrite barrett_fun_seq_decr // barrett_fun_seq_decr // /ceil - subz_ge0 opprK addzC subz_ge0. (*FIXME*)
  apply leq_div2r.
  + rewrite - subz_ge0 opprK addzC subz_ge0 lez_add2r - (mulrNN _ a) opprD opprK (addzC (-pp)) - (mulrNN _ b) opprD opprK (addzC (-pp)) ler_pmul2l.
    - by rewrite - subz_lt0 opprD opprK /= addzC.
    - by rewrite - subz_le0 opprK addzC subz_le0.
  + apply lez_eqVlt.
    by right.
qed.

lemma barrett_fun_seq_decr_constant pp q ppqe :
  forall (a b : int) ,
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  pp - ppqe * q = 0 =>
  barrett_fun ((barrett_seq pp ppqe (a+1)) - 1) pp q ppqe = barrett_fun ((barrett_seq pp ppqe (b+1)) - 1) pp q ppqe.
proof.
  move => a b ltz0pp ltz0ppqe lezppqepp lezc.
  by rewrite barrett_fun_seq_decr // barrett_fun_seq_decr // /ceil lezc.
qed.

lemma ltz_lez_total :
  forall (x y :int) , x <= y \/ y < x.
proof.
  move => x y.
  case (lez_total x y) => [lezxy|lezyx].
  + by left.
  + case (lez_eqVlt y x) => a _.
    case (a lezyx) => [eqyx|ltzyx].
    - left.
      apply lez_eqVlt.
      left.
      by rewrite eqyx.
    - by right.
qed.

lemma barrett_seq_label_min_increasing pp ppqe :
  0 < pp =>
  0 < ppqe =>
  forall (amin bmin : int) ,
  amin <= bmin =>
  barrett_seq_label_min amin pp ppqe <= barrett_seq_label_min bmin pp ppqe.
proof.
  move => ltz0pp ltz0ppqe amin bmin lezabmin.
  rewrite /barrett_seq_label_min. (*FIXME*)
  rewrite lez_add2r leq_div2r //.
  + by rewrite ler_pmul2r // lez_add2r.
  + apply lez_eqVlt.
    by right.
qed.

lemma barrett_seq_label_max_increasing pp ppqe :
  0 < pp =>
  0 < ppqe =>
  forall (amax bmax : int) ,
  amax <= bmax =>
  barrett_seq_label_max amax pp ppqe <= barrett_seq_label_max bmax pp ppqe.
proof.
  move => ltz0pp ltz0ppqe amax bmax lezabmax.
  rewrite /barrett_seq_label_max. (*FIXME*)
  by apply barrett_seq_label_min_increasing.
qed.

lemma barrett_seq_archimedian (pp q ppqe : int) :
  0 < pp =>
  0 < ppqe =>
  forall (a : int) ,
  exists m ,
  barrett_seq pp ppqe m <= a < barrett_seq pp ppqe (m+1).
proof.
  move => ltz0pp ltz0ppqe a.
  exists ((-1) + (barrett_seq_label_min (1+a) pp ppqe)).
  split.
  + rewrite - (lez_add2l 1) lez_add1r.
    apply barrett_seq_label_max_max => //.
    by rewrite - lez_add1r addzA /=.
  + move => _.
    rewrite - lez_add1r.
    by apply barrett_seq_label_min_min.
qed.

lemma barrett_seq_pred_low_increasing (amin amax pp q ppqe : int) :
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  0 < pp - ppqe * q =>
  amin < amax =>
  (forall a , amin <= a < amax => barrett_pred_low a pp q ppqe) <=>
  (barrett_pred_low amin pp q ppqe) /\
  (if (barrett_seq pp ppqe (barrett_seq_label_min amin pp ppqe) < amax)
   then (barrett_pred_low (barrett_seq pp ppqe (barrett_seq_label_min amin pp ppqe)) pp q ppqe)
   else true).
proof.
  move => ltz0pp ltz0ppqe lezppqepp lezc ltzaminmax.
  split.
  + move => forall_pred.
    split.
    - by apply forall_pred.
    - case : (barrett_seq pp ppqe (barrett_seq_label_min amin pp ppqe) < amax) => ltzamax //.
      apply forall_pred.
      by split ; [apply barrett_seq_label_min_min|].
  + move => [pred_amin pred_labelmin] a [lezamina ltzaamax].
    case : ( a < barrett_seq pp ppqe (barrett_seq_label_min amin pp ppqe)) => ltza.
    - rewrite /barrett_pred_low. (*FIXME*)
      apply (lez_trans (barrett_fun amin pp q ppqe)) => //.
      apply (barrett_fun_increasing pp q ppqe ((barrett_seq_label_min amin pp ppqe)-1)) => //.
      split ; [split|].
      * rewrite - (lez_add2l 1) lez_add1r.
        apply barrett_seq_label_max_max => //.
        rewrite (addzC _ (-1)) - (ltz_add2l 1) addzA /=.
        rewrite /barrett_seq_label_max. (*FIXME*)
        rewrite - lez_add1r lez_add2l.
        apply barrett_seq_label_min_increasing => //.
        by rewrite - (add0r amin) addzA lez_add2r.
      * by move => _.
      * move => _.
        by rewrite /=.
    - case (barrett_seq_archimedian pp q ppqe ltz0pp ltz0ppqe a) => m [ltem ltzm].
      apply (barrett_pred_low_reduction pp q ppqe m ltz0pp ltz0ppqe) => //.
      apply (lez_trans (barrett_fun (barrett_seq pp ppqe (barrett_seq_label_min amin pp ppqe)) pp q ppqe)) => //.
      * apply pred_labelmin.
        rewrite - lez_add1r.
        by apply (lez_trans (1+a)) ; [rewrite lez_add2l ; apply lezNgt | rewrite lez_add1r].
      * apply barrett_fun_seq_increasing => //.
        rewrite - (lez_add2l 1) lez_add1r addzC.
        apply ltzNge.
        apply negbT.
        apply eqboolP.
        split => //.
        move => lezmadd1.
        apply ltza.
        rewrite - lez_add1r.
        by apply (lez_trans (barrett_seq pp ppqe (m+1))) ; [rewrite lez_add1r|apply barrett_seq_increasing].
qed.

lemma barrett_seq_pred_low_decreasing (amin amax pp q ppqe : int) :
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  pp - ppqe * q < 0 =>
  amin < amax =>
  (forall a , amin <= a < amax => barrett_pred_low a pp q ppqe) <=>
  (if (amin <= barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1))
   then (barrett_pred_low (barrett_seq pp ppqe ((barrett_seq_label_max amax pp ppqe) - 1)) pp q ppqe)
   else (barrett_pred_low amin pp q ppqe)).
proof.
  move => ltz0pp ltz0ppqe lezppqepp lezc ltzaminmax.
  split.
  + move => forall_pred.
    case : (amin <= barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1)) => lezamin.
    - apply forall_pred.
      split => //.
      move => _.
      apply barrett_seq_label_max_max => //.
      by rewrite addzC - lez_add1r addzA /=.
    - apply forall_pred.
      by split.
  + move => pred_labelmax a [lezamina ltzaamax].
    case pred_labelmax => [lezamin pred_labelmax|nlezamin pred_amin].
    - case (barrett_seq_archimedian pp q ppqe ltz0pp ltz0ppqe a) => m [ltem ltzm].
      apply (barrett_pred_low_reduction pp q ppqe m ltz0pp ltz0ppqe) => //.
      apply (lez_trans (barrett_fun (barrett_seq pp ppqe ((barrett_seq_label_max amax pp ppqe) - 1)) pp q ppqe)) => //.
      apply barrett_fun_seq_decreasing => //.
      rewrite - (lez_add2l 1) lez_add1r addzC - addzA /=.
      apply barrett_seq_label_max_max => //.
      rewrite - lez_add1r.
      apply (lez_trans (1+a)).
      * by rewrite lez_add2l.
      * by rewrite lez_add1r.
    - apply (lez_trans (barrett_fun amin pp q ppqe)) => //.
      apply (barrett_fun_increasing pp q ppqe (barrett_seq_label_max amax pp ppqe - 1) amin a) => //.
      split ; [split|].
      * apply lez_eqVlt.
        right.
        by apply ltzNge.
      * by move => _.
      * move => _ => /=.
        rewrite - lez_add1r.
        apply (lez_trans amax) ; [by rewrite lez_add1r|].
        by apply barrett_seq_label_min_min.
qed.

lemma barrett_seq_pred_low_constant (amin amax pp q ppqe : int) :
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  0 = pp - ppqe * q =>
  amin < amax =>
  (forall a , amin <= a < amax => barrett_pred_low a pp q ppqe) <=>
  (if (amin <= barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1))
   then (barrett_pred_low (barrett_seq pp ppqe ((barrett_seq_label_max amax pp ppqe) - 1)) pp q ppqe)
   else (barrett_pred_low amin pp q ppqe)).
proof.
  move => ltz0pp ltz0ppqe lezppqepp lezc ltzaminmax.
  split.
  + move => forall_pred.
    case : (amin <= barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1)) => lezamin.
    - apply forall_pred.
      split => //.
      move => _.
      apply barrett_seq_label_max_max => //.
      by rewrite addzC - lez_add1r addzA /=.
    - apply forall_pred.
      by split.
  + move => pred_labelmax a [lezamina ltzaamax].
    case pred_labelmax => [lezamin pred_labelmax|nlezamin pred_amin].
    - case (barrett_seq_archimedian pp q ppqe ltz0pp ltz0ppqe a) => m [ltem ltzm].
      apply (barrett_pred_low_reduction pp q ppqe m ltz0pp ltz0ppqe) => //.
      apply (lez_trans (barrett_fun (barrett_seq pp ppqe ((barrett_seq_label_max amax pp ppqe)-1)) pp q ppqe)) => //.
      apply lez_eqVlt.
      left.
      apply barrett_fun_seq_constant => //.
      by rewrite lezc.
    - apply (lez_trans (barrett_fun amin pp q ppqe)) => //.
      apply (barrett_fun_increasing pp q ppqe (barrett_seq_label_max amax pp ppqe - 1) amin a) => //.
      split ; [split|].
      * apply lez_eqVlt.
        right.
        by apply ltzNge.
      * by move => _.
      * move => _ => /=.
        rewrite - lez_add1r.
        apply (lez_trans amax) ; [by rewrite lez_add1r|].
        by apply barrett_seq_label_min_min.
qed.

lemma barrett_seq_pred_high_increasing (amin amax pp q ppqe : int) :
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  0 < pp - ppqe * q =>
  amin < amax =>
  (forall a , amin <= a < amax => barrett_pred_high a pp q ppqe) <=>
  (barrett_pred_high (amax-1) pp q ppqe) /\
  (if (amin <= barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1) - 1)
   then (barrett_pred_high (barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1) - 1) pp q ppqe)
   else true).
proof.
  move => ltz0pp ltz0ppqe lezppqepp lezc ltzaminmax.
  split.
  + move => forall_pred.
    split.
    - apply forall_pred.
      split.
      * by rewrite - (lez_add2l 1) lez_add1r addzC - addzA.
      * move => _.
        by rewrite - lez_add1r addzC - addzA.
    - case : (amin <= barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1) - 1) => lezamin //.
      apply forall_pred.
      split => //.
      move => _.
      apply (ltz_trans (barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1))).
      * by rewrite - lez_add1r addzC - addzA.
      * apply barrett_seq_label_max_max => //.
        by rewrite - lez_add1r addzC - addzA.
  + move => [pred_amin pred_labelmin] a [lezamina ltzaamax].
    case : (barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1) <= a) => leza.
    - apply (lez_trans (barrett_fun (amax-1) pp q ppqe)) => //.
      apply (barrett_fun_increasing pp q ppqe (barrett_seq_label_max amax pp ppqe - 1)) => //.
      split ; [split|] => //.
      * move => _.
        by rewrite addzC - (lez_add2l 1) lez_add1r addzA.
      * move => _.
        rewrite /= - lez_add1r addzC - addzA /=.
        by apply barrett_seq_label_min_min.
    - case (barrett_seq_archimedian pp q ppqe ltz0pp ltz0ppqe a) => m [ltem ltzm].
      apply (barrett_pred_high_reduction pp q ppqe m) => //.
      rewrite /barrett_pred_high.
      apply (lez_trans (barrett_fun (barrett_seq pp ppqe ((barrett_seq_label_max amax pp ppqe - 1) - 1 + 1) - 1) pp q ppqe)).
      * apply barrett_fun_seq_decr_increasing => //.
        rewrite - (lez_add2r 1) - (lez_add2l 1) lez_add1r (addzC 1) /=.
        apply barrett_seq_label_max_max => //.
        apply ltzNge.
        apply negbT.
        apply eqboolP.
        split => //.
        move => lezamax.
        apply leza.
        apply (lez_trans (barrett_seq pp ppqe m)) => //.
        apply barrett_seq_increasing => //.
        rewrite - (lez_add2r 1) - addzA /=.
        by apply barrett_seq_label_min_min.
      * rewrite /=.
        apply pred_labelmin.
        rewrite - (lez_add2r 1) /= (addzC _ 1).
        by apply (lez_trans (1+a)) ; [rewrite lez_add2l|rewrite lez_add1r ; apply ltzNge].
qed.

lemma barrett_seq_pred_high_decreasing (amin amax pp q ppqe : int) :
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  pp - ppqe * q < 0 =>
  amin < amax =>
  (forall a , amin <= a < amax => barrett_pred_high a pp q ppqe) <=>
  (if (barrett_seq pp ppqe (barrett_seq_label_min (amin+1) pp ppqe) - 1 < amax)
   then (barrett_pred_high (barrett_seq pp ppqe (barrett_seq_label_min (amin+1) pp ppqe) - 1) pp q ppqe)
   else (barrett_pred_high (amax-1) pp q ppqe)).
proof.
  move => ltz0pp ltz0ppqe lezppqepp lezc ltzaminmax.
  split.
  + move => forall_pred.
    case : (barrett_seq pp ppqe (barrett_seq_label_min (amin+1) pp ppqe) - 1 < amax) => [ltzamax|nltzamax].
    - apply forall_pred.
      split => //.
      rewrite - (lez_add2r 1) /=.
      by apply barrett_seq_label_min_min.
    - apply forall_pred.
      split.
      * by rewrite - (lez_add2r 1) /= addzC lez_add1r.
      * move => _.
        by rewrite - (ltz_add2r 1) /= - lez_add1r addzC.
  + move => [ltzamax pred_labelmin|nltzamax pred_amax] a [lezamina ltzaamax].
    - case (barrett_seq_archimedian pp q ppqe ltz0pp ltz0ppqe a) => m [ltem ltzm].
      apply (barrett_pred_high_reduction pp q ppqe m ltz0pp ltz0ppqe) => //.
      apply (lez_trans (barrett_fun (barrett_seq pp ppqe (barrett_seq_label_min (amin + 1) pp ppqe - 1 + 1) - 1) pp q ppqe)) => //.
      apply barrett_fun_seq_decr_decreasing => //.
      rewrite - (lez_add2r 1) /=.
      apply barrett_seq_label_min_min => //.
      rewrite (addzC amin 1).
      apply (lez_trans (1+a)).
      * by rewrite lez_add2l.
      * by rewrite lez_add1r.
    - apply (lez_trans (barrett_fun (amax-1) pp q ppqe)) => //.
      apply (barrett_fun_increasing pp q ppqe (barrett_seq_label_min (amin + 1) pp ppqe - 1)) => //.
      split ; [split|].
      * rewrite - (lez_add2l 1) lez_add1r.
        apply barrett_seq_label_max_max => //.
        rewrite - lez_add1r addzC /=.
        apply barrett_seq_label_min_increasing => //.
        by rewrite addzC lez_add2l.
      * move => _.
        by rewrite - (lez_add2l 1) lez_add1r addzC.
      * move => _.
        rewrite /= - lez_add1r /=.
        apply lez_eqVlt.
        right.
        rewrite - lez_add1r - (lez_add2r (-1)) /=.
        by apply lezNgt.
qed.

lemma barrett_seq_pred_high_constant (amin amax pp q ppqe : int) :
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  0 = pp - ppqe * q =>
  amin < amax =>
  (forall a , amin <= a < amax => barrett_pred_high a pp q ppqe) <=>
  (if (barrett_seq pp ppqe (barrett_seq_label_min (amin+1) pp ppqe) - 1 < amax)
   then (barrett_pred_high (barrett_seq pp ppqe (barrett_seq_label_min (amin+1) pp ppqe) - 1) pp q ppqe)
   else (barrett_pred_high (amax-1) pp q ppqe)).
proof.
  move => ltz0pp ltz0ppqe lezppqepp lezc ltzaminmax.
  split.
  + move => forall_pred.
    case : (barrett_seq pp ppqe (barrett_seq_label_min (amin+1) pp ppqe) - 1 < amax) => [ltzamax|nltzamax].
    - apply forall_pred.
      split => //.
      rewrite - (lez_add2r 1) /=.
      by apply barrett_seq_label_min_min.
    - apply forall_pred.
      split.
      * by rewrite - (lez_add2r 1) /= addzC lez_add1r.
      * move => _.
        by rewrite - (ltz_add2r 1) /= - lez_add1r addzC.
  + move => [ltzamax pred_labelmin|nltzamax pred_amax] a [lezamina ltzaamax].
    - case (barrett_seq_archimedian pp q ppqe ltz0pp ltz0ppqe a) => m [ltem ltzm].
      apply (barrett_pred_high_reduction pp q ppqe m ltz0pp ltz0ppqe) => //.
      apply (lez_trans (barrett_fun (barrett_seq pp ppqe (barrett_seq_label_min (amin + 1) pp ppqe - 1 + 1) - 1) pp q ppqe)) => //.
      apply lez_eqVlt.
      left.
      apply barrett_fun_seq_decr_constant => //.
      by rewrite lezc.
    - apply (lez_trans (barrett_fun (amax-1) pp q ppqe)) => //.
      apply (barrett_fun_increasing pp q ppqe (barrett_seq_label_min (amin + 1) pp ppqe - 1)) => //.
      split ; [split|].
      * rewrite - (lez_add2l 1) lez_add1r.
        apply barrett_seq_label_max_max => //.
        rewrite - lez_add1r addzC /=.
        apply barrett_seq_label_min_increasing => //.
        by rewrite addzC lez_add2l.
      * move => _.
        by rewrite - (lez_add2l 1) lez_add1r addzC.
      * move => _.
        rewrite /= - lez_add1r /=.
        apply lez_eqVlt.
        right.
        rewrite - lez_add1r - (lez_add2r (-1)) /=.
        by apply lezNgt.
qed.

lemma barrett_overZ_generalized (amin amax pp q ppqe : int) :
  0 < pp =>
  0 < ppqe =>
  ppqe <= pp =>
  (forall a , amin <= a < amax => barrett_pred a pp q ppqe) <=>
  (if (amin < amax)
   then (
     (if (0 < pp - ppqe * q)
      then    (   (barrett_pred_low amin pp q ppqe)
               /\ (if (barrett_seq pp ppqe (barrett_seq_label_min amin pp ppqe) < amax)
                   then (barrett_pred_low (barrett_seq pp ppqe (barrett_seq_label_min amin pp ppqe)) pp q ppqe)
                   else true)
              )
           /\ (   (barrett_pred_high (amax-1) pp q ppqe)
               /\ (if (amin <= barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1) - 1)
                   then (barrett_pred_high (barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1) - 1) pp q ppqe)
                   else true)
              )
      else    (if (amin <= barrett_seq pp ppqe (barrett_seq_label_max amax pp ppqe - 1))
               then (barrett_pred_low (barrett_seq pp ppqe ((barrett_seq_label_max amax pp ppqe) - 1)) pp q ppqe)
               else (barrett_pred_low amin pp q ppqe))
           /\ (if (barrett_seq pp ppqe (barrett_seq_label_min (amin+1) pp ppqe) - 1 < amax)
               then (barrett_pred_high (barrett_seq pp ppqe (barrett_seq_label_min (amin+1) pp ppqe) - 1) pp q ppqe)
               else (barrett_pred_high (amax-1) pp q ppqe))
     )
   )
   else true).
proof.
  move => ltz0pp ltz0ppqe lezppqepp.
  case (amin < amax) => ltzaminamax.
  + case (0 < pp - ppqe * q) => [ltz0c|lezc0] ; [|case (pp - ppqe * q < 0) => [ltzc0|lez0c]] ;
    split => [forall_pred|[predlow predhigh] a ineqs|forall_pred|[predlow predhigh] a ineqs|forall_pred|[predlow predhigh] a ineqs] ; split.
    - apply (barrett_seq_pred_low_increasing amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp ltz0c ltzaminamax).
      move => a ineqs.
      by case (forall_pred a ineqs).
    - apply (barrett_seq_pred_high_increasing amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp ltz0c ltzaminamax).
      move => a ineqs.
      by case (forall_pred a ineqs).
    - by apply (barrett_seq_pred_low_increasing amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp ltz0c ltzaminamax).
    - by apply (barrett_seq_pred_high_increasing amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp ltz0c ltzaminamax).
    - apply (barrett_seq_pred_low_decreasing amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp ltzc0 ltzaminamax).
      move => a ineqs.
      by case (forall_pred a ineqs).
    - apply (barrett_seq_pred_high_decreasing amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp ltzc0 ltzaminamax).
      move => a ineqs.
      by case (forall_pred a ineqs).
    - by apply (barrett_seq_pred_low_decreasing amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp ltzc0 ltzaminamax).
    - by apply (barrett_seq_pred_high_decreasing amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp ltzc0 ltzaminamax).
    - apply (barrett_seq_pred_low_constant amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp) => //.
      * by apply lez_anti ; split => [|_]; apply lezNgt.
      * move => a ineqs.
        by case (forall_pred a ineqs).
    - apply (barrett_seq_pred_high_constant amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp) => //.
      * by apply lez_anti ; split => [|_]; apply lezNgt.
      * move => a ineqs.
        by case (forall_pred a ineqs).
    - apply (barrett_seq_pred_low_constant amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp) => //.
      by apply lez_anti ; split => [|_]; apply lezNgt.
    - apply (barrett_seq_pred_high_constant amin amax pp q ppqe ltz0pp ltz0ppqe lezppqepp) => //.
      by apply lez_anti ; split => [|_]; apply lezNgt.
  + split => //.
    move => _ a [lezamin ltzamax].
    rewrite - lezNgt in ltzaminamax.
    (*Should be simpler*)
    by have  : false by smt().
(*
    - apply ltzaminamax.
      rewrite - lez_add1r.
      apply (lez_trans (1+a)).
      * by rewrite lez_add2l.
      * by rewrite lez_add1r.
    - by trivial.
*)
qed.

op pp = 67108864.
op q = 3329.
op ppqe = 20159.
op arange = 32768.

lemma barrett_overZ :
  forall a , - arange <= a < arange => barrett_pred a pp q ppqe.
proof.
  by apply barrett_overZ_generalized.
qed.
