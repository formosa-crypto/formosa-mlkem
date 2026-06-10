require import AllCore.
require import IntDiv.
require import ZModP Ring.
require import ZModPCentered.

op q : int = 3329 axiomatized by qE.
axiom prime_q : prime q.

(* Centered-representation field: clones the ZModPCentered kernel, giving the
   coefficient field (coeff/incoeff/asint/inv) PLUS the centered representative
   crepr and its algebraic laws (creprD, crepr_mulE, creprN, inzmodK_centered,
   rg_crepr, |.|).  as_sint is exactly crepr. *)
clone include ZModPCentered.ZpCenteredField with
  op ZMR.p <- q
  rename "zmod"       as "coeff"
         "ZMR"        as "Zq"
         "ZModpRing"  as "ZqRing"
         "ZModpField" as "ZqField"
  proof prime_p by apply prime_q.
import Zq.

(* Signed (centered) representation = the kernel's centered representative *)
abbrev as_sint (x : coeff) : int = crepr x.

abbrev absZq (x: coeff): int = `| as_sint x |.

(* Compression and decompression *)
op round(x : real) : int = floor (x + inv 2%r).

abbrev comp (d: int, x: real): int = round (x * (2^d)%r / q%r).
op Compress(d : int, x : coeff) : int = comp d (asint x)%r %% 2^d.

abbrev decomp (d: int, y: real): int = round (y * q%r / (2^d)%r).
op Decompress(d : int, x : int) : coeff = incoeff (decomp d x%r).
