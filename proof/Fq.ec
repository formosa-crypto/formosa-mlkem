require import List Int IntExtra IntDiv CoreMap.
from Jasmin require  import JModel.
require import Montgomery.

theory Fq.

clone import SignedReductions with
    op k <- 16,
    op q <- 2^8*13+1,
    op qinv <- 62209,
    op Rinv <- 169.


require import Fqmul.

print M.

lemma balmod_W16 a:
  a %%+- W16.modulus = W16.smod (a %% W16.modulus)
  by rewrite bal_modE W16._smodE //=.

lemma balmod_W32 a:
  a %%+- W32.modulus = W32.smod (a %% W32.modulus)
  by rewrite bal_modE W32._smodE //=.


lemma fqmul_corr _a _b :
  hoare [ M.fqmul : 
     W16.to_sint a = _a /\ W16.to_sint b = _b ==> 
         W16.to_sint res = SREDC (_a * _b)].
proof.
proc.
wp; skip  => &hr [#] //= ??.
pose _c := _a * _b.
rewrite /SREDC.
rewrite SAR_32_sem SAR_32_sem /=. 
rewrite (_: R*R = W32.modulus); first by smt.
rewrite (_: R = W16.modulus); first by smt.
rewrite balmod_W32 balmod_W32 balmod_W16.
rewrite /(`<<`) /sigextu32 /truncateu16 /=. 
rewrite W16.of_sintK. 
rewrite  H H0 -/_c.
rewrite shlMP; first by smt().  
rewrite W32.to_sintE W32.of_uintK W32.of_uintK. 
by rewrite W32.of_sintK /=. 
qed.

require import Barrett_reduce.

print M.


lemma barret_reduct_corr _a :
  hoare [ M.barrett_reduce : 
     W16.to_sint a = _a  ==> 
         W16.to_sint res = BREDC _a 26].
proof.
proc.
wp; skip  => &hr [#] //= ?.
rewrite /sigextu32 /truncateu16 //=. 
rewrite SAR_32_sem  /=. 
rewrite !W32.of_sintK. 
rewrite !W32.of_uintK //=.
pose x := (smod (to_sint a{hr} * 20159 %% 4294967296))%W32 %/ 67108864 * 3329.
rewrite W16.to_sintE //=.
rewrite to_uintD //=.
rewrite (_:to_uint (- (of_int (x %% 4294967296))%W16) = to_uint (W16.of_int (-x))).
  rewrite of_uintK.
  rewrite of_intN'.
  rewrite W16.of_uintK //=.
  rewrite (_:  4294967296 = 65536 * 65536); first by smt().
  case (x %% (65536 * 65536) = 0). smt. smt.
 
rewrite /BREDC.
rewrite !balmod_W32  => /=.
rewrite !balmod_W16.
rewrite -H -/x.
rewrite (_: to_sint a{hr} %% R = to_uint a{hr}). 
rewrite to_sintE _smodE. 
case (2 ^ (16 - 1) <= to_uint a{hr}).
rewrite (_: R = W16.modulus). smt. 
rewrite (_: to_uint a{hr} - W16.modulus = to_uint a{hr} + (-1) * W16.modulus); first by smt().
rewrite modzMDr.
move => *. move : (W16.to_uint_cmp (a{hr})) => bnd.
smt.
rewrite (_: R = W16.modulus). smt. 
smt(@W16).
rewrite (_: W16.to_uint (W16.of_int (-x)) = (-x) %% R). case (0<= -x < W16.modulus); smt(@W16).
smt(@W16).
qed.


end Fq.
