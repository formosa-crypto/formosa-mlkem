require import AllCore.
require (****) Matrix.

type R.
clone import Ring.IDomain as R with type t = R.

clone import Matrix as Matrix_ with
    type R <- R, 
    theory ZR <- R.

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

