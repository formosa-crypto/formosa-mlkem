require import AllCore List Int IntDiv CoreMap Real Number Ring StdOrder BitEncoding.
from Jasmin require import JModel.
require import Array256 Array128  Array16.
require import Array256 Array128 Array32 Array16 Array768 Array2304.
require import MLKEMFCLib.
require import MLKEM_PolyVec.
require import NTT_Fq.
require import AVX2_Ops.
import GFq Rq Serialization VecMat Correctness.
import MLKEM_PolyVec.
import Zq IntOrder BitReverse.
import PolyVec PolyMat.
theory NTT_Avx2.

abbrev nttpack_idx = Array256.of_list witness
  [0; 16; 32; 48; 64; 80; 96; 112; 1; 17; 33; 49; 65; 81; 97; 113;
   2; 18; 34; 50; 66; 82; 98; 114; 3; 19; 35; 51; 67; 83; 99; 115;
   4; 20; 36; 52; 68; 84; 100; 116; 5; 21; 37; 53; 69; 85; 101; 117;
   6; 22; 38; 54; 70; 86; 102; 118; 7; 23; 39; 55; 71; 87; 103; 119;
   8; 24; 40; 56; 72; 88; 104; 120; 9; 25; 41; 57; 73; 89; 105; 121;
   10; 26; 42; 58; 74; 90; 106; 122; 11; 27; 43; 59; 75; 91; 107; 123;
   12; 28; 44; 60; 76; 92; 108; 124; 13; 29; 45; 61; 77; 93; 109; 125;
   14; 30; 46; 62; 78; 94; 110; 126; 15; 31; 47; 63; 79; 95; 111; 127;
   128; 144; 160; 176; 192; 208; 224; 240; 129; 145; 161; 177; 193; 209; 225; 241;
   130; 146; 162; 178; 194; 210; 226; 242; 131; 147; 163; 179; 195; 211; 227; 243;
   132; 148; 164; 180; 196; 212; 228; 244; 133; 149; 165; 181; 197; 213; 229; 245;
   134; 150; 166; 182; 198; 214; 230; 246; 135; 151; 167; 183; 199; 215; 231; 247;
   136; 152; 168; 184; 200; 216; 232; 248; 137; 153; 169; 185; 201; 217; 233; 249;
   138; 154; 170; 186; 202; 218; 234; 250; 139; 155; 171; 187; 203; 219; 235; 251;
   140; 156; 172; 188; 204; 220; 236; 252; 141; 157; 173; 189; 205; 221; 237; 253;
   142; 158; 174; 190; 206; 222; 238; 254; 143; 159; 175; 191; 207; 223; 239; 255].

abbrev nttunpack_idx = Array256.of_list witness
  [0; 8; 16; 24; 32; 40; 48; 56; 64; 72; 80; 88; 96; 104; 112; 120;
   1; 9; 17; 25; 33; 41; 49; 57; 65; 73; 81; 89; 97; 105; 113; 121;
   2; 10; 18; 26; 34; 42; 50; 58; 66; 74; 82; 90; 98; 106; 114; 122;
   3; 11; 19; 27; 35; 43; 51; 59; 67; 75; 83; 91; 99; 107; 115; 123;
   4; 12; 20; 28; 36; 44; 52; 60; 68; 76; 84; 92; 100; 108; 116; 124;
   5; 13; 21; 29; 37; 45; 53; 61; 69; 77; 85; 93; 101; 109; 117; 125;
   6; 14; 22; 30; 38; 46; 54; 62; 70; 78; 86; 94; 102; 110; 118; 126;
   7; 15; 23; 31; 39; 47; 55; 63; 71; 79; 87; 95; 103; 111; 119; 127;
   128; 136; 144; 152; 160; 168; 176; 184; 192; 200; 208; 216; 224; 232; 240; 248;
   129; 137; 145; 153; 161; 169; 177; 185; 193; 201; 209; 217; 225; 233; 241; 249;
   130; 138; 146; 154; 162; 170; 178; 186; 194; 202; 210; 218; 226; 234; 242; 250;
   131; 139; 147; 155; 163; 171; 179; 187; 195; 203; 211; 219; 227; 235; 243; 251;
   132; 140; 148; 156; 164; 172; 180; 188; 196; 204; 212; 220; 228; 236; 244; 252;
   133; 141; 149; 157; 165; 173; 181; 189; 197; 205; 213; 221; 229; 237; 245; 253;
   134; 142; 150; 158; 166; 174; 182; 190; 198; 206; 214; 222; 230; 238; 246; 254;
   135; 143; 151; 159; 167; 175; 183; 191; 199; 207; 215; 223; 231; 239; 247; 255].

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

op nttpack (rp : 'a Array256.t) : ('a Array256.t) = Array256.init (fun i => rp.[nttpack_idx.[i]])
axiomatized by nttpackE.

op nttunpack (rp: 'a Array256.t) : ('a Array256.t) = Array256.init (fun i => rp.[nttunpack_idx.[i]])
axiomatized by nttunpackE.

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

lemma nttpack_idxK : all (fun i => nttpack_idx.[nttunpack_idx.[i]] = i) (iota_ 0 256)
by rewrite -iotaredE /=.

lemma nttunpack_idxK : all (fun i => nttunpack_idx.[nttpack_idx.[i]] = i) (iota_ 0 256)
by rewrite -iotaredE /=.

lemma nttpackK: cancel nttpack<:'a> nttunpack<:'a>.
proof.
  rewrite /cancel => x.
  rewrite /nttunpack /nttpack.
  rewrite -ext_eq_all /all_eq //=.
qed.

lemma nttunpackK: cancel nttunpack<:'a> nttpack<:'a>.
proof.
  rewrite /cancel => x.
  rewrite /nttunpack /nttpack.
  rewrite -ext_eq_all /all_eq //=.
qed.

lemma all_iota P (v : 'a Array256.t) : 
   Array256.all P v <=> all P (map (fun i => v.[i]) (iotared 0 256)).
rewrite iotaredE all_map /= /preim /= /#.
qed.


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

lemma nttpack_bnd : 
  all (fun x => 0 <= x < 256) nttpack_idx by rewrite all_iota /=.

lemma nttunpack_bnd : 
  all (fun x => 0 <= x < 256) nttunpack_idx by rewrite all_iota /=.

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

lemma nttpack_pred (v : 'a Array256.t) P: 
   (all P (nttpack v)) <=>
   (all P v).
rewrite /nttpack /=; split.
+ rewrite all_iota /=;smt(Array256.initiE Array256.allP).
rewrite allP all_iota /= /#.
qed.

lemma nttunpack_pred (v : 'a Array256.t) P: 
   (all P (nttunpack v)) <=>
   (all P v).
rewrite /nttunpack /=; split.
+ rewrite all_iota /=;smt(Array256.initiE Array256.allP).
rewrite allP all_iota /= /#.
qed.

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


lemma map_pack (p : 'a Array256.t) (f : 'a -> 'b) : nttpack (Array256.map f p) = map f (nttpack p).
rewrite /nttpack !mapE.
rewrite tP => k kb; rewrite !initiE //=.
pose a:= nttpack_idx.[k].
rewrite !initiE //=. smt(nttpack_bnd Array256.allP).
qed.

lemma map_unpack (p : 'a Array256.t) (f : 'a -> 'b) : nttunpack (Array256.map f p) = map f (nttunpack p).
rewrite /nttunpack !mapE.
rewrite tP => k kb; rewrite !initiE //=.
pose a:= nttunpack_idx.[k].
rewrite !initiE //=. smt(nttunpack_bnd Array256.allP).
qed.

lemma pack_ext_eq (p q : 'a Array256.t):
     nttpack p = nttpack q <=> p = q.
rewrite /nttpack; split;rewrite tP.
+ move => H. rewrite tP => k kb. 
  move : (H (nttunpack_idx.[k]) _).  smt(nttunpack_bnd Array256.allP).
  pose a:= nttunpack_idx.[k].
  rewrite !initiE //=; 1,2: smt(nttunpack_bnd Array256.allP).
  rewrite /a. move :nttpack_idxK. rewrite allP; smt( mem_iota).
move => H. rewrite tP => k kb. 
  move : (H (nttunpack_idx.[k]) _).  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttpack_bnd Array256.allP).
qed.

lemma unpack_ext_eq (p q : 'a Array256.t) :
     nttunpack p = nttunpack q <=> p = q.
rewrite /nttpack; split;rewrite tP.
+ move => H. rewrite tP => k kb. 
  move : (H (nttpack_idx.[k]) _).  smt(nttpack_bnd Array256.allP).
  pose a:= nttpack_idx.[k].
  rewrite /nttunpack !initiE //=; 1,2: smt(nttpack_bnd Array256.allP).
  rewrite /a. move :nttunpack_idxK. rewrite allP; smt( mem_iota).
move => H. rewrite tP => k kb. 
  move : (H (nttpack_idx.[k]) _).  smt(nttpack_bnd Array256.allP).
  rewrite /nttunpack !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
qed.

lemma pack_bounds (p : W16.t Array256.t) l h:
     (forall i, 0 <= i < 256 => l <= to_sint p.[i] < h) => (forall i, 0<=i<256 => l <= to_sint (nttpack p).[i] < h).
move => Hi k.
move : (nttpack_pred p (fun x => l <= W16.to_sint x < h)); rewrite !allP /= => H.
move : H => [H1 H2]. 
move : (H2 Hi). smt().
qed.

(* FIXME: MERGE W/ pack_bounds *)
lemma pack_boundsi (p : ipoly) l h:
     (forall i, 0 <= i < 256 => l <= p.[i] < h) => (forall i, 0 <= i < 256 => l <= (nttpack p).[i] < h).
proof.
  move => Hi k.
  move : (nttpack_pred p (fun x => l <= x < h)); rewrite !allP /= => H.
  move : H => [H1 H2].
  move : (H2 Hi). smt().
qed.

lemma unpack_bounds (p : W16.t Array256.t) l h:
     (forall i, 0 <= i < 256 => l <= to_sint p.[i] < h) => (forall i, 0<=i<256 => l <= to_sint (nttunpack p).[i] < h).
proof.
  move => Hi k.
  move : (nttunpack_pred p (fun x => l <= W16.to_sint x < h)); rewrite !allP /= => H.
  move : H => [H1 H2].
  move : (H2 Hi). smt().
qed.

(* FIXME: MERGE W/ unpack_bounds *)
lemma unpack_boundsi (p : ipoly) l h:
     (forall i, 0 <= i < 256 => l <= p.[i] < h) => (forall i, 0 <= i < 256 => l <= (nttunpack p).[i] < h).
proof.
  move => Hi k.
  move : (nttunpack_pred p (fun x => l <= x < h)); rewrite !allP /= => H.
  move : H => [H1 H2].
  move : (H2 Hi). smt().
qed.


lemma pack128_bounds (p: W16.t Array256.t) k l h:
      0 <= k < 3 => (forall i, 0 <= i < 128 * k => l <= to_sint p.[i] < h) => (forall i, 0 <= i < 128 * k => l <= to_sint (nttpack p).[i] < h).
proof.
  rewrite andabP => /(mem_iota 0 3 k).
  move : k.
  rewrite -(List.allP (fun x => (forall (i : int), 0 <= i && i < 128 * x => l <= to_sint p.[i] && to_sint p.[i] < h) =>
                                (forall (i : int), 0 <= i && i < 128 * x => l <= to_sint (nttpack p).[i] && to_sint (nttpack p).[i] < h))).
  rewrite -iotaredE //=.
  do split; first by smt(@Logic).
    + move => Hi i.
      rewrite andabP => /(mem_iota 0 128 i).
      move : i.
      rewrite -(List.allP (fun i => l <= to_sint (nttpack p).[i] && to_sint (nttpack p).[i] < h)).
      rewrite -iotaredE //=.
      rewrite /nttpack initiE 1://= //=.
      by do (rewrite Hi 1://=).
    + apply pack_bounds.
qed.

lemma unpack128_bounds (p: W16.t Array256.t) k l h:
      0 <= k < 3 => (forall i, 0 <= i < 128 * k => l <= to_sint p.[i] < h) => (forall i, 0 <= i < 128 * k => l <= to_sint (nttunpack p).[i] < h).
proof.
  rewrite andabP => /(mem_iota 0 3 k).
  move : k.
  rewrite -(List.allP (fun x => (forall (i : int), 0 <= i && i < 128 * x => l <= to_sint p.[i] && to_sint p.[i] < h) =>
                                (forall (i : int), 0 <= i && i < 128 * x => l <= to_sint (nttunpack p).[i] && to_sint (nttunpack p).[i] < h))).
  rewrite -iotaredE //=.
  do split; first by smt(@Logic).
    + move => Hi i.
      rewrite andabP => /(mem_iota 0 128 i).
      move : i.
      rewrite -(List.allP (fun i => l <= to_sint (nttunpack p).[i] && to_sint (nttunpack p).[i] < h)).
      rewrite -iotaredE //=.
      rewrite /nttunpack initiE 1://= //=.
      by do (rewrite Hi 1://=).
    + apply unpack_bounds.
qed.

lemma pack128_boundsi (p: ipoly) k l h:
      0 <= k < 3 => (forall i, 0 <= i < 128 * k => l <= p.[i] < h) => (forall i, 0 <= i < 128 * k => l <= (nttpack p).[i] < h).
proof.
  rewrite andabP => /(mem_iota 0 3 k).
  move : k.
  rewrite -(List.allP (fun x => (forall (i : int), 0 <= i && i < 128 * x => l <= p.[i] && p.[i] < h) =>
                                (forall (i : int), 0 <= i && i < 128 * x => l <= (nttpack p).[i] && (nttpack p).[i] < h))).
  rewrite -iotaredE //=.
  do split; first by smt(@Logic).
    + move => Hi i.
      rewrite andabP => /(mem_iota 0 128 i).
      move : i.
      rewrite -(List.allP (fun i => l <= (nttpack p).[i] && (nttpack p).[i] < h)).
      rewrite -iotaredE //=.
      rewrite /nttpack initiE 1://= //=.
      by do (rewrite Hi 1://=).
    + apply pack_boundsi.
qed.


lemma unpack128_boundsi (p: ipoly) k l h:
      0 <= k < 3 => (forall i, 0 <= i < 128 * k => l <= p.[i] < h) => (forall i, 0 <= i < 128 * k => l <= (nttunpack p).[i] < h).
proof.
  rewrite andabP => /(mem_iota 0 3 k).
  move : k.
  rewrite -(List.allP (fun x => (forall (i : int), 0 <= i && i < 128 * x => l <= p.[i] && p.[i] < h) =>
                                (forall (i : int), 0 <= i && i < 128 * x => l <= (nttunpack p).[i] && (nttunpack p).[i] < h))).
  rewrite -iotaredE //=.
  do split; first by smt(@Logic).
    + move => Hi i.
      rewrite andabP => /(mem_iota 0 128 i).
      move : i.
      rewrite -(List.allP (fun i => l <= (nttunpack p).[i] && (nttunpack p).[i] < h)).
      rewrite -iotaredE //=.
      rewrite /nttunpack initiE 1://= //=.
      by do (rewrite Hi 1://=).
    + apply unpack_boundsi.
qed.

lemma nttpack_inbounds: forall k, 0 <= k < 256 => 0 <= nttpack_idx.[k] && nttpack_idx.[k] < 256.
proof.
  apply (Array256.allP _ (fun x => 0 <= x && x < 256)).
  rewrite /Array256.all -iotaredE //=.
qed.

lemma nttunpack_inbounds: forall k, 0 <= k < 256 => 0 <= nttunpack_idx.[k] && nttunpack_idx.[k] < 256.
proof.
  apply (Array256.allP _ (fun x => 0 <= x && x < 256)).
  rewrite /Array256.all -iotaredE //=.
qed.

lemma nttpack128_bounds: forall k, 0 <= k < 256 => (k %/ 128) * 128 <= nttpack_idx.[k] && nttpack_idx.[k] < (k %/ 128) * 128 + 128.
proof.
  move => k.
  rewrite andabP => /(mem_iota 0 256 k).
  move : k.
  rewrite -(List.allP (fun x => (x %/ 128) * 128 <= nttpack_idx.[x] && nttpack_idx.[x] < (x %/ 128) * 128 + 128) _).
  rewrite -iotaredE //=.
qed.

lemma nttunpack128_bounds: forall k, 0 <= k < 256 => (k %/ 128) * 128 <= nttunpack_idx.[k] && nttunpack_idx.[k] < (k %/ 128) * 128 + 128.
proof.
  move => k.
  rewrite andabP => /(mem_iota 0 256 k).
  move : k.
  rewrite -(List.allP (fun x => (x %/ 128) * 128 <= nttunpack_idx.[x] && nttunpack_idx.[x] < (x %/ 128) * 128 + 128) _).
  rewrite -iotaredE //=.
qed.

require import MLKEM_Poly.
import MLKEM_Poly.
lemma lift_nttpack v : lift_array256 (nttpack v) = nttpack (lift_array256 v).
proof. 
rewrite tP => k kb.
rewrite /lift_array256 mapiE //=.
rewrite /nttpack !initiE //=.
pose a := nttpack_idx.[k].
smt(Array256.mapiE nttpack_bnd Array256.allP).
qed.

lemma lift_nttunpack v : lift_array256 (nttunpack v) = nttunpack (lift_array256 v).
proof. 
rewrite tP => k kb.
rewrite /lift_array256 mapiE //=.
rewrite /nttunpack !initiE //=.
pose a := nttunpack_idx.[k].
smt(Array256.mapiE nttunpack_bnd Array256.allP).
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

lemma lift256_nttunpack v :
  lift_array256 (nttunpack v) = nttunpack (lift_array256 v).
rewrite /lift_array256 /nttunpack tP => k kb.
rewrite mapiE //= initiE //=.
pose a:= nttunpack_idx.[k].
rewrite initiE //= mapiE //=. smt(nttunpack_bnd Array256.allP).
qed.

require import Jkem_avx2 Jkem.
require import NTT_AVX_Fq NTT_AVX_j.

lemma perm_ntt_nttpackE ['a] (p: 'a Array256.t):
  perm_ntt NTT_AVX_Fq.perm_nttpack128 p = nttpack p.
proof.
by apply Array256.all_eq_eq; rewrite /all_eq 
   /perm_ntt /perm_nttpack128 /nttpack /=.
qed.

phoare poly_basemul_avx2_ph _a _b:
 [Jkem_avx2.M(Jkem_avx2.Syscall)._poly_basemul:
    (lift_array256 ap) = nttunpack _a /\ signed_bound_cxq ap 0 256 2
    /\ (lift_array256 bp) = nttunpack _b /\ signed_bound_cxq bp 0 256 2
   ==>
    (lift_array256 res)
    = nttunpack (scale (basemul (_a) (_b)) (incoeff 169))
    /\ signed_bound_cxq res 0 256 1 ] = 1%r.
proof. 
conseq poly_basemul_avx2_eq (__basemul_ph (nttunpack _a) (nttunpack _b)) => //.
 move => /> &1 *.
 by exists ((lift_array256 rp{1}), (lift_array256 ap{1}), (lift_array256 bp{1})) => //=.
move=> /> &m <- Hb.
move: (basemul_avx2E (nttunpack _a) (nttunpack _b)).
rewrite !perm_ntt_nttpackE !nttunpackK => <-.
by rewrite /scale -map_pack nttpackK.
qed.

lemma poly_ntt_avx2_corr _r :
  phoare [Jkem_avx2.M(Jkem_avx2.Syscall)._poly_ntt :
    rp = _r /\ signed_bound_cxq rp 0 256 2 ==>
    ntt (lift_array256 _r) = lift_array256 (nttpack res) /\
    pos_bound256_cxq res 0 256 2] = 1%r.
proof.
conseq poly_ntt_avx2_eq (ntt_avx_spec (lift_array256 _r)).
 by move => &1 [-> H] /#.
move=> &1 &2 [-> H] <-.
by rewrite lift_nttpack perm_ntt_nttpackE.
qed.

import KMatrix.
import Vector.
lemma polyvec_ntt_avx2_corr _r :
  phoare [Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_ntt :
     r = _r /\ signed_bound768_cxq r 0 768 2==>
    nttv (lift_polyvec _r) = lift_polyvec (nttpackv res) /\
   pos_bound768_cxq res 0 768 2] = 1%r.
proc. 
wp;call (poly_ntt_avx2_corr (Array256.init (fun (i : int) => _r.[2 * 256 + i]))).
wp;call (poly_ntt_avx2_corr (Array256.init (fun (i : int) => _r.[256 + i]))).
wp;call (poly_ntt_avx2_corr (Array256.init (fun (i : int) => _r.[0 + i]))).
auto => /> H; do split; 1:by smt(Array256.initiE).
move => H0 r H1 H2; do split. 
+ by rewrite tP => k kb; rewrite !initiE //= !initiE //= /#.
+ rewrite /signed_bound_cxq => k kb; rewrite !initiE //= !initiE //= /#.
move => H3 H4 r0 H5 H6. do split.
+ rewrite tP => k kb; rewrite !initiE //= initiE //= 1: /# ifF 1:/# initiE //= /#.
+ rewrite /signed_bound_cxq => k kb; rewrite !initiE //= initiE //= 1: /# ifF 1:/# initiE //= /#.
move => H7 H8 r1 H9 H10. do split.
+ rewrite /nttv /lift_polyvec eq_vectorP => k kb.
  rewrite mapvE !offunvE //= KMatrix.Vector.offunvK /vclamp kb /=.
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
     move : H5; rewrite /lift_array256 /nttpack tP => H5.
     rewrite (H5 i ib) mapiE //= initiE /#.
  move => *; have -> : k = 2 by smt().
  rewrite ifF 1:/# ifF 1:/# /nttpack /subarray256 initiE //=. 
  pose a:=nttpack_idx.[i].
  rewrite initiE //= 1:/# initiE //= 1:/# ifT 1:/#.
  move : H9; rewrite /lift_array256 /nttpack tP => H9.
  rewrite (H9 i ib) mapiE //= initiE /#.  

rewrite /pos_bound768_cxq => k kb; rewrite initiE //=.
  case(512 <= k < 768). smt().
  move => *;case(256 <= k < 512). 
  + move => *; rewrite initiE //=. smt(). 
  move => *; rewrite initiE //= ifF 1:/# initiE //= /#. 
qed.

lemma poly_invntt_avx2_corr _r :
  phoare [Jkem_avx2.M(Jkem_avx2.Syscall)._poly_invntt :
    lift_array256 (nttpack rp) = lift_array256 _r /\ signed_bound_cxq rp 0 256 4 ==>
    mul1x256 (incoeff W16.modulus) (invntt (lift_array256 _r)) = (lift_array256 res) /\
    signed_bound_cxq res 0 256 1] = 1%r.
proof.
conseq poly_invntt_avx2_eq (invntt_avx_spec (lift_array256 _r)).
move => &1 [<- H]. exists (lift_array256 arg{1}) => />. rewrite lift_nttpack perm_ntt_nttpackE //.
move => &1 &2 [<- H] -> /#. 
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
  phoare [Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_invntt :
     nttpackv (lift_array768 r) = lift_array768 _r /\ signed_bound768_cxq r 0 768 4 ==>
    mul1x256v (incoeff W16.modulus) (invnttv (lift_polyvec _r)) = lift_polyvec (res) /\
   signed_bound768_cxq res 0 768 1] = 1%r.

proc. 
wp;call (poly_invntt_avx2_corr (Array256.init (fun (i : int) => _r.[2 * 256 + i]))).
wp;call (poly_invntt_avx2_corr (Array256.init (fun (i : int) => _r.[256 + i]))).
wp;call (poly_invntt_avx2_corr (Array256.init (fun (i : int) => _r.[0 + i]))).
auto => /> &m H_r Hb. rewrite lift_array_256_768 -H_r -nttpack_subarray768 /=. split. move :Hb. rewrite /signed_bound_cxq /signed_bound768_cxq => Hb. rewrite lift_nttpack lift_array_256_768 //= => k Hk. move :(Hb k). rewrite !initiE //= /#. move => H1 H2 r.
rewrite lift_nttpack => /> Hr H4. split. split.
 + rewrite !lift_array_256_768_k 1..2:/#. rewrite -H_r. rewrite nttpack_subarray768_k //.
 + rewrite tP => />i Hi1 Hi2. rewrite !initiE //=. rewrite /nttpackv /lift_array768 /map !initiE //= 1..2:/#. rewrite ifF 1:/#. rewrite ifT 1:/#. rewrite ifF 1:/#. rewrite ifT 1:/#. congr. congr. rewrite /subarray256 tP => />j Hj1 Hj2. rewrite !initiE //= initiE //= 1:/#. rewrite !initiE //= 1..2:/#. rewrite ifF //= 1:/#. 
 + rewrite /signed_bound_cxq => i Hi. rewrite !initiE //= !initiE //= /#.
move => H5 H6 r0 Hr0 H7. split. split.
 + rewrite nttpack_subarray768_k //. rewrite !lift_array_256_768_k 1..2:/#. rewrite -H_r.
 + rewrite tP => />i Hi1 Hi2. rewrite !initiE //=. rewrite /nttpackv /lift_array768 /map !initiE //= 1..2:/#. rewrite !initiE //= 1:/#. rewrite ifF 1:/#. rewrite ifF 1:/#. rewrite ifF 1:/#. rewrite ifF 1:/#. rewrite /subarray256 /nttpack !initiE //=. pose a:= nttpack_idx.[i]. rewrite !initiE //=. rewrite /a nttpack_inbounds //. rewrite /a nttpack_inbounds //. rewrite !initiE //=. smt(nttpack_inbounds). smt(nttpack_inbounds).
 + rewrite ifF. smt(nttpack_inbounds). rewrite !initiE //=. smt(nttpack_inbounds). rewrite ifF //. smt(nttpack_inbounds). 
 + rewrite /signed_bound_cxq => i Hi. rewrite !initiE //=  !initiE //= 1:/#. rewrite ifF 1:/#. rewrite !initiE //= 1:/#. rewrite ifF 1:/#. move :Hb. rewrite /signed_bound768_cxq => Hb. move :(Hb (512+i)). smt().
move => H8 H9 r1 Hr1 H10. split.
 + rewrite /lift_polyvec eq_vectorP => k Hk. rewrite !offunvE //=.
   rewrite /lift_array256 /subarray256 tP => i Hi.
 + rewrite !mapiE //= initiE //= /nttpackv initiE //= 1:/# /nttv /invnttv. 
 + case (k=0).
  + move => ->. rewrite ifF 1:/#. rewrite initiE //= 1:/#. rewrite ifF 1:/#. rewrite initiE //= 1:/#. rewrite ifT //.
  + move :Hr. rewrite /lift_array256 tP => /> Hr. move :(Hr i). rewrite Hi /map !initiE //=. move => H12. rewrite -H12 !mapvE /= !offunvE /= 1:/# initiE 1:/# /=. 
    congr. congr => /=. rewrite !offunvK /vclamp !ifT 1,2:/#. congr. 
  + rewrite nttpack_subarray768 H_r. rewrite /lift_array768 /map tP => j Hj. rewrite !initiE //= 1:/#. by rewrite !initiE //=.
 + case (k=1).
  + move => ->. rewrite ifF 1:/#. rewrite initiE //= 1:/#. rewrite ifT 1:/#. 
  + move :Hr0. rewrite !mapvE /lift_array256 tP => /> Hr0. move :(Hr0 i). 
    rewrite Hi /map !initiE //=. rewrite !offunvK /vclamp /= !offunvE /= 1:/# initiE /#.  
 + move => *; have -> : k = 2 by smt().
  + rewrite ifT 1:/#.
  + move :Hr1. rewrite !mapvE /lift_array256 tP => /> Hr1. 
    move :(Hr1 i). rewrite Hi /map !initiE //=.
    rewrite !offunvK /vclamp /= !offunvE /= 1:/# initiE /#. 
  + rewrite /signed_bound768_cxq => k Hk; rewrite initiE //=.
 + case(512 <= k < 768). smt().
 + move => *;case(256 <= k < 512). 
 + move => *; rewrite initiE //=. smt(). 
 + move => *; rewrite initiE //= ifF 1:/# initiE //= /#. 
qed.

end NTT_Avx2.
 
