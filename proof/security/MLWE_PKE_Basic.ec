require import AllCore Distr List SmtMap Dexcepted.
require (****) RndExcept StdOrder PKE_Ext MLWE.

theory MLWE_PKE_Basic.

clone import MLWE as MLWE_.
import Matrix_.
import ZR.

import StdOrder.IntOrder Matrix_ Big.BAdd.

type plaintext.

op m_encode : plaintext -> R. 
op m_decode : R -> plaintext.

type ciphertext = vector * R.

type pkey  = matrix * vector.
type skey  = vector.

(******************************************************************)
(*    The Security Games                                          *)

clone import PKE_Ext as PKE_ with 
  type pkey <- pkey,
  type skey <- skey,
  type plaintext <- plaintext,
  type ciphertext <- ciphertext.

(******************************************************************)
(*                The Basic Encryption Scheme                     *)

module MLWE_PKE_BASIC : Scheme = {
  proc kg() : pkey * skey = {
    var s,e,_A,t;
    _A <$ duni_matrix;
    s  <$ dshort;
    e  <$ dshort;
    t  <- _A *^ s + e;
    return ((_A,t),s);
  }
  
  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var t,r,e1,e2,_A,u,v;
    (_A,t) <- pk;
    r  <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    u  <- m_transpose _A *^ r + e1;
    v  <- (t `<*>` r) &+ e2 &+ (m_encode m);
    return(u,v);
  }
  
  proc dec(sk : skey, c : ciphertext) : plaintext option = {
    var u,v;
    (u,v) <- c;
    return Some (m_decode (v &- (sk `<*>` u)));
  }
}.


(******************************************************************)
(*       Game Hopping Security                                    *)
(******************************************************************)

(* Hop 1 *)

module MLWE_PKE_BASIC1 = {
  proc kg() : pkey * skey = {
    var _A,s,t;
    _A <$ duni_matrix;
    s  <$ dshort;
    t  <$ duni;
    return ((_A,t),s);
  }

  include MLWE_PKE_BASIC [-kg]

}.

module B1(A : Adversary) : Adv_T = {

  proc kg(_A : matrix, t : vector) : pkey * skey = {
    return ( (_A,t),witness);
  }
  
  proc guess(_A : matrix, t : vector, uv : vector * R) : bool = {
    var pk, sk, m0, m1, c, b, b';
    (pk,sk) <@ kg(_A,uv.`1);
    (m0, m1) <@ A.choose(pk);
    b <$ {0,1};
    c <@ MLWE_PKE_BASIC.enc(pk, if b then m1 else m0);
    b' <@ A.guess(c);
    return b' = b;
  }
}.

section.

declare module A <: Adversary.

lemma hop1_left &m: 
  Pr[CPA(MLWE_PKE_BASIC,A).main() @ &m : res] =
  Pr[MLWE(B1(A)).main(false) @ &m : res].
proof.
byequiv => //. 
proc; inline *. 
wp; call(:true); auto => /=. 
call (:true); wp.
by rnd{2}; wp; do 3! rnd{2}; auto; smt(duni_ll).
qed.

lemma hop1_right &m: 
  Pr[MLWE(B1(A)).main(true) @ &m : res] = 
  Pr[CPA(MLWE_PKE_BASIC1,A).main() @ &m : res].
proof.
byequiv => //.
proc;inline *. 
wp; call(:true); auto => /=.
call(:true); wp => /=.
rnd{1}; wp; do 2! rnd{1}.
by rnd; wp; rnd{1}; auto; smt(duni_ll dshort_ll).
qed.

end section.

(* Hop 2 *)

module MLWE_PKE_BASIC2 = {

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var _A,u, v;
    _A <- m_transpose pk.`1;
    u <$duni;
    v <$duni_R;
    return (u,v &+ m_encode m);
  }

  include MLWE_PKE_BASIC1 [-enc]

}.

module B2(A : Adversary) : Adv_T = {

  proc kg(_A : matrix, t : vector) : pkey * skey = {
    return ((m_transpose _A,t),witness);
  }
  
  proc enc(pk : pkey, m : plaintext, uv : vector * R) : ciphertext = {
    return ((uv.`1, uv.`2 &+ m_encode m));
  }
  
  proc guess(_A : matrix, t : vector, uv : vector * R) : bool = {
    var pk, sk, m0, m1, c, b, b';
    (pk,sk) <@ kg(_A,t);
    (m0, m1) <@ A.choose(pk);
    b <$ {0,1};
    c <@ enc(pk, if b then m1 else m0,uv);
    b' <@ A.guess(c);
    return b' = b;
  }

}.

section.

declare module A <: Adversary.

lemma hop2_left &m: 
  Pr[CPA(MLWE_PKE_BASIC1,A).main() @ &m : res] =
  Pr[MLWE(B2(A)).main(false) @ &m : res].
proof.
byequiv => //.
proc; inline *. 
swap {2} 6 -4.
swap {2} [10..11] -7.
swap {2} [13..16] -8.
seq 4 7 : (#pre /\ ={t,pk} /\ (pk{2}).`1 = m_transpose _A{2} /\ (pk{2}).`2 = t{2}).
+ wp;rnd; rnd{1}; rnd (fun m => m_transpose m); auto => /= />;
  smt(trmxK mu1_uni duni_matrix_uni duni_matrix_fu dshort_ll).
swap {2} [10..12] -8.
wp; call(_: true); wp; rnd{2}; wp; rnd; rnd{2}; wp; 
   rnd; rnd; wp; rnd; call(_: true); auto => />; smt(duni_ll dshort_ll trmxK).
qed.

lemma hop2_right &m: 
  Pr[MLWE(B2(A)).main(true) @ &m : res] = 
  Pr[CPA(MLWE_PKE_BASIC2,A).main() @ &m : res].
proof.
byequiv => //.
proc; inline *. 
swap {1} 6 -4.
swap {1} [10..11] -7.
swap {1} [13..16] -8.
seq 7 4 : (#pre /\ ={t,pk} /\ (pk{2}).`1 = _A{2} /\ (pk{2}).`2 = t{2}).
+ wp;rnd; rnd{2}; rnd (fun m => m_transpose m); auto => /= />;
  smt(trmxK mu1_uni duni_matrix_uni duni_matrix_fu dshort_ll).
swap {1} [10..12] -8.
by wp; call(_: true);wp;rnd;wp;rnd{1};rnd;wp;rnd{1};rnd{1};wp;rnd; 
   call(_: true); auto;smt(duni_ll dshort_ll).
qed.

end section.

(* Final game analysis *)

section.

declare module A <: Adversary.

local module Game2(A : Adversary) = {
  proc main() = {
    var _A, s, t, m0, m1, u, v, b, b';
    _A <$ duni_matrix;
    s <$ dshort;
    t <$ duni;
    (m0, m1) <@ A.choose(_A,t);
    u <$duni;
    v <$duni_R;
    b' <@ A.guess((u,v));
    b <$ {0,1};
    return b = b';
  }
}.

local lemma game2_equiv &m :
  Pr[CPA(MLWE_PKE_BASIC2,A).main() @ &m : res] = 
  Pr[Game2(A).main() @ &m : res].
proof.
byequiv => //.
proc; inline *.
swap {2} 8 -3.
call(_: true); wp.
rnd (fun z, z &+ m_encode (if b then m1 else m0){2})
    (fun z, z &- m_encode (if b then m1 else m0){2}).
auto; call (_:true).
auto => /> *; split => *; [ ring | split => *; [ring | smt()]].
qed.

local lemma game2_prob &m :
  islossless A.guess => islossless A.choose =>
  Pr[Game2(A).main() @ &m : res] = 1%r / 2%r.
proof.
move => A_guess_ll A_choose_ll.
byphoare => //. 
proc.
rnd  (pred1 b')=> //=.
conseq (: _ ==> true).
+ by move=> />; apply DBool.dbool1E.
by islossless; smt(duni_ll duni_matrix_ll dshort_ll). 
qed.

lemma main_theorem &m :
  islossless A.guess => islossless A.choose =>
  Pr[CPA(MLWE_PKE_BASIC,A).main() @ &m : res] -  1%r / 2%r =
    Pr[MLWE(B1(A)).main(false) @ &m : res] -
       Pr[MLWE(B1(A)).main(true) @ &m : res] + 
    Pr[MLWE(B2(A)).main(false) @ &m : res] -
       Pr[MLWE(B2(A)).main(true) @ &m : res].
proof.
move => A_guess_ll A_choose_ll.
rewrite (hop1_left A &m).
rewrite (hop1_right A &m).
rewrite (hop2_left A &m).
rewrite (hop2_right A &m).
rewrite (game2_equiv &m).
rewrite (game2_prob &m _ _) //.
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

(* We want to prove a concrete bound on the probability of failure
   for Kyber. We will do so generically by first showing at this
   level that it all comes down to the noise distribution. *)

op noise_exp _A s e r e1 e2 m = 
    let t = _A *^ s + e in
    let u = m_transpose _A *^ r + e1 in
    let v = (t `<*>` r) &+ e2 &+ (m_encode m) in
        v &- (s `<*>` u) &- (m_encode m).

lemma matrix_props1 _A s e r :
  (_A *^ s + e) `<*>` r = 
  (s ^* m_transpose _A `<*>` r) &+ (e `<*>` r).
proof. by rewrite dotpDl -mulmxTv trmxK. qed.

lemma matrix_props2 s _A r e1 :
  s `<*>` (m_transpose _A *^ r + e1) = 
  (s ^* m_transpose _A `<*>` r) &+ 
    (s `<*>` e1).
proof. by rewrite !dotpDr dotpC dotp_mulmxv dotpC. qed.

op noise_exp_simpl s e r e1 e2 = 
  ((e `<*>` r) &- (s `<*>` e1)  &+ e2 ).

lemma noise_exp_val _A s e r e1 e2 m :
  noise_exp _A s e r e1 e2 m = 
  noise_exp_simpl s e r e1 e2
by  rewrite /noise_exp /noise_exp_simpl /=  matrix_props1 matrix_props2; ring. 

(* The above noise expression is computed over the abstract
   rings that define the scheme. Noise bounds are checked and
   computed over the integers. *)

op max_noise : int.
op under_noise_bound : R -> int -> bool.

axiom good_decode m n :
  under_noise_bound n max_noise =>
  m_decode (m_encode m &+ n) = m.


module CorrectnessBound = {
  proc main() = {
    var s,e,r,e1,e2,n;
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    n <- noise_exp_simpl s e r e1 e2;
    return (!under_noise_bound n max_noise);
  }
}.

section.

declare module A <: CAdversary.

lemma correctness_noise &m :
  islossless A.find =>
  Pr[CorrectnessAdv(MLWE_PKE_BASIC, A).main() @ &m : res] >=
  1%r - Pr[CorrectnessBound.main() @ &m : res].
proof. 
move => A_ll.
have -> : Pr[CorrectnessAdv(MLWE_PKE_BASIC, A).main() @ &m : res] = 
    1%r - Pr[CorrectnessAdv(MLWE_PKE_BASIC, A).main() @ &m : !res].
+ rewrite Pr[mu_not].
  have -> :  Pr[CorrectnessAdv(MLWE_PKE_BASIC, A).main() @ &m : true]  = 1%r; last by ring.
  byphoare => //; islossless; smt(dshort_ll duni_matrix_ll).

have : Pr[CorrectnessAdv(MLWE_PKE_BASIC, A).main() @ &m : !res] <= 
      Pr[CorrectnessBound.main() @ &m : res]; last by smt().
byequiv => //.
proc;inline *;swap {1} 8 4; swap {1} 6 5.
wp;call{1}(_: true ==> true).
swap {2} [2..3] -1.
auto => />; rewrite duni_matrix_ll /=  /= => _A _ s _ e  _ r _  e1 _ e2 _ m /=.
have -> : (_A *^ s + e `<*>` r) &+ e2 &+ m_encode m &+ - (s `<*>` trmx _A *^ r + e1)  = 
          m_encode m  + noise_exp _A s e r e1 e2 m by rewrite /noise_exp /=;ring.
have -> := noise_exp_val _A s e r e1 e2 m.
smt(good_decode).
qed.

lemma correctness_theorem &m fail_prob :
 islossless A.find =>
   Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob =>
     Pr[ CorrectnessAdv(MLWE_PKE_BASIC,A).main() @ &m : res] >= 1%r - fail_prob
 by smt(correctness_noise). 

end section.

end MLWE_PKE_Basic.
