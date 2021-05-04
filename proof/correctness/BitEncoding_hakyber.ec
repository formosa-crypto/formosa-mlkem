require import AllCore IntDiv Array256 Array128.
require import List Ring StdOrder Fq.
require import IntMin.
require import List_extra Ring_extra RealExp_extra IntDiv_extra.
require import List_hakyber IntDiv_hakyber For.

import Fq IntOrder.

import Kyber_.
import ZModField.
import BitEncoding.BS2Int.


  op bitrev (i k : int) = bs2int (rev (int2bs i k)).

  lemma bitrev_ineq (i k : int) :
    0 <= i =>
    0 <= bitrev i k < 2 ^ i.
  proof.
    move => le0i; split; [apply bs2int_ge0|move => _]; rewrite /bitrev; move: (size_int2bs i k) => @/max.
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
  proof.
    by move => le0i Hk1in Hk2in eq_bitrev; rewrite -(bitrev_involutive i k1) // -(bitrev_involutive i k2) // eq_bitrev.
  qed.
