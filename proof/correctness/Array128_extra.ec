require import AllCore List.
require import Array128.
require import Kyber.

import Zq.

from Jasmin require import JUtils.

lemma tP_red (t1 t2: 'a Array128.t) :
  (forall i, i \in iotared 0 128 => t1.[i] = t2.[i]) => t1 = t2.
  rewrite tP => />H i Hi1 Hi2. smt(). qed.
