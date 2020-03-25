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
  
  proc barrett_reduce (a:W16.t) : W16.t = {
    
    var r:W16.t;
    var t:W32.t;
    
    t <- (sigextu32 a);
    t <- (t * (W32.of_int 20159));
    t <- (t `|>>` (W8.of_int 26));
    t <- (t * (W32.of_int 3329));
    r <- (truncateu16 t);
    r <- a;
    r <- (r - (truncateu16 t));
    return (r);
  }
  
  proc poly_reduce (rp:W16.t Array256.t) : W16.t Array256.t = {
    
    var j:W64.t;
    var t:W16.t;
    
    j <- (W64.of_int 0);
    
    while ((j \ult (W64.of_int 256))) {
      t <- rp.[(W64.to_uint j)];
      t <@ barrett_reduce (t);
      rp.[(W64.to_uint j)] <- t;
      j <- (j + (W64.of_int 1));
    }
    return (rp);
  }
  
  proc poly_ntt (rp:W16.t Array256.t, zetasp:W64.t) : W16.t Array256.t = {
    
    var len:W64.t;
    var start:W64.t;
    var zeta_0:W16.t;
    var j:W64.t;
    var cmp:W64.t;
    var offset:W64.t;
    var t:W16.t;
    var s:W16.t;
    var m:W16.t;
    
    len <- (W64.of_int 128);
    
    while (((W64.of_int 2) \ule len)) {
      start <- (W64.of_int 0);
      
      while ((start \ult (W64.of_int 256))) {
        zetasp <- (zetasp + (W64.of_int 2));
        zeta_0 <- (loadW16 Glob.mem (W64.to_uint (zetasp + (W64.of_int 0))));
        j <- start;
        cmp <- (start + len);
        
        while ((j \ult cmp)) {
          offset <- (j + len);
          t <- rp.[(W64.to_uint offset)];
          t <@ fqmul (t, zeta_0);
          s <- rp.[(W64.to_uint j)];
          m <- s;
          m <- (m - t);
          rp.[(W64.to_uint offset)] <- m;
          t <- (t + s);
          rp.[(W64.to_uint j)] <- t;
          j <- (j + (W64.of_int 1));
        }
        start <- (j + len);
      }
      len <- (len `>>` (W8.of_int 1));
    }
    rp <@ poly_reduce (rp);
    return (rp);
  }
}.

