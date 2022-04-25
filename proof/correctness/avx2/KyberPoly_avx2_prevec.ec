require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel JMemory JWord.
require import Array400 Array256 Array64 Array32 Array16 Array8 Array4 Array2p.
require import WArray800 WArray512 WArray128 WArray128 WArray64 WArray32 WArray16.
require W16extra.
require import Fq.
require import AVX2_Ops.
require import List_hakyber.
require import KyberCPA_avx2.

op lift2poly (p: W256.t): W16.t Array16.t =
  Array16.init (fun (n : int) => p \bits16 n).

op f16u16_t8u32 (t: t16u16): t8u32 = Array8.init (fun i => pack2_t (W2u16.Pack.init (fun j => t.[2*i + j]))).
op f8u32_t16u16 (t: t8u32): t16u16 = Array16.init (fun i => t.[i %/ 2] \bits16 (i %% 2)).

op f32u8_t16u16 (t: t32u8): t16u16 = Array16.init (fun i => pack2_t (W2u8.Pack.init (fun j => t.[2*i + j]))).
op f16u16_t32u8 (t: t16u16): t32u8 = Array32.init (fun i => t.[i %/ 2] \bits8 (i %% 2)).

op f32u8_t4u64 (t: t32u8): t4u64 = Array4.init (fun i => pack8_t (W8u8.Pack.init (fun j => t.[8*i + j]))).
op f4u64_t32u8 (t: t4u64): t32u8 = Array32.init (fun i => t.[i %/ 8] \bits8 (i %% 8)).

op f32u8_t8u32 (t: t32u8): t8u32 = Array8.init (fun i => pack4_t (W4u8.Pack.init (fun j => t.[4*i + j]))).
op f8u32_t32u8 (t: t8u32): t32u8 = Array32.init (fun i => t.[i %/ 4] \bits8 (i %% 4)).

op f16u16_t4u64 (t: t16u16): t4u64 = Array4.init (fun i => pack4_t (W4u16.Pack.init (fun j => t.[4*i + j]))).
op f4u64_t16u16 (t: t4u64): t16u16 = Array16.init (fun i => t.[i %/ 4] \bits16 (i %% 4)).

op f4u64_t2u128 (t: t4u64): t2u128 = Array2.init (fun i => pack2_t (W2u64.Pack.init (fun j => t.[2*i + j]))).
op f2u128_t4u64 (t: t2u128): t4u64 = Array4.init (fun i => t.[i %/ 2] \bits64 (i %% 2)).

op f16u16_t2u128 (t: t16u16): t2u128 = Array2.init (fun i => pack8_t (W8u16.Pack.init (fun j => t.[8*i + j]))).
op f2u128_t16u16 (t: t2u128): t16u16 = Array16.init (fun i => t.[i %/ 8] \bits16 (i %% 8)).


lemma f16u16_t8u32K: cancel f8u32_t16u16 f16u16_t8u32.
proof.
  move => w.
  rewrite /f8u32_t16u16 /f16u16_t8u32 /=.
  apply Array8.ext_eq => x x_b.
  rewrite initiE //=.
  have ->: W2u16.Pack.init (fun (j: int) =>
                           (Array16.init (fun (i : int) => w.[i %/ 2] \bits16 i %% 2)).[2 * x + j]) =
          W2u16.Pack.init (fun (j: int) => w.[x] \bits16 j).
    apply W2u16.Pack.ext_eq. move => x0 x0_b. do rewrite initiE 1://=.
    simplify. rewrite initiE 1:/# /=.
    rewrite mulzC. rewrite emodz_eq 1:/#. rewrite divzMDl //.
    smt(@IntDiv).
  rewrite (_ : pack2_t ((W2u16.Pack.init (fun (j : int) => w.[x] \bits16 j))) =
               pack2 [w.[x] \bits16 0; w.[x] \bits16 1]).
    apply W2u16.allP. trivial.
  apply pack2_bits16.
qed.

lemma f8u32_t16u16K: cancel f16u16_t8u32 f8u32_t16u16.
proof.
  move => w.
  rewrite /f16u16_t8u32 /f8u32_t16u16 /=.
  apply Array16.ext_eq => x x_b.
  rewrite initiE //=.
  rewrite -get_unpack16 1:/#.
  do rewrite initiE 1:/# //=.
  rewrite mulzC -(divz_eq x _) //.
qed.

lemma f32u8_t4u64K: cancel f4u64_t32u8 f32u8_t4u64.
proof.
  move => w.
  rewrite /f4u64_t32u8 /f32u8_t4u64 /=.
  apply Array4.ext_eq => x x_b.
  rewrite initiE //=.
  have ->: W8u8.Pack.init (fun (j: int) =>
                           (Array32.init (fun (i : int) => w.[i %/ 8] \bits8 i %% 8)).[8 * x + j]) =
          W8u8.Pack.init (fun (j: int) => w.[x] \bits8 j).
    apply W8u8.Pack.ext_eq. move => x0 x0_b. do rewrite initiE 1://=.
    simplify. rewrite initiE 1:/# /=.
    rewrite mulzC. rewrite emodz_eq 1:/#. rewrite divzMDl //.
    smt(@IntDiv).
  rewrite (_ : pack8_t ((W8u8.Pack.init (fun (j : int) => w.[x] \bits8 j))) =
               pack8 [w.[x] \bits8 0; w.[x] \bits8 1; w.[x] \bits8 2; w.[x] \bits8 3;
                      w.[x] \bits8 4; w.[x] \bits8 5; w.[x] \bits8 6; w.[x] \bits8 7]).
    apply W8u8.allP. trivial.
  apply pack8_bits8.
qed.

lemma f4u64_t8u32K: cancel f32u8_t4u64 f4u64_t32u8.
proof.
  move => w.
  rewrite /f32u8_t4u64 /f4u64_t32u8 /=.
  apply Array32.ext_eq => x x_b.
  rewrite initiE //=.
  rewrite -get_unpack8 1:/#.
  do rewrite initiE 1:/# //=.
  rewrite mulzC -(divz_eq x _) //.
qed.

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

  (*--------------------------------------------------------------------*)
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

      f0_q <- f32u8_t4u64 f0_b;
      f0_q <- Ops.iVPERMQ(f0_q, (W8.of_int 216));
      f0_b <- f4u64_t32u8 f0_q;

      c <-  Ops.iVPMOVMSKB_u256_u32(f0_b);

      Glob.mem <-
      storeW32 Glob.mem (W64.to_uint (rp + (W64.of_int (4 * i)))) c;
      i <- i + 1;
    }
    return (a);
  }

  (* FIXME: equiv proof with Mavx2_prevec.poly_tomsg ?? *)
  proc poly_tomsg_decode (a:W16.t Array256.t) : W32.t Array256.t = {
    var aux: int;
    var rp: W32.t Array256.t;

    var hq:W16.t Array16.t;
    var hhq:W16.t Array16.t;
    var i:int;

    var f0: t16u16;
    var f0_b: t32u8;

    var f1:W16.t Array16.t;
    var g0:W16.t Array16.t;
    var g1:W16.t Array16.t;
    var c:W32.t;

    rp <- witness;
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

      f0_b <- Ops.iVPERMQ_32u8(f0_b, (W8.of_int 216));

      c <-  Ops.iVPMOVMSKB_u256_u32(f0_b);

      (* TODO: is this the best way??? *)
      rp <-  fill (fun k => if c.[k %% 32] then W32.one else W32.zero) (32*i) 32 rp;

      i <- i + 1;
    }
    return rp;
  }

  proc poly_tomsg_store (rp: W64.t, a: W32.t Array256.t): unit = {
    (*TODO: spec *)
    return ();
  }

  (* TODO:
     - prove equiv w/ vec version
  *)
  proc poly_frommsg_load (ap: W64.t): W256.t = {
    var f: W256.t;

    f <- OpsV.iload4u64(Glob.mem, ap);

    return f;
  }

  (* FIXME: spec *)
  proc poly_frommsg_encode (rp: W16.t Array256.t, f: W256.t) : W16.t Array256.t = {
    var aux: int;

    var hqs: t16u16;
    var shift: t8u32;
    var idx: t32u8;
    var f_dw: t8u32;
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


    f_dw <- Array8.init (fun i => f \bits32 i);
    hqs <- lift2poly (get256 (WArray32.init16 (fun i => hqx16_p1.[i])) 0);
    idx <- Ops.iVPBROADCAST_2u128_32u8(Array16.init (fun i => KyberCPA_avx2.pfm_idx_s.[i]));
    shift <-
    Ops.iVPBROADCAST_2u128_8u32(Array4.init (fun i => KyberCPA_avx2.pfm_shift_s.[i]));
    i <- 0;

    while (i < 4) {
      g3_dw <- Ops.iVPSHUFD_256(f_dw, W8.of_int (85 * i));
      g3_dw <- Ops.iVPSLLV_8u32(g3_dw, shift);

      g3_b <- f8u32_t32u8 g3_dw;
      g3_b <- Ops.iVPSHUFB_256(g3_b, idx);
      g3 <- f32u8_t16u16 g3_b;

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

      h0 <- Ops.iVPUNPCKL_4u64_16u16(g0, g1);
      h2 <- Ops.iVPUNPCKH_4u64_16u16(g0, g1);
      h1 <- Ops.iVPUNPCKL_4u64_16u16(g2, g3);
      h3 <- Ops.iVPUNPCKH_4u64_16u16(g2, g3);
      g0 <- Ops.iVPERM2I128_16u16(h0, h1, (W8.of_int 32));
      g2 <- Ops.iVPERM2I128_16u16(h0, h1, (W8.of_int 49));
      g1 <- Ops.iVPERM2I128_16u16(h2, h3, (W8.of_int 32));
      g3 <- Ops.iVPERM2I128_16u16(h2, h3, (W8.of_int 49));

      rp <- fill (fun k => g0.[k %% 16]) (32*i) 16 rp;
      rp <- fill (fun k => g1.[k %% 16]) (32*i + 16) 16 rp;
      rp <- fill (fun k => g2.[k %% 16]) (128 + 32*i) 16 rp;
      rp <- fill (fun k => g3.[k %% 16]) (128 + 32*i + 16) 16 rp;

      i <- i + 1;
    }

    return (rp);
  }

  proc poly_frommsg(rp: W16.t Array256.t, ap: W64.t): W16.t Array256.t = {
    var f: W256.t;

    f <@ poly_frommsg_load(ap);

    rp <@ poly_frommsg_encode(rp, f);

    return rp;
  }

  (*--------------------------------------------------------------------*)

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

    ac0_dw <- f16u16_t8u32 ac0;
    rbd0_dw <- f16u16_t8u32 rbd0;

    ac1_dw <- f16u16_t8u32 ac1;
    rbd1_dw <- f16u16_t8u32 rbd1;

    bc0_dw <- f16u16_t8u32 bc0;
    bc1_dw <- f16u16_t8u32 bc1;
    ad0_dw <- f16u16_t8u32 ad0;
    ad1_dw <- f16u16_t8u32 ad1;

    if ((sign = 0)) {
      x0_dw <- Ops.ivadd32u256(ac0_dw, rbd0_dw);
      x1_dw <- Ops.ivadd32u256(ac1_dw, rbd1_dw);
    } else {
      x0_dw <- Ops.ivsub32u256(ac0_dw, rbd0_dw);
      x1_dw <- Ops.ivsub32u256(ac1_dw, rbd1_dw);
    }
    y0_dw <- Ops.ivadd32u256(bc0_dw, ad0_dw);
    y1_dw <- Ops.ivadd32u256(bc1_dw, ad1_dw);

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

    zero <- lift2poly(setw0_256);
    y <- Ops.iVPBLENDW_256(a0, zero, (W8.of_int 170));
    z <- Ops.iVPBLENDW_256(a1, zero, (W8.of_int 170));

    a0_dw <- f16u16_t8u32 a0;
    a1_dw <- f16u16_t8u32 a1;
    z_dw <- f16u16_t8u32 z;
    y_dw <- f16u16_t8u32 y;

    a0_dw <- Ops.iVPSRL_8u32(a0_dw, (W8.of_int 16));
    a1_dw <- Ops.iVPSRL_8u32(a1_dw, (W8.of_int 16));
    z <- Ops.iVPACKUS_8u32(y_dw, z_dw);
    a0 <- Ops.iVPACKUS_8u32(a0_dw, a1_dw);

    y <- Ops.iVPBLENDW_256(b0, zero, (W8.of_int 170));
    x <- Ops.iVPBLENDW_256(b1, zero, (W8.of_int 170));

    b0_dw <- f16u16_t8u32 b0;
    b1_dw <- f16u16_t8u32 b1;
    x_dw <- f16u16_t8u32 x;
    y_dw <- f16u16_t8u32 y;

    b0_dw <- Ops.iVPSRL_8u32(b0_dw, (W8.of_int 16));
    b1_dw <- Ops.iVPSRL_8u32(b1_dw, (W8.of_int 16));
    y <- Ops.iVPACKUS_8u32(y_dw, x_dw);
    b0 <- Ops.iVPACKUS_8u32(b0_dw, b1_dw);

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

    mask_d <- Ops.iVPBROADCAST_8u32(pd_mask_s);
    mask <- f8u32_t16u16 mask_d;

    shift_d <- Ops.iVPBROADCAST_8u32(pd_shift_s);
    shift <- f8u32_t16u16 shift_d;

    aux <- (256 %/ 16);
    i <- 0;

    while (i < aux) {
      t <- Ops.iload16u8(Glob.mem, ap + (W64.of_int (8  * i)));
      f_b <- Ops.iVPBROADCAST_2u128_32u8(t);
      f_b <- Ops.iVPSHUFB_256(f_b, shufbidx);

      f <- f32u8_t16u16 f_b;
      f <- Ops.ivpand16u16(f, mask);

      f <- Ops.iVPMULL_16u16(f, shift);
      f <- Ops.iVPMULHRS_256(f, q);

      rp <- fill (fun k => f.[k %% 16]) (16*i) 16 rp;
      i <- i + 1;
    }

    return (rp);
  }

  (*--------------------------------------------------------------------*)
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
    shift1 <- Ops.iVPBROADCAST_16u16(pc_shift1_s);
    mask <- Ops.iVPBROADCAST_16u16(pc_mask_s);
    shift2 <- Ops.iVPBROADCAST_16u16(pc_shift2_s);
    shift2_b <- f16u16_t32u8 shift2; (* FIXME: specific AVX2 op maybe ?? *)
    permidx <- Array8.init (fun i => pc_permidx_s.[i]);

    aux <- (256 %/ 64);
    i <- 0;

    while (i < aux) {
      f0 <- Array16.init (fun j => a.[64*i+j]);
      f1 <- Array16.init (fun j => a.[64*i+16+j]);
      f2 <- Array16.init (fun j => a.[64*i+32+j]);
      f3 <- Array16.init (fun j => a.[64*i+48+j]);
      f0 <- Ops.iVPMULH_256(f0, v);
      f1 <- Ops.iVPMULH_256(f1, v);
      f2 <- Ops.iVPMULH_256(f2, v);
      f3 <- Ops.iVPMULH_256(f3, v);
      f0 <- Ops.iVPMULHRS_256(f0, shift1);
      f1 <- Ops.iVPMULHRS_256(f1, shift1);
      f2 <- Ops.iVPMULHRS_256(f2, shift1);
      f3 <- Ops.iVPMULHRS_256(f3, shift1);
      f0 <- Ops.ivpand16u16(f0, mask);
      f1 <- Ops.ivpand16u16(f1, mask);
      f2 <- Ops.ivpand16u16(f2, mask);
      f3 <- Ops.ivpand16u16(f3, mask);

      f0_b <- Ops.iVPACKUS_16u16(f0, f1);
      f2_b <- Ops.iVPACKUS_16u16(f2, f3);
      f0 <- Ops.iVPMADDUBSW_256(f0_b, shift2_b);
      f2 <- Ops.iVPMADDUBSW_256(f2_b, shift2_b);
      f0_b <- Ops.iVPACKUS_16u16(f0, f2);

      f0_dw <- f32u8_t8u32 f0_b;
      f0_dw <- Ops.iVPERMD(permidx, f0_dw);  (* FIXME: specific AVX2 op maybe ?? *)
      f0_b <- f8u32_t32u8 f0_dw;

      Glob.mem <- Ops.istore32u8(Glob.mem, rp + (W64.of_int (32 * i)), f0_b);
      i <- i + 1;
    }

    return (a);
  }
}.
