require import AllCore List.

lemma all_predI p1 p2 (s : 'a list): all (predI p1 p2) s = (all p1 s /\ all p2 s).
proof. by elim: s => //= x s ->; rewrite /predI /=; case: (p1 x); case (p2 x). qed.
