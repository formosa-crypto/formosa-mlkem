require import AllCore IntDiv CoreMap List Distr.

from Jasmin require import JModel_x86.

import SLH64.

from Jasmin require import Jcheck JSafety.

require import
Array5 Array8 Array16 Array24 Array25 Array32 Array33 Array34 Array40 Array64
Array128 Array160 Array168 Array200 Array256 Array384 Array512 Array1024
Array1408 Array1536 Array1568 Array2048 Array3168 Array4096 Array8192
WArray192 WArray256 BArray8 BArray16 BArray32 BArray33 BArray34 BArray40
BArray64 BArray128 BArray160 BArray168 BArray192 BArray200 BArray256
BArray384 BArray512 BArray1408 BArray1536 BArray1568 BArray2048 BArray3168
BArray8192 SBArray64_32 SBArray3168_32 SBArray256_128 SBArray1568_160
SBArray1536_384 SBArray2048_512 SBArray8192_512 SBArray1568_1408
SBArray1568_1536 SBArray3168_1536 SBArray3168_1568 SBArray8192_2048.

abbrev  jzetas_inv =
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

abbrev  jzetas =
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

abbrev  kECCAK1600_RC =
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
  var tmp__trace : trace
  proc __fqmul (a:W16.t, b:W16.t) : W16.t * trace = {
    var r:W16.t;
    var ad:W32.t;
    var bd:W32.t;
    var c:W32.t;
    var u:W32.t;
    var t:W32.t;
    var trace___fqmul:trace;
    trace___fqmul <- [];
    ad <- (sigextu32 a);
    bd <- (sigextu32 b);
    c <- (ad * bd);
    u <- (c * (W32.of_int 4076929024));
    u <- (u `|>>` (W8.of_int 16));
    t <- (u * (W32.of_int 4294963967));
    t <- (t + c);
    t <- (t `|>>` (W8.of_int 16));
    r <- (truncateu16 t);
    return (r, trace___fqmul);
  }
  proc __barrett_reduce (a:W16.t) : W16.t * trace = {
    var r:W16.t;
    var t:W32.t;
    var trace___barrett_reduce:trace;
    trace___barrett_reduce <- [];
    t <- (sigextu32 a);
    t <- (t * (W32.of_int 20159));
    t <- (t `|>>` (W8.of_int 26));
    t <- (t * (W32.of_int 3329));
    r <- a;
    r <- (r - (truncateu16 t));
    return (r, trace___barrett_reduce);
  }
  proc __ANDN_64 (a:W64.t, b:W64.t) : W64.t * trace = {
    var t:W64.t;
    var trace___ANDN_64:trace;
    trace___ANDN_64 <- [];
    t <- ((invw a) `&` b);
    return (t, trace___ANDN_64);
  }
  proc __SHLQ (x:W64.t, shbytes:int) : W64.t * trace = {
    var trace___SHLQ:trace;
    trace___SHLQ <- [];
    if ((shbytes <> 0)) {
      x <- (x `<<` (W8.of_int (8 * shbytes)));
    } else {
      
    }
    return (x, trace___SHLQ);
  }
  proc keccakf1600_index (x:int, y:int) : int * trace = {
    var r:int;
    var trace_keccakf1600_index:trace;
    trace_keccakf1600_index <- [];
    r <- ((x %% 5) + (5 * (y %% 5)));
    return (r, trace_keccakf1600_index);
  }
  proc keccakf1600_rho_offsets (i:int) : int * trace = {
    var r:int;
    var x:int;
    var y:int;
    var t:int;
    var z:int;
    var trace_keccakf1600_rho_offsets:trace;
    trace_keccakf1600_rho_offsets <- [];
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
    return (r, trace_keccakf1600_rho_offsets);
  }
  proc keccakf1600_rhotates (x:int, y:int) : int * trace = {
    var r:int;
    var i:int;
    var param:int;
    var param_0:int;
    var result:int;
    var param_1:int;
    var result_0:int;
    var trace_keccakf1600_rhotates:trace;
    trace_keccakf1600_rhotates <- [];
    param_0 <- x;
    param <- y;
    (result, tmp__trace) <@ keccakf1600_index (param_0, param);
    trace_keccakf1600_rhotates <- (trace_keccakf1600_rhotates ++ tmp__trace);
    i <- result;
    param_1 <- i;
    (result_0, tmp__trace) <@ keccakf1600_rho_offsets (param_1);
    trace_keccakf1600_rhotates <- (trace_keccakf1600_rhotates ++ tmp__trace);
    r <- result_0;
    return (r, trace_keccakf1600_rhotates);
  }
  proc __rol_u64_ref (x:W64.t, i:int) : W64.t * trace = {
    var  _0:bool;
    var  _1:bool;
    var trace___rol_u64_ref:trace;
    trace___rol_u64_ref <- [];
    if ((i <> 0)) {
      ( _0,  _1, x) <- (ROL_64 x (W8.of_int i));
    } else {
      
    }
    return (x, trace___rol_u64_ref);
  }
  proc __theta_sum_ref (a:BArray200.t, b_a:BArray200.t) : BArray40.t *
                                                          BArray40.t * trace = {
    var c:BArray40.t;
    var x:int;
    var y:int;
    var b_c:BArray40.t;
    var trace___theta_sum_ref:trace;
    b_c <- witness;
    c <- witness;
    trace___theta_sum_ref <- [];
    trace___theta_sum_ref <-
    (trace___theta_sum_ref ++ [(Assert, (BArray200.is_init b_a 0 200))]);
    b_c <- (BArray40.init_arr (W8.of_int 0));
    x <- 0;
    while ((x < 5)) {
      trace___theta_sum_ref <-
      (trace___theta_sum_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      trace___theta_sum_ref <-
      (trace___theta_sum_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 200)))]);
      b_c <- (BArray40.set64d b_c (x * 8) (W64.of_int 18446744073709551615));
      c <- (BArray40.set64 c x (BArray200.get64 a x));
      x <- (x + 1);
    }
    y <- 1;
    while ((y < 5)) {
      x <- 0;
      while ((x < 5)) {
        trace___theta_sum_ref <-
        (trace___theta_sum_ref ++
        [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
        trace___theta_sum_ref <-
        (trace___theta_sum_ref ++
        [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
        trace___theta_sum_ref <-
        (trace___theta_sum_ref ++
        [(Assert, (BArray40.is_init b_c (x * 8) 8))]);
        trace___theta_sum_ref <-
        (trace___theta_sum_ref ++
        [(Assert,
         ((0 <= ((x + (y * 5)) * 8)) /\ ((((x + (y * 5)) * 8) + 8) <= 200)))]);
        b_c <-
        (BArray40.set64d b_c (x * 8) (W64.of_int 18446744073709551615));
        c <-
        (BArray40.set64 c x
        ((BArray40.get64 c x) `^` (BArray200.get64 a (x + (y * 5)))));
        x <- (x + 1);
      }
      y <- (y + 1);
    }
    return (c, b_c, trace___theta_sum_ref);
  }
  proc __theta_rol_ref (c:BArray40.t, b_c:BArray40.t) : BArray40.t *
                                                        BArray40.t * trace = {
    var d:BArray40.t;
    var x:int;
    var param:int;
    var param_0:W64.t;
    var result:W64.t;
    var b_d:BArray40.t;
    var trace___theta_rol_ref:trace;
    b_d <- witness;
    d <- witness;
    trace___theta_rol_ref <- [];
    trace___theta_rol_ref <-
    (trace___theta_rol_ref ++ [(Assert, (BArray40.is_init b_c 0 40))]);
    b_d <- (BArray40.init_arr (W8.of_int 0));
    x <- 0;
    while ((x < 5)) {
      trace___theta_rol_ref <-
      (trace___theta_rol_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      trace___theta_rol_ref <-
      (trace___theta_rol_ref ++
      [(Assert,
       ((0 <= (((x + 1) %% 5) * 8)) /\ (((((x + 1) %% 5) * 8) + 8) <= 40)))]);
      b_d <- (BArray40.set64d b_d (x * 8) (W64.of_int 18446744073709551615));
      d <- (BArray40.set64 d x (BArray40.get64 c ((x + 1) %% 5)));
      trace___theta_rol_ref <-
      (trace___theta_rol_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      trace___theta_rol_ref <-
      (trace___theta_rol_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      trace___theta_rol_ref <-
      (trace___theta_rol_ref ++ [(Assert, (BArray40.is_init b_d (x * 8) 8))]);
      param_0 <- (BArray40.get64 d x);
      param <- 1;
      (result, tmp__trace) <@ __rol_u64_ref (param_0, param);
      trace___theta_rol_ref <- (trace___theta_rol_ref ++ tmp__trace);
      b_d <- (BArray40.set64d b_d (x * 8) (W64.of_int 18446744073709551615));
      d <- (BArray40.set64 d x result);
      trace___theta_rol_ref <-
      (trace___theta_rol_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      trace___theta_rol_ref <-
      (trace___theta_rol_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      trace___theta_rol_ref <-
      (trace___theta_rol_ref ++ [(Assert, (BArray40.is_init b_d (x * 8) 8))]);
      trace___theta_rol_ref <-
      (trace___theta_rol_ref ++
      [(Assert,
       ((0 <= ((((x - 1) + 5) %% 5) * 8)) /\
       ((((((x - 1) + 5) %% 5) * 8) + 8) <= 40)))]);
      b_d <- (BArray40.set64d b_d (x * 8) (W64.of_int 18446744073709551615));
      d <-
      (BArray40.set64 d x
      ((BArray40.get64 d x) `^` (BArray40.get64 c (((x - 1) + 5) %% 5))));
      x <- (x + 1);
    }
    return (d, b_d, trace___theta_rol_ref);
  }
  proc __rol_sum_ref (a:BArray200.t, b_a:BArray200.t, d:BArray40.t,
                      b_d:BArray40.t, y:int) : BArray40.t * BArray40.t *
                                               trace = {
    var b:BArray40.t;
    var x:int;
    var x_:int;
    var y_:int;
    var r:int;
    var param:int;
    var param_0:int;
    var result:int;
    var param_1:int;
    var param_2:W64.t;
    var result_0:W64.t;
    var b_b:BArray40.t;
    var trace___rol_sum_ref:trace;
    b <- witness;
    b_b <- witness;
    trace___rol_sum_ref <- [];
    trace___rol_sum_ref <-
    (trace___rol_sum_ref ++ [(Assert, (BArray200.is_init b_a 0 200))]);
    trace___rol_sum_ref <-
    (trace___rol_sum_ref ++ [(Assert, (BArray40.is_init b_d 0 40))]);
    b_b <- (BArray40.init_arr (W8.of_int 0));
    x <- 0;
    while ((x < 5)) {
      x_ <- ((x + (3 * y)) %% 5);
      y_ <- x;
      param_0 <- x_;
      param <- y_;
      (result, tmp__trace) <@ keccakf1600_rhotates (param_0, param);
      trace___rol_sum_ref <- (trace___rol_sum_ref ++ tmp__trace);
      r <- result;
      trace___rol_sum_ref <-
      (trace___rol_sum_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      trace___rol_sum_ref <-
      (trace___rol_sum_ref ++
      [(Assert,
       ((0 <= ((x_ + (y_ * 5)) * 8)) /\ ((((x_ + (y_ * 5)) * 8) + 8) <= 200)))]);
      b_b <- (BArray40.set64d b_b (x * 8) (W64.of_int 18446744073709551615));
      b <- (BArray40.set64 b x (BArray200.get64 a (x_ + (y_ * 5))));
      trace___rol_sum_ref <-
      (trace___rol_sum_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      trace___rol_sum_ref <-
      (trace___rol_sum_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      trace___rol_sum_ref <-
      (trace___rol_sum_ref ++ [(Assert, (BArray40.is_init b_b (x * 8) 8))]);
      trace___rol_sum_ref <-
      (trace___rol_sum_ref ++
      [(Assert, ((0 <= (x_ * 8)) /\ (((x_ * 8) + 8) <= 40)))]);
      b_b <- (BArray40.set64d b_b (x * 8) (W64.of_int 18446744073709551615));
      b <-
      (BArray40.set64 b x ((BArray40.get64 b x) `^` (BArray40.get64 d x_)));
      trace___rol_sum_ref <-
      (trace___rol_sum_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      trace___rol_sum_ref <-
      (trace___rol_sum_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      trace___rol_sum_ref <-
      (trace___rol_sum_ref ++ [(Assert, (BArray40.is_init b_b (x * 8) 8))]);
      param_2 <- (BArray40.get64 b x);
      param_1 <- r;
      (result_0, tmp__trace) <@ __rol_u64_ref (param_2, param_1);
      trace___rol_sum_ref <- (trace___rol_sum_ref ++ tmp__trace);
      b_b <- (BArray40.set64d b_b (x * 8) (W64.of_int 18446744073709551615));
      b <- (BArray40.set64 b x result_0);
      x <- (x + 1);
    }
    return (b, b_b, trace___rol_sum_ref);
  }
  proc __set_row_ref (e:BArray200.t, b_e:BArray200.t, b:BArray40.t,
                      b_b:BArray40.t, y:int) : BArray200.t * BArray200.t *
                                               trace = {
    var x:int;
    var x1:int;
    var x2:int;
    var t:W64.t;
    var param:W64.t;
    var param_0:W64.t;
    var result:W64.t;
    var trace___set_row_ref:trace;
    trace___set_row_ref <- [];
    trace___set_row_ref <-
    (trace___set_row_ref ++
    [(Assert,
     ((((BArray40.is_init b_b 0 40) /\ (0 <= y)) /\ (y < 5)) /\
     (BArray200.is_init b_e 0 ((y * 5) * 8))))]);
    x <- 0;
    while ((x < 5)) {
      x1 <- ((x + 1) %% 5);
      x2 <- ((x + 2) %% 5);
      trace___set_row_ref <-
      (trace___set_row_ref ++
      [(Assert, ((0 <= (x1 * 8)) /\ (((x1 * 8) + 8) <= 40)))]);
      trace___set_row_ref <-
      (trace___set_row_ref ++
      [(Assert, ((0 <= (x2 * 8)) /\ (((x2 * 8) + 8) <= 40)))]);
      param_0 <- (BArray40.get64 b x1);
      param <- (BArray40.get64 b x2);
      (result, tmp__trace) <@ __ANDN_64 (param_0, param);
      trace___set_row_ref <- (trace___set_row_ref ++ tmp__trace);
      t <- result;
      trace___set_row_ref <-
      (trace___set_row_ref ++
      [(Assert, ((0 <= (x * 8)) /\ (((x * 8) + 8) <= 40)))]);
      t <- (t `^` (BArray40.get64 b x));
      trace___set_row_ref <-
      (trace___set_row_ref ++
      [(Assert,
       ((0 <= ((x + (y * 5)) * 8)) /\ ((((x + (y * 5)) * 8) + 8) <= 200)))]);
      b_e <-
      (BArray200.set64d b_e ((x + (y * 5)) * 8)
      (W64.of_int 18446744073709551615));
      e <- (BArray200.set64 e (x + (y * 5)) t);
      x <- (x + 1);
    }
    return (e, b_e, trace___set_row_ref);
  }
  proc _pround_ref (e:BArray200.t, b_e:BArray200.t, a:BArray200.t,
                    b_a:BArray200.t) : BArray200.t * BArray200.t * trace = {
    var aux_1:BArray200.t;
    var aux_2:BArray200.t;
    var aux:BArray40.t;
    var aux_0:BArray40.t;
    var c:BArray40.t;
    var d:BArray40.t;
    var y:int;
    var b:BArray40.t;
    var param:BArray200.t;
    var result:BArray40.t;
    var param_0:BArray40.t;
    var result_0:BArray40.t;
    var param_1:int;
    var param_2:BArray40.t;
    var param_3:BArray200.t;
    var result_1:BArray40.t;
    var param_4:int;
    var param_5:BArray40.t;
    var param_6:BArray200.t;
    var result_2:BArray200.t;
    var b_result:BArray200.t;
    var b_param:BArray200.t;
    var b_result_0:BArray40.t;
    var b_result_1:BArray40.t;
    var b_result_2:BArray40.t;
    var trace__pround_ref:trace;
    b <- witness;
    b_param <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    c <- witness;
    d <- witness;
    param <- witness;
    param_0 <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_5 <- witness;
    param_6 <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    trace__pround_ref <- [];
    trace__pround_ref <-
    (trace__pround_ref ++ [(Assert, (BArray200.is_init b_a 0 200))]);
    param <- a;
    (aux, aux_0, tmp__trace) <@ __theta_sum_ref (param,
    (BArray200.init_arr (W8.of_int 255)));
    result <- aux;
    b_result_2 <- aux_0;
    trace__pround_ref <- (trace__pround_ref ++ tmp__trace);
    trace__pround_ref <-
    (trace__pround_ref ++ [(Assert, (BArray40.is_init b_result_2 0 40))]);
    c <- result;
    param_0 <- c;
    (aux, aux_0, tmp__trace) <@ __theta_rol_ref (param_0,
    (BArray40.init_arr (W8.of_int 255)));
    result_0 <- aux;
    b_result_1 <- aux_0;
    trace__pround_ref <- (trace__pround_ref ++ tmp__trace);
    trace__pround_ref <-
    (trace__pround_ref ++ [(Assert, (BArray40.is_init b_result_1 0 40))]);
    d <- result_0;
    y <- 0;
    while ((y < 5)) {
      param_3 <- a;
      param_2 <- d;
      param_1 <- y;
      (aux, aux_0, tmp__trace) <@ __rol_sum_ref (param_3,
      (BArray200.init_arr (W8.of_int 255)), param_2,
      (BArray40.init_arr (W8.of_int 255)), param_1);
      result_1 <- aux;
      b_result_0 <- aux_0;
      trace__pround_ref <- (trace__pround_ref ++ tmp__trace);
      trace__pround_ref <-
      (trace__pround_ref ++ [(Assert, (BArray40.is_init b_result_0 0 40))]);
      b <- result_1;
      b_param <- b_e;
      param_6 <- e;
      param_5 <- b;
      param_4 <- y;
      (aux_1, aux_2, tmp__trace) <@ __set_row_ref (param_6, b_param, 
      param_5, (BArray40.init_arr (W8.of_int 255)), param_4);
      result_2 <- aux_1;
      b_result <- aux_2;
      trace__pround_ref <- (trace__pround_ref ++ tmp__trace);
      trace__pround_ref <-
      (trace__pround_ref ++
      [(Assert, (BArray200.is_init b_result 0 (((param_4 + 1) * 5) * 8)))]);
      b_e <- b_result;
      e <- result_2;
      y <- (y + 1);
    }
    return (e, b_e, trace__pround_ref);
  }
  proc __keccakf1600_ref (a:BArray200.t, b_a:BArray200.t) : BArray200.t *
                                                            BArray200.t *
                                                            trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var s_e:BArray200.t;
    var e:BArray200.t;
    var rC:BArray192.t;
    var rc:W64.t;
    var c:int;
    var param:BArray200.t;
    var param_0:BArray200.t;
    var result:BArray200.t;
    var param_1:BArray200.t;
    var param_2:BArray200.t;
    var result_0:BArray200.t;
    var b_e:BArray200.t;
    var b_result:BArray200.t;
    var b_param:BArray200.t;
    var b_param_0:BArray200.t;
    var b_result_0:BArray200.t;
    var b_param_1:BArray200.t;
    var b_s_e:BArray200.t;
    var trace___keccakf1600_ref:trace;
    rC <- witness;
    b_e <- witness;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_s_e <- witness;
    e <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    result <- witness;
    result_0 <- witness;
    s_e <- witness;
    trace___keccakf1600_ref <- [];
    trace___keccakf1600_ref <-
    (trace___keccakf1600_ref ++ [(Assert, (BArray200.is_init b_a 0 200))]);
    b_s_e <- (BArray200.init_arr (W8.of_int 0));
    b_e <- b_s_e;
    e <- s_e;
    c <- 0;
    (* Erased call to spill *)
    b_param_1 <- b_e;
    param_0 <- e;
    param <- a;
    (aux, aux_0, tmp__trace) <@ _pround_ref (param_0, b_param_1, param,
    (BArray200.init_arr (W8.of_int 255)));
    result <- aux;
    b_result_0 <- aux_0;
    trace___keccakf1600_ref <- (trace___keccakf1600_ref ++ tmp__trace);
    trace___keccakf1600_ref <-
    (trace___keccakf1600_ref ++
    [(Assert, (BArray200.is_init b_result_0 0 200))]);
    e <- result;
    (b_a, b_e) <-
    (swap_ (BArray200.init_arr (W8.of_int 255))
    (BArray200.init_arr (W8.of_int 255)));
    (a, e) <- (swap_ e a);
    rC <- kECCAK1600_RC;
    trace___keccakf1600_ref <-
    (trace___keccakf1600_ref ++
    [(Assert, ((0 <= (c * 8)) /\ (((c * 8) + 8) <= 192)))]);
    rc <- (BArray192.get64 rC c);
    trace___keccakf1600_ref <-
    (trace___keccakf1600_ref ++ [(Assert, (BArray200.is_init b_e 0 8))]);
    b_e <- (BArray200.set64d b_e 0 (W64.of_int 18446744073709551615));
    e <- (BArray200.set64 e 0 ((BArray200.get64 e 0) `^` rc));
    b_param_0 <- b_a;
    param_2 <- a;
    b_param <- b_e;
    param_1 <- e;
    (aux, aux_0, tmp__trace) <@ _pround_ref (param_2, b_param_0, param_1,
    b_param);
    result_0 <- aux;
    b_result <- aux_0;
    trace___keccakf1600_ref <- (trace___keccakf1600_ref ++ tmp__trace);
    trace___keccakf1600_ref <-
    (trace___keccakf1600_ref ++
    [(Assert, (BArray200.is_init b_result 0 200))]);
    a <- result_0;
    (b_a, b_e) <- (swap_ b_e (BArray200.init_arr (W8.of_int 255)));
    (a, e) <- (swap_ e a);
    rC <- kECCAK1600_RC;
    trace___keccakf1600_ref <-
    (trace___keccakf1600_ref ++
    [(Assert, ((0 <= (c + 1)) /\ ((c + 1) <= 18446744073709551615)))]);
    trace___keccakf1600_ref <-
    (trace___keccakf1600_ref ++
    [(Assert, ((0 <= ((c + 1) * 8)) /\ ((((c + 1) * 8) + 8) <= 192)))]);
    rc <- (BArray192.get64 rC (c + 1));
    trace___keccakf1600_ref <-
    (trace___keccakf1600_ref ++ [(Assert, (BArray200.is_init b_a 0 8))]);
    b_a <- (BArray200.set64d b_a 0 (W64.of_int 18446744073709551615));
    a <- (BArray200.set64 a 0 ((BArray200.get64 a 0) `^` rc));
    (* Erased call to unspill *)
    trace___keccakf1600_ref <-
    (trace___keccakf1600_ref ++
    [(Assert, ((0 <= (c + 2)) /\ ((c + 2) <= 18446744073709551615)))]);
    c <- (c + 2);
    while ((c < 23)) {
      (* Erased call to spill *)
      b_param_1 <- b_e;
      param_0 <- e;
      param <- a;
      (aux, aux_0, tmp__trace) <@ _pround_ref (param_0, b_param_1, param,
      (BArray200.init_arr (W8.of_int 255)));
      result <- aux;
      b_result_0 <- aux_0;
      trace___keccakf1600_ref <- (trace___keccakf1600_ref ++ tmp__trace);
      trace___keccakf1600_ref <-
      (trace___keccakf1600_ref ++
      [(Assert, (BArray200.is_init b_result_0 0 200))]);
      e <- result;
      (b_a, b_e) <-
      (swap_ (BArray200.init_arr (W8.of_int 255))
      (BArray200.init_arr (W8.of_int 255)));
      (a, e) <- (swap_ e a);
      rC <- kECCAK1600_RC;
      trace___keccakf1600_ref <-
      (trace___keccakf1600_ref ++
      [(Assert, ((0 <= (c * 8)) /\ (((c * 8) + 8) <= 192)))]);
      rc <- (BArray192.get64 rC c);
      trace___keccakf1600_ref <-
      (trace___keccakf1600_ref ++ [(Assert, (BArray200.is_init b_e 0 8))]);
      b_e <- (BArray200.set64d b_e 0 (W64.of_int 18446744073709551615));
      e <- (BArray200.set64 e 0 ((BArray200.get64 e 0) `^` rc));
      b_param_0 <- b_a;
      param_2 <- a;
      b_param <- b_e;
      param_1 <- e;
      (aux, aux_0, tmp__trace) <@ _pround_ref (param_2, b_param_0, param_1,
      b_param);
      result_0 <- aux;
      b_result <- aux_0;
      trace___keccakf1600_ref <- (trace___keccakf1600_ref ++ tmp__trace);
      trace___keccakf1600_ref <-
      (trace___keccakf1600_ref ++
      [(Assert, (BArray200.is_init b_result 0 200))]);
      a <- result_0;
      (b_a, b_e) <- (swap_ b_e (BArray200.init_arr (W8.of_int 255)));
      (a, e) <- (swap_ e a);
      rC <- kECCAK1600_RC;
      trace___keccakf1600_ref <-
      (trace___keccakf1600_ref ++
      [(Assert, ((0 <= (c + 1)) /\ ((c + 1) <= 18446744073709551615)))]);
      trace___keccakf1600_ref <-
      (trace___keccakf1600_ref ++
      [(Assert, ((0 <= ((c + 1) * 8)) /\ ((((c + 1) * 8) + 8) <= 192)))]);
      rc <- (BArray192.get64 rC (c + 1));
      trace___keccakf1600_ref <-
      (trace___keccakf1600_ref ++ [(Assert, (BArray200.is_init b_a 0 8))]);
      b_a <- (BArray200.set64d b_a 0 (W64.of_int 18446744073709551615));
      a <- (BArray200.set64 a 0 ((BArray200.get64 a 0) `^` rc));
      (* Erased call to unspill *)
      trace___keccakf1600_ref <-
      (trace___keccakf1600_ref ++
      [(Assert, ((0 <= (c + 2)) /\ ((c + 2) <= 18446744073709551615)))]);
      c <- (c + 2);
    }
    return (a, b_a, trace___keccakf1600_ref);
  }
  proc _keccakf1600_ref (a:BArray200.t, b_a:BArray200.t) : BArray200.t *
                                                           BArray200.t *
                                                           trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var param:BArray200.t;
    var result:BArray200.t;
    var b_result:BArray200.t;
    var trace__keccakf1600_ref:trace;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace__keccakf1600_ref <- [];
    trace__keccakf1600_ref <-
    (trace__keccakf1600_ref ++ [(Assert, (BArray200.is_init b_a 0 200))]);
    param <- a;
    (aux, aux_0, tmp__trace) <@ __keccakf1600_ref (param,
    (BArray200.init_arr (W8.of_int 255)));
    result <- aux;
    b_result <- aux_0;
    trace__keccakf1600_ref <- (trace__keccakf1600_ref ++ tmp__trace);
    trace__keccakf1600_ref <-
    (trace__keccakf1600_ref ++
    [(Assert, (BArray200.is_init b_result 0 200))]);
    a <- result;
    b_a <- (BArray200.init_arr (W8.of_int 255));
    return (a, b_a, trace__keccakf1600_ref);
  }
  proc __state_init_ref (st:BArray200.t, b_st:BArray200.t) : BArray200.t *
                                                             BArray200.t *
                                                             trace = {
    var z64:W64.t;
    var i:int;
    var trace___state_init_ref:trace;
    trace___state_init_ref <- [];
    z64 <- (W64.of_int 0);
    i <- 0;
    while ((i < 25)) {
      trace___state_init_ref <-
      (trace___state_init_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      b_st <-
      (BArray200.set64d b_st (i * 8) (W64.of_int 18446744073709551615));
      st <- (BArray200.set64 st i z64);
      trace___state_init_ref <-
      (trace___state_init_ref ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
    }
    return (st, b_st, trace___state_init_ref);
  }
  proc __addratebit_ref (st:BArray200.t, b_st:BArray200.t, _RATE8:int) : 
  BArray200.t * BArray200.t * trace = {
    var t64:W64.t;
    var trace___addratebit_ref:trace;
    trace___addratebit_ref <- [];
    trace___addratebit_ref <-
    (trace___addratebit_ref ++
    [(Assert,
     (((BArray200.is_init b_st 0 200) /\ (0 < _RATE8)) /\ (_RATE8 <= 200)))]);
    t64 <- (W64.of_int 1);
    t64 <- (t64 `<<` (W8.of_int (((8 * _RATE8) - 1) %% 64)));
    trace___addratebit_ref <-
    (trace___addratebit_ref ++
    [(Assert,
     ((0 <= (((_RATE8 - 1) %/ 8) * 8)) /\
     (((((_RATE8 - 1) %/ 8) * 8) + 8) <= 200)))]);
    t64 <- (t64 `^` (BArray200.get64 st ((_RATE8 - 1) %/ 8)));
    trace___addratebit_ref <-
    (trace___addratebit_ref ++
    [(Assert,
     ((0 <= (((_RATE8 - 1) %/ 8) * 8)) /\
     (((((_RATE8 - 1) %/ 8) * 8) + 8) <= 200)))]);
    st <- (BArray200.set64 st ((_RATE8 - 1) %/ 8) t64);
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, trace___addratebit_ref);
  }
  proc a32____a_ilen_read_upto8_at (buf:BArray32.t, b_buf:BArray32.t,
                                    offset:int, dELTA:int, lEN:int,
                                    tRAIL:int, cUR:int, aT:int) : int * int *
                                                                  int * int *
                                                                  W64.t *
                                                                  trace = {
    var w:W64.t;
    var aT8:int;
    var t16:W64.t;
    var t8:W64.t;
    var param:int;
    var param_0:W64.t;
    var result:W64.t;
    var param_1:int;
    var param_2:W64.t;
    var result_0:W64.t;
    var param_3:int;
    var param_4:W64.t;
    var result_1:W64.t;
    var param_5:int;
    var param_6:W64.t;
    var result_2:W64.t;
    var param_7:int;
    var param_8:W64.t;
    var result_3:W64.t;
    var trace_a32____a_ilen_read_upto8_at:trace;
    trace_a32____a_ilen_read_upto8_at <- [];
    trace_a32____a_ilen_read_upto8_at <-
    (trace_a32____a_ilen_read_upto8_at ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     ((((((BArray32.is_init b_buf (offset + dELTA) ((lEN < 8) ? lEN : 8)) /\
         (0 <= dELTA)) /\
        (0 <= offset)) /\
       (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 32)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256)))))))))]);
    trace_a32____a_ilen_read_upto8_at <-
    (trace_a32____a_ilen_read_upto8_at ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        trace_a32____a_ilen_read_upto8_at <-
        (trace_a32____a_ilen_read_upto8_at ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace_a32____a_ilen_read_upto8_at <-
        (trace_a32____a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace_a32____a_ilen_read_upto8_at <-
        (trace_a32____a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= 32)))]);
        trace_a32____a_ilen_read_upto8_at <-
        (trace_a32____a_ilen_read_upto8_at ++
        [(Assert, (BArray32.is_init b_buf (offset + dELTA) 8))]);
        w <- (BArray32.get64d buf (offset + dELTA));
        param_0 <- w;
        param <- aT8;
        (result, tmp__trace) <@ __SHLQ (param_0, param);
        trace_a32____a_ilen_read_upto8_at <-
        (trace_a32____a_ilen_read_upto8_at ++ tmp__trace);
        w <- result;
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          trace_a32____a_ilen_read_upto8_at <-
          (trace_a32____a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a32____a_ilen_read_upto8_at <-
          (trace_a32____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a32____a_ilen_read_upto8_at <-
          (trace_a32____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= 32)))]);
          trace_a32____a_ilen_read_upto8_at <-
          (trace_a32____a_ilen_read_upto8_at ++
          [(Assert, (BArray32.is_init b_buf (offset + dELTA) 4))]);
          w <- (zeroextu64 (BArray32.get32d buf (offset + dELTA)));
          param_2 <- w;
          param_1 <- aT8;
          (result_0, tmp__trace) <@ __SHLQ (param_2, param_1);
          trace_a32____a_ilen_read_upto8_at <-
          (trace_a32____a_ilen_read_upto8_at ++ tmp__trace);
          w <- result_0;
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          trace_a32____a_ilen_read_upto8_at <-
          (trace_a32____a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a32____a_ilen_read_upto8_at <-
          (trace_a32____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a32____a_ilen_read_upto8_at <-
          (trace_a32____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= 32)))]);
          trace_a32____a_ilen_read_upto8_at <-
          (trace_a32____a_ilen_read_upto8_at ++
          [(Assert, (BArray32.is_init b_buf (offset + dELTA) 2))]);
          t16 <- (zeroextu64 (BArray32.get16d buf (offset + dELTA)));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          param_4 <- t16;
          param_3 <- aT8;
          (result_1, tmp__trace) <@ __SHLQ (param_4, param_3);
          trace_a32____a_ilen_read_upto8_at <-
          (trace_a32____a_ilen_read_upto8_at ++ tmp__trace);
          t16 <- result_1;
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            trace_a32____a_ilen_read_upto8_at <-
            (trace_a32____a_ilen_read_upto8_at ++
            [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
            trace_a32____a_ilen_read_upto8_at <-
            (trace_a32____a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\
             ((offset + dELTA) <= 18446744073709551615)))]);
            trace_a32____a_ilen_read_upto8_at <-
            (trace_a32____a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= 32)))]);
            trace_a32____a_ilen_read_upto8_at <-
            (trace_a32____a_ilen_read_upto8_at ++
            [(Assert, (BArray32.is_init b_buf (offset + dELTA) 1))]);
            t8 <- (zeroextu64 (BArray32.get8d buf (offset + dELTA)));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            param_6 <- t8;
            param_5 <- aT8;
            (result_2, tmp__trace) <@ __SHLQ (param_6, param_5);
            trace_a32____a_ilen_read_upto8_at <-
            (trace_a32____a_ilen_read_upto8_at ++ tmp__trace);
            t8 <- result_2;
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
              param_8 <- t8;
              param_7 <- aT8;
              (result_3, tmp__trace) <@ __SHLQ (param_8, param_7);
              trace_a32____a_ilen_read_upto8_at <-
              (trace_a32____a_ilen_read_upto8_at ++ tmp__trace);
              t8 <- result_3;
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
    return (dELTA, lEN, tRAIL, aT, w, trace_a32____a_ilen_read_upto8_at);
  }
  proc a32____a_ilen_write_upto8 (buf:BArray32.t, b_buf:BArray32.t,
                                  offset:int, dELTA:int, lEN:int, w:W64.t) : 
  BArray32.t * BArray32.t * int * int * trace = {
    var trace_a32____a_ilen_write_upto8:trace;
    trace_a32____a_ilen_write_upto8 <- [];
    trace_a32____a_ilen_write_upto8 <-
    (trace_a32____a_ilen_write_upto8 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     (((BArray32.is_init b_buf 0 (offset + dELTA)) /\ (0 <= dELTA)) /\
     (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 32)))))))))]);
    trace_a32____a_ilen_write_upto8 <-
    (trace_a32____a_ilen_write_upto8 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        trace_a32____a_ilen_write_upto8 <-
        (trace_a32____a_ilen_write_upto8 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace_a32____a_ilen_write_upto8 <-
        (trace_a32____a_ilen_write_upto8 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace_a32____a_ilen_write_upto8 <-
        (trace_a32____a_ilen_write_upto8 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= 32)))]);
        b_buf <-
        (BArray32.set64d b_buf (offset + dELTA)
        (W64.of_int 18446744073709551615));
        buf <- (BArray32.set64d buf (offset + dELTA) w);
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          trace_a32____a_ilen_write_upto8 <-
          (trace_a32____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a32____a_ilen_write_upto8 <-
          (trace_a32____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a32____a_ilen_write_upto8 <-
          (trace_a32____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= 32)))]);
          b_buf <-
          (BArray32.set32d b_buf (offset + dELTA) (W32.of_int 4294967295));
          buf <- (BArray32.set32d buf (offset + dELTA) (truncateu32 w));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          trace_a32____a_ilen_write_upto8 <-
          (trace_a32____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a32____a_ilen_write_upto8 <-
          (trace_a32____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a32____a_ilen_write_upto8 <-
          (trace_a32____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= 32)))]);
          b_buf <-
          (BArray32.set16d b_buf (offset + dELTA) (W16.of_int 65535));
          buf <- (BArray32.set16d buf (offset + dELTA) (truncateu16 w));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          trace_a32____a_ilen_write_upto8 <-
          (trace_a32____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a32____a_ilen_write_upto8 <-
          (trace_a32____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a32____a_ilen_write_upto8 <-
          (trace_a32____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= 32)))]);
          b_buf <- (BArray32.set8d b_buf (offset + dELTA) (W8.of_int 255));
          buf <- (BArray32.set8d buf (offset + dELTA) (truncateu8 w));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, b_buf, dELTA, lEN, trace_a32____a_ilen_write_upto8);
  }
  proc a32____addstate_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                            buf:BArray32.t, b_buf:BArray32.t, offset:int,
                            _LEN:int, _TRAILB:int) : BArray200.t *
                                                     BArray200.t * int *
                                                     int * trace = {
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var at:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:BArray32.t;
    var result:W64.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var result_3:int;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:BArray32.t;
    var result_4:W64.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var b_param:BArray32.t;
    var b_param_0:BArray32.t;
    var trace_a32____addstate_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    param_5 <- witness;
    param_12 <- witness;
    trace_a32____addstate_ref <- [];
    trace_a32____addstate_ref <-
    (trace_a32____addstate_ref ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     (((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= 32)) /\
      (BArray32.is_init b_buf offset _LEN)) /\
     (BArray200.is_init b_st 0 200)))))]);
    trace_a32____addstate_ref <-
    (trace_a32____addstate_ref ++
    [(Assert,
     ((((0 <= _TRAILB) /\ (_TRAILB < 256)) /\ (0 <= aT)) /\
     (((aT + _LEN) + ((_TRAILB <> 0) ? 1 : 0)) < 200)))]);
    trace_a32____addstate_ref <-
    (trace_a32____addstate_ref ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      b_param_0 <- b_buf;
      param_5 <- buf;
      param_4 <- offset;
      param_3 <- dELTA;
      param_2 <- _LEN;
      param_1 <- _TRAILB;
      param_0 <- aT;
      param <- aT8;
      (result_3, result_2, result_1, result_0, result, tmp__trace) <@ 
      a32____a_ilen_read_upto8_at (param_5, b_param_0, param_4, param_3,
      param_2, param_1, param_0, param);
      trace_a32____addstate_ref <- (trace_a32____addstate_ref ++ tmp__trace);
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert,
       (((param_0 <= param) /\ (param < (param_0 + 8))) ? ((((result_3 =
                                                             (param_3 +
                                                             ((((param_2 <
                                                                (8 -
                                                                (param -
                                                                param_0))) ? 
                                                               param_2 : 
                                                               (8 -
                                                               (param -
                                                               param_0))) <
                                                              0) ? 0 : 
                                                             ((param_2 <
                                                              (8 -
                                                              (param -
                                                              param_0))) ? 
                                                             param_2 : 
                                                             (8 -
                                                             (param -
                                                             param_0)))))) /\
                                                            (result_2 =
                                                            (param_2 -
                                                            ((((param_2 <
                                                               (8 -
                                                               (param -
                                                               param_0))) ? 
                                                              param_2 : 
                                                              (8 -
                                                              (param -
                                                              param_0))) <
                                                             0) ? 0 : 
                                                            ((param_2 <
                                                             (8 -
                                                             (param -
                                                             param_0))) ? 
                                                            param_2 : 
                                                            (8 -
                                                            (param - param_0))))))) /\
                                                           (result_1 =
                                                           ((8 <=
                                                            ((param -
                                                             param_0) +
                                                            param_2)) ? 
                                                           param_1 : 0))) /\
                                                          (result_0 =
                                                          (param_0 +
                                                          (((((((param -
                                                                param_0) +
                                                               param_2) <
                                                              8) ? ((
                                                                    param -
                                                                    param_0) +
                                                                   param_2) : 8) +
                                                            (((8 <=
                                                              ((param -
                                                               param_0) +
                                                              param_2)) \/
                                                             (param_1 = 0)) ? 0 : 1)) <
                                                           0) ? 0 : (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2)) \/
                                                                    (
                                                                    param_1 =
                                                                    0)) ? 0 : 1)))))) : 
       ((((result_3 = param_3) /\ (result_2 = param_2)) /\
        (result_1 = param_1)) /\
       (result_0 = param))))]);
      dELTA <- result_3;
      _LEN <- result_2;
      _TRAILB <- result_1;
      aT8 <- result_0;
      w <- result;
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      st <-
      (BArray200.set64 st (aT %/ 8) ((BArray200.get64 st (aT %/ 8)) `^` w));
      aT <- aT8;
    } else {
      
    }
    trace_a32____addstate_ref <-
    (trace_a32____addstate_ref ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace_a32____addstate_ref <-
    (trace_a32____addstate_ref ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    trace_a32____addstate_ref <-
    (trace_a32____addstate_ref ++
    [(Assert, ((0 <= (aT %/ 8)) /\ ((aT %/ 8) <= 18446744073709551615)))]);
    at <- (aT %/ 8);
    trace_a32____addstate_ref <-
    (trace_a32____addstate_ref ++
    [(Assert,
     ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
     (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= 32)))]);
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert, (BArray32.is_init b_buf offset 8))]);
      w <- (BArray32.get64d buf offset);
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      at <- (at + 1);
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert,
       ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
       (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      b_param <- b_buf;
      param_12 <- buf;
      param_11 <- offset;
      param_10 <- 0;
      param_9 <- _LEN;
      param_8 <- _TRAILB;
      param_7 <- aT;
      param_6 <- aT;
      (result_8, result_7, result_6, result_5, result_4, tmp__trace) <@ 
      a32____a_ilen_read_upto8_at (param_12, b_param, param_11, param_10,
      param_9, param_8, param_7, param_6);
      trace_a32____addstate_ref <- (trace_a32____addstate_ref ++ tmp__trace);
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert,
       (((param_7 <= param_6) /\ (param_6 < (param_7 + 8))) ? ((((result_8 =
                                                                 (param_10 +
                                                                 ((((
                                                                    param_9 <
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                   param_9 : 
                                                                   (8 -
                                                                   (param_6 -
                                                                   param_7))) <
                                                                  0) ? 0 : 
                                                                 ((param_9 <
                                                                  (8 -
                                                                  (param_6 -
                                                                  param_7))) ? 
                                                                 param_9 : 
                                                                 (8 -
                                                                 (param_6 -
                                                                 param_7)))))) /\
                                                                (result_7 =
                                                                (param_9 -
                                                                ((((param_9 <
                                                                   (8 -
                                                                   (param_6 -
                                                                   param_7))) ? 
                                                                  param_9 : 
                                                                  (8 -
                                                                  (param_6 -
                                                                  param_7))) <
                                                                 0) ? 0 : 
                                                                ((param_9 <
                                                                 (8 -
                                                                 (param_6 -
                                                                 param_7))) ? 
                                                                param_9 : 
                                                                (8 -
                                                                (param_6 -
                                                                param_7))))))) /\
                                                               (result_6 =
                                                               ((8 <=
                                                                ((param_6 -
                                                                 param_7) +
                                                                param_9)) ? 
                                                               param_8 : 0))) /\
                                                              (result_5 =
                                                              (param_7 +
                                                              (((((((
                                                                    param_6 -
                                                                    param_7) +
                                                                   param_9) <
                                                                  8) ? 
                                                                 ((param_6 -
                                                                  param_7) +
                                                                 param_9) : 8) +
                                                                (((8 <=
                                                                  ((param_6 -
                                                                   param_7) +
                                                                  param_9)) \/
                                                                 (param_8 =
                                                                 0)) ? 0 : 1)) <
                                                               0) ? 0 : 
                                                              (((((param_6 -
                                                                  param_7) +
                                                                 param_9) <
                                                                8) ? 
                                                               ((param_6 -
                                                                param_7) +
                                                               param_9) : 8) +
                                                              (((8 <=
                                                                ((param_6 -
                                                                 param_7) +
                                                                param_9)) \/
                                                               (param_8 = 0)) ? 0 : 1)))))) : 
       ((((result_8 = param_10) /\ (result_7 = param_9)) /\
        (result_6 = param_8)) /\
       (result_5 = param_6))))]);
      dELTA <- result_8;
      aT <- result_5;
      w <- result_4;
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace_a32____addstate_ref <-
      (trace_a32____addstate_ref ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, offset, trace_a32____addstate_ref);
  }
  proc a32____absorb_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                          buf:BArray32.t, b_buf:BArray32.t, _TRAILB:int,
                          _RATE8:int) : BArray200.t * BArray200.t * int *
                                        trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_1:int;
    var aux_2:int;
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:BArray32.t;
    var param_3:int;
    var param_4:BArray200.t;
    var result:int;
    var result_0:int;
    var result_1:BArray200.t;
    var param_5:BArray200.t;
    var result_2:BArray200.t;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:BArray32.t;
    var param_10:int;
    var param_11:BArray200.t;
    var result_3:int;
    var result_4:int;
    var result_5:BArray200.t;
    var param_12:BArray200.t;
    var result_6:BArray200.t;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var param_16:BArray32.t;
    var param_17:int;
    var param_18:BArray200.t;
    var result_7:int;
    var result_8:int;
    var result_9:BArray200.t;
    var param_19:int;
    var param_20:BArray200.t;
    var result_10:BArray200.t;
    var b_result:BArray200.t;
    var b_result_0:BArray200.t;
    var b_param:BArray200.t;
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_result_3:BArray200.t;
    var b_result_4:BArray200.t;
    var b_param_0:BArray200.t;
    var trace_a32____absorb_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    param_2 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_9 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    param_16 <- witness;
    param_18 <- witness;
    param_20 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_5 <- witness;
    result_6 <- witness;
    result_9 <- witness;
    result_10 <- witness;
    trace_a32____absorb_ref <- [];
    trace_a32____absorb_ref <-
    (trace_a32____absorb_ref ++
    [(Assert,
     ((((((((0 < _RATE8) /\ (_RATE8 < 200)) /\ (0 <= _TRAILB)) /\
         (_TRAILB < 256)) /\
        (0 <= aT)) /\
       (aT < _RATE8)) /\
      (BArray32.is_init b_buf 0 32)) /\
     (BArray200.is_init b_st 0 224)))]);
    offset <- 0;
    _LEN <- 32;
    if ((_RATE8 <= (aT + _LEN))) {
      b_param_0 <- b_st;
      param_4 <- st;
      param_3 <- aT;
      param_2 <- buf;
      param_1 <- offset;
      param_0 <- (_RATE8 - aT);
      param <- 0;
      (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a32____addstate_ref (
      param_4, b_param_0, param_3, param_2,
      (BArray32.init_arr (W8.of_int 255)), param_1, param_0, param);
      result_1 <- aux;
      b_result_4 <- aux_0;
      result_0 <- aux_1;
      result <- aux_2;
      trace_a32____absorb_ref <- (trace_a32____absorb_ref ++ tmp__trace);
      trace_a32____absorb_ref <-
      (trace_a32____absorb_ref ++
      [(Assert,
       (((0 <= param_0) /\ (param_0 <= 18446744073709551615)) /\
       (((0 <= (param_1 + param_0)) /\
        ((param_1 + param_0) <= 18446744073709551615)) /\
       (((BArray200.is_init b_result_4 0 200) /\
        (result_0 = ((param_3 + param_0) + ((param <> 0) ? 1 : 0)))) /\
       (result = (param_1 + param_0))))))]);
      trace_a32____absorb_ref <-
      (trace_a32____absorb_ref ++
      [(Assert, ((0 <= result) /\ (result <= 18446744073709551615)))]);
      st <- result_1;
      offset <- result;
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      param_5 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_5,
      (BArray200.init_arr (W8.of_int 255)));
      result_2 <- aux;
      b_result_3 <- aux_0;
      trace_a32____absorb_ref <- (trace_a32____absorb_ref ++ tmp__trace);
      trace_a32____absorb_ref <-
      (trace_a32____absorb_ref ++
      [(Assert, (BArray200.is_init b_result_3 0 200))]);
      b_st <- (BArray200.init_arr (W8.of_int 255));
      st <- result_2;
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      trace_a32____absorb_ref <-
      (trace_a32____absorb_ref ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_11 <- st;
        param_10 <- 0;
        param_9 <- buf;
        param_8 <- offset;
        param_7 <- _RATE8;
        param_6 <- 0;
        (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a32____addstate_ref (
        param_11, (BArray200.init_arr (W8.of_int 255)), param_10, param_9,
        (BArray32.init_arr (W8.of_int 255)), param_8, param_7, param_6);
        result_5 <- aux;
        b_result_2 <- aux_0;
        result_4 <- aux_1;
        result_3 <- aux_2;
        trace_a32____absorb_ref <- (trace_a32____absorb_ref ++ tmp__trace);
        trace_a32____absorb_ref <-
        (trace_a32____absorb_ref ++
        [(Assert,
         (((0 <= param_7) /\ (param_7 <= 18446744073709551615)) /\
         (((0 <= (param_8 + param_7)) /\
          ((param_8 + param_7) <= 18446744073709551615)) /\
         (((BArray200.is_init b_result_2 0 200) /\
          (result_4 = ((param_10 + param_7) + ((param_6 <> 0) ? 1 : 0)))) /\
         (result_3 = (param_8 + param_7))))))]);
        trace_a32____absorb_ref <-
        (trace_a32____absorb_ref ++
        [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
        st <- result_5;
        offset <- result_3;
        (* Erased call to spill *)
        param_12 <- st;
        (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_12,
        (BArray200.init_arr (W8.of_int 255)));
        result_6 <- aux;
        b_result_1 <- aux_0;
        trace_a32____absorb_ref <- (trace_a32____absorb_ref ++ tmp__trace);
        trace_a32____absorb_ref <-
        (trace_a32____absorb_ref ++
        [(Assert, (BArray200.is_init b_result_1 0 200))]);
        b_st <- (BArray200.init_arr (W8.of_int 255));
        st <- result_6;
        (* Erased call to unspill *)
        trace_a32____absorb_ref <-
        (trace_a32____absorb_ref ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace_a32____absorb_ref <-
        (trace_a32____absorb_ref ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    b_param <- b_st;
    param_18 <- st;
    param_17 <- aT;
    param_16 <- buf;
    param_15 <- offset;
    param_14 <- _LEN;
    param_13 <- _TRAILB;
    (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a32____addstate_ref (param_18,
    b_param, param_17, param_16, (BArray32.init_arr (W8.of_int 255)),
    param_15, param_14, param_13);
    result_9 <- aux;
    b_result_0 <- aux_0;
    result_8 <- aux_1;
    result_7 <- aux_2;
    trace_a32____absorb_ref <- (trace_a32____absorb_ref ++ tmp__trace);
    trace_a32____absorb_ref <-
    (trace_a32____absorb_ref ++
    [(Assert,
     (((0 <= param_14) /\ (param_14 <= 18446744073709551615)) /\
     (((0 <= (param_15 + param_14)) /\
      ((param_15 + param_14) <= 18446744073709551615)) /\
     (((BArray200.is_init b_result_0 0 200) /\
      (result_8 = ((param_17 + param_14) + ((param_13 <> 0) ? 1 : 0)))) /\
     (result_7 = (param_15 + param_14))))))]);
    trace_a32____absorb_ref <-
    (trace_a32____absorb_ref ++
    [(Assert, ((0 <= result_7) /\ (result_7 <= 18446744073709551615)))]);
    st <- result_9;
    aT <- result_8;
    if ((_TRAILB <> 0)) {
      param_20 <- st;
      param_19 <- _RATE8;
      (aux, aux_0, tmp__trace) <@ __addratebit_ref (param_20,
      (BArray200.init_arr (W8.of_int 255)), param_19);
      result_10 <- aux;
      b_result <- aux_0;
      trace_a32____absorb_ref <- (trace_a32____absorb_ref ++ tmp__trace);
      trace_a32____absorb_ref <-
      (trace_a32____absorb_ref ++
      [(Assert, (BArray200.is_init b_result 0 200))]);
      st <- result_10;
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, trace_a32____absorb_ref);
  }
  proc a32____dumpstate_ref (buf:BArray32.t, b_buf:BArray32.t, offset:int,
                             _LEN:int, st:BArray200.t, b_st:BArray200.t) : 
  BArray32.t * BArray32.t * int * trace = {
    var t:W64.t;
    var dELTA:int;
    var i:int;
    var param:W64.t;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArray32.t;
    var result:int;
    var result_0:int;
    var result_1:BArray32.t;
    var b_result:BArray32.t;
    var b_param:BArray32.t;
    var trace_a32____dumpstate_ref:trace;
    b_param <- witness;
    b_result <- witness;
    param_3 <- witness;
    result_1 <- witness;
    trace_a32____dumpstate_ref <- [];
    trace_a32____dumpstate_ref <-
    (trace_a32____dumpstate_ref ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     ((((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= 32)) /\
       (BArray200.is_init b_st 0 224)) /\
      (_LEN <= 200)) /\
     (BArray32.is_init b_buf 0 offset)))))]);
    trace_a32____dumpstate_ref <-
    (trace_a32____dumpstate_ref ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    i <- 0;
    trace_a32____dumpstate_ref <-
    (trace_a32____dumpstate_ref ++
    [(Assert, ((0 <= (_LEN %/ 8)) /\ ((_LEN %/ 8) <= 18446744073709551615)))]);
    while ((i < (_LEN %/ 8))) {
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++
      [(Assert, (BArray200.is_init b_st (i * 8) 8))]);
      t <- (BArray200.get64 st i);
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= 32)))]);
      b_buf <-
      (BArray32.set64d b_buf offset (W64.of_int 18446744073709551615));
      buf <- (BArray32.set64d buf offset t);
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++
      [(Assert,
       ((0 <= (_LEN %/ 8)) /\ ((_LEN %/ 8) <= 18446744073709551615)))]);
    }
    if ((0 < (_LEN %% 8))) {
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++
      [(Assert, (BArray200.is_init b_st (i * 8) 8))]);
      t <- (BArray200.get64 st i);
      b_param <- b_buf;
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- 0;
      param_0 <- (_LEN %% 8);
      param <- t;
      (result_1, b_result, result_0, result, tmp__trace) <@ a32____a_ilen_write_upto8 (
      param_3, b_param, param_2, param_1, param_0, param);
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++ tmp__trace);
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (((0 <=
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8))) /\
        (((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)) <=
        18446744073709551615)) /\
       (((0 <=
         ((param_2 + param_1) +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))) /\
        (((param_2 + param_1) +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8))) <=
        18446744073709551615)) /\
       (((result_0 =
         (param_1 +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))) /\
        (result =
        (param_0 -
        ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8))))) /\
       (BArray32.is_init b_result 0
       ((param_2 + param_1) +
       ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8)))
       )))))))]);
      b_buf <- b_result;
      buf <- result_1;
      dELTA <- result_0;
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace_a32____dumpstate_ref <-
      (trace_a32____dumpstate_ref ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (buf, b_buf, offset, trace_a32____dumpstate_ref);
  }
  proc a32____squeeze_ref (st:BArray200.t, b_st:BArray200.t, buf:BArray32.t,
                           b_buf:BArray32.t, _RATE8:int) : BArray200.t *
                                                           BArray200.t *
                                                           BArray32.t *
                                                           BArray32.t * trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var offset:int;
    var i:int;
    var param:BArray200.t;
    var result:BArray200.t;
    var param_0:BArray200.t;
    var param_1:int;
    var param_2:int;
    var param_3:BArray32.t;
    var result_0:int;
    var result_1:BArray32.t;
    var param_4:BArray200.t;
    var result_2:BArray200.t;
    var param_5:BArray200.t;
    var param_6:int;
    var param_7:int;
    var param_8:BArray32.t;
    var result_3:int;
    var result_4:BArray32.t;
    var b_result:BArray32.t;
    var b_param:BArray32.t;
    var b_result_0:BArray200.t;
    var b_param_0:BArray200.t;
    var b_result_1:BArray32.t;
    var b_param_1:BArray32.t;
    var b_result_2:BArray200.t;
    var b_param_2:BArray200.t;
    var trace_a32____squeeze_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    param <- witness;
    param_0 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_8 <- witness;
    result <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_4 <- witness;
    trace_a32____squeeze_ref <- [];
    trace_a32____squeeze_ref <-
    (trace_a32____squeeze_ref ++
    [(Assert,
     (((0 < _RATE8) /\ (_RATE8 < 200)) /\ (BArray200.is_init b_st 0 224)))]);
    offset <- 0;
    i <- 0;
    trace_a32____squeeze_ref <-
    (trace_a32____squeeze_ref ++
    [(Assert,
     ((0 <= (32 %/ _RATE8)) /\ ((32 %/ _RATE8) <= 18446744073709551615)))]);
    while ((i < (32 %/ _RATE8))) {
      (* Erased call to spill *)
      b_param_2 <- b_st;
      param <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param, b_param_2);
      result <- aux;
      b_result_2 <- aux_0;
      trace_a32____squeeze_ref <- (trace_a32____squeeze_ref ++ tmp__trace);
      trace_a32____squeeze_ref <-
      (trace_a32____squeeze_ref ++
      [(Assert, (BArray200.is_init b_result_2 0 200))]);
      b_st <- (BArray200.init_arr (W8.of_int 255));
      st <- result;
      (* Erased call to unspill *)
      b_param_1 <- b_buf;
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- _RATE8;
      param_0 <- st;
      (result_1, b_result_1, result_0, tmp__trace) <@ a32____dumpstate_ref (
      param_3, b_param_1, param_2, param_1, param_0,
      (BArray200.init_arr (W8.of_int 255)));
      trace_a32____squeeze_ref <- (trace_a32____squeeze_ref ++ tmp__trace);
      trace_a32____squeeze_ref <-
      (trace_a32____squeeze_ref ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (result_0 = (param_2 + param_1)))))]);
      trace_a32____squeeze_ref <-
      (trace_a32____squeeze_ref ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (BArray32.is_init b_result_1 0 (param_2 + param_1)))))]);
      trace_a32____squeeze_ref <-
      (trace_a32____squeeze_ref ++
      [(Assert, ((0 <= result_0) /\ (result_0 <= 18446744073709551615)))]);
      b_buf <- b_result_1;
      buf <- result_1;
      offset <- result_0;
      (* Erased call to unspill *)
      trace_a32____squeeze_ref <-
      (trace_a32____squeeze_ref ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace_a32____squeeze_ref <-
      (trace_a32____squeeze_ref ++
      [(Assert,
       ((0 <= (32 %/ _RATE8)) /\ ((32 %/ _RATE8) <= 18446744073709551615)))]);
    }
    if ((0 < (32 %% _RATE8))) {
      (* Erased call to spill *)
      b_param_0 <- b_st;
      param_4 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_4, b_param_0);
      result_2 <- aux;
      b_result_0 <- aux_0;
      trace_a32____squeeze_ref <- (trace_a32____squeeze_ref ++ tmp__trace);
      trace_a32____squeeze_ref <-
      (trace_a32____squeeze_ref ++
      [(Assert, (BArray200.is_init b_result_0 0 200))]);
      b_st <- (BArray200.init_arr (W8.of_int 255));
      st <- result_2;
      (* Erased call to unspill *)
      b_param <- b_buf;
      param_8 <- buf;
      param_7 <- offset;
      param_6 <- (32 %% _RATE8);
      param_5 <- st;
      (result_4, b_result, result_3, tmp__trace) <@ a32____dumpstate_ref (
      param_8, b_param, param_7, param_6, param_5,
      (BArray200.init_arr (W8.of_int 255)));
      trace_a32____squeeze_ref <- (trace_a32____squeeze_ref ++ tmp__trace);
      trace_a32____squeeze_ref <-
      (trace_a32____squeeze_ref ++
      [(Assert,
       (((0 <= param_6) /\ (param_6 <= 18446744073709551615)) /\
       (((0 <= (param_7 + param_6)) /\
        ((param_7 + param_6) <= 18446744073709551615)) /\
       (result_3 = (param_7 + param_6)))))]);
      trace_a32____squeeze_ref <-
      (trace_a32____squeeze_ref ++
      [(Assert,
       (((0 <= param_6) /\ (param_6 <= 18446744073709551615)) /\
       (((0 <= (param_7 + param_6)) /\
        ((param_7 + param_6) <= 18446744073709551615)) /\
       (BArray32.is_init b_result 0 (param_7 + param_6)))))]);
      trace_a32____squeeze_ref <-
      (trace_a32____squeeze_ref ++
      [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
      b_buf <- b_result;
      buf <- result_4;
    } else {
      
    }
    return (st, b_st, buf, b_buf, trace_a32____squeeze_ref);
  }
  proc a33____a_ilen_read_upto8_at (buf:BArray33.t, b_buf:BArray33.t,
                                    offset:int, dELTA:int, lEN:int,
                                    tRAIL:int, cUR:int, aT:int) : int * int *
                                                                  int * int *
                                                                  W64.t *
                                                                  trace = {
    var w:W64.t;
    var aT8:int;
    var t16:W64.t;
    var t8:W64.t;
    var param:int;
    var param_0:W64.t;
    var result:W64.t;
    var param_1:int;
    var param_2:W64.t;
    var result_0:W64.t;
    var param_3:int;
    var param_4:W64.t;
    var result_1:W64.t;
    var param_5:int;
    var param_6:W64.t;
    var result_2:W64.t;
    var param_7:int;
    var param_8:W64.t;
    var result_3:W64.t;
    var trace_a33____a_ilen_read_upto8_at:trace;
    trace_a33____a_ilen_read_upto8_at <- [];
    trace_a33____a_ilen_read_upto8_at <-
    (trace_a33____a_ilen_read_upto8_at ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     ((((((BArray33.is_init b_buf (offset + dELTA) ((lEN < 8) ? lEN : 8)) /\
         (0 <= dELTA)) /\
        (0 <= offset)) /\
       (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 33)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256)))))))))]);
    trace_a33____a_ilen_read_upto8_at <-
    (trace_a33____a_ilen_read_upto8_at ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        trace_a33____a_ilen_read_upto8_at <-
        (trace_a33____a_ilen_read_upto8_at ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace_a33____a_ilen_read_upto8_at <-
        (trace_a33____a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace_a33____a_ilen_read_upto8_at <-
        (trace_a33____a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= 33)))]);
        trace_a33____a_ilen_read_upto8_at <-
        (trace_a33____a_ilen_read_upto8_at ++
        [(Assert, (BArray33.is_init b_buf (offset + dELTA) 8))]);
        w <- (BArray33.get64d buf (offset + dELTA));
        param_0 <- w;
        param <- aT8;
        (result, tmp__trace) <@ __SHLQ (param_0, param);
        trace_a33____a_ilen_read_upto8_at <-
        (trace_a33____a_ilen_read_upto8_at ++ tmp__trace);
        w <- result;
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          trace_a33____a_ilen_read_upto8_at <-
          (trace_a33____a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a33____a_ilen_read_upto8_at <-
          (trace_a33____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a33____a_ilen_read_upto8_at <-
          (trace_a33____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= 33)))]);
          trace_a33____a_ilen_read_upto8_at <-
          (trace_a33____a_ilen_read_upto8_at ++
          [(Assert, (BArray33.is_init b_buf (offset + dELTA) 4))]);
          w <- (zeroextu64 (BArray33.get32d buf (offset + dELTA)));
          param_2 <- w;
          param_1 <- aT8;
          (result_0, tmp__trace) <@ __SHLQ (param_2, param_1);
          trace_a33____a_ilen_read_upto8_at <-
          (trace_a33____a_ilen_read_upto8_at ++ tmp__trace);
          w <- result_0;
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          trace_a33____a_ilen_read_upto8_at <-
          (trace_a33____a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a33____a_ilen_read_upto8_at <-
          (trace_a33____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a33____a_ilen_read_upto8_at <-
          (trace_a33____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= 33)))]);
          trace_a33____a_ilen_read_upto8_at <-
          (trace_a33____a_ilen_read_upto8_at ++
          [(Assert, (BArray33.is_init b_buf (offset + dELTA) 2))]);
          t16 <- (zeroextu64 (BArray33.get16d buf (offset + dELTA)));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          param_4 <- t16;
          param_3 <- aT8;
          (result_1, tmp__trace) <@ __SHLQ (param_4, param_3);
          trace_a33____a_ilen_read_upto8_at <-
          (trace_a33____a_ilen_read_upto8_at ++ tmp__trace);
          t16 <- result_1;
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            trace_a33____a_ilen_read_upto8_at <-
            (trace_a33____a_ilen_read_upto8_at ++
            [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
            trace_a33____a_ilen_read_upto8_at <-
            (trace_a33____a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\
             ((offset + dELTA) <= 18446744073709551615)))]);
            trace_a33____a_ilen_read_upto8_at <-
            (trace_a33____a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= 33)))]);
            trace_a33____a_ilen_read_upto8_at <-
            (trace_a33____a_ilen_read_upto8_at ++
            [(Assert, (BArray33.is_init b_buf (offset + dELTA) 1))]);
            t8 <- (zeroextu64 (BArray33.get8d buf (offset + dELTA)));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            param_6 <- t8;
            param_5 <- aT8;
            (result_2, tmp__trace) <@ __SHLQ (param_6, param_5);
            trace_a33____a_ilen_read_upto8_at <-
            (trace_a33____a_ilen_read_upto8_at ++ tmp__trace);
            t8 <- result_2;
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
              param_8 <- t8;
              param_7 <- aT8;
              (result_3, tmp__trace) <@ __SHLQ (param_8, param_7);
              trace_a33____a_ilen_read_upto8_at <-
              (trace_a33____a_ilen_read_upto8_at ++ tmp__trace);
              t8 <- result_3;
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
    return (dELTA, lEN, tRAIL, aT, w, trace_a33____a_ilen_read_upto8_at);
  }
  proc a33____addstate_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                            buf:BArray33.t, b_buf:BArray33.t, offset:int,
                            _LEN:int, _TRAILB:int) : BArray200.t *
                                                     BArray200.t * int *
                                                     int * trace = {
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var at:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:BArray33.t;
    var result:W64.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var result_3:int;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:BArray33.t;
    var result_4:W64.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var b_param:BArray33.t;
    var b_param_0:BArray33.t;
    var trace_a33____addstate_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    param_5 <- witness;
    param_12 <- witness;
    trace_a33____addstate_ref <- [];
    trace_a33____addstate_ref <-
    (trace_a33____addstate_ref ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     (((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= 33)) /\
      (BArray33.is_init b_buf offset _LEN)) /\
     (BArray200.is_init b_st 0 200)))))]);
    trace_a33____addstate_ref <-
    (trace_a33____addstate_ref ++
    [(Assert,
     ((((0 <= _TRAILB) /\ (_TRAILB < 256)) /\ (0 <= aT)) /\
     (((aT + _LEN) + ((_TRAILB <> 0) ? 1 : 0)) < 200)))]);
    trace_a33____addstate_ref <-
    (trace_a33____addstate_ref ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      b_param_0 <- b_buf;
      param_5 <- buf;
      param_4 <- offset;
      param_3 <- dELTA;
      param_2 <- _LEN;
      param_1 <- _TRAILB;
      param_0 <- aT;
      param <- aT8;
      (result_3, result_2, result_1, result_0, result, tmp__trace) <@ 
      a33____a_ilen_read_upto8_at (param_5, b_param_0, param_4, param_3,
      param_2, param_1, param_0, param);
      trace_a33____addstate_ref <- (trace_a33____addstate_ref ++ tmp__trace);
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert,
       (((param_0 <= param) /\ (param < (param_0 + 8))) ? ((((result_3 =
                                                             (param_3 +
                                                             ((((param_2 <
                                                                (8 -
                                                                (param -
                                                                param_0))) ? 
                                                               param_2 : 
                                                               (8 -
                                                               (param -
                                                               param_0))) <
                                                              0) ? 0 : 
                                                             ((param_2 <
                                                              (8 -
                                                              (param -
                                                              param_0))) ? 
                                                             param_2 : 
                                                             (8 -
                                                             (param -
                                                             param_0)))))) /\
                                                            (result_2 =
                                                            (param_2 -
                                                            ((((param_2 <
                                                               (8 -
                                                               (param -
                                                               param_0))) ? 
                                                              param_2 : 
                                                              (8 -
                                                              (param -
                                                              param_0))) <
                                                             0) ? 0 : 
                                                            ((param_2 <
                                                             (8 -
                                                             (param -
                                                             param_0))) ? 
                                                            param_2 : 
                                                            (8 -
                                                            (param - param_0))))))) /\
                                                           (result_1 =
                                                           ((8 <=
                                                            ((param -
                                                             param_0) +
                                                            param_2)) ? 
                                                           param_1 : 0))) /\
                                                          (result_0 =
                                                          (param_0 +
                                                          (((((((param -
                                                                param_0) +
                                                               param_2) <
                                                              8) ? ((
                                                                    param -
                                                                    param_0) +
                                                                   param_2) : 8) +
                                                            (((8 <=
                                                              ((param -
                                                               param_0) +
                                                              param_2)) \/
                                                             (param_1 = 0)) ? 0 : 1)) <
                                                           0) ? 0 : (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2)) \/
                                                                    (
                                                                    param_1 =
                                                                    0)) ? 0 : 1)))))) : 
       ((((result_3 = param_3) /\ (result_2 = param_2)) /\
        (result_1 = param_1)) /\
       (result_0 = param))))]);
      dELTA <- result_3;
      _LEN <- result_2;
      _TRAILB <- result_1;
      aT8 <- result_0;
      w <- result;
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      st <-
      (BArray200.set64 st (aT %/ 8) ((BArray200.get64 st (aT %/ 8)) `^` w));
      aT <- aT8;
    } else {
      
    }
    trace_a33____addstate_ref <-
    (trace_a33____addstate_ref ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace_a33____addstate_ref <-
    (trace_a33____addstate_ref ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    trace_a33____addstate_ref <-
    (trace_a33____addstate_ref ++
    [(Assert, ((0 <= (aT %/ 8)) /\ ((aT %/ 8) <= 18446744073709551615)))]);
    at <- (aT %/ 8);
    trace_a33____addstate_ref <-
    (trace_a33____addstate_ref ++
    [(Assert,
     ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
     (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= 33)))]);
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert, (BArray33.is_init b_buf offset 8))]);
      w <- (BArray33.get64d buf offset);
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      at <- (at + 1);
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert,
       ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
       (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      b_param <- b_buf;
      param_12 <- buf;
      param_11 <- offset;
      param_10 <- 0;
      param_9 <- _LEN;
      param_8 <- _TRAILB;
      param_7 <- aT;
      param_6 <- aT;
      (result_8, result_7, result_6, result_5, result_4, tmp__trace) <@ 
      a33____a_ilen_read_upto8_at (param_12, b_param, param_11, param_10,
      param_9, param_8, param_7, param_6);
      trace_a33____addstate_ref <- (trace_a33____addstate_ref ++ tmp__trace);
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert,
       (((param_7 <= param_6) /\ (param_6 < (param_7 + 8))) ? ((((result_8 =
                                                                 (param_10 +
                                                                 ((((
                                                                    param_9 <
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                   param_9 : 
                                                                   (8 -
                                                                   (param_6 -
                                                                   param_7))) <
                                                                  0) ? 0 : 
                                                                 ((param_9 <
                                                                  (8 -
                                                                  (param_6 -
                                                                  param_7))) ? 
                                                                 param_9 : 
                                                                 (8 -
                                                                 (param_6 -
                                                                 param_7)))))) /\
                                                                (result_7 =
                                                                (param_9 -
                                                                ((((param_9 <
                                                                   (8 -
                                                                   (param_6 -
                                                                   param_7))) ? 
                                                                  param_9 : 
                                                                  (8 -
                                                                  (param_6 -
                                                                  param_7))) <
                                                                 0) ? 0 : 
                                                                ((param_9 <
                                                                 (8 -
                                                                 (param_6 -
                                                                 param_7))) ? 
                                                                param_9 : 
                                                                (8 -
                                                                (param_6 -
                                                                param_7))))))) /\
                                                               (result_6 =
                                                               ((8 <=
                                                                ((param_6 -
                                                                 param_7) +
                                                                param_9)) ? 
                                                               param_8 : 0))) /\
                                                              (result_5 =
                                                              (param_7 +
                                                              (((((((
                                                                    param_6 -
                                                                    param_7) +
                                                                   param_9) <
                                                                  8) ? 
                                                                 ((param_6 -
                                                                  param_7) +
                                                                 param_9) : 8) +
                                                                (((8 <=
                                                                  ((param_6 -
                                                                   param_7) +
                                                                  param_9)) \/
                                                                 (param_8 =
                                                                 0)) ? 0 : 1)) <
                                                               0) ? 0 : 
                                                              (((((param_6 -
                                                                  param_7) +
                                                                 param_9) <
                                                                8) ? 
                                                               ((param_6 -
                                                                param_7) +
                                                               param_9) : 8) +
                                                              (((8 <=
                                                                ((param_6 -
                                                                 param_7) +
                                                                param_9)) \/
                                                               (param_8 = 0)) ? 0 : 1)))))) : 
       ((((result_8 = param_10) /\ (result_7 = param_9)) /\
        (result_6 = param_8)) /\
       (result_5 = param_6))))]);
      dELTA <- result_8;
      aT <- result_5;
      w <- result_4;
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace_a33____addstate_ref <-
      (trace_a33____addstate_ref ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, offset, trace_a33____addstate_ref);
  }
  proc a33____absorb_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                          buf:BArray33.t, b_buf:BArray33.t, _TRAILB:int,
                          _RATE8:int) : BArray200.t * BArray200.t * int *
                                        trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_1:int;
    var aux_2:int;
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:BArray33.t;
    var param_3:int;
    var param_4:BArray200.t;
    var result:int;
    var result_0:int;
    var result_1:BArray200.t;
    var param_5:BArray200.t;
    var result_2:BArray200.t;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:BArray33.t;
    var param_10:int;
    var param_11:BArray200.t;
    var result_3:int;
    var result_4:int;
    var result_5:BArray200.t;
    var param_12:BArray200.t;
    var result_6:BArray200.t;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var param_16:BArray33.t;
    var param_17:int;
    var param_18:BArray200.t;
    var result_7:int;
    var result_8:int;
    var result_9:BArray200.t;
    var param_19:int;
    var param_20:BArray200.t;
    var result_10:BArray200.t;
    var b_result:BArray200.t;
    var b_result_0:BArray200.t;
    var b_param:BArray200.t;
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_result_3:BArray200.t;
    var b_result_4:BArray200.t;
    var b_param_0:BArray200.t;
    var trace_a33____absorb_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    param_2 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_9 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    param_16 <- witness;
    param_18 <- witness;
    param_20 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_5 <- witness;
    result_6 <- witness;
    result_9 <- witness;
    result_10 <- witness;
    trace_a33____absorb_ref <- [];
    trace_a33____absorb_ref <-
    (trace_a33____absorb_ref ++
    [(Assert,
     ((((((((0 < _RATE8) /\ (_RATE8 < 200)) /\ (0 <= _TRAILB)) /\
         (_TRAILB < 256)) /\
        (0 <= aT)) /\
       (aT < _RATE8)) /\
      (BArray33.is_init b_buf 0 33)) /\
     (BArray200.is_init b_st 0 224)))]);
    offset <- 0;
    _LEN <- 33;
    if ((_RATE8 <= (aT + _LEN))) {
      b_param_0 <- b_st;
      param_4 <- st;
      param_3 <- aT;
      param_2 <- buf;
      param_1 <- offset;
      param_0 <- (_RATE8 - aT);
      param <- 0;
      (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a33____addstate_ref (
      param_4, b_param_0, param_3, param_2,
      (BArray33.init_arr (W8.of_int 255)), param_1, param_0, param);
      result_1 <- aux;
      b_result_4 <- aux_0;
      result_0 <- aux_1;
      result <- aux_2;
      trace_a33____absorb_ref <- (trace_a33____absorb_ref ++ tmp__trace);
      trace_a33____absorb_ref <-
      (trace_a33____absorb_ref ++
      [(Assert,
       (((0 <= param_0) /\ (param_0 <= 18446744073709551615)) /\
       (((0 <= (param_1 + param_0)) /\
        ((param_1 + param_0) <= 18446744073709551615)) /\
       (((BArray200.is_init b_result_4 0 200) /\
        (result_0 = ((param_3 + param_0) + ((param <> 0) ? 1 : 0)))) /\
       (result = (param_1 + param_0))))))]);
      trace_a33____absorb_ref <-
      (trace_a33____absorb_ref ++
      [(Assert, ((0 <= result) /\ (result <= 18446744073709551615)))]);
      st <- result_1;
      offset <- result;
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      param_5 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_5,
      (BArray200.init_arr (W8.of_int 255)));
      result_2 <- aux;
      b_result_3 <- aux_0;
      trace_a33____absorb_ref <- (trace_a33____absorb_ref ++ tmp__trace);
      trace_a33____absorb_ref <-
      (trace_a33____absorb_ref ++
      [(Assert, (BArray200.is_init b_result_3 0 200))]);
      b_st <- (BArray200.init_arr (W8.of_int 255));
      st <- result_2;
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      trace_a33____absorb_ref <-
      (trace_a33____absorb_ref ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_11 <- st;
        param_10 <- 0;
        param_9 <- buf;
        param_8 <- offset;
        param_7 <- _RATE8;
        param_6 <- 0;
        (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a33____addstate_ref (
        param_11, (BArray200.init_arr (W8.of_int 255)), param_10, param_9,
        (BArray33.init_arr (W8.of_int 255)), param_8, param_7, param_6);
        result_5 <- aux;
        b_result_2 <- aux_0;
        result_4 <- aux_1;
        result_3 <- aux_2;
        trace_a33____absorb_ref <- (trace_a33____absorb_ref ++ tmp__trace);
        trace_a33____absorb_ref <-
        (trace_a33____absorb_ref ++
        [(Assert,
         (((0 <= param_7) /\ (param_7 <= 18446744073709551615)) /\
         (((0 <= (param_8 + param_7)) /\
          ((param_8 + param_7) <= 18446744073709551615)) /\
         (((BArray200.is_init b_result_2 0 200) /\
          (result_4 = ((param_10 + param_7) + ((param_6 <> 0) ? 1 : 0)))) /\
         (result_3 = (param_8 + param_7))))))]);
        trace_a33____absorb_ref <-
        (trace_a33____absorb_ref ++
        [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
        st <- result_5;
        offset <- result_3;
        (* Erased call to spill *)
        param_12 <- st;
        (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_12,
        (BArray200.init_arr (W8.of_int 255)));
        result_6 <- aux;
        b_result_1 <- aux_0;
        trace_a33____absorb_ref <- (trace_a33____absorb_ref ++ tmp__trace);
        trace_a33____absorb_ref <-
        (trace_a33____absorb_ref ++
        [(Assert, (BArray200.is_init b_result_1 0 200))]);
        b_st <- (BArray200.init_arr (W8.of_int 255));
        st <- result_6;
        (* Erased call to unspill *)
        trace_a33____absorb_ref <-
        (trace_a33____absorb_ref ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace_a33____absorb_ref <-
        (trace_a33____absorb_ref ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    b_param <- b_st;
    param_18 <- st;
    param_17 <- aT;
    param_16 <- buf;
    param_15 <- offset;
    param_14 <- _LEN;
    param_13 <- _TRAILB;
    (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a33____addstate_ref (param_18,
    b_param, param_17, param_16, (BArray33.init_arr (W8.of_int 255)),
    param_15, param_14, param_13);
    result_9 <- aux;
    b_result_0 <- aux_0;
    result_8 <- aux_1;
    result_7 <- aux_2;
    trace_a33____absorb_ref <- (trace_a33____absorb_ref ++ tmp__trace);
    trace_a33____absorb_ref <-
    (trace_a33____absorb_ref ++
    [(Assert,
     (((0 <= param_14) /\ (param_14 <= 18446744073709551615)) /\
     (((0 <= (param_15 + param_14)) /\
      ((param_15 + param_14) <= 18446744073709551615)) /\
     (((BArray200.is_init b_result_0 0 200) /\
      (result_8 = ((param_17 + param_14) + ((param_13 <> 0) ? 1 : 0)))) /\
     (result_7 = (param_15 + param_14))))))]);
    trace_a33____absorb_ref <-
    (trace_a33____absorb_ref ++
    [(Assert, ((0 <= result_7) /\ (result_7 <= 18446744073709551615)))]);
    st <- result_9;
    aT <- result_8;
    if ((_TRAILB <> 0)) {
      param_20 <- st;
      param_19 <- _RATE8;
      (aux, aux_0, tmp__trace) <@ __addratebit_ref (param_20,
      (BArray200.init_arr (W8.of_int 255)), param_19);
      result_10 <- aux;
      b_result <- aux_0;
      trace_a33____absorb_ref <- (trace_a33____absorb_ref ++ tmp__trace);
      trace_a33____absorb_ref <-
      (trace_a33____absorb_ref ++
      [(Assert, (BArray200.is_init b_result 0 200))]);
      st <- result_10;
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, trace_a33____absorb_ref);
  }
  proc a34____a_ilen_read_upto8_at (buf:BArray34.t, b_buf:BArray34.t,
                                    offset:int, dELTA:int, lEN:int,
                                    tRAIL:int, cUR:int, aT:int) : int * int *
                                                                  int * int *
                                                                  W64.t *
                                                                  trace = {
    var w:W64.t;
    var aT8:int;
    var t16:W64.t;
    var t8:W64.t;
    var param:int;
    var param_0:W64.t;
    var result:W64.t;
    var param_1:int;
    var param_2:W64.t;
    var result_0:W64.t;
    var param_3:int;
    var param_4:W64.t;
    var result_1:W64.t;
    var param_5:int;
    var param_6:W64.t;
    var result_2:W64.t;
    var param_7:int;
    var param_8:W64.t;
    var result_3:W64.t;
    var trace_a34____a_ilen_read_upto8_at:trace;
    trace_a34____a_ilen_read_upto8_at <- [];
    trace_a34____a_ilen_read_upto8_at <-
    (trace_a34____a_ilen_read_upto8_at ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     ((((((BArray34.is_init b_buf (offset + dELTA) ((lEN < 8) ? lEN : 8)) /\
         (0 <= dELTA)) /\
        (0 <= offset)) /\
       (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 34)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256)))))))))]);
    trace_a34____a_ilen_read_upto8_at <-
    (trace_a34____a_ilen_read_upto8_at ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        trace_a34____a_ilen_read_upto8_at <-
        (trace_a34____a_ilen_read_upto8_at ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace_a34____a_ilen_read_upto8_at <-
        (trace_a34____a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace_a34____a_ilen_read_upto8_at <-
        (trace_a34____a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= 34)))]);
        trace_a34____a_ilen_read_upto8_at <-
        (trace_a34____a_ilen_read_upto8_at ++
        [(Assert, (BArray34.is_init b_buf (offset + dELTA) 8))]);
        w <- (BArray34.get64d buf (offset + dELTA));
        param_0 <- w;
        param <- aT8;
        (result, tmp__trace) <@ __SHLQ (param_0, param);
        trace_a34____a_ilen_read_upto8_at <-
        (trace_a34____a_ilen_read_upto8_at ++ tmp__trace);
        w <- result;
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          trace_a34____a_ilen_read_upto8_at <-
          (trace_a34____a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a34____a_ilen_read_upto8_at <-
          (trace_a34____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a34____a_ilen_read_upto8_at <-
          (trace_a34____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= 34)))]);
          trace_a34____a_ilen_read_upto8_at <-
          (trace_a34____a_ilen_read_upto8_at ++
          [(Assert, (BArray34.is_init b_buf (offset + dELTA) 4))]);
          w <- (zeroextu64 (BArray34.get32d buf (offset + dELTA)));
          param_2 <- w;
          param_1 <- aT8;
          (result_0, tmp__trace) <@ __SHLQ (param_2, param_1);
          trace_a34____a_ilen_read_upto8_at <-
          (trace_a34____a_ilen_read_upto8_at ++ tmp__trace);
          w <- result_0;
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          trace_a34____a_ilen_read_upto8_at <-
          (trace_a34____a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a34____a_ilen_read_upto8_at <-
          (trace_a34____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a34____a_ilen_read_upto8_at <-
          (trace_a34____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= 34)))]);
          trace_a34____a_ilen_read_upto8_at <-
          (trace_a34____a_ilen_read_upto8_at ++
          [(Assert, (BArray34.is_init b_buf (offset + dELTA) 2))]);
          t16 <- (zeroextu64 (BArray34.get16d buf (offset + dELTA)));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          param_4 <- t16;
          param_3 <- aT8;
          (result_1, tmp__trace) <@ __SHLQ (param_4, param_3);
          trace_a34____a_ilen_read_upto8_at <-
          (trace_a34____a_ilen_read_upto8_at ++ tmp__trace);
          t16 <- result_1;
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            trace_a34____a_ilen_read_upto8_at <-
            (trace_a34____a_ilen_read_upto8_at ++
            [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
            trace_a34____a_ilen_read_upto8_at <-
            (trace_a34____a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\
             ((offset + dELTA) <= 18446744073709551615)))]);
            trace_a34____a_ilen_read_upto8_at <-
            (trace_a34____a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= 34)))]);
            trace_a34____a_ilen_read_upto8_at <-
            (trace_a34____a_ilen_read_upto8_at ++
            [(Assert, (BArray34.is_init b_buf (offset + dELTA) 1))]);
            t8 <- (zeroextu64 (BArray34.get8d buf (offset + dELTA)));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            param_6 <- t8;
            param_5 <- aT8;
            (result_2, tmp__trace) <@ __SHLQ (param_6, param_5);
            trace_a34____a_ilen_read_upto8_at <-
            (trace_a34____a_ilen_read_upto8_at ++ tmp__trace);
            t8 <- result_2;
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
              param_8 <- t8;
              param_7 <- aT8;
              (result_3, tmp__trace) <@ __SHLQ (param_8, param_7);
              trace_a34____a_ilen_read_upto8_at <-
              (trace_a34____a_ilen_read_upto8_at ++ tmp__trace);
              t8 <- result_3;
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
    return (dELTA, lEN, tRAIL, aT, w, trace_a34____a_ilen_read_upto8_at);
  }
  proc a34____addstate_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                            buf:BArray34.t, b_buf:BArray34.t, offset:int,
                            _LEN:int, _TRAILB:int) : BArray200.t *
                                                     BArray200.t * int *
                                                     int * trace = {
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var at:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:BArray34.t;
    var result:W64.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var result_3:int;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:BArray34.t;
    var result_4:W64.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var b_param:BArray34.t;
    var b_param_0:BArray34.t;
    var trace_a34____addstate_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    param_5 <- witness;
    param_12 <- witness;
    trace_a34____addstate_ref <- [];
    trace_a34____addstate_ref <-
    (trace_a34____addstate_ref ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     (((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= 34)) /\
      (BArray34.is_init b_buf offset _LEN)) /\
     (BArray200.is_init b_st 0 200)))))]);
    trace_a34____addstate_ref <-
    (trace_a34____addstate_ref ++
    [(Assert,
     ((((0 <= _TRAILB) /\ (_TRAILB < 256)) /\ (0 <= aT)) /\
     (((aT + _LEN) + ((_TRAILB <> 0) ? 1 : 0)) < 200)))]);
    trace_a34____addstate_ref <-
    (trace_a34____addstate_ref ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      b_param_0 <- b_buf;
      param_5 <- buf;
      param_4 <- offset;
      param_3 <- dELTA;
      param_2 <- _LEN;
      param_1 <- _TRAILB;
      param_0 <- aT;
      param <- aT8;
      (result_3, result_2, result_1, result_0, result, tmp__trace) <@ 
      a34____a_ilen_read_upto8_at (param_5, b_param_0, param_4, param_3,
      param_2, param_1, param_0, param);
      trace_a34____addstate_ref <- (trace_a34____addstate_ref ++ tmp__trace);
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert,
       (((param_0 <= param) /\ (param < (param_0 + 8))) ? ((((result_3 =
                                                             (param_3 +
                                                             ((((param_2 <
                                                                (8 -
                                                                (param -
                                                                param_0))) ? 
                                                               param_2 : 
                                                               (8 -
                                                               (param -
                                                               param_0))) <
                                                              0) ? 0 : 
                                                             ((param_2 <
                                                              (8 -
                                                              (param -
                                                              param_0))) ? 
                                                             param_2 : 
                                                             (8 -
                                                             (param -
                                                             param_0)))))) /\
                                                            (result_2 =
                                                            (param_2 -
                                                            ((((param_2 <
                                                               (8 -
                                                               (param -
                                                               param_0))) ? 
                                                              param_2 : 
                                                              (8 -
                                                              (param -
                                                              param_0))) <
                                                             0) ? 0 : 
                                                            ((param_2 <
                                                             (8 -
                                                             (param -
                                                             param_0))) ? 
                                                            param_2 : 
                                                            (8 -
                                                            (param - param_0))))))) /\
                                                           (result_1 =
                                                           ((8 <=
                                                            ((param -
                                                             param_0) +
                                                            param_2)) ? 
                                                           param_1 : 0))) /\
                                                          (result_0 =
                                                          (param_0 +
                                                          (((((((param -
                                                                param_0) +
                                                               param_2) <
                                                              8) ? ((
                                                                    param -
                                                                    param_0) +
                                                                   param_2) : 8) +
                                                            (((8 <=
                                                              ((param -
                                                               param_0) +
                                                              param_2)) \/
                                                             (param_1 = 0)) ? 0 : 1)) <
                                                           0) ? 0 : (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2)) \/
                                                                    (
                                                                    param_1 =
                                                                    0)) ? 0 : 1)))))) : 
       ((((result_3 = param_3) /\ (result_2 = param_2)) /\
        (result_1 = param_1)) /\
       (result_0 = param))))]);
      dELTA <- result_3;
      _LEN <- result_2;
      _TRAILB <- result_1;
      aT8 <- result_0;
      w <- result;
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      st <-
      (BArray200.set64 st (aT %/ 8) ((BArray200.get64 st (aT %/ 8)) `^` w));
      aT <- aT8;
    } else {
      
    }
    trace_a34____addstate_ref <-
    (trace_a34____addstate_ref ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace_a34____addstate_ref <-
    (trace_a34____addstate_ref ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    trace_a34____addstate_ref <-
    (trace_a34____addstate_ref ++
    [(Assert, ((0 <= (aT %/ 8)) /\ ((aT %/ 8) <= 18446744073709551615)))]);
    at <- (aT %/ 8);
    trace_a34____addstate_ref <-
    (trace_a34____addstate_ref ++
    [(Assert,
     ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
     (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= 34)))]);
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert, (BArray34.is_init b_buf offset 8))]);
      w <- (BArray34.get64d buf offset);
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      at <- (at + 1);
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert,
       ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
       (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      b_param <- b_buf;
      param_12 <- buf;
      param_11 <- offset;
      param_10 <- 0;
      param_9 <- _LEN;
      param_8 <- _TRAILB;
      param_7 <- aT;
      param_6 <- aT;
      (result_8, result_7, result_6, result_5, result_4, tmp__trace) <@ 
      a34____a_ilen_read_upto8_at (param_12, b_param, param_11, param_10,
      param_9, param_8, param_7, param_6);
      trace_a34____addstate_ref <- (trace_a34____addstate_ref ++ tmp__trace);
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert,
       (((param_7 <= param_6) /\ (param_6 < (param_7 + 8))) ? ((((result_8 =
                                                                 (param_10 +
                                                                 ((((
                                                                    param_9 <
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                   param_9 : 
                                                                   (8 -
                                                                   (param_6 -
                                                                   param_7))) <
                                                                  0) ? 0 : 
                                                                 ((param_9 <
                                                                  (8 -
                                                                  (param_6 -
                                                                  param_7))) ? 
                                                                 param_9 : 
                                                                 (8 -
                                                                 (param_6 -
                                                                 param_7)))))) /\
                                                                (result_7 =
                                                                (param_9 -
                                                                ((((param_9 <
                                                                   (8 -
                                                                   (param_6 -
                                                                   param_7))) ? 
                                                                  param_9 : 
                                                                  (8 -
                                                                  (param_6 -
                                                                  param_7))) <
                                                                 0) ? 0 : 
                                                                ((param_9 <
                                                                 (8 -
                                                                 (param_6 -
                                                                 param_7))) ? 
                                                                param_9 : 
                                                                (8 -
                                                                (param_6 -
                                                                param_7))))))) /\
                                                               (result_6 =
                                                               ((8 <=
                                                                ((param_6 -
                                                                 param_7) +
                                                                param_9)) ? 
                                                               param_8 : 0))) /\
                                                              (result_5 =
                                                              (param_7 +
                                                              (((((((
                                                                    param_6 -
                                                                    param_7) +
                                                                   param_9) <
                                                                  8) ? 
                                                                 ((param_6 -
                                                                  param_7) +
                                                                 param_9) : 8) +
                                                                (((8 <=
                                                                  ((param_6 -
                                                                   param_7) +
                                                                  param_9)) \/
                                                                 (param_8 =
                                                                 0)) ? 0 : 1)) <
                                                               0) ? 0 : 
                                                              (((((param_6 -
                                                                  param_7) +
                                                                 param_9) <
                                                                8) ? 
                                                               ((param_6 -
                                                                param_7) +
                                                               param_9) : 8) +
                                                              (((8 <=
                                                                ((param_6 -
                                                                 param_7) +
                                                                param_9)) \/
                                                               (param_8 = 0)) ? 0 : 1)))))) : 
       ((((result_8 = param_10) /\ (result_7 = param_9)) /\
        (result_6 = param_8)) /\
       (result_5 = param_6))))]);
      dELTA <- result_8;
      aT <- result_5;
      w <- result_4;
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace_a34____addstate_ref <-
      (trace_a34____addstate_ref ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, offset, trace_a34____addstate_ref);
  }
  proc a34____absorb_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                          buf:BArray34.t, b_buf:BArray34.t, _TRAILB:int,
                          _RATE8:int) : BArray200.t * BArray200.t * int *
                                        trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_1:int;
    var aux_2:int;
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:BArray34.t;
    var param_3:int;
    var param_4:BArray200.t;
    var result:int;
    var result_0:int;
    var result_1:BArray200.t;
    var param_5:BArray200.t;
    var result_2:BArray200.t;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:BArray34.t;
    var param_10:int;
    var param_11:BArray200.t;
    var result_3:int;
    var result_4:int;
    var result_5:BArray200.t;
    var param_12:BArray200.t;
    var result_6:BArray200.t;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var param_16:BArray34.t;
    var param_17:int;
    var param_18:BArray200.t;
    var result_7:int;
    var result_8:int;
    var result_9:BArray200.t;
    var param_19:int;
    var param_20:BArray200.t;
    var result_10:BArray200.t;
    var b_result:BArray200.t;
    var b_result_0:BArray200.t;
    var b_param:BArray200.t;
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_result_3:BArray200.t;
    var b_result_4:BArray200.t;
    var b_param_0:BArray200.t;
    var trace_a34____absorb_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    param_2 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_9 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    param_16 <- witness;
    param_18 <- witness;
    param_20 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_5 <- witness;
    result_6 <- witness;
    result_9 <- witness;
    result_10 <- witness;
    trace_a34____absorb_ref <- [];
    trace_a34____absorb_ref <-
    (trace_a34____absorb_ref ++
    [(Assert,
     ((((((((0 < _RATE8) /\ (_RATE8 < 200)) /\ (0 <= _TRAILB)) /\
         (_TRAILB < 256)) /\
        (0 <= aT)) /\
       (aT < _RATE8)) /\
      (BArray34.is_init b_buf 0 34)) /\
     (BArray200.is_init b_st 0 224)))]);
    offset <- 0;
    _LEN <- 34;
    if ((_RATE8 <= (aT + _LEN))) {
      b_param_0 <- b_st;
      param_4 <- st;
      param_3 <- aT;
      param_2 <- buf;
      param_1 <- offset;
      param_0 <- (_RATE8 - aT);
      param <- 0;
      (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a34____addstate_ref (
      param_4, b_param_0, param_3, param_2,
      (BArray34.init_arr (W8.of_int 255)), param_1, param_0, param);
      result_1 <- aux;
      b_result_4 <- aux_0;
      result_0 <- aux_1;
      result <- aux_2;
      trace_a34____absorb_ref <- (trace_a34____absorb_ref ++ tmp__trace);
      trace_a34____absorb_ref <-
      (trace_a34____absorb_ref ++
      [(Assert,
       (((0 <= param_0) /\ (param_0 <= 18446744073709551615)) /\
       (((0 <= (param_1 + param_0)) /\
        ((param_1 + param_0) <= 18446744073709551615)) /\
       (((BArray200.is_init b_result_4 0 200) /\
        (result_0 = ((param_3 + param_0) + ((param <> 0) ? 1 : 0)))) /\
       (result = (param_1 + param_0))))))]);
      trace_a34____absorb_ref <-
      (trace_a34____absorb_ref ++
      [(Assert, ((0 <= result) /\ (result <= 18446744073709551615)))]);
      st <- result_1;
      offset <- result;
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      param_5 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_5,
      (BArray200.init_arr (W8.of_int 255)));
      result_2 <- aux;
      b_result_3 <- aux_0;
      trace_a34____absorb_ref <- (trace_a34____absorb_ref ++ tmp__trace);
      trace_a34____absorb_ref <-
      (trace_a34____absorb_ref ++
      [(Assert, (BArray200.is_init b_result_3 0 200))]);
      b_st <- (BArray200.init_arr (W8.of_int 255));
      st <- result_2;
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      trace_a34____absorb_ref <-
      (trace_a34____absorb_ref ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_11 <- st;
        param_10 <- 0;
        param_9 <- buf;
        param_8 <- offset;
        param_7 <- _RATE8;
        param_6 <- 0;
        (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a34____addstate_ref (
        param_11, (BArray200.init_arr (W8.of_int 255)), param_10, param_9,
        (BArray34.init_arr (W8.of_int 255)), param_8, param_7, param_6);
        result_5 <- aux;
        b_result_2 <- aux_0;
        result_4 <- aux_1;
        result_3 <- aux_2;
        trace_a34____absorb_ref <- (trace_a34____absorb_ref ++ tmp__trace);
        trace_a34____absorb_ref <-
        (trace_a34____absorb_ref ++
        [(Assert,
         (((0 <= param_7) /\ (param_7 <= 18446744073709551615)) /\
         (((0 <= (param_8 + param_7)) /\
          ((param_8 + param_7) <= 18446744073709551615)) /\
         (((BArray200.is_init b_result_2 0 200) /\
          (result_4 = ((param_10 + param_7) + ((param_6 <> 0) ? 1 : 0)))) /\
         (result_3 = (param_8 + param_7))))))]);
        trace_a34____absorb_ref <-
        (trace_a34____absorb_ref ++
        [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
        st <- result_5;
        offset <- result_3;
        (* Erased call to spill *)
        param_12 <- st;
        (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_12,
        (BArray200.init_arr (W8.of_int 255)));
        result_6 <- aux;
        b_result_1 <- aux_0;
        trace_a34____absorb_ref <- (trace_a34____absorb_ref ++ tmp__trace);
        trace_a34____absorb_ref <-
        (trace_a34____absorb_ref ++
        [(Assert, (BArray200.is_init b_result_1 0 200))]);
        b_st <- (BArray200.init_arr (W8.of_int 255));
        st <- result_6;
        (* Erased call to unspill *)
        trace_a34____absorb_ref <-
        (trace_a34____absorb_ref ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace_a34____absorb_ref <-
        (trace_a34____absorb_ref ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    b_param <- b_st;
    param_18 <- st;
    param_17 <- aT;
    param_16 <- buf;
    param_15 <- offset;
    param_14 <- _LEN;
    param_13 <- _TRAILB;
    (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a34____addstate_ref (param_18,
    b_param, param_17, param_16, (BArray34.init_arr (W8.of_int 255)),
    param_15, param_14, param_13);
    result_9 <- aux;
    b_result_0 <- aux_0;
    result_8 <- aux_1;
    result_7 <- aux_2;
    trace_a34____absorb_ref <- (trace_a34____absorb_ref ++ tmp__trace);
    trace_a34____absorb_ref <-
    (trace_a34____absorb_ref ++
    [(Assert,
     (((0 <= param_14) /\ (param_14 <= 18446744073709551615)) /\
     (((0 <= (param_15 + param_14)) /\
      ((param_15 + param_14) <= 18446744073709551615)) /\
     (((BArray200.is_init b_result_0 0 200) /\
      (result_8 = ((param_17 + param_14) + ((param_13 <> 0) ? 1 : 0)))) /\
     (result_7 = (param_15 + param_14))))))]);
    trace_a34____absorb_ref <-
    (trace_a34____absorb_ref ++
    [(Assert, ((0 <= result_7) /\ (result_7 <= 18446744073709551615)))]);
    st <- result_9;
    aT <- result_8;
    if ((_TRAILB <> 0)) {
      param_20 <- st;
      param_19 <- _RATE8;
      (aux, aux_0, tmp__trace) <@ __addratebit_ref (param_20,
      (BArray200.init_arr (W8.of_int 255)), param_19);
      result_10 <- aux;
      b_result <- aux_0;
      trace_a34____absorb_ref <- (trace_a34____absorb_ref ++ tmp__trace);
      trace_a34____absorb_ref <-
      (trace_a34____absorb_ref ++
      [(Assert, (BArray200.is_init b_result 0 200))]);
      st <- result_10;
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, trace_a34____absorb_ref);
  }
  proc a64____a_ilen_read_upto8_at (buf:BArray64.t, b_buf:BArray64.t,
                                    offset:int, dELTA:int, lEN:int,
                                    tRAIL:int, cUR:int, aT:int) : int * int *
                                                                  int * int *
                                                                  W64.t *
                                                                  trace = {
    var w:W64.t;
    var aT8:int;
    var t16:W64.t;
    var t8:W64.t;
    var param:int;
    var param_0:W64.t;
    var result:W64.t;
    var param_1:int;
    var param_2:W64.t;
    var result_0:W64.t;
    var param_3:int;
    var param_4:W64.t;
    var result_1:W64.t;
    var param_5:int;
    var param_6:W64.t;
    var result_2:W64.t;
    var param_7:int;
    var param_8:W64.t;
    var result_3:W64.t;
    var trace_a64____a_ilen_read_upto8_at:trace;
    trace_a64____a_ilen_read_upto8_at <- [];
    trace_a64____a_ilen_read_upto8_at <-
    (trace_a64____a_ilen_read_upto8_at ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     ((((((BArray64.is_init b_buf (offset + dELTA) ((lEN < 8) ? lEN : 8)) /\
         (0 <= dELTA)) /\
        (0 <= offset)) /\
       (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 64)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256)))))))))]);
    trace_a64____a_ilen_read_upto8_at <-
    (trace_a64____a_ilen_read_upto8_at ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        trace_a64____a_ilen_read_upto8_at <-
        (trace_a64____a_ilen_read_upto8_at ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace_a64____a_ilen_read_upto8_at <-
        (trace_a64____a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace_a64____a_ilen_read_upto8_at <-
        (trace_a64____a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= 64)))]);
        trace_a64____a_ilen_read_upto8_at <-
        (trace_a64____a_ilen_read_upto8_at ++
        [(Assert, (BArray64.is_init b_buf (offset + dELTA) 8))]);
        w <- (BArray64.get64d buf (offset + dELTA));
        param_0 <- w;
        param <- aT8;
        (result, tmp__trace) <@ __SHLQ (param_0, param);
        trace_a64____a_ilen_read_upto8_at <-
        (trace_a64____a_ilen_read_upto8_at ++ tmp__trace);
        w <- result;
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          trace_a64____a_ilen_read_upto8_at <-
          (trace_a64____a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a64____a_ilen_read_upto8_at <-
          (trace_a64____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a64____a_ilen_read_upto8_at <-
          (trace_a64____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= 64)))]);
          trace_a64____a_ilen_read_upto8_at <-
          (trace_a64____a_ilen_read_upto8_at ++
          [(Assert, (BArray64.is_init b_buf (offset + dELTA) 4))]);
          w <- (zeroextu64 (BArray64.get32d buf (offset + dELTA)));
          param_2 <- w;
          param_1 <- aT8;
          (result_0, tmp__trace) <@ __SHLQ (param_2, param_1);
          trace_a64____a_ilen_read_upto8_at <-
          (trace_a64____a_ilen_read_upto8_at ++ tmp__trace);
          w <- result_0;
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          trace_a64____a_ilen_read_upto8_at <-
          (trace_a64____a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a64____a_ilen_read_upto8_at <-
          (trace_a64____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a64____a_ilen_read_upto8_at <-
          (trace_a64____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= 64)))]);
          trace_a64____a_ilen_read_upto8_at <-
          (trace_a64____a_ilen_read_upto8_at ++
          [(Assert, (BArray64.is_init b_buf (offset + dELTA) 2))]);
          t16 <- (zeroextu64 (BArray64.get16d buf (offset + dELTA)));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          param_4 <- t16;
          param_3 <- aT8;
          (result_1, tmp__trace) <@ __SHLQ (param_4, param_3);
          trace_a64____a_ilen_read_upto8_at <-
          (trace_a64____a_ilen_read_upto8_at ++ tmp__trace);
          t16 <- result_1;
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            trace_a64____a_ilen_read_upto8_at <-
            (trace_a64____a_ilen_read_upto8_at ++
            [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
            trace_a64____a_ilen_read_upto8_at <-
            (trace_a64____a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\
             ((offset + dELTA) <= 18446744073709551615)))]);
            trace_a64____a_ilen_read_upto8_at <-
            (trace_a64____a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= 64)))]);
            trace_a64____a_ilen_read_upto8_at <-
            (trace_a64____a_ilen_read_upto8_at ++
            [(Assert, (BArray64.is_init b_buf (offset + dELTA) 1))]);
            t8 <- (zeroextu64 (BArray64.get8d buf (offset + dELTA)));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            param_6 <- t8;
            param_5 <- aT8;
            (result_2, tmp__trace) <@ __SHLQ (param_6, param_5);
            trace_a64____a_ilen_read_upto8_at <-
            (trace_a64____a_ilen_read_upto8_at ++ tmp__trace);
            t8 <- result_2;
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
              param_8 <- t8;
              param_7 <- aT8;
              (result_3, tmp__trace) <@ __SHLQ (param_8, param_7);
              trace_a64____a_ilen_read_upto8_at <-
              (trace_a64____a_ilen_read_upto8_at ++ tmp__trace);
              t8 <- result_3;
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
    return (dELTA, lEN, tRAIL, aT, w, trace_a64____a_ilen_read_upto8_at);
  }
  proc a64____a_ilen_write_upto8 (buf:BArray64.t, b_buf:BArray64.t,
                                  offset:int, dELTA:int, lEN:int, w:W64.t) : 
  BArray64.t * BArray64.t * int * int * trace = {
    var trace_a64____a_ilen_write_upto8:trace;
    trace_a64____a_ilen_write_upto8 <- [];
    trace_a64____a_ilen_write_upto8 <-
    (trace_a64____a_ilen_write_upto8 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     (((BArray64.is_init b_buf 0 (offset + dELTA)) /\ (0 <= dELTA)) /\
     (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 64)))))))))]);
    trace_a64____a_ilen_write_upto8 <-
    (trace_a64____a_ilen_write_upto8 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        trace_a64____a_ilen_write_upto8 <-
        (trace_a64____a_ilen_write_upto8 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace_a64____a_ilen_write_upto8 <-
        (trace_a64____a_ilen_write_upto8 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace_a64____a_ilen_write_upto8 <-
        (trace_a64____a_ilen_write_upto8 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= 64)))]);
        b_buf <-
        (BArray64.set64d b_buf (offset + dELTA)
        (W64.of_int 18446744073709551615));
        buf <- (BArray64.set64d buf (offset + dELTA) w);
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          trace_a64____a_ilen_write_upto8 <-
          (trace_a64____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a64____a_ilen_write_upto8 <-
          (trace_a64____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a64____a_ilen_write_upto8 <-
          (trace_a64____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= 64)))]);
          b_buf <-
          (BArray64.set32d b_buf (offset + dELTA) (W32.of_int 4294967295));
          buf <- (BArray64.set32d buf (offset + dELTA) (truncateu32 w));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          trace_a64____a_ilen_write_upto8 <-
          (trace_a64____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a64____a_ilen_write_upto8 <-
          (trace_a64____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a64____a_ilen_write_upto8 <-
          (trace_a64____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= 64)))]);
          b_buf <-
          (BArray64.set16d b_buf (offset + dELTA) (W16.of_int 65535));
          buf <- (BArray64.set16d buf (offset + dELTA) (truncateu16 w));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          trace_a64____a_ilen_write_upto8 <-
          (trace_a64____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a64____a_ilen_write_upto8 <-
          (trace_a64____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a64____a_ilen_write_upto8 <-
          (trace_a64____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= 64)))]);
          b_buf <- (BArray64.set8d b_buf (offset + dELTA) (W8.of_int 255));
          buf <- (BArray64.set8d buf (offset + dELTA) (truncateu8 w));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, b_buf, dELTA, lEN, trace_a64____a_ilen_write_upto8);
  }
  proc a64____addstate_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                            buf:BArray64.t, b_buf:BArray64.t, offset:int,
                            _LEN:int, _TRAILB:int) : BArray200.t *
                                                     BArray200.t * int *
                                                     int * trace = {
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var at:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:BArray64.t;
    var result:W64.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var result_3:int;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:BArray64.t;
    var result_4:W64.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var b_param:BArray64.t;
    var b_param_0:BArray64.t;
    var trace_a64____addstate_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    param_5 <- witness;
    param_12 <- witness;
    trace_a64____addstate_ref <- [];
    trace_a64____addstate_ref <-
    (trace_a64____addstate_ref ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     (((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= 64)) /\
      (BArray64.is_init b_buf offset _LEN)) /\
     (BArray200.is_init b_st 0 200)))))]);
    trace_a64____addstate_ref <-
    (trace_a64____addstate_ref ++
    [(Assert,
     ((((0 <= _TRAILB) /\ (_TRAILB < 256)) /\ (0 <= aT)) /\
     (((aT + _LEN) + ((_TRAILB <> 0) ? 1 : 0)) < 200)))]);
    trace_a64____addstate_ref <-
    (trace_a64____addstate_ref ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      b_param_0 <- b_buf;
      param_5 <- buf;
      param_4 <- offset;
      param_3 <- dELTA;
      param_2 <- _LEN;
      param_1 <- _TRAILB;
      param_0 <- aT;
      param <- aT8;
      (result_3, result_2, result_1, result_0, result, tmp__trace) <@ 
      a64____a_ilen_read_upto8_at (param_5, b_param_0, param_4, param_3,
      param_2, param_1, param_0, param);
      trace_a64____addstate_ref <- (trace_a64____addstate_ref ++ tmp__trace);
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert,
       (((param_0 <= param) /\ (param < (param_0 + 8))) ? ((((result_3 =
                                                             (param_3 +
                                                             ((((param_2 <
                                                                (8 -
                                                                (param -
                                                                param_0))) ? 
                                                               param_2 : 
                                                               (8 -
                                                               (param -
                                                               param_0))) <
                                                              0) ? 0 : 
                                                             ((param_2 <
                                                              (8 -
                                                              (param -
                                                              param_0))) ? 
                                                             param_2 : 
                                                             (8 -
                                                             (param -
                                                             param_0)))))) /\
                                                            (result_2 =
                                                            (param_2 -
                                                            ((((param_2 <
                                                               (8 -
                                                               (param -
                                                               param_0))) ? 
                                                              param_2 : 
                                                              (8 -
                                                              (param -
                                                              param_0))) <
                                                             0) ? 0 : 
                                                            ((param_2 <
                                                             (8 -
                                                             (param -
                                                             param_0))) ? 
                                                            param_2 : 
                                                            (8 -
                                                            (param - param_0))))))) /\
                                                           (result_1 =
                                                           ((8 <=
                                                            ((param -
                                                             param_0) +
                                                            param_2)) ? 
                                                           param_1 : 0))) /\
                                                          (result_0 =
                                                          (param_0 +
                                                          (((((((param -
                                                                param_0) +
                                                               param_2) <
                                                              8) ? ((
                                                                    param -
                                                                    param_0) +
                                                                   param_2) : 8) +
                                                            (((8 <=
                                                              ((param -
                                                               param_0) +
                                                              param_2)) \/
                                                             (param_1 = 0)) ? 0 : 1)) <
                                                           0) ? 0 : (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2)) \/
                                                                    (
                                                                    param_1 =
                                                                    0)) ? 0 : 1)))))) : 
       ((((result_3 = param_3) /\ (result_2 = param_2)) /\
        (result_1 = param_1)) /\
       (result_0 = param))))]);
      dELTA <- result_3;
      _LEN <- result_2;
      _TRAILB <- result_1;
      aT8 <- result_0;
      w <- result;
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      st <-
      (BArray200.set64 st (aT %/ 8) ((BArray200.get64 st (aT %/ 8)) `^` w));
      aT <- aT8;
    } else {
      
    }
    trace_a64____addstate_ref <-
    (trace_a64____addstate_ref ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace_a64____addstate_ref <-
    (trace_a64____addstate_ref ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    trace_a64____addstate_ref <-
    (trace_a64____addstate_ref ++
    [(Assert, ((0 <= (aT %/ 8)) /\ ((aT %/ 8) <= 18446744073709551615)))]);
    at <- (aT %/ 8);
    trace_a64____addstate_ref <-
    (trace_a64____addstate_ref ++
    [(Assert,
     ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
     (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= 64)))]);
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert, (BArray64.is_init b_buf offset 8))]);
      w <- (BArray64.get64d buf offset);
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      at <- (at + 1);
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert,
       ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
       (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      b_param <- b_buf;
      param_12 <- buf;
      param_11 <- offset;
      param_10 <- 0;
      param_9 <- _LEN;
      param_8 <- _TRAILB;
      param_7 <- aT;
      param_6 <- aT;
      (result_8, result_7, result_6, result_5, result_4, tmp__trace) <@ 
      a64____a_ilen_read_upto8_at (param_12, b_param, param_11, param_10,
      param_9, param_8, param_7, param_6);
      trace_a64____addstate_ref <- (trace_a64____addstate_ref ++ tmp__trace);
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert,
       (((param_7 <= param_6) /\ (param_6 < (param_7 + 8))) ? ((((result_8 =
                                                                 (param_10 +
                                                                 ((((
                                                                    param_9 <
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                   param_9 : 
                                                                   (8 -
                                                                   (param_6 -
                                                                   param_7))) <
                                                                  0) ? 0 : 
                                                                 ((param_9 <
                                                                  (8 -
                                                                  (param_6 -
                                                                  param_7))) ? 
                                                                 param_9 : 
                                                                 (8 -
                                                                 (param_6 -
                                                                 param_7)))))) /\
                                                                (result_7 =
                                                                (param_9 -
                                                                ((((param_9 <
                                                                   (8 -
                                                                   (param_6 -
                                                                   param_7))) ? 
                                                                  param_9 : 
                                                                  (8 -
                                                                  (param_6 -
                                                                  param_7))) <
                                                                 0) ? 0 : 
                                                                ((param_9 <
                                                                 (8 -
                                                                 (param_6 -
                                                                 param_7))) ? 
                                                                param_9 : 
                                                                (8 -
                                                                (param_6 -
                                                                param_7))))))) /\
                                                               (result_6 =
                                                               ((8 <=
                                                                ((param_6 -
                                                                 param_7) +
                                                                param_9)) ? 
                                                               param_8 : 0))) /\
                                                              (result_5 =
                                                              (param_7 +
                                                              (((((((
                                                                    param_6 -
                                                                    param_7) +
                                                                   param_9) <
                                                                  8) ? 
                                                                 ((param_6 -
                                                                  param_7) +
                                                                 param_9) : 8) +
                                                                (((8 <=
                                                                  ((param_6 -
                                                                   param_7) +
                                                                  param_9)) \/
                                                                 (param_8 =
                                                                 0)) ? 0 : 1)) <
                                                               0) ? 0 : 
                                                              (((((param_6 -
                                                                  param_7) +
                                                                 param_9) <
                                                                8) ? 
                                                               ((param_6 -
                                                                param_7) +
                                                               param_9) : 8) +
                                                              (((8 <=
                                                                ((param_6 -
                                                                 param_7) +
                                                                param_9)) \/
                                                               (param_8 = 0)) ? 0 : 1)))))) : 
       ((((result_8 = param_10) /\ (result_7 = param_9)) /\
        (result_6 = param_8)) /\
       (result_5 = param_6))))]);
      dELTA <- result_8;
      aT <- result_5;
      w <- result_4;
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace_a64____addstate_ref <-
      (trace_a64____addstate_ref ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, offset, trace_a64____addstate_ref);
  }
  proc a64____absorb_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                          buf:BArray64.t, b_buf:BArray64.t, _TRAILB:int,
                          _RATE8:int) : BArray200.t * BArray200.t * int *
                                        trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_1:int;
    var aux_2:int;
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:BArray64.t;
    var param_3:int;
    var param_4:BArray200.t;
    var result:int;
    var result_0:int;
    var result_1:BArray200.t;
    var param_5:BArray200.t;
    var result_2:BArray200.t;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:BArray64.t;
    var param_10:int;
    var param_11:BArray200.t;
    var result_3:int;
    var result_4:int;
    var result_5:BArray200.t;
    var param_12:BArray200.t;
    var result_6:BArray200.t;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var param_16:BArray64.t;
    var param_17:int;
    var param_18:BArray200.t;
    var result_7:int;
    var result_8:int;
    var result_9:BArray200.t;
    var param_19:int;
    var param_20:BArray200.t;
    var result_10:BArray200.t;
    var b_result:BArray200.t;
    var b_result_0:BArray200.t;
    var b_param:BArray200.t;
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_result_3:BArray200.t;
    var b_result_4:BArray200.t;
    var b_param_0:BArray200.t;
    var trace_a64____absorb_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    param_2 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_9 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    param_16 <- witness;
    param_18 <- witness;
    param_20 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_5 <- witness;
    result_6 <- witness;
    result_9 <- witness;
    result_10 <- witness;
    trace_a64____absorb_ref <- [];
    trace_a64____absorb_ref <-
    (trace_a64____absorb_ref ++
    [(Assert,
     ((((((((0 < _RATE8) /\ (_RATE8 < 200)) /\ (0 <= _TRAILB)) /\
         (_TRAILB < 256)) /\
        (0 <= aT)) /\
       (aT < _RATE8)) /\
      (BArray64.is_init b_buf 0 64)) /\
     (BArray200.is_init b_st 0 224)))]);
    offset <- 0;
    _LEN <- 64;
    if ((_RATE8 <= (aT + _LEN))) {
      b_param_0 <- b_st;
      param_4 <- st;
      param_3 <- aT;
      param_2 <- buf;
      param_1 <- offset;
      param_0 <- (_RATE8 - aT);
      param <- 0;
      (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a64____addstate_ref (
      param_4, b_param_0, param_3, param_2,
      (BArray64.init_arr (W8.of_int 255)), param_1, param_0, param);
      result_1 <- aux;
      b_result_4 <- aux_0;
      result_0 <- aux_1;
      result <- aux_2;
      trace_a64____absorb_ref <- (trace_a64____absorb_ref ++ tmp__trace);
      trace_a64____absorb_ref <-
      (trace_a64____absorb_ref ++
      [(Assert,
       (((0 <= param_0) /\ (param_0 <= 18446744073709551615)) /\
       (((0 <= (param_1 + param_0)) /\
        ((param_1 + param_0) <= 18446744073709551615)) /\
       (((BArray200.is_init b_result_4 0 200) /\
        (result_0 = ((param_3 + param_0) + ((param <> 0) ? 1 : 0)))) /\
       (result = (param_1 + param_0))))))]);
      trace_a64____absorb_ref <-
      (trace_a64____absorb_ref ++
      [(Assert, ((0 <= result) /\ (result <= 18446744073709551615)))]);
      st <- result_1;
      offset <- result;
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      param_5 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_5,
      (BArray200.init_arr (W8.of_int 255)));
      result_2 <- aux;
      b_result_3 <- aux_0;
      trace_a64____absorb_ref <- (trace_a64____absorb_ref ++ tmp__trace);
      trace_a64____absorb_ref <-
      (trace_a64____absorb_ref ++
      [(Assert, (BArray200.is_init b_result_3 0 200))]);
      b_st <- (BArray200.init_arr (W8.of_int 255));
      st <- result_2;
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      trace_a64____absorb_ref <-
      (trace_a64____absorb_ref ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_11 <- st;
        param_10 <- 0;
        param_9 <- buf;
        param_8 <- offset;
        param_7 <- _RATE8;
        param_6 <- 0;
        (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a64____addstate_ref (
        param_11, (BArray200.init_arr (W8.of_int 255)), param_10, param_9,
        (BArray64.init_arr (W8.of_int 255)), param_8, param_7, param_6);
        result_5 <- aux;
        b_result_2 <- aux_0;
        result_4 <- aux_1;
        result_3 <- aux_2;
        trace_a64____absorb_ref <- (trace_a64____absorb_ref ++ tmp__trace);
        trace_a64____absorb_ref <-
        (trace_a64____absorb_ref ++
        [(Assert,
         (((0 <= param_7) /\ (param_7 <= 18446744073709551615)) /\
         (((0 <= (param_8 + param_7)) /\
          ((param_8 + param_7) <= 18446744073709551615)) /\
         (((BArray200.is_init b_result_2 0 200) /\
          (result_4 = ((param_10 + param_7) + ((param_6 <> 0) ? 1 : 0)))) /\
         (result_3 = (param_8 + param_7))))))]);
        trace_a64____absorb_ref <-
        (trace_a64____absorb_ref ++
        [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
        st <- result_5;
        offset <- result_3;
        (* Erased call to spill *)
        param_12 <- st;
        (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_12,
        (BArray200.init_arr (W8.of_int 255)));
        result_6 <- aux;
        b_result_1 <- aux_0;
        trace_a64____absorb_ref <- (trace_a64____absorb_ref ++ tmp__trace);
        trace_a64____absorb_ref <-
        (trace_a64____absorb_ref ++
        [(Assert, (BArray200.is_init b_result_1 0 200))]);
        b_st <- (BArray200.init_arr (W8.of_int 255));
        st <- result_6;
        (* Erased call to unspill *)
        trace_a64____absorb_ref <-
        (trace_a64____absorb_ref ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace_a64____absorb_ref <-
        (trace_a64____absorb_ref ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    b_param <- b_st;
    param_18 <- st;
    param_17 <- aT;
    param_16 <- buf;
    param_15 <- offset;
    param_14 <- _LEN;
    param_13 <- _TRAILB;
    (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a64____addstate_ref (param_18,
    b_param, param_17, param_16, (BArray64.init_arr (W8.of_int 255)),
    param_15, param_14, param_13);
    result_9 <- aux;
    b_result_0 <- aux_0;
    result_8 <- aux_1;
    result_7 <- aux_2;
    trace_a64____absorb_ref <- (trace_a64____absorb_ref ++ tmp__trace);
    trace_a64____absorb_ref <-
    (trace_a64____absorb_ref ++
    [(Assert,
     (((0 <= param_14) /\ (param_14 <= 18446744073709551615)) /\
     (((0 <= (param_15 + param_14)) /\
      ((param_15 + param_14) <= 18446744073709551615)) /\
     (((BArray200.is_init b_result_0 0 200) /\
      (result_8 = ((param_17 + param_14) + ((param_13 <> 0) ? 1 : 0)))) /\
     (result_7 = (param_15 + param_14))))))]);
    trace_a64____absorb_ref <-
    (trace_a64____absorb_ref ++
    [(Assert, ((0 <= result_7) /\ (result_7 <= 18446744073709551615)))]);
    st <- result_9;
    aT <- result_8;
    if ((_TRAILB <> 0)) {
      param_20 <- st;
      param_19 <- _RATE8;
      (aux, aux_0, tmp__trace) <@ __addratebit_ref (param_20,
      (BArray200.init_arr (W8.of_int 255)), param_19);
      result_10 <- aux;
      b_result <- aux_0;
      trace_a64____absorb_ref <- (trace_a64____absorb_ref ++ tmp__trace);
      trace_a64____absorb_ref <-
      (trace_a64____absorb_ref ++
      [(Assert, (BArray200.is_init b_result 0 200))]);
      st <- result_10;
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, trace_a64____absorb_ref);
  }
  proc a64____dumpstate_ref (buf:BArray64.t, b_buf:BArray64.t, offset:int,
                             _LEN:int, st:BArray200.t, b_st:BArray200.t) : 
  BArray64.t * BArray64.t * int * trace = {
    var t:W64.t;
    var dELTA:int;
    var i:int;
    var param:W64.t;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArray64.t;
    var result:int;
    var result_0:int;
    var result_1:BArray64.t;
    var b_result:BArray64.t;
    var b_param:BArray64.t;
    var trace_a64____dumpstate_ref:trace;
    b_param <- witness;
    b_result <- witness;
    param_3 <- witness;
    result_1 <- witness;
    trace_a64____dumpstate_ref <- [];
    trace_a64____dumpstate_ref <-
    (trace_a64____dumpstate_ref ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     ((((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= 64)) /\
       (BArray200.is_init b_st 0 224)) /\
      (_LEN <= 200)) /\
     (BArray64.is_init b_buf 0 offset)))))]);
    trace_a64____dumpstate_ref <-
    (trace_a64____dumpstate_ref ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    i <- 0;
    trace_a64____dumpstate_ref <-
    (trace_a64____dumpstate_ref ++
    [(Assert, ((0 <= (_LEN %/ 8)) /\ ((_LEN %/ 8) <= 18446744073709551615)))]);
    while ((i < (_LEN %/ 8))) {
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++
      [(Assert, (BArray200.is_init b_st (i * 8) 8))]);
      t <- (BArray200.get64 st i);
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= 64)))]);
      b_buf <-
      (BArray64.set64d b_buf offset (W64.of_int 18446744073709551615));
      buf <- (BArray64.set64d buf offset t);
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++
      [(Assert,
       ((0 <= (_LEN %/ 8)) /\ ((_LEN %/ 8) <= 18446744073709551615)))]);
    }
    if ((0 < (_LEN %% 8))) {
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++
      [(Assert, (BArray200.is_init b_st (i * 8) 8))]);
      t <- (BArray200.get64 st i);
      b_param <- b_buf;
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- 0;
      param_0 <- (_LEN %% 8);
      param <- t;
      (result_1, b_result, result_0, result, tmp__trace) <@ a64____a_ilen_write_upto8 (
      param_3, b_param, param_2, param_1, param_0, param);
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++ tmp__trace);
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (((0 <=
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8))) /\
        (((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)) <=
        18446744073709551615)) /\
       (((0 <=
         ((param_2 + param_1) +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))) /\
        (((param_2 + param_1) +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8))) <=
        18446744073709551615)) /\
       (((result_0 =
         (param_1 +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))) /\
        (result =
        (param_0 -
        ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8))))) /\
       (BArray64.is_init b_result 0
       ((param_2 + param_1) +
       ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8)))
       )))))))]);
      b_buf <- b_result;
      buf <- result_1;
      dELTA <- result_0;
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace_a64____dumpstate_ref <-
      (trace_a64____dumpstate_ref ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (buf, b_buf, offset, trace_a64____dumpstate_ref);
  }
  proc a64____squeeze_ref (st:BArray200.t, b_st:BArray200.t, buf:BArray64.t,
                           b_buf:BArray64.t, _RATE8:int) : BArray200.t *
                                                           BArray200.t *
                                                           BArray64.t *
                                                           BArray64.t * trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var offset:int;
    var i:int;
    var param:BArray200.t;
    var result:BArray200.t;
    var param_0:BArray200.t;
    var param_1:int;
    var param_2:int;
    var param_3:BArray64.t;
    var result_0:int;
    var result_1:BArray64.t;
    var param_4:BArray200.t;
    var result_2:BArray200.t;
    var param_5:BArray200.t;
    var param_6:int;
    var param_7:int;
    var param_8:BArray64.t;
    var result_3:int;
    var result_4:BArray64.t;
    var b_result:BArray64.t;
    var b_param:BArray64.t;
    var b_result_0:BArray200.t;
    var b_param_0:BArray200.t;
    var b_result_1:BArray64.t;
    var b_param_1:BArray64.t;
    var b_result_2:BArray200.t;
    var b_param_2:BArray200.t;
    var trace_a64____squeeze_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    param <- witness;
    param_0 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_8 <- witness;
    result <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_4 <- witness;
    trace_a64____squeeze_ref <- [];
    trace_a64____squeeze_ref <-
    (trace_a64____squeeze_ref ++
    [(Assert,
     (((0 < _RATE8) /\ (_RATE8 < 200)) /\ (BArray200.is_init b_st 0 224)))]);
    offset <- 0;
    i <- 0;
    trace_a64____squeeze_ref <-
    (trace_a64____squeeze_ref ++
    [(Assert,
     ((0 <= (64 %/ _RATE8)) /\ ((64 %/ _RATE8) <= 18446744073709551615)))]);
    while ((i < (64 %/ _RATE8))) {
      (* Erased call to spill *)
      b_param_2 <- b_st;
      param <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param, b_param_2);
      result <- aux;
      b_result_2 <- aux_0;
      trace_a64____squeeze_ref <- (trace_a64____squeeze_ref ++ tmp__trace);
      trace_a64____squeeze_ref <-
      (trace_a64____squeeze_ref ++
      [(Assert, (BArray200.is_init b_result_2 0 200))]);
      b_st <- (BArray200.init_arr (W8.of_int 255));
      st <- result;
      (* Erased call to unspill *)
      b_param_1 <- b_buf;
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- _RATE8;
      param_0 <- st;
      (result_1, b_result_1, result_0, tmp__trace) <@ a64____dumpstate_ref (
      param_3, b_param_1, param_2, param_1, param_0,
      (BArray200.init_arr (W8.of_int 255)));
      trace_a64____squeeze_ref <- (trace_a64____squeeze_ref ++ tmp__trace);
      trace_a64____squeeze_ref <-
      (trace_a64____squeeze_ref ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (result_0 = (param_2 + param_1)))))]);
      trace_a64____squeeze_ref <-
      (trace_a64____squeeze_ref ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (BArray64.is_init b_result_1 0 (param_2 + param_1)))))]);
      trace_a64____squeeze_ref <-
      (trace_a64____squeeze_ref ++
      [(Assert, ((0 <= result_0) /\ (result_0 <= 18446744073709551615)))]);
      b_buf <- b_result_1;
      buf <- result_1;
      offset <- result_0;
      (* Erased call to unspill *)
      trace_a64____squeeze_ref <-
      (trace_a64____squeeze_ref ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace_a64____squeeze_ref <-
      (trace_a64____squeeze_ref ++
      [(Assert,
       ((0 <= (64 %/ _RATE8)) /\ ((64 %/ _RATE8) <= 18446744073709551615)))]);
    }
    if ((0 < (64 %% _RATE8))) {
      (* Erased call to spill *)
      b_param_0 <- b_st;
      param_4 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_4, b_param_0);
      result_2 <- aux;
      b_result_0 <- aux_0;
      trace_a64____squeeze_ref <- (trace_a64____squeeze_ref ++ tmp__trace);
      trace_a64____squeeze_ref <-
      (trace_a64____squeeze_ref ++
      [(Assert, (BArray200.is_init b_result_0 0 200))]);
      b_st <- (BArray200.init_arr (W8.of_int 255));
      st <- result_2;
      (* Erased call to unspill *)
      b_param <- b_buf;
      param_8 <- buf;
      param_7 <- offset;
      param_6 <- (64 %% _RATE8);
      param_5 <- st;
      (result_4, b_result, result_3, tmp__trace) <@ a64____dumpstate_ref (
      param_8, b_param, param_7, param_6, param_5,
      (BArray200.init_arr (W8.of_int 255)));
      trace_a64____squeeze_ref <- (trace_a64____squeeze_ref ++ tmp__trace);
      trace_a64____squeeze_ref <-
      (trace_a64____squeeze_ref ++
      [(Assert,
       (((0 <= param_6) /\ (param_6 <= 18446744073709551615)) /\
       (((0 <= (param_7 + param_6)) /\
        ((param_7 + param_6) <= 18446744073709551615)) /\
       (result_3 = (param_7 + param_6)))))]);
      trace_a64____squeeze_ref <-
      (trace_a64____squeeze_ref ++
      [(Assert,
       (((0 <= param_6) /\ (param_6 <= 18446744073709551615)) /\
       (((0 <= (param_7 + param_6)) /\
        ((param_7 + param_6) <= 18446744073709551615)) /\
       (BArray64.is_init b_result 0 (param_7 + param_6)))))]);
      trace_a64____squeeze_ref <-
      (trace_a64____squeeze_ref ++
      [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
      b_buf <- b_result;
      buf <- result_4;
    } else {
      
    }
    return (st, b_st, buf, b_buf, trace_a64____squeeze_ref);
  }
  proc a128____a_ilen_write_upto8 (buf:BArray128.t, b_buf:BArray128.t,
                                   offset:int, dELTA:int, lEN:int, w:W64.t) : 
  BArray128.t * BArray128.t * int * int * trace = {
    var trace_a128____a_ilen_write_upto8:trace;
    trace_a128____a_ilen_write_upto8 <- [];
    trace_a128____a_ilen_write_upto8 <-
    (trace_a128____a_ilen_write_upto8 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     (((BArray128.is_init b_buf 0 (offset + dELTA)) /\ (0 <= dELTA)) /\
     (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 128)))))))))]);
    trace_a128____a_ilen_write_upto8 <-
    (trace_a128____a_ilen_write_upto8 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        trace_a128____a_ilen_write_upto8 <-
        (trace_a128____a_ilen_write_upto8 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace_a128____a_ilen_write_upto8 <-
        (trace_a128____a_ilen_write_upto8 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace_a128____a_ilen_write_upto8 <-
        (trace_a128____a_ilen_write_upto8 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= 128)))]);
        b_buf <-
        (BArray128.set64d b_buf (offset + dELTA)
        (W64.of_int 18446744073709551615));
        buf <- (BArray128.set64d buf (offset + dELTA) w);
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          trace_a128____a_ilen_write_upto8 <-
          (trace_a128____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a128____a_ilen_write_upto8 <-
          (trace_a128____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a128____a_ilen_write_upto8 <-
          (trace_a128____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= 128)))]);
          b_buf <-
          (BArray128.set32d b_buf (offset + dELTA) (W32.of_int 4294967295));
          buf <- (BArray128.set32d buf (offset + dELTA) (truncateu32 w));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          trace_a128____a_ilen_write_upto8 <-
          (trace_a128____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a128____a_ilen_write_upto8 <-
          (trace_a128____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a128____a_ilen_write_upto8 <-
          (trace_a128____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= 128)))]);
          b_buf <-
          (BArray128.set16d b_buf (offset + dELTA) (W16.of_int 65535));
          buf <- (BArray128.set16d buf (offset + dELTA) (truncateu16 w));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          trace_a128____a_ilen_write_upto8 <-
          (trace_a128____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a128____a_ilen_write_upto8 <-
          (trace_a128____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a128____a_ilen_write_upto8 <-
          (trace_a128____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= 128)))]);
          b_buf <- (BArray128.set8d b_buf (offset + dELTA) (W8.of_int 255));
          buf <- (BArray128.set8d buf (offset + dELTA) (truncateu8 w));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, b_buf, dELTA, lEN, trace_a128____a_ilen_write_upto8);
  }
  proc a128____dumpstate_ref (buf:BArray128.t, b_buf:BArray128.t, offset:int,
                              _LEN:int, st:BArray200.t, b_st:BArray200.t) : 
  BArray128.t * BArray128.t * int * trace = {
    var t:W64.t;
    var dELTA:int;
    var i:int;
    var param:W64.t;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArray128.t;
    var result:int;
    var result_0:int;
    var result_1:BArray128.t;
    var b_result:BArray128.t;
    var b_param:BArray128.t;
    var trace_a128____dumpstate_ref:trace;
    b_param <- witness;
    b_result <- witness;
    param_3 <- witness;
    result_1 <- witness;
    trace_a128____dumpstate_ref <- [];
    trace_a128____dumpstate_ref <-
    (trace_a128____dumpstate_ref ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     ((((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= 128)) /\
       (BArray200.is_init b_st 0 224)) /\
      (_LEN <= 200)) /\
     (BArray128.is_init b_buf 0 offset)))))]);
    trace_a128____dumpstate_ref <-
    (trace_a128____dumpstate_ref ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    i <- 0;
    trace_a128____dumpstate_ref <-
    (trace_a128____dumpstate_ref ++
    [(Assert, ((0 <= (_LEN %/ 8)) /\ ((_LEN %/ 8) <= 18446744073709551615)))]);
    while ((i < (_LEN %/ 8))) {
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++
      [(Assert, (BArray200.is_init b_st (i * 8) 8))]);
      t <- (BArray200.get64 st i);
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= 128)))]);
      b_buf <-
      (BArray128.set64d b_buf offset (W64.of_int 18446744073709551615));
      buf <- (BArray128.set64d buf offset t);
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++
      [(Assert,
       ((0 <= (_LEN %/ 8)) /\ ((_LEN %/ 8) <= 18446744073709551615)))]);
    }
    if ((0 < (_LEN %% 8))) {
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++
      [(Assert, (BArray200.is_init b_st (i * 8) 8))]);
      t <- (BArray200.get64 st i);
      b_param <- b_buf;
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- 0;
      param_0 <- (_LEN %% 8);
      param <- t;
      (result_1, b_result, result_0, result, tmp__trace) <@ a128____a_ilen_write_upto8 (
      param_3, b_param, param_2, param_1, param_0, param);
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++ tmp__trace);
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (((0 <=
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8))) /\
        (((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)) <=
        18446744073709551615)) /\
       (((0 <=
         ((param_2 + param_1) +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))) /\
        (((param_2 + param_1) +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8))) <=
        18446744073709551615)) /\
       (((result_0 =
         (param_1 +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))) /\
        (result =
        (param_0 -
        ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8))))) /\
       (BArray128.is_init b_result 0
       ((param_2 + param_1) +
       ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8)))
       )))))))]);
      b_buf <- b_result;
      buf <- result_1;
      dELTA <- result_0;
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace_a128____dumpstate_ref <-
      (trace_a128____dumpstate_ref ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (buf, b_buf, offset, trace_a128____dumpstate_ref);
  }
  proc a128____squeeze_ref (st:BArray200.t, b_st:BArray200.t,
                            buf:BArray128.t, b_buf:BArray128.t, _RATE8:int) : 
  BArray200.t * BArray200.t * BArray128.t * BArray128.t * trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var offset:int;
    var i:int;
    var param:BArray200.t;
    var result:BArray200.t;
    var param_0:BArray200.t;
    var param_1:int;
    var param_2:int;
    var param_3:BArray128.t;
    var result_0:int;
    var result_1:BArray128.t;
    var param_4:BArray200.t;
    var result_2:BArray200.t;
    var param_5:BArray200.t;
    var param_6:int;
    var param_7:int;
    var param_8:BArray128.t;
    var result_3:int;
    var result_4:BArray128.t;
    var b_result:BArray128.t;
    var b_param:BArray128.t;
    var b_result_0:BArray200.t;
    var b_param_0:BArray200.t;
    var b_result_1:BArray128.t;
    var b_param_1:BArray128.t;
    var b_result_2:BArray200.t;
    var b_param_2:BArray200.t;
    var trace_a128____squeeze_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    param <- witness;
    param_0 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_8 <- witness;
    result <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_4 <- witness;
    trace_a128____squeeze_ref <- [];
    trace_a128____squeeze_ref <-
    (trace_a128____squeeze_ref ++
    [(Assert,
     (((0 < _RATE8) /\ (_RATE8 < 200)) /\ (BArray200.is_init b_st 0 224)))]);
    offset <- 0;
    i <- 0;
    trace_a128____squeeze_ref <-
    (trace_a128____squeeze_ref ++
    [(Assert,
     ((0 <= (128 %/ _RATE8)) /\ ((128 %/ _RATE8) <= 18446744073709551615)))]);
    while ((i < (128 %/ _RATE8))) {
      (* Erased call to spill *)
      b_param_2 <- b_st;
      param <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param, b_param_2);
      result <- aux;
      b_result_2 <- aux_0;
      trace_a128____squeeze_ref <- (trace_a128____squeeze_ref ++ tmp__trace);
      trace_a128____squeeze_ref <-
      (trace_a128____squeeze_ref ++
      [(Assert, (BArray200.is_init b_result_2 0 200))]);
      b_st <- (BArray200.init_arr (W8.of_int 255));
      st <- result;
      (* Erased call to unspill *)
      b_param_1 <- b_buf;
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- _RATE8;
      param_0 <- st;
      (result_1, b_result_1, result_0, tmp__trace) <@ a128____dumpstate_ref (
      param_3, b_param_1, param_2, param_1, param_0,
      (BArray200.init_arr (W8.of_int 255)));
      trace_a128____squeeze_ref <- (trace_a128____squeeze_ref ++ tmp__trace);
      trace_a128____squeeze_ref <-
      (trace_a128____squeeze_ref ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (result_0 = (param_2 + param_1)))))]);
      trace_a128____squeeze_ref <-
      (trace_a128____squeeze_ref ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (BArray128.is_init b_result_1 0 (param_2 + param_1)))))]);
      trace_a128____squeeze_ref <-
      (trace_a128____squeeze_ref ++
      [(Assert, ((0 <= result_0) /\ (result_0 <= 18446744073709551615)))]);
      b_buf <- b_result_1;
      buf <- result_1;
      offset <- result_0;
      (* Erased call to unspill *)
      trace_a128____squeeze_ref <-
      (trace_a128____squeeze_ref ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace_a128____squeeze_ref <-
      (trace_a128____squeeze_ref ++
      [(Assert,
       ((0 <= (128 %/ _RATE8)) /\ ((128 %/ _RATE8) <= 18446744073709551615)))]);
    }
    if ((0 < (128 %% _RATE8))) {
      (* Erased call to spill *)
      b_param_0 <- b_st;
      param_4 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_4, b_param_0);
      result_2 <- aux;
      b_result_0 <- aux_0;
      trace_a128____squeeze_ref <- (trace_a128____squeeze_ref ++ tmp__trace);
      trace_a128____squeeze_ref <-
      (trace_a128____squeeze_ref ++
      [(Assert, (BArray200.is_init b_result_0 0 200))]);
      b_st <- (BArray200.init_arr (W8.of_int 255));
      st <- result_2;
      (* Erased call to unspill *)
      b_param <- b_buf;
      param_8 <- buf;
      param_7 <- offset;
      param_6 <- (128 %% _RATE8);
      param_5 <- st;
      (result_4, b_result, result_3, tmp__trace) <@ a128____dumpstate_ref (
      param_8, b_param, param_7, param_6, param_5,
      (BArray200.init_arr (W8.of_int 255)));
      trace_a128____squeeze_ref <- (trace_a128____squeeze_ref ++ tmp__trace);
      trace_a128____squeeze_ref <-
      (trace_a128____squeeze_ref ++
      [(Assert,
       (((0 <= param_6) /\ (param_6 <= 18446744073709551615)) /\
       (((0 <= (param_7 + param_6)) /\
        ((param_7 + param_6) <= 18446744073709551615)) /\
       (result_3 = (param_7 + param_6)))))]);
      trace_a128____squeeze_ref <-
      (trace_a128____squeeze_ref ++
      [(Assert,
       (((0 <= param_6) /\ (param_6 <= 18446744073709551615)) /\
       (((0 <= (param_7 + param_6)) /\
        ((param_7 + param_6) <= 18446744073709551615)) /\
       (BArray128.is_init b_result 0 (param_7 + param_6)))))]);
      trace_a128____squeeze_ref <-
      (trace_a128____squeeze_ref ++
      [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
      b_buf <- b_result;
      buf <- result_4;
    } else {
      
    }
    return (st, b_st, buf, b_buf, trace_a128____squeeze_ref);
  }
  proc a168____a_ilen_write_upto8 (buf:BArray168.t, b_buf:BArray168.t,
                                   offset:int, dELTA:int, lEN:int, w:W64.t) : 
  BArray168.t * BArray168.t * int * int * trace = {
    var trace_a168____a_ilen_write_upto8:trace;
    trace_a168____a_ilen_write_upto8 <- [];
    trace_a168____a_ilen_write_upto8 <-
    (trace_a168____a_ilen_write_upto8 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     (((BArray168.is_init b_buf 0 (offset + dELTA)) /\ (0 <= dELTA)) /\
     (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 168)))))))))]);
    trace_a168____a_ilen_write_upto8 <-
    (trace_a168____a_ilen_write_upto8 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        trace_a168____a_ilen_write_upto8 <-
        (trace_a168____a_ilen_write_upto8 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace_a168____a_ilen_write_upto8 <-
        (trace_a168____a_ilen_write_upto8 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace_a168____a_ilen_write_upto8 <-
        (trace_a168____a_ilen_write_upto8 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= 168)))]);
        b_buf <-
        (BArray168.set64d b_buf (offset + dELTA)
        (W64.of_int 18446744073709551615));
        buf <- (BArray168.set64d buf (offset + dELTA) w);
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          trace_a168____a_ilen_write_upto8 <-
          (trace_a168____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a168____a_ilen_write_upto8 <-
          (trace_a168____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a168____a_ilen_write_upto8 <-
          (trace_a168____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= 168)))]);
          b_buf <-
          (BArray168.set32d b_buf (offset + dELTA) (W32.of_int 4294967295));
          buf <- (BArray168.set32d buf (offset + dELTA) (truncateu32 w));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          trace_a168____a_ilen_write_upto8 <-
          (trace_a168____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a168____a_ilen_write_upto8 <-
          (trace_a168____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a168____a_ilen_write_upto8 <-
          (trace_a168____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= 168)))]);
          b_buf <-
          (BArray168.set16d b_buf (offset + dELTA) (W16.of_int 65535));
          buf <- (BArray168.set16d buf (offset + dELTA) (truncateu16 w));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          trace_a168____a_ilen_write_upto8 <-
          (trace_a168____a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a168____a_ilen_write_upto8 <-
          (trace_a168____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a168____a_ilen_write_upto8 <-
          (trace_a168____a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= 168)))]);
          b_buf <- (BArray168.set8d b_buf (offset + dELTA) (W8.of_int 255));
          buf <- (BArray168.set8d buf (offset + dELTA) (truncateu8 w));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, b_buf, dELTA, lEN, trace_a168____a_ilen_write_upto8);
  }
  proc a168____dumpstate_ref (buf:BArray168.t, b_buf:BArray168.t, offset:int,
                              _LEN:int, st:BArray200.t, b_st:BArray200.t) : 
  BArray168.t * BArray168.t * int * trace = {
    var t:W64.t;
    var dELTA:int;
    var i:int;
    var param:W64.t;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArray168.t;
    var result:int;
    var result_0:int;
    var result_1:BArray168.t;
    var b_result:BArray168.t;
    var b_param:BArray168.t;
    var trace_a168____dumpstate_ref:trace;
    b_param <- witness;
    b_result <- witness;
    param_3 <- witness;
    result_1 <- witness;
    trace_a168____dumpstate_ref <- [];
    trace_a168____dumpstate_ref <-
    (trace_a168____dumpstate_ref ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     ((((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= 168)) /\
       (BArray200.is_init b_st 0 224)) /\
      (_LEN <= 200)) /\
     (BArray168.is_init b_buf 0 offset)))))]);
    trace_a168____dumpstate_ref <-
    (trace_a168____dumpstate_ref ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    i <- 0;
    trace_a168____dumpstate_ref <-
    (trace_a168____dumpstate_ref ++
    [(Assert, ((0 <= (_LEN %/ 8)) /\ ((_LEN %/ 8) <= 18446744073709551615)))]);
    while ((i < (_LEN %/ 8))) {
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++
      [(Assert, (BArray200.is_init b_st (i * 8) 8))]);
      t <- (BArray200.get64 st i);
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= 168)))]);
      b_buf <-
      (BArray168.set64d b_buf offset (W64.of_int 18446744073709551615));
      buf <- (BArray168.set64d buf offset t);
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++
      [(Assert,
       ((0 <= (_LEN %/ 8)) /\ ((_LEN %/ 8) <= 18446744073709551615)))]);
    }
    if ((0 < (_LEN %% 8))) {
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++
      [(Assert, (BArray200.is_init b_st (i * 8) 8))]);
      t <- (BArray200.get64 st i);
      b_param <- b_buf;
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- 0;
      param_0 <- (_LEN %% 8);
      param <- t;
      (result_1, b_result, result_0, result, tmp__trace) <@ a168____a_ilen_write_upto8 (
      param_3, b_param, param_2, param_1, param_0, param);
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++ tmp__trace);
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (((0 <=
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8))) /\
        (((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)) <=
        18446744073709551615)) /\
       (((0 <=
         ((param_2 + param_1) +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))) /\
        (((param_2 + param_1) +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8))) <=
        18446744073709551615)) /\
       (((result_0 =
         (param_1 +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))) /\
        (result =
        (param_0 -
        ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8))))) /\
       (BArray168.is_init b_result 0
       ((param_2 + param_1) +
       ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8)))
       )))))))]);
      b_buf <- b_result;
      buf <- result_1;
      dELTA <- result_0;
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace_a168____dumpstate_ref <-
      (trace_a168____dumpstate_ref ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (buf, b_buf, offset, trace_a168____dumpstate_ref);
  }
  proc a1568____a_ilen_read_upto8_at (buf:BArray1568.t, b_buf:BArray1568.t,
                                      offset:int, dELTA:int, lEN:int,
                                      tRAIL:int, cUR:int, aT:int) : int *
                                                                    int *
                                                                    int *
                                                                    int *
                                                                    W64.t *
                                                                    trace = {
    var w:W64.t;
    var aT8:int;
    var t16:W64.t;
    var t8:W64.t;
    var param:int;
    var param_0:W64.t;
    var result:W64.t;
    var param_1:int;
    var param_2:W64.t;
    var result_0:W64.t;
    var param_3:int;
    var param_4:W64.t;
    var result_1:W64.t;
    var param_5:int;
    var param_6:W64.t;
    var result_2:W64.t;
    var param_7:int;
    var param_8:W64.t;
    var result_3:W64.t;
    var trace_a1568____a_ilen_read_upto8_at:trace;
    trace_a1568____a_ilen_read_upto8_at <- [];
    trace_a1568____a_ilen_read_upto8_at <-
    (trace_a1568____a_ilen_read_upto8_at ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     ((((((BArray1568.is_init b_buf (offset + dELTA) ((lEN < 8) ? lEN : 8)) /\
         (0 <= dELTA)) /\
        (0 <= offset)) /\
       (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 1568)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256)))))))))]);
    trace_a1568____a_ilen_read_upto8_at <-
    (trace_a1568____a_ilen_read_upto8_at ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        trace_a1568____a_ilen_read_upto8_at <-
        (trace_a1568____a_ilen_read_upto8_at ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace_a1568____a_ilen_read_upto8_at <-
        (trace_a1568____a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace_a1568____a_ilen_read_upto8_at <-
        (trace_a1568____a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= 1568)))]);
        trace_a1568____a_ilen_read_upto8_at <-
        (trace_a1568____a_ilen_read_upto8_at ++
        [(Assert, (BArray1568.is_init b_buf (offset + dELTA) 8))]);
        w <- (BArray1568.get64d buf (offset + dELTA));
        param_0 <- w;
        param <- aT8;
        (result, tmp__trace) <@ __SHLQ (param_0, param);
        trace_a1568____a_ilen_read_upto8_at <-
        (trace_a1568____a_ilen_read_upto8_at ++ tmp__trace);
        w <- result;
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          trace_a1568____a_ilen_read_upto8_at <-
          (trace_a1568____a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a1568____a_ilen_read_upto8_at <-
          (trace_a1568____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a1568____a_ilen_read_upto8_at <-
          (trace_a1568____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= 1568)))]);
          trace_a1568____a_ilen_read_upto8_at <-
          (trace_a1568____a_ilen_read_upto8_at ++
          [(Assert, (BArray1568.is_init b_buf (offset + dELTA) 4))]);
          w <- (zeroextu64 (BArray1568.get32d buf (offset + dELTA)));
          param_2 <- w;
          param_1 <- aT8;
          (result_0, tmp__trace) <@ __SHLQ (param_2, param_1);
          trace_a1568____a_ilen_read_upto8_at <-
          (trace_a1568____a_ilen_read_upto8_at ++ tmp__trace);
          w <- result_0;
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          trace_a1568____a_ilen_read_upto8_at <-
          (trace_a1568____a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace_a1568____a_ilen_read_upto8_at <-
          (trace_a1568____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace_a1568____a_ilen_read_upto8_at <-
          (trace_a1568____a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= 1568)))]);
          trace_a1568____a_ilen_read_upto8_at <-
          (trace_a1568____a_ilen_read_upto8_at ++
          [(Assert, (BArray1568.is_init b_buf (offset + dELTA) 2))]);
          t16 <- (zeroextu64 (BArray1568.get16d buf (offset + dELTA)));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          param_4 <- t16;
          param_3 <- aT8;
          (result_1, tmp__trace) <@ __SHLQ (param_4, param_3);
          trace_a1568____a_ilen_read_upto8_at <-
          (trace_a1568____a_ilen_read_upto8_at ++ tmp__trace);
          t16 <- result_1;
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            trace_a1568____a_ilen_read_upto8_at <-
            (trace_a1568____a_ilen_read_upto8_at ++
            [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
            trace_a1568____a_ilen_read_upto8_at <-
            (trace_a1568____a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\
             ((offset + dELTA) <= 18446744073709551615)))]);
            trace_a1568____a_ilen_read_upto8_at <-
            (trace_a1568____a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= 1568)))]);
            trace_a1568____a_ilen_read_upto8_at <-
            (trace_a1568____a_ilen_read_upto8_at ++
            [(Assert, (BArray1568.is_init b_buf (offset + dELTA) 1))]);
            t8 <- (zeroextu64 (BArray1568.get8d buf (offset + dELTA)));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            param_6 <- t8;
            param_5 <- aT8;
            (result_2, tmp__trace) <@ __SHLQ (param_6, param_5);
            trace_a1568____a_ilen_read_upto8_at <-
            (trace_a1568____a_ilen_read_upto8_at ++ tmp__trace);
            t8 <- result_2;
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
              param_8 <- t8;
              param_7 <- aT8;
              (result_3, tmp__trace) <@ __SHLQ (param_8, param_7);
              trace_a1568____a_ilen_read_upto8_at <-
              (trace_a1568____a_ilen_read_upto8_at ++ tmp__trace);
              t8 <- result_3;
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
    return (dELTA, lEN, tRAIL, aT, w, trace_a1568____a_ilen_read_upto8_at);
  }
  proc a1568____addstate_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                              buf:BArray1568.t, b_buf:BArray1568.t,
                              offset:int, _LEN:int, _TRAILB:int) : BArray200.t *
                                                                   BArray200.t *
                                                                   int *
                                                                   int *
                                                                   trace = {
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var at:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:BArray1568.t;
    var result:W64.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var result_3:int;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:BArray1568.t;
    var result_4:W64.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var b_param:BArray1568.t;
    var b_param_0:BArray1568.t;
    var trace_a1568____addstate_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    param_5 <- witness;
    param_12 <- witness;
    trace_a1568____addstate_ref <- [];
    trace_a1568____addstate_ref <-
    (trace_a1568____addstate_ref ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     (((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= 1568)) /\
      (BArray1568.is_init b_buf offset _LEN)) /\
     (BArray200.is_init b_st 0 200)))))]);
    trace_a1568____addstate_ref <-
    (trace_a1568____addstate_ref ++
    [(Assert,
     ((((0 <= _TRAILB) /\ (_TRAILB < 256)) /\ (0 <= aT)) /\
     (((aT + _LEN) + ((_TRAILB <> 0) ? 1 : 0)) < 200)))]);
    trace_a1568____addstate_ref <-
    (trace_a1568____addstate_ref ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      b_param_0 <- b_buf;
      param_5 <- buf;
      param_4 <- offset;
      param_3 <- dELTA;
      param_2 <- _LEN;
      param_1 <- _TRAILB;
      param_0 <- aT;
      param <- aT8;
      (result_3, result_2, result_1, result_0, result, tmp__trace) <@ 
      a1568____a_ilen_read_upto8_at (param_5, b_param_0, param_4, param_3,
      param_2, param_1, param_0, param);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++ tmp__trace);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert,
       (((param_0 <= param) /\ (param < (param_0 + 8))) ? ((((result_3 =
                                                             (param_3 +
                                                             ((((param_2 <
                                                                (8 -
                                                                (param -
                                                                param_0))) ? 
                                                               param_2 : 
                                                               (8 -
                                                               (param -
                                                               param_0))) <
                                                              0) ? 0 : 
                                                             ((param_2 <
                                                              (8 -
                                                              (param -
                                                              param_0))) ? 
                                                             param_2 : 
                                                             (8 -
                                                             (param -
                                                             param_0)))))) /\
                                                            (result_2 =
                                                            (param_2 -
                                                            ((((param_2 <
                                                               (8 -
                                                               (param -
                                                               param_0))) ? 
                                                              param_2 : 
                                                              (8 -
                                                              (param -
                                                              param_0))) <
                                                             0) ? 0 : 
                                                            ((param_2 <
                                                             (8 -
                                                             (param -
                                                             param_0))) ? 
                                                            param_2 : 
                                                            (8 -
                                                            (param - param_0))))))) /\
                                                           (result_1 =
                                                           ((8 <=
                                                            ((param -
                                                             param_0) +
                                                            param_2)) ? 
                                                           param_1 : 0))) /\
                                                          (result_0 =
                                                          (param_0 +
                                                          (((((((param -
                                                                param_0) +
                                                               param_2) <
                                                              8) ? ((
                                                                    param -
                                                                    param_0) +
                                                                   param_2) : 8) +
                                                            (((8 <=
                                                              ((param -
                                                               param_0) +
                                                              param_2)) \/
                                                             (param_1 = 0)) ? 0 : 1)) <
                                                           0) ? 0 : (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2)) \/
                                                                    (
                                                                    param_1 =
                                                                    0)) ? 0 : 1)))))) : 
       ((((result_3 = param_3) /\ (result_2 = param_2)) /\
        (result_1 = param_1)) /\
       (result_0 = param))))]);
      dELTA <- result_3;
      _LEN <- result_2;
      _TRAILB <- result_1;
      aT8 <- result_0;
      w <- result;
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      st <-
      (BArray200.set64 st (aT %/ 8) ((BArray200.get64 st (aT %/ 8)) `^` w));
      aT <- aT8;
    } else {
      
    }
    trace_a1568____addstate_ref <-
    (trace_a1568____addstate_ref ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace_a1568____addstate_ref <-
    (trace_a1568____addstate_ref ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    trace_a1568____addstate_ref <-
    (trace_a1568____addstate_ref ++
    [(Assert, ((0 <= (aT %/ 8)) /\ ((aT %/ 8) <= 18446744073709551615)))]);
    at <- (aT %/ 8);
    trace_a1568____addstate_ref <-
    (trace_a1568____addstate_ref ++
    [(Assert,
     ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
     (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= 1568)))]);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert, (BArray1568.is_init b_buf offset 8))]);
      w <- (BArray1568.get64d buf offset);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      at <- (at + 1);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert,
       ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
       (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      b_param <- b_buf;
      param_12 <- buf;
      param_11 <- offset;
      param_10 <- 0;
      param_9 <- _LEN;
      param_8 <- _TRAILB;
      param_7 <- aT;
      param_6 <- aT;
      (result_8, result_7, result_6, result_5, result_4, tmp__trace) <@ 
      a1568____a_ilen_read_upto8_at (param_12, b_param, param_11, param_10,
      param_9, param_8, param_7, param_6);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++ tmp__trace);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert,
       (((param_7 <= param_6) /\ (param_6 < (param_7 + 8))) ? ((((result_8 =
                                                                 (param_10 +
                                                                 ((((
                                                                    param_9 <
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                   param_9 : 
                                                                   (8 -
                                                                   (param_6 -
                                                                   param_7))) <
                                                                  0) ? 0 : 
                                                                 ((param_9 <
                                                                  (8 -
                                                                  (param_6 -
                                                                  param_7))) ? 
                                                                 param_9 : 
                                                                 (8 -
                                                                 (param_6 -
                                                                 param_7)))))) /\
                                                                (result_7 =
                                                                (param_9 -
                                                                ((((param_9 <
                                                                   (8 -
                                                                   (param_6 -
                                                                   param_7))) ? 
                                                                  param_9 : 
                                                                  (8 -
                                                                  (param_6 -
                                                                  param_7))) <
                                                                 0) ? 0 : 
                                                                ((param_9 <
                                                                 (8 -
                                                                 (param_6 -
                                                                 param_7))) ? 
                                                                param_9 : 
                                                                (8 -
                                                                (param_6 -
                                                                param_7))))))) /\
                                                               (result_6 =
                                                               ((8 <=
                                                                ((param_6 -
                                                                 param_7) +
                                                                param_9)) ? 
                                                               param_8 : 0))) /\
                                                              (result_5 =
                                                              (param_7 +
                                                              (((((((
                                                                    param_6 -
                                                                    param_7) +
                                                                   param_9) <
                                                                  8) ? 
                                                                 ((param_6 -
                                                                  param_7) +
                                                                 param_9) : 8) +
                                                                (((8 <=
                                                                  ((param_6 -
                                                                   param_7) +
                                                                  param_9)) \/
                                                                 (param_8 =
                                                                 0)) ? 0 : 1)) <
                                                               0) ? 0 : 
                                                              (((((param_6 -
                                                                  param_7) +
                                                                 param_9) <
                                                                8) ? 
                                                               ((param_6 -
                                                                param_7) +
                                                               param_9) : 8) +
                                                              (((8 <=
                                                                ((param_6 -
                                                                 param_7) +
                                                                param_9)) \/
                                                               (param_8 = 0)) ? 0 : 1)))))) : 
       ((((result_8 = param_10) /\ (result_7 = param_9)) /\
        (result_6 = param_8)) /\
       (result_5 = param_6))))]);
      dELTA <- result_8;
      aT <- result_5;
      w <- result_4;
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace_a1568____addstate_ref <-
      (trace_a1568____addstate_ref ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, offset, trace_a1568____addstate_ref);
  }
  proc a1568____absorb_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                            buf:BArray1568.t, b_buf:BArray1568.t,
                            _TRAILB:int, _RATE8:int) : BArray200.t *
                                                       BArray200.t * int *
                                                       trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_1:int;
    var aux_2:int;
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:BArray1568.t;
    var param_3:int;
    var param_4:BArray200.t;
    var result:int;
    var result_0:int;
    var result_1:BArray200.t;
    var param_5:BArray200.t;
    var result_2:BArray200.t;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:BArray1568.t;
    var param_10:int;
    var param_11:BArray200.t;
    var result_3:int;
    var result_4:int;
    var result_5:BArray200.t;
    var param_12:BArray200.t;
    var result_6:BArray200.t;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var param_16:BArray1568.t;
    var param_17:int;
    var param_18:BArray200.t;
    var result_7:int;
    var result_8:int;
    var result_9:BArray200.t;
    var param_19:int;
    var param_20:BArray200.t;
    var result_10:BArray200.t;
    var b_result:BArray200.t;
    var b_result_0:BArray200.t;
    var b_param:BArray200.t;
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_result_3:BArray200.t;
    var b_result_4:BArray200.t;
    var b_param_0:BArray200.t;
    var trace_a1568____absorb_ref:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    param_2 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_9 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    param_16 <- witness;
    param_18 <- witness;
    param_20 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_5 <- witness;
    result_6 <- witness;
    result_9 <- witness;
    result_10 <- witness;
    trace_a1568____absorb_ref <- [];
    trace_a1568____absorb_ref <-
    (trace_a1568____absorb_ref ++
    [(Assert,
     ((((((((0 < _RATE8) /\ (_RATE8 < 200)) /\ (0 <= _TRAILB)) /\
         (_TRAILB < 256)) /\
        (0 <= aT)) /\
       (aT < _RATE8)) /\
      (BArray1568.is_init b_buf 0 1568)) /\
     (BArray200.is_init b_st 0 224)))]);
    offset <- 0;
    _LEN <- 1568;
    if ((_RATE8 <= (aT + _LEN))) {
      b_param_0 <- b_st;
      param_4 <- st;
      param_3 <- aT;
      param_2 <- buf;
      param_1 <- offset;
      param_0 <- (_RATE8 - aT);
      param <- 0;
      (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a1568____addstate_ref (
      param_4, b_param_0, param_3, param_2,
      (BArray1568.init_arr (W8.of_int 255)), param_1, param_0, param);
      result_1 <- aux;
      b_result_4 <- aux_0;
      result_0 <- aux_1;
      result <- aux_2;
      trace_a1568____absorb_ref <- (trace_a1568____absorb_ref ++ tmp__trace);
      trace_a1568____absorb_ref <-
      (trace_a1568____absorb_ref ++
      [(Assert,
       (((0 <= param_0) /\ (param_0 <= 18446744073709551615)) /\
       (((0 <= (param_1 + param_0)) /\
        ((param_1 + param_0) <= 18446744073709551615)) /\
       (((BArray200.is_init b_result_4 0 200) /\
        (result_0 = ((param_3 + param_0) + ((param <> 0) ? 1 : 0)))) /\
       (result = (param_1 + param_0))))))]);
      trace_a1568____absorb_ref <-
      (trace_a1568____absorb_ref ++
      [(Assert, ((0 <= result) /\ (result <= 18446744073709551615)))]);
      st <- result_1;
      offset <- result;
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      param_5 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_5,
      (BArray200.init_arr (W8.of_int 255)));
      result_2 <- aux;
      b_result_3 <- aux_0;
      trace_a1568____absorb_ref <- (trace_a1568____absorb_ref ++ tmp__trace);
      trace_a1568____absorb_ref <-
      (trace_a1568____absorb_ref ++
      [(Assert, (BArray200.is_init b_result_3 0 200))]);
      b_st <- (BArray200.init_arr (W8.of_int 255));
      st <- result_2;
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      trace_a1568____absorb_ref <-
      (trace_a1568____absorb_ref ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_11 <- st;
        param_10 <- 0;
        param_9 <- buf;
        param_8 <- offset;
        param_7 <- _RATE8;
        param_6 <- 0;
        (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a1568____addstate_ref (
        param_11, (BArray200.init_arr (W8.of_int 255)), param_10, param_9,
        (BArray1568.init_arr (W8.of_int 255)), param_8, param_7, param_6);
        result_5 <- aux;
        b_result_2 <- aux_0;
        result_4 <- aux_1;
        result_3 <- aux_2;
        trace_a1568____absorb_ref <-
        (trace_a1568____absorb_ref ++ tmp__trace);
        trace_a1568____absorb_ref <-
        (trace_a1568____absorb_ref ++
        [(Assert,
         (((0 <= param_7) /\ (param_7 <= 18446744073709551615)) /\
         (((0 <= (param_8 + param_7)) /\
          ((param_8 + param_7) <= 18446744073709551615)) /\
         (((BArray200.is_init b_result_2 0 200) /\
          (result_4 = ((param_10 + param_7) + ((param_6 <> 0) ? 1 : 0)))) /\
         (result_3 = (param_8 + param_7))))))]);
        trace_a1568____absorb_ref <-
        (trace_a1568____absorb_ref ++
        [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
        st <- result_5;
        offset <- result_3;
        (* Erased call to spill *)
        param_12 <- st;
        (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_12,
        (BArray200.init_arr (W8.of_int 255)));
        result_6 <- aux;
        b_result_1 <- aux_0;
        trace_a1568____absorb_ref <-
        (trace_a1568____absorb_ref ++ tmp__trace);
        trace_a1568____absorb_ref <-
        (trace_a1568____absorb_ref ++
        [(Assert, (BArray200.is_init b_result_1 0 200))]);
        b_st <- (BArray200.init_arr (W8.of_int 255));
        st <- result_6;
        (* Erased call to unspill *)
        trace_a1568____absorb_ref <-
        (trace_a1568____absorb_ref ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace_a1568____absorb_ref <-
        (trace_a1568____absorb_ref ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    b_param <- b_st;
    param_18 <- st;
    param_17 <- aT;
    param_16 <- buf;
    param_15 <- offset;
    param_14 <- _LEN;
    param_13 <- _TRAILB;
    (aux, aux_0, aux_1, aux_2, tmp__trace) <@ a1568____addstate_ref (
    param_18, b_param, param_17, param_16,
    (BArray1568.init_arr (W8.of_int 255)), param_15, param_14, param_13);
    result_9 <- aux;
    b_result_0 <- aux_0;
    result_8 <- aux_1;
    result_7 <- aux_2;
    trace_a1568____absorb_ref <- (trace_a1568____absorb_ref ++ tmp__trace);
    trace_a1568____absorb_ref <-
    (trace_a1568____absorb_ref ++
    [(Assert,
     (((0 <= param_14) /\ (param_14 <= 18446744073709551615)) /\
     (((0 <= (param_15 + param_14)) /\
      ((param_15 + param_14) <= 18446744073709551615)) /\
     (((BArray200.is_init b_result_0 0 200) /\
      (result_8 = ((param_17 + param_14) + ((param_13 <> 0) ? 1 : 0)))) /\
     (result_7 = (param_15 + param_14))))))]);
    trace_a1568____absorb_ref <-
    (trace_a1568____absorb_ref ++
    [(Assert, ((0 <= result_7) /\ (result_7 <= 18446744073709551615)))]);
    st <- result_9;
    aT <- result_8;
    if ((_TRAILB <> 0)) {
      param_20 <- st;
      param_19 <- _RATE8;
      (aux, aux_0, tmp__trace) <@ __addratebit_ref (param_20,
      (BArray200.init_arr (W8.of_int 255)), param_19);
      result_10 <- aux;
      b_result <- aux_0;
      trace_a1568____absorb_ref <- (trace_a1568____absorb_ref ++ tmp__trace);
      trace_a1568____absorb_ref <-
      (trace_a1568____absorb_ref ++
      [(Assert, (BArray200.is_init b_result 0 200))]);
      st <- result_10;
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, trace_a1568____absorb_ref);
  }
  proc _shake256_128_33 (out:BArray128.t, b_out:BArray128.t, in_0:BArray33.t,
                         b_in:BArray33.t) : BArray128.t * BArray128.t * trace = {
    var aux_2:BArray128.t;
    var aux_3:BArray128.t;
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_1:int;
    var st_s:BArray200.t;
    var st:BArray200.t;
    var param:BArray200.t;
    var result:BArray200.t;
    var param_0:int;
    var param_1:int;
    var param_2:BArray33.t;
    var param_3:int;
    var param_4:BArray200.t;
    var result_0:int;
    var result_1:BArray200.t;
    var param_5:int;
    var param_6:BArray128.t;
    var param_7:BArray200.t;
    var result_2:BArray128.t;
    var result_3:BArray200.t;
    var b_result:BArray128.t;
    var b_result_0:BArray200.t;
    var b_param:BArray128.t;
    var b_param_0:BArray200.t;
    var b_st:BArray200.t;
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_param_1:BArray200.t;
    var b_st_s:BArray200.t;
    var trace__shake256_128_33:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_st <- witness;
    b_st_s <- witness;
    param <- witness;
    param_2 <- witness;
    param_4 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    result <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_3 <- witness;
    st <- witness;
    st_s <- witness;
    trace__shake256_128_33 <- [];
    trace__shake256_128_33 <-
    (trace__shake256_128_33 ++ [(Assert, (BArray33.is_init b_in 0 33))]);
    b_st_s <- (BArray200.init_arr (W8.of_int 0));
    b_st <- b_st_s;
    st <- st_s;
    b_param_1 <- b_st;
    param <- st;
    (aux, aux_0, tmp__trace) <@ __state_init_ref (param, b_param_1);
    result <- aux;
    b_result_2 <- aux_0;
    trace__shake256_128_33 <- (trace__shake256_128_33 ++ tmp__trace);
    trace__shake256_128_33 <-
    (trace__shake256_128_33 ++
    [(Assert, (BArray200.is_init b_result_2 0 200))]);
    st <- result;
    (* Erased call to spill *)
    param_4 <- st;
    param_3 <- 0;
    param_2 <- in_0;
    param_1 <- 31;
    param_0 <- 136;
    (aux, aux_0, aux_1, tmp__trace) <@ a33____absorb_ref (param_4,
    (BArray200.init_arr (W8.of_int 255)), param_3, param_2,
    (BArray33.init_arr (W8.of_int 255)), param_1, param_0);
    result_1 <- aux;
    b_result_1 <- aux_0;
    result_0 <- aux_1;
    trace__shake256_128_33 <- (trace__shake256_128_33 ++ tmp__trace);
    trace__shake256_128_33 <-
    (trace__shake256_128_33 ++
    [(Assert, (BArray200.is_init b_result_1 0 224))]);
    b_st <- b_result_1;
    st <- result_1;
    (* Erased call to unspill *)
    b_param_0 <- b_st;
    param_7 <- st;
    b_param <- b_out;
    param_6 <- out;
    param_5 <- 136;
    (aux, aux_0, aux_2, aux_3, tmp__trace) <@ a128____squeeze_ref (param_7,
    b_param_0, param_6, b_param, param_5);
    result_3 <- aux;
    b_result_0 <- aux_0;
    result_2 <- aux_2;
    b_result <- aux_3;
    trace__shake256_128_33 <- (trace__shake256_128_33 ++ tmp__trace);
    trace__shake256_128_33 <-
    (trace__shake256_128_33 ++
    [(Assert, (BArray200.is_init b_result_0 0 224))]);
    trace__shake256_128_33 <-
    (trace__shake256_128_33 ++
    [(Assert, (BArray128.is_init b_result 0 128))]);
    out <- result_2;
    b_out <- (BArray128.init_arr (W8.of_int 255));
    return (out, b_out, trace__shake256_128_33);
  }
  proc _shake256_A32__A1600 (out:BArray32.t, b_out:BArray32.t,
                             in0:BArray32.t, b_in0:BArray32.t,
                             in1:BArray1568.t, b_in1:BArray1568.t) : 
  BArray32.t * BArray32.t * trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_2:BArray32.t;
    var aux_3:BArray32.t;
    var aux_1:int;
    var st_s:BArray200.t;
    var st:BArray200.t;
    var param:BArray200.t;
    var result:BArray200.t;
    var param_0:int;
    var param_1:int;
    var param_2:BArray32.t;
    var param_3:int;
    var param_4:BArray200.t;
    var result_0:int;
    var result_1:BArray200.t;
    var param_5:int;
    var param_6:int;
    var param_7:BArray1568.t;
    var param_8:int;
    var param_9:BArray200.t;
    var result_2:int;
    var result_3:BArray200.t;
    var param_10:int;
    var param_11:BArray32.t;
    var param_12:BArray200.t;
    var result_4:BArray32.t;
    var result_5:BArray200.t;
    var b_result:BArray32.t;
    var b_result_0:BArray200.t;
    var b_param:BArray32.t;
    var b_param_0:BArray200.t;
    var b_st:BArray200.t;
    var b_result_1:BArray200.t;
    var b_param_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_result_3:BArray200.t;
    var b_param_2:BArray200.t;
    var b_st_s:BArray200.t;
    var trace__shake256_A32__A1600:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_st <- witness;
    b_st_s <- witness;
    param <- witness;
    param_2 <- witness;
    param_4 <- witness;
    param_7 <- witness;
    param_9 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    result <- witness;
    result_1 <- witness;
    result_3 <- witness;
    result_4 <- witness;
    result_5 <- witness;
    st <- witness;
    st_s <- witness;
    trace__shake256_A32__A1600 <- [];
    trace__shake256_A32__A1600 <-
    (trace__shake256_A32__A1600 ++
    [(Assert,
     ((BArray32.is_init b_in0 0 32) /\ (BArray1568.is_init b_in1 0 1568)))]);
    b_st_s <- (BArray200.init_arr (W8.of_int 0));
    (* Erased call to spill *)
    (* Erased call to spill *)
    b_st <- b_st_s;
    st <- st_s;
    b_param_2 <- b_st;
    param <- st;
    (aux, aux_0, tmp__trace) <@ __state_init_ref (param, b_param_2);
    result <- aux;
    b_result_3 <- aux_0;
    trace__shake256_A32__A1600 <- (trace__shake256_A32__A1600 ++ tmp__trace);
    trace__shake256_A32__A1600 <-
    (trace__shake256_A32__A1600 ++
    [(Assert, (BArray200.is_init b_result_3 0 200))]);
    st <- result;
    param_4 <- st;
    param_3 <- 0;
    param_2 <- in0;
    param_1 <- 0;
    param_0 <- 136;
    (aux, aux_0, aux_1, tmp__trace) <@ a32____absorb_ref (param_4,
    (BArray200.init_arr (W8.of_int 255)), param_3, param_2,
    (BArray32.init_arr (W8.of_int 255)), param_1, param_0);
    result_1 <- aux;
    b_result_2 <- aux_0;
    result_0 <- aux_1;
    trace__shake256_A32__A1600 <- (trace__shake256_A32__A1600 ++ tmp__trace);
    trace__shake256_A32__A1600 <-
    (trace__shake256_A32__A1600 ++
    [(Assert, (BArray200.is_init b_result_2 0 224))]);
    b_st <- b_result_2;
    st <- result_1;
    (* Erased call to unspill *)
    b_param_1 <- b_st;
    param_9 <- st;
    param_8 <- 32;
    param_7 <- in1;
    param_6 <- 31;
    param_5 <- 136;
    (aux, aux_0, aux_1, tmp__trace) <@ a1568____absorb_ref (param_9,
    b_param_1, param_8, param_7, (BArray1568.init_arr (W8.of_int 255)),
    param_6, param_5);
    result_3 <- aux;
    b_result_1 <- aux_0;
    result_2 <- aux_1;
    trace__shake256_A32__A1600 <- (trace__shake256_A32__A1600 ++ tmp__trace);
    trace__shake256_A32__A1600 <-
    (trace__shake256_A32__A1600 ++
    [(Assert, (BArray200.is_init b_result_1 0 224))]);
    b_st <- b_result_1;
    st <- result_3;
    (* Erased call to unspill *)
    b_param_0 <- b_st;
    param_12 <- st;
    b_param <- b_out;
    param_11 <- out;
    param_10 <- 136;
    (aux, aux_0, aux_2, aux_3, tmp__trace) <@ a32____squeeze_ref (param_12,
    b_param_0, param_11, b_param, param_10);
    result_5 <- aux;
    b_result_0 <- aux_0;
    result_4 <- aux_2;
    b_result <- aux_3;
    trace__shake256_A32__A1600 <- (trace__shake256_A32__A1600 ++ tmp__trace);
    trace__shake256_A32__A1600 <-
    (trace__shake256_A32__A1600 ++
    [(Assert, (BArray200.is_init b_result_0 0 224))]);
    trace__shake256_A32__A1600 <-
    (trace__shake256_A32__A1600 ++
    [(Assert, (BArray32.is_init b_result 0 32))]);
    out <- result_4;
    b_out <- (BArray32.init_arr (W8.of_int 255));
    return (out, b_out, trace__shake256_A32__A1600);
  }
  proc _sha3_512A_A33 (out:BArray64.t, b_out:BArray64.t, in_0:BArray33.t,
                       b_in:BArray33.t) : BArray64.t * BArray64.t * trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_2:BArray64.t;
    var aux_3:BArray64.t;
    var aux_1:int;
    var st_s:BArray200.t;
    var st:BArray200.t;
    var param:BArray200.t;
    var result:BArray200.t;
    var param_0:int;
    var param_1:int;
    var param_2:BArray33.t;
    var param_3:int;
    var param_4:BArray200.t;
    var result_0:int;
    var result_1:BArray200.t;
    var param_5:int;
    var param_6:BArray64.t;
    var param_7:BArray200.t;
    var result_2:BArray64.t;
    var result_3:BArray200.t;
    var b_result:BArray64.t;
    var b_result_0:BArray200.t;
    var b_param:BArray64.t;
    var b_param_0:BArray200.t;
    var b_st:BArray200.t;
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_param_1:BArray200.t;
    var b_st_s:BArray200.t;
    var trace__sha3_512A_A33:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_st <- witness;
    b_st_s <- witness;
    param <- witness;
    param_2 <- witness;
    param_4 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    result <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_3 <- witness;
    st <- witness;
    st_s <- witness;
    trace__sha3_512A_A33 <- [];
    trace__sha3_512A_A33 <-
    (trace__sha3_512A_A33 ++ [(Assert, (BArray33.is_init b_in 0 33))]);
    b_st_s <- (BArray200.init_arr (W8.of_int 0));
    b_st <- b_st_s;
    st <- st_s;
    b_param_1 <- b_st;
    param <- st;
    (aux, aux_0, tmp__trace) <@ __state_init_ref (param, b_param_1);
    result <- aux;
    b_result_2 <- aux_0;
    trace__sha3_512A_A33 <- (trace__sha3_512A_A33 ++ tmp__trace);
    trace__sha3_512A_A33 <-
    (trace__sha3_512A_A33 ++
    [(Assert, (BArray200.is_init b_result_2 0 200))]);
    st <- result;
    (* Erased call to spill *)
    param_4 <- st;
    param_3 <- 0;
    param_2 <- in_0;
    param_1 <- 6;
    param_0 <- 72;
    (aux, aux_0, aux_1, tmp__trace) <@ a33____absorb_ref (param_4,
    (BArray200.init_arr (W8.of_int 255)), param_3, param_2,
    (BArray33.init_arr (W8.of_int 255)), param_1, param_0);
    result_1 <- aux;
    b_result_1 <- aux_0;
    result_0 <- aux_1;
    trace__sha3_512A_A33 <- (trace__sha3_512A_A33 ++ tmp__trace);
    trace__sha3_512A_A33 <-
    (trace__sha3_512A_A33 ++
    [(Assert, (BArray200.is_init b_result_1 0 224))]);
    b_st <- b_result_1;
    st <- result_1;
    (* Erased call to unspill *)
    b_param_0 <- b_st;
    param_7 <- st;
    b_param <- b_out;
    param_6 <- out;
    param_5 <- 72;
    (aux, aux_0, aux_2, aux_3, tmp__trace) <@ a64____squeeze_ref (param_7,
    b_param_0, param_6, b_param, param_5);
    result_3 <- aux;
    b_result_0 <- aux_0;
    result_2 <- aux_2;
    b_result <- aux_3;
    trace__sha3_512A_A33 <- (trace__sha3_512A_A33 ++ tmp__trace);
    trace__sha3_512A_A33 <-
    (trace__sha3_512A_A33 ++
    [(Assert, (BArray200.is_init b_result_0 0 224))]);
    trace__sha3_512A_A33 <-
    (trace__sha3_512A_A33 ++ [(Assert, (BArray64.is_init b_result 0 64))]);
    out <- result_2;
    b_out <- (BArray64.init_arr (W8.of_int 255));
    return (out, b_out, trace__sha3_512A_A33);
  }
  proc _shake128_absorb34 (st:BArray200.t, b_st:BArray200.t, in_0:BArray34.t,
                           b_in:BArray34.t) : BArray200.t * BArray200.t *
                                              trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_1:int;
    var param:BArray200.t;
    var result:BArray200.t;
    var param_0:int;
    var param_1:int;
    var param_2:BArray34.t;
    var param_3:int;
    var param_4:BArray200.t;
    var result_0:int;
    var result_1:BArray200.t;
    var b_result:BArray200.t;
    var b_result_0:BArray200.t;
    var b_param:BArray200.t;
    var trace__shake128_absorb34:trace;
    b_param <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    param <- witness;
    param_2 <- witness;
    param_4 <- witness;
    result <- witness;
    result_1 <- witness;
    trace__shake128_absorb34 <- [];
    trace__shake128_absorb34 <-
    (trace__shake128_absorb34 ++ [(Assert, (BArray34.is_init b_in 0 34))]);
    b_param <- b_st;
    param <- st;
    (aux, aux_0, tmp__trace) <@ __state_init_ref (param, b_param);
    result <- aux;
    b_result_0 <- aux_0;
    trace__shake128_absorb34 <- (trace__shake128_absorb34 ++ tmp__trace);
    trace__shake128_absorb34 <-
    (trace__shake128_absorb34 ++
    [(Assert, (BArray200.is_init b_result_0 0 200))]);
    st <- result;
    param_4 <- st;
    param_3 <- 0;
    param_2 <- in_0;
    param_1 <- 31;
    param_0 <- 168;
    (aux, aux_0, aux_1, tmp__trace) <@ a34____absorb_ref (param_4,
    (BArray200.init_arr (W8.of_int 255)), param_3, param_2,
    (BArray34.init_arr (W8.of_int 255)), param_1, param_0);
    result_1 <- aux;
    b_result <- aux_0;
    result_0 <- aux_1;
    trace__shake128_absorb34 <- (trace__shake128_absorb34 ++ tmp__trace);
    trace__shake128_absorb34 <-
    (trace__shake128_absorb34 ++
    [(Assert, (BArray200.is_init b_result 0 224))]);
    b_st <- b_result;
    st <- result_1;
    return (st, b_st, trace__shake128_absorb34);
  }
  proc _shake128_squeezeblock (st:BArray200.t, b_st:BArray200.t,
                               out:BArray168.t, b_out:BArray168.t) : 
  BArray200.t * BArray200.t * BArray168.t * BArray168.t * trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var param:BArray200.t;
    var result:BArray200.t;
    var param_0:BArray200.t;
    var param_1:int;
    var param_2:int;
    var param_3:BArray168.t;
    var result_0:int;
    var result_1:BArray168.t;
    var b_result:BArray168.t;
    var b_param:BArray168.t;
    var b_result_0:BArray200.t;
    var trace__shake128_squeezeblock:trace;
    b_param <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    param <- witness;
    param_0 <- witness;
    param_3 <- witness;
    result <- witness;
    result_1 <- witness;
    trace__shake128_squeezeblock <- [];
    trace__shake128_squeezeblock <-
    (trace__shake128_squeezeblock ++
    [(Assert, (BArray200.is_init b_st 0 200))]);
    (* Erased call to spill *)
    param <- st;
    (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param,
    (BArray200.init_arr (W8.of_int 255)));
    result <- aux;
    b_result_0 <- aux_0;
    trace__shake128_squeezeblock <-
    (trace__shake128_squeezeblock ++ tmp__trace);
    trace__shake128_squeezeblock <-
    (trace__shake128_squeezeblock ++
    [(Assert, (BArray200.is_init b_result_0 0 200))]);
    st <- result;
    (* Erased call to unspill *)
    b_param <- b_out;
    param_3 <- out;
    param_2 <- 0;
    param_1 <- 168;
    param_0 <- st;
    (result_1, b_result, result_0, tmp__trace) <@ a168____dumpstate_ref (
    param_3, b_param, param_2, param_1, param_0,
    (BArray200.init_arr (W8.of_int 255)));
    trace__shake128_squeezeblock <-
    (trace__shake128_squeezeblock ++ tmp__trace);
    trace__shake128_squeezeblock <-
    (trace__shake128_squeezeblock ++
    [(Assert,
     (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
     (((0 <= (param_2 + param_1)) /\
      ((param_2 + param_1) <= 18446744073709551615)) /\
     (result_0 = (param_2 + param_1)))))]);
    trace__shake128_squeezeblock <-
    (trace__shake128_squeezeblock ++
    [(Assert,
     (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
     (((0 <= (param_2 + param_1)) /\
      ((param_2 + param_1) <= 18446744073709551615)) /\
     (BArray168.is_init b_result 0 (param_2 + param_1)))))]);
    trace__shake128_squeezeblock <-
    (trace__shake128_squeezeblock ++
    [(Assert, ((0 <= result_0) /\ (result_0 <= 18446744073709551615)))]);
    b_out <- b_result;
    out <- result_1;
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, out, b_out, trace__shake128_squeezeblock);
  }
  proc _sha3_256A_A1568 (out:BArray32.t, b_out:BArray32.t, in_0:BArray1568.t,
                         b_in:BArray1568.t) : BArray32.t * BArray32.t * trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_2:BArray32.t;
    var aux_3:BArray32.t;
    var aux_1:int;
    var st_s:BArray200.t;
    var st:BArray200.t;
    var param:BArray200.t;
    var result:BArray200.t;
    var param_0:int;
    var param_1:int;
    var param_2:BArray1568.t;
    var param_3:int;
    var param_4:BArray200.t;
    var result_0:int;
    var result_1:BArray200.t;
    var param_5:int;
    var param_6:BArray32.t;
    var param_7:BArray200.t;
    var result_2:BArray32.t;
    var result_3:BArray200.t;
    var b_result:BArray32.t;
    var b_result_0:BArray200.t;
    var b_param:BArray32.t;
    var b_param_0:BArray200.t;
    var b_st:BArray200.t;
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_param_1:BArray200.t;
    var b_st_s:BArray200.t;
    var trace__sha3_256A_A1568:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_st <- witness;
    b_st_s <- witness;
    param <- witness;
    param_2 <- witness;
    param_4 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    result <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_3 <- witness;
    st <- witness;
    st_s <- witness;
    trace__sha3_256A_A1568 <- [];
    trace__sha3_256A_A1568 <-
    (trace__sha3_256A_A1568 ++ [(Assert, (BArray1568.is_init b_in 0 1568))]);
    b_st_s <- (BArray200.init_arr (W8.of_int 0));
    (* Erased call to spill *)
    b_st <- b_st_s;
    st <- st_s;
    b_param_1 <- b_st;
    param <- st;
    (aux, aux_0, tmp__trace) <@ __state_init_ref (param, b_param_1);
    result <- aux;
    b_result_2 <- aux_0;
    trace__sha3_256A_A1568 <- (trace__sha3_256A_A1568 ++ tmp__trace);
    trace__sha3_256A_A1568 <-
    (trace__sha3_256A_A1568 ++
    [(Assert, (BArray200.is_init b_result_2 0 200))]);
    st <- result;
    param_4 <- st;
    param_3 <- 0;
    param_2 <- in_0;
    param_1 <- 6;
    param_0 <- 136;
    (aux, aux_0, aux_1, tmp__trace) <@ a1568____absorb_ref (param_4,
    (BArray200.init_arr (W8.of_int 255)), param_3, param_2,
    (BArray1568.init_arr (W8.of_int 255)), param_1, param_0);
    result_1 <- aux;
    b_result_1 <- aux_0;
    result_0 <- aux_1;
    trace__sha3_256A_A1568 <- (trace__sha3_256A_A1568 ++ tmp__trace);
    trace__sha3_256A_A1568 <-
    (trace__sha3_256A_A1568 ++
    [(Assert, (BArray200.is_init b_result_1 0 224))]);
    b_st <- b_result_1;
    st <- result_1;
    (* Erased call to unspill *)
    b_param_0 <- b_st;
    param_7 <- st;
    b_param <- b_out;
    param_6 <- out;
    param_5 <- 136;
    (aux, aux_0, aux_2, aux_3, tmp__trace) <@ a32____squeeze_ref (param_7,
    b_param_0, param_6, b_param, param_5);
    result_3 <- aux;
    b_result_0 <- aux_0;
    result_2 <- aux_2;
    b_result <- aux_3;
    trace__sha3_256A_A1568 <- (trace__sha3_256A_A1568 ++ tmp__trace);
    trace__sha3_256A_A1568 <-
    (trace__sha3_256A_A1568 ++
    [(Assert, (BArray200.is_init b_result_0 0 224))]);
    trace__sha3_256A_A1568 <-
    (trace__sha3_256A_A1568 ++ [(Assert, (BArray32.is_init b_result 0 32))]);
    out <- result_2;
    b_out <- (BArray32.init_arr (W8.of_int 255));
    return (out, b_out, trace__sha3_256A_A1568);
  }
  proc _sha3_512A_A64 (out:BArray64.t, b_out:BArray64.t, in_0:BArray64.t,
                       b_in:BArray64.t) : BArray64.t * BArray64.t * trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_2:BArray64.t;
    var aux_3:BArray64.t;
    var aux_1:int;
    var st_s:BArray200.t;
    var st:BArray200.t;
    var param:BArray200.t;
    var result:BArray200.t;
    var param_0:int;
    var param_1:int;
    var param_2:BArray64.t;
    var param_3:int;
    var param_4:BArray200.t;
    var result_0:int;
    var result_1:BArray200.t;
    var param_5:int;
    var param_6:BArray64.t;
    var param_7:BArray200.t;
    var result_2:BArray64.t;
    var result_3:BArray200.t;
    var b_result:BArray64.t;
    var b_result_0:BArray200.t;
    var b_param:BArray64.t;
    var b_param_0:BArray200.t;
    var b_st:BArray200.t;
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_param_1:BArray200.t;
    var b_st_s:BArray200.t;
    var trace__sha3_512A_A64:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_st <- witness;
    b_st_s <- witness;
    param <- witness;
    param_2 <- witness;
    param_4 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    result <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_3 <- witness;
    st <- witness;
    st_s <- witness;
    trace__sha3_512A_A64 <- [];
    trace__sha3_512A_A64 <-
    (trace__sha3_512A_A64 ++ [(Assert, (BArray64.is_init b_in 0 64))]);
    b_st_s <- (BArray200.init_arr (W8.of_int 0));
    b_st <- b_st_s;
    st <- st_s;
    b_param_1 <- b_st;
    param <- st;
    (aux, aux_0, tmp__trace) <@ __state_init_ref (param, b_param_1);
    result <- aux;
    b_result_2 <- aux_0;
    trace__sha3_512A_A64 <- (trace__sha3_512A_A64 ++ tmp__trace);
    trace__sha3_512A_A64 <-
    (trace__sha3_512A_A64 ++
    [(Assert, (BArray200.is_init b_result_2 0 200))]);
    st <- result;
    (* Erased call to spill *)
    param_4 <- st;
    param_3 <- 0;
    param_2 <- in_0;
    param_1 <- 6;
    param_0 <- 72;
    (aux, aux_0, aux_1, tmp__trace) <@ a64____absorb_ref (param_4,
    (BArray200.init_arr (W8.of_int 255)), param_3, param_2,
    (BArray64.init_arr (W8.of_int 255)), param_1, param_0);
    result_1 <- aux;
    b_result_1 <- aux_0;
    result_0 <- aux_1;
    trace__sha3_512A_A64 <- (trace__sha3_512A_A64 ++ tmp__trace);
    trace__sha3_512A_A64 <-
    (trace__sha3_512A_A64 ++
    [(Assert, (BArray200.is_init b_result_1 0 224))]);
    b_st <- b_result_1;
    st <- result_1;
    (* Erased call to unspill *)
    b_param_0 <- b_st;
    param_7 <- st;
    b_param <- b_out;
    param_6 <- out;
    param_5 <- 72;
    (aux, aux_0, aux_2, aux_3, tmp__trace) <@ a64____squeeze_ref (param_7,
    b_param_0, param_6, b_param, param_5);
    result_3 <- aux;
    b_result_0 <- aux_0;
    result_2 <- aux_2;
    b_result <- aux_3;
    trace__sha3_512A_A64 <- (trace__sha3_512A_A64 ++ tmp__trace);
    trace__sha3_512A_A64 <-
    (trace__sha3_512A_A64 ++
    [(Assert, (BArray200.is_init b_result_0 0 224))]);
    trace__sha3_512A_A64 <-
    (trace__sha3_512A_A64 ++ [(Assert, (BArray64.is_init b_result 0 64))]);
    out <- result_2;
    b_out <- (BArray64.init_arr (W8.of_int 255));
    return (out, b_out, trace__sha3_512A_A64);
  }
  proc _poly_add2 (rp:BArray512.t, b_rp:BArray512.t, bp:BArray512.t,
                   b_bp:BArray512.t) : BArray512.t * BArray512.t * trace = {
    var a:W16.t;
    var b:W16.t;
    var r:W16.t;
    var i:int;
    var trace__poly_add2:trace;
    trace__poly_add2 <- [];
    trace__poly_add2 <-
    (trace__poly_add2 ++ [(Assert, (BArray512.is_init b_rp 0 512))]);
    trace__poly_add2 <-
    (trace__poly_add2 ++ [(Assert, (BArray512.is_init b_bp 0 512))]);
    i <- 0;
    while ((i < 256)) {
      trace__poly_add2 <-
      (trace__poly_add2 ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      a <- (BArray512.get16 rp i);
      trace__poly_add2 <-
      (trace__poly_add2 ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      b <- (BArray512.get16 bp i);
      r <- (a + b);
      trace__poly_add2 <-
      (trace__poly_add2 ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      rp <- (BArray512.set16 rp i r);
      trace__poly_add2 <-
      (trace__poly_add2 ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
    }
    b_rp <- (BArray512.init_arr (W8.of_int 255));
    return (rp, b_rp, trace__poly_add2);
  }
  proc _poly_csubq (rp:BArray512.t, b_rp:BArray512.t) : BArray512.t *
                                                        BArray512.t * trace = {
    var t:W16.t;
    var b:W16.t;
    var i:int;
    var trace__poly_csubq:trace;
    trace__poly_csubq <- [];
    trace__poly_csubq <-
    (trace__poly_csubq ++ [(Assert, (BArray512.is_init b_rp 0 512))]);
    i <- 0;
    while ((i < 256)) {
      trace__poly_csubq <-
      (trace__poly_csubq ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      t <- (BArray512.get16 rp i);
      t <- (t - (W16.of_int 3329));
      b <- t;
      b <- (b `|>>` (W8.of_int 15));
      b <- (b `&` (W16.of_int 3329));
      t <- (t + b);
      trace__poly_csubq <-
      (trace__poly_csubq ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      rp <- (BArray512.set16 rp i t);
      trace__poly_csubq <-
      (trace__poly_csubq ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
    }
    b_rp <- (BArray512.init_arr (W8.of_int 255));
    return (rp, b_rp, trace__poly_csubq);
  }
  proc _poly_basemul (rp:BArray512.t, b_rp:BArray512.t, ap:BArray512.t,
                      b_ap:BArray512.t, bp:BArray512.t, b_bp:BArray512.t) : 
  BArray512.t * BArray512.t * trace = {
    var srp:BArray512.t;
    var zetasp:BArray128.t;
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
    var param:W16.t;
    var param_0:W16.t;
    var result:W16.t;
    var param_1:W16.t;
    var param_2:W16.t;
    var result_0:W16.t;
    var param_3:W16.t;
    var param_4:W16.t;
    var result_1:W16.t;
    var param_5:W16.t;
    var param_6:W16.t;
    var result_2:W16.t;
    var param_7:W16.t;
    var param_8:W16.t;
    var result_3:W16.t;
    var param_9:W16.t;
    var param_10:W16.t;
    var result_4:W16.t;
    var param_11:W16.t;
    var param_12:W16.t;
    var result_5:W16.t;
    var param_13:W16.t;
    var param_14:W16.t;
    var result_6:W16.t;
    var param_15:W16.t;
    var param_16:W16.t;
    var result_7:W16.t;
    var param_17:W16.t;
    var param_18:W16.t;
    var result_8:W16.t;
    var b_srp:BArray512.t;
    var trace__poly_basemul:trace;
    b_srp <- witness;
    srp <- witness;
    zetasp <- witness;
    trace__poly_basemul <- [];
    trace__poly_basemul <-
    (trace__poly_basemul ++
    [(Assert,
     ((BArray512.is_init b_ap 0 512) /\ (BArray512.is_init b_bp 0 512)))]);
    b_srp <- b_rp;
    srp <- rp;
    i <- 0;
    while ((i < 253)) {
      zetasp <- (SBArray256_128.get_sub16 jzetas 64);
      zetasctr <- i;
      zetasctr <- (zetasctr `|>>` 2);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (zetasctr * 2)) /\ (((zetasctr * 2) + 2) <= 128)))]);
      zeta_0 <- (BArray128.get16 zetasp zetasctr);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      a0 <- (BArray512.get16 ap i);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      b0 <- (BArray512.get16 bp i);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      a1 <- (BArray512.get16 ap i);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      b1 <- (BArray512.get16 bp i);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i - 1)) /\ ((i - 1) <= 18446744073709551615)))]);
      i <- (i - 1);
      param_0 <- a1;
      param <- b1;
      (result, tmp__trace) <@ __fqmul (param_0, param);
      trace__poly_basemul <- (trace__poly_basemul ++ tmp__trace);
      r0 <- result;
      param_2 <- r0;
      param_1 <- zeta_0;
      (result_0, tmp__trace) <@ __fqmul (param_2, param_1);
      trace__poly_basemul <- (trace__poly_basemul ++ tmp__trace);
      r0 <- result_0;
      param_4 <- a0;
      param_3 <- b0;
      (result_1, tmp__trace) <@ __fqmul (param_4, param_3);
      trace__poly_basemul <- (trace__poly_basemul ++ tmp__trace);
      t <- result_1;
      r0 <- (r0 + t);
      param_6 <- a0;
      param_5 <- b1;
      (result_2, tmp__trace) <@ __fqmul (param_6, param_5);
      trace__poly_basemul <- (trace__poly_basemul ++ tmp__trace);
      r1 <- result_2;
      param_8 <- a1;
      param_7 <- b0;
      (result_3, tmp__trace) <@ __fqmul (param_8, param_7);
      trace__poly_basemul <- (trace__poly_basemul ++ tmp__trace);
      t <- result_3;
      r1 <- (r1 + t);
      b_rp <- b_srp;
      rp <- srp;
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (i * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp i r0);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (i * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp i r1);
      b_srp <- b_rp;
      srp <- rp;
      zeta_0 <- (- zeta_0);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      a0 <- (BArray512.get16 ap i);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      b0 <- (BArray512.get16 bp i);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      a1 <- (BArray512.get16 ap i);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      b1 <- (BArray512.get16 bp i);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i - 1)) /\ ((i - 1) <= 18446744073709551615)))]);
      i <- (i - 1);
      param_10 <- a1;
      param_9 <- b1;
      (result_4, tmp__trace) <@ __fqmul (param_10, param_9);
      trace__poly_basemul <- (trace__poly_basemul ++ tmp__trace);
      r0 <- result_4;
      param_12 <- r0;
      param_11 <- zeta_0;
      (result_5, tmp__trace) <@ __fqmul (param_12, param_11);
      trace__poly_basemul <- (trace__poly_basemul ++ tmp__trace);
      r0 <- result_5;
      param_14 <- a0;
      param_13 <- b0;
      (result_6, tmp__trace) <@ __fqmul (param_14, param_13);
      trace__poly_basemul <- (trace__poly_basemul ++ tmp__trace);
      t <- result_6;
      r0 <- (r0 + t);
      param_16 <- a0;
      param_15 <- b1;
      (result_7, tmp__trace) <@ __fqmul (param_16, param_15);
      trace__poly_basemul <- (trace__poly_basemul ++ tmp__trace);
      r1 <- result_7;
      param_18 <- a1;
      param_17 <- b0;
      (result_8, tmp__trace) <@ __fqmul (param_18, param_17);
      trace__poly_basemul <- (trace__poly_basemul ++ tmp__trace);
      t <- result_8;
      r1 <- (r1 + t);
      b_rp <- b_srp;
      rp <- srp;
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (i * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp i r0);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (i * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp i r1);
      b_srp <- b_rp;
      srp <- rp;
      trace__poly_basemul <-
      (trace__poly_basemul ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
    }
    return (rp, b_rp, trace__poly_basemul);
  }
  proc __poly_reduce (rp:BArray512.t, b_rp:BArray512.t) : BArray512.t *
                                                          BArray512.t * trace = {
    var t:W16.t;
    var j:int;
    var param:W16.t;
    var result:W16.t;
    var trace___poly_reduce:trace;
    trace___poly_reduce <- [];
    trace___poly_reduce <-
    (trace___poly_reduce ++ [(Assert, (BArray512.is_init b_rp 0 512))]);
    j <- 0;
    while ((j < 256)) {
      trace___poly_reduce <-
      (trace___poly_reduce ++
      [(Assert, ((0 <= (j * 2)) /\ (((j * 2) + 2) <= 512)))]);
      t <- (BArray512.get16 rp j);
      param <- t;
      (result, tmp__trace) <@ __barrett_reduce (param);
      trace___poly_reduce <- (trace___poly_reduce ++ tmp__trace);
      t <- result;
      trace___poly_reduce <-
      (trace___poly_reduce ++
      [(Assert, ((0 <= (j * 2)) /\ (((j * 2) + 2) <= 512)))]);
      rp <- (BArray512.set16 rp j t);
      trace___poly_reduce <-
      (trace___poly_reduce ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
    }
    b_rp <- (BArray512.init_arr (W8.of_int 255));
    return (rp, b_rp, trace___poly_reduce);
  }
  proc _poly_frombytes (rp:BArray512.t, b_rp:BArray512.t, ap:BArray384.t,
                        b_ap:BArray384.t) : BArray512.t * BArray512.t * trace = {
    var i:int;
    var c0:W8.t;
    var c1:W8.t;
    var c2:W8.t;
    var d0:W16.t;
    var t:W16.t;
    var d1:W16.t;
    var trace__poly_frombytes:trace;
    trace__poly_frombytes <- [];
    trace__poly_frombytes <-
    (trace__poly_frombytes ++ [(Assert, (BArray384.is_init b_ap 0 384))]);
    i <- 0;
    while ((i < 128)) {
      trace__poly_frombytes <-
      (trace__poly_frombytes ++
      [(Assert, ((0 <= (3 * i)) /\ (((3 * i) + 1) <= 384)))]);
      c0 <- (BArray384.get8 ap (3 * i));
      trace__poly_frombytes <-
      (trace__poly_frombytes ++
      [(Assert, ((0 <= ((3 * i) + 1)) /\ ((((3 * i) + 1) + 1) <= 384)))]);
      c1 <- (BArray384.get8 ap ((3 * i) + 1));
      trace__poly_frombytes <-
      (trace__poly_frombytes ++
      [(Assert, ((0 <= ((3 * i) + 2)) /\ ((((3 * i) + 2) + 1) <= 384)))]);
      c2 <- (BArray384.get8 ap ((3 * i) + 2));
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
      trace__poly_frombytes <-
      (trace__poly_frombytes ++
      [(Assert, ((0 <= ((2 * i) * 2)) /\ ((((2 * i) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp ((2 * i) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp (2 * i) d0);
      trace__poly_frombytes <-
      (trace__poly_frombytes ++
      [(Assert,
       ((0 <= (((2 * i) + 1) * 2)) /\ (((((2 * i) + 1) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (((2 * i) + 1) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp ((2 * i) + 1) d1);
      i <- (i + 1);
    }
    return (rp, b_rp, trace__poly_frombytes);
  }
  proc _poly_frommont (rp:BArray512.t, b_rp:BArray512.t) : BArray512.t *
                                                           BArray512.t *
                                                           trace = {
    var dmont:W16.t;
    var r:W16.t;
    var i:int;
    var param:W16.t;
    var param_0:W16.t;
    var result:W16.t;
    var trace__poly_frommont:trace;
    trace__poly_frommont <- [];
    trace__poly_frommont <-
    (trace__poly_frommont ++ [(Assert, (BArray512.is_init b_rp 0 512))]);
    dmont <- (W16.of_int 1353);
    i <- 0;
    while ((i < 256)) {
      trace__poly_frommont <-
      (trace__poly_frommont ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      r <- (BArray512.get16 rp i);
      param_0 <- r;
      param <- dmont;
      (result, tmp__trace) <@ __fqmul (param_0, param);
      trace__poly_frommont <- (trace__poly_frommont ++ tmp__trace);
      r <- result;
      trace__poly_frommont <-
      (trace__poly_frommont ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      rp <- (BArray512.set16 rp i r);
      trace__poly_frommont <-
      (trace__poly_frommont ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
    }
    b_rp <- (BArray512.init_arr (W8.of_int 255));
    return (rp, b_rp, trace__poly_frommont);
  }
  proc _i_poly_frommsg (rp:BArray512.t, b_rp:BArray512.t, ap:BArray32.t,
                        b_ap:BArray32.t) : BArray512.t * BArray512.t * trace = {
    var i:int;
    var c:W8.t;
    var t:W16.t;
    var trace__i_poly_frommsg:trace;
    trace__i_poly_frommsg <- [];
    trace__i_poly_frommsg <-
    (trace__i_poly_frommsg ++ [(Assert, (BArray32.is_init b_ap 0 32))]);
    i <- 0;
    while ((i < 32)) {
      trace__i_poly_frommsg <-
      (trace__i_poly_frommsg ++ [(Assert, ((0 <= i) /\ ((i + 1) <= 32)))]);
      c <- (BArray32.get8 ap i);
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int 1665));
      trace__i_poly_frommsg <-
      (trace__i_poly_frommsg ++
      [(Assert, ((0 <= ((8 * i) * 2)) /\ ((((8 * i) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp ((8 * i) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp (8 * i) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int 1665));
      trace__i_poly_frommsg <-
      (trace__i_poly_frommsg ++
      [(Assert,
       ((0 <= (((8 * i) + 1) * 2)) /\ (((((8 * i) + 1) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (((8 * i) + 1) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp ((8 * i) + 1) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int 1665));
      trace__i_poly_frommsg <-
      (trace__i_poly_frommsg ++
      [(Assert,
       ((0 <= (((8 * i) + 2) * 2)) /\ (((((8 * i) + 2) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (((8 * i) + 2) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp ((8 * i) + 2) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int 1665));
      trace__i_poly_frommsg <-
      (trace__i_poly_frommsg ++
      [(Assert,
       ((0 <= (((8 * i) + 3) * 2)) /\ (((((8 * i) + 3) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (((8 * i) + 3) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp ((8 * i) + 3) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int 1665));
      trace__i_poly_frommsg <-
      (trace__i_poly_frommsg ++
      [(Assert,
       ((0 <= (((8 * i) + 4) * 2)) /\ (((((8 * i) + 4) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (((8 * i) + 4) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp ((8 * i) + 4) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int 1665));
      trace__i_poly_frommsg <-
      (trace__i_poly_frommsg ++
      [(Assert,
       ((0 <= (((8 * i) + 5) * 2)) /\ (((((8 * i) + 5) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (((8 * i) + 5) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp ((8 * i) + 5) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int 1665));
      trace__i_poly_frommsg <-
      (trace__i_poly_frommsg ++
      [(Assert,
       ((0 <= (((8 * i) + 6) * 2)) /\ (((((8 * i) + 6) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (((8 * i) + 6) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp ((8 * i) + 6) t);
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      t <- (t * (W16.of_int 1665));
      trace__i_poly_frommsg <-
      (trace__i_poly_frommsg ++
      [(Assert,
       ((0 <= (((8 * i) + 7) * 2)) /\ (((((8 * i) + 7) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (((8 * i) + 7) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp ((8 * i) + 7) t);
      i <- (i + 1);
    }
    return (rp, b_rp, trace__i_poly_frommsg);
  }
  proc _poly_getnoise (rp:BArray512.t, b_rp:BArray512.t, s_seed:BArray32.t,
                       b_s_seed:BArray32.t, nonce:W8.t) : BArray512.t *
                                                          BArray512.t * trace = {
    var seed:BArray32.t;
    var k:int;
    var c:W8.t;
    var extseed:BArray33.t;
    var buf:BArray128.t;
    var a:W8.t;
    var b:W8.t;
    var t:W16.t;
    var i:int;
    var param:BArray33.t;
    var param_0:BArray128.t;
    var result:BArray128.t;
    var b_buf:BArray128.t;
    var b_result:BArray128.t;
    var b_param:BArray33.t;
    var b_param_0:BArray128.t;
    var b_extseed:BArray33.t;
    var trace__poly_getnoise:trace;
    b_buf <- witness;
    b_extseed <- witness;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    buf <- witness;
    extseed <- witness;
    param <- witness;
    param_0 <- witness;
    result <- witness;
    seed <- witness;
    trace__poly_getnoise <- [];
    trace__poly_getnoise <-
    (trace__poly_getnoise ++ [(Assert, (BArray32.is_init b_s_seed 0 32))]);
    b_extseed <- (BArray33.init_arr (W8.of_int 0));
    b_buf <- (BArray128.init_arr (W8.of_int 0));
    (* Erased call to spill *)
    seed <- s_seed;
    k <- 0;
    while ((k < 32)) {
      trace__poly_getnoise <-
      (trace__poly_getnoise ++ [(Assert, ((0 <= k) /\ ((k + 1) <= 32)))]);
      c <- (BArray32.get8 seed k);
      trace__poly_getnoise <-
      (trace__poly_getnoise ++ [(Assert, ((0 <= k) /\ ((k + 1) <= 33)))]);
      b_extseed <- (BArray33.set8d b_extseed k (W8.of_int 255));
      extseed <- (BArray33.set8 extseed k c);
      k <- (k + 1);
    }
    b_extseed <- (BArray33.set8d b_extseed 32 (W8.of_int 255));
    extseed <- (BArray33.set8 extseed 32 nonce);
    b_param_0 <- b_buf;
    param_0 <- buf;
    b_param <- b_extseed;
    param <- extseed;
    (result, b_result, tmp__trace) <@ _shake256_128_33 (param_0, b_param_0,
    param, b_param);
    trace__poly_getnoise <- (trace__poly_getnoise ++ tmp__trace);
    trace__poly_getnoise <-
    (trace__poly_getnoise ++ [(Assert, (BArray128.is_init b_result 0 128))]);
    buf <- result;
    (* Erased call to unspill *)
    i <- 0;
    while ((i < 128)) {
      trace__poly_getnoise <-
      (trace__poly_getnoise ++ [(Assert, ((0 <= i) /\ ((i + 1) <= 128)))]);
      c <- (BArray128.get8 buf i);
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
      trace__poly_getnoise <-
      (trace__poly_getnoise ++
      [(Assert, ((0 <= (2 * i)) /\ ((2 * i) <= 18446744073709551615)))]);
      trace__poly_getnoise <-
      (trace__poly_getnoise ++
      [(Assert, ((0 <= ((2 * i) * 2)) /\ ((((2 * i) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp ((2 * i) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp (2 * i) t);
      a <- c;
      a <- (a `>>` (W8.of_int 4));
      a <- (a `&` (W8.of_int 3));
      b <- (c `>>` (W8.of_int 6));
      b <- (b `&` (W8.of_int 3));
      a <- (a - b);
      t <- (sigextu16 a);
      trace__poly_getnoise <-
      (trace__poly_getnoise ++
      [(Assert, ((0 <= (2 * i)) /\ ((2 * i) <= 18446744073709551615)))]);
      trace__poly_getnoise <-
      (trace__poly_getnoise ++
      [(Assert,
       ((0 <= ((2 * i) + 1)) /\ (((2 * i) + 1) <= 18446744073709551615)))]);
      trace__poly_getnoise <-
      (trace__poly_getnoise ++
      [(Assert,
       ((0 <= (((2 * i) + 1) * 2)) /\ (((((2 * i) + 1) * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (((2 * i) + 1) * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp ((2 * i) + 1) t);
      trace__poly_getnoise <-
      (trace__poly_getnoise ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
    }
    return (rp, b_rp, trace__poly_getnoise);
  }
  proc _poly_invntt (rp:BArray512.t, b_rp:BArray512.t) : BArray512.t *
                                                         BArray512.t * trace = {
    var zetasp:BArray256.t;
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
    var param:W16.t;
    var result:W16.t;
    var param_0:W16.t;
    var param_1:W16.t;
    var result_0:W16.t;
    var param_2:W16.t;
    var param_3:W16.t;
    var result_1:W16.t;
    var trace__poly_invntt:trace;
    zetasp <- witness;
    trace__poly_invntt <- [];
    trace__poly_invntt <-
    (trace__poly_invntt ++ [(Assert, (BArray512.is_init b_rp 0 512))]);
    zetasp <- jzetas_inv;
    zetasctr <- (W64.of_int 0);
    len <- 2;
    while ((len <= 128)) {
      start <- 0;
      while ((start < 256)) {
        trace__poly_invntt <-
        (trace__poly_invntt ++
        [(Assert,
         ((0 <= ((W64.to_uint zetasctr) * 2)) /\
         ((((W64.to_uint zetasctr) * 2) + 2) <= 256)))]);
        zeta_0 <- (BArray256.get16 zetasp (W64.to_uint zetasctr));
        zetasctr <- (zetasctr + (W64.of_int 1));
        j <- start;
        cmp <- start;
        trace__poly_invntt <-
        (trace__poly_invntt ++
        [(Assert,
         ((0 <= (cmp + len)) /\ ((cmp + len) <= 18446744073709551615)))]);
        cmp <- (cmp + len);
        while ((j < cmp)) {
          trace__poly_invntt <-
          (trace__poly_invntt ++
          [(Assert, ((0 <= (j * 2)) /\ (((j * 2) + 2) <= 512)))]);
          t <- (BArray512.get16 rp j);
          offset <- j;
          trace__poly_invntt <-
          (trace__poly_invntt ++
          [(Assert,
           ((0 <= (offset + len)) /\
           ((offset + len) <= 18446744073709551615)))]);
          offset <- (offset + len);
          trace__poly_invntt <-
          (trace__poly_invntt ++
          [(Assert, ((0 <= (offset * 2)) /\ (((offset * 2) + 2) <= 512)))]);
          s <- (BArray512.get16 rp offset);
          m <- s;
          m <- (m + t);
          param <- m;
          (result, tmp__trace) <@ __barrett_reduce (param);
          trace__poly_invntt <- (trace__poly_invntt ++ tmp__trace);
          m <- result;
          trace__poly_invntt <-
          (trace__poly_invntt ++
          [(Assert, ((0 <= (j * 2)) /\ (((j * 2) + 2) <= 512)))]);
          rp <- (BArray512.set16 rp j m);
          t <- (t - s);
          param_1 <- t;
          param_0 <- zeta_0;
          (result_0, tmp__trace) <@ __fqmul (param_1, param_0);
          trace__poly_invntt <- (trace__poly_invntt ++ tmp__trace);
          t <- result_0;
          trace__poly_invntt <-
          (trace__poly_invntt ++
          [(Assert, ((0 <= (offset * 2)) /\ (((offset * 2) + 2) <= 512)))]);
          rp <- (BArray512.set16 rp offset t);
          trace__poly_invntt <-
          (trace__poly_invntt ++
          [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
          j <- (j + 1);
        }
        start <- j;
        trace__poly_invntt <-
        (trace__poly_invntt ++
        [(Assert,
         ((0 <= (start + len)) /\ ((start + len) <= 18446744073709551615)))]);
        start <- (start + len);
      }
      trace__poly_invntt <-
      (trace__poly_invntt ++
      [(Assert,
       ((0 <= (len `<<` 1)) /\ ((len `<<` 1) <= 18446744073709551615)))]);
      len <- (len `<<` 1);
    }
    zeta_0 <- (BArray256.get16 zetasp 127);
    j <- 0;
    while ((j < 256)) {
      trace__poly_invntt <-
      (trace__poly_invntt ++
      [(Assert, ((0 <= (j * 2)) /\ (((j * 2) + 2) <= 512)))]);
      t <- (BArray512.get16 rp j);
      param_3 <- t;
      param_2 <- zeta_0;
      (result_1, tmp__trace) <@ __fqmul (param_3, param_2);
      trace__poly_invntt <- (trace__poly_invntt ++ tmp__trace);
      t <- result_1;
      trace__poly_invntt <-
      (trace__poly_invntt ++
      [(Assert, ((0 <= (j * 2)) /\ (((j * 2) + 2) <= 512)))]);
      rp <- (BArray512.set16 rp j t);
      trace__poly_invntt <-
      (trace__poly_invntt ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
    }
    b_rp <- (BArray512.init_arr (W8.of_int 255));
    return (rp, b_rp, trace__poly_invntt);
  }
  proc _poly_ntt (rp:BArray512.t, b_rp:BArray512.t) : BArray512.t *
                                                      BArray512.t * trace = {
    var aux:BArray512.t;
    var aux_0:BArray512.t;
    var zetasp:BArray256.t;
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
    var param:W16.t;
    var param_0:W16.t;
    var result:W16.t;
    var param_1:BArray512.t;
    var result_0:BArray512.t;
    var b_result:BArray512.t;
    var trace__poly_ntt:trace;
    b_result <- witness;
    param_1 <- witness;
    result_0 <- witness;
    zetasp <- witness;
    trace__poly_ntt <- [];
    trace__poly_ntt <-
    (trace__poly_ntt ++ [(Assert, (BArray512.is_init b_rp 0 512))]);
    zetasp <- jzetas;
    zetasctr <- 0;
    len <- 128;
    while ((2 <= len)) {
      start <- 0;
      while ((start < 256)) {
        trace__poly_ntt <-
        (trace__poly_ntt ++
        [(Assert,
         ((0 <= (zetasctr + 1)) /\ ((zetasctr + 1) <= 18446744073709551615)))]);
        zetasctr <- (zetasctr + 1);
        trace__poly_ntt <-
        (trace__poly_ntt ++
        [(Assert, ((0 <= (zetasctr * 2)) /\ (((zetasctr * 2) + 2) <= 256)))]);
        zeta_0 <- (BArray256.get16 zetasp zetasctr);
        j <- start;
        cmp <- start;
        trace__poly_ntt <-
        (trace__poly_ntt ++
        [(Assert,
         ((0 <= (cmp + len)) /\ ((cmp + len) <= 18446744073709551615)))]);
        cmp <- (cmp + len);
        while ((j < cmp)) {
          trace__poly_ntt <-
          (trace__poly_ntt ++
          [(Assert, ((0 <= (j * 2)) /\ (((j * 2) + 2) <= 512)))]);
          s <- (BArray512.get16 rp j);
          m <- s;
          offset <- j;
          trace__poly_ntt <-
          (trace__poly_ntt ++
          [(Assert,
           ((0 <= (offset + len)) /\
           ((offset + len) <= 18446744073709551615)))]);
          offset <- (offset + len);
          trace__poly_ntt <-
          (trace__poly_ntt ++
          [(Assert, ((0 <= (offset * 2)) /\ (((offset * 2) + 2) <= 512)))]);
          t <- (BArray512.get16 rp offset);
          param_0 <- t;
          param <- zeta_0;
          (result, tmp__trace) <@ __fqmul (param_0, param);
          trace__poly_ntt <- (trace__poly_ntt ++ tmp__trace);
          t <- result;
          m <- (m - t);
          t <- (t + s);
          trace__poly_ntt <-
          (trace__poly_ntt ++
          [(Assert, ((0 <= (offset * 2)) /\ (((offset * 2) + 2) <= 512)))]);
          rp <- (BArray512.set16 rp offset m);
          trace__poly_ntt <-
          (trace__poly_ntt ++
          [(Assert, ((0 <= (j * 2)) /\ (((j * 2) + 2) <= 512)))]);
          rp <- (BArray512.set16 rp j t);
          trace__poly_ntt <-
          (trace__poly_ntt ++
          [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
          j <- (j + 1);
        }
        start <- j;
        trace__poly_ntt <-
        (trace__poly_ntt ++
        [(Assert,
         ((0 <= (start + len)) /\ ((start + len) <= 18446744073709551615)))]);
        start <- (start + len);
      }
      len <- (len `|>>` 1);
    }
    param_1 <- rp;
    (aux, aux_0, tmp__trace) <@ __poly_reduce (param_1,
    (BArray512.init_arr (W8.of_int 255)));
    result_0 <- aux;
    b_result <- aux_0;
    trace__poly_ntt <- (trace__poly_ntt ++ tmp__trace);
    trace__poly_ntt <-
    (trace__poly_ntt ++ [(Assert, (BArray512.is_init b_result 0 512))]);
    rp <- result_0;
    b_rp <- (BArray512.init_arr (W8.of_int 255));
    return (rp, b_rp, trace__poly_ntt);
  }
  proc _poly_sub (rp:BArray512.t, b_rp:BArray512.t, ap:BArray512.t,
                  b_ap:BArray512.t, bp:BArray512.t, b_bp:BArray512.t) : 
  BArray512.t * BArray512.t * trace = {
    var a:W16.t;
    var b:W16.t;
    var r:W16.t;
    var i:int;
    var trace__poly_sub:trace;
    trace__poly_sub <- [];
    trace__poly_sub <-
    (trace__poly_sub ++
    [(Assert,
     ((BArray512.is_init b_ap 0 512) /\ (BArray512.is_init b_bp 0 512)))]);
    i <- 0;
    while ((i < 256)) {
      trace__poly_sub <-
      (trace__poly_sub ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      a <- (BArray512.get16 ap i);
      trace__poly_sub <-
      (trace__poly_sub ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      b <- (BArray512.get16 bp i);
      r <- (a - b);
      trace__poly_sub <-
      (trace__poly_sub ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      b_rp <- (BArray512.set16d b_rp (i * 2) (W16.of_int 65535));
      rp <- (BArray512.set16 rp i r);
      trace__poly_sub <-
      (trace__poly_sub ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
    }
    return (rp, b_rp, trace__poly_sub);
  }
  proc _poly_tobytes (rp:BArray384.t, b_rp:BArray384.t, a:BArray512.t,
                      b_a:BArray512.t) : BArray384.t * BArray384.t *
                                         BArray512.t * BArray512.t * trace = {
    var aux:BArray512.t;
    var aux_0:BArray512.t;
    var t0:W16.t;
    var t1:W16.t;
    var d:W16.t;
    var j:int;
    var i:int;
    var param:BArray512.t;
    var result:BArray512.t;
    var b_result:BArray512.t;
    var trace__poly_tobytes:trace;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace__poly_tobytes <- [];
    trace__poly_tobytes <-
    (trace__poly_tobytes ++ [(Assert, (BArray512.is_init b_a 0 512))]);
    param <- a;
    (aux, aux_0, tmp__trace) <@ _poly_csubq (param,
    (BArray512.init_arr (W8.of_int 255)));
    result <- aux;
    b_result <- aux_0;
    trace__poly_tobytes <- (trace__poly_tobytes ++ tmp__trace);
    trace__poly_tobytes <-
    (trace__poly_tobytes ++ [(Assert, (BArray512.is_init b_result 0 512))]);
    a <- result;
    j <- 0;
    i <- 0;
    while ((i < 256)) {
      trace__poly_tobytes <-
      (trace__poly_tobytes ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 512)))]);
      t0 <- (BArray512.get16 a i);
      trace__poly_tobytes <-
      (trace__poly_tobytes ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      trace__poly_tobytes <-
      (trace__poly_tobytes ++
      [(Assert, ((0 <= ((i + 1) * 2)) /\ ((((i + 1) * 2) + 2) <= 512)))]);
      t1 <- (BArray512.get16 a (i + 1));
      d <- t0;
      d <- (d `&` (W16.of_int 255));
      trace__poly_tobytes <-
      (trace__poly_tobytes ++ [(Assert, ((0 <= j) /\ ((j + 1) <= 384)))]);
      b_rp <- (BArray384.set8d b_rp j (W8.of_int 255));
      rp <- (BArray384.set8d rp j (truncateu8 d));
      trace__poly_tobytes <-
      (trace__poly_tobytes ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      t0 <- (t0 `>>` (W8.of_int 8));
      t0 <- (t0 `&` (W16.of_int 15));
      d <- t1;
      d <- (d `&` (W16.of_int 15));
      d <- (d `<<` (W8.of_int 4));
      d <- (d `|` t0);
      trace__poly_tobytes <-
      (trace__poly_tobytes ++ [(Assert, ((0 <= j) /\ ((j + 1) <= 384)))]);
      b_rp <- (BArray384.set8d b_rp j (W8.of_int 255));
      rp <- (BArray384.set8d rp j (truncateu8 d));
      trace__poly_tobytes <-
      (trace__poly_tobytes ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      t1 <- (t1 `>>` (W8.of_int 4));
      trace__poly_tobytes <-
      (trace__poly_tobytes ++ [(Assert, ((0 <= j) /\ ((j + 1) <= 384)))]);
      b_rp <- (BArray384.set8d b_rp j (W8.of_int 255));
      rp <- (BArray384.set8d rp j (truncateu8 t1));
      trace__poly_tobytes <-
      (trace__poly_tobytes ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace__poly_tobytes <-
      (trace__poly_tobytes ++
      [(Assert, ((0 <= (i + 2)) /\ ((i + 2) <= 18446744073709551615)))]);
      i <- (i + 2);
    }
    b_a <- (BArray512.init_arr (W8.of_int 255));
    return (rp, b_rp, a, b_a, trace__poly_tobytes);
  }
  proc _i_poly_tomsg (rp:BArray32.t, b_rp:BArray32.t, a:BArray512.t,
                      b_a:BArray512.t) : BArray32.t * BArray32.t *
                                         BArray512.t * BArray512.t * trace = {
    var aux:BArray512.t;
    var aux_0:BArray512.t;
    var r:W8.t;
    var j:int;
    var i:int;
    var t:W16.t;
    var d:W32.t;
    var param:BArray512.t;
    var result:BArray512.t;
    var b_result:BArray512.t;
    var trace__i_poly_tomsg:trace;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace__i_poly_tomsg <- [];
    trace__i_poly_tomsg <-
    (trace__i_poly_tomsg ++ [(Assert, (BArray512.is_init b_a 0 512))]);
    param <- a;
    (aux, aux_0, tmp__trace) <@ _poly_csubq (param,
    (BArray512.init_arr (W8.of_int 255)));
    result <- aux;
    b_result <- aux_0;
    trace__i_poly_tomsg <- (trace__i_poly_tomsg ++ tmp__trace);
    trace__i_poly_tomsg <-
    (trace__i_poly_tomsg ++ [(Assert, (BArray512.is_init b_result 0 512))]);
    a <- result;
    i <- 0;
    while ((i < 32)) {
      r <- (W8.of_int 0);
      j <- 0;
      while ((j < 8)) {
        trace__i_poly_tomsg <-
        (trace__i_poly_tomsg ++
        [(Assert,
         ((0 <= (((8 * i) + j) * 2)) /\ (((((8 * i) + j) * 2) + 2) <= 512)))]);
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
      trace__i_poly_tomsg <-
      (trace__i_poly_tomsg ++ [(Assert, ((0 <= i) /\ ((i + 1) <= 32)))]);
      b_rp <- (BArray32.set8d b_rp i (W8.of_int 255));
      rp <- (BArray32.set8 rp i r);
      i <- (i + 1);
    }
    b_a <- (BArray512.init_arr (W8.of_int 255));
    return (rp, b_rp, a, b_a, trace__i_poly_tomsg);
  }
  proc _i_poly_compress (rp:BArray160.t, b_rp:BArray160.t, a:BArray512.t,
                         b_a:BArray512.t) : BArray160.t * BArray160.t *
                                            BArray512.t * BArray512.t * trace = {
    var aux:BArray512.t;
    var aux_0:BArray512.t;
    var j:int;
    var u:W16.t;
    var d0:W32.t;
    var t:BArray8.t;
    var c0:W8.t;
    var c1:W8.t;
    var c2:W8.t;
    var k:int;
    var i:int;
    var param:BArray512.t;
    var result:BArray512.t;
    var b_t:BArray8.t;
    var b_result:BArray512.t;
    var trace__i_poly_compress:trace;
    b_result <- witness;
    b_t <- witness;
    param <- witness;
    result <- witness;
    t <- witness;
    trace__i_poly_compress <- [];
    trace__i_poly_compress <-
    (trace__i_poly_compress ++ [(Assert, (BArray512.is_init b_a 0 512))]);
    b_t <- (BArray8.init_arr (W8.of_int 0));
    param <- a;
    (aux, aux_0, tmp__trace) <@ _poly_csubq (param,
    (BArray512.init_arr (W8.of_int 255)));
    result <- aux;
    b_result <- aux_0;
    trace__i_poly_compress <- (trace__i_poly_compress ++ tmp__trace);
    trace__i_poly_compress <-
    (trace__i_poly_compress ++
    [(Assert, (BArray512.is_init b_result 0 512))]);
    a <- result;
    k <- 0;
    i <- 0;
    while ((i < 256)) {
      j <- 0;
      while ((j < 8)) {
        trace__i_poly_compress <-
        (trace__i_poly_compress ++
        [(Assert, ((0 <= j) /\ (j <= 18446744073709551615)))]);
        trace__i_poly_compress <-
        (trace__i_poly_compress ++
        [(Assert, ((0 <= (i + j)) /\ ((i + j) <= 18446744073709551615)))]);
        trace__i_poly_compress <-
        (trace__i_poly_compress ++
        [(Assert, ((0 <= ((i + j) * 2)) /\ ((((i + j) * 2) + 2) <= 512)))]);
        u <- (BArray512.get16 a (i + j));
        d0 <- (zeroextu32 u);
        d0 <- (d0 `<<` (W8.of_int 5));
        d0 <- (d0 + (W32.of_int 1664));
        d0 <- (d0 * (W32.of_int 40318));
        d0 <- (d0 `>>` (W8.of_int 27));
        d0 <- (d0 `&` (W32.of_int 31));
        trace__i_poly_compress <-
        (trace__i_poly_compress ++ [(Assert, ((0 <= j) /\ ((j + 1) <= 8)))]);
        b_t <- (BArray8.set8d b_t j (W8.of_int 255));
        t <- (BArray8.set8 t j (truncateu8 d0));
        j <- (j + 1);
      }
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 0 1))]);
      c0 <- (BArray8.get8 t 0);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 1 1))]);
      c1 <- (BArray8.get8 t 1);
      c1 <- (c1 `<<` (W8.of_int 5));
      c0 <- (c0 `|` c1);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, ((0 <= k) /\ ((k + 1) <= 160)))]);
      b_rp <- (BArray160.set8d b_rp k (W8.of_int 255));
      rp <- (BArray160.set8 rp k c0);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 1 1))]);
      c0 <- (BArray8.get8 t 1);
      c0 <- (c0 `>>` (W8.of_int 3));
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 2 1))]);
      c1 <- (BArray8.get8 t 2);
      c1 <- (c1 `<<` (W8.of_int 2));
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 3 1))]);
      c2 <- (BArray8.get8 t 3);
      c2 <- (c2 `<<` (W8.of_int 7));
      c0 <- (c0 `|` c1);
      c0 <- (c0 `|` c2);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++
      [(Assert, ((0 <= (k + 1)) /\ ((k + 1) <= 18446744073709551615)))]);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++
      [(Assert, ((0 <= (k + 1)) /\ (((k + 1) + 1) <= 160)))]);
      b_rp <- (BArray160.set8d b_rp (k + 1) (W8.of_int 255));
      rp <- (BArray160.set8 rp (k + 1) c0);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 3 1))]);
      c0 <- (BArray8.get8 t 3);
      c0 <- (c0 `>>` (W8.of_int 1));
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 4 1))]);
      c1 <- (BArray8.get8 t 4);
      c1 <- (c1 `<<` (W8.of_int 4));
      c0 <- (c0 `|` c1);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++
      [(Assert, ((0 <= (k + 2)) /\ ((k + 2) <= 18446744073709551615)))]);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++
      [(Assert, ((0 <= (k + 2)) /\ (((k + 2) + 1) <= 160)))]);
      b_rp <- (BArray160.set8d b_rp (k + 2) (W8.of_int 255));
      rp <- (BArray160.set8 rp (k + 2) c0);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 4 1))]);
      c0 <- (BArray8.get8 t 4);
      c0 <- (c0 `>>` (W8.of_int 4));
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 5 1))]);
      c1 <- (BArray8.get8 t 5);
      c1 <- (c1 `<<` (W8.of_int 1));
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 6 1))]);
      c2 <- (BArray8.get8 t 6);
      c2 <- (c2 `<<` (W8.of_int 6));
      c0 <- (c0 `|` c1);
      c0 <- (c0 `|` c2);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++
      [(Assert, ((0 <= (k + 3)) /\ ((k + 3) <= 18446744073709551615)))]);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++
      [(Assert, ((0 <= (k + 3)) /\ (((k + 3) + 1) <= 160)))]);
      b_rp <- (BArray160.set8d b_rp (k + 3) (W8.of_int 255));
      rp <- (BArray160.set8 rp (k + 3) c0);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 6 1))]);
      c0 <- (BArray8.get8 t 6);
      c0 <- (c0 `>>` (W8.of_int 2));
      trace__i_poly_compress <-
      (trace__i_poly_compress ++ [(Assert, (BArray8.is_init b_t 7 1))]);
      c1 <- (BArray8.get8 t 7);
      c1 <- (c1 `<<` (W8.of_int 3));
      c0 <- (c0 `|` c1);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++
      [(Assert, ((0 <= (k + 4)) /\ ((k + 4) <= 18446744073709551615)))]);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++
      [(Assert, ((0 <= (k + 4)) /\ (((k + 4) + 1) <= 160)))]);
      b_rp <- (BArray160.set8d b_rp (k + 4) (W8.of_int 255));
      rp <- (BArray160.set8 rp (k + 4) c0);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++
      [(Assert, ((0 <= (k + 5)) /\ ((k + 5) <= 18446744073709551615)))]);
      k <- (k + 5);
      trace__i_poly_compress <-
      (trace__i_poly_compress ++
      [(Assert, ((0 <= (i + 8)) /\ ((i + 8) <= 18446744073709551615)))]);
      i <- (i + 8);
    }
    b_a <- (BArray512.init_arr (W8.of_int 255));
    return (rp, b_rp, a, b_a, trace__i_poly_compress);
  }
  proc _i_poly_decompress (rp:BArray512.t, b_rp:BArray512.t, ap:BArray160.t,
                           b_ap:BArray160.t) : BArray512.t * BArray512.t *
                                               trace = {
    var c0:W8.t;
    var t:BArray8.t;
    var c1:W8.t;
    var c2:W8.t;
    var k:int;
    var d0:W32.t;
    var j:int;
    var i:int;
    var b_t:BArray8.t;
    var trace__i_poly_decompress:trace;
    b_t <- witness;
    t <- witness;
    trace__i_poly_decompress <- [];
    trace__i_poly_decompress <-
    (trace__i_poly_decompress ++ [(Assert, (BArray160.is_init b_ap 0 160))]);
    b_t <- (BArray8.init_arr (W8.of_int 0));
    j <- 0;
    i <- 0;
    while ((i < 256)) {
      trace__i_poly_decompress <-
      (trace__i_poly_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 160)))]);
      c0 <- (BArray160.get8 ap j);
      b_t <- (BArray8.set8d b_t 0 (W8.of_int 255));
      t <- (BArray8.set8 t 0 c0);
      trace__i_poly_decompress <-
      (trace__i_poly_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      c0 <- (c0 `>>` (W8.of_int 5));
      trace__i_poly_decompress <-
      (trace__i_poly_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 160)))]);
      c1 <- (BArray160.get8 ap j);
      c2 <- c1;
      c1 <- (c1 `<<` (W8.of_int 3));
      c0 <- (c0 `|` c1);
      b_t <- (BArray8.set8d b_t 1 (W8.of_int 255));
      t <- (BArray8.set8 t 1 c0);
      trace__i_poly_decompress <-
      (trace__i_poly_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      c1 <- c2;
      c1 <- (c1 `>>` (W8.of_int 2));
      b_t <- (BArray8.set8d b_t 2 (W8.of_int 255));
      t <- (BArray8.set8 t 2 c1);
      c1 <- (c1 `>>` (W8.of_int 5));
      trace__i_poly_decompress <-
      (trace__i_poly_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 160)))]);
      c0 <- (BArray160.get8 ap j);
      c2 <- c0;
      c0 <- (c0 `<<` (W8.of_int 1));
      c0 <- (c0 `|` c1);
      b_t <- (BArray8.set8d b_t 3 (W8.of_int 255));
      t <- (BArray8.set8 t 3 c0);
      trace__i_poly_decompress <-
      (trace__i_poly_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      c1 <- c2;
      c1 <- (c1 `>>` (W8.of_int 4));
      trace__i_poly_decompress <-
      (trace__i_poly_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 160)))]);
      c0 <- (BArray160.get8 ap j);
      c2 <- c0;
      c0 <- (c0 `<<` (W8.of_int 4));
      c0 <- (c0 `|` c1);
      b_t <- (BArray8.set8d b_t 4 (W8.of_int 255));
      t <- (BArray8.set8 t 4 c0);
      trace__i_poly_decompress <-
      (trace__i_poly_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      c1 <- c2;
      c1 <- (c1 `>>` (W8.of_int 1));
      b_t <- (BArray8.set8d b_t 5 (W8.of_int 255));
      t <- (BArray8.set8 t 5 c1);
      c1 <- (c1 `>>` (W8.of_int 5));
      trace__i_poly_decompress <-
      (trace__i_poly_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 160)))]);
      c0 <- (BArray160.get8 ap j);
      c2 <- c0;
      c0 <- (c0 `<<` (W8.of_int 2));
      c0 <- (c0 `|` c1);
      b_t <- (BArray8.set8d b_t 6 (W8.of_int 255));
      t <- (BArray8.set8 t 6 c0);
      trace__i_poly_decompress <-
      (trace__i_poly_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      c2 <- (c2 `>>` (W8.of_int 3));
      b_t <- (BArray8.set8d b_t 7 (W8.of_int 255));
      t <- (BArray8.set8 t 7 c2);
      k <- 0;
      while ((k < 8)) {
        trace__i_poly_decompress <-
        (trace__i_poly_decompress ++
        [(Assert, ((0 <= k) /\ ((k + 1) <= 8)))]);
        trace__i_poly_decompress <-
        (trace__i_poly_decompress ++ [(Assert, (BArray8.is_init b_t k 1))]);
        d0 <- (zeroextu32 (BArray8.get8 t k));
        d0 <- (d0 `&` (W32.of_int 31));
        d0 <- (d0 * (W32.of_int 3329));
        d0 <- (d0 + (W32.of_int 16));
        d0 <- (d0 `>>` (W8.of_int 5));
        trace__i_poly_decompress <-
        (trace__i_poly_decompress ++
        [(Assert, ((0 <= k) /\ (k <= 18446744073709551615)))]);
        trace__i_poly_decompress <-
        (trace__i_poly_decompress ++
        [(Assert, ((0 <= (i + k)) /\ ((i + k) <= 18446744073709551615)))]);
        trace__i_poly_decompress <-
        (trace__i_poly_decompress ++
        [(Assert, ((0 <= ((i + k) * 2)) /\ ((((i + k) * 2) + 2) <= 512)))]);
        b_rp <- (BArray512.set16d b_rp ((i + k) * 2) (W16.of_int 65535));
        rp <- (BArray512.set16 rp (i + k) (truncateu16 d0));
        k <- (k + 1);
      }
      trace__i_poly_decompress <-
      (trace__i_poly_decompress ++
      [(Assert, ((0 <= (i + 8)) /\ ((i + 8) <= 18446744073709551615)))]);
      i <- (i + 8);
    }
    return (rp, b_rp, trace__i_poly_decompress);
  }
  proc __polyvec_add2 (r:BArray2048.t, b_r:BArray2048.t, b:BArray2048.t,
                       b_b:BArray2048.t) : BArray2048.t * BArray2048.t *
                                           trace = {
    var aux:BArray512.t;
    var aux_0:BArray512.t;
    var i:int;
    var param:BArray512.t;
    var param_0:BArray512.t;
    var result:BArray512.t;
    var b_result:BArray512.t;
    var b_param:BArray512.t;
    var b_param_0:BArray512.t;
    var trace___polyvec_add2:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    param <- witness;
    param_0 <- witness;
    result <- witness;
    trace___polyvec_add2 <- [];
    trace___polyvec_add2 <-
    (trace___polyvec_add2 ++ [(Assert, (BArray2048.is_init b_r 0 2048))]);
    trace___polyvec_add2 <-
    (trace___polyvec_add2 ++ [(Assert, (BArray2048.is_init b_b 0 2048))]);
    i <- 0;
    while ((i < 4)) {
      trace___polyvec_add2 <-
      (trace___polyvec_add2 ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      trace___polyvec_add2 <-
      (trace___polyvec_add2 ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      trace___polyvec_add2 <-
      (trace___polyvec_add2 ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      b_param_0 <- (SBArray2048_512.get_sub16 b_r (256 * i));
      param_0 <- (SBArray2048_512.get_sub16 r (256 * i));
      b_param <- (SBArray2048_512.get_sub16 b_b (256 * i));
      param <- (SBArray2048_512.get_sub16 b (256 * i));
      (aux, aux_0, tmp__trace) <@ _poly_add2 (param_0, b_param_0, param,
      b_param);
      result <- aux;
      b_result <- aux_0;
      trace___polyvec_add2 <- (trace___polyvec_add2 ++ tmp__trace);
      trace___polyvec_add2 <-
      (trace___polyvec_add2 ++
      [(Assert, (BArray512.is_init b_result 0 512))]);
      b_r <-
      (SBArray2048_512.set_sub16 b_r (256 * i)
      (BArray512.init_arr (W8.of_int 255)));
      r <- (SBArray2048_512.set_sub16 r (256 * i) result);
      i <- (i + 1);
    }
    b_r <- (BArray2048.init_arr (W8.of_int 255));
    return (r, b_r, trace___polyvec_add2);
  }
  proc __polyvec_csubq (r:BArray2048.t, b_r:BArray2048.t) : BArray2048.t *
                                                            BArray2048.t *
                                                            trace = {
    var aux:BArray512.t;
    var aux_0:BArray512.t;
    var i:int;
    var param:BArray512.t;
    var result:BArray512.t;
    var b_result:BArray512.t;
    var b_param:BArray512.t;
    var trace___polyvec_csubq:trace;
    b_param <- witness;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace___polyvec_csubq <- [];
    trace___polyvec_csubq <-
    (trace___polyvec_csubq ++ [(Assert, (BArray2048.is_init b_r 0 2048))]);
    i <- 0;
    while ((i < 4)) {
      trace___polyvec_csubq <-
      (trace___polyvec_csubq ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      trace___polyvec_csubq <-
      (trace___polyvec_csubq ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      b_param <- (SBArray2048_512.get_sub16 b_r (256 * i));
      param <- (SBArray2048_512.get_sub16 r (256 * i));
      (aux, aux_0, tmp__trace) <@ _poly_csubq (param, b_param);
      result <- aux;
      b_result <- aux_0;
      trace___polyvec_csubq <- (trace___polyvec_csubq ++ tmp__trace);
      trace___polyvec_csubq <-
      (trace___polyvec_csubq ++
      [(Assert, (BArray512.is_init b_result 0 512))]);
      b_r <-
      (SBArray2048_512.set_sub16 b_r (256 * i)
      (BArray512.init_arr (W8.of_int 255)));
      r <- (SBArray2048_512.set_sub16 r (256 * i) result);
      i <- (i + 1);
    }
    b_r <- (BArray2048.init_arr (W8.of_int 255));
    return (r, b_r, trace___polyvec_csubq);
  }
  proc __i_polyvec_frombytes (ap:BArray1536.t, b_ap:BArray1536.t) : BArray2048.t *
                                                                    BArray2048.t *
                                                                    trace = {
    var aux:BArray512.t;
    var aux_0:BArray512.t;
    var r:BArray2048.t;
    var i:int;
    var param:BArray384.t;
    var param_0:BArray512.t;
    var result:BArray512.t;
    var b_r:BArray2048.t;
    var b_result:BArray512.t;
    var b_param:BArray384.t;
    var b_param_0:BArray512.t;
    var trace___i_polyvec_frombytes:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_r <- witness;
    b_result <- witness;
    param <- witness;
    param_0 <- witness;
    r <- witness;
    result <- witness;
    trace___i_polyvec_frombytes <- [];
    trace___i_polyvec_frombytes <-
    (trace___i_polyvec_frombytes ++
    [(Assert, (BArray1536.is_init b_ap 0 1536))]);
    b_r <- (BArray2048.init_arr (W8.of_int 0));
    i <- 0;
    while ((i < 4)) {
      trace___i_polyvec_frombytes <-
      (trace___i_polyvec_frombytes ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      trace___i_polyvec_frombytes <-
      (trace___i_polyvec_frombytes ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      trace___i_polyvec_frombytes <-
      (trace___i_polyvec_frombytes ++
      [(Assert, ((0 <= (384 * i)) /\ (((384 * i) + 384) <= 1536)))]);
      b_param_0 <- (SBArray2048_512.get_sub16 b_r (256 * i));
      param_0 <- (SBArray2048_512.get_sub16 r (256 * i));
      b_param <- (SBArray1536_384.get_sub8 b_ap (384 * i));
      param <- (SBArray1536_384.get_sub8 ap (384 * i));
      (aux, aux_0, tmp__trace) <@ _poly_frombytes (param_0, b_param_0, 
      param, b_param);
      result <- aux;
      b_result <- aux_0;
      trace___i_polyvec_frombytes <-
      (trace___i_polyvec_frombytes ++ tmp__trace);
      trace___i_polyvec_frombytes <-
      (trace___i_polyvec_frombytes ++
      [(Assert, (BArray512.is_init b_result 0 512))]);
      b_r <-
      (SBArray2048_512.set_sub16 b_r (256 * i)
      (BArray512.init_arr (W8.of_int 255)));
      r <- (SBArray2048_512.set_sub16 r (256 * i) result);
      i <- (i + 1);
    }
    return (r, b_r, trace___i_polyvec_frombytes);
  }
  proc __polyvec_invntt (r:BArray2048.t, b_r:BArray2048.t) : BArray2048.t *
                                                             BArray2048.t *
                                                             trace = {
    var aux:BArray512.t;
    var aux_0:BArray512.t;
    var i:int;
    var param:BArray512.t;
    var result:BArray512.t;
    var b_result:BArray512.t;
    var b_param:BArray512.t;
    var trace___polyvec_invntt:trace;
    b_param <- witness;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace___polyvec_invntt <- [];
    trace___polyvec_invntt <-
    (trace___polyvec_invntt ++ [(Assert, (BArray2048.is_init b_r 0 2048))]);
    i <- 0;
    while ((i < 4)) {
      trace___polyvec_invntt <-
      (trace___polyvec_invntt ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      trace___polyvec_invntt <-
      (trace___polyvec_invntt ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      b_param <- (SBArray2048_512.get_sub16 b_r (256 * i));
      param <- (SBArray2048_512.get_sub16 r (256 * i));
      (aux, aux_0, tmp__trace) <@ _poly_invntt (param, b_param);
      result <- aux;
      b_result <- aux_0;
      trace___polyvec_invntt <- (trace___polyvec_invntt ++ tmp__trace);
      trace___polyvec_invntt <-
      (trace___polyvec_invntt ++
      [(Assert, (BArray512.is_init b_result 0 512))]);
      b_r <-
      (SBArray2048_512.set_sub16 b_r (256 * i)
      (BArray512.init_arr (W8.of_int 255)));
      r <- (SBArray2048_512.set_sub16 r (256 * i) result);
      i <- (i + 1);
    }
    b_r <- (BArray2048.init_arr (W8.of_int 255));
    return (r, b_r, trace___polyvec_invntt);
  }
  proc __polyvec_ntt (r:BArray2048.t, b_r:BArray2048.t) : BArray2048.t *
                                                          BArray2048.t *
                                                          trace = {
    var aux:BArray512.t;
    var aux_0:BArray512.t;
    var i:int;
    var param:BArray512.t;
    var result:BArray512.t;
    var b_result:BArray512.t;
    var b_param:BArray512.t;
    var trace___polyvec_ntt:trace;
    b_param <- witness;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace___polyvec_ntt <- [];
    trace___polyvec_ntt <-
    (trace___polyvec_ntt ++ [(Assert, (BArray2048.is_init b_r 0 2048))]);
    i <- 0;
    while ((i < 4)) {
      trace___polyvec_ntt <-
      (trace___polyvec_ntt ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      trace___polyvec_ntt <-
      (trace___polyvec_ntt ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      b_param <- (SBArray2048_512.get_sub16 b_r (256 * i));
      param <- (SBArray2048_512.get_sub16 r (256 * i));
      (aux, aux_0, tmp__trace) <@ _poly_ntt (param, b_param);
      result <- aux;
      b_result <- aux_0;
      trace___polyvec_ntt <- (trace___polyvec_ntt ++ tmp__trace);
      trace___polyvec_ntt <-
      (trace___polyvec_ntt ++ [(Assert, (BArray512.is_init b_result 0 512))]);
      b_r <-
      (SBArray2048_512.set_sub16 b_r (256 * i)
      (BArray512.init_arr (W8.of_int 255)));
      r <- (SBArray2048_512.set_sub16 r (256 * i) result);
      i <- (i + 1);
    }
    b_r <- (BArray2048.init_arr (W8.of_int 255));
    return (r, b_r, trace___polyvec_ntt);
  }
  proc __polyvec_pointwise_acc (a:BArray2048.t, b_a:BArray2048.t,
                                b:BArray2048.t, b_b:BArray2048.t) : BArray512.t *
                                                                    BArray512.t *
                                                                    trace = {
    var aux:BArray512.t;
    var aux_0:BArray512.t;
    var r:BArray512.t;
    var t:BArray512.t;
    var i:int;
    var param:BArray512.t;
    var param_0:BArray512.t;
    var param_1:BArray512.t;
    var result:BArray512.t;
    var param_2:BArray512.t;
    var param_3:BArray512.t;
    var param_4:BArray512.t;
    var result_0:BArray512.t;
    var param_5:BArray512.t;
    var param_6:BArray512.t;
    var result_1:BArray512.t;
    var param_7:BArray512.t;
    var result_2:BArray512.t;
    var b_r:BArray512.t;
    var b_result:BArray512.t;
    var b_result_0:BArray512.t;
    var b_t:BArray512.t;
    var b_result_1:BArray512.t;
    var b_param:BArray512.t;
    var b_param_0:BArray512.t;
    var b_param_1:BArray512.t;
    var b_result_2:BArray512.t;
    var b_param_2:BArray512.t;
    var b_param_3:BArray512.t;
    var b_param_4:BArray512.t;
    var trace___polyvec_pointwise_acc:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_param_3 <- witness;
    b_param_4 <- witness;
    b_r <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_t <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    r <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    t <- witness;
    trace___polyvec_pointwise_acc <- [];
    trace___polyvec_pointwise_acc <-
    (trace___polyvec_pointwise_acc ++
    [(Assert, (BArray2048.is_init b_a 0 2048))]);
    trace___polyvec_pointwise_acc <-
    (trace___polyvec_pointwise_acc ++
    [(Assert, (BArray2048.is_init b_b 0 2048))]);
    b_r <- (BArray512.init_arr (W8.of_int 0));
    b_t <- (BArray512.init_arr (W8.of_int 0));
    b_param_4 <- b_r;
    param_1 <- r;
    b_param_3 <- (SBArray2048_512.get_sub16 b_a 0);
    param_0 <- (SBArray2048_512.get_sub16 a 0);
    b_param_2 <- (SBArray2048_512.get_sub16 b_b 0);
    param <- (SBArray2048_512.get_sub16 b 0);
    (aux, aux_0, tmp__trace) <@ _poly_basemul (param_1, b_param_4, param_0,
    b_param_3, param, b_param_2);
    result <- aux;
    b_result_2 <- aux_0;
    trace___polyvec_pointwise_acc <-
    (trace___polyvec_pointwise_acc ++ tmp__trace);
    trace___polyvec_pointwise_acc <-
    (trace___polyvec_pointwise_acc ++
    [(Assert, (BArray512.is_init b_result_2 0 512))]);
    r <- result;
    i <- 1;
    while ((i < 4)) {
      trace___polyvec_pointwise_acc <-
      (trace___polyvec_pointwise_acc ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      trace___polyvec_pointwise_acc <-
      (trace___polyvec_pointwise_acc ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      b_param_1 <- b_t;
      param_4 <- t;
      b_param_0 <- (SBArray2048_512.get_sub16 b_a (256 * i));
      param_3 <- (SBArray2048_512.get_sub16 a (256 * i));
      b_param <- (SBArray2048_512.get_sub16 b_b (256 * i));
      param_2 <- (SBArray2048_512.get_sub16 b (256 * i));
      (aux, aux_0, tmp__trace) <@ _poly_basemul (param_4, b_param_1, 
      param_3, b_param_0, param_2, b_param);
      result_0 <- aux;
      b_result_1 <- aux_0;
      trace___polyvec_pointwise_acc <-
      (trace___polyvec_pointwise_acc ++ tmp__trace);
      trace___polyvec_pointwise_acc <-
      (trace___polyvec_pointwise_acc ++
      [(Assert, (BArray512.is_init b_result_1 0 512))]);
      b_t <- (BArray512.init_arr (W8.of_int 255));
      t <- result_0;
      param_6 <- r;
      param_5 <- t;
      (aux, aux_0, tmp__trace) <@ _poly_add2 (param_6,
      (BArray512.init_arr (W8.of_int 255)), param_5,
      (BArray512.init_arr (W8.of_int 255)));
      result_1 <- aux;
      b_result_0 <- aux_0;
      trace___polyvec_pointwise_acc <-
      (trace___polyvec_pointwise_acc ++ tmp__trace);
      trace___polyvec_pointwise_acc <-
      (trace___polyvec_pointwise_acc ++
      [(Assert, (BArray512.is_init b_result_0 0 512))]);
      r <- result_1;
      i <- (i + 1);
    }
    param_7 <- r;
    (aux, aux_0, tmp__trace) <@ __poly_reduce (param_7,
    (BArray512.init_arr (W8.of_int 255)));
    result_2 <- aux;
    b_result <- aux_0;
    trace___polyvec_pointwise_acc <-
    (trace___polyvec_pointwise_acc ++ tmp__trace);
    trace___polyvec_pointwise_acc <-
    (trace___polyvec_pointwise_acc ++
    [(Assert, (BArray512.is_init b_result 0 512))]);
    r <- result_2;
    b_r <- (BArray512.init_arr (W8.of_int 255));
    return (r, b_r, trace___polyvec_pointwise_acc);
  }
  proc __polyvec_reduce (r:BArray2048.t, b_r:BArray2048.t) : BArray2048.t *
                                                             BArray2048.t *
                                                             trace = {
    var aux:BArray512.t;
    var aux_0:BArray512.t;
    var i:int;
    var param:BArray512.t;
    var result:BArray512.t;
    var b_result:BArray512.t;
    var b_param:BArray512.t;
    var trace___polyvec_reduce:trace;
    b_param <- witness;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace___polyvec_reduce <- [];
    trace___polyvec_reduce <-
    (trace___polyvec_reduce ++ [(Assert, (BArray2048.is_init b_r 0 2048))]);
    i <- 0;
    while ((i < 4)) {
      trace___polyvec_reduce <-
      (trace___polyvec_reduce ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      trace___polyvec_reduce <-
      (trace___polyvec_reduce ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      b_param <- (SBArray2048_512.get_sub16 b_r (256 * i));
      param <- (SBArray2048_512.get_sub16 r (256 * i));
      (aux, aux_0, tmp__trace) <@ __poly_reduce (param, b_param);
      result <- aux;
      b_result <- aux_0;
      trace___polyvec_reduce <- (trace___polyvec_reduce ++ tmp__trace);
      trace___polyvec_reduce <-
      (trace___polyvec_reduce ++
      [(Assert, (BArray512.is_init b_result 0 512))]);
      b_r <-
      (SBArray2048_512.set_sub16 b_r (256 * i)
      (BArray512.init_arr (W8.of_int 255)));
      r <- (SBArray2048_512.set_sub16 r (256 * i) result);
      i <- (i + 1);
    }
    b_r <- (BArray2048.init_arr (W8.of_int 255));
    return (r, b_r, trace___polyvec_reduce);
  }
  proc __i_polyvec_tobytes (rp:BArray1536.t, b_rp:BArray1536.t,
                            a:BArray2048.t, b_a:BArray2048.t) : BArray1536.t *
                                                                BArray1536.t *
                                                                trace = {
    var aux:BArray384.t;
    var aux_0:BArray384.t;
    var aux_1:BArray512.t;
    var aux_2:BArray512.t;
    var i:int;
    var param:BArray512.t;
    var param_0:BArray384.t;
    var result:BArray512.t;
    var result_0:BArray384.t;
    var b_result:BArray384.t;
    var b_result_0:BArray512.t;
    var b_param:BArray512.t;
    var b_param_0:BArray384.t;
    var trace___i_polyvec_tobytes:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    param <- witness;
    param_0 <- witness;
    result <- witness;
    result_0 <- witness;
    trace___i_polyvec_tobytes <- [];
    trace___i_polyvec_tobytes <-
    (trace___i_polyvec_tobytes ++
    [(Assert, (BArray2048.is_init b_a 0 2048))]);
    i <- 0;
    while ((i < 4)) {
      trace___i_polyvec_tobytes <-
      (trace___i_polyvec_tobytes ++
      [(Assert, ((0 <= (384 * i)) /\ (((384 * i) + 384) <= 1536)))]);
      trace___i_polyvec_tobytes <-
      (trace___i_polyvec_tobytes ++
      [(Assert, ((0 <= (384 * i)) /\ (((384 * i) + 384) <= 1536)))]);
      trace___i_polyvec_tobytes <-
      (trace___i_polyvec_tobytes ++
      [(Assert,
       ((0 <= ((256 * i) * 2)) /\ ((((256 * i) * 2) + 512) <= 2048)))]);
      b_param_0 <- (SBArray1536_384.get_sub8 b_rp (384 * i));
      param_0 <- (SBArray1536_384.get_sub8 rp (384 * i));
      b_param <- (SBArray2048_512.get_sub16 b_a (256 * i));
      param <- (SBArray2048_512.get_sub16 a (256 * i));
      (aux, aux_0, aux_1, aux_2, tmp__trace) <@ _poly_tobytes (param_0,
      b_param_0, param, b_param);
      result_0 <- aux;
      b_result <- aux_0;
      result <- aux_1;
      b_result_0 <- aux_2;
      trace___i_polyvec_tobytes <- (trace___i_polyvec_tobytes ++ tmp__trace);
      trace___i_polyvec_tobytes <-
      (trace___i_polyvec_tobytes ++
      [(Assert,
       ((BArray384.is_init b_result 0 384) /\
       (BArray512.is_init b_result_0 0 512)))]);
      b_rp <-
      (SBArray1536_384.set_sub8 b_rp (384 * i)
      (BArray384.init_arr (W8.of_int 255)));
      rp <- (SBArray1536_384.set_sub8 rp (384 * i) result_0);
      i <- (i + 1);
    }
    return (rp, b_rp, trace___i_polyvec_tobytes);
  }
  proc __i_polyvec_compress (rp:BArray1408.t, b_rp:BArray1408.t,
                             a:BArray2048.t, b_a:BArray2048.t) : BArray1408.t *
                                                                 BArray1408.t *
                                                                 trace = {
    var aux:BArray2048.t;
    var aux_0:BArray2048.t;
    var aa:BArray2048.t;
    var k:int;
    var d0:W64.t;
    var t:BArray16.t;
    var c:W16.t;
    var b:W16.t;
    var i:int;
    var j:int;
    var param:BArray2048.t;
    var result:BArray2048.t;
    var b_t:BArray16.t;
    var b_result:BArray2048.t;
    var trace___i_polyvec_compress:trace;
    aa <- witness;
    b_result <- witness;
    b_t <- witness;
    param <- witness;
    result <- witness;
    t <- witness;
    trace___i_polyvec_compress <- [];
    trace___i_polyvec_compress <-
    (trace___i_polyvec_compress ++
    [(Assert, (BArray2048.is_init b_a 0 2048))]);
    b_t <- (BArray16.init_arr (W8.of_int 0));
    i <- 0;
    j <- 0;
    param <- a;
    (aux, aux_0, tmp__trace) <@ __polyvec_csubq (param,
    (BArray2048.init_arr (W8.of_int 255)));
    result <- aux;
    b_result <- aux_0;
    trace___i_polyvec_compress <- (trace___i_polyvec_compress ++ tmp__trace);
    trace___i_polyvec_compress <-
    (trace___i_polyvec_compress ++
    [(Assert, (BArray2048.is_init b_result 0 2048))]);
    aa <- result;
    while ((i < 1024)) {
      k <- 0;
      while ((k < 8)) {
        trace___i_polyvec_compress <-
        (trace___i_polyvec_compress ++
        [(Assert, ((0 <= k) /\ (k <= 18446744073709551615)))]);
        trace___i_polyvec_compress <-
        (trace___i_polyvec_compress ++
        [(Assert, ((0 <= (i + k)) /\ ((i + k) <= 18446744073709551615)))]);
        trace___i_polyvec_compress <-
        (trace___i_polyvec_compress ++
        [(Assert, ((0 <= ((i + k) * 2)) /\ ((((i + k) * 2) + 2) <= 2048)))]);
        d0 <- (zeroextu64 (BArray2048.get16 aa (i + k)));
        d0 <- (d0 `<<` (W8.of_int 11));
        d0 <- (d0 + (W64.of_int 1664));
        d0 <- (d0 * (W64.of_int 645084));
        d0 <- (d0 `>>` (W8.of_int 31));
        d0 <- (d0 `&` (W64.of_int 2047));
        trace___i_polyvec_compress <-
        (trace___i_polyvec_compress ++
        [(Assert, ((0 <= (k * 2)) /\ (((k * 2) + 2) <= 16)))]);
        b_t <- (BArray16.set16d b_t (k * 2) (W16.of_int 65535));
        t <- (BArray16.set16 t k (truncateu16 d0));
        k <- (k + 1);
      }
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 0 2))]);
      c <- (BArray16.get16 t 0);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      b_rp <- (BArray1408.set8d b_rp j (W8.of_int 255));
      rp <- (BArray1408.set8 rp j (truncateu8 c));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 0 2))]);
      b <- (BArray16.get16 t 0);
      b <- (b `>>` (W8.of_int 8));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 2 2))]);
      c <- (BArray16.get16 t 1);
      c <- (c `<<` (W8.of_int 3));
      c <- (c `|` b);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      b_rp <- (BArray1408.set8d b_rp j (W8.of_int 255));
      rp <- (BArray1408.set8 rp j (truncateu8 c));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 2 2))]);
      b <- (BArray16.get16 t 1);
      b <- (b `>>` (W8.of_int 5));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 4 2))]);
      c <- (BArray16.get16 t 2);
      c <- (c `<<` (W8.of_int 6));
      c <- (c `|` b);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      b_rp <- (BArray1408.set8d b_rp j (W8.of_int 255));
      rp <- (BArray1408.set8 rp j (truncateu8 c));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 4 2))]);
      b <- (BArray16.get16 t 2);
      b <- (b `>>` (W8.of_int 2));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      b_rp <- (BArray1408.set8d b_rp j (W8.of_int 255));
      rp <- (BArray1408.set8 rp j (truncateu8 b));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 4 2))]);
      b <- (BArray16.get16 t 2);
      b <- (b `>>` (W8.of_int 10));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 6 2))]);
      c <- (BArray16.get16 t 3);
      c <- (c `<<` (W8.of_int 1));
      c <- (c `|` b);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      b_rp <- (BArray1408.set8d b_rp j (W8.of_int 255));
      rp <- (BArray1408.set8 rp j (truncateu8 c));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 6 2))]);
      b <- (BArray16.get16 t 3);
      b <- (b `>>` (W8.of_int 7));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 8 2))]);
      c <- (BArray16.get16 t 4);
      c <- (c `<<` (W8.of_int 4));
      c <- (c `|` b);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      b_rp <- (BArray1408.set8d b_rp j (W8.of_int 255));
      rp <- (BArray1408.set8 rp j (truncateu8 c));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 8 2))]);
      b <- (BArray16.get16 t 4);
      b <- (b `>>` (W8.of_int 4));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 10 2))]);
      c <- (BArray16.get16 t 5);
      c <- (c `<<` (W8.of_int 7));
      c <- (c `|` b);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      b_rp <- (BArray1408.set8d b_rp j (W8.of_int 255));
      rp <- (BArray1408.set8 rp j (truncateu8 c));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 10 2))]);
      b <- (BArray16.get16 t 5);
      b <- (b `>>` (W8.of_int 1));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      b_rp <- (BArray1408.set8d b_rp j (W8.of_int 255));
      rp <- (BArray1408.set8 rp j (truncateu8 b));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 10 2))]);
      b <- (BArray16.get16 t 5);
      b <- (b `>>` (W8.of_int 9));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 12 2))]);
      c <- (BArray16.get16 t 6);
      c <- (c `<<` (W8.of_int 2));
      c <- (c `|` b);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      b_rp <- (BArray1408.set8d b_rp j (W8.of_int 255));
      rp <- (BArray1408.set8 rp j (truncateu8 c));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 12 2))]);
      b <- (BArray16.get16 t 6);
      b <- (b `>>` (W8.of_int 6));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 14 2))]);
      c <- (BArray16.get16 t 7);
      c <- (c `<<` (W8.of_int 5));
      c <- (c `|` b);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      b_rp <- (BArray1408.set8d b_rp j (W8.of_int 255));
      rp <- (BArray1408.set8 rp j (truncateu8 c));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 14 2))]);
      b_t <- (BArray16.set16d b_t 14 (W16.of_int 65535));
      t <- (BArray16.set16 t 7 ((BArray16.get16 t 7) `>>` (W8.of_int 3)));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++ [(Assert, (BArray16.is_init b_t 14 2))]);
      b_rp <- (BArray1408.set8d b_rp j (W8.of_int 255));
      rp <- (BArray1408.set8 rp j (truncateu8 (BArray16.get16 t 7)));
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_compress <-
      (trace___i_polyvec_compress ++
      [(Assert, ((0 <= (i + 8)) /\ ((i + 8) <= 18446744073709551615)))]);
      i <- (i + 8);
    }
    return (rp, b_rp, trace___i_polyvec_compress);
  }
  proc __i_polyvec_decompress (rp:BArray2048.t, b_rp:BArray2048.t,
                               ap:BArray1408.t, b_ap:BArray1408.t) : 
  BArray2048.t * BArray2048.t * trace = {
    var t0:W32.t;
    var t1:W32.t;
    var d1:W32.t;
    var d0:W32.t;
    var t2:W32.t;
    var i:int;
    var j:int;
    var trace___i_polyvec_decompress:trace;
    trace___i_polyvec_decompress <- [];
    trace___i_polyvec_decompress <-
    (trace___i_polyvec_decompress ++
    [(Assert, (BArray1408.is_init b_ap 0 1408))]);
    i <- 0;
    j <- 0;
    while ((i < 1024)) {
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      t0 <- (zeroextu32 (BArray1408.get8 ap j));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      t1 <- (zeroextu32 (BArray1408.get8 ap j));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      d1 <- t1;
      d1 <- (d1 `<<` (W8.of_int 8));
      t0 <- (t0 `|` d1);
      t0 <- (t0 `&` (W32.of_int 2047));
      t0 <- (t0 * (W32.of_int 3329));
      t0 <- (t0 + (W32.of_int 1024));
      t0 <- (t0 `>>` (W8.of_int 11));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (i * 2)) /\ (((i * 2) + 2) <= 2048)))]);
      b_rp <- (BArray2048.set16d b_rp (i * 2) (W16.of_int 65535));
      rp <- (BArray2048.set16 rp i (truncateu16 t0));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      t0 <- (zeroextu32 (BArray1408.get8 ap j));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      d0 <- t1;
      d0 <- (d0 `>>` (W8.of_int 3));
      d1 <- t0;
      d1 <- (d1 `<<` (W8.of_int 5));
      d0 <- (d0 `|` d1);
      d0 <- (d0 `&` (W32.of_int 2047));
      d0 <- (d0 * (W32.of_int 3329));
      d0 <- (d0 + (W32.of_int 1024));
      d0 <- (d0 `>>` (W8.of_int 11));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= ((i + 1) * 2)) /\ ((((i + 1) * 2) + 2) <= 2048)))]);
      b_rp <- (BArray2048.set16d b_rp ((i + 1) * 2) (W16.of_int 65535));
      rp <- (BArray2048.set16 rp (i + 1) (truncateu16 d0));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      t1 <- (zeroextu32 (BArray1408.get8 ap j));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      t2 <- (zeroextu32 (BArray1408.get8 ap j));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      t0 <- (t0 `>>` (W8.of_int 6));
      d0 <- t1;
      d0 <- (d0 `<<` (W8.of_int 2));
      d1 <- t2;
      d1 <- (d1 `<<` (W8.of_int 10));
      d0 <- (d0 `|` d1);
      d0 <- (d0 `|` t0);
      d0 <- (d0 `&` (W32.of_int 2047));
      d0 <- (d0 * (W32.of_int 3329));
      d0 <- (d0 + (W32.of_int 1024));
      d0 <- (d0 `>>` (W8.of_int 11));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (i + 2)) /\ ((i + 2) <= 18446744073709551615)))]);
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= ((i + 2) * 2)) /\ ((((i + 2) * 2) + 2) <= 2048)))]);
      b_rp <- (BArray2048.set16d b_rp ((i + 2) * 2) (W16.of_int 65535));
      rp <- (BArray2048.set16 rp (i + 2) (truncateu16 d0));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      t0 <- (zeroextu32 (BArray1408.get8 ap j));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      d0 <- t2;
      d0 <- (d0 `>>` (W8.of_int 1));
      d1 <- t0;
      d1 <- (d1 `<<` (W8.of_int 7));
      d0 <- (d0 `|` d1);
      d0 <- (d0 `&` (W32.of_int 2047));
      d0 <- (d0 * (W32.of_int 3329));
      d0 <- (d0 + (W32.of_int 1024));
      d0 <- (d0 `>>` (W8.of_int 11));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (i + 3)) /\ ((i + 3) <= 18446744073709551615)))]);
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= ((i + 3) * 2)) /\ ((((i + 3) * 2) + 2) <= 2048)))]);
      b_rp <- (BArray2048.set16d b_rp ((i + 3) * 2) (W16.of_int 65535));
      rp <- (BArray2048.set16 rp (i + 3) (truncateu16 d0));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      t1 <- (zeroextu32 (BArray1408.get8 ap j));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      d0 <- t0;
      d0 <- (d0 `>>` (W8.of_int 4));
      d1 <- t1;
      d1 <- (d1 `<<` (W8.of_int 4));
      d0 <- (d0 `|` d1);
      d0 <- (d0 `&` (W32.of_int 2047));
      d0 <- (d0 * (W32.of_int 3329));
      d0 <- (d0 + (W32.of_int 1024));
      d0 <- (d0 `>>` (W8.of_int 11));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (i + 4)) /\ ((i + 4) <= 18446744073709551615)))]);
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= ((i + 4) * 2)) /\ ((((i + 4) * 2) + 2) <= 2048)))]);
      b_rp <- (BArray2048.set16d b_rp ((i + 4) * 2) (W16.of_int 65535));
      rp <- (BArray2048.set16 rp (i + 4) (truncateu16 d0));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      t2 <- (zeroextu32 (BArray1408.get8 ap j));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      t0 <- (zeroextu32 (BArray1408.get8 ap j));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      t1 <- (t1 `>>` (W8.of_int 7));
      d0 <- t2;
      d0 <- (d0 `<<` (W8.of_int 1));
      d1 <- t0;
      d1 <- (d1 `<<` (W8.of_int 9));
      d0 <- (d0 `|` d1);
      d0 <- (d0 `|` t1);
      d0 <- (d0 `&` (W32.of_int 2047));
      d0 <- (d0 * (W32.of_int 3329));
      d0 <- (d0 + (W32.of_int 1024));
      d0 <- (d0 `>>` (W8.of_int 11));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (i + 5)) /\ ((i + 5) <= 18446744073709551615)))]);
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= ((i + 5) * 2)) /\ ((((i + 5) * 2) + 2) <= 2048)))]);
      b_rp <- (BArray2048.set16d b_rp ((i + 5) * 2) (W16.of_int 65535));
      rp <- (BArray2048.set16 rp (i + 5) (truncateu16 d0));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      t1 <- (zeroextu32 (BArray1408.get8 ap j));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      d0 <- t0;
      d0 <- (d0 `>>` (W8.of_int 2));
      d1 <- t1;
      d1 <- (d1 `<<` (W8.of_int 6));
      d0 <- (d0 `|` d1);
      d0 <- (d0 `&` (W32.of_int 2047));
      d0 <- (d0 * (W32.of_int 3329));
      d0 <- (d0 + (W32.of_int 1024));
      d0 <- (d0 `>>` (W8.of_int 11));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (i + 6)) /\ ((i + 6) <= 18446744073709551615)))]);
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= ((i + 6) * 2)) /\ ((((i + 6) * 2) + 2) <= 2048)))]);
      b_rp <- (BArray2048.set16d b_rp ((i + 6) * 2) (W16.of_int 65535));
      rp <- (BArray2048.set16 rp (i + 6) (truncateu16 d0));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= j) /\ ((j + 1) <= 1408)))]);
      t0 <- (zeroextu32 (BArray1408.get8 ap j));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (j + 1)) /\ ((j + 1) <= 18446744073709551615)))]);
      j <- (j + 1);
      d0 <- t1;
      d0 <- (d0 `>>` (W8.of_int 5));
      d1 <- t0;
      d1 <- (d1 `<<` (W8.of_int 3));
      d0 <- (d0 `|` d1);
      d0 <- (d0 `&` (W32.of_int 2047));
      d0 <- (d0 * (W32.of_int 3329));
      d0 <- (d0 + (W32.of_int 1024));
      d0 <- (d0 `>>` (W8.of_int 11));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (i + 7)) /\ ((i + 7) <= 18446744073709551615)))]);
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= ((i + 7) * 2)) /\ ((((i + 7) * 2) + 2) <= 2048)))]);
      b_rp <- (BArray2048.set16d b_rp ((i + 7) * 2) (W16.of_int 65535));
      rp <- (BArray2048.set16 rp (i + 7) (truncateu16 d0));
      trace___i_polyvec_decompress <-
      (trace___i_polyvec_decompress ++
      [(Assert, ((0 <= (i + 8)) /\ ((i + 8) <= 18446744073709551615)))]);
      i <- (i + 8);
    }
    return (rp, b_rp, trace___i_polyvec_decompress);
  }
  proc __rej_uniform (rp:BArray512.t, b_rp:BArray512.t, offset:int,
                      buf:BArray168.t, b_buf:BArray168.t) : int *
                                                            BArray512.t *
                                                            BArray512.t *
                                                            trace = {
    var ms:W64.t;
    var cond:bool;
    var val1:W16.t;
    var t:W16.t;
    var val2:W16.t;
    var ctr:int;
    var pos:int;
    var trace___rej_uniform:trace;
    trace___rej_uniform <- [];
    trace___rej_uniform <-
    (trace___rej_uniform ++
    [(Assert,
     (((0 <= (offset * 2)) /\ ((offset * 2) <= 18446744073709551615)) /\
     ((BArray168.is_init b_buf 0 168) /\
     (BArray512.is_init b_rp 0 (offset * 2)))))]);
    trace___rej_uniform <-
    (trace___rej_uniform ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    ms <- (init_msf);
    ctr <- offset;
    pos <- 0;
    cond <- (pos < 166);
    while (cond) {
      ms <- (update_msf cond ms);
      cond <- (ctr < 256);
      if (cond) {
        ms <- (update_msf cond ms);
        trace___rej_uniform <-
        (trace___rej_uniform ++
        [(Assert, ((0 <= pos) /\ ((pos + 1) <= 168)))]);
        val1 <- (zeroextu16 (BArray168.get8 buf pos));
        val1 <- (protect_16 val1 ms);
        trace___rej_uniform <-
        (trace___rej_uniform ++
        [(Assert, ((0 <= (pos + 1)) /\ ((pos + 1) <= 18446744073709551615)))]);
        trace___rej_uniform <-
        (trace___rej_uniform ++
        [(Assert, ((0 <= (pos + 1)) /\ (((pos + 1) + 1) <= 168)))]);
        t <- (zeroextu16 (BArray168.get8 buf (pos + 1)));
        t <- (protect_16 t ms);
        val2 <- t;
        val2 <- (val2 `>>` (W8.of_int 4));
        t <- (t `&` (W16.of_int 15));
        t <- (t `<<` (W8.of_int 8));
        val1 <- (val1 `|` t);
        trace___rej_uniform <-
        (trace___rej_uniform ++
        [(Assert, ((0 <= (pos + 2)) /\ ((pos + 2) <= 18446744073709551615)))]);
        trace___rej_uniform <-
        (trace___rej_uniform ++
        [(Assert, ((0 <= (pos + 2)) /\ (((pos + 2) + 1) <= 168)))]);
        t <- (zeroextu16 (BArray168.get8 buf (pos + 2)));
        t <- (protect_16 t ms);
        t <- (t `<<` (W8.of_int 4));
        val2 <- (val2 `|` t);
        trace___rej_uniform <-
        (trace___rej_uniform ++
        [(Assert, ((0 <= (pos + 3)) /\ ((pos + 3) <= 18446744073709551615)))]);
        pos <- (pos + 3);
        cond <- (val1 \ult (W16.of_int 3329));
        if (cond) {
          ms <- (update_msf cond ms);
          trace___rej_uniform <-
          (trace___rej_uniform ++
          [(Assert, ((0 <= (ctr * 2)) /\ (((ctr * 2) + 2) <= 512)))]);
          b_rp <- (BArray512.set16d b_rp (ctr * 2) (W16.of_int 65535));
          rp <- (BArray512.set16 rp ctr val1);
          trace___rej_uniform <-
          (trace___rej_uniform ++
          [(Assert,
           ((0 <= (ctr + 1)) /\ ((ctr + 1) <= 18446744073709551615)))]);
          ctr <- (ctr + 1);
        } else {
          ms <- (update_msf (! cond) ms);
        }
        cond <- (val2 \ult (W16.of_int 3329));
        if (cond) {
          ms <- (update_msf cond ms);
          cond <- (ctr < 256);
          if (cond) {
            ms <- (update_msf cond ms);
            trace___rej_uniform <-
            (trace___rej_uniform ++
            [(Assert, ((0 <= (ctr * 2)) /\ (((ctr * 2) + 2) <= 512)))]);
            b_rp <- (BArray512.set16d b_rp (ctr * 2) (W16.of_int 65535));
            rp <- (BArray512.set16 rp ctr val2);
            trace___rej_uniform <-
            (trace___rej_uniform ++
            [(Assert,
             ((0 <= (ctr + 1)) /\ ((ctr + 1) <= 18446744073709551615)))]);
            ctr <- (ctr + 1);
          } else {
            ms <- (update_msf (! cond) ms);
          }
        } else {
          ms <- (update_msf (! cond) ms);
        }
      } else {
        ms <- (update_msf (! cond) ms);
        pos <- 168;
      }
      cond <- (pos < 166);
    }
    return (ctr, rp, b_rp, trace___rej_uniform);
  }
  proc __gen_matrix (seed:BArray32.t, b_seed:BArray32.t, transposed:W64.t) : 
  BArray8192.t * BArray8192.t * trace = {
    var aux_1:BArray168.t;
    var aux_2:BArray168.t;
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_4:BArray512.t;
    var aux_5:BArray512.t;
    var aux_3:int;
    var r:BArray8192.t;
    var stransposed:W64.t;
    var j:int;
    var c:W8.t;
    var extseed:BArray34.t;
    var i:int;
    var state:BArray200.t;
    var buf:BArray168.t;
    var poly:BArray512.t;
    var k:W64.t;
    var rij:BArray512.t;
    var t:W16.t;
    var ctr:int;
    var sctr:int;
    var param:BArray34.t;
    var param_0:BArray200.t;
    var result:BArray200.t;
    var param_1:BArray168.t;
    var param_2:BArray200.t;
    var result_0:BArray168.t;
    var result_1:BArray200.t;
    var param_3:BArray168.t;
    var param_4:int;
    var param_5:BArray512.t;
    var result_2:BArray512.t;
    var result_3:int;
    var b_r:BArray8192.t;
    var b_rij:BArray512.t;
    var b_poly:BArray512.t;
    var b_result:BArray512.t;
    var b_param:BArray512.t;
    var b_buf:BArray168.t;
    var b_result_0:BArray168.t;
    var b_state:BArray200.t;
    var b_result_1:BArray200.t;
    var b_param_0:BArray168.t;
    var b_result_2:BArray200.t;
    var b_param_1:BArray34.t;
    var b_param_2:BArray200.t;
    var b_extseed:BArray34.t;
    var trace___gen_matrix:trace;
    b_buf <- witness;
    b_extseed <- witness;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_poly <- witness;
    b_r <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_rij <- witness;
    b_state <- witness;
    buf <- witness;
    extseed <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_5 <- witness;
    poly <- witness;
    r <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    rij <- witness;
    state <- witness;
    trace___gen_matrix <- [];
    trace___gen_matrix <-
    (trace___gen_matrix ++
    [(Assert,
     (((BArray32.is_init b_seed 0 32) /\ ((W64.of_int 0) \ule transposed)) /\
     (transposed \ule (W64.of_int 1))))]);
    b_extseed <- (BArray34.init_arr (W8.of_int 0));
    b_buf <- (BArray168.init_arr (W8.of_int 0));
    b_poly <- (BArray512.init_arr (W8.of_int 0));
    b_r <- (BArray8192.init_arr (W8.of_int 0));
    b_state <- (BArray200.init_arr (W8.of_int 0));
    stransposed <- transposed;
    j <- 0;
    while ((j < 32)) {
      trace___gen_matrix <-
      (trace___gen_matrix ++ [(Assert, ((0 <= j) /\ ((j + 1) <= 32)))]);
      c <- (BArray32.get8 seed j);
      trace___gen_matrix <-
      (trace___gen_matrix ++ [(Assert, ((0 <= j) /\ ((j + 1) <= 34)))]);
      b_extseed <- (BArray34.set8d b_extseed j (W8.of_int 255));
      extseed <- (BArray34.set8 extseed j c);
      j <- (j + 1);
    }
    i <- 0;
    while ((i < 4)) {
      j <- 0;
      while ((j < 4)) {
        transposed <- stransposed;
        if ((transposed = (W64.of_int 0))) {
          b_extseed <- (BArray34.set8d b_extseed 32 (W8.of_int 255));
          extseed <- (BArray34.set8 extseed 32 (W8.of_int j));
          b_extseed <- (BArray34.set8d b_extseed 33 (W8.of_int 255));
          extseed <- (BArray34.set8 extseed 33 (W8.of_int i));
        } else {
          b_extseed <- (BArray34.set8d b_extseed 32 (W8.of_int 255));
          extseed <- (BArray34.set8 extseed 32 (W8.of_int i));
          b_extseed <- (BArray34.set8d b_extseed 33 (W8.of_int 255));
          extseed <- (BArray34.set8 extseed 33 (W8.of_int j));
        }
        b_param_2 <- b_state;
        param_0 <- state;
        b_param_1 <- b_extseed;
        param <- extseed;
        (aux, aux_0, tmp__trace) <@ _shake128_absorb34 (param_0, b_param_2,
        param, b_param_1);
        result <- aux;
        b_result_2 <- aux_0;
        trace___gen_matrix <- (trace___gen_matrix ++ tmp__trace);
        trace___gen_matrix <-
        (trace___gen_matrix ++
        [(Assert, (BArray200.is_init b_result_2 0 200))]);
        b_state <- (BArray200.init_arr (W8.of_int 255));
        state <- result;
        ctr <- 0;
        while ((ctr < 256)) {
          sctr <- ctr;
          param_2 <- state;
          b_param_0 <- b_buf;
          param_1 <- buf;
          (aux, aux_0, aux_1, aux_2, tmp__trace) <@ _shake128_squeezeblock (
          param_2, (BArray200.init_arr (W8.of_int 255)), param_1, b_param_0);
          result_1 <- aux;
          b_result_1 <- aux_0;
          result_0 <- aux_1;
          b_result_0 <- aux_2;
          trace___gen_matrix <- (trace___gen_matrix ++ tmp__trace);
          trace___gen_matrix <-
          (trace___gen_matrix ++
          [(Assert,
           ((BArray200.is_init b_result_1 0 200) /\
           (BArray168.is_init b_result_0 0 168)))]);
          b_state <- (BArray200.init_arr (W8.of_int 255));
          state <- result_1;
          b_buf <- (BArray168.init_arr (W8.of_int 255));
          buf <- result_0;
          ctr <- sctr;
          b_param <- b_poly;
          param_5 <- poly;
          param_4 <- ctr;
          param_3 <- buf;
          (aux_3, aux_4, aux_5, tmp__trace) <@ __rej_uniform (param_5,
          b_param, param_4, param_3, (BArray168.init_arr (W8.of_int 255)));
          result_3 <- aux_3;
          result_2 <- aux_4;
          b_result <- aux_5;
          trace___gen_matrix <- (trace___gen_matrix ++ tmp__trace);
          trace___gen_matrix <-
          (trace___gen_matrix ++
          [(Assert,
           (((0 <= (2 * result_3)) /\
            ((2 * result_3) <= 18446744073709551615)) /\
           ((BArray512.is_init b_result 0 (2 * result_3)) /\
           (param_4 <= result_3))))]);
          trace___gen_matrix <-
          (trace___gen_matrix ++
          [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
          ctr <- result_3;
          b_poly <- b_result;
          poly <- result_2;
        }
        k <- (W64.of_int 0);
        trace___gen_matrix <-
        (trace___gen_matrix ++
        [(Assert,
         ((0 <= (((i * 1024) + (j * 256)) * 2)) /\
         (((((i * 1024) + (j * 256)) * 2) + 512) <= 8192)))]);
        b_rij <- (SBArray8192_512.get_sub16 b_r ((i * 1024) + (j * 256)));
        rij <- (SBArray8192_512.get_sub16 r ((i * 1024) + (j * 256)));
        while ((k \ult (W64.of_int 256))) {
          trace___gen_matrix <-
          (trace___gen_matrix ++
          [(Assert,
           ((0 <= ((W64.to_uint k) * 2)) /\
           ((((W64.to_uint k) * 2) + 2) <= 512)))]);
          trace___gen_matrix <-
          (trace___gen_matrix ++
          [(Assert, (BArray512.is_init b_poly ((W64.to_uint k) * 2) 2))]);
          t <- (BArray512.get16 poly (W64.to_uint k));
          trace___gen_matrix <-
          (trace___gen_matrix ++
          [(Assert,
           ((0 <= ((W64.to_uint k) * 2)) /\
           ((((W64.to_uint k) * 2) + 2) <= 512)))]);
          b_rij <-
          (BArray512.set16d b_rij ((W64.to_uint k) * 2) (W16.of_int 65535));
          rij <- (BArray512.set16 rij (W64.to_uint k) t);
          k <- (k + (W64.of_int 1));
        }
        trace___gen_matrix <-
        (trace___gen_matrix ++
        [(Assert,
         ((0 <= (((i * 1024) + (j * 256)) * 2)) /\
         (((((i * 1024) + (j * 256)) * 2) + 512) <= 8192)))]);
        b_r <-
        (SBArray8192_512.set_sub16 b_r ((i * 1024) + (j * 256)) b_rij);
        r <- (SBArray8192_512.set_sub16 r ((i * 1024) + (j * 256)) rij);
        j <- (j + 1);
      }
      i <- (i + 1);
    }
    return (r, b_r, trace___gen_matrix);
  }
  proc __indcpa_keypair (pk:BArray1568.t, b_pk:BArray1568.t, sk:BArray1536.t,
                         b_sk:BArray1536.t, randomnessp:BArray32.t,
                         b_randomnessp:BArray32.t) : BArray1568.t *
                                                     BArray1568.t *
                                                     BArray1536.t *
                                                     BArray1536.t * trace = {
    var aux_3:BArray2048.t;
    var aux_4:BArray2048.t;
    var aux_1:BArray512.t;
    var aux_2:BArray512.t;
    var aux:BArray8192.t;
    var aux_0:BArray8192.t;
    var i:int;
    var t64:W64.t;
    var inbuf:BArray33.t;
    var buf:BArray64.t;
    var publicseed:BArray32.t;
    var noiseseed:BArray32.t;
    var transposed:W64.t;
    var aa:BArray8192.t;
    var nonce:W8.t;
    var skpv:BArray2048.t;
    var e:BArray2048.t;
    var pkpv:BArray2048.t;
    var param:BArray33.t;
    var param_0:BArray64.t;
    var result:BArray64.t;
    var param_1:W64.t;
    var param_2:BArray32.t;
    var result_0:BArray8192.t;
    var param_3:W8.t;
    var param_4:BArray32.t;
    var param_5:BArray512.t;
    var result_1:BArray512.t;
    var param_6:W8.t;
    var param_7:BArray32.t;
    var param_8:BArray512.t;
    var result_2:BArray512.t;
    var param_9:BArray2048.t;
    var result_3:BArray2048.t;
    var param_10:BArray2048.t;
    var result_4:BArray2048.t;
    var param_11:BArray2048.t;
    var param_12:BArray2048.t;
    var result_5:BArray512.t;
    var param_13:BArray512.t;
    var result_6:BArray512.t;
    var param_14:BArray2048.t;
    var param_15:BArray2048.t;
    var result_7:BArray2048.t;
    var param_16:BArray2048.t;
    var result_8:BArray2048.t;
    var param_17:BArray2048.t;
    var param_18:BArray1536.t;
    var result_9:BArray1536.t;
    var param_19:BArray2048.t;
    var param_20:BArray1536.t;
    var result_10:BArray1536.t;
    var b_publicseed:BArray32.t;
    var b_result:BArray1536.t;
    var b_param:BArray1536.t;
    var b_pkpv:BArray2048.t;
    var b_result_0:BArray1536.t;
    var b_param_0:BArray1536.t;
    var b_skpv:BArray2048.t;
    var b_result_1:BArray2048.t;
    var b_result_2:BArray2048.t;
    var b_param_1:BArray2048.t;
    var b_e:BArray2048.t;
    var b_result_3:BArray512.t;
    var b_param_2:BArray512.t;
    var b_result_4:BArray512.t;
    var b_param_3:BArray2048.t;
    var b_aa:BArray8192.t;
    var b_result_5:BArray2048.t;
    var b_param_4:BArray2048.t;
    var b_result_6:BArray2048.t;
    var b_param_5:BArray2048.t;
    var b_result_7:BArray512.t;
    var b_param_6:BArray32.t;
    var b_param_7:BArray512.t;
    var b_noiseseed:BArray32.t;
    var b_result_8:BArray512.t;
    var b_param_8:BArray32.t;
    var b_param_9:BArray512.t;
    var b_result_9:BArray8192.t;
    var b_param_10:BArray32.t;
    var b_buf:BArray64.t;
    var b_result_10:BArray64.t;
    var b_param_11:BArray33.t;
    var b_param_12:BArray64.t;
    var b_inbuf:BArray33.t;
    var trace___indcpa_keypair:trace;
    aa <- witness;
    b_aa <- witness;
    b_buf <- witness;
    b_e <- witness;
    b_inbuf <- witness;
    b_noiseseed <- witness;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_param_3 <- witness;
    b_param_4 <- witness;
    b_param_5 <- witness;
    b_param_6 <- witness;
    b_param_7 <- witness;
    b_param_8 <- witness;
    b_param_9 <- witness;
    b_param_10 <- witness;
    b_param_11 <- witness;
    b_param_12 <- witness;
    b_pkpv <- witness;
    b_publicseed <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    b_result_5 <- witness;
    b_result_6 <- witness;
    b_result_7 <- witness;
    b_result_8 <- witness;
    b_result_9 <- witness;
    b_result_10 <- witness;
    b_skpv <- witness;
    buf <- witness;
    e <- witness;
    inbuf <- witness;
    noiseseed <- witness;
    param <- witness;
    param_0 <- witness;
    param_2 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_7 <- witness;
    param_8 <- witness;
    param_9 <- witness;
    param_10 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    param_13 <- witness;
    param_14 <- witness;
    param_15 <- witness;
    param_16 <- witness;
    param_17 <- witness;
    param_18 <- witness;
    param_19 <- witness;
    param_20 <- witness;
    pkpv <- witness;
    publicseed <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_3 <- witness;
    result_4 <- witness;
    result_5 <- witness;
    result_6 <- witness;
    result_7 <- witness;
    result_8 <- witness;
    result_9 <- witness;
    result_10 <- witness;
    skpv <- witness;
    trace___indcpa_keypair <- [];
    trace___indcpa_keypair <-
    (trace___indcpa_keypair ++
    [(Assert, (BArray32.is_init b_randomnessp 0 32))]);
    b_publicseed <- (BArray32.init_arr (W8.of_int 0));
    b_noiseseed <- (BArray32.init_arr (W8.of_int 0));
    b_inbuf <- (BArray33.init_arr (W8.of_int 0));
    b_buf <- (BArray64.init_arr (W8.of_int 0));
    b_skpv <- (BArray2048.init_arr (W8.of_int 0));
    b_e <- (BArray2048.init_arr (W8.of_int 0));
    b_pkpv <- (BArray2048.init_arr (W8.of_int 0));
    (* Erased call to spill *)
    i <- 0;
    while ((i < 4)) {
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 32)))]);
      t64 <- (BArray32.get64 randomnessp i);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 33)))]);
      b_inbuf <-
      (BArray33.set64d b_inbuf (i * 8) (W64.of_int 18446744073709551615));
      inbuf <- (BArray33.set64 inbuf i t64);
      i <- (i + 1);
    }
    b_inbuf <- (BArray33.set8d b_inbuf 32 (W8.of_int 255));
    inbuf <- (BArray33.set8 inbuf 32 (W8.of_int 4));
    b_param_12 <- b_buf;
    param_0 <- buf;
    b_param_11 <- b_inbuf;
    param <- inbuf;
    (result, b_result_10, tmp__trace) <@ _sha3_512A_A33 (param_0, b_param_12,
    param, b_param_11);
    trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
    trace___indcpa_keypair <-
    (trace___indcpa_keypair ++
    [(Assert, (BArray64.is_init b_result_10 0 64))]);
    buf <- result;
    i <- 0;
    while ((i < 4)) {
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 64)))]);
      t64 <- (BArray64.get64 buf i);
      (* Erased call to declassify *)
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 32)))]);
      b_publicseed <-
      (BArray32.set64d b_publicseed (i * 8) (W64.of_int 18446744073709551615)
      );
      publicseed <- (BArray32.set64 publicseed i t64);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, ((0 <= ((i + 4) * 8)) /\ ((((i + 4) * 8) + 8) <= 64)))]);
      t64 <- (BArray64.get64 buf (i + 4));
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 32)))]);
      b_noiseseed <-
      (BArray32.set64d b_noiseseed (i * 8) (W64.of_int 18446744073709551615));
      noiseseed <- (BArray32.set64 noiseseed i t64);
      i <- (i + 1);
    }
    transposed <- (W64.of_int 0);
    b_param_10 <- b_publicseed;
    param_2 <- publicseed;
    param_1 <- transposed;
    (aux, aux_0, tmp__trace) <@ __gen_matrix (param_2, b_param_10, param_1);
    result_0 <- aux;
    b_result_9 <- aux_0;
    trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
    trace___indcpa_keypair <-
    (trace___indcpa_keypair ++
    [(Assert, (BArray8192.is_init b_result_9 0 8192))]);
    b_aa <- (BArray8192.init_arr (W8.of_int 255));
    aa <- result_0;
    i <- 0;
    while ((i < 4)) {
      nonce <- (W8.of_int i);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert,
       ((0 <= ((i * 256) * 2)) /\ ((((i * 256) * 2) + 512) <= 2048)))]);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert,
       ((0 <= ((i * 256) * 2)) /\ ((((i * 256) * 2) + 512) <= 2048)))]);
      b_param_9 <- (SBArray2048_512.get_sub16 b_skpv (i * 256));
      param_5 <- (SBArray2048_512.get_sub16 skpv (i * 256));
      b_param_8 <- b_noiseseed;
      param_4 <- noiseseed;
      param_3 <- nonce;
      (aux_1, aux_2, tmp__trace) <@ _poly_getnoise (param_5, b_param_9,
      param_4, b_param_8, param_3);
      result_1 <- aux_1;
      b_result_8 <- aux_2;
      trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, (BArray512.is_init b_result_8 0 512))]);
      b_skpv <-
      (SBArray2048_512.set_sub16 b_skpv (i * 256)
      (BArray512.init_arr (W8.of_int 255)));
      skpv <- (SBArray2048_512.set_sub16 skpv (i * 256) result_1);
      i <- (i + 1);
    }
    i <- 0;
    while ((i < 4)) {
      nonce <- (W8.of_int (4 + i));
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert,
       ((0 <= ((i * 256) * 2)) /\ ((((i * 256) * 2) + 512) <= 2048)))]);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert,
       ((0 <= ((i * 256) * 2)) /\ ((((i * 256) * 2) + 512) <= 2048)))]);
      b_param_7 <- (SBArray2048_512.get_sub16 b_e (i * 256));
      param_8 <- (SBArray2048_512.get_sub16 e (i * 256));
      b_param_6 <- b_noiseseed;
      param_7 <- noiseseed;
      param_6 <- nonce;
      (aux_1, aux_2, tmp__trace) <@ _poly_getnoise (param_8, b_param_7,
      param_7, b_param_6, param_6);
      result_2 <- aux_1;
      b_result_7 <- aux_2;
      trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, (BArray512.is_init b_result_7 0 512))]);
      b_e <-
      (SBArray2048_512.set_sub16 b_e (i * 256)
      (BArray512.init_arr (W8.of_int 255)));
      e <- (SBArray2048_512.set_sub16 e (i * 256) result_2);
      i <- (i + 1);
    }
    b_param_5 <- b_skpv;
    param_9 <- skpv;
    (aux_3, aux_4, tmp__trace) <@ __polyvec_ntt (param_9, b_param_5);
    result_3 <- aux_3;
    b_result_6 <- aux_4;
    trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
    trace___indcpa_keypair <-
    (trace___indcpa_keypair ++
    [(Assert, (BArray2048.is_init b_result_6 0 2048))]);
    skpv <- result_3;
    b_param_4 <- b_e;
    param_10 <- e;
    (aux_3, aux_4, tmp__trace) <@ __polyvec_ntt (param_10, b_param_4);
    result_4 <- aux_3;
    b_result_5 <- aux_4;
    trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
    trace___indcpa_keypair <-
    (trace___indcpa_keypair ++
    [(Assert, (BArray2048.is_init b_result_5 0 2048))]);
    e <- result_4;
    i <- 0;
    while ((i < 4)) {
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert,
       ((0 <= ((i * 256) * 2)) /\ ((((i * 256) * 2) + 512) <= 2048)))]);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert,
       ((0 <= ((i * 1024) * 2)) /\ ((((i * 1024) * 2) + 2048) <= 8192)))]);
      b_param_3 <- (SBArray8192_2048.get_sub16 b_aa (i * 1024));
      param_12 <- (SBArray8192_2048.get_sub16 aa (i * 1024));
      param_11 <- skpv;
      (aux_1, aux_2, tmp__trace) <@ __polyvec_pointwise_acc (param_12,
      b_param_3, param_11, (BArray2048.init_arr (W8.of_int 255)));
      result_5 <- aux_1;
      b_result_4 <- aux_2;
      trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, (BArray512.is_init b_result_4 0 512))]);
      b_pkpv <-
      (SBArray2048_512.set_sub16 b_pkpv (i * 256)
      (BArray512.init_arr (W8.of_int 255)));
      pkpv <- (SBArray2048_512.set_sub16 pkpv (i * 256) result_5);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert,
       ((0 <= ((i * 256) * 2)) /\ ((((i * 256) * 2) + 512) <= 2048)))]);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert,
       ((0 <= ((i * 256) * 2)) /\ ((((i * 256) * 2) + 512) <= 2048)))]);
      b_param_2 <- (SBArray2048_512.get_sub16 b_pkpv (i * 256));
      param_13 <- (SBArray2048_512.get_sub16 pkpv (i * 256));
      (aux_1, aux_2, tmp__trace) <@ _poly_frommont (param_13, b_param_2);
      result_6 <- aux_1;
      b_result_3 <- aux_2;
      trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, (BArray512.is_init b_result_3 0 512))]);
      b_pkpv <-
      (SBArray2048_512.set_sub16 b_pkpv (i * 256)
      (BArray512.init_arr (W8.of_int 255)));
      pkpv <- (SBArray2048_512.set_sub16 pkpv (i * 256) result_6);
      i <- (i + 1);
    }
    b_param_1 <- b_pkpv;
    param_15 <- pkpv;
    param_14 <- e;
    (aux_3, aux_4, tmp__trace) <@ __polyvec_add2 (param_15, b_param_1,
    param_14, (BArray2048.init_arr (W8.of_int 255)));
    result_7 <- aux_3;
    b_result_2 <- aux_4;
    trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
    trace___indcpa_keypair <-
    (trace___indcpa_keypair ++
    [(Assert, (BArray2048.is_init b_result_2 0 2048))]);
    pkpv <- result_7;
    param_16 <- pkpv;
    (aux_3, aux_4, tmp__trace) <@ __polyvec_reduce (param_16,
    (BArray2048.init_arr (W8.of_int 255)));
    result_8 <- aux_3;
    b_result_1 <- aux_4;
    trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
    trace___indcpa_keypair <-
    (trace___indcpa_keypair ++
    [(Assert, (BArray2048.is_init b_result_1 0 2048))]);
    pkpv <- result_8;
    (* Erased call to unspill *)
    b_param_0 <- b_sk;
    param_18 <- sk;
    param_17 <- skpv;
    (result_9, b_result_0, tmp__trace) <@ __i_polyvec_tobytes (param_18,
    b_param_0, param_17, (BArray2048.init_arr (W8.of_int 255)));
    trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
    trace___indcpa_keypair <-
    (trace___indcpa_keypair ++
    [(Assert, (BArray1536.is_init b_result_0 0 1536))]);
    sk <- result_9;
    b_param <- (SBArray1568_1536.get_sub8 b_pk 0);
    param_20 <- (SBArray1568_1536.get_sub8 pk 0);
    param_19 <- pkpv;
    (result_10, b_result, tmp__trace) <@ __i_polyvec_tobytes (param_20,
    b_param, param_19, (BArray2048.init_arr (W8.of_int 255)));
    trace___indcpa_keypair <- (trace___indcpa_keypair ++ tmp__trace);
    trace___indcpa_keypair <-
    (trace___indcpa_keypair ++
    [(Assert, (BArray1536.is_init b_result 0 1536))]);
    b_pk <-
    (SBArray1568_1536.set_sub8 b_pk 0 (BArray1536.init_arr (W8.of_int 255)));
    pk <- (SBArray1568_1536.set_sub8 pk 0 result_10);
    i <- 0;
    while ((i < 4)) {
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 32)))]);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, (BArray32.is_init b_publicseed (i * 8) 8))]);
      t64 <- (BArray32.get64 publicseed i);
      trace___indcpa_keypair <-
      (trace___indcpa_keypair ++
      [(Assert, ((0 <= ((i + 192) * 8)) /\ ((((i + 192) * 8) + 8) <= 1568)))]);
      b_pk <-
      (BArray1568.set64d b_pk ((i + 192) * 8)
      (W64.of_int 18446744073709551615));
      pk <- (BArray1568.set64d pk ((i + 192) * 8) t64);
      i <- (i + 1);
    }
    b_sk <- (BArray1536.init_arr (W8.of_int 255));
    return (pk, b_pk, sk, b_sk, trace___indcpa_keypair);
  }
  proc __indcpa_enc (ct:BArray1568.t, b_ct:BArray1568.t, msgp:BArray32.t,
                     b_msgp:BArray32.t, pk:BArray1568.t, b_pk:BArray1568.t,
                     noiseseed:BArray32.t, b_noiseseed:BArray32.t) : 
  BArray1568.t * BArray1568.t * trace = {
    var aux_5:BArray160.t;
    var aux_6:BArray160.t;
    var aux:BArray2048.t;
    var aux_0:BArray2048.t;
    var aux_1:BArray512.t;
    var aux_2:BArray512.t;
    var aux_3:BArray8192.t;
    var aux_4:BArray8192.t;
    var s_ct:BArray1568.t;
    var pkpv:BArray2048.t;
    var w:int;
    var t64:W64.t;
    var publicseed:BArray32.t;
    var k:BArray512.t;
    var s_noiseseed:BArray32.t;
    var transposed:W64.t;
    var aat:BArray8192.t;
    var lnoiseseed:BArray32.t;
    var nonce:W8.t;
    var sp_0:BArray2048.t;
    var ep:BArray2048.t;
    var epp:BArray512.t;
    var bp:BArray2048.t;
    var v:BArray512.t;
    var param:BArray1536.t;
    var result:BArray2048.t;
    var param_0:BArray32.t;
    var param_1:BArray512.t;
    var result_0:BArray512.t;
    var param_2:W64.t;
    var param_3:BArray32.t;
    var result_1:BArray8192.t;
    var param_4:W8.t;
    var param_5:BArray32.t;
    var param_6:BArray512.t;
    var result_2:BArray512.t;
    var param_7:W8.t;
    var param_8:BArray32.t;
    var param_9:BArray512.t;
    var result_3:BArray512.t;
    var param_10:W8.t;
    var param_11:BArray32.t;
    var param_12:BArray512.t;
    var result_4:BArray512.t;
    var param_13:BArray2048.t;
    var result_5:BArray2048.t;
    var param_14:BArray2048.t;
    var param_15:BArray2048.t;
    var result_6:BArray512.t;
    var param_16:BArray2048.t;
    var param_17:BArray2048.t;
    var result_7:BArray512.t;
    var param_18:BArray2048.t;
    var result_8:BArray2048.t;
    var param_19:BArray512.t;
    var result_9:BArray512.t;
    var param_20:BArray2048.t;
    var param_21:BArray2048.t;
    var result_10:BArray2048.t;
    var param_22:BArray512.t;
    var param_23:BArray512.t;
    var result_11:BArray512.t;
    var param_24:BArray512.t;
    var param_25:BArray512.t;
    var result_12:BArray512.t;
    var param_26:BArray2048.t;
    var result_13:BArray2048.t;
    var param_27:BArray512.t;
    var result_14:BArray512.t;
    var param_28:BArray2048.t;
    var param_29:BArray1408.t;
    var result_15:BArray1408.t;
    var param_30:BArray512.t;
    var param_31:BArray160.t;
    var result_16:BArray512.t;
    var result_17:BArray160.t;
    var b_result:BArray512.t;
    var b_result_0:BArray160.t;
    var b_param:BArray160.t;
    var b_result_1:BArray1408.t;
    var b_param_0:BArray1408.t;
    var b_bp:BArray2048.t;
    var b_s_ct:BArray1568.t;
    var b_result_2:BArray512.t;
    var b_result_3:BArray2048.t;
    var b_result_4:BArray512.t;
    var b_k:BArray512.t;
    var b_result_5:BArray512.t;
    var b_epp:BArray512.t;
    var b_result_6:BArray2048.t;
    var b_param_1:BArray2048.t;
    var b_ep:BArray2048.t;
    var b_result_7:BArray512.t;
    var b_result_8:BArray2048.t;
    var b_param_2:BArray2048.t;
    var b_result_9:BArray512.t;
    var b_sp:BArray2048.t;
    var b_result_10:BArray512.t;
    var b_param_3:BArray2048.t;
    var b_aat:BArray8192.t;
    var b_result_11:BArray2048.t;
    var b_param_4:BArray2048.t;
    var b_result_12:BArray512.t;
    var b_param_5:BArray512.t;
    var b_result_13:BArray512.t;
    var b_param_6:BArray512.t;
    var b_result_14:BArray512.t;
    var b_param_7:BArray512.t;
    var b_result_15:BArray8192.t;
    var b_param_8:BArray32.t;
    var b_publicseed:BArray32.t;
    var b_result_16:BArray512.t;
    var b_param_9:BArray512.t;
    var b_result_17:BArray2048.t;
    var b_param_10:BArray1536.t;
    var trace___indcpa_enc:trace;
    aat <- witness;
    b_aat <- witness;
    b_bp <- witness;
    b_ep <- witness;
    b_epp <- witness;
    b_k <- witness;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_param_3 <- witness;
    b_param_4 <- witness;
    b_param_5 <- witness;
    b_param_6 <- witness;
    b_param_7 <- witness;
    b_param_8 <- witness;
    b_param_9 <- witness;
    b_param_10 <- witness;
    b_publicseed <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    b_result_5 <- witness;
    b_result_6 <- witness;
    b_result_7 <- witness;
    b_result_8 <- witness;
    b_result_9 <- witness;
    b_result_10 <- witness;
    b_result_11 <- witness;
    b_result_12 <- witness;
    b_result_13 <- witness;
    b_result_14 <- witness;
    b_result_15 <- witness;
    b_result_16 <- witness;
    b_result_17 <- witness;
    b_s_ct <- witness;
    b_sp <- witness;
    bp <- witness;
    ep <- witness;
    epp <- witness;
    k <- witness;
    lnoiseseed <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_3 <- witness;
    param_5 <- witness;
    param_6 <- witness;
    param_8 <- witness;
    param_9 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    param_13 <- witness;
    param_14 <- witness;
    param_15 <- witness;
    param_16 <- witness;
    param_17 <- witness;
    param_18 <- witness;
    param_19 <- witness;
    param_20 <- witness;
    param_21 <- witness;
    param_22 <- witness;
    param_23 <- witness;
    param_24 <- witness;
    param_25 <- witness;
    param_26 <- witness;
    param_27 <- witness;
    param_28 <- witness;
    param_29 <- witness;
    param_30 <- witness;
    param_31 <- witness;
    pkpv <- witness;
    publicseed <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_3 <- witness;
    result_4 <- witness;
    result_5 <- witness;
    result_6 <- witness;
    result_7 <- witness;
    result_8 <- witness;
    result_9 <- witness;
    result_10 <- witness;
    result_11 <- witness;
    result_12 <- witness;
    result_13 <- witness;
    result_14 <- witness;
    result_15 <- witness;
    result_16 <- witness;
    result_17 <- witness;
    s_ct <- witness;
    s_noiseseed <- witness;
    sp_0 <- witness;
    v <- witness;
    trace___indcpa_enc <- [];
    trace___indcpa_enc <-
    (trace___indcpa_enc ++
    [(Assert,
     (((BArray32.is_init b_msgp 0 32) /\ (BArray1568.is_init b_pk 0 1568)) /\
     (BArray32.is_init b_noiseseed 0 32)))]);
    b_publicseed <- (BArray32.init_arr (W8.of_int 0));
    b_k <- (BArray512.init_arr (W8.of_int 0));
    b_epp <- (BArray512.init_arr (W8.of_int 0));
    b_sp <- (BArray2048.init_arr (W8.of_int 0));
    b_ep <- (BArray2048.init_arr (W8.of_int 0));
    b_bp <- (BArray2048.init_arr (W8.of_int 0));
    b_s_ct <- b_ct;
    s_ct <- ct;
    b_param_10 <- (SBArray1568_1536.get_sub8 b_pk 0);
    param <- (SBArray1568_1536.get_sub8 pk 0);
    (aux, aux_0, tmp__trace) <@ __i_polyvec_frombytes (param, b_param_10);
    result <- aux;
    b_result_17 <- aux_0;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++
    [(Assert, (BArray2048.is_init b_result_17 0 2048))]);
    pkpv <- result;
    w <- 0;
    while ((w < 4)) {
      trace___indcpa_enc <-
      (trace___indcpa_enc ++
      [(Assert, ((0 <= ((192 + w) * 8)) /\ ((((192 + w) * 8) + 8) <= 1568)))]);
      t64 <- (BArray1568.get64d pk ((192 + w) * 8));
      (* Erased call to declassify *)
      trace___indcpa_enc <-
      (trace___indcpa_enc ++
      [(Assert, ((0 <= (w * 8)) /\ (((w * 8) + 8) <= 32)))]);
      b_publicseed <-
      (BArray32.set64d b_publicseed (w * 8) (W64.of_int 18446744073709551615)
      );
      publicseed <- (BArray32.set64 publicseed w t64);
      w <- (w + 1);
    }
    b_param_9 <- b_k;
    param_1 <- k;
    param_0 <- msgp;
    (aux_1, aux_2, tmp__trace) <@ _i_poly_frommsg (param_1, b_param_9,
    param_0, (BArray32.init_arr (W8.of_int 255)));
    result_0 <- aux_1;
    b_result_16 <- aux_2;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++ [(Assert, (BArray512.is_init b_result_16 0 512))]);
    k <- result_0;
    s_noiseseed <- noiseseed;
    transposed <- (W64.of_int 1);
    b_param_8 <- b_publicseed;
    param_3 <- publicseed;
    param_2 <- transposed;
    (aux_3, aux_4, tmp__trace) <@ __gen_matrix (param_3, b_param_8, param_2);
    result_1 <- aux_3;
    b_result_15 <- aux_4;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++
    [(Assert, (BArray8192.is_init b_result_15 0 8192))]);
    b_aat <- (BArray8192.init_arr (W8.of_int 255));
    aat <- result_1;
    lnoiseseed <- s_noiseseed;
    w <- 0;
    while ((w < 4)) {
      nonce <- (W8.of_int w);
      trace___indcpa_enc <-
      (trace___indcpa_enc ++
      [(Assert,
       ((0 <= ((256 * w) * 2)) /\ ((((256 * w) * 2) + 512) <= 2048)))]);
      trace___indcpa_enc <-
      (trace___indcpa_enc ++
      [(Assert,
       ((0 <= ((w * 256) * 2)) /\ ((((w * 256) * 2) + 512) <= 2048)))]);
      b_param_7 <- (SBArray2048_512.get_sub16 b_sp (w * 256));
      param_6 <- (SBArray2048_512.get_sub16 sp_0 (w * 256));
      param_5 <- lnoiseseed;
      param_4 <- nonce;
      (aux_1, aux_2, tmp__trace) <@ _poly_getnoise (param_6, b_param_7,
      param_5, (BArray32.init_arr (W8.of_int 255)), param_4);
      result_2 <- aux_1;
      b_result_14 <- aux_2;
      trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
      trace___indcpa_enc <-
      (trace___indcpa_enc ++
      [(Assert, (BArray512.is_init b_result_14 0 512))]);
      b_sp <-
      (SBArray2048_512.set_sub16 b_sp (256 * w)
      (BArray512.init_arr (W8.of_int 255)));
      sp_0 <- (SBArray2048_512.set_sub16 sp_0 (256 * w) result_2);
      w <- (w + 1);
    }
    lnoiseseed <- s_noiseseed;
    w <- 0;
    while ((w < 4)) {
      nonce <- (W8.of_int (4 + w));
      trace___indcpa_enc <-
      (trace___indcpa_enc ++
      [(Assert,
       ((0 <= ((256 * w) * 2)) /\ ((((256 * w) * 2) + 512) <= 2048)))]);
      trace___indcpa_enc <-
      (trace___indcpa_enc ++
      [(Assert,
       ((0 <= ((w * 256) * 2)) /\ ((((w * 256) * 2) + 512) <= 2048)))]);
      b_param_6 <- (SBArray2048_512.get_sub16 b_ep (w * 256));
      param_9 <- (SBArray2048_512.get_sub16 ep (w * 256));
      param_8 <- lnoiseseed;
      param_7 <- nonce;
      (aux_1, aux_2, tmp__trace) <@ _poly_getnoise (param_9, b_param_6,
      param_8, (BArray32.init_arr (W8.of_int 255)), param_7);
      result_3 <- aux_1;
      b_result_13 <- aux_2;
      trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
      trace___indcpa_enc <-
      (trace___indcpa_enc ++
      [(Assert, (BArray512.is_init b_result_13 0 512))]);
      b_ep <-
      (SBArray2048_512.set_sub16 b_ep (256 * w)
      (BArray512.init_arr (W8.of_int 255)));
      ep <- (SBArray2048_512.set_sub16 ep (256 * w) result_3);
      w <- (w + 1);
    }
    nonce <- (W8.of_int 8);
    b_param_5 <- b_epp;
    param_12 <- epp;
    param_11 <- lnoiseseed;
    param_10 <- nonce;
    (aux_1, aux_2, tmp__trace) <@ _poly_getnoise (param_12, b_param_5,
    param_11, (BArray32.init_arr (W8.of_int 255)), param_10);
    result_4 <- aux_1;
    b_result_12 <- aux_2;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++ [(Assert, (BArray512.is_init b_result_12 0 512))]);
    epp <- result_4;
    b_param_4 <- b_sp;
    param_13 <- sp_0;
    (aux, aux_0, tmp__trace) <@ __polyvec_ntt (param_13, b_param_4);
    result_5 <- aux;
    b_result_11 <- aux_0;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++
    [(Assert, (BArray2048.is_init b_result_11 0 2048))]);
    sp_0 <- result_5;
    w <- 0;
    while ((w < 4)) {
      trace___indcpa_enc <-
      (trace___indcpa_enc ++
      [(Assert,
       ((0 <= ((w * 256) * 2)) /\ ((((w * 256) * 2) + 512) <= 2048)))]);
      trace___indcpa_enc <-
      (trace___indcpa_enc ++
      [(Assert,
       ((0 <= ((w * 1024) * 2)) /\ ((((w * 1024) * 2) + 2048) <= 8192)))]);
      b_param_3 <- (SBArray8192_2048.get_sub16 b_aat (w * 1024));
      param_15 <- (SBArray8192_2048.get_sub16 aat (w * 1024));
      param_14 <- sp_0;
      (aux_1, aux_2, tmp__trace) <@ __polyvec_pointwise_acc (param_15,
      b_param_3, param_14, (BArray2048.init_arr (W8.of_int 255)));
      result_6 <- aux_1;
      b_result_10 <- aux_2;
      trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
      trace___indcpa_enc <-
      (trace___indcpa_enc ++
      [(Assert, (BArray512.is_init b_result_10 0 512))]);
      b_bp <-
      (SBArray2048_512.set_sub16 b_bp (w * 256)
      (BArray512.init_arr (W8.of_int 255)));
      bp <- (SBArray2048_512.set_sub16 bp (w * 256) result_6);
      w <- (w + 1);
    }
    param_17 <- pkpv;
    param_16 <- sp_0;
    (aux_1, aux_2, tmp__trace) <@ __polyvec_pointwise_acc (param_17,
    (BArray2048.init_arr (W8.of_int 255)), param_16,
    (BArray2048.init_arr (W8.of_int 255)));
    result_7 <- aux_1;
    b_result_9 <- aux_2;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++ [(Assert, (BArray512.is_init b_result_9 0 512))]);
    v <- result_7;
    b_param_2 <- b_bp;
    param_18 <- bp;
    (aux, aux_0, tmp__trace) <@ __polyvec_invntt (param_18, b_param_2);
    result_8 <- aux;
    b_result_8 <- aux_0;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++
    [(Assert, (BArray2048.is_init b_result_8 0 2048))]);
    bp <- result_8;
    param_19 <- v;
    (aux_1, aux_2, tmp__trace) <@ _poly_invntt (param_19,
    (BArray512.init_arr (W8.of_int 255)));
    result_9 <- aux_1;
    b_result_7 <- aux_2;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++ [(Assert, (BArray512.is_init b_result_7 0 512))]);
    v <- result_9;
    param_21 <- bp;
    b_param_1 <- b_ep;
    param_20 <- ep;
    (aux, aux_0, tmp__trace) <@ __polyvec_add2 (param_21,
    (BArray2048.init_arr (W8.of_int 255)), param_20, b_param_1);
    result_10 <- aux;
    b_result_6 <- aux_0;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++
    [(Assert, (BArray2048.is_init b_result_6 0 2048))]);
    bp <- result_10;
    param_23 <- v;
    param_22 <- epp;
    (aux_1, aux_2, tmp__trace) <@ _poly_add2 (param_23,
    (BArray512.init_arr (W8.of_int 255)), param_22,
    (BArray512.init_arr (W8.of_int 255)));
    result_11 <- aux_1;
    b_result_5 <- aux_2;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++ [(Assert, (BArray512.is_init b_result_5 0 512))]);
    v <- result_11;
    param_25 <- v;
    param_24 <- k;
    (aux_1, aux_2, tmp__trace) <@ _poly_add2 (param_25,
    (BArray512.init_arr (W8.of_int 255)), param_24,
    (BArray512.init_arr (W8.of_int 255)));
    result_12 <- aux_1;
    b_result_4 <- aux_2;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++ [(Assert, (BArray512.is_init b_result_4 0 512))]);
    v <- result_12;
    param_26 <- bp;
    (aux, aux_0, tmp__trace) <@ __polyvec_reduce (param_26,
    (BArray2048.init_arr (W8.of_int 255)));
    result_13 <- aux;
    b_result_3 <- aux_0;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++
    [(Assert, (BArray2048.is_init b_result_3 0 2048))]);
    bp <- result_13;
    param_27 <- v;
    (aux_1, aux_2, tmp__trace) <@ __poly_reduce (param_27,
    (BArray512.init_arr (W8.of_int 255)));
    result_14 <- aux_1;
    b_result_2 <- aux_2;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++ [(Assert, (BArray512.is_init b_result_2 0 512))]);
    v <- result_14;
    b_ct <- b_s_ct;
    ct <- s_ct;
    b_param_0 <- (SBArray1568_1408.get_sub8 b_ct 0);
    param_29 <- (SBArray1568_1408.get_sub8 ct 0);
    param_28 <- bp;
    (result_15, b_result_1, tmp__trace) <@ __i_polyvec_compress (param_29,
    b_param_0, param_28, (BArray2048.init_arr (W8.of_int 255)));
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++
    [(Assert, (BArray1408.is_init b_result_1 0 1408))]);
    b_ct <-
    (SBArray1568_1408.set_sub8 b_ct 0 (BArray1408.init_arr (W8.of_int 255)));
    ct <- (SBArray1568_1408.set_sub8 ct 0 result_15);
    b_param <- (SBArray1568_160.get_sub8 b_ct 1408);
    param_31 <- (SBArray1568_160.get_sub8 ct 1408);
    param_30 <- v;
    (aux_5, aux_6, aux_1, aux_2, tmp__trace) <@ _i_poly_compress (param_31,
    b_param, param_30, (BArray512.init_arr (W8.of_int 255)));
    result_17 <- aux_5;
    b_result_0 <- aux_6;
    result_16 <- aux_1;
    b_result <- aux_2;
    trace___indcpa_enc <- (trace___indcpa_enc ++ tmp__trace);
    trace___indcpa_enc <-
    (trace___indcpa_enc ++
    [(Assert,
     ((BArray160.is_init b_result_0 0 160) /\
     (BArray512.is_init b_result 0 512)))]);
    b_ct <-
    (SBArray1568_160.set_sub8 b_ct 1408 (BArray160.init_arr (W8.of_int 255)));
    ct <- (SBArray1568_160.set_sub8 ct 1408 result_17);
    return (ct, b_ct, trace___indcpa_enc);
  }
  proc __indcpa_dec (msgp:BArray32.t, b_msgp:BArray32.t, ct:BArray1568.t,
                     b_ct:BArray1568.t, sk:BArray1536.t, b_sk:BArray1536.t) : 
  BArray32.t * BArray32.t * trace = {
    var aux:BArray2048.t;
    var aux_0:BArray2048.t;
    var aux_3:BArray32.t;
    var aux_4:BArray32.t;
    var aux_1:BArray512.t;
    var aux_2:BArray512.t;
    var bp:BArray2048.t;
    var v:BArray512.t;
    var skpv:BArray2048.t;
    var t:BArray512.t;
    var mp:BArray512.t;
    var param:BArray1408.t;
    var param_0:BArray2048.t;
    var result:BArray2048.t;
    var param_1:BArray160.t;
    var param_2:BArray512.t;
    var result_0:BArray512.t;
    var param_3:BArray1536.t;
    var result_1:BArray2048.t;
    var param_4:BArray2048.t;
    var result_2:BArray2048.t;
    var param_5:BArray2048.t;
    var param_6:BArray2048.t;
    var result_3:BArray512.t;
    var param_7:BArray512.t;
    var result_4:BArray512.t;
    var param_8:BArray512.t;
    var param_9:BArray512.t;
    var param_10:BArray512.t;
    var result_5:BArray512.t;
    var param_11:BArray512.t;
    var result_6:BArray512.t;
    var param_12:BArray512.t;
    var param_13:BArray32.t;
    var result_7:BArray512.t;
    var result_8:BArray32.t;
    var b_mp:BArray512.t;
    var b_result:BArray512.t;
    var b_result_0:BArray32.t;
    var b_param:BArray32.t;
    var b_result_1:BArray512.t;
    var b_result_2:BArray512.t;
    var b_param_0:BArray512.t;
    var b_v:BArray512.t;
    var b_result_3:BArray512.t;
    var b_result_4:BArray512.t;
    var b_bp:BArray2048.t;
    var b_result_5:BArray2048.t;
    var b_result_6:BArray2048.t;
    var b_result_7:BArray512.t;
    var b_param_1:BArray160.t;
    var b_param_2:BArray512.t;
    var b_result_8:BArray2048.t;
    var b_param_3:BArray1408.t;
    var b_param_4:BArray2048.t;
    var trace___indcpa_dec:trace;
    b_bp <- witness;
    b_mp <- witness;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_param_3 <- witness;
    b_param_4 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    b_result_5 <- witness;
    b_result_6 <- witness;
    b_result_7 <- witness;
    b_result_8 <- witness;
    b_v <- witness;
    bp <- witness;
    mp <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    param_8 <- witness;
    param_9 <- witness;
    param_10 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    param_13 <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_3 <- witness;
    result_4 <- witness;
    result_5 <- witness;
    result_6 <- witness;
    result_7 <- witness;
    result_8 <- witness;
    skpv <- witness;
    t <- witness;
    v <- witness;
    trace___indcpa_dec <- [];
    trace___indcpa_dec <-
    (trace___indcpa_dec ++
    [(Assert,
     ((BArray1568.is_init b_ct 0 1568) /\ (BArray1536.is_init b_sk 0 1536)))]);
    b_v <- (BArray512.init_arr (W8.of_int 0));
    b_mp <- (BArray512.init_arr (W8.of_int 0));
    b_bp <- (BArray2048.init_arr (W8.of_int 0));
    b_param_4 <- b_bp;
    param_0 <- bp;
    b_param_3 <- (SBArray1568_1408.get_sub8 b_ct 0);
    param <- (SBArray1568_1408.get_sub8 ct 0);
    (aux, aux_0, tmp__trace) <@ __i_polyvec_decompress (param_0, b_param_4,
    param, b_param_3);
    result <- aux;
    b_result_8 <- aux_0;
    trace___indcpa_dec <- (trace___indcpa_dec ++ tmp__trace);
    trace___indcpa_dec <-
    (trace___indcpa_dec ++
    [(Assert, (BArray2048.is_init b_result_8 0 2048))]);
    bp <- result;
    b_param_2 <- b_v;
    param_2 <- v;
    b_param_1 <- (SBArray1568_160.get_sub8 b_ct 1408);
    param_1 <- (SBArray1568_160.get_sub8 ct 1408);
    (aux_1, aux_2, tmp__trace) <@ _i_poly_decompress (param_2, b_param_2,
    param_1, b_param_1);
    result_0 <- aux_1;
    b_result_7 <- aux_2;
    trace___indcpa_dec <- (trace___indcpa_dec ++ tmp__trace);
    trace___indcpa_dec <-
    (trace___indcpa_dec ++ [(Assert, (BArray512.is_init b_result_7 0 512))]);
    v <- result_0;
    param_3 <- sk;
    (aux, aux_0, tmp__trace) <@ __i_polyvec_frombytes (param_3,
    (BArray1536.init_arr (W8.of_int 255)));
    result_1 <- aux;
    b_result_6 <- aux_0;
    trace___indcpa_dec <- (trace___indcpa_dec ++ tmp__trace);
    trace___indcpa_dec <-
    (trace___indcpa_dec ++
    [(Assert, (BArray2048.is_init b_result_6 0 2048))]);
    skpv <- result_1;
    param_4 <- bp;
    (aux, aux_0, tmp__trace) <@ __polyvec_ntt (param_4,
    (BArray2048.init_arr (W8.of_int 255)));
    result_2 <- aux;
    b_result_5 <- aux_0;
    trace___indcpa_dec <- (trace___indcpa_dec ++ tmp__trace);
    trace___indcpa_dec <-
    (trace___indcpa_dec ++
    [(Assert, (BArray2048.is_init b_result_5 0 2048))]);
    bp <- result_2;
    param_6 <- skpv;
    param_5 <- bp;
    (aux_1, aux_2, tmp__trace) <@ __polyvec_pointwise_acc (param_6,
    (BArray2048.init_arr (W8.of_int 255)), param_5,
    (BArray2048.init_arr (W8.of_int 255)));
    result_3 <- aux_1;
    b_result_4 <- aux_2;
    trace___indcpa_dec <- (trace___indcpa_dec ++ tmp__trace);
    trace___indcpa_dec <-
    (trace___indcpa_dec ++ [(Assert, (BArray512.is_init b_result_4 0 512))]);
    t <- result_3;
    param_7 <- t;
    (aux_1, aux_2, tmp__trace) <@ _poly_invntt (param_7,
    (BArray512.init_arr (W8.of_int 255)));
    result_4 <- aux_1;
    b_result_3 <- aux_2;
    trace___indcpa_dec <- (trace___indcpa_dec ++ tmp__trace);
    trace___indcpa_dec <-
    (trace___indcpa_dec ++ [(Assert, (BArray512.is_init b_result_3 0 512))]);
    t <- result_4;
    b_param_0 <- b_mp;
    param_10 <- mp;
    param_9 <- v;
    param_8 <- t;
    (aux_1, aux_2, tmp__trace) <@ _poly_sub (param_10, b_param_0, param_9,
    (BArray512.init_arr (W8.of_int 255)), param_8,
    (BArray512.init_arr (W8.of_int 255)));
    result_5 <- aux_1;
    b_result_2 <- aux_2;
    trace___indcpa_dec <- (trace___indcpa_dec ++ tmp__trace);
    trace___indcpa_dec <-
    (trace___indcpa_dec ++ [(Assert, (BArray512.is_init b_result_2 0 512))]);
    mp <- result_5;
    param_11 <- mp;
    (aux_1, aux_2, tmp__trace) <@ __poly_reduce (param_11,
    (BArray512.init_arr (W8.of_int 255)));
    result_6 <- aux_1;
    b_result_1 <- aux_2;
    trace___indcpa_dec <- (trace___indcpa_dec ++ tmp__trace);
    trace___indcpa_dec <-
    (trace___indcpa_dec ++ [(Assert, (BArray512.is_init b_result_1 0 512))]);
    mp <- result_6;
    b_param <- b_msgp;
    param_13 <- msgp;
    param_12 <- mp;
    (aux_3, aux_4, aux_1, aux_2, tmp__trace) <@ _i_poly_tomsg (param_13,
    b_param, param_12, (BArray512.init_arr (W8.of_int 255)));
    result_8 <- aux_3;
    b_result_0 <- aux_4;
    result_7 <- aux_1;
    b_result <- aux_2;
    trace___indcpa_dec <- (trace___indcpa_dec ++ tmp__trace);
    trace___indcpa_dec <-
    (trace___indcpa_dec ++
    [(Assert,
     ((BArray32.is_init b_result_0 0 32) /\
     (BArray512.is_init b_result 0 512)))]);
    msgp <- result_8;
    b_msgp <- (BArray32.init_arr (W8.of_int 255));
    return (msgp, b_msgp, trace___indcpa_dec);
  }
  proc __verify (ctp:BArray1568.t, b_ctp:BArray1568.t, ctpc:BArray1568.t,
                 b_ctpc:BArray1568.t) : W64.t * trace = {
    var cnd:W64.t;
    var i:int;
    var t1:W8.t;
    var t2:W8.t;
    var t64:W64.t;
    var trace___verify:trace;
    trace___verify <- [];
    trace___verify <-
    (trace___verify ++ [(Assert, (BArray1568.is_init b_ctp 0 1568))]);
    trace___verify <-
    (trace___verify ++ [(Assert, (BArray1568.is_init b_ctpc 0 1568))]);
    cnd <- (W64.of_int 0);
    i <- 0;
    while ((i < 1568)) {
      trace___verify <-
      (trace___verify ++ [(Assert, ((0 <= i) /\ ((i + 1) <= 1568)))]);
      t1 <- (BArray1568.get8d ctpc i);
      trace___verify <-
      (trace___verify ++ [(Assert, ((0 <= i) /\ ((i + 1) <= 1568)))]);
      t2 <- (BArray1568.get8 ctp i);
      t1 <- (t1 `^` t2);
      t64 <- (zeroextu64 t1);
      cnd <- (cnd `|` t64);
      i <- (i + 1);
    }
    cnd <- (- cnd);
    cnd <- (cnd `>>` (W8.of_int 63));
    return (cnd, trace___verify);
  }
  proc __cmov (dst:BArray32.t, b_dst:BArray32.t, src:BArray32.t,
               b_src:BArray32.t, cnd:W64.t) : BArray32.t * BArray32.t * trace = {
    var i:int;
    var t2:W8.t;
    var t1:W8.t;
    var trace___cmov:trace;
    trace___cmov <- [];
    trace___cmov <-
    (trace___cmov ++ [(Assert, (BArray32.is_init b_dst 0 32))]);
    trace___cmov <-
    (trace___cmov ++ [(Assert, (BArray32.is_init b_src 0 32))]);
    cnd <- (- cnd);
    i <- 0;
    while ((i < 32)) {
      trace___cmov <-
      (trace___cmov ++ [(Assert, ((0 <= i) /\ ((i + 1) <= 32)))]);
      t2 <- (BArray32.get8 dst i);
      trace___cmov <-
      (trace___cmov ++ [(Assert, ((0 <= i) /\ ((i + 1) <= 32)))]);
      t1 <- (BArray32.get8d src i);
      t2 <- (t2 `^` t1);
      t2 <- (t2 `&` (truncateu8 cnd));
      t1 <- (t1 `^` t2);
      trace___cmov <-
      (trace___cmov ++ [(Assert, ((0 <= i) /\ ((i + 1) <= 32)))]);
      dst <- (BArray32.set8 dst i t1);
      i <- (i + 1);
    }
    b_dst <- (BArray32.init_arr (W8.of_int 255));
    return (dst, b_dst, trace___cmov);
  }
  proc __crypto_kem_keypair_jazz (pk:BArray1568.t, b_pk:BArray1568.t,
                                  sk:BArray3168.t, b_sk:BArray3168.t,
                                  randomnessp:BArray64.t,
                                  b_randomnessp:BArray64.t) : BArray1568.t *
                                                              BArray1568.t *
                                                              BArray3168.t *
                                                              BArray3168.t *
                                                              trace = {
    var s_randomnessp:BArray64.t;
    var randomnessp1:BArray32.t;
    var icsk:BArray1536.t;
    var s_skp:BArray3168.t;
    var i:int;
    var t64:W64.t;
    var h_pk:BArray32.t;
    var randomnessp2:BArray32.t;
    var param:BArray32.t;
    var param_0:BArray1536.t;
    var param_1:BArray1568.t;
    var result:BArray1536.t;
    var result_0:BArray1568.t;
    var param_2:BArray1568.t;
    var param_3:BArray32.t;
    var result_1:BArray32.t;
    var b_randomnessp2:BArray32.t;
    var b_h_pk:BArray32.t;
    var b_s_skp:BArray3168.t;
    var b_result:BArray32.t;
    var b_param:BArray32.t;
    var b_icsk:BArray1536.t;
    var b_result_0:BArray1536.t;
    var b_result_1:BArray1568.t;
    var b_param_0:BArray32.t;
    var b_param_1:BArray1536.t;
    var b_param_2:BArray1568.t;
    var b_randomnessp1:BArray32.t;
    var trace___crypto_kem_keypair_jazz:trace;
    b_h_pk <- witness;
    b_icsk <- witness;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_randomnessp1 <- witness;
    b_randomnessp2 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_s_skp <- witness;
    h_pk <- witness;
    icsk <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    param_3 <- witness;
    randomnessp1 <- witness;
    randomnessp2 <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    s_randomnessp <- witness;
    s_skp <- witness;
    trace___crypto_kem_keypair_jazz <- [];
    trace___crypto_kem_keypair_jazz <-
    (trace___crypto_kem_keypair_jazz ++
    [(Assert, (BArray64.is_init b_randomnessp 0 64))]);
    b_h_pk <- (BArray32.init_arr (W8.of_int 0));
    s_randomnessp <- randomnessp;
    b_randomnessp1 <- (SBArray64_32.get_sub8 b_randomnessp 0);
    randomnessp1 <- (SBArray64_32.get_sub8 randomnessp 0);
    b_icsk <- (SBArray3168_1536.get_sub8 b_sk 0);
    icsk <- (SBArray3168_1536.get_sub8 sk 0);
    b_s_skp <- b_sk;
    s_skp <- sk;
    b_param_2 <- b_pk;
    param_1 <- pk;
    b_param_1 <- b_icsk;
    param_0 <- icsk;
    b_param_0 <- b_randomnessp1;
    param <- randomnessp1;
    (result_0, b_result_1, result, b_result_0, tmp__trace) <@ __indcpa_keypair (
    param_1, b_param_2, param_0, b_param_1, param, b_param_0);
    trace___crypto_kem_keypair_jazz <-
    (trace___crypto_kem_keypair_jazz ++ tmp__trace);
    trace___crypto_kem_keypair_jazz <-
    (trace___crypto_kem_keypair_jazz ++
    [(Assert,
     ((BArray1568.is_init b_result_1 0 1568) /\
     (BArray1536.is_init b_result_0 0 1536)))]);
    pk <- result_0;
    icsk <- result;
    b_sk <- b_s_skp;
    sk <- s_skp;
    b_sk <-
    (SBArray3168_1536.set_sub8 b_sk 0 (BArray1536.init_arr (W8.of_int 255)));
    sk <- (SBArray3168_1536.set_sub8 sk 0 icsk);
    i <- 0;
    while ((i < 196)) {
      trace___crypto_kem_keypair_jazz <-
      (trace___crypto_kem_keypair_jazz ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 1568)))]);
      t64 <- (BArray1568.get64 pk i);
      trace___crypto_kem_keypair_jazz <-
      (trace___crypto_kem_keypair_jazz ++
      [(Assert, ((0 <= ((192 + i) * 8)) /\ ((((192 + i) * 8) + 8) <= 3168)))]);
      b_sk <-
      (BArray3168.set64d b_sk ((192 + i) * 8)
      (W64.of_int 18446744073709551615));
      sk <- (BArray3168.set64d sk ((192 + i) * 8) t64);
      i <- (i + 1);
    }
    b_s_skp <- b_sk;
    s_skp <- sk;
    b_param <- b_h_pk;
    param_3 <- h_pk;
    param_2 <- pk;
    (result_1, b_result, tmp__trace) <@ _sha3_256A_A1568 (param_3, b_param,
    param_2, (BArray1568.init_arr (W8.of_int 255)));
    trace___crypto_kem_keypair_jazz <-
    (trace___crypto_kem_keypair_jazz ++ tmp__trace);
    trace___crypto_kem_keypair_jazz <-
    (trace___crypto_kem_keypair_jazz ++
    [(Assert, (BArray32.is_init b_result 0 32))]);
    h_pk <- result_1;
    b_sk <- b_s_skp;
    sk <- s_skp;
    i <- 0;
    while ((i < 4)) {
      trace___crypto_kem_keypair_jazz <-
      (trace___crypto_kem_keypair_jazz ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 32)))]);
      t64 <- (BArray32.get64 h_pk i);
      trace___crypto_kem_keypair_jazz <-
      (trace___crypto_kem_keypair_jazz ++
      [(Assert, ((0 <= ((388 + i) * 8)) /\ ((((388 + i) * 8) + 8) <= 3168)))]);
      b_sk <-
      (BArray3168.set64d b_sk ((388 + i) * 8)
      (W64.of_int 18446744073709551615));
      sk <- (BArray3168.set64d sk ((388 + i) * 8) t64);
      i <- (i + 1);
    }
    b_randomnessp <- (BArray64.init_arr (W8.of_int 255));
    randomnessp <- s_randomnessp;
    b_randomnessp2 <- (SBArray64_32.get_sub8 b_randomnessp 32);
    randomnessp2 <- (SBArray64_32.get_sub8 randomnessp 32);
    i <- 0;
    while ((i < 4)) {
      trace___crypto_kem_keypair_jazz <-
      (trace___crypto_kem_keypair_jazz ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 32)))]);
      trace___crypto_kem_keypair_jazz <-
      (trace___crypto_kem_keypair_jazz ++
      [(Assert, (BArray32.is_init b_randomnessp2 (i * 8) 8))]);
      t64 <- (BArray32.get64d randomnessp2 (i * 8));
      trace___crypto_kem_keypair_jazz <-
      (trace___crypto_kem_keypair_jazz ++
      [(Assert, ((0 <= ((392 + i) * 8)) /\ ((((392 + i) * 8) + 8) <= 3168)))]);
      b_sk <-
      (BArray3168.set64d b_sk ((392 + i) * 8)
      (W64.of_int 18446744073709551615));
      sk <- (BArray3168.set64d sk ((392 + i) * 8) t64);
      i <- (i + 1);
    }
    b_pk <- (BArray1568.init_arr (W8.of_int 255));
    return (pk, b_pk, sk, b_sk, trace___crypto_kem_keypair_jazz);
  }
  proc __crypto_kem_enc_jazz (ct:BArray1568.t, b_ct:BArray1568.t,
                              shk:BArray32.t, b_shk:BArray32.t,
                              pk:BArray1568.t, b_pk:BArray1568.t,
                              randomnessp:BArray32.t,
                              b_randomnessp:BArray32.t) : BArray1568.t *
                                                          BArray1568.t *
                                                          BArray32.t *
                                                          BArray32.t * trace = {
    var s_pk:BArray1568.t;
    var s_shk:BArray32.t;
    var i:int;
    var t64:W64.t;
    var buf:BArray64.t;
    var kr:BArray64.t;
    var param:BArray1568.t;
    var param_0:BArray32.t;
    var result:BArray32.t;
    var param_1:BArray64.t;
    var param_2:BArray64.t;
    var result_0:BArray64.t;
    var param_3:BArray32.t;
    var param_4:BArray1568.t;
    var param_5:BArray32.t;
    var param_6:BArray1568.t;
    var result_1:BArray1568.t;
    var b_kr:BArray64.t;
    var b_s_shk:BArray32.t;
    var b_result:BArray1568.t;
    var b_param:BArray32.t;
    var b_param_0:BArray32.t;
    var b_param_1:BArray1568.t;
    var b_buf:BArray64.t;
    var b_result_0:BArray64.t;
    var b_param_2:BArray64.t;
    var b_param_3:BArray64.t;
    var b_result_1:BArray32.t;
    var b_param_4:BArray32.t;
    var trace___crypto_kem_enc_jazz:trace;
    b_buf <- witness;
    b_kr <- witness;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_param_3 <- witness;
    b_param_4 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_s_shk <- witness;
    buf <- witness;
    kr <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_6 <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    s_pk <- witness;
    s_shk <- witness;
    trace___crypto_kem_enc_jazz <- [];
    trace___crypto_kem_enc_jazz <-
    (trace___crypto_kem_enc_jazz ++
    [(Assert,
     ((BArray32.is_init b_randomnessp 0 32) /\
     (BArray1568.is_init b_pk 0 1568)))]);
    b_buf <- (BArray64.init_arr (W8.of_int 0));
    b_kr <- (BArray64.init_arr (W8.of_int 0));
    s_pk <- pk;
    b_s_shk <- b_shk;
    s_shk <- shk;
    i <- 0;
    while ((i < 4)) {
      trace___crypto_kem_enc_jazz <-
      (trace___crypto_kem_enc_jazz ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 32)))]);
      t64 <- (BArray32.get64 randomnessp i);
      trace___crypto_kem_enc_jazz <-
      (trace___crypto_kem_enc_jazz ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 64)))]);
      b_buf <-
      (BArray64.set64d b_buf (i * 8) (W64.of_int 18446744073709551615));
      buf <- (BArray64.set64 buf i t64);
      i <- (i + 1);
    }
    b_param_4 <- (SBArray64_32.get_sub8 b_buf 32);
    param_0 <- (SBArray64_32.get_sub8 buf 32);
    param <- pk;
    (result, b_result_1, tmp__trace) <@ _sha3_256A_A1568 (param_0, b_param_4,
    param, (BArray1568.init_arr (W8.of_int 255)));
    trace___crypto_kem_enc_jazz <-
    (trace___crypto_kem_enc_jazz ++ tmp__trace);
    trace___crypto_kem_enc_jazz <-
    (trace___crypto_kem_enc_jazz ++
    [(Assert, (BArray32.is_init b_result_1 0 32))]);
    b_buf <-
    (SBArray64_32.set_sub8 b_buf 32 (BArray32.init_arr (W8.of_int 255)));
    buf <- (SBArray64_32.set_sub8 buf 32 result);
    b_param_3 <- b_kr;
    param_2 <- kr;
    b_param_2 <- b_buf;
    param_1 <- buf;
    (result_0, b_result_0, tmp__trace) <@ _sha3_512A_A64 (param_2, b_param_3,
    param_1, b_param_2);
    trace___crypto_kem_enc_jazz <-
    (trace___crypto_kem_enc_jazz ++ tmp__trace);
    trace___crypto_kem_enc_jazz <-
    (trace___crypto_kem_enc_jazz ++
    [(Assert, (BArray64.is_init b_result_0 0 64))]);
    b_kr <- (BArray64.init_arr (W8.of_int 255));
    kr <- result_0;
    pk <- s_pk;
    b_param_1 <- b_ct;
    param_6 <- ct;
    b_param_0 <- (SBArray64_32.get_sub8 b_buf 0);
    param_5 <- (SBArray64_32.get_sub8 buf 0);
    param_4 <- pk;
    b_param <- (SBArray64_32.get_sub8 b_kr 32);
    param_3 <- (SBArray64_32.get_sub8 kr 32);
    (result_1, b_result, tmp__trace) <@ __indcpa_enc (param_6, b_param_1,
    param_5, b_param_0, param_4, (BArray1568.init_arr (W8.of_int 255)),
    param_3, b_param);
    trace___crypto_kem_enc_jazz <-
    (trace___crypto_kem_enc_jazz ++ tmp__trace);
    trace___crypto_kem_enc_jazz <-
    (trace___crypto_kem_enc_jazz ++
    [(Assert, (BArray1568.is_init b_result 0 1568))]);
    ct <- result_1;
    b_shk <- b_s_shk;
    shk <- s_shk;
    i <- 0;
    while ((i < 4)) {
      trace___crypto_kem_enc_jazz <-
      (trace___crypto_kem_enc_jazz ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 64)))]);
      t64 <- (BArray64.get64 kr i);
      trace___crypto_kem_enc_jazz <-
      (trace___crypto_kem_enc_jazz ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 32)))]);
      b_shk <-
      (BArray32.set64d b_shk (i * 8) (W64.of_int 18446744073709551615));
      shk <- (BArray32.set64 shk i t64);
      i <- (i + 1);
    }
    b_ct <- (BArray1568.init_arr (W8.of_int 255));
    return (ct, b_ct, shk, b_shk, trace___crypto_kem_enc_jazz);
  }
  proc __crypto_kem_dec_jazz (shk:BArray32.t, b_shk:BArray32.t,
                              ct:BArray1568.t, b_ct:BArray1568.t,
                              sk:BArray3168.t, b_sk:BArray3168.t) : BArray32.t *
                                                                    BArray32.t *
                                                                    trace = {
    var s_shk:BArray32.t;
    var s_ct:BArray1568.t;
    var s_sk:BArray3168.t;
    var buf:BArray64.t;
    var i:int;
    var t64:W64.t;
    var kr:BArray64.t;
    var ctc:BArray1568.t;
    var cnd:W64.t;
    var s_cnd:W64.t;
    var param:BArray1536.t;
    var param_0:BArray1568.t;
    var param_1:BArray32.t;
    var result:BArray32.t;
    var param_2:BArray64.t;
    var param_3:BArray64.t;
    var result_0:BArray64.t;
    var param_4:BArray32.t;
    var param_5:BArray1568.t;
    var param_6:BArray32.t;
    var param_7:BArray1568.t;
    var result_1:BArray1568.t;
    var param_8:BArray1568.t;
    var param_9:BArray1568.t;
    var result_2:W64.t;
    var param_10:BArray1568.t;
    var param_11:BArray32.t;
    var param_12:BArray32.t;
    var result_3:BArray32.t;
    var param_13:W64.t;
    var param_14:BArray32.t;
    var param_15:BArray32.t;
    var result_4:BArray32.t;
    var b_result:BArray32.t;
    var b_param:BArray32.t;
    var b_kr:BArray64.t;
    var b_result_0:BArray32.t;
    var b_param_0:BArray32.t;
    var b_param_1:BArray32.t;
    var b_s_sk:BArray3168.t;
    var b_s_shk:BArray32.t;
    var b_ctc:BArray1568.t;
    var b_result_1:BArray1568.t;
    var b_param_2:BArray32.t;
    var b_param_3:BArray1568.t;
    var b_param_4:BArray32.t;
    var b_param_5:BArray1568.t;
    var b_buf:BArray64.t;
    var b_result_2:BArray64.t;
    var b_param_6:BArray64.t;
    var b_param_7:BArray64.t;
    var b_result_3:BArray32.t;
    var b_param_8:BArray1536.t;
    var b_param_9:BArray32.t;
    var trace___crypto_kem_dec_jazz:trace;
    b_buf <- witness;
    b_ctc <- witness;
    b_kr <- witness;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_param_3 <- witness;
    b_param_4 <- witness;
    b_param_5 <- witness;
    b_param_6 <- witness;
    b_param_7 <- witness;
    b_param_8 <- witness;
    b_param_9 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_s_shk <- witness;
    b_s_sk <- witness;
    buf <- witness;
    ctc <- witness;
    kr <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    param_8 <- witness;
    param_9 <- witness;
    param_10 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    param_14 <- witness;
    param_15 <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_3 <- witness;
    result_4 <- witness;
    s_ct <- witness;
    s_shk <- witness;
    s_sk <- witness;
    trace___crypto_kem_dec_jazz <- [];
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++
    [(Assert,
     ((BArray1568.is_init b_ct 0 1568) /\ (BArray3168.is_init b_sk 0 3168)))]);
    b_buf <- (BArray64.init_arr (W8.of_int 0));
    b_kr <- (BArray64.init_arr (W8.of_int 0));
    b_ctc <- (BArray1568.init_arr (W8.of_int 0));
    b_s_shk <- b_shk;
    s_shk <- shk;
    s_ct <- ct;
    b_s_sk <- (BArray3168.init_arr (W8.of_int 255));
    s_sk <- sk;
    b_param_9 <- (SBArray64_32.get_sub8 b_buf 0);
    param_1 <- (SBArray64_32.get_sub8 buf 0);
    param_0 <- ct;
    b_param_8 <- (SBArray3168_1536.get_sub8 b_s_sk 0);
    param <- (SBArray3168_1536.get_sub8 s_sk 0);
    (result, b_result_3, tmp__trace) <@ __indcpa_dec (param_1, b_param_9,
    param_0, (BArray1568.init_arr (W8.of_int 255)), param, b_param_8);
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++ tmp__trace);
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++
    [(Assert, (BArray32.is_init b_result_3 0 32))]);
    b_buf <-
    (SBArray64_32.set_sub8 b_buf 0 (BArray32.init_arr (W8.of_int 255)));
    buf <- (SBArray64_32.set_sub8 buf 0 result);
    i <- 0;
    while ((i < 4)) {
      trace___crypto_kem_dec_jazz <-
      (trace___crypto_kem_dec_jazz ++
      [(Assert, ((0 <= ((i + 388) * 8)) /\ ((((i + 388) * 8) + 8) <= 3168)))]);
      t64 <- (BArray3168.get64d s_sk ((i + 388) * 8));
      trace___crypto_kem_dec_jazz <-
      (trace___crypto_kem_dec_jazz ++
      [(Assert, ((0 <= ((i + 4) * 8)) /\ ((((i + 4) * 8) + 8) <= 64)))]);
      b_buf <-
      (BArray64.set64d b_buf ((i + 4) * 8) (W64.of_int 18446744073709551615));
      buf <- (BArray64.set64d buf ((i + 4) * 8) t64);
      i <- (i + 1);
    }
    b_param_7 <- b_kr;
    param_3 <- kr;
    b_param_6 <- b_buf;
    param_2 <- buf;
    (result_0, b_result_2, tmp__trace) <@ _sha3_512A_A64 (param_3, b_param_7,
    param_2, b_param_6);
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++ tmp__trace);
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++
    [(Assert, (BArray64.is_init b_result_2 0 64))]);
    b_kr <- (BArray64.init_arr (W8.of_int 255));
    kr <- result_0;
    b_param_5 <- b_ctc;
    param_7 <- ctc;
    b_param_4 <- (SBArray64_32.get_sub8 b_buf 0);
    param_6 <- (SBArray64_32.get_sub8 buf 0);
    b_param_3 <- (SBArray3168_1568.get_sub8 b_s_sk 1536);
    param_5 <- (SBArray3168_1568.get_sub8 s_sk 1536);
    b_param_2 <- (SBArray64_32.get_sub8 b_kr 32);
    param_4 <- (SBArray64_32.get_sub8 kr 32);
    (result_1, b_result_1, tmp__trace) <@ __indcpa_enc (param_7, b_param_5,
    param_6, b_param_4, param_5, b_param_3, param_4, b_param_2);
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++ tmp__trace);
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++
    [(Assert, (BArray1568.is_init b_result_1 0 1568))]);
    ctc <- result_1;
    ct <- s_ct;
    param_9 <- ct;
    param_8 <- ctc;
    (result_2, tmp__trace) <@ __verify (param_9,
    (BArray1568.init_arr (W8.of_int 255)), param_8,
    (BArray1568.init_arr (W8.of_int 255)));
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++ tmp__trace);
    cnd <- result_2;
    s_cnd <- cnd;
    ct <- s_ct;
    b_shk <- b_s_shk;
    shk <- s_shk;
    b_param_1 <- b_shk;
    param_12 <- shk;
    b_param_0 <- (SBArray3168_32.get_sub8 b_s_sk 3136);
    param_11 <- (SBArray3168_32.get_sub8 s_sk 3136);
    param_10 <- ct;
    (result_3, b_result_0, tmp__trace) <@ _shake256_A32__A1600 (param_12,
    b_param_1, param_11, b_param_0, param_10,
    (BArray1568.init_arr (W8.of_int 255)));
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++ tmp__trace);
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++
    [(Assert, (BArray32.is_init b_result_0 0 32))]);
    shk <- result_3;
    cnd <- s_cnd;
    param_15 <- shk;
    b_param <- (SBArray64_32.get_sub8 b_kr 0);
    param_14 <- (SBArray64_32.get_sub8 kr 0);
    param_13 <- cnd;
    (result_4, b_result, tmp__trace) <@ __cmov (param_15,
    (BArray32.init_arr (W8.of_int 255)), param_14, b_param, param_13);
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++ tmp__trace);
    trace___crypto_kem_dec_jazz <-
    (trace___crypto_kem_dec_jazz ++
    [(Assert, (BArray32.is_init b_result 0 32))]);
    shk <- result_4;
    b_shk <- (BArray32.init_arr (W8.of_int 255));
    return (shk, b_shk, trace___crypto_kem_dec_jazz);
  }
  proc jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand (public_key:BArray1568.t,
                                                          b_public_key:BArray1568.t,
                                                          secret_key:BArray3168.t,
                                                          b_secret_key:BArray3168.t,
                                                          coins:BArray64.t,
                                                          b_coins:BArray64.t) : 
  BArray1568.t * BArray1568.t * BArray3168.t * BArray3168.t * W64.t * trace = {
    var r:W64.t;
    var rd:BArray64.t;
    var pk:BArray1568.t;
    var pkp:BArray1568.t;
    var sk:BArray3168.t;
    var skp:BArray3168.t;
    var rdp:BArray64.t;
    var param:BArray64.t;
    var param_0:BArray3168.t;
    var param_1:BArray1568.t;
    var result:BArray3168.t;
    var result_0:BArray1568.t;
    var b_sk:BArray3168.t;
    var b_pk:BArray1568.t;
    var b_skp:BArray3168.t;
    var b_pkp:BArray1568.t;
    var b_result:BArray3168.t;
    var b_result_0:BArray1568.t;
    var b_param:BArray3168.t;
    var b_param_0:BArray1568.t;
    var  _0:W64.t;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    var trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_pk <- witness;
    b_pkp <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_sk <- witness;
    b_skp <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    pk <- witness;
    pkp <- witness;
    rd <- witness;
    rdp <- witness;
    result <- witness;
    result_0 <- witness;
    sk <- witness;
    skp <- witness;
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand <- [];
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand ++
    [(Assert, (BArray64.is_init b_coins 0 64))]);
    b_pk <- (BArray1568.init_arr (W8.of_int 0));
    b_sk <- (BArray3168.init_arr (W8.of_int 0));
     _0 <- (init_msf);
    (* Erased call to spill *)
    (* Erased call to spill *)
    rd <- (copy_64 coins);
    b_pkp <- b_pk;
    pkp <- pk;
    b_skp <- b_sk;
    skp <- sk;
    rdp <- rd;
    b_param_0 <- b_pkp;
    param_1 <- pkp;
    b_param <- b_skp;
    param_0 <- skp;
    param <- rdp;
    (result_0, b_result_0, result, b_result, tmp__trace) <@ __crypto_kem_keypair_jazz (
    param_1, b_param_0, param_0, b_param, param,
    (BArray64.init_arr (W8.of_int 255)));
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand ++ tmp__trace);
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand ++
    [(Assert,
     ((BArray1568.is_init b_result_0 0 1568) /\
     (BArray3168.is_init b_result 0 3168)))]);
    pkp <- result_0;
    skp <- result;
    (* Erased call to unspill *)
    (* Erased call to unspill *)
    pk <- pkp;
    sk <- skp;
    public_key <- (copy_64 pk);
    secret_key <- (copy_64 sk);
    (* Erased call to spill *)
    (* Erased call to spill *)
    ( _1,  _2,  _3,  _4,  _5, r) <- (set0_64);
    b_public_key <- (BArray1568.init_arr (W8.of_int 255));
    b_secret_key <- (BArray3168.init_arr (W8.of_int 255));
    return (public_key, b_public_key, secret_key, b_secret_key, r,
           trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand);
  }
  proc jade_kem_mlkem_mlkem1024_amd64_ref_keypair (public_key:BArray1568.t,
                                                   b_public_key:BArray1568.t,
                                                   secret_key:BArray3168.t,
                                                   b_secret_key:BArray3168.t) : 
  BArray1568.t * BArray1568.t * BArray3168.t * BArray3168.t * W64.t * trace = {
    var r:W64.t;
    var rd:BArray64.t;
    var rdp:BArray64.t;
    var param:BArray64.t;
    var param_0:BArray3168.t;
    var param_1:BArray1568.t;
    var result:W64.t;
    var result_0:BArray3168.t;
    var result_1:BArray1568.t;
    var b_result:BArray3168.t;
    var b_result_0:BArray1568.t;
    var b_param:BArray3168.t;
    var b_param_0:BArray1568.t;
    var trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    rd <- witness;
    rdp <- witness;
    result_0 <- witness;
    result_1 <- witness;
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair <- [];
    b_public_key <- b_public_key;
    public_key <- public_key;
    b_secret_key <- b_secret_key;
    secret_key <- secret_key;
    rd <@ SC.randombytes_64 (rd);
    rdp <- rd;
    b_param_0 <- b_public_key;
    param_1 <- public_key;
    b_param <- b_secret_key;
    param_0 <- secret_key;
    param <- rdp;
    (result_1, b_result_0, result_0, b_result, result, tmp__trace) <@ 
    jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand (param_1, b_param_0,
    param_0, b_param, param, (BArray64.init_arr (W8.of_int 255)));
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair ++ tmp__trace);
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair ++
    [(Assert,
     ((BArray1568.is_init b_result_0 0 1568) /\
     (BArray3168.is_init b_result 0 3168)))]);
    public_key <- result_1;
    secret_key <- result_0;
    r <- result;
    b_public_key <- (BArray1568.init_arr (W8.of_int 255));
    b_secret_key <- (BArray3168.init_arr (W8.of_int 255));
    return (public_key, b_public_key, secret_key, b_secret_key, r,
           trace_jade_kem_mlkem_mlkem1024_amd64_ref_keypair);
  }
  proc jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand (ciphertext:BArray1568.t,
                                                      b_ciphertext:BArray1568.t,
                                                      shared_secret:BArray32.t,
                                                      b_shared_secret:BArray32.t,
                                                      public_key:BArray1568.t,
                                                      b_public_key:BArray1568.t,
                                                      coins:BArray32.t,
                                                      b_coins:BArray32.t) : 
  BArray1568.t * BArray1568.t * BArray32.t * BArray32.t * W64.t * trace = {
    var r:W64.t;
    var pk:BArray1568.t;
    var rd:BArray32.t;
    var ct:BArray1568.t;
    var ctp:BArray1568.t;
    var pkp:BArray1568.t;
    var shk:BArray32.t;
    var shkp:BArray32.t;
    var rdp:BArray32.t;
    var param:BArray32.t;
    var param_0:BArray1568.t;
    var param_1:BArray32.t;
    var param_2:BArray1568.t;
    var result:BArray32.t;
    var result_0:BArray1568.t;
    var b_shk:BArray32.t;
    var b_ct:BArray1568.t;
    var b_shkp:BArray32.t;
    var b_ctp:BArray1568.t;
    var b_result:BArray32.t;
    var b_result_0:BArray1568.t;
    var b_param:BArray32.t;
    var b_param_0:BArray1568.t;
    var  _0:W64.t;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    var trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand:trace;
    b_ct <- witness;
    b_ctp <- witness;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_shk <- witness;
    b_shkp <- witness;
    ct <- witness;
    ctp <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    pk <- witness;
    pkp <- witness;
    rd <- witness;
    rdp <- witness;
    result <- witness;
    result_0 <- witness;
    shk <- witness;
    shkp <- witness;
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand <- [];
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand ++
    [(Assert,
     ((BArray1568.is_init b_public_key 0 1568) /\
     (BArray32.is_init b_coins 0 32)))]);
    b_shk <- (BArray32.init_arr (W8.of_int 0));
    b_ct <- (BArray1568.init_arr (W8.of_int 0));
     _0 <- (init_msf);
    (* Erased call to spill *)
    (* Erased call to spill *)
    pk <- (copy_64 public_key);
    rd <- (copy_64 coins);
    b_ctp <- b_ct;
    ctp <- ct;
    pkp <- pk;
    b_shkp <- b_shk;
    shkp <- shk;
    rdp <- rd;
    b_param_0 <- b_ctp;
    param_2 <- ctp;
    b_param <- b_shkp;
    param_1 <- shkp;
    param_0 <- pkp;
    param <- rdp;
    (result_0, b_result_0, result, b_result, tmp__trace) <@ __crypto_kem_enc_jazz (
    param_2, b_param_0, param_1, b_param, param_0,
    (BArray1568.init_arr (W8.of_int 255)), param,
    (BArray32.init_arr (W8.of_int 255)));
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand ++ tmp__trace);
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand ++
    [(Assert,
     ((BArray1568.is_init b_result_0 0 1568) /\
     (BArray32.is_init b_result 0 32)))]);
    ctp <- result_0;
    shkp <- result;
    (* Erased call to unspill *)
    (* Erased call to unspill *)
    ct <- ctp;
    shk <- shkp;
    ciphertext <- (copy_64 ct);
    shared_secret <- (copy_64 shk);
    ( _1,  _2,  _3,  _4,  _5, r) <- (set0_64);
    b_shared_secret <- (BArray32.init_arr (W8.of_int 255));
    b_ciphertext <- (BArray1568.init_arr (W8.of_int 255));
    return (ciphertext, b_ciphertext, shared_secret, b_shared_secret, 
           r, trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand);
  }
  proc jade_kem_mlkem_mlkem1024_amd64_ref_enc (ciphertext:BArray1568.t,
                                               b_ciphertext:BArray1568.t,
                                               shared_secret:BArray32.t,
                                               b_shared_secret:BArray32.t,
                                               public_key:BArray1568.t,
                                               b_public_key:BArray1568.t) : 
  BArray1568.t * BArray1568.t * BArray32.t * BArray32.t * W64.t * trace = {
    var r:W64.t;
    var rd:BArray32.t;
    var rdp:BArray32.t;
    var param:BArray32.t;
    var param_0:BArray1568.t;
    var param_1:BArray32.t;
    var param_2:BArray1568.t;
    var result:W64.t;
    var result_0:BArray32.t;
    var result_1:BArray1568.t;
    var b_result:BArray32.t;
    var b_result_0:BArray1568.t;
    var b_param:BArray32.t;
    var b_param_0:BArray1568.t;
    var trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    rd <- witness;
    rdp <- witness;
    result_0 <- witness;
    result_1 <- witness;
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc <- [];
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc ++
    [(Assert, (BArray1568.is_init b_public_key 0 1568))]);
    b_ciphertext <- b_ciphertext;
    ciphertext <- ciphertext;
    b_shared_secret <- b_shared_secret;
    shared_secret <- shared_secret;
    public_key <- public_key;
    rd <@ SC.randombytes_32 (rd);
    rdp <- rd;
    b_param_0 <- b_ciphertext;
    param_2 <- ciphertext;
    b_param <- b_shared_secret;
    param_1 <- shared_secret;
    param_0 <- public_key;
    param <- rdp;
    (result_1, b_result_0, result_0, b_result, result, tmp__trace) <@ 
    jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand (param_2, b_param_0,
    param_1, b_param, param_0, (BArray1568.init_arr (W8.of_int 255)), 
    param, (BArray32.init_arr (W8.of_int 255)));
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc ++ tmp__trace);
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc ++
    [(Assert,
     ((BArray1568.is_init b_result_0 0 1568) /\
     (BArray32.is_init b_result 0 32)))]);
    ciphertext <- result_1;
    shared_secret <- result_0;
    r <- result;
    b_shared_secret <- (BArray32.init_arr (W8.of_int 255));
    b_ciphertext <- (BArray1568.init_arr (W8.of_int 255));
    return (ciphertext, b_ciphertext, shared_secret, b_shared_secret, 
           r, trace_jade_kem_mlkem_mlkem1024_amd64_ref_enc);
  }
  proc jade_kem_mlkem_mlkem1024_amd64_ref_dec (shared_secret:BArray32.t,
                                               b_shared_secret:BArray32.t,
                                               ciphertext:BArray1568.t,
                                               b_ciphertext:BArray1568.t,
                                               secret_key:BArray3168.t,
                                               b_secret_key:BArray3168.t) : 
  BArray32.t * BArray32.t * W64.t * trace = {
    var r:W64.t;
    var ct:BArray1568.t;
    var sk:BArray3168.t;
    var ctp:BArray1568.t;
    var shk:BArray32.t;
    var shkp:BArray32.t;
    var skp:BArray3168.t;
    var param:BArray3168.t;
    var param_0:BArray1568.t;
    var param_1:BArray32.t;
    var result:BArray32.t;
    var b_shk:BArray32.t;
    var b_shkp:BArray32.t;
    var b_result:BArray32.t;
    var b_param:BArray32.t;
    var  _0:W64.t;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    var trace_jade_kem_mlkem_mlkem1024_amd64_ref_dec:trace;
    b_param <- witness;
    b_result <- witness;
    b_shk <- witness;
    b_shkp <- witness;
    ct <- witness;
    ctp <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    result <- witness;
    shk <- witness;
    shkp <- witness;
    sk <- witness;
    skp <- witness;
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_dec <- [];
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_dec <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_dec ++
    [(Assert,
     ((BArray1568.is_init b_ciphertext 0 1568) /\
     (BArray3168.is_init b_secret_key 0 3168)))]);
    b_shk <- (BArray32.init_arr (W8.of_int 0));
     _0 <- (init_msf);
    (* Erased call to spill *)
    ct <- (copy_64 ciphertext);
    sk <- (copy_64 secret_key);
    ctp <- ct;
    b_shkp <- b_shk;
    shkp <- shk;
    skp <- sk;
    b_param <- b_shkp;
    param_1 <- shkp;
    param_0 <- ctp;
    param <- skp;
    (result, b_result, tmp__trace) <@ __crypto_kem_dec_jazz (param_1,
    b_param, param_0, (BArray1568.init_arr (W8.of_int 255)), param,
    (BArray3168.init_arr (W8.of_int 255)));
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_dec <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_dec ++ tmp__trace);
    trace_jade_kem_mlkem_mlkem1024_amd64_ref_dec <-
    (trace_jade_kem_mlkem_mlkem1024_amd64_ref_dec ++
    [(Assert, (BArray32.is_init b_result 0 32))]);
    shkp <- result;
    (* Erased call to unspill *)
    shk <- shkp;
    shared_secret <- (copy_64 shk);
    ( _1,  _2,  _3,  _4,  _5, r) <- (set0_64);
    b_shared_secret <- (BArray32.init_arr (W8.of_int 255));
    return (shared_secret, b_shared_secret, r,
           trace_jade_kem_mlkem_mlkem1024_amd64_ref_dec);
  }
}.

(* The post and trace are valid. *)

op __fqmul_spec _a _b =
   hoare [M(Syscall).__fqmul :
   (((_b = b) /\ (_a = a)) /\ true) ==> (true /\ (valid res.`2))].

op __barrett_reduce_spec _a =
   hoare [M(Syscall).__barrett_reduce :
   ((_a = a) /\ true) ==> (true /\ (valid res.`2))].

op __ANDN_64_spec _a _b =
   hoare [M(Syscall).__ANDN_64 :
   (((_b = b) /\ (_a = a)) /\ true) ==> (true /\ (valid res.`2))].

op __SHLQ_spec _x _shbytes =
   hoare [M(Syscall).__SHLQ :
   (((_shbytes = shbytes) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].

op keccakf1600_index_spec _x _y =
   hoare [M(Syscall).keccakf1600_index :
   (((_y = y) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].

op keccakf1600_rho_offsets_spec _i =
   hoare [M(Syscall).keccakf1600_rho_offsets :
   ((_i = i) /\ true) ==> (true /\ (valid res.`2))].

op keccakf1600_rhotates_spec _x _y =
   hoare [M(Syscall).keccakf1600_rhotates :
   (((_y = y) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].

op __rol_u64_ref_spec _x _i =
   hoare [M(Syscall).__rol_u64_ref :
   (((_i = i) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].

op __theta_sum_ref_spec _a _b_a =
   hoare [M(Syscall).__theta_sum_ref :
   (((_b_a = b_a) /\ (_a = a)) /\ (BArray200.is_init _b_a 0 200)) ==>
   ((BArray40.is_init res.`2 0 40) /\ (valid res.`3))].

op __theta_rol_ref_spec _c _b_c =
   hoare [M(Syscall).__theta_rol_ref :
   (((_b_c = b_c) /\ (_c = c)) /\ (BArray40.is_init _b_c 0 40)) ==>
   ((BArray40.is_init res.`2 0 40) /\ (valid res.`3))].

op __rol_sum_ref_spec _a _b_a _d _b_d _y =
   hoare [M(Syscall).__rol_sum_ref :
   (((_y = y) /\ ((_b_d = b_d) /\ ((_d = d) /\ ((_b_a = b_a) /\ (_a = a))))) /\
   ((BArray40.is_init _b_d 0 40) /\ (BArray200.is_init _b_a 0 200))) ==>
   ((BArray40.is_init res.`2 0 40) /\ (valid res.`3))].

op __set_row_ref_spec _e _b_e _b _b_b _y =
   hoare [M(Syscall).__set_row_ref :
   (((_y = y) /\ ((_b_b = b_b) /\ ((_b = b) /\ ((_b_e = b_e) /\ (_e = e))))) /\
   (true /\
   (true /\
   (true /\
   ((((BArray40.is_init _b_b 0 40) /\ (0 <= _y)) /\ (_y < 5)) /\
   (BArray200.is_init _b_e 0 ((_y * 5) * 8))))))) ==>
   ((true /\ (BArray200.is_init res.`2 0 (((_y + 1) * 5) * 8))) /\
   (valid res.`3))].

op _pround_ref_spec _e _b_e _a _b_a =
   hoare [M(Syscall)._pround_ref :
   (((_b_a = b_a) /\ ((_a = a) /\ ((_b_e = b_e) /\ (_e = e)))) /\
   (BArray200.is_init _b_a 0 200)) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op __keccakf1600_ref_spec _a _b_a =
   hoare [M(Syscall).__keccakf1600_ref :
   (((_b_a = b_a) /\ (_a = a)) /\ (BArray200.is_init _b_a 0 200)) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op _keccakf1600_ref_spec _a _b_a =
   hoare [M(Syscall)._keccakf1600_ref :
   (((_b_a = b_a) /\ (_a = a)) /\ (BArray200.is_init _b_a 0 200)) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op __state_init_ref_spec _st _b_st =
   hoare [M(Syscall).__state_init_ref :
   (((_b_st = b_st) /\ (_st = st)) /\ true) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op __addratebit_ref_spec _st _b_st __RATE8 =
   hoare [M(Syscall).__addratebit_ref :
   (((__RATE8 = _RATE8) /\ ((_b_st = b_st) /\ (_st = st))) /\
   (true /\
   (true /\
   (((BArray200.is_init _b_st 0 200) /\ (0 < __RATE8)) /\ (__RATE8 <= 200))))) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op a32____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT =
   hoare [M(Syscall).a32____a_ilen_read_upto8_at :
   (((_aT = aT) /\
    ((_cUR = cUR) /\
    ((_tRAIL = tRAIL) /\
    ((_lEN = lEN) /\
    ((_dELTA = dELTA) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
    (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 18446744073709551615)) /\
   (((0 <= 32) /\ (32 <= 18446744073709551615)) /\
   ((((((BArray32.is_init _b_buf (_offset + _dELTA) ((_lEN < 8) ? _lEN : 8)) /\
       (0 <= _dELTA)) /\
      (0 <= _offset)) /\
     (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 32)) /\
    (0 <= _tRAIL)) /\
   (_tRAIL < 256)))))))))))))))))))))))))))))))))))))))))))))))) ==>
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((_cUR <= _aT) /\ (_aT < (_cUR + 8))) ? ((((res.`1 =
                                                (_dELTA +
                                                ((((_lEN <
                                                   (8 - (_aT - _cUR))) ? 
                                                  _lEN : (8 - (_aT - _cUR))) <
                                                 0) ? 0 : ((_lEN <
                                                           (8 - (_aT - _cUR))) ? 
                                                          _lEN : (8 -
                                                                 (_aT - _cUR)))))) /\
                                               (res.`2 =
                                               (_lEN -
                                               ((((_lEN < (8 - (_aT - _cUR))) ? 
                                                 _lEN : (8 - (_aT - _cUR))) <
                                                0) ? 0 : ((_lEN <
                                                          (8 - (_aT - _cUR))) ? 
                                                         _lEN : (8 -
                                                                (_aT - _cUR))))))) /\
                                              (res.`3 =
                                              ((8 <= ((_aT - _cUR) + _lEN)) ? 
                                              _tRAIL : 0))) /\
                                             (res.`4 =
                                             (_cUR +
                                             (((((((_aT - _cUR) + _lEN) < 8) ? 
                                                ((_aT - _cUR) + _lEN) : 8) +
                                               (((8 <= ((_aT - _cUR) + _lEN)) \/
                                                (_tRAIL = 0)) ? 0 : 1)) <
                                              0) ? 0 : (((((_aT - _cUR) +
                                                          _lEN) <
                                                         8) ? ((_aT - _cUR) +
                                                              _lEN) : 8) +
                                                       (((8 <=
                                                         ((_aT - _cUR) +
                                                         _lEN)) \/
                                                        (_tRAIL = 0)) ? 0 : 1)))))) : 
    ((((res.`1 = _dELTA) /\ (res.`2 = _lEN)) /\ (res.`3 = _tRAIL)) /\
    (res.`4 = _aT)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`6))].

op a32____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w =
   hoare [M(Syscall).a32____a_ilen_write_upto8 :
   (((_w = w) /\
    ((_lEN = lEN) /\
    ((_dELTA = dELTA) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
    (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 18446744073709551615)) /\
   (((0 <= 32) /\ (32 <= 18446744073709551615)) /\
   (((BArray32.is_init _b_buf 0 (_offset + _dELTA)) /\ (0 <= _dELTA)) /\
   (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 32)))))))))))))))))))))))))))))))))))))))))) ==>
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
    (((0 <= (_offset + _dELTA)) /\
     ((_offset + _dELTA) <= 18446744073709551615)) /\
    (((0 <= ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) /\
     (((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)) <=
     18446744073709551615)) /\
    (((0 <=
      ((_offset + _dELTA) +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
     (((_offset + _dELTA) +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) <=
     18446744073709551615)) /\
    (((res.`3 =
      (_dELTA +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
     (res.`4 =
     (_lEN - ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))) /\
    (BArray32.is_init res.`2 0
    ((_offset + _dELTA) +
    ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`5))].

op a32____addstate_ref_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB =
   hoare [M(Syscall).a32____addstate_ref :
   (((__TRAILB = _TRAILB) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st)))))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    ((((0 <= __TRAILB) /\ (__TRAILB < 256)) /\ (0 <= _aT)) /\
    (((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)) < 200)))))))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
   (((0 <= (_offset + __LEN)) /\ ((_offset + __LEN) <= 18446744073709551615)) /\
   (((0 <= 32) /\ (32 <= 18446744073709551615)) /\
   (((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= 32)) /\
    (BArray32.is_init _b_buf _offset __LEN)) /\
   (BArray200.is_init _b_st 0 200))))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`4) /\ (res.`4 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
    (((0 <= (_offset + __LEN)) /\
     ((_offset + __LEN) <= 18446744073709551615)) /\
    (((BArray200.is_init res.`2 0 200) /\
     (res.`3 = ((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)))) /\
    (res.`4 = (_offset + __LEN))))))))))))))))))) /\
   (valid res.`5))].

op a32____absorb_ref_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8 =
   hoare [M(Syscall).a32____absorb_ref :
   (((__RATE8 = _RATE8) /\
    ((__TRAILB = _TRAILB) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st))))))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   ((((((((0 < __RATE8) /\ (__RATE8 < 200)) /\ (0 <= __TRAILB)) /\
       (__TRAILB < 256)) /\
      (0 <= _aT)) /\
     (_aT < __RATE8)) /\
    (BArray32.is_init _b_buf 0 32)) /\
   (BArray200.is_init _b_st 0 (7 * 32))))))))))) ==>
   ((BArray200.is_init res.`2 0 (7 * 32)) /\ (valid res.`4))].

op a32____dumpstate_ref_spec _buf _b_buf _offset __LEN _st _b_st =
   hoare [M(Syscall).a32____dumpstate_ref :
   (((_b_st = b_st) /\
    ((_st = st) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
   (((0 <= (_offset + __LEN)) /\ ((_offset + __LEN) <= 18446744073709551615)) /\
   (((0 <= 32) /\ (32 <= 18446744073709551615)) /\
   ((((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= 32)) /\
     (BArray200.is_init _b_st 0 (7 * 32))) /\
    (__LEN <= 200)) /\
   (BArray32.is_init _b_buf 0 _offset)))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`3) /\ (res.`3 <= 18446744073709551615)))) /\
    ((true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
     (((0 <= (_offset + __LEN)) /\
      ((_offset + __LEN) <= 18446744073709551615)) /\
     (BArray32.is_init res.`2 0 (_offset + __LEN)))))))))))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
    (((0 <= (_offset + __LEN)) /\
     ((_offset + __LEN) <= 18446744073709551615)) /\
    (res.`3 = (_offset + __LEN))))))))))))))) /\
   (valid res.`4))].

op a32____squeeze_ref_spec _st _b_st _buf _b_buf __RATE8 =
   hoare [M(Syscall).a32____squeeze_ref :
   (((__RATE8 = _RATE8) /\
    ((_b_buf = b_buf) /\ ((_buf = buf) /\ ((_b_st = b_st) /\ (_st = st))))) /\
   (true /\
   (true /\
   (((0 < __RATE8) /\ (__RATE8 < 200)) /\
   (BArray200.is_init _b_st 0 (7 * 32)))))) ==>
   (((BArray32.is_init res.`4 0 32) /\ (BArray200.is_init res.`2 0 (32 * 7))) /\
   (valid res.`5))].

op a33____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT =
   hoare [M(Syscall).a33____a_ilen_read_upto8_at :
   (((_aT = aT) /\
    ((_cUR = cUR) /\
    ((_tRAIL = tRAIL) /\
    ((_lEN = lEN) /\
    ((_dELTA = dELTA) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
    (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 18446744073709551615)) /\
   (((0 <= 33) /\ (33 <= 18446744073709551615)) /\
   ((((((BArray33.is_init _b_buf (_offset + _dELTA) ((_lEN < 8) ? _lEN : 8)) /\
       (0 <= _dELTA)) /\
      (0 <= _offset)) /\
     (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 33)) /\
    (0 <= _tRAIL)) /\
   (_tRAIL < 256)))))))))))))))))))))))))))))))))))))))))))))))) ==>
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((_cUR <= _aT) /\ (_aT < (_cUR + 8))) ? ((((res.`1 =
                                                (_dELTA +
                                                ((((_lEN <
                                                   (8 - (_aT - _cUR))) ? 
                                                  _lEN : (8 - (_aT - _cUR))) <
                                                 0) ? 0 : ((_lEN <
                                                           (8 - (_aT - _cUR))) ? 
                                                          _lEN : (8 -
                                                                 (_aT - _cUR)))))) /\
                                               (res.`2 =
                                               (_lEN -
                                               ((((_lEN < (8 - (_aT - _cUR))) ? 
                                                 _lEN : (8 - (_aT - _cUR))) <
                                                0) ? 0 : ((_lEN <
                                                          (8 - (_aT - _cUR))) ? 
                                                         _lEN : (8 -
                                                                (_aT - _cUR))))))) /\
                                              (res.`3 =
                                              ((8 <= ((_aT - _cUR) + _lEN)) ? 
                                              _tRAIL : 0))) /\
                                             (res.`4 =
                                             (_cUR +
                                             (((((((_aT - _cUR) + _lEN) < 8) ? 
                                                ((_aT - _cUR) + _lEN) : 8) +
                                               (((8 <= ((_aT - _cUR) + _lEN)) \/
                                                (_tRAIL = 0)) ? 0 : 1)) <
                                              0) ? 0 : (((((_aT - _cUR) +
                                                          _lEN) <
                                                         8) ? ((_aT - _cUR) +
                                                              _lEN) : 8) +
                                                       (((8 <=
                                                         ((_aT - _cUR) +
                                                         _lEN)) \/
                                                        (_tRAIL = 0)) ? 0 : 1)))))) : 
    ((((res.`1 = _dELTA) /\ (res.`2 = _lEN)) /\ (res.`3 = _tRAIL)) /\
    (res.`4 = _aT)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`6))].

op a33____addstate_ref_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB =
   hoare [M(Syscall).a33____addstate_ref :
   (((__TRAILB = _TRAILB) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st)))))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    ((((0 <= __TRAILB) /\ (__TRAILB < 256)) /\ (0 <= _aT)) /\
    (((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)) < 200)))))))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
   (((0 <= (_offset + __LEN)) /\ ((_offset + __LEN) <= 18446744073709551615)) /\
   (((0 <= 33) /\ (33 <= 18446744073709551615)) /\
   (((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= 33)) /\
    (BArray33.is_init _b_buf _offset __LEN)) /\
   (BArray200.is_init _b_st 0 200))))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`4) /\ (res.`4 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
    (((0 <= (_offset + __LEN)) /\
     ((_offset + __LEN) <= 18446744073709551615)) /\
    (((BArray200.is_init res.`2 0 200) /\
     (res.`3 = ((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)))) /\
    (res.`4 = (_offset + __LEN))))))))))))))))))) /\
   (valid res.`5))].

op a33____absorb_ref_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8 =
   hoare [M(Syscall).a33____absorb_ref :
   (((__RATE8 = _RATE8) /\
    ((__TRAILB = _TRAILB) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st))))))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   ((((((((0 < __RATE8) /\ (__RATE8 < 200)) /\ (0 <= __TRAILB)) /\
       (__TRAILB < 256)) /\
      (0 <= _aT)) /\
     (_aT < __RATE8)) /\
    (BArray33.is_init _b_buf 0 33)) /\
   (BArray200.is_init _b_st 0 (7 * 32))))))))))) ==>
   ((BArray200.is_init res.`2 0 (7 * 32)) /\ (valid res.`4))].

op a34____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT =
   hoare [M(Syscall).a34____a_ilen_read_upto8_at :
   (((_aT = aT) /\
    ((_cUR = cUR) /\
    ((_tRAIL = tRAIL) /\
    ((_lEN = lEN) /\
    ((_dELTA = dELTA) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
    (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 18446744073709551615)) /\
   (((0 <= 34) /\ (34 <= 18446744073709551615)) /\
   ((((((BArray34.is_init _b_buf (_offset + _dELTA) ((_lEN < 8) ? _lEN : 8)) /\
       (0 <= _dELTA)) /\
      (0 <= _offset)) /\
     (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 34)) /\
    (0 <= _tRAIL)) /\
   (_tRAIL < 256)))))))))))))))))))))))))))))))))))))))))))))))) ==>
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((_cUR <= _aT) /\ (_aT < (_cUR + 8))) ? ((((res.`1 =
                                                (_dELTA +
                                                ((((_lEN <
                                                   (8 - (_aT - _cUR))) ? 
                                                  _lEN : (8 - (_aT - _cUR))) <
                                                 0) ? 0 : ((_lEN <
                                                           (8 - (_aT - _cUR))) ? 
                                                          _lEN : (8 -
                                                                 (_aT - _cUR)))))) /\
                                               (res.`2 =
                                               (_lEN -
                                               ((((_lEN < (8 - (_aT - _cUR))) ? 
                                                 _lEN : (8 - (_aT - _cUR))) <
                                                0) ? 0 : ((_lEN <
                                                          (8 - (_aT - _cUR))) ? 
                                                         _lEN : (8 -
                                                                (_aT - _cUR))))))) /\
                                              (res.`3 =
                                              ((8 <= ((_aT - _cUR) + _lEN)) ? 
                                              _tRAIL : 0))) /\
                                             (res.`4 =
                                             (_cUR +
                                             (((((((_aT - _cUR) + _lEN) < 8) ? 
                                                ((_aT - _cUR) + _lEN) : 8) +
                                               (((8 <= ((_aT - _cUR) + _lEN)) \/
                                                (_tRAIL = 0)) ? 0 : 1)) <
                                              0) ? 0 : (((((_aT - _cUR) +
                                                          _lEN) <
                                                         8) ? ((_aT - _cUR) +
                                                              _lEN) : 8) +
                                                       (((8 <=
                                                         ((_aT - _cUR) +
                                                         _lEN)) \/
                                                        (_tRAIL = 0)) ? 0 : 1)))))) : 
    ((((res.`1 = _dELTA) /\ (res.`2 = _lEN)) /\ (res.`3 = _tRAIL)) /\
    (res.`4 = _aT)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`6))].

op a34____addstate_ref_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB =
   hoare [M(Syscall).a34____addstate_ref :
   (((__TRAILB = _TRAILB) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st)))))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    ((((0 <= __TRAILB) /\ (__TRAILB < 256)) /\ (0 <= _aT)) /\
    (((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)) < 200)))))))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
   (((0 <= (_offset + __LEN)) /\ ((_offset + __LEN) <= 18446744073709551615)) /\
   (((0 <= 34) /\ (34 <= 18446744073709551615)) /\
   (((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= 34)) /\
    (BArray34.is_init _b_buf _offset __LEN)) /\
   (BArray200.is_init _b_st 0 200))))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`4) /\ (res.`4 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
    (((0 <= (_offset + __LEN)) /\
     ((_offset + __LEN) <= 18446744073709551615)) /\
    (((BArray200.is_init res.`2 0 200) /\
     (res.`3 = ((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)))) /\
    (res.`4 = (_offset + __LEN))))))))))))))))))) /\
   (valid res.`5))].

op a34____absorb_ref_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8 =
   hoare [M(Syscall).a34____absorb_ref :
   (((__RATE8 = _RATE8) /\
    ((__TRAILB = _TRAILB) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st))))))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   ((((((((0 < __RATE8) /\ (__RATE8 < 200)) /\ (0 <= __TRAILB)) /\
       (__TRAILB < 256)) /\
      (0 <= _aT)) /\
     (_aT < __RATE8)) /\
    (BArray34.is_init _b_buf 0 34)) /\
   (BArray200.is_init _b_st 0 (7 * 32))))))))))) ==>
   ((BArray200.is_init res.`2 0 (7 * 32)) /\ (valid res.`4))].

op a64____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT =
   hoare [M(Syscall).a64____a_ilen_read_upto8_at :
   (((_aT = aT) /\
    ((_cUR = cUR) /\
    ((_tRAIL = tRAIL) /\
    ((_lEN = lEN) /\
    ((_dELTA = dELTA) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
    (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 18446744073709551615)) /\
   (((0 <= 64) /\ (64 <= 18446744073709551615)) /\
   ((((((BArray64.is_init _b_buf (_offset + _dELTA) ((_lEN < 8) ? _lEN : 8)) /\
       (0 <= _dELTA)) /\
      (0 <= _offset)) /\
     (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 64)) /\
    (0 <= _tRAIL)) /\
   (_tRAIL < 256)))))))))))))))))))))))))))))))))))))))))))))))) ==>
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((_cUR <= _aT) /\ (_aT < (_cUR + 8))) ? ((((res.`1 =
                                                (_dELTA +
                                                ((((_lEN <
                                                   (8 - (_aT - _cUR))) ? 
                                                  _lEN : (8 - (_aT - _cUR))) <
                                                 0) ? 0 : ((_lEN <
                                                           (8 - (_aT - _cUR))) ? 
                                                          _lEN : (8 -
                                                                 (_aT - _cUR)))))) /\
                                               (res.`2 =
                                               (_lEN -
                                               ((((_lEN < (8 - (_aT - _cUR))) ? 
                                                 _lEN : (8 - (_aT - _cUR))) <
                                                0) ? 0 : ((_lEN <
                                                          (8 - (_aT - _cUR))) ? 
                                                         _lEN : (8 -
                                                                (_aT - _cUR))))))) /\
                                              (res.`3 =
                                              ((8 <= ((_aT - _cUR) + _lEN)) ? 
                                              _tRAIL : 0))) /\
                                             (res.`4 =
                                             (_cUR +
                                             (((((((_aT - _cUR) + _lEN) < 8) ? 
                                                ((_aT - _cUR) + _lEN) : 8) +
                                               (((8 <= ((_aT - _cUR) + _lEN)) \/
                                                (_tRAIL = 0)) ? 0 : 1)) <
                                              0) ? 0 : (((((_aT - _cUR) +
                                                          _lEN) <
                                                         8) ? ((_aT - _cUR) +
                                                              _lEN) : 8) +
                                                       (((8 <=
                                                         ((_aT - _cUR) +
                                                         _lEN)) \/
                                                        (_tRAIL = 0)) ? 0 : 1)))))) : 
    ((((res.`1 = _dELTA) /\ (res.`2 = _lEN)) /\ (res.`3 = _tRAIL)) /\
    (res.`4 = _aT)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`6))].

op a64____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w =
   hoare [M(Syscall).a64____a_ilen_write_upto8 :
   (((_w = w) /\
    ((_lEN = lEN) /\
    ((_dELTA = dELTA) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
    (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 18446744073709551615)) /\
   (((0 <= 64) /\ (64 <= 18446744073709551615)) /\
   (((BArray64.is_init _b_buf 0 (_offset + _dELTA)) /\ (0 <= _dELTA)) /\
   (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 64)))))))))))))))))))))))))))))))))))))))))) ==>
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
    (((0 <= (_offset + _dELTA)) /\
     ((_offset + _dELTA) <= 18446744073709551615)) /\
    (((0 <= ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) /\
     (((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)) <=
     18446744073709551615)) /\
    (((0 <=
      ((_offset + _dELTA) +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
     (((_offset + _dELTA) +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) <=
     18446744073709551615)) /\
    (((res.`3 =
      (_dELTA +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
     (res.`4 =
     (_lEN - ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))) /\
    (BArray64.is_init res.`2 0
    ((_offset + _dELTA) +
    ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`5))].

op a64____addstate_ref_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB =
   hoare [M(Syscall).a64____addstate_ref :
   (((__TRAILB = _TRAILB) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st)))))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    ((((0 <= __TRAILB) /\ (__TRAILB < 256)) /\ (0 <= _aT)) /\
    (((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)) < 200)))))))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
   (((0 <= (_offset + __LEN)) /\ ((_offset + __LEN) <= 18446744073709551615)) /\
   (((0 <= 64) /\ (64 <= 18446744073709551615)) /\
   (((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= 64)) /\
    (BArray64.is_init _b_buf _offset __LEN)) /\
   (BArray200.is_init _b_st 0 200))))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`4) /\ (res.`4 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
    (((0 <= (_offset + __LEN)) /\
     ((_offset + __LEN) <= 18446744073709551615)) /\
    (((BArray200.is_init res.`2 0 200) /\
     (res.`3 = ((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)))) /\
    (res.`4 = (_offset + __LEN))))))))))))))))))) /\
   (valid res.`5))].

op a64____absorb_ref_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8 =
   hoare [M(Syscall).a64____absorb_ref :
   (((__RATE8 = _RATE8) /\
    ((__TRAILB = _TRAILB) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st))))))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   ((((((((0 < __RATE8) /\ (__RATE8 < 200)) /\ (0 <= __TRAILB)) /\
       (__TRAILB < 256)) /\
      (0 <= _aT)) /\
     (_aT < __RATE8)) /\
    (BArray64.is_init _b_buf 0 64)) /\
   (BArray200.is_init _b_st 0 (7 * 32))))))))))) ==>
   ((BArray200.is_init res.`2 0 (7 * 32)) /\ (valid res.`4))].

op a64____dumpstate_ref_spec _buf _b_buf _offset __LEN _st _b_st =
   hoare [M(Syscall).a64____dumpstate_ref :
   (((_b_st = b_st) /\
    ((_st = st) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
   (((0 <= (_offset + __LEN)) /\ ((_offset + __LEN) <= 18446744073709551615)) /\
   (((0 <= 64) /\ (64 <= 18446744073709551615)) /\
   ((((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= 64)) /\
     (BArray200.is_init _b_st 0 (7 * 32))) /\
    (__LEN <= 200)) /\
   (BArray64.is_init _b_buf 0 _offset)))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`3) /\ (res.`3 <= 18446744073709551615)))) /\
    ((true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
     (((0 <= (_offset + __LEN)) /\
      ((_offset + __LEN) <= 18446744073709551615)) /\
     (BArray64.is_init res.`2 0 (_offset + __LEN)))))))))))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
    (((0 <= (_offset + __LEN)) /\
     ((_offset + __LEN) <= 18446744073709551615)) /\
    (res.`3 = (_offset + __LEN))))))))))))))) /\
   (valid res.`4))].

op a64____squeeze_ref_spec _st _b_st _buf _b_buf __RATE8 =
   hoare [M(Syscall).a64____squeeze_ref :
   (((__RATE8 = _RATE8) /\
    ((_b_buf = b_buf) /\ ((_buf = buf) /\ ((_b_st = b_st) /\ (_st = st))))) /\
   (true /\
   (true /\
   (((0 < __RATE8) /\ (__RATE8 < 200)) /\
   (BArray200.is_init _b_st 0 (7 * 32)))))) ==>
   (((BArray64.is_init res.`4 0 64) /\ (BArray200.is_init res.`2 0 (32 * 7))) /\
   (valid res.`5))].

op a128____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w =
   hoare [M(Syscall).a128____a_ilen_write_upto8 :
   (((_w = w) /\
    ((_lEN = lEN) /\
    ((_dELTA = dELTA) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
    (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 18446744073709551615)) /\
   (((0 <= 128) /\ (128 <= 18446744073709551615)) /\
   (((BArray128.is_init _b_buf 0 (_offset + _dELTA)) /\ (0 <= _dELTA)) /\
   (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 128)))))))))))))))))))))))))))))))))))))))))) ==>
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
    (((0 <= (_offset + _dELTA)) /\
     ((_offset + _dELTA) <= 18446744073709551615)) /\
    (((0 <= ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) /\
     (((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)) <=
     18446744073709551615)) /\
    (((0 <=
      ((_offset + _dELTA) +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
     (((_offset + _dELTA) +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) <=
     18446744073709551615)) /\
    (((res.`3 =
      (_dELTA +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
     (res.`4 =
     (_lEN - ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))) /\
    (BArray128.is_init res.`2 0
    ((_offset + _dELTA) +
    ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`5))].

op a128____dumpstate_ref_spec _buf _b_buf _offset __LEN _st _b_st =
   hoare [M(Syscall).a128____dumpstate_ref :
   (((_b_st = b_st) /\
    ((_st = st) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
   (((0 <= (_offset + __LEN)) /\ ((_offset + __LEN) <= 18446744073709551615)) /\
   (((0 <= 128) /\ (128 <= 18446744073709551615)) /\
   ((((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= 128)) /\
     (BArray200.is_init _b_st 0 (7 * 32))) /\
    (__LEN <= 200)) /\
   (BArray128.is_init _b_buf 0 _offset)))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`3) /\ (res.`3 <= 18446744073709551615)))) /\
    ((true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
     (((0 <= (_offset + __LEN)) /\
      ((_offset + __LEN) <= 18446744073709551615)) /\
     (BArray128.is_init res.`2 0 (_offset + __LEN)))))))))))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
    (((0 <= (_offset + __LEN)) /\
     ((_offset + __LEN) <= 18446744073709551615)) /\
    (res.`3 = (_offset + __LEN))))))))))))))) /\
   (valid res.`4))].

op a128____squeeze_ref_spec _st _b_st _buf _b_buf __RATE8 =
   hoare [M(Syscall).a128____squeeze_ref :
   (((__RATE8 = _RATE8) /\
    ((_b_buf = b_buf) /\ ((_buf = buf) /\ ((_b_st = b_st) /\ (_st = st))))) /\
   (true /\
   (true /\
   (((0 < __RATE8) /\ (__RATE8 < 200)) /\
   (BArray200.is_init _b_st 0 (7 * 32)))))) ==>
   (((BArray128.is_init res.`4 0 128) /\
    (BArray200.is_init res.`2 0 (32 * 7))) /\
   (valid res.`5))].

op a168____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w =
   hoare [M(Syscall).a168____a_ilen_write_upto8 :
   (((_w = w) /\
    ((_lEN = lEN) /\
    ((_dELTA = dELTA) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
    (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 18446744073709551615)) /\
   (((0 <= 168) /\ (168 <= 18446744073709551615)) /\
   (((BArray168.is_init _b_buf 0 (_offset + _dELTA)) /\ (0 <= _dELTA)) /\
   (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 168)))))))))))))))))))))))))))))))))))))))))) ==>
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
    (((0 <= (_offset + _dELTA)) /\
     ((_offset + _dELTA) <= 18446744073709551615)) /\
    (((0 <= ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) /\
     (((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)) <=
     18446744073709551615)) /\
    (((0 <=
      ((_offset + _dELTA) +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
     (((_offset + _dELTA) +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) <=
     18446744073709551615)) /\
    (((res.`3 =
      (_dELTA +
      ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
     (res.`4 =
     (_lEN - ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))) /\
    (BArray168.is_init res.`2 0
    ((_offset + _dELTA) +
    ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`5))].

op a168____dumpstate_ref_spec _buf _b_buf _offset __LEN _st _b_st =
   hoare [M(Syscall).a168____dumpstate_ref :
   (((_b_st = b_st) /\
    ((_st = st) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
   (((0 <= (_offset + __LEN)) /\ ((_offset + __LEN) <= 18446744073709551615)) /\
   (((0 <= 168) /\ (168 <= 18446744073709551615)) /\
   ((((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= 168)) /\
     (BArray200.is_init _b_st 0 (7 * 32))) /\
    (__LEN <= 200)) /\
   (BArray168.is_init _b_buf 0 _offset)))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`3) /\ (res.`3 <= 18446744073709551615)))) /\
    ((true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (true /\
     (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
     (((0 <= (_offset + __LEN)) /\
      ((_offset + __LEN) <= 18446744073709551615)) /\
     (BArray168.is_init res.`2 0 (_offset + __LEN)))))))))))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
    (((0 <= (_offset + __LEN)) /\
     ((_offset + __LEN) <= 18446744073709551615)) /\
    (res.`3 = (_offset + __LEN))))))))))))))) /\
   (valid res.`4))].

op a1568____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT =
   hoare [M(Syscall).a1568____a_ilen_read_upto8_at :
   (((_aT = aT) /\
    ((_cUR = cUR) /\
    ((_tRAIL = tRAIL) /\
    ((_lEN = lEN) /\
    ((_dELTA = dELTA) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
    (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 18446744073709551615)) /\
   (((0 <= 1568) /\ (1568 <= 18446744073709551615)) /\
   ((((((BArray1568.is_init _b_buf (_offset + _dELTA) ((_lEN < 8) ? _lEN : 8)
        ) /\
       (0 <= _dELTA)) /\
      (0 <= _offset)) /\
     (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= 1568)) /\
    (0 <= _tRAIL)) /\
   (_tRAIL < 256)))))))))))))))))))))))))))))))))))))))))))))))) ==>
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((_cUR <= _aT) /\ (_aT < (_cUR + 8))) ? ((((res.`1 =
                                                (_dELTA +
                                                ((((_lEN <
                                                   (8 - (_aT - _cUR))) ? 
                                                  _lEN : (8 - (_aT - _cUR))) <
                                                 0) ? 0 : ((_lEN <
                                                           (8 - (_aT - _cUR))) ? 
                                                          _lEN : (8 -
                                                                 (_aT - _cUR)))))) /\
                                               (res.`2 =
                                               (_lEN -
                                               ((((_lEN < (8 - (_aT - _cUR))) ? 
                                                 _lEN : (8 - (_aT - _cUR))) <
                                                0) ? 0 : ((_lEN <
                                                          (8 - (_aT - _cUR))) ? 
                                                         _lEN : (8 -
                                                                (_aT - _cUR))))))) /\
                                              (res.`3 =
                                              ((8 <= ((_aT - _cUR) + _lEN)) ? 
                                              _tRAIL : 0))) /\
                                             (res.`4 =
                                             (_cUR +
                                             (((((((_aT - _cUR) + _lEN) < 8) ? 
                                                ((_aT - _cUR) + _lEN) : 8) +
                                               (((8 <= ((_aT - _cUR) + _lEN)) \/
                                                (_tRAIL = 0)) ? 0 : 1)) <
                                              0) ? 0 : (((((_aT - _cUR) +
                                                          _lEN) <
                                                         8) ? ((_aT - _cUR) +
                                                              _lEN) : 8) +
                                                       (((8 <=
                                                         ((_aT - _cUR) +
                                                         _lEN)) \/
                                                        (_tRAIL = 0)) ? 0 : 1)))))) : 
    ((((res.`1 = _dELTA) /\ (res.`2 = _lEN)) /\ (res.`3 = _tRAIL)) /\
    (res.`4 = _aT)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`6))].

op a1568____addstate_ref_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB =
   hoare [M(Syscall).a1568____addstate_ref :
   (((__TRAILB = _TRAILB) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st)))))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   ((true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    ((((0 <= __TRAILB) /\ (__TRAILB < 256)) /\ (0 <= _aT)) /\
    (((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)) < 200)))))))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
   (((0 <= (_offset + __LEN)) /\ ((_offset + __LEN) <= 18446744073709551615)) /\
   (((0 <= 1568) /\ (1568 <= 18446744073709551615)) /\
   (((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= 1568)) /\
    (BArray1568.is_init _b_buf _offset __LEN)) /\
   (BArray200.is_init _b_st 0 200))))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`4) /\ (res.`4 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
    (((0 <= (_offset + __LEN)) /\
     ((_offset + __LEN) <= 18446744073709551615)) /\
    (((BArray200.is_init res.`2 0 200) /\
     (res.`3 = ((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)))) /\
    (res.`4 = (_offset + __LEN))))))))))))))))))) /\
   (valid res.`5))].

op a1568____absorb_ref_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8 =
   hoare [M(Syscall).a1568____absorb_ref :
   (((__RATE8 = _RATE8) /\
    ((__TRAILB = _TRAILB) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st))))))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   ((((((((0 < __RATE8) /\ (__RATE8 < 200)) /\ (0 <= __TRAILB)) /\
       (__TRAILB < 256)) /\
      (0 <= _aT)) /\
     (_aT < __RATE8)) /\
    (BArray1568.is_init _b_buf 0 1568)) /\
   (BArray200.is_init _b_st 0 (7 * 32))))))))))) ==>
   ((BArray200.is_init res.`2 0 (7 * 32)) /\ (valid res.`4))].

op _shake256_128_33_spec _out _b_out _in _b_in =
   hoare [M(Syscall)._shake256_128_33 :
   (((_b_in = b_in) /\ ((_in = in_0) /\ ((_b_out = b_out) /\ (_out = out)))) /\
   (BArray33.is_init _b_in 0 33)) ==>
   ((BArray128.is_init res.`2 0 128) /\ (valid res.`3))].

op _shake256_A32__A1600_spec _out _b_out _in0 _b_in0 _in1 _b_in1 =
   hoare [M(Syscall)._shake256_A32__A1600 :
   (((_b_in1 = b_in1) /\
    ((_in1 = in1) /\
    ((_b_in0 = b_in0) /\
    ((_in0 = in0) /\ ((_b_out = b_out) /\ (_out = out)))))) /\
   ((BArray32.is_init _b_in0 0 32) /\ (BArray1568.is_init _b_in1 0 1568))) ==>
   ((BArray32.is_init res.`2 0 32) /\ (valid res.`3))].

op _sha3_512A_A33_spec _out _b_out _in _b_in =
   hoare [M(Syscall)._sha3_512A_A33 :
   (((_b_in = b_in) /\ ((_in = in_0) /\ ((_b_out = b_out) /\ (_out = out)))) /\
   (BArray33.is_init _b_in 0 33)) ==>
   ((BArray64.is_init res.`2 0 64) /\ (valid res.`3))].

op _shake128_absorb34_spec _st _b_st _in _b_in =
   hoare [M(Syscall)._shake128_absorb34 :
   (((_b_in = b_in) /\ ((_in = in_0) /\ ((_b_st = b_st) /\ (_st = st)))) /\
   (BArray34.is_init _b_in 0 34)) ==>
   ((BArray200.is_init res.`2 0 (25 * 8)) /\ (valid res.`3))].

op _shake128_squeezeblock_spec _st _b_st _out _b_out =
   hoare [M(Syscall)._shake128_squeezeblock :
   (((_b_out = b_out) /\ ((_out = out) /\ ((_b_st = b_st) /\ (_st = st)))) /\
   (BArray200.is_init _b_st 0 (25 * 8))) ==>
   (((BArray200.is_init res.`2 0 (25 * 8)) /\
    (BArray168.is_init res.`4 0 168)) /\
   (valid res.`5))].

op _sha3_256A_A1568_spec _out _b_out _in _b_in =
   hoare [M(Syscall)._sha3_256A_A1568 :
   (((_b_in = b_in) /\ ((_in = in_0) /\ ((_b_out = b_out) /\ (_out = out)))) /\
   (BArray1568.is_init _b_in 0 1568)) ==>
   ((BArray32.is_init res.`2 0 32) /\ (valid res.`3))].

op _sha3_512A_A64_spec _out _b_out _in _b_in =
   hoare [M(Syscall)._sha3_512A_A64 :
   (((_b_in = b_in) /\ ((_in = in_0) /\ ((_b_out = b_out) /\ (_out = out)))) /\
   (BArray64.is_init _b_in 0 64)) ==>
   ((BArray64.is_init res.`2 0 64) /\ (valid res.`3))].

op _poly_add2_spec _rp _b_rp _bp _b_bp =
   hoare [M(Syscall)._poly_add2 :
   (((_b_bp = b_bp) /\ ((_bp = bp) /\ ((_b_rp = b_rp) /\ (_rp = rp)))) /\
   ((BArray512.is_init _b_bp 0 512) /\ (BArray512.is_init _b_rp 0 512))) ==>
   ((BArray512.is_init res.`2 0 512) /\ (valid res.`3))].

op _poly_csubq_spec _rp _b_rp =
   hoare [M(Syscall)._poly_csubq :
   (((_b_rp = b_rp) /\ (_rp = rp)) /\ (BArray512.is_init _b_rp 0 512)) ==>
   ((BArray512.is_init res.`2 0 512) /\ (valid res.`3))].

op _poly_basemul_spec _rp _b_rp _ap _b_ap _bp _b_bp =
   hoare [M(Syscall)._poly_basemul :
   (((_b_bp = b_bp) /\
    ((_bp = bp) /\
    ((_b_ap = b_ap) /\ ((_ap = ap) /\ ((_b_rp = b_rp) /\ (_rp = rp)))))) /\
   ((BArray512.is_init _b_ap 0 (32 * 16)) /\
   (BArray512.is_init _b_bp 0 (32 * 16)))) ==>
   ((BArray512.is_init res.`2 0 (32 * 16)) /\ (valid res.`3))].

op __poly_reduce_spec _rp _b_rp =
   hoare [M(Syscall).__poly_reduce :
   (((_b_rp = b_rp) /\ (_rp = rp)) /\ (BArray512.is_init _b_rp 0 512)) ==>
   ((BArray512.is_init res.`2 0 512) /\ (valid res.`3))].

op _poly_frombytes_spec _rp _b_rp _ap _b_ap =
   hoare [M(Syscall)._poly_frombytes :
   (((_b_ap = b_ap) /\ ((_ap = ap) /\ ((_b_rp = b_rp) /\ (_rp = rp)))) /\
   (BArray384.is_init _b_ap 0 384)) ==>
   ((BArray512.is_init res.`2 0 (16 * 32)) /\ (valid res.`3))].

op _poly_frommont_spec _rp _b_rp =
   hoare [M(Syscall)._poly_frommont :
   (((_b_rp = b_rp) /\ (_rp = rp)) /\ (BArray512.is_init _b_rp 0 512)) ==>
   ((BArray512.is_init res.`2 0 512) /\ (valid res.`3))].

op _i_poly_frommsg_spec _rp _b_rp _ap _b_ap =
   hoare [M(Syscall)._i_poly_frommsg :
   (((_b_ap = b_ap) /\ ((_ap = ap) /\ ((_b_rp = b_rp) /\ (_rp = rp)))) /\
   (BArray32.is_init _b_ap 0 32)) ==>
   ((BArray512.is_init res.`2 0 (16 * 32)) /\ (valid res.`3))].

op _poly_getnoise_spec _rp _b_rp _s_seed _b_s_seed _nonce =
   hoare [M(Syscall)._poly_getnoise :
   (((_nonce = nonce) /\
    ((_b_s_seed = b_s_seed) /\
    ((_s_seed = s_seed) /\ ((_b_rp = b_rp) /\ (_rp = rp))))) /\
   (BArray32.is_init _b_s_seed 0 32)) ==>
   ((BArray512.is_init res.`2 0 (256 * 2)) /\ (valid res.`3))].

op _poly_invntt_spec _rp _b_rp =
   hoare [M(Syscall)._poly_invntt :
   (((_b_rp = b_rp) /\ (_rp = rp)) /\ (BArray512.is_init _b_rp 0 512)) ==>
   ((BArray512.is_init res.`2 0 512) /\ (valid res.`3))].

op _poly_ntt_spec _rp _b_rp =
   hoare [M(Syscall)._poly_ntt :
   (((_b_rp = b_rp) /\ (_rp = rp)) /\ (BArray512.is_init _b_rp 0 512)) ==>
   ((BArray512.is_init res.`2 0 512) /\ (valid res.`3))].

op _poly_sub_spec _rp _b_rp _ap _b_ap _bp _b_bp =
   hoare [M(Syscall)._poly_sub :
   (((_b_bp = b_bp) /\
    ((_bp = bp) /\
    ((_b_ap = b_ap) /\ ((_ap = ap) /\ ((_b_rp = b_rp) /\ (_rp = rp)))))) /\
   ((BArray512.is_init _b_ap 0 (32 * 16)) /\
   (BArray512.is_init _b_bp 0 (32 * 16)))) ==>
   ((BArray512.is_init res.`2 0 (32 * 16)) /\ (valid res.`3))].

op _poly_tobytes_spec _rp _b_rp _a _b_a =
   hoare [M(Syscall)._poly_tobytes :
   (((_b_a = b_a) /\ ((_a = a) /\ ((_b_rp = b_rp) /\ (_rp = rp)))) /\
   (BArray512.is_init _b_a 0 (2 * 256))) ==>
   (((BArray384.is_init res.`2 0 384) /\
    (BArray512.is_init res.`4 0 (2 * 256))) /\
   (valid res.`5))].

op _i_poly_tomsg_spec _rp _b_rp _a _b_a =
   hoare [M(Syscall)._i_poly_tomsg :
   (((_b_a = b_a) /\ ((_a = a) /\ ((_b_rp = b_rp) /\ (_rp = rp)))) /\
   (BArray512.is_init _b_a 0 (2 * 256))) ==>
   (((BArray32.is_init res.`2 0 (256 %/ 8)) /\
    (BArray512.is_init res.`4 0 (2 * 256))) /\
   (valid res.`5))].

op _i_poly_compress_spec _rp _b_rp _a _b_a =
   hoare [M(Syscall)._i_poly_compress :
   (((_b_a = b_a) /\ ((_a = a) /\ ((_b_rp = b_rp) /\ (_rp = rp)))) /\
   (BArray512.is_init _b_a 0 (2 * 256))) ==>
   (((BArray160.is_init res.`2 0 160) /\
    (BArray512.is_init res.`4 0 (2 * 256))) /\
   (valid res.`5))].

op _i_poly_decompress_spec _rp _b_rp _ap _b_ap =
   hoare [M(Syscall)._i_poly_decompress :
   (((_b_ap = b_ap) /\ ((_ap = ap) /\ ((_b_rp = b_rp) /\ (_rp = rp)))) /\
   (BArray160.is_init _b_ap 0 160)) ==>
   ((BArray512.is_init res.`2 0 (256 * 2)) /\ (valid res.`3))].

op __polyvec_add2_spec _r _b_r _b _b_b =
   hoare [M(Syscall).__polyvec_add2 :
   (((_b_b = b_b) /\ ((_b = b) /\ ((_b_r = b_r) /\ (_r = r)))) /\
   ((BArray2048.is_init _b_b 0 2048) /\ (BArray2048.is_init _b_r 0 2048))) ==>
   ((BArray2048.is_init res.`2 0 2048) /\ (valid res.`3))].

op __polyvec_csubq_spec _r _b_r =
   hoare [M(Syscall).__polyvec_csubq :
   (((_b_r = b_r) /\ (_r = r)) /\ (BArray2048.is_init _b_r 0 2048)) ==>
   ((BArray2048.is_init res.`2 0 2048) /\ (valid res.`3))].

op __i_polyvec_frombytes_spec _ap _b_ap =
   hoare [M(Syscall).__i_polyvec_frombytes :
   (((_b_ap = b_ap) /\ (_ap = ap)) /\ (BArray1536.is_init _b_ap 0 1536)) ==>
   ((BArray2048.is_init res.`2 0 2048) /\ (valid res.`3))].

op __polyvec_invntt_spec _r _b_r =
   hoare [M(Syscall).__polyvec_invntt :
   (((_b_r = b_r) /\ (_r = r)) /\ (BArray2048.is_init _b_r 0 2048)) ==>
   ((BArray2048.is_init res.`2 0 2048) /\ (valid res.`3))].

op __polyvec_ntt_spec _r _b_r =
   hoare [M(Syscall).__polyvec_ntt :
   (((_b_r = b_r) /\ (_r = r)) /\ (BArray2048.is_init _b_r 0 2048)) ==>
   ((BArray2048.is_init res.`2 0 2048) /\ (valid res.`3))].

op __polyvec_pointwise_acc_spec _a _b_a _b _b_b =
   hoare [M(Syscall).__polyvec_pointwise_acc :
   (((_b_b = b_b) /\ ((_b = b) /\ ((_b_a = b_a) /\ (_a = a)))) /\
   ((BArray2048.is_init _b_b 0 2048) /\ (BArray2048.is_init _b_a 0 2048))) ==>
   ((BArray512.is_init res.`2 0 512) /\ (valid res.`3))].

op __polyvec_reduce_spec _r _b_r =
   hoare [M(Syscall).__polyvec_reduce :
   (((_b_r = b_r) /\ (_r = r)) /\ (BArray2048.is_init _b_r 0 2048)) ==>
   ((BArray2048.is_init res.`2 0 2048) /\ (valid res.`3))].

op __i_polyvec_tobytes_spec _rp _b_rp _a _b_a =
   hoare [M(Syscall).__i_polyvec_tobytes :
   (((_b_a = b_a) /\ ((_a = a) /\ ((_b_rp = b_rp) /\ (_rp = rp)))) /\
   (BArray2048.is_init _b_a 0 (2 * (4 * 256)))) ==>
   ((BArray1536.is_init res.`2 0 (4 * 384)) /\ (valid res.`3))].

op __i_polyvec_compress_spec _rp _b_rp _a _b_a =
   hoare [M(Syscall).__i_polyvec_compress :
   (((_b_a = b_a) /\ ((_a = a) /\ ((_b_rp = b_rp) /\ (_rp = rp)))) /\
   (BArray2048.is_init _b_a 0 ((4 * 256) * 2))) ==>
   ((BArray1408.is_init res.`2 0 (4 * 352)) /\ (valid res.`3))].

op __i_polyvec_decompress_spec _rp _b_rp _ap _b_ap =
   hoare [M(Syscall).__i_polyvec_decompress :
   (((_b_ap = b_ap) /\ ((_ap = ap) /\ ((_b_rp = b_rp) /\ (_rp = rp)))) /\
   (BArray1408.is_init _b_ap 0 (4 * 352))) ==>
   ((BArray2048.is_init res.`2 0 ((4 * 256) * 2)) /\ (valid res.`3))].

op __rej_uniform_spec _rp _b_rp _offset _buf _b_buf =
   hoare [M(Syscall).__rej_uniform :
   (((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_offset = offset) /\ ((_b_rp = b_rp) /\ (_rp = rp))))) /\
   ((true /\ (true /\ ((0 <= _offset) /\ (_offset <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (((0 <= 2) /\ (2 <= 18446744073709551615)) /\
   (((0 <= (_offset * 2)) /\ ((_offset * 2) <= 18446744073709551615)) /\
   ((BArray168.is_init _b_buf 0 168) /\
   (BArray512.is_init _b_rp 0 (_offset * 2)))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= 2) /\ (2 <= 18446744073709551615)) /\
    (((0 <= (2 * res.`1)) /\ ((2 * res.`1) <= 18446744073709551615)) /\
    ((BArray512.is_init res.`3 0 (2 * res.`1)) /\ (_offset <= res.`1)))))))))) /\
   (valid res.`4))].

op __gen_matrix_spec _seed _b_seed _transposed =
   hoare [M(Syscall).__gen_matrix :
   (((_transposed = transposed) /\ ((_b_seed = b_seed) /\ (_seed = seed))) /\
   (true /\
   (true /\
   (((BArray32.is_init _b_seed 0 32) /\ ((W64.of_int 0) \ule _transposed)) /\
   (_transposed \ule (W64.of_int 1)))))) ==>
   ((BArray8192.is_init res.`2 0 ((4 * (4 * 256)) * 2)) /\ (valid res.`3))].

op __indcpa_keypair_spec _pk _b_pk _sk _b_sk _randomnessp _b_randomnessp =
   hoare [M(Syscall).__indcpa_keypair :
   (((_b_randomnessp = b_randomnessp) /\
    ((_randomnessp = randomnessp) /\
    ((_b_sk = b_sk) /\ ((_sk = sk) /\ ((_b_pk = b_pk) /\ (_pk = pk)))))) /\
   (BArray32.is_init _b_randomnessp 0 32)) ==>
   (((BArray1568.is_init res.`2 0 ((4 * 384) + 32)) /\
    (BArray1536.is_init res.`4 0 (4 * 384))) /\
   (valid res.`5))].

op __indcpa_enc_spec _ct _b_ct _msgp _b_msgp _pk _b_pk _noiseseed _b_noiseseed =
   hoare [M(Syscall).__indcpa_enc :
   (((_b_noiseseed = b_noiseseed) /\
    ((_noiseseed = noiseseed) /\
    ((_b_pk = b_pk) /\
    ((_pk = pk) /\
    ((_b_msgp = b_msgp) /\
    ((_msgp = msgp) /\ ((_b_ct = b_ct) /\ (_ct = ct)))))))) /\
   (((BArray32.is_init _b_msgp 0 32) /\
    (BArray1568.is_init _b_pk 0 ((4 * 384) + 32))) /\
   (BArray32.is_init _b_noiseseed 0 32))) ==>
   ((BArray1568.is_init res.`2 0 ((4 * 352) + 160)) /\ (valid res.`3))].

op __indcpa_dec_spec _msgp _b_msgp _ct _b_ct _sk _b_sk =
   hoare [M(Syscall).__indcpa_dec :
   (((_b_sk = b_sk) /\
    ((_sk = sk) /\
    ((_b_ct = b_ct) /\
    ((_ct = ct) /\ ((_b_msgp = b_msgp) /\ (_msgp = msgp)))))) /\
   ((BArray1568.is_init _b_ct 0 ((4 * 352) + 160)) /\
   (BArray1536.is_init _b_sk 0 (4 * 384)))) ==>
   ((BArray32.is_init res.`2 0 32) /\ (valid res.`3))].

op __verify_spec _ctp _b_ctp _ctpc _b_ctpc =
   hoare [M(Syscall).__verify :
   (((_b_ctpc = b_ctpc) /\
    ((_ctpc = ctpc) /\ ((_b_ctp = b_ctp) /\ (_ctp = ctp)))) /\
   ((BArray1568.is_init _b_ctpc 0 1568) /\
   (BArray1568.is_init _b_ctp 0 1568))) ==> (true /\ (valid res.`2))].

op __cmov_spec _dst _b_dst _src _b_src _cnd =
   hoare [M(Syscall).__cmov :
   (((_cnd = cnd) /\
    ((_b_src = b_src) /\
    ((_src = src) /\ ((_b_dst = b_dst) /\ (_dst = dst))))) /\
   ((BArray32.is_init _b_src 0 32) /\ (BArray32.is_init _b_dst 0 32))) ==>
   ((BArray32.is_init res.`2 0 32) /\ (valid res.`3))].

op __crypto_kem_keypair_jazz_spec _pk _b_pk _sk _b_sk _randomnessp _b_randomnessp =
   hoare [M(Syscall).__crypto_kem_keypair_jazz :
   (((_b_randomnessp = b_randomnessp) /\
    ((_randomnessp = randomnessp) /\
    ((_b_sk = b_sk) /\ ((_sk = sk) /\ ((_b_pk = b_pk) /\ (_pk = pk)))))) /\
   (BArray64.is_init _b_randomnessp 0 (32 * 2))) ==>
   (((BArray1568.is_init res.`2 0 ((4 * 384) + 32)) /\
    (BArray3168.is_init res.`4 0 ((((4 * 384) + ((4 * 384) + 32)) + 32) + 32)
    )) /\
   (valid res.`5))].

op __crypto_kem_enc_jazz_spec _ct _b_ct _shk _b_shk _pk _b_pk _randomnessp _b_randomnessp =
   hoare [M(Syscall).__crypto_kem_enc_jazz :
   (((_b_randomnessp = b_randomnessp) /\
    ((_randomnessp = randomnessp) /\
    ((_b_pk = b_pk) /\
    ((_pk = pk) /\
    ((_b_shk = b_shk) /\ ((_shk = shk) /\ ((_b_ct = b_ct) /\ (_ct = ct)))))))) /\
   ((BArray32.is_init _b_randomnessp 0 32) /\
   (BArray1568.is_init _b_pk 0 ((4 * 384) + 32)))) ==>
   (((BArray1568.is_init res.`2 0 ((4 * 352) + 160)) /\
    (BArray32.is_init res.`4 0 32)) /\
   (valid res.`5))].

op __crypto_kem_dec_jazz_spec _shk _b_shk _ct _b_ct _sk _b_sk =
   hoare [M(Syscall).__crypto_kem_dec_jazz :
   (((_b_sk = b_sk) /\
    ((_sk = sk) /\
    ((_b_ct = b_ct) /\ ((_ct = ct) /\ ((_b_shk = b_shk) /\ (_shk = shk)))))) /\
   ((BArray1568.is_init _b_ct 0 ((4 * 352) + 160)) /\
   (BArray3168.is_init _b_sk 0 ((((4 * 384) + ((4 * 384) + 32)) + 32) + 32)))) ==>
   ((BArray32.is_init res.`2 0 32) /\ (valid res.`3))].

op jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand_spec _public_key _b_public_key _secret_key _b_secret_key _coins _b_coins =
   hoare [M(Syscall).jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand :
   (((_b_coins = b_coins) /\
    ((_coins = coins) /\
    ((_b_secret_key = b_secret_key) /\
    ((_secret_key = secret_key) /\
    ((_b_public_key = b_public_key) /\ (_public_key = public_key)))))) /\
   (BArray64.is_init _b_coins 0 (2 * 32))) ==>
   (((BArray1568.is_init res.`2 0 ((4 * 384) + 32)) /\
    (BArray3168.is_init res.`4 0 ((((4 * 384) + ((4 * 384) + 32)) + 32) + 32)
    )) /\
   (valid res.`6))].

op jade_kem_mlkem_mlkem1024_amd64_ref_keypair_spec _public_key _b_public_key _secret_key _b_secret_key =
   hoare [M(Syscall).jade_kem_mlkem_mlkem1024_amd64_ref_keypair :
   (((_b_secret_key = b_secret_key) /\
    ((_secret_key = secret_key) /\
    ((_b_public_key = b_public_key) /\ (_public_key = public_key)))) /\
   true) ==>
   (((BArray1568.is_init res.`2 0 ((4 * 384) + 32)) /\
    (BArray3168.is_init res.`4 0 ((((4 * 384) + ((4 * 384) + 32)) + 32) + 32)
    )) /\
   (valid res.`6))].

op jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand_spec _ciphertext _b_ciphertext _shared_secret _b_shared_secret _public_key _b_public_key _coins _b_coins =
   hoare [M(Syscall).jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand :
   (((_b_coins = b_coins) /\
    ((_coins = coins) /\
    ((_b_public_key = b_public_key) /\
    ((_public_key = public_key) /\
    ((_b_shared_secret = b_shared_secret) /\
    ((_shared_secret = shared_secret) /\
    ((_b_ciphertext = b_ciphertext) /\ (_ciphertext = ciphertext)))))))) /\
   ((BArray1568.is_init _b_public_key 0 ((4 * 384) + 32)) /\
   (BArray32.is_init _b_coins 0 32))) ==>
   (((BArray1568.is_init res.`2 0 ((4 * 352) + 160)) /\
    (BArray32.is_init res.`4 0 32)) /\
   (valid res.`6))].

op jade_kem_mlkem_mlkem1024_amd64_ref_enc_spec _ciphertext _b_ciphertext _shared_secret _b_shared_secret _public_key _b_public_key =
   hoare [M(Syscall).jade_kem_mlkem_mlkem1024_amd64_ref_enc :
   (((_b_public_key = b_public_key) /\
    ((_public_key = public_key) /\
    ((_b_shared_secret = b_shared_secret) /\
    ((_shared_secret = shared_secret) /\
    ((_b_ciphertext = b_ciphertext) /\ (_ciphertext = ciphertext)))))) /\
   (BArray1568.is_init _b_public_key 0 ((4 * 384) + 32))) ==>
   (((BArray1568.is_init res.`2 0 ((4 * 352) + 160)) /\
    (BArray32.is_init res.`4 0 32)) /\
   (valid res.`6))].

op jade_kem_mlkem_mlkem1024_amd64_ref_dec_spec _shared_secret _b_shared_secret _ciphertext _b_ciphertext _secret_key _b_secret_key =
   hoare [M(Syscall).jade_kem_mlkem_mlkem1024_amd64_ref_dec :
   (((_b_secret_key = b_secret_key) /\
    ((_secret_key = secret_key) /\
    ((_b_ciphertext = b_ciphertext) /\
    ((_ciphertext = ciphertext) /\
    ((_b_shared_secret = b_shared_secret) /\
    (_shared_secret = shared_secret)))))) /\
   ((BArray1568.is_init _b_ciphertext 0 ((4 * 352) + 160)) /\
   (BArray3168.is_init _b_secret_key 0
   ((((4 * 384) + ((4 * 384) + 32)) + 32) + 32)))) ==>
   ((BArray32.is_init res.`2 0 32) /\ (valid res.`4))].
