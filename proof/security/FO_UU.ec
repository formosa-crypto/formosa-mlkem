require import AllCore Distr List Real FMap FSet DInterval FinType KEM_ROM.
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
clone import PRF as J with
   type D <- ciphertext,
   type R <- key.
clone import RF with 
   op dR <- fun _ => dkey
   proof dR_ll by (move => *;apply dkey_ll)
   proof *.
(* we get the prf key type K from the next clone *)
clone import PseudoRF.
(**********)
clone import KEM_ROM.KEM_ROM_x2 as KEMROMx2 with
   type pkey <- pkey,
   type skey = (pkey * skey) * K,
   type ciphertext <- ciphertext,
   type key <- key,
   op dkey <- dkey,
   type RO1.in_t <- plaintext,
   type RO1.out_t <- randomness,
   op   RO1.dout <- fun _ => randd,
   type RO1.d_in_t <- unit, 
   type RO1.d_out_t <- bool,
   type RO2.in_t <- plaintext,
   type RO2.out_t <- key,
   op   RO2.dout <- fun _ => dkey,
   type RO2.d_in_t <- unit, 
   type RO2.d_out_t <- bool
   proof dkey_ll by apply dkey_ll
   proof dkey_uni by apply dkey_uni
   proof dkey_fu by apply dkey_fu
   proof *.

(******* Query Bounds ******)

(* Max number of calls to TT RO in attack on UU *)  
const qHT : { int | 0 <= qHT } as ge0_qHT. 
(* Max number of calls to UU RO in attack on UU *)  
const qHU : { int | 0 <= qHU } as ge0_qHU. 
(* Maximum number of calls to Dec on TT *) 
const qD : { int | 0 <= qD } as ge0_qD.

(***************************************)

module (UU : KEMROMx2.Scheme) (H : POracle_x2) = {

  module HT : PKEROM.POracle = {
     proc get = H.get1
  }

  module HU = {
     proc get = H.get2
  }

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
        k <- F sk.`2 c;
     }
     else {
        k <@ HU.get(oget m');
     }
     return (Some k);
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

lemma correctness_rel &m : 
   Pr [ KEMROMx2.Correctness(RO_x2(RO1.RO,RO2.RO),UU).main() @ &m : res ] <=
     Pr [ PKEROM.Correctness_Adv(PKEROM.RO.RO,TT,B_UC).main() @ &m : res ].
proof.
byequiv => //.
proc.
inline {1} 1; inline {1} 3; inline {1} 6. 
inline {2} 2;inline {2} 4.
seq 4 2 : ( KEMROMx2.RO1.RO.m{1} = PKEROM.RO.RO.m{2} /\ 
            pk0{1} = kpair{2}.`1 /\ 
            sk0{1} = kpair{2}.`2); 
      1: by inline *;rnd{1};rnd;auto;smt(dK_ll).
sp.
seq 1 1 : (#pre /\ m{1} = m0{2}); 1: by auto.
sp. 
seq 2 1 : (#pre /\ c0{1} = c{2} /\ m{1} \in KEMROMx2.RO2.RO.m{1} /\
         k1{1} = oget KEMROMx2.RO2.RO.m{1}.[m{1}]);1: 
   by inline *;wp;rnd{1};wp;auto;smt(mem_set).
inline {1} 2;sp.
seq 1 1 : (#pre /\ m'{1} = m'{2}); 
  1: by inline *;wp;conseq />;sim;auto => /#.
by inline *;if{1};inline *;auto => />;smt(get_setE).
qed.

lemma correctness &m : 
   qHC = 0 => 
   1<FinT.card =>
   Pr[ KEMROMx2.Correctness(RO_x2(RO1.RO,RO2.RO),UU).main() @ &m : res ] <=
     Pr[ Correctness_Adv(BasePKE, B(B_UC, PKEROM.RO.RO)).main() @ &m : res].
move => qHC_0 card2.
have := correctness B_UC &m _ _ _;  1: by smt(). 
+ by move => *; proc; auto => /#.
by move => *;islossless.
by smt(correctness_rel).
qed.

(* Security proof *)

module CountHx2(H : KEMROMx2.POracle_x2) = {
  var c_hu   : int
  var c_ht   : int

  proc init () = { c_ht <- 0; c_hu <- 0;   }

  proc get1(x:plaintext) = {
    var r;
    r <@ H.get1(x);
    c_ht <- c_ht + 1;
    return r;
  }  
  proc get2(x:plaintext) = {
    var r;
    r <@ H.get2(x);
    c_hu <- c_hu + 1;
    return r;
  }  
}.


(********************************************************)
(* We start with the PRF hop                        *)


module (UU1(PRFO : PRF_Oracles) : KEMROMx2.Scheme) (H : POracle_x2) = {
  include UU(H) [-kg,dec]

  proc kg() : pkey * skey = {
     var pk, sk;
     (pk,sk) <$ kg;
     return (pk, ((pk,sk),witness));
  }

  proc dec(sk : skey, c : ciphertext) : key option = {
     var m', k;
     k <- witness;
     m' <@ TT(UU(H).HT).dec(sk.`1,c);
     if (m' = None) {
        k <@ PRFO.f(c);
     }
     else {
        k <@ UU(H).HU.get(oget m');
     }
     return (Some k);
  }
}.


module Gm1P(H : Oracle_x2, A : CCA_ADV, PRFO : PRF_Oracles) = {
  
  proc main'() : bool = {
    var pk : pkey;
    var k1 : key;
    var ck0 : ciphertext * key;
    var b : bool;
    var b' : bool;
    
    H.init();
    CCA.cstar <- None;
    (pk, CCA.sk) <@ UU1(PRFO,H).kg();
    k1 <$ dkey;
    b <$ {0,1};
    ck0 <@ UU1(PRFO,H).enc(pk);
    CCA.cstar <- Some ck0.`1;
    b' <@ CCA(H, UU1(PRFO),A).A.guess(pk, ck0.`1, if b then k1 else ck0.`2);
    
    return b' = b;
  }
}.

module Gm1(H : Oracle_x2, A : CCA_ADV) = {
    proc main() : bool = {
       var b;
       RF.init();
       b <@ Gm1P(H,A,RF).main'();
       return b;
    }
}.

module D(A : CCA_ADV, PRFO : PRF_Oracles) = {
   proc distinguish = Gm1P(RO_x2(RO1.RO,RO2.RO),A,PRFO).main'
}.

(********************************************************)
(* Next step is to make the TT transform deterministic
   by eagerly sampling the whole random oracle. 
   Note that none of our reductions will need to simulate
   this step, since we are reducing to an assumption that
   already takes care of that. *)
(********************************************************)


clone import KEMROMx2.RO1.FinEager as RO1E
   with op FinFrom.enum = FinT.enum
   proof FinFrom.enum_spec by apply FinT.enum_spec
   proof *.

module RO_x2E = RO_x2(RO1E.FunRO,RO2.RO).
(* Now we proceed with the HHK proof.                         
   We simulate decryption without using SK and just keeping
   track of what happens in H *)


module (UU2 : KEMROMx2.Scheme) (H : POracle_x2) = {
  include UU1(RF,H) [-dec]

  var lD : (ciphertext * key) list

  proc dec(sk : skey, c : ciphertext) : key option = {
     var k, ko;
     ko <- None;
     if (assoc lD c <> None) {
        ko <- assoc lD c;
     }
     else {
        k <$ dkey;
        ko <- Some k;
        (* HHK SAYS INCONSISTENCY IF DEC C <> NONE && ENC (DEC C) <> C 
           HOWEVER, THIS CAN NEVER HAPPEN WHEN DEALING WITH THE 
           FO_TT TRANSFORM: THIS IS RIGIDITY *)
        lD <- (c,k) :: lD;
     }
     return ko;
  }
}.

(* For an up-to-bad argument we'll need to trigger bad in both
   Gm1 and Gm2, so we recast everything in the memory of Gm2. *)

  module H1 : POracle_x2 = {
     var bad : bool

     proc init() = {}
     proc get1 = RO_x2E.get1
     proc get2(m : plaintext) : key = {
       var k,cm;
       cm <- enc (RO1E.FunRO.f m) CCA.sk.`1.`1 m;
       bad <- if dec CCA.sk.`1.`2 cm <> Some m then true else bad;
       k <$ dkey;
       if (m \notin RO2.RO.m) {
         RO2.RO.m.[m] <- k;
       }
       return oget RO2.RO.m.[m];
     }
  }.


  (* incorrect messages must be kept out of the RO, otherwise
     the inversion bad hop in HHK does not work: there could 
     be messages different than mtgt encrypting to cstar,
     in which case we don't have an inversion yet but we
     need to return the key associated with cstar in lD, which
     is different on both sides. *)
  module H2(O1 : PKEROM.POracle) : POracle_x2 = {
     var merr : plaintext option
     var invert : bool
     var mtgt : plaintext
     
     proc init() = {}
     proc get1 = RO_x2E.get1
     proc get2(m : plaintext) : key = {
       var k,cm,r;
       mtgt <- if CCA.cstar = None then m else mtgt; 
       r <@ O1.get(m);
       cm <- enc r CCA.sk.`1.`1 m;
       (* INCONSISTENCY TO GM1 IF DEC (ENC M) <> SOME M
          CAN BE REDUCED TO CORRECTNESS. *)
       H1.bad <- if dec CCA.sk.`1.`2 cm <> Some m then true else H1.bad;
       H2.merr <- if H2.merr = None && H1.bad then Some m else H2.merr;
       H2.invert <- if CCA.cstar <> None && m = mtgt && 
                       dec CCA.sk.`1.`2 (oget CCA.cstar) = Some mtgt
                    then true else H2.invert;
       k <$ dkey;
       if (m \notin RO2.RO.m) {
         if (assoc UU2.lD cm <> None) {
             k <- oget (assoc UU2.lD cm);
         }
         else {
             UU2.lD <- if H1.bad then UU2.lD else (cm,k) :: UU2.lD;
         }
         RO2.RO.m <- if H1.bad then RO2.RO.m else RO2.RO.m.[m <- k];
       }
       return if H1.bad then witness else oget (RO2.RO.m.[m]);
     }
  }.


module Gm2(H : Oracle_x2, S : KEMROMx2.Scheme, A : CCA_ADV) = {

  module O = {
    proc dec(c : ciphertext) : key option = {
      var k : key option;
      
      k <- None;
      if (Some c <> CCA.cstar) 
        k <@ S(H).dec(CCA.sk, c);
      
      return k;
    }
  }

  proc main2() : bool = {
    var pk : pkey;
    var k1 : key;
    var ck0 : ciphertext * key;
    var cstar : ciphertext option;
    var b : bool;
    var b' : bool;
    
    H1.bad <- false;
    H2.merr <- None;
    H2.invert <- false;
    RF.init();
    RO_x2E.init();
    UU2.lD <- [];
    CCA.cstar <- None;
    (pk, CCA.sk) <@ S(H).kg();
    k1 <$ dkey;
    b <$ {0,1};
    ck0 <@ UU2(H).enc(pk);
    CCA.cstar <- Some ck0.`1;
    b' <@ CCA(H, S, A).A.guess(pk, ck0.`1, if b then k1 else ck0.`2);
    return b' = b;
  }

  proc main() : bool = {
    var win,nobias;
    win <@ main2(); 
    nobias <$ {0,1};
    return (if H1.bad then nobias else win);
  }

}.

module (BUUC(A : CCA_ADV) : PKEROM.CORR_ADV) (H : PKEROM.POracle) = {

   module H2B = {
      include H2(H) [-get1]
      proc get1= H.get
   }

   proc find(pk : pkey, sk : PKEROM.skey) : plaintext = {
    var k1 : key;
    var ck0 : ciphertext * key;
    var cstar : ciphertext option;
    var b : bool;
    var b' : bool;
    var z : K;
    
    H1.bad <- false;
    H2.merr <- None;
    H2.invert <- false;
    RF.init();
    RO2.RO.init();
    UU2.lD <- [];
    CCA.cstar <- None;
    CCA.sk <- (sk,witness);
    k1 <$ dkey;
    b <$ {0,1};
    ck0 <@ UU2(H2B).enc(pk);
    CCA.cstar <- Some ck0.`1;
    CountHx2(H2B).init();
    b' <@ CCA(CountHx2(H2B), UU2, A).A.guess(pk, ck0.`1, if b then k1 else ck0.`2);
    return (oget H2.merr);  
   } 
}.

module Gm3(H : Oracle_x2, S : KEMROMx2.Scheme, A : CCA_ADV) = {
  module O = {
    proc dec(c : ciphertext) : key option = {
      var k : key option;
      
      k <- None;
      if (Some c <> CCA.cstar) 
        k <@ S(H).dec(CCA.sk, c);
      
      return k;
    }
  }

  proc main() : bool = {
    var pk : pkey;
    var k1, k2 : key;
    var b : bool;
    var b' : bool;
    var r : randomness;
    var cm : ciphertext;
    var nobias : bool;
    
    H1.bad <- false;
    H2.merr <- None;
    H2.invert <- false;
    RF.init();
    RO_x2E.init();
    UU2.lD <- [];
    CCA.cstar <- None;
    (pk, CCA.sk) <@ S(H).kg();
    k1 <$ dkey; k2 <$ dkey;
    b <$ {0,1};
    H2.mtgt <$ dplaintext;
    (* Open up Enc to puncture the key *)
    r <@ H.get1(H2.mtgt);
    cm <- enc r pk H2.mtgt;
    H1.bad <- if dec CCA.sk.`1.`2 cm <> Some H2.mtgt then true else H1.bad;
    H2.merr <- if H2.merr = None && H1.bad then Some H2.mtgt else H2.merr;
    UU2.lD <- (cm,witness) :: UU2.lD;
    CCA.cstar <- Some cm;
    b' <@ CCA(H, S, A).A.guess(pk, cm, if b then k1 else k2);
    nobias <$ {0,1};
    return (if H1.bad then nobias else (b' = b));
  }

  proc main_0adv() : bool = {
    var pk : pkey;
    var k : key;
    var b : bool;
    var b' : bool;
    var r : randomness;
    var cm : ciphertext;
    var nobias : bool;
    
    H1.bad <- false;
    H2.merr <- None;
    H2.invert <- false;
    RF.init();
    RO_x2E.init();
    UU2.lD <- [];
    CCA.cstar <- None;
    (pk, CCA.sk) <@ S(H).kg();
    k <$ dkey;
    H2.mtgt <$ dplaintext;
    (* Open up Enc to puncture the key *)
    r <@ H.get1(H2.mtgt);
    cm <- enc r pk H2.mtgt;
    H1.bad <- if dec CCA.sk.`1.`2 cm <> Some H2.mtgt then true else H1.bad;
    H2.merr <- if H2.merr = None && H1.bad then Some H2.mtgt else H2.merr;
    UU2.lD <- (cm,witness) :: UU2.lD;
    CCA.cstar <- Some cm;
    b' <@ CCA(H, S, A).A.guess(pk, cm, k);
    nobias <$ {0,1};
    b <$ {0,1};
    return (if H1.bad then nobias else (b' = b));
  }

}.

  (* The observable behaviour does not depend on sk *)
  module H2BOW(OO1 : PKEROM.POracle) : POracle_x2 = {
     proc init() = {}
     proc get1 = RO_x2E.get1
     proc get2(m : plaintext) : key = {
       var k,cm, r;
       r <@ OO1.get(m);
       cm <- enc r CCA.sk.`1.`1 m;
       H1.bad <- if dec CCA.sk.`1.`2 cm <> Some m then true else H1.bad;
       H2.merr <- if H2.merr = None && H1.bad then Some m else H2.merr;
       H2.invert <- if CCA.cstar <> None &&  m = H2.mtgt && 
                       dec CCA.sk.`1.`2 (oget CCA.cstar) = Some H2.mtgt
                    then true else H2.invert;
       k <$ dkey;
       if (m \notin RO2.RO.m) {
         if (assoc UU2.lD cm <> None) {
             k <- oget (assoc UU2.lD cm);
         }
         else {
             UU2.lD <- (cm,k) :: UU2.lD;
         }
         RO2.RO.m <- RO2.RO.m.[m <- k];
       }
       return  oget (RO2.RO.m.[m]);
     }
  }.


module (BUUOW(A : CCA_ADV) : PKEROM.PCVA_ADV) (H : PKEROM.POracle, O : PKEROM.VA_ORC) = {

   module H2B = {
      include H2BOW(H) [-get1]
      proc get1= H.get
   }

   proc find(pk : pkey, cm : ciphertext) : plaintext option = {
    var k1, k2 : key;
    var b : bool;
    var b' : bool;
    var r : randomness;
    
    H1.bad <- false;
    H2.merr <- None;
    H2.invert <- false;
    RF.init();
    RO2.RO.init();
    UU2.lD <- [];
    CCA.cstar <- None;
    CCA.sk <- ((pk,witness),witness);
    k1 <$ dkey; k2 <$ dkey;
    b <$ {0,1};
    UU2.lD <- (cm,witness) :: UU2.lD;
    CCA.cstar <- Some cm;
    b' <@ CCA(H2B, UU2, A).A.guess(pk, cm, if b then k1 else k2);
    return if card (filter (fun m0 => enc (FunRO.f m0) pk m0 = 
                 oget CCA.cstar)  (fdom RO2.RO.m)) = 1 then 
        Some (head witness (elems (filter (fun m0 => enc (FunRO.f m0) pk m0 = 
                 oget CCA.cstar) (fdom RO2.RO.m)))) else None;
   } 

}.

  (* Using OO1 as a black-box. *)
  module H2BOWMod(OO1 : PKEROM.POracle) : POracle_x2 = {
    var crd : int
    var mf : plaintext option

     proc init() = {}
     proc get1 = RO_x2E.get1
     proc get2(m : plaintext) : key = {
       var k,cm, r;
       r <@ OO1.get(m);
       cm <- enc r CCA.sk.`1.`1 m;
       H1.bad <- if dec CCA.sk.`1.`2 cm <> Some m then true else H1.bad;
       H2.merr <- if H2.merr = None && H1.bad then Some m else H2.merr;
       H2.invert <- if CCA.cstar <> None &&  m = H2.mtgt && 
                       dec CCA.sk.`1.`2 (oget CCA.cstar) = Some H2.mtgt
                    then true else H2.invert;
       k <$ dkey;
       if (m \notin RO2.RO.m) {
         crd <- crd + b2i (Some cm = CCA.cstar);
         mf <- if Some cm = CCA.cstar then Some m else mf;

         if (assoc UU2.lD cm <> None) {
             k <- oget (assoc UU2.lD cm);
         }
         else {
             UU2.lD <- (cm,k) :: UU2.lD;
         }
         RO2.RO.m <- RO2.RO.m.[m <- k];
       }
       return  oget (RO2.RO.m.[m]);
     }
  }.


module (BUUOWMod(A : CCA_ADV) : PKEROM.PCVA_ADV) (H : PKEROM.POracle, O : PKEROM.VA_ORC) = {

   module H2B = {
      include H2BOWMod(H) [-get1]
      proc get1= H.get
   }

   proc find(pk : pkey, cm : ciphertext) : plaintext option = {
    var k1, k2 : key;
    var b : bool;
    var b' : bool;
    
    H1.bad <- false;
    H2.merr <- None;
    H2.invert <- false;
    RF.init();
    RO2.RO.init();
    UU2.lD <- [];
    CCA.cstar <- None;
    CCA.sk <- ((pk,witness),witness);
    k1 <$ dkey; k2 <$ dkey;
    b <$ {0,1};
    UU2.lD <- (cm,witness) :: UU2.lD;
    CCA.cstar <- Some cm;
    H2BOWMod.crd <- 0;
    H2BOWMod.mf <- None;
    CountHx2(H2B).init();    
    b' <@ CCA(CountHx2(H2B), UU2, A).A.guess(pk, cm, if b then k1 else k2);
    return if H2BOWMod.crd = 1 then  H2BOWMod.mf else None;
   } 

}.

module (BUUCI(A : CCA_ADV) : PKEROM.CORR_ADV) (H : PKEROM.POracle) = {

   module H2B = {
      include H2(H) [-get1]
      proc get1= H.get
   }

   proc find(pk : pkey, sk : PKEROM.skey) : plaintext = {
    var k1, k2 : key;
    var b : bool;
    var b' : bool;
    var r : randomness;
    var cm : ciphertext;
    var nobias : bool;
    
    H1.bad <- false;
    H2.merr <- None;
    H2.invert <- false;
    RF.init();
    RO2.RO.init();
    UU2.lD <- [];
    CCA.cstar <- None;
    CCA.sk <- (sk,witness);
    k1 <$ dkey; k2 <$ dkey;
    b <$ {0,1};
    H2.mtgt <$ dplaintext;
    (* Open up Enc to puncture the key *)
    r <@ H2B.get1(H2.mtgt);
    cm <- enc r pk H2.mtgt;
    H1.bad <- if dec CCA.sk.`1.`2 cm <> Some H2.mtgt then true else H1.bad;
    H2.merr <- if H2.merr = None && H1.bad then Some H2.mtgt else H2.merr;
    UU2.lD <- (cm,witness) :: UU2.lD;
    CCA.cstar <- Some cm;
    CountHx2(H2B).init();
    b' <@ CCA(CountHx2(H2B), UU2, A).A.guess(pk, cm, if b then k1 else k2);
    return (oget H2.merr);
   } 
}.


section.

declare module A <: CCA_ADV  {-CCA, -RO1.RO, -RO1.FRO, -RO2.RO, -PRF, -RF, -UU2, -CO1, -CountO,
                    -RO1E.FunRO, -Gm2, -H2, -Gm3, -PKEROM.OW_PCVA, -H2BOWMod, -CountHx2} .


lemma Gm0_Gm1 &m : 
   Pr[ KEMROMx2.CCA(RO_x2(RO1.RO,RO2.RO), UU, A).main() @ &m : res ] -
     Pr [ Gm1(RO_x2(RO1.RO,RO2.RO),A).main() @ &m : res ] =
       Pr [ J.IND(PRF,D(A)).main() @ &m : res ] - 
         Pr [ J.IND(RF, D(A)).main() @ &m : res ].
proof. 
have -> : Pr[ KEMROMx2.CCA(RO_x2(RO1.RO,RO2.RO), UU, A).main() @ &m : res ] =
          Pr [ J.IND(PRF,D(A)).main() @ &m : res ].
+ byequiv => //.
  proc;inline {2} 2;inline {2} 1; inline {1} 3.
  swap {1} 4 -3.  
  wp;call(_: ={glob RO1.RO, glob RO2.RO, CCA.cstar} /\ 
              CCA.sk{1}.`1.`1 = CCA.sk{2}.`1.`1 /\
              CCA.sk{1}.`1.`2 = CCA.sk{2}.`1.`2 /\
              CCA.sk{1}.`2 = PRF.k{2} ).  
  + proc;sp; if; 1,3: by auto => />. 
    inline {1} 1;inline {2} 1. 
    inline {1} 4;inline {2} 4.
    sp;if;1:by auto => /> /#.
    + sp;seq 4 4 : (#{/~rv{1}}{~rv{2}}pre /\ ={m'}); 
        1: by inline *;auto => /> /#.
      sp;inline *;if;by auto => /> /#.
      by sp;inline *;if;by auto => /> /#.
    + by proc;inline *; auto => /> /#.
    + by proc;inline *; auto => /> /#.
  wp;call(_: ={glob RO1.RO, glob RO2.RO, CCA.cstar} /\ 
              CCA.sk{1}.`1.`1 = CCA.sk{2}.`1.`1 /\
              CCA.sk{1}.`1.`2 = CCA.sk{2}.`1.`2 /\
              CCA.sk{1}.`2 = PRF.k{2} ).  
  + by inline *;conseq/>;sim.
  by inline *;auto => />.

have -> : Pr[ Gm1(RO_x2(RO1.RO,RO2.RO),A).main() @ &m : res ] =
          Pr [ J.IND(RF,D(A)).main() @ &m : res ].
+ byequiv => //.
  proc;inline {2} 2;inline {2} 1;inline {1} 2; inline {1} 1.
    wp;call(_: ={glob RO1.RO, glob RO2.RO, CCA.cstar, glob RF} /\ 
              CCA.sk{1}.`1.`1 = CCA.sk{2}.`1.`1 /\
              CCA.sk{1}.`1.`2 = CCA.sk{2}.`1.`2).  
  + proc;sp; if; 1,3: by auto => />. 
    inline {1} 1;inline {2} 1. 
    inline {1} 4;inline {2} 4.
    sp;if;1:by auto => /> /#.
    + sp;seq 4 4 : (#{/~rv{1}}{~rv{2}}pre /\ ={m'});
       1: by inline *;auto => /> /#.
      sp;inline *;if; 1: by auto => /> /#.
      + by sp;inline *;if;auto => /> /#.
      by sp;inline *;auto => /> /#.
    by inline *;conseq/>;sim.
    + by proc;inline *; auto => /> /#.
    + by proc;inline *; auto => /> /#.
  by inline *;auto => />.
done.
qed.

local module (DG1  : RO1E.FinRO_Distinguisher) (G : RO1.RO) = {
    proc distinguish = Gm1(RO_x2(G,RO2.RO),A).main
}.

lemma uu_goal_eager &m: 
    Pr[Gm1(RO_x2(RO1.RO,RO2.RO),A).main() @ &m :res]  =
       Pr[Gm1(RO_x2E,A).main() @ &m : res].
proof.  
have -> : Pr[Gm1(RO_x2(RO1.RO,RO2.RO),A).main() @ &m : res] = 
          Pr[RO1.MainD(DG1,RO1.RO).distinguish() @ &m : res]
    by byequiv => //;proc;inline *;sim.
have -> : Pr[Gm1(RO_x2E,A).main() @ &m : res] = 
          Pr[RO1.MainD(DG1,RO1E.FunRO).distinguish() @ &m : idfun res]
   by rewrite /idfun /=;byequiv => //;proc;inline *;sim;
   auto => />; apply MUniFinFun.dfun_ll;smt(randd_ll).
have := RO1E.pr_FinRO_FunRO_D _ DG1 &m () idfun; 1: by smt(randd_ll).
have := RO1E.pr_RO_FinRO_D _ DG1 &m () idfun; 1: by smt(randd_ll).
by smt().
qed.

(*
REDUCTION TO CORRECTNESS IS STRAIGHTFORWARD.
PROVING UP TO BAD REQUIRES DEALING WITH THE FACT THAT
DEC IS PRE-SAMPLING VALUES OF H2 AS FOLLOWS:

Assume not bad.

lD has three types of entries:
a) values added for invalid ciphertexts (implicit reject)
b) values added for Hash queries the preimage is already
   in H2 and the key is already defined.
   in both games there would be no sampling
c) values added for valid ciphertexts before H2 was
   called. This sets an implicit entry in the ROM.
Note that the game has no clue which case it is.

DEC:
In the proof we can check for the cases in new queries:

a) enc (dec c) <> c, then we are aligned with an RF sampling

b) does not occur, because Hash forced the entry and so it is 
   not a new query

c) we sample a value that is also sampled on the left, 
   but we will only consolidate it later.

*)

op c2m(c : ciphertext, sk : PKEROM.skey) : plaintext option = dec sk.`2 c.

op oc2m(c : ciphertext, sk : PKEROM.skey) : plaintext = oget (dec sk.`2 c).

op m2c(m : plaintext, sk : PKEROM.skey, f : plaintext -> randomness) : ciphertext = enc (f m) sk.`1 m.

op goodc(c : ciphertext, sk : PKEROM.skey, f : plaintext -> randomness) = 
          c2m c sk <> None /\ m2c (oc2m c sk) sk f = c.

local lemma G1_G2 &m :
  (forall (H0 <: POracle_x2{-A} ) (O <: CCA_ORC{ -A} ),
  islossless O.dec => 
  islossless H0.get1 => 
  islossless H0.get2 => islossless A(H0, O).guess) =>

  `| Pr[Gm1(RO_x2E,A).main() @ &m : res] -  Pr[ Gm2(H2(RO1E.FunRO),UU2,A).main() @ &m : res ] |
     <= Pr[ Gm2(H2(RO1E.FunRO),UU2,A).main() @ &m : H1.bad ].
proof. 
move => A_ll.
have -> : Pr[Gm1(RO_x2E,A).main() @ &m : res]  =  Pr[ Gm2(H1,UU1(RF),A).main2() @ &m : res].
+ byequiv => //.
  proc; inline {1} 2; sp; wp.
  call(_: ={glob RF, glob RO1E.FunRO, glob RO2.RO, glob CCA}).
  + by sim. 
  + by sim. 
  + by sim. 
  by conseq />;[by smt() | by sim].

byequiv : H1.bad => //.
proc;rnd{2};inline {2} 1;wp.
seq 10 10 : (
    ={glob A,glob RO1E.FunRO, glob CCA,glob H1,k1,pk,b}  /\  uniq (unzip1 UU2.lD{2}) /\
    (* case a: all occuring badc accounted for *)
    (forall c, c \in UU2.lD{2} => !goodc c.`1 CCA.sk{2}.`1 RO1E.FunRO.f{2} => 
                                  c.`1 \in RF.m{1}) /\
    (* case a: all PRF inputs are occurring badcs *)
    (forall c, c \in RF.m{1} => assoc UU2.lD{2} c = RF.m{1}.[c]) /\
    (* case b: all occurring goodc accounted for *)
    (forall c, c \in UU2.lD{2} => goodc c.`1 CCA.sk{2}.`1 RO1E.FunRO.f{2} => 
                                  oc2m c.`1 CCA.sk{2}.`1 \in RO2.RO.m{1}) /\
    (* case b: all RO2 inputs with an occurrence  *)
    (forall m, m \in RO2.RO.m{2} => 
        (assoc UU2.lD{2} (m2c m CCA.sk{2}.`1 RO1E.FunRO.f{2}) <> None /\
            assoc UU2.lD{2} (m2c m CCA.sk{2}.`1 RO1E.FunRO.f{2}) = RO2.RO.m{2}.[m] /\ 
                 RO2.RO.m{1}.[m] = RO2.RO.m{2}.[m])) /\
    (* case c: RO2 inconsistency for entries not added by dec oracle *)
    (forall m, m \in RO2.RO.m{1} => m \notin RO2.RO.m{2} => 
               assoc UU2.lD{2} (m2c m CCA.sk{2}.`1 RO1E.FunRO.f{2}) = RO2.RO.m{1}.[m]) /\  
                 RO2.RO.m{2} = empty /\ 
                 UU2.lD{2} = [] /\
                 !H1.bad{2}); 1: by
      inline *; auto => />; smt(mem_empty).
seq 2 2 : (={H1.bad,b} /\
   (!H1.bad{2} => (
    ={glob A,glob RO1E.FunRO, glob CCA,k1,pk,ck0} /\  uniq (unzip1 UU2.lD{2}) /\
    (* case a: all occuring badc accounted for *)
    (forall c, c \in UU2.lD{2} => !goodc c.`1 CCA.sk{2}.`1 RO1E.FunRO.f{2} => 
                                  c.`1 \in RF.m{1}) /\
    (* case a: all PRF inputs are occurring badcs *)
    (forall c, c \in RF.m{1} => assoc UU2.lD{2} c = RF.m{1}.[c]) /\
    (* case b: all occurring goodc accounted for *)
    (forall c, c \in UU2.lD{2} => goodc c.`1 CCA.sk{2}.`1 RO1E.FunRO.f{2} => 
                                  oc2m c.`1 CCA.sk{2}.`1 \in RO2.RO.m{1}) /\
    (* case b: all RO2 inputs with an occurrence  *)
    (forall m, m \in RO2.RO.m{2} => 
        (assoc UU2.lD{2} (m2c m CCA.sk{2}.`1 RO1E.FunRO.f{2}) <> None /\
            assoc UU2.lD{2} (m2c m CCA.sk{2}.`1 RO1E.FunRO.f{2}) = RO2.RO.m{2}.[m] /\ 
                 RO2.RO.m{1}.[m] = RO2.RO.m{2}.[m])) /\
    (* case c: RO2 inconsistency for entries not added by dec oracle *)
    (forall m, m \in RO2.RO.m{1} => m \notin RO2.RO.m{2} => 
               assoc UU2.lD{2} (m2c m CCA.sk{2}.`1 RO1E.FunRO.f{2}) = RO2.RO.m{1}.[m]))
     ));1: by wp;conseq />;[smt() | inline *;auto => />;smt(mem_empty get_setE)].
wp;call(:H1.bad,
     ={glob RO1E.FunRO, glob CCA, H1.bad} /\ uniq (unzip1 UU2.lD{2}) /\
    (* case a: all occuring badc accounted for *)
    (forall c, c \in UU2.lD{2} => !goodc c.`1 CCA.sk{2}.`1 RO1E.FunRO.f{2} => 
                                  c.`1 \in RF.m{1}) /\
    (* case a: all PRF inputs are occurring badcs *)
    (forall c, c \in RF.m{1} => assoc UU2.lD{2} c = RF.m{1}.[c]) /\
    (* case b: all occurring goodc accounted for *)
    (forall c, c \in UU2.lD{2} => goodc c.`1 CCA.sk{2}.`1 RO1E.FunRO.f{2} => 
                                  oc2m c.`1 CCA.sk{2}.`1 \in RO2.RO.m{1}) /\
    (* case b: all RO2 inputs with an occurrence  *)
    (forall m, m \in RO2.RO.m{2} => 
        (assoc UU2.lD{2} (m2c m CCA.sk{2}.`1 RO1E.FunRO.f{2}) <> None /\
            assoc UU2.lD{2} (m2c m CCA.sk{2}.`1 RO1E.FunRO.f{2}) = RO2.RO.m{2}.[m] /\ 
                 RO2.RO.m{1}.[m] = RO2.RO.m{2}.[m])) /\
    (* case c: RO2 inconsistency for entries not added by dec oracle *)
    (forall m, m \in RO2.RO.m{1} => m \notin RO2.RO.m{2} => 
          assoc UU2.lD{2} (m2c m CCA.sk{2}.`1 RO1E.FunRO.f{2}) = RO2.RO.m{1}.[m]),
     ={H1.bad}).
+ proc;sp;if;1,3: by auto.
  inline *;sp;if{2}.
  (* repeat ciphertext *)
  + if{1}; last  by auto => />;smt(assoc_none).
    (* badc *) 
    rcondf {1} 2; 1: by auto => />; smt(assoc_none).
    by auto => />;smt(assoc_none).
  (* new ciphertext *)
  if{1}.
  (* badc *) 
  + rcondt {1} 2; 1: by auto => />; smt(assoc_none).
    by auto => />;smt(get_setE assoc_none assoc_cons mapP).
  (* good c *)
  + rcondt {1} 5; 1: by auto => />; smt(assoc_none).
    by auto => />;smt(get_setE assoc_none assoc_cons mapP).
+ move => *;proc;inline *;auto => />; 
  sp;if{1};2:by auto => /> /#.
  sp;if{1}; 2: by auto => />  *;smt(dkey_ll). 
  by sp;if{1};auto => />  *;smt(dkey_ll). 
+ by move => *;proc;inline *;conseq />;islossless.
+ by proc;inline*;auto => />.
+ by move => *;proc;inline *;conseq />;islossless.
+ by move => *;proc;inline *;conseq />;islossless.
+ proc;inline *. 
  swap {1} 3 -2; swap {2} 8 -7;seq 1 1 : (#pre /\ ={k}); 1: by auto.
  sp 2 7;if{2};last by auto => /> /#.
  by if{1}; auto => />;smt(get_setE assoc_none assoc_cons mapP).
+ by move => *;proc;inline *;auto => />;smt(dkey_ll). 
+ by move => *;proc;inline *;auto => />;smt(dkey_ll). 
+ by auto => /> /#. 
by smt().
qed.

lemma bound_bad &m :
  Pr[ Gm2(H2(RO1E.FunRO),UU2,A).main() @ &m : H1.bad ] <=
    Pr[PKEROM.Correctness_Adv(RO1E.FunRO, TT, BUUC(A)).main() @ &m : res].
byequiv => //.
proc;inline*;wp;rnd{1};wp.
conseq(: _ ==> (H2.merr{2} <> None <=> H1.bad{1}) /\
  (H1.bad{1} => 
     dec sk{2}.`2 
      (enc (FunRO.f{2} (oget H2.merr{2})) pk{2} (oget H2.merr{2})) <> H2.merr{2} ));1 :smt().
call(: ={glob H1, glob H2, glob RF, glob RO1E.FunRO, glob RO2.RO, glob CCA, glob UU2} /\ 
   (H2.merr{2} <> None <=> H1.bad{1}) /\
    (H1.bad{1} => 
      dec CCA.sk{2}.`1.`2 
        (enc (FunRO.f{2} (oget H2.merr{2})) CCA.sk.`1.`1{2} (oget H2.merr{2})) <> H2.merr{2} )).
+ proc;inline *; conseq />.
  sp;if;1,3: by auto => /> /#.
  sp;if;1,3: by auto => /> /#.
  by auto => /> /#.
+ proc;inline *; conseq />.
  by auto => /> /#.
+ proc;inline *; conseq />.
  by auto => /> /#. 
swap {1} 4 -3.
by auto => /> /#. 
qed.

local lemma G2_G3 &m :
  (forall (H0 <: POracle_x2{-A} ) (O <: CCA_ORC{ -A} ),
  islossless O.dec => islossless H0.get1 => 
  islossless H0.get2 => islossless A(H0, O).guess) =>

  `| Pr[ Gm2(H2(RO1E.FunRO),UU2,A).main() @ &m : res ] - 
       Pr[ Gm3(H2(RO1E.FunRO),UU2,A).main() @ &m : res  ] |
     <= Pr[ Gm3(H2(RO1E.FunRO),UU2,A).main() @ &m : H2.invert ].
proof. 
move => A_ll.
byequiv : (H2.invert)  => //.
proc.
inline *.
rcondt{1} 30; 1: by auto => />;smt(mem_empty).
rcondf{1} 30; 1: by auto => />;smt().
swap{1} 11 -10 (* k1 *) ;swap {1} 29 -27 (* k0 *). (* fixme add swap for var names *)
swap{2} [11..12] -10. (* k1 k2 *)
seq 2 2 : (={glob A,k1} /\ k0{1} = k2{2}); 1: by auto.
 seq 32 19 : (={glob A,k1,pk,b,cm,CCA.sk,CCA.cstar, H2.invert, H2.mtgt, H1.bad, H2.merr, 
  H2.invert, RO1E.FunRO.f} /\ 
  !H2.invert{2} /\ 
  k0{1} = k2{2} /\  
  fdom RO2.RO.m{2} = fset0 /\
  fdom RO2.RO.m{1} = (if H1.bad{2} then fset0 else fset1 H2.mtgt{1}) /\
  ck0{1} = (cm{2},if H1.bad{2} then witness else k2{2}) /\
  CCA.cstar{2} = Some (m2c H2.mtgt{2} CCA.sk{2}.`1 RO1E.FunRO.f{2})  /\
  (forall c, Some c <> CCA.cstar{2} => assoc UU2.lD{1} c = assoc UU2.lD{2} c) /\
  (forall m, m <> H2.mtgt{2} => RO2.RO.m{1}.[m] = RO2.RO.m{2}.[m]) /\
  (!H1.bad{2} <=> 
             Some H2.mtgt{2} = dec  CCA.sk{2}.`1.`2 (oget CCA.cstar{2}))).
  auto => /> &2 f Hf kpair Hkpair b Hb m Hm.
  smt(mem_empty get_setE fdom_set @FMap @FSet @List).

case (H1.bad{1}).
rnd;wp;call(:H1.bad,false,CCA.cstar{2} <> None /\ 
     Some H2.mtgt{2} <> dec  CCA.sk{2}.`1.`2 (oget CCA.cstar{2}) /\ 
        ={H1.bad,H2.invert,H2.mtgt, CCA.sk,CCA.cstar} /\ H1.bad{1}).
+ by auto => />. 
+ by move => *;auto => />;islossless.
+ by move => *;auto => />;islossless.
+ by move => *;auto => />. 
+ by move => *;auto => />;islossless.
+ by move => *;auto => />;islossless.
+ by move => *;auto => />;islossless.
+ by move => *;proc;inline*;auto => />;smt(dkey_ll).
+ by move => *;proc;inline*;auto => />;smt(dkey_ll).
by auto => /> /#.  

rnd;wp;call(: H2.invert, 
  ={CCA.sk,CCA.cstar, H2.mtgt, H2.invert, H1.bad, H2.merr, H2.invert, RO1E.FunRO.f} /\
  CCA.cstar{2} = Some(m2c H2.mtgt{2} CCA.sk{2}.`1 RO1E.FunRO.f{2})  /\ 
  (forall c, Some c <> CCA.cstar{2} => assoc UU2.lD{1} c = assoc UU2.lD{2} c) /\ 
  fdom RO2.RO.m{2} `|` fset1 H2.mtgt{1} = fdom RO2.RO.m{1} /\
  Some H2.mtgt{2} = dec  CCA.sk{2}.`1.`2 (oget CCA.cstar{2}) /\
  (forall m, m <> H2.mtgt{2} => RO2.RO.m{1}.[m] = RO2.RO.m{2}.[m]),
       ={H2.invert}); last by auto => />;smt(fset0U). 
+ proc;sp;if;1:by auto.
  inline {1} 1;inline {2} 1.
  sp;if;by auto => />;smt(assoc_cons). 
  by auto => />.
+ move => *; proc.
  sp;if;2: by auto => />.
  inline 1.
  sp;if; 1: by auto => />.
  by auto => />; smt(dkey_ll).
+ move => *; proc.
  sp;if;2: by auto => />.
  inline 1.
  sp;if; 1: by auto => />.
  by auto => />; smt(dkey_ll).
+ by proc;auto.
+ by move => *;proc;auto.
+ by move => *; proc;auto. 
+ by proc;inline*;auto => />;smt(get_setE fdom_set  fset0U fsetUid fsetUAC assoc_cons).
+ by move => *;proc;inline*;auto => />; smt(dkey_ll). 
+ by move => *;proc;inline*;auto => />; smt(dkey_ll). 
by smt().
qed.

lemma bound_invert &m :
  (forall (H0 <: POracle_x2{-A} ) (O <: CCA_ORC{ -A} ),
  islossless O.dec => 
  islossless H0.get1 => 
  islossless H0.get2 => islossless A(H0, O).guess) =>

  `| Pr[PKEROM.OW_PCVA(RO1E.FunRO, TT, BUUOW(A)).main() @ &m : res] - 
     Pr[ Gm3(H2(RO1E.FunRO),UU2,A).main() @ &m : H2.invert ] |
     <= Pr[ Gm3(H2(RO1E.FunRO),UU2,A).main() @ &m : H1.bad ]. 
proof. 
move => A_ll.
have <- :  
   Pr[ Gm3(H2BOW(RO1E.FunRO),UU2,A).main() @ &m : CCA.cstar <> None /\
     (dec CCA.sk.`1.`2 (oget CCA.cstar)) <> None /\
     oget CCA.cstar =
     enc (RO1E.FunRO.f (oget (dec CCA.sk.`1.`2 (oget CCA.cstar)))) 
             CCA.sk.`1.`1 (oget (dec CCA.sk.`1.`2 (oget CCA.cstar))) /\
      card (filter (fun m0 => enc (FunRO.f m0) CCA.sk.`1.`1 m0 = 
             oget CCA.cstar) (fdom RO2.RO.m)) = 1 /\
      (oget (dec CCA.sk.`1.`2 (oget CCA.cstar))) = 
        head witness (elems (filter (fun m0 => enc (FunRO.f m0) CCA.sk.`1.`1 m0 = 
             oget CCA.cstar) (fdom RO2.RO.m))) ] = 
        Pr[PKEROM.OW_PCVA(RO1E.FunRO, TT, BUUOW(A)).main() @ &m : res].
+ byequiv => //.
  proc;inline *;wp;rnd{1}.
  conseq (: _ ==> ={FunRO.f, CCA.cstar, RO2.RO.m} /\ 
     CCA.cstar{1} <> None /\
     pk1{2} = CCA.sk{1}.`1.`1 /\
     PKEROM.OW_PCVA.sk{2} = CCA.sk{1}.`1 /\ 
     PKEROM.OW_PCVA.cc{2} = oget CCA.cstar{2}); 
      1: by auto => />;smt(elems_fset1). 

   call(_: ={RO2.RO.m, RO1E.FunRO.f, CCA.cstar, UU2.lD} /\
     CCA.sk{2}.`1.`1 = CCA.sk{1}.`1.`1 /\
     PKEROM.OW_PCVA.sk{2} = CCA.sk{1}.`1 /\ 
     PKEROM.OW_PCVA.cc{2} = oget CCA.cstar{2}); last by
    swap {1} 14 -4; (* H2.mtgt *) auto => />/#.
   + by proc; inline *; auto => />; sim.  
   + by proc; inline *; auto => />; sim.  
   by proc; inline *; auto => /> /#. 

byequiv : (H1.bad) => //.
proc;inline *;rnd;wp.  
seq 21 21 : (
  ={glob A, H1.bad, H2.merr, H2.invert, RF.m, FunRO.f,
    RO2.RO.m,UU2.lD,CCA.cstar,CCA.sk,pk,pk0,sk,k1,k2,
    b,H2.mtgt,cm} /\
     CCA.cstar{2} <> None /\
     CCA.cstar{2} = Some (m2c H2.mtgt{2} CCA.sk{2}.`1 RO1E.FunRO.f{2}) /\
        !H2.invert{2} /\
        RO2.RO.m{2} = empty /\ 
        UU2.lD{2} = [(oget CCA.cstar{2},witness)] /\
        (!H1.bad{2} => 
           dec CCA.sk{2}.`1.`2 
             (enc (RO1E.FunRO.f{2} H2.mtgt{2}) CCA.sk{2}.`1.`1 H2.mtgt{2}) = 
                 Some H2.mtgt{2}));
   1: by auto.
wp;call(:H1.bad,
     ={H1.bad, H2.merr, H2.invert, RF.m, FunRO.f,RO2.RO.m,UU2.lD,CCA.cstar,CCA.sk,H2.mtgt} /\
   CCA.cstar{2} <> None /\
   CCA.cstar{2} = Some (m2c H2.mtgt{2} CCA.sk{2}.`1 RO1E.FunRO.f{2}) /\
   dec CCA.sk{2}.`1.`2 
      (enc (RO1E.FunRO.f{2} H2.mtgt{2}) CCA.sk{2}.`1.`1 H2.mtgt{2}) = 
         Some H2.mtgt{2} /\
  (card (filter
    (fun (m0 : plaintext) => enc (FunRO.f{2} m0) CCA.sk{2}.`1.`1 m0 = 
       m2c H2.mtgt{2} CCA.sk{2}.`1 FunRO.f{2})
         (fdom RO2.RO.m{1})) <> 0 => 
           fset1 H2.mtgt{2} = 
             filter (fun (m0 : plaintext) => enc (FunRO.f{1} m0) CCA.sk{1}.`1.`1 m0 = 
                 oget CCA.cstar{1}) (fdom RO2.RO.m{1})) /\
   (H2.invert{2} <=> fset1 H2.mtgt{2} = 
      filter (fun (m0 : plaintext) => 
        enc (FunRO.f{1} m0) CCA.sk{1}.`1.`1 m0 = oget CCA.cstar{1}) (fdom RO2.RO.m{1})),
     ={H1.bad}).
+ proc;sp;if;1,3: by auto.
  by inline *;sp;if;auto => />.
+ by move => *;proc;inline *;auto => />;islossless. 
+ by move => *;proc;inline *;conseq />;islossless.
+ by proc;inline*;auto => />.
+ by move => *;proc;inline *;conseq />;islossless.
+ by move => *;proc;inline *;conseq />;islossless.
+ proc;inline *; 
  case (m{1} \notin RO2.RO.m{1}).
  + rcondt{1} 8;1 : by auto.
    rcondt{2} 9;1 : by auto.
    by auto => />;
      smt(in_filter in_fset0 mem_fdom filter1 fcardU fset0U fdom_set 
          filterU fdom0  filter0 fcard_eq0 fcard1 fsetUid fsetU0).
  + rcondf{1} 8;1 : by auto.
    rcondf{2} 9;1 : by auto.
    by auto => />;
      smt(in_filter in_fset0 mem_fdom filter1 fcardU fset0U fdom_set 
          filterU fdom0  filter0 fcard_eq0 fcard1 fsetUid fsetU0).
+ by move => *;proc;inline *;auto => />;smt(dkey_ll). 
+ by move => *;proc;inline *;auto => />;smt(dkey_ll). 
auto => /> &2 *; do split; 1:smt(fdom0  filter0 fcard_eq0 fcard1).
move => 16?H *;do split;1,2: smt(). 
by move => notb ;do split => *; move : H;rewrite notb /= => [#] 7?->>3?;
           [ rewrite subset_cardP; [ smt(fcard1)| smt( sub1set mem_filter)] |
               smt(subset_cardP sub1set mem_filter fcard1 elems_fset1)].
qed.

lemma bound_bad2 &m :
  Pr[ Gm3(H2(RO1E.FunRO),UU2,A).main() @ &m : H1.bad ] <=
    Pr[PKEROM.Correctness_Adv(RO1E.FunRO, TT, BUUCI(A)).main() @ &m : res].
byequiv => //.
proc;inline*;wp;rnd{1};wp.
conseq(: _ ==> (H2.merr{2} <> None <=> H1.bad{1}) /\
  (H1.bad{1} => 
     dec sk{2}.`2 
      (enc (FunRO.f{2} (oget H2.merr{2})) pk{2} (oget H2.merr{2})) <> H2.merr{2} ));1 :smt().
swap {1} 9 -5.
call(: ={glob H1, glob H2, glob RF, glob RO1E.FunRO, glob RO2.RO, glob CCA, glob UU2} /\ 
   (H2.merr{2} <> None <=> H1.bad{1}) /\
    (H1.bad{1} => 
      dec CCA.sk{2}.`1.`2 
        (enc (FunRO.f{2} (oget H2.merr{2})) CCA.sk.`1.`1{2} (oget H2.merr{2})) <> 
           H2.merr{2} )); last 
     by swap {1} 6 -5;  auto => />*; smt(MUniFinFun.dfun_ll randd_ll).
+ proc;inline *; conseq />.
  sp;if;1,3: by auto => /> /#.
  sp;if;1,3: by auto => /> /#.
  by auto => /> /#.
+ by proc;inline *;auto => /> /#.
+ by proc;inline*;auto => /> /#.
qed.

local module X = CCA(H2(RO1E.FunRO), UU2, A).O. (* FIX ME *)
lemma G3adv &m :
  (forall (H0 <: POracle_x2{-A} ) (O <: CCA_ORC{ -A} ),
  islossless O.dec => 
  islossless H0.get1 => 
  islossless H0.get2 => islossless A(H0, O).guess) =>

   Pr[Gm3(H2(RO1E.FunRO), UU2, A).main() @ &m : res] = 1%r/2%r. 
proof.
move => A_ll.
have -> : 
   Pr[Gm3(H2(RO1E.FunRO), UU2, A).main() @ &m : res] = 
   Pr[Gm3(H2(RO1E.FunRO), UU2, A).main_0adv() @ &m : res].
+ byequiv => //.  
  proc. swap {1} [9..10] 8. swap {1} 9 7. swap {2} 9 7. swap {2} 19 -3.
  rnd;call(_: ={glob H1, glob H2, glob RF, glob RO1E.FunRO, 
                glob RO2.RO, glob CCA, glob UU2} ).
  + proc;inline *; conseq />.
    sp;if;1,3: by auto => /> /#.
    sp;if;1,3: by auto => /> /#.
    by auto => /> /#.
  + by proc;auto => /> /#.
  + by proc;inline *;auto => /> /#.
  inline *. 
  seq 19 19 : (={b, pk, cm, glob A, glob H1, glob H2, glob RF, 
                 glob RO1E.FunRO, glob RO2.RO, glob CCA, glob UU2} ); 1: by auto => />.  
  conseq (_: k{2} = if b{2} then k1{1} else k2{1}); 1: smt().
  case (b{1}); last by auto => />.
  by swap {1} 1 1; auto => />.

byphoare => //.
proc. 
  seq 17 : true  (1%r)  (1%r/2%r) (0%r) (0%r).
  + by trivial.
  + islossless; last by smt(MUniFinFun.dfun_ll randd_ll). 
    apply (A_ll (H2(RO1E.FunRO)) X).
    + by islossless.
    + by islossless.
    + by islossless.
  + case (H1.bad). 
    + conseq(:nobias); 1: smt().
      rnd;rnd;auto => /> &hr ?; rewrite DBool.dbool_ll /=.
       rewrite -(mu_eq _ (pred1 true)).
       by move=> x; rewrite /pred1 /#.
      by apply DBool.dbool1E.
    conseq(: b' = b); 1:smt(). 
    rnd;rnd;auto => /> &hr ?; rewrite DBool.dbool_ll /=.
     rewrite -(mu_eq _ (pred1 b'{hr})).
     by move=> x; rewrite /pred1 /= (eq_sym x).
    by apply DBool.dbool1E.
  + by hoare; trivial.
by done.
qed.

(* REMOVING EAGER SAMPLING *)

local module (DG2  : RO1E.FinRO_Distinguisher) (G : RO1.RO) = {
    proc distinguish = PKEROM.Correctness_Adv(G, TT, BUUC(A)).main
}.

lemma corr_goal_eagerC &m: 
    Pr[PKEROM.Correctness_Adv(RO1E.FunRO, TT, BUUC(A)).main() @ &m : res]  =
     Pr[PKEROM.Correctness_Adv(RO1.RO, TT, BUUC(A)).main() @ &m : res].
proof.  
have -> :Pr[PKEROM.Correctness_Adv(RO1.RO, TT, BUUC(A)).main() @ &m : res]  = 
          Pr[RO1.MainD(DG2,RO1.RO).distinguish() @ &m : res]
    by byequiv => //;proc;inline *; wp 58 60; sim.
have -> : Pr[PKEROM.Correctness_Adv(RO1E.FunRO, TT, BUUC(A)).main() @ &m : res]  = 
          Pr[RO1.MainD(DG2,RO1E.FunRO).distinguish() @ &m : idfun res]
     by rewrite /idfun /=;byequiv => //;proc;inline *; wp 52 54; sim;
   auto => />; apply MUniFinFun.dfun_ll;smt(randd_ll).
have := RO1E.pr_FinRO_FunRO_D _ DG2 &m () idfun; 1: by smt(randd_ll).
have := RO1E.pr_RO_FinRO_D _ DG2 &m () idfun; 1: by smt(randd_ll).
by smt().
qed.

local module (DG3  : RO1E.FinRO_Distinguisher) (G : RO1.RO) = {
    proc distinguish = PKEROM.Correctness_Adv(G, TT, BUUCI(A)).main
}.

lemma corr_goal_eagerCI &m: 
    Pr[PKEROM.Correctness_Adv(RO1E.FunRO, TT, BUUCI(A)).main() @ &m : res]  =
     Pr[PKEROM.Correctness_Adv(RO1.RO, TT, BUUCI(A)).main() @ &m : res].
proof.  
have -> :Pr[PKEROM.Correctness_Adv(RO1.RO, TT, BUUCI(A)).main() @ &m : res]  = 
          Pr[RO1.MainD(DG3,RO1.RO).distinguish() @ &m : res]
    by byequiv => //;proc;inline *; wp 44 46; sim.
have -> : Pr[PKEROM.Correctness_Adv(RO1E.FunRO, TT, BUUCI(A)).main() @ &m : res]  = 
          Pr[RO1.MainD(DG3,RO1E.FunRO).distinguish() @ &m : idfun res] 
    by rewrite /idfun /=;byequiv => //;proc;inline *; wp 40 42; sim;
   auto => />; apply MUniFinFun.dfun_ll;smt(randd_ll).
have := RO1E.pr_FinRO_FunRO_D _ DG3 &m () idfun; 1: by smt(randd_ll).
have := RO1E.pr_RO_FinRO_D _ DG3 &m () idfun; 1: by smt(randd_ll).
by smt().
qed.

local module (DG4  : RO1E.FinRO_Distinguisher) (G : RO1.RO) = {
    proc distinguish = PKEROM.OW_PCVA(G, TT, BUUOWMod(A)).main
}.

lemma owmod &m :
  Pr[PKEROM.OW_PCVA(RO1E.FunRO, TT, BUUOW(A)).main() @ &m : res] =
           Pr[PKEROM.OW_PCVA(RO1E.FunRO, TT, BUUOWMod(A)).main() @ &m : res].
proof.
byequiv => //.
proc;inline *;wp. 
conseq (_: _==> ={glob PKEROM.OW_PCVA,RO1E.FunRO.f,RO2.RO.m,glob CCA} /\
    H2BOWMod.crd{2} = card (filter 
      (fun (m0_0 : plaintext) => enc (FunRO.f{1} m0_0) pk1{1} m0_0 = 
             oget CCA.cstar{1}) (fdom RO2.RO.m{1})) /\
    (H2BOWMod.crd{2} = 1 =>
    H2BOWMod.mf{2} = 
        Some (head witness (elems (filter 
      (fun (m0_0 : plaintext) => enc (FunRO.f{1} m0_0) pk1{1} m0_0 = 
         oget CCA.cstar{1}) (fdom RO2.RO.m{1})))))); 1: by auto => /> /#.
call(: ={glob PKEROM.OW_PCVA,RO1E.FunRO.f,RO2.RO.m,glob CCA,UU2.lD} /\ 
     CCA.cstar{2} <> None /\
    H2BOWMod.crd{2} = card (filter 
      (fun (m0_0 : plaintext) => enc (FunRO.f{1} m0_0) CCA.sk{2}.`1.`1 m0_0 = 
             oget CCA.cstar{1}) (fdom RO2.RO.m{1})) /\
    (H2BOWMod.crd{2} = 1 =>
    H2BOWMod.mf{2} = 
        Some (head witness (elems (filter 
      (fun (m0_0 : plaintext) => enc (FunRO.f{1} m0_0) CCA.sk{2}.`1.`1 m0_0 = 
         oget CCA.cstar{1}) (fdom RO2.RO.m{1}))))));
    last by auto => />; smt(fdom0 filter0 fcards0).
+ proc;inline *;sp;if;1,3: by auto => />.
  by sp;if;auto.
+ by proc;inline*;auto.

proc;inline *; 
  case (m{1} \notin RO2.RO.m{1}).
+ rcondt{1} 8;1 : by auto.
  rcondt{2} 9;1 : by auto.
  auto => /> &2;rewrite /b2i => *; 
      smt(disjointP fcardUI_indep in_filter in_fset0 fcard_ge0 fcard_eq0 setUE 
          elems_fset0 elems_fset1 set1E elems_fset1 fcardU  fcardI in_filter 
          in_fset0 mem_fdom filter1 fcardU fset0U fdom_set   filterU fdom0  
          filter0 fcard_eq0 fcard1 fsetUid fsetU0).
  + rcondf{1} 8;1 : by auto.
    rcondf{2} 9;1 : by auto.
    by auto => />.
qed.

lemma corr_goal_eagerOW &m: 
    Pr[PKEROM.OW_PCVA(RO1.RO, TT, BUUOWMod(A)).main() @ &m : res]  =
     Pr[PKEROM.OW_PCVA(RO1E.FunRO, TT, BUUOW(A)).main() @ &m : res].
proof. 
rewrite (owmod &m).
have -> :Pr[PKEROM.OW_PCVA(RO1.RO, TT, BUUOWMod(A)).main() @ &m : res]  = 
          Pr[RO1.MainD(DG4,RO1.RO).distinguish() @ &m : res] 
  by byequiv => //;proc;inline *;wp 42 44;sim.
have -> : Pr[PKEROM.OW_PCVA(RO1E.FunRO, TT, BUUOWMod(A)).main() @ &m : res] = 
          Pr[RO1.MainD(DG4,RO1E.FunRO).distinguish() @ &m : idfun res]
    by rewrite /idfun /=;byequiv => //;proc;inline *; wp 40 42; sim;
     auto => />; apply MUniFinFun.dfun_ll;smt(randd_ll).
have := RO1E.pr_FinRO_FunRO_D _ DG4 &m () idfun; 1: by smt(randd_ll).
have := RO1E.pr_RO_FinRO_D _ DG4 &m () idfun; 1: by smt(randd_ll).
by smt().
qed.

(* End Remove Eager                         *)

(* Counting queries *)
lemma count_buuc (H1 <: PKEROM.RO.RO{ -CO1, -BUUC(A)} ):
  qHT + qHU + 2 <= qHC =>

 (forall (RO<:POracle_x2{ -CountHx2, -A })(O<:CCA_ORC { -CountHx2, -A }), 
  hoare [A(CountHx2(RO), O).guess : 
       CountHx2.c_ht = 0   /\ CountHx2.c_hu = 0   ==> 
       CountHx2.c_ht <= qHT /\ CountHx2.c_hu <= qHU ]) =>

  hoare[ Correctness_Adv1(H1, BUUC(A)).A.find : CO1.counter = 0 ==> CO1.counter <= qHC].
proof. 
move => qbounds A_count;proc.
call(: CountHx2.c_ht = 0   /\ CountHx2.c_hu = 0   /\  CO1.counter <= 2 ==> 
       CountHx2.c_ht <= qHT /\ CountHx2.c_hu <= qHU /\ CO1.counter <= qHC).   
+ conseq  (: CO1.counter <= CountHx2.c_ht + CountHx2.c_hu + 2   ==> 
             CO1.counter <= CountHx2.c_ht + CountHx2.c_hu + 2) 
     (A_count (<:BUUC(A, CO1(H1)).H2B) (<:CCA(CountHx2(BUUC(A, CO1(H1)).H2B), UU2, A).O));1..2: smt(ge0_qHT).
  proc(CO1.counter <= CountHx2.c_ht + CountHx2.c_hu + 2);1,2:smt().
  + by proc;inline *;auto => />;trivial.
  + by proc;inline *;wp;conseq(:true);[smt() | trivial].
  + by proc;inline *;swap 6 9;wp;conseq(:true);[smt() | trivial]. 
  by inline *;swap 27 9;swap 18 17;wp;conseq(:true); [by smt()| trivial].
qed.

lemma count_buuci (H1 <: PKEROM.RO.RO{ -CO1, -BUUCI(A)} ):
  qHT + qHU + 1 <= qHC =>

 (forall (RO<:POracle_x2{ -CountHx2, -A })(O<:CCA_ORC { -CountHx2, -A }), 
  hoare [A(CountHx2(RO), O).guess : 
       CountHx2.c_ht = 0   /\ CountHx2.c_hu = 0  ==> 
       CountHx2.c_ht <= qHT /\ CountHx2.c_hu <= qHU ]) =>

  hoare[ Correctness_Adv1(H1, BUUCI(A)).A.find : CO1.counter = 0 ==> CO1.counter <= qHC].
proof. 
move => qbounds A_count;proc.
call(: CountHx2.c_ht = 0   /\ CountHx2.c_hu = 0   /\  CO1.counter <= 1 ==> 
       CountHx2.c_ht <= qHT /\ CountHx2.c_hu <= qHU /\ CO1.counter <= qHC).   
+ conseq  (: CO1.counter <= CountHx2.c_ht + CountHx2.c_hu + 1   ==> 
             CO1.counter <= CountHx2.c_ht + CountHx2.c_hu + 1) 
     (A_count (<:BUUCI(A, CO1(H1)).H2B) (<:CCA(CountHx2(BUUCI(A, CO1(H1)).H2B), UU2, A).O));1..2: smt(ge0_qHT).
  proc(CO1.counter <= CountHx2.c_ht + CountHx2.c_hu + 1);1,2:smt().
  + by proc;inline *;auto => />;trivial.
  + by proc;inline *;wp;conseq(:true);[smt() | trivial].
  + by proc;inline *;swap 6 9;wp;conseq(:true);[smt() | trivial]. 
  by inline *;wp;conseq(:true); [by smt()| trivial].
qed.

lemma count_buuowmod (RO <: PKEROM.POracle{-CountO, -BUUOWMod(A)} ) (O <: PKEROM.VA_ORC{-CountO, -BUUOWMod(A)} ):
  qP = 0 =>
  qV = 0 =>
  qHT + qHU + 1 <= qH =>

 (forall (RO<:POracle_x2{ -CountHx2, -A })(O<:CCA_ORC { -CountHx2, -A }), 
  hoare [A(CountHx2(RO), O).guess : 
       CountHx2.c_ht = 0   /\ CountHx2.c_hu = 0   ==> 
       CountHx2.c_ht <= qHT /\ CountHx2.c_hu <= qHU ]) =>

  hoare[ BUUOWMod(A, CountH(RO), CountO(O)).find :
          CountO.c_h = 0 /\ CountO.c_cvo = 0 /\ CountO.c_pco = 0 ==>
          CountO.c_h <= qH /\ CountO.c_cvo <= qV /\ CountO.c_pco <= qP].
move => qP0 qV0 qbounds A_count;proc.
call(: CountHx2.c_ht = 0   /\ CountHx2.c_hu = 0   /\  
       CountO.c_h <= 1 /\ CountO.c_cvo = 0 /\ CountO.c_pco = 0 ==> 
       CountO.c_cvo = 0 /\ CountO.c_pco = 0 /\ CountO.c_h <= qH).   
+ conseq  (: CountO.c_cvo = 0 /\ CountO.c_pco = 0 /\ CountO.c_h <= CountHx2.c_ht + CountHx2.c_hu + 1   ==> 
             CountO.c_cvo = 0 /\ CountO.c_pco = 0 /\ CountO.c_h <= CountHx2.c_ht + CountHx2.c_hu + 1 ) 
     (A_count (<:BUUOWMod(A, CountH(RO), CountO(O)).H2B) (<:CCA(CountHx2(BUUOWMod(A, CountH(RO), CountO(O)).H2B), UU2, A).O));1..2: smt(ge0_qHT).
  proc(CountO.c_cvo = 0 /\ CountO.c_pco = 0 /\ CountO.c_h <= CountHx2.c_ht + CountHx2.c_hu + 1 );1,2:smt().
  + by proc;inline *;auto => />;trivial.
  + by proc;inline *;wp;call(_:true);auto => /> /#.
  + by proc;inline *;swap 4 9;wp;conseq(:true);[ smt() | trivial].
  by inline *; auto => /> /#. 
qed.

(* End counting *)
  
lemma conclusion_cca_pre &m : 
  (forall (H0 <: POracle_x2{-A} ) (O <: CCA_ORC{ -A} ),
  islossless O.dec => 
  islossless H0.get1 => 
  islossless H0.get2 => islossless A(H0, O).guess) =>

  `| Pr[ KEMROMx2.CCA(RO_x2(RO1.RO,RO2.RO), UU, A).main() @ &m : res ] - 1%r/2%r | <=
     `|Pr [ J.IND(PRF,D(A)).main() @ &m : res ] - 
         Pr [ J.IND(RF, D(A)).main() @ &m : res ]|  + 
           Pr[PKEROM.Correctness_Adv(RO1.RO, TT, BUUC(A)).main() @ &m : res] +
           Pr[PKEROM.Correctness_Adv(RO1.RO, TT, BUUCI(A)).main() @ &m : res] +
         Pr[PKEROM.OW_PCVA(RO1.RO, TT, BUUOWMod(A)).main() @ &m : res].
  move => A_ll. 
  rewrite (corr_goal_eagerOW &m) -(corr_goal_eagerC &m) -(corr_goal_eagerCI &m).
  have hop1 := (Gm0_Gm1 &m).
  have  := G1_G2 &m A_ll.
  have <- := uu_goal_eager &m.  
  move => hop2.
  have bd := bound_bad &m.
  have hop3 :=  G2_G3 &m A_ll. 
  have inv := bound_invert &m A_ll. 
  have bd2 := bound_bad2 &m.
  have nowin := G3adv &m A_ll. 
  by smt().
qed.

end section.

section.

declare module A <: CCA_ADV  {-CCA, -RO1.RO, -RO1.FRO, -RO2.RO, -PRF, -RF, -UU2, -OW_CPA,
                    -RO1E.FunRO, -Gm2, -H2, -Gm3, -PKEROM.OW_PCVA, -H2BOWMod, -OWL_CPA,
                     -PKEROM.RO.RO, -PKEROM.RO.FRO, -Correctness_Adv1, -B, -CountO,
                     -PKEROM.OW_PCVA, -Correctness_Adv1, -CountO, -O_AdvOW, -Gm, 
                     -BOWp, -OWvsIND.Bowl, -BasePKE, -CountHx2}.

lemma conclusion &m : 
  qH = qHT + qHU + 1 =>
  qV = 0 =>
  qP = 0 =>
  qH + 1 = qHC =>
  qHC < FinT.card - 1 =>


 (forall (RO<:POracle_x2{ -CountHx2, -A })(O<:CCA_ORC { -CountHx2, -A }), 
  hoare [A(CountHx2(RO), O).guess : 
       CountHx2.c_ht = 0   /\ CountHx2.c_hu = 0  ==> 
       CountHx2.c_ht <= qHT /\ CountHx2.c_hu <= qHU ]) =>


  (forall (H0 <: POracle_x2{-A} ) (O <: CCA_ORC{ -A} ),
  islossless O.dec => 
  islossless H0.get1 => 
  islossless H0.get2 => islossless A(H0, O).guess) =>

  `| Pr[ KEMROMx2.CCA(RO_x2(RO1.RO,RO2.RO), UU, A).main() @ &m : res ] - 1%r/2%r | <=
     `|Pr [ J.IND(PRF,D(A)).main() @ &m : res ] - 
         Pr [ J.IND(RF, D(A)).main() @ &m : res ]|  + 
           (qHT + qHU + 3)%r * Pr[Correctness_Adv(BasePKE, B(BUUC(A), PKEROM.RO.RO)).main() @ &m : res] +
           (qHT + qHU + 3)%r * Pr[Correctness_Adv(BasePKE, B(BUUCI(A), PKEROM.RO.RO)).main() @ &m : res] + 
           (qHT + qHU + 3)%r * Pr[Correctness_Adv(BasePKE, B(AdvCorr(BUUOWMod(A)), PKEROM.RO.RO)).main() @ &m : res] +
                         Pr[Correctness_Adv(BasePKE, BOWp(BasePKE, AdvOW(BUUOWMod(A)))).main() @ &m : res] +
              2%r * `|Pr[CPA(BasePKE, OWvsIND.Bowl(OWvsIND.BL(AdvOW(BUUOWMod(A))))).main() @ &m : res] - 1%r / 2%r| +
                 (qHT + qHU + 1)%r * Pr[OW_CPA(BasePKE, AdvOW_query(BUUOWMod(A))).main() @ &m : res] +
                   2%r * eps_msg. 
  proof.
  move => qhval qv0 qp0 qhphc qhcb  A_count  A_ll.
  have concuu:= conclusion_cca_pre A &m A_ll.
  have corruu1 := Top.TT.correctness (BUUC(A)) &m qhcb _ _.  
  + by move => O;apply (count_buuc A O); [ smt() | apply A_count]. 
  + by move => *;proc;inline *; call(:true);islossless.  
  have corruu2 := Top.TT.correctness (BUUCI(A)) &m qhcb _ _. 
  + by move => O;apply (count_buuci A O); [ smt() | apply A_count]. 
  + by move => *;proc;inline *; call(:true);islossless.  
  have owcca := Top.TT.conclusion (BUUOWMod(A)) &m 1%r _ qhcb _ _ _;1: smt().
  + by smt(mu_bounded). 
  + by move => OA OB;apply(count_buuowmod A OA OB);[ smt() | smt() | smt() | apply A_count].
  + by move => *;proc;inline *; call(:true);islossless.  
  have ow2ind := OWvsIND.ow_ind BasePKE(AdvOW(BUUOWMod(A))) &m _ _ _ _; 1..3: by islossless.
  + by proc;inline *;wp;call(:true); islossless.  
 
  rewrite qv0 /= in owcca. 

  have ? : Pr[PKEROM.Correctness_Adv(RO1.RO, TT, BUUC(A)).main() @ &m : res] =
            Pr[PKEROM.Correctness_Adv(PKEROM.RO.RO, TT, BUUC(A)).main() @ &m : res] 
    by byequiv => //;proc;inline *;sim.

  have ? : Pr[PKEROM.Correctness_Adv(RO1.RO, TT, BUUCI(A)).main() @ &m : res] =
            Pr[PKEROM.Correctness_Adv(PKEROM.RO.RO, TT, BUUCI(A)).main() @ &m : res] 
    by byequiv => //;proc;inline *;sim.

  (* FIXME: MOVE TO TT? FOLLOWS FROM NOT USING SAMPLE *)
  have ? : Pr[PKEROM.OW_PCVA(RO1.RO, TT, BUUOWMod(A)).main() @ &m : res] = 
           Pr[PKEROM.OW_PCVA(PKEROM.RO.LRO, TT, BUUOWMod(A)).main() @ &m : res]
    by byequiv => //;proc;inline *;sim.

   smt().
qed.

module X(O : PKEROM.POracle) =  BUUC(A, O).H2B.
module XI(O : PKEROM.POracle) =  BUUCI(A, O).H2B.
lemma conclusion_cpa &m : 
  qH = qHT + qHU + 1 =>
  qV = 0 =>
  qP = 0 =>
  qH + 1 = qHC =>
  qHC < FinT.card - 1 =>

 (forall (RO<:POracle_x2{ -CountHx2, -A })(O<:CCA_ORC { -CountHx2, -A }), 
  hoare [A(CountHx2(RO), O).guess : 
       CountHx2.c_ht = 0   /\ CountHx2.c_hu = 0  ==> 
       CountHx2.c_ht <= qHT /\ CountHx2.c_hu <= qHU ]) =>

  (forall (H0 <: POracle_x2{-A} ) (O <: CCA_ORC{ -A} ),
  islossless O.dec => 
  islossless H0.get1 => 
  islossless H0.get2 => islossless A(H0, O).guess) =>

  `| Pr[ KEMROMx2.CCA(RO_x2(RO1.RO,RO2.RO), UU, A).main() @ &m : res ] - 1%r/2%r | <=
      2%r * `|Pr[CPA(BasePKE, OWvsIND.Bowl(OWvsIND.BL(AdvOW(BUUOWMod(A))))).main() @ &m : res] - 1%r / 2%r| +
      2%r * `|Pr[CPA(BasePKE, OWvsIND.Bowl(AdvOWL_query(BUUOWMod(A)))).main() @ &m : res] - 1%r / 2%r| +
           (qHT + qHU + 3)%r * Pr[Correctness_Adv(BasePKE, B(BUUC(A), PKEROM.RO.RO)).main() @ &m : res] +
           (qHT + qHU + 3)%r * Pr[Correctness_Adv(BasePKE, B(BUUCI(A), PKEROM.RO.RO)).main() @ &m : res] + 
           (qHT + qHU + 3)%r * Pr[Correctness_Adv(BasePKE, B(AdvCorr(BUUOWMod(A)), PKEROM.RO.RO)).main() @ &m : res] +
                         Pr[Correctness_Adv(BasePKE, BOWp(BasePKE, AdvOW(BUUOWMod(A)))).main() @ &m : res] +
           `|Pr [ J.IND(PRF,D(A)).main() @ &m : res ] - 
               Pr [ J.IND(RF, D(A)).main() @ &m : res ]|  + 
                  2%r * (qHT + qHU + 2)%r * eps_msg. 
  proof.
  move => qhval qv0 qp0 qhphc qhcb A_count A_ll.
  have concuu:= conclusion_cca_pre A &m A_ll.
  have corruu1 := Top.TT.correctness (BUUC(A)) &m qhcb _ _. (* FIXME: TOP *)
  + by move => O;apply (count_buuc A O); [ smt() | apply A_count]. 
  + by move => *;proc;inline *; call(:true);islossless.  
  have corruu2 := Top.TT.correctness (BUUCI(A)) &m qhcb _ _. 
  + by move => O;apply (count_buuci A O); [ smt() | apply A_count]. 
  + by move => *;proc;inline *; call(:true);islossless.  
  have owcca := Top.TT.conclusion_cpa (BUUOWMod(A)) &m 1%r _ qhcb _ _ _;1: smt().
  + by smt(mu_bounded). 
  + by move => OA OB;apply(count_buuowmod A OA OB);[ smt() | smt() | smt() | apply A_count].
  + by move => *;proc;inline *; call(:true);islossless.  
 
  rewrite qv0 /= in owcca. 

  have ? : Pr[PKEROM.Correctness_Adv(RO1.RO, TT, BUUC(A)).main() @ &m : res] =
            Pr[PKEROM.Correctness_Adv(PKEROM.RO.RO, TT, BUUC(A)).main() @ &m : res] 
    by byequiv => //;proc;inline *;sim.

  have ? : Pr[PKEROM.Correctness_Adv(RO1.RO, TT, BUUCI(A)).main() @ &m : res] =
            Pr[PKEROM.Correctness_Adv(PKEROM.RO.RO, TT, BUUCI(A)).main() @ &m : res] 
    by byequiv => //;proc;inline *;sim.

  have ? : Pr[PKEROM.OW_PCVA(RO1.RO, TT, BUUOWMod(A)).main() @ &m : res] = 
           Pr[PKEROM.OW_PCVA(PKEROM.RO.LRO, TT, BUUOWMod(A)).main() @ &m : res]
    by byequiv => //;proc;inline *;sim.
move => *.
   smt().
qed.


end section.
