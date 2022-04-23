require import AllCore List Int IntDiv CoreMap Real Number LoopTransform.
from Jasmin require import JWord.
require import Array32 Array64 Array128 Array168 Array256 Array384.
require import Kyber.

(* TODO: prove equivalence w/ EncDec.Dec4 using LoopTransform

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
}.
