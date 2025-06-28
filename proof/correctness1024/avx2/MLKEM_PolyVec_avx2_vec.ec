require import AllCore List Int IntDiv CoreMap.

from Jasmin require import JModel.
from JazzEC require import Array16 Array32 Array128 Array256 Array400 Array1024 Array1408 Array1410.
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




end MLKEM_PolyVecAVXVec.
