require import List Int IntExtra IntDiv CoreMap.
from Jasmin require import JModel.

require import Array4 Array5 Array24 Array25 Array32 Array33 Array34 Array64
               Array128 Array168 Array256 Array768.
require import WArray20 WArray32 WArray33 WArray34 WArray40 WArray64
               WArray128 WArray168 WArray192 WArray200 WArray256 WArray512
               WArray1536.

require (****) Kyber.  
clone import Kyber as Kyber_ with
   type Kyber.MLWEPKE.H_MLWE.seed = W8.t Array32.t.
require import Indcpa.

import MLWE_PKE.
import MLWE_PKE.

print M.
(* WE DEFINE ALTERNATIVE VERSIONS OF THE EXTRACTED CODE TO
   MODULARIZE RANDOMNESS SAMPLINGS *)

op scoins : W8.t Array32.t distr.

module Mderand = {
  include M [-indcpa_keypair_jazz, indcpa_enc_jazz, indcpa_dec_jazz]

  proc indcpa_keypair_expandseed(randomnessp:W64.t) : 
    W8.t Array32.t *  W16.t Array768.t * W16.t Array768.t = {
    var i:W64.t;
    var c:W8.t;
    var inbuf:W8.t Array32.t;
    var buf:W8.t Array64.t;
    var j:W64.t;
    var publicseed:W8.t Array32.t;
    var noiseseed:W8.t Array32.t;
    var nonce:W8.t;
    var poly0:W16.t Array256.t;
    var poly1:W16.t Array256.t;
    var poly2:W16.t Array256.t;
    var skpv:W16.t Array768.t;
    var e:W16.t Array768.t;

    inbuf <- witness;
    noiseseed <- witness;
    publicseed <- witness;

    i <- (W64.of_int 0);
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (randomnessp + i)));
      inbuf.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
    }
    buf <@ sha3512_32 (inbuf);
    i <- (W64.of_int 0);
    j <- (W64.of_int 32);
    
    while ((i \ult (W64.of_int 32))) {
      c <- buf.[(W64.to_uint i)];
      publicseed.[(W64.to_uint i)] <- c;
      c <- buf.[(W64.to_uint j)];
      noiseseed.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
      j <- (j + (W64.of_int 1));
    }
    nonce <- (W8.of_int 0);
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly2 <@ poly_getnoise (noiseseed, nonce);
    skpv <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (nonce + (W8.of_int 1));
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (nonce + (W8.of_int 1));
    poly2 <@ poly_getnoise (noiseseed, nonce);
    e <@ polyvec_frompolys (poly0, poly1, poly2);
    return (publicseed,e,skpv);
  }

  proc indcpa_keypair_compute(publicseed : W8.t Array32.t, e skpv : W16.t Array768.t) : 
      W16.t Array768.t *  W16.t Array768.t = {
    var poly0:W16.t Array256.t;
    var poly1:W16.t Array256.t;
    var poly2:W16.t Array256.t;
    var pkpv:W16.t Array768.t;
    var zero:W64.t;
    var a0:W16.t Array768.t;
    var a1:W16.t Array768.t;
    var a2:W16.t Array768.t;

    zero <- (W64.of_int 0);
    (a0, a1, a2) <@ gen_matrix (publicseed, zero);
    skpv <@ polyvec_ntt (skpv);
    e <@ polyvec_ntt (e);
    poly0 <@ polyvec_pointwise_acc (a0, skpv);
    poly0 <@ poly_frommont (poly0);
    poly1 <@ polyvec_pointwise_acc (a1, skpv);
    poly1 <@ poly_frommont (poly1);
    poly2 <@ polyvec_pointwise_acc (a2, skpv);
    poly2 <@ poly_frommont (poly2);
    pkpv <@ polyvec_frompolys (poly0, poly1, poly2);
    pkpv <@ polyvec_add (pkpv, e);
    pkpv <@ polyvec_reduce (pkpv);
    return (skpv, pkpv);

  }

  proc indcpa_keypair_jazz (pkp:W64.t, skp:W64.t, randomnessp:W64.t) : unit = {
    var i:W64.t;
    var c:W8.t;
    var publicseed:W8.t Array32.t;
    var a0:W16.t Array768.t;
    var a1:W16.t Array768.t;
    var a2:W16.t Array768.t;
    var e:W16.t Array768.t;
    var skpv:W16.t Array768.t;
    var pkpv:W16.t Array768.t;

    (publicseed, e, skpv) <@ indcpa_keypair_expandseed(randomnessp);
    (skpv, pkpv) <@ indcpa_keypair_compute(publicseed, e, skpv);

    polyvec_tobytes (skp, skpv);
    polyvec_tobytes (pkp, pkpv);

    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (3 * 384)));
    
    while ((i \ult (W64.of_int 32))) {
      c <- publicseed.[(W64.to_uint i)];
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))) c;
      pkp <- (pkp + (W64.of_int 1));
      i <- (i + (W64.of_int 1));
    }
    return ();
  }

  proc kg(pkp:W64.t, skp:W64.t, randomnessp:W64.t) : unit = {
    var coins, i;
    coins <$ scoins;
    i <- 0;  
    while (i < 32) {
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (randomnessp + (W64.of_int i))) coins.[i];
      i <- i + 1;
    }
    indcpa_keypair_jazz(pkp, skp, randomnessp);
  }
  
  proc indcpa_enc_expand_seed(coinsp:W64.t) :
    W16.t Array768.t * W16.t Array768.t * W16.t Array256.t  = {
    var i:W64.t;
    var c:W8.t;
    var noiseseed:W8.t Array32.t;
    var poly0:W16.t Array256.t;
    var poly1:W16.t Array256.t;
    var poly2:W16.t Array256.t;
    var sp_0:W16.t Array768.t;
    var ep:W16.t Array768.t;
    var epp:W16.t Array256.t;
    var nonce:W8.t;

    noiseseed <- witness;

    i <- (W64.of_int 0);

    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (coinsp + i)));
      noiseseed.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
    }
    nonce <- (W8.of_int 0);
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 1);
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 2);
    poly2 <@ poly_getnoise (noiseseed, nonce);
    sp_0 <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (W8.of_int 3);
    poly0 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 4);
    poly1 <@ poly_getnoise (noiseseed, nonce);
    nonce <- (W8.of_int 5);
    poly2 <@ poly_getnoise (noiseseed, nonce);
    ep <@ polyvec_frompolys (poly0, poly1, poly2);
    nonce <- (W8.of_int 6);
    epp <@ poly_getnoise (noiseseed, nonce);
    return (sp_0,ep,epp);
  }

  proc indcpa_enc_compute(ctp:W64.t, msgp:W64.t,publicseed:W8.t Array32.t, pkpv:W16.t Array768.t, sp_0 ep:W16.t Array768.t, epp:W16.t Array256.t) = {
    var k:W16.t Array256.t;
    var one:W64.t;
    var at0:W16.t Array768.t;
    var at1:W16.t Array768.t;
    var at2:W16.t Array768.t;
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;
    var poly0:W16.t Array256.t;
    var poly1:W16.t Array256.t;
    var poly2:W16.t Array256.t;
    
    k <@ poly_frommsg (msgp);
    one <- (W64.of_int 1);
    (at0, at1, at2) <@ gen_matrix (publicseed, one);
    sp_0 <@ polyvec_ntt (sp_0);
    poly0 <@ polyvec_pointwise_acc (at0, sp_0);
    poly1 <@ polyvec_pointwise_acc (at1, sp_0);
    poly2 <@ polyvec_pointwise_acc (at2, sp_0);
    bp <@ polyvec_frompolys (poly0, poly1, poly2);
    v <@ polyvec_pointwise_acc (pkpv, sp_0);
    bp <@ polyvec_invntt (bp);
    v <@ poly_invntt (v);
    bp <@ polyvec_add (bp, ep);
    v <@ poly_add (v, epp);
    v <@ poly_add (v, k);
    bp <@ polyvec_reduce (bp);
    v <@ poly_reduce (v);
    polyvec_compress (ctp, bp);
    ctp <- (ctp + (W64.of_int (3 * 320)));
    poly_compress (ctp, v);
    return ();
  }

  proc indcpa_enc_jazz (ctp:W64.t, msgp:W64.t, pkp:W64.t, coinsp:W64.t) : unit = {
    
    var i:W64.t;
    var c:W8.t;
    var publicseed:W8.t Array32.t;
    var sp_0:W16.t Array768.t;
    var ep:W16.t Array768.t;
    var epp:W16.t Array256.t;
    var pkpv:W16.t Array768.t;

    publicseed <- witness;
    pkpv <@ polyvec_frombytes (pkp);
    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (3 * 384)));
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))));
      publicseed.[(W64.to_uint i)] <- c;
      pkp <- (pkp + (W64.of_int 1));
      i <- (i + (W64.of_int 1));
    }
    (sp_0,ep,epp) <@ indcpa_enc_expand_seed(coinsp);
    indcpa_enc_compute(ctp,msgp,publicseed,pkpv,sp_0,ep,epp);
    return ();
  }
  
  proc enc(ctp:W64.t, msgp:W64.t, pkp:W64.t, coinsp:W64.t) : unit = {
    var coins, i;
    coins <$ scoins;
    i <- 0;  
    while (i < 32) {
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (coinsp + (W64.of_int i))) coins.[i];
      i <- i + 1;
    }
    indcpa_enc_jazz(ctp, msgp, pkp, coinsp);
  }

  proc indcpa_dec_compute(msgp:W64.t, ctp:W64.t,skpv:W16.t Array768.t) : unit = {
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;
    var mp:W16.t Array256.t;

    bp <@ polyvec_decompress (ctp);
    ctp <- (ctp + (W64.of_int (3 * 320)));
    v <@ poly_decompress (ctp);
    bp <@ polyvec_ntt (bp);
    mp <@ polyvec_pointwise_acc (skpv, bp);
    mp <@ poly_invntt (mp);
    mp <@ poly_sub (v, mp);
    mp <@ poly_reduce (mp);
    poly_tomsg (msgp, mp);
    return ();
  }

  proc indcpa_dec_jazz (msgp:W64.t, ctp:W64.t, skp:W64.t) : unit = {
    
    var skpv:W16.t Array768.t;

    skpv <@ polyvec_frombytes (skp);
    indcpa_dec_compute(msgp,ctp,skpv);
    return ();
  }

}.

equiv keypair_same :  M.indcpa_keypair_jazz ~ Mderand.indcpa_keypair_jazz :
  ={arg,Glob.mem} ==> ={res,Glob.mem}.
proc.
inline Mderand.indcpa_keypair_expandseed Mderand.indcpa_keypair_compute. 
by swap {1} [20..21] 14; sim.
qed.

equiv enc_same : M.indcpa_enc_jazz ~ Mderand.indcpa_enc_jazz :
  ={arg,Glob.mem} ==> ={res,Glob.mem}.
proc.
inline Mderand.indcpa_enc_expand_seed Mderand.indcpa_enc_compute.
swap {1} 9 -8.
swap {1} 18 -16.
swap {2} [6..9] -3.
swap {1} [22..24] 16. 
sim; auto => />; call (_: ={Glob.mem}).
by sim.
by auto => />.
qed.

equiv dec_same :  M.indcpa_dec_jazz ~ Mderand.indcpa_dec_jazz :
  ={arg,Glob.mem} ==> ={res,Glob.mem}.
proc.
inline Mderand.indcpa_dec_compute.
swap {2} 1 2.
swap {2} [3..4] 3.
by sim.
qed.

(***************************************************)
(* Now we can prove that the deterministic 
   computations are correct assuming that H maps
   to gen_matrix.
*)

op lift_matrix : (W16.t Array768.t * W16.t Array768.t * W16.t Array768.t) -> 
      Kyber.MLWEPKE.H_MLWE.M.Matrix.matrix.

axiom gen_matrix &m s :
  hoare [ M.gen_matrix  :
    s = seed /\ transposed = W64.zero ==>
      Kyber.MLWEPKE.H_MLWE.H(s) = lift_matrix res
  ].

axiom gen_matrix_t &m s :
  hoare [ M.gen_matrix  :
    s = seed /\ transposed = W64.one ==>
      Kyber.MLWEPKE.H_MLWE.H(s) = Kyber.MLWEPKE.H_MLWE.M.Matrix.trmx (lift_matrix res)
  ].

print Mderand.
hoare kg_correct @m : 
  [  Mderand.indcpa_keypair_compute() @m :
       true ==> 


(***************************************************)
(* Finally, under some assumptions on sampling 
   we should get full equivalences.
*)

section.

declare module H : H_MLWE.H_MLWE_ROM.Types.ARO.

lemma kg_corr : 
  equiv [ MLWE_PKE(H).kg ~ Mderand.kg :
     true ==> true ].
proc.
inline Mderand.indcpa_keypair_jazz.
have indhop : 
   equiv [ MLWE_PKE(H).kg ~ M.indcpa_keypair_jazz :
     true ==> true ].
admitted.

lemma enc_corr &m : 
  equiv [ MLWE_PKE(H).enc ~ M.indcpa_enc_jazz :
     true ==> true ].
proc.
admitted.


lemma dec_corr &m : 
  equiv [ MLWE_PKE(H).dec ~ M.indcpa_dec_jazz :
     true ==> true ].
proc.
admitted.

end section.