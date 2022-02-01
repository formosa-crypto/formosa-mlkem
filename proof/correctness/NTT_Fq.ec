require import AllCore List IntDiv Ring StdOrder Array256 Array128.
require import Fq.
import Kyber.

import Zq IntOrder.

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

op array_mont (p : Fq Array128.t) =
  Array128.map (fun x => x *  (inFq Fq.SignedReductions.R)) p.

op array_mont_inv (p : Fq Array128.t) =
  let vv = Array128.map (fun x => x *  (inFq Fq.SignedReductions.R)) p in
      vv.[127 <- p.[127] * (inFq Fq.SignedReductions.R) * (inFq Fq.SignedReductions.R)].

op zetas_inv : Fq Array128.t.

(* These are powers of roots of unit in Mont form and
   bitwise permuted indices  zetas inv above needs to be
   defined, this axiom discharged, and then used to
   discharge other axioms below. *)
axiom zetas_invE : array_mont_inv zetas_inv =
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
  
op zetas : Fq Array128.t.

(* These are powers of roots of unit in Mont form and
   bitwise permuted indices  zetas inv above needs to be
   defined, this axiom discharged, and then used to
   discharge other axioms below. *)
axiom zetasE : array_mont zetas =
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

(* These properties is needed to show that ntt_inv is computing something
   that makes sense. Checked in sage. *)
axiom zetavals1  k : 0 <= k < 256 => k%%4 = 0 => 
     zetas.[k %/ 4 + 64] = ZqRing.exp zroot (2 * br (k %/ 2) + 1). 

axiom zetavals2 k : 0 <= k < 256 => k%%4 = 2 => 
     zetas.[k %/ 4 + 64] = (-ZqRing.exp zroot (2 * br (k %/ 2) + 1)).

(* TO DO: These need to be proved using the results in NTT_Algebra *)
lemma ntt_spec_h _r :
   hoare[ NTT.ntt :
     arg = (_r,zetas) ==> res = ntt _r ].
admitted.

lemma invntt_spec_h _r :
   hoare[ NTT.invntt : arg=(_r,zetas_inv) ==> res = invntt _r ].
admitted.

lemma ntt_spec _r :
   phoare[ NTT.ntt : arg = (_r,zetas) ==> res = ntt _r ] = 1%r
  by conseq ntt_spec_ll (ntt_spec_h _r); done.

lemma invntt_spec _r:
   phoare[ NTT.invntt :
     arg=(_r,zetas_inv) ==> res = invntt _r ] = 1%r
  by conseq invntt_spec_ll (invntt_spec_h _r); done.

(* ALL THIS WILL BE REPLACED WITH POLY THEORY *)


(* These theorems should come from the algebraic infrastructure, along with
another one that says our axiomatization of mul and add in Kyber are 
explicit formulae for the ring operations. *)

op scale(p : poly, c : Fq) : poly =  Array256.map (fun x => x * c) p.


axiom ntt_scale p c : ntt (scale p c) = scale (ntt p) c.
axiom invnttK : cancel ntt invntt.
axiom nttK : cancel invntt ntt.

lemma invntt_scale p c : invntt (scale p c) = scale (invntt p) c.
proof.
rewrite (_: p = ntt (invntt p)); first by rewrite nttK.
by rewrite -ntt_scale {1}invnttK  nttK.
qed.

axiom mul_comm_ntt (pa pb : poly):
  ntt (pa &* pb) = basemul (ntt pa) (ntt pb).

axiom add_comm_ntt (pa pb : poly):
  ntt (pa &+ pb) = (ntt pa) &+ (ntt pb).

axiom nttZero : ntt Poly.zero = Poly.zero.

(*


lemma mul_scale_ntt (pa pb : poly) (c : elem) : 
  invntt (scale (basemul (ntt pa) (ntt pb)) c) = 
   scale (pa * pb) c by
 smt(mul_comm_ntt ntt_scale invnttK).

lemma add_scale_ntt (pa pb : poly) (c : elem) : 
  invntt (scale ((ntt pa) + (ntt pb)) c) = 
   scale (pa + pb) c by
 smt(add_comm_ntt ntt_scale invnttK). 


lemma scale1 (p : poly) :
   scale p (FqField.one) = p.
proof.
rewrite /scale.
apply Array256.ext_eq => *.
rewrite mapiE => />.
smt(@FqField).
qed. *)

end NTT_Fq.
