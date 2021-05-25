require import AllCore StdOrder List Ring IntDiv.
(*---*) import IntOrder.
require import Ring_extra.


(*-----------------------------------------------------------------------------*)

lemma all_predI p1 p2 (s : 'a list): all (predI p1 p2) s = (all p1 s /\ all p2 s).
proof. by elim: s => //= x s ->; rewrite /predI /=; case: (p1 x); case (p2 x). qed.


(*-----------------------------------------------------------------------------*)

(*TODO: should be called mkseqSr, and the following one mkseqS.*)
print mkseqS.

lemma mkseqSr ['a] (f : int -> 'a) n : 0 <= n => mkseq f (n + 1) = f 0 :: mkseq (f \o ((+)%Int 1)) n.
proof. by move => le0n; rewrite /mkseq iotaS //= map_comp -iota_addl. qed.

lemma mkseq_nseq ['a] n (x : 'a) :
  mkseq (fun _ => x) n = nseq n x.
proof.
  case (0 <= n) => [le0n|/ltzNge/ltzW len0]; last by rewrite mkseq0_le // nseq0_le.
  elim n le0n => [|n le0n]; first by rewrite mkseq0 nseq0.
  by rewrite nseqSr // mkseqS // => ->.
qed.


(*-----------------------------------------------------------------------------*)

lemma range_incl (x min1 max1 min2 max2 : int) :
  min2 <= min1 =>
  max1 <= max2 =>
  x \in range min1 max1 =>
  x \in range min2 max2.
proof. by rewrite !mem_range => ? ? [? ?]; split;[apply/(lez_trans min1)|move => _; apply/(ltr_le_trans max1)]. qed.

lemma range_add (x y min max : int) :
  x \in range min max =>
  x + y \in range (min + y) (max + y).
proof. by rewrite !mem_range => -[? ?]; rewrite ler_add2r ltr_add2r. qed.

lemma add_range (x y min1 max1 min2 max2 : int) :
  x \in range min1 max1 =>
  y \in range min2 max2 =>
  x + y \in range (min1 + min2) (max1 + max2 - 1).
proof. by rewrite !mem_range => -[? ?] [? ?]; rewrite ler_add //= ltr_subr_addl addrA ler_lt_add // lez_add1r. qed.

lemma range_sub (x y min max : int) :
  x \in range min max =>
  y - x \in range (y + 1 - max) (y + 1 - min).
proof. 
  rewrite !mem_range => -[leminx ltxmax].
  rewrite -!addrA ler_add2l ltr_add2l -!(opprB _ 1).
  by rewrite ler_opp2 ltr_opp2 -ltzS /= ltxmax /= ltzE.
qed.

lemma range_mul x m n a :
  0 < a =>
  x \in range m n =>
  x * a \in range (m * a) ((n - 1) * a + 1).
proof. by rewrite !mem_range => le0a [? ?]; rewrite ltzS !ler_pmul2r //; split => // _; rewrite -ltzS. qed.

lemma range_mul_add (x y min max len : int) :
  x \in range min max =>
  y \in range 0 len =>
  x * len + y \in range (min * len) (max * len).
proof.
  move => /mem_range [le_x ltx_] /mem_range [le_y lty_]; apply/mem_range; split => [|_].
  + by apply/ler_paddr => //; apply/ler_wpmul2r => //; apply/ltzW/(ler_lt_trans y).
  move: (ler_lt_add (x * len) ((max - 1) * len) _ _ _ lty_); last by rewrite -mulrD1l.
  apply/ler_wpmul2r; first by apply/ltzW/(ler_lt_trans y).
  by apply/ltzS.
qed.

lemma range_mul_add_eq (x1 y1 x2 y2 len : int) :
  y1 \in range 0 len =>
  y2 \in range 0 len =>
  x1 * len + y1 = x2 * len + y2 <=>
  x1 = x2 /\ y1 = y2.
proof.
  move => /mem_range [le_y1 lty1_] /mem_range [le_y2 lty2_]; split => [Heq|[->> ->>] //]; split.
  + move: (congr1 (transpose (%/)%IntID len) _ _ Heq) => /=.
    rewrite !divzMDl; try by apply/gtr_eqF/(ler_lt_trans y1).
    by rewrite !pdiv_small.
  move: (congr1 (transpose (%%)%IntID len) _ _ Heq) => /=.
  by rewrite !modzMDl !pmod_small.
qed.
