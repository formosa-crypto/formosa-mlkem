require import AllCore Distr List SmtMap Dexcepted PKE_ROM.
require (****) RndExcept StdOrder MLWE.

theory MLWE_PKE_Hash.

clone import MLWE as MLWE_.
import Matrix_.
import ZR.

import StdOrder.IntOrder Matrix_ Big.BAdd.

type plaintext.

op m_encode : plaintext -> R. 
op m_decode : R -> plaintext.

type ciphertext = vector * R.

type pkey  = seed * vector.
type skey  = vector.


(******************************************************************)
(*                The Hashed Encryption Scheme                     *)

type randomness.

op [uniform full lossless]drand : randomness distr.

op prg_kg : randomness -> seed * vector * vector.

axiom prg_kg_correct : 
   dmap drand prg_kg = 
     dlet dseed
       (fun (sd : seed) => 
          dlet dshort (fun (s : vector) => 
               dmap dshort (fun (e : vector) => (sd, s, e)))).

op prg_enc : randomness -> vector * vector * R.

axiom prg_enc_correct : 
   dmap drand prg_enc = 
     dlet dshort
       (fun (r : vector) => 
          dlet dshort (fun (e1 : vector) => 
               dmap dshort_R (fun (e2 : R) => (r, e1, e2)))).

op kg(r : randomness) : pkey * skey = 
   let (sd,s,e) = prg_kg r in
   let t =  (H sd) *^ s + e in
       ((sd,t),s).

op enc(rr : randomness, pk : pkey, m : plaintext) : ciphertext = 
    let (sd,t) = pk in
    let (r,e1,e2) = prg_enc rr in
    let u = m_transpose (H sd) *^ r + e1 in
    let v = (t `<*>` r) &+ e2 &+ (m_encode m) in
        (u,v).

op dec(sk : skey, c : ciphertext) : plaintext option =
    let (u,v) = c in
       Some (m_decode (v &- (sk `<*>` u))).

(******************************************************************)
(*    The Security Games                                          *)

(* We noe get them from the PKE theory for the UU+TT transformation.
clone import PKE with 
  type pkey <- pkey,
  type skey <- skey,
  type plaintext <- plaintext,
  type ciphertext <- ciphertext.
*)

require FO_UU.
clone import FO_UU with
  type TT.PKE.pkey <- MLWE_PKE_Hash.pkey,
  type TT.PKE.skey <- MLWE_PKE_Hash.skey,
  type TT.PKE.ciphertext <- MLWE_PKE_Hash.ciphertext,
  type TT.plaintext <- MLWE_PKE_Hash.plaintext,
  type TT.randomness <- MLWE_PKE_Hash.randomness,
  op TT.kg = dmap drand kg,
  op TT.enc <- enc,
  op TT.dec <- dec,
  op TT.randd <- drand
  proof TT.kg_ll by (apply dmap_ll;apply drand_ll)
  proof TT.randd_ll by apply drand_ll. 
import TT.PKE.

(* remaining axioms
 TT.dplaintext_ll: is_lossless dplaintext
 TT.dplaintext_uni: is_uniform dplaintext
 TT.dplaintext_fu: is_full dplaintext
 TT.FinT.enum_spec: forall (x : plaintext), count (pred1 x) enum = 1
 TT.ge0_qH: 0 <= qH
 TT.ge0_qV: 0 <= qV
 TT.ge0_qP: 0 <= qP
 TT.ge0_qHC: 0 <= qHC
 dkey_ll: is_lossless dkey
 dkey_uni: is_uniform dkey
 dkey_fu: is_full dkey
 PseudoRF.dK_ll: is_lossless dK
 ge0_qHU: 0 <= qHU
 ge0_qD: 0 <= qD *)

module MLWE_PKE_HASH : Scheme = {

  proc kg() : pkey * skey = {
     var r,pk,sk;
     r <$ drand;
     (pk,sk) <- kg r;
     return (pk,sk);
  }

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
     var rr,c;
     rr <$ drand;
     c <- enc rr pk m;
     return c;
  }

  proc dec(sk : skey, c : ciphertext) : plaintext option = {
    var mo;
    mo <- dec sk c;
    return mo;
  }
}.

(******************************************************************)
(*       Equivalences between imperative and functional           *)
(******************************************************************)

module MLWE_PKE_HASH_PROC : Scheme = {

  proc kg_bridge() : pkey * skey = {
     var r,sd,s,e,t;
     r <$ drand;
     (sd,s,e) <- prg_kg r;
     t <-  (H sd) *^ s + e;
     return ((sd,t),s);
  }

  proc kg() : pkey * skey = {
    var sd,s,e,t;
    sd <$ dseed;
    s  <$ dshort;
    e  <$ dshort;
    t  <- (H sd) *^ s + e;
    return ((sd,t),s);
  }
  
  proc enc_bridge(pk : pkey, m : plaintext) : ciphertext = {
     var sd,t,rr,r,e1,e2,u,v;
     (sd,t) <- pk;
     rr <$ drand;
     (r,e1,e2) <- prg_enc rr;
     u <- m_transpose (H sd) *^ r + e1;
     v <- (t `<*>` r) &+ e2 &+ (m_encode m);
     return (u,v);
  }

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var sd, t,r,e1,e2,u,v;
    (sd,t) <- pk;
    r  <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    u  <- m_transpose (H sd) *^ r + e1;
    v  <- (t `<*>` r) &+ e2 &+ (m_encode m);
    return(u,v);
  }
  
  proc dec(sk : skey, c : ciphertext) : plaintext option = {
    var u,v;
    (u,v) <- c;
    return (Some (m_decode (v &- (sk `<*>` u))));
  }
}.
(* FIXME : weird parser accepts var (u,v) *)

equiv kg_proc : MLWE_PKE_HASH.kg ~ MLWE_PKE_HASH_PROC.kg : ={arg} ==> ={res}.
proc.
transitivity {1} { (pk,sk) <@ MLWE_PKE_HASH_PROC.kg_bridge(); }
              (true ==> ={pk,sk} )
              (true ==> pk{1} = (sd{2},t{2}) /\ sk{1} = s{2} ); 1,2:smt().
+ by inline*; auto; rewrite /kg /= /#.
inline *. wp 2 3.
conseq (_: true ==> ={sd,s,e}); 1: by smt(). 
rndsem{1} 0.
rndsem{2} 0.
transitivity {1} { (sd,s,e) <$ dmap drand prg_kg; }
    (true ==> ={sd,s,e})
    (true ==> ={sd,s,e});1,2:smt().
+ admit. (* FIXME: This should not be needed, as post does not mention r0 *)
by rnd;auto => />;rewrite -prg_kg_correct /#.
qed.

equiv enc_proc : MLWE_PKE_HASH.enc ~ MLWE_PKE_HASH_PROC.enc : ={arg} ==> ={res}.
proc.
transitivity {1} { c <@ MLWE_PKE_HASH_PROC.enc_bridge(pk,m); }
              (={pk,m} ==> ={c} )
              (={pk,m} ==> c{1} = (u{2},v{2})); 1,2:smt().
+ by inline*; auto; smt(). 
inline *; sp;wp 2 3.
conseq (_: ={pk,m} ==> ={r,e1,e2}); 1,2: by smt(). 
rndsem{1} 0.
rndsem{2} 0.

transitivity {1} { (r,e1,e2) <$ dmap drand prg_enc; }
    (={pk,m} ==> ={r,e1,e2})
    (={pk,m} ==> ={r,e1,e2}); 1,2:smt().
+ admit. (* FIXME: This should not be needed, as post does not mention rr0 *)
by rnd;auto => />;rewrite -prg_enc_correct /#.
qed.

section.

declare module A <: Adversary.

lemma cpa_proc &m : 
  Pr[CPA(MLWE_PKE_HASH,A).main() @ &m : res] =
   Pr[CPA(MLWE_PKE_HASH_PROC,A).main() @ &m : res].
proof. 
byequiv => //.
proc;call(_: true).
call(enc_proc);rnd.
call(_: true).
call(kg_proc).
by auto.
qed.

end section.

section.

declare module A <: CORR_ADV.

lemma corr_proc &m :
    Pr[Correctness_Adv(MLWE_PKE_HASH, A).main() @ &m : res] =
       Pr[Correctness_Adv(MLWE_PKE_HASH_PROC, A).main() @ &m : res].
byequiv => //.
proc;call(_: true); 1: by auto;rewrite /dec /#.
call(enc_proc).
call(_: true).
call(kg_proc).
by auto.
qed.

end section.


(******************************************************************)
(*       Game Hopping Security                                    *)
(******************************************************************)


(* Hop 1 *)

module MLWE_PKE_HASH1 = {
  proc kg() : pkey * skey = {
    var sd,s,t;
    sd <$ dseed;
    s  <$ dshort;
    t  <$ duni;
    return ((sd,t),s);
  }

  include MLWE_PKE_HASH_PROC [-kg]

}.

module B1(A : Adversary) : HAdv_T = {

  proc kg(sd : seed, t : vector) : pkey * skey = {
    return ( (sd,t),witness);
  }
  
  proc guess(sd, t : vector, uv : vector * R) : bool = {
    var pk, sk, m0, m1, c, b, b';
    (pk,sk) <@ kg(sd,uv.`1);
    (m0, m1) <@ A.choose(pk);
    b <$ {0,1};
    c <@ MLWE_PKE_HASH1.enc(pk, if b then m1 else m0);
    b' <@ A.guess(c);
    return b' = b;
  }
}.

section.

declare module A <: Adversary.

lemma hop1_left &m: 
  Pr[CPA(MLWE_PKE_HASH_PROC,A).main() @ &m : res] =
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
  Pr[CPA(MLWE_PKE_HASH1,A).main() @ &m : res].
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

module MLWE_PKE_HASH2 = {

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var _A,u, v;
    _A <- m_transpose (H pk.`1);
    u <$duni;
    v <$duni_R;
    return (u,v &+ m_encode m);
  }

  include MLWE_PKE_HASH1 [-enc]

}.

module B2(A : Adversary) : HAdv_T = {

  proc kg(sd : seed, t : vector) : pkey * skey = {
    return ((sd,t),witness);
  }
  
  proc enc(pk : pkey, m : plaintext, uv : vector * R) : ciphertext = {
    return ((uv.`1, uv.`2 &+ m_encode m));
  }
  
  proc guess(sd : seed, t : vector, uv : vector * R) : bool = {
    var pk, sk, m0, m1, c, b, b';
    (pk,sk) <@ kg(sd,t);
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
  Pr[CPA(MLWE_PKE_HASH1,A).main() @ &m : res] =
  Pr[MLWE_H(B2(A)).main(true,false) @ &m : res].
proof.
byequiv => //.
proc. inline *. 
swap {2} 7 -5.
swap {2} [11..12] -8.
swap {2} [14..17] -9.
seq 4 7 : (#pre /\ ={t,pk} /\ pk{2}.`1 = sd{2} /\ pk{2}.`2 = t{2});
  1: by auto; rnd{1};auto; smt(dshort_ll).
swap {2} [11..13] -9.
by wp; call(_: true); wp; rnd{2}; wp; rnd;rnd{2}; wp;
   rnd;rnd;wp;rnd;call(_: true); auto; smt(duni_ll).
qed.

lemma hop2_right &m: 
  Pr[MLWE_H(B2(A)).main(true,true) @ &m : res] = 
  Pr[CPA(MLWE_PKE_HASH2,A).main() @ &m : res].
proof.
byequiv => //.
proc; inline *. 
swap {1} 7 -5.
swap {1} [11..12] -8.
swap {1} [14..17] -9.
seq 7 4 : (#pre /\ ={t,pk} /\ (pk{2}).`1 = sd{2} /\ (pk{2}).`2 = t{2});
  1: by auto; rnd{2};auto; smt(dshort_ll).
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
    (m0, m1) <@ A.choose(sd,t);
    u <$duni;
    v <$duni_R;
    b' <@ A.guess((u,v));
    b <$ {0,1};
    return b = b';
  }
}.

local lemma game2_equiv &m :
  Pr[CPA(MLWE_PKE_HASH2,A).main() @ &m : res] = 
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
  Pr[CPA(MLWE_PKE_HASH,A).main() @ &m : res] -  1%r / 2%r =
    Pr[MLWE_H(B1(A)).main(false,false) @ &m : res] -
       Pr[MLWE_H(B1(A)).main(false,true) @ &m : res] + 
    Pr[MLWE_H(B2(A)).main(true,false) @ &m : res] -
       Pr[MLWE_H(B2(A)).main(true,true) @ &m : res].
proof.
move => A_guess_ll A_choose_ll.
rewrite (cpa_proc A &m).
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

declare module A <: CORR_ADV.

lemma correctness_noise &m :
  islossless A.find =>
  Pr[Correctness_Adv(MLWE_PKE_HASH, A).main() @ &m : res]  <= 
    Pr[CorrectnessBound.main() @ &m : res].
proof. 
move => A_ll.
rewrite (corr_proc A &m).
byequiv => //.
proc;inline *;swap {1} 8 4; swap {1} 6 5.
wp;call{1}(_: true ==> true).
swap {2} [2..3] -1.
auto => /> => sd _ s _ e  _ r _  e1 _ e2 _ m /=.
have -> : ((H sd) *^ s + e `<*>` r) &+ e2 &+ m_encode m &+ - (s `<*>` trmx (H sd) *^ r + e1)  = 
          m_encode m  + noise_exp (H sd) s e r e1 e2 m by rewrite /noise_exp /=;ring.
have -> := noise_exp_val (H sd) s e r e1 e2 m.
by smt(good_decode).
qed.

lemma correctness_theorem &m fail_prob :
 islossless A.find =>
   Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob =>
     Pr[ Correctness_Adv(MLWE_PKE_HASH,A).main() @ &m : res] <= fail_prob
 by smt(correctness_noise). 

end section.

section. 

import TT.PKEROM.
declare module A <:
       KEMROMx2.CCA_ADV{-OW_CPA, -BOWp, -OWL_CPA, -OWvsIND.Bowl, -RO.RO, -RO.FRO, -OW_PCVA, -TT.BasePKE, -TT.Correctness_Adv1, -TT.B, -TT.CountO, -TT.O_AdvOW, -TT.Gm, -RF.RF, -PseudoRF.PRF, -KEMROMx2.RO1.RO, -KEMROMx2.RO1.FRO, -KEMROMx2.RO2.RO, -KEMROMx2.CCA, -CountCCAO, -RO1E.FunRO, -UU2, -H2, -H2BOWMod, -Gm2, -Gm3}.

local equiv kg_same : 
  TT.BasePKE.kg  ~ MLWE_PKE_HASH.kg : true ==> ={res}.
proc;rndsem {2} 0. 
admit. (* FIXME: This should not be needed, as post does not mention r *)
qed.

module BUOOOWMod_Hx2 = CountHx2(BUUOWMod(A, TT.CountH(TT.H(TT.CO1(RO.RO))), TT.CountO(TT.G2_O(TT.CO1(RO.RO)))).H2B).
module BUOOOWMod_dec = 
KEMROMx2.CCA(CountHx2(BUUOWMod(A, TT.CountH(TT.H(TT.CO1(RO.RO))), TT.CountO(TT.G2_O(TT.CO1(RO.RO)))).H2B), UU2, A).O.
module BUOOOWModCPA_Hx2 = CountHx2(BUUOWMod(A, TT.CountH(RO.RO), TT.CountO(TT.O_AdvOW)).H2B).
module BUOOOWModCPA_dec = KEMROMx2.CCA(CountHx2(BUUOWMod(A, TT.CountH(RO.RO), TT.CountO(TT.O_AdvOW)).H2B), UU2, A).O.
module BUUCI_Hx2 = CountHx2(BUUCI(A, TT.CO1(RO.RO)).H2B).
module BUUCI_dec =  KEMROMx2.CCA(CountHx2(BUUCI(A, TT.CO1(RO.RO)).H2B), UU2, A).O.
module BUUC_Hx2 = CountHx2(BUUC(A, TT.CO1(RO.RO)).H2B).
module BUUC_dec =  KEMROMx2.CCA(CountHx2(BUUC(A, TT.CO1(RO.RO)).H2B), UU2, A).O.

lemma conclusion &m fail_prob :
    TT.qH = qHT + qHU + 1 =>
    TT.qV = 0 =>
    TT.qP = 0 =>
    TT.qH + 1 = TT.qHC =>
    TT.qHC < TT.FinT.card - 1 =>
 
    
 Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob =>

    (forall (RO <: KEMROMx2.POracle_x2{ -CountCCAO, -A} )
       (O <: KEMROMx2.CCA_ORC{ -CountCCAO, -A} ),
       hoare[ A(CountHx2(RO), O).guess :
               CountCCAO.c_ht = 0 /\ CountCCAO.c_hu = 0 /\ CountCCAO.c_dec = 0 ==>
               CountCCAO.c_ht <= qHT /\ CountCCAO.c_hu <= qHU]) =>

    (forall (H0 <: KEMROMx2.POracle_x2{ -A} ) (O <: KEMROMx2.CCA_ORC{ -A} ),
       islossless O.dec => islossless H0.get1 => islossless H0.get2 => islossless A(H0, O).guess) =>

    `|Pr[KEMROMx2.CCA(KEMROMx2.RO_x2(KEMROMx2.RO1.RO, KEMROMx2.RO2.RO), UU, A).main() @ &m : res] - 1%r / 2%r| <=
    2%r * `| Pr[MLWE_H(B1(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(A))))).main(false, false) @ &m : res] -
             Pr[MLWE_H(B1(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(A))))).main(false, true) @ &m : res] +
             Pr[MLWE_H(B2(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(A))))).main(true, false) @ &m : res] -
             Pr[MLWE_H(B2(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(A))))).main(true, true) @ &m : res] | +
    2%r * `| Pr[MLWE_H(B1(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(A)))))).main(false, false) @ &m : res] -
             Pr[MLWE_H(B1(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(A)))))).main(false, true) @ &m : res] +
             Pr[MLWE_H(B2(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(A)))))).main(true, false) @ &m : res] -
             Pr[MLWE_H(B2(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(A)))))).main(true, true) @ &m : res]| +
    (3%r * (qHT + qHU + 3)%r + 2%r) * fail_prob +
    `|Pr[J.IND(PseudoRF.PRF, D(A)).main() @ &m : res] - Pr[J.IND(RF.RF, D(A)).main() @ &m : res]| +
    2%r * (qHT + qHU + 2)%r * eps_msg.
proof.
move => qvals qv0 qp0 qhv qhcsmall fail_probE A_count A_ll.

have := (conclusion_cpa A &m qvals qv0 qp0 qhv qhcsmall A_count A_ll).

have -> : 
   Pr[TT.PKE.CPA(TT.BasePKE, OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(A))))).main() @ &m : res] = 
    Pr[TT.PKE.CPA(MLWE_PKE_HASH, OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(A))))).main() @ &m : res].
+ byequiv => //;proc; seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.
have -> :  
    Pr[TT.PKE.CPA(TT.BasePKE, OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(A)))).main() @ &m : res]  = 
     Pr[TT.PKE.CPA(MLWE_PKE_HASH, OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(A)))).main() @ &m : res] .
+ byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

have := correctness_theorem (BOWp(TT.BasePKE, TT.AdvOW_query(BUUOWMod(A)))) &m fail_prob _; 1: by islossless.
have <- : 
    Pr[TT.PKE.Correctness_Adv(TT.BasePKE, BOWp(TT.BasePKE, TT.AdvOW_query(BUUOWMod(A)))).main() @ &m : res] = 
   Pr[TT.PKE.Correctness_Adv(MLWE_PKE_HASH, BOWp(TT.BasePKE, TT.AdvOW_query(BUUOWMod(A)))).main() @ &m : res].
+ byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

move => ?.

have := correctness_theorem (BOWp(TT.BasePKE, TT.AdvOW(BUUOWMod(A)))) &m fail_prob _; 1: by islossless.
have <- : 
    Pr[TT.PKE.Correctness_Adv(TT.BasePKE, BOWp(TT.BasePKE, TT.AdvOW(BUUOWMod(A)))).main() @ &m : res] = 
    Pr[TT.PKE.Correctness_Adv(MLWE_PKE_HASH, BOWp(TT.BasePKE, TT.AdvOW(BUUOWMod(A)))).main() @ &m : res].
+ byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

move => ?. 

have := correctness_theorem (TT.B(TT.AdvCorr(BUUOWMod(A)), RO.RO)) &m fail_prob _.
+  islossless; last by smt(drange_ll TT.ge0_qH).
   by apply(A_ll BUOOOWMod_Hx2 BUOOOWMod_dec);islossless.

have <- : 
    Pr[TT.PKE.Correctness_Adv(TT.BasePKE, TT.B(TT.AdvCorr(BUUOWMod(A)), RO.RO)).main() @ &m : res] = 
    Pr[TT.PKE.Correctness_Adv(MLWE_PKE_HASH, TT.B(TT.AdvCorr(BUUOWMod(A)), RO.RO)).main() @ &m : res].
 + byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

move => ?. 

have := correctness_theorem (TT.B(BUUCI(A), RO.RO)) &m fail_prob _.
+  islossless; last by smt(drange_ll TT.ge0_qH).
   by apply(A_ll BUUCI_Hx2 BUUCI_dec);islossless.
have <- : 
    Pr[TT.PKE.Correctness_Adv(TT.BasePKE, TT.B(BUUCI(A), RO.RO)).main() @ &m : res] = 
    Pr[TT.PKE.Correctness_Adv(MLWE_PKE_HASH, TT.B(BUUCI(A), RO.RO)).main() @ &m : res].
+ byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

move => ?. 

have := correctness_theorem (TT.B(BUUC(A), RO.RO)) &m fail_prob _.
+  islossless; last by smt(drange_ll TT.ge0_qH).
   by apply(A_ll BUUC_Hx2 BUUC_dec);islossless.

have <- : 
    Pr[TT.PKE.Correctness_Adv(TT.BasePKE, TT.B(BUUC(A), RO.RO)).main() @ &m : res] = 
    Pr[TT.PKE.Correctness_Adv(MLWE_PKE_HASH, TT.B(BUUC(A), RO.RO)).main() @ &m : res].
+ byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

move => ?.

have := main_theorem (OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(A))))) &m _ _.
+ islossless.
   by apply(A_ll BUOOOWModCPA_Hx2 BUOOOWModCPA_dec);islossless.
+ by islossless.
have := main_theorem (OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(A)))) &m _ _.
search drange.
+ islossless; last by smt(drange_ll ge0_qHT ge0_qHU) .
   by apply(A_ll BUOOOWModCPA_Hx2 BUOOOWModCPA_dec);islossless.
+ by islossless.

by smt(ge0_qHU ge0_qHT). 
qed.


end section. 
end MLWE_PKE_Hash.


