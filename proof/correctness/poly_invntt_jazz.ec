require import List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.

require import Array128 Array256.
require import WArray256 WArray512.

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
  
  proc poly_invntt_jazz (rp:W64.t) : unit = {
    var aux: int;
    
    var i:int;
    var t:W16.t;
    var r:W16.t Array256.t;
    r <- witness;
    i <- 0;
    while (i < 256) {
      t <- (loadW16 Glob.mem (W64.to_uint (rp + (W64.of_int (2 * i)))));
      r.[i] <- t;
      i <- i + 1;
    }
    r <@ poly_invntt (r);
    i <- 0;
    while (i < 256) {
      t <- r.[i];
      Glob.mem <-
      storeW16 Glob.mem (W64.to_uint (rp + (W64.of_int (2 * i)))) t;
      i <- i + 1;
    }
    return ();
  }
}.

