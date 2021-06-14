require import Int.

op expi (b e: int) =
  iterop e CoreInt.mul b 1.

abbrev ( ^ ) = expi.
