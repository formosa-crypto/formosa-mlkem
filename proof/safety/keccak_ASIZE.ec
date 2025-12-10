require import AllCore IntDiv CoreMap List Distr.

from Jasmin require import JModel_x86.

import SLH64.

require import Jcheck JSafety.

from Jasmin require import JByte_array.

from JazzEC  require import
Array5 Array6 Array7 Array24 Array25 Array160 Array200 Array224 
Array800 WArray192 BArray160 BArray192 BArray200 BArray224 
BArray800.

theory KECCAK_ARRAY_ASIZE.

op size : int.

axiom inbounds_size : 0 <= size < 18446744073709551616.

clone import ByteArray as BArrayS with op size <= size .

abbrev ROL8 =
(W256.of_int
13620818001941277694121380808605999856886653716761013959207994299728839901191
).

abbrev ROL56 =
(W256.of_int
10910488462195273559651782724632284871561478246514020268633800075540923875841
).

abbrev KECCAK_RHOTATES_RIGHT =
(BArray192.of_list256
[(W256.of_int 144373339913893657577751063007562604548177214458152943091773);
(W256.of_int 232252764209307188274174373867837442080505530800860351692863);
(W256.of_int 156927543384667019098616994515559168111335794127330162507795);
(W256.of_int 351517697181654122777866749001917765472957616589092975280182);
(W256.of_int 276192476357013953622045746931053922384479139705868246843454);
(W256.of_int 313855086769334038206421612937983674734430261968315659321364)]).

abbrev KECCAK_RHOTATES_LEFT =
(BArray192.of_list256
[(W256.of_int 257361171150853911329517531560668107745210100483895842570243);
(W256.of_int 169481746855440380633094220700393270212881784141188433969153);
(W256.of_int 244806967680080549808651600052671544182051520814718623154221);
(W256.of_int 50216813883093446129401845566312946820429698352955810381834);
(W256.of_int 125542034707733615285222847637176789908908175236180538818562);
(W256.of_int 87879424295413530700846981630247037558957052973733126340652)]).

abbrev KECCAK1600_RC =
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


module M = {
  var tmp__trace : trace
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
    var result:int;
    var param_0:int;
    var param_1:int;
    var result_0:int;
    var trace_keccakf1600_rhotates:trace;
    trace_keccakf1600_rhotates <- [];
    param_1 <- x;
    param_0 <- y;
    (result_0, tmp__trace) <@ keccakf1600_index (param_1, param_0);
    trace_keccakf1600_rhotates <-
    (trace_keccakf1600_rhotates ++ tmp__trace);
    i <- result_0;
    param <- i;
    (result, tmp__trace) <@ keccakf1600_rho_offsets (param);
    trace_keccakf1600_rhotates <-
    (trace_keccakf1600_rhotates ++ tmp__trace);
    r <- result;
    return (r, trace_keccakf1600_rhotates);
  }
  proc __keccakf1600_pround_avx2 (state:BArray224.t,
                                           b_state:BArray224.t) : BArray224.t *
                                                                  BArray224.t *
                                                                  trace = {
    var c00:W256.t;
    var c14:W256.t;
    var t2:W256.t;
    var t4:W256.t;
    var t0:W256.t;
    var t1:W256.t;
    var d14:W256.t;
    var d00:W256.t;
    var t3:W256.t;
    var t5:W256.t;
    var t6:W256.t;
    var t7:W256.t;
    var t8:W256.t;
    var trace___keccakf1600_pround_avx2:trace;
    trace___keccakf1600_pround_avx2 <- [];
    trace___keccakf1600_pround_avx2 <-
    (trace___keccakf1600_pround_avx2 ++
    [(Assert, (is_init b_state 0 224))]);
    c00 <- (VPSHUFD_256 (BArray224.get256 state 2) (W8.of_int 78));
    c14 <- ((BArray224.get256 state 5) `^` (BArray224.get256 state 3));
    t2 <- ((BArray224.get256 state 4) `^` (BArray224.get256 state 6));
    c14 <- (c14 `^` (BArray224.get256 state 1));
    c14 <- (c14 `^` t2);
    t4 <- (VPERMQ c14 (W8.of_int 147));
    c00 <- (c00 `^` (BArray224.get256 state 2));
    t0 <- (VPERMQ c00 (W8.of_int 78));
    t1 <- (c14 \vshr64u256 (W128.of_int 63));
    t2 <- (c14 \vadd64u256 c14);
    t1 <- (t1 `|` t2);
    d14 <- (VPERMQ t1 (W8.of_int 57));
    d00 <- (t1 `^` t4);
    d00 <- (VPERMQ d00 (W8.of_int 0));
    c00 <- (c00 `^` (BArray224.get256 state 0));
    c00 <- (c00 `^` t0);
    t0 <- (c00 \vshr64u256 (W128.of_int 63));
    t1 <- (c00 \vadd64u256 c00);
    t1 <- (t1 `|` t0);
    state <- (BArray224.set256 state 2 ((BArray224.get256 state 2) `^` d00));
    state <- (BArray224.set256 state 0 ((BArray224.get256 state 0) `^` d00));
    d14 <- (VPBLEND_8u32 d14 t1 (W8.of_int 192));
    t4 <- (VPBLEND_8u32 t4 c00 (W8.of_int 3));
    d14 <- (d14 `^` t4);
    t3 <-
    (VPSLLV_4u64 (BArray224.get256 state 2)
    (BArray192.get256 KECCAK_RHOTATES_LEFT 0));
    state <-
    (BArray224.set256 state 2
    (VPSRLV_4u64 (BArray224.get256 state 2)
    (BArray192.get256 KECCAK_RHOTATES_RIGHT 0)));
    state <- (BArray224.set256 state 2 ((BArray224.get256 state 2) `|` t3));
    state <- (BArray224.set256 state 3 ((BArray224.get256 state 3) `^` d14));
    t4 <-
    (VPSLLV_4u64 (BArray224.get256 state 3)
    (BArray192.get256 KECCAK_RHOTATES_LEFT 2));
    state <-
    (BArray224.set256 state 3
    (VPSRLV_4u64 (BArray224.get256 state 3)
    (BArray192.get256 KECCAK_RHOTATES_RIGHT 2)));
    state <- (BArray224.set256 state 3 ((BArray224.get256 state 3) `|` t4));
    state <- (BArray224.set256 state 4 ((BArray224.get256 state 4) `^` d14));
    t5 <-
    (VPSLLV_4u64 (BArray224.get256 state 4)
    (BArray192.get256 KECCAK_RHOTATES_LEFT 3));
    state <-
    (BArray224.set256 state 4
    (VPSRLV_4u64 (BArray224.get256 state 4)
    (BArray192.get256 KECCAK_RHOTATES_RIGHT 3)));
    state <- (BArray224.set256 state 4 ((BArray224.get256 state 4) `|` t5));
    state <- (BArray224.set256 state 5 ((BArray224.get256 state 5) `^` d14));
    t6 <-
    (VPSLLV_4u64 (BArray224.get256 state 5)
    (BArray192.get256 KECCAK_RHOTATES_LEFT 4));
    state <-
    (BArray224.set256 state 5
    (VPSRLV_4u64 (BArray224.get256 state 5)
    (BArray192.get256 KECCAK_RHOTATES_RIGHT 4)));
    state <- (BArray224.set256 state 5 ((BArray224.get256 state 5) `|` t6));
    state <- (BArray224.set256 state 6 ((BArray224.get256 state 6) `^` d14));
    t3 <- (VPERMQ (BArray224.get256 state 2) (W8.of_int 141));
    t4 <- (VPERMQ (BArray224.get256 state 3) (W8.of_int 141));
    t7 <-
    (VPSLLV_4u64 (BArray224.get256 state 6)
    (BArray192.get256 KECCAK_RHOTATES_LEFT 5));
    t1 <-
    (VPSRLV_4u64 (BArray224.get256 state 6)
    (BArray192.get256 KECCAK_RHOTATES_RIGHT 5));
    t1 <- (t1 `|` t7);
    state <- (BArray224.set256 state 1 ((BArray224.get256 state 1) `^` d14));
    t5 <- (VPERMQ (BArray224.get256 state 4) (W8.of_int 27));
    t6 <- (VPERMQ (BArray224.get256 state 5) (W8.of_int 114));
    t8 <-
    (VPSLLV_4u64 (BArray224.get256 state 1)
    (BArray192.get256 KECCAK_RHOTATES_LEFT 1));
    t2 <-
    (VPSRLV_4u64 (BArray224.get256 state 1)
    (BArray192.get256 KECCAK_RHOTATES_RIGHT 1));
    t2 <- (t2 `|` t8);
    t7 <- (VPSRLDQ_256 t1 (W8.of_int 8));
    t0 <- ((invw t1) `&` t7);
    state <- (BArray224.set256 state 3 (VPBLEND_8u32 t2 t6 (W8.of_int 12)));
    t8 <- (VPBLEND_8u32 t4 t2 (W8.of_int 12));
    state <- (BArray224.set256 state 5 (VPBLEND_8u32 t3 t4 (W8.of_int 12)));
    t7 <- (VPBLEND_8u32 t2 t3 (W8.of_int 12));
    state <-
    (BArray224.set256 state 3
    (VPBLEND_8u32 (BArray224.get256 state 3) t4 (W8.of_int 48)));
    t8 <- (VPBLEND_8u32 t8 t5 (W8.of_int 48));
    state <-
    (BArray224.set256 state 5
    (VPBLEND_8u32 (BArray224.get256 state 5) t2 (W8.of_int 48)));
    t7 <- (VPBLEND_8u32 t7 t6 (W8.of_int 48));
    state <-
    (BArray224.set256 state 3
    (VPBLEND_8u32 (BArray224.get256 state 3) t5 (W8.of_int 192)));
    t8 <- (VPBLEND_8u32 t8 t6 (W8.of_int 192));
    state <-
    (BArray224.set256 state 5
    (VPBLEND_8u32 (BArray224.get256 state 5) t6 (W8.of_int 192)));
    t7 <- (VPBLEND_8u32 t7 t4 (W8.of_int 192));
    state <-
    (BArray224.set256 state 3 ((invw (BArray224.get256 state 3)) `&` t8));
    state <-
    (BArray224.set256 state 5 ((invw (BArray224.get256 state 5)) `&` t7));
    state <- (BArray224.set256 state 6 (VPBLEND_8u32 t5 t2 (W8.of_int 12)));
    t8 <- (VPBLEND_8u32 t3 t5 (W8.of_int 12));
    state <- (BArray224.set256 state 3 ((BArray224.get256 state 3) `^` t3));
    state <-
    (BArray224.set256 state 6
    (VPBLEND_8u32 (BArray224.get256 state 6) t3 (W8.of_int 48)));
    t8 <- (VPBLEND_8u32 t8 t4 (W8.of_int 48));
    state <- (BArray224.set256 state 5 ((BArray224.get256 state 5) `^` t5));
    state <-
    (BArray224.set256 state 6
    (VPBLEND_8u32 (BArray224.get256 state 6) t4 (W8.of_int 192)));
    t8 <- (VPBLEND_8u32 t8 t2 (W8.of_int 192));
    state <-
    (BArray224.set256 state 6 ((invw (BArray224.get256 state 6)) `&` t8));
    state <- (BArray224.set256 state 6 ((BArray224.get256 state 6) `^` t6));
    state <- (BArray224.set256 state 4 (VPERMQ t1 (W8.of_int 30)));
    t8 <-
    (VPBLEND_8u32 (BArray224.get256 state 4) (BArray224.get256 state 0)
    (W8.of_int 48));
    state <- (BArray224.set256 state 1 (VPERMQ t1 (W8.of_int 57)));
    state <-
    (BArray224.set256 state 1
    (VPBLEND_8u32 (BArray224.get256 state 1) (BArray224.get256 state 0)
    (W8.of_int 192)));
    state <-
    (BArray224.set256 state 1 ((invw (BArray224.get256 state 1)) `&` t8));
    state <- (BArray224.set256 state 2 (VPBLEND_8u32 t4 t5 (W8.of_int 12)));
    t7 <- (VPBLEND_8u32 t6 t4 (W8.of_int 12));
    state <-
    (BArray224.set256 state 2
    (VPBLEND_8u32 (BArray224.get256 state 2) t6 (W8.of_int 48)));
    t7 <- (VPBLEND_8u32 t7 t3 (W8.of_int 48));
    state <-
    (BArray224.set256 state 2
    (VPBLEND_8u32 (BArray224.get256 state 2) t3 (W8.of_int 192)));
    t7 <- (VPBLEND_8u32 t7 t5 (W8.of_int 192));
    state <-
    (BArray224.set256 state 2 ((invw (BArray224.get256 state 2)) `&` t7));
    state <- (BArray224.set256 state 2 ((BArray224.get256 state 2) `^` t2));
    t0 <- (VPERMQ t0 (W8.of_int 0));
    state <-
    (BArray224.set256 state 3
    (VPERMQ (BArray224.get256 state 3) (W8.of_int 27)));
    state <-
    (BArray224.set256 state 5
    (VPERMQ (BArray224.get256 state 5) (W8.of_int 141)));
    state <-
    (BArray224.set256 state 6
    (VPERMQ (BArray224.get256 state 6) (W8.of_int 114)));
    state <- (BArray224.set256 state 4 (VPBLEND_8u32 t6 t3 (W8.of_int 12)));
    t7 <- (VPBLEND_8u32 t5 t6 (W8.of_int 12));
    state <-
    (BArray224.set256 state 4
    (VPBLEND_8u32 (BArray224.get256 state 4) t5 (W8.of_int 48)));
    t7 <- (VPBLEND_8u32 t7 t2 (W8.of_int 48));
    state <-
    (BArray224.set256 state 4
    (VPBLEND_8u32 (BArray224.get256 state 4) t2 (W8.of_int 192)));
    t7 <- (VPBLEND_8u32 t7 t3 (W8.of_int 192));
    state <-
    (BArray224.set256 state 4 ((invw (BArray224.get256 state 4)) `&` t7));
    state <- (BArray224.set256 state 0 ((BArray224.get256 state 0) `^` t0));
    state <- (BArray224.set256 state 1 ((BArray224.get256 state 1) `^` t1));
    state <- (BArray224.set256 state 4 ((BArray224.get256 state 4) `^` t4));
    b_state <- (BArray224.init_arr (W8.of_int 255) 224);
    return (state, b_state, trace___keccakf1600_pround_avx2);
  }
  proc _keccakf1600_avx2 (state:BArray224.t, b_state:BArray224.t) : 
  BArray224.t * BArray224.t * trace = {
    var round_constants:BArray192.t;
    var rc:W256.t;
    var r:int;
    var param:BArray224.t;
    var result:BArray224.t;
    var b_result:BArray224.t;
    var trace__keccakf1600_avx2:trace;
    b_result <- witness;
    param <- witness;
    result <- witness;
    round_constants <- witness;
    trace__keccakf1600_avx2 <- [];
    trace__keccakf1600_avx2 <-
    (trace__keccakf1600_avx2 ++ [(Assert, (is_init b_state 0 224))]);
    round_constants <- KECCAK1600_RC;
    r <- 0;
    param <- state;
    (result, b_result, tmp__trace) <@ __keccakf1600_pround_avx2 (
    param, (BArray224.init_arr (W8.of_int 255) 224));
    trace__keccakf1600_avx2 <-
    (trace__keccakf1600_avx2 ++ tmp__trace);
    trace__keccakf1600_avx2 <-
    (trace__keccakf1600_avx2 ++
    [(Assert, (is_init b_result 0 224))]);
    state <- result;
    trace__keccakf1600_avx2 <-
    (trace__keccakf1600_avx2 ++
    [(Assert, ((0 <= (r * 8)) /\ (((r * 8) + 8) <= 192)))]);
    rc <- (VPBROADCAST_4u64 (BArray192.get64 round_constants r));
    state <- (BArray224.set256 state 0 ((BArray224.get256 state 0) `^` rc));
    trace__keccakf1600_avx2 <-
    (trace__keccakf1600_avx2 ++
    [(Assert, ((0 <= (r + 1)) /\ ((r + 1) <= 18446744073709551615)))]);
    r <- (r + 1);
    while ((r < 24)) {
      param <- state;
      (result, b_result, tmp__trace) <@ __keccakf1600_pround_avx2 (
      param, (BArray224.init_arr (W8.of_int 255) 224));
      trace__keccakf1600_avx2 <-
      (trace__keccakf1600_avx2 ++ tmp__trace);
      trace__keccakf1600_avx2 <-
      (trace__keccakf1600_avx2 ++
      [(Assert, (is_init b_result 0 224))]);
      state <- result;
      trace__keccakf1600_avx2 <-
      (trace__keccakf1600_avx2 ++
      [(Assert, ((0 <= (r * 8)) /\ (((r * 8) + 8) <= 192)))]);
      rc <- (VPBROADCAST_4u64 (BArray192.get64 round_constants r));
      state <-
      (BArray224.set256 state 0 ((BArray224.get256 state 0) `^` rc));
      trace__keccakf1600_avx2 <-
      (trace__keccakf1600_avx2 ++
      [(Assert, ((0 <= (r + 1)) /\ ((r + 1) <= 18446744073709551615)))]);
      r <- (r + 1);
    }
    b_state <- (BArray224.init_arr (W8.of_int 255) 224);
    return (state, b_state, trace__keccakf1600_avx2);
  }
  proc __stavx2_pack (st:BArray200.t, b_st:BArray200.t) : BArray224.t *
                                                                   BArray224.t *
                                                                   trace = {
    var state:BArray224.t;
    var t128_0:W128.t;
    var t128_1:W128.t;
    var r:W64.t;
    var t256_0:W256.t;
    var t256_1:W256.t;
    var t256_2:W256.t;
    var b_state:BArray224.t;
    var trace___stavx2_pack:trace;
    b_state <- witness;
    state <- witness;
    trace___stavx2_pack <- [];
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (is_init b_st 0 200))]);
    b_state <- (BArray224.init_arr (W8.of_int 0) 224);
    b_state <-
    (BArray224.set256d b_state 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    state <-
    (BArray224.set256 state 0 (VPBROADCAST_4u64 (BArray200.get64d st 0)));
    b_state <-
    (BArray224.set256d b_state 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    state <- (BArray224.set256 state 1 (BArray200.get256d st 8));
    t128_0 <- (VMOV_64 (BArray200.get64 st 5));
    b_state <-
    (BArray224.set256d b_state 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    state <- (BArray224.set256 state 3 (BArray200.get256d st 48));
    t128_1 <- (VMOV_64 (BArray200.get64 st 10));
    b_state <-
    (BArray224.set256d b_state 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    state <- (BArray224.set256 state 4 (BArray200.get256d st 88));
    r <- (BArray200.get64 st 15);
    t128_0 <- (VPINSR_2u64 t128_0 r (W8.of_int 1));
    b_state <-
    (BArray224.set256d b_state 160
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    state <- (BArray224.set256 state 5 (BArray200.get256d st 128));
    r <- (BArray200.get64 st 20);
    t128_1 <- (VPINSR_2u64 t128_1 r (W8.of_int 1));
    b_state <-
    (BArray224.set256d b_state 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    state <-
    (BArray224.set256 state 2
    (W256.of_int
    (((W128.to_uint t128_1) %% (2 ^ 128)) +
    ((2 ^ 128) * (W128.to_uint t128_0)))));
    b_state <-
    (BArray224.set256d b_state 192
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    state <- (BArray224.set256 state 6 (BArray200.get256d st 168));
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (is_init b_state 96 32))]);
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (is_init b_state 160 32))]);
    t256_0 <-
    (VPBLEND_8u32 (BArray224.get256 state 3) (BArray224.get256 state 5)
    (W8.of_int 195));
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (is_init b_state 192 32))]);
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (is_init b_state 128 32))]);
    t256_1 <-
    (VPBLEND_8u32 (BArray224.get256 state 6) (BArray224.get256 state 4)
    (W8.of_int 195));
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (is_init b_state 128 32))]);
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (is_init b_state 96 32))]);
    t256_2 <-
    (VPBLEND_8u32 (BArray224.get256 state 4) (BArray224.get256 state 3)
    (W8.of_int 195));
    b_state <-
    (BArray224.set256d b_state 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    state <-
    (BArray224.set256 state 3 (VPBLEND_8u32 t256_0 t256_1 (W8.of_int 240)));
    b_state <-
    (BArray224.set256d b_state 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    state <-
    (BArray224.set256 state 4 (VPBLEND_8u32 t256_1 t256_0 (W8.of_int 240)));
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (is_init b_state 160 32))]);
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (is_init b_state 192 32))]);
    t256_0 <-
    (VPBLEND_8u32 (BArray224.get256 state 5) (BArray224.get256 state 6)
    (W8.of_int 195));
    b_state <-
    (BArray224.set256d b_state 160
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    state <-
    (BArray224.set256 state 5 (VPBLEND_8u32 t256_0 t256_2 (W8.of_int 240)));
    b_state <-
    (BArray224.set256d b_state 192
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    state <-
    (BArray224.set256 state 6 (VPBLEND_8u32 t256_2 t256_0 (W8.of_int 240)));
    return (state, b_state, trace___stavx2_pack);
  }
  proc __stavx2_unpack (st:BArray200.t, b_st:BArray200.t,
                                 state:BArray224.t, b_state:BArray224.t) : 
  BArray200.t * BArray200.t * trace = {
    var t128_0:W128.t;
    var t256_0:W256.t;
    var t256_1:W256.t;
    var t256_2:W256.t;
    var t256_3:W256.t;
    var t128_1:W128.t;
    var t256_4:W256.t;
    var trace___stavx2_unpack:trace;
    trace___stavx2_unpack <- [];
    trace___stavx2_unpack <-
    (trace___stavx2_unpack ++ [(Assert, (is_init b_state 0 224))]);
    t128_0 <- (truncateu128 (BArray224.get256 state 0));
    b_st <- (BArray200.set64d b_st 0 (W64.of_int 18446744073709551615));
    st <- (BArray200.set64 st 0 (VMOVLPD t128_0));
    b_st <-
    (BArray200.set256d b_st 8
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray200.set256d st 8 (BArray224.get256 state 1));
    t256_0 <-
    (VPBLEND_8u32 (BArray224.get256 state 3) (BArray224.get256 state 4)
    (W8.of_int 240));
    t256_1 <-
    (VPBLEND_8u32 (BArray224.get256 state 4) (BArray224.get256 state 3)
    (W8.of_int 240));
    t256_2 <-
    (VPBLEND_8u32 (BArray224.get256 state 5) (BArray224.get256 state 6)
    (W8.of_int 240));
    t256_3 <-
    (VPBLEND_8u32 (BArray224.get256 state 6) (BArray224.get256 state 5)
    (W8.of_int 240));
    t128_1 <- (VEXTRACTI128 (BArray224.get256 state 2) (W8.of_int 1));
    b_st <- (BArray200.set64d b_st 40 (W64.of_int 18446744073709551615));
    st <- (BArray200.set64 st 5 (VMOVLPD t128_1));
    t256_4 <- (VPBLEND_8u32 t256_0 t256_3 (W8.of_int 195));
    b_st <-
    (BArray200.set256d b_st 48
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray200.set256d st 48 t256_4);
    t128_0 <- (truncateu128 (BArray224.get256 state 2));
    b_st <- (BArray200.set64d b_st 80 (W64.of_int 18446744073709551615));
    st <- (BArray200.set64 st 10 (VMOVLPD t128_0));
    t256_4 <- (VPBLEND_8u32 t256_3 t256_1 (W8.of_int 195));
    b_st <-
    (BArray200.set256d b_st 88
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray200.set256d st 88 t256_4);
    b_st <- (BArray200.set64d b_st 120 (W64.of_int 18446744073709551615));
    st <- (BArray200.set64 st 15 (VMOVHPD t128_1));
    t256_4 <- (VPBLEND_8u32 t256_2 t256_0 (W8.of_int 195));
    b_st <-
    (BArray200.set256d b_st 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray200.set256d st 128 t256_4);
    b_st <- (BArray200.set64d b_st 160 (W64.of_int 18446744073709551615));
    st <- (BArray200.set64 st 20 (VMOVHPD t128_0));
    t256_4 <- (VPBLEND_8u32 t256_1 t256_2 (W8.of_int 195));
    b_st <-
    (BArray200.set256d b_st 168
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray200.set256d st 168 t256_4);
    return (st, b_st, trace___stavx2_unpack);
  }
  
  proc __u64_to_u256 (x:W64.t, l:int) : W256.t * trace = {
    var t256:W256.t;
    var t128:W128.t;
    var trace___u64_to_u256:trace;
    trace___u64_to_u256 <- [];
    if (((l %% 2) = 0)) {
      t128 <- (zeroextu128 x);
    } else {
      t128 <- (set0_128);
      t128 <- (VPINSR_2u64 t128 x (W8.of_int 1));
    }
    t256 <- (set0_256);
    if (((l %/ 2) = 0)) {
      t256 <- (VINSERTI128 t256 t128 (W8.of_int 0));
    } else {
      t256 <- (VINSERTI128 t256 t128 (W8.of_int 1));
    }
    return (t256, trace___u64_to_u256);
  }
  proc __state_init_avx2 () : BArray224.t * BArray224.t * trace = {
    var st:BArray224.t;
    var i:int;
    var b_st:BArray224.t;
    var trace___state_init_avx2:trace;
    b_st <- witness;
    st <- witness;
    trace___state_init_avx2 <- [];
    b_st <- (BArray224.init_arr (W8.of_int 0) 224);
    i <- 0;
    while ((i < 7)) {
      trace___state_init_avx2 <-
      (trace___state_init_avx2 ++
      [(Assert, (((0 <= i) /\ (i <= 7)) /\ (is_init b_st 0 (32 * i))))]);
      trace___state_init_avx2 <-
      (trace___state_init_avx2 ++
      [(Assert, ((0 <= (i * 32)) /\ (((i * 32) + 32) <= 224)))]);
      b_st <-
      (BArray224.set256d b_st (i * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      st <- (BArray224.set256 st i (set0_256));
      i <- (i + 1);
    }
    return (st, b_st, trace___state_init_avx2);
  }
  proc __pstate_init_avx2 (pst:BArray200.t, b_pst:BArray200.t) : 
  BArray200.t * BArray200.t * BArray224.t * BArray224.t * trace = {
    var st:BArray224.t;
    var z256:W256.t;
    var i:int;
    var z64:W64.t;
    var result:BArray224.t;
    var b_st:BArray224.t;
    var b_result:BArray224.t;
    var trace___pstate_init_avx2:trace;
    b_result <- witness;
    b_st <- witness;
    result <- witness;
    st <- witness;
    trace___pstate_init_avx2 <- [];
    z256 <- (set0_256);
    i <- 0;
    while ((i < 6)) {
      trace___pstate_init_avx2 <-
      (trace___pstate_init_avx2 ++
      [(Assert, (((0 <= i) /\ (i <= 6)) /\ (is_init b_pst 0 (32 * i))))]);
      trace___pstate_init_avx2 <-
      (trace___pstate_init_avx2 ++
      [(Assert, ((0 <= (i * 32)) /\ (((i * 32) + 32) <= 200)))]);
      b_pst <-
      (BArray200.set256d b_pst (i * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      pst <- (BArray200.set256 pst i z256);
      i <- (i + 1);
    }
    z64 <- (W64.of_int 0);
    b_pst <- (BArray200.set64d b_pst 192 (W64.of_int 18446744073709551615));
    pst <- (BArray200.set64 pst 24 z64);
    (result, b_result, tmp__trace) <@ __state_init_avx2 ();
    trace___pstate_init_avx2 <-
    (trace___pstate_init_avx2 ++ tmp__trace);
    trace___pstate_init_avx2 <-
    (trace___pstate_init_avx2 ++
    [(Assert, (is_init b_result 0 224))]);
    st <- result;
    b_st <- (BArray224.init_arr (W8.of_int 255) 224);
    return (pst, b_pst, st, b_st, trace___pstate_init_avx2);
  }
  proc __perm_reg3456_avx2 (r3:W256.t, r4:W256.t, r5:W256.t,
                                     r6:W256.t) : W256.t * W256.t * W256.t *
                                                  W256.t * trace = {
    var st3:W256.t;
    var st4:W256.t;
    var st5:W256.t;
    var st6:W256.t;
    var t256_0:W256.t;
    var t256_1:W256.t;
    var t256_2:W256.t;
    var trace___perm_reg3456_avx2:trace;
    trace___perm_reg3456_avx2 <- [];
    t256_0 <- (VPBLEND_8u32 r3 r5 (W8.of_int 195));
    t256_1 <- (VPBLEND_8u32 r6 r4 (W8.of_int 195));
    t256_2 <- (VPBLEND_8u32 r4 r3 (W8.of_int 195));
    st3 <- (VPBLEND_8u32 t256_0 t256_1 (W8.of_int 240));
    st4 <- (VPBLEND_8u32 t256_1 t256_0 (W8.of_int 240));
    t256_0 <- (VPBLEND_8u32 r5 r6 (W8.of_int 195));
    st5 <- (VPBLEND_8u32 t256_0 t256_2 (W8.of_int 240));
    st6 <- (VPBLEND_8u32 t256_2 t256_0 (W8.of_int 240));
    return (st3, st4, st5, st6, trace___perm_reg3456_avx2);
  }
  proc __unperm_reg3456_avx2 (st3:W256.t, st4:W256.t, st5:W256.t,
                                       st6:W256.t) : W256.t * W256.t *
                                                     W256.t * W256.t * trace = {
    var r3:W256.t;
    var r4:W256.t;
    var r5:W256.t;
    var r6:W256.t;
    var t256_0:W256.t;
    var t256_1:W256.t;
    var t256_2:W256.t;
    var t256_3:W256.t;
    var trace___unperm_reg3456_avx2:trace;
    trace___unperm_reg3456_avx2 <- [];
    t256_0 <- (VPBLEND_8u32 st3 st4 (W8.of_int 240));
    t256_1 <- (VPBLEND_8u32 st4 st3 (W8.of_int 240));
    t256_2 <- (VPBLEND_8u32 st5 st6 (W8.of_int 240));
    t256_3 <- (VPBLEND_8u32 st6 st5 (W8.of_int 240));
    r3 <- (VPBLEND_8u32 t256_0 t256_3 (W8.of_int 195));
    r4 <- (VPBLEND_8u32 t256_3 t256_1 (W8.of_int 195));
    r5 <- (VPBLEND_8u32 t256_2 t256_0 (W8.of_int 195));
    r6 <- (VPBLEND_8u32 t256_1 t256_2 (W8.of_int 195));
    return (r3, r4, r5, r6, trace___unperm_reg3456_avx2);
  }
  proc __state_from_pstate_avx2 (pst:BArray200.t, b_pst:BArray200.t) : 
  BArray224.t * BArray224.t * trace = {
    var st:BArray224.t;
    var t128_0:W128.t;
    var t128_1:W128.t;
    var t:W64.t;
    var param:W256.t;
    var param_0:W256.t;
    var param_1:W256.t;
    var param_2:W256.t;
    var result:W256.t;
    var result_0:W256.t;
    var result_1:W256.t;
    var result_2:W256.t;
    var b_st:BArray224.t;
    var trace___state_from_pstate_avx2:trace;
    b_st <- witness;
    st <- witness;
    trace___state_from_pstate_avx2 <- [];
    trace___state_from_pstate_avx2 <-
    (trace___state_from_pstate_avx2 ++
    [(Assert, (is_init b_pst 0 200))]);
    b_st <- (BArray224.init_arr (W8.of_int 0) 224);
    b_st <-
    (BArray224.set256d b_st 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <-
    (BArray224.set256 st 0 (VPBROADCAST_4u64 (BArray200.get64d pst 0)));
    b_st <-
    (BArray224.set256d b_st 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray224.set256 st 1 (BArray200.get256d pst 8));
    t128_0 <- (VMOV_64 (BArray200.get64d pst 40));
    b_st <-
    (BArray224.set256d b_st 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray224.set256 st 3 (BArray200.get256d pst 48));
    t128_1 <- (VMOV_64 (BArray200.get64d pst 80));
    b_st <-
    (BArray224.set256d b_st 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray224.set256 st 4 (BArray200.get256d pst 88));
    t <- (BArray200.get64d pst 120);
    t128_0 <- (VPINSR_2u64 t128_0 t (W8.of_int 1));
    b_st <-
    (BArray224.set256d b_st 160
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray224.set256 st 5 (BArray200.get256d pst 128));
    t <- (BArray200.get64d pst 160);
    t128_1 <- (VPINSR_2u64 t128_1 t (W8.of_int 1));
    b_st <-
    (BArray224.set256d b_st 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <-
    (BArray224.set256 st 2
    (W256.of_int
    (((W128.to_uint t128_1) %% (2 ^ 128)) +
    ((2 ^ 128) * (W128.to_uint t128_0)))));
    b_st <-
    (BArray224.set256d b_st 192
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray224.set256 st 6 (BArray200.get256d pst 168));
    trace___state_from_pstate_avx2 <-
    (trace___state_from_pstate_avx2 ++
    [(Assert, (is_init b_st 96 32))]);
    trace___state_from_pstate_avx2 <-
    (trace___state_from_pstate_avx2 ++
    [(Assert, (is_init b_st 128 32))]);
    trace___state_from_pstate_avx2 <-
    (trace___state_from_pstate_avx2 ++
    [(Assert, (is_init b_st 160 32))]);
    trace___state_from_pstate_avx2 <-
    (trace___state_from_pstate_avx2 ++
    [(Assert, (is_init b_st 192 32))]);
    param_2 <- (BArray224.get256 st 3);
    param_1 <- (BArray224.get256 st 4);
    param_0 <- (BArray224.get256 st 5);
    param <- (BArray224.get256 st 6);
    (result_2, result_1, result_0, result, tmp__trace) <@ __perm_reg3456_avx2 (
    param_2, param_1, param_0, param);
    trace___state_from_pstate_avx2 <-
    (trace___state_from_pstate_avx2 ++ tmp__trace);
    b_st <-
    (BArray224.set256d b_st 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray224.set256 st 3 result_2);
    b_st <-
    (BArray224.set256d b_st 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray224.set256 st 4 result_1);
    b_st <-
    (BArray224.set256d b_st 160
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray224.set256 st 5 result_0);
    b_st <-
    (BArray224.set256d b_st 192
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    st <- (BArray224.set256 st 6 result);
    return (st, b_st, trace___state_from_pstate_avx2);
  }
  proc __addstate_r3456_avx2 (st:BArray224.t, b_st:BArray224.t,
                                       r3:W256.t, r4:W256.t, r5:W256.t,
                                       r6:W256.t) : BArray224.t *
                                                    BArray224.t * trace = {
    var param:W256.t;
    var param_0:W256.t;
    var param_1:W256.t;
    var param_2:W256.t;
    var result:W256.t;
    var result_0:W256.t;
    var result_1:W256.t;
    var result_2:W256.t;
    var trace___addstate_r3456_avx2:trace;
    trace___addstate_r3456_avx2 <- [];
    trace___addstate_r3456_avx2 <-
    (trace___addstate_r3456_avx2 ++
    [(Assert, (is_init b_st 0 224))]);
    param_2 <- r3;
    param_1 <- r4;
    param_0 <- r5;
    param <- r6;
    (result_2, result_1, result_0, result, tmp__trace) <@ __perm_reg3456_avx2 (
    param_2, param_1, param_0, param);
    trace___addstate_r3456_avx2 <-
    (trace___addstate_r3456_avx2 ++ tmp__trace);
    r3 <- result_2;
    r4 <- result_1;
    r5 <- result_0;
    r6 <- result;
    st <- (BArray224.set256 st 3 ((BArray224.get256 st 3) `^` r3));
    st <- (BArray224.set256 st 4 ((BArray224.get256 st 4) `^` r4));
    st <- (BArray224.set256 st 5 ((BArray224.get256 st 5) `^` r5));
    st <- (BArray224.set256 st 6 ((BArray224.get256 st 6) `^` r6));
    b_st <- (BArray224.init_arr (W8.of_int 255) 224);
    return (st, b_st, trace___addstate_r3456_avx2);
  }
  proc __addpst01_avx2 (st:BArray224.t, b_st:BArray224.t,
                                 pst:BArray200.t, b_pst:BArray200.t) : 
  BArray224.t * BArray224.t * trace = {
    var t256:W256.t;
    var trace___addpst01_avx2:trace;
    trace___addpst01_avx2 <- [];
    trace___addpst01_avx2 <-
    (trace___addpst01_avx2 ++ [(Assert, (is_init b_st 0 224))]);
    trace___addpst01_avx2 <-
    (trace___addpst01_avx2 ++ [(Assert, (is_init b_pst 0 200))]);
    t256 <- (VPBROADCAST_4u64 (BArray200.get64d pst 0));
    st <- (BArray224.set256 st 0 ((BArray224.get256 st 0) `^` t256));
    t256 <- (BArray200.get256d pst 8);
    st <- (BArray224.set256 st 1 ((BArray224.get256 st 1) `^` t256));
    b_st <- (BArray224.init_arr (W8.of_int 255) 224);
    return (st, b_st, trace___addpst01_avx2);
  }
  proc __addpst23456_avx2 (st:BArray224.t, b_st:BArray224.t,
                                    pst:BArray200.t, b_pst:BArray200.t) : 
  BArray224.t * BArray224.t * trace = {
    var t128_0:W128.t;
    var r3:W256.t;
    var t128_1:W128.t;
    var r4:W256.t;
    var t:W64.t;
    var r5:W256.t;
    var r2:W256.t;
    var r6:W256.t;
    var param:W256.t;
    var param_0:W256.t;
    var param_1:W256.t;
    var param_2:W256.t;
    var param_3:BArray224.t;
    var result:BArray224.t;
    var b_result:BArray224.t;
    var trace___addpst23456_avx2:trace;
    b_result <- witness;
    param_3 <- witness;
    result <- witness;
    trace___addpst23456_avx2 <- [];
    trace___addpst23456_avx2 <-
    (trace___addpst23456_avx2 ++ [(Assert, (is_init b_st 0 224))]);
    trace___addpst23456_avx2 <-
    (trace___addpst23456_avx2 ++ [(Assert, (is_init b_pst 0 200))]);
    t128_0 <- (VMOV_64 (BArray200.get64d pst 40));
    r3 <- (BArray200.get256d pst 48);
    t128_1 <- (VMOV_64 (BArray200.get64d pst 80));
    r4 <- (BArray200.get256d pst 88);
    t <- (BArray200.get64d pst 120);
    t128_0 <- (VPINSR_2u64 t128_0 t (W8.of_int 1));
    r5 <- (BArray200.get256d pst 128);
    t <- (BArray200.get64d pst 160);
    t128_1 <- (VPINSR_2u64 t128_1 t (W8.of_int 1));
    r2 <-
    (W256.of_int
    (((W128.to_uint t128_1) %% (2 ^ 128)) +
    ((2 ^ 128) * (W128.to_uint t128_0))));
    st <- (BArray224.set256 st 2 ((BArray224.get256 st 2) `^` r2));
    r6 <- (BArray200.get256d pst 168);
    param_3 <- st;
    param_2 <- r3;
    param_1 <- r4;
    param_0 <- r5;
    param <- r6;
    (result, b_result, tmp__trace) <@ __addstate_r3456_avx2 (
    param_3, (BArray224.init_arr (W8.of_int 255) 224), param_2, param_1,
    param_0, param);
    trace___addpst23456_avx2 <-
    (trace___addpst23456_avx2 ++ tmp__trace);
    trace___addpst23456_avx2 <-
    (trace___addpst23456_avx2 ++
    [(Assert, (is_init b_result 0 224))]);
    st <- result;
    b_st <- (BArray224.init_arr (W8.of_int 255) 224);
    return (st, b_st, trace___addpst23456_avx2);
  }
  proc _addpstate_avx2 (st:BArray224.t, b_st:BArray224.t,
                                 pst:BArray200.t, b_pst:BArray200.t) : 
  BArray224.t * BArray224.t * trace = {
    var param:BArray200.t;
    var param_0:BArray224.t;
    var result:BArray224.t;
    var param_1:BArray200.t;
    var param_2:BArray224.t;
    var result_0:BArray224.t;
    var b_result:BArray224.t;
    var b_result_0:BArray224.t;
    var trace__addpstate_avx2:trace;
    b_result <- witness;
    b_result_0 <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    result <- witness;
    result_0 <- witness;
    trace__addpstate_avx2 <- [];
    trace__addpstate_avx2 <-
    (trace__addpstate_avx2 ++ [(Assert, (is_init b_st 0 224))]);
    trace__addpstate_avx2 <-
    (trace__addpstate_avx2 ++ [(Assert, (is_init b_pst 0 200))]);
    param_2 <- st;
    param_1 <- pst;
    (result_0, b_result_0, tmp__trace) <@ __addpst01_avx2 (param_2,
    (BArray224.init_arr (W8.of_int 255) 224), param_1,
    (BArray200.init_arr (W8.of_int 255) 200));
    trace__addpstate_avx2 <-
    (trace__addpstate_avx2 ++ tmp__trace);
    trace__addpstate_avx2 <-
    (trace__addpstate_avx2 ++
    [(Assert, (is_init b_result_0 0 224))]);
    st <- result_0;
    param_0 <- st;
    param <- pst;
    (result, b_result, tmp__trace) <@ __addpst23456_avx2 (param_0,
    (BArray224.init_arr (W8.of_int 255) 224), param,
    (BArray200.init_arr (W8.of_int 255) 200));
    trace__addpstate_avx2 <-
    (trace__addpstate_avx2 ++ tmp__trace);
    trace__addpstate_avx2 <-
    (trace__addpstate_avx2 ++ [(Assert, (is_init b_result 0 224))]);
    st <- result;
    b_st <- (BArray224.init_arr (W8.of_int 255) 224);
    return (st, b_st, trace__addpstate_avx2);
  }
  proc __stavx2_pos_avx2 (pOS:int) : int * int * trace = {
    var r:int;
    var l:int;
    var trace___stavx2_pos_avx2:trace;
    trace___stavx2_pos_avx2 <- [];
    r <- 0;
    l <- 0;
    if ((0 < pOS)) {
      if ((pOS <= 4)) {
        r <- 1;
        l <- (pOS - 1);
      } else {
        if ((pOS = 10)) {
          r <- 2;
          l <- 0;
        } else {
          if ((pOS = 20)) {
            r <- 2;
            l <- 1;
          } else {
            if ((pOS = 5)) {
              r <- 2;
              l <- 2;
            } else {
              if ((pOS = 15)) {
                r <- 2;
                l <- 3;
              } else {
                if ((pOS = 16)) {
                  r <- 3;
                  l <- 0;
                } else {
                  if ((pOS = 7)) {
                    r <- 3;
                    l <- 1;
                  } else {
                    if ((pOS = 23)) {
                      r <- 3;
                      l <- 2;
                    } else {
                      if ((pOS = 14)) {
                        r <- 3;
                        l <- 3;
                      } else {
                        if ((pOS = 11)) {
                          r <- 4;
                          l <- 0;
                        } else {
                          if ((pOS = 22)) {
                            r <- 4;
                            l <- 1;
                          } else {
                            if ((pOS = 8)) {
                              r <- 4;
                              l <- 2;
                            } else {
                              if ((pOS = 19)) {
                                r <- 4;
                                l <- 3;
                              } else {
                                if ((pOS = 21)) {
                                  r <- 5;
                                  l <- 0;
                                } else {
                                  if ((pOS = 17)) {
                                    r <- 5;
                                    l <- 1;
                                  } else {
                                    if ((pOS = 13)) {
                                      r <- 5;
                                      l <- 2;
                                    } else {
                                      if ((pOS = 9)) {
                                        r <- 5;
                                        l <- 3;
                                      } else {
                                        if ((pOS = 6)) {
                                          r <- 6;
                                          l <- 0;
                                        } else {
                                          if ((pOS = 12)) {
                                            r <- 6;
                                            l <- 1;
                                          } else {
                                            if ((pOS = 18)) {
                                              r <- 6;
                                              l <- 2;
                                            } else {
                                              if ((pOS = 24)) {
                                                r <- 6;
                                                l <- 3;
                                              } else {
                                                
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    } else {
      
    }
    return (r, l, trace___stavx2_pos_avx2);
  }
  proc __addratebit_avx2 (st:BArray224.t, b_st:BArray224.t,
                                   rATE8:int) : BArray224.t * BArray224.t *
                                                trace = {
    var t64:W64.t;
    var r:int;
    var l:int;
    var t256:W256.t;
    var param:int;
    var param_0:W64.t;
    var result:W256.t;
    var param_1:int;
    var result_0:int;
    var result_1:int;
    var trace___addratebit_avx2:trace;
    trace___addratebit_avx2 <- [];
    trace___addratebit_avx2 <-
    (trace___addratebit_avx2 ++ [(Assert, (is_init b_st 0 224))]);
    t64 <- (W64.of_int 1);
    t64 <- (t64 `<<` (W8.of_int (((8 * rATE8) - 1) %% 64)));
    param_1 <- ((rATE8 - 1) %/ 8);
    (result_1, result_0, tmp__trace) <@ __stavx2_pos_avx2 (param_1);
    trace___addratebit_avx2 <-
    (trace___addratebit_avx2 ++ tmp__trace);
    trace___addratebit_avx2 <-
    (trace___addratebit_avx2 ++
    [(Assert, ((0 <= result_1) /\ (result_1 < 7)))]);
    r <- result_1;
    l <- result_0;
    if ((r = 0)) {
      t256 <- (VPBROADCAST_4u64 t64);
    } else {
      param_0 <- t64;
      param <- l;
      (result, tmp__trace) <@ __u64_to_u256 (param_0, param);
      trace___addratebit_avx2 <-
      (trace___addratebit_avx2 ++ tmp__trace);
      t256 <- result;
    }
    trace___addratebit_avx2 <-
    (trace___addratebit_avx2 ++
    [(Assert, ((0 <= (r * 32)) /\ (((r * 32) + 32) <= 224)))]);
    trace___addratebit_avx2 <-
    (trace___addratebit_avx2 ++
    [(Assert, ((0 <= (r * 32)) /\ (((r * 32) + 32) <= 224)))]);
    st <- (BArray224.set256 st r ((BArray224.get256 st r) `^` t256));
    b_st <- (BArray224.init_arr (W8.of_int 255) 224);
    return (st, b_st, trace___addratebit_avx2);
  }
 
  proc keccakf1600_4x_theta_sum (a:BArray800.t, b_a:BArray800.t) : 
  BArray160.t * BArray160.t * trace = {
    var c:BArray160.t;
    var x:int;
    var y:int;
    var b_c:BArray160.t;
    var trace_keccakf1600_4x_theta_sum:trace;
    b_c <- witness;
    c <- witness;
    trace_keccakf1600_4x_theta_sum <- [];
    trace_keccakf1600_4x_theta_sum <-
    (trace_keccakf1600_4x_theta_sum ++
    [(Assert, (is_init b_a 0 800))]);
    b_c <- (BArray160.init_arr (W8.of_int 0) 160);
    x <- 0;
    while ((x < 5)) {
      trace_keccakf1600_4x_theta_sum <-
      (trace_keccakf1600_4x_theta_sum ++
      [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
      trace_keccakf1600_4x_theta_sum <-
      (trace_keccakf1600_4x_theta_sum ++
      [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 800)))]);
      b_c <-
      (BArray160.set256d b_c (x * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      c <- (BArray160.set256 c x (BArray800.get256 a x));
      x <- (x + 1);
    }
    y <- 1;
    while ((y < 5)) {
      x <- 0;
      while ((x < 5)) {
        trace_keccakf1600_4x_theta_sum <-
        (trace_keccakf1600_4x_theta_sum ++
        [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
        trace_keccakf1600_4x_theta_sum <-
        (trace_keccakf1600_4x_theta_sum ++
        [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
        trace_keccakf1600_4x_theta_sum <-
        (trace_keccakf1600_4x_theta_sum ++
        [(Assert, (is_init b_c (x * 32) 32))]);
        trace_keccakf1600_4x_theta_sum <-
        (trace_keccakf1600_4x_theta_sum ++
        [(Assert,
         ((0 <= ((x + (y * 5)) * 32)) /\
         ((((x + (y * 5)) * 32) + 32) <= 800)))]);
        b_c <-
        (BArray160.set256d b_c (x * 32)
        (W256.of_int
        115792089237316195423570985008687907853269984665640564039457584007913129639935
        ));
        c <-
        (BArray160.set256 c x
        ((BArray160.get256 c x) `^` (BArray800.get256 a (x + (y * 5)))));
        x <- (x + 1);
      }
      y <- (y + 1);
    }
    return (c, b_c, trace_keccakf1600_4x_theta_sum);
  }
  proc keccakf1600_4x_rol (a:BArray160.t, b_a:BArray160.t, x:int,
                                    r:int, r8:W256.t, r56:W256.t) : BArray160.t *
                                                                    BArray160.t *
                                                                    trace = {
    var t:W256.t;
    var trace_keccakf1600_4x_rol:trace;
    trace_keccakf1600_4x_rol <- [];
    trace_keccakf1600_4x_rol <-
    (trace_keccakf1600_4x_rol ++
    [(Assert, (((is_init b_a (x * 32) 32) /\ (0 <= x)) /\ (x < 5)))]);
    if ((r = 8)) {
      trace_keccakf1600_4x_rol <-
      (trace_keccakf1600_4x_rol ++
      [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
      trace_keccakf1600_4x_rol <-
      (trace_keccakf1600_4x_rol ++
      [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
      trace_keccakf1600_4x_rol <-
      (trace_keccakf1600_4x_rol ++
      [(Assert, (is_init b_a (x * 32) 32))]);
      b_a <-
      (BArray160.set256d b_a (x * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      a <- (BArray160.set256 a x (VPSHUFB_256 (BArray160.get256 a x) r8));
    } else {
      if ((r = 56)) {
        trace_keccakf1600_4x_rol <-
        (trace_keccakf1600_4x_rol ++
        [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
        trace_keccakf1600_4x_rol <-
        (trace_keccakf1600_4x_rol ++
        [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
        trace_keccakf1600_4x_rol <-
        (trace_keccakf1600_4x_rol ++
        [(Assert, (is_init b_a (x * 32) 32))]);
        b_a <-
        (BArray160.set256d b_a (x * 32)
        (W256.of_int
        115792089237316195423570985008687907853269984665640564039457584007913129639935
        ));
        a <- (BArray160.set256 a x (VPSHUFB_256 (BArray160.get256 a x) r56));
      } else {
        trace_keccakf1600_4x_rol <-
        (trace_keccakf1600_4x_rol ++
        [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
        trace_keccakf1600_4x_rol <-
        (trace_keccakf1600_4x_rol ++
        [(Assert, (is_init b_a (x * 32) 32))]);
        t <- (VPSLL_4u64 (BArray160.get256 a x) (W128.of_int r));
        trace_keccakf1600_4x_rol <-
        (trace_keccakf1600_4x_rol ++
        [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
        trace_keccakf1600_4x_rol <-
        (trace_keccakf1600_4x_rol ++
        [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
        trace_keccakf1600_4x_rol <-
        (trace_keccakf1600_4x_rol ++
        [(Assert, (is_init b_a (x * 32) 32))]);
        b_a <-
        (BArray160.set256d b_a (x * 32)
        (W256.of_int
        115792089237316195423570985008687907853269984665640564039457584007913129639935
        ));
        a <-
        (BArray160.set256 a x
        (VPSRL_4u64 (BArray160.get256 a x) (W128.of_int (64 - r))));
        trace_keccakf1600_4x_rol <-
        (trace_keccakf1600_4x_rol ++
        [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
        trace_keccakf1600_4x_rol <-
        (trace_keccakf1600_4x_rol ++
        [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
        trace_keccakf1600_4x_rol <-
        (trace_keccakf1600_4x_rol ++
        [(Assert, (is_init b_a (x * 32) 32))]);
        b_a <-
        (BArray160.set256d b_a (x * 32)
        (W256.of_int
        115792089237316195423570985008687907853269984665640564039457584007913129639935
        ));
        a <- (BArray160.set256 a x ((BArray160.get256 a x) `|` t));
      }
    }
    return (a, b_a, trace_keccakf1600_4x_rol);
  }
  proc keccakf1600_4x_theta_rol (c:BArray160.t, b_c:BArray160.t,
                                          r8:W256.t, r56:W256.t) : BArray160.t *
                                                                   BArray160.t *
                                                                   trace = {
    var d:BArray160.t;
    var x:int;
    var param:W256.t;
    var param_0:W256.t;
    var param_1:int;
    var param_2:int;
    var param_3:BArray160.t;
    var result:BArray160.t;
    var b_d:BArray160.t;
    var b_result:BArray160.t;
    var b_param:BArray160.t;
    var trace_keccakf1600_4x_theta_rol:trace;
    b_d <- witness;
    b_param <- witness;
    b_result <- witness;
    d <- witness;
    param_3 <- witness;
    result <- witness;
    trace_keccakf1600_4x_theta_rol <- [];
    trace_keccakf1600_4x_theta_rol <-
    (trace_keccakf1600_4x_theta_rol ++
    [(Assert, (is_init b_c 0 160))]);
    b_d <- (BArray160.init_arr (W8.of_int 0) 160);
    x <- 0;
    while ((x < 5)) {
      trace_keccakf1600_4x_theta_rol <-
      (trace_keccakf1600_4x_theta_rol ++
      [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
      trace_keccakf1600_4x_theta_rol <-
      (trace_keccakf1600_4x_theta_rol ++
      [(Assert,
       ((0 <= (((x + 1) %% 5) * 32)) /\
       (((((x + 1) %% 5) * 32) + 32) <= 160)))]);
      b_d <-
      (BArray160.set256d b_d (x * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      d <- (BArray160.set256 d x (BArray160.get256 c ((x + 1) %% 5)));
      b_param <- b_d;
      param_3 <- d;
      param_2 <- x;
      param_1 <- 1;
      param_0 <- r8;
      param <- r56;
      (result, b_result, tmp__trace) <@ keccakf1600_4x_rol (
      param_3, b_param, param_2, param_1, param_0, param);
      trace_keccakf1600_4x_theta_rol <-
      (trace_keccakf1600_4x_theta_rol ++ tmp__trace);
      b_d <- b_result;
      d <- result;
      trace_keccakf1600_4x_theta_rol <-
      (trace_keccakf1600_4x_theta_rol ++
      [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
      trace_keccakf1600_4x_theta_rol <-
      (trace_keccakf1600_4x_theta_rol ++
      [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
      trace_keccakf1600_4x_theta_rol <-
      (trace_keccakf1600_4x_theta_rol ++
      [(Assert, (is_init b_d (x * 32) 32))]);
      trace_keccakf1600_4x_theta_rol <-
      (trace_keccakf1600_4x_theta_rol ++
      [(Assert,
       ((0 <= ((((x - 1) + 5) %% 5) * 32)) /\
       ((((((x - 1) + 5) %% 5) * 32) + 32) <= 160)))]);
      b_d <-
      (BArray160.set256d b_d (x * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      d <-
      (BArray160.set256 d x
      ((BArray160.get256 d x) `^` (BArray160.get256 c (((x - 1) + 5) %% 5))));
      x <- (x + 1);
    }
    return (d, b_d, trace_keccakf1600_4x_theta_rol);
  }
  proc keccakf1600_4x_rol_sum (a:BArray800.t, b_a:BArray800.t,
                                        d:BArray160.t, b_d:BArray160.t,
                                        y:int, r8:W256.t, r56:W256.t) : 
  BArray160.t * BArray160.t * trace = {
    var b:BArray160.t;
    var x:int;
    var x_:int;
    var y_:int;
    var r:int;
    var param:W256.t;
    var param_0:W256.t;
    var param_1:int;
    var param_2:int;
    var param_3:BArray160.t;
    var result:BArray160.t;
    var param_4:int;
    var param_5:int;
    var result_0:int;
    var b_b:BArray160.t;
    var b_result:BArray160.t;
    var b_param:BArray160.t;
    var trace_keccakf1600_4x_rol_sum:trace;
    b <- witness;
    b_b <- witness;
    b_param <- witness;
    b_result <- witness;
    param_3 <- witness;
    result <- witness;
    trace_keccakf1600_4x_rol_sum <- [];
    trace_keccakf1600_4x_rol_sum <-
    (trace_keccakf1600_4x_rol_sum ++
    [(Assert,
     ((((is_init b_a 0 800) /\ (is_init b_d 0 160)) /\ (0 <= y)) /\ (y < 5)))]);
    b_b <- (BArray160.init_arr (W8.of_int 0) 160);
    x <- 0;
    while ((x < 5)) {
      x_ <- ((x + (3 * y)) %% 5);
      y_ <- x;
      param_5 <- x_;
      param_4 <- y_;
      (result_0, tmp__trace) <@ keccakf1600_rhotates (param_5,
      param_4);
      trace_keccakf1600_4x_rol_sum <-
      (trace_keccakf1600_4x_rol_sum ++ tmp__trace);
      r <- result_0;
      trace_keccakf1600_4x_rol_sum <-
      (trace_keccakf1600_4x_rol_sum ++
      [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
      trace_keccakf1600_4x_rol_sum <-
      (trace_keccakf1600_4x_rol_sum ++
      [(Assert,
       ((0 <= ((x_ + (y_ * 5)) * 32)) /\
       ((((x_ + (y_ * 5)) * 32) + 32) <= 800)))]);
      b_b <-
      (BArray160.set256d b_b (x * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      b <- (BArray160.set256 b x (BArray800.get256 a (x_ + (y_ * 5))));
      trace_keccakf1600_4x_rol_sum <-
      (trace_keccakf1600_4x_rol_sum ++
      [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
      trace_keccakf1600_4x_rol_sum <-
      (trace_keccakf1600_4x_rol_sum ++
      [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
      trace_keccakf1600_4x_rol_sum <-
      (trace_keccakf1600_4x_rol_sum ++
      [(Assert, (is_init b_b (x * 32) 32))]);
      trace_keccakf1600_4x_rol_sum <-
      (trace_keccakf1600_4x_rol_sum ++
      [(Assert, ((0 <= (x_ * 32)) /\ (((x_ * 32) + 32) <= 160)))]);
      b_b <-
      (BArray160.set256d b_b (x * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      b <-
      (BArray160.set256 b x
      ((BArray160.get256 b x) `^` (BArray160.get256 d x_)));
      if ((r <> 0)) {
        b_param <- b_b;
        param_3 <- b;
        param_2 <- x;
        param_1 <- r;
        param_0 <- r8;
        param <- r56;
        (result, b_result, tmp__trace) <@ keccakf1600_4x_rol (
        param_3, b_param, param_2, param_1, param_0, param);
        trace_keccakf1600_4x_rol_sum <-
        (trace_keccakf1600_4x_rol_sum ++ tmp__trace);
        b_b <- b_result;
        b <- result;
      } else {
        
      }
      x <- (x + 1);
    }
    return (b, b_b, trace_keccakf1600_4x_rol_sum);
  }
  proc keccakf1600_4x_set_row (e:BArray800.t, b_e:BArray800.t,
                                        b:BArray160.t, b_b:BArray160.t,
                                        y:int, rc:W256.t) : BArray800.t *
                                                            BArray800.t *
                                                            trace = {
    var x:int;
    var x1:int;
    var x2:int;
    var t:W256.t;
    var trace_keccakf1600_4x_set_row:trace;
    trace_keccakf1600_4x_set_row <- [];
    trace_keccakf1600_4x_set_row <-
    (trace_keccakf1600_4x_set_row ++
    [(Assert, (((is_init b_b 0 160) /\ (0 <= y)) /\ (y < 5)))]);
    x <- 0;
    while ((x < 5)) {
      x1 <- ((x + 1) %% 5);
      x2 <- ((x + 2) %% 5);
      trace_keccakf1600_4x_set_row <-
      (trace_keccakf1600_4x_set_row ++
      [(Assert, ((0 <= (x1 * 32)) /\ (((x1 * 32) + 32) <= 160)))]);
      trace_keccakf1600_4x_set_row <-
      (trace_keccakf1600_4x_set_row ++
      [(Assert, ((0 <= (x2 * 32)) /\ (((x2 * 32) + 32) <= 160)))]);
      t <- (VPANDN_256 (BArray160.get256 b x1) (BArray160.get256 b x2));
      trace_keccakf1600_4x_set_row <-
      (trace_keccakf1600_4x_set_row ++
      [(Assert, ((0 <= (x * 32)) /\ (((x * 32) + 32) <= 160)))]);
      t <- (t `^` (BArray160.get256 b x));
      if (((x = 0) /\ (y = 0))) {
        t <- (t `^` rc);
      } else {
        
      }
      trace_keccakf1600_4x_set_row <-
      (trace_keccakf1600_4x_set_row ++
      [(Assert,
       ((0 <= ((x + (y * 5)) * 32)) /\ ((((x + (y * 5)) * 32) + 32) <= 800)))]);
      b_e <-
      (BArray800.set256d b_e ((x + (y * 5)) * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      e <- (BArray800.set256 e (x + (y * 5)) t);
      x <- (x + 1);
    }
    return (e, b_e, trace_keccakf1600_4x_set_row);
  }
  proc _keccakf1600_4x_round (e:BArray800.t, b_e:BArray800.t,
                                       a:BArray800.t, b_a:BArray800.t,
                                       rc:W256.t, r8:W256.t, r56:W256.t) : 
  BArray800.t * BArray800.t * trace = {
    var c:BArray160.t;
    var d:BArray160.t;
    var y:int;
    var b:BArray160.t;
    var param:W256.t;
    var param_0:int;
    var param_1:BArray160.t;
    var param_2:BArray800.t;
    var result:BArray800.t;
    var param_3:W256.t;
    var param_4:W256.t;
    var param_5:int;
    var param_6:BArray160.t;
    var param_7:BArray800.t;
    var result_0:BArray160.t;
    var param_8:W256.t;
    var param_9:W256.t;
    var param_10:BArray160.t;
    var result_1:BArray160.t;
    var param_11:BArray800.t;
    var result_2:BArray160.t;
    var b_result:BArray800.t;
    var b_param:BArray800.t;
    var b_result_0:BArray160.t;
    var b_result_1:BArray160.t;
    var b_result_2:BArray160.t;
    var trace__keccakf1600_4x_round:trace;
    b <- witness;
    b_param <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    c <- witness;
    d <- witness;
    param_1 <- witness;
    param_2 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    param_10 <- witness;
    param_11 <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    trace__keccakf1600_4x_round <- [];
    trace__keccakf1600_4x_round <-
    (trace__keccakf1600_4x_round ++ [(Assert, (is_init b_a 0 800))]);
    param_11 <- a;
    (result_2, b_result_2, tmp__trace) <@ keccakf1600_4x_theta_sum (
    param_11, (BArray800.init_arr (W8.of_int 255) 800));
    trace__keccakf1600_4x_round <-
    (trace__keccakf1600_4x_round ++ tmp__trace);
    trace__keccakf1600_4x_round <-
    (trace__keccakf1600_4x_round ++
    [(Assert, (is_init b_result_2 0 160))]);
    c <- result_2;
    param_10 <- c;
    param_9 <- r8;
    param_8 <- r56;
    (result_1, b_result_1, tmp__trace) <@ keccakf1600_4x_theta_rol (
    param_10, (BArray160.init_arr (W8.of_int 255) 160), param_9, param_8);
    trace__keccakf1600_4x_round <-
    (trace__keccakf1600_4x_round ++ tmp__trace);
    trace__keccakf1600_4x_round <-
    (trace__keccakf1600_4x_round ++
    [(Assert, (is_init b_result_1 0 160))]);
    d <- result_1;
    y <- 0;
    while ((y < 5)) {
      param_7 <- a;
      param_6 <- d;
      param_5 <- y;
      param_4 <- r8;
      param_3 <- r56;
      (result_0, b_result_0, tmp__trace) <@ keccakf1600_4x_rol_sum (
      param_7, (BArray800.init_arr (W8.of_int 255) 800), param_6,
      (BArray160.init_arr (W8.of_int 255) 160), param_5, param_4, param_3);
      trace__keccakf1600_4x_round <-
      (trace__keccakf1600_4x_round ++ tmp__trace);
      trace__keccakf1600_4x_round <-
      (trace__keccakf1600_4x_round ++
      [(Assert, (is_init b_result_0 0 160))]);
      b <- result_0;
      b_param <- b_e;
      param_2 <- e;
      param_1 <- b;
      param_0 <- y;
      param <- rc;
      (result, b_result, tmp__trace) <@ keccakf1600_4x_set_row (
      param_2, b_param, param_1, (BArray160.init_arr (W8.of_int 255) 160),
      param_0, param);
      trace__keccakf1600_4x_round <-
      (trace__keccakf1600_4x_round ++ tmp__trace);
      b_e <- b_result;
      e <- result;
      y <- (y + 1);
    }
    return (e, b_e, trace__keccakf1600_4x_round);
  }
   proc __keccakf1600_avx2x4 (a:BArray800.t, b_a:BArray800.t) : BArray800.t *
                                                               BArray800.t *
                                                               trace = {
    var rC:BArray192.t;
    var s_e:BArray800.t;
    var e:BArray800.t;
    var r8:W256.t;
    var r56:W256.t;
    var rc:W256.t;
    var c:int;
    var param:W256.t;
    var param_0:W256.t;
    var param_1:W256.t;
    var param_2:BArray800.t;
    var param_3:BArray800.t;
    var result:BArray800.t;
    var param_4:W256.t;
    var param_5:W256.t;
    var param_6:W256.t;
    var param_7:BArray800.t;
    var param_8:BArray800.t;
    var result_0:BArray800.t;
    var b_e:BArray800.t;
    var b_result:BArray800.t;
    var b_param:BArray800.t;
    var b_param_0:BArray800.t;
    var b_result_0:BArray800.t;
    var b_param_1:BArray800.t;
    var b_s_e:BArray800.t;
    var trace___keccakf1600_avx2x4:trace;
    rC <- witness;
    b_e <- witness;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_s_e <- witness;
    e <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_7 <- witness;
    param_8 <- witness;
    result <- witness;
    result_0 <- witness;
    s_e <- witness;
    trace___keccakf1600_avx2x4 <- [];
    trace___keccakf1600_avx2x4 <-
    (trace___keccakf1600_avx2x4 ++ [(Assert, (is_init b_a 0 800))]);
    b_s_e <- (BArray800.init_arr (W8.of_int 0) 800);
    rC <- KECCAK1600_RC;
    b_e <- b_s_e;
    e <- s_e;
    r8 <- ROL8;
    r56 <- ROL56;
    c <- 0;
    while ((c < 24)) {
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++
      [(Assert, ((0 <= (c * 8)) /\ (((c * 8) + 8) <= 192)))]);
      rc <- (VPBROADCAST_4u64 (BArray192.get64 rC c));
      b_param_1 <- b_e;
      param_8 <- e;
      param_7 <- a;
      param_6 <- rc;
      param_5 <- r8;
      param_4 <- r56;
      (result_0, b_result_0, tmp__trace) <@ _keccakf1600_4x_round (param_8,
      b_param_1, param_7, (BArray800.init_arr (W8.of_int 255) 800), param_6,
      param_5, param_4);
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++ tmp__trace);
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++ [(Assert, (is_init b_result_0 0 800))]);
      e <- result_0;
      (b_a, b_e) <-
      (swap_ (BArray800.init_arr (W8.of_int 255) 800)
      (BArray800.init_arr (W8.of_int 255) 800));
      (a, e) <- (swap_ e a);
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++
      [(Assert, ((0 <= ((c + 1) * 8)) /\ ((((c + 1) * 8) + 8) <= 192)))]);
      rc <- (VPBROADCAST_4u64 (BArray192.get64 rC (c + 1)));
      b_param_0 <- b_a;
      param_3 <- a;
      b_param <- b_e;
      param_2 <- e;
      param_1 <- rc;
      param_0 <- r8;
      param <- r56;
      (result, b_result, tmp__trace) <@ _keccakf1600_4x_round (param_3,
      b_param_0, param_2, b_param, param_1, param_0, param);
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++ tmp__trace);
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++ [(Assert, (is_init b_result 0 800))]);
      a <- result;
      (b_a, b_e) <- (swap_ b_e (BArray800.init_arr (W8.of_int 255) 800));
      (a, e) <- (swap_ e a);
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++
      [(Assert, ((0 <= (c + 2)) /\ ((c + 2) <= 18446744073709551615)))]);
      c <- (c + 2);
    }
    b_a <- (BArray800.init_arr (W8.of_int 255) 800);
    return (a, b_a, trace___keccakf1600_avx2x4);
  }


  proc _keccakf1600_avx2x4 (a:BArray800.t, b_a:BArray800.t) : 
  BArray800.t * BArray800.t * trace = {
    var param:BArray800.t;
    var result:BArray800.t;
    var b_result:BArray800.t;
    var trace__keccakf1600_avx2x4:trace;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace__keccakf1600_avx2x4 <- [];
    trace__keccakf1600_avx2x4 <-
    (trace__keccakf1600_avx2x4 ++ [(Assert, (is_init b_a 0 800))]);
    param <- a;
    (result, b_result, tmp__trace) <@ __keccakf1600_avx2x4 (
    param, (BArray800.init_arr (W8.of_int 255) 800));
    trace__keccakf1600_avx2x4 <-
    (trace__keccakf1600_avx2x4 ++ tmp__trace);
    trace__keccakf1600_avx2x4 <-
    (trace__keccakf1600_avx2x4 ++
    [(Assert, (is_init b_result 0 800))]);
    a <- result;
    b_a <- (BArray800.init_arr (W8.of_int 255) 800);
    return (a, b_a, trace__keccakf1600_avx2x4);
  }
  proc _keccakf1600_avx2x4_ (a:BArray800.t, b_a:BArray800.t) : 
  BArray800.t * BArray800.t * trace = {
    var param:BArray800.t;
    var result:BArray800.t;
    var b_result:BArray800.t;
    var trace__keccakf1600_avx2x4_:trace;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace__keccakf1600_avx2x4_ <- [];
    trace__keccakf1600_avx2x4_ <-
    (trace__keccakf1600_avx2x4_ ++ [(Assert, (is_init b_a 0 800))]);
    a <- a;
    param <- a;
    (result, b_result, tmp__trace) <@ _keccakf1600_avx2x4 (param,
    (BArray800.init_arr (W8.of_int 255) 800));
    trace__keccakf1600_avx2x4_ <-
    (trace__keccakf1600_avx2x4_ ++ tmp__trace);
    trace__keccakf1600_avx2x4_ <-
    (trace__keccakf1600_avx2x4_ ++
    [(Assert, (is_init b_result 0 800))]);
    a <- result;
    a <- a;
    b_a <- (BArray800.init_arr (W8.of_int 255) 800);
    return (a, b_a, trace__keccakf1600_avx2x4_);
  }
  proc __state_init_avx2x4 (st:BArray800.t, b_st:BArray800.t) : 
  BArray800.t * BArray800.t * trace = {
    var z256:W256.t;
    var i:int;
    var trace___state_init_avx2x4:trace;
    trace___state_init_avx2x4 <- [];
    z256 <- (set0_256);
    i <- 0;
    while ((i < 800)) {
      trace___state_init_avx2x4 <-
      (trace___state_init_avx2x4 ++
      [(Assert,
       ((((0 <= i) /\ (i <= 800)) /\ ((i %% 32) = 0)) /\ (is_init b_st 0 i)))]);
      trace___state_init_avx2x4 <-
      (trace___state_init_avx2x4 ++
      [(Assert, ((0 <= i) /\ ((i + 32) <= 800)))]);
      b_st <-
      (BArray800.set256d b_st i
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      st <- (BArray800.set256d st i z256);
      trace___state_init_avx2x4 <-
      (trace___state_init_avx2x4 ++
      [(Assert, ((0 <= (i + 32)) /\ ((i + 32) <= 18446744073709551615)))]);
      i <- (i + 32);
    }
    return (st, b_st, trace___state_init_avx2x4);
  }
  proc __addratebit_avx2x4 (st:BArray800.t, b_st:BArray800.t,
                                     rATE8:int) : BArray800.t * BArray800.t *
                                                  trace = {
    var t64:W64.t;
    var t128:W128.t;
    var t256:W256.t;
    var trace___addratebit_avx2x4:trace;
    trace___addratebit_avx2x4 <- [];
    trace___addratebit_avx2x4 <-
    (trace___addratebit_avx2x4 ++
    [(Assert, (((is_init b_st 0 800) /\ (0 < rATE8)) /\ (rATE8 < 200)))]);
    t64 <- (W64.of_int 1);
    t64 <- (t64 `<<` (W8.of_int (((8 * rATE8) - 1) %% 64)));
    t128 <- (zeroextu128 t64);
    t256 <- (VPBROADCAST_4u64 (truncateu64 t128));
    trace___addratebit_avx2x4 <-
    (trace___addratebit_avx2x4 ++
    [(Assert,
     ((0 <= (((rATE8 - 1) %/ 8) * 32)) /\
     (((((rATE8 - 1) %/ 8) * 32) + 32) <= 800)))]);
    t256 <- (t256 `^` (BArray800.get256 st ((rATE8 - 1) %/ 8)));
    trace___addratebit_avx2x4 <-
    (trace___addratebit_avx2x4 ++
    [(Assert,
     ((0 <= (((rATE8 - 1) %/ 8) * 32)) /\
     (((((rATE8 - 1) %/ 8) * 32) + 32) <= 800)))]);
    st <- (BArray800.set256 st ((rATE8 - 1) %/ 8) t256);
    b_st <- (BArray800.init_arr (W8.of_int 255) 800);
    return (st, b_st, trace___addratebit_avx2x4);
  }
  proc __u256x4_4u64x4 (x0:W256.t, x1:W256.t, x2:W256.t, x3:W256.t) : 
  W256.t * W256.t * W256.t * W256.t * trace = {
    var y0:W256.t;
    var y1:W256.t;
    var y2:W256.t;
    var y3:W256.t;
    var trace___u256x4_4u64x4:trace;
    trace___u256x4_4u64x4 <- [];
    y0 <- (VPUNPCKL_4u64 x0 x1);
    y1 <- (VPUNPCKH_4u64 x0 x1);
    y2 <- (VPUNPCKL_4u64 x2 x3);
    y3 <- (VPUNPCKH_4u64 x2 x3);
    x0 <- (VPERM2I128 y0 y2 (W8.of_int 32));
    x1 <- (VPERM2I128 y1 y3 (W8.of_int 32));
    x2 <- (VPERM2I128 y0 y2 (W8.of_int 49));
    x3 <- (VPERM2I128 y1 y3 (W8.of_int 49));
    return (x0, x1, x2, x3, trace___u256x4_4u64x4);
  }
  proc __4u64x4_u256x4 (y0:W256.t, y1:W256.t, y2:W256.t, y3:W256.t) : 
  W256.t * W256.t * W256.t * W256.t * trace = {
    var x0:W256.t;
    var x1:W256.t;
    var x2:W256.t;
    var x3:W256.t;
    var trace___4u64x4_u256x4:trace;
    trace___4u64x4_u256x4 <- [];
    x0 <- (VPERM2I128 y0 y2 (W8.of_int 32));
    x1 <- (VPERM2I128 y1 y3 (W8.of_int 32));
    x2 <- (VPERM2I128 y0 y2 (W8.of_int 49));
    x3 <- (VPERM2I128 y1 y3 (W8.of_int 49));
    y0 <- (VPUNPCKL_4u64 x0 x1);
    y1 <- (VPUNPCKH_4u64 x0 x1);
    y2 <- (VPUNPCKL_4u64 x2 x3);
    y3 <- (VPUNPCKH_4u64 x2 x3);
    return (y0, y1, y2, y3, trace___4u64x4_u256x4);
  }
  
  proc __aread_subu64 (buf:BArrayS.t, b_buf:BArrayS.t,
                                offset:int, dELTA:int, lEN:int, tRAIL:int) : 
  int * int * int * W64.t * trace = {
    var w:W64.t;
    var iLEN:int;
    var t16:W64.t;
    var t8:W64.t;
    var trace___aread_subu64:trace;
    trace___aread_subu64 <- [];
    trace___aread_subu64 <-
    (trace___aread_subu64 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     ((0 < lEN) ? ((((is_init b_buf (offset + dELTA) ((lEN < 8) ? lEN : 8)) /\
                    (0 <= dELTA)) /\
                   (0 <= (offset + dELTA))) /\
                  (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= size)) : true))))))))))]);
    trace___aread_subu64 <-
    (trace___aread_subu64 ++
    [(Assert, ((0 <= tRAIL) /\ (tRAIL < 256)))]);
    trace___aread_subu64 <-
    (trace___aread_subu64 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    iLEN <- lEN;
    if ((lEN <= 0)) {
      w <- (W64.of_int (tRAIL %% 256));
      tRAIL <- 0;
    } else {
      if ((8 <= lEN)) {
        trace___aread_subu64 <-
        (trace___aread_subu64 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___aread_subu64 <-
        (trace___aread_subu64 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___aread_subu64 <-
        (trace___aread_subu64 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
        trace___aread_subu64 <-
        (trace___aread_subu64 ++
        [(Assert, (is_init b_buf (offset + dELTA) 8))]);
        w <- (BArrayS.get64d buf (offset + dELTA));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          trace___aread_subu64 <-
          (trace___aread_subu64 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___aread_subu64 <-
          (trace___aread_subu64 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___aread_subu64 <-
          (trace___aread_subu64 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= size)))]);
          trace___aread_subu64 <-
          (trace___aread_subu64 ++
          [(Assert, (is_init b_buf (offset + dELTA) 4))]);
          w <- (zeroextu64 (BArrayS.get32d buf (offset + dELTA)));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          w <- (W64.of_int 0);
        }
        if ((2 <= lEN)) {
          trace___aread_subu64 <-
          (trace___aread_subu64 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___aread_subu64 <-
          (trace___aread_subu64 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___aread_subu64 <-
          (trace___aread_subu64 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= size)))]);
          trace___aread_subu64 <-
          (trace___aread_subu64 ++
          [(Assert, (is_init b_buf (offset + dELTA) 2))]);
          t16 <- (zeroextu64 (BArrayS.get16d buf (offset + dELTA)));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          t16 <- (W64.of_int 0);
        }
        if (((1 <= lEN) \/ ((tRAIL %% 256) <> 0))) {
          if ((1 <= lEN)) {
            trace___aread_subu64 <-
            (trace___aread_subu64 ++
            [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
            trace___aread_subu64 <-
            (trace___aread_subu64 ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\
             ((offset + dELTA) <= 18446744073709551615)))]);
            trace___aread_subu64 <-
            (trace___aread_subu64 ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= size)))]);
            trace___aread_subu64 <-
            (trace___aread_subu64 ++
            [(Assert, (is_init b_buf (offset + dELTA) 1))]);
            t8 <- (zeroextu64 (BArrayS.get8d buf (offset + dELTA)));
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
    return (dELTA, lEN, tRAIL, w, trace___aread_subu64);
  }
  proc __aread_bcast_4subu64 (buf:BArrayS.t, b_buf:BArrayS.t,
                                       offset:int, dELTA:int, lEN:int,
                                       tRAIL:int) : int * int * int *
                                                    W256.t * trace = {
    var w:W256.t;
    var t64:W64.t;
    var t128:W128.t;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result:W64.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var b_param:BArrayS.t;
    var trace___aread_bcast_4subu64:trace;
    b_param <- witness;
    param_3 <- witness;
    trace___aread_bcast_4subu64 <- [];
    trace___aread_bcast_4subu64 <-
    (trace___aread_bcast_4subu64 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     ((0 < lEN) ? ((((is_init b_buf (offset + dELTA) ((lEN < 8) ? lEN : 8)) /\
                    (0 <= dELTA)) /\
                   (0 <= (offset + dELTA))) /\
                  (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= size)) : true))))))))))]);
    trace___aread_bcast_4subu64 <-
    (trace___aread_bcast_4subu64 ++
    [(Assert, ((0 <= tRAIL) /\ (tRAIL < 256)))]);
    trace___aread_bcast_4subu64 <-
    (trace___aread_bcast_4subu64 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if (((lEN <= 0) /\ ((tRAIL %% 256) = 0))) {
      w <- (set0_256);
    } else {
      if ((8 <= lEN)) {
        trace___aread_bcast_4subu64 <-
        (trace___aread_bcast_4subu64 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___aread_bcast_4subu64 <-
        (trace___aread_bcast_4subu64 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___aread_bcast_4subu64 <-
        (trace___aread_bcast_4subu64 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
        trace___aread_bcast_4subu64 <-
        (trace___aread_bcast_4subu64 ++
        [(Assert, (is_init b_buf (offset + dELTA) 8))]);
        w <- (VPBROADCAST_4u64 (BArrayS.get64d buf (offset + dELTA)));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        b_param <- b_buf;
        param_3 <- buf;
        param_2 <- offset;
        param_1 <- dELTA;
        param_0 <- lEN;
        param <- tRAIL;
        (result_2, result_1, result_0, result, tmp__trace) <@ __aread_subu64 (
        param_3, b_param, param_2, param_1, param_0, param);
        trace___aread_bcast_4subu64 <-
        (trace___aread_bcast_4subu64 ++ tmp__trace);
        trace___aread_bcast_4subu64 <-
        (trace___aread_bcast_4subu64 ++
        [(Assert,
         (((result_2 =
           (param_1 +
           ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                      param_0 : 8)))) /\
          (result_1 =
          (param_0 -
          ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                     param_0 : 8))))) /\
         (result_0 = ((8 <= param_0) ? param : 0))))]);
        dELTA <- result_2;
        lEN <- result_1;
        tRAIL <- result_0;
        t64 <- result;
        t128 <- (zeroextu128 t64);
        w <- (VPBROADCAST_4u64 (truncateu64 t128));
      }
    }
    return (dELTA, lEN, tRAIL, w, trace___aread_bcast_4subu64);
  }
  proc __aread_subu128 (buf:BArrayS.t, b_buf:BArrayS.t,
                                 offset:int, dELTA:int, lEN:int, tRAIL:int) : 
  int * int * int * W128.t * trace = {
    var w:W128.t;
    var t64:W64.t;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result:W64.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var param_4:int;
    var param_5:int;
    var param_6:int;
    var param_7:int;
    var param_8:BArrayS.t;
    var result_3:W64.t;
    var result_4:int;
    var result_5:int;
    var result_6:int;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var trace___aread_subu128:trace;
    b_param <- witness;
    b_param_0 <- witness;
    param_3 <- witness;
    param_8 <- witness;
    trace___aread_subu128 <- [];
    trace___aread_subu128 <-
    (trace___aread_subu128 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 16) ? lEN : 16)) /\
      (((lEN < 16) ? lEN : 16) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 16) ? lEN : 16))) /\
      (((offset + dELTA) + ((lEN < 16) ? lEN : 16)) <= 18446744073709551615)) /\
     ((0 < lEN) ? ((((is_init b_buf (offset + dELTA) ((lEN < 16) ? lEN : 16)) /\
                    (0 <= dELTA)) /\
                   (0 <= (offset + dELTA))) /\
                  (((offset + dELTA) + ((lEN < 16) ? lEN : 16)) <= size)) : true))))))))))]);
    trace___aread_subu128 <-
    (trace___aread_subu128 ++
    [(Assert, ((0 <= tRAIL) /\ (tRAIL < 256)))]);
    trace___aread_subu128 <-
    (trace___aread_subu128 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if (((lEN <= 0) /\ ((tRAIL %% 256) = 0))) {
      w <- (set0_128);
    } else {
      if ((16 <= lEN)) {
        trace___aread_subu128 <-
        (trace___aread_subu128 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___aread_subu128 <-
        (trace___aread_subu128 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___aread_subu128 <-
        (trace___aread_subu128 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 16) <= size)))]);
        trace___aread_subu128 <-
        (trace___aread_subu128 ++
        [(Assert, (is_init b_buf (offset + dELTA) 16))]);
        w <- (BArrayS.get128d buf (offset + dELTA));
        dELTA <- (dELTA + 16);
        lEN <- (lEN - 16);
      } else {
        if ((8 <= lEN)) {
          trace___aread_subu128 <-
          (trace___aread_subu128 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___aread_subu128 <-
          (trace___aread_subu128 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___aread_subu128 <-
          (trace___aread_subu128 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
          trace___aread_subu128 <-
          (trace___aread_subu128 ++
          [(Assert, (is_init b_buf (offset + dELTA) 8))]);
          w <- (VMOV_64 (BArrayS.get64d buf (offset + dELTA)));
          dELTA <- (dELTA + 8);
          lEN <- (lEN - 8);
          b_param <- b_buf;
          param_3 <- buf;
          param_2 <- offset;
          param_1 <- dELTA;
          param_0 <- lEN;
          param <- tRAIL;
          (result_2, result_1, result_0, result, tmp__trace) <@ __aread_subu64 (
          param_3, b_param, param_2, param_1, param_0, param);
          trace___aread_subu128 <-
          (trace___aread_subu128 ++ tmp__trace);
          trace___aread_subu128 <-
          (trace___aread_subu128 ++
          [(Assert,
           (((result_2 =
             (param_1 +
             ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                        param_0 : 8)))) /\
            (result_1 =
            (param_0 -
            ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                       param_0 : 8))))) /\
           (result_0 = ((8 <= param_0) ? param : 0))))]);
          dELTA <- result_2;
          lEN <- result_1;
          tRAIL <- result_0;
          t64 <- result;
          w <- (VPINSR_2u64 w t64 (W8.of_int 1));
        } else {
          b_param_0 <- b_buf;
          param_8 <- buf;
          param_7 <- offset;
          param_6 <- dELTA;
          param_5 <- lEN;
          param_4 <- tRAIL;
          (result_6, result_5, result_4, result_3, tmp__trace) <@ __aread_subu64 (
          param_8, b_param_0, param_7, param_6, param_5, param_4);
          trace___aread_subu128 <-
          (trace___aread_subu128 ++ tmp__trace);
          trace___aread_subu128 <-
          (trace___aread_subu128 ++
          [(Assert,
           (((result_6 =
             (param_6 +
             ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? 
                                                        param_5 : 8)))) /\
            (result_5 =
            (param_5 -
            ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? 
                                                       param_5 : 8))))) /\
           (result_4 = ((8 <= param_5) ? param_4 : 0))))]);
          dELTA <- result_6;
          lEN <- result_5;
          tRAIL <- result_4;
          t64 <- result_3;
          w <- (zeroextu128 t64);
        }
      }
    }
    return (dELTA, lEN, tRAIL, w, trace___aread_subu128);
  }
  proc __aread_subu256 (buf:BArrayS.t, b_buf:BArrayS.t,
                                 offset:int, dELTA:int, lEN:int, tRAIL:int) : 
  int * int * int * W256.t * trace = {
    var w:W256.t;
    var t128_1:W128.t;
    var t128_0:W128.t;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result:W128.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var param_4:int;
    var param_5:int;
    var param_6:int;
    var param_7:int;
    var param_8:BArrayS.t;
    var result_3:W128.t;
    var result_4:int;
    var result_5:int;
    var result_6:int;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var trace___aread_subu256:trace;
    b_param <- witness;
    b_param_0 <- witness;
    param_3 <- witness;
    param_8 <- witness;
    trace___aread_subu256 <- [];
    trace___aread_subu256 <-
    (trace___aread_subu256 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 32) ? lEN : 32)) /\
      (((lEN < 32) ? lEN : 32) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 32) ? lEN : 32))) /\
      (((offset + dELTA) + ((lEN < 32) ? lEN : 32)) <= 18446744073709551615)) /\
     ((0 < lEN) ? ((((is_init b_buf (offset + dELTA) ((lEN < 32) ? lEN : 32)) /\
                    (0 <= dELTA)) /\
                   (0 <= (offset + dELTA))) /\
                  (((offset + dELTA) + ((lEN < 32) ? lEN : 32)) <= size)) : true))))))))))]);
    trace___aread_subu256 <-
    (trace___aread_subu256 ++
    [(Assert, ((0 <= tRAIL) /\ (tRAIL < 256)))]);
    trace___aread_subu256 <-
    (trace___aread_subu256 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if (((lEN <= 0) /\ ((tRAIL %% 256) = 0))) {
      w <- (set0_256);
    } else {
      if ((32 <= lEN)) {
        trace___aread_subu256 <-
        (trace___aread_subu256 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___aread_subu256 <-
        (trace___aread_subu256 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___aread_subu256 <-
        (trace___aread_subu256 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 32) <= size)))]);
        trace___aread_subu256 <-
        (trace___aread_subu256 ++
        [(Assert, (is_init b_buf (offset + dELTA) 32))]);
        w <- (BArrayS.get256d buf (offset + dELTA));
        dELTA <- (dELTA + 32);
        lEN <- (lEN - 32);
      } else {
        if ((16 <= lEN)) {
          trace___aread_subu256 <-
          (trace___aread_subu256 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___aread_subu256 <-
          (trace___aread_subu256 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___aread_subu256 <-
          (trace___aread_subu256 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 16) <= size)))]);
          trace___aread_subu256 <-
          (trace___aread_subu256 ++
          [(Assert, (is_init b_buf (offset + dELTA) 16))]);
          t128_0 <- (BArrayS.get128d buf (offset + dELTA));
          dELTA <- (dELTA + 16);
          lEN <- (lEN - 16);
          b_param <- b_buf;
          param_3 <- buf;
          param_2 <- offset;
          param_1 <- dELTA;
          param_0 <- lEN;
          param <- tRAIL;
          (result_2, result_1, result_0, result, tmp__trace) <@ __aread_subu128 (
          param_3, b_param, param_2, param_1, param_0, param);
          trace___aread_subu256 <-
          (trace___aread_subu256 ++ tmp__trace);
          trace___aread_subu256 <-
          (trace___aread_subu256 ++
          [(Assert,
           (((result_2 =
             (param_1 +
             ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                          param_0 : 16)))) /\
            (result_1 =
            (param_0 -
            ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                         param_0 : 16))))) /\
           (result_0 = ((16 <= param_0) ? param : 0))))]);
          dELTA <- result_2;
          lEN <- result_1;
          tRAIL <- result_0;
          t128_1 <- result;
          w <-
          (W256.of_int
          (((W128.to_uint t128_0) %% (2 ^ 128)) +
          ((2 ^ 128) * (W128.to_uint t128_1))));
        } else {
          t128_1 <- (set0_128);
          b_param_0 <- b_buf;
          param_8 <- buf;
          param_7 <- offset;
          param_6 <- dELTA;
          param_5 <- lEN;
          param_4 <- tRAIL;
          (result_6, result_5, result_4, result_3, tmp__trace) <@ __aread_subu128 (
          param_8, b_param_0, param_7, param_6, param_5, param_4);
          trace___aread_subu256 <-
          (trace___aread_subu256 ++ tmp__trace);
          trace___aread_subu256 <-
          (trace___aread_subu256 ++
          [(Assert,
           (((result_6 =
             (param_6 +
             ((((param_5 < 16) ? param_5 : 16) < 0) ? 0 : ((param_5 < 16) ? 
                                                          param_5 : 16)))) /\
            (result_5 =
            (param_5 -
            ((((param_5 < 16) ? param_5 : 16) < 0) ? 0 : ((param_5 < 16) ? 
                                                         param_5 : 16))))) /\
           (result_4 = ((16 <= param_5) ? param_4 : 0))))]);
          dELTA <- result_6;
          lEN <- result_5;
          tRAIL <- result_4;
          t128_0 <- result_3;
          w <-
          (W256.of_int
          (((W128.to_uint t128_0) %% (2 ^ 128)) +
          ((2 ^ 128) * (W128.to_uint t128_1))));
        }
      }
    }
    return (dELTA, lEN, tRAIL, w, trace___aread_subu256);
  }
  proc __awrite_subu64 (buf:BArrayS.t, b_buf:BArrayS.t,
                                 offset:int, dELTA:int, lEN:int, w:W64.t) : 
  BArrayS.t * BArrayS.t * int * int * trace = {
    var trace___awrite_subu64:trace;
    trace___awrite_subu64 <- [];
    trace___awrite_subu64 <-
    (trace___awrite_subu64 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     ((0 < lEN) ? (((0 <= (offset + dELTA)) /\ (0 <= dELTA)) /\
                  (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= size)) : true))))))))]);
    trace___awrite_subu64 <-
    (trace___awrite_subu64 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        trace___awrite_subu64 <-
        (trace___awrite_subu64 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___awrite_subu64 <-
        (trace___awrite_subu64 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___awrite_subu64 <-
        (trace___awrite_subu64 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
        b_buf <-
        (BArrayS.set64d b_buf (offset + dELTA)
        (W64.of_int 18446744073709551615));
        buf <- (BArrayS.set64d buf (offset + dELTA) w);
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          trace___awrite_subu64 <-
          (trace___awrite_subu64 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___awrite_subu64 <-
          (trace___awrite_subu64 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___awrite_subu64 <-
          (trace___awrite_subu64 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= size)))]);
          b_buf <-
          (BArrayS.set32d b_buf (offset + dELTA) (W32.of_int 4294967295));
          buf <- (BArrayS.set32d buf (offset + dELTA) (truncateu32 w));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          trace___awrite_subu64 <-
          (trace___awrite_subu64 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___awrite_subu64 <-
          (trace___awrite_subu64 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___awrite_subu64 <-
          (trace___awrite_subu64 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= size)))]);
          b_buf <-
          (BArrayS.set16d b_buf (offset + dELTA) (W16.of_int 65535));
          buf <- (BArrayS.set16d buf (offset + dELTA) (truncateu16 w));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          trace___awrite_subu64 <-
          (trace___awrite_subu64 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___awrite_subu64 <-
          (trace___awrite_subu64 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___awrite_subu64 <-
          (trace___awrite_subu64 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= size)))]);
          b_buf <- (BArrayS.set8d b_buf (offset + dELTA) (W8.of_int 255));
          buf <- (BArrayS.set8d buf (offset + dELTA) (truncateu8 w));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, b_buf, dELTA, lEN, trace___awrite_subu64);
  }
  proc __awrite_subu128 (buf:BArrayS.t, b_buf:BArrayS.t,
                                  offset:int, dELTA:int, lEN:int, w:W128.t) : 
  BArrayS.t * BArrayS.t * int * int * trace = {
    var t64:W64.t;
    var param:W64.t;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result:int;
    var result_0:int;
    var result_1:BArrayS.t;
    var b_result:BArrayS.t;
    var b_param:BArrayS.t;
    var trace___awrite_subu128:trace;
    b_param <- witness;
    b_result <- witness;
    param_3 <- witness;
    result_1 <- witness;
    trace___awrite_subu128 <- [];
    trace___awrite_subu128 <-
    (trace___awrite_subu128 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 16) ? lEN : 16)) /\
      (((lEN < 16) ? lEN : 16) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 16) ? lEN : 16))) /\
      (((offset + dELTA) + ((lEN < 16) ? lEN : 16)) <= 18446744073709551615)) /\
     ((0 < lEN) ? (((0 <= (offset + dELTA)) /\ (0 <= dELTA)) /\
                  (((offset + dELTA) + ((lEN < 16) ? lEN : 16)) <= size)) : true))))))))]);
    trace___awrite_subu128 <-
    (trace___awrite_subu128 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((16 <= lEN)) {
        trace___awrite_subu128 <-
        (trace___awrite_subu128 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___awrite_subu128 <-
        (trace___awrite_subu128 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___awrite_subu128 <-
        (trace___awrite_subu128 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 16) <= size)))]);
        b_buf <-
        (BArrayS.set128d b_buf (offset + dELTA)
        (W128.of_int 340282366920938463463374607431768211455));
        buf <- (BArrayS.set128d buf (offset + dELTA) w);
        dELTA <- (dELTA + 16);
        lEN <- (lEN - 16);
      } else {
        if ((8 <= lEN)) {
          trace___awrite_subu128 <-
          (trace___awrite_subu128 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___awrite_subu128 <-
          (trace___awrite_subu128 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___awrite_subu128 <-
          (trace___awrite_subu128 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
          b_buf <-
          (BArrayS.set64d b_buf (offset + dELTA)
          (W64.of_int 18446744073709551615));
          buf <-
          (BArrayS.set64d buf (offset + dELTA) (MOVV_64 (truncateu64 w)));
          dELTA <- (dELTA + 8);
          lEN <- (lEN - 8);
          w <- (VPUNPCKH_2u64 w w);
        } else {
          
        }
        t64 <- (truncateu64 w);
        b_param <- b_buf;
        param_3 <- buf;
        param_2 <- offset;
        param_1 <- dELTA;
        param_0 <- lEN;
        param <- t64;
        (result_1, b_result, result_0, result, tmp__trace) <@ __awrite_subu64 (
        param_3, b_param, param_2, param_1, param_0, param);
        trace___awrite_subu128 <-
        (trace___awrite_subu128 ++ tmp__trace);
        trace___awrite_subu128 <-
        (trace___awrite_subu128 ++
        [(Assert,
         ((result_0 =
          (param_1 +
          ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                     param_0 : 8)))) /\
         (result =
         (param_0 -
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8))))))]);
        b_buf <- b_result;
        buf <- result_1;
        dELTA <- result_0;
        lEN <- result;
      }
    } else {
      
    }
    return (buf, b_buf, dELTA, lEN, trace___awrite_subu128);
  }
  proc __awrite_subu256 (buf:BArrayS.t, b_buf:BArrayS.t,
                                  offset:int, dELTA:int, lEN:int, w:W256.t) : 
  BArrayS.t * BArrayS.t * int * int * trace = {
    var t128:W128.t;
    var param:W128.t;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result:int;
    var result_0:int;
    var result_1:BArrayS.t;
    var b_result:BArrayS.t;
    var b_param:BArrayS.t;
    var trace___awrite_subu256:trace;
    b_param <- witness;
    b_result <- witness;
    param_3 <- witness;
    result_1 <- witness;
    trace___awrite_subu256 <- [];
    trace___awrite_subu256 <-
    (trace___awrite_subu256 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 32) ? lEN : 32)) /\
      (((lEN < 32) ? lEN : 32) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 32) ? lEN : 32))) /\
      (((offset + dELTA) + ((lEN < 32) ? lEN : 32)) <= 18446744073709551615)) /\
     ((0 < lEN) ? (((0 <= (offset + dELTA)) /\ (0 <= dELTA)) /\
                  (((offset + dELTA) + ((lEN < 32) ? lEN : 32)) <= size)) : true))))))))]);
    trace___awrite_subu256 <-
    (trace___awrite_subu256 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((32 <= lEN)) {
        trace___awrite_subu256 <-
        (trace___awrite_subu256 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___awrite_subu256 <-
        (trace___awrite_subu256 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___awrite_subu256 <-
        (trace___awrite_subu256 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 32) <= size)))]);
        b_buf <-
        (BArrayS.set256d b_buf (offset + dELTA)
        (W256.of_int
        115792089237316195423570985008687907853269984665640564039457584007913129639935
        ));
        buf <- (BArrayS.set256d buf (offset + dELTA) w);
        dELTA <- (dELTA + 32);
        lEN <- (lEN - 32);
      } else {
        t128 <- (truncateu128 w);
        if ((16 <= lEN)) {
          trace___awrite_subu256 <-
          (trace___awrite_subu256 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___awrite_subu256 <-
          (trace___awrite_subu256 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___awrite_subu256 <-
          (trace___awrite_subu256 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 16) <= size)))]);
          b_buf <-
          (BArrayS.set128d b_buf (offset + dELTA)
          (W128.of_int 340282366920938463463374607431768211455));
          buf <- (BArrayS.set128d buf (offset + dELTA) t128);
          dELTA <- (dELTA + 16);
          lEN <- (lEN - 16);
          t128 <- (VEXTRACTI128 w (W8.of_int 1));
        } else {
          
        }
        b_param <- b_buf;
        param_3 <- buf;
        param_2 <- offset;
        param_1 <- dELTA;
        param_0 <- lEN;
        param <- t128;
        (result_1, b_result, result_0, result, tmp__trace) <@ __awrite_subu128 (
        param_3, b_param, param_2, param_1, param_0, param);
        trace___awrite_subu256 <-
        (trace___awrite_subu256 ++ tmp__trace);
        trace___awrite_subu256 <-
        (trace___awrite_subu256 ++
        [(Assert,
         ((result_0 =
          (param_1 +
          ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                       param_0 : 16)))) /\
         (result =
         (param_0 -
         ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                      param_0 : 16))))))]);
        b_buf <- b_result;
        buf <- result_1;
        dELTA <- result_0;
        lEN <- result;
      }
    } else {
      
    }
    return (buf, b_buf, dELTA, lEN, trace___awrite_subu256);
  }
  proc __addstate_array_avx2 (st:BArray224.t, b_st:BArray224.t,
                                       buf:BArrayS.t, b_buf:BArrayS.t,
                                       offset:int, lEN:int, tRAILB:int) : 
  BArray224.t * BArray224.t * int * trace = {
    var dELTA:int;
    var t64:W64.t;
    var t128_0:W128.t;
    var r0:W256.t;
    var r1:W256.t;
    var t128_1:W128.t;
    var r3:W256.t;
    var r4:W256.t;
    var r5:W256.t;
    var r2:W256.t;
    var r6:W256.t;
    var param:W256.t;
    var param_0:W256.t;
    var param_1:W256.t;
    var param_2:W256.t;
    var param_3:BArray224.t;
    var result:BArray224.t;
    var param_4:int;
    var param_5:int;
    var param_6:int;
    var param_7:int;
    var param_8:BArrayS.t;
    var result_0:W256.t;
    var result_1:int;
    var result_2:int;
    var result_3:int;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:int;
    var param_13:BArrayS.t;
    var result_4:W64.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var param_14:int;
    var param_15:int;
    var param_16:int;
    var param_17:int;
    var param_18:BArrayS.t;
    var result_8:W256.t;
    var result_9:int;
    var result_10:int;
    var result_11:int;
    var param_19:int;
    var param_20:int;
    var param_21:int;
    var param_22:int;
    var param_23:BArrayS.t;
    var result_12:W64.t;
    var result_13:int;
    var result_14:int;
    var result_15:int;
    var param_24:int;
    var param_25:int;
    var param_26:int;
    var param_27:int;
    var param_28:BArrayS.t;
    var result_16:W256.t;
    var result_17:int;
    var result_18:int;
    var result_19:int;
    var param_29:int;
    var param_30:int;
    var param_31:int;
    var param_32:int;
    var param_33:BArrayS.t;
    var result_20:W64.t;
    var result_21:int;
    var result_22:int;
    var result_23:int;
    var param_34:int;
    var param_35:int;
    var param_36:int;
    var param_37:int;
    var param_38:BArrayS.t;
    var result_24:W256.t;
    var result_25:int;
    var result_26:int;
    var result_27:int;
    var param_39:int;
    var param_40:int;
    var param_41:int;
    var param_42:int;
    var param_43:BArrayS.t;
    var result_28:W64.t;
    var result_29:int;
    var result_30:int;
    var result_31:int;
    var param_44:int;
    var param_45:int;
    var param_46:int;
    var param_47:int;
    var param_48:BArrayS.t;
    var result_32:W256.t;
    var result_33:int;
    var result_34:int;
    var result_35:int;
    var param_49:int;
    var param_50:int;
    var param_51:int;
    var param_52:int;
    var param_53:BArrayS.t;
    var result_36:W64.t;
    var result_37:int;
    var result_38:int;
    var result_39:int;
    var b_result:BArray224.t;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_param_1:BArrayS.t;
    var b_param_2:BArrayS.t;
    var b_param_3:BArrayS.t;
    var b_param_4:BArrayS.t;
    var b_param_5:BArrayS.t;
    var b_param_6:BArrayS.t;
    var b_param_7:BArrayS.t;
    var b_param_8:BArrayS.t;
    var trace___addstate_array_avx2:trace;
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
    b_result <- witness;
    param_3 <- witness;
    param_8 <- witness;
    param_13 <- witness;
    param_18 <- witness;
    param_23 <- witness;
    param_28 <- witness;
    param_33 <- witness;
    param_38 <- witness;
    param_43 <- witness;
    param_48 <- witness;
    param_53 <- witness;
    result <- witness;
    trace___addstate_array_avx2 <- [];
    trace___addstate_array_avx2 <-
    (trace___addstate_array_avx2 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     ((((((0 <= offset) /\ (0 <= lEN)) /\ ((offset + lEN) <= size)) /\
       (is_init b_buf offset lEN)) /\
      (is_init b_st 0 224)) /\
     (lEN <= 200)))))]);
    trace___addstate_array_avx2 <-
    (trace___addstate_array_avx2 ++
    [(Assert, ((0 <= tRAILB) /\ (tRAILB < 256)))]);
    trace___addstate_array_avx2 <-
    (trace___addstate_array_avx2 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    b_param_8 <- b_buf;
    param_53 <- buf;
    param_52 <- offset;
    param_51 <- dELTA;
    param_50 <- lEN;
    param_49 <- tRAILB;
    (result_39, result_38, result_37, result_36, tmp__trace) <@ __aread_subu64 (
    param_53, b_param_8, param_52, param_51, param_50, param_49);
    trace___addstate_array_avx2 <-
    (trace___addstate_array_avx2 ++ tmp__trace);
    trace___addstate_array_avx2 <-
    (trace___addstate_array_avx2 ++
    [(Assert,
     (((result_39 =
       (param_51 +
       ((((param_50 < 8) ? param_50 : 8) < 0) ? 0 : ((param_50 < 8) ? 
                                                    param_50 : 8)))) /\
      (result_38 =
      (param_50 -
      ((((param_50 < 8) ? param_50 : 8) < 0) ? 0 : ((param_50 < 8) ? 
                                                   param_50 : 8))))) /\
     (result_37 = ((8 <= param_50) ? param_49 : 0))))]);
    dELTA <- result_39;
    lEN <- result_38;
    tRAILB <- result_37;
    t64 <- result_36;
    t128_0 <- (zeroextu128 t64);
    r0 <- (VPBROADCAST_4u64 (truncateu64 t128_0));
    st <- (BArray224.set256 st 0 ((BArray224.get256 st 0) `^` r0));
    b_param_7 <- b_buf;
    param_48 <- buf;
    param_47 <- offset;
    param_46 <- dELTA;
    param_45 <- lEN;
    param_44 <- tRAILB;
    (result_35, result_34, result_33, result_32, tmp__trace) <@ __aread_subu256 (
    param_48, b_param_7, param_47, param_46, param_45, param_44);
    trace___addstate_array_avx2 <-
    (trace___addstate_array_avx2 ++ tmp__trace);
    trace___addstate_array_avx2 <-
    (trace___addstate_array_avx2 ++
    [(Assert,
     (((result_35 =
       (param_46 +
       ((((param_45 < 32) ? param_45 : 32) < 0) ? 0 : ((param_45 < 32) ? 
                                                      param_45 : 32)))) /\
      (result_34 =
      (param_45 -
      ((((param_45 < 32) ? param_45 : 32) < 0) ? 0 : ((param_45 < 32) ? 
                                                     param_45 : 32))))) /\
     (result_33 = ((32 <= param_45) ? param_44 : 0))))]);
    dELTA <- result_35;
    lEN <- result_34;
    tRAILB <- result_33;
    r1 <- result_32;
    st <- (BArray224.set256 st 1 ((BArray224.get256 st 1) `^` r1));
    if ((0 < lEN)) {
      b_param_6 <- b_buf;
      param_43 <- buf;
      param_42 <- offset;
      param_41 <- dELTA;
      param_40 <- lEN;
      param_39 <- tRAILB;
      (result_31, result_30, result_29, result_28, tmp__trace) <@ __aread_subu64 (
      param_43, b_param_6, param_42, param_41, param_40, param_39);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++ tmp__trace);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++
      [(Assert,
       (((result_31 =
         (param_41 +
         ((((param_40 < 8) ? param_40 : 8) < 0) ? 0 : ((param_40 < 8) ? 
                                                      param_40 : 8)))) /\
        (result_30 =
        (param_40 -
        ((((param_40 < 8) ? param_40 : 8) < 0) ? 0 : ((param_40 < 8) ? 
                                                     param_40 : 8))))) /\
       (result_29 = ((8 <= param_40) ? param_39 : 0))))]);
      dELTA <- result_31;
      lEN <- result_30;
      tRAILB <- result_29;
      t64 <- result_28;
      t128_1 <- (zeroextu128 t64);
      b_param_5 <- b_buf;
      param_38 <- buf;
      param_37 <- offset;
      param_36 <- dELTA;
      param_35 <- lEN;
      param_34 <- tRAILB;
      (result_27, result_26, result_25, result_24, tmp__trace) <@ __aread_subu256 (
      param_38, b_param_5, param_37, param_36, param_35, param_34);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++ tmp__trace);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++
      [(Assert,
       (((result_27 =
         (param_36 +
         ((((param_35 < 32) ? param_35 : 32) < 0) ? 0 : ((param_35 < 32) ? 
                                                        param_35 : 32)))) /\
        (result_26 =
        (param_35 -
        ((((param_35 < 32) ? param_35 : 32) < 0) ? 0 : ((param_35 < 32) ? 
                                                       param_35 : 32))))) /\
       (result_25 = ((32 <= param_35) ? param_34 : 0))))]);
      dELTA <- result_27;
      lEN <- result_26;
      tRAILB <- result_25;
      r3 <- result_24;
      b_param_4 <- b_buf;
      param_33 <- buf;
      param_32 <- offset;
      param_31 <- dELTA;
      param_30 <- lEN;
      param_29 <- tRAILB;
      (result_23, result_22, result_21, result_20, tmp__trace) <@ __aread_subu64 (
      param_33, b_param_4, param_32, param_31, param_30, param_29);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++ tmp__trace);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++
      [(Assert,
       (((result_23 =
         (param_31 +
         ((((param_30 < 8) ? param_30 : 8) < 0) ? 0 : ((param_30 < 8) ? 
                                                      param_30 : 8)))) /\
        (result_22 =
        (param_30 -
        ((((param_30 < 8) ? param_30 : 8) < 0) ? 0 : ((param_30 < 8) ? 
                                                     param_30 : 8))))) /\
       (result_21 = ((8 <= param_30) ? param_29 : 0))))]);
      dELTA <- result_23;
      lEN <- result_22;
      tRAILB <- result_21;
      t64 <- result_20;
      t128_0 <- (zeroextu128 t64);
      b_param_3 <- b_buf;
      param_28 <- buf;
      param_27 <- offset;
      param_26 <- dELTA;
      param_25 <- lEN;
      param_24 <- tRAILB;
      (result_19, result_18, result_17, result_16, tmp__trace) <@ __aread_subu256 (
      param_28, b_param_3, param_27, param_26, param_25, param_24);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++ tmp__trace);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++
      [(Assert,
       (((result_19 =
         (param_26 +
         ((((param_25 < 32) ? param_25 : 32) < 0) ? 0 : ((param_25 < 32) ? 
                                                        param_25 : 32)))) /\
        (result_18 =
        (param_25 -
        ((((param_25 < 32) ? param_25 : 32) < 0) ? 0 : ((param_25 < 32) ? 
                                                       param_25 : 32))))) /\
       (result_17 = ((32 <= param_25) ? param_24 : 0))))]);
      dELTA <- result_19;
      lEN <- result_18;
      tRAILB <- result_17;
      r4 <- result_16;
      b_param_2 <- b_buf;
      param_23 <- buf;
      param_22 <- offset;
      param_21 <- dELTA;
      param_20 <- lEN;
      param_19 <- tRAILB;
      (result_15, result_14, result_13, result_12, tmp__trace) <@ __aread_subu64 (
      param_23, b_param_2, param_22, param_21, param_20, param_19);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++ tmp__trace);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++
      [(Assert,
       (((result_15 =
         (param_21 +
         ((((param_20 < 8) ? param_20 : 8) < 0) ? 0 : ((param_20 < 8) ? 
                                                      param_20 : 8)))) /\
        (result_14 =
        (param_20 -
        ((((param_20 < 8) ? param_20 : 8) < 0) ? 0 : ((param_20 < 8) ? 
                                                     param_20 : 8))))) /\
       (result_13 = ((8 <= param_20) ? param_19 : 0))))]);
      dELTA <- result_15;
      lEN <- result_14;
      tRAILB <- result_13;
      t64 <- result_12;
      t128_1 <- (VPINSR_2u64 t128_1 t64 (W8.of_int 1));
      b_param_1 <- b_buf;
      param_18 <- buf;
      param_17 <- offset;
      param_16 <- dELTA;
      param_15 <- lEN;
      param_14 <- tRAILB;
      (result_11, result_10, result_9, result_8, tmp__trace) <@ __aread_subu256 (
      param_18, b_param_1, param_17, param_16, param_15, param_14);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++ tmp__trace);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++
      [(Assert,
       (((result_11 =
         (param_16 +
         ((((param_15 < 32) ? param_15 : 32) < 0) ? 0 : ((param_15 < 32) ? 
                                                        param_15 : 32)))) /\
        (result_10 =
        (param_15 -
        ((((param_15 < 32) ? param_15 : 32) < 0) ? 0 : ((param_15 < 32) ? 
                                                       param_15 : 32))))) /\
       (result_9 = ((32 <= param_15) ? param_14 : 0))))]);
      dELTA <- result_11;
      lEN <- result_10;
      tRAILB <- result_9;
      r5 <- result_8;
      b_param_0 <- b_buf;
      param_13 <- buf;
      param_12 <- offset;
      param_11 <- dELTA;
      param_10 <- lEN;
      param_9 <- tRAILB;
      (result_7, result_6, result_5, result_4, tmp__trace) <@ __aread_subu64 (
      param_13, b_param_0, param_12, param_11, param_10, param_9);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++ tmp__trace);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++
      [(Assert,
       (((result_7 =
         (param_11 +
         ((((param_10 < 8) ? param_10 : 8) < 0) ? 0 : ((param_10 < 8) ? 
                                                      param_10 : 8)))) /\
        (result_6 =
        (param_10 -
        ((((param_10 < 8) ? param_10 : 8) < 0) ? 0 : ((param_10 < 8) ? 
                                                     param_10 : 8))))) /\
       (result_5 = ((8 <= param_10) ? param_9 : 0))))]);
      dELTA <- result_7;
      lEN <- result_6;
      tRAILB <- result_5;
      t64 <- result_4;
      t128_0 <- (VPINSR_2u64 t128_0 t64 (W8.of_int 1));
      r2 <-
      (W256.of_int
      (((W128.to_uint t128_0) %% (2 ^ 128)) +
      ((2 ^ 128) * (W128.to_uint t128_1))));
      st <- (BArray224.set256 st 2 ((BArray224.get256 st 2) `^` r2));
      b_param <- b_buf;
      param_8 <- buf;
      param_7 <- offset;
      param_6 <- dELTA;
      param_5 <- lEN;
      param_4 <- tRAILB;
      (result_3, result_2, result_1, result_0, tmp__trace) <@ __aread_subu256 (
      param_8, b_param, param_7, param_6, param_5, param_4);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++ tmp__trace);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++
      [(Assert,
       (((result_3 =
         (param_6 +
         ((((param_5 < 32) ? param_5 : 32) < 0) ? 0 : ((param_5 < 32) ? 
                                                      param_5 : 32)))) /\
        (result_2 =
        (param_5 -
        ((((param_5 < 32) ? param_5 : 32) < 0) ? 0 : ((param_5 < 32) ? 
                                                     param_5 : 32))))) /\
       (result_1 = ((32 <= param_5) ? param_4 : 0))))]);
      dELTA <- result_3;
      r6 <- result_0;
      param_3 <- st;
      param_2 <- r3;
      param_1 <- r4;
      param_0 <- r5;
      param <- r6;
      (result, b_result, tmp__trace) <@ __addstate_r3456_avx2 (
      param_3, (BArray224.init_arr (W8.of_int 255) 224), param_2, param_1,
      param_0, param);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++ tmp__trace);
      trace___addstate_array_avx2 <-
      (trace___addstate_array_avx2 ++
      [(Assert, (is_init b_result 0 224))]);
      st <- result;
    } else {
      
    }
    trace___addstate_array_avx2 <-
    (trace___addstate_array_avx2 ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace___addstate_array_avx2 <-
    (trace___addstate_array_avx2 ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    b_st <- (BArray224.init_arr (W8.of_int 255) 224);
    return (st, b_st, offset, trace___addstate_array_avx2);
  }
  proc __absorb_array_avx2 (st:BArray224.t, b_st:BArray224.t,
                                     buf:BArrayS.t, b_buf:BArrayS.t,
                                     offset:int, lEN:int, rATE8:int,
                                     tRAILB:int) : BArray224.t *
                                                   BArray224.t * int * trace = {
    var iTERS:int;
    var i:int;
    var param:int;
    var param_0:BArray224.t;
    var result:BArray224.t;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:BArrayS.t;
    var param_5:BArray224.t;
    var result_0:int;
    var result_1:BArray224.t;
    var param_6:BArray224.t;
    var result_2:BArray224.t;
    var param_7:int;
    var param_8:int;
    var param_9:int;
    var param_10:BArrayS.t;
    var param_11:BArray224.t;
    var result_3:int;
    var result_4:BArray224.t;
    var b_result:BArray224.t;
    var b_result_0:BArray224.t;
    var b_param:BArrayS.t;
    var b_result_1:BArray224.t;
    var b_result_2:BArray224.t;
    var b_param_0:BArrayS.t;
    var trace___absorb_array_avx2:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    param_0 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_6 <- witness;
    param_10 <- witness;
    param_11 <- witness;
    result <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_4 <- witness;
    trace___absorb_array_avx2 <- [];
    trace___absorb_array_avx2 <-
    (trace___absorb_array_avx2 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     (((((((0 <= offset) /\ (0 <= lEN)) /\ ((offset + lEN) <= size)) /\
         (0 < rATE8)) /\
        (rATE8 < 200)) /\
      (is_init b_buf offset lEN)) /\
     (is_init b_st 0 224)))))]);
    trace___absorb_array_avx2 <-
    (trace___absorb_array_avx2 ++
    [(Assert, ((0 <= tRAILB) /\ (tRAILB < 256)))]);
    trace___absorb_array_avx2 <-
    (trace___absorb_array_avx2 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    iTERS <- (lEN %/ rATE8);
    if ((0 < iTERS)) {
      i <- 0;
      trace___absorb_array_avx2 <-
      (trace___absorb_array_avx2 ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_11 <- st;
        b_param_0 <- b_buf;
        param_10 <- buf;
        param_9 <- offset;
        param_8 <- rATE8;
        param_7 <- 0;
        (result_4, b_result_2, result_3, tmp__trace) <@ __addstate_array_avx2 (
        param_11, (BArray224.init_arr (W8.of_int 255) 224), param_10,
        b_param_0, param_9, param_8, param_7);
        trace___absorb_array_avx2 <-
        (trace___absorb_array_avx2 ++ tmp__trace);
        trace___absorb_array_avx2 <-
        (trace___absorb_array_avx2 ++
        [(Assert,
         (((0 <= param_8) /\ (param_8 <= 18446744073709551615)) /\
         (((0 <= (param_9 + param_8)) /\
          ((param_9 + param_8) <= 18446744073709551615)) /\
         ((is_init b_result_2 0 224) /\ (result_3 = (param_9 + param_8))))))]);
        trace___absorb_array_avx2 <-
        (trace___absorb_array_avx2 ++
        [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
        st <- result_4;
        offset <- result_3;
        param_6 <- st;
        (result_2, b_result_1, tmp__trace) <@ _keccakf1600_avx2 (
        param_6, (BArray224.init_arr (W8.of_int 255) 224));
        trace___absorb_array_avx2 <-
        (trace___absorb_array_avx2 ++ tmp__trace);
        trace___absorb_array_avx2 <-
        (trace___absorb_array_avx2 ++
        [(Assert, (is_init b_result_1 0 224))]);
        st <- result_2;
        trace___absorb_array_avx2 <-
        (trace___absorb_array_avx2 ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace___absorb_array_avx2 <-
        (trace___absorb_array_avx2 ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
    } else {
      
    }
    lEN <- (lEN %% rATE8);
    param_5 <- st;
    b_param <- b_buf;
    param_4 <- buf;
    param_3 <- offset;
    param_2 <- lEN;
    param_1 <- tRAILB;
    (result_1, b_result_0, result_0, tmp__trace) <@ __addstate_array_avx2 (
    param_5, (BArray224.init_arr (W8.of_int 255) 224), param_4, b_param,
    param_3, param_2, param_1);
    trace___absorb_array_avx2 <-
    (trace___absorb_array_avx2 ++ tmp__trace);
    trace___absorb_array_avx2 <-
    (trace___absorb_array_avx2 ++
    [(Assert,
     (((0 <= param_2) /\ (param_2 <= 18446744073709551615)) /\
     (((0 <= (param_3 + param_2)) /\
      ((param_3 + param_2) <= 18446744073709551615)) /\
     ((is_init b_result_0 0 224) /\ (result_0 = (param_3 + param_2))))))]);
    trace___absorb_array_avx2 <-
    (trace___absorb_array_avx2 ++
    [(Assert, ((0 <= result_0) /\ (result_0 <= 18446744073709551615)))]);
    st <- result_1;
    offset <- result_0;
    if ((tRAILB <> 0)) {
      param_0 <- st;
      param <- rATE8;
      (result, b_result, tmp__trace) <@ __addratebit_avx2 (param_0,
      (BArray224.init_arr (W8.of_int 255) 224), param);
      trace___absorb_array_avx2 <-
      (trace___absorb_array_avx2 ++ tmp__trace);
      trace___absorb_array_avx2 <-
      (trace___absorb_array_avx2 ++
      [(Assert, (is_init b_result 0 224))]);
      st <- result;
    } else {
      
    }
    b_st <- (BArray224.init_arr (W8.of_int 255) 224);
    return (st, b_st, offset, trace___absorb_array_avx2);
  }
  proc __pstate_array_avx2 (pst:BArray200.t, b_pst:BArray200.t,
                                     aT:int, buf:BArrayS.t,
                                     b_buf:BArrayS.t, offset:int, lEN:int,
                                     tRAILB:int) : BArray200.t *
                                                   BArray200.t * int * int *
                                                   trace = {
    var aLL:int;
    var dELTA:int;
    var lO:int;
    var t64:W64.t;
    var t256:W256.t;
    var t128:W128.t;
    var at:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result:W64.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var param_4:int;
    var param_5:int;
    var param_6:int;
    var param_7:int;
    var param_8:BArrayS.t;
    var result_3:W64.t;
    var result_4:int;
    var result_5:int;
    var result_6:int;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:int;
    var param_13:BArrayS.t;
    var result_7:W64.t;
    var result_8:int;
    var result_9:int;
    var result_10:int;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_param_1:BArrayS.t;
    var trace___pstate_array_avx2:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    param_3 <- witness;
    param_8 <- witness;
    param_13 <- witness;
    trace___pstate_array_avx2 <- [];
    trace___pstate_array_avx2 <-
    (trace___pstate_array_avx2 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     ((((((((0 <= offset) /\ (0 <= lEN)) /\ (0 <= aT)) /\ (aT < 200)) /\
        (((aT + lEN) + ((tRAILB <> 0) ? 1 : 0)) < 200)) /\
       ((offset + lEN) <= size)) /\
      (is_init b_buf offset lEN)) /\
     (is_init b_pst 0 200)))))]);
    trace___pstate_array_avx2 <-
    (trace___pstate_array_avx2 ++
    [(Assert, ((0 <= tRAILB) /\ (tRAILB < 256)))]);
    trace___pstate_array_avx2 <-
    (trace___pstate_array_avx2 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    aLL <- (aT + lEN);
    lO <- (aT %% 8);
    trace___pstate_array_avx2 <-
    (trace___pstate_array_avx2 ++
    [(Assert, ((0 <= (aT %/ 8)) /\ ((aT %/ 8) <= 18446744073709551615)))]);
    at <- (aT %/ 8);
    if ((0 < lO)) {
      if (((lO + lEN) < 8)) {
        if ((tRAILB <> 0)) {
          aLL <- (aLL + 1);
        } else {
          
        }
        b_param_0 <- b_buf;
        param_8 <- buf;
        param_7 <- offset;
        param_6 <- dELTA;
        param_5 <- lEN;
        param_4 <- tRAILB;
        (result_6, result_5, result_4, result_3, tmp__trace) <@ __aread_subu64 (
        param_8, b_param_0, param_7, param_6, param_5, param_4);
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++ tmp__trace);
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert,
         (((result_6 =
           (param_6 +
           ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? 
                                                      param_5 : 8)))) /\
          (result_5 =
          (param_5 -
          ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? 
                                                     param_5 : 8))))) /\
         (result_4 = ((8 <= param_5) ? param_4 : 0))))]);
        dELTA <- result_6;
        tRAILB <- result_4;
        t64 <- result_3;
        t64 <- (t64 `<<` (W8.of_int (8 * lO)));
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
        pst <- (BArray200.set64 pst at ((BArray200.get64 pst at) `^` t64));
        aT <- 0;
        lEN <- 0;
      } else {
        if ((8 <= lEN)) {
          trace___pstate_array_avx2 <-
          (trace___pstate_array_avx2 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___pstate_array_avx2 <-
          (trace___pstate_array_avx2 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___pstate_array_avx2 <-
          (trace___pstate_array_avx2 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
          trace___pstate_array_avx2 <-
          (trace___pstate_array_avx2 ++
          [(Assert, (is_init b_buf (offset + dELTA) 8))]);
          t64 <- (BArrayS.get64d buf (offset + dELTA));
          dELTA <- (dELTA + (8 - lO));
        } else {
          b_param_1 <- b_buf;
          param_13 <- buf;
          param_12 <- offset;
          param_11 <- dELTA;
          param_10 <- (8 - lO);
          param_9 <- 0;
          (result_10, result_9, result_8, result_7, tmp__trace) <@ __aread_subu64 (
          param_13, b_param_1, param_12, param_11, param_10, param_9);
          trace___pstate_array_avx2 <-
          (trace___pstate_array_avx2 ++ tmp__trace);
          trace___pstate_array_avx2 <-
          (trace___pstate_array_avx2 ++
          [(Assert,
           (((result_10 =
             (param_11 +
             ((((param_10 < 8) ? param_10 : 8) < 0) ? 0 : ((param_10 < 8) ? 
                                                          param_10 : 8)))) /\
            (result_9 =
            (param_10 -
            ((((param_10 < 8) ? param_10 : 8) < 0) ? 0 : ((param_10 < 8) ? 
                                                         param_10 : 8))))) /\
           (result_8 = ((8 <= param_10) ? param_9 : 0))))]);
          dELTA <- result_10;
          t64 <- result_7;
        }
        lEN <- (lEN - (8 - lO));
        aT <- (aT + (8 - lO));
        t64 <- (t64 `<<` (W8.of_int (8 * lO)));
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
        pst <- (BArray200.set64 pst at ((BArray200.get64 pst at) `^` t64));
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
        at <- (at + 1);
      }
    } else {
      
    }
    if ((32 <= lEN)) {
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
      dELTA <- 0;
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert,
       ((0 <= ((aT %/ 8) + (4 * (lEN %/ 32)))) /\
       (((aT %/ 8) + (4 * (lEN %/ 32))) <= 18446744073709551615)))]);
      while ((at < ((aT %/ 8) + (4 * (lEN %/ 32))))) {
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert, (is_init b_buf offset 32))]);
        t256 <- (BArrayS.get256d buf offset);
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert,
         ((0 <= (offset + 32)) /\ ((offset + 32) <= 18446744073709551615)))]);
        offset <- (offset + 32);
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert, ((0 <= (8 * at)) /\ ((8 * at) <= 18446744073709551615)))]);
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert, ((0 <= (8 * at)) /\ (((8 * at) + 32) <= 200)))]);
        pst <- (BArray200.set256d pst (8 * at) t256);
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert, ((0 <= (at + 4)) /\ ((at + 4) <= 18446744073709551615)))]);
        at <- (at + 4);
        trace___pstate_array_avx2 <-
        (trace___pstate_array_avx2 ++
        [(Assert,
         ((0 <= ((aT %/ 8) + (4 * (lEN %/ 32)))) /\
         (((aT %/ 8) + (4 * (lEN %/ 32))) <= 18446744073709551615)))]);
      }
      lEN <- (lEN %% 32);
    } else {
      
    }
    if ((16 <= lEN)) {
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 16) <= size)))]);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, (is_init b_buf (offset + dELTA) 16))]);
      t128 <- (BArrayS.get128d buf (offset + dELTA));
      dELTA <- (dELTA + 16);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, ((0 <= (8 * at)) /\ ((8 * at) <= 18446744073709551615)))]);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, ((0 <= (8 * at)) /\ (((8 * at) + 16) <= 200)))]);
      pst <- (BArray200.set128d pst (8 * at) t128);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
      at <- (at + 2);
      lEN <- (lEN - 16);
    } else {
      
    }
    if ((8 <= lEN)) {
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, (is_init b_buf (offset + dELTA) 8))]);
      t64 <- (BArrayS.get64d buf (offset + dELTA));
      dELTA <- (dELTA + 8);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, ((0 <= (8 * at)) /\ ((8 * at) <= 18446744073709551615)))]);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, ((0 <= (8 * at)) /\ (((8 * at) + 8) <= 200)))]);
      pst <- (BArray200.set64d pst (8 * at) t64);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      lEN <- (lEN - 8);
    } else {
      
    }
    lO <- ((aT + lEN) %% 8);
    if (((0 < lO) \/ (tRAILB <> 0))) {
      if ((tRAILB <> 0)) {
        aLL <- (aLL + 1);
      } else {
        
      }
      b_param <- b_buf;
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- dELTA;
      param_0 <- lO;
      param <- tRAILB;
      (result_2, result_1, result_0, result, tmp__trace) <@ __aread_subu64 (
      param_3, b_param, param_2, param_1, param_0, param);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++ tmp__trace);
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert,
       (((result_2 =
         (param_1 +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))) /\
        (result_1 =
        (param_0 -
        ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8))))) /\
       (result_0 = ((8 <= param_0) ? param : 0))))]);
      dELTA <- result_2;
      t64 <- result;
      trace___pstate_array_avx2 <-
      (trace___pstate_array_avx2 ++
      [(Assert, ((0 <= ((aLL %/ 8) * 8)) /\ ((((aLL %/ 8) * 8) + 8) <= 200)))]);
      pst <- (BArray200.set64 pst (aLL %/ 8) t64);
    } else {
      
    }
    trace___pstate_array_avx2 <-
    (trace___pstate_array_avx2 ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace___pstate_array_avx2 <-
    (trace___pstate_array_avx2 ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    b_pst <- (BArray200.init_arr (W8.of_int 255) 200);
    return (pst, b_pst, aLL, offset, trace___pstate_array_avx2);
  }
  proc __pabsorb_array_avx2 (pst:BArray200.t, b_pst:BArray200.t,
                                      aT:int, st:BArray224.t,
                                      b_st:BArray224.t, buf:BArrayS.t,
                                      b_buf:BArrayS.t, offset:int, lEN:int,
                                      rATE8:int, tRAILB:int) : BArray200.t *
                                                               BArray200.t *
                                                               int *
                                                               BArray224.t *
                                                               BArray224.t *
                                                               int * trace = {
    var aLL:int;
    var iTERS:int;
    var i:int;
    var param:int;
    var param_0:BArray224.t;
    var result:BArray224.t;
    var param_1:BArray200.t;
    var param_2:BArray224.t;
    var result_0:BArray224.t;
    var param_3:BArray200.t;
    var param_4:BArray224.t;
    var result_1:BArray224.t;
    var param_5:int;
    var param_6:int;
    var param_7:int;
    var param_8:BArrayS.t;
    var param_9:int;
    var param_10:BArray200.t;
    var result_2:int;
    var result_3:int;
    var result_4:BArray200.t;
    var param_11:int;
    var param_12:BArray224.t;
    var result_5:BArray224.t;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var param_16:BArrayS.t;
    var param_17:BArray224.t;
    var result_6:int;
    var result_7:BArray224.t;
    var param_18:int;
    var param_19:int;
    var param_20:int;
    var param_21:BArrayS.t;
    var param_22:int;
    var param_23:BArray200.t;
    var result_8:int;
    var result_9:int;
    var result_10:BArray200.t;
    var param_24:BArray224.t;
    var result_11:BArray224.t;
    var param_25:int;
    var param_26:int;
    var param_27:int;
    var param_28:BArrayS.t;
    var param_29:BArray224.t;
    var result_12:int;
    var result_13:BArray224.t;
    var param_30:BArray224.t;
    var result_14:BArray224.t;
    var param_31:BArray200.t;
    var param_32:BArray224.t;
    var result_15:BArray224.t;
    var param_33:int;
    var param_34:int;
    var param_35:int;
    var param_36:BArrayS.t;
    var param_37:int;
    var param_38:BArray200.t;
    var result_16:int;
    var result_17:int;
    var result_18:BArray200.t;
    var b_result:BArray224.t;
    var b_result_0:BArray224.t;
    var b_result_1:BArray224.t;
    var b_result_2:BArray200.t;
    var b_param:BArrayS.t;
    var b_result_3:BArray224.t;
    var b_result_4:BArray224.t;
    var b_param_0:BArrayS.t;
    var b_result_5:BArray200.t;
    var b_param_1:BArrayS.t;
    var b_result_6:BArray224.t;
    var b_result_7:BArray224.t;
    var b_param_2:BArrayS.t;
    var b_result_8:BArray224.t;
    var b_result_9:BArray224.t;
    var b_result_10:BArray200.t;
    var b_param_3:BArrayS.t;
    var trace___pabsorb_array_avx2:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_param_3 <- witness;
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
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_8 <- witness;
    param_10 <- witness;
    param_12 <- witness;
    param_16 <- witness;
    param_17 <- witness;
    param_21 <- witness;
    param_23 <- witness;
    param_24 <- witness;
    param_28 <- witness;
    param_29 <- witness;
    param_30 <- witness;
    param_31 <- witness;
    param_32 <- witness;
    param_36 <- witness;
    param_38 <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_4 <- witness;
    result_5 <- witness;
    result_7 <- witness;
    result_10 <- witness;
    result_11 <- witness;
    result_13 <- witness;
    result_14 <- witness;
    result_15 <- witness;
    result_18 <- witness;
    trace___pabsorb_array_avx2 <- [];
    trace___pabsorb_array_avx2 <-
    (trace___pabsorb_array_avx2 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     (((((((((((0 <= offset) /\ (0 <= lEN)) /\ (0 <= aT)) /\ (aT < rATE8)) /\
           ((offset + lEN) <= size)) /\
          (((aT + lEN) + ((tRAILB <> 0) ? 1 : 0)) < 200)) /\
         (0 < rATE8)) /\
        (rATE8 < 200)) /\
       (is_init b_buf offset lEN)) /\
      (is_init b_pst 0 200)) /\
     (is_init b_st 0 224)))))]);
    trace___pabsorb_array_avx2 <-
    (trace___pabsorb_array_avx2 ++
    [(Assert, ((0 <= tRAILB) /\ (tRAILB < 256)))]);
    trace___pabsorb_array_avx2 <-
    (trace___pabsorb_array_avx2 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    aLL <- (aT + lEN);
    if (((aT + lEN) < rATE8)) {
      param_10 <- pst;
      param_9 <- aT;
      b_param <- b_buf;
      param_8 <- buf;
      param_7 <- offset;
      param_6 <- lEN;
      param_5 <- tRAILB;
      (result_4, b_result_2, result_3, result_2, tmp__trace) <@ __pstate_array_avx2 (
      param_10, (BArray200.init_arr (W8.of_int 255) 200), param_9, param_8,
      b_param, param_7, param_6, param_5);
      trace___pabsorb_array_avx2 <-
      (trace___pabsorb_array_avx2 ++ tmp__trace);
      trace___pabsorb_array_avx2 <-
      (trace___pabsorb_array_avx2 ++
      [(Assert,
       (((0 <= param_6) /\ (param_6 <= 18446744073709551615)) /\
       (((0 <= (param_7 + param_6)) /\
        ((param_7 + param_6) <= 18446744073709551615)) /\
       (((is_init b_result_2 0 200) /\
        (result_3 = ((param_9 + param_6) + ((param_5 <> 0) ? 1 : 0)))) /\
       (result_2 = (param_7 + param_6))))))]);
      trace___pabsorb_array_avx2 <-
      (trace___pabsorb_array_avx2 ++
      [(Assert, ((0 <= result_2) /\ (result_2 <= 18446744073709551615)))]);
      pst <- result_4;
      aT <- result_3;
      offset <- result_2;
      if ((tRAILB <> 0)) {
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert,
         ((0 <= ((aT %/ 8) + 1)) /\
         (((aT %/ 8) + 1) <= 18446744073709551615)))]);
        i <- ((aT %/ 8) + 1);
        if ((aT <= 40)) {
          while ((i < 5)) {
            trace___pabsorb_array_avx2 <-
            (trace___pabsorb_array_avx2 ++
            [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
            pst <- (BArray200.set64 pst i (W64.of_int 0));
            trace___pabsorb_array_avx2 <-
            (trace___pabsorb_array_avx2 ++
            [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
            i <- (i + 1);
          }
          param_2 <- st;
          param_1 <- pst;
          (result_0, b_result_0, tmp__trace) <@ __addpst01_avx2 (
          param_2, (BArray224.init_arr (W8.of_int 255) 224), param_1,
          (BArray200.init_arr (W8.of_int 255) 200));
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++ tmp__trace);
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++
          [(Assert, (is_init b_result_0 0 224))]);
          st <- result_0;
          param_0 <- st;
          param <- rATE8;
          (result, b_result, tmp__trace) <@ __addratebit_avx2 (
          param_0, (BArray224.init_arr (W8.of_int 255) 224), param);
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++ tmp__trace);
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++
          [(Assert, (is_init b_result 0 224))]);
          st <- result;
        } else {
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++
          [(Assert,
           ((0 <= (rATE8 %/ 8)) /\ ((rATE8 %/ 8) <= 18446744073709551615)))]);
          while ((i < (rATE8 %/ 8))) {
            trace___pabsorb_array_avx2 <-
            (trace___pabsorb_array_avx2 ++
            [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
            pst <- (BArray200.set64 pst i (W64.of_int 0));
            trace___pabsorb_array_avx2 <-
            (trace___pabsorb_array_avx2 ++
            [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
            i <- (i + 1);
            trace___pabsorb_array_avx2 <-
            (trace___pabsorb_array_avx2 ++
            [(Assert,
             ((0 <= (rATE8 %/ 8)) /\ ((rATE8 %/ 8) <= 18446744073709551615)))]);
          }
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++
          [(Assert, ((0 <= (rATE8 - 1)) /\ (((rATE8 - 1) + 1) <= 200)))]);
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++
          [(Assert, ((0 <= (rATE8 - 1)) /\ (((rATE8 - 1) + 1) <= 200)))]);
          pst <-
          (BArray200.set8 pst (rATE8 - 1)
          ((BArray200.get8 pst (rATE8 - 1)) `^` (W8.of_int 128)));
          param_4 <- st;
          param_3 <- pst;
          (result_1, b_result_1, tmp__trace) <@ _addpstate_avx2 (
          param_4, (BArray224.init_arr (W8.of_int 255) 224), param_3,
          (BArray200.init_arr (W8.of_int 255) 200));
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++ tmp__trace);
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++
          [(Assert, (is_init b_result_1 0 224))]);
          st <- result_1;
        }
      } else {
        
      }
    } else {
      if ((aT <> 0)) {
        param_38 <- pst;
        param_37 <- aT;
        b_param_3 <- b_buf;
        param_36 <- buf;
        param_35 <- offset;
        param_34 <- (rATE8 - aT);
        param_33 <- 0;
        (result_18, b_result_10, result_17, result_16, tmp__trace) <@ 
        __pstate_array_avx2 (param_38,
        (BArray200.init_arr (W8.of_int 255) 200), param_37, param_36,
        b_param_3, param_35, param_34, param_33);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++ tmp__trace);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert,
         (((0 <= param_34) /\ (param_34 <= 18446744073709551615)) /\
         (((0 <= (param_35 + param_34)) /\
          ((param_35 + param_34) <= 18446744073709551615)) /\
         (((is_init b_result_10 0 200) /\
          (result_17 = ((param_37 + param_34) + ((param_33 <> 0) ? 1 : 0)))) /\
         (result_16 = (param_35 + param_34))))))]);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert, ((0 <= result_16) /\ (result_16 <= 18446744073709551615)))]);
        pst <- result_18;
        offset <- result_16;
        lEN <- (lEN - (rATE8 - aT));
        param_32 <- st;
        param_31 <- pst;
        (result_15, b_result_9, tmp__trace) <@ _addpstate_avx2 (
        param_32, (BArray224.init_arr (W8.of_int 255) 224), param_31,
        (BArray200.init_arr (W8.of_int 255) 200));
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++ tmp__trace);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert, (is_init b_result_9 0 224))]);
        st <- result_15;
        param_30 <- st;
        (result_14, b_result_8, tmp__trace) <@ _keccakf1600_avx2 (
        param_30, (BArray224.init_arr (W8.of_int 255) 224));
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++ tmp__trace);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert, (is_init b_result_8 0 224))]);
        st <- result_14;
        aT <- 0;
      } else {
        
      }
      iTERS <- (lEN %/ rATE8);
      i <- 0;
      trace___pabsorb_array_avx2 <-
      (trace___pabsorb_array_avx2 ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_29 <- st;
        b_param_2 <- b_buf;
        param_28 <- buf;
        param_27 <- offset;
        param_26 <- rATE8;
        param_25 <- 0;
        (result_13, b_result_7, result_12, tmp__trace) <@ __addstate_array_avx2 (
        param_29, (BArray224.init_arr (W8.of_int 255) 224), param_28,
        b_param_2, param_27, param_26, param_25);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++ tmp__trace);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert,
         (((0 <= param_26) /\ (param_26 <= 18446744073709551615)) /\
         (((0 <= (param_27 + param_26)) /\
          ((param_27 + param_26) <= 18446744073709551615)) /\
         ((is_init b_result_7 0 224) /\ (result_12 = (param_27 + param_26))))))]);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert, ((0 <= result_12) /\ (result_12 <= 18446744073709551615)))]);
        st <- result_13;
        offset <- result_12;
        param_24 <- st;
        (result_11, b_result_6, tmp__trace) <@ _keccakf1600_avx2 (
        param_24, (BArray224.init_arr (W8.of_int 255) 224));
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++ tmp__trace);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert, (is_init b_result_6 0 224))]);
        st <- result_11;
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      lEN <- (aLL %% rATE8);
      if ((tRAILB <> 0)) {
        param_17 <- st;
        b_param_0 <- b_buf;
        param_16 <- buf;
        param_15 <- offset;
        param_14 <- lEN;
        param_13 <- tRAILB;
        (result_7, b_result_4, result_6, tmp__trace) <@ __addstate_array_avx2 (
        param_17, (BArray224.init_arr (W8.of_int 255) 224), param_16,
        b_param_0, param_15, param_14, param_13);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++ tmp__trace);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert,
         (((0 <= param_14) /\ (param_14 <= 18446744073709551615)) /\
         (((0 <= (param_15 + param_14)) /\
          ((param_15 + param_14) <= 18446744073709551615)) /\
         ((is_init b_result_4 0 224) /\ (result_6 = (param_15 + param_14))))))]);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert, ((0 <= result_6) /\ (result_6 <= 18446744073709551615)))]);
        st <- result_7;
        offset <- result_6;
        param_12 <- st;
        param_11 <- rATE8;
        (result_5, b_result_3, tmp__trace) <@ __addratebit_avx2 (
        param_12, (BArray224.init_arr (W8.of_int 255) 224), param_11);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++ tmp__trace);
        trace___pabsorb_array_avx2 <-
        (trace___pabsorb_array_avx2 ++
        [(Assert, (is_init b_result_3 0 224))]);
        st <- result_5;
      } else {
        if ((lEN <> 0)) {
          param_23 <- pst;
          param_22 <- 0;
          b_param_1 <- b_buf;
          param_21 <- buf;
          param_20 <- offset;
          param_19 <- lEN;
          param_18 <- tRAILB;
          (result_10, b_result_5, result_9, result_8, tmp__trace) <@ 
          __pstate_array_avx2 (param_23,
          (BArray200.init_arr (W8.of_int 255) 200), param_22, param_21,
          b_param_1, param_20, param_19, param_18);
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++ tmp__trace);
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++
          [(Assert,
           (((0 <= param_19) /\ (param_19 <= 18446744073709551615)) /\
           (((0 <= (param_20 + param_19)) /\
            ((param_20 + param_19) <= 18446744073709551615)) /\
           (((is_init b_result_5 0 200) /\
            (result_9 = ((param_22 + param_19) + ((param_18 <> 0) ? 1 : 0)))) /\
           (result_8 = (param_20 + param_19))))))]);
          trace___pabsorb_array_avx2 <-
          (trace___pabsorb_array_avx2 ++
          [(Assert, ((0 <= result_8) /\ (result_8 <= 18446744073709551615)))]);
          pst <- result_10;
          aT <- result_9;
          offset <- result_8;
        } else {
          
        }
      }
    }
    b_pst <- (BArray200.init_arr (W8.of_int 255) 200);
    b_st <- (BArray224.init_arr (W8.of_int 255) 224);
    return (pst, b_pst, aT, st, b_st, offset,
           trace___pabsorb_array_avx2);
  }
  proc __dumpstate_array_avx2 (buf:BArrayS.t, b_buf:BArrayS.t,
                                        offset:int, lEN:int, st:BArray224.t,
                                        b_st:BArray224.t) : BArrayS.t *
                                                            BArrayS.t *
                                                            int * trace = {
    var dELTA:int;
    var t128_0:W128.t;
    var t128_1:W128.t;
    var t:W64.t;
    var t256_0:W256.t;
    var t256_1:W256.t;
    var t256_2:W256.t;
    var t256_3:W256.t;
    var t256_4:W256.t;
    var param:W256.t;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result:int;
    var result_0:int;
    var result_1:BArrayS.t;
    var param_4:W64.t;
    var param_5:int;
    var param_6:int;
    var param_7:int;
    var param_8:BArrayS.t;
    var result_2:int;
    var result_3:int;
    var result_4:BArrayS.t;
    var param_9:W256.t;
    var param_10:int;
    var param_11:int;
    var param_12:int;
    var param_13:BArrayS.t;
    var result_5:int;
    var result_6:int;
    var result_7:BArrayS.t;
    var param_14:W64.t;
    var param_15:int;
    var param_16:int;
    var param_17:int;
    var param_18:BArrayS.t;
    var result_8:int;
    var result_9:int;
    var result_10:BArrayS.t;
    var param_19:W256.t;
    var param_20:int;
    var param_21:int;
    var param_22:int;
    var param_23:BArrayS.t;
    var result_11:int;
    var result_12:int;
    var result_13:BArrayS.t;
    var param_24:W64.t;
    var param_25:int;
    var param_26:int;
    var param_27:int;
    var param_28:BArrayS.t;
    var result_14:int;
    var result_15:int;
    var result_16:BArrayS.t;
    var param_29:W256.t;
    var param_30:int;
    var param_31:int;
    var param_32:int;
    var param_33:BArrayS.t;
    var result_17:int;
    var result_18:int;
    var result_19:BArrayS.t;
    var param_34:W64.t;
    var param_35:int;
    var param_36:int;
    var param_37:int;
    var param_38:BArrayS.t;
    var result_20:int;
    var result_21:int;
    var result_22:BArrayS.t;
    var param_39:W256.t;
    var param_40:int;
    var param_41:int;
    var param_42:int;
    var param_43:BArrayS.t;
    var result_23:int;
    var result_24:int;
    var result_25:BArrayS.t;
    var param_44:W256.t;
    var param_45:int;
    var param_46:int;
    var param_47:int;
    var param_48:BArrayS.t;
    var result_26:int;
    var result_27:int;
    var result_28:BArrayS.t;
    var param_49:W256.t;
    var param_50:int;
    var param_51:int;
    var param_52:int;
    var param_53:BArrayS.t;
    var result_29:int;
    var result_30:int;
    var result_31:BArrayS.t;
    var b_result:BArrayS.t;
    var b_param:BArrayS.t;
    var b_result_0:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_result_1:BArrayS.t;
    var b_param_1:BArrayS.t;
    var b_result_2:BArrayS.t;
    var b_param_2:BArrayS.t;
    var b_result_3:BArrayS.t;
    var b_param_3:BArrayS.t;
    var b_result_4:BArrayS.t;
    var b_param_4:BArrayS.t;
    var b_result_5:BArrayS.t;
    var b_param_5:BArrayS.t;
    var b_result_6:BArrayS.t;
    var b_param_6:BArrayS.t;
    var b_result_7:BArrayS.t;
    var b_param_7:BArrayS.t;
    var b_result_8:BArrayS.t;
    var b_param_8:BArrayS.t;
    var b_result_9:BArrayS.t;
    var b_param_9:BArrayS.t;
    var trace___dumpstate_array_avx2:trace;
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
    b_result_4 <- witness;
    b_result_5 <- witness;
    b_result_6 <- witness;
    b_result_7 <- witness;
    b_result_8 <- witness;
    b_result_9 <- witness;
    param_3 <- witness;
    param_8 <- witness;
    param_13 <- witness;
    param_18 <- witness;
    param_23 <- witness;
    param_28 <- witness;
    param_33 <- witness;
    param_38 <- witness;
    param_43 <- witness;
    param_48 <- witness;
    param_53 <- witness;
    result_1 <- witness;
    result_4 <- witness;
    result_7 <- witness;
    result_10 <- witness;
    result_13 <- witness;
    result_16 <- witness;
    result_19 <- witness;
    result_22 <- witness;
    result_25 <- witness;
    result_28 <- witness;
    result_31 <- witness;
    trace___dumpstate_array_avx2 <- [];
    trace___dumpstate_array_avx2 <-
    (trace___dumpstate_array_avx2 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     (((((0 <= offset) /\ (0 <= lEN)) /\ ((offset + lEN) <= size)) /\
      (is_init b_st 0 224)) /\
     (lEN <= 200)))))]);
    trace___dumpstate_array_avx2 <-
    (trace___dumpstate_array_avx2 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    if ((8 <= lEN)) {
      b_param_8 <- b_buf;
      param_48 <- buf;
      param_47 <- offset;
      param_46 <- dELTA;
      param_45 <- 8;
      param_44 <- (BArray224.get256 st 0);
      (result_28, b_result_8, result_27, result_26, tmp__trace) <@ __awrite_subu256 (
      param_48, b_param_8, param_47, param_46, param_45, param_44);
      trace___dumpstate_array_avx2 <-
      (trace___dumpstate_array_avx2 ++ tmp__trace);
      trace___dumpstate_array_avx2 <-
      (trace___dumpstate_array_avx2 ++
      [(Assert,
       ((result_27 =
        (param_46 +
        ((((param_45 < 32) ? param_45 : 32) < 0) ? 0 : ((param_45 < 32) ? 
                                                       param_45 : 32)))) /\
       (result_26 =
       (param_45 -
       ((((param_45 < 32) ? param_45 : 32) < 0) ? 0 : ((param_45 < 32) ? 
                                                      param_45 : 32))))))]);
      b_buf <- b_result_8;
      buf <- result_28;
      dELTA <- result_27;
      lEN <- (lEN - 8);
    } else {
      b_param_9 <- b_buf;
      param_53 <- buf;
      param_52 <- offset;
      param_51 <- dELTA;
      param_50 <- lEN;
      param_49 <- (BArray224.get256 st 0);
      (result_31, b_result_9, result_30, result_29, tmp__trace) <@ __awrite_subu256 (
      param_53, b_param_9, param_52, param_51, param_50, param_49);
      trace___dumpstate_array_avx2 <-
      (trace___dumpstate_array_avx2 ++ tmp__trace);
      trace___dumpstate_array_avx2 <-
      (trace___dumpstate_array_avx2 ++
      [(Assert,
       ((result_30 =
        (param_51 +
        ((((param_50 < 32) ? param_50 : 32) < 0) ? 0 : ((param_50 < 32) ? 
                                                       param_50 : 32)))) /\
       (result_29 =
       (param_50 -
       ((((param_50 < 32) ? param_50 : 32) < 0) ? 0 : ((param_50 < 32) ? 
                                                      param_50 : 32))))))]);
      b_buf <- b_result_9;
      buf <- result_31;
      dELTA <- result_30;
      lEN <- result_29;
    }
    b_param_7 <- b_buf;
    param_43 <- buf;
    param_42 <- offset;
    param_41 <- dELTA;
    param_40 <- lEN;
    param_39 <- (BArray224.get256 st 1);
    (result_25, b_result_7, result_24, result_23, tmp__trace) <@ __awrite_subu256 (
    param_43, b_param_7, param_42, param_41, param_40, param_39);
    trace___dumpstate_array_avx2 <-
    (trace___dumpstate_array_avx2 ++ tmp__trace);
    trace___dumpstate_array_avx2 <-
    (trace___dumpstate_array_avx2 ++
    [(Assert,
     ((result_24 =
      (param_41 +
      ((((param_40 < 32) ? param_40 : 32) < 0) ? 0 : ((param_40 < 32) ? 
                                                     param_40 : 32)))) /\
     (result_23 =
     (param_40 -
     ((((param_40 < 32) ? param_40 : 32) < 0) ? 0 : ((param_40 < 32) ? 
                                                    param_40 : 32))))))]);
    b_buf <- b_result_7;
    buf <- result_25;
    dELTA <- result_24;
    lEN <- result_23;
    if ((0 < lEN)) {
      t128_0 <- (truncateu128 (BArray224.get256 st 2));
      t128_1 <- (VEXTRACTI128 (BArray224.get256 st 2) (W8.of_int 1));
      t <- (truncateu64 t128_1);
      b_param_6 <- b_buf;
      param_38 <- buf;
      param_37 <- offset;
      param_36 <- dELTA;
      param_35 <- lEN;
      param_34 <- t;
      (result_22, b_result_6, result_21, result_20, tmp__trace) <@ __awrite_subu64 (
      param_38, b_param_6, param_37, param_36, param_35, param_34);
      trace___dumpstate_array_avx2 <-
      (trace___dumpstate_array_avx2 ++ tmp__trace);
      trace___dumpstate_array_avx2 <-
      (trace___dumpstate_array_avx2 ++
      [(Assert,
       ((result_21 =
        (param_36 +
        ((((param_35 < 8) ? param_35 : 8) < 0) ? 0 : ((param_35 < 8) ? 
                                                     param_35 : 8)))) /\
       (result_20 =
       (param_35 -
       ((((param_35 < 8) ? param_35 : 8) < 0) ? 0 : ((param_35 < 8) ? 
                                                    param_35 : 8))))))]);
      b_buf <- b_result_6;
      buf <- result_22;
      dELTA <- result_21;
      lEN <- result_20;
      t128_1 <- (VPUNPCKH_2u64 t128_1 t128_1);
      if ((0 < lEN)) {
        t256_0 <-
        (VPBLEND_8u32 (BArray224.get256 st 3) (BArray224.get256 st 4)
        (W8.of_int 240));
        t256_1 <-
        (VPBLEND_8u32 (BArray224.get256 st 4) (BArray224.get256 st 3)
        (W8.of_int 240));
        t256_2 <-
        (VPBLEND_8u32 (BArray224.get256 st 5) (BArray224.get256 st 6)
        (W8.of_int 240));
        t256_3 <-
        (VPBLEND_8u32 (BArray224.get256 st 6) (BArray224.get256 st 5)
        (W8.of_int 240));
        t256_4 <- (VPBLEND_8u32 t256_0 t256_3 (W8.of_int 195));
        b_param_5 <- b_buf;
        param_33 <- buf;
        param_32 <- offset;
        param_31 <- dELTA;
        param_30 <- lEN;
        param_29 <- t256_4;
        (result_19, b_result_5, result_18, result_17, tmp__trace) <@ 
        __awrite_subu256 (param_33, b_param_5, param_32, param_31,
        param_30, param_29);
        trace___dumpstate_array_avx2 <-
        (trace___dumpstate_array_avx2 ++ tmp__trace);
        trace___dumpstate_array_avx2 <-
        (trace___dumpstate_array_avx2 ++
        [(Assert,
         ((result_18 =
          (param_31 +
          ((((param_30 < 32) ? param_30 : 32) < 0) ? 0 : ((param_30 < 32) ? 
                                                         param_30 : 32)))) /\
         (result_17 =
         (param_30 -
         ((((param_30 < 32) ? param_30 : 32) < 0) ? 0 : ((param_30 < 32) ? 
                                                        param_30 : 32))))))]);
        b_buf <- b_result_5;
        buf <- result_19;
        dELTA <- result_18;
        lEN <- result_17;
        if ((0 < lEN)) {
          t <- (truncateu64 t128_0);
          b_param_4 <- b_buf;
          param_28 <- buf;
          param_27 <- offset;
          param_26 <- dELTA;
          param_25 <- lEN;
          param_24 <- t;
          (result_16, b_result_4, result_15, result_14, tmp__trace) <@ 
          __awrite_subu64 (param_28, b_param_4, param_27, param_26,
          param_25, param_24);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++ tmp__trace);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++
          [(Assert,
           ((result_15 =
            (param_26 +
            ((((param_25 < 8) ? param_25 : 8) < 0) ? 0 : ((param_25 < 8) ? 
                                                         param_25 : 8)))) /\
           (result_14 =
           (param_25 -
           ((((param_25 < 8) ? param_25 : 8) < 0) ? 0 : ((param_25 < 8) ? 
                                                        param_25 : 8))))))]);
          b_buf <- b_result_4;
          buf <- result_16;
          dELTA <- result_15;
          lEN <- result_14;
          t128_0 <- (VPUNPCKH_2u64 t128_0 t128_0);
        } else {
          
        }
        if ((0 < lEN)) {
          t256_4 <- (VPBLEND_8u32 t256_3 t256_1 (W8.of_int 195));
          b_param_3 <- b_buf;
          param_23 <- buf;
          param_22 <- offset;
          param_21 <- dELTA;
          param_20 <- lEN;
          param_19 <- t256_4;
          (result_13, b_result_3, result_12, result_11, tmp__trace) <@ 
          __awrite_subu256 (param_23, b_param_3, param_22, param_21,
          param_20, param_19);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++ tmp__trace);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++
          [(Assert,
           ((result_12 =
            (param_21 +
            ((((param_20 < 32) ? param_20 : 32) < 0) ? 0 : ((param_20 < 32) ? 
                                                           param_20 : 32)))) /\
           (result_11 =
           (param_20 -
           ((((param_20 < 32) ? param_20 : 32) < 0) ? 0 : ((param_20 < 32) ? 
                                                          param_20 : 32))))))]);
          b_buf <- b_result_3;
          buf <- result_13;
          dELTA <- result_12;
          lEN <- result_11;
        } else {
          
        }
        if ((0 < lEN)) {
          t <- (truncateu64 t128_1);
          b_param_2 <- b_buf;
          param_18 <- buf;
          param_17 <- offset;
          param_16 <- dELTA;
          param_15 <- lEN;
          param_14 <- t;
          (result_10, b_result_2, result_9, result_8, tmp__trace) <@ 
          __awrite_subu64 (param_18, b_param_2, param_17, param_16,
          param_15, param_14);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++ tmp__trace);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++
          [(Assert,
           ((result_9 =
            (param_16 +
            ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                         param_15 : 8)))) /\
           (result_8 =
           (param_15 -
           ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                        param_15 : 8))))))]);
          b_buf <- b_result_2;
          buf <- result_10;
          dELTA <- result_9;
          lEN <- result_8;
        } else {
          
        }
        if ((0 < lEN)) {
          t256_4 <- (VPBLEND_8u32 t256_2 t256_0 (W8.of_int 195));
          b_param_1 <- b_buf;
          param_13 <- buf;
          param_12 <- offset;
          param_11 <- dELTA;
          param_10 <- lEN;
          param_9 <- t256_4;
          (result_7, b_result_1, result_6, result_5, tmp__trace) <@ __awrite_subu256 (
          param_13, b_param_1, param_12, param_11, param_10, param_9);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++ tmp__trace);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++
          [(Assert,
           ((result_6 =
            (param_11 +
            ((((param_10 < 32) ? param_10 : 32) < 0) ? 0 : ((param_10 < 32) ? 
                                                           param_10 : 32)))) /\
           (result_5 =
           (param_10 -
           ((((param_10 < 32) ? param_10 : 32) < 0) ? 0 : ((param_10 < 32) ? 
                                                          param_10 : 32))))))]);
          b_buf <- b_result_1;
          buf <- result_7;
          dELTA <- result_6;
          lEN <- result_5;
        } else {
          
        }
        if ((0 < lEN)) {
          t <- (truncateu64 t128_0);
          b_param_0 <- b_buf;
          param_8 <- buf;
          param_7 <- offset;
          param_6 <- dELTA;
          param_5 <- lEN;
          param_4 <- t;
          (result_4, b_result_0, result_3, result_2, tmp__trace) <@ __awrite_subu64 (
          param_8, b_param_0, param_7, param_6, param_5, param_4);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++ tmp__trace);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++
          [(Assert,
           ((result_3 =
            (param_6 +
            ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? 
                                                       param_5 : 8)))) /\
           (result_2 =
           (param_5 -
           ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? 
                                                      param_5 : 8))))))]);
          b_buf <- b_result_0;
          buf <- result_4;
          dELTA <- result_3;
          lEN <- result_2;
        } else {
          
        }
        if ((0 < lEN)) {
          t256_4 <- (VPBLEND_8u32 t256_1 t256_2 (W8.of_int 195));
          b_param <- b_buf;
          param_3 <- buf;
          param_2 <- offset;
          param_1 <- dELTA;
          param_0 <- lEN;
          param <- t256_4;
          (result_1, b_result, result_0, result, tmp__trace) <@ __awrite_subu256 (
          param_3, b_param, param_2, param_1, param_0, param);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++ tmp__trace);
          trace___dumpstate_array_avx2 <-
          (trace___dumpstate_array_avx2 ++
          [(Assert,
           ((result_0 =
            (param_1 +
            ((((param_0 < 32) ? param_0 : 32) < 0) ? 0 : ((param_0 < 32) ? 
                                                         param_0 : 32)))) /\
           (result =
           (param_0 -
           ((((param_0 < 32) ? param_0 : 32) < 0) ? 0 : ((param_0 < 32) ? 
                                                        param_0 : 32))))))]);
          b_buf <- b_result;
          buf <- result_1;
          dELTA <- result_0;
        } else {
          
        }
      } else {
        
      }
    } else {
      
    }
    trace___dumpstate_array_avx2 <-
    (trace___dumpstate_array_avx2 ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace___dumpstate_array_avx2 <-
    (trace___dumpstate_array_avx2 ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    return (buf, b_buf, offset, trace___dumpstate_array_avx2);
  }
  proc __squeeze_array_avx2 (buf:BArrayS.t, b_buf:BArrayS.t,
                                      offset:int, lEN:int, st:BArray224.t,
                                      b_st:BArray224.t, rATE8:int) : 
  BArrayS.t * BArrayS.t * BArray224.t * BArray224.t * trace = {
    var iTERS:int;
    var lO:int;
    var i:int;
    var param:BArray224.t;
    var param_0:int;
    var param_1:int;
    var param_2:BArrayS.t;
    var result:int;
    var result_0:BArrayS.t;
    var param_3:BArray224.t;
    var result_1:BArray224.t;
    var param_4:BArray224.t;
    var param_5:int;
    var param_6:int;
    var param_7:BArrayS.t;
    var result_2:int;
    var result_3:BArrayS.t;
    var param_8:BArray224.t;
    var result_4:BArray224.t;
    var b_result:BArrayS.t;
    var b_param:BArrayS.t;
    var b_result_0:BArray224.t;
    var b_result_1:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_result_2:BArray224.t;
    var trace___squeeze_array_avx2:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    param <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_7 <- witness;
    param_8 <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_3 <- witness;
    result_4 <- witness;
    trace___squeeze_array_avx2 <- [];
    trace___squeeze_array_avx2 <-
    (trace___squeeze_array_avx2 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     ((((((0 <= offset) /\ (0 <= lEN)) /\ (0 < rATE8)) /\ (rATE8 < 200)) /\
      ((offset + lEN) <= size)) /\
     (is_init b_st 0 224)))))]);
    trace___squeeze_array_avx2 <-
    (trace___squeeze_array_avx2 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    iTERS <- (lEN %/ rATE8);
    lO <- (lEN %% rATE8);
    if ((0 < lEN)) {
      if ((0 < iTERS)) {
        i <- 0;
        trace___squeeze_array_avx2 <-
        (trace___squeeze_array_avx2 ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
        while ((i < iTERS)) {
          param_8 <- st;
          (result_4, b_result_2, tmp__trace) <@ _keccakf1600_avx2 (
          param_8, (BArray224.init_arr (W8.of_int 255) 224));
          trace___squeeze_array_avx2 <-
          (trace___squeeze_array_avx2 ++ tmp__trace);
          trace___squeeze_array_avx2 <-
          (trace___squeeze_array_avx2 ++
          [(Assert, (is_init b_result_2 0 224))]);
          st <- result_4;
          b_param_0 <- b_buf;
          param_7 <- buf;
          param_6 <- offset;
          param_5 <- rATE8;
          param_4 <- st;
          (result_3, b_result_1, result_2, tmp__trace) <@ __dumpstate_array_avx2 (
          param_7, b_param_0, param_6, param_5, param_4,
          (BArray224.init_arr (W8.of_int 255) 224));
          trace___squeeze_array_avx2 <-
          (trace___squeeze_array_avx2 ++ tmp__trace);
          trace___squeeze_array_avx2 <-
          (trace___squeeze_array_avx2 ++
          [(Assert,
           (((0 <= param_5) /\ (param_5 <= 18446744073709551615)) /\
           (((0 <= (param_6 + param_5)) /\
            ((param_6 + param_5) <= 18446744073709551615)) /\
           (result_2 = (param_6 + param_5)))))]);
          trace___squeeze_array_avx2 <-
          (trace___squeeze_array_avx2 ++
          [(Assert, ((0 <= result_2) /\ (result_2 <= 18446744073709551615)))]);
          b_buf <- b_result_1;
          buf <- result_3;
          offset <- result_2;
          trace___squeeze_array_avx2 <-
          (trace___squeeze_array_avx2 ++
          [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
          i <- (i + 1);
          trace___squeeze_array_avx2 <-
          (trace___squeeze_array_avx2 ++
          [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
        }
      } else {
        
      }
      if ((0 < lO)) {
        param_3 <- st;
        (result_1, b_result_0, tmp__trace) <@ _keccakf1600_avx2 (
        param_3, (BArray224.init_arr (W8.of_int 255) 224));
        trace___squeeze_array_avx2 <-
        (trace___squeeze_array_avx2 ++ tmp__trace);
        trace___squeeze_array_avx2 <-
        (trace___squeeze_array_avx2 ++
        [(Assert, (is_init b_result_0 0 224))]);
        st <- result_1;
        b_param <- b_buf;
        param_2 <- buf;
        param_1 <- offset;
        param_0 <- lO;
        param <- st;
        (result_0, b_result, result, tmp__trace) <@ __dumpstate_array_avx2 (
        param_2, b_param, param_1, param_0, param,
        (BArray224.init_arr (W8.of_int 255) 224));
        trace___squeeze_array_avx2 <-
        (trace___squeeze_array_avx2 ++ tmp__trace);
        trace___squeeze_array_avx2 <-
        (trace___squeeze_array_avx2 ++
        [(Assert,
         (((0 <= param_0) /\ (param_0 <= 18446744073709551615)) /\
         (((0 <= (param_1 + param_0)) /\
          ((param_1 + param_0) <= 18446744073709551615)) /\
         (result = (param_1 + param_0)))))]);
        trace___squeeze_array_avx2 <-
        (trace___squeeze_array_avx2 ++
        [(Assert, ((0 <= result) /\ (result <= 18446744073709551615)))]);
        b_buf <- b_result;
        buf <- result_0;
      } else {
        
      }
    } else {
      
    }
    b_st <- (BArray224.init_arr (W8.of_int 255) 224);
    return (buf, b_buf, st, b_st, trace___squeeze_array_avx2);
  }
  proc __addstate_bcast_array_avx2x4 (st:BArray800.t,
                                               b_st:BArray800.t, aT:int,
                                               buf:BArrayS.t,
                                               b_buf:BArrayS.t, offset:int,
                                               lEN:int, tRAILB:int) : 
  BArray800.t * BArray800.t * int * int * trace = {
    var aLL:int;
    var lO:int;
    var dELTA:int;
    var t256:W256.t;
    var at:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result:W256.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var param_4:int;
    var param_5:int;
    var param_6:int;
    var param_7:int;
    var param_8:BArrayS.t;
    var result_3:W256.t;
    var result_4:int;
    var result_5:int;
    var result_6:int;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:int;
    var param_13:BArrayS.t;
    var result_7:W256.t;
    var result_8:int;
    var result_9:int;
    var result_10:int;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_param_1:BArrayS.t;
    var trace___addstate_bcast_array_avx2x4:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    param_3 <- witness;
    param_8 <- witness;
    param_13 <- witness;
    trace___addstate_bcast_array_avx2x4 <- [];
    trace___addstate_bcast_array_avx2x4 <-
    (trace___addstate_bcast_array_avx2x4 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     ((((((((0 <= offset) /\ (0 <= lEN)) /\ (0 <= aT)) /\ (aT < 200)) /\
        ((offset + lEN) <= size)) /\
       (((aT + lEN) + ((tRAILB <> 0) ? 1 : 0)) < 200)) /\
      (is_init b_buf offset lEN)) /\
     (is_init b_st 0 800)))))]);
    trace___addstate_bcast_array_avx2x4 <-
    (trace___addstate_bcast_array_avx2x4 ++
    [(Assert, ((0 <= tRAILB) /\ (tRAILB < 256)))]);
    trace___addstate_bcast_array_avx2x4 <-
    (trace___addstate_bcast_array_avx2x4 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    aLL <- (aT + lEN);
    lO <- (aT %% 8);
    trace___addstate_bcast_array_avx2x4 <-
    (trace___addstate_bcast_array_avx2x4 ++
    [(Assert,
     ((0 <= (32 * (aT %/ 8))) /\ ((32 * (aT %/ 8)) <= 18446744073709551615)))]);
    at <- (32 * (aT %/ 8));
    dELTA <- 0;
    if ((0 < lO)) {
      if (((lO + lEN) < 8)) {
        if ((tRAILB <> 0)) {
          aLL <- (aLL + 1);
        } else {
          
        }
        b_param_0 <- b_buf;
        param_8 <- buf;
        param_7 <- offset;
        param_6 <- dELTA;
        param_5 <- lEN;
        param_4 <- tRAILB;
        (result_6, result_5, result_4, result_3, tmp__trace) <@ __aread_bcast_4subu64 (
        param_8, b_param_0, param_7, param_6, param_5, param_4);
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++ tmp__trace);
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert,
         (((result_6 =
           (param_6 +
           ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? 
                                                      param_5 : 8)))) /\
          (result_5 =
          (param_5 -
          ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? 
                                                     param_5 : 8))))) /\
         (result_4 = ((8 <= param_5) ? param_4 : 0))))]);
        dELTA <- result_6;
        tRAILB <- result_4;
        t256 <- result_3;
        t256 <- (VPSLL_4u64 t256 (W128.of_int (8 * lO)));
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
        t256 <- (t256 `^` (BArray800.get256d st at));
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
        st <- (BArray800.set256d st at t256);
        aT <- 0;
        lEN <- 0;
      } else {
        if ((8 <= lEN)) {
          trace___addstate_bcast_array_avx2x4 <-
          (trace___addstate_bcast_array_avx2x4 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___addstate_bcast_array_avx2x4 <-
          (trace___addstate_bcast_array_avx2x4 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___addstate_bcast_array_avx2x4 <-
          (trace___addstate_bcast_array_avx2x4 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
          trace___addstate_bcast_array_avx2x4 <-
          (trace___addstate_bcast_array_avx2x4 ++
          [(Assert, (is_init b_buf (offset + dELTA) 8))]);
          t256 <- (VPBROADCAST_4u64 (BArrayS.get64d buf (offset + dELTA)));
          dELTA <- (dELTA + (8 - lO));
        } else {
          b_param_1 <- b_buf;
          param_13 <- buf;
          param_12 <- offset;
          param_11 <- dELTA;
          param_10 <- (8 - lO);
          param_9 <- 0;
          (result_10, result_9, result_8, result_7, tmp__trace) <@ __aread_bcast_4subu64 (
          param_13, b_param_1, param_12, param_11, param_10, param_9);
          trace___addstate_bcast_array_avx2x4 <-
          (trace___addstate_bcast_array_avx2x4 ++ tmp__trace);
          trace___addstate_bcast_array_avx2x4 <-
          (trace___addstate_bcast_array_avx2x4 ++
          [(Assert,
           (((result_10 =
             (param_11 +
             ((((param_10 < 8) ? param_10 : 8) < 0) ? 0 : ((param_10 < 8) ? 
                                                          param_10 : 8)))) /\
            (result_9 =
            (param_10 -
            ((((param_10 < 8) ? param_10 : 8) < 0) ? 0 : ((param_10 < 8) ? 
                                                         param_10 : 8))))) /\
           (result_8 = ((8 <= param_10) ? param_9 : 0))))]);
          dELTA <- result_10;
          t256 <- result_7;
        }
        lEN <- (lEN - (8 - lO));
        aT <- (aT + (8 - lO));
        t256 <- (VPSLL_4u64 t256 (W128.of_int (8 * lO)));
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
        t256 <- (t256 `^` (BArray800.get256d st at));
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
        st <- (BArray800.set256d st at t256);
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert, ((0 <= (at + 32)) /\ ((at + 32) <= 18446744073709551615)))]);
        at <- (at + 32);
      }
      trace___addstate_bcast_array_avx2x4 <-
      (trace___addstate_bcast_array_avx2x4 ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace___addstate_bcast_array_avx2x4 <-
      (trace___addstate_bcast_array_avx2x4 ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
      dELTA <- 0;
    } else {
      
    }
    if ((8 <= lEN)) {
      trace___addstate_bcast_array_avx2x4 <-
      (trace___addstate_bcast_array_avx2x4 ++
      [(Assert,
       ((0 <= ((32 * (aT %/ 8)) + (32 * (lEN %/ 8)))) /\
       (((32 * (aT %/ 8)) + (32 * (lEN %/ 8))) <= 18446744073709551615)))]);
      while ((at < ((32 * (aT %/ 8)) + (32 * (lEN %/ 8))))) {
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert, (is_init b_buf offset 8))]);
        t256 <- (VPBROADCAST_4u64 (BArrayS.get64d buf offset));
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert,
         ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
        offset <- (offset + 8);
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
        t256 <- (t256 `^` (BArray800.get256d st at));
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
        st <- (BArray800.set256d st at t256);
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert, ((0 <= (at + 32)) /\ ((at + 32) <= 18446744073709551615)))]);
        at <- (at + 32);
        trace___addstate_bcast_array_avx2x4 <-
        (trace___addstate_bcast_array_avx2x4 ++
        [(Assert,
         ((0 <= ((32 * (aT %/ 8)) + (32 * (lEN %/ 8)))) /\
         (((32 * (aT %/ 8)) + (32 * (lEN %/ 8))) <= 18446744073709551615)))]);
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
      b_param <- b_buf;
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- dELTA;
      param_0 <- lO;
      param <- tRAILB;
      (result_2, result_1, result_0, result, tmp__trace) <@ __aread_bcast_4subu64 (
      param_3, b_param, param_2, param_1, param_0, param);
      trace___addstate_bcast_array_avx2x4 <-
      (trace___addstate_bcast_array_avx2x4 ++ tmp__trace);
      trace___addstate_bcast_array_avx2x4 <-
      (trace___addstate_bcast_array_avx2x4 ++
      [(Assert,
       (((result_2 =
         (param_1 +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))) /\
        (result_1 =
        (param_0 -
        ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8))))) /\
       (result_0 = ((8 <= param_0) ? param : 0))))]);
      dELTA <- result_2;
      t256 <- result;
      trace___addstate_bcast_array_avx2x4 <-
      (trace___addstate_bcast_array_avx2x4 ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace___addstate_bcast_array_avx2x4 <-
      (trace___addstate_bcast_array_avx2x4 ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
      trace___addstate_bcast_array_avx2x4 <-
      (trace___addstate_bcast_array_avx2x4 ++
      [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
      t256 <- (t256 `^` (BArray800.get256d st at));
      trace___addstate_bcast_array_avx2x4 <-
      (trace___addstate_bcast_array_avx2x4 ++
      [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
      st <- (BArray800.set256d st at t256);
    } else {
      
    }
    b_st <- (BArray800.init_arr (W8.of_int 255) 800);
    return (st, b_st, aLL, offset,
           trace___addstate_bcast_array_avx2x4);
  }
  proc __absorb_bcast_array_avx2x4 (st:BArray800.t,
                                             b_st:BArray800.t, aT:int,
                                             buf:BArrayS.t,
                                             b_buf:BArrayS.t, offset:int,
                                             lEN:int, rATE8:int, tRAILB:int) : 
  BArray800.t * BArray800.t * int * int * trace = {
    var aLL:int;
    var iTERS:int;
    var i:int;
    var param:int;
    var param_0:BArray800.t;
    var result:BArray800.t;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:BArrayS.t;
    var param_5:int;
    var param_6:BArray800.t;
    var result_0:int;
    var result_1:int;
    var result_2:BArray800.t;
    var param_7:int;
    var param_8:BArray800.t;
    var result_3:BArray800.t;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:BArrayS.t;
    var param_13:int;
    var param_14:BArray800.t;
    var result_4:int;
    var result_5:int;
    var result_6:BArray800.t;
    var param_15:BArray800.t;
    var result_7:BArray800.t;
    var param_16:int;
    var param_17:int;
    var param_18:int;
    var param_19:BArrayS.t;
    var param_20:int;
    var param_21:BArray800.t;
    var result_8:int;
    var result_9:int;
    var result_10:BArray800.t;
    var param_22:BArray800.t;
    var result_11:BArray800.t;
    var param_23:int;
    var param_24:int;
    var param_25:int;
    var param_26:BArrayS.t;
    var param_27:int;
    var param_28:BArray800.t;
    var result_12:int;
    var result_13:int;
    var result_14:BArray800.t;
    var b_result:BArray800.t;
    var b_result_0:BArray800.t;
    var b_param:BArrayS.t;
    var b_result_1:BArray800.t;
    var b_result_2:BArray800.t;
    var b_param_0:BArrayS.t;
    var b_result_3:BArray800.t;
    var b_result_4:BArray800.t;
    var b_param_1:BArrayS.t;
    var b_result_5:BArray800.t;
    var b_result_6:BArray800.t;
    var b_param_2:BArrayS.t;
    var trace___absorb_bcast_array_avx2x4:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    b_result_5 <- witness;
    b_result_6 <- witness;
    param_0 <- witness;
    param_4 <- witness;
    param_6 <- witness;
    param_8 <- witness;
    param_12 <- witness;
    param_14 <- witness;
    param_15 <- witness;
    param_19 <- witness;
    param_21 <- witness;
    param_22 <- witness;
    param_26 <- witness;
    param_28 <- witness;
    result <- witness;
    result_2 <- witness;
    result_3 <- witness;
    result_6 <- witness;
    result_7 <- witness;
    result_10 <- witness;
    result_11 <- witness;
    result_14 <- witness;
    trace___absorb_bcast_array_avx2x4 <- [];
    trace___absorb_bcast_array_avx2x4 <-
    (trace___absorb_bcast_array_avx2x4 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     ((((((((((0 <= offset) /\ (0 <= lEN)) /\ (0 <= aT)) /\ (aT < rATE8)) /\
          ((offset + lEN) <= size)) /\
         (((aT + lEN) + ((tRAILB <> 0) ? 1 : 0)) < 200)) /\
        (0 < rATE8)) /\
       (rATE8 < 200)) /\
      (is_init b_buf offset lEN)) /\
     (is_init b_st 0 800)))))]);
    trace___absorb_bcast_array_avx2x4 <-
    (trace___absorb_bcast_array_avx2x4 ++
    [(Assert, ((0 <= tRAILB) /\ (tRAILB < 256)))]);
    trace___absorb_bcast_array_avx2x4 <-
    (trace___absorb_bcast_array_avx2x4 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    aLL <- (aT + lEN);
    if (((aT + lEN) < rATE8)) {
      param_6 <- st;
      param_5 <- aT;
      b_param <- b_buf;
      param_4 <- buf;
      param_3 <- offset;
      param_2 <- lEN;
      param_1 <- tRAILB;
      (result_2, b_result_0, result_1, result_0, tmp__trace) <@ __addstate_bcast_array_avx2x4 (
      param_6, (BArray800.init_arr (W8.of_int 255) 800), param_5, param_4,
      b_param, param_3, param_2, param_1);
      trace___absorb_bcast_array_avx2x4 <-
      (trace___absorb_bcast_array_avx2x4 ++ tmp__trace);
      trace___absorb_bcast_array_avx2x4 <-
      (trace___absorb_bcast_array_avx2x4 ++
      [(Assert,
       (((0 <= param_2) /\ (param_2 <= 18446744073709551615)) /\
       (((0 <= (param_3 + param_2)) /\
        ((param_3 + param_2) <= 18446744073709551615)) /\
       (((is_init b_result_0 0 800) /\
        (result_1 = ((param_5 + param_2) + ((param_1 <> 0) ? 1 : 0)))) /\
       (result_0 = (param_3 + param_2))))))]);
      trace___absorb_bcast_array_avx2x4 <-
      (trace___absorb_bcast_array_avx2x4 ++
      [(Assert, ((0 <= result_0) /\ (result_0 <= 18446744073709551615)))]);
      st <- result_2;
      aT <- result_1;
      offset <- result_0;
      if ((tRAILB <> 0)) {
        param_0 <- st;
        param <- rATE8;
        (result, b_result, tmp__trace) <@ __addratebit_avx2x4 (
        param_0, (BArray800.init_arr (W8.of_int 255) 800), param);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++ tmp__trace);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++
        [(Assert, (is_init b_result 0 800))]);
        st <- result;
      } else {
        
      }
    } else {
      if ((aT <> 0)) {
        param_28 <- st;
        param_27 <- aT;
        b_param_2 <- b_buf;
        param_26 <- buf;
        param_25 <- offset;
        param_24 <- (rATE8 - aT);
        param_23 <- 0;
        (result_14, b_result_6, result_13, result_12, tmp__trace) <@ 
        __addstate_bcast_array_avx2x4 (param_28,
        (BArray800.init_arr (W8.of_int 255) 800), param_27, param_26,
        b_param_2, param_25, param_24, param_23);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++ tmp__trace);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++
        [(Assert,
         (((0 <= param_24) /\ (param_24 <= 18446744073709551615)) /\
         (((0 <= (param_25 + param_24)) /\
          ((param_25 + param_24) <= 18446744073709551615)) /\
         (((is_init b_result_6 0 800) /\
          (result_13 = ((param_27 + param_24) + ((param_23 <> 0) ? 1 : 0)))) /\
         (result_12 = (param_25 + param_24))))))]);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++
        [(Assert, ((0 <= result_12) /\ (result_12 <= 18446744073709551615)))]);
        st <- result_14;
        offset <- result_12;
        lEN <- (lEN - (rATE8 - aT));
        param_22 <- st;
        (result_11, b_result_5, tmp__trace) <@ _keccakf1600_avx2x4 (
        param_22, (BArray800.init_arr (W8.of_int 255) 800));
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++ tmp__trace);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++
        [(Assert, (is_init b_result_5 0 800))]);
        st <- result_11;
      } else {
        
      }
      iTERS <- (lEN %/ rATE8);
      i <- 0;
      trace___absorb_bcast_array_avx2x4 <-
      (trace___absorb_bcast_array_avx2x4 ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_21 <- st;
        param_20 <- 0;
        b_param_1 <- b_buf;
        param_19 <- buf;
        param_18 <- offset;
        param_17 <- rATE8;
        param_16 <- 0;
        (result_10, b_result_4, result_9, result_8, tmp__trace) <@ __addstate_bcast_array_avx2x4 (
        param_21, (BArray800.init_arr (W8.of_int 255) 800), param_20,
        param_19, b_param_1, param_18, param_17, param_16);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++ tmp__trace);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++
        [(Assert,
         (((0 <= param_17) /\ (param_17 <= 18446744073709551615)) /\
         (((0 <= (param_18 + param_17)) /\
          ((param_18 + param_17) <= 18446744073709551615)) /\
         (((is_init b_result_4 0 800) /\
          (result_9 = ((param_20 + param_17) + ((param_16 <> 0) ? 1 : 0)))) /\
         (result_8 = (param_18 + param_17))))))]);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++
        [(Assert, ((0 <= result_8) /\ (result_8 <= 18446744073709551615)))]);
        st <- result_10;
        offset <- result_8;
        param_15 <- st;
        (result_7, b_result_3, tmp__trace) <@ _keccakf1600_avx2x4 (
        param_15, (BArray800.init_arr (W8.of_int 255) 800));
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++ tmp__trace);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++
        [(Assert, (is_init b_result_3 0 800))]);
        st <- result_7;
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      lEN <- (aLL %% rATE8);
      param_14 <- st;
      param_13 <- 0;
      b_param_0 <- b_buf;
      param_12 <- buf;
      param_11 <- offset;
      param_10 <- lEN;
      param_9 <- tRAILB;
      (result_6, b_result_2, result_5, result_4, tmp__trace) <@ __addstate_bcast_array_avx2x4 (
      param_14, (BArray800.init_arr (W8.of_int 255) 800), param_13, param_12,
      b_param_0, param_11, param_10, param_9);
      trace___absorb_bcast_array_avx2x4 <-
      (trace___absorb_bcast_array_avx2x4 ++ tmp__trace);
      trace___absorb_bcast_array_avx2x4 <-
      (trace___absorb_bcast_array_avx2x4 ++
      [(Assert,
       (((0 <= param_10) /\ (param_10 <= 18446744073709551615)) /\
       (((0 <= (param_11 + param_10)) /\
        ((param_11 + param_10) <= 18446744073709551615)) /\
       (((is_init b_result_2 0 800) /\
        (result_5 = ((param_13 + param_10) + ((param_9 <> 0) ? 1 : 0)))) /\
       (result_4 = (param_11 + param_10))))))]);
      trace___absorb_bcast_array_avx2x4 <-
      (trace___absorb_bcast_array_avx2x4 ++
      [(Assert, ((0 <= result_4) /\ (result_4 <= 18446744073709551615)))]);
      st <- result_6;
      aT <- result_5;
      offset <- result_4;
      if ((tRAILB <> 0)) {
        param_8 <- st;
        param_7 <- rATE8;
        (result_3, b_result_1, tmp__trace) <@ __addratebit_avx2x4 (
        param_8, (BArray800.init_arr (W8.of_int 255) 800), param_7);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++ tmp__trace);
        trace___absorb_bcast_array_avx2x4 <-
        (trace___absorb_bcast_array_avx2x4 ++
        [(Assert, (is_init b_result_1 0 800))]);
        st <- result_3;
      } else {
        
      }
    }
    b_st <- (BArray800.init_arr (W8.of_int 255) 800);
    return (st, b_st, aT, offset, trace___absorb_bcast_array_avx2x4);
  }
  proc __addstate_array_avx2x4 (st:BArray800.t, b_st:BArray800.t,
                                         aT:int, buf0:BArrayS.t,
                                         b_buf0:BArrayS.t,
                                         buf1:BArrayS.t,
                                         b_buf1:BArrayS.t,
                                         buf2:BArrayS.t,
                                         b_buf2:BArrayS.t,
                                         buf3:BArrayS.t,
                                         b_buf3:BArrayS.t, offset:int,
                                         lEN:int, tRAILB:int) : BArray800.t *
                                                                BArray800.t *
                                                                int * int *
                                                                trace = {
    var aLL:int;
    var lO:int;
    var dELTA:int;
    var t0:W64.t;
    var t1:W64.t;
    var t2:W64.t;
    var t3:W64.t;
    var t256_0:W256.t;
    var t256_1:W256.t;
    var t256_2:W256.t;
    var t256_3:W256.t;
    var at:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result:W64.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var param_4:int;
    var param_5:int;
    var param_6:int;
    var param_7:int;
    var param_8:BArrayS.t;
    var result_3:W64.t;
    var result_4:int;
    var result_5:int;
    var result_6:int;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:int;
    var param_13:BArrayS.t;
    var result_7:W64.t;
    var result_8:int;
    var result_9:int;
    var result_10:int;
    var param_14:int;
    var param_15:int;
    var param_16:int;
    var param_17:int;
    var param_18:BArrayS.t;
    var result_11:W64.t;
    var result_12:int;
    var result_13:int;
    var result_14:int;
    var param_19:W256.t;
    var param_20:W256.t;
    var param_21:W256.t;
    var param_22:W256.t;
    var result_15:W256.t;
    var result_16:W256.t;
    var result_17:W256.t;
    var result_18:W256.t;
    var param_23:int;
    var param_24:int;
    var param_25:int;
    var param_26:int;
    var param_27:BArrayS.t;
    var result_19:W64.t;
    var result_20:int;
    var result_21:int;
    var result_22:int;
    var param_28:int;
    var param_29:int;
    var param_30:int;
    var param_31:int;
    var param_32:BArrayS.t;
    var result_23:W64.t;
    var result_24:int;
    var result_25:int;
    var result_26:int;
    var param_33:int;
    var param_34:int;
    var param_35:int;
    var param_36:int;
    var param_37:BArrayS.t;
    var result_27:W64.t;
    var result_28:int;
    var result_29:int;
    var result_30:int;
    var param_38:int;
    var param_39:int;
    var param_40:int;
    var param_41:int;
    var param_42:BArrayS.t;
    var result_31:W64.t;
    var result_32:int;
    var result_33:int;
    var result_34:int;
    var param_43:int;
    var param_44:int;
    var param_45:int;
    var param_46:int;
    var param_47:BArrayS.t;
    var result_35:W64.t;
    var result_36:int;
    var result_37:int;
    var result_38:int;
    var param_48:int;
    var param_49:int;
    var param_50:int;
    var param_51:int;
    var param_52:BArrayS.t;
    var result_39:W64.t;
    var result_40:int;
    var result_41:int;
    var result_42:int;
    var param_53:int;
    var param_54:int;
    var param_55:int;
    var param_56:int;
    var param_57:BArrayS.t;
    var result_43:W64.t;
    var result_44:int;
    var result_45:int;
    var result_46:int;
    var param_58:int;
    var param_59:int;
    var param_60:int;
    var param_61:int;
    var param_62:BArrayS.t;
    var result_47:W64.t;
    var result_48:int;
    var result_49:int;
    var result_50:int;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_param_1:BArrayS.t;
    var b_param_2:BArrayS.t;
    var b_param_3:BArrayS.t;
    var b_param_4:BArrayS.t;
    var b_param_5:BArrayS.t;
    var b_param_6:BArrayS.t;
    var b_param_7:BArrayS.t;
    var b_param_8:BArrayS.t;
    var b_param_9:BArrayS.t;
    var b_param_10:BArrayS.t;
    var trace___addstate_array_avx2x4:trace;
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
    param_3 <- witness;
    param_8 <- witness;
    param_13 <- witness;
    param_18 <- witness;
    param_27 <- witness;
    param_32 <- witness;
    param_37 <- witness;
    param_42 <- witness;
    param_47 <- witness;
    param_52 <- witness;
    param_57 <- witness;
    param_62 <- witness;
    trace___addstate_array_avx2x4 <- [];
    trace___addstate_array_avx2x4 <-
    (trace___addstate_array_avx2x4 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     (((((((((((0 <= offset) /\ (0 <= lEN)) /\ (0 <= aT)) /\ (aT < 200)) /\
           ((offset + lEN) <= size)) /\
          (((aT + lEN) + ((tRAILB <> 0) ? 1 : 0)) < 200)) /\
         (is_init b_buf0 offset lEN)) /\
        (is_init b_buf1 offset lEN)) /\
       (is_init b_buf2 offset lEN)) /\
      (is_init b_buf3 offset lEN)) /\
     (is_init b_st 0 800)))))]);
    trace___addstate_array_avx2x4 <-
    (trace___addstate_array_avx2x4 ++
    [(Assert, ((0 <= tRAILB) /\ (tRAILB < 256)))]);
    trace___addstate_array_avx2x4 <-
    (trace___addstate_array_avx2x4 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    aLL <- (aT + lEN);
    lO <- (aT %% 8);
    trace___addstate_array_avx2x4 <-
    (trace___addstate_array_avx2x4 ++
    [(Assert,
     ((0 <= (4 * (aT %/ 8))) /\ ((4 * (aT %/ 8)) <= 18446744073709551615)))]);
    at <- (4 * (aT %/ 8));
    dELTA <- 0;
    if ((0 < lO)) {
      if (((lO + lEN) < 8)) {
        if ((tRAILB <> 0)) {
          aLL <- (aLL + 1);
        } else {
          
        }
        b_param_6 <- b_buf0;
        param_42 <- buf0;
        param_41 <- offset;
        param_40 <- dELTA;
        param_39 <- lEN;
        param_38 <- tRAILB;
        (result_34, result_33, result_32, result_31, tmp__trace) <@ __aread_subu64 (
        param_42, b_param_6, param_41, param_40, param_39, param_38);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++ tmp__trace);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         (((result_34 =
           (param_40 +
           ((((param_39 < 8) ? param_39 : 8) < 0) ? 0 : ((param_39 < 8) ? 
                                                        param_39 : 8)))) /\
          (result_33 =
          (param_39 -
          ((((param_39 < 8) ? param_39 : 8) < 0) ? 0 : ((param_39 < 8) ? 
                                                       param_39 : 8))))) /\
         (result_32 = ((8 <= param_39) ? param_38 : 0))))]);
        t0 <- result_31;
        b_param_5 <- b_buf1;
        param_37 <- buf1;
        param_36 <- offset;
        param_35 <- dELTA;
        param_34 <- lEN;
        param_33 <- tRAILB;
        (result_30, result_29, result_28, result_27, tmp__trace) <@ __aread_subu64 (
        param_37, b_param_5, param_36, param_35, param_34, param_33);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++ tmp__trace);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         (((result_30 =
           (param_35 +
           ((((param_34 < 8) ? param_34 : 8) < 0) ? 0 : ((param_34 < 8) ? 
                                                        param_34 : 8)))) /\
          (result_29 =
          (param_34 -
          ((((param_34 < 8) ? param_34 : 8) < 0) ? 0 : ((param_34 < 8) ? 
                                                       param_34 : 8))))) /\
         (result_28 = ((8 <= param_34) ? param_33 : 0))))]);
        t1 <- result_27;
        b_param_4 <- b_buf2;
        param_32 <- buf2;
        param_31 <- offset;
        param_30 <- dELTA;
        param_29 <- lEN;
        param_28 <- tRAILB;
        (result_26, result_25, result_24, result_23, tmp__trace) <@ __aread_subu64 (
        param_32, b_param_4, param_31, param_30, param_29, param_28);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++ tmp__trace);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         (((result_26 =
           (param_30 +
           ((((param_29 < 8) ? param_29 : 8) < 0) ? 0 : ((param_29 < 8) ? 
                                                        param_29 : 8)))) /\
          (result_25 =
          (param_29 -
          ((((param_29 < 8) ? param_29 : 8) < 0) ? 0 : ((param_29 < 8) ? 
                                                       param_29 : 8))))) /\
         (result_24 = ((8 <= param_29) ? param_28 : 0))))]);
        t2 <- result_23;
        b_param_3 <- b_buf3;
        param_27 <- buf3;
        param_26 <- offset;
        param_25 <- dELTA;
        param_24 <- lEN;
        param_23 <- tRAILB;
        (result_22, result_21, result_20, result_19, tmp__trace) <@ __aread_subu64 (
        param_27, b_param_3, param_26, param_25, param_24, param_23);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++ tmp__trace);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         (((result_22 =
           (param_25 +
           ((((param_24 < 8) ? param_24 : 8) < 0) ? 0 : ((param_24 < 8) ? 
                                                        param_24 : 8)))) /\
          (result_21 =
          (param_24 -
          ((((param_24 < 8) ? param_24 : 8) < 0) ? 0 : ((param_24 < 8) ? 
                                                       param_24 : 8))))) /\
         (result_20 = ((8 <= param_24) ? param_23 : 0))))]);
        dELTA <- result_22;
        t3 <- result_19;
        t0 <- (t0 `<<` (W8.of_int (8 * lO)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
        t0 <- (t0 `^` (BArray800.get64 st at));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st at t0);
        t1 <- (t1 `<<` (W8.of_int (8 * lO)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
        t1 <- (t1 `^` (BArray800.get64 st (at + 1)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st (at + 1) t1);
        t2 <- (t2 `<<` (W8.of_int (8 * lO)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
        t2 <- (t2 `^` (BArray800.get64 st (at + 2)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st (at + 2) t2);
        t3 <- (t3 `<<` (W8.of_int (8 * lO)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
        t3 <- (t3 `^` (BArray800.get64 st (at + 3)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st (at + 3) t3);
        aT <- 0;
        lEN <- 0;
        tRAILB <- 0;
      } else {
        if ((8 <= lEN)) {
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert, (is_init b_buf0 (offset + dELTA) 8))]);
          t0 <- (BArrayS.get64d buf0 (offset + dELTA));
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert, (is_init b_buf1 (offset + dELTA) 8))]);
          t1 <- (BArrayS.get64d buf1 (offset + dELTA));
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert, (is_init b_buf2 (offset + dELTA) 8))]);
          t2 <- (BArrayS.get64d buf2 (offset + dELTA));
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert, (is_init b_buf3 (offset + dELTA) 8))]);
          t3 <- (BArrayS.get64d buf3 (offset + dELTA));
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert, ((0 <= (8 - lO)) /\ ((8 - lO) <= 18446744073709551615)))]);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           ((0 <= (offset + (8 - lO))) /\
           ((offset + (8 - lO)) <= 18446744073709551615)))]);
          offset <- (offset + (8 - lO));
        } else {
          b_param_10 <- b_buf0;
          param_62 <- buf0;
          param_61 <- offset;
          param_60 <- dELTA;
          param_59 <- (8 - lO);
          param_58 <- tRAILB;
          (result_50, result_49, result_48, result_47, tmp__trace) <@ 
          __aread_subu64 (param_62, b_param_10, param_61, param_60,
          param_59, param_58);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++ tmp__trace);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           (((result_50 =
             (param_60 +
             ((((param_59 < 8) ? param_59 : 8) < 0) ? 0 : ((param_59 < 8) ? 
                                                          param_59 : 8)))) /\
            (result_49 =
            (param_59 -
            ((((param_59 < 8) ? param_59 : 8) < 0) ? 0 : ((param_59 < 8) ? 
                                                         param_59 : 8))))) /\
           (result_48 = ((8 <= param_59) ? param_58 : 0))))]);
          t0 <- result_47;
          b_param_9 <- b_buf1;
          param_57 <- buf1;
          param_56 <- offset;
          param_55 <- dELTA;
          param_54 <- (8 - lO);
          param_53 <- tRAILB;
          (result_46, result_45, result_44, result_43, tmp__trace) <@ 
          __aread_subu64 (param_57, b_param_9, param_56, param_55,
          param_54, param_53);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++ tmp__trace);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           (((result_46 =
             (param_55 +
             ((((param_54 < 8) ? param_54 : 8) < 0) ? 0 : ((param_54 < 8) ? 
                                                          param_54 : 8)))) /\
            (result_45 =
            (param_54 -
            ((((param_54 < 8) ? param_54 : 8) < 0) ? 0 : ((param_54 < 8) ? 
                                                         param_54 : 8))))) /\
           (result_44 = ((8 <= param_54) ? param_53 : 0))))]);
          t1 <- result_43;
          b_param_8 <- b_buf2;
          param_52 <- buf2;
          param_51 <- offset;
          param_50 <- dELTA;
          param_49 <- (8 - lO);
          param_48 <- tRAILB;
          (result_42, result_41, result_40, result_39, tmp__trace) <@ 
          __aread_subu64 (param_52, b_param_8, param_51, param_50,
          param_49, param_48);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++ tmp__trace);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           (((result_42 =
             (param_50 +
             ((((param_49 < 8) ? param_49 : 8) < 0) ? 0 : ((param_49 < 8) ? 
                                                          param_49 : 8)))) /\
            (result_41 =
            (param_49 -
            ((((param_49 < 8) ? param_49 : 8) < 0) ? 0 : ((param_49 < 8) ? 
                                                         param_49 : 8))))) /\
           (result_40 = ((8 <= param_49) ? param_48 : 0))))]);
          t2 <- result_39;
          b_param_7 <- b_buf3;
          param_47 <- buf3;
          param_46 <- offset;
          param_45 <- dELTA;
          param_44 <- (8 - lO);
          param_43 <- tRAILB;
          (result_38, result_37, result_36, result_35, tmp__trace) <@ 
          __aread_subu64 (param_47, b_param_7, param_46, param_45,
          param_44, param_43);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++ tmp__trace);
          trace___addstate_array_avx2x4 <-
          (trace___addstate_array_avx2x4 ++
          [(Assert,
           (((result_38 =
             (param_45 +
             ((((param_44 < 8) ? param_44 : 8) < 0) ? 0 : ((param_44 < 8) ? 
                                                          param_44 : 8)))) /\
            (result_37 =
            (param_44 -
            ((((param_44 < 8) ? param_44 : 8) < 0) ? 0 : ((param_44 < 8) ? 
                                                         param_44 : 8))))) /\
           (result_36 = ((8 <= param_44) ? param_43 : 0))))]);
          dELTA <- result_38;
          t3 <- result_35;
        }
        lEN <- (lEN - (8 - lO));
        aT <- (aT + (8 - lO));
        t0 <- (t0 `<<` (W8.of_int (8 * lO)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
        t0 <- (t0 `^` (BArray800.get64 st at));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st at t0);
        t1 <- (t1 `<<` (W8.of_int (8 * lO)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
        t1 <- (t1 `^` (BArray800.get64 st (at + 1)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st (at + 1) t1);
        t2 <- (t2 `<<` (W8.of_int (8 * lO)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
        t2 <- (t2 `^` (BArray800.get64 st (at + 2)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st (at + 2) t2);
        t3 <- (t3 `<<` (W8.of_int (8 * lO)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
        t3 <- (t3 `^` (BArray800.get64 st (at + 3)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st (at + 3) t3);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 4)) /\ ((at + 4) <= 18446744073709551615)))]);
        at <- (at + 4);
      }
    } else {
      
    }
    trace___addstate_array_avx2x4 <-
    (trace___addstate_array_avx2x4 ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace___addstate_array_avx2x4 <-
    (trace___addstate_array_avx2x4 ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    dELTA <- 0;
    if ((8 <= lEN)) {
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * (aT %/ 8)) + (16 * (lEN %/ 32)))) /\
       (((4 * (aT %/ 8)) + (16 * (lEN %/ 32))) <= 18446744073709551615)))]);
      while ((at < ((4 * (aT %/ 8)) + (16 * (lEN %/ 32))))) {
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, (is_init b_buf0 offset 32))]);
        t256_0 <- (BArrayS.get256d buf0 offset);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, (is_init b_buf1 offset 32))]);
        t256_1 <- (BArrayS.get256d buf1 offset);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, (is_init b_buf2 offset 32))]);
        t256_2 <- (BArrayS.get256d buf2 offset);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, (is_init b_buf3 offset 32))]);
        t256_3 <- (BArrayS.get256d buf3 offset);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= (offset + 32)) /\ ((offset + 32) <= 18446744073709551615)))]);
        offset <- (offset + 32);
        param_22 <- t256_0;
        param_21 <- t256_1;
        param_20 <- t256_2;
        param_19 <- t256_3;
        (result_18, result_17, result_16, result_15, tmp__trace) <@ __4u64x4_u256x4 (
        param_22, param_21, param_20, param_19);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++ tmp__trace);
        t256_0 <- result_18;
        t256_1 <- result_17;
        t256_2 <- result_16;
        t256_3 <- result_15;
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (8 * at)) /\ ((8 * at) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (8 * at)) /\ (((8 * at) + 32) <= 800)))]);
        t256_0 <- (t256_0 `^` (BArray800.get256d st (8 * at)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (8 * at)) /\ ((8 * at) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (8 * at)) /\ (((8 * at) + 32) <= 800)))]);
        st <- (BArray800.set256d st (8 * at) t256_0);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (8 * at)) /\ ((8 * at) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 32)) /\
         (((8 * at) + 32) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 32)) /\ ((((8 * at) + 32) + 32) <= 800)))]);
        t256_1 <- (t256_1 `^` (BArray800.get256d st ((8 * at) + 32)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (8 * at)) /\ ((8 * at) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 32)) /\
         (((8 * at) + 32) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 32)) /\ ((((8 * at) + 32) + 32) <= 800)))]);
        st <- (BArray800.set256d st ((8 * at) + 32) t256_1);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (8 * at)) /\ ((8 * at) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 64)) /\
         (((8 * at) + 64) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 64)) /\ ((((8 * at) + 64) + 32) <= 800)))]);
        t256_2 <- (t256_2 `^` (BArray800.get256d st ((8 * at) + 64)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (8 * at)) /\ ((8 * at) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 64)) /\
         (((8 * at) + 64) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 64)) /\ ((((8 * at) + 64) + 32) <= 800)))]);
        st <- (BArray800.set256d st ((8 * at) + 64) t256_2);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (8 * at)) /\ ((8 * at) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 96)) /\
         (((8 * at) + 96) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 96)) /\ ((((8 * at) + 96) + 32) <= 800)))]);
        t256_3 <- (t256_3 `^` (BArray800.get256d st ((8 * at) + 96)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (8 * at)) /\ ((8 * at) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 96)) /\
         (((8 * at) + 96) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((8 * at) + 96)) /\ ((((8 * at) + 96) + 32) <= 800)))]);
        st <- (BArray800.set256d st ((8 * at) + 96) t256_3);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 16)) /\ ((at + 16) <= 18446744073709551615)))]);
        at <- (at + 16);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((4 * (aT %/ 8)) + (16 * (lEN %/ 32)))) /\
         (((4 * (aT %/ 8)) + (16 * (lEN %/ 32))) <= 18446744073709551615)))]);
      }
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * (aT %/ 8)) + (4 * (lEN %/ 8)))) /\
       (((4 * (aT %/ 8)) + (4 * (lEN %/ 8))) <= 18446744073709551615)))]);
      while ((at < ((4 * (aT %/ 8)) + (4 * (lEN %/ 8))))) {
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, (is_init b_buf0 offset 8))]);
        t0 <- (BArrayS.get64d buf0 offset);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
        t0 <- (t0 `^` (BArray800.get64 st at));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st at t0);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, (is_init b_buf1 offset 8))]);
        t1 <- (BArrayS.get64d buf1 offset);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
        t1 <- (t1 `^` (BArray800.get64 st (at + 1)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st (at + 1) t1);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, (is_init b_buf2 offset 8))]);
        t2 <- (BArrayS.get64d buf2 offset);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
        t2 <- (t2 `^` (BArray800.get64 st (at + 2)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st (at + 2) t2);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, (is_init b_buf3 offset 8))]);
        t3 <- (BArrayS.get64d buf3 offset);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
        offset <- (offset + 8);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
        t3 <- (t3 `^` (BArray800.get64 st (at + 3)));
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
        st <- (BArray800.set64 st (at + 3) t3);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert, ((0 <= (at + 4)) /\ ((at + 4) <= 18446744073709551615)))]);
        at <- (at + 4);
        trace___addstate_array_avx2x4 <-
        (trace___addstate_array_avx2x4 ++
        [(Assert,
         ((0 <= ((4 * (aT %/ 8)) + (4 * (lEN %/ 8)))) /\
         (((4 * (aT %/ 8)) + (4 * (lEN %/ 8))) <= 18446744073709551615)))]);
      }
      lEN <- ((aT + lEN) %% 8);
    } else {
      
    }
    lO <- ((aT + lEN) %% 8);
    if (((0 < lO) \/ (tRAILB <> 0))) {
      b_param_2 <- b_buf0;
      param_18 <- buf0;
      param_17 <- offset;
      param_16 <- dELTA;
      param_15 <- lO;
      param_14 <- tRAILB;
      (result_14, result_13, result_12, result_11, tmp__trace) <@ __aread_subu64 (
      param_18, b_param_2, param_17, param_16, param_15, param_14);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++ tmp__trace);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert,
       (((result_14 =
         (param_16 +
         ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                      param_15 : 8)))) /\
        (result_13 =
        (param_15 -
        ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                     param_15 : 8))))) /\
       (result_12 = ((8 <= param_15) ? param_14 : 0))))]);
      t0 <- result_11;
      b_param_1 <- b_buf1;
      param_13 <- buf1;
      param_12 <- offset;
      param_11 <- dELTA;
      param_10 <- lO;
      param_9 <- tRAILB;
      (result_10, result_9, result_8, result_7, tmp__trace) <@ __aread_subu64 (
      param_13, b_param_1, param_12, param_11, param_10, param_9);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++ tmp__trace);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert,
       (((result_10 =
         (param_11 +
         ((((param_10 < 8) ? param_10 : 8) < 0) ? 0 : ((param_10 < 8) ? 
                                                      param_10 : 8)))) /\
        (result_9 =
        (param_10 -
        ((((param_10 < 8) ? param_10 : 8) < 0) ? 0 : ((param_10 < 8) ? 
                                                     param_10 : 8))))) /\
       (result_8 = ((8 <= param_10) ? param_9 : 0))))]);
      t1 <- result_7;
      b_param_0 <- b_buf2;
      param_8 <- buf2;
      param_7 <- offset;
      param_6 <- dELTA;
      param_5 <- lO;
      param_4 <- tRAILB;
      (result_6, result_5, result_4, result_3, tmp__trace) <@ __aread_subu64 (
      param_8, b_param_0, param_7, param_6, param_5, param_4);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++ tmp__trace);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert,
       (((result_6 =
         (param_6 +
         ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? 
                                                    param_5 : 8)))) /\
        (result_5 =
        (param_5 -
        ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? param_5 : 8))))) /\
       (result_4 = ((8 <= param_5) ? param_4 : 0))))]);
      t2 <- result_3;
      b_param <- b_buf3;
      param_3 <- buf3;
      param_2 <- offset;
      param_1 <- dELTA;
      param_0 <- lO;
      param <- tRAILB;
      (result_2, result_1, result_0, result, tmp__trace) <@ __aread_subu64 (
      param_3, b_param, param_2, param_1, param_0, param);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++ tmp__trace);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert,
       (((result_2 =
         (param_1 +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))) /\
        (result_1 =
        (param_0 -
        ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8))))) /\
       (result_0 = ((8 <= param_0) ? param : 0))))]);
      dELTA <- result_2;
      t3 <- result;
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
      if ((tRAILB <> 0)) {
        aLL <- (aLL + 1);
      } else {
        
      }
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
      t0 <- (t0 `^` (BArray800.get64 st at));
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
      st <- (BArray800.set64 st at t0);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
      t1 <- (t1 `^` (BArray800.get64 st (at + 1)));
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
      st <- (BArray800.set64 st (at + 1) t1);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
      t2 <- (t2 `^` (BArray800.get64 st (at + 2)));
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
      st <- (BArray800.set64 st (at + 2) t2);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
      t3 <- (t3 `^` (BArray800.get64 st (at + 3)));
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
      trace___addstate_array_avx2x4 <-
      (trace___addstate_array_avx2x4 ++
      [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
      st <- (BArray800.set64 st (at + 3) t3);
    } else {
      
    }
    b_st <- (BArray800.init_arr (W8.of_int 255) 800);
    return (st, b_st, aLL, offset, trace___addstate_array_avx2x4);
  }
  proc __absorb_array_avx2x4 (st:BArray800.t, b_st:BArray800.t,
                                       aT:int, buf0:BArrayS.t,
                                       b_buf0:BArrayS.t, buf1:BArrayS.t,
                                       b_buf1:BArrayS.t, buf2:BArrayS.t,
                                       b_buf2:BArrayS.t, buf3:BArrayS.t,
                                       b_buf3:BArrayS.t, offset:int,
                                       lEN:int, rATE8:int, tRAILB:int) : 
  BArray800.t * BArray800.t * int * int * trace = {
    var aLL:int;
    var iTERS:int;
    var i:int;
    var param:int;
    var param_0:BArray800.t;
    var result:BArray800.t;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:BArrayS.t;
    var param_5:BArrayS.t;
    var param_6:BArrayS.t;
    var param_7:BArrayS.t;
    var param_8:int;
    var param_9:BArray800.t;
    var result_0:int;
    var result_1:int;
    var result_2:BArray800.t;
    var param_10:int;
    var param_11:BArray800.t;
    var result_3:BArray800.t;
    var param_12:int;
    var param_13:int;
    var param_14:int;
    var param_15:BArrayS.t;
    var param_16:BArrayS.t;
    var param_17:BArrayS.t;
    var param_18:BArrayS.t;
    var param_19:int;
    var param_20:BArray800.t;
    var result_4:int;
    var result_5:int;
    var result_6:BArray800.t;
    var param_21:BArray800.t;
    var result_7:BArray800.t;
    var param_22:int;
    var param_23:int;
    var param_24:int;
    var param_25:BArrayS.t;
    var param_26:BArrayS.t;
    var param_27:BArrayS.t;
    var param_28:BArrayS.t;
    var param_29:int;
    var param_30:BArray800.t;
    var result_8:int;
    var result_9:int;
    var result_10:BArray800.t;
    var param_31:BArray800.t;
    var result_11:BArray800.t;
    var param_32:int;
    var param_33:int;
    var param_34:int;
    var param_35:BArrayS.t;
    var param_36:BArrayS.t;
    var param_37:BArrayS.t;
    var param_38:BArrayS.t;
    var param_39:int;
    var param_40:BArray800.t;
    var result_12:int;
    var result_13:int;
    var result_14:BArray800.t;
    var b_result:BArray800.t;
    var b_result_0:BArray800.t;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_param_1:BArrayS.t;
    var b_param_2:BArrayS.t;
    var b_result_1:BArray800.t;
    var b_result_2:BArray800.t;
    var b_param_3:BArrayS.t;
    var b_param_4:BArrayS.t;
    var b_param_5:BArrayS.t;
    var b_param_6:BArrayS.t;
    var b_result_3:BArray800.t;
    var b_result_4:BArray800.t;
    var b_param_7:BArrayS.t;
    var b_param_8:BArrayS.t;
    var b_param_9:BArrayS.t;
    var b_param_10:BArrayS.t;
    var b_result_5:BArray800.t;
    var b_result_6:BArray800.t;
    var b_param_11:BArrayS.t;
    var b_param_12:BArrayS.t;
    var b_param_13:BArrayS.t;
    var b_param_14:BArrayS.t;
    var trace___absorb_array_avx2x4:trace;
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
    b_param_13 <- witness;
    b_param_14 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    b_result_5 <- witness;
    b_result_6 <- witness;
    param_0 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    param_9 <- witness;
    param_11 <- witness;
    param_15 <- witness;
    param_16 <- witness;
    param_17 <- witness;
    param_18 <- witness;
    param_20 <- witness;
    param_21 <- witness;
    param_25 <- witness;
    param_26 <- witness;
    param_27 <- witness;
    param_28 <- witness;
    param_30 <- witness;
    param_31 <- witness;
    param_35 <- witness;
    param_36 <- witness;
    param_37 <- witness;
    param_38 <- witness;
    param_40 <- witness;
    result <- witness;
    result_2 <- witness;
    result_3 <- witness;
    result_6 <- witness;
    result_7 <- witness;
    result_10 <- witness;
    result_11 <- witness;
    result_14 <- witness;
    trace___absorb_array_avx2x4 <- [];
    trace___absorb_array_avx2x4 <-
    (trace___absorb_array_avx2x4 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     (((((((((((((0 <= offset) /\ (0 <= lEN)) /\ (0 <= aT)) /\ (aT < rATE8)) /\
             (0 < rATE8)) /\
            (rATE8 < 200)) /\
           ((offset + lEN) <= size)) /\
          (((aT + lEN) + ((tRAILB <> 0) ? 1 : 0)) < 200)) /\
         (is_init b_buf0 offset lEN)) /\
        (is_init b_buf1 offset lEN)) /\
       (is_init b_buf2 offset lEN)) /\
      (is_init b_buf3 offset lEN)) /\
     (is_init b_st 0 800)))))]);
    trace___absorb_array_avx2x4 <-
    (trace___absorb_array_avx2x4 ++
    [(Assert, ((0 <= tRAILB) /\ (tRAILB < 256)))]);
    trace___absorb_array_avx2x4 <-
    (trace___absorb_array_avx2x4 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    aLL <- (aT + lEN);
    if (((aT + lEN) < rATE8)) {
      param_9 <- st;
      param_8 <- aT;
      b_param_2 <- b_buf0;
      param_7 <- buf0;
      b_param_1 <- b_buf1;
      param_6 <- buf1;
      b_param_0 <- b_buf2;
      param_5 <- buf2;
      b_param <- b_buf3;
      param_4 <- buf3;
      param_3 <- offset;
      param_2 <- lEN;
      param_1 <- tRAILB;
      (result_2, b_result_0, result_1, result_0, tmp__trace) <@ __addstate_array_avx2x4 (
      param_9, (BArray800.init_arr (W8.of_int 255) 800), param_8, param_7,
      b_param_2, param_6, b_param_1, param_5, b_param_0, param_4, b_param,
      param_3, param_2, param_1);
      trace___absorb_array_avx2x4 <-
      (trace___absorb_array_avx2x4 ++ tmp__trace);
      trace___absorb_array_avx2x4 <-
      (trace___absorb_array_avx2x4 ++
      [(Assert,
       (((0 <= param_2) /\ (param_2 <= 18446744073709551615)) /\
       (((0 <= (param_3 + param_2)) /\
        ((param_3 + param_2) <= 18446744073709551615)) /\
       (((is_init b_result_0 0 800) /\
        (result_1 = ((param_8 + param_2) + ((param_1 <> 0) ? 1 : 0)))) /\
       (result_0 = (param_3 + param_2))))))]);
      trace___absorb_array_avx2x4 <-
      (trace___absorb_array_avx2x4 ++
      [(Assert, ((0 <= result_0) /\ (result_0 <= 18446744073709551615)))]);
      st <- result_2;
      aT <- result_1;
      offset <- result_0;
      if ((tRAILB <> 0)) {
        param_0 <- st;
        param <- rATE8;
        (result, b_result, tmp__trace) <@ __addratebit_avx2x4 (
        param_0, (BArray800.init_arr (W8.of_int 255) 800), param);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++ tmp__trace);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++
        [(Assert, (is_init b_result 0 800))]);
        st <- result;
      } else {
        
      }
    } else {
      if ((aT <> 0)) {
        param_40 <- st;
        param_39 <- aT;
        b_param_14 <- b_buf0;
        param_38 <- buf0;
        b_param_13 <- b_buf1;
        param_37 <- buf1;
        b_param_12 <- b_buf2;
        param_36 <- buf2;
        b_param_11 <- b_buf3;
        param_35 <- buf3;
        param_34 <- offset;
        param_33 <- (rATE8 - aT);
        param_32 <- 0;
        (result_14, b_result_6, result_13, result_12, tmp__trace) <@ 
        __addstate_array_avx2x4 (param_40,
        (BArray800.init_arr (W8.of_int 255) 800), param_39, param_38,
        b_param_14, param_37, b_param_13, param_36, b_param_12, param_35,
        b_param_11, param_34, param_33, param_32);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++ tmp__trace);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++
        [(Assert,
         (((0 <= param_33) /\ (param_33 <= 18446744073709551615)) /\
         (((0 <= (param_34 + param_33)) /\
          ((param_34 + param_33) <= 18446744073709551615)) /\
         (((is_init b_result_6 0 800) /\
          (result_13 = ((param_39 + param_33) + ((param_32 <> 0) ? 1 : 0)))) /\
         (result_12 = (param_34 + param_33))))))]);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++
        [(Assert, ((0 <= result_12) /\ (result_12 <= 18446744073709551615)))]);
        st <- result_14;
        offset <- result_12;
        lEN <- (lEN - (rATE8 - aT));
        param_31 <- st;
        (result_11, b_result_5, tmp__trace) <@ _keccakf1600_avx2x4 (
        param_31, (BArray800.init_arr (W8.of_int 255) 800));
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++ tmp__trace);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++
        [(Assert, (is_init b_result_5 0 800))]);
        st <- result_11;
      } else {
        
      }
      iTERS <- (lEN %/ rATE8);
      i <- 0;
      trace___absorb_array_avx2x4 <-
      (trace___absorb_array_avx2x4 ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_30 <- st;
        param_29 <- 0;
        b_param_10 <- b_buf0;
        param_28 <- buf0;
        b_param_9 <- b_buf1;
        param_27 <- buf1;
        b_param_8 <- b_buf2;
        param_26 <- buf2;
        b_param_7 <- b_buf3;
        param_25 <- buf3;
        param_24 <- offset;
        param_23 <- rATE8;
        param_22 <- 0;
        (result_10, b_result_4, result_9, result_8, tmp__trace) <@ __addstate_array_avx2x4 (
        param_30, (BArray800.init_arr (W8.of_int 255) 800), param_29,
        param_28, b_param_10, param_27, b_param_9, param_26, b_param_8,
        param_25, b_param_7, param_24, param_23, param_22);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++ tmp__trace);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++
        [(Assert,
         (((0 <= param_23) /\ (param_23 <= 18446744073709551615)) /\
         (((0 <= (param_24 + param_23)) /\
          ((param_24 + param_23) <= 18446744073709551615)) /\
         (((is_init b_result_4 0 800) /\
          (result_9 = ((param_29 + param_23) + ((param_22 <> 0) ? 1 : 0)))) /\
         (result_8 = (param_24 + param_23))))))]);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++
        [(Assert, ((0 <= result_8) /\ (result_8 <= 18446744073709551615)))]);
        st <- result_10;
        offset <- result_8;
        param_21 <- st;
        (result_7, b_result_3, tmp__trace) <@ _keccakf1600_avx2x4 (
        param_21, (BArray800.init_arr (W8.of_int 255) 800));
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++ tmp__trace);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++
        [(Assert, (is_init b_result_3 0 800))]);
        st <- result_7;
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      lEN <- (aLL %% rATE8);
      param_20 <- st;
      param_19 <- 0;
      b_param_6 <- b_buf0;
      param_18 <- buf0;
      b_param_5 <- b_buf1;
      param_17 <- buf1;
      b_param_4 <- b_buf2;
      param_16 <- buf2;
      b_param_3 <- b_buf3;
      param_15 <- buf3;
      param_14 <- offset;
      param_13 <- lEN;
      param_12 <- tRAILB;
      (result_6, b_result_2, result_5, result_4, tmp__trace) <@ __addstate_array_avx2x4 (
      param_20, (BArray800.init_arr (W8.of_int 255) 800), param_19, param_18,
      b_param_6, param_17, b_param_5, param_16, b_param_4, param_15,
      b_param_3, param_14, param_13, param_12);
      trace___absorb_array_avx2x4 <-
      (trace___absorb_array_avx2x4 ++ tmp__trace);
      trace___absorb_array_avx2x4 <-
      (trace___absorb_array_avx2x4 ++
      [(Assert,
       (((0 <= param_13) /\ (param_13 <= 18446744073709551615)) /\
       (((0 <= (param_14 + param_13)) /\
        ((param_14 + param_13) <= 18446744073709551615)) /\
       (((is_init b_result_2 0 800) /\
        (result_5 = ((param_19 + param_13) + ((param_12 <> 0) ? 1 : 0)))) /\
       (result_4 = (param_14 + param_13))))))]);
      trace___absorb_array_avx2x4 <-
      (trace___absorb_array_avx2x4 ++
      [(Assert, ((0 <= result_4) /\ (result_4 <= 18446744073709551615)))]);
      st <- result_6;
      aT <- result_5;
      offset <- result_4;
      if ((tRAILB <> 0)) {
        param_11 <- st;
        param_10 <- rATE8;
        (result_3, b_result_1, tmp__trace) <@ __addratebit_avx2x4 (
        param_11, (BArray800.init_arr (W8.of_int 255) 800), param_10);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++ tmp__trace);
        trace___absorb_array_avx2x4 <-
        (trace___absorb_array_avx2x4 ++
        [(Assert, (is_init b_result_1 0 800))]);
        st <- result_3;
      } else {
        
      }
    }
    b_st <- (BArray800.init_arr (W8.of_int 255) 800);
    return (st, b_st, aT, offset, trace___absorb_array_avx2x4);
  }
  proc __dumpstate_array_avx2x4 (buf0:BArrayS.t,
                                          b_buf0:BArrayS.t,
                                          buf1:BArrayS.t,
                                          b_buf1:BArrayS.t,
                                          buf2:BArrayS.t,
                                          b_buf2:BArrayS.t,
                                          buf3:BArrayS.t,
                                          b_buf3:BArrayS.t, offset:int,
                                          lEN:int, st:BArray800.t,
                                          b_st:BArray800.t) : BArrayS.t *
                                                              BArrayS.t *
                                                              BArrayS.t *
                                                              BArrayS.t *
                                                              BArrayS.t *
                                                              BArrayS.t *
                                                              BArrayS.t *
                                                              BArrayS.t *
                                                              int * trace = {
    var x0:W256.t;
    var x1:W256.t;
    var x2:W256.t;
    var x3:W256.t;
    var t0:W64.t;
    var t1:W64.t;
    var t2:W64.t;
    var t3:W64.t;
    var i:int;
    var param:W64.t;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result:int;
    var result_0:int;
    var result_1:BArrayS.t;
    var param_4:W64.t;
    var param_5:int;
    var param_6:int;
    var param_7:int;
    var param_8:BArrayS.t;
    var result_2:int;
    var result_3:int;
    var result_4:BArrayS.t;
    var param_9:W64.t;
    var param_10:int;
    var param_11:int;
    var param_12:int;
    var param_13:BArrayS.t;
    var result_5:int;
    var result_6:int;
    var result_7:BArrayS.t;
    var param_14:W64.t;
    var param_15:int;
    var param_16:int;
    var param_17:int;
    var param_18:BArrayS.t;
    var result_8:int;
    var result_9:int;
    var result_10:BArrayS.t;
    var param_19:W256.t;
    var param_20:W256.t;
    var param_21:W256.t;
    var param_22:W256.t;
    var result_11:W256.t;
    var result_12:W256.t;
    var result_13:W256.t;
    var result_14:W256.t;
    var b_result:BArrayS.t;
    var b_param:BArrayS.t;
    var b_result_0:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_result_1:BArrayS.t;
    var b_param_1:BArrayS.t;
    var b_result_2:BArrayS.t;
    var b_param_2:BArrayS.t;
    var trace___dumpstate_array_avx2x4:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    param_3 <- witness;
    param_8 <- witness;
    param_13 <- witness;
    param_18 <- witness;
    result_1 <- witness;
    result_4 <- witness;
    result_7 <- witness;
    result_10 <- witness;
    trace___dumpstate_array_avx2x4 <- [];
    trace___dumpstate_array_avx2x4 <-
    (trace___dumpstate_array_avx2x4 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     (((((0 <= offset) /\ (0 <= lEN)) /\ (is_init b_st 0 800)) /\
      ((offset + lEN) <= size)) /\
     (lEN <= 200)))))]);
    trace___dumpstate_array_avx2x4 <-
    (trace___dumpstate_array_avx2x4 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    i <- 0;
    while ((i < (32 * (lEN %/ 32)))) {
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ (((4 * i) + 32) <= 800)))]);
      x0 <- (BArray800.get256d st (4 * i));
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 32)) /\ (((4 * i) + 32) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 32)) /\ ((((4 * i) + 32) + 32) <= 800)))]);
      x1 <- (BArray800.get256d st ((4 * i) + 32));
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 64)) /\ (((4 * i) + 64) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 64)) /\ ((((4 * i) + 64) + 32) <= 800)))]);
      x2 <- (BArray800.get256d st ((4 * i) + 64));
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 96)) /\ (((4 * i) + 96) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 96)) /\ ((((4 * i) + 96) + 32) <= 800)))]);
      x3 <- (BArray800.get256d st ((4 * i) + 96));
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (i + 32)) /\ ((i + 32) <= 18446744073709551615)))]);
      i <- (i + 32);
      param_22 <- x0;
      param_21 <- x1;
      param_20 <- x2;
      param_19 <- x3;
      (result_14, result_13, result_12, result_11, tmp__trace) <@ __4u64x4_u256x4 (
      param_22, param_21, param_20, param_19);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++ tmp__trace);
      x0 <- result_14;
      x1 <- result_13;
      x2 <- result_12;
      x3 <- result_11;
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
      b_buf0 <-
      (BArrayS.set256d b_buf0 offset
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      buf0 <- (BArrayS.set256d buf0 offset x0);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
      b_buf1 <-
      (BArrayS.set256d b_buf1 offset
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      buf1 <- (BArrayS.set256d buf1 offset x1);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
      b_buf2 <-
      (BArrayS.set256d b_buf2 offset
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      buf2 <- (BArrayS.set256d buf2 offset x2);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
      b_buf3 <-
      (BArrayS.set256d b_buf3 offset
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      buf3 <- (BArrayS.set256d buf3 offset x3);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= (offset + 32)) /\ ((offset + 32) <= 18446744073709551615)))]);
      offset <- (offset + 32);
    }
    while ((i < (8 * (lEN %/ 8)))) {
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ (((4 * i) + 8) <= 800)))]);
      t0 <- (BArray800.get64d st (4 * i));
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      b_buf0 <-
      (BArrayS.set64d b_buf0 offset (W64.of_int 18446744073709551615));
      buf0 <- (BArrayS.set64d buf0 offset t0);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 8)) /\ (((4 * i) + 8) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 8)) /\ ((((4 * i) + 8) + 8) <= 800)))]);
      t1 <- (BArray800.get64d st ((4 * i) + 8));
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      b_buf1 <-
      (BArrayS.set64d b_buf1 offset (W64.of_int 18446744073709551615));
      buf1 <- (BArrayS.set64d buf1 offset t1);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 16)) /\ (((4 * i) + 16) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 16)) /\ ((((4 * i) + 16) + 8) <= 800)))]);
      t2 <- (BArray800.get64d st ((4 * i) + 16));
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      b_buf2 <-
      (BArrayS.set64d b_buf2 offset (W64.of_int 18446744073709551615));
      buf2 <- (BArrayS.set64d buf2 offset t2);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 24)) /\ (((4 * i) + 24) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 24)) /\ ((((4 * i) + 24) + 8) <= 800)))]);
      t3 <- (BArray800.get64d st ((4 * i) + 24));
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      b_buf3 <-
      (BArrayS.set64d b_buf3 offset (W64.of_int 18446744073709551615));
      buf3 <- (BArrayS.set64d buf3 offset t3);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (i + 8)) /\ ((i + 8) <= 18446744073709551615)))]);
      i <- (i + 8);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
    }
    if ((0 < (lEN %% 8))) {
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ (((4 * i) + 8) <= 800)))]);
      t0 <- (BArray800.get64d st (4 * i));
      b_param_2 <- b_buf0;
      param_18 <- buf0;
      param_17 <- offset;
      param_16 <- 0;
      param_15 <- (lEN %% 8);
      param_14 <- t0;
      (result_10, b_result_2, result_9, result_8, tmp__trace) <@ __awrite_subu64 (
      param_18, b_param_2, param_17, param_16, param_15, param_14);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++ tmp__trace);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((result_9 =
        (param_16 +
        ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                     param_15 : 8)))) /\
       (result_8 =
       (param_15 -
       ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                    param_15 : 8))))))]);
      b_buf0 <- b_result_2;
      buf0 <- result_10;
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 8)) /\ (((4 * i) + 8) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 8)) /\ ((((4 * i) + 8) + 8) <= 800)))]);
      t1 <- (BArray800.get64d st ((4 * i) + 8));
      b_param_1 <- b_buf1;
      param_13 <- buf1;
      param_12 <- offset;
      param_11 <- 0;
      param_10 <- (lEN %% 8);
      param_9 <- t1;
      (result_7, b_result_1, result_6, result_5, tmp__trace) <@ __awrite_subu64 (
      param_13, b_param_1, param_12, param_11, param_10, param_9);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++ tmp__trace);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((result_6 =
        (param_11 +
        ((((param_10 < 8) ? param_10 : 8) < 0) ? 0 : ((param_10 < 8) ? 
                                                     param_10 : 8)))) /\
       (result_5 =
       (param_10 -
       ((((param_10 < 8) ? param_10 : 8) < 0) ? 0 : ((param_10 < 8) ? 
                                                    param_10 : 8))))))]);
      b_buf1 <- b_result_1;
      buf1 <- result_7;
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 16)) /\ (((4 * i) + 16) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 16)) /\ ((((4 * i) + 16) + 8) <= 800)))]);
      t2 <- (BArray800.get64d st ((4 * i) + 16));
      b_param_0 <- b_buf2;
      param_8 <- buf2;
      param_7 <- offset;
      param_6 <- 0;
      param_5 <- (lEN %% 8);
      param_4 <- t2;
      (result_4, b_result_0, result_3, result_2, tmp__trace) <@ __awrite_subu64 (
      param_8, b_param_0, param_7, param_6, param_5, param_4);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++ tmp__trace);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((result_3 =
        (param_6 +
        ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? param_5 : 8)))) /\
       (result_2 =
       (param_5 -
       ((((param_5 < 8) ? param_5 : 8) < 0) ? 0 : ((param_5 < 8) ? param_5 : 8))))))]);
      b_buf2 <- b_result_0;
      buf2 <- result_4;
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 24)) /\ (((4 * i) + 24) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 24)) /\ ((((4 * i) + 24) + 8) <= 800)))]);
      t3 <- (BArray800.get64d st ((4 * i) + 24));
      b_param <- b_buf3;
      param_3 <- buf3;
      param_2 <- offset;
      param_1 <- 0;
      param_0 <- (lEN %% 8);
      param <- t3;
      (result_1, b_result, result_0, result, tmp__trace) <@ __awrite_subu64 (
      param_3, b_param, param_2, param_1, param_0, param);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++ tmp__trace);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((result_0 =
        (param_1 +
        ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8)))) /\
       (result =
       (param_0 -
       ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8))))))]);
      b_buf3 <- b_result;
      buf3 <- result_1;
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert, ((0 <= (lEN %% 8)) /\ ((lEN %% 8) <= 18446744073709551615)))]);
      trace___dumpstate_array_avx2x4 <-
      (trace___dumpstate_array_avx2x4 ++
      [(Assert,
       ((0 <= (offset + (lEN %% 8))) /\
       ((offset + (lEN %% 8)) <= 18446744073709551615)))]);
      offset <- (offset + (lEN %% 8));
    } else {
      
    }
    return (buf0, b_buf0, buf1, b_buf1, buf2, b_buf2, buf3, b_buf3, offset,
           trace___dumpstate_array_avx2x4);
  }
  proc __squeeze_array_avx2x4 (buf0:BArrayS.t, b_buf0:BArrayS.t,
                                        buf1:BArrayS.t, b_buf1:BArrayS.t,
                                        buf2:BArrayS.t, b_buf2:BArrayS.t,
                                        buf3:BArrayS.t, b_buf3:BArrayS.t,
                                        offset:int, lEN:int, st:BArray800.t,
                                        b_st:BArray800.t, rATE8:int) : 
  BArrayS.t * BArrayS.t * BArrayS.t * BArrayS.t * BArrayS.t *
  BArrayS.t * BArrayS.t * BArrayS.t * int * BArray800.t * BArray800.t *
  trace = {
    var iTERS:int;
    var lO:int;
    var i:int;
    var param:BArray800.t;
    var param_0:int;
    var param_1:int;
    var param_2:BArrayS.t;
    var param_3:BArrayS.t;
    var param_4:BArrayS.t;
    var param_5:BArrayS.t;
    var result:int;
    var result_0:BArrayS.t;
    var result_1:BArrayS.t;
    var result_2:BArrayS.t;
    var result_3:BArrayS.t;
    var param_6:BArray800.t;
    var result_4:BArray800.t;
    var param_7:BArray800.t;
    var param_8:int;
    var param_9:int;
    var param_10:BArrayS.t;
    var param_11:BArrayS.t;
    var param_12:BArrayS.t;
    var param_13:BArrayS.t;
    var result_5:int;
    var result_6:BArrayS.t;
    var result_7:BArrayS.t;
    var result_8:BArrayS.t;
    var result_9:BArrayS.t;
    var param_14:BArray800.t;
    var result_10:BArray800.t;
    var b_result:BArrayS.t;
    var b_result_0:BArrayS.t;
    var b_result_1:BArrayS.t;
    var b_result_2:BArrayS.t;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_param_1:BArrayS.t;
    var b_param_2:BArrayS.t;
    var b_result_3:BArray800.t;
    var b_result_4:BArrayS.t;
    var b_result_5:BArrayS.t;
    var b_result_6:BArrayS.t;
    var b_result_7:BArrayS.t;
    var b_param_3:BArrayS.t;
    var b_param_4:BArrayS.t;
    var b_param_5:BArrayS.t;
    var b_param_6:BArrayS.t;
    var b_result_8:BArray800.t;
    var trace___squeeze_array_avx2x4:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_param_3 <- witness;
    b_param_4 <- witness;
    b_param_5 <- witness;
    b_param_6 <- witness;
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
    param <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    param_10 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    param_13 <- witness;
    param_14 <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_3 <- witness;
    result_4 <- witness;
    result_6 <- witness;
    result_7 <- witness;
    result_8 <- witness;
    result_9 <- witness;
    result_10 <- witness;
    trace___squeeze_array_avx2x4 <- [];
    trace___squeeze_array_avx2x4 <-
    (trace___squeeze_array_avx2x4 ++
    [(Assert,
     (((0 <= lEN) /\ (lEN <= 18446744073709551615)) /\
     (((0 <= (offset + lEN)) /\ ((offset + lEN) <= 18446744073709551615)) /\
     ((((((0 <= offset) /\ (0 <= lEN)) /\ (is_init b_st 0 800)) /\
       ((offset + lEN) <= size)) /\
      (0 < rATE8)) /\
     (rATE8 < 200)))))]);
    trace___squeeze_array_avx2x4 <-
    (trace___squeeze_array_avx2x4 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    iTERS <- (lEN %/ rATE8);
    lO <- (lEN %% rATE8);
    if ((0 < lEN)) {
      if ((0 < iTERS)) {
        i <- 0;
        trace___squeeze_array_avx2x4 <-
        (trace___squeeze_array_avx2x4 ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
        while ((i < iTERS)) {
          param_14 <- st;
          (result_10, b_result_8, tmp__trace) <@ _keccakf1600_avx2x4 (
          param_14, (BArray800.init_arr (W8.of_int 255) 800));
          trace___squeeze_array_avx2x4 <-
          (trace___squeeze_array_avx2x4 ++ tmp__trace);
          trace___squeeze_array_avx2x4 <-
          (trace___squeeze_array_avx2x4 ++
          [(Assert, (is_init b_result_8 0 800))]);
          st <- result_10;
          b_param_6 <- b_buf0;
          param_13 <- buf0;
          b_param_5 <- b_buf1;
          param_12 <- buf1;
          b_param_4 <- b_buf2;
          param_11 <- buf2;
          b_param_3 <- b_buf3;
          param_10 <- buf3;
          param_9 <- offset;
          param_8 <- rATE8;
          param_7 <- st;
          (result_9, b_result_7, result_8, b_result_6, result_7, b_result_5,
          result_6, b_result_4, result_5, tmp__trace) <@ __dumpstate_array_avx2x4 (
          param_13, b_param_6, param_12, b_param_5, param_11, b_param_4,
          param_10, b_param_3, param_9, param_8, param_7,
          (BArray800.init_arr (W8.of_int 255) 800));
          trace___squeeze_array_avx2x4 <-
          (trace___squeeze_array_avx2x4 ++ tmp__trace);
          trace___squeeze_array_avx2x4 <-
          (trace___squeeze_array_avx2x4 ++
          [(Assert,
           (((0 <= param_8) /\ (param_8 <= 18446744073709551615)) /\
           (((0 <= (param_9 + param_8)) /\
            ((param_9 + param_8) <= 18446744073709551615)) /\
           (result_5 = (param_9 + param_8)))))]);
          trace___squeeze_array_avx2x4 <-
          (trace___squeeze_array_avx2x4 ++
          [(Assert, ((0 <= result_5) /\ (result_5 <= 18446744073709551615)))]);
          b_buf0 <- b_result_7;
          buf0 <- result_9;
          b_buf1 <- b_result_6;
          buf1 <- result_8;
          b_buf2 <- b_result_5;
          buf2 <- result_7;
          b_buf3 <- b_result_4;
          buf3 <- result_6;
          offset <- result_5;
          trace___squeeze_array_avx2x4 <-
          (trace___squeeze_array_avx2x4 ++
          [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
          i <- (i + 1);
          trace___squeeze_array_avx2x4 <-
          (trace___squeeze_array_avx2x4 ++
          [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
        }
      } else {
        
      }
      if ((0 < lO)) {
        param_6 <- st;
        (result_4, b_result_3, tmp__trace) <@ _keccakf1600_avx2x4 (
        param_6, (BArray800.init_arr (W8.of_int 255) 800));
        trace___squeeze_array_avx2x4 <-
        (trace___squeeze_array_avx2x4 ++ tmp__trace);
        trace___squeeze_array_avx2x4 <-
        (trace___squeeze_array_avx2x4 ++
        [(Assert, (is_init b_result_3 0 800))]);
        st <- result_4;
        b_param_2 <- b_buf0;
        param_5 <- buf0;
        b_param_1 <- b_buf1;
        param_4 <- buf1;
        b_param_0 <- b_buf2;
        param_3 <- buf2;
        b_param <- b_buf3;
        param_2 <- buf3;
        param_1 <- offset;
        param_0 <- lO;
        param <- st;
        (result_3, b_result_2, result_2, b_result_1, result_1, b_result_0,
        result_0, b_result, result, tmp__trace) <@ __dumpstate_array_avx2x4 (
        param_5, b_param_2, param_4, b_param_1, param_3, b_param_0, param_2,
        b_param, param_1, param_0, param,
        (BArray800.init_arr (W8.of_int 255) 800));
        trace___squeeze_array_avx2x4 <-
        (trace___squeeze_array_avx2x4 ++ tmp__trace);
        trace___squeeze_array_avx2x4 <-
        (trace___squeeze_array_avx2x4 ++
        [(Assert,
         (((0 <= param_0) /\ (param_0 <= 18446744073709551615)) /\
         (((0 <= (param_1 + param_0)) /\
          ((param_1 + param_0) <= 18446744073709551615)) /\
         (result = (param_1 + param_0)))))]);
        trace___squeeze_array_avx2x4 <-
        (trace___squeeze_array_avx2x4 ++
        [(Assert, ((0 <= result) /\ (result <= 18446744073709551615)))]);
        b_buf0 <- b_result_2;
        buf0 <- result_3;
        b_buf1 <- b_result_1;
        buf1 <- result_2;
        b_buf2 <- b_result_0;
        buf2 <- result_1;
        b_buf3 <- b_result;
        buf3 <- result_0;
        offset <- result;
      } else {
        
      }
    } else {
      
    }
    b_st <- (BArray800.init_arr (W8.of_int 255) 800);
    return (buf0, b_buf0, buf1, b_buf1, buf2, b_buf2, buf3, b_buf3, offset,
           st, b_st, trace___squeeze_array_avx2x4);
  }
}.

(* The post and trace are valid. *)

lemma keccakf1600_index_trace _x _y :
      hoare [M.keccakf1600_index :
      (((_y = y) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].
proof.
proc; inline *; auto .
qed .

lemma keccakf1600_rho_offsets_trace _i :
      hoare [M.keccakf1600_rho_offsets :
      ((_i = i) /\ true) ==> (true /\ (valid res.`2))].
proof.
proc; inline *; auto; while(true); auto .
qed .

lemma keccakf1600_rhotates_trace _x _y :
      hoare [M.keccakf1600_rhotates :
      (((_y = y) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].
proof.
proc; inline *; auto . while(true); auto.
qed .

lemma __keccakf1600_pround_avx2_trace _state _b_state :
      hoare [M.__keccakf1600_pround_avx2 :
      (((_b_state = b_state) /\ (_state = state)) /\
      (is_init _b_state 0 224)) ==>
      ((is_init res.`2 0 224) /\ (valid res.`3))].
proof.
  proc. rewrite /=. wp -1.
  seq 2: (valid trace___keccakf1600_pround_avx2). by auto.
  conseq (:true). smt(BArray224.init_arrP).
  by auto.
qed.

lemma _keccakf1600_avx2_trace _state _b_state :
      hoare [M._keccakf1600_avx2 :
      (((_b_state = b_state) /\ (_state = state)) /\
      (is_init _b_state 0 224)) ==>
      ((is_init res.`2 0 224) /\ (valid res.`3))].
proof.
proc; auto .
while ((valid trace__keccakf1600_avx2) /\ is_init b_state 0 224 /\ 0 <=  r).
auto .
ecall (__keccakf1600_pround_avx2_trace param ( BArray224.init_arr (W8.of_int 255) 224)).
auto .
rewrite /is_init /valid /=.
smt (all_cat BArray224.init_arrP ).
auto .
ecall (__keccakf1600_pround_avx2_trace param ( BArray224.init_arr (W8.of_int 255) 224)).
auto .
rewrite /is_init /valid /= .
smt (all_cat  BArray224.init_arrP).
qed .

lemma __u64_to_u256_trace _x _l :
      hoare [M.__u64_to_u256 :
      (((_l = l) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].
proof.
proc; inline *; auto .
qed .

lemma __state_init_avx2_trace  :
      hoare [M.__state_init_avx2 :
      (true /\ true) ==> ((is_init res.`2 0 224) /\ (valid res.`3))].
proof.
proc; auto .
while ((valid trace___state_init_avx2) /\  (((0 <= i) /\ (i <= 7)) /\
                                           (is_init b_st 0 (32 * i)))).
auto .
rewrite /is_init /valid /=.
smt (all_cat).
auto .
rewrite /is_init /valid /= .
smt (all_cat).
qed .

lemma __pstate_init_avx2_trace _pst _b_pst :
      hoare [M.__pstate_init_avx2 :
      (((_b_pst = b_pst) /\ (_pst = pst)) /\ true) ==>
      (((is_init res.`2 0 200) /\ (is_init res.`4 0 224)) /\ (valid res.`5))].
proof.
proc; auto .
ecall (__state_init_avx2_trace).
auto .
while ((valid trace___pstate_init_avx2) /\  (((0 <= i) /\ (i <= 6)) /\
                                            (is_init b_pst 0 (32 * i)))).
auto .
rewrite /is_init /valid /=.
smt (all_cat).
auto .
rewrite /is_init /valid /= .
smt (all_cat BArray224.init_arrP).
qed .

lemma __perm_reg3456_avx2_trace _r3 _r4 _r5 _r6 :
      hoare [M.__perm_reg3456_avx2 :
      (((_r6 = r6) /\ ((_r5 = r5) /\ ((_r4 = r4) /\ (_r3 = r3)))) /\ true) ==>
      (true /\ (valid res.`5))].
proof.
proc; inline *; auto .
qed .

lemma __state_from_pstate_avx2_trace _pst _b_pst :
      hoare [M.__state_from_pstate_avx2 :
      (((_b_pst = b_pst) /\ (_pst = pst)) /\ (is_init _b_pst 0 200)) ==>
      ((is_init res.`2 0 224) /\ (valid res.`3))].
proof.
proc; auto .
ecall (__perm_reg3456_avx2_trace param_2 param_1 param_0 param).
auto .
rewrite /is_init /valid /= .
smt (all_cat).
qed .

lemma __addstate_r3456_avx2_trace _st _b_st _r3 _r4 _r5 _r6 :
      hoare [M.__addstate_r3456_avx2 :
      (((_r6 = r6) /\
       ((_r5 = r5) /\
       ((_r4 = r4) /\ ((_r3 = r3) /\ ((_b_st = b_st) /\ (_st = st)))))) /\
      (is_init _b_st 0 224)) ==> ((is_init res.`2 0 224) /\ (valid res.`3))].
proof.
proc; auto .
ecall (__perm_reg3456_avx2_trace param_2 param_1 param_0 param).
auto .
rewrite /is_init /valid /= .
smt (all_cat BArray224.init_arrP).
qed .

lemma __addpst01_avx2_trace _st _b_st _pst _b_pst :
      hoare [M.__addpst01_avx2 :
      (((_b_pst = b_pst) /\ ((_pst = pst) /\ ((_b_st = b_st) /\ (_st = st)))) /\
      ((is_init _b_pst 0 200) /\ (is_init _b_st 0 224))) ==>
      ((is_init res.`2 0 224) /\ (valid res.`3))].
proof.
proc; auto .
rewrite /is_init /valid /= .
smt (all_cat BArray224.init_arrP).
qed .

lemma __addpst23456_avx2_trace _st _b_st _pst _b_pst :
      hoare [M.__addpst23456_avx2 :
      (((_b_pst = b_pst) /\ ((_pst = pst) /\ ((_b_st = b_st) /\ (_st = st)))) /\
      ((is_init _b_pst 0 200) /\ (is_init _b_st 0 224))) ==>
      ((is_init res.`2 0 224) /\ (valid res.`3))].
proof.
proc; auto .
ecall (__addstate_r3456_avx2_trace param_3 ( BArray224.init_arr (W8.of_int 255) 224) param_2 param_1 param_0 
       param).
auto .
rewrite /is_init /valid /= .
smt (all_cat BArray224.init_arrP).
qed .

lemma _addpstate_avx2_trace _st _b_st _pst _b_pst :
      hoare [M._addpstate_avx2 :
      (((_b_pst = b_pst) /\ ((_pst = pst) /\ ((_b_st = b_st) /\ (_st = st)))) /\
      ((is_init _b_pst 0 200) /\ (is_init _b_st 0 224))) ==>
      ((is_init res.`2 0 224) /\ (valid res.`3))].
proof.
proc; auto .
ecall (__addpst23456_avx2_trace param_0 (BArray224.init_arr (W8.of_int 255) 224) param (BArray200.init_arr (W8.of_int 255) 200)).
auto .
ecall (__addpst01_avx2_trace param_2 (BArray224.init_arr (W8.of_int 255) 224) param_1 ( BArray200.init_arr (W8.of_int 255) 200)).
auto .
rewrite /is_init /valid /= .
smt (all_cat  BArray224.init_arrP  BArray200.init_arrP).
qed .

lemma __stavx2_pos_avx2_trace _pOS :
      hoare [M.__stavx2_pos_avx2 :
      ((_pOS = pOS) /\ true) ==>
      (((0 <= res.`1) /\ (res.`1 < 7)) /\ (valid res.`3))].
proof.
by proc; auto .
qed .

lemma __addratebit_avx2_trace _st _b_st _rATE8 :
      hoare [M.__addratebit_avx2 :
      (((_rATE8 = rATE8) /\ ((_b_st = b_st) /\ (_st = st))) /\
      (is_init _b_st 0 224)) ==> ((is_init res.`2 0 224) /\ (valid res.`3))].
proof.
  proc; rewrite /=.
  seq 10: (#pre /\ valid trace___addratebit_avx2 /\ 0<=r /\ r < 7 ).
  + auto. ecall (__stavx2_pos_avx2_trace param_1).
    auto. smt(all_cat).
  if .
  + auto .
    rewrite /trace /is_init /valid /=.
    smt (all_cat BArray224.init_arrP).
  auto .
  ecall (__u64_to_u256_trace param_0 param).
  auto .
  rewrite /trace /is_init /valid /=.
  smt (all_cat BArray224.init_arrP).
qed .

lemma keccakf1600_4x_theta_sum_trace _a _b_a :
      hoare [M.keccakf1600_4x_theta_sum :
      (((_b_a = b_a) /\ (_a = a)) /\ (is_init _b_a 0 800)) ==>
      ((is_init res.`2 0 160) /\ (valid res.`3))].
proof.
proc;auto.
  while(is_init b_c 0 (32*5) /\ 0<=y /\ is_init b_a 0 800 /\ valid trace_keccakf1600_4x_theta_sum).
  + auto.
    while(is_init b_c 0 (32*5) /\ 0<=y /\ is_init b_a 0 800 /\
          valid trace_keccakf1600_4x_theta_sum /\ 0<=x  /\ y<5);
    auto; rewrite /is_init /valid  /=; smt(all_cat).
  auto.
  while(is_init b_c 0 (32*x) /\ 0<=x /\ x<=5 /\  is_init b_a 0 800 /\ valid trace_keccakf1600_4x_theta_sum);
  auto; rewrite /is_init  /valid /=; smt(all_cat).
qed .

lemma keccakf1600_4x_rol_trace _a _b_a _x _r _r8 _r56 :
      hoare [M.keccakf1600_4x_rol :
      (((_r56 = r56) /\
       ((_r8 = r8) /\ ((_r = r) /\ ((_x = x) /\ ((_b_a = b_a) /\ (_a = a)))))) /\
      (((is_init _b_a (_x * 32) 32) /\ (0 <= _x)) /\ (_x < 5))) ==>
      ((foldr (fun x => (fun acc => (x /\ acc))) true
       (map (fun k => ((is_init res.`2 k 1) = (is_init _b_a k 1)))
       (iota_ 0 160))) /\
      (valid res.`3))].
proof.
proc; auto .
rewrite /is_init /valid /= .
smt (all_cat and_iota).
qed .

lemma keccakf1600_4x_theta_rol_trace _c _b_c _r8 _r56 :
      hoare [M.keccakf1600_4x_theta_rol :
      (((_r56 = r56) /\ ((_r8 = r8) /\ ((_b_c = b_c) /\ (_c = c)))) /\
      (is_init _b_c 0 160)) ==> ((is_init res.`2 0 160) /\ (valid res.`3))].
proof.
  proc; auto.
  while (is_init b_c 0 160 /\ is_init b_d 0 (x*32) /\ 0<=x /\ x<=5 /\ valid  trace_keccakf1600_4x_theta_rol).
  + auto. ecall (keccakf1600_4x_rol_trace param_3 b_param param_2 param_1 param_0 param).
    auto . rewrite /is_init /valid /= => &m /> *. smt(all_cat and_iota).
auto .
rewrite /is_init /valid /= .
smt (all_cat).
qed .

lemma keccakf1600_4x_rol_sum_trace _a _b_a _d _b_d _y _r8 _r56 :
      hoare [M.keccakf1600_4x_rol_sum :
      (((_r56 = r56) /\
       ((_r8 = r8) /\
       ((_y = y) /\
       ((_b_d = b_d) /\ ((_d = d) /\ ((_b_a = b_a) /\ (_a = a))))))) /\
      ((((is_init _b_a 0 800) /\ (is_init _b_d 0 160)) /\ (0 <= _y)) /\
      (_y < 5))) ==> ((is_init res.`2 0 160) /\ (valid res.`3))].
proof.
  proc; auto .
  while(is_init b_b 0 (x*32) /\ 0 <= x /\ x <= 5 /\ valid trace_keccakf1600_4x_rol_sum).
  + seq 17: (is_init b_b 0 ((x+1)*32) /\ 0 <= x /\ x < 5 /\ valid trace_keccakf1600_4x_rol_sum).
    + auto . ecall (keccakf1600_rhotates_trace param_5 param_4). auto. 
      rewrite /is_init /valid /= .
      smt (all_cat).
    if .
    + auto . ecall (keccakf1600_4x_rol_trace param_3 b_param param_2 param_1 param_0 param).
      auto . rewrite /is_init /valid /= => &m /> *.
      smt (all_cat and_iota).
    auto .
    rewrite /is_init /valid /=.
    smt (all_cat).
auto .
rewrite /is_init /valid /=.
smt (all_cat).
qed .

lemma keccakf1600_4x_set_row_trace _e _b_e _b _b_b _y _rc :
      hoare [M.keccakf1600_4x_set_row :
      (((_rc = rc) /\
       ((_y = y) /\
       ((_b_b = b_b) /\ ((_b = b) /\ ((_b_e = b_e) /\ (_e = e)))))) /\
      (((is_init _b_b 0 160) /\ (0 <= _y)) /\ (_y < 5))) ==>
      ((foldr (fun x => (fun acc => (x /\ acc))) true
       (map
       (fun k =>
       ((is_init res.`2 k 1) =
       ((is_init _b_e k 1) \/
       ((((_y * 5) * 32) <= k) /\ (k < (((_y + 1) * 5) * 32))))))
       (iota_ 0 800))) /\
      (valid res.`3))].
proof.
  proc;auto.
  while(is_init b_e (32*y*5) (32*x) /\ 0 <= x /\ x <= 5 /\ valid trace_keccakf1600_4x_set_row /\ 0<=y /\ y<5 /\ forall k, (k < (32*y*5) \/ (32*(y+1)*5) <= k) => is_init b_e k 1 = is_init _b_e k 1).
  + auto. rewrite /is_init /valid /trace /=. smt(all_cat).
  auto. rewrite /is_init /valid /trace /= => &m /> *.
  smt(and_iota).
qed .

lemma _keccakf1600_4x_round_trace _e _b_e _a _b_a _rc _r8 _r56 :
      hoare [M._keccakf1600_4x_round :
      (((_r56 = r56) /\
       ((_r8 = r8) /\
       ((_rc = rc) /\
       ((_b_a = b_a) /\ ((_a = a) /\ ((_b_e = b_e) /\ (_e = e))))))) /\
      (is_init _b_a 0 800)) ==> ((is_init res.`2 0 800) /\ (valid res.`3))].
proof.
  proc; auto .
  while(is_init b_e 0 (y*160) /\ 0<=y /\ y<=5 /\ valid  trace__keccakf1600_4x_round).
  + auto . ecall (keccakf1600_4x_set_row_trace param_2 b_param param_1 (BArray160.init_arr (W8.of_int 255) 160) param_0 param). auto.
    ecall (keccakf1600_4x_rol_sum_trace param_7 (BArray800.init_arr (W8.of_int 255) 800) param_6 (BArray160.init_arr (W8.of_int 255) 160) param_5 param_4 param_3). auto .
    rewrite /is_init /valid /= => &m /> *.
    smt (all_cat and_iota BArray800.init_arrP BArray160.init_arrP).
  auto .
  ecall (keccakf1600_4x_theta_rol_trace param_10 (BArray160.init_arr (W8.of_int 255) 160) param_9 param_8).
  auto .
  ecall (keccakf1600_4x_theta_sum_trace param_11 (BArray800.init_arr (W8.of_int 255) 800)).
  auto .
  rewrite /is_init /valid /= .
  smt (all_cat BArray800.init_arrP BArray160.init_arrP).
qed .

lemma __keccakf1600_avx2x4_trace _a _b_a :
      hoare [M.__keccakf1600_avx2x4 :
      (((_b_a = b_a) /\ (_a = a)) /\ (is_init _b_a 0 800)) ==>
      ((is_init res.`2 0 800) /\ (valid res.`3))].
proof.
proc; auto .
while ((valid trace___keccakf1600_avx2x4) /\ is_init b_a 0 800 /\ 0 <=  c /\ ( c) %% 2 = 0).
auto .
ecall (_keccakf1600_4x_round_trace param_3 b_param_0 param_2 b_param param_1 
       param_0 param).
auto .
ecall (_keccakf1600_4x_round_trace param_8 b_param_1 param_7 (BArray800.init_arr (W8.of_int 255) 800)
       param_6 param_5 param_4).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (all_cat BArray800.init_arrP).
auto . smt(BArray800.init_arrP).
qed .

lemma _keccakf1600_avx2x4_trace _a _b_a :
      hoare [M._keccakf1600_avx2x4 :
      (((_b_a = b_a) /\ (_a = a)) /\ (is_init _b_a 0 800)) ==>
      ((is_init res.`2 0 800) /\ (valid res.`3))].
proof.
proc; auto .
ecall (__keccakf1600_avx2x4_trace param (BArray800.init_arr (W8.of_int 255) 800)).
auto . smt(all_cat BArray800.init_arrP).
qed .

lemma __state_init_avx2x4_trace _st _b_st :
      hoare [M.__state_init_avx2x4 :
      (((_b_st = b_st) /\ (_st = st)) /\ true) ==>
      ((is_init res.`2 0 800) /\ (valid res.`3))].
proof.
proc; auto .
while ((valid trace___state_init_avx2x4) /\  ((((0 <= i) /\ (i <= 800)) /\
                                              ((i %% 32) = 0)) /\
                                             (is_init b_st 0 i))).
auto .
rewrite /is_init /valid /=.
smt (all_cat).
auto .
rewrite /is_init /valid /= .
smt (all_cat).
qed .

lemma __addratebit_avx2x4_trace _st _b_st _rATE8 :
      hoare [M.__addratebit_avx2x4 :
      (((_rATE8 = rATE8) /\ ((_b_st = b_st) /\ (_st = st))) /\
      (((is_init _b_st 0 800) /\ (0 < _rATE8)) /\ (_rATE8 < 200))) ==>
      ((is_init res.`2 0 800) /\ (valid res.`3))].
proof.
proc; auto .
rewrite /is_init /valid /= .
smt (all_cat BArray800.init_arrP).
qed .

lemma __4u64x4_u256x4_trace _y0 _y1 _y2 _y3 :
      hoare [M.__4u64x4_u256x4 :
      (((_y3 = y3) /\ ((_y2 = y2) /\ ((_y1 = y1) /\ (_y0 = y0)))) /\ true) ==>
      (true /\ (valid res.`5))].
proof.
proc; inline * ; auto .
qed .

lemma __aread_subu64_trace _buf _b_buf _offset _dELTA _lEN _tRAIL :
      hoare [M.__aread_subu64 :
      (((_tRAIL = tRAIL) /\
       ((_lEN = lEN) /\
       ((_dELTA = dELTA) /\
       ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAIL) /\ (_tRAIL < 256)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
       (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
      (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
       (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <=
       18446744073709551615)) /\
      ((0 < _lEN) ? ((((is_init _b_buf (_offset + _dELTA)
                       ((_lEN < 8) ? _lEN : 8)) /\
                      (0 <= _dELTA)) /\
                     (0 <= (_offset + _dELTA))) /\
                    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= size)) : true)))))))))))) ==>
      ((((res.`1 =
         (_dELTA +
         ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
        (res.`2 =
        (_lEN -
        ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))) /\
       (res.`3 = ((8 <= _lEN) ? _tRAIL : 0))) /\
      (valid res.`5))].
proof. 
proc; auto .
rewrite /is_init /valid /= .
smt (all_cat).
qed .


lemma __aread_bcast_4subu64_trace _buf _b_buf _offset _dELTA _lEN _tRAIL :
      hoare [M.__aread_bcast_4subu64 :
      (((_tRAIL = tRAIL) /\
       ((_lEN = lEN) /\
       ((_dELTA = dELTA) /\
       ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAIL) /\ (_tRAIL < 256)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
       (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
      (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
       (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <=
       18446744073709551615)) /\
      ((0 < _lEN) ? ((((is_init _b_buf (_offset + _dELTA)
                       ((_lEN < 8) ? _lEN : 8)) /\
                      (0 <= _dELTA)) /\
                     (0 <= (_offset + _dELTA))) /\
                    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= size)) : true)))))))))))) ==>
      ((((res.`1 =
         (_dELTA +
         ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
        (res.`2 =
        (_lEN -
        ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))) /\
       (res.`3 = ((8 <= _lEN) ? _tRAIL : 0))) /\
      (valid res.`5))].
proof.
proc; auto . sp.
if .
auto .
rewrite /is_init /valid /=.
smt (all_cat).
auto .
if .
auto .
rewrite /is_init /valid /=.
smt (all_cat).
auto .
ecall (__aread_subu64_trace param_3 b_param param_2 param_1 param_0 
       param).
auto .
rewrite /is_init /valid /=.
smt (all_cat).
qed .

lemma __aread_subu128_trace _buf _b_buf _offset _dELTA _lEN _tRAIL :
      hoare [M.__aread_subu128 :
      (((_tRAIL = tRAIL) /\
       ((_lEN = lEN) /\
       ((_dELTA = dELTA) /\
       ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAIL) /\ (_tRAIL < 256)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= ((_lEN < 16) ? _lEN : 16)) /\
       (((_lEN < 16) ? _lEN : 16) <= 18446744073709551615)) /\
      (((0 <= ((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16))) /\
       (((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16)) <=
       18446744073709551615)) /\
      ((0 < _lEN) ? ((((is_init _b_buf (_offset + _dELTA)
                       ((_lEN < 16) ? _lEN : 16)) /\
                      (0 <= _dELTA)) /\
                     (0 <= (_offset + _dELTA))) /\
                    (((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16)) <= size)) : true)))))))))))) ==>
      ((((res.`1 =
         (_dELTA +
         ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)))) /\
        (res.`2 =
        (_lEN -
        ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16))))) /\
       (res.`3 = ((16 <= _lEN) ? _tRAIL : 0))) /\
      (valid res.`5))].
 proof.
 proc; auto . sp.
if .
auto .
rewrite /is_init /valid /=.
smt (all_cat).
auto .
if .
auto .
rewrite /is_init /valid /=.
smt (all_cat).
auto .
if .
auto .
ecall (__aread_subu64_trace param_3 b_param param_2 param_1 param_0 
       param).
auto .
rewrite /is_init /valid /=.
smt (all_cat).
auto .
ecall (__aread_subu64_trace param_8 b_param_0 param_7 param_6 param_5 
       param_4).
auto .
rewrite /is_init /valid /=.
smt (all_cat).
qed . 

lemma __aread_subu256_trace _buf _b_buf _offset _dELTA _lEN _tRAIL :
      hoare [M.__aread_subu256 :
      (((_tRAIL = tRAIL) /\
       ((_lEN = lEN) /\
       ((_dELTA = dELTA) /\
       ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAIL) /\ (_tRAIL < 256)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= ((_lEN < 32) ? _lEN : 32)) /\
       (((_lEN < 32) ? _lEN : 32) <= 18446744073709551615)) /\
      (((0 <= ((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32))) /\
       (((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32)) <=
       18446744073709551615)) /\
      ((0 < _lEN) ? ((((is_init _b_buf (_offset + _dELTA)
                       ((_lEN < 32) ? _lEN : 32)) /\
                      (0 <= _dELTA)) /\
                     (0 <= (_offset + _dELTA))) /\
                    (((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32)) <= size)) : true)))))))))))) ==>
      ((((res.`1 =
         (_dELTA +
         ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)))) /\
        (res.`2 =
        (_lEN -
        ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32))))) /\
       (res.`3 = ((32 <= _lEN) ? _tRAIL : 0))) /\
      (valid res.`5))].
proof.
proc; auto . sp.
if .
auto .
rewrite /is_init /valid /=.
smt (all_cat).
auto .
if .
auto .
rewrite /is_init /valid /=.
smt (all_cat).
auto .
if .
auto .
ecall (__aread_subu128_trace param_3 b_param param_2 param_1 param_0 
       param).
auto .
rewrite /is_init /valid /=.
smt (all_cat).
auto .
ecall (__aread_subu128_trace param_8 b_param_0 param_7 param_6 param_5 
       param_4).
auto .
rewrite /is_init /valid /=.
smt (all_cat).
qed .


lemma __awrite_subu64_trace _buf _b_buf _offset _dELTA _lEN _w :
      hoare [M.__awrite_subu64 :
      (((_w = w) /\
       ((_lEN = lEN) /\
       ((_dELTA = dELTA) /\
       ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= ((_lEN < 8) ? _lEN : 8)) /\
       (((_lEN < 8) ? _lEN : 8) <= 18446744073709551615)) /\
      (((0 <= ((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8))) /\
       (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <=
       18446744073709551615)) /\
      ((0 < _lEN) ? (((0 <= (_offset + _dELTA)) /\ (0 <= _dELTA)) /\
                    (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= size)) : true))))))))) ==>
      ((((foldr (fun x => (fun acc => (x /\ acc))) true
         (map
         (fun k =>
         (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
         (((0 <= (_offset + _dELTA)) /\
          ((_offset + _dELTA) <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
         (((0 <= (_offset + _dELTA)) /\
          ((_offset + _dELTA) <= 18446744073709551615)) /\
         (((0 <=
           ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) /\
          (((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)) <=
          18446744073709551615)) /\
         ((0 <=
          ((_offset + _dELTA) +
          ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
         (((_offset + _dELTA) +
          ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) <=
         18446744073709551615)))))))))) (iota_ 0 size))) /\
        (foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        ((is_init res.`2 k 1) =
        ((is_init _b_buf k 1) \/
        (((_offset + _dELTA) <= k) /\
        (k <
        ((_offset + _dELTA) +
        ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))))))
        (iota_ 0 size)))) /\
       ((res.`3 =
        (_dELTA +
        ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
       (res.`4 =
       (_lEN - ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))))) /\
      (valid res.`5))].
proof.
proc;auto .
rewrite /is_init /valid /=. smt(inbounds_size and_iota all_cat).
qed.


lemma __awrite_subu128_trace _buf _b_buf _offset _dELTA _lEN _w :
      hoare [M.__awrite_subu128 :
      (((_w = w) /\
       ((_lEN = lEN) /\
       ((_dELTA = dELTA) /\
       ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= ((_lEN < 16) ? _lEN : 16)) /\
       (((_lEN < 16) ? _lEN : 16) <= 18446744073709551615)) /\
      (((0 <= ((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16))) /\
       (((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16)) <=
       18446744073709551615)) /\
      ((0 < _lEN) ? (((0 <= (_offset + _dELTA)) /\ (0 <= _dELTA)) /\
                    (((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16)) <= size)) : true))))))))) ==>
      ((((foldr (fun x => (fun acc => (x /\ acc))) true
         (map
         (fun k =>
         (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
         (((0 <= (_offset + _dELTA)) /\
          ((_offset + _dELTA) <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
         (((0 <= (_offset + _dELTA)) /\
          ((_offset + _dELTA) <= 18446744073709551615)) /\
         (((0 <=
           ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16))) /\
          (((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)) <=
          18446744073709551615)) /\
         ((0 <=
          ((_offset + _dELTA) +
          ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)))) /\
         (((_offset + _dELTA) +
          ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16))) <=
         18446744073709551615)))))))))) (iota_ 0 size))) /\
        (foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        ((is_init res.`2 k 1) =
        ((is_init _b_buf k 1) \/
        (((_offset + _dELTA) <= k) /\
        (k <
        ((_offset + _dELTA) +
        ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16))))))))
        (iota_ 0 size)))) /\
       ((res.`3 =
        (_dELTA +
        ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)))) /\
       (res.`4 =
       (_lEN -
       ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)))))) /\
      (valid res.`5))].
proof. 
proc; rewrite /=.
  seq 7: (#pre /\ valid trace___awrite_subu128). by auto.
  if.
  + if.
    + auto.  move => &m />.
      smt(inbounds_size all_cat and_iota). 
    auto. ecall (__awrite_subu64_trace param_3 b_param param_2 param_1 param_0 param). auto.
    move => &m />.  rewrite  /is_init /valid /=. move => *.
    smt(inbounds_size all_cat and_iota).
  auto. move => /> *. smt(inbounds_size all_cat and_iota).
qed.



lemma __awrite_subu256_trace _buf _b_buf _offset _dELTA _lEN _w :
      hoare [M.__awrite_subu256 :
      (((_w = w) /\
       ((_lEN = lEN) /\
       ((_dELTA = dELTA) /\
       ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
      (((0 <= (_offset + _dELTA)) /\
       ((_offset + _dELTA) <= 18446744073709551615)) /\
      (((0 <= ((_lEN < 32) ? _lEN : 32)) /\
       (((_lEN < 32) ? _lEN : 32) <= 18446744073709551615)) /\
      (((0 <= ((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32))) /\
       (((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32)) <=
       18446744073709551615)) /\
      ((0 < _lEN) ? (((0 <= (_offset + _dELTA)) /\ (0 <= _dELTA)) /\
                    (((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32)) <= size)) : true))))))))) ==>
      ((((foldr (fun x => (fun acc => (x /\ acc))) true
         (map
         (fun k =>
         (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
         (((0 <= (_offset + _dELTA)) /\
          ((_offset + _dELTA) <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
         (((0 <= (_offset + _dELTA)) /\
          ((_offset + _dELTA) <= 18446744073709551615)) /\
         (((0 <=
           ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32))) /\
          (((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)) <=
          18446744073709551615)) /\
         ((0 <=
          ((_offset + _dELTA) +
          ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)))) /\
         (((_offset + _dELTA) +
          ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32))) <=
         18446744073709551615)))))))))) (iota_ 0 size))) /\
        (foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        ((is_init res.`2 k 1) =
        ((is_init _b_buf k 1) \/
        (((_offset + _dELTA) <= k) /\
        (k <
        ((_offset + _dELTA) +
        ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32))))))))
        (iota_ 0 size)))) /\
       ((res.`3 =
        (_dELTA +
        ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)))) /\
       (res.`4 =
       (_lEN -
       ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)))))) /\
      (valid res.`5))].
proof. 
proc; auto . sp.
if .
auto .
if .
auto .
rewrite /is_init /valid /=.
smt (all_cat and_iota inbounds_size).
auto .
ecall (__awrite_subu128_trace param_3 b_param param_2 param_1 param_0 
       param).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (all_cat and_iota inbounds_size).
auto .
rewrite /is_init /valid /=.
smt (all_cat and_iota inbounds_size).
qed .


lemma __addstate_array_avx2_trace _st _b_st _buf _b_buf _offset _lEN _tRAILB :
      hoare [M.__addstate_array_avx2 :
      (((_tRAILB = tRAILB) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\
       ((_b_buf = b_buf) /\ ((_buf = buf) /\ ((_b_st = b_st) /\ (_st = st))))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAILB) /\ (_tRAILB < 256)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\
       ((_offset + _lEN) <= 18446744073709551615)) /\
      ((((((0 <= _offset) /\ (0 <= _lEN)) /\ ((_offset + _lEN) <= size)) /\
        (is_init _b_buf _offset _lEN)) /\
       (is_init _b_st 0 224)) /\
      (_lEN <= 200))))))) ==>
      ((((0 <= res.`3) /\ (res.`3 <= 18446744073709551615)) /\
       (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
       (((0 <= (_offset + _lEN)) /\
        ((_offset + _lEN) <= 18446744073709551615)) /\
       ((is_init res.`2 0 224) /\ (res.`3 = (_offset + _lEN)))))) /\
      (valid res.`4))].
proof.
  proc; rewrite /= .  have:= inbounds_size => /= *.
  seq 58: ( valid trace___addstate_array_avx2 /\ 0<=_offset /\ 0<=_lEN /\ _lEN <= 200 /\
           _offset + _lEN <= size /\  _offset = offset /\ dELTA = (if _lEN < 40 then _lEN else 40) /\
           is_init b_buf (offset + dELTA) lEN /\
           lEN = (if _lEN < 40 then 0 else _lEN - 40) /\ 0<=tRAILB /\ tRAILB <256).
  + auto. ecall (__aread_subu256_trace param_48 b_param_7 param_47 param_46 param_45 param_44).
    auto. ecall (__aread_subu64_trace param_53 b_param_8 param_52 param_51 param_50 param_49).
    auto. rewrite /valid /= => &m /> *. smt(all_cat).
  if.
  + seq 27: ( valid trace___addstate_array_avx2 /\ 0<=_offset /\ 0<=_lEN /\ _lEN <= 200 /\
           _offset + _lEN <= size /\  _offset = offset /\ dELTA = (if _lEN < 80 then _lEN else 80) /\
           is_init b_buf (offset + dELTA) lEN /\
           lEN = (if _lEN < 80 then 0 else _lEN - 80) /\ 0<=tRAILB /\ tRAILB <256).
    + auto.
      ecall (__aread_subu256_trace param_38 b_param_5 param_37 param_36 param_35 param_34).
      auto .
      ecall (__aread_subu64_trace param_43 b_param_6 param_42 param_41  param_40 param_39).
      auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat).
    seq 27: ( valid trace___addstate_array_avx2 /\ 0<=_offset /\ 0<=_lEN /\ _lEN <= 200 /\
           _offset + _lEN <= size /\  _offset = offset /\dELTA = (if _lEN < 120 then _lEN else 120) /\
           is_init b_buf (offset + dELTA) lEN /\
           lEN = (if _lEN < 120 then 0 else _lEN - 120) /\ 0<=tRAILB /\ tRAILB <256).
    + auto .
      ecall (__aread_subu256_trace param_28 b_param_3 param_27 param_26 param_25 param_24).
      auto.
      ecall (__aread_subu64_trace param_33 b_param_4 param_32 param_31 param_30 param_29).
      auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat).
    seq 27: ( valid trace___addstate_array_avx2 /\ 0<=_offset /\ 0<=_lEN /\  _lEN <= 200 /\
           _offset + _lEN <= size /\  _offset = offset /\ dELTA = (if _lEN < 160 then _lEN else 160)/\
           is_init b_buf (offset + dELTA) lEN /\
           lEN = (if _lEN < 160 then 0 else _lEN - 160) /\ 0<=tRAILB /\ tRAILB <256).
    + auto.
      ecall (__aread_subu256_trace param_18 b_param_1 param_17 param_16 param_15 param_14).
      auto .
      ecall (__aread_subu64_trace param_23 b_param_2 param_22 param_21 param_20 param_19).
      auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat).
    seq 27: ( valid trace___addstate_array_avx2 /\ 0<=_offset /\ 0<=_lEN /\ _lEN <= 200 /\
           _offset + _lEN <= size /\  _offset = offset /\ dELTA =   (if _lEN < 200 then _lEN else 200) /\ 0<=tRAILB /\ tRAILB <256).
    + auto.
      ecall (__aread_subu256_trace param_8 b_param param_7 param_6 param_5 param_4).
      auto .
      ecall (__aread_subu64_trace param_13 b_param_0 param_12 param_11 param_10 param_9).
  auto . rewrite /valid /is_init /= => &m /> *. smt(all_cat).
    auto .
    ecall (__addstate_r3456_avx2_trace param_3 (BArray224.init_arr (W8.of_int 255) 224) param_2 
          param_1 param_0 param). auto. rewrite /valid /is_init /= => &m /> *.
    smt(all_cat BArray224.init_arrP).
  auto . smt(all_cat BArray224.init_arrP).
qed .


lemma __absorb_array_avx2_trace _st _b_st _buf _b_buf _offset _lEN _rATE8 _tRAILB :
      hoare [M.__absorb_array_avx2 :
      (((_tRAILB = tRAILB) /\
       ((_rATE8 = rATE8) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\
       ((_b_buf = b_buf) /\ ((_buf = buf) /\ ((_b_st = b_st) /\ (_st = st)))))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAILB) /\ (_tRAILB < 256)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\
       ((_offset + _lEN) <= 18446744073709551615)) /\
      (((((((0 <= _offset) /\ (0 <= _lEN)) /\ ((_offset + _lEN) <= size)) /\
         (0 < _rATE8)) /\
        (_rATE8 < 200)) /\
       (is_init _b_buf _offset _lEN)) /\
      (is_init _b_st 0 224))))))) ==>
      ((((0 <= res.`3) /\ (res.`3 <= 18446744073709551615)) /\
       (is_init res.`2 0 224)) /\
      (valid res.`4))].
proof.
  proc; have:= inbounds_size => /= *.
  seq 23: (valid trace___absorb_array_avx2 /\ 0 <= offset /\ 0<=lEN /\ lEN<=200 /\
   is_init b_buf offset lEN /\ offset + lEN <=size /\ 0<=tRAILB /\ tRAILB < 256).
  + sp. 
    if .
    + auto .
      while (valid trace___absorb_array_avx2 /\ 0 <= _offset /\ 0<=_lEN /\ 0 < rATE8 /\
             rATE8 <200 /\ is_init b_buf _offset _lEN /\ _offset + _lEN <=size /\
             0<=tRAILB /\ tRAILB < 256 /\ iTERS * rATE8 <= _lEN /\
             offset = _offset + i*rATE8 /\ 0 <= i /\ i<=iTERS /\ iTERS = _lEN%/rATE8).
      + auto .
        ecall (_keccakf1600_avx2_trace param_6 (BArray224.init_arr (W8.of_int 255) 224)). auto .
        ecall (__addstate_array_avx2_trace param_11 (BArray224.init_arr (W8.of_int 255) 224) 
            param_10 b_param_0 param_9 param_8 param_7). auto.
        rewrite /valid /is_init /= => &m /> *. split.
        + have ?: ( (i{m} + 1)* rATE8{m} <=  _lEN %/ rATE8{m} * rATE8{m}). smt().
          smt(BArray224.init_arrP).
        move => /> *. smt(all_cat).
      auto.  rewrite /valid /is_init /= => &m /> *.  smt(all_cat).
    auto.  rewrite /valid /is_init /= => &m /> *.  smt(all_cat).
  seq 12: ( 0<=offset /\ offset <= size /\ valid trace___absorb_array_avx2).
  + auto. 
    ecall (__addstate_array_avx2_trace param_5 (BArray224.init_arr (W8.of_int 255) 224) 
       param_4 b_param param_3 param_2 param_1). auto.
    rewrite /valid /is_init /= => &m /> *.  smt(all_cat BArray224.init_arrP).
  if. auto. ecall (__addratebit_avx2_trace param_0 (BArray224.init_arr (W8.of_int 255) 224) param).
  + auto . rewrite /valid /is_init /= => &m /> *.  smt(all_cat BArray224.init_arrP).
  auto .
  smt(all_cat BArray224.init_arrP).
qed .

lemma __pstate_array_avx2_trace _pst _b_pst _aT _buf _b_buf _offset _lEN _tRAILB :
      hoare [M.__pstate_array_avx2 :
      (((_tRAILB = tRAILB) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\
       ((_b_buf = b_buf) /\
       ((_buf = buf) /\ ((_aT = aT) /\ ((_b_pst = b_pst) /\ (_pst = pst)))))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAILB) /\ (_tRAILB < 256)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\
       ((_offset + _lEN) <= 18446744073709551615)) /\
      ((((((((0 <= _offset) /\ (0 <= _lEN)) /\ (0 <= _aT)) /\ (_aT < 200)) /\
         (((_aT + _lEN) + ((_tRAILB <> 0) ? 1 : 0)) < 200)) /\
        ((_offset + _lEN) <= size)) /\
       (is_init _b_buf _offset _lEN)) /\
      (is_init _b_pst 0 200))))))) ==>
      ((((0 <= res.`4) /\ (res.`4 <= 18446744073709551615)) /\
       (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
       (((0 <= (_offset + _lEN)) /\
        ((_offset + _lEN) <= 18446744073709551615)) /\
       (((is_init res.`2 0 200) /\
        (res.`3 = ((_aT + _lEN) + ((_tRAILB <> 0) ? 1 : 0)))) /\
       (res.`4 = (_offset + _lEN)))))) /\
      (valid res.`5))].
proof. 
  proc; have:= inbounds_size => /= *.
  seq 16: ( is_init b_buf _offset _lEN /\ valid trace___pstate_array_avx2 /\  0 <= _offset /\
          0 <= _tRAILB /\ _tRAILB < 256 /\0 <= _lEN /\0 <= _aT /\ offset = _offset /\
          aT %% 8 = 0 /\ _aT + _lEN + ((_tRAILB <> 0) ? 1 : 0) < 200 /\ 0<= aT /\ aT < 200 /\
          aLL = _aT + _lEN + (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
          tRAILB =( if 0 < lO /\ lO + _lEN < 8 then 0 else _tRAILB) /\ lO = _aT %% 8 /\
          at=(if 0 < lO /\ lO + _lEN < 8 then _aT %/ 8 else  aT%/8)/\ _offset + _lEN <=size /\
          lEN =(if 0 < lO then if lO + _lEN < 8 then 0 else  _lEN - 8 + lO else _lEN)  /\
          aT =(if 0 < lO then if lO + _lEN < 8 then 0 else  _aT + 8 - lO else _aT)  /\
          dELTA = if 0 < lO then if lO + _lEN < 8 then _lEN else 8 - lO else 0).
  + sp. if.
    + if.
      + auto. ecall(__aread_subu64_trace param_8 b_param_0 param_7 param_6 param_5 param_4).           auto. rewrite  /valid /= => &m /> *. smt(all_cat).
      if.
      + auto.  rewrite /valid /= => &m /> *. smt(all_cat).
      auto. ecall(__aread_subu64_trace param_13 b_param_1 param_12 param_11 param_10 param_9).       auto. rewrite /valid /= => &m /> *. smt(all_cat).
    auto. rewrite  /valid /= => &m /> *. smt().
  seq 1:(is_init b_buf  _offset _lEN /\ valid trace___pstate_array_avx2 /\
          0 <= _tRAILB /\ _tRAILB < 256 /\ 0<= _aT /\ 0<= _offset /\ 0 <= at /\
          aT %% 8 = 0 /\ _aT + _lEN + ((_tRAILB <> 0) ? 1 : 0) < 200 /\ 0 <= aT /\
          aLL = _aT + _lEN + (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
          offset + dELTA =  _offset + _lEN - lEN /\  _offset + _lEN <=size /\
          lEN <= _lEN /\ 0<=lEN /\ 0<=dELTA /\ 0<= offset /\ offset + dELTA <=size /\
          tRAILB =( if 0 < lO /\ lO + _lEN < 8 then 0 else _tRAILB) /\ lEN < 32 /\
    8 * at <= _aT + _lEN - lEN /\  _offset + _lEN = offset + lEN + dELTA). 
  + if. auto.
    + while(is_init b_buf  _offset _lEN /\ valid trace___pstate_array_avx2 /\
          _lEN < 200 /\ 32 <= lEN /\ lEN <= _lEN /\ _offset + _lEN <=size /\
          0 <= _tRAILB /\ _tRAILB < 256 /\  0 <= aT /\ _aT + _lEN = aT + lEN /\  0<= _offset /\
          aT %% 8 = 0 /\ aT + lEN + ((_tRAILB <> 0) ? 1 : 0) < 200 /\ aT%/8 <=  at /\
          aLL = _aT + _lEN + (if 0 < lO /\ lO + lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
          offset =  _offset + (_lEN - lEN) +( at - aT%/8) * 8 /\
          tRAILB =( if 0 < lO /\ lO + _lEN < 8 then 0 else _tRAILB) /\
          (at - aT%/8) %% 4 = 0 /\ dELTA = 0 /\
          0<= offset /\
          (at < aT %/ 8 + 4 * (lEN %/ 32) =>  32 <= (lEN - (at - aT%/8) * 8)) /\
          (at - aT%/8) * 8 <= lEN - lEN%%32 /\ at <= aT %/ 8 + 4 * (lEN %/ 32)).
      + auto. smt(all_cat inbounds_size).
      auto. smt(all_cat inbounds_size).
    auto. smt(inbounds_size).
  seq 1:(is_init b_buf _offset _lEN /\ valid trace___pstate_array_avx2 /\ 0<= _offset /\
          0 <= _tRAILB /\ _tRAILB < 256 /\ 0<= _aT /\  _offset + _lEN <= size /\ 0<=at /\
          aT %% 8 = 0 /\ _aT + _lEN + ((_tRAILB <> 0) ? 1 : 0) < 200 /\ 0 <= aT /\
          aLL = _aT + _lEN + (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
          offset + dELTA =  _offset + _lEN - lEN /\
          lEN <= _lEN /\ 0<=lEN /\ 0<=dELTA /\ 0<= offset /\ offset + dELTA + lEN <=size /\ _offset + _lEN = offset + lEN + dELTA /\
          tRAILB =( if 0 < lO /\ lO + _lEN < 8 then 0 else _tRAILB) /\ lEN < 16 /\
          8 * at <= _aT + _lEN - lEN).
  + if.
    + auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat).
    auto.  rewrite /trace /is_init /valid /= => &m /> *. smt().
  seq 1:(is_init b_buf _offset _lEN /\ valid trace___pstate_array_avx2 /\ 0<=_offset /\
          0 <= _tRAILB /\ _tRAILB < 256 /\ 0<= _aT /\  _offset + _lEN <= size /\ 0 <=at /\
          aT %% 8 = 0 /\ _aT + _lEN + ((_tRAILB <> 0) ? 1 : 0) < 200 /\ 0 <= aT /\
          aLL = _aT + _lEN + (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
          offset + dELTA =  _offset + _lEN - lEN /\
          lEN <= _lEN /\ 0<=lEN /\ 0<=dELTA /\ 0<= offset /\ offset + dELTA + lEN <=size /\   _offset +  _lEN = offset + lEN + dELTA /\
          tRAILB =( if 0 < lO /\ lO + _lEN < 8 then 0 else _tRAILB) /\ lEN < 8 /\
          8 * at <= _aT + _lEN - lEN).
  + if.
    + auto. smt(all_cat).
    auto. rewrite /trace /is_init /valid /= => &m /> *. smt().
  sp. if.  
  + auto. ecall(__aread_subu64_trace param_3 b_param param_2 param_1 param_0 param). auto.   
    rewrite /trace /is_init /valid /= => &m /> *.
    split. move => *.  
    + split. smt(all_cat BArray200.init_arrP).
      move => *. split. smt( BArray200.init_arrP).
      smt(all_cat).  
    move => *. split. smt(all_cat BArray200.init_arrP). move => *. split. smt(BArray200.init_arrP). smt(all_cat).
  auto. rewrite /trace /is_init /valid /= => &m /> *. smt(all_cat BArray200.init_arrP).
qed.


lemma __pabsorb_array_avx2_trace _pst _b_pst _aT _st _b_st _buf _b_buf _offset _lEN _rATE8 _tRAILB :
      hoare [M.__pabsorb_array_avx2 :
      (((_tRAILB = tRAILB) /\
       ((_rATE8 = rATE8) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\
       ((_b_buf = b_buf) /\
       ((_buf = buf) /\
       ((_b_st = b_st) /\
       ((_st = st) /\ ((_aT = aT) /\ ((_b_pst = b_pst) /\ (_pst = pst))))))))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAILB) /\ (_tRAILB < 256)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\
       ((_offset + _lEN) <= 18446744073709551615)) /\
      (((((((((((0 <= _offset) /\ (0 <= _lEN)) /\ (0 <= _aT)) /\
             (_aT < _rATE8)) /\
            ((_offset + _lEN) <= size)) /\
           (((_aT + _lEN) + ((_tRAILB <> 0) ? 1 : 0)) < 200)) /\
          (0 < _rATE8)) /\
         (_rATE8 < 200)) /\
        (is_init _b_buf _offset _lEN)) /\
       (is_init _b_pst 0 200)) /\
      (is_init _b_st 0 224))))))) ==>
      ((((0 <= res.`6) /\ (res.`6 <= 18446744073709551615)) /\
       ((is_init res.`2 0 200) /\ (is_init res.`5 0 224))) /\
      (valid res.`7))].
proof. 
  proc; have:= inbounds_size => /= *.
  seq 53: (valid trace___pabsorb_array_avx2 /\ #pre). by auto.
  sp.
  if .
  + seq 14: ( 0 <= offset /\ offset <= size /\ valid trace___pabsorb_array_avx2 /\
              0<=aT /\ aT<200 /\ 0 < rATE8 /\ rATE8 < 200).
    + auto.
      ecall (__pstate_array_avx2_trace param_10 (BArray200.init_arr (W8.of_int 255) 200)
             param_9  param_8 b_param param_7 param_6 param_5). auto .
      rewrite /valid /=. smt(all_cat BArray200.init_arrP) .
    if. sp.
    + if.  auto.
      + ecall(__addratebit_avx2_trace param_0 (BArray224.init_arr (W8.of_int 255) 224) param). auto.
        ecall (__addpst01_avx2_trace param_2 (BArray224.init_arr (W8.of_int 255) 224)
               param_1 (BArray200.init_arr (W8.of_int 255) 200)). auto .
        while( 0 <= offset /\ offset <= size /\ valid trace___pabsorb_array_avx2 /\
               0<=i /\  0<=aT /\ aT<200). auto. smt(all_cat).
        auto. rewrite /valid /= => &m /> *. smt(all_cat BArray200.init_arrP BArray224.init_arrP).
      auto .
      ecall (_addpstate_avx2_trace param_4 (BArray224.init_arr (W8.of_int 255) 224)  param_3
              (BArray200.init_arr (W8.of_int 255) 200)). auto.
      while (0 <= offset /\ offset < W64.modulus /\ valid trace___pabsorb_array_avx2 /\
               0<=i /\  0<=aT /\ aT<200 /\ 0 < rATE8 /\ rATE8 < 200). auto. smt(all_cat).
      auto .  rewrite /valid /= => &m /> *. smt(all_cat BArray200.init_arrP BArray224.init_arrP).
    auto. smt(all_cat BArray200.init_arrP BArray224.init_arrP).     
  seq 6: (valid  trace___pabsorb_array_avx2 /\ 0 <= offset /\
          is_init b_buf offset lEN /\  offset + lEN  <= size /\ 0<=aT /\ lEN < 200 /\
          aT<200 /\ 0 < rATE8 /\ rATE8 < 200 /\ 0<=lEN /\ 0<=tRAILB /\ tRAILB < 256 ).
  + auto.
    while ( valid  trace___pabsorb_array_avx2 /\ 0 <= offset /\ 0<=i /\ i<=iTERS /\
            iTERS = lEN %/ rATE8 /\ rATE8 * iTERS <= lEN /\ aLL =_aT + _lEN /\ lEN <= size /\
            lEN + offset - i * rATE8 = _offset + _lEN /\ _offset + _lEN <=size /\ lEN < 200 /\
            is_init b_buf offset ((iTERS - i)*rATE8 +  aLL%%rATE8) /\ aT = 0 /\ aLL =_aT + _lEN /\
            aT<rATE8 /\ 0 < rATE8 /\ rATE8 < 200 /\ 0<=lEN /\ 0<=tRAILB /\ tRAILB < 256).
    + auto. ecall (_keccakf1600_avx2_trace param_24 (BArray224.init_arr (W8.of_int 255) 224)). auto.
      ecall(__addstate_array_avx2_trace param_29 (BArray224.init_arr (W8.of_int 255) 224)
                  param_28 b_param_2 param_27 param_26 param_25). auto. 
      rewrite /valid /is_init /= => &m /> *.
      have ?: (rATE8{m} <= (lEN{m} %/ rATE8{m} - i{m}) * rATE8{m} ). smt().
      split. smt(BArray224.init_arrP). move => *.
      smt(all_cat).
    auto. 
    if. 
    + auto. ecall ( _keccakf1600_avx2_trace param_30 (BArray224.init_arr (W8.of_int 255) 224)).   
      auto. ecall (_addpstate_avx2_trace param_32 (BArray224.init_arr (W8.of_int 255) 224)  
                   param_31 (BArray200.init_arr (W8.of_int 255) 200)). auto.
      ecall (__pstate_array_avx2_trace param_38 (BArray200.init_arr (W8.of_int 255) 200)
             param_37 param_36 b_param_3 param_35 param_34 param_33). auto.
      rewrite /valid /is_init /= => &m /> *. split. smt(BArray200.init_arrP).
      move => *. split. smt(BArray224.init_arrP). move => *.
      have: ((lEN{m} - (rATE8{m} - aT{m})) %/ rATE8{m} * rATE8{m} +
   (aT{m} + lEN{m}) %% rATE8{m} = lEN{m} - (rATE8{m} - aT{m}) ).
      + have h: ((lEN{m} - (rATE8{m} - aT{m})) %/ rATE8{m} * rATE8{m} = lEN{m} - (rATE8{m} - aT{m}) - (lEN{m} - (rATE8{m} - aT{m}))%%rATE8{m}). smt().  rewrite h.
        have h1: ((lEN{m} - (rATE8{m} - aT{m})) %% rATE8{m} = (lEN{m} + aT{m} - rATE8{m}) %% rATE8{m}). smt(). have h2:((lEN{m} + aT{m} - rATE8{m}) %% rATE8{m} = (lEN{m} + aT{m}) %% rATE8{m}). 
have /= ? := modzMDr (-1) (lEN{m} + aT{m}) (rATE8{m}). smt(). smt(). 
    smt(all_cat).
    auto. smt(all_cat).          
  if.  
  + auto. 
    ecall (__addratebit_avx2_trace param_12 (BArray224.init_arr (W8.of_int 255) 224) param_11).
    auto .
    ecall (__addstate_array_avx2_trace param_17 (BArray224.init_arr (W8.of_int 255) 224) 
           param_16 b_param_0 param_15 param_14 param_13). auto .
    rewrite /valid /= => &m /> *.  smt(all_cat BArray200.init_arrP BArray224.init_arrP).
  if.
  + auto .
    ecall (__pstate_array_avx2_trace param_23 (BArray200.init_arr (W8.of_int 255) 200) param_22           param_21 b_param_1 param_20 param_19 param_18).
    auto . rewrite /valid /= => &m /> *.  smt(all_cat BArray200.init_arrP BArray224.init_arrP).
  auto.  smt(all_cat BArray200.init_arrP BArray224.init_arrP).
qed .


lemma __dumpstate_array_avx2_trace _buf _b_buf _offset _lEN _st _b_st :
      hoare [M.__dumpstate_array_avx2 :
      (((_b_st = b_st) /\
       ((_st = st) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\
       ((_offset + _lEN) <= 18446744073709551615)) /\ _lEN <= 200 /\
      ((((0 <= _offset) /\ (0 <= _lEN)) /\ ((_offset + _lEN) <= size)) /\
      (is_init _b_st 0 224)))))) ==>
      ((((0 <= res.`3) /\ (res.`3 <= 18446744073709551615)) /\
       (((foldr (fun x => (fun acc => (x /\ acc))) true
         (map
         (fun k =>
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
         ((0 <= (_offset + _lEN)) /\
         ((_offset + _lEN) <= 18446744073709551615)))))) (iota_ 0 size))) /\
        (foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        ((is_init res.`2 k 1) =
        ((is_init _b_buf k 1) \/ ((_offset <= k) /\ (k < (_offset + _lEN))))))
        (iota_ 0 size)))) /\
       (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
       (((0 <= (_offset + _lEN)) /\
        ((_offset + _lEN) <= 18446744073709551615)) /\
       (res.`3 = (_offset + _lEN)))))) /\
      (valid res.`4))].
proof. 
  proc; have:= inbounds_size => /= *.
  seq 47: (#pre /\ valid trace___dumpstate_array_avx2). by auto.
  sp.
  seq 1: ( valid trace___dumpstate_array_avx2 /\ _lEN <= 200 /\
          (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/ _offset <=k  /\ k < _offset + (if _lEN < 8 then _lEN else 8))) /\ 0<=_lEN /\ lEN = _lEN - (if _lEN < 8 then _lEN else 8) /\
          dELTA = (if _lEN < 8 then _lEN else 8) /\ offset = _offset /\ 0<=_offset /\ _offset + _lEN <= size).
  + if. auto.
    + ecall(__awrite_subu256_trace param_48 b_param_8 param_47 param_46 param_45 param_44).
      auto. rewrite /valid /is_init /= => &m /> *.  smt(all_cat and_iota).
    auto.
    ecall(__awrite_subu256_trace param_53 b_param_9 param_52 param_51  param_50 param_49). 
    auto. rewrite /valid /is_init /= => &m /> *.  smt(all_cat and_iota). 
  seq 13:( valid trace___dumpstate_array_avx2 /\ _lEN <= 200 /\
          (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/ _offset <=k  /\ k < _offset + (if _lEN < 40 then _lEN else 40))) /\ 0<=_lEN /\ lEN = _lEN - (if _lEN < 40 then _lEN else 40) /\
          dELTA = (if _lEN < 40 then _lEN else 40) /\ offset = _offset /\ 0<=_offset /\ _offset + _lEN <= size).
  + auto. ecall(__awrite_subu256_trace param_43 b_param_7 param_42 param_41 param_40 param_39).
    auto.  rewrite /valid /is_init /= => &m /> *. 
    smt(all_cat and_iota).
  if.
  + pose len x := (if _lEN < x then _lEN else x).
    seq 17:( valid trace___dumpstate_array_avx2 /\ _lEN <= 200 /\
          (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/
            _offset <=k  /\ k < _offset + len 48)) /\ 0<=_lEN /\ lEN = _lEN - len 48 /\
          dELTA = len 48 /\ offset = _offset /\ 0<=_offset /\ _offset + _lEN <= size).
    + auto.
      ecall(__awrite_subu64_trace param_38 b_param_6 param_37 param_36 param_35 param_34).
      auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat and_iota).
    if.
    + seq 18: (valid trace___dumpstate_array_avx2 /\ _lEN <= 200 /\
              (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/
               _offset <=k  /\ k < _offset + len 80)) /\ 0<=_lEN /\ lEN = _lEN - len 80 /\
              dELTA = len 80 /\ offset = _offset /\ 0<=_offset /\ _offset + _lEN <= size).
      + auto.
        ecall(__awrite_subu256_trace param_33 b_param_5 param_32 param_31 param_30 param_29).
        auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat and_iota).
      seq 1:  (valid trace___dumpstate_array_avx2 /\ _lEN <= 200 /\
              (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/
               _offset <=k  /\ k < _offset + len 88)) /\ 0<=_lEN /\ lEN = _lEN - len 88/\
              dELTA = len 88 /\ offset = _offset /\ 0<=_offset /\ _offset + _lEN <= size).
      + if. auto.   
        + ecall(__awrite_subu64_trace param_28 b_param_4 param_27 param_26 param_25 param_24).
          auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat and_iota).
        auto. smt(all_cat).
      seq 1:  (valid trace___dumpstate_array_avx2 /\ _lEN <= 200 /\
              (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/
               _offset <=k  /\ k < _offset + len 120)) /\ 0<=_lEN /\ lEN = _lEN - len 120/\
              dELTA = len 120 /\ offset = _offset /\ 0<=_offset /\ _offset + _lEN <= size).
      + if. auto.   
        + ecall(__awrite_subu256_trace param_23 b_param_3 param_22 param_21 param_20 param_19).
          auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat and_iota).
        auto. smt(all_cat). 
      seq 1:  (valid trace___dumpstate_array_avx2 /\ _lEN <= 200 /\
              (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/
               _offset <=k  /\ k < _offset + len 128)) /\ 0<=_lEN /\ lEN = _lEN - len 128/\
              dELTA = len 128 /\ offset = _offset /\ 0<=_offset /\ _offset + _lEN <= size).
      + if. auto.   
        + ecall(__awrite_subu64_trace param_18 b_param_2 param_17 param_16 param_15 param_14).
          auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat and_iota).
        auto. smt(all_cat).
      seq 1:  (valid trace___dumpstate_array_avx2 /\ _lEN <= 200 /\
              (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/
               _offset <=k  /\ k < _offset + len 160)) /\ 0<=_lEN /\ lEN = _lEN - len 160/\
              dELTA = len 160 /\ offset = _offset /\ 0<=_offset /\ _offset + _lEN <= size).
      + if. auto.   
        + ecall(__awrite_subu256_trace param_13 b_param_1 param_12 param_11 param_10 param_9).
          auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat and_iota).
        auto. smt(all_cat).
      seq 1:  (valid trace___dumpstate_array_avx2 /\ _lEN <= 200 /\
              (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/
               _offset <=k  /\ k < _offset + len 168)) /\ 0<=_lEN /\ lEN = _lEN - len 168/\
              dELTA = len 168 /\ offset = _offset /\ 0<=_offset /\ _offset + _lEN <= size).
      + if. auto.   
        + ecall(__awrite_subu64_trace param_8 b_param_0 param_7 param_6 param_5 param_4).
          auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat and_iota).
        auto. smt(all_cat).
      seq 1:  (valid trace___dumpstate_array_avx2 /\ _lEN <= 200 /\
              (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/
               _offset <=k  /\ k < _offset + len 200)) /\ 0<=_lEN /\ 
              dELTA = len 200 /\ offset = _offset /\ 0<=_offset /\ _offset + _lEN <= size).
      + if. auto.   
        + ecall(__awrite_subu256_trace param_3 b_param param_2 param_1 param_0 param).
          auto. rewrite /valid /is_init /= => &m /> *. smt(all_cat and_iota).
        auto. smt(all_cat).
      auto. smt(all_cat and_iota).
    auto. smt(all_cat and_iota).
  auto. smt(all_cat and_iota).
qed .



lemma __squeeze_array_avx2_trace _buf _b_buf _offset _lEN _st _b_st _rATE8 :
      hoare [M.__squeeze_array_avx2 :
      (((_rATE8 = rATE8) /\
       ((_b_st = b_st) /\
       ((_st = st) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf))))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\
       ((_offset + _lEN) <= 18446744073709551615)) /\
      ((((((0 <= _offset) /\ (0 <= _lEN)) /\ (0 < _rATE8)) /\ (_rATE8 < 200)) /\
       ((_offset + _lEN) <= size)) /\
      (is_init _b_st 0 224)))))) ==>
      ((((foldr (fun x => (fun acc => (x /\ acc))) true
         (map
         (fun k =>
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
         ((0 <= (_offset + _lEN)) /\
         ((_offset + _lEN) <= 18446744073709551615)))))) (iota_ 0 size))) /\
        (foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        ((is_init res.`2 k 1) =
        ((is_init _b_buf k 1) \/ ((_offset <= k) /\ (k < (_offset + _lEN))))))
        (iota_ 0 size)))) /\
       (is_init res.`4 0 224)) /\
      (valid res.`5))].
proof. 
  proc; have:= inbounds_size => /= *.
    seq 19: (#pre /\ valid trace___squeeze_array_avx2). by auto.
  sp. if .
  + seq 1: (lO = _lEN %% rATE8/\offset + lO <= size /\ 0 <= offset/\offset = _offset + _lEN - lO /\
            0 < rATE8 /\ rATE8 < 200 /\ 0 <= _lEN /\ 0<= _offset /\  _offset + _lEN <=size /\
           (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/ _offset <=k /\             k < _offset + _lEN - lO)) /\ valid trace___squeeze_array_avx2).
    + if .
      + while(valid trace___squeeze_array_avx2 /\ lO = _lEN %% rATE8 /\ iTERS = _lEN%/rATE8 /\
             _offset + iTERS * rATE8 + lO <= size /\ offset = _offset + i*rATE8 /\ 0<=i /\ i<=iTERS/\
             0 < rATE8 /\ rATE8 < 200 /\ 0 <= _lEN /\ 0<= _offset /\  _offset + _lEN <=size /\
            (forall k, 0 <= k < size => is_init_cell b_buf k = (is_init_cell _b_buf k \/
             _offset <=k /\ k < offset ))).
        + auto .
          ecall (__dumpstate_array_avx2_trace param_7 b_param_0 param_6 param_5 param_4 (BArray224.init_arr (W8.of_int 255) 224)). auto .
          ecall (_keccakf1600_avx2_trace param_8 (BArray224.init_arr (W8.of_int 255) 224)). auto .
          rewrite /valid /is_init /= => &m /> ? h *. 
          have h1: (_offset + i{m} * rATE8{m} + rATE8{m} = _offset + (i{m} + 1) * rATE8{m}). smt().
          split. smt( BArray224.init_arrP).
          move=> *. rewrite h1. split. smt().
          move => *. split. move => /> *. smt(all_cat).
          smt(and_iota).
        auto .
        rewrite /valid /is_init /= => &m /> *.  smt(and_iota all_cat).
      auto. smt(and_iota all_cat).
    if.
    + auto.
      ecall (__dumpstate_array_avx2_trace param_2 b_param param_1 param_0 
              param (BArray224.init_arr (W8.of_int 255) 224)). auto .
      ecall (_keccakf1600_avx2_trace param_3 (BArray224.init_arr (W8.of_int 255) 224)).
      auto .
      rewrite /valid /is_init /= => &m /> *.  split. smt(BArray224.init_arrP).
      move => *. split. smt(). move => *. split. smt(and_iota).  smt(all_cat).
    auto.  smt(and_iota all_cat BArray224.init_arrP).
  auto.  smt(and_iota all_cat BArray224.init_arrP).
qed.


lemma __addstate_bcast_array_avx2x4_trace _st _b_st _aT _buf _b_buf _offset _lEN _tRAILB :
      hoare [M.__addstate_bcast_array_avx2x4 :
      (((_tRAILB = tRAILB) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\
       ((_b_buf = b_buf) /\
       ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st)))))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAILB) /\ (_tRAILB < 256)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\
       ((_offset + _lEN) <= 18446744073709551615)) /\
      ((((((((0 <= _offset) /\ (0 <= _lEN)) /\ (0 <= _aT)) /\ (_aT < 200)) /\
         ((_offset + _lEN) <= size)) /\
        (((_aT + _lEN) + ((_tRAILB <> 0) ? 1 : 0)) < 200)) /\
       (is_init _b_buf _offset _lEN)) /\
      (is_init _b_st 0 800))))))) ==>
      ((((0 <= res.`4) /\ (res.`4 <= 18446744073709551615)) /\
       (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
       (((0 <= (_offset + _lEN)) /\
        ((_offset + _lEN) <= 18446744073709551615)) /\
       (((is_init res.`2 0 800) /\
        (res.`3 = ((_aT + _lEN) + ((_tRAILB <> 0) ? 1 : 0)))) /\
       (res.`4 = (_offset + _lEN)))))) /\
      (valid res.`5))].
proof. 
  proc; have:= inbounds_size => /= *.
    seq 10: (#pre /\ valid trace___addstate_bcast_array_avx2x4). by auto.
  seq 6: ( valid trace___addstate_bcast_array_avx2x4 /\ 0<=_offset /\ 0<=lEN /\
           lEN + offset = _lEN + _offset /\ _lEN + _offset <=size /\ aT%%8 = 0 /\
           0 <= _tRAILB /\ _tRAILB < 256 /\ dELTA = 0 /\
           aT + lEN + ((_tRAILB <> 0) ? 1 : 0) < 200 /\
           (if 0<lO /\ lO + _lEN < 8 then true else aT + lEN = _aT + _lEN)
           /\ _aT + _lEN <= 200 /\ 0<=_aT /\ _aT < 200 /\
           at = (if 0 < lO /\ lO + _lEN < 8 then 32*(_aT%/8) else 32*(aT%/8)) /\
           tRAILB = (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 0 else _tRAILB) /\
           aLL = _aT + _lEN + (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
           lO = _aT %% 8 /\ is_init b_buf offset lEN /\ _offset <= offset /\ lEN <= _lEN).
  + sp.
    if. 
    + if.
      + auto.
        ecall (__aread_bcast_4subu64_trace param_8 b_param_0 param_7 param_6 param_5 param_4). 
        auto. rewrite /is_init /valid /= => &m /> *. smt(all_cat).
      if. auto. rewrite /is_init /valid /= => &m /> *. smt(all_cat).
      auto.
      ecall(__aread_bcast_4subu64_trace param_13 b_param_1 param_12 param_11 param_10 param_9).
      auto.  rewrite /is_init /valid /= => &m /> *. smt(all_cat).
    auto. smt(all_cat).   
  seq 2: ( valid trace___addstate_bcast_array_avx2x4 /\ 0<=_offset /\ 0<=lEN /\ 0<=at /\
           lEN + offset = _lEN + _offset /\ _lEN + _offset <=size /\ aT%%8 = 0 /\ lO = lEN /\
           at + 32 <= 800 /\ offset = _offset + _lEN - lEN /\ 0 <= _tRAILB /\ _tRAILB < 256 /\
           tRAILB = (if 0 < _aT%%8 /\ _aT%%8 + _lEN < 8 /\ _tRAILB <> 0 then 0 else _tRAILB)
           /\ dELTA = 0 /\ lEN < 8 /\
           aLL = _aT + _lEN + (if 0 < _aT%%8 /\ _aT%%8 + _lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
           is_init b_buf offset lEN /\ _offset <= offset /\ lEN <= _lEN).
  + if. auto. 
    + while (valid trace___addstate_bcast_array_avx2x4 /\ 0<=_offset /\ 0<=lEN /\ 0<=at /\
             lEN + offset - ((at - 32 * (aT %/ 8))%/4)  = _lEN + _offset /\
           _lEN + _offset <=size /\ aT + lEN = _aT + _lEN /\ _aT + _lEN < 200 /\ 0<=_aT /\ 
           aT%%8 = 0 /\ at%%32 = 0 /\ lO = _aT%%8 /\ at <=  32 * (aT %/ 8) + 32 * (lEN %/ 8) /\
           0 <= _tRAILB /\ _tRAILB < 256 /\ 
           tRAILB = (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 0 else _tRAILB) /\ dELTA = 0 /\
           aLL = _aT + _lEN + (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
           lO = _aT %% 8 /\  aT + lEN + ((_tRAILB <> 0) ? 1 : 0) <=  200 /\
           is_init b_buf offset ((32 * (aT %/ 8) + 32 * (lEN %/ 8) - at)%/4 + lEN%%8) /\
           _offset <= offset /\ lEN <= _lEN).
      + auto. rewrite /is_init /valid /= => &m /> *. split; smt(all_cat). 
      auto. rewrite /is_init /valid /= => &m /> *. split. split; smt(all_cat).
      smt().
    auto.  rewrite /is_init /valid /= => &m /> *. smt().
  if.
  + auto. ecall (__aread_bcast_4subu64_trace param_3 b_param param_2 param_1 param_0 param).
    auto . rewrite /is_init /valid /= => &m /> *. 
    smt(all_cat BArray800.init_arrP). 
  auto. rewrite /is_init /valid /= => &m /> *.
  smt(all_cat BArray800.init_arrP).
qed .

lemma __absorb_bcast_array_avx2x4_trace _st _b_st _aT _buf _b_buf _offset _lEN _rATE8 _tRAILB :
      hoare [M.__absorb_bcast_array_avx2x4 :
      (((_tRAILB = tRAILB) /\
       ((_rATE8 = rATE8) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\
       ((_b_buf = b_buf) /\
       ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st))))))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAILB) /\ (_tRAILB < 256)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\
       ((_offset + _lEN) <= 18446744073709551615)) /\
      ((((((((((0 <= _offset) /\ (0 <= _lEN)) /\ (0 <= _aT)) /\
            (_aT < _rATE8)) /\
           ((_offset + _lEN) <= size)) /\
          (((_aT + _lEN) + ((_tRAILB <> 0) ? 1 : 0)) < 200)) /\
         (0 < _rATE8)) /\
        (_rATE8 < 200)) /\
       (is_init _b_buf _offset _lEN)) /\
      (is_init _b_st 0 800))))))) ==>
      ((((0 <= res.`4) /\ (res.`4 <= 18446744073709551615)) /\
       ((is_init res.`2 0 800) /\
       (res.`3 = (((_aT + _lEN) %% _rATE8) + ((_tRAILB <> 0) ? 1 : 0))))) /\
      (valid res.`5))].
proof. 
  proc; have:= inbounds_size => /= *.
  seq 36:(#pre /\ valid trace___absorb_bcast_array_avx2x4 ).
  + by auto.
  sp.
  if.
  + seq 14: (valid trace___absorb_bcast_array_avx2x4 /\ 0 < rATE8 /\ rATE8 < 200 /\ aT = (_aT + _lEN)%%_rATE8 + (if _tRAILB <> 0 then 1 else 0) /\ 0<= offset /\ offset <= size).
    + auto. ecall (__addstate_bcast_array_avx2x4_trace st  (BArray800.init_arr (W8.of_int (-1)) 800) aT buf b_buf offset lEN  tRAILB). auto.
      move => &m /> /=. rewrite /trace /valid /=. move => *. smt(all_cat BArray800.init_arrP).
    if. 
    + auto. ecall(__addratebit_avx2x4_trace st (BArray800.init_arr (W8.of_int (-1)) 800) rATE8).
      auto. move => &m /> /=. rewrite /trace /valid /=. smt(all_cat BArray800.init_arrP).
    auto. smt(BArray800.init_arrP).
  seq 20: ( valid trace___absorb_bcast_array_avx2x4 /\ 0 < rATE8 /\ rATE8 < 200 /\
            0<= offset /\ offset <= size /\
            aT = (_aT + _lEN)%%_rATE8 + (if _tRAILB <> 0 then 1 else 0)).
  + auto. ecall(__addstate_bcast_array_avx2x4_trace st (BArray800.init_arr (W8.of_int (-1)) 800) 0 buf b_buf offset lEN tRAILB). auto.
    pose offset0 :=  _offset +  (if _aT <> 0 then (_rATE8 - _aT) else 0).
    pose len0 :=  _lEN -  (if _aT <> 0 then (_rATE8 - _aT) else 0).
    while( valid trace___absorb_bcast_array_avx2x4 /\ 0 < rATE8 /\ rATE8 < 200 /\
           _aT < rATE8 /\ 0 <= i /\ i <=iTERS /\ 0 <= _offset /\
           offset =  offset0 +  i* rATE8 /\ offset <= _offset + _lEN /\
            _rATE8 = rATE8 /\ iTERS <=_lEN /\ iTERS*rATE8 + len0%%rATE8 <= len0  /\
           is_init b_buf (_offset) _lEN /\ aLL = _aT + _lEN /\ iTERS = len0%/rATE8 /\
            _offset + _lEN <= size).
    + auto. ecall(_keccakf1600_avx2x4_trace st (BArray800.init_arr (W8.of_int 255) 800)). auto.
      ecall(__addstate_bcast_array_avx2x4_trace st (BArray800.init_arr (W8.of_int (-1)) 800) 0 buf b_buf offset rATE8 0). auto. 
      move => &m />. rewrite /valid /trace /is_init /= => *.
      split. split. smt().  split. smt(). split. smt().  split. split. smt().
      move => i.  have: (offset0 + i{!m} * rATE8{m} + rATE8{m} = offset0 + (i{!m} + 1) * rATE8{m}). smt(). smt(). smt(BArray800.init_arrP). move => *.
      split. smt(all_cat). smt().
    if.
    + auto. ecall(_keccakf1600_avx2x4_trace st ((BArray800.init_arr (W8.of_int (-1)) 800))). auto.
      ecall(__addstate_bcast_array_avx2x4_trace st (BArray800.init_arr (W8.of_int (-1)) 800) aT buf b_buf offset (rATE8 - aT) 0). auto.
      move => &m />. rewrite /valid /trace /is_init /= => *. 
      split. smt(BArray800.init_arrP). move => *. 
      have: (len0 %% rATE8{m} = (aT{m} + lEN{m}) %% rATE8{m}). 
      + have /= ? := modzMDr (-1) (lEN{m} + aT{m}) (rATE8{m}). smt().
        move => ?.
      split; smt(all_cat).
    auto.  move => &m />. rewrite /valid /trace /is_init /= => *. 
    split. smt(all_cat).  move => *.
    split. smt(BArray800.init_arrP). move => *.
    smt(all_cat).
  auto. if. auto. ecall(__addratebit_avx2x4_trace st (BArray800.init_arr (W8.of_int (-1)) 800) rATE8). auto. smt(all_cat BArray800.init_arrP).
  auto. smt(BArray800.init_arrP).
qed.

lemma __addstate_array_avx2x4_trace _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset _lEN _tRAILB :
      hoare [M.__addstate_array_avx2x4 :
      (((_tRAILB = tRAILB) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\
       ((_b_buf3 = b_buf3) /\
       ((_buf3 = buf3) /\
       ((_b_buf2 = b_buf2) /\
       ((_buf2 = buf2) /\
       ((_b_buf1 = b_buf1) /\
       ((_buf1 = buf1) /\
       ((_b_buf0 = b_buf0) /\
       ((_buf0 = buf0) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st)))))))))))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAILB) /\ (_tRAILB < 256)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\
       ((_offset + _lEN) <= 18446744073709551615)) /\
      (((((((((((0 <= _offset) /\ (0 <= _lEN)) /\ (0 <= _aT)) /\ (_aT < 200)) /\
            ((_offset + _lEN) <= size)) /\
           (((_aT + _lEN) + ((_tRAILB <> 0) ? 1 : 0)) < 200)) /\
          (is_init _b_buf0 _offset _lEN)) /\
         (is_init _b_buf1 _offset _lEN)) /\
        (is_init _b_buf2 _offset _lEN)) /\
       (is_init _b_buf3 _offset _lEN)) /\
      (is_init _b_st 0 800))))))) ==>
      ((((0 <= res.`4) /\ (res.`4 <= 18446744073709551615)) /\
       (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
       (((0 <= (_offset + _lEN)) /\
        ((_offset + _lEN) <= 18446744073709551615)) /\
       (((is_init res.`2 0 800) /\
        (res.`3 = ((_aT + _lEN) + ((_tRAILB <> 0) ? 1 : 0)))) /\
       (res.`4 = (_offset + _lEN)))))) /\
      (valid res.`5))].
proof. 
  proc; have:= inbounds_size => /= *.
  seq 28: (#pre /\ valid trace___addstate_array_avx2x4). by auto.
  seq 10: ( valid trace___addstate_array_avx2x4 /\ 0<=_offset /\ 0<=lEN /\
           lEN + offset = _lEN + _offset /\ _lEN + _offset <=size /\ aT%%8 = 0 /\
           0 <= _tRAILB /\ _tRAILB < 256 /\ dELTA = 0 /\
           aT + lEN + ((_tRAILB <> 0) ? 1 : 0) < 200 /\
           (if 0<lO /\ lO + _lEN < 8 then true else aT + lEN = _aT + _lEN)
           /\ _aT + _lEN <= 200 /\ 0<=_aT /\ _aT < 200 /\
           at = (if 0 < lO /\ lO + _lEN < 8 then 4*(_aT%/8) else 4*(aT%/8)) /\
           tRAILB = (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 0 else _tRAILB) /\
           aLL = _aT + _lEN + (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
           lO = _aT %% 8 /\ is_init b_buf0 offset lEN /\  is_init b_buf1 offset lEN /\
           is_init b_buf2 offset lEN/\  is_init b_buf3 offset lEN /\
           _offset <= offset /\ lEN <= _lEN).
  + sp.
    if. 
    + if.
      + auto.
        ecall (__aread_subu64_trace param_27 b_param_3 param_26 param_25 param_24 param_23).
        auto.
        ecall (__aread_subu64_trace param_32 b_param_4 param_31 param_30 param_29 param_28).
        auto.
        ecall (__aread_subu64_trace param_37 b_param_5 param_36 param_35 param_34 param_33).
        auto.
        ecall (__aread_subu64_trace param_42 b_param_6 param_41 param_40 param_39 param_38).
        auto. rewrite /is_init /valid /= => &m /> *. smt(all_cat).
      if. auto. rewrite /is_init /valid /= => &m /> *. smt(all_cat).
      auto.
      ecall(__aread_subu64_trace param_47 b_param_7 param_46 param_45 param_44 param_43).
      auto.
      ecall(__aread_subu64_trace param_52 b_param_8 param_51 param_50 param_49 param_48).
      auto.
      ecall(__aread_subu64_trace param_57 b_param_9 param_56 param_55 param_54 param_53).
      auto.
      ecall(__aread_subu64_trace param_62 b_param_10 param_61 param_60 param_59 param_58).
      auto.  rewrite /is_init /valid /= => &m /> *. smt(all_cat).
    auto. smt(all_cat).   
  seq 2: ( valid trace___addstate_array_avx2x4 /\ 0<=_offset /\ 0<=lEN /\ 0<=at /\
           lEN + offset = _lEN + _offset /\ _lEN + _offset <=size /\ aT%%8 = 0 /\ lO = lEN /\
           at + 4 <= 100 /\ offset = _offset + _lEN - lEN /\ 0 <= _tRAILB /\ _tRAILB < 256 /\
           tRAILB = (if 0 < _aT%%8 /\ _aT%%8 + _lEN < 8 /\ _tRAILB <> 0 then 0 else _tRAILB)
           /\ dELTA = 0 /\ lEN < 8 /\
           aLL = _aT + _lEN + (if 0 < _aT%%8 /\ _aT%%8 + _lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
           is_init b_buf0 offset lEN /\ is_init b_buf1 offset lEN /\ is_init b_buf2 offset lEN /\
           is_init b_buf3 offset lEN /\ _offset <= offset /\ lEN <= _lEN).
  + if. auto. 
    + while (valid trace___addstate_array_avx2x4 /\ 0<=_offset /\ 0<=lEN /\ 0<=at /\
             lEN + offset - ((at - 4 * (aT %/ 8))*2)  = _lEN + _offset /\
           _lEN + _offset <=size /\ aT + lEN = _aT + _lEN /\ _aT + _lEN < 200 /\ 0<=_aT /\ 
           aT%%8 = 0 /\ at%%4 = 0 /\  lO = _aT%%8 /\ at <=  4 * (aT %/ 8) + 4 * (lEN %/ 8) /\
           0 <= _tRAILB /\ _tRAILB < 256 /\ 
           tRAILB = (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 0 else _tRAILB) /\ dELTA = 0 /\
           aLL = _aT + _lEN + (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
           lO = _aT %% 8 /\  aT + lEN + ((_tRAILB <> 0) ? 1 : 0) <  200 /\
           is_init b_buf0 offset ((4 * (aT %/ 8) + 4 * (lEN %/ 8) - at)* 2 + lEN%%8) /\
           is_init b_buf1 offset ((4 * (aT %/ 8) + 4 * (lEN %/ 8) - at)* 2 + lEN%%8) /\
           is_init b_buf2 offset ((4 * (aT %/ 8) + 4 * (lEN %/ 8) - at)* 2 + lEN%%8) /\
           is_init b_buf3 offset ((4 * (aT %/ 8) + 4 * (lEN %/ 8) - at)* 2 + lEN%%8) /\
           _offset <= offset /\ lEN <= _lEN).
      + auto. rewrite /is_init /valid /= => &m /> *. split; smt(all_cat). auto.
      while (valid trace___addstate_array_avx2x4 /\ 0<=_offset /\ 0<=lEN /\ 0<=at /\
             lEN + offset - ((at - 4 * (aT %/ 8))*2)  = _lEN + _offset /\
           _lEN + _offset <=size /\ aT + lEN = _aT + _lEN /\ _aT + _lEN < 200 /\ 0<=_aT /\ 
            aT%%8 = 0 /\ (at - 4 * (aT %/ 8))%%16 = 0 /\  lO = _aT%%8 /\
            at <=  4 * (aT %/ 8) + 16 * (lEN %/ 32) /\
           0 <= _tRAILB /\ _tRAILB < 256 /\ 
           tRAILB = (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 0 else _tRAILB) /\ dELTA = 0 /\
           aLL = _aT + _lEN + (if 0 < lO /\ lO + _lEN < 8 /\ _tRAILB <> 0 then 1 else 0) /\
           lO = _aT %% 8 /\  aT + lEN + ((_tRAILB <> 0) ? 1 : 0) <  200 /\
           is_init b_buf0 offset ((4 * (aT %/ 8) + 16  * (lEN %/ 32) - at)* 2 + lEN%%32) /\
           is_init b_buf1 offset ((4 * (aT %/ 8) + 16  * (lEN %/ 32) - at)* 2 + lEN%%32) /\
           is_init b_buf2 offset ((4 * (aT %/ 8) + 16  * (lEN %/ 32) - at)* 2 + lEN%%32) /\
           is_init b_buf3 offset ((4 * (aT %/ 8) + 16  * (lEN %/ 32) - at)* 2 + lEN%%32) /\
           _offset <= offset /\ lEN <= _lEN).
      + auto. ecall(__4u64x4_u256x4_trace param_22 param_21 param_20 param_19). auto.
        rewrite /is_init /valid /= => &m /> *. split; smt(all_cat).   
      auto. rewrite /is_init /valid /= => &m /> *. split. split; smt(all_cat). smt(all_cat).
    auto.  rewrite /is_init /valid /= => &m /> *. smt().
  if.
  + auto. ecall (__aread_subu64_trace param_3 b_param param_2 param_1 param_0 param).
    auto. ecall (__aread_subu64_trace param_8 b_param_0 param_7 param_6 param_5 param_4).
    auto. ecall (__aread_subu64_trace param_13 b_param_1 param_12 param_11 param_10 param_9).
    auto. ecall (__aread_subu64_trace param_18 b_param_2 param_17 param_16 param_15 param_14).
    auto . rewrite /is_init /valid /= => &m /> *. 
    smt(all_cat BArray800.init_arrP). 
  auto. rewrite /is_init /valid /= => &m /> *.
  smt(all_cat BArray800.init_arrP).
qed .

lemma __absorb_array_avx2x4_trace _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset _lEN _rATE8 _tRAILB :
      hoare [M.__absorb_array_avx2x4 :
      (((_tRAILB = tRAILB) /\
       ((_rATE8 = rATE8) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\
       ((_b_buf3 = b_buf3) /\
       ((_buf3 = buf3) /\
       ((_b_buf2 = b_buf2) /\
       ((_buf2 = buf2) /\
       ((_b_buf1 = b_buf1) /\
       ((_buf1 = buf1) /\
       ((_b_buf0 = b_buf0) /\
       ((_buf0 = buf0) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st))))))))))))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _tRAILB) /\ (_tRAILB < 256)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\
       ((_offset + _lEN) <= 18446744073709551615)) /\
      (((((((((((((0 <= _offset) /\ (0 <= _lEN)) /\ (0 <= _aT)) /\
               (_aT < _rATE8)) /\
              (0 < _rATE8)) /\
             (_rATE8 < 200)) /\
            ((_offset + _lEN) <= size)) /\
           (((_aT + _lEN) + ((_tRAILB <> 0) ? 1 : 0)) < 200)) /\
          (is_init _b_buf0 _offset _lEN)) /\
         (is_init _b_buf1 _offset _lEN)) /\
        (is_init _b_buf2 _offset _lEN)) /\
       (is_init _b_buf3 _offset _lEN)) /\
      (is_init _b_st 0 800))))))) ==>
      ((((0 <= res.`4) /\ (res.`4 <= 18446744073709551615)) /\
       (is_init res.`2 0 800)) /\
      (valid res.`5))].
proof.
  proc; have:= inbounds_size => /= *.
  seq 60: (valid trace___absorb_array_avx2x4 /\ #pre). by auto.
  sp.
  if .
  + seq 20: ( 0 <= offset /\ offset <= size /\ valid trace___absorb_array_avx2x4 /\
              0<=aT /\ aT<=200 /\ 0 < rATE8 /\ rATE8 < 200).
    + auto.
      ecall (__addstate_array_avx2x4_trace param_9 (BArray800.init_arr (W8.of_int 255) 800)
             param_8  param_7 b_param_2 param_6 b_param_1 param_5 b_param_0 param_4 b_param param_3              param_2 param_1). auto .
      rewrite /valid /= => &m /> *. smt(all_cat BArray800.init_arrP) .
    if. auto.
    + ecall (__addratebit_avx2x4_trace param_0 (BArray800.init_arr (W8.of_int 255) 800) param).           auto. rewrite /valid /= => &m /> *. smt(all_cat BArray800.init_arrP) .
    auto. smt(all_cat BArray800.init_arrP).
  seq 6: (valid  trace___absorb_array_avx2x4 /\ 0 <= offset /\
          is_init b_buf0 offset lEN /\ is_init b_buf1 offset lEN /\
          (lEN + if tRAILB <> 0 then 1 else 0) < 200 /\
          is_init b_buf2 offset lEN /\ is_init b_buf3 offset lEN /\   offset + lEN  <= size /\
          0 < rATE8 /\ rATE8 < 200 /\ 0<=lEN /\ 0<=tRAILB /\ tRAILB < 256 ).
  + auto.
    while ( valid trace___absorb_array_avx2x4 /\ 0 <= offset /\ 0<=i /\ i<=iTERS /\
            iTERS = lEN %/ rATE8 /\ rATE8 * iTERS <= lEN /\ aLL =_aT + _lEN /\ lEN <= _lEN /\
            lEN + offset - i * rATE8 = _offset + _lEN /\ _offset + _lEN <= size /\
            is_init b_buf0 offset ((iTERS - i)*rATE8 +  aLL%%rATE8) /\  aLL =_aT + _lEN /\
            is_init b_buf1 offset ((iTERS - i)*rATE8 +  aLL%%rATE8) /\
            (lEN + if tRAILB <> 0 then 1 else 0) < 200 /\
            is_init b_buf2 offset ((iTERS - i)*rATE8 +  aLL%%rATE8) /\
            is_init b_buf3 offset ((iTERS - i)*rATE8 +  aLL%%rATE8) /\
            0 < rATE8 /\ rATE8 < 200 /\ 0<=lEN /\ 0<=tRAILB /\ tRAILB < 256).
    + auto. ecall (_keccakf1600_avx2x4_trace param_21 (BArray800.init_arr (W8.of_int 255) 800)).
      auto.
      ecall(__addstate_array_avx2x4_trace param_30 (BArray800.init_arr (W8.of_int 255) 800)
                  param_29 param_28 b_param_10 param_27 b_param_9 param_26 b_param_8
                  param_25 b_param_7 param_24 param_23 param_22). auto.
      rewrite /valid /is_init /= => &m /> *.
      have ?: (rATE8{m} <= (lEN{m} %/ rATE8{m} - i{m}) * rATE8{m} ). smt().
      split. smt(BArray800.init_arrP). smt(all_cat).
    if. 
    + auto. ecall ( _keccakf1600_avx2x4_trace param_31 (BArray800.init_arr (W8.of_int 255) 800)).   
      auto.
      ecall(__addstate_array_avx2x4_trace param_40 (BArray800.init_arr (W8.of_int 255) 800)  
             param_39 param_38 b_param_14 param_37 b_param_13 param_36 b_param_12
             param_35 b_param_11 param_34 param_33 param_32). auto.
      rewrite /valid /is_init /= => &m /> *. split. smt(BArray800.init_arrP).
      move => *. 
      have: ((lEN{m} - (rATE8{m} - aT{m})) %/ rATE8{m} * rATE8{m} +
   (aT{m} + lEN{m}) %% rATE8{m} = lEN{m} - (rATE8{m} - aT{m}) ).
      + have h: ((lEN{m} - (rATE8{m} - aT{m})) %/ rATE8{m} * rATE8{m} = lEN{m} - (rATE8{m} - aT{m}) - (lEN{m} - (rATE8{m} - aT{m}))%%rATE8{m}). smt().  rewrite h.
        have h1: ((lEN{m} - (rATE8{m} - aT{m})) %% rATE8{m} = (lEN{m} + aT{m} - rATE8{m}) %% rATE8{m}). smt(). have h2:((lEN{m} + aT{m} - rATE8{m}) %% rATE8{m} = (lEN{m} + aT{m}) %% rATE8{m}). 
have /= ? := modzMDr (-1) (lEN{m} + aT{m}) (rATE8{m}). smt(). smt(). 
      smt(all_cat).
    auto. smt(all_cat).          
  seq 20: ( 0 <= offset /\ offset <= size /\ valid trace___absorb_array_avx2x4 /\
              0<=aT /\ aT<=200 /\ 0 < rATE8 /\ rATE8 < 200).
  + auto.
      ecall (__addstate_array_avx2x4_trace param_20 (BArray800.init_arr (W8.of_int 255) 800)
             param_19  param_18 b_param_6 param_17 b_param_5 param_16 b_param_4 param_15
             b_param_3 param_14  param_13 param_12). auto .
      rewrite /valid /= => &m /> *.  smt(all_cat BArray800.init_arrP) .
    if. auto.
    + ecall (__addratebit_avx2x4_trace param_11 (BArray800.init_arr (W8.of_int 255) 800) param_10).           auto. rewrite /valid /= => &m /> *. smt(all_cat BArray800.init_arrP) .
    auto. smt(all_cat BArray800.init_arrP).
qed .  

lemma __dumpstate_array_avx2x4_trace _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset _lEN _st _b_st :
      hoare [M.__dumpstate_array_avx2x4 :
      (((_b_st = b_st) /\
       ((_st = st) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\
       ((_b_buf3 = b_buf3) /\
       ((_buf3 = buf3) /\
       ((_b_buf2 = b_buf2) /\
       ((_buf2 = buf2) /\
       ((_b_buf1 = b_buf1) /\
       ((_buf1 = buf1) /\ ((_b_buf0 = b_buf0) /\ (_buf0 = buf0)))))))))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\ _lEN <= 200 /\
       ((_offset + _lEN) <= 18446744073709551615)) /\
      ((((0 <= _offset) /\ (0 <= _lEN)) /\ (is_init _b_st 0 800)) /\
      ((_offset + _lEN) <= size)))))) ==>
      ((((0 <= res.`9) /\ (res.`9 <= 18446744073709551615)) /\
       ((((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
        (((0 <= (_offset + _lEN)) /\
         ((_offset + _lEN) <= 18446744073709551615)) /\
        (res.`9 = (_offset + _lEN)))) /\
       (((foldr (fun x => (fun acc => (x /\ acc))) true
         (map
         (fun k =>
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
         ((0 <= (_offset + _lEN)) /\
         ((_offset + _lEN) <= 18446744073709551615)))))) (iota_ 0 size))) /\
        (foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        ((is_init res.`8 k 1) =
        ((is_init _b_buf3 k 1) \/ ((_offset <= k) /\ (k < (_offset + _lEN))))))
        (iota_ 0 size)))) /\
       (((foldr (fun x => (fun acc => (x /\ acc))) true
         (map
         (fun k =>
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
         ((0 <= (_offset + _lEN)) /\
         ((_offset + _lEN) <= 18446744073709551615)))))) (iota_ 0 size))) /\
        (foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        ((is_init res.`6 k 1) =
        ((is_init _b_buf2 k 1) \/ ((_offset <= k) /\ (k < (_offset + _lEN))))))
        (iota_ 0 size)))) /\
       (((foldr (fun x => (fun acc => (x /\ acc))) true
         (map
         (fun k =>
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
         ((0 <= (_offset + _lEN)) /\
         ((_offset + _lEN) <= 18446744073709551615)))))) (iota_ 0 size))) /\
        (foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        ((is_init res.`4 k 1) =
        ((is_init _b_buf1 k 1) \/ ((_offset <= k) /\ (k < (_offset + _lEN))))))
        (iota_ 0 size)))) /\
       ((foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        (((0 <= k) /\ (k <= 18446744073709551615)) /\
        (((0 <= k) /\ (k <= 18446744073709551615)) /\
        (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
        ((0 <= (_offset + _lEN)) /\
        ((_offset + _lEN) <= 18446744073709551615)))))) (iota_ 0 size))) /\
       (foldr (fun x => (fun acc => (x /\ acc))) true
       (map
       (fun k =>
       ((is_init res.`2 k 1) =
       ((is_init _b_buf0 k 1) \/ ((_offset <= k) /\ (k < (_offset + _lEN))))))
       (iota_ 0 size))))))))) /\
      (valid res.`10))].
proof.
  proc; have:= inbounds_size => /= *.
  pose fold_len (_b b:BArrayS.t) l := forall k, 0 <= k < size => is_init_cell b k =
                                        (is_init_cell _b k \/ _offset <=k /\ k < _offset + l).
  seq 21:( valid trace___dumpstate_array_avx2x4 /\ i = 32*(lEN %/ 32) /\0<=_offset /\
           0<=_lEN /\ _offset + _lEN <=size /\ fold_len _b_buf0 b_buf0 i /\
           fold_len _b_buf1 b_buf1 i /\  fold_len _b_buf2 b_buf2 i /\ lEN<= 200 /\
           fold_len _b_buf3 b_buf3 i /\ offset = _offset + i /\ lEN = _lEN).
  + while (valid trace___dumpstate_array_avx2x4 /\ 0<=i /\ i<= 32*(lEN %/ 32) /\0<=_offset /\
           0<=_lEN /\ _offset + _lEN <=size /\ fold_len _b_buf0 b_buf0 i /\ lEN <= 200 /\
           fold_len _b_buf1 b_buf1 i  /\  fold_len _b_buf2 b_buf2  i /\ i%%32 = 0 /\
           fold_len _b_buf3 b_buf3 i /\ offset = _offset + i /\ lEN = _lEN).
    + auto. ecall (__4u64x4_u256x4_trace param_22 param_21 param_20 param_19).
      auto. rewrite /is_init /valid /fold_len /= => &m /> *. smt(all_cat).
    auto. smt(all_cat and_iota).
  seq 1:( valid trace___dumpstate_array_avx2x4 /\ i = 8*(lEN %/ 8) /\0<=_offset /\
           0<=_lEN /\ _offset + _lEN <=size /\ fold_len _b_buf0 b_buf0 i /\
           fold_len _b_buf1 b_buf1 i /\  fold_len _b_buf2 b_buf2 i /\ lEN <= 200 /\
           fold_len _b_buf3 b_buf3 i /\ offset = _offset + i /\ lEN = _lEN).
  + while (valid trace___dumpstate_array_avx2x4 /\ 0<=i /\ i<= 8*(lEN %/ 8) /\0<=_offset /\
           0<=_lEN /\ _offset + _lEN <=size /\ fold_len _b_buf0 b_buf0 i /\ lEN <= 200 /\
           fold_len _b_buf1 b_buf1 i  /\  fold_len _b_buf2 b_buf2  i /\ i%%8 = 0 /\
           fold_len _b_buf3 b_buf3 i /\ offset = _offset + i /\ lEN = _lEN).
    + auto. rewrite /is_init /valid /fold_len /= => &m /> *.  smt(all_cat).
    auto. smt(all_cat).                                      
  if .
  + auto. ecall(__awrite_subu64_trace param_3 b_param param_2 param_1 param_0 param).
    auto. ecall(__awrite_subu64_trace param_8 b_param_0 param_7 param_6 param_5 param_4).
    auto. ecall(__awrite_subu64_trace param_13 b_param_1 param_12 param_11 param_10 param_9).
    auto. ecall(__awrite_subu64_trace param_18 b_param_2 param_17 param_16 param_15 param_14).
    auto .  rewrite /is_init /valid /fold_len /= => &m /> *.  smt(and_iota all_cat).
  auto. smt(and_iota).
qed.



lemma __squeeze_array_avx2x4_trace _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset _lEN _st _b_st _rATE8 :
      hoare [M.__squeeze_array_avx2x4 :
      (((_rATE8 = rATE8) /\
       ((_b_st = b_st) /\
       ((_st = st) /\
       ((_lEN = lEN) /\
       ((_offset = offset) /\
       ((_b_buf3 = b_buf3) /\
       ((_buf3 = buf3) /\
       ((_b_buf2 = b_buf2) /\
       ((_buf2 = buf2) /\
       ((_b_buf1 = b_buf1) /\
       ((_buf1 = buf1) /\ ((_b_buf0 = b_buf0) /\ (_buf0 = buf0))))))))))))) /\
      (((0 <= _offset) /\ (_offset <= 18446744073709551615)) /\
      (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
      (((0 <= (_offset + _lEN)) /\
       ((_offset + _lEN) <= 18446744073709551615)) /\
      ((((((0 <= _offset) /\ (0 <= _lEN)) /\ (is_init _b_st 0 800)) /\
        ((_offset + _lEN) <= size)) /\
       (0 < _rATE8)) /\
      (_rATE8 < 200)))))) ==>
      ((((0 <= res.`9) /\ (res.`9 <= 18446744073709551615)) /\
       ((is_init res.`11 0 800) /\
       (((foldr (fun x => (fun acc => (x /\ acc))) true
         (map
         (fun k =>
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
         ((0 <= (_offset + _lEN)) /\
         ((_offset + _lEN) <= 18446744073709551615)))))) (iota_ 0 size))) /\
        (foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        ((is_init res.`8 k 1) =
        ((is_init _b_buf3 k 1) \/ ((_offset <= k) /\ (k < (_offset + _lEN))))))
        (iota_ 0 size)))) /\
       (((foldr (fun x => (fun acc => (x /\ acc))) true
         (map
         (fun k =>
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
         ((0 <= (_offset + _lEN)) /\
         ((_offset + _lEN) <= 18446744073709551615)))))) (iota_ 0 size))) /\
        (foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        ((is_init res.`6 k 1) =
        ((is_init _b_buf2 k 1) \/ ((_offset <= k) /\ (k < (_offset + _lEN))))))
        (iota_ 0 size)))) /\
       (((foldr (fun x => (fun acc => (x /\ acc))) true
         (map
         (fun k =>
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= k) /\ (k <= 18446744073709551615)) /\
         (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
         ((0 <= (_offset + _lEN)) /\
         ((_offset + _lEN) <= 18446744073709551615)))))) (iota_ 0 size))) /\
        (foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        ((is_init res.`4 k 1) =
        ((is_init _b_buf1 k 1) \/ ((_offset <= k) /\ (k < (_offset + _lEN))))))
        (iota_ 0 size)))) /\
       ((foldr (fun x => (fun acc => (x /\ acc))) true
        (map
        (fun k =>
        (((0 <= k) /\ (k <= 18446744073709551615)) /\
        (((0 <= k) /\ (k <= 18446744073709551615)) /\
        (((0 <= _lEN) /\ (_lEN <= 18446744073709551615)) /\
        ((0 <= (_offset + _lEN)) /\
        ((_offset + _lEN) <= 18446744073709551615)))))) (iota_ 0 size))) /\
       (foldr (fun x => (fun acc => (x /\ acc))) true
       (map
       (fun k =>
       ((is_init res.`2 k 1) =
       ((is_init _b_buf0 k 1) \/ ((_offset <= k) /\ (k < (_offset + _lEN))))))
       (iota_ 0 size))))))))) /\
      (valid res.`12))].
proof.
  proc; have:= inbounds_size => /= *.
  pose fold_len (_b b:BArrayS.t) l := forall k, 0 <= k < size => is_init_cell b k =
                                        (is_init_cell _b k \/ _offset <=k /\ k < _offset + l).
  sp. if .
  + seq 1: ( valid trace___squeeze_array_avx2x4 /\ 0<=_offset /\ _offset + _lEN <=size /\
             0 <= _lEN /\ offset = _offset + _lEN - lO /\ lO = _lEN%%rATE8 /\ 0<rATE8 /\ rATE8<200
         /\  fold_len _b_buf0 b_buf0 (_lEN - lO) /\ fold_len _b_buf1 b_buf1 (_lEN - lO)  /\
             fold_len _b_buf2 b_buf2 (_lEN - lO) /\ fold_len _b_buf3 b_buf3 (_lEN - lO)).
    + auto .
      if .
      + while ( valid trace___squeeze_array_avx2x4 /\ 0<=_offset /\ _offset + _lEN <=size /\
             0 <= _lEN /\ offset = _offset + i*rATE8 /\ lO = _lEN%%rATE8 /\ 0<rATE8 /\ rATE8<200
         /\  fold_len _b_buf0 b_buf0 (i*rATE8) /\ fold_len _b_buf1 b_buf1 (i*rATE8)  /\
             fold_len _b_buf2 b_buf2 (i*rATE8) /\ fold_len _b_buf3 b_buf3 (i*rATE8) /\ 0<=i /\
             i<=iTERS /\ iTERS = _lEN%/rATE8 /\ iTERS * rATE8 <= _lEN).
        + auto.
          ecall (__dumpstate_array_avx2x4_trace param_13 b_param_6 param_12 b_param_5
                param_11 b_param_4 param_10 b_param_3 param_9 param_8 
                param_7 (BArray800.init_arr (W8.of_int 255) 800)). auto.
          ecall (_keccakf1600_avx2x4_trace param_14 (BArray800.init_arr (W8.of_int 255) 800)).
          auto .  rewrite /is_init /valid /fold_len /= => &m /> *. 
          split. smt(BArray800.init_arrP). move => *.
          split. smt(). smt(all_cat and_iota).
        auto. rewrite /is_init /valid /fold_len /= => &m /> *. smt(and_iota all_cat).           
      auto. rewrite /is_init /valid /fold_len /= => &m /> *. smt(and_iota all_cat). 
    if.
    + auto.
      ecall (__dumpstate_array_avx2x4_trace param_5 b_param_2 param_4 
              b_param_1 param_3 b_param_0 param_2 b_param param_1 param_0 param 
              (BArray800.init_arr (W8.of_int 255) 800)). auto.
      auto .
      ecall (_keccakf1600_avx2x4_trace param_6 (BArray800.init_arr (W8.of_int 255) 800)). auto.
      rewrite /is_init /valid /fold_len /= => &m /> *. smt(and_iota all_cat BArray800.init_arrP). 
    auto.
    rewrite /is_init /valid /fold_len /= => &m /> *. 
    rewrite !and_iota /=. smt(BArray800.init_arrP).
  auto. rewrite /is_init /valid /fold_len /= => &m /> *. 
  rewrite !and_iota /=. smt(BArray800.init_arrP).
qed .


end KECCAK_ARRAY_ASIZE.
