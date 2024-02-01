require import AllCore  IntDiv Distr List DList KEM_ROM.
require import Array25 Array32 Array64 Array128 Array168 Array256 Array384.
require import Array768 Array960 Array1024 Array1152.
from Jasmin require import JWord.

require import MLWE_PKE_Hash.
require import GFq Rq  VecMat Sampling Symmetric Serialization.
require import InnerPKE MLKEM Correctness EncDecCorrectness MLKEMLib.

import Zq PolyVec PolyMat InnerPKE.

(* Rewriting the Spec in a way that allows applying computational
   assumptions on PRGs, as well as defining operators that
   can be used to instantiate the FO_MLKEM theory *)

(*****************************************************
We define a version of MLKEM spec that
uses external samplers. This is useful for 
syntactic reasons in the following proof
steps.
******************************************************)

(* The spec defines the semantics of the operator *)
op parse : W64.t Array25.t -> poly * W64.t Array25.t.

axiom parse_sem st : 
  phoare [ Parse(XOF).sample : XOF.state = st ==> 
     res = (parse st).`1 /\ XOF.state = (parse st).`2 ] = 1%r.

(* We know it terminates, but we don't prove it. *)
axiom Parser_ll  : islossless Parse(XOF).sample.

module Hmodule = {
    proc sampleA(sd : W8.t Array32.t) : polymat = { 
     var i,j,c;
     var a : polymat;
     a <- witness;
     i <- 0;
     while (i < kvec) {
        j <- 0;
        while (j < kvec) {
           XOF.init(sd,j,i);
           (c,XOF.state) <- parse XOF.state;
           a.[(i,j)] <- c;
           j <- j + 1;
        }
        i <- i + 1;
     }
     return a;      
    }

    proc sampleAT(sd : W8.t Array32.t) : polymat = { 
     var i,j,c;
     var a : polymat;
     a <- witness;
     i <- 0;
     while (i < kvec) {
        j <- 0;
        while (j < kvec) {
           XOF.init(sd,i,j);
           (c,XOF.state) <- parse XOF.state;
           a.[(i,j)] <- c;
           j <- j + 1;
        }
        i <- i + 1;
     }
     return a;      
    }
}.

lemma KSamplerA_ll  : islossless Hmodule.sampleA.
proc;while(0<=i<=kvec) (kvec - i) => *; last by auto => /#.
move => *;wp;while(0<=i<kvec && 0<=j<=kvec) (kvec - j) => *; last by auto => /#.
by move => *;inline *;auto => /> /#.
qed.

lemma KSamplerAT_ll : islossless Hmodule.sampleAT.
proc;while(0<=i<=kvec) (kvec - i) => *; last by auto => /#.
move => *;wp;while(0<=i<kvec && 0<=j<=kvec) (kvec - j) => *; last by auto => /#.
by move => *;inline *;auto => /> /#.
qed.

import KMatrix.Matrix.
equiv H_sem_equiv : 
 Hmodule.sampleAT  ~ Hmodule.sampleA : ={arg} ==> res{1} = trmx res{2}.
proof. 
proc. 
inline XOF.init.
unroll for {1} 3;unroll for {2} 3.
unroll for {1} 10; unroll for {2} 10.
unroll for {1} 7; unroll for {2} 7.
unroll for {1} 4; unroll for {2} 4.
auto => /> &2. 
apply eq_matrixP => i j rng.
have rnji := mrangeL _ _ rng.
have rnjj := mrangeR _ _ rng.
by rewrite trmxE !setmE /= !offunmE //= !offunmK /mclamp rng /= /#. 
qed.

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
have sizex : size x = 32 by smt(supp_dlist_size).
have sizey : size y = 32 by smt(supp_dlist_size).
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

require FLPRG PRF.
clone FLPRG as HS_DEFS with
  type seed <- W8.t Array32.t, 
  type output <- W8.t Array32.t * W8.t Array32.t,
  op dseed <- srand,
  op dout <- dRO,
  op prg <- G_coins
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
  CBD2_PRF(NPRF.PRF).sample ~ CBD2.sample :
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
        res = cbd2sample (SHAKE256_33_128 _k (W8.of_int _N)) ] = 1%r.
bypr => &m0 [#] kv ->.
have /=  <- := cbd2sample_opsem &m0 (cbd2sample (SHAKE256_33_128 _k (W8.of_int _N))) (SHAKE256_33_128 _k (W8.of_int _N)).
by  byequiv (cbd_correct) => /#.
qed.

import PolyVec PolyMat.

module MLKEM_PRGs = {
  proc prg_kg(coins:W8.t Array32.t) : W8.t Array32.t * polyvec * polyvec = {
    var noise1 : polyvec;
    var noise2 : polyvec;
    var _N,i,c,rho,noiseseed;
    (rho, noiseseed) <- G_coins coins;
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

op H : W8.t Array32.t -> polymat.

(* This fixes the definition of H in terms of the MLKEM spec *)
axiom H_sem _seed :
    phoare [ Hmodule.sampleA : sd = _seed ==> res = nttm (H _seed) ] = 1%r.

op prg_kg_inner(coins :  W8.t Array32.t) : W8.t Array32.t * polyvec * polyvec =
   ((G_coins coins).`1, 
    KMatrix.Vector.offunv (fun i => cbd2sample (Symmetric.PRF (G_coins coins).`2 (W8.of_int i))),
    KMatrix.Vector.offunv (fun i => cbd2sample (Symmetric.PRF (G_coins coins).`2 (W8.of_int (i + 3))))).

op prg_enc_inner(coins :  W8.t Array32.t) : polyvec * polyvec * poly =
   (KMatrix.Vector.offunv (fun i => cbd2sample (Symmetric.PRF coins (W8.of_int i))),
    KMatrix.Vector.offunv (fun i => cbd2sample (Symmetric.PRF coins (W8.of_int (i + 3)))), 
    cbd2sample (Symmetric.PRF coins (W8.of_int 6))).

lemma prg_kg_sem _coins : 
   phoare [ MLKEM_PRGs.prg_kg : coins = _coins ==> res = prg_kg_inner _coins ] = 1%r.
proc.
unroll for 9; unroll for 7.
wp;call (cbd2prfsem ((G_coins _coins).`2) 5). 
wp;call (cbd2prfsem ((G_coins _coins).`2) 4). 
wp;call (cbd2prfsem ((G_coins _coins).`2) 3). 
wp;call (cbd2prfsem ((G_coins _coins).`2) 2). 
wp;call (cbd2prfsem ((G_coins _coins).`2) 1). 
wp;call (cbd2prfsem ((G_coins _coins).`2) 0). 
by auto => />; rewrite /prg_kg_inner /= !KMatrix.Vector.eq_vectorP;split;
    move => i ib;rewrite !setvE /= !KMatrix.Vector.offunvE /= 1,2:/# 
     !KMatrix.Vector.offunvK /vclamp /= /kvec /= /#.
qed.

lemma prg_enc_sem _coins : 
   phoare [ MLKEM_PRGs.prg_enc : noiseseed = _coins ==> res = prg_enc_inner _coins ] = 1%r.
proc.
unroll for 8; unroll for 6.
wp;call (cbd2prfsem _coins 6). 
wp;call (cbd2prfsem _coins 5). 
wp;call (cbd2prfsem _coins 4). 
wp;call (cbd2prfsem _coins 3). 
wp;call (cbd2prfsem _coins 2). 
wp;call (cbd2prfsem _coins 1). 
wp;call (cbd2prfsem _coins 0). 
by auto => />; rewrite /prg_enc_inner /= !KMatrix.Vector.eq_vectorP; do split;1,2:
    move => i ib;rewrite !setvE /= !KMatrix.Vector.offunvE /= 1,2:/# 
     !KMatrix.Vector.offunvK /vclamp /= /kvec /= /#.
qed.

lemma H_T_sem _seed :
    phoare [ Hmodule.sampleAT : sd = _seed ==> res = nttm (trmx (H _seed)) ] = 1%r.
conseq (H_sem_equiv)  (H_sem _seed); 1: smt().
auto => />.
rewrite /nttm eq_matrixP => i j rng; rewrite mapmE /= !offunmE //= offunmE 1:/# /=.
congr.
by rewrite offunmK /mclamp rng.
qed.


phoare sem_decode1  a : [ EncDec.decode1  : arg = a ==>  res = decode1  a ] = 1%r
 by bypr => &m ->; have /= := (decode1_opsem &m (decode1 a) a).
phoare sem_encode1  a : [ EncDec.encode1  : arg = a ==>  res = encode1  a ] = 1%r
 by bypr => &m ->; have /= := (encode1_opsem &m (encode1 a) a).
phoare sem_encode4  a : [ EncDec.encode4  : arg = a ==>  res = encode4  a ] = 1%r
 by bypr => &m ->; have /= := (encode4_opsem &m (encode4 a) a).
phoare sem_decode4  a : [ EncDec.decode4  : arg = a ==>  res = decode4  a ] = 1%r
 by bypr => &m ->; have /= := (decode4_opsem &m (decode4 a) a).

phoare sem_encode10_vec a : [ EncDec.encode10_vec : arg = a ==> res = encode10_vec_aux a ] = 1%r.
proof. 
 bypr => &m ->; have /= <- := (encode10_vec_aux_opsem &m (encode10_vec_aux a) a).
 by byequiv (encode10_vec_aux) => //.
qed.

phoare sem_decode10_vec a : [ EncDec.decode10_vec : arg = a ==> res = decode10_vec_aux a ] = 1%r.
proof. 
 bypr => &m ->; have /= <- := (decode10_vec_aux_opsem &m (decode10_vec_aux a) a).
 by byequiv (decode10_vec_aux) => //.
qed.

phoare sem_encode12_vec a : [ EncDec.encode12_vec : arg = a ==> res = encode12_vec_aux a ] = 1%r.
proof. 
 bypr => &m ->; have /= <- := (encode12_vec_aux_opsem &m (encode12_vec_aux a) a).
 by byequiv (encode12_vec_aux) => //.
qed.

phoare sem_decode12_vec a : [ EncDec.decode12_vec : arg = a ==> res = decode12_vec_aux a ] = 1%r.
proof. 
 bypr => &m ->; have /= <- := (decode12_vec_aux_opsem &m (decode12_vec_aux a) a).
 by byequiv (decode12_vec_aux) => //.
qed.

module InnerPKE_Op = {

  (* Spec gives a derandomized enc that matches this code *)
  proc kg_derand(coins: W8.t Array32.t) : pkey * skey = {
     var t,rho;
     var tv,sv : W8.t Array1152.t;
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
     tv <- encode12_vec_aux (toipolyvec t); 
     sv <- encode12_vec_aux (toipolyvec s); 
     return ((tv,rho),sv);
  }

  (* Spec gives a derandomized enc that matches this code *)
  proc enc_derand(pk : pkey, m : plaintext, r : W8.t Array32.t) : ciphertext = {
      var tv,rho,rv,e1,e2,rhat,u,v,mp,c2,thati;
      var that : polyvec;
      var aT : polymat;
      var c1 : W8.t Array960.t;
      aT <- witness;
      c1 <- witness;
      e1 <- witness;
      rv <- witness;
      that <- witness;
      (rv,e1,e2) <- prg_enc_inner r;
      (tv,rho) <- pk;
      thati <- decode12_vec_aux tv; 
      that <- ofipolyvec thati;
      aT <- nttm (trmx (H rho));    
      rhat <- nttv rv;
      u <- (invnttv (ntt_mmul aT rhat) + e1)%PolyVec;
      mp <- decode1 m;
      v <- invntt (ntt_dotp that rhat) &+ e2 &+ decompress_poly 1 mp; 
      c1 <- encode10_vec_aux (compress_polyvec 10 u); 
      c2 <- encode4 (compress_poly 4 v);
      return (c1,c2);
  }

  proc dec(sk : skey, cph : ciphertext) : plaintext option = {
      var m,mp,ui,v,vi,si, c1, c2;
      var u,s : polyvec;
      u <- witness;
      s <- witness;
      (c1,c2) <- cph;
      ui <- decode10_vec_aux c1;
      u <- decompress_polyvec 10 ui;
      vi <- decode4 c2;
      v <- decompress_poly 4 vi;
      si <- decode12_vec_aux sk;
      s <- ofipolyvec si;
      mp <- v &+ ((&-) (invntt (ntt_dotp s (nttv u))));
      m <- encode1 (compress_poly 1 mp);
      return Some m;
  }

}.

import KMatrix Vector.

(* Fixme: move to Matrix *)
lemma getv_setvE x i j (v : polyvec) : 
  (v.[i <- x].[j])%Vector = if (0 <= j < kvec) then if (i = j) then x else (v.[j])%Vector else Rq.zero
   by smt(setvE getvE getv_out offunvE).

(* We have something equivalent to the spec *)
import Symmetric.


lemma kg_sampler_kg  :
  equiv [  InnerPKE_Op.kg_derand ~ InnerPKE.kg_derand : 
     ={arg}==> ={res}].
proc. 
ecall{2}(sem_encode12_vec (toipolyvec s{2})).
ecall{2}(sem_encode12_vec (toipolyvec t{2})).
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
inline CBD2.sample.
inline PseudoRF.f.
while (noise1{1} = s{2} /\ rho{1} = rho{2} /\ noiseseed{1} = sig{2} /\
       ={i,_N,a} /\ NPRF.PRF.k{1} = sig{2} /\
       0<=i{1}<=kvec /\ 
       forall k, 0 <=k < i{1} => (noise2{1}.[k])%Vector = (e{2}.[k])%Vector).
+ wp; conseq(_: ={rr0}); 1: by smt(getv_setvE).  
  by inline*; sim; auto => />. 
wp;conseq (: noise1{1} = s{2} /\ 
             rho{1} = rho{2} /\
             NPRF.PRF.k{1} = sig{2} /\
             noiseseed{1} = sig{2} /\
             ={_N, a}); first by smt(eq_vectorP).

while (rho{1} = rho{2} /\ noiseseed{1} = sig{2} /\
       ={i,_N,a} /\ NPRF.PRF.k{1} = sig{2} /\
       0<=i{1}<=kvec /\ 
       forall k, 0 <=k < i{1} => (noise1{1}.[k])%Vector = (s{2}.[k])%Vector).
+ wp; conseq(_: ={rr}); 1: by smt(getv_setvE).  
  by inline*; sim; auto => />. 
inline {1} 6.
sp;wp;conseq  (: rho{1} = rho{2} /\ 
             noiseseed{1} = sig{2} /\
             a2{1} = a{2}); 1: by auto => />; by smt(eq_vectorP).
while (#post /\ sd{1} = rho{1} /\ i2{1} = i{2} /\ 0<=i2{1}<=kvec); last by auto => /> /#.
wp;while (#post /\ j1{1} = j{2} /\ 0<=j1{1}<=kvec); 
     last by auto => /> /#.
wp;ecall{2} (parse_sem XOF.state{2}). 
by inline *; auto => /> /#.
qed.

lemma enc_sampler_enc  :
 equiv [
   InnerPKE_Op.enc_derand ~ InnerPKE.enc_derand : 
    ={arg}  ==> ={res}].
proc. 
ecall{2}(sem_encode4 (compress_poly 4 v{2})).
ecall{2}(sem_encode10_vec (compress_polyvec 10 u{2})).
wp 10 19;ecall{2}(sem_decode1 (m{2})).
wp 10 16. 
swap {1} [7..10] -1.  swap {2} [8..9] -1. swap {2} 1 7.
seq 8 7 : (={pk,m,c1,e1,rv,that,tv,rho,thati,that} /\ r{1} = coins{2});
   1: by wp; ecall{2}(sem_decode12_vec (tv{2}));auto.
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
       forall k, 0 <=k < i{1} => (noise2{1}.[k])%Vector = (e1{2}.[k])%Vector).
+ inline *;wp;conseq(_: ={rr0}); 1: by smt(getv_setvE).  by inline*; sim; auto => />. 
wp;conseq (: ={that,_N,m,aT} /\
  noise1{1} = rv{2} /\ NPRF.PRF.k{1} = coins{2} /\
  noiseseed{1} = coins{2}); first by smt(eq_vectorP).
while (={i, that, _N, m, aT} /\ noiseseed{1} = coins{2} /\
       0<=i{1}<=kvec /\ NPRF.PRF.k{1} = coins{2} /\
       forall k, 0 <=k < i{1} => (noise1{1}.[k])%Vector = (rv{2}.[k])%Vector).
+ inline *;wp; conseq(_: ={rr0}); 1: by smt(getv_setvE).  
  by inline*; sim; auto => />. 
inline {1} 1.
sp;wp;conseq (: ={that, m} /\ a0{1} = aT{2} /\ r{1} = coins{2}); 1: by smt(eq_vectorP).
while (#post /\ sd{1} = rho{2} /\  i1{1} = i{2} /\ r{1} = coins{2} /\ 0<=i1{1}<=kvec); last by auto => />. 

wp;while (#post /\ i1{1} = i{2} /\ j0{1} = j{2} /\ 0<=j0{1}<=kvec); 
     last by auto => /> /#.
wp;ecall{2} (parse_sem XOF.state{2}). 
by inline *; auto => />  /#.
qed.

lemma dec_sampler_dec :
  equiv [ InnerPKE_Op.dec ~ InnerPKE.dec : 
     ={arg}  ==> res{1} = Some res{2} ].
proc. 
ecall{2}(sem_encode1 (compress_poly 1 mp{2})).
wp;ecall{2}(sem_decode12_vec (sk{2})).
wp;ecall{2}(sem_decode4 (c2{2})).
wp;ecall{2}(sem_decode10_vec (c1{2})).
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
    var skp : Top.InnerPKE.InnerPKE.skey;
    var pk : Top.InnerPKE.InnerPKE.pkey;
    var hpk : W8.t Array32.t;
    var z : W8.t Array32.t;
    var c : Top.InnerPKE.InnerPKE.ciphertext;
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
  MLKEM_Op(DummyRO).kg_derand ~ MLKEM.kg_derand : ={arg} ==> ={res} by proc;wp; call (kg_sampler_kg); auto => />.

equiv enc_bridge :
  MLKEM_Op(DummyRO).enc_derand ~ MLKEM.enc_derand : ={arg} ==> ={res} by 
  proc;wp; call (enc_sampler_enc);inline *; auto => />.

equiv dec_bridge :
  MLKEM_Op(DummyRO).dec ~ MLKEM.dec : arg{1}.`1 = arg{2}.`2 /\ arg{1}.`2 = arg{2}.`1 ==> res{1} = Some res{2} 
by proc;wp;call(enc_sampler_enc);inline {1} 3;wp;call(dec_sampler_dec);auto => />.



(************************************************************************)


(*******************************************************************)
(*    The security definitions for the spec                        *)
(*   Types correspond to implementation types                      *)
(*******************************************************************)

import KMatrix PolyVec PolyMat InnerPKE Zq.

op pk_encode(pk : W8.t Array32.t * polyvec) : pkey = 
                                  (encode12_vec_aux (toipolyvec (nttv pk.`2)), pk.`1).
op pk_decode(pk : pkey) = (pk.`2, invnttv (ofipolyvec (sem_decode12_vec (pk.`1)))).
op sk_encode(sk : polyvec) : skey = encode12_vec_aux (toipolyvec (nttv sk)).
op sk_decode(sk : skey) =  invnttv (ofipolyvec (sem_decode12_vec sk)).
op m_encode(m : plaintext) : poly = decompress_poly 1 (sem_decode1 m).
op m_decode(p : poly) : plaintext = encode1 (compress_poly 1 p). 
op c_encode(c :  polyvec * poly) : ciphertext = 
      (encode10_vec_aux (compress_polyvec 10 c.`1), encode4 (compress_poly 4 c.`2)).
op c_decode(c : ciphertext) =
      (decompress_polyvec 10 (sem_decode10_vec c.`1), decompress_poly 4 (sem_decode4 c.`2)).

lemma pk_encodeK : cancel pk_encode pk_decode.
rewrite /pk_decode /pk_encode /cancel /= => x.
rewrite sem_decode12_vec_corr -sem_encode12_vecK; last by rewrite toipolyvecK invnttvK /#.
move => i ib; rewrite /toipolyvec !mapiE /= 1:ib.
by smt(rg_asint qE).
qed.

lemma sk_encodeK: cancel sk_encode sk_decode.
rewrite /sk_decode /sk_encode /cancel /= => x.
rewrite sem_decode12_vec_corr  -sem_encode12_vecK; last by rewrite toipolyvecK invnttvK /#.
move => i ib; rewrite /toipolyvec !mapiE /= 1:ib.
by smt(rg_asint qE).
qed.

op rnd_err_v = compress_poly_err 4. 
op rnd_err_u = mapv (compress_poly_err 10). 

op max_noise = q %/ 4 - 1.
op under_noise_bound (p : poly) (b : int) =
     all (fun cc => `| as_sint cc| <= b) p.

op cv_bound_max : int = 104. (* this is the compress error bound for d = 4 *)


(* This will bring into context a ROM definition which has
   the same types as the ROM we will use for the Spec *)
clone import MLWE_PKE_Hash as MLWEPKEHash with
  type MLWE_.seed <- W8.t Array32.t,
  type MLWE_.Matrix_.R <- poly,
  type MLWE_.Matrix_.Matrix.matrix <- polymat,
  type MLWE_.Matrix_.vector <- polyvec,
  type MLWE_.Matrix_.ZR.t <- poly,
  pred MLWE_.Matrix_.ZR.unit <- KMatrix.ZR.unit,
  type FO_MLKEM.UU.key <- sharedsecret,
  type plaintext <- plaintext,
  type randomness <- W8.t Array32.t,
  type ciphertext <- W8.t Array960.t * W8.t Array128.t,
  type FO_MLKEM.UU.PseudoRF.K <- sharedsecret,
  type FO_MLKEM.pkhash <- W8.t Array32.t,
  op FO_MLKEM.pkh <- H_pk,
  type pkey <- publickey,
  type skey <- W8.t Array1152.t,
  op MLWE_.H <- H,
  op prg_kg <- prg_kg_inner,
  op prg_enc <- prg_enc_inner,
  op MLWE_.Matrix_.ZR.(+) <- Rq.(&+),
  op MLWE_.Matrix_.ZR.([-]) <- Rq.(&-),
  op MLWE_.Matrix_.ZR.zeror <- Rq.zero,
  op MLWE_.Matrix_.ZR.oner <- Rq.one,
  op MLWE_.Matrix_.ZR.( * ) <- Rq.(&*),
  op MLWE_.Matrix_.ZR.invr <- Top.Correctness.invr, (* FIXME: Why Top *)
  op MLWE_.Matrix_.size <- kvec,
  op MLWE_.Matrix_.Vector.(+) <- Top.Correctness.KMatrix.Vector.(+),
  op MLWE_.Matrix_.Vector.dotp <- dotp,
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
  op MLWE_.dseed <- srand,
  op m_encode <- m_encode,
  op m_decode <- m_decode,
  op pk_encode <- pk_encode,
  op pk_decode <- pk_decode,
  op sk_encode <- sk_encode,
  op sk_decode <- sk_decode,
  op c_encode <- c_encode,
  op c_decode <- c_decode,
  op under_noise_bound <- under_noise_bound,
  op max_noise <- max_noise,
  op cv_bound_max <- cv_bound_max,
  op rnd_err_u <- rnd_err_u,
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
  proof MLWE_.Matrix_.Vector.tofunv_prevector by apply tofunv_prevector
  proof MLWE_.Matrix_.Vector.tofunvK by apply tofunvK
  proof MLWE_.Matrix_.Vector.offunvK by apply offunvK
  proof MLWE_.Matrix_.Matrix.tofunm_prematrix by apply tofunm_prematrix
  proof MLWE_.Matrix_.Matrix.tofunmK by apply tofunmK
  proof MLWE_.Matrix_.Matrix.offunmK by apply offunmK
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
rewrite sem_decode12_vec_corr -sem_encode12_vecK; last by rewrite toipolyvecK invnttvK /#.
move => i ib; rewrite /toipolyvec !mapiE /= 1:ib.
by smt(rg_asint qE).
qed.

realize sk_encodeK.
rewrite /sk_decode /sk_encode /cancel /= => x.
rewrite sem_decode12_vec_corr  -sem_encode12_vecK; last by rewrite toipolyvecK invnttvK /#.
move => i ib; rewrite /toipolyvec !mapiE /= 1:ib.
by smt(rg_asint qE).
qed.

realize encode_noise.
move => /> u v.
rewrite /c_decode /c_encode /rnd_err_u /rnd_err_v /z sem_decode10_vec_corr /= -sem_encode10_vecK.
+ move => i ib; rewrite /compress_polyvec !mapiE /= 1:ib /compress /= /#.
rewrite sem_decode4_corr -sem_encode4K /=.
  by move => i ib; rewrite /compress_poly !mapiE /= 1:ib /compress /= /#.
split; last  by rewrite round_poly_errE.
rewrite /(+) mapvE /=.
apply eq_vectorP => /> i il ih. rewrite !offunvE /=;1: smt(). 
rewrite offunvE 1:/# /= /compress_poly_err /=.
apply Array256.tP => k kb.
rewrite /decompress_polyvec /compress_polyvec /= /fromarray256 /= /Rq.(&+) !getvE !setvE /= !offunvE 1:/# /=.
case (i = 2).
+ move => -> /=;
 rewrite mapiE // map2E //= initiE //= initiE //= mapiE //= 1:/# initiE 1:/# /=. 
 rewrite decompress_errE //; 1: smt(qE).
 by rewrite mapiE /#.
case (i = 1).
+ move => -> /=.
 rewrite !offunvK /vclamp /kvec /=  mapiE // map2E //= initiE //= initiE //= mapiE //= 1:/# initiE 1:/# /=. 
 rewrite decompress_errE //; 1: smt(qE).
 by rewrite mapiE /#.
move => *;rewrite ifF 1:/# !offunvK /vclamp /kvec /= ifT 1:/# ifF 1:/# ifT 1:/# ifT 1:/#.
 rewrite mapiE // map2E //= initiE //= initiE //= mapiE //= 1:/# initiE 1:/# /=. 
 rewrite decompress_errE //; 1: smt(qE).
 by rewrite mapiE /#.
qed.

realize good_decode.
rewrite /under_noise_bound /m_encode /m_decode /compress_poly 
        /decompress_poly /max_noise qE /= => m n.
rewrite allP  => /=  hgood.
rewrite sem_decode1_corr.
have : decode1 (encode1 (map (compress 1) (map (decompress 1) (decode1 m) &+ n))) = 
       (decode1 m); last by smt(sem_decode1K).
apply Array256.ext_eq => /> x h0x hx256. 
rewrite -sem_encode1K. 
+ move => i ib; rewrite !mapiE /= 1:ib /compress /= /#.
rewrite /(&+) mapiE 1:/# map2E /= initiE /= 1:/# mapiE 1:/#.
rewrite -sem_decode1_corr.
have [->|->] /=: (sem_decode1 m).[x]=0 \/ (sem_decode1 m).[x]=1
 by smt(sem_decode1_bnd).
 rewrite /decompress /=.
 rewrite from_int_round.
 rewrite -{1}zeroE asintK Zq.ZModule.add0r compress1_is0 // Bq1E.
 smt().
rewrite /decompress /round /=.
have ->: q%r / 2%r + inv 2%r = (q%r+1%r)/2%r
 by field; smt().
rewrite qE -fromintD -divz_floor //=.
have: compress 1 (incoeff 1665 + n.[x]) <> 0.
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
by rewrite /compress /=; smt(ltz_pmod modz_ge0).
qed.

realize cv_bound_valid.
move=> A s e r e2 m ???? t v.
rewrite /under_noise_bound /rnd_err_v /compress_poly_err /cv_bound.
rewrite allP /compress_err => i Hi /=.
rewrite mapiE //= -Bq4E.
by move: (compress_err_bound v.[i] 4 _ _) => //= /#.
qed.

realize noise_commutes.
move => n n' maxn b H H0.
move : H H0; rewrite /under_noise_bound.
rewrite !allP.
move => Hn Hnp i ib.
move : (Hn i ib). 
move : (Hnp i ib) => /=. 
rewrite /as_sint /Rq.(&+) /= map2E !initiE //= Zq.addE qE /= !StdOrder.IntOrder.ler_norml /= => Hni Hnpi.
by smt().
qed.

realize noise_preserved.
move => n maxn. 
rewrite /under_noise_bound.
rewrite !allP. 
rewrite eq_iff; split => /=. 
move => H i ib; move : (H i ib).
rewrite /(&-) mapiE 1:/#.
rewrite as_sintN /= /#. 
move => H i ib; move : (H i ib).
rewrite /(&-) mapiE 1:/#.
rewrite as_sintN /= /#. 
qed.


(*******************************************************************)
(* At this point we get some nice equivalences to the abstract sch *)
(*******************************************************************)

require import EncDecCorrectness.
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
rewrite /pk_encode /sk_encode /= /= polyvecD.
by rewrite -!polyvecD comm_nttv_add comm_nttv_mmul. 
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
+ auto => />; rewrite /enc /= /pk_decode /m_encode /c_encode.
  rewrite !sem_decode1_corr => &2 m r.
  have -> /= : prg_enc_inner r = 
   ((prg_enc_inner r).`1,(prg_enc_inner r).`2,(prg_enc_inner r).`3) by smt().
  split; congr; congr. 
  + by rewrite -!polyvecD -comm_nttv_mmul invnttvK.
  by rewrite comm_ntt_dotp sem_decode12_vec_corr.

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
+ by auto => />;rewrite /dec /m_encode /c_decode /m_decode /sk_decode sem_decode4_corr /= => &1 &2;
  split;congr;congr;congr;congr;
  by rewrite comm_ntt_dotp sem_decode10_vec_corr sem_decode12_vec_corr.

seq 2 2 : (#pre /\ ks{1} = _K{2} /\ ={r} /\ kn{1} = _K'{2}); 1: by  inline *;auto => />.
seq 1 20 : (#pre /\ c'{1} = c{2}); last by auto => />.
auto => />; rewrite /enc /= /pk_decode /m_encode /c_encode.
rewrite !sem_decode1_corr => &1 &2. 
have -> /= : prg_enc_inner r{2} = 
 ((prg_enc_inner r{2}).`1,(prg_enc_inner r{2}).`2,(prg_enc_inner r{2}).`3) by smt().
split; congr; congr. 
+ by rewrite -!polyvecD -comm_nttv_mmul invnttvK.
by rewrite comm_ntt_dotp sem_decode12_vec_corr.
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

section.

declare module  A <: PRG_KG.Distinguisher { -NPRF.PRF, -NRF.RF}.

module (B_HS_KG(A : PRG_KG.Distinguisher) : HS_DEFS.Distinguisher)  = {

   proc distinguish(rho sig : W8.t Array32.t) : bool = {
      var b,x;
      x <@ MLKEM_PRGs_O(NPRF.PRF).prg_kg_hs(rho,sig);
      b <@ A.distinguish(x);
      return b;
   }
}.

module (B_PRF_KG(A : PRG_KG.Distinguisher) : PRF_DEFS.Distinguisher) (O : PRF_DEFS.PRF_Oracles) = {
   proc distinguish() : bool = {
      var b,x;
      x <@ MLKEM_PRGs_O(O).prg_kg_prf();
      b <@ A.distinguish(x);
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
  transitivity {1} {sd <$ srand; x <@ MLKEM_PRGs.prg_kg(sd);} 
        (true ==> ={x})
        (true ==> x{1} = x0{2});1,2: smt(). 
  + wp;ecall{2} (prg_kg_sem sd{2}).
    by auto => />.
  inline {1} 2; inline {2} 6.
  by sim;auto => />.

have -> : Pr[HS_DEFS.IND(HS_DEFS.PRGi, B_HS_KG(A)).main() @ &m : res] =
          Pr[PRF_DEFS.IND(PRF, B_PRF_KG(A)).main() @ &m : res].
+ byequiv => //.
  proc; inline {1} 3; inline {2} 2;wp; call(: true) => />. 
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
       (true ==> ={x})
       (true ==> ={x}); 1,2: smt().
+ transitivity {2} { rho <$ srand; noise1 <@ CBD2rnd.sample_vec_ideal(); noise2 <@ CBD2rnd.sample_vec_ideal(); x <- (rho,noise1,noise2); }
       (true ==> ={x})
       (true ==> ={x}); 1,2: smt().
   + inline *. swap {1} 3 -2. swap {2} 3 1. 
     wp;rnd{1};conseq (:r{1} = (rho{2}, v{2}, v0{2})); 1: smt().
     by rndsem* {2} 0;auto => /> /#.
  by symmetry;wp; do 2!call(CBD2rnd_vec_equiv); auto => />.

 seq 1 5: (_N{2} = 0 /\ ={rho} /\
     forall (x:W8.t), SmtMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  + inline *; swap {2} 1 1; auto;conseq (: _ ==> ={rho}); 1:by smt(SmtMap.mem_empty).
    rndsem*{2} 0; auto => />.
    have -> : (dfst dRO) = srand; last by smt().
    apply eq_distr => x;rewrite dmap1E.
    have -> : (pred1 x \o fun (p : W8.t Array32.t * W8.t Array32.t) => p.`1) = 
              (fun (xy : _ * _) => ((pred1 x) xy.`1) /\ (predT xy.`2)) by smt().
    have -> := dprodE (pred1 x) predT srand srand.
    by rewrite srand_ll /=.
    
 seq 1 2: (={noise1,rho} /\ _N{2} = 3 /\
           forall (x:W8.t), SmtMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  inline*; wp.
  while (i0{1} = i{2} /\ 0 <= i{2} <= kvec /\ _N{2}=i{2} /\
         (forall k, 0 <= k < i{2} => (v{1}.[k]=noise1{2}.[k])%PolyVec) /\
         forall (x:W8.t), SmtMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
   rcondt {2} 4.
   +  move=> *; wp; skip => &hr /> ??? Hm ?.
      rewrite -implybF => H.
      by move: (Hm _ H); rewrite implybF of_uintK /#.
   wp; while (#[/:4,7:]pre /\ ={bytes} /\ i1{1} = i0{2} /\ 0 <= i0{2} <= 128 /\ j{2} = i0{2}*2 /\
              (forall (x1 : W8.t), SmtMap.dom RF.m{2} x1 => to_uint x1 <= _N{2}) /\
              forall k, 0 <= k < j{2} => p0{1}.[k] = rr{2}.[k]).
    auto => />. move => &1 &2 *; do split; 1..3:smt().
    move=> k ?? /=.
    case: (k= 2*i0{2}) => E1.
     by rewrite set_neqiE 1..2:/# set_eqiE 1..2:/# set_neqiE 1..2:/# set_eqiE /#. 
    case: (k= 2*i0{2}+1) => E2.
     by rewrite set_eqiE 1..2:/# set_eqiE /#.
    by rewrite set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE /#. 
   wp; rnd; wp; skip => /> &1 &2; rewrite !setvE !getvE => ?????????; split.
    split; 1:   by rewrite SmtMap.get_set_sameE.
    move=> x; case: (x=W8.of_int i{2}) => E.
     by move=> _; rewrite E of_uintK modz_small /#.
    rewrite SmtMap.domE SmtMap.get_set_neqE 1:// => H. 
    by apply StdOrder.IntOrder.ltrW; smt().
   move => p1 i0 p2 ?????? H; split; first smt().
   have EE: p1 = p2.
    by apply Array256.tP => k kb; apply H; smt().
   split; last smt().
   move=> k HkL HkR; case: (k = i{2}) => E.
    by rewrite /set E !offunvE /= /#.
   by rewrite /set !offunvE /= 1..2:/# (eq_sym _ k) E /= /#.
  auto => /> &1 &2; split; first smt().
  move=> v1 m i v2 => ??????; split; last smt().
  apply eq_vectorP => k kb;smt(setvE getvE).
 wp; seq 2 2: (={rho,noise1,noise2} /\ _N{2} = 6 /\
           forall (x:W8.t), SmtMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  inline*; wp.
  while (i0{1} = i{2} /\ 0 <= i{2} <= kvec /\ _N{2}=3+i{2} /\ noise1{1}=noise1{2} /\
         (forall k, 0 <= k < i{2} => (v{1}.[k]=noise2{2}.[k])%PolyVec) /\
         forall (x:W8.t), SmtMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
   rcondt {2} 4.
    move=> *; wp; skip => &hr /> ??? Hm ?.
    rewrite -implybF => H.
    by move: (Hm _ H); rewrite implybF of_uintK /#.
   wp; while (#[/:5,8:]pre /\ bytes{1}=bytes{2} /\ i1{1}=i0{2} /\ 0 <= i0{2} <= 128 /\ j{2} = i0{2}*2 /\
              (forall (x1 : W8.t), SmtMap.dom RF.m{2} x1 => to_uint x1 <= _N{2}) /\
              forall k, 0 <= k < j{2} => p0{1}.[k] = rr{2}.[k]).
    wp; skip => /> &1&2 *; split; first smt().    
    split; first smt().
    move=> k ?? /=.
    case: (k= 2*i0{2}) => E1.
     by rewrite set_neqiE 1..2:/# set_eqiE 1..2:/# set_neqiE 1..2:/# set_eqiE /#. 
    case: (k= 2*i0{2}+1) => E2.
     by rewrite set_eqiE 1..2:/# set_eqiE /#.
    by rewrite set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE /#.
   wp; rnd; wp; skip => /> &1 &2; rewrite !getvE !setvE => ?????????; split.
    split; 1:  by rewrite SmtMap.get_set_sameE.
    move=> x; case: (x=W8.of_int (3+i{2})) => E.
     by move=> _; rewrite E of_uintK modz_small /#.
    rewrite SmtMap.domE SmtMap.get_set_neqE 1:// => H. 
    by apply StdOrder.IntOrder.ltrW; smt().
   move => p1 i1 p2 ?????? H; split; first smt().
   have EE: p1 = p2.
    by apply Array256.tP => k kb; apply H; smt().
   split; first smt().
   split; last smt().
   move=> k HkL HkR; case: (k = i{2}) => E.
    by rewrite /set E !offunvE /= /#.
   by rewrite /set !offunvE /= 1..2:/# (eq_sym _ k) E /= /#.
  auto => /> &1 &2; split; first smt().
  move=> v1 m i v2 ??????; split; last smt().
  by apply eq_vectorP => k kb;smt(setvE getvE).
 by auto.
qed.

end section.

module (B_PRF_ENC(A : PRG_ENC.Distinguisher) : PRF_DEFS.Distinguisher) (O : PRF_DEFS.PRF_Oracles) = {

   proc distinguish() : bool = {
      var b,x;
      x <@ MLKEM_PRGs_O(O).prg_enc();
      b <@ A.distinguish(x);
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
   transitivity {1} {sd <$ srand; x <@ MLKEM_PRGs.prg_enc(sd);} 
        (true ==> ={x})
        (true ==> x{1} = x{2});1,2: smt(). 
  + wp;ecall{2} (prg_enc_sem sd{2}).
    by auto => />.
  inline {1} 2; inline {2} 2.
  by sim;inline *;auto => />.

have -> : Pr[PRG_ENC.IND(PRG_ENC.PRGi, A).main() @ &m : res] = 
          Pr[PRF_DEFS.IND(RF, B_PRF_ENC(A)).main() @ &m : res]; last by smt().
byequiv => //.
proc; inline {2} 2;wp;call(: true).
inline {1} 2. inline {2} 1. inline {2} 2. conseq />.
transitivity {2} { noise1 <@ CBD2rnd.sample_vec_real(); noise2 <@ CBD2rnd.sample_vec_real(); e2 <@ CBD2rnd.sample_real(); x <- (noise1,noise2,e2); }
       (true ==> ={x})
       (true ==> ={x}); 1,2: smt().
+ transitivity {2} { noise1 <@ CBD2rnd.sample_vec_ideal(); noise2 <@ CBD2rnd.sample_vec_ideal(); e2 <@ CBD2rnd.sample_ideal(); x <- (noise1,noise2,e2); }
       (true ==> ={x})
       (true ==> ={x}); 1,2: smt().
   + inline *. swap {1} [1..2] 1. swap {2} 4 1. swap {2} 2 3.
     wp;rnd{1}. conseq(: _ ==> r{1} = (v{2}, v0{2}, p{2}));1: by smt().
     by rndsem*{2} 0;auto => /> /#.
  by symmetry;wp; call(CBD2rnd_equiv); do 2!call(CBD2rnd_vec_equiv); auto => />.

 seq 0 4: (_N{2} = 0 /\ 
     forall (x:W8.t), SmtMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  + by auto => />;smt(SmtMap.mem_empty).
    
 seq 1 2: (={noise1} /\ _N{2} = 3 /\
           forall (x:W8.t), SmtMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  inline*; wp.
  while (i0{1} = i{2} /\ 0 <= i{2} <= kvec /\ _N{2}=i{2} /\
         (forall k, 0 <= k < i{2} => (v{1}.[k]=noise1{2}.[k])%PolyVec) /\
         forall (x:W8.t), SmtMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
   rcondt {2} 4.
   +  move=> *; wp; skip => &hr /> ??? Hm ?.
      rewrite -implybF => H.
      by move: (Hm _ H); rewrite implybF of_uintK /#.
   wp; while (#[/:4,7:]pre /\ ={bytes} /\ i1{1} = i0{2} /\ 0 <= i0{2} <= 128 /\ j{2} = i0{2}*2 /\
              (forall (x1 : W8.t), SmtMap.dom RF.m{2} x1 => to_uint x1 <= _N{2}) /\
              forall k, 0 <= k < j{2} => p0{1}.[k] = rr{2}.[k]).
    auto => />. move => &1 &2 *; do split; 1..3:smt().
    move=> k ?? /=.
    case: (k= 2*i0{2}) => E1.
     by rewrite set_neqiE 1..2:/# set_eqiE 1..2:/# set_neqiE 1..2:/# set_eqiE /#. 
    case: (k= 2*i0{2}+1) => E2.
     by rewrite set_eqiE 1..2:/# set_eqiE /#.
    by rewrite set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE /#. 
   wp; rnd; wp; skip => /> &1 &2; rewrite !setvE !getvE => ?????????; split.
    split; 1:   by rewrite SmtMap.get_set_sameE.
    move=> x; case: (x=W8.of_int i{2}) => E.
     by move=> _; rewrite E of_uintK modz_small /#.
    rewrite SmtMap.domE SmtMap.get_set_neqE 1:// => H. 
    by apply StdOrder.IntOrder.ltrW; smt().
   move => p1 i0 p2 ?????? H; split; first smt().
   have EE: p1 = p2.
    by apply Array256.tP => k kb; apply H; smt().
   split; last smt().
   move=> k HkL HkR; case: (k = i{2}) => E.
    by rewrite /set E !offunvE /= /#.
   by rewrite /set !offunvE /= 1..2:/# (eq_sym _ k) E /= /#.
  auto => /> &1 &2; split; first smt().
  move=> v1 m i v2 => ??????; split; last smt().
  apply eq_vectorP => k kb;smt(setvE getvE).
 wp; seq 1 2: (={noise1,noise2} /\ _N{2} = 6 /\
           forall (x:W8.t), SmtMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
  inline*; wp.
  while (i0{1} = i{2} /\ 0 <= i{2} <= kvec /\ _N{2}=3+i{2} /\ noise1{1}=noise1{2} /\
         (forall k, 0 <= k < i{2} => (v{1}.[k]=noise2{2}.[k])%PolyVec) /\
         forall (x:W8.t), SmtMap.dom RF.m{2} x => W8.to_uint x < _N{2}).
   rcondt {2} 4.
    move=> *; wp; skip => &hr /> ??? Hm ?.
    rewrite -implybF => H.
    by move: (Hm _ H); rewrite implybF of_uintK /#.
   wp; while (#[/:5,8:]pre /\ bytes{1}=bytes{2} /\ i1{1}=i0{2} /\ 0 <= i0{2} <= 128 /\ j{2} = i0{2}*2 /\
              (forall (x1 : W8.t), SmtMap.dom RF.m{2} x1 => to_uint x1 <= _N{2}) /\
              forall k, 0 <= k < j{2} => p0{1}.[k] = rr{2}.[k]).
    wp; skip => /> &1&2 *; split; first smt().    
    split; first smt().
    move=> k ?? /=.
    case: (k= 2*i0{2}) => E1.
     by rewrite set_neqiE 1..2:/# set_eqiE 1..2:/# set_neqiE 1..2:/# set_eqiE /#. 
    case: (k= 2*i0{2}+1) => E2.
     by rewrite set_eqiE 1..2:/# set_eqiE /#.
    by rewrite set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE 1..2:/# set_neqiE /#.
   wp; rnd; wp; skip => /> &1 &2; rewrite !getvE !setvE => ?????????; split.
    split; 1:  by rewrite SmtMap.get_set_sameE.
    move=> x; case: (x=W8.of_int (3+i{2})) => E.
     by move=> _; rewrite E of_uintK modz_small /#.
    rewrite SmtMap.domE SmtMap.get_set_neqE 1:// => H. 
    by apply StdOrder.IntOrder.ltrW; smt().
   move => p1 i1 p2 ?????? H; split; first smt().
   have EE: p1 = p2.
    by apply Array256.tP => k kb; apply H; smt().
   split; first smt().
   split; last smt().
   move=> k HkL HkR; case: (k = i{2}) => E.
    by rewrite /set E !offunvE /= /#.
   by rewrite /set !offunvE /= 1..2:/# (eq_sym _ k) E /= /#.
  auto => /> &1 &2; split; first smt().
  move=> v1 m i v2 ??????; split; last smt().
  by apply eq_vectorP => k kb;smt(setvE getvE).
 conseq />.
  inline*; wp.
  rcondt {2} 4.
   move=> *; wp; skip => &hr /> Hm. 
   rewrite -implybF => H.
   by move: (Hm _ H); rewrite implybF of_uintK /#.
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
    by rewrite SmtMap.get_set_eqE //=.
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
    (3%r * (2 * FO_MLKEM.qHK + 3)%r + 2%r) * (failprob + prg_kg_bound + prg_enc_bound) +
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
    (3%r * (2 * FO_MLKEM.qHK + 3)%r + 2%r) * (failprob + hsadv + 2%r*prfadv) +
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
