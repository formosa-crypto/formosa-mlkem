require import AllCore List Int IntDiv CoreMap.

from Jasmin require import JModel.
from JazzEC require import Array400 Array256 Array160 Array128 Array64 Array32 Array16 Array8 Array4.
from JazzEC require import WArray800 WArray512 WArray128 WArray64 WArray32 WArray16.
require import AVX2_Ops.
from JazzEC require import Jkem1024 Jkem1024_avx2.
require import MLKEM_Poly_avx2_prevec MLKEM_avx2_auxlemmas MLKEMFCLib.

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


equiv veceq_poly_add2 :
  Mvec.poly_add2 ~Jkem1024_avx2.M._poly_add2: ={rp, bp} ==> ={res}.
proof.
  proc.
  while (={rp, bp, i}).
    inline{1} OpsV.iVPADD_16u16.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.


equiv veceq_poly_sub :
  Mvec.poly_sub ~Jkem1024_avx2.M._poly_sub: ={rp, ap, bp} ==> ={res}.
proof.
  proc.
  while (={rp, ap, bp, i}).
    inline{1} OpsV.iVPSUB_16u16.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.

equiv veceq_poly_csubq :
  Mvec.poly_csubq ~Jkem1024_avx2.M._poly_csubq: ={rp} ==> ={res}.
proof.
  proc.
  while (={rp, i, qx16}).
    inline *.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.



equiv veceq_red16x:
  Mvec.red16x ~Jkem1024_avx2.M.__red16x: ={r, qx16, vx16} ==> ={res}.
proof.
  proc.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_poly_reduce:
  Mvec.poly_reduce ~Jkem1024_avx2.M.__poly_reduce: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16, vx16}).
    inline *.
    wp. skip. auto => />.
  wp. skip. auto => />.
qed.

equiv veceq_fqmulx16:
  Mvec.fqmulx16 ~Jkem1024_avx2.M.__fqmulx16: ={a, b, qx16, qinvx16} ==> ={res}.
proof.
  proc.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_poly_frommont:
  Mvec.poly_frommont ~Jkem1024_avx2.M._poly_frommont: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16, qinvx16, dmontx16} /\ aux{1} = inc{2}).
  inline *.
  wp. skip. auto => />.
  wp. skip. auto => />.
qed.



equiv veceq_shuffle8:
  Mvec.shuffle8 ~Jkem1024_avx2.M.__shuffle8: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.

equiv veceq_shuffle4:
  Mvec.shuffle4 ~Jkem1024_avx2.M.__shuffle4: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.

equiv veceq_shuffle2:
  Mvec.shuffle2 ~Jkem1024_avx2.M.__shuffle2: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.

equiv veceq_shuffle1:
  Mvec.shuffle1 ~Jkem1024_avx2.M.__shuffle1: ={a, b} ==> ={res}.
proof.
  proc.
  inline *; wp; skip; auto => />.
qed.


equiv prevec_eq_poly_add2:
  Mprevec.poly_add2 ~Jkem1024_avx2.M._poly_add2: ={rp, bp} ==> ={res}.
    transitivity Mvec.poly_add2 (={rp, bp} ==> ={res}) (={rp, bp} ==> ={res}).
smt(). trivial.
apply eq_poly_add2.
apply veceq_poly_add2.
qed.

equiv prevec_eq_poly_sub:
  Mprevec.poly_sub ~Jkem1024_avx2.M._poly_sub: ={rp, ap, bp} ==> ={res}.
    transitivity Mvec.poly_sub (={rp, ap, bp} ==> ={res}) (={rp, ap, bp} ==> ={res}).
smt(). trivial.
apply eq_poly_sub.
apply veceq_poly_sub.
qed.

equiv prevec_eq_poly_csubq:
  Mprevec.poly_csubq ~Jkem1024_avx2.M._poly_csubq: ={rp} ==> ={res}.
    transitivity Mvec.poly_csubq (={rp} ==> ={res}) (={rp} ==> ={res}).
smt(). trivial.
apply eq_poly_csubq.
apply veceq_poly_csubq.
qed.



equiv prevec_eq_red16x:
  Mprevec.red16x ~Jkem1024_avx2.M.__red16x: is16u16 r{1} r{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2} ==> is16u16 res{1} res{2}.
  transitivity Mvec.red16x (is16u16 r{1} r{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2} ==> is16u16 res{1} res{2})
                           (={r, qx16, vx16} ==> ={res}).
smt(). trivial.
apply eq_red16x.
apply veceq_red16x.
qed.

equiv prevec_eq_poly_reduce:
  Mprevec.poly_reduce ~Jkem1024_avx2.M.__poly_reduce: ={rp} ==> ={res}.
    transitivity Mvec.poly_reduce (={rp} ==> ={res}) (={rp} ==> ={res}).
smt(). trivial.
apply eq_poly_reduce.
apply veceq_poly_reduce.
qed.

equiv prevec_eq_fqmulx16:
  Mprevec.fqmulx16 ~Jkem1024_avx2.M.__fqmulx16: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==> is16u16 res{1} res{2}.
    transitivity Mvec.fqmulx16 (is16u16 a{1} a{2} /\ is16u16 b{1} b{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==> is16u16 res{1} res{2})
                               (={a, b, qx16, qinvx16} ==> ={res}).
smt(). trivial.
apply eq_fqmulx16.
apply veceq_fqmulx16.
qed.

equiv prevec_eq_poly_frommont:
  Mprevec.poly_frommont ~Jkem1024_avx2.M._poly_frommont: ={rp} ==> ={res}.
    transitivity Mvec.poly_frommont (={rp} ==> ={res}) (={rp} ==> ={res}).
smt(). trivial.
apply eq_poly_frommont.
apply veceq_poly_frommont.
qed.


equiv prevec_eq_shuffle8:
  Mprevec.shuffle8 ~Jkem1024_avx2.M.__shuffle8: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
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
  Jkem1024_avx2.M.__shuffle8 ~ Mprevec.shuffle8 : is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle8 => />. qed.

equiv prevec_eq_shuffle4:
  Mprevec.shuffle4 ~Jkem1024_avx2.M.__shuffle4: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
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
  Jkem1024_avx2.M.__shuffle4 ~ Mprevec.shuffle4: is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle4 => />. qed.

equiv prevec_eq_shuffle2:
  Mprevec.shuffle2 ~Jkem1024_avx2.M.__shuffle2: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
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
  Jkem1024_avx2.M.__shuffle2 ~ Mprevec.shuffle2 : is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle2 => />. qed.

equiv prevec_eq_shuffle1:
  Mprevec.shuffle1 ~Jkem1024_avx2.M.__shuffle1: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} ==>
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
  Jkem1024_avx2.M.__shuffle1 ~ Mprevec.shuffle1 : is16u16 a{2} a{1} /\ is16u16 b{2} b{1} ==>
                                    is16u16 res{2}.`1 res{1}.`1 /\
                                    is16u16 res{2}.`2 res{1}.`2.
symmetry. conseq prevec_eq_shuffle1 => />. qed.

require import NTT_avx2 NTT_AVX_j.
require import MLKEM_Poly_avx2_proof.

lemma list_arr16 (x:'a Array16.t):
  [x.[0];x.[1];x.[2];x.[3];x.[4];x.[5];x.[6];x.[7];x.[8];x.[9];x.[10];x.[11];x.[12];x.[13];x.[14];x.[15]] = to_list x.
rewrite /to_list /mkseq -iotaredE => />. qed.

lemma avx2_shuffle8_corr_h (_a _b : t16u16) :
      hoare[ Jkem1024_avx2.M.__shuffle8 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf8 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf8 _a _b).`2 res.`2].
conseq prevec_eq_shuffle8_sym (MLKEM_PolyAVX.shuffle8_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

lemma avx2_shuffle8_corr (_a _b : t16u16) :
      phoare[ Jkem1024_avx2.M.__shuffle8 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf8 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf8 _a _b).`2 res.`2] = 1%r.
conseq __shuffle8_ll (avx2_shuffle8_corr_h _a _b) => />. qed.

lemma avx2_shuffle4_corr_h (_a _b : t16u16) :
      hoare[ Jkem1024_avx2.M.__shuffle4 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf4 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf4 _a _b).`2 res.`2].
conseq prevec_eq_shuffle4_sym (MLKEM_PolyAVX.shuffle4_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

lemma avx2_shuffle4_corr (_a _b : t16u16) :
      phoare[ Jkem1024_avx2.M.__shuffle4 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf4 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf4 _a _b).`2 res.`2] = 1%r.
conseq __shuffle4_ll (avx2_shuffle4_corr_h _a _b) => />. qed.

lemma avx2_shuffle2_corr_h (_a _b : t16u16) :
      hoare[ Jkem1024_avx2.M.__shuffle2 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf2 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf2 _a _b).`2 res.`2].
conseq prevec_eq_shuffle2_sym (MLKEM_PolyAVX.shuffle2_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

lemma avx2_shuffle2_corr (_a _b : t16u16) :
      phoare[ Jkem1024_avx2.M.__shuffle2 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf2 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf2 _a _b).`2 res.`2] = 1%r.
conseq __shuffle2_ll (avx2_shuffle2_corr_h _a _b) => />. qed.

lemma avx2_shuffle1_corr_h (_a _b : t16u16) :
      hoare[ Jkem1024_avx2.M.__shuffle1 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf1 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf1 _a _b).`2 res.`2].
conseq prevec_eq_shuffle1_sym (MLKEM_PolyAVX.shuffle1_corr_h _a _b) => />.
auto => /> &1 -> ->. exists ((_a,_b)) => />.
auto => /> &1 &2 -> -> -> ->. rewrite /is16u16 !list_arr16 //. qed.

lemma avx2_shuffle1_corr (_a _b : t16u16) :
      phoare[ Jkem1024_avx2.M.__shuffle1 :
             is16u16 _a a /\ is16u16 _b b
             ==>
             is16u16 (NTT_Avx2.shuf1 _a _b).`1 res.`1 /\
             is16u16 (NTT_Avx2.shuf1 _a _b).`2 res.`2] = 1%r.
conseq __shuffle1_ll (avx2_shuffle1_corr_h _a _b) => />. qed.


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



end MLKEM_PolyAVXVec.
