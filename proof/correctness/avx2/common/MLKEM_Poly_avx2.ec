(* ==== from.ec ==== *)
require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel JMemory JWord.
from JazzEC require import Array400 Array256 Array128 Array64 Array32 Array16 Array8 Array4 Array2.
from JazzEC require import WArray800 WArray512 WArray128 WArray128 WArray64 WArray32 WArray16.
from JazzEC require import Jkem_avx2.

require import AVX2_Ops.

require import Fq_avx2.

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

      r <@ Fq_avx2.MprevecT0.red16x (r, qx16, vx16);

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
      t <@ Fq_avx2.MprevecT0.fqmulx16 (t, dmontx16, qx16, qinvx16);

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

(* ==== from.ec ==== *)
require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array400 Array384 Array256 Array128 Array64 Array32 Array16 Array4 Array8.
from JazzEC require import WArray512 WArray32 WArray16.

require import W16extra.
require import AVX2_Ops NTT_avx2_poly Fq_avx2.
require import Fq NTT_Fq MLKEMFCLib.


from JazzEC require import Jkem_avx2.

from Spec require import GFq Rq Serialization VecMat Correctness.

theory MLKEM_PolyAVX.

import GFq.
import Fq.
import SignedReductions_W16.
import Zq.
import ZModP.
import Fq_avx2.
import Serialization VecMat.

lemma poly_add_corr_h _a _b ab bb :
      0 <= ab <= 6 => 0 <= bb <= 3 =>
      hoare[ Mprevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\
           forall k, 0 <= k < 256 =>
             incoeff (to_sint res.[k]) = _a.[k] + _b.[k]].
proof. 
  move => [ab_lb ab_ub] [bb_lb bb_ub].
  proc.
  sp.
  while (0 <= i <= 16 /\
           (forall k, 16*i <= k < 256 => incoeff (to_sint rp.[k]) = _a.[k]) /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp (16*i) 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (16*i) (ab + bb) /\
           (forall k, 0 <= k < (16*i) =>
             incoeff (to_sint rp.[k]) = _a.[k] + _b.[k])); last first.
  auto => />.
  move => &hr signed_bound_a signed_bound_b.
  do split; 1..3:by smt(Array256.initiE Array256.mapiE).
  move => i rp i_tlb i_lb i_ub _ _.
  have ->: i = 16. by move : i_tlb i_ub => /#.
  move => -> /=.
  smt().

  inline Ops.iVPADD_16u16.
  wp; skip.
  move => &hr [#] i_lb i_ub _a_def _b_def sgnd_bnd_hrp_a sgnd_bnd_bp sgnd_bnd_lrp_ab lrp_def i_tub />.
  rewrite mulzDr /=.
  do split; first 2 by move : i_lb i_tub => /#.
  move => k k_lb k_ub.
  rewrite lezNgt in k_lb.
  rewrite filliE 1:/# k_lb /=.
  rewrite -lezNgt in k_lb.
  rewrite -_a_def 1:/# 1:// /=.

  rewrite /signed_bound_cxq => k [k_lb k_ub].
  rewrite lezNgt in k_lb.
  rewrite filliE 1:/# k_lb /=.
  rewrite -lezNgt in k_lb.
  move : sgnd_bnd_hrp_a => /#.

  rewrite /signed_bound_cxq => k [k_lb k_ub].
  rewrite filliE 1:/# /= initiE 1:/# /=.
  case (16 * i{hr} <= k) => k_tlb.
    + rewrite k_ub /=.
      do rewrite lift2poly_iso 1..2://.
      move : (add_corr_qv rp{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 6 3 _ _ _ _ _ _) => />;
        1,2:by smt(Array256.initiE Array256.mapiE Array256.tP).
      rewrite /signed_bound_cxq in sgnd_bnd_hrp_a.
      move : (sgnd_bnd_hrp_a k) ab_lb ab_ub.
      rewrite k_tlb /=. by smt().

      rewrite /signed_bound_cxq in sgnd_bnd_bp.
      move : (sgnd_bnd_bp k) bb_lb bb_ub.
      rewrite k_lb /=. by smt().


      move => rp_bp_def bp_lb bp_ub.

      rewrite to_sintD_small => />.
        move : (sgnd_bnd_hrp_a k _); first by smt().
        move : (sgnd_bnd_bp k _); first by smt().
        smt().
      move : (sgnd_bnd_hrp_a k _) (sgnd_bnd_bp k _) => /#.
  + simplify.
    rewrite /signed_bound_cxq /b16 in sgnd_bnd_lrp_ab.
    rewrite (sgnd_bnd_lrp_ab k) 1:/#.

  move => k k_lb k_ub.
  rewrite filliE 1:/# /= initiE 1:/# /=.
  case (16 * i{hr} <= k) => k_tlb.
    + rewrite k_ub /=.
      do (rewrite lift2poly_iso 1..2:// /=).
      rewrite to_sintD_small => />.
        move : (sgnd_bnd_hrp_a k _); first by smt().
        move : (sgnd_bnd_bp k _); first by smt().
        smt().
      rewrite incoeffD.
      rewrite _a_def 1:/#; congr.
      rewrite /lift_array256 in _b_def.
      rewrite _b_def mapiE 1:/# //=.
    + simplify.
      rewrite -ltzNge in k_tlb.
      rewrite lrp_def 1..2://.
qed.

lemma poly_add_ll : islossless Mprevec.poly_add2.
proof. 
  proc; while (0<= i <= 16) (16 - i).
  auto => />.
  inline Ops.iVPADD_16u16.
  auto => />.
  smt().
  auto => />.
  smt().
qed.

lemma poly_add_corr _a _b ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      phoare[ Mprevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
   by move => abb bbb; conseq poly_add_ll (poly_add_corr_h _a _b ab bb abb bbb).

lemma poly_sub_corr_h _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>
      hoare[ Mprevec.poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] - _b.[k]].
proof. 
  move => [ab_lb ab_ub] [bb_lb bb_ub].
  proc.
  while (0 <= i <= 16 /\
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (16*i) (ab + bb) /\
           forall k, 0 <= k < (16*i) =>
              incoeff (to_sint rp.[k]) = _a.[k] - _b.[k]
  ); first last.
  auto => />.
  move => &hr signed_bound_a signed_bound_b.
  do split; first 3 by smt().

  inline Ops.iVPSUB_16u16.
  wp; skip.
  move => &hr [#] i_lb i_ub _a_def _b_def sgnd_bnd_hap_a sgnd_bnd_bp sgnd_bnd_lrp_ab lrp_def i_tub />.

  rewrite mulzDr /=.
  do split; first 2 by move : i_lb i_tub => /#.
  
  rewrite /signed_bound_cxq => k [k_lb k_ub].
  rewrite filliE 1:/# /=.
  case (16 * i{hr} <= k) => k_tlb.
    + rewrite k_ub /= initiE 1:/# /=.
      do (rewrite lift2poly_iso 1:/# 1:/#).
      rewrite to_sintB_small => />.
        move : (sgnd_bnd_hap_a k _) (sgnd_bnd_bp k _) => /#.
        move : (sgnd_bnd_hap_a k _) (sgnd_bnd_bp k _) => /#.
    + simplify. rewrite -ltzNge in k_tlb.
      rewrite /signed_bound_cxq /b16 in sgnd_bnd_lrp_ab.
      rewrite (sgnd_bnd_lrp_ab k _); first by rewrite k_lb k_tlb.

  move => k k_lb k_ub.
  rewrite filliE 1:/# /= initiE 1:/# /=.
  case (16 * i{hr} <= k) => k_tlb.
    + rewrite k_ub /=.
      do (rewrite lift2poly_iso //=).
      rewrite to_sintB_small => />.
        move : (sgnd_bnd_hap_a k _) (sgnd_bnd_bp k _) => /#.
      rewrite incoeffB.
      rewrite _b_def _a_def /lift_array256.
      rewrite mapiE 1:/# mapiE 1:/# //=.
    + simplify.
      rewrite -ltzNge in k_tlb.
      rewrite lrp_def //=.
qed.

lemma poly_sub_ll : islossless Mprevec.poly_sub.
proof. 
  proc; while (0<= i <= 16) (16 - i); auto => />.
  inline Ops.iVPSUB_16u16.
  auto => />; smt().
  auto => />; smt().
qed.

lemma poly_sub_corr _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>  
      phoare[ Mprevec.poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] - _b.[k]] = 1%r
  by move => *; conseq poly_sub_ll (poly_sub_corr_h _a _b ab bb _ _).

require import NTTAlgebra.
lemma poly_reduce_corr_h (ap: coeff Array256.t):
     hoare[ Mprevec.poly_reduce :
          ap = lift_array256 rp ==>
          ap = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16 res.[k] (2*q)].
proof. 
  proc.
  while (0 <= i <= 16 /\
         (forall k, 0 <= k < 256 => ap.[k] = incoeff (to_sint rp.[k])) /\
         (forall k, 0 <= k < 16 * i => bpos16 rp.[k] (2*q)) /\
         (forall k, 0 <= k < 16 => qx16.[k] = Jkem_avx2.jqx16.[k]) /\
         (forall k, 0 <= k < 16 => vx16.[k] = Jkem_avx2.jvx16.[k])); last first.
  wp. skip.
  move => &hr ap_def />.
  do split.
  rewrite ap_def /lift_array256 => k k_lb k_ub.
  rewrite mapiE 1:/# //=.
  
  smt().
  
  move => k k_lb k_ub.
  rewrite /lift2poly initiE => />.
  rewrite /get256_direct => />.
  rewrite k_lb k_ub => /=.
  rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
  rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
  rewrite initiE. move : k_lb k_ub => /#. simplify.
  rewrite initiE. move : k_lb k_ub => /#. simplify.
  rewrite (_:(2*k + 1) %/2 = 2*k %/ 2).
    smt().
  rewrite (_: 2*k %% 2 = 0).
    smt().
  rewrite (_: (2*k + 1) %% 2 = 1).
    smt().
  rewrite pack2_bits8.
  smt().
  
  move => k k_lb k_ub.
  rewrite /lift2poly initiE => />.
  rewrite /get256_direct => />.
  rewrite k_lb k_ub => /=.
  rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
  rewrite W32u8.Pack.initiE. move : k_lb k_ub => /#.
  rewrite initiE. move : k_lb k_ub => /#. simplify.
  rewrite initiE. move : k_lb k_ub => /#. simplify.
  rewrite (_:(2*k + 1) %/2 = 2*k %/ 2).
    smt().
  rewrite (_: 2*k %% 2 = 0).
    smt().
  rewrite (_: (2*k + 1) %% 2 = 1).
    smt().
  rewrite pack2_bits8.
  smt().
  
  move => i rpu i_tlb i_lb i_ub.
  have ->: i=16. by move : i_tlb i_ub => /#.
  simplify.
  move => ap_eq_rpu rpu_bnds jqx16_def vx16_def.
  split.
    + apply Array256.ext_eq => x x_i.
      rewrite /lift_array256 mapiE 1:x_i /= ap_eq_rpu 1:x_i //=.
    + move : rpu_bnds => /#.
  
  wp; sp; ecall (Fq_avx2.barret_red16x_corr_hh (Fq_avx2.lift_array16 r)). auto => />.
  move => &hr i_lb i_rub rp_sbred rp_eq__rp qx16_def vx16_def i_ub result red16x_bred.
  split; first by move : i_lb i_ub => /#.
  pose rp_sub := ((Fq_avx2.lift_array16
                       (lift2poly
                          (get256 ((init16 ("_.[_]" rp{hr})))%WArray512 i{hr})))).
  split.
  move => k k_lb k_ub.
  rewrite filliE 1:/# /=.
  case (16 * i{hr} <= k && k < 16 * i{hr} + 16) => k_si.
    + have bred := (BREDCp_corr rp_sub.[k %% 16] 26 _ _ _ _ _ _);
        1..4,6: smt(qE pow2_16).
        rewrite /rp_sub /lift_array16 mapiE 1:/# /= /R.
        move : W16.to_sint_cmp => /#.
      move : bred => [bred_i bred_cgr].
      rewrite red16x_bred 1:/#.
      rewrite eq_incoeff in bred_cgr.
      rewrite bred_cgr.
      rewrite /lift_array16 /= mapiE 1:/# /= lift2poly_iso //.
      rewrite (rp_sbred k _) //.
    + rewrite (rp_sbred k _) //.
  rewrite mulzDr mulz1 => k k_lb k_ub.
  rewrite filliE // 1:/# k_ub /=.
  case (16 * i{hr} <= k) => k_tlb.
    + have bred := (BREDCp_corr rp_sub.[k %% 16] 26 _ _ _ _ _ _);
        1..4,6: smt(qE pow2_16).
        rewrite /rp_sub /lift_array16 mapiE 1:/# /= /R.
        move : W16.to_sint_cmp => /#.
        move : bred; rewrite andabP; move => [[bred_lb bred_ub] bred_cgr].
        (* move : bred => /andabP [[bred_lb bred_ub] bred_cgr]. *)
        rewrite red16x_bred 1:/# -/rp_sub bred_lb bred_ub //=.
    + rewrite -ltzNge in k_tlb.
      move : (rp_eq__rp k); rewrite k_lb k_tlb /= => /#.
qed.

lemma poly_reduce_ll:
  islossless Mprevec.poly_reduce.
proof. 
  proc; while(0 <= i <= 16) (16 - i);
    move => *; inline *; auto => />.
  move => &hr i_lb i_ub i_tub.
  split.
  move : i_lb i_tub => /#.
  smt().
  smt().
qed.

lemma poly_reduce_corr ap:
  phoare[ Mprevec.poly_reduce :
        ap = lift_array256 rp ==>
        ap = lift_array256 res /\
        forall k, 0 <= k < 256 => bpos16 res.[k] (2*q)] = 1%r.
proof.  by conseq poly_reduce_ll (poly_reduce_corr_h ap). qed.

lemma poly_frommont_corr_h ap:
  hoare[ Mprevec.poly_frommont :
       ap = map W16.to_sint rp ==>
       map W16.to_sint res = map (fun x => SREDC (x * ((Ring.IntID.(^) SignedReductions_W16.R 2) %% q))) ap].
proof. 
  proc.
  while(0 <= i <= 16 /\ aux = 16 /\
        (forall k, 0 <= k < 16 => dmontx16.[k] = W16.of_int 1353) /\
        (forall k, 0 <= k < 16 => qx16.[k] = W16.of_int 3329) /\
        (forall k, 0 <= k < 16 => qinvx16.[k] = W16.of_int (-3327)) /\
        (forall k, 0 <= k < 16 * i => W16.to_sint rp.[k] = SREDC (ap.[k] * ((Ring.IntID.(^) SignedReductions_W16.R 2) %% q))) /\
        (forall k, 16 * i <= k < 256 => W16.to_sint rp.[k] = ap.[k])); last first.
  auto => />.
  move => &hr.
  do split.
  
  move => k k_lb k_ub.
  rewrite /lift2poly //=.
  rewrite initiE //.
  rewrite /get256_direct //=.
  rewrite k_lb k_ub /=.
  rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
  rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
  rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
  rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
  rewrite (_: (2 * k + 1) %/ 2 = (2 * k) %/ 2).
    by smt().
  rewrite (_: 2 * k %% 2 = 0).
    by smt().
  rewrite (_: (2 * k + 1) %% 2 = 1).
    by smt().
  rewrite pack2_bits8.
  rewrite /(Jkem_avx2.jdmontx16) => />.
  rewrite initiE => />. move : k_lb k_ub => /#.
  smt().
  
  move => k k_lb k_ub.
  rewrite /lift2poly //=.
  rewrite initiE //.
  rewrite /get256_direct //=.
  rewrite k_lb k_ub /=.
  rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
  rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
  rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
  rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
  rewrite (_: (2 * k + 1) %/ 2 = (2 * k) %/ 2).
    by smt().
  rewrite (_: 2 * k %% 2 = 0).
    by smt().
  rewrite (_: (2 * k + 1) %% 2 = 1).
    by smt().
  rewrite pack2_bits8.
  rewrite /(Jkem_avx2.jqx16) => />.
  rewrite initiE => />. move : k_lb k_ub => /#.
  smt().
  
  move => k k_lb k_ub.
  rewrite /lift2poly //=.
  rewrite initiE //.
  rewrite /get256_direct //=.
  rewrite k_lb k_ub /=.
  rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
  rewrite W32u8.Pack.initiE //=. move : k_lb k_ub => /#.
  rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
  rewrite WArray32.initiE //=. move : k_lb k_ub => /#.
  rewrite (_: (2 * k + 1) %/ 2 = (2 * k) %/ 2).
    by smt().
  rewrite (_: 2 * k %% 2 = 0).
    by smt().
  rewrite (_: (2 * k + 1) %% 2 = 1).
    by smt().
  rewrite pack2_bits8.
  rewrite initiE => />. move : k_lb k_ub => /#.
  smt().
  
  smt().
  smt(Array256.mapiE).
  move => i rp i_tlb i_lb i_ub jdmontx16_def jqinvx16_def jqx16_def rp_sredc rp_sint_rp0.
  apply Array256.ext_eq.
  move => x x_bnds.
  do rewrite mapiE //=.
  rewrite -lezNgt in i_tlb.
  rewrite (rp_sredc x).
  move : i_tlb i_ub x_bnds => /#.
  rewrite mapiE //.
  sp. wp.
  ecall (Fq_avx2.fqmulx16_corr_hh (Fq_avx2.lift_array16 t) (Fq_avx2.lift_array16 dmontx16)).
  auto => />.
  move => &hr i_lb i_ub dmontx16_def qx16_def qinvx16_def rp_sredc rp_eq_ap i_tub result result_def.
  split.
  move : i_lb i_tub => /#.
  
  rewrite fillE.
  split.
  
  move => k k_lb k_ub.
  have k_mb: 0 <= k %% 16 < 16.
    by smt().
  rewrite initiE //=; first by move : k_lb k_ub i_tub => /#.
  
  case (k < 16 * i{hr}).
    + move => /ltzNge k_tub.
      rewrite k_tub /=.
      apply (rp_sredc k); by move : k_lb k_tub => /#.
    + move => /lezNgt k_tlb.
      rewrite mulzDr mulz1 in k_ub.
      rewrite k_tlb k_ub => /=.
      rewrite result_def //.
      rewrite /lift_array16 mapiE //= lift2poly_iso // mapiE //=.
      rewrite dmontx16_def // of_sintK => />.
      rewrite rp_eq_ap //. rewrite k_tlb; move : k_ub i_tub => /#.
      rewrite /R qE /=.
      congr.
      rewrite /smod //=.
  
  move => k k_lb k_ub.
  rewrite initiE //=; first by move : k_lb i_lb k_ub => /#.
  rewrite mulzDr mulz1 lezNgt in k_lb.
  rewrite k_lb /=.
  apply rp_eq_ap; by move : k_lb k_ub => /#.
qed.

lemma poly_frommont_ll : islossless  Mprevec.poly_frommont.
proof. 
  proc.
  auto => />.
  cfold 4. wp; while (0 <= i <= 16) (16 - i).
  + move => *; inline*; auto => />. smt().
  + inline *; wp; auto => /> /#.
qed.

lemma poly_frommont_corr ap:
  phoare[ Mprevec.poly_frommont :
       ap = map W16.to_sint rp ==>
       map W16.to_sint res = map (fun x => SREDC (x * ((Ring.IntID.(^) SignedReductions_W16.R 2) %% q))) ap] = 1%r
 by conseq poly_frommont_ll (poly_frommont_corr_h ap) => />.

op lift_array16 (p: W16.t Array16.t) =
  Array16.map (fun x => incoeff (W16.to_sint x)) p.

lemma shuffle8_corr_h _a _b:
      hoare[ Mprevec.shuffle8 :
           _a = a /\ _b = b
           ==>
           res.`1 = (shuf8 _a _b).`1 /\
           res.`2 = (shuf8 _a _b).`2].
proof.
  proc.
  wp; inline *; auto => />.
  split.
    + rewrite /shuf8 => />.
      rewrite -ext_eq_all /all_eq //=.
    + rewrite /shuf8 => />.
      rewrite -ext_eq_all /all_eq //=.
qed.

lemma shuffle4_corr_h _a _b:
      hoare[ Mprevec.shuffle4 :
           _a = a /\ _b = b
           ==>
           res.`1 = (shuf4 _a _b).`1 /\
           res.`2 = (shuf4 _a _b).`2].
proof.
  proc.
  wp; inline *; auto => />.
  split.
    + rewrite /shuf4 => />.
      rewrite -ext_eq_all /all_eq //=.
    + rewrite /shuf4 => />.
      rewrite -ext_eq_all /all_eq //=.
qed.

lemma shuffle2_corr_h _a _b:
      hoare[ Mprevec.shuffle2 :
           _a = a /\ _b = b
           ==>
           res.`1 = (shuf2 _a _b).`1 /\
           res.`2 = (shuf2 _a _b).`2].
proof.
  proc.
  wp; inline *; auto => />.
  split.
    + rewrite /shuf2 => />.
      rewrite -ext_eq_all /all_eq //=.
    + rewrite /shuf2 /f16u16_t4u64 /f4u64_t16u16 /lift_array16 => />.
      rewrite -ext_eq_all /all_eq => />.
      rewrite /W8.int_bit => />.
      rewrite shr_shrw 1:/#.
      rewrite wlsrE => />.
      do split; first 8 by apply W16.all_eq_eq.
qed.

lemma shuffle1_corr_h _a _b:
      hoare[ Mprevec.shuffle1 :
           _a = a /\ _b = b
           ==>
           res.`1 = (shuf1 _a _b).`1 /\
           res.`2 = (shuf1 _a _b).`2].
proof.
  proc.
  wp; inline *; auto => />.
  rewrite /shuf1 /f8u32_t16u16 /f16u16_t8u32 /lift_array16 => />.
  do (rewrite -ext_eq_all /all_eq /=).
  rewrite /W8.int_bit => />.
  do (rewrite shl_shlw 1:/#; rewrite wlslE => />).
  do (rewrite shr_shrw 1:/#; rewrite wlsrE => />).
  do split; first 16 by apply W16.all_eq_eq.
qed.

end MLKEM_PolyAVX.

(* ==== from MLKEM_Poly_avx2_vec.ec ==== *)
require import AllCore List Int IntDiv CoreMap.

from Jasmin require import JModel.
from JazzEC require import Array400 Array256 Array128 Array64 Array32 Array16 Array8 Array4.
from JazzEC require import WArray800 WArray512 WArray128 WArray64 WArray32 WArray16.
require import AVX2_Ops.
from JazzEC require import Jkem_avx2.
require import MLKEMFCLib.


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
    a  <@ OpsV.iVPSRL_4u64(a, (W128.of_int 32));
    t1 <@ OpsV.iVPBLEND_8u32_16u16(a, b, (W8.of_int 170));
    return (t0, t1);
  }
  
  proc shuffle1 (a:W256.t, b:W256.t) : W256.t * W256.t = {
    
    var r0:W256.t;
    var r1:W256.t;
    var t0:W256.t;
    var t1:W256.t;
    
    t0 <@ OpsV.iVPSLL_8u32(b, (W128.of_int 16));
    r0 <@ OpsV.iVPBLEND_16u16(a, t0, (W8.of_int 170));
    t1 <@ OpsV.iVPSRL_8u32(a, (W128.of_int 16));
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
    t <@ OpsV.iVPSRA_16u16(r, (W128.of_int 15));
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


  proc  red16x (r:W256.t, qx16:W256.t, vx16:W256.t) : W256.t = {
    var x:W256.t;

    x <@ OpsV.iVPMULH_256(r, vx16);
    x <@ OpsV.iVPSRA_16u16(x, (W128.of_int 10));
    x <@ OpsV.iVPMULL_16u16(x, qx16);
    r <@ OpsV.iVPSUB_16u16(r, x);
    return (r);
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
    a0 <@ OpsV.iVPSRL_8u32(a0, (W128.of_int 16));
    a1 <@ OpsV.iVPSRL_8u32(a1, (W128.of_int 16));
    z <@ OpsV.iVPACKUS_8u32(y, z);
    a0 <@ OpsV.iVPACKUS_8u32(a0, a1);
    y <@ OpsV.iVPBLEND_16u16(b0, zero, (W8.of_int 170));
    x <@ OpsV.iVPBLEND_16u16(b1, zero, (W8.of_int 170));
    b0 <@ OpsV.iVPSRL_8u32(b0, (W128.of_int 16));
    b1 <@ OpsV.iVPSRL_8u32(b1, (W128.of_int 16));
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

}.

theory MLKEM_PolyAVXVec.

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

equiv eq_poly_reduce:
  Mprevec.poly_reduce ~ Mvec.poly_reduce: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i} /\ 0 <= i{1} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2}).
  inline MprevecT0.red16x Mvec.red16x.
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

equiv eq_poly_frommont:
  Mprevec.poly_frommont ~ Mvec.poly_frommont: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, aux} /\ aux{1} = 16 /\ 0 <= i{1} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} /\ is16u16 dmontx16{1} dmontx16{2}).
  inline MprevecT0.fqmulx16 Mvec.fqmulx16.
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


equiv veceq_poly_add2 :
  Mvec.poly_add2 ~Jkem_avx2.M._poly_add2: ={rp, bp} ==> ={res}.
proof.
  proc.
  while (={rp, bp, i}).
    inline{1} OpsV.iVPADD_16u16.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.


equiv veceq_poly_sub :
  Mvec.poly_sub ~Jkem_avx2.M._poly_sub: ={rp, ap, bp} ==> ={res}.
proof.
  proc.
  while (={rp, ap, bp, i}).
    inline{1} OpsV.iVPSUB_16u16.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.

equiv veceq_poly_reduce:
  Mvec.poly_reduce ~Jkem_avx2.M.__poly_reduce: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16, vx16}).
    inline *.
    wp. skip. auto => />.
  wp. skip. auto => />.
qed.

equiv veceq_poly_frommont:
  Mvec.poly_frommont ~Jkem_avx2.M._poly_frommont: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16, qinvx16, dmontx16} /\ aux{1} = inc{2}).
  inline *.
  wp. skip. auto => />.
  wp. skip. auto => />.
qed.


equiv veceq_shuffle8:
  Mvec.shuffle8 ~Jkem_avx2.M.__shuffle8: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.

equiv veceq_shuffle4:
  Mvec.shuffle4 ~Jkem_avx2.M.__shuffle4: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.

equiv veceq_shuffle2:
  Mvec.shuffle2 ~Jkem_avx2.M.__shuffle2: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.

equiv veceq_shuffle1:
  Mvec.shuffle1 ~Jkem_avx2.M.__shuffle1: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.


equiv prevec_eq_poly_add2:
  Mprevec.poly_add2 ~Jkem_avx2.M._poly_add2: ={rp, bp} ==> ={res}.
    transitivity Mvec.poly_add2 (={rp, bp} ==> ={res}) (={rp, bp} ==> ={res}).
smt(). trivial.
apply eq_poly_add2.
apply veceq_poly_add2.
qed.

equiv prevec_eq_poly_sub:
  Mprevec.poly_sub ~Jkem_avx2.M._poly_sub: ={rp, ap, bp} ==> ={res}.
    transitivity Mvec.poly_sub (={rp, ap, bp} ==> ={res}) (={rp, ap, bp} ==> ={res}).
smt(). trivial.
apply eq_poly_sub.
apply veceq_poly_sub.
qed.

equiv prevec_eq_poly_reduce:
  Mprevec.poly_reduce ~Jkem_avx2.M.__poly_reduce: ={rp} ==> ={res}.
    transitivity Mvec.poly_reduce (={rp} ==> ={res}) (={rp} ==> ={res}).
smt(). trivial.
apply eq_poly_reduce.
apply veceq_poly_reduce.
qed.

equiv prevec_eq_poly_frommont:
  Mprevec.poly_frommont ~Jkem_avx2.M._poly_frommont: ={rp} ==> ={res}.
    transitivity Mvec.poly_frommont (={rp} ==> ={res}) (={rp} ==> ={res}).
smt(). trivial.
apply eq_poly_frommont.
apply veceq_poly_frommont.
qed.


equiv prevec_eq_shuffle8:
  Mprevec.shuffle8 ~Jkem_avx2.M.__shuffle8: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
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
  Jkem_avx2.M.__shuffle8 ~ Mprevec.shuffle8 : is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle8 => />. qed.

equiv prevec_eq_shuffle4:
  Mprevec.shuffle4 ~Jkem_avx2.M.__shuffle4: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
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
  Jkem_avx2.M.__shuffle4 ~ Mprevec.shuffle4: is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle4 => />. qed.

equiv prevec_eq_shuffle2:
  Mprevec.shuffle2 ~Jkem_avx2.M.__shuffle2: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
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
  Jkem_avx2.M.__shuffle2 ~ Mprevec.shuffle2 : is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle2 => />. qed.

equiv prevec_eq_shuffle1:
  Mprevec.shuffle1 ~Jkem_avx2.M.__shuffle1: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
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
  Jkem_avx2.M.__shuffle1 ~ Mprevec.shuffle1 : is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle1 => />. qed.

require import NTT_avx2_poly NTT_AVX_j.

lemma list_arr16 (x:'a Array16.t):
  [x.[0];x.[1];x.[2];x.[3];x.[4];x.[5];x.[6];x.[7];x.[8];x.[9];x.[10];x.[11];x.[12];x.[13];x.[14];x.[15]] = to_list x.
rewrite /to_list /mkseq -iotaredE => />. qed.

lemma avx2_shuffle8_corr_h (_a _b : t16u16) :
      hoare[ Jkem_avx2.M.__shuffle8 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (shuf8 _a _b).`1 res.`1 /\
             is16u16 (shuf8 _a _b).`2 res.`2].
conseq prevec_eq_shuffle8_sym (MLKEM_PolyAVX.shuffle8_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

lemma avx2_shuffle4_corr_h (_a _b : t16u16) :
      hoare[ Jkem_avx2.M.__shuffle4 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (shuf4 _a _b).`1 res.`1 /\
             is16u16 (shuf4 _a _b).`2 res.`2].
conseq prevec_eq_shuffle4_sym (MLKEM_PolyAVX.shuffle4_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

lemma avx2_shuffle2_corr_h (_a _b : t16u16) :
      hoare[ Jkem_avx2.M.__shuffle2 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (shuf2 _a _b).`1 res.`1 /\
             is16u16 (shuf2 _a _b).`2 res.`2].
conseq prevec_eq_shuffle2_sym (MLKEM_PolyAVX.shuffle2_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

lemma avx2_shuffle1_corr_h (_a _b : t16u16) :
      hoare[ Jkem_avx2.M.__shuffle1 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (shuf1 _a _b).`1 res.`1 /\
             is16u16 (shuf1 _a _b).`2 res.`2].
conseq prevec_eq_shuffle1_sym (MLKEM_PolyAVX.shuffle1_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

end MLKEM_PolyAVXVec.
