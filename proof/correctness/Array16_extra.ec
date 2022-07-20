require import AllCore List.
require import Array16.
require import Kyber.

import Zq.

from Jasmin require import JUtils.

lemma tP_red (t1 t2: 'a Array16.t) :
  (forall i, i \in iotared 0 16 => t1.[i] = t2.[i]) => t1 = t2.
  rewrite tP => />H i Hi1 Hi2. smt(). qed.

lemma initEq16 (f g: int -> 'a) : 
   (Array16.init f = Array16.init g) <=> forall i, 0 <= i < 16 => f i = g i.
   rewrite tP => />. split.
   move => H i Hi1 Hi2. move :(H i). rewrite Hi1 Hi2 !initE /= Hi1 Hi2 => />.
   move => H i Hi1 Hi2. rewrite !initE /= Hi1 Hi2 H => />.
   qed.
