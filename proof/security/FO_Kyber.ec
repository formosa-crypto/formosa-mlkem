require import AllCore Distr List Real SmtMap FSet DInterval FinType KEM_ROM.
require (****) PKE_ROM PlugAndPray Hybrid FelTactic. 

require FO_UU.
clone import FO_UU as UU.
import KEMROMx2.
import TT.
import PKE.
import PseudoRF.
import RF.

(* we inherit the following axioms 
 TT.dplaintext_ll: is_lossless dplaintext
 TT.dplaintext_uni: is_uniform dplaintext
 TT.dplaintext_fu: is_full dplaintext
 TT.FinT.enum_spec: forall (x : plaintext), count (pred1 x) enum = 1
 TT.randd_ll: is_lossless randd
 TT.kg_ll: is_lossless kg
 TT.ge0_qH: 0 <= qH
 TT.ge0_qV: 0 <= qV
 TT.ge0_qP: 0 <= qP
 TT.ge0_qHC: 0 <= qHC
 dkey_ll: is_lossless dkey
 dkey_uni: is_uniform dkey
 dkey_fu: is_full dkey
 PseudoRF.dK_ll: is_lossless dK
 ge0_qHT: 0 <= qHT
 ge0_qHU: 0 <= qHU
 ge0_qD: 0 <= qD *)

type pkhash.
op pkh : pkey -> pkhash.
(**********)
clone import KEM_ROM.KEM_ROM as KEMROM with
   type pkey <- pkey,
   type skey = (pkey * skey) * K,
   type ciphertext <- ciphertext,
   type key <- key,
   op dkey <- dkey,
   type RO.in_t <- pkhash * plaintext,
   type RO.out_t <- randomness * key,
   op   RO.dout <- fun _ => randd `*` dkey,
   type RO.d_in_t <- unit, 
   type RO.d_out_t <- bool.

(* We inherit the following axioms 
dkey_ll: is_lossless dkey
 dkey_uni: is_uniform dkey
 dkey_fu: is_full dkey*)

(******* Query Bounds ******)

(* Max number of calls to the unique RO *)  
const qHK : { int | 0 <= qHK } as ge0_qHK. 

module CountH(H : POracle) = {
  var c_h   : int

  proc init () = { c_h <- 0;  }

  proc get(x: pkhash * plaintext) = {
    var r;
    r <@ H.get(x);
    c_h <- c_h + 1;
    return r;
  }  
}.


(***************************************)

module (FO_K : KEMROM.Scheme) (H : POracle) = {

  proc kg() : pkey * skey = {
     var pk, sk, k;
     (pk,sk) <$ kg;
     k <$ dK;
     return (pk, ((pk,sk),k));
  }
  
  proc enc(pk : pkey) : ciphertext * key = {
     var m, r, c, k;
     m <$ dplaintext;
     (r,k) <@ H.get(pkh pk,m);
     c <- enc r pk m; 
     return (c,k);
  }
  
  proc dec(sk : skey, c : ciphertext) : key option = {
     var m', c', ks, r, kn;
     m' <- dec sk.`1.`2 c;
     (r,ks) <@ H.get(pkh sk.`1.`1,oget m');
     kn <- F sk.`2 c;
     c' <- enc r sk.`1.`1 (oget m');
     return if (m' <> None /\ c' = c) then (Some ks) else (Some kn);
  }
}.

(* A modular version of the UU construction for moving samples *)

module UU_L(H1 : RO1.RO, H2 : RO2.RO) = {
  include UU(RO_x2(H1,H2)) [kg, enc] 
  proc dec(sk : skey, c : ciphertext) : key option = {
    var m' : plaintext option;
    var r : randomness;
    var c' : ciphertext;
    var rv : plaintext option;
    var k : key;
    
    rv <- None;
    m' <- dec sk.`1.`2 c;
    H1.sample(oget m');
    H2.sample(oget m');
    if (m' <> None) {
      r <@ H1.get(oget m');
      c' <- enc r sk.`1.`1 (oget m');
      rv <- if c = c' then m' else None;
    }
    if (rv = None) 
      k <- F sk.`2 c;
    else 
      k <@ H2.get(oget m');
    
    return Some k;
   }
}.

(* CORRECTNESS PROOF *)

module Correctness_L(H1 : RO1.RO, H2 : RO2.RO) = {
  proc main() : bool = {
    var pk : pkey;
    var sk : KEMROMx2.skey;
    var c : ciphertext;
    var k : key;
    var k' : key option;
    
    H1.init();
    H2.init();
    (pk, sk) <@ UU_L(H1,H2).kg();
    (c, k) <@ UU_L(H1,H2).enc(pk);
    k' <@ UU_L(H1,H2).dec(sk, c);
    
    return k' <> Some k;
  }
}.

lemma go_parametric_corr_lro &m :
 Pr[KEMROMx2.Correctness(RO_x2(RO1.RO, RO2.RO), UU).main() @ &m : res] =
 Pr[Correctness_L(RO1.LRO, RO2.LRO).main() @ &m : res].
proof.
byequiv => //.
proc. 
conseq (: ={k,k'}); 1: by smt().
seq 1 2 : (={RO1.RO.m,RO2.RO.m}); 1: by inline *;sim.
seq 1 1 : (#pre /\ ={pk,sk}); 1: by sim.
seq 1 1 : (#pre /\ ={c,k}); 1: by sim.
inline {1} 1; inline {2} 1; inline {2} 5; inline {2} 6.
inline {1} 4;sp;if;1:by auto.
+ seq 1 1 : (#pre /\ ={r}); 1: by inline *;auto => />.
  by sp;if;[by auto | |];inline *;auto => /> /#.
by sp;if;[by auto | |];inline *;auto => /> /#.
qed.


module (DC1 : KEMROMx2.RO1.RO_Distinguisher) (G1 : RO1.RO) = {
   proc distinguish = Correctness_L(G1, RO2.LRO).main
}.

module (DC2 : KEMROMx2.RO2.RO_Distinguisher) (G2 : RO2.RO) = {
   proc distinguish = Correctness_L(RO1.RO, G2).main
}.

lemma go_parametric_corr &m : 
  Pr[KEMROMx2.Correctness(RO_x2(RO1.RO, RO2.RO), UU).main() @ &m : res] =
 Pr[Correctness_L(RO1.RO, RO2.RO).main() @ &m : res].
proof.
rewrite go_parametric_corr_lro.
have -> : Pr[Correctness_L(RO1.LRO, RO2.LRO).main() @ &m : res] = 
          Pr[KEMROMx2.RO1.MainD(DC1,RO1.LRO).distinguish() @ &m : res]
  by  byequiv => //;proc; inline {2} 2;wp;conseq />;inline *;sim.

have -> : Pr[Correctness_L(RO1.RO, RO2.RO).main() @ &m : res] = 
          Pr[KEMROMx2.RO2.MainD(DC2,RO2.RO).distinguish() @ &m : res]
  by  byequiv => //;proc; inline {2} 2;wp;conseq />;inline *;sim.

have -> : Pr[KEMROMx2.RO2.MainD(DC2,RO2.RO).distinguish() @ &m : res] =
          Pr[KEMROMx2.RO2.MainD(DC2,RO2.LRO).distinguish() @ &m : res].
  byequiv (: ={RO1.RO.m, arg} ==> ={res, RO1.RO.m}) => //.
  apply(RO2.FullEager.RO_LRO (DC2) _).
  by move => *;rewrite dkey_ll.

have <- : Pr[KEMROMx2.RO1.MainD(DC1,RO1.RO).distinguish() @ &m : res] =
          Pr[KEMROMx2.RO1.MainD(DC1,RO1.LRO).distinguish() @ &m : res].
+ byequiv (: ={RO2.RO.m, arg} ==> ={res, RO2.RO.m}) => //.
  apply(RO1.FullEager.RO_LRO (DC1) _).
  by move => *;rewrite randd_ll.

byequiv => //;proc;inline {1} 2; inline {2} 2. 
by sim.
qed.

(* FIXME: THIS FACTOR OF 2 IS TO AVOID A LOSSLESS GOAL IN THE TOP LEVEL 
   INSTANTIATION DUE TO THE RANGE SAMPLING OF THE TT REDUCTION.
   THIS ALSO IMPACTS CARD BY 1 *)
lemma correctness_fo_k &m : 
   qHC = 1 => 
   2<FinT.card =>
   Pr[ KEMROM.Correctness(RO.RO,FO_K).main() @ &m : res ] <=
   2%r * Pr[ Correctness_Adv(BasePKE, B(B_UC, PKEROM.RO.RO)).main() @ &m : res].
move => qHC_0 card2.
have := Top.UU.correctness &m qHC_0 card2.  
have -> : Pr[KEMROMx2.Correctness(RO_x2(RO1.RO, RO2.RO), UU).main() @ &m : res] = 
   Pr[Correctness(RO.RO, FO_K).main() @ &m : res]; last by smt().
rewrite go_parametric_corr.
byequiv => //.
proc. 
inline {1} 4; inline {2} 3.
swap {1} [3..5] -2; swap {2} [2..4] -1.
seq 3 3 : (={pk,sk,m,pk0} /\ pk0{1} = pk{2} 
           /\ sk{1}.`1.`1 = pk{2}); 1 : by inline *;auto.
inline {1} 3; inline {2} 2.
swap {1} 8 -2.
seq 6 5 : (#pre /\ m0{1} = m{2} /\ pk1{1} = pk0{2} /\ 
           m{1} \in RO1.RO.m{1} /\ ={r,k0} /\
           m{1} \in RO2.RO.m{1} /\
           (pkh pk{2},m{2}) \in RO.RO.m{2}  /\
           oget RO.RO.m{2}.[(pkh pk{2},m{2})] = 
               (oget RO1.RO.m{1}.[m{1}],oget RO2.RO.m{1}.[m{1}]) /\
           r{1} = oget RO1.RO.m{1}.[m{1}] /\
           k0{1} = oget RO2.RO.m{1}.[m{1}] /\
           (r{2},k0{2}) = oget RO.RO.m{2}.[(pkh pk{2},m{2})] /\
           fdom RO1.RO.m{1} = fset1 m{1} /\
           fdom RO2.RO.m{1} = fset1 m{1} /\
           fdom RO.RO.m{2} = fset1 (pkh pk{2}, m{2})).
+ inline *; swap {1} 6 -5; swap {1} 10 -8; swap {2} 3 -2.
  seq 2 1 : (#pre /\ r0{1} = r0{2}.`1 /\ r1{1} = r0{2}.`2).
  + conseq />;rndsem{1} 0;rnd;auto => />.
    have -> : (dlet randd (fun (r1_0 : randomness) => dmap dkey 
       (fun (r0_0 : key) => (r1_0, r0_0)))) = randd `*` dkey; last by smt().
    rewrite dprod_dlet; congr;apply fun_ext => r.
    by rewrite dlet_dunit.
  by auto => />;smt(get_setE mem_set mem_empty @SmtMap @FSet).

seq 1 1 : (#pre /\ c1{1} = c0{2}); 1: by auto => /#.

sp;inline {1} 1; inline {2} 1;sp.
inline {1} 2; inline {1} 1;inline {1} 4; inline {1} 2;inline {2} 1.
swap {1} 3 -2; swap {1} 7 -5; swap {2} 2 -1.
  seq 2 1 : (#pre /\ r2{1} = r2{2}.`1 /\ r1{1} = r2{2}.`2).
  + conseq />;rndsem{1} 0;rnd;auto => />.
    have -> : (dlet randd (fun (r1_0 : randomness) => dmap dkey 
       (fun (r0_0 : key) => (r1_0, r0_0)))) = randd `*` dkey; last by smt().
    rewrite dprod_dlet; congr;apply fun_ext => r.
    by rewrite dlet_dunit.

case (m'{1} = None).
+ rcondf{1} 7; 1: by auto.
  rcondt{1} 7; 1: by auto.
  by auto => /> /#.

rcondt{1} 7; 1: by auto.
inline {1} 7.
rcondf{1} 9; 1: by auto => />;smt(mem_set).
swap {1} 8 -7; seq 1 0 : #pre; 1: by auto.
swap {2} 4 1.

seq 9 4 : (={c',sk0,m',k} /\ c2{1} = c1{2} /\ m'{1} <> None /\
              RO2.RO.m{1}.[oget m'{1}] = Some ks{2}); last 
   by inline *;sp;if{1};auto => /> /#.


by auto => />;smt(mem_fdom  in_fset1 get_setE).
qed.


(* SECURITY PROOF *)

module CCAL(H1 : RO1.RO, H2 : RO2.RO, A : KEMROMx2.CCA_ADV) = {
  module O = {
    proc dec(c : ciphertext) : key option = {
      var k : key option;
      
      k <- None;
      if (Some c <> CCA.cstar) 
        k <@ UU_L(H1,H2).dec(CCA.sk, c);
      
      return k;
    }
  }
  
  module A = A(RO_x2(H1,H2),O)
  
  proc main() : bool = {
    var pk : pkey;
    var k1 : key;
    var ck0 : ciphertext * key;
    var b : bool;
    var b' : bool;
    
    H1.init();
    H2.init();
    CCA.cstar <- None;
    (pk, CCA.sk) <@ UU_L(H1,H2).kg();
    k1 <$ dkey;
    b <$ {0,1};
    ck0 <@ UU_L(H1,H2).enc(pk);
    CCA.cstar <- Some ck0.`1;
    b' <@ A.guess(pk, ck0.`1, if b then k1 else ck0.`2);
    
    return b' = b;
  }
}.



module (B1x2(A : KEMROM.CCA_ADV) : KEMROMx2.CCA_ADV) (H2x : KEMROMx2.POracle_x2, DO : CCA_ORC)  = {
   var _pk : pkey
   module BH = {
      proc get(hpk : pkhash, m : plaintext) = {
         var r,k;
         (r,k) <@ RO.RO.get(hpk,m);
         if (hpk = pkh _pk) {
            r <@ H2x.get1(m);
            k <@ H2x.get2(m);
         }
         return (r,k);
      }
   }

   proc guess(pk : pkey, c : ciphertext, k : key) : bool = {
     var b;
     _pk <- pk;
     CountH(RO.RO).init();
     RO.RO.init();
     b <@ A(CountH(BH),DO).guess(pk,c,k);
     return b;
   }
}.


section.

declare module A <: KEMROMx2.CCA_ADV  {-KEMROMx2.CCA, -CCA,  -RO1.RO, -RO1.FRO, -RO2.FRO, -RO2.RO}.


local lemma go_parametric_lro &m :
 Pr[ KEMROMx2.CCA(RO_x2(RO1.RO,RO2.RO), UU, A).main() @ &m : res ] =
 Pr[ CCAL(RO1.LRO, RO2.LRO, A).main() @ &m : res ].
proof.
byequiv => //.
proc;call(: ={RO1.RO.m,RO2.RO.m} /\ (glob KEMROMx2.CCA){1} = (glob CCA){2}).
+ proc;sp;if;1,3: by auto.
  inline {1} 1; inline {1} 4; inline {2} 1; inline {2} 5; inline{2} 6.
  sp;if;1:by auto.
  + seq 1 1 : (#pre /\ ={r}); 1: by inline*;conseq />;sim.
    sp;if;1,2:by auto => />.
    by inline *;auto => /> /#.
  sp;if;1,2:by auto => />.
  by inline *;auto => /> /#.
+ by sim.   
+ by sim.   
by inline *;auto => />.
qed.

module (DKK1(A : KEMROMx2.CCA_ADV) : KEMROMx2.RO1.RO_Distinguisher) (G1 : RO1.RO) = {
   proc distinguish = CCAL(G1, RO2.LRO, A).main
}.

module (DKK2(A : KEMROMx2.CCA_ADV) : KEMROMx2.RO2.RO_Distinguisher) (G2 : RO2.RO) = {
   proc distinguish = CCAL(RO1.RO, G2, A).main
}.


lemma go_parametric &m : 
  Pr[ KEMROMx2.CCA(RO_x2(RO1.RO,RO2.RO), UU, A).main() @ &m : res ] =
  Pr[ CCAL(RO1.RO, RO2.RO, A).main() @ &m : res ].
proof.
rewrite go_parametric_lro.
have -> : Pr[CCAL(RO1.LRO, RO2.LRO, A).main() @ &m : res] = 
          Pr[KEMROMx2.RO1.MainD(DKK1(A),RO1.LRO).distinguish() @ &m : res]. 
+ byequiv => //;proc;inline *.
  wp;call(: ={glob RO1.RO, glob RO2.RO, glob CCA}); 1..3: by sim.
  by auto => />.

have -> : Pr[CCAL(RO1.RO, RO2.RO, A).main() @ &m : res] = 
          Pr[KEMROMx2.RO2.MainD(DKK2(A),RO2.RO).distinguish() @ &m : res]. 
+ byequiv => //;proc;inline *.
  wp;call(: ={glob RO1.RO, glob RO2.RO, glob CCA}); 1..3: by sim.
  by auto => />.

have -> : Pr[KEMROMx2.RO2.MainD(DKK2(A),RO2.RO).distinguish() @ &m : res] =
          Pr[KEMROMx2.RO2.MainD(DKK2(A),RO2.LRO).distinguish() @ &m : res].
+ byequiv (: (CCA.sk{1}, CCA.cstar{1}, RO1.RO.m{1}, (glob A){1}) =
          (CCA.sk{2}, CCA.cstar{2}, RO1.RO.m{2}, (glob A){2}) /\ ={arg} ==>
          ={res} /\
          (CCA.sk{1}, CCA.cstar{1}, RO1.RO.m{1}, (glob A){1}) =
          (CCA.sk{2}, CCA.cstar{2}, RO1.RO.m{2}, (glob A){2})) => //.
  apply(RO2.FullEager.RO_LRO (DKK2(A)) _).
  by move => *;rewrite dkey_ll.

have <- : Pr[KEMROMx2.RO1.MainD(DKK1(A),RO1.RO).distinguish() @ &m : res] =
          Pr[KEMROMx2.RO1.MainD(DKK1(A),RO1.LRO).distinguish() @ &m : res].
+ byequiv (: (CCA.sk{1}, CCA.cstar{1}, RO2.RO.m{1}, (glob A){1}) =
          (CCA.sk{2}, CCA.cstar{2}, RO2.RO.m{2}, (glob A){2}) /\ ={arg} ==>
          ={res} /\
          (CCA.sk{1}, CCA.cstar{1}, RO2.RO.m{1}, (glob A){1}) =
          (CCA.sk{2}, CCA.cstar{2}, RO2.RO.m{2}, (glob A){2})) => //.
  apply(RO1.FullEager.RO_LRO (DKK1(A)) _).
  by move => *;rewrite randd_ll.

byequiv => //;proc;inline {1} 2; inline {2} 2. 
by sim.
qed.

end section.

section.

declare module A <: CCA_ADV  {-KEMROMx2.CCA, -CCA,  -RO1.RO, -RO1.FRO, -RO2.FRO, -RO2.RO, -OW_CPA, -BOWp, -OWL_CPA, -OWvsIND.Bowl, -PKEROM.RO.RO, -PKEROM.RO.FRO, -PKEROM.OW_PCVA, -BasePKE, -Correctness_Adv1, -B, -CountO, -Gm, -O_AdvOW, -RF, -PRF, -RO1.RO, -RO1.FRO, -RO2.RO, -KEMROMx2.CCA,  -RO1E.FunRO, -UU2, -H2, -H2BOWMod, -Gm2, -Gm3, -RO.RO.m, -B1x2, -CountHx2}.


lemma same_scheme &m : 
  Pr[ KEMROMx2.CCA(RO_x2(RO1.RO,RO2.RO), UU, B1x2(A)).main() @ &m : res ] = 
  Pr[ CCA(RO.RO,FO_K,A).main() @ &m : res ].
rewrite (go_parametric (B1x2(A)) &m).
byequiv => //. 
proc.
inline {1} 9;wp.
call(: ={glob CCA} /\ B1x2._pk{1} = CCA.sk{2}.`1.`1 /\
        (forall m,
             (pkh B1x2._pk{1}, m) \in RO.RO.m{2} =>
                    (m \in RO1.RO.m{1} /\
                     m \in RO2.RO.m{1} /\ 
                     oget RO.RO.m{2}.[(pkh B1x2._pk{1}, m)] =
                       (oget RO1.RO.m{1}.[m],
                        oget RO2.RO.m{1}.[m]))) /\
        (forall m, 
            m \in RO1.RO.m{1} => (pkh B1x2._pk{1}, m) \in RO.RO.m{2}) /\
        (forall m, 
            m \in RO2.RO.m{1} => (pkh B1x2._pk{1}, m) \in RO.RO.m{2}) /\
        (forall h, h <> pkh B1x2._pk{1} =>
              forall m, 
                 RO.RO.m{1}.[(h,m)] = RO.RO.m{2}.[(h,m)])).
+ proc;sp;if;1,3: by auto. 
  inline {1} 1;inline {2} 1.
  inline {1} 5. inline {1} 7.  inline {1} 8. inline {1} 6. inline {2} 4.
  swap {1} 7 -6. swap {1} 11 -9. swap {2} 5 -4.
  seq 2 1 : (#pre /\ r1{1} = r0{2}.`1 /\ r0{1} = r0{2}.`2).
  + conseq />;rndsem{1} 0;rnd;auto => /> &1 &2.
    have -> : (dlet randd (fun (r1_0 : randomness) => dmap dkey 
       (fun (r0_0 : key) => (r1_0, r0_0)))) = randd `*` dkey; last by smt().
    rewrite dprod_dlet; congr;apply fun_ext => r.
    by rewrite dlet_dunit.

  swap {1} 3 7. sp 3 3.
  case (m'{1} = None).
  + rcondf{1} 8; 1: by auto.
    rcondt{1} 8; 1: by auto.
    by auto => />;smt(get_setE). 
  rcondt{1} 8; 1: by auto.
  inline *.
  rcondf{1} 10; 1: by auto;smt(mem_set).
  swap {1} 9 -8; seq 1 0 : #pre; 1: by auto.
  sp 0 1;seq 7 1: (#pre /\ (pkh sk{2}.`1.`1, oget m'{2})  \in RO.RO.m{2}); 1: by auto;smt(get_setE).
  by sp;if{1};auto => /> /#.

+ proc; inline {1} 1;sp.
  case(hpk{1} = (pkh B1x2._pk{1})).
  + rcondt{1} 2;1: by move => *;inline *;auto => />.
    seq 1 0 : #pre; 1: by inline *;auto;smt(get_setE).
    inline{1} 2; inline {1} 1.
    swap {1} 2 -1. swap {1} 6 -4.
    seq 2 1 : (#pre /\ r2{1} = r{2}.`1 /\ r1{1} = r{2}.`2).
    + conseq />;rndsem{1} 0;rnd;auto => /> &1 &2.
      have -> : (dlet randd (fun (r1_0 : randomness) => dmap dkey 
         (fun (r0_0 : key) => (r1_0, r0_0)))) = randd `*` dkey; last by smt().
      rewrite dprod_dlet; congr;apply fun_ext => r.
      by rewrite dlet_dunit.
    by auto => />;smt(get_setE).  

    rcondf{1} 2;1: by move => *;inline *;auto => />.
    by inline *;auto => />;smt(get_setE).

inline *. 
swap {1} 14 -13. swap {1} 20 -18. swap {2} 11 -10.
    seq 2 1 : (#pre /\ r1{1} = r0{2}.`1 /\ r0{1} = r0{2}.`2).
    + conseq />;rndsem{1} 0;rnd;auto => />.
      have -> : (dlet randd (fun (r1_0 : randomness) => dmap dkey 
         (fun (r0_0 : key) => (r1_0, r0_0)))) = randd `*` dkey; last by smt().
      rewrite dprod_dlet; congr;apply fun_ext => r.
      by rewrite dlet_dunit.
by auto => />;smt(mem_set get_setE mem_empty). 
qed.

lemma countB1x2 (RO <: POracle_x2{-CountHx2, -B1x2(A)} ) 
                (O <: KEMROMx2.CCA_ORC{-CountHx2, -B1x2(A)} ):
  qHT = qHK =>
  qHU = qHK =>

  (forall (RO <: POracle{-CountH, -A} ) (O <: CCA_ORC{-CountH, -A} ),
    hoare[ A(CountH(RO), O).guess :
           CountH.c_h = 0  ==> CountH.c_h <= qHK ]) => 

hoare[ B1x2(A, CountHx2(RO), O).guess :
          CountHx2.c_ht = 0 /\ CountHx2.c_hu = 0 ==> 
            CountHx2.c_ht <= qHT /\ CountHx2.c_hu <= qHU].
proof.
move => qHTv qHUv A_count.
proc;inline *;sp.
call(: CountH.c_h = 0 /\ CountHx2.c_ht = 0 /\ CountHx2.c_hu = 0 ==>
         CountH.c_h <= qHK /\ CountHx2.c_ht <= CountH.c_h /\ CountHx2.c_hu <= CountH.c_h); last by  auto => /> /#. 
conseq(: CountHx2.c_ht <= CountH.c_h /\ CountHx2.c_hu <= CountH.c_h ==>
         CountHx2.c_ht <= CountH.c_h /\ CountHx2.c_hu <= CountH.c_h)
         (A_count (<:B1x2(A, CountHx2(RO), O).BH) (<:O));1,2: smt().
proc(CountHx2.c_ht <= CountH.c_h /\ CountHx2.c_hu <= CountH.c_h); 1,2: by smt().
+ by conseq />;trivial.
+ proc;inline *.
  case(x.`1 = pkh B1x2._pk).
  + rcondt 6; 1: by auto.
    swap 12 3;swap 8 7;wp;conseq(:true);1:smt().
    by trivial.
  + rcondf 6; 1: by auto.
    wp;conseq(:true);1:smt().
    by trivial.
qed.

lemma conclusion_fo_kyber &m:
    qHT = qHK =>
    qHU = qHK =>
    qH = qHT + qHU + 1 =>
    qV = 0 =>
    qP = 0 =>
    qH + 1 = qHC =>
    qHC < FinT.card - 1 =>

    (forall (RO0 <: POracle{-CountH, -A} ) (O0 <: CCA_ORC{-CountH, -A} ),
       hoare[ A(CountH(RO0), O0).guess : CountH.c_h = 0 ==> CountH.c_h <= qHK]) => 

    (forall (H0 <: POracle{-A} ) (O <: KEMROMx2.CCA_ORC{-A} ),
       islossless O.dec => islossless H0.get =>  islossless A(H0, O).guess) =>

    `|Pr[CCA(RO.RO,FO_K,A).main() @ &m : res] - 1%r / 2%r| <=
    2%r * `|Pr[CPA(BasePKE, OWvsIND.Bowl(OWvsIND.BL(AdvOW(BUUOWMod(B1x2(A)))))).main() @ &m : res] - 1%r / 2%r| +
    2%r * `|Pr[CPA(BasePKE, OWvsIND.Bowl(AdvOWL_query(BUUOWMod(B1x2(A))))).main() @ &m : res] - 1%r / 2%r| +
    (2*qHK + 3)%r * Pr[Correctness_Adv(BasePKE, B(BUUC(B1x2(A)), PKEROM.RO.RO)).main() @ &m : res] +
    (2*qHK + 3)%r * Pr[Correctness_Adv(BasePKE, B(BUUCI(B1x2(A)), PKEROM.RO.RO)).main() @ &m : res] +
    (2*qHK + 3)%r * Pr[Correctness_Adv(BasePKE, B(AdvCorr(BUUOWMod(B1x2(A))), PKEROM.RO.RO)).main() @ &m : res] +
    Pr[Correctness_Adv(BasePKE, BOWp(BasePKE, AdvOW(BUUOWMod(B1x2(A))))).main() @ &m : res] +
    Pr[Correctness_Adv(BasePKE, BOWp(BasePKE, AdvOW_query(BUUOWMod(B1x2(A))))).main() @ &m : res] +
    `|Pr[J.IND(PRF, D(B1x2(A))).main() @ &m : res] - Pr[J.IND(RF, D(B1x2(A))).main() @ &m : res]| +
    2%r * (2*qHK + 2)%r * eps_msg.
proof. 
move => qHTHK qHUHK qHv qV0 qP0 qHCv pHCsmall A_count A_ll.
have := Top.UU.conclusion_cpa (B1x2(A)) &m qHv qV0 qP0 qHCv pHCsmall _ _; last by rewrite same_scheme;smt().
+ by move => RO O;apply (countB1x2 RO O qHTHK qHUHK A_count) => //.
+ move => H O Odec_ll Hget1_ll Hget2_ll.
  proc;call(:true).
  + by move => HH OO; apply (A_ll HH OO).
  + by islossless.
  by islossless.
qed.

end section.
