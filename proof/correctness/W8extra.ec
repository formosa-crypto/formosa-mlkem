require import AllCore List IntDiv CoreMap IntDiv.
from Jasmin require  import JModel JMemory.
import W8.

lemma wordP_red (w1 w2 :W8.t) : (forall i, i \in iotared 0 8 => w1.[i] = w2.[i]) => w1 = w2.
proof.
rewrite wordP => H i Hi. move :(H i). simplify. smt(). qed.
