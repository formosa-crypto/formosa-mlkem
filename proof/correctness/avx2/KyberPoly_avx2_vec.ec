require import AllCore List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.
require import Array400 Array256 Array64 Array32 Array16 Array8 Array4.
require import WArray800 WArray512 WArray128 WArray64 WArray32 WArray16.
require import AVX2_Ops.
require import KyberCPA_avx2.
require import KyberPoly_avx2_prevec.
require import KyberPoly_avx2_proof.


module Mvec = {
  proc poly_add2(rp:W16.t Array256.t, bp:W16.t Array256.t) : W16.t Array256.t = {
    var i:int;
    var a:W256.t;
    var b:W256.t;
    var r:W256.t;

    i <- 0;

    while (i < 16) {
      a <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));
      b <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * i));
      r <@ OpsV.ivadd16u256(a, b);
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i) r));
      i <- i + 1;
    }

    return (rp);
  }

  proc poly_sub (rp:W16.t Array256.t, ap:W16.t Array256.t,
                 bp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var i:int;
    var a:W256.t;
    var b:W256.t;
    var r:W256.t;

    i <- 0;
    while (i < 16) {
      a <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * i));
      b <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * i));
      r <@ OpsV.ivsub16u256(a, b);
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i) r));
      i <- i + 1;
    }
    return (rp);
  }

  proc csubq (r:W256.t, qx16:W256.t) : W256.t = {
    var t:W256.t;

    r <@ OpsV.ivsub16u256(r, qx16);
    t <@ OpsV.iVPSRA_16u16(r, (W8.of_int 15));
    t <@ OpsV.ivpand16u16(t,qx16);
    r <@ OpsV.ivadd16u256(t, r);

    return (r);
  }

  proc poly_csubq (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var qx16:W256.t;
    var i:int;
    var r:W256.t;

    qx16 <- (get256 (WArray32.init16 (fun i => jqx16.[i])) 0);
    i <- 0;
    while (i < 16) {
      r <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));
      r <@ csubq (r, qx16);
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i) r));
      i <- i + 1;
    }
    return (rp);
  }

  proc poly_frommsg (rp:W16.t Array256.t, ap:W64.t) : W16.t Array256.t = {
    var aux: int;

    var x16p:W16.t Array16.t;
    var hqs:W256.t;
    var shift:W256.t;
    var idx:W256.t;
    var f:W256.t;
    var i:int;
    var g3:W256.t;
    var g0:W256.t;
    var g1:W256.t;
    var g2:W256.t;
    var h0:W256.t;
    var h2:W256.t;
    var h1:W256.t;
    var h3:W256.t;

    x16p <- witness;
    x16p <- hqx16_p1;
    hqs <- (get256 (WArray32.init16 (fun i => x16p.[i])) 0);
    shift <@
    OpsV.iVPBROADCAST_2u128_8u32((get128 (WArray16.init32 (fun i => pfm_shift_s.[i])) 0));
    idx <@ OpsV.iVPBROADCAST_2u128_32u8((get128 (WArray16.init8 (fun i => pfm_idx_s.[i])) 0));
    f <@ OpsV.iload4u64_8u32(Glob.mem, ap);
    i <- 0;
    while (i < 4) {
      g3 <@ OpsV.iVPSHUFD_256(f, W8.of_int (85 * i));
      g3 <@ OpsV.iVPSLLV_8u32(g3, shift);
      g3 <@ OpsV.iVPSHUFB_256(g3, idx);
      g0 <@ OpsV.iVPSLL_16u16(g3, (W8.of_int 12));
      g1 <@ OpsV.iVPSLL_16u16(g3, (W8.of_int 8));
      g2 <@ OpsV.iVPSLL_16u16(g3, (W8.of_int 4));
      g0 <@ OpsV.iVPSRA_16u16(g0, (W8.of_int 15));
      g1 <@ OpsV.iVPSRA_16u16(g1, (W8.of_int 15));
      g2 <@ OpsV.iVPSRA_16u16(g2, (W8.of_int 15));
      g3 <@ OpsV.iVPSRA_16u16(g3, (W8.of_int 15));
      g0 <@ OpsV.ivpand16u16(g0, hqs);
      g1 <@ OpsV.ivpand16u16(g1, hqs);
      g2 <@ OpsV.ivpand16u16(g2, hqs);
      g3 <@ OpsV.ivpand16u16(g3, hqs);
      h0 <@ OpsV.iVPUNPCKL_4u64_16u16(g0, g1);
      h2 <@ OpsV.iVPUNPCKH_4u64_16u16(g0, g1);
      h1 <@ OpsV.iVPUNPCKL_4u64_16u16(g2, g3);
      h3 <@ OpsV.iVPUNPCKH_4u64_16u16(g2, g3);
      g0 <@ OpsV.iVPERM2I128_16u16(h0, h1, (W8.of_int 32));
      g2 <@ OpsV.iVPERM2I128_16u16(h0, h1, (W8.of_int 49));
      g1 <@ OpsV.iVPERM2I128_16u16(h2, h3, (W8.of_int 32));
      g3 <@ OpsV.iVPERM2I128_16u16(h2, h3, (W8.of_int 49));
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) (2 * i) g0));
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) ((2 * i) + 1) g1));
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) ((2 * i) + 8) g2));
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) (((2 * i) + 8) + 1) g3));
      i <- i + 1;
    }
    return (rp);
  }

  proc fqmulx16 (a:W256.t, b:W256.t, qx16:W256.t, qinvx16:W256.t) : W256.t = {

    var rd:W256.t;
    var rhi:W256.t;
    var rlo:W256.t;

    rhi <@ OpsV.iVPMULH_256(a, b);
    rlo <@ OpsV.iVPMULL_16u16(a, b);
    rlo <@ OpsV.iVPMULL_16u16(rlo, qinvx16);
    rlo <@ OpsV.iVPMULH_256(rlo, qx16);
    rd <@ OpsV.ivsub16u256(rhi, rlo);
    return (rd);
  }

  proc poly_tomsg (rp:W64.t, a:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var px16:W16.t Array16.t;
    var hq:W256.t;
    var hhq:W256.t;
    var i:int;
    var f0:W256.t;
    var f1:W256.t;
    var g0:W256.t;
    var g1:W256.t;
    var c:W32.t;
    px16 <- witness;
    a <@ poly_csubq (a);
    px16 <- hqx16_m1;
    hq <- (get256 (WArray32.init16 (fun i => px16.[i])) 0);
    px16 <- hhqx16;
    hhq <- (get256 (WArray32.init16 (fun i => px16.[i])) 0);
    aux <- (256 %/ 32);
    i <- 0;
    while (i < aux) {
      f0 <- (get256 (WArray512.init16 (fun i => a.[i])) (2 * i));
      f1 <- (get256 (WArray512.init16 (fun i => a.[i])) ((2 * i) + 1));
      f0 <@ OpsV.ivsub16u256(hq, f0);
      f1 <@ OpsV.ivsub16u256(hq, f1);
      g0 <@ OpsV.iVPSRA_16u16(f0, (W8.of_int 15));
      g1 <@ OpsV.iVPSRA_16u16(f1, (W8.of_int 15));
      f0 <@ OpsV.ilxor16u16(f0, g0);
      f1 <@ OpsV.ilxor16u16(f1, g1);
      f0 <@ OpsV.ivsub16u256(f0, hhq);
      f1 <@ OpsV.ivsub16u256(f1, hhq);
      f0 <@ OpsV.iVPACKSS_16u16(f0, f1);
      f0 <@ OpsV.iVPERMQ_32u8(f0, (W8.of_int 216));
      c <@ OpsV.iVPMOVMSKB_u256_u32(f0);
      Glob.mem <-
      storeW32 Glob.mem (W64.to_uint (rp + (W64.of_int (4 * i)))) c;
      i <- i + 1;
    }
    return (a);
  }

  proc  red16x (r:W256.t, qx16:W256.t, vx16:W256.t) : W256.t = {
    var x:W256.t;

    x <@ OpsV.iVPMULH_256(r, vx16);
    x <@ OpsV.iVPSRA_16u16(x, (W8.of_int 10));
    x <@ OpsV.iVPMULL_16u16(x, qx16);
    r <@ OpsV.ivsub16u256(r, x);
    return (r);
  }

  proc poly_reduce (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var qx16:W256.t;
    var vx16:W256.t;
    var i:int;
    var r:W256.t;

    qx16 <- (get256 (WArray32.init16 (fun i => jqx16.[i])) 0);
    vx16 <- (get256 (WArray32.init16 (fun i => jvx16.[i])) 0);
    i <- 0;
    while (i < 16) {
      r <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));
      r <@ red16x (r, qx16, vx16);
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i) r));
      i <- i + 1;
    }
    return (rp);
  }

  proc poly_frommont (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var x16p:W16.t Array16.t;
    var qx16:W256.t;
    var qinvx16:W256.t;
    var dmontx16:W256.t;
    var i:int;
    var t:W256.t;
    x16p <- witness;
    x16p <- jqx16;
    qx16 <- (get256 (WArray32.init16 (fun i => jqx16.[i])) 0);
    x16p <- jqinvx16;
    qinvx16 <- (get256 (WArray32.init16 (fun i => jqinvx16.[i])) 0);
    x16p <- jdmontx16;
    dmontx16 <- (get256 (WArray32.init16 (fun i => jdmontx16.[i])) 0);
    aux <- (256 %/ 16);
    i <- 0;
    while (i < aux) {
      t <- (get256 (WArray512.init16 (fun i => rp.[i])) i);
      t <@ fqmulx16 (t, dmontx16, qx16, qinvx16);
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) i t));
      i <- i + 1;
    }
    return (rp);
  }

  proc poly_compress (rp:W64.t, a:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var x16p:W16.t Array16.t;
    var v:W256.t;
    var shift1:W256.t;
    var mask:W256.t;
    var shift2:W256.t;
    var permidx:W256.t;
    var i:int;
    var f0:W256.t;
    var f1:W256.t;
    var f2:W256.t;
    var f3:W256.t;
    x16p <- witness;
    a <@ poly_csubq (a);
    x16p <- jvx16;
    v <- (get256 (WArray32.init16 (fun i => x16p.[i])) 0);
    shift1 <@ OpsV.iVPBROADCAST_16u16(pc_shift1_s);
    mask <@ OpsV.iVPBROADCAST_16u16(pc_mask_s);
    shift2 <@ OpsV.iVPBROADCAST_16u16(pc_shift2_s);
    permidx <- (get256 (WArray32.init32 (fun i => pc_permidx_s.[i])) 0);
    aux <- (256 %/ 64);
    i <- 0;
    while (i < aux) {
      f0 <- (get256 (WArray512.init16 (fun i => a.[i])) (4 * i));
      f1 <- (get256 (WArray512.init16 (fun i => a.[i])) ((4 * i) + 1));
      f2 <- (get256 (WArray512.init16 (fun i => a.[i])) ((4 * i) + 2));
      f3 <- (get256 (WArray512.init16 (fun i => a.[i])) ((4 * i) + 3));
      f0 <@ OpsV.iVPMULH_256(f0, v);
      f1 <@ OpsV.iVPMULH_256(f1, v);
      f2 <@ OpsV.iVPMULH_256(f2, v);
      f3 <@ OpsV.iVPMULH_256(f3, v);
      f0 <@ OpsV.iVPMULHRS_256(f0, shift1);
      f1 <@ OpsV.iVPMULHRS_256(f1, shift1);
      f2 <@ OpsV.iVPMULHRS_256(f2, shift1);
      f3 <@ OpsV.iVPMULHRS_256(f3, shift1);
      f0 <@ OpsV.ivpand16u16(f0, mask);
      f1 <@ OpsV.ivpand16u16(f1, mask);
      f2 <@ OpsV.ivpand16u16(f2, mask);
      f3 <@ OpsV.ivpand16u16(f3, mask);
      f0 <@ OpsV.iVPACKUS_16u16(f0, f1);
      f2 <@ OpsV.iVPACKUS_16u16(f2, f3);
      f0 <@ OpsV.iVPMADDUBSW_256(f0, shift2);
      f2 <@ OpsV.iVPMADDUBSW_256(f2, shift2);
      f0 <@ OpsV.iVPACKUS_16u16(f0, f2);
      f0 <@ OpsV.iVPERMD(f0, permidx); (* FIXME: extracted code has arguments swapped, which is wrong *)
      Glob.mem <@ OpsV.istore32u8(Glob.mem, rp + (W64.of_int (32 * i)), f0);
      i <- i + 1;
    }
    return (a);
  }

  proc poly_decompress (rp:W16.t Array256.t, ap:W64.t) : W16.t Array256.t = {
    var aux: int;

    var x16p:W16.t Array16.t;
    var q:W256.t;
    var x32p:W8.t Array32.t;
    var shufbidx:W256.t;
    var mask:W256.t;
    var shift:W256.t;
    var t:W128.t;
    var f:W256.t;
    var i:int;
    x16p <- witness;
    x32p <- witness;
    x16p <- jqx16;
    q <- (get256 (WArray32.init16 (fun i => x16p.[i])) 0);
    x32p <- pd_jshufbidx;
    shufbidx <- (get256 (WArray32.init8 (fun i => x32p.[i])) 0);
    mask <@ OpsV.iVPBROADCAST_8u32(pd_mask_s);
    shift <@ OpsV.iVPBROADCAST_8u32(pd_shift_s);
    t <- setw0_128 ;
    f <- setw0_256 ;
    aux <- (256 %/ 16);
    i <- 0;
    while (i < aux) {
      f <@
      OpsV.iVPBROADCAST_2u128_32u8(loadW128 Glob.mem (W64.to_uint (ap + (W64.of_int (8 * i)))));
      f <@ OpsV.iVPSHUFB_256(f, shufbidx);
      f <@ OpsV.ivpand16u16(f, mask);
      f <@ OpsV.iVPMULL_16u16(f, shift);
      f <@ OpsV.iVPMULHRS_256(f, q);
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) i f));
      i <- i + 1;
    }
    return (rp);
  }

  proc schoolbook (ap:W16.t Array32.t, bp:W16.t Array32.t, zeta_0:W256.t,
                   qx16:W256.t, qinvx16:W256.t, sign:int) : W256.t * W256.t *
                                                            W256.t * W256.t = {

    var x0:W256.t;
    var x1:W256.t;
    var y0:W256.t;
    var y1:W256.t;
    var b:W256.t;
    var d:W256.t;
    var a:W256.t;
    var c:W256.t;
    var bdlo:W256.t;
    var bdhi:W256.t;
    var bclo:W256.t;
    var bchi:W256.t;
    var adlo:W256.t;
    var adhi:W256.t;
    var aclo:W256.t;
    var achi:W256.t;
    var bd:W256.t;
    var rbdlo:W256.t;
    var rbdhi:W256.t;
    var bc0:W256.t;
    var bc1:W256.t;
    var ad0:W256.t;
    var ad1:W256.t;
    var ac0:W256.t;
    var ac1:W256.t;
    var rbd0:W256.t;
    var rbd1:W256.t;

    b <- (get256_direct (WArray64.init16 (fun i => ap.[i])) (32 * 1));
    d <- (get256_direct (WArray64.init16 (fun i => bp.[i])) (32 * 1));
    a <- (get256_direct (WArray64.init16 (fun i => ap.[i])) (32 * 0));
    c <- (get256_direct (WArray64.init16 (fun i => bp.[i])) (32 * 0));
    bdlo <@ OpsV.iVPMULL_16u16(b, d);
    bdhi <@ OpsV.iVPMULH_256(b, d);
    bclo <@ OpsV.iVPMULL_16u16(b, c);
    bchi <@ OpsV.iVPMULH_256(b, c);
    adlo <@ OpsV.iVPMULL_16u16(a, d);
    adhi <@ OpsV.iVPMULH_256(a, d);
    aclo <@ OpsV.iVPMULL_16u16(a, c);
    achi <@ OpsV.iVPMULH_256(a, c);
    bdlo <@ OpsV.iVPMULL_16u16(bdlo, qinvx16);
    bdlo <@ OpsV.iVPMULH_256(bdlo, qx16);
    bd <@ OpsV.ivsub16u256(bdhi, bdlo);
    rbdlo <@ OpsV.iVPMULL_16u16(zeta_0, bd);
    rbdhi <@ OpsV.iVPMULH_256(zeta_0, bd);
    bc0 <@ OpsV.iVPUNPCKL_16u16(bclo, bchi);
    bc1 <@ OpsV.iVPUNPCKH_16u16(bclo, bchi);
    ad0 <@ OpsV.iVPUNPCKL_16u16(adlo, adhi);
    ad1 <@ OpsV.iVPUNPCKH_16u16(adlo, adhi);
    ac0 <@ OpsV.iVPUNPCKL_16u16(aclo, achi);
    ac1 <@ OpsV.iVPUNPCKH_16u16(aclo, achi);
    rbd0 <@ OpsV.iVPUNPCKL_16u16(rbdlo, rbdhi);
    rbd1 <@ OpsV.iVPUNPCKH_16u16(rbdlo, rbdhi);
    if ((sign = 0)) {
      x0 <@ OpsV.ivadd32u256(ac0, rbd0);
      x1 <@ OpsV.ivadd32u256(ac1, rbd1);
    } else {
      x0 <@ OpsV.ivsub32u256(ac0, rbd0);
      x1 <@ OpsV.ivsub32u256(ac1, rbd1);
    }
    y0 <@ OpsV.ivadd32u256(bc0, ad0);
    y1 <@ OpsV.ivadd32u256(bc1, ad1);
    return (x0, x1, y0, y1);
  }

  proc basemul_red (a0:W256.t, a1:W256.t, b0:W256.t, b1:W256.t, qx16:W256.t,
                    qinvx16:W256.t) : W256.t * W256.t = {

    var zero:W256.t;
    var y:W256.t;
    var z:W256.t;
    var x:W256.t;

    zero <- setw0_256 ;
    y <@ OpsV.iVPBLENDW_256(a0, zero, (W8.of_int 170));
    z <@ OpsV.iVPBLENDW_256(a1, zero, (W8.of_int 170));
    a0 <@ OpsV.iVPSRL_8u32(a0, (W8.of_int 16));
    a1 <@ OpsV.iVPSRL_8u32(a1, (W8.of_int 16));
    z <@ OpsV.iVPACKUS_8u32(y, z);
    a0 <@ OpsV.iVPACKUS_8u32(a0, a1);
    y <@ OpsV.iVPBLENDW_256(b0, zero, (W8.of_int 170));
    x <@ OpsV.iVPBLENDW_256(b1, zero, (W8.of_int 170));
    b0 <@ OpsV.iVPSRL_8u32(b0, (W8.of_int 16));
    b1 <@ OpsV.iVPSRL_8u32(b1, (W8.of_int 16));
    y <@ OpsV.iVPACKUS_8u32(y, x);
    b0 <@ OpsV.iVPACKUS_8u32(b0, b1);
    z <@ OpsV.iVPMULL_16u16(z, qinvx16);
    y <@ OpsV.iVPMULL_16u16(y, qinvx16);
    z <@ OpsV.iVPMULH_256(z, qx16);
    y <@ OpsV.iVPMULH_256(y, qx16);
    a0 <@ OpsV.ivsub16u256(a0, z);
    b0 <@ OpsV.ivsub16u256(b0, y);
    return (a0, b0);
  }

  proc basemul32x (rp:W16.t Array64.t, ap:W16.t Array64.t,
                   bp:W16.t Array64.t, zeta_0:W256.t, qx16:W256.t,
                   qinvx16:W256.t) : W16.t Array64.t = {

    var x0:W256.t;
    var x1:W256.t;
    var y0:W256.t;
    var y1:W256.t;

    (x0, x1, y0, y1) <@ schoolbook ((Array32.init (fun i => ap.[0 + i])),
    (Array32.init (fun i => bp.[0 + i])), zeta_0, qx16, qinvx16, 0);
    (x0, x1) <@ basemul_red (x0, x1, y0, y1, qx16, qinvx16);
    rp <-
    Array64.init
    (WArray128.get16 (WArray128.set256_direct (WArray128.init16 (fun i => rp.[i])) (32 * 0) x0));
    rp <-
    Array64.init
    (WArray128.get16 (WArray128.set256_direct (WArray128.init16 (fun i => rp.[i])) (32 * 1) x1));
    (x0, x1, y0, y1) <@ schoolbook ((Array32.init (fun i => ap.[32 + i])),
    (Array32.init (fun i => bp.[32 + i])), zeta_0, qx16, qinvx16, 1);
    (x0, x1) <@ basemul_red (x0, x1, y0, y1, qx16, qinvx16);
    rp <-
    Array64.init
    (WArray128.get16 (WArray128.set256_direct (WArray128.init16 (fun i => rp.[i])) (32 * 2) x0));
    rp <-
    Array64.init
    (WArray128.get16 (WArray128.set256_direct (WArray128.init16 (fun i => rp.[i])) (32 * 3) x1));
    return (rp);
  }

  proc poly_basemul (rp:W16.t Array256.t, ap:W16.t Array256.t,
                     bp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: W16.t Array64.t;

    var qx16:W256.t;
    var qinvx16:W256.t;
    var zeta_0:W256.t;

    qx16 <- (get256_direct (WArray32.init16 (fun i => jqx16.[i])) 0);
    qinvx16 <- (get256_direct (WArray32.init16 (fun i => jqinvx16.[i])) 0);
    zeta_0 <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 304);
    aux <@ basemul32x ((Array64.init (fun i => rp.[0 + i])),
    (Array64.init (fun i => ap.[0 + i])),
    (Array64.init (fun i => bp.[0 + i])), zeta_0, qx16, qinvx16);
    rp <- Array256.init
          (fun i => if 0 <= i < 0 + 64 then aux.[i-0] else rp.[i]);
    zeta_0 <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 368);
    aux <@ basemul32x ((Array64.init (fun i => rp.[64 + i])),
    (Array64.init (fun i => ap.[64 + i])),
    (Array64.init (fun i => bp.[64 + i])), zeta_0, qx16, qinvx16);
    rp <- Array256.init
          (fun i => if 64 <= i < 64 + 64 then aux.[i-64] else rp.[i]);
    zeta_0 <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 696);
    aux <@ basemul32x ((Array64.init (fun i => rp.[128 + i])),
    (Array64.init (fun i => ap.[128 + i])),
    (Array64.init (fun i => bp.[128 + i])), zeta_0, qx16, qinvx16);
    rp <- Array256.init
          (fun i => if 128 <= i < 128 + 64 then aux.[i-128] else rp.[i]);
    zeta_0 <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 760);
    aux <@ basemul32x ((Array64.init (fun i => rp.[192 + i])),
    (Array64.init (fun i => ap.[192 + i])),
    (Array64.init (fun i => bp.[192 + i])), zeta_0, qx16, qinvx16);
    rp <- Array256.init
          (fun i => if 192 <= i < 192 + 64 then aux.[i-192] else rp.[i]);
    return (rp);
  }
}.

import KyberPolyAVX.

equiv eq_poly_add2:
  Mavx2_prevec.poly_add2 ~ Mvec.poly_add2: ={rp, bp} ==> ={res}.
proof.
  proc.
  while(={rp, bp, i} /\ 0 <= i{1}).
  wp.
  call eq_ivadd16u256.
  wp. skip. rewrite /is16u16 => />. move => &1 i_lb i_ub.
  do split.
  rewrite /lift2poly; simplify; rewrite pack16_bits16; trivial.
  rewrite /lift2poly; simplify; rewrite pack16_bits16; trivial.
  move => rp_eq bp_eq result_L.
  split.
  rewrite fillE //=.
  apply Array256.ext_eq.
  move => x x_i.
  have x_mb: 0 <= x %% 16 < 16.
    by smt(@IntDiv).
  do rewrite initiE //=.
  rewrite set_get_def //=.
  rewrite -get_unpack16 //.
  rewrite pack16K.
  rewrite get_of_list //.
  smt(@Array16).
  move : i_lb => /#.
  wp; skip.
  move => &1 &2 H.
  split.
  trivial.
  trivial.
qed.

equiv eq_poly_sub:
  Mavx2_prevec.poly_sub ~ Mvec.poly_sub: ={rp, ap, bp} ==> ={res}.
proof.
  proc.
  while(={rp, ap, bp, i} /\ 0 <= i{1}).
  wp.
  call eq_ivsub16u256.
  wp. skip. rewrite /is16u16 => />. move => &1 i_lb i_ub.
  do split.
  rewrite /lift2poly; simplify; rewrite pack16_bits16; trivial.
  rewrite /lift2poly; simplify; rewrite pack16_bits16; trivial.
  move => ap_eq bp_eq result_L.
  split.
  rewrite fillE //=.
  apply Array256.ext_eq.
  move => x x_i.
  have x_mb: 0 <= x %% 16 < 16.
    by smt(@IntDiv).
  do rewrite initiE //=.
  rewrite set_get_def //=.
  rewrite -get_unpack16 //.
  rewrite pack16K.
  rewrite get_of_list //.
  smt(@Array16).
  move : i_lb => /#.
  wp; skip.
  move => &1 &2 H.
  split.
  trivial.
  trivial.
qed.

equiv eq_poly_csubq:
  Mavx2_prevec.poly_csubq ~ Mvec.poly_csubq: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16} /\ 0 <= i{1} /\ is16u16 _qx16{1} qx16{2}).
    inline Mvec.csubq. 
   wp.
    do !(call eq_ivadd16u256 || call eq_ivpand16u16 || call eq_iVPSRA_16u16 || call eq_ivsub16u256).
    wp. skip. rewrite /is16u16 => />. move => &2 i_lb i_ub.
    rewrite /lift2poly; simplify; rewrite pack16_bits16 => //.
    simplify.
    move => result_L2.
    split.
    rewrite fillE.
    apply Array256.ext_eq.
    move => x x_i.
    do rewrite initiE => />.
    have x_mb : 0 <= (x %% 16) < 16.
      move : x_i => /#.
    rewrite set_get_def => //.
    rewrite -get_unpack16 => //.
    rewrite pack16K.
    rewrite get_of_list => //.
    smt(@Array16).
    move : i_lb => /#.
  wp; skip.
  move => &1 &2 H.
  simplify.
  split.
  rewrite H => /=.
  rewrite /lift2poly /is16u16 => />.
  rewrite pack16_bits16.
  trivial.
  trivial.
qed.

equiv eq_poly_tomsg:
  Mavx2_prevec.poly_tomsg ~ Mvec.poly_tomsg: ={rp, a, Glob.mem} ==> ={res}.
proof.
  proc.
  while(={i, rp, a, aux, Glob.mem}  /\ aux{1} = 8 /\ 0 <= i{1} /\ is16u16 hq{1} hq{2} /\ is16u16 hhq{1} hhq{2}).
    wp.
    call eq_iVPMOVMSKB_u256_u32.
    wp.
    call eq_iVPERMQ_32u8.
    wp.
    do (call eq_iVPACKSS_16u16 || call eq_ivsub16u256 || call eq_ilxor16u16 || call eq_iVPSRA_16u16).
    wp. skip. rewrite /is16u16 /is32u8 => />. move => &2 i_lb ii_ub.
    split.
      rewrite /get256_direct /= => />.
      apply W32u8.allP => />.
      do (rewrite initiE 1:/# /=).
      smt(@Int @IntDiv @Array256 @W16).
  move => a0_eq.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt(@Int @IntDiv @Array256 @W16).
  move => a1_eq.
  move : i_lb => /#.
  wp.
  call eq_poly_csubq.
  wp; auto => />.
  rewrite /is16u16 /get256_direct /= => />.
  split; first 2 by apply W32u8.allP => />.
qed.

equiv eq_poly_frommsg:
  Mavx2_prevec.poly_frommsg ~ Mvec.poly_frommsg: ={rp, ap, Glob.mem} /\ (valid_ptr (to_uint ap{1}) 32) ==> ={res}.
proof.
  proc.
  while(={i, rp, ap, Glob.mem} /\ 0 <= i{1} /\ is16u16 hqs{1} hqs{2} /\ is8u32 f{1} f{2} /\
        is32u8 idx{1} idx{2} /\ is8u32 shift{1} shift{2}).
  wp.
  do (call eq_iVPSLL_16u16 || call eq_iVPSRA_16u16 || call eq_ivpand16u16 || call eq_iVPUNPCKL_4u64_16u16 ||
      call eq_iVPUNPCKH_4u64_16u16 || call eq_iVPERM2I128_16u16).
  wp.
  call eq_iVPSHUFB_256.
  wp.
  call eq_iVPSLLV_8u32; call eq_iVPSHUFD_256.
  wp; skip; rewrite /is32u8 /is16u16 /is8u32 => />. move => &2 i_lb i_ub g3_dw.
  split.
    rewrite /f8u32_t32u8 /=.
    apply W8u32.allP => />.
    do rewrite pack4_bits8 //=.
  move => g3_dw_eq g3_b.
  split.
    rewrite /f32u8_t16u16 /=.
    apply W32u8.allP => />.
  move => g3_b_eq g0 g1 g2 g3.
  split.
    apply Array256.ext_eq => j j_i.
    do (rewrite filliE 1:/# //= || rewrite initiE 1:/# //=).
    do (rewrite set_get_def 1:/# //= initiE 1:/# //=).
    do (rewrite mulzDr -(mulzA 16 _) //= || rewrite (addzC (32 * i{2}) _) //=).
    apply if_congr.
      done.
      rewrite -get_unpack16 1:/# /= get_of_list 1:/# /=.
      smt(@List @Int @Array16).
    apply if_congr.
      done.
      rewrite -get_unpack16 1:/# /= get_of_list 1:/# /=.
      smt(@List @Int @Array16).
    apply if_congr.
      done.
      rewrite -get_unpack16 1:/# /= get_of_list 1:/# /=.
      smt(@List @Int @Array16).
    rewrite set_get_def 1:/# //=.
    rewrite -(mulzA 16 _) //= (addzC (32 * i{2}) _) //=.
    rewrite -get_unpack16 1:/# /= get_of_list 1:/# /=.
    smt(@List @Int @Array16).
  move : i_lb => /#.

  wp.
  call eq_iload4u64_8u32; call eq_iVPBROADCAST_2u128_32u8; call eq_iVPBROADCAST_2u128_8u32.
  wp; skip; auto => />.
  rewrite /is4u32 /get128_direct /get_256direct /is32u8 /is16u8 /is8u32 /is16u16 => />.
  move => &2 ap_lb ap_ub.
  split.
    + apply W16u8.allP => />.
  move => shift_eq />.
  split.
    + apply W16u8.allP => />.
  move => idx_eq />.
  split.
    move : ap_ub => /#.
  move => _.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
qed.

equiv eq_red16x:
  Mavx2_prevec.red16x ~ Mvec.red16x: is16u16 r{1} r{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2} ==> is16u16 res{1} res{2}.
proof.
  proc.
  do (call eq_ivsub16u256 || call eq_iVPMULL_16u16 || call eq_iVPSRA_16u16 || call eq_iVPMULH_256).
  trivial.
qed.

equiv eq_poly_reduce:
  Mavx2_prevec.poly_reduce ~ Mvec.poly_reduce: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i} /\ 0 <= i{1} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2}).
  inline Mavx2_prevec.red16x Mvec.red16x.
  wp.
  do !(call eq_ivsub16u256 || call eq_iVPMULL_16u16 || call eq_iVPSRA_16u16 || call eq_iVPMULH_256).
  wp. skip. rewrite /is16u16 => />. move => &2 i_lb i_ub.
  do split.
  rewrite /lift2poly; simplify; rewrite pack16_bits16; trivial.
  rewrite /lift2poly; simplify; rewrite pack16_bits16; trivial.
  move => rp_eq res2.
  do split.
  rewrite fillE.
  apply Array256.ext_eq.
  move => x x_i.
  do rewrite initiE => />.
  have x_mb : 0 <= (x %% 16) < 16.
    move : x_i => /#.
  rewrite set_get_def => //.
  rewrite -get_unpack16 => //.
  rewrite pack16K.
  rewrite get_of_list => //.
  smt(@Array16).
  move : i_lb => /#.
  wp; skip.
  move => &1 &2 rp_eq qx16_R vx16_R qx16_L vx16_L.
  do split.
  rewrite rp_eq //=.
  rewrite /is16u16 /qx16_R /qx16_L /lift2poly;
  do rewrite initiE => />.
  rewrite pack16_bits16 => //.
  rewrite /is16u16 /vx16_R /vx16_L /lift2poly;
  do rewrite initiE => />.
  rewrite pack16_bits16 => //.
  trivial.
qed.

equiv eq_fqmulx16:
  Mavx2_prevec.fqmulx16 ~ Mvec.fqmulx16: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==> is16u16 res{1} res{2}.
proof.
  proc.
  do (call eq_ivsub16u256 || call eq_iVPMULH_256 || call eq_iVPMULL_16u16).
  trivial.
qed.

equiv eq_poly_frommont:
  Mavx2_prevec.poly_frommont ~ Mvec.poly_frommont: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, aux} /\ aux{1} = 16 /\ 0 <= i{1} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} /\ is16u16 dmontx16{1} dmontx16{2}).
  inline Mavx2_prevec.fqmulx16 Mvec.fqmulx16.
  wp.
  do !(call eq_ivsub16u256 || call eq_iVPMULH_256 || call eq_iVPMULL_16u16).
  wp. skip. rewrite /is16u16 => />. move => &2 i_lb i_ub.
  do split.
  rewrite /lift2poly initiE => />.
  rewrite pack16_bits16 => //.
  move => rp_eq_pack_rp.
  move => result_L3.
  split.
  rewrite fillE.
  apply Array256.ext_eq.
  move => x x_i.
  do rewrite initiE => />.
  have x_mb : 0 <= (x %% 16) < 16.
    move : x_i => /#.
  rewrite set_get_def => //.
  rewrite -get_unpack16 => //.
  rewrite pack16K.
  rewrite get_of_list => //.
  smt(@Array16).
  move : i_lb => /#.
  wp; skip.
  move => &1 &2 rp_eq qx16_R qinvx16_R dmontx16_R aux_R qx16_L qinvx16_L dmontx16_L aux_L.
  split.
  rewrite rp_eq /=.
  rewrite /aux_L /aux_R /=.
  rewrite /is16u16.
  rewrite /qx16_R /qinvx16_R /dmontx16_R /qx16_L /qinvx16_L /dmontx16_L.
  rewrite /lift2poly initiE => />.
  do rewrite pack16_bits16 //.
  trivial.
qed.

equiv eq_poly_decompress:
  Mavx2_prevec.poly_decompress ~ Mvec.poly_decompress: ={rp, ap, Glob.mem} ==> ={res}.
proof.
  proc.
  while(={rp, ap, i, aux, Glob.mem} /\ aux{1} = 16 /\ 0 <= i{1} /\ is16u16 q{1} q{2} /\ is16u16 mask{1} mask{2} /\ is16u16 shift{1} shift{2} /\ is32u8 shufbidx{1} shufbidx{2}).
  wp.
  call eq_iVPMULHRS_256; call eq_iVPMULL_16u16; call eq_ivpand16u16.
  wp.
  call eq_iVPSHUFB_256.
  inline Ops.iload16u8.
  sp.
  call eq_iVPBROADCAST_2u128_32u8.
  wp; skip; rewrite /is32u8 /is16u16 /is16u8 => />. move => &2 i_lb i_ub.
  split.
    + rewrite /loadW128 /loadW8 /=.
      apply W16u8.allP => //=.
  move => p_eq res_l0.
  split.
    + rewrite /f32u8_t16u16 initiE //=.
      apply W32u8.allP => //=.
  move => res_l0_eq res_l3.
  split.
    + apply Array256.ext_eq => x x_i />.
      rewrite filliE 1:x_i initiE 1:x_i /=.
      rewrite set_get_def 1:/# 1:x_i.
      rewrite pack16bE 1:/# get_of_list 1:/#.
      smt(@Int @IntDiv @W16u16 @Array16 @Array256).
    + move : i_lb => /#.
  do (wp; call eq_iVPBROADCAST_8u32).
  wp; skip; auto => />. move => resL resR resL_eq_resR resL0 resR0 resL0_eq_resR0.
  do split.
    + rewrite /is16u16 initiE /get256_direct /= => />.
      apply W32u8.allP => />.
    + rewrite /is16u16 /f8u32_t16u16 resL_eq_resR initiE //=.
      apply W8u32.allP => />.
      do (rewrite pack2_bits16 //=).
    + rewrite /is16u16 /f8u32_t16u16 resL0_eq_resR0 initiE //=.
      apply W8u32.allP => />.
      do (rewrite pack2_bits16 //=).
    + rewrite /is32u8 initiE /get256_direct /= => />.
      apply W32u8.allP => />.
qed.

equiv eq_poly_compress:
  Mavx2_prevec.poly_compress ~ Mvec.poly_compress: ={rp, a, Glob.mem} ==> ={res}.
proof.
  proc.
  while(={rp, a, i, aux, Glob.mem} /\ aux{1} = 4 /\ 0 <= i{1} /\ is16u16 v{1} v{2} /\ is16u16 mask{1} mask{2} /\ is16u16 shift1{1} shift1{2} /\
        is16u16 shift2{1} shift2{2} /\ is8u32 permidx{1} permidx{2} /\ is32u8 shift2_b{1} shift2{2}).
  wp.
  call eq_istore32u8.
  wp.
  call eq_iVPERMD.
  wp.
  do (call eq_iVPMULH_256 || call eq_iVPMULHRS_256 || call eq_ivpand16u16 || call eq_iVPACKUS_16u16 || call eq_iVPMADDUBSW_256).
  wp. skip. auto => />. rewrite /is16u16 /is8u32 /is32u8 => />. move => &1 &2 [#] i_lb shift_eq i_ub.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt(@Int @IntDiv @Array256 @W16).
  move => a0_eq.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt(@Int @IntDiv @Array256 @W16).
  move => a1_eq.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt(@Int @IntDiv @Array256 @W16).
  move => a2_eq.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt(@Int @IntDiv @Array256 @W16).
  move => a3_eq.
  move => [#] res1_l. (* FIXME: naming *)
  split.
    apply W32u8.allP => />.
  move => res1_eq res2_l.
  split.
    apply W32u8.allP => />.
  move => res2l_eq.
  move : i_lb => /#.
  wp.
  do call eq_iVPBROADCAST_16u16.
  wp.
  call eq_poly_csubq.
  wp.
  auto => />.
  move => [#] res1_l res1_r res1_eq res2_l res2_r res2_eq res3_l res3_r res3_eq .
  do split.
    + rewrite /is16u16 initiE /get256_direct /= => />.
      apply W32u8.allP => />.
    + rewrite /is8u32 initiE /get256_direct /= => />.
      apply W32u8.allP => />.
    + rewrite /is32u8 /f16u16_t32u8 initiE //= res3_eq.
      apply W16u16.allP => />.
      do (rewrite pack2_bits8 //=).
qed.

equiv eq_schoolbook:
  Mavx2_prevec.schoolbook ~ Mvec.schoolbook: ={ap, bp, sign} /\ is16u16 zeta_0{1} zeta_0{2} /\
                                             is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==>
                                             is16u16 res{1}.`1 res{2}.`1 /\ is16u16 res{1}.`2 res{2}.`2 /\
                                             is16u16 res{1}.`3 res{2}.`3 /\ is16u16 res{1}.`4 res{2}.`4.
proof.
  proc.
  wp.
  do call eq_ivadd32u256.
  seq 33 25 : (#pre /\
               is8u32 ac0_dw{1} ac0{2} /\ is8u32 rbd0_dw{1} rbd0{2} /\
               is8u32 ac1_dw{1} ac1{2} /\ is8u32 rbd1_dw{1} rbd1{2} /\
               is8u32 bc0_dw{1} bc0{2} /\ is8u32 bc1_dw{1} bc1{2} /\
               is8u32 ad0_dw{1} ad0{2} /\ is8u32 ad1_dw{1} ad1{2}).
    wp.
    do (call eq_iVPMULH_256 || call eq_iVPMULL_16u16 || call eq_iVPUNPCKH_16u16 || call eq_iVPUNPCKL_16u16 || call eq_ivsub16u256).
    wp. auto => />.
    move => &1 &2 [#] zeta_eq qx_eq qinvx_eq />.
    do split.
      + rewrite /get256_direct /= => />.
        apply W32u8.allP => />.
      + rewrite /get256_direct /= => />.
        apply W32u8.allP => />.
    move => b_eq d_eq res0_l res0_r res0_eq res1_l res1_r res1_eq />.
    split.
      + rewrite /get256_direct /= => />.
        apply W32u8.allP => />.
    move => c_eq res2l res2r res2_eq res3l res3r res3_eq />.
    split.
      + rewrite /get256_direct /= => />.
        apply W32u8.allP => />.
    move => a_eq />.
    move => [#] res4l res4r res4_eq res5l res5r res5_eq res6l res6r res6_eq res7l res7r res7_eq
                res8l res8r res8_eq res9l res9r res9_eq res10l res10r res10_eq res11l res11r res11_eq
                res12l res12r res12_eq res13l res13r res13_eq res14l res14r res14_eq res15l res15r res15_eq
                res16l res16r res16_eq res17l res17r res17_eq res18l res18r res18_eq res19l res19r res19_eq
                res20l res20r res20_eq.
    do split; first 8 by rewrite /is8u32 /f16u16_t8u32 initiE.
  if{1}.
    + rcondt{2} 1.
      trivial.
      do call eq_ivadd32u256.
      skip; auto => />.
      move => &1 &2 [#] zeta_eq qx_eq qinvx_eq ac0_eq rbd0_eq ac1_eq rbd1_eq bc0_eq bc1_eq ad0_eq ad1_eq
                        res0_l res0_r res0_eq res1_l res1_r res1_eq res2_l res2_r res2_eq res3l res3r res3_eq />.
      do split.
        + rewrite /is16u16 /f8u32_t16u16 initiE //= res0_eq.
          apply W16u16.allP => />.
        + rewrite /is16u16 /f8u32_t16u16 initiE //= res1_eq.
          apply W16u16.allP => />.
        + rewrite /is16u16 /f8u32_t16u16 initiE //= res2_eq.
          apply W16u16.allP => />.
        + rewrite /is16u16 /f8u32_t16u16 initiE //= res3_eq.
          apply W16u16.allP => />.
    + rcondf{2} 1.
      trivial.
      do call eq_ivsub32u256.
      skip; auto => />.
      move => &1 &2 [#] zeta_eq qx_eq qinvx_eq ac0_eq rbd0_eq ac1_eq rbd1_eq bc0_eq bc1_eq ad0_eq ad1_eq sign_not_0
                        res0_l res0_r res0_eq res1_l res1_r res1_eq res2_l res2_r res2_eq res3l res3r res3_eq />.
      do split.
        + rewrite /is16u16 /f8u32_t16u16 initiE //= res0_eq.
          apply W16u16.allP => />.
        + rewrite /is16u16 /f8u32_t16u16 initiE //= res1_eq.
          apply W16u16.allP => />.
        + rewrite /is16u16 /f8u32_t16u16 initiE //= res2_eq.
          apply W16u16.allP => />.
        + rewrite /is16u16 /f8u32_t16u16 initiE //= res3_eq.
          apply W16u16.allP => />.
qed. 

equiv veceq_poly_add2 :
  Mvec.poly_add2 ~ M._poly_add2: ={rp, bp} ==> ={res}.
proof.
  proc.
  while (={rp, bp, i}).
    inline{1} OpsV.ivadd16u256.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.


equiv veceq_poly_sub :
  Mvec.poly_sub ~ M._poly_sub: ={rp, ap, bp} ==> ={res}.
proof.
  proc.
  while (={rp, ap, bp, i}).
    inline{1} OpsV.ivsub16u256.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.

equiv veceq_poly_csubq :
  Mvec.poly_csubq ~ M._poly_csubq: ={rp} ==> ={res}.
proof.
  proc.
  while (={rp, i, qx16}).
    inline *.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.

equiv veceq_poly_tomsg :
  Mvec.poly_tomsg ~ M._poly_tomsg: ={rp, a, Glob.mem} ==> ={res}.
proof.
  proc.
  while(={i, rp, a, aux, hq, hhq} /\ 0 <= i{1}).
    inline *.
    wp. skip. auto => />.
    smt(@Int).
    wp.
    call veceq_poly_csubq.
    wp. skip. auto => />.
qed.

equiv veceq_poly_frommsg :
  Mvec.poly_frommsg ~ M._poly_frommsg: ={rp, ap, Glob.mem} ==> ={res}.
proof.
  proc.
  while (={rp, ap, i, f, shift, idx, hqs, x16p}).
    inline *.
    wp. skip. auto => />.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_red16x:
  Mvec.red16x ~ M.__red16x: ={r, qx16, vx16} ==> ={res}.
proof.
  proc.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_poly_reduce:
  Mvec.poly_reduce ~ M.__poly_reduce: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16, vx16}).
    inline *.
    wp. skip. auto => />.
  wp. skip. auto => />.
qed.

equiv veceq_fqmulx16:
  Mvec.fqmulx16 ~ M.__fqmulx16: ={a, b, qx16, qinvx16} ==> ={res}.
proof.
  proc.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_poly_frommont:
  Mvec.poly_frommont ~ M._poly_frommont: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16, qinvx16, dmontx16, aux}).
  inline *.
  wp. skip. auto => />.
  wp. skip. auto => />.
qed.

equiv veceq_poly_decompress:
  Mvec.poly_decompress ~ M._poly_decompress: ={rp, ap, Glob.mem} ==> ={res}.
proof.
  proc.
  while(={rp, ap, i, aux, q, mask, shift, shufbidx, Glob.mem}).
  inline *.
  wp. skip. auto => />.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_poly_compress:
  Mvec.poly_compress ~ M._poly_compress: ={rp, a, Glob.mem} ==> ={res}.
proof.
  proc.
  while(={rp, a, i, aux, v, shift1, mask, shift2, permidx, Glob.mem}).
  inline *.
  wp. skip. auto => />.
  admit. (* FIXME: PERMD semantics in eclib *)
  inline OpsV.iVPBROADCAST_16u16.
  wp.
  call veceq_poly_csubq.
  wp. skip. auto => />.
qed.

equiv veceq_schoolbook:
  Mvec.schoolbook ~ M.__schoolbook: ={ap, bp, sign, zeta_0, qx16, qinvx16} ==> ={res}.
proof.
  proc.
  inline *.
  wp; skip; auto => />.
qed.

equiv veceq_eq_poly_basemul:
  Mvec.poly_basemul ~ M._poly_basemul: ={rp, ap, bp} ==> ={res}.
proof.
  admit.
  (*FIXME: takes too long (>1hr)
  proc.
  inline *.
  wp. skip. trivial. *)
qed.

equiv prevec_eq_poly_add2:
  Mavx2_prevec.poly_add2 ~ M._poly_add2: ={rp, bp} ==> ={res}.
    transitivity Mvec.poly_add2 (={rp, bp} ==> ={res}) (={rp, bp} ==> ={res}).
smt. trivial.
apply eq_poly_add2.
apply veceq_poly_add2.
qed.

equiv prevec_eq_poly_sub:
  Mavx2_prevec.poly_sub ~ M._poly_sub: ={rp, ap, bp} ==> ={res}.
    transitivity Mvec.poly_sub (={rp, ap, bp} ==> ={res}) (={rp, ap, bp} ==> ={res}).
smt. trivial.
apply eq_poly_sub.
apply veceq_poly_sub.
qed.

equiv prevec_eq_poly_csubq:
  Mavx2_prevec.poly_csubq ~ M._poly_csubq: ={rp} ==> ={res}.
    transitivity Mvec.poly_csubq (={rp} ==> ={res}) (={rp} ==> ={res}).
smt. trivial.
apply eq_poly_csubq.
apply veceq_poly_csubq.
qed.

equiv prevec_eq_poly_tomsg:
  Mavx2_prevec.poly_tomsg ~ M._poly_tomsg: ={rp, a, Glob.mem} ==> ={res}.
    transitivity Mvec.poly_tomsg (={rp, a, Glob.mem} ==> ={res}) (={rp, a, Glob.mem} ==> ={res}).
smt. trivial.
apply eq_poly_tomsg.
apply veceq_poly_tomsg.
qed.

equiv prevec_eq_poly_frommsg:
  Mavx2_prevec.poly_frommsg ~ M._poly_frommsg: ={rp, ap, Glob.mem}  /\ (valid_ptr (to_uint ap{1}) 32)==> ={res}.
     transitivity Mvec.poly_frommsg (={rp, ap, Glob.mem} /\ (valid_ptr (to_uint ap{1}) 32) ==> ={res}) (={rp, ap, Glob.mem} ==> ={res}).
smt. trivial.
apply eq_poly_frommsg.
apply veceq_poly_frommsg.
qed.

equiv prevec_eq_red16x:
  Mavx2_prevec.red16x ~ M.__red16x: is16u16 r{1} r{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2} ==> is16u16 res{1} res{2}.
  transitivity Mvec.red16x (is16u16 r{1} r{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2} ==> is16u16 res{1} res{2})
                           (={r, qx16, vx16} ==> ={res}).
smt. trivial.
apply eq_red16x.
apply veceq_red16x.
qed.

equiv prevec_eq_poly_reduce:
  Mavx2_prevec.poly_reduce ~ M.__poly_reduce: ={rp} ==> ={res}.
    transitivity Mvec.poly_reduce (={rp} ==> ={res}) (={rp} ==> ={res}).
smt. trivial.
apply eq_poly_reduce.
apply veceq_poly_reduce.
qed.

equiv prevec_eq_fqmulx16:
  Mavx2_prevec.fqmulx16 ~ M.__fqmulx16: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==> is16u16 res{1} res{2}.
    transitivity Mvec.fqmulx16 (is16u16 a{1} a{2} /\ is16u16 b{1} b{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==> is16u16 res{1} res{2})
                               (={a, b, qx16, qinvx16} ==> ={res}).
smt. trivial.
apply eq_fqmulx16.
apply veceq_fqmulx16.
qed.

equiv prevec_eq_poly_frommont:
  Mavx2_prevec.poly_frommont ~ M._poly_frommont: ={rp} ==> ={res}.
    transitivity Mvec.poly_frommont (={rp} ==> ={res}) (={rp} ==> ={res}).
smt. trivial.
apply eq_poly_frommont.
apply veceq_poly_frommont.
qed.

equiv prevec_eq_poly_decompress:
  Mavx2_prevec.poly_decompress ~ M._poly_decompress: ={rp, ap, Glob.mem} ==> ={res}.
    transitivity Mvec.poly_decompress (={rp, ap, Glob.mem} ==> ={res}) (={rp, ap, Glob.mem} ==> ={res}).
smt. trivial.
apply eq_poly_decompress.
apply veceq_poly_decompress.
qed.

equiv prevec_eq_poly_compress:
  Mavx2_prevec.poly_compress ~ M._poly_compress: ={rp, a, Glob.mem} ==> ={res}.
    transitivity Mvec.poly_compress (={rp, a, Glob.mem} ==> ={res}) (={rp, a, Glob.mem} ==> ={res}).
smt. trivial.
apply eq_poly_compress.
apply veceq_poly_compress.
qed.

equiv prevec_eq_schoolbook:
  Mavx2_prevec.schoolbook ~ M.__schoolbook: ={ap, bp, sign} /\ is16u16 zeta_0{1} zeta_0{2} /\
                                             is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==>
                                             is16u16 res{1}.`1 res{2}.`1 /\ is16u16 res{1}.`2 res{2}.`2 /\
                                             is16u16 res{1}.`3 res{2}.`3 /\ is16u16 res{1}.`4 res{2}.`4.
proof.
  transitivity Mvec.schoolbook (={ap, bp, sign} /\ is16u16 zeta_0{1} zeta_0{2} /\
                                is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==>
                                is16u16 res{1}.`1 res{2}.`1 /\ is16u16 res{1}.`2 res{2}.`2 /\
                                is16u16 res{1}.`3 res{2}.`3 /\ is16u16 res{1}.`4 res{2}.`4)
                               (={ap, bp, sign, zeta_0, qx16, qinvx16} ==> ={res}).
  smt. trivial.
  apply eq_schoolbook.
  apply veceq_schoolbook.
qed.
