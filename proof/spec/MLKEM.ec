(* General EC imports *)
from Jasmin require import JWord.

from JazzEC require import Array32.

require import Symmetric.
require import KPKE.

(* ------------------------------------------------------------------ *)
(* FIPS-203 ML-KEM (the FO/KEM layer over K-PKE), parametric over the global
   variant params via the K-PKE layer.  One variant per EC run. *)
(* ------------------------------------------------------------------ *)

type publickey = pkey.
type secretkey = skey * pkey * W8.t Array32.t * W8.t Array32.t.
type sharedsecret = W8.t Array32.t.
(* ciphertext / plaintext are in scope from KPKE. *)

module MLKEM = {

  proc keygen_internal(coins: W8.t Array32.t * W8.t Array32.t) : publickey * secretkey = {
    var kgs, z, pk, sk, hpk;
    kgs     <- coins.`1;
    z       <- coins.`2;
    (pk, sk) <@ KPKE.keygen(kgs);
    hpk     <- H_pk pk;
    return (pk, (sk, pk, hpk, z));
  }

  proc encaps_internal(pk : publickey, coins: W8.t Array32.t) : ciphertext * sharedsecret = {
    var m, hpk, r, c, _K;
    m       <- coins;
    hpk     <- H_pk pk;
    (_K, r) <- G_mhpk m hpk;
    c       <@ KPKE.encrypt(pk, m, r);
    return (c, _K);
  }

  proc decaps_internal(cph : ciphertext, sk : secretkey) : sharedsecret = {
    var m, _K', r, skp, pk, hpk, z, c, _K;
    (skp, pk, hpk, z) <- sk;
    m             <@ KPKE.decrypt(skp, cph);
    (_K, r)       <- G_mhpk m hpk;
    _K'           <- J z cph;
    c             <@ KPKE.encrypt(pk, m, r);
    if (c <> cph) {
      _K <- _K';
    }
    return _K;
  }
}.
