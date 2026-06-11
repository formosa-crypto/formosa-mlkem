require import AllCore  IntDiv Distr List DList KEM_ROM.

from Jasmin require import JWord.
from JazzEC require import Array25 Array32 Array33 Array64 Array128 Array168 Array256 Array384.
from JazzEC require import Array768 Array960 Array1024 Array1152.

from Spec require import GFq Rq Parameters VecMat Sampling Symmetric Serialization.
from Spec require import KPKE MLKEM Correctness EncDecCorrectness MLKEMLib.

require import MLWE_PKE_Hash.
import Zq MLKEMParams VecMat PolyVec PolyMat Symmetric Serialization KPKE.

(* ML-KEM security/correctness proof, parametric over the variant: it holds for
   every (kvec,du,dv,eta1,eta2) admitted by param_sets (both 768 and 1024).  The
   only variant facts the proof needs are the param_sets-derived bounds below. *)
lemma kvec_le4 : kvec <= 4 by smt(param_sets).
lemma dv_vals  : dv = 4 \/ dv = 5 by smt(param_sets).

(* Rewriting the Spec in a way that allows applying computational
   assumptions on PRGs, as well as defining operators that
   can be used to instantiate the FO_MLKEM theory *)

(*****************************************************
We define a version of MLKEM spec that
uses external samplers. This is useful for 
syntactic reasons in the following proof
steps.
******************************************************)


(* Distributions that we need for reasoning about PRGs, PRFs and ROs *)
abbrev srand = darray32 W8.dword.

lemma srand_ll: is_lossless srand by smt(darray32_ll W8.dword_ll).

lemma srand_fu : is_full srand.
rewrite /darray32 /is_full => x. 
rewrite supp_dmap.
exists (to_list x).
rewrite to_listK /=.
rewrite supp_dlist 1:/# size_to_list /= allP => *. 
by rewrite dword_fu.
qed.

lemma srand_uni : is_uniform srand. 
rewrite /darray32.
apply dmap_uni_in_inj => x y xin yin;
1: by smt(supp_dlist_size Array32.of_listK).
have sizex : size x = 32 by have := supp_dlist_size W8.dword 32 =>/= /#.
have sizey : size y = 32 by have := supp_dlist_size W8.dword 32 =>/= /#.
rewrite !dlist1E // sizex /= sizey /=.
have -> : (fun (x0 : W8.t) => mu1 W8.dword x0) = fun _ =>  inv W8.modulus%r.
+ apply fun_ext => w.
   by rewrite !dword1E.
by rewrite !StdBigop.Bigreal.BRM.big_const !count_predT sizex sizey.  
qed.

abbrev dRO = darray32 W8.dword `*` darray32 W8.dword.

lemma dRO_ll: is_lossless dRO
  by apply dprod_ll;split;apply darray32_ll;apply W8.dword_ll.

abbrev dnbytes = darray128 W8.dword.

lemma dnbytes_ll: is_lossless dnbytes.
proof.
apply darray128_ll.
by apply W8.dword_ll.
qed.

(* G is a PRG *)

op G_coins768(s : W8.t Array32.t) : W8.t Array32.t * W8.t Array32.t =
    G_coins (Array33.init (fun (i2 : int) => if i2 < 32 then s.[i2] else W8.of_int kvec)).

require FLPRG PRF. 
clone FLPRG as HS_DEFS with
  type seed <- W8.t Array32.t, 
  type output <- W8.t Array32.t * W8.t Array32.t,
  op dseed <- srand,
  op dout <- dRO,
  op prg <- G_coins768
  proof *.


(* PRF is a PRF *)

clone PRF as PRF_DEFS with
  type D <- W8.t,
  type R <- W8.t Array128.t
  proof *.

clone import PRF_DEFS.PseudoRF as NPRF with
  type K <- W8.t Array32.t, 
  op dK <- srand,
  op F <- Symmetric.PRF
  proof dK_ll by apply srand_ll
  proof *.

clone import PRF_DEFS.RF as NRF with
    op dR = fun (_: W8.t) => dnbytes
    proof dR_ll by smt(dnbytes_ll)
    proof*.


module CBD2_PRF(PRF : PRF_DEFS.PRF_Oracles) = {
   proc sample(_N : int) : poly = {
    var i : int;
    var j : int;
    var a : int;
    var b : int;
    var rr : poly;
    var bytes;
    
    rr <- witness;
     bytes <@ PRF.f(W8.of_int _N);

    i <- 0;
    j <- 0;
    while (i < 128){
      a <- b2i bytes.[i].[j %% 2 * 4 + 0] + b2i bytes.[i].[j %% 2 * 4 + 1];
      b <- b2i bytes.[i].[j %% 2 * 4 + 2] + b2i bytes.[i].[j %% 2 * 4 + 3];
      rr.[j] <- incoeff (a - b);
      j <- j + 1;
      a <- b2i bytes.[i].[j %% 2 * 4 + 0] + b2i bytes.[i].[j %% 2 * 4 + 1];
      b <- b2i bytes.[i].[j %% 2 * 4 + 2] + b2i bytes.[i].[j %% 2 * 4 + 3];
      rr.[j] <- incoeff (a - b);
      j <- j + 1;
      i <- i + 1;
    }
    
    return rr;
   }

   proc sample_spec(_N : int) : poly = {
      var i,a,b,bytes,bits;
      var rr : poly;
      rr <- witness;
      bytes <@ PRF.f(W8.of_int _N);
      bits <- BytesToBits (to_list bytes);
      i <- 0;
      while (i < 256) { 
        a <- b2i (nth false bits (4*i)) + b2i (nth false bits (4*i+1));
        b <- b2i (nth false bits (4*i+2)) + b2i (nth false bits (4*i+3));
        rr.[i] <- incoeff  (a - b);
        i <- i + 1;
      }
      return rr;

   }
}.

equiv cbd_correct : 
  CBD2_PRF(NPRF.PRF).sample ~ SamplePolyCBD.sample :
  arg{2} = SHAKE256_33_128 NPRF.PRF.k{1} (W8.of_int arg{1}) ==> ={res}
by proc => /=;inline *;sim;auto.

equiv cbdspec_correct (PRF <: PRF_DEFS.PRF_Oracles): 
  CBD2_PRF(PRF).sample_spec ~ CBD2_PRF(PRF).sample :  ={arg,glob PRF} ==> ={res}.
proc => /=. 
seq 2 2 : (#pre /\ ={rr,bytes}); 1:by call(_: true);auto => />.
swap {2}1 1.
unroll for {1} ^while;
unroll for {2} ^while;
sim; auto =>/> &2;
have H : forall i, 0<=i<1024 => (nth false (BytesToBits (to_list bytes{2})) i) = 
                   bytes{2}.[i%/8].[i%%8]; last by rewrite !H //=.
move => i Hi. 
rewrite /BytesToBits (BitEncoding.BitChunking.nth_flatten false 8 (map W8.w2bits (to_list bytes{2})) _).
+ rewrite allP => k /=.
  rewrite mapP=> [[x [Hx1 ->]]].
  by rewrite W8.size_w2bits.  
rewrite -get_to_list (nth_map  witness%W8); 1: smt(Array128.size_to_list).
rewrite w2bitsE /= nth_mkseq /#.
qed.

lemma cbd2prfsem _k _N :
   phoare [ CBD2_PRF(NPRF.PRF).sample : NPRF.PRF.k = _k /\ arg = _N ==>
        res = samplePolyCBD (SHAKE256_33_128 _k (W8.of_int _N)) ] = 1%r.
bypr => &m0 [#] kv ->.
have /=  <- := samplePolyCBD_opsem &m0 (samplePolyCBD (SHAKE256_33_128 _k (W8.of_int _N))) (SHAKE256_33_128 _k (W8.of_int _N)).
by  byequiv (cbd_correct) => /#.
qed.

import PolyVec PolyMat.

module MLKEM_PRGs = {
  proc prg_kg(coins:W8.t Array32.t) : W8.t Array32.t * polyvec * polyvec = {
    var noise1 : polyvec;
    var noise2 : polyvec;
    var _N,i,c,rho,noiseseed;
    (rho, noiseseed) <- G_coins768 coins;
    NPRF.PRF.k <- noiseseed;
    noise1 <- witness;                     
    noise2 <- witness;                      
    _N <- 0;                      
    i <- 0;                             
    while (i < kvec) {                 
      c <@ CBD2_PRF(NPRF.PRF).sample(_N);
      noise1 <- noise1.[i<-c];                   
      _N <- _N + 1;                     
     i <- i + 1;                       
    }                                  
    i <- 0;                             
    while (i < kvec) {                 
      c <@ CBD2_PRF(NPRF.PRF).sample(_N);
      noise2 <- noise2.[i<-c];                  
      _N <- _N + 1;                     
      i <- i + 1;                       
    }                                  

    return (rho,noise1,noise2);
  }

   proc prg_enc(noiseseed:W8.t Array32.t) : polyvec * polyvec * poly = {
    var noise1 : polyvec;
    var noise2 : polyvec;
     var e2,_N,i,c;
     noise1 <- witness;                     
     noise2 <- witness;   
     NPRF.PRF.k <- noiseseed;                   
     _N <- 0;                      
     i <- 0;                             
     while (i < kvec) {                 
       c <@ CBD2_PRF(NPRF.PRF).sample(_N);
       noise1 <- noise1.[i<-c];                   
       _N <- _N + 1;                     
      i <- i + 1;                       
     }                                  
     i <- 0;                             
     while (i < kvec) {                 
       c <@ CBD2_PRF(NPRF.PRF).sample(_N);
      noise2 <- noise2.[i<-c];                   
      _N <- _N + 1;                     
      i <- i + 1;                       
     }                                  
     e2 <@ CBD2_PRF(NPRF.PRF).sample(_N);
     return (noise1,noise2, e2);
  }

}.

(* Security-world view of the spec PRGs: same computation, outputs lifted to
   the algebraic vector the PRG distinguisher games (PRG_KG/PRG_ENC) speak. *)
module MLKEM_PRGs_alg = {
  proc prg_kg(coins : W8.t Array32.t) : W8.t Array32.t * KMatrix.vector * KMatrix.vector = {
    var r;
    r <@ MLKEM_PRGs.prg_kg(coins);
    return (r.`1, poly2alg r.`2, poly2alg r.`3);
  }
  proc prg_enc(noiseseed : W8.t Array32.t) : KMatrix.vector * KMatrix.vector * poly = {
    var r;
    r <@ MLKEM_PRGs.prg_enc(noiseseed);
    return (poly2alg r.`1, poly2alg r.`2, r.`3);
  }
}.

op H(rho : W8.t Array32.t) : polymat = invnttm (sampleA rho).

(* This fixes the definition of H in terms of the MLKEM spec *)
lemma H_sem _seed :
    phoare [ Hmodule.sampleA : sd = _seed ==> res = nttm (H _seed) ] = 1%r.
proof. 
proc*; call (sampleA_sem _seed).
by auto => />; rewrite /H nttmK.
qed.

op prg_kg_inner(coins :  W8.t Array32.t) : W8.t Array32.t * polyvec * polyvec =
   ((G_coins768 coins).`1, 
    KVec.init (fun i => samplePolyCBD (Symmetric.PRF (G_coins768 coins).`2 (W8.of_int i))),
    KVec.init (fun i => samplePolyCBD (Symmetric.PRF (G_coins768 coins).`2 (W8.of_int (i + kvec))))).

op prg_enc_inner(coins :  W8.t Array32.t) : polyvec * polyvec * poly =
   (KVec.init (fun i => samplePolyCBD (Symmetric.PRF coins (W8.of_int i))),
    KVec.init (fun i => samplePolyCBD (Symmetric.PRF coins (W8.of_int (i + kvec)))),
    samplePolyCBD (Symmetric.PRF coins (W8.of_int (2 * kvec)))).

lemma prg_kg_sem _coins : 
   phoare [ MLKEM_PRGs.prg_kg : coins = _coins ==> res = prg_kg_inner _coins ] = 1%r.
proc; sp.
while (0 <= i <= kvec /\ _N = i + kvec /\ rho = (G_coins768 _coins).`1 /\
       NPRF.PRF.k = (G_coins768 _coins).`2 /\ noise1 = (prg_kg_inner _coins).`2 /\
       (forall ii, 0 <= ii < i =>
          noise2.[ii] = samplePolyCBD (SHAKE256_33_128 ((G_coins768 _coins).`2) (W8.of_int (ii + kvec)))))
      (kvec - i).
+ move => z; wp; ecall (cbd2prfsem NPRF.PRF.k _N).
  auto => />; smt(KVec.get_setE gt0_k).
wp.
while (0 <= i <= kvec /\ _N = i /\ rho = (G_coins768 _coins).`1 /\
       NPRF.PRF.k = (G_coins768 _coins).`2 /\ noise2 = witness /\
       (forall ii, 0 <= ii < i =>
          noise1.[ii] = samplePolyCBD (SHAKE256_33_128 ((G_coins768 _coins).`2) (W8.of_int ii))))
      (kvec - i).
+ move => z; wp; ecall (cbd2prfsem NPRF.PRF.k _N).
  auto => />; smt(KVec.get_setE gt0_k).
auto => />.
split; first by smt(gt0_k).
move => i0 n10.
split; first by smt(gt0_k).
move => hex h0 h0l hrho hsig Hn10.
have Hn10v : n10 = (prg_kg_inner _coins).`2.
+ rewrite /prg_kg_inner /=; apply KVec.ext_eq => k hk.
  by rewrite KVec.initiE 1:hk /= /PRF; smt().
split; first by smt(gt0_k).
move => i1 n20.
split; first by smt(gt0_k).
move => hex2 h1 h1l hn10eq Hn20.
have Hn20v : n20 = (prg_kg_inner _coins).`3.
+ rewrite /prg_kg_inner /=; apply KVec.ext_eq => k hk.
  by rewrite KVec.initiE 1:hk /= /PRF; smt(kvec_le4).
by rewrite Hn20v /prg_kg_inner /=; smt().
qed.

lemma prg_enc_sem _coins : 
   phoare [ MLKEM_PRGs.prg_enc : noiseseed = _coins ==> res = prg_enc_inner _coins ] = 1%r.
proc; sp.
ecall (cbd2prfsem NPRF.PRF.k _N).
while (0 <= i <= kvec /\ _N = i + kvec /\ NPRF.PRF.k = _coins /\
       noise1 = (prg_enc_inner _coins).`1 /\
       (forall ii, 0 <= ii < i =>
          noise2.[ii] = samplePolyCBD (SHAKE256_33_128 _coins (W8.of_int (ii + kvec)))))
      (kvec - i).
+ move => z; wp; ecall (cbd2prfsem NPRF.PRF.k _N).
  auto => />; smt(KVec.get_setE gt0_k).
wp.
while (0 <= i <= kvec /\ _N = i /\ NPRF.PRF.k = _coins /\ noise2 = witness /\
       (forall ii, 0 <= ii < i =>
          noise1.[ii] = samplePolyCBD (SHAKE256_33_128 _coins (W8.of_int ii))))
      (kvec - i).
+ move => z; wp; ecall (cbd2prfsem NPRF.PRF.k _N).
  auto => />; smt(KVec.get_setE gt0_k).
auto => />.
split; first by smt(gt0_k).
move => i0 n10.
split; first by smt(gt0_k).
move => hex h0 h0l Hn10.
have Hn10v : n10 = (prg_enc_inner _coins).`1.
+ rewrite /prg_enc_inner /=; apply KVec.ext_eq => k hk.
  by rewrite KVec.initiE 1:hk /= /PRF; smt().
split; first by smt(gt0_k).
move => i1 n20.
split; first by smt(gt0_k).
move => hex2 h1 h1l hn10eq Hn20.
have Hn20v : n20 = (prg_enc_inner _coins).`2.
+ rewrite /prg_enc_inner /=; apply KVec.ext_eq => k hk.
  by rewrite KVec.initiE 1:hk /= /PRF; smt(kvec_le4).
by rewrite Hn20v /prg_enc_inner /= /PRF; smt(kvec_le4).
(* losslessness of the two noise whiles (prefix of the trailing e2 call) *)
while (0 <= i <= kvec) (kvec - i).
+ move => z; wp; ecall (cbd2prfsem NPRF.PRF.k _N); auto => /> /#.
wp.
while (0 <= i <= kvec) (kvec - i).
+ move => z; wp; ecall (cbd2prfsem NPRF.PRF.k _N); auto => /> /#.
auto => />; smt(gt0_k).
qed.

import KMatrix.
lemma H_T_sem _seed :
    phoare [ Hmodule.sampleAT : sd = _seed ==> res = nttm (trmx (H _seed)) ] = 1%r.
conseq (H_sem_equiv)  (H_sem _seed); 1: smt().
auto => />.
apply eq_polymatP => i j Hi Hj.
by rewrite trmxE 1,2:/# nttmE 1,2:/# nttmE 1,2:/# trmxE 1,2:/#.
qed.

module InnerPKE_Op = {

  (* Spec gives a derandomized enc that matches this code *)
  proc kg_derand(coins: W8.t Array32.t) : pkey * skey = {
     var t,rho;
     var tv,sv : W8.t BytesPKVec.t;
     var a : polymat;
     var s,e : polyvec;
     e <- witness;
     s <- witness;
     sv <- witness;
     tv <- witness;
     (rho,s,e) <- prg_kg_inner coins;
     a <- nttm (H rho);     
     s <- nttv s;
     e <- nttv e; 
     t <- (ntt_mmul a s + e)%PolyVec;
     tv <- encode12_vec (toipolyvec t); 
     sv <- encode12_vec (toipolyvec s); 
     return ((tv,rho),sv);
  }

  (* Spec gives a derandomized enc that matches this code *)
  proc enc_derand(pk : pkey, m : plaintext, r : W8.t Array32.t) : ciphertext = {
      var tv,rho,rv,e1,e2,rhat,u,v,mp,c2,thati;
      var that : polyvec;
      var aT : polymat;
      var c1 : W8.t BytesCtVec.t;
      aT <- witness;
      c1 <- witness;
      e1 <- witness;
      rv <- witness;
      that <- witness;
      (rv,e1,e2) <- prg_enc_inner r;
      (tv,rho) <- pk;
      thati <- decode12_vec tv; 
      that <- ofipolyvec thati;
      aT <- nttm (trmx (H rho));    
      rhat <- nttv rv;
      u <- (invnttv (ntt_mmul aT rhat) + e1)%PolyVec;
      mp <- decode1 m;
      v <- invntt (ntt_dotp that rhat) &+ e2 &+ decompress_poly 1 mp; 
      c1 <- encode_vec (compress_polyvec du u);
      c2 <- encode_poly (compress_poly dv v);
      return (c1,c2);
  }

  proc dec(sk : skey, cph : ciphertext) : plaintext option = {
      var m,mp,ui,v,vi,si, c1, c2;
      var u,s : polyvec;
      u <- witness;
      s <- witness;
      (c1,c2) <- cph;
      ui <- decode_vec c1;
      u <- decompress_polyvec du ui;
      vi <- decode_poly c2;
      v <- decompress_poly dv vi;
      si <- decode12_vec sk;
      s <- ofipolyvec si;
      mp <- v &+ ((&-) (invntt (ntt_dotp s (nttv u))));
      m <- encode1 (compress_poly 1 mp);
      return Some m;
  }

}.

import KMatrix Vector.

(* get-after-set on the concrete polyvec is KVec.get_setE, used directly. *)

(* We have something equivalent to the spec *)
import Symmetric.


lemma kg_sampler_kg  :
  equiv [  InnerPKE_Op.kg_derand ~ KPKE.keygen : 
     ={arg}==> ={res}].
proc. 
wp 6 13. swap {2} 1 4.
seq 4 4 : #pre; 1: by auto.
transitivity{1} { a<-witness;(rho,s,e) <@ MLKEM_PRGs.prg_kg(coins); 
                   a <@ Hmodule.sampleA(rho); }
       ( ={coins} ==> ={rho,s,e,a})
       ( ={coins} ==> ={s, rho, e, a});1,2: smt(). 
+ ecall{2} (H_sem rho{2}).
  by ecall{2} (prg_kg_sem coins{2}); auto. 
inline {1} 2. 
case <- {1} 12. 
swap {1} 12 -7. swap {1} 15 -9. wp.
inline CBD2_PRF(NPRF.PRF).sample.
inline SamplePolyCBD.sample.
inline PseudoRF.f.
while (noise1{1} = s{2} /\ rho{1} = rho{2} /\ noiseseed{1} = sig{2} /\
       ={i,_N,a} /\ NPRF.PRF.k{1} = sig{2} /\
       0<=i{1}<=kvec /\ 
       forall k, 0 <=k < i{1} => (noise2{1}.[k]) = (e{2}.[k])).
+ wp; conseq(_: ={rr0}); 1: by smt(KVec.get_setE).  
  by inline*; sim; auto => />. 
wp;conseq (: noise1{1} = s{2} /\
             rho{1} = rho{2} /\
             NPRF.PRF.k{1} = sig{2} /\
             noiseseed{1} = sig{2} /\
             ={_N, a}).
+ move => &1 &2 /> *; split; first by smt(gt0_k).
  by move => *; apply KVec.ext_eq => k hk; smt().

while (rho{1} = rho{2} /\ noiseseed{1} = sig{2} /\
       ={i,_N,a} /\ NPRF.PRF.k{1} = sig{2} /\
       0<=i{1}<=kvec /\ 
       forall k, 0 <=k < i{1} => (noise1{1}.[k]) = (s{2}.[k])).
+ wp; conseq(_: ={rr}); 1: by smt(KVec.get_setE).  
  by inline*; sim; auto => />. 
inline {1} 6.
sp;wp;conseq  (: rho{1} = rho{2} /\ 
             noiseseed{1} = sig{2} /\
             a2{1} = a{2}).
+ move => &1 &2 /> *; split; first by smt(gt0_k).
  by move => *; apply KVec.ext_eq => k hk; smt().
while (#post /\ sd{1} = rho{1} /\ i2{1} = i{2} /\ 0<=i2{1}<=kvec); last by auto => />.
wp;while (#post /\ j1{1} = j{2} /\ 0<=j1{1}<=kvec); 
     last by auto => /> /#. 
inline {2} 1;sp 0 4.
exists * rho{2}, (W8.of_int i{2}), (W8.of_int j{2}).
         elim * => _rho _i _j.
  pose _st := (SHAKE128_ABSORB_34 _rho _j _i).
have parsesem := parse_sem _st _rho _j _i _;1: smt().
wp;call{2} parsesem. 
by inline *; auto => /> /#.
qed.

lemma enc_sampler_enc  :
 equiv [
   InnerPKE_Op.enc_derand ~ KPKE.encrypt : 
    ={arg}  ==> ={res}].
proc. 
wp 10 16. 
swap {1} [7..10] -1.  swap {2} [8..9] -1. swap {2} 1 7.
seq 8 7 : (={pk,m,c1,e1,rv,that,tv,rho,thati,that} /\ r{1} = coins{2});
   1: by auto.
transitivity{1} {  aT <@ Hmodule.sampleAT(rho);
                  (rv,e1,e2) <@ MLKEM_PRGs.prg_enc(r); 
                    }
       (={pk,m,c1,e1,rv,that,tv,rho,thati,that,r} ==> ={that, rv, m, e2, e1, aT})
      ( ={pk,m,c1,e1,rv,that,tv,rho,thati,that} /\ r{1} = coins{2}==> ={that, rv, m, e2, e1, aT});1,2: smt(). 
+ ecall{2} (prg_enc_sem r{2}).
  by ecall{2} (H_T_sem rho{2}); auto.

inline {1} 2. inline {1} 11. inline {2} 9. inline {1} 13. swap {2} 1 2.
wp;sim;wp;
conseq (: ={that,_N,m,aT} /\
  noise2{1} = e1{2} /\
  noise1{1} = rv{2} /\ NPRF.PRF.k{1} = coins{2} /\
  noiseseed{1} = coins{2});1: by smt().
while (={i, that, _N, m, aT} /\ noise1{1} = rv{2} /\ noiseseed{1} = coins{2} /\
       0<=i{1}<=kvec /\ NPRF.PRF.k{1} = coins{2} /\
       forall k, 0 <=k < i{1} => (noise2{1}.[k]) = (e1{2}.[k])).
+ inline *;wp;conseq(_: ={rr0}); 1: by smt(KVec.get_setE).  by inline*; sim; auto => />. 
wp;conseq (: ={that,_N,m,aT} /\
  noise1{1} = rv{2} /\ NPRF.PRF.k{1} = coins{2} /\
  noiseseed{1} = coins{2}).
+ move => &1 &2 /> *; split; first by smt(gt0_k).
  by move => *; apply KVec.ext_eq => k hk; smt().
while (={i, that, _N, m, aT} /\ noiseseed{1} = coins{2} /\
       0<=i{1}<=kvec /\ NPRF.PRF.k{1} = coins{2} /\
       forall k, 0 <=k < i{1} => (noise1{1}.[k]) = (rv{2}.[k])).
+ inline *;wp; conseq(_: ={rr0}); 1: by smt(KVec.get_setE).  
  by inline*; sim; auto => />. 
inline {1} 1.
sp;wp;conseq (: ={that, m} /\ a0{1} = aT{2} /\ r{1} = coins{2}).
+ move => &1 &2 /> *; split; first by smt(gt0_k).
  by move => *; apply KVec.ext_eq => k hk; smt().
while (#post /\ sd{1} = rho{2} /\  i1{1} = i{2} /\ r{1} = coins{2} /\ 0<=i1{1}<=kvec); last by auto => />. 

wp;while (#post /\ i1{1} = i{2} /\ j0{1} = j{2} /\ 0<=j0{1}<=kvec); 
     last by auto => /> /#.
inline {2} 1;sp 0 4.
exists * rho{2}, (W8.of_int i{2}), (W8.of_int j{2}).
         elim * => _rho _i _j.
  pose _st := (SHAKE128_ABSORB_34 _rho _i _j).
have parsesem := parse_sem _st _rho _i _j _;1: smt().
wp;call{2} parsesem. 
by inline *; auto => /> /#.
qed.

lemma dec_sampler_dec :
  equiv [ InnerPKE_Op.dec ~ KPKE.decrypt : 
     ={arg}  ==> res{1} = Some res{2} ].
proc. 
by auto => />.
qed.

(* NOW THE KEM MOVED TO THE ROM *)


clone import KEM_ROM as SPEC_MODEL with 
  type pkey <- publickey,
  type skey <- secretkey,
  type key <- sharedsecret,
  op dkey <- srand,
  type ciphertext <- ciphertext,
  type RO.in_t <- W8.t Array32.t * W8.t Array32.t,
  type RO.out_t <- W8.t Array32.t * W8.t Array32.t,
  op RO.dout <- fun _ => dRO
  proof dkey_ll by apply srand_ll
  proof dkey_fu by apply srand_fu
  proof dkey_uni by apply srand_uni
  proof *.
import RO.

module (MLKEM_Op : Scheme) (O : POracle) = {
  proc kg_derand(coins : W8.t Array32.t * W8.t Array32.t) : publickey * secretkey = {
    var kgs : W8.t Array32.t;
    var z : W8.t Array32.t;
    var pk : pkey;
    var sk : skey;
    var hpk : W8.t Array32.t;
    
    kgs <- coins.`1;
    z <- coins.`2;
    (pk, sk) <@ InnerPKE_Op.kg_derand(kgs);
    hpk <- H_pk pk;
    
    return (pk, (sk, pk, hpk, z));
  }

  proc kg() : publickey * secretkey = {
    var coins,k;
    var pk : publickey;
    var sk : secretkey;
    
    coins <$ srand;
    k <$ srand;
    (pk, sk) <@ kg_derand((coins,k));
    
    return (pk,sk);
  }
  
  proc enc_derand(pk : publickey, coins : W8.t Array32.t) : ciphertext * sharedsecret = {
    var m : W8.t Array32.t;
    var hpk : W8.t Array32.t;
    var r : W8.t Array32.t;
    var c : ciphertext;
    var _K : W8.t Array32.t;
    
    m <- coins;
    hpk <- H_pk pk;
    (_K, r) <@ O.get(m,hpk);
    c <@ InnerPKE_Op.enc_derand(pk, m, r);
    
    return (c, _K);
  }

  proc enc(pk : publickey) : ciphertext * sharedsecret = {
    var coins;
    var c : ciphertext;
    var _K : W8.t Array32.t;
    
    coins <$ srand;
    (c, _K) <@ enc_derand(pk,coins);
    
    return (c,_K);
  }

  
  proc dec(sk : secretkey, cph : ciphertext) : sharedsecret option = {
    var m : plaintext option;
    var _K' : W8.t Array32.t;
    var r : W8.t Array32.t;
    var skp : skey;
    var pk : pkey;
    var hpk : W8.t Array32.t;
    var z : W8.t Array32.t;
    var c : ciphertext;
    var _K : W8.t Array32.t;
    
    (skp, pk, hpk, z) <- sk;
    m <@ InnerPKE_Op.dec(skp, cph);
    (_K, r) <@ O.get(oget m,hpk);
    _K' <- J z cph;
    c <@ InnerPKE_Op.enc_derand(pk, oget m, r);
    if (c <> cph) 
      _K <- _K';
    
    return (Some _K);
  }

}.

(************************************************************************)
(* This is where we show that our bridge specification matches the one
   for which we have a security proof. *)

module DummyRO = {
  proc get(x : W8.t Array32.t * W8.t Array32.t) : W8.t Array32.t * W8.t Array32.t = {
       return G_mhpk x.`1 x.`2;
  }
}.

equiv kg_bridge :
  MLKEM_Op(DummyRO).kg_derand ~ MLKEM.keygen_internal : ={arg} ==> ={res} by proc;wp; call (kg_sampler_kg); auto => />.

equiv enc_bridge :
  MLKEM_Op(DummyRO).enc_derand ~ MLKEM.encaps_internal : ={arg} ==> ={res} by
  proc;wp; call (enc_sampler_enc);inline *; auto => />.

equiv dec_bridge :
  MLKEM_Op(DummyRO).dec ~ MLKEM.decaps_internal : arg{1}.`1 = arg{2}.`2 /\ arg{1}.`2 = arg{2}.`1 ==> res{1} = Some res{2}
by proc;wp;call(enc_sampler_enc);inline {1} 3;wp;call(dec_sampler_dec);auto => />.



(************************************************************************)


(*******************************************************************)
(*    The security definitions for the spec                        *)
(*   Types correspond to implementation types                      *)
(*******************************************************************)

import KMatrix PolyVec PolyMat KPKE Zq.

op pk_encode(pk : W8.t Array32.t * polyvec) : pkey = 
                                  (encode12_vec (toipolyvec (nttv pk.`2)), pk.`1).
op pk_decode(pk : pkey) = (pk.`2, invnttv (ofipolyvec (decode12_vec (pk.`1)))).
op sk_encode(sk : polyvec) : skey = encode12_vec (toipolyvec (nttv sk)).
op sk_decode(sk : skey) =  invnttv (ofipolyvec (decode12_vec sk)).
op m_encode(m : plaintext) : poly = decompress_poly 1 (decode1 m).
op m_decode(p : poly) : plaintext = encode1 (compress_poly 1 p). 
op c_encode(c :  polyvec * poly) : ciphertext =
      (encode_vec (compress_polyvec du c.`1), encode_poly (compress_poly dv c.`2)).
op c_decode(c : ciphertext) =
      (decompress_polyvec du (decode_vec c.`1), decompress_poly dv (decode_poly c.`2)).

lemma pk_encodeK : cancel pk_encode pk_decode.
rewrite /pk_decode /pk_encode /cancel /= => x.
rewrite -sem_encode12_vecK; last by rewrite toipolyvecK invnttvK /#.
move => i ib; rewrite /toipolyvec IPVec.initiE 1:ib /=.
by smt(rg_asint qE).
qed.

lemma sk_encodeK: cancel sk_encode sk_decode.
rewrite /sk_decode /sk_encode /cancel /= => x.
rewrite -sem_encode12_vecK; last by rewrite toipolyvecK invnttvK /#.
move => i ib; rewrite /toipolyvec IPVec.initiE 1:ib /=.
by smt(rg_asint qE).
qed.

op rnd_err_v = compress_poly_err dv.
op rnd_err_u = mapv (compress_poly_err du).

op max_noise = q %/ 4 - 1.
op under_noise_bound (p : poly) (b : int) =
     all (fun cc => `| as_sint cc| <= b) p.

op cv_bound_max : int = Bq dv. (* compress error bound for d = dv (104 at dv=4, 52 at dv=5) *)


(* This will bring into context a ROM definition which has
   the same types as the ROM we will use for the Spec *)
clone import MLWE_PKE_Hash as MLWEPKEHash with
  type MLWE_.seed <- W8.t Array32.t,
  theory MLWE_.Matrix_ <- KMatrix,
  type FO_MLKEM.UU.key <- sharedsecret,
  type plaintext <- plaintext,
  type randomness <- W8.t Array32.t,
  type ciphertext <- W8.t BytesCtVec.t * W8.t BytesPoly.t,
  type FO_MLKEM.UU.PseudoRF.K <- sharedsecret,
  type FO_MLKEM.pkhash <- W8.t Array32.t,
  op FO_MLKEM.pkh <- H_pk,
  type pkey <- publickey,
  type skey <- W8.t BytesPKVec.t,
  op MLWE_.H <- (fun rho => poly2almat (H rho)),
  op prg_kg <- (fun coins => let r = prg_kg_inner coins in (r.`1, poly2alg r.`2, poly2alg r.`3)),
  op prg_enc <- (fun coins => let r = prg_enc_inner coins in (poly2alg r.`1, poly2alg r.`2, r.`3)),
  op MLWE_.duni_R <- duni_R,
  op MLWE_.dshort_R <- dshort_R,
  op MLWE_.dseed <- srand,
  op m_encode <- m_encode,
  op m_decode <- m_decode,
  op pk_encode <- (fun (p : W8.t Array32.t * vector) => pk_encode (p.`1, alg2poly p.`2)),
  op pk_decode <- (fun p => let r = pk_decode p in (r.`1, poly2alg r.`2)),
  op sk_encode <- (fun v => sk_encode (alg2poly v)),
  op sk_decode <- (fun s => poly2alg (sk_decode s)),
  op c_encode <- (fun (c : vector * poly) => c_encode (alg2poly c.`1, c.`2)),
  op c_decode <- (fun c => let r = c_decode c in (poly2alg r.`1, r.`2)),
  op under_noise_bound <- under_noise_bound,
  op max_noise <- max_noise,
  op cv_bound_max <- cv_bound_max,
  op rnd_err_u <- (fun v => poly2alg (rnd_err_u (alg2poly v))),
  op rnd_err_v <- rnd_err_v,
  op drand <- srand,
  op FO_MLKEM.UU.TT.dplaintext <- srand,
  op FO_MLKEM.UU.dkey <- srand,
  op FO_MLKEM.UU.PseudoRF.dK <- srand,
  op FO_MLKEM.UU.PseudoRF.F <- J
  proof MLWE_.dseed_ll by (apply srand_ll)
  proof MLWE_.dshort_R_ll  by apply dshort_R_ll
  proof MLWE_.duni_R_ll by apply duni_R_ll
  proof MLWE_.duni_R_fu by apply duni_R_fu
  proof MLWE_.duni_R_uni by apply duni_R_uni
  proof drand_ll by apply srand_ll
  proof drand_uni by apply srand_uni
  proof drand_fu by apply srand_fu
  proof FO_MLKEM.UU.TT.dplaintext_ll by apply srand_ll
  proof FO_MLKEM.UU.TT.dplaintext_uni by apply srand_uni
  proof FO_MLKEM.UU.TT.dplaintext_fu by apply srand_fu
  proof FO_MLKEM.UU.dkey_ll by apply srand_ll
  proof FO_MLKEM.UU.dkey_uni by apply srand_uni
  proof FO_MLKEM.UU.dkey_fu by apply srand_fu
  proof FO_MLKEM.UU.PseudoRF.dK_ll by apply srand_ll
  proof FO_MLKEM.KEMROM.dkey_ll by apply srand_ll
  proof FO_MLKEM.KEMROM.dkey_uni by apply srand_uni
  proof FO_MLKEM.KEMROM.dkey_fu by apply srand_fu
  proof pk_encodeK
  proof sk_encodeK
  proof encode_noise
  proof good_decode
  proof cv_bound_valid
  proof noise_commutes
  proof noise_preserved.
(* We inherit the following axioms 
  proof *.
 FO_MLKEM.UU.TT.FinT.enum_spec: forall (x : plaintext), count (pred1 x) enum = 1
 FO_MLKEM.UU.TT.ge0_qH: 0 <= qH
 FO_MLKEM.UU.TT.ge0_qV: 0 <= qV
 FO_MLKEM.UU.TT.ge0_qP: 0 <= qP
 FO_MLKEM.UU.TT.ge0_qHC: 0 <= qHC
 FO_MLKEM.UU.ge0_qHT: 0 <= qHT
 FO_MLKEM.UU.ge0_qHU: 0 <= qHU
 FO_MLKEM.UU.ge0_qD: 0 <= qD
 FO_MLKEM.ge0_qHK: 0 <= qHK  *)

realize pk_encodeK.
rewrite /pk_decode /pk_encode /cancel /= => x.
rewrite -sem_encode12_vecK; last by rewrite toipolyvecK invnttvK poly2algK /#.
move => i ib; rewrite /toipolyvec IPVec.initiE 1:ib /=.
by smt(rg_asint qE).
qed.

realize sk_encodeK.
rewrite /sk_decode /sk_encode /cancel /= => x.
rewrite  -sem_encode12_vecK; last by rewrite toipolyvecK invnttvK poly2algK /#.
move => i ib; rewrite /toipolyvec IPVec.initiE 1:ib /=.
by smt(rg_asint qE).
qed.

realize encode_noise.
move => /> u v.
rewrite /c_decode /c_encode /rnd_err_u /rnd_err_v /z /= -sem_encode_vecK.
+ move => i ib; rewrite /compress_polyvec IPVec.initiE 1:ib /Compress /=;smt(StdOrder.IntOrder.expr_gt0).
rewrite -sem_encode_polyK /=.
  by move => i ib; rewrite /compress_poly !mapiE /= 1:ib /Compress /=;smt(StdOrder.IntOrder.expr_gt0).
split; last  by rewrite round_poly_errE.
rewrite /(+) /mapv /=.
apply eq_vectorP => /> i il ih.
rewrite !offunvE /=;1,2: smt(). 
rewrite offunvE 1:/# /= /compress_poly_err /=.
apply Array256.tP => k kb.
rewrite /decompress_polyvec /compress_polyvec /= /fromarray256 /= /Rq.(&+)  /= initiE 1:/# /= mapiE 1:/# mapiE 1:/# map2E initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= !initiE 1,2:/# /= mapiE 1:/# /=.
case (i = 2).
+ rewrite decompress_errE //; 1,3: smt(param_sets).
  by rewrite qE /=;have /= H := param_sets; elim H => /> ? -> /=.

case (i = 1).
+ rewrite decompress_errE //; 1,3: smt(param_sets).
  by rewrite qE /=;have /= H := param_sets; elim H => /> ? -> /=.
rewrite decompress_errE //; 1,3: smt(param_sets).
by rewrite qE /=;have /= H := param_sets; elim H => /> ? -> /=.
qed.

realize good_decode.
rewrite /under_noise_bound /m_encode /m_decode /compress_poly 
        /decompress_poly /max_noise qE /= => m n.
rewrite allP  => /=  hgood.
have : decode1 (encode1 (map (Compress 1) (map (Decompress 1) (decode1 m) &+ n))) = 
       (decode1 m); last by smt(sem_decode1K).
apply Array256.ext_eq => /> x h0x hx256. 
rewrite -sem_encode1K. 
+ move => i ib; rewrite !mapiE /= 1:ib /Compress /= /#.
rewrite /(&+) mapiE 1:/# map2E /= initiE /= 1:/# mapiE 1:/#.
have [->|->] /=: (decode1 m).[x]=0 \/ (decode1 m).[x]=1
 by smt(decode1_bnd).
 rewrite /Decompress /=.
 rewrite from_int_round.
 rewrite -{1}zeroE asintK Zq.ZModule.add0r compress1_is0 // Bq1E.
 smt().
rewrite /Decompress /round /=.
have ->: q%r / 2%r + inv 2%r = (q%r+1%r)/2%r
 by field; smt().
rewrite qE -fromintD -divz_floor //=.
have: Compress 1 (incoeff 1665 + n.[x]) <> 0.
 rewrite compress1_is0 Bq1E.
 move: (hgood x _) => //. 
 rewrite (_:832=831+1) 1://. 
 move=> /absZqP [H|].
 rewrite absZqP negb_or; split.
  smt(incoeffK).
 rewrite qE /=. 
  smt(incoeffK).
 rewrite qE /=.
 smt(incoeffK).
by rewrite /Compress /=; smt(ltz_pmod modz_ge0).
qed.

realize cv_bound_valid.
move=> A s e r e2 m ???? t v.
rewrite /under_noise_bound /rnd_err_v /compress_poly_err /cv_bound.
rewrite allP /compress_err => i Hi /=.
rewrite mapiE //= /cv_bound_max /Bq.
apply compress_err_bound; 1: smt(gt0_dv).
by case dv_vals => ->; rewrite qE.
qed.

realize noise_commutes.
move => n n' maxn b H H0.
move : H H0; rewrite /under_noise_bound.
rewrite !allP.
move => Hn Hnp i ib.
move : (Hn i ib). 
move : (Hnp i ib) => /=. 
rewrite /as_sint /Rq.(&+) /= map2E !initiE //= !StdOrder.IntOrder.ler_norml /= => Hni Hnpi.
by rewrite creprD; smt(to_crepr_abs).
qed.

realize noise_preserved.
move => n maxn. 
rewrite /under_noise_bound.
rewrite !allP. 
rewrite eq_iff; split => /=. 
move => H i ib; move : (H i ib).
rewrite /(&-) mapiE 1:/#.
rewrite creprN /= /#. 
move => H i ib; move : (H i ib).
rewrite /(&-) mapiE 1:/#.
rewrite creprN /= /#. 
qed.


(*******************************************************************)
(* At this point we get some nice equivalences to the abstract sch *)
(*******************************************************************)

equiv keygen_eq : 
  FO_MLKEM.FO_K(FO_MLKEM.KEMROM.RO.RO).kg ~ MLKEM_Op(SPEC_MODEL.RO.RO).kg :
   (glob FO_MLKEM.KEMROM.RO.RO){1}=(glob SPEC_MODEL.RO.RO){2} 
     ==>  (glob FO_MLKEM.KEMROM.RO.RO){1}=(glob SPEC_MODEL.RO.RO){2}                            
                                                     /\ 
                 res{1}.`1 = res{2}.`1               /\ 
                 res{1}.`2.`1.`1 = res{2}.`2.`2      /\ 
                 res{1}.`2.`1.`2 = res{2}.`2.`1      /\
                 H_pk res{1}.`2.`1.`1 = res{2}.`2.`3 /\
                 res{1}.`2.`2 = res{2}.`2.`4.
proof.
proc.
inline {2} 3. 
swap {1} 2 -1. swap {2} 2 -1. 
seq 1 1 : (#pre /\ ={k});1: by auto.
wp;sp;conseq (_: pk{1} = pk0{2} /\ sk{1} = sk0{2} /\ z{2} = k{1}); 1: by smt().
inline {2} 5.
swap{2} [6..9] -5; seq 0 4 : #pre; 1: by auto.
swap {2} 4 9; wp 1 12;conseq />. 
transitivity {2} { coins0 <- (witness,k); coins <$ srand;  (pk0,sk0) <- kg coins; }
   ((glob FO_MLKEM.KEMROM.RO.RO){1}=(glob SPEC_MODEL.RO.RO){2}                            
                                                     /\ 
      ={k} ==> pk{1} = pk0{2} /\ sk{1} = sk0{2} /\ coins0{2}.`2 = k{2})
   (={k} ==> ={pk0,sk0} /\ coins0{2}.`2 = k{2}); 1,2:smt().
+ by sp;conseq />; rndsem*{2} 0;rnd;auto => />. 
swap {1} 1 1;auto => /> coins _; rewrite /kg /=. 
have -> /= : (prg_kg_inner coins) = 
 ((prg_kg_inner coins).`1,(prg_kg_inner coins).`2,(prg_kg_inner coins).`3) by smt(). 
rewrite /pk_encode /sk_encode /=.
by rewrite alg2poly_add !alg2polyK comm_nttv_add comm_nttv_mmul.
qed.

equiv enc_eq: 
  FO_MLKEM.FO_K(FO_MLKEM.KEMROM.RO.RO).enc ~ MLKEM_Op(SPEC_MODEL.RO.RO).enc :
   (glob FO_MLKEM.KEMROM.RO.RO){1}=(glob SPEC_MODEL.RO.RO){2}   /\ ={arg} ==> 
   (glob FO_MLKEM.KEMROM.RO.RO){1}=(glob SPEC_MODEL.RO.RO){2}  /\ ={res}.
proof.
proc.
inline {2} 2. inline {2} 7.
wp;conseq  (: _ ==> (glob FO_MLKEM.KEMROM.RO.RO){1}=(glob SPEC_MODEL.RO.RO){2}   /\
             ={m,r,pk} /\ k{1} = _K0{2} /\ pk0{2} = pk{1}).
+ auto => />; rewrite /enc /= /pk_decode /m_encode /c_encode => &2 m r.
  have -> /= : prg_enc_inner r = 
   ((prg_enc_inner r).`1,(prg_enc_inner r).`2,(prg_enc_inner r).`3) by smt().
  split; congr; congr.
  + by rewrite alg2poly_add alg2polyK -comm_nttv_mmul invnttvK poly2almat_trmx.
  by rewrite comm_ntt_dotp.

by inline *;auto => />.
qed.

import MLWE_.
equiv dec_eq  : 
  FO_MLKEM.FO_K(FO_MLKEM.KEMROM.RO.RO).dec ~ MLKEM_Op(SPEC_MODEL.RO.RO).dec :
   (glob FO_MLKEM.KEMROM.RO.RO){1}=(glob SPEC_MODEL.RO.RO){2}   /\
   arg{1}.`2 = arg{2}.`2 /\
  arg{1}.`1.`1.`1 = arg{2}.`1.`2      /\ 
  arg{1}.`1.`1.`2 = arg{2}.`1.`1      /\
  H_pk arg{1}.`1.`1.`1 = arg{2}.`1.`3 /\
  arg{1}.`1.`2 = arg{2}.`1.`4 
    ==> ={res} /\
   (glob FO_MLKEM.KEMROM.RO.RO){1}=(glob SPEC_MODEL.RO.RO){2}.
proc. 
inline {2} 5. inline {2} 2.
sp 0 1;seq 1  14 : (#pre /\ m'{1} = Some m1{2} /\ m'{1} = m{2}).
+ by auto => />;rewrite /dec /m_encode /c_decode /m_decode /sk_decode/= => &1 &2;
  split;congr;congr;congr;congr;
  by rewrite comm_ntt_dotp.

seq 2 2 : (#pre /\ ks{1} = _K{2} /\ ={r} /\ kn{1} = _K'{2}); 1: by  inline *;auto => />.
seq 1 20 : (#pre /\ c'{1} = c{2}); last by auto => />.
auto => />; rewrite /enc /= /pk_decode /m_encode /c_encode => &1 &2. 
have -> /= : prg_enc_inner r{2} = 
 ((prg_enc_inner r{2}).`1,(prg_enc_inner r{2}).`2,(prg_enc_inner r{2}).`3) by smt().
split; congr; congr.
+ by rewrite alg2poly_add alg2polyK -comm_nttv_mmul invnttvK poly2almat_trmx.
by rewrite comm_ntt_dotp.
qed.

(**************)
(**************)
(** THE PRGS  *)
(**************)
(**************)

(* THESE ARE USED BY OUR ADVERSARIES *)
module MLKEM_PRGs_O (PRF : PRF_DEFS.PRF_Oracles) = {
  proc prg_kg_hs(rho noiseseed : W8.t Array32.t) : W8.t Array32.t * polyvec * polyvec = {
    var noise1 : polyvec;
    var noise2 : polyvec;
    var _N,i,c;
    NPRF.PRF.k <- noiseseed;
    noise1 <- witness;                     
    noise2 <- witness;                      
    _N <- 0;                      
    i <- 0;                             
    while (i < kvec) {                 
      c <@ CBD2_PRF(PRF).sample(_N);
      noise1 <- noise1.[i<-c];                   
      _N <- _N + 1;                     
     i <- i + 1;                       
    }                                  
    i <- 0;                             
    while (i < kvec) {                 
      c <@ CBD2_PRF(PRF).sample(_N);
      noise2 <- noise2.[i<-c];                  
      _N <- _N + 1;                     
      i <- i + 1;                       
    }                                  

    return (rho,noise1,noise2);
  }

  proc prg_kg_prf() : W8.t Array32.t * polyvec * polyvec = {
    var noise1 : polyvec;
    var noise2 : polyvec;
    var _N,i,c,rho,noiseseed;
    (rho, noiseseed) <$ dRO;
    noise1 <- witness;                     
    noise2 <- witness;                      
    _N <- 0;                      
    i <- 0;                             
    while (i < kvec) {                 
      c <@ CBD2_PRF(PRF).sample(_N);
      noise1 <- noise1.[i<-c];                   
      _N <- _N + 1;                     
     i <- i + 1;                       
    }                                  
    i <- 0;                             
    while (i < kvec) {                 
      c <@ CBD2_PRF(PRF).sample(_N);
      noise2 <- noise2.[i<-c];                  
      _N <- _N + 1;                     
      i <- i + 1;                       
    }                                  

    return (rho,noise1,noise2);
  }

   proc prg_enc() : polyvec * polyvec * poly = {
    var noise1 : polyvec;
    var noise2 : polyvec;
     var e2,_N,i,c;
     noise1 <- witness;                     
     noise2 <- witness;   
     _N <- 0;                      
     i <- 0;                             
     while (i < kvec) {                 
       c <@ CBD2_PRF(PRF).sample(_N);
       noise1 <- noise1.[i<-c];                   
       _N <- _N + 1;                     
      i <- i + 1;                       
     }                                  
     i <- 0;                             
     while (i < kvec) {                 
       c <@ CBD2_PRF(PRF).sample(_N);
      noise2 <- noise2.[i<-c];                   
      _N <- _N + 1;                     
      i <- i + 1;                       
     }                                  
     e2 <@ CBD2_PRF(PRF).sample(_N);
     return (noise1,noise2, e2);
  }

}.

(* Clone-boundary bridge: the algebraic short-vector distribution is the
   concrete polyvec sampler post-composed with poly2alg.  This is what lets
   the (algebraic) PRG ideal distributions reduce to the concrete CBD samplers. *)
lemma dvector_poly2alg (d : poly distr) :
  dvector d = dmap (dmap (dlist d kvec) (fun l => KVec.init (nth witness l))) poly2alg.
proof.
rewrite /dvector dmap_comp -dlist_djoin /(\o) /=.
smt(gt0_k).
apply eq_dmap_in => l hl /=.
by rewrite /poly2alg; apply eq_vectorP => i hi; rewrite !offunvE 1,2:/# /= KVec.initiE 1:/# //.
qed.

section.

declare module  A <: PRG_KG.Distinguisher { -NPRF.PRF, -NRF.RF}.

module (B_HS_KG(A : PRG_KG.Distinguisher) : HS_DEFS.Distinguisher)  = {

   proc distinguish(rho sig : W8.t Array32.t) : bool = {
      var b,x;
      x <@ MLKEM_PRGs_O(NPRF.PRF).prg_kg_hs(rho,sig);
      b <@ A.distinguish((x.`1, poly2alg x.`2, poly2alg x.`3));
      return b;
   }
}.

module (B_PRF_KG(A : PRG_KG.Distinguisher) : PRF_DEFS.Distinguisher) (O : PRF_DEFS.PRF_Oracles) = {
   proc distinguish() : bool = {
      var b,x;
      x <@ MLKEM_PRGs_O(O).prg_kg_prf();
      b <@ A.distinguish((x.`1, poly2alg x.`2, poly2alg x.`3));
      return b;
   }
}.

lemma kg_prg_bound &m :
 `|Pr[PRG_KG.IND(PRG_KG.PRGr, A).main() @ &m : res] -
   Pr[PRG_KG.IND(PRG_KG.PRGi, A).main() @ &m : res]| <= 
    `|Pr[HS_DEFS.IND(HS_DEFS.PRGr, B_HS_KG(A)).main() @ &m : res] -
   Pr[HS_DEFS.IND(HS_DEFS.PRGi, B_HS_KG(A)).main() @ &m : res]|  + 
    `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_KG(A)).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_KG(A)).main() @ &m : res]|.
proof.
have -> : Pr[PRG_KG.IND(PRG_KG.PRGr, A).main() @ &m : res] = 
     Pr[HS_DEFS.IND(HS_DEFS.PRGr, B_HS_KG(A)).main() @ &m : res].
+ byequiv => //.
  proc; inline {2} 3; wp; call(: true) => />. 
  inline {1} 2; inline {2} 2. 
  transitivity {1} {sd <$ srand; x <@ MLKEM_PRGs_alg.prg_kg(sd);}
        (true ==> ={x})
        (true ==> x{1} = (x0{2}.`1, poly2alg x0{2}.`2, poly2alg x0{2}.`3));1,2: smt().
  + inline {2} 2; wp;ecall{2} (prg_kg_sem sd{2}).
    by auto => />.
  inline {1} 2; inline {1} 3; inline {2} 6.
  wp; conseq (: _ ==> rho{1} = rho0{2} /\ ={noise1,noise2}); 1: smt().
  by sim;auto => />.

have -> : Pr[HS_DEFS.IND(HS_DEFS.PRGi, B_HS_KG(A)).main() @ &m : res] =
          Pr[PRF_DEFS.IND(PRF, B_PRF_KG(A)).main() @ &m : res].
+ byequiv => //.
  proc; inline {1} 3; inline {2} 2;wp; call(: true) => />.
  conseq (: _ ==> x0{1} = x{2}); 1: smt().
  inline {1} 4; inline {2} 2.
  sim; inline *; wp;conseq/>.
  seq 2 0 : #pre; 1: by auto.
  swap {2} 1 1 ;rndsem* {2} 0;auto => />.
  have -> : dlet dRO
     (fun (rho_noiseseed : W8.t Array32.t * W8.t Array32.t) =>
        dmap srand (fun (k : W8.t Array32.t) => (rho_noiseseed.`1, k)))  = dRO; last by smt().
   + rewrite {1}dprod_dlet /=  dlet_swap /= /(\o) /=. 
     rewrite dprodC /= dmap_dprodE /=;congr. 
     rewrite fun_ext => x;rewrite dlet_dlet /= /dmap /(\o);congr => /=. 
     rewrite fun_ext => y; rewrite dlet_dlet. 
     have -> : (fun (x1 : W8.t Array32.t) =>
     dlet ((fun (b : W8.t Array32.t) => dunit (y, b)) x1)
       (fun (x1_0 : W8.t Array32.t * W8.t Array32.t) => dunit (x1_0.`1, x))) = 
           (fun  (x1 : W8.t Array32.t) => dunit (y,x)); last
       by rewrite dlet_dunit dmap_cst; smt(srand_ll).
     rewrite fun_ext => z /=.
     by rewrite dlet_dunit /= dmap_dunit /=. 

have -> : Pr[PRG_KG.IND(PRG_KG.PRGi, A).main() @ &m : res] = 
          Pr[PRF_DEFS.IND(RF, B_PRF_KG(A)).main() @ &m : res]; last by smt().

byequiv => //.
proc. inline {2} 2; wp;call(: true) => />.
inline {1} 2. inline {2} 2.
transitivity {2} { rho <$ srand; noise1 <@ CBD2rnd.sample_vec_real(); noise2 <@ CBD2rnd.sample_vec_real(); x <- (rho,noise1,noise2); }
       (true ==> x{1} = (x{2}.`1, poly2alg x{2}.`2, poly2alg x{2}.`3))
       (true ==> ={x}); 1,2: smt().
+ transitivity {2} { rho <$ srand; noise1 <@ CBD2rnd.sample_vec_ideal(); noise2 <@ CBD2rnd.sample_vec_ideal(); x <- (rho,noise1,noise2); }
       (true ==> x{1} = (x{2}.`1, poly2alg x{2}.`2, poly2alg x{2}.`3))
       (true ==> ={x}); 1,2: smt().
   + inline *. swap {1} 3 -2. swap {2} 3 1.
     wp;rnd{1};conseq (:r{1} = (rho{2}, poly2alg v{2}, poly2alg v0{2})); 1: smt().
     rndsem* {2} 0.
     rnd (fun (r : W8.t Array32.t * KMatrix.vector * KMatrix.vector) => (r.`1, alg2poly r.`2, alg2poly r.`3))   (* {1}->{2}: unwrap *)
    (fun (t : W8.t Array32.t * poly KVec.t * poly KVec.t)        => (t.`1, poly2alg t.`2, poly2alg t.`3)).  (* {2}->{1}: wrap = the post map *)
     auto => |>; split; 1: by move=> t _; rewrite !alg2polyK; case: t => /#.
     move => ?.
     have HID : prg_kg_ideal =
  dmap (dlet srand (fun (rho0 : W8.t Array32.t) =>
          dlet (dmap (dlist dshort_R kvec) (fun l => KVec.init (nth witness l))) (fun (v1 : poly KVec.t) =>
            dmap (dmap (dlist dshort_R kvec) (fun l => KVec.init (nth witness l))) (fun (v0_0 : poly KVec.t) => (rho0, v1, v0_0)))))
       (fun (t : W8.t Array32.t * PolyVec.polyvec * PolyVec.polyvec) => (t.`1, poly2alg t.`2, poly2alg t.`3)); last first.
     split.
     + move=> t _; rewrite HID.
       rewrite dmap1E; congr; apply fun_ext => x /=.
       rewrite eq_iff; split=> [/#|//].
       rewrite /(\o) /= /pred1 /=; smt(alg2polyK).
    + move=> ? rL ?.
      split; last by move=> ?; rewrite !poly2algK;smt().
      have Hd : rL \in prg_kg_ideal by assumption.
      rewrite HID in Hd; case/supp_dmap: Hd => t [ht ->] /=.
      by rewrite !alg2polyK; have ->/= : (t.`1, t.`2, t.`3) = t;1:by smt().
    rewrite /prg_kg_ideal /dshort !dvector_poly2alg. 
    rewrite !dmap_comp /(\o) /=.  
    rewrite !dlet_dmap; simplify.   
    rewrite !dmap_dlet; simplify. 
    congr; apply fun_ext => a.   
    rewrite !dmap_dlet; simplify.
    rewrite !dlet_dmap; simplify.
    apply eq_dlet;1: by  done. 
    move => x1 /=. 
    rewrite /dmap !dlet_dlet /(\o) /=.
    apply eq_dlet; first done.
    move=> x1_0 /=.
    rewrite !dlet_unit /=.
    by rewrite dlet_unit /=.

  by symmetry;wp; do 2!call(CBD2rnd_vec_equiv); auto => />.

 seq 1 5: (_N{2} = 0 /\ ={rho} /\
     forall (x:W8.t), FMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  + inline *; swap {2} 1 1; auto;conseq (: _ ==> ={rho}); 1:by smt(FMap.mem_empty).
    rndsem*{2} 0; auto => />.
    have -> : (dfst dRO) = srand; last by smt().
    apply eq_distr => x;rewrite dmap1E.
    have -> : (pred1 x \o fun (p : W8.t Array32.t * W8.t Array32.t) => p.`1) = 
              (fun (xy : _ * _) => ((pred1 x) xy.`1) /\ (predT xy.`2)) by smt().
    have -> := dprodE (pred1 x) predT srand srand.
    by rewrite srand_ll /=.
    
 seq 1 2: (={noise1,rho} /\ _N{2} = kvec /\
           forall (x:W8.t), FMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  inline*; wp.
  while (i0{1} = i{2} /\ 0 <= i{2} <= kvec /\ _N{2}=i{2} /\
         (forall k, 0 <= k < i{2} => (v{1}.[k]=noise1{2}.[k])%PolyVec) /\
         forall (x:W8.t), FMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
   rcondt {2} 4.
   +  move=> *; wp; skip => &hr /> ??? Hm ?.
      rewrite -implybF => H.
      by move: (Hm _ H); rewrite implybF of_uintK; smt(kvec_le4).
   wp; while (#[/:4,7:]pre /\ ={bytes} /\ i1{1} = i0{2} /\ 0 <= i0{2} <= 128 /\ j{2} = i0{2}*2 /\
              (forall (x1 : W8.t), FMap.dom RF.m{2} x1 => to_uint x1 <= _N{2}) /\
              forall k, 0 <= k < j{2} => p0{1}.[k] = rr{2}.[k]).
    auto => />. move => &1 &2 *; do split; 1..3:smt().
    move=> k ?? /=.
    case: (k= 2*i0{2}) => E1.
     by rewrite set_neqiE 1..2:/# set_eqiE 1..2:/# set_neqiE 1..2:/# set_eqiE /#. 
    case: (k= 2*i0{2}+1) => E2.
     by rewrite set_eqiE 1..2:/# set_eqiE /#.
    by rewrite set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE /#. 
   wp; rnd; wp; skip => /> &1 &2; move => ?????????; split.
    split; 1:   by rewrite FMap.get_set_sameE.
    move=> x; case: (x=W8.of_int i{2}) => E.
     by move=> _; rewrite E of_uintK; smt(kvec_le4).
    rewrite FMap.domE FMap.get_set_neqE 1:// => H. 
    by apply StdOrder.IntOrder.ltrW; smt().
   move => p1 i0 p2 ?????? H; split; first smt().
   have EE: p1 = p2.
    by apply Array256.tP => k kb; apply H; smt().
   split; last smt().
   move=> k HkL HkR; case: (k = i{2}) => E.
    by rewrite E; smt(KVec.get_setE).
   by smt(KVec.get_setE).
  auto => /> &1 &2; split; first smt(gt0_k).
  move=> v1 m i v2 => ??????; split; last smt(kvec_le4).
  apply KVec.ext_eq => k kb;smt(KVec.get_setE).
 wp; seq 1 2: (={rho,noise1,noise2} /\ _N{2} = 2*kvec /\
           forall (x:W8.t), FMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  inline*; wp.
  while (i0{1} = i{2} /\ 0 <= i{2} <= kvec /\ _N{2}=kvec+i{2} /\ noise1{1}=noise1{2} /\
         (forall k, 0 <= k < i{2} => (v{1}.[k]=noise2{2}.[k])%PolyVec) /\
         forall (x:W8.t), FMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
   rcondt {2} 4.
    move=> *; wp; skip => &hr /> ??? Hm ?.
    rewrite -implybF => H.
    by move: (Hm _ H); rewrite implybF of_uintK; smt(kvec_le4).
   wp; while (#[/:5,8:]pre /\ bytes{1}=bytes{2} /\ i1{1}=i0{2} /\ 0 <= i0{2} <= 128 /\ j{2} = i0{2}*2 /\
              (forall (x1 : W8.t), FMap.dom RF.m{2} x1 => to_uint x1 <= _N{2}) /\
              forall k, 0 <= k < j{2} => p0{1}.[k] = rr{2}.[k]).
    wp; skip => /> &1&2 *; split; first smt().    
    split; first smt().
    move=> k ?? /=.
    case: (k= 2*i0{2}) => E1.
     by rewrite set_neqiE 1..2:/# set_eqiE 1..2:/# set_neqiE 1..2:/# set_eqiE /#. 
    case: (k= 2*i0{2}+1) => E2.
     by rewrite set_eqiE 1..2:/# set_eqiE /#.
    by rewrite set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE /#.
   wp; rnd; wp; skip => /> &1 &2; move => ?????????; split.
    split; 1:  by rewrite FMap.get_set_sameE.
    move=> x; case: (x=W8.of_int (kvec+i{2})) => E.
     by move=> _; rewrite E of_uintK; smt(kvec_le4).
    rewrite FMap.domE FMap.get_set_neqE 1:// => H. 
    by apply StdOrder.IntOrder.ltrW; smt().
   move => p1 i1 p2 ?????? H; split; first smt().
   have EE: p1 = p2.
    by apply Array256.tP => k kb; apply H; smt().
   split; first smt().
   split; last smt().
   move=> k HkL HkR; case: (k = i{2}) => E.
    by rewrite E; smt(KVec.get_setE).
   by smt(KVec.get_setE).
  auto => /> &1 &2; split; first smt(gt0_k).
  move=> v1 m i v2 ??????; split; last smt(kvec_le4).
  by apply KVec.ext_eq => k kb;smt(KVec.get_setE).
 by auto.
qed.

end section.

module (B_PRF_ENC(A : PRG_ENC.Distinguisher) : PRF_DEFS.Distinguisher) (O : PRF_DEFS.PRF_Oracles) = {

   proc distinguish() : bool = {
      var b,x;
      x <@ MLKEM_PRGs_O(O).prg_enc();
      b <@ A.distinguish((poly2alg x.`1, poly2alg x.`2, x.`3));
      return b;
   }
}.

section.

declare module  A <: PRG_ENC.Distinguisher {-NPRF.PRF, -NRF.RF}.

lemma enc_prg_bound &m :
 `|Pr[PRG_ENC.IND(PRG_ENC.PRGr, A).main() @ &m : res] -
   Pr[PRG_ENC.IND(PRG_ENC.PRGi, A).main() @ &m : res]| <= 
        `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_ENC(A)).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_ENC(A)).main() @ &m : res]|.
proof. 
have -> : Pr[PRG_ENC.IND(PRG_ENC.PRGr, A).main() @ &m : res] = 
          Pr[PRF_DEFS.IND(PRF, B_PRF_ENC(A)).main() @ &m : res].
+ byequiv => //.
  proc;inline {2} 2;wp;call(:true).
  inline {1} 2; conseq />.
   transitivity {1} {sd <$ srand; x <@ MLKEM_PRGs_alg.prg_enc(sd);}
        (true ==> ={x})
        (true ==> x{1} = (poly2alg x{2}.`1, poly2alg x{2}.`2, x{2}.`3));1,2: smt().
  + inline {2} 2; wp; ecall{2} (prg_enc_sem sd{2}); auto => />.
  inline {1} 2; inline {1} 3; inline {2} 2.
  wp; conseq (: _ ==> ={noise1,noise2,e2}); 1: smt().
  by sim;inline *;auto => />.

have -> : Pr[PRG_ENC.IND(PRG_ENC.PRGi, A).main() @ &m : res] = 
          Pr[PRF_DEFS.IND(RF, B_PRF_ENC(A)).main() @ &m : res]; last by smt().
byequiv => //.
proc; inline {2} 2;wp;call(: true).
inline {1} 2. inline {2} 1. inline {2} 2. conseq />.
transitivity {2} { noise1 <@ CBD2rnd.sample_vec_real(); noise2 <@ CBD2rnd.sample_vec_real(); e2 <@ CBD2rnd.sample_real(); x <- (noise1,noise2,e2); }
       (true ==> x{1} = (poly2alg x{2}.`1, poly2alg x{2}.`2, x{2}.`3))
       (true ==> ={x}); 1,2: smt().
+ transitivity {2} { noise1 <@ CBD2rnd.sample_vec_ideal(); noise2 <@ CBD2rnd.sample_vec_ideal(); e2 <@ CBD2rnd.sample_ideal(); x <- (noise1,noise2,e2); }
       (true ==> x{1} = (poly2alg x{2}.`1, poly2alg x{2}.`2, x{2}.`3))
       (true ==> ={x}); 1,2: smt().
  + inline *. swap {1} [1..2] 1. swap {2} 4 1. swap {2} 2 3.
    wp;rnd{1}. conseq(: _ ==> r{1} = (poly2alg v{2}, poly2alg v0{2}, p{2}));1: by smt().
    rndsem*{2} 0.
    have HIE : prg_enc_ideal = dmap (dlet (dmap (dlist dshort_R kvec) (fun (l : poly list) => KVec.init (nth witness l))) (fun (v1 : poly KVec.t) => dlet (dmap (dlist dshort_R kvec) (fun (l : poly list) => KVec.init (nth witness l))) (fun (v0_0 : poly KVec.t) => dmap dshort_R (fun (p0 : poly) => (v1, v0_0, p0))))) (fun (t : PolyVec.polyvec * PolyVec.polyvec * poly) => (poly2alg t.`1, poly2alg t.`2, t.`3)).
    + rewrite /prg_enc_ideal /dshort !dvector_poly2alg.
      rewrite !dmap_comp /(\o) /=.
      rewrite !dlet_dmap; simplify.
      rewrite dmap_dlet.
      congr.
      simplify.
      apply fun_ext => a.
      rewrite !dmap_dlet; simplify.
      rewrite !dlet_dmap; simplify.
      apply eq_dlet; first done.
      move=> a0 /=; rewrite /dmap !dlet_dlet /(\o) /=.
      apply eq_dlet; first done.
      move=> x1 /=; rewrite !dlet_unit /=.
      by rewrite dlet_unit /=.
    rnd (fun (r : KMatrix.vector * KMatrix.vector * KMatrix.R) => (alg2poly r.`1, alg2poly r.`2, r.`3)) (fun (t : PolyVec.polyvec * PolyVec.polyvec * poly) => (poly2alg t.`1, poly2alg t.`2, t.`3)).
    skip => &1 &2 _.
    split; first by move=> vv0pR _ /=; rewrite !alg2polyK; case: vv0pR.
    move=> _; split.
    + move=> vv0pR _; rewrite HIE (dmap1E_can _ _ (fun (r : KMatrix.vector * KMatrix.vector * KMatrix.R) => (alg2poly r.`1, alg2poly r.`2, r.`3))).
      + by move=> x /=; rewrite !poly2algK; case: x.
      + by move=> a _ /=; rewrite !alg2polyK; case: a.
      by rewrite /= !alg2polyK; case: vv0pR.
    move=> _ rL HrL; rewrite HIE in HrL; case/supp_dmap: HrL => t [ht ->].
    rewrite /= !alg2polyK.
    split; first by move: ht; case: t => t1 t2 t3 /= h; exact h.
    by move=> _.
  by symmetry;wp; call(CBD2rnd_equiv); do 2!call(CBD2rnd_vec_equiv); auto => />.

 seq 0 4: (_N{2} = 0 /\ 
     forall (x:W8.t), FMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  + by auto => />;smt(FMap.mem_empty).
    
 seq 1 2: (={noise1} /\ _N{2} = kvec /\
           forall (x:W8.t), FMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  inline*; wp.
  while (i0{1} = i{2} /\ 0 <= i{2} <= kvec /\ _N{2}=i{2} /\
         (forall k, 0 <= k < i{2} => (v{1}.[k]=noise1{2}.[k])%PolyVec) /\
         forall (x:W8.t), FMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
   rcondt {2} 4.
   +  move=> *; wp; skip => &hr /> ??? Hm ?.
      rewrite -implybF => H.
      by move: (Hm _ H); rewrite implybF of_uintK; smt(kvec_le4).
   wp; while (#[/:4,7:]pre /\ ={bytes} /\ i1{1} = i0{2} /\ 0 <= i0{2} <= 128 /\ j{2} = i0{2}*2 /\
              (forall (x1 : W8.t), FMap.dom RF.m{2} x1 => to_uint x1 <= _N{2}) /\
              forall k, 0 <= k < j{2} => p0{1}.[k] = rr{2}.[k]).
    auto => />. move => &1 &2 *; do split; 1..3:smt().
    move=> k ?? /=.
    case: (k= 2*i0{2}) => E1.
     by rewrite set_neqiE 1..2:/# set_eqiE 1..2:/# set_neqiE 1..2:/# set_eqiE /#. 
    case: (k= 2*i0{2}+1) => E2.
     by rewrite set_eqiE 1..2:/# set_eqiE /#.
    by rewrite set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE /#. 
   wp; rnd; wp; skip => /> &1 &2; move => ?????????; split.
    split; 1:   by rewrite FMap.get_set_sameE.
    move=> x; case: (x=W8.of_int i{2}) => E.
     by move=> _; rewrite E of_uintK; smt(kvec_le4).
    rewrite FMap.domE FMap.get_set_neqE 1:// => H. 
    by apply StdOrder.IntOrder.ltrW; smt().
   move => p1 i0 p2 ?????? H; split; first smt().
   have EE: p1 = p2.
    by apply Array256.tP => k kb; apply H; smt().
   split; last smt().
   move=> k HkL HkR; case: (k = i{2}) => E.
    by rewrite E; smt(KVec.get_setE).
   by smt(KVec.get_setE).
  auto => /> &1 &2; split; first smt(gt0_k).
  move=> v1 m i v2 => ??????; split; last smt(kvec_le4).
  apply KVec.ext_eq => k kb;smt(KVec.get_setE).
 wp; seq 1 2: (={noise1,noise2} /\ _N{2} = 2*kvec /\
           forall (x:W8.t), FMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  inline*; wp.
  while (i0{1} = i{2} /\ 0 <= i{2} <= kvec /\ _N{2}=kvec+i{2} /\ noise1{1}=noise1{2} /\
         (forall k, 0 <= k < i{2} => (v{1}.[k]=noise2{2}.[k])%PolyVec) /\
         forall (x:W8.t), FMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
   rcondt {2} 4.
    move=> *; wp; skip => &hr /> ??? Hm ?.
    rewrite -implybF => H.
    by move: (Hm _ H); rewrite implybF of_uintK; smt(kvec_le4).
   wp; while (#[/:5,8:]pre /\ bytes{1}=bytes{2} /\ i1{1}=i0{2} /\ 0 <= i0{2} <= 128 /\ j{2} = i0{2}*2 /\
              (forall (x1 : W8.t), FMap.dom RF.m{2} x1 => to_uint x1 <= _N{2}) /\
              forall k, 0 <= k < j{2} => p0{1}.[k] = rr{2}.[k]).
    wp; skip => /> &1&2 *; split; first smt().    
    split; first smt().
    move=> k ?? /=.
    case: (k= 2*i0{2}) => E1.
     by rewrite set_neqiE 1..2:/# set_eqiE 1..2:/# set_neqiE 1..2:/# set_eqiE /#. 
    case: (k= 2*i0{2}+1) => E2.
     by rewrite set_eqiE 1..2:/# set_eqiE /#.
    by rewrite set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE /#.
   wp; rnd; wp; skip => /> &1 &2; move => ?????????; split.
    split; 1:  by rewrite FMap.get_set_sameE.
    move=> x; case: (x=W8.of_int (kvec+i{2})) => E.
     by move=> _; rewrite E of_uintK; smt(kvec_le4).
    rewrite FMap.domE FMap.get_set_neqE 1:// => H. 
    by apply StdOrder.IntOrder.ltrW; smt().
   move => p1 i1 p2 ?????? H; split; first smt().
   have EE: p1 = p2.
    by apply Array256.tP => k kb; apply H; smt().
   split; first smt().
   split; last smt().
   move=> k HkL HkR; case: (k = i{2}) => E.
    by rewrite E; smt(KVec.get_setE).
   by smt(KVec.get_setE).
  auto => /> &1 &2; split; first smt(gt0_k).
  move=> v1 m i v2 ??????; split; last smt(kvec_le4).
  by apply KVec.ext_eq => k kb;smt(KVec.get_setE).
 conseq />.
  inline*; wp.
  rcondt {2} 4.
   move=> *; wp; skip => &hr /> Hm. 
   rewrite -implybF => H.
   by move: (Hm _ H); rewrite implybF of_uintK; smt(kvec_le4).
   while (#[/:-2]pre /\ bytes{1}=bytes{2} /\ i0{1}=i0{2} /\ 0 <= i0{2} <= 128 /\ j{2} = i0{2}*2 /\
          forall k, 0 <= k < j{2} => p{1}.[k] = rr{2}.[k]).
    wp; skip => /> &1&2 *; split; first smt(). 
    split; first smt().
    move=> k ?? /=.
    case: (k= 2*i0{2}) => E1.
     by rewrite set_neqiE 1..2:/# set_eqiE 1..2:/# set_neqiE 1..2:/# set_eqiE /#. 
    case: (k= 2*i0{2}+1) => E2.
     by rewrite set_eqiE 1..2:/# set_eqiE /#.
    by rewrite set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE /#.
   wp; rnd; wp; skip => /> &1 &2 ????; split.
    by rewrite FMap.get_set_eqE //=.
   move => p1 i1 p2 ????? H.
   by apply Array256.tP => k kb; apply H; smt().
qed.

end section.

(**************)
(**************)
(** THEOREMS  *)
(**************)
(**************)



section.

declare module A <: SPEC_MODEL.CCA_ADV {-FO_MLKEM.KEMROM.RO.RO.m, -FO_MLKEM.UU.TT.PKE.OW_CPA, -FO_MLKEM.UU.TT.PKE.BOWp, -FO_MLKEM.UU.TT.PKE.OWL_CPA, -FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl, -FO_MLKEM.UU.TT.PKEROM.RO.RO, -FO_MLKEM.UU.TT.PKEROM.RO.FRO, -FO_MLKEM.UU.TT.PKEROM.OW_PCVA, -FO_MLKEM.UU.TT.BasePKE, -FO_MLKEM.UU.TT.B, -FO_MLKEM.UU.TT.Correctness_Adv1, -FO_MLKEM.UU.TT.CountO, -FO_MLKEM.UU.TT.O_AdvOW, -FO_MLKEM.UU.TT.Gm, -FO_MLKEM.UU.RF.RF, -FO_MLKEM.UU.PseudoRF.PRF, -FO_MLKEM.UU.KEMROMx2.RO1.RO, -FO_MLKEM.UU.KEMROMx2.RO1.FRO, -FO_MLKEM.UU.KEMROMx2.RO2.RO, -FO_MLKEM.UU.KEMROMx2.RO2.FRO, -FO_MLKEM.UU.KEMROMx2.CCA, -FO_MLKEM.UU.CountHx2, -FO_MLKEM.UU.RO1E.FunRO, -FO_MLKEM.UU.UU2, -FO_MLKEM.UU.H2, -FO_MLKEM.UU.H2BOWMod, -FO_MLKEM.UU.Gm2, -FO_MLKEM.UU.Gm3, -FO_MLKEM.KEMROM.CCA, -FO_MLKEM.B1x2, -MLWE_PKE_HASH_PRG, -CB, -SPEC_MODEL.RO.RO, -SPEC_MODEL.CCA}.

lemma mlkem_spec_security_pre &m (failprob prg_kg_bound prg_enc_bound : real) : 
  Pr[CorrectnessBound.main() @ &m : res] <= failprob =>
 `|Pr[PRG_KG.IND(PRG_KG.PRGr, DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res] -
   Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res]| <=
 prg_kg_bound =>
 `|Pr[PRG_KG.IND(PRG_KG.PRGr, DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res] -
   Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res]| <=
 prg_kg_bound =>
 `|Pr[PRG_KG.IND(PRG_KG.PRGr, DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res] -
   Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res]| <=
 prg_kg_bound =>
 `|Pr[PRG_KG.IND(PRG_KG.PRGr, DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res] -
   Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res]| <=
 prg_kg_bound =>
 `|Pr[PRG_KG.IND(PRG_KG.PRGr, DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res] -
   Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res]| <=
 prg_kg_bound =>
 `|Pr[PRG_KG.IND(PRG_KG.PRGr, D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
      () @ &m : res] -
   Pr[PRG_KG.IND(PRG_KG.PRGi, D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
      () @ &m : res]| <=
 prg_kg_bound =>
 `|Pr[PRG_KG.IND(PRG_KG.PRGr, D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res] -
   Pr[PRG_KG.IND(PRG_KG.PRGi, D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res]| <=
 prg_kg_bound =>
 `|Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res] -
   Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res]| <=
 prg_enc_bound =>
 `|Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res] -
   Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res]| <=
 prg_enc_bound =>
 `|Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res] -
   Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res]| <=
 prg_enc_bound =>
 `|Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res] -
   Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res]| <=
 prg_enc_bound =>
 `|Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res] -
   Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
      () @ &m : res]| <=
 prg_enc_bound =>
 `|Pr[PRG_ENC.IND(PRG_ENC.PRGr, D_ENC(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
      () @ &m : res] -
   Pr[PRG_ENC.IND(PRG_ENC.PRGi, D_ENC(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
      () @ &m : res]| <=
 prg_enc_bound =>
 `|Pr[PRG_ENC.IND(PRG_ENC.PRGr, D_ENC(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res] -
   Pr[PRG_ENC.IND(PRG_ENC.PRGi, D_ENC(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
      () @ &m : res]| <=
 prg_enc_bound =>
 FO_MLKEM.UU.qHT = FO_MLKEM.qHK =>
 FO_MLKEM.UU.qHU = FO_MLKEM.qHK =>
 FO_MLKEM.UU.TT.qH = FO_MLKEM.UU.qHT + FO_MLKEM.UU.qHU + 1 =>
 FO_MLKEM.UU.TT.qV = 0 =>
 FO_MLKEM.UU.TT.qP = 0 =>
 FO_MLKEM.UU.TT.qH + 1 = FO_MLKEM.UU.TT.qHC =>
 FO_MLKEM.UU.TT.qHC < FO_MLKEM.UU.TT.FinT.card - 1 =>
 (forall (RO0 <: FO_MLKEM.KEMROM.POracle{-FO_MLKEM.CountH, -A} )
    (O0 <: FO_MLKEM.KEMROM.CCA_ORC{-FO_MLKEM.CountH, -A} ),
    hoare[ A(FO_MLKEM.CountH(RO0), O0).guess : FO_MLKEM.CountH.c_h = 0 ==> FO_MLKEM.CountH.c_h <= FO_MLKEM.qHK]) =>
 (forall (H0 <: FO_MLKEM.KEMROM.POracle {-A} ) (O0 <: FO_MLKEM.UU.KEMROMx2.CCA_ORC{-A} ),
    islossless O0.dec => islossless H0.get => islossless A(H0, O0).guess) =>
  `| Pr[ SPEC_MODEL.CCA(SPEC_MODEL.RO.RO,MLKEM_Op,A).main() @ &m : res] - 1%r/2%r | <= 
    2%r *
    (`|Pr[MLWE_H(B1(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
          (false, false) @ &m : res] -
       Pr[MLWE_H(B1(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
          (false, true) @ &m : res]| +
     `|Pr[MLWE_H(B2(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
          (true, false) @ &m : res] -
       Pr[MLWE_H(B2(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
          (true, true) @ &m : res]| +
     prg_kg_bound + prg_enc_bound) +
    2%r *
    (`|Pr[MLWE_H(B1(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
          (false, false) @ &m : res] -
       Pr[MLWE_H(B1(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
          (false, true) @ &m : res]| +
     `|Pr[MLWE_H(B2(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
          (true, false) @ &m : res] -
       Pr[MLWE_H(B2(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
          (true, true) @ &m : res]| +
     prg_kg_bound + prg_enc_bound) +
    (3%r * (2 * FO_MLKEM.qHK + 3)%r + 1%r) * (failprob + prg_kg_bound + prg_enc_bound) +
    `|Pr[FO_MLKEM.UU.J.IND(FO_MLKEM.UU.PseudoRF.PRF, FO_MLKEM.UU.D(FO_MLKEM.B1x2(A))).main() @ &m : res] -
      Pr[FO_MLKEM.UU.J.IND(FO_MLKEM.UU.RF.RF, FO_MLKEM.UU.D(FO_MLKEM.B1x2(A))).main() @ &m : res]| +
    2%r * (2 * FO_MLKEM.qHK + 2)%r * FO_MLKEM.UU.TT.PKE.eps_msg.
move => fp kb1 kb2 kb3 kb4 kb5 kb6 kb7 eb1 eb2 eb3 eb4 eb5 eb6 eb7 qHTv qHUv qHv qV0 qP0 qHCub qHClb Aqb All.
have := conclusion A &m failprob prg_kg_bound prg_enc_bound fp kb1 kb2 kb3 kb4 kb5 kb6 kb7 eb1 eb2 eb3 eb4 
       eb5 eb6 eb7 qHTv qHUv qHv qV0 qP0 qHCub qHClb Aqb All.
have <- : Pr[FO_MLKEM.KEMROM.CCA(FO_MLKEM.KEMROM.RO.RO, FO_MLKEM.FO_K, A).main() @ &m : res] = 
    Pr[ SPEC_MODEL.CCA(SPEC_MODEL.RO.RO,MLKEM_Op,A).main() @ &m : res];
  last by move => ->. 
byequiv => //.
proc. 
call(: (glob SPEC_MODEL.RO.RO){2} = (glob FO_MLKEM.KEMROM.RO.RO){1}  /\
       SPEC_MODEL.CCA.cstar{2} = FO_MLKEM.KEMROM.CCA.cstar{1} /\
       FO_MLKEM.KEMROM.CCA.sk{1}.`1.`1 = SPEC_MODEL.CCA.sk{2}.`2      /\ 
       FO_MLKEM.KEMROM.CCA.sk{1}.`1.`2 = SPEC_MODEL.CCA.sk{2}.`1      /\
       H_pk FO_MLKEM.KEMROM.CCA.sk{1}.`1.`1 = SPEC_MODEL.CCA.sk{2}.`3 /\
       FO_MLKEM.KEMROM.CCA.sk{1}.`2 = SPEC_MODEL.CCA.sk{2}.`4 ).
+ proc; seq 1 1 : (#pre /\ ={k}); 1: by auto.
  if;1,3:by auto.
  by call dec_eq; auto => />.
by proc;auto.

by wp;call enc_eq;rnd;rnd;call keygen_eq; inline *; auto.

qed.

end section.

section.

lemma mlkem_spec_correctness_pre &m (failprob prg_kg_bound prg_enc_bound : real) : 

Pr[CorrectnessBound.main() @ &m : res] <= failprob =>

    `|Pr[PRG_KG.IND(PRG_KG.PRGr, DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
         () @ &m : res] -
      Pr[PRG_KG.IND(PRG_KG.PRGi, DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
         () @ &m : res]| <= prg_kg_bound => 
    `|Pr[PRG_ENC.IND(PRG_ENC.PRGr, DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
         () @ &m : res] -
      Pr[PRG_ENC.IND(PRG_ENC.PRGi, DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO))).main
         () @ &m : res]| <= prg_enc_bound =>

    FO_MLKEM.UU.TT.qHC = 0 =>
    1 < FO_MLKEM.UU.TT.FinT.card =>

  Pr[ SPEC_MODEL.Correctness(SPEC_MODEL.RO.RO,MLKEM_Op).main() @ &m : res] <= 
      failprob + prg_kg_bound + prg_enc_bound.
move => fp kb eb qHC0 cardgt0.
have := correctness &m failprob fp qHC0 cardgt0.

have <- : Pr[FO_MLKEM.KEMROM.Correctness(FO_MLKEM.KEMROM.RO.RO, FO_MLKEM.FO_K).main() @ &m : res] = 
  Pr[ SPEC_MODEL.Correctness(RO, MLKEM_Op).main() @ &m : res]; last by smt().

byequiv => //.
by proc;call dec_eq; call enc_eq; call keygen_eq;inline *;auto.
qed. 

end section.

(* We now express prg_kg_bound and prf_enc_bound in terms of advantages against functions in the SHA family *)
section.


declare module A <: SPEC_MODEL.CCA_ADV {-FO_MLKEM.KEMROM.RO.RO.m, -FO_MLKEM.UU.TT.PKE.OW_CPA, -FO_MLKEM.UU.TT.PKE.BOWp, -FO_MLKEM.UU.TT.PKE.OWL_CPA, -FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl, -FO_MLKEM.UU.TT.PKEROM.RO.RO, -FO_MLKEM.UU.TT.PKEROM.RO.FRO, -FO_MLKEM.UU.TT.PKEROM.OW_PCVA, -FO_MLKEM.UU.TT.BasePKE, -FO_MLKEM.UU.TT.B, -FO_MLKEM.UU.TT.Correctness_Adv1, -FO_MLKEM.UU.TT.CountO, -FO_MLKEM.UU.TT.O_AdvOW, -FO_MLKEM.UU.TT.Gm, -FO_MLKEM.UU.RF.RF, -FO_MLKEM.UU.PseudoRF.PRF, -FO_MLKEM.UU.KEMROMx2.RO1.RO, -FO_MLKEM.UU.KEMROMx2.RO1.FRO, -FO_MLKEM.UU.KEMROMx2.RO2.RO, -FO_MLKEM.UU.KEMROMx2.RO2.FRO, -FO_MLKEM.UU.KEMROMx2.CCA, -FO_MLKEM.UU.CountHx2, -FO_MLKEM.UU.RO1E.FunRO, -FO_MLKEM.UU.UU2, -FO_MLKEM.UU.H2, -FO_MLKEM.UU.H2BOWMod, -FO_MLKEM.UU.Gm2, -FO_MLKEM.UU.Gm3, -FO_MLKEM.KEMROM.CCA, -FO_MLKEM.B1x2, -MLWE_PKE_HASH_PRG, -CB, -SPEC_MODEL.RO.RO, -SPEC_MODEL.CCA, -NPRF.PRF, -NRF.RF}.

lemma mlkem_spec_security &m (failprob hsadv prfadv : real) : 
  Pr[CorrectnessBound.main() @ &m : res] <= failprob =>

  (* k1 *)
  `|Pr[HS_DEFS.IND(HS_DEFS.PRGr, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res] -
   Pr[HS_DEFS.IND(HS_DEFS.PRGi, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res]| <= hsadv => 
    `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res]| <= prfadv =>

  (* k2 *)

  `|Pr[HS_DEFS.IND(HS_DEFS.PRGr, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res] -
   Pr[HS_DEFS.IND(HS_DEFS.PRGi, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res]| <= hsadv => 

    `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res]| <= prfadv =>

  (* k3 *)

  `|Pr[HS_DEFS.IND(HS_DEFS.PRGr, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[HS_DEFS.IND(HS_DEFS.PRGi, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= hsadv => 

    `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= prfadv =>

  (* k4 *)

  `|Pr[HS_DEFS.IND(HS_DEFS.PRGr, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[HS_DEFS.IND(HS_DEFS.PRGi, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= hsadv => 

    `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= prfadv =>

  (* k5 *)

  `|Pr[HS_DEFS.IND(HS_DEFS.PRGr, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[HS_DEFS.IND(HS_DEFS.PRGi, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= hsadv => 

    `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= prfadv =>

  (* k6 *)

  `|Pr[HS_DEFS.IND(HS_DEFS.PRGr, B_HS_KG(D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))))).main() @ &m : res] -
   Pr[HS_DEFS.IND(HS_DEFS.PRGi, B_HS_KG(D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))))).main() @ &m : res]| <= hsadv => 

    `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_KG(D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_KG(D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))))).main() @ &m : res]| <= prfadv =>

  (* k7 *)

  `|Pr[HS_DEFS.IND(HS_DEFS.PRGr, B_HS_KG(D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res] -
   Pr[HS_DEFS.IND(HS_DEFS.PRGi, B_HS_KG(D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res]| <= hsadv => 

    `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_KG(D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_KG(D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res]| <= prfadv =>
    
  (* e1 *)

   `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res]| <= prfadv =>

  (* e2 *)

   `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res]| <= prfadv =>

  (* e3 *)

   `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= prfadv =>

  (* e4 *)

   `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= prfadv =>

  (* e5 *)

   `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= prfadv =>

  (* e6 *)

   `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_ENC(D_ENC(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_ENC(D_ENC(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))))).main() @ &m : res]| <= prfadv =>

  (* e7 *)

   `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_ENC(D_ENC(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_ENC(D_ENC(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main() @ &m : res]| <= prfadv =>
  
 FO_MLKEM.UU.qHT = FO_MLKEM.qHK =>
 FO_MLKEM.UU.qHU = FO_MLKEM.qHK =>
 FO_MLKEM.UU.TT.qH = FO_MLKEM.UU.qHT + FO_MLKEM.UU.qHU + 1 =>
 FO_MLKEM.UU.TT.qV = 0 =>
 FO_MLKEM.UU.TT.qP = 0 =>
 FO_MLKEM.UU.TT.qH + 1 = FO_MLKEM.UU.TT.qHC =>
 FO_MLKEM.UU.TT.qHC < FO_MLKEM.UU.TT.FinT.card - 1 =>
 (forall (RO0 <: FO_MLKEM.KEMROM.POracle{-FO_MLKEM.CountH, -A} )
    (O0 <: FO_MLKEM.KEMROM.CCA_ORC{-FO_MLKEM.CountH, -A} ),
    hoare[ A(FO_MLKEM.CountH(RO0), O0).guess : FO_MLKEM.CountH.c_h = 0 ==> FO_MLKEM.CountH.c_h <= FO_MLKEM.qHK]) =>
 (forall (H0 <: FO_MLKEM.KEMROM.POracle {-A} ) (O0 <: FO_MLKEM.UU.KEMROMx2.CCA_ORC{-A} ),
    islossless O0.dec => islossless H0.get => islossless A(H0, O0).guess) =>
  `| Pr[ SPEC_MODEL.CCA(SPEC_MODEL.RO.RO,MLKEM_Op,A).main() @ &m : res] - 1%r/2%r | <= 
    2%r *
    (`|Pr[MLWE_H(B1(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
          (false, false) @ &m : res] -
       Pr[MLWE_H(B1(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
          (false, true) @ &m : res]| +
     `|Pr[MLWE_H(B2(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
          (true, false) @ &m : res] -
       Pr[MLWE_H(B2(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))).main
          (true, true) @ &m : res]| +
     hsadv + 2%r*prfadv) +
    2%r *
    (`|Pr[MLWE_H(B1(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
          (false, false) @ &m : res] -
       Pr[MLWE_H(B1(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
          (false, true) @ &m : res]| +
     `|Pr[MLWE_H(B2(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
          (true, false) @ &m : res] -
       Pr[MLWE_H(B2(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))).main
          (true, true) @ &m : res]| +
     hsadv + 2%r*prfadv) +
    (3%r * (2 * FO_MLKEM.qHK + 3)%r + 1%r) * (failprob + hsadv + 2%r*prfadv) +
    `|Pr[FO_MLKEM.UU.J.IND(FO_MLKEM.UU.PseudoRF.PRF, FO_MLKEM.UU.D(FO_MLKEM.B1x2(A))).main() @ &m : res] -
      Pr[FO_MLKEM.UU.J.IND(FO_MLKEM.UU.RF.RF, FO_MLKEM.UU.D(FO_MLKEM.B1x2(A))).main() @ &m : res]| +
    2%r * (2 * FO_MLKEM.qHK + 2)%r * FO_MLKEM.UU.TT.PKE.eps_msg.
 move => fp kh1 hp1 kh2 hp2 kh3 hp3 kh4 hp4 kh5 hp5 kh6 hp6 kh7 hp7 ep1 ep2 ep3 ep4 ep5 ep6 ep7 qHTv qHUv qHv qV0 qP0 qHCub qHClb Aqb All.
 have := mlkem_spec_security_pre A &m failprob (hsadv+prfadv) prfadv fp _ _ _ _ _ _ _ _ _ _ _ _ _ _ qHTv qHUv qHv qV0 qP0 qHCub qHClb Aqb All.  
 + by have  := kg_prg_bound (DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))) &m => /#.
 + by have  := kg_prg_bound (DC_KG(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))) &m => /#.
 + by have  := kg_prg_bound (DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO))) &m => /#.
 + by have  := kg_prg_bound (DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))) &m => /#.
 + by have  := kg_prg_bound (DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))) &m => /#.
 + by have  := kg_prg_bound (D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))) &m => /#.
 + by have  := kg_prg_bound (D_KG(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))) &m => /#.
 + by have  := enc_prg_bound (DC_ENC(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))) &m => /#.
 + by have  := enc_prg_bound (DC_ENC(FO_MLKEM.UU.TT.PKE.BOWp(FO_MLKEM.UU.TT.BasePKE, FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))) &m => /#.
 + by have  := enc_prg_bound (DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.TT.AdvCorr(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))), FO_MLKEM.UU.TT.PKEROM.RO.RO))) &m => /#.
 + by have  := enc_prg_bound (DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUCI(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))) &m => /#.
 + by have  := enc_prg_bound (DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.BUUC(FO_MLKEM.B1x2(A)), FO_MLKEM.UU.TT.PKEROM.RO.RO))) &m => /#.
 + by have  := enc_prg_bound (D_ENC(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.PKE.OWvsIND.BL(FO_MLKEM.UU.TT.AdvOW(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A))))))) &m => /#.
 + by have  := enc_prg_bound (D_ENC(FO_MLKEM.UU.TT.PKE.OWvsIND.Bowl(FO_MLKEM.UU.TT.AdvOWL_query(FO_MLKEM.UU.BUUOWMod(FO_MLKEM.B1x2(A)))))) &m => /#.
by smt().
qed.
end section.


section.

lemma mlkem_spec_correctness &m (failprob hsadv prfadv : real) : 

Pr[CorrectnessBound.main() @ &m : res] <= failprob =>

  `|Pr[HS_DEFS.IND(HS_DEFS.PRGr, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[HS_DEFS.IND(HS_DEFS.PRGi, B_HS_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= hsadv => 

    `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_KG(DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= prfadv =>


   `|Pr[PRF_DEFS.IND(NPRF.PRF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res] -
   Pr[PRF_DEFS.IND(NRF.RF, B_PRF_ENC(DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO)))).main() @ &m : res]| <= prfadv =>


    FO_MLKEM.UU.TT.qHC = 0 =>
    1 < FO_MLKEM.UU.TT.FinT.card =>

  Pr[ SPEC_MODEL.Correctness(SPEC_MODEL.RO.RO,MLKEM_Op).main() @ &m : res] <= 
      failprob + hsadv + 2%r*prfadv.
move => fp khb kpb eb qHC0 cardgt0.
have := mlkem_spec_correctness_pre &m failprob (hsadv +prfadv) prfadv fp _ _ qHC0 cardgt0.
 + by have  := kg_prg_bound (DC_KG(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO))) &m => /#.
 + by have  := enc_prg_bound (DC_ENC(FO_MLKEM.UU.TT.B(FO_MLKEM.UU.B_UC, FO_MLKEM.UU.TT.PKEROM.RO.RO))) &m => /#.
by smt().
qed. 

end section.
