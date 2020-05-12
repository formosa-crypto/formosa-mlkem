require import List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.

require import Array4 Array5 Array24 Array25 Array32 Array33 Array34 Array64
               Array128 Array168 Array256 Array768.
require import WArray20 WArray32 WArray33 WArray34 WArray40 WArray64
               WArray128 WArray168 WArray192 WArray200 WArray256 WArray512
               WArray1536.

require import Indcpa.

print M.
(* WE DEFINE ALTERNATIVE VERSIONS OF THE EXTRACTED CODE TO
   MODULARIZE RANDOMNESS SAMPLINGS *)

op scoins : W8.t Array32.t distr.

module Mderand = {
  include M [-indcpa_keypair_jazz, indcpa_enc_jazz, indcpa_dec_jazz, poly_compress, poly_decompress, polyvec_compress, polyvec_decompress]

 proc poly_compress_round(a : W16.t Array256.t) : W16.t Array256.t = {
    var aux : int;
    var i : int;
    var t : W16.t;
    var d0 : W32.t;
    var d1 : W32.t;
    var r : W16.t Array256.t;
    
    a <@ M.poly_csubq(a);

    r <- witness;
    i <- 0;
    while (i < 128){
      t <- a.[2 * i];
      d0 <- zeroextu32 t;
      d0 <- d0 `<<` (of_int 4)%W8;
      d0 <- d0 + (of_int 1665)%W32;
      d0 <- d0 * (of_int 80635)%W32;
      d0 <- d0 `>>` (of_int 28)%W8;
      d0 <- d0 `&` (of_int 15)%W32;
      t <- a.[2 * i + 1];
      d1 <- zeroextu32 t;
      d1 <- d1 `<<` (of_int 4)%W8;
      d1 <- d1 + (of_int 1665)%W32;
      d1 <- d1 * (of_int 80635)%W32;
      d1 <- d1 `>>` (of_int 28)%W8;
      d1 <- d1 `&` (of_int 15)%W32;
      r.[2*i] <- truncateu16 d0;
      r.[2*i+1]<- truncateu16 d1;
      i <- i + 1;
    }
    
    return r;
  }
  
 proc poly_compress_store(rp : W64.t, r : W16.t Array256.t) : unit = {
    var aux : int;
    var i : int;
    var d0 : W16.t;
    var d1 : W16.t;
    i <- 0;
    while (i < 128){
      d0 <- r.[2*i];
      d1 <- r.[2*i+1];
      d1 <- d1 `<<` (of_int 4)%W8;
      d0 <- d0 `|` d1;
      Glob.mem <- storeW8 Glob.mem (to_uint (rp + (of_int i)%W64)) (truncateu8 d0);
      i <- i + 1;
    }
    
    return tt;
  }
  
  proc poly_decompress_load(ap : W64.t) : W16.t Array256.t = {
    var aux : int;
    var rp : W16.t Array256.t;
    var i : int;
    var t : W8.t;
    var d0 : W16.t;
    var d1 : W16.t;
    
    rp <- witness;
    i <- 0;
    while (i < 128){
      t <- loadW8 Glob.mem (to_uint (ap + (of_int i)%W64));
      d0 <- zeroextu16 t;
      d1 <- zeroextu16 t;
      d0 <- d0 `&` (of_int 15)%W16;
      d1 <- d1 `>>` (of_int 4)%W8;
      rp.[2 * i] <- d0;
      rp.[2 * i + 1] <- d1;
      i <- i + 1;
    }
    
    return rp;
  }

  proc poly_decompress_restore(r : W16.t Array256.t) : W16.t Array256.t = {
    var aux : int;
    var rp : W16.t Array256.t;
    var i : int;
    var d0 : W16.t;
    var d1 : W16.t;
    
    rp <- witness;
    i <- 0;
    while (i < 128){
      d0 <- r.[2*i];
      d1 <- r.[2*i+1];
      d0 <- d0 * (of_int 3329)%W16;
      d1 <- d1 * (of_int 3329)%W16;
      d0 <- d0 + (of_int 8)%W16;
      d1 <- d1 + (of_int 8)%W16;
      d0 <- d0 `>>` (of_int 4)%W8;
      d1 <- d1 `>>` (of_int 4)%W8;
      rp.[2 * i] <- d0;
      rp.[2 * i + 1] <- d1;
      i <- i + 1;
    }
    
    return rp;
  }



 proc polyvec_compress_round( a : W16.t Array768.t) : W16.t Array768.t = {
    var i : W64.t;
    var aa : W16.t Array768.t;
    var r : W16.t Array768.t;
    var k : int;
    var t : W64.t Array4.t;
    
    t <- witness;
    r <- witness;
    i <- W64.zero;
    aa <@ M.polyvec_csubq(a);
    while (i \ult (of_int 768)%W64){
      k <- 0;
      while (k < 4){
        t.[k] <- zeroextu64 aa.[to_uint i];
        i <- i + W64.one;
        t.[k] <- t.[k] `<<` (of_int 10)%W8;
        t.[k] <- t.[k] + (of_int 1665)%W64;
        t.[k] <- t.[k] * (of_int 1290167)%W64;
        t.[k] <- t.[k] `>>` (of_int 32)%W8;
        t.[k] <- t.[k] `&` (of_int 1023)%W64;
        k <- k + 1;
      }
      r.[to_uint i-4] <- truncateu16 t.[k-4];
      r.[to_uint i-3] <- truncateu16 t.[k-3];
      r.[to_uint i-2] <- truncateu16 t.[k-2];
      r.[to_uint i-1] <- truncateu16 t.[k-1];
    }
    
    return r;
  }

 proc polyvec_compress_store(rp : W64.t, r : W16.t Array768.t) : unit = {
    var aux : int;
    var i : W64.t;
    var j : W64.t;
    var k : int;
    var t : W16.t Array4.t;
    var c : W16.t;
    var b : W16.t;
    
    t <- witness;
    i <- W64.zero;
    j <- W64.zero;
    while (i \ult (of_int 768)%W64){
      k <- 0;
      while (k < 4){
        t.[k] <- r.[to_uint i];
        i <- i + W64.one;
        k <- k + 1;
      }
      c <- t.[0];
      c <- c `&` (of_int 255)%W16;
      Glob.mem <- storeW8 Glob.mem (to_uint (rp + j)) (truncateu8 c);
      j <- j + W64.one;
      b <- t.[0];
      b <- b `>>` (of_int 8)%W8;
      c <- t.[1];
      c <- c `<<` (of_int 2)%W8;
      c <- c `|` b;
      Glob.mem <- storeW8 Glob.mem (to_uint (rp + j)) (truncateu8 c);
      j <- j + W64.one;
      b <- t.[1];
      b <- b `>>` (of_int 6)%W8;
      c <- t.[2];
      c <- c `<<` (of_int 4)%W8;
      c <- c `|` b;
      Glob.mem <- storeW8 Glob.mem (to_uint (rp + j)) (truncateu8 c);
      j <- j + W64.one;
      b <- t.[2];
      b <- b `>>` (of_int 4)%W8;
      c <- t.[3];
      c <- c `<<` (of_int 6)%W8;
      c <- c `|` b;
      Glob.mem <- storeW8 Glob.mem (to_uint (rp + j)) (truncateu8 c);
      j <- j + W64.one;
      t.[3] <- t.[3] `>>` (of_int 2)%W8;
      Glob.mem <- storeW8 Glob.mem (to_uint (rp + j)) (truncateu8 t.[3]);
      j <- j + W64.one;
    }
    
    return tt;
  }
  
  proc polyvec_decompress_load(ap : W64.t) : W32.t Array768.t = {
    var aux : int;
    var r : W32.t Array768.t;
    var i : W64.t;
    var j : W64.t;
    var k : int;
    var t : W32.t Array5.t;
    var d : W32.t;
    
    r <- witness;
    t <- witness;
    i <- W64.zero;
    j <- W64.zero;
    while (i \ult (of_int 768)%W64){
      k <- 0;
      while (k < 5){
        t.[k] <- zeroextu32 (loadW8 Glob.mem (to_uint (ap + j)));
        j <- j + W64.one;
        k <- k + 1;
      }
      d <- t.[1];
      t.[1] <- t.[1] `>>` (of_int 2)%W8;
      d <- d `&` (of_int 3)%W32;
      d <- d `<<` (of_int 8)%W8;
      t.[0] <- t.[0] `|` d;
      d <- t.[2];
      t.[2] <- t.[2] `>>` (of_int 4)%W8;
      d <- d `&` (of_int 15)%W32;
      d <- d `<<` (of_int 6)%W8;
      t.[1] <- t.[1] `|` d;
      d <- t.[3];
      t.[3] <- t.[3] `>>` (of_int 6)%W8;
      d <- d `&` (of_int 63)%W32;
      d <- d `<<` (of_int 4)%W8;
      t.[2] <- t.[2] `|` d;
      d <- t.[4];
      d <- d `<<` (of_int 2)%W8;
      t.[3] <- t.[3] `|` d;
      k <- 0;
      while (k < 4){
        r.[to_uint i] <-  t.[k];
        i <- i + W64.one;
        k <- k + 1;
      }
    }
    
    return r;
  }

  proc polyvec_decompress_restore(rp : W32.t Array768.t) : W16.t Array768.t = {
    var aux : int;
    var r : W16.t Array768.t;
    var i : W64.t;
    var j : W64.t;
    var k : int;
    var t : W32.t Array5.t;
    var d : W32.t;
    
    r <- witness;
    t <- witness;
    i <- W64.zero;
    j <- W64.zero;
    while (i \ult (of_int 768)%W64){
      k <- 0;
      while (k < 5){
        t.[k] <- rp.[to_uint i];
        j <- j + W64.one;
        k <- k + 1;
      }
      k <- 0;
      while (k < 4){
        t.[k] <- t.[k] * (of_int 3329)%W32;
        t.[k] <- t.[k] + (of_int 512)%W32;
        t.[k] <- t.[k] `>>` (of_int 10)%W8;
        r.[to_uint i] <- truncateu16 t.[k];
        i <- i + W64.one;
        k <- k + 1;
      }
    }
    
    return r;
  }

  proc indcpa_keypair_expandseed(randomnessp:W64.t) : 
    W8.t Array32.t *  W16.t Array768.t * W16.t Array768.t = {
    var i:W64.t;
    var c:W8.t;
    var inbuf:W8.t Array32.t;
    var buf:W8.t Array64.t;
    var j:W64.t;
    var publicseed:W8.t Array32.t;
    var noiseseed:W8.t Array32.t;
    var nonce:W8.t;
    var poly0:W16.t Array256.t;
    var poly1:W16.t Array256.t;
    var poly2:W16.t Array256.t;
    var skpv:W16.t Array768.t;
    var e:W16.t Array768.t;

    inbuf <- witness;
    noiseseed <- witness;
    publicseed <- witness;

    i <- (W64.of_int 0);
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (randomnessp + i)));
      inbuf.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
    }
    buf <@ sha3512_32 (inbuf);
    i <- (W64.of_int 0);
    j <- (W64.of_int 32);
    
    while ((i \ult (W64.of_int 32))) {
      c <- buf.[(W64.to_uint i)];
      publicseed.[(W64.to_uint i)] <- c;
      c <- buf.[(W64.to_uint j)];
      noiseseed.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
      j <- (j + (W64.of_int 1));
    }
    nonce <- (W8.of_int 0);
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly2 <@ poly_getnoise (noiseseed, nonce);
    skpv <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (nonce + (W8.of_int 1));
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly2 <@ poly_getnoise (noiseseed, nonce);
    e <@ polyvec_frompolys (poly0, poly1, poly2);
    return (publicseed,e,skpv);
  }

  proc indcpa_keypair_compute(publicseed : W8.t Array32.t, e skpv : W16.t Array768.t) : 
      W16.t Array768.t *  W16.t Array768.t = {
    var poly0:W16.t Array256.t;
    var poly1:W16.t Array256.t;
    var poly2:W16.t Array256.t;
    var pkpv:W16.t Array768.t;
    var zero:W64.t;
    var a0:W16.t Array768.t;
    var a1:W16.t Array768.t;
    var a2:W16.t Array768.t;

    zero <- (W64.of_int 0);
    (a0, a1, a2) <@ gen_matrix (publicseed, zero);
    skpv <@ polyvec_ntt (skpv);
    e <@ polyvec_ntt (e);
    poly0 <@ polyvec_pointwise_acc (a0, skpv);
    poly0 <@ poly_frommont (poly0);
    poly1 <@ polyvec_pointwise_acc (a1, skpv);
    poly1 <@ poly_frommont (poly1);
    poly2 <@ polyvec_pointwise_acc (a2, skpv);
    poly2 <@ poly_frommont (poly2);
    pkpv <@ polyvec_frompolys (poly0, poly1, poly2);
    pkpv <@ polyvec_add (pkpv, e);
    pkpv <@ polyvec_reduce (pkpv);
    return (skpv, pkpv);

  }

  proc indcpa_keypair_jazz (pkp:W64.t, skp:W64.t, randomnessp:W64.t) : unit = {
    var i:W64.t;
    var c:W8.t;
    var publicseed:W8.t Array32.t;
    var a0:W16.t Array768.t;
    var a1:W16.t Array768.t;
    var a2:W16.t Array768.t;
    var e:W16.t Array768.t;
    var skpv:W16.t Array768.t;
    var pkpv:W16.t Array768.t;

    (publicseed, e, skpv) <@ indcpa_keypair_expandseed(randomnessp);
    (skpv, pkpv) <@ indcpa_keypair_compute(publicseed, e, skpv);

    polyvec_tobytes (skp, skpv);
    polyvec_tobytes (pkp, pkpv);

    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (3 * 384)));
    
    while ((i \ult (W64.of_int 32))) {
      c <- publicseed.[(W64.to_uint i)];
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))) c;
      pkp <- (pkp + (W64.of_int 1));
      i <- (i + (W64.of_int 1));
    }
    return ();
  }

  proc kg(pkp:W64.t, skp:W64.t, randomnessp:W64.t) : unit = {
    var coins, i;
    coins <$ scoins;
    i <- 0;  
    while (i < 32) {
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (randomnessp + (W64.of_int i))) coins.[i];
      i <- i + 1;
    }
    indcpa_keypair_jazz(pkp, skp, randomnessp);
  }
  
  proc indcpa_enc_expand_seed(coinsp:W64.t) :
    W16.t Array768.t * W16.t Array768.t * W16.t Array256.t  = {
    var i:W64.t;
    var c:W8.t;
    var noiseseed:W8.t Array32.t;
    var poly0:W16.t Array256.t;
    var poly1:W16.t Array256.t;
    var poly2:W16.t Array256.t;
    var sp_0:W16.t Array768.t;
    var ep:W16.t Array768.t;
    var epp:W16.t Array256.t;
    var nonce:W8.t;

    noiseseed <- witness;

    i <- (W64.of_int 0);

    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (coinsp + i)));
      noiseseed.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
    }
    nonce <- (W8.of_int 0);
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 1);
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 2);
    poly2 <@ poly_getnoise (noiseseed, nonce);
    sp_0 <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (W8.of_int 3);
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 4);
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 5);
    poly2 <@ poly_getnoise (noiseseed, nonce);
    ep <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (W8.of_int 6);
    epp <@ poly_getnoise (noiseseed, nonce);
    return (sp_0,ep,epp);
  }

  proc indcpa_enc_compute(msgp:W64.t,publicseed:W8.t Array32.t, pkpv:W16.t Array768.t, sp_0 ep:W16.t Array768.t, epp:W16.t Array256.t) : W16.t Array768.t * W16.t Array256.t = {
    var k:W16.t Array256.t;
    var one:W64.t;
    var at0:W16.t Array768.t;
    var at1:W16.t Array768.t;
    var at2:W16.t Array768.t;
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;
    var poly0:W16.t Array256.t;
    var poly1:W16.t Array256.t;
    var poly2:W16.t Array256.t;
    var r1:W16.t Array768.t;
    var r2:W16.t Array256.t;

    
    k <@ poly_frommsg (msgp);
    one <- (W64.of_int 1);
    (at0, at1, at2) <@ gen_matrix (publicseed, one);
    sp_0 <@ polyvec_ntt (sp_0);
    poly0 <@ polyvec_pointwise_acc (at0, sp_0);
    poly1 <@ polyvec_pointwise_acc (at1, sp_0);
    poly2 <@ polyvec_pointwise_acc (at2, sp_0);
    bp <@ polyvec_frompolys (poly0, poly1, poly2);
    v <@ polyvec_pointwise_acc (pkpv, sp_0);
    bp <@ polyvec_invntt (bp);
    v <@ poly_invntt (v);
    bp <@ polyvec_add (bp, ep);
    v <@ poly_add (v, epp);
    v <@ poly_add (v, k);
    bp <@ polyvec_reduce (bp);
    v <@ poly_reduce (v);
    r1 <@polyvec_compress_round (bp);
    r2 <@ poly_compress_round (v);
    return (r1,r2);
  }

  proc indcpa_enc_jazz (ctp:W64.t, msgp:W64.t, pkp:W64.t, coinsp:W64.t) : unit = {
    
    var i:W64.t;
    var c:W8.t;
    var publicseed:W8.t Array32.t;
    var sp_0:W16.t Array768.t;
    var ep:W16.t Array768.t;
    var epp:W16.t Array256.t;
    var pkpv:W16.t Array768.t;
    var r1:W16.t Array768.t;
    var r2:W16.t Array256.t;

    publicseed <- witness;
    pkpv <@ polyvec_frombytes (pkp);
    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (3 * 384)));
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))));
      publicseed.[(W64.to_uint i)] <- c;
      pkp <- (pkp + (W64.of_int 1));
      i <- (i + (W64.of_int 1));
    }
    (sp_0,ep,epp) <@ indcpa_enc_expand_seed(coinsp);
    (r1,r2) <@ indcpa_enc_compute(msgp,publicseed,pkpv,sp_0,ep,epp);
    polyvec_compress_store(ctp,r1);
    ctp <- (ctp + (W64.of_int (3 * 320)));
    poly_compress_store(ctp,r2);
    return ();
  }
  
  proc enc(ctp:W64.t, msgp:W64.t, pkp:W64.t, coinsp:W64.t) : unit = {
    var coins, i;
    coins <$ scoins;
    i <- 0;  
    while (i < 32) {
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (coinsp + (W64.of_int i))) coins.[i];
      i <- i + 1;
    }
    indcpa_enc_jazz(ctp, msgp, pkp, coinsp);
  }

  proc indcpa_dec_compute(msgp:W64.t, r1 : W32.t Array768.t, r2 : W16.t Array256.t,skpv:W16.t Array768.t) : unit = {
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;
    var mp:W16.t Array256.t;

    bp <@ polyvec_decompress_restore (r1);
    v <@ poly_decompress_restore (r2);
    bp <@ polyvec_ntt (bp);
    mp <@ polyvec_pointwise_acc (skpv, bp);
    mp <@ poly_invntt (mp);
    mp <@ poly_sub (v, mp);
    mp <@ poly_reduce (mp);
    poly_tomsg (msgp, mp);
    return ();
  }

  proc indcpa_dec_jazz (msgp:W64.t, ctp:W64.t, skp:W64.t) : unit = {
    
    var skpv:W16.t Array768.t;
    var r1 : W32.t Array768.t;
    var r2 : W16.t Array256.t;

    skpv <@ polyvec_frombytes (skp);
    r1 <@ polyvec_decompress_load(ctp);
    ctp <- (ctp + (W64.of_int (3 * 320)));
    r2 <@ poly_decompress_load(ctp);

    indcpa_dec_compute(msgp,r1,r2,skpv);
    return ();
  }

}.

equiv keypair_same :  M.indcpa_keypair_jazz ~ Mderand.indcpa_keypair_jazz :
  ={arg,Glob.mem} ==> ={res,Glob.mem}.
proc.
inline Mderand.indcpa_keypair_expandseed Mderand.indcpa_keypair_compute. 
by swap {1} [20..21] 14; sim.
qed.

equiv enc_same : M.indcpa_enc_jazz ~ Mderand.indcpa_enc_jazz :
  ={arg,Glob.mem} ==> ={res,Glob.mem}.
proc.
inline Mderand.indcpa_enc_expand_seed Mderand.indcpa_enc_compute.
swap {1} 9 -8.
swap {1} 18 -16.
swap {2} [6..9] -3.
swap {1} [22..24] 16. 
seq 53 48 : (={Glob.mem,bp,v,ctp}).
sim; auto => />; call (_: ={Glob.mem}).
by sim.
by auto => />.
inline *; auto => />.

sp. seq 1 1 : (#[1:10,11,12,14:25,26,27,29:]pre /\ ={pv} /\ r00{1} = r01{2}).
  while (#[/1:30]post /\ 0 <= to_uint i3{1} <= 256 /\
          i3{1} = i6{2} /\ forall (j : int), 0 <= j < to_uint i3{1} => r00{1}.[j] = r01{2}.[j]).
    wp; skip => /> *.
    split. split.
      + by rewrite to_uintD_small 1,2:/#.
      + by move : H2; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#.
    move => j *.
    rewrite !get_setE; first 2 by
      by move : H2; rewrite ultE of_uintK pmod_small //. 
      case (j = to_uint i6{2}) => ? //=.
        + by rewrite H1; move : H4; rewrite to_uintD_small 1,2:/#.
  skip => /> *.
    + by rewrite tP; move : H; rewrite ultE of_uintK pmod_small // /#.

seq 3 3 : (#[/1:10,11:23,24:]pre /\ ={j0} /\ W64.to_uint j0{1} = 512 /\ r10{1} = r12{2}).
  while (#[/1:29]post /\ 0 <= to_uint i3{1} <= 256 /\ to_uint j0{1} - to_uint i3{1} = 256 /\
          i3{1} = i6{2} /\ ={pv,j0} /\
          forall (j : int), 0 <= j < to_uint i3{1} => r10{1}.[j] = r12{2}.[j]).
    wp; skip => /> *.
    split. split.
      + by rewrite to_uintD_small 1,2:/#.
      + by move : H3; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#.
    split.
      + by rewrite !to_uintD_small 1,2:/# to_uint1; smt().
    move => j *.
    rewrite !get_setE; first 2 by
      by move : H3; rewrite ultE of_uintK pmod_small //. 
      case (j = to_uint i6{2}) => ? //=.
        + by rewrite H2; move : H5; rewrite to_uintD_small 1,2:/#.
  wp; skip => /> *; split.
    + have ?: to_uint i6_R = 256 by move : H; rewrite ultE of_uintK pmod_small // /#.
    + by smt().
  (*split.
    + by move : H1; rewrite ultE of_uintK pmod_small // /#.*)
    + by rewrite tP; move : H0; rewrite ultE of_uintK pmod_small // /#.

seq 3 3 : (#[/1:10,11:22,23:29,31]pre /\ r20{1} = r22{2}).
  while (#[/1:28]post /\ 0 <= to_uint i3{1} <= 256 /\ to_uint j0{1} - to_uint i3{1} = 512 /\
          i3{1} = i6{2} /\ ={j0} /\
          forall (j : int), 0 <= j < to_uint i3{1} => r20{1}.[j] = r22{2}.[j]).
    wp; skip => /> *.
    split. split.
      + by rewrite to_uintD_small 1,2:/#.
      + by move : H3; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#.
    split.
      + by rewrite !to_uintD_small 1,2:/# to_uint1; smt().
    move => j *.
    rewrite !get_setE; first 2 by
      by move : H3; rewrite ultE of_uintK pmod_small //. 
      case (j = to_uint i6{2}) => ? //=.
        + by rewrite H2; move : H5; rewrite to_uintD_small 1,2:/#.
  wp; skip => /> *. 
    + by rewrite tP; move : H1; rewrite ultE of_uintK pmod_small // /#.

seq 4 4 : (#[/1:5,9:17,20:]pre /\ r0{1} = r00{2} /\ r1{1} = r11{2} /\ r2{1} = r21{2} /\ 
           ={rp2} /\ r0{1} = r00{1} /\ r1{1} = r10{1} /\ r2{1} = r20{1} /\
            r00{2} = r01{2} /\ r11{2} = r12{2} /\ r21{2} = r22{2}).
  while (#post /\ i4{1} = i7{2} /\ 0 <= i4{1} <= 256).
    by wp; skip => /> * /#.
  by wp; skip => /> * /#.

seq 4 4 : (#[/1:26,27,28,30:]pre /\ r0{1} = rp2{1} /\ r00{2} = rp2{2} /\ ={rp3}).
  while (#post /\ i5{1} = i8{2} /\ 0 <= i5{1} <= 256).
    by wp; skip => /> * /#.
  by wp; skip => /> * /#.

seq 4 4 : (#[/1:26,27,29:]pre /\ r1{1} = rp3{1} /\ r11{2} = rp3{2} /\ ={rp4}).
  while (#post /\ i6{1} = i9{2} /\ 0 <= i6{1} <= 256).
    by wp; skip => /> * /#.
  by wp; skip => /> * /#.

seq 7 7 : (#[/1:26,28:]pre /\ r2{1} = rp4{1} /\ r21{2} = rp4{2} /\ ={p0,p1,p2} /\ 
            p0{1} = r0{1} /\ p0{2} = r00{2} /\ p1{1} = r1{1} /\ p1{2} = r11{2} /\ 
            p2{1} = r2{1} /\ p2{2} = r21{2} /\ 
            (forall j, 0 <= j < 256 => r3{1}.[j] = r6{2}.[j])).
  while (#[/1:43]post /\ i7{1} = i10{2} /\ 0 <= to_uint i7{1} <= 256 /\
          forall j, 0 <= j < to_uint i7{1} => r3{1}.[j] = r6{2}.[j]).
    wp; skip => /> *.
    split. split.
      + by rewrite to_uintD_small 1,2:/#.
      + by move : H2; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#.
    move => j *.
    rewrite !get_setE; first 2 by
      move : H2; rewrite ultE of_uintK pmod_small // /#.
    case (j = to_uint i10{2}) => ? //=.
        + by rewrite H1; move : H4; rewrite to_uintD_small 1,2:/#.
  wp; skip => /> *. 
    + by move : H; rewrite ultE of_uintK pmod_small // /#.

seq 3 3 : (#[/1:43]pre /\ (forall j, 0 <= j < 512 => r3{1}.[j] = r6{2}.[j])).
  while (#[/1:43]post /\ i7{1} = i10{2} /\ 0 <= to_uint i7{1} <= 256 /\ ={j1} /\
          to_uint j1{1} - to_uint i7{1} = 256 /\
          (forall j, 0 <= j < to_uint j1{1} => r3{1}.[j] = r6{2}.[j])).
    wp; skip => /> *.
    split. split.
      + by rewrite to_uintD_small 1,2:/#.
      + by move : H3; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#.
    split.
      + by rewrite !to_uintD_small 1,2:/# to_uint1; smt().
    move => j *.
      rewrite !get_setE; first 2
        by move : H3; rewrite ultE of_uintK pmod_small // /#. 
      case (j = to_uint j1{2}) => ? //=.
        + by rewrite H2; move : H5; rewrite to_uintD_small 1,2:/#.
  wp; skip => /> *. 
    + by rewrite H5; move : H0; rewrite ultE of_uintK pmod_small // /#.

seq 3 3 : (#[/1:43]pre /\ r3{1} = r6{2}).
  while (#[/1:43]post /\ i7{1} = i10{2} /\ 0 <= to_uint i7{1} <= 256 /\ ={j1} /\
          to_uint j1{1} - to_uint i7{1} = 512 /\
          (forall j, 0 <= j < to_uint j1{1} => r3{1}.[j] = r6{2}.[j])).
    wp; skip => /> *.
    split. split.
      + by rewrite to_uintD_small 1,2:/#.
      + by move : H3; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#.
    split.
      + by rewrite !to_uintD_small 1,2,3:/#.
    move => j *.
      rewrite !get_setE; first 2
        by move : H3; rewrite ultE of_uintK pmod_small // /#.
        case (j = to_uint j1{2}) => ? //=.
          + by rewrite H2; move : H5; rewrite to_uintD_small 1,2:/#.
  wp; skip => /> *.
    + by rewrite tP; move : H1; rewrite ultE of_uintK pmod_small // /#.

swap{1} [6..9]-5; swap{2} [5..8]-4.
seq 4 4 : (#pre /\ a0{1} = v{1} /\ a0{2} = v{2} /\ ={rp1}).
  while (#post /\ i2{1} = i5{2} /\ 0 <= i2{1} <= 256).
    by wp; skip => /> * /#.
  by wp; skip => /> * /#.

seq 0 3 : (#[/1,6:]pre /\ r5{2} = r6{2} /\ aa{2} = r5{2} /\
            (forall k, 0 <= k < 768 => r.[k] = truncateu16 (((((zeroextu64 aa{2}.[k] `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023)){2}).

  while{2} (#[/1:45]post /\ 0 <= to_uint i1{2} <= 768 + 3 /\ to_uint i1{2} %% 4 = 0 /\
            (forall k, 0 <= k < to_uint i1{2} => r.[k] = truncateu16 (((((zeroextu64 aa{2}.[k] `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023)){2}) (768 - to_uint i1{2}).
    move => &m z.
      unroll 2; unroll 3; unroll 4; unroll 5.
      (rcondt 2; first by wp; skip); (rcondt 10; first by wp; skip); (rcondt 18; first by wp; skip);
        (rcondt 26; first by wp; skip); (rcondf 34; first by wp; skip).
      wp; skip => /> *.
        split. split. split.
          + by rewrite to_uintD_small 1,2:/#.
          + by rewrite to_uintD_small // 1:/#; move : H3; rewrite ultE of_uintK pmod_small // /#. 
        split.
          + by rewrite !to_uintD_small 1,2:/#.
      move => k ?.
        + rewrite !to_uintD_small 1..4:/#.
        + rewrite !of_uintK !pmod_small 1..4:/# /=.
        move => *.
          + rewrite get_setE; first by move : H3; rewrite ultE of_uintK pmod_small // /#. 
          + case (k = to_uint i1{hr} + 3) => ?; first by rewrite -H6.
          + rewrite get_setE; first by move : H3; rewrite ultE of_uintK pmod_small // /#. 
          + case (k = to_uint i1{hr} + 2) => ?; first by rewrite -H7.
          + rewrite get_setE; first by move : H3; rewrite ultE of_uintK pmod_small // /#. 
          + case (k = to_uint i1{hr} + 1) => ?; first by rewrite -H8.
          + rewrite get_setE; first by move : H3; rewrite ultE of_uintK pmod_small // /#. 
          + case (k = to_uint i1{hr}) => ?; first by rewrite -H9.
          + by move : H3; rewrite ultE of_uintK pmod_small // => /#. 
        + by move : H3; rewrite ultE of_uintK pmod_small //; first by rewrite to_uintD_small /#. 
  wp; skip => />.
    move => &2; split.
      + by smt().
    move => *; split. 
      + by move => *; rewrite ultE of_uintK pmod_small // /#.
    move => *.
      + by move : H; rewrite ultE of_uintK pmod_small // /#.


admit.
qed.

equiv dec_same :  M.indcpa_dec_jazz ~ Mderand.indcpa_dec_jazz :
  ={arg,Glob.mem} ==> ={res,Glob.mem}.
proc.
inline Mderand.indcpa_dec_compute.
swap {2} 8 2.
swap {2} 1 8.
swap {2} 4 4.
seq 7 7 : (={Glob.mem,msgp,skp,bp,v}).
inline *; auto => />; admit. 
by sim.
qed.
