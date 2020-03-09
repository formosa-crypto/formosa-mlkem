require import AllCore.
require import H_MLWE .
require (****) PKE.

theory MLWE_PKE.

  clone import H_MLWE.

  type plaintext.
  type ciphertext.

  clone import PKE with 
    type pkey = (seed * c_vector),
    type skey = c_vector,
    type plaintext <- plaintext,
    type ciphertext <- ciphertext.

  type raw_ciphertext = c_vector * elem.

  op m_encode : plaintext -> elem. 
  op m_decode : elem -> plaintext.
 
  op c_encode : raw_ciphertext -> ciphertext.
  op c_decode : ciphertext -> raw_ciphertext.

  module MLWE_PKE = {
    proc kg() : pkey * skey = {
         var sd,s,e,_A,t;
         sd <$ dseed;
          s <$ dshort;
          e <$ dshort;
          _A <- H(sd);
          t <- _A `|*|` s `|+|` e;
          return ((sd,t),s);
    }
    
    proc enc(pk : pkey, m : plaintext) : ciphertext = {
         var sd,t,r,e1,e2,_A,u,v;
         (sd,t) <- pk;
         r <$ dshort;
         e1 <$ dshort;
         e2 <$ dshort_elem;
         _A <- H(sd);
         u <- m_transpose _A `|*|` r `|+|` e1;
         v <-  (v_transpose t) * r + e2 + (m_encode m);
         return (c_encode (u,v));
    }
    
    proc dec(sk : skey, c : ciphertext) : plaintext option = {
         var u,v;
         (u,v) <- c_decode c;
         return Some (m_decode (v - (v_transpose sk) * u));
    }
  }.

module MLWE_PKE1 = {

    proc kg() : pkey * skey = {
         var sd,t;
         sd <$ dseed;
          t <$ duni;
          return ((sd,t),witness);
    }

  include MLWE_PKE [-kg]

}.

module MLWE_PKE2 = {

    proc enc(pk : pkey, m : plaintext) : ciphertext = {
         var u, v;
         u <$duni;
         v <$duni_elem;
         return (c_encode (u,v + m_encode m));
    }

  include MLWE_PKE1 [-enc]


}.

section.

declare module A : Adversary.

(* FIRST HOP *)

 module B1(A : Adversary) : Adv_T = {
    proc kg(sd : seed, t : c_vector) : pkey * skey = {
         return ((sd,t),witness);
    }

    proc guess(sd : seed, t : c_vector, uv : c_vector * elem) : bool = {
      var pk : pkey;
      var sk : skey;
      var m0 : plaintext;
      var m1 : plaintext;
      var c : ciphertext;
      var b : bool;
      var b' : bool;
      
      (pk,sk) <@ kg(sd,uv.`1);
      (m0, m1) <@ A.choose(pk);
      b <$ {0,1};
      c <@ MLWE_PKE.enc(pk, if b then m1 else m0);
      b' <@ A.guess(c);
      return b' = b;
    }
}.

local lemma hop1_left &m: 
  Pr[CPA(MLWE_PKE,A).main() @ &m : res] =
  Pr[H_MLWE(B1(A)).main(false,false) @ &m : res].
proof.
byequiv.
proc.
inline *. 
seq 3 3 : (#pre /\ ={sd,s,e}); first by auto => />.
seq 2 2 : (#pre /\ ={_A} /\ t{1} = u0{2}); first by auto => />.
seq 0 5 : (#pre); 
   first by rnd{2};wp;rnd{2};rnd{2};rnd{2}; auto => />;
     smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll). 
seq 1 6 : (#pre /\ ={pk}); first by auto => />.
wp; call(_: true); auto => />; first by move => &1 &2 *; smt().
by call(_: true); auto => />.
done.
done.
qed.

local lemma hop1_right &m: 
  Pr[H_MLWE(B1(A)).main(false,true) @ &m : res] = 
  Pr[CPA(MLWE_PKE1,A).main() @ &m : res].
proof.
byequiv.
proc.
inline *. 
seq 16 3 : (#pre /\ ={sd,pk} /\ t{2} = u1{1}); first by
   wp;rnd{1};wp;rnd{1};rnd{1};rnd;wp;rnd{1};rnd{1};rnd;   
  auto => />;smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll). 
wp; call(_: true); auto => />; first by move => &1 &2 *; smt().
by call(_: true); auto => />.
done.
done.
qed.

(* SECOND HOP *)

 module B2(A : Adversary) : Adv_T = {
    proc kg(sd : seed, t : c_vector) : pkey * skey = {
         return ((sd,t),witness);
    }

    proc enc(pk : pkey, m : plaintext, uv : c_vector * elem) : ciphertext = {
         return (c_encode (uv.`1, uv.`2 + m_encode m));
    }

    proc guess(sd : seed, t : c_vector, uv : c_vector * elem) : bool = {
      var pk : pkey;
      var sk : skey;
      var m0 : plaintext;
      var m1 : plaintext;
      var c : ciphertext;
      var b : bool;
      var b' : bool;
      
      (pk,sk) <@ kg(sd,t);
      (m0, m1) <@ A.choose(pk);
      b <$ {0,1};
      c <@ enc(pk, if b then m1 else m0,uv);
      b' <@ A.guess(c);
      return b' = b;
    }
}.

local lemma hop2_left &m: 
  Pr[CPA(MLWE_PKE1,A).main() @ &m : res] =
  Pr[H_MLWE(B2(A)).main(true,false) @ &m : res].
proof.
byequiv.
proc.
inline *. 
swap {2} 7 -5.
swap {2} [11..12] -8.
swap {2} [14..17] -9.
seq 3 7 : (#pre /\ ={sd,t,pk} /\ pk{2}.`1 = sd{2} /\ pk{2}.`2 = t{2});
   first by wp;rnd;  rnd; auto => />.
swap {2} [11..13] -9.
by wp; call(_: true); wp; rnd{2}; wp; rnd; rnd{2}; wp; 
   rnd; rnd; wp; rnd; call(_: true); auto => />; 
        smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll).  
done.
done.
qed.

local lemma hop2_right &m: 
  Pr[H_MLWE(B2(A)).main(true,true) @ &m : res] = 
  Pr[CPA(MLWE_PKE2,A).main() @ &m : res].
proof.
byequiv.
proc.
inline *. 
swap {1} 7 -5.
swap {1} [11..12] -8.
swap {1} [14..17] -9.
seq 7 3 : (#pre /\ ={sd,t,pk} /\ pk{2}.`1 = sd{2} /\ pk{2}.`2 = t{2});
   first by wp;rnd;  rnd; auto => />.
swap {1} [11..13] -9.
by wp; call(_: true);wp;rnd;wp;rnd{1};rnd;wp;rnd{1};rnd{1};wp;rnd; 
   call(_: true); auto => />;smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll).  
done.
done.
qed.


end MLWE_PKE.
