require import AllCore.

lemma oops : 0 + 0 = 0 => forall (x y : int), x + y = y + x.
proof.
move => H.
(*// does nothing as expected.*)
rewrite // in H.
(*//= is expected to function as a /=, but does nothing.*)
rewrite //= in H.
(*/= works, as expected.*)
rewrite /= in H.
by move => ? ?; rewrite addrC.
qed.
