require import List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.

require import Array256.
require import WArray512.



module M = {
  proc fqmul (a:W16.t, b:W16.t) : W16.t = {
    
    var r:W16.t;
    var ad:W32.t;
    var bd:W32.t;
    var c:W32.t;
    var u:W32.t;
    var t:W32.t;
    
    ad <- (sigextu32 a);
    bd <- (sigextu32 b);
    c <- (ad * bd);
    u <- (c * (W32.of_int 62209));
    u <- (u `<<` (W8.of_int 16));
    u <- (u `|>>` (W8.of_int 16));
    t <- (u * (W32.of_int 3329));
    t <- (c - t);
    t <- (t `|>>` (W8.of_int 16));
    r <- (truncateu16 t);
    return (r);
  }
  
  proc poly_basemul (ap:W16.t Array256.t, bp:W16.t Array256.t, zetas:W64.t) : 
  W16.t Array256.t = {
    var aux: int;
    
    var rp:W16.t Array256.t;
    var i:int;
    var zeta_0:W16.t;
    var a0:W16.t;
    var b0:W16.t;
    var a1:W16.t;
    var b1:W16.t;
    var r0:W16.t;
    var t:W16.t;
    var r1:W16.t;
    rp <- witness;
    zetas <- (zetas + (W64.of_int 128));
    aux <- (256 %/ 4);
    i <- 0;
    while (i < aux) {
      zeta_0 <-
      (loadW16 Glob.mem (W64.to_uint (zetas + (W64.of_int (2 * i)))));
      a0 <- ap.[(4 * i)];
      b0 <- bp.[(4 * i)];
      a1 <- ap.[((4 * i) + 1)];
      b1 <- bp.[((4 * i) + 1)];
      r0 <@ fqmul (a1, b1);
      r0 <@ fqmul (r0, zeta_0);
      t <@ fqmul (a0, b0);
      r0 <- (r0 + t);
      r1 <@ fqmul (a0, b1);
      t <@ fqmul (a1, b0);
      r1 <- (r1 + t);
      rp.[(4 * i)] <- r0;
      rp.[((4 * i) + 1)] <- r1;
      zeta_0 <- (- zeta_0);
      a0 <- ap.[((4 * i) + 2)];
      b0 <- bp.[((4 * i) + 2)];
      a1 <- ap.[((4 * i) + 3)];
      b1 <- bp.[((4 * i) + 3)];
      r0 <@ fqmul (a1, b1);
      r0 <@ fqmul (r0, zeta_0);
      t <@ fqmul (a0, b0);
      r0 <- (r0 + t);
      r1 <@ fqmul (a0, b1);
      t <@ fqmul (a1, b0);
      r1 <- (r1 + t);
      rp.[((4 * i) + 2)] <- r0;
      rp.[((4 * i) + 3)] <- r1;
      i <- i + 1;
    }
    return (rp);
  }

}.

