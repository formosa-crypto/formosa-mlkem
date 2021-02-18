require import AllCore IntDiv Array256 Array128.
require import List Ring StdOrder Fq.

import Fq IntOrder.
theory NTT_Fq.

import Kyber_.
import ZModField.
import BitEncoding.BS2Int.

(* These are imperative specifications of the  NTT algorithms  *)

module NTT = {
 proc ntt(r : zmod Array256.t,  zetas : zmod Array128.t) : zmod Array256.t = {
   var len, start, j, zetasctr;
   var  t, zeta_;

   zetasctr <- 0;
   len <- 128;
   while (2 <= len) {
    start <- 0;
    while(start < 256) {
       zetasctr <- zetasctr + 1;
       zeta_ <- zetas.[zetasctr]; 
       j <- start;
       while (j < start + len) {
         t <- zeta_ * r.[j + len];
         r.[j + len] <- r.[j] + (-t);
         r.[j]       <- r.[j] + t;
         j <- j + 1;
       }
       start <- j + len;
     }
     len <- len %/ 2;
   }     
   return r;
 }

 proc invntt(r : zmod Array256.t, zetas_inv : zmod Array128.t) : zmod Array256.t = {
   var len, start, j, zetasctr;
   var  t, zeta_;

   zetasctr <- 0;
   len <- 2;
   while (len <= 128) {
    start <- 0;
    while(start < 256) {
       zeta_ <- zetas_inv.[zetasctr]; 
       zetasctr <- zetasctr + 1;
       j <- start;
       while (j < start + len) {
        t <- r.[j];
        r.[j]       <- t + r.[j + len];
        r.[j + len] <- t + (-r.[j + len]);
        r.[j + len] <- zeta_ * r.[j + len];
         j <- j + 1;
       }
       start <- j + len;
     }
     len <- len * 2;
   }
   j <- 0;
   while (j < 256) {
     r.[j] <- r.[j] * zetas_inv.[127]; 
     j <- j + 1;
   }    
   return r;
 }
  
 
}.

lemma ntt_spec_ll : islossless NTT.ntt.
proc.
sp.
while (   1 <= len /\ len <= 128
       /\ exists l, 0 <= l /\ len = 2^l
       /\ 0 <= zetasctr <= 127
       /\ 2*(zetasctr+1)*len = 256) (len);
  last by auto => />; split; [ by exists 7 | by smt()].
move=> z; wp; sp => *; exists *zetasctr; elim* => zetasctr1 l.
while (   1 <= len /\ len <= 128 /\ 0 <= l /\ len = 2 ^ l
       /\ 0 <= zetasctr1 <= 127
       /\ 0 <= zetasctr <= 127
       /\ 2 * (zetasctr1+ 1) * len = 256
       /\ 2 <= len
       /\ 2* (zetasctr - zetasctr1 ) * len <= 256
       /\ 0 <= start <= 256
       /\ start = 2*(zetasctr - zetasctr1)*len) (256 -start); last first.
+ wp; skip => [#] &m h; split; first by smt().
  move => [#] start zt0; split; first by smt().
  move => [#] ge2576_start h2; split; last by smt().
  do 2! (split; first by smt()).
have gt0_l: 0 < l.
  have /ler_eqVlt [<<- /=|/#]: 0 <= l by move: h2 => [#].
  have: 2 <= len{m} by move: h => [#] *.
  have ->: len{m} = 2^0 by move: h2 => [#] *.
  by rewrite expr0.
exists (l-1); do! split; 1,3,4,5:smt().
+ have ->: len{m} = 2^l by move: h2=> [#].
  by rewrite -{1}(@IntID.subrK l 1) JUtils.powS_minus /#.
move=> *; wp.
while (   0 <= start <= 256
       /\ 1 <= len /\ len <= 128
       /\ start <= j <= start + len
       /\ 0 <= zetasctr <= 127
       /\ 2 * (zetasctr1 + 1) * len = 256
       /\ start = 2*(zetasctr -1 - zetasctr1) * len
       /\ 2 * (zetasctr - zetasctr1 ) * len <= 256) (start + len - j); last first. 
+ wp; skip=> *; split; first by smt().
  move=> *; split; first by smt().
  move => *; split; last by smt().
  do 6! (split; first by smt()).
  split; smt().
by auto=> /> /#.
qed.

lemma invntt_spec_ll : islossless NTT.invntt.
proc.
sp.
while(0<=j<=256) (256-j); first by move => *; auto => /> /#.
wp.
while (   2 <= len /\ len <= 256
       /\ exists l, 0 <= l /\ len = 2^l
       /\ 0 <= zetasctr <= 128
       /\ zetasctr * len = 128 * (len - 2)) (256-len);
 last by auto => />; split; [exists 1 | smt()].
move => *; wp; sp=> *; move=> *; exists *zetasctr.
elim*=> zetasctr1 l.
while (   1 <= len /\ len <= 128 /\ 0 <= l /\ len = 2 ^ l
       /\ 0 <= zetasctr1 <= 128
       /\ 0 <= zetasctr <= 128
       /\ zetasctr1 * len = 128 * (len - 2)
       /\ 2 * (zetasctr - zetasctr1 ) * len <= 256
       /\ 0 <= start <= 256
       /\ start = 2 * (zetasctr - zetasctr1)*len) (256 -start); last first.
+ wp; skip => [#] &m h.
  split; first by smt().
  move => start zetasctr; split; first by smt().
  move=> ge256_st h2; split; last by smt().
  do 2! (split; first by smt()).
have gt0_l: 0 < l.
  have /ler_eqVlt [<<- /=|/#]: 0 <= l by move: h2 => [#].
  have: 2 <= len{m} by move: h => [#] *.
  have ->: len{m} = 2^0 by move: h2 => [#] *.
  by rewrite expr0.
exists (l+1); do! split; 1,3,4,5:smt().
+ have ->: len{m} = 2^l by move: h2=> [#].
  by rewrite exprS 1:/# mulrC.
move => *; wp.
while (   0 <= start <= 256
       /\ 1 <= len /\ len <= 128  /\ start <= j <= start + len
       /\ 0 <= zetasctr <= 128
       /\ zetasctr1 * len = 128 * (len - 2)
       /\ start = 2 * (zetasctr -1 - zetasctr1) * len
       /\ 2 * (zetasctr - zetasctr1 ) * len <= 256) (start + len - j); last first.
+ wp;skip => *.
  split; first by smt().
  move => *.
  split; first by smt().
  move => *.
  split; last by smt().
  split; first by smt().
  split; first by smt().
  split; first by smt().
  split; first by smt().
  split; first by smt().
  split; first by smt().
  split; last by smt().
  smt().
by auto=> /> /#.
qed.

(* We need  to connect these to the semantics of Kyber algebra, which we will
do by defining operators that capture the semantics of these algorithms.
To Do: give explicit definitions and prove equivalence  between
functional  and imperative realizations. *)

op zetas_const : elem Array128.t.
op zetas_inv_const : elem Array128.t.

require Matrix.

abstract theory DFT.
  clone import Ring.IDomain as Domain.

  clone import Bigalg.BigComRing as BigDom with
    type  t        <- t,
      op  CR.zeror <- Domain.zeror,
      op  CR.oner  <- Domain.oner,
      op  CR.(+)   <- Domain.(+),
      op  CR.([-]) <- Domain.([-]),
      op  CR.( * ) <- Domain.( * ),
      op  CR.invr  <- Domain.invr,
    pred  CR.unit  <- Domain.unit
    proof CR.*.

  realize CR.addrA     by exact: Domain.addrA    .
  realize CR.addrC     by exact: Domain.addrC    .
  realize CR.add0r     by exact: Domain.add0r    .
  realize CR.addNr     by exact: Domain.addNr    .
  realize CR.oner_neq0 by exact: Domain.oner_neq0.
  realize CR.mulrA     by exact: Domain.mulrA    .
  realize CR.mulrC     by exact: Domain.mulrC    .
  realize CR.mul1r     by exact: Domain.mul1r    .
  realize CR.mulrDl    by exact: Domain.mulrDl   .
  realize CR.mulVr     by exact: Domain.mulVr    .
  realize CR.unitP     by exact: Domain.unitP    .
  realize CR.unitout   by exact: Domain.unitout  .

  op a : t.
  op n : { int | 0 < n } as gt0_n.

  hint exact : gt0_n.

  clone import Matrix with
    type  R        <- t,
      op  size     <- n,
      op  ZR.zeror <- Domain.zeror,
      op  ZR.oner  <- Domain.oner,
      op  ZR.(+)   <- Domain.(+),
      op  ZR.([-]) <- Domain.([-]),
      op  ZR.( * ) <- Domain.( * ),
      op  ZR.invr  <- Domain.invr,
    pred  ZR.unit  <- Domain.unit
    proof ZR.*, ge0_size.

  realize ZR.addrA     by exact: Domain.addrA    .
  realize ZR.addrC     by exact: Domain.addrC    .
  realize ZR.add0r     by exact: Domain.add0r    .
  realize ZR.addNr     by exact: Domain.addNr    .
  realize ZR.oner_neq0 by exact: Domain.oner_neq0.
  realize ZR.mulrA     by exact: Domain.mulrA    .
  realize ZR.mulrC     by exact: Domain.mulrC    .
  realize ZR.mul1r     by exact: Domain.mul1r    .
  realize ZR.mulrDl    by exact: Domain.mulrDl   .
  realize ZR.mulVr     by exact: Domain.mulVr    .
  realize ZR.unitP     by exact: Domain.unitP    .
  realize ZR.unitout   by exact: Domain.unitout  .
  realize ZR.mulf_eq0  by exact: Domain.mulf_eq0 .
  realize ge0_size     by apply/ltzW/gt0_n.
      
  (* `a` is a principle `n`-th root of unity *)
  axiom aXn_eq1 : exp a n = oner.

  axiom sum_aXi_eq0 : forall k, 0 < k < n =>
    BAdd.bigi predT (fun i => exp a (i * k)) 0 n = zeror.

  hint exact : aXn_eq1.

  lemma unit_a : unit a.
  proof. by apply/(@unitP _ (exp a (n - 1))); rewrite mulrC -exprS // [smt(gt0_n)]. qed.

  hint exact : unit_a.

  lemma sum_aXi_dvd_eq0 : forall k, ! (n %| k) =>
    BAdd.bigi predT (fun i => exp a (i * k)) 0 n = zeror.
  proof.
  move=> k h; pose F i := exp a (i * (k %% n)).
  rewrite -(BAdd.eq_big_int _ _ F) => /= [i rg_i|] @/F => {F}.
    rewrite {2}(divz_eq k n) mulrDr exprD //.
    rewrite !(mulzC i) -mulrA mulrCA (@exprM _ n).
    by rewrite aXn_eq1 expr1z mul1r.
  apply: sum_aXi_eq0; rewrite ltz_pmod //=.
  rewrite ltr_neqAle modz_ge0 1:gtr_eqF //=.
  by rewrite eq_sym; apply: contra h => h; apply: dvdzE.
  qed.

  op dft (v : vector) =
    offunv (fun k => BAdd.bigi predT (fun j => v.[j] * exp a (j * k)) 0 n).

  op dftV (v : vector) =
    offunv (fun k => invr (ofint n) *
      BAdd.bigi predT (fun j => v.[j] * exp a (- (j * k))) 0 n).

  lemma dftK : unit (ofint n) => cancel dft dftV.
  proof.
  move=> ut_n v; apply/eq_vectorP=> i rg_i; rewrite offunvE //=.
  apply: (mulrI (ofint n)) => //; rewrite mulrA divrr // mul1r.
  pose F j := BAdd.bigi predT (fun j' => v.[j'] * exp a (j * (j' - i))) 0 n.
  rewrite -(BAdd.eq_big_int _ _ F) => /= [k rg_k @/F|].
    rewrite /dft !offunvE //= BAdd.mulr_suml.
    rewrite &(BAdd.eq_big_int) => /= k' rg_k'.
    by rewrite -mulrA -exprD // (@mulzC k' k) IntID.mulrBr.
  rewrite /F BAdd.exchange_big => {F} /=.
  pose F j' := v.[j'] * BAdd.bigi predT (fun j => exp a (j * (j' - i))) 0 n.
  rewrite -(BAdd.eq_big_int _ _ F) => /= [k rg_k @/F|].
    by rewrite BAdd.mulr_sumr.
  rewrite /F /= (BAdd.bigD1 _ _ i) 1,2:(mem_range, range_uniq) //=.
  rewrite BAdd.sumri_const 1:/# /= expr0 -/(ofint _) (@mulrC v.[i]).
  rewrite BAdd.big_seq_cond BAdd.big1 ?addr0 //= => j.
  case=> [/mem_range rg_j @/predC1 ne_ji] {F}.
  by rewrite sum_aXi_dvd_eq0 ?mulr0 //; apply/negP=> /dvdzP[q] /#.
  qed.

end DFT.



theory NTTequiv.

  (*TODO: all here*)


  op bitrev (i k : int) = bs2int (rev (int2bs i k)).

  lemma bitrev_involutive (i k : int) :
    0 <= i =>
    0 <= k < 2 ^ i =>
    bitrev i (bitrev i k) = k.
  proof.
    move => le0i [le0k ltk2powi] @/bitrev.
    suff {1}->: i = size (rev (int2bs i k)).
    - by rewrite bs2intK revK int2bsK.
    by rewrite size_rev size_int2bs /#.
  qed.

  import ZModpRing.

  module NTT3 = {
   proc ntt(r : zmod Array256.t,  zetas : zmod Array128.t) : zmod Array256.t = {
     var len, start, j, zetasctr;
     var  t, zeta_;

     zetasctr <- 0;
     len <- 1;
     while (len <= 64) {
      start <- 0;
      while(start < len) {
         zetasctr <- start;
         zeta_ <- exp (ZModpRing.ofint(17)) zetasctr; 
         j <- 0;
         while (j < 256) {
           t <- zeta_ * r.[bitrev 8 (j + len + start)];
           r.[bitrev 8 (j + len + start)] <- r.[bitrev 8 (j + start)] + (-t);
           r.[bitrev 8 (j + start)]       <- r.[bitrev 8 (j + start)] + t;
           j <- j + (len * 2);
         }
         start <- start + 1;
       }
       len <- len * 2;
     }     
     return r;
   }
  
  }.

module NTT2 = {
   proc ntt(r : zmod Array256.t,  zetas : zmod Array128.t) : zmod Array256.t = {
     var len, start, j, zetasctr;
     var  t, zeta_;

     zetasctr <- 0;
     len <- 128;
     while (2 <= len) {
      start <- 0;
      while(start < 256) {
         zetasctr <- (128 %/ len) + (start %/ (len * 2));
         zeta_ <- zetas.[zetasctr]; 
         j <- start;
         while (j < start + len) {
           t <- zeta_ * r.[j + len];
           r.[j + len] <- r.[j] + (-t);
           r.[j]       <- r.[j] + t;
           j <- j + 1;
         }
         start <- start + (len * 2);
       }
       len <- len %/ 2;
     }     
     return r;
   }

   proc invntt(r : zmod Array256.t, zetas_inv : zmod Array128.t) : zmod Array256.t = {
     var len, start, j, zetasctr;
     var  t, zeta_;

     zetasctr <- 0;
     len <- 2;
     while (len <= 128) {
      start <- 0;
      while(start < 256) {
         zetasctr <- 128 - (256 %/ len) + (start %/ (2 * len));
         zeta_ <- zetas_inv.[zetasctr];
         j <- start;
         while (j < start + len) {
          t <- r.[j];
          r.[j]       <- t + r.[j + len];
          r.[j + len] <- t + (-r.[j + len]);
          r.[j + len] <- zeta_ * r.[j + len];
           j <- j + 1;
         }
         start <- start + (len * 2);
       }
       len <- len * 2;
     }
     j <- 0;
     while (j < 256) {
       r.[j] <- r.[j] * zetas_inv.[127]; 
       j <- j + 1;
     }    
     return r;
   }
  
 
  }.

  module NTT1 = {
   proc ntt(r : zmod Array256.t,  zetas : zmod Array128.t) : zmod Array256.t = {
     var len, start, j, zetasctr;
     var  t, zeta_;

     zetasctr <- 0;
     len <- 128;
     while (2 <= len) {
      start <- 0;
      while(start < 256) {
         zetasctr <- zetasctr + 1;
         zeta_ <- zetas.[zetasctr]; 
         j <- start;
         while (j < start + len) {
           t <- zeta_ * r.[j + len];
           r.[j + len] <- r.[j] + (-t);
           r.[j]       <- r.[j] + t;
           j <- j + 1;
         }
         start <- start + (len * 2);
       }
       len <- len %/ 2;
     }     
     return r;
   }

   proc invntt(r : zmod Array256.t, zetas_inv : zmod Array128.t) : zmod Array256.t = {
     var len, start, j, zetasctr;
     var  t, zeta_;

     zetasctr <- 0;
     len <- 2;
     while (len <= 128) {
      start <- 0;
      while(start < 256) {
         zeta_ <- zetas_inv.[zetasctr]; 
         zetasctr <- zetasctr + 1;
         j <- start;
         while (j < start + len) {
          t <- r.[j];
          r.[j]       <- t + r.[j + len];
          r.[j + len] <- t + (-r.[j + len]);
          r.[j + len] <- zeta_ * r.[j + len];
           j <- j + 1;
         }
         start <- start + (len * 2);
       }
       len <- len * 2;
     }
     j <- 0;
     while (j < 256) {
       r.[j] <- r.[j] * zetas_inv.[127]; 
       j <- j + 1;
     }    
     return r;
   }
  
 
  }.

  module NTT = {
   proc ntt(r : zmod Array256.t,  zetas : zmod Array128.t) : zmod Array256.t = {
     var len, start, j, zetasctr;
     var  t, zeta_;

     zetasctr <- 0;
     len <- 128;
     while (2 <= len) {
      start <- 0;
      while(start < 256) {
         zetasctr <- zetasctr + 1;
         zeta_ <- zetas.[zetasctr]; 
         j <- start;
         while (j < start + len) {
           t <- zeta_ * r.[j + len];
           r.[j + len] <- r.[j] + (-t);
           r.[j]       <- r.[j] + t;
           j <- j + 1;
         }
         start <- j + len;
       }
       len <- len %/ 2;
     }     
     return r;
   }

   proc invntt(r : zmod Array256.t, zetas_inv : zmod Array128.t) : zmod Array256.t = {
     var len, start, j, zetasctr;
     var  t, zeta_;

     zetasctr <- 0;
     len <- 2;
     while (len <= 128) {
      start <- 0;
      while(start < 256) {
         zeta_ <- zetas_inv.[zetasctr]; 
         zetasctr <- zetasctr + 1;
         j <- start;
         while (j < start + len) {
          t <- r.[j];
          r.[j]       <- t + r.[j + len];
          r.[j + len] <- t + (-r.[j + len]);
          r.[j + len] <- zeta_ * r.[j + len];
           j <- j + 1;
         }
         start <- j + len;
       }
       len <- len * 2;
     }
     j <- 0;
     while (j < 256) {
       r.[j] <- r.[j] * zetas_inv.[127]; 
       j <- j + 1;
     }    
     return r;
   }
  
 
  }.

  op zeta1_ = ZModpRing.ofint 17.

  (*op dft (v : vector) =
    offunv (fun k => BAdd.bigi predT (fun j => v.[j] * exp a (j * k)) 0 n).*)

clone import Bigalg.BigComRing as BigZmod with
    type  t        <- zmod,
      op  CR.zeror <- ZModField.zero,
      op  CR.oner  <- ZModField.one,
      op  CR.(+)   <- ZModField.(+),
      op  CR.([-]) <- ZModField.([-]),
      op  CR.( * ) <- ZModField.( * ),
      op  CR.invr  <- ZModField.inv,
    pred  CR.unit  <- ZModField.unit.

  (*Proof not done and ugly, two lemmas might be useful:*)
  (*- one that gives a postcondition when the loop being adressed is a for loop*)
  (*- another that does the same for the specific for loops that always write on different parts of the memory that is described in the postcondition (the two innermost loops in our case)*)

  

  lemma naiventt (p : zmod Array256.t, zs : zmod Array128.t) : 
    (forall i ,
      0 <= i < 128 =>
      zs.[i] = exp zeta1_ (bitrev 8 i)) =>
      hoare
        [NTT3.ntt :
        arg = (p,zs) ==>
        forall a b ,
          0 <= a < 128 =>
          0 <= b < 2 =>
          res.[bitrev 8 (128 * b + a)] =
          BAdd.bigi
            predT
            (fun c => p.[bitrev 8 (128 * b + c)] * exp zeta1_ (c * a))
            0 128].
  proof.
    move => Hzs.
    proc.
    sp.
    while
      ( (exists k ,
          0 <= k < 8 /\
          len = 2 ^ k) /\
        (forall a b ,
          0 <= a < len =>
          0 <= b < 256 %/ len =>
          r.[bitrev 8 (len * b + a)] =
          BAdd.bigi
            predT
            (fun k =>
              p.[bitrev 8 (len * b + k)] *
              (exp zeta1_ (k * a)))
            0 len)).
    + sp; wp => /=.
      while
        ( (exists k ,
            0 <= k < 8 /\
            len = 2 ^ k) /\
          start <= len /\
          (forall a b ,
            0 <= a < start * 2 =>
            0 <= b < 128 %/ len =>
            r.[bitrev 8 (len * 2 * b + a)] =
            BAdd.bigi
              predT
              (fun k =>
                p.[bitrev 8 (len * 2 * b + k)] *
                (exp zeta1_ (k * a)))
              0 (len * 2)) /\
          (forall a b ,
            start <= a < len =>
            0 <= b < 256 %/ len =>
            r.[bitrev 8 (len * b + a)] =
            BAdd.bigi
              predT
              (fun k =>
                p.[bitrev 8 (len * b + k)] *
                (exp zeta1_ (k * a)))
              0 len)).
      - sp; wp.
        while
          ( (exists k ,
              0 <= k < 8 /\
              len = 2 ^ k) /\
            start <= len /\
            (exists bsj , 0 <= bsj <= 128 %/ len /\ j = len * 2 * bsj) /\
            (forall a b ,
              0 <= a < start * 2 =>
              0 <= b < 128 %/ len =>
              r.[bitrev 8 (len * 2 * b + a)] =
              BAdd.bigi
                predT
                (fun k =>
                  p.[bitrev 8 (len * 2 * b + k)] *
                  (exp zeta1_ (k * a)))
                0 (len * 2)) /\
            (forall b ,
              0 <= b < j %/ (len * 2) =>
              r.[bitrev 8 (len * 2 * b + start * 2)] =
              BAdd.bigi
                predT
                (fun k =>
                  p.[bitrev 8 (len * 2 * b + k)] *
                  (exp zeta1_ (k * (start * 2))))
                0 (len * 2)) /\
            (forall b ,
              0 <= b < j %/ (len * 2) =>
              r.[bitrev 8 (len * 2 * b + start * 2 + 1)] =
              BAdd.bigi
                predT
                (fun k =>
                  p.[bitrev 8 (len * 2 * b + k)] *
                  (exp zeta1_ (k * (start * 2 + 1))))
                0 (len * 2)) /\
            (forall b ,
              j %/ len <= b < 256 %/ len =>
              r.[bitrev 8 (len * b + start)] =
              BAdd.bigi
                predT
                (fun k =>
                  p.[bitrev 8 (len * b + k)] *
                  (exp zeta1_ (k * start)))
                0 len) /\
            (forall a b ,
              start < a < len =>
              0 <= b < 256 %/ len =>
              r.[bitrev 8 (len * b + a)] =
              BAdd.bigi
                predT
                (fun k =>
                  p.[bitrev 8 (len * b + k)] *
                  (exp zeta1_ (k * a)))
                0 len)).
        * sp; skip.
          move => /> &hr r k le0k ltk8 lestart2powk bsj le0bsj ltbsj2pow.
          move => IHstartpastj IHjpasteven IHjpastodd IHjfuture IHstartfuturej.
          move => ltj256; do!split.
          + exists (bsj + 1).
            split => //; last by rewrite mulzDr.
            split => //; first by apply addz_ge0.
            move => _; apply ltzE; apply (ltr_pmul2l (2 ^ k * 2));
            first by apply mulr_gt0 => //; apply expr_gt0.
            rewrite -Montgomery.div_mulr //;
            last by rewrite (mulzA _ _ 128) mulKz //=; apply neq_ltz; right; apply expr_gt0.
            have /= Hdiv:= (dvdz_exp2l 2 k 7); apply Hdiv; split => // _.
            smt().
          + move => a b le0a lta2start le0b ltb2pow.
            admit.
          + move => b le0b ltb.
            admit.
          + move => b le0b ltb.
            admit.
          + move => b leb ltb2pow.
            admit.
          move => a b ltstarta lta2powk le0b ltb2pow.
          admit.
        skip.
        move => /> &hr k le0k ltk8 lestart2powk IHstartpast IHstartfuture ltstart2powk; do!split.
        * by exists 0 => /=; apply divz_ge0 => //; apply expr_gt0.
        * by move => b le0b ltb0; smt().
        * by move => b le0b ltb0; smt().
        * by move => b le0b ltb2pow; rewrite IHstartfuture.
        * move => a b ltstarta lta2powk le0b ltbpow.
          by rewrite IHstartfuture //; split => //; apply ltrW.
        move => j r nltj256 bsj le0bsj ltbsj2pow ?; subst j.
        have ->: (bsj = 128 %/ 2 ^ k) by smt().
        move => IHstartpastj IHjpasteven IHjpastodd IHjfuture IHstartfuturej; do!split.
        * by apply ltzE.
        * move => a b le0a lta le0b ltb2pow.
          case: (a < start{hr} * 2) => [lta2start|nlta2start]; first by rewrite IHstartpastj.
          case: (a = start{hr} * 2) => [eqa2start|neqa2start];
          first by rewrite eqa2start IHjpasteven //; split => // _; smt().
          have ->: a = start{hr} * 2 + 1 by smt().
          by rewrite addzA IHjpastodd //; split => // _; smt().
        move => a b lestartp1a lta2powk le0b ltbpow.
        by rewrite IHstartfuturej //; split => //; apply ltzE.
      skip.
      move => /> &hr k le0k ltk8 IHlen le2powk64; do!split; first by apply expr_ge0.
      - move => a b le0a lta0; smt().
      move => r start nltstart2powk lestart2powk.
      have ->: (start = 2 ^ k) by smt().
      move => IHstartpast IHstartfuture; split.
      - exists (k+1); do!split => //; [by smt()| |by rewrite Domain.exprSr] => _.
        apply ltzE => /=; apply ler_subr_addr => /=.
        search _ (_ ^ _ <= _ ^ _)%IntID.
        admit.
      move => a b le0a lta2pow le0b ltb2pow; rewrite IHstartpast //; split => // _.
      by move: ltb2pow; rewrite (mulzC _ 2) Montgomery.div_mul.
    skip.
    move => />; do!split.
    + by exists 0.
    + move => a b le0a lta1 le0b ltb256.
      have ->: a=0 by smt().
      by rewrite BAdd.big_ltn // BAdd.big_geq //= addr0 expr0 mulr1.
    move => len r nltlen64 k le0k ltk8 ?; subst len.
    have ->: k=7.
    + admit.
    by move => /= IHlen a b le0a lta128 le0b ltb2; rewrite IHlen.
  qed.


end NTTequiv.





op ntt : poly -> poly.
op invntt : poly -> poly.

lemma ntt_spec_h _r :
   hoare[ NTT.ntt :
     arg = (_r,zetas_const) ==>
       res = ntt _r ].
admitted.

lemma invntt_spec_h _r  :
   hoare[ NTT.invntt : arg=(_r,zetas_inv_const) ==> res = invntt _r ].
admitted.

lemma ntt_spec _r :
   phoare[ NTT.ntt : arg = (_r,zetas_const) ==> res = ntt _r ] = 1%r
  by conseq ntt_spec_ll (ntt_spec_h _r); done.

lemma invntt_spec _r :
   phoare[ NTT.invntt :
     arg=(_r,zetas_inv_const) ==> res = invntt _r ] = 1%r
  by conseq invntt_spec_ll (invntt_spec_h _r); done.

(* ALL THIS WILL BE REPLACED WITH POLY THEORY *)

(*  The end goal is to connect  this to polynomial algebra, which  should
    give us a notion of complex multiplication that can be plugged in to
    a theorem which we axiomatize below. *)

op cmplx_mul (a :zmod * zmod, b : zmod * zmod, zzeta : zmod) =
     (a.`2 * b.`2 * zzeta + a.`1*b.`1, 
      a.`1 * b.`2 + a.`2 * b.`1).

op dcmplx_mul(a1 : zmod * zmod, b1 : zmod * zmod, 
              a2 : zmod * zmod, b2 : zmod * zmod, zzeta : zmod) = 
     (cmplx_mul a1 b1 zzeta, cmplx_mul a2 b2 (-zzeta)).

op basemul : poly -> poly -> poly.

axiom basemul_sem (ap bp rs: poly) :
   rs = basemul ap bp <=> 
   forall k, 0 <= k < 64 =>
     ((rs.[4*k],rs.[4*k+1]),(rs.[4*k+2],rs.[4*k+3])) =
         (dcmplx_mul (ap.[4*k],ap.[4*k+1]) (bp.[4*k],bp.[4*k+1])
            (ap.[4*k+2],ap.[4*k+3]) (bp.[4*k+2],bp.[4*k+3]) (zetas_const.[k+64])).

op scale(p : poly, c : elem) : poly =  Array256.map (fun x => x * c) p.

(* These theorems should come from the algebraic infrastructure, along with
another one that says our axiomatization of mul and add in Kyber are 
explicit formulae for the ring operations. *)
axiom invnttK : cancel ntt invntt.
axiom nttK : cancel invntt ntt.
axiom nttZero : ntt Poly.zero = Poly.zero.

axiom ntt_scale p c : ntt (scale p c) = scale (ntt p) c.

lemma invntt_scale p c : invntt (scale p c) = scale (invntt p) c.
proof.
rewrite (_: p = ntt (invntt p)); first by rewrite nttK.
by rewrite -ntt_scale {1}invnttK  nttK.
qed.

axiom add_comm_ntt (pa pb : poly):
  ntt (pa + pb) = (ntt pa) + (ntt pb).

axiom mul_comm_ntt (pa pb : poly):
  ntt (pa * pb) = basemul (ntt pa) (ntt pb).

lemma mul_scale_ntt (pa pb : poly) (c : elem) : 
  invntt (scale (basemul (ntt pa) (ntt pb)) c) = 
   scale (pa * pb) c by
 smt(mul_comm_ntt ntt_scale invnttK).

lemma add_scale_ntt (pa pb : poly) (c : elem) : 
  invntt (scale ((ntt pa) + (ntt pb)) c) = 
   scale (pa + pb) c by
 smt(add_comm_ntt ntt_scale invnttK).


(* END: ALL THIS WILL BE REPLACED WITH POLY THEORY *)

lemma scale1 (p : poly) :
   scale p (ZModField.one) = p.
proof.
rewrite /scale.
apply Array256.ext_eq => *.
rewrite mapiE => />.
smt(@ZModField).
qed.

end NTT_Fq.
