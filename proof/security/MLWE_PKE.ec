require import AllCore Distr List SmtMap Dexcepted.
require (****) ROM RndExcept StdOrder PKE MLWE.

clone import MLWE as MLWE_.
import RO.
import Lazy.

import StdOrder.IntOrder Matrix_ Big.BAdd.

type plaintext.
type ciphertext.

type raw_ciphertext = vector * R.

op m_encode : plaintext -> R. 
op m_decode : R -> plaintext.

op c_encode : raw_ciphertext -> ciphertext.
op c_decode : ciphertext -> raw_ciphertext.

(******************************************************************)
(*    The Security Games                                          *)


clone import PKE as PKE_ with 
  type RO.in_t  <- seed,
  type RO.out_t <- matrix,
  op RO.dout    <- fun (sd : seed) => duni_matrix, 
  type RO.d_in_t <- unit,
  type RO.d_out_t <- bool,
  type pkey = (vector * seed),
  type skey = vector,
  type plaintext <- plaintext,
  type ciphertext <- ciphertext.

(******************************************************************)
(*                    The Encryption Scheme                       *)

module ConcreteH : Oracle = {
  proc init() = {}
  proc o(sd : seed) = { return H sd;}
}.

module MLWE_PKE(H: POracle) : Scheme = {
  proc kg() : pkey * skey = {
    var sd,s,e,_A,t;
    sd <$ dseed;
    s  <$ dshort;
    e  <$ dshort;
    _A <@ H.o(sd);
    t  <- _A *^ s + e;
    return ((t,sd),s);
  }
  
  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var sd,t,r,e1,e2,_A,u,v;
    (t,sd) <- pk;
    r  <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    _A <@ H.o(sd);
    u  <- m_transpose _A *^ r + e1;
    v  <- (t `<*>` r) +& e2 +& (m_encode m);
    return (c_encode (u,v));
  }
  
  proc dec(sk : skey, c : ciphertext) : plaintext option = {
    var u,v;
    (u,v) <- c_decode c;
    return Some (m_decode (v -& (sk `<*>` u)));
  }
}.

module MLWE_PKE_H = MLWE_PKE(ConcreteH).
module MLWE_PKE_RO = MLWE_PKE(LRO).

(******************************************************************)
(*       Game Hopping Security for Concrete Hash                  *)
(******************************************************************)

(* Hop 1 *)

module MLWE_PKE1(O : POracle) = {
  proc kg() : pkey * skey = {
    var _A,sd,s,t;
    sd <$ dseed;
    s  <$ dshort;
    t  <$ duni;
    _A <@ O.o(sd);
    return ((t,sd),s);
  }

  include MLWE_PKE(O) [-kg]

}.

module B1(A : Adversary) : HAdv_T = {

  proc kg(t : vector, sd : seed) : pkey * skey = {
    return ((t,sd),witness);
  }
  
  proc guess(sd : seed, t : vector, uv : vector * R) : bool = {
    var pk, sk, m0, m1, c, b, b';
    (pk,sk) <@ kg(uv.`1,sd);
    (m0, m1) <@ A.choose(pk);
    b <$ {0,1};
    c <@ MLWE_PKE_H.enc(pk, if b then m1 else m0);
    b' <@ A.guess(c);
    return b' = b;
  }
}.

section.

declare module A : Adversary.

lemma hop1_left &m: 
  Pr[CPA(MLWE_PKE_H,A).main() @ &m : res] =
  Pr[H_MLWE(B1(A)).main(false,false) @ &m : res].
proof.
byequiv => //. 
proc; inline *. 
wp; call(:true); auto => /=. 
call (:true); wp.
rnd{2}; wp; do 3! rnd{2}; auto.
qed.

lemma hop1_right &m: 
  Pr[H_MLWE(B1(A)).main(false,true) @ &m : res] = 
  Pr[CPA(MLWE_PKE1(ConcreteH),A).main() @ &m : res].
proof.
byequiv => //.
proc;inline *. 
wp; call(:true); auto => /=.
call(:true); wp => /=.
rnd{1}; wp; do 2! rnd{1}.
rnd; wp; rnd{1}; auto.
qed.

end section.

(* Hop 2 *)

module MLWE_PKE2(O : POracle) = {

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var _A,u, v;
    _A <@ O.o(pk.`2);
    u <$duni;
    v <$duni_R;
    return (c_encode (u,v +& m_encode m));
  }

  include MLWE_PKE1(O) [-enc]

}.

module B2(A : Adversary) : HAdv_T = {

  proc kg(t : vector, sd : seed) : pkey * skey = {
    return ((t,sd),witness);
  }
  
  proc enc(pk : pkey, m : plaintext, uv : vector * R) : ciphertext = {
    return (c_encode (uv.`1, uv.`2 +& m_encode m));
  }
  
  proc guess(sd : seed, t : vector, uv : vector * R) : bool = {
    var pk, sk, m0, m1, c, b, b';
    (pk,sk) <@ kg(t,sd);
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
  Pr[CPA(MLWE_PKE1(ConcreteH),A).main() @ &m : res] =
  Pr[H_MLWE(B2(A)).main(true,false) @ &m : res].
proof.
byequiv => //.
proc; inline *. 
swap {2} 7 -5.
swap {2} [11..12] -8.
swap {2} [14..17] -9.
seq 6 7 : (#pre /\ ={sd,t,pk} /\ pk{2}.`2 = sd{2} /\ pk{2}.`1 = t{2});
  first by wp;rnd; rnd{1}; rnd; auto.
swap {2} [11..13] -9.
by wp; call(_: true); wp; rnd{2}; wp; rnd; rnd{2}; wp; 
   rnd; rnd; wp; rnd; call(_: true); auto.
qed.

lemma hop2_right &m: 
  Pr[H_MLWE(B2(A)).main(true,true) @ &m : res] = 
  Pr[CPA(MLWE_PKE2(ConcreteH),A).main() @ &m : res].
proof.
byequiv => //.
proc; inline *. 
swap {1} 7 -5.
swap {1} [11..12] -8.
swap {1} [14..17] -9.
seq 7 6 : (#pre /\ ={sd,t,pk} /\ pk{2}.`2 = sd{2} /\ pk{2}.`1 = t{2});
   first by wp;rnd;  rnd{2}; rnd; auto. 
swap {1} [11..13] -9.
by wp; call(_: true);wp;rnd;wp;rnd{1};rnd;wp;rnd{1};rnd{1};wp;rnd; 
   call(_: true); auto.
qed.

end section.

(* Final game analysis *)

section.

declare module A : Adversary.
axiom A_guess_ll : islossless A.guess.
axiom A_choose_ll : islossless A.choose.

local module Game2(A : Adversary) = {
  proc main() = {
    var sd, s, t, m0, m1, u, v, b, b';
    sd <$ dseed;
    s <$ dshort;
    t <$ duni;
    (m0, m1) <@ A.choose((t,sd));
    u <$duni;
    v <$duni_R;
    b' <@ A.guess(c_encode (u,v));
    b <$ {0,1};
    return b = b';
  }
}.

local lemma game2_equiv &m : 
  Pr[CPA(MLWE_PKE2(ConcreteH),A).main() @ &m : res] = 
  Pr[Game2(A).main() @ &m : res].
proof.
byequiv => //.
proc; inline *.
swap {2} 8 -3.
call(_: true); wp.
rnd (fun z, z +& m_encode (if b then m1 else m0){2})
    (fun z, z -& m_encode (if b then m1 else m0){2}).
auto; call (_:true).
auto => /> *; split => *; [ ring | split => *; [ring | smt()]].
qed.

local lemma game2_prob &m :
  Pr[Game2(A).main() @ &m : res] = 1%r / 2%r.
proof.
byphoare => //. 
proc.
rnd  (pred1 b')=> //=.
conseq (: _ ==> true).
+ by move=> />; apply DBool.dbool1E.
islossless; [ apply A_guess_ll | apply A_choose_ll].
qed.

lemma main_theorem &m :
  Pr[CPA(MLWE_PKE_H,A).main() @ &m : res] -  1%r / 2%r =
    Pr[H_MLWE(B1(A)).main(false,false) @ &m : res] -
       Pr[H_MLWE(B1(A)).main(false,true) @ &m : res] + 
    Pr[H_MLWE(B2(A)).main(true,false) @ &m : res] -
       Pr[H_MLWE(B2(A)).main(true,true) @ &m : res].
proof.
rewrite (hop1_left A &m).
rewrite (hop1_right A &m).
rewrite (hop2_left A &m).
rewrite (hop2_right A &m).
rewrite (game2_equiv &m).
rewrite (game2_prob &m).
by ring.
qed.

end section.

(******************************************************************)
(*       Game Hopping Security for ROM Hash                       *)
(******************************************************************)

(* Hop 1 *)

module (B1ROM(A : AdversaryRO) : HAdv_RO_T) (O : POracle) = {

  proc kg(t : vector, sd : seed) : pkey * skey = {
    return ((t,sd),witness);
  }
  
  proc guess(sd : seed, t : vector, uv : vector * R) : bool = {
    var pk, sk, m0, m1, c, b, b';
    (pk,sk) <@ kg(uv.`1,sd);
    (m0, m1) <@ A(O).choose(pk);
    b <$ {0,1};
    c <@ MLWE_PKE(O).enc(pk, if b then m1 else m0);
    b' <@ A(O).guess(c);
    return b' = b;
  }
}.

section.

declare module A : AdversaryRO {-LRO,-B1ROM,-MLWE_.B}.

lemma hop1_left_h &m: 
  Pr[CPAROM(MLWE_PKE,A,LRO).main() @ &m : res] =
  Pr[MLWE(B(B1ROM(A),LRO)).main(false) @ &m : res].
proof.
rewrite -(H_MLWE_RO_equiv false &m (B1ROM(A))).
byequiv => //.
proc; inline {1} 2; inline {2} 13.
seq 1 1 : (#pre /\ ={glob LRO}); 1 : by conseq => />; sim.
wp; call(: ={glob LRO}); 1: by sim.
inline *;wp;rnd;wp;rnd;rnd;rnd;wp;rnd. 
call(_: ={glob LRO}); 1: by sim.
by wp;rnd{2};wp;rnd{2};rnd{2};rnd{2};auto => />.
qed.

lemma hop1_right_h &m: 
  Pr[CPAROM(MLWE_PKE1,A,LRO).main() @ &m : res] =
  Pr[MLWE(B(B1ROM(A),LRO)).main(true) @ &m : res].
proof.
rewrite -(H_MLWE_RO_equiv true &m (B1ROM(A))).
byequiv => //.
proc; inline {1} 2; inline {2} 13.
inline {1} 2.
swap {2} 8 -4.
swap {2} [6..7] -1.
seq 5 6 : (#pre /\ ={glob LRO,sd,s,_A} /\ t{1} = u1{2});
   1: by inline *; conseq => />; auto => />.
wp; call(: ={glob LRO}); 1: by sim.
inline *;wp;rnd;wp;rnd;rnd;rnd;wp;rnd. 
call(_: ={glob LRO}); 1: by sim.
by wp;rnd{2};wp;rnd{2};rnd{2};wp;rnd{2};auto => />. 
qed.

end section.

module (B2ROM(A : AdversaryRO) : HAdv_RO_T) (O : POracle) = {

  proc kg(t : vector, sd : seed) : pkey * skey = {
    return ((t,sd),witness);
  }
  
  proc enc(pk : pkey, m : plaintext, uv : vector * R) : ciphertext = {
    return (c_encode (uv.`1, uv.`2 +& m_encode m));
  }
  
  proc guess(sd : seed, t : vector, uv : vector * R) : bool = {
    var pk, sk, m0, m1, c, b, b';
    (pk,sk) <@ kg(t,sd);
    (m0, m1) <@ A(O).choose(pk);
    b <$ {0,1};
    c <@ enc(pk, if b then m1 else m0,uv);
    b' <@ A(O).guess(c);
    return b' = b;
  }

}.

section.

declare module A : AdversaryRO {-LRO,-B2ROM,-MLWE_.Bt}.


lemma hop2_left_h &m: 
  Pr[CPAROM(MLWE_PKE1,A,LRO).main() @ &m : res] =
  Pr[MLWE(Bt(B2ROM(A),LRO)).main(false) @ &m : res].
proof.
rewrite -(H_MLWE_RO_equiv_t false &m (B2ROM(A))).
byequiv => //.
proc; inline {1} 2; inline {1} 2; inline {2} 13; inline {2} 19; inline {1} 9.
swap {2} 9 -6.
swap {2} [6..7] -2.
swap {2} [13..14] -7.
swap {2} [16..17] -8.
swap {1} 9 -2.
swap {1} 11 -3.
swap {1} 15 -5.
seq 8 8 : (#pre /\ ={glob LRO,sd,t,pk} /\ pk{2}.`2 = sd{2} /\ pk{2}.`1 = t{2} /\ LRO.m{1}.[sd0{1}] = Some (m_transpose _A{2}) /\ sd{2} = sd0{2} /\ sd{1} = sd0{1} /\ t0{1} = t{1} /\ t0{2} = t{2});
 first by inline *; wp;rnd;wp;rnd;rnd{1};rnd;auto => />;  smt(@SmtMap trmxK).
wp; call(: ={glob LRO}); first by sim.
swap {2} [10..12] -8.
inline *. 
wp; rnd{2}; wp; rnd; rnd{2}; wp; rnd; wp; rnd; wp; rnd; wp; rnd{1}; wp.
exists *sd{1}, _A{2}.
elim* => sd _A.
call(: ={glob LRO} /\ LRO.m{1}.[sd] = Some (m_transpose _A)); 1: by proc; auto => />; smt(@SmtMap).
auto => />; smt(trmxK). 
qed.

lemma hop2_right_h &m: 
  Pr[CPAROM(MLWE_PKE2,A,LRO).main() @ &m : res] =
  Pr[MLWE(Bt(B2ROM(A),LRO)).main(true) @ &m : res].
proof.
rewrite -(H_MLWE_RO_equiv_t true &m (B2ROM(A))).
byequiv => //.
proc; inline {1} 2; inline {1} 2; inline {2} 13; inline {2} 19; inline {1} 9.
swap {2} 9 -6.
swap {2} [6..7] -2.
swap {2} [13..14] -7.
swap {2} [16..17] -8.
swap {1} 9 -2.
swap {1} 11 -2.
seq 7 8 : (#pre /\ ={glob LRO,sd,t,pk} /\ pk{2}.`2 = sd{2} /\ pk{2}.`1 = t{2} /\ LRO.m{1}.[sd{1}] = Some (m_transpose _A{2}) /\ sd{2} = sd0{2} /\ t0{2} = t{2} /\ pk0.`2{1} = sd{1});
 first by inline *; wp;rnd;wp;rnd;rnd{1};rnd;auto => />;  smt(@SmtMap trmxK).
wp; call(: ={glob LRO}); first by sim.
swap {2} [10..12] -8.
inline *. 
wp; rnd; wp; rnd{2}; wp; rnd; wp; rnd{2}; rnd{2}; wp; rnd; wp; rnd{1}; wp.
exists *sd{1}, _A{2}.
elim* => sd _A.
call(: ={glob LRO} /\ LRO.m{1}.[sd] = Some (m_transpose _A)); 1: by proc; auto => />; smt(@SmtMap).
by auto => /> /#.
qed.

end section.

(* Final game analysis *)

section.

declare module A : AdversaryRO {-LRO, -B, -Bt}.
axiom A_guess_ll (O <: POracle) : islossless O.o => islossless A(O).guess.
axiom A_choose_ll (O <: POracle) : islossless O.o => islossless A(O).choose.

local module Game2RO(A : AdversaryRO) = {
  proc main() = {
    var _A,sd, s, t, m0, m1, u, v, b, b';
    LRO.init();
    sd <$ dseed;
    _A <@ LRO.o(sd);
    s <$ dshort;
    t <$ duni;
    (m0, m1) <@ A(LRO).choose((t,sd));
    u <$duni;
    v <$duni_R;
    b' <@ A(LRO).guess(c_encode (u,v));
    b <$ {0,1};
    return b = b';
  }
}.

local lemma game2_equiv_h &m : 
  Pr[CPAROM(MLWE_PKE2,A,LRO).main() @ &m : res] = 
  Pr[Game2RO(A).main() @ &m : res].
proof.
byequiv => //.
proc; inline *.
swap {2} 13 -3.
wp; call(_: ={glob LRO}); 1: by sim.  
wp.
rnd (fun z, z +& m_encode (if b then m1 else m0){2})
    (fun z, z -& m_encode (if b then m1 else m0){2}).
seq 9 8 : (#pre /\ ={glob LRO,sd,s,t,_A} /\
     pk.`2{1} = sd{2} /\ pk.`1{1} = t{2} /\
     LRO.m{1}.[sd{1}]=Some _A{1});
 first by swap{1} [3..4] 4; auto => />; smt(@SmtMap). 
rnd;wp;rnd{1};wp;rnd.
exists *sd{1}, _A{1}.
elim* => sd _A.
call(: ={glob LRO} /\ LRO.m{1}.[sd] = Some (_A)); 1: by proc; auto => />; smt(@SmtMap).
auto => /> *; split; 1: smt(@SmtMap).
move => *; split; 1: smt().
move => *; split.
+ by move => *; ring. 
move => *; split.
+ by move => *; ring. 
+ by smt(). 
qed.

local lemma game2_prob_h &m :
  Pr[Game2RO(A).main() @ &m : res] = 1%r / 2%r.
proof.
byphoare => //. 
proc.
rnd  (pred1 b')=> //=.
conseq (: _ ==> true).
+ by move=> />; apply DBool.dbool1E.
islossless.
apply (A_guess_ll LRO). by islossless. 
apply (A_choose_ll LRO). by islossless. 
qed.

lemma main_theorem_h &m :
  Pr[CPAROM(MLWE_PKE,A,LRO).main() @ &m : res] -  1%r / 2%r =
    Pr[MLWE(B(B1ROM(A),LRO)).main(false) @ &m : res] -
       Pr[MLWE(B(B1ROM(A),LRO)).main(true) @ &m : res] + 
    Pr[MLWE(Bt(B2ROM(A),LRO)).main(false) @ &m : res] -
       Pr[MLWE(Bt(B2ROM(A),LRO)).main(true) @ &m : res].
proof.
rewrite (hop1_left_h A &m).
rewrite -(hop1_right_h A &m).
rewrite (hop2_left_h A &m).
rewrite -(hop2_right_h A &m).
rewrite (game2_equiv_h &m).
rewrite (game2_prob_h &m).
by ring.
qed.

end section.

(******************************************************************)
(*                        Correctness                             *)
(* We consider adversarial correctness, where the attacker can    *)
(* choose the message where correctness is checked after seeing   *)
(* the public-key. This setting seems to be the one in which      *)
(* failure probability is considered in the FO construction.      *)
(* We need to model H as a random oracle as we will assume A is   *)
(* uniform random. Strictly speaking we should probably model it  *)
(* as a QROM (to discuss)                                         *)
(******************************************************************)


(* We want to prove a concrete bound on the probability of failure
   for Kyber. We will do so generically by first showing at this
   level that it all comes down to the noise distribution. *)

(* We express rounding errors as additive noise *)

op noise_exp _A s e r e1 e2 m = 
    let t = _A *^ s + e in
    let u = m_transpose _A *^ r + e1 in
    let v = (t `<*>` r) +& e2 +& (m_encode m) in
    let (u',v') = c_decode (c_encode (u,v)) in
        v' -& (s `<*>` u') -& (m_encode m).

(* We can derive the noise expression by introducing
   operators that compute the rounding error *)

op rnd_err_v : R -> R.
op rnd_err_u : vector -> vector.

axiom encode_noise u v :
   c_decode (c_encode (u,v)) = 
      (u + rnd_err_u u, v +& rnd_err_v v).

lemma matrix_props1 _A s e r :
  (_A *^ s + e) `<*>` r = 
  (s ^* m_transpose _A `<*>` r) +& (e `<*>` r).
proof. by rewrite dotpDl -mulmxTv trmxK. qed.

lemma matrix_props2 s _A r e1 cu :
  s `<*>` (m_transpose _A *^ r + e1 + cu) = 
  (s ^* m_transpose _A `<*>` r) +& 
    (s `<*>` e1) +& (s `<*>` cu).
proof. by rewrite !dotpDr dotpC dotp_mulmxv dotpC. qed.

lemma noise_exp_val _A s e r e1 e2 m :
  noise_exp _A s e r e1 e2 m = 
  let t = _A *^ s + e in
  let u = m_transpose _A *^ r + e1 in
  let v = (t `<*>` r) +& e2 +& (m_encode m) in
  let cu = rnd_err_u u in
  let cv = rnd_err_v v in
  ((e `<*>` r) -& (s `<*>` e1) -& (s `<*>` cu) +& e2) +& cv.
proof.
  rewrite /noise_exp /= encode_noise /= matrix_props1 matrix_props2; ring. 
qed.

(* The above noise expression is computed over the abstract
   rings that define the scheme. Noise bounds are checked and
   computed over the integers. *)

op max_noise : int.
op under_noise_bound : R -> int -> bool.

axiom good_decode m n :
  under_noise_bound n max_noise =>
  m_decode (m_encode m +& n) = m.

(* We now rewrite the correctness game in terms of noise *)

module CorrectnessAdvNoise(A : CAdversaryRO, O : Oracle) = {
  proc main() = {
    var sd,s,e,_A,r,e1,e2,m,n;
    O.init();
    sd <$ dseed;
    _A <@ O.o(sd);
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    m <@ A(O).find((_A *^ s + e,sd),s);
    n <- noise_exp _A s e r e1 e2 m;
    return (!under_noise_bound n max_noise);
  }
}.

section.

declare module A : CAdversaryRO {-LRO}.
axiom A_ll (O <: POracle{-A}): islossless O.o => islossless A(O).find.

lemma correctness &m :
  Pr[ CorrectnessAdvROM(MLWE_PKE,A,LRO).main() @ &m : res]  >=
  1%r - Pr[ CorrectnessAdvNoise(A,LRO).main() @ &m : res].
proof.
rewrite (_: 1%r - Pr[ CorrectnessAdvNoise(A,LRO).main() @ &m : res] =
   Pr[ CorrectnessAdvNoise(A,LRO).main() @ &m : !res]).
rewrite Pr[mu_not]; congr => //. 
+ byphoare => //.
  by islossless; apply (A_ll LRO); islossless.
byequiv => //.
proc.
inline CorrectnessAdv(MLWE_PKE(LRO), A(LRO)).main MLWE_PKE(LRO).dec MLWE_PKE(LRO).enc MLWE_PKE(LRO).kg.
swap {2} 5 -2.
swap {2} 12 -8.
swap {2} [13..14] -6.
seq 9 14 : ( 
           ={LRO.m,e2,e1,r,s,e,sd} /\
           sd0{2} = sd{2} /\
           m0{2} = m{1} /\ 
           m0{2} = m{2} /\ 
           pk0.`2{2} = sd{2} /\
           pk0.`1{2} = t{2} /\
           sk{2} = s{2} /\
           t{2} = _A{2} *^ s{2} + e{2} /\
           t0{2} = t{2} /\
           pk0{2}.`2 \in LRO.m{2} /\
           _A{2} = _A{1} /\
           oget LRO.m{2}.[pk0.`2{2}] = _A{2}); last first.
+ inline *. auto => /> &2 -> ????.
  rewrite  encode_noise.
  rewrite (_: 
     (((oget LRO.m{2}.[pk0{2}.`2] *^ s{2} + e{2}) `<*>` r{2}) +&
     e2{2} +& m_encode m{2} +&
     rnd_err_v
       (((oget LRO.m{2}.[pk0{2}.`2] *^ s{2} + e{2}) `<*>` r{2}) +&
        e2{2} +& m_encode m{2}) -&
     (s{2} `<*>`
      (m_transpose (oget LRO.m{2}.[pk0{2}.`2]) *^ r{2} + e1{2} +
       rnd_err_u (m_transpose (oget LRO.m{2}.[pk0{2}.`2]) *^ r{2} + e1{2})))) = 
  m_encode m{2} +& noise_exp (oget LRO.m{2}.[pk0{2}.`2]) s{2} e{2} r{2} e1{2}
                     e2{2} m{2}); last by apply good_decode.
  by rewrite noise_exp_val /= matrix_props1 matrix_props2; ring.

auto => /=. 
seq 8 10 : ( #pre /\
           ={LRO.m,r,s,e,e1,e2,sd,_A} /\
           pk.`2{2} = sd{2} /\
           pk.`1{2} = t{2} /\
           sk{2} = s{2} /\
           t{2} = _A{2} *^ s{2} + e{2} /\
           pk{2}.`2 \in LRO.m{2} /\
           oget LRO.m{2}.[sd{2}] = _A{2}); last first.
+ exlim _A{2}, pk{2}.`2 => _A sd.
  call(_: ={glob LRO} /\ oget LRO.m{2}.[sd] = _A /\ sd \in LRO.m{2} ). 
  + by proc; auto => />; smt(get_setE).
  by auto => /> /#.
by inline *; auto;  smt(get_setE).
qed.

end section.

(* Now we shift things to make the upper bound computable as 
   based on a max over all messages. *)
op cv_bound : int.
axiom cv_bound_valid _A s e r e2 m :
  s \in dshort =>
  e \in dshort =>
  _A \in duni_matrix =>
  r \in dshort =>
  e2 \in dshort_R =>
  let t = _A *^ s + e in
  let v = (t `<*>` r) +& e2 +& (m_encode m) in
  under_noise_bound (rnd_err_v v) cv_bound.

axiom noise_commutes n n' (b : int) : 
  under_noise_bound n' b =>
  under_noise_bound n (max_noise - b) =>
  under_noise_bound (n +& n') max_noise.

op noise_exp_part_simpl cu s e r e1 e2 = 
  ((e `<*>` r) -& (s `<*>` e1) -& (s `<*>` cu) +& e2 ).

op noise_exp_part _A s e r e1 e2 = 
  let u = m_transpose _A *^ r + e1 in
  let cu = rnd_err_u u in 
  noise_exp_part_simpl cu s e r e1 e2.

module CorrectnessNoiseApprox = {
  proc main() = {
    var s,e,_A,r,e1,e2,n,u,cu;
    _A <$ duni_matrix;
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    u <- m_transpose _A *^ r + e1;
    cu <- rnd_err_u u;
    n <- noise_exp_part_simpl cu s e r e1 e2;
    return (!under_noise_bound n (max_noise - cv_bound));
  }
}.

section.

declare module A : CAdversaryRO {-LRO}.
axiom All (O <: POracle{-A}): islossless O.o => islossless A(O).find.

lemma correctness_slack &m :
  Pr[ CorrectnessAdvNoise(A,LRO).main() @ &m : res]<=
  Pr[ CorrectnessNoiseApprox.main() @ &m : res].
proof.
byequiv => //.
proc.
seq 8 6 : (#pre /\ ={s,e,_A,r,e1,e2} /\
            s{2} \in dshort /\
            e{2} \in dshort /\
           _A{2} \in duni_matrix /\
           r{2} \in dshort /\
           e2{2} \in dshort_R ).
+ inline *; auto => />; smt(get_setE mem_empty).
wp;call {1} (_: true ==> true). 
+ by apply (All LRO); smt(LRO_o_ll duni_matrix_ll).
skip;auto => />.
move => &1 &2 ssup esup _Asup rsup e2sup; rewrite noise_exp_val /=.
smt (noise_commutes cv_bound_valid).
qed.

lemma correctness_approx &m :
  Pr[ CorrectnessAdvROM(MLWE_PKE,A,LRO).main() @ &m : res]  >=
  1%r - Pr[ CorrectnessNoiseApprox.main() @ &m : res].
proof. move : (correctness A  All &m) (correctness_slack &m)  => /#. qed.

(* Finally we just need to compute a concrete probability *)
(* Which we will bound in simplified form *)


(* We will jump to this game where instead of the real
   distribution of u and r, we use an idealized one where
   they are independent. *)
module CorrectnessBound = {
  proc main() = {
    var s,e,u,r,e1,e2,n,cu;
    s <$ dshort;
    e <$ dshort;
    u <$ duni;
    r <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    cu <- rnd_err_u u;
    n <- noise_exp_part_simpl cu s e r e1 e2;
    return (!under_noise_bound n (max_noise - cv_bound));
  }
}.

(* This jump is assumed to introduce no slack in the
   Kyber proposal. 
   We need to figure out how to bound it. *)
(* FIXME *)
op epsilon_hack : real.

axiom correctness_hack &m :
  `| Pr[CorrectnessNoiseApprox.main() @ &m : res] - 
     Pr[CorrectnessBound.main() @ &m : res] | <= epsilon_hack 
.

(* The following failure probability can be bounded as
in the Python script for Kyber *)   
op fail_prob : real.

axiom fail_prob &m : 
  Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob.

lemma correctness_bound &m :
  Pr[ CorrectnessAdvROM(MLWE_PKE,A,LRO).main() @ &m : res]  >=
  1%r - fail_prob - epsilon_hack.
proof.
by move: (fail_prob &m) (correctness_hack &m) (correctness_approx &m) => /#.
qed.

end section.
