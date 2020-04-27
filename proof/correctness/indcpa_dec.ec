require import List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.

require import Array5 Array128 Array256 Array768.
require import WArray20 WArray256 WArray512 WArray1536.

abbrev roundconstants = Array24.of_list witness [W64.of_int 1;
W64.of_int 32898; W64.of_int -9223372036854742902;
W64.of_int -9223372034707259392; W64.of_int 32907; W64.of_int 2147483649;
W64.of_int -9223372034707259263; W64.of_int -9223372036854743031;
W64.of_int 138; W64.of_int 136; W64.of_int 2147516425; W64.of_int 2147483658;
W64.of_int 2147516555; W64.of_int -9223372036854775669;
W64.of_int -9223372036854742903; W64.of_int -9223372036854743037;
W64.of_int -9223372036854743038; W64.of_int -9223372036854775680;
W64.of_int 32778; W64.of_int -9223372034707292150;
W64.of_int -9223372034707259263; W64.of_int -9223372036854742912;
W64.of_int 2147483649; W64.of_int -9223372034707259384].


abbrev jzetas_inv = Array128.of_list witness [W16.of_int 1701;
W16.of_int 1807; W16.of_int 1460; W16.of_int 2371; W16.of_int 2338;
W16.of_int 2333; W16.of_int 308; W16.of_int 108; W16.of_int 2851;
W16.of_int 870; W16.of_int 854; W16.of_int 1510; W16.of_int 2535;
W16.of_int 1278; W16.of_int 1530; W16.of_int 1185; W16.of_int 1659;
W16.of_int 1187; W16.of_int 3109; W16.of_int 874; W16.of_int 1335;
W16.of_int 2111; W16.of_int 136; W16.of_int 1215; W16.of_int 2945;
W16.of_int 1465; W16.of_int 1285; W16.of_int 2007; W16.of_int 2719;
W16.of_int 2726; W16.of_int 2232; W16.of_int 2512; W16.of_int 75;
W16.of_int 156; W16.of_int 3000; W16.of_int 2911; W16.of_int 2980;
W16.of_int 872; W16.of_int 2685; W16.of_int 1590; W16.of_int 2210;
W16.of_int 602; W16.of_int 1846; W16.of_int 777; W16.of_int 147;
W16.of_int 2170; W16.of_int 2551; W16.of_int 246; W16.of_int 1676;
W16.of_int 1755; W16.of_int 460; W16.of_int 291; W16.of_int 235;
W16.of_int 3152; W16.of_int 2742; W16.of_int 2907; W16.of_int 3224;
W16.of_int 1779; W16.of_int 2458; W16.of_int 1251; W16.of_int 2486;
W16.of_int 2774; W16.of_int 2899; W16.of_int 1103; W16.of_int 1275;
W16.of_int 2652; W16.of_int 1065; W16.of_int 2881; W16.of_int 725;
W16.of_int 1508; W16.of_int 2368; W16.of_int 398; W16.of_int 951;
W16.of_int 247; W16.of_int 1421; W16.of_int 3222; W16.of_int 2499;
W16.of_int 271; W16.of_int 90; W16.of_int 853; W16.of_int 1860;
W16.of_int 3203; W16.of_int 1162; W16.of_int 1618; W16.of_int 666;
W16.of_int 320; W16.of_int 8; W16.of_int 2813; W16.of_int 1544;
W16.of_int 282; W16.of_int 1838; W16.of_int 1293; W16.of_int 2314;
W16.of_int 552; W16.of_int 2677; W16.of_int 2106; W16.of_int 1571;
W16.of_int 205; W16.of_int 2918; W16.of_int 1542; W16.of_int 2721;
W16.of_int 2597; W16.of_int 2312; W16.of_int 681; W16.of_int 130;
W16.of_int 1602; W16.of_int 1871; W16.of_int 829; W16.of_int 2946;
W16.of_int 3065; W16.of_int 1325; W16.of_int 2756; W16.of_int 1861;
W16.of_int 1474; W16.of_int 1202; W16.of_int 2367; W16.of_int 3147;
W16.of_int 1752; W16.of_int 2707; W16.of_int 171; W16.of_int 3127;
W16.of_int 3042; W16.of_int 1907; W16.of_int 1836; W16.of_int 1517;
W16.of_int 359; W16.of_int 758; W16.of_int 1441].


abbrev jzetas = Array128.of_list witness [W16.of_int 2285; W16.of_int 2571;
W16.of_int 2970; W16.of_int 1812; W16.of_int 1493; W16.of_int 1422;
W16.of_int 287; W16.of_int 202; W16.of_int 3158; W16.of_int 622;
W16.of_int 1577; W16.of_int 182; W16.of_int 962; W16.of_int 2127;
W16.of_int 1855; W16.of_int 1468; W16.of_int 573; W16.of_int 2004;
W16.of_int 264; W16.of_int 383; W16.of_int 2500; W16.of_int 1458;
W16.of_int 1727; W16.of_int 3199; W16.of_int 2648; W16.of_int 1017;
W16.of_int 732; W16.of_int 608; W16.of_int 1787; W16.of_int 411;
W16.of_int 3124; W16.of_int 1758; W16.of_int 1223; W16.of_int 652;
W16.of_int 2777; W16.of_int 1015; W16.of_int 2036; W16.of_int 1491;
W16.of_int 3047; W16.of_int 1785; W16.of_int 516; W16.of_int 3321;
W16.of_int 3009; W16.of_int 2663; W16.of_int 1711; W16.of_int 2167;
W16.of_int 126; W16.of_int 1469; W16.of_int 2476; W16.of_int 3239;
W16.of_int 3058; W16.of_int 830; W16.of_int 107; W16.of_int 1908;
W16.of_int 3082; W16.of_int 2378; W16.of_int 2931; W16.of_int 961;
W16.of_int 1821; W16.of_int 2604; W16.of_int 448; W16.of_int 2264;
W16.of_int 677; W16.of_int 2054; W16.of_int 2226; W16.of_int 430;
W16.of_int 555; W16.of_int 843; W16.of_int 2078; W16.of_int 871;
W16.of_int 1550; W16.of_int 105; W16.of_int 422; W16.of_int 587;
W16.of_int 177; W16.of_int 3094; W16.of_int 3038; W16.of_int 2869;
W16.of_int 1574; W16.of_int 1653; W16.of_int 3083; W16.of_int 778;
W16.of_int 1159; W16.of_int 3182; W16.of_int 2552; W16.of_int 1483;
W16.of_int 2727; W16.of_int 1119; W16.of_int 1739; W16.of_int 644;
W16.of_int 2457; W16.of_int 349; W16.of_int 418; W16.of_int 329;
W16.of_int 3173; W16.of_int 3254; W16.of_int 817; W16.of_int 1097;
W16.of_int 603; W16.of_int 610; W16.of_int 1322; W16.of_int 2044;
W16.of_int 1864; W16.of_int 384; W16.of_int 2114; W16.of_int 3193;
W16.of_int 1218; W16.of_int 1994; W16.of_int 2455; W16.of_int 220;
W16.of_int 2142; W16.of_int 1670; W16.of_int 2144; W16.of_int 1799;
W16.of_int 2051; W16.of_int 794; W16.of_int 1819; W16.of_int 2475;
W16.of_int 2459; W16.of_int 478; W16.of_int 3221; W16.of_int 3021;
W16.of_int 996; W16.of_int 991; W16.of_int 958; W16.of_int 1869;
W16.of_int 1522; W16.of_int 1628].


module M = {
  proc poly_csubq (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;
    
    var i:int;
    var t:W16.t;
    var b:W16.t;
    
    i <- 0;
    while (i < 256) {
      t <- rp.[i];
      t <- (t - (W16.of_int 3329));
      b <- t;
      b <- (b `|>>` (W8.of_int 15));
      b <- (b `&` (W16.of_int 3329));
      t <- (t + b);
      rp.[i] <- t;
      i <- i + 1;
    }
    return (rp);
  }
  
  proc poly_decompress (ap:W64.t) : W16.t Array256.t = {
    var aux: int;
    
    var rp:W16.t Array256.t;
    var i:int;
    var t:W8.t;
    var d0:W16.t;
    var d1:W16.t;
    rp <- witness;
    i <- 0;
    while (i < 128) {
      t <- (loadW8 Glob.mem (W64.to_uint (ap + (W64.of_int i))));
      d0 <- (zeroextu16 t);
      d1 <- (zeroextu16 t);
      d0 <- (d0 `&` (W16.of_int 15));
      d1 <- (d1 `>>` (W8.of_int 4));
      d0 <- (d0 * (W16.of_int 3329));
      d1 <- (d1 * (W16.of_int 3329));
      d0 <- (d0 + (W16.of_int 8));
      d1 <- (d1 + (W16.of_int 8));
      d0 <- (d0 `>>` (W8.of_int 4));
      d1 <- (d1 `>>` (W8.of_int 4));
      rp.[(2 * i)] <- d0;
      rp.[((2 * i) + 1)] <- d1;
      i <- i + 1;
    }
    return (rp);
  }
  
  proc poly_frombytes (ap:W64.t) : W16.t Array256.t = {
    var aux: int;
    
    var rp:W16.t Array256.t;
    var i:int;
    var c0:W8.t;
    var c1:W8.t;
    var c2:W8.t;
    var d0:W16.t;
    var t:W16.t;
    var d1:W16.t;
    rp <- witness;
    aux <- (256 %/ 2);
    i <- 0;
    while (i < aux) {
      c0 <- (loadW8 Glob.mem (W64.to_uint (ap + (W64.of_int (3 * i)))));
      c1 <-
      (loadW8 Glob.mem (W64.to_uint (ap + (W64.of_int ((3 * i) + 1)))));
      c2 <-
      (loadW8 Glob.mem (W64.to_uint (ap + (W64.of_int ((3 * i) + 2)))));
      d0 <- (zeroextu16 c0);
      t <- (zeroextu16 c1);
      t <- (t `&` (W16.of_int 15));
      t <- (t `<<` (W8.of_int 8));
      d0 <- (d0 `|` t);
      d1 <- (zeroextu16 c2);
      d1 <- (d1 `<<` (W8.of_int 4));
      t <- (zeroextu16 c1);
      t <- (t `>>` (W8.of_int 4));
      d1 <- (d1 `|` t);
      rp.[(2 * i)] <- d0;
      rp.[((2 * i) + 1)] <- d1;
      i <- i + 1;
    }
    return (rp);
  }
  
  proc poly_tomsg (rp:W64.t, a:W16.t Array256.t) : unit = {
    var aux: int;
    
    var r:W8.t;
    var j:int;
    var i:int;
    var t:W16.t;
    var d:W32.t;
    
    a <@ poly_csubq (a);
    i <- 0;
    while (i < 32) {
      r <- (W8.of_int 0);
      j <- 0;
      while (j < 8) {
        t <- a.[((8 * i) + j)];
        d <- (zeroextu32 t);
        d <- (d `<<` (W8.of_int 1));
        d <- (d + (W32.of_int 1665));
        d <- (d * (W32.of_int 80635));
        d <- (d `>>` (W8.of_int 28));
        d <- (d `&` (W32.of_int 1));
        d <- (d `<<` (W8.of_int j));
        r <- (r `|` (truncateu8 d));
        j <- j + 1;
      }
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (rp + (W64.of_int i))) r;
      i <- i + 1;
    }
    return ();
  }
  
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
  
  proc poly_sub (ap:W16.t Array256.t, bp:W16.t Array256.t) : W16.t Array256.t = {
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
      r <- (a - b);
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
  
  proc poly_ntt (rp:W16.t Array256.t) : W16.t Array256.t = {
    
    var zetasp:W16.t Array128.t;
    var zetasctr:W64.t;
    var len:W64.t;
    var start:W64.t;
    var zeta_0:W16.t;
    var j:W64.t;
    var cmp:W64.t;
    var offset:W64.t;
    var t:W16.t;
    var s:W16.t;
    var m:W16.t;
    zetasp <- witness;
    zetasp <- jzetas;
    zetasctr <- (W64.of_int 0);
    len <- (W64.of_int 128);
    
    while (((W64.of_int 2) \ule len)) {
      start <- (W64.of_int 0);
      
      while ((start \ult (W64.of_int 256))) {
        zetasctr <- (zetasctr + (W64.of_int 1));
        zeta_0 <- zetasp.[(W64.to_uint zetasctr)];
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
  
  proc poly_invntt (rp:W16.t Array256.t) : W16.t Array256.t = {
    
    var zetasp:W16.t Array128.t;
    var zetasctr:W64.t;
    var len:W64.t;
    var start:W64.t;
    var zeta_0:W16.t;
    var j:W64.t;
    var cmp:W64.t;
    var offset:W64.t;
    var s:W16.t;
    var t:W16.t;
    var m:W16.t;
    zetasp <- witness;
    zetasp <- jzetas_inv;
    zetasctr <- (W64.of_int 0);
    len <- (W64.of_int 2);
    
    while ((len \ule (W64.of_int 128))) {
      start <- (W64.of_int 0);
      
      while ((start \ult (W64.of_int 256))) {
        zeta_0 <- zetasp.[(W64.to_uint zetasctr)];
        zetasctr <- (zetasctr + (W64.of_int 1));
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
    zeta_0 <- zetasp.[127];
    j <- (W64.of_int 0);
    
    while ((j \ult (W64.of_int 256))) {
      t <- rp.[(W64.to_uint j)];
      t <@ fqmul (t, zeta_0);
      rp.[(W64.to_uint j)] <- t;
      j <- (j + (W64.of_int 1));
    }
    return (rp);
  }
  
  proc poly_basemul (ap:W16.t Array256.t, bp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;
    
    var rp:W16.t Array256.t;
    var zetasp:W16.t Array128.t;
    var zetasctr:W64.t;
    var zeta_0:W16.t;
    var i:int;
    var a0:W16.t;
    var b0:W16.t;
    var a1:W16.t;
    var b1:W16.t;
    var r0:W16.t;
    var t:W16.t;
    var r1:W16.t;
    rp <- witness;
    zetasp <- witness;
    zetasp <- jzetas;
    zetasctr <- (W64.of_int 64);
    aux <- (256 %/ 4);
    i <- 0;
    while (i < aux) {
      zeta_0 <- zetasp.[(W64.to_uint zetasctr)];
      zetasctr <- (zetasctr + (W64.of_int 1));
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
  
  proc polyvec_topolys (pv:W16.t Array768.t) : W16.t Array256.t *
                                               W16.t Array256.t *
                                               W16.t Array256.t = {
    
    var r0:W16.t Array256.t;
    var r1:W16.t Array256.t;
    var r2:W16.t Array256.t;
    var i:W64.t;
    var t:W16.t;
    var j:W64.t;
    r0 <- witness;
    r1 <- witness;
    r2 <- witness;
    i <- (W64.of_int 0);
    
    while ((i \ult (W64.of_int 256))) {
      t <- pv.[(W64.to_uint i)];
      r0.[(W64.to_uint i)] <- t;
      i <- (i + (W64.of_int 1));
    }
    i <- (W64.of_int 0);
    j <- (W64.of_int 256);
    
    while ((i \ult (W64.of_int 256))) {
      t <- pv.[(W64.to_uint j)];
      r1.[(W64.to_uint i)] <- t;
      i <- (i + (W64.of_int 1));
      j <- (j + (W64.of_int 1));
    }
    i <- (W64.of_int 0);
    j <- (W64.of_int (2 * 256));
    
    while ((i \ult (W64.of_int 256))) {
      t <- pv.[(W64.to_uint j)];
      r2.[(W64.to_uint i)] <- t;
      i <- (i + (W64.of_int 1));
      j <- (j + (W64.of_int 1));
    }
    return (r0, r1, r2);
  }
  
  proc polyvec_frompolys (p0:W16.t Array256.t, p1:W16.t Array256.t,
                          p2:W16.t Array256.t) : W16.t Array768.t = {
    
    var r:W16.t Array768.t;
    var i:W64.t;
    var t:W16.t;
    var j:W64.t;
    r <- witness;
    i <- (W64.of_int 0);
    
    while ((i \ult (W64.of_int 256))) {
      t <- p0.[(W64.to_uint i)];
      r.[(W64.to_uint i)] <- t;
      i <- (i + (W64.of_int 1));
    }
    i <- (W64.of_int 0);
    j <- (W64.of_int 256);
    
    while ((i \ult (W64.of_int 256))) {
      t <- p1.[(W64.to_uint i)];
      r.[(W64.to_uint j)] <- t;
      i <- (i + (W64.of_int 1));
      j <- (j + (W64.of_int 1));
    }
    i <- (W64.of_int 0);
    j <- (W64.of_int (2 * 256));
    
    while ((i \ult (W64.of_int 256))) {
      t <- p2.[(W64.to_uint i)];
      r.[(W64.to_uint j)] <- t;
      i <- (i + (W64.of_int 1));
      j <- (j + (W64.of_int 1));
    }
    return (r);
  }
  
  proc polyvec_frombytes (ap:W64.t) : W16.t Array768.t = {
    
    var r:W16.t Array768.t;
    var pp:W64.t;
    var r0:W16.t Array256.t;
    var r1:W16.t Array256.t;
    var r2:W16.t Array256.t;
    r <- witness;
    r0 <- witness;
    r1 <- witness;
    r2 <- witness;
    pp <- ap;
    r0 <@ poly_frombytes (pp);
    pp <- (pp + (W64.of_int 384));
    r1 <@ poly_frombytes (pp);
    pp <- (pp + (W64.of_int 384));
    r2 <@ poly_frombytes (pp);
    r <@ polyvec_frompolys (r0, r1, r2);
    return (r);
  }
  
  proc polyvec_decompress (ap:W64.t) : W16.t Array768.t = {
    var aux: int;
    
    var r:W16.t Array768.t;
    var i:W64.t;
    var j:W64.t;
    var k:int;
    var t:W32.t Array5.t;
    var d:W32.t;
    r <- witness;
    t <- witness;
    i <- (W64.of_int 0);
    j <- (W64.of_int 0);
    
    while ((i \ult (W64.of_int 768))) {
      k <- 0;
      while (k < 5) {
        t.[k] <- (zeroextu32 (loadW8 Glob.mem (W64.to_uint (ap + j))));
        j <- (j + (W64.of_int 1));
        k <- k + 1;
      }
      d <- t.[1];
      t.[1] <- (t.[1] `>>` (W8.of_int 2));
      d <- (d `&` (W32.of_int 3));
      d <- (d `<<` (W8.of_int 8));
      t.[0] <- (t.[0] `|` d);
      d <- t.[2];
      t.[2] <- (t.[2] `>>` (W8.of_int 4));
      d <- (d `&` (W32.of_int 15));
      d <- (d `<<` (W8.of_int 6));
      t.[1] <- (t.[1] `|` d);
      d <- t.[3];
      t.[3] <- (t.[3] `>>` (W8.of_int 6));
      d <- (d `&` (W32.of_int 63));
      d <- (d `<<` (W8.of_int 4));
      t.[2] <- (t.[2] `|` d);
      d <- t.[4];
      d <- (d `<<` (W8.of_int 2));
      t.[3] <- (t.[3] `|` d);
      k <- 0;
      while (k < 4) {
        t.[k] <- (t.[k] * (W32.of_int 3329));
        t.[k] <- (t.[k] + (W32.of_int 512));
        t.[k] <- (t.[k] `>>` (W8.of_int 10));
        r.[(W64.to_uint i)] <- (truncateu16 t.[k]);
        i <- (i + (W64.of_int 1));
        k <- k + 1;
      }
    }
    return (r);
  }
  
  proc polyvec_pointwise_acc (a:W16.t Array768.t, b:W16.t Array768.t) : 
  W16.t Array256.t = {
    
    var r:W16.t Array256.t;
    var a0:W16.t Array256.t;
    var a1:W16.t Array256.t;
    var a2:W16.t Array256.t;
    var b0:W16.t Array256.t;
    var b1:W16.t Array256.t;
    var b2:W16.t Array256.t;
    var t:W16.t Array256.t;
    a0 <- witness;
    a1 <- witness;
    a2 <- witness;
    b0 <- witness;
    b1 <- witness;
    b2 <- witness;
    r <- witness;
    t <- witness;
    (a0, a1, a2) <@ polyvec_topolys (a);
    (b0, b1, b2) <@ polyvec_topolys (b);
    r <@ poly_basemul (a0, b0);
    t <@ poly_basemul (a1, b1);
    r <@ poly_add (r, t);
    t <@ poly_basemul (a2, b2);
    r <@ poly_add (r, t);
    r <@ poly_reduce (r);
    return (r);
  }
  
  proc polyvec_ntt (r:W16.t Array768.t) : W16.t Array768.t = {
    
    var r0:W16.t Array256.t;
    var r1:W16.t Array256.t;
    var r2:W16.t Array256.t;
    r0 <- witness;
    r1 <- witness;
    r2 <- witness;
    (r0, r1, r2) <@ polyvec_topolys (r);
    r0 <@ poly_ntt (r0);
    r1 <@ poly_ntt (r1);
    r2 <@ poly_ntt (r2);
    r <@ polyvec_frompolys (r0, r1, r2);
    return (r);
  }
  
  proc indcpa_dec_jazz (msgp:W64.t, ctp:W64.t, skp:W64.t) : unit = {
    
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;
    var skpv:W16.t Array768.t;
    var mp:W16.t Array256.t;
    bp <- witness;
    mp <- witness;
    skpv <- witness;
    v <- witness;
    bp <@ polyvec_decompress (ctp);
    ctp <- (ctp + (W64.of_int (3 * 320)));
    v <@ poly_decompress (ctp);
    skpv <@ polyvec_frombytes (skp);
    bp <@ polyvec_ntt (bp);
    mp <@ polyvec_pointwise_acc (skpv, bp);
    mp <@ poly_invntt (mp);
    mp <@ poly_sub (v, mp);
    mp <@ poly_reduce (mp);
    poly_tomsg (msgp, mp);
    return ();
  }
}.

