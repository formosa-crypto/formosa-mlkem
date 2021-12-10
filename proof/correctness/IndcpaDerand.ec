require import AllCore List IntDiv CoreMap.
from Jasmin require import JModel.

require import Array4 Array5 Array24 Array25 Array32 Array33 Array34 Array64
               Array128 Array168 Array256 Array768.
require import WArray20 WArray32 WArray33 WArray34 WArray40 WArray64
               WArray128 WArray168 WArray192 WArray200 WArray256 WArray512
               WArray1536.

require import Jindcpa.

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

  proc aux_inner_prod(ai skpv : W16.t Array768.t) : W16.t Array256.t = {
    var polyi;
    polyi <@ polyvec_pointwise_acc (ai, skpv);
    polyi <@ poly_frommont (polyi);
    return polyi;
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
    poly0 <@ aux_inner_prod(a0,skpv);
    poly1 <@ aux_inner_prod(a1,skpv);
    poly2 <@ aux_inner_prod(a2,skpv);
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
inline Mderand.indcpa_keypair_expandseed Mderand.indcpa_keypair_compute Mderand.aux_inner_prod. 
swap {1} [22..23] 14.
by sim; auto => />.
qed.

lemma iteri_fold (f : int -> 'b -> 'b) (z : 'b) (r : int) :
  0 <= r =>
  iteri r f z = foldl (fun acc i => f i acc) z (range 0 r).
proof.
  elim r; first by rewrite iteri0  /range  /=; smt(@List).
  move => n hn hrec.
    rewrite iteriS /= /range; first by smt().
    auto => /=;rewrite  iotaSr; first by smt(). 
    have ->: rcons (iota_ 0 n) n = iota_ 0 n ++ [n] by smt(@List).
  by rewrite foldl_cat /= hrec /range /=.
qed.

lemma truncateu8_16K_W32 (a : W32.t) : truncateu8 a = truncateu8 (truncateu16 a).
proof.
 by rewrite W8.to_uint_eq !to_uint_truncateu8 to_uint_truncateu16 modz_dvd_pow.
qed.

lemma truncateu8_16K_W64 (a : W64.t) : truncateu8 a = truncateu8 (truncateu16 a).
proof.
 by rewrite W8.to_uint_eq !to_uint_truncateu8 to_uint_truncateu16 modz_dvd_pow.
qed.

lemma truncateu16_shl (a : W32.t) : truncateu16 (a `<<` (W8.of_int 4)) = 
                                    truncateu16 a `<<` (W8.of_int 4).
proof. 
rewrite !shl_shlw /= /truncateu16; first 2 by smt(). 
rewrite to_uint_shl; first by smt(). 
rewrite shlMP; first by smt(). 
rewrite !of_intE modz_dvd_pow => /#.
qed.

lemma truncateu16E_U16 (a : W32.t) k : 0 <= k < 16 => (truncateu16 (a)).[k] = a.[k].
proof.
  move => ?.
  rewrite get_to_uint /truncateu16 of_intE get_bits2w /=; first by smt(). 
  rewrite /BitEncoding.BS2Int.int2bs nth_mkseq /=; first by smt(). 
  have ->: 0 <= k < 32 by smt().
  have ->: 65536 = 2^16 by done.
  by rewrite modz_pow2_div 1:/# /= (modz_dvd_pow 1 (16 - k)) 1:/#.
qed.

lemma truncateu16E_U16_W64 (a : W64.t) k : 0 <= k < 16 => (truncateu16 (a)).[k] = a.[k].
proof.
  move => ?.
  rewrite get_to_uint /truncateu16 of_intE get_bits2w /=; first by smt(). 
  rewrite /BitEncoding.BS2Int.int2bs nth_mkseq /=; first by smt(). 
  have ->: 0 <= k < 64 by smt().
  have ->: 65536 = 2^16 by done.
  by rewrite modz_pow2_div 1:/# /= (modz_dvd_pow 1 (16 - k)) 1:/#.
qed.

lemma truncateu16_orw_distr (a b : W32.t) : truncateu16 a `|` truncateu16 b = truncateu16 (a `|` b).
proof. by rewrite wordP => *; rewrite !orwE !truncateu16E_U16 => /#. qed.

lemma truncateu8_truncate16_shr (a : W64.t) : 
  truncateu8 (a `>>` (W8.of_int 2)) = truncateu8 (truncateu16 a `>>` (W8.of_int 2)).
proof.
  rewrite wordP => i H.
  rewrite /truncateu8 !of_intwE H /= /int_bit to_uint_shr 1:/# to_uint_shr 1:/# !of_uintK /=.
  have ->: 4 = 2^2 by done.
  have ->: 256 = 2^8 by done.
  have ->: 65536 = 2^16 by done.
  rewrite (modz_pow2_div 16 2 (to_uint a)) /=; first by smt().
  have ->: to_uint a %/ 4 %% 16384 %% 256 = to_uint a %/ 4 %% 256.
    pose x := to_uint a %/ 4.
    have ->: 16384 = 2^14 by done.
    have ->: 256 = 2^8 by done.
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
seq 2 0 : (#pre); first by auto. 
(***********************)
seq 52 53 : (={Glob.mem,bp,v,ctp} /\ sctp{1} = ctp{2}).
+ sim.
  seq 36 29 : (={Glob.mem,ctp,msgp,poly0,poly1,poly2,publicseed,noiseseed,pkpv} /\ 
               epp{1} = epp0{2} /\ ep{1} = ep0{2} /\ sp_0{1} = sp_00{2}  /\ sctp{1} = ctp{2}).
  + swap{2} 1 3.
    swap{2} [10..13] -6.
    by sim; auto => />; sim.
  inline*.
  sp 0 1.
  seq 4 4 : (#pre /\
            (forall k, 0 <= k < 256 => rp{1}.[k] = rp{2}.[k] * W16.of_int ((3329 + 1) %/ 2))).
  + while (#pre /\ 0 <= i0{1} <= 32 /\ i0{1} = i1{2} /\ ={ap} /\
          (forall k, 0 <= k < i0{1} * 8 => rp{1}.[k] = rp{2}.[k] * W16.of_int ((3329 + 1) %/ 2))).
    + wp; skip => /> *; smt(Array256.get_setE).
    by auto => /> /#. 
  sp 0 8; wp.
  while{2} (#pre /\ 0 <= i2{2} <= 32 /\
          (forall k, 0 <= k < i2{2} * 8 => rp{1}.[k] = rp0{2}.[k])) (32 - i2{2}).
  + by move => *; wp; skip => />; smt(Array256.get_setE).
  wp; skip => /> *. 
  split; 1: smt().
  move=> *; split; 1:smt().
  smt (Array256.tP).
inline *; auto => />.

seq 15 12 : (#pre /\ ={a,t,pv} /\ rp{1} = ctp{1} /\ aa{1} = witness /\ i0{1} = i1{2} /\ r{2} = witness /\
              i0{1} = W64.zero /\ j{1} = W64.zero /\ r{1} = r5{2} /\ r0{1} = r00{2} /\ r1{1} = r11{2} /\
              r2{1} = r21{2} /\ r00{1} = r01{2} /\ r10{1} = r12{2} /\ r20{1} = r22{2}).  
+ by wp; skip => />.

seq 33 33  : (#pre /\ = {rp2, rp3, rp4, p0, p1, p2} /\ r2{1} = r21{2} /\ r3{1} = r6{2}).
+ by sim />.
exlim (Glob.mem{1}) => mem1.
pose f := fun ctp1 (r2 aa2:W16.t Array768.t) (k : int) (mem : global_mem_t) =>
     if k %% 4 = 0 then 
        storeW8 mem (to_uint (ctp1 + W64.of_int (k + k %/ 4))) 
                     (truncateu8 (r2.[k] `&` W16.of_int 255))
            else if k %% 4 = 1 then
                              storeW8 mem (to_uint (ctp1 + W64.of_int (k + k %/ 4))) 
                                (truncateu8 ((r2.[k] `<<` W8.of_int 2) `|` (r2.[k - 1] `>>` W8.of_int 8)))
                            else if k %% 4 = 2 then
                              storeW8 mem (to_uint (ctp1 + W64.of_int (k + k %/ 4))) 
                                (truncateu8 ((r2.[k] `<<` W8.of_int 4) `|` (r2.[k - 1] `>>` W8.of_int 6)))
                            else
                              storeW8 (storeW8 mem (to_uint (ctp1 + W64.of_int (k + k %/ 4))) 
                              (truncateu8 ((r2.[k] `<<` W8.of_int 6) `|` (r2.[k - 1] `>>` W8.of_int 4)))) 
                              (to_uint (ctp1 + W64.of_int ((k + k %/ 4) + 1))) 
                              (truncateu8 (((((((zeroextu64 aa2.[k]) `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023) `>>` W8.of_int 2)).

seq 3 3 : ((* #[/3:7,8:10,15:]pre *)
              #[/3:8,9:11,12:13,16:]pre
              /\ ={aa} /\ Glob.mem{2} = mem1 /\ 
            (forall k, 0 <= k < 768 => r{2}.[k] = truncateu16 ((((((zeroextu64 aa{2}.[k]) `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023)) /\
            Glob.mem{1} = iteri 768 (f ctp{1} r{2} aa{2}) mem1).
+ while (#[/1:26]post /\ i0{1} = i1{2} /\ 0 <= to_uint i1{2} <= 768 + 3 /\ to_uint i1{2} %% 4 = 0 /\
          0 <= to_uint j{1} <= 964 /\ (to_uint j{1} %% 5 = 0) /\ 
          (to_uint j{1} - to_uint i1{2} = to_uint i1{2} %/ 4) /\ 
          (forall k, 0 <= k < to_uint i1{2} => r{2}.[k] = truncateu16 ((((((zeroextu64 aa{2}.[k]) `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023)) /\
          Glob.mem{1} = iteri (to_uint i0{1}) (f ctp{1} r{2} aa{2}) mem1).
  + exlim i0{1} => i0'.
    seq 2 2 : (to_uint i0{1} = to_uint i0' + 4 /\ #[/2:32]pre /\ ={t,k0} /\ k0{2} = 4 /\
              0 <= to_uint j{1} <= 964 /\ (to_uint j{1} %% 5 = 0) /\ 
              to_uint j{1} - to_uint i0' = to_uint i0' %/ 4 /\
              (i0{1} \ult (W64.of_int 768) <=> i1{2} \ult (W64.of_int 768)) /\
              (forall k, 0 <= k < k0 => t.[k] = 
                ((((zeroextu64 aa{2}.[to_uint i0' + k] `<<` W8.of_int 10) + W64.of_int 1665) * 
                  W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023){2} /\
              (forall k, 0 <= k < to_uint i0' => r{2}.[k] = 
                      truncateu16 ((((((zeroextu64 aa{2}.[k]) `<<` W8.of_int 10) + W64.of_int 1665) * W64.of_int 1290167) `>>` W8.of_int 32) `&` W64.of_int 1023)) /\
              Glob.mem{1} = iteri (to_uint i0') (f ctp{1} r{2} aa{2}) mem1).
    + unroll for{1} ^while; unroll for{2} ^while.
      wp; skip => /> 10?; rewrite ultE of_uintK pmod_small /= 1:// => ?.
      rewrite to_uintD_small /= 1:/#.
      by rewrite Array4.tP !to_uintD_small /=; smt (Array4.get_setE).
    wp; skip => /> &1 &2  -> *; rewrite to_uintD_small /= 1:/#.
    rewrite 2!andbA; split; 1:smt().
    split; 1: smt(Array768.get_setE).
    have hmod : forall i1, 0 <= i1 < 4 => (to_uint i0' + i1) %% 4 = i1 by smt().
    have hdiv : forall i1, 0 <= i1 < 4 => 
      W64.of_int (to_uint i0' + i1 + (to_uint i0' + i1) %/ 4 + 1) = j{1} + W64.of_int (i1 + 1).
    + move=> i1 hi1.
      have -> : to_uint i0' + i1 + (to_uint i0' + i1) %/ 4 + 1 = 
                to_uint j{1} + (i1 + 1) by smt().
      by rewrite W64.of_intD W64.to_uintK'.
    rewrite (iteri_red (to_uint i0' + 4)) 1: #smt(W64.to_uint_cmp) /= {2}/f hmod 1:// /=.
    congr; 2,3:smt().
    congr; 2,3:smt(Array768.get_setE).
    rewrite (iteri_red (to_uint i0' + 3)) 1:#smt(W64.to_uint_cmp) /= {2}/f hmod 1:// /=.
    congr; 2,3:smt(Array768.get_setE).
    rewrite (iteri_red (to_uint i0' + 2)) 1:#smt(W64.to_uint_cmp) /= {2}/f hmod 1:// /=.
    congr; 2,3:smt(Array768.get_setE).
    rewrite (iteri_red (to_uint i0' + 1)) 1:#smt(W64.to_uint_cmp) /= {2}/f (hmod 0) 1:// /=.
    congr; 2,3: smt(W64.to_uintK' Array768.get_setE).
    by apply eq_iteri; smt (Array768.get_setE).

  wp; skip => /> *; rewrite iteri0 1:// /=.
  split; 1: smt().
  by move=> 3?; rewrite ultE /=; smt().

exlim ctp{1} => ctp1.
seq 4 3 : (#[/2,3,6,7,9:28]pre /\ ctp{2} = ctp1 /\ 
            (ctp = ctp1 + (W64.of_int (3*320))){1} /\ (rp0 = ctp){1} /\ r10{2} = r{2} /\ ={a0,rp1} /\ 
            Glob.mem{1} = iteri 768 (f ctp1 r{2} aa{2}) mem1); 1: by auto.
seq 2 2 : (#pre); 1: by sim />.
seq 1 2 : (#pre /\ ={a0} /\ (r0 = witness){2}); 1: by wp; skip.
exlim Glob.mem{1} => mem1'.
seq 0 0 : (#[/1,2:30,31,32]pre /\ mem1' = iteri 768 (f ctp1 r{2} aa{2}) mem1).
  by skip => />. (* no #pre on conseq *)
pose g := fun ctp1 (r02: W16.t Array256.t) k mem => storeW8 mem (to_uint (ctp1 + W64.of_int k))
                            (truncateu8 (r02.[k*2] `|` (r02.[k*2+1] `<<` W8.of_int 4))).
seq 3 2 : (#[/2:30,31:]pre /\ Glob.mem{1} = iteri 128 (g ctp{1} r0{2}) mem1').
+ while (#[/1:31]post /\ i2{2}=to_uint  i1{1}  /\ 0 <= to_uint i1{1} <= 128 /\ 
          Glob.mem{1} = iteri (to_uint i1{1}) (g ctp{1} r0{2}) mem1' /\ to_uint j0{1} = 2*to_uint i1{1}).
  + wp; skip => /> &1 &2 *.
    rewrite W64.ultE W64.to_uintD_small /= 1:/#.
    split; 1: smt().
    split; 2: by rewrite to_uintD_small /= /#.
    rewrite iteriS 1:// {2}/g W64.to_uintK'.
    congr.
    + by apply eq_iteri; smt (Array256.get_setE).
    rewrite Array256.get_setE 1:/#.
    have -> /= : to_uint i1{1} * 2 <> 2 * to_uint i1{1} + 1 by smt().
    rewrite Array256.get_setE 1:/# mulzC /=.
    rewrite  Array256.get_setE 1:/# /=.
    rewrite -truncateu16_shl truncateu16_orw_distr truncateu8_16K_W32. 
    by rewrite to_uintD_small /= /#.
  by wp; skip; smt (iteri0).
seq 0 5 : (#pre /\ r20{2} = r0{2} /\ r1{2} = r10{2} /\ r2{2} = r20{2} /\ 
            rp{2} = ctp{2} /\ r3{2} = r1{2} /\ t1{2} = witness); 1: by auto. 

seq 0 3 : (#[/1:22,23:37]pre /\ Glob.mem{2} = mem1').
+ pose h :=
   fun (r2: W16.t Array768.t) k mem =>
      if k %% 4 = 0 then 
         storeW8 mem (to_uint (ctp1 + W64.of_int (k + k %/ 4))) 
           (truncateu8 (r2.[k] `&` W16.of_int 255))
       else if k %% 4 = 1 then
         storeW8 mem (to_uint (ctp1 + W64.of_int (k + k %/ 4))) 
           (truncateu8 ((r2.[k] `<<` W8.of_int 2) `|` (r2.[k - 1] `>>` W8.of_int 8)))
       else if k %% 4 = 2 then
         storeW8 mem (to_uint (ctp1 + W64.of_int (k + k %/ 4))) 
           (truncateu8 ((r2.[k] `<<` W8.of_int 4) `|` (r2.[k - 1] `>>` W8.of_int 6)))
       else
         storeW8
         (storeW8 mem (to_uint (ctp1 + (of_int (k + k %/ 4))%W64))
            (truncateu8 ((r2.[k] `<<` (of_int 6)%W8) `|` (r2.[k - 1] `>>` (of_int 4)%W8))))
         (to_uint (ctp1 + (of_int (k + k %/ 4 + 1))%W64))
         (truncateu8 (r2.[k] `>>` (of_int 2)%W8)).
  while{2} (#[/1:36]post /\ 0 <= to_uint i3{2} <= 768 + 3 /\ to_uint i3{2} %% 4 = 0 /\
          0 <= to_uint j{2} <= 964 /\ (to_uint j{2} %% 5 = 0) /\ 
          (to_uint j{2} - to_uint i3{2} = to_uint i3{2} %/ 4) /\ 
          Glob.mem{2} = iteri (to_uint i3{2}) (h r{2}) mem1) (768 - to_uint i3{2}).
  + move => &m z.
    unroll for ^while.
    wp; skip => /> &hr; rewrite ultE /= => 3? hmod0 *.
    rewrite to_uintD_small /= 1:/#.
    rewrite to_uintD_small /= 1:/#.
    rewrite andbC 6!andbA; split; 1: smt().
    have hmod : forall i1, 0 <= i1 < 4 => (to_uint i3{hr} + i1) %% 4 = i1 by smt().
    have hdiv : forall i1, 0 <= i1 < 4 => 
        W64.of_int (to_uint i3{hr} + i1 + (to_uint i3{hr} + i1) %/ 4 + 1) = j{hr} + W64.of_int (i1 + 1).
    + move=> i1 hi1.
      have -> : to_uint i3{hr} + i1 + (to_uint i3{hr} + i1) %/ 4 + 1 = 
                  to_uint j{hr} + (i1 + 1) by smt().
      by rewrite W64.of_intD W64.to_uintK'.
    have heq : forall z, 0 <= z < 4 => to_uint (i3{hr} + W64.of_int z) = to_uint i3{hr} + z.
    + by move=> *; rewrite to_uintD_small //= W64.to_uint_small /= /#. 
    rewrite !heq //.
    rewrite (iteri_red (to_uint i3{hr} + 4)) 1:#smt(W64.to_uint_cmp) /= {2}/h hmod 1:// /=.
    congr; 2:smt ().
    rewrite (iteri_red (to_uint i3{hr} + 3)) 1:#smt(W64.to_uint_cmp) /= {2}/h hmod 1:// /=.
    congr; 2:smt ().
    rewrite (iteri_red (to_uint i3{hr} + 2)) 1:#smt(W64.to_uint_cmp) /= {2}/h hmod 1:// /=.
    congr; 2:smt ().
    rewrite (iteri_red (to_uint i3{hr} + 1)) 1:#smt(W64.to_uint_cmp) /= {2}/h hmod0 /=.
    smt(W64.to_uintK).
  wp; skip => /> &2 hr; split.
  + rewrite iteri0 /= /#.
  move=> i3_R j_R; rewrite ultE /=; split; 1: by smt().
  move=> *; have ->: to_uint i3_R = 768 by smt().
  apply eq_iteri => *; rewrite /h /f; do congr.
  by rewrite hr 1:// truncateu8_truncate16_shr.
      
while{2} ( 0 <= i4{2} <= 128 /\ Glob.mem{2} = iteri i4{2} (g rp0{2} r4{2}) mem1') (128 - i4{2}).
+ by move=> *; wp; skip => /> *; smt(iteriS).
wp; skip => />; smt (iteri0).
qed.

lemma iteri8 (f : int -> 'a -> 'a) (st : 'a) :
  iteri 8 f st = f 7 (f 6 (f 5 (f 4 (f 3 (f 2 (f 1 (f 0 st))))))).
proof.
  have ->: 8 = 0+1+1+1+1+1+1+1+1 by done.
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
+ seq 7 8 : (#pre /\ ={mp}); 1: by sim.
  inline*.
  seq 5 5 : 
    (={Glob.mem, msgp, skp, bp, v, mp, a} /\ rp{1} = msgp{1} /\ rp0{1} = rp1{2}).
  + by sp; sim />.
  swap{2} 3-1.
  seq 1 2 : (#pre); 1: by auto.
  exlim Glob.mem{1} => mem1.
  seq 2 2 : (#[/3:10]pre /\ Glob.mem{2} = mem1 /\
              Glob.mem{1} = iteri 32 (fun i mem => storeW8 mem (to_uint (msgp{1} + (W64.of_int i))) 
                              (iteri 8 (fun j r => r `|` truncateu8 (rp{2}.[8*i+j] `<<` W8.of_int j)) W8.zero)) mem1).
  + while (#[/1:8]post /\ ={i} /\ 0 <= i{1} <= 32 /\
            Glob.mem{1} = 
              iteri i{1} (fun i mem => storeW8 mem (to_uint (msgp{1} + (W64.of_int i))) 
                (iteri 8 (fun j r => r `|` truncateu8 (rp{2}.[8*i+j] `<<` W8.of_int j)) W8.zero)) mem1).
    + wp.
      exlim rp{2} => rp2.
      while (={a,j,i} /\ 0 <= j{1} <= 8 /\ 0 <= i{1} < 32 /\ 
              (forall k, 0 <= k < 8 * i{1} => rp{2}.[k] = rp2.[k]) /\
              r{1} = iteri j{1} (fun j r => r `|` truncateu8 (rp{2}.[8*i{1}+j] `<<` W8.of_int j)) W8.zero).
      + wp; skip => /> &2 *.
        rewrite andbA; split; 1: smt( Array256.get_setE).
        rewrite iteriS 1:// /=.
        by congr; 1: apply eq_iteri => * /=; smt( Array256.get_setE).
      wp; skip => /> &2 *.
      rewrite iteri0 1:// /= => *; split; 1: smt().
      rewrite iteriS 1:// /=; smt (eq_iteri).
    wp; skip => /> &2 *. 
    rewrite iteri0 1:// /= => i_R *.
    by have -> : i_R = 32 by smt(). 
  while{2} (Glob.mem{2} = 
              iteri i0{2} (fun i mem => storeW8 mem (to_uint (rp0{2} + (W64.of_int i))) 
                (iteri 8 (fun j r => r `|` truncateu8 (a0{2}.[8*i+j] `<<` W8.of_int j)) W8.zero)) mem1 /\
           0 <= i0{2} <= 32)  (32 - i0{2}).
  + move=> _ z; wp.
    while (r0 = iteri j0 (fun j r => r `|` truncateu8 (a0.[8*i0+j] `<<` W8.of_int j)) W8.zero /\ 0 <= j0 <= 8)
          (8 - j0).
    + by move=> z0; wp; skip => />; smt (iteriS).  
    wp; skip => />. 
      move => *. do split. smt(iteri0).
         move => *. do split. smt().
         move => *. do split. rewrite iteriS. smt().
           simplify; congr; smt(). smt(). smt(). smt().
         
  wp; skip => /> &2. 
  rewrite iteri0 1:// /= => i0_R; split => *; 1:smt().
  by have -> : i0_R = 32 by smt().  

seq 4 0 : #pre; first by auto => />.
inline *; auto.

seq 6 6 : (#pre /\ ={ap} /\ (ap = ctp){1} /\
          (forall k, 0 <= k < 768 => r{1}.[k] = 
                                      truncateu16 
                                        (((r{2}.[k] * W32.of_int 3329) + W32.of_int 512) `>>` W8.of_int 10))).
  while (#pre /\ ={ap} /\ (ap = ctp){1} /\ ={i,j} /\ 0 <= to_uint i{1} < 768+3 /\ to_uint i{1} %% 4 = 0 /\ 
          0 <= to_uint j{1} < 960 + 4 /\ to_uint j{1} %% 5 = 0 /\
          to_uint j{1} - to_uint i{1} = to_uint i{1} %/ 4 /\
          (forall k, 0 <= k < to_uint i{1} => r{1}.[k] = 
                                      truncateu16 
                                        (((r{2}.[k] * W32.of_int 3329) + W32.of_int 512) `>>` W8.of_int 10))).
  + seq 20 20 : (#{/ ~to_uint j{1} - to_uint i{1} = _}pre /\ ={t0} /\ 
                 to_uint j{1} -5 - to_uint i{1} = to_uint i{1} %/ 4 ).
    + conseq />; wp => /=.
      exlim (to_uint j{1}) => j0.
      conseq (_: ={t0, j}  /\  to_uint j{1} = j0 + 5).
      + by move=> /> &1 &2; rewrite ultE /= /#.
      while (={j, k, Glob.mem, ap} /\ (0 <= j0 && j0 < 964) /\  to_uint j{1} = j0 + k{1} /\ 0 <= k{1} <= 5 /\
              forall z, 0 <= z < k{1} => t0{1}.[z] = t0{2}.[z] ).
      + wp; skip => /> &1 *; rewrite to_uintD_small /= 1:/#.
        smt (Array5.get_setE).
      wp; skip => /> &1 &2 *; split; 1: smt().
      by move=> *; split; 1: apply Array5.tP; smt().
    exlim (to_uint i{1}) => i0.
    while (={k, i} /\ 0 <= k{1} <= 4 /\ to_uint i{1} = i0 + k{1} /\ 0 <= i0 < 768 - 3 /\
           (forall z, k{1} <= z < 4 => t0{1}.[z] = t0{2}.[z]) /\
           (forall (k1 : int), 0 <= k1 && k1 < to_uint i{1} =>
             r{1}.[k1] = truncateu16 (r{2}.[k1] * (of_int 3329)%W32 + (of_int 512)%W32 `>>` (of_int 10)%W8))).
    + wp; skip => /> &1 &2 *.
      by rewrite to_uintD_small /= 1:/#;smt(Array768.get_setE Array5.get_setE).
    by wp; skip => /> &1 &2; rewrite ultE /#.
  wp; skip => />; split; 1: smt().
  by move=> 4?; rewrite ultE /= /#.

seq 7 6 : (#{/~ap{1} = ctp{1}}pre /\ bp{1} = r{1} /\ r1{2} = r{2} /\ ={ctp} /\ ={ap0} /\ 
            (ap0 = ctp){1} /\
           (forall k, 0 <= k < 256 =>
              rp{1}.[k] = ((rp{2}.[k] * W16.of_int 3329) + W16.of_int 8) `>>` W8.of_int 4)).
  while (#[/1:12]post /\ to_uint i0{1} = i0{2} /\ 0 <= to_uint i0{1} <= 128 /\
            (forall k, 0 <= k < to_uint  i0{1}*2 =>
              rp{1}.[k] = ((rp{2}.[k] * W16.of_int 3329) + W16.of_int 8) `>>` W8.of_int 4) /\
              to_uint j0{1} = 2*to_uint i0{1}).
    wp; skip => /> &1 &2; rewrite !ultE /= => *.
    rewrite to_uintD_small /= 1:/#.
    by rewrite !(W64.to_uintD_small j0{1}) /= 1,2:/#; smt(Array256.get_setE).
  by wp; skip => /> /#.
conseq (:(forall z, 0 <= z < 768 => r{1}.[z] = bp{2}.[z]) /\
         (forall z, 0 <= z < 256 => rp{1}.[z] = rp1{2}.[z])).
+ by move=> /> *; split; [apply Array768.tP | apply Array256.tP].
while{2} (0 <= i2{2} <= 128 /\
            (forall k, 0 <= k < i2{2}*2 =>
              rp1{2}.[k] = ((r3{2}.[k] * W16.of_int 3329) + W16.of_int 8) `>>` W8.of_int 4))
         (128 - i2{2}).
+ by move=> _ z; wp; skip => />; smt(Array256.get_setE).
wp.
while{2} (0 <= to_uint i1{2} <= 768 + 3 /\
          to_uint i1{2} %% 4 = 0 /\
         (forall k, 0 <= k < to_uint i1{2} => 
           r0{2}.[k] = truncateu16 (rp0{2}.[k] * (of_int 3329)%W32 + (of_int 512)%W32 `>>` (of_int 10)%W8)))
     (768 - to_uint i1{2}).
+ move=> &1 z.
  exlim (to_uint i1) => i1'.
  while (0 <= k0 <= 4 /\ to_uint i1 = i1' + k0 /\ 0 <= i1' < 768 - 3 /\
         (forall z, k0 <= z < 5 => t2.[z] = rp0.[ i1' + z]) /\
         (forall z, 0 <= z < to_uint i1 => 
           r0.[z] = truncateu16 (rp0.[z] * (of_int 3329)%W32 + (of_int 512)%W32 `>>` (of_int 10)%W8)))
      (4 - k0).
  + move=> z0; wp; skip => /> &hr *.
    by rewrite to_uintD_small /= 1:/#; smt(Array768.get_setE Array5.get_setE).
  wp; while (0 <= k0 <= 5 /\ forall z, 0 <= z < k0 => t2.[z] = rp0.[to_uint i1 + z])
      (5 - k0).
  + by move=> z0; wp; skip => />; smt(Array5.get_setE).
  by wp; skip => /> &hr; rewrite !ultE /= /#.

wp; skip => /> &1 &2 *; split; 1: smt().
by move=> 2?; rewrite !ultE /= => *; smt().
qed.
