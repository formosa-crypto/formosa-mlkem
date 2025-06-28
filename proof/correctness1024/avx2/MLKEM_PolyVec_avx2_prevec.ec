require import AllCore List Int IntDiv CoreMap.

from Jasmin require import JModel.
from JazzEC require import Array4 Array16 Array32 Array128 Array256 Array400 Array1024 Array1408.
from JazzEC require import WArray32 WArray256 WArray512 WArray800 WArray1536 WArray168 WArray800.

require import AVX2_Ops.
from JazzEC require import Jkem1024_avx2.
require import MLKEM_Poly_avx2_prevec.
require import MLKEM_avx2_auxlemmas.

module Mprevec = {
  proc polyvec_add2 (r:W16.t Array1024.t, b:W16.t Array1024.t) : W16.t Array1024.t = {
    var aux: W16.t Array256.t;
    
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_add2 ((Array256.init (fun i => r.[0 + i])),
    (Array256.init (fun i => b.[0 + i])));
    r <- Array1024.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_add2 ((Array256.init (fun i => r.[256 + i])),
    (Array256.init (fun i => b.[256 + i])));
    r <- Array1024.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_add2 ((Array256.init (fun i => r.[(2 * 256) + i])),
    (Array256.init (fun i => b.[(2 * 256) + i])));
    r <- Array1024.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_add2 ((Array256.init (fun i => r.[(3 * 256) + i])),
    (Array256.init (fun i => b.[(3 * 256) + i])));
    r <- Array1024.init
         (fun i => if (3 * 256) <= i < (3 * 256) + 256 then aux.[i-(3 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_csubq (r:W16.t Array1024.t) : W16.t Array1024.t = {
    var aux: W16.t Array256.t;
    
    
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_csubq ((Array256.init (fun i => r.[0 + i])));
    r <- Array1024.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_csubq ((Array256.init (fun i => r.[256 + i])));
    r <- Array1024.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_csubq ((Array256.init (fun i => r.[(2 * 256) + i])));
    r <- Array1024.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_csubq ((Array256.init (fun i => r.[(3 * 256) + i])));
    r <- Array1024.init
         (fun i => if (3 * 256) <= i < (3 * 256) + 256 then aux.[i-(3 * 256)]
         else r.[i]);
    return (r);
  }

  proc polyvec_reduce (r:W16.t Array1024.t) : W16.t Array1024.t = {
    var aux: W16.t Array256.t;
    
    
    
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_reduce ((Array256.init (fun i => r.[0 + i])));
    r <- Array1024.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_reduce ((Array256.init (fun i => r.[256 + i])));
    r <- Array1024.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_reduce ((Array256.init (fun i => r.[(2 * 256) + i])));
    r <- Array1024.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else r.[i]);
    aux <@ MLKEM_Poly_avx2_prevec.Mprevec.poly_reduce ((Array256.init (fun i => r.[(3 * 256) + i])));
    r <- Array1024.init
         (fun i => if (3 * 256) <= i < (3 * 256) + 256 then aux.[i-(3 * 256)]
         else r.[i]);
    return (r);
  }


}.
