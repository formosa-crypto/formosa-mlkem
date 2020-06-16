require import AllCore IntDiv Array256 Array128.
require import Fq.

import Fq.
theory NTT_Fq.

import Kyber_.ZModRing.

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

axiom ntt_spec_h _r :
   hoare[ NTT.ntt :
     _r = r /\ Kyber_.Poly.zetas = zetas ==>
       res = Kyber_.Poly.ntt _r ].

axiom invntt_spec_h _r  :
   hoare[ NTT.invntt :
     _r = r /\ Kyber_.Poly.zetas_inv = zetas_inv ==>
       res = Kyber_.Poly.invntt _r ].

lemma ntt_spec_ll : islossless NTT.ntt.
proc.
sp.
while (1 <= len /\ len <= 128 /\ exists l, len = 2^l /\   0 <= zetasctr <= 127 /\
   2*(zetasctr+1)*len = 256) (len); last by
 auto => />;split; [ by exists 7 | by smt()].
move => *.
wp. sp.
move => *.
exists *zetasctr.
elim* => zetasctr1 l.
while (1 <= len /\ len <= 128 /\ len = 2 ^ l /\ 
        0 <= zetasctr1 <= 127 /\ 
        0 <= zetasctr <= 127 /\ 
        2 * (zetasctr1+ 1) * len = 256 /\ 
        2 <= len /\ 
       2* (zetasctr - zetasctr1 ) * len <= 256 /\
       0 <= start <= 256 /\
       start = 2*(zetasctr - zetasctr1)*len) (256 -start); last first.
wp;skip => [#] *. 
split; first by smt().
move => [#] *.
split; first by smt().
move => [#] *.
split; last by smt().
split; first by smt().
split; first by smt().
exists (l-1). split; last by smt(). rewrite /len0. move : H1 => [#]  ?? -> *.
(* FIX ME *) 
have ? : (0 <= l). case (0 < l). smt. move => *. admit.
clear H12 H9 H7 H.
move : H13 H8.
 elim/natcase: l.
move=> n le0_n ge0_n; rewrite (_ : n = 0)  1:/# expr0 => /#.
by move=> n ge0_n   /=; rewrite exprS // mulKz.
(*********) 
move => *.
wp.
while (0 <= start <= 256 /\ 
       1 <= len /\ len <= 128  /\ start <= j <= start + len /\ 
        0 <= zetasctr <= 127 /\ 
2 * (zetasctr1 + 1) * len = 256 /\ 
       start = 2*(zetasctr -1 - zetasctr1) * len /\ 
       2* (zetasctr - zetasctr1 ) * len <= 256) (start + len - j); last first. 
wp;skip => *.
split;  first by smt().
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
move => *.
auto => />.
move => *. smt().
qed.


lemma invntt_spec_ll : islossless NTT.invntt.
proc.
sp.
while(0<=j<=256) (256-j); first by move => *; auto => /> /#.
wp.
while (2 <= len /\ len <= 256 /\ exists l, len = 2^l /\   0 <= zetasctr <= 128 /\
   zetasctr * len = 128 * (len - 2)) (256-len); last by
 auto => />; split; [ by exists 1 | by smt()].
move => *.
wp. sp.
move => *.
exists *zetasctr.
elim* => zetasctr1 l.
while (1 <= len /\ len <= 128 /\ len = 2 ^ l /\ 
        0 <= zetasctr1 <= 128 /\ 
        0 <= zetasctr <= 128 /\ 
        zetasctr1 * len = 128 * (len - 2) /\ 
       2* (zetasctr - zetasctr1 ) * len <= 256 /\
       0 <= start <= 256 /\
       start = 2*(zetasctr - zetasctr1)*len) (256 -start); last first.
wp;skip => [#] *.
move : H => [#] *. 
split; first by smt().
move => start zetasctr.
split; first by smt().
move => [#] *.
split; last by smt().
split; first by smt().
split; first by smt().
(* FIXME *)
exists (l+1).  split; last by smt(). rewrite /len0. rewrite exprS.  admit. smt().
move => *.
wp.
while (0 <= start <= 256 /\ 
       1 <= len /\ len <= 128  /\ start <= j <= start + len /\ 
        0 <= zetasctr <= 128 /\ 
        zetasctr1 * len = 128 * (len - 2) /\ 
       start = 2*(zetasctr -1 - zetasctr1) * len /\ 
       2* (zetasctr - zetasctr1 ) * len <= 256) (start + len - j); last first. 
wp;skip => *.
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
move => *.
auto => />.
move => *. smt().
qed.

lemma ntt_spec _r :
   phoare[ NTT.ntt :
     _r = r /\ Kyber_.Poly.zetas = zetas ==>
       res = Kyber_.Poly.ntt _r ] = 1%r
  by conseq ntt_spec_ll (ntt_spec_h _r); done.


lemma invntt_spec _r :
   phoare[ NTT.invntt :
     _r = r /\ Kyber_.Poly.zetas_inv = zetas_inv ==>
       res = Kyber_.Poly.invntt _r ] = 1%r
  by conseq invntt_spec_ll (invntt_spec_h _r); done.

end NTT_Fq.