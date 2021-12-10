require import AllCore.

(*mulzA does not use associative, and is written the opposite way to mulrA.*)
print mulzA.
print mulrA.
print associative.

op x, y, z, t : int.
axiom Heq : x * y * z = t.

lemma oops : x * (y * z) = t.
proof.
(*mulzA fails.*)
(*rewrite mulzA.*)
rewrite mulrA.
by rewrite Heq.
qed.
