require import AllCore List Int IntDiv CoreMap Real Number LoopTransform.
from Jasmin require import JWord.
require import Array16 Array32 Array64 Array128 Array168 Array256 Array384.
require import Jkem.
require import Kyber.

(* TODO: prove equivalence w/ EncDec using LoopTransform

clone import ExactIter as AVX2Wrapper with
    type t <- int * W8.t Array128.t * ipoly,
    op c <- 8,
    op step <- 16
    proof * by done.


n.b: check libjc/proof/crypto_stream/chacha20/ChaCha20_pavx2_cf.ec
*)

module EncDec_AVX2 = {
   proc decode12(a : W8.t Array384.t) : ipoly = {
       var i;
       var r : ipoly;
       r <- witness;
       i <- 0;
       while (i < 128) {
          r.[i*2+0]  <- to_uint a.[3*i] + to_uint a.[3*i+1] %% 2^4 * 2^8;
          r.[i*2+1]  <- to_uint a.[3*i+2] * 2^4 + to_uint a.[3*i+1] %/ 2^4;
          i <- i + 1;
       }
       return r;
   }

   proc decode4(a : W8.t Array128.t) : ipoly = {
       var i, j;
       var r : ipoly;
       r <- witness;
       i <- 0;
       while (i < 16) {
          j <- 0;
          while(j < 8) {
            r.[16*i+2*j+0]  <- to_uint a.[8*i+j] %% 16;
            r.[16*i+2*j+1]  <- to_uint a.[8*i+j] %/ 16;
            j <- j+1;
          }
          i <- i + 1;
       }
       return r;
   }

  proc decode1(a : W8.t Array32.t) : ipoly = {
    var i,j;
    var r : ipoly;
    r <- witness;
    i <- 0;
    while (i < 4) {
      j <- 0;
      while(j < 4) {
        r <- Array256.fill (fun k => b2i a.[k %/ 8].[k %% 8]) (32*i + j*8) 8 r;
        j <- j + 1;
      }

      j <- 0;
      while(j < 4) {
        r <- Array256.fill (fun k => b2i a.[k %/ 8].[k %% 8]) (128 + 32*i + j*8) 8 r;
        j <- j + 1;
      }
      (* TODO: prove equivalence ??
      while(j < 8){
        r.[64*i+j*8+0] <- b2i a.[8*i+j].[0];
        r.[64*i+j*8+1] <- b2i a.[8*i+j].[1];
        r.[64*i+j*8+2] <- b2i a.[8*i+j].[2];
        r.[64*i+j*8+3] <- b2i a.[8*i+j].[3];
        r.[64*i+j*8+4] <- b2i a.[8*i+j].[4];
        r.[64*i+j*8+5] <- b2i a.[8*i+j].[5];
        r.[64*i+j*8+6] <- b2i a.[8*i+j].[6];
        r.[64*i+j*8+7] <- b2i a.[8*i+j].[7];
      }
      *)
      i<-i+1;
    }

    return r;
  }

  proc encode12(a : ipoly) : W8.t Array384.t = {
     var fi1,fi2,i,k;
     var r : W8.t Array384.t;

     i <- 0;
     while (i < 2) {
       k <- 0;

       while(k < 64) {
         fi1 <- a.[128*i + k];
         fi2 <- a.[128*i + k + 1];
         r.[192*i+3*k] <- W8.of_int fi1;
         r.[192*i+3*k+1] <- W8.of_int ((fi2 %% 2^4) * 2^4 + fi1 %/ 2^8);
         r.[192*i+3*k+2] <- W8.of_int (fi2 %/ 2^4);
         k <- k + 2;
       }

       i <- i + 1;
     }
     return r;
  }

   proc encode4(p : ipoly) : W8.t Array128.t = {
       var fi,fi1,i,k;
       var r : W8.t Array128.t;

       r <- witness;
       i <- 0;

       while (i < 4) {
         k <- 0;
         while(k < 32) {
          fi <- p.[64*i+2*k];
          fi1 <- p.[64*i+2*k+1];

          r.[32*i+k] <- W8.of_int (fi + fi1 * 2^4);

          k <- k + 1;
         }

         i <- i + 1;
       }

       return r;
   }

  proc encode1(a : ipoly) : W8.t Array32.t = {
    var i,k,r;
    var ra : W8.t Array32.t;
    ra <- witness;
    i <- 0;
    while (i < 8) {
      k <- 0;
      (* TODO: rewrite as fill ?? *)
      while(k < 4) {
          r <- W8.init(fun j => W8.int_bit a.[32*i+8*k+j] 0);
          ra.[4*i+k] <- r;
          k <- k + 1;
      }
      i <- i + 1;
    }
    return ra;      
  }



}.

module Kyber_AVX2_cf = {
  proc __fqmul_x16 (a b: W16.t Array16.t) : W16.t Array16.t = {
    var i;
    var t: W16.t;
    var rd:W16.t Array16.t;

    i <- 0;
    while(i < 16) {
      t <@ M.__fqmul(a.[i], b.[i]);
      rd.[i] <- t;
      i <- i + 1;
    }

    return (rd);
  }

  proc __red_x16 (r: W16.t Array16.t) : W16.t Array16.t = {
    var i;
    var t: W16.t;

    i <- 0;
    while(i < 16) {
      t <@ M.__barrett_reduce(r.[i]);
      r.[i] <- t;
      i <- i + 1;
    }

    return (r);
  }
}.
