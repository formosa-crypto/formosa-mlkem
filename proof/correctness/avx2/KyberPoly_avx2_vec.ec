require import AllCore List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.
require import Array256 Array16p.
require import WArray512.
require import Ops.
require import KyberPoly_avx2.

module Mvec = {
(*
  proc csubq (r:W256.t, qx16:W256.t) : W256.t = {
    var t:W256.t;
    
    r <@ OpsV.ivsub16u256(r, qx16);
    t <@ OpsV.iVPSRA_16u16(r, (W8.of_int 15));
    t <@ OpsV.ivpand16u16(t,qx16);
    r <@ OpsV.ivsub16u256(t, r);
    r <@ OpsV.iVPACKUS_8u32(t, r);

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
*)
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
