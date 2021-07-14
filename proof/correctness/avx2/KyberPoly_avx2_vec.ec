require import AllCore List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.
require import Array256 Array16p Array16 Array4.
require import WArray512 WArray32 WArray16.
require import Ops.
require import KyberPoly_avx2.

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
    OpsV.iVPBROADCAST_2u128((get128 (WArray16.init32 (fun i => shift_s.[i])) 0));
    idx <- OpsV.iVPBROADCAST_2u128((get128 (WArray16.init8 (fun i => idx_s.[i])) 0));
    f <- (loadW256 Glob.mem (W64.to_uint (ap + (W64.of_int 0))));
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
      h2 <- OpsV.iVPUNPCKL_4u64(g0, g1);
      h1 <- OpsV.iVPUNPCKL_4u64(g2, g3);
      h3 <- OpsV.iVPUNPCKL_4u64(g2, g3);
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
}.

require import KyberPoly_avx2_prevec.

equiv eq_poly_add2:
  Mavx2_prevec.poly_add2 ~ Mvec.poly_add2: ={rp, bp} ==> ={res}.
proof.
  proc.
  while(={rp, bp, i}).
  wp.
  call eq_ivadd16u256.
  wp. skip. rewrite /is16u16 => />. move => *. split.
  rewrite /lift2poly; simplify; rewrite pack16_bits16; trivial.
  rewrite /lift2poly; simplify; rewrite pack16_bits16; trivial.
  wp; skip.
  move => &1 &2 H.
  split. simplify. split. smt. smt.
trivial.
qed.

equiv eq_poly_sub:
  Mavx2_prevec.poly_sub ~ Mvec.poly_sub: ={rp, ap, bp} ==> ={res}.
proof.
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
qed.

equiv eq_poly_csubq:
  Mavx2_prevec.poly_csubq ~ Mvec.poly_csubq: ={rp} ==> ={res}.
proof.
  proc.
  while(={rp, i, qx16} /\ is16u16 _qx16{1} qx16{2}).
    inline Mavx2_prevec.csubq Mvec.csubq.
    wp.
    call eq_ivadd16u256.
    call eq_ivpand16u16.
    call eq_iVPSRA_16u16.
    call eq_ivsub16u256.
    wp. skip. rewrite /is16u16 => />. move => *.
    rewrite /lift2poly; simplify; rewrite pack16_bits16 => //.
  wp; skip.
  move => &1 &2 H.
  split.
  simplify.
  rewrite H => /=. split. admit. (* FIXME: trivial *)
  rewrite /lift2poly /is16u16 => />.
  rewrite pack16_bits16.
  admit. (* FIXME: trivial *)
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

