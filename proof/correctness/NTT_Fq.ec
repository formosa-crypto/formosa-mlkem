require import AllCore IntDiv Array256 Array128.
require import List Ring StdOrder Fq.
require import IntMin.
require import For.

import Fq IntOrder.
theory NTT_Fq.

import Kyber_.
import ZModField.
import BitEncoding.BS2Int.

(* These are imperative specifications of the NTT algorithms  *)

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
proof.
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
proof.
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

  op bitrev (i k : int) = bs2int (rev (int2bs i k)).

  lemma bitrev_ineq (i k : int) :
    0 <= i =>
    0 <= bitrev i k < 2 ^ i.
  proof.
    move => le0i; split; [apply bs2int_ge0|move => _]; rewrite /bitrev; move: (size_int2bs i k) => @/max.
    by case: (0 < i) => [_ {2}<-|lei0]; [|(have <-: (i = 0) by smt()); move => {2}<-]; rewrite -size_rev; apply bs2int_le2Xs.
  qed.

  lemma bitrev_involutive (i k : int) :
    0 <= i =>
    k \in range 0 (2 ^ i) =>
    bitrev i (bitrev i k) = k.
  proof.
    move => le0i /mem_range [le0k ltk2powi] @/bitrev.
    suff {1}->: i = size (rev (int2bs i k)).
    - by rewrite bs2intK revK int2bsK.
    by rewrite size_rev size_int2bs ler_maxr.
  qed.

  lemma bitrev_injective (i k1 k2 : int) :
    0 <= i =>
    k1 \in range 0 (2 ^ i) =>
    k2 \in range 0 (2 ^ i) =>
    bitrev i k1 = bitrev i k2 =>
    k1 = k2.
  proof.
    by move => le0i Hk1in Hk2in eq_bitrev; rewrite -(bitrev_involutive i k1) // -(bitrev_involutive i k2) // eq_bitrev.
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

  abbrev all_range P (min max : int) = all P (range min max).

  lemma all_range_empty P (min max : int) : max <= min => all_range P min max.
  proof.
    by move => lemaxmin; rewrite range_geq.
  qed.

  lemma all_range_min P (min max : int) : min < max => all_range P min max <=> P min /\ all_range P (min + 1) max.
  proof.
    by move => ltminmax; rewrite range_ltn.
  qed.

  lemma all_range_max P (min max : int) : min < max => all_range P min max <=> P (max - 1) /\ all_range P min (max - 1).
  proof.
    move => ltminmax; rewrite -{1}(IntID.subrK max 1) rangeSr; first by apply/(ler_add2r 1) => /=; apply/ltzE.
    split => [/allP Hall|[HP /allP Hall]].
    + by split; [|apply/allP => x Hin]; apply Hall; rewrite mem_rcons // in_cons; right.
    by apply /allP => x; rewrite mem_rcons in_cons; case => [->> //|]; apply Hall.
  qed.

  lemma all_range_imp P Q (min max : int) : (forall x , x \in range min max => P x => Q x) => all_range P min max => all_range Q min max.
  proof.
    by move => Himp /allP HallrangeP; apply /allP => x Hxin; apply Himp => //; apply HallrangeP.
  qed.

  abbrev all_range_2 P (min1 max1 min2 max2 : int) = all_range (fun x => all_range (P x) min1 max1) min2 max2.

  abbrev index (len a b : int) = bitrev 8 (len * a + b).

  op partial_ntt (p : zmod Array256.t, len a b : int) =
  BAdd.bigi
    predT
    (fun k =>
      p.[index len k b] *
      (exp zeta1_ (k * a)))
    0 len.

  op partial_ntt_spec (r p : zmod Array256.t, len a b : int) = (r.[index len a b] = partial_ntt p len a b).

  (*TODO: add this in EasyCrypt (in Ring).*)
  lemma mulzD1l x y : (x + 1) * y = x * y + y.
  proof. by rewrite mulzDl. qed.

  (*TODO: add in IntID*)
  search _ 2 intmul.
  lemma addz_double (x : int) : x + x = x * 2.
  proof. by ring. qed.

  (*TODO: move*)
  lemma dvdNdiv x y : x <> 0 => x %| y => (-y) %/ x = - y %/ x.
  proof.
    by move => neqx0 /dvdzP [z ->>]; rewrite -mulNr !mulzK.
  qed.

  lemma naiventt (p : zmod Array256.t, zs : zmod Array128.t) : 
    (forall i ,
      0 <= i < 128 =>
      zs.[i] = exp zeta1_ (bitrev 8 i)) =>
      hoare
        [NTT3.ntt :
        arg = (p,zs) ==>
        all_range_2 (partial_ntt_spec res p 128) 0 128 0 2].
  proof.
    move => Hzs; proc; sp.
    while
      ( (exists k ,
          0 <= k < 8 /\
          len = 2 ^ k) /\
        (all_range_2 (partial_ntt_spec r p len) 0 len 0 (256 %/ len))).
    + sp; wp => /=.
      while
        ( FOR_INT_ADD_LT.inv 1 len 0 start /\
          all_range_2 (partial_ntt_spec r p (len * 2)) 0 (start * 2) 0 (128 %/ len) /\
          all_range_2 (partial_ntt_spec r p len) start len 0 (256 %/ len)).
      - sp; wp.
        while
          ( FOR_INT_ADD_LT.inv (len * 2) 256 0 j /\
            all_range_2 (partial_ntt_spec r p (len * 2)) 0 (start * 2) 0 (128 %/ len) /\
            all_range (partial_ntt_spec r p (len * 2) (start * 2)) 0 (j %/ (len * 2)) /\
            all_range (partial_ntt_spec r p (len * 2) (start * 2 + 1)) 0 (j %/ (len * 2)) /\
            all_range (partial_ntt_spec r p len start) (j %/ len) (256 %/ len) /\
            all_range_2 (partial_ntt_spec r p len) (start + 1) len 0 (256 %/ len)).
        * sp; skip.
          move => |> &hr j r Hinvj.
          (*TODO: why is the all_range_2 abbrev not abbreviating here, and why so slow for move?*)
          move => IHstartpastj IHjpasteven IHjpastodd IHjfuture IHstartfuturej.
          move => Hcondj k le0k ltk8 ->> le2powk64 Hcondstart Hinvstart.
          have Hfinj: (256 <= 0 \/ 0 < 2 ^ k * 2) by move => /=; apply mulr_gt0 => //; apply expr_gt0.
          rewrite (FOR_INT_ADD_LT.inv_loop_post _ _ _ _ Hfinj Hinvj Hcondj) => /=.
          move: (FOR_INT_ADD_LT.inv_loopP _ _ _ _ Hfinj Hinvj Hcondj) => /= [bsj [bsj_range ->>]].
          move: (bsj_range) => /mem_range [le0bsj ltbsj_].
          move: IHjpasteven IHjpastodd IHjfuture.
          rewrite mulzK; first by apply gtr_eqF; apply mulr_gt0 => //; apply expr_gt0.
          rewrite {3}(mulzC (2 ^ k) 2) {1}mulrA mulzK; first by apply/gtr_eqF/expr_gt0.
          move => IHjpasteven IHjpastodd IHjfuture.
          do!split.
          (*TODO: use bitrev_involutive.*)
          + move : IHstartpastj; apply all_range_imp => x Hxin /=; apply all_range_imp => y Hyin.
            rewrite /partial_ntt_spec => <-; rewrite set_neqiE; [|rewrite set_neqiE //].
            - apply/negP => eq_index; move: (bitrev_injective _ _ _ _ _ _ eq_index) => //.
              * rewrite /=. (*TODO: use mem_range*)
                admit.
              * admit.
              apply/negP/gtr_eqF.  (*Or maybe it is ltr_eqF*)
              admit.
            admit.
          + rewrite -mulzD1l mulzK; first by apply gtr_eqF; apply mulr_gt0 => //; apply expr_gt0.
            apply/all_range_max; [by apply ltzS|split].
            - admit.
            move : IHjpasteven; apply all_range_imp => x Hxin /=.
            rewrite /partial_ntt_spec => <-; rewrite set_neqiE; [|rewrite set_neqiE //].
            - admit.
            admit.
          + rewrite -mulzD1l mulzK; first by apply gtr_eqF; apply mulr_gt0 => //; apply expr_gt0.
            apply/all_range_max; [by apply ltzS|split].
            - admit.
            move : IHjpastodd; apply all_range_imp => x Hxin /=.
            rewrite /partial_ntt_spec => <-; rewrite set_neqiE; [|rewrite set_neqiE //].
            - admit.
            admit.
          + admit.
          move : IHstartfuturej; apply all_range_imp => x Hxin /=; apply all_range_imp => y Hyin.
          rewrite /partial_ntt_spec => <-; rewrite set_neqiE; [|rewrite set_neqiE //].
          + admit.
          admit.
        skip.
        move => |> &hr Hinv IHstartpast IHstartfuture Hcond lelen64 k le0k ltk8 ->>.
        rewrite (FOR_INT_ADD_LT.inv_loop _ _ _ _ _ Hinv Hcond) //=.
        move: Hinv Hcond => [? [/= <<- [le0start lestartout]]] ltstart2powk.
        do!split.
        * by apply FOR_INT_ADD_LT.inv_in; apply mulr_gt0 => //; apply expr_gt0.
        * by apply all_range_empty.
        * by apply all_range_empty.
        * (*TODO: why can't I just apply the view all_range_min?*)
          by move: IHstartfuture => /(all_range_min _ _ _ ltstart2powk) [].
        * by move: IHstartfuture => /(all_range_min _ _ _ ltstart2powk) [].
        move => j r Hncond Hinv.
        rewrite (FOR_INT_ADD_LT.inv_out _ _ _ _ _ Hinv Hncond) /=; first by apply mulr_gt0 => //; apply expr_gt0.
        have ->: FOR_INT_ADD_LT.out (2 ^ k * 2) 256 0 = 128 %/ (2 ^ k).
        * admit.
        rewrite mulzK; first by apply gtr_eqF; apply mulr_gt0 => //; apply expr_gt0.
        move => IHstartpastj IHjpasteven IHjpastodd _ IHstartfuturej.
        rewrite mulrDl; apply/all_range_max => [/#|] /=; split => //.
        by apply/all_range_max => [/#|] /=; split.
      skip.
      move => |> &hr k le0k ltk8 IHlen le2powk64; do!split.
      - by apply FOR_INT_ADD_LT.inv_in.
      - by apply all_range_empty.
      move => r start Hncond Hinv.
      rewrite (FOR_INT_ADD_LT.inv_out _ _ _ _ _ Hinv Hncond) //=.
      have ->: FOR_INT_ADD_LT.out 1 (2 ^ k) 0 = (2 ^ k).
      - admit.
      move => IHstartpast _; split.
      - exists (k+1); do!split => //; [by smt()| |by rewrite Domain.exprSr] => _.
        apply ltzE => /=; apply ler_subr_addr => /=.
        search _ (_ ^ _ <= _ ^ _)%IntID.
        admit.
      by rewrite {2}(mulzC _ 2) Montgomery.div_mul.
    skip.
    move => />; do!split.
    + by exists 0.
    + apply all_range_max => //=; split; last by apply all_range_empty.
      apply/allP => x xinrange; rewrite /partial_ntt_spec /partial_ntt.
      by rewrite BAdd.big_ltn // BAdd.big_geq //= addr0 expr0 mulr1.
    move => len r nltlen64 k le0k ltk8 ->>.
    have ->: k=7.
    + admit.
    by trivial.
  qed.

  equiv eq_NTT1_NTT2: NTT1.ntt ~ NTT2.ntt:
    ={arg} ==> ={res}.
  proof.
    proc; sp.
    while
      ( (exists k ,
          0 <= k < 8 /\
          len{1} = 2 ^ k) /\
        ={zetasctr, len, r, zetas} /\
        (zetasctr{1} + 1 = 128 %/ len{1})).
    + sp; wp => /=.
      while
        ( (exists k ,
            0 <= k < 8 /\
            len{1} = 2 ^ k) /\
          (FOR_INT_ADD_LT.inv (len{1} * 2) 256 0 start{1}) /\
          ={zetasctr, len, r, zetas, start} /\
          (zetasctr{1} + 1 = 128 %/ len{1} + start{1} %/ (len{1} * 2))).
      - sp; wp => /=.
        while
        ( (exists k ,
            0 <= k < 8 /\
            len{1} = 2 ^ k) /\
          (FOR_INT_ADD_LT.inv (len{1} * 2) 256 0 start{1}) /\
          ={zetasctr, len, r, zetas, start, zeta_, j} /\
          (zetasctr{1} = 128 %/ len{1} + start{1} %/ (len{1} * 2))).
        * by sp; skip => |>.
        skip => |> &hr2 zetasctr k le0k ltk8 Hinv Hzetasctr ltstart256.
        rewrite Hzetasctr /= => _ _ _; split; first by apply FOR_INT_ADD_LT.inv_loop => //; apply mulr_gt0 => //; apply expr_gt0.
        rewrite divzDr ?dvdzz // divzz addzA -Hzetasctr /b2i.
        have -> //=: 2 ^ k * 2 <> 0.
        by apply gtr_eqF; apply mulr_gt0 => //; apply expr_gt0.
      skip => |> &hr2 k le0k ltk8 Hzetasctr le22powk; do!split.
      - by apply/FOR_INT_ADD_LT.inv_in/mulr_gt0 => //; apply expr_gt0.
      move => start zetasctr Hncond _ Hinv ->; split.
      - exists (k-1); do!split => //=.
        * by apply ler_subr_addr; apply ltzE; move: le0k => /le0r [->>|].
        * by move: ltk8 => /ltzW lek8 _; apply ltzE; rewrite -addzA.
        by apply Montgomery.pow_div1; move: le0k => /le0r [->>|].
      rewrite (FOR_INT_ADD_LT.inv_out _ _ _ _ _ Hinv Hncond); first by apply/mulr_gt0 => //; apply expr_gt0.
      rewrite /out /= mulzK; first by apply gtr_eqF; apply mulr_gt0 => //; apply expr_gt0.
      rewrite (mulzC (2 ^ k) 2) Montgomery.div_mul //= dvdNdiv; first by apply/gtr_eqF/expr_gt0.
      - by move : (dvdz_exp2l 2 k 7) => /= Hdiv; apply Hdiv; rewrite le0k -ltzS.
      rewrite opprK ler_maxl; first by apply divz_ge0 => //; apply expr_gt0.
      rewrite -(divzMpr 2 128 (_ %/ _)) //= divzK.
      - admit.
      by rewrite -divzDl //=; move: (dvdz_exp2l 2 k 7); rewrite /= le0k -ltzS /= ltk8.
    by skip => />; exists 7; split.
  qed.

  equiv eq_NTT_NTT1: NTT.ntt ~ NTT1.ntt:
    ={arg} ==> ={res}.
  proof.
    proc; sp.
    while ((0 <= len{1}) /\ ={zetasctr, len, r, zetas}).
    + sp; wp => /=.
      while ((0 <= len{1}) /\ ={zetasctr, len, r, zetas, start}).
      - sp; wp => /=.
        while (   (0 <= len{1})
               /\ ={zetasctr, len, r, zetas, start, zeta_, j}
               /\ (FOR_INT_ADD_LT.inv 1 (start{1} + len{1}) start{1} j{1})).
        * sp; skip => |> &hr2 j le0len.
          by apply FOR_INT_ADD_LT.inv_loop.
        skip => |> &hr2 le0len ltstart256; split.
        + by apply FOR_INT_ADD_LT.inv_in.
        move => j Hncond _ Hinv.
        rewrite (FOR_INT_ADD_LT.inv_out _ _ _ _ _ Hinv Hncond) // /out /=.
        rewrite opprD opprK addrA /= ler_maxl //.
        by rewrite -addz_double addzA.
      by skip => /> &hr2 le0len _ _ _ _; apply/divz_ge0.
    by skip => />.
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
