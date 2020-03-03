require import List Int IntExtra IntDiv CoreMap.
from Jasmin require  import JModel.
require import Montgomery.

theory Fq.

clone import SignedMontgomery with
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


print SREDC'.
lemma fqmul_corr _a _b :
  hoare [ M.fqmul : 
     W16.to_sint a = _a /\ W16.to_sint b = _b ==> 
         W16.to_sint res = SREDC' (_a * _b)].
proof.
proc.
wp; skip  => &hr [#] //= ??.
pose _c := _a * _b.
rewrite /SREDC'.
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

end Fq.
