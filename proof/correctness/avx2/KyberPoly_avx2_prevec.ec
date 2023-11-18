require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel JMemory JWord.
require import Array400 Array256 Array128 Array64 Array32 Array16 Array8 Array4 Array2.
require import WArray800 WArray512 WArray128 WArray128 WArray64 WArray32 WArray16.
require import AVX2_Ops.
require import Jkem_avx2.

require import Kyber_AVX_AuxLemmas.

module Mprevec = {
  proc shuffle8 (a:t16u16, b:t16u16) : t16u16 * t16u16 = {
    
    var r0:t16u16;
    var r1:t16u16;
    
    r0 <@ Ops.iVPERM2I128_16u16(a, b, (W8.of_int 32));
    r1 <@ Ops.iVPERM2I128_16u16(a, b, (W8.of_int 49));

    return (r0, r1);
  }
  
  proc shuffle4 (a:t16u16, b:t16u16) : t16u16 * t16u16 = {
    
    var r0:t16u16;
    var r1:t16u16;
    
    r0 <@ Ops.iVPUNPCKL_4u64_16u16(a, b);
    r1 <@ Ops.iVPUNPCKH_4u64_16u16(a, b);

    return (r0, r1);
  }
  
  proc shuffle2 (a:t16u16, b:t16u16) : t16u16 * t16u16 = {
    
    var t0:t16u16;
    var t1:t16u16;
    var a_q: t4u64;
    
    t0  <@ Ops.iVMOVSLDUP_256_16u16(b);
    t0  <@ Ops.iVPBLEND_8u32_16u16(a, t0, (W8.of_int 170));
    a_q <- f16u16_t4u64 a;
    a_q <@ Ops.iVPSRL_4u64(a_q, (W8.of_int 32));
    a <- f4u64_t16u16 a_q;
    t1 <@ Ops.iVPBLEND_8u32_16u16(a, b, (W8.of_int 170));
    return (t0, t1);
  }
  
  proc shuffle1 (a:t16u16, b:t16u16) : t16u16 * t16u16 = {
    
    var r0:t16u16;
    var r1:t16u16;
    var t0:t16u16;
    var t1:t16u16;
    var t0_d:t8u32;
    var t1_d:t8u32;
    var a_d:t8u32;
    var b_d:t8u32;

    b_d <- f16u16_t8u32 b;
    t0_d <@ Ops.iVPSLL_8u32(b_d, (W8.of_int 16));
    t0 <- f8u32_t16u16 t0_d;
    r0 <@ Ops.iVPBLEND_16u16(a, t0, (W8.of_int 170));
    a_d <- f16u16_t8u32 a;
    t1_d <@ Ops.iVPSRL_8u32(a_d, (W8.of_int 16));
    t1 <- f8u32_t16u16 t1_d;
    r1 <@ Ops.iVPBLEND_16u16(t1, b, (W8.of_int 170));

    return (r0, r1);
  }

  proc poly_add2(rp:W16.t Array256.t, bp:W16.t Array256.t) : W16.t Array256.t = {
    var i:int;
    var a:W16.t Array16.t;
    var b:W16.t Array16.t;
    var r:W16.t Array16.t;

    i <- 0;

    while (i < 16) {
      a <- lift2poly(get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));
      b <- lift2poly(get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * i));

      r <@ Ops.iVPADD_16u16(a, b);

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

      r <@ Ops.iVPSUB_16u16(a, b);

      rp <- fill (fun k => r.[k %% 16]) (16*i) 16 rp;

      i <- i + 1;
    }

    return (rp);
  }

  proc csubq (r:t16u16, qx16:t16u16) : t16u16 = {
    var t:t16u16;

    r <@ Ops.iVPSUB_16u16(r, qx16);
    t <@ Ops.iVPSRA_16u16(r, (W8.of_int 15));
    t <@ Ops.iVPAND_16u16(t,qx16);
    r <@ Ops.iVPADD_16u16(t, r);

    return r;
  }

  proc poly_csubq (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var qx16:W256.t;
    var _qx16: W16.t Array16.t;
    var i:int;
    var r:W256.t;
    var _r: W16.t Array16.t;
    var t: W16.t Array16.t;

    qx16 <- (get256 (WArray32.init16 (fun i => jqx16.[i])) 0);
    _qx16 <- lift2poly(qx16);
    i <- 0;
    while (i < 16) {
      r <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));

      _r <- lift2poly(r);

      _r <@ Ops.iVPSUB_16u16(_r, _qx16);
      t <@ Ops.iVPSRA_16u16(_r, (W8.of_int 15));
      t <@ Ops.iVPAND_16u16(t, _qx16);
      _r <@ Ops.iVPADD_16u16(t, _r);

      rp <- fill (fun k => _r.[k %% 16]) (16*i) 16 rp;

      i <- i + 1;
    }
    return (rp);
  }

  proc fqmulx16 (a b qx16 qinvx16: W16.t Array16.t) : W16.t Array16.t = {

    var rd:W16.t Array16.t;
    var rhi:W16.t Array16.t;
    var rlo:W16.t Array16.t;

    rhi <@ Ops.iVPMULH_256(a, b);
    rlo <@ Ops.iVPMULL_16u16(a, b);
    rlo <@ Ops.iVPMULL_16u16(rlo, qinvx16);
    rlo <@ Ops.iVPMULH_256(rlo, qx16);
    rd <@  Ops.iVPSUB_16u16(rhi, rlo);
    return (rd);
  }

  (*--------------------------------------------------------------------*)
  proc poly_tomsg_1 (rp:W8.t Array32.t,  a:W16.t Array256.t) : W8.t Array32.t * W16.t Array256.t = {
    var aux: int;

    var hq:W16.t Array16.t;
    var hhq:W16.t Array16.t;
    var i:int;

    var f0: t16u16;
    var f0_b: t32u8;

    var f1:W16.t Array16.t;
    var g0:W16.t Array16.t;
    var g1:W16.t Array16.t;
    var c:W32.t;

    a <@ poly_csubq (a);
    hq <- Array16.init (fun i => hqx16_m1.[i]);
    hhq <- Array16.init (fun i => hhqx16.[i]);
    aux <- (256 %/ 32);

    i <- 0;
    while (i < aux) {
      f0 <- Array16.init(fun j => a.[32*i+j]);
      f1 <- Array16.init(fun j => a.[32*i+16+j]);
      f0 <@ Ops.iVPSUB_16u16(hq, f0);
      f1 <@ Ops.iVPSUB_16u16(hq, f1);
      g0 <@ Ops.iVPSRA_16u16(f0, (W8.of_int 15));
      g1 <@ Ops.iVPSRA_16u16(f1, (W8.of_int 15));
      f0 <@ Ops.iVPXOR_16u16(f0, g0);
      f1 <@ Ops.iVPXOR_16u16(f1, g1);
      f0 <@ Ops.iVPSUB_16u16(f0, hhq);
      f1 <@ Ops.iVPSUB_16u16(f1, hhq);
      f0_b <@ Ops.iVPACKSS_16u16(f0, f1);

      f0_b <@ Ops.iVPERMQ_32u8(f0_b, (W8.of_int 216));

      c <@ Ops.iVPMOVMSKB_u256u32(f0_b);

      rp <-
      Array32.init
      (WArray32.get8 (WArray32.set32 (WArray32.init8 (fun i_0 => rp.[i_0])) i (c)));

      i <- i + 1;
    }
    return (rp,a);
  }


  proc poly_frommsg_1(rp:W16.t Array256.t, ap:W8.t Array32.t): W16.t Array256.t = {
    var aux: int;

    var hqs: t16u16;
    var shift: t8u32;
    var idx: t32u8;
    var f;
    var i:int;
    var g3: t16u16;
    var g0: t16u16;
    var g1: t16u16;
    var g2: t16u16;
    var h0: t16u16;
    var h2: t16u16;
    var h1: t16u16;
    var h3: t16u16;

    var g3_dw: t8u32;
    var g3_b: t32u8;


    hqs <- Array16.init (fun i => hqx16_p1.[i]);
    shift <@
    Ops.iVPBROADCAST_2u128_8u32(Array4.init (fun i => pfm_shift_s.[i]));
    idx <@ Ops.iVPBROADCAST_2u128_32u8(Array16.init (fun i => pfm_idx_s.[i]));
    f <- Array8.init (fun i => pack4_t (W4u8.Pack.init (fun j => ap.[4*i+j])));
    i <- 0;

    while (i < 4) {
      g3_dw <@ Ops.iVPSHUFD_256(f, W8.of_int (85 * i));
      g3_dw <@ Ops.iVPSLLV_8u32(g3_dw, shift);

      g3_b <- f8u32_t32u8 g3_dw;
      g3_b <@ Ops.iVPSHUFB_256(g3_b, idx);
      g3 <- f32u8_t16u16 g3_b;

      g0 <@ Ops.iVPSLL_16u16(g3, (W8.of_int 12));
      g1 <@ Ops.iVPSLL_16u16(g3, (W8.of_int 8));
      g2 <@ Ops.iVPSLL_16u16(g3, (W8.of_int 4));
      g0 <@ Ops.iVPSRA_16u16(g0, (W8.of_int 15));
      g1 <@ Ops.iVPSRA_16u16(g1, (W8.of_int 15));
      g2 <@ Ops.iVPSRA_16u16(g2, (W8.of_int 15));
      g3 <@ Ops.iVPSRA_16u16(g3, (W8.of_int 15));

      g0 <@ Ops.iVPAND_16u16(g0, hqs);
      g1 <@ Ops.iVPAND_16u16(g1, hqs);
      g2 <@ Ops.iVPAND_16u16(g2, hqs);
      g3 <@ Ops.iVPAND_16u16(g3, hqs);

      h0 <@ Ops.iVPUNPCKL_4u64_16u16(g0, g1);
      h2 <@ Ops.iVPUNPCKH_4u64_16u16(g0, g1);
      h1 <@ Ops.iVPUNPCKL_4u64_16u16(g2, g3);
      h3 <@ Ops.iVPUNPCKH_4u64_16u16(g2, g3);
      g0 <@ Ops.iVPERM2I128_16u16(h0, h1, (W8.of_int 32));
      g2 <@ Ops.iVPERM2I128_16u16(h0, h1, (W8.of_int 49));
      g1 <@ Ops.iVPERM2I128_16u16(h2, h3, (W8.of_int 32));
      g3 <@ Ops.iVPERM2I128_16u16(h2, h3, (W8.of_int 49));

      rp <- fill (fun k => g0.[k %% 16]) (32*i) 16 rp;
      rp <- fill (fun k => g1.[k %% 16]) (32*i + 16) 16 rp;
      rp <- fill (fun k => g2.[k %% 16]) (128 + 32*i) 16 rp;
      rp <- fill (fun k => g3.[k %% 16]) (128 + 32*i + 16) 16 rp;

      i <- i + 1;
    }

    return rp;
  }

  (*--------------------------------------------------------------------*)

  proc red16x (r:W16.t Array16.t, qx16:W16.t Array16.t, vx16:W16.t Array16.t) : W16.t Array16.t = {
    var x:W16.t Array16.t;

    x <@ Ops.iVPMULH_256(r, vx16);
    x <@ Ops.iVPSRA_16u16(x, (W8.of_int 10));
    x <@ Ops.iVPMULL_16u16(x, qx16);
    r <@ Ops.iVPSUB_16u16(r, x);

    return (r);
  }

  proc poly_reduce (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var qx16:W16.t Array16.t;
    var vx16:W16.t Array16.t;
    var i:int;
    var r:W16.t Array16.t;

    qx16 <- lift2poly (get256 (WArray32.init16 (fun i => jqx16.[i])) 0);
    vx16 <- lift2poly (get256 (WArray32.init16 (fun i => jvx16.[i])) 0);
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

    var x0_dw:t8u32;
    var x1_dw:t8u32;
    var y0_dw:t8u32;
    var y1_dw:t8u32;
    var bc0_dw:t8u32;
    var bc1_dw:t8u32;
    var ad0_dw:t8u32;
    var ad1_dw:t8u32;
    var ac0_dw: t8u32;
    var ac1_dw: t8u32;
    var rbd0_dw: t8u32;
    var rbd1_dw: t8u32;


    b <- Array16.init (fun i => ap.[16 + i]);
    d <- Array16.init (fun i => bp.[16 + i]);
    a <- Array16.init (fun i => ap.[i]);
    c <- Array16.init (fun i => bp.[i]);
    bdlo <@ Ops.iVPMULL_16u16(b, d);
    bdhi <@ Ops.iVPMULH_256(b, d);
    bclo <@ Ops.iVPMULL_16u16(b, c);
    bchi <@ Ops.iVPMULH_256(b, c);
    adlo <@ Ops.iVPMULL_16u16(a, d);
    adhi <@ Ops.iVPMULH_256(a, d);
    aclo <@ Ops.iVPMULL_16u16(a, c);
    achi <@ Ops.iVPMULH_256(a, c);
    bdlo <@ Ops.iVPMULL_16u16(bdlo, qinvx16);
    bdlo <@ Ops.iVPMULH_256(bdlo, qx16);
    bd <@ Ops.iVPSUB_16u16(bdhi, bdlo);
    rbdlo <@ Ops.iVPMULL_16u16(zeta_0, bd);
    rbdhi <@ Ops.iVPMULH_256(zeta_0, bd);
    bc0 <@ Ops.iVPUNPCKL_16u16(bclo, bchi);
    bc1 <@ Ops.iVPUNPCKH_16u16(bclo, bchi);
    ad0 <@ Ops.iVPUNPCKL_16u16(adlo, adhi);
    ad1 <@ Ops.iVPUNPCKH_16u16(adlo, adhi);
    ac0 <@ Ops.iVPUNPCKL_16u16(aclo, achi);
    ac1 <@ Ops.iVPUNPCKH_16u16(aclo, achi);
    rbd0 <@ Ops.iVPUNPCKL_16u16(rbdlo, rbdhi);
    rbd1 <@ Ops.iVPUNPCKH_16u16(rbdlo, rbdhi);

    ac0_dw <- f16u16_t8u32 ac0;
    rbd0_dw <- f16u16_t8u32 rbd0;

    ac1_dw <- f16u16_t8u32 ac1;
    rbd1_dw <- f16u16_t8u32 rbd1;

    bc0_dw <- f16u16_t8u32 bc0;
    bc1_dw <- f16u16_t8u32 bc1;
    ad0_dw <- f16u16_t8u32 ad0;
    ad1_dw <- f16u16_t8u32 ad1;

    if ((sign = 0)) {
      x0_dw <@ Ops.iVPADD_8u32(ac0_dw, rbd0_dw);
      x1_dw <@ Ops.iVPADD_8u32(ac1_dw, rbd1_dw);
    } else {
      x0_dw <@ Ops.iVPSUB_8u32(ac0_dw, rbd0_dw);
      x1_dw <@ Ops.iVPSUB_8u32(ac1_dw, rbd1_dw);
    }
    y0_dw <@ Ops.iVPADD_8u32(bc0_dw, ad0_dw);
    y1_dw <@ Ops.iVPADD_8u32(bc1_dw, ad1_dw);

    x0 <- f8u32_t16u16 x0_dw;
    x1 <- f8u32_t16u16 x1_dw;
    y0 <- f8u32_t16u16 y0_dw;
    y1 <- f8u32_t16u16 y1_dw;

    return (x0, x1, y0, y1);
  }

  proc basemul_red (a0:t16u16, a1:t16u16, b0:t16u16, b1:t16u16, qx16:t16u16,
                    qinvx16:t16u16) : t16u16 * t16u16 = {

    var zero:t16u16;
    var y:t16u16;
    var z:t16u16;
    var x:t16u16;

    var a0_dw: t8u32;
    var a1_dw: t8u32;
    var b0_dw: t8u32;
    var b1_dw: t8u32;
    var y_dw: t8u32;
    var z_dw: t8u32;
    var x_dw: t8u32;

    zero <- lift2poly(W256.zero);
    y <@ Ops.iVPBLEND_16u16(a0, zero, (W8.of_int 170));
    z <@ Ops.iVPBLEND_16u16(a1, zero, (W8.of_int 170));

    a0_dw <- f16u16_t8u32 a0;
    a1_dw <- f16u16_t8u32 a1;
    z_dw <- f16u16_t8u32 z;
    y_dw <- f16u16_t8u32 y;

    a0_dw <@ Ops.iVPSRL_8u32(a0_dw, (W8.of_int 16));
    a1_dw <@ Ops.iVPSRL_8u32(a1_dw, (W8.of_int 16));
    z <@ Ops.iVPACKUS_8u32(y_dw, z_dw);
    a0 <@ Ops.iVPACKUS_8u32(a0_dw, a1_dw);

    y <@ Ops.iVPBLEND_16u16(b0, zero, (W8.of_int 170));
    x <@ Ops.iVPBLEND_16u16(b1, zero, (W8.of_int 170));

    b0_dw <- f16u16_t8u32 b0;
    b1_dw <- f16u16_t8u32 b1;
    x_dw <- f16u16_t8u32 x;
    y_dw <- f16u16_t8u32 y;

    b0_dw <@ Ops.iVPSRL_8u32(b0_dw, (W8.of_int 16));
    b1_dw <@ Ops.iVPSRL_8u32(b1_dw, (W8.of_int 16));
    y <@ Ops.iVPACKUS_8u32(y_dw, x_dw);
    b0 <@ Ops.iVPACKUS_8u32(b0_dw, b1_dw);

    z <@ Ops.iVPMULL_16u16(z, qinvx16);
    y <@ Ops.iVPMULL_16u16(y, qinvx16);
    z <@ Ops.iVPMULH_256(z, qx16);
    y <@ Ops.iVPMULH_256(y, qx16);
    a0 <@ Ops.iVPSUB_16u16(a0, z);
    b0 <@ Ops.iVPSUB_16u16(b0, y);
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

  (*--------------------------------------------------------------------*)
  proc poly_decompress (rp:W16.t Array256.t, ap:W64.t) : W16.t Array256.t = {
    var aux: int;

    var q:t16u16;
    var shufbidx:t32u8;
    var mask_d: t8u32;
    var mask:t16u16;
    var shift_d: t8u32;
    var shift:t16u16;
    var f_b:t32u8;
    var f:t16u16;
    var t:t16u8;
    var i:int;

    q <- Array16.init (fun i => jqx16.[i]);

    shufbidx <- Array32.init (fun i => pd_jshufbidx.[i]);

    mask_d <@ Ops.iVPBROADCAST_8u32(pd_mask_s);
    mask <- f8u32_t16u16 mask_d;

    shift_d <@ Ops.iVPBROADCAST_8u32(pd_shift_s);
    shift <- f8u32_t16u16 shift_d;

    aux <- (256 %/ 16);
    i <- 0;

    while (i < aux) {
      t <@ Ops.iload16u8(Glob.mem, ap + (W64.of_int (8  * i)));
      f_b <@ Ops.iVPBROADCAST_2u128_32u8(t);
      f_b <@ Ops.iVPSHUFB_256(f_b, shufbidx);

      f <- f32u8_t16u16 f_b;
      f <@ Ops.iVPAND_16u16(f, mask);

      f <@ Ops.iVPMULL_16u16(f, shift);
      f <@ Ops.iVPMULHRS_256(f, q);

      rp <- fill (fun k => f.[k %% 16]) (16*i) 16 rp;
      i <- i + 1;
    }

    return (rp);
  }

  (*--------------------------------------------------------------------*)
  proc poly_compress_1 (rp:W8.t Array128.t, a:W16.t Array256.t) : W8.t Array128.t *
                                                                   W16.t Array256.t = {
    var aux: int;

    var v: t16u16;
    var shift1: t16u16;
    var mask: t16u16;
    var shift2: t16u16;
    var permidx: t8u32;
    var i: int;
    var f0: t16u16;
    var f1: t16u16;
    var f2: t16u16;
    var f3: t16u16;

    var f0_dw: t8u32;
    var f0_b: t32u8;
    var f2_b: t32u8;
    var shift2_b: t32u8;


    a <@ poly_csubq (a);

    v <- Array16.init (fun i => jvx16.[i]);
    shift1 <@ Ops.iVPBROADCAST_16u16(pc_shift1_s);
    mask <@ Ops.iVPBROADCAST_16u16(pc_mask_s);
    shift2 <@ Ops.iVPBROADCAST_16u16(pc_shift2_s);
    shift2_b <- f16u16_t32u8 shift2; (* FIXME: specific AVX2 op maybe ?? *)
    permidx <- Array8.init (fun i => pc_permidx_s.[i]);

    aux <- (256 %/ 64);
    i <- 0;

    while (i < aux) {
      f0 <- Array16.init (fun j => a.[64*i+j]);
      f1 <- Array16.init (fun j => a.[64*i+16+j]);
      f2 <- Array16.init (fun j => a.[64*i+32+j]);
      f3 <- Array16.init (fun j => a.[64*i+48+j]);
      f0 <@ Ops.iVPMULH_256(f0, v);
      f1 <@ Ops.iVPMULH_256(f1, v);
      f2 <@ Ops.iVPMULH_256(f2, v);
      f3 <@ Ops.iVPMULH_256(f3, v);
      f0 <@ Ops.iVPMULHRS_256(f0, shift1);
      f1 <@ Ops.iVPMULHRS_256(f1, shift1);
      f2 <@ Ops.iVPMULHRS_256(f2, shift1);
      f3 <@ Ops.iVPMULHRS_256(f3, shift1);
      f0 <@ Ops.iVPAND_16u16(f0, mask);
      f1 <@ Ops.iVPAND_16u16(f1, mask);
      f2 <@ Ops.iVPAND_16u16(f2, mask);
      f3 <@ Ops.iVPAND_16u16(f3, mask);

      f0_b <@ Ops.iVPACKUS_16u16(f0, f1);
      f2_b <@ Ops.iVPACKUS_16u16(f2, f3);
      f0 <@ Ops.iVPMADDUBSW_256(f0_b, shift2_b);
      f2 <@ Ops.iVPMADDUBSW_256(f2_b, shift2_b);
      f0_b <@ Ops.iVPACKUS_16u16(f0, f2);

      f0_dw <- f32u8_t8u32 f0_b;
      f0_dw <@ Ops.iVPERMD(permidx, f0_dw);
      f0_b <- f8u32_t32u8 f0_dw;

      rp <- Array128.fill (fun k => f0_b.[k %% 32]) (32*i) 32 rp;

      i <- i + 1;
    }
    return (rp, a);
  }

  proc poly_compress (rp:W64.t, a:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var v: t16u16;
    var shift1: t16u16;
    var mask: t16u16;
    var shift2: t16u16;
    var permidx: t8u32;
    var i: int;
    var f0: t16u16;
    var f1: t16u16;
    var f2: t16u16;
    var f3: t16u16;

    var f0_dw: t8u32;
    var f0_b: t32u8;
    var f2_b: t32u8;
    var shift2_b: t32u8;


    a <@ poly_csubq (a);

    v <- Array16.init (fun i => jvx16.[i]);
    shift1 <@ Ops.iVPBROADCAST_16u16(pc_shift1_s);
    mask <@ Ops.iVPBROADCAST_16u16(pc_mask_s);
    shift2 <@ Ops.iVPBROADCAST_16u16(pc_shift2_s);
    shift2_b <- f16u16_t32u8 shift2; (* FIXME: specific AVX2 op maybe ?? *)
    permidx <- Array8.init (fun i => pc_permidx_s.[i]);

    aux <- (256 %/ 64);
    i <- 0;

    while (i < aux) {
      f0 <- Array16.init (fun j => a.[64*i+j]);
      f1 <- Array16.init (fun j => a.[64*i+16+j]);
      f2 <- Array16.init (fun j => a.[64*i+32+j]);
      f3 <- Array16.init (fun j => a.[64*i+48+j]);
      f0 <@ Ops.iVPMULH_256(f0, v);
      f1 <@ Ops.iVPMULH_256(f1, v);
      f2 <@ Ops.iVPMULH_256(f2, v);
      f3 <@ Ops.iVPMULH_256(f3, v);
      f0 <@ Ops.iVPMULHRS_256(f0, shift1);
      f1 <@ Ops.iVPMULHRS_256(f1, shift1);
      f2 <@ Ops.iVPMULHRS_256(f2, shift1);
      f3 <@ Ops.iVPMULHRS_256(f3, shift1);
      f0 <@ Ops.iVPAND_16u16(f0, mask);
      f1 <@ Ops.iVPAND_16u16(f1, mask);
      f2 <@ Ops.iVPAND_16u16(f2, mask);
      f3 <@ Ops.iVPAND_16u16(f3, mask);

      f0_b <@ Ops.iVPACKUS_16u16(f0, f1);
      f2_b <@ Ops.iVPACKUS_16u16(f2, f3);
      f0 <@ Ops.iVPMADDUBSW_256(f0_b, shift2_b);
      f2 <@ Ops.iVPMADDUBSW_256(f2_b, shift2_b);
      f0_b <@ Ops.iVPACKUS_16u16(f0, f2);

      f0_dw <- f32u8_t8u32 f0_b;
      f0_dw <@ Ops.iVPERMD(permidx, f0_dw);  
      f0_b <- f8u32_t32u8 f0_dw;

      Glob.mem <@ Ops.istore32u8(Glob.mem, rp + (W64.of_int (32 * i)), f0_b);
      i <- i + 1;
    }

    return (a);
  }

  proc poly_tobytes (rp:W64.t, a:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;
    
    var qx16:t16u16;
    var i:int;
    var t0:t16u16;
    var t1:t16u16;
    var t2:t16u16;
    var t3:t16u16;
    var t4:t16u16;
    var t5:t16u16;
    var t6:t16u16;
    var t7:t16u16;
    var tt:t16u16;
    var ttt:t16u16;

    var t0_b:t32u8;
    var t2_b:t32u8;
    var t1_b:t32u8;
    var t3_b:t32u8;
    var ttt_b:t32u8;
    var t4_b:t32u8;

    qx16 <- Array16.init (fun i => jqx16.[i]);
    a <@ poly_csubq (a);

    i <- 0;
    while (i < 2) {
      t0 <- Array16.init (fun j => a.[128*i + j]);
      t1 <- Array16.init (fun j => a.[128*i + 16 + j]);
      t2 <- Array16.init (fun j => a.[128*i + 32 + j]);
      t3 <- Array16.init (fun j => a.[128*i + 48 + j]);
      t4 <- Array16.init (fun j => a.[128*i + 64 + j]);
      t5 <- Array16.init (fun j => a.[128*i + 80 + j]);
      t6 <- Array16.init (fun j => a.[128*i + 96 + j]);
      t7 <- Array16.init (fun j => a.[128*i + 112 + j]);
      tt <@ Ops.iVPSLL_16u16(t1, (W8.of_int 12));
      tt <@ Ops.iVPOR_16u16(tt, t0);
      t0 <@ Ops.iVPSRL_16u16(t1, (W8.of_int 4));
      t1 <@ Ops.iVPSLL_16u16(t2, (W8.of_int 8));
      t0 <@ Ops.iVPOR_16u16(t0, t1);
      t1 <@ Ops.iVPSRL_16u16(t2, (W8.of_int 8));
      t2 <@ Ops.iVPSLL_16u16(t3, (W8.of_int 4));
      t1 <@ Ops.iVPOR_16u16(t1, t2);
      t2 <@ Ops.iVPSLL_16u16(t5, (W8.of_int 12));
      t2 <@ Ops.iVPOR_16u16(t2, t4);
      t3 <@ Ops.iVPSRL_16u16(t5, (W8.of_int 4));
      t4 <@ Ops.iVPSLL_16u16(t6, (W8.of_int 8));
      t3 <@ Ops.iVPOR_16u16(t3, t4);
      t4 <@ Ops.iVPSRL_16u16(t6, (W8.of_int 8));
      t5 <@ Ops.iVPSLL_16u16(t7, (W8.of_int 4));
      t4 <@ Ops.iVPOR_16u16(t4, t5);
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

      t0_b <- f16u16_t32u8 t0;
      t2_b <- f16u16_t32u8 t2;
      t1_b <- f16u16_t32u8 t1;
      t3_b <- f16u16_t32u8 t3;
      ttt_b <- f16u16_t32u8 ttt;
      t4_b <- f16u16_t32u8 t4;

      Glob.mem <@ Ops.istore32u8(Glob.mem, rp + (W64.of_int (192 * i)), t0_b);
      Glob.mem <@ Ops.istore32u8(Glob.mem, rp + (W64.of_int ((192 * i) + 32)), t2_b);
      Glob.mem <@ Ops.istore32u8(Glob.mem, rp + (W64.of_int ((192 * i) + 64)), t1_b);
      Glob.mem <@ Ops.istore32u8(Glob.mem, rp + (W64.of_int ((192 * i) + 96)), t3_b);
      Glob.mem <@ Ops.istore32u8(Glob.mem, rp + (W64.of_int ((192 * i) + 128)), ttt_b);
      Glob.mem <@ Ops.istore32u8(Glob.mem, rp + (W64.of_int ((192 * i) + 160)), t4_b);
      i <- i + 1;
    }
    return (a);
  }

  proc poly_frombytes (rp:W16.t Array256.t, ap:W64.t) : W16.t Array256.t = {
    var mask:t16u16;
    var i:int;
    var t0:t16u16;
    var t1:t16u16;
    var t2:t16u16;
    var t3:t16u16;
    var t4:t16u16;
    var t5:t16u16;
    var tt:t16u16;
    var t6:t16u16;
    var t7:t16u16;
    var t8:t16u16;
    var t9:t16u16;
    var t10:t16u16;
    var t11:t16u16;

    var t0_b:t32u8;
    var t1_b:t32u8;
    var t2_b:t32u8;
    var t3_b:t32u8;
    var t4_b:t32u8;
    var t5_b:t32u8;

    mask <- Array16.init (fun i => maskx16.[i]);
    i <- 0;

    while (i < 2) {
      t0_b <@ Ops.iload32u8(Glob.mem, ap + (W64.of_int (192 * i)));
      t1_b <@ Ops.iload32u8(Glob.mem, ap + (W64.of_int ((192 * i) + 32)));
      t2_b <@ Ops.iload32u8(Glob.mem, ap + (W64.of_int ((192 * i) + 64)));
      t3_b <@ Ops.iload32u8(Glob.mem, ap + (W64.of_int ((192 * i) + 96)));
      t4_b <@ Ops.iload32u8(Glob.mem, ap + (W64.of_int ((192 * i) + 128)));
      t5_b <@ Ops.iload32u8(Glob.mem, ap + (W64.of_int ((192 * i) + 160)));

      t0 <- f32u8_t16u16 t0_b;
      t1 <- f32u8_t16u16 t1_b;
      t2 <- f32u8_t16u16 t2_b;
      t3 <- f32u8_t16u16 t3_b;
      t4 <- f32u8_t16u16 t4_b;
      t5 <- f32u8_t16u16 t5_b;

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

      t7 <@ Ops.iVPSRL_16u16(t6, (W8.of_int 12));
      t8 <@ Ops.iVPSLL_16u16(t3, (W8.of_int 4));
      t7 <@ Ops.iVPOR_16u16(t7, t8);
      t6 <@ Ops.iVPAND_16u16(mask, t6);
      t7 <@ Ops.iVPAND_16u16(mask, t7);
      t8 <@ Ops.iVPSRL_16u16(t3, (W8.of_int 8));
      t9 <@ Ops.iVPSLL_16u16(t0, (W8.of_int 8));
      t8 <@ Ops.iVPOR_16u16(t8, t9);
      t8 <@ Ops.iVPAND_16u16(mask, t8);
      t9 <@ Ops.iVPSRL_16u16(t0, (W8.of_int 4));
      t9 <@ Ops.iVPAND_16u16(mask, t9);
      t10 <@ Ops.iVPSRL_16u16(t4, (W8.of_int 12));
      t11 <@ Ops.iVPSLL_16u16(t1, (W8.of_int 4));
      t10 <@ Ops.iVPOR_16u16(t10, t11);
      t4 <@ Ops.iVPAND_16u16(mask, t4);
      t10 <@ Ops.iVPAND_16u16(mask, t10);
      t11 <@ Ops.iVPSRL_16u16(t1, (W8.of_int 8));
      tt <@ Ops.iVPSLL_16u16(t5, (W8.of_int 8));
      t11 <@ Ops.iVPOR_16u16(t11, tt);
      t11 <@ Ops.iVPAND_16u16(mask, t11);
      tt <@ Ops.iVPSRL_16u16(t5, (W8.of_int 4));
      tt <@ Ops.iVPAND_16u16(mask, tt);

      rp <- Array256.fill (fun j => t6.[j %% 16]) (128 * i) 16 rp;
      rp <- Array256.fill (fun j => t7.[j %% 16]) (128 * i + 16) 16 rp;
      rp <- Array256.fill (fun j => t8.[j %% 16]) (128 * i + 32) 16 rp;
      rp <- Array256.fill (fun j => t9.[j %% 16]) (128 * i + 48) 16 rp;
      rp <- Array256.fill (fun j => t4.[j %% 16]) (128 * i + 64) 16 rp;
      rp <- Array256.fill (fun j => t10.[j %% 16]) (128 * i + 80) 16 rp;
      rp <- Array256.fill (fun j => t11.[j %% 16]) (128 * i + 96) 16 rp;
      rp <- Array256.fill (fun j => tt.[j %% 16]) (128 * i + 112) 16 rp;

      i <- i + 1;
    }
    return (rp);
  }
}.
