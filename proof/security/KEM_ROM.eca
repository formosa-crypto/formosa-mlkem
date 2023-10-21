require import AllCore List Distr DBool PROM.
require (****) LorR.

type pkey.
type skey.
type key.
type ciphertext.

op dkey : key distr.
axiom dkey_ll: is_lossless dkey.

module type Scheme = {
  proc kg() : pkey * skey
  proc enc(pk:pkey)  : ciphertext * key
  proc dec(sk:skey, c:ciphertext) : key option
}.

module type Adversary = {
  proc guess(pk : pkey, c:ciphertext, k : key) : bool
}.

module CPA (S:Scheme, A:Adversary) = {
  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var k1 : key;
    var ck0 : ciphertext * key;
    var b, b' : bool;

    (pk, sk) <@ S.kg();
    b        <$ {0,1};
    k1        <$ dkey;
    ck0      <@ S.enc(pk);
    b'       <@ A.guess(pk, ck0.`1, if b then k1 else ck0.`2);
    return (b' = b);
  }
}.

module CPA_L (S:Scheme, A:Adversary) = {
  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var k1 : key;
    var ck0 : ciphertext * key;
    var b' : bool;

    (pk, sk) <@ S.kg();
    k1        <$ dkey;
    ck0      <@ S.enc(pk);
    b'       <@ A.guess(pk, ck0.`1, ck0.`2);
    return b';
  }
}.

module CPA_R (S:Scheme, A:Adversary) = {
  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var k1 : key;
    var ck0 : ciphertext * key;
    var b' : bool;

    (pk, sk) <@ S.kg();
    k1        <$ dkey;
    ck0      <@ S.enc(pk);
    b'       <@ A.guess(pk, ck0.`1, k1);
    return b';
  }
}.

section.

  clone import LorR as LR with 
     type input <- unit.

  declare module S<:Scheme.
  declare module A<:Adversary{-S}.

  lemma pr_CPA_LR &m: 
    islossless S.kg => islossless S.enc =>
    islossless A.guess => 
    `| Pr[CPA_L(S,A).main () @ &m : res] - Pr[CPA_R(S,A).main () @ &m : res] | =
     2%r * `| Pr[CPA(S,A).main() @ &m : res] - 1%r/2%r |.
  proof.
    move => kg_ll enc_ll guess_ll.
    have -> : Pr[CPA(S, A).main() @ &m : res] = 
              Pr[RandomLR(CPA_R(S,A), CPA_L(S,A)).main() @ &m : res].
    + byequiv (_ : ={glob S, glob A} ==> ={res})=> //.
      proc.      
      swap{1} 2-1; seq 1 1 : (={glob S, glob A, b}); first by rnd.
      if{2}; inline *; wp; do 2! call (_: true); rnd; call(_:true); auto => /> /#.
    rewrite -(pr_AdvLR_AdvRndLR (CPA_R(S,A)) (CPA_L(S,A)) &m) 2:/#.
    byphoare => //; proc.
    by call guess_ll; call enc_ll; rnd; call kg_ll; auto => />; smt(dkey_ll). 
  qed.

end section.

module type CCA_ORC = {
  proc dec(c:ciphertext) : key option
}.

module type CCA_ADV (O:CCA_ORC) = {
  proc guess(pk : pkey, c:ciphertext, k : key) : bool {O.dec}
}.

module CCA (S:Scheme, A:CCA_ADV) = {
  var cstar : ciphertext option
  var sk : skey

  module O = {
    proc dec(c:ciphertext) : key option = {
      var k : key option;

      k <- None;
      if (Some c <> cstar) {
        k  <@ S.dec(sk, c);
      }
      return k;
    }
  }

  module A = A(O)

  proc main() : bool = {
    var pk : pkey;
    var k1 :key;
    var ck0 : ciphertext * key;
    var cstar : ciphertext option;
    var b, b' : bool;

    cstar    <- None;
    (pk, sk) <@ S.kg();
    k1 <$ dkey;
    b        <$ {0,1};
    ck0        <@ S.enc(pk);
    cstar    <- Some ck0.`1;
    b'       <@ A.guess(pk, ck0.`1, if b then k1 else ck0.`2);
    return (b' = b);
  }
}.

module Correctness (S:Scheme) = {
  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var ck  : ciphertext * key;
    var k' : key option;

    (pk, sk) <@ S.kg();
    ck        <@ S.enc(pk);
    k'       <@ S.dec(sk, ck.`1);
    return (k' <> Some ck.`2); (* There's a typo in HHK *)
  }
}.

(* Security definition in the ROM *)

clone import FullRO as RO.

module type Oracle = {
  include FRO [init, get]
}.

module type POracle = {
  include FRO [get]
}.

module type CCA_ADV_RO (H : POracle, O:CCA_ORC) = {
  proc guess(pk : pkey, c:ciphertext, k : key) : bool {O.dec}
}.

module CCA_RO (H : Oracle, S:Scheme, A:CCA_ADV_RO) = {
  var cstar : ciphertext option
  var sk : skey

  module O = {
    proc dec(c:ciphertext) : key option = {
      var k : key option;

      k <- None;
      if (Some c <> cstar) {
        k  <@ S.dec(sk, c);
      }
      return k;
    }
  }

  module A = A(H,O)

  proc main() : bool = {
    var pk : pkey;
    var k1 :key;
    var ck0 : ciphertext * key;
    var cstar : ciphertext option;
    var b, b' : bool;

    H.init();
    cstar    <- None;
    (pk, sk) <@ S.kg();
    k1 <$ dkey;
    b        <$ {0,1};
    ck0        <@ S.enc(pk);
    cstar    <- Some ck0.`1;
    b'       <@ A.guess(pk, ck0.`1, if b then k1 else ck0.`2);
    return (b' = b);
  }
}.
