require import AllCore List IntDiv Ring StdOrder BitEncoding  Array256 Array128.
require import Fq.
import Kyber.

import Zq IntOrder BitReverse.

theory NTT_Fq.

(* These are imperative specifications of the NTT algorithms whose control
   structure matches what is implemented.  *)

module NTT = {
 proc ntt(r : Fq Array256.t,  zetas : Fq Array128.t) : Fq Array256.t = {
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

 proc invntt(r : Fq Array256.t, zetas_inv : Fq Array128.t) : Fq Array256.t = {
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

require import Fastexp.

clone include Fastexp with
  type CR.t <- Fq,
  op CR.zeror <- Zq.zero,
  op CR.oner <- Zq.one,
  op CR.(+) <- Zq.(+),
  op CR.([ - ]) <- Zq.([-]),
  op CR.( * ) <- Zq.( * ),
  op CR.invr  <- Zq.inv,
  op CR.exp  <- ZqField.exp,
  op CR.ofint <- ZqField.ofint,
  pred CR.unit  <- Zq.unit
proof *.

realize CR.addrA by apply Zq.ZqRing.addrA.
realize CR.addrC by apply Zq.ZqRing.addrC.
realize CR.add0r by apply Zq.ZqRing.add0r.
realize CR.addNr by apply Zq.ZqRing.addNr.
realize CR.oner_neq0 by apply Zq.ZqRing.oner_neq0.
realize CR.mulrA by apply Zq.ZqRing.mulrA.
realize CR.mulrC by apply Zq.ZqRing.mulrC.
realize CR.mul1r by apply Zq.ZqRing.mul1r.
realize CR.mulrDl by apply Zq.ZqRing.mulrDl.
realize CR.mulVr by apply Zq.ZqRing.mulVr.
realize CR.unitP by apply Zq.ZqRing.unitP.
realize CR.unitout by apply Zq.ZqRing.unitout.

lemma exp_neg1_2 :
  ZqField.exp (inFq (-1)) 2 = Zq.one.
proof. by rewrite ZqField.expr2 -inFqM. qed.

lemma exp_neg1_2_ring :
  ZqRing.exp (inFq (-1)) 2 = Zq.one.
proof. by rewrite ZqRing.expr2 -inFqM. qed.

lemma exp_zroot_128 :
  ZqField.exp zroot 128 = inFq (-1).
proof. by rewrite exp_inFq /= inFq_mod eq_sym inFq_mod /q. qed.

lemma exp_zroot_256 :
  ZqField.exp zroot 256 = inFq 1.
proof. by rewrite exp_inFq /= inFq_mod /q. qed.

lemma unit_zroot :
  zroot <> Zq.zero.
proof. by rewrite -eq_inFq /q. qed.

lemma inv_zroot :
  inv zroot = inFq 1175.
proof.
  apply (ZqField.mulIr zroot); [by apply unit_zroot|].
  rewrite ZqField.mulVf; [by apply unit_zroot|].
  by rewrite -inFqM_mod /q.
qed.

lemma exp_zroot n :
  ZqField.exp zroot n =
  inFq (exp 17 (n %% 256) %% q).
proof. by rewrite -!inFq_mod (exp_mod _ _ _ exp_zroot_256) exp_inFq modz_ge0. qed.

lemma exp_ring z n :
  ZqRing.exp z n = ZqField.exp z n.
proof. by rewrite /ZqRing.exp /ZqField.exp; case: (n < 0) => //=. qed.

lemma unit_zroot_ring :
  unit zroot.
proof. by exists (inFq 1175); rewrite -inFqM_mod /q. qed.

lemma exp_zroot_128_ring :
  ZqRing.exp zroot 128 = inFq (-1).
proof. by rewrite exp_ring exp_zroot_128. qed.

lemma exp_zroot_256_ring :
  ZqRing.exp zroot 256 = inFq 1.
proof. by rewrite exp_ring exp_zroot_256. qed.

lemma exp_zroot_ring n :
  ZqRing.exp zroot n =
  inFq (exp 17 (n %% 256) %% q).
proof. by rewrite exp_ring exp_zroot. qed.

lemma eq_exp_zroot_one n :
  ZqRing.exp zroot n = Zq.one <=> n %% 256 = 0.
proof.
  rewrite exp_zroot_ring /q; move: (mem_range_mod n 256 _) => //.
  move: (n %% 256) => {n} n; rewrite -eq_inFq /q.
  do 256!(rewrite range_ltn //=; case; [by move => ->>|]).
  by rewrite range_geq.
qed.

op perm256 ['t] (p : int -> int) (a : 't Array256.t) : 't Array256.t =
  Array256.init (fun i => a.[p i]).

op bsrev256 ['t] : 't Array256.t -> 't Array256.t =
  perm256 (bsrev 8).

op left256 ['t] (a : 't Array256.t) : 't Array128.t =
  Array128.init (fun i => a.[i]).

op right256 ['t] (a : 't Array256.t) : 't Array128.t =
  Array128.init (fun i => a.[i + 128]).

op cat256 ['t] (a b : 't Array128.t) : 't Array256.t =
  Array256.init (fun i => if i < 128 then a.[i] else b.[i - 128]).

op R = inFq Fq.SignedReductions.R.

op scale127 = inFq (-26).

op array128_mont_inv (p : Fq Array128.t) =
  (Array128.map (fun x => x * R) p).[127 <- p.[127] * R * R].

op zetas_inv : Fq Array128.t =
  let vv = Array128.init (fun k => ZqField.exp zroot (- (bsrev 8 (k * 2) + 1))) in
      vv.[127 <- scale127].

lemma scale127E :
  scale127 = inv (inFq 128).
proof.
  apply/(ZqRing.mulrI (inFq 128)).
  + by apply/unitE; rewrite -eq_inFq /q.
  rewrite /scale127 -inFqM_mod /q /= eq_sym -ZqRing.unitrE.
  by apply/unitE; rewrite -eq_inFq /q.
qed.

(* These are powers of roots of unit in Mont form and
   bitwise permuted indices  zetas inv above needs to be
   defined, this axiom discharged, and then used to
   discharge other axioms below. *)
lemma zetas_inv_vals : array128_mont_inv zetas_inv =
    Array128.of_list witness
       [ inFq 1701; inFq 1807; inFq 1460; 
         inFq 2371; inFq 2338; inFq 2333; 
         inFq 308; inFq 108; inFq 2851; 
         inFq 870; inFq 854; inFq 1510; 
         inFq 2535; inFq 1278; inFq 1530; 
         inFq 1185; inFq 1659; inFq 1187; 
         inFq 3109; inFq 874; inFq 1335; 
         inFq 2111; inFq 136; inFq 1215; 
         inFq 2945; inFq 1465; inFq 1285; 
         inFq 2007; inFq 2719; inFq 2726; 
         inFq 2232; inFq 2512; inFq 75; 
         inFq 156; inFq 3000; inFq 2911; 
         inFq 2980; inFq 872; inFq 2685; 
         inFq 1590; inFq 2210; inFq 602; 
         inFq 1846; inFq 777; inFq 147; 
         inFq 2170; inFq 2551; inFq 246; 
         inFq 1676; inFq 1755; inFq 460; 
         inFq 291; inFq 235; inFq 3152; 
         inFq 2742; inFq 2907; inFq 3224; 
         inFq 1779; inFq 2458; inFq 1251; 
         inFq 2486; inFq 2774; inFq 2899; 
         inFq 1103; inFq 1275; inFq 2652; 
         inFq 1065; inFq 2881; inFq 725; 
         inFq 1508; inFq 2368; inFq 398; 
         inFq 951; inFq 247; inFq 1421; 
         inFq 3222; inFq 2499; inFq 271; 
         inFq 90; inFq 853; inFq 1860; 
         inFq 3203; inFq 1162; inFq 1618; 
         inFq 666; inFq 320; inFq 8; 
         inFq 2813; inFq 1544; inFq 282; 
         inFq 1838; inFq 1293; inFq 2314; 
         inFq 552; inFq 2677; inFq 2106; 
         inFq 1571; inFq 205; inFq 2918; 
         inFq 1542; inFq 2721; inFq 2597; 
         inFq 2312; inFq 681; inFq 130; 
         inFq 1602; inFq 1871; inFq 829; 
         inFq 2946; inFq 3065; inFq 1325; 
         inFq 2756; inFq 1861; inFq 1474; 
         inFq 1202; inFq 2367; inFq 3147; 
         inFq 1752; inFq 2707; inFq 171; 
         inFq 3127; inFq 3042; inFq 1907; 
         inFq 1836; inFq 1517; inFq 359; 
         inFq 758; inFq 1441].
proof.
  apply/Array128.ext_eq => i /mem_range mem_i_range.
  rewrite /array128_mont_inv /zetas_inv /=.
  rewrite Array128.get_set_if /= /scale127 {1 2}/R /Fq.SignedReductions.R.
  rewrite -(inFqM_mod (-26)) /q /= -inFqM_mod /q /=.
  rewrite mapiE /=; [by rewrite -mem_range|].
  rewrite get_setE //= initiE /=; [by rewrite -mem_range|].
  move: mem_i_range; rewrite (rangeSr _ 127) // mem_rcons /=.
  case => [->> //=|mem_i_range]; rewrite ltr_eqF /=.
  + by move: mem_i_range; apply mem_range_gt.
  rewrite -!ZqField.exprV inv_zroot.
  rewrite ZqField.exprS; [by rewrite bsrev_ge0|].
  rewrite -!(fastexp_nbitsP 8) ?bsrev_range //.
  rewrite /fastexp_nbits !int2bs_bsrev !revK /zroot.
  have inFqQ_mod : forall (a : int) , inFq (a * a %% q) = inFq a * inFq a.
  + by move => ?; rewrite -inFqM_mod.
  do 8!(rewrite BS2Int.int2bs_rcons //= foldr_rcons /= -!inFqQ_mod /q /=).
  rewrite BS2Int.int2bs0s /= ComRing.mul1r => {inFqQ_mod}; move: mem_i_range.
  do 127!(rewrite range_ltn //=; move => [->> /=|];
            [by rewrite -!inFqM_mod !inFqK /q|]).
  by rewrite range_geq.
qed.

op array128_mont (p : Fq Array128.t) =
  Array128.map (fun x => x * R) p.

op zetas : Fq Array128.t = 
    Array128.init (fun k => ZqField.exp zroot (bsrev 8 (k * 2))).

(* These are powers of roots of unit in Mont form and
   bitwise permuted indices  zetas inv above needs to be
   defined, this axiom discharged, and then used to
   discharge other axioms below. *)
lemma zetas_vals : array128_mont zetas =
    Array128.of_list witness
       [inFq 2285; inFq 2571; inFq 2970; 
         inFq 1812; inFq 1493; inFq 1422; 
         inFq 287; inFq 202; inFq 3158; 
         inFq 622; inFq 1577; inFq 182; 
         inFq 962; inFq 2127; inFq 1855; 
         inFq 1468; inFq 573; inFq 2004; 
         inFq 264; inFq 383; inFq 2500; 
         inFq 1458; inFq 1727; inFq 3199; 
         inFq 2648; inFq 1017; inFq 732; 
         inFq 608; inFq 1787; inFq 411; 
         inFq 3124; inFq 1758; inFq 1223; 
         inFq 652; inFq 2777; inFq 1015; 
         inFq 2036; inFq 1491; inFq 3047; 
         inFq 1785; inFq 516; inFq 3321; 
         inFq 3009; inFq 2663; inFq 1711; 
         inFq 2167; inFq 126; inFq 1469; 
         inFq 2476; inFq 3239; inFq 3058; 
         inFq 830; inFq 107; inFq 1908; 
         inFq 3082; inFq 2378; inFq 2931; 
         inFq 961; inFq 1821; inFq 2604; 
         inFq 448; inFq 2264; inFq 677; 
         inFq 2054; inFq 2226; inFq 430; 
         inFq 555; inFq 843; inFq 2078; 
         inFq 871; inFq 1550; inFq 105; 
         inFq 422; inFq 587; inFq 177; 
         inFq 3094; inFq 3038; inFq 2869; 
         inFq 1574; inFq 1653; inFq 3083; 
         inFq 778; inFq 1159; inFq 3182; 
         inFq 2552; inFq 1483; inFq 2727; 
         inFq 1119; inFq 1739; inFq 644; 
         inFq 2457; inFq 349; inFq 418; 
         inFq 329; inFq 3173; inFq 3254; 
         inFq 817; inFq 1097; inFq 603; 
         inFq 610; inFq 1322; inFq 2044; 
         inFq 1864; inFq 384; inFq 2114; 
         inFq 3193; inFq 1218; inFq 1994; 
         inFq 2455; inFq 220; inFq 2142; 
         inFq 1670; inFq 2144; inFq 1799; 
         inFq 2051; inFq 794; inFq 1819; 
         inFq 2475; inFq 2459; inFq 478; 
         inFq 3221; inFq 3021; inFq 996; 
         inFq 991; inFq 958; inFq 1869; 
         inFq 1522; inFq 1628].
proof.
  apply/Array128.ext_eq => i /mem_range mem_i_range.
  rewrite /array128_mont /zetas Array128.mapiE -?mem_range //.
  rewrite initiE -?mem_range //; move: mem_i_range.
  rewrite /= -(fastexp_nbitsP 8) ?bsrev_range //.
  rewrite /fastexp_nbits int2bs_bsrev revK /R /Fq.SignedReductions.R.
  have inFqQ_mod : forall (a : int) , inFq (a * a %% q) = inFq a * inFq a.
  + by move => ?; rewrite -inFqM_mod.
  do 8!(rewrite BS2Int.int2bs_rcons //= foldr_rcons /= -!inFqQ_mod /q /=).
  rewrite BS2Int.int2bs0s /= ComRing.mul1r => {inFqQ_mod}.
  do 128!(rewrite range_ltn //=; move => [->> /=|];
            [by rewrite -!inFqM_mod !inFqK /q|]).
  by rewrite range_geq.
qed.

(* These properties is needed to show that ntt_inv is computing something
   that makes sense. Checked in sage. *)
lemma zetavals1  k : 0 <= k < 256 => k%%4 = 0 =>
     zetas.[k %/ 4 + 64] = ZqField.exp zroot (2 * br (k %/ 2) + 1).
proof.
  rewrite -mem_range -dvdzE => mem_k_range /dvdzP [q ->>].
  move: mem_k_range; rewrite mem_range_mulr //= mulzK // -divzpMr //= /zetas => mem_q_range.
  rewrite initiE /=; [by apply/mem_range/mem_range_addr; move: mem_q_range; apply/mem_range_incl|].
  rewrite /br mulrDl /= (bsrev_cat 7 8) //= divzDr //= divz_small /=; [by apply/mem_range/mem_range_mulr|].
  by rewrite bsrev1 //= (addrC 1) -bsrev_mod /= -modzDm /= !bsrev_mod.
qed.

lemma zetavals2 k : 0 <= k < 256 => k%%4 = 2 => 
     zetas.[k %/ 4 + 64] = (-ZqField.exp zroot (2 * br (k %/ 2) + 1)).
proof.
  rewrite -mem_range => mem_k_range eq_modz; move: mem_k_range; rewrite (divz_eq k 4) eq_modz.
  move: {eq_modz} (k %/ 4) => q {k}; rewrite mem_range_addr mem_range_mulr //= => mem_q_range.
  rewrite divzMDl //= divzDr //= -divzpMr //= /zetas.
  rewrite initiE /=; [by apply/mem_range/mem_range_addr; move: mem_q_range; apply/mem_range_incl|].
  rewrite /br mulrDl /= (bsrev_cat 7 8) //= divzDr //= divz_small /=; [by apply/mem_range/mem_range_mulr|].
  rewrite bsrev1 //= (addrC 1) -bsrev_mod /= -modzDm /= !bsrev_mod.
  move: (bsrev_add 1 7 1 q); rewrite mem_range /= addrC mulrC => ->.
  rewrite -(bsrev_mulr_pow2 1 7 q) //= mulrDr bsrev1 // -addrA.
  rewrite (ZqField.exprD _ (_ * (_ ^ _)%IntID)%Int) /=; [by apply unit_zroot|].
  by rewrite exp_zroot_128 inFqN ZqField.mulNr ZqField.opprK ZqField.mul1r (mulrC _ 2).
qed.

(* TO DO: These need to be proved using the results in NTT_Algebra *)
lemma ntt_spec_h _r : hoare[ NTT.ntt : arg = (_r,zetas) ==> res = ntt _r ].
admitted. (* ntt imperative computes ntt functional *)

lemma invntt_spec_h _r :
   hoare[ NTT.invntt : arg=(_r,zetas_inv) ==> res = invntt _r ].
admitted.

lemma ntt_spec _r : phoare[ NTT.ntt : arg = (_r,zetas) ==> res = ntt _r ] = 1%r
  by conseq ntt_spec_ll (ntt_spec_h _r); done.

lemma invntt_spec _r:
   phoare[ NTT.invntt :
     arg=(_r,zetas_inv) ==> res = invntt _r ] = 1%r
  by conseq invntt_spec_ll (invntt_spec_h _r); done.

(* These theorems should come from the algebraic infrastructure, along with
another one that says our axiomatization of mul and add in Kyber are 
explicit formulae for the ring operations. *)

op scale(p : poly, c : Fq) : poly =  Array256.map (fun x => x * c) p.

lemma ntt_scale p c : ntt (scale p c) = scale (ntt p) c.
proof.
  rewrite /ntt /scale !Array256.mapE Array256.tP => i mem_i_range.
  do 3!(rewrite Array256.initiE //=); case: (i %% 2 = 0) => [modi20|Nmodi20].
  + rewrite BigDom.BAdd.mulr_suml; apply BigDom.BAdd.eq_big_int.
    move => j /mem_range mem_j_range /=; rewrite Array256.initiE /=.
    - by apply/mem_range/mem_range_mull => //=; apply/(bsrev_range 7).
    by rewrite ZqRing.mulrAC.
  rewrite BigDom.BAdd.mulr_suml; apply BigDom.BAdd.eq_big_int.
  move => j /mem_range mem_j_range /=; rewrite Array256.initiE /=.
  + by apply/mem_range/mem_range_addr/mem_range_mull => //=; apply/(bsrev_range 7).
  by rewrite ZqRing.mulrAC.
qed.

lemma sum_pred1 f z a b :
  BigDom.BAdd.bigi predT (fun (x : int) => if x = z then f x else Zq.zero) a b =
  if z \in range a b
  then f z
  else Zq.zero.
proof.
  rewrite (BigDom.BAdd.bigEM (pred1 z)).
  rewrite (BigDom.BAdd.eq_big _ (pred1 z) _ (fun x => f z * Zq.one)) //=.
  + by rewrite ZqRing.mulr1 /pred1 => ? ->.
  rewrite -BigDom.BAdd.mulr_sumr BigDom.BAdd.sumr_1.
  rewrite (BigDom.BAdd.eq_big _ (predC (pred1 z)) _ (fun x => Zq.zero)) //.
  + by move => x; rewrite /predC /pred1 /= => ->.
  rewrite BigDom.BAdd.big1_eq ZqRing.addr0 count_uniq_mem ?range_uniq //.
  case: (z \in range a b) => _; rewrite /b2i //=; last first.
  + by move: (CR.mulr0z (Zq.one)); rewrite /ofint /intmul /intmul /= => ->; rewrite ZqRing.mulr0.
  by move: (CR.mulr1z (Zq.one)); rewrite /ofint /intmul /intmul /= => ->; rewrite ZqRing.mulr1.
qed.

lemma sum_exp z a b :
  BigDom.BAdd.bigi predT (fun n => ZqRing.exp z n) a b =
  if b < a
  then Zq.zero
  else if z = Zq.zero
  then (if 0 \in range a b then Zq.one else Zq.zero)
  else if z = Zq.one
  then inFq (b - a)
  else inv (z - Zq.one) * (ZqRing.exp z b - ZqRing.exp z a).
proof.
  case: (b < a) => [ltba|/lerNgt leab].
  + by rewrite range_geq; [apply/ltzW|rewrite BigDom.BAdd.big_nil].
  case: (z = Zq.zero) => [->>|unitz].
  + rewrite (BigDom.BAdd.eq_big_int _ _ _ (fun x => if x = 0 then Zq.one else Zq.zero)).
    - by move => x _ /=; rewrite ZqRing.expr0z.
    by rewrite sum_pred1.
  case: (z = Zq.one) => [->>|neqz1].
  + rewrite (BigDom.BAdd.eq_big_int _ _ _ (fun _ => Zq.one)).
    - by move => ? _ /=; rewrite ZqRing.expr1z.
    rewrite BigDom.BAdd.sumr_1 // count_predT size_range ler_maxr ?subr_ge0 //. 
    rewrite /ofint. 
    have : 0 <= b - a by smt().
    elim /natind (b-a).
    + by move => n;case (n = 0); smt(@Zq).
    by move => n *; rewrite inFqD ZqRing.mulrS; smt(). 
  move: (neqz1); rewrite -ZqRing.subr_eq0 => unitsub; apply/(ZqRing.mulrI (z - Zq.one)) => //.
  + by apply/unitE.
  rewrite ZqRing.mulrA ZqRing.divrr; [by apply/unitE|rewrite ZqRing.mul1r].
  rewrite ZqRing.mulrDl BigDom.BAdd.mulr_sumr ZqRing.mulNr ZqRing.mul1r.
  pose f n:= ZqRing.exp z n; rewrite (BigDom.BAdd.eq_big_int _ _ _ (f \o (( + ) 1))).
  + move => ? _ /=; rewrite /f /(\o) /= => {f}; rewrite ZqRing.exprD.
    - by apply/unitE.
    by rewrite ZqRing.expr1.
  rewrite -BigDom.BAdd.big_mapT -range_add.
  case/ler_eqVlt: leab => [<<-|ltab].
  + by rewrite !range_geq // BigDom.BAdd.big_nil !ZqRing.subrr.
  rewrite rangeSr -?ltzE // (range_ltn a) //= BigDom.BAdd.big_consT BigDom.BAdd.big_rcons.
  by rewrite {1}/predT /f /=; ring.
qed.

lemma invnttK : cancel ntt invntt.
proof.
  move => r; rewrite /ntt /invntt Array256.tP => i /mem_range mem_i_range /=.
  rewrite Array256.initiE //=; move: (mem_range_mod i 2 _) => //; [by move => _; apply mem_range|].
  rewrite range_ltn // range_ltn // range_geq //=.
  case => eq_mod; rewrite eq_mod /=.
  + pose f j:=
      inv (inFq 128) *
      BigDom.BAdd.bigi
        predT
        (fun (j' : int) =>
          idfun
            ( r.[2 * j'] *
              ZqRing.exp zroot ((2 * br j + 1) * (j' - (i %/ 2))) ) )
         0 128.
    rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
    - move => j /mem_range mem_j_range /=; rewrite Array256.initiE //=.
      * by apply/mem_range/mem_range_mull.
      rewrite modzMr /= mulKz // -ZqRing.mulrA; congr.
      rewrite BigDom.BAdd.mulr_suml; apply BigDom.BAdd.eq_big_int.
      move => j' /mem_range mem_j'_range /=; rewrite /idfun /= -ZqRing.mulrA; congr.
      by rewrite -ZqRing.exprD //; [apply/unit_zroot_ring|rewrite mulrDr mulrN].
    rewrite -BigDom.BAdd.mulr_sumr -BigDom.BAdd.big_allpairs.
    pose f x y:= r.[2 * y] * ZqRing.exp zroot ((2 * br x + 1) * (y - i %/ 2)).
    rewrite (BigDom.BAdd.eq_big_perm _ _
               (allpairs f (range 0 128) (range 0 128))
               (allpairs (transpose f) (range 0 128) (range 0 128))).
    - by apply/allpairs_swap.
    rewrite /f => {f}; rewrite BigDom.BAdd.big_allpairs.
    pose f x:=
      if x = i %/ 2
      then inFq 128 * r.[2 * x]
      else Zq.zero.
    rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
    - move => j /mem_range mem_j_range /=; rewrite /idfun /=.
      rewrite -BigDom.BAdd.mulr_sumr (ZqRing.mulrC).
      rewrite (BigDom.BAdd.eq_big_perm _ _ _ (map br (range 0 128))).
      * rewrite perm_eq_sym; move: (bsrev_range_pow2_perm_eq 7 7 _) => //=.
        by rewrite /br (eq_map (( * ) 1) idfun); [move => ?|rewrite map_id].
      pose f j':= ZqRing.exp (ZqRing.exp zroot (2 * (j - i %/ 2))) j' * ZqRing.exp zroot (j - i %/ 2).
      rewrite BigDom.BAdd.big_mapT (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
      * move => j' /mem_range mem_j'_range; rewrite /(\o) /br bsrev_involutive //= -ZqRing.exprM.
        by rewrite -ZqRing.exprD; [apply/unit_zroot_ring|rewrite mulrAC mulrSl].
      rewrite -BigDom.BAdd.mulr_suml sum_exp /=.
      have ->/=: ZqRing.exp zroot (2 * (j - i %/ 2)) <> Zq.zero.
      * by apply/unitE/ZqRing.unitrX/unit_zroot_ring.
      rewrite eq_exp_zroot_one -(subr_eq0 j) -(mulz_modr 2 (j - i %/ 2) 128) //.
      rewrite mulf_eq0 /=; have ->: ((j - i %/ 2) %% 128 = 0 <=> j - i %/ 2 = 0).
      * move: mem_j_range; rewrite (range_cat (i %/ 2)).
        + by rewrite lez_divRL //; move: mem_i_range; apply/mem_range_le.
        + by apply/ltzW/ltz_divLR => //; move: mem_i_range; apply/mem_range_gt.
        rewrite mem_cat /=; case => mem_j_range.
        + rewrite -(modzMDl 1) /= modz_small.
          - rewrite -mem_range mem_range_addl mem_range_subr; move: mem_j_range; apply mem_range_incl => //.
            by rewrite /= addrC subr_le0 ltzW ltz_divLR //; move: mem_i_range; apply/mem_range_gt.
          have -> //=: j - i %/ 2 <> 0.
          - by rewrite subr_eq0 ltr_eqF //; move: mem_j_range; apply/mem_range_gt.
          rewrite addrA subr_eq0 gtr_eqF //; apply (ltr_le_trans 128).
          - by rewrite ltz_divLR //; move: mem_i_range; apply/mem_range_gt.
          by rewrite -ler_subl_addl; move: mem_j_range; apply/mem_range_le.
        rewrite modz_small // -mem_range mem_range_subr; move: mem_j_range; apply/mem_range_incl => //=.
        by rewrite -ler_subl_addl lez_divRL //; move: mem_i_range; apply/mem_range_le.
      case: (j - i %/ 2 = 0) => [->|]; [by rewrite ZqRing.expr0 ZqRing.mulr1|].
      rewrite ZqRing.expr0 -ZqRing.exprM mulrAC /= (exp_ring _ (256 * _)).
      by rewrite (exp_mod _ _ _ exp_zroot_256) // modzMr ZqField.expr0 ZqRing.subrr ZqRing.mulr0 !ZqRing.mul0r.
    rewrite sum_pred1 /= range_div_range //= mem_i_range /= ZqRing.mulrA ZqField.mulVf.
    - by move: (eq_inFq 128 0); rewrite /Zq.zero /q.
    by rewrite ZqRing.mul1r mulrC {2}(divz_eq i 2) eq_mod.
  pose f j:=
    inv (inFq 128) *
    BigDom.BAdd.bigi
      predT
      (fun (j' : int) =>
        idfun
          ( r.[2 * j' + 1] *
            ZqRing.exp zroot ((2 * br j + 1) * (j' - (i %/ 2))) ) )
       0 128.
  rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
  - move => j /mem_range mem_j_range /=; rewrite Array256.initiE //=.
    * by apply/mem_range/mem_range_addr/mem_range_mull.
    rewrite (IntID.mulrC 2) modzMDl /= divzMDl //= -ZqRing.mulrA; congr.
    rewrite BigDom.BAdd.mulr_suml; apply BigDom.BAdd.eq_big_int.
    move => j' /mem_range mem_j'_range /=; rewrite /idfun /= -ZqRing.mulrA; congr.
    by rewrite -ZqRing.exprD //; [apply/unit_zroot_ring|rewrite mulrDr mulrN].
  rewrite -BigDom.BAdd.mulr_sumr -BigDom.BAdd.big_allpairs.
  pose f x y:= r.[2 * y + 1] * ZqRing.exp zroot ((2 * br x + 1) * (y - i %/ 2)).
  rewrite (BigDom.BAdd.eq_big_perm _ _
             (allpairs f (range 0 128) (range 0 128))
             (allpairs (transpose f) (range 0 128) (range 0 128))).
  - by apply/allpairs_swap.
  rewrite /f => {f}; rewrite BigDom.BAdd.big_allpairs.
  pose f x:=
    if x = i %/ 2
    then inFq 128 * r.[2 * x + 1]
    else Zq.zero.
  rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
  + move => j /mem_range mem_j_range /=; rewrite /idfun /=.
    rewrite -BigDom.BAdd.mulr_sumr (ZqRing.mulrC).
    rewrite (BigDom.BAdd.eq_big_perm _ _ _ (map br (range 0 128))).
    - rewrite perm_eq_sym; move: (bsrev_range_pow2_perm_eq 7 7 _) => //=.
      by rewrite /br (eq_map (( * ) 1) idfun); [move => ?|rewrite map_id].
    pose f j':= ZqRing.exp (ZqRing.exp zroot (2 * (j - i %/ 2))) j' * ZqRing.exp zroot (j - i %/ 2).
    rewrite BigDom.BAdd.big_mapT (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
    - move => j' /mem_range mem_j'_range; rewrite /(\o) /br bsrev_involutive //= -ZqRing.exprM.
      by rewrite -ZqRing.exprD; [apply/unit_zroot_ring|rewrite mulrAC mulrSl].
    rewrite -BigDom.BAdd.mulr_suml sum_exp /=.
    have ->/=: ZqRing.exp zroot (2 * (j - i %/ 2)) <> Zq.zero.
    - by apply/unitE/ZqRing.unitrX/unit_zroot_ring.
    rewrite eq_exp_zroot_one -(subr_eq0 j) -(mulz_modr 2 (j - i %/ 2) 128) //.
    rewrite mulf_eq0 /=; have ->: ((j - i %/ 2) %% 128 = 0 <=> j - i %/ 2 = 0).
    - move: mem_j_range; rewrite (range_cat (i %/ 2)).
      * by rewrite lez_divRL //; move: mem_i_range; apply/mem_range_le.
      * by apply/ltzW/ltz_divLR => //; move: mem_i_range; apply/mem_range_gt.
      rewrite mem_cat /=; case => mem_j_range.
      * rewrite -(modzMDl 1) /= modz_small.
        + rewrite -mem_range mem_range_addl mem_range_subr; move: mem_j_range; apply mem_range_incl => //.
          by rewrite /= addrC subr_le0 ltzW ltz_divLR //; move: mem_i_range; apply/mem_range_gt.
        have -> //=: j - i %/ 2 <> 0.
        + by rewrite subr_eq0 ltr_eqF //; move: mem_j_range; apply/mem_range_gt.
        rewrite addrA subr_eq0 gtr_eqF //; apply (ltr_le_trans 128).
        + by rewrite ltz_divLR //; move: mem_i_range; apply/mem_range_gt.
        by rewrite -ler_subl_addl; move: mem_j_range; apply/mem_range_le.
      rewrite modz_small // -mem_range mem_range_subr; move: mem_j_range; apply/mem_range_incl => //=.
      by rewrite -ler_subl_addl lez_divRL //; move: mem_i_range; apply/mem_range_le.
    case: (j - i %/ 2 = 0) => [->|]; [by rewrite ZqRing.expr0 ZqRing.mulr1|].
    rewrite ZqRing.expr0 -ZqRing.exprM mulrAC /= (exp_ring _ (256 * _)).
    by rewrite (exp_mod _ _ _ exp_zroot_256) // modzMr ZqField.expr0 ZqRing.subrr ZqRing.mulr0 !ZqRing.mul0r.
  rewrite sum_pred1 /= range_div_range //= mem_i_range /= ZqRing.mulrA ZqField.mulVf.
  + by move: (eq_inFq 128 0); rewrite /Zq.zero /q.
  by rewrite ZqRing.mul1r mulrC {2}(divz_eq i 2) eq_mod.
qed.

lemma nttK : cancel invntt ntt.
proof.
  move => r; rewrite /ntt /invntt Array256.tP => i /mem_range mem_i_range /=.
  rewrite Array256.initiE //=; move: (mem_range_mod i 2 _) => //; [by move => _; apply mem_range|].
  rewrite range_ltn // range_ltn // range_geq //=.
  case => eq_mod; rewrite eq_mod /=.
  + pose f j:=
      inv (inFq 128) *
      BigDom.BAdd.bigi
        predT
        (fun (j' : int) =>
          idfun
            ( r.[2 * j'] *
              ZqRing.exp zroot (2 * (br (i %/ 2) - br j') * j) ) )
         0 128.
    rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
    - move => j /mem_range mem_j_range /=; rewrite Array256.initiE //=.
      * by apply/mem_range/mem_range_mull.
      rewrite modzMr /= mulKz // BigDom.BAdd.mulr_suml BigDom.BAdd.mulr_sumr.
      apply BigDom.BAdd.eq_big_int => j' /mem_range mem_j'_range /=.
      rewrite /idfun /= -!ZqRing.mulrA; congr; congr.
      by rewrite -ZqRing.exprD //; [apply/unit_zroot_ring|congr; ring].
    rewrite -BigDom.BAdd.mulr_sumr -BigDom.BAdd.big_allpairs.
    pose f x y:= r.[2 * y] * ZqRing.exp zroot (2 * (br (i %/ 2) - br y) * x).
    rewrite (BigDom.BAdd.eq_big_perm _ _
               (allpairs f (range 0 128) (range 0 128))
               (allpairs (transpose f) (range 0 128) (range 0 128))).
    - by apply/allpairs_swap.
    rewrite /f => {f}; rewrite BigDom.BAdd.big_allpairs.
    pose f x:=
      if x = i %/ 2
      then inFq 128 * r.[2 * x]
      else Zq.zero.
    rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
    - move => j /mem_range mem_j_range /=; rewrite /idfun /=.
      rewrite -BigDom.BAdd.mulr_sumr (ZqRing.mulrC).
      pose f j':= ZqRing.exp (ZqRing.exp zroot (2 * (br (i %/ 2) - br j))) j'.
      rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
      * by move => j' /mem_range mem_j'_range; rewrite -ZqRing.exprM.
      rewrite sum_exp /=; have ->/=: ZqRing.exp zroot (2 * (br (i %/ 2) - br j)) <> Zq.zero.
      * by apply/unitE/ZqRing.unitrX/unit_zroot_ring.
      rewrite eq_exp_zroot_one -(mulz_modr 2 (br (i %/ 2) - br j) 128) //.
      rewrite (eq_sym j); have <-: br (i %/ 2) = br j <=> i %/ 2 = j.
      * by split => [|->//]; apply bsrev_injective => //; apply/range_div_range.
      rewrite -(subr_eq0 (br _)) mulf_eq0 /=.
      have ->: (br (i %/ 2) - br j) %% 128 = 0 <=> br (i %/ 2) - br j = 0.
      * move: (bsrev_range 7 (i %/ 2))  (bsrev_range 7 j) => /=.
        move => {mem_i_range mem_j_range} mem_i_range mem_j_range.
        move: mem_j_range; rewrite (range_cat (br (i %/ 2) + 1)).
        + by rewrite -ler_subl_addr; move: mem_i_range; apply/mem_range_le.
        + by rewrite -ltzE; move: mem_i_range; apply/mem_range_gt.
        rewrite mem_cat /=; case => mem_j_range.
        + rewrite modz_small //= -mem_range mem_range_subl; move: mem_j_range; apply mem_range_incl => //=.
          by rewrite -ltzE addrC subr_lt0; move: mem_i_range; apply mem_range_gt.
        rewrite -(modzMDl 1) /= modz_small.
        + rewrite -mem_range mem_range_addl mem_range_subl; move: mem_j_range; apply mem_range_incl => //=.
          by rewrite -ler_subl_addl; move: mem_i_range; apply/mem_range_le.
        have -> //=: br (i %/ 2) - br j <> 0.
        + by rewrite subr_eq0 ltr_eqF // ltzE; move: mem_j_range; apply/mem_range_le.
        rewrite addrA subr_eq0 gtr_eqF //; apply (ltr_le_trans 128).
        + by move: mem_j_range; apply/mem_range_gt.
        by rewrite -ler_subl_addl; move: mem_i_range; apply/mem_range_le.
      case: (br (i %/ 2) - br j = 0) => [//|].
      rewrite ZqRing.expr0 -ZqRing.exprM mulrAC /= (exp_ring _ (256 * _)).
      by rewrite (exp_mod _ _ _ exp_zroot_256) // modzMr ZqField.expr0 ZqRing.subrr ZqRing.mulr0 !ZqRing.mul0r.
    rewrite sum_pred1 /= range_div_range //= mem_i_range /= ZqRing.mulrA ZqField.mulVf.
    - by move: (eq_inFq 128 0); rewrite /Zq.zero /q.
    by rewrite ZqRing.mul1r mulrC {2}(divz_eq i 2) eq_mod.
  pose f j:=
    inv (inFq 128) *
    BigDom.BAdd.bigi
      predT
      (fun (j' : int) =>
        idfun
          ( r.[2 * j' + 1] *
            ZqRing.exp zroot (2 * (br (i %/ 2) - br j') * j) ) )
       0 128.
  rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
  - move => j /mem_range mem_j_range /=; rewrite Array256.initiE //=.
    * by apply/mem_range/mem_range_addr/mem_range_mull.
    rewrite (IntID.mulrC 2) modzMDl /= divzMDl //=.
    rewrite BigDom.BAdd.mulr_suml BigDom.BAdd.mulr_sumr; apply BigDom.BAdd.eq_big_int.
    move => j' /mem_range mem_j'_range /=; rewrite /idfun /= -!ZqRing.mulrA; congr; congr.
    by rewrite -ZqRing.exprD //; [apply/unit_zroot_ring|congr; ring].
  rewrite -BigDom.BAdd.mulr_sumr -BigDom.BAdd.big_allpairs.
  pose f x y:= r.[2 * y + 1] * ZqRing.exp zroot (2 * (br (i %/ 2) - br y) * x).
  rewrite (BigDom.BAdd.eq_big_perm _ _
             (allpairs f (range 0 128) (range 0 128))
             (allpairs (transpose f) (range 0 128) (range 0 128))).
  - by apply/allpairs_swap.
  rewrite /f => {f}; rewrite BigDom.BAdd.big_allpairs.
  pose f x:=
    if x = i %/ 2
    then inFq 128 * r.[2 * x + 1]
    else Zq.zero.
  rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
  + move => j /mem_range mem_j_range /=; rewrite /idfun /=.
    rewrite -BigDom.BAdd.mulr_sumr (ZqRing.mulrC).
    pose f j':= ZqRing.exp (ZqRing.exp zroot (2 * (br (i %/ 2) - br j))) j'.
    rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
    - by move => j' /mem_range mem_j'_range; rewrite /= -ZqRing.exprM.
    rewrite sum_exp /=.
    have ->/=: ZqRing.exp zroot (2 * (br (i %/ 2) - br j)) <> Zq.zero.
    - by apply/unitE/ZqRing.unitrX/unit_zroot_ring.
    rewrite eq_exp_zroot_one -(mulz_modr 2 (br (i %/ 2) - br j) 128) //.
    rewrite (eq_sym j); have <-: br (i %/ 2) = br j <=> i %/ 2 = j.
    - by split => [|->//]; apply bsrev_injective => //; apply/range_div_range.
    rewrite -(subr_eq0 (br _)) mulf_eq0 /=.
    have ->: (br (i %/ 2) - br j) %% 128 = 0 <=> br (i %/ 2) - br j = 0.
    - move: (bsrev_range 7 (i %/ 2))  (bsrev_range 7 j) => /=.
      move => {mem_i_range mem_j_range} mem_i_range mem_j_range.
      move: mem_j_range; rewrite (range_cat (br (i %/ 2) + 1)).
      * by rewrite -ler_subl_addr; move: mem_i_range; apply/mem_range_le.
      * by rewrite -ltzE; move: mem_i_range; apply/mem_range_gt.
      rewrite mem_cat /=; case => mem_j_range.
      * rewrite modz_small //= -mem_range mem_range_subl; move: mem_j_range; apply mem_range_incl => //=.
        by rewrite -ltzE addrC subr_lt0; move: mem_i_range; apply mem_range_gt.
      rewrite -(modzMDl 1) /= modz_small.
      * rewrite -mem_range mem_range_addl mem_range_subl; move: mem_j_range; apply mem_range_incl => //=.
        by rewrite -ler_subl_addl; move: mem_i_range; apply/mem_range_le.
      have -> //=: br (i %/ 2) - br j <> 0.
      * by rewrite subr_eq0 ltr_eqF // ltzE; move: mem_j_range; apply/mem_range_le.
      rewrite addrA subr_eq0 gtr_eqF //; apply (ltr_le_trans 128).
      * by move: mem_j_range; apply/mem_range_gt.
      by rewrite -ler_subl_addl; move: mem_i_range; apply/mem_range_le.
    case: (br (i %/ 2) - br j = 0) => [//|].
    rewrite ZqRing.expr0 -ZqRing.exprM mulrAC /= (exp_ring _ (256 * _)).
    by rewrite (exp_mod _ _ _ exp_zroot_256) // modzMr ZqField.expr0 ZqRing.subrr ZqRing.mulr0 !ZqRing.mul0r.
  rewrite sum_pred1 /= range_div_range //= mem_i_range /= ZqRing.mulrA ZqField.mulVf.
  + by move: (eq_inFq 128 0); rewrite /Zq.zero /q.
  by rewrite ZqRing.mul1r mulrC {2}(divz_eq i 2) eq_mod.
qed.

lemma nttvK : cancel invnttv nttv.
proof. 
rewrite /nttv /invnttv /mapv /= /cancel => x.
rewrite KMatrix.Vector.offunvK /vclamp /kvec /=.
apply KMatrix.Vector.eq_vectorP => i ib.
rewrite KMatrix.Vector.offunvE //=.
smt(nttK).
qed.

lemma invnttvK : cancel nttv invnttv.
proof. 
rewrite /nttv /invnttv /mapv /= /cancel => x.
rewrite KMatrix.Vector.offunvK /vclamp /kvec /=.
apply KMatrix.Vector.eq_vectorP => i ib.
rewrite KMatrix.Vector.offunvE //=.
smt(invnttK).
qed.

lemma invntt_scale p c : invntt (scale p c) = scale (invntt p) c.
proof.
rewrite (_: p = ntt (invntt p)); first by rewrite nttK.
by rewrite -ntt_scale {1}invnttK  nttK.
qed.

lemma polymulE (pa pb : poly) :
  pa &* pb =
  (Array256.init
    (fun (i : int) =>
      BigDom.BAdd.bigi
        predT
        (fun (k : int) =>
          pa.[k] * pb.[(i - k) %% 256] *
          ZqRing.exp (inFq (-1)) ((i - k) %/ 256))
        0 256)).
proof.
  rewrite /( &* ); apply/Array256.tP => i /mem_range mem_i_range.
  do 2!(rewrite Array256.initiE /=; [by apply/mem_range|]).
  rewrite -(ZqRing.addr0 (BigDom.BAdd.big _ _ _)); move: Zq.zero.
  have: (256 \in range 0 257) by apply/mem_range.
  have: (0 <= 256) by trivial.
  move: {1 2 4 7}256; elim => [_ /=|j le0j IHj /mem_range_addr /= mem_j_range] z.
  + by rewrite iota0 //= range_geq //= BigDom.BAdd.big_nil ZqRing.add0r.
  rewrite iotaSr // foldr_rcons /= rangeSr // BigDom.BAdd.big_rcons {1}/predT /=.
  move: mem_j_range; rewrite range_ltn //=; case => [->>//|mem_j_range].
  rewrite IHj; [by move: mem_j_range; apply/mem_range_incl|].
  case: (0 <= i - j) => [le0s|/ltrNge lts0].
  + rewrite divz_small.
    - rewrite le0s /= ltr_subl_addr; move: mem_i_range; apply/mem_range_gt.
      by rewrite -ler_subl_addl; move: mem_j_range; apply/mem_range_le.
    rewrite modz_small.
    - rewrite le0s /= ltr_subl_addr; move: mem_i_range; apply/mem_range_gt.
      by rewrite -ler_subl_addl; move: mem_j_range; apply/mem_range_le.
    by rewrite ZqRing.expr0 ZqRing.mulr1 -!ZqRing.addrA; congr; ring.
  move: (modzMDl 1 (i - j) 256) => /= <-.
  move: (divzMDl 1 (i - j) 256) => /=; rewrite (IntID.addrC 1) -subr_eq => <-.
  rewrite divz_small.
  + rewrite -mem_range mem_range_addl mem_range lts0 /=.
    rewrite ler_subr_addr; move: mem_i_range; apply/mem_range_le.
    by rewrite addrC subr_le0; move: mem_j_range; apply/mem_range_ge.
  rewrite modz_small.
  + rewrite -mem_range mem_range_addl mem_range lts0 /=.
    rewrite ler_subr_addr; move: mem_i_range; apply/mem_range_le.
    by rewrite addrC subr_le0; move: mem_j_range; apply/mem_range_ge.
  rewrite inFqN /= ZqRing.exprN ZqRing.expr1 ZqRing.invrN1 ZqRing.mulrN ZqRing.mulr1.
  by rewrite -!ZqRing.addrA; congr; ring.
qed.

lemma BigDom_BAdd_big_allpairs_idfun ['a, 'b] (f : 'a -> 'b -> Fq) s t :
  BigDom.BAdd.big predT idfun (allpairs f s t) =
  BigDom.BAdd.big predT (fun (x : 'a) => BigDom.BAdd.big predT (fun (y : 'b) => f x y) t) s.
proof. by rewrite BigDom.BAdd.big_allpairs; apply BigDom.BAdd.eq_big. qed.

lemma BigDom_BAdd_mulr_big_allpairs ['a] f1 f2 (s1 s2 : 'a list) :
  BigDom.BAdd.big predT f1 s1 * BigDom.BAdd.big predT f2 s2 =
  BigDom.BAdd.big predT idfun (allpairs (fun (x1, x2) => f1 x1 * f2 x2) s1 s2).
proof. by rewrite BigDom.mulr_big BigDom_BAdd_big_allpairs_idfun. qed.

lemma allpairs_map ['a, 'b, 'c] (f : 'a -> 'b -> 'c) s t :
  allpairs f s t = map (fun (p : 'a * 'b) => f p.`1 p.`2) (allpairs (fun x y => (x, y)) s t).
proof.
  rewrite /allpairs; elim: s => [|hs ts IHs] //=; move: IHs => ->.
  rewrite map_cat; congr; rewrite -map_comp; apply eq_map => x.
  by rewrite /(\o).
qed.

lemma BigDom_BAdd_big_allpairs_pair ['a, 'b] (f : 'a -> 'b -> Fq) s t :
  BigDom.BAdd.big predT (fun (x : 'a) => BigDom.BAdd.big predT (fun (y : 'b) => f x y) t) s =
  BigDom.BAdd.big predT (fun (p : 'a * 'b) => f p.`1 p.`2) (allpairs (fun (x1, x2) => (x1, x2)) s t).
proof.
  rewrite -BigDom_BAdd_big_allpairs_idfun.
  rewrite (BigDom.BAdd.eq_big _ predT _ (idfun \o (fun (p : 'a * 'b) => f p.`1 p.`2))) //.
  by rewrite -BigDom.BAdd.big_mapT -allpairs_map.
qed.

lemma BigDom_BAdd_mulr_big_allpairs_pair ['a] f1 f2 (s1 s2 : 'a list) :
  BigDom.BAdd.big predT f1 s1 * BigDom.BAdd.big predT f2 s2 =
  BigDom.BAdd.big predT (fun (p : 'a * 'a) => f1 p.`1 * f2 p.`2)
    (allpairs (fun (x1, x2) => (x1, x2)) s1 s2).
proof.
  rewrite BigDom_BAdd_mulr_big_allpairs allpairs_map BigDom.BAdd.big_mapT.
  by apply BigDom.BAdd.eq_big.
qed.

lemma eq_modz_inj (a b m n : int) :
  0 < n =>
  a \in range m (m + n) =>
  b \in range m (m + n) =>
  a %% n = b %% n =>
  a = b.
proof.
  move => lt0n mem_a_range mem_b_range eq_mod.
  rewrite (divz_eq a n) mem_range_addr addrAC mem_range_mulr // in mem_a_range.
  rewrite (IntID.addrC _ n) -{3}(IntID.mul1r n) (IntID.opprD (1 * n)) in mem_a_range.
  rewrite -mulNr divzMDl in mem_a_range; [by apply/gtr_eqF|].
  rewrite (opprD (-1)) /= (IntID.addrC 1) range_ltn in mem_a_range; [by apply/ltzS|].
  rewrite range_geq //= in mem_a_range.
  rewrite (divz_eq b n) mem_range_addr addrAC mem_range_mulr // in mem_b_range.
  rewrite (IntID.addrC _ n) -{3}(IntID.mul1r n) (IntID.opprD (1 * n)) in mem_b_range.
  rewrite -mulNr divzMDl in mem_b_range; [by apply/gtr_eqF|].
  rewrite (opprD (-1)) /= (IntID.addrC 1) range_ltn in mem_b_range; [by apply/ltzS|].
  rewrite range_geq //= in mem_b_range.
  by rewrite (divz_eq a n) (divz_eq b n); congr; congr; rewrite mem_a_range mem_b_range eq_mod.
qed.

lemma perm_mul_even :
  perm_eq
    (allpairs (fun (x1 x2 : int) => (x1, x2)) (range 0 128) (range 0 256))
    (map
      (fun (p : int * int) => ((p.`1 + p.`2 + 1) %% 128, 2 * p.`1 + 1) )
      (allpairs (fun (x1 x2 : int) => (x1, x2)) (range 0 128) (range 0 128)) ++
     map
      (fun (p : int * int) => ((p.`1 + p.`2) %% 128, 2 * p.`1) )
      (allpairs (fun (x1 x2 : int) => (x1, x2)) (range 0 128) (range 0 128))).
proof.
  apply/uniq_perm_eq.
  + by apply/allpairs_uniq; [apply/range_uniq|apply/range_uniq|].
  + rewrite cat_uniq; split; [|split].
    - rewrite map_inj_in_uniq; [|by apply/allpairs_uniq; [apply/range_uniq|apply/range_uniq|]].
      move => [x1 x2] [y1 y2] /= /allpairsP [[? ?] /=] [mem_x1_range] [mem_x2_range] [<<- <<-].
      move => /allpairsP [[? ?] /=] [mem_y1_range] [mem_y2_range] [<<- <<-] [eq_1].
      move => /addIr eq_2; move: (mulfI 2 _ x1 y1 _) => //= <<- /= {eq_2}; move: eq_1.
      rewrite !(IntID.addrAC _ _ 1); move: (eq_modz_inj (x1 + 1 + x2) (x1 + 1 + y2) (x1 + 1) 128 _ _ _) => //.
      * by rewrite mem_range_addl /= opprD !addrA addrAC /= addrAC.
      * by rewrite mem_range_addl /= opprD !addrA addrAC /= addrAC.
      by move => imp_ hyp_; move: (imp_ hyp_) => {imp_ hyp_} /addrI.
    - apply/hasPn => [] [x1 x2] /mapP [] [y1 y2] /= [] /allpairsP [[? ?] /=] [mem_y1_range] [mem_y2_range] [<<- <<-].
      move => [->> ->>]; apply/negP => /mapP [] [z1 z2] [] /allpairsP [[? ?] /=] [mem_z1_range] [mem_z2_range] [<<- <<-].
      apply/negP => -[_]; rewrite !(IntID.mulrC 2) => eq_; have: ((y1 * 2) %% 2 = (z1 * 2 + 1) %% 2) by rewrite eq_.
      by rewrite modzMl modzMDl.
    rewrite map_inj_in_uniq; [|by apply/allpairs_uniq; [apply/range_uniq|apply/range_uniq|]].
    move => [x1 x2] [y1 y2] /= /allpairsP [[? ?] /=] [mem_x1_range] [mem_x2_range] [<<- <<-].
    move => /allpairsP [[? ?] /=] [mem_y1_range] [mem_y2_range] [<<- <<-] [eq_1].
    move => eq_2; move: (mulfI 2 _ x1 y1 _) => //= <<- /= {eq_2}; move: eq_1.
    move: (eq_modz_inj (x1 + x2) (x1 + y2) x1 128 _ _ _) => //.
      * by rewrite mem_range_addl /= addrAC.
      * by rewrite mem_range_addl /= addrAC.
      by move => imp_ hyp_; move: (imp_ hyp_) => {imp_ hyp_} /addrI.
  move => [x1 x2]; rewrite mem_cat; split.
  + move => /allpairsP [[? ?] /=] [mem_x1_range] [mem_x2_range] [<<- <<-].
    move: (mem_range_mod x2 2 _) => //.
    rewrite range_ltn // range_ltn // range_geq //=; case => eq_mod.
    - right; apply/mapP => /=; exists (x2 %/ 2, (x1 - x2 %/ 2) %% 128) => //=.
      split; [|split]; first last.
      * by rewrite -modzDm modz_mod modzDm addrA addrAC /= modz_small //; apply/mem_range.
      * by rewrite (IntID.mulrC 2) {1}(divz_eq x2 2) eq_mod.
      apply/allpairsP => /=; exists (x2 %/ 2, (x1 - x2 %/ 2) %% 128) => /=.
      by rewrite range_div_range //= mem_x2_range /=; apply/(mem_range_mod _ 128).
    left; apply/mapP => /=; exists (x2 %/ 2, (x1 - x2 %/ 2 -1) %% 128) => //=.
    split; [|split]; first last.
    - by rewrite addrAC -modzDm modz_mod modzDm addrA addrAC /= addrA addrAC /= modz_small //; apply/mem_range.
    - by rewrite (IntID.mulrC 2) {1}(divz_eq x2 2) eq_mod.
    apply/allpairsP => /=; exists (x2 %/ 2, (x1 - x2 %/ 2 - 1) %% 128) => /=.
    by rewrite range_div_range //= mem_x2_range /=; apply/(mem_range_mod _ 128).
  case; move => /mapP [] [y1 y2] [] /allpairsP [[? ?] /=] [mem_y1_range] [mem_y2_range];
  move => [<<- <<-] [->> ->>]; apply/allpairsP => /=.
  + exists ((y1 + y2 + 1) %% 128, 2 * y1 + 1) => /=.
    by rewrite mem_range_addr mem_range_mull //= mem_y1_range /=; apply/(mem_range_mod _ 128).
  exists ((y1 + y2) %% 128, 2 * y1) => /=.
  by rewrite mem_range_mull //= mem_y1_range /=; apply/(mem_range_mod _ 128).
qed.

lemma perm_mul_odd :
  perm_eq
    (allpairs (fun (x1 x2 : int) => (x1, x2)) (range 0 128) (range 0 256))
    (map
      (fun (p : int * int) => ((p.`1 + p.`2) %% 128, 2 * p.`1) )
      (allpairs (fun (x1 x2 : int) => (x1, x2)) (range 0 128) (range 0 128)) ++
     map
      (fun (p : int * int) => ((p.`1 + p.`2) %% 128, 2 * p.`1 + 1) )
      (allpairs (fun (x1 x2 : int) => (x1, x2)) (range 0 128) (range 0 128))).
proof.
  apply/uniq_perm_eq.
  + by apply/allpairs_uniq; [apply/range_uniq|apply/range_uniq|].
  + rewrite cat_uniq; split; [|split].
    - rewrite map_inj_in_uniq; [|by apply/allpairs_uniq; [apply/range_uniq|apply/range_uniq|]].
      move => [x1 x2] [y1 y2] /= /allpairsP [[? ?] /=] [mem_x1_range] [mem_x2_range] [<<- <<-].
      move => /allpairsP [[? ?] /=] [mem_y1_range] [mem_y2_range] [<<- <<-] [eq_1].
      move => eq_2; move: (mulfI 2 _ x1 y1 _) => //= <<- /= {eq_2}; move: eq_1.
      move: (eq_modz_inj (x1 + x2) (x1 + y2) x1 128 _ _ _) => //.
      * by rewrite mem_range_addl /= addrAC.
      * by rewrite mem_range_addl /= addrAC.
      by move => imp_ hyp_; move: (imp_ hyp_) => {imp_ hyp_} /addrI.
    - apply/hasPn => [] [x1 x2] /mapP [] [y1 y2] /= [] /allpairsP [[? ?] /=] [mem_y1_range] [mem_y2_range] [<<- <<-].
      move => [->> ->>]; apply/negP => /mapP [] [z1 z2] [] /allpairsP [[? ?] /=] [mem_z1_range] [mem_z2_range] [<<- <<-].
      apply/negP => -[_]; rewrite !(IntID.mulrC 2) => eq_; have: ((y1 * 2 + 1) %% 2 = (z1 * 2) %% 2) by rewrite eq_.
      by rewrite modzMl modzMDl.
    rewrite map_inj_in_uniq; [|by apply/allpairs_uniq; [apply/range_uniq|apply/range_uniq|]].
    move => [x1 x2] [y1 y2] /= /allpairsP [[? ?] /=] [mem_x1_range] [mem_x2_range] [<<- <<-].
    move => /allpairsP [[? ?] /=] [mem_y1_range] [mem_y2_range] [<<- <<-] [eq_1].
    move => /addIr eq_2; move: (mulfI 2 _ x1 y1 _) => //= <<- /= {eq_2}; move: eq_1.
    move: (eq_modz_inj (x1 + x2) (x1 + y2) x1 128 _ _ _) => //.
      * by rewrite mem_range_addl /= addrAC.
      * by rewrite mem_range_addl /= addrAC.
      by move => imp_ hyp_; move: (imp_ hyp_) => {imp_ hyp_} /addrI.
  move => [x1 x2]; rewrite mem_cat; split.
  + move => /allpairsP [[? ?] /=] [mem_x1_range] [mem_x2_range] [<<- <<-].
    move: (mem_range_mod x2 2 _) => //.
    rewrite range_ltn // range_ltn // range_geq //=; case => eq_mod; last first.
    - right; apply/mapP => /=; exists (x2 %/ 2, (x1 - x2 %/ 2) %% 128) => //=.
      split; [|split]; first last.
      * by rewrite -modzDm modz_mod modzDm addrA addrAC /= modz_small //; apply/mem_range.
      * by rewrite (IntID.mulrC 2) {1}(divz_eq x2 2) eq_mod.
      apply/allpairsP => /=; exists (x2 %/ 2, (x1 - x2 %/ 2) %% 128) => /=.
      by rewrite range_div_range //= mem_x2_range /=; apply/(mem_range_mod _ 128).
    left; apply/mapP => /=; exists (x2 %/ 2, (x1 - x2 %/ 2) %% 128) => //=.
    split; [|split]; first last.
    - by rewrite -modzDm modz_mod modzDm addrA addrAC /= modz_small //; apply/mem_range.
    - by rewrite (IntID.mulrC 2) {1}(divz_eq x2 2) eq_mod.
    apply/allpairsP => /=; exists (x2 %/ 2, (x1 - x2 %/ 2) %% 128) => /=.
    by rewrite range_div_range //= mem_x2_range /=; apply/(mem_range_mod _ 128).
  case; move => /mapP [] [y1 y2] [] /allpairsP [[? ?] /=] [mem_y1_range] [mem_y2_range];
  move => [<<- <<-] [->> ->>]; apply/allpairsP => /=.
  + exists ((y1 + y2) %% 128, 2 * y1) => /=.
    by rewrite mem_range_mull //= mem_y1_range /=; apply/(mem_range_mod _ 128).
  exists ((y1 + y2) %% 128, 2 * y1 + 1) => /=.
  by rewrite mem_range_addr mem_range_mull //= mem_y1_range /=; apply/(mem_range_mod _ 128).
qed.

(*TODO: the spec of ( &* ) is incorrect: some bitreverse required.*)
lemma mul_comm_ntt (pa pb : poly):
  ntt (pa &* pb) = basemul (ntt pa) (ntt pb).
proof.
  rewrite /ntt polymulE /basemul; apply/Array256.tP => i /mem_range mem_i_range.
  do 2!(rewrite Array256.initiE /=; [by apply/mem_range|]).
  rewrite Array256.initiE /=; [by apply/mem_range/mem_range_mull/range_div_range|].
  rewrite Array256.initiE /=; [by apply/mem_range/mem_range_addr/mem_range_mull/range_div_range|].
  rewrite Array256.initiE /=; [by apply/mem_range/mem_range_mull/range_div_range|].
  rewrite Array256.initiE /=; [by apply/mem_range/mem_range_addr/mem_range_mull/range_div_range|].
  rewrite modzMr /= (IntID.mulrC 2 (i %/ 2)) modzMDl /= divzMDl //= mulzK //=.
  rewrite /cmplx_mul /= !BigDom_BAdd_mulr_big_allpairs_pair.
  move: (mem_range_mod i 2 _) => //.
  rewrite range_ltn // range_ltn // range_geq //=.
  case => eq_mod; rewrite eq_mod /=.
  + pose f j:=
      (BigDom.BAdd.bigi predT
        (fun (k : int) =>
          pa.[k] * pb.[(2 * j - k) %% 256] *
          ZqRing.exp (inFq (-1)) ((2 * j - k) %/ 256) *
          ZqRing.exp zroot ((2 * br (i %/ 2) + 1) * j) )
        0 256).
    rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
    - move => j /mem_range mem_j_range /=.
      rewrite Array256.initiE /=; [by apply/mem_range/mem_range_mull|].
      by rewrite BigDom.BAdd.mulr_suml; apply BigDom.BAdd.eq_big_int => k /mem_range mem_k_range.
    rewrite BigDom_BAdd_big_allpairs_pair (BigDom.BAdd.eq_big_perm _ _ _ _ perm_mul_even).
    rewrite BigDom.BAdd.big_cat; congr.
    - rewrite BigDom.BAdd.big_mapT BigDom.BAdd.mulr_suml.
      apply/BigDom.BAdd.eq_big_seq => //= -[x1 x2].
      move => /allpairsP /= [] [? ?] /= [mem_x1_range] [mem_x2_range] [<<- <<-]; rewrite /(\o) /=.
      rewrite -!ZqRing.mulrA; congr; rewrite !ZqRing.mulrA (ZqRing.mulrC (ZqRing.exp _ _)) -!ZqRing.mulrA.
      rewrite -!ZqRing.exprD; [by apply/unit_zroot_ring|by apply/unit_zroot_ring|].
      rewrite mulz_modr //= -modzDm modz_mod modzDm; congr; [congr|].
      * rewrite !mulrDr addrAC opprD !addrA /= (addrAC (2 * _)) /= modz_small //.
        by rewrite -mem_range mem_range_addr mem_range_mull.
      rewrite addrA -mulrDr (IntID.mulrC _ (x1 + x2)) -mulrSl (IntID.mulrC (x1 + x2 + 1)).
      rewrite -(mulz_modr 2 (x1 + x2 + 1) 128) // {3}(divz_eq (x1 + x2 + 1) 128).
      rewrite mulrDr !mulrA mulrAC (mulrDl _ _ 128) /= mulrAC /= (mulrDl _ 128).
      rewrite !ZqRing.exprD ?unit_zroot_ring //; congr.
      rewrite -mulrA ZqRing.exprM exp_zroot_256_ring ZqRing.expr1z ZqRing.mul1r.
      rewrite ZqRing.exprM exp_zroot_128_ring !exp_ring.
      rewrite (exp_mod _ _ _ exp_neg1_2) eq_sym (exp_mod _ _ _ exp_neg1_2) eq_sym; congr.
      move: (mem_range_add2 _ _ _ _ _ _ mem_x1_range mem_x2_range) => /=.
      move => /(mem_range_addr 1 256 (x1 + x2) 1); rewrite (range_cat 128) //.
      rewrite mem_cat; case => mem_add_range.
      * rewrite (modz_small _ 128); [by apply/mem_range; move: mem_add_range; apply/mem_range_incl|].
        rewrite (divz_small _ 128); [by apply/mem_range; move: mem_add_range; apply/mem_range_incl|].
        rewrite /= !mulrDr opprD !addrA addrAC /= addrAC (IntID.addrAC _ _ (- 2 * _)) /=.
        by rewrite divz_small //=; apply/mem_range; rewrite mem_range_addr mem_range_mull.
      rewrite -(subrK (x1 + x2 + 1) 128) modzDr (divzDr _ 128) ?dvdzz //.
      rewrite (modz_small _ 128); [by apply/mem_range/mem_range_subr; move: mem_add_range; apply/mem_range_incl|].
      rewrite (divz_small _ 128); [by apply/mem_range/mem_range_subr; move: mem_add_range; apply/mem_range_incl|].
      rewrite /= !mulrDr opprD !addrA addrAC /= addrAC (IntID.addrAC _ _ (- 2 * _)) /=.
      have ->: -255 = 1 + (-1) * 256 by trivial.
      by rewrite addrA addrC divzMDl // divz_small //= -mem_range mem_range_addr mem_range_mull.
    rewrite BigDom.BAdd.big_mapT.
    apply/BigDom.BAdd.eq_big_seq => //= -[x1 x2].
    move => /allpairsP /= [] [? ?] /= [mem_x1_range] [mem_x2_range] [<<- <<-]; rewrite /(\o) /=.
    rewrite -!ZqRing.mulrA; congr; rewrite !ZqRing.mulrA (ZqRing.mulrC (ZqRing.exp _ _)) -!ZqRing.mulrA.
    rewrite -ZqRing.exprD; [by apply/unit_zroot_ring|].
    rewrite mulz_modr //= -modzDm modz_mod modzDm; congr; [congr|].
    - rewrite !mulrDr addrAC /= modz_small //.
      by rewrite -mem_range mem_range_mull.
    rewrite -mulrDr (IntID.mulrC _ (x1 + x2)).
    rewrite (IntID.mulrC _ 2) -(mulz_modr 2 (x1 + x2) 128) // {3}(divz_eq (x1 + x2) 128).
    rewrite mulrDr !mulrA mulrAC (mulrDl _ _ 128) /= mulrAC /= (mulrDl _ 128).
    rewrite !ZqRing.exprD ?unit_zroot_ring //; congr.
    rewrite -mulrA ZqRing.exprM exp_zroot_256_ring ZqRing.expr1z ZqRing.mul1r.
    rewrite ZqRing.exprM exp_zroot_128_ring !exp_ring.
    rewrite (exp_mod _ _ _ exp_neg1_2) eq_sym (exp_mod _ _ _ exp_neg1_2) eq_sym; congr.
    move: (mem_range_add2 _ _ _ _ _ _ mem_x1_range mem_x2_range) => /=.
    rewrite (range_cat 128) //.
    rewrite mem_cat; case => mem_add_range.
    - rewrite (modz_small _ 128); [by apply/mem_range; move: mem_add_range; apply/mem_range_incl|].
      rewrite (divz_small _ 128); [by apply/mem_range; move: mem_add_range; apply/mem_range_incl|].
      rewrite /= !mulrDr addrAC /=.
      by rewrite divz_small //=; apply/mem_range; rewrite mem_range_mull.
    rewrite -(subrK (x1 + x2) 128) modzDr (divzDr _ 128) ?dvdzz //.
    rewrite (modz_small _ 128); [by apply/mem_range/mem_range_subr; move: mem_add_range; apply/mem_range_incl|].
    rewrite (divz_small _ 128); [by apply/mem_range/mem_range_subr; move: mem_add_range; apply/mem_range_incl|].
    rewrite /= !mulrDr addrAC /= (IntID.addrAC _ _ (- 2 * _)) /=.
    have ->: -256 = (-1) * 256 by trivial.
    by rewrite addrC divzMDl // divz_small //= -mem_range mem_range_mull.
  pose f j:=
    (BigDom.BAdd.bigi predT
      (fun (k : int) =>
        pa.[k] * pb.[(2 * j + 1 - k) %% 256] *
        ZqRing.exp (inFq (-1)) ((2 * j + 1 - k) %/ 256) *
        ZqRing.exp zroot ((2 * br (i %/ 2) + 1) * j) )
      0 256).
  rewrite (BigDom.BAdd.eq_big_int _ _ _ f); rewrite /f => {f}.
  + move => j /mem_range mem_j_range /=.
    rewrite Array256.initiE /=; [by apply/mem_range/mem_range_addr/mem_range_mull|].
    by rewrite BigDom.BAdd.mulr_suml; apply BigDom.BAdd.eq_big_int => k /mem_range mem_k_range.
  rewrite BigDom_BAdd_big_allpairs_pair (BigDom.BAdd.eq_big_perm _ _ _ _ perm_mul_odd).
  rewrite BigDom.BAdd.big_cat; congr.
  + rewrite BigDom.BAdd.big_mapT.
    apply/BigDom.BAdd.eq_big_seq => //= -[x1 x2].
    move => /allpairsP /= [] [? ?] /= [mem_x1_range] [mem_x2_range] [<<- <<-]; rewrite /(\o) /=.
    rewrite -!ZqRing.mulrA; congr; rewrite !ZqRing.mulrA (ZqRing.mulrC (ZqRing.exp _ _)) -!ZqRing.mulrA.
    rewrite -!ZqRing.exprD; [by apply/unit_zroot_ring|].
    rewrite -addrA mulz_modr //= -modzDm modz_mod modzDm; congr; [congr|].
    - rewrite addrA addrAC mulrDr (addrAC (2 * _)) /= modz_small //.
      by rewrite -mem_range mem_range_addr mem_range_mull.
    rewrite -mulrDr -(mulz_modr 2 (x1 + x2) 128) // {3}(divz_eq (x1 + x2) 128).
    rewrite mulrDr !mulrA mulrAC (mulrDl _ _ 128) /= mulrAC /= (mulrDl _ 128).
    rewrite !ZqRing.exprD ?unit_zroot_ring //; congr.
    rewrite -mulrA ZqRing.exprM exp_zroot_256_ring ZqRing.expr1z ZqRing.mul1r.
    rewrite ZqRing.exprM exp_zroot_128_ring !exp_ring.
    rewrite (exp_mod _ _ _ exp_neg1_2) eq_sym (exp_mod _ _ _ exp_neg1_2) eq_sym; congr.
    move: (mem_range_add2 _ _ _ _ _ _ mem_x1_range mem_x2_range) => /=.
    rewrite (range_cat 128) //.
    rewrite mem_cat; case => mem_add_range.
    - rewrite (modz_small _ 128); [by apply/mem_range; move: mem_add_range; apply/mem_range_incl|].
      rewrite (divz_small _ 128); [by apply/mem_range; move: mem_add_range; apply/mem_range_incl|].
      rewrite /= !mulrDr !addrA addrAC /= (IntID.addrAC _ _ (- 2 * _)) /=.
      by rewrite divz_small //=; apply/mem_range; rewrite mem_range_addr mem_range_mull.
    rewrite -(subrK (x1 + x2) 128) modzDr (divzDr _ 128) ?dvdzz //.
    rewrite (modz_small _ 128); [by apply/mem_range/mem_range_subr; move: mem_add_range; apply/mem_range_incl|].
    rewrite (divz_small _ 128); [by apply/mem_range/mem_range_subr; move: mem_add_range; apply/mem_range_incl|].
    rewrite /= !mulrDr !addrA /= addrAC (IntID.addrAC _ _ (- 2 * _)) /=.
    have ->: -255 = 1 + (-1) * 256 by trivial.
    by rewrite addrA addrC divzMDl // divz_small //= -mem_range mem_range_addr mem_range_mull.
  rewrite BigDom.BAdd.big_mapT.
  apply/BigDom.BAdd.eq_big_seq => //= -[x1 x2].
  move => /allpairsP /= [] [? ?] /= [mem_x1_range] [mem_x2_range] [<<- <<-]; rewrite /(\o) /=.
  rewrite -!ZqRing.mulrA; congr; rewrite !ZqRing.mulrA (ZqRing.mulrC (ZqRing.exp _ _)) -!ZqRing.mulrA.
  rewrite -ZqRing.exprD; [by apply/unit_zroot_ring|].
  rewrite opprD !addrA addrAC /= mulz_modr //= -modzDm modz_mod modzDm; congr; [congr|].
  + rewrite !mulrDr addrAC /= modz_small //.
    by rewrite -mem_range mem_range_mull.
  rewrite -mulrDr (IntID.mulrC _ (x1 + x2)).
  rewrite (IntID.mulrC _ 2) -(mulz_modr 2 (x1 + x2) 128) // {3}(divz_eq (x1 + x2) 128).
  rewrite mulrDr !mulrA mulrAC (mulrDl _ _ 128) /= mulrAC /= (mulrDl _ 128).
  rewrite !ZqRing.exprD ?unit_zroot_ring //; congr.
  rewrite -mulrA ZqRing.exprM exp_zroot_256_ring ZqRing.expr1z ZqRing.mul1r.
  rewrite ZqRing.exprM exp_zroot_128_ring !exp_ring.
  rewrite (exp_mod _ _ _ exp_neg1_2) eq_sym (exp_mod _ _ _ exp_neg1_2) eq_sym; congr.
  move: (mem_range_add2 _ _ _ _ _ _ mem_x1_range mem_x2_range) => /=.
  rewrite (range_cat 128) //.
  rewrite mem_cat; case => mem_add_range.
  + rewrite (modz_small _ 128); [by apply/mem_range; move: mem_add_range; apply/mem_range_incl|].
    rewrite (divz_small _ 128); [by apply/mem_range; move: mem_add_range; apply/mem_range_incl|].
    rewrite /= !mulrDr addrAC /=.
    by rewrite divz_small //=; apply/mem_range; rewrite mem_range_mull.
  rewrite -(subrK (x1 + x2) 128) modzDr (divzDr _ 128) ?dvdzz //.
  rewrite (modz_small _ 128); [by apply/mem_range/mem_range_subr; move: mem_add_range; apply/mem_range_incl|].
  rewrite (divz_small _ 128); [by apply/mem_range/mem_range_subr; move: mem_add_range; apply/mem_range_incl|].
  rewrite /= !mulrDr addrAC (IntID.addrAC _ _ (- 2 * _)) /=.
  have ->: -256 = (-1) * 256 by trivial.
  by rewrite addrC divzMDl // divz_small //= -mem_range mem_range_mull.
qed.

lemma add_comm_ntt (pa pb : poly):
  ntt (pa &+ pb) = (ntt pa) &+ (ntt pb).
proof.
  rewrite /ntt /(&+); apply/Array256.tP => i /mem_range mem_i_range.
  rewrite Array256.map2iE /=; [by apply/mem_range|].
  do 3!(rewrite Array256.initiE /=; [by apply/mem_range|]).
  case: (i %% 2 = 0) => eq_mod.
  + rewrite -BigDom.BAdd.big_split; apply BigDom.BAdd.eq_big_int.
    move => j /mem_range mem_j_range /=.
    rewrite Array256.map2iE /=; [by apply/mem_range/mem_range_mull|].
    by rewrite ZqRing.mulrDl.
  rewrite -BigDom.BAdd.big_split; apply BigDom.BAdd.eq_big_int.
  move => j /mem_range mem_j_range /=.
  rewrite Array256.map2iE /=; [by apply/mem_range/mem_range_addr/mem_range_mull|].
  by rewrite ZqRing.mulrDl.
qed.

lemma add_comm_invntt (pa pb : poly) : 
  invntt (pa &+ pb) = (invntt pa) &+ (invntt pb)
    by smt(invnttK nttK add_comm_ntt).

lemma mul_comm_invntt : forall (pa pb : poly), 
  invntt (basemul pa  pb) = (invntt pa) &* (invntt pb)
    by smt(invnttK nttK mul_comm_ntt).

lemma nttZero : ntt KPoly.zero = KPoly.zero.
proof.
  rewrite /ntt /KPoly.zero; apply/Array256.tP => i /mem_range mem_i_range.
  rewrite Array256.createiE; [by apply/mem_range|].
  rewrite Array256.initiE /=; [by apply/mem_range|].
  rewrite (BigDom.BAdd.eq_big_int _ _ _ (fun _ => Zq.zero)).
  + move => j /mem_range mem_j_range /=.
    rewrite Array256.createiE; [by apply/mem_range/mem_range_mull|].
    by rewrite ZqRing.mul0r.
  rewrite BigDom.BAdd.big1_eq.
  rewrite (BigDom.BAdd.eq_big_int _ _ _ (fun _ => Zq.zero)).
  + move => j /mem_range mem_j_range /=.
    rewrite Array256.createiE; [by apply/mem_range/mem_range_addr/mem_range_mull|].
    by rewrite ZqRing.mul0r.
  by rewrite BigDom.BAdd.big1_eq; case: (i %% 2 = 0).
qed.

lemma invnttzero : invntt KPoly.zero = KPoly.zero by 
   smt(invnttK nttZero).



end NTT_Fq.
