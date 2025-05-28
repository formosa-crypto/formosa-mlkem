require import AllCore List Int IntDiv CoreMap.

from Jasmin require import JModel.
from JazzEC require import Array16 Array32 Array128 Array256 Array400 Array1024 Array1408.
from JazzEC require import WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800 WArray1408.
require import AVX2_Ops.
from JazzEC require import Jkem1024_avx2.
require import MLKEM_Poly_avx2_vec.
require import MLKEM_PolyVec_avx2_prevec.
require import MLKEM_avx2_auxlemmas.

module Mvec = {
  proc polyvec_add2 (r:W16.t Array1024.t, b:W16.t Array1024.t) : W16.t Array1024.t = {
    var aux: W16.t Array256.t;
    
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_add2 ((Array256.init (fun i => r.[0 + i])),
    (Array256.init (fun i => b.[0 + i])));
    r <- Array1024.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_add2 ((Array256.init (fun i => r.[256 + i])),
    (Array256.init (fun i => b.[256 + i])));
    r <- Array1024.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_add2 ((Array256.init (fun i => r.[(2 * 256) + i])),
    (Array256.init (fun i => b.[(2 * 256) + i])));
    r <- Array1024.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_add2 ((Array256.init (fun i => r.[(3 * 256) + i])),
    (Array256.init (fun i => b.[(3 * 256) + i])));
    r <- Array1024.init
         (fun i => if (3 * 256) <= i < (3 * 256) + 256 then aux.[i-(3 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_csubq (r:W16.t Array1024.t) : W16.t Array1024.t = {
    var aux: W16.t Array256.t;
    
    
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_csubq ((Array256.init (fun i => r.[0 + i])));
    r <- Array1024.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_csubq ((Array256.init (fun i => r.[256 + i])));
    r <- Array1024.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_csubq ((Array256.init (fun i => r.[(2 * 256) + i])));
    r <- Array1024.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_csubq ((Array256.init (fun i => r.[(3 * 256) + i])));
    r <- Array1024.init
         (fun i => if (3 * 256) <= i < (3 * 256) + 256 then aux.[i-(3 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_reduce (r:W16.t Array1024.t) : W16.t Array1024.t = {
    var aux: W16.t Array256.t;
    
    
    
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_reduce ((Array256.init (fun i => r.[0 + i])));
    r <- Array1024.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_reduce ((Array256.init (fun i => r.[256 + i])));
    r <- Array1024.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_reduce ((Array256.init (fun i => r.[(2 * 256) + i])));
    r <- Array1024.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_reduce ((Array256.init (fun i => r.[(3 * 256) + i])));
    r <- Array1024.init
         (fun i => if (3 * 256) <= i < (3 * 256) + 256 then aux.[i-(3 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_frombytes (ap:W64.t) : W16.t Array1024.t = {
    var aux: W16.t Array256.t;
    
    var r:W16.t Array1024.t;
    var pp:W64.t;
    r <- witness;
    pp <- ap;
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_frombytes ((Array256.init (fun i => r.[0 + i])), pp);
    r <- Array1024.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    pp <- (pp + (W64.of_int 384));
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_frombytes ((Array256.init (fun i => r.[256 + i])), pp);
    r <- Array1024.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    pp <- (pp + (W64.of_int 384));
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_frombytes ((Array256.init (fun i => r.[(2 * 256) + i])),
    pp);
    r <- Array1024.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    pp <- (pp + (W64.of_int 384));
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_frombytes ((Array256.init (fun i => r.[(3 * 256) + i])),
    pp);
    r <- Array1024.init
         (fun i => if (3 * 256) <= i < (3 * 256) + 256 then aux.[i-(3 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_tobytes (rp:W64.t, a:W16.t Array1024.t) : unit = {
    var aux: W16.t Array256.t;
    
    var pp:W64.t;
    
    pp <- rp;
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_tobytes (pp, (Array256.init (fun i => a.[0 + i])));
    a <- Array1024.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else a.[i]);
    pp <- (pp + (W64.of_int 384));
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_tobytes (pp, (Array256.init (fun i => a.[256 + i])));
    a <- Array1024.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else a.[i]);
    pp <- (pp + (W64.of_int 384));
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_tobytes (pp, (Array256.init (fun i => a.[(2 * 256) + i])));
    a <- Array1024.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else a.[i]);
    pp <- (pp + (W64.of_int 384));
    aux <@ MLKEM_Poly_avx2_vec.Mvec.poly_tobytes (pp, (Array256.init (fun i => a.[(3 * 256) + i])));
    a <- Array1024.init
         (fun i => if (3 * 256) <= i < (3 * 256) + 256 then aux.[i-(3 * 256)]
         else a.[i]);
    return ();
  }

  proc polyvec_compress_1 (rp:W8.t Array1408.t, a:W16.t Array1024.t) : 
  W8.t Array1408.t = {
    (* 
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
    var t0_d: W32.t;
    x16p <- witness;
    a <@ polyvec_csubq (a);
    x16p <- jvx16;
    v <- (get256 (WArray32.init16 (fun i => x16p.[i])) 0);
    v8 <@ OpsV.iVPSLL_16u16(v, (W128.of_int 3));
    off <@ OpsV.iVPBROADCAST_16u16(pvc_off_s);
    shift1 <@ OpsV.iVPBROADCAST_16u16(pvc_shift1_s);
    mask <@ OpsV.iVPBROADCAST_16u16(pvc_mask_s);
    shift2 <@ OpsV.iVPBROADCAST_4u64(pvc_shift2_s);
    sllvdidx <@ OpsV.iVPBROADCAST_4u64(pvc_sllvdidx_s);
    shufbidx <- (get256 (WArray32.init8 (fun i => pvc_shufbidx_s.[i])) 0);
    aux <- ((4 * 256) %/ 16);
    i <- 0;
    while (i < aux) {
      f0 <- (get256 (WArray1536.init16 (fun i => a.[i])) i);
      f1 <@ OpsV.iVPMULL_16u16(f0, v8);
      f2 <@ OpsV.iVPADD_16u16(f0, off);
      f0 <@ OpsV.iVPSLL_16u16(f0, (W128.of_int 3));
      f0 <@ OpsV.iVPMULH_256(f0, v);
      f2 <@ OpsV.iVPSUB_16u16(f1, f2);
      f1 <@ OpsV.iVPANDN_16u16(f1, f2);
      f1 <@ OpsV.iVPSRL_16u16(f1, (W128.of_int 15));
      f0 <@ OpsV.iVPSUB_16u16(f0, f1);
      f0 <@ OpsV.iVPMULHRS_256(f0, shift1);
      f0 <@ OpsV.iVPAND_16u16(f0, mask);
      f0 <@ OpsV.iVPMADDWD_256(f0, shift2);
      f0 <@ OpsV.iVPSLLV_8u32(f0, sllvdidx);
      f0 <@ OpsV.iVPSRL_4u64(f0, (W128.of_int 12));
      f0 <@ OpsV.iVPSHUFB_256(f0, shufbidx);
      t0 <@ OpsV.itruncate_16u16_8u16(f0);
      t1 <@ OpsV.iVEXTRACTI128_16u8(f0, (W8.of_int 1));
      t0 <@ OpsV.iVPBLENDW_128_16u8(t0, t1, (W8.of_int 224));
      rp <-
      Array1408.init
      (WArray1408.get8 (WArray1408.set128_direct (WArray1408.init8 (fun i_0 => rp.[i_0])) (20 * i) (t0)));
      t0_d <@ OpsV.iVPEXTR_32(t1, (W8.of_int 0));
      rp <-
      Array1408.init
      (WArray1408.get8 (WArray1408.set32_direct (WArray1408.init8 (fun i_0 => rp.[i_0])) ((20 * i) + 16) t0_d));
      i <- i + 1;
    }
    return (rp);
     *)
     return witness;
  }

  proc polyvec_compress (rp:W64.t, a:W16.t Array1024.t) : unit = {
    (*
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
    var t0_d: W32.t;
    x16p <- witness;
    a <@ polyvec_csubq (a);
    x16p <- jvx16;
    v <- (get256 (WArray32.init16 (fun i => x16p.[i])) 0);
    v8 <@ OpsV.iVPSLL_16u16(v, (W128.of_int 3));
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
      f0 <@ OpsV.iVPSLL_16u16(f0, (W128.of_int 3));
      f0 <@ OpsV.iVPMULH_256(f0, v);
      f2 <@ OpsV.iVPSUB_16u16(f1, f2);
      f1 <@ OpsV.iVPANDN_16u16(f1, f2);
      f1 <@ OpsV.iVPSRL_16u16(f1, (W128.of_int 15));
      f0 <@ OpsV.iVPSUB_16u16(f0, f1);
      f0 <@ OpsV.iVPMULHRS_256(f0, shift1);
      f0 <@ OpsV.iVPAND_16u16(f0, mask);
      f0 <@ OpsV.iVPMADDWD_256(f0, shift2);
      f0 <@ OpsV.iVPSLLV_8u32(f0, sllvdidx);
      f0 <@ OpsV.iVPSRL_4u64(f0, (W128.of_int 12));
      f0 <@ OpsV.iVPSHUFB_256(f0, shufbidx);
      t0 <@ OpsV.itruncate_16u16_8u16(f0);
      t1 <@ OpsV.iVEXTRACTI128_16u8(f0, (W8.of_int 1));
      t0 <@ OpsV.iVPBLENDW_128_16u8(t0, t1, (W8.of_int 224));

      Glob.mem <@ OpsV.istore16u8(Glob.mem, rp + W64.of_int (20 * i), t0);

      t0_d <@ OpsV.iVPEXTR_32(t1, (W8.of_int 0));
      Glob.mem <@ OpsV.istore4u8(Glob.mem, rp + (W64.of_int ((20 * i) + 16)), t0_d);

      i <- i + 1;
    } *)

    return ();
  }

  proc polyvec_decompress (rp:W64.t) : W16.t Array1024.t = {
  (*   var aux: int;
    
    var r:W16.t Array1024.t;
    var q:W256.t;
    var shufbidx:W256.t;
    var sllvdidx:W256.t;
    var mask:W256.t;
    var i:int;
    var k:int;
    var f:W256.t;
    r <- witness;
    q <@ OpsV.iVPBROADCAST_8u32(pvd_q_s);
    shufbidx <-
    (get256 (WArray32.init8 (fun i_0 => pvd_shufbdidx_s.[i_0])) 0);
    sllvdidx <@ OpsV.iVPBROADCAST_4u64(pvd_sllvdidx_s);
    mask <@ OpsV.iVPBROADCAST_8u32(pvd_mask_s);
    k <- 0;
    while (k < 3) {
      aux <- (256 %/ 16);
      i <- 0;
      while (i < aux) {
        f <@ OpsV.iload32u8(Glob.mem, rp + (W64.of_int (320 * k + 20 * i)));
        f <@ OpsV.iVPERMQ_32u8(f, (W8.of_int 148));
        f <@ OpsV.iVPSHUFB_256(f, shufbidx);
        f <@ OpsV.iVPSLLV_8u32(f, sllvdidx);
        f <@ OpsV.iVPSRL_16u16(f, (W128.of_int 1));
        f <@ OpsV.iVPAND_16u16(f, mask);
        f <@ OpsV.iVPMULHRS_256(f, q);
        r <-
        Array1024.init
        (WArray1536.get16 (WArray1536.set256 (WArray1536.init16 (fun i_0 => r.[i_0])) ((16 * k) + i) (f)));
        i <- i + 1;
      }
      k <- k + 1;
    }
    return (r); *)
    return witness;

  }
}.

theory MLKEM_PolyVecAVXVec.

import MLKEM_PolyAVXVec.

equiv eq_polyvec_add2 :
  Mprevec.polyvec_add2 ~ Mvec.polyvec_add2: ={r, b} ==> ={res}.
proof.
  proc.
  do 4!(wp; call eq_poly_add2).
  by auto => />.
qed.

equiv eq_polyvec_csubq :
  Mprevec.polyvec_csubq ~ Mvec.polyvec_csubq: ={r} ==> ={res}.
proof.
  proc.
  do 4!(wp; call eq_poly_csubq).
  by auto => />.
qed.


equiv eq_polyvec_reduce :
  Mprevec.polyvec_reduce ~ Mvec.polyvec_reduce: ={r} ==> ={res}.
proof.
  proc.
  do 4!(wp; call eq_poly_reduce).
  by auto => />.
qed.

equiv eq_polyvec_frombytes:
  Mprevec.polyvec_frombytes ~ Mvec.polyvec_frombytes: ={Glob.mem, ap} ==> ={res}.
proof.
  proc.
  do 4!(wp; call eq_poly_frombytes).
  auto => />.
qed.

equiv eq_polyvec_tobytes:
  Mprevec.polyvec_tobytes ~ Mvec.polyvec_tobytes: ={rp, a, Glob.mem} ==> ={Glob.mem, res}.
proof.
  proc.
  do 4!(wp; call eq_poly_tobytes).
  by auto => />.
qed.

lemma set_get8_def1408 (v : W8.t Array1408.t) (w1: W128.t) (w2: W32.t) i j :
  0 <= i < 48 => 0 <= j < 1408 =>
  get8
    (set32_direct
       ((init8
           ("_.[_]"
              ((init
                  (get8
                     (set128_direct
                        ((init (fun (k : int) => v.[k])))%WArray1408
                        (20 * i) w1))))%Array1408)))%WArray1408
       (20 * i + 16) w2) j =
    if (20 * i + 16 <= j < 20 * i + 20) then w2 \bits8 (j %% 4)
    else if (20 * i <= j < 20 * i + 16) then w1 \bits8 (j %% 20)
    else v.[j].
proof.
  move => hx hs; rewrite set32E set128E /get8.
  rewrite initiE 1:/# /= initiE 1:hs /=.
  rewrite initiE 1:/# /= initiE 1:hs /=.
  rewrite initiE 1:hs /=.
  case (20 * i + 16 <= j < 20 * i + 20) => h.
    + move : h => /#.
  case (20 * i <= j < 20 * i + 16) => hh.
    + move : hh => /#.
    + by reflexivity.
qed.


equiv eq_polyvec_compress_1:
  Mprevec.polyvec_compress_1 ~ Mvec.polyvec_compress_1: ={rp, a, Glob.mem} ==> ={Glob.mem, res}.
admitted.

equiv eq_polyvec_compress:
  Mprevec.polyvec_compress ~ Mvec.polyvec_compress: ={rp, a, Glob.mem} ==> ={Glob.mem, res}.
admitted.

equiv eq_polyvec_decompress:
  Mprevec.polyvec_decompress ~ Mvec.polyvec_decompress: ={rp, Glob.mem} ==> ={res}.
admitted.

equiv veceq_polyvec_add2 :
  Mvec.polyvec_add2 ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_add2: ={r, b} ==> ={res}.
proof.
  proc.
  unroll for {2}  2.
  do 4!(wp; call veceq_poly_add2).
  auto => />.
qed.

equiv veceq_polyvec_csubq :
  Mvec.polyvec_csubq ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_csubq: ={r} ==> ={res}.
proof.
  proc.
  unroll for {2}  2.
  do 4!(wp; call veceq_poly_csubq).
  auto => />.
qed.


equiv veceq_polyvec_reduce :
  Mvec.polyvec_reduce ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_reduce: ={r} ==> ={res}.
proof.
  proc.
  unroll for {2}  2.
  do 4!(wp; call veceq_poly_reduce).
  auto => />.
qed.

equiv veceq_polyvec_frombytes :
  Mvec.polyvec_frombytes ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_frombytes: ={Glob.mem, ap} ==> ={res}.
proof.
  proc.
  unroll for {2}  4.
  do 4!(wp; call veceq_poly_frombytes).
  auto => />.
qed.

equiv veceq_polyvec_tobytes :
  Mvec.polyvec_tobytes ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_tobytes: ={Glob.mem, rp, a} ==> ={Glob.mem, res}.
proof.
  proc.
  unroll for {2}  3.
  do 4!(wp; call veceq_poly_tobytes).
  by auto => />.
qed.


equiv veceq_polyvec_compress_1 :
  Mvec.polyvec_compress_1 ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_compress_1: ={Glob.mem, rp, a} ==> ={Glob.mem, res}.
admitted.

equiv veceq_polyvec_compress :
  Mvec.polyvec_compress ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_compress: ={Glob.mem, rp, a} ==> ={Glob.mem, res}.
admitted.

equiv veceq_polyvec_decompress :
  Mvec.polyvec_decompress ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_decompress: ={Glob.mem, rp} ==> ={res}.
admitted.

equiv prevec_eq_polyvec_add2 :
  Mprevec.polyvec_add2 ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_add2: ={r, b} ==> ={res}.
proof.
  transitivity Mvec.polyvec_add2 (={r, b} ==> ={res}) (={r, b} ==> ={res}).
smt(). trivial.
apply eq_polyvec_add2.
apply veceq_polyvec_add2.
qed.


equiv prevec_eq_polyvec_csubq :
  Mprevec.polyvec_csubq ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_csubq: ={r} ==> ={res}.
proof.
  transitivity Mvec.polyvec_csubq (={r} ==> ={res}) (={r} ==> ={res}).
smt(). trivial.
apply eq_polyvec_csubq.
apply veceq_polyvec_csubq.
qed.


equiv prevec_eq_polyvec_reduce :
  Mprevec.polyvec_reduce ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_reduce: ={r} ==> ={res}.
proof.
  transitivity Mvec.polyvec_reduce (={r} ==> ={res}) (={r} ==> ={res}).
smt(). trivial.
apply eq_polyvec_reduce.
apply veceq_polyvec_reduce.
qed.

equiv prevec_eq_polyvec_frombytes :
  Mprevec.polyvec_frombytes ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_frombytes: ={Glob.mem, ap} ==> ={res}.
proof.
  transitivity Mvec.polyvec_frombytes (={Glob.mem, ap} ==> ={res}) (={Glob.mem, ap} ==> ={res}).
  smt(). trivial.
  apply eq_polyvec_frombytes.
  apply veceq_polyvec_frombytes.
qed.

equiv prevec_eq_polyvec_tobytes :
  Mprevec.polyvec_tobytes ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_tobytes: ={rp, a, Glob.mem} ==> ={res, Glob.mem}.
proof.
  transitivity Mvec.polyvec_tobytes (={rp, a, Glob.mem} ==> ={res, Glob.mem}) (={Glob.mem, rp, a} ==> ={res, Glob.mem}).
  smt(). trivial.
  apply eq_polyvec_tobytes.
  apply veceq_polyvec_tobytes.
qed.


equiv prevec_eq_polyvec_compress_1 :
  Mprevec.polyvec_compress_1 ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_compress_1: ={rp, a, Glob.mem} ==> ={res, Glob.mem}.
proof.
  transitivity Mvec.polyvec_compress_1 (={rp, a, Glob.mem} ==> ={res, Glob.mem}) (={Glob.mem, rp, a} ==> ={Glob.mem, res}).
  smt(). trivial.
  proc * => /=; call eq_polyvec_compress_1 => //=.
  apply veceq_polyvec_compress_1.
qed.

equiv prevec_eq_polyvec_compress :
  Mprevec.polyvec_compress ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_compress: ={rp, a, Glob.mem} ==> ={res, Glob.mem}.
proof.
  transitivity Mvec.polyvec_compress (={rp, a, Glob.mem} ==> ={res, Glob.mem}) (={Glob.mem, rp, a} ==> ={res, Glob.mem}).
  smt(). trivial.
  apply eq_polyvec_compress.
  apply veceq_polyvec_compress.
qed.


equiv prevec_eq_polyvec_decompress :
  Mprevec.polyvec_decompress ~Jkem1024_avx2.M(Jkem1024_avx2.Syscall).__polyvec_decompress: ={rp, Glob.mem} ==> ={res}.
proof.
  transitivity Mvec.polyvec_decompress (={rp, Glob.mem} ==> ={res}) (={Glob.mem, rp} ==> ={res}).
  smt(). trivial.
  apply eq_polyvec_decompress.
  apply veceq_polyvec_decompress.
qed.

end MLKEM_PolyVecAVXVec.
