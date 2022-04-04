(**********************************)
(**********************************)
(**********************************)
(* The following lofts are needed
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

require (***) MLWE_PKE.

theory SpecProperties.

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

clone import MLWE_PKE as MLWEPKE with 
  type MLWE_.RO.in_t = W8.t Array32.t * W8.t * W8.t * int,
  type MLWE_.RO.out_t = W8.t Array168.t,
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
  op c_decode <- c_decode  (*,
  op rnd_err_v <- rnd_err_v,
  op rnd_err_u <- rnd_err_u,
  op under_noise_bound <- under_noise_bound,
  op max_noise <- max_noise,
  op cv_bound <- cv_bound,
  op fail_prob <- fail_prob,
  op epsilon_hack <- epsilon_hack *)
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
(*
  proof encode_noise
  proof good_decode
  proof cv_bound_valid
  proof noise_commutes
  proof correctness_hack
  proof fail_prob *).

realize pk_decodeK.
admitted.

realize pk_encodeK.
admitted.

realize sk_decodeK.
admitted.

realize sk_encodeK.
admitted.


(*
realize encode_noise.
move => /> u v.
rewrite /c_decode /c_encode /rnd_err_u /rnd_err_v /= sem_encode10_vecK sem_encode4K => />.
split; last  by rewrite round_poly_errE.
rewrite /(+) /mapv /=.
apply eq_vectorP => /> i il ih; rewrite !offunvE 1,2:/# /=.
rewrite MLWE_.Matrix_.Vector.offunvE 1:/# /= /compress_poly_err /=.
apply Array256.tP => k kb.
rewrite /compress_polyvec /= /fromarray256 /= /Poly.(&+) /=.
rewrite mapiE // map2E //= initiE //= initiE //= mapiE //= 1:/# initiE 1:/# /=. 
rewrite decompress_errE //; 1: smt(qE).
by rewrite mapiE /#.
qed.

realize good_decode. 
rewrite /under_noise_bound /m_encode /m_decode /compress_poly /decompress_poly  => m n hgood.
have : sem_decode1 (sem_encode1 (map (compress 1) (map (decompress 1) (sem_decode1 m) &+ n))) = (sem_decode1 m); last by smt(sem_decode1K).
apply Array256.ext_eq => /> x h0x hx256. 
rewrite sem_encode1K /(&+) mapiE 1:/# map2E /= initiE /= 1:/# mapiE 1:/#.
rewrite b_decode_sem /b_decode /= -decompress_alt_decompress // /decompress_alt /= qE /=.
rewrite /as_sint => />.
rewrite Zq.addE  qE inFqK qE => />.
admitted. (* what's going on *)

realize cv_bound_valid.
admitted. (* Rounding upper bound for one coefficient: compute in EC? *)

realize noise_commutes.
move => n n' b H H0.
move : H H0; rewrite /under_noise_bound.
rewrite !allP.
move => Hn Hnp i ib.
move : (Hn i ib). 
move : (Hnp i ib) => /=. 
rewrite /as_sint /Poly.(&+) /= map2E !initiE //= addE qE /=  !StdOrder.IntOrder.ltr_norml /= => Hni Hnpi.
by smt().
qed.

realize correctness_hack.
admitted. (* assumption: no one knows what this bound is *)


realize fail_prob.
move => &m;byphoare.
proc.
auto => />.
rewrite /comp_distr /noise_exp_final /noise_exp_part /rdistr.
rewrite /good_noise /cv_bound /noise_val.
admitted. (* Probability of failure event in distribution: compute in EC? *)

*)
(* We now specify the various components used by Kyber in the ROM *)


module (G : G_t) (O : RO.POracle) = {
   proc sample(seed : W8.t Array32.t) : (W8.t Array32.t) *  (W8.t Array32.t) = {
        var rho, sig : W8.t Array32.t;
        rho <$ srand;
        sig <$ srand;
        return (rho,sig);
   }
}.

module (XOF :  XOF_t) (O : RO.POracle) = {
   var _rho : W8.t Array32.t
   var _i, _j : W8.t
   var count : int

   proc init(rho :  W8.t Array32.t, i j : W8.t ) : unit = {
      _rho <- rho;
      _i <- i;
      _j <- j;
      count <- 0;
   }
   proc next_bytes() : W8.t Array168.t = {
        var bb;
        bb <@ O.o(_rho,_i,_j,count);
        return bb;
   }
}.

require  PRF.

clone import PRF as PRF_DEFS with
  type D <- W8.t,
  type R <- W8.t Array128.t,
  type PseudoRF.K <- W8.t Array32.t, 
  op PseudoRF.dK <- srand.

clone import PseudoRF.

module (PRF : PRF_t) (O : RO.POracle) = {
   var _sig : W8.t Array32.t

   proc init(sig : W8.t Array32.t) : unit = {
       _sig <- sig;
   }
   proc next_bytes(_N : W8.t) : W8.t Array128.t = {
        var bb;
        bb <- F _sig _N;
        return bb;
   }
}.

(* These modules are reductions. They just encode/decode things coming from the
   refined game to the scheme adversary.  *)

module (S : MLWE_.Sampler) (O : MLWE_.RO.POracle)  = {
    proc sample(sd : W8.t Array32.t) : matrix = { 
     var i,j,c;
     var a : matrix;
     a <- witness;
     i <- 0;
     while (i < kvec) {
        j <- 0;
        while (j < kvec) {
           XOF(O).init(sd,W8.of_int j,W8.of_int i);
           c <@ Parse(XOF,O).sample_real();
           a.[(i,j)] <- c;
           j <- j + 1;
        }
        i <- i + 1;
     }
     return a;      
    }
}.

(***************************************)

section.

declare module As <: KyberPKE.AdversaryRO {-MLWE_.RO.Lazy.LRO,-RO.Lazy.LRO, -XOF, -PRF}.

lemma wrap_equiv_security &m :  
  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,MLWE_PKE(S(KyberPKE.RO.Lazy.LRO)),As,KyberPKE.RO.Lazy.LRO).main() @ &m : res] =
  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,Kyber(G,XOF,PRF),As,KyberPKE.RO.Lazy.LRO).main() @ &m : res].
byequiv => //.
proc.
inline {1} 2.
inline {2} 2.
wp;call(_: ={glob RO.Lazy.LRO}); 1: by sim.
call(_: ={glob G, glob XOF, glob PRF, glob RO.Lazy.LRO}).
+ inline {2} 2.
  wp;ecall{2}(sem_encode4 (compress_poly 4 v{2})).
admitted. (* wrapped abstract spec equiv to spec: security *)

(* 
lemma KyberSecurity &m :
  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,Kyber(G,XOF,PRF),As,KyberPKE.RO.Lazy.LRO).main() @ &m : res] - 1%r / 2%r =
      Pr[MLWE_.MLWE(MLWE_.B(B1ROM(Bs(As)), MLWE_.RO.Lazy.LRO)).main(false) @ &m : res] -
      Pr[MLWE_.MLWE(MLWE_.B(B1ROM(Bs(As)), MLWE_.RO.Lazy.LRO)).main(true) @ &m : res] +
      Pr[MLWE_.MLWE(MLWE_.Bt(B2ROM(Bs(As)), MLWE_.RO.Lazy.LRO)).main(false) @ &m : res] -
      Pr[MLWE_.MLWE(MLWE_.Bt(B2ROM(Bs(As)), MLWE_.RO.Lazy.LRO)).main(true) @ &m : res].
rewrite -wrap_equiv_security.
rewrite (wrap_security &m).
apply (main_theorem_h (Bs(As))). 
admit. (* lossless *)
admit. (* lossless *)
qed.

*)
end section.


end SpecProperties.
