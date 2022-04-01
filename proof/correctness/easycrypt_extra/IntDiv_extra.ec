require import AllCore StdOrder List Int IntDiv.
(*---*) import IntOrder.
require import Logic_extra Ring_extra Int_extra Number_extra.


(*TODO: in the entirety of IntDiv, there are many lemmas with superfluous hypothesises*)
(*-----------------------------------------------------------------------------*)

lemma divz_eqP (m d n : int) :
  0 < d => m %/ d = n <=> n * d <= m < (n + 1) * d.
proof.
  move => lt0d; split => [<<-|[le_m ltm_]].
  + by split => [|_]; [apply/lez_floor/gtr_eqF|apply/ltz_ceil].
  by apply/eqz_leq; split; [apply/ltzS/ltz_divLR|apply/lez_divRL].
qed.

lemma divz_mulp (n d1 d2 : int) : 
  0 < d1 =>
  0 < d2 =>
  n %/ (d1 * d2) = n %/ d1 %/ d2.
proof.
  move => lt0d1 lt0d2; rewrite (mulzC d1); apply divz_eqP; [by apply mulr_gt0|split => [|_]].
  + by rewrite mulrA; apply (lez_trans (n %/ d1 * d1));
    [apply/ler_pmul2r => //|]; apply/lez_floor/gtr_eqF.
  by rewrite mulrA; apply (ltr_le_trans ((n %/ d1 + 1) * d1));
  [|apply/ler_pmul2r => //; apply/ltzE]; apply/ltz_ceil.
qed.

lemma divz_mul (n d1 d2 : int) :
  0 <= d1 =>
  n %/ (d1 * d2) = n %/ d1 %/ d2.
proof.
move => /lez_eqVlt [<<- //=|lt0d1];
(case (0 <= d2) => [/lez_eqVlt [<<- //=|lt0d2]|/ltzNge ltd20]).
+ by rewrite divz_mulp.
by rewrite -(oppzK d2) mulrN 2!divzN eqr_opp divz_mulp // ltr_oppr.
qed.

lemma divzpMr p m d : d %| m => p * (m %/ d) = p * m %/ d.
proof. by move => /dvdzP [q ->>]; case (d = 0) => [->> //|neqd0]; rewrite mulrA !mulzK. qed.

lemma dvdNdiv x y : x <> 0 => x %| y => (-y) %/ x = - y %/ x.
proof. by move => neqx0 /dvdzP [z ->>]; rewrite -mulNr !mulzK. qed.

lemma exprD_subz (x m n : int) : x <> 0 => 0 <= n <= m => x ^ (m - n) = (x ^ m) %/ (x ^ n).
proof.
move => neqx0 [le0n lenm]; rewrite eq_sym -(eqz_mul (x ^ n) (x ^ m) (x ^ (m - n))).
+ by move: neqx0; rewrite implybNN expf_eq0.
+ by apply dvdz_exp2l.
by rewrite -exprD_nneg ?subrK // ler_subr_addr.
qed.


(*-----------------------------------------------------------------------------*)

lemma pow_normr (p x : int) :
  p ^ x = p ^ `|x|.
proof. by rewrite normrP; case (0 <= x) => //; rewrite exprN. qed.

lemma lt_pow (p x : int) :
  1 < p =>
  x < p ^ x.
proof.
  move => lt1p; case (0 <= x) => [|/ltzNge ltx0]; last by apply/(ltr_le_trans _ _ _ ltx0)/expr_ge0/ltzW/ltzE/ltzW.
  elim x => [|x le0x ltxpow]; first by rewrite expr0.
  apply/(ler_lt_trans (p ^ x)); first by apply/ltzE.
  by rewrite exprSr // ltr_pmulr // expr_gt0 ltzE ltzW.
qed.

lemma Ndvd_pow (p x : int) :
  1 < `|p| =>
  x <> 0 =>
  ! p ^ x %| x.
proof.
  move => lt1norm neqx0; apply/negP => dvdpowx.
  move: (dvdz_le _ _ _ dvdpowx) => //.
  rewrite pow_normr normrX_nat ?normr_ge0 //; apply/negP/ltzNge.
  by apply/lt_pow.
qed.

lemma dvdz2_eq m n :
  0 <= m =>
  0 <= n =>
  m %| n =>
  n %| m =>
  m = n.
proof.
  move => le0m le0n /dvdzP [x ->>] /dvdzP [y /(congr1 (transpose (%/) m) _ _) /=].
  rewrite mulrA divzz; case (m = 0) => /= [->> //=|neqm0]. 
  rewrite /b2i mulzK //= => eq1mul; move: (unitrM y x); move: eq1mul => <- /=.
  move => [_ [|] ->> //=]; move: le0n; rewrite mulNr /= oppr_ge0 => lem0.
  by move: neqm0; rewrite eqz_leq lem0 le0m.
qed.

lemma dvd_le_pow (p m n : int) :
  1 < `|p| =>
  p ^ m %| p ^ n =>
  `|m| <= `|n|.
proof.
  rewrite (pow_normr p m) (pow_normr p n) => lt1norm dvdpow2.
  have:= (dvdz_le _ _ _ dvdpow2); first by rewrite expf_eq0 -negP => -[_ ->>].
  rewrite !normrX_nat ?normr_ge0 //.
  by apply ler_weexpn2r => //; apply normr_ge0.
qed.

lemma le_dvd_pow (p m n : int) :
  `|m| <= `|n| =>
  p ^ m %| p ^ n.
proof.
  rewrite (pow_normr p m) (pow_normr p n) => lenormr2.
  apply/dvdzP; exists (p ^ (`|n| - `|m|)).
  by rewrite -exprD_nneg; [apply subr_ge0|apply normr_ge0|rewrite -addrA].
qed.


(*-----------------------------------------------------------------------------*)

(*TODO: this lemma is admitted, and weaker that the ones below.*)
(* print modz_pow2_div. *)

lemma dvdz_mod_div d1 d2 m :
  0 < d1 =>
  0 < d2 =>
  d2 %| d1 =>
  m %% d1 %/ d2 = (m %/ d2) %% (d1 %/ d2).
proof.
  move => lt0d1 lt0d2 /dvdzP [q ->>]; rewrite modzE mulrA -mulNr mulzK; first by rewrite gtr_eqF.
  rewrite divzMDr //; first by rewrite gtr_eqF.
  rewrite addrC modzE; do 2!congr.
  by rewrite (mulrC q) divz_mulp // -(pmulr_lgt0 _ _ lt0d2).
qed.

lemma modz_pow_div x n p m :
  0 < x =>
  0 <= p <= n =>
  m %% x ^ n %/ x ^ p = (m %/ x ^ p) %% (x ^ (n - p)).
proof.
  by move => lt0x [le0p lepn]; rewrite dvdz_mod_div //;
  [apply expr_gt0|apply expr_gt0|apply dvdz_exp2l|rewrite exprD_subz // gtr_eqF].
qed.

lemma modz_pow2_div n p m :
  0 <= p <= n =>
  m %% 2 ^ n %/ 2 ^ p = (m %/ 2 ^ p) %% (2 ^ (n - p)).
proof. by apply modz_pow_div. qed.


(*-----------------------------------------------------------------------------*)

lemma eq_range m n : m = n <=> m \in range n (n+1).
proof. by rewrite mem_range ltzS eqz_leq. qed.

lemma range_div_range m d min max : 0 < d => m %/ d \in range min max <=> m \in range (min * d) (max * d).
proof.
move => lt0d; rewrite !mem_range !andabP; apply andb_id2.
+ by apply lez_divRL.
by rewrite -ltz_divLR // ltzS.
qed.

lemma eq_div_range m d n : 0 < d => m %/ d = n <=> m \in range (n * d) ((n + 1) * d).
proof. by move => lt0d; rewrite eq_range range_div_range. qed.


(*-----------------------------------------------------------------------------*)

abbrev (%\) (m d : int) : int = - ((- m) %/ d).

lemma lez_ceil m d : d <> 0 => m <= m %\ d * d.
proof. by rewrite mulNr => neqd0; apply/ler_oppr/lez_floor. qed.

lemma ltz_floor m d : 0 < d => (m %\ d - 1) * d < m.
proof. by rewrite -opprD mulNr => lt0d; apply/ltr_oppl/ltz_ceil. qed.

lemma lez_NdivNLR (d m n : int) : 0 < d => d %| n => m <= n %\ d <=> m * d <= n.
proof.
move => lt0d dvddn; rewrite ler_oppr lez_divLR //; first by apply dvdzN.
by rewrite mulNr ler_opp2.
qed.

lemma lez_NdivNRL (m n d : int) : 0 < d => m %\ d <= n <=> m <= n * d.
proof. by move => lt0d; rewrite ler_oppl lez_divRL // mulNr ler_opp2. qed.

lemma ltz_NdivNLR (m n d : int) : 0 < d => m < n %\ d <=> m * d < n.
proof. by move => lt0d; rewrite ltr_oppr ltz_divLR // mulNr ltr_opp2. qed.

lemma ltz_NdivNRL (d m n : int) : 0 < d => d %| m => m %\ d < n  <=> m < n * d.
move => lt0d dvddm; rewrite ltr_oppl ltz_divRL //; first by apply dvdzN.
by rewrite mulNr ltr_opp2.
qed.
