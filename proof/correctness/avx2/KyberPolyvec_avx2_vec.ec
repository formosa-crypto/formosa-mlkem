require import AllCore List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.
require import Array16 Array32 Array128 Array256 Array400 Array768.
require import WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800.
require import Ops.
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
}.

equiv eq_polyvec_add2 :
  Mavx2_prevec.polyvec_add2 ~ Mvec.polyvec_add2: ={r, b} ==> ={res}.
proof.
  proc.
  do 3!(wp; call eq_poly_add2).
  auto => />.
qed.

equiv eq_polyvec_csubq :
  Mavx2_prevec.polyvec_csubq ~ Mvec.polyvec_csubq: ={r} ==> ={res}.
proof.
  proc.
  do 3!(wp; call eq_poly_csubq).
  auto => />.
qed.

equiv eq_polyvec_reduce :
  Mavx2_prevec.polyvec_reduce ~ Mvec.polyvec_reduce: ={r} ==> ={res}.
proof.
  proc.
  do 3!(wp; call eq_poly_reduce).
  auto => />.
qed.

equiv veceq_polyvec_add2 :
  Mvec.polyvec_add2 ~ M.polyvec_add2: ={r, b} ==> ={res}.
proof.
  proc.
  do 3!(wp; call veceq_poly_add2).
  auto => />.
qed.

equiv veceq_polyvec_csubq :
  Mvec.polyvec_csubq ~ M.polyvec_csubq: ={r} ==> ={res}.
proof.
  proc.
  do 3!(wp; call veceq_poly_csubq).
  auto => />.
qed.

equiv veceq_polyvec_reduce :
  Mvec.polyvec_reduce ~ M.polyvec_reduce: ={r} ==> ={res}.
proof.
  proc.
  do 3!(wp; call veceq_poly_reduce).
  auto => />.
qed.

equiv prevec_eq_poly_add2 :
  Mavx2_prevec.polyvec_add2 ~ M.polyvec_add2: ={r, b} ==> ={res}.
proof.
  transitivity Mvec.polyvec_add2 (={r, b} ==> ={res}) (={r, b} ==> ={res}).
smt. trivial.
apply eq_polyvec_add2.
apply veceq_polyvec_add2.
qed.

equiv prevec_eq_poly_csubq :
  Mavx2_prevec.polyvec_csubq ~ M.polyvec_csubq: ={r} ==> ={res}.
proof.
  transitivity Mvec.polyvec_csubq (={r} ==> ={res}) (={r} ==> ={res}).
smt. trivial.
apply eq_polyvec_csubq.
apply veceq_polyvec_csubq.
qed.

equiv prevec_eq_poly_reduce :
  Mavx2_prevec.polyvec_reduce ~ M.polyvec_reduce: ={r} ==> ={res}.
proof.
  transitivity Mvec.polyvec_reduce (={r} ==> ={res}) (={r} ==> ={res}).
smt. trivial.
apply eq_polyvec_reduce.
apply veceq_polyvec_reduce.
qed.
