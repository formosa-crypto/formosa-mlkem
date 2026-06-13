require import AllCore List Int IntDiv CoreMap Real Number Ring StdOrder BitEncoding.

from Jasmin require import JModel.
from JazzEC require import Array256 Array128  Array16.
from JazzEC require import Array256 Array128 Array32 Array16 Array768 Array2304.

require import MLKEMFCLib.
require import MLKEM_W16_Rep.
require import MLKEM768_prelude.
require import NTT_Fq.
require import AVX2_Ops.

from Spec require import GFq Rq Serialization VecMat Correctness.
import VecMat Serialization.
import MLKEMFCLib768.

import Zq IntOrder BitReverse.
import PolyVec PolyMat.
require import NTT_avx2_poly.

theory NTT_Avx2.


abbrev shuffle8_idx = Array32.of_list witness
  [0; 1; 2; 3; 4; 5; 6; 7; 16; 17; 18; 19; 20; 21; 22; 23;
   8; 9; 10; 11; 12; 13; 14; 15; 24; 25; 26; 27; 28; 29; 30; 31].

abbrev shuffle4_idx = Array32.of_list witness
  [0; 1; 2; 3; 16; 17; 18; 19; 8; 9; 10; 11; 24; 25; 26; 27;
   4; 5; 6; 7; 20; 21; 22; 23; 12; 13; 14; 15; 28; 29; 30; 31].

abbrev shuffle2_idx = Array32.of_list witness
  [0; 1; 16; 17; 4; 5; 20; 21; 8; 9; 24; 25; 12; 13; 28; 29;
   2; 3; 18; 19; 6; 7; 22; 23; 10; 11; 26; 27; 14; 15; 30; 31].

abbrev shuffle1_idx = Array32.of_list witness
  [0; 16; 2; 18; 4; 20; 6; 22; 8; 24; 10; 26; 12; 28; 14; 30;
   1; 17; 3; 19; 5; 21; 7; 23; 9; 25; 11; 27; 13; 29; 15; 31].

op shuf8 (a b: 'a Array16.t) : ('a Array16.t * 'a Array16.t) =
  let c = Array32.init (fun i => if 16 <= i then b.[i %% 16] else a.[i]) in
  let cr = Array32.init (fun i => c.[shuffle8_idx.[i]]) in
  let ar = Array16.init (fun i => cr.[i]) in
  let br = Array16.init (fun i => cr.[i + 16]) in
  (ar, br).

op shuf4 (a b: 'a Array16.t) : ('a Array16.t * 'a Array16.t) =
  let c = Array32.init (fun i => if 16 <= i then b.[i %% 16] else a.[i]) in
  let cr = Array32.init (fun i => c.[shuffle4_idx.[i]]) in
  let ar = Array16.init (fun i => cr.[i]) in
  let br = Array16.init (fun i => cr.[i + 16]) in
  (ar, br).

op shuf2 (a b: 'a Array16.t) : ('a Array16.t * 'a Array16.t) =
  let c = Array32.init (fun i => if 16 <= i then b.[i %% 16] else a.[i]) in
  let cr = Array32.init (fun i => c.[shuffle2_idx.[i]]) in
  let ar = Array16.init (fun i => cr.[i]) in
  let br = Array16.init (fun i => cr.[i + 16]) in
  (ar, br).

op shuf1 (a b: 'a Array16.t) : ('a Array16.t * 'a Array16.t) =
  let c = Array32.init (fun i => if 16 <= i then b.[i %% 16] else a.[i]) in
  let cr = Array32.init (fun i => c.[shuffle1_idx.[i]]) in
  let ar = Array16.init (fun i => cr.[i]) in
  let br = Array16.init (fun i => cr.[i + 16]) in
  (ar, br).

op nttunpackv(v : 'a Array768.t) = 
   Array768.init (fun i =>
      if 0 <= i < 256 
      then (nttunpack (subarray256 v 0)).[i]
      else if 256 <= i < 512
           then (nttunpack (subarray256 v 1)).[i-256]
           else (nttunpack (subarray256 v 2)).[i-512]).

op nttpackv(v : 'a Array768.t) = 
   Array768.init (fun i =>
      if 0 <= i < 256 
      then (nttpack (subarray256 v 0)).[i]
      else if 256 <= i < 512
           then (nttpack (subarray256 v 1)).[i-256]
           else (nttpack (subarray256 v 2)).[i-512]).

op nttunpackm(v : 'a Array2304.t) = 
   Array2304.init (fun i =>
      if 0 <= i < 768 
      then (nttunpackv (subarray768 v 0)).[i]
      else if 768 <= i < 2*768
           then (nttunpackv (subarray768 v 1)).[i-768]
           else (nttunpackv (subarray768 v 2)).[i-2*768]).

op nttpackm(v : 'a Array2304.t) = 
   Array2304.init (fun i =>
      if 0 <= i < 768 
      then (nttpackv (subarray768 v 0)).[i]
      else if 768 <= i < 2*768
           then (nttpackv (subarray768 v 1)).[i-768]
           else (nttpackv (subarray768 v 2)).[i-2*768]).

lemma nttpackv_sub (v : 'a Array768.t) P :
   (all P (nttpack (subarray256 v 0)) /\
    all P (nttpack (subarray256 v 1)) /\
    all P (nttpack (subarray256 v 2))) <=>
    all P (nttpackv v).
rewrite !allP  /nttpackv;split.
+ move => [H0 [H1 H2]] i ib. 
  rewrite initiE //= /#.
move => H; do split => i ib.
+ move : (H i _); 1: smt().
  rewrite initiE //= /#.
+ move : (H (i+256) _); 1: smt().
  rewrite initiE //= /#.
move : (H (i+512) _); 1: smt().
rewrite initiE //= /#.
qed.

lemma nttunpackv_sub (v : 'a Array768.t) P :
   (all P (nttunpack (subarray256 v 0)) /\
    all P (nttunpack (subarray256 v 1)) /\
    all P (nttunpack (subarray256 v 2))) <=>
    all P (nttunpackv v).
rewrite !allP  /nttunpackv;split.
+ move => [H0 [H1 H2]] i ib. 
  rewrite initiE //= /#.
move => H; do split => i ib.
+ move : (H i _); 1: smt().
  rewrite initiE //= /#.
+ move : (H (i+256) _); 1: smt().
  rewrite initiE //= /#.
move : (H (i+512) _); 1: smt().
rewrite initiE //= /#.
qed.

lemma all768 (P: 'a -> bool) (v : 'a Array768.t) :
  all P (subarray256 v 0) /\ all P (subarray256 v 1) /\ all P (subarray256 v 2) <=> all P v.
rewrite !allP /subarray256; split => />.
move => H1 H2 H3 i Hi1 Hi2.
 case (0 <= i < 256) => Hi3. move :(H1 i). rewrite initiE /= 1..2:/#. 
 case (256 <= i < 512) => Hi4. move :(H2 (i-256)). rewrite initiE /= 1..2:/#. 
 move :(H3 (i-512)). rewrite initiE /= /#. 
move => H1. split. move => i Hi1 Hi2. rewrite initiE // H1 1:/#.
split. move => i Hi1 Hi2. rewrite initiE => />. move :(H1 (256+i)). smt().
move => i Hi1 Hi2. rewrite initiE => />. move :(H1 (512+i)). smt(). qed.

lemma nttpackv_pred (v : 'a Array768.t) P: 
   (all P (nttpackv v)) <=>
   (all P v).
rewrite -nttpackv_sub !nttpack_pred. rewrite all768 //.
qed.

lemma nttunpackv_pred (v : 'a Array768.t) P: 
   (all P (nttunpackv v)) <=>
   (all P v).
rewrite -nttunpackv_sub !nttunpack_pred. rewrite all768 //.
qed.

lemma packvK : cancel nttpackv<:'a> nttunpackv.
rewrite /cancel /= => x.
rewrite tP => k kb. 
rewrite /nttpackv /nttunpackv.
rewrite initiE //=.
case (0 <= k && k < 256).
+ move =>*.
  rewrite /subarray256 /nttunpack initiE //= initiE //=. smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k].
  rewrite initiE //=.  smt(nttunpack_bnd Array256.allP).
  rewrite ifT. smt(nttunpack_bnd Array256.allP).
  rewrite /nttpack initiE //=. smt(nttunpack_bnd Array256.allP).
  pose b := nttpack_idx.[a].
  rewrite initiE //=.  smt(nttunpack_bnd nttpack_bnd Array256.allP).
  move : nttpack_idxK; rewrite allP /= => H.
  rewrite /a /b H; smt(mem_iota nttunpack_bnd nttpack_bnd Array256.allP).

case (256 <= k && k < 512).
+ move =>*.
  rewrite /subarray256 /nttunpack initiE //=. smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k-256].
  rewrite initiE //=.  smt(nttunpack_bnd Array256.allP).
  rewrite /nttpack initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite ifF. smt(nttunpack_bnd Array256.allP).
  rewrite ifT. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=.  smt(nttunpack_bnd nttpack_bnd Array256.allP).
  pose b := nttpack_idx.[a].
  move : nttpack_idxK; rewrite allP /= => H.
  rewrite initiE //=.  smt(nttunpack_bnd nttpack_bnd Array256.allP).
  rewrite /a /b H; smt(mem_iota nttunpack_bnd nttpack_bnd Array256.allP).

move =>*.
rewrite /subarray256 /nttunpack initiE //=. smt(nttunpack_bnd Array256.allP).
pose a := nttunpack_idx.[k-512].
rewrite initiE //=.  smt(nttunpack_bnd Array256.allP).
rewrite /nttpack initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite ifF. smt(nttunpack_bnd Array256.allP).
rewrite ifF. smt(nttunpack_bnd Array256.allP).
rewrite initiE //=.  smt(nttunpack_bnd nttpack_bnd Array256.allP).
pose b := nttpack_idx.[a].
move : nttpack_idxK; rewrite allP /= => H.
rewrite initiE //=.  smt(nttunpack_bnd nttpack_bnd Array256.allP).
rewrite /a /b H; smt(mem_iota nttunpack_bnd nttpack_bnd Array256.allP).
qed.

lemma unpackvK : cancel nttunpackv<:'a> nttpackv.
rewrite /cancel /= => x.
rewrite tP => k kb. 
rewrite /nttpackv /nttunpackv.
rewrite initiE //=.
case (0 <= k && k < 256).
+ move =>*.
  rewrite /subarray256 /nttpack initiE //= initiE //=. smt(nttpack_bnd Array256.allP).
  pose a := nttpack_idx.[k].
  rewrite initiE //=.  smt(nttpack_bnd Array256.allP).
  rewrite ifT. smt(nttpack_bnd Array256.allP).
  rewrite /nttunpack initiE //=. smt(nttpack_bnd Array256.allP).
  pose b := nttunpack_idx.[a].
  rewrite initiE //=.  smt(nttunpack_bnd nttpack_bnd Array256.allP).
  move : nttunpack_idxK; rewrite allP /= => H.
  rewrite /a /b H; smt(mem_iota nttunpack_bnd nttpack_bnd Array256.allP).

case (256 <= k && k < 512).
+ move =>*.
  rewrite /subarray256 /nttpack initiE //=. smt(nttpack_bnd Array256.allP).
  pose a := nttpack_idx.[k-256].
  rewrite initiE //=.  smt(nttpack_bnd Array256.allP).
  rewrite /nttunpack initiE //=. smt(nttpack_bnd Array256.allP).
  rewrite ifF. smt(nttpack_bnd Array256.allP).
  rewrite ifT. smt(nttpack_bnd Array256.allP).
  rewrite initiE //=.  smt(nttunpack_bnd nttpack_bnd Array256.allP).
  pose b := nttunpack_idx.[a].
  move : nttunpack_idxK; rewrite allP /= => H.
  rewrite initiE //=.  smt(nttunpack_bnd nttpack_bnd Array256.allP).
  rewrite /a /b H; smt(mem_iota nttunpack_bnd nttpack_bnd Array256.allP).

move =>*.
rewrite /subarray256 /nttpack initiE //=. smt(nttpack_bnd Array256.allP).
pose a := nttpack_idx.[k-512].
rewrite initiE //=.  smt(nttpack_bnd Array256.allP).
rewrite /nttunpack initiE //=. smt(nttpack_bnd Array256.allP).
rewrite ifF. smt(nttpack_bnd Array256.allP).
rewrite ifF. smt(nttpack_bnd Array256.allP).
rewrite initiE //=.  smt(nttunpack_bnd nttpack_bnd Array256.allP).
pose b := nttunpack_idx.[a].
move : nttunpack_idxK; rewrite allP /= => H.
rewrite initiE //=.  smt(nttunpack_bnd nttpack_bnd Array256.allP).
rewrite /a /b H; smt(mem_iota nttunpack_bnd nttpack_bnd Array256.allP).
qed.

lemma nttpackv_lift (v  :W16.t Array768.t) :
   nttpackv (lift_array768 v) = lift_array768 (nttpackv v).
rewrite /nttpackv /lift_array768 /subarray256 tP => k kb.
rewrite mapiE //= !initiE //=.
case (0 <= k && k < 256).
+ move => kbb.
  rewrite /nttpack initiE //= initiE //=; 1: smt(Array256.allP nttpack_bnd).
  rewrite mapiE //=; 1: smt(Array256.allP nttpack_bnd).
  congr;congr. 
  rewrite /pack. smt(Array768.initiE Array256.initiE Array256.allP nttpack_bnd).
move => *;case (256 <= k && k < 512).
+ move => kbb.
  rewrite /nttpack initiE //=; 1: smt(Array256.allP nttpack_bnd).
  rewrite initiE //=; 1: smt(Array256.allP nttpack_bnd).
  rewrite mapiE //=; 1: smt(Array256.allP nttpack_bnd).
  congr;congr. 
  rewrite /pack. smt(Array768.initiE Array256.initiE Array256.allP nttpack_bnd).
move => kbb.
rewrite /nttpack initiE //=; 1: smt(Array256.allP nttpack_bnd).
rewrite initiE //=; 1: smt(Array256.allP nttpack_bnd).
rewrite mapiE //=; 1: smt(Array256.allP nttpack_bnd).
congr;congr. 
rewrite /pack. smt(Array768.initiE Array256.initiE Array256.allP nttpack_bnd).
qed.

lemma nttunpackv_lift (v  :W16.t Array768.t) :
   nttunpackv (lift_array768 v) = lift_array768 (nttunpackv v).
rewrite /nttunpackv /lift_array768 /subarray256 tP => k kb.
rewrite mapiE //= !initiE //=.
case (0 <= k && k < 256).
+ move => kbb.
  rewrite /nttunpack initiE //= initiE //=; 1: smt(Array256.allP nttunpack_bnd).
  rewrite mapiE //=; 1: smt(Array256.allP nttunpack_bnd).
  congr;congr. 
  rewrite /unpack. smt(Array768.initiE Array256.initiE Array256.allP nttunpack_bnd).
move => *;case (256 <= k && k < 512).
+ move => kbb.
  rewrite /nttunpack initiE //=; 1: smt(Array256.allP nttunpack_bnd).
  rewrite initiE //=; 1: smt(Array256.allP nttunpack_bnd).
  rewrite mapiE //=; 1: smt(Array256.allP nttunpack_bnd).
  congr;congr. 
  rewrite /unpack. smt(Array768.initiE Array256.initiE Array256.allP nttunpack_bnd).
move => kbb.
rewrite /nttunpack initiE //=; 1: smt(Array256.allP nttunpack_bnd).
rewrite initiE //=; 1: smt(Array256.allP nttunpack_bnd).
rewrite mapiE //=; 1: smt(Array256.allP nttunpack_bnd).
congr;congr. 
rewrite /unpack. smt(Array768.initiE Array256.initiE Array256.allP nttunpack_bnd).
qed.

lemma nttunpackv_mapsint (v  :W16.t Array768.t) :
   nttunpackv (map W16.to_sint v) = map W16.to_sint (nttunpackv v).
rewrite /nttunpackv /subarray256 tP => k kb.
rewrite mapiE //= !initiE //=.
case (0 <= k && k < 256).
+ move => kbb.
  rewrite /nttunpack initiE //= initiE //=; 1: smt(Array256.allP nttunpack_bnd).
  rewrite mapiE //=; 1: smt(Array256.allP nttunpack_bnd).
  congr. 
  rewrite /unpack. smt(Array768.initiE Array256.initiE Array256.allP nttunpack_bnd).
move => *;case (256 <= k && k < 512).
+ move => kbb.
  rewrite /nttunpack initiE //=; 1: smt(Array256.allP nttunpack_bnd).
  rewrite initiE //=; 1: smt(Array256.allP nttunpack_bnd).
  rewrite mapiE //=; 1: smt(Array256.allP nttunpack_bnd).
  congr. 
  rewrite /unpack. smt(Array768.initiE Array256.initiE Array256.allP nttunpack_bnd).
move => kbb.
rewrite /nttunpack initiE //=; 1: smt(Array256.allP nttunpack_bnd).
rewrite initiE //=; 1: smt(Array256.allP nttunpack_bnd).
rewrite mapiE //=; 1: smt(Array256.allP nttunpack_bnd).
congr. 
rewrite /unpack. smt(Array768.initiE Array256.initiE Array256.allP nttunpack_bnd).
qed.


lemma init_unpack (v : 'a Array768.t) :
  Array256.init ("_.[_]" (nttunpackv v)) = nttunpack (Array256.init ("_.[_]" v)).
rewrite /nttunpackv /nttunpack tP => k kb.
rewrite !initiE //= 1: /# kb /=.
pose a:= nttunpack_idx.[k].
rewrite initiE //=.
qed.

lemma init_unpack1 (v : 'a Array768.t) :
  Array256.init (fun (i : int) => (nttunpackv v).[256 + i]) = nttunpack (Array256.init (fun (i : int) => v.[256 + i])).
rewrite /nttunpackv /nttunpack tP => k kb.
rewrite initiE //=.
rewrite initiE //=. smt().
rewrite ifF 1:/#.
rewrite ifT 1:/#.
rewrite initiE //=.
pose a:= nttunpack_idx.[k].
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite initiE //=.
rewrite -/a initiE //=.
 smt(nttunpack_bnd Array256.allP).
qed.

lemma init_unpack2 (v : 'a Array768.t) :
  Array256.init (fun (i : int) => (nttunpackv v).[512 + i]) = nttunpack (Array256.init (fun (i : int) => v.[512 + i])).
rewrite /nttunpackv /nttunpack tP => k kb.
rewrite initiE //=.
rewrite initiE //=. smt().
rewrite ifF 1:/#.
rewrite ifF 1:/#.
rewrite initiE //=.
pose a:= nttunpack_idx.[k].
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite initiE //=.
rewrite -/a initiE //=.
 smt(nttunpack_bnd Array256.allP).
qed.

require import NTT_AVX_Fq NTT_AVX_j.

import KMatrix.
import Vector.
lemma polyvec_ntt_avx2_corr _r :
  phoare [Jkem_avx2.M.__polyvec_ntt :
     r = _r /\ signed_bound768_cxq r 0 768 2==>
    nttv (lift_polyvec _r) = lift_polyvec (nttpackv res) /\
   pos_bound768_cxq res 0 768 2] = 1%r.
proc. 
unroll for 2.
wp;call (poly_ntt_avx2_corr (Array256.init (fun (i : int) => _r.[2 * 256 + i]))).
wp;call (poly_ntt_avx2_corr (Array256.init (fun (i : int) => _r.[256 + i]))).
wp;call (poly_ntt_avx2_corr (Array256.init (fun (i : int) => _r.[0 + i]))).
skip => &hr [#] ->  H; do split; 1:by smt(Array256.initiE).
move => H0 r [#] H1 H2; do split. 
+ by rewrite tP => k kb; rewrite !initiE //= !initiE //= /#.
+ rewrite /signed_bound_cxq => k kb; rewrite !initiE //= !initiE //= /#.
move => [#] H3 H4 r0 H5 H6. do split.
+ rewrite tP => k kb; rewrite !initiE //= initiE //= 1: /# ifF 1:/# initiE //= /#.
+ rewrite /signed_bound_cxq => k kb; rewrite !initiE //= initiE //= 1: /# ifF 1:/# initiE //= /#.
move => [#] H7 H8 r1 H9 H10. do split.
+ apply KVec.tP => k kb. have kv := kvec_val.
  rewrite /nttv /mapv KVec.mapiE 1:/# /lift_polyvec !KVec.initiE 1,2:/# /=.
  rewrite /lift_array256 /subarray256 tP => i ib.
  rewrite mapiE //= initiE //= /nttpackv initiE //= 1:/#.
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  case(k = 0).
   + move => ->. rewrite ifT //= /nttpack /subarray256 initiE //=. 
     pose a:=nttpack_idx.[i].
     rewrite initiE //= 1:/# initiE //= 1:/# ifF 1:/# initiE //= 1:/#.
     rewrite ifF 1:/# initiE //= 1:/# ifT 1:/#.
     move : H1; rewrite /lift_array256 /nttpack tP => H1.
     rewrite (H1 i ib) mapiE //= initiE /#.
  case(k = 1).
   + move => -> *. rewrite ifF 1:/# ifT 1:/# /nttpack /subarray256 initiE //=. 
     pose a:=nttpack_idx.[i].
     rewrite initiE //= 1:/# initiE //= 1:/# ifF 1:/# initiE //= 1:/#.
     rewrite ifT 1:/#.
     move : H5; rewrite /lift_array256 /nttpack tP => [#] H5 ?.
     rewrite (H5 i ib) mapiE //= initiE /#.
  move => *; have -> : k = 2 by smt().
  rewrite ifF 1:/# ifF 1:/# /nttpack /subarray256 initiE //=. 
  pose a:=nttpack_idx.[i].
  rewrite initiE //= 1:/# initiE //= 1:/# ifT 1:/#.
  move : H9; rewrite /lift_array256 /nttpack tP => [#] H9 ?.
  rewrite (H9 i ib) mapiE //= initiE /#.  

rewrite /pos_bound768_cxq => k kb; rewrite initiE //=.
  case(512 <= k < 768). smt().
  move => *;case(256 <= k < 512). 
  + move => *; rewrite initiE //=. smt(). 
  move => *; rewrite initiE //= ifF 1:/# initiE //= /#. 
qed.

lemma nttpack_subarray768 (r : 'a Array768.t) :
  nttpack (Array256.init ("_.[_]" r)) = Array256.init ("_.[_]" (nttpackv r)).
rewrite /nttpack tP => />i Hi1 Hi2. rewrite !initiE /= 1..3:/#. rewrite ifT 1:/#.
rewrite /nttpack. rewrite initiE /=. rewrite nttpack_inbounds //.
rewrite eq_sym initiE /= 1:/#. rewrite /subarray256 initiE //. rewrite nttpack_inbounds //.
qed.

lemma nttpack_subarray768_k (r : 'a Array768.t) k :
  k = 256 || k = 512 =>
  nttpack (Array256.init (fun i => r.[k+i])) = Array256.init (fun i => (nttpackv r).[k+i]).
move => Hk. rewrite /nttpack tP => /> i Hi1 Hi2. rewrite !initiE /= 1..2:/#. rewrite initiE //= /nttpack 1:/#. rewrite initiE //=. rewrite nttpack_inbounds //. pose a := nttpack_idx.[i].
case Hk => />.
 + rewrite ifF 1:/#. rewrite ifT 1:/#. rewrite /subarray256 initiE //= initiE //=. rewrite nttpack_inbounds //. 
 + rewrite ifF 1:/#. rewrite ifF 1:/#. rewrite /subarray256 initiE //= initiE //=. rewrite nttpack_inbounds //. 
qed.

lemma lift_array_256_768 (r : W16.t Array768.t) :
  lift_array256 (Array256.init ("_.[_]" r)) = Array256.init ("_.[_]" (lift_array768 r)).
rewrite /lift_array256 /lift_array768 /map tP => />i Hi1 Hi2. rewrite !initiE //= 1:/#. rewrite initiE //=. qed.

lemma lift_array_256_768_k (r : W16.t Array768.t) k :
  0 <= k <= 512 =>
  lift_array256 (Array256.init (fun (i : int) => r.[k+ i])) = (Array256.init (fun (i : int) => (lift_array768 r).[k + i])).
move => Hk. rewrite /lift_array256 /lift_array768 /map tP => />i Hi1 Hi2. rewrite !initiE //=. rewrite initiE //= 1:/#. rewrite !initiE //=. qed.

abbrev mul1x256v i v = mapv (mul1x256 i) v.

lemma polyvec_invntt_avx2_corr _r :
  phoare [Jkem_avx2.M.__polyvec_invntt :
     nttpackv (lift_array768 r) = lift_array768 _r /\ signed_bound768_cxq r 0 768 4 ==>
    mul1x256v (incoeff W16.modulus) (invnttv (lift_polyvec _r)) = lift_polyvec (res) /\
   signed_bound768_cxq res 0 768 1] = 1%r.

proc. 
unroll for 2.
wp;call (poly_invntt_avx2_corr (Array256.init (fun (i : int) => _r.[2 * 256 + i]))).
wp;call (poly_invntt_avx2_corr (Array256.init (fun (i : int) => _r.[256 + i]))).
wp;call (poly_invntt_avx2_corr (Array256.init (fun (i : int) => _r.[0 + i]))).
skip =>  &m [#] /= H_r Hb.
rewrite !andaE.
do split. 
+ move :Hb; rewrite /signed_bound_cxq /signed_bound768_cxq => Hb; rewrite lift_nttpack /= lift_array_256_768 /= nttpack_subarray768 H_r tP => k kb.
  rewrite initiE 1:/# !mapiE 1,2:/# /= initiE /#. 
+ move  => k Hk; move :(Hb k); rewrite !initiE //= /#. 

move => r.
rewrite lift_nttpack =>  [#] Hr H4.
do split. 
 + rewrite !lift_array_256_768_k 1..2:/#; rewrite -H_r; rewrite nttpack_subarray768_k //.
   by rewrite tP => />i Hi1 Hi2; rewrite !initiE //= /nttpackv /lift_array768 /map !initiE //= 1..2:/# ifF 1:/# ifT 1:/# ifF 1:/# ifT 1:/#; congr; congr; rewrite /subarray256 tP => />j Hj1 Hj2; rewrite !initiE //= initiE //= 1:/# !initiE //= /#.
 + by rewrite /signed_bound_cxq => i Hi; rewrite !initiE //= !initiE //= /#.
move => [#] H5 H6 r0 [#] Hr0 H7. 
rewrite !andaE.
do split. 
 + rewrite nttpack_subarray768_k // !lift_array_256_768_k 1..2:/# -H_r.
   rewrite tP => />i Hi1 Hi2; rewrite !initiE //= /nttpackv /lift_array768 /map !initiE //= 1..2:/# !initiE //= 1:/# ifF 1:/# ifF 1:/# ifF 1:/# ifF 1:/#  /subarray256 /nttpack !initiE //=; pose a:= nttpack_idx.[i]; rewrite !initiE //= /a; smt(Array768.initiE nttpack_inbounds). 

 +  rewrite /signed_bound_ => i Hi; rewrite !initiE /=  1:/# !initiE //= 1:/# ifF 1:/# !initiE //= 1:/# ifF 1:/#; move :Hb; rewrite /signed_bound768_cxq => Hb; move :(Hb (512+i)); smt().

move => r1 [#] Hr1 H10; split.
 + apply KVec.tP => k Hk.
   rewrite /mul1x256v /mapv KVec.mapiE 1:/# invnttvE 1:/# /lift_polyvec !KVec.initiE 1,2:/#.
   simplify.
   case (k=0) => [->|hkn0].
   + have e1: subarray256 _r 0 = init (fun (i0:int) => _r.[i0]).
     + apply Array256.tP => j hj; rewrite /subarray256 !initiE 1,2:/#; smt().
     rewrite e1 Hr; congr.
     apply Array256.tP => j hj; rewrite /subarray256 Array256.initiE 1:/# /=; smt(Array768.initiE).
   case (k=1) => [->|hkn1].
   + have e2: subarray256 _r 1 = init (fun (i0:int) => _r.[256+i0]).
     + apply Array256.tP => j hj; rewrite /subarray256 !initiE 1,2:/#; smt().
     rewrite e2 Hr0; congr.
     apply Array256.tP => j hj; rewrite /subarray256 Array256.initiE 1:/# /=; smt(Array768.initiE).
   have kv := kvec_val.
   have ->: k = 2 by smt().
   have e3: subarray256 _r 2 = init (fun (i0:int) => _r.[512+i0]).
   + apply Array256.tP => j hj; rewrite /subarray256 !initiE 1,2:/#; smt().
   rewrite e3 Hr1; congr.
   apply Array256.tP => j hj; rewrite /subarray256 Array256.initiE 1:/# /=; smt(Array768.initiE).
 + rewrite /signed_bound768_cxq => i Hi; rewrite Array768.initiE 1:/# /=.
   case (512 <= i < 768) => hi1.
   + move: H10; rewrite /signed_bound_cxq => H10; smt().
   rewrite Array768.initiE 1:/# /=.
   case (256 <= i < 512) => hi2.
   + move: H7; rewrite /signed_bound_cxq => H7; smt().
   rewrite Array768.initiE 1:/# /=.
   move: H4; rewrite /signed_bound_cxq => H4; smt().
qed.


end NTT_Avx2.
