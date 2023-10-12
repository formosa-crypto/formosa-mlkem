require import AllCore List Distr DBool PROM.  
require (****) LorR.

abstract theory PKE.

type pkey.
type skey.
type plaintext.
type ciphertext.

module type Scheme = {
  proc kg() : pkey * skey
  proc enc(pk:pkey, m:plaintext)  : ciphertext
  proc dec(sk:skey, c:ciphertext) : plaintext option
}.

module type CORR_ADV = {
  proc find(pk : pkey, sk : skey) : plaintext
}.

module Correctness_Adv (S:Scheme, A : CORR_ADV) = {
  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var c  : ciphertext;
    var m  : plaintext;
    var m' : plaintext option;

    (pk, sk) <@ S.kg();
    m        <@ A.find(pk,sk);
    c        <@ S.enc(pk, m);
    m'       <@ S.dec(sk, c);
    return (m' <> Some m); (* There's a typo in HKK *)
  }
}.

module type Adversary = {
  proc choose(pk:pkey)     : plaintext * plaintext
  proc guess(c:ciphertext) : bool
}.

module CPA (S:Scheme, A:Adversary) = {
  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var m0, m1 : plaintext;
    var c : ciphertext;
    var b, b' : bool;

    (pk, sk) <@ S.kg();
    (m0, m1) <@ A.choose(pk);
    b        <$ {0,1};
    c        <@ S.enc(pk, b ? m1 : m0);
    b'       <@ A.guess(c);
    return (b' = b);
  }
}.

module CPA_L (S:Scheme, A:Adversary) = {
  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var m0, m1 : plaintext;
    var c : ciphertext;
    var b' : bool;

    (pk, sk) <@ S.kg();
    (m0, m1) <@ A.choose(pk);
    c        <@ S.enc(pk, m0);
    b'       <@ A.guess(c);
    return b';
  }
}.

module CPA_R (S:Scheme, A:Adversary) = {
  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var m0, m1 : plaintext;
    var c : ciphertext;
    var b' : bool;

    (pk, sk) <@ S.kg();
    (m0, m1) <@ A.choose(pk);
    c        <@ S.enc(pk, m1);
    b'       <@ A.guess(c);
    return b';
  }
}.

section.

  clone import LorR with
    type input <- unit.


  declare module S<:Scheme.
  declare module A<:Adversary {-S}.

  lemma pr_CPA_LR &m: 
    islossless S.kg => islossless S.enc =>
    islossless A.choose => islossless A.guess => 
    `| Pr[CPA_L(S,A).main () @ &m : res] - Pr[CPA_R(S,A).main () @ &m : res] | =
     2%r * `| Pr[CPA(S,A).main() @ &m : res] - 1%r/2%r |.
  proof.
    move => kg_ll enc_ll choose_ll guess_ll.
    have -> : Pr[CPA(S, A).main() @ &m : res] = 
              Pr[RandomLR(CPA_R(S,A), CPA_L(S,A)).main() @ &m : res].
    + byequiv (_ : ={glob S, glob A} ==> ={res})=> //.
      proc.      
      swap{1} 3-2; seq 1 1 : (={glob S, glob A, b}); first by rnd.
      if{2}; inline *; wp; do 4! call (_: true); auto => /> /#.
    rewrite -(pr_AdvLR_AdvRndLR (CPA_R(S,A)) (CPA_L(S,A)) &m) 2:/#.
    byphoare => //; proc.
    by call guess_ll; call enc_ll; call choose_ll; call kg_ll.
  qed.

end section.

module type OW_CPA_ADV = {
  proc find(pk : pkey, c:ciphertext) : plaintext 
}.

op [lossless] dplaintext : plaintext distr.

module OW_CPA (S:Scheme, A: OW_CPA_ADV) = {

  module O = {
    proc pco(sk, m : plaintext, c : ciphertext) : bool = {
      var m';
      m'   <@ S.dec(sk, c);
      return m' = Some m;
    }
  }

  proc main() : bool = {
    var pk : pkey;
    var m, m' : plaintext;
    var b;
    var cc : ciphertext;
    var sk : skey;

    (pk, sk) <@ S.kg();
    m        <$ dplaintext;
    cc       <@ S.enc(pk, m);
    m'       <@ A.find(pk,cc);
    b        <@ O.pco(sk, m',cc);
    return b;
  }
}.

end PKE.

abstract theory PKE_ROM.

type pkey.
type skey.
type plaintext.
type ciphertext.

clone import FullRO as RO.

module type Oracle = {
  include FRO [init, get]
}.

module type POracle = {
  include FRO [get]
}.
 

module type Scheme(H : POracle) = {
  proc kg() : pkey * skey
  proc enc(pk:pkey, m:plaintext)  : ciphertext
  proc dec(sk:skey, c:ciphertext) : plaintext option
}.

module type Adversary (H : POracle) = {
  proc choose(pk:pkey)     : plaintext * plaintext
  proc guess(c:ciphertext) : bool
}.

module CPA (H : Oracle, S:Scheme, A:Adversary) = {
  module A = A(H)

  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var m0, m1 : plaintext;
    var c : ciphertext;
    var b, b' : bool;

    H.init();
    (pk, sk) <@ S(H).kg();
    (m0, m1) <@ A.choose(pk);
    b        <$ {0,1};
    c        <@ S(H).enc(pk, b ? m1 : m0);
    b'       <@ A.guess(c);
    return (b' = b);
  }
}.

module CPA_L (H : Oracle, S:Scheme, A:Adversary) = {
  module A = A(H)

  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var m0, m1 : plaintext;
    var c : ciphertext;
    var b' : bool;

    H.init();
    (pk, sk) <@ S(H).kg();
    (m0, m1) <@ A.choose(pk);
    c        <@ S(H).enc(pk, m0);
    b'       <@ A.guess(c);
    return b';
  }
}.

module CPA_R (H : Oracle, S:Scheme, A:Adversary) = {
  module A = A(H)

  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var m0, m1 : plaintext;
    var c : ciphertext;
    var b' : bool;

    H.init();
    (pk, sk) <@ S(H).kg();
    (m0, m1) <@ A.choose(pk);
    c        <@ S(H).enc(pk, m1);
    b'       <@ A.guess(c);
    return b';
  }
}.

section.

  clone import LorR with
    type input <- unit.

  declare module S<:Scheme.
  declare module H<:Oracle {-S}.
  declare module A<:Adversary {-S,-H}.

  lemma pr_CPA_LR &m: 
    islossless S(H).kg => islossless S(H).enc => 
    islossless A(H).choose => islossless A(H).guess => islossless H.init =>
    `| Pr[CPA_L(H,S,A).main () @ &m : res] - Pr[CPA_R(H,S,A).main () @ &m : res] | =
     2%r * `| Pr[CPA(H,S,A).main() @ &m : res] - 1%r/2%r |.
  proof.
    move => kg_ll enc_ll choose_ll guess_ll init_ll.
    have -> : Pr[CPA(H,S, A).main() @ &m : res] = 
              Pr[RandomLR(CPA_R(H,S,A), CPA_L(H,S,A)).main() @ &m : res].
    + byequiv (_ : ={glob S, glob H, glob A} ==> ={res})=> //.
      proc.      
      swap{1} 4-3; seq 1 1 : (={glob S, glob H, glob A, b}); first by rnd.
      if{2}; inline *; wp. 
      + call (_: ={c, glob H, glob S, glob A} ==> ={res, glob H, glob S, glob A}); first by sim.
        call (_: ={glob H}); first by sim.
        call (_: ={pk, glob H, glob S, glob A} ==> ={res, glob H, glob S, glob A}); first by sim.
        call (_: ={glob H}); first by sim.
        call (_: true); first by auto => /> /#. 
      + call (_: ={c, glob H, glob S, glob A} ==> ={res, glob H, glob S, glob A}); first by sim.
        call (_: ={glob H}); first by sim.
        call (_: ={pk, glob H, glob S, glob A} ==> ={res, glob H, glob S, glob A}); first by sim.
        call (_: ={glob H}); first by sim.
        call (_: true); first by auto => /> /#. 
    rewrite -(pr_AdvLR_AdvRndLR (CPA_R(H,S,A)) (CPA_L(H,S,A)) &m) 2:/#.
    byphoare => //; proc.
    by call guess_ll; call enc_ll; call choose_ll; call kg_ll; call init_ll.
  qed.

end section.

module type CCA_ORC = {
  proc dec(c:ciphertext) : plaintext option
}.

module type CCA_ADV (H : POracle, O:CCA_ORC) = {
  proc choose(pk:pkey)     : plaintext * plaintext {O.dec}
  proc guess(c:ciphertext) : bool {O.dec}
}.

module CCA (H : Oracle, S:Scheme, A:CCA_ADV) = {
  var cstar : ciphertext option
  var sk : skey

  module O = {
    proc dec(c:ciphertext) : plaintext option = {
      var m : plaintext option;

      m <- None;
      if (Some c <> cstar) {
        m   <@ S(H).dec(sk, c);
      }
      return m;
    }
  }

  module A = A(H, O)

  proc main() : bool = {
    var pk : pkey;
    var m0, m1 : plaintext;
    var c : ciphertext;
    var b, b' : bool;

    H.init();
    cstar    <- None;
    (pk, sk) <@ S(H).kg();
    (m0, m1) <@ A.choose(pk);
    b        <$ {0,1};
    c        <@ S(H).enc(pk, b ? m1 : m0);
    cstar    <- Some c;
    b'       <@ A.guess(c);
    return (b' = b);
  }
}.

module type CORR_ADV (H : POracle) = {
  proc find(pk : pkey, sk : skey) : plaintext
}.

module Correctness_Adv (H : Oracle, S:Scheme, A : CORR_ADV) = {
  module A = A(H)

  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var c  : ciphertext;
    var m  : plaintext;
    var m' : plaintext option;

    H.init();
    (pk, sk) <@ S(H).kg();
    m        <@ A.find(pk,sk);
    c        <@ S(H).enc(pk, m);
    m'       <@ S(H).dec(sk, c);
    return (m' <> Some m); (* There's a typo in HKK *)
  }
}.

(* We need OW with validity oracle *)

module type VA_ORC = {
  proc cvo(c:ciphertext) : bool
  proc pco(m : plaintext, c:ciphertext) : bool
}.

module type PCVA_ADV (H : POracle, O: VA_ORC) = {
  proc find(pk : pkey, c:ciphertext) : plaintext 
}.

op [lossless] dplaintext : plaintext distr.

module OW_PCVA (H : Oracle, S:Scheme, A: PCVA_ADV) = {
  var sk : skey
  var cc : ciphertext

  module O = {
    proc cvo(c:ciphertext) : bool = {
      var m : plaintext option;

      m <- None;
      if (c <> cc) { m   <@ S(H).dec(sk, c); }
      return (m <> None);
    }

    proc pco(m : plaintext, c : ciphertext) : bool = {
      var m';
      m'   <@ S(H).dec(sk, c);
      return m' = Some m;
    }
  }

  module A = A(H,O)

  proc main() : bool = {
    var pk : pkey;
    var m, m' : plaintext;
    var b;

    H.init();
    (pk, sk) <@ S(H).kg();
    m        <$ dplaintext;
    cc       <@ S(H).enc(pk, m);
    m'       <@ A.find(pk,cc);
    b        <@ O.pco(m',cc);
    return b;
  }
}.

end PKE_ROM.
