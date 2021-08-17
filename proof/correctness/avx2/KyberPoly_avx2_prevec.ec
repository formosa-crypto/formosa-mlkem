require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel JMemory JWord.
require import Array400 Array256 Array64 Array32 Array32p Array16 Array16p Array8 Array8p Array4 Array4p.
require import WArray800 WArray512 WArray128 WArray128p WArray64 WArray32 WArray16.
require W16extra.
require import Fq.
require import Ops.
require import List_hakyber.
require import KyberCPA_avx2.

pragma +oldip.

op lift2poly (p: W256.t): W16.t Array16.t =
  Array16.init (fun (n : int) => p \bits16 n).

module Mavx2_prevec = {
  proc poly_add2(rp:W16.t Array256.t, bp:W16.t Array256.t) : W16.t Array256.t = {
    var i:int;
    var a:W16.t Array16.t;
    var b:W16.t Array16.t;
    var r:W16.t Array16.t;

    i <- 0;

    while (i < 16) {
      a <- lift2poly(get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));
      b <- lift2poly(get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * i));

      r <@ Ops.ivadd16u256(a, b);

      rp <- fill (fun k => r.[k %% 16]) (16*i) 16 rp;

      i <- i + 1;
    }

    return rp;
  }

  proc poly_sub(rp:W16.t Array256.t, ap:W16.t Array256.t,
                 bp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var i:int;
    var a:W16.t Array16.t;
    var b:W16.t Array16.t;
    var r:W16.t Array16.t;

    i <- 0;
    while (i < 16) {
      a <- lift2poly(get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * i));
      b <- lift2poly(get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * i));

      r <@ Ops.ivsub16u256(a, b);

      rp <- fill (fun k => r.[k %% 16]) (16*i) 16 rp;

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

    qx16 <- (get256 (WArray32.init16 (fun i => KyberCPA_avx2.jqx16.[i])) 0);
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

    var f0: t16u16;
    var f0_b: t32u8;
    var f0_q: t4u64;

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

      f0_b <- Ops.iVPACKSS_16u16(f0, f1);

      f0_q <- Array4.init (fun i => pack8_t (W8u8.Pack.init(fun j => f0_b.[8*i + j])));
      f0_q <- Ops.iVPERMQ(f0_q, (W8.of_int 216));

      f0_b <- Array32.init (fun i => f0_q.[i %/ 8] \bits8 (i %% 8));
      c <-  Ops.iVPMOVMSKB_u256_u32(f0_b);

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

    qx16 <- lift2poly (get256 (WArray32.init16 (fun i => KyberCPA_avx2.jqx16.[i])) 0);
    vx16 <- lift2poly (get256 (WArray32.init16 (fun i => KyberCPA_avx2.jvx16.[i])) 0);
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

  proc schoolbook (ap:W16.t Array32.t, bp:W16.t Array32.t, zeta_0: t16u16,
                   qx16:t16u16, qinvx16:t16u16, sign:int) : t16u16 * t16u16 *
                                                            t16u16 * t16u16 = {

    var x0:t16u16;
    var x1:t16u16;
    var y0:t16u16;
    var y1:t16u16;
    var b:t16u16;
    var d:t16u16;
    var a:t16u16;
    var c:t16u16;
    var bdlo:t16u16;
    var bdhi:t16u16;
    var bclo:t16u16;
    var bchi:t16u16;
    var adlo:t16u16;
    var adhi:t16u16;
    var aclo:t16u16;
    var achi:t16u16;
    var bd:t16u16;
    var rbdlo:t16u16;
    var rbdhi:t16u16;
    var bc0:t16u16;
    var bc1:t16u16;
    var ad0:t16u16;
    var ad1:t16u16;
    var ac0:t16u16;
    var ac1:t16u16;
    var rbd0:t16u16;
    var rbd1:t16u16;

    b <- lift2poly(get256_direct (WArray64.init16 (fun i => ap.[i])) (32 * 1));
    d <- lift2poly(get256_direct (WArray64.init16 (fun i => bp.[i])) (32 * 1));
    a <- lift2poly(get256_direct (WArray64.init16 (fun i => ap.[i])) (32 * 0));
    c <- lift2poly(get256_direct (WArray64.init16 (fun i => bp.[i])) (32 * 0));
    bdlo <- Ops.iVPMULL_16u16(b, d);
    bdhi <- Ops.iVPMULH_256(b, d);
    bclo <- Ops.iVPMULL_16u16(b, c);
    bchi <- Ops.iVPMULH_256(b, c);
    adlo <- Ops.iVPMULL_16u16(a, d);
    adhi <- Ops.iVPMULH_256(a, d);
    aclo <- Ops.iVPMULL_16u16(a, c);
    achi <- Ops.iVPMULH_256(a, c);
    bdlo <- Ops.iVPMULL_16u16(bdlo, qinvx16);
    bdlo <- Ops.iVPMULH_256(bdlo, qx16);
    bd <- Ops.ivsub16u256(bdhi, bdlo);
    rbdlo <- Ops.iVPMULL_16u16(zeta_0, bd);
    rbdhi <- Ops.iVPMULH_256(zeta_0, bd);
    bc0 <- Ops.iVPUNPCKL_16u16(bclo, bchi);
    bc1 <- Ops.iVPUNPCKH_16u16(bclo, bchi);
    ad0 <- Ops.iVPUNPCKL_16u16(adlo, adhi);
    ad1 <- Ops.iVPUNPCKH_16u16(adlo, adhi);
    ac0 <- Ops.iVPUNPCKL_16u16(aclo, achi);
    ac1 <- Ops.iVPUNPCKH_16u16(aclo, achi);
    rbd0 <- Ops.iVPUNPCKL_16u16(rbdlo, rbdhi);
    rbd1 <- Ops.iVPUNPCKH_16u16(rbdlo, rbdhi);
(* FIXME
    if ((sign = 0)) {
      x0 <- Ops.ivadd32u256(ac0, rbd0);
      x1 <- Ops.ivadd32u256(ac1, rbd1);
    } else {
      x0 <- Ops.ivsub32u256(ac0, rbd0);
      x1 <- Ops.ivsub32u256(ac1, rbd1);
    }
    y0 <- Ops.ivadd32u256(bc0, ad0);
    y1 <- Ops.ivadd32u256(bc1, ad1);
*)
    return (x0, x1, y0, y1);
  }

  proc basemul_red (a0:t16u16, a1:t16u16, b0:t16u16, b1:t16u16, qx16:t16u16,
                    qinvx16:t16u16) : t16u16 * t16u16 = {

    var zero:t16u16;
    var y:t16u16;
    var z:t16u16;
    var x:t16u16;

    zero <- lift2poly(setw0_256);
    y <- Ops.iVPBLENDW_256(a0, zero, (W8.of_int 170));
    z <- Ops.iVPBLENDW_256(a1, zero, (W8.of_int 170));
(* FIXME
    a0 <- Ops.iVPSRL_8u32(a0, (W8.of_int 16));
    a1 <- Ops.iVPSRL_8u32(a1, (W8.of_int 16));
    z <- Ops.iVPACKUS_8u32(y, z);
    a0 <- Ops.iVPACKUS_8u32(a0, a1);
*)
    y <- Ops.iVPBLENDW_256(b0, zero, (W8.of_int 170));
    x <- Ops.iVPBLENDW_256(b1, zero, (W8.of_int 170));
(* FIXME
    b0 <- Ops.iVPSRL_8u32(b0, (W8.of_int 16));
    b1 <- Ops.iVPSRL_8u32(b1, (W8.of_int 16));
    y <- Ops.iVPACKUS_8u32(y, x);
    b0 <- Ops.iVPACKUS_8u32(b0, b1);
*)
    z <- Ops.iVPMULL_16u16(z, qinvx16);
    y <- Ops.iVPMULL_16u16(y, qinvx16);
    z <- Ops.iVPMULH_256(z, qx16);
    y <- Ops.iVPMULH_256(y, qx16);
    a0 <- Ops.ivsub16u256(a0, z);
    b0 <- Ops.ivsub16u256(b0, y);
    return (a0, b0);
  }

  proc basemul32x (rp:W16.t Array64.t, ap:W16.t Array64.t,
                   bp:W16.t Array64.t, zeta_0:t16u16, qx16:t16u16,
                   qinvx16:t16u16) : W16.t Array64.t = {

    var x0:t16u16;
    var x1:t16u16;
    var y0:t16u16;
    var y1:t16u16;

    (x0, x1, y0, y1) <@ schoolbook ((Array32.init (fun i => ap.[0 + i])),
    (Array32.init (fun i => bp.[0 + i])), zeta_0, qx16, qinvx16, 0);
    (x0, x1) <@ basemul_red (x0, x1, y0, y1, qx16, qinvx16);

    rp <- fill (fun k => x0.[k %% 16]) 0 16 rp;
    rp <- fill (fun k => x1.[k %% 16]) 16 16 rp;

    (x0, x1, y0, y1) <@ schoolbook ((Array32.init (fun i => ap.[32 + i])),
    (Array32.init (fun i => bp.[32 + i])), zeta_0, qx16, qinvx16, 1);
    (x0, x1) <@ basemul_red (x0, x1, y0, y1, qx16, qinvx16);

    rp <- fill (fun k => x0.[k %% 16]) 32 16 rp;
    rp <- fill (fun k => x1.[k %% 16]) 48 16 rp;

    return (rp);
  }

  proc poly_basemul (rp:W16.t Array256.t, ap:W16.t Array256.t,
                     bp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: W16.t Array64.t;

    var qx16:t16u16;
    var qinvx16:t16u16;
    var zeta_0:t16u16;

    qx16 <- lift2poly(get256_direct (WArray32.init16 (fun i => jqx16.[i])) 0);
    qinvx16 <- lift2poly(get256_direct (WArray32.init16 (fun i => jqinvx16.[i])) 0);
    zeta_0 <-
    lift2poly(get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 304);

    aux <@ basemul32x ((Array64.init (fun i => rp.[0 + i])),
    (Array64.init (fun i => ap.[0 + i])),
    (Array64.init (fun i => bp.[0 + i])), zeta_0, qx16, qinvx16);

    rp <- fill (fun k => aux.[k %% 64]) 0 64 rp;

    zeta_0 <-
    lift2poly(get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 368);

    aux <@ basemul32x ((Array64.init (fun i => rp.[64 + i])),
    (Array64.init (fun i => ap.[64 + i])),
    (Array64.init (fun i => bp.[64 + i])), zeta_0, qx16, qinvx16);

    rp <- fill (fun k => aux.[k %% 64]) 64 64 rp;

    zeta_0 <-
    lift2poly(get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 696);

    aux <@ basemul32x ((Array64.init (fun i => rp.[128 + i])),
    (Array64.init (fun i => ap.[128 + i])),
    (Array64.init (fun i => bp.[128 + i])), zeta_0, qx16, qinvx16);

    rp <- fill (fun k => aux.[k %% 64]) 128 64 rp;

    zeta_0 <-
    lift2poly(get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 760);

    aux <@ basemul32x ((Array64.init (fun i => rp.[192 + i])),
    (Array64.init (fun i => ap.[192 + i])),
    (Array64.init (fun i => bp.[192 + i])), zeta_0, qx16, qinvx16);

    rp <- fill (fun k => aux.[k %% 64]) 192 64 rp;

    return (rp);
  }
}.
