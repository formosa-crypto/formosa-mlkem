require import AllCore StdOrder List Ring IntDiv.
(*---*) import IntOrder.

(*-----------------------------------------------------------------------------*)
(* All in range. *)

lemma onth_map (f:'a->'b) (xs:'a list) :
  forall i, onth (map f xs) i = omap f (onth xs i).
  elim xs => />? ? ? i. case (i=0) => />*; smt(). qed.

abbrev all_range P (min max : int) = all P (range min max).

lemma all_range_empty P (min max : int) :
  max <= min =>
  all_range P min max.
proof.
  by move => lemaxmin; rewrite range_geq.
qed.

lemma all_range_min P (min max : int) :
  min < max =>
  all_range P min max <=>
  P min /\ all_range P (min + 1) max.
proof.
  by move => ltminmax; rewrite range_ltn.
qed.

lemma all_range_max P (min max : int) :
  min < max =>
  all_range P min max <=>
  P (max - 1) /\ all_range P min (max - 1).
proof.
  move => ltminmax; rewrite -{1}(IntID.subrK max 1) rangeSr; first by apply/(ler_add2r 1) => /=; apply/ltzE.
  split => [/allP Hall|[HP /allP Hall]].
  + by split; [|apply/allP => x Hin]; apply Hall; rewrite mem_rcons // in_cons; right.
  by apply /allP => x; rewrite mem_rcons in_cons; case => [->> //|]; apply Hall.
qed.

lemma all_range_cat P (m min max : int) :
  min <= m <= max =>
  all_range P min max <=>
  all_range P min m /\ all_range P m max.
proof. by move => [le_m lem_]; rewrite (range_cat m) ?all_cat. qed.

lemma all_range_imp P Q (min max : int) :
  (forall x , x \in range min max => P x => Q x) =>
  all_range P min max =>
  all_range Q min max.
proof.
  by move => Himp /allP HallrangeP; apply /allP => x Hxin; apply Himp => //; apply HallrangeP.
qed.

lemma all_range_eq P Q (min max : int) :
 (forall x , x \in range min max => P x <=> Q x) =>
  all_range P min max <=>
  all_range Q min max.
proof. by move => Heq; split; apply all_range_imp => x Hx_range; rewrite Heq. qed.


abbrev all_range_2 P (min1 max1 min2 max2 : int) = all_range (fun y => all_range (transpose P y) min1 max1) min2 max2.

lemma all_range_2_empty P (min1 max1 min2 max2 : int) :
  max1 <= min1 =>
  all_range_2 P min1 max1 min2 max2.
proof. by move => lemax1min1; apply (all_range_imp predT) => [/= x Hx_range _|]; [apply all_range_empty|apply all_predT]. qed.

lemma all_range_2_min P (min1 max1 min2 max2 : int) :
  min1 < max1 =>
  all_range_2 P min1 max1 min2 max2 <=>
  all_range (P min1) min2 max2 /\ all_range_2 P (min1 + 1) max1 min2 max2.
proof.
  move => ltmin1max1; rewrite (all_range_eq _ (fun y => P min1 y /\ all_range (transpose P y) (min1 + 1) max1)).
  + by move => y Hy_range /=; apply all_range_min.
  by rewrite all_predI.
qed.

lemma all_range_2_max P (min1 max1 min2 max2 : int) :
  min1 < max1 =>
  all_range_2 P min1 max1 min2 max2 <=>
  all_range (P (max1 - 1)) min2 max2 /\ all_range_2 P min1 (max1 - 1) min2 max2.
proof.
  move => ltmin1max1; rewrite (all_range_eq _ (fun y => P (max1 - 1) y /\ all_range (transpose P y) min1 (max1 - 1))).
  + by move => y Hy_range /=; apply all_range_max.
  by rewrite all_predI.
qed.

lemma all_range_2_cat P (m min1 max1 min2 max2 : int) :
  min1 <= m <= max1 =>
  all_range_2 P min1 max1 min2 max2 <=>
  all_range_2 P min1 m min2 max2 /\ all_range_2 P m max1 min2 max2.
proof.
move => [le_m lem_]; rewrite (all_range_eq _ (fun y => all_range (transpose P y) min1 m /\ all_range (transpose P y) m max1)).
  + by move => y Hy_range /=; apply all_range_cat.
  by rewrite all_predI.
qed.

lemma all_range_2_imp P Q (min1 max1 min2 max2 : int) :
  (forall x y , x \in range min1 max1 => y \in range min2 max2 => P x y => Q x y) =>
  all_range_2 P min1 max1 min2 max2 =>
  all_range_2 Q min1 max1 min2 max2.
proof. by move => Himp2; apply all_range_imp => y Hy_range /=; apply all_range_imp => x Hx_range /=; apply Himp2. qed.

lemma all_range_2_eq P Q (min1 max1 min2 max2 : int) :
  (forall x y , x \in range min1 max1 => y \in range min2 max2 => P x y <=> Q x y) =>
  all_range_2 P min1 max1 min2 max2 <=>
  all_range_2 Q min1 max1 min2 max2.
proof. by move => Heq2; apply all_range_eq => y Hy_range /=; apply all_range_eq => x Hx_range /=; apply Heq2. qed.
