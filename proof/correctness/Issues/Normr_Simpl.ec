require import Int.

print "`|_|".
print CoreInt.absz.

op P : int -> bool.
axiom P2 : P 2.

lemma oops : P `|2|.
proof.
(*This does nothing because CoreInt.absz is an op.*)
rewrite //=.
move: P2.
(*Then why does this work?*)
rewrite //.
qed.
