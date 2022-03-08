require import AllCore IntDiv Ring StdOrder.
import Ring.IntID IntOrder.

(***** TO MOVE *****)

lemma div_pow x n m : 0 <= m <= n => 0 < x => x^n %/ x^m = x^(n - m).
proof. (* FIXME: move *)
move=> le_0mn gt0_x; rewrite eq_sym eqz_div.
+ by apply/gtr_eqF/expr_gt0.  
+ by apply/dvdzP; exists (x^(n - m)); rewrite -exprD_nneg /#.
+ by rewrite -exprD_nneg /#.
qed.

lemma pow_div1 b k :
  0 < k => 0 < b => b^k %/ b = b^(k - 1).
proof. by move=> *; rewrite -div_pow ?expr1 //#. qed.

lemma pow_div2 b k :
  1 < k => 0 < b => b^k %/ b^2 = b^(k - 2).
proof. by move=> *; rewrite -div_pow //#. qed.

lemma div_mulr p q m : m %| q => (p * q) %/ m = p * (q %/ m).
proof. (* FIXME: move *)
case: (m = 0) => [->>//|nz_m /dvdzE z_mq].
by rewrite {1}(divz_eq q m) z_mq /= mulrCA mulrA mulzK // mulrC.
qed.

lemma div_mull p q m : m %| p => (p * q) %/ m = (p %/ m) * q.
proof. (* FIXME: move *)
by move=> dvd_mp; rewrite mulrC div_mulr // mulrC.
qed.

lemma dvdNz (m n : int) : ((-m) %| n) = (m %| n).
proof. (* FIXME: move *) by rewrite !dvdzE modzN. qed.

lemma div_mul p m n : 0 <= m => m %| p => p %/ (m * n) = p %/ m %/ n.
proof. (* FIXME: move *)
rewrite ler_eqVlt => -[<-//|gt0_m /dvdzE z_pm].
by rewrite {1}(divz_eq p m) z_pm /= (mulrC m n) divzMpr.
qed.

lemma divM_mul p q m n :
  0 <= m => m %| p => n %| q => (p * q) %/ (m * n) = (p %/ m) * (q %/ n).
proof. (* FIXME: move *)
move=> ge0_m dvd_mp dvd_nq; rewrite div_mul // 1:dvdz_mulr //.
by rewrite div_mull // div_mulr.
qed.

(********************************)

theory SignedReductions.

(* [`R] is a power of 2 *)
op k : { int | 2 < k } as gt2_k.

op R = 2^k.

lemma dvd4R : 4 %| R
  by have -> : (4 = 2^2); smt(expr2 dvdz_exp2l gt2_k). 

hint exact : dvd4R.

lemma dvd2R : 2 %| R.
proof. by apply: (dvdz_trans 4). qed.

hint exact : dvd2R.

lemma gt0_R: 0 < R by apply: expr_gt0.

(* [q] is the modulus *)
op q: int.
axiom q_bnd: 0 < q /\ q < R %/2.
axiom q_odd1: 2 %| (q + 1).
lemma q_odd2: 2 %| (q - 1) by smt(q_odd1).

op qinv : int.
axiom qqinv: (qinv * q) %% R = 1 %% R.
axiom qinv_bnd: 0 <= qinv < R.

op Rinv : int.
axiom Rinv_gt0 : 0 < Rinv.
axiom RRinv: (R * Rinv) %% q = 1 %% q.

op smod (a b : int) =
    if (b %/ 2 <= a %% b) 
    then a %% b - b 
    else a %% b axiomatized by smodE.

lemma smod_bnd a b :
   0< b =>  2 %| b =>
  - b %/ 2 <=  smod a b < b %/ 2 by smt(smodE).

lemma smod_congr a b :  (smod a b) %% b = a %% b.
rewrite smodE /=. 
case (b %/ 2 <= a %% b); last by rewrite modz_mod.
rewrite (_: a%%b - b = a %%b + (-1)*b); first by ring.
by rewrite modzMDr modz_mod.
qed.

lemma smod_sq t: smod (t %/ R %% (R ^ 2)) R = smod (t %/ R) R.
proof.
rewrite !smodE. 
have -> : t %/ R %% (R ^ 2) %% R = t %/ R  %% R; last by done.
rewrite expr2; apply modz_dvd. 
by apply (dvdz_mulr _); smt(gt0_R).
qed.

lemma wd_bnd x : 0 <= x  %% (R*R) %/ R < `| R |
  by rewrite (_: `| R| = R); rewrite ?normr_idP; smt(gt0_R).  

lemma smod_small x y:
   1 < y =>
   -y %/ 2 <= x < y %/2 =>
   smod x y = x by smt().

lemma smod_div x : smod (x * R) (R ^ 2) %/ R = smod x  R.
proof.
rewrite !smodE expr2 !(div_mulr _ _ _ dvd2R).  
rewrite -!mulz_modl; first by apply gt0_R.
case (R * (R %/ 2) <= x %% R * R ); 1: by smt(dvd2R gt0_R).
rewrite mulrC => H.
by have -> : !(R %/ 2 <= x %% R); smt(ler_wpmul2r gt0_R).
qed.


lemma smod_exists x y : exists k, smod x y = x + k * y.
proof.
rewrite smodE;case (y %/ 2 <= x %%y).
+ by move => *; exists (- (x %/ y + 1)); smt(modzE gt0_R).
by move => *; exists (- x %/ y); smt(modzE gt0_R).
qed.

lemma inrange a :  0 <= a < R %/ 2 => a %% R = a by smt().
lemma outrange a :  - R%/2 <= a < 0 => a %% R = R + a by smt().

lemma sign_comp a b: smod (a %%R + b %% R) R = smod (a + b) R
   by move => *; rewrite !smodE modzDm.

(* Signed Barrett reduction as used in Kyber 2.0 *)

op BREDC(a bits : int) =
   let t = smod (a * (2^bits %/ q + 1)) (R^2) %/ 2^bits * q in
      smod (a %% R + (-t) %% R) R.

require import Barrett_kyber_general.

lemma nosmt BREDCp_corr a bits:
   0 < 2 * q < R %/2 =>
   R < 2^bits =>
   2 ^ bits %/ q * q < 2 ^ bits =>
   2^bits %/ q + 1 < R =>
   -R %/ 2 <= a < R %/2 =>
   (forall (a0 : int),
     - R %/ 2 <= a0 < R %/ 2 => 
        barrett_pred a0 (2 ^ bits) q (2 ^ bits %/ q + 1)) =>
          0  <= BREDC a bits < 2 * q /\ BREDC a bits %% q = a %% q.
proof.
move => [#] ?? ? ? H3 [#] H4 H5 H6;rewrite /BREDC /=.
have extra : (0 <= 2^bits %/ q + 1); first by smt().
have tubnd : (a * (2^bits %/ q + 1) < R %/2 * R). 
   move : H3 H4 H5; rewrite /R pow_div1; first 2 by smt(gt2_k). 
   case (a <= 0); first by smt(). 
   by move => *; apply ltr_pmul => /#. 
have tlbnd : (- R %/2 * R<= a * (2^bits %/ q + 1)).
   move : H3 H4 H5; rewrite /R pow_div1; first 2 by smt(gt2_k). 
   case (0<=a); first by smt().
   move => ????.
   have ? : (-a * (2 ^ bits %/ q + 1) <= 2 ^ (k - 1) * 2 ^ k); last by smt().
   rewrite  (_:  - a * (2 ^ bits %/ q + 1) = 
                (- a) * (2 ^ bits %/ q + 1)); first   by smt().
   by apply ler_pmul => /#. 
rewrite (smod_small (a * (2 ^ bits %/ q + 1)) (R^2) _ _); first by smt(expr2). 
rewrite !expr2. smt(@IntOrder).

move : (H6 a _); rewrite /barrett_pred /barrett_pred_low /barrett_pred_high /= 
       => *; first by smt().
rewrite sign_comp smod_small; first 2 by smt().

split; first by smt().

(* Congruence proof *)
rewrite (_: - a * (2 ^ bits %/ q + 1) %/ 2 ^ bits * q = 
            (- a * (2 ^ bits %/ q + 1) %/ 2 ^ bits) * q); first by smt().
by rewrite modzMDr.
qed.

(* Signed Montgomery reduction as used in Kyber v2.0 *)

op SREDC (a: int) : int =
  let u = smod (a * qinv * R) (R^2) in
  let t = smod (a - u %/ R * q) (R^2)in
      smod (t %/ R %% (R^2)) R.

lemma b0 :  R*R %/ 2 = R * (R %/ 2).
proof. by rewrite div_mulr. qed.

lemma b3 : R = R %/ 2 + R %/ 2.
proof. by rewrite -{1}(divzK 2 R) 1:dvd2R /#. qed.

lemma b2 : R*R %/ 2 = R*R %/ 4 + R*R %/ 4.
proof.
rewrite -{1}(divzK 2 ((R * R) %/ 2)).
+ by rewrite b0 dvdz_mulr.
+ by rewrite -div_mul // 1:dvdz_mulr //#.
qed.

lemma b1 : R*R %/4 = R %/2 * R %/2.
proof. by rewrite (divM_mul _ _ 2 2) // div_mulr. qed.


lemma nosmt SREDCp_corr a:
   0 < q < R %/2 =>
   -R %/ 2 * q <= a < R %/2 * q =>
   -q   <= SREDC a <= q /\
       SREDC a %% q = (a * Rinv) %% q.
proof.
move => [#] H H0 [#] H1 H2.
have albnd : (- R * R %/4 <= a).
 case (0<=a); first by smt().
 move => *; rewrite b1.
 have ? : (R %/ 2 * SignedReductions.q <= R %/ 2 * R %/ 2); by smt(gt0_R q_bnd dvd2R).
have aubnd : (a < R* R %/4); first by smt(b1).
rewrite /SREDC /= (smod_div (a * qinv)).
move : (smod_bnd (a * qinv) R _ _); first 2 by smt(gt0_R dvd2R). 
move => inner_bnd.

have ulbnd : (-R*R %/4 <= smod (a * qinv) R * q).
    case (0 <= smod (a * qinv) R); first by smt().
    move => *.
    have ? : ((- (smod (a * qinv) R))*q <= (R %/ 2) * (R %/ 2)); last by smt().
    by apply ler_pmul => /#.

have uubnd : (smod (a * qinv) R * q < R*R %/4). 
    case (smod (a * qinv) R <=0); first by smt().
    have ? : ((smod (a * qinv) R) * q < (R %/ 2) * (R %/ 2)); last by smt().
    case (smod (a * qinv) R <=0); 
    by smt(dvd2R gt0_R q_bnd).

rewrite (smod_small ((a - smod (a * qinv)R * q))); first 2 by  smt(@IntOrder). 
rewrite (smod_sq ((a - smod (a * qinv) R * q))).
rewrite (smod_small ((a - smod (a * qinv) R * q) %/R)); first by smt(). 

have ? : ( (a - smod (a * qinv) R * q) < R %/ 2 *R);first  by  smt(b1 b2  b3).
have ? : ((-R %/ 2) *R< (a - smod (a * qinv) R * q));first  by  smt(b1 b2  b3).
by smt(gt0_R @IntDiv). 

split.

(* Bound proof *)
have aux : (-  smod (a * qinv) R * q <= R %/2 * q).
   have ? : (- smod (a * qinv) R <= R %/2); by smt(b1 b2 b3).
split; last first.
have ? : ( (a - smod (a * qinv) R * q) < q *R);first  by  smt(b1 b2  b3).
 by smt(gt0_R @IntDiv). 

have aux2 : (R %/2 * (-q) <= -  smod (a * qinv) R * q).
   have ? : (-R %/2 <= - smod (a * qinv) R); by smt(b1 b2 b3).

have ? : ((-q) *R<= (a - smod (a * qinv) R * q)). 
   by  smt(b1 b2  b3).
by smt(gt0_R @IntDiv). 

(* Congruence proof *)
move : (smod_exists (a * qinv) R) => kk0_exists.
elim kk0_exists => kk0 kk0_val.
rewrite kk0_val.

rewrite (_: a - (a * qinv + kk0 * R) * q =
      a %/ R * R - ((a * qinv  + kk0 * R) * q) %/ R * R).
rewrite (divzE a).
rewrite (divzE ((a * qinv  + kk0 * R) * q)).
rewrite (_ : (a * qinv + kk0 * R) * q %% R = a %% R).
rewrite mulrDl.
rewrite (_:kk0 * R * q = (kk0 * q) * R); first by smt().
by rewrite modzMDr -Ring.IntID.mulrA -modzMm qqinv modzMm => /#.
by ring.

have scalar1 : (a %/ R * R - (a * qinv +kk0 * R) * q %/ R * R =
             a + (- a * qinv - kk0 * R)*q).
    rewrite !divzE.  ring.
    rewrite  -modzMm -modzDm modzMl /= modz_mod modzMm.
    rewrite (_: a * qinv * q = a * (qinv * q)); first by smt().
    by rewrite -modzMm qqinv modzMmr /= modz_mod; ring.

pose xx := (a %/ R * R - (a * qinv + kk0 * R) * q %/ R * R) %/ R.
rewrite (_: xx %% q = xx * (R * Rinv) %% q).
  by rewrite -(modzMmr _ (R * Rinv) q) RRinv (modzMmr _ (1) q) /=.
rewrite /xx. clear xx.

rewrite Ring.IntID.mulrA.
rewrite (_: (a %/ R * R - (a * qinv + kk0 * R) * q %/ R * R) %/R * R = (a %/ R * R - (a * qinv + kk0 * R) * q %/ R * R)).
apply dvdz_eq.
rewrite (_: (a %/ R * R - (a * qinv + kk0 * R) * q %/ R * R) = (a %/ R  - (a * qinv + kk0 * R) * q %/ R )*R). smt().
apply dvdz_mull. apply dvdzz.
move : scalar1 => /= ->.
by rewrite -modzMml modzMDr modzMml.
qed.

end SignedReductions.


abstract theory Montgomery'.

(* [`R] is a power of 2 *)
op k: int.
axiom k_pos: 0 < k.

op R = 2^k.

lemma R_gt0: 0 < R by smt(expr_gt0).

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
move=> Hn; rewrite exprS //; move=> [HT1 HT2].
have [Hm1 Hm2]: 0 <= m < R.
 split => *; first smt(@IntOrder). 
 move: (ltz_mod ((T %% R)*N') R _); first smt(@IntOrder).
 rewrite -/m.
 have ->//: `|R| = R.
 rewrite -IntOrder.ger0_def.
 by apply ltzW; apply R_gt0.
have Ht: 0 <= t < N + N*R^n.
 split => *; first by smt(@IntOrder).
 rewrite /t ltz_divLR 1:/#.
 have ?: m * N <= N*R - N.
  rewrite mulzC.
  have ->: N*R-N = N*(R-1) by ring.
  apply ler_pmul2l;   smt(@IntOrder).
  smt().
  smt().
qed.

end Montgomery'.

theory Montgomery.

clone import Montgomery'.

op REDC T = let t = REDC' T in if N <= t then t-N else t.

lemma REDC_corr T:
 0 <= T < N + N*R =>
 0 <= REDC T < N  /\  REDC T %% N = T * Rinv %% N.
proof.
move=> H; rewrite /REDC /=; split.
 move: (REDC'_bnds T 0 _) => />.
 rewrite expr1 expr0 H /= /#.
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
elim/natind: r T => /= />.
move => n ? T *.
 have ->: n=0 by smt().
 rewrite REDCk0 // /#.
move => n H H0 T H1 H2 H3.
rewrite REDCkS 1:/#.
move: H3; case: (n=0) => E.
 rewrite E !REDCk0 //= => H4.
 move: (REDC'_bnds T 0 _ _) => //=; rewrite expr0 => H5.
 split.
  split => *; smt().
 by rewrite expr1; apply REDC'_congr.
move=> H3.
move: (H0 (REDC' T) _ _). smt().
 by move: (REDC'_bnds T n _ _) => /=.
move=> [H4 H5].
split; first smt().
rewrite H5.
move: (REDC'_congr T) => H6.
by rewrite -modzMml H6 modzMml exprS /#.
qed.

op REDC T = let t = REDCk r T in if N <= t then t-N else t.

lemma REDC_corr T:
 0 <= T < N + N*R^r =>
 0 <= REDC T < N  /\  REDC T %% N = T * Rinv^r %% N.
proof.
move=> *; rewrite /REDC /=.
move: (REDCk_corr r T _ _) => //; first by smt(r_ge0).
move=> [??].
case: (N <= REDCk r T); smt( @IntDiv). 
qed.

end MontgomeryLimbs.

