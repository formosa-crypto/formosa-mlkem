require import AllCore Distr FinType List SmtMap Kyber.
require (****) KyberProperties IRO.
from Jasmin require import JModel.
require import Array32 Array168 WArray168.
require import SHA3Indiff.
import Sponge BIRO Common Perm.

op dblock = dmap WArray168.darray
        (fun a => Array168.init (fun i => WArray168.get8 a i)).


clone import KyberProperties as KP with
  type SpecProperties.KyberSpec.KyberPKE.InfRO.from <- bool list,
  type SpecProperties.KyberSpec.KyberPKE.InfRO.to <- bool,
  op SpecProperties.KyberSpec.KyberPKE.InfRO.valid <- valid_toplevel,
  type SpecProperties.KyberSpec.KyberPKE.PRPt.D <- block * capacity,
  op SpecProperties.KyberSpec.KyberPKE.InfRO.dto <- {0,1},
  type SpecProperties.KyberSpec.KyberPKE.RO.in_t <- (W8.t Array32.t * W8.t * W8.t) * int,
  type SpecProperties.KyberSpec.KyberPKE.RO.out_t <- W8.t Array168.t,
  op SpecProperties.KyberSpec.KyberPKE.RO.dout <- fun _ => dblock.

import SpecProperties KyberSpec KyberPKE RO.

(* THIS IS A XOF THAT USES AS IDEAL OBJECT A RANDOM ORACLE
   OVER AN INFINITE TYPE. WE CAN SHOW THAT KSAMPLER USING THIS
   XOF IS PERFECTLY  INDIFFERENTIABLE FROM THE IDEAL SAMPLER. *)

module (XOF1B : XOF_t) (H : ROpub) = {
 var seed : W8.t Array32.t * W8.t * W8.t
 var idx : int
 proc init(rho : W8.t Array32.t, i j : W8.t) : unit = {
   seed <- (rho,i,j);
   idx <- 0;
 }
 proc next_bytes() : W8.t Array168.t = {
   var block;
   block <@ H.h((seed,idx));
   idx <- idx + 1;
   return block; 
 }
}.

(* THIS IS DESCRIBED IN THE MANUSCRIPT. ANNOYING PROOF. *)
module (Sim : MLWEPKE.MLWE_.SMP_vs_ROM_IND.Simulator_t) (O : MLWEPKE.MLWE_.MLWE_ROM.RO_H.ROpub) = {
   proc h(x : (W8.t Array32.t * W8.t * W8.t) * int) : W8.t Array168.t = {
     return witness;
   }
}.

import MLWEPKE.
import MLWE_.
import SMP_vs_ROM_IND.

lemma perfect_indif tr b  (D <:  MLWEPKE.MLWE_.SMP_vs_ROM_IND.Distinguisher_t {-LRO, -MLWEPKE.MLWE_.MLWE_ROM.RO_H.LRO, -Sim, -KSampler}) &m:
   Pr[MLWEPKE.MLWE_.SMP_vs_ROM_IND.WIndfReal(D, NTTSampler(KSampler(XOF1B)), LRO).main(tr, b) @ &m : res] =
         Pr[MLWEPKE.MLWE_.SMP_vs_ROM_IND.WIndfIdeal(D, Sim, MLWEPKE.MLWE_.MLWE_ROM.RO_H.LRO).main(tr, b) @ &m : res].
admitted.

(* From here we get *)
section.

declare module As <: KyberPKE.AdversaryRO {-LRO, -HSF.PRF, -PRF_.PRF, -MLWE_ROM.RO_H.RO, -MLWE_ROM.RO_H.LRO, -MLWE_ROM.RO_H.FRO, -MLWE_ROM.MLWE_vs_MLWE_ROM.B, -MLWE_ROM.MLWE_vs_MLWE_ROM.Bt, -BS, -D, -B1ROM, -B2ROM, -IdealHSF.RF, -IdealPRF1.RF, -IdealPRF2.RF, -KPRF, -XOF1B}.

lemma hop1 &m:
    (forall (O0 <: ROpub), islossless O0.h => islossless As(O0).guess) =>
    (forall (O0 <: ROpub), islossless O0.h => islossless As(O0).choose) =>
    `|Pr[CPAGameROM(CPA, Kyber(HSF.PseudoRF, XOF1B, PRF_.PseudoRF), As, LRO).main() @ &m : res] - 1%r / 2%r| <=
    `|Pr[HS_DEFS.IND(HSF.PRF, D_ES(KSampler(XOF1B), LRO, As)).main() @ &m : res] -
      Pr[HS_DEFS.IND(IdealHSF.RF, D_ES(KSampler(XOF1B), LRO, As)).main() @ &m : res]| +
    `|Pr[PRF_DEFS.IND(PRF_.PRF, D_PRF1(KSampler(XOF1B), LRO, As)).main() @ &m : res] -
      Pr[PRF_DEFS.IND(IdealPRF1.RF, D_PRF1(KSampler(XOF1B), LRO, As)).main() @ &m : res]| +
    `|Pr[PRF_DEFS.IND(PRF_.PRF, D_PRF2(KSampler(XOF1B), LRO, As)).main() @ &m : res] -
      Pr[PRF_DEFS.IND(IdealPRF2.RF, D_PRF2(KSampler(XOF1B), LRO, As)).main() @ &m : res]| +
    `|Pr[MLWE(MLWE_ROM.MLWE_vs_MLWE_ROM.B(BS(B1ROM(As, NTTSampler(KSampler(XOF1B))), Sim), MLWE_ROM.RO_H.LRO)).main
         (false) @ &m : res] -
      Pr[MLWE(MLWE_ROM.MLWE_vs_MLWE_ROM.B(BS(B1ROM(As, NTTSampler(KSampler(XOF1B))), Sim), MLWE_ROM.RO_H.LRO)).main
         (true) @ &m : res]| +
    `|Pr[MLWE(MLWE_ROM.MLWE_vs_MLWE_ROM.Bt(BS(B2ROM(As, NTTSampler(KSampler(XOF1B))), Sim), MLWE_ROM.RO_H.LRO)).main
         (false) @ &m : res] -
      Pr[MLWE(MLWE_ROM.MLWE_vs_MLWE_ROM.Bt(BS(B2ROM(As, NTTSampler(KSampler(XOF1B))), Sim), MLWE_ROM.RO_H.LRO)).main
         (true) @ &m : res]|.
proof. 
move => Aguess_ll Achoose_ll.
have := (security_spec_indiff As XOF1B Sim &m (0%r) _ _ _ _ _ _ _ _); last by smt().
+ by smt().
+ by move => *; rewrite /dblock dmap_ll /darray dmap_ll DList.dlist_ll dword_ll. 
+ by move => *;islossless.
+ by move => *;islossless.
+ admit. (* matrix sampling lossless *)
+ by apply Aguess_ll.
+ by apply Achoose_ll.
by move => tr b D; have := (perfect_indif tr b D &m); smt().
qed.

end section.
(* THIS IS A DIFFERENT XOF THAT USES THE INFINITE
   ROM INTERFACE DEFINED IN THE SHA3 INDIF PROOF. 
   IF WE WANT TO TALK ABOUT THE SECURITY OF KYBER
   IN A MODEL WHERE THE SPONGE IS MADE CONCRETE,
   THEN WE NEED TO BE ABLE TO CONTROL HOW MANY
   CALLS TO THE PERMUTATION ARE DONE BY KYBER, 
   AND HOW MANY ARE DONE BY THE ADVERSARY. A
   NATURAL WAY TO MODEL THIS IS TO DEFINE THIS XOF
   WITH A CONTROLLABLE SPONGE CALL "CREDIT".  *)

op max_blocks : int.

import BitEncoding BitChunking BS2Int.
op seed2bits(seed : W8.t Array32.t * W8.t * W8.t) = BytesToBits (to_list seed.`1 ++ [seed.`2] ++ [seed.`3]). 

op bits2blocks(bs : bool list) = 
  map (Array168.of_list witness) (chunk 168 (map W8.of_int (decode 8 bs))).


module XOFkB (H : IROpub, Dummy : ROpub) = {
 var idx : int
 var blocks : (W8.t Array168.t) list
 proc init(rho : W8.t Array32.t, i j : W8.t) : unit = {
   var bblocks;
   bblocks <@ H.f(seed2bits (rho,i,j),max_blocks * 8 * 168);
   blocks <- bits2blocks bblocks;
   idx <- 0;
 }
 proc next_bytes() : W8.t Array168.t = {
   var block;
   block <- nth witness blocks idx;
   idx <- idx + 1;
   return block; 
 }
}.

(* WE CAN RECAST KYBER AS A SCHEME THAT WORKS IN THIS IRO
   MODEL OR WITH THE SPONGE. RODummy JUST REMOVES FUNCTOR
   FROM THE TYPE. SHOULD WE RETHINK THE TYPE OF KYBER? *)

module ROdummy = {
 proc h(x : (W8.t Array32.t * W8.t * W8.t) * int) : W8.t Array168.t = {
    return witness;
 }
}.

module KyberSponge(HS : HSF.PseudoRF, PRF : PRF_.PseudoRF, O : IROpub, P : PermPub) = 
    Kyber(KHS,XOFkB(O),KPRF,ROdummy).

module KyberIRO(HS : HSF.PseudoRF, PRF : PRF_.PseudoRF, O : IROpub) = 
    Kyber(KHS,XOFkB(O),KPRF,ROdummy).

(* ANY ADVERSARY ATTACKING THE SPONGE BASED VERSION OF KYBER WITH
  ACCESS TO AN IDEAL PERMUTATION CAN BE RECAST USING THE INDIFF
  OF THE SPONGE RESULT AS AN ATTACKER AGAINST THE ROI BASED VERSION *)

module (AWrap(As : KyberPKE.AdversaryPerm) : KyberPKE.AdversaryIRO) (O : IROpub) = {
  proc choose(pk : pkey) : plaintext * plaintext = {
      var ms;
      Simulator(O).init();
      ms <@ As(Simulator(O)).choose(pk);
      return ms;
  }
  
  proc guess(c : ciphertext) : bool = {
      var b;
      b <@ As(Simulator(O)).guess(c);
      return b;
  }
}.

module Ext(P : DPRIMITIVE) : PRIMITIVE = {
   include P
   proc init() = {}
}.

module (Dist(As : KyberPKE.AdversaryPerm) : DISTINGUISHER) (F : DFUNCTIONALITY, P : DPRIMITIVE) = {
   proc distinguish() : bool = {
       var b;
       b <@ KyberPKE.CPAGamePerm(KyberPKE.CPA,KyberSponge(KHS,KPRF,F),As,Ext(P)).main();
       return b;
   }
}.

module (Wrap(A : KyberPKE.AdversaryIRO) : KyberPKE.AdversaryRO) (O : ROpub) = {
  module O = {
     proc f(x : bool list, n : int) : bool list  = {
          (* If we are outside of the in_t we must simulate it 
             ourselves.  *)
          return witness;
     }
  }

  proc choose(pk : pkey) : plaintext * plaintext = { 
     var ms;
     ms <@ A(O).choose(pk);
     return ms;
  } 
  
  proc guess(c : ciphertext) : bool = {
     var b;
     b <@ A(O).guess(c);
     return b;
  } 
}.

section.

declare module As <: KyberPKE.AdversaryPerm {-Common.Perm.Perm, -SLCommon.F.RO, -SLCommon.F.FRO, -SLCommon.Redo, -SLCommon.C, -Gconcl.S, -BlockSponge.BIRO.IRO, -BlockSponge.C, -IRO, -Gconcl_list.BIRO2.IRO, -Gconcl_list.F2.RO, -Gconcl_list.F2.FRO, -Gconcl_list.SimLast(Gconcl.S), -Gconcl_list.Simulator, -Simulator, -Cntr,
-LRO, -HSF.PRF, -PRF_.PRF, -MLWE_ROM.RO_H.RO, -MLWE_ROM.RO_H.LRO, -MLWE_ROM.RO_H.FRO, -MLWE_ROM.MLWE_vs_MLWE_ROM.B, -MLWE_ROM.MLWE_vs_MLWE_ROM.Bt, -BS, -D, -B1ROM, -B2ROM, -IdealHSF.RF, -IdealPRF1.RF, -IdealPRF2.RF, -KPRF, -XOF1B
}.

lemma sha3_indiff_hop &m :
  `|    Pr [ KyberPKE.CPAGamePerm(KyberPKE.CPA,KyberSponge(KHS,KPRF,Sponge(Perm)),As,Perm).main() @ &m : res ] -

      Pr [ KyberPKE.CPAGameIROM(KyberPKE.CPA,KyberIRO(KHS,KPRF),AWrap(As),IRO).main() @ &m : res ] | <=
       
  (limit ^ 2 - limit)%r / (2 ^ (r + c + 1))%r + (4 * limit ^ 2)%r / (2 ^ c)%r.
proof. 
have := SHA3Indiff (Dist(As)) &m _; 1: by admit. (* lossless *)
have -> : Pr[Experiment(Sponge(Common.Perm.Perm), Common.Perm.Perm, DRestr(Dist(As))).main() @ &m : res] = 
          Pr[CPAGamePerm(CPA, KyberSponge(KHS, KPRF, Sponge(Perm)), As, Perm).main() @ &m : res].
+ byequiv => //.
  proc. inline {1} 3; inline {2} 2. 
  admit. (* WE NEED TO SHOW WE ARE GUARANTEED TO BE BELOW CALL BOUND *)
have  -> : Pr[Experiment(IRO, Simulator(IRO), DRestr(Dist(As))).main() @ &m : res] = 
           Pr[CPAGameIROM(CPA, KyberIRO(KHS, KPRF), AWrap(As), IRO).main() @ &m : res]; last by smt().
byequiv => //.
proc. inline {1} 3; inline {2} 2. 
admit. (* WE NEED TO SHOW WE ARE GUARANTEED TO BE BELOW CALL BOUND *)
qed.

(*** AN UP TO BAD REASONING SHOULD ALLOW US TO PROVE THE FOLLOWING ***)

op epsilon : real.

lemma up_to_bad &m :
  `|  Pr [ KyberPKE.CPAGameIROM(KyberPKE.CPA,KyberIRO(KHS,KPRF),AWrap(As),IRO).main() @ &m : res ] -
      Pr [ KyberPKE.CPAGameROM(KyberPKE.CPA,Kyber(KHS,XOF1B,KPRF),Wrap(AWrap(As)),LRO).main() @ &m : res] | <= epsilon.
admitted.

(* PLUGGING EVERYTHING TOGETHER WE HAVE A PROOF DOWN TO MLWE IN THE RANDOM PERMUTATION MODEL *)

lemma main_theorem &m:
    (forall (O0 <: PermPub), islossless O0.f => islossless O0.fi => islossless As(O0).guess) =>
    (forall (O0 <: PermPub), islossless O0.f => islossless O0.fi => islossless As(O0).choose) =>
    `| Pr [ KyberPKE.CPAGamePerm(KyberPKE.CPA,KyberSponge(KHS,KPRF,Sponge(Perm)),As,Perm).main() @ &m : res ] - 1%r / 2%r| <=
    `|Pr[HS_DEFS.IND(HSF.PRF, D_ES(KSampler(XOF1B), LRO, Wrap(AWrap(As)))).main() @ &m : res] -
      Pr[HS_DEFS.IND(IdealHSF.RF, D_ES(KSampler(XOF1B), LRO, Wrap(AWrap(As)))).main() @ &m : res]| +
    `|Pr[PRF_DEFS.IND(PRF_.PRF, D_PRF1(KSampler(XOF1B), LRO, Wrap(AWrap(As)))).main() @ &m : res] -
      Pr[PRF_DEFS.IND(IdealPRF1.RF, D_PRF1(KSampler(XOF1B), LRO, Wrap(AWrap(As)))).main() @ &m : res]| +
    `|Pr[PRF_DEFS.IND(PRF_.PRF, D_PRF2(KSampler(XOF1B), LRO, Wrap(AWrap(As)))).main() @ &m : res] -
      Pr[PRF_DEFS.IND(IdealPRF2.RF, D_PRF2(KSampler(XOF1B), LRO, Wrap(AWrap(As)))).main() @ &m : res]| +
    `|Pr[MLWE(MLWE_ROM.MLWE_vs_MLWE_ROM.B(BS(B1ROM(Wrap(AWrap(As)), NTTSampler(KSampler(XOF1B))), Sim), MLWE_ROM.RO_H.LRO)).main
         (false) @ &m : res] -
      Pr[MLWE(MLWE_ROM.MLWE_vs_MLWE_ROM.B(BS(B1ROM(Wrap(AWrap(As)), NTTSampler(KSampler(XOF1B))), Sim), MLWE_ROM.RO_H.LRO)).main
         (true) @ &m : res]| +
    `|Pr[MLWE(MLWE_ROM.MLWE_vs_MLWE_ROM.Bt(BS(B2ROM(Wrap(AWrap(As)), NTTSampler(KSampler(XOF1B))), Sim), MLWE_ROM.RO_H.LRO)).main
         (false) @ &m : res] -
      Pr[MLWE(MLWE_ROM.MLWE_vs_MLWE_ROM.Bt(BS(B2ROM(Wrap(AWrap(As)), NTTSampler(KSampler(XOF1B))), Sim), MLWE_ROM.RO_H.LRO)).main
         (true) @ &m : res]| + epsilon + 
              (limit ^ 2 - limit)%r / (2 ^ (r + c + 1))%r + (4 * limit ^ 2)%r / (2 ^ c)%r.
move => Aguess_ll Achoose_ll.
have := up_to_bad &m.
have := sha3_indiff_hop &m.
have := hop1 (Wrap(AWrap(As))) &m _ _.
+ move => O oll. admit. (* lossless *) 
+ move => O oll. admit. (* lossless *) 
by smt().
qed.

end section.
