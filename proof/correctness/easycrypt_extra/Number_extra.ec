require import AllCore StdOrder Int IntDiv.
(*---*) import IntOrder.


(*-----------------------------------------------------------------------------*)

lemma normrP (n : int) :
  `|n| = if 0 <= n then n else -n.
proof. by case (0 <= n) => [/ger0_def|/ltzNge/ltzW/ler0_def]. qed.
