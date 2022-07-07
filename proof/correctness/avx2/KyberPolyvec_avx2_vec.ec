require import AllCore List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.
require import Array16 Array32 Array128 Array256 Array400 Array768.
require import WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800.
require import AVX2_Ops.
require import KyberCPA_avx2.
require import KyberPoly_avx2_vec.
require import KyberPolyvec_avx2_prevec.

module Mvec = {
  proc polyvec_add2 (r:W16.t Array768.t, b:W16.t Array768.t) : W16.t Array768.t = {
    var aux: W16.t Array256.t;
    
    aux <@ KyberPoly_avx2_vec.Mvec.poly_add2 ((Array256.init (fun i => r.[0 + i])),
    (Array256.init (fun i => b.[0 + i])));
    r <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ KyberPoly_avx2_vec.Mvec.poly_add2 ((Array256.init (fun i => r.[256 + i])),
    (Array256.init (fun i => b.[256 + i])));
    r <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ KyberPoly_avx2_vec.Mvec.poly_add2 ((Array256.init (fun i => r.[(2 * 256) + i])),
    (Array256.init (fun i => b.[(2 * 256) + i])));
    r <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_csubq (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux: W16.t Array256.t;
    
    
    aux <@ KyberPoly_avx2_vec.Mvec.poly_csubq ((Array256.init (fun i => r.[0 + i])));
    r <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ KyberPoly_avx2_vec.Mvec.poly_csubq ((Array256.init (fun i => r.[256 + i])));
    r <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ KyberPoly_avx2_vec.Mvec.poly_csubq ((Array256.init (fun i => r.[(2 * 256) + i])));
    r <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_reduce (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux: W16.t Array256.t;
    
    
    
    aux <@ KyberPoly_avx2_vec.Mvec.poly_reduce ((Array256.init (fun i => r.[0 + i])));
    r <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ KyberPoly_avx2_vec.Mvec.poly_reduce ((Array256.init (fun i => r.[256 + i])));
    r <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ KyberPoly_avx2_vec.Mvec.poly_reduce ((Array256.init (fun i => r.[(2 * 256) + i])));
    r <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    return (r);
  }

  proc __polyvec_compress (rp:W64.t, a:W16.t Array768.t) : unit = {
    var aux: int;

    var x16p:W16.t Array16.t;
    var v:W256.t;
    var v8:W256.t;
    var off:W256.t;
    var shift1:W256.t;
    var mask:W256.t;
    var shift2:W256.t;
    var sllvdidx:W256.t;
    var shufbidx:W256.t;
    var i:int;
    var f0:W256.t;
    var f1:W256.t;
    var f2:W256.t;
    var t0:W128.t;
    var t1:W128.t;
    x16p <- witness;
    a <@ polyvec_csubq (a);
    x16p <- jvx16;
    v <- (get256 (WArray32.init16 (fun i => x16p.[i])) 0);
    v8 <@ OpsV.iVPSLL_16u16(v, (W8.of_int 3));
    off <@ OpsV.iVPBROADCAST_16u16(pvc_off_s);
    shift1 <@ OpsV.iVPBROADCAST_16u16(pvc_shift1_s);
    mask <@ OpsV.iVPBROADCAST_16u16(pvc_mask_s);
    shift2 <@ OpsV.iVPBROADCAST_4u64(pvc_shift2_s);
    sllvdidx <@ OpsV.iVPBROADCAST_4u64(pvc_sllvdidx_s);
    shufbidx <- (get256 (WArray32.init8 (fun i => pvc_shufbidx_s.[i])) 0);
    aux <- ((3 * 256) %/ 16);
    i <- 0;
    while (i < aux) {
      f0 <- (get256 (WArray1536.init16 (fun i => a.[i])) i);
      f1 <@ OpsV.iVPMULL_16u16(f0, v8);
      f2 <@ OpsV.iVPADD_16u16(f0, off);
      f0 <@ OpsV.iVPSLL_16u16(f0, (W8.of_int 3));
      f0 <@ OpsV.iVPMULH_256(f0, v);
      f2 <@ OpsV.iVPSUB_16u16(f1, f2);
      f1 <@ OpsV.iVPANDN_16u16(f1, f2);
      f1 <@ OpsV.iVPSRL_16u16(f1, (W8.of_int 15));
      f0 <@ OpsV.iVPSUB_16u16(f0, f1);
      f0 <@ OpsV.iVPMULHRS_256(f0, shift1);
      f0 <@ OpsV.iVPAND_16u16(f0, mask);
      f0 <@ OpsV.iVPMADDWD_256(f0, shift2);
      f0 <@ OpsV.iVPSLLV_8u32(f0, sllvdidx);
      f0 <@ OpsV.iVPSRL_4u64(f0, (W8.of_int 12));
      f0 <@ OpsV.iVPSHUFB_256(f0, shufbidx);
      t0 <- (truncateu128 f0);
      t1 <@ OpsV.iVEXTRACTI128(f0, (W8.of_int 1));
      t0 <@ OpsV.iVPBLENDW_128(t0, t1, (W8.of_int 224));
      Glob.mem <-
      storeW128 Glob.mem (W64.to_uint (rp + (W64.of_int (20 * i)))) t0;
      Glob.mem <-
      storeW32 Glob.mem (W64.to_uint (rp + (W64.of_int ((20 * i) + 16)))) (VPEXTR_32 t1
      (W8.of_int 0));
      i <- i + 1;
    }
    return ();
  }
}.

equiv eq_polyvec_add2 :
  Mprevec.polyvec_add2 ~ Mvec.polyvec_add2: ={r, b} ==> ={res}.
proof.
  proc.
  do 3!(wp; call eq_poly_add2).
  auto => />.
qed.

equiv eq_polyvec_csubq :
  Mprevec.polyvec_csubq ~ Mvec.polyvec_csubq: ={r} ==> ={res}.
proof.
  proc.
  do 3!(wp; call eq_poly_csubq).
  auto => />.
qed.

equiv eq_polyvec_reduce :
  Mprevec.polyvec_reduce ~ Mvec.polyvec_reduce: ={r} ==> ={res}.
proof.
  proc.
  do 3!(wp; call eq_poly_reduce).
  auto => />.
qed.

equiv veceq_polyvec_add2 :
  Mvec.polyvec_add2 ~ M.__polyvec_add2: ={r, b} ==> ={res}.
proof.
  proc.
  do 3!(wp; call veceq_poly_add2).
  auto => />.
qed.

equiv veceq_polyvec_csubq :
  Mvec.polyvec_csubq ~ M.__polyvec_csubq: ={r} ==> ={res}.
proof.
  proc.
  do 3!(wp; call veceq_poly_csubq).
  auto => />.
qed.

equiv veceq_polyvec_reduce :
  Mvec.polyvec_reduce ~ M.__polyvec_reduce: ={r} ==> ={res}.
proof.
  proc.
  do 3!(wp; call veceq_poly_reduce).
  auto => />.
qed.

equiv prevec_eq_poly_add2 :
  Mprevec.polyvec_add2 ~ M.__polyvec_add2: ={r, b} ==> ={res}.
proof.
  transitivity Mvec.polyvec_add2 (={r, b} ==> ={res}) (={r, b} ==> ={res}).
smt. trivial.
apply eq_polyvec_add2.
apply veceq_polyvec_add2.
qed.

equiv prevec_eq_poly_csubq :
  Mprevec.polyvec_csubq ~ M.__polyvec_csubq: ={r} ==> ={res}.
proof.
  transitivity Mvec.polyvec_csubq (={r} ==> ={res}) (={r} ==> ={res}).
smt. trivial.
apply eq_polyvec_csubq.
apply veceq_polyvec_csubq.
qed.

equiv prevec_eq_poly_reduce :
  Mprevec.polyvec_reduce ~ M.__polyvec_reduce: ={r} ==> ={res}.
proof.
  transitivity Mvec.polyvec_reduce (={r} ==> ={res}) (={r} ==> ={res}).
smt. trivial.
apply eq_polyvec_reduce.
apply veceq_polyvec_reduce.
qed.
