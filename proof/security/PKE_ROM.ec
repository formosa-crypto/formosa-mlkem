require import AllCore List Distr DBool PROM FinType SmtMap FSet.  
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
  proc find(pk : pkey, c:ciphertext) : plaintext option
}.

clone FinType as MFinT with
  type t <- plaintext.

op [lossless full uniform] dplaintext : plaintext distr.

op eps_msg = 1%r / MFinT.card%r.

lemma eps_msgE x : mu1 dplaintext x = eps_msg.
proof.  
have : support dplaintext = predT; last 
  by smt(dplaintext_fu MFinT.perm_eq_enum_to_seq perm_eq_size
         mu1_uni_ll dplaintext_uni dplaintext_ll).
by apply fun_ext => y; rewrite /predT /= dplaintext_fu.
qed.


module OW_CPA (S:Scheme, A: OW_CPA_ADV) = {
  var pk : pkey
  var sk : skey
  var m  : plaintext
  var cc : ciphertext
  var m' : plaintext option

  proc main_perfect() = {
    (pk, sk) <@ S.kg();
    m        <$ dplaintext;
    cc       <@ S.enc(pk, m);
    m'       <@ A.find(pk,cc);
    return (m' = Some m);

  }

  module O = {
    proc pco(sk, m : plaintext, c : ciphertext) : bool = {
      var m'';
      m''   <@ S.dec(sk, c);
      return m'' = Some m;
    }
  }

  proc main() : bool = {
    var b  : bool;

    (pk, sk) <@ S.kg();
    m        <$ dplaintext;
    cc       <@ S.enc(pk, m);
    m'       <@ A.find(pk,cc);
    b        <@ O.pco(sk, oget m',cc);
    return if m' = None then false else b;
  }
}.

module BOWp(S : Scheme, A :  OW_CPA_ADV) : CORR_ADV = {
   var m'' : plaintext option

   proc find(pk : pkey, sk : skey) : plaintext = {
       OW_CPA.m  <$ dplaintext;
       return OW_CPA.m;
   }

   proc main() : bool = {
    var pk,sk;
    (pk, sk) <@ S.kg();
    find(pk,sk);
    OW_CPA.cc <@ S.enc(pk, OW_CPA.m);
    OW_CPA.m' <@ A.find(pk,OW_CPA.cc);
    m''       <@ S.dec(sk, OW_CPA.cc);
    return (m'' <> Some OW_CPA.m);
   }
}.


section.

declare module S <: Scheme { -BOWp, -OW_CPA }.
declare module A <: OW_CPA_ADV { -S, -BOWp, -OW_CPA }.

lemma ow_perfect &m : 
   islossless A.find =>
   islossless S.enc =>
   islossless S.dec =>
   `| Pr [ OW_CPA (S, A).main() @ &m : res ] -
        Pr [ OW_CPA (S, A).main_perfect() @ &m : res ] | <=
             Pr[ Correctness_Adv(S,BOWp(S,A)).main() @ &m : res ].
proof. 
move => A_ll Senc_ll Sdec_ll.
have -> : 
  Pr[OW_CPA(S, A).main_perfect() @ &m : res] = 
    Pr[ BOWp(S,A).main() @ &m : Some OW_CPA.m = OW_CPA.m' ].
+ byequiv => //.
  proc;inline *; seq 4 6 : #post; last by  conseq />;islossless.
  conseq  (_: _ ==> OW_CPA.m{1} = OW_CPA.m{2} /\ OW_CPA.m'{1} = OW_CPA.m'{2}); 1: by smt().
  by sim.

have -> : 
  Pr[OW_CPA(S, A).main() @ &m : res] = 
    Pr[ BOWp(S,A).main() @ &m : if OW_CPA.m' = None then false else BOWp.m'' = OW_CPA.m'].
+ byequiv => //.
  proc;inline *; seq 9 7 : #post; last by conseq />; islossless. 
  wp. conseq (: OW_CPA.m'{1} = OW_CPA.m'{2} /\ m''{1} = BOWp.m''{2} /\ m{1} = oget OW_CPA.m'{2}); 1: smt().
  by call(:true);wp;call(:true);wp;call(:true);rnd;wp;call(:true);auto.

have -> : 
  Pr[Correctness_Adv(S, BOWp(S, A)).main() @ &m : res] = 
    Pr[ BOWp(S,A).main() @ &m : res ].
+ byequiv => //.
  proc;inline *. swap {2} 6 1. call{2}(:true ==> true). 
  wp; conseq (: m'{1} = BOWp.m''{2} /\ m{1} = OW_CPA.m{2} ); 1: smt().
  by sim.

byequiv : (res) => //.
proc;inline *. 
by do 3!(call(:true));rnd;wp;call(:true);auto => />.
qed.

end section.

(* Ind implies ow for large message spaces *)

theory OWvsIND.

module Bow(A :  OW_CPA_ADV) : Adversary = {
   var m0, m1  : plaintext
   var m       : plaintext option
   var pk      : pkey

   proc choose(_pk : pkey) : plaintext * plaintext = {
     pk <- _pk;
     m0 <$ dplaintext;
     m1 <$ dplaintext;
     return (m0,m1);
   }

   proc guess(c : ciphertext) : bool = {
      var b;
      b <$ {0,1};
      m <@ A.find(pk,c);
      return if (m = Some m0) 
             then false 
             else if (m = Some m1) 
                  then true 
                  else b;
   }
}.

section.


declare module S <: Scheme {-Bow, -BOWp, -OW_CPA}.
declare module A <: OW_CPA_ADV {-S, -Bow, -BOWp, -OW_CPA}.

local module Aux = {
  proc main0() : bool = {
   var pk,sk,c,b;
   (pk, sk) <@ S.kg();                                                
   Bow.pk <- pk;                                                       
   Bow.m0 <$ dplaintext;                                                
   Bow.m1 <$ dplaintext;                                               
   c <@ S.enc(pk, Bow.m0);                                                
   b <$ {0,1};                                                        
   Bow.m <@ A.find(Bow.pk, c);                                           
   return if Bow.m = Some Bow.m0 then false else if Bow.m = Some Bow.m1 then true else b;
  }

  proc main1() : bool = {
   var pk,sk,c,b;
   (pk, sk) <@ S.kg();                                                
   Bow.pk <- pk;                                                       
   Bow.m0 <$ dplaintext;                                                
   Bow.m1 <$ dplaintext;                                               
   c <@ S.enc(pk, Bow.m1);                                                
   b <$ {0,1};                                                        
   Bow.m <@ A.find(Bow.pk, c);                                           
   return if Bow.m = Some Bow.m0 then false else if Bow.m = Some Bow.m1 then true else b;
  }

}.

print glob Bow.
pred bad(gB : glob Bow) = (gB.`1 = None \/ (gB.`1 <> Some gB.`2 /\ gB.`1 <> Some gB.`3)).

lemma ow_ind &m : 
   islossless S.kg => 
   islossless S.enc =>
   islossless S.dec =>
   islossless A.find => 

   Pr[ OW_CPA(S,A).main() @ &m : res ] <=
      2%r * (eps_msg + 
        `| Pr[CPA(S,Bow(A)).main() @ &m : res] - 1%r/2%r |) + 
             Pr[ Correctness_Adv(S,BOWp(S,A)).main() @ &m : res ].
proof. 
move => kg_ll enc_ll dec_ll A_ll. 
have : Pr[ OW_CPA(S,A).main_perfect() @ &m : res ] <=
      2%r * (eps_msg + 
        `| Pr[CPA(S,Bow(A)).main() @ &m : res] - 1%r/2%r |); last 
 by move : (ow_perfect  S A &m A_ll enc_ll dec_ll);smt().

rewrite RField.mulrDr -(pr_CPA_LR S (Bow(A)) &m kg_ll enc_ll); 1,2: by islossless.

have -> : 
  Pr[CPA_L(S, Bow(A)).main() @ &m : res] = 
  Pr[CPA_L(S, Bow(A)).main() @ &m : res /\ bad (glob Bow)] + 
  Pr[CPA_L(S, Bow(A)).main() @ &m : res /\ !bad (glob Bow)]
by rewrite Pr[mu_split bad (glob Bow)] => /#.

have -> : 
  Pr[CPA_R(S, Bow(A)).main() @ &m : res] = 
  Pr[CPA_R(S, Bow(A)).main() @ &m : res /\ bad (glob Bow)] + 
  Pr[CPA_R(S, Bow(A)).main() @ &m : res /\ !bad (glob Bow)]
by rewrite Pr[mu_split bad (glob Bow)] => /#.

have ->  /=: 
  Pr[CPA_L(S, Bow(A)).main() @ &m : res /\ bad (glob Bow)] =
  Pr[CPA_R(S, Bow(A)).main() @ &m : res /\ bad (glob Bow)].
+ byequiv (: _ ==> (res /\ bad (glob Bow)){1} <=>
                   (res /\ bad (glob Bow)){2}) => //.
  proc. 
  seq 2 2 : (={glob A, glob S, pk,sk, Bow.pk} /\ Bow.pk{1} = pk{1} /\
             Bow.m0{1} = Bow.m1{2} /\ Bow.m1{1} = Bow.m0{2} /\ 
             Bow.m0{1} = m0{1} /\ Bow.m1{1} = m1{1} /\
             Bow.m0{2} = m0{2} /\ Bow.m1{2} = m1{2});
     1: by inline *;swap {1} 4 1;auto;call(_: true); auto.
  by inline *;wp;call(_: true);rnd;wp;call(_:true);auto => /> /#.
  
have H : 
  `| Pr[OW_CPA(S, A).main_perfect() @ &m : res] - 
      Pr[Aux.main1() @ &m : res /\ ! bad (glob Bow)]|  <=
      Pr[Aux.main1() @ &m : Bow.m = Some Bow.m0 ].
  + have -> : Pr[OW_CPA(S, A).main_perfect() @ &m : res] = 
            Pr[Aux.main1()  @ &m : Bow.m = Some Bow.m1]
     by byequiv => //;proc;inline*;wp;call(_: true);rnd{2};
        call(:true);rnd;rnd{2};wp;call(_: true);auto => />.
  byequiv : (Bow.m = Some Bow.m0) => //. 
  proc;inline *.
  by call(:true);rnd;call(:true);rnd;rnd;wp;call(:true);auto => /> /#.

have H0 : 
   Pr[CPA_L(S, Bow(A)).main() @ &m : res /\ ! bad (glob Bow)] <= eps_msg.
+ have -> : Pr[CPA_L(S, Bow(A)).main() @ &m : res /\ ! bad (glob Bow)] = 
            Pr[Aux.main0() @ &m : res /\ ! bad (glob Bow)]
   by byequiv => //;proc;inline *;wp;conseq />; sim. 
  byphoare => //. 
  proc;inline *; swap 4 3.
  conseq (: _ ==> Some Bow.m1 = Bow.m); 1: by smt().
  seq 6 : true  (1%r)  (eps_msg) (0%r) (0%r).
  + by trivial.
  + by trivial. 
  + rnd; skip => /> &hr.  
    case(Bow.m{hr} = None); 1: by move => -> /=; rewrite mu0;smt(MFinT.card_gt0).
    move => nnone.
    have -> : (fun (x : plaintext) => Some x = Bow.m{hr})  = pred1 (oget Bow.m{hr}) 
        by apply fun_ext => x;smt().
    by smt(eps_msgE fun_ext).
     + by hoare; trivial.
  by trivial.

have H1 : Pr[CPA_R(S, Bow(A)).main() @ &m : res /\ ! bad (glob Bow)] = 
            Pr[Aux.main1() @ &m : res /\ ! bad (glob Bow)]
      by byequiv => //;proc;inline*;wp;conseq />;sim.

have  : Pr[Aux.main1() @ &m : Bow.m = Some Bow.m0] <= eps_msg; last by smt().
byphoare => //. 
proc;inline *;swap 3 4.
conseq (: _ ==> Bow.m0 = oget Bow.m); 1: by smt().
seq 6 : true  (1%r)  (eps_msg) (0%r) (0%r).
+ by trivial.
+ by islossless. 
+ rnd; skip => />*; rewrite eps_msgE /#.
+ by hoare; trivial. 
by trivial. 
qed.

end section.

end OWvsIND.

(* Ind tightly implies even list OW for large message spaces *)

theory OWvsIND_RO.

clone import FullRO as RO with
   type in_t <- plaintext
   proof *.

module BowROM(A :  OW_CPA_ADV) : Adversary = {
   var m0, m1  : plaintext
   var pk      : pkey

   proc choose(_pk : pkey) : plaintext * plaintext = {
     pk <- _pk;
     m0 <$ dplaintext;
     m1 <$ dplaintext;
     return (m0,m1);
   }

   proc guess(c : ciphertext) : bool = {
      var b;
      b <$ {0,1};
      A.find(pk,c);
      return if (m0 \in RO.m = m1 \in RO.m)
             then b
             else if (m0 \in RO.m) 
                  then false 
                  else true;
   }
}.

section.


declare module S <: Scheme {-BowROM, -BOWp, -OW_CPA}.
declare module A <: OW_CPA_ADV {-S,  -BOWp, -OW_CPA, -BowROM}.

local module Aux = {
  proc main0() : bool = {
   var pk,sk,c,b;
   (pk, sk) <@ S.kg();                                                
   BowROM.pk <- pk;                                                       
   BowROM.m0 <$ dplaintext;                                                
   BowROM.m1 <$ dplaintext;                                               
   c <@ S.enc(pk, BowROM.m0);                                                
   b <$ {0,1};                                                        
   A.find(pk,c);
   return if (BowROM.m0 \in RO.m = BowROM.m1 \in RO.m)
          then b
          else if (BowROM.m0 \in RO.m) 
               then false 
               else true;
  }

  proc main1() : bool = {
   var pk,sk,c,b;
   (pk, sk) <@ S.kg();                                                
   BowROM.pk <- pk;                                                       
   BowROM.m0 <$ dplaintext;                                                
   BowROM.m1 <$ dplaintext;                                               
   c <@ S.enc(pk, BowROM.m1);                                                
   b <$ {0,1};                                                        
   A.find(pk,c);
   return if (BowROM.m0 \in RO.m = BowROM.m1 \in RO.m)
          then b
          else if (BowROM.m0 \in RO.m) 
               then false 
               else true;
  }

}.

print glob BowROM.
pred bad(gB : glob BowROM) = (gB.`1 \in gB.`4 = gB.`2 \in gB.`4).
lemma ow_ind_ro &m MAX : 
   0 <= MAX =>
   islossless S.kg =>
   islossless S.enc =>
   islossless S.dec =>
   islossless A.find =>

   hoare [ A.find : true ==> card (fdom RO.m) <= MAX ] =>

   Pr[ OW_CPA(S,A).main() @ &m :   OW_CPA.m \in RO.m] <=
      2%r * (MAX%r * eps_msg + 
        `| Pr[CPA(S,BowROM(A)).main() @ &m : res] - 1%r/2%r |).   
proof. 
move => max_ge0 kg_ll enc_ll dec_ll A_ll maxsize. 

rewrite RField.mulrDr -(pr_CPA_LR S (BowROM(A)) &m kg_ll enc_ll); 1,2: by islossless.

have -> : 
  Pr[CPA_L(S, BowROM(A)).main() @ &m : res] = 
  Pr[CPA_L(S, BowROM(A)).main() @ &m : res /\ bad (glob BowROM)] + 
  Pr[CPA_L(S, BowROM(A)).main() @ &m : res /\ !bad (glob BowROM)]
by rewrite Pr[mu_split bad (glob BowROM)] => /#.

have -> : 
  Pr[CPA_R(S, BowROM(A)).main() @ &m : res] = 
  Pr[CPA_R(S, BowROM(A)).main() @ &m : res /\ bad (glob BowROM)] + 
  Pr[CPA_R(S, BowROM(A)).main() @ &m : res /\ !bad (glob BowROM)]
by rewrite Pr[mu_split bad (glob BowROM)] => /#.

have ->  /=: 
  Pr[CPA_L(S, BowROM(A)).main() @ &m : res /\ bad (glob BowROM)] =
  Pr[CPA_R(S, BowROM(A)).main() @ &m : res /\ bad (glob BowROM)].
+ byequiv (: ={glob A,glob S, RO.m} ==> (res /\ bad (glob BowROM)){1} <=>
                   (res /\ bad (glob BowROM)){2}) => //.
  proc. 
  seq 2 2 : (={glob A, glob S, pk,sk, BowROM.pk,RO.m} /\ 
         BowROM.m0{1} = BowROM.m1{2} /\ BowROM.m1{1} = BowROM.m0{2} /\ 
         BowROM.pk{1} = pk{1} /\
             BowROM.m0{1} = m0{1} /\ BowROM.m1{1} = m1{1} /\
             BowROM.m0{2} = m0{2} /\ BowROM.m1{2} = m1{2});
     1: by inline *; swap {1} 4 1;auto;call(_: true); auto. 
   by inline *;wp;call(_: true);rnd;wp;call(_:true);auto => /> /#.

have H :   `| Pr[OW_CPA(S, A).main() @ &m : OW_CPA.m \in RO.m ] - 
      Pr[Aux.main1() @ &m : res /\ ! bad (glob BowROM) ]|  <=
         Pr[Aux.main1() @ &m : BowROM.m0 \in RO.m].
+ have -> : Pr[OW_CPA(S, A).main() @ &m : OW_CPA.m \in RO.m] = 
       Pr[Aux.main1() @ &m : BowROM.m1 \in RO.m].
  + byequiv (: ={glob A,glob S, RO.m} ==> _) => //. 
    proc;inline*;wp;call{1}(_: true ==> true). 
    by wp;call(:true); rnd{2};call(:true);rnd;rnd{2};wp;call(_: true);auto.
  byequiv : (BowROM.m0 \in RO.m) => //. 
  proc;inline *.
  by call(:true);rnd;call(:true);rnd;rnd;wp;call(:true);auto => /> /#. 

have H0 : 
   Pr[CPA_L(S, BowROM(A)).main() @ &m : res /\ ! bad (glob BowROM)] <= MAX%r * eps_msg.
+ have -> : Pr[CPA_L(S, BowROM(A)).main() @ &m : res /\ ! bad (glob BowROM)] = 
            Pr[Aux.main0() @ &m : res /\ !bad (glob BowROM)].
  + byequiv (:_ ==> ={res} /\ ((!bad (glob BowROM)){1} <=>(!bad (glob BowROM)){2})) => //; last by smt(). 
    by proc;inline *;wp;conseq (_: _ ==> ={BowROM.m1, BowROM.m0, RO.m,b});[ by smt() | by sim ].  
  have -> : Pr[Aux.main0() @ &m : res /\ ! bad (glob BowROM)] =
      Pr[Aux.main0() @ &m : res /\ card (fdom RO.m) <= MAX /\ ! bad (glob BowROM)].
  + have ?: `| Pr[Aux.main0() @ &m : res /\ !bad (glob BowROM)] -
      Pr[Aux.main0() @ &m : res /\ card (fdom RO.m) <= MAX /\ !bad (glob BowROM)] | <= 0%r; last by smt().
  + have ->: 0%r = Pr[Aux.main0() @ &m : ! card (fdom RO.m) <= MAX] 
     by  byphoare => //;hoare => /=;proc;inline *;call maxsize;auto => />. 
    byequiv  : (!card (fdom RO.m) <= MAX) =>//.
    by proc;call(_: true);rnd;call(:true);rnd;rnd;wp;call(:true);auto => /> /#.
  byphoare => //. 
  proc;inline *; swap 4 3.
  conseq (: _ ==> card (fdom RO.m) <= MAX /\ BowROM.m1 \in RO.m); 1: by smt().
  seq 6 : true  (1%r)  (MAX%r * eps_msg) (0%r) (0%r).
  + by trivial.
  + by trivial. 
  + rnd; skip => /> &hr.  
    case (!card (fdom RO.m{hr}) <= MAX) => *. 
    + by have -> : (fun (x : plaintext) => card (fdom RO.m{hr}) <= MAX /\ (x \in RO.m{hr})) = pred0;
         rewrite ?mu0 /=;smt(MFinT.card_gt0). 
    have -> : (fun (x : plaintext) => card (fdom RO.m{hr}) <= MAX /\ (x \in RO.m{hr})) = (mem (fdom RO.m{hr})) 
        by smt(mem_fdom).
    have := Mu_mem.mu_mem_le (fdom RO.m{hr}) dplaintext eps_msg _; last by smt(MFinT.card_gt0). 
    move => *; rewrite mu1_uni; 1: by smt(dplaintext_uni).  
    rewrite dplaintext_fu /= dplaintext_ll /eps_msg MFinT.card_size_to_seq.
    by have -> : (support dplaintext) = predT; smt(dplaintext_fu is_fullP).
  + by hoare; trivial.
  by trivial.
  
have -> : Pr[CPA_R(S, BowROM(A)).main() @ &m : res /\ !bad (glob BowROM)] = 
            Pr[Aux.main1()           @ &m : res /\ !bad (glob BowROM)].
+ byequiv (: ={glob A,glob S, RO.m} ==> _) => //. 
  by proc;inline*;wp;call(:true);rnd;wp;call(:true);wp;rnd;rnd;wp;call(:true);auto.

have : Pr[Aux.main1() @ &m : BowROM.m0 \in RO.m] <= MAX%r * eps_msg; last by smt().
have -> : Pr[Aux.main1() @ &m : BowROM.m0 \in RO.m] =
      Pr[Aux.main1() @ &m : card (fdom RO.m) <= MAX /\ BowROM.m0 \in RO.m].
+ have : `| Pr[Aux.main1() @ &m : BowROM.m0 \in RO.m] -
    Pr[Aux.main1() @ &m : card (fdom RO.m) <= MAX /\ BowROM.m0 \in RO.m]| <= 0%r; last by smt().
  + have ->: 0%r = Pr[Aux.main1() @ &m : ! card (fdom RO.m) <= MAX] 
     by  byphoare => //;hoare => /=;proc;inline *;call maxsize;auto => />. 
  byequiv : (!card (fdom RO.m) <= MAX) =>//.
  by proc;call(_: true);rnd;call(:true);rnd;rnd;wp;call(:true);auto => /#.

byphoare => //. 
proc;inline *; swap 3 4.
seq 6 : true  (1%r)  (MAX%r * eps_msg) (0%r) (0%r).
+ by trivial.
+ by trivial. 
+ rnd; skip => /> &hr.
  case (!card (fdom RO.m{hr}) <= MAX) => *. 
  + by have -> : (fun (x : plaintext) => card (fdom RO.m{hr}) <= MAX /\ (x \in RO.m{hr})) = pred0;
       rewrite ?mu0 /=;smt(MFinT.card_gt0). 
  have -> : (fun (x : plaintext) => card (fdom RO.m{hr}) <= MAX /\ (x \in RO.m{hr})) = (mem (fdom RO.m{hr})) 
      by smt(mem_fdom).
  have := Mu_mem.mu_mem_le (fdom RO.m{hr}) dplaintext eps_msg _; last by smt(MFinT.card_gt0). 
  move => *; rewrite mu1_uni; 1: by smt(dplaintext_uni).  
  rewrite dplaintext_fu /= dplaintext_ll /eps_msg MFinT.card_size_to_seq.
  by have -> : (support dplaintext) = predT; smt(dplaintext_fu is_fullP). 
+ by hoare; trivial.
by trivial.
qed.

end section.

end OWvsIND_RO.


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
  proc choose(pk:pkey)     : plaintext * plaintext 
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
  proc find(pk : pkey, c:ciphertext) : plaintext option
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
    var m  : plaintext;
    var m' : plaintext option;
    var b;

    H.init();
    (pk, sk) <@ S(H).kg();
    m        <$ dplaintext;
    cc       <@ S(H).enc(pk, m);
    m'       <@ A.find(pk,cc);
    b        <@ O.pco(oget m',cc);
    return if m' = None then false else b;
  }
}.

end PKE_ROM.

