require import AllCore Distr List FMap Dexcepted PKE_ROM.
require (****) RndExcept StdOrder MLWE.

theory MLWE_PKE.

clone import MLWE as MLWE_.
import MLWE_SMP.

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
axiom sk_encodeK : cancel sk_encode sk_decode.


(******************************************************************)
(*    The Security Games                                          *)

clone import PKE_ROM with 
  type RO.in_t    = RO_SMP.in_t,
  type RO.out_t   = RO_SMP.out_t,  
  op   RO.dout    = RO_SMP.dout,  
  type RO.d_in_t  = RO_SMP.d_in_t, 
  type RO.d_out_t = RO_SMP.d_out_t,
  type pkey <- pkey,
  type skey <- skey,
  type plaintext <- plaintext,
  type ciphertext <- ciphertext.

import RO_SMP.

(******************************************************************)
(*                    The Encryption Scheme                       *)

(* Encryption schemes in the ROM always take RO.
   This PKE does not use the RO directly but may
   do so via the Sampler *)


module MLWE_PKE(S: PSampler, O : POracle) (* : Scheme *) = {
  proc kg() : pkey * skey = {
    var sd,s,e,_A,t;
    sd <$ dseed;
    s  <$ dshort;
    e  <$ dshort;
    _A <@ S.sampleA(sd);
    t  <- _A *^ s + e;
    return (pk_encode (t,sd),sk_encode s);
  }
  
  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var sd,t,r,e1,e2,_A,u,v;
    (t,sd) <- pk_decode pk;
    r  <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    _A <@ S.sampleAT(sd);
    u  <- _A *^ r + e1;
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
(*       Game Hopping Security for Sampler                        *)
(******************************************************************)


module MLWE_PKE_RO(S : PSampler) = MLWE_PKE(S).

(* Hop 1 *)

module MLWE_PKE1(S : PSampler, O : POracle) = {
  proc kg() : pkey * skey = {
    var _A,sd,s,t;
    sd <$ dseed;
    s  <$ dshort;
    t  <$ duni;
    _A <@ S.sampleA(sd);
    return (pk_encode (t,sd),sk_encode s);
  }

  include MLWE_PKE(S,O) [-kg]

}.


module (B1ROM(A : Adversary, S : Sampler) : SAdv_T) (H : POracle) = {
  var sd : seed
  var t  : vector
  
  proc interact(_sd : seed, _t : vector) : unit = { sd <- _sd; t <- _t; }

  proc guess(uv : vector * R) : bool = {
    var pk,  m0, m1, c, b, b';
    pk <- (uv.`1,sd);
    (m0, m1) <@ A(H).choose(pk_encode pk);
    b <$ {0,1};
    c <@ MLWE_PKE(S(H),H).enc(pk_encode pk, if b then m1 else m0);
    b' <@ A(H).guess(c);
    return b' = b;
  }
}.

section.

declare module O <: RO {-B1ROM}.
declare module S <: Sampler {-O,-B1ROM}.
declare module A <: Adversary {-O,-B1ROM,-S}.

lemma hop1_left_s &m: 
  Pr[CPA(O,MLWE_PKE(S(O)),A).main() @ &m : res] =
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
rcondf{2} 9; 1: by auto.
wp; call(: ={glob O}); 1: by sim.
by wp;rnd{2};rnd;rnd;rnd;auto => />;smt(dshort_ll duni_ll).
qed.

lemma hop1_right_s &m: 
  Pr[CPA(O,MLWE_PKE1(S(O)),A).main() @ &m : res] =
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
rcondf{2} 9; 1: by auto.
wp; call(: ={glob O}); 1: by sim.
by wp;rnd{2};rnd;rnd;rnd;auto => />;smt(dshort_ll duni_ll).
qed.

end section.

(* Hop 2 *)

module MLWE_PKE2(S : PSampler, O : POracle) = {

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var _A,u, v;
    _A <@ S.sampleAT((pk_decode pk).`2);
    u <$duni;
    v <$duni_R;
    return (c_encode (u,v &+ m_encode m));
  }

  include MLWE_PKE1(S,O) [-enc]

}.


module (B2ROM(A : Adversary, S : Sampler) : SAdv_T) (H : POracle) = {
  var pk : pkey
  var m0, m1 : plaintext

  proc interact(sd : seed, t: vector) : unit = {
    var _A;
    pk <- pk_encode (t,sd);
    _A <@ S(H).sampleA(sd); (* we need to match samplings *)
    (m0, m1) <@ A(H).choose(pk);
  }
  
  proc enc(pk : pkey, m : plaintext, uv : vector * R) : ciphertext = {
    return (c_encode (uv.`1, uv.`2 &+ m_encode m));
  }
  
  proc guess(uv : vector * R) : bool = {
    var c, b, b';
    b <$ {0,1};
    c <@ enc(pk, if b then m1 else m0,uv);
    b' <@ A(H).guess(c);
    return b' = b;
  }

}.

section.

declare module O <: RO {-B2ROM}.
declare module S <: Sampler {-O,-B2ROM}.
declare module A <: Adversary {-O,-B2ROM, -S}.

lemma hop2_left_s &m: 
  Pr[CPA(O,MLWE_PKE1(S(O)),A).main() @ &m : res] =
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
rcondt{2} 9; 1: by auto => />.
wp; call(: ={glob O}); 1: by sim.
wp; rnd; call(: ={glob O}); 1: by sim.
wp; call(: ={glob O}); 1: by sim.
by wp; rnd; wp; rnd; rnd{1}; auto => />; smt(dshort_ll duni_ll pk_encodeK).
qed.

lemma hop2_right_s &m: 
  Pr[CPA(O,MLWE_PKE2(S(O)),A).main() @ &m : res] =
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
rcondt{2} 8; 1: by auto => />.
wp; call(: ={glob O}); 1: by sim.
wp; call(: ={glob O}); 1: by sim.
wp; call(: ={glob O}); 1: by sim.
by wp; rnd; wp; rnd; rnd{1}; auto => />; smt(dshort_ll duni_ll pk_encodeK).
qed.

end section.

(* Final game analysis *)

section.

declare module O <: RO {-B1ROM, -B2ROM}.
declare module S <: Sampler {-O, -B1ROM, -B2ROM}.
declare module A <: Adversary {-O, -B1ROM, -B2ROM, -S}.

local module Game2RO(A : Adversary) = {
  proc main() = {
    var sd, _A, s, t, m0, m1, u, v, b, b';
    O.init();
    sd <$ dseed;
    _A <@ S(O).sampleA(sd);
    s <$ dshort;
    t <$ duni;
    (m0, m1) <@ A(O).choose(pk_encode (t,sd));
    _A <@ S(O).sampleAT(sd);
    u <$duni;
    v <$duni_R;
    b' <@ A(O).guess(c_encode (u,v));
    b <$ {0,1};
    return b = b';
  }
}.


local lemma game2_equiv_s &m : 
  Pr[CPA(O,MLWE_PKE2(S(O)),A).main() @ &m : res] = 
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
  islossless O.get =>
  (forall (O <: POracle), islossless O.get => islossless S(O).sampleA) =>   
  (forall (O <: POracle), islossless O.get => islossless S(O).sampleAT) =>   
  (forall (O <: POracle), islossless O.get => islossless A(O).guess) =>
  (forall (O <: POracle), islossless O.get => islossless A(O).choose) =>
  Pr[Game2RO(A).main() @ &m : res] = 1%r / 2%r.
proof.
move => O_init_ll O__o_ll SA_ll SAT_ll A_guess_ll A_choose_ll.
move : (SAT_ll (O)).
move : (SA_ll (O)).
move : (A_guess_ll (O)).
move : (A_choose_ll (O)).
move => _A_choose_ll _A_guess_ll _SA_ll _SAT_ll.
byphoare => //;proc.
rnd  (pred1 b')=> //=; conseq (: _ ==> true).
+ by move=> />; apply DBool.dbool1E.
islossless; 4,5,7:by smt(duni_ll dshort_ll).
+ by apply _A_guess_ll.
+ by apply _SAT_ll. 
+ by apply _A_choose_ll.
+ by apply _SA_ll.
qed.

lemma main_theorem_s &m :
  islossless O.init =>
  islossless O.get =>
  (forall (O <: POracle), islossless O.get => islossless S(O).sampleA) =>   
  (forall (O <: POracle), islossless O.get => islossless S(O).sampleAT) =>   
  (forall (O <: POracle), islossless O.get => islossless A(O).guess) =>
  (forall (O <: POracle), islossless O.get => islossless A(O).choose) =>
  Pr[CPA(O,MLWE_PKE(S(O)),A).main() @ &m : res] -  1%r / 2%r =
    Pr[MLWE_SMP(B1ROM(A,S),S,O).main(false,false) @ &m : res] -
       Pr[MLWE_SMP(B1ROM(A,S),S,O).main(false,true) @ &m : res] + 
    Pr[MLWE_SMP(B2ROM(A,S),S,O).main(true,false) @ &m : res] -
       Pr[MLWE_SMP(B2ROM(A,S),S,O).main(true,true) @ &m : res].
proof.
move => O_init_ll O_o_ll SA_ll SAT_ll A_guess_ll A_choose_ll.
rewrite (hop1_left_s O S A &m).
rewrite -(hop1_right_s O S A &m).
rewrite (hop2_left_s O S A &m).
rewrite -(hop2_right_s O S A &m).
rewrite (game2_equiv_s &m).
rewrite (game2_prob_s &m _ _) //.
by ring.
qed.

end section.

(******************************************************************)
(*   Refining security to MLWE when sampler is nice               *)
(******************************************************************)

import SMP_vs_ROM_IND.

import MLWE_ROM.MLWE_vs_MLWE_ROM.
import MLWE_SMP.
import MLWE_ROM.

section. 

declare module A <: Adversary {-B1ROM, -B2ROM, -LRO, -RO_H.RO, -RO_H.FRO, -RO_H.LRO, -B,-Bt, -BS, -D}.
declare module S <: Sampler {-A, -B1ROM, -B2ROM, -LRO, -RO_H.RO, -RO_H.FRO, -RO_H.LRO, -B,-Bt, -BS, -D}.
declare module Sim <: Simulator_t {-S,-A,-B1ROM, -B2ROM, -LRO, -RO_H.RO, -RO_H.FRO, -RO_H.LRO, -B,-Bt, -BS, -D}.

lemma main_theorem_ref &m epsilon :
  0%r <= epsilon =>
  (forall (x : RO_SMP.in_t), is_lossless (RO_SMP.dout x)) => 
  (forall (O <: SMP_RO), islossless O.get => islossless S(O).sampleA) =>
  (forall (O <: SMP_RO), islossless O.get => islossless S(O).sampleAT) =>
  (forall (O <: SMP_RO), islossless O.get => islossless A(O).guess) =>
  (forall (O <: SMP_RO), islossless O.get => islossless A(O).choose) =>
  (* We need indiff from the nice ROM *)
  (forall tr b (D0 <: Distinguisher_t {-S,-LRO, -RO, -RO_H.LRO, -RO_H.RO, -Sim}),
     `| Pr[ WIndfReal(D0,S,RO_SMP.LRO).main(tr,b) @ &m : res] - 
        Pr[ WIndfIdeal(D0,Sim,RO_H.LRO).main(tr,b) @ &m : res] | <= epsilon) =>
  `| Pr[CPA(RO_SMP.LRO,MLWE_PKE(S(RO_SMP.LRO)),A).main() @ &m : res] -  1%r / 2%r | <=
    `| Pr[MLWE(B(BS(B1ROM(A,S),Sim),RO_H.LRO)).main(false) @ &m : res] -
       Pr[MLWE(B(BS(B1ROM(A,S),Sim),RO_H.LRO)).main(true) @ &m : res] | + 
    `| Pr[MLWE(Bt(BS(B2ROM(A,S),Sim),RO_H.LRO)).main(false) @ &m : res]-
       Pr[MLWE(Bt(BS(B2ROM(A,S),Sim),RO_H.LRO)).main(true) @ &m : res] | + 4%r * epsilon.
proof.
move => eps_ge0 dout_ll  SA_ll SAT_ll A_guess_ll A_choose_ll ind.
have -> := (main_theorem_s (RO_SMP.LRO) S A &m _ _ _  _ _ _). 
+ by move => *; islossless.
+ by apply RO_SMP.RO_get_ll.
+ by move => O H; apply (SA_ll O H).
+ by move => O H; apply (SAT_ll O H).
+ by move => O H; apply (A_guess_ll O H).
+ by move => O H; apply (A_choose_ll O H).
have := (ind false false (D(B1ROM(A,S)))).
have := (ind false true (D(B1ROM(A,S)))).
have := (ind true false (D(B2ROM(A,S)))).
have := (ind true true (D(B2ROM(A,S)))).
have <- := (MLWE_SMP_equiv false &m S (B1ROM(A,S)) Sim).
have <- := (MLWE_SMP_equiv true &m S (B1ROM(A,S)) Sim).
have <- := (MLWE_SMP_equiv_t false &m S (B2ROM(A,S)) Sim).
have <- := (MLWE_SMP_equiv_t true &m S (B2ROM(A,S)) Sim). 
smt().
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
   for MLKEM. We will do so generically by first showing at this
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

(* We now rewrite the correctness game in terms of noise and move
   to the RO that directly samples a uniform matrix *)
module CorrectnessAdvNoise(Sim : Simulator_t,A : CORR_ADV, O : RO_H.RO) = {
  proc main() = {
    var sd,s,e,_A,r,e1,e2,m,n;
    O.init();
    Sim(O).init();
    sd <$ dseed;
    _A <@ O.get(sd);
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    m <@ A(Sim(O)).find(pk_encode (_A *^ s + e,sd),sk_encode s);
    n <- noise_exp _A s e r e1 e2 m;
    return (!under_noise_bound n max_noise);
  }
}.

section.

declare module A <: CORR_ADV {-LRO,-RO, -RO_H.RO, -RO_H.LRO}.
declare module S <: Sampler {-A,-LRO,-RO, -RO_H.RO, -RO_H.LRO}.
declare module Sim <: Simulator_t {-S, -A,-LRO,-RO, -RO_H.RO, -RO_H.LRO}.

module (D(A : CORR_ADV) : Distinguisher_t) (S : PSampler, H : SMP_RO) = {
   proc distinguish(tr b : bool, sd : seed) : bool = {
     var t,r,e1,e2,u,v,c,u0,v0,m',b',s,e,_A, pk, sk, m;
     s <$ dshort;                                     
     e <$ dshort;                                       
     _A <@ S.sampleA(sd);                           
     t <- _A *^ s + e;                           
     (pk,sk) <- (pk_encode (t, sd), sk_encode s);
     m <@ A(H).find(pk, sk); 
     (t, sd) <- pk_decode pk;
     r <$ dshort;                                       
     e1 <$ dshort;                                      
     e2 <$ dshort_R;                                    
     _A <@ S.sampleAT(sd);                           
     u <- _A *^ r + e1;                            
     v <- (t `<*>` r) &+ e2 &+ m_encode m;             
     c <- c_encode (u, v);                              
     (u0, v0) <- c_decode c;                           
     m' <- Some (m_decode (v0 &- (sk_decode sk `<*>` u0)));
     b' <- m' <> Some m;                        
     return b';
   }
}.

lemma correctness &m epsilon:
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).init) =>
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).get) =>
  (forall (O <: SMP_RO), islossless O.get => islossless A(O).find) =>
  (* We need indiff from the nice ROM *)
  (forall trb (D0 <: Distinguisher_t {-S,-LRO, -RO, -RO_H.LRO,-RO_H.RO, -Sim}),
     `| Pr[ WIndfReal(D0,S,RO_SMP.LRO).main(trb) @ &m : res] - 
        Pr[ WIndfIdeal(D0,Sim,RO_H.LRO).main(trb) @ &m : res] | <= epsilon) =>
  Pr[ Correctness_Adv(RO_SMP.LRO,MLWE_PKE(S(RO_SMP.LRO)),A).main() @ &m : res]  <= epsilon
       + Pr[ CorrectnessAdvNoise(Sim,A,RO_H.LRO).main() @ &m : res].
proof.
move => Sim_init_ll Sim_h_ll A_ll HIND.
have -> : Pr[Correctness_Adv(RO_SMP.LRO,MLWE_PKE(S(RO_SMP.LRO)), A).main() @ &m : res] = 
          Pr[ WIndfReal(D(A),S,RO_SMP.LRO).main(witness) @ &m : res].
+ byequiv => //; proc;inline *; wp 22 21; conseq (:_ ==> ={m,m'}); 1: by smt(). 
  by sim. 
have  := (HIND witness (D(A))).

have ? : 
          Pr[WIndfIdeal(D(A), Sim, RO_H.LRO).main(witness) @ &m : res] <= 
             Pr[CorrectnessAdvNoise(Sim, A, RO_H.LRO).main() @ &m : res]; last by smt().

byequiv => //.
proc.  
inline {1} 4. 
swap {1} 6 -2.
swap {1} 9 -4.
swap {1} [14..16] -8.
swap {1} [11..12] -4.
seq 15 10 : ( 
           ={RO_H.RO.m,e2,e1,r,s,e,sd,m,glob Sim} /\
           sd0{1} = sd{1} /\
           (pk_decode pk{1}).`2 = sd{1} /\
           (pk_decode pk{1}).`1 = t{1} /\
           sk_decode sk{1} = s{1} /\
           t{1} = _A{1} *^ s{1} + e{1} /\
           (pk_decode pk{1}).`2 \in RO_H.RO.m{1} /\
           _A{1} = _A{2} /\
           oget RO_H.RO.m{1}.[(pk_decode pk{1}).`2] = _A{1}); last first.
+ inline *; auto => />; move => &1 &2  ->?; split; 1: by smt(duni_matrix_ll). 
  move => ???;rewrite  encode_noise.
  rewrite (_: 
     (((oget RO_H.RO.m{2}.[(pk_decode pk{1}).`2] *^ (sk_decode sk){1} + e{2}) `<*>` r{2}) &+
     e2{2} &+ m_encode m{2} &+
     rnd_err_v
       (((oget RO_H.RO.m{2}.[(pk_decode pk{1}).`2] *^ (sk_decode sk){1}  + e{2}) `<*>` r{2}) &+
        e2{2} &+ m_encode m{2}) &-
     ((sk_decode sk){1}  `<*>`
      (m_transpose (oget RO_H.RO.m{2}.[(pk_decode pk{1}).`2]) *^ r{2} + e1{2} +
       rnd_err_u (m_transpose (oget RO_H.RO.m{2}.[(pk_decode pk{1}).`2]) *^ r{2} + e1{2})))) = 
  m_encode m{2} &+ noise_exp (oget RO_H.RO.m{2}.[(pk_decode pk{1}).`2]) (sk_decode sk){1}  e{2} r{2} e1{2}
                     e2{2} m{2});  
   1: by rewrite noise_exp_val /= matrix_props1 matrix_props2; ring.
   by smt(good_decode).

seq 14 9 : ((tr{1}, b{1}) = witness /\
           ={RO_H.RO.m,r,s,e,e1,e2,sd,_A,glob Sim, glob A} /\
           sd0{1} = sd{2} /\
           pk{1} = pk_encode (t,sd){1} /\
           sk{1} = sk_encode s{1} /\
           t{1} = _A{1} *^ s{1} + e{1} /\
           sd{1} \in RO_H.RO.m{1} /\
           oget RO_H.RO.m{1}.[sd{1}] = _A{1}); last first.
+ exlim _A{1}, sd{1} => _A sd.
  call(_: ={glob RO_H.RO, glob Sim} /\ oget RO_H.RO.m{1}.[sd] = _A /\ sd \in RO_H.RO.m{1} ). 
  + proc *;call(_: ={glob RO_H.RO}  /\ oget RO_H.RO.m{1}.[sd] = _A /\ sd \in RO_H.RO.m{1} ).
    + by proc; auto => />; smt(get_setE).
    by auto => />; smt(get_setE sk_encodeK pk_encodeK).
  by auto => />; smt(sk_encodeK get_setE pk_encodeK).

inline *; auto => />;1:by smt(sk_encodeK get_setE pk_encodeK).
by call(_: true); auto => />; smt(get_set_eqE).
qed.

end section.

axiom noise_commutes n n' maxn (b : int) : 
  under_noise_bound n' b =>
  under_noise_bound n (maxn - b) =>
  under_noise_bound (n &+ n') maxn.

axiom noise_preserved n maxn :
  under_noise_bound n maxn = 
  under_noise_bound (ZR.([-]) n) maxn.

op noise_exp_part1 s e r e1 e2 = 
  ((e `<*>` r) &- (s `<*>` e1) &+ e2 ).

op noise_exp_part2 _A s r e1 =
  let u = m_transpose _A *^ r + e1 in
  let cu = rnd_err_u u in
    (s `<*>` cu).

op noise_exp_part3 _A s e r e2 m =
  let t = _A *^ s + e in
  let v = (t `<*>` r) &+ e2 &+ (m_encode m) in
  let cv = rnd_err_v v in
  cv.


lemma parts_work _A s e r e1 e2 m :
  noise_exp _A s e r e1 e2 m =
  noise_exp_part1 s e r e1 e2 &+ (ZR.([-]) (noise_exp_part2 _A s r e1)) &+ noise_exp_part3 _A s e r e2 m by rewrite noise_exp_val /noise_exp_simpl /noise_exp_part1 /noise_exp_part2 /noise_exp_part3 /=; ring. 

module CB(Sim : Simulator_t,A : CORR_ADV, O : RO_H.RO) = {
  var s : vector
  var e : vector
  var _A : matrix
  var r : vector
  var e1 : vector
  var e2 : R
  var n1 : R
  var n2 : R
  var n3 : R
  var u : vector
  var cu : vector
  var m : plaintext


  proc main() = {
    var sd;
    O.init();
    Sim(O).init();
    sd <$ dseed;
    _A <@ O.get(sd);
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    m <@ A(Sim(O)).find(pk_encode (_A *^ s + e,sd),sk_encode s);
    n1 <- noise_exp_part1 s e r e1 e2;
    n2 <- noise_exp_part2 _A s r e1;
    n3 <- noise_exp_part3 _A s e r e2 m;
  }
}.

(** OVER ESTIMATE THE LAST TERM **)

op cv_bound_max : int.
axiom cv_bound_valid _A s e r e2 m :
  s \in dshort =>
  e \in dshort =>
  _A \in duni_matrix =>
  r \in dshort =>
  e2 \in dshort_R =>
  let t = _A *^ s + e in
  let v = (t `<*>` r) &+ e2 &+ (m_encode m) in
  under_noise_bound (rnd_err_v v) cv_bound_max.


section.

declare module A <: CORR_ADV {-LRO,-RO, -RO_H.RO, -CB}.
declare module S <: Sampler {-A,-LRO,-RO, -RO_H.RO, -CB}.
declare module Sim <: Simulator_t {-S, -A,-LRO,-RO, -RO_H.RO, -CB}.

lemma correctness_split_aux &m cu_bound cv_bound failprob1 failprob2 failprob3:
  (forall (O <: SMP_RO), islossless O.get => islossless A(O).find) =>
  Pr[ CB(Sim,A,RO_H.LRO).main() @ &m : 
        !under_noise_bound CB.n1 (max_noise - cu_bound - cv_bound)] <= failprob1 =>
  Pr[ CB(Sim,A,RO_H.LRO).main() @ &m : 
        !under_noise_bound CB.n2 (cu_bound)] <= failprob2 =>
  Pr[ CB(Sim,A,RO_H.LRO).main() @ &m : 
        !under_noise_bound CB.n3 (cv_bound)] <= failprob3 =>

  Pr[ CorrectnessAdvNoise(Sim,A,RO_H.LRO).main() @ &m : res] <=
       failprob1 + failprob2 + failprob3.
proof.
move =>  A_ll bd1 bd2 bd3.
have  : Pr[CorrectnessAdvNoise(Sim, A, RO_H.LRO).main() @ &m : res] <=
  Pr[CB(Sim, A, RO_H.LRO).main() @ &m : 
        ! under_noise_bound CB.n1 (max_noise - cu_bound - cv_bound) \/
        ! under_noise_bound CB.n2 cu_bound \/
        ! under_noise_bound CB.n3 cv_bound ]; last by rewrite Pr[mu_or] Pr[mu_or];smt(mu_bounded).
byequiv => //.
proc; inline *.
rcondt{1}6; 1: by move => *; auto;call(_: true); auto => />;smt(mem_empty).
rcondt{2}6; 1: by move => *; auto;call(_: true); auto => />;smt(mem_empty).
wp;call(_: ={glob RO_H.RO, glob Sim});1: by sim.
conseq />;1:by smt(). 
auto => />; 1: by smt(parts_work noise_commutes noise_preserved).
by call(_: true); auto => />;  smt(parts_work noise_commutes noise_preserved).
qed.

(*******)

module CB1 = {

  proc main(cu_bound cv_bound : int) = {
    var r,s,e,e1,e2,n;
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    n <- noise_exp_part1 s e r e1 e2;
    return !under_noise_bound n (max_noise - cu_bound - cv_bound);
  }
}.

lemma cb1 &m cu_bound cv_bound : 
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).init) =>
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).get) =>
  (forall (O <: SMP_RO), islossless O.get => islossless A(O).find) =>
  Pr[ CB(Sim,A,RO_H.LRO).main() @ &m : 
        !under_noise_bound CB.n1 (max_noise - cu_bound - cv_bound)] =
  Pr[ CB1.main(cu_bound,cv_bound) @ &m : res].
move => S_i_ll S_h_ll A_ll.
byequiv => //; proc; inline *.
wp;call{1}(_: true ==> true); 1: by apply (A_ll ( (Sim(RO_H.LRO))));  apply (S_h_ll (RO_H.LRO)); apply RO_H.RO_get_ll; smt(duni_matrix_ll). 
rcondt{1}6; 1: by move => *; auto => />;call(_: true);auto => />;smt(mem_empty).
auto => />;call {1} (_: true ==> true); 1: by  apply (S_i_ll (RO_H.LRO)); apply RO_H.RO_get_ll; smt(duni_matrix_ll).  
by auto => />;smt(duni_matrix_ll).
qed.

module CB2pre = {
  proc main(cu_bound : int) = {
     var _A, r, s, e1, n;
    _A <$ duni_matrix;
    r <$ dshort;
    s <$ dshort;
    e1 <$ dshort;
    n <- noise_exp_part2 _A s r e1;
    return !under_noise_bound n cu_bound;
  }
}.

module CB2 = {
  proc main(cu_bound : int) = {
     var s, u, cu, n;
    s <$ dshort;
    u <$ duni; 
    cu <- rnd_err_u u;
    n <- (s `<*>` cu);
    return !under_noise_bound n cu_bound;
  }
}.


lemma cb2pre &m cu_bound: 
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).init) =>
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).get) =>
  (forall (O <: SMP_RO), islossless O.get => islossless A(O).find) =>
  Pr[ CB(Sim,A,RO_H.LRO).main() @ &m : 
        !under_noise_bound CB.n2 cu_bound] =
  Pr[ CB2pre.main(cu_bound) @ &m : res].
move => S_i_ll S_h_ll A_ll.
byequiv => //; proc; inline *.
wp;call{1}(_: true ==> true); 1: by apply (A_ll ( (Sim(RO_H.LRO))));  apply (S_h_ll (RO_H.LRO)); apply RO_H.RO_get_ll; smt(duni_matrix_ll). 
rcondt{1}6; 1: by move => *; auto => />;call(_: true);auto => />; smt(mem_empty).
rnd{1};rnd;rnd{1}.
auto => /> *; 1: by smt().
call {1} (_: true ==> true); 1: by  apply (S_i_ll (RO_H.LRO)); apply RO_H.RO_get_ll; smt(duni_matrix_ll).  
by auto => />;smt(dshort_R_ll dshort_ll get_set_sameE).
qed.

module Bcb2 : MLWE_.Adv_T = {
  var cu_bound : int
  proc guess(_A : matrix, t : vector, uv : vector * R) : bool = {
    var u,s,cu,n;
    s <$ dshort;
    u <- uv.`1; 
    cu <- rnd_err_u u;
    n <- (s `<*>` cu);
    return !under_noise_bound n cu_bound;
  }
}.

lemma cb2_mlwe_left &m cu_bound :
  (glob Bcb2){m} = cu_bound =>
  Pr[CB2pre.main(cu_bound) @ &m : res] =
  Pr[MLWE(Bcb2).main(false) @ &m : res].
proof.
move => cub_val.
byequiv => //; rewrite cub_val.
proc; inline *. 
wp. swap {2} 13 -10;wp;rnd{2};wp;rnd{2};wp;rnd{2};rnd{2};wp;rnd;rnd;rnd;rnd (fun _A => trmx _A);auto => />.
move => *; split; 1: by move => *; rewrite trmxK. 
move => *; split. 
+ move => *; rewrite !mu1_uni /=; 1,2: smt(duni_matrix_uni).
  by rewrite !duni_matrix_fu /=.
move => *; split; 1: by rewrite duni_matrix_fu. 
move => *; split; 1: by move => *; rewrite trmxK. 
by move => *; rewrite duni_ll /= => *.
qed.

lemma cb2_mlwe_right &m cu_bound :
  (glob Bcb2){m} = cu_bound =>
  Pr[CB2.main(cu_bound) @ &m : res] =
  Pr[MLWE(Bcb2).main(true) @ &m : res].
proof.
move => cub_val.
byequiv => //; rewrite cub_val.
proc; inline *. 
swap {2} 13 -12. 
wp;rnd{2};wp;rnd{2};rnd{2};rnd;wp;rnd{2};rnd{2};rnd{2};rnd;auto => />.
move => *; rewrite duni_matrix_ll /=.
move => *;rewrite dshort_ll /=.
by move => *; rewrite duni_ll.
qed.


(*
  let t = _A *^ s + e in
  let v = (t `<*>` r) &+ e2 &+ (m_encode m) in
  let cv = rnd_err_v v in
  cv.

*)

module CB3(Sim : Simulator_t,A : CORR_ADV, O : RO_H.RO) = {
  proc main(cv_bound : int) = {
    var sd,_A,r,s,e,e1,e2,m,n;
    O.init();
    Sim(O).init();
    sd <$ dseed;
    _A <@ O.get(sd);
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    m <@ A(Sim(O)).find(pk_encode (_A *^ s + e,sd),sk_encode s);
    n <- noise_exp_part3 _A s e r e2 m;
    return !under_noise_bound n cv_bound;
  }
}.

lemma cb3 &m cv_bound : 
  Pr[ CB(Sim,A,RO_H.LRO).main() @ &m : 
        !under_noise_bound CB.n3 cv_bound] =
  Pr[ CB3(Sim,A,RO_H.LRO).main(cv_bound) @ &m : res].
byequiv => //; proc; inline *.
wp;call(_: ={glob RO_H.RO, glob Sim}); 1: by sim.
rcondt{1}6; 1: by move => *; auto => />;call(_: true); auto => />;smt(mem_empty). 
rcondt{2}6; 1: by move => *; auto => />;call(_: true); auto => />;smt(mem_empty). 
auto => />;1: by smt(). 
by call(_: true); auto => />;smt(get_set_sameE).
qed.

(*******)


lemma correctness_split &m cu_bound cv_bound epsilon failprob1 failprob2 failprob3 :
  (glob Bcb2){m} = cu_bound =>
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).init) =>
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).get) =>
  (forall (O <: SMP_RO), islossless O.get => islossless A(O).find) =>
  (* We need indiff from the nice ROM *)
  (forall trb (D0 <: Distinguisher_t {-S,-LRO,-RO,-RO_H.LRO,-RO_H.RO,  -Sim}),
     `| Pr[ WIndfReal(D0,S,RO_SMP.LRO).main(trb) @ &m : res] - 
        Pr[ WIndfIdeal(D0,Sim,RO_H.LRO).main(trb) @ &m : res] | <= epsilon) =>

  Pr[ CB1.main(cu_bound, cv_bound) @ &m : res] <= failprob1 =>
  Pr[ CB2.main(cu_bound) @ &m : res] <= failprob2 =>
  Pr[ CB3(Sim,A,RO_H.LRO).main(cv_bound) @ &m : res] <= failprob3 =>

  Pr[ Correctness_Adv(RO_SMP.LRO,MLWE_PKE(S(RO_SMP.LRO)),A).main() @ &m : res]  <=
   `| Pr[MLWE(Bcb2).main(false) @ &m : res] - Pr[MLWE(Bcb2).main(true) @ &m : res]| 
      + failprob1 + failprob2 + failprob3 + epsilon.
move => meminit S_i_ll S_h_ll A_ll ind fp1 fp2 fp3.
have := (correctness A S Sim &m epsilon  S_i_ll S_h_ll A_ll ind).
rewrite -(cb1 &m cu_bound cv_bound S_i_ll S_h_ll A_ll) in fp1.
rewrite -(cb2_mlwe_right &m cu_bound meminit).
rewrite -(cb2_mlwe_left &m cu_bound meminit).
rewrite -(cb3 &m cv_bound) in fp3.
have := (correctness_split_aux &m cu_bound cv_bound failprob1 (`|Pr[CB2pre.main(cu_bound) @ &m : res] - Pr[CB2.main(cu_bound) @ &m : res] |  + failprob2) failprob3  A_ll fp1 _ fp3). 
rewrite -(cb2pre &m cu_bound S_i_ll S_h_ll A_ll).
smt().
smt().
qed.

lemma cb3_max &m : 
  Pr[ CB3(Sim,A,RO_H.LRO).main(cv_bound_max) @ &m : res] = 0%r.
byphoare (_: cv_bound = cv_bound_max ==> res) => //.
hoare; proc; inline *.
wp;call(_: true); 1: by auto.
rcondt 6; 1: by move => *; auto => />;call(_: true); auto => />;smt(mem_empty). 
by auto => />; call(_: true); auto => />;smt(get_set_sameE cv_bound_valid).
qed.

lemma correctness_max &m cu_bound epsilon failprob1 failprob2 :
  (glob Bcb2){m} = cu_bound =>
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).init) =>
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).get) =>
  (forall (O <: SMP_RO), islossless O.get => islossless A(O).find) =>
  (* We need indiff from the nice ROM *)
  (forall trb (D0 <: Distinguisher_t {-S,-LRO,-RO,-RO_H.LRO,-RO_H.RO,  -Sim}),
     `| Pr[ WIndfReal(D0,S,RO_SMP.LRO).main(trb) @ &m : res] - 
        Pr[ WIndfIdeal(D0,Sim,RO_H.LRO).main(trb) @ &m : res] | <= epsilon) =>

  Pr[ CB1.main(cu_bound, cv_bound_max) @ &m : res] <= failprob1 =>
  Pr[ CB2.main(cu_bound) @ &m : res] <= failprob2 =>

  Pr[ Correctness_Adv(RO_SMP.LRO,MLWE_PKE(S(RO_SMP.LRO)),A).main() @ &m : res]  <=
    `| Pr[MLWE(Bcb2).main(false) @ &m : res] - Pr[MLWE(Bcb2).main(true) @ &m : res]| 
      + failprob1 + failprob2  + epsilon.
move => meminit S_i_ll S_h_ll A_ll ind fp1 fp2.
have := (correctness_split &m cu_bound cv_bound_max epsilon  failprob1 failprob2 0%r meminit S_i_ll S_h_ll A_ll ind fp1 fp2 _).
+ by have := cb3_max &m; smt().
by smt().
qed.

end section.
end MLWE_PKE.

(* Sanity check to see if indiff instantiation works for trivial simulator 
  and trivial sampler. *)

theory MLWE_PKE_TRIVIAL.

clone import MLWE_PKE with
  type MLWE_.MLWE_SMP.RO_SMP.in_t  = seed,
  type MLWE_.MLWE_SMP.RO_SMP.out_t = MLWE_.Matrix_.Matrix.matrix,
  op MLWE_.MLWE_SMP.RO_SMP.dout    = fun (sd : seed) => duni_matrix, 
  type MLWE_.MLWE_SMP.RO_SMP.d_in_t = bool,
  type MLWE_.MLWE_SMP.RO_SMP.d_out_t = bool.

import MLWE_.
import MLWE_SMP.
import SMP_vs_ROM.
import SMP_vs_ROM_IND.
import MLWE_ROM.
import MLWE_vs_MLWE_ROM.

module (Sim : Simulator_t) (O : Ideal_RO) = {
  proc init() = {}
  proc get = S(O).sampleA
}.


lemma good_sim tr b (D <: Distinguisher_t {-S,-RO_SMP.RO, -RO_SMP.LRO,  -RO_H.RO, -RO_H.LRO, -Sim}) &m : 
     Pr[ WIndfReal(D,S,RO_SMP.LRO).main(tr,b) @ &m : res] = 
     Pr[ WIndfIdeal(D,Sim, RO_H.LRO).main(tr,b) @ &m : res].
byequiv => //; proc.
call(_: (glob RO_SMP.RO){1} = (glob RO_H.RO){2}). 
+ by proc; inline *; auto => />.
+ by proc; inline *; auto => />.
+ by proc; inline *; auto => />.
by inline *; auto => />.
qed.

import PKE_ROM.

section.
declare module A <: Adversary {-B1ROM, -B2ROM, -RO_H.LRO,-RO_H.RO, -RO_H.FRO, -RO_SMP.LRO,  -B,-Bt, -BS, -D}.

lemma main_theorem &m :
  (forall (O <: SMP_RO), islossless O.get => islossless A(O).guess) =>
  (forall (O <: Ideal_RO), islossless O.get => islossless A(O).choose) =>
  `| Pr[CPA(RO_SMP.LRO,MLWE_PKE(S(RO_SMP.LRO)),A).main() @ &m : res] -  1%r / 2%r | <=
    `| Pr[MLWE(B(BS(B1ROM(A,S),Sim),RO_H.LRO)).main(false) @ &m : res] -
       Pr[MLWE(B(BS(B1ROM(A,S),Sim),RO_H.LRO)).main(true) @ &m : res] | + 
    `| Pr[MLWE(Bt(BS(B2ROM(A,S),Sim),RO_H.LRO)).main(false) @ &m : res]-
       Pr[MLWE(Bt(BS(B2ROM(A,S),Sim),RO_H.LRO)).main(true) @ &m : res] |.
move => A_ll_guess A_ll_choose. 
have /= := (main_theorem_ref A S Sim &m 0%r _ _ _ _ _ _ _); 1: by smt().
+ by smt(duni_matrix_ll).
+ by move => *; islossless.
+ by move => *; islossless.
+ by move => O H; apply (A_ll_guess O H). 
+ by move => O H; apply (A_ll_choose O H). 
by move => tr b D0; rewrite (good_sim tr b D0).
by smt().
qed.

end section.

section.

declare module A <: CORR_ADV {-RO_H.LRO,-RO_H.RO, -RO_H.FRO, -RO_SMP.LRO, -CB}.

lemma correctness_max &m cu_bound failprob1 failprob2 :
  (glob Bcb2){m} = cu_bound =>
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).init) =>
  (forall (O <: Ideal_RO), islossless O.get => islossless Sim(O).get) =>
  (forall (O <: SMP_RO), islossless O.get => islossless A(O).find) =>

  Pr[ CB1.main(cu_bound, cv_bound_max) @ &m : res] <= failprob1 =>
  Pr[ CB2.main(cu_bound) @ &m : res] <= failprob2 =>

  Pr[ Correctness_Adv(RO_SMP.LRO,MLWE_PKE(S(RO_SMP.LRO)),A).main() @ &m : res]  <=
    `| Pr[MLWE(Bcb2).main(false) @ &m : res] - Pr[MLWE(Bcb2).main(true) @ &m : res]| 
      + failprob1 + failprob2.
move => cb2_val S_i_ll S_h_ll A_ll fp1 fp2.
have := (correctness_max A S Sim &m cu_bound 0%r failprob1 failprob2 cb2_val S_i_ll S_h_ll A_ll _ fp1 fp2 ).
move => trb D0; have -> : trb = (trb.`1,trb.`2) by smt().
by have := (good_sim (trb.`1) (trb.`2) D0) => /#.
by smt().
qed.

end section.

end MLWE_PKE_TRIVIAL.

