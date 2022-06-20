require import AllCore List IntDiv Ring StdOrder BitEncoding Array16 Array128  Array256 Array400.
require import Fq NTT_Fq NTTAlgebra.
import Kyber.
import NTT_Properties.

import Zq IntOrder BitReverse.

theory NTT_AVX_Fq.

(* These are imperative specifications of the NTT algorithms whose control
   structure matches what is implemented.  *)

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
      __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta0, zeta1);

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
      __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta0, zeta1);

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
        __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta0, zeta1);

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
        __butterfly64x(r0, r4, r1, r5, r2, r6, r3, r7, zeta0, zeta1);

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
         __butterfly64x(r0, r2, r4, r6, r1, r3, r5, r7, zeta0, zeta1);

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
           __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta0, zeta1);

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
         __butterfly64x(r0, r4, r1, r5, r2, r6, r3, r7, zeta0, zeta1);

    (* level 6 *)

    zeta0 <- Array16.init (fun i => zetasp.[136 + 196*j + i]);
    zeta1 <- Array16.init (fun i => zetasp.[168 + 196*j + i]);
(*
    zeta2 <- Array16.init (fun i => zetasp.[152 + 196*j + i]); (* I am betting these are used to prepare the reduction step *)
    zeta3 <- Array16.init (fun i => zetasp.[184 + 196*j + i]); (* I am betting these are used to prepare the reduction step *)
*)
    (r0, r4, r2, r6, r1, r5, r3, r7) <@ 
          __butterfly64x(r0, r4, r2, r6, r1, r5, r3, r7, zeta0, zeta1);

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

pred zetas_level0 = forall (refz : Fq Array128.t),
                           (zetas_unpack refz).[0] = refz.[1] /\
                           (zetas_unpack refz).[1] = refz.[1] /\
                           (zetas_unpack refz).[2] = refz.[1] /\
                           (zetas_unpack refz).[3] = refz.[1].

import NTTequiv.

require import Array256_extra.

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
  auto => />.
  move => &2; split; 1 : by smt().
  move => j2 r2;split; 1: by smt().
  move => Hexit Hl Hh Hold Hrecent; do split.
  + apply Array256.tP. move => i ib /=.
    rewrite filliE 1:ib /=. 
    case (240 <= i && i < 256).
    + move => ibb; do 2!(rewrite initiE 1:/# /=); 
                   do 8!(rewrite filliE 1:/# /= ifF 1: /#);
                   rewrite initiE 1:/# initiE 1:/# /= filliE 1:/# /=. 
      rewrite (ifF (176 <= i %% 16 + 240 && i %% 16 + 240 < 192)) 1: /#.
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[2] 
                  else (zetas_unpack NTT_vars.zetas{2}).[3]). 
      do 7!(rewrite filliE 1:/# /= ifF 1: /#).
      move : (Hrecent (i - 128) _) => /=;1: smt().
      move => [_ ->].
      rewrite /pp.
      have -> : i %% 16 + 112 = i - 128 by smt(). 
      have -> : i %% 16 + 240 = i by smt(). 
     do 3!congr; smt().
    move => ibb.     
    rewrite filliE 1:/# /=. 
    case (224 <= i && i < 240).
    + move => ibbb; do 2!(rewrite initiE 1:/# /=); 
                    do 8!(rewrite filliE 1:/# /= ifF 1: /#);
                    rewrite initiE 1:/# initiE 1:/# /= filliE 1:/# /=. 
      rewrite (ifF (176 <= i %% 16 + 224 && i %% 16 + 224 < 192)) 1: /#.
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[2] 
                  else (zetas_unpack NTT_vars.zetas{2}).[3]). 
      do 7!(rewrite filliE 1:/# /= ifF 1: /#).
      move : (Hrecent (i - 128) _) => /=;1: smt().
      move => [_ ->].
      rewrite /pp.
      have -> : i %% 16 + 96 = i - 128 by smt(). 
      have -> : i %% 16 + 224 = i by smt(). 
     do 3!congr; smt().
    move => ibbb.     
    rewrite filliE 1:/# /=. 
    case (208 <= i && i < 224).
    + move => ibbbb; do 2!(rewrite initiE 1:/# /=); 
                     do 8!(rewrite filliE 1:/# /= ifF 1: /#);
                     rewrite initiE 1:/# initiE 1:/# /= filliE 1:/# /=. 
      rewrite (ifF (176 <= i %% 16 + 208 && i %% 16 + 208 < 192)) 1: /#.
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[0] 
                  else (zetas_unpack NTT_vars.zetas{2}).[1]). 
      do 7!(rewrite filliE 1:/# /= ifF 1: /#).
      move : (Hrecent (i - 128) _) => /=;1: smt().
      move => [_ ->].
      rewrite /pp.
      have -> : i %% 16 + 80 = i - 128 by smt(). 
      have -> : i %% 16 + 208 = i by smt(). 
     do 3!congr; smt().
    move => ibbbb.     
    rewrite filliE 1:/# /=. 
    case (192 <= i && i < 208).
    + move => ibb1; do 2!(rewrite initiE 1:/# /=); 
                   do 8!(rewrite filliE 1:/# /= ifF 1: /#);
                   rewrite initiE 1:/# initiE 1:/# /= filliE 1:/# /=. 
      rewrite (ifF (176 <= i %% 16 + 192 && i %% 16 + 192 < 192)) 1: /#.
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[0] 
                  else (zetas_unpack NTT_vars.zetas{2}).[1]). 
      do 7!(rewrite filliE 1:/# /= ifF 1: /#).
      move : (Hrecent (i - 128) _) => /=;1: smt().
      move => [_ ->].
      rewrite /pp.
      have -> : i %% 16 + 64 = i - 128 by smt(). 
      have -> : i %% 16 + 192 = i by smt(). 
     do 3!congr; smt().
    move => ibbbbb.     
    rewrite filliE 1:/# /=. 
    case (112 <= i && i < 128).
    + move => ibb1; do 2!(rewrite initiE 1:/# /=); 
                   do 8!(rewrite filliE 1:/# /= ifF 1: /#);
                   rewrite initiE 1:/# initiE 1:/# /= filliE 1:/# /=. 
      rewrite (ifF (176 <= i %% 16 + 240 && i %% 16 + 240 < 192)) 1: /#.
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[2] 
                  else (zetas_unpack NTT_vars.zetas{2}).[3]). 
      do 7!(rewrite filliE 1:/# /= ifF 1: /#).
      move : (Hrecent (i) _) => /=;1: smt().
      move => [-> _].
      rewrite /pp.
      have -> : i %% 16 + 112 = i by smt(). 
      have -> : i %% 16 + 240 = i + 128 by smt(). 
     do 2!congr; smt().
    move => ibbbbbb.     
    rewrite filliE 1:/# /=. 
    case (96 <= i && i < 112).
    + move => ibb1; do 2!(rewrite initiE 1:/# /=); 
                   do 8!(rewrite filliE 1:/# /= ifF 1: /#);
                   rewrite initiE 1:/# initiE 1:/# /= filliE 1:/# /=. 
      rewrite (ifF (176 <= i %% 16 + 224 && i %% 16 + 224 < 192)) 1: /#.
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[2] 
                  else (zetas_unpack NTT_vars.zetas{2}).[3]). 
      do 7!(rewrite filliE 1:/# /= ifF 1: /#).
      move : (Hrecent (i) _) => /=;1: smt().
      move => [-> _].
      rewrite /pp.
      have -> : i %% 16 + 96 = i by smt(). 
      have -> : i %% 16 + 224 = i + 128 by smt(). 
     do 2!congr; smt().
    move => ibbbbbbb.     
    rewrite filliE 1:/# /=. 
    do 2!(rewrite initiE 1:/# /=).
    case (80 <= i && i < 96).
    + move => ibb1; do 2!(rewrite initiE 1:/# /=); 
                   do 8!(rewrite filliE 1:/# /= ifF 1: /#).
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[0] 
                  else (zetas_unpack NTT_vars.zetas{2}).[1]). 
      do 8!(rewrite filliE 1:/# /= ifF 1: /#).
      move : (Hrecent (i) _) => /=;1: smt().
      move => [-> _].
      rewrite /pp.
      have -> : i %% 16 + 80 = i by smt(). 
      have -> : i %% 16 + 208 = i + 128 by smt(). 
     do 2!congr; smt().
    move => ibbbbbbbb.     
    rewrite filliE 1:/# /=. 
    case (64 <= i && i < 80).
    + move => ibb1; do 2!(rewrite initiE 1:/# /=); 
                   do 8!(rewrite filliE 1:/# /= ifF 1: /#);
                    do 2!(rewrite initiE 1:/# /=).
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[0] 
                  else (zetas_unpack NTT_vars.zetas{2}).[1]). 
      do 8!(rewrite filliE 1:/# /= ifF 1: /#).
      move : (Hrecent (i) _) => /=;1: smt().
      move => [-> _].
      rewrite /pp.
      have -> : i %% 16 + 64 = i by smt(). 
      have -> : i %% 16 + 192 = i + 128 by smt(). 
     do 2!congr; smt().
    move => ibbbbbbbbb.     
    rewrite filliE 1:/# /=. 
    case (176 <= i && i < 192).
    + move => ibb1; do 4!(rewrite initiE 1:/# /=). 
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[2] 
                  else (zetas_unpack NTT_vars.zetas{2}).[3]). 
      move : (Hrecent (i - 128) _) => /=;1: smt().
      move => [_ ->].
      rewrite /pp.
      have -> : i %% 16 + 48 = i - 128 by smt(). 
      have -> : i %% 16 + 176 = i by smt(). 
     do 2!congr; smt().
    move => ibbbbbbbbbb.     
    rewrite filliE 1:/# /=. 
    case (160 <= i && i < 176).
    + move => ibb1; do 4!(rewrite initiE 1:/# /=). 
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[2] 
                  else (zetas_unpack NTT_vars.zetas{2}).[3]). 
      move : (Hrecent (i - 128) _) => /=;1: smt().
      move => [_ ->].
      rewrite /pp.
      have -> : i %% 16 + 32 = i - 128 by smt(). 
      have -> : i %% 16 + 160 = i by smt(). 
     do 2!congr; smt().
    move => ibbbbbbbbbbb.     
    rewrite filliE 1:/# /=. 
    case (144 <= i && i < 160).
    + move => ibb1; do 4!(rewrite initiE 1:/# /=). 
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[0] 
                  else (zetas_unpack NTT_vars.zetas{2}).[1]). 
      move : (Hrecent (i - 128) _) => /=;1: smt().
      move => [_ ->].
      rewrite /pp.
      have -> : i %% 16 + 16 = i - 128 by smt(). 
      have -> : i %% 16 + 144 = i by smt(). 
     do 2!congr; smt().
    move => ibbbbbbbbbbbb.     
    rewrite filliE 1:/# /=. 
    case (128 <= i && i < 144).
    + move => ibb1; do 4!(rewrite initiE 1:/# /=). 
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[0] 
                  else (zetas_unpack NTT_vars.zetas{2}).[1]). 
      move : (Hrecent (i - 128) _) => /=;1: smt().
      move => [_ ->].
      rewrite /pp.
      have -> : i %% 16 = i - 128 by smt(). 
     do 2!congr; smt().
    move => ibbbbbbbbbbbbb.     
    rewrite filliE 1:/# /=. 
    case (48 <= i && i < 64).
    + move => ibb1; do 4!(rewrite initiE 1:/# /=). 
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[2] 
                  else (zetas_unpack NTT_vars.zetas{2}).[3]). 
      move : (Hrecent (i) _) => /=;1: smt().
      move => [-> _].
      rewrite /pp.
      have -> : i %% 16 + 48 = i by smt(). 
      have -> : i %% 16 + 176 = i + 128 by smt(). 
     do 2!congr; smt().
    move => ibbbbbbbbbbbbbb.     
    rewrite filliE 1:/# /=. 
    case (32 <= i && i < 48).
    + move => ibb1; do 4!(rewrite initiE 1:/# /=). 
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[2] 
                  else (zetas_unpack NTT_vars.zetas{2}).[3]). 
      move : (Hrecent (i) _) => /=;1: smt().
      move => [-> _].
      rewrite /pp.
      have -> : i %% 16 + 32 = i by smt(). 
      have -> : i %% 16 + 160 = i + 128 by smt(). 
     do 2!congr; smt().
    move => ibbbbbbbbbbbbbbb.     
    rewrite filliE 1:/# /=. 
    case (16 <= i && i < 32).
    + move => ibb1; do 4!(rewrite initiE 1:/# /=). 
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[0] 
                  else (zetas_unpack NTT_vars.zetas{2}).[1]). 
      move : (Hrecent (i) _) => /=;1: smt().
      move => [-> _].
      rewrite /pp.
      have -> : i %% 16 + 16 = i by smt(). 
      have -> : i %% 16 + 144 = i + 128 by smt(). 
     do 2!congr; smt().
    move => ibbbbbbbbbbbbbbbb.     
    rewrite filliE 1:/# /=. 
    case (0 <= i && i < 16).
    + move => ibb1; do 4!(rewrite initiE 1:/# /=). 
      pose pp := (if i %% 16 %% 2 = 0 
                  then (zetas_unpack NTT_vars.zetas{2}).[0] 
                  else (zetas_unpack NTT_vars.zetas{2}).[1]). 
      move : (Hrecent (i) _) => /=;1: smt().
      move => [-> _].
      rewrite /pp.
      have -> : i %% 16 = i by smt(). 
     do 2!congr; smt().
     smt().
   smt().

admit.

qed.  

hoare ntt_spec_avx_h _r :
    NTT_AVX.ntt :
      arg = (_r, zetas_unpack NTT_Fq.zetas) ==>
      ntt_pack res = ntt _r.
admitted.
