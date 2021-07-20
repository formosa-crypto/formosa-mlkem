require import AllCore List IntDiv CoreMap.
require (****) ZModP.
from Jasmin require import JWord JModel.
require import Montgomery.
require import W16extra.
require import Array32.
pragma +oldip.

theory Fq.

require import Kyber.  
clone import Kyber as Kyber_ with
   op kvec <- 3,
   type MLWEPKE.H_MLWE.seed = W8.t Array32.t.


clone import SignedReductions with
    op k <- 16,
    op q <- q,
    op qinv <- 62209,
    op Rinv <- 169
    proof q_bnd by (rewrite /R qE => />) 
    proof q_odd1 by (rewrite qE => />)
    proof q_odd2 by (rewrite qE => />)
    proof qqinv by (rewrite /R qE  => />)
    proof Rinv_gt0 by (auto => />)
    proof RRinv by (rewrite /R qE  => />)
    proof qinv_bnd by (rewrite /R  => />).

require import IndcpaDerand.

lemma balmod_W16 a:
  a %%+- W16.modulus = W16.smod (a %% W16.modulus)
  by rewrite bal_modE /W16.smod /=.

lemma balmod_W32 a:
  a %%+- W32.modulus = W32.smod (a %% W32.modulus)
  by rewrite bal_modE /W32.smod /=.

lemma aux16_0 x :
  16 <= x < 32 =>
   (W32.of_int 4294901760).[x] = true.
proof.
rewrite of_intwE => />. 
rewrite /int_bit => />. 
case (x = 16); first by move =>  -> />. 
move => *;case (x = 17); first by move =>  -> />. 
move => *;case (x = 18); first by move =>  -> />. 
move => *;case (x = 19); first by move =>  -> />. 
move => *;case (x = 20); first by move =>  -> />. 
move => *;case (x = 21); first by move =>  -> />. 
move => *;case (x = 22); first by move =>  -> />. 
move => *;case (x = 23); first by move =>  -> />. 
move => *;case (x = 24); first by move =>  -> />. 
move => *;case (x = 25); first by move =>  -> />. 
move => *;case (x = 26); first by move =>  -> />. 
move => *;case (x = 27); first by move =>  -> />. 
move => *;case (x = 28); first by move =>  -> />. 
move => *;case (x = 29); first by move =>  -> />. 
move => *;case (x = 30); first by move =>  -> />. 
move => *;case (x = 31); first by move =>  -> />. 
by smt().
qed.

lemma aux16_1 x :
  0 <= x < 16 =>
   (W32.of_int 4294901760).[x] = false.
proof.
rewrite of_intwE => />. 
rewrite /int_bit => />. 
case (x = 0); first by move =>  -> />. 
move => *;case (x = 1); first by move =>  -> />. 
move => *;case (x = 2); first by move =>  -> />. 
move => *;case (x = 3); first by move =>  -> />. 
move => *;case (x = 4); first by move =>  -> />. 
move => *;case (x = 5); first by move =>  -> />. 
move => *;case (x = 6); first by move =>  -> />. 
move => *;case (x = 7); first by move =>  -> />. 
move => *;case (x = 8); first by move =>  -> />. 
move => *;case (x = 9); first by move =>  -> />. 
move => *;case (x = 10); first by move =>  -> />. 
move => *;case (x = 11); first by move =>  -> />. 
move => *;case (x = 12); first by move =>  -> />. 
move => *;case (x = 13); first by move =>  -> />. 
move => *;case (x = 14); first by move =>  -> />. 
move => *;case (x = 15); first by move =>  -> />. 
by smt().
qed.

lemma aux16_2 (a : W32.t) :
  (a `>>>` 16) + (of_int 4294901760)%W32
              = (a `>>>` 16) `|` (of_int 4294901760)%W32.
proof. 
rewrite orw_xpnd.
rewrite (_: (a `>>>` 16) `&` (of_int 4294901760)%W32 = W32.of_int 0).
have ? : (0 <= to_uint (a `>>>` 16) < 65536).
rewrite to_uint_shr => />.
split; first by smt(@IntDiv @W32).
move => *. 
move : (W32.to_uint_cmp a) => />. smt(@IntDiv).
apply W32.ext_eq =>  *.
case (0 <= x < 16). 
rewrite andwE; move => *.
by rewrite (aux16_1 _ H1) => />.
move => *.
have ? : ((a `>>>` 16).[x] = false);   by smt(@W32).
by ring.
qed.

lemma SAR_sem16 (a : W32.t) :
   a `|>>` W8.of_int 16 = W32.of_int (to_sint a %/ 2^16).
proof.
rewrite /(`|>>`) to_sintE /smod sarE /=.
case (2147483648 <= to_uint a); last first.
move => * />.
rewrite (_: 65536 = 2^16); first by auto.
rewrite -to_uint_shr; first by smt().
rewrite to_uintK.
apply W32.ext_eq => *.
rewrite initiE => />.
case (x+16 < 32).
move => *. smt(@W32). 
move => *. 
rewrite (_: min 31 (x + 16) = 31). smt().
rewrite (_: (0 <= x < 32 && a.[x + 16]) = false). smt(@W32).
rewrite get_to_uint => />.
smt(@W32).

move => * />.
rewrite divzDr => />.
rewrite of_intD.
rewrite (_: 65536 = 2^16); first by auto.
rewrite -to_uint_shr; first by smt().
rewrite to_uintK => />.
apply W32.ext_eq => *.
rewrite initiE => />.
rewrite aux16_2.
rewrite orwE; move => *.
case (x+16 < 32).
move => *. 
rewrite (aux16_1 _ _); first by smt() => />.
auto => />.
rewrite (_: min 31 (x + 16) = x + 16); smt().
move => *.
rewrite (_: (a `>>>` 16).[x] = false); first  by smt(@W32).
auto => />.
rewrite (_: min 31 (x + 16) = 31). smt().
rewrite (_: a.[31] = true).
rewrite get_to_uint => />.
move : (W32.to_uint_cmp a) => />. smt(@W32).
rewrite aux16_0 => />.
smt().
qed.

lemma aux10_0 x :
  10 <= x < 16 =>
   (W16.of_int 64512).[x] = true.
proof.
rewrite of_intwE => />.
rewrite /int_bit => />.
case (x = 10); first by move =>  -> />.
move => *;case (x = 11); first by move =>  -> />.
move => *;case (x = 12); first by move =>  -> />.
move => *;case (x = 13); first by move =>  -> />.
move => *;case (x = 14); first by move =>  -> />.
move => *;case (x = 15); first by move =>  -> />.
by smt().
qed.

lemma aux10_1 x :
  0 <= x < 10 =>
   (W16.of_int 64512).[x] = false.
proof.
rewrite of_intwE => />.
rewrite /int_bit => />.
case (x = 0); first by move =>  -> />.
move => *;case (x = 1); first by move =>  -> />.
move => *;case (x = 2); first by move =>  -> />.
move => *;case (x = 3); first by move =>  -> />.
move => *;case (x = 4); first by move =>  -> />.
move => *;case (x = 5); first by move =>  -> />.
move => *;case (x = 6); first by move =>  -> />.
move => *;case (x = 7); first by move =>  -> />.
move => *;case (x = 8); first by move =>  -> />.
move => *;case (x = 9); first by move =>  -> />.
by smt().
qed.

lemma aux10_2 (a : W16.t) :
  (a `>>>` 10) + (of_int 64512)%W16
              = (a `>>>` 10) `|` (of_int 64512)%W16.
proof.
rewrite orw_xpnd.
rewrite (_: (a `>>>` 10) `&` (of_int 64512)%W16 = W16.of_int 0).
have ? : (0 <= to_uint (a `>>>` 10) < 1024).
rewrite to_uint_shr => />.
split; first by smt(@IntDiv @W16).
move => *.
move : (W16.to_uint_cmp a) => />. smt(@IntDiv).
apply W16.ext_eq =>  *.
case (0 <= x < 10).
rewrite andwE; move => *.
by rewrite (aux10_1 _ H1) => />.
move => *.
have ? : ((a `>>>` 10).[x] = false);   by smt(@W16).
by ring.
qed.

lemma SAR_sem10 (a : W16.t) :
   a `|>>` W8.of_int 10 = W16.of_int (to_sint a %/ 2^10).
proof.
rewrite /(`|>>`) to_sintE /smod sarE /=.
case (32768 <= to_uint a); last first.
move => * />.
rewrite (_: 1024 = 2^10); first by auto.
rewrite -to_uint_shr; first by smt().
rewrite to_uintK.
apply W16.ext_eq => *.
rewrite initiE => />.
case (x+10 < 16).
move => *. smt(@W16).
move => *.
rewrite (_: min 15 (x + 10) = 15). smt().
rewrite (_: (0 <= x < 16 && a.[x + 10]) = false). smt(@W16).
rewrite get_to_uint => />.
smt(@W16).

move => * />.
rewrite divzDr => />.
rewrite of_intD.
rewrite (_: 1024 = 2^10); first by auto.
rewrite -to_uint_shr; first by smt().
rewrite to_uintK => />.
apply W16.ext_eq => *.
rewrite initiE => />.
admit. (*FIXME:
rewrite aux10_2.

rewrite orwE; move => *.
case (x+10 < 32).
move => *.
rewrite (aux10_1 _ _); first by smt() => />.
auto => />.
rewrite (_: min 31 (x + 10) = x + 10); smt().
move => *.
rewrite (_: (a `>>>` 10).[x] = false); first  by smt(@W32).
auto => />.
rewrite (_: min 31 (x + 10) = 31). smt().
rewrite (_: a.[31] = true).
rewrite get_to_uint => />.
move : (W32.to_uint_cmp a) => />. smt(@W32).
rewrite aux16_0 => />.
smt().
*)
qed.

lemma fqmul_corr_h _a _b: 
   hoare[ Mderand.fqmul : to_sint a = _a /\ to_sint b = _b ==> 
   to_sint res = SREDC (_a * _b)].
proof.
proc.
wp; skip  => &hr [#] /= ??.
pose _c := _a * _b.
rewrite /SREDC.
rewrite SAR_sem16 SAR_sem16 /=. 
rewrite (_: R*(R *R^0) = W32.modulus); first by rewrite expr0 /R  => />.
rewrite (_: R = W16.modulus); first by rewrite /R => />.
rewrite balmod_W32 balmod_W32 balmod_W16.
rewrite W16.of_sintK. 
rewrite /(`<<`) /sigextu32 /truncateu16 /=. 
rewrite  H H0.
rewrite shlMP; first by smt().  
rewrite W32.to_sintE W32.of_uintK W32.of_uintK. 
by rewrite W32.of_sintK /=; smt(qE). 
qed.

lemma fqmul_ll :
  islossless Mderand.fqmul by proc; islossless.

lemma fqmul_corr _a _b :
  phoare [ Mderand.fqmul : 
     W16.to_sint a = _a /\ W16.to_sint b = _b ==> 
         W16.to_sint res = SREDC (_a * _b)] = 1%r.
proof. by conseq fqmul_ll (fqmul_corr_h _a _b). qed.


lemma aux26_0 x :
  6 <= x < 32 =>
   (W32.of_int 4294967232).[x] = true.
proof.
rewrite of_intwE => />. 
rewrite /int_bit => />. 
case (x = 6); first by move =>  -> />. 
move => *;case (x = 7); first by move =>  -> />. 
move => *;case (x = 8); first by move =>  -> />. 
move => *;case (x = 9); first by move =>  -> />. 
move => *;case (x = 10); first by move =>  -> />. 
move => *;case (x = 11); first by move =>  -> />. 
move => *;case (x = 12); first by move =>  -> />. 
move => *;case (x = 13); first by move =>  -> />. 
move => *;case (x = 14); first by move =>  -> />. 
move => *;case (x = 15); first by move =>  -> />. 
move => *;case (x = 16); first by move =>  -> />. 
move => *;case (x = 17); first by move =>  -> />. 
move => *;case (x = 18); first by move =>  -> />. 
move => *;case (x = 19); first by move =>  -> />. 
move => *;case (x = 20); first by move =>  -> />. 
move => *;case (x = 21); first by move =>  -> />. 
move => *;case (x = 22); first by move =>  -> />. 
move => *;case (x = 23); first by move =>  -> />. 
move => *;case (x = 24); first by move =>  -> />. 
move => *;case (x = 25); first by move =>  -> />. 
move => *;case (x = 26); first by move =>  -> />. 
move => *;case (x = 27); first by move =>  -> />. 
move => *;case (x = 28); first by move =>  -> />. 
move => *;case (x = 29); first by move =>  -> />. 
move => *;case (x = 30); first by move =>  -> />. 
move => *;case (x = 31); first by move =>  -> />. 
by smt().
qed.

lemma aux26_1 x :
  0 <= x < 6 =>
   (W32.of_int 4294967232).[x] = false.
proof.
rewrite of_intwE => />. 
rewrite /int_bit => />. 
case (x = 0); first by move =>  -> />. 
move => *;case (x = 1); first by move =>  -> />. 
move => *;case (x = 2); first by move =>  -> />. 
move => *;case (x = 3); first by move =>  -> />. 
move => *;case (x = 4); first by move =>  -> />. 
move => *;case (x = 5); first by move =>  -> />. 
by smt().
qed.

lemma aux26_2 (a : W32.t) :
  (a `>>>` 26) + (of_int 4294967232)%W32
              = (a `>>>` 26) `|` (of_int 4294967232)%W32.
proof. 
rewrite orw_xpnd.
rewrite (_: (a `>>>` 26) `&` (of_int 4294967232)%W32 = W32.of_int 0).
have ? : (0 <= to_uint (a `>>>` 26) < 2^6).
rewrite to_uint_shr => />.
split; first by smt(@IntDiv @W32).
move => *. 
move : (W32.to_uint_cmp a) => />. smt(@IntDiv).
apply W32.ext_eq =>  *.
case (0 <= x < 6). 
rewrite andwE; move => *.
by rewrite (aux26_1 _ H1) => />.
move => *.
have ? : ((a `>>>` 26).[x] = false);   by smt(@W32).
by ring.
qed.

lemma SAR_sem26 (a : W32.t) :
   a `|>>` W8.of_int 26 = W32.of_int (to_sint a %/ 2^26).
proof.
rewrite /(`|>>`) to_sintE /smod sarE /=.
case (2147483648 <= to_uint a); last first.
move => * />.
rewrite (_: 67108864 = 2^26); first by auto.
rewrite -to_uint_shr; first by smt().
rewrite to_uintK.
apply W32.ext_eq => *.
rewrite initiE => />.
case (x+26 < 32).
move => *. smt(@W32). 
move => *. 
rewrite (_: min 31 (x + 26) = 31). smt().
rewrite (_: (0 <= x < 32 && a.[x + 26]) = false). smt(@W32).
rewrite get_to_uint => />.
smt(@W32).

move => * />.
rewrite divzDr => />.
rewrite of_intD.
rewrite (_: 67108864 = 2^26); first by auto.
rewrite -to_uint_shr; first by smt().
rewrite to_uintK => />.
apply W32.ext_eq => *.
rewrite initiE => />.
rewrite aux26_2.
rewrite orwE; move => *.
case (x+26 < 32).
move => *. 
rewrite (aux26_1 _ _); first by smt() => />.
auto => />.
rewrite (_: min 31 (x + 26) = x + 26); smt().
move => *.
rewrite (_: (a `>>>` 26).[x] = false); first  by smt(@W32).
auto => />.
rewrite (_: min 31 (x + 26) = 31). smt().
rewrite (_: a.[31] = true).
rewrite get_to_uint => />.
move : (W32.to_uint_cmp a) => />. smt(@W32).
rewrite aux26_0 => />.
smt().
qed.


lemma barrett_reduce_corr_h _a :
  hoare [ Mderand.barrett_reduce : 
     W16.to_sint a = _a  ==> 
         W16.to_sint res = BREDC _a 26].
proof.
proc.
wp; skip  => &hr [#] /= ?.
rewrite /sigextu32 /truncateu16 /=. 
rewrite SAR_sem26  /=. 
rewrite !W32.of_sintK. 
rewrite !W32.of_uintK /=.
pose x := (smod (to_sint a{hr} * 20159 %% 4294967296))%W32 %/ 67108864 * 3329.
rewrite W16.to_sintE /=.
rewrite to_uintD /=.
rewrite (_:to_uint (- (of_int (x %% 4294967296))%W16) = to_uint (W16.of_int (-x))).
  rewrite of_uintK.
  rewrite of_intN'.
  rewrite W16.of_uintK. simplify.
  rewrite (_:  4294967296 = 65536 * 65536); first by smt().
  case (x %% (65536 * 65536) = 0). 
    by smt(@IntDiv).
    move => *; rewrite modNz. smt(). smt().  
     rewrite -modzDml. 
     rewrite (modz_dvd x (65536 * 65536) 65536). smt().
     rewrite (_: 65536 - 1 = (-1) %% 65536). smt().
     ring.
     have ? : (((- (-x) %% 65536) - (x %% 65536 - 1) %% 65536 + (-1) %% 65536) %% 65536 = 0). smt(). smt(@IntDiv).
     
 
rewrite /BREDC.
rewrite  (_: R^2 = W32.modulus); first by rewrite /R  /= expr0 /=.
rewrite !balmod_W32  => /=.
rewrite !balmod_W16.
rewrite -H.
rewrite (_: to_sint a{hr} %% R = to_uint a{hr}). 
rewrite to_sintE /smod. 
case (2 ^ (16 - 1) <= to_uint a{hr}).
rewrite (_: R = W16.modulus); first by rewrite /R => />; smt(). 
rewrite (_: to_uint a{hr} - W16.modulus = to_uint a{hr} + (-1) * W16.modulus); first by smt().
rewrite modzMDr.
move => *. 
by move : (W16.to_uint_cmp (a{hr}));auto => />;smt().
by rewrite /R; move : (W16.to_uint_cmp (a{hr}));auto => />;smt().
rewrite (_: W16.to_uint (W16.of_int (-x)) = (-x) %% R). 
by case (0<= -x < W16.modulus); smt(@W16).
by smt(@W16 qE).
qed.

lemma barrett_reduce_ll :
  islossless Mderand.barrett_reduce by proc; islossless.

lemma barrett_reduce_corr _a :
  phoare [ Mderand.barrett_reduce : 
     W16.to_sint a = _a  ==> 
         W16.to_sint res = BREDC _a 26] = 1%r.
proof. by conseq barrett_reduce_ll (barrett_reduce_corr_h _a). qed.


op add (a b : W16.t) = (a + b).
op sub (a b : W16.t) = (a - b).

import ZModField.

lemma add_corr (a b : W16.t) (a' b' : zmod) (asz bsz : int): 
   0 <= asz < 15 => 0 <= bsz < 15 =>
   a' = inzmod (W16.to_sint a) =>
   b' = inzmod (W16.to_sint b) =>
   bw16 a asz => 
   bw16 b bsz =>
     inzmod (W16.to_sint (add a b)) = a' + b' /\
           bw16 (add a b) (max asz bsz + 1).
proof.
rewrite /add  => />.
pose aszb := 2^asz.
pose bszb := 2^bsz.
move => ?? ?? ?? ??.
have bounds_asz : 0 < aszb <= 16384.
rewrite(_: 16384 = 2^14); first by auto => />.
split; [ apply gt0_pow2 | move => *; rewrite  /aszb; apply StdOrder.IntOrder.ler_weexpn2l => /> /#].
have bounds_bsz : 0 < bszb <= 16384.
rewrite(_: 16384 = 2^14); first by auto => />.
split; [ apply gt0_pow2 | move => *; rewrite  /bszb; apply StdOrder.IntOrder.ler_weexpn2l => /> /#].
rewrite !to_sintD_small => />; first  by smt().
split; first by smt(@ZModField).

case (max asz bsz = asz). 
+ move => maxx; rewrite maxx;
  rewrite (_: 2^(asz + 1) = aszb * 2); first by rewrite (Ring.IntID.exprS 2 asz) => /> /#. 
       split; smt(@StdOrder.IntOrder). 
+ move => maxx; rewrite (_: max asz bsz = bsz); first by smt(). 
  rewrite (_: 2^(bsz + 1) = bszb * 2); first by rewrite (Ring.IntID.exprS 2 bsz) => /> /#. 
       split; smt(@StdOrder.IntOrder). 
qed.

lemma add_corr_qv (a b : W16.t) (a' b' : zmod) (asz bsz : int): 
   1 <= asz <= 6 => 1 <= bsz <= 3 =>
   a' = inzmod (W16.to_sint a) =>
   b' = inzmod (W16.to_sint b) =>
   -asz*q <= (W16.to_sint a) < asz*q =>
   -bsz*q <= (W16.to_sint b) < bsz*q =>
     inzmod (W16.to_sint (add a b)) = a' + b' /\
      -(asz+bsz)*q <= (W16.to_sint b) < (asz+bsz)*q.
proof.
rewrite /add  => />.
pose aszb := asz*q.
pose bszb := bsz*q.
move => ?? ?? ?? ??.
have bounds_asz : 3329 <= aszb <= 19974. smt(qE).
have bounds_bsz : 3329 <= bszb <= 19974. smt(qE).
rewrite !to_sintD_small => />; first  by smt(qE).
split; first by smt(@ZModField).
smt().
qed.

lemma sub_corr (a b : W16.t) (a' b' : zmod) (asz bsz : int): 
   0 <= asz < 15 => 0 <= bsz < 15 =>
   a' = inzmod (W16.to_sint a) =>
   b' = inzmod (W16.to_sint b) =>
   bw16 a asz => 
   bw16 b bsz =>
     inzmod (W16.to_sint (sub a b)) = a' - b' /\
           bw16 (sub a b) (max asz bsz + 1).
proof.
rewrite /sub  => />.
pose aszb := 2^asz.
pose bszb := 2^bsz.
move => ?? ?? ?? ??.
have bounds_asz : 0 < aszb <= 16384.
rewrite(_: 16384 = 2^14); first by auto => />.
split; [ apply gt0_pow2 | move => *; rewrite  /aszb; apply StdOrder.IntOrder.ler_weexpn2l => /> /#].
have bounds_bsz : 0 < bszb <= 16384.
rewrite(_: 16384 = 2^14); first by auto => />.
split; [ apply gt0_pow2 | move => *; rewrite  /bszb; apply StdOrder.IntOrder.ler_weexpn2l => /> /#].
rewrite !to_sintB_small => />; first  by smt().
split; first by smt(@ZModField).

case (max asz bsz = asz).
+ move => maxx; rewrite maxx;
  rewrite (_: 2^(asz + 1) = aszb * 2); first by rewrite (Ring.IntID.exprS 2 asz) => /> /#. 
       split; smt(@StdOrder.IntOrder). 
+ move => maxx; rewrite (_: max asz bsz = bsz); first by smt(). 
  rewrite (_: 2^(bsz + 1) = bszb * 2); first by rewrite (Ring.IntID.exprS 2 bsz) => /> /#. 
       split; smt(@StdOrder.IntOrder). 
qed.

end Fq.
