

require import AllCore List IntDiv CoreMap.
from Jasmin require import JModel.

require import Array4 Array5 Array24 Array25 Array32 Array33 Array34 Array64
               Array128 Array168 Array256 Array768.
require import WArray20 WArray32 WArray33 WArray34 WArray40 WArray64
               WArray128 WArray168 WArray192 WArray200 WArray256 WArray512
               WArray1536.

require import Jindcpa.

print M.
(* WE DEFINE ALTERNATIVE VERSIONS OF THE EXTRACTED CODE TO
   MODULARIZE RANDOMNESS SAMPLINGS *)

op scoins : W8.t Array32.t distr.

module Mderand = {
  include M [-indcpa_keypair_jazz, indcpa_enc_jazz, indcpa_dec_jazz, poly_compress, poly_decompress, poly_tomsg, poly_frommsg, polyvec_compress, polyvec_decompress]
 
  proc poly_tomsg_decode (a:W16.t Array256.t) : W32.t Array256.t = {
    var aux: int;
    
    var r:W8.t;
    var j:int;
    var i:int;
    var t:W16.t;
    var d:W32.t;
    var rp:W32.t Array256.t;
    
    rp <- witness;

    a <@ poly_csubq (a);
    i <- 0;
    r <- witness;
    while (i < 32) {
      r <- (W8.of_int 0);
      j <- 0;
      while (j < 8) {
        t <- a.[((8 * i) + j)];
        d <- (zeroextu32 t);
        d <- (d `<<` (W8.of_int 1));
        d <- (d + (W32.of_int 1665));
        d <- (d * (W32.of_int 80635));
        d <- (d `>>` (W8.of_int 28));
        d <- (d `&` (W32.of_int 1));
        rp.[8*i+j] <- d;
        j <- j + 1;
      }
      i <- i + 1;
    }
    return rp;
  }
  
  proc poly_tomsg_store (rp:W64.t, a: W32.t Array256.t) : unit = {
    var aux: int;
    
    var r:W8.t;
    var j:int;
    var i:int;
    var t:W16.t;
    var d:W32.t;
    
    i <- 0;
    while (i < 32) {
      r <- (W8.of_int 0);
      j <- 0;
      while (j < 8) {
        d <- a.[((8 * i) + j)];
        d <- (d `<<` (W8.of_int j));
        r <- (r `|` (truncateu8 d));
        j <- j + 1;
      }
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (rp + (W64.of_int i))) r;
      i <- i + 1;
    }
    return ();
  }

  proc poly_frommsg_load (ap:W64.t) : W16.t Array256.t = {
    var aux: int;
    
    var rp:W16.t Array256.t;
    var i:int;
    var c:W8.t;
    var t:W16.t;
    rp <- witness;
    i <- 0;
    while (i < 32) {
      c <- (loadW8 Glob.mem (W64.to_uint (ap + (W64.of_int i))));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      rp.[(8 * i)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      rp.[((8 * i) + 1)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      rp.[((8 * i) + 2)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      rp.[((8 * i) + 3)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      rp.[((8 * i) + 4)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      rp.[((8 * i) + 5)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      rp.[((8 * i) + 6)] <- t;
      c <- (c `>>` (W8.of_int 1));
      t <- (zeroextu16 c);
      t <- (t `&` (W16.of_int 1));
      rp.[((8 * i) + 7)] <- t;
      i <- i + 1;
    }
    return (rp);
  }

  proc poly_frommsg_encode (r : W16.t Array256.t ) : W16.t Array256.t = {
    var aux: int;
    
    var rp:W16.t Array256.t;
    var i:int;
    var c:W8.t;
    var t:W16.t;
    rp <- witness;
    i <- 0;
    while (i < 32) {
      t <- r.[8*i+0];
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[(8 * i)] <- t;
      t <- r.[8*i+1];
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 1)] <- t;
      t <- r.[8*i+2];
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 2)] <- t;
      t <- r.[8*i+3];
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 3)] <- t;
      t <- r.[8*i+4];
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 4)] <- t;
      t <- r.[8*i+5];
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 5)] <- t;
      t <- r.[8*i+6];
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 6)] <- t;
      t <- r.[8*i+7];
      t <- (t * (W16.of_int ((3329 + 1) %/ 2)));
      rp.[((8 * i) + 7)] <- t;
      i <- i + 1;
    }
    return (rp);
  }

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
        t.[k] <- rp.[to_uint i + k];
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
    buf <- witness;
    noiseseed <- witness;
    publicseed <- witness;
    poly0 <- witness;
    poly1 <- witness;
    poly2 <- witness;   

    i <- (W64.of_int 0);
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (randomnessp + i)));
      inbuf.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
    }
    buf <@ sha3512_32 (buf,inbuf);
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
    poly0 <@ poly_getnoise (poly0, noiseseed, nonce);
    nonce <- (W8.of_int 1);
    poly1 <@ poly_getnoise (poly1, noiseseed, nonce);
    nonce <- (W8.of_int 2);
    poly2 <@ poly_getnoise (poly2, noiseseed, nonce);
    skpv <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (W8.of_int 3);
    poly0 <@ poly_getnoise (poly0, noiseseed, nonce);
    nonce <- (W8.of_int 4);
    poly1 <@ poly_getnoise (poly1, noiseseed, nonce);
    nonce <- (W8.of_int 5);
    poly2 <@ poly_getnoise (poly2, noiseseed, nonce);
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

    a0 <- witness;
    a1 <- witness;
    a2 <- witness;



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
    pkpv <@ polyvec_add2 (pkpv, e);
    pkpv <@ polyvec_reduce (pkpv);
    return (skpv, pkpv);

  }

  proc indcpa_keypair_jazz (pkp:W64.t, skp:W64.t, randomnessp:W64.t) : unit = {
    var i:W64.t;
    var c:W8.t;
    var publicseed:W8.t Array32.t;
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
    poly0 <- witness;
    poly1 <- witness;
    poly2 <- witness;   
    epp <- witness; 
    i <- (W64.of_int 0);

    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (coinsp + i)));
      noiseseed.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
    }
    nonce <- (W8.of_int 0);
    poly0 <@ poly_getnoise (poly0,noiseseed, nonce);
    nonce <- (W8.of_int 1);
    poly1 <@ poly_getnoise (poly1,noiseseed, nonce);
    nonce <- (W8.of_int 2);
    poly2 <@ poly_getnoise (poly2,noiseseed, nonce);
    sp_0 <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (W8.of_int 3);
    poly0 <@ poly_getnoise (poly0,noiseseed, nonce);
    nonce <- (W8.of_int 4);
    poly1 <@ poly_getnoise (poly1,noiseseed, nonce);
    nonce <- (W8.of_int 5);
    poly2 <@ poly_getnoise (poly2,noiseseed, nonce);
    ep <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (W8.of_int 6);
    epp <@ poly_getnoise (epp,noiseseed, nonce);
    return (sp_0,ep,epp);
  }

  proc indcpa_enc_compute(msgp:W16.t Array256.t,publicseed:W8.t Array32.t, pkpv:W16.t Array768.t, sp_0 ep:W16.t Array768.t, epp:W16.t Array256.t) : W16.t Array768.t * W16.t Array256.t = {
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

    
    k <@ poly_frommsg_encode (msgp);
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
    bp <@ polyvec_add2 (bp, ep);
    v <@ poly_add2 (v, epp);
    v <@ poly_add2 (v, k);
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
    var msg:W16.t Array256.t;

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
    msg <@ poly_frommsg_load(msgp);
    (r1,r2) <@ indcpa_enc_compute(msg,publicseed,pkpv,sp_0,ep,epp);
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

  proc indcpa_dec_compute(r1 : W32.t Array768.t, r2 : W16.t Array256.t,skpv:W16.t Array768.t) : W32.t Array256.t = {
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;
    var mp:W16.t Array256.t;
    var t:W16.t Array256.t;
    var msg :W32.t  Array256.t;
    mp <-witness;
    bp <@ polyvec_decompress_restore (r1);
    v <@ poly_decompress_restore (r2);
    bp <@ polyvec_ntt (bp);
    t <@ polyvec_pointwise_acc (skpv, bp);
    t <@ poly_invntt (t);
    mp <@ poly_sub (mp, v, t);
    mp <@ poly_reduce (mp);
    msg <@ poly_tomsg_decode (mp);
    return msg;
  }

  proc indcpa_dec_jazz (msgp:W64.t, ctp:W64.t, skp:W64.t) : unit = {
    
    var skpv:W16.t Array768.t;
    var r1 : W32.t Array768.t;
    var r2 : W16.t Array256.t;
    var msg :W32.t  Array256.t;

    skpv <@ polyvec_frombytes (skp);
    r1 <@ polyvec_decompress_load(ctp);
    ctp <- (ctp + (W64.of_int (3 * 320)));
    r2 <@ poly_decompress_load(ctp);

    msg <@ indcpa_dec_compute(r1,r2,skpv);
    poly_tomsg_store(msgp,msg);
    return ();
  }

}.

equiv keypair_same :  M.indcpa_keypair_jazz ~ Mderand.indcpa_keypair_jazz :
  ={arg,Glob.mem} ==> ={res,Glob.mem}.
proc.
inline Mderand.indcpa_keypair_expandseed Mderand.indcpa_keypair_compute. 
swap {1} [22..23] 14.
by sim; auto => />.
qed.

lemma iteri_fold (f : int -> 'b -> 'b) (z : 'b) (r : int) :
  0 <= r =>
  iteri r f z = foldl (fun acc i => f i acc) z (range 0 r).
proof.
  elim r; first by rewrite iteri0 // /range // /=.
  move => n *.
    rewrite iteriS // /= /range /= iotaSr //. 
    cut ->: rcons (iota_ 0 n) n = iota_ 0 n ++ [n] by smt(@List).
  by rewrite foldl_cat /= H0 /range /=.
qed.

lemma truncateu8_16K_W32 (a : W32.t) : truncateu8 a = truncateu8 (truncateu16 a).
proof.
  rewrite wordP => k *.
  rewrite /truncateu8 !of_intE.
  rewrite (BitEncoding.BS2Int.bs2int_eq 8 (to_uint a %% W8.modulus) 
          (to_uint ((bits2w ((BitEncoding.BS2Int.int2bs 16 (to_uint a %% W16.modulus)))%BitEncoding.BS2Int))%W16 %% W8.modulus)) // 1,2:/#.
  by rewrite -of_intE of_uintK !modz_mod modz_dvd_pow.
  by auto => />; smt.
qed.

lemma truncateu8_16K_W64 (a : W64.t) : truncateu8 a = truncateu8 (truncateu16 a).
proof.
  rewrite wordP => k *.
  rewrite /truncateu8 !of_intE.
  rewrite (BitEncoding.BS2Int.bs2int_eq 8 (to_uint a %% W8.modulus) 
          (to_uint ((bits2w ((BitEncoding.BS2Int.int2bs 16 (to_uint a %% W16.modulus)))%BitEncoding.BS2Int))%W16 %% W8.modulus)) // 1,2:/#.
  by rewrite -of_intE of_uintK !modz_mod modz_dvd_pow.
  by auto => />;smt.
qed.

lemma truncateu16_shl (a : W32.t) : truncateu16 (a `<<` (W8.of_int 4)) = 
                                    truncateu16 a `<<` (W8.of_int 4).
proof. by rewrite !shl_shlw // /truncateu16 to_uint_shl // shlMP // !of_intE modz_dvd_pow. qed.

lemma truncateu16E_U16 (a : W32.t) k : 0 <= k < 16 => (truncateu16 (a)).[k] = a.[k].
proof.
  move => ?.
  rewrite get_to_uint /truncateu16 of_intE get_bits2w // /BitEncoding.BS2Int.int2bs nth_mkseq // /=.
  cut ->: 0 <= k < 32 by smt().
  cut ->: 65536 = 2^16 by done.
  rewrite modz_pow2_div 1:/# /=.
  cut ->: to_uint a %/ 2 ^ k %% 2 ^ (16 - k) %% 2 = ((to_uint a) %/ 2 ^ k) %% 2 ^ (16 - k) %% 2^1 by done.
  by rewrite modz_dvd_pow 1:/#.
qed.

lemma truncateu16E_U16_W64 (a : W64.t) k : 0 <= k < 16 => (truncateu16 (a)).[k] = a.[k].
proof.
  move => ?.
  rewrite get_to_uint /truncateu16 of_intE get_bits2w // /BitEncoding.BS2Int.int2bs nth_mkseq // /=.
  cut ->: 0 <= k < 64 by smt().
  cut ->: 65536 = 2^16 by done.
  rewrite modz_pow2_div 1:/# /=.
  cut ->: to_uint a %/ 2 ^ k %% 2 ^ (16 - k) %% 2 = ((to_uint a) %/ 2 ^ k) %% 2 ^ (16 - k) %% 2^1 by done.
  by rewrite modz_dvd_pow 1:/#.
qed.

lemma truncateu16_orw_distr (a b : W32.t) : truncateu16 a `|` truncateu16 b = truncateu16 (a `|` b).
proof. by rewrite wordP => *; rewrite !orwE !truncateu16E_U16 //. qed.

lemma truncateu8_truncate16_shr (a : W64.t) : 
  truncateu8 (a `>>` (W8.of_int 2)) = truncateu8 (truncateu16 a `>>` (W8.of_int 2)).
proof.
  rewrite wordP => *.
  rewrite /truncateu8 !of_intwE H /= /int_bit to_uint_shr 1:/# to_uint_shr 1:/# !of_uintK /=.
  cut ->: 4 = 2^2 by done.
  cut ->: 256 = 2^8 by done.
  cut ->: 65536 = 2^16 by done.
  rewrite (modz_pow2_div 16 2 (to_uint a)) //=.
  cut ->: to_uint a %/ 4 %% 16384 %% 256 = to_uint a %/ 4 %% 256.
    pose x := to_uint a %/ 4.
    cut ->: 16384 = 2^14 by done.
    cut ->: 256 = 2^8 by done.
    by rewrite modz_dvd_pow. 
  by done.
qed.

equiv enc_same : M.indcpa_enc_jazz ~ Mderand.indcpa_enc_jazz :
  ={arg,Glob.mem} ==> ={res,Glob.mem}.
proc.
inline Mderand.indcpa_enc_expand_seed Mderand.indcpa_enc_compute.
swap {1} 9 -8.
swap {1} 19 -17.
swap {2} [6..7] 4.
swap {2} [10..13] -7.
swap {1} [23..25] 16.

(***********************)
swap{1} 16-15.
swap{1} 7-5.
seq 2 0 : (#pre); first by wp; skip.
(***********************)

seq 52  53 : (={Glob.mem,bp,v,ctp} /\ sctp{1} = ctp{2}).
sim.

seq 36 29 : (={Glob.mem,ctp,msgp,poly0,poly1,poly2,publicseed,noiseseed,pkpv} /\ epp{1} = epp0{2} /\ ep{1} = ep0{2} /\ sp_0{1} = sp_00{2}  /\ sctp{1} = ctp{2}).
swap{2} 1 3.
swap{2} [10..13] -6.
sim.
auto => />; sim.

(*********)
inline*.
sp 0 1.
seq 4 4 : (#pre /\
            (forall k, 0 <= k < 256 => rp{1}.[k] = rp{2}.[k] * W16.of_int ((3329 + 1) %/ 2))).
  while (#pre /\ 0 <= i0{1} <= 32 /\ i0{1} = i1{2} /\ ={ap} /\
          (forall k, 0 <= k < i0{1} * 8 => rp{1}.[k] = rp{2}.[k] * W16.of_int ((3329 + 1) %/ 2))).
    wp; skip => /> *; do split.
      by smt().
      by smt().
      move => k *.
        rewrite !Array256.get_setE 1..16:/#.
        case (k = 8 * i1{2} + 7) => ?; first by done. 
        case (k = 8 * i1{2} + 6) => ?; first by smt(). 
        case (k = 8 * i1{2} + 5) => ?; first by smt(). 
        case (k = 8 * i1{2} + 4) => ?; first by smt(). 
        case (k = 8 * i1{2} + 3) => ?; first by smt(). 
        case (k = 8 * i1{2} + 2) => ?; first by smt(). 
        case (k = 8 * i1{2} + 1) => ?; first by smt(). 
        case (k = 8 * i1{2}) => ?; first by done.
        by smt(). 
  wp; skip => /> *; do split.
    by smt().
    by move => *; rewrite H3 /#. 

sp 0 8.
wp.
while{2} (#pre /\ 0 <= i2{2} <= 32 /\
          (forall k, 0 <= k < i2{2} * 8 => rp{1}.[k] = rp0{2}.[k])) (32 - i2{2}).
  move => &m z.
  wp; skip => />.
    move => *; do split.
      by smt().
      by smt().
      move => k *.
        rewrite !Array256.get_setE 1..8:/#.
        case (k = 8 * i2{hr} + 7) => ?; first by rewrite H 1:/# H6.
        case (k = 8 * i2{hr} + 6) => ?; first by rewrite H 1:/# H7.
        case (k = 8 * i2{hr} + 5) => ?; first by rewrite H 1:/# H8.
        case (k = 8 * i2{hr} + 4) => ?; first by rewrite H 1:/# H9.
        case (k = 8 * i2{hr} + 3) => ?; first by rewrite H 1:/# H10.
        case (k = 8 * i2{hr} + 2) => ?; first by rewrite H 1:/# H11.
        case (k = 8 * i2{hr} + 1) => ?; first by rewrite H 1:/# H12.
        case (k = 8 * i2{hr}) => ?; first by rewrite H 1:/# H13.
        by rewrite H2 1:/#.
      by smt().

wp; skip => /> *; do split.
  by smt().
  move => *; split => *.
    by smt().
    by rewrite tP /#.
(*********)

inline *; auto => />.

seq 15 12 : (#pre /\ ={a,t,pv} /\ rp{1} = ctp{1} /\ aa{1} = witness /\ i0{1} = i1{2} /\ r{2} = witness /\
              i0{1} = W64.zero /\ j{1} = W64.zero /\ r{1} = r5{2} /\ r0{1} = r00{2} /\ r1{1} = r11{2} /\
              r2{1} = r21{2} /\ r00{1} = r01{2} /\ r10{1} = r12{2} /\ r20{1} = r22{2}).  by wp; skip => />.

seq 2 2  : (#pre).
  while (#post /\ 0 <= to_uint i3{1} <= 256 /\ i3{1} = i6{2}).
    by wp; skip => /> *; split; [
      by rewrite to_uintD_small 1,2:/# |
      by move : H1; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#].
  by wp; skip.

seq 3 3 : (#pre).
  while (#post /\ 0 <= to_uint i3{1} <= 256 /\ i3{1} = i6{2} /\ j1{1} = j0{2}).
    by wp; skip => /> *; split; [
      by rewrite to_uintD_small 1,2:/# |
      by move : H1; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#].
  by wp; skip.

seq 3 3 : (#pre).
  while (#post /\ 0 <= to_uint i3{1} <= 256 /\ i3{1} = i6{2} /\ j1{1} = j0{2}).
    by wp; skip => /> *; split; [
      by rewrite to_uintD_small 1,2:/# |
      by move : H1; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#].
  by wp; skip.

seq 4 4 : (#pre /\ ={rp2}).
  while (#post /\ 0 <= to_uint i4{1} <= 256 /\ i4{1} = i7{2}); first by wp; skip => /> *; smt(@W64).
  by wp; skip.

seq 4 4 : (#pre /\ ={rp3}).
  while (#post /\ 0 <= to_uint i5{1} <= 256 /\ i5{1} = i8{2}); first by wp;skip => /> *; smt(@W64).
  by wp; skip.

seq 4 4 : (#pre /\ ={rp4}).
  while (#post /\ 0 <= to_uint i6{1} <= 256 /\ i6{1} = i9{2}); first by wp; skip => /> *; smt(@W64).
  by wp; skip.

seq 5 5 : (#pre /\ ={p0,p1,p2} /\ r2{1} = r21{2} /\ r3{1} = r6{2}).
  by wp; skip.

seq 2 2 : (#pre).
  while (#post /\ 0 <= to_uint i7{1} <= 256 /\ i7{1} = i10{2}).
    by wp; skip => /> *; split; [
      by rewrite to_uintD_small 1,2:/# | 
      by move : H1; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#].
  by wp; skip.

seq 3 3 : (#pre).
  while (#post /\ 0 <= to_uint i7{1} <= 256 /\ i7{1} = i10{2} /\ j2{1} = j1{2}).
    by wp; skip => /> *; split; [
      by rewrite to_uintD_small 1,2:/# | 
      by move : H1; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#].
  by wp; skip.

seq 3 3 : (#pre).
  while (#post /\ 0 <= to_uint i7{1} <= 256 /\ i7{1} = i10{2} /\ j2{1}  = j1{2}).
    by wp; skip => /> *; split; [
      by rewrite to_uintD_small 1,2:/# | 
      by move : H1; rewrite ultE of_uintK pmod_small // => ?; rewrite to_uintD_small 1,2:/#].
  by wp; skip.

exists* (Glob.mem{1}); elim* => mem1.
seq 3 3 : ((* #[/3:7,8:10,15:]pre *)
              #[/3:8,9:11,12:13,16:]pre
              /\ ={aa} /\ Glob.mem{2} = mem1 /\ 
            (forall k, 0 <= k < 768 => r{2}.[k] = truncateu16 ((((((zeroextu64 aa{2}.[k]) `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023)) /\
            Glob.mem{1} = iteri 768 
              (fun k mem => if k %% 4 = 0 then 
                              storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                                (truncateu8 (r{2}.[k] `&` W16.of_int 255))
                            else if k %% 4 = 1 then
                              storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                                (truncateu8 ((r{2}.[k] `<<` W8.of_int 2) `|` (r{2}.[k - 1] `>>` W8.of_int 8)))
                            else if k %% 4 = 2 then
                              storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                                (truncateu8 ((r{2}.[k] `<<` W8.of_int 4) `|` (r{2}.[k - 1] `>>` W8.of_int 6)))
                            else
                              storeW8 (storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                              (truncateu8 ((r{2}.[k] `<<` W8.of_int 6) `|` (r{2}.[k - 1] `>>` W8.of_int 4)))) 
                              (to_uint (ctp{1} + W64.of_int ((k + k %/ 4) + 1))) 
                              (truncateu8 (((((((zeroextu64 aa{2}.[k]) `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023) `>>` W8.of_int 2))) mem1).
  while (#[/1:26]post /\ i0{1} = i1{2} /\ 0 <= to_uint i1{2} <= 768 + 3 /\ to_uint i1{2} %% 4 = 0 /\
          0 <= to_uint j{1} <= 964 /\ (to_uint j{1} %% 5 = 0) /\ 
          (to_uint j{1} - to_uint i1{2} = to_uint i1{2} %/ 4) /\ 
          (forall k, 0 <= k < to_uint i1{2} => r{2}.[k] = truncateu16 ((((((zeroextu64 aa{2}.[k]) `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023)) /\
          Glob.mem{1} = iteri (to_uint i0{1}) 
            (fun k mem => if k %% 4 = 0 then 
                            storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                              (truncateu8 (r{2}.[k] `&` W16.of_int 255))
                          else if k %% 4 = 1 then
                            storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                              (truncateu8 ((r{2}.[k] `<<` W8.of_int 2) `|` (r{2}.[k - 1] `>>` W8.of_int 8)))
                          else if k %% 4 = 2 then
                            storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                              (truncateu8 ((r{2}.[k] `<<` W8.of_int 4) `|` (r{2}.[k - 1] `>>` W8.of_int 6)))
                          else
                            storeW8 (storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                              (truncateu8 ((r{2}.[k] `<<` W8.of_int 6) `|` (r{2}.[k - 1] `>>` W8.of_int 4)))) 
                              (to_uint (ctp{1} + W64.of_int ((k + k %/ 4) + 1))) 
                              (truncateu8 (((((((zeroextu64 aa{2}.[k]) `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023) `>>` W8.of_int 2))) mem1).
  exists* i0{1}; elim* => i0'.
  seq 2 2 : (#[/2:32]pre /\ ={t,k0} /\ i0{1} = i0' + W64.of_int 4 /\ k0{2} = 4 /\
              0 <= to_uint j{1} <= 964 /\ (to_uint j{1} %% 5 = 0) /\ 
              to_uint j{1} - to_uint i0' = to_uint i0' %/ 4 /\
              (i0{1} \ult (W64.of_int 768) <=> i1{2} \ult (W64.of_int 768)) /\
              (forall k, 0 <= k < k0 => t.[k] = 
                ((((zeroextu64 aa{2}.[to_uint i0' + k] `<<` W8.of_int 10) + W64.of_int 1665) * 
                  W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023){2} /\
              (forall k, 0 <= k < to_uint i0' => r{2}.[k] = truncateu16 ((((((zeroextu64 aa{2}.[k]) `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023)) /\
              Glob.mem{1} = iteri (to_uint i0') 
                (fun k mem => if k %% 4 = 0 then 
                                storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                                  (truncateu8 (r{2}.[k] `&` W16.of_int 255))                              else if k %% 4 = 1 then
                                storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                                  (truncateu8 ((r{2}.[k] `<<` W8.of_int 2) `|` (r{2}.[k - 1] `>>` W8.of_int 8)))
                              else if k %% 4 = 2 then
                                storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                                  (truncateu8 ((r{2}.[k] `<<` W8.of_int 4) `|` (r{2}.[k - 1] `>>` W8.of_int 6)))
                              else
                                storeW8 (storeW8 mem (to_uint (ctp{1} + W64.of_int (k + k %/ 4))) 
                              (truncateu8 ((r{2}.[k] `<<` W8.of_int 6) `|` (r{2}.[k - 1] `>>` W8.of_int 4)))) 
                              (to_uint (ctp{1} + W64.of_int ((k + k %/ 4) + 1))) 
                              (truncateu8 (((((((zeroextu64 aa{2}.[k]) `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023) `>>` W8.of_int 2))) mem1).
    unroll{2} 2; unroll{2} 3; unroll{2} 4; unroll{2} 5.
      (rcondt{2} 2; first by move => &m; wp; skip); (rcondt{2} 10; first by move => &m; wp; skip); 
        (rcondt{2} 18; first by move => &m; wp; skip); (rcondt{2} 26; first by move => &m; wp; skip); 
          (rcondf{2} 34; first by move => &m; wp; skip).
    unroll{1} 2; unroll{1} 3; unroll{1} 4; unroll{1} 5.
      (rcondt{1} 2; first by move => &m; wp; skip); (rcondt{1} 10; first by move => &m; wp; skip); 
        (rcondt{1} 18; first by move => &m; wp; skip); (rcondt{1} 26; first by move => &m; wp; skip); 
          (rcondf{1} 34; first by move => &m; wp; skip).
      wp; skip => /> *. do split.
        by rewrite to_uintD_small 1,2:/#.
        by rewrite to_uintD_small // 1:/#; move : H7; rewrite ultE of_uintK pmod_small // /#. 
        by rewrite !to_uintD_small 1,2:/#.
        by rewrite tP => j *; rewrite !Array4.get_setE /= /#.  
        move => k *.
          rewrite !Array4.get_setE //=. 
          case (k = 3) => ?; subst; first by
            (cut ->: to_uint (i1{2} + (of_int 3)%W64) = to_uint i1{2} + 3 by rewrite !to_uintD_small 1,2:/#); smt().          case (k = 2) => ?; subst; first by
            (cut ->: to_uint (i1{2} + (of_int 2)%W64) = to_uint i1{2} + 2 by rewrite !to_uintD_small 1,2:/#); smt().          case (k = 1) => ?; subst; first by
            (cut ->: to_uint (i1{2} + (of_int 1)%W64) = to_uint i1{2} + 1 by rewrite !to_uintD_small 1,2:/#); smt().
          case (k = 0) => ?; subst => //. 
          by smt().
    wp; skip => /> *; do split.
      by rewrite to_uintD_small 1,2:/#.
      by move : H0 H1; rewrite !to_uintD_small 1,2:/# !of_uintK pmod_small // /#.
      by rewrite !to_uintD_small 1,2:/#.
      by rewrite !to_uintD_small 1,2:/# !of_uintK !pmod_small // /#.
      move => k ?; rewrite to_uintD_small 1:/# of_uintK /= => ?.
        rewrite !Array768.get_setE; first 4 by move : H0 H1; rewrite !to_uintD_small 1,2:/#. 
        case (k = to_uint i0' + 3) => ?; subst; first by rewrite H6 //. 
        case (k = to_uint i0' + 2) => ?; subst; first by rewrite H6 //.
        case (k = to_uint i0' + 1) => ?; subst; first by rewrite H6 //.
        case (k = to_uint i0') => ?; subst; first by rewrite H6 //.
        by smt().
    cut ->: to_uint (i0' + (of_int 4)%W64) = to_uint i0' + 3 + 1 by rewrite to_uintD_small of_uintK pmod_small /#.
    rewrite iteriS 1:/# /=.
    cut ->: (to_uint i0' + 3) %% 4 = 0 <=> false by smt().
    simplify; cut ->: (to_uint i0' + 3) %% 4 = 1 <=> false by smt().
    simplify; cut ->: (to_uint i0' + 3) %% 4 = 2 <=> false by smt().
    simplify; cut ->: to_uint i0' + 3 = to_uint i0' + 2 + 1 by done.
    rewrite iteriS 1:/# /=.
    simplify; cut ->: (to_uint i0' + 2) %% 4 = 0 <=> false by smt().
    simplify; cut ->: (to_uint i0' + 2) %% 4 = 1 <=> false by smt().
    simplify; cut ->: (to_uint i0' + 2) %% 4 = 2 by smt().
    simplify; cut ->: to_uint i0' + 2 = to_uint i0' + 1 + 1 by done.
    rewrite iteriS 1:/# /=.
    simplify; cut ->: (to_uint i0' + 1) %% 4 = 0 <=> false by smt().
    simplify; cut ->: (to_uint i0' + 1) %% 4 = 1 by smt().
    simplify; rewrite iteriS 1:/# /=.
    simplify; cut ->: (to_uint i0') %% 4 = 0 by smt().
    simplify; cut ->: to_uint i0' + to_uint i0' %/ 4 = to_uint j{1} by smt().
    cut ->: to_uint i0' + 1 + (to_uint i0' + 1) %/ 4 = to_uint j{1} + 1 by smt().
    cut ->: to_uint i0' + 2 + (to_uint i0' + 2) %/ 4 = to_uint j{1} + 2 by smt().
    cut ->: to_uint i0' + 3 + (to_uint i0' + 3) %/ 4 = to_uint j{1} + 3 by smt().
    cut ->: r{2}.[to_uint i0' <- truncateu16 t{2}.[0]].[to_uint i0' + 1 <- truncateu16 t{2}.[1]].[
            to_uint i0' + 2 <- truncateu16 t{2}.[2]].[to_uint i0' + 3 <- truncateu16 t{2}.[3]].[
            to_uint i0' + 3] = truncateu16 t{2}.[3] by rewrite get_setE; first by smt(@W64).
    cut ->: r{2}.[to_uint i0' <- truncateu16 t{2}.[0]].[to_uint i0' + 1 <- truncateu16 t{2}.[1]].[
            to_uint i0' + 2 <- truncateu16 t{2}.[2]].[to_uint i0' + 3 <- truncateu16 t{2}.[3]].[
            to_uint i0' + 2] = truncateu16 t{2}.[2].
      rewrite Array768.get_setE; first by smt(@W64).
      cut ->: to_uint i0' + 2 = to_uint i0' + 3 <=> false by smt().
      simplify; rewrite Array768.get_setE; first by smt(@W64).
      by simplify.
    cut ->: r{2}.[to_uint i0' <- truncateu16 t{2}.[0]].[to_uint i0' + 1 <- truncateu16 t{2}.[1]].[
            to_uint i0' + 2 <- truncateu16 t{2}.[2]].[to_uint i0' + 3 <- truncateu16 t{2}.[3]].[
            to_uint i0' + 1] = truncateu16 t{2}.[1].
      rewrite Array768.get_setE; first by smt(@W64).
      cut ->: to_uint i0' + 1 = to_uint i0' + 3 <=> false by smt().
      simplify; rewrite Array768.get_setE; first by smt(@W64).
      cut ->: to_uint i0' + 1 = to_uint i0' + 2 <=> false by smt().
      simplify; rewrite Array768.get_setE; first by smt(@W64).
      by simplify.
    cut ->: r{2}.[to_uint i0' <- truncateu16 t{2}.[0]].[to_uint i0' + 1 <- truncateu16 t{2}.[1]].[
            to_uint i0' + 2 <- truncateu16 t{2}.[2]].[to_uint i0' + 3 <- truncateu16 t{2}.[3]].[
            to_uint i0'] = truncateu16 t{2}.[0].
      rewrite Array768.get_setE; first by smt(@W64).
      cut ->: to_uint i0' = to_uint i0' + 3 <=> false by smt().
      simplify; rewrite Array768.get_setE; first by smt(@W64).
      cut ->: to_uint i0' = to_uint i0' + 2 <=> false by smt().
      simplify; rewrite Array768.get_setE; first by smt(@W64).
      cut ->: to_uint i0' = to_uint i0' + 1 <=> false by smt().
      simplify; rewrite Array768.get_setE; first by smt(@W64).
      by simplify.
    pose f := (fun (k : int) (mem : global_mem_t) =>
                  if k %% 4 = 0 then
                    storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64))
                      (truncateu8 (r{2}.[k] `&` (of_int 255)%W16))
                  else
                    if k %% 4 = 1 then
                      storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64))
                        (truncateu8 ((r{2}.[k] `<<` (of_int 2)%W8) `|` (r{2}.[k - 1] `>>` (of_int 8)%W8)))
                    else
                      if k %% 4 = 2 then
                        storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64))
                          (truncateu8 ((r{2}.[k] `<<` (of_int 4)%W8) `|` (r{2}.[k - 1] `>>` (of_int 6)%W8)))
                      else
                        storeW8
                          (storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64))
                             (truncateu8 ((r{2}.[k] `<<` (of_int 6)%W8) `|` (r{2}.[k - 1] `>>` (of_int 4)%W8))))
                          (to_uint (ctp{2} + (of_int (k + k %/ 4 + 1))%W64))
                          (truncateu8 ((((zeroextu64 aa{2}.[k] `<<` (of_int 10)%W8) + (of_int 1665)%W64) *
                                 (of_int 1290167)%W64 `>>` (of_int 32)%W8) `&`
                                (of_int 1023)%W64 `>>` (of_int 2)%W8))).
      pose r := r{2}.[to_uint i0' <- truncateu16 t{2}.[0]].[to_uint i0' + 1 <- truncateu16 t{2}.[1]].[
                to_uint i0' + 2 <- truncateu16 t{2}.[2]].[to_uint i0' + 3 <- truncateu16 t{2}.[3]].
      pose g := (fun (k : int) (mem : global_mem_t) =>
                    if k %% 4 = 0 then
                      storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64))
                        (truncateu8 (r.[k] `&` (of_int 255)%W16))
                    else
                      if k %% 4 = 1 then
                        storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64))
                          (truncateu8 ((r.[k] `<<` (of_int 2)%W8) `|` (r.[k - 1] `>>` (of_int 8)%W8)))
                      else
                        if k %% 4 = 2 then
                          storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64))
                            (truncateu8 ((r.[k] `<<` (of_int 4)%W8) `|` (r.[k - 1] `>>` (of_int 6)%W8)))
                        else
                          storeW8
                            (storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64))
                               (truncateu8 ((r.[k] `<<` (of_int 6)%W8) `|` (r.[k - 1] `>>` (of_int 4)%W8))))
                            (to_uint (ctp{2} + (of_int (k + k %/ 4 + 1))%W64)) (
                            truncateu8 ((((zeroextu64 aa{2}.[k] `<<` (of_int 10)%W8) + (of_int 1665)%W64) *
                                 (of_int 1290167)%W64 `>>` (of_int 32)%W8) `&`
                                (of_int 1023)%W64 `>>` (of_int 2)%W8))).
      rewrite (eq_iteri f g _ _).
        move => k mem ? /=; rewrite /f /g /r.
        case (k %% 4 = 0) => ?.
          rewrite Array768.get_setE; first by smt(@W64).
          cut ->: k = to_uint i0' + 3 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k = to_uint i0' + 2 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64).
          cut ->: k = to_uint i0' + 1 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64).
          cut ->: k = to_uint i0' <=> false by smt().
          by simplify.
        case (k %% 4 = 1) => ?.
          rewrite Array768.get_setE; first by smt(@W64).
          cut ->: k = to_uint i0' + 3 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k = to_uint i0' + 2 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64).
          cut ->: k = to_uint i0' + 1 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64).
          cut ->: k = to_uint i0' <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' + 3 <=> false by smt().
          rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' + 2 <=> false by smt().
          rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' + 1 <=> false by smt().
          rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' <=> false by smt().
          by simplify.
        case (k %% 4 = 2) => ?.
          rewrite Array768.get_setE; first by smt(@W64).
          cut ->: k = to_uint i0' + 3 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k = to_uint i0' + 2 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64).
          cut ->: k = to_uint i0' + 1 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64).
          cut ->: k = to_uint i0' <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' + 3 <=> false by smt().
          rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' + 2 <=> false by smt().
          rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' + 1 <=> false by smt().
          rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' <=> false by smt().
          by simplify.
        case (k %% 4 = 3) => ?.
          rewrite Array768.get_setE; first by smt(@W64).
          cut ->: k = to_uint i0' + 3 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k = to_uint i0' + 2 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64).
          cut ->: k = to_uint i0' + 1 <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64).
          cut ->: k = to_uint i0' <=> false by smt().
          simplify; rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' + 3 <=> false by smt().
          rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' + 2 <=> false by smt().
          rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' + 1 <=> false by smt().
          rewrite Array768.get_setE /=; first by smt(@W64). 
          cut ->: k - 1 = to_uint i0' <=> false by smt(). 
          by simplify.
        by smt().
      congr; last by rewrite H6.
      congr; last by rewrite of_intD to_uintK. 
      congr; last by rewrite of_intD to_uintK. 
      congr; last by rewrite of_intD to_uintK. 
      congr; last by simplify; rewrite of_intD to_uintK. 
  wp; skip => /> *; do split.
    by smt().
    by rewrite iteri0.
    move => *; do split.
      by move => k *; rewrite H8; move : H; rewrite ultE of_uintK /= /#.
      by congr; move : H; rewrite ultE of_uintK pmod_small // /#.

exists* ctp{1}; elim* => ctp1.
seq 4 3 : (#[/2,3,6,7,9:28]pre /\ ctp{2} = ctp1 /\ 
            (ctp = ctp1 + (W64.of_int (3*320))){1} /\ (rp0 = ctp){1} /\ r10{2} = r{2} /\ ={a0,rp1} /\ 
            Glob.mem{1} = iteri 768
    (fun (k2 : int) (mem : global_mem_t) =>
       if k2 %% 4 = 0 then
         storeW8 mem (to_uint (ctp1 + (of_int (k2 + k2 %/ 4))%W64)) (truncateu8 (r{2}.[k2] `&` (of_int 255)%W16))
       else
         if k2 %% 4 = 1 then
           storeW8 mem (to_uint (ctp1 + (of_int (k2 + k2 %/ 4))%W64))
             (truncateu8 ((r{2}.[k2] `<<` (of_int 2)%W8) `|` (r{2}.[k2 - 1] `>>` (of_int 8)%W8)))
         else
           if k2 %% 4 = 2 then
             storeW8 mem (to_uint (ctp1 + (of_int (k2 + k2 %/ 4))%W64))
               (truncateu8 ((r{2}.[k2] `<<` (of_int 4)%W8) `|` (r{2}.[k2 - 1] `>>` (of_int 6)%W8)))
           else
             storeW8
               (storeW8 mem (to_uint (ctp1 + (of_int (k2 + k2 %/ 4))%W64))
                  (truncateu8 ((r{2}.[k2] `<<` (of_int 6)%W8) `|` (r{2}.[k2 - 1] `>>` (of_int 4)%W8))))
               (to_uint (ctp1 + (of_int (k2 + k2 %/ 4 + 1))%W64)) 
               (truncateu8 (((((zeroextu64 aa{2}.[k2] `<<` (of_int 10)%W8) + (of_int 1665)%W64) * (of_int 1290167)%W64 `>>` (of_int 32)%W8) `&` (of_int 1023)%W64) `>>` (of_int 2)%W8))) mem1); first by wp; skip. 
seq 2 2 : (#pre).
  while (#pre /\ i2{1} = i5{2} /\ 0 <= to_uint i2{1} <= 256); first by wp; skip => /> *;smt(@W64).
  by wp; skip. 

seq 1 2 : (#pre /\ ={a0} /\ (r0 = witness){2}); first by wp; skip.

exists* Glob.mem{1}; elim* => mem1'.
seq 0 0 : (#[/1,2:30,31,32]pre /\ mem1' = iteri 768 (fun (k2 : int) (mem : global_mem_t) =>
         if k2 %% 4 = 0 then
           storeW8 mem (to_uint (ctp1 + (of_int (k2 + k2 %/ 4))%W64)) (truncateu8 (r{2}.[k2] `&` (of_int 255)%W16))
         else
           if k2 %% 4 = 1 then
             storeW8 mem (to_uint (ctp1 + (of_int (k2 + k2 %/ 4))%W64))
               (truncateu8 ((r{2}.[k2] `<<` (of_int 2)%W8) `|` (r{2}.[k2 - 1] `>>` (of_int 8)%W8)))
           else
             if k2 %% 4 = 2 then
               storeW8 mem (to_uint (ctp1 + (of_int (k2 + k2 %/ 4))%W64))
                 (truncateu8 ((r{2}.[k2] `<<` (of_int 4)%W8) `|` (r{2}.[k2 - 1] `>>` (of_int 6)%W8)))
             else
               storeW8
                            (storeW8 mem (to_uint (ctp1 + (of_int (k2 + k2 %/ 4))%W64))
                               (truncateu8 ((r{2}.[k2] `<<` (of_int 6)%W8) `|` (r{2}.[k2 - 1] `>>` (of_int 4)%W8))))
                            (to_uint (ctp1 + (of_int (k2 + k2 %/ 4 + 1))%W64))
                            (truncateu8 (((((zeroextu64 aa{2}.[k2] `<<` (of_int 10)%W8) + (of_int 1665)%W64) * (of_int 1290167)%W64 `>>` (of_int 32)%W8) `&` (of_int 1023)%W64) `>>` (of_int 2)%W8))) mem1).
  by skip => />. (* no #pre on conseq *)

seq 3 2 : (#[/2:30,31:]pre /\ 
            Glob.mem{1} = iteri 128 (fun k mem => storeW8 mem (to_uint (ctp{1} + W64.of_int k)) 
              (truncateu8 (r0{2}.[k*2] `|` (r0{2}.[k*2+1] `<<` W8.of_int 4)))) mem1').
  while (#[/1:31]post /\ i2{2}=to_uint  i1{1}  /\ 0 <= to_uint i1{1} <= 128 /\ 
          Glob.mem{1} = iteri (to_uint i1{1}) (fun k mem => storeW8 mem (to_uint (rp0{1} + W64.of_int k)) 
            (truncateu8 (r0{2}.[k*2] `|` (r0{2}.[k*2+1] `<<` W8.of_int 4)))) mem1' /\ to_uint j0{1} = 2*to_uint i1{1}).
    wp; skip => /> *; do split.
      by smt(@W64).
      by smt(@W64).
      by smt(@W64).
      rewrite (_: to_uint (i1{1} + W64.one) = to_uint i1{1} + 1); first by smt(@W64).
      (rewrite iteriS; first by done) => /=.
      cut ->: r0{2}.[2 * to_uint i1{1} <- truncateu16 ((((zeroextu32 a0{2}.[2 * to_uint i1{1}] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32)].[2 * to_uint i1{1} + 1 <- truncateu16 ((((zeroextu32 a0{2}.[2 * to_uint i1{1} + 1] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32)].[to_uint i1{1} * 2] = truncateu16 ((((zeroextu32 a0{2}.[2 * to_uint i1{1}] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32).
        rewrite Array256.get_setE 1:/#.
        cut ->: to_uint i1{1} * 2 = 2 * to_uint i1{1} + 1 <=> false by smt().
        simplify; rewrite Array256.get_setE 1:/#.
        by rewrite mulzC /= //.
      cut ->: r0{2}.[2 * to_uint i1{1} <- truncateu16 ((((zeroextu32 a0{2}.[2 * to_uint i1{1}] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32)].[2 * to_uint i1{1} + 1 <- truncateu16 ((((zeroextu32 a0{2}.[2 * to_uint i1{1} + 1] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32)].[to_uint i1{1} * 2 + 1] = truncateu16 ((((zeroextu32 a0{2}.[2 * to_uint i1{1} + 1] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32).
        rewrite Array256.get_setE 1:/#.
        cut ->: to_uint i1{1} * 2 + 1 = 2 * to_uint i1{1} + 1 by smt().
        by simplify.
      congr; last first.
       rewrite (_: to_uint (j0{1} + W64.one) =  to_uint j0{1} + 1); first by rewrite W64.to_uintD_small; smt(@W64). rewrite H2. 
        pose a := (((zeroextu32 a0{2}.[2 * to_uint i1{1}] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32.
        pose b := ((((zeroextu32 a0{2}.[2 * to_uint i1{1} + 1] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32).
        by rewrite -truncateu16_shl truncateu16_orw_distr truncateu8_16K_W32.
      rewrite (eq_iteri (fun (k : int) (mem : global_mem_t) =>
     storeW8 mem (to_uint (ctp{2} + (of_int (960 + k))%W64))
       (truncateu8 (r0{2}.[k * 2] `|` (r0{2}.[k * 2 + 1] `<<` (of_int 4)%W8)))) (fun (k : int) (mem : global_mem_t) =>
     storeW8 mem (to_uint (ctp{2} + (of_int (960 + k))%W64))
       (truncateu8
          (r0{2}.[2 * to_uint i1{1} <-
             truncateu16
               ((((zeroextu32 a0{2}.[2 * to_uint i1{1}] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`
                 (of_int 28)%W8) `&`
                (of_int 15)%W32)].[2 * to_uint i1{1} + 1 <-
             truncateu16
               ((((zeroextu32 a0{2}.[2 * to_uint i1{1} + 1] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`
                 (of_int 28)%W8) `&`
                (of_int 15)%W32)].[k * 2] `|`
           (r0{2}.[2 * to_uint i1{1} <-
              truncateu16
                ((((zeroextu32 a0{2}.[2 * to_uint i1{1}] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`
                  (of_int 28)%W8) `&`
                 (of_int 15)%W32)].[2 * to_uint i1{1} + 1 <-
              truncateu16
                ((((zeroextu32 a0{2}.[2 * to_uint i1{1} + 1] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`
                  (of_int 28)%W8) `&`
                 (of_int 15)%W32)].[k * 2 + 1] `<<`
            (of_int 4)%W8)))) _ _).
        move => k * /=.
          cut ->: r0{2}.[2 * to_uint i1{1} <- truncateu16 ((((zeroextu32 a0{2}.[2 * to_uint i1{1}] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32)].[2 * to_uint i1{1} + 1 <- truncateu16 ((((zeroextu32 a0{2}.[2 * to_uint i1{1} + 1] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32)].[k * 2] = r0{2}.[k * 2].
            rewrite Array256.get_setE 1:/#.
            cut ->: k * 2 = 2 * to_uint i1{1} + 1 <=> false by smt().
            simplify; rewrite Array256.get_setE 1:/#.
            cut ->: k * 2 = 2 * to_uint i1{1} <=> false by smt().
            by simplify.
          cut ->: r0{2}.[2 * to_uint i1{1} <- truncateu16 ((((zeroextu32 a0{2}.[2 * to_uint i1{1}] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32)].[2 * to_uint i1{1} + 1 <- truncateu16 ((((zeroextu32 a0{2}.[2 * to_uint i1{1} + 1] `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` (of_int 15)%W32)].[k * 2 + 1] = r0{2}.[k * 2 + 1].
            rewrite Array256.get_setE 1:/#.
            cut ->: k * 2 + 1 = 2 * to_uint i1{1} + 1 <=> false by smt().
            simplify; rewrite Array256.get_setE 1:/#.
            cut ->: k * 2 + 1 = 2 * to_uint i1{1} <=> false by smt().
            by simplify.
        by done.
      by done. 
      by smt(@W64). 
      by rewrite to_uintD_small; smt(@W64).
      by smt(@W64).
      by rewrite ultE; smt(@W64).
    auto => />. 
    move => *;do split.
    move => *.
    by rewrite (iteri0 0 _ _) //.
    move => *.
      cut ->: to_uint i1_L = 128 by smt().
      by done.

seq 0 5 : (#pre /\ r20{2} = r0{2} /\ r1{2} = r10{2} /\ r2{2} = r20{2} /\ 
            rp{2} = ctp{2} /\ r3{2} = r1{2} /\ t1{2} = witness); first by wp; skip.

seq 0 3 : (#[/1:22,23:37]pre /\ Glob.mem{2} = mem1').
  while{2} (#[/1:36]post /\ 0 <= to_uint i3{2} <= 768 + 3 /\ to_uint i3{2} %% 4 = 0 /\
          0 <= to_uint j{2} <= 964 /\ (to_uint j{2} %% 5 = 0) /\ 
          (to_uint j{2} - to_uint i3{2} = to_uint i3{2} %/ 4) /\ 
          Glob.mem{2} = iteri (to_uint i3{2}) 
            (fun k mem => if k %% 4 = 0 then 
                            storeW8 mem (to_uint (ctp1 + W64.of_int (k + k %/ 4))) 
                              (truncateu8 (r{2}.[k] `&` W16.of_int 255))
                          else if k %% 4 = 1 then
                            storeW8 mem (to_uint (ctp1 + W64.of_int (k + k %/ 4))) 
                              (truncateu8 ((r{2}.[k] `<<` W8.of_int 2) `|` (r{2}.[k - 1] `>>` W8.of_int 8)))
                          else if k %% 4 = 2 then
                            storeW8 mem (to_uint (ctp1 + W64.of_int (k + k %/ 4))) 
                              (truncateu8 ((r{2}.[k] `<<` W8.of_int 4) `|` (r{2}.[k - 1] `>>` W8.of_int 6)))
                          else
                            storeW8
                            (storeW8 mem (to_uint (ctp1 + (of_int (k + k %/ 4))%W64))
                               (truncateu8 ((r{2}.[k] `<<` (of_int 6)%W8) `|` (r{2}.[k - 1] `>>` (of_int 4)%W8))))
                            (to_uint (ctp1 + (of_int (k + k %/ 4 + 1))%W64))
                            (truncateu8 (r{2}.[k] `>>` (of_int 2)%W8))) mem1) (768 - to_uint i3{2}).
    move => &m z.
    unroll 2; unroll 3; unroll 4; unroll 5.
      (rcondt 2; first by wp; skip); (rcondt 5; first by wp; skip);
        (rcondt 8; first by wp; skip); (rcondt 11; first by wp; skip);
          (rcondf 14; first by wp; skip).
    wp; skip => /> *; do split.
      by rewrite to_uintD_small 1,2:/#.
      by rewrite to_uintD_small // 1:/#; move : H7; rewrite ultE of_uintK pmod_small // /#. 
      by rewrite !to_uintD_small 1,2:/#.
      by rewrite to_uintD_small 1,2:/#.
      by rewrite to_uintD_small 1:/# !of_uintK //; move : H7; rewrite ultE of_uintK pmod_small // /#.
      by rewrite to_uintD_small 1:/# /#.
      by rewrite !to_uintD_small 1,2:/# !of_uintK //; move : H7; rewrite ultE of_uintK pmod_small // /#.
      cut ->: to_uint (i3{hr} + (of_int 4)%W64) = to_uint i3{hr} + 3 + 1 by rewrite to_uintD_small of_uintK pmod_small /#.
      rewrite iteriS 1:/# /=.
      cut ->: (to_uint i3{hr} + 3) %% 4 = 0 <=> false by smt().
      simplify; cut ->: (to_uint i3{hr} + 3) %% 4 = 1 <=> false by smt().
      simplify; cut ->: (to_uint i3{hr} + 3) %% 4 = 2 <=> false by smt().
      simplify; cut ->: to_uint i3{hr} + 3 = to_uint i3{hr} + 2 + 1 by done.
      rewrite iteriS 1:/# /=.
      simplify; cut ->: (to_uint i3{hr} + 2) %% 4 = 0 <=> false by smt().
      simplify; cut ->: (to_uint i3{hr} + 2) %% 4 = 1 <=> false by smt().
      simplify; cut ->: (to_uint i3{hr} + 2) %% 4 = 2 by smt().
      simplify; cut ->: to_uint i3{hr} + 2 = to_uint i3{hr} + 1 + 1 by done.
      rewrite iteriS 1:/# /=.
      simplify; cut ->: (to_uint i3{hr} + 1) %% 4 = 0 <=> false by smt().
      simplify; cut ->: (to_uint i3{hr} + 1) %% 4 = 1 by smt().
      simplify; rewrite iteriS 1:/# /=.
      simplify; cut ->: (to_uint i3{hr}) %% 4 = 0 by smt().
      simplify; cut ->: to_uint i3{hr} + to_uint i3{hr} %/ 4 = to_uint j{hr} by smt().
      cut ->: to_uint i3{hr} + 1 + (to_uint i3{hr} + 1) %/ 4 = to_uint j{hr} + 1 by smt().
      cut ->: to_uint i3{hr} + 2 + (to_uint i3{hr} + 2) %/ 4 = to_uint j{hr} + 2 by smt().
      cut ->: to_uint i3{hr} + 3 + (to_uint i3{hr} + 3) %/ 4 = to_uint j{hr} + 3 by smt().
      congr; last by rewrite to_uintD_small 1:/# of_uintK /=.
      congr; last by rewrite !to_uintD_small 1,2:/# !of_uintK /=.
      congr; last by rewrite !to_uintD_small 1,2:/# !of_uintK /=.
      congr; last by rewrite !to_uintD_small 1,2:/# !of_uintK /=.
      by rewrite of_intD to_uintK.
      by rewrite of_intD to_uintK.
      by rewrite of_intD to_uintK.
      by simplify; rewrite of_intD to_uintK.
    by rewrite to_uintD_small 1:/# of_uintK /= /#.
  wp; skip => /> *; do split.
    by rewrite iteri0 //.
    move => *; do split.
      by move => *; rewrite ultE of_uintK /#.
    move => *.
      cut ->: (to_uint i3_R) = 768 by move : H0; rewrite ultE of_uintK pmod_small // /#.
      rewrite (eq_iteri 
              (fun (k : int) (mem : global_mem_t) => if k %% 4 = 0 then storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64)) (truncateu8 (r{2}.[k] `&` (of_int 255)%W16)) else if k %% 4 = 1 then storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64)) (truncateu8 ((r{2}.[k] `<<` (of_int 2)%W8) `|` (r{2}.[k - 1] `>>` (of_int 8)%W8))) else if k %% 4 = 2 then storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64)) (truncateu8 ((r{2}.[k] `<<` (of_int 4)%W8) `|` (r{2}.[k - 1] `>>` (of_int 6)%W8))) else storeW8 (storeW8 mem (to_uint (ctp{2} + (of_int (k + k %/ 4))%W64)) (truncateu8 ((r{2}.[k] `<<` (of_int 6)%W8) `|` (r{2}.[k - 1] `>>` (of_int 4)%W8)))) (to_uint (ctp{2} + (of_int (k + k %/ 4 + 1))%W64)) (truncateu8 (r{2}.[k] `>>` (of_int 2)%W8))) 
              (fun (k2 : int) (mem : global_mem_t) => if k2 %% 4 = 0 then storeW8 mem (to_uint (ctp{2} + (of_int (k2 + k2 %/ 4))%W64)) (truncateu8 (r{2}.[k2] `&` (of_int 255)%W16)) else if k2 %% 4 = 1 then storeW8 mem (to_uint (ctp{2} + (of_int (k2 + k2 %/ 4))%W64)) (truncateu8 ((r{2}.[k2] `<<` (of_int 2)%W8) `|` (r{2}.[k2 - 1] `>>` (of_int 8)%W8))) else if k2 %% 4 = 2 then storeW8 mem (to_uint (ctp{2} + (of_int (k2 + k2 %/ 4))%W64)) (truncateu8 ((r{2}.[k2] `<<` (of_int 4)%W8) `|` (r{2}.[k2 - 1] `>>` (of_int 6)%W8))) else storeW8 (storeW8 mem (to_uint (ctp{2} + (of_int (k2 + k2 %/ 4))%W64)) (truncateu8 ((r{2}.[k2] `<<` (of_int 6)%W8) `|` (r{2}.[k2 - 1] `>>` (of_int 4)%W8)))) (to_uint (ctp{2} + (of_int (k2 + k2 %/ 4 + 1))%W64)) (truncateu8 ((((zeroextu64 aa{2}.[k2] `<<` (of_int 10)%W8) + (of_int 1665)%W64) * (of_int 1290167)%W64 `>>` (of_int 32)%W8) `&` (of_int 1023)%W64 `>>` (of_int 2)%W8)))).
        by move => k mem * /=; do congr; rewrite H 1:/# truncateu8_truncate16_shr 1:/#.
      by done.
      
seq 0 3 : (#[/1:23,24:34,35:]pre /\ ctp{2} = ctp1 + (W64.of_int (3 * 320)) /\ rp0{2} = ctp{2} /\ r4{2} = r2{2}).
  by  wp; skip => />. 

while{2} (#[/1:34,35:]pre /\ 0 <= i4{2} <= 128 /\
          Glob.mem{2} = iteri i4{2} (fun k mem => storeW8 mem (to_uint (ctp{2} + W64.of_int k)) 
            (truncateu8 (r0{2}.[k*2] `|` (r0{2}.[k*2+1] `<<` W8.of_int 4)))) mem1') (128 - i4{2}).
  move => &m z.
  wp; skip => /> *; do split.
    by smt().
    by smt().
    rewrite iteriS // /=.
    by congr; rewrite mulzC. 
    by smt().

wp; skip => /> *; do split.
  by rewrite (iteri0 0 _ _) //.
  move => *; do split.
    by smt().
    by move => *; congr => /#.
qed.

lemma iteri8 (f : int -> 'a -> 'a) (st : 'a) :
  iteri 8 f st = f 7 (f 6 (f 5 (f 4 (f 3 (f 2 (f 1 (f 0 st))))))).
proof.
  cut ->: 8 = 0+1+1+1+1+1+1+1+1 by done.
  by rewrite !iteriS //= iteri0.
qed.

equiv dec_same :  M.indcpa_dec_jazz ~ Mderand.indcpa_dec_jazz :
  ={arg,Glob.mem} ==> ={res,Glob.mem}.
proc.
inline Mderand.indcpa_dec_compute.
swap {2} 7 3.
swap {2} 1 8.

swap {1} 2 10.
swap {2} 6 7.
seq 7 7 : (={Glob.mem,msgp,skp,bp,v}); last first.
seq 7 8 : (#pre /\ ={mp}). by sim.

(*********)
inline*.
seq 3 3 : (#pre /\ (rp = msgp){1} /\ ={a} /\ (a = mp){1} /\ rp0{1} = rp1{2} /\ (rp0 = a){1} /\ (rp = witness){2}).
by   wp; skip => />.
seq 2 2 : (#[/1:11]pre).
  while (#post /\ 0 <= to_uint i0{1} <= 256 /\ i0{1} = i1{2}); first by wp; skip => />;smt(@W64). 
  by wp; skip => />.
swap{2} 3-1.
seq 1 2 : (#[/1:9,10:]pre /\ ={a} /\ r{2} = witness).
  by wp; skip.
exists* Glob.mem{1}; elim* => mem1.
seq 2 2 : (#[/3:12]pre /\ Glob.mem{2} = mem1 /\
            Glob.mem{1} = iteri 32 (fun i mem => storeW8 mem (to_uint (msgp{1} + (W64.of_int i))) 
                            (iteri 8 (fun j r => r `|` truncateu8 (rp{2}.[8*i+j] `<<` W8.of_int j)) W8.zero)) mem1).
  while (#[/1:11]post /\ ={i} /\ 0 <= i{1} <= 32 /\
          Glob.mem{1} = iteri i{1} (fun i mem => storeW8 mem (to_uint (msgp{1} + (W64.of_int i))) 
                            (iteri 8 (fun j r => r `|` truncateu8 (rp{2}.[8*i+j] `<<` W8.of_int j)) W8.zero)) mem1).
    unroll{1} 3; unroll{1} 4; unroll{1} 5; unroll{1} 6; unroll{1} 7; unroll{1} 8; unroll{1} 9; unroll{1} 10.
      (rcondt{1} 3; first by move => &m; wp; skip); (rcondt{1} 13; first by move => &m; wp; skip); (rcondt{1} 23; first by move => &m; wp; skip); (rcondt{1} 33; first by move => &m; wp; skip); (rcondt{1} 43; first by move => &m; wp; skip); (rcondt{1} 53; first by move => &m; wp; skip); (rcondt{1} 63; first by move => &m; wp; skip); (rcondt{1} 73; first by move => &m; wp; skip); (rcondf{1} 83; first by move => &m; wp; skip).
    unroll{2} 3; unroll{2} 4; unroll{2} 5; unroll{2} 6; unroll{2} 7; unroll{2} 8; unroll{2} 9; unroll{2} 10.
      (rcondt{2} 3; first by move => &m; wp; skip); (rcondt{2} 12; first by move => &m; wp; skip); (rcondt{2} 21; first by move => &m; wp; skip); (rcondt{2} 30; first by move => &m; wp; skip); (rcondt{2} 39; first by move => &m; wp; skip); (rcondt{2} 48; first by move => &m; wp; skip); (rcondt{2} 57; first by move => &m; wp; skip); (rcondt{2} 66; first by move => &m; wp; skip); (rcondf{2} 75; first by move => &m; wp; skip).
  exists* rp{2}; elim* => rp2.
    seq 0 73 : (#[/2:15,16:]pre /\ 
                Glob.mem{1} = iteri i{1} (fun (i2 : int) (mem : global_mem_t) =>
                  storeW8 mem (to_uint (msgp{1} + (of_int i2)%W64)) (iteri 8 (fun (j1 : int) (r3 : W8.t) => 
                    r3 `|` truncateu8 (rp{2}.[8 * i2 + j1] `<<` (of_int j1)%W8)) W8.zero)) mem1 /\ 
                (forall k, 0 <= k < 8 => rp{2}.[8*i{2}+k] = (((((zeroextu32 a{2}.[8 * i{2} + k]) `<<` W8.one) + 
                  W32.of_int 1665) * W32.of_int 80635) `>>` W8.of_int 28) `&` W32.one)).
      wp; skip => /> *; do split.
      rewrite (eq_iteri (fun (i : int) (mem : global_mem_t) => storeW8 mem (to_uint (msgp{2} + (of_int i)%W64)) (iteri 8 (fun (j : int) (r : W8.t) => r `|` truncateu8 (rp{2}.[8 * i + j] `<<` (of_int j)%W8)) W8.zero)) (fun (i2 : int) (mem : global_mem_t) => storeW8 mem (to_uint (msgp{2} + (of_int i2)%W64)) (iteri 8 (fun (j1 : int) (r3 : W8.t) => r3 `|`  truncateu8 (rp{2}.[8 * i{2} <- (((zeroextu32 a{2}.[8 * i{2}] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[8 * i{2} + 1   <- (((zeroextu32 a{2}.[8 * i{2} + 1] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[8 * i{2} + 2 <- (((zeroextu32 a{2}.[8 * i{2} + 2] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[8 * i{2} + 3 <- (((zeroextu32 a{2}.[8 * i{2} + 3] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[8 * i{2} + 4 <- (((zeroextu32 a{2}.[8 * i{2} + 4] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[8 * i{2} + 5 <- (((zeroextu32 a{2}.[8 * i{2} + 5] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[8 * i{2} + 6 <- (((zeroextu32 a{2}.[8 * i{2} + 6] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[8 * i{2} + 7 <- (((zeroextu32 a{2}.[8 * i{2} + 7] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[8 * i2 + j1] `<<` (of_int j1)%W8)) W8.zero)) _ _).
        simplify => *.
        rewrite (eq_iteri (fun (j : int) (r : W8.t) => r `|` truncateu8 (rp{2}.[8 * i2 + j] `<<` (of_int j)%W8)) (fun (j1 : int) (r3 : W8.t) => r3 `|` truncateu8 (rp{2}.[8 * i{2} <- (((zeroextu32 a{2}.[8 * i{2}] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[8 * i{2} + 1 <- (((zeroextu32 a{2}.[8 * i{2} + 1] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`  (of_int 28)%W8) `&` W32.one].[8 * i{2} + 2 <- (((zeroextu32 a{2}.[8 * i{2} + 2] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`  (of_int 28)%W8) `&` W32.one].[8 * i{2} + 3 <- (((zeroextu32 a{2}.[8 * i{2} + 3] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`  (of_int 28)%W8) `&` W32.one].[8 * i{2} + 4 <- (((zeroextu32 a{2}.[8 * i{2} + 4] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`  (of_int 28)%W8) `&` W32.one].[8 * i{2} + 5 <- (((zeroextu32 a{2}.[8 * i{2} + 5] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`  (of_int 28)%W8) `&` W32.one].[8 * i{2} + 6 <- (((zeroextu32 a{2}.[8 * i{2} + 6] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`  (of_int 28)%W8) `&` W32.one].[8 * i{2} + 7 <- (((zeroextu32 a{2}.[8 * i{2} + 7] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`  (of_int 28)%W8) `&` W32.one].[8 * i2 + j1] `<<`            (of_int j1)%W8)) _ _).
          by simplify => *; do 2! congr; rewrite !Array256.set_neqiE 1..16:/#.
          by done.
        by done.
      move => k *.
        rewrite !Array256.get_setE 1..8:/#.
        case (k = 7) => ?; first by rewrite !H4 /=.
        case (k = 6) => ?; first by rewrite !H5 /#.
        case (k = 5) => ?; first by rewrite !H6 /#.
        case (k = 4) => ?; first by rewrite !H7 /#.
        case (k = 3) => ?; first by rewrite !H8 /#.
        case (k = 2) => ?; first by rewrite !H9 /#.
        case (k = 1) => ?; first by rewrite !H10 /#.
        case (k = 0) => ?; first by rewrite !H11 /#.
        by smt().
    wp; skip => /> *; do split.
      by smt().
      by smt().
      (rewrite iteriS; first by done) => /=.
        cut ->: (iteri 8 (fun (j : int) (r : W8.t) => r `|` truncateu8 (rp{2}.[8 * i{2} + j] `<<` (of_int j)%W8)) W8.zero) = (truncateu8 ((((zeroextu32 a{2}.[8 * i{2}] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one `<<` W8.zero) `|` truncateu8 ((((zeroextu32 a{2}.[8 * i{2} + 1] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one `<<` W8.one) `|` truncateu8 ((((zeroextu32 a{2}.[8 * i{2} + 2] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one `<<` (of_int 2)%W8) `|` truncateu8 ((((zeroextu32 a{2}.[8 * i{2} + 3] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one `<<` (of_int 3)%W8) `|` truncateu8 ((((zeroextu32 a{2}.[8 * i{2} + 4] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one `<<` (of_int 4)%W8) `|` truncateu8 ((((zeroextu32 a{2}.[8 * i{2} + 5] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one `<<` (of_int 5)%W8) `|` truncateu8 ((((zeroextu32 a{2}.[8 * i{2} + 6] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one `<<` (of_int 6)%W8) `|` truncateu8 ((((zeroextu32 a{2}.[8 * i{2} + 7] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one `<<` (of_int 7)%W8)).
          rewrite iteri8 /=.
          do 7! (rewrite H2; first by done).
          cut ->: 8 * i{2} = 8 * i{2} + 0 by done.
          rewrite H2; first by done.
          by done. 
        by done.
   wp; skip => /> *; do split.
     by rewrite iteri0.
     by move => *; congr => /#.

sp 0 4; 
while{2} (#[/1:9,10:14,15:]pre /\ 0 <= i0{2} <= 32 /\
            Glob.mem{2} = iteri i0{2} (fun i mem => storeW8 mem (to_uint (msgp{2} + (W64.of_int i))) 
            (iteri 8 (fun j r => r `|` truncateu8 (rp{2}.[8*i+j] `<<` W8.of_int j)) W8.zero)) mem1 ) (32 - i0{2}).
  move => &m z.
  unroll 3; unroll 4; unroll 5; unroll 6; unroll 7; unroll 8; unroll 9; unroll 10.
    (rcondt 3; first by wp; skip); (rcondt 7; first by wp; skip); (rcondt 11; first by wp; skip); (rcondt 15; first by wp; skip); (rcondt 19; first by wp; skip); (rcondt 23; first by wp; skip); (rcondt 27; first by wp; skip); (rcondt 31; first by wp; skip); (rcondf 35; first by wp; skip).
  wp; skip => /> *; do split.
    by smt().
    by smt().
    (rewrite iteriS; first by done) => /=.
      cut ->: (iteri 8 (fun (j : int) (r : W8.t) => r `|` truncateu8 (rp{hr}.[8 * i0{hr} + j] `<<` (of_int j)%W8)) W8.zero) = (truncateu8 (rp{hr}.[8 * i0{hr}] `<<` W8.zero) `|` truncateu8 (rp{hr}.[8 * i0{hr} + 1] `<<` W8.one) `|` truncateu8 (rp{hr}.[8 * i0{hr} + 2] `<<` (of_int 2)%W8) `|` truncateu8 (rp{hr}.[8 * i0{hr} + 3] `<<` (of_int 3)%W8) `|` truncateu8 (rp{hr}.[8 * i0{hr} + 4] `<<` (of_int 4)%W8) `|` truncateu8 (rp{hr}.[8 * i0{hr} + 5] `<<` (of_int 5)%W8) `|` truncateu8 (rp{hr}.[8 * i0{hr} + 6] `<<` (of_int 6)%W8) `|` truncateu8 (rp{hr}.[8 * i0{hr} + 7] `<<` (of_int 7)%W8)).
        by rewrite iteri8 /=.
      by done.
  by smt().

wp; skip => />.
  move => *; do split.
    by rewrite iteri0.
    move => *; do split.
      by smt().
      move => *.
        by congr => /#.
(*********)

inline *; auto => />.

seq 5 1 : (#pre /\ ={ap} /\ (bp = witness){1} /\ (mp = witness){1} /\ (skpv = witness){1} /\ 
            (v = witness){1} /\ (ap = ctp){1}).
by wp; skip.
seq 5 5 : (#pre /\ 
          (forall k, 0 <= k < 768 => r{1}.[k] = 
                                      truncateu16 
                                        (((r{2}.[k] * W32.of_int 3329) + W32.of_int 512) `>>` W8.of_int 10))).
  while (#pre /\ ={i,j} /\ 0 <= to_uint i{1} < 768+3 /\ to_uint i{1} %% 4 = 0 /\ 
          0 <= to_uint j{1} < 960 + 4 /\ to_uint j{1} %% 5 = 0 /\
          to_uint j{1} - to_uint i{1} = to_uint i{1} %/ 4 /\
          (forall k, 0 <= k < to_uint i{1} => r{1}.[k] = 
                                      truncateu16 
                                        (((r{2}.[k] * W32.of_int 3329) + W32.of_int 512) `>>` W8.of_int 10))).
    unroll{1} 2; unroll{1} 3; unroll{1} 4; unroll{1} 5; unroll{1} 6.
      + (rcondt{1} 2; first by move => &m; wp; skip); (rcondt{1} 5; first by move => &m; wp; skip);
        (rcondt{1} 8; first by move => &m; wp; skip); (rcondt{1} 11; first by move => &m; wp; skip);
        (rcondt{1} 14; first by move => &m; wp; skip); (rcondf{1} 17; first by move => &m; wp; skip).
    unroll{2} 2; unroll{2} 3; unroll{2} 4; unroll{2} 5; unroll{2} 6.
      + (rcondt{2} 2; first by move => &m; wp; skip); (rcondt{2} 5; first by move => &m; wp; skip);
        (rcondt{2} 8; first by move => &m; wp; skip); (rcondt{2} 11; first by move => &m; wp; skip);
        (rcondt{2} 14; first by move => &m; wp; skip); (rcondf{2} 17; first by move => &m; wp; skip).
    unroll{1} 36; unroll{1} 37; unroll{1} 38; unroll{1} 39.
      + (rcondt{1} 36; first by move => &m; wp; skip); (rcondt{1} 42; first by move => &m; wp; skip);
        (rcondt{1} 48; first by move => &m; wp; skip); (rcondt{1} 54; first by move => &m; wp; skip);
        (rcondf{1} 60; first by move => &m; wp; skip).
    unroll{2} 36; unroll{2} 37; unroll{2} 38; unroll{2} 39.
      + (rcondt{2} 36; first by move => &m; wp; skip); (rcondt{2} 39; first by move => &m; wp; skip);
        (rcondt{2} 42; first by move => &m; wp; skip); (rcondt{2} 45; first by move => &m; wp; skip);
        (rcondf{2} 48; first by move => &m; wp; skip).
    wp; skip => /> *; do split.
      by rewrite to_uintD_small 1,2:/#.
      by rewrite to_uintD_small // 1:/#; move : H7; rewrite ultE of_uintK pmod_small // /#. 
      by rewrite !to_uintD_small 1,2:/#.
      by rewrite to_uintD_small 1,2:/#.
      by rewrite to_uintD_small 1:/# !of_uintK //; move : H7; rewrite ultE of_uintK pmod_small // /#.
      by rewrite to_uintD_small 1:/# /#.
      by rewrite !to_uintD_small 1,2:/# !of_uintK //; move : H7; rewrite ultE of_uintK pmod_small // /#.
      move => k. rewrite to_uintD_small 1:/#. rewrite of_uintK. simplify => *.
        rewrite !Array768.get_setE.
          by rewrite to_uintD_small 1:/#; move : H7; rewrite ultE of_uintK pmod_small // /#.
          by rewrite to_uintD_small 1:/#; move : H7; rewrite ultE of_uintK pmod_small // /#.
          by rewrite to_uintD_small 1:/#; move : H7; rewrite ultE of_uintK pmod_small // /#.
          by move : H7; rewrite ultE of_uintK pmod_small // /#.
          by rewrite to_uintD_small 1:/#; move : H7; rewrite ultE of_uintK pmod_small // /#.
          by rewrite to_uintD_small 1:/#; move : H7; rewrite ultE of_uintK pmod_small // /#.
          by rewrite to_uintD_small 1:/#; move : H7; rewrite ultE of_uintK pmod_small // /#.
          by move : H7; rewrite ultE of_uintK pmod_small // /#.
        case (k = to_uint (i{2} + (of_int 3)%W64)) => ?; first by done.
        case (k = to_uint (i{2} + (of_int 2)%W64)) => ?; first by done.
        case (k = to_uint (i{2} + (of_int 1)%W64)) => ?; first by done.
        case (k = to_uint (i{2})) => ?; first by done.
        by rewrite H6; move : H10 H11 H12; rewrite !to_uintD_small 1,2,3:/# !of_uintK /= /#.
  wp; skip => />; do split.
    by smt().
    by move => *; rewrite H8; move : H; rewrite ultE of_uintK pmod_small // /#.

seq 4 4 : (#[/1:6,7:10,11:]pre /\ bp{1} = r{1} /\ r1{2} = r{2} /\ ={ctp} /\ ={ap0} /\ 
            (ap0 = ctp){1} /\ ={rp} /\ (rp = witness){1}); first by wp; skip.

seq 2 2 : (#[/1:15]pre /\ 
            (forall k, 0 <= k < 256 =>
              rp{1}.[k] = ((rp{2}.[k] * W16.of_int 3329) + W16.of_int 8) `>>` W8.of_int 4)).
  while (#[/1:15]post /\ ={i0} /\ 0 <= i0{1} <= 128 /\
            (forall k, 0 <= k < i0{1}*2 =>
              rp{1}.[k] = ((rp{2}.[k] * W16.of_int 3329) + W16.of_int 8) `>>` W8.of_int 4)).
    wp; skip => /> *; do split.
      by smt().
      by smt().
      move => k *.
        rewrite !Array256.get_setE. 
          by smt().
          by smt().
          by smt().
          by smt().
          case (k = 2 * i0{2} + 1) => ?; first by done.
          case (k = 2 * i0{2}) => ?; first by done.
          by rewrite H2 1:/#.
  wp; skip => /> *; do split.
    by smt().
    move => *.
      by rewrite H4 1:/#. 

sp 0 4.
seq 0 5 : (#pre /\ r{1} = r0{2}).
  while{2} (#[/1:20]post /\ 0 <= to_uint i1{2} <= 768+3 /\ to_uint i1{2} %% 4 = 0 /\
              (forall k, 0 <= k < to_uint i1{2} => r0{2}.[k] = r{1}.[k])) (768 - to_uint i1{2}).
    move => &m z.
    unroll 2; unroll 3; unroll 4; unroll 5; unroll 6.
      + (rcondt 2; first by wp; skip); (rcondt 5; first by wp; skip);
        (rcondt 8; first by wp; skip); (rcondt 11; first by wp; skip);
        (rcondt 14; first by wp; skip); (rcondf 17; first by wp; skip).
    unroll 18; unroll 19; unroll 20; unroll 21.
      + (rcondt 18; first by wp; skip); (rcondt 24; first by wp; skip);
        (rcondt 30; first by wp; skip); (rcondt 36; first by wp; skip);
        (rcondf 42; first by wp; skip).
    wp; skip => /> *; do split.
      by rewrite to_uintD_small 1,2:/#.
      by rewrite to_uintD_small // 1:/#; move : H5; rewrite ultE of_uintK pmod_small /= /#. 
      by rewrite !to_uintD_small 1,2:/#.
      move => k *.
        rewrite !Array768.get_setE.
          by rewrite to_uintD_small 1:/#; move : H5; rewrite ultE of_uintK pmod_small /= /#.
          by rewrite to_uintD_small 1:/#; move : H5; rewrite ultE of_uintK pmod_small /= /#.
          by rewrite to_uintD_small 1:/#; move : H5; rewrite ultE of_uintK pmod_small /= /#.
          by move : H5; rewrite ultE of_uintK pmod_small /= /#.
          case (k = to_uint (i1{hr} + (of_int 3)%W64)) => ?. 
            rewrite H8 H; first by rewrite to_uintD_small 1:/#; move : H5; rewrite ultE of_uintK pmod_small /= /#.
            by rewrite to_uintD_small 1:/# of_uintK pmod_small /=.
          case (k = to_uint (i1{hr} + (of_int 2)%W64)) => ?. 
            rewrite H9 H; first by rewrite to_uintD_small 1:/#; move : H5; rewrite ultE of_uintK pmod_small /= /#.
            by rewrite to_uintD_small 1:/# of_uintK pmod_small /=.
          case (k = to_uint (i1{hr} + (of_int 1)%W64)) => ?. 
            rewrite H10 H; first by rewrite to_uintD_small 1:/#; move : H5; rewrite ultE of_uintK pmod_small /= /#.
            by rewrite to_uintD_small 1:/# of_uintK pmod_small /=.
          case (k = to_uint (i1{hr})) => ?. 
            rewrite H11 H; first by move : H5; rewrite ultE of_uintK pmod_small /= /#.
            by done.
          by rewrite H4; move : H5 H6 H7 H8 H9 H10; rewrite !to_uintD_small 1,2,3,4,5:/#. 
        by rewrite to_uintD_small 1:/#; move : H5; rewrite ultE of_uintK pmod_small /= /#.
  wp; skip => /> *; do split.
    by smt().
    move => *; do split.
      by move => *; rewrite ultE of_uintK pmod_small /= /#.
      by rewrite ultE of_uintK pmod_small /= // => *; rewrite tP /#.

while{2} (#pre /\ (bp = r0){2} /\ (r3 = r20){2} /\ ={bp} /\ 0 <= i2{2} <= 128 /\
          (forall k, 0 <= k < i2{2}*2 => rp1{2}.[k] = rp{1}.[k])) (128 - i2{2}).
  move => &m z.
  wp; skip => /> *; do split.
    by smt().
    by smt().
    move => k *.
      rewrite !Array256.get_setE.
        by smt().
        by smt().
        case (k = 2 * i2{hr} + 1) => ?; first by rewrite H0 1:/# H7.
        case (k = 2 * i2{hr}) => ?; first by rewrite H0 1:/# H8.
        by rewrite -H3 1:/#.
    by smt().

wp; skip => /> *; do split.
  by smt().
  move => *; do split.
    by smt().
    by move => *; rewrite tP /#.
qed.
