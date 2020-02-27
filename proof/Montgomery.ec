require import Int IntDiv IntExtra StdOrder. 


abstract theory Montgomery'.

(* [`R] is a power of 2 *)
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
 move: (REDC'_bnds T 0 _) => />.
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
 move: (REDC'_bnds T 0 _ _) => //=; rewrite pow0 => ?. 
 split.
  split => *; smt().
 by rewrite pow1; apply REDC'_congr.
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

theory SignedMontgomery.
(* [`R] is a power of 2 *)
op k: int.
axiom k_pos: 0 < k.

op R = 2^k.
lemma Reven : 2 %| R by smt.

lemma R_gt0: 0 < R by smt(powPos).

(* [q] is the modulus *)
op q: int.
axiom q_bnd: 0 < q /\ q < R %/2.
axiom q_odd1: 2 %| (q + 1).
axiom q_odd2: 2 %| (q - 1). 

op qinv : int.
axiom qqinv: (qinv * q) %% R = 1 %% R.
axiom qinv_bnd: 0 <= qinv < R.

op Rinv : int.
axiom RRinv: (R * Rinv) %% q = 1 %% q.

(* EasyCrypt defines division for negative numbers
   as needed: remainder is always positive. 
   We need a special mod to get the balanced 
   representative. *)

op bal_mod(a b : int) =
   let rem = a %% b in
       if (b %/ 2 <= rem) then rem - b else rem.

lemma bal_mod_bnd a b :
   0< b =>  2 %| b =>
  - b %/ 2 <=  bal_mod a b < b %/ 2 by smt().

op SREDC (a: int) : int =
 let a1 = a %/ R in
 let a0 = a %% R in
 let  m = bal_mod (a0 * qinv) R in
 let t1 = (m * q) %/ R in 
     a1 - t1.

lemma nosmt SREDC_corr a:
 0 < q < R %/2 =>
 -R %/ 2 * q <= a < R %/2 * q =>
 -q <= SREDC a <= q /\ (* Paper claims -q < SREDC a < q *)
 SREDC a %% q = (a * Rinv) %% q.
proof.
move => *.
pose a1 := a %/ R.
pose a0 := a %% R.
pose m  := bal_mod (a0 * qinv) R.
pose t1 := (m * q) %/ R.
pose t0 := (m * q) %% R.
have a0bounds : 0 <= a0 < R; first by smt().
have a1bounds : -R %/4 <= - (q+1) %/2 <= a1 <= (q-1) %/2 < R %/4.
move : H0 => [#] alb aup.
split; last by smt().
split; last first.
move => *. 
rewrite /a1.
smt(@IntDiv q_odd1 Reven).
split; first by smt().
move => *. 
rewrite /a1.
smt(@IntDiv q_odd1 Reven).

have t1bounds : -R %/4 <= -(q+1) %/2 <= t1 <= (q-1) %/2 < R %/4.
move : H0 => [#] alb aup.
split; last by smt().
split; last first.
rewrite /t1 /m /a0 /=.
move : (bal_mod_bnd (a %% R * qinv) R R_gt0 _); first by smt.
pose x := bal_mod (a %% R * qinv) R.
move => *.
have ? : ( R%/2 * q %/R = q %/2).  
rewrite (_: R %/ 2 * q %/ R = R * q %/2 %/ R ); first by smt(Reven dvdz_mull dvdz_mulr).
rewrite (_: R * q  %/ 2 %/ R = q * R  %/ 2 %/ R); first by smt().
rewrite (_: q * R  %/ 2 %/ R = q %/ 2 * R %/ R); first by smt(). smt.
rewrite -(_: q %/2 = (q-1) %/ 2).  smt(q_odd2). smt.
split; first by smt().
move => *.
rewrite /t1 /m /a0 /=.
move : (bal_mod_bnd (a %% R * qinv) R R_gt0 _); first by smt.
pose x := bal_mod (a %% R * qinv) R.
move => *.
rewrite (_: -(q+1) %/ 2 = (-R%/2) * (q+1) %/R). 
rewrite (_: (-R %/ 2) * (q+1) %/ R = (-R * (q+1) %/2) %/ R ); first by smt(Reven dvdz_mull dvdz_mulr). 
rewrite (_: (- R * (q + 1) %/ 2) = (- (q + 1) * R %/ 2)); first by smt(). 
rewrite (_: (- (q + 1) * R %/ 2) = (- (q + 1) %/ 2 * R)); first by smt(q_odd1). 
rewrite -(_: -q %/2 - 1 = - (q + 1) %/ 2).  smt(q_odd1). smt. smt.
have nooverflow: -q <= a1 - t1 <= q; first by smt().
split; first by rewrite /SREDC -/a1 -/a0 /= -/m -/t1; apply nooverflow.
rewrite /SREDC  -/a0 -/a1 /= -/m -/t1. 
pose t := m*q.
have subeq : (a-t = (a1 - t1)*R + (a0 - t0)). smt.
have a0t0cancel : (a0 = t0). 
rewrite /a0 /t0 /m /bal_mod /a0 //=.
case (R %/ 2 <= a %% R * qinv %% R); last first.
progress.  
rewrite (_: a %% R * qinv %% R * q %% R = a %% R * (qinv * q) %% R). 
rewrite modzMml. smt().  rewrite modzMml -modzMml -modzMm. smt.
progress.
rewrite (_: (a %% R * qinv %% R -R) * q %% R = a %% R * (qinv * q) %% R). 
admit. rewrite modzMml -modzMml -modzMm. smt.
move : subeq; rewrite (_: a0 - t0 = 0) => />; first by smt().
move => *.
rewrite (_: (a1 - t1) %% q = (a1 - t1) * (R * Rinv) %% q). 
rewrite -modzMm. smt. rewrite Ring.IntID.mulrA -H1 /t. 
search ( +).
rewrite Ring.IntID.mulrDl.
rewrite (_:(-m * q) * Rinv = (-m*Rinv)*q). smt.
rewrite Ring.IntID.addrC -modzDm modzMl => />. 
by rewrite modz_mod.
qed.
end SignedMontgomery.

theory FQMUL_correct.

clone import SignedMontgomery with
    op k <- 16,
    op q <- 2^8*13+1,
    op qinv <- 62209,
    op Rinv <- 169.

require import List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.

require import Fqmul.

print M.

lemma fqmul_corr _a _b :
  hoare [ M.fqmul : 
     -R %/ 2 <= _a < R %/2 /\
     0 <= _b < 2^8*13+1 /\
     W16.to_sint a = _a /\ W16.to_sint b = _b ==> 
        W16.to_sint res = SREDC (_a * _b) ].
proof.
proc.
auto => />.
move => &hr albnd aubnd blbnd bubnd.
rewrite /SREDC !SAR_32_sem /bal_mod => />. 
rewrite (_: (to_sint
                   (sigextu32 a{hr} * sigextu32 b{hr} * (of_int 62209)%W32 `<<`
                    (of_int 16)%W8)) = to_sint b{hr} * 62209 * R). 
admit.

search W32.to_sint.
admit.
qed.

end FQMUL_correct.
