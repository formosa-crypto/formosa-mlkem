require import AllCore IntDiv CoreMap List Distr.

from Jasmin require import JModel_x86.

import SLH64.

require import
Array4 Array5 Array24 Array25 Array32 Array33 Array34 Array64 Array128
Array168 Array200 Array256 Array768 Array960 Array1088 Array2304 WArray192
WArray256 BArray20 BArray32 BArray33 BArray34 BArray40 BArray64 BArray128
BArray168 BArray192 BArray200 BArray256 BArray512 BArray960 BArray1088
BArray1536 BArray4608 SBArray64_32 SBArray256_128 SBArray1088_128
SBArray1536_512 SBArray4608_512 SBArray1088_960 SBArray4608_1536.

abbrev jzetas_inv =
(BArray256.of_list16
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

abbrev jzetas =
(BArray256.of_list16
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

abbrev kECCAK1600_RC =
(BArray192.of_list64
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

module type Syscall_t = {
  proc randombytes_32 (_:BArray32.t) : BArray32.t
  proc randombytes_64 (_:BArray64.t) : BArray64.t
}.

module Syscall : Syscall_t = {
  proc randombytes_32 (a:BArray32.t) : BArray32.t = {
    
    a <$ BArray32.darray;
    return a;
  }
  proc randombytes_64 (a:BArray64.t) : BArray64.t = {
    
    a <$ BArray64.darray;
    return a;
  }
}.

module M(SC:Syscall_t) = {
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
    t <- a;
    t <- (invw t);
    t <- (t `&` b);
    return t;
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
  proc __theta_sum_ref (a:BArray200.t) : BArray40.t = {
    var c:BArray40.t;
    var x:int;
    var y:int;
    c <- witness;
    x <- 0;
    while ((x < 5)) {
      c <- (BArray40.set64 c x (BArray200.get64 a (x + 0)));
      x <- (x + 1);
    }
    y <- 1;
    while ((y < 5)) {
      x <- 0;
      while ((x < 5)) {
        c <-
        (BArray40.set64 c x
        ((BArray40.get64 c x) `^` (BArray200.get64 a (x + (y * 5)))));
        x <- (x + 1);
      }
      y <- (y + 1);
    }
    return c;
  }
  proc __theta_rol_ref (c:BArray40.t) : BArray40.t = {
    var aux:W64.t;
    var d:BArray40.t;
    var x:int;
    d <- witness;
    x <- 0;
    while ((x < 5)) {
      d <- (BArray40.set64 d x (BArray40.get64 c ((x + 1) %% 5)));
      aux <@ __rol_u64_ref ((BArray40.get64 d x), 1);
      d <- (BArray40.set64 d x aux);
      d <-
      (BArray40.set64 d x
      ((BArray40.get64 d x) `^` (BArray40.get64 c (((x - 1) + 5) %% 5))));
      x <- (x + 1);
    }
    return d;
  }
  proc __rol_sum_ref (a:BArray200.t, d:BArray40.t, y:int) : BArray40.t = {
    var aux:W64.t;
    var b:BArray40.t;
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
      b <- (BArray40.set64 b x (BArray200.get64 a (x_ + (y_ * 5))));
      b <-
      (BArray40.set64 b x ((BArray40.get64 b x) `^` (BArray40.get64 d x_)));
      aux <@ __rol_u64_ref ((BArray40.get64 b x), r);
      b <- (BArray40.set64 b x aux);
      x <- (x + 1);
    }
    return b;
  }
  proc __set_row_ref (e:BArray200.t, b:BArray40.t, y:int, s_rc:W64.t) : 
  BArray200.t = {
    var x:int;
    var x1:int;
    var x2:int;
    var t:W64.t;
    x <- 0;
    while ((x < 5)) {
      x1 <- ((x + 1) %% 5);
      x2 <- ((x + 2) %% 5);
      t <@ __ANDN_64 ((BArray40.get64 b x1), (BArray40.get64 b x2));
      t <- (t `^` (BArray40.get64 b x));
      if (((x = 0) /\ (y = 0))) {
        t <- (t `^` s_rc);
      } else {
        
      }
      e <- (BArray200.set64 e (x + (y * 5)) t);
      x <- (x + 1);
    }
    return e;
  }
  proc __round_ref (e:BArray200.t, a:BArray200.t, s_rc:W64.t) : BArray200.t = {
    var c:BArray40.t;
    var d:BArray40.t;
    var y:int;
    var b:BArray40.t;
    b <- witness;
    c <- witness;
    d <- witness;
    c <@ __theta_sum_ref (a);
    d <@ __theta_rol_ref (c);
    y <- 0;
    while ((y < 5)) {
      b <@ __rol_sum_ref (a, d, y);
      e <@ __set_row_ref (e, b, y, s_rc);
      y <- (y + 1);
    }
    return e;
  }
  proc __keccakf1600_ref (a:BArray200.t) : BArray200.t = {
    var rC:BArray192.t;
    var s_RC:BArray192.t;
    var s_e:BArray200.t;
    var e:BArray200.t;
    var c:W64.t;
    var s_c:W64.t;
    var rc:W64.t;
    var s_rc:W64.t;
    rC <- witness;
    e <- witness;
    s_RC <- witness;
    s_e <- witness;
    rC <- kECCAK1600_RC;
    s_RC <- rC;
    e <- s_e;
    c <- (W64.of_int 0);
    s_c <- c;
    rC <- s_RC;
    rc <- (BArray192.get64 rC (W64.to_uint c));
    s_rc <- rc;
    e <@ __round_ref (e, a, s_rc);
    rC <- s_RC;
    rc <- (BArray192.get64 rC ((W64.to_uint c) + 1));
    s_rc <- rc;
    a <@ __round_ref (a, e, s_rc);
    c <- s_c;
    c <- (c + (W64.of_int 2));
    while ((c \ult (W64.of_int (24 - 1)))) {
      s_c <- c;
      rC <- s_RC;
      rc <- (BArray192.get64 rC (W64.to_uint c));
      s_rc <- rc;
      e <@ __round_ref (e, a, s_rc);
      rC <- s_RC;
      rc <- (BArray192.get64 rC ((W64.to_uint c) + 1));
      s_rc <- rc;
      a <@ __round_ref (a, e, s_rc);
      c <- s_c;
      c <- (c + (W64.of_int 2));
    }
    return a;
  }
  proc _keccakf1600_ref (a:BArray200.t) : BArray200.t = {
    
    a <@ __keccakf1600_ref (a);
    return a;
  }
  proc __state_init_ref (st:BArray200.t) : BArray200.t = {
    var z64:W64.t;
    var i:W64.t;
    z64 <- (W64.of_int 0);
    i <- (W64.of_int 0);
    while ((i \ult (W64.of_int 25))) {
      st <- (BArray200.set64 st (W64.to_uint i) z64);
      i <- (i + (W64.of_int 1));
    }
    return st;
  }
  proc __addratebit_ref (st:BArray200.t, rATE8:int) : BArray200.t = {
    var t64:W64.t;
    t64 <- (W64.of_int 1);
    t64 <- (t64 `<<` (W8.of_int (((8 * rATE8) - 1) %% 64)));
    t64 <- (t64 `^` (BArray200.get64 st ((rATE8 - 1) %/ 8)));
    st <- (BArray200.set64 st ((rATE8 - 1) %/ 8) t64);
    return st;
  }
  proc __mread_subu64 (buf:W64.t, lEN:int, tRAIL:int) : W64.t * int * int *
                                                        W64.t = {
    var w:W64.t;
    var iLEN:int;
    var t16:W64.t;
    var t8:W64.t;
    iLEN <- lEN;
    if ((lEN <= 0)) {
      w <- (W64.of_int (tRAIL %% 256));
      tRAIL <- 0;
    } else {
      if ((8 <= lEN)) {
        w <- (loadW64 Glob.mem (W64.to_uint (buf + (W64.of_int 0))));
        buf <- (buf + (W64.of_int 8));
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64 (loadW32 Glob.mem (W64.to_uint (buf + (W64.of_int 0))))
          );
          buf <- (buf + (W64.of_int 4));
          lEN <- (lEN - 4);
        } else {
          w <- (W64.of_int 0);
        }
        if ((2 <= lEN)) {
          t16 <-
          (zeroextu64 (loadW16 Glob.mem (W64.to_uint (buf + (W64.of_int 0))))
          );
          buf <- (buf + (W64.of_int 2));
          lEN <- (lEN - 2);
        } else {
          t16 <- (W64.of_int 0);
        }
        if (((1 <= lEN) \/ ((tRAIL %% 256) <> 0))) {
          if ((1 <= lEN)) {
            t8 <-
            (zeroextu64
            (loadW8 Glob.mem (W64.to_uint (buf + (W64.of_int 0)))));
            if (((tRAIL %% 256) <> 0)) {
              t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            } else {
              
            }
            buf <- (buf + (W64.of_int 1));
            lEN <- (lEN - 1);
          } else {
            t8 <- (W64.of_int (tRAIL %% 256));
          }
          tRAIL <- 0;
          t8 <- (t8 `<<` (W8.of_int (8 * (2 * ((iLEN %/ 2) %% 2)))));
          t16 <- (t16 `|` t8);
        } else {
          
        }
        t16 <- (t16 `<<` (W8.of_int (8 * (4 * ((iLEN %/ 4) %% 2)))));
        w <- (w `|` t16);
      }
    }
    return (buf, lEN, tRAIL, w);
  }
  proc __mwrite_subu64 (buf:W64.t, lEN:int, w:W64.t) : W64.t * int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        Glob.mem <-
        (storeW64 Glob.mem (W64.to_uint (buf + (W64.of_int 0))) w);
        buf <- (buf + (W64.of_int 8));
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          Glob.mem <-
          (storeW32 Glob.mem (W64.to_uint (buf + (W64.of_int 0)))
          (truncateu32 w));
          w <- (w `>>` (W8.of_int 32));
          buf <- (buf + (W64.of_int 4));
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          Glob.mem <-
          (storeW16 Glob.mem (W64.to_uint (buf + (W64.of_int 0)))
          (truncateu16 w));
          w <- (w `>>` (W8.of_int 16));
          buf <- (buf + (W64.of_int 2));
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          Glob.mem <-
          (storeW8 Glob.mem (W64.to_uint (buf + (W64.of_int 0)))
          (truncateu8 w));
          buf <- (buf + (W64.of_int 1));
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, lEN);
  }
  proc __addstate_imem_ref (st:BArray200.t, aT:int, buf:W64.t, lEN:int,
                            tRAILB:int) : BArray200.t * int * W64.t = {
    var aLL:int;
    var lO:int;
    var at:W64.t;
    var t:W64.t;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    var  _3:int;
    var  _4:int;
    var  _5:int;
    aLL <- (aT + lEN);
    lO <- (aT %% 8);
    at <- (W64.of_int (aT %/ 8));
    if ((0 < lO)) {
      if (((lO + lEN) < 8)) {
        if ((tRAILB <> 0)) {
          aLL <- (aLL + 1);
        } else {
          
        }
        (buf,  _2,  _3, t) <@ __mread_subu64 (buf, lEN, tRAILB);
        t <- (t `<<` (W8.of_int (8 * lO)));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        lO <- 0;
        aT <- 0;
        lEN <- 0;
        tRAILB <- 0;
      } else {
        if ((8 <= lEN)) {
          t <- (loadW64 Glob.mem (W64.to_uint (buf + (W64.of_int 0))));
          buf <- (buf + (W64.of_int (8 - lO)));
        } else {
          (buf,  _0,  _1, t) <@ __mread_subu64 (buf, (8 - lO), tRAILB);
        }
        lEN <- (lEN - (8 - lO));
        aT <- (aT + (8 - lO));
        t <- (t `<<` (W8.of_int (8 * lO)));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        at <- (at + (W64.of_int 1));
      }
    } else {
      
    }
    if ((8 <= lEN)) {
      while ((at \ult (W64.of_int ((aT %/ 8) + (lEN %/ 8))))) {
        t <- (loadW64 Glob.mem (W64.to_uint (buf + (W64.of_int 0))));
        buf <- (buf + (W64.of_int 8));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        at <- (at + (W64.of_int 1));
      }
      lEN <- ((aT + lEN) %% 8);
    } else {
      
    }
    lO <- ((aT + lEN) %% 8);
    if (((0 < lO) \/ (tRAILB <> 0))) {
      (buf,  _4,  _5, t) <@ __mread_subu64 (buf, lO, tRAILB);
      if ((tRAILB <> 0)) {
        aLL <- (aLL + 1);
        tRAILB <- 0;
      } else {
        
      }
      t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
      st <- (BArray200.set64 st (W64.to_uint at) t);
    } else {
      
    }
    return (st, aLL, buf);
  }
  proc __absorb_imem_ref (st:BArray200.t, aT:int, buf:W64.t, lEN:int,
                          rATE8:int, tRAILB:int) : BArray200.t * int * W64.t = {
    var aLL:int;
    var iTERS:int;
    var i:W64.t;
    var  _0:int;
    var  _1:int;
    aLL <- (aT + lEN);
    if (((aT + lEN) < rATE8)) {
      (st, aT, buf) <@ __addstate_imem_ref (st, aT, buf, lEN, tRAILB);
      if ((tRAILB <> 0)) {
        st <@ __addratebit_ref (st, rATE8);
      } else {
        
      }
    } else {
      if ((aT <> 0)) {
        (st,  _0, buf) <@ __addstate_imem_ref (st, aT, buf, (rATE8 - aT), 0);
        lEN <- (lEN - (rATE8 - aT));
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        aT <- 0;
      } else {
        
      }
      iTERS <- (lEN %/ rATE8);
      i <- (W64.of_int 0);
      while ((i \ult (W64.of_int iTERS))) {
        (st,  _1, buf) <@ __addstate_imem_ref (st, 0, buf, rATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        i <- (i + (W64.of_int 1));
      }
      lEN <- (aLL %% rATE8);
      (st, aT, buf) <@ __addstate_imem_ref (st, 0, buf, lEN, tRAILB);
      if ((tRAILB <> 0)) {
        st <@ __addratebit_ref (st, rATE8);
      } else {
        
      }
    }
    return (st, aT, buf);
  }
  proc __dumpstate_imem_ref (buf:W64.t, lEN:int, st:BArray200.t) : W64.t = {
    var i:W64.t;
    var t:W64.t;
    var  _0:int;
    i <- (W64.of_int 0);
    while ((i \ult (W64.of_int (lEN %/ 8)))) {
      t <- (BArray200.get64 st (W64.to_uint i));
      i <- (i + (W64.of_int 1));
      Glob.mem <- (storeW64 Glob.mem (W64.to_uint (buf + (W64.of_int 0))) t);
      buf <- (buf + (W64.of_int 8));
    }
    if ((0 < (lEN %% 8))) {
      t <- (BArray200.get64 st (W64.to_uint i));
      (buf,  _0) <@ __mwrite_subu64 (buf, (lEN %% 8), t);
    } else {
      
    }
    return buf;
  }
  proc __squeeze_imem_ref (buf:W64.t, lEN:int, st:BArray200.t, rATE8:int) : 
  W64.t * BArray200.t = {
    var iTERS:int;
    var lO:int;
    var i:W64.t;
    iTERS <- (lEN %/ rATE8);
    lO <- (lEN %% rATE8);
    if ((0 < lEN)) {
      if ((0 < iTERS)) {
        i <- (W64.of_int 0);
        while ((i \ult (W64.of_int iTERS))) {
          (* Erased call to spill *)
          st <@ _keccakf1600_ref (st);
          (* Erased call to unspill *)
          buf <@ __dumpstate_imem_ref (buf, rATE8, st);
          i <- (i + (W64.of_int 1));
        }
      } else {
        
      }
      if ((0 < lO)) {
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        buf <@ __dumpstate_imem_ref (buf, lO, st);
      } else {
        
      }
    } else {
      
    }
    return (buf, st);
  }
  proc a32____awrite_subu64 (buf:BArray32.t, offset:W64.t, dELTA:int,
                             lEN:int, w:W64.t) : BArray32.t * int * int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (BArray32.set64d buf (W64.to_uint (offset + (W64.of_int dELTA))) w);
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (BArray32.set32d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu32 w));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (BArray32.set16d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu16 w));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (BArray32.set8d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu8 w));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc a32____dumpstate_array_ref (buf:BArray32.t, offset:W64.t, lEN:int,
                                   st:BArray200.t) : BArray32.t * W64.t = {
    var i:W64.t;
    var t:W64.t;
    var  _0:int;
    var  _1:int;
    i <- (W64.of_int 0);
    while ((i \slt (W64.of_int (lEN %/ 8)))) {
      t <- (BArray200.get64 st (W64.to_uint i));
      buf <- (BArray32.set64d buf (W64.to_uint offset) t);
      i <- (i + (W64.of_int 1));
      offset <- (offset + (W64.of_int 8));
    }
    if ((0 < (lEN %% 8))) {
      t <- (BArray200.get64 st (W64.to_uint i));
      (buf,  _0,  _1) <@ a32____awrite_subu64 (buf, offset, 0, (lEN %% 8),
      t);
      offset <- (offset + (W64.of_int (lEN %% 8)));
    } else {
      
    }
    return (buf, offset);
  }
  proc a32____squeeze_array_ref (buf:BArray32.t, offset:W64.t, lEN:int,
                                 st:BArray200.t, rATE8:int) : BArray32.t *
                                                              W64.t *
                                                              BArray200.t = {
    var iTERS:int;
    var lO:int;
    var i:W64.t;
    iTERS <- (lEN %/ rATE8);
    lO <- (lEN %% rATE8);
    if ((0 < lEN)) {
      if ((0 < iTERS)) {
        i <- (W64.of_int 0);
        while ((i \ult (W64.of_int iTERS))) {
          (* Erased call to spill *)
          st <@ _keccakf1600_ref (st);
          (* Erased call to unspill *)
          (buf, offset) <@ a32____dumpstate_array_ref (buf, offset, rATE8,
          st);
          i <- (i + (W64.of_int 1));
        }
      } else {
        
      }
      if ((0 < lO)) {
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        (buf, offset) <@ a32____dumpstate_array_ref (buf, offset, lO, st);
      } else {
        
      }
    } else {
      
    }
    return (buf, offset, st);
  }
  proc a33____aread_subu64 (buf:BArray33.t, offset:W64.t, dELTA:int, lEN:int,
                            tRAIL:int) : int * int * int * W64.t = {
    var w:W64.t;
    var iLEN:int;
    var t16:W64.t;
    var t8:W64.t;
    iLEN <- lEN;
    if ((lEN <= 0)) {
      w <- (W64.of_int (tRAIL %% 256));
      tRAIL <- 0;
    } else {
      if ((8 <= lEN)) {
        w <-
        (BArray33.get64d buf (W64.to_uint (offset + (W64.of_int dELTA))));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (BArray33.get32d buf (W64.to_uint (offset + (W64.of_int dELTA)))));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          w <- (W64.of_int 0);
        }
        if ((2 <= lEN)) {
          t16 <-
          (zeroextu64
          (BArray33.get16d buf (W64.to_uint (offset + (W64.of_int dELTA)))));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          t16 <- (W64.of_int 0);
        }
        if (((1 <= lEN) \/ ((tRAIL %% 256) <> 0))) {
          if ((1 <= lEN)) {
            t8 <-
            (zeroextu64
            (BArray33.get8d buf (W64.to_uint (offset + (W64.of_int dELTA)))));
            if (((tRAIL %% 256) <> 0)) {
              t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            } else {
              
            }
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
          } else {
            t8 <- (W64.of_int (tRAIL %% 256));
          }
          tRAIL <- 0;
          t8 <- (t8 `<<` (W8.of_int (8 * (2 * ((iLEN %/ 2) %% 2)))));
          t16 <- (t16 `|` t8);
        } else {
          
        }
        t16 <- (t16 `<<` (W8.of_int (8 * (4 * ((iLEN %/ 4) %% 2)))));
        w <- (w `|` t16);
      }
    }
    return (dELTA, lEN, tRAIL, w);
  }
  proc a33____addstate_array_ref (st:BArray200.t, aT:int, buf:BArray33.t,
                                  offset:W64.t, lEN:int, tRAILB:int) : 
  BArray200.t * int * W64.t = {
    var aLL:int;
    var lO:int;
    var at:W64.t;
    var dELTA:int;
    var t:W64.t;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    var  _3:int;
    var  _4:int;
    aLL <- (aT + lEN);
    lO <- (aT %% 8);
    at <- (W64.of_int (aT %/ 8));
    dELTA <- 0;
    if ((0 < lO)) {
      if (((lO + lEN) < 8)) {
        if ((tRAILB <> 0)) {
          aLL <- (aLL + 1);
        } else {
          
        }
        (dELTA,  _2,  _3, t) <@ a33____aread_subu64 (buf, offset, dELTA, 
        lEN, tRAILB);
        t <- (t `<<` (W8.of_int (8 * lO)));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        lO <- 0;
        aT <- 0;
        lEN <- 0;
        tRAILB <- 0;
      } else {
        if ((8 <= lEN)) {
          t <-
          (BArray33.get64d buf (W64.to_uint (offset + (W64.of_int dELTA))));
          dELTA <- (dELTA + (8 - lO));
        } else {
          (dELTA,  _0,  _1, t) <@ a33____aread_subu64 (buf, offset, dELTA,
          (8 - lO), tRAILB);
        }
        lEN <- (lEN - (8 - lO));
        aT <- (aT + (8 - lO));
        t <- (t `<<` (W8.of_int (8 * lO)));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        at <- (at + (W64.of_int 1));
      }
      offset <- (offset + (W64.of_int dELTA));
      dELTA <- 0;
    } else {
      
    }
    if ((8 <= lEN)) {
      while ((at \ult (W64.of_int ((aT %/ 8) + (lEN %/ 8))))) {
        t <- (BArray33.get64d buf (W64.to_uint offset));
        offset <- (offset + (W64.of_int 8));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        at <- (at + (W64.of_int 1));
      }
      lEN <- ((aT + lEN) %% 8);
    } else {
      
    }
    lO <- ((aT + lEN) %% 8);
    if (((0 < lO) \/ (tRAILB <> 0))) {
      if ((tRAILB <> 0)) {
        aLL <- (aLL + 1);
      } else {
        
      }
      (dELTA,  _4, tRAILB, t) <@ a33____aread_subu64 (buf, offset, dELTA, 
      lO, tRAILB);
      offset <- (offset + (W64.of_int dELTA));
      t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
      st <- (BArray200.set64 st (W64.to_uint at) t);
    } else {
      
    }
    return (st, aLL, offset);
  }
  proc a33____absorb_array_ref (st:BArray200.t, aT:int, buf:BArray33.t,
                                offset:W64.t, lEN:int, rATE8:int, tRAILB:int) : 
  BArray200.t * int * W64.t = {
    var aLL:int;
    var iTERS:int;
    var i:W64.t;
    var  _0:int;
    var  _1:int;
    aLL <- (aT + lEN);
    if (((aT + lEN) < rATE8)) {
      (st, aT, offset) <@ a33____addstate_array_ref (st, aT, buf, offset,
      lEN, tRAILB);
      if ((tRAILB <> 0)) {
        st <@ __addratebit_ref (st, rATE8);
      } else {
        
      }
    } else {
      if ((aT <> 0)) {
        (st,  _0, offset) <@ a33____addstate_array_ref (st, aT, buf, 
        offset, (rATE8 - aT), 0);
        lEN <- (lEN - (rATE8 - aT));
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        aT <- 0;
      } else {
        
      }
      iTERS <- (lEN %/ rATE8);
      i <- (W64.of_int 0);
      while ((i \ult (W64.of_int iTERS))) {
        (st,  _1, offset) <@ a33____addstate_array_ref (st, 0, buf, offset,
        rATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        i <- (i + (W64.of_int 1));
      }
      lEN <- (aLL %% rATE8);
      (st, aT, offset) <@ a33____addstate_array_ref (st, 0, buf, offset, 
      lEN, tRAILB);
      if ((tRAILB <> 0)) {
        st <@ __addratebit_ref (st, rATE8);
      } else {
        
      }
    }
    return (st, aT, offset);
  }
  proc a34____aread_subu64 (buf:BArray34.t, offset:W64.t, dELTA:int, lEN:int,
                            tRAIL:int) : int * int * int * W64.t = {
    var w:W64.t;
    var iLEN:int;
    var t16:W64.t;
    var t8:W64.t;
    iLEN <- lEN;
    if ((lEN <= 0)) {
      w <- (W64.of_int (tRAIL %% 256));
      tRAIL <- 0;
    } else {
      if ((8 <= lEN)) {
        w <-
        (BArray34.get64d buf (W64.to_uint (offset + (W64.of_int dELTA))));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (BArray34.get32d buf (W64.to_uint (offset + (W64.of_int dELTA)))));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          w <- (W64.of_int 0);
        }
        if ((2 <= lEN)) {
          t16 <-
          (zeroextu64
          (BArray34.get16d buf (W64.to_uint (offset + (W64.of_int dELTA)))));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          t16 <- (W64.of_int 0);
        }
        if (((1 <= lEN) \/ ((tRAIL %% 256) <> 0))) {
          if ((1 <= lEN)) {
            t8 <-
            (zeroextu64
            (BArray34.get8d buf (W64.to_uint (offset + (W64.of_int dELTA)))));
            if (((tRAIL %% 256) <> 0)) {
              t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            } else {
              
            }
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
          } else {
            t8 <- (W64.of_int (tRAIL %% 256));
          }
          tRAIL <- 0;
          t8 <- (t8 `<<` (W8.of_int (8 * (2 * ((iLEN %/ 2) %% 2)))));
          t16 <- (t16 `|` t8);
        } else {
          
        }
        t16 <- (t16 `<<` (W8.of_int (8 * (4 * ((iLEN %/ 4) %% 2)))));
        w <- (w `|` t16);
      }
    }
    return (dELTA, lEN, tRAIL, w);
  }
  proc a34____addstate_array_ref (st:BArray200.t, aT:int, buf:BArray34.t,
                                  offset:W64.t, lEN:int, tRAILB:int) : 
  BArray200.t * int * W64.t = {
    var aLL:int;
    var lO:int;
    var at:W64.t;
    var dELTA:int;
    var t:W64.t;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    var  _3:int;
    var  _4:int;
    aLL <- (aT + lEN);
    lO <- (aT %% 8);
    at <- (W64.of_int (aT %/ 8));
    dELTA <- 0;
    if ((0 < lO)) {
      if (((lO + lEN) < 8)) {
        if ((tRAILB <> 0)) {
          aLL <- (aLL + 1);
        } else {
          
        }
        (dELTA,  _2,  _3, t) <@ a34____aread_subu64 (buf, offset, dELTA, 
        lEN, tRAILB);
        t <- (t `<<` (W8.of_int (8 * lO)));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        lO <- 0;
        aT <- 0;
        lEN <- 0;
        tRAILB <- 0;
      } else {
        if ((8 <= lEN)) {
          t <-
          (BArray34.get64d buf (W64.to_uint (offset + (W64.of_int dELTA))));
          dELTA <- (dELTA + (8 - lO));
        } else {
          (dELTA,  _0,  _1, t) <@ a34____aread_subu64 (buf, offset, dELTA,
          (8 - lO), tRAILB);
        }
        lEN <- (lEN - (8 - lO));
        aT <- (aT + (8 - lO));
        t <- (t `<<` (W8.of_int (8 * lO)));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        at <- (at + (W64.of_int 1));
      }
      offset <- (offset + (W64.of_int dELTA));
      dELTA <- 0;
    } else {
      
    }
    if ((8 <= lEN)) {
      while ((at \ult (W64.of_int ((aT %/ 8) + (lEN %/ 8))))) {
        t <- (BArray34.get64d buf (W64.to_uint offset));
        offset <- (offset + (W64.of_int 8));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        at <- (at + (W64.of_int 1));
      }
      lEN <- ((aT + lEN) %% 8);
    } else {
      
    }
    lO <- ((aT + lEN) %% 8);
    if (((0 < lO) \/ (tRAILB <> 0))) {
      if ((tRAILB <> 0)) {
        aLL <- (aLL + 1);
      } else {
        
      }
      (dELTA,  _4, tRAILB, t) <@ a34____aread_subu64 (buf, offset, dELTA, 
      lO, tRAILB);
      offset <- (offset + (W64.of_int dELTA));
      t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
      st <- (BArray200.set64 st (W64.to_uint at) t);
    } else {
      
    }
    return (st, aLL, offset);
  }
  proc a34____absorb_array_ref (st:BArray200.t, aT:int, buf:BArray34.t,
                                offset:W64.t, lEN:int, rATE8:int, tRAILB:int) : 
  BArray200.t * int * W64.t = {
    var aLL:int;
    var iTERS:int;
    var i:W64.t;
    var  _0:int;
    var  _1:int;
    aLL <- (aT + lEN);
    if (((aT + lEN) < rATE8)) {
      (st, aT, offset) <@ a34____addstate_array_ref (st, aT, buf, offset,
      lEN, tRAILB);
      if ((tRAILB <> 0)) {
        st <@ __addratebit_ref (st, rATE8);
      } else {
        
      }
    } else {
      if ((aT <> 0)) {
        (st,  _0, offset) <@ a34____addstate_array_ref (st, aT, buf, 
        offset, (rATE8 - aT), 0);
        lEN <- (lEN - (rATE8 - aT));
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        aT <- 0;
      } else {
        
      }
      iTERS <- (lEN %/ rATE8);
      i <- (W64.of_int 0);
      while ((i \ult (W64.of_int iTERS))) {
        (st,  _1, offset) <@ a34____addstate_array_ref (st, 0, buf, offset,
        rATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        i <- (i + (W64.of_int 1));
      }
      lEN <- (aLL %% rATE8);
      (st, aT, offset) <@ a34____addstate_array_ref (st, 0, buf, offset, 
      lEN, tRAILB);
      if ((tRAILB <> 0)) {
        st <@ __addratebit_ref (st, rATE8);
      } else {
        
      }
    }
    return (st, aT, offset);
  }
  proc a64____aread_subu64 (buf:BArray64.t, offset:W64.t, dELTA:int, lEN:int,
                            tRAIL:int) : int * int * int * W64.t = {
    var w:W64.t;
    var iLEN:int;
    var t16:W64.t;
    var t8:W64.t;
    iLEN <- lEN;
    if ((lEN <= 0)) {
      w <- (W64.of_int (tRAIL %% 256));
      tRAIL <- 0;
    } else {
      if ((8 <= lEN)) {
        w <-
        (BArray64.get64d buf (W64.to_uint (offset + (W64.of_int dELTA))));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (BArray64.get32d buf (W64.to_uint (offset + (W64.of_int dELTA)))));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          w <- (W64.of_int 0);
        }
        if ((2 <= lEN)) {
          t16 <-
          (zeroextu64
          (BArray64.get16d buf (W64.to_uint (offset + (W64.of_int dELTA)))));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          t16 <- (W64.of_int 0);
        }
        if (((1 <= lEN) \/ ((tRAIL %% 256) <> 0))) {
          if ((1 <= lEN)) {
            t8 <-
            (zeroextu64
            (BArray64.get8d buf (W64.to_uint (offset + (W64.of_int dELTA)))));
            if (((tRAIL %% 256) <> 0)) {
              t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            } else {
              
            }
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
          } else {
            t8 <- (W64.of_int (tRAIL %% 256));
          }
          tRAIL <- 0;
          t8 <- (t8 `<<` (W8.of_int (8 * (2 * ((iLEN %/ 2) %% 2)))));
          t16 <- (t16 `|` t8);
        } else {
          
        }
        t16 <- (t16 `<<` (W8.of_int (8 * (4 * ((iLEN %/ 4) %% 2)))));
        w <- (w `|` t16);
      }
    }
    return (dELTA, lEN, tRAIL, w);
  }
  proc a64____awrite_subu64 (buf:BArray64.t, offset:W64.t, dELTA:int,
                             lEN:int, w:W64.t) : BArray64.t * int * int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (BArray64.set64d buf (W64.to_uint (offset + (W64.of_int dELTA))) w);
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (BArray64.set32d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu32 w));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (BArray64.set16d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu16 w));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (BArray64.set8d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu8 w));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc a64____addstate_array_ref (st:BArray200.t, aT:int, buf:BArray64.t,
                                  offset:W64.t, lEN:int, tRAILB:int) : 
  BArray200.t * int * W64.t = {
    var aLL:int;
    var lO:int;
    var at:W64.t;
    var dELTA:int;
    var t:W64.t;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    var  _3:int;
    var  _4:int;
    aLL <- (aT + lEN);
    lO <- (aT %% 8);
    at <- (W64.of_int (aT %/ 8));
    dELTA <- 0;
    if ((0 < lO)) {
      if (((lO + lEN) < 8)) {
        if ((tRAILB <> 0)) {
          aLL <- (aLL + 1);
        } else {
          
        }
        (dELTA,  _2,  _3, t) <@ a64____aread_subu64 (buf, offset, dELTA, 
        lEN, tRAILB);
        t <- (t `<<` (W8.of_int (8 * lO)));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        lO <- 0;
        aT <- 0;
        lEN <- 0;
        tRAILB <- 0;
      } else {
        if ((8 <= lEN)) {
          t <-
          (BArray64.get64d buf (W64.to_uint (offset + (W64.of_int dELTA))));
          dELTA <- (dELTA + (8 - lO));
        } else {
          (dELTA,  _0,  _1, t) <@ a64____aread_subu64 (buf, offset, dELTA,
          (8 - lO), tRAILB);
        }
        lEN <- (lEN - (8 - lO));
        aT <- (aT + (8 - lO));
        t <- (t `<<` (W8.of_int (8 * lO)));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        at <- (at + (W64.of_int 1));
      }
      offset <- (offset + (W64.of_int dELTA));
      dELTA <- 0;
    } else {
      
    }
    if ((8 <= lEN)) {
      while ((at \ult (W64.of_int ((aT %/ 8) + (lEN %/ 8))))) {
        t <- (BArray64.get64d buf (W64.to_uint offset));
        offset <- (offset + (W64.of_int 8));
        t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
        st <- (BArray200.set64 st (W64.to_uint at) t);
        at <- (at + (W64.of_int 1));
      }
      lEN <- ((aT + lEN) %% 8);
    } else {
      
    }
    lO <- ((aT + lEN) %% 8);
    if (((0 < lO) \/ (tRAILB <> 0))) {
      if ((tRAILB <> 0)) {
        aLL <- (aLL + 1);
      } else {
        
      }
      (dELTA,  _4, tRAILB, t) <@ a64____aread_subu64 (buf, offset, dELTA, 
      lO, tRAILB);
      offset <- (offset + (W64.of_int dELTA));
      t <- (t `^` (BArray200.get64 st (W64.to_uint at)));
      st <- (BArray200.set64 st (W64.to_uint at) t);
    } else {
      
    }
    return (st, aLL, offset);
  }
  proc a64____absorb_array_ref (st:BArray200.t, aT:int, buf:BArray64.t,
                                offset:W64.t, lEN:int, rATE8:int, tRAILB:int) : 
  BArray200.t * int * W64.t = {
    var aLL:int;
    var iTERS:int;
    var i:W64.t;
    var  _0:int;
    var  _1:int;
    aLL <- (aT + lEN);
    if (((aT + lEN) < rATE8)) {
      (st, aT, offset) <@ a64____addstate_array_ref (st, aT, buf, offset,
      lEN, tRAILB);
      if ((tRAILB <> 0)) {
        st <@ __addratebit_ref (st, rATE8);
      } else {
        
      }
    } else {
      if ((aT <> 0)) {
        (st,  _0, offset) <@ a64____addstate_array_ref (st, aT, buf, 
        offset, (rATE8 - aT), 0);
        lEN <- (lEN - (rATE8 - aT));
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        aT <- 0;
      } else {
        
      }
      iTERS <- (lEN %/ rATE8);
      i <- (W64.of_int 0);
      while ((i \ult (W64.of_int iTERS))) {
        (st,  _1, offset) <@ a64____addstate_array_ref (st, 0, buf, offset,
        rATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        i <- (i + (W64.of_int 1));
      }
      lEN <- (aLL %% rATE8);
      (st, aT, offset) <@ a64____addstate_array_ref (st, 0, buf, offset, 
      lEN, tRAILB);
      if ((tRAILB <> 0)) {
        st <@ __addratebit_ref (st, rATE8);
      } else {
        
      }
    }
    return (st, aT, offset);
  }
  proc a64____dumpstate_array_ref (buf:BArray64.t, offset:W64.t, lEN:int,
                                   st:BArray200.t) : BArray64.t * W64.t = {
    var i:W64.t;
    var t:W64.t;
    var  _0:int;
    var  _1:int;
    i <- (W64.of_int 0);
    while ((i \slt (W64.of_int (lEN %/ 8)))) {
      t <- (BArray200.get64 st (W64.to_uint i));
      buf <- (BArray64.set64d buf (W64.to_uint offset) t);
      i <- (i + (W64.of_int 1));
      offset <- (offset + (W64.of_int 8));
    }
    if ((0 < (lEN %% 8))) {
      t <- (BArray200.get64 st (W64.to_uint i));
      (buf,  _0,  _1) <@ a64____awrite_subu64 (buf, offset, 0, (lEN %% 8),
      t);
      offset <- (offset + (W64.of_int (lEN %% 8)));
    } else {
      
    }
    return (buf, offset);
  }
  proc a64____squeeze_array_ref (buf:BArray64.t, offset:W64.t, lEN:int,
                                 st:BArray200.t, rATE8:int) : BArray64.t *
                                                              W64.t *
                                                              BArray200.t = {
    var iTERS:int;
    var lO:int;
    var i:W64.t;
    iTERS <- (lEN %/ rATE8);
    lO <- (lEN %% rATE8);
    if ((0 < lEN)) {
      if ((0 < iTERS)) {
        i <- (W64.of_int 0);
        while ((i \ult (W64.of_int iTERS))) {
          (* Erased call to spill *)
          st <@ _keccakf1600_ref (st);
          (* Erased call to unspill *)
          (buf, offset) <@ a64____dumpstate_array_ref (buf, offset, rATE8,
          st);
          i <- (i + (W64.of_int 1));
        }
      } else {
        
      }
      if ((0 < lO)) {
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        (buf, offset) <@ a64____dumpstate_array_ref (buf, offset, lO, st);
      } else {
        
      }
    } else {
      
    }
    return (buf, offset, st);
  }
  proc a128____awrite_subu64 (buf:BArray128.t, offset:W64.t, dELTA:int,
                              lEN:int, w:W64.t) : BArray128.t * int * int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (BArray128.set64d buf (W64.to_uint (offset + (W64.of_int dELTA))) w);
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (BArray128.set32d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu32 w));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (BArray128.set16d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu16 w));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (BArray128.set8d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu8 w));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc a128____dumpstate_array_ref (buf:BArray128.t, offset:W64.t, lEN:int,
                                    st:BArray200.t) : BArray128.t * W64.t = {
    var i:W64.t;
    var t:W64.t;
    var  _0:int;
    var  _1:int;
    i <- (W64.of_int 0);
    while ((i \slt (W64.of_int (lEN %/ 8)))) {
      t <- (BArray200.get64 st (W64.to_uint i));
      buf <- (BArray128.set64d buf (W64.to_uint offset) t);
      i <- (i + (W64.of_int 1));
      offset <- (offset + (W64.of_int 8));
    }
    if ((0 < (lEN %% 8))) {
      t <- (BArray200.get64 st (W64.to_uint i));
      (buf,  _0,  _1) <@ a128____awrite_subu64 (buf, offset, 0, (lEN %% 8),
      t);
      offset <- (offset + (W64.of_int (lEN %% 8)));
    } else {
      
    }
    return (buf, offset);
  }
  proc a128____squeeze_array_ref (buf:BArray128.t, offset:W64.t, lEN:int,
                                  st:BArray200.t, rATE8:int) : BArray128.t *
                                                               W64.t *
                                                               BArray200.t = {
    var iTERS:int;
    var lO:int;
    var i:W64.t;
    iTERS <- (lEN %/ rATE8);
    lO <- (lEN %% rATE8);
    if ((0 < lEN)) {
      if ((0 < iTERS)) {
        i <- (W64.of_int 0);
        while ((i \ult (W64.of_int iTERS))) {
          (* Erased call to spill *)
          st <@ _keccakf1600_ref (st);
          (* Erased call to unspill *)
          (buf, offset) <@ a128____dumpstate_array_ref (buf, offset, 
          rATE8, st);
          i <- (i + (W64.of_int 1));
        }
      } else {
        
      }
      if ((0 < lO)) {
        (* Erased call to spill *)
        st <@ _keccakf1600_ref (st);
        (* Erased call to unspill *)
        (buf, offset) <@ a128____dumpstate_array_ref (buf, offset, lO, st);
      } else {
        
      }
    } else {
      
    }
    return (buf, offset, st);
  }
  proc a168____awrite_subu64 (buf:BArray168.t, offset:W64.t, dELTA:int,
                              lEN:int, w:W64.t) : BArray168.t * int * int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (BArray168.set64d buf (W64.to_uint (offset + (W64.of_int dELTA))) w);
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (BArray168.set32d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu32 w));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (BArray168.set16d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu16 w));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (BArray168.set8d buf (W64.to_uint (offset + (W64.of_int dELTA)))
          (truncateu8 w));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc a168____dumpstate_array_ref (buf:BArray168.t, offset:W64.t, lEN:int,
                                    st:BArray200.t) : BArray168.t * W64.t = {
    var i:W64.t;
    var t:W64.t;
    var  _0:int;
    var  _1:int;
    i <- (W64.of_int 0);
    while ((i \slt (W64.of_int (lEN %/ 8)))) {
      t <- (BArray200.get64 st (W64.to_uint i));
      buf <- (BArray168.set64d buf (W64.to_uint offset) t);
      i <- (i + (W64.of_int 1));
      offset <- (offset + (W64.of_int 8));
    }
    if ((0 < (lEN %% 8))) {
      t <- (BArray200.get64 st (W64.to_uint i));
      (buf,  _0,  _1) <@ a168____awrite_subu64 (buf, offset, 0, (lEN %% 8),
      t);
      offset <- (offset + (W64.of_int (lEN %% 8)));
    } else {
      
    }
    return (buf, offset);
  }
  proc _shake256_128_33 (out:BArray128.t, in_0:BArray33.t) : BArray128.t = {
    var aux:BArray128.t;
    var aux_1:BArray200.t;
    var aux_0:W64.t;
    var st_s:BArray200.t;
    var st:BArray200.t;
    var offset:W64.t;
    var  _0:int;
    var  _1:W64.t;
    var  _2:W64.t;
    var  _3:BArray200.t;
     _3 <- witness;
    st <- witness;
    st_s <- witness;
    (* Erased call to spill *)
    st <- st_s;
    st <@ __state_init_ref (st);
    offset <- (W64.of_int 0);
    (st,  _0,  _1) <@ a33____absorb_array_ref (st, 0, in_0, offset, 33, 136,
    31);
    offset <- (W64.of_int 0);
    (* Erased call to unspill *)
    (aux, aux_0, aux_1) <@ a128____squeeze_array_ref (out, offset, 128, 
    st, 136);
    out <- aux;
     _2 <- aux_0;
     _3 <- aux_1;
    return out;
  }
  proc _shake256_1120_32 (out:W64.t, in0:W64.t, in1:W64.t) : unit = {
    var aux_0:BArray200.t;
    var aux:W64.t;
    var st_s:BArray200.t;
    var st:BArray200.t;
    var  _0:int;
    var  _1:W64.t;
    var  _2:int;
    var  _3:W64.t;
    var  _4:W64.t;
    var  _5:BArray200.t;
     _5 <- witness;
    st <- witness;
    st_s <- witness;
    (* Erased call to spill *)
    st <- st_s;
    st <@ __state_init_ref (st);
    (st,  _0,  _1) <@ __absorb_imem_ref (st, 0, in0, 32, 136, 0);
    (st,  _2,  _3) <@ __absorb_imem_ref (st, 32, in1, 1088, 136, 31);
    (* Erased call to unspill *)
    (aux, aux_0) <@ __squeeze_imem_ref (out, 32, st, 136);
     _4 <- aux;
     _5 <- aux_0;
    return ();
  }
  proc _sha3512_33 (out:BArray64.t, in_0:BArray33.t) : BArray64.t = {
    var aux_1:BArray200.t;
    var aux:BArray64.t;
    var aux_0:W64.t;
    var st_s:BArray200.t;
    var st:BArray200.t;
    var offset:W64.t;
    var  _0:int;
    var  _1:W64.t;
    var  _2:W64.t;
    var  _3:BArray200.t;
     _3 <- witness;
    st <- witness;
    st_s <- witness;
    (* Erased call to spill *)
    st <- st_s;
    st <@ __state_init_ref (st);
    offset <- (W64.of_int 0);
    (st,  _0,  _1) <@ a33____absorb_array_ref (st, 0, in_0, offset, 33, 72,
    6);
    offset <- (W64.of_int 0);
    (* Erased call to unspill *)
    (aux, aux_0, aux_1) <@ a64____squeeze_array_ref (out, offset, 64, 
    st, 72);
    out <- aux;
     _2 <- aux_0;
     _3 <- aux_1;
    return out;
  }
  proc _shake128_absorb34 (st:BArray200.t, in_0:BArray34.t) : BArray200.t = {
    var offset:W64.t;
    var  _0:int;
    var  _1:W64.t;
    st <@ __state_init_ref (st);
    offset <- (W64.of_int 0);
    (st,  _0,  _1) <@ a34____absorb_array_ref (st, 0, in_0, offset, 34, 168,
    31);
    return st;
  }
  proc _shake128_squeezeblock (st:BArray200.t, out:BArray168.t) : BArray200.t *
                                                                  BArray168.t = {
    var offset:W64.t;
    var  _0:W64.t;
    (* Erased call to spill *)
    st <@ _keccakf1600_ref (st);
    (* Erased call to unspill *)
    offset <- (W64.of_int 0);
    (out,  _0) <@ a168____dumpstate_array_ref (out, offset, 168, st);
    return (st, out);
  }
  proc _isha3_256_M1184 (out:BArray32.t, in_0:W64.t) : BArray32.t = {
    var aux_1:BArray200.t;
    var aux:BArray32.t;
    var aux_0:W64.t;
    var st_s:BArray200.t;
    var st:BArray200.t;
    var offset:W64.t;
    var  _0:int;
    var  _1:W64.t;
    var  _2:W64.t;
    var  _3:BArray200.t;
     _3 <- witness;
    st <- witness;
    st_s <- witness;
    (* Erased call to spill *)
    st <- st_s;
    st <@ __state_init_ref (st);
    (st,  _0,  _1) <@ __absorb_imem_ref (st, 0, in_0, 1184, 136, 6);
    offset <- (W64.of_int 0);
    (* Erased call to unspill *)
    (aux, aux_0, aux_1) <@ a32____squeeze_array_ref (out, offset, 32, 
    st, 136);
    out <- aux;
     _2 <- aux_0;
     _3 <- aux_1;
    return out;
  }
  proc _sha3_512_64 (out:BArray64.t, in_0:BArray64.t) : BArray64.t = {
    var aux_1:BArray200.t;
    var aux:BArray64.t;
    var aux_0:W64.t;
    var st_s:BArray200.t;
    var st:BArray200.t;
    var offset:W64.t;
    var  _0:int;
    var  _1:W64.t;
    var  _2:W64.t;
    var  _3:BArray200.t;
     _3 <- witness;
    st <- witness;
    st_s <- witness;
    (* Erased call to spill *)
    st <- st_s;
    st <@ __state_init_ref (st);
    offset <- (W64.of_int 0);
    (st,  _0,  _1) <@ a64____absorb_array_ref (st, 0, in_0, offset, 64, 72,
    6);
    offset <- (W64.of_int 0);
    (* Erased call to unspill *)
    (aux, aux_0, aux_1) <@ a64____squeeze_array_ref (out, offset, 64, 
    st, 72);
    out <- aux;
     _2 <- aux_0;
     _3 <- aux_1;
    return out;
  }
  proc _poly_add2 (rp:BArray512.t, bp:BArray512.t) : BArray512.t = {
    var i:W64.t;
    var a:W16.t;
    var b:W16.t;
    var r:W16.t;
    i <- (W64.of_int 0);
    while ((i \ult (W64.of_int 256))) {
      a <- (BArray512.get16 rp (W64.to_uint i));
      b <- (BArray512.get16 bp (W64.to_uint i));
      r <- (a + b);
      rp <- (BArray512.set16 rp (W64.to_uint i) r);
      i <- (i + (W64.of_int 1));
    }
    return rp;
  }
  proc _poly_csubq (rp:BArray512.t) : BArray512.t = {
    var i:W64.t;
    var t:W16.t;
    var b:W16.t;
    i <- (W64.of_int 0);
    while ((i \ult (W64.of_int 256))) {
      t <- (BArray512.get16 rp (W64.to_uint i));
      t <- (t - (W16.of_int 3329));
      b <- t;
      b <- (b `|>>` (W8.of_int 15));
      b <- (b `&` (W16.of_int 3329));
      t <- (t + b);
      rp <- (BArray512.set16 rp (W64.to_uint i) t);
      i <- (i + (W64.of_int 1));
    }
    return rp;
  }
  proc _poly_basemul (rp:BArray512.t, ap:BArray512.t, bp:BArray512.t) : 
  BArray512.t = {
    var srp:BArray512.t;
    var i:W64.t;
    var zetasp:BArray128.t;
    var zetasctr:W64.t;
    var zeta_0:W16.t;
    var a0:W16.t;
    var b0:W16.t;
    var a1:W16.t;
    var b1:W16.t;
    var r0:W16.t;
    var t:W16.t;
    var r1:W16.t;
    srp <- witness;
    zetasp <- witness;
    srp <- rp;
    i <- (W64.of_int 0);
    while ((i \ult (W64.of_int (256 - 3)))) {
      zetasp <- (SBArray256_128.get_sub16 jzetas 64);
      zetasctr <- i;
      zetasctr <- (zetasctr `>>` (W8.of_int 2));
      zeta_0 <- (BArray128.get16 zetasp (W64.to_uint zetasctr));
      a0 <- (BArray512.get16 ap (W64.to_uint i));
      b0 <- (BArray512.get16 bp (W64.to_uint i));
      i <- (i + (W64.of_int 1));
      a1 <- (BArray512.get16 ap (W64.to_uint i));
      b1 <- (BArray512.get16 bp (W64.to_uint i));
      i <- (i - (W64.of_int 1));
      r0 <@ __fqmul (a1, b1);
      r0 <@ __fqmul (r0, zeta_0);
      t <@ __fqmul (a0, b0);
      r0 <- (r0 + t);
      r1 <@ __fqmul (a0, b1);
      t <@ __fqmul (a1, b0);
      r1 <- (r1 + t);
      rp <- srp;
      rp <- (BArray512.set16 rp (W64.to_uint i) r0);
      i <- (i + (W64.of_int 1));
      rp <- (BArray512.set16 rp (W64.to_uint i) r1);
      srp <- rp;
      zeta_0 <- (- zeta_0);
      i <- (i + (W64.of_int 1));
      a0 <- (BArray512.get16 ap (W64.to_uint i));
      b0 <- (BArray512.get16 bp (W64.to_uint i));
      i <- (i + (W64.of_int 1));
      a1 <- (BArray512.get16 ap (W64.to_uint i));
      b1 <- (BArray512.get16 bp (W64.to_uint i));
      i <- (i - (W64.of_int 1));
      r0 <@ __fqmul (a1, b1);
      r0 <@ __fqmul (r0, zeta_0);
      t <@ __fqmul (a0, b0);
      r0 <- (r0 + t);
      r1 <@ __fqmul (a0, b1);
      t <@ __fqmul (a1, b0);
      r1 <- (r1 + t);
      rp <- srp;
      rp <- (BArray512.set16 rp (W64.to_uint i) r0);
      i <- (i + (W64.of_int 1));
      rp <- (BArray512.set16 rp (W64.to_uint i) r1);
      srp <- rp;
      i <- (i + (W64.of_int 1));
    }
    return rp;
  }
  proc __poly_reduce (rp:BArray512.t) : BArray512.t = {
    var j:W64.t;
    var t:W16.t;
    j <- (W64.of_int 0);
    while ((j \ult (W64.of_int 256))) {
      t <- (BArray512.get16 rp (W64.to_uint j));
      t <@ __barrett_reduce (t);
      rp <- (BArray512.set16 rp (W64.to_uint j) t);
      j <- (j + (W64.of_int 1));
    }
    return rp;
  }
  proc _poly_compress (rp:W64.t, a:BArray512.t) : BArray512.t = {
    var i:W64.t;
    var d0:W32.t;
    var d1:W32.t;
    a <@ _poly_csubq (a);
    i <- (W64.of_int 0);
    while ((i \ult (W64.of_int 128))) {
      d0 <-
      (zeroextu32 (BArray512.get16 a (W64.to_uint ((W64.of_int 2) * i))));
      d1 <-
      (zeroextu32
      (BArray512.get16 a
      (W64.to_uint (((W64.of_int 2) * i) + (W64.of_int 1)))));
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
      Glob.mem <- (storeW8 Glob.mem (W64.to_uint (rp + i)) (truncateu8 d0));
      i <- (i + (W64.of_int 1));
    }
    return a;
  }
  proc _i_poly_compress (rp:BArray128.t, a:BArray512.t) : BArray128.t *
                                                          BArray512.t = {
    var i:W64.t;
    var d0:W32.t;
    var d1:W32.t;
    a <@ _poly_csubq (a);
    i <- (W64.of_int 0);
    while ((i \ult (W64.of_int 128))) {
      d0 <-
      (zeroextu32 (BArray512.get16 a (W64.to_uint ((W64.of_int 2) * i))));
      d1 <-
      (zeroextu32
      (BArray512.get16 a
      (W64.to_uint (((W64.of_int 2) * i) + (W64.of_int 1)))));
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
      rp <- (BArray128.set8 rp (W64.to_uint i) (truncateu8 d0));
      i <- (i + (W64.of_int 1));
    }
    return (rp, a);
  }
  proc _poly_decompress (rp:BArray512.t, ap:W64.t) : BArray512.t = {
    var i:W64.t;
    var t:W8.t;
    var d0:W16.t;
    var d1:W16.t;
    i <- (W64.of_int 0);
    while ((i \ult (W64.of_int 128))) {
      t <- (loadW8 Glob.mem (W64.to_uint (ap + i)));
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
      rp <- (BArray512.set16 rp (W64.to_uint ((W64.of_int 2) * i)) d0);
      rp <-
      (BArray512.set16 rp
      (W64.to_uint (((W64.of_int 2) * i) + (W64.of_int 1))) d1);
      i <- (i + (W64.of_int 1));
    }
    return rp;
  }
  proc _poly_frombytes (rp:BArray512.t, ap:W64.t) : BArray512.t = {
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
      rp <- (BArray512.set16 rp (2 * i) d0);
      rp <- (BArray512.set16 rp ((2 * i) + 1) d1);
      i <- (i + 1);
    }
    return rp;
  }
  proc _poly_frommont (rp:BArray512.t) : BArray512.t = {
    var dmont:W16.t;
    var i:W64.t;
    var r:W16.t;
    dmont <- (W16.of_int 1353);
    i <- (W64.of_int 0);
    while ((i \ult (W64.of_int 256))) {
      r <- (BArray512.get16 rp (W64.to_uint i));
      r <@ __fqmul (r, dmont);
      rp <- (BArray512.set16 rp (W64.to_uint i) r);
      i <- (i + (W64.of_int 1));
    }
    return rp;
  }
  proc _i_poly_frommsg (rp:BArray512.t, ap:BArray32.t) : BArray512.t = {
    var i:int;
    var c:W8.t;
    var t:W16.t;
    i <- 0;
    while ((i < 32)) {
      c <- (BArray32.get8 ap i);
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp <- (BArray512.set16 rp (8 * i) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp <- (BArray512.set16 rp ((8 * i) + 1) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp <- (BArray512.set16 rp ((8 * i) + 2) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp <- (BArray512.set16 rp ((8 * i) + 3) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp <- (BArray512.set16 rp ((8 * i) + 4) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp <- (BArray512.set16 rp ((8 * i) + 5) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp <- (BArray512.set16 rp ((8 * i) + 6) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp <- (BArray512.set16 rp ((8 * i) + 7) t);
      c <- (c `>>` (W8.of_int 1));
      i <- (i + 1);
    }
    return rp;
  }
  proc _poly_getnoise (rp:BArray512.t, s_seed:BArray32.t, nonce:W8.t) : 
  BArray512.t = {
    var seed:BArray32.t;
    var k:int;
    var c:W8.t;
    var extseed:BArray33.t;
    var buf:BArray128.t;
    var i:W64.t;
    var a:W8.t;
    var b:W8.t;
    var t:W16.t;
    buf <- witness;
    extseed <- witness;
    seed <- witness;
    (* Erased call to spill *)
    seed <- s_seed;
    k <- 0;
    while ((k < 32)) {
      c <- (BArray32.get8 seed k);
      extseed <- (BArray33.set8 extseed k c);
      k <- (k + 1);
    }
    extseed <- (BArray33.set8 extseed 32 nonce);
    buf <@ _shake256_128_33 (buf, extseed);
    (* Erased call to unspill *)
    i <- (W64.of_int 0);
    while ((i \ult (W64.of_int 128))) {
      c <- (BArray128.get8 buf (W64.to_uint i));
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
      rp <- (BArray512.set16 rp (W64.to_uint ((W64.of_int 2) * i)) t);
      a <- c;
      a <- (a `>>` (W8.of_int 4));
      a <- (a `&` (W8.of_int 3));
      b <- (c `>>` (W8.of_int 6));
      b <- (b `&` (W8.of_int 3));
      a <- (a - b);
      t <- (sigextu16 a);
      rp <-
      (BArray512.set16 rp
      (W64.to_uint (((W64.of_int 2) * i) + (W64.of_int 1))) t);
      i <- (i + (W64.of_int 1));
    }
    return rp;
  }
  proc _poly_invntt (rp:BArray512.t) : BArray512.t = {
    var zetasp:BArray256.t;
    var zetasctr:W64.t;
    var len:W64.t;
    var start:W64.t;
    var zeta_0:W16.t;
    var j:W64.t;
    var cmp:W64.t;
    var t:W16.t;
    var offset:W64.t;
    var s:W16.t;
    var m:W16.t;
    zetasp <- witness;
    zetasp <- jzetas_inv;
    zetasctr <- (W64.of_int 0);
    len <- (W64.of_int 2);
    while ((len \ule (W64.of_int 128))) {
      start <- (W64.of_int 0);
      while ((start \ult (W64.of_int 256))) {
        zeta_0 <- (BArray256.get16 zetasp (W64.to_uint zetasctr));
        zetasctr <- (zetasctr + (W64.of_int 1));
        j <- start;
        cmp <- start;
        cmp <- (cmp + len);
        while ((j \ult cmp)) {
          t <- (BArray512.get16 rp (W64.to_uint j));
          offset <- j;
          offset <- (offset + len);
          s <- (BArray512.get16 rp (W64.to_uint offset));
          m <- s;
          m <- (m + t);
          m <@ __barrett_reduce (m);
          rp <- (BArray512.set16 rp (W64.to_uint j) m);
          t <- (t - s);
          t <@ __fqmul (t, zeta_0);
          rp <- (BArray512.set16 rp (W64.to_uint offset) t);
          j <- (j + (W64.of_int 1));
        }
        start <- j;
        start <- (start + len);
      }
      len <- (len `<<` (W8.of_int 1));
    }
    zeta_0 <- (BArray256.get16 zetasp 127);
    j <- (W64.of_int 0);
    while ((j \ult (W64.of_int 256))) {
      t <- (BArray512.get16 rp (W64.to_uint j));
      t <@ __fqmul (t, zeta_0);
      rp <- (BArray512.set16 rp (W64.to_uint j) t);
      j <- (j + (W64.of_int 1));
    }
    return rp;
  }
  proc _poly_ntt (rp:BArray512.t) : BArray512.t = {
    var zetasp:BArray256.t;
    var zetasctr:W64.t;
    var len:W64.t;
    var start:W64.t;
    var zeta_0:W16.t;
    var j:W64.t;
    var cmp:W64.t;
    var s:W16.t;
    var m:W16.t;
    var offset:W64.t;
    var t:W16.t;
    zetasp <- witness;
    zetasp <- jzetas;
    zetasctr <- (W64.of_int 0);
    len <- (W64.of_int 128);
    while (((W64.of_int 2) \ule len)) {
      start <- (W64.of_int 0);
      while ((start \ult (W64.of_int 256))) {
        zetasctr <- (zetasctr + (W64.of_int 1));
        zeta_0 <- (BArray256.get16 zetasp (W64.to_uint zetasctr));
        j <- start;
        cmp <- start;
        cmp <- (cmp + len);
        while ((j \ult cmp)) {
          s <- (BArray512.get16 rp (W64.to_uint j));
          m <- s;
          offset <- j;
          offset <- (offset + len);
          t <- (BArray512.get16 rp (W64.to_uint offset));
          t <@ __fqmul (t, zeta_0);
          m <- (m - t);
          t <- (t + s);
          rp <- (BArray512.set16 rp (W64.to_uint offset) m);
          rp <- (BArray512.set16 rp (W64.to_uint j) t);
          j <- (j + (W64.of_int 1));
        }
        start <- j;
        start <- (start + len);
      }
      len <- (len `>>` (W8.of_int 1));
    }
    rp <@ __poly_reduce (rp);
    return rp;
  }
  proc _poly_sub (rp:BArray512.t, ap:BArray512.t, bp:BArray512.t) : BArray512.t = {
    var i:W64.t;
    var a:W16.t;
    var b:W16.t;
    var r:W16.t;
    i <- (W64.of_int 0);
    while ((i \ult (W64.of_int 256))) {
      a <- (BArray512.get16 ap (W64.to_uint i));
      b <- (BArray512.get16 bp (W64.to_uint i));
      r <- (a - b);
      rp <- (BArray512.set16 rp (W64.to_uint i) r);
      i <- (i + (W64.of_int 1));
    }
    return rp;
  }
  proc _poly_tobytes (rp:W64.t, a:BArray512.t) : BArray512.t = {
    var i:W64.t;
    var j:W64.t;
    var t0:W16.t;
    var t1:W16.t;
    var d:W16.t;
    a <@ _poly_csubq (a);
    i <- (W64.of_int 0);
    j <- (W64.of_int 0);
    while ((i \ult (W64.of_int 256))) {
      t0 <- (BArray512.get16 a (W64.to_uint i));
      i <- (i + (W64.of_int 1));
      t1 <- (BArray512.get16 a (W64.to_uint i));
      i <- (i + (W64.of_int 1));
      d <- t0;
      d <- (d `&` (W16.of_int 255));
      Glob.mem <- (storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 d));
      j <- (j + (W64.of_int 1));
      t0 <- (t0 `>>` (W8.of_int 8));
      d <- t1;
      d <- (d `&` (W16.of_int 15));
      d <- (d `<<` (W8.of_int 4));
      d <- (d `|` t0);
      Glob.mem <- (storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 d));
      j <- (j + (W64.of_int 1));
      t1 <- (t1 `>>` (W8.of_int 4));
      Glob.mem <- (storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 t1));
      j <- (j + (W64.of_int 1));
    }
    return a;
  }
  proc _i_poly_tomsg (rp:BArray32.t, a:BArray512.t) : BArray32.t *
                                                      BArray512.t = {
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
        t <- (BArray512.get16 a ((8 * i) + j));
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
      rp <- (BArray32.set8 rp i r);
      i <- (i + 1);
    }
    return (rp, a);
  }
  proc __polyvec_add2 (r:BArray1536.t, b:BArray1536.t) : BArray1536.t = {
    var aux:BArray512.t;
    aux <@ _poly_add2 ((SBArray1536_512.get_sub16 r 0),
    (SBArray1536_512.get_sub16 b 0));
    r <- (SBArray1536_512.set_sub16 r 0 aux);
    aux <@ _poly_add2 ((SBArray1536_512.get_sub16 r 256),
    (SBArray1536_512.get_sub16 b 256));
    r <- (SBArray1536_512.set_sub16 r 256 aux);
    aux <@ _poly_add2 ((SBArray1536_512.get_sub16 r (2 * 256)),
    (SBArray1536_512.get_sub16 b (2 * 256)));
    r <- (SBArray1536_512.set_sub16 r (2 * 256) aux);
    return r;
  }
  proc __polyvec_csubq (r:BArray1536.t) : BArray1536.t = {
    var aux:BArray512.t;
    aux <@ _poly_csubq ((SBArray1536_512.get_sub16 r 0));
    r <- (SBArray1536_512.set_sub16 r 0 aux);
    aux <@ _poly_csubq ((SBArray1536_512.get_sub16 r 256));
    r <- (SBArray1536_512.set_sub16 r 256 aux);
    aux <@ _poly_csubq ((SBArray1536_512.get_sub16 r (2 * 256)));
    r <- (SBArray1536_512.set_sub16 r (2 * 256) aux);
    return r;
  }
  proc __polyvec_compress (rp:W64.t, a:BArray1536.t) : unit = {
    var i:W64.t;
    var j:W64.t;
    var aa:BArray1536.t;
    var k:int;
    var t:BArray32.t;
    var c:W16.t;
    var b:W16.t;
    aa <- witness;
    t <- witness;
    i <- (W64.of_int 0);
    j <- (W64.of_int 0);
    aa <@ __polyvec_csubq (a);
    while ((i \ult (W64.of_int ((3 * 256) - 3)))) {
      k <- 0;
      while ((k < 4)) {
        t <-
        (BArray32.set64 t k
        (zeroextu64 (BArray1536.get16 aa (W64.to_uint i))));
        i <- (i + (W64.of_int 1));
        t <- (BArray32.set64 t k ((BArray32.get64 t k) `<<` (W8.of_int 10)));
        t <- (BArray32.set64 t k ((BArray32.get64 t k) + (W64.of_int 1665)));
        t <-
        (BArray32.set64 t k ((BArray32.get64 t k) * (W64.of_int 1290167)));
        t <- (BArray32.set64 t k ((BArray32.get64 t k) `>>` (W8.of_int 32)));
        t <-
        (BArray32.set64 t k ((BArray32.get64 t k) `&` (W64.of_int 1023)));
        k <- (k + 1);
      }
      c <- (truncateu16 (BArray32.get64 t 0));
      c <- (c `&` (W16.of_int 255));
      Glob.mem <- (storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 c));
      j <- (j + (W64.of_int 1));
      b <- (truncateu16 (BArray32.get64 t 0));
      b <- (b `>>` (W8.of_int 8));
      c <- (truncateu16 (BArray32.get64 t 1));
      c <- (c `<<` (W8.of_int 2));
      c <- (c `|` b);
      Glob.mem <- (storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 c));
      j <- (j + (W64.of_int 1));
      b <- (truncateu16 (BArray32.get64 t 1));
      b <- (b `>>` (W8.of_int 6));
      c <- (truncateu16 (BArray32.get64 t 2));
      c <- (c `<<` (W8.of_int 4));
      c <- (c `|` b);
      Glob.mem <- (storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 c));
      j <- (j + (W64.of_int 1));
      b <- (truncateu16 (BArray32.get64 t 2));
      b <- (b `>>` (W8.of_int 4));
      c <- (truncateu16 (BArray32.get64 t 3));
      c <- (c `<<` (W8.of_int 6));
      c <- (c `|` b);
      Glob.mem <- (storeW8 Glob.mem (W64.to_uint (rp + j)) (truncateu8 c));
      j <- (j + (W64.of_int 1));
      t <- (BArray32.set64 t 3 ((BArray32.get64 t 3) `>>` (W8.of_int 2)));
      Glob.mem <-
      (storeW8 Glob.mem (W64.to_uint (rp + j))
      (truncateu8 (BArray32.get64 t 3)));
      j <- (j + (W64.of_int 1));
    }
    return ();
  }
  proc __i_polyvec_compress (rp:BArray960.t, a:BArray1536.t) : BArray960.t = {
    var i:W64.t;
    var j:W64.t;
    var aa:BArray1536.t;
    var k:int;
    var t:BArray32.t;
    var c:W16.t;
    var b:W16.t;
    aa <- witness;
    t <- witness;
    i <- (W64.of_int 0);
    j <- (W64.of_int 0);
    aa <@ __polyvec_csubq (a);
    while ((i \ult (W64.of_int ((3 * 256) - 3)))) {
      k <- 0;
      while ((k < 4)) {
        t <-
        (BArray32.set64 t k
        (zeroextu64 (BArray1536.get16 aa (W64.to_uint i))));
        i <- (i + (W64.of_int 1));
        t <- (BArray32.set64 t k ((BArray32.get64 t k) `<<` (W8.of_int 10)));
        t <- (BArray32.set64 t k ((BArray32.get64 t k) + (W64.of_int 1665)));
        t <-
        (BArray32.set64 t k ((BArray32.get64 t k) * (W64.of_int 1290167)));
        t <- (BArray32.set64 t k ((BArray32.get64 t k) `>>` (W8.of_int 32)));
        t <-
        (BArray32.set64 t k ((BArray32.get64 t k) `&` (W64.of_int 1023)));
        k <- (k + 1);
      }
      c <- (truncateu16 (BArray32.get64 t 0));
      c <- (c `&` (W16.of_int 255));
      rp <- (BArray960.set8 rp (W64.to_uint j) (truncateu8 c));
      j <- (j + (W64.of_int 1));
      b <- (truncateu16 (BArray32.get64 t 0));
      b <- (b `>>` (W8.of_int 8));
      c <- (truncateu16 (BArray32.get64 t 1));
      c <- (c `<<` (W8.of_int 2));
      c <- (c `|` b);
      rp <- (BArray960.set8 rp (W64.to_uint j) (truncateu8 c));
      j <- (j + (W64.of_int 1));
      b <- (truncateu16 (BArray32.get64 t 1));
      b <- (b `>>` (W8.of_int 6));
      c <- (truncateu16 (BArray32.get64 t 2));
      c <- (c `<<` (W8.of_int 4));
      c <- (c `|` b);
      rp <- (BArray960.set8 rp (W64.to_uint j) (truncateu8 c));
      j <- (j + (W64.of_int 1));
      b <- (truncateu16 (BArray32.get64 t 2));
      b <- (b `>>` (W8.of_int 4));
      c <- (truncateu16 (BArray32.get64 t 3));
      c <- (c `<<` (W8.of_int 6));
      c <- (c `|` b);
      rp <- (BArray960.set8 rp (W64.to_uint j) (truncateu8 c));
      j <- (j + (W64.of_int 1));
      t <- (BArray32.set64 t 3 ((BArray32.get64 t 3) `>>` (W8.of_int 2)));
      rp <-
      (BArray960.set8 rp (W64.to_uint j) (truncateu8 (BArray32.get64 t 3)));
      j <- (j + (W64.of_int 1));
    }
    return rp;
  }
  proc __polyvec_decompress (ap:W64.t) : BArray1536.t = {
    var r:BArray1536.t;
    var i:W64.t;
    var j:W64.t;
    var k:int;
    var t:BArray20.t;
    var d:W32.t;
    r <- witness;
    t <- witness;
    i <- (W64.of_int 0);
    j <- (W64.of_int 0);
    while ((i \ult (W64.of_int ((3 * 256) - 3)))) {
      k <- 0;
      while ((k < 5)) {
        t <-
        (BArray20.set32 t k
        (zeroextu32 (loadW8 Glob.mem (W64.to_uint (ap + j)))));
        j <- (j + (W64.of_int 1));
        k <- (k + 1);
      }
      d <- (BArray20.get32 t 1);
      t <- (BArray20.set32 t 1 ((BArray20.get32 t 1) `>>` (W8.of_int 2)));
      d <- (d `&` (W32.of_int 3));
      d <- (d `<<` (W8.of_int 8));
      t <- (BArray20.set32 t 0 ((BArray20.get32 t 0) `|` d));
      d <- (BArray20.get32 t 2);
      t <- (BArray20.set32 t 2 ((BArray20.get32 t 2) `>>` (W8.of_int 4)));
      d <- (d `&` (W32.of_int 15));
      d <- (d `<<` (W8.of_int 6));
      t <- (BArray20.set32 t 1 ((BArray20.get32 t 1) `|` d));
      d <- (BArray20.get32 t 3);
      t <- (BArray20.set32 t 3 ((BArray20.get32 t 3) `>>` (W8.of_int 6)));
      d <- (d `&` (W32.of_int 63));
      d <- (d `<<` (W8.of_int 4));
      t <- (BArray20.set32 t 2 ((BArray20.get32 t 2) `|` d));
      d <- (BArray20.get32 t 4);
      d <- (d `<<` (W8.of_int 2));
      t <- (BArray20.set32 t 3 ((BArray20.get32 t 3) `|` d));
      k <- 0;
      while ((k < 4)) {
        t <- (BArray20.set32 t k ((BArray20.get32 t k) * (W32.of_int 3329)));
        t <- (BArray20.set32 t k ((BArray20.get32 t k) + (W32.of_int 512)));
        t <- (BArray20.set32 t k ((BArray20.get32 t k) `>>` (W8.of_int 10)));
        r <-
        (BArray1536.set16 r (W64.to_uint i)
        (truncateu16 (BArray20.get32 t k)));
        i <- (i + (W64.of_int 1));
        k <- (k + 1);
      }
    }
    return r;
  }
  proc __polyvec_frombytes (ap:W64.t) : BArray1536.t = {
    var aux:BArray512.t;
    var r:BArray1536.t;
    var pp:W64.t;
    r <- witness;
    pp <- ap;
    aux <@ _poly_frombytes ((SBArray1536_512.get_sub16 r 0), pp);
    r <- (SBArray1536_512.set_sub16 r 0 aux);
    pp <- (pp + (W64.of_int 384));
    aux <@ _poly_frombytes ((SBArray1536_512.get_sub16 r 256), pp);
    r <- (SBArray1536_512.set_sub16 r 256 aux);
    pp <- (pp + (W64.of_int 384));
    aux <@ _poly_frombytes ((SBArray1536_512.get_sub16 r (2 * 256)), pp);
    r <- (SBArray1536_512.set_sub16 r (2 * 256) aux);
    return r;
  }
  proc __polyvec_invntt (r:BArray1536.t) : BArray1536.t = {
    var aux:BArray512.t;
    aux <@ _poly_invntt ((SBArray1536_512.get_sub16 r 0));
    r <- (SBArray1536_512.set_sub16 r 0 aux);
    aux <@ _poly_invntt ((SBArray1536_512.get_sub16 r 256));
    r <- (SBArray1536_512.set_sub16 r 256 aux);
    aux <@ _poly_invntt ((SBArray1536_512.get_sub16 r (2 * 256)));
    r <- (SBArray1536_512.set_sub16 r (2 * 256) aux);
    return r;
  }
  proc __polyvec_ntt (r:BArray1536.t) : BArray1536.t = {
    var aux:BArray512.t;
    aux <@ _poly_ntt ((SBArray1536_512.get_sub16 r 0));
    r <- (SBArray1536_512.set_sub16 r 0 aux);
    aux <@ _poly_ntt ((SBArray1536_512.get_sub16 r 256));
    r <- (SBArray1536_512.set_sub16 r 256 aux);
    aux <@ _poly_ntt ((SBArray1536_512.get_sub16 r (2 * 256)));
    r <- (SBArray1536_512.set_sub16 r (2 * 256) aux);
    return r;
  }
  proc __polyvec_pointwise_acc (a:BArray1536.t, b:BArray1536.t) : BArray512.t = {
    var r:BArray512.t;
    var t:BArray512.t;
    r <- witness;
    t <- witness;
    r <@ _poly_basemul (r, (SBArray1536_512.get_sub16 a 0),
    (SBArray1536_512.get_sub16 b 0));
    t <@ _poly_basemul (t, (SBArray1536_512.get_sub16 a 256),
    (SBArray1536_512.get_sub16 b 256));
    r <@ _poly_add2 (r, t);
    t <@ _poly_basemul (t, (SBArray1536_512.get_sub16 a (2 * 256)),
    (SBArray1536_512.get_sub16 b (2 * 256)));
    r <@ _poly_add2 (r, t);
    r <@ __poly_reduce (r);
    return r;
  }
  proc __polyvec_reduce (r:BArray1536.t) : BArray1536.t = {
    var aux:BArray512.t;
    aux <@ __poly_reduce ((SBArray1536_512.get_sub16 r 0));
    r <- (SBArray1536_512.set_sub16 r 0 aux);
    aux <@ __poly_reduce ((SBArray1536_512.get_sub16 r 256));
    r <- (SBArray1536_512.set_sub16 r 256 aux);
    aux <@ __poly_reduce ((SBArray1536_512.get_sub16 r (2 * 256)));
    r <- (SBArray1536_512.set_sub16 r (2 * 256) aux);
    return r;
  }
  proc __polyvec_tobytes (rp:W64.t, a:BArray1536.t) : unit = {
    var aux:BArray512.t;
    var pp:W64.t;
    pp <- rp;
    aux <@ _poly_tobytes (pp, (SBArray1536_512.get_sub16 a 0));
    a <- (SBArray1536_512.set_sub16 a 0 aux);
    pp <- (pp + (W64.of_int 384));
    aux <@ _poly_tobytes (pp, (SBArray1536_512.get_sub16 a 256));
    a <- (SBArray1536_512.set_sub16 a 256 aux);
    pp <- (pp + (W64.of_int 384));
    aux <@ _poly_tobytes (pp, (SBArray1536_512.get_sub16 a (2 * 256)));
    a <- (SBArray1536_512.set_sub16 a (2 * 256) aux);
    return ();
  }
  proc __rej_uniform (rp:BArray512.t, offset:W64.t, buf:BArray168.t) : 
  W64.t * BArray512.t = {
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
        val1 <- (zeroextu16 (BArray168.get8 buf (W64.to_uint pos)));
        val1 <- (protect_16 val1 ms);
        t <-
        (zeroextu16 (BArray168.get8 buf (W64.to_uint (pos + (W64.of_int 1))))
        );
        t <- (protect_16 t ms);
        val2 <- t;
        val2 <- (val2 `>>` (W8.of_int 4));
        t <- (t `&` (W16.of_int 15));
        t <- (t `<<` (W8.of_int 8));
        val1 <- (val1 `|` t);
        t <-
        (zeroextu16 (BArray168.get8 buf (W64.to_uint (pos + (W64.of_int 2))))
        );
        t <- (protect_16 t ms);
        t <- (t `<<` (W8.of_int 4));
        val2 <- (val2 `|` t);
        pos <- (pos + (W64.of_int 3));
        cond <- (val1 \ult (W16.of_int 3329));
        if (cond) {
          ms <- (update_msf cond ms);
          rp <- (BArray512.set16 rp (W64.to_uint ctr) val1);
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
            rp <- (BArray512.set16 rp (W64.to_uint ctr) val2);
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
  proc __gen_matrix (seed:BArray32.t, transposed:W64.t) : BArray4608.t = {
    var r:BArray4608.t;
    var stransposed:W64.t;
    var j:int;
    var c:W8.t;
    var extseed:BArray34.t;
    var i:int;
    var state:BArray200.t;
    var ctr:W64.t;
    var sctr:W64.t;
    var buf:BArray168.t;
    var poly:BArray512.t;
    var k:W64.t;
    var rij:BArray512.t;
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
      c <- (BArray32.get8 seed j);
      extseed <- (BArray34.set8 extseed j c);
      j <- (j + 1);
    }
    i <- 0;
    while ((i < 3)) {
      j <- 0;
      while ((j < 3)) {
        transposed <- stransposed;
        if ((transposed = (W64.of_int 0))) {
          extseed <- (BArray34.set8 extseed 32 (W8.of_int j));
          extseed <- (BArray34.set8 extseed (32 + 1) (W8.of_int i));
        } else {
          extseed <- (BArray34.set8 extseed 32 (W8.of_int i));
          extseed <- (BArray34.set8 extseed (32 + 1) (W8.of_int j));
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
        rij <- (SBArray4608_512.get_sub16 r ((i * (3 * 256)) + (j * 256)));
        while ((k \ult (W64.of_int 256))) {
          t <- (BArray512.get16 poly (W64.to_uint k));
          rij <- (BArray512.set16 rij (W64.to_uint k) t);
          k <- (k + (W64.of_int 1));
        }
        r <- (SBArray4608_512.set_sub16 r ((i * (3 * 256)) + (j * 256)) rij);
        j <- (j + 1);
      }
      i <- (i + 1);
    }
    return r;
  }
  proc __indcpa_keypair (spkp:W64.t, sskp:W64.t, randomnessp:BArray32.t) : 
  unit = {
    var aux:BArray512.t;
    var inc:int;
    var i:int;
    var t64:W64.t;
    var inbuf:BArray33.t;
    var buf:BArray64.t;
    var publicseed:BArray32.t;
    var noiseseed:BArray32.t;
    var r_noiseseed:BArray32.t;
    var s_noiseseed:BArray32.t;
    var zero:W64.t;
    var a:BArray4608.t;
    var nonce:W8.t;
    var skpv:BArray1536.t;
    var e:BArray1536.t;
    var pkpv:BArray1536.t;
    var pkp:W64.t;
    var skp:W64.t;
    a <- witness;
    buf <- witness;
    e <- witness;
    inbuf <- witness;
    noiseseed <- witness;
    pkpv <- witness;
    publicseed <- witness;
    r_noiseseed <- witness;
    s_noiseseed <- witness;
    skpv <- witness;
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (BArray32.get64 randomnessp i);
      inbuf <- (BArray33.set64 inbuf i t64);
      i <- (i + 1);
    }
    inbuf <- (BArray33.set8 inbuf 32 (W8.of_int 3));
    buf <@ _sha3512_33 (buf, inbuf);
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (BArray64.get64 buf i);
      publicseed <- (BArray32.set64 publicseed i t64);
      t64 <- (BArray64.get64 buf (i + (32 %/ 8)));
      noiseseed <- (BArray32.set64 noiseseed i t64);
      i <- (i + 1);
    }
    r_noiseseed <- noiseseed;
    s_noiseseed <- r_noiseseed;
    zero <- (W64.of_int 0);
    a <@ __gen_matrix (publicseed, zero);
    nonce <- (W8.of_int 0);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 skpv 0), s_noiseseed,
    nonce);
    skpv <- (SBArray1536_512.set_sub16 skpv 0 aux);
    nonce <- (W8.of_int 1);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 skpv 256), s_noiseseed,
    nonce);
    skpv <- (SBArray1536_512.set_sub16 skpv 256 aux);
    nonce <- (W8.of_int 2);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 skpv (2 * 256)),
    s_noiseseed, nonce);
    skpv <- (SBArray1536_512.set_sub16 skpv (2 * 256) aux);
    nonce <- (W8.of_int 3);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 e 0), s_noiseseed,
    nonce);
    e <- (SBArray1536_512.set_sub16 e 0 aux);
    nonce <- (W8.of_int 4);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 e 256), s_noiseseed,
    nonce);
    e <- (SBArray1536_512.set_sub16 e 256 aux);
    nonce <- (W8.of_int 5);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 e (2 * 256)),
    s_noiseseed, nonce);
    e <- (SBArray1536_512.set_sub16 e (2 * 256) aux);
    skpv <@ __polyvec_ntt (skpv);
    e <@ __polyvec_ntt (e);
    aux <@ __polyvec_pointwise_acc ((SBArray4608_1536.get_sub16 a 0), skpv);
    pkpv <- (SBArray1536_512.set_sub16 pkpv 0 aux);
    aux <@ _poly_frommont ((SBArray1536_512.get_sub16 pkpv 0));
    pkpv <- (SBArray1536_512.set_sub16 pkpv 0 aux);
    aux <@ __polyvec_pointwise_acc ((SBArray4608_1536.get_sub16 a (3 * 256)),
    skpv);
    pkpv <- (SBArray1536_512.set_sub16 pkpv 256 aux);
    aux <@ _poly_frommont ((SBArray1536_512.get_sub16 pkpv 256));
    pkpv <- (SBArray1536_512.set_sub16 pkpv 256 aux);
    aux <@ __polyvec_pointwise_acc ((SBArray4608_1536.get_sub16 a
                                    (2 * (3 * 256))),
    skpv);
    pkpv <- (SBArray1536_512.set_sub16 pkpv (2 * 256) aux);
    aux <@ _poly_frommont ((SBArray1536_512.get_sub16 pkpv (2 * 256)));
    pkpv <- (SBArray1536_512.set_sub16 pkpv (2 * 256) aux);
    pkpv <@ __polyvec_add2 (pkpv, e);
    pkpv <@ __polyvec_reduce (pkpv);
    pkp <- spkp;
    skp <- sskp;
    __polyvec_tobytes (skp, skpv);
    __polyvec_tobytes (pkp, pkpv);
    pkp <- (pkp + (W64.of_int (3 * 384)));
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (BArray32.get64 publicseed i);
      Glob.mem <-
      (storeW64 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))) t64);
      pkp <- (pkp + (W64.of_int 8));
      i <- (i + 1);
    }
    return ();
  }
  proc __indcpa_enc (sctp:W64.t, msgp:BArray32.t, pkp:W64.t,
                     noiseseed:BArray32.t) : unit = {
    var aux:BArray512.t;
    var s_noiseseed:BArray32.t;
    var pkpv:BArray1536.t;
    var i:W64.t;
    var t64:W64.t;
    var publicseed:BArray32.t;
    var k:BArray512.t;
    var aat:BArray4608.t;
    var nonce:W8.t;
    var sp_0:BArray1536.t;
    var ep:BArray1536.t;
    var epp:BArray512.t;
    var bp:BArray1536.t;
    var v:BArray512.t;
    var ctp:W64.t;
    aat <- witness;
    bp <- witness;
    ep <- witness;
    epp <- witness;
    k <- witness;
    pkpv <- witness;
    publicseed <- witness;
    s_noiseseed <- witness;
    sp_0 <- witness;
    v <- witness;
    s_noiseseed <- noiseseed;
    pkpv <@ __polyvec_frombytes (pkp);
    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (3 * 384)));
    while ((i \ult (W64.of_int (32 %/ 8)))) {
      t64 <- (loadW64 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))));
      publicseed <- (BArray32.set64d publicseed (8 * (W64.to_uint i)) t64);
      pkp <- (pkp + (W64.of_int 8));
      i <- (i + (W64.of_int 1));
    }
    k <@ _i_poly_frommsg (k, msgp);
    aat <@ __gen_matrix (publicseed, (W64.of_int 1));
    nonce <- (W8.of_int 0);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 sp_0 0), s_noiseseed,
    nonce);
    sp_0 <- (SBArray1536_512.set_sub16 sp_0 0 aux);
    nonce <- (W8.of_int 1);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 sp_0 256), s_noiseseed,
    nonce);
    sp_0 <- (SBArray1536_512.set_sub16 sp_0 256 aux);
    nonce <- (W8.of_int 2);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 sp_0 (2 * 256)),
    s_noiseseed, nonce);
    sp_0 <- (SBArray1536_512.set_sub16 sp_0 (2 * 256) aux);
    nonce <- (W8.of_int 3);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 ep 0), s_noiseseed,
    nonce);
    ep <- (SBArray1536_512.set_sub16 ep 0 aux);
    nonce <- (W8.of_int 4);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 ep 256), s_noiseseed,
    nonce);
    ep <- (SBArray1536_512.set_sub16 ep 256 aux);
    nonce <- (W8.of_int 5);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 ep (2 * 256)),
    s_noiseseed, nonce);
    ep <- (SBArray1536_512.set_sub16 ep (2 * 256) aux);
    nonce <- (W8.of_int 6);
    epp <@ _poly_getnoise (epp, s_noiseseed, nonce);
    sp_0 <@ __polyvec_ntt (sp_0);
    aux <@ __polyvec_pointwise_acc ((SBArray4608_1536.get_sub16 aat 0),
    sp_0);
    bp <- (SBArray1536_512.set_sub16 bp 0 aux);
    aux <@ __polyvec_pointwise_acc ((SBArray4608_1536.get_sub16 aat (3 * 256)
                                    ),
    sp_0);
    bp <- (SBArray1536_512.set_sub16 bp 256 aux);
    aux <@ __polyvec_pointwise_acc ((SBArray4608_1536.get_sub16 aat
                                    (2 * (3 * 256))),
    sp_0);
    bp <- (SBArray1536_512.set_sub16 bp (2 * 256) aux);
    v <@ __polyvec_pointwise_acc (pkpv, sp_0);
    bp <@ __polyvec_invntt (bp);
    v <@ _poly_invntt (v);
    bp <@ __polyvec_add2 (bp, ep);
    v <@ _poly_add2 (v, epp);
    v <@ _poly_add2 (v, k);
    bp <@ __polyvec_reduce (bp);
    v <@ __poly_reduce (v);
    ctp <- sctp;
    __polyvec_compress (ctp, bp);
    ctp <- (ctp + (W64.of_int (3 * 320)));
    v <@ _poly_compress (ctp, v);
    return ();
  }
  proc __iindcpa_enc (ctp:BArray1088.t, msgp:BArray32.t, pkp:W64.t,
                      noiseseed:BArray32.t) : BArray1088.t = {
    var aux_1:BArray128.t;
    var aux:BArray512.t;
    var aux_0:BArray960.t;
    var s_noiseseed:BArray32.t;
    var sctp:BArray1088.t;
    var pkpv:BArray1536.t;
    var i:W64.t;
    var t64:W64.t;
    var publicseed:BArray32.t;
    var k:BArray512.t;
    var aat:BArray4608.t;
    var nonce:W8.t;
    var sp_0:BArray1536.t;
    var ep:BArray1536.t;
    var epp:BArray512.t;
    var bp:BArray1536.t;
    var v:BArray512.t;
    aat <- witness;
    bp <- witness;
    ep <- witness;
    epp <- witness;
    k <- witness;
    pkpv <- witness;
    publicseed <- witness;
    s_noiseseed <- witness;
    sctp <- witness;
    sp_0 <- witness;
    v <- witness;
    s_noiseseed <- noiseseed;
    sctp <- ctp;
    pkpv <@ __polyvec_frombytes (pkp);
    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (3 * 384)));
    while ((i \ult (W64.of_int (32 %/ 8)))) {
      t64 <- (loadW64 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))));
      publicseed <- (BArray32.set64d publicseed (8 * (W64.to_uint i)) t64);
      pkp <- (pkp + (W64.of_int 8));
      i <- (i + (W64.of_int 1));
    }
    k <@ _i_poly_frommsg (k, msgp);
    aat <@ __gen_matrix (publicseed, (W64.of_int 1));
    nonce <- (W8.of_int 0);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 sp_0 0), s_noiseseed,
    nonce);
    sp_0 <- (SBArray1536_512.set_sub16 sp_0 0 aux);
    nonce <- (W8.of_int 1);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 sp_0 256), s_noiseseed,
    nonce);
    sp_0 <- (SBArray1536_512.set_sub16 sp_0 256 aux);
    nonce <- (W8.of_int 2);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 sp_0 (2 * 256)),
    s_noiseseed, nonce);
    sp_0 <- (SBArray1536_512.set_sub16 sp_0 (2 * 256) aux);
    nonce <- (W8.of_int 3);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 ep 0), s_noiseseed,
    nonce);
    ep <- (SBArray1536_512.set_sub16 ep 0 aux);
    nonce <- (W8.of_int 4);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 ep 256), s_noiseseed,
    nonce);
    ep <- (SBArray1536_512.set_sub16 ep 256 aux);
    nonce <- (W8.of_int 5);
    aux <@ _poly_getnoise ((SBArray1536_512.get_sub16 ep (2 * 256)),
    s_noiseseed, nonce);
    ep <- (SBArray1536_512.set_sub16 ep (2 * 256) aux);
    nonce <- (W8.of_int 6);
    epp <@ _poly_getnoise (epp, s_noiseseed, nonce);
    sp_0 <@ __polyvec_ntt (sp_0);
    aux <@ __polyvec_pointwise_acc ((SBArray4608_1536.get_sub16 aat 0),
    sp_0);
    bp <- (SBArray1536_512.set_sub16 bp 0 aux);
    aux <@ __polyvec_pointwise_acc ((SBArray4608_1536.get_sub16 aat (3 * 256)
                                    ),
    sp_0);
    bp <- (SBArray1536_512.set_sub16 bp 256 aux);
    aux <@ __polyvec_pointwise_acc ((SBArray4608_1536.get_sub16 aat
                                    (2 * (3 * 256))),
    sp_0);
    bp <- (SBArray1536_512.set_sub16 bp (2 * 256) aux);
    v <@ __polyvec_pointwise_acc (pkpv, sp_0);
    bp <@ __polyvec_invntt (bp);
    v <@ _poly_invntt (v);
    bp <@ __polyvec_add2 (bp, ep);
    v <@ _poly_add2 (v, epp);
    v <@ _poly_add2 (v, k);
    bp <@ __polyvec_reduce (bp);
    v <@ __poly_reduce (v);
    ctp <- sctp;
    aux_0 <@ __i_polyvec_compress ((SBArray1088_960.get_sub8 ctp 0), bp);
    ctp <- (SBArray1088_960.set_sub8 ctp 0 aux_0);
    (aux_1, aux) <@ _i_poly_compress ((SBArray1088_128.get_sub8 ctp (3 * 320)
                                      ),
    v);
    ctp <- (SBArray1088_128.set_sub8 ctp (3 * 320) aux_1);
    v <- aux;
    return ctp;
  }
  proc __indcpa_dec (msgp:BArray32.t, ctp:W64.t, skp:W64.t) : BArray32.t = {
    var bp:BArray1536.t;
    var v:BArray512.t;
    var skpv:BArray1536.t;
    var t:BArray512.t;
    var mp:BArray512.t;
    bp <- witness;
    mp <- witness;
    skpv <- witness;
    t <- witness;
    v <- witness;
    bp <@ __polyvec_decompress (ctp);
    ctp <- (ctp + (W64.of_int (3 * 320)));
    v <@ _poly_decompress (v, ctp);
    skpv <@ __polyvec_frombytes (skp);
    bp <@ __polyvec_ntt (bp);
    t <@ __polyvec_pointwise_acc (skpv, bp);
    t <@ _poly_invntt (t);
    mp <@ _poly_sub (mp, v, t);
    mp <@ __poly_reduce (mp);
    (msgp, mp) <@ _i_poly_tomsg (msgp, mp);
    return msgp;
  }
  proc __verify (ctp:W64.t, ctpc:BArray1088.t) : W64.t = {
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
      t1 <- (BArray1088.get8d ctpc i);
      t2 <- (loadW8 Glob.mem (W64.to_uint (ctp + (W64.of_int i))));
      t1 <- (t1 `^` t2);
      t64 <- (zeroextu64 t1);
      cnd <- (cnd `|` t64);
      i <- (i + 1);
    }
    cnd <- (- cnd);
    cnd <- (cnd `>>` (W8.of_int 63));
    return cnd;
  }
  proc __cmov (dst:W64.t, src:BArray32.t, cnd:W64.t) : unit = {
    var i:int;
    var t2:W8.t;
    var t1:W8.t;
    cnd <- (- cnd);
    i <- 0;
    while ((i < 32)) {
      t2 <- (loadW8 Glob.mem (W64.to_uint (dst + (W64.of_int i))));
      t1 <- (BArray32.get8d src i);
      t2 <- (t2 `^` t1);
      t2 <- (t2 `&` (truncateu8 cnd));
      t1 <- (t1 `^` t2);
      Glob.mem <- (storeW8 Glob.mem (W64.to_uint (dst + (W64.of_int i))) t1);
      i <- (i + 1);
    }
    return ();
  }
  proc __crypto_kem_keypair_jazz (pkp:W64.t, skp:W64.t,
                                  randomnessp:BArray64.t) : unit = {
    var inc:int;
    var s_randomnessp:BArray64.t;
    var s_pkp:W64.t;
    var s_skp:W64.t;
    var randomnessp1:BArray32.t;
    var i:int;
    var t64:W64.t;
    var h_pk:BArray32.t;
    var randomnessp2:BArray32.t;
    h_pk <- witness;
    randomnessp1 <- witness;
    randomnessp2 <- witness;
    s_randomnessp <- witness;
    s_randomnessp <- randomnessp;
    s_pkp <- pkp;
    s_skp <- skp;
    randomnessp1 <- (SBArray64_32.get_sub8 randomnessp 0);
    __indcpa_keypair (s_pkp, s_skp, randomnessp1);
    skp <- s_skp;
    skp <- (skp + (W64.of_int (3 * 384)));
    pkp <- s_pkp;
    inc <- (((3 * 384) + 32) %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (loadW64 Glob.mem (W64.to_uint (pkp + (W64.of_int (8 * i)))));
      Glob.mem <-
      (storeW64 Glob.mem (W64.to_uint (skp + (W64.of_int 0))) t64);
      skp <- (skp + (W64.of_int 8));
      i <- (i + 1);
    }
    s_skp <- skp;
    pkp <- s_pkp;
    h_pk <@ _isha3_256_M1184 (h_pk, pkp);
    skp <- s_skp;
    i <- 0;
    while ((i < 4)) {
      t64 <- (BArray32.get64 h_pk i);
      Glob.mem <-
      (storeW64 Glob.mem (W64.to_uint (skp + (W64.of_int 0))) t64);
      skp <- (skp + (W64.of_int 8));
      i <- (i + 1);
    }
    randomnessp <- s_randomnessp;
    randomnessp2 <- (SBArray64_32.get_sub8 randomnessp 32);
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (BArray32.get64 randomnessp2 i);
      Glob.mem <-
      (storeW64 Glob.mem (W64.to_uint (skp + (W64.of_int 0))) t64);
      skp <- (skp + (W64.of_int 8));
      i <- (i + 1);
    }
    return ();
  }
  proc __crypto_kem_enc_jazz (ctp:W64.t, shkp:W64.t, pkp:W64.t,
                              randomnessp:BArray32.t) : unit = {
    var aux:BArray32.t;
    var inc:int;
    var s_pkp:W64.t;
    var s_ctp:W64.t;
    var s_shkp:W64.t;
    var i:int;
    var t64:W64.t;
    var buf:BArray64.t;
    var kr:BArray64.t;
    buf <- witness;
    kr <- witness;
    s_pkp <- pkp;
    s_ctp <- ctp;
    s_shkp <- shkp;
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (BArray32.get64 randomnessp i);
      buf <- (BArray64.set64 buf i t64);
      i <- (i + 1);
    }
    pkp <- s_pkp;
    aux <@ _isha3_256_M1184 ((SBArray64_32.get_sub8 buf 32), pkp);
    buf <- (SBArray64_32.set_sub8 buf 32 aux);
    kr <@ _sha3_512_64 (kr, buf);
    pkp <- s_pkp;
    __indcpa_enc (s_ctp, (SBArray64_32.get_sub8 buf 0), pkp,
    (SBArray64_32.get_sub8 kr 32));
    shkp <- s_shkp;
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (BArray64.get64 kr i);
      Glob.mem <-
      (storeW64 Glob.mem (W64.to_uint (shkp + (W64.of_int (8 * i)))) t64);
      i <- (i + 1);
    }
    return ();
  }
  proc __crypto_kem_dec_jazz (shkp:W64.t, ctp:W64.t, skp:W64.t) : unit = {
    var aux:BArray32.t;
    var inc:int;
    var s_shkp:W64.t;
    var s_ctp:W64.t;
    var buf:BArray64.t;
    var hp:W64.t;
    var i:int;
    var t64:W64.t;
    var s_skp:W64.t;
    var kr:BArray64.t;
    var pkp:W64.t;
    var ctpc:BArray1088.t;
    var cnd:W64.t;
    var s_cnd:W64.t;
    var zp:W64.t;
    buf <- witness;
    ctpc <- witness;
    kr <- witness;
    s_shkp <- shkp;
    s_ctp <- ctp;
    aux <@ __indcpa_dec ((SBArray64_32.get_sub8 buf 0), ctp, skp);
    buf <- (SBArray64_32.set_sub8 buf 0 aux);
    hp <- skp;
    hp <- (hp + (W64.of_int (32 + (((24 * 3) * 256) `|>>` 3))));
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (loadW64 Glob.mem (W64.to_uint (hp + (W64.of_int (8 * i)))));
      buf <- (BArray64.set64d buf (32 + (8 * i)) t64);
      i <- (i + 1);
    }
    s_skp <- skp;
    kr <@ _sha3_512_64 (kr, buf);
    pkp <- s_skp;
    pkp <- (pkp + (W64.of_int (((12 * 3) * 256) `|>>` 3)));
    ctpc <@ __iindcpa_enc (ctpc, (SBArray64_32.get_sub8 buf 0), pkp,
    (SBArray64_32.get_sub8 kr 32));
    ctp <- s_ctp;
    cnd <@ __verify (ctp, ctpc);
    s_cnd <- cnd;
    zp <- s_skp;
    zp <- (zp + (W64.of_int 64));
    zp <- (zp + (W64.of_int (((24 * 3) * 256) `|>>` 3)));
    shkp <- s_shkp;
    _shake256_1120_32 (shkp, zp, ctp);
    shkp <- s_shkp;
    cnd <- s_cnd;
    __cmov (shkp, (SBArray64_32.get_sub8 kr 0), cnd);
    return ();
  }
  proc jade_kem_mlkem_mlkem768_amd64_ref_keypair (public_key:W64.t,
                                                  secret_key:W64.t) : 
  W64.t = {
    var r:W64.t;
    var randomness:BArray64.t;
    var randomnessp:BArray64.t;
    var _of_:bool;
    var _cf_:bool;
    var _sf_:bool;
    var _zf_:bool;
    var  _0:W64.t;
    var  _1:bool;
    randomness <- witness;
    randomnessp <- witness;
    public_key <- public_key;
    secret_key <- secret_key;
    randomnessp <- randomness;
    randomnessp <@ SC.randombytes_64 (randomnessp);
     _0 <- (init_msf);
    __crypto_kem_keypair_jazz (public_key, secret_key, randomnessp);
    (_of_, _cf_, _sf_,  _1, _zf_, r) <- (set0_64);
    return r;
  }
  proc jade_kem_mlkem_mlkem768_amd64_ref_enc (ciphertext:W64.t,
                                              shared_secret:W64.t,
                                              public_key:W64.t) : W64.t = {
    var r:W64.t;
    var randomness:BArray32.t;
    var randomnessp:BArray32.t;
    var _of_:bool;
    var _cf_:bool;
    var _sf_:bool;
    var _zf_:bool;
    var  _0:W64.t;
    var  _1:bool;
    randomness <- witness;
    randomnessp <- witness;
    ciphertext <- ciphertext;
    shared_secret <- shared_secret;
    public_key <- public_key;
    randomnessp <- randomness;
    randomnessp <@ SC.randombytes_32 (randomnessp);
     _0 <- (init_msf);
    __crypto_kem_enc_jazz (ciphertext, shared_secret, public_key,
    randomnessp);
    (_of_, _cf_, _sf_,  _1, _zf_, r) <- (set0_64);
    return r;
  }
  proc jade_kem_mlkem_mlkem768_amd64_ref_dec (shared_secret:W64.t,
                                              ciphertext:W64.t,
                                              secret_key:W64.t) : W64.t = {
    var r:W64.t;
    var _of_:bool;
    var _cf_:bool;
    var _sf_:bool;
    var _zf_:bool;
    var  _0:W64.t;
    var  _1:bool;
     _0 <- (init_msf);
    __crypto_kem_dec_jazz (shared_secret, ciphertext, secret_key);
    (_of_, _cf_, _sf_,  _1, _zf_, r) <- (set0_64);
    return r;
  }
}.
