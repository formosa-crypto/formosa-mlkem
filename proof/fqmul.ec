require import List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.

op SAR_32 : W32.t -> W8.t -> bool * bool * bool * bool * bool * W32.t.

axiom SAR_32_sem a b :
   (SAR_32 a b).`6 = W32.of_int (to_sint a %/ 2^(to_uint b)).

module M = {
  proc fqmul (a:W16.t, b:W16.t) : W16.t = {
    
    var r:W16.t;
    var ad:W32.t;
    var bd:W32.t;
    var c:W32.t;
    var u:W32.t;
    var t:W32.t;
    var  _0:bool;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    var  _6:bool;
    var  _7:bool;
    var  _8:bool;
    var  _9:bool;
    
    ad <- (sigextu32 a);
    bd <- (sigextu32 b);
    c <- (ad * bd);
    u <- (c * (W32.of_int 62209));
    u <- (u `<<` (W8.of_int 16));
    ( _0,  _1,  _2,  _3,  _4, u) <- SAR_32 u (W8.of_int 16);
    t <- (u * (W32.of_int 3329));
    t <- (c - t);
    ( _5,  _6,  _7,  _8,  _9, t) <- SAR_32 t (W8.of_int 16);
    r <- (truncateu16 t);
    return (r);
  }
}.

