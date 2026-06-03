(* General EC imports *)

from Jasmin require import JWord.

from JazzEC require import Array32.

(* Imports of "lower-level" MLKEM spec parts *)
require import GFq.
import Zq.
require import Rq.
require import Symmetric.
import Symmetric1024.
require import Sampling.
require import VecMat.
import VecMat1024 PolyMat.
require import Serialization.
import Serialization1024.
require import InnerPKE1024.

type publickey = InnerPKE1024.pkey.
type secretkey = InnerPKE1024.skey* InnerPKE1024.pkey * W8.t Array32.t * W8.t Array32.t.
type ciphertext = InnerPKE1024.ciphertext.
type sharedsecret = W8.t Array32.t.

import InnerPKE1024.
module MLKEM1024 = {

  proc kg_derand(coins: W8.t Array32.t * W8.t Array32.t) : publickey * secretkey = {
    var kgs,z,pk,sk,hpk;
    kgs     <- coins.`1;
    z       <- coins.`2;
    (pk,sk) <@ InnerPKE1024.kg_derand(kgs);
    hpk     <- H_pk pk;
    return (pk, (sk,pk,hpk,z));
  }

  proc enc_derand(pk : publickey, coins: W8.t Array32.t) : ciphertext * sharedsecret = {
    var m,hpk,r,c,_K;
    m       <- coins;
    hpk     <- H_pk pk;
    (_K,r) <- G_mhpk m hpk;
    c       <@ InnerPKE1024.enc_derand(pk,m,r);
    return (c,_K);
  }

  proc dec(cph : ciphertext, sk : secretkey) : sharedsecret = {
    var m,_K',r,skp,pk,hpk,z,c,_K;
    (skp,pk,hpk,z) <- sk;
    m             <@ InnerPKE1024.dec(skp,cph);
    (_K,r)        <- G_mhpk m hpk;
    _K'           <- J z cph;
    c             <@ InnerPKE1024.enc_derand(pk,m,r);
    if (c <> cph) {
      _K <- _K';
    }
    return _K;
  }
}.
