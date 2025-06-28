require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel JMemory JWord.
from JazzEC require import Array400 Array256 Array128 Array64 Array32 Array16 Array8 Array4 Array2.
from JazzEC require import WArray800 WArray512 WArray128 WArray128 WArray64 WArray32 WArray16.
from JazzEC require import Jkem768_avx2.

require import AVX2_Ops.

require import MLKEM_avx2_auxlemmas.

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

}.
