(* General EC imports *)
require import AllCore List.

from Jasmin require import JModel.

from JazzEC require import Array32 Array33 Array64 Array128 Array160 Array168 Array256 Array960 Array1152 Array1408 Array1536.

from CryptoSpecs require import Keccak1600_Spec.

op SHAKE_256_1120_32 (x: W8.t Array32.t, y: W8.t Array960.t * W8.t Array128.t): W8.t Array32.t =
 Array32.of_list W8.zero (SHAKE256 (to_list x ++ to_list y.`1 ++ to_list y.`2) 32).

op SHA3_256_1184_32 (x: W8.t Array1152.t * W8.t Array32.t): W8.t Array32.t =
 Array32.of_list W8.zero (SHA3_256 (to_list x.`1 ++ to_list x.`2)).

op SHAKE_256_1600_32 (x: W8.t Array32.t, y: W8.t Array1408.t * W8.t Array160.t): W8.t Array32.t =
 Array32.of_list W8.zero (SHAKE256 (to_list x ++ to_list y.`1 ++ to_list y.`2) 32).

op SHA3_256_1568_32 (x: W8.t Array1536.t * W8.t Array32.t): W8.t Array32.t =
 Array32.of_list W8.zero (SHA3_256 (to_list x.`1 ++ to_list x.`2)).

op SHA3_512_33_64 (x: W8.t Array33.t): W8.t Array32.t * W8.t Array32.t =
 let l = SHA3_512 (to_list x)
 in (Array32.of_list W8.zero (take 32 l), Array32.of_list W8.zero (drop 32 l)).

op SHA3_512_64_64 (x y: W8.t Array32.t): W8.t Array32.t * W8.t Array32.t =
 let l = SHA3_512 (to_list x ++ to_list y)
 in (Array32.of_list W8.zero (take 32 l), Array32.of_list W8.zero (drop 32 l)).
 
op SHAKE128_ABSORB_34 (x: W8.t Array32.t) (i j: W8.t): W64.t Array25.t =
 SHAKE128_ABSORB (to_list x ++ [i; j]).
op SHAKE128_SQUEEZE_168 (st: W64.t Array25.t): W64.t Array25.t *  W8.t Array168.t =
 let (st', l) = SHAKE128_SQUEEZEBLOCK st in (st', Array168.of_list W8.zero l).

op SHAKE256_64_32 (x y: W8.t Array32.t): W8.t Array32.t =
 Array32.of_list W8.zero (SHAKE256 (to_list x ++ to_list y) 32).

from CryptoSpecs require import Keccak1600_Spec.


op SHAKE256_33_128 (x: W8.t Array32.t, tag: W8.t): W8.t Array128.t =
 Array128.of_list W8.zero (SHAKE256 (to_list x ++ [tag]) 128).

op PRF = SHAKE256_33_128.


module type XOF_t = {
  proc init(rho : W8.t Array32.t, i j : int) : unit
  proc next_bytes() : W8.t Array168.t
}.

module XOF : XOF_t = {
  var state : W64.t Array25.t
  proc init(rho : W8.t Array32.t, i j : int) : unit = {
    state <- SHAKE128_ABSORB_34 rho (W8.of_int i) (W8.of_int j);
  }

  proc next_bytes() : W8.t Array168.t = { 
    var buf;
    (state,buf) <- SHAKE128_SQUEEZE_168 state;
    return buf; 
  }
}.


theory Symmetric768.

op G_coins = SHA3_512_33_64.
op G_mhpk  = SHA3_512_64_64.

op H_pk  = SHA3_256_1184_32.

op J = SHAKE_256_1120_32.

end Symmetric768.

theory Symmetric1024.

op G_coins = SHA3_512_33_64.
op G_mhpk  = SHA3_512_64_64.

op H_pk  = SHA3_256_1568_32.

op J = SHAKE_256_1600_32.

end Symmetric1024.
