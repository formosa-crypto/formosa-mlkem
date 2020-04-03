require import List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.

require import Array256.
require import WArray512.



module M = {
  proc poly_add (ap:W16.t Array256.t, bp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;
    
    var rp:W16.t Array256.t;
    var i:int;
    var a:W16.t;
    var b:W16.t;
    var r:W16.t;
    rp <- witness;
    i <- 0;
    while (i < 256) {
      a <- ap.[i];
      b <- bp.[i];
      r <- (a + b);
      rp.[i] <- r;
      i <- i + 1;
    }
    return (rp);
  }

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

  proc poly_invntt (rp:W16.t Array256.t, zetasp:W64.t) : W16.t Array256.t = {
    
    var szetasp:W64.t;
    var len:W64.t;
    var start:W64.t;
    var zeta_0:W16.t;
    var j:W64.t;
    var cmp:W64.t;
    var offset:W64.t;
    var s:W16.t;
    var t:W16.t;
    var m:W16.t;
    
    szetasp <- zetasp;
    len <- (W64.of_int 2);
    
    while ((len \ule (W64.of_int 128))) {
      start <- (W64.of_int 0);
      
      while ((start \ult (W64.of_int 256))) {
        zeta_0 <- (loadW16 Glob.mem (W64.to_uint (zetasp + (W64.of_int 0))));
        zetasp <- (zetasp + (W64.of_int 2));
        j <- start;
        cmp <- (start + len);
        
        while ((j \ult cmp)) {
          offset <- (j + len);
          s <- rp.[(W64.to_uint offset)];
          t <- rp.[(W64.to_uint j)];
          m <- (s + t);
          m <@ barrett_reduce (m);
          rp.[(W64.to_uint j)] <- m;
          t <- (t - s);
          t <@ fqmul (t, zeta_0);
          rp.[(W64.to_uint offset)] <- t;
          j <- (j + (W64.of_int 1));
        }
        start <- (j + len);
      }
      len <- (len `<<` (W8.of_int 1));
    }
    zetasp <- szetasp;
    zeta_0 <- (loadW16 Glob.mem (W64.to_uint (zetasp + (W64.of_int 254))));
    j <- (W64.of_int 0);
    
    while ((j \ult (W64.of_int 256))) {
      t <- rp.[(W64.to_uint j)];
      t <@ fqmul (t, zeta_0);
      rp.[(W64.to_uint j)] <- t;
      j <- (j + (W64.of_int 1));
    }
    return (rp);
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

