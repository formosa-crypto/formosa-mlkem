require import AllCore List Int IntDiv CoreMap.

from Jasmin require import JModel.
from JazzEC require import Array4 Array16 Array32 Array128 Array256 Array400 Array768 Array960.
from JazzEC require import WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800.

require import AVX2_Ops.
from JazzEC require import Jkem768_avx2.
require import MLKEM_Poly_avx2_prevec.
require import MLKEM_avx2_auxlemmas.

module Mprevec = {
  proc polyvec_add2 (r:W16.t Array768.t, b:W16.t Array768.t) : W16.t Array768.t = {
    var aux: W16.t Array256.t;
    
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_add2 ((Array256.init (fun i => r.[0 + i])),
    (Array256.init (fun i => b.[0 + i])));
    r <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_add2 ((Array256.init (fun i => r.[256 + i])),
    (Array256.init (fun i => b.[256 + i])));
    r <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_add2 ((Array256.init (fun i => r.[(2 * 256) + i])),
    (Array256.init (fun i => b.[(2 * 256) + i])));
    r <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_csubq (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux: W16.t Array256.t;
    
    
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_csubq ((Array256.init (fun i => r.[0 + i])));
    r <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_csubq ((Array256.init (fun i => r.[256 + i])));
    r <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_csubq ((Array256.init (fun i => r.[(2 * 256) + i])));
    r <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_reduce (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux: W16.t Array256.t;
    
    
    
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_reduce ((Array256.init (fun i => r.[0 + i])));
    r <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_reduce ((Array256.init (fun i => r.[256 + i])));
    r <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_reduce ((Array256.init (fun i => r.[(2 * 256) + i])));
    r <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_frombytes (ap:W64.t) : W16.t Array768.t = {
    var aux: W16.t Array256.t;
    
    var r:W16.t Array768.t;
    var pp:W64.t;
    r <- witness;
    pp <- ap;
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_frombytes ((Array256.init (fun i => r.[0 + i])), pp);
    r <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    pp <- (pp + (W64.of_int 384));
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_frombytes ((Array256.init (fun i => r.[256 + i])), pp);
    r <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    pp <- (pp + (W64.of_int 384));
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_frombytes ((Array256.init (fun i => r.[(2 * 256) + i])),
    pp);
    r <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_tobytes (rp:W64.t, a:W16.t Array768.t) : unit = {
    var aux: W16.t Array256.t;
    
    var pp:W64.t;
    
    pp <- rp;
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_tobytes (pp, (Array256.init (fun i => a.[0 + i])));
    a <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else a.[i]);
    pp <- (pp + (W64.of_int 384));
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_tobytes (pp, (Array256.init (fun i => a.[256 + i])));
    a <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else a.[i]);
    pp <- (pp + (W64.of_int 384));
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_tobytes (pp, (Array256.init (fun i => a.[(2 * 256) + i])));
    a <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else a.[i]);
    return ();
  }

  proc polyvec_compress_1 (rp:W8.t Array960.t, a:W16.t Array768.t) : W8.t Array960.t = {
    var aux: int;

    var v:t16u16;
    var v8:t16u16;
    var off:t16u16;
    var shift1:t16u16;
    var mask:t16u16;
    var shift2:t16u16;
    var shift2_q:t4u64;
    var sllvdidx:t8u32;
    var sllvdidx_q:t4u64;
    var shufbidx:t32u8;
    var i:int;
    var f0:t16u16;
    var f1:t16u16;
    var f2:t16u16;
    var t0:t16u8;
    var t1:t16u8;
    var f0_b:t32u8;
    var f0_d:t8u32;
    var f0_q:t4u64;
    var t0_d:t4u8;

    a <@ polyvec_csubq (a);

    v <- jvx16;
    v8 <@ Ops.iVPSLL_16u16(v, (W8.of_int 3));
    off <@ Ops.iVPBROADCAST_16u16(pvc_off_s);
    shift1 <@ Ops.iVPBROADCAST_16u16(pvc_shift1_s);
    mask <@ Ops.iVPBROADCAST_16u16(pvc_mask_s);
    shift2_q <@ Ops.iVPBROADCAST_4u64(pvc_shift2_s);
    shift2 <- f4u64_t16u16 shift2_q;
    sllvdidx_q <@ Ops.iVPBROADCAST_4u64(pvc_sllvdidx_s);
    sllvdidx <- f4u64_t8u32 sllvdidx_q;
    shufbidx <- pvc_shufbidx_s;

    aux <- ((3 * 256) %/ 16);
    i <- 0;

    while (i < aux) {
      f0 <- Array16.init (fun j => a.[16 * i + j]);
      f1 <@ Ops.iVPMULL_16u16(f0, v8);
      f2 <@ Ops.iVPADD_16u16(f0, off);
      f0 <@ Ops.iVPSLL_16u16(f0, (W8.of_int 3));
      f0 <@ Ops.iVPMULH_256(f0, v);
      f2 <@ Ops.iVPSUB_16u16(f1, f2);
      f1 <@ Ops.iVPANDN_16u16(f1, f2);
      f1 <@ Ops.iVPSRL_16u16(f1, (W8.of_int 15));
      f0 <@ Ops.iVPSUB_16u16(f0, f1);
      f0 <@ Ops.iVPMULHRS_256(f0, shift1);
      f0 <@ Ops.iVPAND_16u16(f0, mask);
      f0_d <@ Ops.iVPMADDWD_256(f0, shift2);

      f0_d <@ Ops.iVPSLLV_8u32(f0_d, sllvdidx);

      f0_q <- f8u32_t4u64 f0_d;
      f0_q <@ Ops.iVPSRL_4u64(f0_q, (W8.of_int 12));

      f0_b <- f4u64_t32u8 f0_q;
      f0_b <@ Ops.iVPSHUFB_256(f0_b, shufbidx);

      f0 <- f32u8_t16u16 f0_b;
      t0 <@ Ops.itruncate_16u16_8u16(f0);
      t1 <@ Ops.iVEXTRACTI128_16u8(f0, (W8.of_int 1));
      t0 <@ Ops.iVPBLENDW_128_16u8(t0, t1, (W8.of_int 224));

      rp <- Array960.fill (fun j => t0.[j %% 20]) (20*i) 16 rp;
      t0_d <@ Ops.iVPEXTR_32(t1, (W8.of_int 0));
      rp <- Array960.fill (fun j => t0_d.[j %% 4]) (20*i + 16) 4 rp;
      i <- i + 1;
    }
    return (rp);
  }

  proc polyvec_compress (rp:W64.t, a:W16.t Array768.t) : unit = {
    var aux: int;

    var v:t16u16;
    var v8:t16u16;
    var off:t16u16;
    var shift1:t16u16;
    var mask:t16u16;
    var shift2:t16u16;
    var shift2_q:t4u64;
    var sllvdidx:t8u32;
    var sllvdidx_q:t4u64;
    var shufbidx:t32u8;
    var i:int;
    var f0:t16u16;
    var f1:t16u16;
    var f2:t16u16;
    var t0:t16u8;
    var t1:t16u8;
    var f0_b:t32u8;
    var f0_d:t8u32;
    var f0_q:t4u64;
    var t0_d:t4u8;

    a <@ polyvec_csubq (a);

    v <- jvx16;
    v8 <@ Ops.iVPSLL_16u16(v, (W8.of_int 3));
    off <@ Ops.iVPBROADCAST_16u16(pvc_off_s);
    shift1 <@ Ops.iVPBROADCAST_16u16(pvc_shift1_s);
    mask <@ Ops.iVPBROADCAST_16u16(pvc_mask_s);
    shift2_q <@ Ops.iVPBROADCAST_4u64(pvc_shift2_s);
    shift2 <- f4u64_t16u16 shift2_q;
    sllvdidx_q <@ Ops.iVPBROADCAST_4u64(pvc_sllvdidx_s);
    sllvdidx <- f4u64_t8u32 sllvdidx_q;
    shufbidx <- pvc_shufbidx_s;

    aux <- ((3 * 256) %/ 16);
    i <- 0;

    while (i < aux) {
      f0 <- Array16.init (fun j => a.[16 * i + j]);
      f1 <@ Ops.iVPMULL_16u16(f0, v8);
      f2 <@ Ops.iVPADD_16u16(f0, off);
      f0 <@ Ops.iVPSLL_16u16(f0, (W8.of_int 3));
      f0 <@ Ops.iVPMULH_256(f0, v);
      f2 <@ Ops.iVPSUB_16u16(f1, f2);
      f1 <@ Ops.iVPANDN_16u16(f1, f2);
      f1 <@ Ops.iVPSRL_16u16(f1, (W8.of_int 15));
      f0 <@ Ops.iVPSUB_16u16(f0, f1);
      f0 <@ Ops.iVPMULHRS_256(f0, shift1);
      f0 <@ Ops.iVPAND_16u16(f0, mask);
      f0_d <@ Ops.iVPMADDWD_256(f0, shift2);

      f0_d <@ Ops.iVPSLLV_8u32(f0_d, sllvdidx);

      f0_q <- f8u32_t4u64 f0_d;
      f0_q <@ Ops.iVPSRL_4u64(f0_q, (W8.of_int 12));

      f0_b <- f4u64_t32u8 f0_q;
      f0_b <@ Ops.iVPSHUFB_256(f0_b, shufbidx);

      f0 <- f32u8_t16u16 f0_b;
      t0 <@ Ops.itruncate_16u16_8u16(f0);
      t1 <@ Ops.iVEXTRACTI128_16u8(f0, (W8.of_int 1));
      t0 <@ Ops.iVPBLENDW_128_16u8(t0, t1, (W8.of_int 224));

      Glob.mem <@ Ops.istore16u8(Glob.mem, rp + (W64.of_int (20 * i)), t0);
      t0_d <@ Ops.iVPEXTR_32(t1, (W8.of_int 0));
      Glob.mem <@ Ops.istore4u8(Glob.mem, rp + (W64.of_int ((20 * i) + 16)), t0_d);


      i <- i + 1;
    }
    return ();
  }

  proc polyvec_decompress (rp:W64.t) : W16.t Array768.t = {
    var aux: int;
    
    var r:W16.t Array768.t;
    var q: t16u16;
    var q_d: t8u32;
    var shufbidx:t32u8;
    var sllvdidx:t8u32;
    var sllvdidx_q:t4u64;
    var mask:t16u16;
    var mask_d:t8u32;
    var i:int;
    var k:int;
    var f:t16u16;
    var f_b:t32u8;
    var f_d:t8u32;

    r <- witness;
    q_d <@ Ops.iVPBROADCAST_8u32(pvd_q_s);
    q <- f8u32_t16u16 q_d;

    shufbidx <- pvd_shufbdidx_s;
    sllvdidx_q <@ Ops.iVPBROADCAST_4u64(pvd_sllvdidx_s);
    sllvdidx <- f4u64_t8u32 sllvdidx_q;

    mask_d <@ Ops.iVPBROADCAST_8u32(pvd_mask_s);
    mask <- f8u32_t16u16 mask_d;

    k <- 0;
    while (k < 3) {
      aux <- (256 %/ 16);
      i <- 0;
      while (i < aux) {
        f_b <@ Ops.iload32u8(Glob.mem, rp + (W64.of_int (320 * k + 20 * i)));
        f_b <@ Ops.iVPERMQ_32u8(f_b, (W8.of_int 148));
        f_b <@ Ops.iVPSHUFB_256(f_b, shufbidx);

        f_d <- f32u8_t8u32 f_b;
        f_d <@ Ops.iVPSLLV_8u32(f_d, sllvdidx);
        f <- f8u32_t16u16 f_d;

        f <@ Ops.iVPSRL_16u16(f, (W8.of_int 1));
        f <@ Ops.iVPAND_16u16(f, mask);
        f <@ Ops.iVPMULHRS_256(f, q);
        r <- Array768.fill (fun j => f.[j %% 16]) (256 * k + 16 * i) 16 r;
        i <- i + 1;
      }
      k <- k + 1;
    }
    return (r);
  }
}.
