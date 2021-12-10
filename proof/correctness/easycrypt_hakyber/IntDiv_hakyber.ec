require import AllCore StdOrder List Ring IntDiv.
(*---*) import IntOrder.
require import Logic_extra Ring_extra Int_extra IntDiv_extra.


(*-----------------------------------------------------------------------------*)

op vp (b x : int) = argmax ((^) b) (transpose (%|) x).

abbrev vp_rem b x = x %/ (b ^ (vp b x)).

lemma vp_bound b x : 1 < b => x <> 0 => forall n, `|x| <= n => ! b ^ n %| x.
proof.
move => lt1b neqx0 n le_n; apply/negP => dvdpowx.
move: (dvdz_trans _ _ _ (dvdz_exp2l b `|x| n _) dvdpowx); first by rewrite normr_ge0.
by rewrite -pow_normr negP Ndvd_pow // ltr_normr; left.
qed.

lemma ge0_vp b x : 0 <= vp b x.
proof. by rewrite /vp; apply/ge0_argmax. qed.

lemma vp_pow_dvd b x : 1 < b => x <> 0 => (b ^ (vp b x)) %| x.
proof.
by move => lt1b neqx0; rewrite /vp; apply/(argmaxP ((^) b) (transpose (%|) x) 0 `|x| _ _ _ _) => //=;
[apply/normr_ge0|rewrite expr0 dvd1z|apply vp_bound].
qed.

lemma vp0 b x : 1 < b => x <> 0 => x %% b <> 0 => vp b x = 0.
proof.
rewrite -dvdzE /vp => lt1b neqx0 Ndvdbx; apply argmax_eq => //=; first by rewrite expr0 dvd1z.
by move=> j /ltzE /= le1j; move: Ndvdbx; apply/implybNN/dvdz_trans; move: (dvdz_exp2l b 1 j); rewrite expr1 le1j.
qed.

lemma vp_dvd b x : 1 < b => x <> 0 => x %% b = 0 => vp b x = vp b (x %/ b) + 1.
proof.
rewrite -dvdzE /vp => lt1b neqx0 /dvdz_eq eq_x; rewrite -{1}eq_x; apply argmax_eq => //=.
+ by apply addz_ge0; rewrite // ge0_argmax.
+ rewrite exprSr ?ge0_argmax /=; apply dvdz_mul; last by rewrite dvdzz.
  by apply vp_pow_dvd => //; move: neqx0; rewrite-{1} eq_x; apply implybNN => ->.
move=> j /ltr_subr_addr ltvp_; move: (argmax_max _ _ `|x %/ b| _ _ _ ltvp_); first by apply normr_ge0.
+ move => n /=; apply vp_bound => //; first by move: neqx0; rewrite-{1} eq_x; apply implybNN => ->.
apply implybNN => /= /dvdzP [q eq__]; apply/dvdzP; exists q; move: eq__.
rewrite -{1}(IntID.subrK j 1) exprSr; first by apply (lez_trans _ _ _ (ge0_argmax _ _) (ltzW _ _ ltvp_)).
by rewrite mulrA; apply/IntID.mulIf/neq_ltz; right; apply/(ltz_trans 1).
qed.

hint simplify vp0, vp_dvd.

lemma vp_rem_powK b x : 1 < b => x <> 0 => (vp_rem b x) * (b ^ (vp b x)) = x.
proof. by move => lt1b neqx0; rewrite divzK; move: (vp_pow_dvd b _ lt1b neqx0). qed.

lemma vp_rem_ndvd b x :  1 < b => x <> 0 => !(b %| vp_rem b x).
proof.
move => lt1b neqx0; apply/negP => dvdb_; move: (dvdz_mul _ (b ^ (vp b x)) _ (b ^ (vp b x)) dvdb_).
rewrite dvdzz /= vp_rem_powK // -IntID.exprS 1:ge0_vp.
move: (argmax_max ((^) b) (transpose (%|) x) `|x|).
by move=> /= -> //=; [apply normr_ge0|apply vp_bound|rewrite /vp ltzE].
qed.

lemma mulz_pow b x n : 1 < b => x <> 0 => 0 <= n => x * b ^ n = vp_rem b x * b ^ (vp b x + n).
proof. by move => lt1b neqx0 le0n; rewrite exprD_nneg // ?ge0_vp mulrA vp_rem_powK. qed.

lemma divz_pow b x n : 1 < b => x <> 0 => 0 <= n <= vp b x => x %/ (b ^ n) = vp_rem b x * b ^ (vp b x - n).
proof.
move => lt1b neqx0 [le0n len_]; rewrite exprD_subz // ?divzpMr ?dvdz_exp2l // ?vp_rem_powK //.
by apply gtr_eqF; move: (ler_lt_add (-1) 0 _ _ _ lt1b).
qed.

lemma vp_pow b n : 1 < b => 0 <= n => vp b (b ^ n) = n.
proof.
move => lt1b le0n; rewrite /vp; apply argmax_eq => //=; first by apply dvdzz.
move => j ltnj; apply/negP => dvdpow2; move: (dvd_le_pow _ _ _ _ dvdpow2).
  + by apply/ltr_normr; left.
rewrite (ger0_norm n) // => lenormrjn; move: (ler_lt_trans _ _ _ lenormrjn ltnj).
by apply/negP/lezNgt/ler_norm.
qed.

lemma vp_le_pow_dvd (b x n : int) :
  1 < b =>
  x <> 0 =>
  b ^ n %| x =>
  n <= vp b x.
proof.
  move => lt1b neqx0 dvdpowx; case (0 < n) => [lt0n|/lezNgt len0]; last first.
  + by apply/(lez_trans 0) => //; apply/ge0_vp.
  rewrite /vp -ge_argmax //; split; last by exists n.
  exists `|x|; rewrite normr_ge0 /= => k lenormrk; apply/negP => {dvdpowx} dvdpowx.
  move: (dvdz_trans _ _ _ (dvdz_exp2l b `|x| k _) dvdpowx); first by rewrite normr_ge0.
  by rewrite -pow_normr negP Ndvd_pow // ltr_normr; left.
qed.

lemma vp_le_dvd_pow (b x n : int) :
  1 < b =>
  x <> 0 =>
  x %| b ^ n =>
  vp b x <= `|n|.
proof.
  move => lt1b neqx0 dvdxpow; rewrite /vp -le_argmax; first by apply normr_ge0.
  move => [j [le0j _]] k ltnormrk /=; apply/negP => dvdpowx.
  move: (dvdz_trans _ _ _ (dvdz_trans _ _ _ (dvdz_exp2l b (`|n| + 1) k _) dvdpowx) dvdxpow).
  + by rewrite -ltzE ltnormrk /= addr_ge0 // normr_ge0.
  rewrite exprS ?normr_ge0 // -pow_normr.
  move => /dvdzP [q]; rewrite mulrA eqz_mul ?dvdzz; first by apply/gtr_eqF/expr_gt0/ltzE/ltzW.
  rewrite divzz neq_ltz expr_gt0; first by apply/ltzE/ltzW.
  (*TODO: any way to make q an exists again?*)
  move => Heq; move: (dvdzP b 1) => [_ dvd1b]; move: (dvd1b _).
  + by exists q; rewrite -Heq /=.
  by rewrite dvdz1 eqr_norml /= negb_or; split; apply/gtr_eqF => //; apply/ltzE/ltzW/ltzE/ltzW.
qed.

lemma dvd_pow_prime b x n :
  prime b =>
  0 <= x =>
  0 <= n =>
  x %| b ^ n =>
  x = b ^ vp b x.
proof.
  move => primeb le0x le0n.
  case (x = 0) => [->>|neqx0 dvdxpow].
  + by rewrite dvd0z expf_eq0 => -[_ ->>].
  move: (dvdxpow); rewrite -{1}(vp_rem_powK b) ?gt1_prime // => /dvdzP [q].
  rewrite mulrA => /(congr1 (transpose (%/) (b ^ vp b x))) /=.
  rewrite mulzK -?exprD_subz.
  + by apply/gtr_eqF/expr_gt0/gt0_prime.
  + by apply/gtr_eqF/gt0_prime.
  + rewrite ge0_vp /=; move: (vp_le_dvd_pow b x n _ _ _) => //; first by apply/gt1_prime.
    by rewrite ger0_norm.
  move => Heq; move: (dvdzP (vp_rem b x) (b ^ (n - vp b x))) => [_ /(_ _)].
  + by exists q.
  move => {Heq} Hdiv.
  rewrite -{1}(vp_rem_powK b x) //; first by apply gt1_prime.
  rewrite eq_sym eqz_mul.
  + by apply/gtr_eqF/expr_gt0/gt0_prime.
  + by apply/dvdzz.
  rewrite divzz neq_ltz /b2i expr_gt0 ?gt0_prime //= eq_sym.
  have Hndvd:= (vp_rem_ndvd b x _ _) => //; first by apply/gt1_prime.
  search _ prime.
  print prime.
abort.
