require import List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.


op sar32 : W32.t -> W8.t -> W32.t.

axiom sar32_sem a s :
   sar32 a s = W32.of_int ((to_sint a) %/ to_uint s).

module M = {
  proc fqmul (a:W16.t, b:W16.t) : W16.t = {
    
    var r:W16.t;
    var ad:W32.t;
    var bd:W32.t;
    var c:W32.t;
    var u:W32.t;
    var t:W32.t;
    
    ad <- (sigextu32 a);
    bd <- (sigextu32 b);
    c <- (ad * bd);
    u <- (c * (W32.of_int 62209));
    u <- (u `<<` (W8.of_int 16));
    u <- sar32 u (W8.of_int 16); 
    t <- (u * (W32.of_int 3329));
    t <- (c - t);
    t <- sar32 t (W8.of_int 16); 
    r <- (truncateu16 t);
    return (r);
  }
}.

