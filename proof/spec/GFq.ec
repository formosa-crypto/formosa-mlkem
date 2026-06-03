require import AllCore.
require import IntDiv.
require import ZModP Ring.

op q : int = 3329 axiomatized by qE.
axiom prime_q : prime q.

clone import ZModField as Zq with 
  op p <- q 
  rename "zmod" as "coeff"
  rename "ZModp" as "Zq"
  proof  prime_p by apply prime_q
  proof *.

(* Signed representation *)
op as_sint(x : coeff) = if (q-1) %/ 2 < asint x then asint x - q else asint x.

abbrev absZq (x: coeff): int = `| as_sint x |.

(* Compression and decompression *)
op round(x : real) : int = floor (x + inv 2%r).

abbrev comp (d: int, x: real): int = round (x * (2^d)%r / q%r).
op compress(d : int, x : coeff) : int = comp d (asint x)%r %% 2^d.

abbrev decomp (d: int, y: real): int = round (y * q%r / (2^d)%r).
op decompress(d : int, x : int) : coeff = incoeff (decomp d x%r).
