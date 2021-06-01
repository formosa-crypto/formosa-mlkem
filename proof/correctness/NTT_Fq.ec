require import AllCore IntDiv Array256 Array128.
require import List Ring StdOrder IntMin.
require import List_extra Ring_extra RealExp_extra IntDiv_extra For BitEncoding_extra.
require import List_hakyber IntDiv_hakyber.
require import Fq.

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
    type  CR.t     <= t,
      op  CR.zeror <= Domain.zeror,
      op  CR.oner  <= Domain.oner,
      op  CR.(+)   <= Domain.(+),
      op  CR.([-]) <= Domain.([-]),
      op  CR.( * ) <= Domain.( * ),
      op  CR.invr  <= Domain.invr,
    pred  CR.unit  <= Domain.unit
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
    type  ZR.t     <= t,
      op  size     <= n,
      op  ZR.zeror <= Domain.zeror,
      op  ZR.oner  <= Domain.oner,
      op  ZR.(+)   <= Domain.(+),
      op  ZR.([-]) <= Domain.([-]),
      op  ZR.( * ) <= Domain.( * ),
      op  ZR.invr  <= Domain.invr,
    pred  ZR.unit  <= Domain.unit
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

  clone import Bigalg.BigComRing as BigZmod with
    type  CR.t        <- zmod,
      op  CR.zeror <- ZModField.zero,
      op  CR.oner  <- ZModField.one,
      op  CR.(+)   <- ZModField.(+),
      op  CR.([-]) <- ZModField.([-]),
      op  CR.( * ) <- ZModField.( * ),
      op  CR.invr  <- ZModField.inv,
    pred  CR.unit  <- ZModField.unit.

  op zeta1 = ZModpRing.ofint 17.

  lemma ofintSz i : ofint (i + 1) = ZModField.one + ofint i.
  proof. by rewrite /ofint mulrSz. qed.

  lemma addr_int m n : 0 <= m => ofint m + ofint n = ofint (m + n).
  proof.
    elim m => /=; first by rewrite ofint0 add0r.
    move => m le0m; rewrite ofintSz -addrA => ->.
    by rewrite -addrAC ofintSz.
  qed.

  lemma addr_intz m n : ofint m + ofint n = ofint (m + n).
  proof.
    case (0 <= m) => [le0m|/ltrNge ltm0]; first by apply addr_int.
    rewrite -(oppzK m) -(oppzK n) -!opprD !(ofintN (-_)%Int) -opprD.
    rewrite addr_int; first by apply/ltzW/oppr_gt0.
    by rewrite -!ofintN !opprD !opprK.
  qed.

  lemma mulr_int m n : 0 <= m => ofint m * ofint n = ofint (m * n).
  proof.
    elim m => /=; first by rewrite ofint0 mul0r.
    move => m le0m; rewrite mulrDl /= -!addr_intz.
    by rewrite mulrDl ofint1 mul1r => ->.
  qed.

  lemma mulr_intz m n : ofint m * ofint n = ofint (m * n).
  proof.
    case (0 <= m) => [le0m|/ltrNge ltm0]; first by apply mulr_int.
    rewrite -(oppzK m) !mulNr !(ofintN (-_)%Int) mulNr.
    rewrite mulr_int; first by apply/ltzW/oppr_gt0.
    by rewrite mulNr.
  qed.

  lemma exp_ofint m n : 0 <= n => exp (ofint m) n = ofint (exp m n).
  proof.
    elim n => /=; first by rewrite !expr0 ofint1.
    move => n le0n; rewrite !exprD_nneg // => ->.
    by rewrite !expr1 mulr_intz.
  qed.

  (*TODO: specify in the clone of ZModpRing*)
  lemma eq_ofint_3329_0 : ofint 3329 = ZModField.zero.
  proof. admit. qed.

  lemma modz_ofint m d : ofint d = ZModField.zero => ofint m = ofint (m %% d).
  proof.
    rewrite {1}(divz_eq m d) -addr_intz -mulr_intz => ->.
    by rewrite mulr0 add0r.
  qed.

  lemma exp_zeta1_128 : exp zeta1 128 = -ZModField.one.
  proof.
    rewrite exp_ofint //= expr0 /= -ofint1 -ofintN.
    by rewrite (modz_ofint _ _ eq_ofint_3329_0) (modz_ofint (-1) _ eq_ofint_3329_0).
  qed.

  lemma exp_zeta1_256 : exp zeta1 256 = ZModField.one.
  proof.
    rewrite exp_ofint //= expr0 /= -ofint1.
    by rewrite (modz_ofint _ _ eq_ofint_3329_0).
  qed.

  lemma dvdz_exp (x : zmod) (m d : int) : d %| m => exp x d = ZModField.one => exp x m = ZModField.one.
  proof. by move => /dvdzP [q ->>]; rewrite mulrC exprM => ->; rewrite expr1z. qed.

  op zetasctr_ntt5 len start = (start * 2 + 1) * (64 %/ len).

  lemma zetasctr_ntt5_ge0 len start :
    0 <= len =>
    0 <= start =>
    0 <= zetasctr_ntt5 len start.
  proof.
    move => le0len le0start; rewrite /zetasctr_ntt5.
    apply/mulr_ge0; first by apply/addr_ge0 => //; apply mulr_ge0.
    by move: le0len => [lt0len|//=]; apply/divz_ge0.
  qed.

  module NTT5 = {
    proc ntt(r : zmod Array256.t) : zmod Array256.t = {
      var len, start, j, zetasctr;
      var t, zeta_;

      zetasctr <- 0;
      len <- 1;
      while (len <= 64) {
       start <- 0;
       while(start < len) {
          zetasctr <- zetasctr_ntt5 len start;
          zeta_ <- exp zeta1 zetasctr;
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

  module NTT4 = {
    proc ntt(r : zmod Array256.t) : zmod Array256.t = {
      var len, start, j, zetasctr;
      var t, zeta_;

      zetasctr <- 0;
      len <- 128;
      while (2 <= len) {
        start <- 0;
        while(start < 256) {
          zetasctr <- bitrev 8 ((256 %/ len) + (start %/ len));
          zeta_ <- exp zeta1 zetasctr;
          j <- 0;
          while (j < len) {
            t <- zeta_ * r.[j + len + start];
            r.[j + len + start] <- r.[j + start] + (-t);
            r.[j + start]       <- r.[j + start] + t;
            j <- j + 1;
          }
          start <- start + (len * 2);
        }
        len <- len %/ 2;
      }     
      return r;
    }
  }.

  module NTT3 = {
    proc ntt(r : zmod Array256.t,  zetas : zmod Array128.t) : zmod Array256.t = {
      var len, start, j, zetasctr;
      var t, zeta_;

      zetasctr <- 0;
      len <- 128;
      while (2 <= len) {
        start <- 0;
        while(start < 256) {
          zetasctr <- (128 %/ len) + (start %/ (len * 2));
          zeta_ <- zetas.[zetasctr]; 
          j <- 0;
          while (j < len) {
            t <- zeta_ * r.[j + len + start];
            r.[j + len + start] <- r.[j + start] + (-t);
            r.[j + start]       <- r.[j + start] + t;
            j <- j + 1;
          }
          start <- start + (len * 2);
        }
        len <- len %/ 2;
      }     
      return r;
    }
  }.

  module NTT2 = {
    proc ntt(r : zmod Array256.t,  zetas : zmod Array128.t) : zmod Array256.t = {
      var len, start, j, zetasctr;
      var t, zeta_;

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
  }.

  module NTT1 = {
    proc ntt(r : zmod Array256.t,  zetas : zmod Array128.t) : zmod Array256.t = {
      var len, start, j, zetasctr;
      var t, zeta_;

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
  }.

  module NTT = {
    proc ntt(r : zmod Array256.t,  zetas : zmod Array128.t) : zmod Array256.t = {
      var len, start, j, zetasctr;
      var t, zeta_;

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
  }.

  (*Proof not done and ugly, two lemmas might be useful:*)
  (*- one that gives a postcondition when the loop being adressed is a for loop*)
  (*- another that does the same for the specific for loops that always write on different parts of the memory that is described in the postcondition (the two innermost loops in our case)*)

  abbrev set2_add_mulr (p : zmod Array256.t, z : zmod, a b : int) =
    (p.[b <- p.[a] + - z * p.[b]].[a <- p.[b <- p.[a] + - z * p.[b]].[a] + z * p.[b]])%CR.

  (*TODO: this lemma's version in Jasmin has a useless hypothesis.*)
  lemma nosmt set_neqiE (t : zmod Array256.t) x y a :
    y <> x => t.[x <- a].[y] = t.[y].
  proof. by rewrite get_set_if => /neqF ->. qed.

  lemma set2_add_mulr_eq1iE (p : zmod Array256.t, z : zmod, a b x : int) :
    a <> b =>
    a \in range 0 256 =>
    x = a =>
    (set2_add_mulr p z a b).[x] = (p.[a] + z * p.[b])%CR.
  proof. by move => ? /mem_range ? ?; rewrite set_eqiE ?set_neqiE. qed.

  lemma set2_add_mulr_eq2iE (p : zmod Array256.t, z : zmod, a b x : int) :
    a <> b =>
    b \in range 0 256 =>
    x = b =>
    (set2_add_mulr p z a b).[x] = (p.[a] + - z * p.[b])%CR.
  proof. by move => ? /mem_range ? eqxb; rewrite set_neqiE ?set_eqiE // eqxb eq_sym. qed.

  lemma set2_add_mulr_neqiE (p : zmod Array256.t, z : zmod, a b x : int) :
    x <> a =>
    x <> b =>
    (set2_add_mulr p z a b).[x] = p.[x].
  proof. by move => ? ?; rewrite !set_neqiE. qed.

  abbrev index (len start bsj : int) = bitrev 8 (bsj * len + start).

  lemma index_range (k start bsj : int) :
    k \in range 0 8 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (8 - k)) =>
    bsj * (2 ^ k) + start \in range 0 256.
  proof.
    move => /mem_range [? ?] Hstart_range Hbsj_range.
    move: (range_mul_add _ _ _ _ _ Hbsj_range Hstart_range) => /=.
    apply range_incl => //.
    by rewrite -exprD_nneg -?addrA ?subr_ge0 //= ltzW.
  qed.

  lemma index_range_k (k start bsj : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (8 - k)) =>
    bsj * (2 ^ k) + start \in range 0 256.
  proof. by move => Hk_range; apply index_range; move: Hk_range; apply range_incl. qed.

  lemma index_range_incr_k (k start bsj : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ (k + 1)) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    bsj * (2 ^ (k + 1)) + start \in range 0 256.
  proof.
    move => Hk_range Hstart_range Hbsj_range; apply index_range => //.
    + by move: (range_add _ 1 _ _ Hk_range); apply range_incl.
    by rewrite opprD /= addrC.
  qed.

  lemma index_bijective (k start bsj x y : int) :
    k \in range 0 8 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (8 - k)) =>
    x \in range 0 (2 ^ k) =>
    y \in range 0 (2 ^ (8 - k)) =>
    index (2 ^ k) x y = index (2 ^ k) start bsj <=> (x = start) /\ (y = bsj).
  proof.
    move => Hk_range Hstart_range Hbsj_range Hx_range Hy_range.
    by rewrite bitrev_bijective //; [apply index_range|apply index_range|rewrite range_mul_add_eq].
  qed.

  lemma index_bijective_k (k start bsj x y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (8 - k)) =>
    x \in range 0 (2 ^ k) =>
    y \in range 0 (2 ^ (8 - k)) =>
    index (2 ^ k) x y = index (2 ^ k) start bsj <=> (x = start) /\ (y = bsj).
  proof. by move => Hk_range; apply index_bijective; move: Hk_range; apply range_incl. qed.

  lemma index_bijective_incr_k (k start bsj x y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ (k + 1)) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    x \in range 0 (2 ^ (k + 1)) =>
    y \in range 0 (2 ^ (7 - k)) =>
    index (2 ^ (k + 1)) x y = index (2 ^ (k + 1)) start bsj <=> (x = start) /\ (y = bsj).
  proof.
    move => Hk_range Hstart_range Hbsj_range Hx_range Hy_range; apply index_bijective => //.
    + by move: (range_add _ 1 _ _ Hk_range); apply range_incl.
    + by rewrite opprD /= addrC.
    by rewrite opprD /= addrC.
  qed.

  lemma index_bijective_incr_k_start (k start bsj x y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    x \in range 0 (2 ^ (k + 1)) =>
    y \in range 0 (2 ^ (7 - k)) =>
    index (2 ^ (k + 1)) x y = index (2 ^ (k + 1)) start bsj <=> (x = start) /\ (y = bsj).
  proof.
    move => Hk_range Hstart_range; apply index_bijective_incr_k => //.
    move: Hstart_range; apply range_incl => //.
    apply ler_weexpn2l => //; split; first by move/mem_range: Hk_range.
    by move => _; apply/ltzW/ltzS.
  qed.

  lemma index_bijective_incr_k_len_start (k start bsj x y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    x \in range 0 (2 ^ (k + 1)) =>
    y \in range 0 (2 ^ (7 - k)) =>
    index (2 ^ (k + 1)) x y = index (2 ^ (k + 1)) ((2 ^ k) + start) bsj <=>
    (x = (2 ^ k) + start) /\ (y = bsj).
  proof.
    move => Hk_range Hstart_range Hbsj_range Hx_range Hy_range; apply index_bijective_incr_k => //.
    rewrite (addzC _ start); move: (range_add _ (2 ^ k) _ _ Hstart_range); apply range_incl => //=.
    + by apply expr_ge0.
    by rewrite addr_double -exprSr //; move/mem_range: Hk_range.
  qed.

  op exponent (len start x : int) = (2 * start + 1) * (bitrev 8 (2 * (x %% len))).

  lemma exponent_0 : exponent 1 0 0 = 0.
  proof. by rewrite /exponent /= bitrev0. qed.

  lemma exponent_ge0 len start x :
    0 <= start =>
    0 <= exponent len start x.
  proof.
    move => le0start; apply/mulr_ge0; first by apply/addr_ge0 => //; apply/mulr_ge0.
    (*TODO: Pierre-Yves*)
    (*by move/mem_range: (bitrev_range 8 (2 * (x %% len))).*)
    by apply bitrev_ge0.
  qed.

  lemma exponent_spec_00 (k start x : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    x \in range 0 (2 ^ k) =>
    exp zeta1 (exponent (2 ^ k) start x) =
    exp zeta1 (exponent (2 ^ (k + 1)) start x).
  proof.
    move => Hk_range Hstart_range Hx_range.
    rewrite /exponent !modz_small // -mem_range normrX_nat //=.
    + by move/mem_range: Hk_range.
    + by apply/addr_ge0 => //; move/mem_range: Hk_range.
    move: Hx_range; apply range_incl => //=.
    (*TODO: why is `|2| still here, and why does it not matter?*)
    apply/ler_weexpn2l => //; split; first by move/mem_range: Hk_range.
    by move => _; apply/ltzW/ltzS.
  qed.

  lemma exponent_spec_01 (k start x : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    x \in range 0 (2 ^ k) =>
    exp zeta1 (zetasctr_ntt5 (2 ^ k) start + exponent (2 ^ k) start x) =
    exp zeta1 (exponent (2 ^ (k + 1)) start (2 ^ k + x)).
  proof.
    move => Hk_range Hstart_range Hx_range.
    rewrite /exponent !modz_small // -?mem_range ?normrX_nat //=.
    + by move/mem_range: Hk_range.
    + by apply/addr_ge0 => //; move/mem_range: Hk_range.
    + rewrite (IntID.addrC _ x); move: (range_add _ (2 ^ k) _ _ Hx_range) => /=.
      rewrite addr_double -exprSr; first by move/mem_range: Hk_range.
      by apply range_incl => //=; apply expr_ge0.
    rewrite mulrDr -exprS; first by move/mem_range: Hk_range.
    rewrite /zetasctr_ntt5 (IntID.mulrC _ 2) -mulrDr.
    do 2!congr.
    move: (range_mul _ _ _ 2 _ Hx_range) => //= {Hx_range} Hx_range.
    move: (range_incl _ _ _ 0 (2 ^ (k + 1)) _ _ Hx_range) => // {Hx_range}.
    + by rewrite mulrDl /= ltzW ltzE /= exprSr //; move/mem_range: Hk_range.
    rewrite (IntID.mulrC _ 2) => Hx_range.
    rewrite divz_pow //=; first by rewrite -(ltzS _ 6) /= -mem_range.
    move: (bitrev_add _ 8 _ 1 _ Hx_range) => /=.
    + by split; [apply/addr_ge0 => //|move => _; apply/ltzW/ltr_subr_addr]; move/mem_range: Hk_range => //.
    rewrite (addzC (_ * _)%Int) (addzC (bitrev _ _)%Int) bitrev1 //= => ->.
    rewrite divz_pow //=.
    + by split; [apply/addr_ge0 => //|move => _; apply/ltzE]; move/mem_range: Hk_range => //.
    by rewrite opprD addrA IntID.addrAC.
  qed.

  lemma exponent_spec_10 (k start x : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    x \in range 0 (2 ^ k) =>
    exp zeta1 (exponent (2 ^ k) start x) =
    exp zeta1 (exponent (2 ^ (k + 1)) (2 ^ k + start) x).
  proof.
    move => Hk_range Hstart_range Hx_range.
    rewrite /exponent !modz_small // -?mem_range ?normrX_nat //=.
    + by move/mem_range: Hk_range.
    + by apply/addr_ge0 => //; move/mem_range: Hk_range.
    + move: Hx_range; apply range_incl => //=.
      apply/ler_weexpn2l => //; split; first by move/mem_range: Hk_range.
      by move => _; apply/ltzW/ltzS.
    rewrite mulrDr -exprS; first by move/mem_range: Hk_range.
    rewrite -addrA (IntID.mulrDl (2 ^ (k + 1))).
    rewrite exprD_nneg.
    + by apply/mulr_ge0; [apply/expr_ge0|apply/bitrev_ge0].
    + by apply/mulr_ge0; [apply/addr_ge0 => //; apply/mulr_ge0 => //; move/mem_range: Hstart_range|apply/bitrev_ge0].
    rewrite (dvdz_exp _ (_ ^ _ * _)%IntID _ _ exp_zeta1_256) ?mul1r //.
    move: (dvdz_mul (2 ^ (k + 1)) (2 ^ (7 - k)) (2 ^ (k + 1)) (bitrev 8 (2 * x))).
    rewrite -exprD_nneg.
    + by apply/addr_ge0 => //; move/mem_range: Hk_range.
    + by apply/subr_ge0/ltzW; move/mem_range: Hk_range.
    rewrite addrA /= addrAC /= => -> //; first by apply dvdzz.
    rewrite mulrC.
    move: (range_mul _ _ _ 2 _ Hx_range) => //= {Hx_range} Hx_range.
    move: (range_incl _ _ _ 0 (2 ^ (k + 1)) _ _ Hx_range) => // {Hx_range}; last move => Hx_range.
    + by rewrite mulrDl /= ltzW ltzE /= exprSr //; move/mem_range: Hk_range.
    apply bitrev_range_dvdz; last by rewrite opprD addrA /= (addzC 1).
    by split; [apply/subr_ge0/ltzW|move => _; apply/ler_subl_addl/ler_subl_addr/ltzW/ltzE]; move/mem_range: Hk_range.
  qed.

  lemma exponent_spec_11 (k start x : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    x \in range 0 (2 ^ k) =>
    exp zeta1 (128 + zetasctr_ntt5 (2 ^ k) start + exponent (2 ^ k) start x) =
    exp zeta1 (exponent (2 ^ (k + 1)) (2 ^ k + start) (2 ^ k + x)).
  proof.
    move => Hk_range Hstart_range Hx_range.
    rewrite /exponent !modz_small // -?mem_range ?normrX_nat //=.
    + by move/mem_range: Hk_range.
    + by apply/addr_ge0 => //; move/mem_range: Hk_range.
    + rewrite (IntID.addrC _ x); move: (range_add _ (2 ^ k) _ _ Hx_range) => /=.
      rewrite addr_double -exprSr; first by move/mem_range: Hk_range.
      by apply range_incl => //=; apply expr_ge0.
    do 2!(rewrite mulrDr -exprS; first by move/mem_range: Hk_range).
    rewrite /zetasctr_ntt5 (IntID.mulrC _ 2) -addrA -mulrDr.
    rewrite -addrA (IntID.mulrDl _ _ (bitrev _ _)).
    rewrite divz_pow //=; first by rewrite -(ltzS _ 6) /= -mem_range.
    rewrite exprD_nneg //.
    + by apply/mulr_ge0; apply addr_ge0 => //; [apply/mulr_ge0 => //; move/mem_range: Hstart_range|apply/expr_ge0|apply/bitrev_ge0].
    rewrite exprD_nneg //.
    + by apply/mulr_ge0; [apply/expr_ge0|apply/bitrev_ge0].
    + by apply/mulr_ge0; [apply addr_ge0 => //; apply/mulr_ge0 => //; move/mem_range: Hstart_range|apply/bitrev_ge0].
    move: (range_mul _ _ _ 2 _ Hx_range) => //= {Hx_range} Hx_range.
    move: (range_incl _ _ _ 0 (2 ^ (k + 1)) _ _ Hx_range) => // {Hx_range}.
    + by rewrite mulrDl /= ltzW ltzE /= exprSr //; move/mem_range: Hk_range.
    rewrite (IntID.mulrC _ 2) => Hx_range.
    congr.
    + move: (bitrev_add _ 8 _ 1 _ Hx_range) => /=.
      - by split; [apply/addr_ge0 => //|move => _; apply/ltzW/ltr_subr_addr]; move/mem_range: Hk_range => //.
      rewrite (addzC (_ * _)%Int) (addzC (bitrev _ _)%Int) bitrev1 //= => ->.
      rewrite mulrDr divz_pow //=.
      - by split; [apply/addr_ge0 => //|move => _; apply/ltzE]; move/mem_range: Hk_range => //.
      rewrite -IntID.exprD_nneg.
      - by apply/addr_ge0 => //; move/mem_range: Hk_range.
      - by apply/subr_ge0/ltzE; move/mem_range: Hk_range.
      rewrite opprD !addrA /= addrAC /= addrAC /=.
      rewrite exprD_nneg //.
      - by apply/mulr_ge0 => //; [apply/expr_ge0|apply/bitrev_ge0].
      rewrite !exp_zeta1_128 mulNr mul1r eq_sym; congr.
      apply (dvdz_exp _ _ _ _ exp_zeta1_256).
      move: (dvdz_mul (2 ^ (k + 1)) (2 ^ (7 - k)) (2 ^ (k + 1)) (bitrev 8 (2 * x))).
      rewrite -IntID.exprD_nneg.
      - by apply/addr_ge0; move/mem_range: Hk_range.
      - by apply/subr_ge0/ltzW; move/mem_range: Hk_range.
      rewrite dvdzz !addrA /= addrAC /= => -> //.
      apply bitrev_range_dvdz => //.
      - by split; [apply/subr_ge0/ltzW|move => _; apply/ler_subr_addr/ler_subl_addl/ltzW/ltzE]; move/mem_range: Hk_range.
      by rewrite opprD IntID.addrCA /= addrC.
    do 2!congr.
    move: (bitrev_add _ 8 _ 1 _ Hx_range) => /=.
    + by split; [apply/addr_ge0 => //|move => _; apply/ltzW/ltr_subr_addr]; move/mem_range: Hk_range => //.
    rewrite (addzC (_ * _)%Int) (addzC (bitrev _ _)%Int) bitrev1 //= => ->.
    rewrite divz_pow //=.
    + by split; [apply/addr_ge0 => //|move => _; apply/ltzE]; move/mem_range: Hk_range => //.
    by rewrite opprD addrA addrAC.
  qed.

  op partial_ntt (p : zmod Array256.t, len start bsj : int) =
  BAdd.bigi
    predT
    (fun s =>
      (exp zeta1 (exponent len start s)) *
      p.[index len s bsj])
    0 len.

  op partial_ntt_spec (r p : zmod Array256.t, len start bsj : int) =
    r.[index len start bsj] = partial_ntt p len start bsj.

  lemma partial_ntt_spec_k_neqxiE (r p : zmod Array256.t, k start bsj x y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    x \in range 0 (2 ^ k) =>
    y \in range 0 (2 ^ (8 - k)) =>
    x <> start =>
    partial_ntt_spec r p (2 ^ k) x y =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
      p (2 ^ k) x y.
  proof.
    move => Hk_range Hstart_range Hbsj_range Hx_range Hy_range neqxstart.
    rewrite /partial_ntt_spec /= => <-.
    rewrite exprS ?mulrA; first by move/mem_range: Hk_range.
    rewrite set2_add_mulr_neqiE //.
    + rewrite index_bijective_k => //.
      - move: (range_mul_add _ 0 _ _ 2 Hbsj_range _); first by apply/mem_range.
        apply range_incl => //=.
        rewrite -exprSr; first by apply/subr_ge0/ltzW; move/mem_range: Hk_range.
        by rewrite addrAC.
      by rewrite negb_and; left.
    rewrite addrA -mulrD1l.
    rewrite index_bijective_k => //.
    + move: (range_mul_add _ 1 _ _ 2 Hbsj_range _); first by apply/mem_range.
      apply range_incl => //=.
      rewrite -exprSr; first by apply/subr_ge0/ltzW; move/mem_range: Hk_range.
      by rewrite addrAC.
    by rewrite negb_and; left.
  qed.

  lemma partial_ntt_spec_k_neqyiE (r p : zmod Array256.t, k start bsj x y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    x \in range 0 (2 ^ k) =>
    y \in range 0 (2 ^ (8 - k)) =>
    y <> bsj * 2 =>
    y <> bsj * 2 + 1 =>
    partial_ntt_spec r p (2 ^ k) x y =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
      p (2 ^ k) x y.
  proof.
    move => Hk_range Hstart_range Hbsj_range Hx_range Hy_range neqybsj2 neqybsj21.
    rewrite /partial_ntt_spec /= => <-.
    rewrite exprS ?mulrA; first by move/mem_range: Hk_range.
    rewrite set2_add_mulr_neqiE //.
    + rewrite index_bijective_k => //.
      - move: (range_mul_add _ 0 _ _ 2 Hbsj_range _); first by apply/mem_range.
        apply range_incl => //=.
        rewrite -exprSr; first by apply/subr_ge0/ltzW; move/mem_range: Hk_range.
        by rewrite addrAC.
      by rewrite negb_and; right.
    rewrite addrA -mulrD1l.
    rewrite index_bijective_k => //.
    + move: (range_mul_add _ 1 _ _ 2 Hbsj_range _); first by apply/mem_range.
      apply range_incl => //=.
      rewrite -exprSr; first by apply/subr_ge0/ltzW; move/mem_range: Hk_range.
      by rewrite addrAC.
    by rewrite negb_and; right.
  qed.

  lemma partial_ntt_spec_incr_k_neqxiE (r p : zmod Array256.t, k start bsj x y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    x \in range 0 (2 ^ (k + 1)) =>
    y \in range 0 (2 ^ (7 - k)) =>
    x <> start =>
    x <> (2 ^ k) + start =>
    partial_ntt_spec r p (2 ^ (k + 1)) x y =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
      p (2 ^ (k + 1)) x y.
  proof.
    move => Hk_range Hstart_range Hbsj_range Hx_range Hy_range neqxstart neqxlenstart.
    rewrite /partial_ntt_spec /= => <-.
    rewrite set2_add_mulr_neqiE //.
    + rewrite index_bijective_incr_k_start => //.
      by rewrite negb_and; left.
    rewrite index_bijective_incr_k_len_start => //.
    by rewrite negb_and; left.
  qed.

  lemma partial_ntt_spec_incr_k_neqyiE (r p : zmod Array256.t, k start bsj x y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    x \in range 0 (2 ^ (k + 1)) =>
    y \in range 0 (2 ^ (7 - k)) =>
    y <> bsj =>
    partial_ntt_spec r p (2 ^ (k + 1)) x y =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
      p (2 ^ (k + 1)) x y.
  proof.
    move => Hk_range Hstart_range Hbsj_range Hx_range Hy_range neqybsj.
    rewrite /partial_ntt_spec /= => <-.
    rewrite set2_add_mulr_neqiE //.
    + rewrite index_bijective_incr_k_start => //.
      by rewrite negb_and; right.
    rewrite index_bijective_incr_k_len_start => //.
    by rewrite negb_and; right.
  qed.

  lemma IHstart_past_0 (r p : zmod Array256.t, k start bsj x y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    x \in range 0 start =>
    y \in range 0 (2 ^ (7 - k)) =>
    partial_ntt_spec r p (2 ^ (k + 1)) x y =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
      p (2 ^ (k + 1)) x y.
  proof.
    move => Hk_range Hstart_range Hbsj_range Hx_range Hy_range.
    apply partial_ntt_spec_incr_k_neqxiE => //.
    + move: Hx_range; apply range_incl => //.
      apply/(lez_trans (2 ^ k)); first by apply/ltzW; move/mem_range: Hstart_range.
      apply ler_weexpn2l => //; split; first by move/mem_range: Hk_range.
      by move => _; apply/ltzW/ltzS.
    + by apply/ltr_eqF; move/mem_range: Hx_range.
    by apply/ltr_eqF/ltr_paddl; [apply expr_ge0|move/mem_range: Hx_range].
  qed.

  lemma IHstart_past_1 (r p : zmod Array256.t, k start bsj x y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    x \in range (2 ^ k) (2 ^ k + start) =>
    y \in range 0 (2 ^ (7 - k)) =>
    partial_ntt_spec r p (2 ^ (k + 1)) x y =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
      p (2 ^ (k + 1)) x y.
  proof.
    move => Hk_range Hstart_range Hbsj_range Hx_range Hy_range.
    apply partial_ntt_spec_incr_k_neqxiE => //.
    + move: Hx_range; apply range_incl => //; first by apply expr_ge0.
      rewrite (addzC _ start); apply/ltzW.
      move/mem_range: (range_add _ (2 ^ k) _ _ Hstart_range) => [_].
      by rewrite addr_double -exprSr //; move/mem_range: Hk_range.
    + apply/gtr_eqF/(ltr_le_trans (2 ^ k));first by move/mem_range: Hstart_range.
      by move/mem_range: Hx_range.
    by apply/ltr_eqF; move/mem_range: Hx_range.
  qed.

  lemma IHj_past_0 (r p : zmod Array256.t, k start bsj y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    y \in range 0 bsj =>
    partial_ntt_spec r p (2 ^ (k + 1)) start y =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
      p (2 ^ (k + 1)) start y.
  proof.
    move => Hk_range Hstart_range Hbsj_range Hy_range.
    apply partial_ntt_spec_incr_k_neqyiE => //.
    + move: Hstart_range; apply range_incl => //.
      apply ler_weexpn2l => //; split; first by move/mem_range: Hk_range.
      by move => _; apply/ltzW/ltzS.
    + move: Hy_range; apply range_incl => //.
      by apply/ltzW; move/mem_range: Hbsj_range.
    by apply/ltr_eqF; move/mem_range: Hy_range.
  qed.

  lemma IHj_present_0 (r p : zmod Array256.t, k start bsj : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    partial_ntt_spec r p (2 ^ k) start (bsj * 2) =>
    partial_ntt_spec r p (2 ^ k) start (bsj * 2 + 1) =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
      p (2 ^ (k + 1)) start bsj.
  proof.
    move => Hk_range Hstart_range Hbsj_range.
    rewrite /partial_ntt_spec /=.
    rewrite set2_add_mulr_eq1iE => //.
    + rewrite index_bijective_incr_k_len_start //.
      - move: Hstart_range; apply range_incl => //.
        apply ler_weexpn2l => //; split; first by move/mem_range: Hk_range.
        by move => _; apply/ltzW/ltzS.
      by rewrite negb_and; left; apply/ltr_eqF/ltr_spaddl => //; apply/expr_gt0.
    + by have ->:= (bitrev_range 8).
    rewrite mulrDl -!mulrA /= -addrA.
    rewrite -exprS; first by move/mem_range: Hk_range.
    move => -> ->; rewrite /partial_ntt.
    rewrite BAdd.mulr_sumr /=.
    rewrite (BAdd.big_cat_int (2 ^ k) 0 (2 ^ (k + 1))); first by apply/expr_ge0.
    + apply ler_weexpn2l => //; split; first by move/mem_range: Hk_range.
      by move => _; apply/ltzW/ltzS.
    congr.
    + apply BAdd.eq_big_seq => x Hx_range /=.
      rewrite -mulrA -exprS; first by move/mem_range: Hk_range.
      congr.
      by apply exponent_spec_00.
    have ->: range (2 ^ k) (2 ^ (k + 1)) = map ((+)%Int (2 ^ k)) (range 0 (2 ^ k)).
    + by rewrite -Range.range_add /= addr_double exprSr //; move/mem_range: Hk_range.
    rewrite BAdd.big_mapT; apply BAdd.eq_big_seq => x Hx_range /=.
    rewrite /(\o) /= mulrA -exprD_nneg.
    + apply/zetasctr_ntt5_ge0; first by apply/expr_ge0.
      by move/mem_range: Hstart_range.
    + by apply/exponent_ge0; move/mem_range: Hstart_range.
    rewrite !mulrDl /= -!mulrA -!addrA -!exprS.
    + by move/mem_range: Hk_range.
    congr.
    by apply exponent_spec_01.
  qed.

  lemma IHj_present_1 (r p : zmod Array256.t, k start bsj : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    partial_ntt_spec r p (2 ^ k) start (bsj * 2) =>
    partial_ntt_spec r p (2 ^ k) start (bsj * 2 + 1) =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
      p (2 ^ (k + 1)) (2 ^ k + start) bsj.
  proof.
    move => Hk_range Hstart_range Hbsj_range.
    rewrite /partial_ntt_spec /=.
    rewrite set2_add_mulr_eq2iE => //.
    + rewrite index_bijective_incr_k_len_start //.
      - move: Hstart_range; apply range_incl => //.
        apply ler_weexpn2l => //; split; first by move/mem_range: Hk_range.
        by move => _; apply/ltzW/ltzS.
      by rewrite negb_and; left; apply/ltr_eqF/ltr_spaddl => //; apply/expr_gt0.
    + by have ->:= (bitrev_range 8).
    rewrite mulrDl -!mulrA /= -addrA.
    rewrite -exprS; first by move/mem_range: Hk_range.
    move => -> ->; rewrite /partial_ntt.
    rewrite BAdd.mulr_sumr /= BAdd.sumrN /=.
    rewrite (BAdd.big_cat_int (2 ^ k) 0 (2 ^ (k + 1))); first by apply/expr_ge0.
    + apply ler_weexpn2l => //; split; first by move/mem_range: Hk_range.
      by move => _; apply/ltzW/ltzS.
    congr.
    + apply BAdd.eq_big_seq => x Hx_range /=.
      rewrite -mulrA -exprS; first by move/mem_range: Hk_range.
      congr.
      by apply exponent_spec_10.
    have ->: range (2 ^ k) (2 ^ (k + 1)) = map ((+)%Int (2 ^ k)) (range 0 (2 ^ k)).
    + by rewrite -Range.range_add /= addr_double exprSr //; move/mem_range: Hk_range.
    rewrite BAdd.big_mapT; apply BAdd.eq_big_seq => x Hx_range /=.
    rewrite /(\o) /= mulrA -exprD_nneg.
    + apply/zetasctr_ntt5_ge0; first by apply/expr_ge0.
      by move/mem_range: Hstart_range.
    + by apply/exponent_ge0; move/mem_range: Hstart_range.
    rewrite !mulrDl /= -!mulrA -!addrA -!exprS.
    + by move/mem_range: Hk_range.
    rewrite -mulNr.
    congr.
    rewrite -(mul1r (_ _ (_ + _)%Int)) -mulNr -exp_zeta1_128 -exprD_nneg //.
    + apply/addr_ge0.
     - apply/zetasctr_ntt5_ge0; first by apply/expr_ge0.
        by move/mem_range: Hstart_range.
      by apply/exponent_ge0; move/mem_range: Hstart_range.
    rewrite addrA.
      by apply exponent_spec_11.
  qed.

  lemma IHj_past_1 (r p : zmod Array256.t, k start bsj y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    y \in range 0 bsj =>
    partial_ntt_spec r p (2 ^ (k + 1)) (2 ^ k + start) y =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
      p (2 ^ (k + 1)) (2 ^ k + start) y.
  proof.
    move => Hk_range Hstart_range Hbsj_range Hy_range.
    apply partial_ntt_spec_incr_k_neqyiE => //.
    + rewrite (addzC _ start).
      move: (range_add _ (2 ^ k) _ _ Hstart_range).
      apply range_incl => /=; first by apply expr_ge0.
      by rewrite addr_double -exprSr //; move/mem_range: Hk_range.
    + move: Hy_range; apply range_incl => //.
      by apply/ltzW; move/mem_range: Hbsj_range.
    by apply/ltr_eqF; move/mem_range: Hy_range.
  qed.

  lemma IHj_future (r p : zmod Array256.t, k start bsj y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    y \in range ((bsj + 1) * 2) (2 ^ (8 - k)) =>
    partial_ntt_spec r p (2 ^ k) start y =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
    p (2 ^ k) start y.
  proof.
    move => Hk_range Hstart_range Hbsj_range Hy_range.
    apply partial_ntt_spec_k_neqyiE => //.
    + move: Hy_range; apply range_incl => //.
      apply/mulr_ge0 => //; apply/addr_ge0 => //.
      by move/mem_range: Hbsj_range.
    + apply/gtr_eqF/ltzE/ltzW/ltzE; rewrite /= -mulrD1l.
      by move/mem_range: Hy_range.
    apply/gtr_eqF/ltzE; rewrite /= -mulrD1l.
    by move/mem_range: Hy_range.
  qed.

  lemma IHstart_future (r p : zmod Array256.t, k start bsj x y : int) :
    k \in range 0 7 =>
    start \in range 0 (2 ^ k) =>
    bsj \in range 0 (2 ^ (7 - k)) =>
    x \in range (start + 1) (2 ^ k) =>
    y \in range 0 (2 ^ (8 - k)) =>
    partial_ntt_spec r p (2 ^ k) x y =>
    partial_ntt_spec
      (set2_add_mulr r (exp zeta1 (zetasctr_ntt5 (2 ^ k) start)) (index (2 ^ (k + 1)) start bsj)
         (index (2 ^ (k + 1)) (2 ^ k + start) bsj))
    p (2 ^ k) x y.
  proof.
    move => Hk_range Hstart_range Hbsj_range Hx_range Hy_range.
    apply partial_ntt_spec_k_neqxiE => //.
    + move: Hx_range; apply range_incl => //.
      apply/addr_ge0 => //.
      by move/mem_range: Hstart_range.
    apply/gtr_eqF/ltzE.
    by move/mem_range: Hx_range.
  qed.

  lemma naiventt (p : zmod Array256.t) :
      hoare
        [NTT5.ntt :
        arg = (p) ==>
        all_range_2 (partial_ntt_spec res p 128) 0 128 0 2].
  proof.
    proc; sp.
    while (
      FOR_NAT_MUL_LE.inv 2 64 1 len /\
      all_range_2 (partial_ntt_spec r p len) 0 len 0 (256 %/ len)).
    + sp; wp => /=.
      while (
        FOR_INT_ADD_LT.inv 1 len 0 start /\
        all_range_2 (partial_ntt_spec r p (len * 2)) 0 start 0 (128 %/ len) /\
        all_range_2 (partial_ntt_spec r p (len * 2)) len (len + start) 0 (128 %/ len) /\
        all_range_2 (partial_ntt_spec r p len) start len 0 (256 %/ len)).
      - sp; wp.
        while (
          FOR_INT_ADD_LT.inv (len * 2) 256 0 j /\
          all_range_2 (partial_ntt_spec r p (len * 2)) 0 start 0 (128 %/ len) /\
          all_range_2 (partial_ntt_spec r p (len * 2)) len (len + start) 0 (128 %/ len) /\
          all_range (partial_ntt_spec r p (len * 2) start) 0 (j %/ (len * 2)) /\
          all_range (partial_ntt_spec r p (len * 2) (len + start)) 0 (j %/ (len * 2)) /\
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
          move: Hbsj_range.
          rewrite -exprSr; first by smt(mem_range).
          rewrite -!mulrD1l.
          do 2!(rewrite mulzK ?expf_eq0 //=).
          do 2!(rewrite -divzpMr; first by apply dvdz_exp2l; smt(mem_range)).
          rewrite -exprD_subz //; [by smt(mem_range)|rewrite addrAC /=].
          do 3!(rewrite divz_pow //=; first by smt(mem_range)).
          rewrite mulNr opprD /= (addzC (-k)) -!addrA.
          move => Hbsj_range Hstart_past_0 Hstart_past_1 Hj_past_0 Hj_past_1 Hj_future Hstart_future.
          rewrite all_range_min in Hj_future.
          + move: (range_mul_add _ 0 _ _ 2 Hbsj_range _); first by apply/mem_range.
            by move => /= /mem_range [_]; rewrite -exprSr /=; smt(mem_range).
          rewrite all_range_min in Hj_future.
          + move: (range_mul_add _ 1 _ _ 2 Hbsj_range _); first by apply/mem_range.
            by move => /= /mem_range [_]; rewrite -exprSr /=; smt(mem_range).
          move: Hj_future => [Hj_present_0 [Hj_present_1 Hj_future]].
          rewrite /= -mulrD1l in Hj_future.
          do!split.
          + move : Hstart_past_0.
            apply all_range_imp => y Hy_range /=; apply all_range_imp => x Hx_range /=.
            by apply IHstart_past_0.
          + move : Hstart_past_1.
            apply all_range_imp => y Hy_range /=; apply all_range_imp => x Hx_range /=.
            by apply IHstart_past_1.
          + apply all_range_max; first by apply ltzS; move/mem_range: Hbsj_range.
            split => /=.
            - move : Hj_present_0 Hj_present_1.
              by apply IHj_present_0.
            move : Hj_past_0.
            apply all_range_imp => y Hy_range /=.
            by apply IHj_past_0.
          + apply all_range_max; first by apply ltzS; move/mem_range: Hbsj_range.
            split => /=.
            - move : Hj_present_0 Hj_present_1.
              by apply IHj_present_1.
            move : Hj_past_1.
            apply all_range_imp => y Hy_range /=.
            by apply IHj_past_1.
          + move : Hj_future.
            apply all_range_imp => y Hy_range /=.
            by apply IHj_future.
          move : Hstart_future.
          apply all_range_imp => y Hy_range /=; apply all_range_imp => x Hx_range /=.
          by apply IHstart_future.
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
        move => Hstart_past_0 Hstart_past_1 Hstart_future.
        do!split.
        * by apply all_range_empty.
        * by apply all_range_empty.
        * (*TODO: why can't I just apply the view all_range_min? Use rewrite.*)
          (*move: IHstart_future => /all_range_2_min.*)
          by move: Hstart_future; rewrite all_range_2_min /=; first by smt(mem_range).
        * by move: Hstart_future; rewrite all_range_2_min /=; first by smt(mem_range).
        move => j r.
        (*TODO: the order here seems reversed...*)
        move => {Hstart_past_0 Hstart_past_1 Hstart_future}.
        move => Hncond_j Hinv_j; move: (FOR_INT_ADD_LT.inv_outP _ _ _ _ _ Hncond_j Hinv_j);
        [by rewrite //=; apply expr_gt0|move => ->> /=].
        move => {Hncond_j Hinv_j}.
        rewrite mulzK ?expf_eq0 //=.
        rewrite -divzpMr; first by apply dvdz_exp2l; smt(mem_range).
        rewrite divz_pow //=; first by smt(mem_range).
        rewrite mulNr opprD /= (addzC (-k)).
        rewrite -exprD_subz //; [by smt(mem_range)|rewrite addrAC /=].
        rewrite -exprSr; first by smt(mem_range).
        rewrite (IntID.addrAC _ (-k)) /=.
        move => Hstart_past_0 Hstart_past_1 Hj_past_0 Hj_past_1 Hj_future Hstart_future.
        by rewrite addrA; split; apply/all_range_2_max => //=; smt(mem_range).
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
      - by apply all_range_2_empty.
      move => r start.
      move => Hncond_start Hinv_start; move: (FOR_INT_ADD_LT.inv_outP _ _ _ _ _ Hncond_start Hinv_start) => //= ->>.
      move => {Hncond_start Hinv_start}.
      rewrite lezNgt expr_gt0 //=.
      rewrite addr_double.
      rewrite -exprSr; first by smt(mem_range).
      move => Hstart_past_0 Hstart_past_1 _.
      apply/(all_range_2_cat _ (2 ^ k)) => //.
      by rewrite expr_ge0 //= ler_weexpn2l //; smt(mem_range).
    skip.
    move => |>.
    rewrite FOR_NAT_MUL_LE.inv_in //=.
    do!split.
    + apply all_range_2_max => //=; split; last by apply all_range_2_empty.
      apply/allP => x xinrange; rewrite /partial_ntt_spec /partial_ntt /=.
      by rewrite BAdd.big_ltn // BAdd.big_geq //= addr0 exponent_0 expr0 mul1r.
    move => len r.
    by move => Hncond_len Hinv_len; move: (FOR_NAT_MUL_LE.inv_outP _ _ _ _ _ Hncond_len Hinv_len).
  qed.

  equiv eq_NTT4_NTT5 p : NTT4.ntt ~ NTT5.ntt:
    arg{1} = p /\ arg{2} = p ==> ={res}.
  proof.
    proc; sp.
    while (
      (*TODO: modify f*)
      PERM_FOR_NAT_DIV_GE_MUL_LE.inv (fun (n : int) (a : zmod Array256.t) => a) p 2 2 128 len{1} r{1} 2 1 len{2} r{2}
      ).
    + sp; wp => /=.
      while (
        2 <= len{1} /\
        len{2} <= 64 /\
        PERM_FOR_NAT_DIV_GE_MUL_LE.inv (fun (n : int) (a : zmod Array256.t) => a) p 2 2 128 len{1} r{1} 2 1 len{2} r{2} /\
        PERM_FOR_INT_ADD_LT2.inv (fun (n : int) (a : zmod Array256.t) => a) p (len{1} * 2) 256 0 start{1} r{1} 1 0 start{2} r{2}
        ).
      - sp; wp => /=.
        while (
          2 <= len{1} /\
          len{2} <= 64 /\
          PERM_FOR_NAT_DIV_GE_MUL_LE.inv (fun (n : int) (a : zmod Array256.t) => a) p 2 2 128 len{1} r{1} 2 1 len{2} r{2} /\
          start{1} < 256 /\
          start{2} < len{2} /\
          PERM_FOR_INT_ADD_LT2.inv (fun (n : int) (a : zmod Array256.t) => a) p (len{1} * 2) 256 0 start{1} r{1} 1 0 start{2} r{2} /\
          PERM_FOR_INT_ADD_LT2.inv (fun (n : int) (a : zmod Array256.t) => a) p 1 len{1} 0 j{1} r{1} (len{2} * 2) 0 j{2} r{2}).
        * sp; skip => |> &hr1 &hr2 j2 r2 j1 r1.
          move => Hcond_len1 Hcond_len2 Hinv_len Hcond_start1 Hcond_start2 Hinv_start Hinv_j Hcond_j1 Hcond_j2.
          admit.
        skip => |> &hr1 &hr2.
        move => Hcond_len1 Hcond_len2 Hinv_len Hinv_start Hcond_start1 Hcond_start2.
        admit.
      skip => |> &hr1 &hr2.
      move => Hinv_len Hcond_len1 Hcond_len2.
      admit.
    skip => |>.
    rewrite PERM_FOR_NAT_DIV_GE_MUL_LE.inv_in //=.
    move => len1 r1 len2 r2 Hncond_len1 Hncond_len2 Hinv_len.
    move: (PERM_FOR_NAT_DIV_GE_MUL_LE.inv_outP _ _ _ _ _ _ _ _ 64 _ _ _ _ _ _ _ _ Hncond_len1 Hinv_len) => //=.
    apply perm_eq_refl_eq; congr; apply eq_in_map => k Hk_range; rewrite /(\o) /=.
    search _ (map _ _ = map _ _)%List.
  qed.

  op zetas_spec (zs : zmod Array128.t) =
    forall i ,
      0 <= i < 128 =>
      zs.[i] = exp zeta1 (bitrev 8 (i * 2)).

  lemma eq_NTT3_NTT4 p zs :
    zetas_spec zs =>
    equiv [NTT3.ntt ~ NTT4.ntt:
      arg{1} = (p, zs) /\ arg{2} = (p) ==> ={res}].
  proof.
    move => Hzs.
    proc; sp.
    while (
      FOR_NAT_DIV_GE.inv 2 2 128 len{1} /\
      ={len, r} /\
      zetas{1} = zs).
    + sp; wp => /=.
      while (
        2 <= len{1} /\
        FOR_NAT_DIV_GE.inv 2 2 128 len{1} /\
        FOR_INT_ADD_LT.inv (len{1} * 2) 256 0 start{1} /\
        ={len, r, start} /\
        zetas{1} = zs).
      - sp; wp => /=.
        while (
          2 <= len{1} /\
          FOR_NAT_DIV_GE.inv 2 2 128 len{1} /\
          start{1} < 256 /\
          FOR_INT_ADD_LT.inv (len{1} * 2) 256 0 start{1} /\
          ={len, r, start, zeta_, j} /\
          zetas{1} = zs).
        * by sp; skip.
        skip => |> &hr2.
        (*TODO: why the mixup?*)
        move => Hcond_len Hinv_len; move: (FOR_NAT_DIV_GE.inv_loopP _ _ _ _ _ Hcond_len Hinv_len) => //= [k [Hk_range ->>]].
        move => {Hcond_len Hinv_len}.
        do 3!(rewrite divz_pow //=; first by smt(mem_range)).
        rewrite -exprSr; first by smt(mem_range).
        rewrite opprD /= (addzC _ k).
        move => Hinv_start Hcond_start; move: (FOR_INT_ADD_LT.inv_loopP _ _ _ _ _ Hcond_start Hinv_start) => //=; first by apply/expr_gt0.
        move => [start [Hstart_range ->>]].
        do 2!(rewrite -divzpMr; first by apply dvdz_exp2l; smt(mem_range)).
        do 2!(rewrite -exprD_subz //; [by smt(mem_range)|rewrite addrAC /=]).
        rewrite opprD /= addrAC !addrA /= -addrA /=.
        rewrite (FOR_INT_ADD_LT.inv_loop_post _ _ _ _ _ Hcond_start Hinv_start) ?expr_gt0 //=.
        rewrite Hzs; last by rewrite mulzDl -exprSr; first by smt(mem_range).
        move: Hstart_range.
        rewrite divz_pow //=; first by smt(mem_range).
        rewrite opprD mulNr /= => Hstart_range.
        split => [|_]; first by apply/addz_ge0; [apply/expr_ge0|move: Hstart_range => /mem_range []].
        apply/(ltr_le_trans (2 ^ (k + 1))).
        * rewrite exprD_nneg //=; first by move: Hk_range => /mem_range [].
          by rewrite -addr_double ler_lt_add //; move: Hstart_range => /mem_range.
        move: (ler_weexpn2l 2 _ (k + 1) 7) => //= -> //; move: Hk_range => /mem_range [? ?].
        by rewrite -ltzE; split => //; apply addr_ge0.
      skip => |> &hr2.
      move => Hinv_len Hcond_len; rewrite (FOR_NAT_DIV_GE.inv_loop_post _ _ _ _ _ Hcond_len Hinv_len) //=.
      by rewrite FOR_INT_ADD_LT.inv_in /=; apply/mulr_gt0 => //; apply/(ltr_le_trans 2).
    skip => |>.
    by rewrite FOR_NAT_DIV_GE.inv_in.
  qed.

  equiv eq_NTT2_NTT3: NTT2.ntt ~ NTT3.ntt:
    ={arg} ==> ={res}.
  proof.
    proc; sp.
    while ((0 <= len{1}) /\ ={zetasctr, len, r, zetas}).
    + sp; wp => /=.
      while ((0 <= len{1}) /\ ={zetasctr, len, r, zetas, start}).
      - sp; wp => /=.
        while (   (0 <= len{1})
               /\ ={zetasctr, len, r, zetas, start, zeta_}
               /\ (FOR_INT_ADD_LT.inv 1 len{2} 0 j{2})
               /\ (j{1} = j{2} + start{2})).
        * sp; skip => |> &hr2 j r le0len.
          move => Hinv_j _ Hcond_j.
          rewrite (FOR_INT_ADD_LT.inv_loop_post _ _ _ _ _ Hcond_j Hinv_j) //=.
          move: (FOR_INT_ADD_LT.inv_loopP _ _ _ _ _ Hcond_j Hinv_j) => //= [bsj [Hbsj_range ->>]].
          by rewrite !(IntID.addrAC _ start{hr2}) /= (IntID.addrC start{hr2}) ltr_add2r.
        skip => |> &hr2 le0len ltstart256.
        by rewrite ltr_addl !FOR_INT_ADD_LT.inv_in //=.
      by skip => /> &hr2 le0len _ _ _ _; apply/divz_ge0.
    by skip => />.
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
