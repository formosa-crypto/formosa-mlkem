require import AllCore Real.
require (****) PKE H_MLWE.

theory MLWE_PKE.

print PKE.

  clone import H_MLWE.
  import Elem.

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

(******************************************************************)
(*                    The Encryption Scheme                       *)

  module MLWE_PKE : Scheme = {
    proc kg() : pkey * skey = {
         var sd,s,e,_A,t;
         sd <$ dseed;
          s <$ dshort;
          e <$ dshort;
          _A <- H(sd);
          t <- _A `*|` s `|+|` e;
          return ((sd,t),s);
    }
    
    proc enc(pk : pkey, m : plaintext) : ciphertext = {
         var sd,t,r,e1,e2,_A,u,v;
         (sd,t) <- pk;
         r <$ dshort;
         e1 <$ dshort;
         e2 <$ dshort_elem;
         _A <- H(sd);
         u <- m_transpose _A `*|` r `|+|` e1;
         v <-  (v_transpose t) `|*|` r + e2 + (m_encode m);
         return (c_encode (u,v));
    }
    
    proc dec(sk : skey, c : ciphertext) : plaintext option = {
         var u,v;
         (u,v) <- c_decode c;
         return Some (m_decode (v - ((v_transpose sk) `|*|` u)));
    }
  }.

(******************************************************************)
(*                    Game Hopping Security                       *)
(******************************************************************)

(* Hop 1 *)

module MLWE_PKE1 = {

    proc kg() : pkey * skey = {
         var sd,s,t;
         sd <$ dseed;
          s <$ dshort;
          t <$ duni;
          return ((sd,t),s);
    }

  include MLWE_PKE [-kg]

}.

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

section.

declare module A : Adversary.


lemma hop1_left &m: 
  Pr[CPA(MLWE_PKE,A).main() @ &m : res] =
  Pr[H_MLWE(B1(A)).main(false,false) @ &m : res].
proof.
byequiv => //. 
proc.
inline *. 
seq 3 3 : (#pre /\ ={sd,s,e}); first by auto => />.
seq 2 2 : (#pre /\ ={_A} /\ t{1} = u0{2}); first by auto => />.
seq 0 5 : (#pre);
  first by rnd{2};wp;rnd{2};rnd{2};rnd{2}; auto => />;
     smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll). 
seq 1 6 : (#pre /\ ={pk}); first by auto => />. wp.
wp; call(_: true); auto => />; first by smt().
by call(_: true); auto => />.
qed.

lemma hop1_right &m: 
  Pr[H_MLWE(B1(A)).main(false,true) @ &m : res] = 
  Pr[CPA(MLWE_PKE1,A).main() @ &m : res].
proof.
byequiv => //.
proc.
inline *. 
seq 16 4 : (#pre /\ ={sd,pk} /\ t{2} = u1{1}); first by
   wp;rnd{1};wp;rnd{1};rnd{1};rnd;wp;rnd{1};rnd;rnd;   
  auto => />;smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll). 
wp; call(_: true); auto => />; first by move => &1 &2 *; smt().
by call(_: true); auto => />.
qed.

end section.

(* Hop 2 *)


module MLWE_PKE2 = {

    proc enc(pk : pkey, m : plaintext) : ciphertext = {
         var u, v;
         u <$duni;
         v <$duni_elem;
         return (c_encode (u,v + m_encode m));
    }

  include MLWE_PKE1 [-enc]


}.


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

section.

declare module A : Adversary.

lemma hop2_left &m: 
  Pr[CPA(MLWE_PKE1,A).main() @ &m : res] =
  Pr[H_MLWE(B2(A)).main(true,false) @ &m : res].
proof.
byequiv => //.
proc.
inline *. 
swap {2} 7 -5.
swap {2} [11..12] -8.
swap {2} [14..17] -9.
seq 4 7 : (#pre /\ ={sd,t,pk} /\ pk{2}.`1 = sd{2} /\ pk{2}.`2 = t{2});
  first by wp;rnd; rnd{1}; rnd; auto => />; first by smt(dshort_ll).
swap {2} [11..13] -9.
by wp; call(_: true); wp; rnd{2}; wp; rnd; rnd{2}; wp; 
   rnd; rnd; wp; rnd; call(_: true); auto => />; 
        smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll).  
qed.

lemma hop2_right &m: 
  Pr[H_MLWE(B2(A)).main(true,true) @ &m : res] = 
  Pr[CPA(MLWE_PKE2,A).main() @ &m : res].
proof.
byequiv => //.
proc.
inline *. 
swap {1} 7 -5.
swap {1} [11..12] -8.
swap {1} [14..17] -9.
seq 7 4 : (#pre /\ ={sd,t,pk} /\ pk{2}.`1 = sd{2} /\ pk{2}.`2 = t{2});
   first by wp;rnd;  rnd{2}; rnd; auto => />; smt(dshort_ll).
swap {1} [11..13] -9.
by wp; call(_: true);wp;rnd;wp;rnd{1};rnd;wp;rnd{1};rnd{1};wp;rnd; 
   call(_: true); auto => />;smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll).  
qed.

end section.

(* Final game analysis *)

module Game2(A : Adversary) = {
  proc main() = {
    var sd, s, t, m0, m1, u, v, b, b';
    sd <$ dseed;
    s <$ dshort;
    t <$ duni;
    (m0, m1) <@ A.choose((sd,t));
    u <$duni;
    v <$duni_elem;
    b' <@ A.guess(c_encode (u,v));
    b <$ {0,1};
    return b = b';
  }
}.

section.

declare module A : Adversary.
axiom A_guess_ll : islossless A.guess.
axiom A_choose_ll : islossless A.choose.

lemma game2_equiv &m : 
     Pr[CPA(MLWE_PKE2,A).main() @ &m : res] = 
     Pr[Game2(A).main() @ &m : res].
proof.
byequiv => //.
proc.
inline *.
swap {2} 8 -3.
call(_: true); wp.
rnd (fun z, z + m_encode (if b then m1 else m0){2})
    (fun z, z - m_encode (if b then m1 else m0){2}).
auto; call (_:true).
auto; progress; smt(@Elem).
qed.

lemma game2_prob &m :
     Pr[Game2(A).main() @ &m : res] = 1%r / 2%r.
proof. 
byphoare => //. 
proc.
rnd  (pred1 b')=> //=.
conseq (: _ ==> true).
+ by move=> /> b; smt. 
call (_: true ==> true); first by apply A_guess_ll.
auto => />; first by smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll).  
call (_: true ==> true); first by apply A_choose_ll.
by auto => />; first by smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll dseed_ll).  
qed.

end section.

section.

declare module A : Adversary.
axiom A_guess_ll : islossless A.guess.
axiom A_choose_ll : islossless A.choose.

lemma main_theorem &m :
  Pr[CPA(MLWE_PKE,A).main() @ &m : res] -  1%r / 2%r =
    Pr[H_MLWE(B1(A)).main(false,false) @ &m : res] -
       Pr[H_MLWE(B1(A)).main(false,true) @ &m : res] + 
    Pr[H_MLWE(B2(A)).main(true,false) @ &m : res] -
       Pr[H_MLWE(B2(A)).main(true,true) @ &m : res].
proof.
rewrite (hop1_left A &m).
rewrite (hop1_right A &m).
rewrite (hop2_left A &m).
rewrite (hop2_right A &m).
rewrite (game2_equiv A A_guess_ll A_choose_ll &m).
rewrite (game2_prob A A_guess_ll A_choose_ll &m).
by ring.
qed.

end section.


(******************************************************************)
(*                        Correctness                             *)
(* We consider adversarial correctness, where the attacker can    *)
(* choose the message where correctness is checked after seeing   *)
(* the public-key. This setting seems to be the one in which      *)
(* failure probability is considered in the FO construction.      *)
(******************************************************************)



module type CAdversary = {
   proc find(pk: pkey) : plaintext
}.

module AdvCorrectness(S : Scheme, A : CAdversary) = {
  proc main() : bool = {
    var pk : pkey;
    var sk : skey;
    var c : ciphertext;
    var m : plaintext;
    var m' : plaintext option;
    
    (pk,sk) <@ S.kg();
    m <@ A.find(pk);
    c <@ S.enc(pk, m);
    m' <@ S.dec(sk,c);

    return m' = Some m;
  }
}.

(* We want to prove a concrete bound on the probability of failure
   for Kyber. We will do so generically by first showing at this
   level that it all comes down to the noise distribution. *)

op noise_v : elem -> elem.
op noise_u : c_vector -> c_vector.

axiom encode_noise u v :
   c_decode (c_encode (u,v)) = 
      (u `|+|` noise_u u, v + noise_v v).

axiom matrix_props1 _A s e r :
v_transpose (_A `*|` s `|+|` e) `|*|` r = 
((v_transpose s) `|*` (m_transpose _A) `|*|` r) + ((v_transpose e) `|*|` r).

axiom matrix_props2 s _A r e1 cu :
(v_transpose s `|*|` (m_transpose _A `*|` r `|+|` e1 `|+|` cu)) = 
  ((v_transpose s) `|*` (m_transpose _A) `|*|` r)+ 
    (v_transpose s `|*|` e1) + (v_transpose s `|*|` cu).

op noise_exp _A s e r e1 e2 m = 
    let t = _A `*|` s `|+|` e in
    let u = m_transpose _A `*|` r `|+|` e1 in
    let v = (v_transpose t) `|*|` r + e2 + (m_encode m) in
    let (u',v') = c_decode (c_encode (u,v)) in
        v' - ((v_transpose s) `|*|` u') - (m_encode m).

lemma noise_exp_val _A s e r e1 e2 m :
    noise_exp _A s e r e1 e2 m = 
    let t = _A `*|` s `|+|` e in
    let u = m_transpose _A `*|` r `|+|` e1 in
    let v = (v_transpose t) `|*|` r + e2 + (m_encode m) in
    let cu = noise_u u in
    let cv = noise_v v in
          ((v_transpose e) `|*|` r) + e2 + cv - 
             ((v_transpose s) `|*|` e1) - ((v_transpose s) `|*|` cu).
proof.
rewrite /noise_exp //= encode_noise //= matrix_props1 matrix_props2 //=. 
by ring. 
qed.

op bad_noise : elem -> bool.

axiom good_decode m n :
    !bad_noise n =>
      m_decode (m_encode m + n) = m.

module AdvCorrectnessNoise(A : CAdversary) = {
   proc main() = {
         var sd,s,e,_A,r,e1,e2,m,n;
         sd <$ dseed;
         s <$ dshort;
         e <$ dshort;
         _A <- H(sd);
         m <@ A.find(sd,_A `*|` s `|+|` e);
         r <$ dshort;
         e1 <$ dshort;
         e2 <$ dshort_elem;
         n <- noise_exp _A s e r e1 e2 m;
         return (bad_noise n);
    }
}.

section.

declare module A : CAdversary.
axiom All : islossless A.find.

lemma correctness &m :
  Pr[ AdvCorrectness(MLWE_PKE,A).main() @ &m : res]  >=
  1%r - Pr[ AdvCorrectnessNoise(A).main() @ &m : res].
proof.
rewrite (_: 1%r - Pr[ AdvCorrectnessNoise(A).main() @ &m : res] =
   Pr[ AdvCorrectnessNoise(A).main() @ &m : !res]).
rewrite Pr[mu_not]; congr => //. 
+ byphoare => //.
proc. 
auto => />; first by smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll dseed_ll).
call (_: true); first by apply All.
auto => />; first by smt(duni_ll dshort_ll dshort_elem_ll duni_elem_ll dseed_ll).
+ byequiv => //.
proc. inline *.
auto => />; first by smt().
call(_: true). 
auto => />. 
move =>  ?????????????.
pose _AL := H sdL.
pose mL := result_R.
move => noise_expH.
rewrite  encode_noise  => />. 
rewrite (_: (v_transpose (_AL `*|` sL `|+|` eL) `|*|` rL + e2L + m_encode mL +
   noise_v (v_transpose (_AL `*|` sL `|+|` eL) `|*|` rL + e2L + m_encode mL) -
   (v_transpose sL `|*|`
    (m_transpose _AL `*|` rL `|+|` e1L `|+|`
     noise_u (m_transpose _AL `*|` rL `|+|` e1L)))) = 
m_encode mL + noise_exp _AL sL eL rL e1L e2L mL); last by apply good_decode.
by rewrite  noise_exp_val //= matrix_props1 matrix_props2; ring.
qed.

(* We can define the distributions of all noise components except cv
exactly, as this is the only component of the noise that really depends
on the attacker. Probability of bad noise can therefore be approximated
by assuming that attacker can always choose cv to get closer to the bound,
which is the same as tightening the bound based on max |cv|. *). 

end section.

end MLWE_PKE.
