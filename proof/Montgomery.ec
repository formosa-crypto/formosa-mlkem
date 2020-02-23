require import Int IntDiv IntExtra StdOrder. 


abstract theory Montgomery'.

(* [`R] is a poweer of 2 *)
op k: int.
axiom k_pos: 0 < k.

op R = 2^k.

lemma R_gt0: 0 < R by smt(powPos).

(* [N] is the modulus *)
op N: int.
axiom N_bnd: 0 < N.

op N' : int.
axiom NN': (N * N') %% R = (-1) %% R.
op Rinv : int.
axiom RRinv: (R * Rinv) %% N = 1 %% N.


op REDC' (T: int) : int =
 let m = ((T %% R)*N') %% R
 in (T + m*N) %/ R.

lemma nosmt aux_divR T:
 let m = ((T %% R)*N') %% R
 in (T + m*N) %% R = 0.
proof.
rewrite /= -modzDmr modzMml mulzA -modzMml (mulzC N') modz_mod.
rewrite modzMml -modzMmr NN' modzMmr modzDmr.
have ->: T + T * (-1) = 0 by ring.
smt().
qed.


lemma nosmt REDC'_congr T:
 REDC' T %% N = T * Rinv %% N.
proof.
pose m := ((T %% R)*N') %% R.
pose t := (T + m*N) %/ R.
have tE: t*R = T + m*N.
 have:= (divz_eq (T + m * N) R).
 by rewrite aux_divR /= -/t => <-.
have t_modN: t %% N = T*Rinv %% N.
 rewrite -(mulz1 t) -modzMmr -RRinv modzMmr -mulzA tE mulzDl.
 by rewrite mulzA (mulzC N) -mulzA -modzDml modzMDr modz_mod.
by rewrite /REDC'.
qed.

lemma nosmt REDC'_bnds T n:
 0 <= n =>
 0 <= T < N + N * R^(n+1) =>
 0 <= REDC' T < N + N*R^n.
proof.
pose m := ((T %% R)*N') %% R.
pose t := (T + m*N) %/ R.
move=> Hn; rewrite powS //; move=> [HT1 HT2].
have [Hm1 Hm2]: 0 <= m < R.
 split => *; first smt. (*modz_ge0*)
 move: (ltz_mod ((T %% R)*N') R _); first smt.
 rewrite -/m. 
 have ->//: `|R| = R.
 rewrite -IntOrder.ger0_def.
 by apply ltzW; apply R_gt0.
have Ht: 0 <= t < N + N*R^n.
 split => *; first by smt.
 rewrite /t ltz_divLR 1:/#.
 have ?: m * N <= N*R - N.
  rewrite mulzC.
  have ->: N*R-N = N*(R-1) by ring.
  apply IntOrder.ler_pmul2l.
  smt.
  smt.
 smt.
rewrite /REDC /= -/t; case: (N <= t); smt().
qed.

end Montgomery'.

theory Montgomery.

clone import Montgomery'.

op REDC T = let t = REDC' T in if N <= t then t-N else t.

lemma REDC_corr T:
 0 <= T < N + N*R =>
 0 <= REDC T < N  /\  REDC T %% N = T * Rinv %% N.
proof.
move=> *; rewrite /REDC /=; split.
 move: (REDC'_bnds T 0 _) => //=.
 rewrite pow1 pow0 H /= /#.
rewrite -(REDC'_congr T).
case: (N <= REDC' T) => // ?.
by rewrite (_:REDC' T - N = REDC' T + (-1) * N) 1:/# modzMDr.
qed.

end Montgomery.

theory MontgomeryLimbs.

(* number of limbs *)
op r: int.
axiom r_ge0 : 0 < r.

(* w is the word size *)
op w : int.
axiom w_ge0 : 0 <= w.

(* [N] is the modulus *)
op N: int.

clone import Montgomery' with
  op k <- w,
  op N <- N.


op REDCk : int -> int -> int.  
axiom REDCk0 k T :
   k <= 0 => REDCk k T = T.
axiom REDCkS k T:
   0 <= k => REDCk (k+1) T = REDCk k (REDC' T).

lemma REDCk_corr r T:
 0 < r =>
 0 <= T < N + N * R^r =>
 (0 <= REDCk r T < 2*N) /\ REDCk r T %% N = T * Rinv^r %% N.
proof.
elim/natind: r T => /= /> *.
 have ->: n=0 by smt().
 rewrite REDCk0 // /#.
rewrite REDCkS 1:/#. 
move: H3; case: (n=0) => E.
 rewrite E !REDCk0 //= => ?.
 move: (REDC'_bnds T 0 _ _) => //=; rewrite pow0 /= => ?. 
 split.
  split => *; smt().
 rewrite pow1.
 by apply REDC'_congr.
move=> *.
move: (H0 (REDC' T) _ _). smt().
 by move: (REDC'_bnds T n _ _) => //=. 
move=> [??].
split; first smt().
rewrite H5.
move: (REDC'_congr T) => ?.
by rewrite -modzMml H6 modzMml powS /#.
qed.

op REDC T = let t = REDCk r T in if N <= t then t-N else t.

lemma REDC_corr T:
 0 <= T < N + N*R^r =>
 0 <= REDC T < N  /\  REDC T %% N = T * Rinv^r %% N.
proof.
move=> *; rewrite /REDC /=.
move: (REDCk_corr r T _ _) => //. smt.
move=> [??].
case: (N <= REDCk r T); smt.
qed.


end MontgomeryLimbs.


(*
op R2 = R*R %% N.


op to_mont x = REDC(x * R2).
op from_mont y = REDC(y).
*)
