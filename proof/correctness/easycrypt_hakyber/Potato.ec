type t.

op potato : t -> t -> t.

abbrev (+) = potato.

axiom appliable ['a] (f : t -> 'a) x y : f x = y.

lemma oops a x y : a + x = y.
proof.
(*TODO: should probably work.*)
(*apply appliable.*)
by move: (appliable ((+) a) x y).
qed.
