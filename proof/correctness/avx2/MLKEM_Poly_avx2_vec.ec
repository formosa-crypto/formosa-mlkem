require import AllCore List Int IntDiv CoreMap.
from Jasmin require import JModel.
require import Array400 Array256 Array128 Array64 Array32 Array16 Array8 Array4.
require import WArray800 WArray512 WArray128 WArray64 WArray32 WArray16.
require import AVX2_Ops.
require import Jkem Jkem_avx2.
require import MLKEM_Poly_avx2_prevec MLKEM_avx2_encdec MLKEM_avx2_auxlemmas MLKEMFCLib.

module Mvec = {
  proc shuffle8 (a:W256.t, b:W256.t) : W256.t * W256.t = {
    
    var r0:W256.t;
    var r1:W256.t;
    
    r0 <@ OpsV.iVPERM2I128_16u16(a, b, (W8.of_int 32));
    r1 <@ OpsV.iVPERM2I128_16u16(a, b, (W8.of_int 49));
    return (r0, r1);
  }
  
  proc shuffle4 (a:W256.t, b:W256.t) : W256.t * W256.t = {
    
    var r0:W256.t;
    var r1:W256.t;
    
    r0 <@ OpsV.iVPUNPCKL_4u64_16u16(a, b);
    r1 <@ OpsV.iVPUNPCKH_4u64_16u16(a, b);
    return (r0, r1);
  }
  
  proc shuffle2 (a:W256.t, b:W256.t) : W256.t * W256.t = {
    
    var t0:W256.t;
    var t1:W256.t;
    
    t0 <@ OpsV.iVMOVSLDUP_256_16u16(b);
    t0 <@ OpsV.iVPBLEND_8u32_16u16(a, t0, (W8.of_int 170));
    a  <@ OpsV.iVPSRL_4u64(a, (W8.of_int 32));
    t1 <@ OpsV.iVPBLEND_8u32_16u16(a, b, (W8.of_int 170));
    return (t0, t1);
  }
  
  proc shuffle1 (a:W256.t, b:W256.t) : W256.t * W256.t = {
    
    var r0:W256.t;
    var r1:W256.t;
    var t0:W256.t;
    var t1:W256.t;
    
    t0 <@ OpsV.iVPSLL_8u32(b, (W8.of_int 16));
    r0 <@ OpsV.iVPBLEND_16u16(a, t0, (W8.of_int 170));
    t1 <@ OpsV.iVPSRL_8u32(a, (W8.of_int 16));
    r1 <@ OpsV.iVPBLEND_16u16(t1, b, (W8.of_int 170));

    return (r0, r1);
  }

  proc poly_add2(rp:W16.t Array256.t, bp:W16.t Array256.t) : W16.t Array256.t = {
    var i:int;
    var a:W256.t;
    var b:W256.t;
    var r:W256.t;

    i <- 0;

    while (i < 16) {
      a <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));
      b <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * i));
      r <@ OpsV.iVPADD_16u16(a, b);
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
      r <@ OpsV.iVPSUB_16u16(a, b);
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i) r));
      i <- i + 1;
    }
    return (rp);
  }

  proc csubq (r:W256.t, qx16:W256.t) : W256.t = {
    var t:W256.t;

    r <@ OpsV.iVPSUB_16u16(r, qx16);
    t <@ OpsV.iVPSRA_16u16(r, (W8.of_int 15));
    t <@ OpsV.iVPAND_16u16(t,qx16);
    r <@ OpsV.iVPADD_16u16(t, r);

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

  proc poly_frommsg (rp:W16.t Array256.t, ap:W8.t Array32.t) : W16.t Array256.t = {
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
    f <- (get256 (WArray32.init8 (fun i_0 => ap.[i_0])) 0);
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
      g0 <@ OpsV.iVPAND_16u16(g0, hqs);
      g1 <@ OpsV.iVPAND_16u16(g1, hqs);
      g2 <@ OpsV.iVPAND_16u16(g2, hqs);
      g3 <@ OpsV.iVPAND_16u16(g3, hqs);
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
    rd <@ OpsV.iVPSUB_16u16(rhi, rlo);
    return (rd);
  }

  proc poly_tomsg_1 (rp:W8.t Array32.t, a:W16.t Array256.t) : W8.t Array32.t * W16.t Array256.t = {
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
      f0 <@ OpsV.iVPSUB_16u16(hq, f0);
      f1 <@ OpsV.iVPSUB_16u16(hq, f1);
      g0 <@ OpsV.iVPSRA_16u16(f0, (W8.of_int 15));
      g1 <@ OpsV.iVPSRA_16u16(f1, (W8.of_int 15));
      f0 <@ OpsV.iVPXOR_16u16(f0, g0);
      f1 <@ OpsV.iVPXOR_16u16(f1, g1);
      f0 <@ OpsV.iVPSUB_16u16(f0, hhq);
      f1 <@ OpsV.iVPSUB_16u16(f1, hhq);
      f0 <@ OpsV.iVPACKSS_16u16(f0, f1);
      f0 <@ OpsV.iVPERMQ_32u8(f0, (W8.of_int 216));
      c <@ OpsV.iVPMOVMSKB_u256u32(f0);
      rp <-
      Array32.init
      (WArray32.get8 (WArray32.set32 (WArray32.init8 (fun i_0 => rp.[i_0])) i (c)));
      i <- i + 1;
    }
    return (rp,a);
  }

  proc  red16x (r:W256.t, qx16:W256.t, vx16:W256.t) : W256.t = {
    var x:W256.t;

    x <@ OpsV.iVPMULH_256(r, vx16);
    x <@ OpsV.iVPSRA_16u16(x, (W8.of_int 10));
    x <@ OpsV.iVPMULL_16u16(x, qx16);
    r <@ OpsV.iVPSUB_16u16(r, x);
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

  proc poly_compress_1 (rp:W8.t Array128.t, a:W16.t Array256.t) : W8.t Array128.t *
                                                                   W16.t Array256.t = {
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
      f0 <@ OpsV.iVPAND_16u16(f0, mask);
      f1 <@ OpsV.iVPAND_16u16(f1, mask);
      f2 <@ OpsV.iVPAND_16u16(f2, mask);
      f3 <@ OpsV.iVPAND_16u16(f3, mask);
      f0 <@ OpsV.iVPACKUS_16u16(f0, f1);
      f2 <@ OpsV.iVPACKUS_16u16(f2, f3);
      f0 <@ OpsV.iVPMADDUBSW_256(f0, shift2);
      f2 <@ OpsV.iVPMADDUBSW_256(f2, shift2);
      f0 <@ OpsV.iVPACKUS_16u16(f0, f2);
      f0 <@ OpsV.iVPERMD(permidx,f0);
      rp <-
      Array128.init
      (WArray128.get8 (WArray128.set256_direct (WArray128.init8 (fun i_0 => rp.[i_0])) (32 * i) (f0)));
      i <- i + 1;
    }
    return (rp, a);
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
      f0 <@ OpsV.iVPAND_16u16(f0, mask);
      f1 <@ OpsV.iVPAND_16u16(f1, mask);
      f2 <@ OpsV.iVPAND_16u16(f2, mask);
      f3 <@ OpsV.iVPAND_16u16(f3, mask);
      f0 <@ OpsV.iVPACKUS_16u16(f0, f1);
      f2 <@ OpsV.iVPACKUS_16u16(f2, f3);
      f0 <@ OpsV.iVPMADDUBSW_256(f0, shift2);
      f2 <@ OpsV.iVPMADDUBSW_256(f2, shift2);
      f0 <@ OpsV.iVPACKUS_16u16(f0, f2);
      f0 <@ OpsV.iVPERMD(permidx,f0); 
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
    t <- W128.zero ;
    f <- W256.zero ;
    aux <- (256 %/ 16);
    i <- 0;
    while (i < aux) {
      t <@ OpsV.zeroextu128_t8u8(loadW64 Glob.mem (W64.to_uint (ap + (W64.of_int (8 * i)))));
      f <@ OpsV.iVPBROADCAST_2u128_32u8(t);
      f <@ OpsV.iVPSHUFB_256(f, shufbidx);
      f <@ OpsV.iVPAND_16u16(f, mask);
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
    bd <@ OpsV.iVPSUB_16u16(bdhi, bdlo);
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
      x0 <@ OpsV.iVPADD_8u32(ac0, rbd0);
      x1 <@ OpsV.iVPADD_8u32(ac1, rbd1);
    } else {
      x0 <@ OpsV.iVPSUB_8u32(ac0, rbd0);
      x1 <@ OpsV.iVPSUB_8u32(ac1, rbd1);
    }
    y0 <@ OpsV.iVPADD_8u32(bc0, ad0);
    y1 <@ OpsV.iVPADD_8u32(bc1, ad1);
    return (x0, x1, y0, y1);
  }

  proc basemul_red (a0:W256.t, a1:W256.t, b0:W256.t, b1:W256.t, qx16:W256.t,
                    qinvx16:W256.t) : W256.t * W256.t = {

    var zero:W256.t;
    var y:W256.t;
    var z:W256.t;
    var x:W256.t;

    zero <- W256.zero ;
    y <@ OpsV.iVPBLEND_16u16(a0, zero, (W8.of_int 170));
    z <@ OpsV.iVPBLEND_16u16(a1, zero, (W8.of_int 170));
    a0 <@ OpsV.iVPSRL_8u32(a0, (W8.of_int 16));
    a1 <@ OpsV.iVPSRL_8u32(a1, (W8.of_int 16));
    z <@ OpsV.iVPACKUS_8u32(y, z);
    a0 <@ OpsV.iVPACKUS_8u32(a0, a1);
    y <@ OpsV.iVPBLEND_16u16(b0, zero, (W8.of_int 170));
    x <@ OpsV.iVPBLEND_16u16(b1, zero, (W8.of_int 170));
    b0 <@ OpsV.iVPSRL_8u32(b0, (W8.of_int 16));
    b1 <@ OpsV.iVPSRL_8u32(b1, (W8.of_int 16));
    y <@ OpsV.iVPACKUS_8u32(y, x);
    b0 <@ OpsV.iVPACKUS_8u32(b0, b1);
    z <@ OpsV.iVPMULL_16u16(z, qinvx16);
    y <@ OpsV.iVPMULL_16u16(y, qinvx16);
    z <@ OpsV.iVPMULH_256(z, qx16);
    y <@ OpsV.iVPMULH_256(y, qx16);
    a0 <@ OpsV.iVPSUB_16u16(a0, z);
    b0 <@ OpsV.iVPSUB_16u16(b0, y);
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

  proc poly_tobytes (rp:W64.t, a:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;
    
    var jqx16_p:W16.t Array16.t;
    var qx16:W256.t;
    var i:int;
    var t0:W256.t;
    var t1:W256.t;
    var t2:W256.t;
    var t3:W256.t;
    var t4:W256.t;
    var t5:W256.t;
    var t6:W256.t;
    var t7:W256.t;
    var tt:W256.t;
    var ttt:W256.t;
    jqx16_p <- witness;
    jqx16_p <- jqx16;
    qx16 <- (get256 (WArray32.init16 (fun i => jqx16_p.[i])) 0);
    a <@ poly_csubq (a);
    i <- 0;
    while (i < 2) {
      t0 <- (get256 (WArray512.init16 (fun i => a.[i])) (8 * i));
      t1 <- (get256 (WArray512.init16 (fun i => a.[i])) ((8 * i) + 1));
      t2 <- (get256 (WArray512.init16 (fun i => a.[i])) ((8 * i) + 2));
      t3 <- (get256 (WArray512.init16 (fun i => a.[i])) ((8 * i) + 3));
      t4 <- (get256 (WArray512.init16 (fun i => a.[i])) ((8 * i) + 4));
      t5 <- (get256 (WArray512.init16 (fun i => a.[i])) ((8 * i) + 5));
      t6 <- (get256 (WArray512.init16 (fun i => a.[i])) ((8 * i) + 6));
      t7 <- (get256 (WArray512.init16 (fun i => a.[i])) ((8 * i) + 7));
      tt <@ OpsV.iVPSLL_16u16(t1, (W8.of_int 12));
      tt <@ OpsV.iVPOR_16u16(tt, t0);
      t0 <@ OpsV.iVPSRL_16u16(t1, (W8.of_int 4));
      t1 <@ OpsV.iVPSLL_16u16(t2, (W8.of_int 8));
      t0 <@ OpsV.iVPOR_16u16(t0, t1);
      t1 <@ OpsV.iVPSRL_16u16(t2, (W8.of_int 8));
      t2 <@ OpsV.iVPSLL_16u16(t3, (W8.of_int 4));
      t1 <@ OpsV.iVPOR_16u16(t1, t2);
      t2 <@ OpsV.iVPSLL_16u16(t5, (W8.of_int 12));
      t2 <@ OpsV.iVPOR_16u16(t2, t4);
      t3 <@ OpsV.iVPSRL_16u16(t5, (W8.of_int 4));
      t4 <@ OpsV.iVPSLL_16u16(t6, (W8.of_int 8));
      t3 <@ OpsV.iVPOR_16u16(t3, t4);
      t4 <@ OpsV.iVPSRL_16u16(t6, (W8.of_int 8));
      t5 <@ OpsV.iVPSLL_16u16(t7, (W8.of_int 4));
      t4 <@ OpsV.iVPOR_16u16(t4, t5);
      (ttt, t0) <@ shuffle1 (tt, t0);
      (tt, t2) <@ shuffle1 (t1, t2);
      (t1, t4) <@ shuffle1 (t3, t4);
      (t3, tt) <@ shuffle2 (ttt, tt);
      (ttt, t0) <@ shuffle2 (t1, t0);
      (t1, t4) <@ shuffle2 (t2, t4);
      (t2, ttt) <@ shuffle4 (t3, ttt);
      (t3, tt) <@ shuffle4 (t1, tt);
      (t1, t4) <@ shuffle4 (t0, t4);
      (t0, t3) <@ shuffle8 (t2, t3);
      (t2, ttt) <@ shuffle8 (t1, ttt);
      (t1, t4) <@ shuffle8 (tt, t4);
      Glob.mem <@ OpsV.istore32u8(Glob.mem, rp + (W64.of_int (192 * i)), t0);
      Glob.mem <@ OpsV.istore32u8(Glob.mem, rp + (W64.of_int ((192 * i) + 32)), t2);
      Glob.mem <@ OpsV.istore32u8(Glob.mem, rp + (W64.of_int ((192 * i) + 64)), t1);
      Glob.mem <@ OpsV.istore32u8(Glob.mem, rp + (W64.of_int ((192 * i) + 96)), t3);
      Glob.mem <@ OpsV.istore32u8(Glob.mem, rp + (W64.of_int ((192 * i) + 128)), ttt);
      Glob.mem <@ OpsV.istore32u8(Glob.mem, rp + (W64.of_int ((192 * i) + 160)), t4);
      i <- i + 1;
    }
    return (a);
  }

  proc poly_frombytes (rp:W16.t Array256.t, ap:W64.t) : W16.t Array256.t = {
    var aux: int;

    var maskp:W16.t Array16.t;
    var mask:W256.t;
    var i:int;
    var t0:W256.t;
    var t1:W256.t;
    var t2:W256.t;
    var t3:W256.t;
    var t4:W256.t;
    var t5:W256.t;
    var tt:W256.t;
    var t6:W256.t;
    var t7:W256.t;
    var t8:W256.t;
    var t9:W256.t;
    var t10:W256.t;
    var t11:W256.t;

    maskp <- maskx16;
    mask <- (get256 (WArray32.init16 (fun i => maskp.[i])) 0);
    i <- 0;
    while (i < 2) {
      t0 <@ OpsV.iload32u8(Glob.mem, ap + (W64.of_int (192 * i)));
      t1 <@ OpsV.iload32u8(Glob.mem, ap + (W64.of_int ((192 * i) + 32)));
      t2 <@ OpsV.iload32u8(Glob.mem, ap + (W64.of_int ((192 * i) + 64)));
      t3 <@ OpsV.iload32u8(Glob.mem, ap + (W64.of_int ((192 * i) + 96)));
      t4 <@ OpsV.iload32u8(Glob.mem, ap + (W64.of_int ((192 * i) + 128)));
      t5 <@ OpsV.iload32u8(Glob.mem, ap + (W64.of_int ((192 * i) + 160)));

      (tt, t3) <@ shuffle8 (t0, t3);
      (t0, t4) <@ shuffle8 (t1, t4);
      (t1, t5) <@ shuffle8 (t2, t5);
      (t2, t4) <@ shuffle4 (tt, t4);
      (tt, t1) <@ shuffle4 (t3, t1);
      (t3, t5) <@ shuffle4 (t0, t5);
      (t0, t1) <@ shuffle2 (t2, t1);
      (t2, t3) <@ shuffle2 (t4, t3);
      (t4, t5) <@ shuffle2 (tt, t5);
      (t6, t3) <@ shuffle1 (t0, t3);
      (t0, t4) <@ shuffle1 (t1, t4);
      (t1, t5) <@ shuffle1 (t2, t5);

      t7 <@ OpsV.iVPSRL_16u16(t6, (W8.of_int 12));
      t8 <@ OpsV.iVPSLL_16u16(t3, (W8.of_int 4));
      t7 <@ OpsV.iVPOR_16u16(t7, t8);
      t6 <@ OpsV.iVPAND_16u16(mask, t6);
      t7 <@ OpsV.iVPAND_16u16(mask, t7);
      t8 <@ OpsV.iVPSRL_16u16(t3, (W8.of_int 8));
      t9 <@ OpsV.iVPSLL_16u16(t0, (W8.of_int 8));
      t8 <@ OpsV.iVPOR_16u16(t8, t9);
      t8 <@ OpsV.iVPAND_16u16(mask, t8);
      t9 <@ OpsV.iVPSRL_16u16(t0, (W8.of_int 4));
      t9 <@ OpsV.iVPAND_16u16(mask, t9);
      t10 <@ OpsV.iVPSRL_16u16(t4, (W8.of_int 12));
      t11 <@ OpsV.iVPSLL_16u16(t1, (W8.of_int 4));
      t10 <@ OpsV.iVPOR_16u16(t10, t11);
      t4 <@ OpsV.iVPAND_16u16(mask, t4);
      t10 <@ OpsV.iVPAND_16u16(mask, t10);
      t11 <@ OpsV.iVPSRL_16u16(t1, (W8.of_int 8));
      tt <@ OpsV.iVPSLL_16u16(t5, (W8.of_int 8));
      t11 <@ OpsV.iVPOR_16u16(t11, tt);
      t11 <@ OpsV.iVPAND_16u16(mask, t11);
      tt <@ OpsV.iVPSRL_16u16(t5, (W8.of_int 4));
      tt <@ OpsV.iVPAND_16u16(mask, tt);

      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) (8 * i) t6));
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) ((8 * i) + 1) t7));
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) ((8 * i) + 2) t8));
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) ((8 * i) + 3) t9));
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) ((8 * i) + 4) t4));
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) ((8 * i) + 5) t10));
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) ((8 * i) + 6) t11));
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) ((8 * i) + 7) tt));
      i <- i + 1;
    }
    return (rp);
  }
}.

theory MLKEM_PolyAVXVec.

import AVX2_cf.

equiv eq_poly_add2:
  Mprevec.poly_add2 ~ Mvec.poly_add2: ={rp, bp} ==> ={res}.
proof.
  proc.
  while(={rp, bp, i} /\ 0 <= i{1}).
  wp.
  call eq_iVPADD_16u16.
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
    by smt().
  do rewrite initiE //=.
  rewrite set_get_def //=.
  rewrite -get_unpack16 //.
  rewrite pack16K.
  rewrite get_of_list //.
  smt().
  move : i_lb => /#.
  wp; skip.
  move => &1 &2 H.
  split.
  trivial.
  trivial.
qed.

equiv eq_poly_sub:
  Mprevec.poly_sub ~ Mvec.poly_sub: ={rp, ap, bp} ==> ={res}.
proof.
  proc.
  while(={rp, ap, bp, i} /\ 0 <= i{1}).
  wp.
  call eq_iVPSUB_16u16.
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
    by smt().
  do rewrite initiE //=.
  rewrite set_get_def //=.
  rewrite -get_unpack16 //.
  rewrite pack16K.
  rewrite get_of_list //.
  smt().
  move : i_lb => /#.
  wp; skip.
  move => &1 &2 H.
  split.
  trivial.
  trivial.
qed.

equiv eq_poly_csubq:
  Mprevec.poly_csubq ~ Mvec.poly_csubq: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16} /\ 0 <= i{1} /\ is16u16 _qx16{1} qx16{2}).
    inline Mvec.csubq. 
   wp.
    do !(call eq_iVPADD_16u16 || call eq_iVPAND_16u16 || call eq_iVPSRA_16u16 || call eq_iVPSUB_16u16).
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
    smt().
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
  Mprevec.poly_tomsg_1 ~ Mvec.poly_tomsg_1: ={rp, a} ==> ={res}.
proof.
  proc.
  while(={i, rp, a, aux}  /\ aux{1} = 8 /\ 0 <= i{1} /\ is16u16 hq{1} hq{2} /\ is16u16 hhq{1} hhq{2}).
    wp.
    call eq_iVPMOVMSKB_u256u32.
    wp.
    call eq_iVPERMQ_32u8.
    wp.
    do (call eq_iVPACKSS_16u16 || call eq_iVPSUB_16u16 || call eq_iVPXOR_16u16 || call eq_iVPSRA_16u16).
    wp. skip. rewrite /is16u16 /is32u8 => />. move => &2 i_lb ii_ub.
    split.
      rewrite /get256_direct /= => />.
      apply W32u8.allP => />.
      do (rewrite initiE 1:/# /=).
      smt().
  move => a0_eq.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt().
  move => a1_eq.
  move : i_lb => /#.
  wp.
  call eq_poly_csubq.
  wp; auto => />.
  rewrite /is16u16 /get256_direct /= => />.
  split; first 2 by apply W32u8.allP => />.
qed.

equiv eq_poly_frommsg:
  Mprevec.poly_frommsg_1 ~ Mvec.poly_frommsg: ={rp, ap} ==> ={res}.
proof.
  proc.
  while(={i, rp, ap} /\ 0 <= i{1} /\ is16u16 hqs{1} hqs{2} /\ is8u32 f{1} f{2} /\
        is32u8 idx{1} idx{2} /\ is8u32 shift{1} shift{2}).
  wp.
  do (call eq_iVPSLL_16u16 || call eq_iVPSRA_16u16 || call eq_iVPAND_16u16 || call eq_iVPUNPCKL_4u64_16u16 ||
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
      smt().
    apply if_congr.
      done.
      rewrite -get_unpack16 1:/# /= get_of_list 1:/# /=.
      smt().
    apply if_congr.
      done.
      rewrite -get_unpack16 1:/# /= get_of_list 1:/# /=.
      smt().
    rewrite set_get_def 1:/# //=.
    rewrite -(mulzA 16 _) //= (addzC (32 * i{2}) _) //=.
    rewrite -get_unpack16 1:/# /= get_of_list 1:/# /=.
    smt().
  move : i_lb => /#.

  wp.
 call eq_iVPBROADCAST_2u128_32u8; call eq_iVPBROADCAST_2u128_8u32.
  wp; skip; auto => />.
  rewrite /is4u32 /get128_direct /get_256direct /is32u8 /is16u8 /is8u32 /is16u16 => />.
  move => &2.
  split.
    + by apply W16u8.allP => />.
  move => shift_eq />.
  split.
    + apply W16u8.allP => />.
  move => idx_eq />.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
qed.

equiv eq_red16x:
  Mprevec.red16x ~ Mvec.red16x: is16u16 r{1} r{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2} ==> is16u16 res{1} res{2}.
proof.
  proc.
  do (call eq_iVPSUB_16u16 || call eq_iVPMULL_16u16 || call eq_iVPSRA_16u16 || call eq_iVPMULH_256).
  trivial.
qed.

equiv eq_poly_reduce:
  Mprevec.poly_reduce ~ Mvec.poly_reduce: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i} /\ 0 <= i{1} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2}).
  inline Mprevec.red16x Mvec.red16x.
  wp.
  do !(call eq_iVPSUB_16u16 || call eq_iVPMULL_16u16 || call eq_iVPSRA_16u16 || call eq_iVPMULH_256).
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
  smt().
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
  Mprevec.fqmulx16 ~ Mvec.fqmulx16: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==> is16u16 res{1} res{2}.
proof.
  proc.
  do (call eq_iVPSUB_16u16 || call eq_iVPMULH_256 || call eq_iVPMULL_16u16).
  trivial.
qed.

equiv eq_poly_frommont:
  Mprevec.poly_frommont ~ Mvec.poly_frommont: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, aux} /\ aux{1} = 16 /\ 0 <= i{1} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} /\ is16u16 dmontx16{1} dmontx16{2}).
  inline Mprevec.fqmulx16 Mvec.fqmulx16.
  wp.
  do !(call eq_iVPSUB_16u16 || call eq_iVPMULH_256 || call eq_iVPMULL_16u16).
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
  smt().
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
  Mprevec.poly_decompress ~ Mvec.poly_decompress: ={ap, Glob.mem} ==> ={res, Glob.mem}.
proof.
  proc.
  while(={ap, i, aux, Glob.mem} /\
        (forall k, 0 <= k < 16 * i{1} => rp{1}.[k] = rp{2}.[k]) /\
        aux{1} = 16 /\ 0 <= i{1} /\ i{1} <= 16 /\ is16u16 q{1} q{2} /\ is16u16 mask{1} mask{2} /\ is16u16 shift{1} shift{2} /\ is32u8 shufbidx{1} shufbidx{2}).
  wp.
  call eq_iVPMULHRS_256; call eq_iVPMULL_16u16; call eq_iVPAND_16u16.
  wp.
  call eq_iVPSHUFB_256.
  inline Ops.iload8u8.
  sp.
  call eq_iVPBROADCAST_2u128_32u8.
  call eq_zeroextu128_t8u8.
  wp; skip; rewrite /is32u8 /is16u16 /is16u8 => />. move => &1 &2 rp_l i_lb i_ub i_tub.
  split.
    + rewrite /loadW64 /loadW8 /=.
      apply W8u8.allP => //=.
  move => p_eq res_l0.
  split.
    + rewrite /f32u8_t16u16 initiE //=.
      apply W32u8.allP => //=.
  move => res_l0_eq res_l3.
  split.
    + rewrite mulzDr mulz1 => k k_lb k_ub.
      rewrite filliE 1:/# initiE 1:/# /=.
      rewrite set_get_def 1:/# 1:/#.
      rewrite pack16bE 1:/# get_of_list 1:/#.
      smt().
    + move : i_lb => /#.
  do (wp; call eq_iVPBROADCAST_8u32).
  wp; skip; auto => />. move => &1 &2 resL resR resL_eq_resR resL0 resR0 resL0_eq_resR0.
  do split.
    + smt().
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
  auto => />.
  move => rp_L i rp_R i_tlb rp_l i_lb i_ub _ _ _ _.
  apply Array256.ext_eq.
  move : rp_l.
  have -> //=: i = 16. by move : i_ub i_tlb => /#.
qed.

lemma set_get8_def128 (v : W8.t Array128.t) (w: W256.t) i j :
    0 <= i < 32 => 0 <= j < 128 =>
    WArray128.get8
    (WArray128.set256 (WArray128.init8 (fun k => v.[k])) i w) j =
      if 32 * i <= j < 32 * i + 32 then w \bits8 (j %% 32)
      else v.[j].
proof.
  move => hx hs; rewrite set256E /get8.
  rewrite initiE 1:/# /=.
  rewrite initiE 1: hs /=.
  case : (32 * i <= j < 32 * i + 32) => h.
    + by smt().
    + by reflexivity.
qed.

equiv eq_poly_compress_1:
  Mprevec.poly_compress_1 ~ Mvec.poly_compress_1: ={rp, a, Glob.mem} ==> ={res,Glob.mem}.
proof.
  proc.
  while(={rp, a, i, aux, Glob.mem} /\ aux{1} = 4 /\ 0 <= i{1} /\ is16u16 v{1} v{2} /\ is16u16 mask{1} mask{2} /\ is16u16 shift1{1} shift1{2} /\
        is16u16 shift2{1} shift2{2} /\ is8u32 permidx{1} permidx{2} /\ is32u8 shift2_b{1} shift2{2}).
  wp.
  call eq_iVPERMD.
  wp.
  do (call eq_iVPMULH_256 || call eq_iVPMULHRS_256 || call eq_iVPAND_16u16 || call eq_iVPACKUS_16u16 || call eq_iVPMADDUBSW_256).
  wp. skip. auto => />. rewrite /is16u16 /is8u32 /is32u8 => />. move => &1 &2 [#] i_lb _ i_ub.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt().
  move => _.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt().
  move => _.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt().
  move => _.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt().
  move => _.
  move => [#] res1_l. (* FIXME: naming *)
  split.
    apply W32u8.allP => />.
  move => _ res2_l.
  split.
    apply Array128.ext_eq => j jb.
    + rewrite filliE 1:/# initiE 1:/# /=.
      have ->: WArray128.init8 ("_.[_]" rp{2}) = WArray128.init (fun k => rp{2}.[k]); first by simplify.
      rewrite set_get8_def128 1..2:/#.
      rewrite /f8u32_t32u8 initiE 1:modz_cmp //=.
      case (32 * i{2} <= j && j < 32 * i{2} + 32) => j_sb.
        + pose ji := j %% 32.
          have rj_b: ji \in iota_ 0 32.
            rewrite /ji mem_iota /= -andabP 1:modz_cmp 1://=.
          move : ji rj_b.
          rewrite -List.allP -iotaredE //=.
        + reflexivity.
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


equiv eq_poly_compress:
  Mprevec.poly_compress ~ Mvec.poly_compress: ={rp, a, Glob.mem} ==> ={res,Glob.mem}.
proof.
  proc.
  while(={rp, a, i, aux, Glob.mem} /\ aux{1} = 4 /\ 0 <= i{1} /\ is16u16 v{1} v{2} /\ is16u16 mask{1} mask{2} /\ is16u16 shift1{1} shift1{2} /\
        is16u16 shift2{1} shift2{2} /\ is8u32 permidx{1} permidx{2} /\ is32u8 shift2_b{1} shift2{2}).
  wp.
  call eq_istore32u8.
  wp.
  call eq_iVPERMD.
  wp.
  do (call eq_iVPMULH_256 || call eq_iVPMULHRS_256 || call eq_iVPAND_16u16 || call eq_iVPACKUS_16u16 || call eq_iVPMADDUBSW_256).
  wp. skip. auto => />. rewrite /is16u16 /is8u32 /is32u8 => />. move => &1 &2 [#] i_lb shift_eq i_ub.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt().
  move => a0_eq.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt().
  move => a1_eq.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt().
  move => a2_eq.
  split.
    rewrite /get256_direct /= => />.
    apply W32u8.allP => />.
    do (rewrite initiE 1:/# /=).
    smt().
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
  Mprevec.schoolbook ~ Mvec.schoolbook: ={ap, bp, sign} /\ is16u16 zeta_0{1} zeta_0{2} /\
                                             is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==>
                                             is16u16 res{1}.`1 res{2}.`1 /\ is16u16 res{1}.`2 res{2}.`2 /\
                                             is16u16 res{1}.`3 res{2}.`3 /\ is16u16 res{1}.`4 res{2}.`4.
proof.
  proc.
  wp.
  do call eq_iVPADD_8u32.
  seq 33 25 : (#pre /\
               is8u32 ac0_dw{1} ac0{2} /\ is8u32 rbd0_dw{1} rbd0{2} /\
               is8u32 ac1_dw{1} ac1{2} /\ is8u32 rbd1_dw{1} rbd1{2} /\
               is8u32 bc0_dw{1} bc0{2} /\ is8u32 bc1_dw{1} bc1{2} /\
               is8u32 ad0_dw{1} ad0{2} /\ is8u32 ad1_dw{1} ad1{2}).
    wp.
    do (call eq_iVPMULH_256 || call eq_iVPMULL_16u16 || call eq_iVPUNPCKH_16u16 || call eq_iVPUNPCKL_16u16 || call eq_iVPSUB_16u16).
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
      do call eq_iVPADD_8u32.
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
      do call eq_iVPSUB_8u32.
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

equiv eq_shuffle8:
  Mprevec.shuffle8 ~ Mvec.shuffle8: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                                    is16u16 res{1}.`1 res{2}.`1 /\
                                    is16u16 res{1}.`2 res{2}.`2.
proof.
  proc.
  do call eq_iVPERM2I128_16u16.
  wp; skip; auto => />.
qed.

equiv eq_shuffle4:
  Mprevec.shuffle4 ~ Mvec.shuffle4: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                                    is16u16 res{1}.`1 res{2}.`1 /\
                                    is16u16 res{1}.`2 res{2}.`2.
proof.
  proc.
  call eq_iVPUNPCKH_4u64_16u16.
  call eq_iVPUNPCKL_4u64_16u16.
  inline *; wp; skip; auto => />.
qed.

equiv eq_shuffle2:
  Mprevec.shuffle2 ~ Mvec.shuffle2: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                                    is16u16 res{1}.`1 res{2}.`1 /\
                                    is16u16 res{1}.`2 res{2}.`2.
proof.
  proc.
  call eq_iVPBLEND_8u32_16u16.
  wp.
  call eq_iVPSRL_4u64.
  wp.
  call eq_iVPBLEND_8u32_16u16.
  call eq_iVMOVSLDUP_256_16u16.
  inline *; wp; skip; auto => />.
  move => &1 &2 [#] a_eq b_eq resL resR res_eq resL0 resR0 res0_eq />.
  split.
    + by rewrite /is4u64 /f16u16_t4u64.
    move => aq_eq resL1 resR1 res1_eq />.
    + rewrite /is16u16 /f4u64_t16u16 res1_eq => />.
      apply W16u16.allP => />.
qed.

equiv eq_shuffle1:
  Mprevec.shuffle1 ~ Mvec.shuffle1: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                                    is16u16 res{1}.`1 res{2}.`1 /\
                                    is16u16 res{1}.`2 res{2}.`2.
proof.
  proc.
  call eq_iVPBLEND_16u16.
  wp.
  call eq_iVPSRL_8u32.
  wp.
  call eq_iVPBLEND_16u16.
  wp.
  call eq_iVPSLL_8u32.
  wp.
  inline *; wp; skip; auto => />.
  move => &1 &2 [#] a_eq b_eq.
  split.
    + by rewrite /is8u32 /f16u16_t8u32.
    move => bd_eq resL resR res_eq.
    split.
    + rewrite /is16u16 /f8u32_t16u16 res_eq => />.
      apply W16u16.allP => />.
    move => resd_eq resL0 resR0 res0_eq />.
    split.
    + by rewrite /is8u32 /f16u16_t8u32.
    move => ad_eq resL1 resR1 res1_eq.
    + rewrite /is16u16 /f8u32_t16u16 res1_eq => />.
      apply W16u16.allP => />.
qed.

equiv eq_poly_tobytes:
  Mprevec.poly_tobytes ~ Mvec.poly_tobytes: ={rp, a, Glob.mem} ==> ={Glob.mem, res}.
proof.
  proc.
  while(={rp, a, i, Glob.mem} /\ 0 <= i{1} /\ is16u16 qx16{1} qx16{2}).
  wp.
  do call eq_istore32u8; wp; conseq />. 
  do (call eq_shuffle8 || call eq_shuffle4 || call eq_shuffle2 || call eq_shuffle1).
  conseq />. 
  + move => &1 &2 [#] *.
    do 5!( move => *; do split; 1,2: by smt()). 
    by smt().
  do (call eq_iVPOR_16u16 || call eq_iVPSLL_16u16 || call eq_iVPSRL_16u16).
  wp; skip; auto => />.
  move => &1 &2 [#] i_lb qx16_eq i_tub />.
  split.
    + rewrite /is16u16 /get256_direct /= => />.
      apply W16u16.allP => />.
      do (rewrite initiE 1:/# /=).
      do split; first 16 by apply W2u8.allP => />; smt().
  move => a_eq resL resR res_eq />.
  split.
    + rewrite /is16u16 /get256_direct /= => />.
      apply W16u16.allP => />.
      do (rewrite initiE 1:/# /=).
      do split; first 16 by apply W2u8.allP => />; smt().
  move => a1_eq resL0 resR0 res0_eq resL1 resR1 res1_eq />.
  split.
    + rewrite /is16u16 /get256_direct /= => />.
      apply W16u16.allP => />.
      do (rewrite initiE  1:/# /=).
      do split; first 16 by apply W2u8.allP => />; smt().
  move => a2_eq resL2 resR2 res2_eq resL3 resR3 res3_eq resL4 resR4 res4_eq/>.
  split.
    + rewrite /is16u16 /get256_direct /= => />.
      apply W16u16.allP => />.
      do 32!(rewrite initiE 1:/# /=).
      do split; first 16 by apply W2u8.allP => />; smt().
  move => a3_eq resL5 resR5 res5_eq resL6 resR6 res6_eq />.
  split.
    + rewrite /is16u16 /get256_direct /= => />.
      apply W16u16.allP => />.
      do 32!(rewrite initiE 1:/# /=).
      do split; first 16 by apply W2u8.allP => />; smt().
  move => a4_eq resL7 resR7 res7_eq />.
  split.
    + rewrite /is16u16 /get256_direct /= => />.
      apply W16u16.allP => />.
      do 32!(rewrite initiE 1:/# /=).
      do split; first 16 by apply W2u8.allP => />; smt().
  move => a5_eq resL8 resR8 res8_eq resL9 resR9 res9_eq />.
  split.
    + rewrite /is16u16 /get256_direct /= => />.
      apply W16u16.allP => />.
      do 32!(rewrite initiE 1:/# /=).
      do split; first 16 by apply W2u8.allP => />; smt().
  move => a6_eq resL10 resR10 res10_eq resL11 resR11 res11_eq resL12 resR12 res12_eq />.
  split.
    + rewrite /is16u16 /get256_direct /= => />.
      apply W16u16.allP => />.
      do 32!(rewrite initiE 1:/# /=).
      do split; first 16 by apply W2u8.allP => />; smt().
  move => [#] a7_eq resL13 resR13 res13_eq resL14 resR14 res14_eq resL15 resR15 res15_eq_1 res15_eq_2
                    resL16 resR16 res16_eq_1 res16_eq_2 resL17 resR17 res17_eq_1 res17_eq_2
                    resL18 resR18 res18_eq_1 res18_eq_2 resL19 resR19 res19_eq_1 res19_eq_2
                    resL20 resR20 res20_eq_1 res20_eq_2 resL21 resR21 res21_eq_1 res21_eq_2
                    resL22 resR22 res22_eq_1 res22_eq_2 resL23 resR23 res23_eq_1 res23_eq_2
                    resL24 resR24 res24_eq_1 res24_eq_2 resL25 resR25 res25_eq_1 res25_eq_2
                    resL26 resR26 res26_eq_1 res26_eq_2 />.
  split.
    + rewrite /is32u8 /f16u16_t32u8 res24_eq_1.
      apply W32u8.allP => />.
  move => res24b_eq_1.
  split.
    + rewrite /is32u8 /f16u16_t32u8 res25_eq_1.
      apply W32u8.allP => />.
  move => res25b_eq_1.
  split.
    + rewrite /is32u8 /f16u16_t32u8 res26_eq_1.
      apply W32u8.allP => />.
  move => res26b_eq_1.
  split.
    + rewrite /is32u8 /f16u16_t32u8 res24_eq_2.
      apply W32u8.allP => />.
  move => res24b_eq_2.
  split.
    + rewrite /is32u8 /f16u16_t32u8 res25_eq_2.
      apply W32u8.allP => />.
  move => res25b_eq_2.
  split.
    + rewrite /is32u8 /f16u16_t32u8 res26_eq_2.
      apply W32u8.allP => />.
  move => res26b_eq_2.
  move : i_lb => /#.
  wp.
  call eq_poly_csubq.
  wp; skip; auto => />.
  rewrite /is16u16 /get256_direct /= => />.
  apply W32u8.allP => />.
qed.

equiv eq_poly_frombytes:
  Mprevec.poly_frombytes ~ Mvec.poly_frombytes: ={rp, ap, Glob.mem} ==> ={res}.
proof.
  proc.
  while(={rp, ap, i, Glob.mem} /\ 0 <= i{1} /\ is16u16 mask{1} mask{2}).
  wp.
  do (call eq_iVPAND_16u16 || call eq_iVPOR_16u16 || call eq_iVPSLL_16u16 || call eq_iVPSRL_16u16).
  do (call eq_shuffle8 || call eq_shuffle4 || call eq_shuffle2 || call eq_shuffle1).
  wp.
  do call eq_iload32u8.
  wp; skip; auto => />.
  move => &1 &2 [#] i_lb mask_eq i_tub />.
  move => resL0 resR0 res0_eq resL1 resR1 res1_eq
          resL2 resR2 res2_eq resL3 resR3 res3_eq
          resL4 resR4 res4_eq resL5 resR5 res5_eq />.
  do split.
    + rewrite /is16u16 /f32u8_t16u16 res0_eq.
      apply W32u8.allP => />.
    + rewrite /is16u16 /f32u8_t16u16 res3_eq.
      apply W32u8.allP => />.
  move => res0w_eq res3w_eq resL6 resR6 res6_eq_1 res6_eq_2 />.
  do split.
    + rewrite /is16u16 /f32u8_t16u16 res1_eq.
      apply W32u8.allP => />.
    + rewrite /is16u16 /f32u8_t16u16 res4_eq.
      apply W32u8.allP => />.
  move => res1w_eq res4w_eq resL7 resR7 res7_eq_1 res7_eq_2 />.
  do split.
    + rewrite /is16u16 /f32u8_t16u16 res2_eq.
      apply W32u8.allP => />.
    + rewrite /is16u16 /f32u8_t16u16 res5_eq.
      apply W32u8.allP => />.
  move => res2w_eq res5w_eq
          resL8 resR8 res8_eq_1 res8_eq_2 resL9 resR9 res9_eq_1 res9_eq_2 resL10 resR10 res10_eq_1 res10_eq_2
          resL11 resR11 res11_eq_1 res11_eq_2 resL12 resR12 res12_eq_1 res12_eq_2 resL13 resR13 res13_eq_1 res13_eq_2
          resL14 resR14 res14_eq_1 res14_eq_2 resL15 resR15 res15_eq_1 res15_eq_2 resL16 resR16 res16_eq_1 res16_eq_2
          resL17 resR17 res17_eq_1 res17_eq_2 resL18 resR18 res18_eq resL19 resR19 res19_eq resL20 resR20 res20_eq
          resL21 resR21 res21_eq resL22 resR22 res22_eq resL23 resR23 res23_eq resL24 resR24 res24_eq
          resL25 resR25 res25_eq resL26 resR26 res26_eq resL27 resR27 res27_eq resL28 resR28 res28_eq
          resL29 resR29 res29_eq resL30 resR30 res30_eq resL31 resR31 res31_eq resL32 resR32 res32_eq
          resL33 resR33 res33_eq resL34 resR34 res34_eq resL35 resR35 res35_eq resL36 resR36 res36_eq
          resL37 resR37 res37_eq resL38 resR38 res38_eq resL39 resR39 res39_eq />.
  split; last by move : i_lb => /#.
  + apply Array256.ext_eq => k k_i />.
    do (rewrite filliE 1:k_i //= || rewrite initiE 1:k_i //=).
    do (rewrite set_get_def 1:/# 1:k_i || rewrite initiE 1:k_i //=).
    rewrite res39_eq res37_eq res33_eq res32_eq res28_eq res26_eq res22_eq res21_eq.
    do rewrite (mulzDr 16 _ _) -(mulzA 16 _ _) //=.
    do (rewrite pack16bE 1:/# get_of_list 1:/#).
    smt().
  wp; skip; auto => />.
  + rewrite /is16u16 /get256_direct /= => />.
    apply W32u8.allP => />.
qed.

equiv veceq_poly_add2 :
  Mvec.poly_add2 ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_add2: ={rp, bp} ==> ={res}.
proof.
  proc.
  while (={rp, bp, i}).
    inline{1} OpsV.iVPADD_16u16.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.


equiv veceq_poly_sub :
  Mvec.poly_sub ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_sub: ={rp, ap, bp} ==> ={res}.
proof.
  proc.
  while (={rp, ap, bp, i}).
    inline{1} OpsV.iVPSUB_16u16.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.

equiv veceq_poly_csubq :
  Mvec.poly_csubq ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_csubq: ={rp} ==> ={res}.
proof.
  proc.
  while (={rp, i, qx16}).
    inline *.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.

equiv veceq_poly_tomsg :
  Mvec.poly_tomsg_1 ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_tomsg_1: ={rp, a, Glob.mem} ==> ={res}.
proof.
  proc.
  while(={i, rp, a, aux, hq, hhq} /\ 0 <= i{1}).
    inline *.
    wp. skip. auto => />.
    smt().
    wp.
    call veceq_poly_csubq.
    wp. skip. auto => />.
qed.

equiv veceq_poly_frommsg :
  Mvec.poly_frommsg ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_frommsg_1: ={rp, ap} ==> ={res}.
proof.
  proc.
  while (={rp, ap, i, f, shift, idx, hqs, x16p}).
    inline *.
    wp. skip. auto => />.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_red16x:
  Mvec.red16x ~Jkem_avx2.M(Jkem_avx2.Syscall).__red16x: ={r, qx16, vx16} ==> ={res}.
proof.
  proc.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_poly_reduce:
  Mvec.poly_reduce ~Jkem_avx2.M(Jkem_avx2.Syscall).__poly_reduce: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16, vx16}).
    inline *.
    wp. skip. auto => />.
  wp. skip. auto => />.
qed.

equiv veceq_fqmulx16:
  Mvec.fqmulx16 ~Jkem_avx2.M(Jkem_avx2.Syscall).__fqmulx16: ={a, b, qx16, qinvx16} ==> ={res}.
proof.
  proc.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_poly_frommont:
  Mvec.poly_frommont ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_frommont: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16, qinvx16, dmontx16, aux}).
  inline *.
  wp. skip. auto => />.
  wp. skip. auto => />.
qed.

equiv veceq_poly_decompress:
  Mvec.poly_decompress ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_decompress: ={ap, Glob.mem} ==> ={res, Glob.mem}.
proof.
  proc.
  while(={ap, i, aux, q, mask, shift, shufbidx, Glob.mem} /\
        aux{1} = 16 /\ 0 <= i{1} /\ i{1} <= 16 /\
        (forall k, 0 <= k < 16 * i{1} => rp{1}.[k] = rp{2}.[k])).
  inline *.
  wp. skip.  auto => />.
  move => &1 &2 i_lb i_ub rp_l i_tub />.
  do split; first 2 by smt().
  rewrite mulzDr mulz1 => k k_lb k_ub.
    rewrite initiE 1:/# /=.
    rewrite initiE 1:/# /=.
    rewrite set_get_def 1:/# 1:/#.
    rewrite set_get_def 1:/# 1:/#.
    smt().
  inline *.
  wp. skip. auto => />.
  move => &1 &2.
  split.
    + smt().
  move => rpL i rpR i_tlb _ i_lb i_ub rp_l.
  apply Array256.ext_eq.
  move : rp_l.
  have -> //=: i = 16. by move : i_ub i_tlb => /#.
qed.


equiv veceq_poly_compress_1:
  Mvec.poly_compress_1 ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_compress_1: ={rp, a, Glob.mem} ==> ={res, Glob.mem}.
proof.
  proc.
  while(={rp, a, i, aux, v, shift1, mask, shift2, permidx, Glob.mem}).
  inline *.
  wp. skip. auto => />.
  inline OpsV.iVPBROADCAST_16u16.
  wp.
  call veceq_poly_csubq.
  wp. skip. auto => />.
qed.


equiv veceq_poly_compress:
  Mvec.poly_compress ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_compress: ={rp, a, Glob.mem} ==> ={res, Glob.mem}.
proof.
  proc.
  while(={rp, a, i, aux, v, shift1, mask, shift2, permidx, Glob.mem}).
  inline *.
  wp. skip. auto => />.
  inline OpsV.iVPBROADCAST_16u16.
  wp.
  call veceq_poly_csubq.
  wp. skip. auto => />.
qed.

(*
equiv veceq_schoolbook:
  Mvec.schoolbook ~Jkem_avx2.M(Jkem_avx2.Syscall).__schoolbook: ={ap, bp, sign, zeta_0, qx16, qinvx16} ==> ={res}.
proof.
  proc.
  inline *.
  wp; skip; auto => />.
qed.

equiv veceq_poly_basemul:
  Mvec.poly_basemul ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_basemul: ={rp, ap, bp} ==> ={res}.
proof.
  proc.
  inline *.
  wp;skip;auto => />.
qed.
*)
equiv veceq_shuffle8:
  Mvec.shuffle8 ~Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle8: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.

equiv veceq_shuffle4:
  Mvec.shuffle4 ~Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle4: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.

equiv veceq_shuffle2:
  Mvec.shuffle2 ~Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle2: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.

equiv veceq_shuffle1:
  Mvec.shuffle1 ~Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle1: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.

equiv veceq_poly_tobytes:
  Mvec.poly_tobytes ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_tobytes: ={rp, a, Glob.mem} ==> ={Glob.mem, res}.
proof.
  proc.
  while(={rp, a, i, qx16, Glob.mem}).
  inline *; wp. skip. auto => />.
  wp.
  call veceq_poly_csubq.
  wp. skip; auto => />.
qed.

equiv veceq_poly_frombytes:
  Mvec.poly_frombytes ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_frombytes: ={rp, ap, Glob.mem} ==> ={res}.
proof.
  proc.
  while(={rp, ap, i, mask, Glob.mem}).
  inline *; wp. skip. auto => />.
  wp; skip; auto => />.
qed.

equiv prevec_eq_poly_add2:
  Mprevec.poly_add2 ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_add2: ={rp, bp} ==> ={res}.
    transitivity Mvec.poly_add2 (={rp, bp} ==> ={res}) (={rp, bp} ==> ={res}).
smt(). trivial.
apply eq_poly_add2.
apply veceq_poly_add2.
qed.

equiv prevec_eq_poly_sub:
  Mprevec.poly_sub ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_sub: ={rp, ap, bp} ==> ={res}.
    transitivity Mvec.poly_sub (={rp, ap, bp} ==> ={res}) (={rp, ap, bp} ==> ={res}).
smt(). trivial.
apply eq_poly_sub.
apply veceq_poly_sub.
qed.

equiv prevec_eq_poly_csubq:
  Mprevec.poly_csubq ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_csubq: ={rp} ==> ={res}.
    transitivity Mvec.poly_csubq (={rp} ==> ={res}) (={rp} ==> ={res}).
smt(). trivial.
apply eq_poly_csubq.
apply veceq_poly_csubq.
qed.

equiv prevec_eq_poly_tomsg:
  Mprevec.poly_tomsg_1 ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_tomsg_1: ={rp, a} ==> ={res}.
    transitivity Mvec.poly_tomsg_1 (={rp, a} ==> ={res}) (={rp, a, Glob.mem} ==> ={res}).
smt(). trivial.
apply eq_poly_tomsg.
apply veceq_poly_tomsg.
qed.

equiv prevec_eq_poly_frommsg:
  Mprevec.poly_frommsg_1 ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_frommsg_1: ={rp, ap}==> ={res}.
     transitivity Mvec.poly_frommsg (={rp, ap} ==> ={res}) (={rp, ap} ==> ={res}).
smt(). trivial.
apply eq_poly_frommsg.
apply veceq_poly_frommsg.
qed.

equiv prevec_eq_red16x:
  Mprevec.red16x ~Jkem_avx2.M(Jkem_avx2.Syscall).__red16x: is16u16 r{1} r{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2} ==> is16u16 res{1} res{2}.
  transitivity Mvec.red16x (is16u16 r{1} r{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2} ==> is16u16 res{1} res{2})
                           (={r, qx16, vx16} ==> ={res}).
smt(). trivial.
apply eq_red16x.
apply veceq_red16x.
qed.

equiv prevec_eq_poly_reduce:
  Mprevec.poly_reduce ~Jkem_avx2.M(Jkem_avx2.Syscall).__poly_reduce: ={rp} ==> ={res}.
    transitivity Mvec.poly_reduce (={rp} ==> ={res}) (={rp} ==> ={res}).
smt(). trivial.
apply eq_poly_reduce.
apply veceq_poly_reduce.
qed.

equiv prevec_eq_fqmulx16:
  Mprevec.fqmulx16 ~Jkem_avx2.M(Jkem_avx2.Syscall).__fqmulx16: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==> is16u16 res{1} res{2}.
    transitivity Mvec.fqmulx16 (is16u16 a{1} a{2} /\ is16u16 b{1} b{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==> is16u16 res{1} res{2})
                               (={a, b, qx16, qinvx16} ==> ={res}).
smt(). trivial.
apply eq_fqmulx16.
apply veceq_fqmulx16.
qed.

equiv prevec_eq_poly_frommont:
  Mprevec.poly_frommont ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_frommont: ={rp} ==> ={res}.
    transitivity Mvec.poly_frommont (={rp} ==> ={res}) (={rp} ==> ={res}).
smt(). trivial.
apply eq_poly_frommont.
apply veceq_poly_frommont.
qed.

equiv prevec_eq_poly_decompress:
  Mprevec.poly_decompress ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_decompress: ={ap, Glob.mem} ==> ={res, Glob.mem}.
    transitivity Mvec.poly_decompress (={ap, Glob.mem} ==> ={res, Glob.mem}) (={ap, Glob.mem} ==> ={res, Glob.mem}).
smt(). trivial.
apply eq_poly_decompress.
apply veceq_poly_decompress.
qed.

equiv prevec_eq_poly_compress_1:
  Mprevec.poly_compress_1 ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_compress_1: ={rp, a, Glob.mem} ==> ={res,Glob.mem}.
    transitivity Mvec.poly_compress_1 (={rp, a, Glob.mem} ==> ={res, Glob.mem}) (={rp, a, Glob.mem} ==> ={res, Glob.mem}).
smt(). smt().
apply eq_poly_compress_1.
apply veceq_poly_compress_1.
qed.

equiv prevec_eq_poly_compress:
  Mprevec.poly_compress ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_compress: ={rp, a, Glob.mem} ==> ={res,Glob.mem}.
    transitivity Mvec.poly_compress (={rp, a, Glob.mem} ==> ={res, Glob.mem}) (={rp, a, Glob.mem} ==> ={res, Glob.mem}).
smt(). smt().
apply eq_poly_compress.
apply veceq_poly_compress.
qed.

(*
equiv prevec_eq_schoolbook:
  Mprevec.schoolbook ~Jkem_avx2.M(Jkem_avx2.Syscall).__schoolbook: ={ap, bp, sign} /\ is16u16 zeta_0{1} zeta_0{2} /\
                                             is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==>
                                             is16u16 res{1}.`1 res{2}.`1 /\ is16u16 res{1}.`2 res{2}.`2 /\
                                             is16u16 res{1}.`3 res{2}.`3 /\ is16u16 res{1}.`4 res{2}.`4.
proof.
  transitivity Mvec.schoolbook (={ap, bp, sign} /\ is16u16 zeta_0{1} zeta_0{2} /\
                                is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==>
                                is16u16 res{1}.`1 res{2}.`1 /\ is16u16 res{1}.`2 res{2}.`2 /\
                                is16u16 res{1}.`3 res{2}.`3 /\ is16u16 res{1}.`4 res{2}.`4)
                               (={ap, bp, sign, zeta_0, qx16, qinvx16} ==> ={res}).
  smt(). trivial.
  apply eq_schoolbook.
  apply veceq_schoolbook.
qed.
*)

equiv prevec_eq_shuffle8:
  Mprevec.shuffle8 ~Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle8: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                                    is16u16 res{1}.`1 res{2}.`1 /\
                                    is16u16 res{1}.`2 res{2}.`2.
proof.
  transitivity Mvec.shuffle8 (is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                              is16u16 res{1}.`1 res{2}.`1 /\
                              is16u16 res{1}.`2 res{2}.`2)
                             (={a, b} ==> ={res}).
  smt(). trivial.
  apply eq_shuffle8.
  apply veceq_shuffle8.
qed.

equiv prevec_eq_shuffle8_sym :
  Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle8 ~ Mprevec.shuffle8 : is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle8 => />. qed.

equiv prevec_eq_shuffle4:
  Mprevec.shuffle4 ~Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle4: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                                    is16u16 res{1}.`1 res{2}.`1 /\
                                    is16u16 res{1}.`2 res{2}.`2.
proof.
  transitivity Mvec.shuffle4 (is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                              is16u16 res{1}.`1 res{2}.`1 /\
                              is16u16 res{1}.`2 res{2}.`2)
                             (={a, b} ==> ={res}).
  smt(). trivial.
  apply eq_shuffle4.
  apply veceq_shuffle4.
qed.

equiv prevec_eq_shuffle4_sym:
  Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle4 ~ Mprevec.shuffle4: is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle4 => />. qed.

equiv prevec_eq_shuffle2:
  Mprevec.shuffle2 ~Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle2: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                                    is16u16 res{1}.`1 res{2}.`1 /\
                                    is16u16 res{1}.`2 res{2}.`2.
proof.
  transitivity Mvec.shuffle2 (is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                              is16u16 res{1}.`1 res{2}.`1 /\
                              is16u16 res{1}.`2 res{2}.`2)
                             (={a, b} ==> ={res}).
  smt(). trivial.
  apply eq_shuffle2.
  apply veceq_shuffle2.
qed.

equiv prevec_eq_shuffle2_sym:
  Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle2 ~ Mprevec.shuffle2 : is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle2 => />. qed.

equiv prevec_eq_shuffle1:
  Mprevec.shuffle1 ~Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle1: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                                    is16u16 res{1}.`1 res{2}.`1 /\
                                    is16u16 res{1}.`2 res{2}.`2.
proof.
  transitivity Mvec.shuffle1 (is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
                              is16u16 res{1}.`1 res{2}.`1 /\
                              is16u16 res{1}.`2 res{2}.`2)
                             (={a, b} ==> ={res}).
  smt(). trivial.
  apply eq_shuffle1.
  apply veceq_shuffle1.
qed.

equiv prevec_eq_shuffle1_sym:
  Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle1 ~ Mprevec.shuffle1 : is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle1 => />. qed.

require import NTT_avx2 NTT_AVX_j.
require import MLKEM_Poly_avx2_proof.

lemma list_arr16 (x:'a Array16.t):
  [x.[0];x.[1];x.[2];x.[3];x.[4];x.[5];x.[6];x.[7];x.[8];x.[9];x.[10];x.[11];x.[12];x.[13];x.[14];x.[15]] = to_list x.
rewrite /to_list /mkseq -iotaredE => />. qed.

lemma avx2_shuffle8_corr_h (_a _b : t16u16) :
      hoare[ Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle8 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf8 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf8 _a _b).`2 res.`2].
conseq prevec_eq_shuffle8_sym (MLKEM_PolyAVX.shuffle8_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

lemma avx2_shuffle8_corr (_a _b : t16u16) :
      phoare[ Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle8 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf8 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf8 _a _b).`2 res.`2] = 1%r.
conseq __shuffle8_ll (avx2_shuffle8_corr_h _a _b) => />. qed.

lemma avx2_shuffle4_corr_h (_a _b : t16u16) :
      hoare[ Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle4 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf4 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf4 _a _b).`2 res.`2].
conseq prevec_eq_shuffle4_sym (MLKEM_PolyAVX.shuffle4_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

lemma avx2_shuffle4_corr (_a _b : t16u16) :
      phoare[ Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle4 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf4 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf4 _a _b).`2 res.`2] = 1%r.
conseq __shuffle4_ll (avx2_shuffle4_corr_h _a _b) => />. qed.

lemma avx2_shuffle2_corr_h (_a _b : t16u16) :
      hoare[ Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle2 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf2 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf2 _a _b).`2 res.`2].
conseq prevec_eq_shuffle2_sym (MLKEM_PolyAVX.shuffle2_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

lemma avx2_shuffle2_corr (_a _b : t16u16) :
      phoare[ Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle2 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf2 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf2 _a _b).`2 res.`2] = 1%r.
conseq __shuffle2_ll (avx2_shuffle2_corr_h _a _b) => />. qed.

lemma avx2_shuffle1_corr_h (_a _b : t16u16) :
      hoare[ Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle1 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf1 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf1 _a _b).`2 res.`2].
conseq prevec_eq_shuffle1_sym (MLKEM_PolyAVX.shuffle1_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

lemma avx2_shuffle1_corr (_a _b : t16u16) :
      phoare[ Jkem_avx2.M(Jkem_avx2.Syscall).__shuffle1 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf1 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf1 _a _b).`2 res.`2] = 1%r.
conseq __shuffle1_ll (avx2_shuffle1_corr_h _a _b) => />. qed.

equiv prevec_eq_poly_tobytes:
  Mprevec.poly_tobytes ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_tobytes: ={rp, a, Glob.mem} ==> ={Glob.mem, res}.
proof.
  transitivity Mvec.poly_tobytes (={rp, a, Glob.mem} ==> ={Glob.mem, res})
                                 (={rp, a, Glob.mem} ==> ={Glob.mem,res}).
  smt(). trivial.
  apply eq_poly_tobytes.
  apply veceq_poly_tobytes.
qed.

equiv prevec_eq_poly_frombytes:
  Mprevec.poly_frombytes ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_frombytes: ={rp, ap, Glob.mem} ==> ={res}.
proof.
  transitivity Mvec.poly_frombytes (={rp, ap, Glob.mem} ==> ={res})
                                 (={rp, ap, Glob.mem} ==> ={res}).
  smt(). trivial.
  apply eq_poly_frombytes.
  apply veceq_poly_frombytes.
qed.

equiv eq_basemulred:
  Mprevec.basemul_red ~ Mvec.basemul_red: 
   is16u16 a0{1} a0{2} /\ is16u16 a1{1} a1{2} /\
   is16u16 b0{1} b0{2} /\ is16u16 b1{1} b1{2} /\
   is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==> 
   is16u16 res.`1{1} res.`1{2} /\ is16u16 res.`2{1} res.`2{2}
.
proc.
call eq_iVPSUB_16u16.
call eq_iVPSUB_16u16.
call eq_iVPMULH_256.
call eq_iVPMULH_256.
call eq_iVPMULL_16u16.
call eq_iVPMULL_16u16.
call eq_iVPACKUS_8u32.
call eq_iVPACKUS_8u32.
call eq_iVPSRL_8u32.
call eq_iVPSRL_8u32.
conseq />. smt().
wp.
call eq_iVPBLEND_16u16.
call eq_iVPBLEND_16u16.
call eq_iVPACKUS_8u32.
call eq_iVPACKUS_8u32.
call eq_iVPSRL_8u32.
call eq_iVPSRL_8u32.
conseq />. smt().
wp.
call eq_iVPBLEND_16u16.
call eq_iVPBLEND_16u16.
auto => />.
move => &1 &2 ??????. do split.
+ by rewrite /is16u16 /lift2poly !initiE //= pack16_bits16 /=.
move => H rl rr H0 rl0 rr0 H1; do split.
+ by rewrite /is8u32 /f16u16_t8u32 !initiE //= pack16_bits16 /=.
move => H2 rl1 rr1 H3. do split.
+ by rewrite /is8u32 /f16u16_t8u32 !initiE //= pack16_bits16 /=.
move => H4 rl2 rr2 H5. do split.
+ by rewrite /is8u32 /f16u16_t8u32 !initiE //= pack16_bits16 /=.
+ by rewrite /is8u32 /f16u16_t8u32 !initiE //= pack16_bits16 /=.
move => H6 H7 rl3 rr3 H8 H9 H10 H11 rl4 rr4 H12 rl5 rr5 H13. do split.
+ by rewrite /is8u32 /f16u16_t8u32 !initiE //= pack16_bits16 /=.
move => *. do split.
+ by rewrite /is8u32 /f16u16_t8u32 !initiE //= pack16_bits16 /=.
move => *. do split.
+ by rewrite /is8u32 /f16u16_t8u32 !initiE //= pack16_bits16 /=.
by rewrite /is8u32 /f16u16_t8u32 !initiE //= pack16_bits16 /=.
qed.

lemma set_get_def128 (v : W16.t Array64.t) (w: W256.t) i j :
    0 <= i < 4 => 0 <= j < 64 =>
    WArray128.get16
    (WArray128.set256 (WArray128.init16 (fun i => v.[i])) i w) j =
      if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16)
      else v.[j].
proof. 
  move => hx hs; rewrite set256E !get16E.
  rewrite -(W2u8.unpack8K (if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16) else v.[j])); congr.
  apply W2u8.Pack.ext_eq => k hk.
  rewrite W2u8.get_unpack8 //= W2u8.Pack.initiE 1:/# /=.
  rewrite initiE /=. move : hk hs => /#.
  rewrite initiE /=. move : hk hs => /#.
  have ->: (32 * i <= 2 * j + k < 32 * i + 32) = (16 * i <= j < 16 * i + 16) by smt().
  case : (16 * i <= j < 16 * i + 16) => h.     
    + by rewrite W256_bits16_bits8 1:// /#.
    + by rewrite /init16 /#.
qed.

lemma set_get_eq128 (v: W16.t Array64.t) (w: W256.t) i j:
    0 <= i < 4 => 0 <= j < 64 => 16 * i <= j < 16 * i + 16 =>
    WArray128.get16
    (WArray128.set256 (WArray128.init16 (fun i => v.[i])) i w) j =
      w \bits16 j %% 16.
proof. 
  by move => h1 h2 h3; rewrite set_get_def128 // h3.
qed.

lemma set_get_diff128 (v: W16.t Array64.t) (w: W256.t) i j:
    0 <= i < 4 => 0 <= j < 64 => !(16 * i <= j < 16 * i + 16) =>
    WArray128.get16
    (WArray128.set256 (WArray128.init16 (fun i => v.[i])) i w) j =
      v.[j].
proof.
  move => h1 h2 h3; rewrite set_get_def128 // h3. auto.
qed.

lemma get_set_get_eqb128 (v: W16.t Array64.t) (w: W256.t) i:
  0 <= i < 4 => forall k, 0 <= k < i*16 =>
  v.[k] = (Array256.init (WArray128.get16 (WArray128.set256 (WArray128.init16 (fun j => v.[j])) i w))).[k].
proof. 
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i. smt().
  simplify.
  rewrite set_get_def128 => /#.
qed.

lemma get_set_get_eqa128 (v: W16.t Array64.t) (w: W256.t) i:
  0 <= i < 4 => forall k, i*16 + 16 <= k < 64 =>
  v.[k] = (Array256.init (WArray128.get16 (WArray128.set256 (WArray128.init16 (fun j => v.[j])) i w))).[k].
proof.
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i => /#.
  simplify.
  rewrite set_get_def128 => /#.
qed.

lemma get_set_get_diff128 (v: W16.t Array64.t) (w: vt16u16) i:
  0 <= i < 4 => forall k, i*16 <= k < i*16 + 16 =>
  w \bits16 (k%%16) = (Array256.init (WArray128.get16 (WArray128.set256 (WArray128.init16 (fun j => v.[j])) i w))).[k].
proof. 
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i => /#.
  simplify.
  rewrite set_get_def128 => /#.
qed.

equiv eq_basemul32x :
  Mprevec.basemul32x ~ Mvec.basemul32x : 
     ={ap,bp} /\
      qx16{1} = lift2poly qx16{2} /\
      qinvx16{1} = lift2poly qinvx16{2} /\
      zeta_0{1} = lift2poly zeta_0{2} ==> ={res}.
proc.
wp;call eq_basemulred.
wp;call eq_schoolbook.
wp;call eq_basemulred.
wp;call eq_schoolbook.
auto => />.
move => &1 &2; do split. 
+ by rewrite /is16u16 /lift2poly !initiE //= pack16_bits16 /=.
+ by rewrite /is16u16 /lift2poly !initiE //= pack16_bits16 /=.
+ by rewrite /is16u16 /lift2poly !initiE //= pack16_bits16 /=.
move => ??? rl rr ???? rrl rrr Hrr0 Hrr1 r0l r0r ???? r1l r1r H11 H12. 
rewrite /fill tP => k kb.
rewrite !initiE //.
case (48 <= k && k < 64).
+ move => *. have -> : 96 = 32*3 by auto.
  rewrite  set_get_eq128 //= ifT //. 
  move : H12;rewrite /is16u16 => -> /=. 
  rewrite pack16bE /=. smt(). 
  rewrite of_listE initiE //= /#. 
move => *. rewrite ifF //.
rewrite !initiE //=.
case (32 <= k && k < 48).
+ move => *. have -> : 96 = 32*3 by auto.
  rewrite  set_get_diff128 //=. 
  rewrite !initiE //=.
  have -> : 64 = 32*2 by auto.
  rewrite  set_get_eq128 //=. 
  move : H11;rewrite /is16u16 => -> /=. 
  rewrite pack16bE /=. smt(). 
  rewrite of_listE initiE //= /#. 
move => *. 
rewrite !initiE //=.
case (16 <= k && k < 32).
+ move => *. have -> : 96 = 32*3 by auto.
  rewrite  set_get_diff128 //=. 
  rewrite !initiE //=.
  have -> : 64 = 32*2 by auto.
  rewrite  set_get_diff128 //=. 
  rewrite !initiE //=.
  have -> : 32 = 32*1 by auto.
  rewrite  set_get_eq128 //=. 
  move : Hrr1;rewrite /is16u16 => -> /=. 
  rewrite pack16bE /=. smt(). 
  rewrite of_listE initiE //= /#. 
move => *. 
rewrite !initiE //= ifT 1:/#.
move => *. have -> : 96 = 32*3 by auto.
rewrite  set_get_diff128 //=. 
rewrite !initiE //=.
have -> : 64 = 32*2 by auto.
rewrite  set_get_diff128 //=. 
rewrite !initiE //=.
have -> : 32 = 32*1 by auto.
rewrite  set_get_diff128 //=. 
rewrite !initiE //=.
have -> : 0 = 32*0 by auto.
rewrite  set_get_eq128 //=. smt().
move : Hrr0;rewrite /is16u16 => -> /=. 
rewrite pack16bE /=. smt(). 
rewrite of_listE initiE //= /#. 
qed.

equiv eq_poly_basemul:
  Mprevec.poly_basemul ~ Mvec.poly_basemul: ={ap, bp} ==> ={res}.
proc. 
wp. call eq_basemul32x.
wp;call eq_basemul32x.
wp;call eq_basemul32x.
wp;call eq_basemul32x.
auto => />.
move => &1 &2 r r0 r1 r2.
rewrite /fill tP /= => k kb.
rewrite !initiE //=.
case (192 <= k && k < 256); 1: by smt().
move => *.
rewrite !initiE //=.
case (128 <= k && k < 192); 1: by smt().
move => *.
rewrite !initiE //=.
case (64 <= k && k < 128); 1: by smt().
rewrite !initiE //= /#.
qed.

(*
equiv prevec_eq_poly_basemul:
  Mprevec.poly_basemul ~Jkem_avx2.M(Jkem_avx2.Syscall)._poly_basemul: ={ap, bp} ==> ={res}.
transitivity Mvec.poly_basemul (={ap,bp} ==> ={res})
                               (={rp,ap,bp} ==> ={res}).
  smt(). trivial.
  apply eq_poly_basemul.
  apply veceq_poly_basemul.
qed.
*)


end MLKEM_PolyAVXVec.
