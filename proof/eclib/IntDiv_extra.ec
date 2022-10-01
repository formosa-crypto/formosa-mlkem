require import AllCore StdOrder List Ring Int IntDiv IntMin.
(*---*) import IntOrder.
require import Montgomery.


(*-----------------------------------------------------------------------------*)
(* p-adic value and lemmas linked to it. *)
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
move => lt1b neqx0; rewrite /vp; apply/(argmaxP ((^) b) (transpose (%|) x) 0 `|x| _ _ _ _) => //=.
+ apply/normr_ge0. 
+ rewrite expr0 /= dvd1z /=. 
+ apply vp_bound.
assumption.
assumption.
qed.

lemma vp0 b x : 1 < b => x <> 0 => x %% b <> 0 => vp b x = 0.
proof.
rewrite -dvdzE /vp => lt1b neqx0 Ndvdbx; apply argmax_eq => //=.
rewrite expr0 /= dvd1z /=. 
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

lemma pow_mulz b x n : 1 < b => x <> 0 => 0 <= n => b ^ n * x = b ^ (vp b x + n) * vp_rem b x.
proof. by rewrite mulrC (mulrC (_ ^ _)%IntID); apply mulz_pow. qed.

lemma divz_pow b x n : 1 < b => x <> 0 => 0 <= n <= vp b x => x %/ (b ^ n) = vp_rem b x * b ^ (vp b x - n).
proof.
move => lt1b neqx0 [le0n len_]; rewrite exprD_subz // ?divzpMr ?dvdz_exp2l // ?vp_rem_powK //.
by apply gtr_eqF; move: (ler_lt_add (-1) 0 _ _ _ lt1b).
qed.

lemma pow_divz b x n : 1 < b => 0 < x => vp b x <= n => (b ^ n) %/ x = b ^ (n - vp b x) %/ vp_rem b x.
proof.
move => lt1b lt0x len_; rewrite exprD_subz //; [by rewrite gtr_eqF // ltzE ltzW|by rewrite ge0_vp len_|].
rewrite -divz_mulp; [by rewrite expr_gt0 ltzE ltzW| | ].
+ rewrite ltz_divRL //=; [by rewrite expr_gt0 ltzE ltzW| ].
  by rewrite vp_pow_dvd // gtr_eqF.
by rewrite mulrC vp_rem_powK // gtr_eqF.
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
  b ^ n %| x <=>
  `|n| <= vp b x.
proof.
  move => lt1b neqx0; split.
  + move => dvdpowx; case (n = 0) => [->>|/normr_gt0 lt0normn].
    - by apply/(lez_trans 0) => //; apply/ge0_vp.
    rewrite /vp -ge_argmax //; split; last by exists `|n|; rewrite /= -pow_normr.
    exists `|x|; rewrite normr_ge0 /= => k lenormrk; apply/negP => {dvdpowx} dvdpowx.
    move: (dvdz_trans _ _ _ (dvdz_exp2l b `|x| k _) dvdpowx); first by rewrite normr_ge0.
    by rewrite -pow_normr negP Ndvd_pow // ltr_normr; left.
  move => lenormnvp; rewrite pow_normr (dvdz_trans (b ^ vp b x)); last by rewrite vp_pow_dvd.
  by rewrite dvdz_exp2l normr_ge0.
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

lemma vp_oppr b x : 1 < b => x <> 0 => vp b (-x) = vp b x.
proof.
  move => lt1b neqx0; rewrite /vp; apply argmax_eq => //=.
  + by rewrite ge0_vp.
  + by rewrite dvdzN vp_pow_dvd.
  move => j ltvpj; move: (contra _ _ (dvdzN (b ^ j) (-x))) => /= -> //.
  by rewrite vp_le_pow_dvd // -ltrNge ltr_normr; left.
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
abort.


(*-----------------------------------------------------------------------------*)
(* Specific lemmas to deal with exponentials when the exponent is constrained to a range. *)

lemma exprS_range min max k :
  k \in range min max =>
  forall (b : int) ,
    0 <= min =>
    b * (b ^ k) = b ^ (k + 1).
proof.
  move => mem_k_range b le0min; rewrite exprS //.
  by move: mem_k_range; apply mem_range_le.
qed.

lemma exprS_add_range min max k :
  k \in range min max =>
  forall (b n : int) ,
    -n <= min =>
    b * (b ^ (k + n)) = b ^ (k + (n + 1)).
proof.
  move => mem_k_range b n lemax; rewrite -exprS //; [|by rewrite -addrA].
  by rewrite -(opprK n) subr_ge0; move: mem_k_range; apply mem_range_le.
qed.

lemma exprS_sub_range min max k :
  k \in range min max =>
  forall (b n : int) ,
    max <= n + 1 =>
    b * (b ^ (n - k)) = b ^ ((n + 1) - k).
proof.
  move => mem_k_range b n lemax; rewrite -exprS //; [|by rewrite addrAC].
  by rewrite subr_ge0; move: mem_k_range; apply mem_range_ge.
qed.

lemma exprSr_range min max k :
  k \in range min max =>
  forall (b : int) ,
    0 <= min =>
    (b ^ k) * b = b ^ (k + 1).
proof.
  move => mem_k_range b le0min; rewrite exprSr //.
  by move: mem_k_range; apply mem_range_le.
qed.

lemma exprSr_add_range min max k :
  k \in range min max =>
  forall (b n : int) ,
    -n <= min =>
    (b ^ (k + n)) * b = b ^ (k + (n + 1)).
proof.
  move => mem_k_range b n le0; rewrite -exprSr //; [|by rewrite addrA].
  by rewrite -(opprK n) subr_ge0; move: mem_k_range; apply mem_range_le.
qed.

lemma exprSr_sub_range min max k :
  k \in range min max =>
  forall (b n : int) ,
    max <= n + 1 =>
    (b ^ (n - k)) * b = b ^ ((n + 1) - k).
proof.
  move => mem_k_range b n lemax; rewrite -exprSr //; [|by rewrite addrAC].
  by rewrite subr_ge0; move: mem_k_range; apply mem_range_ge.
qed.

lemma pow_div1_range min max k :
  k \in range min max =>
  forall (b : int) ,
    0 < b =>
    0 < min =>
    (b ^ k) %/ b = b ^ (k - 1).
proof.
  move => mem_k_range b lt0b lt0min; rewrite pow_div1 //.
  by move: mem_k_range; apply mem_range_lt.
qed.

lemma pow_div1_sub_range min max k :
  k \in range min max =>
  forall (b n : int) ,
    0 < b =>
    max <= n =>
    (b ^ (n - k)) %/ b = b ^ ((n - 1) - k).
proof.
  move => mem_k_range b n lt0b lemaxn; rewrite pow_div1 //.
  + by rewrite subr_gt0; move: mem_k_range; apply mem_range_gt.
  by rewrite addrAC.
qed.

lemma exprD_nneg_sub_range min max k :
  k \in range min max =>
  forall (b n : int) ,
    0 < b =>
    0 <= min =>
    max <= n + 1 =>
    b ^ k * b ^ (n - k) = b ^ n.
proof.
  move => mem_k_range b n ? ? ?; rewrite -exprD_nneg.
  + by move: mem_k_range; apply mem_range_le.
  + by rewrite subr_ge0; move: mem_k_range; apply mem_range_ge.
  by rewrite addrA addrAC.
qed.

lemma exprD_nneg_sub_add_range min max k :
  k \in range min max =>
  forall (b m n : int) ,
    0 < b =>
    -n <= min =>
    max <= m + 1 =>
    b ^ (m - k) * b ^ (k + n) = b ^ (m + n).
proof.
  move => mem_k_range b m n ? ? ?; rewrite -exprD_nneg.
  + by rewrite subr_ge0; move: mem_k_range; apply mem_range_ge.
  + by rewrite -(opprK n) subr_ge0; move: mem_k_range; apply mem_range_le.
  by rewrite addrA -(addrA m).
qed.

lemma exprD_nneg_add_sub_range min max k :
  k \in range min max =>
  forall (b m n : int) ,
    0 < b =>
    -n <= min =>
    max <= m + 1 =>
    b ^ (k + n) * b ^ (m - k) = b ^ (m + n).
proof. by move => mem_k_range b m n ? ? ?; rewrite mulrC (exprD_nneg_sub_add_range _ _ _ mem_k_range). qed.

lemma divz_pow_range min max k :
  k \in range min max =>
  forall b x ,
    1 < b =>
    x <> 0 =>
    0 <= min =>
    max <= vp b x + 1 =>
    x %/ b ^ k = vp_rem b x * b ^ (vp b x - k).
proof.
  move => mem_k_range b x lt1b neqx0 le0min ltmaxvp.
  by rewrite divz_pow // le2_mem_range; move: mem_k_range; apply mem_range_incl.
qed.

lemma divz_pow_add_range min max k :
  k \in range min max =>
  forall b (n : int) x ,
    1 < b =>
    x <> 0 =>
    -n <= min =>
    max <= vp b x + 1 - n =>
    x %/ b ^ (k + n) = vp_rem b x * b ^ (vp b x - n - k).
proof.
  move => mem_k_range b n x lt1b neqx0 le0min ltmaxvp.
  rewrite divz_pow //.
  + by rewrite le2_mem_range mem_range_addr; move: mem_k_range; apply mem_range_incl.
  by rewrite (IntID.addrC k) opprD addrA.
qed.

lemma divz_pow_sub_range min max k :
  k \in range min max =>
  forall b x n ,
    1 < b =>
    x <> 0 =>
    max <= n + 1 =>
    n <= min + vp b x =>
    x %/ b ^ (n - k) = vp_rem b x * b ^ (k + vp b x - n).
proof.
  move => mem_k_range b x n lt1b neqx0 le0min ltmaxvp.
  rewrite divz_pow //.
  + rewrite le2_mem_range mem_range_subl; move: mem_k_range; apply mem_range_incl => //.
    by rewrite -ltzE addrC ltr_subl_addr addrA ltzS.
  by rewrite opprD /= addrA (IntID.addrC _ k) addrA.
qed.

lemma NdivzN_pow_range min max k :
  k \in range min max =>
  forall b x ,
    1 < b =>
    x <> 0 =>
    0 <= min =>
    max <= vp b x + 1 =>
    x %\ (b ^ k) = vp_rem b x * b ^ (vp b x - k).
proof.
  move => mem_k_range b x lt1b neqx0 le0min ltmaxvp.
  rewrite divz_pow //=; [by rewrite eqr_oppLR| |].
  + rewrite le2_mem_range; move: mem_k_range.
    by apply mem_range_incl => //; rewrite vp_oppr.
  rewrite dvdNdiv //.
  + by rewrite gtr_eqF // expr_gt0 ltzE ltzW.
  + by rewrite vp_oppr // vp_pow_dvd.
  by rewrite mulNr opprK vp_oppr.
qed.

lemma NdivzN_pow_add_range min max k :
  k \in range min max =>
  forall b (n : int) x ,
    1 < b =>
    x <> 0 =>
    0 <= min + n =>
    max + n <= vp b x + 1 =>
    x %\ (b ^ (k + n)) = vp_rem b x * b ^ (vp b x - n - k).
proof.
  move => mem_k_range b n x le0Sb neqx0 le0min ltmaxvp.
  rewrite (NdivzN_pow_range (min + n) (max + n)) //.
  + by rewrite mem_range_addr -addrA /= -addrA.
  by rewrite opprD addrA addrAC.
qed.

lemma NdivzN_pow_sub_range min max k :
  k \in range min max =>
  forall b x n ,
    1 < b =>
    x <> 0 =>
    max <= n + 1 =>
    n <= min + vp b x =>
    x %\ (b ^ (n - k)) = vp_rem b x * b ^ (k + vp b x - n).
proof.
  move => mem_k_range b x n ? ? ? ?.
  rewrite (NdivzN_pow_range (n - max + 1) (n - min + 1)) //.
  + by rewrite mem_range_subl !opprD /=; do 4!(rewrite addrAC //=).
  + by rewrite addrAC subr_ge0.
  + by rewrite ler_add // ler_subl_addl.
  by rewrite opprD /= addrA addrAC (IntID.addrC k).
qed.

lemma expr_le_range min max k n :
  k \in range min max =>
  forall (b : int) ,
    0 < b =>
    0 <= min =>
    max <= n + 1 =>
    b ^ k <= b ^ n.
proof.
  move => mem_k_range b ? ? ?; rewrite ler_weexpn2l.
  + by rewrite -ltzS -ltr_subl_addr.
  by rewrite le2_mem_range; move: mem_k_range; apply mem_range_incl.
qed.

lemma expr_add_le_range min max k n :
  k \in range min max =>
  forall (b m : int) ,
    0 < b =>
    0 <= min + m =>
    max + m <= n + 1 =>
    b ^ (k + m) <= b ^ n.
proof.
  move => mem_k_range b m ? ? ?; rewrite (expr_le_range (min + m) (max + m)) //.
  by rewrite mem_range_addr -addrA /= -addrA.
qed.

lemma expr_sub_le_range min max k n :
  k \in range min max =>
  forall (b m : int) ,
    0 < b =>
    0 <= m - max + 1 =>
    m - min + 1 <= n + 1 =>
    b ^ (m - k) <= b ^ n.
proof.
  move => mem_k_range b m ? ? ?; rewrite (expr_le_range (m - max + 1) (m - min + 1)) //.
  by rewrite mem_range_subl !opprD /=; do 4!(rewrite addrAC /=).
qed.

lemma le_expr_range min max k (n : int) :
  k \in range min max =>
  forall (b : int) ,
    0 < b =>
    `|n| <= min =>
    b ^ n <= b ^ k.
proof.
  move => mem_k_range b ? ?; rewrite (pow_normr _ n) ler_weexpn2l.
  + by rewrite -ltzS -ltr_subl_addr.
  by rewrite normr_ge0 /=; move: mem_k_range; apply mem_range_le.
qed.

lemma le_expr_add_range min max k (n : int) :
  k \in range min max =>
  forall (b m : int) ,
    0 < b =>
    `|n| <= min + m =>
    b ^ n <= b ^ (k + m).
proof.
  move => mem_k_range b m ? ?; rewrite (le_expr_range (min + m) (max + m)) //.
  by rewrite mem_range_addr -addrA /= -addrA.
qed.

lemma le_expr_sub_range min max k (n : int) :
  k \in range min max =>
  forall (b m : int) ,
    0 < b =>
    `|n| <= m - max + 1 =>
    b ^ n <= b ^ (m - k).
proof.
  move => mem_k_range b m ? ?; rewrite (le_expr_range (m - max + 1) (m - min + 1)) //.
  by rewrite mem_range_subl !opprD /=; do 4!(rewrite addrAC /=).
qed.
