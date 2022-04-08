require import AllCore ZModP IntDiv Distr List DList PKE_Ext.
from Jasmin require import JWord.
require import Array32 Array64 Array128 Array168 Array256 Array384.
require import Array768 Array960 Array1024 Array1152.
require import Kyber.

(**********************************)
(**********************************)
(**********************************)
(* The following lifts are needed
   to connect spec with security
   and correctness proofs         *)
(**********************************)
(**********************************)
(**********************************)

op sem_decode12(a : W8.t Array384.t) : ipoly.
op sem_decode4(a : W8.t Array128.t) : ipoly.
op sem_decode1(a : W8.t Array32.t) : ipoly.
op sem_encode12(a : ipoly) : W8.t Array384.t.
op sem_encode4(p : ipoly) : W8.t Array128.t.
op sem_encode1(a : ipoly) : W8.t Array32.t.
op sem_encode10_vec(u : ipolyvec) : W8.t Array960.t.
op sem_encode12_vec(a : ipolyvec) : W8.t Array1152.t.
op sem_decode10_vec(u : W8.t Array960.t) : ipolyvec.
op sem_decode12_vec(a : W8.t Array1152.t) : ipolyvec.

lemma sem_decode12K : cancel sem_decode12 sem_encode12 by admit. (* to do *)
lemma sem_encode12K : cancel sem_encode12 sem_decode12 by admit. (* to do *)
lemma sem_decode4K  : cancel sem_decode4  sem_encode4  by admit. (* to do *)
lemma sem_encode4K  : cancel sem_encode4  sem_decode4  by admit. (* to do *)
lemma sem_decode1K  : cancel sem_decode1  sem_encode1  by admit. (* to do *)
lemma sem_encode1K  : cancel sem_encode1  sem_decode1  by admit. (* to do *)
lemma sem_decode12_vecK  : cancel sem_decode12_vec  sem_encode12_vec  by admit. (* to do *)
lemma sem_encode12_vecK  : cancel sem_encode12_vec  sem_decode12_vec  by admit. (* to do *)
lemma sem_decode10_vecK  : cancel sem_decode10_vec  sem_encode10_vec  by admit. (* to do *)
lemma sem_encode10_vecK  : cancel sem_encode10_vec  sem_decode10_vec  by admit. (* to do *)

phoare sem_decode12 a : [ EncDec.decode12 : arg = a ==>  res = sem_decode12 a ] = 1%r by admit. (* reify *)
phoare sem_decode4  a : [ EncDec.decode4  : arg = a ==>  res = sem_decode4  a ] = 1%r by admit. (* reify *)
phoare sem_decode1  a : [ EncDec.decode1  : arg = a ==>  res = sem_decode1  a ] = 1%r by admit. (* reify *)
phoare sem_encode12 a : [ EncDec.encode12 : arg = a ==>  res = sem_encode12 a ] = 1%r by admit. (* reify *)
phoare sem_encode4  a : [ EncDec.encode4  : arg = a ==>  res = sem_encode4  a ] = 1%r by admit. (* reify *)
phoare sem_encode1  a : [ EncDec.encode1  : arg = a ==>  res = sem_encode1  a ] = 1%r by admit. (* reify *)

phoare sem_decode12_vec a : [ EncDec.decode12_vec : arg = a ==> res = sem_decode12_vec a ] = 1%r by admit. (* reify *)
phoare sem_decode10_vec a : [ EncDec.decode10_vec : arg = a ==> res = sem_decode10_vec a ] = 1%r by admit. (* reify *)
phoare sem_encode12_vec a : [ EncDec.encode12_vec : arg = a ==> res = sem_encode12_vec a ] = 1%r by admit. (* reify *)
phoare sem_encode10_vec a : [ EncDec.encode10_vec : arg = a ==> res = sem_encode10_vec a ] = 1%r by admit. (* reify *)

(**************************************************************************
   MLWE_PKE is the theory where we prove an abstract PKE construction
   that matches the algebraic basis of Kyber. This theory clones MLWE
   to get the hard problem definitions, and so it gets a bunch of 
   theories and RO clones. 
   We are interested in a sub-theory called MLWE_PKE_GENERAL, which 
   is the one for which we prove the most general results for 
   Kyber. Within it, we must fix the RO_SMP clone.

   It also independently clones PKE_Ext as PKE_, but it already fixes
   the underlying RO to MLWE_.RO_SMP, so all we need to fix is RO_SMP in 
   the MWLW_.RO_SMP. 

   This clone gives us the security proofs for the algebraic version
   of KyberPKE. To get proofs for Kyber spec, we just need to explain
   how the Kyber spec functionally maps to this algebraic version
   and then derive the properties as corollaries.
***************************************************************************)
require (****) MLWE_PKE.

theory SpecProperties.

import KMatrix.

clone import KyberSpec. (* We get a generic RO that we can later refine *)

import KyberPKE.

type pkey = W8.t Array1152.t * W8.t Array32.t.
type skey = W8.t Array1152.t.  

op pk_encode(pk : vector * W8.t Array32.t) : pkey = 
                                  (sem_encode12_vec (toipolyvec pk.`1) ,pk.`2).
op pk_decode(pk : pkey) = (ofipolyvec (sem_decode12_vec pk.`1) ,pk.`2).
op sk_encode(sk : vector) : skey = sem_encode12_vec (toipolyvec sk).
op sk_decode(sk : skey) = ofipolyvec (sem_decode12_vec sk).
op m_encode(m : plaintext) : poly = decompress_poly 1 (sem_decode1 m).
op m_decode(p : poly) : plaintext = sem_encode1 (compress_poly 1 p). 
op c_encode(c :  vector * poly) : ciphertext = 
      (sem_encode10_vec (compress_polyvec 10 c.`1), sem_encode4 (compress_poly 4 c.`2)).
op c_decode(c : ciphertext) =
      (decompress_polyvec 10 (sem_decode10_vec c.`1), decompress_poly 4 (sem_decode4 c.`2)).
op rnd_err_v = compress_poly_err 4. 
op rnd_err_u = mapv (compress_poly_err 10). 

op max_noise = q %/ 4.

op pe_R = pe^256.
op pv = pe_R^(kvec).
op pm = pe_R^(kvec^2).

op under_noise_bound (p : poly) (b : int) =
     all (fun cc => `| as_sint cc| < b) p.

op cv_bound : int = 104. (* this is the compress error bound for d = 4 *)
op fail_prob : real. (* Need to compute exact value or replace
                        with suitable bound *)

op epsilon_hack : real. (* Assumed simplification loss *)

clone import MLWE_PKE as MLWEPKE with 
  theory MLWE_PKE_GENERAL.MLWE_SMP.RO_SMP <- RO,
  type MLWE_.Matrix_.R = poly,
  type MLWE_.Matrix_.Matrix.matrix <- matrix,
  type MLWE_.Matrix_.vector <- vector,
  type MLWE_.Matrix_.ZR.t <- poly,
  pred MLWE_.Matrix_.ZR.unit <- fun x => x = Poly.one,
  op MLWE_.Matrix_.ZR.(+) <- Poly.(&+),
  op MLWE_.Matrix_.ZR.([-]) <- Poly.(&-),
  op MLWE_.Matrix_.ZR.zeror <- Poly.zero,
  op MLWE_.Matrix_.ZR.oner <- Poly.one,
  op MLWE_.Matrix_.ZR.( * ) <- Poly.(&*),
  op MLWE_.Matrix_.ZR.invr <- KMatrix.ZR.invr,
  op MLWE_.Matrix_.size <- kvec,
  op MLWE_.Matrix_.Vector.(+) <- KMatrix.Vector.(+),
  op MLWE_.Matrix_.Vector.prevector <- prevector,
  op MLWE_.Matrix_.Vector.vclamp <- vclamp,
  op MLWE_.Matrix_.Vector.tofunv <- tofunv,
  op MLWE_.Matrix_.Vector.offunv <- offunv,
  op MLWE_.Matrix_.Matrix.prematrix <- prematrix,
  op MLWE_.Matrix_.Matrix.mclamp <- mclamp,
  op MLWE_.Matrix_.Matrix.tofunm <- tofunm,
  op MLWE_.Matrix_.Matrix.offunm <- offunm,
  op MLWE_.duni_R <- duni_R,
  op MLWE_.dshort_R <- dshort_R,
  type MLWE_.seed <- W8.t Array32.t ,
  op MLWE_.dseed <- srand,
  type pkey <- pkey,
  type skey <- skey,
  op pk_encode <- pk_encode,
  op sk_encode <- sk_encode,
  op pk_decode <- pk_decode,
  op sk_decode <- sk_decode,
  type plaintext <- plaintext,
  type ciphertext <- ciphertext,
  op m_encode <- m_encode,
  op m_decode <- m_decode,
  op c_encode <- c_encode,
  op c_decode <- c_decode,  
  op MLWE_PKE_RO.Correctness.rnd_err_v <- rnd_err_v,
  op MLWE_PKE_RO.Correctness.rnd_err_u <- rnd_err_u,
  op MLWE_PKE_RO.Correctness.under_noise_bound <- under_noise_bound,
  op MLWE_PKE_RO.Correctness.max_noise <- max_noise,
  op MLWE_PKE_RO.Correctness.cv_bound <- cv_bound,
  op MLWE_PKE_RO.Correctness.fail_prob <- fail_prob,
  op MLWE_PKE_RO.Correctness.epsilon_hack <- epsilon_hack 
  proof MLWE_.dseed_ll by (apply srand_ll)
  proof MLWE_.dshort_R_ll  by apply dshort_R_ll
  proof MLWE_.duni_R_ll by apply duni_R_ll
  proof MLWE_.duni_R_fu by apply duni_R_fu
  proof MLWE_.Matrix_.ge0_size by smt()
  proof MLWE_.Matrix_.ZR.addrA by apply KMatrix.ZR.addrA
  proof MLWE_.Matrix_.ZR.addrC by apply KMatrix.ZR.addrC
  proof MLWE_.Matrix_.ZR.add0r by apply KMatrix.ZR.add0r
  proof MLWE_.Matrix_.ZR.addNr by apply KMatrix.ZR.addNr
  proof MLWE_.Matrix_.ZR.oner_neq0 by apply KMatrix.ZR.oner_neq0
  proof MLWE_.Matrix_.ZR.mulrA by apply KMatrix.ZR.mulrA
  proof MLWE_.Matrix_.ZR.mulrC by apply KMatrix.ZR.mulrC
  proof MLWE_.Matrix_.ZR.mul1r by apply KMatrix.ZR.mul1r
  proof MLWE_.Matrix_.ZR.mulrDl by apply KMatrix.ZR.mulrDl
  proof MLWE_.Matrix_.ZR.mulVr by apply KMatrix.ZR.mulVr
  proof MLWE_.Matrix_.ZR.unitP by apply KMatrix.ZR.unitP
  proof MLWE_.Matrix_.ZR.unitout by apply KMatrix.ZR.unitout
  proof MLWE_.Matrix_.ZR.mulf_eq0 by apply KMatrix.ZR.mulf_eq0
  proof MLWE_.Matrix_.Vector.tofunv_prevector by apply tofunv_prevector
  proof MLWE_.Matrix_.Vector.tofunvK by apply tofunvK
  proof MLWE_.Matrix_.Vector.offunvK by apply offunvK
  proof MLWE_.Matrix_.Matrix.tofunm_prematrix by apply tofunm_prematrix
  proof MLWE_.Matrix_.Matrix.tofunmK by apply tofunmK
  proof MLWE_.Matrix_.Matrix.offunmK by apply offunmK
  proof MLWE_.duni_R_uni by apply duni_R_uni
  proof pk_decodeK
  proof pk_encodeK
  proof sk_decodeK
  proof sk_encodeK
  proof MLWE_PKE_RO.Correctness.encode_noise
  proof MLWE_PKE_RO.Correctness.good_decode
  proof MLWE_PKE_RO.Correctness.cv_bound_valid
  proof MLWE_PKE_RO.Correctness.noise_commutes
  proof MLWE_PKE_RO.Correctness.correctness_hack
  proof MLWE_PKE_RO.Correctness.fail_prob.

realize pk_decodeK.
admitted.

realize pk_encodeK.
admitted.

realize sk_decodeK.
admitted.

realize sk_encodeK.
admitted.

realize MLWE_PKE_RO.Correctness.encode_noise.
move => /> u v.
rewrite /c_decode /c_encode /rnd_err_u /rnd_err_v /= sem_encode10_vecK sem_encode4K => />.
split; last  by rewrite round_poly_errE.
rewrite /(+) /mapv /=.
apply eq_vectorP => /> i il ih; rewrite !offunvE 1,2:/# /=.
rewrite Vector.offunvE 1:/# /= /compress_poly_err /=.
apply Array256.tP => k kb.
rewrite /compress_polyvec /= /fromarray256 /= /Poly.(&+) /=.
rewrite mapiE // map2E //= initiE //= initiE //= mapiE //= 1:/# initiE 1:/# /=. 
rewrite decompress_errE //; 1: smt(qE).
by rewrite mapiE /#.
qed.

realize MLWE_PKE_RO.Correctness.good_decode. 
rewrite /under_noise_bound /m_encode /m_decode /compress_poly /decompress_poly /max_noise => m n hgood.
have : sem_decode1 (sem_encode1 (map (compress 1) (map (decompress 1) (sem_decode1 m) &+ n))) = (sem_decode1 m); last by smt(sem_decode1K).
apply Array256.ext_eq => /> x h0x hx256. 
rewrite sem_encode1K /(&+) mapiE 1:/# map2E /= initiE /= 1:/# mapiE 1:/#.
rewrite b_decode_sem /b_decode /= -decompress_alt_decompress // /decompress_alt /= qE /=.
rewrite /as_sint => />.
rewrite Zq.addE  qE Zq.inFqK qE => />.
admitted. (*  should be an easy fix, maybe clone related. *)

realize MLWE_PKE_RO.Correctness.cv_bound_valid.
admitted. (* Rounding upper bound for one coefficient: compute in EC? *)

realize MLWE_PKE_RO.Correctness.noise_commutes.
move => n n' b H H0.
move : H H0; rewrite /under_noise_bound.
rewrite !allP.
move => Hn Hnp i ib.
move : (Hn i ib). 
move : (Hnp i ib) => /=. 
rewrite /as_sint /Poly.(&+) /= map2E !initiE //= Zq.addE qE /=  !StdOrder.IntOrder.ltr_norml /= => Hni Hnpi.
by smt().
qed.

realize MLWE_PKE_RO.Correctness.correctness_hack.
admitted. (* assumption: no one knows what this bound is *)


realize MLWE_PKE_RO.Correctness.fail_prob.
move => &m;byphoare.
proc.
auto => />.
rewrite /comp_distr /noise_exp_final /noise_exp_part /rdistr.
rewrite /good_noise /cv_bound /noise_val.
admitted. (* Probability of failure event in distribution: compute in EC? *)

(* We now specify the various components used by Kyber spec so that 
   we can relate it to the abstract construction. The differences
   are only in the sampling procedures. *)
import MLWE_PKE_GENERAL.

op SHA3_SMOOTH : W8.t Array32.t -> W8.t Array32.t * W8.t Array32.t.

module (G : G_t) = {
   proc sample(seed : W8.t Array32.t) : (W8.t Array32.t) *  (W8.t Array32.t) = {
        var rho, sig : W8.t Array32.t;
        (rho,sig) <- SHA3_SMOOTH seed;
        return (rho,sig);
   }
}.

op SHA3_PRF : W8.t Array32.t -> W8.t ->  W8.t Array128.t.

module KPRF : PseudoRF.PseudoRF = {
  proc keygen() : W8.t Array32.t = {
    var k : W8.t Array32.t;  
    k <$ srand;
    return k;
  }
  
  proc f(k : W8.t Array32.t, x : W8.t) : W8.t Array128.t = {
    return SHA3_PRF k x;
  }
}.

module (KSampler(XOF : XOF_t) : MLWE_SMP.Sampler) (O : RO.POracle)  = {
    proc sample(sd : W8.t Array32.t) : matrix = { 
     var i,j,c;
     var a : matrix;
     a <- witness;
     i <- 0;
     while (i < kvec) {
        j <- 0;
        while (j < kvec) {
           XOF(O).init(sd,W8.of_int j,W8.of_int i);
           c <@ Parse(XOF,O).sample();
           a.[(i,j)] <- c;
           j <- j + 1;
        }
        i <- i + 1;
     }
     return a;      
    }
}.

(*************************************
We define a version of Kyber spec that
uses a sampler. This is useful for 
syntactic reasons.
*************************************)


module KyberS(G : G_t, S : MLWE_SMP.Sampler, PRF : PseudoRF.PseudoRF, O : RO.POracle) : Scheme = {

  (* Spec gives a derandomized enc that matches this code *)
  proc kg_derand(seed: W8.t Array32.t) : pkey * skey = {
     var rho, sig, i,  _N,c,t;
     var tv,sv : W8.t Array1152.t;
     var a : matrix;
     var s,e : vector;
     e <- witness;
     s <- witness;
     sv <- witness;
     tv <- witness;
     (rho,sig) <@ G.sample(seed);
     _N <- 0; 
     a <@ S(O).sample(rho);     
     i <- 0;
     while (i < kvec) {
        c <@ CBD2(PRF).sample(sig,_N);
        s <- set s i c;
        _N <- _N + 1;
        i <- i + 1;
     }         
     i <- 0;
     while (i < kvec) {
        c <@ CBD2(PRF).sample(sig,_N);
        e <- set e i c;
        _N <- _N + 1;
        i <- i + 1;
     }      
     s <- nttv s;
     e <- nttv e; 
     t <- ntt_mmul a s + e;
     tv <@ EncDec.encode12_vec(toipolyvec t); (* minimum residues *)
     sv <@ EncDec.encode12_vec(toipolyvec s); (* minimum residues *)
     return ((tv,rho),sv);
  }

  proc kg() : pkey * skey = {
     var s,kp;
     s <$ srand;
     kp <@ kg_derand(s);
     return kp;
  }

  (* Spec gives a derandomized enc that matches this code *)
  proc enc_derand(pk : pkey, m : plaintext, r : W8.t Array32.t) : ciphertext = {
      var _N,i,c,tv,rho,rv,e1,e2,rhat,u,v,mp,c2,thati;
      var that : vector;
      var aT : matrix;
      var c1 : W8.t Array960.t;
      aT <- witness;
      c1 <- witness;
      e1 <- witness;
      rv <- witness;
      that <- witness;
      (tv,rho) <- pk;
      _N <- 0;
      thati <@ EncDec.decode12_vec(tv); 
      that <- ofipolyvec thati;
      aT <@ S(O).sample(rho);    
      aT <- trmx aT; 
      i <- 0;
      while (i < kvec) {
        c <@ CBD2(PRF).sample(r,_N);
        rv <- set rv i c;
        _N <- _N + 1;
        i <- i + 1;
      }         
      i <- 0;
      while (i < kvec) {
        c <@ CBD2(PRF).sample(r,_N);
        e1 <- set e1 i c;
        _N <- _N + 1;
        i <- i + 1;
      }      
      e2 <@ CBD2(PRF).sample(r,_N);
      rhat <- nttv rv;
      u <- invnttv (ntt_mmul aT rhat) + e1;
      mp <@ EncDec.decode1(m);
      v <- invntt (ntt_dotp that rhat) &+ e2 &+ decompress_poly 1 mp; 
      c1 <@ EncDec.encode10_vec(compress_polyvec 10 u); 
      c2 <@ EncDec.encode4(compress_poly 4 v);
      return (c1,c2);
  }

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
     var r,c;
     r <$ srand;
     c <@ enc_derand(pk,m,r);
     return c;
  }

  proc dec(sk : skey, cph : ciphertext) : plaintext option = {
      var m,mp,ui,v,vi,si, c1, c2;
      var u,s : vector;
      u <- witness;
      s <- witness;
      (c1,c2) <- cph;
      ui <@ EncDec.decode10_vec(c1);
      u <- decompress_polyvec 10 ui;
      vi <@ EncDec.decode4(c2);
      v <- decompress_poly 4 vi;
      si <@ EncDec.decode12_vec(sk);
      s <- ofipolyvec si;
      mp <- v &+ ((&-) (invntt (ntt_dotp s (nttv u))));
      m <@ EncDec.encode1(compress_poly 1 mp);
      return Some m;
  }

}.

equiv kg_sampler_kg (O <: RO.POracle) (XOF <: XOF_t) :
   KyberS(G,KSampler(XOF),KPRF,O).kg ~ Kyber(G,XOF,KPRF,O).kg : ={arg} /\ ={glob O, glob XOF} ==> ={res}.
proc;inline*.
seq 12 11: (#pre /\ ={sig} /\ ={s0} /\ ={rho} /\ ={e} /\ a0{1} = a{2} /\ ={_N} /\ sd{1} = rho{2}); 1: by auto.
sim => />.  admitted. (* sim does not eat this *)

equiv enc_sampler_enc (O <: RO.POracle)  (XOF <: XOF_t):
   KyberS(G,KSampler(XOF),KPRF,O).enc ~ Kyber(G,XOF,KPRF,O).enc : ={arg} /\ ={glob O, glob XOF} ==> ={res}.
proc;inline*. 
seq 31 29: (#pre /\ ={that, rv, r0, m0, e1, aT, _N}); 1: by sim.
sim => />. admitted. (* match i to j for transposed *)

equiv enc_sampler_dec (O <: RO.POracle)  (XOF <: XOF_t) :
   KyberS(G,KSampler(XOF),KPRF,O).dec ~ Kyber(G,XOF,KPRF,O).dec : ={arg} /\ ={glob O} ==> ={res} by proc;inline *;sim => /#.

(***************************************)

section.

declare module O <: RO.Oracle {-KPRF, -B1ROM, -B2ROM}.
declare module S <: MLWE_SMP.Sampler {-KPRF, -O, -B1ROM, -B2ROM}.
declare module As <: KyberPKE.AdversaryRO {-O, -S, -KPRF, -B1ROM, -B2ROM}.

lemma security_any_sampler &m :  
  islossless O.init =>
  islossless O.o =>
  (forall (x : RO.in_t), is_lossless (RO.dout x)) =>
  (forall (O0 <: RO.Oracle), islossless O0.o => islossless S(O0).sample) =>
  (forall (O0 <: RO.Oracle), islossless O0.o => islossless As(O0).guess) =>
  (forall (O0 <: RO.Oracle), islossless O0.o => islossless As(O0).choose) =>
  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,KyberS(G,S,KPRF),As,O).main() @ &m : res] - 1%r/2%r = 
  Pr[MLWE_SMP.MLWE_SMP(B1ROM(As, S), S, O).main(false, false) @ &m : res] -
 Pr[MLWE_SMP.MLWE_SMP(B1ROM(As, S), S, O).main(false, true) @ &m : res] +
 Pr[MLWE_SMP.MLWE_SMP(B2ROM(As, S), S, O).main(true, false) @ &m : res] -
 Pr[MLWE_SMP.MLWE_SMP(B2ROM(As, S), S, O).main(true, true) @ &m : res].
move => H H0 H1 H2 H3 H4.
have  <- : 
    Pr[ PKE_.CPAGameROM(PKE_.CPA,MLWE_PKE(S(O)),As,O).main() @ &m : res] =
    Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,KyberS(G,S,KPRF),As,O).main() @ &m : res]; last by
        apply (main_theorem_s O S As &m  H H0 H1 H2 H3 H4).
byequiv => //.
proc.
inline {1} 2.
inline {2} 2.
wp;call(_: ={glob O}); 1: by sim.
call(_: ={glob S, glob O}).
(* ENCRYPTION IS EQUIVALENT: Write aux lemma.  *)
+ inline {2} 2.
  wp;ecall{2}(sem_encode4 (compress_poly 4 v{2})).
  wp;ecall{2}(sem_encode10_vec (compress_polyvec 10 u{2})).
  wp;ecall{2}(sem_decode1 (m0{2})).
  swap {1} 5 -3. 
  wp;conseq />; 1:by smt().
  admit. (* follows from PRF hop and product of distributions,
            plus ntt properties *)

rnd;call(_: ={glob O}); 1: by sim.
conseq />; 1: by smt().

(* KEYGEN IS EQUIVALENT: Write aux lemma.  *)
call(_: ={glob S, glob O}).
inline {2} 2. 
wp;ecall{2}(sem_encode12_vec (toipolyvec s0{2})).
wp;ecall{2}(sem_encode12_vec (toipolyvec t{2})).
swap {1} 4 -2. 
inline {2} 7.
swap {2} [7..9] -4. 
swap {2} 11 -5. 
wp; conseq => />; 1: smt().
(* follows from PRF hop, entropy smoothing of SHA3_SMOOTH 
   and product of distributions, plus ntt properties *)
admit.

by inline *; conseq => />; sim.

qed.

end section.

end SpecProperties.

theory SpecPropertiesLWE.

(* To Do: Do the same for the MLWE based security 
   and correctness theorems.
   Clone spec properties with the correct RO type
   to apply these theorems as above.  *)
print MLWEPKE.MLWE_PKE_RO.Security.main_theorem_ro.
print MLWEPKE.MLWE_PKE_RO.Correctness.correctness_bound.

end SpecPropertiesLWE.

theory ImplementationProperties.

(* To Do: Get the equivalence results from 
   correctness folder INDCPA and show by
   transitivity that implementation is correct
   and secure because of the theorems above.
   The challenge will come from matching 
   the used G, PRF and XOF: a blunt approach
   is to assume functional equivalence for
   these components, which is fine for everything
   except the XOF, which actually uses a RO
   in the security and correctness analyses.
 *)

end ImplementationProperties.
