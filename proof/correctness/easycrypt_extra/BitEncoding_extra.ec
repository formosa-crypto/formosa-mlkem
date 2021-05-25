require import AllCore StdOrder List BitEncoding StdBigop IntDiv.
require import Ring_extra List_extra IntDiv_extra.
(*---*) import IntOrder BS2Int.


(*TODO: change names*)
print int2bsS.
print bs2int_rcons.
lemma int2bs_cons N n :
  0 < N =>
  int2bs N n = (!2 %| n) :: int2bs (N - 1) (n %/ 2).
proof.
  move => lt0N; rewrite /int2bs -{1}(subrK N 1) mkseqSr /=; first by apply/subr_ge0; move/ltzE: lt0N.
  rewrite expr0 dvdzE /=; apply eq_in_mkseq => K [le0K _]; rewrite /(\o) /=.
  by rewrite -divz_mul // -exprS // (addrC 1).
qed.

lemma int2bs_cat K N n :
  0 <= K <= N =>
  int2bs N n = (int2bs K n) ++ (int2bs (N - K) (n %/ (2 ^ K))).
proof.
  move => [le0K leKN]; rewrite /int2bs -{1}(subrK N K) (addrC _ K) mkseq_add ?subr_ge0 //.
  congr; apply eq_in_mkseq => I /= [le0I _].
  by rewrite exprD_nneg // IntDiv_extra.divz_mul // expr_ge0.
qed.

(*TODO: odd name, and useless hypothesis.*)
print bs2int_mod.
lemma int2bs_mod N n :
  int2bs N (n %% 2 ^ N) = int2bs N n.
proof.
  apply eq_in_mkseq => K /mem_range HK_range /=.
  rewrite IntDiv_extra.modz_pow2_div; first by move/mem_range: HK_range => [-> /=]; apply ltzW.
  rewrite modz_dvd //; move: (dvdz_exp2l 2 1 (N - K)); rewrite expr1 => /= -> //.
  by apply/ler_subr_addl/ltzE; move/mem_range: HK_range.
qed.

lemma int2bs_nseq_false N n :
  (2 ^ N) %| n =>
  int2bs N n = nseq N false.
proof.
  move => /dvdzP [q ->>]; rewrite /int2bs -mkseq_nseq.
  apply eq_in_mkseq => K /mem_range HK_range /=.
  apply negeqF => /=; rewrite -IntDiv_extra.divzpMr.
  + by apply dvdz_exp2l; move/mem_range: HK_range => [-> /ltzW].
  rewrite -IntDiv_extra.exprD_subz //; first by move/mem_range: HK_range => [-> /ltzW].
  rewrite -dvdzE dvdz_mull; move: (dvdz_exp2l 2 1 (N - K)); rewrite expr1 /= => -> //.
  by apply/ltzS/ltr_subl_addr/ltr_subr_addr; move/mem_range: HK_range.
qed.

lemma int2bs1 N :
  0 < N =>
  int2bs N 1 = true :: nseq (N - 1) false.
proof. by move => lt0N; rewrite int2bs_cons // dvdzE /= int2bs_nseq_false. qed.

lemma int2bs_mulr_pow2 K N n :
  0 <= K <= N =>
  int2bs N (2 ^ K * n) = nseq K false ++ int2bs (N - K) n.
proof.
  move => [le0K leKN]; rewrite /int2bs -{1}(subrK N K) (addrC _ K) mkseq_add //; first by apply/subr_ge0.
  rewrite -/int2bs -(int2bs_nseq_false _ (2 ^ K * n)); first by apply/dvdz_mulr/dvdzz.
  congr => //; apply eq_in_mkseq => I /= /mem_range HI_range.
  rewrite exprD_nneg //; first by move/mem_range: HI_range.
  by rewrite divzMpl //; apply expr_gt0.
qed.

lemma int2bs_pow2 K N :
  K \in range 0 N =>
  int2bs N (2 ^ K) = nseq K false ++ true :: nseq (N - 1 - K) false.
proof.
  move => HK_range; move: (int2bs_mulr_pow2 K N 1) => /= ->.
  + by split; move/mem_range: HK_range => // [_ ltKN] _; apply ltzW.
  rewrite int2bs1; first by apply subr_gt0; move/mem_range:HK_range.
  by rewrite addrAC.
qed.


lemma bs2int_nseq_false N :
  bs2int (nseq N false) = 0.
proof.
  case (0 <= N) => [le0N|/ltzNge/ltzW leN0]; last by rewrite nseq0_le // bs2int_nil.
  by rewrite -(int2bs_nseq_false _ 0) ?dvdz0 ?int2bsK ?expr_gt0.
qed.

lemma bs2int_cons x s :
  bs2int (x :: s) = b2i x + 2 * bs2int s.
proof.
  rewrite /bs2int /= (addrC 1) Bigint.BIA.big_int_recl ?size_ge0 /= expr0 /=.
  congr => //; rewrite Bigint.BIA.mulr_sumr; apply Bigint.BIA.eq_big_seq.
  move => K /= HK_range; rewrite (eqz_leq _ 0) -ltzE ltzNge.
  move/mem_range: (HK_range) => [-> _] /=.
  by rewrite mulrA exprS //; move/mem_range: HK_range.
qed.

lemma bs2int_cat s1 s2 :
  bs2int (s1 ++ s2) = bs2int s1 + (2 ^ (size s1)) * bs2int s2.
proof.
  elim/last_ind: s2 => [|s2 b]; first by rewrite cats0 bs2int_nil.
  rewrite -rcons_cat !bs2int_rcons mulrDr addrA mulrA size_cat => ->.
  by rewrite exprD_nneg ?size_ge0.
qed.

lemma bs2int_range s :
  bs2int s \in range 0 (2 ^ size s).
proof. by apply/mem_range; split; [apply bs2int_ge0|move => _; apply bs2int_le2Xs]. qed.

lemma bs2int1 N :
  bs2int (true :: nseq N false) = 1.
proof. by rewrite bs2int_cons bs2int_nseq_false /b2i. qed.

lemma bs2int_mulr_pow2 N s :
  bs2int (nseq N false ++ s) = 2 ^ max 0 N * bs2int s.
proof. by rewrite bs2int_cat bs2int_nseq_false size_nseq. qed.

lemma bs2int_pow2 K N :
  bs2int (nseq K false ++ true :: nseq N false) = 2 ^ max 0 K.
proof. by rewrite bs2int_mulr_pow2 bs2int1. qed.


op bitrev N n = bs2int (rev (int2bs N n)).

lemma bitrev_neg N n :
  N <= 0 =>
  bitrev N n = 0.
proof. by rewrite /bitrev => leN0; move: (size_int2bs N n); rewrite ler_maxl // size_eq0 => ->; rewrite rev_nil bs2int_nil. qed.

lemma bitrev_range N n :
  bitrev N n \in range 0 (2 ^ N).
proof.
  case (0 <= N) => [le0N|/ltrNge /ltzW leN0]; last by rewrite bitrev_neg // mem_range /= expr_gt0.
  by move: (bs2int_range (rev (int2bs N n))); rewrite size_rev size_int2bs ler_maxr.
qed.

lemma bitrev_cat K N n :
  0 <= K <= N =>
  bitrev N n = bitrev (N - K) (n %/ 2 ^ K) + 2 ^ (N - K) * bitrev K n.
proof. by move => [le0K leKN]; rewrite /bitrev (int2bs_cat K) // rev_cat bs2int_cat size_rev size_int2bs ler_maxr // subr_ge0. qed.

lemma bitrev_mod N n :
  bitrev N (n %% 2 ^ N) = bitrev N n.
proof. by rewrite /bitrev int2bs_mod. qed.

lemma bitrev_involutive N n :
  0 <= N =>
  n \in range 0 (2 ^ N) =>
  bitrev N (bitrev N n) = n.
proof.
  move => le0N Hn_range; rewrite /bitrev.
  move: (bs2intK (rev (int2bs N n))).
  rewrite size_rev size_int2bs ler_maxr // => ->.
  by rewrite revK int2bsK // -mem_range.
qed.

lemma bitrev_injective N n1 n2 :
  0 <= N =>
  n1 \in range 0 (2 ^ N) =>
  n2 \in range 0 (2 ^ N) =>
  bitrev N n1 = bitrev N n2 =>
  n1 = n2.
proof. by move => le0N Hn1_range Hn2_range eq_bitrev; rewrite -(bitrev_involutive N n1) // -(bitrev_involutive N n2) // eq_bitrev. qed.

lemma bitrev_bijective N n1 n2 :
  0 <= N =>
  n1 \in range 0 (2 ^ N) =>
  n2 \in range 0 (2 ^ N) =>
  bitrev N n1 = bitrev N n2 <=>
  n1 = n2.
proof. by move => le0n Hn1_range Hn2_range; split => [|-> //]; apply bitrev_injective. qed.

lemma bitrev0 N :
  bitrev N 0 = 0.
proof. by rewrite /bitrev int2bs0 rev_nseq bs2int_nseq_false. qed.

lemma bitrev1 N :
  0 < N =>
  bitrev N 1 = 2 ^ (N - 1).
proof.
  move => lt0N; rewrite /bitrev int2bs1 // rev_cons bs2int_rcons rev_nseq.
  by rewrite size_nseq bs2int_nseq_false /b2i /= ler_maxr // subr_ge0; move/ltzE: lt0N.
qed.

lemma bitrev_mulr_pow2 K N n :
  0 <= K <= N =>
  bitrev N (2 ^ K * n) = bitrev N n %/ 2 ^ K.
proof.
  move => [le0K leKN]; rewrite /bitrev int2bs_mulr_pow2 // rev_cat rev_nseq bs2int_cat bs2int_nseq_false /=.
  rewrite (int2bs_cat (N - K) N); first by split; [rewrite subr_ge0|move => _; rewrite ler_subl_addr ler_addl].
  (*TODO: why must I put exp instead of ^?*)
  rewrite rev_cat bs2int_cat size_rev size_int2bs opprD addrA /= ler_maxr // (mulrC (exp _ _)%IntDiv) divzMDr.
  + by apply/gtr_eqF/expr_gt0.
  by rewrite divz_small // -mem_range normrX_nat // bitrev_range.
qed.

lemma bitrev_pow2 K N :
  K \in range 0 N =>
  bitrev N (2 ^ K) = 2 ^ (N - 1 - K).
proof.
  move => HK_range; move: (bitrev_mulr_pow2 K N 1) => /= ->; first by rewrite (ltzW K); move/mem_range: HK_range.
  rewrite bitrev1; first by apply/(ler_lt_trans K); move/mem_range: HK_range.
  by rewrite -exprD_subz //= -(ltzS K); move/mem_range: HK_range.
qed.

lemma bitrev_range_dvdz K N n :
  0 <= K <= N =>
  n \in range 0 (2 ^ (N - K)) =>
  2 ^ K %| bitrev N n.
proof.
  move => [le0K leKN] Hn_range; rewrite (bitrev_cat (N - K)) //.
  + by rewrite subr_ge0 leKN /= ler_subl_addl -ler_subl_addr.
  rewrite opprD addrA /= divz_small; first by rewrite -mem_range normrX_nat // subr_ge0.
  by rewrite bitrev0 /= dvdz_mulr dvdzz.
qed.

lemma bitrev_dvdz_range K N n :
  0 <= K <= N =>
  (2 ^ (N - K)) %| n =>
  bitrev N n \in range 0 (2 ^ K).
proof.
  move => [le0K leKN] dvdz_n; rewrite (bitrev_cat (N - K)).
  + by rewrite subr_ge0 leKN /= ler_subl_addl -ler_subl_addr.
  rewrite opprD addrA /=; move/dvdzP: dvdz_n => [q ->>].
  rewrite (mulrC q) bitrev_mulr_pow2.
  + by rewrite subr_ge0 leKN.
  rewrite (divz_small (bitrev _ _)) /=; last by apply bitrev_range.
  by rewrite -mem_range normrX_nat ?subr_ge0 // bitrev_range.
qed.

lemma bitrev_add K N m n :
  0 <= K <= N =>
  m \in range 0 (2 ^ K) =>
  bitrev N (m + 2 ^ K * n) = bitrev N m + bitrev N n %/ 2 ^ K.
proof.
  move => [le0K leKN] Hm_range; rewrite (bitrev_cat K) //.
  rewrite (mulrC (exp _ _)) divzMDr; first by apply/gtr_eqF/expr_gt0.
  rewrite divz_small /=; first by rewrite -mem_range normrX_nat.
  rewrite -(bitrev_mod K) modzMDr bitrev_mod (addrC (bitrev _ _)); congr.
  + rewrite (bitrev_cat K N) // divz_small; last by rewrite bitrev0.
    by rewrite -mem_range normrX_nat.
  rewrite (bitrev_cat (N - K) N).
  + by split; [rewrite subr_ge0|move => _; rewrite ler_subl_addr ler_addl].
  rewrite !opprD addrA /= (mulrC (exp _ _)) divzMDr.
  + by apply/gtr_eqF/expr_gt0.
  by rewrite divz_small // -mem_range normrX_nat // bitrev_range.
qed.

(*TODO: jasmin/eclibs/JUtils.ec has a lot of things in common with this.*)
