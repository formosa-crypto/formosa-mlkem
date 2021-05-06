require import AllCore IntDiv Array256 Array128.
require import List Ring StdOrder Fq.
require import IntMin.
require import List_extra Ring_extra RealExp_extra IntDiv_extra.
require import List_hakyber IntDiv_hakyber BitEncoding_hakyber For.

import Fq IntOrder.
theory NTT_Fq.

import Kyber_.
import ZModField.

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
         zetasctr <- bitrev 8 (len + start);
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

  abbrev index (len a b : int) = bitrev 8 (b * len + a).

  op partial_ntt (p : zmod Array256.t, len a b : int) =
  BAdd.bigi
    predT
    (fun k =>
      (exp zeta1_ (bitrev 8 (k * a))) *
      p.[index len k b])
    0 len.

  op partial_ntt_spec (r p : zmod Array256.t, len a b : int) = (r.[index len a b] = partial_ntt p len a b).

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
    while (
      FOR_NAT_MUL_LE.inv 2 64 1 len /\
      all_range_2 (partial_ntt_spec r p len) 0 len 0 (256 %/ len)).
    + sp; wp => /=.
      while (
        FOR_INT_ADD_LT.inv 1 len 0 start /\
        all_range_2 (partial_ntt_spec r p (len * 2)) 0 (start * 2) 0 (128 %/ len) /\
        all_range_2 (partial_ntt_spec r p len) start len 0 (256 %/ len)).
      - sp; wp.
        while (
          FOR_INT_ADD_LT.inv (len * 2) 256 0 j /\
          all_range_2 (partial_ntt_spec r p (len * 2)) 0 (start * 2) 0 (128 %/ len) /\
          all_range (partial_ntt_spec r p (len * 2) (start * 2)) 0 (j %/ (len * 2)) /\
          all_range (partial_ntt_spec r p (len * 2) (start * 2 + 1)) 0 (j %/ (len * 2)) /\
          all_range (partial_ntt_spec r p len start) (j %/ len) (256 %/ len) /\
          all_range_2 (partial_ntt_spec r p len) (start + 1) len 0 (256 %/ len)).
        * sp; skip.
          (*TODO: why is the all_range_2 abbrev not abbreviating here, and why so slow for move?*)
          move => |> &hr j r.
          (*TODO: shortcut to apply this immediatly before moving into context?*)
          move => Hcond_len Hinv_len; move: (FOR_NAT_MUL_LE.inv_loopP _ _ _ _ _ Hcond_len Hinv_len) => //= [k [Hk_range ->>]].
          move => Hcond_start Hinv_start; move: (FOR_INT_ADD_LT.inv_loopP _ _ _ _ _ Hcond_start Hinv_start) => //= [start [Hstart_range ->>]].
          move => Hcond_j Hinv_j; move: (FOR_INT_ADD_LT.inv_loopP _ _ _ _ _ Hcond_j Hinv_j);
          [by rewrite //=; apply mulr_gt0 => //; apply expr_gt0|move => //= [bsj [Hbsj_range ->>]]].
          move: (FOR_INT_ADD_LT.inv_loop_post _ _ _ _ _ Hcond_j Hinv_j);
          [by rewrite //=; apply mulr_gt0 => //; apply expr_gt0|move => -> /=].
          (*TODO: shortcut to clear these when last used? List of shortcuts in EasyCrypt manual?*)
          move => {Hinv_len Hcond_len Hinv_start Hcond_start Hinv_j Hcond_j}.
          (*TODO: why no simplification? Pierre-Yves*)
          rewrite lezNgt expr_gt0 //= in Hstart_range.
          rewrite /= in Hstart_range.
          rewrite -mulrD1l !mulrA (IntID.mulrAC bsj _ 2) -mulrD1l -!mulrA.
          move: Hbsj_range.
          rewrite -exprS; first by smt(mem_range).
          rewrite -exprSr; first by smt(mem_range).
          do 2!(rewrite mulzK ?expf_eq0 //=).
          do 2!(rewrite -divzpMr; first by apply dvdz_exp2l; smt(mem_range)).
          rewrite -exprD_subz //; [by smt(mem_range)|rewrite addrAC /=].
          do 3!(rewrite divz_pow //=; first by smt(mem_range)).
          rewrite mulNr opprD /= (addzC (-k)).
          move => Hbsj_range IHstart_past IHj_past_even IHj_past_odd IHj_future IHstart_future.
          do!split.
          (*TODO: use bitrev_involutive.*)
          + move : IHstart_past; apply all_range_imp => y Hy_range /=; apply all_range_imp => x Hx_range /=.
            rewrite /partial_ntt_spec /= => <-; rewrite !get_set_if -!mem_range.
            do 2!(rewrite (range_incl _ _ _ _ _ _ _ (bitrev_range _ _)) //=).
            rewrite bitrev_bijective //.
            - (*TODO: actually should be able to infer placeholders.*)
              (*move: (add_range _ _ _ _ _ _ (range_mul _ _ _ _ _ Hy_range) Hx_range).*)
              move: (add_range _ _ _ _ _ _ (range_mul _ _ _ (2 ^ (k + 1)) _ Hy_range) Hx_range); first by apply expr_gt0.
              apply range_incl => //=; rewrite -exprD_nneg; [by smt(mem_range)|by smt(mem_range)|].
              rewrite addrA -(IntID.addrA 7) /=.
              (*TODO: must be a bit more precise than the range_mul.*)
              admit.
            - admit.
            search _ bitrev.
            admit.
          + admit.
          + admit.
          + admit.
          admit.
        skip.
        move => |> &hr.
        move => Hcond_len Hinv_len; move: (FOR_NAT_MUL_LE.inv_loopP _ _ _ _ _ Hcond_len Hinv_len) => //= [k [Hk_range ->>]].
        move => Hcond_start Hinv_start; move: (FOR_INT_ADD_LT.inv_loopP _ _ _ _ _ Hcond_start Hinv_start) => //= [start [Hstart_range ->>]].
        rewrite FOR_INT_ADD_LT.inv_in /=; first by rewrite //=; apply mulr_gt0 => //; apply expr_gt0.
        rewrite (FOR_INT_ADD_LT.inv_loop_post _ _ _ _ _ Hcond_start Hinv_start ) //=.
        move => {Hinv_len Hcond_len Hinv_start Hcond_start}.
        rewrite lezNgt expr_gt0 //= in Hstart_range.
        rewrite /= in Hstart_range.
        rewrite -exprSr; first by smt(mem_range).
        do 2!(rewrite divz_pow //=; first by smt(mem_range)).
        move => IHstart_past IHstart_future.
        do!split.
        * by apply all_range_empty.
        * by apply all_range_empty.
        * (*TODO: why can't I just apply the view all_range_min? Use rewrite.*)
          (*move: IHstart_future => /all_range_2_min.*)
          by move: IHstart_future; rewrite all_range_2_min /=; first by smt(mem_range).
        * by move: IHstart_future; rewrite all_range_2_min /=; first by smt(mem_range).
        move => j r.
        (*TODO: the order here seems reversed...*)
        move => {IHstart_past IHstart_future}.
        move => Hncond_j Hinv_j; move: (FOR_INT_ADD_LT.inv_outP _ _ _ _ _ Hncond_j Hinv_j);
        [by rewrite //=; apply expr_gt0|move => ->> /=].
        move => {Hncond_j Hinv_j}.
        rewrite mulzK ?expf_eq0 //=.
        rewrite -divzpMr; first by apply dvdz_exp2l; smt(mem_range).
        rewrite divz_pow //=; first by smt(mem_range).
        rewrite mulNr opprD /= (addzC (-k)).
        rewrite -exprD_subz //; [by smt(mem_range)|rewrite addrAC /=].
        rewrite -exprSr; first by smt(mem_range).
        rewrite (IntID.addrAC _ (-k)) mulrDl /=.
        move => IHstart_past IHj_past_even IHj_past_odd IHj_future IHstart_future.
        (*TODO: the second /= does not seem to simplify the second goal.*)
        apply/all_range_2_max => /=; first by smt(mem_range).
        rewrite /= IHj_past_odd /=.
        apply/all_range_2_max => /=; first by smt(mem_range).
        by trivial.
      skip.
      move => |> &hr.
      move => Hcond_len Hinv_len; move: (FOR_NAT_MUL_LE.inv_loopP _ _ _ _ _ Hcond_len Hinv_len) => //= [k [Hk_range ->>]].
      rewrite (FOR_NAT_MUL_LE.inv_loop_post _ _ _ _ _ Hcond_len Hinv_len) //=.
      rewrite FOR_INT_ADD_LT.inv_in //=.
      move => {Hcond_len Hinv_len}.
      rewrite -exprSr; first by smt(mem_range).
      do 3!(rewrite divz_pow //=; first by smt(mem_range)).
      rewrite opprD (addzC (-k)) /=.
      move => IHlen.
      do!split.
      - by apply all_range_2_empty.
      move => r start.
      move => Hncond_start Hinv_start; move: (FOR_INT_ADD_LT.inv_outP _ _ _ _ _ Hncond_start Hinv_start) => //= ->>.
      move => {Hncond_start Hinv_start}.
      rewrite lezNgt expr_gt0 //=.
      by rewrite -exprSr; first by smt(mem_range).
    skip.
    move => |>.
    rewrite FOR_NAT_MUL_LE.inv_in //=.
    do!split.
    + apply all_range_2_max => //=; split; last by apply all_range_2_empty.
      apply/allP => x xinrange; rewrite /partial_ntt_spec /partial_ntt /=.
      by rewrite BAdd.big_ltn // BAdd.big_geq //= addr0 bitrev_0 expr0 mul1r.
    move => len r.
    by move => Hncond_len Hinv_len; move: (FOR_NAT_MUL_LE.inv_outP _ _ _ _ _ Hncond_len Hinv_len).
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
        skip => |> &hr2 zetasctr k le0k ltk8 Hinv Hzetasctr Hcond.
        rewrite Hzetasctr /= => _ _ _.
        rewrite FOR_INT_ADD_LT.inv_loop_post //=; first by apply mulr_gt0 => //; apply expr_gt0.
        rewrite divzDr ?dvdzz // divzz addzA -Hzetasctr /b2i.
        have -> //=: 2 ^ k * 2 <> 0.
        by apply gtr_eqF; apply mulr_gt0 => //; apply expr_gt0.
      skip => |> &hr2 k le0k ltk8 Hzetasctr le22powk; do!split.
      - by rewrite FOR_INT_ADD_LT.inv_in //=; apply mulr_gt0 => //; apply expr_gt0.
      move => start zetasctr Hncond _ Hinv ->; split.
      - exists (k-1); do!split => //=.
        * by apply ler_subr_addr; apply ltzE; move: le0k => /le0r [->>|].
        * by move: ltk8 => /ltzW lek8 _; apply ltzE; rewrite -addzA.
        by apply Montgomery.pow_div1; move: le0k => /le0r [->>|].
      rewrite (FOR_INT_ADD_LT.inv_outP _ _ _ _ _ Hncond Hinv) //=; first by apply/mulr_gt0 => //; apply expr_gt0.
      rewrite /out /= mulzK; first by apply gtr_eqF; apply mulr_gt0 => //; apply expr_gt0.
      rewrite (mulzC (2 ^ k) 2) Montgomery.div_mul //= dvdNdiv; first by apply/gtr_eqF/expr_gt0.
      - by move : (dvdz_exp2l 2 k 7) => /= Hdiv; apply Hdiv; rewrite le0k -ltzS.
      rewrite opprK -(divzMpr 2 128 (_ %/ _)) //= divzK.
      - move: (ilog_mono 2 _ _ _ _ le22powk); rewrite //= ilog_powK //= => le1k.
        by move: (dvdz_exp2l 2 1 k); rewrite le1k.
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
          (*TODO: match order between pRHL, pHL and HL.*)
          by move => Hinv_j Hcond_j; move: (FOR_INT_ADD_LT.inv_loop_post _ _ _ _ _ Hcond_j Hinv_j).
        skip => |> &hr2 le0len ltstart256; split.
        + by apply FOR_INT_ADD_LT.inv_in.
        move => j _.
        move => Hncond Hinv.
        rewrite (FOR_INT_ADD_LT.inv_outP _ _ _ _ _ Hncond Hinv) //=.
        by smt(mem_range).
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
