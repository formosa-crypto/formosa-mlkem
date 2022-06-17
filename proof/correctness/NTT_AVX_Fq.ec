require import AllCore List IntDiv Ring StdOrder BitEncoding Array16 Array128  Array256 Array400.
require import Fq NTT_Fq.
import Kyber.
import NTT_Properties.

import Zq IntOrder BitReverse.

theory NTT_AVX_Fq.

(* These are imperative specifications of the NTT algorithms whose control
   structure matches what is implemented.  *)

module NTT_AVX = {

proc __butterfly64x(rl0 rl1 rl2 rl3 rh0 rh1 rh2 rh3 zl0 zl1 zh0 zh1 : Fq Array16.t) 
    :  (Fq Array16.t) * (Fq Array16.t) * (Fq Array16.t) * (Fq Array16.t) *  
      (Fq Array16.t)  * (Fq Array16.t) * (Fq Array16.t) * (Fq Array16.t) =  {
   var t0, t1, t2, t3 : (Fq Array16.t);

(*
t <- zeta_ * r.[j + len]; (* j + len should be the rh, j should be the rl *)
r.[j + len] <- r.[j] + (-t);  
 r.[j]       <- r.[j] + t;
*)
  var i : int;

  i <- 0;
  while (i < 16) {
    t0.[i] <- zl0.[i] * rh0.[i];
    rh0.[i] <- rl0.[i] + (-t0.[i]);
    rl0.[i] <- rl0.[i] + t0.[i];  

    t1.[i] <- zl0.[i] * rh1.[i];
    rh1.[i] <- rl1.[i] + (-t1.[i]);
    rl1.[i] <- rl1.[i] + t1.[i];  

    t2.[i] <- zl1.[i] * rh2.[i];
    rh2.[i] <- rl2.[i] + (-t2.[i]);
    rl2.[i] <- rl2.[i] + t2.[i];  

    t3.[i] <- zl1.[i] * rh3.[i];
    rh3.[i] <- rl3.[i] + (-t3.[i]);
    rl3.[i] <- rl3.[i] + t3.[i];  
   
    i <- i + 1;
  }
  
  return (rl0, rl1, rl2, rl3, rh0, rh1, rh2, rh3);
}

(* This procedure handles the iteration where the butterflies touch both halves
   of the 256-position array. For all the other rounds, the implementation does
   roughly the same process on each 128 position half. See loop *)

proc __ntt_level0(rp : Fq Array256.t,  zetasp : Fq Array400.t) : Fq Array256.t = {

  var  zeta0, zeta1, r0, r1, r2, r3, r4, r5, r6, r7 : Fq Array16.t;

  zeta0 <- Array16.init (fun i => if i %% 2 = 0 then zetasp.[0] else zetasp.[1]);
  zeta1 <- Array16.init (fun i => if i %% 2 = 0 then zetasp.[2] else zetasp.[3]);

  r0 <- Array16.init (fun i =>  rp.[i +   0]);
  r1 <- Array16.init (fun i =>  rp.[i +  16]);
  r2 <- Array16.init (fun i =>  rp.[i +  32]);
  r3 <- Array16.init (fun i =>  rp.[i +  48]);
  r4 <- Array16.init (fun i =>  rp.[i + 128]);
  r5 <- Array16.init (fun i =>  rp.[i + 144]);
  r6 <- Array16.init (fun i =>  rp.[i + 160]);
  r7 <- Array16.init (fun i =>  rp.[i + 176]);

  (r0, r1, r2, r3, r4, r5, r6, r7) <@ 
      __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1);

  rp <- Array256.fill (fun i => r0.[i %% 16])   0 16 rp;
  rp <- Array256.fill (fun i => r1.[i %% 16])  16 16 rp;
  rp <- Array256.fill (fun i => r2.[i %% 16])  32 16 rp;
  rp <- Array256.fill (fun i => r3.[i %% 16])  48 16 rp;
  rp <- Array256.fill (fun i => r4.[i %% 16]) 128 16 rp;
  rp <- Array256.fill (fun i => r5.[i %% 16]) 144 16 rp;
  rp <- Array256.fill (fun i => r6.[i %% 16]) 160 16 rp;
  rp <- Array256.fill (fun i => r7.[i %% 16]) 176 16 rp;

  r0 <- Array16.init (fun i =>  rp.[i +  64]);
  r1 <- Array16.init (fun i =>  rp.[i +  80]);
  r2 <- Array16.init (fun i =>  rp.[i +  96]);
  r3 <- Array16.init (fun i =>  rp.[i + 112]);
  r4 <- Array16.init (fun i =>  rp.[i + 192]);
  r5 <- Array16.init (fun i =>  rp.[i + 208]);
  r6 <- Array16.init (fun i =>  rp.[i + 224]);
  r7 <- Array16.init (fun i =>  rp.[i + 240]);

  (r0, r1, r2, r3, r4, r5, r6, r7) <@ 
      __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1);

  rp <- Array256.fill (fun i => r0.[i %% 16])  64 16 rp;
  rp <- Array256.fill (fun i => r1.[i %% 16])  80 16 rp;
  rp <- Array256.fill (fun i => r2.[i %% 16])  96 16 rp;
  rp <- Array256.fill (fun i => r3.[i %% 16]) 112 16 rp;
  rp <- Array256.fill (fun i => r4.[i %% 16]) 192 16 rp;
  rp <- Array256.fill (fun i => r5.[i %% 16]) 208 16 rp;
  rp <- Array256.fill (fun i => r6.[i %% 16]) 224 16 rp;
  rp <- Array256.fill (fun i => r7.[i %% 16]) 240 16 rp;

  return rp;
}

proc __ntt_level1t6(rp : Fq Array256.t,  zetasp : Fq Array400.t) : Fq Array256.t = {

  var  zeta0, zeta1, zeta2, zeta3, r0, r1, r2, r3, r4, r5, r6, r7, qx16, vx16 : Fq Array16.t;
  var r0t, r1t, r2t, r3t, r4t, r5t, r6t, r7t : Fq Array16.t;
  var j : int;

  (* level 1 *)

  j <- 0;
  while (j < 2) {

    zeta0 <- Array16.init (fun i => if i %% 2 = 0 then zetasp.[4 + 196*j] else zetasp.[4 + 196*j + 1]);
    zeta1 <- Array16.init (fun i => if i %% 2 = 0 then zetasp.[6 + 196*j] else zetasp.[6 + 196*j + 1]);

    r0 <- Array16.init (fun i =>  rp.[i +   0 + 128*j]);
    r1 <- Array16.init (fun i =>  rp.[i +  16 + 128*j]);
    r2 <- Array16.init (fun i =>  rp.[i +  32 + 128*j]);
    r3 <- Array16.init (fun i =>  rp.[i +  48 + 128*j]);
    r4 <- Array16.init (fun i =>  rp.[i +  64 + 128*j]);
    r5 <- Array16.init (fun i =>  rp.[i +  80 + 128*j]);
    r6 <- Array16.init (fun i =>  rp.[i +  96 + 128*j]);
    r7 <- Array16.init (fun i =>  rp.[i + 112 + 128*j]);

    (r0, r1, r2, r3, r4, r5, r6, r7) <@ 
        __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1);

    (* level 2 *)

    zeta0 <- Array16.init (fun i => zetasp.[ 8 + 196*j + i]);
    zeta1 <- Array16.init (fun i => zetasp.[24 + 196*j + i]);

    (r0t,r1t,r2t,r3t,r4t,r5t,r6t,r7t) <- (r0, r1, r2, r3, r4, r5, r6, r7);

    r0 <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15 
                                 then r4t.[i-8] else r0t.[i]);
    r4 <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r4t.[i+8] else r0t.[i]);

    r1 <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15
                                 then r5t.[i-8] else r1t.[i]);
    r5 <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r5t.[i+8] else r1t.[i]);

    r2 <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15
                                 then r6t.[i-8] else r2t.[i]);
    r6 <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r6t.[i+8] else r2t.[i]);

    r3 <- Array16.init (fun i => if i = 8 || i = 9 || i = 10 || i = 11 || i =  12 || i =  13 || i = 14 || i = 15
                                 then r7t.[i-8] else r3t.[i]);
    r7 <- Array16.init (fun i => if i = 0 || i = 1 || i =  2 || i =  3 || i =   4 || i =   5 || i =  6 || i =  7  
                                 then r7t.[i+8] else r3t.[i]);

    (r0, r4, r1, r5, r2, r6, r3, r7) <@ 
        __butterfly64x(r0, r4, r1, r5, r2, r6, r3, r7, zeta0, zeta0, zeta1, zeta1);

    (* level 3 *)

    zeta0 <- Array16.init (fun i => zetasp.[40 + 196*j + i]);
    zeta1 <- Array16.init (fun i => zetasp.[56 + 196*j + i]);

    (r0t,r1t,r2t,r3t,r4t,r5t,r6t,r7t) <- (r0, r1, r2, r3, r4, r5, r6, r7);

    r0 <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r2t.[i-4] else r0t.[i]);
    r2 <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11  
                                 then r2t.[i+4] else r0t.[i]);

    r4 <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r6t.[i-4] else r4t.[i]);
    r6 <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11 
                                 then r6t.[i+4] else r4t.[i]);

    r1 <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r3t.[i-4] else r1t.[i]);
    r3 <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11 
                                 then r3t.[i+4] else r1t.[i]);

    r5 <- Array16.init (fun i => if i = 4 || i = 5 || i = 6 || i = 7 || i = 12 || i = 13 || i = 14 || i = 15 
                                 then r7t.[i-4] else r5t.[i]);
    r7 <- Array16.init (fun i => if i = 0 || i = 1 || i = 2 || i = 3 || i =  8 || i =  9 || i = 10 || i = 11 
                                 then r7t.[i+4] else r5t.[i]);

    (r0, r2, r4, r6, r1, r3, r5, r7) <@ 
         __butterfly64x(r0, r2, r4, r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1);

    (* level 4 *)

    zeta0 <- Array16.init (fun i => zetasp.[72 + 196*j + i]);
    zeta1 <- Array16.init (fun i => zetasp.[88 + 196*j + i]);

    (r0t,r1t,r2t,r3t,r4t,r5t,r6t,r7t) <- (r0, r1, r2, r3, r4, r5, r6, r7);

    r0 <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r1t.[i-2] else r0t.[i]);
    r1 <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13 
                                 then r1t.[i+2] else r0t.[i]);

    r2 <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r3t.[i-2] else r2t.[i]);
    r3 <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13
                                 then r3t.[i+2] else r2t.[i]);

    r4 <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r5t.[i-2] else r4t.[i]);
    r5 <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13
                                 then r5t.[i+2] else r4t.[i]);

    r6 <- Array16.init (fun i => if i = 2 || i = 3 || i = 6 || i = 7 || i = 10 || i = 11 || i = 14 || i = 15 
                                 then r7t.[i-2] else r6t.[i]);
    r7 <- Array16.init (fun i => if i = 0 || i = 1 || i = 4 || i = 5 || i =  8 || i =  9 || i = 12 || i = 13 
                                 then r7t.[i+2] else r6t.[i]);

    (r0, r1, r2, r3, r4, r5, r6, r7) <@ 
           __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1);

    (* level 5 *)

    zeta0 <- Array16.init (fun i => zetasp.[104 + 196*j + i]);
    zeta1 <- Array16.init (fun i => zetasp.[120 + 196*j + i]);

    r0 <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r4t.[i-1] else r0t.[i]);
    r4 <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r4t.[i+1] else r0t.[i]);

    r1 <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r5t.[i-1] else r1t.[i]);
    r5 <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r5t.[i+1] else r1t.[i]);

    r2 <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r6t.[i-1] else r2t.[i]);
    r6 <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r6t.[i+1] else r2t.[i]);

    r3 <- Array16.init (fun i => if i = 1 || i = 3 || i = 5 || i = 7 || i = 9 || i = 11 || i = 13 || i = 15 
                                 then r7t.[i-1] else r3t.[i]);
    r7 <- Array16.init (fun i => if i = 0 || i = 2 || i = 4 || i = 6 || i = 8 || i = 10 || i = 12 || i = 14 
                                 then r7t.[i+1] else r3t.[i]);


    ( r0, r4, r1, r5, r2, r6, r3, r7 ) <@ 
         __butterfly64x(r0, r4, r1, r5, r2, r6, r3, r7, zeta0, zeta0, zeta1, zeta1);

    (* level 6 *)

    zeta0 <- Array16.init (fun i => zetasp.[136 + 196*j + i]);
    zeta1 <- Array16.init (fun i => zetasp.[168 + 196*j + i]);
    zeta2 <- Array16.init (fun i => zetasp.[152 + 196*j + i]);
    zeta3 <- Array16.init (fun i => zetasp.[184 + 196*j + i]);

    (r0, r4, r2, r6, r1, r5, r3, r7) <@ 
          __butterfly64x(r0, r4, r2, r6, r1, r5, r3, r7, zeta0, zeta1, zeta2, zeta3);

    rp <- Array256.fill (fun i => r0.[i %% 16]) ( 64 + 128*j) 16 rp;
    rp <- Array256.fill (fun i => r1.[i %% 16]) ( 80 + 128*j) 16 rp;
    rp <- Array256.fill (fun i => r2.[i %% 16]) ( 96 + 128*j) 16 rp;
    rp <- Array256.fill (fun i => r3.[i %% 16]) (112 + 128*j) 16 rp;
    rp <- Array256.fill (fun i => r4.[i %% 16]) (192 + 128*j) 16 rp;
    rp <- Array256.fill (fun i => r5.[i %% 16]) (208 + 128*j) 16 rp;
    rp <- Array256.fill (fun i => r6.[i %% 16]) (224 + 128*j) 16 rp;
    rp <- Array256.fill (fun i => r7.[i %% 16]) (240 + 128*j) 16 rp;

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

    // r0, r4, r1, r5, r2, r6, r3, r7 = __nttpack128(r0, r4, r1, r5, r2, r6, r3, r7);

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
    return rp;
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



hoare ntt_spec_avx_h _r :
    NTT_AVX.ntt :
      arg = (_r, zetas_unpack NTT_Fq.zetas) ==>
      ntt_pack res = ntt _r.
admitted.
