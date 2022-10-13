require import AllCore List IntDiv Ring StdOrder BitEncoding  Array256 Array128.
require import Fq.
import Kyber.
import NTT_Properties.

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

lemma zetas_invE: zetas_inv = Array128.of_list witness 
 [ inFq 1175 ; inFq 2444 ; inFq 394 ; inFq 1219 ; inFq 2300 ; inFq 1455
 ; inFq 2117 ; inFq 1607 ; inFq 2443 ; inFq 554 ; inFq 1179 ; inFq 2186
 ; inFq 2303 ; inFq 2926 ; inFq 2237 ; inFq 525 ; inFq 735 ; inFq 863
 ; inFq 2768 ; inFq 1230 ; inFq 2572 ; inFq 556 ; inFq 3010 ; inFq 2266
 ; inFq 1684 ; inFq 1239 ; inFq 780 ; inFq 2954 ; inFq 109 ; inFq 1292
 ; inFq 1031 ; inFq 1745 ; inFq 2688 ; inFq 3061 ; inFq 992 ; inFq 2596
 ; inFq 941 ; inFq 892 ; inFq 1021 ; inFq 2390 ; inFq 642 ; inFq 1868
 ; inFq 2377 ; inFq 1482 ; inFq 1540 ; inFq 540 ; inFq 1678 ; inFq 1626
 ; inFq 279 ; inFq 314 ; inFq 1173 ; inFq 2573 ; inFq 3096 ; inFq 48
 ; inFq 667 ; inFq 1920 ; inFq 2229 ; inFq 1041 ; inFq 2606 ; inFq 1692
 ; inFq 680 ; inFq 2746 ; inFq 568 ; inFq 3312 ; inFq 2419 ; inFq 2102
 ; inFq 219 ; inFq 855 ; inFq 2681 ; inFq 1848 ; inFq 712 ; inFq 682
 ; inFq 927 ; inFq 1795 ; inFq 461 ; inFq 1891 ; inFq 2877 ; inFq 2522
 ; inFq 1894 ; inFq 1010 ; inFq 1414 ; inFq 2009 ; inFq 3296 ; inFq 464
 ; inFq 2697 ; inFq 816 ; inFq 1352 ; inFq 2679 ; inFq 1274 ; inFq 1052
 ; inFq 1025 ; inFq 2132 ; inFq 1573 ; inFq 76 ; inFq 2998 ; inFq 3040
 ; inFq 2508 ; inFq 1355 ; inFq 450 ; inFq 936 ; inFq 447 ; inFq 2794
 ; inFq 1235 ; inFq 1903 ; inFq 1996 ; inFq 1089 ; inFq 3273 ; inFq 283
 ; inFq 1853 ; inFq 1990 ; inFq 882 ; inFq 3033 ; inFq 1583 ; inFq 2760
 ; inFq 69 ; inFq 543 ; inFq 2532 ; inFq 3136 ; inFq 1410 ; inFq 2267
 ; inFq 2481 ; inFq 1432 ; inFq 2699 ; inFq 687 ; inFq 40 ; inFq 749
 ; inFq 1600 ; inFq 3303 ].
proof.
apply/Array128.ext_eq; move => i /mem_range mem_i_range.
rewrite /zetas_inv /= Array128.get_set_if /= /scale127 {1 2}/R /Fq.SignedReductions.R /=.
case: (i=127) => E.
 by rewrite E initiE //= -eq_inFq /q /=.
rewrite initiE /=; first by rewrite -mem_range.
  rewrite -!ZqField.exprV inv_zroot.
  rewrite ZqField.exprS; [by rewrite bsrev_ge0|].
  rewrite -!(fastexp_nbitsP 8) ?bsrev_range //.
  rewrite /fastexp_nbits !int2bs_bsrev !revK /zroot.
  have inFqQ_mod : forall (a : int) , inFq (a * a %% q) = inFq a * inFq a.
  + by move => ?; rewrite -inFqM_mod.
  do 8!(rewrite BS2Int.int2bs_rcons //= foldr_rcons /= -!inFqQ_mod /q /=).
  rewrite BS2Int.int2bs0s /= ComRing.mul1r => {inFqQ_mod}; move: i mem_i_range E.
rewrite /range /=; apply/List.allP.
by rewrite -JUtils.iotaredE /=  -!inFqM_mod /= !inFqK /q /=.
qed.

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

lemma zetasE:
 zetas = Array128.of_list witness
          [inFq 1;
 (*l0*)    inFq 1729;
 (*l1_L*)  inFq 2580;
 (*l1_R*)  inFq 3289;
 (*l2_L*)  inFq 2642; inFq 630;
 (*l2_R*)  inFq 1897; inFq 848;
 (*l3_L*)  inFq 1062; inFq 1919; inFq 193; inFq 797;
 (*l3_R*)  inFq 2786; inFq 3260; inFq 569; inFq 1746;
 (*l4_L*)  inFq 296; inFq 2447; inFq 1339; inFq 1476; inFq 3046; inFq 56; inFq 2240; inFq 1333;
 (*l4_R*)  inFq 1426; inFq 2094; inFq 535; inFq 2882; inFq 2393; inFq 2879; inFq 1974; inFq 821;
 (*l5_L*)  inFq 289; inFq 331; inFq 3253; inFq 1756; inFq 1197; inFq 2304; inFq 2277; inFq 2055; inFq 650; inFq 1977; inFq 2513; inFq 632; inFq 2865; inFq 33; inFq 1320; inFq 1915;
 (*l5_R*)  inFq 2319; inFq 1435; inFq 807; inFq 452; inFq 1438; inFq 2868; inFq 1534; inFq 2402; inFq 2647; inFq 2617; inFq 1481; inFq 648; inFq 2474; inFq 3110; inFq 1227; inFq 910;
 (*l6_L*)  inFq 17; inFq 2761; inFq 583; inFq 2649; inFq 1637; inFq 723; inFq 2288; inFq 1100; inFq 1409; inFq 2662; inFq 3281; inFq 233; inFq 756; inFq 2156; inFq 3015; inFq 3050; 
           inFq 1703; inFq 1651; inFq 2789; inFq 1789; inFq 1847; inFq 952; inFq 1461; inFq 2687; inFq 939; inFq 2308; inFq 2437; inFq 2388; inFq 733; inFq 2337; inFq 268; inFq 641;
 (*l6_R*)  inFq 1584; inFq 2298; inFq 2037; inFq 3220; inFq 375; inFq 2549; inFq 2090; inFq 1645; inFq 1063; inFq 319; inFq 2773; inFq 757; inFq 2099; inFq 561; inFq 2466; inFq 2594;
           inFq 2804; inFq 1092; inFq 403; inFq 1026; inFq 1143; inFq 2150; inFq 2775; inFq 886; inFq 1722; inFq 1212; inFq 1874; inFq 1029; inFq 2110; inFq 2935; inFq 885; inFq 2154].
proof.
  apply/Array128.ext_eq => i /mem_range mem_i_range.
  rewrite /zetas -?mem_range //.
  rewrite initiE -?mem_range //; move: mem_i_range.
  rewrite /= -(fastexp_nbitsP 8) ?bsrev_range //.
  rewrite /fastexp_nbits int2bs_bsrev revK /R /Fq.SignedReductions.R.
  do 8!(rewrite BS2Int.int2bs_rcons //= foldr_rcons /= /q /=).
  rewrite BS2Int.int2bs0s /= ComRing.mul1r.
  do 128!(rewrite range_ltn //=; move => [->> /=|];
            [by rewrite -!inFqM_mod !inFqK /q|]).
  by rewrite range_geq.
qed.

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
  rewrite zetasE /array128_mont Array128.mapE /R  /=.
  by rewrite -Array128.ext_eq_all /all_eq /= -!inFqM_mod /q /=.
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


end NTT_Fq.
