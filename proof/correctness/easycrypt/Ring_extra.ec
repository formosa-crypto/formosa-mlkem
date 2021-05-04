require import AllCore StdOrder Ring.


(*-----------------------------------------------------------------------------*)

lemma mulrD1l x y : (x + 1) * y = x * y + y.
proof. by rewrite mulrDl. qed.

lemma addr_double (x : int) : x + x = x * 2.
proof. by ring. qed.
