require import AllCore.
require (****) Matrix.
pragma +oldip.

type R.
clone import Ring.IDomain as R with type t <- R.

clone import Matrix as Matrix_ with   
    type  R        <- R,
      op  ZR.zeror <- R.zeror,
      op  ZR.oner  <- R.oner,
      op  ZR.(+)   <- R.(+),
      op  ZR.([-]) <- R.([-]),
      op  ZR.( * ) <- R.( * ),
      op  ZR.invr  <- R.invr,
    pred  ZR.unit  <- R.unit
    proof ZR.*.

  realize ZR.addrA     by exact: R.addrA    .
  realize ZR.addrC     by exact: R.addrC    .
  realize ZR.add0r     by exact: R.add0r    .
  realize ZR.addNr     by exact: R.addNr    .
  realize ZR.oner_neq0 by exact: R.oner_neq0.
  realize ZR.mulrA     by exact: R.mulrA    .
  realize ZR.mulrC     by exact: R.mulrC    .
  realize ZR.mul1r     by exact: R.mul1r    .
  realize ZR.mulrDl    by exact: R.mulrDl   .
  realize ZR.mulVr     by exact: R.mulVr    .
  realize ZR.unitP     by exact: R.unitP    .
  realize ZR.unitout   by exact: R.unitout  .
  realize ZR.mulf_eq0  by exact: R.mulf_eq0 .

abbrev (+&) = R.(+).
abbrev (-&) = R.(-).
abbrev (`<*>`) a b = dotp a b.

instance ring with R
  op rzero = R.zeror
  op rone  = R.oner
  op add   = R.( + )
  op opp   = R.([-])
  op mul   = R.( * )
  op expr  = R.exp
  op ofint = R.ofint

  proof oner_neq0 by apply R.oner_neq0
  proof addrA     by apply R.addrA
  proof addrC     by apply R.addrC
  proof addr0     by apply R.addr0
  proof addrN     by apply R.addrN
  proof mulr1     by apply R.mulr1
  proof mulrA     by apply R.mulrA
  proof mulrC     by apply R.mulrC
  proof mulrDl    by apply R.mulrDl
  proof expr0     by apply R.expr0
  proof ofint0    by apply R.ofint0
  proof ofint1    by apply R.ofint1
  proof exprS     by apply R.exprS
  proof ofintS    by apply R.ofintS
  proof ofintN    by apply R.ofintN.

