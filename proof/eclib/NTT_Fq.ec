require import AllCore List IntDiv Ring StdOrder BitEncoding.

from JazzEC require import Array256 Array128.

from CryptoSpecs require import GFq Rq Correctness768.

require import Fq Fastexp.

import Zq IntOrder BitReverse.

theory NTT_Fq.


clone include Fastexp with
  type CR.t <- coeff,
  op CR.zeror <- Zq.zero,
  op CR.oner <- Zq.one,
  op CR.(+) <- Zq.(+),
  op CR.([ - ]) <- Zq.([-]),
  op CR.( * ) <- Zq.( * ),
  op CR.invr  <- Zq.inv,
  op CR.exp  <- Zq.exp,
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


(* These are imperative specifications of the NTT algorithms whose control
   structure matches what is implemented.  *)

module NTT = {
 proc ntt(r : coeff Array256.t,  zetas : coeff Array128.t) : coeff Array256.t = {
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

 proc invntt(r : coeff Array256.t, zetas_inv : coeff Array128.t) : coeff Array256.t = {
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

op R = incoeff Fq.SignedReductions.R.

op scale127 = incoeff (-26).

op array128_mont_inv (p : coeff Array128.t) =
  (Array128.map (fun x => x * R) p).[127 <- p.[127] * R * R].

op zetas_inv : coeff Array128.t =
  let vv = Array128.init (fun k => Zq.exp zroot (- (bsrev 8 (k * 2) + 1))) in
      vv.[127 <- scale127].

lemma zetas_invE: zetas_inv = Array128.of_list witness 
 [
(*l0L*) incoeff 1175 ; incoeff 2444 ; incoeff 394 ; incoeff 1219 ; incoeff 2300 ; incoeff 1455; incoeff 2117 ; incoeff 1607 ; incoeff 2443 ; incoeff 554 ; incoeff 1179 ; incoeff 2186; incoeff 2303 ; incoeff 2926 ; incoeff 2237 ; incoeff 525 ; incoeff 735 ; incoeff 863 ; incoeff 2768 ; incoeff 1230 ; incoeff 2572 ; incoeff 556 ; incoeff 3010 ; incoeff 2266 ; incoeff 1684 ; incoeff 1239 ; incoeff 780 ; incoeff 2954 ; incoeff 109 ; incoeff 1292 ; incoeff 1031 ; incoeff 1745
(*l0R*) ; incoeff 2688 ; incoeff 3061 ; incoeff 992 ; incoeff 2596 ; incoeff 941 ; incoeff 892 ; incoeff 1021 ; incoeff 2390 ; incoeff 642 ; incoeff 1868 ; incoeff 2377 ; incoeff 1482 ; incoeff 1540 ; incoeff 540 ; incoeff 1678 ; incoeff 1626 ; incoeff 279 ; incoeff 314 ; incoeff 1173 ; incoeff 2573 ; incoeff 3096 ; incoeff 48 ; incoeff 667 ; incoeff 1920 ; incoeff 2229 ; incoeff 1041 ; incoeff 2606 ; incoeff 1692 ; incoeff 680 ; incoeff 2746 ; incoeff 568 ; incoeff 3312
(*l1L*) ; incoeff 2419 ; incoeff 2102 ; incoeff 219 ; incoeff 855 ; incoeff 2681 ; incoeff 1848 ; incoeff 712 ; incoeff 682 ; incoeff 927 ; incoeff 1795 ; incoeff 461 ; incoeff 1891 ; incoeff 2877 ; incoeff 2522 ; incoeff 1894 ; incoeff 1010
(*l1R*) ; incoeff 1414 ; incoeff 2009 ; incoeff 3296 ; incoeff 464 ; incoeff 2697 ; incoeff 816 ; incoeff 1352 ; incoeff 2679 ; incoeff 1274 ; incoeff 1052 ; incoeff 1025 ; incoeff 2132 ; incoeff 1573 ; incoeff 76 ; incoeff 2998 ; incoeff 3040
(*l2L*) ; incoeff 2508 ; incoeff 1355 ; incoeff 450 ; incoeff 936 ; incoeff 447 ; incoeff 2794 ; incoeff 1235 ; incoeff 1903
(*l2R*) ; incoeff 1996 ; incoeff 1089 ; incoeff 3273 ; incoeff 283 ; incoeff 1853 ; incoeff 1990 ; incoeff 882 ; incoeff 3033
(*l3L*) ; incoeff 1583 ; incoeff 2760 ; incoeff 69 ; incoeff 543
(*l3R*) ; incoeff 2532 ; incoeff 3136 ; incoeff 1410 ; incoeff 2267
(*l4L*) ; incoeff 2481 ; incoeff 1432
(*l4R*) ; incoeff 2699 ; incoeff 687
(*l5L*) ; incoeff 40
(*l5R*) ; incoeff 749
(*l6*)  ; incoeff 1600
; incoeff 3303 ].
proof.
apply/Array128.ext_eq; move => i /mem_range mem_i_range.
rewrite /zetas_inv /= Array128.get_set_if /= /scale127 {1 2}/R /Fq.SignedReductions.R /=.
case: (i=127) => E.
 by rewrite E initiE //= -eq_incoeff /q /=.
rewrite initiE /=; first by rewrite -mem_range.
  rewrite -!ZqField.exprV inv_zroot.
  rewrite ZqField.exprS; [by rewrite bsrev_ge0|].
  rewrite -!(fastexp_nbitsP 8) ?bsrev_range //.
  rewrite /fastexp_nbits !int2bs_bsrev !revK /zroot.
  have incoeffQ_mod : forall (a : int) , incoeff (a * a %% q) = incoeff a * incoeff a.
  + by move => ?; rewrite -incoeffM_mod.
  do 8!(rewrite BS2Int.int2bs_rcons //= foldr_rcons /= -!incoeffQ_mod /q /=).
  rewrite BS2Int.int2bs0s /= ComRing.mul1r => {incoeffQ_mod}; move: i mem_i_range E.
rewrite /range /=; apply/List.allP.
by rewrite -JUtils.iotaredE /=  -!incoeffM_mod /= !incoeffK /q /=.
qed.

lemma scale127E :
  scale127 = inv (incoeff 128).
proof.
  apply/(ZqRing.mulrI (incoeff 128)).
  + by apply/unitE; rewrite -eq_incoeff /q.
  rewrite /scale127 -incoeffM_mod /q /= eq_sym -ZqRing.unitrE.
  by apply/unitE; rewrite -eq_incoeff /q.
qed.

(* These are powers of roots of unit in Mont form and
   bitwise permuted indices  zetas inv above needs to be
   defined, this axiom discharged, and then used to
   discharge other axioms below. *)
lemma zetas_inv_vals : array128_mont_inv zetas_inv =
    Array128.of_list witness
       [ incoeff 1701; incoeff 1807; incoeff 1460; 
         incoeff 2371; incoeff 2338; incoeff 2333; 
         incoeff 308; incoeff 108; incoeff 2851; 
         incoeff 870; incoeff 854; incoeff 1510; 
         incoeff 2535; incoeff 1278; incoeff 1530; 
         incoeff 1185; incoeff 1659; incoeff 1187; 
         incoeff 3109; incoeff 874; incoeff 1335; 
         incoeff 2111; incoeff 136; incoeff 1215; 
         incoeff 2945; incoeff 1465; incoeff 1285; 
         incoeff 2007; incoeff 2719; incoeff 2726; 
         incoeff 2232; incoeff 2512; incoeff 75; 
         incoeff 156; incoeff 3000; incoeff 2911; 
         incoeff 2980; incoeff 872; incoeff 2685; 
         incoeff 1590; incoeff 2210; incoeff 602; 
         incoeff 1846; incoeff 777; incoeff 147; 
         incoeff 2170; incoeff 2551; incoeff 246; 
         incoeff 1676; incoeff 1755; incoeff 460; 
         incoeff 291; incoeff 235; incoeff 3152; 
         incoeff 2742; incoeff 2907; incoeff 3224; 
         incoeff 1779; incoeff 2458; incoeff 1251; 
         incoeff 2486; incoeff 2774; incoeff 2899; 
         incoeff 1103; incoeff 1275; incoeff 2652; 
         incoeff 1065; incoeff 2881; incoeff 725; 
         incoeff 1508; incoeff 2368; incoeff 398; 
         incoeff 951; incoeff 247; incoeff 1421; 
         incoeff 3222; incoeff 2499; incoeff 271; 
         incoeff 90; incoeff 853; incoeff 1860; 
         incoeff 3203; incoeff 1162; incoeff 1618; 
         incoeff 666; incoeff 320; incoeff 8; 
         incoeff 2813; incoeff 1544; incoeff 282; 
         incoeff 1838; incoeff 1293; incoeff 2314; 
         incoeff 552; incoeff 2677; incoeff 2106; 
         incoeff 1571; incoeff 205; incoeff 2918; 
         incoeff 1542; incoeff 2721; incoeff 2597; 
         incoeff 2312; incoeff 681; incoeff 130; 
         incoeff 1602; incoeff 1871; incoeff 829; 
         incoeff 2946; incoeff 3065; incoeff 1325; 
         incoeff 2756; incoeff 1861; incoeff 1474; 
         incoeff 1202; incoeff 2367; incoeff 3147; 
         incoeff 1752; incoeff 2707; incoeff 171; 
         incoeff 3127; incoeff 3042; incoeff 1907; 
         incoeff 1836; incoeff 1517; incoeff 359; 
         incoeff 758; incoeff 1441].
proof.
  apply/Array128.ext_eq => i /mem_range mem_i_range.
  rewrite /array128_mont_inv /zetas_inv /=.
  rewrite Array128.get_set_if /= /scale127 {1 2}/R /Fq.SignedReductions.R.
  rewrite -(incoeffM_mod (-26)) /q /= -incoeffM_mod /q /=.
  rewrite mapiE /=; [by rewrite -mem_range|].
  rewrite get_setE //= initiE /=; [by rewrite -mem_range|].
  move: mem_i_range; rewrite (rangeSr _ 127) // mem_rcons /=.
  case => [->> //=|mem_i_range]; rewrite ltr_eqF /=.
  + by move: mem_i_range; apply mem_range_gt.
  rewrite -!ZqField.exprV inv_zroot.
  rewrite ZqField.exprS; [by rewrite bsrev_ge0|].
  rewrite -!(fastexp_nbitsP 8) ?bsrev_range //.
  rewrite /fastexp_nbits !int2bs_bsrev !revK /zroot.
  have incoeffQ_mod : forall (a : int) , incoeff (a * a %% q) = incoeff a * incoeff a.
  + by move => ?; rewrite -incoeffM_mod.
  do 8!(rewrite BS2Int.int2bs_rcons //= foldr_rcons /= -!incoeffQ_mod /q /=).
  rewrite BS2Int.int2bs0s /= ComRing.mul1r => {incoeffQ_mod}; move: mem_i_range.
  do 127!(rewrite range_ltn //=; move => [->> /=|];
            [by rewrite -!incoeffM_mod !incoeffK /q|]).
  by rewrite range_geq.
qed.

op array128_mont (p : coeff Array128.t) =
  Array128.map (fun x => x * R) p.

op zetas : coeff Array128.t = 
    Array128.init (fun k => Zq.exp zroot (bsrev 8 (k * 2))).

lemma zetasE:
 zetas = Array128.of_list witness
          [incoeff 1;
 (*l0*)    incoeff 1729;
 (*l1_L*)  incoeff 2580;
 (*l1_R*)  incoeff 3289;
 (*l2_L*)  incoeff 2642; incoeff 630;
 (*l2_R*)  incoeff 1897; incoeff 848;
 (*l3_L*)  incoeff 1062; incoeff 1919; incoeff 193; incoeff 797;
 (*l3_R*)  incoeff 2786; incoeff 3260; incoeff 569; incoeff 1746;
 (*l4_L*)  incoeff 296; incoeff 2447; incoeff 1339; incoeff 1476; incoeff 3046; incoeff 56; incoeff 2240; incoeff 1333;
 (*l4_R*)  incoeff 1426; incoeff 2094; incoeff 535; incoeff 2882; incoeff 2393; incoeff 2879; incoeff 1974; incoeff 821;
 (*l5_L*)  incoeff 289; incoeff 331; incoeff 3253; incoeff 1756; incoeff 1197; incoeff 2304; incoeff 2277; incoeff 2055; incoeff 650; incoeff 1977; incoeff 2513; incoeff 632; incoeff 2865; incoeff 33; incoeff 1320; incoeff 1915;
 (*l5_R*)  incoeff 2319; incoeff 1435; incoeff 807; incoeff 452; incoeff 1438; incoeff 2868; incoeff 1534; incoeff 2402; incoeff 2647; incoeff 2617; incoeff 1481; incoeff 648; incoeff 2474; incoeff 3110; incoeff 1227; incoeff 910;
 (*l6_L*)  incoeff 17; incoeff 2761; incoeff 583; incoeff 2649; incoeff 1637; incoeff 723; incoeff 2288; incoeff 1100; incoeff 1409; incoeff 2662; incoeff 3281; incoeff 233; incoeff 756; incoeff 2156; incoeff 3015; incoeff 3050; 
           incoeff 1703; incoeff 1651; incoeff 2789; incoeff 1789; incoeff 1847; incoeff 952; incoeff 1461; incoeff 2687; incoeff 939; incoeff 2308; incoeff 2437; incoeff 2388; incoeff 733; incoeff 2337; incoeff 268; incoeff 641;
 (*l6_R*)  incoeff 1584; incoeff 2298; incoeff 2037; incoeff 3220; incoeff 375; incoeff 2549; incoeff 2090; incoeff 1645; incoeff 1063; incoeff 319; incoeff 2773; incoeff 757; incoeff 2099; incoeff 561; incoeff 2466; incoeff 2594;
           incoeff 2804; incoeff 1092; incoeff 403; incoeff 1026; incoeff 1143; incoeff 2150; incoeff 2775; incoeff 886; incoeff 1722; incoeff 1212; incoeff 1874; incoeff 1029; incoeff 2110; incoeff 2935; incoeff 885; incoeff 2154].
proof.
  apply/Array128.ext_eq => i /mem_range mem_i_range.
  rewrite /zetas -?mem_range //.
  rewrite initiE -?mem_range //; move: mem_i_range.
  rewrite /= -(fastexp_nbitsP 8) ?bsrev_range //.
  rewrite /fastexp_nbits int2bs_bsrev revK /R /Fq.SignedReductions.R.
  do 8!(rewrite BS2Int.int2bs_rcons //= foldr_rcons /= /q /=).
  rewrite BS2Int.int2bs0s /= ComRing.mul1r.
  do 128!(rewrite range_ltn //=; move => [->> /=|];
            [by rewrite -!incoeffM_mod !incoeffK /q|]).
  by rewrite range_geq.
qed.

(* These are powers of roots of unit in Mont form and
   bitwise permuted indices  zetas inv above needs to be
   defined, this axiom discharged, and then used to
   discharge other axioms below. *)
lemma zetas_vals : array128_mont zetas =
    Array128.of_list witness
       [incoeff 2285; incoeff 2571; incoeff 2970; 
         incoeff 1812; incoeff 1493; incoeff 1422; 
         incoeff 287; incoeff 202; incoeff 3158; 
         incoeff 622; incoeff 1577; incoeff 182; 
         incoeff 962; incoeff 2127; incoeff 1855; 
         incoeff 1468; incoeff 573; incoeff 2004; 
         incoeff 264; incoeff 383; incoeff 2500; 
         incoeff 1458; incoeff 1727; incoeff 3199; 
         incoeff 2648; incoeff 1017; incoeff 732; 
         incoeff 608; incoeff 1787; incoeff 411; 
         incoeff 3124; incoeff 1758; incoeff 1223; 
         incoeff 652; incoeff 2777; incoeff 1015; 
         incoeff 2036; incoeff 1491; incoeff 3047; 
         incoeff 1785; incoeff 516; incoeff 3321; 
         incoeff 3009; incoeff 2663; incoeff 1711; 
         incoeff 2167; incoeff 126; incoeff 1469; 
         incoeff 2476; incoeff 3239; incoeff 3058; 
         incoeff 830; incoeff 107; incoeff 1908; 
         incoeff 3082; incoeff 2378; incoeff 2931; 
         incoeff 961; incoeff 1821; incoeff 2604; 
         incoeff 448; incoeff 2264; incoeff 677; 
         incoeff 2054; incoeff 2226; incoeff 430; 
         incoeff 555; incoeff 843; incoeff 2078; 
         incoeff 871; incoeff 1550; incoeff 105; 
         incoeff 422; incoeff 587; incoeff 177; 
         incoeff 3094; incoeff 3038; incoeff 2869; 
         incoeff 1574; incoeff 1653; incoeff 3083; 
         incoeff 778; incoeff 1159; incoeff 3182; 
         incoeff 2552; incoeff 1483; incoeff 2727; 
         incoeff 1119; incoeff 1739; incoeff 644; 
         incoeff 2457; incoeff 349; incoeff 418; 
         incoeff 329; incoeff 3173; incoeff 3254; 
         incoeff 817; incoeff 1097; incoeff 603; 
         incoeff 610; incoeff 1322; incoeff 2044; 
         incoeff 1864; incoeff 384; incoeff 2114; 
         incoeff 3193; incoeff 1218; incoeff 1994; 
         incoeff 2455; incoeff 220; incoeff 2142; 
         incoeff 1670; incoeff 2144; incoeff 1799; 
         incoeff 2051; incoeff 794; incoeff 1819; 
         incoeff 2475; incoeff 2459; incoeff 478; 
         incoeff 3221; incoeff 3021; incoeff 996; 
         incoeff 991; incoeff 958; incoeff 1869; 
         incoeff 1522; incoeff 1628].
proof.
  rewrite zetasE /array128_mont Array128.mapE /R  /=.
  by rewrite -Array128.ext_eq_all /all_eq /= -!incoeffM_mod /q /=.
qed.

(* These properties is needed to show that ntt_inv is computing something
   that makes sense. Checked in sage. *)
(*@bac: versions with simpler premisses*)
lemma zetavals1'  k: 
 0 <= k < 128 => k %% 2 = 0 =>
 Zq.exp zroot (2 * br k + 1) = NTT_Fq.zetas.[k %/ 2 + 64].
proof.
rewrite -mem_range => mem_k_range /dvdzP [q ->>].
move: mem_k_range; rewrite mem_range_mulr //= mulzK // (*-divzpMr //=*) /zetas => mem_q_range.
rewrite initiE /=; [by apply/mem_range/mem_range_addr; move: mem_q_range; apply/mem_range_incl|].
rewrite eq_sym /br mulrDl /= (bsrev_cat 7 8) //= divzDr //= divz_small /=; [by apply/mem_range/mem_range_mulr|].
by rewrite bsrev1 //= (addzC 1) -bsrev_mod /= -modzDm /= !bsrev_mod.
qed.

lemma zetavals2' k : 0 <= k < 128 => k%%2 <> 0 => 
 Zq.exp zroot (2 * br k + 1) = -NTT_Fq.zetas.[k %/ 2 + 64].
proof.
rewrite -mem_range => mem_k_range eq_modz'.
have eq_modz: k%%2 = 1 by smt().
move: mem_k_range; rewrite (divz_eq k 2) eq_modz.
move: {eq_modz eq_modz'} (k %/ 2) => q {k}; rewrite mem_range_addr mem_range_mulr //= => mem_q_range.
rewrite divzMDl //= /zetas initiE /=; [by apply/mem_range/mem_range_addr; move: mem_q_range; apply/mem_range_incl|].
rewrite eq_sym /br mulrDl /= (bsrev_cat 7 8) //= divzDr //= divz_small /=; [by apply/mem_range/mem_range_mulr|].
rewrite bsrev1 //= (addzC 1) -bsrev_mod /= -modzDm /= !bsrev_mod.
move: (bsrev_add 1 7 1 q); rewrite mem_range /= addrC mulrC => ->.
rewrite -(bsrev_mulr_pow2 1 7 q) //= mulrDr bsrev1 // -addrA.
rewrite (ZqField.exprD _ (_ * (_ ^ _)%IntID)%Int) /=; [by apply unit_zroot|].
by rewrite exp_zroot_128 incoeffN ZqField.mulNr ZqField.mul1r (mulzC _ 2).
qed.

lemma zetavals1  k : 0 <= k < 256 => k%%4 = 0 =>
     zetas.[k %/ 4 + 64] = Zq.exp zroot (2 * br (k %/ 2) + 1).
proof. by move=> Hk H4; rewrite zetavals1' /#. qed. 

lemma zetavals2 k : 0 <= k < 256 => k%%4 = 2 => 
     zetas.[k %/ 4 + 64] = (-Zq.exp zroot (2 * br (k %/ 2) + 1)).
proof.
move=> Hk H4; rewrite zetavals2' 1..2:/#.
by rewrite -divz_mulp 1..2:/# /= ; ring.
qed.

end NTT_Fq.

