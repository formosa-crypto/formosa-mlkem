require import AllCore List IntDiv Ring StdOrder BitEncoding Array16 Array128  Array256 Array400.
require import Fq NTT_Fq NTTAlgebra.
import Kyber.
import NTT_Properties.

import Zq IntOrder BitReverse.
import NTTequiv.

require import Array16_extra.
require import Array128_extra.
require import Array256_extra.
from Jasmin require import JUtils.

(* misc utils *)

lemma prod2 (xs ys: ('a*'a)) :
  (xs = ys) = (xs.`1 = ys.`1 /\ xs.`2 = ys.`2).
  case xs => />. case ys => />. qed.

lemma prod8 (xs ys: ('a*'a*'a*'a*'a*'a*'a*'a)) :
  (xs = ys) = (xs.`1 = ys.`1 /\ xs.`2 = ys.`2 /\ xs.`3 = ys.`3 /\ xs.`4 = ys.`4 /\ xs.`5 = ys.`5 /\ xs.`6 = ys.`6 /\ xs.`7 = ys.`7 /\ xs.`8 = ys.`8).
  case xs => />. case ys => />. qed.

lemma rangered (n m :int) :
  range n m = iotared n (m-n).
  rewrite iotaredE /range => />. qed.

lemma ifsplit (b : bool) (t e r : 'a) :
   (b => (t = r)) => (!b => (e = r)) =>
       (if b then t else e) = r 
   by move => Ht Hf; case b; auto.

lemma and_imply2 (p q r : bool) :
  p /\ (p => q => r) => ((p => q) => r).
  smt(). qed.

lemma falsify (p : bool) : 
  false => p.
  auto. qed.

type arrays8 = (Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t).

op to_arrays8 (r : Fq Array128.t) : arrays8 =
  (Array16.init (fun i => r.[i])
  ,Array16.init (fun i => r.[i+16])
  ,Array16.init (fun i => r.[i+32])
  ,Array16.init (fun i => r.[i+48])
  ,Array16.init (fun i => r.[i+64])
  ,Array16.init (fun i => r.[i+80])
  ,Array16.init (fun i => r.[i+96])
  ,Array16.init (fun i => r.[i+112])).

op from_arrays8 (rs : arrays8) : Fq Array128.t =
  Array128.init (fun i =>
    if 0 <= i < 16 then rs.`1.[i %% 16]
    else if 16 <= i < 32 then rs.`2.[i %% 16]
    else if 32 <= i < 48 then rs.`3.[i %% 16]
    else if 48 <= i < 64 then rs.`4.[i %% 16]
    else if 64 <= i < 80 then rs.`5.[i %% 16]
    else if 80 <= i < 96 then rs.`6.[i %% 16]
    else if 96 <= i < 112 then rs.`7.[i %% 16]
    else rs.`8.[i %% 16]).

lemma from_to_arrays8 (r : Fq Array128.t) :
  from_arrays8 (to_arrays8 r) = r.
  rewrite /from_arrays8 /to_arrays8 /= tP => />i Hi1 Hi2.
  rewrite !initE /=. rewrite !initE /=. smt(). qed.

lemma to_from_arrays8 (r : arrays8) :
  to_arrays8 (from_arrays8 r) = r.
  rewrite prod8. do 8!(try split; first by rewrite /from_arrays8 /to_arrays8 => />; rewrite tP => />*; rewrite !initiE => />; try (rewrite !initiE /=); smt()). qed.

type arrays16 = (arrays8 * arrays8).

op to_arrays16 (r : Fq Array256.t) : arrays16 =
  ((Array16.init (fun i => r.[i])
  ,Array16.init (fun i => r.[i+16])
  ,Array16.init (fun i => r.[i+32])
  ,Array16.init (fun i => r.[i+48])
  ,Array16.init (fun i => r.[i+64])
  ,Array16.init (fun i => r.[i+80])
  ,Array16.init (fun i => r.[i+96])
  ,Array16.init (fun i => r.[i+112]))
  ,(Array16.init (fun i => r.[i+128])
  ,Array16.init (fun i => r.[i+144])
  ,Array16.init (fun i => r.[i+160])
  ,Array16.init (fun i => r.[i+176])
  ,Array16.init (fun i => r.[i+192])
  ,Array16.init (fun i => r.[i+208])
  ,Array16.init (fun i => r.[i+224])
  ,Array16.init (fun i => r.[i+240]))).

op from_arrays16 (rs : arrays16) : Fq Array256.t =
  Array256.init (fun i =>
    if 0 <= i < 16 then rs.`1.`1.[i %% 16]
    else if 16 <= i < 32 then rs.`1.`2.[i %% 16]
    else if 32 <= i < 48 then rs.`1.`3.[i %% 16]
    else if 48 <= i < 64 then rs.`1.`4.[i %% 16]
    else if 64 <= i < 80 then rs.`1.`5.[i %% 16]
    else if 80 <= i < 96 then rs.`1.`6.[i %% 16]
    else if 96 <= i < 112 then rs.`1.`7.[i %% 16]
    else if 112 <= i < 128 then rs.`1.`8.[i %% 16]
    else if 128 <= i < 144 then rs.`2.`1.[i %% 16]
    else if 144 <= i < 160 then rs.`2.`2.[i %% 16]
    else if 160 <= i < 176 then rs.`2.`3.[i %% 16]
    else if 176 <= i < 192 then rs.`2.`4.[i %% 16]
    else if 192 <= i < 208 then rs.`2.`5.[i %% 16]
    else if 208 <= i < 224 then rs.`2.`6.[i %% 16]
    else if 224 <= i < 240 then rs.`2.`7.[i %% 16]
    else rs.`2.`8.[i %% 16]).

lemma from_to_arrays16 (r : Fq Array256.t) :
  from_arrays16 (to_arrays16 r) = r.
  rewrite /from_arrays16 /to_arrays16 /= tP => />i Hi1 Hi2.
  rewrite !initE /=. rewrite !initE /=. smt(). qed.

lemma to_from_arrays16 (r : arrays16) :
  to_arrays16 (from_arrays16 r) = r.
  rewrite prod2; split.
  rewrite prod8. do 8!(try split; first by rewrite /from_arrays16 /to_arrays16 => />; rewrite tP => />*; rewrite !initiE => />; try (rewrite !initiE /=); smt()).
  rewrite prod8. do 8!(try split; first by rewrite /from_arrays16 /to_arrays16 => />; rewrite tP => />*; rewrite !initiE => />; try (rewrite !initiE /=); smt()). qed.

abbrev fill256 (r:Fq Array256.t) (r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 : Fq Array16.t) =
fill (fun (i : int) => r16.[i %% 16]) 240 16
  (fill (fun (i : int) => r15.[i %% 16]) 224 16
     (fill (fun (i : int) => r14.[i %% 16]) 208 16
        (fill (fun (i : int) => r13.[i %% 16]) 192 16
           (fill (fun (i : int) => r12.[i %% 16]) 176 16
              (fill (fun (i : int) => r11.[i %% 16]) 160 16
                 (fill (fun (i : int) => r10.[i %% 16]) 144 16
                    (fill (fun (i : int) => r9.[i %% 16]) 128 16
                       (fill (fun (i : int) => r8.[i %% 16]) 112 16
                          (fill (fun (i : int) => r7.[i %% 16]) 96 16
                             (fill (fun (i : int) => r6.[i %% 16]) 80 16
                                (fill (fun (i : int) => r5.[i %% 16]) 64 16
                                   (fill (fun (i : int) => r4.[i %% 16]) 48 16
                                      (fill (fun (i : int) => r3.[i %% 16]) 32 16
                                         (fill (fun (i : int) => r2.[i %% 16]) 16 16
                                            (fill (fun (i : int) => r1.[i %% 16]) 0 16 r))))))))))))))).

lemma fill256_from_arrays16 r r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 :
  fill256 r r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 = from_arrays16 ((r1,r2,r3,r4,r5,r6,r7,r8),(r9,r10,r11,r12,r13,r14,r15,r16)).
rewrite !fillE /=. rewrite tP => />*.
do 17!(rewrite initiE /=; 1: by smt()). smt(). qed.

op initeo(fe fo : int -> 'a) : 'a Array16.t = 
    Array16.init (fun i => if i %% 2 = 0 then fe i else fo i) axiomatized by initeoE.

(* NTT AVX intermediate implementation *)

theory NTT_AVX_Fq.

op shuffle8 (r1 r2 : Fq Array16.t) : Fq Array16.t * Fq Array16.t =
  ( Array16.init (fun i => if 0 <= i < 8 then r1.[i%%8] else r2.[i%%8])
  , Array16.init (fun i => if 0 <= i < 8 then r1.[i%%8+8] else r2.[i%%8+8])
  ) axiomatized by shuffle8E.

op shuffle4 (r1 r2 : Fq Array16.t) : Fq Array16.t * Fq Array16.t =
  ( Array16.init (fun i =>
    if 0 <= i < 4 then r1.[i%%4]
    else if 4 <= i < 8 then r2.[i%%4]
    else if 8 <= i < 12 then r1.[i%%4+8]
    else r2.[i%%4+8]
    )
  , Array16.init (fun i =>
    if 0 <= i < 4 then r1.[i%%4+4]
    else if 4 <= i < 8 then r2.[i%%4+4]
    else if 8 <= i < 12 then r1.[i%%4+12]
    else r2.[i%%4+12]
    )
  ) axiomatized by shuffle4E.

op shuffle2 (r1 r2 : Fq Array16.t) : Fq Array16.t * Fq Array16.t =
  ( Array16.init (fun i =>
    if 0 <= i < 2 then r1.[i%%2]
    else if 2 <= i < 4 then r2.[i%%2]
    else if 4 <= i < 6 then r1.[i%%2+4]
    else if 6 <= i < 8 then r2.[i%%2+4]
    else if 8 <= i < 10 then r1.[i%%2+8]
    else if 10 <= i < 12 then r2.[i%%2+8]
    else if 12 <= i < 14 then r1.[i%%2+12]
    else r2.[i%%2+12]
    )
  , Array16.init (fun i =>
    if 0 <= i < 2 then r1.[i%%2+2]
    else if 2 <= i < 4 then r2.[i%%2+2]
    else if 4 <= i < 6 then r1.[i%%2+6]
    else if 6 <= i < 8 then r2.[i%%2+6]
    else if 8 <= i < 10 then r1.[i%%2+10]
    else if 10 <= i < 12 then r2.[i%%2+10]
    else if 12 <= i < 14 then r1.[i%%2+14]
    else r2.[i%%2+14]
    )
  ) axiomatized by shuffle2E.

op shuffle1(r1 r2 : Fq Array16.t) : Fq Array16.t * Fq Array16.t =
  ( Array16.of_list witness [r1.[0];r2.[0];r1.[2];r2.[2];r1.[4];r2.[4];r1.[6];r2.[6];r1.[8];r2.[8];r1.[10];r2.[10];r1.[12];r2.[12];r1.[14];r2.[14]]
  , Array16.of_list witness [r1.[1];r2.[1];r1.[3];r2.[3];r1.[5];r2.[5];r1.[7];r2.[7];r1.[9];r2.[9];r1.[11];r2.[11];r1.[13];r2.[13];r1.[15];r2.[15]]
  ) axiomatized by shuffle1E.

(* These are imperative specifications of the NTT algorithms whose control
   structure matches what is implemented.  *)

(* permutation that nttpack128 applies to the input indexes *)
op perm_nttpack128 : int list =
  [0; 16; 32; 48; 64; 80; 96; 112; 1; 17; 33; 49; 65; 81; 97; 113;
   2; 18; 34; 50; 66; 82; 98; 114; 3; 19; 35; 51; 67; 83; 99; 115;
   4; 20; 36; 52; 68; 84; 100; 116; 5; 21; 37; 53; 69; 85; 101; 117;
   6; 22; 38; 54; 70; 86; 102; 118; 7; 23; 39; 55; 71; 87; 103; 119;
   8; 24; 40; 56; 72; 88; 104; 120; 9; 25; 41; 57; 73; 89; 105; 121;
   10; 26; 42; 58; 74; 90; 106; 122; 11; 27; 43; 59; 75; 91; 107; 123;
   12; 28; 44; 60; 76; 92; 108; 124; 13; 29; 45; 61; 77; 93; 109; 125;
   14; 30; 46; 62; 78; 94; 110; 126; 15; 31; 47; 63; 79; 95; 111; 127]
  axiomatized by perm_nttpack128E.

(* permutation that nttunpack128 applies to the input indexes *)
op perm_nttunpack128 : int list =
  [0;8;16;24;32;40;48;56;64;72;80;88;96;104;112;120;
  1;9;17;25;33;41;49;57;65;73;81;89;97;105;113;121;
  2;10;18;26;34;42;50;58;66;74;82;90;98;106;114;122;
  3;11;19;27;35;43;51;59;67;75;83;91;99;107;115;123;
  4;12;20;28;36;44;52;60;68;76;84;92;100;108;116;124;
  5;13;21;29;37;45;53;61;69;77;85;93;101;109;117;125;
  6;14;22;30;38;46;54;62;70;78;86;94;102;110;118;126;
  7;15;23;31;39;47;55;63;71;79;87;95;103;111;119;127]
  axiomatized by perm_nttunpack128E.

op perm8 (p : int list) (r : arrays8) : arrays8 =
  to_arrays8 (Array128.init (fun i => (from_arrays8 r).[nth witness p i])).

op perm256 (p : int list) (r : 'a Array256.t) : 'a Array256.t =
  Array256.init (fun i => if 0 <= i < 128 then r.[nth witness p i] else r.[128+nth witness p (i%%128)] ).

abbrev perm_ntt (p : int list) (r : arrays16) : Fq Array256.t =
  perm256 p (from_arrays16 r).

module NTT_AVX = {

proc __nttpack128(rs : arrays8) : arrays8 = {
  
  var r0,r1,r2,r3,r4,r5,r6,r7 : Fq Array16.t;
  var r0a,r1a,r2a,r3a,r4a,r5a,r6a,r7a : Fq Array16.t;
  var r0b,r1b,r2b,r3b,r4b,r5b,r6b,r7b : Fq Array16.t;
  var r0c,r1c,r2c,r3c,r4c,r5c,r6c,r7c : Fq Array16.t;
  var r0d,r1d,r2d,r3d,r4d,r5d,r6d,r7d : Fq Array16.t;

  (r0,r1,r2,r3,r4,r5,r6,r7) <- rs;
  (r0a, r1a) <- shuffle1 r0 r1;
  (r2a, r3a) <- shuffle1 r2 r3;
  (r4a, r5a) <- shuffle1 r4 r5;
  (r6a, r7a) <- shuffle1 r6 r7;

  (r0b, r2b) <- shuffle2 r0a r2a;
  (r4b, r6b) <- shuffle2 r4a r6a;
  (r1b, r3b) <- shuffle2 r1a r3a;
  (r5b, r7b) <- shuffle2 r5a r7a;

  (r0c, r4c) <- shuffle4 r0b r4b;
  (r1c, r5c) <- shuffle4 r1b r5b;
  (r2c, r6c) <- shuffle4 r2b r6b;
  (r3c, r7c) <- shuffle4 r3b r7b;

  (r0d, r1d) <- shuffle8 r0c r1c;
  (r2d, r3d) <- shuffle8 r2c r3c;
  (r4d, r5d) <- shuffle8 r4c r5c;
  (r6d, r7d) <- shuffle8 r6c r7c;

  return (r0d, r2d, r4d, r6d, r1d, r3d, r5d, r7d);
}

proc __butterfly64x(rs : arrays8, z0 z1 z2 z3 : Fq Array16.t) : arrays8 = {

  var rl0t, rl1t, rl2t, rl3t, rh0t, rh1t, rh2t, rh3t;
  var rl0, rl1, rl2, rl3, rh0, rh1, rh2, rh3;

  (rl0t, rl1t, rl2t, rl3t, rh0t, rh1t, rh2t, rh3t) <- rs;
  
  rh0 <- Array16.init (fun i => rl0t.[i] + -(z0.[i] * rh0t.[i]));
  rl0 <- Array16.init (fun i => rl0t.[i] + z2.[i] * rh0t.[i]);
  
  rh1 <- Array16.init (fun i => rl1t.[i] + -(z0.[i] * rh1t.[i]));
  rl1 <- Array16.init (fun i => rl1t.[i] + z2.[i] * rh1t.[i]);
  
  rh2 <- Array16.init (fun i => rl2t.[i] + -(z1.[i] * rh2t.[i]));
  rl2 <- Array16.init (fun i => rl2t.[i] + z3.[i] * rh2t.[i]);
  
  rh3 <- Array16.init (fun i => rl3t.[i] + -(z1.[i] * rh3t.[i]));
  rl3 <- Array16.init (fun i => rl3t.[i] + z3.[i] * rh3t.[i]);
  
  return (rl0, rl1, rl2, rl3, rh0, rh1, rh2, rh3);
}

(* This procedure handles the iteration where the butterflies touch both halves
   of the 256-position array. For all the other rounds, the implementation does
   roughly the same process on each 128 position half. See loop *)

proc ___ntt_level0 (rp : arrays16,  zetasp : Fq Array400.t) : arrays16 = {

  var  zeta0, zeta1 : Fq Array16.t;
  var r0, r1, r2, r3, r4, r5, r6, r7 : Fq Array16.t;
  var r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a : Fq Array16.t;
  var r0b, r1b, r2b, r3b, r4b, r5b, r6b, r7b : Fq Array16.t;
  var r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c : Fq Array16.t;
  var rp1,rp2,rp3,rp4,rp5,rp6,rp7,rp8 : Fq Array256.t;
  var rp9,rp10,rp11,rp12,rp13,rp14,rp15,rp16 : Fq Array256.t;
  var ll,rr : arrays8;

  (ll,rr) <- rp;
  (r0,r1,r2,r3,r0b,r1b,r2b,r3b) <- ll;
  (r4,r5,r6,r7,r4b,r5b,r6b,r7b) <- rr;

  zeta0 <- initeo (fun i => zetasp.[0]) (fun i => zetasp.[1]);
  zeta1 <- initeo (fun i => zetasp.[2]) (fun i => zetasp.[3]);

  (r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a) <@ 
      __butterfly64x((r0, r1, r2, r3, r4, r5, r6, r7), zeta0, zeta0, zeta1, zeta1);

  (r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c) <@ 
      __butterfly64x((r0b, r1b, r2b, r3b, r4b, r5b, r6b, r7b), zeta0, zeta0, zeta1, zeta1);
      
 return ((r0a,r1a,r2a,r3a,r0c,r1c,r2c,r3c),(r4a,r5a,r6a,r7a,r4c,r5c,r6c,r7c));

}

proc __ntt_level0 (rp : Fq Array256.t,  zetasp : Fq Array400.t) : Fq Array256.t = {

  var r';
  r' <@ ___ntt_level0(to_arrays16(rp),zetasp);
  return (from_arrays16 r');
}

proc ___ntt_level1(rp : arrays16,  zetasp : Fq Array400.t) : arrays16 = {

  var  zeta0,zeta0k,zeta1,zeta1k : Fq Array16.t; 
  var r0, r1, r2, r3, r4, r5, r6, r7 : Fq Array16.t;
  var r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a : Fq Array16.t;
  var r0k, r1k, r2k, r3k, r4k, r5k, r6k, r7k : Fq Array16.t;
  var r0l, r1l, r2l, r3l, r4l, r5l, r6l, r7l : Fq Array16.t;
  var ll,rr : arrays8;
  
  (ll,rr) <- rp;
  (r0,r1,r2,r3,r4,r5,r6,r7) <- ll;
  (r0k,r1k,r2k,r3k,r4k,r5k,r6k,r7k) <- rr;

  (* first 128 *)
  
  zeta0 <- initeo (fun _ => zetasp.[4 + 196*0]) (fun _ => zetasp.[4 + 196*0 + 1]);
  zeta1 <- initeo (fun _ => zetasp.[6 + 196*0]) (fun _ => zetasp.[6 + 196*0 + 1]);

  (r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a) <@ 
       __butterfly64x((r0, r1, r2, r3, r4, r5, r6, r7), zeta0, zeta0, zeta1, zeta1);
       
  (* second 128 *)
       
  zeta0k <- initeo (fun _ => zetasp.[4 + 196*1]) (fun _ => zetasp.[4 + 196*1 + 1]);
  zeta1k <- initeo (fun _ => zetasp.[6 + 196*1]) (fun _ => zetasp.[6 + 196*1 + 1]);
  
  (r0l, r1l, r2l, r3l, r4l, r5l, r6l, r7l) <@ 
      __butterfly64x((r0k, r1k, r2k, r3k, r4k, r5k, r6k, r7k), zeta0k, zeta0k, zeta1k, zeta1k);
    
  return ((r0a,r1a,r2a,r3a,r4a,r5a,r6a,r7a),(r0l,r1l,r2l,r3l,r4l,r5l,r6l,r7l));
}

proc ___ntt_level2(rp : arrays16,  zetasp : Fq Array400.t) : arrays16 = {

  var  zeta0b, zeta1b, zeta0m, zeta1m : Fq Array16.t; 
  var r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a : Fq Array16.t;
  var r0b, r1b, r2b, r3b, r4b, r5b, r6b, r7b : Fq Array16.t;
  var r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c : Fq Array16.t;
  var r0l, r1l, r2l, r3l, r4l, r5l, r6l, r7l : Fq Array16.t;
  var r0m, r1m, r2m, r3m, r4m, r5m, r6m, r7m : Fq Array16.t;
  var r0n, r1n, r2n, r3n, r4n, r5n, r6n, r7n : Fq Array16.t;
  var ll,rr : arrays8;

  (ll,rr) <- rp;
  (r0a,r1a,r2a,r3a,r4a,r5a,r6a,r7a) <- ll;
  (r0l,r1l,r2l,r3l,r4l,r5l,r6l,r7l) <- rr; 
  
  zeta0b <- Array16.init (fun i => zetasp.[ 8 + 196*0 + i]);
  zeta1b <- Array16.init (fun i => zetasp.[24 + 196*0 + i]);

  (r0b,r4b) <- shuffle8 r0a r4a;
  (r1b,r5b) <- shuffle8 r1a r5a;
  (r2b,r6b) <- shuffle8 r2a r6a;
  (r3b,r7b) <- shuffle8 r3a r7a;

  (r0c, r4c, r1c, r5c, r2c, r6c, r3c, r7c) <@ 
      __butterfly64x((r0b, r4b, r1b, r5b, r2b, r6b, r3b, r7b), zeta0b, zeta0b, zeta1b, zeta1b);
  
  zeta0m <- Array16.init (fun i => zetasp.[ 8 + 196*1 + i]);
  zeta1m <- Array16.init (fun i => zetasp.[24 + 196*1 + i]);

  (r0m,r4m) <- shuffle8 r0l r4l;
  (r1m,r5m) <- shuffle8 r1l r5l;
  (r2m,r6m) <- shuffle8 r2l r6l;
  (r3m,r7m) <- shuffle8 r3l r7l;

  (r0n, r4n, r1n, r5n, r2n, r6n, r3n, r7n) <@ 
      __butterfly64x((r0m, r4m, r1m, r5m, r2m, r6m, r3m, r7m), zeta0m, zeta0m, zeta1m, zeta1m);
      
  return ((r0c,r4c,r1c,r5c,r2c,r6c,r3c,r7c),(r0n,r4n,r1n,r5n,r2n,r6n,r3n,r7n));

}
  
proc ___ntt_level3(rp : arrays16,  zetasp : Fq Array400.t) : arrays16 = {
  var  zeta0d, zeta1d, zeta0o, zeta1o : Fq Array16.t; 
  var r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c : Fq Array16.t;
  var r0d, r1d, r2d, r3d, r4d, r5d, r6d, r7d : Fq Array16.t;
  var r0e, r1e, r2e, r3e, r4e, r5e, r6e, r7e : Fq Array16.t;
  var r0n, r1n, r2n, r3n, r4n, r5n, r6n, r7n : Fq Array16.t;
  var r0o, r1o, r2o, r3o, r4o, r5o, r6o, r7o : Fq Array16.t;
  var r0p, r1p, r2p, r3p, r4p, r5p, r6p, r7p : Fq Array16.t;
  var r1_,r2_,r3_,r4_,r5_,r6_,r7_,r8_,r9_,r10_,r11_,r12_,r13_,r14_,r15_,r16_ : Fq Array16.t;
  var ll,rr : arrays8;

  (ll,rr) <- rp;
  (r0c, r4c, r1c, r5c, r2c, r6c, r3c, r7c) <- ll;
  (r0n, r4n, r1n, r5n, r2n, r6n, r3n, r7n) <- rr;
  
  zeta0d <- Array16.init (fun i => zetasp.[40 + 196*0 + i]);
  zeta1d <- Array16.init (fun i => zetasp.[56 + 196*0 + i]);

  (r0d,r2d) <- shuffle4 r0c r2c;
  (r4d,r6d) <- shuffle4 r4c r6c;
  (r1d,r3d) <- shuffle4 r1c r3c;
  (r5d,r7d) <- shuffle4 r5c r7c;

  (r0e, r2e, r4e, r6e, r1e, r3e, r5e, r7e) <@ 
       __butterfly64x((r0d, r2d, r4d, r6d, r1d, r3d, r5d, r7d), zeta0d, zeta0d, zeta1d, zeta1d);
       
  zeta0o <- Array16.init (fun i => zetasp.[40 + 196*1 + i]);
  zeta1o <- Array16.init (fun i => zetasp.[56 + 196*1 + i]);
  
  (r0o,r2o) <- shuffle4 r0n r2n;
  (r4o,r6o) <- shuffle4 r4n r6n;
  (r1o,r3o) <- shuffle4 r1n r3n;
  (r5o,r7o) <- shuffle4 r5n r7n;
  
  (r0p, r2p, r4p, r6p, r1p, r3p, r5p, r7p) <@ 
       __butterfly64x((r0o, r2o, r4o, r6o, r1o, r3o, r5o, r7o), zeta0o, zeta0o, zeta1o, zeta1o);

  return ((r0e,r2e,r4e,r6e,r1e,r3e,r5e,r7e),(r0p,r2p,r4p,r6p,r1p,r3p,r5p,r7p));      
}

proc ___ntt_level4(rp : arrays16,  zetasp : Fq Array400.t) : arrays16 = {

  var  zeta0f, zeta1f, zeta0q, zeta1q : Fq Array16.t; 
  var r0e, r1e, r2e, r3e, r4e, r5e, r6e, r7e : Fq Array16.t;
  var r0f, r1f, r2f, r3f, r4f, r5f, r6f, r7f : Fq Array16.t;
  var r0g, r1g, r2g, r3g, r4g, r5g, r6g, r7g : Fq Array16.t;
  var r0p, r1p, r2p, r3p, r4p, r5p, r6p, r7p : Fq Array16.t;
  var r0q, r1q, r2q, r3q, r4q, r5q, r6q, r7q : Fq Array16.t;
  var r0r, r1r, r2r, r3r, r4r, r5r, r6r, r7r : Fq Array16.t;
  var rp1, rp2, rp3, rp4, rp5, rp6, rp7, rp8 : Fq Array256.t;
  var rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16 : Fq Array256.t;
  var ll,rr : arrays8;

  (ll,rr) <- rp;
  (r0e,r2e,r4e,r6e,r1e,r3e,r5e,r7e) <- ll;
  (r0p,r2p,r4p,r6p,r1p,r3p,r5p,r7p) <- rr;
  
  zeta0f <- Array16.init (fun i => zetasp.[72 + 196*0 + i]);
  zeta1f <- Array16.init (fun i => zetasp.[88 + 196*0 + i]);

  (r0f, r1f) <- shuffle2 r0e r1e;
  (r2f, r3f) <- shuffle2 r2e r3e;
  (r4f, r5f) <- shuffle2 r4e r5e;
  (r6f, r7f) <- shuffle2 r6e r7e;

  (r0g, r1g, r2g, r3g, r4g, r5g, r6g, r7g) <@ 
         __butterfly64x((r0f, r1f, r2f, r3f, r4f, r5f, r6f, r7f), zeta0f, zeta0f, zeta1f, zeta1f);
  
  zeta0q <- Array16.init (fun i => zetasp.[72 + 196*1 + i]);
  zeta1q <- Array16.init (fun i => zetasp.[88 + 196*1 + i]);

  (r0q, r1q) <- shuffle2 r0p r1p;
  (r2q, r3q) <- shuffle2 r2p r3p;
  (r4q, r5q) <- shuffle2 r4p r5p;
  (r6q, r7q) <- shuffle2 r6p r7p;

  (r0r, r1r, r2r, r3r, r4r, r5r, r6r, r7r) <@ 
         __butterfly64x((r0q, r1q, r2q, r3q, r4q, r5q, r6q, r7q), zeta0q, zeta0q, zeta1q, zeta1q);

  return ((r0g,r1g,r2g,r3g,r4g,r5g,r6g,r7g),(r0r,r1r,r2r,r3r,r4r,r5r,r6r,r7r));

}

proc ___ntt_level5(rp : arrays16,  zetasp : Fq Array400.t) : arrays16 = {

  var  zeta0h, zeta1h, zeta0s, zeta1s : Fq Array16.t; 
  
  var r0g, r1g, r2g, r3g, r4g, r5g, r6g, r7g : Fq Array16.t;
  var r0h, r1h, r2h, r3h, r4h, r5h, r6h, r7h : Fq Array16.t;
  var r0i, r1i, r2i, r3i, r4i, r5i, r6i, r7i : Fq Array16.t;
  var r0r, r1r, r2r, r3r, r4r, r5r, r6r, r7r : Fq Array16.t;
  var r0s, r1s, r2s, r3s, r4s, r5s, r6s, r7s : Fq Array16.t;
  var r0t, r1t, r2t, r3t, r4t, r5t, r6t, r7t : Fq Array16.t;
  var rp1, rp2, rp3, rp4, rp5, rp6, rp7, rp8 : Fq Array256.t;
  var rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16 : Fq Array256.t;
  var ll,rr;

  (ll,rr) <- rp;
  (r0g,r1g,r2g,r3g,r4g,r5g,r6g,r7g) <- ll;
  (r0r,r1r,r2r,r3r,r4r,r5r,r6r,r7r) <- rr;
  
  zeta0h <- Array16.init (fun i => zetasp.[104 + 196*0 + i]);
  zeta1h <- Array16.init (fun i => zetasp.[120 + 196*0 + i]);

  (r0h,r4h) <- shuffle1 r0g r4g;
  (r1h,r5h) <- shuffle1 r1g r5g;
  (r2h,r6h) <- shuffle1 r2g r6g;
  (r3h,r7h) <- shuffle1 r3g r7g;

  ( r0i, r4i, r1i, r5i, r2i, r6i, r3i, r7i ) <@ 
       __butterfly64x((r0h, r4h, r1h, r5h, r2h, r6h, r3h, r7h), zeta0h, zeta0h, zeta1h, zeta1h);
  
  zeta0s <- Array16.init (fun i => zetasp.[104 + 196*1 + i]);
  zeta1s <- Array16.init (fun i => zetasp.[120 + 196*1 + i]);

  (r0s,r4s) <- shuffle1 r0r r4r;
  (r1s,r5s) <- shuffle1 r1r r5r;
  (r2s,r6s) <- shuffle1 r2r r6r;
  (r3s,r7s) <- shuffle1 r3r r7r;

  ( r0t, r4t, r1t, r5t, r2t, r6t, r3t, r7t ) <@ 
       __butterfly64x((r0s, r4s, r1s, r5s, r2s, r6s, r3s, r7s), zeta0s, zeta0s, zeta1s, zeta1s);
  
  return ((r0i,r4i,r1i,r5i,r2i,r6i,r3i,r7i),(r0t,r4t,r1t,r5t,r2t,r6t,r3t,r7t));

}
  
proc ___ntt_level6(rp : arrays16,  zetasp : Fq Array400.t) : arrays16 = {

  var  zeta0i, zeta1i, zeta2i, zeta3i, zeta0t, zeta1t, zeta2t, zeta3t : Fq Array16.t; 
  var r0i, r1i, r2i, r3i, r4i, r5i, r6i, r7i : Fq Array16.t;
  var r0j, r1j, r2j, r3j, r4j, r5j, r6j, r7j : Fq Array16.t;
  var r0t, r1t, r2t, r3t, r4t, r5t, r6t, r7t : Fq Array16.t;
  var r0u, r1u, r2u, r3u, r4u, r5u, r6u, r7u : Fq Array16.t;
  
  var rp1, rp2, rp3, rp4, rp5, rp6, rp7, rp8 : Fq Array256.t;
  var rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16 : Fq Array256.t;
  var ll,rr : arrays8;

  (ll,rr) <- rp;
  (r0i,r4i,r1i,r5i,r2i,r6i,r3i,r7i) <- ll;
  (r0t,r4t,r1t,r5t,r2t,r6t,r3t,r7t) <- rr;
  
  zeta0i <- Array16.init (fun i => zetasp.[136 + 196*0 + i]);
  zeta1i <- Array16.init (fun i => zetasp.[168 + 196*0 + i]);
  zeta2i <- Array16.init (fun i => zetasp.[152 + 196*0 + i]);
  zeta3i <- Array16.init (fun i => zetasp.[184 + 196*0 + i]);
  
  (r0j, r4j, r2j, r6j, r1j, r5j, r3j, r7j) <@ 
        __butterfly64x((r0i, r4i, r2i, r6i, r1i, r5i, r3i, r7i), zeta0i, zeta1i, zeta2i, zeta3i);

  zeta0t <- Array16.init (fun i => zetasp.[136 + 196*1 + i]);
  zeta1t <- Array16.init (fun i => zetasp.[168 + 196*1 + i]);
  zeta2t <- Array16.init (fun i => zetasp.[152 + 196*1 + i]);
  zeta3t <- Array16.init (fun i => zetasp.[184 + 196*1 + i]);
  
  (r0u, r4u, r2u, r6u, r1u, r5u, r3u, r7u) <@ 
        __butterfly64x((r0t, r4t, r2t, r6t, r1t, r5t, r3t, r7t), zeta0t, zeta1t, zeta2t, zeta3t);
  
  return ((r0j,r4j,r1j,r5j,r2j,r6j,r3j,r7j),(r0u,r4u,r1u,r5u,r2u,r6u,r3u,r7u));

}

proc __ntt_level1t6(rp : Fq Array256.t,  zetasp : Fq Array400.t) : Fq Array256.t = {

  var  zeta0, zeta1, zeta0b, zeta1b, zeta0d, zeta1d : Fq Array16.t; 
  var  zeta0f, zeta1f, zeta0h, zeta1h, zeta0i, zeta1i, zeta2i, zeta3i : Fq Array16.t; 
  var  zeta0k, zeta1k, zeta0m, zeta1m, zeta0o, zeta1o : Fq Array16.t; 
  var  zeta0q, zeta1q, zeta0s, zeta1s, zeta0t, zeta1t, zeta2t, zeta3t : Fq Array16.t; 
  var r0, r1, r2, r3, r4, r5, r6, r7 : Fq Array16.t;
  var r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a : Fq Array16.t;
  var r0b, r1b, r2b, r3b, r4b, r5b, r6b, r7b : Fq Array16.t;
  var r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c : Fq Array16.t;
  var r0d, r1d, r2d, r3d, r4d, r5d, r6d, r7d : Fq Array16.t;
  var r0e, r1e, r2e, r3e, r4e, r5e, r6e, r7e : Fq Array16.t;
  var r0f, r1f, r2f, r3f, r4f, r5f, r6f, r7f : Fq Array16.t;
  var r0g, r1g, r2g, r3g, r4g, r5g, r6g, r7g : Fq Array16.t;
  var r0h, r1h, r2h, r3h, r4h, r5h, r6h, r7h : Fq Array16.t;
  var r0i, r1i, r2i, r3i, r4i, r5i, r6i, r7i : Fq Array16.t;
  var r0j, r1j, r2j, r3j, r4j, r5j, r6j, r7j : Fq Array16.t;
  var r0k, r1k, r2k, r3k, r4k, r5k, r6k, r7k : Fq Array16.t;
  var r0l, r1l, r2l, r3l, r4l, r5l, r6l, r7l : Fq Array16.t;
  var r0m, r1m, r2m, r3m, r4m, r5m, r6m, r7m : Fq Array16.t;
  var r0n, r1n, r2n, r3n, r4n, r5n, r6n, r7n : Fq Array16.t;
  var r0o, r1o, r2o, r3o, r4o, r5o, r6o, r7o : Fq Array16.t;
  var r0p, r1p, r2p, r3p, r4p, r5p, r6p, r7p : Fq Array16.t;
  var r0q, r1q, r2q, r3q, r4q, r5q, r6q, r7q : Fq Array16.t;
  var r0r, r1r, r2r, r3r, r4r, r5r, r6r, r7r : Fq Array16.t;
  var r0s, r1s, r2s, r3s, r4s, r5s, r6s, r7s : Fq Array16.t;
  var r0t, r1t, r2t, r3t, r4t, r5t, r6t, r7t : Fq Array16.t;
  var r0u, r1u, r2u, r3u, r4u, r5u, r6u, r7u : Fq Array16.t;
  var r0x, r1x, r2x, r3x, r4x, r5x, r6x, r7x : Fq Array16.t;
  var rp1, rp2, rp3, rp4, rp5, rp6, rp7, rp8 : Fq Array256.t;
  var rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16 : Fq Array256.t;

(**** LEFT-HALF*****)

  (* level 1 *)

   zeta0 <- initeo (fun i => zetasp.[4 + 196*0]) (fun i => zetasp.[4 + 196*0 + 1]);
   zeta1 <- initeo (fun i => zetasp.[6 + 196*0]) (fun i => zetasp.[6 + 196*0 + 1]);

    r0 <- Array16.init (fun i =>  rp.[i +   0 + 128*0]); 
    r1 <- Array16.init (fun i =>  rp.[i +  16 + 128*0]); 
    r2 <- Array16.init (fun i =>  rp.[i +  32 + 128*0]); 
    r3 <- Array16.init (fun i =>  rp.[i +  48 + 128*0]); 
    r4 <- Array16.init (fun i =>  rp.[i +  64 + 128*0]); 
    r5 <- Array16.init (fun i =>  rp.[i +  80 + 128*0]); 
    r6 <- Array16.init (fun i =>  rp.[i +  96 + 128*0]); 
    r7 <- Array16.init (fun i =>  rp.[i + 112 + 128*0]); 

    (r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a) <@ 
        __butterfly64x((r0, r1, r2, r3, r4, r5, r6, r7), zeta0, zeta0, zeta1, zeta1);

    (* level 2 *)

    zeta0b <- Array16.init (fun i => zetasp.[ 8 + 196*0 + i]);
    zeta1b <- Array16.init (fun i => zetasp.[24 + 196*0 + i]);

    (r0b,r4b) <- shuffle8 r0a r4a;
    (r1b,r5b) <- shuffle8 r1a r5a;
    (r2b,r6b) <- shuffle8 r2a r6a;
    (r3b,r7b) <- shuffle8 r3a r7a;

    (r0c, r4c, r1c, r5c, r2c, r6c, r3c, r7c) <@ 
        __butterfly64x((r0b, r4b, r1b, r5b, r2b, r6b, r3b, r7b), zeta0b, zeta0b, zeta1b, zeta1b);
    
    (* level 3 *)

    zeta0d <- Array16.init (fun i => zetasp.[40 + 196*0 + i]);
    zeta1d <- Array16.init (fun i => zetasp.[56 + 196*0 + i]);

    (r0d,r2d) <- shuffle4 r0c r2c;
    (r4d,r6d) <- shuffle4 r4c r6c;
    (r1d,r3d) <- shuffle4 r1c r3c;
    (r5d,r7d) <- shuffle4 r5c r7c;

    (r0e, r2e, r4e, r6e, r1e, r3e, r5e, r7e) <@ 
         __butterfly64x((r0d, r2d, r4d, r6d, r1d, r3d, r5d, r7d), zeta0d, zeta0d, zeta1d, zeta1d);

    (* level 4 *)

    zeta0f <- Array16.init (fun i => zetasp.[72 + 196*0 + i]);
    zeta1f <- Array16.init (fun i => zetasp.[88 + 196*0 + i]);

    (r0f, r1f) <- shuffle2 r0e r1e;
    (r2f, r3f) <- shuffle2 r2e r3e;
    (r4f, r5f) <- shuffle2 r4e r5e;
    (r6f, r7f) <- shuffle2 r6e r7e;

    (r0g, r1g, r2g, r3g, r4g, r5g, r6g, r7g) <@ 
           __butterfly64x((r0f, r1f, r2f, r3f, r4f, r5f, r6f, r7f), zeta0f, zeta0f, zeta1f, zeta1f);

    (* level 5 *)

    zeta0h <- Array16.init (fun i => zetasp.[104 + 196*0 + i]);
    zeta1h <- Array16.init (fun i => zetasp.[120 + 196*0 + i]);

    (r0h,r4h) <- shuffle1 r0g r4g;
    (r1h,r5h) <- shuffle1 r1g r5g;
    (r2h,r6h) <- shuffle1 r2g r6g;
    (r3h,r7h) <- shuffle1 r3g r7g;

    ( r0i, r4i, r1i, r5i, r2i, r6i, r3i, r7i ) <@ 
         __butterfly64x((r0h, r4h, r1h, r5h, r2h, r6h, r3h, r7h), zeta0h, zeta0h, zeta1h, zeta1h);

    (* level 6 *)

    zeta0i <- Array16.init (fun i => zetasp.[136 + 196*0 + i]);
    zeta1i <- Array16.init (fun i => zetasp.[168 + 196*0 + i]);
    zeta2i <- Array16.init (fun i => zetasp.[152 + 196*0 + i]); 
    zeta3i <- Array16.init (fun i => zetasp.[184 + 196*0 + i]); 

    (r0j, r4j, r2j, r6j, r1j, r5j, r3j, r7j) <@ 
          __butterfly64x((r0i, r4i, r2i, r6i, r1i, r5i, r3i, r7i), zeta0i, zeta1i, zeta2i, zeta3i);

    rp1 <- Array256.fill (fun i => r0j.[i %% 16]) ( 0 + 128*0) 16 rp;
    rp2 <- Array256.fill (fun i => r4j.[i %% 16]) ( 16 + 128*0) 16 rp1;
    rp3 <- Array256.fill (fun i => r1j.[i %% 16]) ( 32 + 128*0) 16 rp2;
    rp4 <- Array256.fill (fun i => r5j.[i %% 16]) ( 48 + 128*0) 16 rp3;
    rp5 <- Array256.fill (fun i => r2j.[i %% 16]) ( 64 + 128*0) 16 rp4;
    rp6 <- Array256.fill (fun i => r6j.[i %% 16]) ( 80 + 128*0) 16 rp5;
    rp7 <- Array256.fill (fun i => r3j.[i %% 16]) ( 96 + 128*0) 16 rp6;
    rp8 <- Array256.fill (fun i => r7j.[i %% 16]) (112 + 128*0) 16 rp7;

(**** RIGHT-HALF*****)

  (* level 1 *)

   zeta0k <- initeo (fun i => zetasp.[4 + 196*1]) (fun i => zetasp.[4 + 196*1 + 1]);
   zeta1k <- initeo (fun i => zetasp.[6 + 196*1]) (fun i => zetasp.[6 + 196*1 + 1]);

    r0k <- Array16.init (fun i =>  rp.[i +   0 + 128*1]); 
    r1k <- Array16.init (fun i =>  rp.[i +  16 + 128*1]); 
    r2k <- Array16.init (fun i =>  rp.[i +  32 + 128*1]); 
    r3k <- Array16.init (fun i =>  rp.[i +  48 + 128*1]); 
    r4k <- Array16.init (fun i =>  rp.[i +  64 + 128*1]); 
    r5k <- Array16.init (fun i =>  rp.[i +  80 + 128*1]);
    r6k <- Array16.init (fun i =>  rp.[i +  96 + 128*1]); 
    r7k <- Array16.init (fun i =>  rp.[i + 112 + 128*1]);

    (r0l, r1l, r2l, r3l, r4l, r5l, r6l, r7l) <@ 
        __butterfly64x((r0k, r1k, r2k, r3k, r4k, r5k, r6k, r7k), zeta0k,zeta0k,zeta1k,zeta1k);

    (* level 2 *)

    zeta0m <- Array16.init (fun i => zetasp.[ 8 + 196*1 + i]);
    zeta1m <- Array16.init (fun i => zetasp.[24 + 196*1 + i]);

    (r0m,r4m) <- shuffle8 r0l r4l;
    (r1m,r5m) <- shuffle8 r1l r5l;
    (r2m,r6m) <- shuffle8 r2l r6l;
    (r3m,r7m) <- shuffle8 r3l r7l;

    (r0n, r4n, r1n, r5n, r2n, r6n, r3n, r7n) <@ 
        __butterfly64x((r0m, r4m, r1m, r5m, r2m, r6m, r3m, r7m), zeta0m, zeta0m,zeta1m,zeta1m);

    (* level 3 *)

    zeta0o <- Array16.init (fun i => zetasp.[40 + 196*1 + i]);
    zeta1o <- Array16.init (fun i => zetasp.[56 + 196*1 + i]);

    (r0o,r2o) <- shuffle4 r0n r2n;
    (r4o,r6o) <- shuffle4 r4n r6n;
    (r1o,r3o) <- shuffle4 r1n r3n;
    (r5o,r7o) <- shuffle4 r5n r7n;

    (r0p, r2p, r4p, r6p, r1p, r3p, r5p, r7p) <@ 
         __butterfly64x((r0o, r2o, r4o, r6o, r1o, r3o, r5o, r7o), zeta0o, zeta0o, zeta1o, zeta1o);

    (* level 4 *)

    zeta0q <- Array16.init (fun i => zetasp.[72 + 196*1 + i]);
    zeta1q <- Array16.init (fun i => zetasp.[88 + 196*1 + i]);

    (r0q, r1q) <- shuffle2 r0p r1p;
    (r2q, r3q) <- shuffle2 r2p r3p;
    (r4q, r5q) <- shuffle2 r4p r5p;
    (r6q, r7q) <- shuffle2 r6p r7p;

    (r0r, r1r, r2r, r3r, r4r, r5r, r6r, r7r) <@ 
           __butterfly64x((r0q, r1q, r2q, r3q, r4q, r5q, r6q, r7q), zeta0q, zeta0q, zeta1q, zeta1q);

    (* level 5 *)

    zeta0s <- Array16.init (fun i => zetasp.[104 + 196*1 + i]);
    zeta1s <- Array16.init (fun i => zetasp.[120 + 196*1 + i]);

    (r0s,r4s) <- shuffle1 r0r r4r;
    (r1s,r5s) <- shuffle1 r1r r5r;
    (r2s,r6s) <- shuffle1 r2r r6r;
    (r3s,r7s) <- shuffle1 r3r r7r;

    ( r0t, r4t, r1t, r5t, r2t, r6t, r3t, r7t ) <@ 
         __butterfly64x((r0s, r4s, r1s, r5s, r2s, r6s, r3s, r7s), zeta0s, zeta0s, zeta1s, zeta1s);

    (* level 6 *)

    zeta0t <- Array16.init (fun i => zetasp.[136 + 196*1 + i]);
    zeta1t <- Array16.init (fun i => zetasp.[168 + 196*1 + i]);
    zeta2t <- Array16.init (fun i => zetasp.[152 + 196*1 + i]);
    zeta3t <- Array16.init (fun i => zetasp.[184 + 196*1 + i]); 

    (r0u, r4u, r2u, r6u, r1u, r5u, r3u, r7u) <@ 
          __butterfly64x((r0t, r4t, r2t, r6t, r1t, r5t, r3t, r7t), zeta0t, zeta1t, zeta2t, zeta3t);

    rp9  <- Array256.fill (fun i => r0u.[i %% 16]) ( 0 + 128*1) 16 rp8;  
    rp10 <- Array256.fill (fun i => r4u.[i %% 16]) ( 16 + 128*1) 16 rp9; 
    rp11 <- Array256.fill (fun i => r1u.[i %% 16]) ( 32 + 128*1) 16 rp10; 
    rp12 <- Array256.fill (fun i => r5u.[i %% 16]) ( 48 + 128*1) 16 rp11; 
    rp13 <- Array256.fill (fun i => r2u.[i %% 16]) ( 64 + 128*1) 16 rp12; 
    rp14 <- Array256.fill (fun i => r6u.[i %% 16]) ( 80 + 128*1) 16 rp13; 
    rp15 <- Array256.fill (fun i => r3u.[i %% 16]) ( 96 + 128*1) 16 rp14; 
    rp16 <- Array256.fill (fun i => r7u.[i %% 16]) (112 + 128*1) 16 rp15; 

    return rp16;
 }

 proc ntt(r : Fq Array256.t,  zetas : Fq Array400.t) : Fq Array256.t = {
  var rp0,rp6 : Fq Array256.t;
  rp0 <@ __ntt_level0(r,zetas);
  rp6 <@ __ntt_level1t6(rp0,zetas);
  return rp6;
 }
 
 proc ntt0t6(r : Fq Array256.t,  zetas : Fq Array400.t) : Fq Array256.t = {
  var rp0,rp1,rp2,rp3,rp4,rp5,rp6 : arrays16;
  rp0 <@ ___ntt_level0(to_arrays16 r,zetas);
  rp1 <@ ___ntt_level1(rp0,zetas);
  rp2 <@ ___ntt_level2(rp1,zetas);
  rp3 <@ ___ntt_level3(rp2,zetas);
  rp4 <@ ___ntt_level4(rp3,zetas);
  rp5 <@ ___ntt_level5(rp4,zetas);
  rp6 <@ ___ntt_level6(rp5,zetas);
  return (from_arrays16 rp6);
 }
 
}.

hoare __nttpack128_perm r :
  NTT_AVX.__nttpack128 : rs=r ==> res = perm8 perm_nttpack128 r.
  proc. inline *; wp; auto => />. rewrite prod8.
  do 8!(try split; first by apply Array16_extra.tP_red => i; simplify; rewrite !shuffle8E !shuffle4E !shuffle2E !shuffle1E !perm_nttpack128E => />; do 16!(move => Hi; case Hi => />)). qed.

lemma ntt0t6_ntt : 
  equiv [ NTT_AVX.ntt ~ NTT_AVX.ntt0t6 : ={r,zetas} ==> ={res}].
proc. seq 1 1: (rp0{1}=from_arrays16 rp0{2} /\ ={zetas}).
inline *. wp; auto. 
inline{1} NTT_AVX.__ntt_level1t6.
(* level 1 *) (* [loc(zeta0k)..loc(r0l)] - (loc(zeta0k)-loc(r0a)-1) *)
swap{1} [55..65] -41. seq 24 1 : (((r0a{1},r1a{1},r2a{1},r3a{1},r4a{1},r5a{1},r6a{1},r7a{1}),(r0l{1},r1l{1},r2l{1},r3l{1},r4l{1},r5l{1},r6l{1},r7l{1})) = rp1{2} /\ ={zetas} /\ zetasp{1}=zetas{1}).
inline *; wp; auto. move => /> &2. rewrite !initEq16 => />.
split; do 8!(try split; 1: (move => *; rewrite initeoE /=; 1: (do !(rewrite initiE 1:/# => />); smt()))).
(* level 2 *) (* [loc(zeta0m)..loc(r0n)] - (loc(zeta0m)-loc(r0c)-1) *)
swap{1} [42..48] -34. seq 14 1 : (((r0c{1},r4c{1},r1c{1},r5c{1},r2c{1},r6c{1},r3c{1},r7c{1}),(r0n{1},r4n{1},r1n{1},r5n{1},r2n{1},r6n{1},r3n{1},r7n{1})) = rp2{2} /\ ={zetas} /\ zetasp{1}=zetas{1}).
inline *; wp; auto. 
(* level 3 *) (* [loc(zeta0o)..loc(r0p)] - (loc(zeta0o)-loc(r0e)-1) *)
swap{1} [35..41] -27. seq 14 1 : (((r0e{1},r2e{1},r4e{1},r6e{1},r1e{1},r3e{1},r5e{1},r7e{1}),(r0p{1},r2p{1},r4p{1},r6p{1},r1p{1},r3p{1},r5p{1},r7p{1})) = rp3{2} /\ ={zetas} /\ zetasp{1}=zetas{1}).
inline *; wp; auto. 
(* level 4 *) (* [loc(zeta0q)..loc(r0r)] - (loc(zeta0q)-loc(r0g)-1) *)
swap{1} [28..34] -20. seq 14 1 : (((r0g{1},r1g{1},r2g{1},r3g{1},r4g{1},r5g{1},r6g{1},r7g{1}),(r0r{1},r1r{1},r2r{1},r3r{1},r4r{1},r5r{1},r6r{1},r7r{1})) = rp4{2} /\ ={zetas} /\ zetasp{1}=zetas{1}).
inline *; wp; auto. 
(* level 5 *) (* [loc(zeta0s)..loc(r0t)] - (loc(zeta0s)-loc(r0i)-1) *)
swap{1} [21..27] -13. seq 14 1 : (((r0i{1},r4i{1},r1i{1},r5i{1},r2i{1},r6i{1},r3i{1},r7i{1}),(r0t{1},r4t{1},r1t{1},r5t{1},r2t{1},r6t{1},r3t{1},r7t{1})) = rp5{2} /\ ={zetas} /\ zetasp{1}=zetas{1}).
inline *; wp; auto. 
(* level 6 *) (* [loc(zeta0t)..loc(r0u)] - (loc(zeta0t)-loc(r0j)-1) *)
swap{1} [14..18] -8. seq 10 1 : ( ((r0j{1},r4j{1},r1j{1},r5j{1},r2j{1},r6j{1},r3j{1},r7j{1}),(r0u{1},r4u{1},r1u{1},r5u{1},r2u{1},r6u{1},r3u{1},r7u{1})) = rp6{2} /\ ={zetas} /\ zetasp{1}=zetas{1} ).
inline *; wp; auto.
(* return *)
inline *; wp. auto => />. move => /> &1. apply fill256_from_arrays16. qed.

op zetas_unpack (z : Fq Array128.t) : Fq Array400.t =
  Array400.of_list witness
    [z.[1];z.[1];z.[1];z.[1];z.[2];z.[2];z.[2];z.[2];z.[4];z.[4];z.[4];z.[4];z.[4];z.[4];z.[4];z.[4];z.[5];z.[5];z.[5];z.[5];z.[5];z.[5];z.[5];z.[5];z.[4];z.[4];z.[4];z.[4];z.[4];z.[4];z.[4];z.[4];z.[5];z.[5];z.[5];z.[5];z.[5];z.[5];z.[5];z.[5];z.[8];z.[8];z.[8];z.[8];z.[9];z.[9];z.[9];z.[9];z.[10];z.[10];z.[10];z.[10];z.[11];z.[11];z.[11];z.[11];z.[8];z.[8];z.[8];z.[8];z.[9];z.[9];z.[9];z.[9];z.[10];z.[10];z.[10];z.[10];z.[11];z.[11];z.[11];z.[11];z.[16];z.[16];z.[17];z.[17];z.[18];z.[18];z.[19];z.[19];z.[20];z.[20];z.[21];z.[21];z.[22];z.[22];z.[23];z.[23];z.[16];z.[16];z.[17];z.[17];z.[18];z.[18];z.[19];z.[19];z.[20];z.[20];z.[21];z.[21];z.[22];z.[22];z.[23];z.[23];z.[32];z.[33];z.[34];z.[35];z.[36];z.[37];z.[38];z.[39];z.[40];z.[41];z.[42];z.[43];z.[44];z.[45];z.[46];z.[47];z.[32];z.[33];z.[34];z.[35];z.[36];z.[37];z.[38];z.[39];z.[40];z.[41];z.[42];z.[43];z.[44];z.[45];z.[46];z.[47];z.[64];z.[66];z.[68];z.[70];z.[72];z.[74];z.[76];z.[78];z.[80];z.[82];z.[84];z.[86];z.[88];z.[90];z.[92];z.[94];z.[64];z.[66];z.[68];z.[70];z.[72];z.[74];z.[76];z.[78];z.[80];z.[82];z.[84];z.[86];z.[88];z.[90];z.[92];z.[94];z.[65];z.[67];z.[69];z.[71];z.[73];z.[75];z.[77];z.[79];z.[81];z.[83];z.[85];z.[87];z.[89];z.[91];z.[93];z.[95];z.[65];z.[67];z.[69];z.[71];z.[73];z.[75];z.[77];z.[79];z.[81];z.[83];z.[85];z.[87];z.[89];z.[91];z.[93];z.[95];z.[3];z.[3];z.[3];z.[3];z.[6];z.[6];z.[6];z.[6];z.[6];z.[6];z.[6];z.[6];z.[7];z.[7];z.[7];z.[7];z.[7];z.[7];z.[7];z.[7];z.[6];z.[6];z.[6];z.[6];z.[6];z.[6];z.[6];z.[6];z.[7];z.[7];z.[7];z.[7];z.[7];z.[7];z.[7];z.[7];z.[12];z.[12];z.[12];z.[12];z.[13];z.[13];z.[13];z.[13];z.[14];z.[14];z.[14];z.[14];z.[15];z.[15];z.[15];z.[15];z.[12];z.[12];z.[12];z.[12];z.[13];z.[13];z.[13];z.[13];z.[14];z.[14];z.[14];z.[14];z.[15];z.[15];z.[15];z.[15];z.[24];z.[24];z.[25];z.[25];z.[26];z.[26];z.[27];z.[27];z.[28];z.[28];z.[29];z.[29];z.[30];z.[30];z.[31];z.[31];z.[24];z.[24];z.[25];z.[25];z.[26];z.[26];z.[27];z.[27];z.[28];z.[28];z.[29];z.[29];z.[30];z.[30];z.[31];z.[31];z.[48];z.[49];z.[50];z.[51];z.[52];z.[53];z.[54];z.[55];z.[56];z.[57];z.[58];z.[59];z.[60];z.[61];z.[62];z.[63];z.[48];z.[49];z.[50];z.[51];z.[52];z.[53];z.[54];z.[55];z.[56];z.[57];z.[58];z.[59];z.[60];z.[61];z.[62];z.[63];z.[96];z.[98];z.[100];z.[102];z.[104];z.[106];z.[108];z.[110];z.[112];z.[114];z.[116];z.[118];z.[120];z.[122];z.[124];z.[126];z.[96];z.[98];z.[100];z.[102];z.[104];z.[106];z.[108];z.[110];z.[112];z.[114];z.[116];z.[118];z.[120];z.[122];z.[124];z.[126];z.[97];z.[99];z.[101];z.[103];z.[105];z.[107];z.[109];z.[111];z.[113];z.[115];z.[117];z.[119];z.[121];z.[123];z.[125];z.[127];z.[97];z.[99];z.[101];z.[103];z.[105];z.[107];z.[109];z.[111];z.[113];z.[115];z.[117];z.[119];z.[121];z.[123];z.[125];z.[127];inFq 0;inFq 0;inFq 0;inFq 0]
  axiomatized by zetas_unpackE.

op perm_level2 : int list =
  [0;1;2;3;4;5;6;7;16;17;18;19;20;21;22;23;32;33;34;35;36;37;38;39;48;49;50;51;52;53;54;55;64;65;66;67;68;69;70;71;80;81;82;83;84;85;86;87;96;97;98;99;100;101;102;103;112;113;114;115;116;117;118;119;8;9;10;11;12;13;14;15;24;25;26;27;28;29;30;31;40;41;42;43;44;45;46;47;56;57;58;59;60;61;62;63;72;73;74;75;76;77;78;79;88;89;90;91;92;93;94;95;104;105;106;107;108;109;110;111;120;121;122;123;124;125;126;127] axiomatized by perm_level2E.

op perm_level3 : int list =
  [0;1;2;3;16;17;18;19;32;33;34;35;48;49;50;51;64;65;66;67;80;81;82;83;96;97;98;99;112;113;114;115;4;5;6;7;20;21;22;23;36;37;38;39;52;53;54;55;68;69;70;71;84;85;86;87;100;101;102;103;116;117;118;119;8;9;10;11;24;25;26;27;40;41;42;43;56;57;58;59;72;73;74;75;88;89;90;91;104;105;106;107;120;121;122;123;12;13;14;15;28;29;30;31;44;45;46;47;60;61;62;63;76;77;78;79;92;93;94;95;108;109;110;111;124;125;126;127] axiomatized by perm_level3E.

op perm_level4 : int list =
  [0;1;16;17;32;33;48;49;64;65;80;81;96;97;112;113;2;3;18;19;34;35;50;51;66;67;82;83;98;99;114;115;4;5;20;21;36;37;52;53;68;69;84;85;100;101;116;117;6;7;22;23;38;39;54;55;70;71;86;87;102;103;118;119;8;9;24;25;40;41;56;57;72;73;88;89;104;105;120;121;10;11;26;27;42;43;58;59;74;75;90;91;106;107;122;123;12;13;28;29;44;45;60;61;76;77;92;93;108;109;124;125;14;15;30;31;46;47;62;63;78;79;94;95;110;111;126;127] axiomatized by perm_level4E.

op perm_level5 : int list =
  [0;16;32;48;64;80;96;112;1;17;33;49;65;81;97;113;2;18;34;50;66;82;98;114;3;19;35;51;67;83;99;115;4;20;36;52;68;84;100;116;5;21;37;53;69;85;101;117;6;22;38;54;70;86;102;118;7;23;39;55;71;87;103;119;8;24;40;56;72;88;104;120;9;25;41;57;73;89;105;121;10;26;42;58;74;90;106;122;11;27;43;59;75;91;107;123;12;28;44;60;76;92;108;124;13;29;45;61;77;93;109;125;14;30;46;62;78;94;110;126;15;31;47;63;79;95;111;127] axiomatized by perm_level5E.

abbrev len_avx2S (k:int) = 128 %/ (2^k).
abbrev len_avx2K (k:int) = nth witness [128;64;32;16;8;4;2] k.

lemma len_avx2_equiv (k:int) : 0 <= k < 7 =>
  len_avx2S k = len_avx2K k.
rewrite -mem_range rangered => />.
do 7!(move => Hk; case Hk => />). qed.

abbrev zetasctr_avx2S (k:int) = foldl (fun c k => c + 128 %/ len_avx2S k) 0 (range 0 k).
abbrev zetasctr_avx2K (k:int) = nth witness [0;1;3;7;15;31;63] k.

lemma zetasctr_avx2_equiv (k:int) : 0 <= k < 7 =>
  zetasctr_avx2S k = zetasctr_avx2K k.
rewrite -mem_range rangered => />.
do 7!(try (move => Hk; case Hk => />); first by rewrite rangered => />). qed.

abbrev block_avx2S k = (128 %/ 2 ^ (7 - k)).
abbrev block_avx2K k = nth witness [1;2;4;8;16;32;64] k.

lemma block_avx2_equiv k : 0 <= k < 7 =>
  block_avx2S k = block_avx2K k.
  rewrite -mem_range rangered => />.
  do 7!(move => Hk; case Hk => />). qed.

lemma r_bsrev_ntt_inner_foldl_iE zetas len start r (k:int) :
  0 <= start => start + len*2 <= 256 => 0 <= k <= len =>
  forall i, (r_bsrev_ntt_inner_foldl zetas len start r k).[i] =
  if start <= i < start + k then r.[i] + zetas.[(256 %/ len + start %/ len) %/ 2] * r.[i + len]
  else if start + len <= i < start + len + k then r.[i-len] - zetas.[(256 %/ len + start %/ len) %/ 2] * r.[i]
  else r.[i].  
move => /> H1 H2. elim/natind:k => />.
(*zero*)
move => n *. rewrite /r_bsrev_ntt_inner_foldl rangered => />. rewrite (_:n=0) => />; smt(). 
(*succ*)
move => n Hn Hrec Hk Hn2 i.
rewrite /r_bsrev_ntt_inner_foldl rangeSr => />. rewrite foldl_map /= foldl_rcons => />.
rewrite /r_bsrev_ntt_inner_foldl foldl_map /r_bsrev_ntt_inner in Hrec => />.
rewrite /r_bsrev_ntt_inner => />. rewrite get_set2_add_mulr_if => />; 1..3: by smt(mem_range).
rewrite !Hrec => />; by smt(). qed.

lemma r_bsrev_ntt_outer_foldl_iE zetas len r (k:int) :
  0 <= k <= 128 %/ len =>
  forall i, (r_bsrev_ntt_outer_foldl zetas len r k).[i] =
  if 0 <= i < k*len*2 then
  if i %/ len %% 2 = 0 then r.[i] + zetas.[(256 %/ len + (i %/ len)) %/ 2] * r.[i+len]
  else r.[i-len] - zetas.[(256 %/ len + (i%/len-1)) %/ 2] * r.[i]
  else r.[i].
elim/natind:k => />.
(*zero*)
move => n *. rewrite /r_bsrev_ntt_outer_foldl rangered => />. rewrite (_:n=0) => />; smt(). 
(*succ*)
move => n Hn1 Hrec Hn2 Hn3 i.
rewrite /r_bsrev_ntt_outer_foldl rangeSr => />. rewrite foldl_map /= foldl_rcons => />.
rewrite /r_bsrev_ntt_outer_foldl foldl_map in Hrec => />.
rewrite /r_bsrev_ntt_outer r_bsrev_ntt_inner_foldl_iE => />; 1..3: by smt(). 
rewrite !Hrec => />; 1..3: by smt(). clear Hrec.
case (0 <= i) => />Hi1. case (i < n * len * 2) => />Hi2. smt().
case (i < n * (len * 2) + len) => />Hi3. rewrite (_:i %/ len = n*2) => />;1..2: by smt().
case (i < n * (len * 2) + len + len) => />Hi4. rewrite (_:i%/len = n*2+1) => />; smt().
smt(). smt(). qed.

lemma r_avx2_ntt_spec zetas r k : 0 <= k < 7 =>
  r_avx2_ntt zetas r k = Array256.init (fun i =>
    if (i %/ len_avx2K k) %% 2 = 0 then r.[i] + zetas.[zetasctr_avx2K k + i %/ (len_avx2K k*2) + 1]*r.[i+len_avx2K k] else r.[i-len_avx2K k] + (- zetas.[zetasctr_avx2K k + (i-len_avx2K k) %/ (len_avx2K k*2) + 1]*r.[i])
  ).
move => Hk. rewrite /r_avx2_ntt /r_bsrev_ntt tP => />i Hi1 Hi2.
rewrite r_bsrev_ntt_outer_foldl_iE => />. rewrite block_avx2_equiv => />. smt().
rewrite initiE Hi1 => />. 
move :Hk. rewrite -mem_range rangered => />.
do 8!(try (move => Hk; case Hk => />); first by smt()). qed.

lemma ntt_avx_0_ll : islossless NTT_AVX.___ntt_level0.
islossless. qed.
lemma ntt_avx_1_ll : islossless NTT_AVX.___ntt_level1.
islossless. qed.
lemma ntt_avx_2_ll : islossless NTT_AVX.___ntt_level2.
islossless. qed.
lemma ntt_avx_3_ll : islossless NTT_AVX.___ntt_level3.
islossless. qed.
lemma ntt_avx_4_ll : islossless NTT_AVX.___ntt_level4.
islossless. qed.
lemma ntt_avx_5_ll : islossless NTT_AVX.___ntt_level5.
islossless. qed.
lemma ntt_avx_6_ll : islossless NTT_AVX.___ntt_level6.
islossless. qed.

hoare ntt_avx_0 r zetas :
  NTT_AVX.___ntt_level0 : from_arrays16 rp = r /\ zetasp = zetas_unpack zetas ==> from_arrays16 res = r_avx2_ntt zetas r 0.
proc. 
inline *; wp; auto => />. move => /> &1. rewrite r_avx2_ntt_spec => />. apply tP_red => i. simplify.
do 256!(try (move => Hi; case Hi => />); first by rewrite !initeoE !initiE => />; rewrite zetas_unpackE => />). qed.

lemma ntt_avx_0_pr r zetas :
  phoare [NTT_AVX.___ntt_level0 : from_arrays16 rp = r /\ zetasp = zetas_unpack zetas ==> from_arrays16 res = r_avx2_ntt zetas r 0] = 1%r.
conseq ntt_avx_0_ll (ntt_avx_0 r zetas) => />. qed.

hoare ntt_avx_1 r zetas :
  NTT_AVX.___ntt_level1 : from_arrays16 rp = r /\ zetasp = zetas_unpack zetas ==> from_arrays16 res = r_avx2_ntt zetas r 1.
proc. 
inline *; wp; auto => />. move => /> &1. rewrite r_avx2_ntt_spec => />. apply tP_red => i. simplify.
do 256!(try (move => Hi; case Hi => />); first by rewrite !initeoE !initiE => />; rewrite zetas_unpackE => />). qed.

lemma ntt_avx_1_pr r zetas :
  phoare [NTT_AVX.___ntt_level1 : from_arrays16 rp = r /\ zetasp = zetas_unpack zetas ==> from_arrays16 res = r_avx2_ntt zetas r 1] = 1%r.
conseq ntt_avx_1_ll (ntt_avx_1 r zetas) => />. qed.

hoare ntt_avx_2 r zetas :
  NTT_AVX.___ntt_level2 : from_arrays16 rp = r /\ zetasp = zetas_unpack zetas ==> perm_ntt perm_level2 res = r_avx2_ntt zetas r 2.
proc.
inline *; wp; auto => />. move => /> &1. rewrite r_avx2_ntt_spec => />. apply tP_red => i. simplify.
do 256!(try (move => Hi; case Hi => />); first by rewrite !perm_level2E !shuffle8E !initiE => />; rewrite zetas_unpackE => />). qed.

lemma ntt_avx_2_pr r zetas :
  phoare [NTT_AVX.___ntt_level2 : from_arrays16 rp = r /\ zetasp = zetas_unpack zetas ==> perm_ntt perm_level2 res = r_avx2_ntt zetas r 2] = 1%r.
conseq ntt_avx_2_ll (ntt_avx_2 r zetas) => />. qed.

hoare ntt_avx_3 r zetas :
  NTT_AVX.___ntt_level3 : perm_ntt perm_level2 rp = r /\ zetasp = zetas_unpack zetas ==> perm_ntt perm_level3 res = r_avx2_ntt zetas r 3.
proc.
inline *; wp; auto => />. move => /> &1. rewrite r_avx2_ntt_spec => />. apply tP_red => i. simplify.
do 256!(try (move => Hi; case Hi => />); first by rewrite !perm_level2E !shuffle4E !perm_level3E !initiE => />; rewrite zetas_unpackE => />). qed.

lemma ntt_avx_3_pr r zetas :
  phoare [NTT_AVX.___ntt_level3 : perm_ntt perm_level2 rp = r /\ zetasp = zetas_unpack zetas ==> perm_ntt perm_level3 res = r_avx2_ntt zetas r 3] = 1%r.
conseq ntt_avx_3_ll (ntt_avx_3 r zetas) => />. qed.

hoare ntt_avx_4 r zetas :
  NTT_AVX.___ntt_level4 : perm_ntt perm_level3 rp = r /\ zetasp = zetas_unpack zetas ==> perm_ntt perm_level4 res = r_avx2_ntt zetas r 4.
proc.
inline *; wp; auto => />. move => /> &1. rewrite r_avx2_ntt_spec => />. apply tP_red => i. simplify.
do 256!(try (move => Hi; case Hi => />); first by rewrite !perm_level3E !shuffle2E !perm_level4E !initiE => />; rewrite zetas_unpackE => />). qed.

lemma ntt_avx_4_pr r zetas :
  phoare [NTT_AVX.___ntt_level4 : perm_ntt perm_level3 rp = r /\ zetasp = zetas_unpack zetas ==> perm_ntt perm_level4 res = r_avx2_ntt zetas r 4] = 1%r.
conseq ntt_avx_4_ll (ntt_avx_4 r zetas) => />. qed.

hoare ntt_avx_5 r zetas :
  NTT_AVX.___ntt_level5 : perm_ntt perm_level4 rp = r /\ zetasp = zetas_unpack zetas ==> perm_ntt perm_level5 res = r_avx2_ntt zetas r 5.
proc. 
inline *; wp; auto => />. move => /> &1. rewrite r_avx2_ntt_spec => />. apply tP_red => i. simplify.
do 256!(try (move => Hi; case Hi => />); first by rewrite !perm_level4E !perm_level5E !shuffle1E !initiE => />; rewrite zetas_unpackE => />). qed.

lemma ntt_avx_5_pr r zetas :
  phoare [NTT_AVX.___ntt_level5 : perm_ntt perm_level4 rp = r /\ zetasp = zetas_unpack zetas ==> perm_ntt perm_level5 res = r_avx2_ntt zetas r 5] = 1%r.
conseq ntt_avx_5_ll (ntt_avx_5 r zetas) => />. qed.

hoare ntt_avx_6 r zetas :
  NTT_AVX.___ntt_level6 : perm_ntt perm_level5 rp = r /\ zetasp = zetas_unpack zetas ==> perm_ntt perm_nttpack128 res = r_avx2_ntt zetas r 6.
proc. 
inline *; wp; auto => />. move => /> &1. rewrite r_avx2_ntt_spec => />. apply tP_red => i. simplify.
do 256!(try (move => Hi; case Hi => />); first by rewrite !perm_level5E !perm_nttpack128E => />; rewrite !initiE => />; rewrite !initiE => />; rewrite zetas_unpackE !initiE => />). qed.

lemma ntt_avx_6_pr r zetas :
  phoare [NTT_AVX.___ntt_level6 : perm_ntt perm_level5 rp = r /\ zetasp = zetas_unpack zetas ==> perm_ntt perm_nttpack128 res = r_avx2_ntt zetas r 6] = 1%r.
conseq ntt_avx_6_ll (ntt_avx_6 r zetas) => />. qed.

lemma ntt_avx_equiv : 
     equiv [ NTT_AVX.ntt ~ NTT_avx2.ntt :
          r{1} = NTT_avx2.r{2} /\ zetas{1} = zetas_unpack NTT_avx2.zetas{2} 
          ==> perm256 perm_nttpack128 res{1} = res{2}].
proc*.
transitivity{1} { r0 <@ NTT_AVX.ntt0t6(r,zetas); }
  (={r,zetas} ==> ={r0})
  (r{1} = NTT_avx2.r{2} /\ zetas{1} = zetas_unpack NTT_avx2.zetas{2}  ==> perm256 perm_nttpack128 r0{1}=r{2}).
  smt(). smt().
call ntt0t6_ntt. auto => />.
inline NTT_AVX.ntt0t6 NTT_avx2.ntt.
(*level 0*)
rcondt{2} 2; auto => />.
seq 3 3 : (zetas0{1}=zetas_unpack NTT_avx2.zetas{2} /\ from_arrays16 rp0{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=1 ).
exists* NTT_avx2.r{2}. exists* NTT_avx2.zetas{2}. elim*. move => zetas r.
call{1} (ntt_avx_0_pr r zetas); auto => />. rewrite !from_to_arrays16 => />.
(*level 1*)
rcondt{2} 1; auto => />.
seq 1 2 : (zetas0{1}=zetas_unpack NTT_avx2.zetas{2} /\ from_arrays16 rp1{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=2 ).
exists* NTT_avx2.r{2}. exists* NTT_avx2.zetas{2}. elim*. move => zetas r.
call{1} (ntt_avx_1_pr r zetas); auto => />.
(*level 2*)
rcondt{2} 1; auto => />.
seq 1 2 : (zetas0{1}=zetas_unpack NTT_avx2.zetas{2} /\ perm_ntt perm_level2 rp2{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=3 ).
exists* NTT_avx2.r{2}. exists* NTT_avx2.zetas{2}. elim*. move => zetas r.
call{1} (ntt_avx_2_pr r zetas); auto => />. 
(*level 3*)
rcondt{2} 1; auto => />.
seq 1 2 : (zetas0{1}=zetas_unpack NTT_avx2.zetas{2} /\ perm_ntt perm_level3 rp3{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=4 ).
exists* NTT_avx2.r{2}. exists* NTT_avx2.zetas{2}. elim*. move => zetas r.
call{1} (ntt_avx_3_pr r zetas); auto => />.
(*level 4*)
rcondt{2} 1; auto => />.
seq 1 2 : (zetas0{1}=zetas_unpack NTT_avx2.zetas{2} /\ perm_ntt perm_level4 rp4{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=5 ).
exists* NTT_avx2.r{2}. exists* NTT_avx2.zetas{2}. elim*. move => zetas r.
call{1} (ntt_avx_4_pr r zetas); auto => />.
(*level 5*)
rcondt{2} 1; auto => />.
seq 1 2 : (zetas0{1}=zetas_unpack NTT_avx2.zetas{2} /\ perm_ntt perm_level5 rp5{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=6 ).
exists* NTT_avx2.r{2}. exists* NTT_avx2.zetas{2}. elim*. move => zetas r.
call{1} (ntt_avx_5_pr r zetas); auto => />.
(*level 6*)
rcondt{2} 1; auto => />.
seq 1 2 : (zetas0{1}=zetas_unpack NTT_avx2.zetas{2} /\ perm_ntt perm_nttpack128 rp6{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=7 ).
exists* NTT_avx2.r{2}. exists* NTT_avx2.zetas{2}. elim*. move => zetas r.
call{1} (ntt_avx_6_pr r zetas); auto => />.
(*exit*)
rcondf{2} 1; auto => />. qed.
