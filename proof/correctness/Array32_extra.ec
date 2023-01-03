require import AllCore List.
require import Array32.
require import Kyber.

import Zq.

from Jasmin require import JUtils.

lemma tP_red (t1 t2: 'a Array32.t) :
  (forall i, i \in iotared 0 32 => t1.[i] = t2.[i]) => t1 = t2.
  rewrite tP => />H i Hi1 Hi2. smt(). qed.

lemma initEq32 (f g: int -> 'a) : 
   (Array32.init f = Array32.init g) <=> forall i, 0 <= i < 32 => f i = g i.
   rewrite tP => />. split.
   move => H i Hi1 Hi2. move :(H i). rewrite Hi1 Hi2 !initE /= Hi1 Hi2 => />.
   move => H i Hi1 Hi2. rewrite !initE /= Hi1 Hi2 H => />.
   qed.

lemma initSet (r : 'a Array32.t) (f : int -> 'a) f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 f20 f21 f22 f23 f24 f25 f26 f27 f28 f29 f30 f31 :
  f0 = f 0 => f1 = f 1 => f2 = f 2 => f3 = f 3 => f4 = f 4 => f5 = f 5 => f6 = f 6 => f7 = f 7 => f8 = f 8 => f9 = f 9 => f10 = f 10 => f11 = f 11 => f12 = f 12 => f13 = f 13 => f14 = f 14 => f15 = f 15 => f16 = f 16 => f17 = f 17 => f18 = f 18 => f19 = f 19 => f20 = f 20 => f21 = f 21 => f22 = f 22 => f23 = f 23 => f24 = f 24 => f25 = f 25 => f26 = f 26 => f27 = f 27 => f28 = f 28 => f29 = f 29 => f30 = f 30 => f31 = f 31 =>
  r.[0 <- f0].[1 <- f1].[2 <- f2].[3 <- f3].[4 <- f4].[5 <- f5].[6 <- f6].[7 <- f7].[8 <- f8].[9 <- f9].[10 <- f10].[11 <- f11].[12 <- f12].[13 <- f13].[14 <- f14].[15 <- f15].[16 <- f16].[17 <- f17].[18 <- f18].[19 <- f19].[20 <- f20].[21 <- f21].[22 <- f22].[23 <- f23].[24 <- f24].[25 <- f25].[26 <- f26].[27 <- f27].[28 <- f28].[29 <- f29].[30 <- f30].[31 <- f31] = init f.
move => -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> -> ->. apply tP_red => /> i.
do 31!(move => Hi; case Hi => |>). qed.


