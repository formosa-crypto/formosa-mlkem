require import AllCore StdOrder List BitEncoding StdBigop.
(*---*) import IntOrder BS2Int Bigint.


op bitrev (i k : int) = bs2int (rev (int2bs i k)).

lemma bitrev_neg (i k : int) :
  i <= 0 =>
  bitrev i k = 0.
proof. by rewrite /bitrev => lei0; move: (size_int2bs i k); rewrite ler_maxl // size_eq0 => ->; rewrite rev_nil bs2int_nil. qed.

lemma bitrev_0 (i : int) :
  bitrev i 0 = 0.
proof.
  case (0 <= i) => [le0i|/ltrNge /ltzW lei0]; last by rewrite bitrev_neg.
  rewrite /bitrev int2bs0 rev_nseq /bs2int size_nseq maxrC maxrE.
  rewrite (BIA.eq_big_seq _ (fun n => 0)) ?BIA.sumri_const -?mulr_intr //= le0i //=.
  by move => x /mem_range [le0x ltxi]; rewrite nth_nseq.
qed.

lemma bitrev_range (i k : int) :
  bitrev i k \in range 0 (2 ^ i).
proof.
  case (0 <= i) => [le0i|/ltrNge /ltzW lei0]; last by rewrite bitrev_neg // mem_range /= expr_gt0.
  rewrite mem_range; split; [apply bs2int_ge0|move => _]; rewrite /bitrev; move: (size_int2bs i k) => @/max.
  by case: (0 < i) => [_ {2}<-|lei0]; [|(have <-: (i = 0) by smt()); move => {2}<-]; rewrite -size_rev; apply bs2int_le2Xs.
qed.

lemma bitrev_involutive (i k : int) :
  0 <= i =>
  k \in range 0 (2 ^ i) =>
  bitrev i (bitrev i k) = k.
proof.
  move => le0i /mem_range [le0k ltk2powi] @/bitrev.
  suff {1}->: i = size (rev (int2bs i k)).
  - by rewrite bs2intK revK int2bsK.
  by rewrite size_rev size_int2bs ler_maxr.
qed.

lemma bitrev_injective (i k1 k2 : int) :
  0 <= i =>
  k1 \in range 0 (2 ^ i) =>
  k2 \in range 0 (2 ^ i) =>
  bitrev i k1 = bitrev i k2 =>
  k1 = k2.
proof. by move => le0i Hk1in Hk2in eq_bitrev; rewrite -(bitrev_involutive i k1) // -(bitrev_involutive i k2) // eq_bitrev. qed.

lemma bitrev_bijective (i k1 k2 : int) :
  0 <= i =>
  k1 \in range 0 (2 ^ i) =>
  k2 \in range 0 (2 ^ i) =>
  bitrev i k1 = bitrev i k2 <=>
  k1 = k2.
proof. by move => le0i Hk1in Hk2in; split => [|-> //]; apply bitrev_injective. qed.
