require import AllCore List IntDiv CoreMap.
require (****) ZModP.
from Jasmin require import JWord JModel.
require import Montgomery.
require import W16extra.
require import Array32.
require import Kyber.

theory Fq.

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

require import Jkem.

lemma smod_W16 a:
  smod a W16.modulus = W16.smod (a %% W16.modulus)
  by rewrite smodE /W16.smod /=.

lemma smod_W32 a:
  smod a W32.modulus = W32.smod (a %% W32.modulus)
  by rewrite smodE /W32.smod /=.

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
have -> : (a `>>>` 16) `&` (of_int 4294901760)%W32 = W32.of_int 0.
+ have ? : (0 <= to_uint (a `>>>` 16) < 65536) by 
    rewrite to_uint_shr => />; smt(divz_ge0 ltz_divLR pow2_32 W32.to_uint_cmp).
  apply W32.ext_eq =>  x xbnd.
  case (0 <= x < 16); 1: by move => smallx; rewrite andwE aux16_1 => /> /#.
  move => largex; rewrite /(`>>>`) /of_int /bits2w /= /int2bs /= /mkseq /= !initiE //=. 
  rewrite !(nth_map 0 false _ x (iota_ 0 32)); 1, 2: by smt(size_iota).
  by rewrite !nth_iota //=; smt(W32.get_out).
by ring.
qed.

(* FIX ME: Generalize and move to JWord *)
lemma SAR_sem16 (a : W32.t) : a `|>>` W8.of_int 16 = W32.of_int (to_sint a %/ 2^16).
proof.
rewrite /(`|>>`) to_sintE /smod sarE.
rewrite W8.of_uintK; apply W32.ext_eq => x x_b; rewrite initiE => />.
case (2147483648 <= to_uint a); last first. (* positive numbers *)
+ move => ab; rewrite W32.of_intwE x_b /= /int_bit /=. 
  rewrite /min  /= get_to_uint /= (modz_small _ 4294967296); 1: smt(W32.to_uint_cmp).
  case (31 < x + 16). (*high bits*)
  + move => hb /=;rewrite pdiv_small; 1: by smt(W32.to_uint_cmp).
    rewrite mod0z /=.
    have -> : to_uint a %/ 65536 %/ 2 ^ x = 0; last by smt(mod0z). 
    apply  (divz_eq0 (to_uint a %/ 65536) (2^x)); 1: by smt(gt0_pow2). 
    split; 1: by smt(divz_ge0 W32.to_uint_cmp).
    have /= ? : 2^15 <= 2^x by  apply StdOrder.IntOrder.ler_weexpn2l=> // /#.
    by smt(leq_div2r).
 move => /= lb.
 have -> : to_uint a %/ 2 ^ (x + 16) = to_uint a %/ 65536 %/ 2 ^ x; last by smt().
 rewrite -pow2_16 {1}(divz_eq (to_uint a) (2^16)) exprD_nneg //; 1: smt().  
 by smt(divmod_mul gt0_pow2). 

move => neg.
rewrite divzDr //= -pow2_16 -to_uint_shr //=.
rewrite of_intS to_uintK /W32.([-]) /ulift1  aux16_2 orwE /=.
case (31 < x + 16); last by  move => x_tub; rewrite aux16_1 /= /#.
move => x_tlb; rewrite /min x_tlb aux16_0 /=; 1: by smt().
rewrite get_to_uint => />.
by smt(W32.to_uint_cmp pow2_32).
qed.

lemma aux10_0 x :
  6 <= x < 16 =>
   (W16.of_int 65472).[x] = true.
proof.
rewrite of_intwE /= /int_bit => />.
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
by smt().
qed.

lemma aux10_1 x :
  0 <= x < 6 =>
   (W16.of_int 65472).[x] = false.
proof.
rewrite of_intwE /= /int_bit => />.
case (x = 0); first by move =>  -> />.
move => *;case (x = 1); first by move =>  -> />.
move => *;case (x = 2); first by move =>  -> />.
move => *;case (x = 3); first by move =>  -> />.
move => *;case (x = 4); first by move =>  -> />.
move => *;case (x = 5); first by move =>  -> />.
by smt().
qed.

lemma aux10_2 (a : W16.t) :
  (a `>>>` 10) + (of_int 65472)%W16
              = (a `>>>` 10) `|` (of_int 65472)%W16.
proof.
rewrite orw_xpnd.
have -> : (a `>>>` 10) `&` (of_int 65472)%W16 = W16.of_int 0.
+ have ? : (0 <= to_uint (a `>>>` 10) < 1024) by
    rewrite to_uint_shr => />; smt(divz_ge0 ltz_divLR pow2_16 W16.to_uint_cmp).
  apply W16.ext_eq =>  x xb.
  case (0 <= x < 6); 1: by move => smallx; rewrite andwE aux10_1 => /> /#.
  move => largex; rewrite /(`>>>`) /of_int /bits2w /= /int2bs /= /mkseq /= !initiE //=. 
  rewrite !(nth_map 0 false _ x (iota_ 0 16)); 1, 2: by smt(size_iota).
  by rewrite !nth_iota //=; smt(W16.get_out).
by ring.
qed.

(* FIX ME: Generalize and move to JWord *)
lemma SAR_sem10 (a : W16.t) :
   a `|>>` W8.of_int 10 = W16.of_int (to_sint a %/ 2^10).
proof.
rewrite /(`|>>`) to_sintE /smod sarE.
rewrite W8.of_uintK; apply W16.ext_eq => x x_b; rewrite initiE => />.
case (32768 <= to_uint a); last first. (* positive numbers *)
+ move => ab; rewrite W16.of_intwE x_b /= /int_bit /=. 
  rewrite /min  /= get_to_uint /= (modz_small _ 65536); 1: smt(W16.to_uint_cmp).
  case (15 < x + 10). (*high bits*)
  + move => hb /=;rewrite pdiv_small; 1: by smt(W16.to_uint_cmp).
    rewrite mod0z /=.
    have -> : to_uint a %/ 1024 %/ 2 ^ x = 0; last by smt(mod0z). 
    apply  (divz_eq0 (to_uint a %/ 1024) (2^x)); 1: by smt(gt0_pow2). 
    split; 1: by smt(divz_ge0 W16.to_uint_cmp).
    have /= ? : 2^6 <= 2^x by  apply StdOrder.IntOrder.ler_weexpn2l=> // /#.
    by smt(leq_div2r).
 move => /= lb.
 have -> : to_uint a %/ 2 ^ (x + 10) = to_uint a %/ 1024 %/ 2 ^ x; last by smt().
 rewrite (_: 1024 = 2^10) // {1}(divz_eq (to_uint a) (2^10)) exprD_nneg //; 1: smt().  
 by smt(divmod_mul gt0_pow2). 

move => neg.
rewrite divzDr //= (_: 1024 = 2^10) // -to_uint_shr //=.
rewrite of_intS to_uintK /W16.([-]) /ulift1  aux10_2 orwE /=.
case (15 < x + 10); last by  move => x_tub; rewrite aux10_1 /= /#.
move => x_tlb; rewrite /min x_tlb aux10_0 /=; 1: by smt().
rewrite get_to_uint => />.
by smt(W16.to_uint_cmp pow2_16).
qed.

lemma fqmul_corr_h _a _b: 
   hoare[ Jkem.M.__fqmul : 
     to_sint a = _a /\ to_sint b = _b ==> to_sint res = SREDC (_a * _b)].
proof.
proc; wp; skip  => &hr [#] /= H H0.
rewrite /SREDC SAR_sem16 SAR_sem16 /=. 
rewrite smod_W32 smod_W32 smod_W16 W16.of_sintK /(`<<`) /sigextu32 /truncateu16 /=  H H0.
rewrite shlMP; first by smt().  
by rewrite W32.to_sintE W32.of_uintK W32.of_uintK W32.of_sintK qE /= !modz_dvd /R /=; smt().
qed.

lemma fqmul_ll : islossless M.__fqmul by proc; islossless.

lemma fqmul_corr _a _b :
  phoare [ M.__fqmul : 
     W16.to_sint a = _a /\ W16.to_sint b = _b ==> 
         W16.to_sint res = SREDC (_a * _b)] = 1%r.
proof. by conseq fqmul_ll (fqmul_corr_h _a _b). qed.

lemma aux26_0 x :
  6 <= x < 32 => (W32.of_int 4294967232).[x] = true.
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
  0 <= x < 6 => (W32.of_int 4294967232).[x] = false.
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
have -> : (a `>>>` 26) `&` (of_int 4294967232)%W32 = W32.of_int 0.
+ have ? : (0 <= to_uint (a `>>>` 26) < 64) by 
    rewrite to_uint_shr => />; smt(divz_ge0 ltz_divLR pow2_32 W32.to_uint_cmp).
  apply W32.ext_eq =>  x xbnd.
  case (0 <= x < 6); 1: by move => smallx; rewrite andwE aux26_1 => /> /#.
  move => largex; rewrite /(`>>>`) /of_int /bits2w /= /int2bs /= /mkseq /= !initiE //=. 
  rewrite !(nth_map 0 false _ x (iota_ 0 32)); 1, 2: by smt(size_iota).
  by rewrite !nth_iota //=; smt(W32.get_out).
by ring.
qed.

(* FIX ME: Generalize and move to JWord *)
lemma SAR_sem26 (a : W32.t) :
   a `|>>` W8.of_int 26 = W32.of_int (to_sint a %/ 2^26).
proof.
rewrite /(`|>>`) to_sintE /smod sarE.
rewrite W8.of_uintK; apply W32.ext_eq => x x_b; rewrite initiE => />.
case (2147483648 <= to_uint a); last first. (* positive numbers *)
+ move => ab; rewrite W32.of_intwE x_b /= /int_bit /=. 
  rewrite /min  /= get_to_uint /= (modz_small _ 4294967296); 1: smt(W32.to_uint_cmp).
  case (31 < x + 26). (*high bits*)
  + move => hb /=;rewrite pdiv_small; 1: by smt(W32.to_uint_cmp).
    rewrite mod0z /=.
    have -> : to_uint a %/ 67108864 %/ 2 ^ x = 0; last by smt(mod0z). 
    apply  (divz_eq0 (to_uint a %/ 67108864) (2^x)); 1: by smt(gt0_pow2). 
    split; 1: by smt(divz_ge0 W32.to_uint_cmp).
    have /= ? : 2^5 <= 2^x by  apply StdOrder.IntOrder.ler_weexpn2l=> // /#.
    by smt(leq_div2r).
 move => /= lb.
 have -> : to_uint a %/ 2 ^ (x + 26) = to_uint a %/ 67108864 %/ 2 ^ x; last by smt().
 rewrite (_: 67108864 = 2^26) // {1}(divz_eq (to_uint a) (2^26)) exprD_nneg //; 1: smt().  
 by smt(divmod_mul gt0_pow2). 

move => neg.
rewrite divzDr //= (_: 67108864 = 2^26) // -to_uint_shr //=.
rewrite of_intS to_uintK /W32.([-]) /ulift1  aux26_2 orwE /=.
case (31 < x + 26); last by  move => x_tub; rewrite aux26_1 /= /#.
move => x_tlb; rewrite /min x_tlb aux26_0 /=; 1: by smt().
rewrite get_to_uint => />.
by smt(W32.to_uint_cmp pow2_32).
qed.


lemma barrett_reduce_corr_h _a :
  hoare [ M.__barrett_reduce : 
     W16.to_sint a = _a  ==> 
         W16.to_sint res = BREDC _a 26].
proof.
proc;wp; skip  => &hr [#] /= <-.
rewrite /sigextu32 /truncateu16 /= SAR_sem26  !W32.of_sintK /= !W32.of_uintK W16.to_sintE to_uintD /=.
pose x := (smod (to_sint a{hr} * 20159 %% 4294967296))%W32 %/ 67108864 * 3329.
have -> : to_uint (- (of_int (x %% 4294967296))%W16) = to_uint (W16.of_int (-x)).
+ rewrite of_uintK of_intN' W16.of_uintK /=.
  case (x %% 2^32 = 0); 1: by smt().
  move => /= *; rewrite modNz; 1,2: smt(modz_ge0). 
  by rewrite -modzDml (modz_dvd x (65536 * 65536) 65536); smt().
      
rewrite /BREDC /R /= !smod_W32  !smod_W16 qE /= -/x of_uintK /=.
congr;congr.
rewrite to_sintE /smod /=. 
case (2 ^ (16 - 1) <= to_uint a{hr}); last by smt(W16.to_uint_cmp pow2_16).
move => H; rewrite H /=. 
have ->: to_uint a{hr} - 65536 = to_uint a{hr} + (-1) * 65536; 1: by ring.
by rewrite modzMDr; smt(W16.to_uint_cmp pow2_16).
qed.

lemma barrett_reduce_ll :  islossless M.__barrett_reduce by proc; islossless.

lemma barrett_reduce_corr _a :
  phoare [ M.__barrett_reduce : 
     W16.to_sint a = _a  ==> 
         W16.to_sint res = BREDC _a 26] = 1%r.
proof. by conseq barrett_reduce_ll (barrett_reduce_corr_h _a). qed.


import Zq.

lemma exp_max a b :
   0 <= a => 0 <= b => 2^a <= 2^(max a b) /\ 2^b <= 2^(max a b) 
  by smt(StdOrder.IntOrder.ler_weexpn2l).

lemma add_corr (a b : W16.t) (a' b' : Fq) (asz bsz : int): 
   0 <= asz < 15 => 0 <= bsz < 15 =>
   a' = inFq (W16.to_sint a) =>
   b' = inFq (W16.to_sint b) =>
   bw16 a asz => 
   bw16 b bsz =>
     inFq (W16.to_sint (a + b)) = a' + b' /\
           bw16 (a + b) (max asz bsz + 1).
proof.
pose aszb := 2^asz.
pose bszb := 2^bsz.
move => /= *.
have /= bounds_asz : 0 < aszb <= 2^14
 by split; [ apply gt0_pow2 
           | move => *; rewrite  /aszb; apply StdOrder.IntOrder.ler_weexpn2l => /> /#].
have /= bounds_bsz : 0 < bszb <= 2^14
 by split; [ apply gt0_pow2
           | move => *; rewrite  /bszb; apply StdOrder.IntOrder.ler_weexpn2l => /> /#].
rewrite !to_sintD_small => />; first  by smt().
split; 1: by smt(inFqD).
rewrite (Ring.IntID.exprS 2 (max asz bsz)); 1: by smt().
by smt(exp_max).
qed.

lemma add_corr_qv (a b : W16.t) (a' b' : Fq) (asz bsz : int): 
   1 <= asz <= 6 => 1 <= bsz <= 3 =>
   a' = inFq (W16.to_sint a) =>
   b' = inFq (W16.to_sint b) =>
   -asz*q <= (W16.to_sint a) < asz*q =>
   -bsz*q <= (W16.to_sint b) < bsz*q =>
     inFq (W16.to_sint (a + b)) = a' + b' /\
      -(asz+bsz)*q <= (W16.to_sint b) < (asz+bsz)*q
  by move => *; rewrite !to_sintD_small => />; by smt(inFqD to_sintD_small qE).

lemma sub_corr (a b : W16.t) (a' b' : Fq) (asz bsz : int): 
   0 <= asz < 15 => 0 <= bsz < 15 =>
   a' = inFq (W16.to_sint a) =>
   b' = inFq (W16.to_sint b) =>
   bw16 a asz => 
   bw16 b bsz =>
     inFq (W16.to_sint (a - b)) = a' - b' /\
           bw16 (a - b) (max asz bsz + 1).
proof.
pose aszb := 2^asz.
pose bszb := 2^bsz.
move => /= *.
have /= bounds_asz : 0 < aszb <= 2^14
 by split; [ apply gt0_pow2 
           | move => *; rewrite  /aszb; apply StdOrder.IntOrder.ler_weexpn2l => /> /#].
have /= bounds_bsz : 0 < bszb <= 2^14
 by split; [ apply gt0_pow2
           | move => *; rewrite  /bszb; apply StdOrder.IntOrder.ler_weexpn2l => /> /#].
rewrite !to_sintB_small => />; first  by smt().
split; 1: by smt(inFqB).
rewrite (Ring.IntID.exprS 2 (max asz bsz)); 1: by smt().
by smt(exp_max).
qed.

lemma compress_impl_small (a : W16.t) (d : int):
  1 <= d <= 4 =>
  bpos16 a q =>
  (to_uint (((zeroextu32 a `<<` W8.of_int d) + 
     W32.of_int 1665) * W32.of_int 80635 `>>` W8.of_int 28)) %% 2^d=
       compress d (inFq (to_sint a)).
proof.
move => drng.
have /= dpow : 2^1<=2^d <= 2^4 
 by split; move => *; apply StdOrder.IntOrder.ler_weexpn2l; smt(). 
rewrite qE;move => abl; move : (to_sint_unsigned a _); 1: by smt().
move => au; rewrite -compress_alt_compress; 1: by smt(). 
rewrite /zeroextu32 /truncateu8 /compress_alt qE => /= *.
rewrite  /(`<<`) /(`>>`) W32.shlMP; 1: by smt().
rewrite W32.to_uint_shr; 1: by smt().
rewrite inFqK to_sintE /max /= !W32.of_uintK /= qE /=.
rewrite !(modz_small _ 32) /=; 1: smt().
rewrite !(modz_small _ 256) /=; 1: smt().
rewrite !(modz_small _ 3329) /=; 1: smt().
have ->: W16.smod (to_uint a) = to_uint a by
  move : abl; rewrite /to_sint /smod /=; 1: by smt(W16.to_uint_cmp pow2_16).
pose xx := (to_uint a * 2^d + 1665).
have -> : (4294967296 = 16*268435456) by auto. 
rewrite divz_mod_mul //. 
rewrite modz_dvd;  last by smt(W16.to_uint_cmp pow2_16).
rewrite -pow2_4; apply dvdz_exp2l; smt().
qed.


lemma compress_impl_large (a : W16.t) :
  bpos16 a q =>
  (to_uint (((zeroextu64 a `<<` (of_int 10)%W8) + (of_int 1665)%W64) * (of_int 1290167)%W64 `>>`
           (of_int 32)%W8)) %% 1024 = compress 10 (inFq (to_sint a)).
rewrite /bpos16 qE;move => abnd.
move : (to_sint_unsigned a _); 1: by smt().
move => au; rewrite -compress_alt_compress_large. 
rewrite /zeroextu64 /compress_alt_large qE => /= *.
rewrite  /(`<<`) /(`>>`) W64.shlMP; 1: by smt().
rewrite W64.to_uint_shr; 1: by smt().
rewrite inFqK to_sintE /max /= !W64.of_uintK /= qE /=.
rewrite !(modz_small _ 3329) /=; 1: smt().
have ->: W16.smod (to_uint a) = to_uint a by
  move : abnd; rewrite /to_sint /smod /=; 1: by smt(W16.to_uint_cmp pow2_16).
pose xx := (to_uint a * 1024 + 1665).
have -> : (18446744073709551616 = 4294967296 * 4294967296) by auto. 
rewrite divz_mod_mul //. 
by rewrite (modz_small _ 4294967296); 1: by smt().
qed.

end Fq.
