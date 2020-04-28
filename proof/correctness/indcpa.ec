require import List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.

require import Array4 Array5 Array24 Array25 Array32 Array33 Array34 Array64
               Array128 Array168 Array256 Array768.
require import WArray20 WArray32 WArray33 WArray34 WArray40 WArray64
               WArray128 WArray168 WArray192 WArray200 WArray256 WArray512
               WArray1536.

abbrev roundconstants = Array24.of_list witness [W64.of_int 1;
W64.of_int 32898; W64.of_int (-9223372036854742902);
W64.of_int (-9223372034707259392); W64.of_int 32907; W64.of_int 2147483649;
W64.of_int (-9223372034707259263); W64.of_int (-9223372036854743031);
W64.of_int 138; W64.of_int 136; W64.of_int 2147516425; W64.of_int 2147483658;
W64.of_int 2147516555; W64.of_int (-9223372036854775669);
W64.of_int (-9223372036854742903); W64.of_int (-9223372036854743037);
W64.of_int (-9223372036854743038); W64.of_int (-9223372036854775680);
W64.of_int 32778; W64.of_int (-9223372034707292150);
W64.of_int (-9223372034707259263); W64.of_int (-9223372036854742912);
W64.of_int 2147483649; W64.of_int (-9223372034707259384)].


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
  
  proc poly_compress (rp:W64.t, a:W16.t Array256.t) : unit = {
    var aux: int;
    
    var i:int;
    var t:W16.t;
    var d0:W32.t;
    var d1:W32.t;
    
    a <@ poly_csubq (a);
    i <- 0;
    while (i < 128) {
      t <- a.[(2 * i)];
      d0 <- (zeroextu32 t);
      d0 <- (d0 `<<` (W8.of_int 4));
      d0 <- (d0 + (W32.of_int 1665));
      d0 <- (d0 * (W32.of_int 80635));
      d0 <- (d0 `>>` (W8.of_int 28));
      d0 <- (d0 `&` (W32.of_int 15));
      t <- a.[((2 * i) + 1)];
      d1 <- (zeroextu32 t);
      d1 <- (d1 `<<` (W8.of_int 4));
      d1 <- (d1 + (W32.of_int 1665));
      d1 <- (d1 * (W32.of_int 80635));
      d1 <- (d1 `>>` (W8.of_int 28));
      d1 <- (d1 `&` (W32.of_int 15));
      d1 <- (d1 `<<` (W8.of_int 4));
      d0 <- (d0 `|` d1);
      Glob.mem <-
      storeW8 Glob.mem (W64.to_uint (rp + (W64.of_int i))) (truncateu8 d0);
      i <- i + 1;
    }
    return ();
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
  
  proc poly_tobytes (rp:W64.t, a:W16.t Array256.t) : unit = {
    var aux: int;
    
    var i:int;
    var t0:W16.t;
    var t1:W16.t;
    var d:W16.t;
    
    a <@ poly_csubq (a);
    i <- 0;
    while (i < 128) {
      t0 <- a.[(2 * i)];
      t1 <- a.[((2 * i) + 1)];
      d <- t0;
      d <- (d `&` (W16.of_int 255));
      Glob.mem <-
      storeW8 Glob.mem (W64.to_uint (rp + (W64.of_int (3 * i)))) (truncateu8 d);
      t0 <- (t0 `>>` (W8.of_int 8));
      d <- t1;
      d <- (d `&` (W16.of_int 15));
      d <- (d `<<` (W8.of_int 4));
      d <- (d `|` t0);
      Glob.mem <-
      storeW8 Glob.mem (W64.to_uint (rp + (W64.of_int ((3 * i) + 1)))) (truncateu8 d);
      t1 <- (t1 `>>` (W8.of_int 4));
      Glob.mem <-
      storeW8 Glob.mem (W64.to_uint (rp + (W64.of_int ((3 * i) + 2)))) (truncateu8 t1);
      i <- i + 1;
    }
    return ();
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
  
  proc poly_frommsg (ap:W64.t) : W16.t Array256.t = {
    var aux: int;
    
    var rp:W16.t Array256.t;
    var i:int;
    var c:W8.t;
    var t:W16.t;
    rp <- witness;
    i <- 0;
    while (i < 32) {
      c <- (loadW8 Glob.mem (W64.to_uint (ap + (W64.of_int i))));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[(8 * i)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 1)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 2)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 3)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 4)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 5)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 6)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 7)] <- t;
      c <- (c `>>` (W8.of_int 1));
      i <- i + 1;
    }
    return (rp);
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
  
  proc poly_frommont (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;
    
    var dmont:W16.t;
    var i:int;
    var r:W16.t;
    
    dmont <- (W16.of_int 1353);
    i <- 0;
    while (i < 256) {
      r <- rp.[i];
      r <@ fqmul (r, dmont);
      rp.[i] <- r;
      i <- i + 1;
    }
    return (rp);
  }
  
  proc index (x:int, y:int) : int = {
    
    var r:int;
    
    r <- ((x %% 5) + (5 * (y %% 5)));
    return (r);
  }
  
  proc theta (a:W64.t Array25.t) : W64.t Array25.t = {
    var aux_1: bool;
    var aux_0: bool;
    var aux: int;
    var aux_2: W64.t;
    
    var x:int;
    var c:W64.t Array5.t;
    var y:int;
    var d:W64.t Array5.t;
    var  _0:bool;
    var  _1:bool;
    c <- witness;
    d <- witness;
    x <- 0;
    while (x < 5) {
      c.[x] <- (W64.of_int 0);
      y <- 0;
      while (y < 5) {
        c.[x] <- (c.[x] `^` a.[(x + (5 * y))]);
        y <- y + 1;
      }
      x <- x + 1;
    }
    x <- 0;
    while (x < 5) {
      d.[x] <- c.[((x + 1) %% 5)];
      (aux_1, aux_0, aux_2) <- ROL_64 d.[x] (W8.of_int 1);
       _0 <- aux_1;
       _1 <- aux_0;
      d.[x] <- aux_2;
      d.[x] <- (d.[x] `^` c.[((x + 4) %% 5)]);
      x <- x + 1;
    }
    x <- 0;
    while (x < 5) {
      y <- 0;
      while (y < 5) {
        a.[(x + (5 * y))] <- (a.[(x + (5 * y))] `^` d.[x]);
        y <- y + 1;
      }
      x <- x + 1;
    }
    return (a);
  }
  
  proc keccakRhoOffsets (i:int) : int = {
    var aux: int;
    
    var r:int;
    var x:int;
    var y:int;
    var t:int;
    var z:int;
    
    r <- 0;
    x <- 1;
    y <- 0;
    t <- 0;
    while (t < 24) {
      if ((i = (x + (5 * y)))) {
        r <- ((((t + 1) * (t + 2)) %/ 2) %% 64);
      } else {
        
      }
      z <- (((2 * x) + (3 * y)) %% 5);
      x <- y;
      y <- z;
      t <- t + 1;
    }
    return (r);
  }
  
  proc rho (a:W64.t Array25.t) : W64.t Array25.t = {
    var aux_1: bool;
    var aux_0: bool;
    var aux: int;
    var aux_2: W64.t;
    
    var x:int;
    var y:int;
    var i:int;
    var z:int;
    var  _0:bool;
    var  _1:bool;
    
    x <- 0;
    while (x < 5) {
      y <- 0;
      while (y < 5) {
        i <@ index (x, y);
        z <@ keccakRhoOffsets (i);
        (aux_1, aux_0, aux_2) <- ROL_64 a.[i] (W8.of_int z);
         _0 <- aux_1;
         _1 <- aux_0;
        a.[i] <- aux_2;
        y <- y + 1;
      }
      x <- x + 1;
    }
    return (a);
  }
  
  proc pi (a:W64.t Array25.t) : W64.t Array25.t = {
    var aux: int;
    
    var i:int;
    var t:W64.t;
    var b:W64.t Array25.t;
    var y:int;
    var x:int;
    b <- witness;
    i <- 0;
    while (i < 25) {
      t <- a.[i];
      b.[i] <- t;
      i <- i + 1;
    }
    x <- 0;
    while (x < 5) {
      y <- 0;
      while (y < 5) {
        t <- b.[(x + (5 * y))];
        i <@ index (y, ((2 * x) + (3 * y)));
        a.[i] <- t;
        y <- y + 1;
      }
      x <- x + 1;
    }
    return (a);
  }
  
  proc chi (a:W64.t Array25.t) : W64.t Array25.t = {
    var aux: int;
    
    var x:int;
    var y:int;
    var i:int;
    var c:W64.t Array5.t;
    c <- witness;
    y <- 0;
    while (y < 5) {
      x <- 0;
      while (x < 5) {
        i <@ index ((x + 1), y);
        c.[x] <- a.[i];
        c.[x] <- (invw c.[x]);
        i <@ index ((x + 2), y);
        c.[x] <- (c.[x] `&` a.[i]);
        i <@ index (x, y);
        c.[x] <- (c.[x] `^` a.[i]);
        x <- x + 1;
      }
      x <- 0;
      while (x < 5) {
        a.[(x + (5 * y))] <- c.[x];
        x <- x + 1;
      }
      y <- y + 1;
    }
    return (a);
  }
  
  proc iota_0 (a:W64.t Array25.t, c:W64.t) : W64.t Array25.t = {
    
    
    
    a.[0] <- (a.[0] `^` c);
    return (a);
  }
  
  proc keccakP1600_round (state:W64.t Array25.t, c:W64.t) : W64.t Array25.t = {
    
    
    
    state <@ theta (state);
    state <@ rho (state);
    state <@ pi (state);
    state <@ chi (state);
    state <@ iota_0 (state, c);
    return (state);
  }
  
  proc __keccakf1600_ref (state:W64.t Array25.t) : W64.t Array25.t = {
    var aux: int;
    
    var constptr:W64.t Array24.t;
    var round:int;
    constptr <- witness;
    constptr <- roundconstants;
    round <- 0;
    while (round < 24) {
      state <@ keccakP1600_round (state, constptr.[round]);
      round <- round + 1;
    }
    return (state);
  }
  
  proc st0 () : W64.t Array25.t = {
    var aux: int;
    
    var state:W64.t Array25.t;
    var i:int;
    state <- witness;
    i <- 0;
    while (i < 25) {
      state.[i] <- (W64.of_int 0);
      i <- i + 1;
    }
    return (state);
  }
  
  proc shake256_128_33 (in_0:W8.t Array33.t) : W8.t Array128.t = {
    var aux: int;
    
    var out:W8.t Array128.t;
    var state:W64.t Array25.t;
    var i:int;
    var c:W8.t;
    out <- witness;
    state <- witness;
    state <@ st0 ();
    i <- 0;
    while (i < 33) {
      c <- in_0.[i];
      state <-
      Array25.init
      (WArray200.get64 (WArray200.set8 (WArray200.init64 (fun i => state.[i])) i (
      (get8 (WArray200.init64 (fun i => state.[i])) i) `^` c)));
      i <- i + 1;
    }
    state <-
    Array25.init
    (WArray200.get64 (WArray200.set8 (WArray200.init64 (fun i => state.[i])) 33 (
    (get8 (WArray200.init64 (fun i => state.[i])) 33) `^` (W8.of_int 31))));
    state <-
    Array25.init
    (WArray200.get64 (WArray200.set8 (WArray200.init64 (fun i => state.[i])) (136 - 1) (
    (get8 (WArray200.init64 (fun i => state.[i])) (136 - 1)) `^` (W8.of_int 128))));
    state <@ __keccakf1600_ref (state);
    i <- 0;
    while (i < 128) {
      c <- (get8 (WArray200.init64 (fun i => state.[i])) i);
      out.[i] <- c;
      i <- i + 1;
    }
    return (out);
  }
  
  proc sha3512_32 (in_0:W8.t Array32.t) : W8.t Array64.t = {
    var aux: int;
    
    var out:W8.t Array64.t;
    var state:W64.t Array25.t;
    var i:int;
    var c:W8.t;
    out <- witness;
    state <- witness;
    state <@ st0 ();
    i <- 0;
    while (i < 32) {
      c <- in_0.[i];
      state <-
      Array25.init
      (WArray200.get64 (WArray200.set8 (WArray200.init64 (fun i => state.[i])) i (
      (get8 (WArray200.init64 (fun i => state.[i])) i) `^` c)));
      i <- i + 1;
    }
    state <-
    Array25.init
    (WArray200.get64 (WArray200.set8 (WArray200.init64 (fun i => state.[i])) 32 (
    (get8 (WArray200.init64 (fun i => state.[i])) 32) `^` (W8.of_int 6))));
    state <-
    Array25.init
    (WArray200.get64 (WArray200.set8 (WArray200.init64 (fun i => state.[i])) (72 - 1) (
    (get8 (WArray200.init64 (fun i => state.[i])) (72 - 1)) `^` (W8.of_int 128))));
    state <@ __keccakf1600_ref (state);
    i <- 0;
    while (i < 64) {
      c <- (get8 (WArray200.init64 (fun i => state.[i])) i);
      out.[i] <- c;
      i <- i + 1;
    }
    return (out);
  }
  
  proc shake128_absorb34 (in_0:W8.t Array34.t) : W64.t Array25.t = {
    var aux: int;
    
    var state:W64.t Array25.t;
    var i:int;
    var c:W8.t;
    state <- witness;
    state <@ st0 ();
    i <- 0;
    while (i < 34) {
      c <- in_0.[i];
      state <-
      Array25.init
      (WArray200.get64 (WArray200.set8 (WArray200.init64 (fun i => state.[i])) i (
      (get8 (WArray200.init64 (fun i => state.[i])) i) `^` c)));
      i <- i + 1;
    }
    state <-
    Array25.init
    (WArray200.get64 (WArray200.set8 (WArray200.init64 (fun i => state.[i])) 34 (
    (get8 (WArray200.init64 (fun i => state.[i])) 34) `^` (W8.of_int 31))));
    state <-
    Array25.init
    (WArray200.get64 (WArray200.set8 (WArray200.init64 (fun i => state.[i])) (168 - 1) (
    (get8 (WArray200.init64 (fun i => state.[i])) (168 - 1)) `^` (W8.of_int 128))));
    return (state);
  }
  
  proc shake128_squeezeblock (state:W64.t Array25.t) : W64.t Array25.t *
                                                       W8.t Array168.t = {
    var aux: int;
    
    var out:W8.t Array168.t;
    var i:int;
    var c:W8.t;
    out <- witness;
    state <@ __keccakf1600_ref (state);
    i <- 0;
    while (i < 168) {
      c <- (get8 (WArray200.init64 (fun i => state.[i])) i);
      out.[i] <- c;
      i <- i + 1;
    }
    return (state, out);
  }
  
  proc poly_getnoise (seed:W8.t Array32.t, nonce:W8.t) : W16.t Array256.t = {
    var aux: int;
    
    var rp:W16.t Array256.t;
    var i:int;
    var c:W8.t;
    var extseed:W8.t Array33.t;
    var buf:W8.t Array128.t;
    var a:W8.t;
    var b:W8.t;
    var t:W16.t;
    buf <- witness;
    extseed <- witness;
    rp <- witness;
    i <- 0;
    while (i < 32) {
      c <- seed.[i];
      extseed.[i] <- c;
      i <- i + 1;
    }
    extseed.[32] <- nonce;
    buf <@ shake256_128_33 (extseed);
    i <- 0;
    while (i < 128) {
      c <- buf.[i];
      a <- c;
      a <- (a `&` (W8.of_int 85));
      c <- (c `>>` (W8.of_int 1));
      c <- (c `&` (W8.of_int 85));
      c <- (c + a);
      a <- c;
      a <- (a `&` (W8.of_int 3));
      b <- c;
      b <- (b `>>` (W8.of_int 2));
      b <- (b `&` (W8.of_int 3));
      a <- (a - b);
      t <- (sigextu16 a);
      rp.[(2 * i)] <- t;
      a <- c;
      a <- (a `>>` (W8.of_int 4));
      a <- (a `&` (W8.of_int 3));
      b <- (c `>>` (W8.of_int 6));
      b <- (b `&` (W8.of_int 3));
      a <- (a - b);
      t <- (sigextu16 a);
      rp.[((2 * i) + 1)] <- t;
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
  
  proc polyvec_tobytes (rp:W64.t, a:W16.t Array768.t) : unit = {
    
    var a0:W16.t Array256.t;
    var a1:W16.t Array256.t;
    var a2:W16.t Array256.t;
    var pp:W64.t;
    a0 <- witness;
    a1 <- witness;
    a2 <- witness;
    (a0, a1, a2) <@ polyvec_topolys (a);
    pp <- rp;
    poly_tobytes (pp, a0);
    pp <- (pp + (W64.of_int 384));
    poly_tobytes (pp, a1);
    pp <- (pp + (W64.of_int 384));
    poly_tobytes (pp, a2);
    return ();
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
  
  proc polyvec_csubq (r:W16.t Array768.t) : W16.t Array768.t = {
    
    var r0:W16.t Array256.t;
    var r1:W16.t Array256.t;
    var r2:W16.t Array256.t;
    r0 <- witness;
    r1 <- witness;
    r2 <- witness;
    (r0, r1, r2) <@ polyvec_topolys (r);
    r0 <@ poly_csubq (r0);
    r1 <@ poly_csubq (r1);
    r2 <@ poly_csubq (r2);
    r <@ polyvec_frompolys (r0, r1, r2);
    return (r);
  }
  
  proc polyvec_compress (rp:W64.t, a:W16.t Array768.t) : unit = {
    var aux: int;
    
    var i:W64.t;
    var j:W64.t;
    var aa:W16.t Array768.t;
    var k:int;
    var t:W64.t Array4.t;
    var c:W16.t;
    var b:W16.t;
    aa <- witness;
    t <- witness;
    i <- (W64.of_int 0);
    j <- (W64.of_int 0);
    aa <@ polyvec_csubq (a);
    
    while ((i \ult (W64.of_int 768))) {
      k <- 0;
      while (k < 4) {
        t.[k] <- (zeroextu64 aa.[(W64.to_uint i)]);
        i <- (i + (W64.of_int 1));
        t.[k] <- (t.[k] `<<` (W8.of_int 10));
        t.[k] <- (t.[k] + (W64.of_int 1665));
        t.[k] <- (t.[k] * (W64.of_int 1290167));
        t.[k] <- (t.[k] `>>` (W8.of_int 32));
        t.[k] <- (t.[k] `&` (W64.of_int 1023));
        k <- k + 1;
      }
      c <- (truncateu16 t.[0]);
      c <- (c `&` (W16.of_int 255));
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 c);
      j <- (j + (W64.of_int 1));
      b <- (truncateu16 t.[0]);
      b <- (b `>>` (W8.of_int 8));
      c <- (truncateu16 t.[1]);
      c <- (c `<<` (W8.of_int 2));
      c <- (c `|` b);
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 c);
      j <- (j + (W64.of_int 1));
      b <- (truncateu16 t.[1]);
      b <- (b `>>` (W8.of_int 6));
      c <- (truncateu16 t.[2]);
      c <- (c `<<` (W8.of_int 4));
      c <- (c `|` b);
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 c);
      j <- (j + (W64.of_int 1));
      b <- (truncateu16 t.[2]);
      b <- (b `>>` (W8.of_int 4));
      c <- (truncateu16 t.[3]);
      c <- (c `<<` (W8.of_int 6));
      c <- (c `|` b);
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 c);
      j <- (j + (W64.of_int 1));
      t.[3] <- (t.[3] `>>` (W8.of_int 2));
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 t.[3]);
      j <- (j + (W64.of_int 1));
    }
    return ();
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
  
  proc polyvec_add (a:W16.t Array768.t, b:W16.t Array768.t) : W16.t Array768.t = {
    
    var r:W16.t Array768.t;
    var a0:W16.t Array256.t;
    var a1:W16.t Array256.t;
    var a2:W16.t Array256.t;
    var b0:W16.t Array256.t;
    var b1:W16.t Array256.t;
    var b2:W16.t Array256.t;
    var r0:W16.t Array256.t;
    var r1:W16.t Array256.t;
    var r2:W16.t Array256.t;
    a0 <- witness;
    a1 <- witness;
    a2 <- witness;
    b0 <- witness;
    b1 <- witness;
    b2 <- witness;
    r <- witness;
    r0 <- witness;
    r1 <- witness;
    r2 <- witness;
    (a0, a1, a2) <@ polyvec_topolys (a);
    (b0, b1, b2) <@ polyvec_topolys (b);
    r0 <@ poly_add (a0, b0);
    r1 <@ poly_add (a1, b1);
    r2 <@ poly_add (a2, b2);
    r <@ polyvec_frompolys (r0, r1, r2);
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
  
  proc polyvec_invntt (r:W16.t Array768.t) : W16.t Array768.t = {
    
    var r0:W16.t Array256.t;
    var r1:W16.t Array256.t;
    var r2:W16.t Array256.t;
    r0 <- witness;
    r1 <- witness;
    r2 <- witness;
    (r0, r1, r2) <@ polyvec_topolys (r);
    r0 <@ poly_invntt (r0);
    r1 <@ poly_invntt (r1);
    r2 <@ poly_invntt (r2);
    r <@ polyvec_frompolys (r0, r1, r2);
    return (r);
  }
  
  proc polyvec_reduce (r:W16.t Array768.t) : W16.t Array768.t = {
    
    var r0:W16.t Array256.t;
    var r1:W16.t Array256.t;
    var r2:W16.t Array256.t;
    r0 <- witness;
    r1 <- witness;
    r2 <- witness;
    (r0, r1, r2) <@ polyvec_topolys (r);
    r0 <@ poly_reduce (r0);
    r1 <@ poly_reduce (r1);
    r2 <@ poly_reduce (r2);
    r <@ polyvec_frompolys (r0, r1, r2);
    return (r);
  }
  
  proc rej_uniform (rp:W16.t Array256.t, offset:W64.t, buf:W8.t Array168.t) : 
  W64.t * W16.t Array256.t = {
    
    var ctr:W64.t;
    var pos:W64.t;
    var exit:W64.t;
    var val:W16.t;
    var t:W16.t;
    var cnd0:W64.t;
    var cnd1:W64.t;
    
    ctr <- offset;
    pos <- (W64.of_int 0);
    exit <- (W64.of_int 0);
    
    while ((exit = (W64.of_int 0))) {
      val <- (zeroextu16 buf.[(W64.to_uint pos)]);
      pos <- (pos + (W64.of_int 1));
      t <- (zeroextu16 buf.[(W64.to_uint pos)]);
      t <- (t `<<` (W8.of_int 8));
      val <- (val `|` t);
      pos <- (pos + (W64.of_int 1));
      if ((val \ult (W16.of_int 63251))) {
        t <- val;
        t <- (t `>>` (W8.of_int 12));
        t <- (t * (W16.of_int 3329));
        val <- (val - t);
        rp.[(W64.to_uint ctr)] <- val;
        ctr <- (ctr + (W64.of_int 1));
      } else {
        
      }
      cnd0 <- (W64.of_int 256);
      cnd0 <- (cnd0 - ctr);
      cnd0 <- (cnd0 - (W64.of_int 1));
      cnd1 <- (W64.of_int 168);
      cnd1 <- (cnd1 - pos);
      cnd1 <- (cnd1 - (W64.of_int 2));
      exit <- (cnd0 `|` cnd1);
      exit <- (exit `>>` (W8.of_int 63));
    }
    return (ctr, rp);
  }
  
  proc gen_matrix (seed:W8.t Array32.t, transposed:W64.t) : W16.t Array768.t *
                                                            W16.t Array768.t *
                                                            W16.t Array768.t = {
    var aux: int;
    
    var r0:W16.t Array768.t;
    var r1:W16.t Array768.t;
    var r2:W16.t Array768.t;
    var j:int;
    var c:W8.t;
    var extseed:W8.t Array34.t;
    var state:W64.t Array25.t;
    var ctr:W64.t;
    var buf:W8.t Array168.t;
    var poly:W16.t Array256.t;
    var k:W64.t;
    var l:W64.t;
    var t:W16.t;
    buf <- witness;
    extseed <- witness;
    poly <- witness;
    r0 <- witness;
    r1 <- witness;
    r2 <- witness;
    state <- witness;
    j <- 0;
    while (j < 32) {
      c <- seed.[j];
      extseed.[j] <- c;
      j <- j + 1;
    }
    j <- 0;
    while (j < 3) {
      if ((transposed = (W64.of_int 0))) {
        extseed.[32] <- (W8.of_int j);
        extseed.[(32 + 1)] <- (W8.of_int 0);
      } else {
        extseed.[32] <- (W8.of_int 0);
        extseed.[(32 + 1)] <- (W8.of_int j);
      }
      state <@ shake128_absorb34 (extseed);
      ctr <- (W64.of_int 0);
      
      while ((ctr \ult (W64.of_int 256))) {
        (state, buf) <@ shake128_squeezeblock (state);
        (ctr, poly) <@ rej_uniform (poly, ctr, buf);
      }
      k <- (W64.of_int 0);
      l <- (W64.of_int (j * 256));
      
      while ((k \ult (W64.of_int 256))) {
        t <- poly.[(W64.to_uint k)];
        r0.[(W64.to_uint l)] <- t;
        k <- (k + (W64.of_int 1));
        l <- (l + (W64.of_int 1));
      }
      j <- j + 1;
    }
    j <- 0;
    while (j < 3) {
      if ((transposed = (W64.of_int 0))) {
        extseed.[32] <- (W8.of_int j);
        extseed.[(32 + 1)] <- (W8.of_int 1);
      } else {
        extseed.[32] <- (W8.of_int 1);
        extseed.[(32 + 1)] <- (W8.of_int j);
      }
      state <@ shake128_absorb34 (extseed);
      ctr <- (W64.of_int 0);
      
      while ((ctr \ult (W64.of_int 256))) {
        (state, buf) <@ shake128_squeezeblock (state);
        (ctr, poly) <@ rej_uniform (poly, ctr, buf);
      }
      k <- (W64.of_int 0);
      l <- (W64.of_int (j * 256));
      
      while ((k \ult (W64.of_int 256))) {
        t <- poly.[(W64.to_uint k)];
        r1.[(W64.to_uint l)] <- t;
        k <- (k + (W64.of_int 1));
        l <- (l + (W64.of_int 1));
      }
      j <- j + 1;
    }
    j <- 0;
    while (j < 3) {
      if ((transposed = (W64.of_int 0))) {
        extseed.[32] <- (W8.of_int j);
        extseed.[(32 + 1)] <- (W8.of_int 2);
      } else {
        extseed.[32] <- (W8.of_int 2);
        extseed.[(32 + 1)] <- (W8.of_int j);
      }
      state <@ shake128_absorb34 (extseed);
      ctr <- (W64.of_int 0);
      
      while ((ctr \ult (W64.of_int 256))) {
        (state, buf) <@ shake128_squeezeblock (state);
        (ctr, poly) <@ rej_uniform (poly, ctr, buf);
      }
      k <- (W64.of_int 0);
      l <- (W64.of_int (j * 256));
      
      while ((k \ult (W64.of_int 256))) {
        t <- poly.[(W64.to_uint k)];
        r2.[(W64.to_uint l)] <- t;
        k <- (k + (W64.of_int 1));
        l <- (l + (W64.of_int 1));
      }
      j <- j + 1;
    }
    return (r0, r1, r2);
  }
  
  proc indcpa_keypair_jazz (pkp:W64.t, skp:W64.t, randomnessp:W64.t) : unit = {
    
    var i:W64.t;
    var c:W8.t;
    var inbuf:W8.t Array32.t;
    var buf:W8.t Array64.t;
    var j:W64.t;
    var publicseed:W8.t Array32.t;
    var noiseseed:W8.t Array32.t;
    var zero:W64.t;
    var a0:W16.t Array768.t;
    var a1:W16.t Array768.t;
    var a2:W16.t Array768.t;
    var nonce:W8.t;
    var poly0:W16.t Array256.t;
    var poly1:W16.t Array256.t;
    var poly2:W16.t Array256.t;
    var skpv:W16.t Array768.t;
    var e:W16.t Array768.t;
    var pkpv:W16.t Array768.t;
    a0 <- witness;
    a1 <- witness;
    a2 <- witness;
    buf <- witness;
    e <- witness;
    inbuf <- witness;
    noiseseed <- witness;
    pkpv <- witness;
    poly0 <- witness;
    poly1 <- witness;
    poly2 <- witness;
    publicseed <- witness;
    skpv <- witness;
    i <- (W64.of_int 0);
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (randomnessp + i)));
      inbuf.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
    }
    buf <@ sha3512_32 (inbuf);
    i <- (W64.of_int 0);
    j <- (W64.of_int 32);
    
    while ((i \ult (W64.of_int 32))) {
      c <- buf.[(W64.to_uint i)];
      publicseed.[(W64.to_uint i)] <- c;
      c <- buf.[(W64.to_uint j)];
      noiseseed.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
      j <- (j + (W64.of_int 1));
    }
    zero <- (W64.of_int 0);
    (a0, a1, a2) <@ gen_matrix (publicseed, zero);
    nonce <- (W8.of_int 0);
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly2 <@ poly_getnoise (noiseseed, nonce);
    skpv <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (nonce + (W8.of_int 1));
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly2 <@ poly_getnoise (noiseseed, nonce);
    e <@ polyvec_frompolys (poly0, poly1, poly2);
    skpv <@ polyvec_ntt (skpv);
    e <@ polyvec_ntt (e);
    poly0 <@ polyvec_pointwise_acc (a0, skpv);
    poly0 <@ poly_frommont (poly0);
    poly1 <@ polyvec_pointwise_acc (a1, skpv);
    poly1 <@ poly_frommont (poly1);
    poly2 <@ polyvec_pointwise_acc (a2, skpv);
    poly2 <@ poly_frommont (poly2);
    pkpv <@ polyvec_frompolys (poly0, poly1, poly2);
    pkpv <@ polyvec_add (pkpv, e);
    pkpv <@ polyvec_reduce (pkpv);
    polyvec_tobytes (skp, skpv);
    polyvec_tobytes (pkp, pkpv);
    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (3 * 384)));
    
    while ((i \ult (W64.of_int 32))) {
      c <- publicseed.[(W64.to_uint i)];
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))) c;
      pkp <- (pkp + (W64.of_int 1));
      i <- (i + (W64.of_int 1));
    }
    return ();
  }
  
  proc indcpa_enc_jazz (ctp:W64.t, msgp:W64.t, pkp:W64.t, coinsp:W64.t) : unit = {
    
    var i:W64.t;
    var c:W8.t;
    var noiseseed:W8.t Array32.t;
    var pkpv:W16.t Array768.t;
    var publicseed:W8.t Array32.t;
    var k:W16.t Array256.t;
    var one:W64.t;
    var at0:W16.t Array768.t;
    var at1:W16.t Array768.t;
    var at2:W16.t Array768.t;
    var nonce:W8.t;
    var poly0:W16.t Array256.t;
    var poly1:W16.t Array256.t;
    var poly2:W16.t Array256.t;
    var sp_0:W16.t Array768.t;
    var ep:W16.t Array768.t;
    var epp:W16.t Array256.t;
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;
    at0 <- witness;
    at1 <- witness;
    at2 <- witness;
    bp <- witness;
    ep <- witness;
    epp <- witness;
    k <- witness;
    noiseseed <- witness;
    pkpv <- witness;
    poly0 <- witness;
    poly1 <- witness;
    poly2 <- witness;
    publicseed <- witness;
    sp_0 <- witness;
    v <- witness;
    i <- (W64.of_int 0);
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (coinsp + i)));
      noiseseed.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
    }
    pkpv <@ polyvec_frombytes (pkp);
    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (3 * 384)));
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))));
      publicseed.[(W64.to_uint i)] <- c;
      pkp <- (pkp + (W64.of_int 1));
      i <- (i + (W64.of_int 1));
    }
    k <@ poly_frommsg (msgp);
    one <- (W64.of_int 1);
    (at0, at1, at2) <@ gen_matrix (publicseed, one);
    nonce <- (W8.of_int 0);
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 1);
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 2);
    poly2 <@ poly_getnoise (noiseseed, nonce);
    sp_0 <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (W8.of_int 3);
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 4);
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 5);
    poly2 <@ poly_getnoise (noiseseed, nonce);
    ep <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (W8.of_int 6);
    epp <@ poly_getnoise (noiseseed, nonce);
    sp_0 <@ polyvec_ntt (sp_0);
    poly0 <@ polyvec_pointwise_acc (at0, sp_0);
    poly1 <@ polyvec_pointwise_acc (at1, sp_0);
    poly2 <@ polyvec_pointwise_acc (at2, sp_0);
    bp <@ polyvec_frompolys (poly0, poly1, poly2);
    v <@ polyvec_pointwise_acc (pkpv, sp_0);
    bp <@ polyvec_invntt (bp);
    v <@ poly_invntt (v);
    bp <@ polyvec_add (bp, ep);
    v <@ poly_add (v, epp);
    v <@ poly_add (v, k);
    bp <@ polyvec_reduce (bp);
    v <@ poly_reduce (v);
    polyvec_compress (ctp, bp);
    ctp <- (ctp + (W64.of_int (3 * 320)));
    poly_compress (ctp, v);
    return ();
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

