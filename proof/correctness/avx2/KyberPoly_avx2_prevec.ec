require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel JMemory JWord.
require import Array256 Fq Array16 Array16p Array4 Array4p Array8 Array8p.
require import W16extra WArray512 WArray32 WArray16.
require import Ops.
require import List_hakyber.
require import KyberPoly_avx2.

pragma +oldip.

op lift2poly (p: W256.t): W16.t Array16.t =
  Array16.init (fun (n : int) => p \bits16 n).

module Mavx2_prevec = {
  proc poly_add2(rp:W16.t Array256.t, bp:W16.t Array256.t) : W16.t Array256.t = {
    var i:int;
    var a:W256.t;
    var b:W256.t;
    var r:W256.t;
    var __a:W16.t Array16.t;
    var __b:W16.t Array16.t;
    var _r:W16.t Array16.t;

    i <- 0;

    while (i < 16) {
      a <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));
      b <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * i));
      __a <- lift2poly(a);
      __b <- lift2poly(b);
      _r <@ Ops.ivadd16u256(__a, __b);
      r <- W16u16.pack16 [_r.[0]; _r.[1]; _r.[2]; _r.[3]; _r.[4]; _r.[5]; _r.[6]; _r.[7];
                          _r.[8]; _r.[9]; _r.[10]; _r.[11]; _r.[12]; _r.[13]; _r.[14]; _r.[15]];
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i) r));
      i <- i + 1;
    }

    return rp;
  }

  proc poly_sub(rp:W16.t Array256.t, ap:W16.t Array256.t,
                 bp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var i:int;
    var a:W256.t;
    var b:W256.t;
    var r:W256.t;
    var __a:W16.t Array16.t;
    var __b:W16.t Array16.t;
    var _r:W16.t Array16.t;

    i <- 0;
    while (i < 16) {
      a <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * i));
      b <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * i));
      __a <- lift2poly(a);
      __b <- lift2poly(b);
      _r <@ Ops.ivsub16u256(__a, __b);
      r <- W16u16.pack16 [_r.[0]; _r.[1]; _r.[2]; _r.[3]; _r.[4]; _r.[5]; _r.[6]; _r.[7];
                          _r.[8]; _r.[9]; _r.[10]; _r.[11]; _r.[12]; _r.[13]; _r.[14]; _r.[15]];
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i) r));
      i <- i + 1;
    }

    return (rp);
  }

  proc poly_csubq (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var qx16:W256.t;
    var _qx16: W16.t Array16.t;
    var i:int;
    var r:W256.t;
    var _r: W16.t Array16.t;
    var t: W16.t Array16.t;

    qx16 <- (get256 (WArray32.init16 (fun i => KyberPoly_avx2.jqx16.[i])) 0);
    _qx16 <- lift2poly(qx16);
    i <- 0;
    while (i < 16) {
      r <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));

      _r <- lift2poly(r);

      _r <@ Ops.ivsub16u256(_r, _qx16);
      t <@ Ops.iVPSRA_16u16(_r, (W8.of_int 15));
      t <@ Ops.ivpand16u16(t, _qx16);
      _r <@ Ops.ivadd16u256(t, _r);

      rp <- fill (fun k => _r.[k %% 16]) (16*i) 16 rp;

      i <- i + 1;
    }
    return (rp);
  }


  proc poly_frommsg (rp:W16.t Array256.t, ap:W64.t) : W16.t Array256.t = {
(*
    var aux: int;

    var hqs:W16.t Array16.t;
    var shift:W16.t Array16.t;
    var idx:W16.t Array16.t;
    var f:W16.t Array16.t;
    var i:int;

    var g3:W16.t Array16.t;
    var g0:W16.t Array16.t;
    var g1:W16.t Array16.t;
    var g2:W16.t Array16.t;
    var h0:W16.t Array16.t;
    var h2:W16.t Array16.t;
    var h1:W16.t Array16.t;
    var h3:W16.t Array16.t;

    hqs <- lift2poly(get256 (WArray32.init16 (fun i => hqx16_p1.[i])) 0);
    shift <-
    Ops.iVPBROADCAST_2u128((get128 (WArray16.init32 (fun i => shift_s.[i])) 0));
    idx <- Ops.iVPBROADCAST_2u128((get128 (WArray16.init8 (fun i => idx_s.[i])) 0));
    f <- Ops.iload16u16(Glob.mem, ap);
    i <- 0;

    while (i < 4) {
      g3 <- Ops.iVPSHUFD_256(f, W8.of_int (85 * i));
      g3 <- Ops.iVPSLLV_8u32(g3, shift);
      g3 <- Ops.iVPSHUFB_256(g3, idx);
      g0 <- Ops.iVPSLL_16u16(g3, (W8.of_int 12));
      g1 <- Ops.iVPSLL_16u16(g3, (W8.of_int 8));
      g2 <- Ops.iVPSLL_16u16(g3, (W8.of_int 4));
      g0 <- Ops.iVPSRA_16u16(g0, (W8.of_int 15));
      g1 <- Ops.iVPSRA_16u16(g1, (W8.of_int 15));
      g2 <- Ops.iVPSRA_16u16(g2, (W8.of_int 15));
      g3 <- Ops.iVPSRA_16u16(g3, (W8.of_int 15));
      g0 <- Ops.ivpand16u16(g0, hqs);
      g1 <- Ops.ivpand16u16(g1, hqs);
      g2 <- Ops.ivpand16u16(g2, hqs);
      g3 <- Ops.ivpand16u16(g3, hqs);
      h0 <- Ops.iVPUNPCKL_4u64(g0, g1);
      h2 <- Ops.iVPUNPCKH_4u64(g0, g1);
      h1 <- Ops.iVPUNPCKL_4u64(g2, g3);
      h3 <- Ops.iVPUNPCKH_4u64(g2, g3);
      g0 <- Ops.iVPERM2I128(h0, h1, (W8.of_int 32));
      g2 <- Ops.iVPERM2I128(h0, h1, (W8.of_int 49));
      g1 <- Ops.iVPERM2I128(h2, h3, (W8.of_int 32));
      g3 <- Ops.iVPERM2I128(h2, h3, (W8.of_int 49));

      rp <- fill (fun k => g0.[k %% 32]) (32*i) 16 rp;
      rp <- fill (fun k => g1.[k %% 32]) (32*i + 16) 16 rp;
      rp <- fill (fun k => g1.[k %% 32]) (32*i + 128) 16 rp;
      rp <- fill (fun k => g1.[k %% 32]) (32*i + 144) 16 rp;

      i <- i + 1;
    }
*)
    return (rp);
  }

  proc fqmulx16 (a b qx16 qinvx16: W16.t Array16.t) : W16.t Array16.t = {

    var rd:W16.t Array16.t;
    var rhi:W16.t Array16.t;
    var rlo:W16.t Array16.t;

    rhi <- Ops.iVPMULH_256(a, b);
    rlo <- Ops.iVPMULL_16u16(a, b);
    rlo <- Ops.iVPMULL_16u16(rlo, qinvx16);
    rlo <- Ops.iVPMULH_256(rlo, qx16);
    rd <-  Ops.ivsub16u256(rhi, rlo);
    return (rd);
  }

  proc poly_tomsg (rp:W64.t, a:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var hq:W16.t Array16.t;
    var hhq:W16.t Array16.t;
    var i:int;
    var f0:W16.t Array16.t;
    var f1:W16.t Array16.t;
    var g0:W16.t Array16.t;
    var g1:W16.t Array16.t;
    var c:W32.t;

    a <@ poly_csubq (a);
    hq <- lift2poly(get256 (WArray32.init16 (fun i => hqx16_m1.[i])) 0);
    hhq <- lift2poly(get256 (WArray32.init16 (fun i => hhqx16.[i])) 0);
    aux <- (256 %/ 32);

    i <- 0;
    while (i < aux) {
      f0 <- lift2poly(get256 (WArray512.init16 (fun i => a.[i])) (2 * i));
      f1 <- lift2poly(get256 (WArray512.init16 (fun i => a.[i])) ((2 * i) + 1));
      f0 <- Ops.ivsub16u256(hq, f0);
      f1 <- Ops.ivsub16u256(hq, f1);
      g0 <- Ops.iVPSRA_16u16(f0, (W8.of_int 15));
      g1 <- Ops.iVPSRA_16u16(f1, (W8.of_int 15));
      f0 <- Ops.ilxor16u16(f0, g0);
      f1 <- Ops.ilxor16u16(f1, g1);
      f0 <- Ops.ivsub16u256(f0, hhq);
      f1 <- Ops.ivsub16u256(f1, hhq);
      (* f0 <- Ops.iVPACKSS_16u16(f0, f1); *)
      (* FIXME: f0 <- Ops.VPERMQ(f0, (W8.of_int 216)); *)
      c <-  Ops.iVPMOVMSKB_u256_u32(f0);
      Glob.mem <-
      storeW32 Glob.mem (W64.to_uint (rp + (W64.of_int (4 * i)))) c;
      i <- i + 1;
    }
    return (a);
  }

  proc red16x (r:W16.t Array16.t, qx16:W16.t Array16.t, vx16:W16.t Array16.t) : W16.t Array16.t = {
    var x:W16.t Array16.t;

    x <- Ops.iVPMULH_256(r, vx16);
    x <- Ops.iVPSRA_16u16(x, (W8.of_int 10));
    x <- Ops.iVPMULL_16u16(x, qx16);
    r <- Ops.ivsub16u256(r, x);

    return (r);
  }

  proc poly_reduce (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var qx16:W16.t Array16.t;
    var vx16:W16.t Array16.t;
    var i:int;
    var r:W16.t Array16.t;

    qx16 <- lift2poly (get256 (WArray32.init16 (fun i => KyberPoly_avx2.jqx16.[i])) 0);
    vx16 <- lift2poly (get256 (WArray32.init16 (fun i => KyberPoly_avx2.jvx16.[i])) 0);
    i <- 0;

    while (i < 16) {
      r <- lift2poly (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));

      r <@ red16x (r, qx16, vx16);

      rp <- fill (fun k => r.[k %% 16]) (16*i) 16 rp;

      i <- i + 1;
    }
    return (rp);
  }

  proc poly_frommont (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var qx16:W16.t Array16.t;
    var qinvx16:W16.t Array16.t;
    var dmontx16:W16.t Array16.t;
    var i:int;
    var t:W16.t Array16.t;

    qx16 <- lift2poly(get256 (WArray32.init16 (fun i => jqx16.[i])) 0);
    qinvx16 <- lift2poly(get256 (WArray32.init16 (fun i => jqinvx16.[i])) 0);
    dmontx16 <- lift2poly(get256 (WArray32.init16 (fun i => jdmontx16.[i])) 0);
    aux <- (256 %/ 16);

    i <- 0;
    while (i < aux) {
      t <- lift2poly(get256 (WArray512.init16 (fun i => rp.[i])) i);
      t <@ fqmulx16 (t, dmontx16, qx16, qinvx16);

      rp <- fill (fun k => t.[k %% 16]) (16*i) 16 rp;

      i <- i + 1;
    }
    return (rp);
  }
}.
