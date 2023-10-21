require import AllCore Distr List Real SmtMap FSet DInterval FinType KEM_ROM.
require (****) PKE_ROM PlugAndPray Hybrid FelTactic. 

(* This will be the underlying scheme resulting 
   from the T transform, since we will need to
   assume some of the properties that it offers.. *)
require FO_TT.
clone import FO_TT as TT.
import PKE.

(* we inherit the following axioms 
dplaintext_ll: is_lossless dplaintext
 dplaintext_uni: is_uniform dplaintext
 dplaintext_fu: is_full dplaintext
 FinT.enum_spec: forall (x : plaintext), count (pred1 x) enum = 1
 kg_ll: is_lossless kg
 randd_ll: is_lossless randd
 ge0_qH: 0 <= qH
 ge0_qV: 0 <= qV
 ge0_qP: 0 <= qP
 ge0_qHC: 0 <= qHC *)

(* the type of KEM keys *)
type key.
op [lossless uniform full]dkey : key distr.

(*  A PRF *)

require PRF.
print PRF.
clone import PRF as J with
   type D <- plaintext * ciphertext,
   type R <- key.
clone import RF with 
   op dR <- fun _ => dkey
   proof dR_ll by (move => *;apply dkey_ll)
   proof *.
(* we get the prf key type K from the next clone *)
clone import PseudoRF.
(**********)

clone import KEM_ROM.KEM_ROM as KEMROM with
   type pkey <- pkey,
   type skey = (pkey * skey) * K,
   type ciphertext <- ciphertext,
   type key <- key,
   op dkey <- dkey,
   type RO.in_t <- plaintext,
   type RO.out_t <- key,
   op   RO.dout <- fun _ => dkey,
   type RO.d_in_t <- unit, 
   type RO.d_out_t <- bool
   proof dkey_ll by apply dkey_ll
   proof dkey_uni by apply dkey_uni
   proof dkey_fu by apply dkey_fu
   proof *.

(******* Query Bounds ******)

(* Max number of calls to RO in attack on UU *)  
const qHU : { int | 0 <= qHU } as ge0_qHU. 
(* Maximum number of calls to Dec on TT *) 
const qD : { int | 0 <= qD } as ge0_qD.

(***************************************)

module (UU(HT : PKEROM.POracle) : KEMROM.Scheme) (HU : POracle) = {
  proc kg() : pkey * skey = {
     var pk, sk, k;
     (pk,sk) <$ kg;
     k <$ dK;
     return (pk, ((pk,sk),k));
  }
  
  proc enc(pk : pkey) : ciphertext * key = {
     var m, c, k;
     m <$ dplaintext;
     c <@TT(HT).enc(pk,m);
     k <@ HU.get(m);
     return (c,k);
  }
  
  proc dec(sk : skey, c : ciphertext) : key option = {
     var m', k;
     k <- witness;
     m' <@ TT(HT).dec(sk.`1,c);
     if (m' = None) {
        k <- F sk.`2 (oget m', c);
     }
     else {
        k <@ HU.get(oget m');
     }
     return (Some k);
  }
}.

(* RO init must initialize both ROs *)

module ROdI : KEMROM.Oracle = {
   include KEMROM.RO.RO [-init]
   proc init() : unit = {
      PKEROM.RO.RO.init();
      KEMROM.RO.RO.init();
   }
}.


(* Correctness proof *)

module (B_UC : PKEROM.CORR_ADV)  (HT : PKEROM.POracle)= {
   proc find(pk : pkey, sk : PKEROM.skey) : plaintext = {
      var m;
      m <$ dplaintext;
      return m;
   }
}.

lemma correctness &m : 
   Pr [ KEMROM.Correctness(ROdI,UU(PKEROM.RO.RO)).main() @ &m : res ] <=
     Pr [ PKEROM.Correctness_Adv(PKEROM.RO.RO,TT,B_UC).main() @ &m : res ].
proof.
byequiv => //.
proc.
inline {1} 1; inline {1} 3; inline {1} 6. 
inline {2} 2;inline {2} 4.
seq 4 2 : (={PKEROM.RO.RO.m} /\ 
            pk0{1} = kpair{2}.`1 /\ 
            sk0{1} = kpair{2}.`2); 
      1: by inline *;rnd{1};rnd;auto;smt(dK_ll).
sp.
seq 1 1 : (#pre /\ m{1} = m0{2}); 1: by auto.
sp. 
seq 2 1 : (#pre /\ c0{1} = c{2} /\ m{1} \in KEMROM.RO.RO.m{1} /\
         k1{1} = oget KEMROM.RO.RO.m{1}.[m{1}]);1: 
   by inline *;wp;rnd{1};wp;auto;smt(mem_set).
inline {1} 2;sp.
seq 1 1 : (#pre /\ m'{1} = m'{2}); 
  1: by inline *;wp;conseq />;sim;auto => /#.
by inline *;if{1};inline *;auto => />;smt(get_setE).
qed.

(* Security proof *)
(*
module CountO (O : VA_ORC) = {
  var c_cvo : int
  var c_pco : int
  var c_h   : int
  proc init () = { c_h <- 0; c_cvo <- 0; c_pco <- 0; }
 
  proc cvo(c : ciphertext) : bool = {
    var r;    
    r <@ O.cvo(c);
    c_cvo <- c_cvo + 1;
    return r;
  }
  
  proc pco(m : plaintext, c : ciphertext) : bool = {
    var r;
    r <@ O.pco(m, c);
    c_pco <- c_pco + 1;
    return r;
  }
}.

module CountH(H:POracle) = {
  proc get(x:plaintext) = {
    var r;
    r <@ H.get(x);
    CountO.c_h <- CountO.c_h + 1;
    return r;
  }  
}.

module Gm = {
  var m : plaintext
  var r : randomness
  var log : (plaintext, randomness) fmap
  var bad_corr : plaintext option
}.

(* TODO : move this in SmtMap *)

op find ['a, 'b] (f: 'a -> 'b -> bool) (m:('a, 'b) fmap) : ('a * 'b) option = 
  let bindings = map (fun a => (a, oget m.[a])) (elems (fdom m)) in
  let n = find (fun (p: _ * _) => f p.`1 p.`2) bindings in
  if n < size bindings then Some (nth witness bindings n)
  else None.

lemma find_map ['a, 'b]:
  forall (l : 'a list) (f : 'a -> 'b) (P : 'b -> bool),
    find P (map f l) = find (fun (x : 'a) => P (f x)) l
  by move => l f p; elim l;smt().

lemma findP_Some ['a, 'b] (f: 'a -> 'b -> bool) (m:('a, 'b) fmap) a b: 
  find f m = Some (a, b) =>
  m.[a] = Some b /\ f a b by 
   smt(mem_nth has_find find_ge0 List.mem_map fdomP mapP nth_find).

lemma findP_None ['a, 'b] (f: 'a -> 'b -> bool) (m:('a, 'b) fmap): 
  find f m = None =>
  forall a b, m.[a] = Some b => !f a b
 by smt(all_predC   has_find  List.mem_map fdomP mapP  allP).

module O_AdvOW = {
  var pk : pkey
  proc pco(m : plaintext, c : ciphertext) : bool = {
    var r, c';
    r  <@ RO.RO.get(m);
    c' <- enc r pk m;
    return c = c';
  }
  
  proc cvo(c:ciphertext) : bool = {
    var rv; 
    rv <- false; 
    if (c <> OW_PCVA.cc) 
      rv <- find (fun m r => c = enc r pk m) RO.RO.m <> None;
    return rv;
  }
}.

module AdvOW (A:PCVA_ADV) = {
  import var OW_PCVA O_AdvOW

  module A = A(CountH(RO.RO), CountO(O_AdvOW))

  proc find(pk0:pkey, c:ciphertext) : plaintext = {
    var m' : plaintext;
    pk <- pk0; 
    RO.RO.init();
    cc       <- c; 
    CountO(O_AdvOW).init();
    m'       <@ A.find(pk,cc);
    return m'; 
  }
}.

module AdvOW_query (A:PCVA_ADV) = {
  import var OW_PCVA O_AdvOW

  module A = A(CountH(RO.RO), CountO(O_AdvOW))

  proc main(pk0:pkey, c:ciphertext) : unit = {
    var m' : plaintext;
    pk <- pk0; 
    RO.RO.init();
    cc       <- c; 
    CountO(O_AdvOW).init();
    m'       <@ A.find(pk,cc);
  }

  proc find(pk0:pkey, c:ciphertext) : plaintext = {
    var i : int;
    main(pk0, c);
    i        <$ [0 .. qH + qP - 1];
    return nth witness (elems (fdom RO.RO.m)) i;
  }
}.

section. 

declare module A <: PCVA_ADV { -OW_PCVA, -RO.RO, -RO.FRO, -CountO, -Gm, -O_AdvOW, -Correctness_Adv1, -B}.

local module PCO(RO:RO.RO) = {
  import var OW_PCVA
  proc pco(m : plaintext, c : ciphertext) : bool = {
    var m', rv, r, c';
    rv <- false;
    m' <- dec (sk.`2) c;
    if (m' <> None) {
      if (m' = Some m) {
        r  <@ RO.get(m);
        c' <- enc r sk.`1 m;
        rv <- c = c';
      } else {
        RO.sample(m);
        r <@ RO.get(oget m');  
      }      
    } else RO.sample(m);
    return rv;
  }   
}.

(* local *) module type PCOT = {
  proc pco(m : plaintext, c:ciphertext) : bool
}.

(* local *) module type GT (PCO:PCOT) (RO:RO.RO) = {
  proc distinguish () : bool
}.

local module G (PCO:PCOT) (RO:RO.RO) = {
  import var OW_PCVA

  module O = {
    proc pco = PCO.pco

    proc cvo(c:ciphertext) : bool = {
      var m : plaintext option;
      m <- None;
      if (c <> cc) m <@ TT(RO).dec(sk, c); 
      return (m <> None);
    }
  }

  module A = A(RO,O)

  proc distinguish() : bool = {
    var pk : pkey;
    var r : randomness;
    var m, m' : plaintext;
    var b;
    RO.init();
    (pk, sk) <@ TT(RO).kg();
    m        <$ dplaintext;
    r        <@ RO.get(m);
    cc       <- enc r pk m; 
    m'       <@ A.find(pk,cc);
    b        <- dec sk.`2 cc = Some m';
    return b; 
  }
}.

local module G_PCO (RO:RO.RO) = G(PCO(RO), RO).

import RO.FullEager.

(* Generalize means that, to win the OW game, 
   one does not need to actually find a message 
   for which TT passes the check, but merely
   solve the owness of the underlying pke *)
local lemma OW_PCVA_G_PCO &m : 
  Pr[OW_PCVA(RO.LRO, TT, A).main() @ &m : res] <= 
        Pr[G_PCO(RO.LRO).distinguish() @ &m : res].
proof.
  byequiv => //; proc.
  seq 5 6: (={m', glob OW_PCVA}).
  + call (: ={glob RO.RO, glob OW_PCVA}).
    + by sim.
    + proc; inline{1} 1; sp; wp.
      if => //; 2: by inline *; auto.
      if{2}.
      + wp; call (: ={glob RO.RO}); 1: by sim.     
        by skip => /> /#.
      wp; call (: ={glob RO.RO}); 1: by sim. 
      by inline *; auto => /> /#.
    + by sim.
    inline{1} 4; wp.
    call (: ={glob RO.RO}); 1: by sim.
    by inline *; auto.
  inline{1} 1; inline{1} 3; sp; wp.
  if{1}; 2: by auto => /> ? ->.
  wp; call{1} (: true ==> true); 1: by islossless.
  by skip => /> /#.
qed.

local module PCO1(RO:RO.RO) = {
  import var OW_PCVA
  proc pco(m : plaintext, c : ciphertext) : bool = {
    var m', rv, r, c';
    rv <- false;
    m' <- dec (sk.`2) c;
    if (m' <> None) {
      if (m' = Some m) {
        r  <@ RO.get(m);
        c' <- enc r sk.`1 m;
        rv <- c = c';
      } else {
        r <@ RO.get(m);
        RO.sample(oget m');  
      }      
    } else r <@ RO.get(m);
    return rv;
  }   
}.

local module G_PCO1 (RO:RO.RO) = G(PCO1(RO), RO).

local module PCO2(RO:RO.RO) = {
  import var OW_PCVA
  proc pco(m : plaintext, c : ciphertext) : bool = {
    var m', rv, r, c';
    rv <- false;
    m' <- dec (sk.`2) c;
    r  <@ RO.get(m);
    if (m' = Some m) {
        c' <- enc r sk.`1 m;
        rv <- c = c';
    }
    return rv;
  }   
}.

local module G_PCO2 = G(PCO2(RO.RO), RO.RO).

(* abstracting over G and making sure m is always in the rom table for PCO2 queries.
   It might not be if the ciphertext failed to decrypt. *)
local lemma PCO_PCO2 &m : 
   Pr[G_PCO (RO.LRO).distinguish() @ &m : res] =
   Pr[G_PCO2.distinguish() @ &m : res].
proof.
  have hll : forall (_ : plaintext), is_lossless randd by move=> _; apply randd_ll.
  have <- : Pr[G_PCO(RO.RO).distinguish() @ &m : res] =
            Pr[G_PCO(RO.LRO).distinguish() @ &m : res]. 
  + by byequiv (RO.FullEager.RO_LRO_D (<:G_PCO) hll).
  have -> : Pr[G_PCO (RO.RO).distinguish() @ &m : res] = 
            Pr[G_PCO1(RO.RO).distinguish() @ &m : res].
  + byequiv => //.
    sim (G_PCO(RO.RO).O.pco ~ G_PCO1(RO.RO).O.pco : ={glob RO.RO, glob OW_PCVA}).
    proc; sp; if => //. 
    + if => //; 1: by sim.
      call (: ={x, glob RO.RO} ==> ={glob RO.RO});1: by proc; inline *; sim.
      call (: ={x, glob RO.RO} ==> ={glob RO.RO});1: by proc; inline *; sim.
      by auto.
    call (: ={x, glob RO.RO} ==> ={glob RO.RO});1: by proc; inline *; sim.
    by auto.
  have -> : Pr[G_PCO1(RO.RO).distinguish() @ &m : res] =
            Pr[G_PCO1(RO.LRO).distinguish() @ &m : res].
  + by byequiv (RO.FullEager.RO_LRO_D (<:G_PCO1) hll).
  byequiv => //.
  sim (G_PCO1(RO.LRO).O.pco ~ G_PCO2.O.pco : ={glob RO.RO, glob OW_PCVA}).
  proc; sp.
  if{1}; last first.
  + rcondf{2} ^if; 2: by sim. 
    by move=> *; conseq (: true) => /> // ->.
  if{1}.
  + rcondt{2} ^if; 2: by sim.
    by move=> *; conseq (:true) => />.
  rcondf{2} ^if; 1: by move=> *; conseq (:true) => />.
  by inline{1} 2; wp; sim.
qed.

local clone import Hybrid as Hybrid0 with 
type input    <- plaintext * skey * ciphertext,
type output   <- bool,
type inleaks  = plaintext option,
type outleaks = randomness option,
type outputA <- bool,
op q  <- qV
proof q_ge0 by smt(ge0_qV) 
proof *. (* This line allow to be sure that no remaining axiom are still present *)

local module Orclb_ (RO:RO.RO) : Orclb = {

  proc leaks (il : inleaks) : outleaks = {
    var re, r; 

    if (il = None) { 
      RO.init(); 
      re <- None; }
    else {
      r <@ RO.get (oget il);
      re <- Some r;
    }
    return re;
  }

  proc orclR (m:plaintext, sk: skey, c:ciphertext) : bool = {
    return false;
  }

  proc orclL (m:plaintext, sk: skey, c:ciphertext) : bool = {
    var r, c', rv;
    r <@ RO.get(m);
    c' <- enc r (sk.`1) (m);
    rv <- c = c';
    return rv;
  }
}.

local module Orclb = Orclb_(RO.RO).

module H(RO:POracle) = { 
  import var Gm
  proc get (x:plaintext) = {
    var r;
    if (x \notin log) {
      r <@ RO.get(x);
      log.[x] <- r;
    }
    return oget log.[x];
  }
}.

(* Jumps to a game where the ciphertext validity oracle
   cannot possibly interfere with OW solutions because
   it will reject all entries that encrypt the challenge
   m. This is done one cvo query at a time *)
local module G0 (Ob:Orclb) (Oh:Orcl) = {
  import var OW_PCVA Gm

  module RO = {
    proc init () = {Ob.leaks(None); log <- empty; }
    proc get (m:plaintext) = { var r; r <@ Ob.leaks(Some m); return oget r; }
  }

  module H = H(RO)

  module O = {
    proc pco(m : plaintext, c : ciphertext) : bool = {
      var m', rv, r, c';
      rv <- false;
      m' <- dec (sk.`2) c;
      r  <@ H.get(m);
      if (m' = Some m) {
        c' <- enc r sk.`1 m;
        rv <- c = c';
      }
      return rv;
    }

    proc cvo(c:ciphertext) : bool = {
      var rv, m', r, c';

      rv <- false; 
      if (c <> cc) { 
        m' <- dec (sk.`2) c;
        if (m' <> None) {
          if (oget m' \in log) { 
            r   <- oget log.[oget m']; 
            c' <- enc r (sk.`1) (oget m');
            rv <- c = c';
          } else {
            if (oget m' = Gm.m) {
              c' <- enc Gm.r (sk.`1) (oget m');
              rv <- c = c';
            } else rv <@ Oh.orcl(oget m', sk, c);
          }
        }
      }
      return rv;
    }
  }

  module A = A(CountH(H), CountO(O)) 

  proc main() : bool = {
    var pk : pkey;
    var m' : plaintext;
    var b;
    RO.init();
    (pk, sk) <@ TT(RO).kg();
    m        <$ dplaintext;
    r        <@ RO.get(m);
    cc       <- enc r pk m; 

    CountO(O).init();
    m'       <@ A.find(pk,cc);
    b        <- dec sk.`2 cc = Some m';
    return b; 
  }

}.

op incl ['a, 'b] (m1 m2: ('a, 'b) fmap) = 
  forall x, x \in m1 => m1.[x] = m2.[x].

local equiv RO_get : RO.RO.get ~ RO.RO.get : 
  ={arg} /\ (={glob RO.RO} /\ (incl Gm.log RO.RO.m /\ RO.RO.m.[Gm.m] = Some Gm.r){2}) 
  ==>
  ={res} /\ (={glob RO.RO} /\ (incl Gm.log RO.RO.m /\ RO.RO.m.[Gm.m] = Some Gm.r){2}).
proof.
  proc; inline *; auto => />; smt (get_setE).
qed.

local equiv RO_RO0_get : RO.RO.get ~ G0(Orclb, OrclCount(L(Orclb))).RO.get : 
  ={arg} /\ (={glob RO.RO} /\ (incl Gm.log RO.RO.m /\ RO.RO.m.[Gm.m] = Some Gm.r){2}) 
  ==>
  ={res} /\ (={glob RO.RO} /\ (incl Gm.log RO.RO.m /\ RO.RO.m.[Gm.m] = Some Gm.r){2}).
proof.
  proc; inline *; rcondf{2} 2; auto => />; smt (get_setE).
qed.

local equiv RO_H_get : RO.RO.get ~ G0(Orclb, OrclCount(L(Orclb))).H.get : 
  ={arg} /\ (={glob RO.RO} /\ (incl Gm.log RO.RO.m /\ RO.RO.m.[Gm.m] = Some Gm.r){2}) 
  ==>
  ={res} /\ (={glob RO.RO} /\ (incl Gm.log RO.RO.m /\ RO.RO.m.[Gm.m] = Some Gm.r){2}).
proof.
  proc *; inline *; wp; sp.
  if{2}; 1: rcondf{2} 3; auto => />; smt(get_setE).
qed.

local lemma G_PCO2_G0 &m : 
  Pr[G_PCO2.distinguish() @ &m : res] = Pr[Ln(Orclb,G0).main() @ &m : res].
proof.
  byequiv ( : ={glob A} ==> ={res}) => //.
  proc; inline{2} 2; wp.
  call (: ={glob OW_PCVA, glob RO.RO} /\ (incl Gm.log RO.RO.m /\ RO.RO.m.[Gm.m] = Some Gm.r){2}).
  + proc. inline TT(RO.RO).dec; inline{2} 1; wp; sp; if => //.
    wp; sp; if => //.
    if{2}; 1 : by inline *; auto => /> /#.
    inline OrclCount(L(Orclb)).orcl Count.incr L(Orclb).orcl.
    if{2}.
    + by inline{1} 1; rcondf{1} ^if; auto => /> /#.
    by wp; call RO_get; auto => /> /#.
  + proc *. inline{2} 1; wp.
    inline{1} 1; inline{2} 3.
    by wp; call RO_H_get; wp; skip => /> /#.
  + by proc *; inline{2} 1; wp; call RO_H_get; auto.
  inline{2} 7; wp.
  inline *.
  rcondt{1} ^if; 1: by auto; move=> *; rewrite mem_empty.
  rcondt{2} 3; 1: by auto.
  rcondf{2} ^if; 1: by auto.
  rcondt{2} ^if; 1: by auto; move=> *; rewrite mem_empty.
  auto => />; smt(get_setE mem_empty).
qed.  

(* Remark : Rn(Orclb,HA).main corresponds to game G1 in HHK *)

local lemma G0_G1 &m : 
 (forall (RO<:POracle{ -CountO, -A })(O<:VA_ORC { -CountO, -A }), 
  hoare [A(CountH(RO), CountO(O)).find : 
       CountO.c_h = 0   /\ CountO.c_cvo = 0   /\ CountO.c_pco = 0 ==> 
       CountO.c_h <= qH /\ CountO.c_cvo <= qV /\ CountO.c_pco <= qP]) =>

  (forall (H0 <: POracle { -A }) (O <: VA_ORC { -A }),
  islossless O.cvo => islossless O.pco => islossless H0.get => islossless A(H0, O).find) =>

  Pr[Ln(Orclb,G0).main() @ &m : res] =
  Pr[Rn(Orclb,G0).main() @ &m : res] +
    qV%r * (Pr[HybGame(G0,Orclb,L(Orclb)).main() @ &m : res]
               - Pr[HybGame(G0,Orclb,R(Orclb)).main() @ &m : res]).
proof.
  move => A_count A_ll.
  have /= /# := Hybrid_restr Orclb G0 _ _ _ _ _ &m (fun _ _ _ r => r).
  + move=> O.
    proc. inline 2.
    conseq (_ : Count.c <= CountO.c_cvo) (_: CountO.c_cvo <= qV); 1: smt().
    + wp; call (A_count (<:G0(Orclb, OrclCount(O)).H) (<: G0(Orclb, OrclCount(O)).O)).
      by inline 7; wp; conseq />.
    wp; call (: Count.c <= CountO.c_cvo).
    + proc; inline 1; wp; sp.
      if; 2: skip => /#.
      sp; if; 2: skip => /#.
      if; 1: auto => /> /#.
      if; 1: auto => /> /#.
      inline 1; inline 3; wp.
      by conseq (: true) => // /#.
    + by conseq />.
    + by conseq />.
    by inline 7; wp; inline 1; sp; conseq />.
  + by islossless. + by islossless. + by islossless.
  move=> Ob0 LR orcl_ll leaks_ll orclL_ll orclR_ll.
  islossless; apply (A_ll (<:CountH(G0(Ob0, LR).H)) (<:CountO(G0(Ob0, LR).O))); islossless.
qed.

(* We bound the diff between the HybGame *)
local module Orclb1 : Orclb = {
  var bad : bool
  include var Orclb[leaks, orclL]

  proc orclR (m:plaintext, sk: skey, c:ciphertext) : bool = {
    var r;
    r <@ RO.RO.get(m);
    bad <- bad || enc r (sk.`1) (m) = c;
    return false;
  }
}.

local module Orclb2(RO:RO.RO) : Orclb = {
  include var Orclb_(RO)[leaks, orclL]

  proc orclR (m:plaintext, sk: skey, c:ciphertext) : bool = {
    RO.sample(m);
    return false;
  }
}.

(* Abstracting over HybGame(G0) *)

local module H_bad_ (HA: AdvOrclb)(O:Orclb) = {
   var c : int
   proc main () = {
     var b;
     Orclb1.bad <- false; c <- 0;
     b <@ HA(Orclb,R(O)).main();
     return b;
   }
}.

local module H_bad (HA:AdvOrclb) = H_bad_ (HA, Orclb1).

local module D (HA:AdvOrclb) (RO:RO.RO) = {
  proc distinguish = HA(Orclb_(RO),R(Orclb2(RO))).main
}.

local lemma HA_bad1 (HA <: AdvOrclb {-Orclb, -Orclb1, -RO.FRO, -H_bad}) &m : 
  ( forall (Ob <: Orclb{-HA}) (O <: Orcl{-HA}),
     islossless O.orcl => islossless Ob.leaks => islossless Ob.orclL => islossless Ob.orclR => 
     islossless HA(Ob, O).main) =>
   Pr[HA(Orclb,L(Orclb)).main() @ &m : res] <=
   Pr[HA(Orclb,R(Orclb)).main() @ &m : res] + 
   Pr[H_bad(HA).main() @ &m : Orclb1.bad].
proof.
  move=> HA_ll.
  have <- :  
    Pr[H_bad(HA).main() @ &m : res] = 
    Pr[HA(Orclb,R(Orclb)).main() @ &m : res].
  (* We need lazy/eager *)
  + have -> : 
      Pr[H_bad(HA).main() @ &m : res] = 
      Pr[D(HA, RO.RO).distinguish() @ &m : res].
    + byequiv => //. 
      proc *; inline{1} 1; wp. 
      sim (Orclb1.orclR ~ Orclb2(RO.RO).orclR : ={RO.RO.m}).
      by proc; inline *; sim.
    have -> : Pr[D(HA, RO.RO).distinguish() @ &m : res] =
              Pr[D(HA, RO.LRO).distinguish() @ &m : res].
    + by byequiv(RO_LRO_D (D(HA)) _) => // *; apply randd_ll.
    byequiv => //.
    sim (: ={glob RO.RO}).
    by proc; inline *; auto.
  byequiv => //.
  proc *; inline{2} 1.
  wp; call (: Orclb1.bad, ={glob Orclb}).
  + proc.
    wp; call (: ={glob RO.RO}); 1: by sim.
    auto => /> /#.
  + by move=> *; islossless.
  + move=> *; proc; wp; conseq (_: true) => />; islossless.
  + by sim />.
  + by move=> *; islossless.
  + by move=> *; conseq />; islossless.
  + by conseq (: ={res, glob Orclb}) => //; sim.
  + by move=> *; islossless.
  + by move=> *; conseq />; islossless.
  + by conseq (: ={res, glob Orclb}) => //; sim.
  + by move=> *; islossless.
  + by move=> *; conseq />; islossless.
  by auto => /> /#.
qed.

local lemma G0_G1_1 &m : 
 (forall (RO<:POracle{ -CountO, -A })(O<:VA_ORC { -CountO, -A }), 
  hoare [A(CountH(RO), CountO(O)).find : 
       CountO.c_h = 0   /\ CountO.c_cvo = 0   /\ CountO.c_pco = 0 ==> 
       CountO.c_h <= qH /\ CountO.c_cvo <= qV /\ CountO.c_pco <= qP]) =>

  (forall (H0 <: POracle { -A }) (O <: VA_ORC { -A }),
  islossless O.cvo => islossless O.pco => islossless H0.get => islossless A(H0, O).find) =>
  Pr[Ln(Orclb,G0).main() @ &m : res] <=
  Pr[Rn(Orclb,G0).main() @ &m : res] + 
    qV%r * Pr[H_bad(HybGame(G0)).main() @ &m : Orclb1.bad].
proof.
  move => A_count A_ll.
  have -> := G0_G1 &m A_count A_ll.
  case(qV = 0);1: by smt().
  move => qVn0.
  apply StdOrder.RealOrder.ler_add => //.
  apply StdOrder.RealOrder.ler_pmul2l; 1: smt (ge0_qV).
  have /# := HA_bad1 (HybGame(G0)) &m _.
  move=> Ob O orcl_ll leaks_ll orclL_ll orclR_ll; islossless.
  + apply (A_ll (<:CountH(G0(Ob, HybOrcl(Ob, O)).H)) (<:CountO(G0(Ob, HybOrcl(Ob, O)).O))); islossless.
  smt (dinter_ll ge0_qV).
qed.

(* Now we focus on 
     Pr[H_bad(HybGame(G0)).main() @ &m : Orclb1.bad]
   We show that it is less than gamma_spread.
   Remark that bad can be set only once ...
*)

local module Orclb1' : Orclb = {
  include var Orclb[leaks, orclL]
  import var Orclb1

  proc orclR (m:plaintext, sk: skey, c:ciphertext) : bool = {
    var r;
    (* This test is added for the next step, it ensure that sk in a valid key pair *)
    if (sk \in kg) { 
      r <$ randd;
      RO.RO.m.[m] <- r;
      bad <- bad || enc r (sk.`1) (m) = c;
    }
    H_bad_.c <- H_bad_.c + 1;
    return false;
  }
}.

local equiv Orclb1_Orclb1'_Hget : 
  G0(Orclb, HybOrcl(Orclb, R(Orclb1))).H.get ~
  G0(Orclb, HybOrcl(Orclb, R(Orclb1'))).H.get : 
  ={arg} /\ (={glob RO.RO, glob OW_PCVA, glob Orclb1, Gm.log, Gm.m, Gm.r, glob HybOrcl} /\
            (HybOrcl.l <= HybOrcl.l0 => eq_except (pred1 Gm.m) Gm.log RO.RO.m){2}) ==>
  ={res} /\ (={glob RO.RO, glob OW_PCVA, glob Orclb1, Gm.log, Gm.m, Gm.r, glob HybOrcl} /\
            (HybOrcl.l <= HybOrcl.l0 => eq_except (pred1 Gm.m) Gm.log RO.RO.m){2}).
proof.
  proc; if => //; inline *; wp.
  rcondf{1} ^if; 1: by auto.
  rcondf{2} ^if; 1: by auto.
  auto => />; smt (get_setE).
qed.

local lemma H_bad_Orclb1' &m : 
  Pr[H_bad(HybGame(G0)).main() @ &m : Orclb1.bad] = 
  Pr[H_bad_(HybGame(G0), Orclb1').main() @ &m : Orclb1.bad /\ H_bad_.c <= 1].
proof.
  byequiv => //; proc.
  inline{1} 3; inline{2} 3.
  inline{1} 5; inline{2} 5.
  wp. 
  call ( : ={glob RO.RO, glob OW_PCVA, glob Orclb1, Gm.log, Gm.m, Gm.r, glob HybOrcl} /\
            (H_bad_.c = b2i (HybOrcl.l0 < HybOrcl.l)){2} /\
            (OW_PCVA.sk \in kg){2} /\
            (HybOrcl.l <= HybOrcl.l0 => eq_except (pred1 Gm.m) Gm.log RO.RO.m){2}).
  + proc; wp; inline{1} 1; inline{2} 1; sp; wp.
    if => //; sp; if => //.
    if => //; 1: by auto.
    if => //; 1: by auto.
    inline{1} 1; inline{2} 1; sp; wp.
    if => //; 1: by inline *; auto => />; smt(get_setE).
    if => //; 2: by inline *; auto => /> /#.
    inline *; rcondt{1} ^if; 1: by auto => /> /#.
    by rcondt{2} ^if; auto => />; smt(get_setE).
  + proc; wp.
    inline{1} 1; inline{2} 1.
    by wp; call Orclb1_Orclb1'_Hget; wp. 
  + by proc; wp; call Orclb1_Orclb1'_Hget.
  inline *.
  rcondt{1} 6; 1: by auto.
  rcondt{2} 6; 1: by auto.
  rcondf{1} ^if; 1: by auto.
  rcondf{2} ^if; 1: by auto.
  auto => />; smt(get_setE mem_empty supp_dinter).
qed.

pred gamma_spread_ok(gamma_spread : real) = 
 forall pk sk m c, (pk, sk) \in kg =>
   mu randd (fun r => enc r pk m = c) <= gamma_spread.

local lemma ge0_gamma_spread gamma_spread :
  gamma_spread_ok gamma_spread => 0%r <= gamma_spread.
proof.
rewrite /gamma_spread_ok => gOK.
have := witness_support predT kg; rewrite kg_ll /= => pkskH.
have := witness_support predT randd; rewrite randd_ll /= => rH.
elim pkskH => pksk pkskin. 
elim rH => r rin. 
have :=  gOK pksk.`1 pksk.`2 witness (enc r pksk.`1 witness) _;1 :by smt().
by smt(witness_support).
qed.

(* Now we can trivially bound the probability of Orcl1.bad using fel *)
local lemma H_bad_gamma_spread &m gamma_spread: 
  gamma_spread_ok gamma_spread => 
  Pr[H_bad_(HybGame(G0), Orclb1').main() @ &m : Orclb1.bad /\ H_bad_.c <= 1] <=
    gamma_spread.
proof.
  rewrite /gamma_spread_ok;move => gs_ok.
  fel 2 H_bad_.c (fun _, gamma_spread) 1 Orclb1.bad []=> //.
  + by rewrite StdBigop.Bigreal.BRA.big_int1.
  + by auto.
  + proc; wp; if; wp.
    + rnd; skip => /> &1 _ _ _; case: (sk{1}) => pk sk hsk.
      by apply (gs_ok pk sk m{1} c{1} hsk).
    conseq (: _ ==> false : = 0%r) => />; 2: by auto.
    by move=> &1 _ _ _ _; apply (ge0_gamma_spread gamma_spread gs_ok).
  move=> c; proc; if; auto => /> /#.
qed.

local lemma OW_PCVA_gamma &m gamma_spread:
 gamma_spread_ok gamma_spread =>
 
 (forall (RO<:POracle{ -CountO, -A })(O<:VA_ORC { -CountO, -A }), 
  hoare [A(CountH(RO), CountO(O)).find : 
       CountO.c_h = 0   /\ CountO.c_cvo = 0   /\ CountO.c_pco = 0 ==> 
       CountO.c_h <= qH /\ CountO.c_cvo <= qV /\ CountO.c_pco <= qP]) =>

  (forall (H0 <: POracle { -A }) (O <: VA_ORC { -A }),
  islossless O.cvo => islossless O.pco => islossless H0.get => islossless A(H0, O).find) =>

  Pr[OW_PCVA(RO.LRO, TT, A).main() @ &m : res] <= 
     Pr[Rn(Orclb,G0).main() @ &m : res] + qV%r * gamma_spread.
proof.
  move => gs_ok A_count A_ll.
  have := (OW_PCVA_G_PCO &m).
  rewrite (PCO_PCO2 &m) (G_PCO2_G0 &m).
  move: (G0_G1_1 &m A_count A_ll) (H_bad_Orclb1' &m) (H_bad_gamma_spread &m) ge0_qV. 
  by smt().
qed.

module G2_O (RO:POracle) = {
  import var OW_PCVA Gm

  proc pco(m : plaintext, c : ciphertext) : bool = {
    var m', r, c';
    m' <- dec (sk.`2) c;
    r  <@ H(RO).get(m);
    c' <- enc r sk.`1 m;
    bad_corr <- if (c = c' /\ m' <> Some m) then Some m else bad_corr;
    return c = c';
  }
  
  proc cvo(c:ciphertext) : bool = {
    var rv, m' (* , r, c' *);
  
    rv <- false; 
    if (c <> cc) { 
      m' <- dec (sk.`2) c;
      rv <- find (fun m r => c = enc r sk.`1 m) log <> None;
      if (m' <> None) {
        if (oget m' \in log) { 
           bad_corr <- 
            let f = find (fun m r => c = enc r sk.`1 m) log in
            if f <> None /\ (oget f).`1 <> oget m' then Some (oget f).`1 else bad_corr; 
        } else {
          if (oget m' = Gm.m) {
            bad_corr <- 
              let f = find (fun m r => c = enc r sk.`1 m) log in
               if f <> None /\ (oget f).`1 <> oget m' then Some (oget f).`1 else bad_corr; 
          } else {
            bad_corr <- 
              let f = find (fun m r => c = enc r sk.`1 m) log in
              if f <> None then Some (oget f).`1 else bad_corr;
          }
        }    
      } else {
        bad_corr <- 
          let f = find (fun m r => c = enc r sk.`1 m) log in
          if f <> None then Some (oget f).`1 else bad_corr;
      }
    }
    return rv;
  }
}.

local module G2 = {
  import var OW_PCVA Gm

  module H = H(RO.RO)
  module O = G2_O(RO.RO)
  module A = A(CountH(H), CountO(O))

  proc main() : bool = {
    var pk : pkey;
    var m' : plaintext;
    var b;
    RO.RO.init(); Gm.log <- empty; bad_corr <- None;
    (pk, sk) <@ TT(RO.RO).kg();
    m        <$ dplaintext;
    r        <@ RO.RO.get(m);
    cc       <- enc r pk m; 

    CountO(O).init();
    m'       <@ A.find(pk,cc);
    b        <- dec sk.`2 cc = Some m' /\ m = m';
    bad_corr <- if dec sk.`2 cc = Some m' /\ m <> m' then Some m else bad_corr;
    return b; 
  }

}.

local equiv G1_G2_RO : 
  G0(Orclb_(RO.RO), OrclCount(R(Orclb_(RO.RO)))).RO.get ~ RO.RO.get : 
  ={arg, glob RO.RO}
  ==>
  ={res, glob RO.RO}.
proof.
  proc; inline{1} 1; rcondf{1} 2; 1: by auto.
  inline{1} 2; auto.
qed.

local equiv G1_G2_H : 
  G0(Orclb_(RO.RO), OrclCount(R(Orclb_(RO.RO)))).H.get ~ G2.H.get : 
  ={x, glob RO.RO, Gm.log}
  ==>
  ={res, glob RO.RO, Gm.log}.
proof. by proc; if => //; wp; call G1_G2_RO. qed.
 
local lemma G1_G2 &m : 
  (forall (H0 <: POracle { -A }) (O <: VA_ORC { -A }),
  islossless O.cvo => islossless O.pco => islossless H0.get => islossless A(H0, O).find) =>

  Pr[Rn(Orclb,G0).main() @ &m : res] <= Pr[ G2.main() @ &m : res] + Pr[G2.main() @ &m : Gm.bad_corr <> None].
proof.
  move => A_ll.
  byequiv => //; proc.
  inline{1} 2; wp.
  call (: Gm.bad_corr <> None, ={glob OW_PCVA, glob RO.RO, Gm.log, Gm.m, Gm.r} /\
                          (OW_PCVA.cc = enc Gm.r OW_PCVA.sk.`1 Gm.m){2}).
  + proc; wp.
    inline{1} 1; inline{2} 1; sp 2 2.    
    if => //; 2: by auto.
    sp 1 2; if => //; 2: by wp; skip => /> &2; case: (find _ _).
    if => //; 1: by auto => />; smt(findP_Some findP_None).
    elim * => rv_R; inline *.  
    by if => //; wp; skip => />; smt(findP_Some).
  + by move=> *; islossless.
  + by move=> _; proc; inline 1; wp; skip => /#.
  + proc; wp; inline{1} 1; inline{2} 1.
    by sp; wp; call G1_G2_H; skip => /> /#.
  + by move=> *; islossless.
  + move=> _; proc; inline 1; wp.
    by conseq (: true); [smt() | islossless].
  + by proc; wp; call G1_G2_H.
  + by move=> *; islossless.
  + by move=> *; conseq />; islossless.
  inline{1} 7; inline{2} 8; wp.
  call G1_G2_RO; inline *.
  by rcondt{1} ^if; auto => /> /#.
qed.

module AdvCorr (A:PCVA_ADV) (RO:POracle) = {
  import var OW_PCVA Gm

  module H = H(RO)
  module O = G2_O(RO)
  module A = A(CountH(H), CountO(O))

  proc find(pk:pkey, sk:skey) : plaintext = {
    var m' : plaintext;
    OW_PCVA.sk <- sk;
    Gm.log <- empty; bad_corr <- None;
    m        <$ dplaintext;
    r        <@ RO.get(m);
    cc       <- enc r pk m; 

    CountO(O).init();
    m'       <@ A.find(pk,cc);
    bad_corr <- if dec sk.`2 cc = Some m' /\ m <> m' then Some m else bad_corr;
    return oget Gm.bad_corr; 
  }
}.

op inv_G2_corr (log ro : (plaintext, randomness) fmap) (sk:skey) 
        bad_corr gm gr = 
  incl log ro /\ gm \in ro /\ gr = oget ro.[gm] /\
  (bad_corr <> None => 
      let m = oget bad_corr in
      let r = oget ro.[m] in
      let c = enc r sk.`1 m in
      let m' = dec sk.`2 c in
      m \in ro /\ m' <> Some m).

local equiv G2_corr_H m_ : H(RO.RO).get ~ H(RO.RO).get : 
   ={x} /\ x{2} = m_ /\ ={glob RO.RO, glob Gm, glob OW_PCVA} /\ 
   (inv_G2_corr Gm.log RO.RO.m OW_PCVA.sk Gm.bad_corr Gm.m Gm.r){2} ==>
   ={res} /\  ={glob RO.RO, glob Gm, glob OW_PCVA} /\ 
   ( m_ \in RO.RO.m /\ res = oget RO.RO.m.[m_] /\
     inv_G2_corr Gm.log RO.RO.m OW_PCVA.sk Gm.bad_corr Gm.m Gm.r){2}.
proof.
  proc; if => //; 2: by skip => /> /#.
  inline *; auto => />; smt(get_setE).
qed.
    
local lemma G2_correctness &m : 
  Pr[G2.main() @ &m : Gm.bad_corr <> None] <= 
  Pr[ Correctness_Adv(RO.RO,TT,AdvCorr(A)).main() @ &m : res ].
proof.
  byequiv => //; proc.
  inline{2} 3.
  seq 11 13 : 
    (={glob RO.RO, glob Gm, glob OW_PCVA} /\ 
     (pk = OW_PCVA.sk.`1 /\ OW_PCVA.sk = sk){2} /\
     (inv_G2_corr Gm.log RO.RO.m OW_PCVA.sk Gm.bad_corr Gm.m Gm.r){2}); last first.
  + case: (Gm.bad_corr{1} <> None).
    + inline *.
      rcondf{2} 6; 1: by auto => /> /#.
      swap{2} 5 8; sp; if{2}; auto => /> /#.
    conseq (:true); 1: smt(). 
    by do 2!( call{2}(:true ==> true); 1: by islossless); auto.
  wp; call (: ={glob RO.RO, glob Gm, glob OW_PCVA} /\ 
          (inv_G2_corr Gm.log RO.RO.m OW_PCVA.sk Gm.bad_corr Gm.m Gm.r){2}).
  + proc; wp.
    inline{1} 1; inline{2} 1.
    sp 2 2; if => //; 2: by auto.
    sp 2 2; elim * => rv_R rv_L.
    if => //; 2: by auto => />; smt(findP_Some).
    if => //; 1: by auto => />; smt(findP_Some).
    if => //; auto => />; smt(findP_Some).
  + proc; inline{1} 1; inline{2} 1; wp.
    by ecall (G2_corr_H m{2}); wp; skip => /> /#. 
  + by proc; wp; ecall (G2_corr_H x{2}).
  inline *.
  rcondt{1} ^if; 1: by auto => />; smt(mem_empty).
  rcondt{2} ^if; 1: by auto => />; smt(mem_empty).
  auto => />; smt(get_setE mem_empty).
qed.

local module G3 = {
  import var OW_PCVA Gm O_AdvOW

  module A = A(CountH(RO.RO), CountO(O_AdvOW))

  proc main() : bool = {
    var m' : plaintext;
    var b;
    RO.RO.init();
    (pk, sk) <@ TT(RO.RO).kg();
    m        <$ dplaintext;
    r        <$ randd; 
    cc       <- enc r pk m; 

    CountO(O_AdvOW).init();
    m'       <@ A.find(pk,cc);
    b        <- dec sk.`2 cc = Some m' /\ m = m';
    return b; 
  }
}.

local equiv G2_G3_H : H(RO.RO).get ~ RO.RO.get : 
  Gm.m{2} \notin RO.RO.m{2} /\
  ={arg} /\ ={Gm.m, OW_PCVA.cc} /\
     eq_except (pred1 Gm.m{2}) RO.RO.m{2} RO.RO.m{1} /\ OW_PCVA.sk{1}.`1 = O_AdvOW.pk{2} /\ RO.RO.m{2} = Gm.log{1} ==>
  Gm.m{2} \notin RO.RO.m{2} =>
  ={res} /\ ={Gm.m, OW_PCVA.cc} /\
     eq_except (pred1 Gm.m{2}) RO.RO.m{2} RO.RO.m{1} /\ OW_PCVA.sk{1}.`1 = O_AdvOW.pk{2} /\ RO.RO.m{2} = Gm.log{1}.
proof.
  proc; inline *; wp; sp; if{1}; auto => />; smt(get_setE).
qed.

local lemma RO_in : phoare[RO.RO.get : Gm.m \in RO.RO.m ==> Gm.m \in RO.RO.m] =1%r.
proof.
  conseq (: true ==> true: = 1%r) (: Gm.m \in RO.RO.m ==> Gm.m \in RO.RO.m) => //.
  + by proc; inline *; auto => />; smt(get_setE). 
  by islossless.
qed.

(* This is magic ... *)
local lemma G2_G3 &m : 
  (forall (H0 <: POracle { -A }) (O <: VA_ORC { -A }),
  islossless O.cvo => islossless O.pco => islossless H0.get => islossless A(H0, O).find) =>

   Pr[G2.main() @ &m : res] <= 
   Pr[G3.main() @ &m : res] + Pr[G3.main() @ &m : dec OW_PCVA.sk.`2 OW_PCVA.cc = Some Gm.m /\ Gm.m \in RO.RO.m].
proof.
  move => A_ll.
  byequiv => //; proc; wp.
  call (: Gm.m \in RO.RO.m, ={Gm.m, OW_PCVA.cc} /\ eq_except (pred1 Gm.m{2}) RO.RO.m{2} RO.RO.m{1} /\ 
                   OW_PCVA.sk{1}.`1 = O_AdvOW.pk{2} /\ RO.RO.m{2} = Gm.log{1}).
  + by proc; inline{1} 1; inline{2} 1; auto => />.
  + by move=> *; islossless.
  + by move=> *; conseq />; islossless.
  + by proc; inline{1} 1; inline{2} 1; wp; call G2_G3_H; auto => /> /#.
  + by move=> *; islossless.
  + by move => /=; proc; inline 1; wp; call RO_in; auto.
  + by proc; wp; call G2_G3_H; auto.
  + by move=> *; islossless.
  + by move=> *; proc; wp; call RO_in; auto.
  inline *; auto => /> -[pk sk] hk m _ r _; smt(get_setE mem_empty).
qed.

local lemma G3_OW_CPA &m : 
  Pr[G3.main() @ &m : res] <= 
  Pr[OW_CPA(BasePKE, AdvOW(A)).main() @ &m : res].
proof.
  byequiv => //; proc.
  inline{2} OW_CPA(BasePKE, AdvOW(A)).O.pco AdvOW(A).find BasePKE.dec; wp.
  swap{2} 7 -6.
  call (: ={glob RO.RO, OW_PCVA.cc, O_AdvOW.pk}); 1..3: by sim.  
  inline *; auto.
qed.

local clone import PlugAndPray as PAP1 with
  type tval <- int,
  op indices <-  iota_ 0 (max 1 (qH + qP)), 
  type tin <- unit, 
  type tres <- bool
  proof *.

realize indices_not_nil by
 smt(uniq_size_uniq iota_uniq size_iota size_eq0 ge0_qH ge0_qP).

local equiv RO_count c : RO.RO.get ~ RO.RO.get : 
  ={x, RO.RO.m} /\ card (fdom RO.RO.m{1}) = c ==>
  ={res, RO.RO.m} /\ card (fdom RO.RO.m{1}) <= c + 1.
proof.
  proc; auto => /> &2 r; rewrite fdom_set fcardU fcard1; smt(fcard_ge0). 
qed.

local lemma G3_Adv_queryA :
 (forall (RO<:POracle{ -CountO, -A })(O<:VA_ORC { -CountO, -A }), 
  hoare [A(CountH(RO), CountO(O)).find : 
       CountO.c_h = 0   /\ CountO.c_cvo = 0   /\ CountO.c_pco = 0 ==> 
       CountO.c_h <= qH /\ CountO.c_cvo <= qV /\ CountO.c_pco <= qP]) =>

  (forall (H0 <: POracle { -A }) (O <: VA_ORC { -A }),
  islossless O.cvo => islossless O.pco => islossless H0.get => islossless A(H0, O).find) =>

  equiv [
  G3.A.find ~ AdvOW_query(A).A.find : 
  ={arg} /\ ={glob A, OW_PCVA.cc, O_AdvOW.pk, RO.RO.m, glob CountO} /\ 
    (CountO.c_h = 0   /\ CountO.c_cvo = 0   /\ CountO.c_pco = 0 /\ RO.RO.m = empty){1} ==> 
  ={res} /\ ={glob A, OW_PCVA.cc, O_AdvOW.pk, RO.RO.m, glob CountO} /\
    (CountO.c_h <= qH /\ CountO.c_cvo <= qV /\ CountO.c_pco <= qP /\
    card (fdom RO.RO.m) <= qH + qP){1} ].
proof.
  move => A_count A_ll.
  conseq (: ={arg} /\ ={glob A, OW_PCVA.cc, O_AdvOW.pk, RO.RO.m, glob CountO} /\ 
           (card (fdom RO.RO.m) <= CountO.c_h + CountO.c_pco){1} ==> 
            ={res} /\ ={glob A, OW_PCVA.cc, O_AdvOW.pk, RO.RO.m, glob CountO} /\ 
            (card (fdom RO.RO.m) <= CountO.c_h + CountO.c_pco){1})
         (A_count (<:RO.RO) (<:O_AdvOW)) => />.
  + by rewrite fdom0 fcards0. + smt().
  proc ( ={OW_PCVA.cc, O_AdvOW.pk, RO.RO.m, glob CountO} /\ 
            (card (fdom RO.RO.m) <= CountO.c_h + CountO.c_pco){1}) => //.
  + conseq />; sim.
  + by proc; inline {1} 1; inline {2} 1; wp; ecall (RO_count (card (fdom RO.RO.m{1}))); auto => /> /#.
  proc; wp;  ecall (RO_count (card (fdom RO.RO.m{1}))); auto => /> /#.
qed.

local lemma count0 :
 qH = 0 => qP = 0 =>
 (forall (RO<:POracle{ -CountO, -A })(O<:VA_ORC { -CountO, -A }), 
  hoare [A(CountH(RO), CountO(O)).find : 
       CountO.c_h = 0   /\ CountO.c_cvo = 0   /\ CountO.c_pco = 0 ==> 
       CountO.c_h <= qH /\ CountO.c_cvo <= qV /\ CountO.c_pco <= qP]) =>

hoare [
  G3.A.find : 
  CountO.c_h = 0 /\ CountO.c_pco = 0 /\ CountO.c_cvo = 0 /\ RO.RO.m = empty==>
  RO.RO.m = empty].
proof.
move => qH0 qP0 A_count.
conseq (:card (fdom RO.RO.m) <= CountO.c_h + CountO.c_pco  ==>
         card (fdom RO.RO.m) <= CountO.c_h + CountO.c_pco) 
                (A_count  (<:RO.RO) (<:O_AdvOW));1,2:
                 smt(fdom0 fcards0 fdom_eq0 fcard_ge0 fcard_eq0).
proc (card (fdom RO.RO.m) <= CountO.c_h + CountO.c_pco);
       1,2:smt(fdom0 fcards0 fdom_eq0 fcard_ge0 fcard_eq0).

+ by proc;wp;call(:card (fdom RO.RO.m) <= CountO.c_h + CountO.c_pco);auto. 
+ proc; wp;call(_:card (fdom RO.RO.m) <= CountO.c_h + CountO.c_pco ==>
                   card (fdom RO.RO.m) <= CountO.c_h + CountO.c_pco + 1).
  + by proc;inline *; auto; move => &hr ? r _ /=;smt(card_set).   
  by auto;smt(fdom0 fcards0 fdom_eq0 fcard_ge0 fcard_eq0).
+ proc; wp. call(_:card (fdom RO.RO.m) <= CountO.c_h + CountO.c_pco ==>
                   card (fdom RO.RO.m) <= CountO.c_h + CountO.c_pco + 1).
  proc;inline *; auto.  move => &hr ? r _ /=; smt(card_set). 
   by auto;smt(fdom0 fcards0 fdom_eq0 fcard_ge0 fcard_eq0).
qed.

local lemma G3_OW_CPA_query &m : 
 (forall (RO<:POracle{ -CountO, -A })(O<:VA_ORC { -CountO, -A }), 
  hoare [A(CountH(RO), CountO(O)).find : 
       CountO.c_h = 0   /\ CountO.c_cvo = 0   /\ CountO.c_pco = 0 ==> 
       CountO.c_h <= qH /\ CountO.c_cvo <= qV /\ CountO.c_pco <= qP]) =>

  (forall (H0 <: POracle { -A }) (O <: VA_ORC { -A }),
  islossless O.cvo => islossless O.pco => islossless H0.get => islossless A(H0, O).find) =>

  Pr[G3.main() @ &m : dec OW_PCVA.sk.`2 OW_PCVA.cc = Some Gm.m /\ Gm.m \in RO.RO.m] <=
  (qH + qP)%r * Pr[OW_CPA(BasePKE, AdvOW_query(A)).main() @ &m : res].
proof.
  move => A_count A_ll.
  case (qH = 0 /\ qP = 0). 
  + move => [#] qH0 qP0; rewrite qH0 qP0 /=.
    byphoare => //;hoare.
    conseq (_: _ ==> RO.RO.m = empty); 1: by smt(mem_empty).
    proc;wp;seq 6 : (CountO.c_h = 0 /\ CountO.c_pco = 0 /\ CountO.c_cvo = 0 /\
                      RO.RO.m = empty); 1: by inline*;auto.
    by call count0.
       
  move => qHPn0.
  rewrite RField.mulrC -StdOrder.RealOrder.ler_pdivr_mulr; 1: smt (ge0_qH ge0_qP).
print glob G3.
  pose phi := fun (g:glob G3) (b:bool) => dec g.`7.`2 g.`8 = Some g.`2 /\ g.`2 \in g.`9.
  pose psi := fun (g:glob G3) (_:bool) => 
    let i = find (pred1 g.`2) (elems (fdom g.`9)) in
    if 0 <= i < qH + qP then i else 0.
  have := PAP1.PBound G3 phi psi tt &m _. 
  + smt (ge0_qH ge0_qP mem_iota).
  rewrite undup_id 1:iota_uniq size_iota.
  have -> : max 0 (max 1 (qH  + qP)) = qH + qP by smt (ge0_qH ge0_qP).
  rewrite (RField.mulrC (1%r/_)) RField.mulrA /= => ->.
  byequiv => //; rewrite /phi /psi /=.
  proc.
  inline{2} 5; inline{2} 8; inline{2} 4; wp; rnd.
  inline{2} 6; inline{1} 1; wp.
  call G3_Adv_queryA; inline *; auto => />.
  move=> [pk sk] hpk m hm r hr c_cvo c_h c_pco ro 3?.
  rewrite cardE => hs. 
  have -> /= : max 1 (qH + qP) = qH + qP; 1: by smt(ge0_qH ge0_qP).
  split; 1: by smt().
  move  => /> _ i _ _ -> hin ->>.
  have -> /= : 0 <= find (pred1 m) (elems (fdom ro)) && find (pred1 m) (elems (fdom ro)) < qH + qP.
  + rewrite find_ge0.
    have := has_find (pred1 m) (elems (fdom ro)).
    by rewrite has_pred1 -memE mem_fdom hin /= /#.
  have := nth_find witness (pred1 m) (elems (fdom ro)).
  rewrite {2}/pred1 => -> //.
  by rewrite has_pred1 -memE mem_fdom hin.
qed.

lemma corr_red_count (RO <: RO.RO {-CountO, -A, -CO1, -Gm, -OW_PCVA}):
 (forall (RO<:POracle{ -CountO, -A })(O<:VA_ORC { -CountO, -A }), 
  hoare [A(CountH(RO), CountO(O)).find : 
       CountO.c_h = 0   /\ CountO.c_cvo = 0   /\ CountO.c_pco = 0    ==> 
       CountO.c_h <= qH /\ CountO.c_cvo <= qV /\ CountO.c_pco <= qP]) =>
 hoare [
   AdvCorr(A, CO1(RO)).A.find : CO1.counter = 1 /\ CountO.c_h = 0 /\ CountO.c_cvo = 0 /\
       CountO.c_pco = 0 ==> CO1.counter <= 1 + qH + qP].
move => A_count.
conseq(:CO1.counter <= CountO.c_pco + CountO.c_h + 1 ==> CO1.counter <= CountO.c_pco + CountO.c_h + 1) 
   (A_count (H(CO1(RO))) (G2_O(CO1(RO)))); 1,2: smt().
+ proc(CO1.counter <= CountO.c_pco + CountO.c_h + 1);1,2:smt().
+ by proc;inline *;auto => />.
+ proc;inline *;sp;if;last by auto => /#.
  sp;if;sp;if; 1: by wp;call(_: true);auto => /#.
  by wp;call(_: true);auto => /#.
  by wp;call(_: true);auto => /#.
  by auto => /#.
+ proc;inline *;sp;if;last by auto => /#.
  sp;if;sp;if; 1: by wp;call(_: true);auto => /#.
  by wp;call(_: true);auto => /#.
  by wp;call(_: true);auto => /#.
  by auto => /#.
qed.

lemma pre_conclusion &m gamma_spread :
 gamma_spread_ok gamma_spread =>

 (forall (RO<:POracle{ -CountO, -A })(O<:VA_ORC { -CountO, -A }), 
  hoare [A(CountH(RO), CountO(O)).find : 
       CountO.c_h = 0   /\ CountO.c_cvo = 0   /\ CountO.c_pco = 0  ==> 
       CountO.c_h <= qH /\ CountO.c_cvo <= qV /\ CountO.c_pco <= qP]) =>

  (forall (H0 <: POracle { -A }) (O <: VA_ORC { -A }),
  islossless O.cvo => islossless O.pco => islossless H0.get => islossless A(H0, O).find) =>

  Pr[OW_PCVA(RO.LRO, TT, A).main() @ &m : res] <=
      Pr[OW_CPA(BasePKE, AdvOW(A)).main() @ &m : res]
    + (qH + qP)%r * Pr[OW_CPA(BasePKE, AdvOW_query(A)).main() @ &m : res]
    + Pr[ Correctness_Adv(RO.RO,TT,AdvCorr(A)).main() @ &m : res ]
    + qV%r * gamma_spread.
proof.
  move => gs_ok A_count A_ll.
  by move: (OW_PCVA_gamma &m gamma_spread gs_ok A_count A_ll) (G1_G2 &m A_ll) (G2_correctness &m) (G2_G3 &m  A_ll)
     (G3_OW_CPA &m) (G3_OW_CPA_query &m  A_count A_ll) => /#.
qed.

(* +2 could be reduced to +1 because we know the message
   output by our adv is always in the ROM table.
   +1 comes from the pre-fetch of Gm.r. *)

lemma conclusion &m gamma_spread :
 qH + qP + 1 = qHC =>

 qHC < FinT.card -1 =>

 gamma_spread_ok gamma_spread =>

 (forall (RO<:POracle{ -CountO, -A })(O<:VA_ORC {-CountO, -A}), 
  hoare [A(CountH(RO), CountO(O)).find : 
       CountO.c_h = 0   /\ CountO.c_cvo = 0   /\ CountO.c_pco = 0 ==> 
       CountO.c_h <= qH /\ CountO.c_cvo <= qV /\ CountO.c_pco <= qP]) =>

  (forall (H0 <: POracle { -A }) (O <: VA_ORC { -A }),
  islossless O.cvo => islossless O.pco => islossless H0.get => islossless A(H0, O).find) =>

  Pr[OW_PCVA(RO.LRO, TT, A).main() @ &m : res] <=
      Pr[OW_CPA(BasePKE, AdvOW(A)).main() @ &m : res]
    + (qH + qP)%r * Pr[OW_CPA(BasePKE, AdvOW_query(A)).main() @ &m : res]
    + (qH + qP + 2)%r * Pr[ PKE.Correctness_Adv(BasePKE,B(AdvCorr(A),RO.LRO)).main() @ &m : res ]
    + qV%r * gamma_spread.
proof.
  move => counts qhc_small gs_ok A_count A_ll.
  move: (pre_conclusion &m gamma_spread gs_ok A_count A_ll).
  move: (correctness (AdvCorr(A)) &m qhc_small _ _). 
  + move => RO; proc;wp.
    call (corr_red_count RO).
    inline *;wp;conseq />.
    seq 6 : #pre; 1: by auto.
    if;if. 
    + wp;call(_:true);auto => /#.
    + wp;call(_:true);auto => /#.
    + wp;call(_:true);auto => /#.
    auto => /#.
  move => H0 H0_ll;proc;inline *;wp.
  by call(_: true); islossless. 
  by smt().
qed.

(* Benjamin's original notes.
(* Final lemma will be *)
lemma conclusion &m :
  Pr[OW_PCVA(RO.RO, TT, A).main() @ &m : res] <=
      Pr[OW_CPA(BasePKE, AdvOW(A)).main() @ &m : res]
    + (qH + qP)%r * Pr[OW_CPA(BasePKE, AdvOW_query(A)).main() @ &m : res]
    + (qH + qP) %r * Pr[ Correctness_Adv(BasePKE,AdvCorr(A)).main() @ &m : res ]
    + qV%r * gamma_spread.

(* I think we can proof that *) 
lemma conclusion &m :
  Pr[OW_PCVA(RO.RO, TT, A).main() @ &m : res] <=
      Pr[OW_CPA(BasePKE, AdvOW(A)).main() @ &m : res]
    + (qH)%r * Pr[OW_CPA(BasePKE, AdvOW_query(A)).main() @ &m : res]
    + (qH) %r * Pr[ Correctness_Adv(BasePKE,AdvCorr(A)).main() @ &m : res ]
    + (qV + qP)%r * gamma_spread.
*)

end section.
*)
