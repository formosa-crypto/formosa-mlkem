require import AllCore IntDiv Array256.
require (****) ZModP.

theory NTT_Fq.

clone import ZModP.

module NTT = {
 proc ntt(r : zmod Array256.t,  zetas : zmod Array256.t) : zmod Array256.t = {
   var len, start, j, k;
   var  t, zeta_;

   k <- 1;
   len <- 128;
   while (2 <= len) {
    start <- 0;
    while(start < 256) {
       zeta_ <- zetas.[k]; k <- k + 1;
       j <- start;
       while (j < start + len) {
         t           <- zeta_ * r.[j + len];
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

 proc invntt(r : zmod Array256.t, zetas_inv : zmod Array256.t) : zmod Array256.t = {
   var len, start, j, k;
   var  t, zeta_;

   k <- 0;
   len <- 2;
   while (len <= 128) {
    start <- 0;
    while(start < 256) {
       zeta_ <- zetas_inv.[k]; k <- k + 1;
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
   return r;
 }

 
}.

end NTT_Fq.