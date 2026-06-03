(* General EC imports *)
require import AllCore List.
require import IntDiv.

from Jasmin require import JWord.

from JazzEC require import Array25 Array32 Array128 Array168 Array256.

(* Imports of "lower-level" MLKEM spec parts *)
require import GFq.
import Zq.
require import Rq.

require import Symmetric. 

module Parse(XOF : XOF_t) = {
  proc sample() : poly = {
    var j, b168, bi, bi1, bi2, d1, d2,k;
    var aa : poly;
    aa <- witness;
    j <- 0;
    while (j < 256) {
      b168 <@ XOF.next_bytes();
      k <- 0;
      while ((j < 256) && (k < 168)) {
        bi  <- b168.[k];
        bi1 <- b168.[k+1];
        bi2 <- b168.[k+2];
        k <- k + 3;
        d1 <- to_uint bi        + 256 * (to_uint bi1 %% 16);
        d2 <- to_uint bi1 %/ 16 + 16  *  to_uint bi2;
        if (d1 < q)                { aa.[j] <- incoeff d1; j <- j + 1; }
          if ((d2 < q) && (j < 256)) { aa.[j] <- incoeff d2; j <- j + 1; }
      }
    }
    return aa;
  }
}.


module CBD2 = {
  proc sample(bytes : W8.t Array128.t) : poly = {
    var i,j,a,b;
    var rr : poly;
    rr <- witness;
    j <- 0; i <- 0; 
    while (i < 128) {
      a <- b2i bytes.[i].[j %% 2 * 4 + 0] + b2i bytes.[i].[j %% 2 * 4 + 1];
      b <- b2i bytes.[i].[j %% 2 * 4 + 2] + b2i bytes.[i].[j %% 2 * 4 + 3];
      rr.[j] <- incoeff  (a - b);
      j <- j + 1;
      a <- b2i bytes.[i].[j %% 2 * 4 + 0] + b2i bytes.[i].[j %% 2 * 4 + 1];
      b <- b2i bytes.[i].[j %% 2 * 4 + 2] + b2i bytes.[i].[j %% 2 * 4 + 3];
      rr.[j] <- incoeff  (a - b);
      j <- j + 1;
      i <- i + 1;
    }
    return rr;
  }
}.

proc op cbd2sample = CBD2.sample. (* The functional lift *)
