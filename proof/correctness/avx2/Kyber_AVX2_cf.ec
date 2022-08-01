require import AllCore List Int IntDiv StdOrder CoreMap Real Number.
import IntOrder.
from Jasmin require import JModel.
require import Array16 Array32 Array64 Array128 Array168 Array256 Array384.
require import Jkem.
require import Kyber.

(* TODO: prove equivalence w/ EncDec reification *)

module EncDec_AVX2 = {
   proc decode12(a : W8.t Array384.t) : ipoly = {
       var i,k;
       var r : ipoly;
       r <- witness;
       i <- 0;

       while (i < 2) {
         k <- 0;

         while (k < 64) {
            r.[128*i + 2*k]  <- to_uint a.[192*i + 3*k] + to_uint a.[192*i + 3*k + 1] %% 2^4 * 2^8;
            r.[128*i + 2*k + 1]  <- to_uint a.[192*i + 3*k + 2] * 2^4 + to_uint a.[192*i + 3*k + 1] %/ 2^4;
            k <- k + 1;
         }
         i <- i + 1;
       }

       return r;
   }

  proc decode12_opt(a : W8.t Array384.t) : ipoly = {

    var i;
    var r : ipoly;
    r <- witness;
    i <- 0;
    while (i < 2) {
      r <- fill (fun k => let b1 = to_uint a.[3 * (k %/ 2) + k %% 2] in
                          let b2 = to_uint a.[3 * (k %/ 2) + k %% 2 + 1] in
                          if (k %% 2 = 0) then b1 + b2 %% 2^4 * 2^8
                          else b2 * 2^4 + b1 %/ 2^4)
                (128 * i) 128 r;

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
      while(j < 8){
        r.[64*i+j*8+0] <- b2i a.[8*i+j].[0];
        r.[64*i+j*8+1] <- b2i a.[8*i+j].[1];
        r.[64*i+j*8+2] <- b2i a.[8*i+j].[2];
        r.[64*i+j*8+3] <- b2i a.[8*i+j].[3];
        r.[64*i+j*8+4] <- b2i a.[8*i+j].[4];
        r.[64*i+j*8+5] <- b2i a.[8*i+j].[5];
        r.[64*i+j*8+6] <- b2i a.[8*i+j].[6];
        r.[64*i+j*8+7] <- b2i a.[8*i+j].[7];
        j <- j + 1;
      }
      i<-i+1;
    }

    return r;
  }

  proc decode1_opt(a : W8.t Array32.t) : ipoly = {
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
      i<-i+1;
    }

    return r;
  }

  proc encode12(a : ipoly) : W8.t Array384.t = {
     var fi1,fi2,i,k;
     var r : W8.t Array384.t;
     r <- witness;
     i <- 0;
     while (i < 2) {
       k <- 0;

       while(k < 64) {
         fi1 <- a.[128*i + 2*k];
         fi2 <- a.[128*i + 2*k + 1];
         r.[192*i+3*k] <- W8.of_int fi1;
         r.[192*i+3*k+1] <- W8.of_int ((fi2 %% 2^4) * 2^4 + fi1 %/ 2^8);
         r.[192*i+3*k+2] <- W8.of_int (fi2 %/ 2^4);
         k <- k + 1;
       }

       i <- i + 1;
     }
     return r;
  }

  proc encode12_opt(a : ipoly) : W8.t Array384.t = {
    var fi1,fi2: int;
    var i;
    var r : W8.t Array384.t;
     r <- witness;
    i <- 0;
    while (i < 2) {

      r <- fill (fun k => let fi1 = a.[128*i + 2 * (k %% 192 %/ 3)] in
                          let fi2 = a.[128*i + 2 * (k %% 192 %/ 3) + 1] in
                          if (k %% 3 = 0) then W8.of_int fi1
                          else if (k %% 3 = 1) then W8.of_int ((fi2 %% 2^4) * 2^4 + fi1 %/ 2^8)
                          else W8.of_int (fi2 %/ 2^4))
                (192*i) 192 r;

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
    rd <- witness;
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

theory AVX2_cf.

equiv eq_encode12:
  EncDec_AVX2.encode12_opt ~ EncDec_AVX2.encode12: ={a} ==> ={res}.
proof.
  proc.
  while (#pre /\ i{1} = i{2} /\ 0 <= i{1} <= 2 /\
         (forall k, 0 <= k < 192 * i{1} => r{1}.[k] = r{2}.[k])).
    unroll for {2} 2.
    wp; skip; auto => />.
    move => &1 &2 [#] i_lb i_ub r1_eq_r2 i_tub />.
    split.
      + move : i_lb i_tub => /#.
      + rewrite (mulzDr 192 _ _) mulz1.
        move => k k_lb k_ub.
        rewrite filliE 1:/# //=.
        rewrite k_ub //=.
        case (k < 192 * i{2}) => k_tub.
          + have -> //=: !(192 * i{2} <= k). move : k_tub => /#.
            rewrite r1_eq_r2; first by rewrite k_lb k_tub.
            do (rewrite Array384.set_neqiE 1:/#; first by move : k_tub k_lb => /#).
            done.
          + move : k_tub => -/lezNgt k_tlb.
            rewrite k_tlb //=.
            do (rewrite Array384.get_setE 1:/#).
            have k_iota: k \in iota_ (192 * i{2}) 192; first by rewrite mem_iota k_ub k_tlb.
            move : k_iota.
            case (k %% 3 = 0) => k_m.
              smt(@Array384 @Int @IntDiv @List).
            case (k %% 3 = 1) => k_m_1.
              smt(@Array384 @Int @IntDiv @List).
            have k_m_2: k %% 3 = 2. move : k_m k_m_1 (modz_cmp k 3) => /#.
              smt(@Array384 @Int @IntDiv @List).
  wp; skip; auto => />.
    move => rL iR rR iR_tlb _ iR_lb iR_ub.
    have -> //=: iR = 2. move : iR_tlb iR_ub => /#.
    apply Array384.ext_eq.
qed.

equiv eq_decode12:
  EncDec_AVX2.decode12_opt ~ EncDec_AVX2.decode12: ={a} ==> ={res}.
proof.
  proc.
  while (#pre /\ i{1} = i{2} /\ 0 <= i{1} <= 2 /\
         (forall k, 0 <= k < 128 * i{1} => r{1}.[k] = r{2}.[k])).
    unroll for {2} 2.
    wp; skip; auto => />.
    move => &1 &2 [#] i_lb i_ub r1_eq_r2 i_tub />.
    split.
      + move : i_lb i_tub => /#.
      + rewrite (mulzDr 128 _ _) mulz1.
        move => k k_lb k_ub.
        rewrite filliE 1:/# //=.
        rewrite k_ub //=.
        case (k < 128 * i{2}) => k_tub.
          + have -> //=: !(128 * i{2} <= k). move : k_tub => /#.
            rewrite r1_eq_r2; first by rewrite k_lb k_tub.
            do (rewrite Array256.set_neqiE 1:/#; first by move : k_tub k_lb => /#).
            done.
          + move : k_tub => -/lezNgt k_tlb.
            rewrite k_tlb //=.
            do (rewrite Array256.get_setE 1:/#).
            have k_iota: k \in iota_ (128 * i{2}) 128; first by rewrite mem_iota k_ub k_tlb.
            move : k_iota.
            case (k %% 2 = 0) => k_m.
              smt(@Array256 @Int @IntDiv @List).
            have k_m_1: k %% 2 = 1. move : k_m (modz_cmp k 2) => /#.
              smt(@Array256 @Int @IntDiv @List).
  wp; skip; auto => />.
    move => rL iR rR iR_tlb _ iR_lb iR_ub.
    have -> //=: iR = 2. move : iR_tlb iR_ub => /#.
    apply Array256.ext_eq.
qed.

equiv eq_decode4:
  EncDec_AVX2.decode4 ~ EncDec.decode4: ={a} ==> ={res}.
proc.
unroll for {1} ^while.
do  16!(unroll for {1} ^while).
unroll for {2} ^while.
by auto => />.
qed.


end AVX2_cf.
 
