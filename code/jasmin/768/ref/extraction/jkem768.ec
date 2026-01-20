require import AllCore IntDiv CoreMap List Distr.

from Jasmin require import JModel_x86.

import SLH64.

require import
Array4 Array5 Array8 Array24 Array25 Array32 Array33 Array34 Array64 Array128
Array136 Array148 Array168 Array256 Array300 Array384 Array768 Array960
Array1088 Array1152 Array1184 Array2304 Array2400 WArray20 WArray32 WArray33
WArray34 WArray40 WArray64 WArray128 WArray168 WArray192 WArray200 WArray256
WArray384 WArray512 WArray960 WArray1088 WArray1152 WArray1184 WArray1536
WArray2400 WArray4608.

abbrev  jzetas_inv =
((Array128.of_list witness)
[(W16.of_int 1701); (W16.of_int 1807); (W16.of_int 1460); (W16.of_int 2371);
(W16.of_int 2338); (W16.of_int 2333); (W16.of_int 308); (W16.of_int 108);
(W16.of_int 2851); (W16.of_int 870); (W16.of_int 854); (W16.of_int 1510);
(W16.of_int 2535); (W16.of_int 1278); (W16.of_int 1530); (W16.of_int 1185);
(W16.of_int 1659); (W16.of_int 1187); (W16.of_int 3109); (W16.of_int 874);
(W16.of_int 1335); (W16.of_int 2111); (W16.of_int 136); (W16.of_int 1215);
(W16.of_int 2945); (W16.of_int 1465); (W16.of_int 1285); (W16.of_int 2007);
(W16.of_int 2719); (W16.of_int 2726); (W16.of_int 2232); (W16.of_int 2512);
(W16.of_int 75); (W16.of_int 156); (W16.of_int 3000); (W16.of_int 2911);
(W16.of_int 2980); (W16.of_int 872); (W16.of_int 2685); (W16.of_int 1590);
(W16.of_int 2210); (W16.of_int 602); (W16.of_int 1846); (W16.of_int 777);
(W16.of_int 147); (W16.of_int 2170); (W16.of_int 2551); (W16.of_int 246);
(W16.of_int 1676); (W16.of_int 1755); (W16.of_int 460); (W16.of_int 291);
(W16.of_int 235); (W16.of_int 3152); (W16.of_int 2742); (W16.of_int 2907);
(W16.of_int 3224); (W16.of_int 1779); (W16.of_int 2458); (W16.of_int 1251);
(W16.of_int 2486); (W16.of_int 2774); (W16.of_int 2899); (W16.of_int 1103);
(W16.of_int 1275); (W16.of_int 2652); (W16.of_int 1065); (W16.of_int 2881);
(W16.of_int 725); (W16.of_int 1508); (W16.of_int 2368); (W16.of_int 398);
(W16.of_int 951); (W16.of_int 247); (W16.of_int 1421); (W16.of_int 3222);
(W16.of_int 2499); (W16.of_int 271); (W16.of_int 90); (W16.of_int 853);
(W16.of_int 1860); (W16.of_int 3203); (W16.of_int 1162); (W16.of_int 1618);
(W16.of_int 666); (W16.of_int 320); (W16.of_int 8); (W16.of_int 2813);
(W16.of_int 1544); (W16.of_int 282); (W16.of_int 1838); (W16.of_int 1293);
(W16.of_int 2314); (W16.of_int 552); (W16.of_int 2677); (W16.of_int 2106);
(W16.of_int 1571); (W16.of_int 205); (W16.of_int 2918); (W16.of_int 1542);
(W16.of_int 2721); (W16.of_int 2597); (W16.of_int 2312); (W16.of_int 681);
(W16.of_int 130); (W16.of_int 1602); (W16.of_int 1871); (W16.of_int 829);
(W16.of_int 2946); (W16.of_int 3065); (W16.of_int 1325); (W16.of_int 2756);
(W16.of_int 1861); (W16.of_int 1474); (W16.of_int 1202); (W16.of_int 2367);
(W16.of_int 3147); (W16.of_int 1752); (W16.of_int 2707); (W16.of_int 171);
(W16.of_int 3127); (W16.of_int 3042); (W16.of_int 1907); (W16.of_int 1836);
(W16.of_int 1517); (W16.of_int 359); (W16.of_int 758); (W16.of_int 1441)]).

abbrev  jzetas =
((Array128.of_list witness)
[(W16.of_int 2285); (W16.of_int 2571); (W16.of_int 2970); (W16.of_int 1812);
(W16.of_int 1493); (W16.of_int 1422); (W16.of_int 287); (W16.of_int 202);
(W16.of_int 3158); (W16.of_int 622); (W16.of_int 1577); (W16.of_int 182);
(W16.of_int 962); (W16.of_int 2127); (W16.of_int 1855); (W16.of_int 1468);
(W16.of_int 573); (W16.of_int 2004); (W16.of_int 264); (W16.of_int 383);
(W16.of_int 2500); (W16.of_int 1458); (W16.of_int 1727); (W16.of_int 3199);
(W16.of_int 2648); (W16.of_int 1017); (W16.of_int 732); (W16.of_int 608);
(W16.of_int 1787); (W16.of_int 411); (W16.of_int 3124); (W16.of_int 1758);
(W16.of_int 1223); (W16.of_int 652); (W16.of_int 2777); (W16.of_int 1015);
(W16.of_int 2036); (W16.of_int 1491); (W16.of_int 3047); (W16.of_int 1785);
(W16.of_int 516); (W16.of_int 3321); (W16.of_int 3009); (W16.of_int 2663);
(W16.of_int 1711); (W16.of_int 2167); (W16.of_int 126); (W16.of_int 1469);
(W16.of_int 2476); (W16.of_int 3239); (W16.of_int 3058); (W16.of_int 830);
(W16.of_int 107); (W16.of_int 1908); (W16.of_int 3082); (W16.of_int 2378);
(W16.of_int 2931); (W16.of_int 961); (W16.of_int 1821); (W16.of_int 2604);
(W16.of_int 448); (W16.of_int 2264); (W16.of_int 677); (W16.of_int 2054);
(W16.of_int 2226); (W16.of_int 430); (W16.of_int 555); (W16.of_int 843);
(W16.of_int 2078); (W16.of_int 871); (W16.of_int 1550); (W16.of_int 105);
(W16.of_int 422); (W16.of_int 587); (W16.of_int 177); (W16.of_int 3094);
(W16.of_int 3038); (W16.of_int 2869); (W16.of_int 1574); (W16.of_int 1653);
(W16.of_int 3083); (W16.of_int 778); (W16.of_int 1159); (W16.of_int 3182);
(W16.of_int 2552); (W16.of_int 1483); (W16.of_int 2727); (W16.of_int 1119);
(W16.of_int 1739); (W16.of_int 644); (W16.of_int 2457); (W16.of_int 349);
(W16.of_int 418); (W16.of_int 329); (W16.of_int 3173); (W16.of_int 3254);
(W16.of_int 817); (W16.of_int 1097); (W16.of_int 603); (W16.of_int 610);
(W16.of_int 1322); (W16.of_int 2044); (W16.of_int 1864); (W16.of_int 384);
(W16.of_int 2114); (W16.of_int 3193); (W16.of_int 1218); (W16.of_int 1994);
(W16.of_int 2455); (W16.of_int 220); (W16.of_int 2142); (W16.of_int 1670);
(W16.of_int 2144); (W16.of_int 1799); (W16.of_int 2051); (W16.of_int 794);
(W16.of_int 1819); (W16.of_int 2475); (W16.of_int 2459); (W16.of_int 478);
(W16.of_int 3221); (W16.of_int 3021); (W16.of_int 996); (W16.of_int 991);
(W16.of_int 958); (W16.of_int 1869); (W16.of_int 1522); (W16.of_int 1628)]).

abbrev  kECCAK1600_RC =
((Array24.of_list witness)
[(W64.of_int 1); (W64.of_int 32898); (W64.of_int (-9223372036854742902));
(W64.of_int (-9223372034707259392)); (W64.of_int 32907);
(W64.of_int 2147483649); (W64.of_int (-9223372034707259263));
(W64.of_int (-9223372036854743031)); (W64.of_int 138); (W64.of_int 136);
(W64.of_int 2147516425); (W64.of_int 2147483658); (W64.of_int 2147516555);
(W64.of_int (-9223372036854775669)); (W64.of_int (-9223372036854742903));
(W64.of_int (-9223372036854743037)); (W64.of_int (-9223372036854743038));
(W64.of_int (-9223372036854775680)); (W64.of_int 32778);
(W64.of_int (-9223372034707292150)); (W64.of_int (-9223372034707259263));
(W64.of_int (-9223372036854742912)); (W64.of_int 2147483649);
(W64.of_int (-9223372034707259384))]).

module M = {
  proc __fqmul (a:W16.t, b:W16.t) : W16.t = {
    var r:W16.t;
    var ad:W32.t;
    var bd:W32.t;
    var c:W32.t;
    var u:W32.t;
    var t:W32.t;
    ad <- (sigextu32 a);
    bd <- (sigextu32 b);
    c <- (ad * bd);
    u <- (c * (W32.of_int (62209 `<<` 16)));
    u <- (u `|>>` (W8.of_int 16));
    t <- (u * (W32.of_int (- 3329)));
    t <- (t + c);
    t <- (t `|>>` (W8.of_int 16));
    r <- (truncateu16 t);
    return r;
  }
  proc __barrett_reduce (a:W16.t) : W16.t = {
    var r:W16.t;
    var t:W32.t;
    t <- (sigextu32 a);
    t <- (t * (W32.of_int 20159));
    t <- (t `|>>` (W8.of_int 26));
    t <- (t * (W32.of_int 3329));
    r <- a;
    r <- (r - (truncateu16 t));
    return r;
  }
  proc __ANDN_64 (a:W64.t, b:W64.t) : W64.t = {
    var t:W64.t;
    t <- ((invw a) `&` b);
    return t;
  }
  proc __SHLQ (x:W64.t, shbytes:int) : W64.t = {
    
    if ((shbytes <> 0)) {
      x <- (x `<<` (W8.of_int (8 * shbytes)));
    } else {
      
    }
    return x;
  }
  proc keccakf1600_index (x:int, y:int) : int = {
    var r:int;
    r <- ((x %% 5) + (5 * (y %% 5)));
    return r;
  }
  proc keccakf1600_rho_offsets (i:int) : int = {
    var r:int;
    var x:int;
    var y:int;
    var t:int;
    var z:int;
    r <- 0;
    x <- 1;
    y <- 0;
    t <- 0;
    while ((t < 24)) {
      if ((i = (x + (5 * y)))) {
        r <- ((((t + 1) * (t + 2)) %/ 2) %% 64);
      } else {
        
      }
      z <- (((2 * x) + (3 * y)) %% 5);
      x <- y;
      y <- z;
      t <- (t + 1);
    }
    return r;
  }
  proc keccakf1600_rhotates (x:int, y:int) : int = {
    var r:int;
    var i:int;
    i <@ keccakf1600_index (x, y);
    r <@ keccakf1600_rho_offsets (i);
    return r;
  }
  proc __rol_u64_ref (x:W64.t, i:int) : W64.t = {
    var  _0:bool;
    var  _1:bool;
    if ((i <> 0)) {
      ( _0,  _1, x) <- (ROL_64 x (W8.of_int i));
    } else {
      
    }
    return x;
  }
  proc __theta_sum_ref (a:W64.t Array25.t) : W64.t Array5.t = {
    var c:W64.t Array5.t;
    var x:int;
    var y:int;
    c <- witness;
    x <- 0;
    while ((x < 5)) {
      c.[x] <- a.[(x + 0)];
      x <- (x + 1);
    }
    y <- 1;
    while ((y < 5)) {
      x <- 0;
      while ((x < 5)) {
        c.[x] <- (c.[x] `^` a.[(x + (y * 5))]);
        x <- (x + 1);
      }
      y <- (y + 1);
    }
    return c;
  }
  proc __theta_rol_ref (c:W64.t Array5.t) : W64.t Array5.t = {
    var aux:W64.t;
    var d:W64.t Array5.t;
    var x:int;
    d <- witness;
    x <- 0;
    while ((x < 5)) {
      d.[x] <- c.[((x + 1) %% 5)];
      aux <@ __rol_u64_ref (d.[x], 1);
      d.[x] <- aux;
      d.[x] <- (d.[x] `^` c.[(((x - 1) + 5) %% 5)]);
      x <- (x + 1);
    }
    return d;
  }
  proc __rol_sum_ref (a:W64.t Array25.t, d:W64.t Array5.t, y:int) : W64.t Array5.t = {
    var aux:W64.t;
    var b:W64.t Array5.t;
    var x:int;
    var x_:int;
    var y_:int;
    var r:int;
    b <- witness;
    x <- 0;
    while ((x < 5)) {
      x_ <- ((x + (3 * y)) %% 5);
      y_ <- x;
      r <@ keccakf1600_rhotates (x_, y_);
      b.[x] <- a.[(x_ + (y_ * 5))];
      b.[x] <- (b.[x] `^` d.[x_]);
      aux <@ __rol_u64_ref (b.[x], r);
      b.[x] <- aux;
      x <- (x + 1);
    }
    return b;
  }
  proc __set_row_ref (e:W64.t Array25.t, b:W64.t Array5.t, y:int) : W64.t Array25.t = {
    var x:int;
    var x1:int;
    var x2:int;
    var t:W64.t;
    x <- 0;
    while ((x < 5)) {
      x1 <- ((x + 1) %% 5);
      x2 <- ((x + 2) %% 5);
      t <@ __ANDN_64 (b.[x1], b.[x2]);
      t <- (t `^` b.[x]);
      e.[(x + (y * 5))] <- t;
      x <- (x + 1);
    }
    return e;
  }
  proc _pround_ref (e:W64.t Array25.t, a:W64.t Array25.t) : W64.t Array25.t = {
    var c:W64.t Array5.t;
    var d:W64.t Array5.t;
    var y:int;
    var b:W64.t Array5.t;
    b <- witness;
    c <- witness;
    d <- witness;
    c <@ __theta_sum_ref (a);
    d <@ __theta_rol_ref (c);
    y <- 0;
    while ((y < 5)) {
      b <@ __rol_sum_ref (a, d, y);
      e <@ __set_row_ref (e, b, y);
      y <- (y + 1);
    }
    return e;
  }
  proc __keccakf1600_ref (a:W64.t Array25.t) : W64.t Array25.t = {
    var s_e:W64.t Array25.t;
    var e:W64.t Array25.t;
    var rC:W64.t Array24.t;
    var rc:W64.t;
    var c:int;
    rC <- witness;
    e <- witness;
    s_e <- witness;
    e <- s_e;
    c <- 0;
    (* Erased call to spill *)
    e <@ _pround_ref (e, a);
    (a, e) <- (swap_ e a);
    rC <- kECCAK1600_RC;
    rc <- rC.[c];
    e.[0] <- (e.[0] `^` rc);
    a <@ _pround_ref (a, e);
    (a, e) <- (swap_ e a);
    rC <- kECCAK1600_RC;
    rc <- rC.[(c + 1)];
    a.[0] <- (a.[0] `^` rc);
    (* Erased call to unspill *)
    c <- (c + 2);
    while ((c < (24 - 1))) {
      (* Erased call to spill *)
      e <@ _pround_ref (e, a);
      (a, e) <- (swap_ e a);
      rC <- kECCAK1600_RC;
      rc <- rC.[c];
      e.[0] <- (e.[0] `^` rc);
      a <@ _pround_ref (a, e);
      (a, e) <- (swap_ e a);
      rC <- kECCAK1600_RC;
      rc <- rC.[(c + 1)];
      a.[0] <- (a.[0] `^` rc);
      (* Erased call to unspill *)
      c <- (c + 2);
    }
    return a;
  }
  proc _keccakf1600_ref (a:W64.t Array25.t) : W64.t Array25.t = {
    
    a <@ __keccakf1600_ref (a);
    return a;
  }
  proc __state_init_ref (st:W64.t Array25.t) : W64.t Array25.t = {
    var z64:W64.t;
    var i:int;
    z64 <- (W64.of_int 0);
    i <- 0;
    while ((i < 25)) {
      st.[i] <- z64;
      i <- (i + 1);
    }
    return st;
  }
  proc __addratebit_ref (st:W64.t Array25.t, _RATE8:int) : W64.t Array25.t = {
    var t64:W64.t;
    t64 <- (W64.of_int 1);
    t64 <- (t64 `<<` (W8.of_int (((8 * _RATE8) - 1) %% 64)));
    t64 <- (t64 `^` st.[((_RATE8 - 1) %/ 8)]);
    st.[((_RATE8 - 1) %/ 8)] <- t64;
    return st;
  }
  proc a32____a_ilen_read_upto8_at (buf:W8.t Array32.t, offset:int,
                                    dELTA:int, lEN:int, tRAIL:int, cUR:int,
                                    aT:int) : int * int * int * int * W64.t = {
    var w:W64.t;
    var aT8:int;
    var t16:W64.t;
    var t8:W64.t;
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray32.init8 (fun i => buf.[i]))
        (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA))));
        w <@ __SHLQ (w, aT8);
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray32.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          w <@ __SHLQ (w, aT8);
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray32.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          t16 <@ __SHLQ (t16, aT8);
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            t8 <-
            (zeroextu64
            (get8_direct (WArray32.init8 (fun i => buf.[i]))
            (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            t8 <@ __SHLQ (t8, aT8);
            w <- (w `|` t8);
            aT8 <- (aT8 + 1);
            if (((aT8 < 8) /\ ((tRAIL %% 256) <> 0))) {
              aT8 <- (aT8 + 1);
              tRAIL <- 0;
            } else {
              
            }
          } else {
            if (((tRAIL %% 256) <> 0)) {
              t8 <- (W64.of_int (tRAIL %% 256));
              t8 <@ __SHLQ (t8, aT8);
              w <- (w `|` t8);
              tRAIL <- 0;
              aT8 <- (aT8 + 1);
            } else {
              
            }
          }
        } else {
          
        }
      }
      aT <- (cUR + aT8);
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a32____a_ilen_write_upto8 (buf:W8.t Array32.t, offset:int, dELTA:int,
                                  lEN:int, w:W64.t) : W8.t Array32.t * int *
                                                      int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (Array32.init
        (WArray32.get8
        (WArray32.set64_direct (WArray32.init8 (fun i => buf.[i]))
        (offset + dELTA) w)));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (Array32.init
          (WArray32.get8
          (WArray32.set32_direct (WArray32.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu32 w))));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (Array32.init
          (WArray32.get8
          (WArray32.set16_direct (WArray32.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu16 w))));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (Array32.init
          (WArray32.get8
          (WArray32.set8_direct (WArray32.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu8 w))));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc a32____addstate_ref (st:W64.t Array25.t, aT:int, buf:W8.t Array32.t,
                            offset:int, _LEN:int, _TRAILB:int) : W64.t Array25.t *
                                                                 int * int = {
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var at:int;
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      (dELTA, _LEN, _TRAILB, aT8, w) <@ a32____a_ilen_read_upto8_at (
      buf, offset, dELTA, _LEN, _TRAILB, aT, aT8);
      st.[(aT %/ 8)] <- (st.[(aT %/ 8)] `^` w);
      aT <- aT8;
    } else {
      
    }
    offset <- (offset + dELTA);
    at <- (aT %/ 8);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      w <- (get64_direct (WArray32.init8 (fun i => buf.[i])) offset);
      offset <- (offset + 8);
      st.[at] <- (st.[at] `^` w);
      at <- (at + 1);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      (dELTA, _LEN, _TRAILB, aT, w) <@ a32____a_ilen_read_upto8_at (buf,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st.[at] <- (st.[at] `^` w);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (st, aT, offset);
  }
  proc a32____absorb_ref (st:W64.t Array25.t, aT:int, buf:W8.t Array32.t,
                          _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 32;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a32____addstate_ref (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a32____addstate_ref (st, 0, buf, offset, 
        _RATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a32____addstate_ref (st, aT, buf, offset, _LEN,
    _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit_ref (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a32____dumpstate_ref (buf:W8.t Array32.t, offset:int, _LEN:int,
                             st:W64.t Array25.t) : W8.t Array32.t * int = {
    var t:W64.t;
    var dELTA:int;
    var i:int;
    var  _0:int;
    i <- 0;
    while ((i < (_LEN %/ 8))) {
      t <- st.[i];
      buf <-
      (Array32.init
      (WArray32.get8
      (WArray32.set64_direct (WArray32.init8 (fun i_0 => buf.[i_0])) 
      offset t)));
      offset <- (offset + 8);
      i <- (i + 1);
    }
    if ((0 < (_LEN %% 8))) {
      t <- st.[i];
      (buf, dELTA,  _0) <@ a32____a_ilen_write_upto8 (buf, offset, 0,
      (_LEN %% 8), t);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (buf, offset);
  }
  proc a32____squeeze_ref (st:W64.t Array25.t, buf:W8.t Array32.t, _RATE8:int) : 
  W64.t Array25.t * W8.t Array32.t = {
    var offset:int;
    var i:int;
    offset <- 0;
    i <- 0;
    while ((i < (32 %/ _RATE8))) {
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      (buf, offset) <@ a32____dumpstate_ref (buf, offset, _RATE8, st);
      (* Erased call to unspill *)
      i <- (i + 1);
    }
    if ((0 < (32 %% _RATE8))) {
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      (buf, offset) <@ a32____dumpstate_ref (buf, offset, (32 %% _RATE8),
      st);
    } else {
      
    }
    return (st, buf);
  }
  proc a33____a_ilen_read_upto8_at (buf:W8.t Array33.t, offset:int,
                                    dELTA:int, lEN:int, tRAIL:int, cUR:int,
                                    aT:int) : int * int * int * int * W64.t = {
    var w:W64.t;
    var aT8:int;
    var t16:W64.t;
    var t8:W64.t;
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray33.init8 (fun i => buf.[i]))
        (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA))));
        w <@ __SHLQ (w, aT8);
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray33.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          w <@ __SHLQ (w, aT8);
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray33.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          t16 <@ __SHLQ (t16, aT8);
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            t8 <-
            (zeroextu64
            (get8_direct (WArray33.init8 (fun i => buf.[i]))
            (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            t8 <@ __SHLQ (t8, aT8);
            w <- (w `|` t8);
            aT8 <- (aT8 + 1);
            if (((aT8 < 8) /\ ((tRAIL %% 256) <> 0))) {
              aT8 <- (aT8 + 1);
              tRAIL <- 0;
            } else {
              
            }
          } else {
            if (((tRAIL %% 256) <> 0)) {
              t8 <- (W64.of_int (tRAIL %% 256));
              t8 <@ __SHLQ (t8, aT8);
              w <- (w `|` t8);
              tRAIL <- 0;
              aT8 <- (aT8 + 1);
            } else {
              
            }
          }
        } else {
          
        }
      }
      aT <- (cUR + aT8);
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a33____addstate_ref (st:W64.t Array25.t, aT:int, buf:W8.t Array33.t,
                            offset:int, _LEN:int, _TRAILB:int) : W64.t Array25.t *
                                                                 int * int = {
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var at:int;
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      (dELTA, _LEN, _TRAILB, aT8, w) <@ a33____a_ilen_read_upto8_at (
      buf, offset, dELTA, _LEN, _TRAILB, aT, aT8);
      st.[(aT %/ 8)] <- (st.[(aT %/ 8)] `^` w);
      aT <- aT8;
    } else {
      
    }
    offset <- (offset + dELTA);
    at <- (aT %/ 8);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      w <- (get64_direct (WArray33.init8 (fun i => buf.[i])) offset);
      offset <- (offset + 8);
      st.[at] <- (st.[at] `^` w);
      at <- (at + 1);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      (dELTA, _LEN, _TRAILB, aT, w) <@ a33____a_ilen_read_upto8_at (buf,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st.[at] <- (st.[at] `^` w);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (st, aT, offset);
  }
  proc a33____absorb_ref (st:W64.t Array25.t, aT:int, buf:W8.t Array33.t,
                          _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 33;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a33____addstate_ref (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a33____addstate_ref (st, 0, buf, offset, 
        _RATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a33____addstate_ref (st, aT, buf, offset, _LEN,
    _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit_ref (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a34____a_ilen_read_upto8_at (buf:W8.t Array34.t, offset:int,
                                    dELTA:int, lEN:int, tRAIL:int, cUR:int,
                                    aT:int) : int * int * int * int * W64.t = {
    var w:W64.t;
    var aT8:int;
    var t16:W64.t;
    var t8:W64.t;
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray34.init8 (fun i => buf.[i]))
        (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA))));
        w <@ __SHLQ (w, aT8);
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray34.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          w <@ __SHLQ (w, aT8);
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray34.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          t16 <@ __SHLQ (t16, aT8);
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            t8 <-
            (zeroextu64
            (get8_direct (WArray34.init8 (fun i => buf.[i]))
            (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            t8 <@ __SHLQ (t8, aT8);
            w <- (w `|` t8);
            aT8 <- (aT8 + 1);
            if (((aT8 < 8) /\ ((tRAIL %% 256) <> 0))) {
              aT8 <- (aT8 + 1);
              tRAIL <- 0;
            } else {
              
            }
          } else {
            if (((tRAIL %% 256) <> 0)) {
              t8 <- (W64.of_int (tRAIL %% 256));
              t8 <@ __SHLQ (t8, aT8);
              w <- (w `|` t8);
              tRAIL <- 0;
              aT8 <- (aT8 + 1);
            } else {
              
            }
          }
        } else {
          
        }
      }
      aT <- (cUR + aT8);
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a34____addstate_ref (st:W64.t Array25.t, aT:int, buf:W8.t Array34.t,
                            offset:int, _LEN:int, _TRAILB:int) : W64.t Array25.t *
                                                                 int * int = {
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var at:int;
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      (dELTA, _LEN, _TRAILB, aT8, w) <@ a34____a_ilen_read_upto8_at (
      buf, offset, dELTA, _LEN, _TRAILB, aT, aT8);
      st.[(aT %/ 8)] <- (st.[(aT %/ 8)] `^` w);
      aT <- aT8;
    } else {
      
    }
    offset <- (offset + dELTA);
    at <- (aT %/ 8);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      w <- (get64_direct (WArray34.init8 (fun i => buf.[i])) offset);
      offset <- (offset + 8);
      st.[at] <- (st.[at] `^` w);
      at <- (at + 1);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      (dELTA, _LEN, _TRAILB, aT, w) <@ a34____a_ilen_read_upto8_at (buf,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st.[at] <- (st.[at] `^` w);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (st, aT, offset);
  }
  proc a34____absorb_ref (st:W64.t Array25.t, aT:int, buf:W8.t Array34.t,
                          _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 34;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a34____addstate_ref (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a34____addstate_ref (st, 0, buf, offset, 
        _RATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a34____addstate_ref (st, aT, buf, offset, _LEN,
    _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit_ref (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a64____a_ilen_read_upto8_at (buf:W8.t Array64.t, offset:int,
                                    dELTA:int, lEN:int, tRAIL:int, cUR:int,
                                    aT:int) : int * int * int * int * W64.t = {
    var w:W64.t;
    var aT8:int;
    var t16:W64.t;
    var t8:W64.t;
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray64.init8 (fun i => buf.[i]))
        (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA))));
        w <@ __SHLQ (w, aT8);
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray64.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          w <@ __SHLQ (w, aT8);
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray64.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          t16 <@ __SHLQ (t16, aT8);
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            t8 <-
            (zeroextu64
            (get8_direct (WArray64.init8 (fun i => buf.[i]))
            (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            t8 <@ __SHLQ (t8, aT8);
            w <- (w `|` t8);
            aT8 <- (aT8 + 1);
            if (((aT8 < 8) /\ ((tRAIL %% 256) <> 0))) {
              aT8 <- (aT8 + 1);
              tRAIL <- 0;
            } else {
              
            }
          } else {
            if (((tRAIL %% 256) <> 0)) {
              t8 <- (W64.of_int (tRAIL %% 256));
              t8 <@ __SHLQ (t8, aT8);
              w <- (w `|` t8);
              tRAIL <- 0;
              aT8 <- (aT8 + 1);
            } else {
              
            }
          }
        } else {
          
        }
      }
      aT <- (cUR + aT8);
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a64____a_ilen_write_upto8 (buf:W8.t Array64.t, offset:int, dELTA:int,
                                  lEN:int, w:W64.t) : W8.t Array64.t * int *
                                                      int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (Array64.init
        (WArray64.get8
        (WArray64.set64_direct (WArray64.init8 (fun i => buf.[i]))
        (offset + dELTA) w)));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (Array64.init
          (WArray64.get8
          (WArray64.set32_direct (WArray64.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu32 w))));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (Array64.init
          (WArray64.get8
          (WArray64.set16_direct (WArray64.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu16 w))));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (Array64.init
          (WArray64.get8
          (WArray64.set8_direct (WArray64.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu8 w))));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc a64____addstate_ref (st:W64.t Array25.t, aT:int, buf:W8.t Array64.t,
                            offset:int, _LEN:int, _TRAILB:int) : W64.t Array25.t *
                                                                 int * int = {
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var at:int;
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      (dELTA, _LEN, _TRAILB, aT8, w) <@ a64____a_ilen_read_upto8_at (
      buf, offset, dELTA, _LEN, _TRAILB, aT, aT8);
      st.[(aT %/ 8)] <- (st.[(aT %/ 8)] `^` w);
      aT <- aT8;
    } else {
      
    }
    offset <- (offset + dELTA);
    at <- (aT %/ 8);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      w <- (get64_direct (WArray64.init8 (fun i => buf.[i])) offset);
      offset <- (offset + 8);
      st.[at] <- (st.[at] `^` w);
      at <- (at + 1);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      (dELTA, _LEN, _TRAILB, aT, w) <@ a64____a_ilen_read_upto8_at (buf,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st.[at] <- (st.[at] `^` w);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (st, aT, offset);
  }
  proc a64____absorb_ref (st:W64.t Array25.t, aT:int, buf:W8.t Array64.t,
                          _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 64;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a64____addstate_ref (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a64____addstate_ref (st, 0, buf, offset, 
        _RATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a64____addstate_ref (st, aT, buf, offset, _LEN,
    _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit_ref (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a64____dumpstate_ref (buf:W8.t Array64.t, offset:int, _LEN:int,
                             st:W64.t Array25.t) : W8.t Array64.t * int = {
    var t:W64.t;
    var dELTA:int;
    var i:int;
    var  _0:int;
    i <- 0;
    while ((i < (_LEN %/ 8))) {
      t <- st.[i];
      buf <-
      (Array64.init
      (WArray64.get8
      (WArray64.set64_direct (WArray64.init8 (fun i_0 => buf.[i_0])) 
      offset t)));
      offset <- (offset + 8);
      i <- (i + 1);
    }
    if ((0 < (_LEN %% 8))) {
      t <- st.[i];
      (buf, dELTA,  _0) <@ a64____a_ilen_write_upto8 (buf, offset, 0,
      (_LEN %% 8), t);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (buf, offset);
  }
  proc a64____squeeze_ref (st:W64.t Array25.t, buf:W8.t Array64.t, _RATE8:int) : 
  W64.t Array25.t * W8.t Array64.t = {
    var offset:int;
    var i:int;
    offset <- 0;
    i <- 0;
    while ((i < (64 %/ _RATE8))) {
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      (buf, offset) <@ a64____dumpstate_ref (buf, offset, _RATE8, st);
      (* Erased call to unspill *)
      i <- (i + 1);
    }
    if ((0 < (64 %% _RATE8))) {
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      (buf, offset) <@ a64____dumpstate_ref (buf, offset, (64 %% _RATE8),
      st);
    } else {
      
    }
    return (st, buf);
  }
  proc a128____a_ilen_write_upto8 (buf:W8.t Array128.t, offset:int,
                                   dELTA:int, lEN:int, w:W64.t) : W8.t Array128.t *
                                                                  int * int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (Array128.init
        (WArray128.get8
        (WArray128.set64_direct (WArray128.init8 (fun i => buf.[i]))
        (offset + dELTA) w)));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (Array128.init
          (WArray128.get8
          (WArray128.set32_direct (WArray128.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu32 w))));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (Array128.init
          (WArray128.get8
          (WArray128.set16_direct (WArray128.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu16 w))));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (Array128.init
          (WArray128.get8
          (WArray128.set8_direct (WArray128.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu8 w))));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc a128____dumpstate_ref (buf:W8.t Array128.t, offset:int, _LEN:int,
                              st:W64.t Array25.t) : W8.t Array128.t * int = {
    var t:W64.t;
    var dELTA:int;
    var i:int;
    var  _0:int;
    i <- 0;
    while ((i < (_LEN %/ 8))) {
      t <- st.[i];
      buf <-
      (Array128.init
      (WArray128.get8
      (WArray128.set64_direct (WArray128.init8 (fun i_0 => buf.[i_0])) 
      offset t)));
      offset <- (offset + 8);
      i <- (i + 1);
    }
    if ((0 < (_LEN %% 8))) {
      t <- st.[i];
      (buf, dELTA,  _0) <@ a128____a_ilen_write_upto8 (buf, offset, 0,
      (_LEN %% 8), t);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (buf, offset);
  }
  proc a128____squeeze_ref (st:W64.t Array25.t, buf:W8.t Array128.t,
                            _RATE8:int) : W64.t Array25.t * W8.t Array128.t = {
    var offset:int;
    var i:int;
    offset <- 0;
    i <- 0;
    while ((i < (128 %/ _RATE8))) {
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      (buf, offset) <@ a128____dumpstate_ref (buf, offset, _RATE8, st);
      (* Erased call to unspill *)
      i <- (i + 1);
    }
    if ((0 < (128 %% _RATE8))) {
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      (buf, offset) <@ a128____dumpstate_ref (buf, offset, (128 %% _RATE8),
      st);
    } else {
      
    }
    return (st, buf);
  }
  proc a168____a_ilen_write_upto8 (buf:W8.t Array168.t, offset:int,
                                   dELTA:int, lEN:int, w:W64.t) : W8.t Array168.t *
                                                                  int * int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (Array168.init
        (WArray168.get8
        (WArray168.set64_direct (WArray168.init8 (fun i => buf.[i]))
        (offset + dELTA) w)));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (Array168.init
          (WArray168.get8
          (WArray168.set32_direct (WArray168.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu32 w))));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (Array168.init
          (WArray168.get8
          (WArray168.set16_direct (WArray168.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu16 w))));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (Array168.init
          (WArray168.get8
          (WArray168.set8_direct (WArray168.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu8 w))));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc a168____dumpstate_ref (buf:W8.t Array168.t, offset:int, _LEN:int,
                              st:W64.t Array25.t) : W8.t Array168.t * int = {
    var t:W64.t;
    var dELTA:int;
    var i:int;
    var  _0:int;
    i <- 0;
    while ((i < (_LEN %/ 8))) {
      t <- st.[i];
      buf <-
      (Array168.init
      (WArray168.get8
      (WArray168.set64_direct (WArray168.init8 (fun i_0 => buf.[i_0])) 
      offset t)));
      offset <- (offset + 8);
      i <- (i + 1);
    }
    if ((0 < (_LEN %% 8))) {
      t <- st.[i];
      (buf, dELTA,  _0) <@ a168____a_ilen_write_upto8 (buf, offset, 0,
      (_LEN %% 8), t);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (buf, offset);
  }
  proc a1088____a_ilen_read_upto8_at (buf:W8.t Array1088.t, offset:int,
                                      dELTA:int, lEN:int, tRAIL:int, cUR:int,
                                      aT:int) : int * int * int * int * W64.t = {
    var w:W64.t;
    var aT8:int;
    var t16:W64.t;
    var t8:W64.t;
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray1088.init8 (fun i => buf.[i]))
        (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA))));
        w <@ __SHLQ (w, aT8);
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray1088.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          w <@ __SHLQ (w, aT8);
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray1088.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          t16 <@ __SHLQ (t16, aT8);
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            t8 <-
            (zeroextu64
            (get8_direct (WArray1088.init8 (fun i => buf.[i]))
            (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            t8 <@ __SHLQ (t8, aT8);
            w <- (w `|` t8);
            aT8 <- (aT8 + 1);
            if (((aT8 < 8) /\ ((tRAIL %% 256) <> 0))) {
              aT8 <- (aT8 + 1);
              tRAIL <- 0;
            } else {
              
            }
          } else {
            if (((tRAIL %% 256) <> 0)) {
              t8 <- (W64.of_int (tRAIL %% 256));
              t8 <@ __SHLQ (t8, aT8);
              w <- (w `|` t8);
              tRAIL <- 0;
              aT8 <- (aT8 + 1);
            } else {
              
            }
          }
        } else {
          
        }
      }
      aT <- (cUR + aT8);
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a1088____addstate_ref (st:W64.t Array25.t, aT:int,
                              buf:W8.t Array1088.t, offset:int, _LEN:int,
                              _TRAILB:int) : W64.t Array25.t * int * int = {
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var at:int;
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      (dELTA, _LEN, _TRAILB, aT8, w) <@ a1088____a_ilen_read_upto8_at (
      buf, offset, dELTA, _LEN, _TRAILB, aT, aT8);
      st.[(aT %/ 8)] <- (st.[(aT %/ 8)] `^` w);
      aT <- aT8;
    } else {
      
    }
    offset <- (offset + dELTA);
    at <- (aT %/ 8);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      w <- (get64_direct (WArray1088.init8 (fun i => buf.[i])) offset);
      offset <- (offset + 8);
      st.[at] <- (st.[at] `^` w);
      at <- (at + 1);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      (dELTA, _LEN, _TRAILB, aT, w) <@ a1088____a_ilen_read_upto8_at (
      buf, offset, 0, _LEN, _TRAILB, aT, aT);
      st.[at] <- (st.[at] `^` w);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (st, aT, offset);
  }
  proc a1088____absorb_ref (st:W64.t Array25.t, aT:int, buf:W8.t Array1088.t,
                            _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 1088;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a1088____addstate_ref (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a1088____addstate_ref (st, 0, buf, offset,
        _RATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a1088____addstate_ref (st, aT, buf, offset, _LEN,
    _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit_ref (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a1184____a_ilen_read_upto8_at (buf:W8.t Array1184.t, offset:int,
                                      dELTA:int, lEN:int, tRAIL:int, cUR:int,
                                      aT:int) : int * int * int * int * W64.t = {
    var w:W64.t;
    var aT8:int;
    var t16:W64.t;
    var t8:W64.t;
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray1184.init8 (fun i => buf.[i]))
        (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA))));
        w <@ __SHLQ (w, aT8);
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray1184.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          w <@ __SHLQ (w, aT8);
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray1184.init8 (fun i => buf.[i]))
          (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          t16 <@ __SHLQ (t16, aT8);
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            t8 <-
            (zeroextu64
            (get8_direct (WArray1184.init8 (fun i => buf.[i]))
            (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            t8 <@ __SHLQ (t8, aT8);
            w <- (w `|` t8);
            aT8 <- (aT8 + 1);
            if (((aT8 < 8) /\ ((tRAIL %% 256) <> 0))) {
              aT8 <- (aT8 + 1);
              tRAIL <- 0;
            } else {
              
            }
          } else {
            if (((tRAIL %% 256) <> 0)) {
              t8 <- (W64.of_int (tRAIL %% 256));
              t8 <@ __SHLQ (t8, aT8);
              w <- (w `|` t8);
              tRAIL <- 0;
              aT8 <- (aT8 + 1);
            } else {
              
            }
          }
        } else {
          
        }
      }
      aT <- (cUR + aT8);
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a1184____addstate_ref (st:W64.t Array25.t, aT:int,
                              buf:W8.t Array1184.t, offset:int, _LEN:int,
                              _TRAILB:int) : W64.t Array25.t * int * int = {
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var at:int;
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      (dELTA, _LEN, _TRAILB, aT8, w) <@ a1184____a_ilen_read_upto8_at (
      buf, offset, dELTA, _LEN, _TRAILB, aT, aT8);
      st.[(aT %/ 8)] <- (st.[(aT %/ 8)] `^` w);
      aT <- aT8;
    } else {
      
    }
    offset <- (offset + dELTA);
    at <- (aT %/ 8);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      w <- (get64_direct (WArray1184.init8 (fun i => buf.[i])) offset);
      offset <- (offset + 8);
      st.[at] <- (st.[at] `^` w);
      at <- (at + 1);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      (dELTA, _LEN, _TRAILB, aT, w) <@ a1184____a_ilen_read_upto8_at (
      buf, offset, 0, _LEN, _TRAILB, aT, aT);
      st.[at] <- (st.[at] `^` w);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (st, aT, offset);
  }
  proc a1184____absorb_ref (st:W64.t Array25.t, aT:int, buf:W8.t Array1184.t,
                            _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 1184;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a1184____addstate_ref (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600_ref (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a1184____addstate_ref (st, 0, buf, offset,
        _RATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a1184____addstate_ref (st, aT, buf, offset, _LEN,
    _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit_ref (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc _shake256_128_33 (out:W8.t Array128.t, in_0:W8.t Array33.t) : 
  W8.t Array128.t = {
    var st_s:W64.t Array25.t;
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:W64.t Array25.t;
     _1 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ __state_init_ref (st);
    (* Erased call to spill *)
    (st,  _0) <@ a33____absorb_ref (st, 0, in_0, 31, 136);
    (* Erased call to unspill *)
    ( _1, out) <@ a128____squeeze_ref (st, out, 136);
    return out;
  }
  proc _shake256_A32__A1120 (out:W8.t Array32.t, in0:W8.t Array32.t,
                             in1:W8.t Array1088.t) : W8.t Array32.t = {
    var st_s:W64.t Array25.t;
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:int;
    var  _2:W64.t Array25.t;
     _2 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ __state_init_ref (st);
    (* Erased call to spill *)
    (st,  _0) <@ a32____absorb_ref (st, 0, in0, 0, 136);
    (* Erased call to unspill *)
    (st,  _1) <@ a1088____absorb_ref (st, 32, in1, 31, 136);
    (* Erased call to unspill *)
    ( _2, out) <@ a32____squeeze_ref (st, out, 136);
    return out;
  }
  proc _sha3_512A_A33 (out:W8.t Array64.t, in_0:W8.t Array33.t) : W8.t Array64.t = {
    var st_s:W64.t Array25.t;
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:W64.t Array25.t;
     _1 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ __state_init_ref (st);
    (* Erased call to spill *)
    (st,  _0) <@ a33____absorb_ref (st, 0, in_0, 6, 72);
    (* Erased call to unspill *)
    ( _1, out) <@ a64____squeeze_ref (st, out, 72);
    return out;
  }
  proc _shake128_absorb34 (st:W64.t Array25.t, in_0:W8.t Array34.t) : 
  W64.t Array25.t = {
    var  _0:int;
    st <@ __state_init_ref (st);
    (st,  _0) <@ a34____absorb_ref (st, 0, in_0, 31, 168);
    return st;
  }
  proc _shake128_squeezeblock (st:W64.t Array25.t, out:W8.t Array168.t) : 
  W64.t Array25.t * W8.t Array168.t = {
    var  _0:int;
    (* Erased call to spill *)
    st <@ _keccakf1600_ref (st);
    (* Erased call to unspill *)
    (out,  _0) <@ a168____dumpstate_ref (out, 0, 168, st);
    return (st, out);
  }
  proc _sha3_256A_A1184 (out:W8.t Array32.t, in_0:W8.t Array1184.t) : 
  W8.t Array32.t = {
    var st_s:W64.t Array25.t;
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:W64.t Array25.t;
     _1 <- witness;
    st <- witness;
    st_s <- witness;
    (* Erased call to spill *)
    st <- st_s;
    st <@ __state_init_ref (st);
    (st,  _0) <@ a1184____absorb_ref (st, 0, in_0, 6, 136);
    (* Erased call to unspill *)
    ( _1, out) <@ a32____squeeze_ref (st, out, 136);
    return out;
  }
  proc _sha3_512A_A64 (out:W8.t Array64.t, in_0:W8.t Array64.t) : W8.t Array64.t = {
    var st_s:W64.t Array25.t;
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:W64.t Array25.t;
     _1 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ __state_init_ref (st);
    (* Erased call to spill *)
    (st,  _0) <@ a64____absorb_ref (st, 0, in_0, 6, 72);
    (* Erased call to unspill *)
    ( _1, out) <@ a64____squeeze_ref (st, out, 72);
    return out;
  }
  proc _poly_add2 (rp:W16.t Array256.t, bp:W16.t Array256.t) : W16.t Array256.t = {
    var a:W16.t;
    var b:W16.t;
    var r:W16.t;
    var i:int;
    i <- 0;
    while ((i < 256)) {
      a <- rp.[i];
      b <- bp.[i];
      r <- (a + b);
      rp.[i] <- r;
      i <- (i + 1);
    }
    return rp;
  }
  proc _poly_csubq (rp:W16.t Array256.t) : W16.t Array256.t = {
    var t:W16.t;
    var b:W16.t;
    var i:int;
    i <- 0;
    while ((i < 256)) {
      t <- rp.[i];
      t <- (t - (W16.of_int 3329));
      b <- t;
      b <- (b `|>>` (W8.of_int 15));
      b <- (b `&` (W16.of_int 3329));
      t <- (t + b);
      rp.[i] <- t;
      i <- (i + 1);
    }
    return rp;
  }
  proc _poly_basemul (rp:W16.t Array256.t, ap:W16.t Array256.t,
                      bp:W16.t Array256.t) : W16.t Array256.t = {
    var srp:W16.t Array256.t;
    var zetasp:W16.t Array64.t;
    var zeta_0:W16.t;
    var a0:W16.t;
    var b0:W16.t;
    var a1:W16.t;
    var b1:W16.t;
    var r0:W16.t;
    var t:W16.t;
    var r1:W16.t;
    var i:int;
    var zetasctr:int;
    srp <- witness;
    zetasp <- witness;
    srp <- rp;
    i <- 0;
    while ((i < (256 - 3))) {
      zetasp <- (Array64.init (fun i_0 => jzetas.[(64 + i_0)]));
      zetasctr <- i;
      zetasctr <- (zetasctr `|>>` 2);
      zeta_0 <- zetasp.[zetasctr];
      a0 <- ap.[i];
      b0 <- bp.[i];
      i <- (i + 1);
      a1 <- ap.[i];
      b1 <- bp.[i];
      i <- (i - 1);
      r0 <@ __fqmul (a1, b1);
      r0 <@ __fqmul (r0, zeta_0);
      t <@ __fqmul (a0, b0);
      r0 <- (r0 + t);
      r1 <@ __fqmul (a0, b1);
      t <@ __fqmul (a1, b0);
      r1 <- (r1 + t);
      rp <- srp;
      rp.[i] <- r0;
      i <- (i + 1);
      rp.[i] <- r1;
      srp <- rp;
      zeta_0 <- (- zeta_0);
      i <- (i + 1);
      a0 <- ap.[i];
      b0 <- bp.[i];
      i <- (i + 1);
      a1 <- ap.[i];
      b1 <- bp.[i];
      i <- (i - 1);
      r0 <@ __fqmul (a1, b1);
      r0 <@ __fqmul (r0, zeta_0);
      t <@ __fqmul (a0, b0);
      r0 <- (r0 + t);
      r1 <@ __fqmul (a0, b1);
      t <@ __fqmul (a1, b0);
      r1 <- (r1 + t);
      rp <- srp;
      rp.[i] <- r0;
      i <- (i + 1);
      rp.[i] <- r1;
      srp <- rp;
      i <- (i + 1);
    }
    return rp;
  }
  proc __poly_reduce (rp:W16.t Array256.t) : W16.t Array256.t = {
    var t:W16.t;
    var j:int;
    j <- 0;
    while ((j < 256)) {
      t <- rp.[j];
      t <@ __barrett_reduce (t);
      rp.[j] <- t;
      j <- (j + 1);
    }
    return rp;
  }
  proc _poly_frombytes (rp:W16.t Array256.t, ap:W8.t Array384.t) : W16.t Array256.t = {
    var inc:int;
    var i:int;
    var c0:W8.t;
    var c1:W8.t;
    var c2:W8.t;
    var d0:W16.t;
    var t:W16.t;
    var d1:W16.t;
    inc <- (256 %/ 2);
    i <- 0;
    while ((i < inc)) {
      c0 <- ap.[(3 * i)];
      c1 <- ap.[((3 * i) + 1)];
      c2 <- ap.[((3 * i) + 2)];
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
      i <- (i + 1);
    }
    return rp;
  }
  proc _poly_frommont (rp:W16.t Array256.t) : W16.t Array256.t = {
    var dmont:W16.t;
    var r:W16.t;
    var i:int;
    dmont <- (W16.of_int 1353);
    i <- 0;
    while ((i < 256)) {
      r <- rp.[i];
      r <@ __fqmul (r, dmont);
      rp.[i] <- r;
      i <- (i + 1);
    }
    return rp;
  }
  proc _i_poly_frommsg (rp:W16.t Array256.t, ap:W8.t Array32.t) : W16.t Array256.t = {
    var i:int;
    var c:W8.t;
    var t:W16.t;
    i <- 0;
    while ((i < 32)) {
      c <- ap.[i];
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
      i <- (i + 1);
    }
    return rp;
  }
  proc _poly_getnoise (rp:W16.t Array256.t, s_seed:W8.t Array32.t, nonce:W8.t) : 
  W16.t Array256.t = {
    var seed:W8.t Array32.t;
    var k:int;
    var c:W8.t;
    var extseed:W8.t Array33.t;
    var buf:W8.t Array128.t;
    var a:W8.t;
    var b:W8.t;
    var t:W16.t;
    var i:int;
    buf <- witness;
    extseed <- witness;
    seed <- witness;
    (* Erased call to spill *)
    seed <- s_seed;
    k <- 0;
    while ((k < 32)) {
      c <- seed.[k];
      extseed.[k] <- c;
      k <- (k + 1);
    }
    extseed.[32] <- nonce;
    buf <@ _shake256_128_33 (buf, extseed);
    (* Erased call to unspill *)
    i <- 0;
    while ((i < ((2 * 256) %/ 4))) {
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
      i <- (i + 1);
    }
    return rp;
  }
  proc _poly_invntt (rp:W16.t Array256.t) : W16.t Array256.t = {
    var zetasp:W16.t Array128.t;
    var zetasctr:W64.t;
    var zeta_0:W16.t;
    var t:W16.t;
    var s:W16.t;
    var m:W16.t;
    var len:int;
    var start:int;
    var j:int;
    var cmp:int;
    var offset:int;
    zetasp <- witness;
    zetasp <- jzetas_inv;
    zetasctr <- (W64.of_int 0);
    len <- 2;
    while ((len <= 128)) {
      start <- 0;
      while ((start < 256)) {
        zeta_0 <- zetasp.[(W64.to_uint zetasctr)];
        zetasctr <- (zetasctr + (W64.of_int 1));
        j <- start;
        cmp <- start;
        cmp <- (cmp + len);
        while ((j < cmp)) {
          t <- rp.[j];
          offset <- j;
          offset <- (offset + len);
          s <- rp.[offset];
          m <- s;
          m <- (m + t);
          m <@ __barrett_reduce (m);
          rp.[j] <- m;
          t <- (t - s);
          t <@ __fqmul (t, zeta_0);
          rp.[offset] <- t;
          j <- (j + 1);
        }
        start <- j;
        start <- (start + len);
      }
      len <- (len `<<` 1);
    }
    zeta_0 <- zetasp.[127];
    j <- 0;
    while ((j < 256)) {
      t <- rp.[j];
      t <@ __fqmul (t, zeta_0);
      rp.[j] <- t;
      j <- (j + 1);
    }
    return rp;
  }
  proc _poly_ntt (rp:W16.t Array256.t) : W16.t Array256.t = {
    var zetasp:W16.t Array128.t;
    var zeta_0:W16.t;
    var s:W16.t;
    var m:W16.t;
    var t:W16.t;
    var zetasctr:int;
    var len:int;
    var start:int;
    var j:int;
    var cmp:int;
    var offset:int;
    zetasp <- witness;
    zetasp <- jzetas;
    zetasctr <- 0;
    len <- 128;
    while ((2 <= len)) {
      start <- 0;
      while ((start < 256)) {
        zetasctr <- (zetasctr + 1);
        zeta_0 <- zetasp.[zetasctr];
        j <- start;
        cmp <- start;
        cmp <- (cmp + len);
        while ((j < cmp)) {
          s <- rp.[j];
          m <- s;
          offset <- j;
          offset <- (offset + len);
          t <- rp.[offset];
          t <@ __fqmul (t, zeta_0);
          m <- (m - t);
          t <- (t + s);
          rp.[offset] <- m;
          rp.[j] <- t;
          j <- (j + 1);
        }
        start <- j;
        start <- (start + len);
      }
      len <- (len `|>>` 1);
    }
    rp <@ __poly_reduce (rp);
    return rp;
  }
  proc _poly_sub (rp:W16.t Array256.t, ap:W16.t Array256.t,
                  bp:W16.t Array256.t) : W16.t Array256.t = {
    var a:W16.t;
    var b:W16.t;
    var r:W16.t;
    var i:int;
    i <- 0;
    while ((i < 256)) {
      a <- ap.[i];
      b <- bp.[i];
      r <- (a - b);
      rp.[i] <- r;
      i <- (i + 1);
    }
    return rp;
  }
  proc _poly_tobytes (rp:W8.t Array384.t, a:W16.t Array256.t) : W8.t Array384.t *
                                                                W16.t Array256.t = {
    var t0:W16.t;
    var t1:W16.t;
    var d:W16.t;
    var j:int;
    var i:int;
    a <@ _poly_csubq (a);
    j <- 0;
    i <- 0;
    while ((i < 256)) {
      t0 <- a.[i];
      t1 <- a.[(i + 1)];
      d <- t0;
      d <- (d `&` (W16.of_int 255));
      rp <-
      (Array384.init
      (WArray384.get8
      (WArray384.set8_direct (WArray384.init8 (fun i_0 => rp.[i_0])) 
      j (truncateu8 d))));
      j <- (j + 1);
      t0 <- (t0 `>>` (W8.of_int 8));
      t0 <- (t0 `&` (W16.of_int 15));
      d <- t1;
      d <- (d `&` (W16.of_int 15));
      d <- (d `<<` (W8.of_int 4));
      d <- (d `|` t0);
      rp <-
      (Array384.init
      (WArray384.get8
      (WArray384.set8_direct (WArray384.init8 (fun i_0 => rp.[i_0])) 
      j (truncateu8 d))));
      j <- (j + 1);
      t1 <- (t1 `>>` (W8.of_int 4));
      rp <-
      (Array384.init
      (WArray384.get8
      (WArray384.set8_direct (WArray384.init8 (fun i_0 => rp.[i_0])) 
      j (truncateu8 t1))));
      j <- (j + 1);
      i <- (i + 2);
    }
    return (rp, a);
  }
  proc _i_poly_tomsg (rp:W8.t Array32.t, a:W16.t Array256.t) : W8.t Array32.t *
                                                               W16.t Array256.t = {
    var r:W8.t;
    var j:int;
    var i:int;
    var t:W16.t;
    var d:W32.t;
    a <@ _poly_csubq (a);
    i <- 0;
    while ((i < 32)) {
      r <- (W8.of_int 0);
      j <- 0;
      while ((j < 8)) {
        t <- a.[((8 * i) + j)];
        d <- (zeroextu32 t);
        d <- (d `<<` (W8.of_int 1));
        d <- (d + (W32.of_int 1665));
        d <- (d * (W32.of_int 80635));
        d <- (d `>>` (W8.of_int 28));
        d <- (d `&` (W32.of_int 1));
        d <- (d `<<` (W8.of_int j));
        r <- (r `|` (truncateu8 d));
        j <- (j + 1);
      }
      rp.[i] <- r;
      i <- (i + 1);
    }
    return (rp, a);
  }
  proc _i_poly_compress (rp:W8.t Array128.t, a:W16.t Array256.t) : W8.t Array128.t *
                                                                   W16.t Array256.t = {
    var d0:W32.t;
    var d1:W32.t;
    var i:int;
    a <@ _poly_csubq (a);
    i <- 0;
    while ((i < 128)) {
      d0 <- (zeroextu32 a.[(2 * i)]);
      d1 <- (zeroextu32 a.[((2 * i) + 1)]);
      d0 <- (d0 `<<` (W8.of_int 4));
      d0 <- (d0 + (W32.of_int 1665));
      d0 <- (d0 * (W32.of_int 80635));
      d0 <- (d0 `>>` (W8.of_int 28));
      d0 <- (d0 `&` (W32.of_int 15));
      d1 <- (d1 `<<` (W8.of_int 4));
      d1 <- (d1 + (W32.of_int 1665));
      d1 <- (d1 * (W32.of_int 80635));
      d1 <- (d1 `>>` (W8.of_int 28));
      d1 <- (d1 `&` (W32.of_int 15));
      d1 <- (d1 `<<` (W8.of_int 4));
      d0 <- (d0 `|` d1);
      rp.[i] <- (truncateu8 d0);
      i <- (i + 1);
    }
    return (rp, a);
  }
  proc _i_poly_decompress (rp:W16.t Array256.t, ap:W8.t Array128.t) : 
  W16.t Array256.t = {
    var t:W8.t;
    var d0:W16.t;
    var d1:W16.t;
    var i:int;
    i <- 0;
    while ((i < 128)) {
      t <- ap.[i];
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
      i <- (i + 1);
    }
    return rp;
  }
  proc __polyvec_add2 (r:W16.t Array768.t, b:W16.t Array768.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var i:int;
    i <- 0;
    while ((i < 3)) {
      aux <@ _poly_add2 ((Array256.init (fun i_0 => r.[((256 * i) + i_0)])),
      (Array256.init (fun i_0 => b.[((256 * i) + i_0)])));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __polyvec_csubq (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var i:int;
    i <- 0;
    while ((i < 3)) {
      aux <@ _poly_csubq ((Array256.init (fun i_0 => r.[((256 * i) + i_0)])));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __i_polyvec_frombytes (ap:W8.t Array1152.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var r:W16.t Array768.t;
    var i:int;
    r <- witness;
    i <- 0;
    while ((i < 3)) {
      aux <@ _poly_frombytes ((Array256.init
                              (fun i_0 => r.[((256 * i) + i_0)])),
      (Array384.init (fun i_0 => ap.[((384 * i) + i_0)])));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __polyvec_invntt (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var i:int;
    i <- 0;
    while ((i < 3)) {
      aux <@ _poly_invntt ((Array256.init (fun i_0 => r.[((256 * i) + i_0)])));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __polyvec_ntt (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var i:int;
    i <- 0;
    while ((i < 3)) {
      aux <@ _poly_ntt ((Array256.init (fun i_0 => r.[((256 * i) + i_0)])));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __polyvec_pointwise_acc (a:W16.t Array768.t, b:W16.t Array768.t) : 
  W16.t Array256.t = {
    var r:W16.t Array256.t;
    var t:W16.t Array256.t;
    var i:int;
    r <- witness;
    t <- witness;
    r <@ _poly_basemul (r, (Array256.init (fun i_0 => a.[(0 + i_0)])),
    (Array256.init (fun i_0 => b.[(0 + i_0)])));
    i <- 1;
    while ((i < 3)) {
      t <@ _poly_basemul (t,
      (Array256.init (fun i_0 => a.[((256 * i) + i_0)])),
      (Array256.init (fun i_0 => b.[((256 * i) + i_0)])));
      r <@ _poly_add2 (r, t);
      i <- (i + 1);
    }
    r <@ __poly_reduce (r);
    return r;
  }
  proc __polyvec_reduce (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var i:int;
    i <- 0;
    while ((i < 3)) {
      aux <@ __poly_reduce ((Array256.init (fun i_0 => r.[((256 * i) + i_0)])
                            ));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __i_polyvec_tobytes (rp:W8.t Array1152.t, a:W16.t Array768.t) : 
  W8.t Array1152.t = {
    var aux_0:W16.t Array256.t;
    var aux:W8.t Array384.t;
    var i:int;
    var  _0:W16.t Array256.t;
     _0 <- witness;
    i <- 0;
    while ((i < 3)) {
      (aux, aux_0) <@ _poly_tobytes ((Array384.init
                                     (fun i_0 => rp.[((384 * i) + i_0)])),
      (Array256.init (fun i_0 => a.[((256 * i) + i_0)])));
      rp <-
      (Array1152.init
      (fun i_0 => (if ((384 * i) <= i_0 < ((384 * i) + 384)) then aux.[
                                                                  (i_0 -
                                                                  (384 * i))] else 
                  rp.[i_0]))
      );
       _0 <- aux_0;
      i <- (i + 1);
    }
    return rp;
  }
  proc __i_polyvec_compress (rp:W8.t Array960.t, a:W16.t Array768.t) : 
  W8.t Array960.t = {
    var aa:W16.t Array768.t;
    var k:int;
    var t:W64.t Array4.t;
    var c:W16.t;
    var b:W16.t;
    var i:int;
    var j:int;
    aa <- witness;
    t <- witness;
    i <- 0;
    j <- 0;
    aa <@ __polyvec_csubq (a);
    while ((i < ((3 * 256) - 3))) {
      k <- 0;
      while ((k < 4)) {
        t.[k] <- (zeroextu64 aa.[(i + k)]);
        t.[k] <- (t.[k] `<<` (W8.of_int 10));
        t.[k] <- (t.[k] + (W64.of_int 1665));
        t.[k] <- (t.[k] * (W64.of_int 1290167));
        t.[k] <- (t.[k] `>>` (W8.of_int 32));
        t.[k] <- (t.[k] `&` (W64.of_int 1023));
        k <- (k + 1);
      }
      c <- (truncateu16 t.[0]);
      c <- (c `&` (W16.of_int 255));
      rp.[j] <- (truncateu8 c);
      j <- (j + 1);
      b <- (truncateu16 t.[0]);
      b <- (b `>>` (W8.of_int 8));
      c <- (truncateu16 t.[1]);
      c <- (c `<<` (W8.of_int 2));
      c <- (c `|` b);
      rp.[j] <- (truncateu8 c);
      j <- (j + 1);
      b <- (truncateu16 t.[1]);
      b <- (b `>>` (W8.of_int 6));
      c <- (truncateu16 t.[2]);
      c <- (c `<<` (W8.of_int 4));
      c <- (c `|` b);
      rp.[j] <- (truncateu8 c);
      j <- (j + 1);
      b <- (truncateu16 t.[2]);
      b <- (b `>>` (W8.of_int 4));
      c <- (truncateu16 t.[3]);
      c <- (c `<<` (W8.of_int 6));
      c <- (c `|` b);
      rp.[j] <- (truncateu8 c);
      j <- (j + 1);
      t.[3] <- (t.[3] `>>` (W8.of_int 2));
      rp.[j] <- (truncateu8 t.[3]);
      j <- (j + 1);
      i <- (i + 4);
    }
    return rp;
  }
  proc __i_polyvec_decompress (rp:W16.t Array768.t, ap:W8.t Array960.t) : 
  W16.t Array768.t = {
    var k:int;
    var t:W32.t Array5.t;
    var d:W32.t;
    var i:int;
    var j:int;
    t <- witness;
    i <- 0;
    j <- 0;
    while ((i < ((3 * 256) - 3))) {
      k <- 0;
      while ((k < 5)) {
        t.[k] <- (zeroextu32 ap.[j]);
        j <- (j + 1);
        k <- (k + 1);
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
      while ((k < 4)) {
        t.[k] <- (t.[k] * (W32.of_int 3329));
        t.[k] <- (t.[k] + (W32.of_int 512));
        t.[k] <- (t.[k] `>>` (W8.of_int 10));
        rp.[(i + k)] <- (truncateu16 t.[k]);
        k <- (k + 1);
      }
      i <- (i + 4);
    }
    return rp;
  }
  proc __rej_uniform (rp:W16.t Array256.t, offset:W64.t, buf:W8.t Array168.t) : 
  W64.t * W16.t Array256.t = {
    var ctr:W64.t;
    var ms:W64.t;
    var pos:W64.t;
    var cond:bool;
    var val1:W16.t;
    var t:W16.t;
    var val2:W16.t;
    ms <- (init_msf);
    ctr <- offset;
    pos <- (W64.of_int 0);
    cond <- (pos \ult (W64.of_int (168 - 2)));
    while (cond) {
      ms <- (update_msf cond ms);
      cond <- (ctr \ult (W64.of_int 256));
      if (cond) {
        ms <- (update_msf cond ms);
        val1 <- (zeroextu16 buf.[(W64.to_uint pos)]);
        val1 <- (protect_16 val1 ms);
        t <- (zeroextu16 buf.[(W64.to_uint (pos + (W64.of_int 1)))]);
        t <- (protect_16 t ms);
        val2 <- t;
        val2 <- (val2 `>>` (W8.of_int 4));
        t <- (t `&` (W16.of_int 15));
        t <- (t `<<` (W8.of_int 8));
        val1 <- (val1 `|` t);
        t <- (zeroextu16 buf.[(W64.to_uint (pos + (W64.of_int 2)))]);
        t <- (protect_16 t ms);
        t <- (t `<<` (W8.of_int 4));
        val2 <- (val2 `|` t);
        pos <- (pos + (W64.of_int 3));
        cond <- (val1 \ult (W16.of_int 3329));
        if (cond) {
          ms <- (update_msf cond ms);
          rp.[(W64.to_uint ctr)] <- val1;
          ctr <- (ctr + (W64.of_int 1));
        } else {
          ms <- (update_msf (! cond) ms);
        }
        cond <- (val2 \ult (W16.of_int 3329));
        if (cond) {
          ms <- (update_msf cond ms);
          cond <- (ctr \ult (W64.of_int 256));
          if (cond) {
            ms <- (update_msf cond ms);
            rp.[(W64.to_uint ctr)] <- val2;
            ctr <- (ctr + (W64.of_int 1));
          } else {
            ms <- (update_msf (! cond) ms);
          }
        } else {
          ms <- (update_msf (! cond) ms);
        }
      } else {
        ms <- (update_msf (! cond) ms);
        pos <- (W64.of_int 168);
      }
      cond <- (pos \ult (W64.of_int (168 - 2)));
    }
    return (ctr, rp);
  }
  proc __gen_matrix (seed:W8.t Array32.t, transposed:W64.t) : W16.t Array2304.t = {
    var r:W16.t Array2304.t;
    var stransposed:W64.t;
    var j:int;
    var c:W8.t;
    var extseed:W8.t Array34.t;
    var i:int;
    var state:W64.t Array25.t;
    var ctr:W64.t;
    var sctr:W64.t;
    var buf:W8.t Array168.t;
    var poly:W16.t Array256.t;
    var k:W64.t;
    var rij:W16.t Array256.t;
    var t:W16.t;
    buf <- witness;
    extseed <- witness;
    poly <- witness;
    r <- witness;
    rij <- witness;
    state <- witness;
    stransposed <- transposed;
    j <- 0;
    while ((j < 32)) {
      c <- seed.[j];
      extseed.[j] <- c;
      j <- (j + 1);
    }
    i <- 0;
    while ((i < 3)) {
      j <- 0;
      while ((j < 3)) {
        transposed <- stransposed;
        if ((transposed = (W64.of_int 0))) {
          extseed.[32] <- (W8.of_int j);
          extseed.[(32 + 1)] <- (W8.of_int i);
        } else {
          extseed.[32] <- (W8.of_int i);
          extseed.[(32 + 1)] <- (W8.of_int j);
        }
        state <@ _shake128_absorb34 (state, extseed);
        ctr <- (W64.of_int 0);
        while ((ctr \ult (W64.of_int 256))) {
          sctr <- ctr;
          (state, buf) <@ _shake128_squeezeblock (state, buf);
          ctr <- sctr;
          (ctr, poly) <@ __rej_uniform (poly, ctr, buf);
        }
        k <- (W64.of_int 0);
        rij <-
        (Array256.init (fun i_0 => r.[(((i * (3 * 256)) + (j * 256)) + i_0)])
        );
        while ((k \ult (W64.of_int 256))) {
          t <- poly.[(W64.to_uint k)];
          rij.[(W64.to_uint k)] <- t;
          k <- (k + (W64.of_int 1));
        }
        r <-
        (Array2304.init
        (fun i_0 => (if (((i * (3 * 256)) + (j * 256)) <= i_0 < (((i *
                                                                  (3 * 256)) +
                                                                 (j * 256)) +
                                                                256)) then 
                    rij.[(i_0 - ((i * (3 * 256)) + (j * 256)))] else 
                    r.[i_0]))
        );
        j <- (j + 1);
      }
      i <- (i + 1);
    }
    return r;
  }
  proc __indcpa_keypair (pk:W8.t Array1184.t, sk:W8.t Array1152.t,
                         randomnessp:W8.t Array32.t) : W8.t Array1184.t *
                                                       W8.t Array1152.t = {
    var aux:W16.t Array256.t;
    var aux_0:W8.t Array1152.t;
    var inc:int;
    var i:int;
    var t64:W64.t;
    var inbuf:W8.t Array33.t;
    var buf:W8.t Array64.t;
    var publicseed:W8.t Array32.t;
    var noiseseed:W8.t Array32.t;
    var transposed:W64.t;
    var aa:W16.t Array2304.t;
    var nonce:W8.t;
    var skpv:W16.t Array768.t;
    var e:W16.t Array768.t;
    var pkpv:W16.t Array768.t;
    aa <- witness;
    buf <- witness;
    e <- witness;
    inbuf <- witness;
    noiseseed <- witness;
    pkpv <- witness;
    publicseed <- witness;
    skpv <- witness;
    (* Erased call to spill *)
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (get64 (WArray32.init8 (fun i_0 => randomnessp.[i_0])) i);
      inbuf <-
      (Array33.init
      (WArray33.get8
      (WArray33.set64 (WArray33.init8 (fun i_0 => inbuf.[i_0])) i t64)));
      i <- (i + 1);
    }
    inbuf.[32] <- (W8.of_int 3);
    buf <@ _sha3_512A_A33 (buf, inbuf);
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (get64 (WArray64.init8 (fun i_0 => buf.[i_0])) i);
      (* Erased call to declassify *)
      publicseed <-
      (Array32.init
      (WArray32.get8
      (WArray32.set64 (WArray32.init8 (fun i_0 => publicseed.[i_0])) i t64)));
      t64 <- (get64 (WArray64.init8 (fun i_0 => buf.[i_0])) (i + (32 %/ 8)));
      noiseseed <-
      (Array32.init
      (WArray32.get8
      (WArray32.set64 (WArray32.init8 (fun i_0 => noiseseed.[i_0])) i t64)));
      i <- (i + 1);
    }
    transposed <- (W64.of_int 0);
    aa <@ __gen_matrix (publicseed, transposed);
    i <- 0;
    while ((i < 3)) {
      nonce <- (W8.of_int i);
      aux <@ _poly_getnoise ((Array256.init
                             (fun i_0 => skpv.[((i * 256) + i_0)])),
      noiseseed, nonce);
      skpv <-
      (Array768.init
      (fun i_0 => (if ((i * 256) <= i_0 < ((i * 256) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (i * 256))] else 
                  skpv.[i_0]))
      );
      i <- (i + 1);
    }
    i <- 0;
    while ((i < 3)) {
      nonce <- (W8.of_int (3 + i));
      aux <@ _poly_getnoise ((Array256.init
                             (fun i_0 => e.[((i * 256) + i_0)])),
      noiseseed, nonce);
      e <-
      (Array768.init
      (fun i_0 => (if ((i * 256) <= i_0 < ((i * 256) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (i * 256))] else 
                  e.[i_0]))
      );
      i <- (i + 1);
    }
    skpv <@ __polyvec_ntt (skpv);
    e <@ __polyvec_ntt (e);
    i <- 0;
    while ((i < 3)) {
      aux <@ __polyvec_pointwise_acc ((Array768.init
                                      (fun i_0 => aa.[((i * (3 * 256)) + i_0)])
                                      ),
      skpv);
      pkpv <-
      (Array768.init
      (fun i_0 => (if ((i * 256) <= i_0 < ((i * 256) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (i * 256))] else 
                  pkpv.[i_0]))
      );
      aux <@ _poly_frommont ((Array256.init
                             (fun i_0 => pkpv.[((i * 256) + i_0)])));
      pkpv <-
      (Array768.init
      (fun i_0 => (if ((i * 256) <= i_0 < ((i * 256) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (i * 256))] else 
                  pkpv.[i_0]))
      );
      i <- (i + 1);
    }
    pkpv <@ __polyvec_add2 (pkpv, e);
    pkpv <@ __polyvec_reduce (pkpv);
    (* Erased call to unspill *)
    sk <@ __i_polyvec_tobytes (sk, skpv);
    aux_0 <@ __i_polyvec_tobytes ((Array1152.init (fun i_0 => pk.[(0 + i_0)])
                                  ),
    pkpv);
    pk <-
    (Array1184.init
    (fun i_0 => (if (0 <= i_0 < (0 + 1152)) then aux_0.[(i_0 - 0)] else 
                pk.[i_0]))
    );
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (get64 (WArray32.init8 (fun i_0 => publicseed.[i_0])) i);
      pk <-
      (Array1184.init
      (WArray1184.get8
      (WArray1184.set64_direct (WArray1184.init8 (fun i_0 => pk.[i_0]))
      ((i + ((3 * 384) %/ 8)) * 8) t64)));
      i <- (i + 1);
    }
    return (pk, sk);
  }
  proc __indcpa_enc (ct:W8.t Array1088.t, msgp:W8.t Array32.t,
                     pk:W8.t Array1184.t, noiseseed:W8.t Array32.t) : 
  W8.t Array1088.t = {
    var aux:W16.t Array256.t;
    var aux_1:W8.t Array128.t;
    var aux_0:W8.t Array960.t;
    var inc:int;
    var s_ct:W8.t Array1088.t;
    var pkpv:W16.t Array768.t;
    var w:int;
    var t64:W64.t;
    var publicseed:W8.t Array32.t;
    var k:W16.t Array256.t;
    var s_noiseseed:W8.t Array32.t;
    var transposed:W64.t;
    var aat:W16.t Array2304.t;
    var lnoiseseed:W8.t Array32.t;
    var nonce:W8.t;
    var sp_0:W16.t Array768.t;
    var ep:W16.t Array768.t;
    var epp:W16.t Array256.t;
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;
    aat <- witness;
    bp <- witness;
    ep <- witness;
    epp <- witness;
    k <- witness;
    lnoiseseed <- witness;
    pkpv <- witness;
    publicseed <- witness;
    s_ct <- witness;
    s_noiseseed <- witness;
    sp_0 <- witness;
    v <- witness;
    s_ct <- ct;
    pkpv <@ __i_polyvec_frombytes ((Array1152.init (fun i => pk.[(0 + i)])));
    inc <- (32 %/ 8);
    w <- 0;
    while ((w < inc)) {
      t64 <-
      (get64_direct (WArray1184.init8 (fun i => pk.[i]))
      ((((3 * 384) %/ 8) + w) * 8));
      (* Erased call to declassify *)
      publicseed <-
      (Array32.init
      (WArray32.get8
      (WArray32.set64 (WArray32.init8 (fun i => publicseed.[i])) w t64)));
      w <- (w + 1);
    }
    k <@ _i_poly_frommsg (k, msgp);
    s_noiseseed <- noiseseed;
    transposed <- (W64.of_int 1);
    aat <@ __gen_matrix (publicseed, transposed);
    lnoiseseed <- s_noiseseed;
    w <- 0;
    while ((w < 3)) {
      nonce <- (W8.of_int w);
      aux <@ _poly_getnoise ((Array256.init (fun i => sp_0.[((w * 256) + i)])
                             ),
      lnoiseseed, nonce);
      sp_0 <-
      (Array768.init
      (fun i => (if ((256 * w) <= i < ((256 * w) + 256)) then aux.[(i -
                                                                   (256 * w))] else 
                sp_0.[i]))
      );
      w <- (w + 1);
    }
    lnoiseseed <- s_noiseseed;
    w <- 0;
    while ((w < 3)) {
      nonce <- (W8.of_int (3 + w));
      aux <@ _poly_getnoise ((Array256.init (fun i => ep.[((w * 256) + i)])),
      lnoiseseed, nonce);
      ep <-
      (Array768.init
      (fun i => (if ((256 * w) <= i < ((256 * w) + 256)) then aux.[(i -
                                                                   (256 * w))] else 
                ep.[i]))
      );
      w <- (w + 1);
    }
    nonce <- (W8.of_int (2 * 3));
    epp <@ _poly_getnoise (epp, lnoiseseed, nonce);
    sp_0 <@ __polyvec_ntt (sp_0);
    w <- 0;
    while ((w < 3)) {
      aux <@ __polyvec_pointwise_acc ((Array768.init
                                      (fun i => aat.[((w * (3 * 256)) + i)])),
      sp_0);
      bp <-
      (Array768.init
      (fun i => (if ((w * 256) <= i < ((w * 256) + 256)) then aux.[(i -
                                                                   (w * 256))] else 
                bp.[i]))
      );
      w <- (w + 1);
    }
    v <@ __polyvec_pointwise_acc (pkpv, sp_0);
    bp <@ __polyvec_invntt (bp);
    v <@ _poly_invntt (v);
    bp <@ __polyvec_add2 (bp, ep);
    v <@ _poly_add2 (v, epp);
    v <@ _poly_add2 (v, k);
    bp <@ __polyvec_reduce (bp);
    v <@ __poly_reduce (v);
    ct <- s_ct;
    aux_0 <@ __i_polyvec_compress ((Array960.init (fun i => ct.[(0 + i)])),
    bp);
    ct <-
    (Array1088.init
    (fun i => (if (0 <= i < (0 + 960)) then aux_0.[(i - 0)] else ct.[i])));
    (aux_1, aux) <@ _i_poly_compress ((Array128.init
                                      (fun i => ct.[((3 * 320) + i)])),
    v);
    ct <-
    (Array1088.init
    (fun i => (if ((3 * 320) <= i < ((3 * 320) + 128)) then aux_1.[(i -
                                                                   (3 * 320))] else 
              ct.[i]))
    );
    v <- aux;
    return ct;
  }
  proc __indcpa_dec (msgp:W8.t Array32.t, ct:W8.t Array1088.t,
                     sk:W8.t Array1152.t) : W8.t Array32.t = {
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;
    var skpv:W16.t Array768.t;
    var t:W16.t Array256.t;
    var mp:W16.t Array256.t;
    bp <- witness;
    mp <- witness;
    skpv <- witness;
    t <- witness;
    v <- witness;
    bp <@ __i_polyvec_decompress (bp,
    (Array960.init (fun i => ct.[(0 + i)])));
    v <@ _i_poly_decompress (v,
    (Array128.init (fun i => ct.[((3 * 320) + i)])));
    skpv <@ __i_polyvec_frombytes (sk);
    bp <@ __polyvec_ntt (bp);
    t <@ __polyvec_pointwise_acc (skpv, bp);
    t <@ _poly_invntt (t);
    mp <@ _poly_sub (mp, v, t);
    mp <@ __poly_reduce (mp);
    (msgp, mp) <@ _i_poly_tomsg (msgp, mp);
    return msgp;
  }
  proc __verify (ctp:W8.t Array1088.t, ctpc:W8.t Array1088.t) : W64.t = {
    var inc:int;
    var cnd:W64.t;
    var i:int;
    var t1:W8.t;
    var t2:W8.t;
    var t64:W64.t;
    cnd <- (W64.of_int 0);
    inc <- ((3 * 320) + 128);
    i <- 0;
    while ((i < inc)) {
      t1 <- (get8_direct (WArray1088.init8 (fun i_0 => ctpc.[i_0])) i);
      t2 <- ctp.[i];
      t1 <- (t1 `^` t2);
      t64 <- (zeroextu64 t1);
      cnd <- (cnd `|` t64);
      i <- (i + 1);
    }
    cnd <- (- cnd);
    cnd <- (cnd `>>` (W8.of_int 63));
    return cnd;
  }
  proc __cmov (dst:W8.t Array32.t, src:W8.t Array32.t, cnd:W64.t) : W8.t Array32.t = {
    var i:int;
    var t2:W8.t;
    var t1:W8.t;
    cnd <- (- cnd);
    i <- 0;
    while ((i < 32)) {
      t2 <- dst.[i];
      t1 <- (get8_direct (WArray32.init8 (fun i_0 => src.[i_0])) i);
      t2 <- (t2 `^` t1);
      t2 <- (t2 `&` (truncateu8 cnd));
      t1 <- (t1 `^` t2);
      dst.[i] <- t1;
      i <- (i + 1);
    }
    return dst;
  }
  proc __crypto_kem_keypair_jazz (pk:W8.t Array1184.t, sk:W8.t Array2400.t,
                                  randomnessp:W8.t Array64.t) : W8.t Array1184.t *
                                                                W8.t Array2400.t = {
    var inc:int;
    var s_randomnessp:W8.t Array64.t;
    var randomnessp1:W8.t Array32.t;
    var icsk:W8.t Array1152.t;
    var s_skp:W8.t Array2400.t;
    var i:int;
    var t64:W64.t;
    var h_pk:W8.t Array32.t;
    var randomnessp2:W8.t Array32.t;
    h_pk <- witness;
    icsk <- witness;
    randomnessp1 <- witness;
    randomnessp2 <- witness;
    s_randomnessp <- witness;
    s_skp <- witness;
    s_randomnessp <- randomnessp;
    randomnessp1 <- (Array32.init (fun i_0 => randomnessp.[(0 + i_0)]));
    icsk <- (Array1152.init (fun i_0 => sk.[(0 + i_0)]));
    s_skp <- sk;
    (pk, icsk) <@ __indcpa_keypair (pk, icsk, randomnessp1);
    sk <- s_skp;
    sk <-
    (Array2400.init
    (fun i_0 => (if (0 <= i_0 < (0 + 1152)) then icsk.[(i_0 - 0)] else 
                sk.[i_0]))
    );
    inc <- (((3 * 384) + 32) %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (get64 (WArray1184.init8 (fun i_0 => pk.[i_0])) i);
      sk <-
      (Array2400.init
      (WArray2400.get8
      (WArray2400.set64_direct (WArray2400.init8 (fun i_0 => sk.[i_0]))
      ((((3 * 384) %/ 8) + i) * 8) t64)));
      i <- (i + 1);
    }
    s_skp <- sk;
    h_pk <@ _sha3_256A_A1184 (h_pk, pk);
    sk <- s_skp;
    i <- 0;
    while ((i < 4)) {
      t64 <- (get64 (WArray32.init8 (fun i_0 => h_pk.[i_0])) i);
      sk <-
      (Array2400.init
      (WArray2400.get8
      (WArray2400.set64_direct (WArray2400.init8 (fun i_0 => sk.[i_0]))
      (((((3 * 384) + ((3 * 384) + 32)) %/ 8) + i) * 8) t64)));
      i <- (i + 1);
    }
    randomnessp <- s_randomnessp;
    randomnessp2 <- (Array32.init (fun i_0 => randomnessp.[(32 + i_0)]));
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <-
      (get64_direct (WArray32.init8 (fun i_0 => randomnessp2.[i_0])) (i * 8));
      sk <-
      (Array2400.init
      (WArray2400.get8
      (WArray2400.set64_direct (WArray2400.init8 (fun i_0 => sk.[i_0]))
      ((((((3 * 384) + ((3 * 384) + 32)) + 32) %/ 8) + i) * 8) t64)));
      i <- (i + 1);
    }
    return (pk, sk);
  }
  proc __crypto_kem_enc_jazz (ct:W8.t Array1088.t, shk:W8.t Array32.t,
                              pk:W8.t Array1184.t, randomnessp:W8.t Array32.t) : 
  W8.t Array1088.t * W8.t Array32.t = {
    var aux:W8.t Array32.t;
    var inc:int;
    var s_pk:W8.t Array1184.t;
    var s_shk:W8.t Array32.t;
    var i:int;
    var t64:W64.t;
    var buf:W8.t Array64.t;
    var kr:W8.t Array64.t;
    buf <- witness;
    kr <- witness;
    s_pk <- witness;
    s_shk <- witness;
    s_pk <- pk;
    s_shk <- shk;
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (get64 (WArray32.init8 (fun i_0 => randomnessp.[i_0])) i);
      buf <-
      (Array64.init
      (WArray64.get8
      (WArray64.set64 (WArray64.init8 (fun i_0 => buf.[i_0])) i t64)));
      i <- (i + 1);
    }
    aux <@ _sha3_256A_A1184 ((Array32.init (fun i_0 => buf.[(32 + i_0)])),
    pk);
    buf <-
    (Array64.init
    (fun i_0 => (if (32 <= i_0 < (32 + 32)) then aux.[(i_0 - 32)] else 
                buf.[i_0]))
    );
    kr <@ _sha3_512A_A64 (kr, buf);
    pk <- s_pk;
    ct <@ __indcpa_enc (ct, (Array32.init (fun i_0 => buf.[(0 + i_0)])), 
    pk, (Array32.init (fun i_0 => kr.[(32 + i_0)])));
    shk <- s_shk;
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (get64 (WArray64.init8 (fun i_0 => kr.[i_0])) i);
      shk <-
      (Array32.init
      (WArray32.get8
      (WArray32.set64 (WArray32.init8 (fun i_0 => shk.[i_0])) i t64)));
      i <- (i + 1);
    }
    return (ct, shk);
  }
  proc __crypto_kem_dec_jazz (shk:W8.t Array32.t, ct:W8.t Array1088.t,
                              sk:W8.t Array2400.t) : W8.t Array32.t = {
    var aux:W8.t Array32.t;
    var inc:int;
    var s_shk:W8.t Array32.t;
    var s_ct:W8.t Array1088.t;
    var s_sk:W8.t Array2400.t;
    var buf:W8.t Array64.t;
    var i:int;
    var t64:W64.t;
    var kr:W8.t Array64.t;
    var ctc:W8.t Array1088.t;
    var cnd:W64.t;
    var s_cnd:W64.t;
    buf <- witness;
    ctc <- witness;
    kr <- witness;
    s_ct <- witness;
    s_shk <- witness;
    s_sk <- witness;
    s_shk <- shk;
    s_ct <- ct;
    s_sk <- sk;
    aux <@ __indcpa_dec ((Array32.init (fun i_0 => buf.[(0 + i_0)])), 
    ct, (Array1152.init (fun i_0 => s_sk.[(0 + i_0)])));
    buf <-
    (Array64.init
    (fun i_0 => (if (0 <= i_0 < (0 + 32)) then aux.[(i_0 - 0)] else buf.[i_0]))
    );
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <-
      (get64_direct (WArray2400.init8 (fun i_0 => s_sk.[i_0]))
      ((i + ((((((3 * 384) + ((3 * 384) + 32)) + 32) + 32) - (2 * 32)) %/ 8)) *
      8));
      buf <-
      (Array64.init
      (WArray64.get8
      (WArray64.set64_direct (WArray64.init8 (fun i_0 => buf.[i_0]))
      ((i + (32 %/ 8)) * 8) t64)));
      i <- (i + 1);
    }
    kr <@ _sha3_512A_A64 (kr, buf);
    ctc <@ __indcpa_enc (ctc, (Array32.init (fun i_0 => buf.[(0 + i_0)])),
    (Array1184.init (fun i_0 => s_sk.[((3 * 384) + i_0)])),
    (Array32.init (fun i_0 => kr.[(32 + i_0)])));
    ct <- s_ct;
    cnd <@ __verify (ct, ctc);
    s_cnd <- cnd;
    ct <- s_ct;
    shk <- s_shk;
    shk <@ _shake256_A32__A1120 (shk,
    (Array32.init
    (fun i_0 => s_sk.[((((((3 * 384) + ((3 * 384) + 32)) + 32) + 32) - 32) +
                      i_0)])
    ), ct);
    cnd <- s_cnd;
    shk <@ __cmov (shk, (Array32.init (fun i_0 => kr.[(0 + i_0)])), cnd);
    return shk;
  }
  proc jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand (public_key:W8.t Array1184.t,
                                                         secret_key:W8.t Array2400.t,
                                                         coins:W8.t Array64.t) : 
  W8.t Array1184.t * W8.t Array2400.t * W64.t = {
    var r:W64.t;
    var rd:W8.t Array64.t;
    var pk:W8.t Array1184.t;
    var pkp:W8.t Array1184.t;
    var sk:W8.t Array2400.t;
    var skp:W8.t Array2400.t;
    var rdp:W8.t Array64.t;
    var  _0:W64.t;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    pk <- witness;
    pkp <- witness;
    rd <- witness;
    rdp <- witness;
    sk <- witness;
    skp <- witness;
     _0 <- (init_msf);
    (* Erased call to spill *)
    (* Erased call to spill *)
    rd <-
    (Array64.init
    (fun i => (get8
              (WArray64.init64
              (fun i => (copy_64
                        (Array8.init
                        (fun i => (get64
                                  (WArray64.init8 (fun i => coins.[i])) 
                                  i))
                        )).[i])
              ) i))
    );
    pkp <- pk;
    skp <- sk;
    rdp <- rd;
    (pkp, skp) <@ __crypto_kem_keypair_jazz (pkp, skp, rdp);
    (* Erased call to unspill *)
    (* Erased call to unspill *)
    pk <- pkp;
    sk <- skp;
    public_key <-
    (Array1184.init
    (fun i => (get8
              (WArray1184.init64
              (fun i => (copy_64
                        (Array148.init
                        (fun i => (get64 (WArray1184.init8 (fun i => pk.[i]))
                                  i))
                        )).[i])
              ) i))
    );
    secret_key <-
    (Array2400.init
    (fun i => (get8
              (WArray2400.init64
              (fun i => (copy_64
                        (Array300.init
                        (fun i => (get64 (WArray2400.init8 (fun i => sk.[i]))
                                  i))
                        )).[i])
              ) i))
    );
    (* Erased call to spill *)
    (* Erased call to spill *)
    ( _1,  _2,  _3,  _4,  _5, r) <- (set0_64);
    return (public_key, secret_key, r);
  }
  proc jade_kem_mlkem_mlkem768_amd64_ref_enc_derand (ciphertext:W8.t Array1088.t,
                                                     shared_secret:W8.t Array32.t,
                                                     public_key:W8.t Array1184.t,
                                                     coins:W8.t Array32.t) : 
  W8.t Array1088.t * W8.t Array32.t * W64.t = {
    var r:W64.t;
    var pk:W8.t Array1184.t;
    var rd:W8.t Array32.t;
    var ct:W8.t Array1088.t;
    var ctp:W8.t Array1088.t;
    var pkp:W8.t Array1184.t;
    var shk:W8.t Array32.t;
    var shkp:W8.t Array32.t;
    var rdp:W8.t Array32.t;
    var  _0:W64.t;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    ct <- witness;
    ctp <- witness;
    pk <- witness;
    pkp <- witness;
    rd <- witness;
    rdp <- witness;
    shk <- witness;
    shkp <- witness;
     _0 <- (init_msf);
    (* Erased call to spill *)
    (* Erased call to spill *)
    pk <-
    (Array1184.init
    (fun i => (get8
              (WArray1184.init64
              (fun i => (copy_64
                        (Array148.init
                        (fun i => (get64
                                  (WArray1184.init8 (fun i => public_key.[i])
                                  ) i))
                        )).[i])
              ) i))
    );
    rd <-
    (Array32.init
    (fun i => (get8
              (WArray32.init64
              (fun i => (copy_64
                        (Array4.init
                        (fun i => (get64
                                  (WArray32.init8 (fun i => coins.[i])) 
                                  i))
                        )).[i])
              ) i))
    );
    ctp <- ct;
    pkp <- pk;
    shkp <- shk;
    rdp <- rd;
    (ctp, shkp) <@ __crypto_kem_enc_jazz (ctp, shkp, pkp, rdp);
    (* Erased call to unspill *)
    (* Erased call to unspill *)
    ct <- ctp;
    shk <- shkp;
    ciphertext <-
    (Array1088.init
    (fun i => (get8
              (WArray1088.init64
              (fun i => (copy_64
                        (Array136.init
                        (fun i => (get64 (WArray1088.init8 (fun i => ct.[i]))
                                  i))
                        )).[i])
              ) i))
    );
    shared_secret <-
    (Array32.init
    (fun i => (get8
              (WArray32.init64
              (fun i => (copy_64
                        (Array4.init
                        (fun i => (get64 (WArray32.init8 (fun i => shk.[i]))
                                  i))
                        )).[i])
              ) i))
    );
    ( _1,  _2,  _3,  _4,  _5, r) <- (set0_64);
    return (ciphertext, shared_secret, r);
  }
  proc jade_kem_mlkem_mlkem768_amd64_ref_dec (shared_secret:W8.t Array32.t,
                                              ciphertext:W8.t Array1088.t,
                                              secret_key:W8.t Array2400.t) : 
  W8.t Array32.t * W64.t = {
    var r:W64.t;
    var ct:W8.t Array1088.t;
    var sk:W8.t Array2400.t;
    var ctp:W8.t Array1088.t;
    var shk:W8.t Array32.t;
    var shkp:W8.t Array32.t;
    var skp:W8.t Array2400.t;
    var  _0:W64.t;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    ct <- witness;
    ctp <- witness;
    shk <- witness;
    shkp <- witness;
    sk <- witness;
    skp <- witness;
     _0 <- (init_msf);
    (* Erased call to spill *)
    ct <-
    (Array1088.init
    (fun i => (get8
              (WArray1088.init64
              (fun i => (copy_64
                        (Array136.init
                        (fun i => (get64
                                  (WArray1088.init8 (fun i => ciphertext.[i])
                                  ) i))
                        )).[i])
              ) i))
    );
    sk <-
    (Array2400.init
    (fun i => (get8
              (WArray2400.init64
              (fun i => (copy_64
                        (Array300.init
                        (fun i => (get64
                                  (WArray2400.init8 (fun i => secret_key.[i])
                                  ) i))
                        )).[i])
              ) i))
    );
    ctp <- ct;
    shkp <- shk;
    skp <- sk;
    shkp <@ __crypto_kem_dec_jazz (shkp, ctp, skp);
    (* Erased call to unspill *)
    shk <- shkp;
    shared_secret <-
    (Array32.init
    (fun i => (get8
              (WArray32.init64
              (fun i => (copy_64
                        (Array4.init
                        (fun i => (get64 (WArray32.init8 (fun i => shk.[i]))
                                  i))
                        )).[i])
              ) i))
    );
    ( _1,  _2,  _3,  _4,  _5, r) <- (set0_64);
    return (shared_secret, r);
  }
}.
