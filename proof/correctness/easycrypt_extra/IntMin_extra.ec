 require import AllCore StdOrder.
require import IntMin.
(*---*) import IntOrder.


(*-----------------------------------------------------------------------------*)

lemma pmin_nmem E i : ! sempty (pcap E) => 0 <= i < pmin E => ! E i.
proof.
move => Hnsempty [le0i ltipmin]; apply/negP => HEi.
by move: (ltr_le_trans _ _ _ ltipmin (pmin_min _ _ Hnsempty le0i HEi)).
qed.

lemma pmin_max E i : ! sempty (pcap E) => 0 <= i => (forall j , 0 <= j < i => ! E j) => i <= pmin E.
proof.
move=> h ge0_i min_i; rewrite lerNgt; apply/negP=> gti.
by apply/(min_i (pmin E))/pmin_mem => //; rewrite ge0_pmin.
qed.
