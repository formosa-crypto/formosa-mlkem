lemma andb_id2 a b c d : (a <=> b) => (c <=> d) => ((a /\ c) <=> (b /\ d)).
proof. by case a; case b; case c; case d. qed.

lemma or_andl a b : (a \/ b) <=> ((a /\ !b) \/ b).
proof. by case a; case b. qed.

lemma or_andr a b : (a \/ b) <=> (a \/ (!a /\ b)).
proof. by case a; case b. qed.

lemma and_impl a b : (a /\ b) <=> ((b => a) /\ b).
proof. by case a; case b. qed.

lemma and_impr a b : (a /\ b) <=> ( a /\ (a => b)).
proof. by case a; case b. qed.

lemma negb_eqbl a b : ! (a <=> b) <=> (!a <=> b).
proof. by case a; case b. qed.

lemma negb_eqbr a b : ! (a <=> b) <=> (a <=> !b).
proof. by case a; case b. qed.

lemma transposeP ['a, 'b, 'c] (f : 'a -> 'b -> 'c) (x : 'a) (y : 'b) : f x y = transpose f y x by done.
