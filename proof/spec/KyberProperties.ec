require import AllCore ZModP IntDiv Distr List DList PKE_Ext.
from Jasmin require import JWord.
require import Array32 Array64 Array128 Array168 Array256 Array384.
require import Array768 Array960 Array1024 Array1152.
require import Kyber.

(* Aux *)
import KMatrix.
import Zq.
lemma ofipolyvecK_small (x : ipolyvec) :
    (forall k, 0 <= k < 768 => 0 <= x.[k] < q) =>  toipolyvec (ofipolyvec x) = x.
move => bnd.
rewrite /ofipolyvec /toipolyvec /fromarray256 /subarray256.
apply Array768.ext_eq => k kb.
rewrite mapiE //= initiE //=.
case (0 <= k && k < 256). 
+ move => *. rewrite offunvE //= mapiE //= initiE //= inFqK; smt(modz_small).
move => *;case (256 <= k && k < 512). 
+ move => *; rewrite offunvE //= mapiE 1:/# initiE 1:/# inFqK; smt(modz_small).
move => *; rewrite offunvE //= mapiE 1:/# initiE 1:/# inFqK; smt(modz_small).
qed.

lemma toipolyvecK (x : vector) :
   ofipolyvec (toipolyvec x) = x.
rewrite /ofipolyvec /toipolyvec /fromarray256 /subarray256.
apply eq_vectorP => i ib.
rewrite offunvE //=.
apply Array256.tP => k kb.
by rewrite mapiE //= initiE //= mapiE 1:/# initiE 1:/# /= asintK /#.
qed.

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

lemma sem_decode1_bnd a k : 0<=k<256 => 0<= (sem_decode1 a).[k] < 2 by admit. (* to do *)


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
   theories and RO clones. The relevant one is RO_SMP.

   It also independently clones PKE_Ext as PKE_, but it already fixes
   the underlying RO to MLWE_.RO_SMP, so all we need to fix is RO_SMP in 
   the MWLW_.RO_SMP. 

   This clone gives us the security proofs for the algebraic version
   of KyberPKE. To get proofs for Kyber spec, we just need to explain
   how the Kyber spec functionally maps to this algebraic version
   and then derive the properties as corollaries.
***************************************************************************)
require import MLWE_PKE.

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

clone import MLWE_PKE as MLWEPKE with 
  theory MLWE_.MLWE_SMP.RO_SMP <- RO,
  type MLWE_.Matrix_.R = poly,
  type MLWE_.Matrix_.Matrix.matrix <- matrix,
  type MLWE_.Matrix_.vector <- vector,
  type MLWE_.Matrix_.ZR.t <- poly,
  pred MLWE_.Matrix_.ZR.unit <- KMatrix.ZR.unit,
  op MLWE_.Matrix_.ZR.(+) <- KPoly.(&+),
  op MLWE_.Matrix_.ZR.([-]) <- KPoly.(&-),
  op MLWE_.Matrix_.ZR.zeror <- KPoly.zero,
  op MLWE_.Matrix_.ZR.oner <- KPoly.one,
  op MLWE_.Matrix_.ZR.( * ) <- KPoly.(&*),
  op MLWE_.Matrix_.ZR.invr <- KPoly.invr,
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
  op rnd_err_v <- rnd_err_v,
  op rnd_err_u <- rnd_err_u,
  op under_noise_bound <- under_noise_bound,
  op max_noise <- max_noise,
  op cv_bound <- cv_bound
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
  proof pk_encodeK
  proof sk_encodeK
  proof encode_noise
  proof good_decode
  proof cv_bound_valid
  proof noise_commutes.

realize pk_encodeK.
rewrite /pk_decode /pk_encode /cancel /= => x.
by rewrite sem_encode12_vecK toipolyvecK /#.
qed.

realize sk_encodeK.
rewrite /sk_decode /sk_encode /cancel /= => x.
by rewrite sem_encode12_vecK toipolyvecK /#.
qed.

realize encode_noise.
move => /> u v.
rewrite /c_decode /c_encode /rnd_err_u /rnd_err_v /= sem_encode10_vecK sem_encode4K => />.
split; last  by rewrite round_poly_errE.
rewrite /(+) /mapv /=.
apply eq_vectorP => /> i il ih; rewrite !offunvE 1,2:/# /=.
rewrite Vector.offunvE 1:/# /= /compress_poly_err /=.
apply Array256.tP => k kb.
rewrite /compress_polyvec /= /fromarray256 /= /KPoly.(&+) /=.
rewrite mapiE // map2E //= initiE //= initiE //= mapiE //= 1:/# initiE 1:/# /=. 
rewrite decompress_errE //; 1: smt(qE).
by rewrite mapiE /#.
qed.

realize good_decode. 
rewrite /under_noise_bound /m_encode /m_decode /compress_poly 
        /decompress_poly /max_noise /as_sint qE  /= => m n.
rewrite allP  => /=  hgood.
have : sem_decode1 (sem_encode1 (map (compress 1) (map (decompress 1) (sem_decode1 m) &+ n))) = 
       (sem_decode1 m); last by smt(sem_decode1K).
apply Array256.ext_eq => /> x h0x hx256. 
rewrite sem_encode1K /(&+) mapiE 1:/# map2E /= initiE /= 1:/# mapiE 1:/#.
rewrite b_decode_sem /b_decode /= -decompress_alt_decompress // /decompress_alt /= qE /=.
rewrite /as_sint  Zq.addE  qE Zq.inFqK qE => />.
move : (hgood x _) => //; rewrite /(`|_|)%Int /= => hgoodx.
by rewrite /(`|_|)%Int; smt(sem_decode1_bnd).
qed.

realize cv_bound_valid.
admitted. (* Rounding upper bound for one coefficient: compute in EC? *)

realize noise_commutes.
move => n n' b H H0.
move : H H0; rewrite /under_noise_bound.
rewrite !allP.
move => Hn Hnp i ib.
move : (Hn i ib). 
move : (Hnp i ib) => /=. 
rewrite /as_sint /KPoly.(&+) /= map2E !initiE //= Zq.addE qE /=  !StdOrder.IntOrder.ltr_norml /= => Hni Hnpi.
by smt().
qed.

(* We now specify the various components used by Kyber spec so that 
   we can relate it to the abstract construction. The differences
   are only in the sampling procedures. *)
import MLWE_.MLWE_SMP.

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


module (KSampler(XOF : XOF_t) : Sampler) (O : RO.POracle)  = {
    proc sampleA(sd : W8.t Array32.t) : matrix = { 
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

    proc sampleAT(sd : W8.t Array32.t) : matrix = { 
     var i,j,c;
     var a : matrix;
     a <- witness;
     i <- 0;
     while (i < kvec) {
        j <- 0;
        while (j < kvec) {
           XOF(O).init(sd,W8.of_int i,W8.of_int j);
           c <@ Parse(XOF,O).sample();
           a.[(i,j)] <- c;
           j <- j + 1;
        }
        i <- i + 1;
     }
     return a;      
    }

}.

lemma KSamplerA_ll (XOF <: XOF_t) (O <: RO.POracle) :
   (islossless O.o) =>
   (forall (O0 <: RO.POracle), islossless O0.o => islossless XOF(O0).init) =>
   (forall (O0 <: RO.POracle), islossless O0.o => islossless XOF(O0).next_bytes) =>
   (forall (O0 <: RO.POracle) (XOF0 <: XOF_t), 
         islossless O0.o => 
         islossless XOF0(O0).next_bytes => 
         islossless Parse(XOF0,O0).sample) =>
   islossless KSampler(XOF,O).sampleA.
proof. 
move => O_ll XOF_init_ll XOF_next_ll Parse_ll.
proc.
while(0 <= i <= kvec) (kvec-i); last by move => *;auto => /> /#.
move => *; wp.
while(#post /\ 0 <= j <= kvec) (kvec-j); last by move => *;auto => /> /#.
move => *; wp.
call (Parse_ll O XOF).
+ apply (XOF_next_ll O).
apply (O_ll).
conseq (_: ==> true); 1: by smt().
call (XOF_init_ll O).
by auto => />.
qed.

lemma KSamplerAT_ll (XOF <: XOF_t) (O <: RO.POracle) :
   (islossless O.o) =>
   (forall (O0 <: RO.POracle), islossless O0.o => islossless XOF(O0).init) =>
   (forall (O0 <: RO.POracle), islossless O0.o => islossless XOF(O0).next_bytes) =>
   (forall (O0 <: RO.POracle) (XOF0 <: XOF_t), 
         islossless O0.o => islossless XOF0(O0).next_bytes => 
         islossless Parse(XOF0,O0).sample) =>
         islossless KSampler(XOF,O).sampleAT.
proof. 
move => O_ll XOF_init_ll XOF_next_ll Parse_ll.
proc.
while(0 <= i <= kvec) (kvec-i); last by move => *;auto => /> /#.
move => *; wp.
while(#post /\ 0 <= j <= kvec) (kvec-j); last by move => *;auto => /> /#.
move => *; wp.
call (Parse_ll O XOF).
+ apply (XOF_next_ll O).
apply (O_ll).
conseq (_: ==> true); 1: by smt().
call (XOF_init_ll O).
by auto => />.
qed.


(*************************************
We define a version of Kyber spec that
uses a sampler. This is useful for 
syntactic reasons.
*************************************)


module KyberS(G : G_t, S : Sampler, PRF : PseudoRF.PseudoRF, O : RO.POracle) : Scheme = {

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
     a <@ S(O).sampleA(rho);     
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
      aT <@ S(O).sampleAT(rho);    
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

(* We have that instantiating S with KSampler we get the Spec *)
lemma kg_sampler_kg (O <: RO.POracle) (XOF <: XOF_t {-O}) :
  equiv [   KyberS(G,KSampler(XOF),KPRF,O).kg ~ Kyber(G,XOF,KPRF,O).kg : 
     ={arg} /\ ={glob O, glob XOF} ==> ={res, glob O, glob XOF}].
proc;inline*.
seq 12 11: (#pre /\ ={sig} /\ ={s0} /\ ={rho} /\ ={e} /\ 
            a0{1} = a{2} /\ ={_N} /\ sd{1} = rho{2}); 1: by auto.
by sim => />.
qed.

lemma enc_sampler_enc (O <: RO.POracle)  (XOF <: XOF_t {-O}):
 equiv [
   KyberS(G,KSampler(XOF),KPRF,O).enc ~ Kyber(G,XOF,KPRF,O).enc : 
    ={arg} /\ ={glob O, glob XOF} ==> ={res, glob O, glob XOF}].
proc. 
inline {1} 2; inline {2} 2. 
swap {1} 5 8.
swap {2} 5 8.
seq 12 12: (#pre /\ ={that, rv, r0, m, m0, e1, _N,rho}); 1: by inline *; sim.
by inline *;sim => /#.
qed.

lemma enc_sampler_dec (O <: RO.POracle)  (XOF <: XOF_t) :
  equiv [ KyberS(G,KSampler(XOF),KPRF,O).dec ~ Kyber(G,XOF,KPRF,O).dec : 
     ={arg} /\ ={glob O} ==> ={res} ] by proc;inline *;sim => /#.

(***************************************)

section.

declare module O <: RO.Oracle {-KPRF, -B1ROM, -B2ROM}.
declare module S <: Sampler {-KPRF, -O, -B1ROM, -B2ROM}.
declare module As <: KyberPKE.AdversaryRO {-O, -S, -KPRF, -B1ROM, -B2ROM}.

lemma security_any_sampler &m :  
  islossless O.init =>
  islossless O.o =>
  (forall (O0 <: RO.Oracle), islossless O0.o => islossless S(O0).sampleA) =>
  (forall (O0 <: RO.Oracle), islossless O0.o => islossless S(O0).sampleAT) =>
  (forall (O0 <: RO.Oracle), islossless O0.o => islossless As(O0).guess) =>
  (forall (O0 <: RO.Oracle), islossless O0.o => islossless As(O0).choose) =>
  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,KyberS(G,S,KPRF),As,O).main() @ &m : res] - 1%r/2%r = 
  Pr[MLWE_SMP(B1ROM(As, S), S, O).main(false, false) @ &m : res] -
 Pr[MLWE_SMP(B1ROM(As, S), S, O).main(false, true) @ &m : res] +
 Pr[MLWE_SMP(B2ROM(As, S), S, O).main(true, false) @ &m : res] -
 Pr[MLWE_SMP(B2ROM(As, S), S, O).main(true, true) @ &m : res].
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
  admit. (* Hugo: follows from PRF hop and product of distributions,
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
wp; conseq => />.

admit. (* Hugo: follows from PRF hop, entropy smoothing of SHA3_SMOOTH 
                and product of distributions, plus ntt properties *)

by inline *; conseq => />; sim.

qed.

end section.

section.

declare module O <: RO.Oracle {-KPRF, -B1ROM, -B2ROM}.
declare module XOF <: XOF_t {-KPRF, -O, -B1ROM, -B2ROM}.
declare module As <: KyberPKE.AdversaryRO {-O, -XOF, -KPRF, -B1ROM, -B2ROM}.

(* This theorem yields security for any sampler and we can use
   it to obtain security for the implementation in the standard 
   model under the assumption that MLWE is secure when the matrix
   is sampled how the implementation does it. 
   We can't get any formal correctness bounds though, since
   the distribution of the matrix is not well defined. *)
lemma security_spec &m :  
  islossless O.init =>
  islossless O.o =>
  (forall (O0 <: RO.POracle), islossless O0.o => islossless XOF(O0).init) =>
  (forall (O0 <: RO.POracle), islossless O0.o => islossless XOF(O0).next_bytes) =>

   (forall (O0 <: RO.POracle) (XOF0 <: XOF_t), 
         islossless O0.o => 
         islossless XOF0(O0).next_bytes => 
         islossless Parse(XOF0,O0).sample) =>

  (forall (O0 <: RO.Oracle), islossless O0.o => islossless As(O0).guess) =>
  (forall (O0 <: RO.Oracle), islossless O0.o => islossless As(O0).choose) =>

  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,Kyber(G,XOF,KPRF),As,O).main() @ &m : res] - 1%r/2%r = 
  Pr[MLWE_SMP(B1ROM(As, KSampler(XOF)),  KSampler(XOF), O).main(false, false) @ &m : res] -
 Pr[MLWE_SMP(B1ROM(As,  KSampler(XOF)),  KSampler(XOF), O).main(false, true) @ &m : res] +
 Pr[MLWE_SMP(B2ROM(As,  KSampler(XOF)),  KSampler(XOF), O).main(true, false) @ &m : res] -
 Pr[MLWE_SMP(B2ROM(As,  KSampler(XOF)),  KSampler(XOF), O).main(true, true) @ &m : res].
move => Oill Ooll XOF_init_ll XOF_next_ll Parse_ll Asgll Ascll.
have <- : Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,KyberS(G,KSampler(XOF),KPRF),As,O).main() @ &m : res]= 
          Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,Kyber(G,XOF,KPRF),As,O).main() @ &m : res];
  last first.
+ apply (security_any_sampler O (KSampler(XOF)) As &m Oill Ooll  _ _ Asgll Ascll).
  + by move => O O_ll; apply (KSamplerA_ll XOF O O_ll XOF_init_ll XOF_next_ll Parse_ll).
  by move => O O_ll; apply (KSamplerAT_ll XOF O O_ll XOF_init_ll XOF_next_ll Parse_ll).
byequiv => //.
proc; inline {1} 2; inline {2} 2.
wp; call(_: ={glob O, glob XOF}); 1: by sim.
call (enc_sampler_enc O XOF).
rnd.
wp; call(_: ={glob O, glob XOF}); 1: by sim.
call (kg_sampler_kg O XOF).
by call(_: true); auto => />. 
qed.

end section.

import MLWE_.SMP_vs_ROM_IND.

import MLWE_.MLWE_ROM.MLWE_vs_MLWE_ROM.
import MLWE_.MLWE_ROM.
import MLWE_.

(* This theorem yields security for any sampler that can be
   proved indifferentiable from the RO that samples uniform 
   matrices down to standard MLWE. *)

section.

module O = MLWE_.MLWE_ROM.RO_H.Lazy.LRO.
module OS =RO.Lazy.LRO.

declare module As <: KyberPKE.AdversaryRO {-O, -OS, -KPRF, -B1ROM, -B2ROM, -B,-Bt, -BS, -D, -LazyEager.ERO}.
declare module S <: Sampler {-As, -B1ROM, -B2ROM, -OS, -O, -B,-Bt, -BS, -D, -LazyEager.ERO}.
declare module Sim <: Simulator_t {-S,-As,-B1ROM, -B2ROM, -OS, -O, -B,-Bt, -BS, -D, -LazyEager.ERO}.

lemma security_any_sampler_indiff &m :  
  (forall (x : RO.in_t), is_lossless (RO.dout x)) => 
  (forall (O <: RO.Oracle), islossless O.o => islossless S(O).sampleA) =>
  (forall (O <: RO.Oracle), islossless O.o => islossless S(O).sampleAT) =>
  (forall (O <: RO.Oracle), islossless O.o => islossless As(O).guess) =>
  (forall (O <: RO.Oracle), islossless O.o => islossless As(O).choose) =>

  (forall tr b (D0 <: Distinguisher_t {-S,-Sim,-O,-OS}),
     Pr[ WIndfReal(D0,S,OS).main(tr,b) @ &m : res] = 
     Pr[ WIndfIdeal(D0,Sim,O).main(tr,b) @ &m : res]) =>

  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,KyberS(G,S,KPRF),As,OS).main() @ &m : res] - 1%r/2%r = 
    Pr[MLWE(B(BS(B1ROM(As,S),Sim),RO_H.Lazy.LRO)).main(false) @ &m : res] -
       Pr[MLWE(B(BS(B1ROM(As,S),Sim),RO_H.Lazy.LRO)).main(true) @ &m : res] + 
    Pr[MLWE(Bt(BS(B2ROM(As,S),Sim),RO_H.Lazy.LRO)).main(false) @ &m : res]-
       Pr[MLWE(Bt(BS(B2ROM(As,S),Sim),RO_H.Lazy.LRO)).main(true) @ &m : res].
move => H H0 H1 H2 H3 H4.
have  <- : 
    Pr[ PKE_.CPAGameROM(PKE_.CPA,MLWE_PKE(S(OS)),As,OS).main() @ &m : res] =
    Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,KyberS(G,S,KPRF),As,OS).main() @ &m : res]; 
     last by apply (main_theorem_ref As S Sim &m  H H0 H1 H2 H3 H4).
byequiv => //.
proc.
inline {1} 2.
inline {2} 2.
wp;call(_: ={glob OS}); 1: by sim.
call(_: ={glob S, glob OS}).
(* ENCRYPTION IS EQUIVALENT: Write aux lemma.  *)
+ inline {2} 2.
  wp;ecall{2}(sem_encode4 (compress_poly 4 v{2})).
  wp;ecall{2}(sem_encode10_vec (compress_polyvec 10 u{2})).
  wp;ecall{2}(sem_decode1 (m0{2})).
  swap {1} 5 -3. 
  wp;conseq />; 1:by smt().
  admit. (* Hugo: follows from PRF hop and product of distributions,
                  plus ntt properties *)

rnd;call(_: ={glob OS}); 1: by sim.
conseq />; 1: by smt().

(* KEYGEN IS EQUIVALENT: Write aux lemma.  *)
call(_: ={glob S, glob OS}).
inline {2} 2. 
wp;ecall{2}(sem_encode12_vec (toipolyvec s0{2})).
wp;ecall{2}(sem_encode12_vec (toipolyvec t{2})).
swap {1} 4 -2. 
inline {2} 7.
swap {2} [7..9] -4. 
swap {2} 11 -5. 
wp; conseq => />.

admit. (* Hugo: follows from PRF hop, entropy smoothing of SHA3_SMOOTH 
                and product of distributions, plus ntt properties *)

by inline *; conseq => />; sim.

qed.

end section.

(* The following theorem is the strongest claim we can make
   about the Kyber Spec. It comes with two assumptions on the
   matrix sampling procedure:
   1) that it converges (losslessness of Parse)
      there is some hope of proving this when XOF is a ROM.
   2) that it is indifferentiable (explainable) wrt to the
      random oracle that simply samples uniform matrices.
      this basically means that there must exist a simulator
      that can produce a plausible XOF output for any 
      given Matrix. Easy to claim in paper when XOF is a ROM: 
      just rejection-sample a different matrix and program 
      the coefficients with the ones you want to explain. 
      No clue how to prove this in EC though.
      But note that, in this case we get security down
      to MLWE. *)

section.

declare module As <: KyberPKE.AdversaryRO {-O, -OS, -KPRF, -B1ROM, -B2ROM, -B,-Bt, -BS, -D, -LazyEager.ERO}.
declare module XOF <: XOF_t {-As, -B1ROM, -B2ROM, -OS, -O, -B,-Bt, -BS, -D, -LazyEager.ERO}.
declare module Sim <: Simulator_t {-XOF,-As,-B1ROM, -B2ROM, -OS, -O, -B,-Bt, -BS, -D, -LazyEager.ERO}.

lemma security_spec_indiff &m :  
  (forall (x : RO.in_t), is_lossless (RO.dout x)) => 

  (forall (O0 <: RO.POracle), islossless O0.o => islossless XOF(O0).init) =>
  (forall (O0 <: RO.POracle), islossless O0.o => islossless XOF(O0).next_bytes) =>

   (forall (O0 <: RO.POracle) (XOF0 <: XOF_t), 
         islossless O0.o => 
         islossless XOF0(O0).next_bytes => 
         islossless Parse(XOF0,O0).sample) =>

  (forall (O0 <: RO.Oracle), islossless O0.o => islossless As(O0).guess) =>
  (forall (O0 <: RO.Oracle), islossless O0.o => islossless As(O0).choose) =>

  (forall tr b (D0 <: Distinguisher_t {-KSampler(XOF),-Sim,-O,-OS}),
     Pr[ WIndfReal(D0,KSampler(XOF),OS).main(tr,b) @ &m : res] = 
     Pr[ WIndfIdeal(D0,Sim,O).main(tr,b) @ &m : res]) =>


  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,Kyber(G,XOF,KPRF),As,OS).main() @ &m : res] - 1%r/2%r = 
    Pr[MLWE(B(BS(B1ROM(As,KSampler(XOF)),Sim),RO_H.Lazy.LRO)).main(false) @ &m : res] -
       Pr[MLWE(B(BS(B1ROM(As,KSampler(XOF)),Sim),RO_H.Lazy.LRO)).main(true) @ &m : res] + 
    Pr[MLWE(Bt(BS(B2ROM(As,KSampler(XOF)),Sim),RO_H.Lazy.LRO)).main(false) @ &m : res]-
       Pr[MLWE(Bt(BS(B2ROM(As,KSampler(XOF)),Sim),RO_H.Lazy.LRO)).main(true) @ &m : res].

move => Oill XOF_init_ll XOF_next_ll Parse_ll Asgll Ascll ind.
have <- : Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,KyberS(G,KSampler(XOF),KPRF),As,OS).main() @ &m : res]= 
          Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,Kyber(G,XOF,KPRF),As,OS).main() @ &m : res];
  last first.
+ apply (security_any_sampler_indiff  As (KSampler(XOF)) Sim  &m Oill _ _ Asgll Ascll ind).
  + by move => O O_ll; apply (KSamplerA_ll XOF O O_ll XOF_init_ll XOF_next_ll Parse_ll).
  by move => O O_ll; apply (KSamplerAT_ll XOF O O_ll XOF_init_ll XOF_next_ll Parse_ll).
byequiv => //.
proc; inline {1} 2; inline {2} 2.
wp; call(_: ={glob OS, glob XOF}); 1: by sim.
call (enc_sampler_enc OS XOF).
rnd.
wp; call(_: ={glob OS, glob XOF}); 1: by sim.
call (kg_sampler_kg OS XOF).
by inline *; auto.
qed.

end section.

(* The correctness bounds can only be computed when matrices are
   uniform, so we jump directly to results where one can assume
   that the sampler is indifferentiable from the nice RO *)

section.

declare module A <: CAdversaryRO {-O,-OS}.
declare module S <: Sampler {-A,-O,-OS}.
declare module Sim <: Simulator_t {-S, -A,-O,-OS}.


lemma correctness_any_sampler &m epsilon_hack fail_prob :
  (forall (O <: RO_H.POracle), islossless O.o => islossless Sim(O).o) =>
  (forall (O <: RO.POracle), islossless O.o => islossless A(O).find) =>

  (forall trb (D0 <: Distinguisher_t {-S,-Sim,-SMP_vs_ROM_IND.O,-SMP_vs_ROM_IND.OS}),
     Pr[ WIndfReal(D0,S,OS).main(trb) @ &m : res] = 
     Pr[ WIndfIdeal(D0,Sim,O).main(trb) @ &m : res]) =>

(* This jump is assumed to introduce no slack in the
   Kyber proposal. 
   We need to figure out how to bound it. *)
  `| Pr[CorrectnessNoiseApprox.main() @ &m : res] - 
     Pr[CorrectnessBound.main() @ &m : res] | <= epsilon_hack =>
(* The following failure probability can be bounded as
in the Python script for Kyber *)   
  Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob =>
  Pr[ KyberPKE.CorrectnessAdvROM(KyberS(G,S,KPRF),A,OS).main() @ &m : res]  >=
  1%r - fail_prob - epsilon_hack.
move => Sim_ll A_ll ind eh nb.
have <- : 
Pr[PKE_.CGameROM(PKE_.CorrectnessAdv, MLWE_PKE(S(RO.Lazy.LRO)), A, RO.Lazy.LRO).main() @ &m : res] = 
Pr[CorrectnessAdvROM(KyberS(G, S, KPRF), A, OS).main() @ &m : res]; 
   last by apply (correctness_bound A S Sim &m epsilon_hack fail_prob Sim_ll A_ll ind eh nb).
byequiv => //.
proc.
inline {1} 2; inline {2} 2.
wp;call(_: ={glob S, glob OS}).
(* Decryption is EQUIVALENT: Write Aux Lemma *)
+ wp;ecall{2}(sem_encode1 (compress_poly 1 mp{2})).
  wp;ecall{2}(sem_decode12_vec (sk{2})).
  wp;ecall{2}(sem_decode4 (c2{2})).
  wp;ecall{2}(sem_decode10_vec (c1{2})).
  auto => /> *. 
  rewrite /m_decode /c_decode; congr; congr => /=; congr.
  admit. (* Hugo : bring in ntt properties *)

call(_: ={glob S, glob OS}).
(* ENCRYPTION IS EQUIVALENT: Write aux lemma.  *)
+ inline {2} 2.
  wp;ecall{2}(sem_encode4 (compress_poly 4 v{2})).
  wp;ecall{2}(sem_encode10_vec (compress_polyvec 10 u{2})).
  wp;ecall{2}(sem_decode1 (m0{2})).
  swap {1} 5 -3. 
  wp;conseq />; 1:by smt().
  admit. (* Hugo: follows from PRF hop and product of distributions,
                  plus ntt properties *)

call(_: ={glob OS}); 1: by sim.

(* KEYGEN IS EQUIVALENT: Write aux lemma.  *)
call(_: ={glob S, glob OS}).
inline {2} 2. 
wp;ecall{2}(sem_encode12_vec (toipolyvec s0{2})).
wp;ecall{2}(sem_encode12_vec (toipolyvec t{2})).
swap {1} 4 -2. 
inline {2} 7.
swap {2} [7..9] -4. 
swap {2} 11 -5. 
wp; conseq => />.

admit. (* Hugo: follows from PRF hop, entropy smoothing of SHA3_SMOOTH 
                and product of distributions, plus ntt properties *)

by inline *; conseq => />;  auto => />.
qed. 

end section.

(* For the full spec we ge the following result, which does 
   not require losslessness, but does require indifferentiability. *)

section.

declare module A <: CAdversaryRO {-O,-OS}.
declare module XOF <: XOF_t {-A,-O,-OS}.
declare module Sim <: Simulator_t {-XOF, -A,-O,-OS}.


lemma correctness_spec &m epsilon_hack fail_prob :
  (forall (O <: RO_H.POracle), islossless O.o => islossless Sim(O).o) =>
  (forall (O <: RO.POracle), islossless O.o => islossless A(O).find) =>

  (forall trb (D0 <: Distinguisher_t {-KSampler(XOF),-Sim,-SMP_vs_ROM_IND.O,-SMP_vs_ROM_IND.OS}),
     Pr[ WIndfReal(D0,KSampler(XOF),OS).main(trb) @ &m : res] = 
     Pr[ WIndfIdeal(D0,Sim,O).main(trb) @ &m : res]) =>

(* This jump is assumed to introduce no slack in the
   Kyber proposal. 
   We need to figure out how to bound it. *)
  `| Pr[CorrectnessNoiseApprox.main() @ &m : res] - 
     Pr[CorrectnessBound.main() @ &m : res] | <= epsilon_hack =>
(* The following failure probability can be bounded as
in the Python script for Kyber *)   
  Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob =>
  Pr[ KyberPKE.CorrectnessAdvROM(Kyber(G,XOF,KPRF),A,OS).main() @ &m : res]  >=
  1%r - fail_prob - epsilon_hack.
move => Sim_ll A_ll ind eh fp.
have <-: Pr[CorrectnessAdvROM(KyberS(G, KSampler(XOF), KPRF), A, OS).main() @ &m : res] = 
         Pr[CorrectnessAdvROM(Kyber(G, XOF, KPRF), A, OS).main() @ &m : res];
  last by apply (correctness_any_sampler A (KSampler(XOF)) Sim &m).
byequiv => //.
proc. 
inline {1} 2; inline {2} 2.
wp; call(_: ={glob OS, glob XOF}); 1: by sim.
call (enc_sampler_enc OS XOF).
wp; call(_: ={glob OS}); 1: by sim.
call (kg_sampler_kg OS XOF).
by inline *; auto.
qed.

end section.

end SpecProperties.


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
