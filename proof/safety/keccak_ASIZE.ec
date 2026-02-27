require import AllCore IntDiv CoreMap List Distr.

from Jasmin require import JModel_x86.

import SLH64.

from Jasmin require import Jcheck JSafety.

from JazzEC require import
Array5 Array6 Array7 Array24 Array25 Array40 Array160 Array200 Array224
Array800  WArray192 BArray40 BArray160 BArray192 BArray200 BArray224
BArray800.

theory KECCAK_ARRAY_ASIZE.

op size : int.

axiom inbounds_size : 0 <= size < 18446744073709551616.

from Jasmin require import JByte_array.

clone import ByteArray as BArrayS with op size <= size .

abbrev [-printing] rOL8 =
(W256.of_int
13620818001941277694121380808605999856886653716761013959207994299728839901191
).

abbrev [-printing] rOL56 =
(W256.of_int
10910488462195273559651782724632284871561478246514020268633800075540923875841
).

abbrev  kECCAK_RHOTATES_RIGHT =
(BArray192.of_list256
[(W256.of_int 144373339913893657577751063007562604548177214458152943091773);
(W256.of_int 232252764209307188274174373867837442080505530800860351692863);
(W256.of_int 156927543384667019098616994515559168111335794127330162507795);
(W256.of_int 351517697181654122777866749001917765472957616589092975280182);
(W256.of_int 276192476357013953622045746931053922384479139705868246843454);
(W256.of_int 313855086769334038206421612937983674734430261968315659321364)]).

abbrev  kECCAK_RHOTATES_LEFT =
(BArray192.of_list256
[(W256.of_int 257361171150853911329517531560668107745210100483895842570243);
(W256.of_int 169481746855440380633094220700393270212881784141188433969153);
(W256.of_int 244806967680080549808651600052671544182051520814718623154221);
(W256.of_int 50216813883093446129401845566312946820429698352955810381834);
(W256.of_int 125542034707733615285222847637176789908908175236180538818562);
(W256.of_int 87879424295413530700846981630247037558957052973733126340652)]).

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

module M = {
  var tmp__trace : trace
  proc __SHLQ (x:W64.t, shbytes:int) : W64.t * trace = {
    var trace___SHLQ:trace;
    trace___SHLQ <- [];
    if ((shbytes <> 0)) {
      x <- (x `<<` (W8.of_int (8 * shbytes)));
    } else {
      
    }
    return (x, trace___SHLQ);
  }
  proc __SHLDQ (x:W128.t, shbytes:int) : W128.t * trace = {
    var trace___SHLDQ:trace;
    trace___SHLDQ <- [];
    if ((shbytes <> 0)) {
      x <- (VPSLLDQ_128 x (W8.of_int shbytes));
    } else {
      
    }
    return (x, trace___SHLDQ);
  }
  proc __SHLQ_256 (x:W256.t, shbytes:int) : W256.t * trace = {
    var trace___SHLQ_256:trace;
    trace___SHLQ_256 <- [];
    if ((shbytes <> 0)) {
      x <- (VPSLL_4u64 x (W128.of_int (8 * shbytes)));
    } else {
      
    }
    return (x, trace___SHLQ_256);
  }
  proc __m_ilen_read_upto8_at (buf:int, lEN:int, tRAIL:int, cUR:int, aT:int) : 
  int * int * int * int * W64.t * trace = {
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
    var trace___m_ilen_read_upto8_at:trace;
    trace___m_ilen_read_upto8_at <- [];
    trace___m_ilen_read_upto8_at <-
    (trace___m_ilen_read_upto8_at ++
    [(Assert,
     (((0 <= buf) /\ (buf <= 18446744073709551615)) /\
     ((((is_valid ptr_modulus Glob.mem_v buf
        (((8 - (aT - cUR)) < lEN) ? lEN : (8 - (aT - cUR)))) /\
       (0 <= lEN)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256))))]);
    trace___m_ilen_read_upto8_at <-
    (trace___m_ilen_read_upto8_at ++
    [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        trace___m_ilen_read_upto8_at <-
        (trace___m_ilen_read_upto8_at ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_ilen_read_upto8_at <-
        (trace___m_ilen_read_upto8_at ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 8))]);
        w <- (loadW64 Glob.mem buf);
        param_0 <- w;
        param <- aT8;
        (result, tmp__trace) <@ __SHLQ (param_0, param);
        trace___m_ilen_read_upto8_at <-
        (trace___m_ilen_read_upto8_at ++ tmp__trace);
        w <- result;
        trace___m_ilen_read_upto8_at <-
        (trace___m_ilen_read_upto8_at ++
        [(Assert, ((0 <= (8 - aT8)) /\ ((8 - aT8) <= 18446744073709551615)))]);
        trace___m_ilen_read_upto8_at <-
        (trace___m_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (buf + (8 - aT8))) /\
         ((buf + (8 - aT8)) <= 18446744073709551615)))]);
        buf <- (buf + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          trace___m_ilen_read_upto8_at <-
          (trace___m_ilen_read_upto8_at ++
          [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
          trace___m_ilen_read_upto8_at <-
          (trace___m_ilen_read_upto8_at ++
          [(Assert, (is_valid ptr_modulus Glob.mem_v buf 4))]);
          w <- (zeroextu64 (loadW32 Glob.mem buf));
          param_2 <- w;
          param_1 <- aT8;
          (result_0, tmp__trace) <@ __SHLQ (param_2, param_1);
          trace___m_ilen_read_upto8_at <-
          (trace___m_ilen_read_upto8_at ++ tmp__trace);
          w <- result_0;
          trace___m_ilen_read_upto8_at <-
          (trace___m_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= ((8 <= (4 + aT8)) ? (8 - aT8) : 4)) /\
           (((8 <= (4 + aT8)) ? (8 - aT8) : 4) <= 18446744073709551615)))]);
          trace___m_ilen_read_upto8_at <-
          (trace___m_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (buf + ((8 <= (4 + aT8)) ? (8 - aT8) : 4))) /\
           ((buf + ((8 <= (4 + aT8)) ? (8 - aT8) : 4)) <=
           18446744073709551615)))]);
          buf <- (buf + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          trace___m_ilen_read_upto8_at <-
          (trace___m_ilen_read_upto8_at ++
          [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
          trace___m_ilen_read_upto8_at <-
          (trace___m_ilen_read_upto8_at ++
          [(Assert, (is_valid ptr_modulus Glob.mem_v buf 2))]);
          t16 <- (zeroextu64 (loadW16 Glob.mem buf));
          trace___m_ilen_read_upto8_at <-
          (trace___m_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= ((8 <= (2 + aT8)) ? (8 - aT8) : 2)) /\
           (((8 <= (2 + aT8)) ? (8 - aT8) : 2) <= 18446744073709551615)))]);
          trace___m_ilen_read_upto8_at <-
          (trace___m_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (buf + ((8 <= (2 + aT8)) ? (8 - aT8) : 2))) /\
           ((buf + ((8 <= (2 + aT8)) ? (8 - aT8) : 2)) <=
           18446744073709551615)))]);
          buf <- (buf + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          param_4 <- t16;
          param_3 <- aT8;
          (result_1, tmp__trace) <@ __SHLQ (param_4, param_3);
          trace___m_ilen_read_upto8_at <-
          (trace___m_ilen_read_upto8_at ++ tmp__trace);
          t16 <- result_1;
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            trace___m_ilen_read_upto8_at <-
            (trace___m_ilen_read_upto8_at ++
            [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
            trace___m_ilen_read_upto8_at <-
            (trace___m_ilen_read_upto8_at ++
            [(Assert, (is_valid ptr_modulus Glob.mem_v buf 1))]);
            t8 <- (zeroextu64 (loadW8 Glob.mem buf));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            trace___m_ilen_read_upto8_at <-
            (trace___m_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (buf + 1)) /\ ((buf + 1) <= 18446744073709551615)))]);
            buf <- (buf + 1);
            lEN <- (lEN - 1);
            param_6 <- t8;
            param_5 <- aT8;
            (result_2, tmp__trace) <@ __SHLQ (param_6, param_5);
            trace___m_ilen_read_upto8_at <-
            (trace___m_ilen_read_upto8_at ++ tmp__trace);
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
              trace___m_ilen_read_upto8_at <-
              (trace___m_ilen_read_upto8_at ++ tmp__trace);
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
    return (buf, lEN, tRAIL, aT, w, trace___m_ilen_read_upto8_at);
  }
  proc __m_ilen_read_upto16_at (buf:int, lEN:int, tRAIL:int, cUR:int, aT:int) : 
  int * int * int * int * W128.t * trace = {
    var w:W128.t;
    var aT16:int;
    var t64_0:W64.t;
    var t64_1:W64.t;
    var param:int;
    var param_0:W128.t;
    var result:W128.t;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:int;
    var result_0:W64.t;
    var result_1:int;
    var result_2:int;
    var result_3:int;
    var result_4:int;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:int;
    var param_10:int;
    var result_5:W64.t;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var result_9:int;
    var param_11:int;
    var param_12:int;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var result_10:W64.t;
    var result_11:int;
    var result_12:int;
    var result_13:int;
    var result_14:int;
    var trace___m_ilen_read_upto16_at:trace;
    trace___m_ilen_read_upto16_at <- [];
    trace___m_ilen_read_upto16_at <-
    (trace___m_ilen_read_upto16_at ++
    [(Assert,
     (((0 <= buf) /\ (buf <= 18446744073709551615)) /\
     ((((is_valid ptr_modulus Glob.mem_v buf
        (((16 - (aT - cUR)) < lEN) ? lEN : (16 - (aT - cUR)))) /\
       (0 <= lEN)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256))))]);
    trace___m_ilen_read_upto16_at <-
    (trace___m_ilen_read_upto16_at ++
    [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 16) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (set0_128);
    } else {
      aT16 <- (aT - cUR);
      if ((16 <= lEN)) {
        trace___m_ilen_read_upto16_at <-
        (trace___m_ilen_read_upto16_at ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_ilen_read_upto16_at <-
        (trace___m_ilen_read_upto16_at ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 16))]);
        w <- (loadW128 Glob.mem buf);
        param_0 <- w;
        param <- aT16;
        (result, tmp__trace) <@ __SHLDQ (param_0, param);
        trace___m_ilen_read_upto16_at <-
        (trace___m_ilen_read_upto16_at ++ tmp__trace);
        w <- result;
        trace___m_ilen_read_upto16_at <-
        (trace___m_ilen_read_upto16_at ++
        [(Assert,
         ((0 <= (16 - aT16)) /\ ((16 - aT16) <= 18446744073709551615)))]);
        trace___m_ilen_read_upto16_at <-
        (trace___m_ilen_read_upto16_at ++
        [(Assert,
         ((0 <= (buf + (16 - aT16))) /\
         ((buf + (16 - aT16)) <= 18446744073709551615)))]);
        buf <- (buf + (16 - aT16));
        lEN <- (lEN - (16 - aT16));
        aT16 <- 16;
      } else {
        if ((8 <= aT16)) {
          w <- (set0_128);
          param_5 <- buf;
          param_4 <- lEN;
          param_3 <- tRAIL;
          param_2 <- 8;
          param_1 <- aT16;
          (result_4, result_3, result_2, result_1, result_0, tmp__trace) <@ 
          __m_ilen_read_upto8_at (param_5, param_4, param_3, param_2,
          param_1);
          trace___m_ilen_read_upto16_at <-
          (trace___m_ilen_read_upto16_at ++ tmp__trace);
          trace___m_ilen_read_upto16_at <-
          (trace___m_ilen_read_upto16_at ++
          [(Assert,
           (((0 <=
             ((((param_4 < (8 - (param_1 - param_2))) ? param_4 : (8 -
                                                                  (param_1 -
                                                                  param_2))) <
              0) ? 0 : ((param_4 < (8 - (param_1 - param_2))) ? param_4 : 
                       (8 - (param_1 - param_2))))) /\
            (((((param_4 < (8 - (param_1 - param_2))) ? param_4 : (8 -
                                                                  (param_1 -
                                                                  param_2))) <
              0) ? 0 : ((param_4 < (8 - (param_1 - param_2))) ? param_4 : 
                       (8 - (param_1 - param_2)))) <=
            18446744073709551615)) /\
           (((0 <=
             (param_5 +
             ((((param_4 < (8 - (param_1 - param_2))) ? param_4 : (8 -
                                                                  (param_1 -
                                                                  param_2))) <
              0) ? 0 : ((param_4 < (8 - (param_1 - param_2))) ? param_4 : 
                       (8 - (param_1 - param_2)))))) /\
            ((param_5 +
             ((((param_4 < (8 - (param_1 - param_2))) ? param_4 : (8 -
                                                                  (param_1 -
                                                                  param_2))) <
              0) ? 0 : ((param_4 < (8 - (param_1 - param_2))) ? param_4 : 
                       (8 - (param_1 - param_2))))) <=
            18446744073709551615)) /\
           (((param_2 <= param_1) /\ (param_1 < (param_2 + 8))) ? (((
                                                                    (
                                                                    result_4 =
                                                                    (
                                                                    param_5 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2)))))) /\
                                                                    (
                                                                    result_3 =
                                                                    (
                                                                    param_4 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))))))) /\
                                                                   (result_2 =
                                                                   ((8 <=
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4)) ? 
                                                                   param_3 : 0))) /\
                                                                  (result_1 =
                                                                  (param_2 +
                                                                  (((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4)) \/
                                                                    (
                                                                    param_3 =
                                                                    0)) ? 0 : 1)) <
                                                                   0) ? 0 : 
                                                                  (((
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4) <
                                                                    8) ? 
                                                                   ((
                                                                    param_1 -
                                                                    param_2) +
                                                                   param_4) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4)) \/
                                                                   (param_3 =
                                                                   0)) ? 0 : 1)))))) : 
           ((((result_4 = param_5) /\ (result_3 = param_4)) /\
            (result_2 = param_3)) /\
           (result_1 = param_1))))))]);
          trace___m_ilen_read_upto16_at <-
          (trace___m_ilen_read_upto16_at ++
          [(Assert, ((0 <= result_4) /\ (result_4 <= 18446744073709551615)))]);
          buf <- result_4;
          lEN <- result_3;
          tRAIL <- result_2;
          aT16 <- result_1;
          t64_1 <- result_0;
          w <- (VPINSR_2u64 w t64_1 (W8.of_int 1));
        } else {
          param_10 <- buf;
          param_9 <- lEN;
          param_8 <- tRAIL;
          param_7 <- 0;
          param_6 <- aT16;
          (result_9, result_8, result_7, result_6, result_5, tmp__trace) <@ 
          __m_ilen_read_upto8_at (param_10, param_9, param_8, param_7,
          param_6);
          trace___m_ilen_read_upto16_at <-
          (trace___m_ilen_read_upto16_at ++ tmp__trace);
          trace___m_ilen_read_upto16_at <-
          (trace___m_ilen_read_upto16_at ++
          [(Assert,
           (((0 <=
             ((((param_9 < (8 - (param_6 - param_7))) ? param_9 : (8 -
                                                                  (param_6 -
                                                                  param_7))) <
              0) ? 0 : ((param_9 < (8 - (param_6 - param_7))) ? param_9 : 
                       (8 - (param_6 - param_7))))) /\
            (((((param_9 < (8 - (param_6 - param_7))) ? param_9 : (8 -
                                                                  (param_6 -
                                                                  param_7))) <
              0) ? 0 : ((param_9 < (8 - (param_6 - param_7))) ? param_9 : 
                       (8 - (param_6 - param_7)))) <=
            18446744073709551615)) /\
           (((0 <=
             (param_10 +
             ((((param_9 < (8 - (param_6 - param_7))) ? param_9 : (8 -
                                                                  (param_6 -
                                                                  param_7))) <
              0) ? 0 : ((param_9 < (8 - (param_6 - param_7))) ? param_9 : 
                       (8 - (param_6 - param_7)))))) /\
            ((param_10 +
             ((((param_9 < (8 - (param_6 - param_7))) ? param_9 : (8 -
                                                                  (param_6 -
                                                                  param_7))) <
              0) ? 0 : ((param_9 < (8 - (param_6 - param_7))) ? param_9 : 
                       (8 - (param_6 - param_7))))) <=
            18446744073709551615)) /\
           (((param_7 <= param_6) /\ (param_6 < (param_7 + 8))) ? (((
                                                                    (
                                                                    result_9 =
                                                                    (
                                                                    param_10 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_9 <
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                    param_9 : 
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_9 <
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                    param_9 : 
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7)))))) /\
                                                                    (
                                                                    result_8 =
                                                                    (
                                                                    param_9 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_9 <
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                    param_9 : 
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_9 <
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                    param_9 : 
                                                                    (8 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))))))) /\
                                                                   (result_7 =
                                                                   ((8 <=
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9)) ? 
                                                                   param_8 : 0))) /\
                                                                  (result_6 =
                                                                  (param_7 +
                                                                  (((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9)) \/
                                                                    (
                                                                    param_8 =
                                                                    0)) ? 0 : 1)) <
                                                                   0) ? 0 : 
                                                                  (((
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9) <
                                                                    8) ? 
                                                                   ((
                                                                    param_6 -
                                                                    param_7) +
                                                                   param_9) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9)) \/
                                                                   (param_8 =
                                                                   0)) ? 0 : 1)))))) : 
           ((((result_9 = param_10) /\ (result_8 = param_9)) /\
            (result_7 = param_8)) /\
           (result_6 = param_6))))))]);
          trace___m_ilen_read_upto16_at <-
          (trace___m_ilen_read_upto16_at ++
          [(Assert, ((0 <= result_9) /\ (result_9 <= 18446744073709551615)))]);
          buf <- result_9;
          lEN <- result_8;
          tRAIL <- result_7;
          aT16 <- result_6;
          t64_0 <- result_5;
          w <- (zeroextu128 t64_0);
          param_15 <- buf;
          param_14 <- lEN;
          param_13 <- tRAIL;
          param_12 <- 8;
          param_11 <- aT16;
          (result_14, result_13, result_12, result_11, result_10, tmp__trace) <@ 
          __m_ilen_read_upto8_at (param_15, param_14, param_13, param_12,
          param_11);
          trace___m_ilen_read_upto16_at <-
          (trace___m_ilen_read_upto16_at ++ tmp__trace);
          trace___m_ilen_read_upto16_at <-
          (trace___m_ilen_read_upto16_at ++
          [(Assert,
           (((0 <=
             ((((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
               (8 - (param_11 - param_12))) <
              0) ? 0 : ((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
                       (8 - (param_11 - param_12))))) /\
            (((((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
               (8 - (param_11 - param_12))) <
              0) ? 0 : ((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
                       (8 - (param_11 - param_12)))) <=
            18446744073709551615)) /\
           (((0 <=
             (param_15 +
             ((((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
               (8 - (param_11 - param_12))) <
              0) ? 0 : ((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
                       (8 - (param_11 - param_12)))))) /\
            ((param_15 +
             ((((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
               (8 - (param_11 - param_12))) <
              0) ? 0 : ((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
                       (8 - (param_11 - param_12))))) <=
            18446744073709551615)) /\
           (((param_12 <= param_11) /\ (param_11 < (param_12 + 8))) ? 
           ((((result_14 =
              (param_15 +
              ((((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
                (8 - (param_11 - param_12))) <
               0) ? 0 : ((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
                        (8 - (param_11 - param_12)))))) /\
             (result_13 =
             (param_14 -
             ((((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
               (8 - (param_11 - param_12))) <
              0) ? 0 : ((param_14 < (8 - (param_11 - param_12))) ? param_14 : 
                       (8 - (param_11 - param_12))))))) /\
            (result_12 =
            ((8 <= ((param_11 - param_12) + param_14)) ? param_13 : 0))) /\
           (result_11 =
           (param_12 +
           (((((((param_11 - param_12) + param_14) < 8) ? ((param_11 -
                                                           param_12) +
                                                          param_14) : 8) +
             (((8 <= ((param_11 - param_12) + param_14)) \/ (param_13 = 0)) ? 0 : 1)) <
            0) ? 0 : (((((param_11 - param_12) + param_14) < 8) ? ((param_11 -
                                                                   param_12) +
                                                                  param_14) : 8) +
                     (((8 <= ((param_11 - param_12) + param_14)) \/
                      (param_13 = 0)) ? 0 : 1)))))) : ((((result_14 =
                                                         param_15) /\
                                                        (result_13 =
                                                        param_14)) /\
                                                       (result_12 = param_13)) /\
                                                      (result_11 = param_11))))))]);
          trace___m_ilen_read_upto16_at <-
          (trace___m_ilen_read_upto16_at ++
          [(Assert,
           ((0 <= result_14) /\ (result_14 <= 18446744073709551615)))]);
          buf <- result_14;
          lEN <- result_13;
          tRAIL <- result_12;
          aT16 <- result_11;
          t64_1 <- result_10;
          w <- (VPINSR_2u64 w t64_1 (W8.of_int 1));
        }
      }
      aT <- (cUR + aT16);
    }
    return (buf, lEN, tRAIL, aT, w, trace___m_ilen_read_upto16_at);
  }
  proc __m_ilen_read_upto32_at (buf:int, lEN:int, tRAIL:int, cUR:int, aT:int) : 
  int * int * int * int * W256.t * trace = {
    var w:W256.t;
    var aT32:int;
    var t128_0:W128.t;
    var t128_1:W128.t;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var result:W128.t;
    var result_0:int;
    var result_1:int;
    var result_2:int;
    var result_3:int;
    var param_4:int;
    var param_5:int;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var result_4:W128.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:int;
    var param_13:int;
    var result_9:W128.t;
    var result_10:int;
    var result_11:int;
    var result_12:int;
    var result_13:int;
    var trace___m_ilen_read_upto32_at:trace;
    trace___m_ilen_read_upto32_at <- [];
    trace___m_ilen_read_upto32_at <-
    (trace___m_ilen_read_upto32_at ++
    [(Assert,
     (((0 <= buf) /\ (buf <= 18446744073709551615)) /\
     ((((is_valid ptr_modulus Glob.mem_v buf
        (((32 - (aT - cUR)) < lEN) ? lEN : (32 - (aT - cUR)))) /\
       (0 <= lEN)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256))))]);
    trace___m_ilen_read_upto32_at <-
    (trace___m_ilen_read_upto32_at ++
    [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 32) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (set0_256);
    } else {
      aT32 <- (aT - cUR);
      if (((aT32 = 0) /\ (32 <= lEN))) {
        trace___m_ilen_read_upto32_at <-
        (trace___m_ilen_read_upto32_at ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_ilen_read_upto32_at <-
        (trace___m_ilen_read_upto32_at ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 32))]);
        w <- (loadW256 Glob.mem buf);
        aT32 <- (aT32 + 32);
        trace___m_ilen_read_upto32_at <-
        (trace___m_ilen_read_upto32_at ++
        [(Assert,
         ((0 <= (buf + 32)) /\ ((buf + 32) <= 18446744073709551615)))]);
        buf <- (buf + 32);
        lEN <- (lEN - 32);
      } else {
        if ((16 <= aT32)) {
          w <- (set0_256);
          param_3 <- buf;
          param_2 <- lEN;
          param_1 <- tRAIL;
          param_0 <- 16;
          param <- aT32;
          (result_3, result_2, result_1, result_0, result, tmp__trace) <@ 
          __m_ilen_read_upto16_at (param_3, param_2, param_1, param_0,
          param);
          trace___m_ilen_read_upto32_at <-
          (trace___m_ilen_read_upto32_at ++ tmp__trace);
          trace___m_ilen_read_upto32_at <-
          (trace___m_ilen_read_upto32_at ++
          [(Assert,
           (((0 <=
             ((((param_2 < (16 - (param - param_0))) ? param_2 : (16 -
                                                                 (param -
                                                                 param_0))) <
              0) ? 0 : ((param_2 < (16 - (param - param_0))) ? param_2 : 
                       (16 - (param - param_0))))) /\
            (((((param_2 < (16 - (param - param_0))) ? param_2 : (16 -
                                                                 (param -
                                                                 param_0))) <
              0) ? 0 : ((param_2 < (16 - (param - param_0))) ? param_2 : 
                       (16 - (param - param_0)))) <=
            18446744073709551615)) /\
           (((0 <=
             (param_3 +
             ((((param_2 < (16 - (param - param_0))) ? param_2 : (16 -
                                                                 (param -
                                                                 param_0))) <
              0) ? 0 : ((param_2 < (16 - (param - param_0))) ? param_2 : 
                       (16 - (param - param_0)))))) /\
            ((param_3 +
             ((((param_2 < (16 - (param - param_0))) ? param_2 : (16 -
                                                                 (param -
                                                                 param_0))) <
              0) ? 0 : ((param_2 < (16 - (param - param_0))) ? param_2 : 
                       (16 - (param - param_0))))) <=
            18446744073709551615)) /\
           (((param_0 <= param) /\ (param < (param_0 + 16))) ? ((((result_3 =
                                                                  (param_3 +
                                                                  (((
                                                                    (
                                                                    param_2 <
                                                                    (16 -
                                                                    (
                                                                    param -
                                                                    param_0))) ? 
                                                                    param_2 : 
                                                                    (16 -
                                                                    (
                                                                    param -
                                                                    param_0))) <
                                                                   0) ? 0 : 
                                                                  ((param_2 <
                                                                   (16 -
                                                                   (param -
                                                                   param_0))) ? 
                                                                  param_2 : 
                                                                  (16 -
                                                                  (param -
                                                                  param_0)))))) /\
                                                                 (result_2 =
                                                                 (param_2 -
                                                                 ((((
                                                                    param_2 <
                                                                    (16 -
                                                                    (
                                                                    param -
                                                                    param_0))) ? 
                                                                   param_2 : 
                                                                   (16 -
                                                                   (param -
                                                                   param_0))) <
                                                                  0) ? 0 : 
                                                                 ((param_2 <
                                                                  (16 -
                                                                  (param -
                                                                  param_0))) ? 
                                                                 param_2 : 
                                                                 (16 -
                                                                 (param -
                                                                 param_0))))))) /\
                                                                (result_1 =
                                                                ((16 <=
                                                                 ((param -
                                                                  param_0) +
                                                                 param_2)) ? 
                                                                param_1 : 0))) /\
                                                               (result_0 =
                                                               (param_0 +
                                                               ((((((
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) <
                                                                   16) ? 
                                                                  ((param -
                                                                   param_0) +
                                                                  param_2) : 16) +
                                                                 (((16 <=
                                                                   ((
                                                                    param -
                                                                    param_0) +
                                                                   param_2)) \/
                                                                  (param_1 =
                                                                  0)) ? 0 : 1)) <
                                                                0) ? 0 : 
                                                               (((((param -
                                                                   param_0) +
                                                                  param_2) <
                                                                 16) ? 
                                                                ((param -
                                                                 param_0) +
                                                                param_2) : 16) +
                                                               (((16 <=
                                                                 ((param -
                                                                  param_0) +
                                                                 param_2)) \/
                                                                (param_1 = 0)) ? 0 : 1)))))) : 
           ((((result_3 = param_3) /\ (result_2 = param_2)) /\
            (result_1 = param_1)) /\
           (result_0 = param))))))]);
          trace___m_ilen_read_upto32_at <-
          (trace___m_ilen_read_upto32_at ++
          [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
          buf <- result_3;
          lEN <- result_2;
          tRAIL <- result_1;
          aT32 <- result_0;
          t128_1 <- result;
          w <- (VINSERTI128 w t128_1 (W8.of_int 1));
        } else {
          param_8 <- buf;
          param_7 <- lEN;
          param_6 <- tRAIL;
          param_5 <- 0;
          param_4 <- aT32;
          (result_8, result_7, result_6, result_5, result_4, tmp__trace) <@ 
          __m_ilen_read_upto16_at (param_8, param_7, param_6, param_5,
          param_4);
          trace___m_ilen_read_upto32_at <-
          (trace___m_ilen_read_upto32_at ++ tmp__trace);
          trace___m_ilen_read_upto32_at <-
          (trace___m_ilen_read_upto32_at ++
          [(Assert,
           (((0 <=
             ((((param_7 < (16 - (param_4 - param_5))) ? param_7 : (16 -
                                                                   (param_4 -
                                                                   param_5))) <
              0) ? 0 : ((param_7 < (16 - (param_4 - param_5))) ? param_7 : 
                       (16 - (param_4 - param_5))))) /\
            (((((param_7 < (16 - (param_4 - param_5))) ? param_7 : (16 -
                                                                   (param_4 -
                                                                   param_5))) <
              0) ? 0 : ((param_7 < (16 - (param_4 - param_5))) ? param_7 : 
                       (16 - (param_4 - param_5)))) <=
            18446744073709551615)) /\
           (((0 <=
             (param_8 +
             ((((param_7 < (16 - (param_4 - param_5))) ? param_7 : (16 -
                                                                   (param_4 -
                                                                   param_5))) <
              0) ? 0 : ((param_7 < (16 - (param_4 - param_5))) ? param_7 : 
                       (16 - (param_4 - param_5)))))) /\
            ((param_8 +
             ((((param_7 < (16 - (param_4 - param_5))) ? param_7 : (16 -
                                                                   (param_4 -
                                                                   param_5))) <
              0) ? 0 : ((param_7 < (16 - (param_4 - param_5))) ? param_7 : 
                       (16 - (param_4 - param_5))))) <=
            18446744073709551615)) /\
           (((param_5 <= param_4) /\ (param_4 < (param_5 + 16))) ? ((
                                                                    (
                                                                    (
                                                                    result_8 =
                                                                    (
                                                                    param_8 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_7 <
                                                                    (16 -
                                                                    (
                                                                    param_4 -
                                                                    param_5))) ? 
                                                                    param_7 : 
                                                                    (16 -
                                                                    (
                                                                    param_4 -
                                                                    param_5))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_7 <
                                                                    (16 -
                                                                    (
                                                                    param_4 -
                                                                    param_5))) ? 
                                                                    param_7 : 
                                                                    (16 -
                                                                    (
                                                                    param_4 -
                                                                    param_5)))))) /\
                                                                    (
                                                                    result_7 =
                                                                    (
                                                                    param_7 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_7 <
                                                                    (16 -
                                                                    (
                                                                    param_4 -
                                                                    param_5))) ? 
                                                                    param_7 : 
                                                                    (16 -
                                                                    (
                                                                    param_4 -
                                                                    param_5))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_7 <
                                                                    (16 -
                                                                    (
                                                                    param_4 -
                                                                    param_5))) ? 
                                                                    param_7 : 
                                                                    (16 -
                                                                    (
                                                                    param_4 -
                                                                    param_5))))))) /\
                                                                    (
                                                                    result_6 =
                                                                    (
                                                                    (16 <=
                                                                    (
                                                                    (
                                                                    param_4 -
                                                                    param_5) +
                                                                    param_7)) ? 
                                                                    param_6 : 0))) /\
                                                                   (result_5 =
                                                                   (param_5 +
                                                                   ((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_4 -
                                                                    param_5) +
                                                                    param_7) <
                                                                    16) ? 
                                                                    (
                                                                    (
                                                                    param_4 -
                                                                    param_5) +
                                                                    param_7) : 16) +
                                                                    (
                                                                    (
                                                                    (16 <=
                                                                    (
                                                                    (
                                                                    param_4 -
                                                                    param_5) +
                                                                    param_7)) \/
                                                                    (
                                                                    param_6 =
                                                                    0)) ? 0 : 1)) <
                                                                    0) ? 0 : 
                                                                   ((
                                                                    (
                                                                    (
                                                                    (
                                                                    param_4 -
                                                                    param_5) +
                                                                    param_7) <
                                                                    16) ? 
                                                                    (
                                                                    (
                                                                    param_4 -
                                                                    param_5) +
                                                                    param_7) : 16) +
                                                                   ((
                                                                    (16 <=
                                                                    (
                                                                    (
                                                                    param_4 -
                                                                    param_5) +
                                                                    param_7)) \/
                                                                    (
                                                                    param_6 =
                                                                    0)) ? 0 : 1)))))) : 
           ((((result_8 = param_8) /\ (result_7 = param_7)) /\
            (result_6 = param_6)) /\
           (result_5 = param_4))))))]);
          trace___m_ilen_read_upto32_at <-
          (trace___m_ilen_read_upto32_at ++
          [(Assert, ((0 <= result_8) /\ (result_8 <= 18446744073709551615)))]);
          buf <- result_8;
          lEN <- result_7;
          tRAIL <- result_6;
          aT32 <- result_5;
          t128_0 <- result_4;
          param_13 <- buf;
          param_12 <- lEN;
          param_11 <- tRAIL;
          param_10 <- 16;
          param_9 <- aT32;
          (result_13, result_12, result_11, result_10, result_9, tmp__trace) <@ 
          __m_ilen_read_upto16_at (param_13, param_12, param_11, param_10,
          param_9);
          trace___m_ilen_read_upto32_at <-
          (trace___m_ilen_read_upto32_at ++ tmp__trace);
          trace___m_ilen_read_upto32_at <-
          (trace___m_ilen_read_upto32_at ++
          [(Assert,
           (((0 <=
             ((((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
               (16 - (param_9 - param_10))) <
              0) ? 0 : ((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
                       (16 - (param_9 - param_10))))) /\
            (((((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
               (16 - (param_9 - param_10))) <
              0) ? 0 : ((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
                       (16 - (param_9 - param_10)))) <=
            18446744073709551615)) /\
           (((0 <=
             (param_13 +
             ((((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
               (16 - (param_9 - param_10))) <
              0) ? 0 : ((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
                       (16 - (param_9 - param_10)))))) /\
            ((param_13 +
             ((((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
               (16 - (param_9 - param_10))) <
              0) ? 0 : ((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
                       (16 - (param_9 - param_10))))) <=
            18446744073709551615)) /\
           (((param_10 <= param_9) /\ (param_9 < (param_10 + 16))) ? 
           ((((result_13 =
              (param_13 +
              ((((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
                (16 - (param_9 - param_10))) <
               0) ? 0 : ((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
                        (16 - (param_9 - param_10)))))) /\
             (result_12 =
             (param_12 -
             ((((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
               (16 - (param_9 - param_10))) <
              0) ? 0 : ((param_12 < (16 - (param_9 - param_10))) ? param_12 : 
                       (16 - (param_9 - param_10))))))) /\
            (result_11 =
            ((16 <= ((param_9 - param_10) + param_12)) ? param_11 : 0))) /\
           (result_10 =
           (param_10 +
           (((((((param_9 - param_10) + param_12) < 16) ? ((param_9 -
                                                           param_10) +
                                                          param_12) : 16) +
             (((16 <= ((param_9 - param_10) + param_12)) \/ (param_11 = 0)) ? 0 : 1)) <
            0) ? 0 : (((((param_9 - param_10) + param_12) < 16) ? ((param_9 -
                                                                   param_10) +
                                                                  param_12) : 16) +
                     (((16 <= ((param_9 - param_10) + param_12)) \/
                      (param_11 = 0)) ? 0 : 1)))))) : ((((result_13 =
                                                         param_13) /\
                                                        (result_12 =
                                                        param_12)) /\
                                                       (result_11 = param_11)) /\
                                                      (result_10 = param_9))))))]);
          trace___m_ilen_read_upto32_at <-
          (trace___m_ilen_read_upto32_at ++
          [(Assert,
           ((0 <= result_13) /\ (result_13 <= 18446744073709551615)))]);
          buf <- result_13;
          lEN <- result_12;
          tRAIL <- result_11;
          aT32 <- result_10;
          t128_1 <- result_9;
          w <-
          (W256.of_int
          (((W128.to_uint t128_0) %% (2 ^ 128)) +
          ((2 ^ 128) * (W128.to_uint t128_1))));
        }
      }
      aT <- (cUR + aT32);
    }
    return (buf, lEN, tRAIL, aT, w, trace___m_ilen_read_upto32_at);
  }
  proc __m_ilen_read_bcast_upto8_at (buf:int, lEN:int, tRAIL:int, cUR:int,
                                     aT:int) : int * int * int * int *
                                               W256.t * trace = {
    var w256:W256.t;
    var aT8:int;
    var w:W64.t;
    var t128:W128.t;
    var param:int;
    var param_0:W256.t;
    var result:W256.t;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:int;
    var result_0:W64.t;
    var result_1:int;
    var result_2:int;
    var result_3:int;
    var result_4:int;
    var param_6:int;
    var param_7:W256.t;
    var result_5:W256.t;
    var trace___m_ilen_read_bcast_upto8_at:trace;
    trace___m_ilen_read_bcast_upto8_at <- [];
    trace___m_ilen_read_bcast_upto8_at <-
    (trace___m_ilen_read_bcast_upto8_at ++
    [(Assert,
     (((0 <= buf) /\ (buf <= 18446744073709551615)) /\
     ((((is_valid ptr_modulus Glob.mem_v buf
        (((8 - (aT - cUR)) < lEN) ? lEN : (8 - (aT - cUR)))) /\
       (0 <= lEN)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256))))]);
    trace___m_ilen_read_bcast_upto8_at <-
    (trace___m_ilen_read_bcast_upto8_at ++
    [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w256 <- (set0_256);
    } else {
      if ((8 <= lEN)) {
        aT8 <- (aT - cUR);
        trace___m_ilen_read_bcast_upto8_at <-
        (trace___m_ilen_read_bcast_upto8_at ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_ilen_read_bcast_upto8_at <-
        (trace___m_ilen_read_bcast_upto8_at ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 8))]);
        w256 <- (VPBROADCAST_4u64 (loadW64 Glob.mem buf));
        param_0 <- w256;
        param <- aT8;
        (result, tmp__trace) <@ __SHLQ_256 (param_0, param);
        trace___m_ilen_read_bcast_upto8_at <-
        (trace___m_ilen_read_bcast_upto8_at ++ tmp__trace);
        w256 <- result;
        trace___m_ilen_read_bcast_upto8_at <-
        (trace___m_ilen_read_bcast_upto8_at ++
        [(Assert, ((0 <= (8 - aT8)) /\ ((8 - aT8) <= 18446744073709551615)))]);
        trace___m_ilen_read_bcast_upto8_at <-
        (trace___m_ilen_read_bcast_upto8_at ++
        [(Assert,
         ((0 <= (buf + (8 - aT8))) /\
         ((buf + (8 - aT8)) <= 18446744073709551615)))]);
        buf <- (buf + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT <- (cUR + 8);
      } else {
        aT8 <- (aT - cUR);
        param_5 <- buf;
        param_4 <- lEN;
        param_3 <- tRAIL;
        param_2 <- cUR;
        param_1 <- aT;
        (result_4, result_3, result_2, result_1, result_0, tmp__trace) <@ 
        __m_ilen_read_upto8_at (param_5, param_4, param_3, param_2, param_1);
        trace___m_ilen_read_bcast_upto8_at <-
        (trace___m_ilen_read_bcast_upto8_at ++ tmp__trace);
        trace___m_ilen_read_bcast_upto8_at <-
        (trace___m_ilen_read_bcast_upto8_at ++
        [(Assert,
         (((0 <=
           ((((param_4 < (8 - (param_1 - param_2))) ? param_4 : (8 -
                                                                (param_1 -
                                                                param_2))) <
            0) ? 0 : ((param_4 < (8 - (param_1 - param_2))) ? param_4 : 
                     (8 - (param_1 - param_2))))) /\
          (((((param_4 < (8 - (param_1 - param_2))) ? param_4 : (8 -
                                                                (param_1 -
                                                                param_2))) <
            0) ? 0 : ((param_4 < (8 - (param_1 - param_2))) ? param_4 : 
                     (8 - (param_1 - param_2)))) <=
          18446744073709551615)) /\
         (((0 <=
           (param_5 +
           ((((param_4 < (8 - (param_1 - param_2))) ? param_4 : (8 -
                                                                (param_1 -
                                                                param_2))) <
            0) ? 0 : ((param_4 < (8 - (param_1 - param_2))) ? param_4 : 
                     (8 - (param_1 - param_2)))))) /\
          ((param_5 +
           ((((param_4 < (8 - (param_1 - param_2))) ? param_4 : (8 -
                                                                (param_1 -
                                                                param_2))) <
            0) ? 0 : ((param_4 < (8 - (param_1 - param_2))) ? param_4 : 
                     (8 - (param_1 - param_2))))) <=
          18446744073709551615)) /\
         (((param_2 <= param_1) /\ (param_1 < (param_2 + 8))) ? ((((result_4 =
                                                                   (param_5 +
                                                                   ((
                                                                    (
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) <
                                                                    0) ? 0 : 
                                                                   ((
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                   param_4 : 
                                                                   (8 -
                                                                   (param_1 -
                                                                   param_2)))))) /\
                                                                  (result_3 =
                                                                  (param_4 -
                                                                  (((
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) <
                                                                   0) ? 0 : 
                                                                  ((param_4 <
                                                                   (8 -
                                                                   (param_1 -
                                                                   param_2))) ? 
                                                                  param_4 : 
                                                                  (8 -
                                                                  (param_1 -
                                                                  param_2))))))) /\
                                                                 (result_2 =
                                                                 ((8 <=
                                                                  ((param_1 -
                                                                   param_2) +
                                                                  param_4)) ? 
                                                                 param_3 : 0))) /\
                                                                (result_1 =
                                                                (param_2 +
                                                                (((((
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4) <
                                                                    8) ? 
                                                                   ((
                                                                    param_1 -
                                                                    param_2) +
                                                                   param_4) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4)) \/
                                                                   (param_3 =
                                                                   0)) ? 0 : 1)) <
                                                                 0) ? 0 : 
                                                                (((((
                                                                    param_1 -
                                                                    param_2) +
                                                                   param_4) <
                                                                  8) ? 
                                                                 ((param_1 -
                                                                  param_2) +
                                                                 param_4) : 8) +
                                                                (((8 <=
                                                                  ((param_1 -
                                                                   param_2) +
                                                                  param_4)) \/
                                                                 (param_3 =
                                                                 0)) ? 0 : 1)))))) : 
         ((((result_4 = param_5) /\ (result_3 = param_4)) /\
          (result_2 = param_3)) /\
         (result_1 = param_1))))))]);
        trace___m_ilen_read_bcast_upto8_at <-
        (trace___m_ilen_read_bcast_upto8_at ++
        [(Assert, ((0 <= result_4) /\ (result_4 <= 18446744073709551615)))]);
        buf <- result_4;
        lEN <- result_3;
        tRAIL <- result_2;
        aT <- result_1;
        w <- result_0;
        t128 <- (zeroextu128 w);
        w256 <- (VPBROADCAST_4u64 (truncateu64 t128));
        param_7 <- w256;
        param_6 <- aT8;
        (result_5, tmp__trace) <@ __SHLQ_256 (param_7, param_6);
        trace___m_ilen_read_bcast_upto8_at <-
        (trace___m_ilen_read_bcast_upto8_at ++ tmp__trace);
        w256 <- result_5;
      }
    }
    return (buf, lEN, tRAIL, aT, w256, trace___m_ilen_read_bcast_upto8_at);
  }
  proc __m_ilen_write_upto8 (buf:int, lEN:int, w:W64.t) : int * int * trace = {
    var trace___m_ilen_write_upto8:trace;
    trace___m_ilen_write_upto8 <- [];
    trace___m_ilen_write_upto8 <-
    (trace___m_ilen_write_upto8 ++
    [(Assert,
     (((0 <= buf) /\ (buf <= 18446744073709551615)) /\
     (is_valid ptr_modulus Glob.mem_v buf ((lEN < 8) ? lEN : 8))))]);
    trace___m_ilen_write_upto8 <-
    (trace___m_ilen_write_upto8 ++
    [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        trace___m_ilen_write_upto8 <-
        (trace___m_ilen_write_upto8 ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_ilen_write_upto8 <-
        (trace___m_ilen_write_upto8 ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 8))]);
        Glob.mem <- (storeW64 Glob.mem buf w);
        trace___m_ilen_write_upto8 <-
        (trace___m_ilen_write_upto8 ++
        [(Assert, ((0 <= (buf + 8)) /\ ((buf + 8) <= 18446744073709551615)))]);
        buf <- (buf + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          trace___m_ilen_write_upto8 <-
          (trace___m_ilen_write_upto8 ++
          [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
          trace___m_ilen_write_upto8 <-
          (trace___m_ilen_write_upto8 ++
          [(Assert, (is_valid ptr_modulus Glob.mem_v buf 4))]);
          Glob.mem <- (storeW32 Glob.mem buf (truncateu32 w));
          w <- (w `>>` (W8.of_int 32));
          trace___m_ilen_write_upto8 <-
          (trace___m_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (buf + 4)) /\ ((buf + 4) <= 18446744073709551615)))]);
          buf <- (buf + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          trace___m_ilen_write_upto8 <-
          (trace___m_ilen_write_upto8 ++
          [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
          trace___m_ilen_write_upto8 <-
          (trace___m_ilen_write_upto8 ++
          [(Assert, (is_valid ptr_modulus Glob.mem_v buf 2))]);
          Glob.mem <- (storeW16 Glob.mem buf (truncateu16 w));
          w <- (w `>>` (W8.of_int 16));
          trace___m_ilen_write_upto8 <-
          (trace___m_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (buf + 2)) /\ ((buf + 2) <= 18446744073709551615)))]);
          buf <- (buf + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          trace___m_ilen_write_upto8 <-
          (trace___m_ilen_write_upto8 ++
          [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
          trace___m_ilen_write_upto8 <-
          (trace___m_ilen_write_upto8 ++
          [(Assert, (is_valid ptr_modulus Glob.mem_v buf 1))]);
          Glob.mem <- (storeW8 Glob.mem buf (truncateu8 w));
          trace___m_ilen_write_upto8 <-
          (trace___m_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (buf + 1)) /\ ((buf + 1) <= 18446744073709551615)))]);
          buf <- (buf + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, lEN, trace___m_ilen_write_upto8);
  }
  proc __m_ilen_write_upto16 (buf:int, lEN:int, w:W128.t) : int * int * trace = {
    var t64:W64.t;
    var param:W64.t;
    var param_0:int;
    var param_1:int;
    var result:int;
    var result_0:int;
    var trace___m_ilen_write_upto16:trace;
    trace___m_ilen_write_upto16 <- [];
    trace___m_ilen_write_upto16 <-
    (trace___m_ilen_write_upto16 ++
    [(Assert,
     (((0 <= buf) /\ (buf <= 18446744073709551615)) /\
     (is_valid ptr_modulus Glob.mem_v buf ((lEN < 16) ? lEN : 16))))]);
    trace___m_ilen_write_upto16 <-
    (trace___m_ilen_write_upto16 ++
    [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((16 <= lEN)) {
        trace___m_ilen_write_upto16 <-
        (trace___m_ilen_write_upto16 ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_ilen_write_upto16 <-
        (trace___m_ilen_write_upto16 ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 16))]);
        Glob.mem <- (storeW128 Glob.mem buf w);
        trace___m_ilen_write_upto16 <-
        (trace___m_ilen_write_upto16 ++
        [(Assert,
         ((0 <= (buf + 16)) /\ ((buf + 16) <= 18446744073709551615)))]);
        buf <- (buf + 16);
        lEN <- (lEN - 16);
      } else {
        if ((8 <= lEN)) {
          trace___m_ilen_write_upto16 <-
          (trace___m_ilen_write_upto16 ++
          [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
          trace___m_ilen_write_upto16 <-
          (trace___m_ilen_write_upto16 ++
          [(Assert, (is_valid ptr_modulus Glob.mem_v buf 8))]);
          Glob.mem <- (storeW64 Glob.mem buf (MOVV_64 (truncateu64 w)));
          trace___m_ilen_write_upto16 <-
          (trace___m_ilen_write_upto16 ++
          [(Assert,
           ((0 <= (buf + 8)) /\ ((buf + 8) <= 18446744073709551615)))]);
          buf <- (buf + 8);
          lEN <- (lEN - 8);
          w <- (VPUNPCKH_2u64 w w);
        } else {
          
        }
        t64 <- (truncateu64 w);
        param_1 <- buf;
        param_0 <- lEN;
        param <- t64;
        (result_0, result, tmp__trace) <@ __m_ilen_write_upto8 (param_1,
        param_0, param);
        trace___m_ilen_write_upto16 <-
        (trace___m_ilen_write_upto16 ++ tmp__trace);
        trace___m_ilen_write_upto16 <-
        (trace___m_ilen_write_upto16 ++
        [(Assert,
         (((0 <=
           ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                      param_0 : 8))) /\
          (((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                      param_0 : 8)) <=
          18446744073709551615)) /\
         (((0 <=
           (param_1 +
           ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                      param_0 : 8)))) /\
          ((param_1 +
           ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                      param_0 : 8))) <=
          18446744073709551615)) /\
         ((result_0 =
          (param_1 +
          ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                     param_0 : 8)))) /\
         (result =
         (param_0 -
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8))))))))]);
        trace___m_ilen_write_upto16 <-
        (trace___m_ilen_write_upto16 ++
        [(Assert, ((0 <= result_0) /\ (result_0 <= 18446744073709551615)))]);
        buf <- result_0;
        lEN <- result;
      }
    } else {
      
    }
    return (buf, lEN, trace___m_ilen_write_upto16);
  }
  proc __m_ilen_write_upto32 (buf:int, lEN:int, w:W256.t) : int * int * trace = {
    var t128:W128.t;
    var param:W128.t;
    var param_0:int;
    var param_1:int;
    var result:int;
    var result_0:int;
    var trace___m_ilen_write_upto32:trace;
    trace___m_ilen_write_upto32 <- [];
    trace___m_ilen_write_upto32 <-
    (trace___m_ilen_write_upto32 ++
    [(Assert,
     (((0 <= buf) /\ (buf <= 18446744073709551615)) /\
     (is_valid ptr_modulus Glob.mem_v buf ((lEN < 32) ? lEN : 32))))]);
    trace___m_ilen_write_upto32 <-
    (trace___m_ilen_write_upto32 ++
    [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((32 <= lEN)) {
        trace___m_ilen_write_upto32 <-
        (trace___m_ilen_write_upto32 ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_ilen_write_upto32 <-
        (trace___m_ilen_write_upto32 ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 32))]);
        Glob.mem <- (storeW256 Glob.mem buf w);
        trace___m_ilen_write_upto32 <-
        (trace___m_ilen_write_upto32 ++
        [(Assert,
         ((0 <= (buf + 32)) /\ ((buf + 32) <= 18446744073709551615)))]);
        buf <- (buf + 32);
        lEN <- (lEN - 32);
      } else {
        t128 <- (truncateu128 w);
        if ((16 <= lEN)) {
          trace___m_ilen_write_upto32 <-
          (trace___m_ilen_write_upto32 ++
          [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
          trace___m_ilen_write_upto32 <-
          (trace___m_ilen_write_upto32 ++
          [(Assert, (is_valid ptr_modulus Glob.mem_v buf 16))]);
          Glob.mem <- (storeW128 Glob.mem buf t128);
          trace___m_ilen_write_upto32 <-
          (trace___m_ilen_write_upto32 ++
          [(Assert,
           ((0 <= (buf + 16)) /\ ((buf + 16) <= 18446744073709551615)))]);
          buf <- (buf + 16);
          lEN <- (lEN - 16);
          t128 <- (VEXTRACTI128 w (W8.of_int 1));
        } else {
          
        }
        param_1 <- buf;
        param_0 <- lEN;
        param <- t128;
        (result_0, result, tmp__trace) <@ __m_ilen_write_upto16 (param_1,
        param_0, param);
        trace___m_ilen_write_upto32 <-
        (trace___m_ilen_write_upto32 ++ tmp__trace);
        trace___m_ilen_write_upto32 <-
        (trace___m_ilen_write_upto32 ++
        [(Assert,
         (((0 <=
           ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                        param_0 : 16))) /\
          (((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                        param_0 : 16)) <=
          18446744073709551615)) /\
         (((0 <=
           (param_1 +
           ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                        param_0 : 16)))) /\
          ((param_1 +
           ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                        param_0 : 16))) <=
          18446744073709551615)) /\
         ((result_0 =
          (param_1 +
          ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                       param_0 : 16)))) /\
         (result =
         (param_0 -
         ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                      param_0 : 16))))))))]);
        trace___m_ilen_write_upto32 <-
        (trace___m_ilen_write_upto32 ++
        [(Assert, ((0 <= result_0) /\ (result_0 <= 18446744073709551615)))]);
        buf <- result_0;
        lEN <- result;
      }
    } else {
      
    }
    return (buf, lEN, trace___m_ilen_write_upto32);
  }
  proc __m_rlen_read_upto8 (buf:int, len:int) : int * W64.t * trace = {
    var w:W64.t;
    var zf:bool;
    var sh:W8.t;
    var x:W64.t;
    var  _0:bool;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    var  _6:bool;
    var  _7:bool;
    var  _8:bool;
    var  _9:bool;
    var  _10:bool;
    var  _11:bool;
    var trace___m_rlen_read_upto8:trace;
    trace___m_rlen_read_upto8 <- [];
    trace___m_rlen_read_upto8 <-
    (trace___m_rlen_read_upto8 ++
    [(Assert,
     (((0 <= buf) /\ (buf <= 18446744073709551615)) /\
     (is_valid ptr_modulus Glob.mem_v buf ((len < 8) ? len : 8))))]);
    trace___m_rlen_read_upto8 <-
    (trace___m_rlen_read_upto8 ++
    [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
    trace___m_rlen_read_upto8 <-
    (trace___m_rlen_read_upto8 ++
    [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
    if ((8 <= len)) {
      trace___m_rlen_read_upto8 <-
      (trace___m_rlen_read_upto8 ++
      [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
      trace___m_rlen_read_upto8 <-
      (trace___m_rlen_read_upto8 ++
      [(Assert, (is_valid ptr_modulus Glob.mem_v buf 8))]);
      w <- (loadW64 Glob.mem buf);
      trace___m_rlen_read_upto8 <-
      (trace___m_rlen_read_upto8 ++
      [(Assert, ((0 <= (buf + 8)) /\ ((buf + 8) <= 18446744073709551615)))]);
      buf <- (buf + 8);
    } else {
      trace___m_rlen_read_upto8 <-
      (trace___m_rlen_read_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _0,  _1,  _2,  _3, zf) <- (TEST_64 (W64.of_int len) (W64.of_int 4));
      if ((! zf)) {
        trace___m_rlen_read_upto8 <-
        (trace___m_rlen_read_upto8 ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_rlen_read_upto8 <-
        (trace___m_rlen_read_upto8 ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 4))]);
        w <- (zeroextu64 (loadW32 Glob.mem buf));
        trace___m_rlen_read_upto8 <-
        (trace___m_rlen_read_upto8 ++
        [(Assert, ((0 <= (buf + 4)) /\ ((buf + 4) <= 18446744073709551615)))]);
        buf <- (buf + 4);
        sh <- (W8.of_int 32);
      } else {
        w <- (W64.of_int 0);
        sh <- (W8.of_int 0);
      }
      trace___m_rlen_read_upto8 <-
      (trace___m_rlen_read_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _4,  _5,  _6,  _7, zf) <- (TEST_64 (W64.of_int len) (W64.of_int 2));
      if ((! zf)) {
        trace___m_rlen_read_upto8 <-
        (trace___m_rlen_read_upto8 ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_rlen_read_upto8 <-
        (trace___m_rlen_read_upto8 ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 2))]);
        x <- (zeroextu64 (loadW16 Glob.mem buf));
        x <- (x `<<` (sh `&` (W8.of_int 63)));
        w <- (w + x);
        trace___m_rlen_read_upto8 <-
        (trace___m_rlen_read_upto8 ++
        [(Assert, ((0 <= (buf + 2)) /\ ((buf + 2) <= 18446744073709551615)))]);
        buf <- (buf + 2);
        sh <- (sh + (W8.of_int 16));
      } else {
        
      }
      trace___m_rlen_read_upto8 <-
      (trace___m_rlen_read_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _8,  _9,  _10,  _11, zf) <-
      (TEST_64 (W64.of_int len) (W64.of_int 1));
      if ((! zf)) {
        trace___m_rlen_read_upto8 <-
        (trace___m_rlen_read_upto8 ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_rlen_read_upto8 <-
        (trace___m_rlen_read_upto8 ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 1))]);
        x <- (zeroextu64 (loadW8 Glob.mem buf));
        x <- (x `<<` (sh `&` (W8.of_int 63)));
        w <- (w + x);
        trace___m_rlen_read_upto8 <-
        (trace___m_rlen_read_upto8 ++
        [(Assert, ((0 <= (buf + 1)) /\ ((buf + 1) <= 18446744073709551615)))]);
        buf <- (buf + 1);
      } else {
        
      }
    }
    return (buf, w, trace___m_rlen_read_upto8);
  }
  proc __m_rlen_write_upto8 (buf:int, data:W64.t, len:int) : int * trace = {
    var zf:bool;
    var  _0:bool;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    var  _6:bool;
    var  _7:bool;
    var  _8:bool;
    var  _9:bool;
    var  _10:bool;
    var  _11:bool;
    var trace___m_rlen_write_upto8:trace;
    trace___m_rlen_write_upto8 <- [];
    trace___m_rlen_write_upto8 <-
    (trace___m_rlen_write_upto8 ++
    [(Assert,
     (((0 <= buf) /\ (buf <= 18446744073709551615)) /\
     (is_valid ptr_modulus Glob.mem_v buf ((len < 8) ? len : 8))))]);
    trace___m_rlen_write_upto8 <-
    (trace___m_rlen_write_upto8 ++
    [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
    trace___m_rlen_write_upto8 <-
    (trace___m_rlen_write_upto8 ++
    [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
    if ((8 <= len)) {
      trace___m_rlen_write_upto8 <-
      (trace___m_rlen_write_upto8 ++
      [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
      trace___m_rlen_write_upto8 <-
      (trace___m_rlen_write_upto8 ++
      [(Assert, (is_valid ptr_modulus Glob.mem_v buf 8))]);
      Glob.mem <- (storeW64 Glob.mem buf data);
      trace___m_rlen_write_upto8 <-
      (trace___m_rlen_write_upto8 ++
      [(Assert, ((0 <= (buf + 8)) /\ ((buf + 8) <= 18446744073709551615)))]);
      buf <- (buf + 8);
    } else {
      trace___m_rlen_write_upto8 <-
      (trace___m_rlen_write_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _0,  _1,  _2,  _3, zf) <- (TEST_64 (W64.of_int len) (W64.of_int 4));
      if ((! zf)) {
        trace___m_rlen_write_upto8 <-
        (trace___m_rlen_write_upto8 ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_rlen_write_upto8 <-
        (trace___m_rlen_write_upto8 ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 4))]);
        Glob.mem <- (storeW32 Glob.mem buf (truncateu32 data));
        trace___m_rlen_write_upto8 <-
        (trace___m_rlen_write_upto8 ++
        [(Assert, ((0 <= (buf + 4)) /\ ((buf + 4) <= 18446744073709551615)))]);
        buf <- (buf + 4);
        data <- (data `>>` (W8.of_int 32));
      } else {
        
      }
      trace___m_rlen_write_upto8 <-
      (trace___m_rlen_write_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _4,  _5,  _6,  _7, zf) <- (TEST_64 (W64.of_int len) (W64.of_int 2));
      if ((! zf)) {
        trace___m_rlen_write_upto8 <-
        (trace___m_rlen_write_upto8 ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_rlen_write_upto8 <-
        (trace___m_rlen_write_upto8 ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 2))]);
        Glob.mem <- (storeW16 Glob.mem buf (truncateu16 data));
        trace___m_rlen_write_upto8 <-
        (trace___m_rlen_write_upto8 ++
        [(Assert, ((0 <= (buf + 2)) /\ ((buf + 2) <= 18446744073709551615)))]);
        buf <- (buf + 2);
        data <- (data `>>` (W8.of_int 16));
      } else {
        
      }
      trace___m_rlen_write_upto8 <-
      (trace___m_rlen_write_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _8,  _9,  _10,  _11, zf) <-
      (TEST_64 (W64.of_int len) (W64.of_int 1));
      if ((! zf)) {
        trace___m_rlen_write_upto8 <-
        (trace___m_rlen_write_upto8 ++
        [(Assert, ((0 <= buf) /\ (buf <= 18446744073709551615)))]);
        trace___m_rlen_write_upto8 <-
        (trace___m_rlen_write_upto8 ++
        [(Assert, (is_valid ptr_modulus Glob.mem_v buf 1))]);
        Glob.mem <- (storeW8 Glob.mem buf (truncateu8 data));
        trace___m_rlen_write_upto8 <-
        (trace___m_rlen_write_upto8 ++
        [(Assert, ((0 <= (buf + 1)) /\ ((buf + 1) <= 18446744073709551615)))]);
        buf <- (buf + 1);
      } else {
        
      }
    }
    return (buf, trace___m_rlen_write_upto8);
  }
  proc __ANDN_64 (a:W64.t, b:W64.t) : W64.t * trace = {
    var t:W64.t;
    var trace___ANDN_64:trace;
    trace___ANDN_64 <- [];
    t <- ((invw a) `&` b);
    return (t, trace___ANDN_64);
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
    (trace___set_row_ref ++ [(Assert, (BArray200.is_init b_e 0 200))]);
    trace___set_row_ref <-
    (trace___set_row_ref ++ [(Assert, (BArray40.is_init b_b 0 40))]);
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
      e <- (BArray200.set64 e (x + (y * 5)) t);
      x <- (x + 1);
    }
    b_e <- (BArray200.init_arr (W8.of_int 255));
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
    var b_result_0:BArray40.t;
    var b_result_1:BArray40.t;
    var b_result_2:BArray40.t;
    var trace__pround_ref:trace;
    b <- witness;
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
    (trace__pround_ref ++ [(Assert, (BArray200.is_init b_e 0 200))]);
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
      param_6 <- e;
      param_5 <- b;
      param_4 <- y;
      (aux_1, aux_2, tmp__trace) <@ __set_row_ref (param_6,
      (BArray200.init_arr (W8.of_int 255)), param_5,
      (BArray40.init_arr (W8.of_int 255)), param_4);
      result_2 <- aux_1;
      b_result <- aux_2;
      trace__pround_ref <- (trace__pround_ref ++ tmp__trace);
      trace__pround_ref <-
      (trace__pround_ref ++ [(Assert, (BArray200.is_init b_result 0 200))]);
      e <- result_2;
      y <- (y + 1);
    }
    b_e <- (BArray200.init_arr (W8.of_int 255));
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
  proc _keccakf1600_ref_ (a:BArray200.t, b_a:BArray200.t) : BArray200.t *
                                                            BArray200.t *
                                                            trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var param:BArray200.t;
    var result:BArray200.t;
    var b_result:BArray200.t;
    var trace__keccakf1600_ref_:trace;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace__keccakf1600_ref_ <- [];
    trace__keccakf1600_ref_ <-
    (trace__keccakf1600_ref_ ++ [(Assert, (BArray200.is_init b_a 0 200))]);
    a <- a;
    param <- a;
    (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param,
    (BArray200.init_arr (W8.of_int 255)));
    result <- aux;
    b_result <- aux_0;
    trace__keccakf1600_ref_ <- (trace__keccakf1600_ref_ ++ tmp__trace);
    trace__keccakf1600_ref_ <-
    (trace__keccakf1600_ref_ ++
    [(Assert, (BArray200.is_init b_result 0 200))]);
    a <- result;
    a <- a;
    b_a <- (BArray200.init_arr (W8.of_int 255));
    return (a, b_a, trace__keccakf1600_ref_);
  }
  proc __state_init_ref (st:BArray200.t, b_st:BArray200.t) : BArray200.t *
                                                             BArray200.t *
                                                             trace = {
    var z64:W64.t;
    var i:int;
    var trace___state_init_ref:trace;
    trace___state_init_ref <- [];
    trace___state_init_ref <-
    (trace___state_init_ref ++ [(Assert, (BArray200.is_init b_st 0 200))]);
    z64 <- (W64.of_int 0);
    i <- 0;
    while ((i < 25)) {
      trace___state_init_ref <-
      (trace___state_init_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st i z64);
      trace___state_init_ref <-
      (trace___state_init_ref ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, trace___state_init_ref);
  }
  proc __addratebit_ref (st:BArray200.t, b_st:BArray200.t, _RATE8:int) : 
  BArray200.t * BArray200.t * trace = {
    var t64:W64.t;
    var trace___addratebit_ref:trace;
    trace___addratebit_ref <- [];
    trace___addratebit_ref <-
    (trace___addratebit_ref ++ [(Assert, (BArray200.is_init b_st 0 200))]);
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
  proc __keccakf1600_pround_avx2 (state:BArray224.t, b_state:BArray224.t) : 
  BArray224.t * BArray224.t * trace = {
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
    [(Assert, (BArray224.is_init b_state 0 224))]);
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
    (BArray192.get256 kECCAK_RHOTATES_LEFT 0));
    state <-
    (BArray224.set256 state 2
    (VPSRLV_4u64 (BArray224.get256 state 2)
    (BArray192.get256 kECCAK_RHOTATES_RIGHT 0)));
    state <- (BArray224.set256 state 2 ((BArray224.get256 state 2) `|` t3));
    state <- (BArray224.set256 state 3 ((BArray224.get256 state 3) `^` d14));
    t4 <-
    (VPSLLV_4u64 (BArray224.get256 state 3)
    (BArray192.get256 kECCAK_RHOTATES_LEFT 2));
    state <-
    (BArray224.set256 state 3
    (VPSRLV_4u64 (BArray224.get256 state 3)
    (BArray192.get256 kECCAK_RHOTATES_RIGHT 2)));
    state <- (BArray224.set256 state 3 ((BArray224.get256 state 3) `|` t4));
    state <- (BArray224.set256 state 4 ((BArray224.get256 state 4) `^` d14));
    t5 <-
    (VPSLLV_4u64 (BArray224.get256 state 4)
    (BArray192.get256 kECCAK_RHOTATES_LEFT 3));
    state <-
    (BArray224.set256 state 4
    (VPSRLV_4u64 (BArray224.get256 state 4)
    (BArray192.get256 kECCAK_RHOTATES_RIGHT 3)));
    state <- (BArray224.set256 state 4 ((BArray224.get256 state 4) `|` t5));
    state <- (BArray224.set256 state 5 ((BArray224.get256 state 5) `^` d14));
    t6 <-
    (VPSLLV_4u64 (BArray224.get256 state 5)
    (BArray192.get256 kECCAK_RHOTATES_LEFT 4));
    state <-
    (BArray224.set256 state 5
    (VPSRLV_4u64 (BArray224.get256 state 5)
    (BArray192.get256 kECCAK_RHOTATES_RIGHT 4)));
    state <- (BArray224.set256 state 5 ((BArray224.get256 state 5) `|` t6));
    state <- (BArray224.set256 state 6 ((BArray224.get256 state 6) `^` d14));
    t3 <- (VPERMQ (BArray224.get256 state 2) (W8.of_int 141));
    t4 <- (VPERMQ (BArray224.get256 state 3) (W8.of_int 141));
    t7 <-
    (VPSLLV_4u64 (BArray224.get256 state 6)
    (BArray192.get256 kECCAK_RHOTATES_LEFT 5));
    t1 <-
    (VPSRLV_4u64 (BArray224.get256 state 6)
    (BArray192.get256 kECCAK_RHOTATES_RIGHT 5));
    t1 <- (t1 `|` t7);
    state <- (BArray224.set256 state 1 ((BArray224.get256 state 1) `^` d14));
    t5 <- (VPERMQ (BArray224.get256 state 4) (W8.of_int 27));
    t6 <- (VPERMQ (BArray224.get256 state 5) (W8.of_int 114));
    t8 <-
    (VPSLLV_4u64 (BArray224.get256 state 1)
    (BArray192.get256 kECCAK_RHOTATES_LEFT 1));
    t2 <-
    (VPSRLV_4u64 (BArray224.get256 state 1)
    (BArray192.get256 kECCAK_RHOTATES_RIGHT 1));
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
    b_state <- (BArray224.init_arr (W8.of_int 255));
    return (state, b_state, trace___keccakf1600_pround_avx2);
  }
  proc __keccakf1600_avx2 (state:BArray224.t, b_state:BArray224.t) : 
  BArray224.t * BArray224.t * trace = {
    var aux:BArray224.t;
    var aux_0:BArray224.t;
    var round_constants:BArray192.t;
    var rc:W256.t;
    var r:int;
    var param:BArray224.t;
    var result:BArray224.t;
    var b_result:BArray224.t;
    var trace___keccakf1600_avx2:trace;
    b_result <- witness;
    param <- witness;
    result <- witness;
    round_constants <- witness;
    trace___keccakf1600_avx2 <- [];
    trace___keccakf1600_avx2 <-
    (trace___keccakf1600_avx2 ++
    [(Assert, (BArray224.is_init b_state 0 224))]);
    round_constants <- kECCAK1600_RC;
    r <- 0;
    param <- state;
    (aux, aux_0, tmp__trace) <@ __keccakf1600_pround_avx2 (param,
    (BArray224.init_arr (W8.of_int 255)));
    result <- aux;
    b_result <- aux_0;
    trace___keccakf1600_avx2 <- (trace___keccakf1600_avx2 ++ tmp__trace);
    trace___keccakf1600_avx2 <-
    (trace___keccakf1600_avx2 ++
    [(Assert, (BArray224.is_init b_result 0 224))]);
    state <- result;
    trace___keccakf1600_avx2 <-
    (trace___keccakf1600_avx2 ++
    [(Assert, ((0 <= (r * 8)) /\ (((r * 8) + 8) <= 192)))]);
    rc <- (VPBROADCAST_4u64 (BArray192.get64 round_constants r));
    state <- (BArray224.set256 state 0 ((BArray224.get256 state 0) `^` rc));
    trace___keccakf1600_avx2 <-
    (trace___keccakf1600_avx2 ++
    [(Assert, ((0 <= (r + 1)) /\ ((r + 1) <= 18446744073709551615)))]);
    r <- (r + 1);
    while ((r < 24)) {
      param <- state;
      (aux, aux_0, tmp__trace) <@ __keccakf1600_pround_avx2 (param,
      (BArray224.init_arr (W8.of_int 255)));
      result <- aux;
      b_result <- aux_0;
      trace___keccakf1600_avx2 <- (trace___keccakf1600_avx2 ++ tmp__trace);
      trace___keccakf1600_avx2 <-
      (trace___keccakf1600_avx2 ++
      [(Assert, (BArray224.is_init b_result 0 224))]);
      state <- result;
      trace___keccakf1600_avx2 <-
      (trace___keccakf1600_avx2 ++
      [(Assert, ((0 <= (r * 8)) /\ (((r * 8) + 8) <= 192)))]);
      rc <- (VPBROADCAST_4u64 (BArray192.get64 round_constants r));
      state <-
      (BArray224.set256 state 0 ((BArray224.get256 state 0) `^` rc));
      trace___keccakf1600_avx2 <-
      (trace___keccakf1600_avx2 ++
      [(Assert, ((0 <= (r + 1)) /\ ((r + 1) <= 18446744073709551615)))]);
      r <- (r + 1);
    }
    b_state <- (BArray224.init_arr (W8.of_int 255));
    return (state, b_state, trace___keccakf1600_avx2);
  }
  proc _keccakf1600_avx2 (state:BArray224.t, b_state:BArray224.t) : BArray224.t *
                                                                    BArray224.t *
                                                                    trace = {
    var aux:BArray224.t;
    var aux_0:BArray224.t;
    var param:BArray224.t;
    var result:BArray224.t;
    var b_result:BArray224.t;
    var trace__keccakf1600_avx2:trace;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace__keccakf1600_avx2 <- [];
    trace__keccakf1600_avx2 <-
    (trace__keccakf1600_avx2 ++
    [(Assert, (BArray224.is_init b_state 0 224))]);
    param <- state;
    (aux, aux_0, tmp__trace) <@ __keccakf1600_avx2 (param,
    (BArray224.init_arr (W8.of_int 255)));
    result <- aux;
    b_result <- aux_0;
    trace__keccakf1600_avx2 <- (trace__keccakf1600_avx2 ++ tmp__trace);
    trace__keccakf1600_avx2 <-
    (trace__keccakf1600_avx2 ++
    [(Assert, (BArray224.is_init b_result 0 224))]);
    state <- result;
    b_state <- (BArray224.init_arr (W8.of_int 255));
    return (state, b_state, trace__keccakf1600_avx2);
  }
  proc __stavx2_pack (st:BArray200.t, b_st:BArray200.t) : BArray224.t *
                                                          BArray224.t * trace = {
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
    (trace___stavx2_pack ++ [(Assert, (BArray200.is_init b_st 0 200))]);
    b_state <- (BArray224.init_arr (W8.of_int 0));
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
    (trace___stavx2_pack ++ [(Assert, (BArray224.is_init b_state 96 32))]);
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (BArray224.is_init b_state 160 32))]);
    t256_0 <-
    (VPBLEND_8u32 (BArray224.get256 state 3) (BArray224.get256 state 5)
    (W8.of_int 195));
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (BArray224.is_init b_state 192 32))]);
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (BArray224.is_init b_state 128 32))]);
    t256_1 <-
    (VPBLEND_8u32 (BArray224.get256 state 6) (BArray224.get256 state 4)
    (W8.of_int 195));
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (BArray224.is_init b_state 128 32))]);
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (BArray224.is_init b_state 96 32))]);
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
    (trace___stavx2_pack ++ [(Assert, (BArray224.is_init b_state 160 32))]);
    trace___stavx2_pack <-
    (trace___stavx2_pack ++ [(Assert, (BArray224.is_init b_state 192 32))]);
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
  proc __stavx2_unpack (st:BArray200.t, b_st:BArray200.t, state:BArray224.t,
                        b_state:BArray224.t) : BArray200.t * BArray200.t *
                                               trace = {
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
    (trace___stavx2_unpack ++ [(Assert, (BArray224.is_init b_state 0 224))]);
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
  proc _keccakf1600_st25_avx2 (st25:BArray200.t, b_st25:BArray200.t) : 
  BArray200.t * BArray200.t * trace = {
    var aux_1:BArray200.t;
    var aux_2:BArray200.t;
    var aux:BArray224.t;
    var aux_0:BArray224.t;
    var state:BArray224.t;
    var param:BArray200.t;
    var result:BArray224.t;
    var param_0:BArray224.t;
    var result_0:BArray224.t;
    var param_1:BArray224.t;
    var param_2:BArray200.t;
    var result_1:BArray200.t;
    var b_result:BArray200.t;
    var b_result_0:BArray224.t;
    var b_result_1:BArray224.t;
    var trace__keccakf1600_st25_avx2:trace;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    state <- witness;
    trace__keccakf1600_st25_avx2 <- [];
    trace__keccakf1600_st25_avx2 <-
    (trace__keccakf1600_st25_avx2 ++
    [(Assert, (BArray200.is_init b_st25 0 200))]);
    param <- st25;
    (aux, aux_0, tmp__trace) <@ __stavx2_pack (param,
    (BArray200.init_arr (W8.of_int 255)));
    result <- aux;
    b_result_1 <- aux_0;
    trace__keccakf1600_st25_avx2 <-
    (trace__keccakf1600_st25_avx2 ++ tmp__trace);
    trace__keccakf1600_st25_avx2 <-
    (trace__keccakf1600_st25_avx2 ++
    [(Assert, (BArray224.is_init b_result_1 0 224))]);
    state <- result;
    param_0 <- state;
    (aux, aux_0, tmp__trace) <@ __keccakf1600_avx2 (param_0,
    (BArray224.init_arr (W8.of_int 255)));
    result_0 <- aux;
    b_result_0 <- aux_0;
    trace__keccakf1600_st25_avx2 <-
    (trace__keccakf1600_st25_avx2 ++ tmp__trace);
    trace__keccakf1600_st25_avx2 <-
    (trace__keccakf1600_st25_avx2 ++
    [(Assert, (BArray224.is_init b_result_0 0 224))]);
    state <- result_0;
    param_2 <- st25;
    param_1 <- state;
    (aux_1, aux_2, tmp__trace) <@ __stavx2_unpack (param_2,
    (BArray200.init_arr (W8.of_int 255)), param_1,
    (BArray224.init_arr (W8.of_int 255)));
    result_1 <- aux_1;
    b_result <- aux_2;
    trace__keccakf1600_st25_avx2 <-
    (trace__keccakf1600_st25_avx2 ++ tmp__trace);
    trace__keccakf1600_st25_avx2 <-
    (trace__keccakf1600_st25_avx2 ++
    [(Assert, (BArray200.is_init b_result 0 200))]);
    st25 <- result_1;
    b_st25 <- (BArray200.init_arr (W8.of_int 255));
    return (st25, b_st25, trace__keccakf1600_st25_avx2);
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
    b_st <- (BArray224.init_arr (W8.of_int 0));
    i <- 0;
    while ((i < 7)) {
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
  proc __perm_reg3456_avx2 (r3:W256.t, r4:W256.t, r5:W256.t, r6:W256.t) : 
  W256.t * W256.t * W256.t * W256.t * trace = {
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
  proc __unperm_reg3456_avx2 (st3:W256.t, st4:W256.t, st5:W256.t, st6:W256.t) : 
  W256.t * W256.t * W256.t * W256.t * trace = {
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
  proc __addstate_r3456_avx2 (st:BArray224.t, b_st:BArray224.t, r3:W256.t,
                              r4:W256.t, r5:W256.t, r6:W256.t) : BArray224.t *
                                                                 BArray224.t *
                                                                 trace = {
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
    [(Assert, (BArray224.is_init b_st 0 224))]);
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
    b_st <- (BArray224.init_arr (W8.of_int 255));
    return (st, b_st, trace___addstate_r3456_avx2);
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
  proc __addratebit_avx2 (st:BArray224.t, b_st:BArray224.t, rATE_8:int) : 
  BArray224.t * BArray224.t * trace = {
    var t64:W64.t;
    var r:int;
    var l:int;
    var t256:W256.t;
    var param:int;
    var result:int;
    var result_0:int;
    var param_0:int;
    var param_1:W64.t;
    var result_1:W256.t;
    var trace___addratebit_avx2:trace;
    trace___addratebit_avx2 <- [];
    trace___addratebit_avx2 <-
    (trace___addratebit_avx2 ++ [(Assert, (BArray224.is_init b_st 0 224))]);
    t64 <- (W64.of_int 1);
    t64 <- (t64 `<<` (W8.of_int (((8 * rATE_8) - 1) %% 64)));
    param <- ((rATE_8 - 1) %/ 8);
    (result_0, result, tmp__trace) <@ __stavx2_pos_avx2 (param);
    trace___addratebit_avx2 <- (trace___addratebit_avx2 ++ tmp__trace);
    trace___addratebit_avx2 <-
    (trace___addratebit_avx2 ++
    [(Assert, ((0 <= result_0) /\ (result_0 < 7)))]);
    r <- result_0;
    l <- result;
    if ((r = 0)) {
      t256 <- (VPBROADCAST_4u64 t64);
    } else {
      param_1 <- t64;
      param_0 <- l;
      (result_1, tmp__trace) <@ __u64_to_u256 (param_1, param_0);
      trace___addratebit_avx2 <- (trace___addratebit_avx2 ++ tmp__trace);
      t256 <- result_1;
    }
    trace___addratebit_avx2 <-
    (trace___addratebit_avx2 ++
    [(Assert, ((0 <= (r * 32)) /\ (((r * 32) + 32) <= 224)))]);
    trace___addratebit_avx2 <-
    (trace___addratebit_avx2 ++
    [(Assert, ((0 <= (r * 32)) /\ (((r * 32) + 32) <= 224)))]);
    st <- (BArray224.set256 st r ((BArray224.get256 st r) `^` t256));
    b_st <- (BArray224.init_arr (W8.of_int 255));
    return (st, b_st, trace___addratebit_avx2);
  }
  proc _keccakf1600_4x_pround (e:BArray800.t, b_e:BArray800.t, a:BArray800.t,
                               b_a:BArray800.t, r8:W256.t, r56:W256.t) : 
  BArray800.t * BArray800.t * trace = {
    var c_571:BArray160.t;
    var d_619:BArray160.t;
    var t_574:W256.t;
    var t_577:W256.t;
    var t_580:W256.t;
    var t_583:W256.t;
    var t_586:W256.t;
    var b_606:BArray160.t;
    var t_593:W256.t;
    var t_596:W256.t;
    var t_599:W256.t;
    var t_602:W256.t;
    var t_607:W256.t;
    var t_608:W256.t;
    var t_609:W256.t;
    var t_610:W256.t;
    var t_611:W256.t;
    var t_612:W256.t;
    var t_613:W256.t;
    var t_614:W256.t;
    var t_615:W256.t;
    var t_616:W256.t;
    var b_638:BArray160.t;
    var t_622:W256.t;
    var t_625:W256.t;
    var t_628:W256.t;
    var t_631:W256.t;
    var t_634:W256.t;
    var t_639:W256.t;
    var t_640:W256.t;
    var t_641:W256.t;
    var t_642:W256.t;
    var t_643:W256.t;
    var t_644:W256.t;
    var t_645:W256.t;
    var t_646:W256.t;
    var t_647:W256.t;
    var t_648:W256.t;
    var b_671:BArray160.t;
    var t_655:W256.t;
    var t_658:W256.t;
    var t_661:W256.t;
    var t_667:W256.t;
    var t_672:W256.t;
    var t_673:W256.t;
    var t_674:W256.t;
    var t_675:W256.t;
    var t_676:W256.t;
    var t_677:W256.t;
    var t_678:W256.t;
    var t_679:W256.t;
    var t_680:W256.t;
    var t_681:W256.t;
    var b_704:BArray160.t;
    var t_688:W256.t;
    var t_691:W256.t;
    var t_694:W256.t;
    var t_697:W256.t;
    var t_705:W256.t;
    var t_706:W256.t;
    var t_707:W256.t;
    var t_708:W256.t;
    var t_709:W256.t;
    var t_710:W256.t;
    var t_711:W256.t;
    var t_712:W256.t;
    var t_713:W256.t;
    var t_714:W256.t;
    var b_736:BArray160.t;
    var t_720:W256.t;
    var t_723:W256.t;
    var t_726:W256.t;
    var t_729:W256.t;
    var t_732:W256.t;
    var t_737:W256.t;
    var t_738:W256.t;
    var t_739:W256.t;
    var t_740:W256.t;
    var t_741:W256.t;
    var t_742:W256.t;
    var t_743:W256.t;
    var t_744:W256.t;
    var t_745:W256.t;
    var t_746:W256.t;
    var b_b_736:BArray160.t;
    var b_d_619:BArray160.t;
    var b_b_704:BArray160.t;
    var b_b_671:BArray160.t;
    var b_b_638:BArray160.t;
    var b_b_606:BArray160.t;
    var b_c_571:BArray160.t;
    var trace__keccakf1600_4x_pround:trace;
    b_606 <- witness;
    b_638 <- witness;
    b_671 <- witness;
    b_704 <- witness;
    b_736 <- witness;
    b_b_606 <- witness;
    b_b_638 <- witness;
    b_b_671 <- witness;
    b_b_704 <- witness;
    b_b_736 <- witness;
    b_c_571 <- witness;
    b_d_619 <- witness;
    c_571 <- witness;
    d_619 <- witness;
    trace__keccakf1600_4x_pround <- [];
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray800.is_init b_a 0 800))]);
    b_c_571 <- (BArray160.init_arr (W8.of_int 0));
    b_d_619 <- (BArray160.init_arr (W8.of_int 0));
    b_b_606 <- (BArray160.init_arr (W8.of_int 0));
    b_b_638 <- (BArray160.init_arr (W8.of_int 0));
    b_b_671 <- (BArray160.init_arr (W8.of_int 0));
    b_b_704 <- (BArray160.init_arr (W8.of_int 0));
    b_b_736 <- (BArray160.init_arr (W8.of_int 0));
    b_c_571 <-
    (BArray160.set256d b_c_571 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <- (BArray160.set256 c_571 0 (BArray800.get256 a 0));
    b_c_571 <-
    (BArray160.set256d b_c_571 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <- (BArray160.set256 c_571 1 (BArray800.get256 a 1));
    b_c_571 <-
    (BArray160.set256d b_c_571 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <- (BArray160.set256 c_571 2 (BArray800.get256 a 2));
    b_c_571 <-
    (BArray160.set256d b_c_571 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <- (BArray160.set256 c_571 3 (BArray800.get256 a 3));
    b_c_571 <-
    (BArray160.set256d b_c_571 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <- (BArray160.set256 c_571 4 (BArray800.get256 a 4));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 0 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 0
    ((BArray160.get256 c_571 0) `^` (BArray800.get256 a 5)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 32 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 1
    ((BArray160.get256 c_571 1) `^` (BArray800.get256 a 6)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 64 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 2
    ((BArray160.get256 c_571 2) `^` (BArray800.get256 a 7)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 96 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 3
    ((BArray160.get256 c_571 3) `^` (BArray800.get256 a 8)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 128 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 4
    ((BArray160.get256 c_571 4) `^` (BArray800.get256 a 9)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 0 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 0
    ((BArray160.get256 c_571 0) `^` (BArray800.get256 a 10)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 32 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 1
    ((BArray160.get256 c_571 1) `^` (BArray800.get256 a 11)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 64 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 2
    ((BArray160.get256 c_571 2) `^` (BArray800.get256 a 12)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 96 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 3
    ((BArray160.get256 c_571 3) `^` (BArray800.get256 a 13)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 128 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 4
    ((BArray160.get256 c_571 4) `^` (BArray800.get256 a 14)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 0 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 0
    ((BArray160.get256 c_571 0) `^` (BArray800.get256 a 15)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 32 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 1
    ((BArray160.get256 c_571 1) `^` (BArray800.get256 a 16)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 64 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 2
    ((BArray160.get256 c_571 2) `^` (BArray800.get256 a 17)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 96 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 3
    ((BArray160.get256 c_571 3) `^` (BArray800.get256 a 18)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 128 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 4
    ((BArray160.get256 c_571 4) `^` (BArray800.get256 a 19)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 0 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 0
    ((BArray160.get256 c_571 0) `^` (BArray800.get256 a 20)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 32 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 1
    ((BArray160.get256 c_571 1) `^` (BArray800.get256 a 21)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 64 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 2
    ((BArray160.get256 c_571 2) `^` (BArray800.get256 a 22)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 96 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 3
    ((BArray160.get256 c_571 3) `^` (BArray800.get256 a 23)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 128 32))]);
    b_c_571 <-
    (BArray160.set256d b_c_571 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    c_571 <-
    (BArray160.set256 c_571 4
    ((BArray160.get256 c_571 4) `^` (BArray800.get256 a 24)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 32 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <- (BArray160.set256 d_619 0 (BArray160.get256 c_571 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 0 32))]);
    t_574 <- (VPSLL_4u64 (BArray160.get256 d_619 0) (W128.of_int 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 0 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 0
    (VPSRL_4u64 (BArray160.get256 d_619 0) (W128.of_int 63)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 0 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 0 ((BArray160.get256 d_619 0) `|` t_574));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 0 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 128 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 0
    ((BArray160.get256 d_619 0) `^` (BArray160.get256 c_571 4)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 64 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <- (BArray160.set256 d_619 1 (BArray160.get256 c_571 2));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 32 32))]);
    t_577 <- (VPSLL_4u64 (BArray160.get256 d_619 1) (W128.of_int 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 32 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 1
    (VPSRL_4u64 (BArray160.get256 d_619 1) (W128.of_int 63)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 32 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 1 ((BArray160.get256 d_619 1) `|` t_577));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 32 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 0 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 1
    ((BArray160.get256 d_619 1) `^` (BArray160.get256 c_571 0)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 96 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <- (BArray160.set256 d_619 2 (BArray160.get256 c_571 3));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 64 32))]);
    t_580 <- (VPSLL_4u64 (BArray160.get256 d_619 2) (W128.of_int 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 64 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 2
    (VPSRL_4u64 (BArray160.get256 d_619 2) (W128.of_int 63)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 64 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 2 ((BArray160.get256 d_619 2) `|` t_580));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 64 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 32 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 2
    ((BArray160.get256 d_619 2) `^` (BArray160.get256 c_571 1)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 128 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <- (BArray160.set256 d_619 3 (BArray160.get256 c_571 4));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 96 32))]);
    t_583 <- (VPSLL_4u64 (BArray160.get256 d_619 3) (W128.of_int 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 96 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 3
    (VPSRL_4u64 (BArray160.get256 d_619 3) (W128.of_int 63)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 96 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 3 ((BArray160.get256 d_619 3) `|` t_583));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 96 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 64 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 3
    ((BArray160.get256 d_619 3) `^` (BArray160.get256 c_571 2)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 0 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <- (BArray160.set256 d_619 4 (BArray160.get256 c_571 0));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 128 32))]);
    t_586 <- (VPSLL_4u64 (BArray160.get256 d_619 4) (W128.of_int 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 128 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 4
    (VPSRL_4u64 (BArray160.get256 d_619 4) (W128.of_int 63)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 128 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 4 ((BArray160.get256 d_619 4) `|` t_586));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 128 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_c_571 96 32))]);
    b_d_619 <-
    (BArray160.set256d b_d_619 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    d_619 <-
    (BArray160.set256 d_619 4
    ((BArray160.get256 d_619 4) `^` (BArray160.get256 c_571 3)));
    b_b_606 <-
    (BArray160.set256d b_b_606 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <- (BArray160.set256 b_606 0 (BArray800.get256 a 0));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 0 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 0 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 0
    ((BArray160.get256 b_606 0) `^` (BArray160.get256 d_619 0)));
    b_b_606 <-
    (BArray160.set256d b_b_606 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <- (BArray160.set256 b_606 1 (BArray800.get256 a 6));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 32 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 32 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 1
    ((BArray160.get256 b_606 1) `^` (BArray160.get256 d_619 1)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 32 32))]);
    t_593 <- (VPSLL_4u64 (BArray160.get256 b_606 1) (W128.of_int 44));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 32 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 1
    (VPSRL_4u64 (BArray160.get256 b_606 1) (W128.of_int 20)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 32 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 1 ((BArray160.get256 b_606 1) `|` t_593));
    b_b_606 <-
    (BArray160.set256d b_b_606 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <- (BArray160.set256 b_606 2 (BArray800.get256 a 12));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 64 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 64 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 2
    ((BArray160.get256 b_606 2) `^` (BArray160.get256 d_619 2)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 64 32))]);
    t_596 <- (VPSLL_4u64 (BArray160.get256 b_606 2) (W128.of_int 43));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 64 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 2
    (VPSRL_4u64 (BArray160.get256 b_606 2) (W128.of_int 21)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 64 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 2 ((BArray160.get256 b_606 2) `|` t_596));
    b_b_606 <-
    (BArray160.set256d b_b_606 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <- (BArray160.set256 b_606 3 (BArray800.get256 a 18));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 96 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 96 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 3
    ((BArray160.get256 b_606 3) `^` (BArray160.get256 d_619 3)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 96 32))]);
    t_599 <- (VPSLL_4u64 (BArray160.get256 b_606 3) (W128.of_int 21));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 96 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 3
    (VPSRL_4u64 (BArray160.get256 b_606 3) (W128.of_int 43)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 96 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 3 ((BArray160.get256 b_606 3) `|` t_599));
    b_b_606 <-
    (BArray160.set256d b_b_606 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <- (BArray160.set256 b_606 4 (BArray800.get256 a 24));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 128 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 128 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 4
    ((BArray160.get256 b_606 4) `^` (BArray160.get256 d_619 4)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 128 32))]);
    t_602 <- (VPSLL_4u64 (BArray160.get256 b_606 4) (W128.of_int 14));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 128 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 4
    (VPSRL_4u64 (BArray160.get256 b_606 4) (W128.of_int 50)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 128 32))]);
    b_b_606 <-
    (BArray160.set256d b_b_606 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_606 <-
    (BArray160.set256 b_606 4 ((BArray160.get256 b_606 4) `|` t_602));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 32 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 64 32))]);
    t_607 <-
    (VPANDN_256 (BArray160.get256 b_606 1) (BArray160.get256 b_606 2));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 0 32))]);
    t_608 <- (t_607 `^` (BArray160.get256 b_606 0));
    b_e <-
    (BArray800.set256d b_e 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 0 t_608);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 64 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 96 32))]);
    t_609 <-
    (VPANDN_256 (BArray160.get256 b_606 2) (BArray160.get256 b_606 3));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 32 32))]);
    t_610 <- (t_609 `^` (BArray160.get256 b_606 1));
    b_e <-
    (BArray800.set256d b_e 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 1 t_610);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 96 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 128 32))]);
    t_611 <-
    (VPANDN_256 (BArray160.get256 b_606 3) (BArray160.get256 b_606 4));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 64 32))]);
    t_612 <- (t_611 `^` (BArray160.get256 b_606 2));
    b_e <-
    (BArray800.set256d b_e 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 2 t_612);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 128 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 0 32))]);
    t_613 <-
    (VPANDN_256 (BArray160.get256 b_606 4) (BArray160.get256 b_606 0));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 96 32))]);
    t_614 <- (t_613 `^` (BArray160.get256 b_606 3));
    b_e <-
    (BArray800.set256d b_e 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 3 t_614);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 0 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 32 32))]);
    t_615 <-
    (VPANDN_256 (BArray160.get256 b_606 0) (BArray160.get256 b_606 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_606 128 32))]);
    t_616 <- (t_615 `^` (BArray160.get256 b_606 4));
    b_e <-
    (BArray800.set256d b_e 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 4 t_616);
    b_b_638 <-
    (BArray160.set256d b_b_638 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <- (BArray160.set256 b_638 0 (BArray800.get256 a 3));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 0 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 96 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 0
    ((BArray160.get256 b_638 0) `^` (BArray160.get256 d_619 3)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 0 32))]);
    t_622 <- (VPSLL_4u64 (BArray160.get256 b_638 0) (W128.of_int 28));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 0 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 0
    (VPSRL_4u64 (BArray160.get256 b_638 0) (W128.of_int 36)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 0 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 0 ((BArray160.get256 b_638 0) `|` t_622));
    b_b_638 <-
    (BArray160.set256d b_b_638 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <- (BArray160.set256 b_638 1 (BArray800.get256 a 9));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 32 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 128 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 1
    ((BArray160.get256 b_638 1) `^` (BArray160.get256 d_619 4)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 32 32))]);
    t_625 <- (VPSLL_4u64 (BArray160.get256 b_638 1) (W128.of_int 20));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 32 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 1
    (VPSRL_4u64 (BArray160.get256 b_638 1) (W128.of_int 44)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 32 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 1 ((BArray160.get256 b_638 1) `|` t_625));
    b_b_638 <-
    (BArray160.set256d b_b_638 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <- (BArray160.set256 b_638 2 (BArray800.get256 a 10));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 64 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 0 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 2
    ((BArray160.get256 b_638 2) `^` (BArray160.get256 d_619 0)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 64 32))]);
    t_628 <- (VPSLL_4u64 (BArray160.get256 b_638 2) (W128.of_int 3));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 64 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 2
    (VPSRL_4u64 (BArray160.get256 b_638 2) (W128.of_int 61)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 64 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 2 ((BArray160.get256 b_638 2) `|` t_628));
    b_b_638 <-
    (BArray160.set256d b_b_638 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <- (BArray160.set256 b_638 3 (BArray800.get256 a 16));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 96 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 32 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 3
    ((BArray160.get256 b_638 3) `^` (BArray160.get256 d_619 1)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 96 32))]);
    t_631 <- (VPSLL_4u64 (BArray160.get256 b_638 3) (W128.of_int 45));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 96 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 3
    (VPSRL_4u64 (BArray160.get256 b_638 3) (W128.of_int 19)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 96 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 3 ((BArray160.get256 b_638 3) `|` t_631));
    b_b_638 <-
    (BArray160.set256d b_b_638 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <- (BArray160.set256 b_638 4 (BArray800.get256 a 22));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 128 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 64 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 4
    ((BArray160.get256 b_638 4) `^` (BArray160.get256 d_619 2)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 128 32))]);
    t_634 <- (VPSLL_4u64 (BArray160.get256 b_638 4) (W128.of_int 61));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 128 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 4
    (VPSRL_4u64 (BArray160.get256 b_638 4) (W128.of_int 3)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 128 32))]);
    b_b_638 <-
    (BArray160.set256d b_b_638 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_638 <-
    (BArray160.set256 b_638 4 ((BArray160.get256 b_638 4) `|` t_634));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 32 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 64 32))]);
    t_639 <-
    (VPANDN_256 (BArray160.get256 b_638 1) (BArray160.get256 b_638 2));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 0 32))]);
    t_640 <- (t_639 `^` (BArray160.get256 b_638 0));
    b_e <-
    (BArray800.set256d b_e 160
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 5 t_640);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 64 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 96 32))]);
    t_641 <-
    (VPANDN_256 (BArray160.get256 b_638 2) (BArray160.get256 b_638 3));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 32 32))]);
    t_642 <- (t_641 `^` (BArray160.get256 b_638 1));
    b_e <-
    (BArray800.set256d b_e 192
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 6 t_642);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 96 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 128 32))]);
    t_643 <-
    (VPANDN_256 (BArray160.get256 b_638 3) (BArray160.get256 b_638 4));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 64 32))]);
    t_644 <- (t_643 `^` (BArray160.get256 b_638 2));
    b_e <-
    (BArray800.set256d b_e 224
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 7 t_644);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 128 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 0 32))]);
    t_645 <-
    (VPANDN_256 (BArray160.get256 b_638 4) (BArray160.get256 b_638 0));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 96 32))]);
    t_646 <- (t_645 `^` (BArray160.get256 b_638 3));
    b_e <-
    (BArray800.set256d b_e 256
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 8 t_646);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 0 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 32 32))]);
    t_647 <-
    (VPANDN_256 (BArray160.get256 b_638 0) (BArray160.get256 b_638 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_638 128 32))]);
    t_648 <- (t_647 `^` (BArray160.get256 b_638 4));
    b_e <-
    (BArray800.set256d b_e 288
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 9 t_648);
    b_b_671 <-
    (BArray160.set256d b_b_671 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <- (BArray160.set256 b_671 0 (BArray800.get256 a 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 0 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 32 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 0
    ((BArray160.get256 b_671 0) `^` (BArray160.get256 d_619 1)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 0 32))]);
    t_655 <- (VPSLL_4u64 (BArray160.get256 b_671 0) (W128.of_int 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 0 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 0
    (VPSRL_4u64 (BArray160.get256 b_671 0) (W128.of_int 63)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 0 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 0 ((BArray160.get256 b_671 0) `|` t_655));
    b_b_671 <-
    (BArray160.set256d b_b_671 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <- (BArray160.set256 b_671 1 (BArray800.get256 a 7));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 32 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 64 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 1
    ((BArray160.get256 b_671 1) `^` (BArray160.get256 d_619 2)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 32 32))]);
    t_658 <- (VPSLL_4u64 (BArray160.get256 b_671 1) (W128.of_int 6));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 32 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 1
    (VPSRL_4u64 (BArray160.get256 b_671 1) (W128.of_int 58)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 32 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 1 ((BArray160.get256 b_671 1) `|` t_658));
    b_b_671 <-
    (BArray160.set256d b_b_671 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <- (BArray160.set256 b_671 2 (BArray800.get256 a 13));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 64 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 96 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 2
    ((BArray160.get256 b_671 2) `^` (BArray160.get256 d_619 3)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 64 32))]);
    t_661 <- (VPSLL_4u64 (BArray160.get256 b_671 2) (W128.of_int 25));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 64 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 2
    (VPSRL_4u64 (BArray160.get256 b_671 2) (W128.of_int 39)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 64 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 2 ((BArray160.get256 b_671 2) `|` t_661));
    b_b_671 <-
    (BArray160.set256d b_b_671 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <- (BArray160.set256 b_671 3 (BArray800.get256 a 19));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 96 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 128 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 3
    ((BArray160.get256 b_671 3) `^` (BArray160.get256 d_619 4)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 96 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 3 (VPSHUFB_256 (BArray160.get256 b_671 3) r8));
    b_b_671 <-
    (BArray160.set256d b_b_671 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <- (BArray160.set256 b_671 4 (BArray800.get256 a 20));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 128 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 0 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 4
    ((BArray160.get256 b_671 4) `^` (BArray160.get256 d_619 0)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 128 32))]);
    t_667 <- (VPSLL_4u64 (BArray160.get256 b_671 4) (W128.of_int 18));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 128 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 4
    (VPSRL_4u64 (BArray160.get256 b_671 4) (W128.of_int 46)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 128 32))]);
    b_b_671 <-
    (BArray160.set256d b_b_671 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_671 <-
    (BArray160.set256 b_671 4 ((BArray160.get256 b_671 4) `|` t_667));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 32 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 64 32))]);
    t_672 <-
    (VPANDN_256 (BArray160.get256 b_671 1) (BArray160.get256 b_671 2));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 0 32))]);
    t_673 <- (t_672 `^` (BArray160.get256 b_671 0));
    b_e <-
    (BArray800.set256d b_e 320
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 10 t_673);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 64 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 96 32))]);
    t_674 <-
    (VPANDN_256 (BArray160.get256 b_671 2) (BArray160.get256 b_671 3));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 32 32))]);
    t_675 <- (t_674 `^` (BArray160.get256 b_671 1));
    b_e <-
    (BArray800.set256d b_e 352
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 11 t_675);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 96 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 128 32))]);
    t_676 <-
    (VPANDN_256 (BArray160.get256 b_671 3) (BArray160.get256 b_671 4));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 64 32))]);
    t_677 <- (t_676 `^` (BArray160.get256 b_671 2));
    b_e <-
    (BArray800.set256d b_e 384
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 12 t_677);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 128 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 0 32))]);
    t_678 <-
    (VPANDN_256 (BArray160.get256 b_671 4) (BArray160.get256 b_671 0));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 96 32))]);
    t_679 <- (t_678 `^` (BArray160.get256 b_671 3));
    b_e <-
    (BArray800.set256d b_e 416
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 13 t_679);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 0 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 32 32))]);
    t_680 <-
    (VPANDN_256 (BArray160.get256 b_671 0) (BArray160.get256 b_671 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_671 128 32))]);
    t_681 <- (t_680 `^` (BArray160.get256 b_671 4));
    b_e <-
    (BArray800.set256d b_e 448
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 14 t_681);
    b_b_704 <-
    (BArray160.set256d b_b_704 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <- (BArray160.set256 b_704 0 (BArray800.get256 a 4));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 0 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 128 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 0
    ((BArray160.get256 b_704 0) `^` (BArray160.get256 d_619 4)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 0 32))]);
    t_688 <- (VPSLL_4u64 (BArray160.get256 b_704 0) (W128.of_int 27));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 0 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 0
    (VPSRL_4u64 (BArray160.get256 b_704 0) (W128.of_int 37)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 0 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 0 ((BArray160.get256 b_704 0) `|` t_688));
    b_b_704 <-
    (BArray160.set256d b_b_704 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <- (BArray160.set256 b_704 1 (BArray800.get256 a 5));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 32 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 0 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 1
    ((BArray160.get256 b_704 1) `^` (BArray160.get256 d_619 0)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 32 32))]);
    t_691 <- (VPSLL_4u64 (BArray160.get256 b_704 1) (W128.of_int 36));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 32 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 1
    (VPSRL_4u64 (BArray160.get256 b_704 1) (W128.of_int 28)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 32 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 1 ((BArray160.get256 b_704 1) `|` t_691));
    b_b_704 <-
    (BArray160.set256d b_b_704 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <- (BArray160.set256 b_704 2 (BArray800.get256 a 11));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 64 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 32 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 2
    ((BArray160.get256 b_704 2) `^` (BArray160.get256 d_619 1)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 64 32))]);
    t_694 <- (VPSLL_4u64 (BArray160.get256 b_704 2) (W128.of_int 10));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 64 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 2
    (VPSRL_4u64 (BArray160.get256 b_704 2) (W128.of_int 54)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 64 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 2 ((BArray160.get256 b_704 2) `|` t_694));
    b_b_704 <-
    (BArray160.set256d b_b_704 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <- (BArray160.set256 b_704 3 (BArray800.get256 a 17));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 96 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 64 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 3
    ((BArray160.get256 b_704 3) `^` (BArray160.get256 d_619 2)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 96 32))]);
    t_697 <- (VPSLL_4u64 (BArray160.get256 b_704 3) (W128.of_int 15));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 96 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 3
    (VPSRL_4u64 (BArray160.get256 b_704 3) (W128.of_int 49)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 96 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 3 ((BArray160.get256 b_704 3) `|` t_697));
    b_b_704 <-
    (BArray160.set256d b_b_704 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <- (BArray160.set256 b_704 4 (BArray800.get256 a 23));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 128 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 96 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 4
    ((BArray160.get256 b_704 4) `^` (BArray160.get256 d_619 3)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 128 32))]);
    b_b_704 <-
    (BArray160.set256d b_b_704 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_704 <-
    (BArray160.set256 b_704 4 (VPSHUFB_256 (BArray160.get256 b_704 4) r56));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 32 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 64 32))]);
    t_705 <-
    (VPANDN_256 (BArray160.get256 b_704 1) (BArray160.get256 b_704 2));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 0 32))]);
    t_706 <- (t_705 `^` (BArray160.get256 b_704 0));
    b_e <-
    (BArray800.set256d b_e 480
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 15 t_706);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 64 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 96 32))]);
    t_707 <-
    (VPANDN_256 (BArray160.get256 b_704 2) (BArray160.get256 b_704 3));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 32 32))]);
    t_708 <- (t_707 `^` (BArray160.get256 b_704 1));
    b_e <-
    (BArray800.set256d b_e 512
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 16 t_708);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 96 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 128 32))]);
    t_709 <-
    (VPANDN_256 (BArray160.get256 b_704 3) (BArray160.get256 b_704 4));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 64 32))]);
    t_710 <- (t_709 `^` (BArray160.get256 b_704 2));
    b_e <-
    (BArray800.set256d b_e 544
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 17 t_710);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 128 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 0 32))]);
    t_711 <-
    (VPANDN_256 (BArray160.get256 b_704 4) (BArray160.get256 b_704 0));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 96 32))]);
    t_712 <- (t_711 `^` (BArray160.get256 b_704 3));
    b_e <-
    (BArray800.set256d b_e 576
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 18 t_712);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 0 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 32 32))]);
    t_713 <-
    (VPANDN_256 (BArray160.get256 b_704 0) (BArray160.get256 b_704 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_704 128 32))]);
    t_714 <- (t_713 `^` (BArray160.get256 b_704 4));
    b_e <-
    (BArray800.set256d b_e 608
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 19 t_714);
    b_b_736 <-
    (BArray160.set256d b_b_736 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <- (BArray160.set256 b_736 0 (BArray800.get256 a 2));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 0 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 64 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 0
    ((BArray160.get256 b_736 0) `^` (BArray160.get256 d_619 2)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 0 32))]);
    t_720 <- (VPSLL_4u64 (BArray160.get256 b_736 0) (W128.of_int 62));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 0 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 0
    (VPSRL_4u64 (BArray160.get256 b_736 0) (W128.of_int 2)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 0 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 0
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 0 ((BArray160.get256 b_736 0) `|` t_720));
    b_b_736 <-
    (BArray160.set256d b_b_736 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <- (BArray160.set256 b_736 1 (BArray800.get256 a 8));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 32 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 96 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 1
    ((BArray160.get256 b_736 1) `^` (BArray160.get256 d_619 3)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 32 32))]);
    t_723 <- (VPSLL_4u64 (BArray160.get256 b_736 1) (W128.of_int 55));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 32 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 1
    (VPSRL_4u64 (BArray160.get256 b_736 1) (W128.of_int 9)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 32 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 32
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 1 ((BArray160.get256 b_736 1) `|` t_723));
    b_b_736 <-
    (BArray160.set256d b_b_736 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <- (BArray160.set256 b_736 2 (BArray800.get256 a 14));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 64 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 128 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 2
    ((BArray160.get256 b_736 2) `^` (BArray160.get256 d_619 4)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 64 32))]);
    t_726 <- (VPSLL_4u64 (BArray160.get256 b_736 2) (W128.of_int 39));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 64 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 2
    (VPSRL_4u64 (BArray160.get256 b_736 2) (W128.of_int 25)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 64 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 64
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 2 ((BArray160.get256 b_736 2) `|` t_726));
    b_b_736 <-
    (BArray160.set256d b_b_736 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <- (BArray160.set256 b_736 3 (BArray800.get256 a 15));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 96 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 0 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 3
    ((BArray160.get256 b_736 3) `^` (BArray160.get256 d_619 0)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 96 32))]);
    t_729 <- (VPSLL_4u64 (BArray160.get256 b_736 3) (W128.of_int 41));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 96 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 3
    (VPSRL_4u64 (BArray160.get256 b_736 3) (W128.of_int 23)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 96 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 96
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 3 ((BArray160.get256 b_736 3) `|` t_729));
    b_b_736 <-
    (BArray160.set256d b_b_736 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <- (BArray160.set256 b_736 4 (BArray800.get256 a 21));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 128 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_d_619 32 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 4
    ((BArray160.get256 b_736 4) `^` (BArray160.get256 d_619 1)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 128 32))]);
    t_732 <- (VPSLL_4u64 (BArray160.get256 b_736 4) (W128.of_int 2));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 128 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 4
    (VPSRL_4u64 (BArray160.get256 b_736 4) (W128.of_int 62)));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 128 32))]);
    b_b_736 <-
    (BArray160.set256d b_b_736 128
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    b_736 <-
    (BArray160.set256 b_736 4 ((BArray160.get256 b_736 4) `|` t_732));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 32 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 64 32))]);
    t_737 <-
    (VPANDN_256 (BArray160.get256 b_736 1) (BArray160.get256 b_736 2));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 0 32))]);
    t_738 <- (t_737 `^` (BArray160.get256 b_736 0));
    b_e <-
    (BArray800.set256d b_e 640
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 20 t_738);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 64 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 96 32))]);
    t_739 <-
    (VPANDN_256 (BArray160.get256 b_736 2) (BArray160.get256 b_736 3));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 32 32))]);
    t_740 <- (t_739 `^` (BArray160.get256 b_736 1));
    b_e <-
    (BArray800.set256d b_e 672
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 21 t_740);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 96 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 128 32))]);
    t_741 <-
    (VPANDN_256 (BArray160.get256 b_736 3) (BArray160.get256 b_736 4));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 64 32))]);
    t_742 <- (t_741 `^` (BArray160.get256 b_736 2));
    b_e <-
    (BArray800.set256d b_e 704
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 22 t_742);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 128 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 0 32))]);
    t_743 <-
    (VPANDN_256 (BArray160.get256 b_736 4) (BArray160.get256 b_736 0));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 96 32))]);
    t_744 <- (t_743 `^` (BArray160.get256 b_736 3));
    b_e <-
    (BArray800.set256d b_e 736
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 23 t_744);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 0 32))]);
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 32 32))]);
    t_745 <-
    (VPANDN_256 (BArray160.get256 b_736 0) (BArray160.get256 b_736 1));
    trace__keccakf1600_4x_pround <-
    (trace__keccakf1600_4x_pround ++
    [(Assert, (BArray160.is_init b_b_736 128 32))]);
    t_746 <- (t_745 `^` (BArray160.get256 b_736 4));
    b_e <-
    (BArray800.set256d b_e 768
    (W256.of_int
    115792089237316195423570985008687907853269984665640564039457584007913129639935
    ));
    e <- (BArray800.set256 e 24 t_746);
    return (e, b_e, trace__keccakf1600_4x_pround);
  }
  proc __keccakf1600_avx2x4 (a:BArray800.t, b_a:BArray800.t) : BArray800.t *
                                                               BArray800.t *
                                                               trace = {
    var aux:BArray800.t;
    var aux_0:BArray800.t;
    var rC:BArray192.t;
    var s_e:BArray800.t;
    var e:BArray800.t;
    var r8:W256.t;
    var r56:W256.t;
    var rc:W256.t;
    var t:W256.t;
    var c:int;
    var param:W256.t;
    var param_0:W256.t;
    var param_1:BArray800.t;
    var param_2:BArray800.t;
    var result:BArray800.t;
    var param_3:W256.t;
    var param_4:W256.t;
    var param_5:BArray800.t;
    var param_6:BArray800.t;
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
    param_1 <- witness;
    param_2 <- witness;
    param_5 <- witness;
    param_6 <- witness;
    result <- witness;
    result_0 <- witness;
    s_e <- witness;
    trace___keccakf1600_avx2x4 <- [];
    trace___keccakf1600_avx2x4 <-
    (trace___keccakf1600_avx2x4 ++ [(Assert, (BArray800.is_init b_a 0 800))]);
    b_s_e <- (BArray800.init_arr (W8.of_int 0));
    rC <- kECCAK1600_RC;
    b_e <- b_s_e;
    e <- s_e;
    r8 <- rOL8;
    r56 <- rOL56;
    c <- 0;
    while ((c < 24)) {
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++
      [(Assert, ((0 <= (c * 8)) /\ (((c * 8) + 8) <= 192)))]);
      rc <- (VPBROADCAST_4u64 (BArray192.get64 rC c));
      b_param_1 <- b_e;
      param_2 <- e;
      param_1 <- a;
      param_0 <- r8;
      param <- r56;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_4x_pround (param_2, b_param_1,
      param_1, (BArray800.init_arr (W8.of_int 255)), param_0, param);
      result <- aux;
      b_result_0 <- aux_0;
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++ tmp__trace);
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++
      [(Assert, (BArray800.is_init b_result_0 0 800))]);
      e <- result;
      t <- (rc `^` (BArray800.get256 e 0));
      e <- (BArray800.set256 e 0 t);
      (b_a, b_e) <-
      (swap_ (BArray800.init_arr (W8.of_int 255))
      (BArray800.init_arr (W8.of_int 255)));
      (a, e) <- (swap_ e a);
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++
      [(Assert, ((0 <= (c + 1)) /\ ((c + 1) <= 18446744073709551615)))]);
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++
      [(Assert, ((0 <= ((c + 1) * 8)) /\ ((((c + 1) * 8) + 8) <= 192)))]);
      rc <- (VPBROADCAST_4u64 (BArray192.get64 rC (c + 1)));
      b_param_0 <- b_a;
      param_6 <- a;
      b_param <- b_e;
      param_5 <- e;
      param_4 <- r8;
      param_3 <- r56;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_4x_pround (param_6, b_param_0,
      param_5, b_param, param_4, param_3);
      result_0 <- aux;
      b_result <- aux_0;
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++ tmp__trace);
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++
      [(Assert, (BArray800.is_init b_result 0 800))]);
      a <- result_0;
      t <- (rc `^` (BArray800.get256 a 0));
      a <- (BArray800.set256 a 0 t);
      (b_a, b_e) <- (swap_ b_e (BArray800.init_arr (W8.of_int 255)));
      (a, e) <- (swap_ e a);
      trace___keccakf1600_avx2x4 <-
      (trace___keccakf1600_avx2x4 ++
      [(Assert, ((0 <= (c + 2)) /\ ((c + 2) <= 18446744073709551615)))]);
      c <- (c + 2);
    }
    b_a <- (BArray800.init_arr (W8.of_int 255));
    return (a, b_a, trace___keccakf1600_avx2x4);
  }
  proc _keccakf1600_avx2x4 (a:BArray800.t, b_a:BArray800.t) : BArray800.t *
                                                              BArray800.t *
                                                              trace = {
    var aux:BArray800.t;
    var aux_0:BArray800.t;
    var param:BArray800.t;
    var result:BArray800.t;
    var b_result:BArray800.t;
    var trace__keccakf1600_avx2x4:trace;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace__keccakf1600_avx2x4 <- [];
    trace__keccakf1600_avx2x4 <-
    (trace__keccakf1600_avx2x4 ++ [(Assert, (BArray800.is_init b_a 0 800))]);
    param <- a;
    (aux, aux_0, tmp__trace) <@ __keccakf1600_avx2x4 (param,
    (BArray800.init_arr (W8.of_int 255)));
    result <- aux;
    b_result <- aux_0;
    trace__keccakf1600_avx2x4 <- (trace__keccakf1600_avx2x4 ++ tmp__trace);
    trace__keccakf1600_avx2x4 <-
    (trace__keccakf1600_avx2x4 ++
    [(Assert, (BArray800.is_init b_result 0 800))]);
    a <- result;
    b_a <- (BArray800.init_arr (W8.of_int 255));
    return (a, b_a, trace__keccakf1600_avx2x4);
  }
  proc _keccakf1600_avx2x4_ (a:BArray800.t, b_a:BArray800.t) : BArray800.t *
                                                               BArray800.t *
                                                               trace = {
    var aux:BArray800.t;
    var aux_0:BArray800.t;
    var param:BArray800.t;
    var result:BArray800.t;
    var b_result:BArray800.t;
    var trace__keccakf1600_avx2x4_:trace;
    b_result <- witness;
    param <- witness;
    result <- witness;
    trace__keccakf1600_avx2x4_ <- [];
    trace__keccakf1600_avx2x4_ <-
    (trace__keccakf1600_avx2x4_ ++ [(Assert, (BArray800.is_init b_a 0 800))]);
    a <- a;
    param <- a;
    (aux, aux_0, tmp__trace) <@ _keccakf1600_avx2x4 (param,
    (BArray800.init_arr (W8.of_int 255)));
    result <- aux;
    b_result <- aux_0;
    trace__keccakf1600_avx2x4_ <- (trace__keccakf1600_avx2x4_ ++ tmp__trace);
    trace__keccakf1600_avx2x4_ <-
    (trace__keccakf1600_avx2x4_ ++
    [(Assert, (BArray800.is_init b_result 0 800))]);
    a <- result;
    a <- a;
    b_a <- (BArray800.init_arr (W8.of_int 255));
    return (a, b_a, trace__keccakf1600_avx2x4_);
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
  proc __st4x_pack (st4x:BArray800.t, b_st4x:BArray800.t, st0:BArray200.t,
                    b_st0:BArray200.t, st1:BArray200.t, b_st1:BArray200.t,
                    st2:BArray200.t, b_st2:BArray200.t, st3:BArray200.t,
                    b_st3:BArray200.t) : BArray800.t * BArray800.t * trace = {
    var i:int;
    var x0:W256.t;
    var x1:W256.t;
    var x2:W256.t;
    var x3:W256.t;
    var t0:W64.t;
    var t1:W64.t;
    var t2:W64.t;
    var t3:W64.t;
    var param:W256.t;
    var param_0:W256.t;
    var param_1:W256.t;
    var param_2:W256.t;
    var result:W256.t;
    var result_0:W256.t;
    var result_1:W256.t;
    var result_2:W256.t;
    var trace___st4x_pack:trace;
    trace___st4x_pack <- [];
    trace___st4x_pack <-
    (trace___st4x_pack ++
    [(Assert,
     ((((BArray200.is_init b_st0 0 200) /\ (BArray200.is_init b_st1 0 200)) /\
      (BArray200.is_init b_st2 0 200)) /\
     (BArray200.is_init b_st3 0 200)))]);
    i <- 0;
    while ((i < 6)) {
      trace___st4x_pack <-
      (trace___st4x_pack ++
      [(Assert, ((0 <= (i * 32)) /\ (((i * 32) + 32) <= 200)))]);
      x0 <- (BArray200.get256 st0 i);
      trace___st4x_pack <-
      (trace___st4x_pack ++
      [(Assert, ((0 <= (i * 32)) /\ (((i * 32) + 32) <= 200)))]);
      x1 <- (BArray200.get256 st1 i);
      trace___st4x_pack <-
      (trace___st4x_pack ++
      [(Assert, ((0 <= (i * 32)) /\ (((i * 32) + 32) <= 200)))]);
      x2 <- (BArray200.get256 st2 i);
      trace___st4x_pack <-
      (trace___st4x_pack ++
      [(Assert, ((0 <= (i * 32)) /\ (((i * 32) + 32) <= 200)))]);
      x3 <- (BArray200.get256 st3 i);
      param_2 <- x0;
      param_1 <- x1;
      param_0 <- x2;
      param <- x3;
      (result_2, result_1, result_0, result, tmp__trace) <@ __u256x4_4u64x4 (
      param_2, param_1, param_0, param);
      trace___st4x_pack <- (trace___st4x_pack ++ tmp__trace);
      x0 <- result_2;
      x1 <- result_1;
      x2 <- result_0;
      x3 <- result;
      trace___st4x_pack <-
      (trace___st4x_pack ++
      [(Assert, ((0 <= ((4 * i) * 32)) /\ ((((4 * i) * 32) + 32) <= 800)))]);
      b_st4x <-
      (BArray800.set256d b_st4x ((4 * i) * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      st4x <- (BArray800.set256 st4x (4 * i) x0);
      trace___st4x_pack <-
      (trace___st4x_pack ++
      [(Assert,
       ((0 <= (((4 * i) + 1) * 32)) /\ (((((4 * i) + 1) * 32) + 32) <= 800)))]);
      b_st4x <-
      (BArray800.set256d b_st4x (((4 * i) + 1) * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      st4x <- (BArray800.set256 st4x ((4 * i) + 1) x1);
      trace___st4x_pack <-
      (trace___st4x_pack ++
      [(Assert,
       ((0 <= (((4 * i) + 2) * 32)) /\ (((((4 * i) + 2) * 32) + 32) <= 800)))]);
      b_st4x <-
      (BArray800.set256d b_st4x (((4 * i) + 2) * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      st4x <- (BArray800.set256 st4x ((4 * i) + 2) x2);
      trace___st4x_pack <-
      (trace___st4x_pack ++
      [(Assert,
       ((0 <= (((4 * i) + 3) * 32)) /\ (((((4 * i) + 3) * 32) + 32) <= 800)))]);
      b_st4x <-
      (BArray800.set256d b_st4x (((4 * i) + 3) * 32)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      st4x <- (BArray800.set256 st4x ((4 * i) + 3) x3);
      i <- (i + 1);
    }
    t0 <- (BArray200.get64 st0 24);
    t1 <- (BArray200.get64 st1 24);
    t2 <- (BArray200.get64 st2 24);
    t3 <- (BArray200.get64 st3 24);
    b_st4x <-
    (BArray800.set64d b_st4x 768 (W64.of_int 18446744073709551615));
    st4x <- (BArray800.set64 st4x 96 t0);
    b_st4x <-
    (BArray800.set64d b_st4x 776 (W64.of_int 18446744073709551615));
    st4x <- (BArray800.set64 st4x 97 t1);
    b_st4x <-
    (BArray800.set64d b_st4x 784 (W64.of_int 18446744073709551615));
    st4x <- (BArray800.set64 st4x 98 t2);
    b_st4x <-
    (BArray800.set64d b_st4x 792 (W64.of_int 18446744073709551615));
    st4x <- (BArray800.set64 st4x 99 t3);
    return (st4x, b_st4x, trace___st4x_pack);
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
  proc __st4x_unpack (st0:BArray200.t, b_st0:BArray200.t, st1:BArray200.t,
                      b_st1:BArray200.t, st2:BArray200.t, b_st2:BArray200.t,
                      st3:BArray200.t, b_st3:BArray200.t, st4x:BArray800.t,
                      b_st4x:BArray800.t) : BArray200.t * BArray200.t *
                                            BArray200.t * BArray200.t *
                                            BArray200.t * BArray200.t *
                                            BArray200.t * BArray200.t * trace = {
    var i:int;
    var x0:W256.t;
    var x1:W256.t;
    var x2:W256.t;
    var x3:W256.t;
    var t0:W64.t;
    var t1:W64.t;
    var t2:W64.t;
    var t3:W64.t;
    var param:W256.t;
    var param_0:W256.t;
    var param_1:W256.t;
    var param_2:W256.t;
    var result:W256.t;
    var result_0:W256.t;
    var result_1:W256.t;
    var result_2:W256.t;
    var trace___st4x_unpack:trace;
    trace___st4x_unpack <- [];
    trace___st4x_unpack <-
    (trace___st4x_unpack ++ [(Assert, (BArray800.is_init b_st4x 0 800))]);
    i <- 0;
    while ((i < 6)) {
      trace___st4x_unpack <-
      (trace___st4x_unpack ++
      [(Assert, ((0 <= ((4 * i) * 32)) /\ ((((4 * i) * 32) + 32) <= 800)))]);
      x0 <- (BArray800.get256 st4x (4 * i));
      trace___st4x_unpack <-
      (trace___st4x_unpack ++
      [(Assert,
       ((0 <= (((4 * i) + 1) * 32)) /\ (((((4 * i) + 1) * 32) + 32) <= 800)))]);
      x1 <- (BArray800.get256 st4x ((4 * i) + 1));
      trace___st4x_unpack <-
      (trace___st4x_unpack ++
      [(Assert,
       ((0 <= (((4 * i) + 2) * 32)) /\ (((((4 * i) + 2) * 32) + 32) <= 800)))]);
      x2 <- (BArray800.get256 st4x ((4 * i) + 2));
      trace___st4x_unpack <-
      (trace___st4x_unpack ++
      [(Assert,
       ((0 <= (((4 * i) + 3) * 32)) /\ (((((4 * i) + 3) * 32) + 32) <= 800)))]);
      x3 <- (BArray800.get256 st4x ((4 * i) + 3));
      param_2 <- x0;
      param_1 <- x1;
      param_0 <- x2;
      param <- x3;
      (result_2, result_1, result_0, result, tmp__trace) <@ __4u64x4_u256x4 (
      param_2, param_1, param_0, param);
      trace___st4x_unpack <- (trace___st4x_unpack ++ tmp__trace);
      x0 <- result_2;
      x1 <- result_1;
      x2 <- result_0;
      x3 <- result;
      trace___st4x_unpack <-
      (trace___st4x_unpack ++
      [(Assert, ((0 <= (32 * i)) /\ (((32 * i) + 32) <= 200)))]);
      b_st0 <-
      (BArray200.set256d b_st0 (32 * i)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      st0 <- (BArray200.set256d st0 (32 * i) x0);
      trace___st4x_unpack <-
      (trace___st4x_unpack ++
      [(Assert, ((0 <= (32 * i)) /\ (((32 * i) + 32) <= 200)))]);
      b_st1 <-
      (BArray200.set256d b_st1 (32 * i)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      st1 <- (BArray200.set256d st1 (32 * i) x1);
      trace___st4x_unpack <-
      (trace___st4x_unpack ++
      [(Assert, ((0 <= (32 * i)) /\ (((32 * i) + 32) <= 200)))]);
      b_st2 <-
      (BArray200.set256d b_st2 (32 * i)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      st2 <- (BArray200.set256d st2 (32 * i) x2);
      trace___st4x_unpack <-
      (trace___st4x_unpack ++
      [(Assert, ((0 <= (32 * i)) /\ (((32 * i) + 32) <= 200)))]);
      b_st3 <-
      (BArray200.set256d b_st3 (32 * i)
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      st3 <- (BArray200.set256d st3 (32 * i) x3);
      i <- (i + 1);
    }
    t0 <- (BArray800.get64 st4x 96);
    t1 <- (BArray800.get64 st4x 97);
    t2 <- (BArray800.get64 st4x 98);
    t3 <- (BArray800.get64 st4x 99);
    b_st0 <- (BArray200.set64d b_st0 192 (W64.of_int 18446744073709551615));
    st0 <- (BArray200.set64 st0 24 t0);
    b_st1 <- (BArray200.set64d b_st1 192 (W64.of_int 18446744073709551615));
    st1 <- (BArray200.set64 st1 24 t1);
    b_st2 <- (BArray200.set64d b_st2 192 (W64.of_int 18446744073709551615));
    st2 <- (BArray200.set64 st2 24 t2);
    b_st3 <- (BArray200.set64d b_st3 192 (W64.of_int 18446744073709551615));
    st3 <- (BArray200.set64 st3 24 t3);
    return (st0, b_st0, st1, b_st1, st2, b_st2, st3, b_st3,
           trace___st4x_unpack);
  }
  proc __keccakf1600_pround_unpacked (st0:BArray200.t, b_st0:BArray200.t,
                                      st1:BArray200.t, b_st1:BArray200.t,
                                      st2:BArray200.t, b_st2:BArray200.t,
                                      st3:BArray200.t, b_st3:BArray200.t) : 
  BArray200.t * BArray200.t * BArray200.t * BArray200.t * BArray200.t *
  BArray200.t * BArray200.t * BArray200.t * trace = {
    var aux_1:BArray200.t;
    var aux_2:BArray200.t;
    var aux_3:BArray200.t;
    var aux_4:BArray200.t;
    var aux_5:BArray200.t;
    var aux_6:BArray200.t;
    var aux_7:BArray200.t;
    var aux_8:BArray200.t;
    var aux:BArray800.t;
    var aux_0:BArray800.t;
    var r8:W256.t;
    var r56:W256.t;
    var st4x1:BArray800.t;
    var st4x2:BArray800.t;
    var param:BArray200.t;
    var param_0:BArray200.t;
    var param_1:BArray200.t;
    var param_2:BArray200.t;
    var param_3:BArray800.t;
    var result:BArray800.t;
    var param_4:W256.t;
    var param_5:W256.t;
    var param_6:BArray800.t;
    var param_7:BArray800.t;
    var result_0:BArray800.t;
    var param_8:BArray800.t;
    var param_9:BArray200.t;
    var param_10:BArray200.t;
    var param_11:BArray200.t;
    var param_12:BArray200.t;
    var result_1:BArray200.t;
    var result_2:BArray200.t;
    var result_3:BArray200.t;
    var result_4:BArray200.t;
    var b_result:BArray200.t;
    var b_result_0:BArray200.t;
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_st4x2:BArray800.t;
    var b_result_3:BArray800.t;
    var b_param:BArray800.t;
    var b_st4x1:BArray800.t;
    var b_result_4:BArray800.t;
    var b_param_0:BArray800.t;
    var trace___keccakf1600_pround_unpacked:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    b_st4x1 <- witness;
    b_st4x2 <- witness;
    param <- witness;
    param_0 <- witness;
    param_1 <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    param_8 <- witness;
    param_9 <- witness;
    param_10 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_3 <- witness;
    result_4 <- witness;
    st4x1 <- witness;
    st4x2 <- witness;
    trace___keccakf1600_pround_unpacked <- [];
    trace___keccakf1600_pround_unpacked <-
    (trace___keccakf1600_pround_unpacked ++
    [(Assert, (BArray200.is_init b_st0 0 200))]);
    trace___keccakf1600_pround_unpacked <-
    (trace___keccakf1600_pround_unpacked ++
    [(Assert, (BArray200.is_init b_st1 0 200))]);
    trace___keccakf1600_pround_unpacked <-
    (trace___keccakf1600_pround_unpacked ++
    [(Assert, (BArray200.is_init b_st2 0 200))]);
    trace___keccakf1600_pround_unpacked <-
    (trace___keccakf1600_pround_unpacked ++
    [(Assert, (BArray200.is_init b_st3 0 200))]);
    b_st4x1 <- (BArray800.init_arr (W8.of_int 0));
    b_st4x2 <- (BArray800.init_arr (W8.of_int 0));
    r8 <- rOL8;
    r56 <- rOL56;
    b_param_0 <- b_st4x1;
    param_3 <- st4x1;
    param_2 <- st0;
    param_1 <- st1;
    param_0 <- st2;
    param <- st3;
    (aux, aux_0, tmp__trace) <@ __st4x_pack (param_3, b_param_0, param_2,
    (BArray200.init_arr (W8.of_int 255)), param_1,
    (BArray200.init_arr (W8.of_int 255)), param_0,
    (BArray200.init_arr (W8.of_int 255)), param,
    (BArray200.init_arr (W8.of_int 255)));
    result <- aux;
    b_result_4 <- aux_0;
    trace___keccakf1600_pround_unpacked <-
    (trace___keccakf1600_pround_unpacked ++ tmp__trace);
    trace___keccakf1600_pround_unpacked <-
    (trace___keccakf1600_pround_unpacked ++
    [(Assert, (BArray800.is_init b_result_4 0 800))]);
    st4x1 <- result;
    b_param <- b_st4x2;
    param_7 <- st4x2;
    param_6 <- st4x1;
    param_5 <- r8;
    param_4 <- r56;
    (aux, aux_0, tmp__trace) <@ _keccakf1600_4x_pround (param_7, b_param,
    param_6, (BArray800.init_arr (W8.of_int 255)), param_5, param_4);
    result_0 <- aux;
    b_result_3 <- aux_0;
    trace___keccakf1600_pround_unpacked <-
    (trace___keccakf1600_pround_unpacked ++ tmp__trace);
    trace___keccakf1600_pround_unpacked <-
    (trace___keccakf1600_pround_unpacked ++
    [(Assert, (BArray800.is_init b_result_3 0 800))]);
    st4x2 <- result_0;
    param_12 <- st0;
    param_11 <- st1;
    param_10 <- st2;
    param_9 <- st3;
    param_8 <- st4x2;
    (aux_1, aux_2, aux_3, aux_4, aux_5, aux_6, aux_7, aux_8, tmp__trace) <@ 
    __st4x_unpack (param_12, (BArray200.init_arr (W8.of_int 255)), param_11,
    (BArray200.init_arr (W8.of_int 255)), param_10,
    (BArray200.init_arr (W8.of_int 255)), param_9,
    (BArray200.init_arr (W8.of_int 255)), param_8,
    (BArray800.init_arr (W8.of_int 255)));
    result_4 <- aux_1;
    b_result_2 <- aux_2;
    result_3 <- aux_3;
    b_result_1 <- aux_4;
    result_2 <- aux_5;
    b_result_0 <- aux_6;
    result_1 <- aux_7;
    b_result <- aux_8;
    trace___keccakf1600_pround_unpacked <-
    (trace___keccakf1600_pround_unpacked ++ tmp__trace);
    trace___keccakf1600_pround_unpacked <-
    (trace___keccakf1600_pround_unpacked ++
    [(Assert,
     ((((BArray200.is_init b_result_2 0 200) /\
       (BArray200.is_init b_result_1 0 200)) /\
      (BArray200.is_init b_result_0 0 200)) /\
     (BArray200.is_init b_result 0 200)))]);
    st0 <- result_4;
    st1 <- result_3;
    st2 <- result_2;
    st3 <- result_1;
    b_st3 <- (BArray200.init_arr (W8.of_int 255));
    b_st2 <- (BArray200.init_arr (W8.of_int 255));
    b_st1 <- (BArray200.init_arr (W8.of_int 255));
    b_st0 <- (BArray200.init_arr (W8.of_int 255));
    return (st0, b_st0, st1, b_st1, st2, b_st2, st3, b_st3,
           trace___keccakf1600_pround_unpacked);
  }
  proc __keccakf1600_pround_equiv (e:BArray800.t, b_e:BArray800.t,
                                   a:BArray800.t, b_a:BArray800.t) : 
  BArray800.t * BArray800.t * trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var aux_1:BArray200.t;
    var aux_2:BArray200.t;
    var aux_3:BArray200.t;
    var aux_4:BArray200.t;
    var aux_5:BArray200.t;
    var aux_6:BArray200.t;
    var aux_7:BArray800.t;
    var aux_8:BArray800.t;
    var st0:BArray200.t;
    var st1:BArray200.t;
    var st2:BArray200.t;
    var st3:BArray200.t;
    var param:BArray800.t;
    var param_0:BArray200.t;
    var param_1:BArray200.t;
    var param_2:BArray200.t;
    var param_3:BArray200.t;
    var result:BArray200.t;
    var result_0:BArray200.t;
    var result_1:BArray200.t;
    var result_2:BArray200.t;
    var param_4:BArray200.t;
    var param_5:BArray200.t;
    var param_6:BArray200.t;
    var param_7:BArray200.t;
    var result_3:BArray200.t;
    var result_4:BArray200.t;
    var result_5:BArray200.t;
    var result_6:BArray200.t;
    var param_8:BArray200.t;
    var param_9:BArray200.t;
    var param_10:BArray200.t;
    var param_11:BArray200.t;
    var param_12:BArray800.t;
    var result_7:BArray800.t;
    var b_result:BArray800.t;
    var b_param:BArray800.t;
    var b_st3:BArray200.t;
    var b_st2:BArray200.t;
    var b_st1:BArray200.t;
    var b_st0:BArray200.t;
    var b_result_0:BArray200.t;
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_result_3:BArray200.t;
    var b_result_4:BArray200.t;
    var b_result_5:BArray200.t;
    var b_result_6:BArray200.t;
    var b_result_7:BArray200.t;
    var b_param_0:BArray200.t;
    var b_param_1:BArray200.t;
    var b_param_2:BArray200.t;
    var b_param_3:BArray200.t;
    var trace___keccakf1600_pround_equiv:trace;
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
    b_st0 <- witness;
    b_st1 <- witness;
    b_st2 <- witness;
    b_st3 <- witness;
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
    result <- witness;
    result_0 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_3 <- witness;
    result_4 <- witness;
    result_5 <- witness;
    result_6 <- witness;
    result_7 <- witness;
    st0 <- witness;
    st1 <- witness;
    st2 <- witness;
    st3 <- witness;
    trace___keccakf1600_pround_equiv <- [];
    trace___keccakf1600_pround_equiv <-
    (trace___keccakf1600_pround_equiv ++
    [(Assert, (BArray800.is_init b_a 0 800))]);
    b_st0 <- (BArray200.init_arr (W8.of_int 0));
    b_st1 <- (BArray200.init_arr (W8.of_int 0));
    b_st2 <- (BArray200.init_arr (W8.of_int 0));
    b_st3 <- (BArray200.init_arr (W8.of_int 0));
    b_param_3 <- b_st0;
    param_3 <- st0;
    b_param_2 <- b_st1;
    param_2 <- st1;
    b_param_1 <- b_st2;
    param_1 <- st2;
    b_param_0 <- b_st3;
    param_0 <- st3;
    param <- a;
    (aux, aux_0, aux_1, aux_2, aux_3, aux_4, aux_5, aux_6, tmp__trace) <@ 
    __st4x_unpack (param_3, b_param_3, param_2, b_param_2, param_1,
    b_param_1, param_0, b_param_0, param,
    (BArray800.init_arr (W8.of_int 255)));
    result_2 <- aux;
    b_result_7 <- aux_0;
    result_1 <- aux_1;
    b_result_6 <- aux_2;
    result_0 <- aux_3;
    b_result_5 <- aux_4;
    result <- aux_5;
    b_result_4 <- aux_6;
    trace___keccakf1600_pround_equiv <-
    (trace___keccakf1600_pround_equiv ++ tmp__trace);
    trace___keccakf1600_pround_equiv <-
    (trace___keccakf1600_pround_equiv ++
    [(Assert,
     ((((BArray200.is_init b_result_7 0 200) /\
       (BArray200.is_init b_result_6 0 200)) /\
      (BArray200.is_init b_result_5 0 200)) /\
     (BArray200.is_init b_result_4 0 200)))]);
    st0 <- result_2;
    st1 <- result_1;
    st2 <- result_0;
    st3 <- result;
    param_7 <- st0;
    param_6 <- st1;
    param_5 <- st2;
    param_4 <- st3;
    (aux, aux_0, aux_1, aux_2, aux_3, aux_4, aux_5, aux_6, tmp__trace) <@ 
    __keccakf1600_pround_unpacked (param_7,
    (BArray200.init_arr (W8.of_int 255)), param_6,
    (BArray200.init_arr (W8.of_int 255)), param_5,
    (BArray200.init_arr (W8.of_int 255)), param_4,
    (BArray200.init_arr (W8.of_int 255)));
    result_6 <- aux;
    b_result_3 <- aux_0;
    result_5 <- aux_1;
    b_result_2 <- aux_2;
    result_4 <- aux_3;
    b_result_1 <- aux_4;
    result_3 <- aux_5;
    b_result_0 <- aux_6;
    trace___keccakf1600_pround_equiv <-
    (trace___keccakf1600_pround_equiv ++ tmp__trace);
    trace___keccakf1600_pround_equiv <-
    (trace___keccakf1600_pround_equiv ++
    [(Assert, (BArray200.is_init b_result_3 0 200))]);
    trace___keccakf1600_pround_equiv <-
    (trace___keccakf1600_pround_equiv ++
    [(Assert, (BArray200.is_init b_result_2 0 200))]);
    trace___keccakf1600_pround_equiv <-
    (trace___keccakf1600_pround_equiv ++
    [(Assert, (BArray200.is_init b_result_1 0 200))]);
    trace___keccakf1600_pround_equiv <-
    (trace___keccakf1600_pround_equiv ++
    [(Assert, (BArray200.is_init b_result_0 0 200))]);
    st0 <- result_6;
    st1 <- result_5;
    st2 <- result_4;
    st3 <- result_3;
    b_param <- b_e;
    param_12 <- e;
    param_11 <- st0;
    param_10 <- st1;
    param_9 <- st2;
    param_8 <- st3;
    (aux_7, aux_8, tmp__trace) <@ __st4x_pack (param_12, b_param, param_11,
    (BArray200.init_arr (W8.of_int 255)), param_10,
    (BArray200.init_arr (W8.of_int 255)), param_9,
    (BArray200.init_arr (W8.of_int 255)), param_8,
    (BArray200.init_arr (W8.of_int 255)));
    result_7 <- aux_7;
    b_result <- aux_8;
    trace___keccakf1600_pround_equiv <-
    (trace___keccakf1600_pround_equiv ++ tmp__trace);
    trace___keccakf1600_pround_equiv <-
    (trace___keccakf1600_pround_equiv ++
    [(Assert, (BArray800.is_init b_result 0 800))]);
    e <- result_7;
    b_e <- (BArray800.init_arr (W8.of_int 255));
    return (e, b_e, trace___keccakf1600_pround_equiv);
  }
  proc __state_init_avx2x4 (st:BArray800.t, b_st:BArray800.t) : BArray800.t *
                                                                BArray800.t *
                                                                trace = {
    var z256:W256.t;
    var i:int;
    var trace___state_init_avx2x4:trace;
    trace___state_init_avx2x4 <- [];
    z256 <- (set0_256);
    i <- 0;
    while ((i < 800)) {
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
  proc __addratebit_avx2x4 (st:BArray800.t, b_st:BArray800.t, rATE8:int) : 
  BArray800.t * BArray800.t * trace = {
    var t64:W64.t;
    var t128:W128.t;
    var t256:W256.t;
    var trace___addratebit_avx2x4:trace;
    trace___addratebit_avx2x4 <- [];
    trace___addratebit_avx2x4 <-
    (trace___addratebit_avx2x4 ++
    [(Assert,
     (((BArray800.is_init b_st 0 800) /\ (0 < rATE8)) /\ (rATE8 < 200)))]);
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
    b_st <- (BArray800.init_arr (W8.of_int 255));
    return (st, b_st, trace___addratebit_avx2x4);
  }
  proc __a_ilen_read_upto8_at (buf:BArrayS.t, b_buf:BArrayS.t,
                               offset:int, dELTA:int, lEN:int, tRAIL:int,
                               cUR:int, aT:int) : int * int * int * int *
                                                  W64.t * trace = {
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
    var trace___a_ilen_read_upto8_at:trace;
    trace___a_ilen_read_upto8_at <- [];
    trace___a_ilen_read_upto8_at <-
    (trace___a_ilen_read_upto8_at ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     ((((((BArrayS.is_init b_buf (offset + dELTA) ((lEN < 8) ? lEN : 8)) /\
         (0 <= dELTA)) /\
        (0 <= offset)) /\
       (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= size)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256)))))))))]);
    trace___a_ilen_read_upto8_at <-
    (trace___a_ilen_read_upto8_at ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      aT8 <- (aT - cUR);
      if ((8 <= lEN)) {
        trace___a_ilen_read_upto8_at <-
        (trace___a_ilen_read_upto8_at ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___a_ilen_read_upto8_at <-
        (trace___a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___a_ilen_read_upto8_at <-
        (trace___a_ilen_read_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
        trace___a_ilen_read_upto8_at <-
        (trace___a_ilen_read_upto8_at ++
        [(Assert, (BArrayS.is_init b_buf (offset + dELTA) 8))]);
        w <- (BArrayS.get64d buf (offset + dELTA));
        param_0 <- w;
        param <- aT8;
        (result, tmp__trace) <@ __SHLQ (param_0, param);
        trace___a_ilen_read_upto8_at <-
        (trace___a_ilen_read_upto8_at ++ tmp__trace);
        w <- result;
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT8 <- 8;
      } else {
        if ((4 <= lEN)) {
          trace___a_ilen_read_upto8_at <-
          (trace___a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___a_ilen_read_upto8_at <-
          (trace___a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___a_ilen_read_upto8_at <-
          (trace___a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 4) <= size)))]);
          trace___a_ilen_read_upto8_at <-
          (trace___a_ilen_read_upto8_at ++
          [(Assert, (BArrayS.is_init b_buf (offset + dELTA) 4))]);
          w <- (zeroextu64 (BArrayS.get32d buf (offset + dELTA)));
          param_2 <- w;
          param_1 <- aT8;
          (result_0, tmp__trace) <@ __SHLQ (param_2, param_1);
          trace___a_ilen_read_upto8_at <-
          (trace___a_ilen_read_upto8_at ++ tmp__trace);
          w <- result_0;
          dELTA <- (dELTA + ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          lEN <- (lEN - ((8 <= (4 + aT8)) ? (8 - aT8) : 4));
          aT8 <- ((8 <= (4 + aT8)) ? 8 : (4 + aT8));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT8 < 8) /\ (2 <= lEN))) {
          trace___a_ilen_read_upto8_at <-
          (trace___a_ilen_read_upto8_at ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___a_ilen_read_upto8_at <-
          (trace___a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___a_ilen_read_upto8_at <-
          (trace___a_ilen_read_upto8_at ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 2) <= size)))]);
          trace___a_ilen_read_upto8_at <-
          (trace___a_ilen_read_upto8_at ++
          [(Assert, (BArrayS.is_init b_buf (offset + dELTA) 2))]);
          t16 <- (zeroextu64 (BArrayS.get16d buf (offset + dELTA)));
          dELTA <- (dELTA + ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          lEN <- (lEN - ((8 <= (2 + aT8)) ? (8 - aT8) : 2));
          param_4 <- t16;
          param_3 <- aT8;
          (result_1, tmp__trace) <@ __SHLQ (param_4, param_3);
          trace___a_ilen_read_upto8_at <-
          (trace___a_ilen_read_upto8_at ++ tmp__trace);
          t16 <- result_1;
          w <- (w `|` t16);
          aT8 <- ((8 <= (2 + aT8)) ? 8 : (2 + aT8));
        } else {
          
        }
        if ((aT8 < 8)) {
          if ((1 <= lEN)) {
            trace___a_ilen_read_upto8_at <-
            (trace___a_ilen_read_upto8_at ++
            [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
            trace___a_ilen_read_upto8_at <-
            (trace___a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\
             ((offset + dELTA) <= 18446744073709551615)))]);
            trace___a_ilen_read_upto8_at <-
            (trace___a_ilen_read_upto8_at ++
            [(Assert,
             ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 1) <= size)))]);
            trace___a_ilen_read_upto8_at <-
            (trace___a_ilen_read_upto8_at ++
            [(Assert, (BArrayS.is_init b_buf (offset + dELTA) 1))]);
            t8 <- (zeroextu64 (BArrayS.get8d buf (offset + dELTA)));
            t8 <- (t8 `|` (W64.of_int (256 * (tRAIL %% 256))));
            dELTA <- (dELTA + 1);
            lEN <- (lEN - 1);
            param_6 <- t8;
            param_5 <- aT8;
            (result_2, tmp__trace) <@ __SHLQ (param_6, param_5);
            trace___a_ilen_read_upto8_at <-
            (trace___a_ilen_read_upto8_at ++ tmp__trace);
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
              trace___a_ilen_read_upto8_at <-
              (trace___a_ilen_read_upto8_at ++ tmp__trace);
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
    return (dELTA, lEN, tRAIL, aT, w, trace___a_ilen_read_upto8_at);
  }
  proc __a_ilen_read_upto16_at (buf:BArrayS.t, b_buf:BArrayS.t,
                                offset:int, dELTA:int, lEN:int, tRAIL:int,
                                cUR:int, aT:int) : int * int * int * int *
                                                   W128.t * trace = {
    var w:W128.t;
    var aT16:int;
    var t64_0:W64.t;
    var t64_1:W64.t;
    var param:int;
    var param_0:W128.t;
    var result:W128.t;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:int;
    var param_6:int;
    var param_7:BArrayS.t;
    var result_0:W64.t;
    var result_1:int;
    var result_2:int;
    var result_3:int;
    var result_4:int;
    var param_8:int;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:int;
    var param_13:int;
    var param_14:BArrayS.t;
    var result_5:W64.t;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var result_9:int;
    var param_15:int;
    var param_16:int;
    var param_17:int;
    var param_18:int;
    var param_19:int;
    var param_20:int;
    var param_21:BArrayS.t;
    var result_10:W64.t;
    var result_11:int;
    var result_12:int;
    var result_13:int;
    var result_14:int;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_param_1:BArrayS.t;
    var trace___a_ilen_read_upto16_at:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    param_7 <- witness;
    param_14 <- witness;
    param_21 <- witness;
    trace___a_ilen_read_upto16_at <- [];
    trace___a_ilen_read_upto16_at <-
    (trace___a_ilen_read_upto16_at ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 16) ? lEN : 16)) /\
      (((lEN < 16) ? lEN : 16) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 16) ? lEN : 16))) /\
      (((offset + dELTA) + ((lEN < 16) ? lEN : 16)) <= 18446744073709551615)) /\
     ((((((BArrayS.is_init b_buf (offset + dELTA) ((lEN < 16) ? lEN : 16)) /\
         (0 <= dELTA)) /\
        (0 <= offset)) /\
       (((offset + dELTA) + ((lEN < 16) ? lEN : 16)) <= size)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256)))))))))]);
    trace___a_ilen_read_upto16_at <-
    (trace___a_ilen_read_upto16_at ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 16) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (set0_128);
    } else {
      aT16 <- (aT - cUR);
      if ((16 <= lEN)) {
        trace___a_ilen_read_upto16_at <-
        (trace___a_ilen_read_upto16_at ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___a_ilen_read_upto16_at <-
        (trace___a_ilen_read_upto16_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___a_ilen_read_upto16_at <-
        (trace___a_ilen_read_upto16_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 16) <= size)))]);
        trace___a_ilen_read_upto16_at <-
        (trace___a_ilen_read_upto16_at ++
        [(Assert, (BArrayS.is_init b_buf (offset + dELTA) 16))]);
        w <- (BArrayS.get128d buf (offset + dELTA));
        param_0 <- w;
        param <- aT16;
        (result, tmp__trace) <@ __SHLDQ (param_0, param);
        trace___a_ilen_read_upto16_at <-
        (trace___a_ilen_read_upto16_at ++ tmp__trace);
        w <- result;
        dELTA <- (dELTA + (16 - aT16));
        lEN <- (lEN - (16 - aT16));
        aT16 <- 16;
      } else {
        if ((8 <= aT16)) {
          w <- (set0_128);
          b_param <- b_buf;
          param_7 <- buf;
          param_6 <- offset;
          param_5 <- dELTA;
          param_4 <- lEN;
          param_3 <- tRAIL;
          param_2 <- 8;
          param_1 <- aT16;
          (result_4, result_3, result_2, result_1, result_0, tmp__trace) <@ 
          __a_ilen_read_upto8_at (param_7, b_param, param_6, param_5,
          param_4, param_3, param_2, param_1);
          trace___a_ilen_read_upto16_at <-
          (trace___a_ilen_read_upto16_at ++ tmp__trace);
          trace___a_ilen_read_upto16_at <-
          (trace___a_ilen_read_upto16_at ++
          [(Assert,
           (((param_2 <= param_1) /\ (param_1 < (param_2 + 8))) ? (((
                                                                    (
                                                                    result_4 =
                                                                    (
                                                                    param_5 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2)))))) /\
                                                                    (
                                                                    result_3 =
                                                                    (
                                                                    param_4 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))))))) /\
                                                                   (result_2 =
                                                                   ((8 <=
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4)) ? 
                                                                   param_3 : 0))) /\
                                                                  (result_1 =
                                                                  (param_2 +
                                                                  (((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4)) \/
                                                                    (
                                                                    param_3 =
                                                                    0)) ? 0 : 1)) <
                                                                   0) ? 0 : 
                                                                  (((
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4) <
                                                                    8) ? 
                                                                   ((
                                                                    param_1 -
                                                                    param_2) +
                                                                   param_4) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4)) \/
                                                                   (param_3 =
                                                                   0)) ? 0 : 1)))))) : 
           ((((result_4 = param_5) /\ (result_3 = param_4)) /\
            (result_2 = param_3)) /\
           (result_1 = param_1))))]);
          dELTA <- result_4;
          lEN <- result_3;
          tRAIL <- result_2;
          aT16 <- result_1;
          t64_1 <- result_0;
          w <- (VPINSR_2u64 w t64_1 (W8.of_int 1));
        } else {
          b_param_1 <- b_buf;
          param_14 <- buf;
          param_13 <- offset;
          param_12 <- dELTA;
          param_11 <- lEN;
          param_10 <- tRAIL;
          param_9 <- 0;
          param_8 <- aT16;
          (result_9, result_8, result_7, result_6, result_5, tmp__trace) <@ 
          __a_ilen_read_upto8_at (param_14, b_param_1, param_13, param_12,
          param_11, param_10, param_9, param_8);
          trace___a_ilen_read_upto16_at <-
          (trace___a_ilen_read_upto16_at ++ tmp__trace);
          trace___a_ilen_read_upto16_at <-
          (trace___a_ilen_read_upto16_at ++
          [(Assert,
           (((param_9 <= param_8) /\ (param_8 < (param_9 + 8))) ? (((
                                                                    (
                                                                    result_9 =
                                                                    (
                                                                    param_12 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_11 <
                                                                    (8 -
                                                                    (
                                                                    param_8 -
                                                                    param_9))) ? 
                                                                    param_11 : 
                                                                    (8 -
                                                                    (
                                                                    param_8 -
                                                                    param_9))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_11 <
                                                                    (8 -
                                                                    (
                                                                    param_8 -
                                                                    param_9))) ? 
                                                                    param_11 : 
                                                                    (8 -
                                                                    (
                                                                    param_8 -
                                                                    param_9)))))) /\
                                                                    (
                                                                    result_8 =
                                                                    (
                                                                    param_11 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_11 <
                                                                    (8 -
                                                                    (
                                                                    param_8 -
                                                                    param_9))) ? 
                                                                    param_11 : 
                                                                    (8 -
                                                                    (
                                                                    param_8 -
                                                                    param_9))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_11 <
                                                                    (8 -
                                                                    (
                                                                    param_8 -
                                                                    param_9))) ? 
                                                                    param_11 : 
                                                                    (8 -
                                                                    (
                                                                    param_8 -
                                                                    param_9))))))) /\
                                                                   (result_7 =
                                                                   ((8 <=
                                                                    (
                                                                    (
                                                                    param_8 -
                                                                    param_9) +
                                                                    param_11)) ? 
                                                                   param_10 : 0))) /\
                                                                  (result_6 =
                                                                  (param_9 +
                                                                  (((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_8 -
                                                                    param_9) +
                                                                    param_11) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_8 -
                                                                    param_9) +
                                                                    param_11) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_8 -
                                                                    param_9) +
                                                                    param_11)) \/
                                                                    (
                                                                    param_10 =
                                                                    0)) ? 0 : 1)) <
                                                                   0) ? 0 : 
                                                                  (((
                                                                    (
                                                                    (
                                                                    param_8 -
                                                                    param_9) +
                                                                    param_11) <
                                                                    8) ? 
                                                                   ((
                                                                    param_8 -
                                                                    param_9) +
                                                                   param_11) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_8 -
                                                                    param_9) +
                                                                    param_11)) \/
                                                                   (param_10 =
                                                                   0)) ? 0 : 1)))))) : 
           ((((result_9 = param_12) /\ (result_8 = param_11)) /\
            (result_7 = param_10)) /\
           (result_6 = param_8))))]);
          dELTA <- result_9;
          lEN <- result_8;
          tRAIL <- result_7;
          aT16 <- result_6;
          t64_0 <- result_5;
          w <- (zeroextu128 t64_0);
          b_param_0 <- b_buf;
          param_21 <- buf;
          param_20 <- offset;
          param_19 <- dELTA;
          param_18 <- lEN;
          param_17 <- tRAIL;
          param_16 <- 8;
          param_15 <- aT16;
          (result_14, result_13, result_12, result_11, result_10, tmp__trace) <@ 
          __a_ilen_read_upto8_at (param_21, b_param_0, param_20, param_19,
          param_18, param_17, param_16, param_15);
          trace___a_ilen_read_upto16_at <-
          (trace___a_ilen_read_upto16_at ++ tmp__trace);
          trace___a_ilen_read_upto16_at <-
          (trace___a_ilen_read_upto16_at ++
          [(Assert,
           (((param_16 <= param_15) /\ (param_15 < (param_16 + 8))) ? 
           ((((result_14 =
              (param_19 +
              ((((param_18 < (8 - (param_15 - param_16))) ? param_18 : 
                (8 - (param_15 - param_16))) <
               0) ? 0 : ((param_18 < (8 - (param_15 - param_16))) ? param_18 : 
                        (8 - (param_15 - param_16)))))) /\
             (result_13 =
             (param_18 -
             ((((param_18 < (8 - (param_15 - param_16))) ? param_18 : 
               (8 - (param_15 - param_16))) <
              0) ? 0 : ((param_18 < (8 - (param_15 - param_16))) ? param_18 : 
                       (8 - (param_15 - param_16))))))) /\
            (result_12 =
            ((8 <= ((param_15 - param_16) + param_18)) ? param_17 : 0))) /\
           (result_11 =
           (param_16 +
           (((((((param_15 - param_16) + param_18) < 8) ? ((param_15 -
                                                           param_16) +
                                                          param_18) : 8) +
             (((8 <= ((param_15 - param_16) + param_18)) \/ (param_17 = 0)) ? 0 : 1)) <
            0) ? 0 : (((((param_15 - param_16) + param_18) < 8) ? ((param_15 -
                                                                   param_16) +
                                                                  param_18) : 8) +
                     (((8 <= ((param_15 - param_16) + param_18)) \/
                      (param_17 = 0)) ? 0 : 1)))))) : ((((result_14 =
                                                         param_19) /\
                                                        (result_13 =
                                                        param_18)) /\
                                                       (result_12 = param_17)) /\
                                                      (result_11 = param_15))))]);
          dELTA <- result_14;
          lEN <- result_13;
          tRAIL <- result_12;
          aT16 <- result_11;
          t64_1 <- result_10;
          w <- (VPINSR_2u64 w t64_1 (W8.of_int 1));
        }
      }
      aT <- (cUR + aT16);
    }
    return (dELTA, lEN, tRAIL, aT, w, trace___a_ilen_read_upto16_at);
  }
  proc __a_ilen_read_upto32_at (buf:BArrayS.t, b_buf:BArrayS.t,
                                offset:int, dELTA:int, lEN:int, tRAIL:int,
                                cUR:int, aT:int) : int * int * int * int *
                                                   W256.t * trace = {
    var w:W256.t;
    var aT32:int;
    var t128_0:W128.t;
    var t128_1:W128.t;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:BArrayS.t;
    var result:W128.t;
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
    var param_12:BArrayS.t;
    var result_4:W128.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var param_16:int;
    var param_17:int;
    var param_18:int;
    var param_19:BArrayS.t;
    var result_9:W128.t;
    var result_10:int;
    var result_11:int;
    var result_12:int;
    var result_13:int;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_param_1:BArrayS.t;
    var trace___a_ilen_read_upto32_at:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    param_5 <- witness;
    param_12 <- witness;
    param_19 <- witness;
    trace___a_ilen_read_upto32_at <- [];
    trace___a_ilen_read_upto32_at <-
    (trace___a_ilen_read_upto32_at ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 32) ? lEN : 32)) /\
      (((lEN < 32) ? lEN : 32) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 32) ? lEN : 32))) /\
      (((offset + dELTA) + ((lEN < 32) ? lEN : 32)) <= 18446744073709551615)) /\
     ((((((BArrayS.is_init b_buf (offset + dELTA) ((lEN < 32) ? lEN : 32)) /\
         (0 <= dELTA)) /\
        (0 <= offset)) /\
       (((offset + dELTA) + ((lEN < 32) ? lEN : 32)) <= size)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256)))))))))]);
    trace___a_ilen_read_upto32_at <-
    (trace___a_ilen_read_upto32_at ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 32) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (set0_256);
    } else {
      aT32 <- (aT - cUR);
      if (((aT32 = 0) /\ (32 <= lEN))) {
        trace___a_ilen_read_upto32_at <-
        (trace___a_ilen_read_upto32_at ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___a_ilen_read_upto32_at <-
        (trace___a_ilen_read_upto32_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___a_ilen_read_upto32_at <-
        (trace___a_ilen_read_upto32_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 32) <= size)))]);
        trace___a_ilen_read_upto32_at <-
        (trace___a_ilen_read_upto32_at ++
        [(Assert, (BArrayS.is_init b_buf (offset + dELTA) 32))]);
        w <- (BArrayS.get256d buf (offset + dELTA));
        aT32 <- (aT32 + 32);
        dELTA <- (dELTA + 32);
        lEN <- (lEN - 32);
      } else {
        if ((16 <= aT32)) {
          w <- (set0_256);
          b_param <- b_buf;
          param_5 <- buf;
          param_4 <- offset;
          param_3 <- dELTA;
          param_2 <- lEN;
          param_1 <- tRAIL;
          param_0 <- 16;
          param <- aT32;
          (result_3, result_2, result_1, result_0, result, tmp__trace) <@ 
          __a_ilen_read_upto16_at (param_5, b_param, param_4, param_3,
          param_2, param_1, param_0, param);
          trace___a_ilen_read_upto32_at <-
          (trace___a_ilen_read_upto32_at ++ tmp__trace);
          trace___a_ilen_read_upto32_at <-
          (trace___a_ilen_read_upto32_at ++
          [(Assert,
           (((param_0 <= param) /\ (param < (param_0 + 16))) ? ((((result_3 =
                                                                  (param_3 +
                                                                  (((
                                                                    (
                                                                    param_2 <
                                                                    (16 -
                                                                    (
                                                                    param -
                                                                    param_0))) ? 
                                                                    param_2 : 
                                                                    (16 -
                                                                    (
                                                                    param -
                                                                    param_0))) <
                                                                   0) ? 0 : 
                                                                  ((param_2 <
                                                                   (16 -
                                                                   (param -
                                                                   param_0))) ? 
                                                                  param_2 : 
                                                                  (16 -
                                                                  (param -
                                                                  param_0)))))) /\
                                                                 (result_2 =
                                                                 (param_2 -
                                                                 ((((
                                                                    param_2 <
                                                                    (16 -
                                                                    (
                                                                    param -
                                                                    param_0))) ? 
                                                                   param_2 : 
                                                                   (16 -
                                                                   (param -
                                                                   param_0))) <
                                                                  0) ? 0 : 
                                                                 ((param_2 <
                                                                  (16 -
                                                                  (param -
                                                                  param_0))) ? 
                                                                 param_2 : 
                                                                 (16 -
                                                                 (param -
                                                                 param_0))))))) /\
                                                                (result_1 =
                                                                ((16 <=
                                                                 ((param -
                                                                  param_0) +
                                                                 param_2)) ? 
                                                                param_1 : 0))) /\
                                                               (result_0 =
                                                               (param_0 +
                                                               ((((((
                                                                    (
                                                                    param -
                                                                    param_0) +
                                                                    param_2) <
                                                                   16) ? 
                                                                  ((param -
                                                                   param_0) +
                                                                  param_2) : 16) +
                                                                 (((16 <=
                                                                   ((
                                                                    param -
                                                                    param_0) +
                                                                   param_2)) \/
                                                                  (param_1 =
                                                                  0)) ? 0 : 1)) <
                                                                0) ? 0 : 
                                                               (((((param -
                                                                   param_0) +
                                                                  param_2) <
                                                                 16) ? 
                                                                ((param -
                                                                 param_0) +
                                                                param_2) : 16) +
                                                               (((16 <=
                                                                 ((param -
                                                                  param_0) +
                                                                 param_2)) \/
                                                                (param_1 = 0)) ? 0 : 1)))))) : 
           ((((result_3 = param_3) /\ (result_2 = param_2)) /\
            (result_1 = param_1)) /\
           (result_0 = param))))]);
          dELTA <- result_3;
          lEN <- result_2;
          tRAIL <- result_1;
          aT32 <- result_0;
          t128_1 <- result;
          w <- (VINSERTI128 w t128_1 (W8.of_int 1));
        } else {
          b_param_1 <- b_buf;
          param_12 <- buf;
          param_11 <- offset;
          param_10 <- dELTA;
          param_9 <- lEN;
          param_8 <- tRAIL;
          param_7 <- 0;
          param_6 <- aT32;
          (result_8, result_7, result_6, result_5, result_4, tmp__trace) <@ 
          __a_ilen_read_upto16_at (param_12, b_param_1, param_11, param_10,
          param_9, param_8, param_7, param_6);
          trace___a_ilen_read_upto32_at <-
          (trace___a_ilen_read_upto32_at ++ tmp__trace);
          trace___a_ilen_read_upto32_at <-
          (trace___a_ilen_read_upto32_at ++
          [(Assert,
           (((param_7 <= param_6) /\ (param_6 < (param_7 + 16))) ? ((
                                                                    (
                                                                    (
                                                                    result_8 =
                                                                    (
                                                                    param_10 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_9 <
                                                                    (16 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                    param_9 : 
                                                                    (16 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_9 <
                                                                    (16 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                    param_9 : 
                                                                    (16 -
                                                                    (
                                                                    param_6 -
                                                                    param_7)))))) /\
                                                                    (
                                                                    result_7 =
                                                                    (
                                                                    param_9 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_9 <
                                                                    (16 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                    param_9 : 
                                                                    (16 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_9 <
                                                                    (16 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                    param_9 : 
                                                                    (16 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))))))) /\
                                                                    (
                                                                    result_6 =
                                                                    (
                                                                    (16 <=
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9)) ? 
                                                                    param_8 : 0))) /\
                                                                   (result_5 =
                                                                   (param_7 +
                                                                   ((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9) <
                                                                    16) ? 
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9) : 16) +
                                                                    (
                                                                    (
                                                                    (16 <=
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9)) \/
                                                                    (
                                                                    param_8 =
                                                                    0)) ? 0 : 1)) <
                                                                    0) ? 0 : 
                                                                   ((
                                                                    (
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9) <
                                                                    16) ? 
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9) : 16) +
                                                                   ((
                                                                    (16 <=
                                                                    (
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9)) \/
                                                                    (
                                                                    param_8 =
                                                                    0)) ? 0 : 1)))))) : 
           ((((result_8 = param_10) /\ (result_7 = param_9)) /\
            (result_6 = param_8)) /\
           (result_5 = param_6))))]);
          dELTA <- result_8;
          lEN <- result_7;
          tRAIL <- result_6;
          aT32 <- result_5;
          t128_0 <- result_4;
          b_param_0 <- b_buf;
          param_19 <- buf;
          param_18 <- offset;
          param_17 <- dELTA;
          param_16 <- lEN;
          param_15 <- tRAIL;
          param_14 <- 16;
          param_13 <- aT32;
          (result_13, result_12, result_11, result_10, result_9, tmp__trace) <@ 
          __a_ilen_read_upto16_at (param_19, b_param_0, param_18, param_17,
          param_16, param_15, param_14, param_13);
          trace___a_ilen_read_upto32_at <-
          (trace___a_ilen_read_upto32_at ++ tmp__trace);
          trace___a_ilen_read_upto32_at <-
          (trace___a_ilen_read_upto32_at ++
          [(Assert,
           (((param_14 <= param_13) /\ (param_13 < (param_14 + 16))) ? 
           ((((result_13 =
              (param_17 +
              ((((param_16 < (16 - (param_13 - param_14))) ? param_16 : 
                (16 - (param_13 - param_14))) <
               0) ? 0 : ((param_16 < (16 - (param_13 - param_14))) ? 
                        param_16 : (16 - (param_13 - param_14)))))) /\
             (result_12 =
             (param_16 -
             ((((param_16 < (16 - (param_13 - param_14))) ? param_16 : 
               (16 - (param_13 - param_14))) <
              0) ? 0 : ((param_16 < (16 - (param_13 - param_14))) ? param_16 : 
                       (16 - (param_13 - param_14))))))) /\
            (result_11 =
            ((16 <= ((param_13 - param_14) + param_16)) ? param_15 : 0))) /\
           (result_10 =
           (param_14 +
           (((((((param_13 - param_14) + param_16) < 16) ? ((param_13 -
                                                            param_14) +
                                                           param_16) : 16) +
             (((16 <= ((param_13 - param_14) + param_16)) \/ (param_15 = 0)) ? 0 : 1)) <
            0) ? 0 : (((((param_13 - param_14) + param_16) < 16) ? ((
                                                                    param_13 -
                                                                    param_14) +
                                                                   param_16) : 16) +
                     (((16 <= ((param_13 - param_14) + param_16)) \/
                      (param_15 = 0)) ? 0 : 1)))))) : ((((result_13 =
                                                         param_17) /\
                                                        (result_12 =
                                                        param_16)) /\
                                                       (result_11 = param_15)) /\
                                                      (result_10 = param_13))))]);
          dELTA <- result_13;
          lEN <- result_12;
          tRAIL <- result_11;
          aT32 <- result_10;
          t128_1 <- result_9;
          w <-
          (W256.of_int
          (((W128.to_uint t128_0) %% (2 ^ 128)) +
          ((2 ^ 128) * (W128.to_uint t128_1))));
        }
      }
      aT <- (cUR + aT32);
    }
    return (dELTA, lEN, tRAIL, aT, w, trace___a_ilen_read_upto32_at);
  }
  proc __a_ilen_read_bcast_upto8_at (buf:BArrayS.t, b_buf:BArrayS.t,
                                     offset:int, dELTA:int, lEN:int,
                                     tRAIL:int, cUR:int, aT:int) : int *
                                                                   int *
                                                                   int *
                                                                   int *
                                                                   W256.t *
                                                                   trace = {
    var w256:W256.t;
    var aT8:int;
    var w:W64.t;
    var t128:W128.t;
    var param:int;
    var param_0:W256.t;
    var result:W256.t;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:int;
    var param_6:int;
    var param_7:BArrayS.t;
    var result_0:W64.t;
    var result_1:int;
    var result_2:int;
    var result_3:int;
    var result_4:int;
    var param_8:int;
    var param_9:W256.t;
    var result_5:W256.t;
    var b_param:BArrayS.t;
    var trace___a_ilen_read_bcast_upto8_at:trace;
    b_param <- witness;
    param_7 <- witness;
    trace___a_ilen_read_bcast_upto8_at <- [];
    trace___a_ilen_read_bcast_upto8_at <-
    (trace___a_ilen_read_bcast_upto8_at ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     ((((((BArrayS.is_init b_buf (offset + dELTA) ((lEN < 8) ? lEN : 8)) /\
         (0 <= dELTA)) /\
        (0 <= offset)) /\
       (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= size)) /\
      (0 <= tRAIL)) /\
     (tRAIL < 256)))))))))]);
    trace___a_ilen_read_bcast_upto8_at <-
    (trace___a_ilen_read_bcast_upto8_at ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((((aT < cUR) \/ ((cUR + 8) <= aT)) \/ ((lEN = 0) /\ (tRAIL = 0)))) {
      w256 <- (set0_256);
    } else {
      if ((8 <= lEN)) {
        aT8 <- (aT - cUR);
        trace___a_ilen_read_bcast_upto8_at <-
        (trace___a_ilen_read_bcast_upto8_at ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___a_ilen_read_bcast_upto8_at <-
        (trace___a_ilen_read_bcast_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___a_ilen_read_bcast_upto8_at <-
        (trace___a_ilen_read_bcast_upto8_at ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\ (((offset + dELTA) + 8) <= size)))]);
        trace___a_ilen_read_bcast_upto8_at <-
        (trace___a_ilen_read_bcast_upto8_at ++
        [(Assert, (BArrayS.is_init b_buf (offset + dELTA) 8))]);
        w256 <- (VPBROADCAST_4u64 (BArrayS.get64d buf (offset + dELTA)));
        param_0 <- w256;
        param <- aT8;
        (result, tmp__trace) <@ __SHLQ_256 (param_0, param);
        trace___a_ilen_read_bcast_upto8_at <-
        (trace___a_ilen_read_bcast_upto8_at ++ tmp__trace);
        w256 <- result;
        dELTA <- (dELTA + (8 - aT8));
        lEN <- (lEN - (8 - aT8));
        aT <- (cUR + 8);
      } else {
        aT8 <- (aT - cUR);
        b_param <- b_buf;
        param_7 <- buf;
        param_6 <- offset;
        param_5 <- dELTA;
        param_4 <- lEN;
        param_3 <- tRAIL;
        param_2 <- cUR;
        param_1 <- aT;
        (result_4, result_3, result_2, result_1, result_0, tmp__trace) <@ 
        __a_ilen_read_upto8_at (param_7, b_param, param_6, param_5, param_4,
        param_3, param_2, param_1);
        trace___a_ilen_read_bcast_upto8_at <-
        (trace___a_ilen_read_bcast_upto8_at ++ tmp__trace);
        trace___a_ilen_read_bcast_upto8_at <-
        (trace___a_ilen_read_bcast_upto8_at ++
        [(Assert,
         (((param_2 <= param_1) /\ (param_1 < (param_2 + 8))) ? ((((result_4 =
                                                                   (param_5 +
                                                                   ((
                                                                    (
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) <
                                                                    0) ? 0 : 
                                                                   ((
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                   param_4 : 
                                                                   (8 -
                                                                   (param_1 -
                                                                   param_2)))))) /\
                                                                  (result_3 =
                                                                  (param_4 -
                                                                  (((
                                                                    (
                                                                    param_4 <
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) ? 
                                                                    param_4 : 
                                                                    (8 -
                                                                    (
                                                                    param_1 -
                                                                    param_2))) <
                                                                   0) ? 0 : 
                                                                  ((param_4 <
                                                                   (8 -
                                                                   (param_1 -
                                                                   param_2))) ? 
                                                                  param_4 : 
                                                                  (8 -
                                                                  (param_1 -
                                                                  param_2))))))) /\
                                                                 (result_2 =
                                                                 ((8 <=
                                                                  ((param_1 -
                                                                   param_2) +
                                                                  param_4)) ? 
                                                                 param_3 : 0))) /\
                                                                (result_1 =
                                                                (param_2 +
                                                                (((((
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4) <
                                                                    8) ? 
                                                                   ((
                                                                    param_1 -
                                                                    param_2) +
                                                                   param_4) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_1 -
                                                                    param_2) +
                                                                    param_4)) \/
                                                                   (param_3 =
                                                                   0)) ? 0 : 1)) <
                                                                 0) ? 0 : 
                                                                (((((
                                                                    param_1 -
                                                                    param_2) +
                                                                   param_4) <
                                                                  8) ? 
                                                                 ((param_1 -
                                                                  param_2) +
                                                                 param_4) : 8) +
                                                                (((8 <=
                                                                  ((param_1 -
                                                                   param_2) +
                                                                  param_4)) \/
                                                                 (param_3 =
                                                                 0)) ? 0 : 1)))))) : 
         ((((result_4 = param_5) /\ (result_3 = param_4)) /\
          (result_2 = param_3)) /\
         (result_1 = param_1))))]);
        dELTA <- result_4;
        lEN <- result_3;
        tRAIL <- result_2;
        aT <- result_1;
        w <- result_0;
        t128 <- (zeroextu128 w);
        w256 <- (VPBROADCAST_4u64 (truncateu64 t128));
        param_9 <- w256;
        param_8 <- aT8;
        (result_5, tmp__trace) <@ __SHLQ_256 (param_9, param_8);
        trace___a_ilen_read_bcast_upto8_at <-
        (trace___a_ilen_read_bcast_upto8_at ++ tmp__trace);
        w256 <- result_5;
      }
    }
    return (dELTA, lEN, tRAIL, aT, w256, trace___a_ilen_read_bcast_upto8_at);
  }
  proc __a_ilen_write_upto8 (buf:BArrayS.t, b_buf:BArrayS.t, offset:int,
                             dELTA:int, lEN:int, w:W64.t) : BArrayS.t *
                                                            BArrayS.t *
                                                            int * int * trace = {
    var trace___a_ilen_write_upto8:trace;
    trace___a_ilen_write_upto8 <- [];
    trace___a_ilen_write_upto8 <-
    (trace___a_ilen_write_upto8 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 8) ? lEN : 8)) /\
      (((lEN < 8) ? lEN : 8) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 8) ? lEN : 8))) /\
      (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= 18446744073709551615)) /\
     (((BArrayS.is_init b_buf 0 (offset + dELTA)) /\ (0 <= dELTA)) /\
     (((offset + dELTA) + ((lEN < 8) ? lEN : 8)) <= size)))))))))]);
    trace___a_ilen_write_upto8 <-
    (trace___a_ilen_write_upto8 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        trace___a_ilen_write_upto8 <-
        (trace___a_ilen_write_upto8 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___a_ilen_write_upto8 <-
        (trace___a_ilen_write_upto8 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___a_ilen_write_upto8 <-
        (trace___a_ilen_write_upto8 ++
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
          trace___a_ilen_write_upto8 <-
          (trace___a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___a_ilen_write_upto8 <-
          (trace___a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___a_ilen_write_upto8 <-
          (trace___a_ilen_write_upto8 ++
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
          trace___a_ilen_write_upto8 <-
          (trace___a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___a_ilen_write_upto8 <-
          (trace___a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___a_ilen_write_upto8 <-
          (trace___a_ilen_write_upto8 ++
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
          trace___a_ilen_write_upto8 <-
          (trace___a_ilen_write_upto8 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___a_ilen_write_upto8 <-
          (trace___a_ilen_write_upto8 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___a_ilen_write_upto8 <-
          (trace___a_ilen_write_upto8 ++
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
    return (buf, b_buf, dELTA, lEN, trace___a_ilen_write_upto8);
  }
  proc __a_ilen_write_upto16 (buf:BArrayS.t, b_buf:BArrayS.t, offset:int,
                              dELTA:int, lEN:int, w:W128.t) : BArrayS.t *
                                                              BArrayS.t *
                                                              int * int *
                                                              trace = {
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
    var trace___a_ilen_write_upto16:trace;
    b_param <- witness;
    b_result <- witness;
    param_3 <- witness;
    result_1 <- witness;
    trace___a_ilen_write_upto16 <- [];
    trace___a_ilen_write_upto16 <-
    (trace___a_ilen_write_upto16 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 16) ? lEN : 16)) /\
      (((lEN < 16) ? lEN : 16) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 16) ? lEN : 16))) /\
      (((offset + dELTA) + ((lEN < 16) ? lEN : 16)) <= 18446744073709551615)) /\
     (((BArrayS.is_init b_buf 0 (offset + dELTA)) /\ (0 <= dELTA)) /\
     (((offset + dELTA) + ((lEN < 16) ? lEN : 16)) <= size)))))))))]);
    trace___a_ilen_write_upto16 <-
    (trace___a_ilen_write_upto16 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((16 <= lEN)) {
        trace___a_ilen_write_upto16 <-
        (trace___a_ilen_write_upto16 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___a_ilen_write_upto16 <-
        (trace___a_ilen_write_upto16 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___a_ilen_write_upto16 <-
        (trace___a_ilen_write_upto16 ++
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
          trace___a_ilen_write_upto16 <-
          (trace___a_ilen_write_upto16 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___a_ilen_write_upto16 <-
          (trace___a_ilen_write_upto16 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___a_ilen_write_upto16 <-
          (trace___a_ilen_write_upto16 ++
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
        (result_1, b_result, result_0, result, tmp__trace) <@ __a_ilen_write_upto8 (
        param_3, b_param, param_2, param_1, param_0, param);
        trace___a_ilen_write_upto16 <-
        (trace___a_ilen_write_upto16 ++ tmp__trace);
        trace___a_ilen_write_upto16 <-
        (trace___a_ilen_write_upto16 ++
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
          ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                     param_0 : 8))))) /\
         (BArrayS.is_init b_result 0
         ((param_2 + param_1) +
         ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? 
                                                    param_0 : 8)))
         )))))))]);
        b_buf <- b_result;
        buf <- result_1;
        dELTA <- result_0;
        lEN <- result;
      }
    } else {
      
    }
    return (buf, b_buf, dELTA, lEN, trace___a_ilen_write_upto16);
  }
  proc __a_ilen_write_upto32 (buf:BArrayS.t, b_buf:BArrayS.t, offset:int,
                              dELTA:int, lEN:int, w:W256.t) : BArrayS.t *
                                                              BArrayS.t *
                                                              int * int *
                                                              trace = {
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
    var trace___a_ilen_write_upto32:trace;
    b_param <- witness;
    b_result <- witness;
    param_3 <- witness;
    result_1 <- witness;
    trace___a_ilen_write_upto32 <- [];
    trace___a_ilen_write_upto32 <-
    (trace___a_ilen_write_upto32 ++
    [(Assert,
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= dELTA) /\ (dELTA <= 18446744073709551615)) /\
     (((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)) /\
     (((0 <= ((lEN < 32) ? lEN : 32)) /\
      (((lEN < 32) ? lEN : 32) <= 18446744073709551615)) /\
     (((0 <= ((offset + dELTA) + ((lEN < 32) ? lEN : 32))) /\
      (((offset + dELTA) + ((lEN < 32) ? lEN : 32)) <= 18446744073709551615)) /\
     ((((BArrayS.is_init b_buf 0 (offset + dELTA)) /\ (0 <= dELTA)) /\
      (0 <= offset)) /\
     (((offset + dELTA) + ((lEN < 32) ? lEN : 32)) <= size)))))))))]);
    trace___a_ilen_write_upto32 <-
    (trace___a_ilen_write_upto32 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    if ((0 < lEN)) {
      if ((32 <= lEN)) {
        trace___a_ilen_write_upto32 <-
        (trace___a_ilen_write_upto32 ++
        [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
        trace___a_ilen_write_upto32 <-
        (trace___a_ilen_write_upto32 ++
        [(Assert,
         ((0 <= (offset + dELTA)) /\
         ((offset + dELTA) <= 18446744073709551615)))]);
        trace___a_ilen_write_upto32 <-
        (trace___a_ilen_write_upto32 ++
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
          trace___a_ilen_write_upto32 <-
          (trace___a_ilen_write_upto32 ++
          [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
          trace___a_ilen_write_upto32 <-
          (trace___a_ilen_write_upto32 ++
          [(Assert,
           ((0 <= (offset + dELTA)) /\
           ((offset + dELTA) <= 18446744073709551615)))]);
          trace___a_ilen_write_upto32 <-
          (trace___a_ilen_write_upto32 ++
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
        (result_1, b_result, result_0, result, tmp__trace) <@ __a_ilen_write_upto16 (
        param_3, b_param, param_2, param_1, param_0, param);
        trace___a_ilen_write_upto32 <-
        (trace___a_ilen_write_upto32 ++ tmp__trace);
        trace___a_ilen_write_upto32 <-
        (trace___a_ilen_write_upto32 ++
        [(Assert,
         (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
         (((0 <= (param_2 + param_1)) /\
          ((param_2 + param_1) <= 18446744073709551615)) /\
         (((0 <=
           ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                        param_0 : 16))) /\
          (((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                        param_0 : 16)) <=
          18446744073709551615)) /\
         (((0 <=
           ((param_2 + param_1) +
           ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                        param_0 : 16)))) /\
          (((param_2 + param_1) +
           ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                        param_0 : 16))) <=
          18446744073709551615)) /\
         (((result_0 =
           (param_1 +
           ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                        param_0 : 16)))) /\
          (result =
          (param_0 -
          ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                       param_0 : 16))))) /\
         (BArrayS.is_init b_result 0
         ((param_2 + param_1) +
         ((((param_0 < 16) ? param_0 : 16) < 0) ? 0 : ((param_0 < 16) ? 
                                                      param_0 : 16)))
         )))))))]);
        b_buf <- b_result;
        buf <- result_1;
        dELTA <- result_0;
        lEN <- result;
      }
    } else {
      
    }
    return (buf, b_buf, dELTA, lEN, trace___a_ilen_write_upto32);
  }
  proc __a_rlen_read_upto8 (a:BArrayS.t, b_a:BArrayS.t, off:int, len:int) : 
  int * W64.t * trace = {
    var w:W64.t;
    var zf:bool;
    var sh:W8.t;
    var x:W64.t;
    var  _0:bool;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    var  _6:bool;
    var  _7:bool;
    var  _8:bool;
    var  _9:bool;
    var  _10:bool;
    var  _11:bool;
    var trace___a_rlen_read_upto8:trace;
    trace___a_rlen_read_upto8 <- [];
    trace___a_rlen_read_upto8 <-
    (trace___a_rlen_read_upto8 ++
    [(Assert,
     (((0 <= ((len < 8) ? len : 8)) /\
      (((len < 8) ? len : 8) <= 18446744073709551615)) /\
     (((0 <= (off + ((len < 8) ? len : 8))) /\
      ((off + ((len < 8) ? len : 8)) <= 18446744073709551615)) /\
     (((BArrayS.is_init b_a off ((len < 8) ? len : 8)) /\ (0 <= off)) /\
     ((off + ((len < 8) ? len : 8)) <= size)))))]);
    trace___a_rlen_read_upto8 <-
    (trace___a_rlen_read_upto8 ++
    [(Assert, ((0 <= off) /\ (off <= 18446744073709551615)))]);
    trace___a_rlen_read_upto8 <-
    (trace___a_rlen_read_upto8 ++
    [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
    if ((8 <= len)) {
      trace___a_rlen_read_upto8 <-
      (trace___a_rlen_read_upto8 ++
      [(Assert, ((0 <= off) /\ ((off + 8) <= size)))]);
      trace___a_rlen_read_upto8 <-
      (trace___a_rlen_read_upto8 ++
      [(Assert, (BArrayS.is_init b_a off 8))]);
      w <- (BArrayS.get64d a off);
      trace___a_rlen_read_upto8 <-
      (trace___a_rlen_read_upto8 ++
      [(Assert, ((0 <= (off + 8)) /\ ((off + 8) <= 18446744073709551615)))]);
      off <- (off + 8);
    } else {
      trace___a_rlen_read_upto8 <-
      (trace___a_rlen_read_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _0,  _1,  _2,  _3, zf) <- (TEST_64 (W64.of_int len) (W64.of_int 4));
      if ((! zf)) {
        trace___a_rlen_read_upto8 <-
        (trace___a_rlen_read_upto8 ++
        [(Assert, ((0 <= off) /\ ((off + 4) <= size)))]);
        trace___a_rlen_read_upto8 <-
        (trace___a_rlen_read_upto8 ++
        [(Assert, (BArrayS.is_init b_a off 4))]);
        w <- (zeroextu64 (BArrayS.get32d a off));
        trace___a_rlen_read_upto8 <-
        (trace___a_rlen_read_upto8 ++
        [(Assert, ((0 <= (off + 4)) /\ ((off + 4) <= 18446744073709551615)))]);
        off <- (off + 4);
        sh <- (W8.of_int 32);
      } else {
        w <- (W64.of_int 0);
        sh <- (W8.of_int 0);
      }
      trace___a_rlen_read_upto8 <-
      (trace___a_rlen_read_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _4,  _5,  _6,  _7, zf) <- (TEST_64 (W64.of_int len) (W64.of_int 2));
      if ((! zf)) {
        trace___a_rlen_read_upto8 <-
        (trace___a_rlen_read_upto8 ++
        [(Assert, ((0 <= off) /\ ((off + 2) <= size)))]);
        trace___a_rlen_read_upto8 <-
        (trace___a_rlen_read_upto8 ++
        [(Assert, (BArrayS.is_init b_a off 2))]);
        x <- (zeroextu64 (BArrayS.get16d a off));
        x <- (x `<<` (sh `&` (W8.of_int 63)));
        w <- (w + x);
        trace___a_rlen_read_upto8 <-
        (trace___a_rlen_read_upto8 ++
        [(Assert, ((0 <= (off + 2)) /\ ((off + 2) <= 18446744073709551615)))]);
        off <- (off + 2);
        sh <- (sh + (W8.of_int 16));
      } else {
        
      }
      trace___a_rlen_read_upto8 <-
      (trace___a_rlen_read_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _8,  _9,  _10,  _11, zf) <-
      (TEST_64 (W64.of_int len) (W64.of_int 1));
      if ((! zf)) {
        trace___a_rlen_read_upto8 <-
        (trace___a_rlen_read_upto8 ++
        [(Assert, ((0 <= off) /\ ((off + 1) <= size)))]);
        trace___a_rlen_read_upto8 <-
        (trace___a_rlen_read_upto8 ++
        [(Assert, (BArrayS.is_init b_a off 1))]);
        x <- (zeroextu64 (BArrayS.get8d a off));
        x <- (x `<<` (sh `&` (W8.of_int 63)));
        w <- (w + x);
        trace___a_rlen_read_upto8 <-
        (trace___a_rlen_read_upto8 ++
        [(Assert, ((0 <= (off + 1)) /\ ((off + 1) <= 18446744073709551615)))]);
        off <- (off + 1);
      } else {
        
      }
    }
    return (off, w, trace___a_rlen_read_upto8);
  }
  proc __a_rlen_read_upto8_noninline (a:BArrayS.t, b_a:BArrayS.t,
                                      off_:int, len_:int) : int * W64.t *
                                                            trace = {
    var w:W64.t;
    var zf:bool;
    var sh:W8.t;
    var x:W64.t;
    var off:int;
    var len:int;
    var  _0:bool;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    var  _6:bool;
    var  _7:bool;
    var  _8:bool;
    var  _9:bool;
    var  _10:bool;
    var  _11:bool;
    var trace___a_rlen_read_upto8_noninline:trace;
    trace___a_rlen_read_upto8_noninline <- [];
    trace___a_rlen_read_upto8_noninline <-
    (trace___a_rlen_read_upto8_noninline ++
    [(Assert,
     (((0 <= ((len_ < 8) ? len_ : 8)) /\
      (((len_ < 8) ? len_ : 8) <= 18446744073709551615)) /\
     (((0 <= (off_ + ((len_ < 8) ? len_ : 8))) /\
      ((off_ + ((len_ < 8) ? len_ : 8)) <= 18446744073709551615)) /\
     (((BArrayS.is_init b_a off_ ((len_ < 8) ? len_ : 8)) /\ (0 <= off_)) /\
     ((off_ + ((len_ < 8) ? len_ : 8)) <= size)))))]);
    trace___a_rlen_read_upto8_noninline <-
    (trace___a_rlen_read_upto8_noninline ++
    [(Assert, ((0 <= off_) /\ (off_ <= 18446744073709551615)))]);
    trace___a_rlen_read_upto8_noninline <-
    (trace___a_rlen_read_upto8_noninline ++
    [(Assert, ((0 <= len_) /\ (len_ <= 18446744073709551615)))]);
    off <- off_;
    len <- len_;
    if ((8 <= len)) {
      trace___a_rlen_read_upto8_noninline <-
      (trace___a_rlen_read_upto8_noninline ++
      [(Assert, ((0 <= off) /\ ((off + 8) <= size)))]);
      trace___a_rlen_read_upto8_noninline <-
      (trace___a_rlen_read_upto8_noninline ++
      [(Assert, (BArrayS.is_init b_a off 8))]);
      w <- (BArrayS.get64d a off);
      trace___a_rlen_read_upto8_noninline <-
      (trace___a_rlen_read_upto8_noninline ++
      [(Assert, ((0 <= (off + 8)) /\ ((off + 8) <= 18446744073709551615)))]);
      off <- (off + 8);
    } else {
      trace___a_rlen_read_upto8_noninline <-
      (trace___a_rlen_read_upto8_noninline ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _0,  _1,  _2,  _3, zf) <- (TEST_64 (W64.of_int len) (W64.of_int 4));
      if ((! zf)) {
        trace___a_rlen_read_upto8_noninline <-
        (trace___a_rlen_read_upto8_noninline ++
        [(Assert, ((0 <= off) /\ ((off + 4) <= size)))]);
        trace___a_rlen_read_upto8_noninline <-
        (trace___a_rlen_read_upto8_noninline ++
        [(Assert, (BArrayS.is_init b_a off 4))]);
        w <- (zeroextu64 (BArrayS.get32d a off));
        trace___a_rlen_read_upto8_noninline <-
        (trace___a_rlen_read_upto8_noninline ++
        [(Assert, ((0 <= (off + 4)) /\ ((off + 4) <= 18446744073709551615)))]);
        off <- (off + 4);
        sh <- (W8.of_int 32);
      } else {
        w <- (W64.of_int 0);
        sh <- (W8.of_int 0);
      }
      trace___a_rlen_read_upto8_noninline <-
      (trace___a_rlen_read_upto8_noninline ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _4,  _5,  _6,  _7, zf) <- (TEST_64 (W64.of_int len) (W64.of_int 2));
      if ((! zf)) {
        trace___a_rlen_read_upto8_noninline <-
        (trace___a_rlen_read_upto8_noninline ++
        [(Assert, ((0 <= off) /\ ((off + 2) <= size)))]);
        trace___a_rlen_read_upto8_noninline <-
        (trace___a_rlen_read_upto8_noninline ++
        [(Assert, (BArrayS.is_init b_a off 2))]);
        x <- (zeroextu64 (BArrayS.get16d a off));
        x <- (x `<<` (sh `&` (W8.of_int 63)));
        w <- (w + x);
        trace___a_rlen_read_upto8_noninline <-
        (trace___a_rlen_read_upto8_noninline ++
        [(Assert, ((0 <= (off + 2)) /\ ((off + 2) <= 18446744073709551615)))]);
        off <- (off + 2);
        sh <- (sh + (W8.of_int 16));
      } else {
        
      }
      trace___a_rlen_read_upto8_noninline <-
      (trace___a_rlen_read_upto8_noninline ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _8,  _9,  _10,  _11, zf) <-
      (TEST_64 (W64.of_int len) (W64.of_int 1));
      if ((! zf)) {
        trace___a_rlen_read_upto8_noninline <-
        (trace___a_rlen_read_upto8_noninline ++
        [(Assert, ((0 <= off) /\ ((off + 1) <= size)))]);
        trace___a_rlen_read_upto8_noninline <-
        (trace___a_rlen_read_upto8_noninline ++
        [(Assert, (BArrayS.is_init b_a off 1))]);
        x <- (zeroextu64 (BArrayS.get8d a off));
        x <- (x `<<` (sh `&` (W8.of_int 63)));
        w <- (w + x);
        trace___a_rlen_read_upto8_noninline <-
        (trace___a_rlen_read_upto8_noninline ++
        [(Assert, ((0 <= (off + 1)) /\ ((off + 1) <= 18446744073709551615)))]);
        off <- (off + 1);
      } else {
        
      }
    }
    off_ <- off;
    return (off_, w, trace___a_rlen_read_upto8_noninline);
  }
  proc __a_rlen_write_upto8 (buf:BArrayS.t, b_buf:BArrayS.t, off:int,
                             data:W64.t, len:int) : BArrayS.t *
                                                    BArrayS.t * int * trace = {
    var zf:bool;
    var  _0:bool;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    var  _6:bool;
    var  _7:bool;
    var  _8:bool;
    var  _9:bool;
    var  _10:bool;
    var  _11:bool;
    var trace___a_rlen_write_upto8:trace;
    trace___a_rlen_write_upto8 <- [];
    trace___a_rlen_write_upto8 <-
    (trace___a_rlen_write_upto8 ++
    [(Assert,
     (((0 <= ((len < 8) ? len : 8)) /\
      (((len < 8) ? len : 8) <= 18446744073709551615)) /\
     (((0 <= (off + ((len < 8) ? len : 8))) /\
      ((off + ((len < 8) ? len : 8)) <= 18446744073709551615)) /\
     (((BArrayS.is_init b_buf 0 off) /\ (0 <= off)) /\
     ((off + ((len < 8) ? len : 8)) <= size)))))]);
    trace___a_rlen_write_upto8 <-
    (trace___a_rlen_write_upto8 ++
    [(Assert, ((0 <= off) /\ (off <= 18446744073709551615)))]);
    trace___a_rlen_write_upto8 <-
    (trace___a_rlen_write_upto8 ++
    [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
    if ((8 <= len)) {
      trace___a_rlen_write_upto8 <-
      (trace___a_rlen_write_upto8 ++
      [(Assert, ((0 <= off) /\ ((off + 8) <= size)))]);
      b_buf <-
      (BArrayS.set64d b_buf off (W64.of_int 18446744073709551615));
      buf <- (BArrayS.set64d buf off data);
      trace___a_rlen_write_upto8 <-
      (trace___a_rlen_write_upto8 ++
      [(Assert, ((0 <= (off + 8)) /\ ((off + 8) <= 18446744073709551615)))]);
      off <- (off + 8);
    } else {
      trace___a_rlen_write_upto8 <-
      (trace___a_rlen_write_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _0,  _1,  _2,  _3, zf) <- (TEST_64 (W64.of_int len) (W64.of_int 4));
      if ((! zf)) {
        trace___a_rlen_write_upto8 <-
        (trace___a_rlen_write_upto8 ++
        [(Assert, ((0 <= off) /\ ((off + 4) <= size)))]);
        b_buf <- (BArrayS.set32d b_buf off (W32.of_int 4294967295));
        buf <- (BArrayS.set32d buf off (truncateu32 data));
        trace___a_rlen_write_upto8 <-
        (trace___a_rlen_write_upto8 ++
        [(Assert, ((0 <= (off + 4)) /\ ((off + 4) <= 18446744073709551615)))]);
        off <- (off + 4);
        data <- (data `>>` (W8.of_int 32));
      } else {
        
      }
      trace___a_rlen_write_upto8 <-
      (trace___a_rlen_write_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _4,  _5,  _6,  _7, zf) <- (TEST_64 (W64.of_int len) (W64.of_int 2));
      if ((! zf)) {
        trace___a_rlen_write_upto8 <-
        (trace___a_rlen_write_upto8 ++
        [(Assert, ((0 <= off) /\ ((off + 2) <= size)))]);
        b_buf <- (BArrayS.set16d b_buf off (W16.of_int 65535));
        buf <- (BArrayS.set16d buf off (truncateu16 data));
        trace___a_rlen_write_upto8 <-
        (trace___a_rlen_write_upto8 ++
        [(Assert, ((0 <= (off + 2)) /\ ((off + 2) <= 18446744073709551615)))]);
        off <- (off + 2);
        data <- (data `>>` (W8.of_int 16));
      } else {
        
      }
      trace___a_rlen_write_upto8 <-
      (trace___a_rlen_write_upto8 ++
      [(Assert, ((0 <= len) /\ (len <= 18446744073709551615)))]);
      ( _8,  _9,  _10,  _11, zf) <-
      (TEST_64 (W64.of_int len) (W64.of_int 1));
      if ((! zf)) {
        trace___a_rlen_write_upto8 <-
        (trace___a_rlen_write_upto8 ++
        [(Assert, ((0 <= off) /\ ((off + 1) <= size)))]);
        b_buf <- (BArrayS.set8d b_buf off (W8.of_int 255));
        buf <- (BArrayS.set8d buf off (truncateu8 data));
        trace___a_rlen_write_upto8 <-
        (trace___a_rlen_write_upto8 ++
        [(Assert, ((0 <= (off + 1)) /\ ((off + 1) <= 18446744073709551615)))]);
        off <- (off + 1);
      } else {
        
      }
    }
    return (buf, b_buf, off, trace___a_rlen_write_upto8);
  }
  proc __addstate_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                       buf:BArrayS.t, b_buf:BArrayS.t, offset:int,
                       _LEN:int, _TRAILB:int) : BArray200.t * BArray200.t *
                                                int * int * trace = {
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
    var param_5:BArrayS.t;
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
    var param_12:BArrayS.t;
    var result_4:W64.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var trace___addstate_ref:trace;
    param_5 <- witness;
    param_12 <- witness;
    trace___addstate_ref <- [];
    trace___addstate_ref <-
    (trace___addstate_ref ++ [(Assert, (BArray200.is_init b_st 0 200))]);
    trace___addstate_ref <-
    (trace___addstate_ref ++ [(Assert, (BArrayS.is_init b_buf 0 size))]);
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if ((aT8 <> 0)) {
      param_5 <- buf;
      param_4 <- offset;
      param_3 <- dELTA;
      param_2 <- _LEN;
      param_1 <- _TRAILB;
      param_0 <- aT;
      param <- aT8;
      (result_3, result_2, result_1, result_0, result, tmp__trace) <@ 
      __a_ilen_read_upto8_at (param_5, (BArrayS.init_arr (W8.of_int 255)),
      param_4, param_3, param_2, param_1, param_0, param);
      trace___addstate_ref <- (trace___addstate_ref ++ tmp__trace);
      trace___addstate_ref <-
      (trace___addstate_ref ++
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
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert, ((0 <= ((aT %/ 8) * 8)) /\ ((((aT %/ 8) * 8) + 8) <= 200)))]);
      st <-
      (BArray200.set64 st (aT %/ 8) ((BArray200.get64 st (aT %/ 8)) `^` w));
      aT <- aT8;
    } else {
      
    }
    trace___addstate_ref <-
    (trace___addstate_ref ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace___addstate_ref <-
    (trace___addstate_ref ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    trace___addstate_ref <-
    (trace___addstate_ref ++
    [(Assert, ((0 <= (aT %/ 8)) /\ ((aT %/ 8) <= 18446744073709551615)))]);
    at <- (aT %/ 8);
    trace___addstate_ref <-
    (trace___addstate_ref ++
    [(Assert,
     ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
     (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      w <- (BArrayS.get64d buf offset);
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      at <- (at + 1);
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert,
       ((0 <= ((aT %/ 8) + (_LEN %/ 8))) /\
       (((aT %/ 8) + (_LEN %/ 8)) <= 18446744073709551615)))]);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      param_12 <- buf;
      param_11 <- offset;
      param_10 <- 0;
      param_9 <- _LEN;
      param_8 <- _TRAILB;
      param_7 <- aT;
      param_6 <- aT;
      (result_8, result_7, result_6, result_5, result_4, tmp__trace) <@ 
      __a_ilen_read_upto8_at (param_12, (BArrayS.init_arr (W8.of_int 255)),
      param_11, param_10, param_9, param_8, param_7, param_6);
      trace___addstate_ref <- (trace___addstate_ref ++ tmp__trace);
      trace___addstate_ref <-
      (trace___addstate_ref ++
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
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 200)))]);
      st <- (BArray200.set64 st at ((BArray200.get64 st at) `^` w));
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace___addstate_ref <-
      (trace___addstate_ref ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, offset, trace___addstate_ref);
  }
  proc __absorb_ref (st:BArray200.t, b_st:BArray200.t, aT:int,
                     buf:BArrayS.t, b_buf:BArrayS.t, _TRAILB:int,
                     _RATE8:int) : BArray200.t * BArray200.t * int * trace = {
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
    var param_2:BArrayS.t;
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
    var param_9:BArrayS.t;
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
    var param_16:BArrayS.t;
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
    var b_result_1:BArray200.t;
    var b_result_2:BArray200.t;
    var b_result_3:BArray200.t;
    var b_result_4:BArray200.t;
    var trace___absorb_ref:trace;
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
    trace___absorb_ref <- [];
    trace___absorb_ref <-
    (trace___absorb_ref ++ [(Assert, (BArray200.is_init b_st 0 200))]);
    trace___absorb_ref <-
    (trace___absorb_ref ++ [(Assert, (BArrayS.is_init b_buf 0 size))]);
    offset <- 0;
    _LEN <- size;
    if ((_RATE8 <= (aT + _LEN))) {
      param_4 <- st;
      param_3 <- aT;
      param_2 <- buf;
      param_1 <- offset;
      param_0 <- (_RATE8 - aT);
      param <- 0;
      (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_ref (param_4,
      (BArray200.init_arr (W8.of_int 255)), param_3, param_2,
      (BArrayS.init_arr (W8.of_int 255)), param_1, param_0, param);
      result_1 <- aux;
      b_result_4 <- aux_0;
      result_0 <- aux_1;
      result <- aux_2;
      trace___absorb_ref <- (trace___absorb_ref ++ tmp__trace);
      trace___absorb_ref <-
      (trace___absorb_ref ++
      [(Assert, (BArray200.is_init b_result_4 0 200))]);
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
      trace___absorb_ref <- (trace___absorb_ref ++ tmp__trace);
      trace___absorb_ref <-
      (trace___absorb_ref ++
      [(Assert, (BArray200.is_init b_result_3 0 200))]);
      st <- result_2;
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      trace___absorb_ref <-
      (trace___absorb_ref ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_11 <- st;
        param_10 <- 0;
        param_9 <- buf;
        param_8 <- offset;
        param_7 <- _RATE8;
        param_6 <- 0;
        (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_ref (param_11,
        (BArray200.init_arr (W8.of_int 255)), param_10, param_9,
        (BArrayS.init_arr (W8.of_int 255)), param_8, param_7, param_6);
        result_5 <- aux;
        b_result_2 <- aux_0;
        result_4 <- aux_1;
        result_3 <- aux_2;
        trace___absorb_ref <- (trace___absorb_ref ++ tmp__trace);
        trace___absorb_ref <-
        (trace___absorb_ref ++
        [(Assert, (BArray200.is_init b_result_2 0 200))]);
        st <- result_5;
        offset <- result_3;
        (* Erased call to spill *)
        param_12 <- st;
        (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_12,
        (BArray200.init_arr (W8.of_int 255)));
        result_6 <- aux;
        b_result_1 <- aux_0;
        trace___absorb_ref <- (trace___absorb_ref ++ tmp__trace);
        trace___absorb_ref <-
        (trace___absorb_ref ++
        [(Assert, (BArray200.is_init b_result_1 0 200))]);
        st <- result_6;
        (* Erased call to unspill *)
        trace___absorb_ref <-
        (trace___absorb_ref ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace___absorb_ref <-
        (trace___absorb_ref ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    param_18 <- st;
    param_17 <- aT;
    param_16 <- buf;
    param_15 <- offset;
    param_14 <- _LEN;
    param_13 <- _TRAILB;
    (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_ref (param_18,
    (BArray200.init_arr (W8.of_int 255)), param_17, param_16,
    (BArrayS.init_arr (W8.of_int 255)), param_15, param_14, param_13);
    result_9 <- aux;
    b_result_0 <- aux_0;
    result_8 <- aux_1;
    result_7 <- aux_2;
    trace___absorb_ref <- (trace___absorb_ref ++ tmp__trace);
    trace___absorb_ref <-
    (trace___absorb_ref ++ [(Assert, (BArray200.is_init b_result_0 0 200))]);
    st <- result_9;
    aT <- result_8;
    if ((_TRAILB <> 0)) {
      param_20 <- st;
      param_19 <- _RATE8;
      (aux, aux_0, tmp__trace) <@ __addratebit_ref (param_20,
      (BArray200.init_arr (W8.of_int 255)), param_19);
      result_10 <- aux;
      b_result <- aux_0;
      trace___absorb_ref <- (trace___absorb_ref ++ tmp__trace);
      trace___absorb_ref <-
      (trace___absorb_ref ++ [(Assert, (BArray200.is_init b_result 0 200))]);
      st <- result_10;
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    return (st, b_st, aT, trace___absorb_ref);
  }
  proc __dumpstate_ref (buf:BArrayS.t, b_buf:BArrayS.t, offset:int,
                        _LEN:int, st:BArray200.t, b_st:BArray200.t) : 
  BArrayS.t * BArrayS.t * int * trace = {
    var t:W64.t;
    var dELTA:int;
    var i:int;
    var param:W64.t;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result:int;
    var result_0:int;
    var result_1:BArrayS.t;
    var b_result:BArrayS.t;
    var trace___dumpstate_ref:trace;
    b_result <- witness;
    param_3 <- witness;
    result_1 <- witness;
    trace___dumpstate_ref <- [];
    trace___dumpstate_ref <-
    (trace___dumpstate_ref ++ [(Assert, (BArrayS.is_init b_buf 0 size))]);
    trace___dumpstate_ref <-
    (trace___dumpstate_ref ++ [(Assert, (BArray200.is_init b_st 0 200))]);
    i <- 0;
    trace___dumpstate_ref <-
    (trace___dumpstate_ref ++
    [(Assert, ((0 <= (_LEN %/ 8)) /\ ((_LEN %/ 8) <= 18446744073709551615)))]);
    while ((i < (_LEN %/ 8))) {
      trace___dumpstate_ref <-
      (trace___dumpstate_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      t <- (BArray200.get64 st i);
      trace___dumpstate_ref <-
      (trace___dumpstate_ref ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      b_buf <-
      (BArrayS.set64d b_buf offset (W64.of_int 18446744073709551615));
      buf <- (BArrayS.set64d buf offset t);
      trace___dumpstate_ref <-
      (trace___dumpstate_ref ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace___dumpstate_ref <-
      (trace___dumpstate_ref ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace___dumpstate_ref <-
      (trace___dumpstate_ref ++
      [(Assert,
       ((0 <= (_LEN %/ 8)) /\ ((_LEN %/ 8) <= 18446744073709551615)))]);
    }
    if ((0 < (_LEN %% 8))) {
      trace___dumpstate_ref <-
      (trace___dumpstate_ref ++
      [(Assert, ((0 <= (i * 8)) /\ (((i * 8) + 8) <= 200)))]);
      t <- (BArray200.get64 st i);
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- 0;
      param_0 <- (_LEN %% 8);
      param <- t;
      (result_1, b_result, result_0, result, tmp__trace) <@ __a_ilen_write_upto8 (
      param_3, (BArrayS.init_arr (W8.of_int 255)), param_2, param_1,
      param_0, param);
      trace___dumpstate_ref <- (trace___dumpstate_ref ++ tmp__trace);
      trace___dumpstate_ref <-
      (trace___dumpstate_ref ++
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
       (BArrayS.is_init b_result 0
       ((param_2 + param_1) +
       ((((param_0 < 8) ? param_0 : 8) < 0) ? 0 : ((param_0 < 8) ? param_0 : 8)))
       )))))))]);
      b_buf <- b_result;
      buf <- result_1;
      dELTA <- result_0;
      trace___dumpstate_ref <-
      (trace___dumpstate_ref ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace___dumpstate_ref <-
      (trace___dumpstate_ref ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    return (buf, b_buf, offset, trace___dumpstate_ref);
  }
  proc __squeeze_ref (st:BArray200.t, b_st:BArray200.t, buf:BArrayS.t,
                      b_buf:BArrayS.t, _RATE8:int) : BArray200.t *
                                                       BArray200.t *
                                                       BArrayS.t *
                                                       BArrayS.t * trace = {
    var aux:BArray200.t;
    var aux_0:BArray200.t;
    var offset:int;
    var i:int;
    var param:BArray200.t;
    var result:BArray200.t;
    var param_0:BArray200.t;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result_0:int;
    var result_1:BArrayS.t;
    var param_4:BArray200.t;
    var result_2:BArray200.t;
    var param_5:BArray200.t;
    var param_6:int;
    var param_7:int;
    var param_8:BArrayS.t;
    var result_3:int;
    var result_4:BArrayS.t;
    var b_result:BArrayS.t;
    var b_result_0:BArray200.t;
    var b_result_1:BArrayS.t;
    var b_result_2:BArray200.t;
    var trace___squeeze_ref:trace;
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
    trace___squeeze_ref <- [];
    trace___squeeze_ref <-
    (trace___squeeze_ref ++ [(Assert, (BArray200.is_init b_st 0 200))]);
    trace___squeeze_ref <-
    (trace___squeeze_ref ++ [(Assert, (BArrayS.is_init b_buf 0 size))]);
    offset <- 0;
    i <- 0;
    trace___squeeze_ref <-
    (trace___squeeze_ref ++
    [(Assert,
     ((0 <= (size %/ _RATE8)) /\ ((size %/ _RATE8) <= 18446744073709551615)))]);
    while ((i < (size %/ _RATE8))) {
      (* Erased call to spill *)
      param <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param,
      (BArray200.init_arr (W8.of_int 255)));
      result <- aux;
      b_result_2 <- aux_0;
      trace___squeeze_ref <- (trace___squeeze_ref ++ tmp__trace);
      trace___squeeze_ref <-
      (trace___squeeze_ref ++
      [(Assert, (BArray200.is_init b_result_2 0 200))]);
      st <- result;
      (* Erased call to unspill *)
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- _RATE8;
      param_0 <- st;
      (result_1, b_result_1, result_0, tmp__trace) <@ __dumpstate_ref (
      param_3, (BArrayS.init_arr (W8.of_int 255)), param_2, param_1,
      param_0, (BArray200.init_arr (W8.of_int 255)));
      trace___squeeze_ref <- (trace___squeeze_ref ++ tmp__trace);
      trace___squeeze_ref <-
      (trace___squeeze_ref ++
      [(Assert, (BArrayS.is_init b_result_1 0 size))]);
      buf <- result_1;
      offset <- result_0;
      (* Erased call to unspill *)
      trace___squeeze_ref <-
      (trace___squeeze_ref ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace___squeeze_ref <-
      (trace___squeeze_ref ++
      [(Assert,
       ((0 <= (size %/ _RATE8)) /\ ((size %/ _RATE8) <= 18446744073709551615)))]);
    }
    if ((0 < (size %% _RATE8))) {
      (* Erased call to spill *)
      param_4 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_ref (param_4,
      (BArray200.init_arr (W8.of_int 255)));
      result_2 <- aux;
      b_result_0 <- aux_0;
      trace___squeeze_ref <- (trace___squeeze_ref ++ tmp__trace);
      trace___squeeze_ref <-
      (trace___squeeze_ref ++
      [(Assert, (BArray200.is_init b_result_0 0 200))]);
      st <- result_2;
      (* Erased call to unspill *)
      param_8 <- buf;
      param_7 <- offset;
      param_6 <- (size %% _RATE8);
      param_5 <- st;
      (result_4, b_result, result_3, tmp__trace) <@ __dumpstate_ref (
      param_8, (BArrayS.init_arr (W8.of_int 255)), param_7, param_6,
      param_5, (BArray200.init_arr (W8.of_int 255)));
      trace___squeeze_ref <- (trace___squeeze_ref ++ tmp__trace);
      trace___squeeze_ref <-
      (trace___squeeze_ref ++ [(Assert, (BArrayS.is_init b_result 0 size))]);
      buf <- result_4;
    } else {
      
    }
    b_st <- (BArray200.init_arr (W8.of_int 255));
    b_buf <- (BArrayS.init_arr (W8.of_int 255));
    return (st, b_st, buf, b_buf, trace___squeeze_ref);
  }
  proc __addstate_avx2 (st:BArray224.t, b_st:BArray224.t, aT:int,
                        buf:BArrayS.t, b_buf:BArrayS.t, offset:int,
                        _LEN:int, _TRAILB:int) : BArray224.t * BArray224.t *
                                                 int * int * trace = {
    var aux:BArray224.t;
    var aux_0:BArray224.t;
    var dELTA:int;
    var t64_1:W64.t;
    var t128_0:W128.t;
    var r0:W256.t;
    var r1:W256.t;
    var t64_2:W64.t;
    var t128_1:W128.t;
    var t128_2:W128.t;
    var r3:W256.t;
    var t64_3:W64.t;
    var r4:W256.t;
    var t64_4:W64.t;
    var r5:W256.t;
    var t64_5:W64.t;
    var r6:W256.t;
    var r2:W256.t;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:BArrayS.t;
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
    var param_12:BArrayS.t;
    var result_4:W256.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var param_16:int;
    var param_17:int;
    var param_18:int;
    var param_19:BArrayS.t;
    var result_9:W64.t;
    var result_10:int;
    var result_11:int;
    var result_12:int;
    var result_13:int;
    var param_20:int;
    var param_21:int;
    var param_22:int;
    var param_23:int;
    var param_24:int;
    var param_25:int;
    var param_26:BArrayS.t;
    var result_14:W256.t;
    var result_15:int;
    var result_16:int;
    var result_17:int;
    var result_18:int;
    var param_27:int;
    var param_28:int;
    var param_29:int;
    var param_30:int;
    var param_31:int;
    var param_32:int;
    var param_33:BArrayS.t;
    var result_19:W64.t;
    var result_20:int;
    var result_21:int;
    var result_22:int;
    var result_23:int;
    var param_34:int;
    var param_35:int;
    var param_36:int;
    var param_37:int;
    var param_38:int;
    var param_39:int;
    var param_40:BArrayS.t;
    var result_24:W256.t;
    var result_25:int;
    var result_26:int;
    var result_27:int;
    var result_28:int;
    var param_41:int;
    var param_42:int;
    var param_43:int;
    var param_44:int;
    var param_45:int;
    var param_46:int;
    var param_47:BArrayS.t;
    var result_29:W64.t;
    var result_30:int;
    var result_31:int;
    var result_32:int;
    var result_33:int;
    var param_48:int;
    var param_49:int;
    var param_50:int;
    var param_51:int;
    var param_52:int;
    var param_53:int;
    var param_54:BArrayS.t;
    var result_34:W256.t;
    var result_35:int;
    var result_36:int;
    var result_37:int;
    var result_38:int;
    var param_55:int;
    var param_56:int;
    var param_57:int;
    var param_58:int;
    var param_59:int;
    var param_60:int;
    var param_61:BArrayS.t;
    var result_39:W64.t;
    var result_40:int;
    var result_41:int;
    var result_42:int;
    var result_43:int;
    var param_62:int;
    var param_63:int;
    var param_64:int;
    var param_65:int;
    var param_66:int;
    var param_67:int;
    var param_68:BArrayS.t;
    var result_44:W256.t;
    var result_45:int;
    var result_46:int;
    var result_47:int;
    var result_48:int;
    var param_69:W256.t;
    var param_70:W256.t;
    var param_71:W256.t;
    var param_72:W256.t;
    var param_73:BArray224.t;
    var result_49:BArray224.t;
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
    var trace___addstate_avx2:trace;
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
    param_5 <- witness;
    param_12 <- witness;
    param_19 <- witness;
    param_26 <- witness;
    param_33 <- witness;
    param_40 <- witness;
    param_47 <- witness;
    param_54 <- witness;
    param_61 <- witness;
    param_68 <- witness;
    param_73 <- witness;
    result_49 <- witness;
    trace___addstate_avx2 <- [];
    trace___addstate_avx2 <-
    (trace___addstate_avx2 ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     (((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= size)) /\
      (BArrayS.is_init b_buf offset _LEN)) /\
     (BArray224.is_init b_st 0 224)))))]);
    trace___addstate_avx2 <-
    (trace___addstate_avx2 ++
    [(Assert,
     ((((0 <= _TRAILB) /\ (_TRAILB < 256)) /\ (0 <= aT)) /\
     (((aT + _LEN) + ((_TRAILB <> 0) ? 1 : 0)) < 200)))]);
    trace___addstate_avx2 <-
    (trace___addstate_avx2 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    if ((aT < 8)) {
      if (((aT = 0) /\ (8 <= _LEN))) {
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
        [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
        [(Assert,
         ((0 <= (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))) /\
         (((W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA))) + 8) <=
         size)))]);
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
        [(Assert,
         (BArrayS.is_init b_buf
         (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA))) 8))]);
        r0 <-
        (VPBROADCAST_4u64
        (BArrayS.get64d buf
        (W64.to_uint ((W64.of_int offset) + (W64.of_int dELTA)))));
        dELTA <- (dELTA + 8);
        _LEN <- (_LEN - 8);
        aT <- 8;
      } else {
        b_param_8 <- b_buf;
        param_5 <- buf;
        param_4 <- offset;
        param_3 <- dELTA;
        param_2 <- _LEN;
        param_1 <- _TRAILB;
        param_0 <- 0;
        param <- aT;
        (result_3, result_2, result_1, result_0, result, tmp__trace) <@ 
        __a_ilen_read_upto8_at (param_5, b_param_8, param_4, param_3,
        param_2, param_1, param_0, param);
        trace___addstate_avx2 <- (trace___addstate_avx2 ++ tmp__trace);
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
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
                                                              (param -
                                                              param_0))))))) /\
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
                                                                8) ? 
                                                               ((param -
                                                                param_0) +
                                                               param_2) : 8) +
                                                              (((8 <=
                                                                ((param -
                                                                 param_0) +
                                                                param_2)) \/
                                                               (param_1 = 0)) ? 0 : 1)) <
                                                             0) ? 0 : 
                                                            (((((param -
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
                                                             (param_1 = 0)) ? 0 : 1)))))) : 
         ((((result_3 = param_3) /\ (result_2 = param_2)) /\
          (result_1 = param_1)) /\
         (result_0 = param))))]);
        dELTA <- result_3;
        _LEN <- result_2;
        _TRAILB <- result_1;
        aT <- result_0;
        t64_1 <- result;
        t128_0 <- (zeroextu128 t64_1);
        r0 <- (VPBROADCAST_4u64 (truncateu64 t128_0));
      }
      st <- (BArray224.set256 st 0 ((BArray224.get256 st 0) `^` r0));
    } else {
      
    }
    if (((aT < 40) /\ ((0 < _LEN) \/ (_TRAILB <> 0)))) {
      b_param_7 <- b_buf;
      param_12 <- buf;
      param_11 <- offset;
      param_10 <- dELTA;
      param_9 <- _LEN;
      param_8 <- _TRAILB;
      param_7 <- 8;
      param_6 <- aT;
      (result_8, result_7, result_6, result_5, result_4, tmp__trace) <@ 
      __a_ilen_read_upto32_at (param_12, b_param_7, param_11, param_10,
      param_9, param_8, param_7, param_6);
      trace___addstate_avx2 <- (trace___addstate_avx2 ++ tmp__trace);
      trace___addstate_avx2 <-
      (trace___addstate_avx2 ++
      [(Assert,
       (((param_7 <= param_6) /\ (param_6 < (param_7 + 32))) ? ((((result_8 =
                                                                  (param_10 +
                                                                  (((
                                                                    (
                                                                    param_9 <
                                                                    (32 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                    param_9 : 
                                                                    (32 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) <
                                                                   0) ? 0 : 
                                                                  ((param_9 <
                                                                   (32 -
                                                                   (param_6 -
                                                                   param_7))) ? 
                                                                  param_9 : 
                                                                  (32 -
                                                                  (param_6 -
                                                                  param_7)))))) /\
                                                                 (result_7 =
                                                                 (param_9 -
                                                                 ((((
                                                                    param_9 <
                                                                    (32 -
                                                                    (
                                                                    param_6 -
                                                                    param_7))) ? 
                                                                   param_9 : 
                                                                   (32 -
                                                                   (param_6 -
                                                                   param_7))) <
                                                                  0) ? 0 : 
                                                                 ((param_9 <
                                                                  (32 -
                                                                  (param_6 -
                                                                  param_7))) ? 
                                                                 param_9 : 
                                                                 (32 -
                                                                 (param_6 -
                                                                 param_7))))))) /\
                                                                (result_6 =
                                                                ((32 <=
                                                                 ((param_6 -
                                                                  param_7) +
                                                                 param_9)) ? 
                                                                param_8 : 0))) /\
                                                               (result_5 =
                                                               (param_7 +
                                                               ((((((
                                                                    (
                                                                    param_6 -
                                                                    param_7) +
                                                                    param_9) <
                                                                   32) ? 
                                                                  ((param_6 -
                                                                   param_7) +
                                                                  param_9) : 32) +
                                                                 (((32 <=
                                                                   ((
                                                                    param_6 -
                                                                    param_7) +
                                                                   param_9)) \/
                                                                  (param_8 =
                                                                  0)) ? 0 : 1)) <
                                                                0) ? 0 : 
                                                               (((((param_6 -
                                                                   param_7) +
                                                                  param_9) <
                                                                 32) ? 
                                                                ((param_6 -
                                                                 param_7) +
                                                                param_9) : 32) +
                                                               (((32 <=
                                                                 ((param_6 -
                                                                  param_7) +
                                                                 param_9)) \/
                                                                (param_8 = 0)) ? 0 : 1)))))) : 
       ((((result_8 = param_10) /\ (result_7 = param_9)) /\
        (result_6 = param_8)) /\
       (result_5 = param_6))))]);
      dELTA <- result_8;
      _LEN <- result_7;
      _TRAILB <- result_6;
      aT <- result_5;
      r1 <- result_4;
      st <- (BArray224.set256 st 1 ((BArray224.get256 st 1) `^` r1));
    } else {
      
    }
    if (((0 < _LEN) \/ (_TRAILB <> 0))) {
      b_param_6 <- b_buf;
      param_19 <- buf;
      param_18 <- offset;
      param_17 <- dELTA;
      param_16 <- _LEN;
      param_15 <- _TRAILB;
      param_14 <- 40;
      param_13 <- aT;
      (result_13, result_12, result_11, result_10, result_9, tmp__trace) <@ 
      __a_ilen_read_upto8_at (param_19, b_param_6, param_18, param_17,
      param_16, param_15, param_14, param_13);
      trace___addstate_avx2 <- (trace___addstate_avx2 ++ tmp__trace);
      trace___addstate_avx2 <-
      (trace___addstate_avx2 ++
      [(Assert,
       (((param_14 <= param_13) /\ (param_13 < (param_14 + 8))) ? (((
                                                                    (
                                                                    result_13 =
                                                                    (
                                                                    param_17 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_16 <
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) ? 
                                                                    param_16 : 
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_16 <
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) ? 
                                                                    param_16 : 
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14)))))) /\
                                                                    (
                                                                    result_12 =
                                                                    (
                                                                    param_16 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_16 <
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) ? 
                                                                    param_16 : 
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_16 <
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) ? 
                                                                    param_16 : 
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))))))) /\
                                                                   (result_11 =
                                                                   ((8 <=
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16)) ? 
                                                                   param_15 : 0))) /\
                                                                  (result_10 =
                                                                  (param_14 +
                                                                  (((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16)) \/
                                                                    (
                                                                    param_15 =
                                                                    0)) ? 0 : 1)) <
                                                                   0) ? 0 : 
                                                                  (((
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16) <
                                                                    8) ? 
                                                                   ((
                                                                    param_13 -
                                                                    param_14) +
                                                                   param_16) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16)) \/
                                                                   (param_15 =
                                                                   0)) ? 0 : 1)))))) : 
       ((((result_13 = param_17) /\ (result_12 = param_16)) /\
        (result_11 = param_15)) /\
       (result_10 = param_13))))]);
      dELTA <- result_13;
      _LEN <- result_12;
      _TRAILB <- result_11;
      aT <- result_10;
      t64_2 <- result_9;
      t128_1 <- (zeroextu128 t64_2);
      t128_2 <- (set0_128);
      if (((0 < _LEN) \/ (_TRAILB <> 0))) {
        b_param_5 <- b_buf;
        param_26 <- buf;
        param_25 <- offset;
        param_24 <- dELTA;
        param_23 <- _LEN;
        param_22 <- _TRAILB;
        param_21 <- 48;
        param_20 <- aT;
        (result_18, result_17, result_16, result_15, result_14, tmp__trace) <@ 
        __a_ilen_read_upto32_at (param_26, b_param_5, param_25, param_24,
        param_23, param_22, param_21, param_20);
        trace___addstate_avx2 <- (trace___addstate_avx2 ++ tmp__trace);
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
        [(Assert,
         (((param_21 <= param_20) /\ (param_20 < (param_21 + 32))) ? 
         ((((result_18 =
            (param_24 +
            ((((param_23 < (32 - (param_20 - param_21))) ? param_23 : 
              (32 - (param_20 - param_21))) <
             0) ? 0 : ((param_23 < (32 - (param_20 - param_21))) ? param_23 : 
                      (32 - (param_20 - param_21)))))) /\
           (result_17 =
           (param_23 -
           ((((param_23 < (32 - (param_20 - param_21))) ? param_23 : 
             (32 - (param_20 - param_21))) <
            0) ? 0 : ((param_23 < (32 - (param_20 - param_21))) ? param_23 : 
                     (32 - (param_20 - param_21))))))) /\
          (result_16 =
          ((32 <= ((param_20 - param_21) + param_23)) ? param_22 : 0))) /\
         (result_15 =
         (param_21 +
         (((((((param_20 - param_21) + param_23) < 32) ? ((param_20 -
                                                          param_21) +
                                                         param_23) : 32) +
           (((32 <= ((param_20 - param_21) + param_23)) \/ (param_22 = 0)) ? 0 : 1)) <
          0) ? 0 : (((((param_20 - param_21) + param_23) < 32) ? ((param_20 -
                                                                  param_21) +
                                                                 param_23) : 32) +
                   (((32 <= ((param_20 - param_21) + param_23)) \/
                    (param_22 = 0)) ? 0 : 1)))))) : ((((result_18 = param_24) /\
                                                      (result_17 = param_23)) /\
                                                     (result_16 = param_22)) /\
                                                    (result_15 = param_20))))]);
        dELTA <- result_18;
        _LEN <- result_17;
        _TRAILB <- result_16;
        aT <- result_15;
        r3 <- result_14;
        b_param_4 <- b_buf;
        param_33 <- buf;
        param_32 <- offset;
        param_31 <- dELTA;
        param_30 <- _LEN;
        param_29 <- _TRAILB;
        param_28 <- 80;
        param_27 <- aT;
        (result_23, result_22, result_21, result_20, result_19, tmp__trace) <@ 
        __a_ilen_read_upto8_at (param_33, b_param_4, param_32, param_31,
        param_30, param_29, param_28, param_27);
        trace___addstate_avx2 <- (trace___addstate_avx2 ++ tmp__trace);
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
        [(Assert,
         (((param_28 <= param_27) /\ (param_27 < (param_28 + 8))) ? (
                                                                    (
                                                                    (
                                                                    (
                                                                    result_23 =
                                                                    (
                                                                    param_31 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_30 <
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) ? 
                                                                    param_30 : 
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_30 <
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) ? 
                                                                    param_30 : 
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28)))))) /\
                                                                    (
                                                                    result_22 =
                                                                    (
                                                                    param_30 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_30 <
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) ? 
                                                                    param_30 : 
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_30 <
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) ? 
                                                                    param_30 : 
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))))))) /\
                                                                    (
                                                                    result_21 =
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30)) ? 
                                                                    param_29 : 0))) /\
                                                                    (
                                                                    result_20 =
                                                                    (
                                                                    param_28 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30)) \/
                                                                    (
                                                                    param_29 =
                                                                    0)) ? 0 : 1)) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30)) \/
                                                                    (
                                                                    param_29 =
                                                                    0)) ? 0 : 1)))))) : 
         ((((result_23 = param_31) /\ (result_22 = param_30)) /\
          (result_21 = param_29)) /\
         (result_20 = param_27))))]);
        dELTA <- result_23;
        _LEN <- result_22;
        _TRAILB <- result_21;
        aT <- result_20;
        t64_3 <- result_19;
        t128_2 <- (zeroextu128 t64_3);
        b_param_3 <- b_buf;
        param_40 <- buf;
        param_39 <- offset;
        param_38 <- dELTA;
        param_37 <- _LEN;
        param_36 <- _TRAILB;
        param_35 <- 88;
        param_34 <- aT;
        (result_28, result_27, result_26, result_25, result_24, tmp__trace) <@ 
        __a_ilen_read_upto32_at (param_40, b_param_3, param_39, param_38,
        param_37, param_36, param_35, param_34);
        trace___addstate_avx2 <- (trace___addstate_avx2 ++ tmp__trace);
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
        [(Assert,
         (((param_35 <= param_34) /\ (param_34 < (param_35 + 32))) ? 
         ((((result_28 =
            (param_38 +
            ((((param_37 < (32 - (param_34 - param_35))) ? param_37 : 
              (32 - (param_34 - param_35))) <
             0) ? 0 : ((param_37 < (32 - (param_34 - param_35))) ? param_37 : 
                      (32 - (param_34 - param_35)))))) /\
           (result_27 =
           (param_37 -
           ((((param_37 < (32 - (param_34 - param_35))) ? param_37 : 
             (32 - (param_34 - param_35))) <
            0) ? 0 : ((param_37 < (32 - (param_34 - param_35))) ? param_37 : 
                     (32 - (param_34 - param_35))))))) /\
          (result_26 =
          ((32 <= ((param_34 - param_35) + param_37)) ? param_36 : 0))) /\
         (result_25 =
         (param_35 +
         (((((((param_34 - param_35) + param_37) < 32) ? ((param_34 -
                                                          param_35) +
                                                         param_37) : 32) +
           (((32 <= ((param_34 - param_35) + param_37)) \/ (param_36 = 0)) ? 0 : 1)) <
          0) ? 0 : (((((param_34 - param_35) + param_37) < 32) ? ((param_34 -
                                                                  param_35) +
                                                                 param_37) : 32) +
                   (((32 <= ((param_34 - param_35) + param_37)) \/
                    (param_36 = 0)) ? 0 : 1)))))) : ((((result_28 = param_38) /\
                                                      (result_27 = param_37)) /\
                                                     (result_26 = param_36)) /\
                                                    (result_25 = param_34))))]);
        dELTA <- result_28;
        _LEN <- result_27;
        _TRAILB <- result_26;
        aT <- result_25;
        r4 <- result_24;
        b_param_2 <- b_buf;
        param_47 <- buf;
        param_46 <- offset;
        param_45 <- dELTA;
        param_44 <- _LEN;
        param_43 <- _TRAILB;
        param_42 <- 120;
        param_41 <- aT;
        (result_33, result_32, result_31, result_30, result_29, tmp__trace) <@ 
        __a_ilen_read_upto8_at (param_47, b_param_2, param_46, param_45,
        param_44, param_43, param_42, param_41);
        trace___addstate_avx2 <- (trace___addstate_avx2 ++ tmp__trace);
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
        [(Assert,
         (((param_42 <= param_41) /\ (param_41 < (param_42 + 8))) ? (
                                                                    (
                                                                    (
                                                                    (
                                                                    result_33 =
                                                                    (
                                                                    param_45 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_44 <
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) ? 
                                                                    param_44 : 
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_44 <
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) ? 
                                                                    param_44 : 
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42)))))) /\
                                                                    (
                                                                    result_32 =
                                                                    (
                                                                    param_44 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_44 <
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) ? 
                                                                    param_44 : 
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_44 <
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) ? 
                                                                    param_44 : 
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))))))) /\
                                                                    (
                                                                    result_31 =
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44)) ? 
                                                                    param_43 : 0))) /\
                                                                    (
                                                                    result_30 =
                                                                    (
                                                                    param_42 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44)) \/
                                                                    (
                                                                    param_43 =
                                                                    0)) ? 0 : 1)) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44)) \/
                                                                    (
                                                                    param_43 =
                                                                    0)) ? 0 : 1)))))) : 
         ((((result_33 = param_45) /\ (result_32 = param_44)) /\
          (result_31 = param_43)) /\
         (result_30 = param_41))))]);
        dELTA <- result_33;
        _LEN <- result_32;
        _TRAILB <- result_31;
        aT <- result_30;
        t64_4 <- result_29;
        t128_1 <- (VPINSR_2u64 t128_1 t64_4 (W8.of_int 1));
        b_param_1 <- b_buf;
        param_54 <- buf;
        param_53 <- offset;
        param_52 <- dELTA;
        param_51 <- _LEN;
        param_50 <- _TRAILB;
        param_49 <- 128;
        param_48 <- aT;
        (result_38, result_37, result_36, result_35, result_34, tmp__trace) <@ 
        __a_ilen_read_upto32_at (param_54, b_param_1, param_53, param_52,
        param_51, param_50, param_49, param_48);
        trace___addstate_avx2 <- (trace___addstate_avx2 ++ tmp__trace);
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
        [(Assert,
         (((param_49 <= param_48) /\ (param_48 < (param_49 + 32))) ? 
         ((((result_38 =
            (param_52 +
            ((((param_51 < (32 - (param_48 - param_49))) ? param_51 : 
              (32 - (param_48 - param_49))) <
             0) ? 0 : ((param_51 < (32 - (param_48 - param_49))) ? param_51 : 
                      (32 - (param_48 - param_49)))))) /\
           (result_37 =
           (param_51 -
           ((((param_51 < (32 - (param_48 - param_49))) ? param_51 : 
             (32 - (param_48 - param_49))) <
            0) ? 0 : ((param_51 < (32 - (param_48 - param_49))) ? param_51 : 
                     (32 - (param_48 - param_49))))))) /\
          (result_36 =
          ((32 <= ((param_48 - param_49) + param_51)) ? param_50 : 0))) /\
         (result_35 =
         (param_49 +
         (((((((param_48 - param_49) + param_51) < 32) ? ((param_48 -
                                                          param_49) +
                                                         param_51) : 32) +
           (((32 <= ((param_48 - param_49) + param_51)) \/ (param_50 = 0)) ? 0 : 1)) <
          0) ? 0 : (((((param_48 - param_49) + param_51) < 32) ? ((param_48 -
                                                                  param_49) +
                                                                 param_51) : 32) +
                   (((32 <= ((param_48 - param_49) + param_51)) \/
                    (param_50 = 0)) ? 0 : 1)))))) : ((((result_38 = param_52) /\
                                                      (result_37 = param_51)) /\
                                                     (result_36 = param_50)) /\
                                                    (result_35 = param_48))))]);
        dELTA <- result_38;
        _LEN <- result_37;
        _TRAILB <- result_36;
        aT <- result_35;
        r5 <- result_34;
        b_param_0 <- b_buf;
        param_61 <- buf;
        param_60 <- offset;
        param_59 <- dELTA;
        param_58 <- _LEN;
        param_57 <- _TRAILB;
        param_56 <- 160;
        param_55 <- aT;
        (result_43, result_42, result_41, result_40, result_39, tmp__trace) <@ 
        __a_ilen_read_upto8_at (param_61, b_param_0, param_60, param_59,
        param_58, param_57, param_56, param_55);
        trace___addstate_avx2 <- (trace___addstate_avx2 ++ tmp__trace);
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
        [(Assert,
         (((param_56 <= param_55) /\ (param_55 < (param_56 + 8))) ? (
                                                                    (
                                                                    (
                                                                    (
                                                                    result_43 =
                                                                    (
                                                                    param_59 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_58 <
                                                                    (8 -
                                                                    (
                                                                    param_55 -
                                                                    param_56))) ? 
                                                                    param_58 : 
                                                                    (8 -
                                                                    (
                                                                    param_55 -
                                                                    param_56))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_58 <
                                                                    (8 -
                                                                    (
                                                                    param_55 -
                                                                    param_56))) ? 
                                                                    param_58 : 
                                                                    (8 -
                                                                    (
                                                                    param_55 -
                                                                    param_56)))))) /\
                                                                    (
                                                                    result_42 =
                                                                    (
                                                                    param_58 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_58 <
                                                                    (8 -
                                                                    (
                                                                    param_55 -
                                                                    param_56))) ? 
                                                                    param_58 : 
                                                                    (8 -
                                                                    (
                                                                    param_55 -
                                                                    param_56))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_58 <
                                                                    (8 -
                                                                    (
                                                                    param_55 -
                                                                    param_56))) ? 
                                                                    param_58 : 
                                                                    (8 -
                                                                    (
                                                                    param_55 -
                                                                    param_56))))))) /\
                                                                    (
                                                                    result_41 =
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_55 -
                                                                    param_56) +
                                                                    param_58)) ? 
                                                                    param_57 : 0))) /\
                                                                    (
                                                                    result_40 =
                                                                    (
                                                                    param_56 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_55 -
                                                                    param_56) +
                                                                    param_58) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_55 -
                                                                    param_56) +
                                                                    param_58) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_55 -
                                                                    param_56) +
                                                                    param_58)) \/
                                                                    (
                                                                    param_57 =
                                                                    0)) ? 0 : 1)) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_55 -
                                                                    param_56) +
                                                                    param_58) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_55 -
                                                                    param_56) +
                                                                    param_58) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_55 -
                                                                    param_56) +
                                                                    param_58)) \/
                                                                    (
                                                                    param_57 =
                                                                    0)) ? 0 : 1)))))) : 
         ((((result_43 = param_59) /\ (result_42 = param_58)) /\
          (result_41 = param_57)) /\
         (result_40 = param_55))))]);
        dELTA <- result_43;
        _LEN <- result_42;
        _TRAILB <- result_41;
        aT <- result_40;
        t64_5 <- result_39;
        t128_2 <- (VPINSR_2u64 t128_2 t64_5 (W8.of_int 1));
        b_param <- b_buf;
        param_68 <- buf;
        param_67 <- offset;
        param_66 <- dELTA;
        param_65 <- _LEN;
        param_64 <- _TRAILB;
        param_63 <- 168;
        param_62 <- aT;
        (result_48, result_47, result_46, result_45, result_44, tmp__trace) <@ 
        __a_ilen_read_upto32_at (param_68, b_param, param_67, param_66,
        param_65, param_64, param_63, param_62);
        trace___addstate_avx2 <- (trace___addstate_avx2 ++ tmp__trace);
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
        [(Assert,
         (((param_63 <= param_62) /\ (param_62 < (param_63 + 32))) ? 
         ((((result_48 =
            (param_66 +
            ((((param_65 < (32 - (param_62 - param_63))) ? param_65 : 
              (32 - (param_62 - param_63))) <
             0) ? 0 : ((param_65 < (32 - (param_62 - param_63))) ? param_65 : 
                      (32 - (param_62 - param_63)))))) /\
           (result_47 =
           (param_65 -
           ((((param_65 < (32 - (param_62 - param_63))) ? param_65 : 
             (32 - (param_62 - param_63))) <
            0) ? 0 : ((param_65 < (32 - (param_62 - param_63))) ? param_65 : 
                     (32 - (param_62 - param_63))))))) /\
          (result_46 =
          ((32 <= ((param_62 - param_63) + param_65)) ? param_64 : 0))) /\
         (result_45 =
         (param_63 +
         (((((((param_62 - param_63) + param_65) < 32) ? ((param_62 -
                                                          param_63) +
                                                         param_65) : 32) +
           (((32 <= ((param_62 - param_63) + param_65)) \/ (param_64 = 0)) ? 0 : 1)) <
          0) ? 0 : (((((param_62 - param_63) + param_65) < 32) ? ((param_62 -
                                                                  param_63) +
                                                                 param_65) : 32) +
                   (((32 <= ((param_62 - param_63) + param_65)) \/
                    (param_64 = 0)) ? 0 : 1)))))) : ((((result_48 = param_66) /\
                                                      (result_47 = param_65)) /\
                                                     (result_46 = param_64)) /\
                                                    (result_45 = param_62))))]);
        dELTA <- result_48;
        aT <- result_45;
        r6 <- result_44;
        param_73 <- st;
        param_72 <- r3;
        param_71 <- r4;
        param_70 <- r5;
        param_69 <- r6;
        (aux, aux_0, tmp__trace) <@ __addstate_r3456_avx2 (param_73,
        (BArray224.init_arr (W8.of_int 255)), param_72, param_71, param_70,
        param_69);
        result_49 <- aux;
        b_result <- aux_0;
        trace___addstate_avx2 <- (trace___addstate_avx2 ++ tmp__trace);
        trace___addstate_avx2 <-
        (trace___addstate_avx2 ++
        [(Assert, (BArray224.is_init b_result 0 224))]);
        st <- result_49;
      } else {
        
      }
      r2 <-
      (W256.of_int
      (((W128.to_uint t128_2) %% (2 ^ 128)) +
      ((2 ^ 128) * (W128.to_uint t128_1))));
      st <- (BArray224.set256 st 2 ((BArray224.get256 st 2) `^` r2));
    } else {
      
    }
    trace___addstate_avx2 <-
    (trace___addstate_avx2 ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace___addstate_avx2 <-
    (trace___addstate_avx2 ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    b_st <- (BArray224.init_arr (W8.of_int 255));
    return (st, b_st, aT, offset, trace___addstate_avx2);
  }
  proc __absorb_avx2 (st:BArray224.t, b_st:BArray224.t, aT:int,
                      buf:BArrayS.t, b_buf:BArrayS.t, _TRAILB:int,
                      _RATE8:int) : BArray224.t * BArray224.t * int * trace = {
    var aux:BArray224.t;
    var aux_0:BArray224.t;
    var aux_1:int;
    var aux_2:int;
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:BArrayS.t;
    var param_3:int;
    var param_4:BArray224.t;
    var result:int;
    var result_0:int;
    var result_1:BArray224.t;
    var param_5:BArray224.t;
    var result_2:BArray224.t;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:BArrayS.t;
    var param_10:int;
    var param_11:BArray224.t;
    var result_3:int;
    var result_4:int;
    var result_5:BArray224.t;
    var param_12:BArray224.t;
    var result_6:BArray224.t;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var param_16:BArrayS.t;
    var param_17:int;
    var param_18:BArray224.t;
    var result_7:int;
    var result_8:int;
    var result_9:BArray224.t;
    var param_19:int;
    var param_20:BArray224.t;
    var result_10:BArray224.t;
    var b_result:BArray224.t;
    var b_result_0:BArray224.t;
    var b_result_1:BArray224.t;
    var b_result_2:BArray224.t;
    var b_result_3:BArray224.t;
    var b_result_4:BArray224.t;
    var trace___absorb_avx2:trace;
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
    trace___absorb_avx2 <- [];
    trace___absorb_avx2 <-
    (trace___absorb_avx2 ++
    [(Assert,
     ((((((((0 < _RATE8) /\ (_RATE8 < 200)) /\ (0 <= _TRAILB)) /\
         (_TRAILB < 256)) /\
        (0 <= aT)) /\
       (aT < _RATE8)) /\
      (BArrayS.is_init b_buf 0 size)) /\
     (BArray224.is_init b_st 0 224)))]);
    offset <- 0;
    _LEN <- size;
    if ((_RATE8 <= (aT + _LEN))) {
      param_4 <- st;
      param_3 <- aT;
      param_2 <- buf;
      param_1 <- offset;
      param_0 <- (_RATE8 - aT);
      param <- 0;
      (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_avx2 (param_4,
      (BArray224.init_arr (W8.of_int 255)), param_3, param_2,
      (BArrayS.init_arr (W8.of_int 255)), param_1, param_0, param);
      result_1 <- aux;
      b_result_4 <- aux_0;
      result_0 <- aux_1;
      result <- aux_2;
      trace___absorb_avx2 <- (trace___absorb_avx2 ++ tmp__trace);
      trace___absorb_avx2 <-
      (trace___absorb_avx2 ++
      [(Assert,
       (((0 <= param_0) /\ (param_0 <= 18446744073709551615)) /\
       (((0 <= (param_1 + param_0)) /\
        ((param_1 + param_0) <= 18446744073709551615)) /\
       (((BArray224.is_init b_result_4 0 224) /\
        (result_0 = ((param_3 + param_0) + ((param <> 0) ? 1 : 0)))) /\
       (result = (param_1 + param_0))))))]);
      trace___absorb_avx2 <-
      (trace___absorb_avx2 ++
      [(Assert, ((0 <= result) /\ (result <= 18446744073709551615)))]);
      st <- result_1;
      offset <- result;
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      param_5 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_avx2 (param_5,
      (BArray224.init_arr (W8.of_int 255)));
      result_2 <- aux;
      b_result_3 <- aux_0;
      trace___absorb_avx2 <- (trace___absorb_avx2 ++ tmp__trace);
      trace___absorb_avx2 <-
      (trace___absorb_avx2 ++
      [(Assert, (BArray224.is_init b_result_3 0 224))]);
      st <- result_2;
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      trace___absorb_avx2 <-
      (trace___absorb_avx2 ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_11 <- st;
        param_10 <- 0;
        param_9 <- buf;
        param_8 <- offset;
        param_7 <- _RATE8;
        param_6 <- 0;
        (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_avx2 (param_11,
        (BArray224.init_arr (W8.of_int 255)), param_10, param_9,
        (BArrayS.init_arr (W8.of_int 255)), param_8, param_7, param_6);
        result_5 <- aux;
        b_result_2 <- aux_0;
        result_4 <- aux_1;
        result_3 <- aux_2;
        trace___absorb_avx2 <- (trace___absorb_avx2 ++ tmp__trace);
        trace___absorb_avx2 <-
        (trace___absorb_avx2 ++
        [(Assert,
         (((0 <= param_7) /\ (param_7 <= 18446744073709551615)) /\
         (((0 <= (param_8 + param_7)) /\
          ((param_8 + param_7) <= 18446744073709551615)) /\
         (((BArray224.is_init b_result_2 0 224) /\
          (result_4 = ((param_10 + param_7) + ((param_6 <> 0) ? 1 : 0)))) /\
         (result_3 = (param_8 + param_7))))))]);
        trace___absorb_avx2 <-
        (trace___absorb_avx2 ++
        [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
        st <- result_5;
        offset <- result_3;
        param_12 <- st;
        (aux, aux_0, tmp__trace) <@ _keccakf1600_avx2 (param_12,
        (BArray224.init_arr (W8.of_int 255)));
        result_6 <- aux;
        b_result_1 <- aux_0;
        trace___absorb_avx2 <- (trace___absorb_avx2 ++ tmp__trace);
        trace___absorb_avx2 <-
        (trace___absorb_avx2 ++
        [(Assert, (BArray224.is_init b_result_1 0 224))]);
        st <- result_6;
        trace___absorb_avx2 <-
        (trace___absorb_avx2 ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace___absorb_avx2 <-
        (trace___absorb_avx2 ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    param_18 <- st;
    param_17 <- aT;
    param_16 <- buf;
    param_15 <- offset;
    param_14 <- _LEN;
    param_13 <- _TRAILB;
    (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_avx2 (param_18,
    (BArray224.init_arr (W8.of_int 255)), param_17, param_16,
    (BArrayS.init_arr (W8.of_int 255)), param_15, param_14, param_13);
    result_9 <- aux;
    b_result_0 <- aux_0;
    result_8 <- aux_1;
    result_7 <- aux_2;
    trace___absorb_avx2 <- (trace___absorb_avx2 ++ tmp__trace);
    trace___absorb_avx2 <-
    (trace___absorb_avx2 ++
    [(Assert,
     (((0 <= param_14) /\ (param_14 <= 18446744073709551615)) /\
     (((0 <= (param_15 + param_14)) /\
      ((param_15 + param_14) <= 18446744073709551615)) /\
     (((BArray224.is_init b_result_0 0 224) /\
      (result_8 = ((param_17 + param_14) + ((param_13 <> 0) ? 1 : 0)))) /\
     (result_7 = (param_15 + param_14))))))]);
    trace___absorb_avx2 <-
    (trace___absorb_avx2 ++
    [(Assert, ((0 <= result_7) /\ (result_7 <= 18446744073709551615)))]);
    st <- result_9;
    aT <- result_8;
    if ((_TRAILB <> 0)) {
      param_20 <- st;
      param_19 <- _RATE8;
      (aux, aux_0, tmp__trace) <@ __addratebit_avx2 (param_20,
      (BArray224.init_arr (W8.of_int 255)), param_19);
      result_10 <- aux;
      b_result <- aux_0;
      trace___absorb_avx2 <- (trace___absorb_avx2 ++ tmp__trace);
      trace___absorb_avx2 <-
      (trace___absorb_avx2 ++ [(Assert, (BArray224.is_init b_result 0 224))]);
      st <- result_10;
    } else {
      
    }
    b_st <- (BArray224.init_arr (W8.of_int 255));
    return (st, b_st, aT, trace___absorb_avx2);
  }
  proc __dumpstate_avx2 (buf:BArrayS.t, b_buf:BArrayS.t, offset:int,
                         _LEN:int, st:BArray224.t, b_st:BArray224.t) : 
  BArrayS.t * BArrayS.t * int * trace = {
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
    var param_4:W256.t;
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
    var param_44:W64.t;
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
    var trace___dumpstate_avx2:trace;
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
    trace___dumpstate_avx2 <- [];
    trace___dumpstate_avx2 <-
    (trace___dumpstate_avx2 ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     ((((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= size)) /\
       (BArray224.is_init b_st 0 224)) /\
      (_LEN <= 200)) /\
     (BArrayS.is_init b_buf 0 offset)))))]);
    trace___dumpstate_avx2 <-
    (trace___dumpstate_avx2 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    if ((8 <= _LEN)) {
      b_param_8 <- b_buf;
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- dELTA;
      param_0 <- 8;
      param <- (BArray224.get256 st 0);
      (result_1, b_result_8, result_0, result, tmp__trace) <@ __a_ilen_write_upto32 (
      param_3, b_param_8, param_2, param_1, param_0, param);
      trace___dumpstate_avx2 <- (trace___dumpstate_avx2 ++ tmp__trace);
      trace___dumpstate_avx2 <-
      (trace___dumpstate_avx2 ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (((0 <=
         ((((param_0 < 32) ? param_0 : 32) < 0) ? 0 : ((param_0 < 32) ? 
                                                      param_0 : 32))) /\
        (((((param_0 < 32) ? param_0 : 32) < 0) ? 0 : ((param_0 < 32) ? 
                                                      param_0 : 32)) <=
        18446744073709551615)) /\
       (((0 <=
         ((param_2 + param_1) +
         ((((param_0 < 32) ? param_0 : 32) < 0) ? 0 : ((param_0 < 32) ? 
                                                      param_0 : 32)))) /\
        (((param_2 + param_1) +
         ((((param_0 < 32) ? param_0 : 32) < 0) ? 0 : ((param_0 < 32) ? 
                                                      param_0 : 32))) <=
        18446744073709551615)) /\
       (((result_0 =
         (param_1 +
         ((((param_0 < 32) ? param_0 : 32) < 0) ? 0 : ((param_0 < 32) ? 
                                                      param_0 : 32)))) /\
        (result =
        (param_0 -
        ((((param_0 < 32) ? param_0 : 32) < 0) ? 0 : ((param_0 < 32) ? 
                                                     param_0 : 32))))) /\
       (BArrayS.is_init b_result_8 0
       ((param_2 + param_1) +
       ((((param_0 < 32) ? param_0 : 32) < 0) ? 0 : ((param_0 < 32) ? 
                                                    param_0 : 32)))
       )))))))]);
      b_buf <- b_result_8;
      buf <- result_1;
      dELTA <- result_0;
      _LEN <- (_LEN - 8);
    } else {
      b_param_9 <- b_buf;
      param_8 <- buf;
      param_7 <- offset;
      param_6 <- dELTA;
      param_5 <- _LEN;
      param_4 <- (BArray224.get256 st 0);
      (result_4, b_result_9, result_3, result_2, tmp__trace) <@ __a_ilen_write_upto32 (
      param_8, b_param_9, param_7, param_6, param_5, param_4);
      trace___dumpstate_avx2 <- (trace___dumpstate_avx2 ++ tmp__trace);
      trace___dumpstate_avx2 <-
      (trace___dumpstate_avx2 ++
      [(Assert,
       (((0 <= param_6) /\ (param_6 <= 18446744073709551615)) /\
       (((0 <= (param_7 + param_6)) /\
        ((param_7 + param_6) <= 18446744073709551615)) /\
       (((0 <=
         ((((param_5 < 32) ? param_5 : 32) < 0) ? 0 : ((param_5 < 32) ? 
                                                      param_5 : 32))) /\
        (((((param_5 < 32) ? param_5 : 32) < 0) ? 0 : ((param_5 < 32) ? 
                                                      param_5 : 32)) <=
        18446744073709551615)) /\
       (((0 <=
         ((param_7 + param_6) +
         ((((param_5 < 32) ? param_5 : 32) < 0) ? 0 : ((param_5 < 32) ? 
                                                      param_5 : 32)))) /\
        (((param_7 + param_6) +
         ((((param_5 < 32) ? param_5 : 32) < 0) ? 0 : ((param_5 < 32) ? 
                                                      param_5 : 32))) <=
        18446744073709551615)) /\
       (((result_3 =
         (param_6 +
         ((((param_5 < 32) ? param_5 : 32) < 0) ? 0 : ((param_5 < 32) ? 
                                                      param_5 : 32)))) /\
        (result_2 =
        (param_5 -
        ((((param_5 < 32) ? param_5 : 32) < 0) ? 0 : ((param_5 < 32) ? 
                                                     param_5 : 32))))) /\
       (BArrayS.is_init b_result_9 0
       ((param_7 + param_6) +
       ((((param_5 < 32) ? param_5 : 32) < 0) ? 0 : ((param_5 < 32) ? 
                                                    param_5 : 32)))
       )))))))]);
      b_buf <- b_result_9;
      buf <- result_4;
      dELTA <- result_3;
      _LEN <- result_2;
    }
    b_param_7 <- b_buf;
    param_13 <- buf;
    param_12 <- offset;
    param_11 <- dELTA;
    param_10 <- _LEN;
    param_9 <- (BArray224.get256 st 1);
    (result_7, b_result_7, result_6, result_5, tmp__trace) <@ __a_ilen_write_upto32 (
    param_13, b_param_7, param_12, param_11, param_10, param_9);
    trace___dumpstate_avx2 <- (trace___dumpstate_avx2 ++ tmp__trace);
    trace___dumpstate_avx2 <-
    (trace___dumpstate_avx2 ++
    [(Assert,
     (((0 <= param_11) /\ (param_11 <= 18446744073709551615)) /\
     (((0 <= (param_12 + param_11)) /\
      ((param_12 + param_11) <= 18446744073709551615)) /\
     (((0 <=
       ((((param_10 < 32) ? param_10 : 32) < 0) ? 0 : ((param_10 < 32) ? 
                                                      param_10 : 32))) /\
      (((((param_10 < 32) ? param_10 : 32) < 0) ? 0 : ((param_10 < 32) ? 
                                                      param_10 : 32)) <=
      18446744073709551615)) /\
     (((0 <=
       ((param_12 + param_11) +
       ((((param_10 < 32) ? param_10 : 32) < 0) ? 0 : ((param_10 < 32) ? 
                                                      param_10 : 32)))) /\
      (((param_12 + param_11) +
       ((((param_10 < 32) ? param_10 : 32) < 0) ? 0 : ((param_10 < 32) ? 
                                                      param_10 : 32))) <=
      18446744073709551615)) /\
     (((result_6 =
       (param_11 +
       ((((param_10 < 32) ? param_10 : 32) < 0) ? 0 : ((param_10 < 32) ? 
                                                      param_10 : 32)))) /\
      (result_5 =
      (param_10 -
      ((((param_10 < 32) ? param_10 : 32) < 0) ? 0 : ((param_10 < 32) ? 
                                                     param_10 : 32))))) /\
     (BArrayS.is_init b_result_7 0
     ((param_12 + param_11) +
     ((((param_10 < 32) ? param_10 : 32) < 0) ? 0 : ((param_10 < 32) ? 
                                                    param_10 : 32)))
     )))))))]);
    b_buf <- b_result_7;
    buf <- result_7;
    dELTA <- result_6;
    _LEN <- result_5;
    if ((0 < _LEN)) {
      t128_0 <- (truncateu128 (BArray224.get256 st 2));
      t128_1 <- (VEXTRACTI128 (BArray224.get256 st 2) (W8.of_int 1));
      t <- (truncateu64 t128_1);
      b_param_6 <- b_buf;
      param_18 <- buf;
      param_17 <- offset;
      param_16 <- dELTA;
      param_15 <- _LEN;
      param_14 <- t;
      (result_10, b_result_6, result_9, result_8, tmp__trace) <@ __a_ilen_write_upto8 (
      param_18, b_param_6, param_17, param_16, param_15, param_14);
      trace___dumpstate_avx2 <- (trace___dumpstate_avx2 ++ tmp__trace);
      trace___dumpstate_avx2 <-
      (trace___dumpstate_avx2 ++
      [(Assert,
       (((0 <= param_16) /\ (param_16 <= 18446744073709551615)) /\
       (((0 <= (param_17 + param_16)) /\
        ((param_17 + param_16) <= 18446744073709551615)) /\
       (((0 <=
         ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                      param_15 : 8))) /\
        (((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                      param_15 : 8)) <=
        18446744073709551615)) /\
       (((0 <=
         ((param_17 + param_16) +
         ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                      param_15 : 8)))) /\
        (((param_17 + param_16) +
         ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                      param_15 : 8))) <=
        18446744073709551615)) /\
       (((result_9 =
         (param_16 +
         ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                      param_15 : 8)))) /\
        (result_8 =
        (param_15 -
        ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                     param_15 : 8))))) /\
       (BArrayS.is_init b_result_6 0
       ((param_17 + param_16) +
       ((((param_15 < 8) ? param_15 : 8) < 0) ? 0 : ((param_15 < 8) ? 
                                                    param_15 : 8)))
       )))))))]);
      b_buf <- b_result_6;
      buf <- result_10;
      dELTA <- result_9;
      _LEN <- result_8;
      t128_1 <- (VPUNPCKH_2u64 t128_1 t128_1);
      if ((0 < _LEN)) {
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
        param_23 <- buf;
        param_22 <- offset;
        param_21 <- dELTA;
        param_20 <- _LEN;
        param_19 <- t256_4;
        (result_13, b_result_5, result_12, result_11, tmp__trace) <@ 
        __a_ilen_write_upto32 (param_23, b_param_5, param_22, param_21,
        param_20, param_19);
        trace___dumpstate_avx2 <- (trace___dumpstate_avx2 ++ tmp__trace);
        trace___dumpstate_avx2 <-
        (trace___dumpstate_avx2 ++
        [(Assert,
         (((0 <= param_21) /\ (param_21 <= 18446744073709551615)) /\
         (((0 <= (param_22 + param_21)) /\
          ((param_22 + param_21) <= 18446744073709551615)) /\
         (((0 <=
           ((((param_20 < 32) ? param_20 : 32) < 0) ? 0 : ((param_20 < 32) ? 
                                                          param_20 : 32))) /\
          (((((param_20 < 32) ? param_20 : 32) < 0) ? 0 : ((param_20 < 32) ? 
                                                          param_20 : 32)) <=
          18446744073709551615)) /\
         (((0 <=
           ((param_22 + param_21) +
           ((((param_20 < 32) ? param_20 : 32) < 0) ? 0 : ((param_20 < 32) ? 
                                                          param_20 : 32)))) /\
          (((param_22 + param_21) +
           ((((param_20 < 32) ? param_20 : 32) < 0) ? 0 : ((param_20 < 32) ? 
                                                          param_20 : 32))) <=
          18446744073709551615)) /\
         (((result_12 =
           (param_21 +
           ((((param_20 < 32) ? param_20 : 32) < 0) ? 0 : ((param_20 < 32) ? 
                                                          param_20 : 32)))) /\
          (result_11 =
          (param_20 -
          ((((param_20 < 32) ? param_20 : 32) < 0) ? 0 : ((param_20 < 32) ? 
                                                         param_20 : 32))))) /\
         (BArrayS.is_init b_result_5 0
         ((param_22 + param_21) +
         ((((param_20 < 32) ? param_20 : 32) < 0) ? 0 : ((param_20 < 32) ? 
                                                        param_20 : 32)))
         )))))))]);
        b_buf <- b_result_5;
        buf <- result_13;
        dELTA <- result_12;
        _LEN <- result_11;
        if ((0 < _LEN)) {
          t <- (truncateu64 t128_0);
          b_param_4 <- b_buf;
          param_28 <- buf;
          param_27 <- offset;
          param_26 <- dELTA;
          param_25 <- _LEN;
          param_24 <- t;
          (result_16, b_result_4, result_15, result_14, tmp__trace) <@ 
          __a_ilen_write_upto8 (param_28, b_param_4, param_27, param_26,
          param_25, param_24);
          trace___dumpstate_avx2 <- (trace___dumpstate_avx2 ++ tmp__trace);
          trace___dumpstate_avx2 <-
          (trace___dumpstate_avx2 ++
          [(Assert,
           (((0 <= param_26) /\ (param_26 <= 18446744073709551615)) /\
           (((0 <= (param_27 + param_26)) /\
            ((param_27 + param_26) <= 18446744073709551615)) /\
           (((0 <=
             ((((param_25 < 8) ? param_25 : 8) < 0) ? 0 : ((param_25 < 8) ? 
                                                          param_25 : 8))) /\
            (((((param_25 < 8) ? param_25 : 8) < 0) ? 0 : ((param_25 < 8) ? 
                                                          param_25 : 8)) <=
            18446744073709551615)) /\
           (((0 <=
             ((param_27 + param_26) +
             ((((param_25 < 8) ? param_25 : 8) < 0) ? 0 : ((param_25 < 8) ? 
                                                          param_25 : 8)))) /\
            (((param_27 + param_26) +
             ((((param_25 < 8) ? param_25 : 8) < 0) ? 0 : ((param_25 < 8) ? 
                                                          param_25 : 8))) <=
            18446744073709551615)) /\
           (((result_15 =
             (param_26 +
             ((((param_25 < 8) ? param_25 : 8) < 0) ? 0 : ((param_25 < 8) ? 
                                                          param_25 : 8)))) /\
            (result_14 =
            (param_25 -
            ((((param_25 < 8) ? param_25 : 8) < 0) ? 0 : ((param_25 < 8) ? 
                                                         param_25 : 8))))) /\
           (BArrayS.is_init b_result_4 0
           ((param_27 + param_26) +
           ((((param_25 < 8) ? param_25 : 8) < 0) ? 0 : ((param_25 < 8) ? 
                                                        param_25 : 8)))
           )))))))]);
          b_buf <- b_result_4;
          buf <- result_16;
          dELTA <- result_15;
          _LEN <- result_14;
          t128_0 <- (VPUNPCKH_2u64 t128_0 t128_0);
        } else {
          
        }
        if ((0 < _LEN)) {
          t256_4 <- (VPBLEND_8u32 t256_3 t256_1 (W8.of_int 195));
          b_param_3 <- b_buf;
          param_33 <- buf;
          param_32 <- offset;
          param_31 <- dELTA;
          param_30 <- _LEN;
          param_29 <- t256_4;
          (result_19, b_result_3, result_18, result_17, tmp__trace) <@ 
          __a_ilen_write_upto32 (param_33, b_param_3, param_32, param_31,
          param_30, param_29);
          trace___dumpstate_avx2 <- (trace___dumpstate_avx2 ++ tmp__trace);
          trace___dumpstate_avx2 <-
          (trace___dumpstate_avx2 ++
          [(Assert,
           (((0 <= param_31) /\ (param_31 <= 18446744073709551615)) /\
           (((0 <= (param_32 + param_31)) /\
            ((param_32 + param_31) <= 18446744073709551615)) /\
           (((0 <=
             ((((param_30 < 32) ? param_30 : 32) < 0) ? 0 : ((param_30 < 32) ? 
                                                            param_30 : 32))) /\
            (((((param_30 < 32) ? param_30 : 32) < 0) ? 0 : ((param_30 < 32) ? 
                                                            param_30 : 32)) <=
            18446744073709551615)) /\
           (((0 <=
             ((param_32 + param_31) +
             ((((param_30 < 32) ? param_30 : 32) < 0) ? 0 : ((param_30 < 32) ? 
                                                            param_30 : 32)))) /\
            (((param_32 + param_31) +
             ((((param_30 < 32) ? param_30 : 32) < 0) ? 0 : ((param_30 < 32) ? 
                                                            param_30 : 32))) <=
            18446744073709551615)) /\
           (((result_18 =
             (param_31 +
             ((((param_30 < 32) ? param_30 : 32) < 0) ? 0 : ((param_30 < 32) ? 
                                                            param_30 : 32)))) /\
            (result_17 =
            (param_30 -
            ((((param_30 < 32) ? param_30 : 32) < 0) ? 0 : ((param_30 < 32) ? 
                                                           param_30 : 32))))) /\
           (BArrayS.is_init b_result_3 0
           ((param_32 + param_31) +
           ((((param_30 < 32) ? param_30 : 32) < 0) ? 0 : ((param_30 < 32) ? 
                                                          param_30 : 32)))
           )))))))]);
          b_buf <- b_result_3;
          buf <- result_19;
          dELTA <- result_18;
          _LEN <- result_17;
        } else {
          
        }
        if ((0 < _LEN)) {
          t <- (truncateu64 t128_1);
          b_param_2 <- b_buf;
          param_38 <- buf;
          param_37 <- offset;
          param_36 <- dELTA;
          param_35 <- _LEN;
          param_34 <- t;
          (result_22, b_result_2, result_21, result_20, tmp__trace) <@ 
          __a_ilen_write_upto8 (param_38, b_param_2, param_37, param_36,
          param_35, param_34);
          trace___dumpstate_avx2 <- (trace___dumpstate_avx2 ++ tmp__trace);
          trace___dumpstate_avx2 <-
          (trace___dumpstate_avx2 ++
          [(Assert,
           (((0 <= param_36) /\ (param_36 <= 18446744073709551615)) /\
           (((0 <= (param_37 + param_36)) /\
            ((param_37 + param_36) <= 18446744073709551615)) /\
           (((0 <=
             ((((param_35 < 8) ? param_35 : 8) < 0) ? 0 : ((param_35 < 8) ? 
                                                          param_35 : 8))) /\
            (((((param_35 < 8) ? param_35 : 8) < 0) ? 0 : ((param_35 < 8) ? 
                                                          param_35 : 8)) <=
            18446744073709551615)) /\
           (((0 <=
             ((param_37 + param_36) +
             ((((param_35 < 8) ? param_35 : 8) < 0) ? 0 : ((param_35 < 8) ? 
                                                          param_35 : 8)))) /\
            (((param_37 + param_36) +
             ((((param_35 < 8) ? param_35 : 8) < 0) ? 0 : ((param_35 < 8) ? 
                                                          param_35 : 8))) <=
            18446744073709551615)) /\
           (((result_21 =
             (param_36 +
             ((((param_35 < 8) ? param_35 : 8) < 0) ? 0 : ((param_35 < 8) ? 
                                                          param_35 : 8)))) /\
            (result_20 =
            (param_35 -
            ((((param_35 < 8) ? param_35 : 8) < 0) ? 0 : ((param_35 < 8) ? 
                                                         param_35 : 8))))) /\
           (BArrayS.is_init b_result_2 0
           ((param_37 + param_36) +
           ((((param_35 < 8) ? param_35 : 8) < 0) ? 0 : ((param_35 < 8) ? 
                                                        param_35 : 8)))
           )))))))]);
          b_buf <- b_result_2;
          buf <- result_22;
          dELTA <- result_21;
          _LEN <- result_20;
        } else {
          
        }
        if ((0 < _LEN)) {
          t256_4 <- (VPBLEND_8u32 t256_2 t256_0 (W8.of_int 195));
          b_param_1 <- b_buf;
          param_43 <- buf;
          param_42 <- offset;
          param_41 <- dELTA;
          param_40 <- _LEN;
          param_39 <- t256_4;
          (result_25, b_result_1, result_24, result_23, tmp__trace) <@ 
          __a_ilen_write_upto32 (param_43, b_param_1, param_42, param_41,
          param_40, param_39);
          trace___dumpstate_avx2 <- (trace___dumpstate_avx2 ++ tmp__trace);
          trace___dumpstate_avx2 <-
          (trace___dumpstate_avx2 ++
          [(Assert,
           (((0 <= param_41) /\ (param_41 <= 18446744073709551615)) /\
           (((0 <= (param_42 + param_41)) /\
            ((param_42 + param_41) <= 18446744073709551615)) /\
           (((0 <=
             ((((param_40 < 32) ? param_40 : 32) < 0) ? 0 : ((param_40 < 32) ? 
                                                            param_40 : 32))) /\
            (((((param_40 < 32) ? param_40 : 32) < 0) ? 0 : ((param_40 < 32) ? 
                                                            param_40 : 32)) <=
            18446744073709551615)) /\
           (((0 <=
             ((param_42 + param_41) +
             ((((param_40 < 32) ? param_40 : 32) < 0) ? 0 : ((param_40 < 32) ? 
                                                            param_40 : 32)))) /\
            (((param_42 + param_41) +
             ((((param_40 < 32) ? param_40 : 32) < 0) ? 0 : ((param_40 < 32) ? 
                                                            param_40 : 32))) <=
            18446744073709551615)) /\
           (((result_24 =
             (param_41 +
             ((((param_40 < 32) ? param_40 : 32) < 0) ? 0 : ((param_40 < 32) ? 
                                                            param_40 : 32)))) /\
            (result_23 =
            (param_40 -
            ((((param_40 < 32) ? param_40 : 32) < 0) ? 0 : ((param_40 < 32) ? 
                                                           param_40 : 32))))) /\
           (BArrayS.is_init b_result_1 0
           ((param_42 + param_41) +
           ((((param_40 < 32) ? param_40 : 32) < 0) ? 0 : ((param_40 < 32) ? 
                                                          param_40 : 32)))
           )))))))]);
          b_buf <- b_result_1;
          buf <- result_25;
          dELTA <- result_24;
          _LEN <- result_23;
        } else {
          
        }
        if ((0 < _LEN)) {
          t <- (truncateu64 t128_0);
          b_param_0 <- b_buf;
          param_48 <- buf;
          param_47 <- offset;
          param_46 <- dELTA;
          param_45 <- _LEN;
          param_44 <- t;
          (result_28, b_result_0, result_27, result_26, tmp__trace) <@ 
          __a_ilen_write_upto8 (param_48, b_param_0, param_47, param_46,
          param_45, param_44);
          trace___dumpstate_avx2 <- (trace___dumpstate_avx2 ++ tmp__trace);
          trace___dumpstate_avx2 <-
          (trace___dumpstate_avx2 ++
          [(Assert,
           (((0 <= param_46) /\ (param_46 <= 18446744073709551615)) /\
           (((0 <= (param_47 + param_46)) /\
            ((param_47 + param_46) <= 18446744073709551615)) /\
           (((0 <=
             ((((param_45 < 8) ? param_45 : 8) < 0) ? 0 : ((param_45 < 8) ? 
                                                          param_45 : 8))) /\
            (((((param_45 < 8) ? param_45 : 8) < 0) ? 0 : ((param_45 < 8) ? 
                                                          param_45 : 8)) <=
            18446744073709551615)) /\
           (((0 <=
             ((param_47 + param_46) +
             ((((param_45 < 8) ? param_45 : 8) < 0) ? 0 : ((param_45 < 8) ? 
                                                          param_45 : 8)))) /\
            (((param_47 + param_46) +
             ((((param_45 < 8) ? param_45 : 8) < 0) ? 0 : ((param_45 < 8) ? 
                                                          param_45 : 8))) <=
            18446744073709551615)) /\
           (((result_27 =
             (param_46 +
             ((((param_45 < 8) ? param_45 : 8) < 0) ? 0 : ((param_45 < 8) ? 
                                                          param_45 : 8)))) /\
            (result_26 =
            (param_45 -
            ((((param_45 < 8) ? param_45 : 8) < 0) ? 0 : ((param_45 < 8) ? 
                                                         param_45 : 8))))) /\
           (BArrayS.is_init b_result_0 0
           ((param_47 + param_46) +
           ((((param_45 < 8) ? param_45 : 8) < 0) ? 0 : ((param_45 < 8) ? 
                                                        param_45 : 8)))
           )))))))]);
          b_buf <- b_result_0;
          buf <- result_28;
          dELTA <- result_27;
          _LEN <- result_26;
        } else {
          
        }
        if ((0 < _LEN)) {
          t256_4 <- (VPBLEND_8u32 t256_1 t256_2 (W8.of_int 195));
          b_param <- b_buf;
          param_53 <- buf;
          param_52 <- offset;
          param_51 <- dELTA;
          param_50 <- _LEN;
          param_49 <- t256_4;
          (result_31, b_result, result_30, result_29, tmp__trace) <@ 
          __a_ilen_write_upto32 (param_53, b_param, param_52, param_51,
          param_50, param_49);
          trace___dumpstate_avx2 <- (trace___dumpstate_avx2 ++ tmp__trace);
          trace___dumpstate_avx2 <-
          (trace___dumpstate_avx2 ++
          [(Assert,
           (((0 <= param_51) /\ (param_51 <= 18446744073709551615)) /\
           (((0 <= (param_52 + param_51)) /\
            ((param_52 + param_51) <= 18446744073709551615)) /\
           (((0 <=
             ((((param_50 < 32) ? param_50 : 32) < 0) ? 0 : ((param_50 < 32) ? 
                                                            param_50 : 32))) /\
            (((((param_50 < 32) ? param_50 : 32) < 0) ? 0 : ((param_50 < 32) ? 
                                                            param_50 : 32)) <=
            18446744073709551615)) /\
           (((0 <=
             ((param_52 + param_51) +
             ((((param_50 < 32) ? param_50 : 32) < 0) ? 0 : ((param_50 < 32) ? 
                                                            param_50 : 32)))) /\
            (((param_52 + param_51) +
             ((((param_50 < 32) ? param_50 : 32) < 0) ? 0 : ((param_50 < 32) ? 
                                                            param_50 : 32))) <=
            18446744073709551615)) /\
           (((result_30 =
             (param_51 +
             ((((param_50 < 32) ? param_50 : 32) < 0) ? 0 : ((param_50 < 32) ? 
                                                            param_50 : 32)))) /\
            (result_29 =
            (param_50 -
            ((((param_50 < 32) ? param_50 : 32) < 0) ? 0 : ((param_50 < 32) ? 
                                                           param_50 : 32))))) /\
           (BArrayS.is_init b_result 0
           ((param_52 + param_51) +
           ((((param_50 < 32) ? param_50 : 32) < 0) ? 0 : ((param_50 < 32) ? 
                                                          param_50 : 32)))
           )))))))]);
          b_buf <- b_result;
          buf <- result_31;
          dELTA <- result_30;
        } else {
          
        }
      } else {
        
      }
    } else {
      
    }
    trace___dumpstate_avx2 <-
    (trace___dumpstate_avx2 ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace___dumpstate_avx2 <-
    (trace___dumpstate_avx2 ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    return (buf, b_buf, offset, trace___dumpstate_avx2);
  }
  proc __squeeze_avx2 (st:BArray224.t, b_st:BArray224.t, buf:BArrayS.t,
                       b_buf:BArrayS.t, _RATE8:int) : BArray224.t *
                                                        BArray224.t *
                                                        BArrayS.t *
                                                        BArrayS.t * trace = {
    var aux:BArray224.t;
    var aux_0:BArray224.t;
    var _LEN:int;
    var iTERS:int;
    var lO:int;
    var offset:int;
    var i:int;
    var param:BArray224.t;
    var result:BArray224.t;
    var param_0:BArray224.t;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var result_0:int;
    var result_1:BArrayS.t;
    var param_4:BArray224.t;
    var result_2:BArray224.t;
    var param_5:BArray224.t;
    var param_6:int;
    var param_7:int;
    var param_8:BArrayS.t;
    var result_3:int;
    var result_4:BArrayS.t;
    var b_result:BArrayS.t;
    var b_param:BArrayS.t;
    var b_result_0:BArray224.t;
    var b_result_1:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_result_2:BArray224.t;
    var trace___squeeze_avx2:trace;
    b_param <- witness;
    b_param_0 <- witness;
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
    trace___squeeze_avx2 <- [];
    trace___squeeze_avx2 <-
    (trace___squeeze_avx2 ++
    [(Assert,
     (((0 < _RATE8) /\ (_RATE8 < 200)) /\ (BArray224.is_init b_st 0 224)))]);
    offset <- 0;
    _LEN <- size;
    iTERS <- (_LEN %/ _RATE8);
    lO <- (_LEN %% _RATE8);
    i <- 0;
    trace___squeeze_avx2 <-
    (trace___squeeze_avx2 ++
    [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
    while ((i < iTERS)) {
      param <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_avx2 (param,
      (BArray224.init_arr (W8.of_int 255)));
      result <- aux;
      b_result_2 <- aux_0;
      trace___squeeze_avx2 <- (trace___squeeze_avx2 ++ tmp__trace);
      trace___squeeze_avx2 <-
      (trace___squeeze_avx2 ++
      [(Assert, (BArray224.is_init b_result_2 0 224))]);
      st <- result;
      b_param_0 <- b_buf;
      param_3 <- buf;
      param_2 <- offset;
      param_1 <- _RATE8;
      param_0 <- st;
      (result_1, b_result_1, result_0, tmp__trace) <@ __dumpstate_avx2 (
      param_3, b_param_0, param_2, param_1, param_0,
      (BArray224.init_arr (W8.of_int 255)));
      trace___squeeze_avx2 <- (trace___squeeze_avx2 ++ tmp__trace);
      trace___squeeze_avx2 <-
      (trace___squeeze_avx2 ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (result_0 = (param_2 + param_1)))))]);
      trace___squeeze_avx2 <-
      (trace___squeeze_avx2 ++
      [(Assert,
       (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
       (((0 <= (param_2 + param_1)) /\
        ((param_2 + param_1) <= 18446744073709551615)) /\
       (BArrayS.is_init b_result_1 0 (param_2 + param_1)))))]);
      trace___squeeze_avx2 <-
      (trace___squeeze_avx2 ++
      [(Assert, ((0 <= result_0) /\ (result_0 <= 18446744073709551615)))]);
      b_buf <- b_result_1;
      buf <- result_1;
      offset <- result_0;
      trace___squeeze_avx2 <-
      (trace___squeeze_avx2 ++
      [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
      i <- (i + 1);
      trace___squeeze_avx2 <-
      (trace___squeeze_avx2 ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
    }
    if ((0 < lO)) {
      param_4 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_avx2 (param_4,
      (BArray224.init_arr (W8.of_int 255)));
      result_2 <- aux;
      b_result_0 <- aux_0;
      trace___squeeze_avx2 <- (trace___squeeze_avx2 ++ tmp__trace);
      trace___squeeze_avx2 <-
      (trace___squeeze_avx2 ++
      [(Assert, (BArray224.is_init b_result_0 0 224))]);
      st <- result_2;
      b_param <- b_buf;
      param_8 <- buf;
      param_7 <- offset;
      param_6 <- lO;
      param_5 <- st;
      (result_4, b_result, result_3, tmp__trace) <@ __dumpstate_avx2 (
      param_8, b_param, param_7, param_6, param_5,
      (BArray224.init_arr (W8.of_int 255)));
      trace___squeeze_avx2 <- (trace___squeeze_avx2 ++ tmp__trace);
      trace___squeeze_avx2 <-
      (trace___squeeze_avx2 ++
      [(Assert,
       (((0 <= param_6) /\ (param_6 <= 18446744073709551615)) /\
       (((0 <= (param_7 + param_6)) /\
        ((param_7 + param_6) <= 18446744073709551615)) /\
       (result_3 = (param_7 + param_6)))))]);
      trace___squeeze_avx2 <-
      (trace___squeeze_avx2 ++
      [(Assert,
       (((0 <= param_6) /\ (param_6 <= 18446744073709551615)) /\
       (((0 <= (param_7 + param_6)) /\
        ((param_7 + param_6) <= 18446744073709551615)) /\
       (BArrayS.is_init b_result 0 (param_7 + param_6)))))]);
      trace___squeeze_avx2 <-
      (trace___squeeze_avx2 ++
      [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
      b_buf <- b_result;
      buf <- result_4;
    } else {
      
    }
    b_st <- (BArray224.init_arr (W8.of_int 255));
    return (st, b_st, buf, b_buf, trace___squeeze_avx2);
  }
  proc __addstate_bcast_avx2x4 (st:BArray800.t, b_st:BArray800.t, aT:int,
                                buf:BArrayS.t, b_buf:BArrayS.t,
                                offset:int, _LEN:int, _TRAILB:int) : 
  BArray800.t * BArray800.t * int * int * trace = {
    var dELTA:int;
    var aT8:int;
    var w:W256.t;
    var at:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:BArrayS.t;
    var result:W256.t;
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
    var param_12:BArrayS.t;
    var result_4:W256.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var trace___addstate_bcast_avx2x4:trace;
    b_param <- witness;
    b_param_0 <- witness;
    param_5 <- witness;
    param_12 <- witness;
    trace___addstate_bcast_avx2x4 <- [];
    trace___addstate_bcast_avx2x4 <-
    (trace___addstate_bcast_avx2x4 ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     (((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= size)) /\
      (BArrayS.is_init b_buf offset _LEN)) /\
     (BArray800.is_init b_st 0 800)))))]);
    trace___addstate_bcast_avx2x4 <-
    (trace___addstate_bcast_avx2x4 ++
    [(Assert,
     ((((0 <= aT) /\ (((aT + _LEN) + ((_TRAILB <> 0) ? 1 : 0)) < 200)) /\
      (0 <= _TRAILB)) /\
     (_TRAILB < 256)))]);
    trace___addstate_bcast_avx2x4 <-
    (trace___addstate_bcast_avx2x4 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if (((aT8 %% 8) <> 0)) {
      b_param_0 <- b_buf;
      param_5 <- buf;
      param_4 <- offset;
      param_3 <- dELTA;
      param_2 <- _LEN;
      param_1 <- _TRAILB;
      param_0 <- aT;
      param <- aT8;
      (result_3, result_2, result_1, result_0, result, tmp__trace) <@ 
      __a_ilen_read_bcast_upto8_at (param_5, b_param_0, param_4, param_3,
      param_2, param_1, param_0, param);
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++ tmp__trace);
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
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
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert,
       ((0 <= ((aT %/ 8) * 32)) /\ ((((aT %/ 8) * 32) + 32) <= 800)))]);
      w <- (w `^` (BArray800.get256 st (aT %/ 8)));
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert,
       ((0 <= ((aT %/ 8) * 32)) /\ ((((aT %/ 8) * 32) + 32) <= 800)))]);
      st <- (BArray800.set256 st (aT %/ 8) w);
      aT <- aT8;
    } else {
      
    }
    trace___addstate_bcast_avx2x4 <-
    (trace___addstate_bcast_avx2x4 ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace___addstate_bcast_avx2x4 <-
    (trace___addstate_bcast_avx2x4 ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    trace___addstate_bcast_avx2x4 <-
    (trace___addstate_bcast_avx2x4 ++
    [(Assert,
     ((0 <= (32 * (aT %/ 8))) /\ ((32 * (aT %/ 8)) <= 18446744073709551615)))]);
    at <- (32 * (aT %/ 8));
    trace___addstate_bcast_avx2x4 <-
    (trace___addstate_bcast_avx2x4 ++
    [(Assert,
     ((0 <= (32 * ((aT %/ 8) + (_LEN %/ 8)))) /\
     ((32 * ((aT %/ 8) + (_LEN %/ 8))) <= 18446744073709551615)))]);
    while ((at < (32 * ((aT %/ 8) + (_LEN %/ 8))))) {
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert, (BArrayS.is_init b_buf offset 8))]);
      w <- (VPBROADCAST_4u64 (BArrayS.get64d buf offset));
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
      w <- (w `^` (BArray800.get256d st at));
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
      st <- (BArray800.set256d st at w);
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert, ((0 <= (at + 32)) /\ ((at + 32) <= 18446744073709551615)))]);
      at <- (at + 32);
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert,
       ((0 <= (32 * ((aT %/ 8) + (_LEN %/ 8)))) /\
       ((32 * ((aT %/ 8) + (_LEN %/ 8))) <= 18446744073709551615)))]);
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
      __a_ilen_read_bcast_upto8_at (param_12, b_param, param_11, param_10,
      param_9, param_8, param_7, param_6);
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++ tmp__trace);
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
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
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
      w <- (w `^` (BArray800.get256d st at));
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert, ((0 <= at) /\ ((at + 32) <= 800)))]);
      st <- (BArray800.set256d st at w);
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace___addstate_bcast_avx2x4 <-
      (trace___addstate_bcast_avx2x4 ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    b_st <- (BArray800.init_arr (W8.of_int 255));
    return (st, b_st, aT, offset, trace___addstate_bcast_avx2x4);
  }
  proc __absorb_bcast_avx2x4 (st:BArray800.t, b_st:BArray800.t, aT:int,
                              buf:BArrayS.t, b_buf:BArrayS.t,
                              _TRAILB:int, _RATE8:int) : BArray800.t *
                                                         BArray800.t * int *
                                                         trace = {
    var aux:BArray800.t;
    var aux_0:BArray800.t;
    var aux_1:int;
    var aux_2:int;
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:BArrayS.t;
    var param_3:int;
    var param_4:BArray800.t;
    var result:int;
    var result_0:int;
    var result_1:BArray800.t;
    var param_5:BArray800.t;
    var result_2:BArray800.t;
    var param_6:int;
    var param_7:int;
    var param_8:int;
    var param_9:BArrayS.t;
    var param_10:int;
    var param_11:BArray800.t;
    var result_3:int;
    var result_4:int;
    var result_5:BArray800.t;
    var param_12:BArray800.t;
    var result_6:BArray800.t;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var param_16:BArrayS.t;
    var param_17:int;
    var param_18:BArray800.t;
    var result_7:int;
    var result_8:int;
    var result_9:BArray800.t;
    var param_19:int;
    var param_20:BArray800.t;
    var result_10:BArray800.t;
    var b_result:BArray800.t;
    var b_result_0:BArray800.t;
    var b_result_1:BArray800.t;
    var b_result_2:BArray800.t;
    var b_result_3:BArray800.t;
    var b_result_4:BArray800.t;
    var trace___absorb_bcast_avx2x4:trace;
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
    trace___absorb_bcast_avx2x4 <- [];
    trace___absorb_bcast_avx2x4 <-
    (trace___absorb_bcast_avx2x4 ++
    [(Assert,
     ((((((((0 <= aT) /\ (aT < _RATE8)) /\ (0 <= _TRAILB)) /\
         (_TRAILB < 256)) /\
        (0 < _RATE8)) /\
       (_RATE8 < 200)) /\
      (BArrayS.is_init b_buf 0 size)) /\
     (BArray800.is_init b_st 0 800)))]);
    offset <- 0;
    _LEN <- size;
    if ((_RATE8 <= (aT + _LEN))) {
      param_4 <- st;
      param_3 <- aT;
      param_2 <- buf;
      param_1 <- offset;
      param_0 <- (_RATE8 - aT);
      param <- 0;
      (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_bcast_avx2x4 (
      param_4, (BArray800.init_arr (W8.of_int 255)), param_3, param_2,
      (BArrayS.init_arr (W8.of_int 255)), param_1, param_0, param);
      result_1 <- aux;
      b_result_4 <- aux_0;
      result_0 <- aux_1;
      result <- aux_2;
      trace___absorb_bcast_avx2x4 <-
      (trace___absorb_bcast_avx2x4 ++ tmp__trace);
      trace___absorb_bcast_avx2x4 <-
      (trace___absorb_bcast_avx2x4 ++
      [(Assert,
       (((0 <= param_0) /\ (param_0 <= 18446744073709551615)) /\
       (((0 <= (param_1 + param_0)) /\
        ((param_1 + param_0) <= 18446744073709551615)) /\
       (((BArray800.is_init b_result_4 0 800) /\
        (result_0 = ((param_3 + param_0) + ((param <> 0) ? 1 : 0)))) /\
       (result = (param_1 + param_0))))))]);
      trace___absorb_bcast_avx2x4 <-
      (trace___absorb_bcast_avx2x4 ++
      [(Assert, ((0 <= result) /\ (result <= 18446744073709551615)))]);
      st <- result_1;
      offset <- result;
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      param_5 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_avx2x4 (param_5,
      (BArray800.init_arr (W8.of_int 255)));
      result_2 <- aux;
      b_result_3 <- aux_0;
      trace___absorb_bcast_avx2x4 <-
      (trace___absorb_bcast_avx2x4 ++ tmp__trace);
      trace___absorb_bcast_avx2x4 <-
      (trace___absorb_bcast_avx2x4 ++
      [(Assert, (BArray800.is_init b_result_3 0 800))]);
      st <- result_2;
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      trace___absorb_bcast_avx2x4 <-
      (trace___absorb_bcast_avx2x4 ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_11 <- st;
        param_10 <- 0;
        param_9 <- buf;
        param_8 <- offset;
        param_7 <- _RATE8;
        param_6 <- 0;
        (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_bcast_avx2x4 (
        param_11, (BArray800.init_arr (W8.of_int 255)), param_10, param_9,
        (BArrayS.init_arr (W8.of_int 255)), param_8, param_7, param_6);
        result_5 <- aux;
        b_result_2 <- aux_0;
        result_4 <- aux_1;
        result_3 <- aux_2;
        trace___absorb_bcast_avx2x4 <-
        (trace___absorb_bcast_avx2x4 ++ tmp__trace);
        trace___absorb_bcast_avx2x4 <-
        (trace___absorb_bcast_avx2x4 ++
        [(Assert,
         (((0 <= param_7) /\ (param_7 <= 18446744073709551615)) /\
         (((0 <= (param_8 + param_7)) /\
          ((param_8 + param_7) <= 18446744073709551615)) /\
         (((BArray800.is_init b_result_2 0 800) /\
          (result_4 = ((param_10 + param_7) + ((param_6 <> 0) ? 1 : 0)))) /\
         (result_3 = (param_8 + param_7))))))]);
        trace___absorb_bcast_avx2x4 <-
        (trace___absorb_bcast_avx2x4 ++
        [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
        st <- result_5;
        offset <- result_3;
        param_12 <- st;
        (aux, aux_0, tmp__trace) <@ _keccakf1600_avx2x4 (param_12,
        (BArray800.init_arr (W8.of_int 255)));
        result_6 <- aux;
        b_result_1 <- aux_0;
        trace___absorb_bcast_avx2x4 <-
        (trace___absorb_bcast_avx2x4 ++ tmp__trace);
        trace___absorb_bcast_avx2x4 <-
        (trace___absorb_bcast_avx2x4 ++
        [(Assert, (BArray800.is_init b_result_1 0 800))]);
        st <- result_6;
        trace___absorb_bcast_avx2x4 <-
        (trace___absorb_bcast_avx2x4 ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace___absorb_bcast_avx2x4 <-
        (trace___absorb_bcast_avx2x4 ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    param_18 <- st;
    param_17 <- aT;
    param_16 <- buf;
    param_15 <- offset;
    param_14 <- _LEN;
    param_13 <- _TRAILB;
    (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_bcast_avx2x4 (
    param_18, (BArray800.init_arr (W8.of_int 255)), param_17, param_16,
    (BArrayS.init_arr (W8.of_int 255)), param_15, param_14, param_13);
    result_9 <- aux;
    b_result_0 <- aux_0;
    result_8 <- aux_1;
    result_7 <- aux_2;
    trace___absorb_bcast_avx2x4 <-
    (trace___absorb_bcast_avx2x4 ++ tmp__trace);
    trace___absorb_bcast_avx2x4 <-
    (trace___absorb_bcast_avx2x4 ++
    [(Assert,
     (((0 <= param_14) /\ (param_14 <= 18446744073709551615)) /\
     (((0 <= (param_15 + param_14)) /\
      ((param_15 + param_14) <= 18446744073709551615)) /\
     (((BArray800.is_init b_result_0 0 800) /\
      (result_8 = ((param_17 + param_14) + ((param_13 <> 0) ? 1 : 0)))) /\
     (result_7 = (param_15 + param_14))))))]);
    trace___absorb_bcast_avx2x4 <-
    (trace___absorb_bcast_avx2x4 ++
    [(Assert, ((0 <= result_7) /\ (result_7 <= 18446744073709551615)))]);
    st <- result_9;
    aT <- result_8;
    if ((_TRAILB <> 0)) {
      param_20 <- st;
      param_19 <- _RATE8;
      (aux, aux_0, tmp__trace) <@ __addratebit_avx2x4 (param_20,
      (BArray800.init_arr (W8.of_int 255)), param_19);
      result_10 <- aux;
      b_result <- aux_0;
      trace___absorb_bcast_avx2x4 <-
      (trace___absorb_bcast_avx2x4 ++ tmp__trace);
      trace___absorb_bcast_avx2x4 <-
      (trace___absorb_bcast_avx2x4 ++
      [(Assert, (BArray800.is_init b_result 0 800))]);
      st <- result_10;
    } else {
      
    }
    b_st <- (BArray800.init_arr (W8.of_int 255));
    return (st, b_st, aT, trace___absorb_bcast_avx2x4);
  }
  proc __addstate_avx2x4 (st:BArray800.t, b_st:BArray800.t, aT:int,
                          buf0:BArrayS.t, b_buf0:BArrayS.t,
                          buf1:BArrayS.t, b_buf1:BArrayS.t,
                          buf2:BArrayS.t, b_buf2:BArrayS.t,
                          buf3:BArrayS.t, b_buf3:BArrayS.t, offset:int,
                          _LEN:int, _TRAILB:int) : BArray800.t *
                                                   BArray800.t * int * int *
                                                   trace = {
    var dELTA:int;
    var aT8:int;
    var t0:W64.t;
    var t1:W64.t;
    var t2:W64.t;
    var t3:W64.t;
    var at:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:int;
    var param_3:int;
    var param_4:int;
    var param_5:BArrayS.t;
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
    var param_12:BArrayS.t;
    var result_4:W64.t;
    var result_5:int;
    var result_6:int;
    var result_7:int;
    var result_8:int;
    var param_13:int;
    var param_14:int;
    var param_15:int;
    var param_16:int;
    var param_17:int;
    var param_18:int;
    var param_19:BArrayS.t;
    var result_9:W64.t;
    var result_10:int;
    var result_11:int;
    var result_12:int;
    var result_13:int;
    var param_20:int;
    var param_21:int;
    var param_22:int;
    var param_23:int;
    var param_24:int;
    var param_25:int;
    var param_26:BArrayS.t;
    var result_14:W64.t;
    var result_15:int;
    var result_16:int;
    var result_17:int;
    var result_18:int;
    var param_27:int;
    var param_28:int;
    var param_29:int;
    var param_30:int;
    var param_31:int;
    var param_32:int;
    var param_33:BArrayS.t;
    var result_19:W64.t;
    var result_20:int;
    var result_21:int;
    var result_22:int;
    var result_23:int;
    var param_34:int;
    var param_35:int;
    var param_36:int;
    var param_37:int;
    var param_38:int;
    var param_39:int;
    var param_40:BArrayS.t;
    var result_24:W64.t;
    var result_25:int;
    var result_26:int;
    var result_27:int;
    var result_28:int;
    var param_41:int;
    var param_42:int;
    var param_43:int;
    var param_44:int;
    var param_45:int;
    var param_46:int;
    var param_47:BArrayS.t;
    var result_29:W64.t;
    var result_30:int;
    var result_31:int;
    var result_32:int;
    var result_33:int;
    var param_48:int;
    var param_49:int;
    var param_50:int;
    var param_51:int;
    var param_52:int;
    var param_53:int;
    var param_54:BArrayS.t;
    var result_34:W64.t;
    var result_35:int;
    var result_36:int;
    var result_37:int;
    var result_38:int;
    var b_param:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_param_1:BArrayS.t;
    var b_param_2:BArrayS.t;
    var b_param_3:BArrayS.t;
    var b_param_4:BArrayS.t;
    var b_param_5:BArrayS.t;
    var b_param_6:BArrayS.t;
    var trace___addstate_avx2x4:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_param_3 <- witness;
    b_param_4 <- witness;
    b_param_5 <- witness;
    b_param_6 <- witness;
    param_5 <- witness;
    param_12 <- witness;
    param_19 <- witness;
    param_26 <- witness;
    param_33 <- witness;
    param_40 <- witness;
    param_47 <- witness;
    param_54 <- witness;
    trace___addstate_avx2x4 <- [];
    trace___addstate_avx2x4 <-
    (trace___addstate_avx2x4 ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     ((((((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= size)) /\
         (BArray800.is_init b_st 0 800)) /\
        (BArrayS.is_init b_buf0 offset _LEN)) /\
       (BArrayS.is_init b_buf1 offset _LEN)) /\
      (BArrayS.is_init b_buf2 offset _LEN)) /\
     (BArrayS.is_init b_buf3 offset _LEN)))))]);
    trace___addstate_avx2x4 <-
    (trace___addstate_avx2x4 ++
    [(Assert,
     ((((0 <= _TRAILB) /\ (_TRAILB < 256)) /\ (0 <= aT)) /\
     (((aT + _LEN) + ((_TRAILB <> 0) ? 1 : 0)) < 200)))]);
    trace___addstate_avx2x4 <-
    (trace___addstate_avx2x4 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if (((aT8 %% 8) <> 0)) {
      b_param_6 <- b_buf0;
      param_5 <- buf0;
      param_4 <- offset;
      param_3 <- dELTA;
      param_2 <- _LEN;
      param_1 <- _TRAILB;
      param_0 <- aT;
      param <- aT8;
      (result_3, result_2, result_1, result_0, result, tmp__trace) <@ 
      __a_ilen_read_upto8_at (param_5, b_param_6, param_4, param_3, param_2,
      param_1, param_0, param);
      trace___addstate_avx2x4 <- (trace___addstate_avx2x4 ++ tmp__trace);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
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
      t0 <- result;
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * (aT %/ 8)) * 8)) /\ ((((4 * (aT %/ 8)) * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * (aT %/ 8)) * 8)) /\ ((((4 * (aT %/ 8)) * 8) + 8) <= 800)))]);
      st <-
      (BArray800.set64 st (4 * (aT %/ 8))
      ((BArray800.get64 st (4 * (aT %/ 8))) `^` t0));
      b_param_5 <- b_buf1;
      param_12 <- buf1;
      param_11 <- offset;
      param_10 <- dELTA;
      param_9 <- _LEN;
      param_8 <- _TRAILB;
      param_7 <- aT;
      param_6 <- aT8;
      (result_8, result_7, result_6, result_5, result_4, tmp__trace) <@ 
      __a_ilen_read_upto8_at (param_12, b_param_5, param_11, param_10,
      param_9, param_8, param_7, param_6);
      trace___addstate_avx2x4 <- (trace___addstate_avx2x4 ++ tmp__trace);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
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
      t1 <- result_4;
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       ((0 <= (((4 * (aT %/ 8)) + 1) * 8)) /\
       (((((4 * (aT %/ 8)) + 1) * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       ((0 <= (((4 * (aT %/ 8)) + 1) * 8)) /\
       (((((4 * (aT %/ 8)) + 1) * 8) + 8) <= 800)))]);
      st <-
      (BArray800.set64 st ((4 * (aT %/ 8)) + 1)
      ((BArray800.get64 st ((4 * (aT %/ 8)) + 1)) `^` t1));
      b_param_4 <- b_buf2;
      param_19 <- buf2;
      param_18 <- offset;
      param_17 <- dELTA;
      param_16 <- _LEN;
      param_15 <- _TRAILB;
      param_14 <- aT;
      param_13 <- aT8;
      (result_13, result_12, result_11, result_10, result_9, tmp__trace) <@ 
      __a_ilen_read_upto8_at (param_19, b_param_4, param_18, param_17,
      param_16, param_15, param_14, param_13);
      trace___addstate_avx2x4 <- (trace___addstate_avx2x4 ++ tmp__trace);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       (((param_14 <= param_13) /\ (param_13 < (param_14 + 8))) ? (((
                                                                    (
                                                                    result_13 =
                                                                    (
                                                                    param_17 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_16 <
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) ? 
                                                                    param_16 : 
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_16 <
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) ? 
                                                                    param_16 : 
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14)))))) /\
                                                                    (
                                                                    result_12 =
                                                                    (
                                                                    param_16 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_16 <
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) ? 
                                                                    param_16 : 
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_16 <
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))) ? 
                                                                    param_16 : 
                                                                    (8 -
                                                                    (
                                                                    param_13 -
                                                                    param_14))))))) /\
                                                                   (result_11 =
                                                                   ((8 <=
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16)) ? 
                                                                   param_15 : 0))) /\
                                                                  (result_10 =
                                                                  (param_14 +
                                                                  (((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16)) \/
                                                                    (
                                                                    param_15 =
                                                                    0)) ? 0 : 1)) <
                                                                   0) ? 0 : 
                                                                  (((
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16) <
                                                                    8) ? 
                                                                   ((
                                                                    param_13 -
                                                                    param_14) +
                                                                   param_16) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_13 -
                                                                    param_14) +
                                                                    param_16)) \/
                                                                   (param_15 =
                                                                   0)) ? 0 : 1)))))) : 
       ((((result_13 = param_17) /\ (result_12 = param_16)) /\
        (result_11 = param_15)) /\
       (result_10 = param_13))))]);
      t2 <- result_9;
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       ((0 <= (((4 * (aT %/ 8)) + 2) * 8)) /\
       (((((4 * (aT %/ 8)) + 2) * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       ((0 <= (((4 * (aT %/ 8)) + 2) * 8)) /\
       (((((4 * (aT %/ 8)) + 2) * 8) + 8) <= 800)))]);
      st <-
      (BArray800.set64 st ((4 * (aT %/ 8)) + 2)
      ((BArray800.get64 st ((4 * (aT %/ 8)) + 2)) `^` t2));
      b_param_3 <- b_buf3;
      param_26 <- buf3;
      param_25 <- offset;
      param_24 <- dELTA;
      param_23 <- _LEN;
      param_22 <- _TRAILB;
      param_21 <- aT;
      param_20 <- aT8;
      (result_18, result_17, result_16, result_15, result_14, tmp__trace) <@ 
      __a_ilen_read_upto8_at (param_26, b_param_3, param_25, param_24,
      param_23, param_22, param_21, param_20);
      trace___addstate_avx2x4 <- (trace___addstate_avx2x4 ++ tmp__trace);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       (((param_21 <= param_20) /\ (param_20 < (param_21 + 8))) ? (((
                                                                    (
                                                                    result_18 =
                                                                    (
                                                                    param_24 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_23 <
                                                                    (8 -
                                                                    (
                                                                    param_20 -
                                                                    param_21))) ? 
                                                                    param_23 : 
                                                                    (8 -
                                                                    (
                                                                    param_20 -
                                                                    param_21))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_23 <
                                                                    (8 -
                                                                    (
                                                                    param_20 -
                                                                    param_21))) ? 
                                                                    param_23 : 
                                                                    (8 -
                                                                    (
                                                                    param_20 -
                                                                    param_21)))))) /\
                                                                    (
                                                                    result_17 =
                                                                    (
                                                                    param_23 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_23 <
                                                                    (8 -
                                                                    (
                                                                    param_20 -
                                                                    param_21))) ? 
                                                                    param_23 : 
                                                                    (8 -
                                                                    (
                                                                    param_20 -
                                                                    param_21))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_23 <
                                                                    (8 -
                                                                    (
                                                                    param_20 -
                                                                    param_21))) ? 
                                                                    param_23 : 
                                                                    (8 -
                                                                    (
                                                                    param_20 -
                                                                    param_21))))))) /\
                                                                   (result_16 =
                                                                   ((8 <=
                                                                    (
                                                                    (
                                                                    param_20 -
                                                                    param_21) +
                                                                    param_23)) ? 
                                                                   param_22 : 0))) /\
                                                                  (result_15 =
                                                                  (param_21 +
                                                                  (((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_20 -
                                                                    param_21) +
                                                                    param_23) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_20 -
                                                                    param_21) +
                                                                    param_23) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_20 -
                                                                    param_21) +
                                                                    param_23)) \/
                                                                    (
                                                                    param_22 =
                                                                    0)) ? 0 : 1)) <
                                                                   0) ? 0 : 
                                                                  (((
                                                                    (
                                                                    (
                                                                    param_20 -
                                                                    param_21) +
                                                                    param_23) <
                                                                    8) ? 
                                                                   ((
                                                                    param_20 -
                                                                    param_21) +
                                                                   param_23) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_20 -
                                                                    param_21) +
                                                                    param_23)) \/
                                                                   (param_22 =
                                                                   0)) ? 0 : 1)))))) : 
       ((((result_18 = param_24) /\ (result_17 = param_23)) /\
        (result_16 = param_22)) /\
       (result_15 = param_20))))]);
      dELTA <- result_18;
      _LEN <- result_17;
      _TRAILB <- result_16;
      aT8 <- result_15;
      t3 <- result_14;
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       ((0 <= (((4 * (aT %/ 8)) + 3) * 8)) /\
       (((((4 * (aT %/ 8)) + 3) * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       ((0 <= (((4 * (aT %/ 8)) + 3) * 8)) /\
       (((((4 * (aT %/ 8)) + 3) * 8) + 8) <= 800)))]);
      st <-
      (BArray800.set64 st ((4 * (aT %/ 8)) + 3)
      ((BArray800.get64 st ((4 * (aT %/ 8)) + 3)) `^` t3));
      aT <- aT8;
    } else {
      
    }
    trace___addstate_avx2x4 <-
    (trace___addstate_avx2x4 ++
    [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
    trace___addstate_avx2x4 <-
    (trace___addstate_avx2x4 ++
    [(Assert,
     ((0 <= (offset + dELTA)) /\ ((offset + dELTA) <= 18446744073709551615)))]);
    offset <- (offset + dELTA);
    trace___addstate_avx2x4 <-
    (trace___addstate_avx2x4 ++
    [(Assert,
     ((0 <= (4 * (aT %/ 8))) /\ ((4 * (aT %/ 8)) <= 18446744073709551615)))]);
    at <- (4 * (aT %/ 8));
    trace___addstate_avx2x4 <-
    (trace___addstate_avx2x4 ++
    [(Assert,
     ((0 <= ((4 * (aT %/ 8)) + (4 * (_LEN %/ 8)))) /\
     (((4 * (aT %/ 8)) + (4 * (_LEN %/ 8))) <= 18446744073709551615)))]);
    while ((at < ((4 * (aT %/ 8)) + (4 * (_LEN %/ 8))))) {
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, (BArrayS.is_init b_buf0 offset 8))]);
      t0 <- (BArrayS.get64d buf0 offset);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
      st <- (BArray800.set64 st at ((BArray800.get64 st at) `^` t0));
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, (BArrayS.is_init b_buf1 offset 8))]);
      t1 <- (BArrayS.get64d buf1 offset);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
      st <-
      (BArray800.set64 st (at + 1) ((BArray800.get64 st (at + 1)) `^` t1));
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, (BArrayS.is_init b_buf2 offset 8))]);
      t2 <- (BArrayS.get64d buf2 offset);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
      st <-
      (BArray800.set64 st (at + 2) ((BArray800.get64 st (at + 2)) `^` t2));
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, (BArrayS.is_init b_buf3 offset 8))]);
      t3 <- (BArrayS.get64d buf3 offset);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
      st <-
      (BArray800.set64 st (at + 3) ((BArray800.get64 st (at + 3)) `^` t3));
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 4)) /\ ((at + 4) <= 18446744073709551615)))]);
      at <- (at + 4);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * (aT %/ 8)) + (4 * (_LEN %/ 8)))) /\
       (((4 * (aT %/ 8)) + (4 * (_LEN %/ 8))) <= 18446744073709551615)))]);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      b_param_2 <- b_buf0;
      param_33 <- buf0;
      param_32 <- offset;
      param_31 <- 0;
      param_30 <- _LEN;
      param_29 <- _TRAILB;
      param_28 <- aT;
      param_27 <- aT;
      (result_23, result_22, result_21, result_20, result_19, tmp__trace) <@ 
      __a_ilen_read_upto8_at (param_33, b_param_2, param_32, param_31,
      param_30, param_29, param_28, param_27);
      trace___addstate_avx2x4 <- (trace___addstate_avx2x4 ++ tmp__trace);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       (((param_28 <= param_27) /\ (param_27 < (param_28 + 8))) ? (((
                                                                    (
                                                                    result_23 =
                                                                    (
                                                                    param_31 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_30 <
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) ? 
                                                                    param_30 : 
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_30 <
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) ? 
                                                                    param_30 : 
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28)))))) /\
                                                                    (
                                                                    result_22 =
                                                                    (
                                                                    param_30 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_30 <
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) ? 
                                                                    param_30 : 
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_30 <
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))) ? 
                                                                    param_30 : 
                                                                    (8 -
                                                                    (
                                                                    param_27 -
                                                                    param_28))))))) /\
                                                                   (result_21 =
                                                                   ((8 <=
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30)) ? 
                                                                   param_29 : 0))) /\
                                                                  (result_20 =
                                                                  (param_28 +
                                                                  (((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30)) \/
                                                                    (
                                                                    param_29 =
                                                                    0)) ? 0 : 1)) <
                                                                   0) ? 0 : 
                                                                  (((
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30) <
                                                                    8) ? 
                                                                   ((
                                                                    param_27 -
                                                                    param_28) +
                                                                   param_30) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_27 -
                                                                    param_28) +
                                                                    param_30)) \/
                                                                   (param_29 =
                                                                   0)) ? 0 : 1)))))) : 
       ((((result_23 = param_31) /\ (result_22 = param_30)) /\
        (result_21 = param_29)) /\
       (result_20 = param_27))))]);
      t0 <- result_19;
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= at) /\ (at <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at * 8)) /\ (((at * 8) + 8) <= 800)))]);
      st <- (BArray800.set64 st at ((BArray800.get64 st at) `^` t0));
      b_param_1 <- b_buf1;
      param_40 <- buf1;
      param_39 <- offset;
      param_38 <- 0;
      param_37 <- _LEN;
      param_36 <- _TRAILB;
      param_35 <- aT;
      param_34 <- aT;
      (result_28, result_27, result_26, result_25, result_24, tmp__trace) <@ 
      __a_ilen_read_upto8_at (param_40, b_param_1, param_39, param_38,
      param_37, param_36, param_35, param_34);
      trace___addstate_avx2x4 <- (trace___addstate_avx2x4 ++ tmp__trace);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       (((param_35 <= param_34) /\ (param_34 < (param_35 + 8))) ? (((
                                                                    (
                                                                    result_28 =
                                                                    (
                                                                    param_38 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_37 <
                                                                    (8 -
                                                                    (
                                                                    param_34 -
                                                                    param_35))) ? 
                                                                    param_37 : 
                                                                    (8 -
                                                                    (
                                                                    param_34 -
                                                                    param_35))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_37 <
                                                                    (8 -
                                                                    (
                                                                    param_34 -
                                                                    param_35))) ? 
                                                                    param_37 : 
                                                                    (8 -
                                                                    (
                                                                    param_34 -
                                                                    param_35)))))) /\
                                                                    (
                                                                    result_27 =
                                                                    (
                                                                    param_37 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_37 <
                                                                    (8 -
                                                                    (
                                                                    param_34 -
                                                                    param_35))) ? 
                                                                    param_37 : 
                                                                    (8 -
                                                                    (
                                                                    param_34 -
                                                                    param_35))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_37 <
                                                                    (8 -
                                                                    (
                                                                    param_34 -
                                                                    param_35))) ? 
                                                                    param_37 : 
                                                                    (8 -
                                                                    (
                                                                    param_34 -
                                                                    param_35))))))) /\
                                                                   (result_26 =
                                                                   ((8 <=
                                                                    (
                                                                    (
                                                                    param_34 -
                                                                    param_35) +
                                                                    param_37)) ? 
                                                                   param_36 : 0))) /\
                                                                  (result_25 =
                                                                  (param_35 +
                                                                  (((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_34 -
                                                                    param_35) +
                                                                    param_37) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_34 -
                                                                    param_35) +
                                                                    param_37) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_34 -
                                                                    param_35) +
                                                                    param_37)) \/
                                                                    (
                                                                    param_36 =
                                                                    0)) ? 0 : 1)) <
                                                                   0) ? 0 : 
                                                                  (((
                                                                    (
                                                                    (
                                                                    param_34 -
                                                                    param_35) +
                                                                    param_37) <
                                                                    8) ? 
                                                                   ((
                                                                    param_34 -
                                                                    param_35) +
                                                                   param_37) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_34 -
                                                                    param_35) +
                                                                    param_37)) \/
                                                                   (param_36 =
                                                                   0)) ? 0 : 1)))))) : 
       ((((result_28 = param_38) /\ (result_27 = param_37)) /\
        (result_26 = param_36)) /\
       (result_25 = param_34))))]);
      t1 <- result_24;
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 1)) /\ ((at + 1) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 1) * 8)) /\ ((((at + 1) * 8) + 8) <= 800)))]);
      st <-
      (BArray800.set64 st (at + 1) ((BArray800.get64 st (at + 1)) `^` t1));
      b_param_0 <- b_buf2;
      param_47 <- buf2;
      param_46 <- offset;
      param_45 <- 0;
      param_44 <- _LEN;
      param_43 <- _TRAILB;
      param_42 <- aT;
      param_41 <- aT;
      (result_33, result_32, result_31, result_30, result_29, tmp__trace) <@ 
      __a_ilen_read_upto8_at (param_47, b_param_0, param_46, param_45,
      param_44, param_43, param_42, param_41);
      trace___addstate_avx2x4 <- (trace___addstate_avx2x4 ++ tmp__trace);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       (((param_42 <= param_41) /\ (param_41 < (param_42 + 8))) ? (((
                                                                    (
                                                                    result_33 =
                                                                    (
                                                                    param_45 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_44 <
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) ? 
                                                                    param_44 : 
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_44 <
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) ? 
                                                                    param_44 : 
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42)))))) /\
                                                                    (
                                                                    result_32 =
                                                                    (
                                                                    param_44 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_44 <
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) ? 
                                                                    param_44 : 
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_44 <
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))) ? 
                                                                    param_44 : 
                                                                    (8 -
                                                                    (
                                                                    param_41 -
                                                                    param_42))))))) /\
                                                                   (result_31 =
                                                                   ((8 <=
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44)) ? 
                                                                   param_43 : 0))) /\
                                                                  (result_30 =
                                                                  (param_42 +
                                                                  (((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44)) \/
                                                                    (
                                                                    param_43 =
                                                                    0)) ? 0 : 1)) <
                                                                   0) ? 0 : 
                                                                  (((
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44) <
                                                                    8) ? 
                                                                   ((
                                                                    param_41 -
                                                                    param_42) +
                                                                   param_44) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_41 -
                                                                    param_42) +
                                                                    param_44)) \/
                                                                   (param_43 =
                                                                   0)) ? 0 : 1)))))) : 
       ((((result_33 = param_45) /\ (result_32 = param_44)) /\
        (result_31 = param_43)) /\
       (result_30 = param_41))))]);
      t2 <- result_29;
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 2)) /\ ((at + 2) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 2) * 8)) /\ ((((at + 2) * 8) + 8) <= 800)))]);
      st <-
      (BArray800.set64 st (at + 2) ((BArray800.get64 st (at + 2)) `^` t2));
      b_param <- b_buf3;
      param_54 <- buf3;
      param_53 <- offset;
      param_52 <- 0;
      param_51 <- _LEN;
      param_50 <- _TRAILB;
      param_49 <- aT;
      param_48 <- aT;
      (result_38, result_37, result_36, result_35, result_34, tmp__trace) <@ 
      __a_ilen_read_upto8_at (param_54, b_param, param_53, param_52,
      param_51, param_50, param_49, param_48);
      trace___addstate_avx2x4 <- (trace___addstate_avx2x4 ++ tmp__trace);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       (((param_49 <= param_48) /\ (param_48 < (param_49 + 8))) ? (((
                                                                    (
                                                                    result_38 =
                                                                    (
                                                                    param_52 +
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_51 <
                                                                    (8 -
                                                                    (
                                                                    param_48 -
                                                                    param_49))) ? 
                                                                    param_51 : 
                                                                    (8 -
                                                                    (
                                                                    param_48 -
                                                                    param_49))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_51 <
                                                                    (8 -
                                                                    (
                                                                    param_48 -
                                                                    param_49))) ? 
                                                                    param_51 : 
                                                                    (8 -
                                                                    (
                                                                    param_48 -
                                                                    param_49)))))) /\
                                                                    (
                                                                    result_37 =
                                                                    (
                                                                    param_51 -
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_51 <
                                                                    (8 -
                                                                    (
                                                                    param_48 -
                                                                    param_49))) ? 
                                                                    param_51 : 
                                                                    (8 -
                                                                    (
                                                                    param_48 -
                                                                    param_49))) <
                                                                    0) ? 0 : 
                                                                    (
                                                                    (
                                                                    param_51 <
                                                                    (8 -
                                                                    (
                                                                    param_48 -
                                                                    param_49))) ? 
                                                                    param_51 : 
                                                                    (8 -
                                                                    (
                                                                    param_48 -
                                                                    param_49))))))) /\
                                                                   (result_36 =
                                                                   ((8 <=
                                                                    (
                                                                    (
                                                                    param_48 -
                                                                    param_49) +
                                                                    param_51)) ? 
                                                                   param_50 : 0))) /\
                                                                  (result_35 =
                                                                  (param_49 +
                                                                  (((
                                                                    (
                                                                    (
                                                                    (
                                                                    (
                                                                    param_48 -
                                                                    param_49) +
                                                                    param_51) <
                                                                    8) ? 
                                                                    (
                                                                    (
                                                                    param_48 -
                                                                    param_49) +
                                                                    param_51) : 8) +
                                                                    (
                                                                    (
                                                                    (8 <=
                                                                    (
                                                                    (
                                                                    param_48 -
                                                                    param_49) +
                                                                    param_51)) \/
                                                                    (
                                                                    param_50 =
                                                                    0)) ? 0 : 1)) <
                                                                   0) ? 0 : 
                                                                  (((
                                                                    (
                                                                    (
                                                                    param_48 -
                                                                    param_49) +
                                                                    param_51) <
                                                                    8) ? 
                                                                   ((
                                                                    param_48 -
                                                                    param_49) +
                                                                   param_51) : 8) +
                                                                  (((8 <=
                                                                    (
                                                                    (
                                                                    param_48 -
                                                                    param_49) +
                                                                    param_51)) \/
                                                                   (param_50 =
                                                                   0)) ? 0 : 1)))))) : 
       ((((result_38 = param_52) /\ (result_37 = param_51)) /\
        (result_36 = param_50)) /\
       (result_35 = param_48))))]);
      dELTA <- result_38;
      aT <- result_35;
      t3 <- result_34;
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= (at + 3)) /\ ((at + 3) <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= ((at + 3) * 8)) /\ ((((at + 3) * 8) + 8) <= 800)))]);
      st <-
      (BArray800.set64 st (at + 3) ((BArray800.get64 st (at + 3)) `^` t3));
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert, ((0 <= dELTA) /\ (dELTA <= 18446744073709551615)))]);
      trace___addstate_avx2x4 <-
      (trace___addstate_avx2x4 ++
      [(Assert,
       ((0 <= (offset + dELTA)) /\
       ((offset + dELTA) <= 18446744073709551615)))]);
      offset <- (offset + dELTA);
    } else {
      
    }
    b_st <- (BArray800.init_arr (W8.of_int 255));
    return (st, b_st, aT, offset, trace___addstate_avx2x4);
  }
  proc __absorb_avx2x4 (st:BArray800.t, b_st:BArray800.t, aT:int,
                        buf0:BArrayS.t, b_buf0:BArrayS.t,
                        buf1:BArrayS.t, b_buf1:BArrayS.t,
                        buf2:BArrayS.t, b_buf2:BArrayS.t,
                        buf3:BArrayS.t, b_buf3:BArrayS.t, _TRAILB:int,
                        _RATE8:int) : BArray800.t * BArray800.t * int * trace = {
    var aux:BArray800.t;
    var aux_0:BArray800.t;
    var aux_1:int;
    var aux_2:int;
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var param:int;
    var param_0:int;
    var param_1:int;
    var param_2:BArrayS.t;
    var param_3:BArrayS.t;
    var param_4:BArrayS.t;
    var param_5:BArrayS.t;
    var param_6:int;
    var param_7:BArray800.t;
    var result:int;
    var result_0:int;
    var result_1:BArray800.t;
    var param_8:BArray800.t;
    var result_2:BArray800.t;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:BArrayS.t;
    var param_13:BArrayS.t;
    var param_14:BArrayS.t;
    var param_15:BArrayS.t;
    var param_16:int;
    var param_17:BArray800.t;
    var result_3:int;
    var result_4:int;
    var result_5:BArray800.t;
    var param_18:BArray800.t;
    var result_6:BArray800.t;
    var param_19:int;
    var param_20:int;
    var param_21:int;
    var param_22:BArrayS.t;
    var param_23:BArrayS.t;
    var param_24:BArrayS.t;
    var param_25:BArrayS.t;
    var param_26:int;
    var param_27:BArray800.t;
    var result_7:int;
    var result_8:int;
    var result_9:BArray800.t;
    var param_28:int;
    var param_29:BArray800.t;
    var result_10:BArray800.t;
    var b_result:BArray800.t;
    var b_result_0:BArray800.t;
    var b_result_1:BArray800.t;
    var b_result_2:BArray800.t;
    var b_result_3:BArray800.t;
    var b_result_4:BArray800.t;
    var trace___absorb_avx2x4:trace;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    b_result_3 <- witness;
    b_result_4 <- witness;
    param_2 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_7 <- witness;
    param_8 <- witness;
    param_12 <- witness;
    param_13 <- witness;
    param_14 <- witness;
    param_15 <- witness;
    param_17 <- witness;
    param_18 <- witness;
    param_22 <- witness;
    param_23 <- witness;
    param_24 <- witness;
    param_25 <- witness;
    param_27 <- witness;
    param_29 <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_5 <- witness;
    result_6 <- witness;
    result_9 <- witness;
    result_10 <- witness;
    trace___absorb_avx2x4 <- [];
    trace___absorb_avx2x4 <-
    (trace___absorb_avx2x4 ++
    [(Assert,
     (((((((((((0 < _RATE8) /\ (_RATE8 < 200)) /\ (0 <= _TRAILB)) /\
            (_TRAILB < 256)) /\
           (0 <= aT)) /\
          (aT < _RATE8)) /\
         (BArrayS.is_init b_buf0 0 size)) /\
        (BArrayS.is_init b_buf1 0 size)) /\
       (BArrayS.is_init b_buf2 0 size)) /\
      (BArrayS.is_init b_buf3 0 size)) /\
     (BArray800.is_init b_st 0 800)))]);
    offset <- 0;
    _LEN <- size;
    if ((_RATE8 <= (aT + _LEN))) {
      param_7 <- st;
      param_6 <- aT;
      param_5 <- buf0;
      param_4 <- buf1;
      param_3 <- buf2;
      param_2 <- buf3;
      param_1 <- offset;
      param_0 <- (_RATE8 - aT);
      param <- 0;
      (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_avx2x4 (param_7,
      (BArray800.init_arr (W8.of_int 255)), param_6, param_5,
      (BArrayS.init_arr (W8.of_int 255)), param_4,
      (BArrayS.init_arr (W8.of_int 255)), param_3,
      (BArrayS.init_arr (W8.of_int 255)), param_2,
      (BArrayS.init_arr (W8.of_int 255)), param_1, param_0, param);
      result_1 <- aux;
      b_result_4 <- aux_0;
      result_0 <- aux_1;
      result <- aux_2;
      trace___absorb_avx2x4 <- (trace___absorb_avx2x4 ++ tmp__trace);
      trace___absorb_avx2x4 <-
      (trace___absorb_avx2x4 ++
      [(Assert,
       (((0 <= param_0) /\ (param_0 <= 18446744073709551615)) /\
       (((0 <= (param_1 + param_0)) /\
        ((param_1 + param_0) <= 18446744073709551615)) /\
       (((BArray800.is_init b_result_4 0 800) /\
        (result_0 = ((param_6 + param_0) + ((param <> 0) ? 1 : 0)))) /\
       (result = (param_1 + param_0))))))]);
      trace___absorb_avx2x4 <-
      (trace___absorb_avx2x4 ++
      [(Assert, ((0 <= result) /\ (result <= 18446744073709551615)))]);
      st <- result_1;
      offset <- result;
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      param_8 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_avx2x4 (param_8,
      (BArray800.init_arr (W8.of_int 255)));
      result_2 <- aux;
      b_result_3 <- aux_0;
      trace___absorb_avx2x4 <- (trace___absorb_avx2x4 ++ tmp__trace);
      trace___absorb_avx2x4 <-
      (trace___absorb_avx2x4 ++
      [(Assert, (BArray800.is_init b_result_3 0 800))]);
      st <- result_2;
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      trace___absorb_avx2x4 <-
      (trace___absorb_avx2x4 ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param_17 <- st;
        param_16 <- 0;
        param_15 <- buf0;
        param_14 <- buf1;
        param_13 <- buf2;
        param_12 <- buf3;
        param_11 <- offset;
        param_10 <- _RATE8;
        param_9 <- 0;
        (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_avx2x4 (
        param_17, (BArray800.init_arr (W8.of_int 255)), param_16, param_15,
        (BArrayS.init_arr (W8.of_int 255)), param_14,
        (BArrayS.init_arr (W8.of_int 255)), param_13,
        (BArrayS.init_arr (W8.of_int 255)), param_12,
        (BArrayS.init_arr (W8.of_int 255)), param_11, param_10, param_9);
        result_5 <- aux;
        b_result_2 <- aux_0;
        result_4 <- aux_1;
        result_3 <- aux_2;
        trace___absorb_avx2x4 <- (trace___absorb_avx2x4 ++ tmp__trace);
        trace___absorb_avx2x4 <-
        (trace___absorb_avx2x4 ++
        [(Assert,
         (((0 <= param_10) /\ (param_10 <= 18446744073709551615)) /\
         (((0 <= (param_11 + param_10)) /\
          ((param_11 + param_10) <= 18446744073709551615)) /\
         (((BArray800.is_init b_result_2 0 800) /\
          (result_4 = ((param_16 + param_10) + ((param_9 <> 0) ? 1 : 0)))) /\
         (result_3 = (param_11 + param_10))))))]);
        trace___absorb_avx2x4 <-
        (trace___absorb_avx2x4 ++
        [(Assert, ((0 <= result_3) /\ (result_3 <= 18446744073709551615)))]);
        st <- result_5;
        offset <- result_3;
        param_18 <- st;
        (aux, aux_0, tmp__trace) <@ _keccakf1600_avx2x4 (param_18,
        (BArray800.init_arr (W8.of_int 255)));
        result_6 <- aux;
        b_result_1 <- aux_0;
        trace___absorb_avx2x4 <- (trace___absorb_avx2x4 ++ tmp__trace);
        trace___absorb_avx2x4 <-
        (trace___absorb_avx2x4 ++
        [(Assert, (BArray800.is_init b_result_1 0 800))]);
        st <- result_6;
        trace___absorb_avx2x4 <-
        (trace___absorb_avx2x4 ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace___absorb_avx2x4 <-
        (trace___absorb_avx2x4 ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    param_27 <- st;
    param_26 <- aT;
    param_25 <- buf0;
    param_24 <- buf1;
    param_23 <- buf2;
    param_22 <- buf3;
    param_21 <- offset;
    param_20 <- _LEN;
    param_19 <- _TRAILB;
    (aux, aux_0, aux_1, aux_2, tmp__trace) <@ __addstate_avx2x4 (param_27,
    (BArray800.init_arr (W8.of_int 255)), param_26, param_25,
    (BArrayS.init_arr (W8.of_int 255)), param_24,
    (BArrayS.init_arr (W8.of_int 255)), param_23,
    (BArrayS.init_arr (W8.of_int 255)), param_22,
    (BArrayS.init_arr (W8.of_int 255)), param_21, param_20, param_19);
    result_9 <- aux;
    b_result_0 <- aux_0;
    result_8 <- aux_1;
    result_7 <- aux_2;
    trace___absorb_avx2x4 <- (trace___absorb_avx2x4 ++ tmp__trace);
    trace___absorb_avx2x4 <-
    (trace___absorb_avx2x4 ++
    [(Assert,
     (((0 <= param_20) /\ (param_20 <= 18446744073709551615)) /\
     (((0 <= (param_21 + param_20)) /\
      ((param_21 + param_20) <= 18446744073709551615)) /\
     (((BArray800.is_init b_result_0 0 800) /\
      (result_8 = ((param_26 + param_20) + ((param_19 <> 0) ? 1 : 0)))) /\
     (result_7 = (param_21 + param_20))))))]);
    trace___absorb_avx2x4 <-
    (trace___absorb_avx2x4 ++
    [(Assert, ((0 <= result_7) /\ (result_7 <= 18446744073709551615)))]);
    st <- result_9;
    aT <- result_8;
    if ((_TRAILB <> 0)) {
      param_29 <- st;
      param_28 <- _RATE8;
      (aux, aux_0, tmp__trace) <@ __addratebit_avx2x4 (param_29,
      (BArray800.init_arr (W8.of_int 255)), param_28);
      result_10 <- aux;
      b_result <- aux_0;
      trace___absorb_avx2x4 <- (trace___absorb_avx2x4 ++ tmp__trace);
      trace___absorb_avx2x4 <-
      (trace___absorb_avx2x4 ++
      [(Assert, (BArray800.is_init b_result 0 800))]);
      st <- result_10;
    } else {
      
    }
    b_st <- (BArray800.init_arr (W8.of_int 255));
    return (st, b_st, aT, trace___absorb_avx2x4);
  }
  proc __dumpstate_avx2x4 (buf0:BArrayS.t, b_buf0:BArrayS.t,
                           buf1:BArrayS.t, b_buf1:BArrayS.t,
                           buf2:BArrayS.t, b_buf2:BArrayS.t,
                           buf3:BArrayS.t, b_buf3:BArrayS.t, offset:int,
                           _LEN:int, st:BArray800.t, b_st:BArray800.t) : 
  BArrayS.t * BArrayS.t * BArrayS.t * BArrayS.t * BArrayS.t *
  BArrayS.t * BArrayS.t * BArrayS.t * int * trace = {
    var x0:W256.t;
    var x1:W256.t;
    var x2:W256.t;
    var x3:W256.t;
    var t0:W64.t;
    var t1:W64.t;
    var t2:W64.t;
    var t3:W64.t;
    var i:int;
    var param:W256.t;
    var param_0:W256.t;
    var param_1:W256.t;
    var param_2:W256.t;
    var result:W256.t;
    var result_0:W256.t;
    var result_1:W256.t;
    var result_2:W256.t;
    var param_3:W64.t;
    var param_4:int;
    var param_5:int;
    var param_6:int;
    var param_7:BArrayS.t;
    var result_3:int;
    var result_4:int;
    var result_5:BArrayS.t;
    var param_8:W64.t;
    var param_9:int;
    var param_10:int;
    var param_11:int;
    var param_12:BArrayS.t;
    var result_6:int;
    var result_7:int;
    var result_8:BArrayS.t;
    var param_13:W64.t;
    var param_14:int;
    var param_15:int;
    var param_16:int;
    var param_17:BArrayS.t;
    var result_9:int;
    var result_10:int;
    var result_11:BArrayS.t;
    var param_18:W64.t;
    var param_19:int;
    var param_20:int;
    var param_21:int;
    var param_22:BArrayS.t;
    var result_12:int;
    var result_13:int;
    var result_14:BArrayS.t;
    var b_result:BArrayS.t;
    var b_param:BArrayS.t;
    var b_result_0:BArrayS.t;
    var b_param_0:BArrayS.t;
    var b_result_1:BArrayS.t;
    var b_param_1:BArrayS.t;
    var b_result_2:BArrayS.t;
    var b_param_2:BArrayS.t;
    var trace___dumpstate_avx2x4:trace;
    b_param <- witness;
    b_param_0 <- witness;
    b_param_1 <- witness;
    b_param_2 <- witness;
    b_result <- witness;
    b_result_0 <- witness;
    b_result_1 <- witness;
    b_result_2 <- witness;
    param_7 <- witness;
    param_12 <- witness;
    param_17 <- witness;
    param_22 <- witness;
    result_5 <- witness;
    result_8 <- witness;
    result_11 <- witness;
    result_14 <- witness;
    trace___dumpstate_avx2x4 <- [];
    trace___dumpstate_avx2x4 <-
    (trace___dumpstate_avx2x4 ++
    [(Assert,
     (((0 <= _LEN) /\ (_LEN <= 18446744073709551615)) /\
     (((0 <= (offset + _LEN)) /\ ((offset + _LEN) <= 18446744073709551615)) /\
     (((((((((0 <= offset) /\ (0 <= _LEN)) /\ ((offset + _LEN) <= size)) /\
          (BArray800.is_init b_st 0 800)) /\
         (_LEN <= 200)) /\
        (BArrayS.is_init b_buf0 0 offset)) /\
       (BArrayS.is_init b_buf1 0 offset)) /\
      (BArrayS.is_init b_buf2 0 offset)) /\
     (BArrayS.is_init b_buf3 0 offset)))))]);
    trace___dumpstate_avx2x4 <-
    (trace___dumpstate_avx2x4 ++
    [(Assert, ((0 <= offset) /\ (offset <= 18446744073709551615)))]);
    i <- 0;
    trace___dumpstate_avx2x4 <-
    (trace___dumpstate_avx2x4 ++
    [(Assert,
     ((0 <= (32 * (_LEN %/ 32))) /\
     ((32 * (_LEN %/ 32)) <= 18446744073709551615)))]);
    while ((i < (32 * (_LEN %/ 32)))) {
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ (((4 * i) + 32) <= 800)))]);
      x0 <- (BArray800.get256d st (4 * i));
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 32)) /\ (((4 * i) + 32) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 32)) /\ ((((4 * i) + 32) + 32) <= 800)))]);
      x1 <- (BArray800.get256d st ((4 * i) + 32));
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 64)) /\ (((4 * i) + 64) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 64)) /\ ((((4 * i) + 64) + 32) <= 800)))]);
      x2 <- (BArray800.get256d st ((4 * i) + 64));
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 96)) /\ (((4 * i) + 96) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 96)) /\ ((((4 * i) + 96) + 32) <= 800)))]);
      x3 <- (BArray800.get256d st ((4 * i) + 96));
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (i + 32)) /\ ((i + 32) <= 18446744073709551615)))]);
      i <- (i + 32);
      param_2 <- x0;
      param_1 <- x1;
      param_0 <- x2;
      param <- x3;
      (result_2, result_1, result_0, result, tmp__trace) <@ __4u64x4_u256x4 (
      param_2, param_1, param_0, param);
      trace___dumpstate_avx2x4 <- (trace___dumpstate_avx2x4 ++ tmp__trace);
      x0 <- result_2;
      x1 <- result_1;
      x2 <- result_0;
      x3 <- result;
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
      b_buf0 <-
      (BArrayS.set256d b_buf0 offset
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      buf0 <- (BArrayS.set256d buf0 offset x0);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
      b_buf1 <-
      (BArrayS.set256d b_buf1 offset
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      buf1 <- (BArrayS.set256d buf1 offset x1);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
      b_buf2 <-
      (BArrayS.set256d b_buf2 offset
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      buf2 <- (BArrayS.set256d buf2 offset x2);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 32) <= size)))]);
      b_buf3 <-
      (BArrayS.set256d b_buf3 offset
      (W256.of_int
      115792089237316195423570985008687907853269984665640564039457584007913129639935
      ));
      buf3 <- (BArrayS.set256d buf3 offset x3);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= (offset + 32)) /\ ((offset + 32) <= 18446744073709551615)))]);
      offset <- (offset + 32);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= (32 * (_LEN %/ 32))) /\
       ((32 * (_LEN %/ 32)) <= 18446744073709551615)))]);
    }
    trace___dumpstate_avx2x4 <-
    (trace___dumpstate_avx2x4 ++
    [(Assert,
     ((0 <= (8 * (_LEN %/ 8))) /\
     ((8 * (_LEN %/ 8)) <= 18446744073709551615)))]);
    while ((i < (8 * (_LEN %/ 8)))) {
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ (((4 * i) + 8) <= 800)))]);
      t0 <- (BArray800.get64d st (4 * i));
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      b_buf0 <-
      (BArrayS.set64d b_buf0 offset (W64.of_int 18446744073709551615));
      buf0 <- (BArrayS.set64d buf0 offset t0);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 8)) /\ (((4 * i) + 8) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 8)) /\ ((((4 * i) + 8) + 8) <= 800)))]);
      t1 <- (BArray800.get64d st ((4 * i) + 8));
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      b_buf1 <-
      (BArrayS.set64d b_buf1 offset (W64.of_int 18446744073709551615));
      buf1 <- (BArrayS.set64d buf1 offset t1);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 16)) /\ (((4 * i) + 16) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 16)) /\ ((((4 * i) + 16) + 8) <= 800)))]);
      t2 <- (BArray800.get64d st ((4 * i) + 16));
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      b_buf2 <-
      (BArrayS.set64d b_buf2 offset (W64.of_int 18446744073709551615));
      buf2 <- (BArrayS.set64d buf2 offset t2);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 24)) /\ (((4 * i) + 24) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 24)) /\ ((((4 * i) + 24) + 8) <= 800)))]);
      t3 <- (BArray800.get64d st ((4 * i) + 24));
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= offset) /\ ((offset + 8) <= size)))]);
      b_buf3 <-
      (BArrayS.set64d b_buf3 offset (W64.of_int 18446744073709551615));
      buf3 <- (BArrayS.set64d buf3 offset t3);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (i + 8)) /\ ((i + 8) <= 18446744073709551615)))]);
      i <- (i + 8);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= (offset + 8)) /\ ((offset + 8) <= 18446744073709551615)))]);
      offset <- (offset + 8);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= (8 * (_LEN %/ 8))) /\
       ((8 * (_LEN %/ 8)) <= 18446744073709551615)))]);
    }
    if ((0 < (_LEN %% 8))) {
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ (((4 * i) + 8) <= 800)))]);
      t0 <- (BArray800.get64d st (4 * i));
      b_param_2 <- b_buf0;
      param_7 <- buf0;
      param_6 <- offset;
      param_5 <- 0;
      param_4 <- (_LEN %% 8);
      param_3 <- t0;
      (result_5, b_result_2, result_4, result_3, tmp__trace) <@ __a_ilen_write_upto8 (
      param_7, b_param_2, param_6, param_5, param_4, param_3);
      trace___dumpstate_avx2x4 <- (trace___dumpstate_avx2x4 ++ tmp__trace);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       (((0 <= param_5) /\ (param_5 <= 18446744073709551615)) /\
       (((0 <= (param_6 + param_5)) /\
        ((param_6 + param_5) <= 18446744073709551615)) /\
       (((0 <=
         ((((param_4 < 8) ? param_4 : 8) < 0) ? 0 : ((param_4 < 8) ? 
                                                    param_4 : 8))) /\
        (((((param_4 < 8) ? param_4 : 8) < 0) ? 0 : ((param_4 < 8) ? 
                                                    param_4 : 8)) <=
        18446744073709551615)) /\
       (((0 <=
         ((param_6 + param_5) +
         ((((param_4 < 8) ? param_4 : 8) < 0) ? 0 : ((param_4 < 8) ? 
                                                    param_4 : 8)))) /\
        (((param_6 + param_5) +
         ((((param_4 < 8) ? param_4 : 8) < 0) ? 0 : ((param_4 < 8) ? 
                                                    param_4 : 8))) <=
        18446744073709551615)) /\
       (((result_4 =
         (param_5 +
         ((((param_4 < 8) ? param_4 : 8) < 0) ? 0 : ((param_4 < 8) ? 
                                                    param_4 : 8)))) /\
        (result_3 =
        (param_4 -
        ((((param_4 < 8) ? param_4 : 8) < 0) ? 0 : ((param_4 < 8) ? param_4 : 8))))) /\
       (BArrayS.is_init b_result_2 0
       ((param_6 + param_5) +
       ((((param_4 < 8) ? param_4 : 8) < 0) ? 0 : ((param_4 < 8) ? param_4 : 8)))
       )))))))]);
      b_buf0 <- b_result_2;
      buf0 <- result_5;
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 8)) /\ (((4 * i) + 8) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 8)) /\ ((((4 * i) + 8) + 8) <= 800)))]);
      t1 <- (BArray800.get64d st ((4 * i) + 8));
      b_param_1 <- b_buf1;
      param_12 <- buf1;
      param_11 <- offset;
      param_10 <- 0;
      param_9 <- (_LEN %% 8);
      param_8 <- t1;
      (result_8, b_result_1, result_7, result_6, tmp__trace) <@ __a_ilen_write_upto8 (
      param_12, b_param_1, param_11, param_10, param_9, param_8);
      trace___dumpstate_avx2x4 <- (trace___dumpstate_avx2x4 ++ tmp__trace);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       (((0 <= param_10) /\ (param_10 <= 18446744073709551615)) /\
       (((0 <= (param_11 + param_10)) /\
        ((param_11 + param_10) <= 18446744073709551615)) /\
       (((0 <=
         ((((param_9 < 8) ? param_9 : 8) < 0) ? 0 : ((param_9 < 8) ? 
                                                    param_9 : 8))) /\
        (((((param_9 < 8) ? param_9 : 8) < 0) ? 0 : ((param_9 < 8) ? 
                                                    param_9 : 8)) <=
        18446744073709551615)) /\
       (((0 <=
         ((param_11 + param_10) +
         ((((param_9 < 8) ? param_9 : 8) < 0) ? 0 : ((param_9 < 8) ? 
                                                    param_9 : 8)))) /\
        (((param_11 + param_10) +
         ((((param_9 < 8) ? param_9 : 8) < 0) ? 0 : ((param_9 < 8) ? 
                                                    param_9 : 8))) <=
        18446744073709551615)) /\
       (((result_7 =
         (param_10 +
         ((((param_9 < 8) ? param_9 : 8) < 0) ? 0 : ((param_9 < 8) ? 
                                                    param_9 : 8)))) /\
        (result_6 =
        (param_9 -
        ((((param_9 < 8) ? param_9 : 8) < 0) ? 0 : ((param_9 < 8) ? param_9 : 8))))) /\
       (BArrayS.is_init b_result_1 0
       ((param_11 + param_10) +
       ((((param_9 < 8) ? param_9 : 8) < 0) ? 0 : ((param_9 < 8) ? param_9 : 8)))
       )))))))]);
      b_buf1 <- b_result_1;
      buf1 <- result_8;
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 16)) /\ (((4 * i) + 16) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 16)) /\ ((((4 * i) + 16) + 8) <= 800)))]);
      t2 <- (BArray800.get64d st ((4 * i) + 16));
      b_param_0 <- b_buf2;
      param_17 <- buf2;
      param_16 <- offset;
      param_15 <- 0;
      param_14 <- (_LEN %% 8);
      param_13 <- t2;
      (result_11, b_result_0, result_10, result_9, tmp__trace) <@ __a_ilen_write_upto8 (
      param_17, b_param_0, param_16, param_15, param_14, param_13);
      trace___dumpstate_avx2x4 <- (trace___dumpstate_avx2x4 ++ tmp__trace);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       (((0 <= param_15) /\ (param_15 <= 18446744073709551615)) /\
       (((0 <= (param_16 + param_15)) /\
        ((param_16 + param_15) <= 18446744073709551615)) /\
       (((0 <=
         ((((param_14 < 8) ? param_14 : 8) < 0) ? 0 : ((param_14 < 8) ? 
                                                      param_14 : 8))) /\
        (((((param_14 < 8) ? param_14 : 8) < 0) ? 0 : ((param_14 < 8) ? 
                                                      param_14 : 8)) <=
        18446744073709551615)) /\
       (((0 <=
         ((param_16 + param_15) +
         ((((param_14 < 8) ? param_14 : 8) < 0) ? 0 : ((param_14 < 8) ? 
                                                      param_14 : 8)))) /\
        (((param_16 + param_15) +
         ((((param_14 < 8) ? param_14 : 8) < 0) ? 0 : ((param_14 < 8) ? 
                                                      param_14 : 8))) <=
        18446744073709551615)) /\
       (((result_10 =
         (param_15 +
         ((((param_14 < 8) ? param_14 : 8) < 0) ? 0 : ((param_14 < 8) ? 
                                                      param_14 : 8)))) /\
        (result_9 =
        (param_14 -
        ((((param_14 < 8) ? param_14 : 8) < 0) ? 0 : ((param_14 < 8) ? 
                                                     param_14 : 8))))) /\
       (BArrayS.is_init b_result_0 0
       ((param_16 + param_15) +
       ((((param_14 < 8) ? param_14 : 8) < 0) ? 0 : ((param_14 < 8) ? 
                                                    param_14 : 8)))
       )))))))]);
      b_buf2 <- b_result_0;
      buf2 <- result_11;
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= (4 * i)) /\ ((4 * i) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= ((4 * i) + 24)) /\ (((4 * i) + 24) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert, ((0 <= ((4 * i) + 24)) /\ ((((4 * i) + 24) + 8) <= 800)))]);
      t3 <- (BArray800.get64d st ((4 * i) + 24));
      b_param <- b_buf3;
      param_22 <- buf3;
      param_21 <- offset;
      param_20 <- 0;
      param_19 <- (_LEN %% 8);
      param_18 <- t3;
      (result_14, b_result, result_13, result_12, tmp__trace) <@ __a_ilen_write_upto8 (
      param_22, b_param, param_21, param_20, param_19, param_18);
      trace___dumpstate_avx2x4 <- (trace___dumpstate_avx2x4 ++ tmp__trace);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       (((0 <= param_20) /\ (param_20 <= 18446744073709551615)) /\
       (((0 <= (param_21 + param_20)) /\
        ((param_21 + param_20) <= 18446744073709551615)) /\
       (((0 <=
         ((((param_19 < 8) ? param_19 : 8) < 0) ? 0 : ((param_19 < 8) ? 
                                                      param_19 : 8))) /\
        (((((param_19 < 8) ? param_19 : 8) < 0) ? 0 : ((param_19 < 8) ? 
                                                      param_19 : 8)) <=
        18446744073709551615)) /\
       (((0 <=
         ((param_21 + param_20) +
         ((((param_19 < 8) ? param_19 : 8) < 0) ? 0 : ((param_19 < 8) ? 
                                                      param_19 : 8)))) /\
        (((param_21 + param_20) +
         ((((param_19 < 8) ? param_19 : 8) < 0) ? 0 : ((param_19 < 8) ? 
                                                      param_19 : 8))) <=
        18446744073709551615)) /\
       (((result_13 =
         (param_20 +
         ((((param_19 < 8) ? param_19 : 8) < 0) ? 0 : ((param_19 < 8) ? 
                                                      param_19 : 8)))) /\
        (result_12 =
        (param_19 -
        ((((param_19 < 8) ? param_19 : 8) < 0) ? 0 : ((param_19 < 8) ? 
                                                     param_19 : 8))))) /\
       (BArrayS.is_init b_result 0
       ((param_21 + param_20) +
       ((((param_19 < 8) ? param_19 : 8) < 0) ? 0 : ((param_19 < 8) ? 
                                                    param_19 : 8)))
       )))))))]);
      b_buf3 <- b_result;
      buf3 <- result_14;
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= (_LEN %% 8)) /\ ((_LEN %% 8) <= 18446744073709551615)))]);
      trace___dumpstate_avx2x4 <-
      (trace___dumpstate_avx2x4 ++
      [(Assert,
       ((0 <= (offset + (_LEN %% 8))) /\
       ((offset + (_LEN %% 8)) <= 18446744073709551615)))]);
      offset <- (offset + (_LEN %% 8));
    } else {
      
    }
    return (buf0, b_buf0, buf1, b_buf1, buf2, b_buf2, buf3, b_buf3, offset,
           trace___dumpstate_avx2x4);
  }
  proc __squeeze_avx2x4 (st:BArray800.t, b_st:BArray800.t, buf0:BArrayS.t,
                         b_buf0:BArrayS.t, buf1:BArrayS.t,
                         b_buf1:BArrayS.t, buf2:BArrayS.t,
                         b_buf2:BArrayS.t, buf3:BArrayS.t,
                         b_buf3:BArrayS.t, _RATE8:int) : BArray800.t *
                                                           BArray800.t *
                                                           BArrayS.t *
                                                           BArrayS.t *
                                                           BArrayS.t *
                                                           BArrayS.t *
                                                           BArrayS.t *
                                                           BArrayS.t *
                                                           BArrayS.t *
                                                           BArrayS.t *
                                                           trace = {
    var aux:BArray800.t;
    var aux_0:BArray800.t;
    var _LEN:int;
    var iTERS:int;
    var lO:int;
    var offset:int;
    var i:int;
    var param:BArray800.t;
    var result:BArray800.t;
    var param_0:BArray800.t;
    var param_1:int;
    var param_2:int;
    var param_3:BArrayS.t;
    var param_4:BArrayS.t;
    var param_5:BArrayS.t;
    var param_6:BArrayS.t;
    var result_0:int;
    var result_1:BArrayS.t;
    var result_2:BArrayS.t;
    var result_3:BArrayS.t;
    var result_4:BArrayS.t;
    var param_7:BArray800.t;
    var result_5:BArray800.t;
    var param_8:BArray800.t;
    var param_9:int;
    var param_10:int;
    var param_11:BArrayS.t;
    var param_12:BArrayS.t;
    var param_13:BArrayS.t;
    var param_14:BArrayS.t;
    var result_6:int;
    var result_7:BArrayS.t;
    var result_8:BArrayS.t;
    var result_9:BArrayS.t;
    var result_10:BArrayS.t;
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
    var trace___squeeze_avx2x4:trace;
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
    param_0 <- witness;
    param_3 <- witness;
    param_4 <- witness;
    param_5 <- witness;
    param_6 <- witness;
    param_7 <- witness;
    param_8 <- witness;
    param_11 <- witness;
    param_12 <- witness;
    param_13 <- witness;
    param_14 <- witness;
    result <- witness;
    result_1 <- witness;
    result_2 <- witness;
    result_3 <- witness;
    result_4 <- witness;
    result_5 <- witness;
    result_7 <- witness;
    result_8 <- witness;
    result_9 <- witness;
    result_10 <- witness;
    trace___squeeze_avx2x4 <- [];
    trace___squeeze_avx2x4 <-
    (trace___squeeze_avx2x4 ++
    [(Assert,
     (((0 < _RATE8) /\ (_RATE8 < 200)) /\ (BArray800.is_init b_st 0 800)))]);
    offset <- 0;
    _LEN <- size;
    iTERS <- (_LEN %/ _RATE8);
    lO <- (_LEN %% _RATE8);
    if ((0 < iTERS)) {
      i <- 0;
      trace___squeeze_avx2x4 <-
      (trace___squeeze_avx2x4 ++
      [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      while ((i < iTERS)) {
        param <- st;
        (aux, aux_0, tmp__trace) <@ _keccakf1600_avx2x4 (param,
        (BArray800.init_arr (W8.of_int 255)));
        result <- aux;
        b_result_8 <- aux_0;
        trace___squeeze_avx2x4 <- (trace___squeeze_avx2x4 ++ tmp__trace);
        trace___squeeze_avx2x4 <-
        (trace___squeeze_avx2x4 ++
        [(Assert, (BArray800.is_init b_result_8 0 800))]);
        st <- result;
        b_param_6 <- b_buf0;
        param_6 <- buf0;
        b_param_5 <- b_buf1;
        param_5 <- buf1;
        b_param_4 <- b_buf2;
        param_4 <- buf2;
        b_param_3 <- b_buf3;
        param_3 <- buf3;
        param_2 <- offset;
        param_1 <- _RATE8;
        param_0 <- st;
        (result_4, b_result_7, result_3, b_result_6, result_2, b_result_5,
        result_1, b_result_4, result_0, tmp__trace) <@ __dumpstate_avx2x4 (
        param_6, b_param_6, param_5, b_param_5, param_4, b_param_4, param_3,
        b_param_3, param_2, param_1, param_0,
        (BArray800.init_arr (W8.of_int 255)));
        trace___squeeze_avx2x4 <- (trace___squeeze_avx2x4 ++ tmp__trace);
        trace___squeeze_avx2x4 <-
        (trace___squeeze_avx2x4 ++
        [(Assert,
         (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
         (((0 <= (param_2 + param_1)) /\
          ((param_2 + param_1) <= 18446744073709551615)) /\
         (result_0 = (param_2 + param_1)))))]);
        trace___squeeze_avx2x4 <-
        (trace___squeeze_avx2x4 ++
        [(Assert,
         (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
         (((0 <= (param_2 + param_1)) /\
          ((param_2 + param_1) <= 18446744073709551615)) /\
         (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
         (((0 <= (param_2 + param_1)) /\
          ((param_2 + param_1) <= 18446744073709551615)) /\
         (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
         (((0 <= (param_2 + param_1)) /\
          ((param_2 + param_1) <= 18446744073709551615)) /\
         (((0 <= param_1) /\ (param_1 <= 18446744073709551615)) /\
         (((0 <= (param_2 + param_1)) /\
          ((param_2 + param_1) <= 18446744073709551615)) /\
         ((((BArrayS.is_init b_result_7 0 (param_2 + param_1)) /\
           (BArrayS.is_init b_result_6 0 (param_2 + param_1))) /\
          (BArrayS.is_init b_result_5 0 (param_2 + param_1))) /\
         (BArrayS.is_init b_result_4 0 (param_2 + param_1))))))))))))]);
        trace___squeeze_avx2x4 <-
        (trace___squeeze_avx2x4 ++
        [(Assert, ((0 <= result_0) /\ (result_0 <= 18446744073709551615)))]);
        b_buf0 <- b_result_7;
        buf0 <- result_4;
        b_buf1 <- b_result_6;
        buf1 <- result_3;
        b_buf2 <- b_result_5;
        buf2 <- result_2;
        b_buf3 <- b_result_4;
        buf3 <- result_1;
        offset <- result_0;
        trace___squeeze_avx2x4 <-
        (trace___squeeze_avx2x4 ++
        [(Assert, ((0 <= (i + 1)) /\ ((i + 1) <= 18446744073709551615)))]);
        i <- (i + 1);
        trace___squeeze_avx2x4 <-
        (trace___squeeze_avx2x4 ++
        [(Assert, ((0 <= iTERS) /\ (iTERS <= 18446744073709551615)))]);
      }
    } else {
      
    }
    if ((0 < lO)) {
      param_7 <- st;
      (aux, aux_0, tmp__trace) <@ _keccakf1600_avx2x4 (param_7,
      (BArray800.init_arr (W8.of_int 255)));
      result_5 <- aux;
      b_result_3 <- aux_0;
      trace___squeeze_avx2x4 <- (trace___squeeze_avx2x4 ++ tmp__trace);
      trace___squeeze_avx2x4 <-
      (trace___squeeze_avx2x4 ++
      [(Assert, (BArray800.is_init b_result_3 0 800))]);
      st <- result_5;
      b_param_2 <- b_buf0;
      param_14 <- buf0;
      b_param_1 <- b_buf1;
      param_13 <- buf1;
      b_param_0 <- b_buf2;
      param_12 <- buf2;
      b_param <- b_buf3;
      param_11 <- buf3;
      param_10 <- offset;
      param_9 <- lO;
      param_8 <- st;
      (result_10, b_result_2, result_9, b_result_1, result_8, b_result_0,
      result_7, b_result, result_6, tmp__trace) <@ __dumpstate_avx2x4 (
      param_14, b_param_2, param_13, b_param_1, param_12, b_param_0,
      param_11, b_param, param_10, param_9, param_8,
      (BArray800.init_arr (W8.of_int 255)));
      trace___squeeze_avx2x4 <- (trace___squeeze_avx2x4 ++ tmp__trace);
      trace___squeeze_avx2x4 <-
      (trace___squeeze_avx2x4 ++
      [(Assert,
       (((0 <= param_9) /\ (param_9 <= 18446744073709551615)) /\
       (((0 <= (param_10 + param_9)) /\
        ((param_10 + param_9) <= 18446744073709551615)) /\
       (result_6 = (param_10 + param_9)))))]);
      trace___squeeze_avx2x4 <-
      (trace___squeeze_avx2x4 ++
      [(Assert,
       (((0 <= param_9) /\ (param_9 <= 18446744073709551615)) /\
       (((0 <= (param_10 + param_9)) /\
        ((param_10 + param_9) <= 18446744073709551615)) /\
       (((0 <= param_9) /\ (param_9 <= 18446744073709551615)) /\
       (((0 <= (param_10 + param_9)) /\
        ((param_10 + param_9) <= 18446744073709551615)) /\
       (((0 <= param_9) /\ (param_9 <= 18446744073709551615)) /\
       (((0 <= (param_10 + param_9)) /\
        ((param_10 + param_9) <= 18446744073709551615)) /\
       (((0 <= param_9) /\ (param_9 <= 18446744073709551615)) /\
       (((0 <= (param_10 + param_9)) /\
        ((param_10 + param_9) <= 18446744073709551615)) /\
       ((((BArrayS.is_init b_result_2 0 (param_10 + param_9)) /\
         (BArrayS.is_init b_result_1 0 (param_10 + param_9))) /\
        (BArrayS.is_init b_result_0 0 (param_10 + param_9))) /\
       (BArrayS.is_init b_result 0 (param_10 + param_9))))))))))))]);
      trace___squeeze_avx2x4 <-
      (trace___squeeze_avx2x4 ++
      [(Assert, ((0 <= result_6) /\ (result_6 <= 18446744073709551615)))]);
      b_buf0 <- b_result_2;
      buf0 <- result_10;
      b_buf1 <- b_result_1;
      buf1 <- result_9;
      b_buf2 <- b_result_0;
      buf2 <- result_8;
      b_buf3 <- b_result;
      buf3 <- result_7;
    } else {
      
    }
    b_st <- (BArray800.init_arr (W8.of_int 255));
    return (st, b_st, buf0, b_buf0, buf1, b_buf1, buf2, b_buf2, buf3, 
           b_buf3, trace___squeeze_avx2x4);
  }
}.

(* The post and trace are valid. *)

op __SHLQ_spec _x _shbytes =
   hoare [M.__SHLQ :
   (((_shbytes = shbytes) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].

op __SHLDQ_spec _x _shbytes =
   hoare [M.__SHLDQ :
   (((_shbytes = shbytes) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].

op __SHLQ_256_spec _x _shbytes =
   hoare [M.__SHLQ_256 :
   (((_shbytes = shbytes) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].

op __m_ilen_read_upto8_at_spec _buf _lEN _tRAIL _cUR _aT =
   hoare [M.__m_ilen_read_upto8_at :
   (((_aT = aT) /\
    ((_cUR = cUR) /\ ((_tRAIL = tRAIL) /\ ((_lEN = lEN) /\ (_buf = buf))))) /\
   ((true /\ (true /\ ((0 <= _buf) /\ (_buf <= 18446744073709551615)))) /\
   (true /\
   (((0 <= _buf) /\ (_buf <= 18446744073709551615)) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   ((((is_valid ptr_modulus Glob.mem_v _buf
      (((8 - (_aT - _cUR)) < _lEN) ? _lEN : (8 - (_aT - _cUR)))) /\
     (0 <= _lEN)) /\
    (0 <= _tRAIL)) /\
   (_tRAIL < 256))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <=
      ((((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))))) /\
     (((((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR)))) <=
     18446744073709551615)) /\
    (((0 <=
      (_buf +
      ((((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR)))))) /\
     ((_buf +
      ((((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))))) <=
     18446744073709551615)) /\
    (((_cUR <= _aT) /\ (_aT < (_cUR + 8))) ? ((((res.`1 =
                                                (_buf +
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
    ((((res.`1 = _buf) /\ (res.`2 = _lEN)) /\ (res.`3 = _tRAIL)) /\
    (res.`4 = _aT))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`6))].

op __m_ilen_read_upto16_at_spec _buf _lEN _tRAIL _cUR _aT =
   hoare [M.__m_ilen_read_upto16_at :
   (((_aT = aT) /\
    ((_cUR = cUR) /\ ((_tRAIL = tRAIL) /\ ((_lEN = lEN) /\ (_buf = buf))))) /\
   ((true /\ (true /\ ((0 <= _buf) /\ (_buf <= 18446744073709551615)))) /\
   (true /\
   (((0 <= _buf) /\ (_buf <= 18446744073709551615)) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   ((((is_valid ptr_modulus Glob.mem_v _buf
      (((16 - (_aT - _cUR)) < _lEN) ? _lEN : (16 - (_aT - _cUR)))) /\
     (0 <= _lEN)) /\
    (0 <= _tRAIL)) /\
   (_tRAIL < 256))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <=
      ((((_lEN < (16 - (_aT - _cUR))) ? _lEN : (16 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (16 - (_aT - _cUR))) ? _lEN : (16 - (_aT - _cUR))))) /\
     (((((_lEN < (16 - (_aT - _cUR))) ? _lEN : (16 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (16 - (_aT - _cUR))) ? _lEN : (16 - (_aT - _cUR)))) <=
     18446744073709551615)) /\
    (((0 <=
      (_buf +
      ((((_lEN < (16 - (_aT - _cUR))) ? _lEN : (16 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (16 - (_aT - _cUR))) ? _lEN : (16 - (_aT - _cUR)))))) /\
     ((_buf +
      ((((_lEN < (16 - (_aT - _cUR))) ? _lEN : (16 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (16 - (_aT - _cUR))) ? _lEN : (16 - (_aT - _cUR))))) <=
     18446744073709551615)) /\
    (((_cUR <= _aT) /\ (_aT < (_cUR + 16))) ? ((((res.`1 =
                                                 (_buf +
                                                 ((((_lEN <
                                                    (16 - (_aT - _cUR))) ? 
                                                   _lEN : (16 - (_aT - _cUR))) <
                                                  0) ? 0 : ((_lEN <
                                                            (16 -
                                                            (_aT - _cUR))) ? 
                                                           _lEN : (16 -
                                                                  (_aT -
                                                                  _cUR)))))) /\
                                                (res.`2 =
                                                (_lEN -
                                                ((((_lEN <
                                                   (16 - (_aT - _cUR))) ? 
                                                  _lEN : (16 - (_aT - _cUR))) <
                                                 0) ? 0 : ((_lEN <
                                                           (16 -
                                                           (_aT - _cUR))) ? 
                                                          _lEN : (16 -
                                                                 (_aT - _cUR))))))) /\
                                               (res.`3 =
                                               ((16 <= ((_aT - _cUR) + _lEN)) ? 
                                               _tRAIL : 0))) /\
                                              (res.`4 =
                                              (_cUR +
                                              (((((((_aT - _cUR) + _lEN) <
                                                  16) ? ((_aT - _cUR) + _lEN) : 16) +
                                                (((16 <=
                                                  ((_aT - _cUR) + _lEN)) \/
                                                 (_tRAIL = 0)) ? 0 : 1)) <
                                               0) ? 0 : (((((_aT - _cUR) +
                                                           _lEN) <
                                                          16) ? ((_aT - _cUR) +
                                                                _lEN) : 16) +
                                                        (((16 <=
                                                          ((_aT - _cUR) +
                                                          _lEN)) \/
                                                         (_tRAIL = 0)) ? 0 : 1)))))) : 
    ((((res.`1 = _buf) /\ (res.`2 = _lEN)) /\ (res.`3 = _tRAIL)) /\
    (res.`4 = _aT))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`6))].

op __m_ilen_read_upto32_at_spec _buf _lEN _tRAIL _cUR _aT =
   hoare [M.__m_ilen_read_upto32_at :
   (((_aT = aT) /\
    ((_cUR = cUR) /\ ((_tRAIL = tRAIL) /\ ((_lEN = lEN) /\ (_buf = buf))))) /\
   ((true /\ (true /\ ((0 <= _buf) /\ (_buf <= 18446744073709551615)))) /\
   (true /\
   (((0 <= _buf) /\ (_buf <= 18446744073709551615)) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   ((((is_valid ptr_modulus Glob.mem_v _buf
      (((32 - (_aT - _cUR)) < _lEN) ? _lEN : (32 - (_aT - _cUR)))) /\
     (0 <= _lEN)) /\
    (0 <= _tRAIL)) /\
   (_tRAIL < 256))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <=
      ((((_lEN < (32 - (_aT - _cUR))) ? _lEN : (32 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (32 - (_aT - _cUR))) ? _lEN : (32 - (_aT - _cUR))))) /\
     (((((_lEN < (32 - (_aT - _cUR))) ? _lEN : (32 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (32 - (_aT - _cUR))) ? _lEN : (32 - (_aT - _cUR)))) <=
     18446744073709551615)) /\
    (((0 <=
      (_buf +
      ((((_lEN < (32 - (_aT - _cUR))) ? _lEN : (32 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (32 - (_aT - _cUR))) ? _lEN : (32 - (_aT - _cUR)))))) /\
     ((_buf +
      ((((_lEN < (32 - (_aT - _cUR))) ? _lEN : (32 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (32 - (_aT - _cUR))) ? _lEN : (32 - (_aT - _cUR))))) <=
     18446744073709551615)) /\
    (((_cUR <= _aT) /\ (_aT < (_cUR + 32))) ? ((((res.`1 =
                                                 (_buf +
                                                 ((((_lEN <
                                                    (32 - (_aT - _cUR))) ? 
                                                   _lEN : (32 - (_aT - _cUR))) <
                                                  0) ? 0 : ((_lEN <
                                                            (32 -
                                                            (_aT - _cUR))) ? 
                                                           _lEN : (32 -
                                                                  (_aT -
                                                                  _cUR)))))) /\
                                                (res.`2 =
                                                (_lEN -
                                                ((((_lEN <
                                                   (32 - (_aT - _cUR))) ? 
                                                  _lEN : (32 - (_aT - _cUR))) <
                                                 0) ? 0 : ((_lEN <
                                                           (32 -
                                                           (_aT - _cUR))) ? 
                                                          _lEN : (32 -
                                                                 (_aT - _cUR))))))) /\
                                               (res.`3 =
                                               ((32 <= ((_aT - _cUR) + _lEN)) ? 
                                               _tRAIL : 0))) /\
                                              (res.`4 =
                                              (_cUR +
                                              (((((((_aT - _cUR) + _lEN) <
                                                  32) ? ((_aT - _cUR) + _lEN) : 32) +
                                                (((32 <=
                                                  ((_aT - _cUR) + _lEN)) \/
                                                 (_tRAIL = 0)) ? 0 : 1)) <
                                               0) ? 0 : (((((_aT - _cUR) +
                                                           _lEN) <
                                                          32) ? ((_aT - _cUR) +
                                                                _lEN) : 32) +
                                                        (((32 <=
                                                          ((_aT - _cUR) +
                                                          _lEN)) \/
                                                         (_tRAIL = 0)) ? 0 : 1)))))) : 
    ((((res.`1 = _buf) /\ (res.`2 = _lEN)) /\ (res.`3 = _tRAIL)) /\
    (res.`4 = _aT))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`6))].

op __m_ilen_read_bcast_upto8_at_spec _buf _lEN _tRAIL _cUR _aT =
   hoare [M.__m_ilen_read_bcast_upto8_at :
   (((_aT = aT) /\
    ((_cUR = cUR) /\ ((_tRAIL = tRAIL) /\ ((_lEN = lEN) /\ (_buf = buf))))) /\
   ((true /\ (true /\ ((0 <= _buf) /\ (_buf <= 18446744073709551615)))) /\
   (true /\
   (((0 <= _buf) /\ (_buf <= 18446744073709551615)) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   ((((is_valid ptr_modulus Glob.mem_v _buf
      (((8 - (_aT - _cUR)) < _lEN) ? _lEN : (8 - (_aT - _cUR)))) /\
     (0 <= _lEN)) /\
    (0 <= _tRAIL)) /\
   (_tRAIL < 256))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <=
      ((((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))))) /\
     (((((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR)))) <=
     18446744073709551615)) /\
    (((0 <=
      (_buf +
      ((((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR)))))) /\
     ((_buf +
      ((((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))) < 0) ? 0 : 
      ((_lEN < (8 - (_aT - _cUR))) ? _lEN : (8 - (_aT - _cUR))))) <=
     18446744073709551615)) /\
    (((_cUR <= _aT) /\ (_aT < (_cUR + 8))) ? ((((res.`1 =
                                                (_buf +
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
    ((((res.`1 = _buf) /\ (res.`2 = _lEN)) /\ (res.`3 = _tRAIL)) /\
    (res.`4 = _aT))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`6))].

op __m_ilen_write_upto8_spec _buf _lEN _w =
   hoare [M.__m_ilen_write_upto8 :
   (((_w = w) /\ ((_lEN = lEN) /\ (_buf = buf))) /\
   ((true /\ (true /\ ((0 <= _buf) /\ (_buf <= 18446744073709551615)))) /\
   (true /\
   (((0 <= _buf) /\ (_buf <= 18446744073709551615)) /\
   (true /\
   (true /\ (is_valid ptr_modulus Glob.mem_v _buf ((_lEN < 8) ? _lEN : 8)))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) /\
     (((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)) <=
     18446744073709551615)) /\
    (((0 <=
      (_buf + ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
     ((_buf + ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))) <=
     18446744073709551615)) /\
    ((res.`1 =
     (_buf + ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))) /\
    (res.`2 =
    (_lEN - ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8)))))))))))))))))))))))))))))))))))))) /\
   (valid res.`3))].

op __m_ilen_write_upto16_spec _buf _lEN _w =
   hoare [M.__m_ilen_write_upto16 :
   (((_w = w) /\ ((_lEN = lEN) /\ (_buf = buf))) /\
   ((true /\ (true /\ ((0 <= _buf) /\ (_buf <= 18446744073709551615)))) /\
   (true /\
   (((0 <= _buf) /\ (_buf <= 18446744073709551615)) /\
   (true /\
   (true /\ (is_valid ptr_modulus Glob.mem_v _buf ((_lEN < 16) ? _lEN : 16)))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <=
      ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16))) /\
     (((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)) <=
     18446744073709551615)) /\
    (((0 <=
      (_buf +
      ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)))) /\
     ((_buf +
      ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16))) <=
     18446744073709551615)) /\
    ((res.`1 =
     (_buf +
     ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)))) /\
    (res.`2 =
    (_lEN -
    ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)))))))))))))))))))))))))))))))))))))) /\
   (valid res.`3))].

op __m_ilen_write_upto32_spec _buf _lEN _w =
   hoare [M.__m_ilen_write_upto32 :
   (((_w = w) /\ ((_lEN = lEN) /\ (_buf = buf))) /\
   ((true /\ (true /\ ((0 <= _buf) /\ (_buf <= 18446744073709551615)))) /\
   (true /\
   (((0 <= _buf) /\ (_buf <= 18446744073709551615)) /\
   (true /\
   (true /\ (is_valid ptr_modulus Glob.mem_v _buf ((_lEN < 32) ? _lEN : 32)))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <=
      ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32))) /\
     (((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)) <=
     18446744073709551615)) /\
    (((0 <=
      (_buf +
      ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)))) /\
     ((_buf +
      ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32))) <=
     18446744073709551615)) /\
    ((res.`1 =
     (_buf +
     ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)))) /\
    (res.`2 =
    (_lEN -
    ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)))))))))))))))))))))))))))))))))))))) /\
   (valid res.`3))].

op __m_rlen_read_upto8_spec _buf _len =
   hoare [M.__m_rlen_read_upto8 :
   (((_len = len) /\ (_buf = buf)) /\
   ((true /\ (true /\ ((0 <= _len) /\ (_len <= 18446744073709551615)))) /\
   ((true /\ (true /\ ((0 <= _buf) /\ (_buf <= 18446744073709551615)))) /\
   (true /\
   (((0 <= _buf) /\ (_buf <= 18446744073709551615)) /\
   (true /\
   (true /\ (is_valid ptr_modulus Glob.mem_v _buf ((_len < 8) ? _len : 8))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= ((_len < 8) ? _len : 8)) /\
     (((_len < 8) ? _len : 8) <= 18446744073709551615)) /\
    (((0 <= (_buf + ((_len < 8) ? _len : 8))) /\
     ((_buf + ((_len < 8) ? _len : 8)) <= 18446744073709551615)) /\
    (res.`1 = (_buf + ((_len < 8) ? _len : 8)))))))))))))))))))) /\
   (valid res.`3))].

op __m_rlen_write_upto8_spec _buf _data _len =
   hoare [M.__m_rlen_write_upto8 :
   (((_len = len) /\ ((_data = data) /\ (_buf = buf))) /\
   ((true /\ (true /\ ((0 <= _len) /\ (_len <= 18446744073709551615)))) /\
   ((true /\ (true /\ ((0 <= _buf) /\ (_buf <= 18446744073709551615)))) /\
   (true /\
   (((0 <= _buf) /\ (_buf <= 18446744073709551615)) /\
   (true /\
   (true /\ (is_valid ptr_modulus Glob.mem_v _buf ((_len < 8) ? _len : 8))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8))) /\
     (((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8)) <=
     18446744073709551615)) /\
    (((0 <=
      (_buf + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8)))) /\
     ((_buf + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8))) <=
     18446744073709551615)) /\
    (res.`1 =
    (_buf + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8))))))))))))))))))))))))))))))) /\
   (valid res.`2))].

op __ANDN_64_spec _a _b =
   hoare [M.__ANDN_64 :
   (((_b = b) /\ (_a = a)) /\ true) ==> (true /\ (valid res.`2))].

op keccakf1600_index_spec _x _y =
   hoare [M.keccakf1600_index :
   (((_y = y) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].

op keccakf1600_rho_offsets_spec _i =
   hoare [M.keccakf1600_rho_offsets :
   ((_i = i) /\ true) ==> (true /\ (valid res.`2))].

op keccakf1600_rhotates_spec _x _y =
   hoare [M.keccakf1600_rhotates :
   (((_y = y) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].

op __rol_u64_ref_spec _x _i =
   hoare [M.__rol_u64_ref :
   (((_i = i) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].

op __theta_sum_ref_spec _a _b_a =
   hoare [M.__theta_sum_ref :
   (((_b_a = b_a) /\ (_a = a)) /\ (BArray200.is_init _b_a 0 200)) ==>
   ((BArray40.is_init res.`2 0 40) /\ (valid res.`3))].

op __theta_rol_ref_spec _c _b_c =
   hoare [M.__theta_rol_ref :
   (((_b_c = b_c) /\ (_c = c)) /\ (BArray40.is_init _b_c 0 40)) ==>
   ((BArray40.is_init res.`2 0 40) /\ (valid res.`3))].

op __rol_sum_ref_spec _a _b_a _d _b_d _y =
   hoare [M.__rol_sum_ref :
   (((_y = y) /\ ((_b_d = b_d) /\ ((_d = d) /\ ((_b_a = b_a) /\ (_a = a))))) /\
   ((BArray40.is_init _b_d 0 40) /\ (BArray200.is_init _b_a 0 200))) ==>
   ((BArray40.is_init res.`2 0 40) /\ (valid res.`3))].

op __set_row_ref_spec _e _b_e _b _b_b _y =
   hoare [M.__set_row_ref :
   (((_y = y) /\ ((_b_b = b_b) /\ ((_b = b) /\ ((_b_e = b_e) /\ (_e = e))))) /\
   ((BArray40.is_init _b_b 0 40) /\ (BArray200.is_init _b_e 0 200))) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op _pround_ref_spec _e _b_e _a _b_a =
   hoare [M._pround_ref :
   (((_b_a = b_a) /\ ((_a = a) /\ ((_b_e = b_e) /\ (_e = e)))) /\
   ((BArray200.is_init _b_a 0 200) /\ (BArray200.is_init _b_e 0 200))) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op __keccakf1600_ref_spec _a _b_a =
   hoare [M.__keccakf1600_ref :
   (((_b_a = b_a) /\ (_a = a)) /\ (BArray200.is_init _b_a 0 200)) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op _keccakf1600_ref_spec _a _b_a =
   hoare [M._keccakf1600_ref :
   (((_b_a = b_a) /\ (_a = a)) /\ (BArray200.is_init _b_a 0 200)) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op _keccakf1600_ref__spec _a _b_a =
   hoare [M._keccakf1600_ref_ :
   (((_b_a = b_a) /\ (_a = a)) /\ (BArray200.is_init _b_a 0 200)) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op __state_init_ref_spec _st _b_st =
   hoare [M.__state_init_ref :
   (((_b_st = b_st) /\ (_st = st)) /\ (BArray200.is_init _b_st 0 200)) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op __addratebit_ref_spec _st _b_st __RATE8 =
   hoare [M.__addratebit_ref :
   (((__RATE8 = _RATE8) /\ ((_b_st = b_st) /\ (_st = st))) /\
   (BArray200.is_init _b_st 0 200)) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op __keccakf1600_pround_avx2_spec _state _b_state =
   hoare [M.__keccakf1600_pround_avx2 :
   (((_b_state = b_state) /\ (_state = state)) /\
   (BArray224.is_init _b_state 0 224)) ==>
   ((BArray224.is_init res.`2 0 224) /\ (valid res.`3))].

op __keccakf1600_avx2_spec _state _b_state =
   hoare [M.__keccakf1600_avx2 :
   (((_b_state = b_state) /\ (_state = state)) /\
   (BArray224.is_init _b_state 0 224)) ==>
   ((BArray224.is_init res.`2 0 224) /\ (valid res.`3))].

op _keccakf1600_avx2_spec _state _b_state =
   hoare [M._keccakf1600_avx2 :
   (((_b_state = b_state) /\ (_state = state)) /\
   (BArray224.is_init _b_state 0 224)) ==>
   ((BArray224.is_init res.`2 0 224) /\ (valid res.`3))].

op __stavx2_pack_spec _st _b_st =
   hoare [M.__stavx2_pack :
   (((_b_st = b_st) /\ (_st = st)) /\ (BArray200.is_init _b_st 0 200)) ==>
   ((BArray224.is_init res.`2 0 224) /\ (valid res.`3))].

op __stavx2_unpack_spec _st _b_st _state _b_state =
   hoare [M.__stavx2_unpack :
   (((_b_state = b_state) /\
    ((_state = state) /\ ((_b_st = b_st) /\ (_st = st)))) /\
   (BArray224.is_init _b_state 0 (7 * 32))) ==>
   ((BArray200.is_init res.`2 0 (25 * 8)) /\ (valid res.`3))].

op _keccakf1600_st25_avx2_spec _st25 _b_st25 =
   hoare [M._keccakf1600_st25_avx2 :
   (((_b_st25 = b_st25) /\ (_st25 = st25)) /\
   (BArray200.is_init _b_st25 0 200)) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`3))].

op __u64_to_u256_spec _x _l =
   hoare [M.__u64_to_u256 :
   (((_l = l) /\ (_x = x)) /\ true) ==> (true /\ (valid res.`2))].

op __state_init_avx2_spec  =
   hoare [M.__state_init_avx2 :
   (true /\ true) ==> ((BArray224.is_init res.`2 0 224) /\ (valid res.`3))].

op __perm_reg3456_avx2_spec _r3 _r4 _r5 _r6 =
   hoare [M.__perm_reg3456_avx2 :
   (((_r6 = r6) /\ ((_r5 = r5) /\ ((_r4 = r4) /\ (_r3 = r3)))) /\ true) ==>
   (true /\ (valid res.`5))].

op __unperm_reg3456_avx2_spec _st3 _st4 _st5 _st6 =
   hoare [M.__unperm_reg3456_avx2 :
   (((_st6 = st6) /\ ((_st5 = st5) /\ ((_st4 = st4) /\ (_st3 = st3)))) /\
   true) ==> (true /\ (valid res.`5))].

op __addstate_r3456_avx2_spec _st _b_st _r3 _r4 _r5 _r6 =
   hoare [M.__addstate_r3456_avx2 :
   (((_r6 = r6) /\
    ((_r5 = r5) /\
    ((_r4 = r4) /\ ((_r3 = r3) /\ ((_b_st = b_st) /\ (_st = st)))))) /\
   (BArray224.is_init _b_st 0 224)) ==>
   ((BArray224.is_init res.`2 0 224) /\ (valid res.`3))].

op __stavx2_pos_avx2_spec _pOS =
   hoare [M.__stavx2_pos_avx2 :
   ((_pOS = pOS) /\ true) ==>
   ((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 < 7)))) /\ (valid res.`3))].

op __addratebit_avx2_spec _st _b_st _rATE_8 =
   hoare [M.__addratebit_avx2 :
   (((_rATE_8 = rATE_8) /\ ((_b_st = b_st) /\ (_st = st))) /\
   (BArray224.is_init _b_st 0 224)) ==>
   ((BArray224.is_init res.`2 0 224) /\ (valid res.`3))].

op _keccakf1600_4x_pround_spec _e _b_e _a _b_a _r8 _r56 =
   hoare [M._keccakf1600_4x_pround :
   (((_r56 = r56) /\
    ((_r8 = r8) /\
    ((_b_a = b_a) /\ ((_a = a) /\ ((_b_e = b_e) /\ (_e = e)))))) /\
   (BArray800.is_init _b_a 0 800)) ==>
   ((BArray800.is_init res.`2 0 800) /\ (valid res.`3))].

op __keccakf1600_avx2x4_spec _a _b_a =
   hoare [M.__keccakf1600_avx2x4 :
   (((_b_a = b_a) /\ (_a = a)) /\ (BArray800.is_init _b_a 0 800)) ==>
   ((BArray800.is_init res.`2 0 800) /\ (valid res.`3))].

op _keccakf1600_avx2x4_spec _a _b_a =
   hoare [M._keccakf1600_avx2x4 :
   (((_b_a = b_a) /\ (_a = a)) /\ (BArray800.is_init _b_a 0 800)) ==>
   ((BArray800.is_init res.`2 0 800) /\ (valid res.`3))].

op _keccakf1600_avx2x4__spec _a _b_a =
   hoare [M._keccakf1600_avx2x4_ :
   (((_b_a = b_a) /\ (_a = a)) /\ (BArray800.is_init _b_a 0 800)) ==>
   ((BArray800.is_init res.`2 0 800) /\ (valid res.`3))].

op __u256x4_4u64x4_spec _x0 _x1 _x2 _x3 =
   hoare [M.__u256x4_4u64x4 :
   (((_x3 = x3) /\ ((_x2 = x2) /\ ((_x1 = x1) /\ (_x0 = x0)))) /\ true) ==>
   (true /\ (valid res.`5))].

op __st4x_pack_spec _st4x _b_st4x _st0 _b_st0 _st1 _b_st1 _st2 _b_st2 _st3 _b_st3 =
   hoare [M.__st4x_pack :
   (((_b_st3 = b_st3) /\
    ((_st3 = st3) /\
    ((_b_st2 = b_st2) /\
    ((_st2 = st2) /\
    ((_b_st1 = b_st1) /\
    ((_st1 = st1) /\
    ((_b_st0 = b_st0) /\
    ((_st0 = st0) /\ ((_b_st4x = b_st4x) /\ (_st4x = st4x)))))))))) /\
   ((((BArray200.is_init _b_st0 0 (25 * 8)) /\
     (BArray200.is_init _b_st1 0 (25 * 8))) /\
    (BArray200.is_init _b_st2 0 (25 * 8))) /\
   (BArray200.is_init _b_st3 0 (25 * 8)))) ==>
   ((BArray800.is_init res.`2 0 (25 * 32)) /\ (valid res.`3))].

op __4u64x4_u256x4_spec _y0 _y1 _y2 _y3 =
   hoare [M.__4u64x4_u256x4 :
   (((_y3 = y3) /\ ((_y2 = y2) /\ ((_y1 = y1) /\ (_y0 = y0)))) /\ true) ==>
   (true /\ (valid res.`5))].

op __st4x_unpack_spec _st0 _b_st0 _st1 _b_st1 _st2 _b_st2 _st3 _b_st3 _st4x _b_st4x =
   hoare [M.__st4x_unpack :
   (((_b_st4x = b_st4x) /\
    ((_st4x = st4x) /\
    ((_b_st3 = b_st3) /\
    ((_st3 = st3) /\
    ((_b_st2 = b_st2) /\
    ((_st2 = st2) /\
    ((_b_st1 = b_st1) /\
    ((_st1 = st1) /\ ((_b_st0 = b_st0) /\ (_st0 = st0)))))))))) /\
   (BArray800.is_init _b_st4x 0 (25 * 32))) ==>
   (((((BArray200.is_init res.`2 0 (25 * 8)) /\
      (BArray200.is_init res.`4 0 (25 * 8))) /\
     (BArray200.is_init res.`6 0 (25 * 8))) /\
    (BArray200.is_init res.`8 0 (25 * 8))) /\
   (valid res.`9))].

op __keccakf1600_pround_unpacked_spec _st0 _b_st0 _st1 _b_st1 _st2 _b_st2 _st3 _b_st3 =
   hoare [M.__keccakf1600_pround_unpacked :
   (((_b_st3 = b_st3) /\
    ((_st3 = st3) /\
    ((_b_st2 = b_st2) /\
    ((_st2 = st2) /\
    ((_b_st1 = b_st1) /\
    ((_st1 = st1) /\ ((_b_st0 = b_st0) /\ (_st0 = st0)))))))) /\
   ((BArray200.is_init _b_st3 0 200) /\
   ((BArray200.is_init _b_st2 0 200) /\
   ((BArray200.is_init _b_st1 0 200) /\ (BArray200.is_init _b_st0 0 200))))) ==>
   (((BArray200.is_init res.`8 0 200) /\
    ((BArray200.is_init res.`6 0 200) /\
    ((BArray200.is_init res.`4 0 200) /\ (BArray200.is_init res.`2 0 200)))) /\
   (valid res.`9))].

op __keccakf1600_pround_equiv_spec _e _b_e _a _b_a =
   hoare [M.__keccakf1600_pround_equiv :
   (((_b_a = b_a) /\ ((_a = a) /\ ((_b_e = b_e) /\ (_e = e)))) /\
   (BArray800.is_init _b_a 0 (32 * 25))) ==>
   ((BArray800.is_init res.`2 0 (32 * 25)) /\ (valid res.`3))].

op __state_init_avx2x4_spec _st _b_st =
   hoare [M.__state_init_avx2x4 :
   (((_b_st = b_st) /\ (_st = st)) /\ true) ==>
   ((BArray800.is_init res.`2 0 800) /\ (valid res.`3))].

op __addratebit_avx2x4_spec _st _b_st _rATE8 =
   hoare [M.__addratebit_avx2x4 :
   (((_rATE8 = rATE8) /\ ((_b_st = b_st) /\ (_st = st))) /\
   (true /\
   (true /\
   (((BArray800.is_init _b_st 0 800) /\ (0 < _rATE8)) /\ (_rATE8 < 200))))) ==>
   ((BArray800.is_init res.`2 0 800) /\ (valid res.`3))].

op __a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT =
   hoare [M.__a_ilen_read_upto8_at :
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
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   ((((((BArrayS.is_init _b_buf (_offset + _dELTA) ((_lEN < 8) ? _lEN : 8)) /\
       (0 <= _dELTA)) /\
      (0 <= _offset)) /\
     (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= size)) /\
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

op __a_ilen_read_upto16_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT =
   hoare [M.__a_ilen_read_upto16_at :
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
   (((0 <= ((_lEN < 16) ? _lEN : 16)) /\
    (((_lEN < 16) ? _lEN : 16) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16))) /\
    (((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16)) <=
    18446744073709551615)) /\
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   ((((((BArrayS.is_init _b_buf (_offset + _dELTA)
        ((_lEN < 16) ? _lEN : 16)) /\
       (0 <= _dELTA)) /\
      (0 <= _offset)) /\
     (((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16)) <= size)) /\
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
    (((_cUR <= _aT) /\ (_aT < (_cUR + 16))) ? ((((res.`1 =
                                                 (_dELTA +
                                                 ((((_lEN <
                                                    (16 - (_aT - _cUR))) ? 
                                                   _lEN : (16 - (_aT - _cUR))) <
                                                  0) ? 0 : ((_lEN <
                                                            (16 -
                                                            (_aT - _cUR))) ? 
                                                           _lEN : (16 -
                                                                  (_aT -
                                                                  _cUR)))))) /\
                                                (res.`2 =
                                                (_lEN -
                                                ((((_lEN <
                                                   (16 - (_aT - _cUR))) ? 
                                                  _lEN : (16 - (_aT - _cUR))) <
                                                 0) ? 0 : ((_lEN <
                                                           (16 -
                                                           (_aT - _cUR))) ? 
                                                          _lEN : (16 -
                                                                 (_aT - _cUR))))))) /\
                                               (res.`3 =
                                               ((16 <= ((_aT - _cUR) + _lEN)) ? 
                                               _tRAIL : 0))) /\
                                              (res.`4 =
                                              (_cUR +
                                              (((((((_aT - _cUR) + _lEN) <
                                                  16) ? ((_aT - _cUR) + _lEN) : 16) +
                                                (((16 <=
                                                  ((_aT - _cUR) + _lEN)) \/
                                                 (_tRAIL = 0)) ? 0 : 1)) <
                                               0) ? 0 : (((((_aT - _cUR) +
                                                           _lEN) <
                                                          16) ? ((_aT - _cUR) +
                                                                _lEN) : 16) +
                                                        (((16 <=
                                                          ((_aT - _cUR) +
                                                          _lEN)) \/
                                                         (_tRAIL = 0)) ? 0 : 1)))))) : 
    ((((res.`1 = _dELTA) /\ (res.`2 = _lEN)) /\ (res.`3 = _tRAIL)) /\
    (res.`4 = _aT)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`6))].

op __a_ilen_read_upto32_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT =
   hoare [M.__a_ilen_read_upto32_at :
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
   (((0 <= ((_lEN < 32) ? _lEN : 32)) /\
    (((_lEN < 32) ? _lEN : 32) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32))) /\
    (((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32)) <=
    18446744073709551615)) /\
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   ((((((BArrayS.is_init _b_buf (_offset + _dELTA)
        ((_lEN < 32) ? _lEN : 32)) /\
       (0 <= _dELTA)) /\
      (0 <= _offset)) /\
     (((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32)) <= size)) /\
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
    (((_cUR <= _aT) /\ (_aT < (_cUR + 32))) ? ((((res.`1 =
                                                 (_dELTA +
                                                 ((((_lEN <
                                                    (32 - (_aT - _cUR))) ? 
                                                   _lEN : (32 - (_aT - _cUR))) <
                                                  0) ? 0 : ((_lEN <
                                                            (32 -
                                                            (_aT - _cUR))) ? 
                                                           _lEN : (32 -
                                                                  (_aT -
                                                                  _cUR)))))) /\
                                                (res.`2 =
                                                (_lEN -
                                                ((((_lEN <
                                                   (32 - (_aT - _cUR))) ? 
                                                  _lEN : (32 - (_aT - _cUR))) <
                                                 0) ? 0 : ((_lEN <
                                                           (32 -
                                                           (_aT - _cUR))) ? 
                                                          _lEN : (32 -
                                                                 (_aT - _cUR))))))) /\
                                               (res.`3 =
                                               ((32 <= ((_aT - _cUR) + _lEN)) ? 
                                               _tRAIL : 0))) /\
                                              (res.`4 =
                                              (_cUR +
                                              (((((((_aT - _cUR) + _lEN) <
                                                  32) ? ((_aT - _cUR) + _lEN) : 32) +
                                                (((32 <=
                                                  ((_aT - _cUR) + _lEN)) \/
                                                 (_tRAIL = 0)) ? 0 : 1)) <
                                               0) ? 0 : (((((_aT - _cUR) +
                                                           _lEN) <
                                                          32) ? ((_aT - _cUR) +
                                                                _lEN) : 32) +
                                                        (((32 <=
                                                          ((_aT - _cUR) +
                                                          _lEN)) \/
                                                         (_tRAIL = 0)) ? 0 : 1)))))) : 
    ((((res.`1 = _dELTA) /\ (res.`2 = _lEN)) /\ (res.`3 = _tRAIL)) /\
    (res.`4 = _aT)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`6))].

op __a_ilen_read_bcast_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT =
   hoare [M.__a_ilen_read_bcast_upto8_at :
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
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   ((((((BArrayS.is_init _b_buf (_offset + _dELTA) ((_lEN < 8) ? _lEN : 8)) /\
       (0 <= _dELTA)) /\
      (0 <= _offset)) /\
     (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= size)) /\
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

op __a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w =
   hoare [M.__a_ilen_write_upto8 :
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
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   (((BArrayS.is_init _b_buf 0 (_offset + _dELTA)) /\ (0 <= _dELTA)) /\
   (((_offset + _dELTA) + ((_lEN < 8) ? _lEN : 8)) <= size)))))))))))))))))))))))))))))))))))))))))) ==>
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
    (BArrayS.is_init res.`2 0
    ((_offset + _dELTA) +
    ((((_lEN < 8) ? _lEN : 8) < 0) ? 0 : ((_lEN < 8) ? _lEN : 8))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`5))].

op __a_ilen_write_upto16_spec _buf _b_buf _offset _dELTA _lEN _w =
   hoare [M.__a_ilen_write_upto16 :
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
   (((0 <= ((_lEN < 16) ? _lEN : 16)) /\
    (((_lEN < 16) ? _lEN : 16) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16))) /\
    (((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16)) <=
    18446744073709551615)) /\
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   (((BArrayS.is_init _b_buf 0 (_offset + _dELTA)) /\ (0 <= _dELTA)) /\
   (((_offset + _dELTA) + ((_lEN < 16) ? _lEN : 16)) <= size)))))))))))))))))))))))))))))))))))))))))) ==>
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
    (((0 <=
      ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16))) /\
     (((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)) <=
     18446744073709551615)) /\
    (((0 <=
      ((_offset + _dELTA) +
      ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)))) /\
     (((_offset + _dELTA) +
      ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16))) <=
     18446744073709551615)) /\
    (((res.`3 =
      (_dELTA +
      ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16)))) /\
     (res.`4 =
     (_lEN -
     ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16))))) /\
    (BArrayS.is_init res.`2 0
    ((_offset + _dELTA) +
    ((((_lEN < 16) ? _lEN : 16) < 0) ? 0 : ((_lEN < 16) ? _lEN : 16))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`5))].

op __a_ilen_write_upto32_spec _buf _b_buf _offset _dELTA _lEN _w =
   hoare [M.__a_ilen_write_upto32 :
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
   (true /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= _dELTA) /\ (_dELTA <= 18446744073709551615)) /\
   (((0 <= (_offset + _dELTA)) /\
    ((_offset + _dELTA) <= 18446744073709551615)) /\
   (((0 <= ((_lEN < 32) ? _lEN : 32)) /\
    (((_lEN < 32) ? _lEN : 32) <= 18446744073709551615)) /\
   (((0 <= ((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32))) /\
    (((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32)) <=
    18446744073709551615)) /\
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   ((((BArrayS.is_init _b_buf 0 (_offset + _dELTA)) /\ (0 <= _dELTA)) /\
    (0 <= _offset)) /\
   (((_offset + _dELTA) + ((_lEN < 32) ? _lEN : 32)) <= size)))))))))))))))))))))))))))))))))))))))))))) ==>
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
    (((0 <=
      ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32))) /\
     (((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)) <=
     18446744073709551615)) /\
    (((0 <=
      ((_offset + _dELTA) +
      ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)))) /\
     (((_offset + _dELTA) +
      ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32))) <=
     18446744073709551615)) /\
    (((res.`3 =
      (_dELTA +
      ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32)))) /\
     (res.`4 =
     (_lEN -
     ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32))))) /\
    (BArrayS.is_init res.`2 0
    ((_offset + _dELTA) +
    ((((_lEN < 32) ? _lEN : 32) < 0) ? 0 : ((_lEN < 32) ? _lEN : 32))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`5))].

op __a_rlen_read_upto8_spec _a _b_a _off _len =
   hoare [M.__a_rlen_read_upto8 :
   (((_len = len) /\ ((_off = off) /\ ((_b_a = b_a) /\ (_a = a)))) /\
   ((true /\ (true /\ ((0 <= _len) /\ (_len <= 18446744073709551615)))) /\
   ((true /\ (true /\ ((0 <= _off) /\ (_off <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
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
   (((0 <= ((_len < 8) ? _len : 8)) /\
    (((_len < 8) ? _len : 8) <= 18446744073709551615)) /\
   (((0 <= (_off + ((_len < 8) ? _len : 8))) /\
    ((_off + ((_len < 8) ? _len : 8)) <= 18446744073709551615)) /\
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   (((BArrayS.is_init _b_a _off ((_len < 8) ? _len : 8)) /\ (0 <= _off)) /\
   ((_off + ((_len < 8) ? _len : 8)) <= size)))))))))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8))) /\
     (((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8)) <=
     18446744073709551615)) /\
    (((0 <=
      (_off + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8)))) /\
     ((_off + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8))) <=
     18446744073709551615)) /\
    (res.`1 =
    (_off + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8))))))))))))))))))))))))))))))) /\
   (valid res.`3))].

op __a_rlen_read_upto8_noninline_spec _a _b_a _off_ _len_ =
   hoare [M.__a_rlen_read_upto8_noninline :
   (((_len_ = len_) /\ ((_off_ = off_) /\ ((_b_a = b_a) /\ (_a = a)))) /\
   ((true /\ (true /\ ((0 <= _len_) /\ (_len_ <= 18446744073709551615)))) /\
   ((true /\ (true /\ ((0 <= _off_) /\ (_off_ <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
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
   (((0 <= ((_len_ < 8) ? _len_ : 8)) /\
    (((_len_ < 8) ? _len_ : 8) <= 18446744073709551615)) /\
   (((0 <= (_off_ + ((_len_ < 8) ? _len_ : 8))) /\
    ((_off_ + ((_len_ < 8) ? _len_ : 8)) <= 18446744073709551615)) /\
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   (((BArrayS.is_init _b_a _off_ ((_len_ < 8) ? _len_ : 8)) /\
    (0 <= _off_)) /\
   ((_off_ + ((_len_ < 8) ? _len_ : 8)) <= size)))))))))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`1) /\ (res.`1 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <=
      ((((_len_ < 8) ? _len_ : 8) < 0) ? 0 : ((_len_ < 8) ? _len_ : 8))) /\
     (((((_len_ < 8) ? _len_ : 8) < 0) ? 0 : ((_len_ < 8) ? _len_ : 8)) <=
     18446744073709551615)) /\
    (((0 <=
      (_off_ +
      ((((_len_ < 8) ? _len_ : 8) < 0) ? 0 : ((_len_ < 8) ? _len_ : 8)))) /\
     ((_off_ +
      ((((_len_ < 8) ? _len_ : 8) < 0) ? 0 : ((_len_ < 8) ? _len_ : 8))) <=
     18446744073709551615)) /\
    (res.`1 =
    (_off_ +
    ((((_len_ < 8) ? _len_ : 8) < 0) ? 0 : ((_len_ < 8) ? _len_ : 8))))))))))))))))))))))))))))))) /\
   (valid res.`3))].

op __a_rlen_write_upto8_spec _buf _b_buf _off _data _len =
   hoare [M.__a_rlen_write_upto8 :
   (((_len = len) /\
    ((_data = data) /\ ((_off = off) /\ ((_b_buf = b_buf) /\ (_buf = buf))))) /\
   ((true /\ (true /\ ((0 <= _len) /\ (_len <= 18446744073709551615)))) /\
   ((true /\ (true /\ ((0 <= _off) /\ (_off <= 18446744073709551615)))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
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
   (((0 <= ((_len < 8) ? _len : 8)) /\
    (((_len < 8) ? _len : 8) <= 18446744073709551615)) /\
   (((0 <= (_off + ((_len < 8) ? _len : 8))) /\
    ((_off + ((_len < 8) ? _len : 8)) <= 18446744073709551615)) /\
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   (((BArrayS.is_init _b_buf 0 _off) /\ (0 <= _off)) /\
   ((_off + ((_len < 8) ? _len : 8)) <= size)))))))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`3) /\ (res.`3 <= 18446744073709551615)))) /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (true /\
    (((0 <= ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8))) /\
     (((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8)) <=
     18446744073709551615)) /\
    (((0 <=
      (_off + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8)))) /\
     ((_off + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8))) <=
     18446744073709551615)) /\
    (((0 <= ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8))) /\
     (((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8)) <=
     18446744073709551615)) /\
    (((0 <=
      (_off + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8)))) /\
     ((_off + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8))) <=
     18446744073709551615)) /\
    ((BArrayS.is_init res.`2 0
     (_off + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8)))) /\
    (res.`3 =
    (_off + ((((_len < 8) ? _len : 8) < 0) ? 0 : ((_len < 8) ? _len : 8))))))))))))))))))))))))))))))))))))))))))))))))))))))))) /\
   (valid res.`4))].

op __addstate_ref_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB =
   hoare [M.__addstate_ref :
   (((__TRAILB = _TRAILB) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st)))))))) /\
   ((BArrayS.is_init _b_buf 0 size) /\ (BArray200.is_init _b_st 0 200))) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`5))].

op __absorb_ref_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8 =
   hoare [M.__absorb_ref :
   (((__RATE8 = _RATE8) /\
    ((__TRAILB = _TRAILB) /\
    ((_b_buf = b_buf) /\
    ((_buf = buf) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st))))))) /\
   ((BArrayS.is_init _b_buf 0 size) /\ (BArray200.is_init _b_st 0 200))) ==>
   ((BArray200.is_init res.`2 0 200) /\ (valid res.`4))].

op __dumpstate_ref_spec _buf _b_buf _offset __LEN _st _b_st =
   hoare [M.__dumpstate_ref :
   (((_b_st = b_st) /\
    ((_st = st) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\ ((_b_buf = b_buf) /\ (_buf = buf)))))) /\
   ((BArray200.is_init _b_st 0 200) /\ (BArrayS.is_init _b_buf 0 size))) ==>
   ((BArrayS.is_init res.`2 0 size) /\ (valid res.`4))].

op __squeeze_ref_spec _st _b_st _buf _b_buf __RATE8 =
   hoare [M.__squeeze_ref :
   (((__RATE8 = _RATE8) /\
    ((_b_buf = b_buf) /\ ((_buf = buf) /\ ((_b_st = b_st) /\ (_st = st))))) /\
   ((BArrayS.is_init _b_buf 0 size) /\ (BArray200.is_init _b_st 0 200))) ==>
   (((BArrayS.is_init res.`4 0 size) /\ (BArray200.is_init res.`2 0 200)) /\
   (valid res.`5))].

op __addstate_avx2_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB =
   hoare [M.__addstate_avx2 :
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
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   (((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= size)) /\
    (BArrayS.is_init _b_buf _offset __LEN)) /\
   (BArray224.is_init _b_st 0 (7 * 32)))))))))))))))))))))) ==>
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
    (((BArray224.is_init res.`2 0 (7 * 32)) /\
     (res.`3 = ((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)))) /\
    (res.`4 = (_offset + __LEN))))))))))))))))))) /\
   (valid res.`5))].

op __absorb_avx2_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8 =
   hoare [M.__absorb_avx2 :
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
    (BArrayS.is_init _b_buf 0 size)) /\
   (BArray224.is_init _b_st 0 (7 * 32))))))))))) ==>
   ((BArray224.is_init res.`2 0 (7 * 32)) /\ (valid res.`4))].

op __dumpstate_avx2_spec _buf _b_buf _offset __LEN _st _b_st =
   hoare [M.__dumpstate_avx2 :
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
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   ((((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= size)) /\
     (BArray224.is_init _b_st 0 (7 * 32))) /\
    (__LEN <= 200)) /\
   (BArrayS.is_init _b_buf 0 _offset)))))))))))))))))))) ==>
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
     (BArrayS.is_init res.`2 0 (_offset + __LEN)))))))))))) /\
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

op __squeeze_avx2_spec _st _b_st _buf _b_buf __RATE8 =
   hoare [M.__squeeze_avx2 :
   (((__RATE8 = _RATE8) /\
    ((_b_buf = b_buf) /\ ((_buf = buf) /\ ((_b_st = b_st) /\ (_st = st))))) /\
   (true /\
   (true /\
   (((0 < __RATE8) /\ (__RATE8 < 200)) /\
   (BArray224.is_init _b_st 0 (7 * 32)))))) ==>
   (((BArrayS.is_init res.`4 0 size) /\
    (BArray224.is_init res.`2 0 (32 * 7))) /\
   (valid res.`5))].

op __addstate_bcast_avx2x4_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB =
   hoare [M.__addstate_bcast_avx2x4 :
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
    ((((0 <= _aT) /\ (((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)) < 200)) /\
     (0 <= __TRAILB)) /\
    (__TRAILB < 256)))))))) /\
   (true /\
   (true /\
   (true /\
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
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   (((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= size)) /\
    (BArrayS.is_init _b_buf _offset __LEN)) /\
   (BArray800.is_init _b_st 0 (25 * 32)))))))))))))))))))))) ==>
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
    (((BArray800.is_init res.`2 0 (32 * 25)) /\
     (res.`3 = ((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)))) /\
    (res.`4 = (_offset + __LEN))))))))))))))))))) /\
   (valid res.`5))].

op __absorb_bcast_avx2x4_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8 =
   hoare [M.__absorb_bcast_avx2x4 :
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
   ((((((((0 <= _aT) /\ (_aT < __RATE8)) /\ (0 <= __TRAILB)) /\
       (__TRAILB < 256)) /\
      (0 < __RATE8)) /\
     (__RATE8 < 200)) /\
    (BArrayS.is_init _b_buf 0 size)) /\
   (BArray800.is_init _b_st 0 (25 * 32))))))))))) ==>
   ((true /\
    (true /\
    (true /\
    (true /\
    ((BArray800.is_init res.`2 0 (25 * 32)) /\
    (res.`3 = (((_aT + size) %% __RATE8) + ((__TRAILB <> 0) ? 1 : 0)))))))) /\
   (valid res.`4))].

op __addstate_avx2x4_spec _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN __TRAILB =
   hoare [M.__addstate_avx2x4 :
   (((__TRAILB = _TRAILB) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\
    ((_b_buf3 = b_buf3) /\
    ((_buf3 = buf3) /\
    ((_b_buf2 = b_buf2) /\
    ((_buf2 = buf2) /\
    ((_b_buf1 = b_buf1) /\
    ((_buf1 = buf1) /\
    ((_b_buf0 = b_buf0) /\
    ((_buf0 = buf0) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st)))))))))))))) /\
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
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
   (((0 <= (_offset + __LEN)) /\ ((_offset + __LEN) <= 18446744073709551615)) /\
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   ((((((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= size)) /\
       (BArray800.is_init _b_st 0 (25 * 32))) /\
      (BArrayS.is_init _b_buf0 _offset __LEN)) /\
     (BArrayS.is_init _b_buf1 _offset __LEN)) /\
    (BArrayS.is_init _b_buf2 _offset __LEN)) /\
   (BArrayS.is_init _b_buf3 _offset __LEN))))))))))))))))))))))))))) ==>
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
    (((BArray800.is_init res.`2 0 (25 * 32)) /\
     (res.`3 = ((_aT + __LEN) + ((__TRAILB <> 0) ? 1 : 0)))) /\
    (res.`4 = (_offset + __LEN))))))))))))))))))) /\
   (valid res.`5))].

op __absorb_avx2x4_spec _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __TRAILB __RATE8 =
   hoare [M.__absorb_avx2x4 :
   (((__RATE8 = _RATE8) /\
    ((__TRAILB = _TRAILB) /\
    ((_b_buf3 = b_buf3) /\
    ((_buf3 = buf3) /\
    ((_b_buf2 = b_buf2) /\
    ((_buf2 = buf2) /\
    ((_b_buf1 = b_buf1) /\
    ((_buf1 = buf1) /\
    ((_b_buf0 = b_buf0) /\
    ((_buf0 = buf0) /\ ((_aT = aT) /\ ((_b_st = b_st) /\ (_st = st))))))))))))) /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (true /\
   (((((((((((0 < __RATE8) /\ (__RATE8 < 200)) /\ (0 <= __TRAILB)) /\
          (__TRAILB < 256)) /\
         (0 <= _aT)) /\
        (_aT < __RATE8)) /\
       (BArrayS.is_init _b_buf0 0 size)) /\
      (BArrayS.is_init _b_buf1 0 size)) /\
     (BArrayS.is_init _b_buf2 0 size)) /\
    (BArrayS.is_init _b_buf3 0 size)) /\
   (BArray800.is_init _b_st 0 (25 * 32))))))))))) ==>
   ((true /\
    (true /\
    (true /\
    (true /\
    ((BArray800.is_init res.`2 0 (25 * 32)) /\
    (res.`3 = (((_aT + size) %% __RATE8) + ((__TRAILB <> 0) ? 1 : 0)))))))) /\
   (valid res.`4))].

op __dumpstate_avx2x4_spec _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN _st _b_st =
   hoare [M.__dumpstate_avx2x4 :
   (((_b_st = b_st) /\
    ((_st = st) /\
    ((__LEN = _LEN) /\
    ((_offset = offset) /\
    ((_b_buf3 = b_buf3) /\
    ((_buf3 = buf3) /\
    ((_b_buf2 = b_buf2) /\
    ((_buf2 = buf2) /\
    ((_b_buf1 = b_buf1) /\
    ((_buf1 = buf1) /\ ((_b_buf0 = b_buf0) /\ (_buf0 = buf0)))))))))))) /\
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
   (((0 <= 0) /\ (0 <= 18446744073709551615)) /\
   (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
   (((0 <= (_offset + __LEN)) /\ ((_offset + __LEN) <= 18446744073709551615)) /\
   (((0 <= size) /\ (size <= 18446744073709551615)) /\
   (((((((((0 <= _offset) /\ (0 <= __LEN)) /\ ((_offset + __LEN) <= size)) /\
        (BArray800.is_init _b_st 0 (25 * 32))) /\
       (__LEN <= 200)) /\
      (BArrayS.is_init _b_buf0 0 _offset)) /\
     (BArrayS.is_init _b_buf1 0 _offset)) /\
    (BArrayS.is_init _b_buf2 0 _offset)) /\
   (BArrayS.is_init _b_buf3 0 _offset))))))))))))))))))))))) ==>
   (((true /\ (true /\ ((0 <= res.`9) /\ (res.`9 <= 18446744073709551615)))) /\
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
     (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
     (((0 <= (_offset + __LEN)) /\
      ((_offset + __LEN) <= 18446744073709551615)) /\
     (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
     (((0 <= (_offset + __LEN)) /\
      ((_offset + __LEN) <= 18446744073709551615)) /\
     (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
     (((0 <= (_offset + __LEN)) /\
      ((_offset + __LEN) <= 18446744073709551615)) /\
     (((0 <= __LEN) /\ (__LEN <= 18446744073709551615)) /\
     (((0 <= (_offset + __LEN)) /\
      ((_offset + __LEN) <= 18446744073709551615)) /\
     ((((BArrayS.is_init res.`2 0 (_offset + __LEN)) /\
       (BArrayS.is_init res.`4 0 (_offset + __LEN))) /\
      (BArrayS.is_init res.`6 0 (_offset + __LEN))) /\
     (BArrayS.is_init res.`8 0 (_offset + __LEN))))))))))))))))))))))))))))))))))))))))))) /\
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
    (res.`9 = (_offset + __LEN))))))))))))))) /\
   (valid res.`10))].

op __squeeze_avx2x4_spec _st _b_st _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __RATE8 =
   hoare [M.__squeeze_avx2x4 :
   (((__RATE8 = _RATE8) /\
    ((_b_buf3 = b_buf3) /\
    ((_buf3 = buf3) /\
    ((_b_buf2 = b_buf2) /\
    ((_buf2 = buf2) /\
    ((_b_buf1 = b_buf1) /\
    ((_buf1 = buf1) /\
    ((_b_buf0 = b_buf0) /\
    ((_buf0 = buf0) /\ ((_b_st = b_st) /\ (_st = st))))))))))) /\
   (true /\
   (true /\
   (((0 < __RATE8) /\ (__RATE8 < 200)) /\
   (BArray800.is_init _b_st 0 (25 * 32)))))) ==>
   ((((((BArrayS.is_init res.`4 0 size) /\ (BArrayS.is_init res.`6 0 size)) /\
      (BArrayS.is_init res.`8 0 size)) /\
     (BArrayS.is_init res.`10 0 size)) /\
    (BArray800.is_init res.`2 0 (32 * 25))) /\
   (valid res.`11))].


(* The post and trace are valid. *)

lemma __SHLQ_proof _x _shbytes : (__SHLQ_spec _x _shbytes).
proof.
rewrite /__SHLQ_spec .
proc; auto .
qed .

lemma __SHLDQ_proof _x _shbytes : (__SHLDQ_spec _x _shbytes).
proof.
rewrite /__SHLDQ_spec .
 proc; auto .
qed .

lemma __SHLQ_256_proof _x _shbytes : (__SHLQ_256_spec _x _shbytes).
proof.
rewrite /__SHLQ_256_spec .
proc; auto .
qed .

lemma __m_ilen_read_upto8_at_proof _buf _lEN _tRAIL _cUR _aT :
      (__m_ilen_read_upto8_at_spec _buf _lEN _tRAIL _cUR _aT).
proof.
  rewrite /__m_ilen_read_upto8_at_spec .
  proc; auto.
 inline *. auto.   rewrite /is_init /valid /= => &m /> *. smt(List.all_cat).
(*
  seq 3: (#pre /\ valid trace___m_ilen_read_upto8_at). auto. 
  if . auto. move => &m /> *. smt().
  sp .
  if . auto. 
  + ecall (__SHLQ_proof param_0 param). auto .
    rewrite /is_init /valid /= => &m /> *. smt(List.all_cat).
  auto . 

  case(lEN = 1).
  + auto. if. exfalso. smt(). sp.
    if.  exfalso. smt(). 
    if.
    + if. auto. ecall (__SHLQ_proof param_6 param_5). auto. move => /> *.
      + smt(List.all_cat). 
      if . 
      + auto .
        ecall (__SHLQ_proof param_8 param_7).
        auto .
      auto.
  auto.
 case(lEN = 2).
  + auto. if. exfalso. smt(). sp.
    if.  
    + inline *. auto.   rewrite /is_init /valid /= => &m /> *. smt(List.all_cat).
    if.
    + if. auto. ecall (__SHLQ_proof param_6 param_5). auto. 
      if.  auto. ecall (__SHLQ_proof param_8 param_7). auto.
      auto .
    auto.
  auto.
 case(lEN = 3).
  + auto. if. exfalso. smt(). sp.
    if.  
    + inline *. auto.   rewrite /is_init /valid /= => &m /> *. smt(List.all_cat).
    if.
    + if. auto. ecall (__SHLQ_proof param_6 param_5). auto. 
      if.  auto. ecall (__SHLQ_proof param_8 param_7). auto.
      auto .
    auto.
  auto.
 case(lEN = 4).
  + auto. if.
    + auto. inline *. auto. rewrite /is_init /valid /= => &m /> *. smt(List.all_cat). sp.
    inline *. auto. 
  case(lEN = 5).
  +  auto. if.
    + auto. inline *. auto. rewrite /is_init /valid /= => &m /> *. smt(List.all_cat). sp.
    inline *. auto. 
  case(lEN = 6).
  +  auto. if.
    + auto. inline *. auto. rewrite /is_init /valid /= => &m /> *. smt(List.all_cat). sp.
    inline *. auto. 
  case(lEN = 7).
  +  auto. if.
    + auto. inline *. auto. rewrite /is_init /valid /= => &m /> *. smt(List.all_cat). sp.
    inline *. auto. 
  inline *. auto.
  smt(List.all_cat).*)
qed .

lemma __m_ilen_read_upto16_at_proof _buf _lEN _tRAIL _cUR _aT :
      (__m_ilen_read_upto16_at_spec _buf _lEN _tRAIL _cUR _aT).
proof.
  rewrite /__m_ilen_read_upto16_at_spec .
  proc; auto .
  seq 3: (#pre /\ valid trace___m_ilen_read_upto16_at). auto. 
  if . auto. smt(). sp.
  if . auto. ecall (__SHLDQ_proof param_0 param). auto. rewrite /is_init /valid /=  => &m /> *. smt(List.all_cat).
  if . auto . ecall (__m_ilen_read_upto8_at_proof param_5 param_4 param_3 param_2 param_1). auto.  rewrite /is_init /valid /=  => &m /> *. smt(List.all_cat).
  auto . 
  ecall (__m_ilen_read_upto8_at_proof param_15 param_14 param_13 param_12 
        param_11).
  auto .
  ecall (__m_ilen_read_upto8_at_proof param_10 param_9 param_8 param_7 param_6).
  auto .
  rewrite /is_init /valid /=.
  smt (List.all_cat).
qed .

lemma __m_ilen_read_upto32_at_proof _buf _lEN _tRAIL _cUR _aT :
      (__m_ilen_read_upto32_at_spec _buf _lEN _tRAIL _cUR _aT).
proof.
  rewrite /__m_ilen_read_upto32_at_spec .
  proc; auto .
  seq 3: (#pre /\ valid trace___m_ilen_read_upto32_at). auto. 
  if . auto . smt(). sp.
  if. auto. smt(List.all_cat).
  if. auto. 
  + ecall (__m_ilen_read_upto16_at_proof param_3 param_2 param_1 param_0 param). auto. smt(List.all_cat).
  auto .
  ecall (__m_ilen_read_upto16_at_proof param_13 param_12 param_11 param_10 
       param_9).
  auto .
  ecall (__m_ilen_read_upto16_at_proof param_8 param_7 param_6 param_5 param_4).
  auto .
  rewrite /is_init /valid /=.
  smt (List.all_cat).
qed .

lemma __m_ilen_read_bcast_upto8_at_proof _buf _lEN _tRAIL _cUR _aT :
      (__m_ilen_read_bcast_upto8_at_spec _buf _lEN _tRAIL _cUR _aT).
proof.
  rewrite /__m_ilen_read_bcast_upto8_at_spec .
  proc; auto .  
  seq 3: (#pre /\ valid  trace___m_ilen_read_bcast_upto8_at). auto.
  if. auto.  smt(List.all_cat).
  if. auto . 
  + ecall (__SHLQ_256_proof param_0 param). auto. smt(List.all_cat).
  auto. 
  ecall (__SHLQ_256_proof param_7 param_6).
  auto .
  ecall (__m_ilen_read_upto8_at_proof param_5 param_4 param_3 param_2 param_1).
  auto .
  rewrite /is_init /valid /= => &m /> *.  smt(List.all_cat).
qed .

lemma __m_ilen_write_upto8_proof _buf _lEN _w :
      (__m_ilen_write_upto8_spec _buf _lEN _w).
proof.
rewrite /__m_ilen_write_upto8_spec .
proc; auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __m_ilen_write_upto16_proof _buf _lEN _w :
      (__m_ilen_write_upto16_spec _buf _lEN _w).
proof.
rewrite /__m_ilen_write_upto16_spec .
proc; auto . sp.
if .
auto .
if .
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__m_ilen_write_upto8_proof param_1 param_0 param).
if. 
  auto .
  rewrite /is_init /valid /= => &m /> *. split. move => *.  split.  smt().  move => *.  smt(List.all_cat). move => *.
  smt(List.all_cat).  
auto.
smt (List.all_cat).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
qed .

lemma __m_ilen_write_upto32_proof _buf _lEN _w :
      (__m_ilen_write_upto32_spec _buf _lEN _w).
proof.
rewrite /__m_ilen_write_upto32_spec .
proc; auto . sp.
if .
auto .
if .
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__m_ilen_write_upto16_proof param_1 param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
qed .

import JWord JUtils.

lemma and_shlwE (x y: W64.t) k:
 x `&` (y `<<<` k) = ((x `>>>` k) `&` y) `<<<` k.
proof.
apply W64.ext_eq => i Hi.
rewrite andwE !shlwE andwE !shrwE !Hi /=.
case: (0 <= i - k < 64 ) => C/=; first smt().
by  rewrite (W64.get_out y) //.
qed.

lemma test_64_zf k x:
 0 <= k < 64 =>
 (TEST_64 x (W64.of_int (2^k))).`5 <=> !(x.[k]).
proof.
move => Hk; rewrite /TEST_64 /rflags_of_bwop /= /ZF_of get_to_uint Hk /=.
have ->: W64.of_int (2 ^ k) = W64.one `<<<` k by rewrite shlMP 1:/#.
rewrite and_shlwE to_uint_eq /= (:1=2^1-1) 1:/# and_mod //= to_uint_shl 1:/# of_uintK.
rewrite (modz_small (to_uint (x `>>>` k)%%2)) 1:/# modz_small.
 move: (modz_cmp (to_uint (x `>>>` k)) 2 _) => //.
 have ?: 0 <= 2^k < W64.modulus.
  split => *; first smt(gt0_pow2).
  rewrite ltz_def; split.
   apply (contra (W64.modulus = 2^k) (64=k) ).
    by apply (StdOrder.IntOrder.ieexprIn 2) => /#.
   smt().
  by apply StdOrder.IntOrder.ler_weexpn2l => /#.
 move=> ?.
 have: to_uint (x `>>>` k) %% 2 = 0 \/ to_uint (x `>>>` k) %% 2 = 1 by smt().
 by move=> [->|->] //=.
rewrite to_uint_shr 1:/#.
case: (to_uint x %/ 2 ^ k %% 2 = 0) => ?.
 smt().
smt(gt0_pow2).
qed.

lemma __m_rlen_read_upto8_proof _buf _len :
      (__m_rlen_read_upto8_spec _buf _len).
proof.
  rewrite /__m_rlen_read_upto8_spec .
  proc. auto .
  rewrite /is_init /valid /= => &m /> *.
  split. smt().
  case(len{m} = 0). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0); by auto.
  case(len{m} = 1). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 2). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 3). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 4). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 5). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 6). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 7). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
 smt().
qed.


lemma __m_rlen_write_upto8_proof _buf _data _len :
      (__m_rlen_write_upto8_spec _buf _data _len).
proof.
  rewrite /__m_rlen_write_upto8_spec .
  proc; auto .
  rewrite /is_init /valid /= => &m /> *.
  split. smt().
  case(len{m} = 0). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0); by auto.
  case(len{m} = 1). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 2). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 3). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 4). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 5). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 6). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 7). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
 smt().
qed .

lemma __ANDN_64_proof _a _b : (__ANDN_64_spec _a _b).
proof.
rewrite /__ANDN_64_spec .
proc; auto .
qed .

lemma keccakf1600_index_proof _x _y : (keccakf1600_index_spec _x _y).
proof.
rewrite /keccakf1600_index_spec .
proc; auto .
qed .

lemma keccakf1600_rho_offsets_proof _i : (keccakf1600_rho_offsets_spec _i).
proof.
rewrite /keccakf1600_rho_offsets_spec .
proc; auto .
while  (valid trace_keccakf1600_rho_offsets). auto. auto.
qed .

lemma keccakf1600_rhotates_proof _x _y : (keccakf1600_rhotates_spec _x _y).
proof.
rewrite /keccakf1600_rhotates_spec .
proc; auto .
ecall (keccakf1600_rho_offsets_proof param_1).
auto .
ecall (keccakf1600_index_proof param_0 param).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __rol_u64_ref_proof _x _i : (__rol_u64_ref_spec _x _i).
proof.
rewrite /__rol_u64_ref_spec .
proc; auto .
qed .

lemma __theta_sum_ref_proof _a _b_a : (__theta_sum_ref_spec _a _b_a).
proof.
rewrite /__theta_sum_ref_spec .
proc; auto .
while ((valid trace___theta_sum_ref) /\ BArray40.is_init b_c 0 (8*5) /\ 0<=y ).
auto .
while ((valid trace___theta_sum_ref) /\ BArray40.is_init b_c 0 (8*5) /\ 0<=y /\ 0<=x  /\ y<5).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
while ((valid trace___theta_sum_ref) /\ BArray40.is_init b_c 0 (8*x) /\ 0<=x /\ x<=5).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __theta_rol_ref_proof _c _b_c : (__theta_rol_ref_spec _c _b_c).
proof.
rewrite /__theta_rol_ref_spec .
proc; auto .
while ((valid trace___theta_rol_ref) /\ BArray40.is_init b_d 0 (x*8) /\ 0<=x /\ x<=5).
auto .
ecall (__rol_u64_ref_proof param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __rol_sum_ref_proof _a _b_a _d _b_d _y :
      (__rol_sum_ref_spec _a _b_a _d _b_d _y).
proof.
rewrite /__rol_sum_ref_spec .
proc; auto .
while ((valid trace___rol_sum_ref) /\ BArray40.is_init b_b 0 (x*8) /\ 0 <= x /\ x <= 5 ).
auto .
ecall (__rol_u64_ref_proof param_2 param_1).
auto .
ecall (keccakf1600_rhotates_proof param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __keccakf1600_pround_avx2_proof _state _b_state :
      (__keccakf1600_pround_avx2_spec _state _b_state).
proof.
rewrite /__keccakf1600_pround_avx2_spec .
 proc. rewrite /=. wp -1.
  seq 2: (valid trace___keccakf1600_pround_avx2). by auto.
  conseq (:true). smt(BArray224.init_arrP).
  by auto.
qed .

lemma __keccakf1600_avx2_proof _state _b_state :
      (__keccakf1600_avx2_spec _state _b_state).
proof.
rewrite /__keccakf1600_avx2_spec .
proc; auto .
while ((valid trace___keccakf1600_avx2) /\ 0<=r).
auto .
ecall (__keccakf1600_pround_avx2_proof param (BArray224.init_arr
                                             (W8.of_int 255))).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat BArray224.init_arrP).
auto .
ecall (__keccakf1600_pround_avx2_proof param (BArray224.init_arr
                                             (W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray224.init_arrP).
qed .

lemma _keccakf1600_avx2_proof _state _b_state :
      (_keccakf1600_avx2_spec _state _b_state).
proof.
rewrite /_keccakf1600_avx2_spec .
proc; auto .
ecall (__keccakf1600_avx2_proof param (BArray224.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray224.init_arrP).
qed .

lemma __stavx2_pack_proof _st _b_st : (__stavx2_pack_spec _st _b_st).
proof.
rewrite /__stavx2_pack_spec .
proc; auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __stavx2_unpack_proof _st _b_st _state _b_state :
      (__stavx2_unpack_spec _st _b_st _state _b_state).
proof.
rewrite /__stavx2_unpack_spec .
proc; auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma _keccakf1600_st25_avx2_proof _st25 _b_st25 :
      (_keccakf1600_st25_avx2_spec _st25 _b_st25).
proof.
rewrite /_keccakf1600_st25_avx2_spec .
proc; auto .
ecall (__stavx2_unpack_proof param_2 (BArray200.init_arr (W8.of_int 255)) 
       param_1 (BArray224.init_arr (W8.of_int 255))).
auto .
ecall (__keccakf1600_avx2_proof param_0 (BArray224.init_arr (W8.of_int 255))).
auto .
ecall (__stavx2_pack_proof param (BArray200.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray224.init_arrP BArray200.init_arrP).
qed .

lemma __u64_to_u256_proof _x _l : (__u64_to_u256_spec _x _l).
proof.
rewrite /__u64_to_u256_spec .
proc; auto .
qed .

lemma __state_init_avx2_proof  : (__state_init_avx2_spec).
proof.
rewrite /__state_init_avx2_spec .
proc; auto .
  while ((valid trace___state_init_avx2) /\ (0 <= i /\ i <= 7 /\ BArray224.is_init b_st 0 (32 * i))).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __perm_reg3456_avx2_proof _r3 _r4 _r5 _r6 :
      (__perm_reg3456_avx2_spec _r3 _r4 _r5 _r6).
proof.
rewrite /__perm_reg3456_avx2_spec .
proc; auto .
qed .

lemma __unperm_reg3456_avx2_proof _st3 _st4 _st5 _st6 :
      (__unperm_reg3456_avx2_spec _st3 _st4 _st5 _st6).
proof.
rewrite /__unperm_reg3456_avx2_spec .
proc; auto .
qed .

lemma __addstate_r3456_avx2_proof _st _b_st _r3 _r4 _r5 _r6 :
      (__addstate_r3456_avx2_spec _st _b_st _r3 _r4 _r5 _r6).
proof.
rewrite /__addstate_r3456_avx2_spec .
proc; auto .
ecall (__perm_reg3456_avx2_proof param_2 param_1 param_0 param).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray224.init_arrP).
qed .

lemma __stavx2_pos_avx2_proof _pOS : (__stavx2_pos_avx2_spec _pOS).
proof.
rewrite /__stavx2_pos_avx2_spec .
proc; auto .
qed .

lemma __addratebit_avx2_proof _st _b_st _rATE_8 :
      (__addratebit_avx2_spec _st _b_st _rATE_8).
proof.
rewrite /__addratebit_avx2_spec .
  proc; auto . seq 10: (#pre /\ valid trace___addratebit_avx2 /\ 0<=r /\ r < 7 ).
  + auto .
    ecall (__stavx2_pos_avx2_proof param).  auto. smt(List.all_cat).
if .
auto .
rewrite /is_init /valid /=.
smt (BArray224.init_arrP List.all_cat).
auto .
ecall (__u64_to_u256_proof param_1 param_0).

auto .
rewrite /is_init /valid /= .
smt (BArray224.init_arrP List.all_cat).
qed .

lemma _keccakf1600_4x_pround_proof _e _b_e _a _b_a _r8 _r56 :
      (_keccakf1600_4x_pround_spec _e _b_e _a _b_a _r8 _r56).
proof.
rewrite /_keccakf1600_4x_pround_spec .
proc; auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __keccakf1600_avx2x4_proof _a _b_a :
      (__keccakf1600_avx2x4_spec _a _b_a).
proof.
rewrite /__keccakf1600_avx2x4_spec .
  proc; auto.
while ((valid trace___keccakf1600_avx2x4) /\ 0 <=  c /\ ( c) %% 2 = 0).
auto .
ecall (_keccakf1600_4x_pround_proof param_6 b_param_0 param_5 b_param 
       param_4 param_3).
auto .
ecall (_keccakf1600_4x_pround_proof param_2 b_param_1 param_1 (
                                                              BArray800.init_arr
                                                              (W8.of_int 255)
                                                              ) param_0 
       param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat BArray800.init_arrP).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray800.init_arrP).
qed .

lemma _keccakf1600_avx2x4_proof _a _b_a : (_keccakf1600_avx2x4_spec _a _b_a).
proof.
rewrite /_keccakf1600_avx2x4_spec .
proc; auto .
ecall (__keccakf1600_avx2x4_proof param (BArray800.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray800.init_arrP).
qed .

lemma _keccakf1600_avx2x4__proof _a _b_a :
      (_keccakf1600_avx2x4__spec _a _b_a).
proof.
rewrite /_keccakf1600_avx2x4__spec .
proc; auto .
ecall (_keccakf1600_avx2x4_proof param (BArray800.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray800.init_arrP).
qed .

lemma __u256x4_4u64x4_proof _x0 _x1 _x2 _x3 :
      (__u256x4_4u64x4_spec _x0 _x1 _x2 _x3).
proof.
rewrite /__u256x4_4u64x4_spec .
proc; auto .
qed .

lemma __st4x_pack_proof _st4x _b_st4x _st0 _b_st0 _st1 _b_st1 _st2 _b_st2 _st3 _b_st3 :
      (__st4x_pack_spec _st4x _b_st4x _st0 _b_st0 _st1 _b_st1 _st2 _b_st2
      _st3 _b_st3).
proof.
rewrite /__st4x_pack_spec .
proc; auto .
while ((valid trace___st4x_pack) /\ 0<=i /\ BArray800.is_init b_st4x 0 (32*(4*i))).
auto .
ecall (__u256x4_4u64x4_proof param_2 param_1 param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __4u64x4_u256x4_proof _y0 _y1 _y2 _y3 :
      (__4u64x4_u256x4_spec _y0 _y1 _y2 _y3).
proof.
rewrite /__4u64x4_u256x4_spec .
proc; auto .
qed .

lemma __st4x_unpack_proof _st0 _b_st0 _st1 _b_st1 _st2 _b_st2 _st3 _b_st3 _st4x _b_st4x :
      (__st4x_unpack_spec _st0 _b_st0 _st1 _b_st1 _st2 _b_st2 _st3 _b_st3
      _st4x _b_st4x).
proof.
rewrite /__st4x_unpack_spec .
proc; auto .
while ((valid trace___st4x_unpack) /\ 0<= i /\ i<=6 /\ BArray200.is_init b_st0 0 (32*i) /\ BArray200.is_init b_st1 0 (32*i) /\ BArray200.is_init b_st2 0 (32*i) /\ BArray200.is_init b_st3 0 (32*i)).
auto .
ecall (__4u64x4_u256x4_proof param_2 param_1 param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __keccakf1600_pround_unpacked_proof _st0 _b_st0 _st1 _b_st1 _st2 _b_st2 _st3 _b_st3 :
      (__keccakf1600_pround_unpacked_spec _st0 _b_st0 _st1 _b_st1 _st2 
      _b_st2 _st3 _b_st3).
proof.
rewrite /__keccakf1600_pround_unpacked_spec .
proc; auto .
ecall (__st4x_unpack_proof param_12 (BArray200.init_arr (W8.of_int 255)) 
       param_11 (BArray200.init_arr (W8.of_int 255)) param_10 (
                                                              BArray200.init_arr
                                                              (W8.of_int 255)
                                                              ) param_9 
       (BArray200.init_arr (W8.of_int 255)) param_8 (BArray800.init_arr
                                                    (W8.of_int 255))).
auto .
ecall (_keccakf1600_4x_pround_proof param_7 b_param param_6 (
                                                            BArray800.init_arr
                                                            (W8.of_int 255)) 
       param_5 param_4).
auto .
ecall (__st4x_pack_proof param_3 b_param_0 param_2 (BArray200.init_arr
                                                   (W8.of_int 255)) param_1 
       (BArray200.init_arr (W8.of_int 255)) param_0 (BArray200.init_arr
                                                    (W8.of_int 255)) 
       param (BArray200.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray800.init_arrP BArray200.init_arrP).
qed .

lemma __keccakf1600_pround_equiv_proof _e _b_e _a _b_a :
      (__keccakf1600_pround_equiv_spec _e _b_e _a _b_a).
proof.
rewrite /__keccakf1600_pround_equiv_spec .
proc; auto .
ecall (__st4x_pack_proof param_12 b_param param_11 (BArray200.init_arr
                                                   (W8.of_int 255)) param_10 
       (BArray200.init_arr (W8.of_int 255)) param_9 (BArray200.init_arr
                                                    (W8.of_int 255)) 
       param_8 (BArray200.init_arr (W8.of_int 255))).
auto .
ecall (__keccakf1600_pround_unpacked_proof param_7 (BArray200.init_arr
                                                   (W8.of_int 255)) param_6 
       (BArray200.init_arr (W8.of_int 255)) param_5 (BArray200.init_arr
                                                    (W8.of_int 255)) 
       param_4 (BArray200.init_arr (W8.of_int 255))).
auto .
ecall (__st4x_unpack_proof param_3 b_param_3 param_2 b_param_2 param_1 
       b_param_1 param_0 b_param_0 param (BArray800.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray800.init_arrP BArray200.init_arrP).
qed .

lemma __state_init_avx2x4_proof _st _b_st :
      (__state_init_avx2x4_spec _st _b_st).
proof.
rewrite /__state_init_avx2x4_spec .
proc; auto .
while ((valid trace___state_init_avx2x4) /\ 0<= i /\ i<= 800 /\ BArray800.is_init b_st 0 i /\ i%%32 = 0).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __addratebit_avx2x4_proof _st _b_st _rATE8 :
      (__addratebit_avx2x4_spec _st _b_st _rATE8).
proof.
rewrite /__addratebit_avx2x4_spec .
proc; auto .
rewrite /is_init /valid /= .
smt (BArray800.init_arrP).
qed .

lemma __a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (__a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL
      _cUR _aT).
proof.
rewrite /__a_ilen_read_upto8_at_spec .
  proc; auto .
seq 3: (#pre /\ valid trace___a_ilen_read_upto8_at). auto. 
  if . auto. move => &m /> *. smt().
  sp .
  if . auto. 
  + ecall (__SHLQ_proof param_0 param). auto .
    rewrite /is_init /valid /= => &m /> *. smt(List.all_cat). 
  case(lEN = 1).
  + auto. if. exfalso. smt(). sp.
    if.  exfalso. smt(). 
    if.
    + if. auto. ecall (__SHLQ_proof param_6 param_5). auto. move => /> *.
      + smt(List.all_cat). 
      if . 
      + auto .
        ecall (__SHLQ_proof param_8 param_7).
        auto .
      auto.
    auto.  smt().
  case(lEN = 2).
  + auto. if. exfalso. smt(). sp.
    if.  
    + inline *. auto.   rewrite /is_init /valid /= => &m /> *. smt(List.all_cat).
    if.
    + if. auto. ecall (__SHLQ_proof param_6 param_5). auto. 
      if.  auto. ecall (__SHLQ_proof param_8 param_7). auto.
      auto .
    auto. smt().
  case(lEN = 3).
  + auto. if. exfalso. smt(). sp.
    if.  
    + inline *. auto.   rewrite /is_init /valid /= => &m /> *. smt(List.all_cat).
    if.
    + if. auto. ecall (__SHLQ_proof param_6 param_5). auto. 
      if.  auto. ecall (__SHLQ_proof param_8 param_7). auto.
      auto .
    auto.
  auto. smt().
  case(lEN = 4).
  + auto. if.
    + auto. inline *. auto. rewrite /is_init /valid /= => &m /> *.  split; smt(List.all_cat).  sp.
    inline *. auto. 
  case(lEN = 5).
  +  auto. if.
    + auto. inline *. auto. rewrite /is_init /valid /= => &m /> *. split. move => *. split. smt(List.all_cat). smt(List.all_cat). smt(List.all_cat). sp.
    inline *. auto. 
  case(lEN = 6).
  +  auto. if.
    + auto. inline *. auto. rewrite /is_init /valid /= => &m /> *. split. move => *. split. smt(List.all_cat). smt(List.all_cat). smt(List.all_cat). sp.
    inline *. auto. 
  case(lEN = 7).
  +  auto. if.
     + auto. inline *. auto. rewrite /is_init /valid /= => &m /> *.
       split. move => *. split. move => *. split. move => * . split.  move => *.  split.  rewrite !List.all_cat /=. smt().  rewrite !List.all_cat /=. smt().  rewrite !List.all_cat /=. smt().   rewrite !List.all_cat /=. smt(). 
       rewrite !List.all_cat /=.  smt().  rewrite !List.all_cat /=. smt(). 
    inline *. by auto. 
  inline *. auto.
  smt(List.all_cat).
qed .

lemma __a_ilen_read_upto16_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (__a_ilen_read_upto16_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL
      _cUR _aT).
proof.
rewrite /__a_ilen_read_upto16_at_spec .
proc; auto . sp.
if .
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
sp. if .
auto .
ecall (__SHLDQ_proof param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
if .
auto .
ecall (__a_ilen_read_upto8_at_proof param_7 b_param param_6 param_5 param_4 
       param_3 param_2 param_1).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__a_ilen_read_upto8_at_proof param_21 b_param_0 param_20 param_19 
       param_18 param_17 param_16 param_15).
auto .
ecall (__a_ilen_read_upto8_at_proof param_14 b_param_1 param_13 param_12 
       param_11 param_10 param_9 param_8).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
qed .

lemma __a_ilen_read_upto32_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (__a_ilen_read_upto32_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL
      _cUR _aT).
proof.
rewrite /__a_ilen_read_upto32_at_spec .
proc; auto . sp.
if .
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
sp. if .
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
if .
auto .
ecall (__a_ilen_read_upto16_at_proof param_5 b_param param_4 param_3 
       param_2 param_1 param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__a_ilen_read_upto16_at_proof param_19 b_param_0 param_18 param_17 
       param_16 param_15 param_14 param_13).
auto .
ecall (__a_ilen_read_upto16_at_proof param_12 b_param_1 param_11 param_10 
       param_9 param_8 param_7 param_6).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
qed .

lemma __a_ilen_read_bcast_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (__a_ilen_read_bcast_upto8_at_spec _buf _b_buf _offset _dELTA _lEN
      _tRAIL _cUR _aT).
proof.
rewrite /__a_ilen_read_bcast_upto8_at_spec .
proc; auto . sp.
if .
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
if .
auto .
ecall (__SHLQ_256_proof param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__SHLQ_256_proof param_9 param_8).
auto .
ecall (__a_ilen_read_upto8_at_proof param_7 b_param param_6 param_5 param_4 
       param_3 param_2 param_1).
auto .
  rewrite /is_init /valid /= => &m /> *. smt(List.all_cat). 
qed .

lemma __a_ilen_write_upto8_proof _buf _b_buf _offset _dELTA _lEN _w :
      (__a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w).
proof.
rewrite /__a_ilen_write_upto8_spec .
proc; auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .


lemma __a_ilen_write_upto16_proof _buf _b_buf _offset _dELTA _lEN _w :
      (__a_ilen_write_upto16_spec _buf _b_buf _offset _dELTA _lEN _w).
proof.
rewrite /__a_ilen_write_upto16_spec .
proc; auto . sp.
if .
 + auto . 
   if .
   + auto . rewrite /is_init /valid /=.
     smt (List.all_cat).
   auto .
   ecall (__a_ilen_write_upto8_proof param_3 b_param param_2 param_1 param_0 param). 
  if. auto. rewrite /is_init /valid /=. move => &m /> * . smt(List.all_cat).
  auto. rewrite /is_init /valid /= => &m /> *. smt(List.all_cat).
  auto .
  rewrite /is_init /valid /= => &m /> *.
  smt (List.all_cat).
qed .

lemma __a_ilen_write_upto32_proof _buf _b_buf _offset _dELTA _lEN _w :
      (__a_ilen_write_upto32_spec _buf _b_buf _offset _dELTA _lEN _w).
proof.
  rewrite /__a_ilen_write_upto32_spec .
  proc; auto .
  sp. if .
  + auto .
    if .
    + auto .
      rewrite /is_init /valid /=.
      smt (List.all_cat).
    auto .
    ecall (__a_ilen_write_upto16_proof param_3 b_param param_2 param_1 param_0  param).
    auto .
    rewrite /is_init /valid /=.
    smt (List.all_cat).
  auto .
  rewrite /is_init /valid /=.
  smt (List.all_cat).
qed .

lemma __a_rlen_read_upto8_proof _a _b_a _off _len :
      (__a_rlen_read_upto8_spec _a _b_a _off _len).
proof.
rewrite /__a_rlen_read_upto8_spec .
  proc; auto. rewrite /is_init /valid /= => &m /> *.
  split. smt().
  case(len{m} = 0). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0); by auto.
  case(len{m} = 1). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 2). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 3). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 4). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 5). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 6). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 7). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
 smt().
qed .

lemma __a_rlen_read_upto8_noninline_proof _a _b_a _off_ _len_ :
      (__a_rlen_read_upto8_noninline_spec _a _b_a _off_ _len_).
proof.
rewrite /__a_rlen_read_upto8_noninline_spec .
proc; auto .
  rewrite /is_init /valid /= => &m /> *.
  split. smt().
  case(len_{m} = 0). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0); by auto.
  case(len_{m} = 1). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len_{m} = 2). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len_{m} = 3). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len_{m} = 4). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len_{m} = 5). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len_{m} = 6). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len_{m} = 7). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
 smt().
qed .

lemma __a_rlen_write_upto8_proof _buf _b_buf _off _data _len :
      (__a_rlen_write_upto8_spec _buf _b_buf _off _data _len).
proof.
rewrite /__a_rlen_write_upto8_spec .
proc; auto .
rewrite /is_init /valid /= => &m /> *.
  split. smt().
  case(len{m} = 0). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0); by auto.
  case(len{m} = 1). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 2). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 3). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 4). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 5). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 6). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
  case(len{m} = 7). move => len. rewrite !len /=.  rewrite (test_64_zf 2). by auto. rewrite (test_64_zf 1). by auto. rewrite  (test_64_zf 0). by auto.
  + rewrite !W64.of_intE. rewrite /BitEncoding.BS2Int.int2bs /mkseq  -!iotaredE /=.  smt().
 smt().
qed .

lemma __addstate_avx2_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :
      (__addstate_avx2_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB).
proof.
rewrite /__addstate_avx2_spec .
  proc; have:= inbounds_size => /= ?.
  seq 29: (valid trace___addstate_avx2 /\ offset = _offset /\ BArrayS.is_init b_buf _offset __LEN /\
          dELTA = (_aT < 8) ? (( __LEN < (8 - _aT)) ? __LEN : (8-_aT)) : 0 /\
          _LEN = __LEN - dELTA /\ _TRAILB = ((8 <= _aT + __LEN) ? __TRAILB : 0) /\
          aT = _aT + dELTA +  (( 8 <= _aT  || (8 <= _aT + __LEN || __TRAILB=0)) ? 0 : 1) /\ 0 <= _offset /\ 0<=__LEN /\ 0<=_aT /\ offset = _offset /\
          _offset + __LEN <= size /\ _aT + __LEN + (if __TRAILB <> 0 then 1 else 0) < 200 /\ 0<= __TRAILB /\ __TRAILB<256).
  + sp. if.  
    + if . auto.  rewrite /valid /is_init /= => &m /> *. rewrite !W64.to_uintK_small /=. smt().  split. split. smt(). smt().  smt().
      auto. ecall (__a_ilen_read_upto8_at_proof param_5 b_param_8 param_4 param_3  param_2 param_1 param_0 param). auto. 
      rewrite /valid /is_init /= => &m /> *. split.  split. smt(). split. smt(). split. smt(). smt().  move => /> *. smt(List.all_cat). 
    auto. rewrite /valid /is_init /= => &m /> *. smt(List.all_cat).
  seq 1: (valid trace___addstate_avx2 /\ offset = _offset /\  BArrayS.is_init b_buf _offset __LEN /\
          dELTA = (_aT < 40) ? (( __LEN < (40 - _aT)) ? __LEN : (40-_aT)) : 0 /\
          _LEN = __LEN - dELTA /\ _TRAILB = ((40 <= _aT + __LEN) ? __TRAILB : 0) /\
          aT = _aT + dELTA +  (( 40 <= _aT  || (40 <= _aT + __LEN || __TRAILB=0)) ? 0 : 1) /\ 0 <= _offset /\ 0<=__LEN /\ 0<=_aT /\ offset = _offset /\
          _offset + __LEN <= size /\ _aT + __LEN + (if __TRAILB <> 0 then 1 else 0) < 200 /\ 0<= __TRAILB /\ __TRAILB<256).
  + if.
    + auto. ecall (__a_ilen_read_upto32_at_proof param_12 b_param_7 param_11 param_10  param_9 param_8 param_7 param_6). auto.
  rewrite /valid /is_init /= => &m /> *.  split. split. smt(). split. smt(). split. smt().  split. smt(). split. smt(). split. smt(). split. smt().  smt(). move => 16? r *. 
      split. rewrite !List.all_cat /=. smt(). split.  smt(). split. smt(). split. smt(). smt().
    auto. rewrite /valid /is_init => &m /> *. smt(List.all_cat).
  if. 
  + seq 18:(valid trace___addstate_avx2 /\ offset = _offset /\  BArrayS.is_init b_buf _offset __LEN /\
           dELTA = (_aT < 48) ? (( __LEN < (48 - _aT)) ? __LEN : (48-_aT)) : 0 /\
          _LEN = __LEN - dELTA /\ _TRAILB = ((48 <= _aT + __LEN) ? __TRAILB : 0) /\
          aT = _aT + dELTA +  (( 48 <= _aT  || (48 <= _aT + __LEN || __TRAILB=0)) ? 0 : 1) /\ 0 <= _offset /\ 0<=__LEN /\ 0<=_aT /\ offset = _offset /\
          _offset + __LEN <= size /\ _aT + __LEN + (if __TRAILB <> 0 then 1 else 0) < 200 /\ 0<= __TRAILB /\ __TRAILB<256). 
    + auto.  ecall (__a_ilen_read_upto8_at_proof param_19 b_param_6 param_18 param_17 param_16 param_15 param_14 param_13).
      auto . rewrite /valid /is_init /= => &m /> *. split. smt(List.all_cat). move => *. split. rewrite !List.all_cat /=. smt(). split. smt(). split. smt(). split. smt(). smt().
    if.
    + auto. ecall (__addstate_r3456_avx2_proof param_73 (BArray224.init_arr (W8.of_int 255)) param_72 param_71 param_70 param_69).
      auto .
      seq 33:(valid trace___addstate_avx2 /\ offset = _offset /\  BArrayS.is_init b_buf _offset __LEN /\
           dELTA = (_aT < 88) ? (( __LEN < (88 - _aT)) ? __LEN : (88-_aT)) : 0 /\
          _LEN = __LEN - dELTA /\ _TRAILB = ((88 <= _aT + __LEN) ? __TRAILB : 0) /\
          aT = _aT + dELTA +  (( 88 <= _aT  || (88 <= _aT + __LEN || __TRAILB=0)) ? 0 : 1) /\ 0 <= _offset /\ 0<=__LEN /\ 0<=_aT /\ offset = _offset /\
          _offset + __LEN <= size /\ _aT + __LEN + (if __TRAILB <> 0 then 1 else 0) < 200 /\ 0<= __TRAILB /\ __TRAILB<256).
      + auto.
        ecall (__a_ilen_read_upto8_at_proof param_33 b_param_4 param_32 param_31  param_30 param_29 param_28 param_27).
        auto .
        ecall (__a_ilen_read_upto32_at_proof param_26 b_param_5 param_25 param_24 param_23 param_22 param_21 param_20). auto.
        rewrite /is_init /valid /= => &m /> *.   split. smt(List.all_cat). move => *. split. smt(List.all_cat). move => *. split. rewrite !List.all_cat /=. smt(). split. smt(). split. smt(). split. smt(). smt().
      seq 33:(valid trace___addstate_avx2 /\ offset = _offset /\  BArrayS.is_init b_buf _offset __LEN /\
           dELTA = (_aT < 128) ? (( __LEN < (128 - _aT)) ? __LEN : (128-_aT)) : 0 /\
          _LEN = __LEN - dELTA /\ _TRAILB = ((128 <= _aT + __LEN) ? __TRAILB : 0) /\
          aT = _aT + dELTA +  (( 128 <= _aT  || (128 <= _aT + __LEN || __TRAILB=0)) ? 0 : 1) /\ 0 <= _offset /\ 0<=__LEN /\ 0<=_aT /\ offset = _offset /\
          _offset + __LEN <= size /\ _aT + __LEN + (if __TRAILB <> 0 then 1 else 0) < 200 /\ 0<= __TRAILB /\ __TRAILB<256).
      + auto.
        ecall (__a_ilen_read_upto8_at_proof param_47 b_param_2 param_46 param_45 param_44 param_43 param_42 param_41). auto .
        ecall (__a_ilen_read_upto32_at_proof param_40 b_param_3 param_39 param_38 param_37 param_36 param_35 param_34). auto.
        rewrite /is_init /valid /= => &m /> *.   split. smt(List.all_cat). move => *. split. smt().  move => *. split. rewrite !List.all_cat /=. smt(). split. smt(). split. smt(). split. smt(). smt().
      ecall (__a_ilen_read_upto32_at_proof param_68 b_param param_67 param_66 param_65 param_64 param_63 param_62). auto .
      ecall (__a_ilen_read_upto8_at_proof param_61 b_param_0 param_60 param_59 param_58 param_57 param_56 param_55). auto.
      ecall (__a_ilen_read_upto32_at_proof param_54 b_param_1 param_53 param_52 param_51 param_50 param_49 param_48). auto.
      rewrite /is_init /valid /= => &m /> *. split. split. smt(). smt().
      move => *. split. move => /> *. split. smt(). split. smt(). split. smt(). smt().  move => *. split. smt(). move => *. split. smt(BArray224.init_arrP). move => *.  rewrite !List.all_cat /=. split.  smt(). smt().
    auto. rewrite /is_init /valid /= => &m /> *. rewrite !List.all_cat /=. smt(BArray224.init_arrP).
  auto .
  rewrite /is_init /valid /= => &m /> *. rewrite !List.all_cat /=. 
  smt  (BArray224.init_arrP). 
qed .

lemma __absorb_avx2_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :
      (__absorb_avx2_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8).
proof.
rewrite /__absorb_avx2_spec .
  proc; have:= inbounds_size => /= ?. auto .
  seq 23: (#pre /\ valid  trace___absorb_avx2). auto.
  seq 19: (valid  trace___absorb_avx2).
  + auto. ecall (__addstate_avx2_proof param_18 (BArray224.init_arr (W8.of_int 255)) 
       param_17 param_16 (BArrayS.init_arr (W8.of_int 255)) param_15 
       param_14 param_13).
    auto. sp.
    if.
    + wp.
      while( valid trace___absorb_avx2 /\ 0<=i /\ i<=iTERS /\ 0<= offset /\  0<=_LEN /\  _RATE8 < 200 /\ iTERS * _RATE8 <= _LEN /\
             offset = i * _RATE8 + _RATE8 - _aT /\ _LEN - _aT + _RATE8 <= size /\ 0<= _aT /\ iTERS <= _LEN /\ _aT < _RATE8
          ). 
      + auto. 
        ecall (_keccakf1600_avx2_proof param_12 (BArray224.init_arr (W8.of_int 255))). auto .
        ecall (__addstate_avx2_proof param_11 (BArray224.init_arr (W8.of_int 255)) param_10 param_9 (BArrayS.init_arr (W8.of_int 255)) param_8 param_7 param_6). auto .
        rewrite /is_init /valid /= => &m /> *. split. split. smt(). split. smt(). split. split. smt().
        have ?: (i{m} + 1) * _RATE8{m} <= _LEN{m}.  smt(). smt().
        have ?: i{m} * _RATE8{m} + _RATE8{m} - _aT + _RATE8{m} <= size. smt().
        split. smt(). split. split. smt(). smt(BArrayS.init_arrP). smt(BArray224.init_arrP). move => *. smt(List.all_cat).
      auto. 
      ecall (_keccakf1600_avx2_proof param_5 (BArray224.init_arr (W8.of_int 255))).
      auto .
      ecall (__addstate_avx2_proof param_4 (BArray224.init_arr (W8.of_int 255))  param_3 param_2 (BArrayS.init_arr (W8.of_int 255)) param_1 param_0 param).
      auto .
      rewrite /is_init /valid /= => &m /> *. split. smt(BArrayS.init_arrP BArray224.init_arrP). move => *. split. smt(List.all_cat). move => *.
      split. smt(BArrayS.init_arrP).  move => *. smt(List.all_cat).
    auto. move => /> *. split. smt(BArrayS.init_arrP BArray224.init_arrP). move => *. smt( List.all_cat).
  if. auto. ecall(__addratebit_avx2_proof param_20 (BArray224.init_arr (W8.of_int 255)) param_19). auto.     
  +  smt (List.all_cat BArrayS.init_arrP BArray224.init_arrP).
  auto. smt(BArray224.init_arrP).        
qed .

lemma __dumpstate_avx2_proof _buf _b_buf _offset __LEN _st _b_st :
      (__dumpstate_avx2_spec _buf _b_buf _offset __LEN _st _b_st).
proof.
  rewrite /__dumpstate_avx2_spec .
  proc . have:= inbounds_size => /= ?.
  seq 47: (#pre /\ valid trace___dumpstate_avx2). by auto.
  sp.
  seq 1: (valid trace___dumpstate_avx2 /\ __LEN <= 200 /\ BArrayS.is_init b_buf 0 (_offset + dELTA) /\ 0<=__LEN /\ _LEN = __LEN - dELTA /\
          dELTA = (if __LEN < 8 then __LEN else 8) /\ offset = _offset /\ 0<=_offset /\ _offset + __LEN <= size).
  + if. auto. ecall(__a_ilen_write_upto32_proof param_3 b_param_8 param_2 param_1 param_0 param). auto.
    + rewrite /valid /is_init /= => &m /> *.  smt(List.all_cat).
    auto .  ecall(__a_ilen_write_upto32_proof param_8 b_param_9 param_7 param_6 param_5 param_4). auto.
    rewrite /valid /is_init /= => &m /> *.  smt(List.all_cat).
  seq 13: (valid trace___dumpstate_avx2 /\ __LEN <= 200 /\ BArrayS.is_init b_buf 0 (_offset + dELTA) /\ 0<=__LEN /\ _LEN = __LEN - dELTA /\
          dELTA = (if __LEN < 40 then __LEN else 40) /\ offset = _offset /\ 0<=_offset /\ _offset + __LEN <= size).
  + auto.  ecall(__a_ilen_write_upto32_proof param_13 b_param_7 param_12 param_11 param_10 param_9). auto.
    rewrite /valid /is_init /= => &m /> *.  smt(List.all_cat).
  if.
  + seq 17:(valid trace___dumpstate_avx2 /\ __LEN <= 200 /\ BArrayS.is_init b_buf 0 (_offset + dELTA) /\ 0<=__LEN /\ _LEN = __LEN - dELTA /\
          dELTA = (if __LEN < 48 then __LEN else 48) /\ offset = _offset /\ 0<=_offset /\ _offset + __LEN <= size).
    + auto. ecall(__a_ilen_write_upto8_proof param_18 b_param_6 param_17 param_16 param_15 param_14). auto. 
      rewrite /valid /is_init /= => &m /> *.  smt(List.all_cat).
    if.
    + seq 18: (valid trace___dumpstate_avx2 /\ __LEN <= 200 /\ BArrayS.is_init b_buf 0 (_offset + dELTA) /\ 0<=__LEN /\ _LEN = __LEN - dELTA /\
          dELTA = (if __LEN < 80 then __LEN else 80) /\ offset = _offset /\ 0<=_offset /\ _offset + __LEN <= size).
      + auto. ecall(__a_ilen_write_upto32_proof param_23 b_param_5 param_22 param_21 param_20 param_19). auto.
        rewrite /valid /is_init /= => &m /> *.  smt(List.all_cat).
      seq 1: (valid trace___dumpstate_avx2 /\ __LEN <= 200 /\ BArrayS.is_init b_buf 0 (_offset + dELTA) /\ 0<=__LEN /\ _LEN = __LEN - dELTA /\
          dELTA = (if __LEN < 88 then __LEN else 88) /\ offset = _offset /\ 0<=_offset /\ _offset + __LEN <= size).
      + if. auto. ecall(__a_ilen_write_upto8_proof param_28 b_param_4 param_27 param_26 param_25 param_24). auto. 
        + rewrite /valid /is_init /= => &m /> *.  smt(List.all_cat).
        auto. smt().
      seq 1: (valid trace___dumpstate_avx2 /\ __LEN <= 200 /\ BArrayS.is_init b_buf 0 (_offset + dELTA) /\ 0<=__LEN /\ _LEN = __LEN - dELTA /\
          dELTA = (if __LEN < 120 then __LEN else 120) /\ offset = _offset /\ 0<=_offset /\ _offset + __LEN <= size).
      + if. auto. ecall(__a_ilen_write_upto32_proof param_33 b_param_3 param_32 param_31 param_30 param_29). auto. 
        + rewrite /valid /is_init /= => &m /> *.  smt(List.all_cat).
        auto. smt(). 
      seq 1: (valid trace___dumpstate_avx2 /\ __LEN <= 200 /\ BArrayS.is_init b_buf 0 (_offset + dELTA) /\ 0<=__LEN /\ _LEN = __LEN - dELTA /\
          dELTA = (if __LEN < 128 then __LEN else 128) /\ offset = _offset /\ 0<=_offset /\ _offset + __LEN <= size).
      + if. auto. ecall(__a_ilen_write_upto8_proof param_38 b_param_2 param_37 param_36 param_35 param_34). auto. 
        + rewrite /valid /is_init /= => &m /> *.  smt(List.all_cat).
        auto. smt().
      seq 1: (valid trace___dumpstate_avx2 /\ __LEN <= 200 /\ BArrayS.is_init b_buf 0 (_offset + dELTA) /\ 0<=__LEN /\ _LEN = __LEN - dELTA /\
          dELTA = (if __LEN < 160 then __LEN else 160) /\ offset = _offset /\ 0<=_offset /\ _offset + __LEN <= size).
      + if. auto. ecall(__a_ilen_write_upto32_proof param_43 b_param_1 param_42 param_41 param_40 param_39). auto. 
        + rewrite /valid /is_init /= => &m /> *.  smt(List.all_cat).
        auto. smt(). 
      seq 1: (valid trace___dumpstate_avx2 /\ __LEN <= 200 /\ BArrayS.is_init b_buf 0 (_offset + dELTA) /\ 0<=__LEN /\ _LEN = __LEN - dELTA /\
          dELTA = (if __LEN < 168 then __LEN else 168) /\ offset = _offset /\ 0<=_offset /\ _offset + __LEN <= size).
      + if. auto. ecall(__a_ilen_write_upto8_proof param_48 b_param_0 param_47 param_46 param_45 param_44). auto. 
        + rewrite /valid /is_init /= => &m /> *.  smt(List.all_cat).
        auto. smt().
      seq 1: (valid trace___dumpstate_avx2 /\ __LEN <= 200 /\ BArrayS.is_init b_buf 0 (_offset + dELTA) /\ 0<=__LEN /\
              dELTA =__LEN /\ offset = _offset /\ 0<=_offset /\ _offset + __LEN <= size).
      + if. auto. ecall(__a_ilen_write_upto32_proof param_53 b_param param_52 param_51 param_50 param_49). auto. 
        + rewrite /valid /is_init /= => &m /> *. smt(List.all_cat).
        auto. smt(). 
      auto. smt(List.all_cat).
    auto. smt(List.all_cat).
  auto. smt(List.all_cat).
qed .


lemma __squeeze_avx2_proof _st _b_st _buf _b_buf __RATE8 :
      (__squeeze_avx2_spec _st _b_st _buf _b_buf __RATE8).
proof.
  rewrite /__squeeze_avx2_spec.
  proc. have:= inbounds_size => /= ?.
  seq 18: (#pre /\ valid trace___squeeze_avx2). by auto.
  sp.
  seq 1: (lO = size %% _RATE8/\ offset =  size - lO /\ 0<_RATE8 /\ _RATE8 < 200 /\
          BArrayS.is_init b_buf 0 (size-lO) /\ valid trace___squeeze_avx2).
  + while(valid trace___squeeze_avx2 /\ 0 <= i /\ i<= iTERS /\ offset = i*_RATE8 /\ 0<_RATE8 /\ _RATE8 < 200 /\ BArrayS.is_init b_buf 0 offset /\ iTERS*_RATE8 <= size).
    + auto. ecall(__dumpstate_avx2_proof param_3 b_param_0 param_2 param_1 param_0 (BArray224.init_arr (W8.of_int 255))). auto.                            
      ecall(_keccakf1600_avx2_proof param (BArray224.init_arr (W8.of_int 255))). auto. 
      rewrite /valid /is_init /= => &m /> *.  split.  smt(BArray224.init_arrP). move => *. split. smt(). move => *.  split. rewrite !List.all_cat /=. smt(). smt().
    auto.  rewrite /valid /is_init /= => &m /> *. smt(List.all_cat).
  if.
  + auto. ecall(__dumpstate_avx2_proof param_8 b_param param_7 param_6 param_5 (BArray224.init_arr (W8.of_int 255))). auto.
    ecall(_keccakf1600_avx2_proof param_4 (BArray224.init_arr (W8.of_int 255))). auto. 
    rewrite /valid /is_init /= => &m /> *.  smt(BArray224.init_arrP List.all_cat).
  auto. smt(BArray224.init_arrP).
qed.

lemma __addstate_bcast_avx2x4_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :
      (__addstate_bcast_avx2x4_spec _st _b_st _aT _buf _b_buf _offset 
      __LEN __TRAILB).
proof.
  rewrite /__addstate_bcast_avx2x4_spec .
  proc; have:= inbounds_size => /= ?. auto .
  seq 8: (#pre /\ valid  trace___addstate_bcast_avx2x4). by auto.
  seq 13:(valid  trace___addstate_bcast_avx2x4 /\ BArrayS.is_init b_buf _offset __LEN /\ 0<= _TRAILB /\ _TRAILB < 256 /\ 0 <= _offset /\ 0 <= __LEN /\ 0<=at <= 768 /\ (_TRAILB = (8 <= _aT%%8 + __LEN || _aT%%8 = 0) ? __TRAILB : 0) /\
          offset = _offset + __LEN - _LEN  /\ _offset + __LEN <= size /\  _LEN = ((__LEN + _aT)%%8 <= __LEN) ? (__LEN + _aT)%%8 : 0 /\ aT = _aT + __LEN - _LEN +  ((8 <= _aT%%8 + __LEN || __TRAILB=0 || _aT%%8 = 0) ? 0 : 1)  ).
  + auto.
    while (valid  trace___addstate_bcast_avx2x4 /\ BArrayS.is_init b_buf _offset __LEN /\ 0<= _TRAILB /\ _TRAILB < 256 /\ 0 <= _offset /\ 0<= __LEN /\ 0<= at /\ 32 * (aT %/ 8) <=at<= 32 * (aT %/ 8 + _LEN %/ 8) /\ at%%32 = 0 /\
  offset = _offset + (at - 32*(aT %/ 8))%/4 + dELTA  /\  _offset + __LEN <= size /\ 0<=dELTA /\ dELTA <= 8 /\ _LEN = __LEN - dELTA /\ aT = _aT + dELTA + ((8 <= _aT%%8 + __LEN || __TRAILB=0 || _aT%%8 = 0) ? 0 : 1)  /\
  aT + _LEN  < 200).
    + auto. rewrite /is_init /valid /= => &m /> *. smt(List.all_cat).
    auto. sp.
    if .
    +  auto . ecall (__a_ilen_read_bcast_upto8_at_proof param_5 b_param_0 param_4 param_3 param_2 param_1 param_0 param). auto. 
       rewrite /is_init /valid /= => &m /> *. split. smt(). move => *. split. split. smt(List.all_cat). split. smt().  split. smt().  split.  smt(). split. smt(). split. smt(). split. smt(). split. smt(). split. smt(). split. smt(). smt().
       move => *. smt().
    auto.  rewrite /is_init /valid /= => &m /> *.  smt(List.all_cat).
  if.
  + auto.
    ecall (__a_ilen_read_bcast_upto8_at_proof param_12 b_param param_11 param_10 param_9 param_8 param_7 param_6). auto.
    rewrite /is_init /valid /= => &m /> *. split. split.  split.  smt(). smt().  smt().  move => /> 9? h *. split. split. smt(). split.  smt(). split. smt(). split. split. smt(BArray800.init_arrP). smt().  smt(). smt(List.all_cat).
  auto. rewrite /is_init /valid /= => &m /> *. smt(BArray800.init_arrP).
qed .

lemma __absorb_bcast_avx2x4_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :
      (__absorb_bcast_avx2x4_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8).
proof.
  rewrite /__absorb_bcast_avx2x4_spec .
  proc; have:= inbounds_size => /= ?. auto.
  seq 23: (#pre /\ valid trace___absorb_bcast_avx2x4). by auto.
  seq 19: (valid trace___absorb_bcast_avx2x4 /\ 0<_RATE8 /\ _RATE8 < 200 /\  aT = (_aT + size) %% __RATE8 + if __TRAILB <> 0 then 1 else 0). 
  + auto. ecall (__addstate_bcast_avx2x4_proof param_18 (BArray800.init_arr (W8.of_int 255)) param_17 param_16 (BArrayS.init_arr (W8.of_int 255)) param_15 param_14 param_13).
    auto. sp. 
    if.
    + auto. 
      while (valid trace___absorb_bcast_avx2x4 /\ 0<_RATE8 /\ _RATE8 < 200 /\ aT = 0 /\ 0<= i /\ i<= iTERS /\ iTERS * _RATE8 + _RATE8 - _aT <= size /\ _aT < _RATE8 /\ 0<=_aT /\ 
             offset = i*_RATE8 + _RATE8 - _aT).
      + auto. ecall (_keccakf1600_avx2x4_proof param_12 (BArray800.init_arr (W8.of_int 255))).
        auto . ecall (__addstate_bcast_avx2x4_proof param_11 (BArray800.init_arr (W8.of_int 255)) param_10 param_9 (BArrayS.init_arr (W8.of_int 255)) param_8 param_7 param_6).
        auto .
        rewrite /is_init /valid /= => &m /> *.
        have ? : i{m} * _RATE8{m} + _RATE8{m} - _aT + _RATE8{m} <= size. smt(). split. smt(BArrayS.init_arrP BArray800.init_arrP). move => *. rewrite !List.all_cat /=. smt().
      auto.  ecall (_keccakf1600_avx2x4_proof param_5 (BArray800.init_arr (W8.of_int 255))).
      auto. ecall (__addstate_bcast_avx2x4_proof param_4 (BArray800.init_arr (W8.of_int 255)) param_3 param_2 (BArrayS.init_arr (W8.of_int 255)) param_1 param_0 param).
      auto. rewrite /is_init /valid /= => &m /> *. split.  smt(BArray800.init_arrP BArrayS.init_arrP). move => /> *. split. rewrite !List.all_cat /=. smt(). move => *. split.  smt(BArrayS.init_arrP). move => *. split. smt(List.all_cat).
      have /= ? := modzMDr (-1) (size + aT{m}) (_RATE8{m}). smt().
    auto. rewrite /is_init /valid /= => &m /> *. smt(List.all_cat BArray800.init_arrP BArrayS.init_arrP).   
  if.
  + auto.
    ecall (__addratebit_avx2x4_proof param_20 (BArray800.init_arr (W8.of_int 255)) param_19). auto.
    rewrite /is_init /valid /= => &m /> *.
    smt (List.all_cat BArray800.init_arrP).
  auto . smt(BArray800.init_arrP).
qed .

lemma __addstate_avx2x4_proof _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN __TRAILB :
      (__addstate_avx2x4_spec _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 
      _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN __TRAILB).
proof.
  rewrite /__addstate_avx2x4_spec .
  proc; have:= inbounds_size => /= ?. auto .
  seq 20: (#pre /\ valid trace___addstate_avx2x4). by auto.
  seq 13 : ( valid trace___addstate_avx2x4 /\ 0<=_offset /\ 0<=_LEN /\ 0<=at /\ _LEN < 8 /\
           _LEN + offset = __LEN + _offset /\ __LEN + _offset <= size /\
           at + 4 <= 100 /\ offset = _offset + __LEN - _LEN /\ 0 <= __TRAILB /\ __TRAILB < 256 /\
           aT = _aT + __LEN - _LEN +  ((8 <= _aT%%8 + __LEN || __TRAILB=0 || _aT%%8 = 0) ? 0 : 1) /\ (_TRAILB = (8 <= _aT%%8 + __LEN || _aT%%8 = 0) ? __TRAILB : 0) /\
           BArrayS.is_init b_buf0 offset _LEN /\ BArrayS.is_init b_buf1 offset _LEN /\ BArrayS.is_init b_buf2 offset _LEN /\
           BArrayS.is_init b_buf3 offset _LEN /\ _offset <= offset /\ _LEN <= __LEN).
  + wp.
    while( valid trace___addstate_avx2x4 /\ 0<=_offset /\ 0<=_LEN /\ 0<=at /\
           _LEN + offset - ((at - 4 * (aT %/ 8))*2)  = __LEN + _offset /\ __LEN + _offset <= size /\ _aT + __LEN  + ((__TRAILB <> 0) ? 1 : 0)  < 200 /\ 0<=_aT /\
           at%%4 = 0 /\ at <=  4 * (aT %/ 8) + 4 * (_LEN %/ 8) /\
           0 <= __TRAILB /\ __TRAILB < 256 /\ (_TRAILB = __TRAILB || _TRAILB = 0) /\
           aT = _aT + __LEN - _LEN + ( (_LEN <= 0 /\ _TRAILB = 0 /\ __TRAILB <> 0) ? 1 : 0) /\
           BArrayS.is_init b_buf0 offset (((4 * (aT %/ 8) + 4 * (_LEN %/ 8) - at)* 2 + _LEN%%8)) /\
           BArrayS.is_init b_buf1 offset (((4 * (aT %/ 8) + 4 * (_LEN %/ 8) - at)* 2 + _LEN%%8)) /\
           BArrayS.is_init b_buf2 offset (((4 * (aT %/ 8) + 4 * (_LEN %/ 8) - at)* 2 + _LEN%%8)) /\
           BArrayS.is_init b_buf3 offset (((4 * (aT %/ 8) + 4 * (_LEN %/ 8) - at)* 2 + _LEN%%8)) /\ _offset <= offset /\ _LEN <= __LEN).
    + auto. rewrite /is_init /valid /= => &m /> *. split. rewrite !List.all_cat /=. smt(). smt().
    sp. if.
    + auto. 
      ecall (__a_ilen_read_upto8_at_proof param_26 b_param_3 param_25 param_24  param_23 param_22 param_21 param_20). auto.
      ecall (__a_ilen_read_upto8_at_proof param_19 b_param_4 param_18 param_17 param_16 param_15 param_14 param_13). auto.
      ecall (__a_ilen_read_upto8_at_proof param_12 b_param_5 param_11 param_10  param_9 param_8 param_7 param_6). auto.
      ecall (__a_ilen_read_upto8_at_proof param_5 b_param_6 param_4 param_3 param_2 param_1 param_0 param). auto.
      rewrite /is_init /valid /= => &m /> *. split. smt(). move => *. split.  smt(). move => *. split. smt(). move => *. split. smt(). move=> *. split. split. rewrite !List.all_cat /=. smt().
      + move => *. split. smt(). split. smt(). split. smt().  split. smt(). split. smt(). smt().
      move => /> *. smt().
    auto. rewrite /is_init /valid /= => &m /> *. split.  smt(List.all_cat). smt().
  if .
  + auto .
    ecall (__a_ilen_read_upto8_at_proof param_54 b_param param_53 param_52 
       param_51 param_50 param_49 param_48). auto .
    ecall (__a_ilen_read_upto8_at_proof param_47 b_param_0 param_46 param_45 
       param_44 param_43 param_42 param_41). auto .
    ecall (__a_ilen_read_upto8_at_proof param_40 b_param_1 param_39 param_38 
       param_37 param_36 param_35 param_34). auto .
    ecall (__a_ilen_read_upto8_at_proof param_33 b_param_2 param_32 param_31 
       param_30 param_29 param_28 param_27). auto .
    rewrite /is_init /valid /= => &m /> *. split.  smt(). move => /> *. split.  split. split. smt(). smt().  split.  smt(). split. smt(). split. split. smt(BArray800.init_arrP). smt().  smt().  rewrite !List.all_cat /=. smt().
  auto. rewrite /is_init /valid /= => &m /> *. smt(BArray800.init_arrP). 
qed .

lemma __absorb_avx2x4_proof _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __TRAILB __RATE8 :
      (__absorb_avx2x4_spec _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 
      _buf2 _b_buf2 _buf3 _b_buf3 __TRAILB __RATE8).
proof.
  rewrite /__absorb_avx2x4_spec .
  proc; have:= inbounds_size => /= ?. auto .
  seq 54: (valid trace___absorb_avx2x4 /\ 0<_RATE8 /\ _RATE8 < 200 /\ aT = (_aT + size)%%__RATE8 + (if __TRAILB <> 0 then 1 else 0)).
  + auto.
    ecall (__addstate_avx2x4_proof param_27 (BArray800.init_arr (W8.of_int 255)) param_26 param_25 (BArrayS.init_arr (W8.of_int 255)) param_24 
           (BArrayS.init_arr (W8.of_int 255)) param_23 (BArrayS.init_arr (W8.of_int 255)) param_22 (BArrayS.init_arr (W8.of_int 255)) param_21 param_20  param_19).
    auto .
    seq 32: (#pre /\ valid trace___absorb_avx2x4). by auto.
    sp.
    if.
    + wp.
      while ((valid trace___absorb_avx2x4) /\ aT = 0 /\ _LEN = size - (_RATE8 - _aT) /\ 0<=i /\ i<=iTERS /\ 0<_RATE8 /\ _RATE8 < 200 /\
              offset = i * _RATE8 + _RATE8 - _aT /\ iTERS * _RATE8 <= _LEN /\  _aT < _RATE8).
      + auto . 
        ecall (_keccakf1600_avx2x4_proof param_18 (BArray800.init_arr (W8.of_int 255))). auto .
        ecall (__addstate_avx2x4_proof param_17 (BArray800.init_arr (W8.of_int 255)) param_16 param_15 (BArrayS.init_arr (W8.of_int 255)) param_14 
           (BArrayS.init_arr (W8.of_int 255)) param_13 (BArrayS.init_arr(W8.of_int 255)) param_12 (BArrayS.init_arr (W8.of_int 255)) param_11 param_10 param_9).
        auto .
        rewrite /is_init /valid /= => &m /> *. have ?:  i{m} * _RATE8{m} + _RATE8{m} - _aT + _RATE8{m} <= size.  smt().
        split. smt(BArrayS.init_arrP BArray800.init_arrP). move => *.
        rewrite !List.all_cat /=. smt().
      auto .
      ecall (_keccakf1600_avx2x4_proof param_8 (BArray800.init_arr (W8.of_int 255))).
      auto .
      ecall (__addstate_avx2x4_proof param_7 (BArray800.init_arr (W8.of_int 255)) param_6 param_5 (BArrayS.init_arr (W8.of_int 255)) param_4 (
              BArrayS.init_arr(W8.of_int  255))  param_3 (BArrayS.init_arr (W8.of_int 255)) param_2 (BArrayS.init_arr (W8.of_int 255)) param_1 param_0 param).
      auto .
      rewrite /is_init /valid /= => &m /> *. split. smt(BArray800.init_arrP BArrayS.init_arrP). move => *.
      split. rewrite !List.all_cat /=.  move => *. split. smt(BArrayS.init_arrP BArray800.init_arrP).  move => *. smt(List.all_cat).
      move => *.  split. smt(BArrayS.init_arrP). move => *. rewrite !List.all_cat /=. have /= ? := modzMDr (-1) (size + aT{m}) (_RATE8{m}). smt().
    auto. rewrite /is_init /valid /= => &m /> *. smt(BArrayS.init_arrP BArray800.init_arrP List.all_cat).
  if .
  + auto .
    ecall (__addratebit_avx2x4_proof param_29 (BArray800.init_arr (W8.of_int 255)) param_28). auto .
    rewrite /is_init /valid /= => &m /> *.
    smt (List.all_cat BArray800.init_arrP).
  auto. smt(BArray800.init_arrP).
qed .

lemma __dumpstate_avx2x4_proof _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN _st _b_st :
      (__dumpstate_avx2x4_spec _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2
      _buf3 _b_buf3 _offset __LEN _st _b_st).
proof.
  rewrite /__dumpstate_avx2x4_spec .
  proc; have:= inbounds_size => /= ?. auto .
  seq 18: (#pre /\ valid trace___dumpstate_avx2x4). by auto.
  seq 6: (valid trace___dumpstate_avx2x4 /\ offset = _offset + __LEN - __LEN%%8 /\ __LEN = _LEN /\ 0 <= i /\ i = 8 * (_LEN %/ 8) /\ __LEN <= 200 /\
          0<= _LEN /\ 0<= _offset  /\ BArrayS.is_init b_buf0 0 offset  /\ BArrayS.is_init b_buf1 0 offset /\ _offset + __LEN <= size /\
          BArrayS.is_init b_buf2 0 offset  /\ BArrayS.is_init b_buf3 0 offset).
  + while ((valid trace___dumpstate_avx2x4) /\  offset = _offset + i /\ __LEN = _LEN /\ 0 <= i /\ i<= 8 * (_LEN %/ 8) /\ __LEN <= 200 /\
          0<= _LEN /\ 0<= _offset  /\ BArrayS.is_init b_buf0 0 offset  /\ BArrayS.is_init b_buf1 0 offset /\ _offset + __LEN <= size /\ i%%8 = 0 /\
          BArrayS.is_init b_buf2 0 offset  /\ BArrayS.is_init b_buf3 0 offset).
    + auto .
      rewrite /is_init /valid /= => &m /> *. split. rewrite !List.all_cat /=. smt(). smt().
    auto .
    while ((valid trace___dumpstate_avx2x4)  /\  offset = _offset + i /\ __LEN = _LEN /\ 0 <= i /\ i<= 32 * (_LEN %/ 32) /\ __LEN <= 200 /\
          0<= _LEN /\ 0<= _offset  /\ BArrayS.is_init b_buf0 0 offset  /\ BArrayS.is_init b_buf1 0 offset /\ _offset + __LEN <= size /\ i%%32 = 0 /\
          BArrayS.is_init b_buf2 0 offset  /\ BArrayS.is_init b_buf3 0 offset).
    + auto .
      ecall (__4u64x4_u256x4_proof param_2 param_1 param_0 param).
      auto .
      rewrite /is_init /valid /= => &m /> *.
      split. rewrite !List.all_cat /=.  smt(). smt().
    auto .
    rewrite /is_init /valid /= .
    smt (List.all_cat).
  if .
  + auto .
    ecall (__a_ilen_write_upto8_proof param_22 b_param param_21 param_20  param_19 param_18).
    auto .
    ecall (__a_ilen_write_upto8_proof param_17 b_param_0 param_16 param_15 param_14 param_13).
    auto .
    ecall (__a_ilen_write_upto8_proof param_12 b_param_1 param_11 param_10 param_9 param_8).
    auto .
    ecall (__a_ilen_write_upto8_proof param_7 b_param_2 param_6 param_5 param_4 param_3).
    auto .
    rewrite /is_init /valid /= => &m /> *. split. smt(). move => *. rewrite !List.all_cat /=. smt().
  auto .
  rewrite /is_init /valid /=. 
  smt (List.all_cat).
qed .

lemma __squeeze_avx2x4_proof _st _b_st _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __RATE8 :
      (__squeeze_avx2x4_spec _st _b_st _buf0 _b_buf0 _buf1 _b_buf1 _buf2
      _b_buf2 _buf3 _b_buf3 __RATE8).
proof.
  rewrite /__squeeze_avx2x4_spec .
  proc; have:= inbounds_size => /= ?. auto .
  seq 42: (#pre /\ valid  trace___squeeze_avx2x4). by auto.
  seq 5: (valid  trace___squeeze_avx2x4 /\ BArrayS.is_init b_buf0 0 offset /\ BArrayS.is_init b_buf1 0 offset /\ 
          BArrayS.is_init b_buf2 0 offset /\ BArrayS.is_init b_buf3 0 offset /\0 <= lO /\ lO < 200 /\ offset = size - lO /\ lO <= size).
  + sp.
    if.  
    + auto.
      while (valid  trace___squeeze_avx2x4 /\ BArrayS.is_init b_buf0 0 offset /\ BArrayS.is_init b_buf1 0 offset /\ 0<= i /\ i<= iTERS /\ offset = i * _RATE8 /\ lO = size%%_RATE8 /\
          BArrayS.is_init b_buf2 0 offset /\ BArrayS.is_init b_buf3 0 offset /\ 0 < _RATE8 /\ _RATE8 < 200 /\ iTERS * _RATE8 <= size ).
      + auto .
        ecall (__dumpstate_avx2x4_proof param_6 b_param_6 param_5 b_param_5 param_4 b_param_4 param_3 b_param_3 param_2 param_1 param_0 (BArray800.init_arr (W8.of_int 255))).
        auto .
        ecall (_keccakf1600_avx2x4_proof param (BArray800.init_arr (W8.of_int 255))).
        auto .
        rewrite /is_init /valid /= => &m /> *. split.  smt(BArray800.init_arrP). move => *. split.  split. smt(). smt().
        smt (List.all_cat BArray800.init_arrP).
      auto .
      rewrite /is_init /valid /= => &m /> *.
      split. rewrite !List.all_cat /=. smt(). move => *. smt().
    auto.
    rewrite /is_init /valid /=.
    smt(List.all_cat).
  if .
  + auto .
    ecall (__dumpstate_avx2x4_proof param_14 b_param_2 param_13 b_param_1  param_12 b_param_0 param_11 b_param param_10 param_9 param_8 (
             BArray800.init_arr(W8.of_int 255))).
    auto .
    ecall (_keccakf1600_avx2x4_proof param_7 (BArray800.init_arr (W8.of_int 255))).
    auto .
    rewrite /is_init /valid /= => &m /> *. split. smt(BArray800.init_arrP). move => *. split.  smt().  move => *.
    smt (List.all_cat BArray800.init_arrP).
  auto .
  rewrite /is_init /valid /=.
  smt (List.all_cat BArray800.init_arrP).
qed .

end KECCAK_ARRAY_ASIZE.
