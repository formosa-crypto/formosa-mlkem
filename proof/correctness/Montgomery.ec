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
case (R * (R %/ 2) <= x %% R * R ).
+ move => *.
  have -> /= : R %/ 2 <= x %% R by smt(gt0_R).
  by rewrite -Ring.IntID.mulNr -Ring.IntID.mulrDl mulzK; 1: by smt(gt0_R). 
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
rewrite /BREDC /= /R /smod /=.
move => ??? bnd0.
rewrite /barrett_pred /barrett_pred_low /barrett_pred_high /barrett_fun /barrett_fun_aux /= => H brt.
move : (brt a H); move => [#] brtl brth.
rewrite !modzDm.
case (0 <= a). 
+ move => agt0; rewrite !(modz_small (a * (2 ^ bits %/ SignedReductions.q + 1))); 
    1: by smt(expr2 gtr0_norm ltr_pmul).  
  have -> /= : !(2 ^ k ^ 2 %/ 2 <= a * (2 ^ bits %/ SignedReductions.q + 1)).
  + rewrite ltr_geF; last by done.
    rewrite expr2 mulrC div_mulr; 1: by rewrite -{1}(expr1 2); apply dvdz_exp2l; smt(gt2_k).
    by smt(expr2 gtr0_norm ltr_pmul).  
  rewrite !(modz_small ((a - a * (2 ^ bits %/ SignedReductions.q + 1) %/ 2 ^ bits * SignedReductions.q))); 
    1: by smt(). 
  split; 1: by smt(). 
  case (2 ^ k %/ 2 <= a - a * (2 ^ bits %/ SignedReductions.q + 1) %/ 2 ^ bits * SignedReductions.q); 1: by smt().
  by move => *; rewrite -(modzMDr (- a * (2 ^ bits %/ SignedReductions.q + 1) %/ 2 ^ bits) a q); smt(). 

move => alt0.
pose d := -a;have -> : (a = -d); 1: by auto.
rewrite !mulNr !modNz; 1..4: smt(gt2_k expr_gt0). 
rewrite !(modz_small (-a * (2 ^ bits %/ SignedReductions.q + 1) - 1)).
+  rewrite gtr0_norm; 1: by  smt(gt2_k expr_gt0).
   by split; rewrite -Ring.IntID.mulNr;  smt(ler_pmul expr2). 
have -> /=: 2 ^ k ^ 2 %/ 2 <= 2 ^ k ^ 2 - 1 - ((- a * (2 ^ bits %/ SignedReductions.q + 1)) - 1).
+ have -> : 2 ^ k ^ 2 - 1 - ((- a * (2 ^ bits %/ SignedReductions.q + 1)) - 1) = 
        2^k^2 - d * (2 ^ bits %/ SignedReductions.q + 1); 1: by rewrite /d;ring. 
  have ? : (0 <= d * (2 ^ bits %/ SignedReductions.q + 1) <= 2^k^2 %/ 2); last by smt().
  split; 1: by smt().
  move => *. 
    rewrite expr2 mulrC div_mulr; 1: by rewrite -{1}(expr1 2); apply dvdz_exp2l; smt(gt2_k).
    by apply ler_pmul; smt(gt2_k).  
  split; 1: by smt(). 
  case (2 ^ k %/ 2 <= a - a * (2 ^ bits %/ SignedReductions.q + 1) %/ 2 ^ bits * SignedReductions.q); 1: by smt().
  move => *. 
  rewrite !(modz_small _ (2^k)) => //; 1: smt(). 
  case (2 ^ k %/ 2 <=  (-d) - (2 ^ k ^ 2 - 1 - ((- a * (2 ^ bits %/ SignedReductions.q + 1)) - 1) - 2 ^ k ^ 2) %/ 2 ^ bits * SignedReductions.q); 1: by smt().
  by move : (modzMDr (-((2 ^ k ^ 2 - 1 - ((- a * (2 ^ bits %/ SignedReductions.q + 1)) - 1) - 2 ^ k ^ 2) %/ 2 ^ bits)) (-d) q) => /=; smt(modNz). 
qed. 

(* Signed Montgomery reduction as used in Kyber v2.0 *)

op SREDC (a: int) : int =
  let u = smod (a * qinv * R) (R^2) in
  let t = smod (a - u %/ R * q) (R^2)in
      smod (t %/ R %% (R^2)) R.

lemma nosmt SREDCp_corr a:
   0 < q < R %/2 =>
   -R %/ 2 * q <= a < R %/2 * q =>
   -q   <= SREDC a <= q /\
       SREDC a %% q = (a * Rinv) %% q.
proof.
move => [#] H H0 [#] H1 H2.
have H3 : (R * R %/ 4 = R %/ 2 * R %/2  ) by smt(dvd2R div_mulr).  
have albnd : (- R * R %/4 <= a) by smt(dvd2R div_mulr).  
have aubnd : (a < R* R %/4) by smt(ler_pmul dvd2R div_mulr).
rewrite /SREDC /= (smod_div (a * qinv)).
move : (smod_bnd (a * qinv) R _ _); first 2 by smt(gt0_R dvd2R). 
move => inner_bnd.

have ulbnd : (-R*R %/4 <= smod (a * qinv) R * q). 
+ case (0 <= smod (a * qinv) R);1 : by smt().
  case (smod (a * qinv) R = -R %/2); 1: by move => -> *; smt(ler_pmul dvd2R div_mulr).
  move => *.  
  have :  -smod (a * qinv) R * q < R %/2 * R %/2; last by smt().
  rewrite -Ring.IntID.mulNr div_mulr 1: dvd2R => *. 
  by apply (ltr_pmul (- smod (a * qinv) R) (R %/2) q  (R %/2)); smt(ltr_pmul).

have uubnd : (smod (a * qinv) R * q < R*R %/4).
+ case (smod (a * qinv) R < 0);1 : by smt().
  move => *.  
  have :  smod (a * qinv) R * q < R %/2 * R %/2; last by smt().
  rewrite div_mulr 1: dvd2R => *. 
  by apply (ltr_pmul (smod (a * qinv) R) (R %/2) q  (R %/2)); smt(ltr_pmul).

rewrite (smod_small ((a - smod (a * qinv)R * q))); 1 : by smt(gt0_R exprn_egt1).
+ by rewrite !expr2;smt().
rewrite (smod_sq ((a - smod (a * qinv) R * q))).
rewrite (smod_small ((a - smod (a * qinv) R * q) %/R)); first  by smt(). 
have ? : (-R*R%/2<= (a - smod (a * qinv) R * SignedReductions.q) < R*R%/2) by smt(ler_lt_sub ltr_add).
split; 1: by apply lez_divRL; smt(gt0_R). 
by move => *; apply ltz_divLR; smt(gt0_R dvd2R). 

split. 
+ have ? : (-SignedReductions.q) * R <= (a - smod (a * qinv) R * SignedReductions.q) < SignedReductions.q * R; last first.
  + split; 1: by apply lez_divRL; smt(gt0_R). 
    by have : ((a - smod (a * qinv) R * SignedReductions.q) %/R) * R < SignedReductions.q * R; smt().

  have ulbndq : (-R%/2*q <= smod (a * qinv) R * q).  
  + case (0 <= smod (a * qinv) R);1 : by smt(). 
    case (smod (a * qinv) R = -R %/2); 1: by move => -> *; smt(ler_pmul dvd2R div_mulr).
    move => *.  
    have :  -smod (a * qinv) R * q < R %/2 * q; last by smt().
    rewrite -Ring.IntID.mulNr => *.  
    by apply (ltr_pmul2r q _ (- smod (a * qinv) R) (R %/2)); 1,2:  smt(ltr_pmul).

  have uubndq : (smod (a * qinv) R * q < R%/2*q).
  + case (smod (a * qinv) R < 0);1 : by smt().
    move => *.  
    have :  smod (a * qinv) R * q < R %/2 * q; last by smt().
    by apply (ltr_pmul2r q _ (smod (a * qinv) R) (R %/2)); 1,2:  smt(ltr_pmul).

  have ? : R %/ 2 * SignedReductions.q + R %/ 2 * SignedReductions.q = (q)*R by  smt(dvd2R).
  have ? : - R %/ 2 * SignedReductions.q + - R %/ 2 * SignedReductions.q = (-q)*R by smt().
  by smt(ler_lt_sub ltr_add).

(* Congruence proof *)
move : (smod_exists (a * qinv) R) => kk0_exists.
elim kk0_exists => kk0 kk0_val.
rewrite kk0_val.

rewrite (_: a - (a * qinv + kk0 * R) * q =
      a %/ R * R - ((a * qinv  + kk0 * R) * q) %/ R * R).
+ rewrite (divzE a) (divzE ((a * qinv  + kk0 * R) * q)).
  rewrite (_ : (a * qinv + kk0 * R) * q %% R = a %% R).
  + rewrite mulrDl.
    rewrite (_:kk0 * R * q = (kk0 * q) * R); first by smt().
    by rewrite modzMDr -Ring.IntID.mulrA -modzMm qqinv modzMm => /#.
  by ring.

have scalar1 : (a %/ R * R - (a * qinv +kk0 * R) * q %/ R * R =
             a + (- a * qinv - kk0 * R)*q).
+ rewrite !divzE.  ring.
  rewrite  -modzMm -modzDm modzMl /= modz_mod modzMm.
  rewrite (_: a * qinv * q = a * (qinv * q)); first by smt().
  by rewrite -modzMm qqinv modzMmr /= modz_mod; ring.

pose xx := (a %/ R * R - (a * qinv + kk0 * R) * q %/ R * R) %/ R.
rewrite (_: xx %% q = xx * (R * Rinv) %% q);  
 1: by rewrite -(modzMmr _ (R * Rinv) q) RRinv (modzMmr _ (1) q) /=.
rewrite /xx; clear xx.

rewrite Ring.IntID.mulrA.
rewrite (_: (a %/ R * R - (a * qinv + kk0 * R) * q %/ R * R) %/R * R = 
          (a %/ R * R - (a * qinv + kk0 * R) * q %/ R * R)).
+ apply dvdz_eq.
  rewrite (_: (a %/ R * R - (a * qinv + kk0 * R) * q %/ R * R) = 
          (a %/ R  - (a * qinv + kk0 * R) * q %/ R )*R); 1: by smt().
  by apply dvdz_mull; apply dvdzz.
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
op _N: int.
axiom N_bnd: 0 < _N.

op _N' : int.
axiom NN': (_N * _N') %% R = (-1) %% R.
op Rinv : int.
axiom RRinv: (R * Rinv) %% _N = 1 %% _N.


op REDC' (T: int) : int =
 let m = ((T %% R)*_N') %% R
 in (T + m*_N) %/ R.

lemma nosmt aux_divR T:
 let m = ((T %% R)*_N') %% R
 in (T + m*_N) %% R = 0.
proof.
rewrite /= -modzDmr modzMml mulzA -modzMml (mulzC _N') modz_mod.
rewrite modzMml -modzMmr NN' modzMmr modzDmr.
have ->: T + T * (-1) = 0 by ring.
smt().
qed.


lemma nosmt REDC'_congr T:
 REDC' T %% _N = T * Rinv %% _N.
proof.
pose m := ((T %% R)*_N') %% R.
pose t := (T + m*_N) %/ R.
have tE: t*R = T + m*_N.
 have:= (divz_eq (T + m * _N) R).
 by rewrite aux_divR /= -/t => <-.
have t_modN: t %% _N = T*Rinv %% _N.
 rewrite -(mulz1 t) -modzMmr -RRinv modzMmr -mulzA tE mulzDl.
 by rewrite mulzA (mulzC _N) -mulzA -modzDml modzMDr modz_mod.
by rewrite /REDC'.
qed.

lemma nosmt REDC'_bnds T n:
 0 <= n =>
 0 <= T < _N + _N * R^(n+1) =>
 0 <= REDC' T < _N + _N*R^n.
proof.
pose m := ((T %% R)*_N') %% R.
pose t := (T + m*_N) %/ R.
move=> Hn; rewrite exprS //; move=> [HT1 HT2].
have [Hm1 Hm2]: 0 <= m < R; 1: by smt(R_gt0 ltz_mod gtr0_norm).
have Ht: 0 <= t < _N + _N*R^n.
+ split; 1: by smt(divz_ge0 R_gt0 N_bnd). 
  move => tge0.
  rewrite /t ltz_divLR 1:/#.
  have ?: m * _N <= _N*R - _N.
  + rewrite mulzC.
    have ->: _N*R-_N = _N*(R-1) by ring.
    apply ler_pmul2l;   smt(N_bnd). 
  by smt().
by smt().
qed.

end Montgomery'.

theory Montgomery.

clone import Montgomery'.

op REDC T = let t = REDC' T in if _N <= t then t-_N else t.

lemma REDC_corr T:
 0 <= T < _N + _N*R =>
 0 <= REDC T < _N  /\  REDC T %% _N = T * Rinv %% _N.
proof.
move=> H; rewrite /REDC /=; split.
 move: (REDC'_bnds T 0 _) => />.
 rewrite expr1 expr0 H /= /#.
rewrite -(REDC'_congr T).
case: (_N <= REDC' T) => // ?.
by rewrite (_:REDC' T - _N = REDC' T + (-1) * _N) 1:/# modzMDr.
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
op _N: int.

clone import Montgomery' with
  op k <- w,
  op _N <- _N.


op REDCk : int -> int -> int.
axiom REDCk0 k T :
   k <= 0 => REDCk k T = T.
axiom REDCkS k T:
   0 <= k => REDCk (k+1) T = REDCk k (REDC' T).

lemma REDCk_corr r T:
 0 < r =>
 0 <= T < _N + _N * R^r =>
 (0 <= REDCk r T < 2*_N) /\ REDCk r T %% _N = T * Rinv^r %% _N.
proof.
elim/natind: r T => /= />.
+ move => n ? T *.
  have ->: n=0 by smt().
  by rewrite REDCk0 // /#.
move => n H H0 T H1 H2 H3.
rewrite REDCkS 1:/#.
move: H3; case: (n=0) => E.
+ rewrite E !REDCk0 //= => H4.
  move: (REDC'_bnds T 0 _ _) => //=; rewrite expr0 => H5.
  split; 1: by smt().
  by rewrite expr1; apply REDC'_congr.
move=> H3.
move: (H0 (REDC' T) _ _); 1: smt().
+ by move: (REDC'_bnds T n _ _) => /=.
move=> [H4 H5].
split; first by smt().
rewrite H5.
move: (REDC'_congr T) => H6.
by rewrite -modzMml H6 modzMml exprS /#.
qed.

op REDC T = let t = REDCk r T in if _N <= t then t-_N else t.

lemma REDC_corr T:
 0 <= T < _N + _N*R^r =>
 0 <= REDC T < _N  /\  REDC T %% _N = T * Rinv^r %% _N.
proof.
move=> *; rewrite /REDC /=.
move: (REDCk_corr r T _ _) => //; first by smt(r_ge0).
by smt(). 
qed.

end MontgomeryLimbs.

(* @JBA: MOVE THIS *)

lemma nosmt modzB_eq0 (x y m:int):
 0 < m => (x-y) %% m = 0 =>
 x%%m = y%%m.
proof.
move=> Hm.
have ->: (x-y) %% m = (x%%m - y%%m) %% m.
 rewrite modzDml eq_sym.
 by rewrite -modzDmr modzNm modzDmr.
have ?: 0 <= x%%m < m by smt().
have ?: 0 <= y%%m < m by smt().
rewrite -dvdzE; move=>/dvdzP [k].
case: (k < 0); smt().
qed.

(* JWord (here instantiated on W16) *)
from Jasmin require import JWord.
import W16.

lemma nosmt to_sint_mod x:
 W16.to_sint x %% W16.modulus = to_uint x.
proof.
rewrite /to_sint /smod.
case: (2 ^ (16 - 1) <= to_uint x) => C.
 rewrite -modzDm -modzNm modzz /= modz_mod.
 rewrite modz_small //.
 by apply JUtils.bound_abs; apply to_uint_cmp.
rewrite modz_small //.
by apply JUtils.bound_abs; apply to_uint_cmp.
qed.

lemma nosmt smod_small (x: int):
 -2^(16-1) <= x < 2^(16-1) => 
 W16.smod (x %% W16.modulus) = x.
proof.
move => [/= Hl Hh]. 
rewrite /smod; case: (x < 0) => C.
 by have ->/#: 2 ^ (16 - 1) <= x %% W16.modulus by smt().
by have ->/#: ! 2 ^ (16 - 1) <= x %% W16.modulus by smt().
qed.

lemma nosmt modzM_sint (x y: W16.t):
 (to_sint x * to_sint y) %% W16.modulus
 = (to_uint x * to_uint y) %% W16.modulus.
proof.
rewrite /to_sint /smod.
case: (2 ^ (16 - 1) <= to_uint x) => Cx.
 case: (2 ^ (16 - 1) <= to_uint y) => Cy.
  rewrite -modzMm -modzDm -modzNm modzz /= modz_mod.
  rewrite -modzMm -modzDm -modzNm modzz /= !modz_mod.
  by rewrite modzMm.
 rewrite -modzMm -modzDm -modzNm modzz /= modz_mod.
 by rewrite modzMm.
case: (2 ^ (16 - 1) <= to_uint y) => Cy.
rewrite -modzMm -modzDm -modzNm modzz /= modz_mod.
by rewrite modzMm.
done.
qed.

lemma nosmt to_sintM (x y: W16.t):
 to_sint (x*y)
 = W16.smod ((to_sint x * to_sint y) %% W16.modulus).
proof.
by rewrite {1}/W16.to_sint to_uintM modzM_sint.
qed.

lemma nosmt modzD_sint (x y: W16.t):
 (to_sint x + to_sint y) %% W16.modulus
 = (to_uint x + to_uint y) %% W16.modulus.
proof.
rewrite /to_sint /smod.
case: (2 ^ (16 - 1) <= to_uint x);
 case: (2 ^ (16 - 1) <= to_uint y); smt().
qed.

lemma nosmt to_sintD (x y: W16.t):
 to_sint (x+y)
 = W16.smod ((to_sint x + to_sint y)%%W16.modulus). 
proof.
by rewrite {1}/W16.to_sint to_uintD modzD_sint.
qed.

lemma nosmt modzN_sint (x: W16.t):
 (- to_sint x) %% W16.modulus
 = (- to_uint x) %% W16.modulus.
proof.
rewrite /to_sint /smod.
case: (2 ^ (16 - 1) <= to_uint x); smt().
qed.

lemma nosmt to_sintN (x: W16.t):
 to_sint (-x)
 = W16.smod ((-to_sint x) %% W16.modulus).
proof.
by rewrite {1}/W16.to_sint to_uintN modzN_sint.
qed.

lemma nosmt modzB_sint (x y: W16.t):
 (to_sint x - to_sint y) %% W16.modulus
 = (to_uint x - to_uint y) %% W16.modulus.
proof.
rewrite /to_sint /smod.
case: (2 ^ (16 - 1) <= to_uint x);
 case: (2 ^ (16 - 1) <= to_uint y); smt().
qed.

lemma nosmt to_sintB (x y: W16.t):
 to_sint (x-y)
 = W16.smod ((to_sint x - to_sint y)%%W16.modulus). 
proof.
rewrite {1}/W16.to_sint to_uintD to_uintN modzB_sint /#.
qed.

lemma nosmt wmulsE (x y: W16.t):
 to_sint x * to_sint y
 = to_sint (wmulhs x y) * W16.modulus
   + to_uint (x * y).
proof.
rewrite (divz_eq (to_sint x * to_sint y) W16.modulus) to_uintM.
congr; last by rewrite modzM_sint.
rewrite /wmulhs of_sintK smod_small //.
have /=?:= to_sint_cmp x.
have /=?:= to_sint_cmp y.
smt().
qed.

lemma nosmt to_sint_wmulhs x y:
 to_sint (W16.wmulhs x y) = to_sint x * to_sint y %/ W16.modulus.
proof.
rewrite wmulsE divzDl 1:/# mulzK 1:/#; ring.
rewrite divz_small //.
move: (to_uint_cmp (x*y)); smt().
qed.

abbrev sint_bnd x xL xH =
 xL <= W16.to_sint x <= xH.

lemma to_sint_bnd (x: W16.t):
 sint_bnd x W16.min_sint W16.max_sint
by move: (to_sint_cmp x); smt().

lemma sint_bndW (x: W16.t) (xL1 xH1 xL2 xH2: int):
 xL2 <= xL1 => xH1 <= xH2 =>
 sint_bnd x xL1 xH1 =>
 sint_bnd x xL2 xH2
by smt().

lemma nosmt to_sintD_small (x y: W16.t):
 W16.min_sint <= to_sint x + to_sint y <= W16.max_sint =>
 to_sint (x+y) = to_sint x + to_sint y.
proof.
move=> /=?; rewrite to_sintD smod_small /= /#.
qed.

(* a version of [to_sintD_small] with bounds *)
lemma nosmt to_sintD_small' (xL xH yL yH: int) (x y: W16.t):
 sint_bnd x xL xH =>
 sint_bnd y yL yH =>
 W16.min_sint <= xL+yL =>
 xH+yH <= W16.max_sint =>
 to_sint (x+y) = to_sint x + to_sint y.
proof.
by move=> /= *; rewrite to_sintD_small /#.
qed.

lemma nosmt to_sintN_small (x: W16.t):
 W16.min_sint < to_sint x =>
 to_sint (-x) = - to_sint x.
proof.
move=> H; rewrite to_sintN modzN_sint /to_sint.
have [/=??]:= to_uint_cmp x.
case: (to_uint x=0) => [->//=|C1].
have ->: (- to_uint x) %% W16.modulus 
         = W16.modulus - to_uint x.
 rewrite -{1}(add0z (-W16.to_uint _)).
 by rewrite -(modzz W16.modulus) modzDml modz_small /#.
move: H; rewrite /to_sint /smod /=.
case: (32768 <= to_uint x) => C2 H.
 have ->/=: !32768 <= 65536 - to_uint x; smt().
by have ->/=: 32768 <= 65536 - to_uint x; smt().
qed.

lemma to_sintB_small (x y: W16.t):
 W16.min_sint <= to_sint x - to_sint y <= W16.max_sint =>
 to_sint (x-y) = to_sint x - to_sint y.
proof.
by move=> /= ?; rewrite to_sintB smod_small /= /#.
qed.

lemma to_sintM_small (x y: W16.t):
 W16.min_sint <= to_sint x * to_sint y <= W16.max_sint =>
 to_sint (x*y) = to_sint x * to_sint y.
proof.
by move=> /= ?; rewrite to_sintM smod_small /= /#.
qed.

lemma to_sintD_bnd (x y: W16.t) (xL xH yL yH: int):
 sint_bnd x xL xH =>
 sint_bnd y yL yH =>
 W16.min_sint <= xL+yL =>
 xH+yH <= W16.max_sint =>
 sint_bnd (x+y) (xL+yL) (xH+yH).
proof.
by move=> /> *; rewrite to_sintD_small /#. 
qed.

lemma to_sintN_bnd (x y: W16.t) (xL xH: int):
 sint_bnd x xL xH =>
 W16.min_sint < xL =>
 sint_bnd (-x) (-xH) (-xL).
proof.
by move=> /> *; rewrite to_sintN_small /#.
qed.

lemma to_sintB_bnd (x y: W16.t) (xL xH yL yH: int):
 sint_bnd x xL xH =>
 sint_bnd y yL yH =>
 W16.min_sint <= xL-yH =>
 xH-yL <= W16.max_sint =>
 sint_bnd (x-y) (xL-yH) (xH-yL).
proof.
by move=> /> *; rewrite to_sintB_small /#.
qed.

lemma to_sintM_bnd (x y: W16.t):
 sint_bnd (x*y) W16.min_sint W16.max_sint
by apply to_sint_bnd.

lemma to_sintPos_bnd (i: int):
 0 <= i < W16.max_sint =>
 sint_bnd (W16.of_int i) 0 i.
proof.
by move=> /> *; rewrite of_sintK smod_small /#.
qed.

abbrev MIN (a b: int) = if a < b then a else b.
abbrev MAX (a b: int) = if a < b then b else a.

lemma to_sintH_bnd (x y: W16.t) (xL xH yL yH: int):
 sint_bnd x xL xH =>
 sint_bnd y yL yH =>
 xL<=0 => 0<=xH => yL<=0 => 0<=yH =>
 sint_bnd (wmulhs x y) (MIN (xL*yH) (xH*yL) %/ W16.modulus) (MAX (xL*yL) (xH*yH) %/ W16.modulus).
proof.
move=> /> *.
have xyH_bnd:
 MIN (xL * yH) (xH * yL) <= to_sint x * to_sint y <= MAX (xL * yL) (xH * yH).
 case: (to_sint x < 0) => Cx.
  case: (to_sint y < 0) => Cy.
   have HC: 0 <= to_sint x * to_sint y <= (xL * yL).
    split => *; first smt().
    rewrite -IntID.mulrNN -(IntID.mulrNN xL).
    apply ler_pmul; smt().
   smt().
  have HC: xL*yH <= to_sint x * to_sint y <= 0.
   split; last by smt().
   rewrite -ler_opp2 -2!Domain.mulNr.
   apply ler_pmul; smt().
  smt().
 case: (to_sint y < 0) => Cy.
  have HC: xH*yL <= to_sint x * to_sint y <= 0.
   split; last smt().
   rewrite -ler_opp2 -2!Domain.mulrN.
   apply ler_pmul; smt().
  smt().
 have: 0 <= to_sint x * to_sint y <= xH*yH.
  split=> *; first smt().
  by apply ler_pmul; smt().
 smt().
by rewrite to_sint_wmulhs /#.
qed.


theory Montgomery16.
from Jasmin require import JWord.
import W16 ALU.

abbrev R = W16.modulus.
op q = 3329.
op qinv = 62209.

lemma q_qinv: (q*qinv) %% R = 1 by done.

op Rinv = 169.
lemma RRinv: (R * Rinv) %% q = 1 %% q by done.

op REDCmul16 (x y: W16.t): W16.t =
 let m = x * y * W16.of_int qinv
 in (wmulhs x y) - (wmulhs m (W16.of_int q)).

lemma nosmt aux_divR (x y: W16.t):
 let m = x * y * W16.of_int qinv
 in (to_sint x * to_sint y - to_sint m * q) %% R = 0.
proof.
rewrite /wmulls /= {3}/W16.to_sint !to_uintM
 of_uintK modzMm /smod -modzDm modzM_sint modzDm.
case: (2 ^ (16 - 1) <= to_uint x * to_uint y * qinv %% R) => C.
 rewrite -modzDmr -modzNm modzDmr.
 have ->: (to_uint x * to_uint y * qinv %% R - R) * q %% R = to_uint x * to_uint y %% R. 
  by rewrite mulzDl -modzDmr IntID.mulNr -modzNm
       -(modzMml R) modzz /= modzMml mulzA
       (mulzC qinv) -modzMmr q_qinv.
 smt().
by rewrite -modzDmr -modzNm modzMml mulzA (mulzC qinv)
  -modzMmr q_qinv /= modzNm modzDmr.
qed.

lemma nosmt aux_divR' (x y: W16.t):
 let m = x * y * W16.of_int qinv
 in to_sint x * to_sint y %% R = to_sint m * q %% R.
proof.
rewrite /=; apply modzB_eq0 => //.
by move: aux_divR => /=; apply.
qed.

lemma nosmt REDCmul16_correct (x y: W16.t):
 sint_bnd y (- q) (q) =>
 to_sint (REDCmul16 x y) %% q
 = to_sint x * to_sint y * Rinv %% q
 /\ sint_bnd (REDCmul16 x y) (-q) (q).
proof.
pose m:= x * y * (W16.of_int qinv).
(* Bounds *)
move => /=y_bnd.
have /=x_bnd := to_sint_bnd x.
have /=xyH_bnd := to_sintH_bnd x y _ _ _ _ x_bnd y_bnd _ _ _ _ =>//.
have /=m_bnd := to_sint_bnd m.
have /=q_bnd := to_sintPos_bnd q _ => //.
have /=mqH_bnd := to_sintH_bnd _ _ _ _ _ _ m_bnd q_bnd _ _ _ _ => //.
have /=t_bnd := to_sintB_bnd _ _ _ _ _ _ xyH_bnd mqH_bnd.
split; last first.
 by rewrite /REDCmul16 -/m /#.
(* CORRECTNESS *)
have ->: to_sint (REDCmul16 x y) %% q
         = ((to_sint x * to_sint y - to_sint m * q) %/ R) %% q.
 have ->: to_sint x * to_sint y - to_sint m * q
          = (to_sint (wmulhs x y) - to_sint (wmulhs m (W16.of_int q))) * R.
  rewrite {1}(_:q = to_sint (W16.of_int q)).
   by rewrite /to_sint of_uintK smod_small /#.
  rewrite !wmulsE.
  have H: to_uint (x * y) = to_uint (m * (of_int q)%W16).
   move: (aux_divR' x y) => /= H.
   rewrite 2!to_uintM -2!modzM_sint.
   rewrite H /m -modzMm eq_sym -modzMm.
   congr; congr => //.
   congr; congr; congr => //. 
   by rewrite of_sintK /q /= /smod /=.
  by ring H.
 rewrite mulzK 1:// /REDCmul16 /=.
 rewrite to_sintB_small 1:/#.
 by congr; congr; congr; congr.
pose t:= (to_sint x * to_sint y - to_sint m * q) %/ R.
have tE: t*R = to_sint x * to_sint y - to_sint m * q.
 have:= (divz_eq (to_sint x * to_sint y - to_sint m * q) R).
 by rewrite aux_divR /= -/t => <-.
rewrite -(mulz1 t) -modzMmr -RRinv modzMmr -mulzA tE.
rewrite mulzDl Domain.mulNr (mulzA _ q) (mulzC q) -mulzA.
by rewrite -modzDmr -Domain.mulNr -modzMm modzz mod0z.
qed.

end Montgomery16.


