require import AllCore List Int IntDiv CoreMap Real Number LoopTransform.
from Jasmin require import JWord.
require import Array32 Array64 Array128 Array168 Array256 Array384.
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
   proc body_decode4(t: W8.t Array128.t * ipoly, i: int): ipoly = {
     var r, a;
     (a, r) <- t;

     (* r.[8*i+2*j+0]  <- to_uint a.[8*i+j] %% 16; *)
     (* r.[8*i+2*j+1]  <- to_uint a.[8*i+j] %/ 16; *)

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
}.
