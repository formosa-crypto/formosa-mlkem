require import AllCore List IntDiv Ring StdOrder BitEncoding Array16 Array128  Array256 Array400.
require import Fq NTT_Fq NTTAlgebra.
import Kyber.
import NTT_Properties.

import Zq IntOrder BitReverse.

theory NTT_AVX_Fq.

(* These are imperative specifications of the NTT algorithms whose control
   structure matches what is implemented.  *)

op initeo(fe fo : int -> 'a) : 'a Array16.t = 
    Array16.init (fun i => if i %% 2 = 0 then fe i else fo i) axiomatized by initeoE.

module NTT_AVX = {

proc __butterfly64x(rl0 rl1 rl2 rl3 rh0 rh1 rh2 rh3 z0 z1 : Fq Array16.t) 
    :  (Fq Array16.t) * (Fq Array16.t) * (Fq Array16.t) * (Fq Array16.t) *  
      (Fq Array16.t)  * (Fq Array16.t) * (Fq Array16.t) * (Fq Array16.t) =  {
   var rl0t, rl1t, rl2t, rl3t, rh0t, rh1t, rh2t, rh3t;

(*
t <- zeta_ * r.[j + len]; (* j + len should be the rh, j should be the rl *)
r.[j + len] <- r.[j] + (-t);  
 r.[j]       <- r.[j] + t;
*)

  (rl0t, rl1t, rl2t, rl3t, rh0t, rh1t, rh2t, rh3t) <- (rl0, rl1, rl2, rl3, rh0, rh1, rh2, rh3);

  rh0 <- Array16.init (fun i => rl0t.[i] + -(z0.[i] * rh0t.[i]));
  rl0 <- Array16.init (fun i => rl0t.[i] + z0.[i] * rh0t.[i]);

  rh1 <- Array16.init (fun i => rl1t.[i] + -(z0.[i] * rh1t.[i]));
  rl1 <- Array16.init (fun i => rl1t.[i] + z0.[i] * rh1t.[i]);

  rh2 <- Array16.init (fun i => rl2t.[i] + -(z1.[i] * rh2t.[i]));
  rl2 <- Array16.init (fun i => rl2t.[i] + z1.[i] * rh2t.[i]);

  rh3 <- Array16.init (fun i => rl3t.[i] + -(z1.[i] * rh3t.[i]));
  rl3 <- Array16.init (fun i => rl3t.[i] + z1.[i] * rh3t.[i]);

  
  return (rl0, rl1, rl2, rl3, rh0, rh1, rh2, rh3);
}

(* This procedure handles the iteration where the butterflies touch both halves
   of the 256-position array. For all the other rounds, the implementation does
   roughly the same process on each 128 position half. See loop *)

proc __ntt_level0(rp : Fq Array256.t,  zetasp : Fq Array400.t) : Fq Array256.t = {

  var  zeta0, zeta1 : Fq Array16.t;
  var r0, r1, r2, r3, r4, r5, r6, r7 : Fq Array16.t;
  var r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a : Fq Array16.t;
  var r0b, r1b, r2b, r3b, r4b, r5b, r6b, r7b : Fq Array16.t;
  var r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c : Fq Array16.t;
  var rp1,rp2,rp3,rp4,rp5,rp6,rp7,rp8 : Fq Array256.t;
  var rp9,rp10,rp11,rp12,rp13,rp14,rp15,rp16 : Fq Array256.t;

  zeta0 <- initeo (fun i => zetasp.[0]) (fun i => zetasp.[1]);
  zeta1 <- initeo (fun i => zetasp.[2]) (fun i => zetasp.[3]);

  r0 <- Array16.init (fun i =>  rp.[i +   0]);
  r1 <- Array16.init (fun i =>  rp.[i +  16]);
  r2 <- Array16.init (fun i =>  rp.[i +  32]);
  r3 <- Array16.init (fun i =>  rp.[i +  48]);
  r4 <- Array16.init (fun i =>  rp.[i + 128]);
  r5 <- Array16.init (fun i =>  rp.[i + 144]);
  r6 <- Array16.init (fun i =>  rp.[i + 160]);
  r7 <- Array16.init (fun i =>  rp.[i + 176]);

  (r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a) <@ 
      __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta0, zeta1);

  rp1 <- Array256.fill (fun i => r0a.[i %% 16])   0 16 rp;
  rp2 <- Array256.fill (fun i => r1a.[i %% 16])  16 16 rp1;
  rp3 <- Array256.fill (fun i => r2a.[i %% 16])  32 16 rp2;
  rp4 <- Array256.fill (fun i => r3a.[i %% 16])  48 16 rp3;
  rp5 <- Array256.fill (fun i => r4a.[i %% 16]) 128 16 rp4;
  rp6 <- Array256.fill (fun i => r5a.[i %% 16]) 144 16 rp5;
  rp7 <- Array256.fill (fun i => r6a.[i %% 16]) 160 16 rp6;
  rp8 <- Array256.fill (fun i => r7a.[i %% 16]) 176 16 rp7;

  r0b <- Array16.init (fun i =>  rp.[i +  64]);
  r1b <- Array16.init (fun i =>  rp.[i +  80]);
  r2b <- Array16.init (fun i =>  rp.[i +  96]);
  r3b <- Array16.init (fun i =>  rp.[i + 112]);
  r4b <- Array16.init (fun i =>  rp.[i + 192]);
  r5b <- Array16.init (fun i =>  rp.[i + 208]);
  r6b <- Array16.init (fun i =>  rp.[i + 224]);
  r7b <- Array16.init (fun i =>  rp.[i + 240]);

  (r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c) <@ 
      __butterfly64x(r0b, r1b, r2b, r3b, r4b, r5b, r6b, r7b, zeta0, zeta1);

   rp9 <- Array256.fill (fun i => r0c.[i %% 16])  64 16 rp8;
  rp10 <- Array256.fill (fun i => r1c.[i %% 16])  80 16 rp9;
  rp11 <- Array256.fill (fun i => r2c.[i %% 16])  96 16 rp10;
  rp12 <- Array256.fill (fun i => r3c.[i %% 16]) 112 16 rp11;
  rp13 <- Array256.fill (fun i => r4c.[i %% 16]) 192 16 rp12;
  rp14 <- Array256.fill (fun i => r5c.[i %% 16]) 208 16 rp13;
  rp15 <- Array256.fill (fun i => r6c.[i %% 16]) 224 16 rp14;
  rp16 <- Array256.fill (fun i => r7c.[i %% 16]) 240 16 rp15;

  return rp16;
}

proc __ntt_level1t6(rp : Fq Array256.t,  zetasp : Fq Array400.t) : Fq Array256.t = {

  var  zeta0, zeta1, zeta0b, zeta1b, zeta0d, zeta1d : Fq Array16.t; 
  var  zeta0f, zeta1f, zeta0h, zeta1h, zeta0i, zeta1i : Fq Array16.t; 
  var  zeta0k, zeta1k, zeta0m, zeta1m, zeta0o, zeta1o : Fq Array16.t; 
  var  zeta0q, zeta1q, zeta0s, zeta1s, zeta0t, zeta1t : Fq Array16.t; 
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
  var r0v, r1v, r2v, r3v, r4v, r5v, r6v, r7v : Fq Array16.t;
  var r0x, r1x, r2x, r3x, r4x, r5x, r6x, r7x : Fq Array16.t;
  var rp1, rp2, rp3, rp4, rp5, rp6, rp7, rp8 : Fq Array256.t;
  var rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16 : Fq Array256.t;


(**** LEFT-HALF*****)

(*
  j <- 0;
  while (j < 2) {
*)
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
        __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta0, zeta1);

    (* level 2 *)

    zeta0b <- Array16.init (fun i => zetasp.[ 8 + 196*0 + i]);
    zeta1b <- Array16.init (fun i => zetasp.[24 + 196*0 + i]);

    r0b <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15 
                                 then r4a.[i-8] else r0a.[i]);
    r4b <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r4a.[i+8] else r0a.[i]);

    r1b <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15
                                 then r5a.[i-8] else r1a.[i]);
    r5b <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r5a.[i+8] else r1a.[i]);

    r2b <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15
                                 then r6a.[i-8] else r2a.[i]);
    r6b <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r6a.[i+8] else r2a.[i]);

    r3b <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15
                                 then r7a.[i-8] else r3a.[i]);
    r7b <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r7a.[i+8] else r3a.[i]);

    (r0c, r4c, r1c, r5c, r2c, r6c, r3c, r7c) <@ 
        __butterfly64x(r0b, r4b, r1b, r5b, r2b, r6b, r3b, r7b, zeta0b, zeta1b);

    (* level 3 *)

    zeta0d <- Array16.init (fun i => zetasp.[40 + 196*0 + i]);
    zeta1d <- Array16.init (fun i => zetasp.[56 + 196*0 + i]);

    r0d <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r2c.[i-4] else r0c.[i]);
    r2d <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11  
                                 then r2c.[i+4] else r0c.[i]);

    r4d <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r6c.[i-4] else r4c.[i]);
    r6d <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11 
                                 then r6c.[i+4] else r4c.[i]);

    r1d <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r3c.[i-4] else r1c.[i]);
    r3d <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11 
                                 then r3c.[i+4] else r1c.[i]);

    r5d <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r7c.[i-4] else r5c.[i]);
    r7d <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11 
                                 then r7c.[i+4] else r5c.[i]);

    (r0e, r2e, r4e, r6e, r1e, r3e, r5e, r7e) <@ 
         __butterfly64x(r0d, r2d, r4d, r6d, r1d, r3d, r5d, r7d, zeta0d, zeta1d);

    (* level 4 *)

    zeta0f <- Array16.init (fun i => zetasp.[72 + 196*0 + i]);
    zeta1f <- Array16.init (fun i => zetasp.[88 + 196*0 + i]);

    r0f <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r1e.[i-2] else r0e.[i]);
    r1f <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13 
                                 then r1e.[i+2] else r0e.[i]);

    r2f <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r3e.[i-2] else r2e.[i]);
    r3f <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13
                                 then r3e.[i+2] else r2e.[i]);

    r4f <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r5e.[i-2] else r4e.[i]);
    r5f <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13
                                 then r5e.[i+2] else r4e.[i]);

    r6f <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r7e.[i-2] else r6e.[i]);
    r7f <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13 
                                 then r7e.[i+2] else r6e.[i]);

    (r0g, r1g, r2g, r3g, r4g, r5g, r6g, r7g) <@ 
           __butterfly64x(r0f, r1f, r2f, r3f, r4f, r5f, r6f, r7f, zeta0f, zeta1f);

    (* level 5 *)

    zeta0h <- Array16.init (fun i => zetasp.[104 + 196*0 + i]);
    zeta1h <- Array16.init (fun i => zetasp.[120 + 196*0 + i]);

    r0h <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r4g.[i-1] else r0g.[i]);
    r4h <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r4g.[i+1] else r0g.[i]);

    r1h <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r5g.[i-1] else r1g.[i]);
    r5h <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r5g.[i+1] else r1g.[i]);

    r2h <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r6g.[i-1] else r2g.[i]);
    r6h <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r6g.[i+1] else r2g.[i]);

    r3h <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r7g.[i-1] else r3g.[i]);
    r7h <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r7g.[i+1] else r3g.[i]);


    ( r0i, r4i, r1i, r5i, r2i, r6i, r3i, r7i ) <@ 
         __butterfly64x(r0h, r4h, r1h, r5h, r2h, r6h, r3h, r7h, zeta0h, zeta1h);

    (* level 6 *)

    zeta0i <- Array16.init (fun i => zetasp.[136 + 196*0 + i]);
    zeta1i <- Array16.init (fun i => zetasp.[168 + 196*0 + i]);
(*
    zeta2 <- Array16.init (fun i => zetasp.[152 + 196*j + i]); (* I am betting these are used to prepare the reduction step *)
    zeta3 <- Array16.init (fun i => zetasp.[184 + 196*j + i]); (* I am betting these are used to prepare the reduction step *)
*)
    (r0j, r4j, r2j, r6j, r1j, r5j, r3j, r7j) <@ 
          __butterfly64x(r0i, r4i, r2i, r6i, r1i, r5i, r3i, r7i, zeta0i, zeta1i);

    rp1 <- Array256.fill (fun i => r0.[i %% 16]) ( 64 + 128*0) 16 rp;
    rp2 <- Array256.fill (fun i => r1.[i %% 16]) ( 80 + 128*0) 16 rp1;
    rp3 <- Array256.fill (fun i => r2.[i %% 16]) ( 96 + 128*0) 16 rp2;
    rp4 <- Array256.fill (fun i => r3.[i %% 16]) (112 + 128*0) 16 rp3;
    rp5 <- Array256.fill (fun i => r4.[i %% 16]) (192 + 128*0) 16 rp4;
    rp6 <- Array256.fill (fun i => r5.[i %% 16]) (208 + 128*0) 16 rp5;
    rp7 <- Array256.fill (fun i => r6.[i %% 16]) (224 + 128*0) 16 rp6;
    rp8 <- Array256.fill (fun i => r7.[i %% 16]) (240 + 128*0) 16 rp7;

(*
    j <- j + 1;
(* 
    vx16 = jvx16[u256 0];

    r0 = __red16x(r0, qx16, vx16);
    r4 = __red16x(r4, qx16, vx16);
    r2 = __red16x(r2, qx16, vx16);
    r6 = __red16x(r6, qx16, vx16);
    r1 = __red16x(r1, qx16, vx16);
    r5 = __red16x(r5, qx16, vx16);
    r3 = __red16x(r3, qx16, vx16);
    r7 = __red16x(r7, qx16, vx16);

    // r0, r4, r1, r5, r2, r6, r3, r7 = __nttpack128(r0, r4, r1, r5, r2, R6, r3, r7);

    rp.[u256 32*0+256*i] = r0;
    rp.[u256 32*1+256*i] = r4;
    rp.[u256 32*2+256*i] = r1;
    rp.[u256 32*3+256*i] = r5;
    rp.[u256 32*4+256*i] = r2;
    rp.[u256 32*5+256*i] = r6;
    rp.[u256 32*6+256*i] = r3;
    rp.[u256 32*7+256*i] = r7;
  }
*)
  }
*)

(**** RIGHT-HALF*****)

(*
  while (j < 2) {
*)
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
        __butterfly64x(r0k, r1k, r2k, r3k, r4k, r5k, r6k, r7k, zeta0k, zeta1k);

    (* level 2 *)

    zeta0m <- Array16.init (fun i => zetasp.[ 8 + 196*1 + i]);
    zeta1m <- Array16.init (fun i => zetasp.[24 + 196*1 + i]);

    r0m <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15 
                                 then r4l.[i-8] else r0l.[i]);
    r4m <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r4l.[i+8] else r0l.[i]);

    r1m <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15
                                 then r5l.[i-8] else r1l.[i]);
    r5m <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r5l.[i+8] else r1l.[i]);

    r2m <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15
                                 then r6l.[i-8] else r2l.[i]);
    r6m <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r6l.[i+8] else r2l.[i]);

    r3m <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15
                                 then r7l.[i-8] else r3l.[i]);
    r7m <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r7l.[i+8] else r3l.[i]);

    (r0n, r4n, r1n, r5n, r2n, r6n, r3n, r7n) <@ 
        __butterfly64x(r0m, r4m, r1m, r5m, r2m, r6m, r3m, r7m, zeta0m, zeta1m);

    (* level 3 *)

    zeta0o <- Array16.init (fun i => zetasp.[40 + 196*1 + i]);
    zeta1o <- Array16.init (fun i => zetasp.[56 + 196*1 + i]);

    r0o <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r2n.[i-4] else r0n.[i]);
    r2o <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11  
                                 then r2n.[i+4] else r0n.[i]);

    r4o <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r6n.[i-4] else r4n.[i]);
    r6o <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11 
                                 then r6n.[i+4] else r4n.[i]);

    r1o <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r3n.[i-4] else r1n.[i]);
    r3o <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11 
                                 then r3n.[i+4] else r1n.[i]);

    r5o <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r7n.[i-4] else r5n.[i]);
    r7o <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11 
                                 then r7n.[i+4] else r5n.[i]);

    (r0p, r2p, r4p, r6p, r1p, r3p, r5p, r7p) <@ 
         __butterfly64x(r0o, r2o, r4o, r6o, r1o, r3o, r5o, r7o, zeta0o, zeta1o);

    (* level 4 *)

    zeta0q <- Array16.init (fun i => zetasp.[72 + 196*1 + i]);
    zeta1q <- Array16.init (fun i => zetasp.[88 + 196*1 + i]);

    r0q <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r1p.[i-2] else r0p.[i]);
    r1q <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13 
                                 then r1p.[i+2] else r0p.[i]);

    r2q <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r3p.[i-2] else r2p.[i]);
    r3q <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13
                                 then r3p.[i+2] else r2p.[i]);

    r4q <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r5p.[i-2] else r4p.[i]);
    r5q <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13
                                 then r5p.[i+2] else r4p.[i]);

    r6q <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r7p.[i-2] else r6p.[i]);
    r7q <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13 
                                 then r7p.[i+2] else r6p.[i]);

    (r0r, r1r, r2r, r3r, r4r, r5r, r6r, r7r) <@ 
           __butterfly64x(r0q, r1q, r2q, r3q, r4q, r5q, r6q, r7q, zeta0q, zeta1q);

    (* level 5 *)

    zeta0s <- Array16.init (fun i => zetasp.[104 + 196*1 + i]);
    zeta1s <- Array16.init (fun i => zetasp.[120 + 196*1 + i]);

    r0s <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r4r.[i-1] else r0r.[i]);
    r4s <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r4r.[i+1] else r0r.[i]);

    r1s <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r5r.[i-1] else r1r.[i]);
    r5s <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r5r.[i+1] else r1r.[i]);

    r2s <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r6r.[i-1] else r2r.[i]);
    r6s <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r6r.[i+1] else r2r.[i]);

    r3s <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r7r.[i-1] else r3r.[i]);
    r7s <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r7r.[i+1] else r3r.[i]);


    ( r0t, r4t, r1t, r5t, r2t, r6t, r3t, r7t ) <@ 
         __butterfly64x(r0s, r4s, r1s, r5s, r2s, r6s, r3s, r7s, zeta0s, zeta1s);

    (* level 6 *)

    zeta0t <- Array16.init (fun i => zetasp.[136 + 196*1 + i]);
    zeta1t <- Array16.init (fun i => zetasp.[168 + 196*1 + i]);
(*
    zeta2 <- Array16.init (fun i => zetasp.[152 + 196*j + i]); (* I am betting these are used to prepare the reduction step *)
    zeta3 <- Array16.init (fun i => zetasp.[184 + 196*j + i]); (* I am betting these are used to prepare the reduction step *)
*)
    (r0u, r4u, r2u, r6u, r1u, r5u, r3u, r7u) <@ 
          __butterfly64x(r0t, r4t, r2t, r6t, r1t, r5t, r3t, r7t, zeta0t, zeta1t);

    rp9 <- Array256.fill (fun i => r0.[i %% 16]) ( 64 + 128*1) 16 rp8;
    rp10 <- Array256.fill (fun i => r1.[i %% 16]) ( 80 + 128*1) 16 rp9;
    rp11 <- Array256.fill (fun i => r2.[i %% 16]) ( 96 + 128*1) 16 rp10;
    rp12 <- Array256.fill (fun i => r3.[i %% 16]) (112 + 128*1) 16 rp11;
    rp13 <- Array256.fill (fun i => r4.[i %% 16]) (192 + 128*1) 16 rp12;
    rp14 <- Array256.fill (fun i => r5.[i %% 16]) (208 + 128*1) 16 rp13;
    rp15 <- Array256.fill (fun i => r6.[i %% 16]) (224 + 128*1) 16 rp14;
    rp16 <- Array256.fill (fun i => r7.[i %% 16]) (240 + 128*1) 16 rp15;

(*
    j <- j + 1;
(* 
    vx16 = jvx16[u256 0];

    r0 = __red16x(r0, qx16, vx16);
    r4 = __red16x(r4, qx16, vx16);
    r2 = __red16x(r2, qx16, vx16);
    r6 = __red16x(r6, qx16, vx16);
    r1 = __red16x(r1, qx16, vx16);
    r5 = __red16x(r5, qx16, vx16);
    r3 = __red16x(r3, qx16, vx16);
    r7 = __red16x(r7, qx16, vx16);

    // r0, r4, r1, r5, r2, r6, r3, r7 = __nttpack128(r0, r4, r1, r5, r2, R6, r3, r7);

    rp.[u256 32*0+256*i] = r0;
    rp.[u256 32*1+256*i] = r4;
    rp.[u256 32*2+256*i] = r1;
    rp.[u256 32*3+256*i] = r5;
    rp.[u256 32*4+256*i] = r2;
    rp.[u256 32*5+256*i] = r6;
    rp.[u256 32*6+256*i] = r3;
    rp.[u256 32*7+256*i] = r7;
  }
*)
  }
*)


    return rp16;
 }

 proc ntt(r : Fq Array256.t,  zetas : Fq Array400.t) : Fq Array256.t = {
   var rp0,rp6 : Fq Array256.t;
  rp0 <@ __ntt_level0(r,zetas);
  rp6 <@ __ntt_level1t6(rp0,zetas);
  return rp6;
 }
}.

op zetas_unpack : Fq Array128.t -> Fq Array400.t.
op ntt_pack : Fq Array256.t -> Fq Array256.t.

pred zetas_level0 = forall (refz : Fq Array128.t),
                           (zetas_unpack refz).[0] = refz.[1] /\
                           (zetas_unpack refz).[1] = refz.[1] /\
                           (zetas_unpack refz).[2] = refz.[1] /\
                           (zetas_unpack refz).[3] = refz.[1].

import NTTequiv.

require import Array256_extra.

lemma  ifsplit (b : bool) (t e r : 'a) :
   (b => (t = r)) => (!b => (e = r)) =>
       (if b then t else e) = r 
   by move => Ht Hf; case b; auto.

lemma ntt_avx_ntt_opt : 
     zetas_level0 =>
     equiv [ NTT_AVX.ntt ~ NTT_opt.ntt :
          r{1} = NTT_vars.r{2} /\ zetas{1} = zetas_unpack NTT_vars.zetas{2}
          ==>
          ntt_pack res{1} = res{2}].
move => zetasl0.
proc. 
inline {1} 1; unroll {2} ^while.
rcondt {2} 3; 1: by move => *; auto.
inline {2} 3.
seq 39 5 :
  (rp0{1} = NTT_vars.r{2} /\ zetasp{1} = zetas_unpack NTT_vars.zetas{2} /\
  NTT_vars.zetasctr{2} = 1 /\ NTT_vars.len{2} = 64).
+ inline *. 
  unroll {2} ^while.
  rcondt {2} 4; 1: by move => *; auto.
  wp 78 9 ; conseq />.
  while {2} (#post /\ NTT_vars.start{2} = 256 /\ NTT_vars.len{2} = 128) (NTT_vars.start{2}). 
  + move => *; conseq />. 
    wp; while (NTT_vars.start <= NTT_vars.j <= NTT_vars.start + NTT_vars.len) (NTT_vars.start + NTT_vars.len - NTT_vars.j);
     by move => *; auto => /> /#. 
  swap {2} 3 2.
  wp 78 7; conseq />.
  while {2} (zetas{1} = zetas_unpack NTT_vars.zetas{2} /\
             NTT_vars.zetasctr{2} = 1 /\
             NTT_vars.len{2} = 128 /\
             NTT_vars.zeta_{2} = NTT_vars.zetas{2}.[1] /\
             NTT_vars.start{2} = 0 /\
             0 <= NTT_vars.j{2} <= 128 /\
             (forall k, NTT_vars.j{2} <= k < 128 =>
                 NTT_vars.r{2}.[k] = r{1}.[k] /\
                 NTT_vars.r{2}.[k + 128] = r{1}.[k + 128]) /\
             (forall k, 0 <= k < NTT_vars.j{2} => 
                NTT_vars.r{2}.[k] = r{1}.[k] + NTT_vars.zetas{2}.[1]*r{1}.[k+128] /\
                NTT_vars.r{2}.[k + 128] = r{1}.[k] + (- NTT_vars.zetas{2}.[1]*r{1}.[k+128])))
             (128 - NTT_vars.j{2}).  
  move => &1 ?; auto => /> &2 Hl Hh Hold Hnew ib; split; 2: by smt().
  split; 1: by smt().
  split; 1: by move => k kbl kbh; split; rewrite !set_neqiE 1..3:/#. 
  + move => k kbl kbh; split.
    + case (k = NTT_vars.j{2}); last first.
      + by move => Hc;rewrite !set_neqiE 1..3:/#. 
      move => Hk; rewrite -Hk set_eqiE 1..2:/#. 
      rewrite set_neqiE 1:/#.  
      by move : (Hold k _); smt().
    + case (k = NTT_vars.j{2}); last first.
      + by move => Hc;rewrite !set_neqiE 1..3:/#. 
      move => Hk; rewrite -Hk set_neqiE 1:/#. 
      rewrite set_eqiE 1,2:/#.  
      by move : (Hold (k) _); smt().
  (* Unrolled one level on the right *)
  auto => /> &2; split; 1 : by smt().
  move => j2 r2;split; 1: by smt().
  move => Hexit Hl Hh Hold Hrecent; split;last by smt().
  apply Array256.tP => i /=.
  do 16!(
  move => *;
  rewrite filliE 1:/# /=; 
  apply ifsplit; 1: by
    move => *; do 3!(rewrite initiE 1:/# /=);
                 rewrite initeoE /= initiE 1:/# /=; smt()). 
  by smt().
(* Level 0 done *)
unroll {2} ^while.
rcondt {2} 1; 1: by move => *; auto.
inline {1} 1;inline {2} 1.
swap {1} [69..79] -55.
seq 24 3 :
  (r0a0{1} = Array16.init (fun i => NTT_vars.r{2}.[i+0]) /\
   r1a0{1} = Array16.init (fun i => NTT_vars.r{2}.[i+16]) /\
   r2a0{1} = Array16.init (fun i => NTT_vars.r{2}.[i+32]) /\
   r3a0{1} = Array16.init (fun i => NTT_vars.r{2}.[i+48]) /\
   r4a0{1} = Array16.init (fun i => NTT_vars.r{2}.[i+64]) /\
   r5a0{1} = Array16.init (fun i => NTT_vars.r{2}.[i+80]) /\
   r6a0{1} = Array16.init (fun i => NTT_vars.r{2}.[i+96]) /\
   r7a0{1} = Array16.init (fun i => NTT_vars.r{2}.[i+112]) /\
   r0k{1} = Array16.init (fun i => NTT_vars.r{2}.[i+0+128]) /\
   r1k{1} = Array16.init (fun i => NTT_vars.r{2}.[i+16+128]) /\
   r2k{1} = Array16.init (fun i => NTT_vars.r{2}.[i+32+128]) /\
   r3k{1} = Array16.init (fun i => NTT_vars.r{2}.[i+48+128]) /\
   r4k{1} = Array16.init (fun i => NTT_vars.r{2}.[i+64+128]) /\
   r5k{1} = Array16.init (fun i => NTT_vars.r{2}.[i+80+128]) /\
   r6k{1} = Array16.init (fun i => NTT_vars.r{2}.[i+96+128]) /\
   r7k{1} = Array16.init (fun i => NTT_vars.r{2}.[i+112+128]) /\
   zetasp{1} = zetas_unpack NTT_vars.zetas{2} /\
  NTT_vars.zetasctr{2} = 2 /\ NTT_vars.len{2} = 32).
  inline *. wp 62 2.
  (* We need to have a simple way to transform the right-hand side
     loop iterations into a functional spec. Could it be easier to
     just prove this using hoare and a functional spec? @Antoine? *)
admit.
admit.

qed.  

hoare ntt_spec_avx_h _r :
    NTT_AVX.ntt :
      arg = (_r, zetas_unpack NTT_Fq.zetas) ==>
      ntt_pack res = ntt _r.
admitted.



