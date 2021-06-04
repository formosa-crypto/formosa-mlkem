type t.

op operator : t -> t -> t.

abbrev (+) = operator.

axiom appliable ['a] (f : t -> 'a) x y : f x = y.

lemma oops a x y : a + x = y.
proof.
(*Should work.*)
(*apply appliable.*)
by move: (appliable ((+) a) x y).
qed.
