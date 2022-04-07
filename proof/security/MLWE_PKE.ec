require import AllCore Distr List SmtMap Dexcepted.
require (****) RndExcept StdOrder PKE_Ext MLWE.

clone import MLWE as MLWE_.

import StdOrder.IntOrder Matrix_ Big.BAdd.

type plaintext.
type ciphertext.

type raw_ciphertext = vector * R.

op m_encode : plaintext -> R. 
op m_decode : R -> plaintext.

op c_encode : raw_ciphertext -> ciphertext.
op c_decode : ciphertext -> raw_ciphertext.

type pkey.
type skey.

type raw_pkey  = vector * seed.
type raw_skey  = vector.

op pk_encode : raw_pkey -> pkey.
op sk_encode : raw_skey -> skey.
op pk_decode : pkey -> raw_pkey.
op sk_decode : skey -> raw_skey.

axiom pk_encodeK : cancel pk_encode pk_decode.
axiom pk_decodeK : cancel pk_decode pk_encode.
axiom sk_encodeK : cancel sk_encode sk_decode.
axiom sk_decodeK : cancel sk_decode sk_encode.

theory MLWE_PKE_GENERAL.

(* In this theory we will refine MLWE PKE with a specific kind of
   sampler, so it needs its  own copy of MLWE_SMP. *)
clone import MLWE_.MLWE_SMP.

(******************************************************************)
(*    The Security Games                                          *)

clone import PKE_Ext as PKE_ with 
  theory RO <- RO_SMP,
  type pkey <- pkey,
  type skey <- skey,
  type plaintext <- plaintext,
  type ciphertext <- ciphertext.

import RO_SMP Lazy.

(******************************************************************)
(*                    The Encryption Scheme                       *)

(* Encryption schemes in the ROM always take POracle.
   This PKE does not use the POracle directly but may
   do so via H *)

module MLWE_PKE(H: PSampler, O : POracle) : Scheme = {
  proc kg() : pkey * skey = {
    var sd,s,e,_A,t;
    sd <$ dseed;
    s  <$ dshort;
    e  <$ dshort;
    _A <@ H.sample(sd);
    t  <- _A *^ s + e;
    return (pk_encode (t,sd),sk_encode s);
  }
  
  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var sd,t,r,e1,e2,_A,u,v;
    (t,sd) <- pk_decode pk;
    r  <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    _A <@ H.sample(sd);
    u  <- m_transpose _A *^ r + e1;
    v  <- (t `<*>` r) &+ e2 &+ (m_encode m);
    return (c_encode (u,v));
  }
  
  proc dec(sk : skey, c : ciphertext) : plaintext option = {
    var u,v;
    (u,v) <- c_decode c;
    return Some (m_decode (v &- (sk_decode sk `<*>` u)));
  }
}.

(******************************************************************)
(*       Game Hopping Security for Concrete Hash                  *)
(******************************************************************)

module HS : PSampler = { proc sample(sd : seed) = { return H sd; } }.
module NULL : POracle = { proc o(x : in_t) : out_t = { return witness; } }.
module MLWE_PKE_H = MLWE_PKE(HS,NULL).

(* Hop 1 *)

module MLWE_PKE1(S : PSampler, O : POracle) = {
  proc kg() : pkey * skey = {
    var _A,sd,s,t;
    sd <$ dseed;
    s  <$ dshort;
    t  <$ duni;
    _A <@ S.sample(sd);
    return (pk_encode (t,sd),sk_encode s);
  }

  include MLWE_PKE(S,O) [-kg]

}.

module B1(A : Adversary) : HAdv_T = {

  proc kg(t : vector, sd : seed) : pkey * skey = {
    return (pk_encode (t,sd),witness);
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

declare module A <: Adversary.

lemma hop1_left &m: 
  Pr[CPA(MLWE_PKE_H,A).main() @ &m : res] =
  Pr[MLWE_H(B1(A)).main(false,false) @ &m : res].
proof.
byequiv => //. 
proc; inline *. 
wp; call(:true); auto => /=. 
call (:true); wp.
by rnd{2}; wp; do 3! rnd{2}; auto; smt(duni_ll).
qed.

lemma hop1_right &m: 
  Pr[MLWE_H(B1(A)).main(false,true) @ &m : res] = 
  Pr[CPA(MLWE_PKE1(HS,NULL),A).main() @ &m : res].
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

module MLWE_PKE2(S : PSampler, O : POracle) = {

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var _A,u, v;
    _A <@ S.sample((pk_decode pk).`2);
    u <$duni;
    v <$duni_R;
    return (c_encode (u,v &+ m_encode m));
  }

  include MLWE_PKE1(S,O) [-enc]

}.

module B2(A : Adversary) : HAdv_T = {

  proc kg(t : vector, sd : seed) : pkey * skey = {
    return (pk_encode (t,sd),witness);
  }
  
  proc enc(pk : pkey, m : plaintext, uv : vector * R) : ciphertext = {
    return (c_encode (uv.`1, uv.`2 &+ m_encode m));
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

declare module A <: Adversary.

lemma hop2_left &m: 
  Pr[CPA(MLWE_PKE1(HS,NULL),A).main() @ &m : res] =
  Pr[MLWE_H(B2(A)).main(true,false) @ &m : res].
proof.
byequiv => //.
proc; inline *. 
swap {2} 7 -5.
swap {2} [11..12] -8.
swap {2} [14..17] -9.
seq 6 7 : (#pre /\ ={sd,t,pk} /\ (pk_decode pk{2}).`2 = sd{2} /\ (pk_decode pk{2}).`1 = t{2});
  first by wp;rnd; rnd{1}; rnd; auto; smt(dshort_ll pk_encodeK).
swap {2} [11..13] -9.
by wp; call(_: true); wp; rnd{2}; wp; rnd; rnd{2}; wp; 
   rnd; rnd; wp; rnd; call(_: true); auto; smt(duni_ll dshort_ll).
qed.

lemma hop2_right &m: 
  Pr[MLWE_H(B2(A)).main(true,true) @ &m : res] = 
  Pr[CPA(MLWE_PKE2(HS,NULL),A).main() @ &m : res].
proof.
byequiv => //.
proc; inline *. 
swap {1} 7 -5.
swap {1} [11..12] -8.
swap {1} [14..17] -9.
seq 7 6 : (#pre /\ ={sd,t,pk} /\ (pk_decode pk{2}).`2 = sd{2} /\ (pk_decode pk{2}).`1 = t{2});
   first by wp;rnd;  rnd{2}; rnd; auto; smt(dshort_ll pk_encodeK). 
swap {1} [11..13] -9.
by wp; call(_: true);wp;rnd;wp;rnd{1};rnd;wp;rnd{1};rnd{1};wp;rnd; 
   call(_: true); auto;smt(duni_ll dshort_ll).
qed.

end section.

(* Final game analysis *)

section.

declare module A <: Adversary.

local module Game2(A : Adversary) = {
  proc main() = {
    var sd, s, t, m0, m1, u, v, b, b';
    sd <$ dseed;
    s <$ dshort;
    t <$ duni;
    (m0, m1) <@ A.choose(pk_encode (t,sd));
    u <$duni;
    v <$duni_R;
    b' <@ A.guess(c_encode (u,v));
    b <$ {0,1};
    return b = b';
  }
}.

local lemma game2_equiv &m : 
  Pr[CPA(MLWE_PKE2(HS,NULL),A).main() @ &m : res] = 
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
by islossless; smt(duni_ll dshort_ll). 
qed.

lemma main_theorem &m :
  islossless A.guess => islossless A.choose =>
  Pr[CPA(MLWE_PKE_H,A).main() @ &m : res] -  1%r / 2%r =
    Pr[MLWE_H(B1(A)).main(false,false) @ &m : res] -
       Pr[MLWE_H(B1(A)).main(false,true) @ &m : res] + 
    Pr[MLWE_H(B2(A)).main(true,false) @ &m : res] -
       Pr[MLWE_H(B2(A)).main(true,true) @ &m : res].
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
(*       Game Hopping Security for Sampler                        *)
(******************************************************************)


module MLWE_PKE_RO(S : PSampler) = MLWE_PKE(S).

(* Hop 1 *)

module (B1ROM(A : AdversaryRO, S : Sampler) : SAdv_T) (O : POracle) = {
  var sd : seed
  var t  : vector
  
  proc interact(_sd : seed, _t : vector) : unit = { sd <- _sd; t <- _t; }

  proc guess(uv : vector * R) : bool = {
    var pk,  m0, m1, c, b, b';
    pk <- (uv.`1,sd);
    (m0, m1) <@ A(O).choose(pk_encode pk);
    b <$ {0,1};
    c <@ MLWE_PKE(S(O),O).enc(pk_encode pk, if b then m1 else m0);
    b' <@ A(O).guess(c);
    return b' = b;
  }
}.

section.

declare module O <: Oracle {-B1ROM}.
declare module S <: Sampler {-O,-B1ROM}.
declare module A <: AdversaryRO {-O,-B1ROM,-S}.

lemma hop1_left_s &m: 
  Pr[CPAROM(MLWE_PKE(S(O)),A,O).main() @ &m : res] =
  Pr[MLWE_SMP(B1ROM(A,S),S,O).main(false,false) @ &m : res].
proof.
byequiv => //.
proc.
seq 1 1 : (!b{2} /\ !tr{2} /\ ={glob A, glob S,glob O}); 1: by  inline *; conseq => />; sim. 
inline *.
wp; call(: ={glob O}); 1: by sim.
wp; call(: ={glob O}); 1: by sim.
rnd;rnd;rnd;wp;rnd;wp. 
call(_: ={glob O}); 1: by sim.
swap {2} [8..9] -6.
wp;rnd{2};wp;rnd{2};rnd{2};wp.
wp; call(: ={glob O}); 1: by sim.
by wp;rnd{2};rnd;rnd;rnd;auto => />;smt(dshort_ll duni_ll).
qed.

lemma hop1_right_s &m: 
  Pr[CPAROM(MLWE_PKE1(S(O)),A,O).main() @ &m : res] =
  Pr[MLWE_SMP(B1ROM(A,S),S,O).main(false,true) @ &m : res].
proof.
byequiv => //.
proc.
seq 1 1 : (b{2} /\ !tr{2} /\ ={glob A, glob S,glob O}); 1 : by inline *;conseq => />;sim.
inline *.
wp; call(: ={glob O}); 1: by sim.
wp; call(: ={glob O}); 1: by sim.
rnd;rnd;rnd;wp;rnd;wp. 
call(_: ={glob O}); 1: by sim.
swap {2} 8 -6.
swap {2} 11 -8.
wp;rnd{2};wp;rnd{2};wp;rnd{2}.
wp; call(: ={glob O}); 1: by sim.
by wp;rnd{2};rnd;rnd;rnd;auto => />;smt(dshort_ll duni_ll).
qed.

end section.

module (B2ROM(A : AdversaryRO, S : Sampler) : SAdv_T) (O : POracle) = {
  var pk : pkey
  var m0, m1 : plaintext

  proc interact(sd : seed, t: vector) : unit = {
    var _A;
    pk <- pk_encode (t,sd);
    _A <@ S(O).sample(sd); (* we need to match samplings *)
    (m0, m1) <@ A(O).choose(pk);
  }
  
  proc enc(pk : pkey, m : plaintext, uv : vector * R) : ciphertext = {
    return (c_encode (uv.`1, uv.`2 &+ m_encode m));
  }
  
  proc guess(uv : vector * R) : bool = {
    var c, b, b';
    b <$ {0,1};
    c <@ enc(pk, if b then m1 else m0,uv);
    b' <@ A(O).guess(c);
    return b' = b;
  }

}.

section.

declare module O <: Oracle {-B2ROM}.
declare module S <: Sampler {-O,-B2ROM}.
declare module A <: AdversaryRO {-O,-B2ROM, -S}.

lemma hop2_left_s &m: 
  Pr[CPAROM(MLWE_PKE1(S(O)),A,O).main() @ &m : res] =
  Pr[MLWE_SMP(B2ROM(A,S),S,O).main(true,false) @ &m : res].
proof.
byequiv => //.
proc.
seq 1 1 : (!b{2} /\ tr{2} /\ ={glob A, glob S,glob O}); 1: by inline *;conseq/>;sim.
inline *.
wp; call(: ={glob O}); 1: by sim.
swap {1} 2 -1.
swap {1} 14 -3.
swap {2} 17 -9.
wp;rnd{2};wp;rnd; wp;rnd{2};wp;rnd;rnd.
wp; call(: ={glob O}); 1: by sim.
wp; rnd; call(: ={glob O}); 1: by sim.
wp; call(: ={glob O}); 1: by sim.
by wp; rnd; wp; rnd; rnd{1}; auto => />; smt(dshort_ll duni_ll pk_encodeK).
qed.

lemma hop2_right_s &m: 
  Pr[CPAROM(MLWE_PKE2(S(O)),A,O).main() @ &m : res] =
  Pr[MLWE_SMP(B2ROM(A,S),S,O).main(true,true) @ &m : res].
proof.
byequiv => //.
proc.
seq 1 1 : (b{2} /\ tr{2} /\ ={glob A, glob S,glob O}); 1: by inline *;conseq />;sim.
inline *.
wp; call(: ={glob O}); 1: by sim.
swap {1} 2 -1.
swap {1} 8 -2.
swap {1} 10 -2.
swap {2} 17 -8.
wp;rnd;wp;rnd{2};wp;rnd;wp;rnd{2};rnd{2};rnd.
wp; call(: ={glob O}); 1: by sim.
wp; call(: ={glob O}); 1: by sim.
wp; call(: ={glob O}); 1: by sim.
by wp; rnd; wp; rnd; rnd{1}; auto => />; smt(dshort_ll duni_ll pk_encodeK).
qed.

end section.

(* Final game analysis *)

section.

declare module O <: Oracle {-B1ROM, -B2ROM}.
declare module S <: Sampler {-O, -B1ROM, -B2ROM}.
declare module A <: AdversaryRO {-O, -B1ROM, -B2ROM, -S}.

local module Game2RO(A : AdversaryRO) = {
  proc main() = {
    var sd, _A, s, t, m0, m1, u, v, b, b';
    O.init();
    sd <$ dseed;
    _A <@ S(O).sample(sd);
    s <$ dshort;
    t <$ duni;
    (m0, m1) <@ A(O).choose(pk_encode (t,sd));
    _A <@ S(O).sample(sd);
    u <$duni;
    v <$duni_R;
    b' <@ A(O).guess(c_encode (u,v));
    b <$ {0,1};
    return b = b';
  }
}.


local lemma game2_equiv_s &m : 
  Pr[CPAROM(MLWE_PKE2(S(O)),A,O).main() @ &m : res] = 
  Pr[Game2RO(A).main() @ &m : res].
proof.
byequiv => //.
proc; inline *.
swap {2} 11 -4.
wp; call(_: ={glob O}); 1: by sim.  
wp;rnd (fun z, z &+ m_encode (if b then m1 else m0){2})
       (fun z, z &- m_encode (if b then m1 else m0){2}).
rnd; call(_: ={glob O}); 1: by sim.  
wp;rnd; call(_: ={glob O}); 1: by sim.  
swap {2} [4..5] -1.
wp; call(_: ={glob O}); 1: by sim. 
rnd;rnd;rnd. 
call(_: true); auto => />.
+ move => *; split; 1:  by rewrite pk_encodeK. 
+ move => *; split; 1: by move => *; ring.
+ move => *; split; 1: by move => *; ring.
by smt().
qed.

local lemma game2_prob_s &m :
  islossless O.init =>
  islossless O.o =>
  (forall (x : in_t), is_lossless (dout x)) => 
  (forall (O <: Oracle), islossless O.o => islossless S(O).sample) =>   
  (forall (O <: Oracle), islossless O.o => islossless A(O).guess) =>
  (forall (O <: Oracle), islossless O.o => islossless A(O).choose) =>
  Pr[Game2RO(A).main() @ &m : res] = 1%r / 2%r.
proof.
move => O_init_ll O__o_ll dout_ll S_ll A_guess_ll A_choose_ll.
move : (S_ll O).
move : (A_guess_ll O).
move : (A_choose_ll O).
move => _A_choose_ll _A_guess_ll _S_ll.
byphoare => //;proc.
rnd  (pred1 b')=> //=; conseq (: _ ==> true).
+ by move=> />; apply DBool.dbool1E.
islossless; 4,5,7:by smt(duni_ll dshort_ll).
+ by apply _A_guess_ll; smt(). 
+ by apply _S_ll; smt().
+ by apply _A_choose_ll; smt().
+ by apply _S_ll; smt().
qed.

lemma main_theorem_s &m :
  islossless O.init =>
  islossless O.o =>
  (forall (x : in_t), is_lossless (dout x)) => 
  (forall (O <: Oracle), islossless O.o => islossless S(O).sample) =>   
  (forall (O <: Oracle), islossless O.o => islossless A(O).guess) =>
  (forall (O <: Oracle), islossless O.o => islossless A(O).choose) =>
  Pr[CPAROM(MLWE_PKE(S(O)),A,O).main() @ &m : res] -  1%r / 2%r =
    Pr[MLWE_SMP(B1ROM(A,S),S,O).main(false,false) @ &m : res] -
       Pr[MLWE_SMP(B1ROM(A,S),S,O).main(false,true) @ &m : res] + 
    Pr[MLWE_SMP(B2ROM(A,S),S,O).main(true,false) @ &m : res] -
       Pr[MLWE_SMP(B2ROM(A,S),S,O).main(true,true) @ &m : res].
proof.
move => O_init_ll O_o_ll dout_ll S_ll A_guess_ll A_choose_ll.
rewrite (hop1_left_s O S A &m).
rewrite -(hop1_right_s O S A &m).
rewrite (hop2_left_s O S A &m).
rewrite -(hop2_right_s O S A &m).
rewrite (game2_equiv_s &m).
rewrite (game2_prob_s &m _ _) //.
by ring.
qed.

end section.

end MLWE_PKE_GENERAL.

(* To prove correctness bounds and relate security to MLWE we
   first work with a trivial sampler. *)

theory MLWE_PKE_RO.

import MLWE_ROM.
clone import MLWE_PKE_GENERAL as PKEG with
    theory MLWE_SMP.RO_SMP <- RO_H.

import RO_H.
import Lazy.
import PKE_.

theory Security.

import MLWE_SMP.
(* HERE WE GET SECURITY THEOREM DOWN TO LWE USING THE CONCRETE LRO *)

section. 

declare module A <: AdversaryRO {-LRO, -B1ROM, -B2ROM, -MLWE_vs_MLWE_ROM.B, -MLWE_vs_MLWE_ROM.Bt}.

import MLWE_vs_MLWE_ROM.
import SMP_vs_ROM.

lemma main_theorem_ro &m :
  (forall (x : in_t), is_lossless (dout x)) => 
  (forall (O <: Oracle), islossless O.o => islossless A(O).guess) =>
  (forall (O <: Oracle), islossless O.o => islossless A(O).choose) =>
  Pr[CPAROM(MLWE_PKE(S(LRO)),A,LRO).main() @ &m : res] -  1%r / 2%r =
    Pr[MLWE(B(BS(B1ROM(A,S),S),LRO)).main(false) @ &m : res] -
       Pr[MLWE(B(BS(B1ROM(A,S),S),LRO)).main(true) @ &m : res] + 
    Pr[MLWE(Bt(BS(B2ROM(A,S),S),LRO)).main(false) @ &m : res]-
       Pr[MLWE(Bt(BS(B2ROM(A,S),S),LRO)).main(true) @ &m : res].
proof.
move => dout_ll A_guess_ll A_choose_ll.
have -> := (main_theorem_s LRO S A &m _ _ dout_ll _ A_guess_ll A_choose_ll); 
    1,3: by move => *; islossless.
+ by apply LRO_o_ll.
rewrite (MLWE_SMP_equiv false &m (B1ROM(A,S)) dout_ll).
rewrite (MLWE_SMP_equiv true &m (B1ROM(A,S)) dout_ll).
rewrite (MLWE_SMP_equiv_t false &m (B2ROM(A,S))).
rewrite (MLWE_SMP_equiv_t true &m (B2ROM(A,S))).
have -> : Pr[SMP_vs_ROM.MLWE_SMP.MLWE_SMP(B1ROM(A, S), S, LRO).main(false, false) @ &m : res] = 
          Pr[PKEG.MLWE_SMP.MLWE_SMP(B1ROM(A, S), S, LRO).main(false, false) @ &m : res] by byequiv => //; sim.
have -> : Pr[SMP_vs_ROM.MLWE_SMP.MLWE_SMP(B1ROM(A, S), S, LRO).main(false, true) @ &m : res] = 
          Pr[PKEG.MLWE_SMP.MLWE_SMP(B1ROM(A, S), S, LRO).main(false, true) @ &m : res] by byequiv => //; sim.
have -> : Pr[SMP_vs_ROM.MLWE_SMP.MLWE_SMP(B2ROM(A, S), S, LRO).main(true, false) @ &m : res] = 
          Pr[PKEG.MLWE_SMP.MLWE_SMP(B2ROM(A, S), S, LRO).main(true, false) @ &m : res] by byequiv => //; sim.
have -> : Pr[SMP_vs_ROM.MLWE_SMP.MLWE_SMP(B2ROM(A, S), S, LRO).main(true, true) @ &m : res] = 
          Pr[PKEG.MLWE_SMP.MLWE_SMP(B2ROM(A, S), S, LRO).main(true, true) @ &m : res] by byequiv => //; sim.
done.
qed.

end section.

end Security.

theory Correctness.

import SMP_vs_ROM.
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
    let v = (t `<*>` r) &+ e2 &+ (m_encode m) in
    let (u',v') = c_decode (c_encode (u,v)) in
        v' &- (s `<*>` u') &- (m_encode m).

(* We can derive the noise expression by introducing
   operators that compute the rounding error *)

op rnd_err_v : R -> R.
op rnd_err_u : vector -> vector.

axiom encode_noise u v :
   c_decode (c_encode (u,v)) = 
      (u + rnd_err_u u, v &+ rnd_err_v v).

lemma matrix_props1 _A s e r :
  (_A *^ s + e) `<*>` r = 
  (s ^* m_transpose _A `<*>` r) &+ (e `<*>` r).
proof. by rewrite dotpDl -mulmxTv trmxK. qed.

lemma matrix_props2 s _A r e1 cu :
  s `<*>` (m_transpose _A *^ r + e1 + cu) = 
  (s ^* m_transpose _A `<*>` r) &+ 
    (s `<*>` e1) &+ (s `<*>` cu).
proof. by rewrite !dotpDr dotpC dotp_mulmxv dotpC. qed.

lemma noise_exp_val _A s e r e1 e2 m :
  noise_exp _A s e r e1 e2 m = 
  let t = _A *^ s + e in
  let u = m_transpose _A *^ r + e1 in
  let v = (t `<*>` r) &+ e2 &+ (m_encode m) in
  let cu = rnd_err_u u in
  let cv = rnd_err_v v in
  ((e `<*>` r) &- (s `<*>` e1) &- (s `<*>` cu) &+ e2) &+ cv.
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
  m_decode (m_encode m &+ n) = m.

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
    m <@ A(O).find(pk_encode (_A *^ s + e,sd),sk_encode s);
    n <- noise_exp _A s e r e1 e2 m;
    return (!under_noise_bound n max_noise);
  }
}.

section.

declare module A <: CAdversaryRO {-LRO}.

lemma correctness &m :
  (forall (O <: Oracle), islossless O.o => islossless A(O).find) =>
  Pr[ CorrectnessAdvROM(MLWE_PKE(S(LRO)),A,LRO).main() @ &m : res]  >=
  1%r - Pr[ CorrectnessAdvNoise(A,LRO).main() @ &m : res].
proof.
move => A_ll.
rewrite (_: 1%r - Pr[ CorrectnessAdvNoise(A,LRO).main() @ &m : res] =
   Pr[ CorrectnessAdvNoise(A,LRO).main() @ &m : !res]).
rewrite Pr[mu_not]; congr => //. 
+ byphoare => //.
  islossless; 2..6: smt(duni_matrix_ll dshort_ll). 
  by apply (A_ll LRO); islossless;smt(duni_matrix_ll dshort_ll). 
byequiv => //.
proc.
inline CorrectnessAdv(MLWE_PKE(S(LRO), LRO), A(LRO)).main MLWE_PKE(S(LRO),LRO).dec MLWE_PKE(S(LRO),LRO).enc MLWE_PKE(S(LRO),LRO).kg.
swap {2} 5 -2.
swap {2} 12 -8.
swap {2} [13..14] -6.
seq 9 14 : ( 
           ={LRO.m,e2,e1,r,s,e,sd} /\
           sd0{2} = sd{2} /\
           m0{2} = m{1} /\ 
           m0{2} = m{2} /\ 
           (pk_decode pk0{2}).`2 = sd{2} /\
           (pk_decode pk0{2}).`1 = t{2} /\
           sk_decode sk{2} = s{2} /\
           t{2} = _A{2} *^ s{2} + e{2} /\
           t0{2} = t{2} /\
           (pk_decode pk0{2}).`2 \in LRO.m{2} /\
           _A{2} = _A{1} /\
           oget LRO.m{2}.[(pk_decode pk0{2}).`2] = _A{2}); last first.
+ inline *. auto => /> &2 -> ?; split; 1: by smt(duni_matrix_ll). 
  move => *;rewrite  encode_noise.
  rewrite (_: 
     (((oget LRO.m{2}.[(pk_decode pk0{2}).`2] *^ (sk_decode sk){2} + e{2}) `<*>` r{2}) &+
     e2{2} &+ m_encode m{2} &+
     rnd_err_v
       (((oget LRO.m{2}.[(pk_decode pk0{2}).`2] *^ (sk_decode sk){2}  + e{2}) `<*>` r{2}) &+
        e2{2} &+ m_encode m{2}) &-
     ((sk_decode sk){2}  `<*>`
      (m_transpose (oget LRO.m{2}.[(pk_decode pk0{2}).`2]) *^ r{2} + e1{2} +
       rnd_err_u (m_transpose (oget LRO.m{2}.[(pk_decode pk0{2}).`2]) *^ r{2} + e1{2})))) = 
  m_encode m{2} &+ noise_exp (oget LRO.m{2}.[(pk_decode pk0{2}).`2]) (sk_decode sk){2}  e{2} r{2} e1{2}
                     e2{2} m{2}); last by apply good_decode.
  by rewrite noise_exp_val /= matrix_props1 matrix_props2; ring.

auto => /=. 
seq 8 10 : ( #pre /\
           ={LRO.m,r,s,e,e1,e2,sd,_A} /\
           (pk_decode pk{2}).`2 = sd{2} /\
           (pk_decode pk{2}).`1 = t{2} /\
           (sk_decode sk){2} = s{2} /\
           t{2} = _A{2} *^ s{2} + e{2} /\
           (pk_decode pk{2}).`2 \in LRO.m{2} /\
           oget LRO.m{2}.[sd{2}] = _A{2}); last first.
+ exlim _A{2}, (pk_decode pk{2}).`2 => _A sd.
  call(_: ={glob LRO} /\ oget LRO.m{2}.[sd] = _A /\ sd \in LRO.m{2} ). 
  + by proc; auto => />; smt(get_setE).
  auto => />;smt(sk_decodeK get_setE pk_decodeK).
by inline *; auto => />;  smt(sk_decodeK sk_encodeK get_setE pk_decodeK pk_encodeK).
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
  let v = (t `<*>` r) &+ e2 &+ (m_encode m) in
  under_noise_bound (rnd_err_v v) cv_bound.

axiom noise_commutes n n' (b : int) : 
  under_noise_bound n' b =>
  under_noise_bound n (max_noise - b) =>
  under_noise_bound (n &+ n') max_noise.

op noise_exp_part_simpl cu s e r e1 e2 = 
  ((e `<*>` r) &- (s `<*>` e1) &- (s `<*>` cu) &+ e2 ).

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

declare module A <: CAdversaryRO {-LRO}.

lemma correctness_slack &m :
  (forall (O <: Oracle), islossless O.o => islossless A(O).find) =>
  Pr[ CorrectnessAdvNoise(A,LRO).main() @ &m : res]<=
  Pr[ CorrectnessNoiseApprox.main() @ &m : res].
proof.
move => A_ll.
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
+ by apply (A_ll LRO); smt(LRO_o_ll duni_matrix_ll).
skip;auto => />.
move => &1 &2 ssup esup _Asup rsup e2sup; rewrite noise_exp_val /=.
smt (noise_commutes cv_bound_valid).
qed.

lemma correctness_approx &m :
  (forall (O <: Oracle), islossless O.o => islossless A(O).find) =>
  Pr[ CorrectnessAdvROM(MLWE_PKE(S(LRO)),A,LRO).main() @ &m : res]  >=
  1%r - Pr[ CorrectnessNoiseApprox.main() @ &m : res]
 by move => A_ll; move : (correctness A  &m A_ll) (correctness_slack &m A_ll)  => /#. 


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
  (forall (O <: Oracle), islossless O.o => islossless A(O).find) =>
  Pr[ CorrectnessAdvROM(MLWE_PKE(S(LRO)),A,LRO).main() @ &m : res]  >=
  1%r - fail_prob - epsilon_hack
by move => A_ll;move: (fail_prob &m) (correctness_hack &m) (correctness_approx &m A_ll) => /#.

end section.

end Correctness.
end MLWE_PKE_RO.
