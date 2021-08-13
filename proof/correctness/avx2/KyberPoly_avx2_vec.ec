require import AllCore List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.
require import Array256 Array16p Array16 Array4 Array8 Array32.
require import WArray512 WArray32 WArray16.
require import Ops.
require import KyberPoly_avx2_prevec.
require import KyberPoly_avx2_proof.
require import KyberCPA_avx2.

pragma +oldip.

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
    shift <-
    OpsV.iVPBROADCAST_2u128((get128 (WArray16.init32 (fun i => pfm_shift_s.[i])) 0));
    idx <- OpsV.iVPBROADCAST_2u128((get128 (WArray16.init8 (fun i => pfm_idx_s.[i])) 0));
    f <- OpsV.iload4u64(Glob.mem, ap);
    i <- 0;
    while (i < 4) {
      g3 <- OpsV.iVPSHUFD_256(f, W8.of_int (85 * i));
      g3 <- OpsV.iVPSLLV_8u32(g3, shift);
      g3 <- OpsV.iVPSHUFB_256(g3, idx);
      g0 <- OpsV.iVPSLL_16u16(g3, (W8.of_int 12));
      g1 <- OpsV.iVPSLL_16u16(g3, (W8.of_int 8));
      g2 <- OpsV.iVPSLL_16u16(g3, (W8.of_int 4));
      g0 <- OpsV.iVPSRA_16u16(g0, (W8.of_int 15));
      g1 <- OpsV.iVPSRA_16u16(g1, (W8.of_int 15));
      g2 <- OpsV.iVPSRA_16u16(g2, (W8.of_int 15));
      g3 <- OpsV.iVPSRA_16u16(g3, (W8.of_int 15));
      g0 <- OpsV.ivpand16u16(g0, hqs);
      g1 <- OpsV.ivpand16u16(g1, hqs);
      g2 <- OpsV.ivpand16u16(g2, hqs);
      g3 <- OpsV.ivpand16u16(g3, hqs);
      h0 <- OpsV.iVPUNPCKL_4u64(g0, g1);
      h2 <- OpsV.iVPUNPCKH_4u64(g0, g1);
      h1 <- OpsV.iVPUNPCKL_4u64(g2, g3);
      h3 <- OpsV.iVPUNPCKH_4u64(g2, g3);
      g0 <- OpsV.iVPERM2I128(h0, h1, (W8.of_int 32));
      g2 <- OpsV.iVPERM2I128(h0, h1, (W8.of_int 49));
      g1 <- OpsV.iVPERM2I128(h2, h3, (W8.of_int 32));
      g3 <- OpsV.iVPERM2I128(h2, h3, (W8.of_int 49));
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

    rhi <- OpsV.iVPMULH_256(a, b);
    rlo <- OpsV.iVPMULL_16u16(a, b);
    rlo <- OpsV.iVPMULL_16u16(rlo, qinvx16);
    rlo <- OpsV.iVPMULH_256(rlo, qx16);
    rd <-  OpsV.ivsub16u256(rhi, rlo);
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
(*    px16 <- hqx16_m1; *)
    hq <- (get256 (WArray32.init16 (fun i => hqx16_m1.[i])) 0);
(*    px16 <- hhqx16; *)
    hhq <- (get256 (WArray32.init16 (fun i => hhqx16.[i])) 0);
    aux <- (256 %/ 32);
    i <- 0;
    while (i < aux) {
      f0 <- (get256 (WArray512.init16 (fun i => a.[i])) (2 * i));
      f1 <- (get256 (WArray512.init16 (fun i => a.[i])) ((2 * i) + 1));
      f0 <- OpsV.ivsub16u256(hq, f0);
      f1 <- OpsV.ivsub16u256(hq, f1);
      g0 <- OpsV.iVPSRA_16u16(f0, (W8.of_int 15));
      g1 <- OpsV.iVPSRA_16u16(f1, (W8.of_int 15));
      f0 <- OpsV.ilxor16u16(f0, g0);
      f1 <- OpsV.ilxor16u16(f1, g1);
      f0 <- OpsV.ivsub16u256(f0, hhq);
      f1 <- OpsV.ivsub16u256(f1, hhq);
      f0 <- OpsV.iVPACKSS_16u16(f0, f1);
      f0 <- OpsV.iVPERMQ(f0, (W8.of_int 216));
      c <-  OpsV.iVPMOVMSKB_u256_u32(f0);
      Glob.mem <-
      storeW32 Glob.mem (W64.to_uint (rp + (W64.of_int (4 * i)))) c;
      i <- i + 1;
    }
    return (a);
  }

  proc  red16x (r:W256.t, qx16:W256.t, vx16:W256.t) : W256.t = {
    var x:W256.t;

    x <- OpsV.iVPMULH_256(r, vx16);
    x <- OpsV.iVPSRA_16u16(x, (W8.of_int 10));
    x <- OpsV.iVPMULL_16u16(x, qx16);
    r <- OpsV.ivsub16u256(r, x);
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
(*    x16p <- jqx16; *)
    qx16 <- (get256 (WArray32.init16 (fun i => jqx16.[i])) 0);
(*    x16p <- jqinvx16;*)
    qinvx16 <- (get256 (WArray32.init16 (fun i => jqinvx16.[i])) 0);
(*    x16p <- jdmontx16; *)
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
(*    x16p <- jvx16; *)
    v <- (get256 (WArray32.init16 (fun i => jvx16.[i])) 0);
    shift1 <- OpsV.iVPBROADCAST_16u16(pc_shift1_s);
    mask <- OpsV.iVPBROADCAST_16u16(pc_mask_s);
    shift2 <- OpsV.iVPBROADCAST_16u16(pc_shift2_s);
    permidx <- (get256 (WArray32.init32 (fun i => pc_permidx_s.[i])) 0);
    aux <- (256 %/ 64);
    i <- 0;
    while (i < aux) {
      f0 <- (get256 (WArray512.init16 (fun i => a.[i])) (4 * i));
      f1 <- (get256 (WArray512.init16 (fun i => a.[i])) ((4 * i) + 1));
      f2 <- (get256 (WArray512.init16 (fun i => a.[i])) ((4 * i) + 2));
      f3 <- (get256 (WArray512.init16 (fun i => a.[i])) ((4 * i) + 3));
      f0 <- OpsV.iVPMULH_256(f0, v);
      f1 <- OpsV.iVPMULH_256(f1, v);
      f2 <- OpsV.iVPMULH_256(f2, v);
      f3 <- OpsV.iVPMULH_256(f3, v);
      f0 <- OpsV.iVPMULHRS_256(f0, shift1);
      f1 <- OpsV.iVPMULHRS_256(f1, shift1);
      f2 <- OpsV.iVPMULHRS_256(f2, shift1);
      f3 <- OpsV.iVPMULHRS_256(f3, shift1);
      f0 <- OpsV.ivpand16u16(f0, mask);
      f1 <- OpsV.ivpand16u16(f1, mask);
      f2 <- OpsV.ivpand16u16(f2, mask);
      f3 <- OpsV.ivpand16u16(f3, mask);
      f0 <- OpsV.iVPACKUS_16u16(f0, f1);
      f2 <- OpsV.iVPACKUS_16u16(f2, f3);
      f0 <- OpsV.iVPMADDUBSW_256(f0, shift2);
      f2 <- OpsV.iVPMADDUBSW_256(f2, shift2);
      f0 <- OpsV.iVPACKUS_16u16(f0, f2);
      f0 <- OpsV.iVPERMD(permidx, f0);
      Glob.mem <-
      storeW256 Glob.mem (W64.to_uint (rp + (W64.of_int (32 * i)))) f0;
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
(*    x16p <- jqx16; *)
    q <- (get256 (WArray32.init16 (fun i => jqx16.[i])) 0);
    x32p <- pd_jshufbidx;
    shufbidx <- (get256 (WArray32.init8 (fun i => x32p.[i])) 0);
    mask <- OpsV.iVPBROADCAST_8u32(pd_mask_s);
    shift <- OpsV.iVPBROADCAST_8u32(pd_shift_s);
    t <- setw0_128 ;
    f <- setw0_256 ;
    aux <- (256 %/ 16);
    i <- 0;
    while (i < aux) {
      f <-
      OpsV.iVPBROADCAST_2u128(loadW128 Glob.mem (W64.to_uint (ap + (W64.of_int (8 * i)))));
      f <- OpsV.iVPSHUFB_256(f, shufbidx);
      f <- OpsV.ivpand16u16(f, mask);
      f <- OpsV.iVPMULL_16u16(f, shift);
      f <- OpsV.iVPMULHRS_256(f, q);
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun i => rp.[i])) i f));
      i <- i + 1;
    }
    return (rp);
  }
}.

equiv eq_poly_add2:
  Mavx2_prevec.poly_add2 ~ Mvec.poly_add2: ={rp, bp} ==> ={res}.
proof.
  proc.
  while(={rp, bp, i} /\ 0 <= i{1}).
  wp.
  call eq_ivadd16u256.
  wp. skip. rewrite /is16u16 => />. move => *.
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
  move : H => /#.
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
  wp. skip. rewrite /is16u16 => />. move => *.
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
  move : H => /#.
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

equiv eq_poly_frommsg:
  Mavx2_prevec.poly_frommsg ~ Mvec.poly_frommsg: ={rp, ap, Glob.mem} ==> ={res}.
proof.
  admit.
  (* FIXME
  proc.
  while(={rp, ap, bp, i}).
  wp.
  call eq_ivsub16u256.
  wp. skip. rewrite /is16u16 => />. move => *. split.
  rewrite /lift2poly; simplify; rewrite pack16_bits16; trivial.
  rewrite /lift2poly; simplify; rewrite pack16_bits16; trivial.
  wp; skip.
  move => &1 &2 H.
  split. simplify. split. smt. smt.
  trivial.
  *)
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
  move => *.
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
  move : H => /#.
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

equiv veceq_poly_add2 :
  Mvec.poly_add2 ~ M.poly_add2: ={rp, bp} ==> ={res}.
proof.
  proc.
  while (={rp, bp, i}).
    inline{1} OpsV.ivadd16u256.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.


equiv veceq_poly_sub :
  Mvec.poly_sub ~ M.poly_sub: ={rp, ap, bp} ==> ={res}.
proof.
  proc.
  while (={rp, ap, bp, i}).
    inline{1} OpsV.ivsub16u256.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.

equiv veceq_poly_csubq :
  Mvec.poly_csubq ~ M.poly_csubq: ={rp} ==> ={res}.
proof.
  proc.
  while (={rp, i, qx16}).
    inline *.
    wp. skip. auto => //.
  wp. skip. auto => //.
qed.

equiv veceq_poly_frommsg :
  Mvec.poly_frommsg ~ M.poly_frommsg: ={rp, ap, Glob.mem} ==> ={res}.
proof.
  proc.
  while (={rp, ap, i, f, shift, idx, hqs, x16p}).
    inline *.
    wp. skip. auto => />.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_red16x:
  Mvec.red16x ~ M.red16x: ={r, qx16, vx16} ==> ={res}.
proof.
  proc.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_poly_reduce:
  Mvec.poly_reduce ~ M.poly_reduce: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16, vx16}).
    inline *.
    wp. skip. auto => />.
  wp. skip. auto => />.
qed.

equiv veceq_fqmulx16:
  Mvec.fqmulx16 ~ M.fqmulx16: ={a, b, qx16, qinvx16} ==> ={res}.
proof.
  proc.
  inline *.
  wp. skip. auto => />.
qed.

equiv veceq_poly_frommont:
  Mvec.poly_frommont ~ M.poly_frommont: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16, qinvx16, dmontx16, aux}).
  inline *.
  wp. skip. auto => />.
  wp. skip. auto => />.
qed.

equiv prevec_eq_poly_add2:
    Mavx2_prevec.poly_add2 ~ M.poly_add2: ={rp, bp} ==> ={res}.
    transitivity Mvec.poly_add2 (={rp, bp} ==> ={res}) (={rp, bp} ==> ={res}).
smt. trivial.
apply eq_poly_add2.
apply veceq_poly_add2.
qed.

equiv prevec_eq_poly_sub:
    Mavx2_prevec.poly_sub ~ M.poly_sub: ={rp, ap, bp} ==> ={res}.
    transitivity Mvec.poly_sub (={rp, ap, bp} ==> ={res}) (={rp, ap, bp} ==> ={res}).
smt. trivial.
apply eq_poly_sub.
apply veceq_poly_sub.
qed.

equiv prevec_eq_poly_csubq:
   Mavx2_prevec.poly_csubq ~ M.poly_csubq: ={rp} ==> ={res}.
    transitivity Mvec.poly_csubq (={rp} ==> ={res}) (={rp} ==> ={res}).
smt. trivial.
apply eq_poly_csubq.
apply veceq_poly_csubq.
qed.

equiv prevec_eq_poly_frommsg:
   Mavx2_prevec.poly_frommsg ~ M.poly_frommsg: ={rp, ap, Glob.mem} ==> ={res}.
     transitivity Mvec.poly_frommsg (={rp, ap, Glob.mem} ==> ={res}) (={rp, ap, Glob.mem} ==> ={res}).
smt. trivial.
apply eq_poly_frommsg.
apply veceq_poly_frommsg.
qed.

equiv prevec_eq_red16x:
  Mavx2_prevec.red16x ~ M.red16x: is16u16 r{1} r{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2} ==> is16u16 res{1} res{2}.
  transitivity Mvec.red16x (is16u16 r{1} r{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 vx16{1} vx16{2} ==> is16u16 res{1} res{2})
                           (={r, qx16, vx16} ==> ={res}).
smt. trivial.
apply eq_red16x.
apply veceq_red16x.
qed.

equiv prevec_eq_poly_reduce:
  Mavx2_prevec.poly_reduce ~ M.poly_reduce: ={rp} ==> ={res}.
    transitivity Mvec.poly_reduce (={rp} ==> ={res}) (={rp} ==> ={res}).
smt. trivial.
apply eq_poly_reduce.
apply veceq_poly_reduce.
qed.

equiv prevec_eq_fqmulx16:
  Mavx2_prevec.fqmulx16 ~ M.fqmulx16: is16u16 a{1} a{2} /\ is16u16 b{1} b{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==> is16u16 res{1} res{2}.
    transitivity Mvec.fqmulx16 (is16u16 a{1} a{2} /\ is16u16 b{1} b{2} /\ is16u16 qx16{1} qx16{2} /\ is16u16 qinvx16{1} qinvx16{2} ==> is16u16 res{1} res{2})
                               (={a, b, qx16, qinvx16} ==> ={res}).
smt. trivial.
apply eq_fqmulx16.
apply veceq_fqmulx16.
qed.

equiv prevec_eq_poly_frommont:
  Mavx2_prevec.poly_frommont ~ M.poly_frommont: ={rp} ==> ={res}.
    transitivity Mvec.poly_frommont (={rp} ==> ={res}) (={rp} ==> ={res}).
smt. trivial.
apply eq_poly_frommont.
apply veceq_poly_frommont.
qed.
