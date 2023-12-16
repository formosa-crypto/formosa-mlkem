require import AllCore Distr List SmtMap Dexcepted PKE_ROM StdOrder.
require (**RndExcept **) MLWE FLPRG.

theory MLWE_PKE_Hash.

clone import MLWE as MLWE_.
import Matrix_.
import ZR.

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

type raw_pkey  = seed * vector.
type raw_skey  = vector.

op pk_encode : raw_pkey -> pkey.
op sk_encode : raw_skey -> skey.
op pk_decode : pkey -> raw_pkey.
op sk_decode : skey -> raw_skey.

axiom pk_encodeK : cancel pk_encode pk_decode.
axiom sk_encodeK : cancel sk_encode sk_decode.

(******************************************************************)
(*                The Hashed Encryption Scheme                     *)

type randomness.

op [uniform full lossless]drand : randomness distr.

op prg_kg : randomness -> seed * vector * vector.

op prg_kg_ideal  = 
     dlet dseed
       (fun (sd : seed) => 
          dlet dshort (fun (s : vector) => 
               dmap dshort (fun (e : vector) => (sd, s, e)))).

op prg_enc : randomness -> vector * vector * R.

op prg_enc_ideal = 
     dlet dshort
       (fun (r : vector) => 
          dlet dshort (fun (e1 : vector) => 
               dmap dshort_R (fun (e2 : R) => (r, e1, e2)))).

op kg(r : randomness) : pkey * skey = 
   let (sd,s,e) = prg_kg r in
   let t =  (H sd) *^ s + e in
       (pk_encode (sd,t),sk_encode s).

op enc(rr : randomness, pk : pkey, m : plaintext) : ciphertext = 
    let (sd,t) = pk_decode pk in
    let (r,e1,e2) = prg_enc rr in
    let u = m_transpose (H sd) *^ r + e1 in
    let v = (t `<*>` r) &+ e2 &+ (m_encode m) in
        c_encode (u,v).

op dec(sk : skey, c : ciphertext) : plaintext option =
    let (u,v) = c_decode c in
       Some (m_decode (v &- (sk_decode sk `<*>` u))).

(******************************************************************)
(*    The Security Games                                          *)

(* We now get them from the PKE theory for the UU+TT transformation.
clone import PKE with 
  type pkey <- pkey,
  type skey <- skey,
  type plaintext <- plaintext,
  type ciphertext <- ciphertext.
*)

require FO_MLKEM.
clone import FO_MLKEM with
  type UU.TT.PKE.pkey <- MLWE_PKE_Hash.pkey,
  type UU.TT.PKE.skey <- MLWE_PKE_Hash.skey,
  type UU.TT.PKE.ciphertext <- MLWE_PKE_Hash.ciphertext,
  type UU.TT.plaintext <- MLWE_PKE_Hash.plaintext,
  type UU.TT.randomness <- MLWE_PKE_Hash.randomness,
  op UU.TT.kg = dmap drand kg,
  op UU.TT.enc <- enc,
  op UU.TT.dec <- dec,
  op UU.TT.randd <- drand
  proof UU.TT.kg_ll by (apply dmap_ll;apply drand_ll)
  proof UU.TT.randd_ll by apply drand_ll.
(* remaining axioms
 UU.TT.dplaintext_ll: is_lossless dplaintext
 UU.TT.dplaintext_uni: is_uniform dplaintext
 UU.TT.dplaintext_fu: is_full dplaintext
 UU.TT.FinT.enum_spec: forall (x : plaintext), count (pred1 x) enum = 1
 UU.TT.ge0_qH: 0 <= qH
 UU.TT.ge0_qV: 0 <= qV
 UU.TT.ge0_qP: 0 <= qP
 UU.TT.ge0_qHC: 0 <= qHC
 UU.dkey_ll: is_lossless dkey
 UU.dkey_uni: is_uniform dkey
 UU.dkey_fu: is_full dkey
 UU.PseudoRF.dK_ll: is_lossless dK
 UU.ge0_qHT: 0 <= qHT
 UU.ge0_qHU: 0 <= qHU
 UU.ge0_qD: 0 <= qD
 KEMROM.dkey_ll: is_lossless UU.dkey
 KEMROM.dkey_uni: is_uniform UU.dkey
 KEMROM.dkey_fu: is_full UU.dkey
 ge0_qHK: 0 <= qHK *)

import UU.TT.PKE.

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
     return (pk_encode (sd,t),sk_encode s);
  }

  proc kg() : pkey * skey = {
    var sd,s,e,t;
    sd <$ dseed;
    s  <$ dshort;
    e  <$ dshort;
    t  <- (H sd) *^ s + e;
    return (pk_encode (sd,t),sk_encode s);
  }
  
  proc enc_bridge(pk : pkey, m : plaintext) : ciphertext = {
     var sd,t,rr,r,e1,e2,u,v;
     (sd,t) <- pk_decode pk;
     rr <$ drand;
     (r,e1,e2) <- prg_enc rr;
     u <- m_transpose (H sd) *^ r + e1;
     v <- (t `<*>` r) &+ e2 &+ (m_encode m);
     return c_encode (u,v);
  }

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var sd, t,r,e1,e2,u,v;
    (sd,t) <- pk_decode pk;
    r  <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    u  <- m_transpose (H sd) *^ r + e1;
    v  <- (t `<*>` r) &+ e2 &+ (m_encode m);
    return c_encode (u,v);
  }
  
  proc dec(sk : skey, c : ciphertext) : plaintext option = {
    var u,v;
    (u,v) <- c_decode c;
    return (Some (m_decode (v &- (sk_decode sk `<*>` u))));
  }
}.

(* FIXME : weird parser accepts var (u,v) *)

(* Equivalence will hold modulo the prgs working correctly *)
clone import FLPRG as PRG_KG with
  type seed <- randomness,
  type output <- seed * vector * vector,
  op prg <- prg_kg,
  op dseed <- drand,
  op dout <- prg_kg_ideal
  proof *. 

clone import FLPRG as PRG_ENC with
  type seed <- randomness,
  type output <- vector * vector * R,
  op prg <- prg_enc,
  op dseed <- drand,
  op dout <- prg_enc_ideal
  proof*.

module MLWE_PKE_HASH_PRG : Scheme  = {
  var sd : seed
  var s  : vector
  var e  : vector
  var r  : vector
  var e1 : vector
  var e2 : R

  proc kg() : pkey * skey = {
     var t;
     t <-  (H sd) *^ s + e;
     return (pk_encode (sd,t),sk_encode s);
  }

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
     var sd,t,u,v;
     (sd,t) <- pk_decode pk;
     u <- m_transpose (H sd) *^ r + e1;
     v <- (t `<*>` r) &+ e2 &+ (m_encode m);
     return c_encode (u,v);
  }

  include MLWE_PKE_HASH [dec]
}.

module (D_KG(A : Adversary) : PRG_KG.Distinguisher)  = {
   proc distinguish(sd : seed, s : vector, e : vector) : bool = {
       var coins,b;
       MLWE_PKE_HASH_PRG.sd <- sd;
       MLWE_PKE_HASH_PRG.s <- s;
       MLWE_PKE_HASH_PRG.e <- e;
       coins <$ drand;
       (MLWE_PKE_HASH_PRG.r,MLWE_PKE_HASH_PRG.e1,MLWE_PKE_HASH_PRG.e2) <- prg_enc coins;
       b <@ CPA(MLWE_PKE_HASH_PRG,A).main();
       return b;
   }      
}.

module (D_ENC(A : Adversary) : PRG_ENC.Distinguisher) = {
   proc distinguish(r : vector, e1 : vector, e2 : R) : bool = {
       var b;
       (MLWE_PKE_HASH_PRG.sd,MLWE_PKE_HASH_PRG.s,MLWE_PKE_HASH_PRG.e) <$ prg_kg_ideal;
       MLWE_PKE_HASH_PRG.r <- r;
       MLWE_PKE_HASH_PRG.e1 <- e1;
       MLWE_PKE_HASH_PRG.e2 <- e2;       
       b <@ CPA(MLWE_PKE_HASH_PRG,A).main();
       return b;
   }      
}.

section.

declare module A <: Adversary {-MLWE_PKE_HASH_PRG}.

lemma cpa_proc &m : 
  Pr[CPA(MLWE_PKE_HASH,A).main() @ &m : res] -
   Pr[CPA(MLWE_PKE_HASH_PROC,A).main() @ &m : res] = 
     Pr [ PRG_KG.IND(PRG_KG.PRGr,D_KG(A)).main() @ &m : res ] -
        Pr [ PRG_KG.IND(PRG_KG.PRGi,D_KG(A)).main() @ &m : res ] +
     Pr [ PRG_ENC.IND(PRG_ENC.PRGr,D_ENC(A)).main() @ &m : res ] -
        Pr [ PRG_ENC.IND(PRG_ENC.PRGi, D_ENC(A)).main() @ &m : res ].
proof. 
have -> : Pr[CPA(MLWE_PKE_HASH,A).main() @ &m : res]  = 
  Pr [ PRG_KG.IND(PRG_KG.PRGr,D_KG(A)).main() @ &m : res ].
+ byequiv => //.
  proc;inline *.
  swap {1} 8 -6. 
  wp;call(_: true).
  wp;rnd;call(_: true).
  by auto => /> /#.

have -> : Pr[CPA(MLWE_PKE_HASH_PROC, A).main() @ &m : res]   = 
        Pr[PRG_ENC.IND(PRGi, D_ENC(A)).main() @ &m : res].
+ byequiv => //.
  proc;inline *. swap {1} [11..13] -7. swap {2} 3 -1.  swap {2} 6 -4. swap {2} 4 5.
seq 0 1 : #pre; 1: by auto.
seq 3 1 : (#pre /\
    (sd,s,e){1} = 
    (MLWE_PKE_HASH_PRG.sd, MLWE_PKE_HASH_PRG.s, MLWE_PKE_HASH_PRG.e){2}); 1: by rndsem*{1} 0;auto => />.
seq 3 6 : (#pre /\
    (r,e1,e2){1} = 
    (MLWE_PKE_HASH_PRG.r, MLWE_PKE_HASH_PRG.e1, MLWE_PKE_HASH_PRG.e2){2}); 1: by rndsem*{1} 0;auto => />. 
  by wp;call(_: true);wp;rnd;call(_: true);auto => />.

have -> : Pr[PRG_KG.IND(PRG_KG.PRGi, D_KG(A)).main() @ &m : res] =
          Pr[PRG_ENC.IND(PRG_ENC.PRGr, D_ENC(A)).main() @ &m : res]; last by ring.
by byequiv => //;proc;inline *;swap {2} 6 -5;sim;wp;rnd;wp;rnd;wp;rnd{1};auto => />.
qed.

end section.

module (DC_KG(A : CORR_ADV) : PRG_KG.Distinguisher)  = {
   proc distinguish(sd : seed, s : vector, e : vector) : bool = {
       var coins,b;
       MLWE_PKE_HASH_PRG.sd <- sd;
       MLWE_PKE_HASH_PRG.s <- s;
       MLWE_PKE_HASH_PRG.e <- e;
       coins <$ drand;
       (MLWE_PKE_HASH_PRG.r,MLWE_PKE_HASH_PRG.e1,MLWE_PKE_HASH_PRG.e2) <- prg_enc coins;
       b <@ Correctness_Adv(MLWE_PKE_HASH_PRG,A).main();
       return b;
   }      
}.

module (DC_ENC(A : CORR_ADV) : PRG_ENC.Distinguisher) = {
   proc distinguish(r : vector, e1 : vector, e2 : R) : bool = {
       var b;
       (MLWE_PKE_HASH_PRG.sd,MLWE_PKE_HASH_PRG.s,MLWE_PKE_HASH_PRG.e) <$ prg_kg_ideal;
       MLWE_PKE_HASH_PRG.r <- r;
       MLWE_PKE_HASH_PRG.e1 <- e1;
       MLWE_PKE_HASH_PRG.e2 <- e2;       
       b <@ Correctness_Adv(MLWE_PKE_HASH_PRG,A).main();
       return b;
   }      
}.

section.

declare module A <: CORR_ADV   {-MLWE_PKE_HASH_PRG}.

lemma corr_proc &m :
    Pr[Correctness_Adv(MLWE_PKE_HASH, A).main() @ &m : res] -
       Pr[Correctness_Adv(MLWE_PKE_HASH_PROC, A).main() @ &m : res] = 
     Pr [ PRG_KG.IND(PRG_KG.PRGr,DC_KG(A)).main() @ &m : res ] -
        Pr [ PRG_KG.IND(PRG_KG.PRGi,DC_KG(A)).main() @ &m : res ] +
     Pr [ PRG_ENC.IND(PRG_ENC.PRGr,DC_ENC(A)).main() @ &m : res ] -
        Pr [ PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(A)).main() @ &m : res ].
have -> : Pr[Correctness_Adv(MLWE_PKE_HASH,A).main() @ &m : res]  = 
  Pr [ PRG_KG.IND(PRG_KG.PRGr,DC_KG(A)).main() @ &m : res ].
+ byequiv => //.
  proc;inline *.
  swap {1} 7 -5. 
  wp;call(_: true).
  by auto => /> /#.
have -> : Pr[Correctness_Adv(MLWE_PKE_HASH_PROC, A).main() @ &m : res]   = 
        Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(A)).main() @ &m : res].
+ byequiv => //. 
  proc;inline *. swap {1} [10..12] -6. swap {2} 3 -1.  swap {2} 6 -4. swap {2} 4 5.
seq 0 1 : #pre; 1: by auto.
seq 3 1 : (#pre /\
    (sd,s,e){1} = 
    (MLWE_PKE_HASH_PRG.sd, MLWE_PKE_HASH_PRG.s, MLWE_PKE_HASH_PRG.e){2}); 1: by rndsem*{1} 0;auto => />.
seq 3 6 : (#pre /\
    (r,e1,e2){1} = 
    (MLWE_PKE_HASH_PRG.r, MLWE_PKE_HASH_PRG.e1, MLWE_PKE_HASH_PRG.e2){2}); 1: by rndsem*{1} 0;auto => />. 
  by wp;call(_: true);auto => /> /#.

have -> : Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(A)).main() @ &m : res] =
          Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(A)).main() @ &m : res]; last by ring.
by byequiv => //;proc;inline *;swap {2} 6 -5;sim;wp;rnd;wp;rnd;wp;rnd{1};auto => />.
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
    return (pk_encode (sd,t), sk_encode s);
  }

  include MLWE_PKE_HASH_PROC [-kg]

}.

module B1(A : Adversary) : HAdv_T = {

  proc kg(sd : seed, t : vector) : pkey * skey = {
    return (pk_encode (sd,t),witness);
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
    _A <- m_transpose (H (pk_decode pk).`1);
    u <$duni;
    v <$duni_R;
    return c_encode (u,v &+ m_encode m);
  }

  include MLWE_PKE_HASH1 [-enc]

}.

module B2(A : Adversary) : HAdv_T = {

  proc kg(sd : seed, t : vector) : pkey * skey = {
    return (pk_encode (sd,t),witness);
  }
  
  proc enc(pk : pkey, m : plaintext, uv : vector * R) : ciphertext = {
    return c_encode ((uv.`1, uv.`2 &+ m_encode m));
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
seq 4 7 : (#pre /\ ={t,pk} /\ (pk_decode pk{2}).`1 = sd{2} /\ (pk_decode pk{2}).`2 = t{2});
  1: by auto; rnd{1};auto; smt(pk_encodeK dshort_ll).
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
seq 7 4 : (#pre /\ ={t,pk} /\ (pk_decode pk{2}).`1 = sd{2} /\ (pk_decode pk{2}).`2 = t{2});
  1: by auto; rnd{2};auto; smt(pk_encodeK dshort_ll).
swap {1} [11..13] -9.
by wp; call(_: true);wp;rnd;wp;rnd{1};rnd;wp;rnd{1};rnd{1};wp;rnd; 
   call(_: true); auto;smt(duni_ll dshort_ll).
qed.

end section.

(* Final game analysis *)

section.

declare module A <: Adversary {-MLWE_PKE_HASH_PRG}.

local module Game2(A : Adversary) = {
  proc main() = {
    var sd, s, t, m0, m1, u, v, b, b';
    sd <$ dseed;
    s <$ dshort;
    t <$ duni;
    (m0, m1) <@ A.choose(pk_encode (sd,t));
    u <$duni;
    v <$duni_R;
    b' <@ A.guess(c_encode (u,v));
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
  `| Pr[CPA(MLWE_PKE_HASH,A).main() @ &m : res] -  1%r / 2%r | <=
    `| Pr[MLWE_H(B1(A)).main(false,false) @ &m : res] -
       Pr[MLWE_H(B1(A)).main(false,true) @ &m : res] | + 
    `| Pr[MLWE_H(B2(A)).main(true,false) @ &m : res] -
       Pr[MLWE_H(B2(A)).main(true,true) @ &m : res] | +
    `| Pr [ PRG_KG.IND(PRG_KG.PRGr,D_KG(A)).main() @ &m : res ] -
        Pr [ PRG_KG.IND(PRG_KG.PRGi,D_KG(A)).main() @ &m : res ] | +
    `| Pr [ PRG_ENC.IND(PRG_ENC.PRGr,D_ENC(A)).main() @ &m : res ] -
        Pr [ PRG_ENC.IND(PRG_ENC.PRGi, D_ENC(A)).main() @ &m : res ] |.
proof.
move => A_guess_ll A_choose_ll.
have := (cpa_proc A &m).
rewrite (hop1_left A &m).
rewrite (hop1_right A &m).
rewrite (hop2_left A &m).
rewrite (hop2_right A &m).
rewrite (game2_equiv &m).
rewrite (game2_prob &m _ _) //.
by smt().
qed.

end section.

(******************************************************************)
(*                        Correctness                             *)
(* We consider adversarial correctness, where the attacker can    *)
(* choose the message where correctness is checked after seeing   *)
(* the public-key. This setting seems to be the one in which      *)
(* failure probability is considered in the FO construction.      *)
(******************************************************************)

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
module CorrectnessAdvNoise(A : CORR_ADV) = {
  proc main() = {
    var sd,s,e,_A,r,e1,e2,m,n;
    sd <$ dseed;
    _A <- H sd;
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    m <@ A.find(pk_encode (sd,_A *^ s + e),sk_encode s);
    n <- noise_exp _A s e r e1 e2 m;
    return (!under_noise_bound n max_noise);
  }
}.

section.

declare module A <: CORR_ADV  {-MLWE_PKE_HASH_PRG}.

lemma correctness_noise &m:
  Pr[ Correctness_Adv(MLWE_PKE_HASH,A).main() @ &m : res]  <= 
       Pr[ CorrectnessAdvNoise(A).main() @ &m : res] + 
     Pr [ PRG_KG.IND(PRG_KG.PRGr,DC_KG(A)).main() @ &m : res ] -
        Pr [ PRG_KG.IND(PRG_KG.PRGi,DC_KG(A)).main() @ &m : res ] +
     Pr [ PRG_ENC.IND(PRG_ENC.PRGr,DC_ENC(A)).main() @ &m : res ] -
        Pr [ PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(A)).main() @ &m : res ].

proof.
have  CPROC := (corr_proc A &m).
have : Pr[Correctness_Adv(MLWE_PKE_HASH_PROC, A).main() @ &m : res] <=
   Pr[ CorrectnessAdvNoise(A).main() @ &m : res]; last by smt().    
byequiv => //.
proc.  
inline {1} 4. inline {1} 3. inline {1} 1. 
swap {1} 7 -1.
swap {1} 9 -2.
swap {1} 10 -8.
swap {1} [11..12] -5.
seq 11 8 : ( 
           ={e2,e1,r,s,e,sd,m} /\
           sd0{1} = sd{1} /\
           (pk_decode pk{1}).`1 = sd{1} /\
           (pk_decode pk{1}).`2 = t{1} /\
           sk_decode sk{1} = s{1} /\
           t{1} = H sd0{1} *^ s{1} + e{1} /\
           H sd0{1} = _A{2}); last first.
+ inline *; auto => />; move => &1 &2  ->.
  rewrite  encode_noise.
  rewrite (_: 
     ((((H (pk_decode pk{1}).`1) *^ (sk_decode sk){1} + e{2}) `<*>` r{2}) &+
     e2{2} &+ m_encode m{2} &+
     rnd_err_v
       ((((H (pk_decode pk{1}).`1) *^ (sk_decode sk){1}  + e{2}) `<*>` r{2}) &+
        e2{2} &+ m_encode m{2}) &-
     ((sk_decode sk){1}  `<*>`
      (m_transpose ((H (pk_decode pk{1}).`1)) *^ r{2} + e1{2} +
       rnd_err_u (m_transpose ((H (pk_decode pk{1}).`1)) *^ r{2} + e1{2})))) = 
  m_encode m{2} &+ noise_exp ((H (pk_decode pk{1}).`1)) (sk_decode sk){1}  e{2} r{2} e1{2}
                     e2{2} m{2});  
   1: by rewrite noise_exp_val /= matrix_props1 matrix_props2; ring.
   by smt(good_decode).

by call(_: true);auto => />; smt(get_setE sk_encodeK pk_encodeK).
qed.

end section.

axiom noise_commutes n n' maxn (b : int) : 
  under_noise_bound n' b =>
  under_noise_bound n (maxn - b) =>
  under_noise_bound (n &+ n') maxn.

axiom noise_preserved n maxn :
  under_noise_bound n maxn = 
  under_noise_bound (ZR.([-]) n) maxn.

op noise_exp_part1 _A s e r e1 e2 = 
  let u = m_transpose _A *^ r + e1 in
  let cu = rnd_err_u u in
    ((e `<*>` r) &- (s `<*>` e1) &+ e2 ) &-   (s `<*>` cu).

op noise_exp_part2 _A s e r e2 m =
  let t = _A *^ s + e in
  let v = (t `<*>` r) &+ e2 &+ (m_encode m) in
  let cv = rnd_err_v v in
  cv.


lemma parts_work _A s e r e1 e2 m :
  noise_exp _A s e r e1 e2 m =
  noise_exp_part1 _A s e r e1 e2 &+ noise_exp_part2 _A s e r e2 m 
  by rewrite noise_exp_val /noise_exp_simpl /noise_exp_part1 /noise_exp_part2 /=; ring. 

module CB(A : CORR_ADV) = {
  var s : vector
  var e : vector
  var _A : matrix
  var r : vector
  var e1 : vector
  var e2 : R
  var n1 : R
  var n2 : R
  var u : vector
  var cu : vector
  var m : plaintext


  proc main() = {
    var sd;
    sd <$ dseed;
    _A <- H sd;
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    m <@ A.find(pk_encode (sd,_A *^ s + e),sk_encode s);
    n1 <- noise_exp_part1 _A s e r e1 e2;
    n2 <- noise_exp_part2 _A s e r e2 m;
  }
}.

(** OVER ESTIMATE THE LAST TERM **)

op cv_bound_max : int.
axiom cv_bound_valid _A s e r e2 m :
  s \in dshort =>
  e \in dshort =>
  r \in dshort =>
  e2 \in dshort_R =>
  let t = _A *^ s + e in
  let v = (t `<*>` r) &+ e2 &+ (m_encode m) in
  under_noise_bound (rnd_err_v v) cv_bound_max.

module CorrectnessBound = {

  proc main() = {
    var sd, _A, r,s,e,e1,e2,n;
    sd <$ dseed;
    _A <- H sd;
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    n <- noise_exp_part1 _A s e r e1 e2;
    return !under_noise_bound n (max_noise - cv_bound_max);
  }
}.

section.

declare module A <: CORR_ADV {-CB, -MLWE_PKE_HASH_PRG}.

lemma correctness_split &m cv_bound failprob1 failprob2:
  Pr[ CB(A).main() @ &m : 
        !under_noise_bound CB.n1 (max_noise - cv_bound)] <= failprob1 =>
  Pr[ CB(A).main() @ &m : 
        !under_noise_bound CB.n2 (cv_bound)] <= failprob2 =>
  Pr[ CorrectnessAdvNoise(A).main() @ &m : res] <=
       failprob1 + failprob2.
proof.
move => bd1 bd2.
have  : Pr[CorrectnessAdvNoise(A).main() @ &m : res] <=
  Pr[CB(A).main() @ &m : 
        ! under_noise_bound CB.n1 (max_noise - cv_bound) \/
        ! under_noise_bound CB.n2 cv_bound ]; last by rewrite Pr[mu_or];smt(mu_bounded).
byequiv => //.
proc; inline *.
wp;call(_: true). 
by auto => />; by smt(parts_work noise_commutes noise_preserved).
qed.

(*******)


lemma correctness_bound_aux &m  : 
  islossless A.find =>
  Pr[ CB(A).main() @ &m : 
        !under_noise_bound CB.n1 (max_noise - cv_bound_max)] =
  Pr[ CorrectnessBound.main() @ &m : res].
move => A_ll.
byequiv => //; proc; inline *.
wp;call{1}(_: true ==> true). 
by auto => />.
qed.


lemma cv_max &m : 
  Pr[CB(A).main() @ &m : ! under_noise_bound CB.n2 cv_bound_max] = 0%r.
byphoare=> //.
hoare; proc; inline *.
wp;call(_: true). 
auto => /> sd Hsd r Hr s Hs e He e1 He1 e2 He2 m. 
rewrite /noise_exp_part2 /=.
by have /= := (cv_bound_valid (H sd) s e r e2 m Hs He Hr He2).
qed.

lemma correctness_theorem &m :
  islossless A.find =>
  Pr[ Correctness_Adv(MLWE_PKE_HASH,A).main() @ &m : res]  <= 
    Pr[ CorrectnessBound.main() @ &m : res] + 
     `| Pr [ PRG_KG.IND(PRG_KG.PRGr,DC_KG(A)).main() @ &m : res ] -
        Pr [ PRG_KG.IND(PRG_KG.PRGi,DC_KG(A)).main() @ &m : res ] | +
     `| Pr [ PRG_ENC.IND(PRG_ENC.PRGr,DC_ENC(A)).main() @ &m : res ] -
        Pr [ PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(A)).main() @ &m : res ] |.

move => A_ll.
have /= CSPLIT := (correctness_split &m cv_bound_max (Pr[ CorrectnessBound.main() @ &m : res]) 0%r _ _).
+ by rewrite (correctness_bound_aux &m A_ll).
+ by have := cv_max &m; smt().
have CPROC := (correctness_noise A &m).
by smt().
qed.

end section.


(* INSTANTIATION OF THE FO_K TRANSFORM *)

import UU.TT.PKEROM.
import UU.

equiv kg_same : 
  TT.BasePKE.kg  ~ MLWE_PKE_HASH.kg : true ==> ={res}.
proc;rndsem*{2} 0.
rnd;auto => />.
have -> : (fun (r : randomness) => ((kg r).`1, (kg r).`2))
          = kg; by smt().
qed.

(* correctness *)

lemma correctness &m fail_prob :
    Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob =>
    TT.qHC = 0 =>
    1 < TT.FinT.card =>
    
Pr[KEMROM.Correctness(KEMROM.RO.RO, FO_K).main() @ &m : res] <= 
   fail_prob +
     `| Pr [ PRG_KG.IND(PRG_KG.PRGr,DC_KG(TT.B(B_UC, RO.RO))).main() @ &m : res ] -
        Pr [ PRG_KG.IND(PRG_KG.PRGi,DC_KG(TT.B(B_UC, RO.RO))).main() @ &m : res ] | +
     `| Pr [ PRG_ENC.IND(PRG_ENC.PRGr,DC_ENC(TT.B(B_UC, RO.RO))).main() @ &m : res ] -
        Pr [ PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(TT.B(B_UC, RO.RO))).main() @ &m : res ] |.

proof.
move => cb qHC0 msp2.
have := (correctness_fo_k &m qHC0 msp2).
have -> : Pr[TT.PKE.Correctness_Adv(TT.BasePKE, TT.B(B_UC, RO.RO)).main() @ &m : res] =
          Pr[TT.PKE.Correctness_Adv(MLWE_PKE_HASH, TT.B(B_UC, RO.RO)).main() @ &m : res].
+ byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

have := correctness_theorem (TT.B(B_UC, RO.RO)) &m  _. 
+ by islossless;smt(drange_ll).
by smt().
qed.

(* security *)

section. 

declare module A <:
    KEMROM.CCA_ADV{ -KEMROM.RO.RO.m, -OW_CPA, -BOWp, -OWL_CPA, -OWvsIND.Bowl, -RO.RO, -RO.FRO, -OW_PCVA, -TT.BasePKE, -TT.B, -TT.Correctness_Adv1, -TT.CountO, -TT.O_AdvOW, -TT.Gm, -RF.RF, -PseudoRF.PRF, -KEMROMx2.RO1.RO, -KEMROMx2.RO1.FRO, -KEMROMx2.RO2.RO, -KEMROMx2.RO2.FRO, -KEMROMx2.CCA, -CountHx2, -RO1E.FunRO, -UU2, -H2, -H2BOWMod, -Gm2, -Gm3, -KEMROM.CCA, -B1x2, -CB, -MLWE_PKE_HASH_PRG}.


module BUOOOWMod_Hx2 = CountH(B1x2(A, CountHx2(BUUOWMod(B1x2(A), TT.CountH(TT.H(TT.CO1(RO.RO))), TT.CountO(TT.G2_O(TT.CO1(RO.RO)))).H2B), KEMROMx2.CCA(CountHx2(BUUOWMod(B1x2(A), TT.CountH(TT.H(TT.CO1(RO.RO))), TT.CountO(TT.G2_O(TT.CO1(RO.RO)))).H2B), UU2, B1x2(A)).O).BH).
module BUOOOWMod_dec = KEMROMx2.CCA(CountHx2(BUUOWMod(B1x2(A), TT.CountH(TT.H(TT.CO1(RO.RO))), TT.CountO(TT.G2_O(TT.CO1(RO.RO)))).H2B), UU2, B1x2(A)).O.

module BUOOOWModCPA_Hx2 = CountH(B1x2(A, CountHx2(BUUOWMod(B1x2(A), TT.CountH(RO.RO), TT.CountO(TT.O_AdvOW)).H2B), KEMROMx2.CCA(CountHx2(BUUOWMod(B1x2(A), TT.CountH(RO.RO), TT.CountO(TT.O_AdvOW)).H2B), UU2, B1x2(A)).O).BH).
module BUOOOWModCPA_dec = KEMROMx2.CCA(CountHx2(BUUOWMod(B1x2(A), TT.CountH(RO.RO), TT.CountO(TT.O_AdvOW)).H2B), UU2, B1x2(A)).O.

module BUUCI_Hx2 = CountH(B1x2(A, CountHx2(BUUCI(B1x2(A), TT.CO1(RO.RO)).H2B), KEMROMx2.CCA(CountHx2(BUUCI(B1x2(A), TT.CO1(RO.RO)).H2B), UU2, B1x2(A)).O).BH).
module BUUCI_dec = KEMROMx2.CCA(CountHx2(BUUCI(B1x2(A), TT.CO1(RO.RO)).H2B), UU2, B1x2(A)).O.

module BUUC_Hx2 = CountH(B1x2(A, CountHx2(BUUC(B1x2(A), TT.CO1(RO.RO)).H2B), KEMROMx2.CCA(CountHx2(BUUC(B1x2(A), TT.CO1(RO.RO)).H2B), UU2, B1x2(A)).O).BH).
module BUUC_dec =  KEMROMx2.CCA(CountHx2(BUUC(B1x2(A), TT.CO1(RO.RO)).H2B), UU2, B1x2(A)).O.


lemma conclusion &m fail_prob prg_kg_bound prg_enc_bound :
    
    Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob =>

   `| Pr[PRG_KG.IND(PRG_KG.PRGr, DC_KG(BOWp(TT.BasePKE, TT.AdvOW_query(BUUOWMod(B1x2(A)))))).main() @ &m : res] -
       Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(BOWp(TT.BasePKE, TT.AdvOW_query(BUUOWMod(B1x2(A)))))).main() @ &m : res] | <= prg_kg_bound =>
   `| Pr[PRG_KG.IND(PRG_KG.PRGr, DC_KG(BOWp(TT.BasePKE, TT.AdvOW(BUUOWMod(B1x2(A)))))).main() @ &m : res] -
       Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(BOWp(TT.BasePKE, TT.AdvOW(BUUOWMod(B1x2(A)))))).main() @ &m : res]  | <= prg_kg_bound =>
   `| Pr[PRG_KG.IND(PRG_KG.PRGr, DC_KG(TT.B(TT.AdvCorr(BUUOWMod(B1x2(A))), RO.RO))).main() @ &m : res] -
       Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(TT.B(TT.AdvCorr(BUUOWMod(B1x2(A))), RO.RO))).main() @ &m : res]  | <= prg_kg_bound =>
   `| Pr[PRG_KG.IND(PRG_KG.PRGr, DC_KG(TT.B(BUUCI(B1x2(A)), RO.RO))).main() @ &m : res] -
       Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(TT.B(BUUCI(B1x2(A)), RO.RO))).main() @ &m : res]  | <= prg_kg_bound =>
   `| Pr[PRG_KG.IND(PRG_KG.PRGr, DC_KG(TT.B(BUUC(B1x2(A)), RO.RO))).main() @ &m : res] -
       Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(TT.B(BUUC(B1x2(A)), RO.RO))).main() @ &m : res]  | <= prg_kg_bound =>
   `|Pr[PRG_KG.IND(PRG_KG.PRGr, D_KG(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main() @ &m : res] -
       Pr[PRG_KG.IND(PRG_KG.PRGi, D_KG(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main() @ &m : res]| <=  prg_kg_bound =>
   `|Pr[PRG_KG.IND(PRG_KG.PRGr, D_KG(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main() @ &m : res] -
       Pr[PRG_KG.IND(PRG_KG.PRGi, D_KG(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main() @ &m : res]|  <=  prg_kg_bound =>
   `| Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(BOWp(TT.BasePKE, TT.AdvOW_query(BUUOWMod(B1x2(A)))))).main() @ &m : res] -
       Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(BOWp(TT.BasePKE, TT.AdvOW_query(BUUOWMod(B1x2(A)))))).main() @ &m : res]|  <= prg_enc_bound =>
   `| Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(BOWp(TT.BasePKE, TT.AdvOW(BUUOWMod(B1x2(A)))))).main() @ &m : res] -
       Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(BOWp(TT.BasePKE, TT.AdvOW(BUUOWMod(B1x2(A)))))).main() @ &m : res] |  <= prg_enc_bound =>
   `| Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(TT.B(TT.AdvCorr(BUUOWMod(B1x2(A))), RO.RO))).main() @ &m : res] -
       Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(TT.B(TT.AdvCorr(BUUOWMod(B1x2(A))), RO.RO))).main() @ &m : res] |  <= prg_enc_bound =>
   `| Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(TT.B(BUUCI(B1x2(A)), RO.RO))).main() @ &m : res] -
       Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(TT.B(BUUCI(B1x2(A)), RO.RO))).main() @ &m : res] |  <= prg_enc_bound =>
   `| Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(TT.B(BUUC(B1x2(A)), RO.RO))).main() @ &m : res] -
       Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(TT.B(BUUC(B1x2(A)), RO.RO))).main() @ &m : res] |  <= prg_enc_bound =>
   `|Pr[IND(PRG_ENC.PRGr, D_ENC(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main() @ &m : res] -
       Pr[IND(PRG_ENC.PRGi, D_ENC(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main() @ &m : res]|  <= prg_enc_bound =>
   `|Pr[IND(PRG_ENC.PRGr, D_ENC(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main() @ &m : res] -
       Pr[IND(PRG_ENC.PRGi, D_ENC(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main() @ &m : res]|   <= prg_enc_bound =>


    qHT = qHK =>
    qHU = qHK =>
    TT.qH = qHT + qHU + 1 =>
    TT.qV = 0 =>
    TT.qP = 0 =>
    TT.qH + 1 = TT.qHC =>
    TT.qHC < TT.FinT.card - 1 =>

    (forall (RO0 <: KEMROM.POracle{-CountH, -A} ) (O0 <: KEMROM.CCA_ORC{-CountH, -A} ),
       hoare[ A(CountH(RO0), O0).guess : CountH.c_h = 0 ==> CountH.c_h <= qHK]) =>

    (forall (H0 <: KEMROM.POracle{-A} ) (O <: KEMROMx2.CCA_ORC{-A} ),
       islossless O.dec => islossless H0.get => islossless A(H0, O).guess) =>

    `|Pr[KEMROM.CCA(KEMROM.RO.RO, FO_K, A).main() @ &m : res] - 1%r / 2%r| <=
    2%r * (`| Pr[MLWE_H(B1(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main(false, false) @ &m : res] -
             Pr[MLWE_H(B1(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main(false, true) @ &m : res] | +
          `| Pr[MLWE_H(B2(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main(true, false) @ &m : res] -
             Pr[MLWE_H(B2(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main(true, true) @ &m : res] | + 
             prg_kg_bound + prg_enc_bound) +
    2%r * (`| Pr[MLWE_H(B1(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main(false, false) @ &m : res] -
             Pr[MLWE_H(B1(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main(false, true) @ &m : res] | +
           `| Pr[MLWE_H(B2(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main(true, false) @ &m : res] -
             Pr[MLWE_H(B2(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main(true, true) @ &m : res]| +
            prg_kg_bound + prg_enc_bound) +
    (3%r * (2*qHK + 3)%r + 2%r) * (fail_prob + prg_kg_bound + prg_enc_bound) +
    `|Pr[J.IND(PseudoRF.PRF, D(B1x2(A))).main() @ &m : res] - Pr[J.IND(RF.RF, D(B1x2(A))).main() @ &m : res]| +
    2%r * (2*qHK + 2)%r * eps_msg.
proof.
move => fail_probE kb1 kb2 kb3 kb4 kb5 kb6 kb7 eb1 eb2 eb3 eb4 eb5 eb6 eb7 qhthk qhuhk qvals qv0 qp0 qhv qhcsmall A_count A_ll.

have := conclusion_fo_kyber A &m qhthk qhuhk qvals qv0 qp0 qhv qhcsmall A_count A_ll.

have -> : 
   Pr[TT.PKE.CPA(TT.BasePKE, OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A)))))).main() @ &m : res] = 
    Pr[TT.PKE.CPA(MLWE_PKE_HASH, OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A)))))).main() @ &m : res].
+ byequiv => //;proc; seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.
have -> :  
    Pr[TT.PKE.CPA(TT.BasePKE, OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A))))).main() @ &m : res]  = 
     Pr[TT.PKE.CPA(MLWE_PKE_HASH, OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A))))).main() @ &m : res] .
+ byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

have := correctness_theorem (BOWp(TT.BasePKE, TT.AdvOW_query(BUUOWMod(B1x2(A))))) &m  _; 1: by islossless.
have <- : 
    Pr[TT.PKE.Correctness_Adv(TT.BasePKE, BOWp(TT.BasePKE, TT.AdvOW_query(BUUOWMod(B1x2(A))))).main() @ &m : res] = 
   Pr[TT.PKE.Correctness_Adv(MLWE_PKE_HASH, BOWp(TT.BasePKE, TT.AdvOW_query(BUUOWMod(B1x2(A))))).main() @ &m : res].
+ byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

move => Htemp.
have : Pr[TT.PKE.Correctness_Adv(TT.BasePKE, BOWp(TT.BasePKE, TT.AdvOW_query(BUUOWMod(B1x2(A))))).main() @ &m : res] <=
   Pr[CorrectnessBound.main() @ &m : res] + prg_kg_bound + prg_enc_bound by smt().
clear Htemp kb1 eb1 => kb1.

have := correctness_theorem (BOWp(TT.BasePKE, TT.AdvOW(BUUOWMod(B1x2(A))))) &m _; 1: by islossless.
have <- : 
    Pr[TT.PKE.Correctness_Adv(TT.BasePKE, BOWp(TT.BasePKE, TT.AdvOW(BUUOWMod(B1x2(A))))).main() @ &m : res] = 
    Pr[TT.PKE.Correctness_Adv(MLWE_PKE_HASH, BOWp(TT.BasePKE, TT.AdvOW(BUUOWMod(B1x2(A))))).main() @ &m : res].
+ byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

move => Htemp.
have : Pr[TT.PKE.Correctness_Adv(TT.BasePKE, BOWp(TT.BasePKE, TT.AdvOW(BUUOWMod(B1x2(A))))).main() @ &m : res] <=
   Pr[CorrectnessBound.main() @ &m : res] + prg_kg_bound + prg_enc_bound by smt().
clear Htemp kb2 eb2 => kb2.

have := correctness_theorem (TT.B(TT.AdvCorr(BUUOWMod(B1x2(A))), RO.RO)) &m _.
+  islossless; last by smt(drange_ll TT.ge0_qH).
   by apply(A_ll BUOOOWMod_Hx2 BUOOOWMod_dec);islossless.

have <- : 
    Pr[TT.PKE.Correctness_Adv(TT.BasePKE, TT.B(TT.AdvCorr(BUUOWMod(B1x2(A))), RO.RO)).main() @ &m : res] = 
    Pr[TT.PKE.Correctness_Adv(MLWE_PKE_HASH, TT.B(TT.AdvCorr(BUUOWMod(B1x2(A))), RO.RO)).main() @ &m : res].
 + byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

move => Htemp. 
have : Pr[TT.PKE.Correctness_Adv(TT.BasePKE, TT.B(TT.AdvCorr(BUUOWMod(B1x2(A))), RO.RO)).main() @ &m : res] <=
   Pr[CorrectnessBound.main() @ &m : res] + prg_kg_bound + prg_enc_bound by smt().
clear Htemp kb3 eb3 => kb3.

have := correctness_theorem (TT.B(BUUCI(B1x2(A)), RO.RO)) &m _.
+  islossless; last by smt(drange_ll TT.ge0_qH).
   by apply(A_ll BUUCI_Hx2 BUUCI_dec);islossless.
have <- : 
    Pr[TT.PKE.Correctness_Adv(TT.BasePKE, TT.B(BUUCI(B1x2(A)), RO.RO)).main() @ &m : res] = 
    Pr[TT.PKE.Correctness_Adv(MLWE_PKE_HASH, TT.B(BUUCI(B1x2(A)), RO.RO)).main() @ &m : res].
+ byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

move => Htemp. 
have : Pr[TT.PKE.Correctness_Adv(TT.BasePKE, TT.B(BUUCI(B1x2(A)), RO.RO)).main() @ &m : res]  <=
   Pr[CorrectnessBound.main() @ &m : res] + prg_kg_bound + prg_enc_bound by smt().
clear Htemp kb4 eb4 => kb4.

have := correctness_theorem (TT.B(BUUC(B1x2(A)), RO.RO)) &m _.
+  islossless; last by smt(drange_ll TT.ge0_qH).
   by apply(A_ll BUUC_Hx2 BUUC_dec);islossless.

have <- : 
    Pr[TT.PKE.Correctness_Adv(TT.BasePKE, TT.B(BUUC(B1x2(A)), RO.RO)).main() @ &m : res] = 
    Pr[TT.PKE.Correctness_Adv(MLWE_PKE_HASH, TT.B(BUUC(B1x2(A)), RO.RO)).main() @ &m : res].
+ byequiv => //;proc;seq 1 1 : (#pre /\ ={pk,sk});
   1: by conseq />;call kg_same;auto => />.
  by inline *;sim.

move => Htemp. 
have : Pr[TT.PKE.Correctness_Adv(TT.BasePKE, TT.B(BUUC(B1x2(A)), RO.RO)).main() @ &m : res]   <=
   Pr[CorrectnessBound.main() @ &m : res] + prg_kg_bound + prg_enc_bound by smt().
clear Htemp kb5 eb5 => kb5.

have := main_theorem (OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A)))))) &m _ _.
+ islossless.
   by apply(A_ll BUOOOWModCPA_Hx2 BUOOOWModCPA_dec);islossless.
+ by islossless.

move => Htemp. 
have : `|Pr[TT.PKE.CPA(MLWE_PKE_HASH, OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A)))))).main() @ &m : res] -
         1%r / 2%r| <=
       `|Pr[MLWE_H(B1(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main(false, false) @ &m : res] -
         Pr[MLWE_H(B1(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main(false, true) @ &m : res]| +
       `|Pr[MLWE_H(B2(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main(true, false) @ &m : res] -
         Pr[MLWE_H(B2(OWvsIND.Bowl(OWvsIND.BL(TT.AdvOW(BUUOWMod(B1x2(A))))))).main(true, true) @ &m : res]| +  prg_kg_bound + prg_enc_bound by smt().
clear Htemp kb6 eb6 => kb6.

have := main_theorem (OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A))))) &m _ _.
+ islossless; last by smt(drange_ll ge0_qHT ge0_qHU) .
   by apply(A_ll BUOOOWModCPA_Hx2 BUOOOWModCPA_dec);islossless.
+ by islossless.

move => Htemp. 
have : `|Pr[TT.PKE.CPA(MLWE_PKE_HASH, OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A))))).main() @ &m : res] - 1%r / 2%r| <=
       `|Pr[MLWE_H(B1(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main(false, false) @ &m : res] -
         Pr[MLWE_H(B1(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main(false, true) @ &m : res]| +
       `|Pr[MLWE_H(B2(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main(true, false) @ &m : res] -
         Pr[MLWE_H(B2(OWvsIND.Bowl(TT.AdvOWL_query(BUUOWMod(B1x2(A)))))).main(true, true) @ &m : res]| +   prg_kg_bound + prg_enc_bound by smt().
clear Htemp kb7 eb7 => kb7.

by smt(ge0_qHU ge0_qHT). 
qed.


end section. 
end MLWE_PKE_Hash.


