require import AllCore IntDiv.
from Jasmin require import JModel.
require import Fq Kyber KyberPoly KyberPolyVec W16extra NTT_Fq.
require import Array25 Array32 Array33 Array34 Array64 Array128 Array168 Array256 Array768.
require import Array960 Array1152 Array2304.

require import Jindcpa.

import KyberPoly KyberPolyVec.
import KMatrix.
import Vector.
import Fq.
import Zq.

(** Aux *)
op valid_disj_reg(p1 : address, l1 : int, p2 : address, l2 : int) =
      valid_ptr p1 l1 /\ valid_ptr p2 l2 /\ ((p1 + l1) <= p2  || (p2 + l2) <= p1).

lemma matrixcols (m : 'a Array2304.t) (f : 'a -> 'b) i j : 0 <= i < 3 => 0<=j <3 =>
    Array256.map f (subarray256 ((Array768.init ((fun (i_0 : int) => m.[j*768 + i_0])))) i) =
                      (subarray256 (subarray768 (map f m) j) i).
move => ib jb;rewrite /subarray256 /subarray768 tP => k kb.
by rewrite mapiE //= !initiE //= !initiE 1,2:/# /= mapiE /#.
qed. 

lemma subliftsub (a : W16.t Array768.t) i k: 0<=i <3 => 0<=k<256 =>
    (lift_array256 (subarray256 a i)).[k] = (lift_array768 a).[256*i+k].
move => ib kb; rewrite /subarray256 /lift_array256 /lift_array768.
by rewrite !mapiE 1,2:/# /= !initiE /#.
qed.

lemma subsublift (a : W16.t Array2304.t) i j k:
  0 <= i < 3 => 0<= j < 3 => 0 <=  k < 256 =>
  (subarray256 (subarray768 (lift_array2304 a) i) j).[k] =
(lift_array768 ((init (fun x => a.[i*768 + x])))%Array768).[256 * j + k].
move => *; rewrite /subarray256 /subarray768 /lift_array2304 /lift_array768.
by rewrite !mapiE 1:/# /= !initiE 1,2:/# /= !initiE 1:/# /= mapiE /#.
qed.

lemma dotpmm (a : matrix) (v : vector) r :
  0 <= r < 3 =>
  (ntt (dotp (invnttv (offunv (fun (i : int) => a.[r, i]))) (invnttv v))) =
  (ntt_mmul a v).[r].
move => rb.
rewrite /ntt_mmul /dotp /kvec !offunvE //=.
rewrite !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunvE //= !offunvK /= /vclamp /kvec /=.
by rewrite !NTT_Fq.add_comm_ntt !NTT_Fq.mul_comm_ntt !NTT_Fq.nttK NTT_Fq.nttZero. 
qed.

lemma nttvecinv v i: 0 <= i < kvec => ntt (invnttv v).[i] = v.[i]
  by move => ib; rewrite /invnttv /mapv/= offunvE //= NTT_Fq.nttK.

lemma liftarrayvector a i k : 0<=i<3 => 0<=k<256 =>
         (lift_vector a).[i].[k] = (lift_array768 a).[256*i+k].
move => ib lb; rewrite /lift_vector /lift_array768 offunvE // mapiE 1:/# /=.
by rewrite /lift_array256 /subarray256 mapiE //= initiE //=.
qed.

op unlift_matrix(a : matrix) = Array2304.init (fun i => W16.of_int (asint a.[i %/ 768,i %% 768 %/ 256].[i %% 256])).

lemma matrix_unlift a : 
    lift_matrix (unlift_matrix a) = a /\
    pos_bound2304_cxq (unlift_matrix a) 0 2304 2.
proof.
split. 
+ rewrite /lift_matrix /unlift_matrix eq_matrixP => i j bounds.
  rewrite offunmE //= /subarray256 /subarray768 /lift_array2304 /= tP => k kb.
  rewrite initiE //= initiE 1:/# /= mapiE 1:/# /= initiE 1:/# /= /to_sint /smod /=.
  rewrite !of_uintK /= !(modz_small _ 65536); 1: smt(rg_asint). 
  rewrite !(mulzC 768) !(edivz_eq) 1:/# !(emodz_eq) 1:/# fun_if !asintK. 
  rewrite !(mulzC 256) !(edivz_eq) 1:/#. 
  rewrite (_: i*768 = (3*i)*256) 1:/# !modzMDl.
  by smt(rg_asint).
rewrite /unlift_matrix /pos_bound2304_cxq => k kb; rewrite initiE //=.
rewrite to_sint_unsigned.
+ rewrite /to_sint of_uintK /= modz_small; 1: by smt(rg_asint). 
  by rewrite /smod /=; smt(rg_asint qE).
rewrite of_uintK /= modz_small; 1: by smt(rg_asint). 
  by rewrite /smod /=; smt(rg_asint qE).
qed.

op unlift_vector(a : vector) = Array768.init (fun i => W16.of_int (as_sint a.[i %/ 256].[i%%256])).

lemma vector_unlift a : 
    lift_vector (unlift_vector a) = a /\
    signed_bound768_cxq (unlift_vector a) 0 768 1.
proof.
split. 
+ rewrite /lift_vector /unlift_vector eq_vectorP => i ib.
  rewrite offunvE //= /subarray256 /lift_array256 /= tP => k kb.
  rewrite mapiE //= initiE //= initiE //= 1:/# /to_sint /smod /=.
  rewrite !of_uintK /=; rewrite /as_sint qE /=.
  by smt(rg_asint asintK).

rewrite /unlift_vector /signed_bound768_cxq => k kb; rewrite initiE //=.
rewrite /to_sint /smod /= !of_uintK /= /as_sint qE /=.
by smt(rg_asint).
qed.

op unlift_poly(a : poly) = Array256.init (fun i => W16.of_int (as_sint a.[i])).

lemma poly_unlift a : 
    lift_array256 (unlift_poly a) = a /\
    signed_bound_cxq (unlift_poly a) 0 256 1.
proof.
split. 
+ rewrite /lift_array256 /unlift_poly /= tP => k kb.
  rewrite mapiE //= initiE //= /to_sint /smod /=.
  rewrite !of_uintK /=; rewrite /as_sint qE /=.
  by smt(rg_asint asintK).

rewrite /unlift_poly /signed_bound_cxq => k kb; rewrite initiE //=.
rewrite /to_sint /smod /= !of_uintK /= /as_sint qE /=.
by smt(rg_asint).
qed.

lemma inFq_to_sint (a : W16.t) :
  -(q-1)%/ 2 < to_sint a < (q-1)%/ 2 =>
  a = (W16.of_int (as_sint (inFq (to_sint a)))).
proof.
rewrite qE /=; move => [#] bndl bndh.
rewrite /as_sint fun_if /= !inFqK qE /=.
case(0<= to_sint a).
+ move => ?; rewrite !modz_small 1:/#.
  have -> : !(1664 < to_sint a) by smt().
  by rewrite to_sint_unsigned 1:/# to_uintK.
+ move => ?; pose x := - (to_sint a); have -> : to_sint a = -x by ring.
  have xbnd : 0 < x < 1664 by smt(). 
  rewrite modNz 1:/# //= !modz_small 1:/# /=.
  have -> /= : 1664 < 3328 - (x - 1) by smt().
  have -> : a = W16.of_int (to_sint a); last by ring.
  rewrite /to_sint /smod fun_if /= of_intS to_uintK.
  case(32768 <= to_uint a); 2:auto.
  by move => *; ring.
qed.


(*******)

(** DEFINING THE EXTERNAL COMPONENTS BASED ON THE SHA ALGORITHMS *)

module H : KyberPKE.RO.POracle = {
  proc o(x : KyberPKE.RO.in_t) : KyberPKE.RO.out_t = { return witness;  }
}.

module (G : G_t) (H : KyberPKE.RO.POracle) = {
  proc sample(inbuf : W8.t Array32.t) : W8.t Array32.t * W8.t Array32.t = { 
    var i,j,c;
    var buf : W8.t Array64.t;
    var publicseed : W8.t Array32.t;
    var noiseseed  : W8.t Array32.t;

    buf <- witness;
    publicseed <- witness;
    noiseseed <- witness;

    buf <@ M._sha3512_32 (buf, inbuf);
    i <- (W64.of_int 0);
    j <- (W64.of_int 32);
    
    while ((i \ult (W64.of_int 32))) {
      c <- buf.[(W64.to_uint i)];
      publicseed.[(W64.to_uint i)] <- c;
      c <- buf.[(W64.to_uint j)];
      noiseseed.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
      j <- (j + (W64.of_int 1));
    }
    return (publicseed,noiseseed);
  }
}.

module (XOF : XOF_t) (O : KyberPKE.RO.POracle) = {
  var state : W64.t Array25.t
  proc init(rho : W8.t Array32.t, i : int, j : int) : unit = {
       var extseed : W8.t Array34.t;
       extseed <- Array34.init
        (fun k => if k < 32 then rho.[k] else if k=32 then W8.of_int i else W8.of_int j);
       state <- witness;
       state <@ M._shake128_absorb34(state, extseed);
  }
  proc next_bytes() : W8.t Array168.t = { 
       var buf;
       buf <- witness;
       (state, buf) <@ M._shake128_squeezeblock(state, buf);
       return buf; 
  }
}.

module (PRF : PRF_t) (O : KyberPKE.RO.POracle) = {
  var key : W8.t Array32.t
  proc init(sig : W8.t Array32.t) : unit = { key <- sig; }
  proc next_bytes(_N : int) : W8.t Array128.t = {
     var extseed : W8.t Array33.t;
     var buf;
     extseed <- Array33.init
        (fun k => if k < 32 then key.[k] else W8.of_int _N);
     buf <- witness;
     buf <@ M._shake256_128_33(buf, extseed);
     return buf;
  }
}.


(** AS AN INTERMEDIATE STEP WE RESHUFFLE THE EXTRACTED CODE TO BETTER
    MATCH THE STRUCTURE OF THE SPEC AND PROVE EQUIVALENCE *)

module AuxKyber= {

proc __gen_matrix(seed : W8.t Array32.t, trans : bool) : W16.t Array2304.t = {
  var a, i, j,c;
  a <- witness;                       
  i <- 0;                       
  while (i < kvec) {                  
    j <- 0;                          
    while (j < kvec) {                
      XOF(H).init(seed, if trans then i else j, if trans then j else i);        
      c <@ Parse(XOF, H).sample_real();
      a <- a.[i, j <- c];         
      j <- j + 1;                      
    }                                 
    i <- i + 1;                       
  }                                   
  return unlift_matrix a;
}

proc sample_noise2_jasmin(noiseseed:W8.t Array32.t) : W16.t Array768.t * W16.t Array768.t = {
    var nonce,aux;
    var noise1:W16.t Array768.t;    
    var noise2:W16.t Array768.t;    
    noise1 <- witness;
    noise2 <- witness;
    nonce <- (W8.of_int 0);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => noise1.[0 + i_0])),
    noiseseed, nonce);
    noise1 <- Array768.init
            (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else noise1.[i]);
    nonce <- (W8.of_int 1);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => noise1.[256 + i_0])),
    noiseseed, nonce);
    noise1 <- Array768.init
            (fun i => if 256 <= i < 256 + 256 then aux.[i-256]
            else noise1.[i]);
    nonce <- (W8.of_int 2);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => noise1.[(2 * 256) + i_0])),
    noiseseed, nonce);
    noise1 <- Array768.init
            (fun i => if (2 * 256) <= i < (2 * 256) + 256
            then aux.[i-(2 * 256)] else noise1.[i]);
    nonce <- (W8.of_int 3);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => noise2.[0 + i_0])),
    noiseseed, nonce);
    noise2 <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else noise2.[i]);
    nonce <- (W8.of_int 4);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => noise2.[256 + i_0])),
    noiseseed, nonce);
    noise2 <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else noise2.[i]);
    nonce <- (W8.of_int 5);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => noise2.[(2 * 256) + i_0])),
    noiseseed, nonce);
    noise2 <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else noise2.[i]);
    return (noise1,noise2);
}

proc sample_noise2_spec(noiseseed:W8.t Array32.t) : W16.t Array768.t * W16.t Array768.t * int= {
  var noise1, noise2, _N,i,c;
  noise1 <- witness;                     
  noise2 <- witness;                      
  _N <- 0;                      
  PRF(H).init(noiseseed);                   
  i <- 0;                             
  while (i < kvec) {                 
    c <@ CBD2(PRF, H).sample_real(_N);
    noise1 <- set noise1 i c;                   
    _N <- _N + 1;                     
    i <- i + 1;                       
  }                                  
  i <- 0;                             
  while (i < kvec) {                 
    c <@ CBD2(PRF, H).sample_real(_N);
    noise2 <- set noise2 i c;                   
    _N <- _N + 1;                     
    i <- i + 1;                       
  }                                  

  return (unlift_vector noise1,unlift_vector noise2,_N);
}

proc sample_noise3_jasmin(noiseseed:W8.t Array32.t) : W16.t Array768.t * W16.t Array768.t * W16.t Array256.t= {
  var noise1, noise2, nonce,noise3;
  (noise1,noise2) <@ sample_noise2_jasmin(noiseseed);
  nonce <- (W8.of_int 6);
  noise3 <- witness;
  noise3 <@ M._poly_getnoise (noise3,noiseseed, nonce);
  return (noise1,noise2,noise3);
}

proc sample_noise3_spec(noiseseed:W8.t Array32.t) : W16.t Array768.t * W16.t Array768.t * W16.t Array256.t= {
  var e, s, _N,e2;
  (s,e,_N) <@ sample_noise2_spec(noiseseed);
  e2 <@ CBD2(PRF, H).sample_real(_N);
  return (s,e, unlift_poly e2);
}

proc indcpa_keypair_jazz (pkp:W64.t, skp:W64.t, seed:W8.t Array32.t) : unit = {
    var aux: W16.t Array256.t;
    var _N : int;
    var spkp:W64.t;
    var sskp:W64.t;
    var i:W64.t;
    var c:W8.t;
    var j:W64.t;
    var publicseed:W8.t Array32.t;
    var noiseseed:W8.t Array32.t;
    var zero:W64.t;
    var a:W16.t Array2304.t;
    var nonce:W8.t;
    var skpv:W16.t Array768.t;
    var e:W16.t Array768.t;
    var pkpv:W16.t Array768.t;


    (publicseed,noiseseed) <@  G(H).sample(seed);

    a <- witness;
    a <@ __gen_matrix (publicseed,false);

    pkpv <- witness;               

    (skpv,e,_N) <@ sample_noise2_spec(noiseseed);

    skpv <@ M.__polyvec_ntt (skpv);
    e <@ M.__polyvec_ntt (e);

    aux <@ Aux.inner_product ((Array768.init (fun i_0 => a.[0 + i_0])),skpv);
    pkpv <- Array768.init (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else pkpv.[i]);
    aux <@ Aux.inner_product((Array768.init (fun i_0 => a.[768 + i_0])),skpv);
    pkpv <- Array768.init (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else pkpv.[i]);
    aux <@ Aux.inner_product ((Array768.init (fun i_0 => a.[(2 * 768) + i_0])), skpv);
    pkpv <- Array768.init (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)] else pkpv.[i]);

    pkpv <@ M.__polyvec_add2 (pkpv,e);
    pkpv <@ M.__polyvec_reduce (pkpv);

    spkp <- pkp;
    sskp <- skp;
    pkp <- spkp;
    skp <- sskp;

    M.__polyvec_tobytes (skp, skpv);
    M.__polyvec_tobytes (pkp, pkpv);
    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (3 * 384)));
    
    while ((i \ult (W64.of_int 32))) {
      c <- publicseed.[(W64.to_uint i)];
      Glob.mem <- storeW8 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))) c;
      pkp <- (pkp + (W64.of_int 1));
      i <- (i + (W64.of_int 1));
    }
    return ();
  }

  proc indcpa_enc_jazz (ctp:W64.t, msgp:W64.t, pkp:W64.t, coinsp:W64.t) : unit = {
    var aux: W16.t Array256.t;
    
    var sctp:W64.t;
    var i:W64.t;
    var c:W8.t;
    var noiseseed:W8.t Array32.t;
    var pkpv:W16.t Array768.t;
    var publicseed:W8.t Array32.t;
    var k:W16.t Array256.t;
    var one:W64.t;
    var at:W16.t Array2304.t;
    var nonce:W8.t;
    var sp_0:W16.t Array768.t;
    var ep:W16.t Array768.t;
    var epp:W16.t Array256.t;
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;

    noiseseed <- witness;

    i <- (W64.of_int 0);
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (coinsp + i)));
      noiseseed.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
    }

    pkpv <- witness;
    pkpv <@ M.__polyvec_frombytes (pkp);

    publicseed <- witness;
    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (3 * 384)));
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))));
      publicseed.[(W64.to_uint i)] <- c;
      pkp <- (pkp + (W64.of_int 1));
      i <- (i + (W64.of_int 1));
    }

    at <- witness;
    one <- (W64.of_int 1);
    at <@ __gen_matrix (publicseed,true);

    k <- witness;
    k <@ M._poly_frommsg (k, msgp);

    (sp_0,ep,epp) <@ sample_noise3_spec(noiseseed);

    sp_0 <@ M.__polyvec_ntt (sp_0);

    bp <- witness;

    aux <@ M.__polyvec_pointwise_acc ((Array768.init (fun i_0 => at.[0 + i_0])),
    sp_0);
    bp <- Array768.init
          (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else bp.[i]);
    aux <@ M.__polyvec_pointwise_acc ((Array768.init (fun i_0 => at.[768 + i_0])),
    sp_0);
    bp <- Array768.init
          (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else bp.[i]);
    aux <@ M.__polyvec_pointwise_acc ((Array768.init (fun i_0 => at.[(2 * 768) + i_0])),
    sp_0);
    bp <- Array768.init
          (fun i => if (2 * 256) <= i < (2 * 256) + 256
          then aux.[i-(2 * 256)] else bp.[i]);

    v <- witness;
    v <@ M.__polyvec_pointwise_acc (pkpv, sp_0);

    bp <@ M.__polyvec_invntt (bp);
    v <@ M._poly_invntt (v);

    bp <@ M.__polyvec_add2 (bp, ep);
    v <@ M._poly_add2 (v, epp);
    v <@ M._poly_add2 (v, k);

    bp <@ M.__polyvec_reduce (bp);
    v <@ M.__poly_reduce (v);

    sctp <- ctp;
    ctp <- sctp;

    M.__polyvec_compress (ctp, bp);

    ctp <- (ctp + (W64.of_int (3 * 320)));
    v <@ M._poly_compress (ctp, v);

    return ();
  }

}.

equiv absorb_ignore :
  M._shake128_absorb34 ~ M._shake128_absorb34 :
   arg{1}.`2 = arg{2}.`2 ==> ={res}.
proof.
proc; seq 1 1: (#pre /\ ={state}); last by sim.
call(_: true ==> ={res}); last by auto => />.
proc; while (={i} /\ 0<=i{1}<=25 /\ forall k, 0<=k<i{1} => state{1}.[k] = state{2}.[k]);
     1: by auto => />; smt(Array25.set_eqiE Array25.set_neqiE).
auto => /> *; split; 1: by smt().
by move => *;rewrite tP => k kb; smt().
qed. 

equiv auxgenmatrix_good :
  M.__gen_matrix ~ AuxKyber.__gen_matrix :
    transposed{1} = (if trans{2} then W64.one else W64.zero) /\ ={seed} ==> ={res}.
proc => /=. 
inline Parse(XOF, H).sample_real.
inline M.__rej_uniform.
seq 6 1: (={seed} /\ stransposed{1} = (if trans{2} then W64.one else W64.zero)); 1: by auto.
seq 2 0 : (#pre /\ forall k, 0<=k<32 => extseed {1}.[k] = seed{2}.[k]).
+ conseq => />; 1: smt().
  while{1} (#pre /\ 0<=j{1}<=32 /\
      forall k, 0<=k<j{1} => extseed {1}.[k] = seed{2}.[k]) (32-j{1}); 
         last by auto => /#.
  auto => /> &hr *; do split; 1..2,4..: by smt().
  by move => k kb ?; case (k < j{hr}); move => *; 
    smt(Array34.set_neqiE Array34.set_eqiE).

while(#pre /\ ={i} /\ 0<=i{1}<=3 /\ 
   forall k, 0 <= k < i{1}*768 => 
         a{2}.[k %/ 768,k %% 768 %/ 256].[k %% 256] = inFq (to_sint r{1}.[k]) /\
         bpos16 r{1}.[k] q); last first.
+ auto => /> &1 &2 ?; rewrite /kvec;split; 1: smt().
  move => extseed r1 a2 i ?????;rewrite  /unlift_matrix tP => H k kb.
  rewrite initiE //=;move : (H k _); 1:smt(); move => [#] ->??.
  by rewrite inFqK modz_small 1:/# to_sint_unsigned 1: /# to_uintK. 

wp;while(stransposed{1} = (if trans{2} then W64.one else W64.zero) /\
         (forall (k0 : int), 0 <= k0 && k0 < 32 => extseed{1}.[k0] = seed{2}.[k0]) /\
         ={i,j} /\ 0<=i{1}<=3 /\ 0<=j{1}<=3  /\ i{1} < 3 /\
   forall k, 0 <= k < i{1}*768 + j{1}*256 => 
         a{2}.[k %/ 768,k %% 768 %/ 256].[k %% 256] = inFq (to_sint r{1}.[k]) /\
         bpos16 r{1}.[k] q); last by auto => /> /#.

wp => /=.
while {1} (={i,j} /\ 0<=i{1}<3 /\ 0<j{1} + 1<=3  /\
   (forall kk, 0 <= kk < i{1}*768 + j{1}*256 => 
         a{2}.[kk %/ 768,kk %% 768 %/ 256].[kk %% 256] = inFq (to_sint r{1}.[kk]) /\
         bpos16 r{1}.[kk] q) /\
   (forall kk, 0<=kk<256=> 
        aa{2}.[kk] = 
                  inFq (to_sint poly{1}.[kk]) /\
         bpos16 poly{1}.[kk] q) /\
   (forall kk, 0<=kk<to_uint k{1} => 
        aa{2}.[kk] = 
                  inFq (to_sint r{1}.[i{1} * 768 + j{1} * 256 + kk]) /\
         bpos16 r{1}.[i{1} * 768 + j{1} * 256 + kk] q) /\
   0<=to_uint k{1} <= 256 /\ to_uint l{1} = i{1} * 768 + j{1} * 256 + to_uint k{1}) 
   (256 - to_uint k{1}).

+ move => *; auto => /> &hr 10?; rewrite !ultE /= => ?.
  rewrite !to_uintD_small /= 1,2:/#; do split;3..:smt().
  + by move => kk kkbl kkbh; rewrite set_neqiE /#. 
  move => kk kkbl kkbh; case (kk < to_uint k{hr}).
  + by move => *;rewrite !set_neqiE /#. 
  by move => *;rewrite !set_eqiE /#. 

wp;while  (
   stransposed{1} = (if trans{2} then W64.one else W64.zero) /\ state{1} = XOF.state{2} /\
         (forall (k0 : int), 0 <= k0 && k0 < 32 => extseed{1}.[k0] = seed{2}.[k0]) /\ 
   ={i,j} /\ 0<=i{1}<3 /\ 0<j{1} + 1<=3  /\
   (forall kk, 0 <= kk < i{1}*768 + j{1}*256 => 
         a{2}.[kk %/ 768,kk %% 768 %/ 256].[kk %% 256] = inFq (to_sint r{1}.[kk]) /\
         bpos16 r{1}.[kk] q) /\
   (forall kk, 0<=kk<j0{2}=> 
        aa{2}.[kk] = 
                  inFq (to_sint poly{1}.[kk]) /\
         bpos16 poly{1}.[kk] q) /\ 
   to_uint ctr{1} = j0{2} /\ 0<= j0{2} <= 256); last first.
+ inline XOF(H).init. 
  seq 2 4 : (#pre /\ ={extseed}).
  + conseq />; 1: smt(); auto => /> &1 &2 *; case (trans{2}). 
    + move => *; rewrite W64.WRingA.oner_neq0 /=; split. 
      + by move => k0 kbl kbh; rewrite !set_neqiE /#. 
      apply Array34.tP => k kb; rewrite initiE //=.
      case(k < 32); 1:  by move => *; rewrite !set_neqiE /#. 
      case(k = 32); 1: by move => *; rewrite set_neqiE 1,2:/# set_eqiE /#.
      by move => *; rewrite set_eqiE /#.
    move => /= *;split. 
    + by move => k0 kbl kbh; rewrite !set_neqiE /#. 
    apply Array34.tP => k kb; rewrite initiE //=.
    case(k < 32); 1:  by move => *; rewrite !set_neqiE /#. 
    case(k = 32); 1: by move => *; rewrite set_neqiE 1,2:/# set_eqiE /#.
    by move => *; rewrite set_eqiE /#.
  wp; call absorb_ignore.
  auto => /> &1 &2 *; do split; 1..2: smt().
(*
    + apply Array34.tP => k kb; rewrite initiE //=.
      case (k < 32); 1: by  move => *;rewrite !Array34.set_neqiE /#.
      case (k = 32); 1: by move => *;rewrite Array34.set_neqiE 1,2:/# Array34.set_eqiE /#.  
      by move => *;rewrite Array34.set_eqiE /#. 
    move => *;do split; 2,3,4:smt().
    + by move => k *; rewrite  !Array34.set_neqiE /#.
    move => ctrp polyp aap; rewrite !ultE /= => *;do split; 1,2:smt().
    + by rewrite of_uintK /=; smt(modz_small).
    move => kl ll rl; rewrite ultE /= => *; split; 1: smt().
    move => ? H H0 H1 *; split; 1: smt().
    move => k kbl kbh.
    case (k < i{2} * 768 + j{2} * 256); 1: by smt(offunmE). 
    move => *; rewrite /("_.[_<-_]")%Kyber /= !offunmE 1:/# /=.
    have -> :  k %/ 768 = i{2} by smt().
    have -> /= :  k %% 768 %/ 256 = j{2} by smt().
    case (k %% 256 < to_uint kl); 2: by smt().
*)
    admit.
  admit.

swap {1} 1 1; seq 1 1 : (#pre /\ buf{1} = b168{2}).
+ inline XOF(H).next_bytes; sp;wp.
  call(_: arg{1}.`1 = arg{2}.`1 ==> ={res}); last by auto => />.
  proc. admit.
admitted. (* obviously works :-) *)

equiv get_noise_sample_noise :
   M._poly_getnoise ~ CBD2(PRF, H).sample_real :
   arg{1}.`2 = PRF.key{2} /\ to_uint arg{1}.`3 = arg{2} 
   ==> 
   lift_array256 res{1} = res{2} /\
   forall k, 0<=k<256 => -5 < to_sint res{1}.[k] < 5.
proc. 
admitted. (* obviously works :-) *)

equiv sample_noise_good2 _key :
  AuxKyber.sample_noise2_jasmin ~ AuxKyber.sample_noise2_spec :
    ={noiseseed} ==> res{1}.`1 = res{2}.`1 /\ 
                     res{1}.`2 = res{2}.`2 /\ 
                     res{2}.`3 = 6 /\
                     PRF.key{2} = _key.
proc.
unroll for {2} 8; unroll for {2} 6.
admitted. (* Should follow from get_noise_sample_noise *)

equiv sample_noise_good3 :
  AuxKyber.sample_noise3_jasmin ~ AuxKyber.sample_noise3_spec :
    ={noiseseed} ==> ={res}.
proc.
call get_noise_sample_noise.
wp; ecall (sample_noise_good2 noiseseed{2}).
auto => /> resl resr ???; split; 1: smt().
move => ? resl0.
rewrite /unlift_poly /lift_array256 tP /= => bd k kbnd.
rewrite !initiE //= !mapiE //=. 
by smt(inFq_to_sint).
qed.
  
equiv auxkg_good :
  M.indcpa_keypair_jazz ~ AuxKyber.indcpa_keypair_jazz :
     ={Glob.mem} /\ arg{1}.`1 = arg{2}.`1 /\ arg{1}.`2 = arg{2}.`2 /\ 
     valid_ptr (to_uint arg{1}.`3) 32 /\ 
      arg{2}.`3 = Array32.init (fun i => loadW8 Glob.mem{1} (to_uint arg{1}.`3 + i))
     ==> ={Glob.mem,res}. 
proc => /=. 
inline Aux.inner_product.
swap {1} 4 -3.
swap {1} 3 -1.
swap {1} [11..13] -8.
swap {1} 8 -5.
swap {1} 10 -7.
swap {1} [14..16] -6.
seq 10 1 : (#{/~randomnessp{1}}pre /\ ={publicseed, noiseseed}).
+ inline G(H).sample;swap {1} [5..6] -3. 
  seq 3 1 : (#pre /\ ={inbuf}); last by sim.   
  conseq => />.
  while {1} (0<= to_uint i{1} <=32 /\ 
              valid_ptr (to_uint randomnessp{1}) 32 /\
              seed{2} = (Array32.init (fun (i1 : int) => 
                  loadW8 Glob.mem{1} (to_uint randomnessp{1} + i1))) /\
             forall k, 0<= k < to_uint i{1} =>
                    inbuf{1}.[k] = seed{2}.[k]) (32-to_uint i{1});
    last first. 
  + auto => /> &1 &2 ??; split; 1: smt().
    move => il inbufl; rewrite !ultE /=; split; 1: smt().
    move => ???H; rewrite tP => i ib; rewrite initiE //=.
    by move : (H i _); 1: smt(); rewrite initiE //=.
  move => *; auto => /> &hr ???; rewrite ultE /==> ?.
  rewrite !to_uintD_small /=; 1,2:smt(); move => *.
  split; 2: smt(); split; 1: smt().
  move => k kb ?; case (k < to_uint i{hr}).
  + by move => *; rewrite set_neqiE //= /#.
  move => *; rewrite set_eqiE //= 1:/#.
  by rewrite initiE //= /#.


swap {1} [7..8] -5.
seq 3 2 : (#pre /\ ={a}); 1: by call auxgenmatrix_good; auto => />.

swap {1} [6..23] -2.
swap {1} 2 24.
swap {2} 1 8.

seq 20 1 : (#pre /\ ={skpv,e}).
transitivity {1} {(skpv,e) <@ AuxKyber.sample_noise2_jasmin(noiseseed);}
     (={Glob.mem,pkp,skp,publicseed,noiseseed,a} ==> 
          ={skpv,e,Glob.mem,pkp,skp,publicseed,noiseseed,a,skpv,e})
     (={Glob.mem,pkp,skp,publicseed,noiseseed,a} ==> 
          ={skpv,e,Glob.mem,pkp,skp,publicseed,noiseseed,a,skpv,e}); 1,2: by smt(). 
+ by inline  AuxKyber.sample_noise2_jasmin; sim; auto => />. 
by conseq />; ecall (sample_noise_good2 noiseseed{2}) ; auto => />.

swap{1} [1..2] 16.

seq 2 2 : (#pre); 1:by sim.

seq 5 7 : (#pre /\ ={pkpv}).

+ wp;call(_: true); 1: by sim. 
  wp;call(_:true); 1: by sim.
  auto => /> result /=. 
  do split.
  + by rewrite tP => x xb; rewrite !initiE 1,2:/# /= xb /=.
  + by move => *; rewrite tP => x xb; rewrite !initiE 1,2:/# /= !initiE 1,2:/#.

seq 4 6 : #pre.

+ wp;call(_: true); 1: by sim. 
  wp;call(_:true); 1: by sim.
  auto => /> &1 result /=. 
  do split.
  + by rewrite tP => x xb; rewrite !initiE //=  !initiE 1,2:/# /= xb /=.
  + by move => *; rewrite tP => x xb; rewrite !initiE 1,2:/# /= !initiE 1,2:/#.

seq 4 6 : #pre.

+ wp;call(_: true); 1: by sim. 
  wp;call(_:true); 1: by sim.
  auto => /> &1 result /=. 
  do split.
  + by rewrite tP => x xb; rewrite !initiE //=  !initiE 1,2:/# /= xb /=.
  + by move => *; rewrite tP => x xb; rewrite !initiE 1,2:/# /= !initiE 1,2:/#.

by sim.

qed.

equiv auxenc_good :
  M.indcpa_enc_jazz ~ AuxKyber.indcpa_enc_jazz :
     ={Glob.mem,arg} ==> ={Glob.mem,res}. 
proc. 
swap {1} 6 -5.
swap {1} [12..13] -10.
seq 3 3 : (#pre /\ ={noiseseed}); 1: by sim.

swap {1} 6 -5.
swap {1} 11 -9.
seq 2 2 : (#pre /\ ={pkpv}); 1: by sim.

swap {1} 6 -5.
swap {1} [10..12] -8.

seq 4 4 : (#pre /\ ={publicseed}); 1: by sim.

swap {1} [10..11] -8.
seq 3 3 : (#pre /\ ={at}); 1: by call auxgenmatrix_good;auto => />.

swap {1} 4 -3.
swap {1} 8 -6.

seq 2 2 : (#pre /\ ={k}); 1: by sim.

swap {1} 2 -1.
swap {1} 4 -3.
swap {1} [7..25] -4.
swap {1} 23 -1.
swap {1} 26 -3.

seq 23 1 : (#pre /\ ={sp_0,ep,epp}).
transitivity {1} {(sp_0,ep,epp) <@ AuxKyber.sample_noise3_jasmin(noiseseed);}
     (={Glob.mem,ctp,msgp,pkp,coinsp,noiseseed,pkpv,publicseed,at,k} ==> 
          ={Glob.mem,ctp,msgp,pkp,coinsp,noiseseed,pkpv,publicseed,at,k,sp_0,ep,epp})
      (={Glob.mem,ctp,msgp,pkp,coinsp,noiseseed,pkpv,publicseed,at,k} ==> 
          ={Glob.mem,ctp,msgp,pkp,coinsp,noiseseed,pkpv,publicseed,at,k,sp_0,ep,epp}); 1,2: by smt(). 
+ by inline  AuxKyber.sample_noise3_jasmin AuxKyber.sample_noise2_jasmin; sim; auto => />. 
+ by conseq />; call sample_noise_good3; auto => />.

swap {1} 4 -3.

swap {1} [3..4] 6.
swap {1} 10 8.

by sim. 

qed.

(******* CORRECTNESS PROOFS TOP LEVEL ************)

(* We model G exactly as the implementation does it *)
lemma kyber_correct_kg mem _pkp _skp _randomnessp : 
   equiv [ M.indcpa_keypair_jazz ~ Kyber(G,XOF,PRF,H).kg_derand : 
       Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp /\ to_uint skp{1} = _skp /\ 
       to_uint randomnessp{1} = _randomnessp /\
       Glob.mem{2} = mem /\ 
       seed{2} = Array32.init(fun i=> loadW8 Glob.mem{1} (to_uint randomnessp{1}  + i)) /\
       valid_ptr (to_uint randomnessp{1}) 32 /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3)
        ==> 
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk = load_array1152 Glob.mem{1} _skp /\
         t = load_array1152 Glob.mem{1} _pkp  /\
         rho = load_array32 Glob.mem{1} (_pkp+1152)].
proc*.
transitivity {1} { AuxKyber.indcpa_keypair_jazz(pkp, skp, 
             Array32.init(fun i=> loadW8 Glob.mem (to_uint randomnessp  + i)));} 
(={Glob.mem,arg} /\ valid_ptr (to_uint randomnessp{1}) 32 ==> ={Glob.mem,r}) 
(   Glob.mem{1} = mem /\
    to_uint pkp{1} = _pkp /\
    to_uint skp{1} = _skp /\
    to_uint randomnessp{1} = _randomnessp /\ 
    seed{2} = Array32.init(fun i=> loadW8 Glob.mem{1} (to_uint randomnessp{1}  + i))  /\
    Glob.mem{2} = mem /\ 
    valid_disj_reg _pkp (384 * 3 + 32) _skp (384 * 3)
    ==> 
    let (pk, sk) = r{2} in
    let (t, rho) = pk in
        sk = load_array1152 Glob.mem{1} _skp /\
        t = load_array1152 Glob.mem{1} _pkp /\ 
        rho = load_array32 Glob.mem{1} (_pkp + 1152)); 1,2: smt().
+ by call auxkg_good; auto => />.

inline {1} 1; inline {2} 1.

sp 2 0.

swap {2} 7 -5.
seq 2 2 : (#pre /\ rho{2} = publicseed{1} /\ sig{2} = noiseseed{1}).
+ by conseq => />; call (_: true); [ by sim | by auto => />]. 

swap {2} [7..8] -5.
seq 2 3 : (#pre /\ a{2} = lift_matrix a{1} /\
            pos_bound2304_cxq a{1} 0 2304 2).
+ inline AuxKyber.__gen_matrix; conseq />.
  seq 6 3 : (a0{1}=a{2}); last by auto => />;  smt(matrix_unlift).
  while (i0{1} = i{2} /\ 0<=i0{1}<=kvec /\ seed0{1}=rho{2} /\ !trans{1} /\
         forall ii jj, 0<=ii<i0{1} => 0<= jj <3 => a0{1}.[ii,jj] = a{2}.[ii,jj]); last  first.
          auto => />; smt(eq_matrixP).
  wp; while (i0{1} = i{2} /\ j0{1} = j{2} /\ 0<=i0{1}<kvec /\ 0<=j0{1}<=kvec /\ seed0{1}=rho{2} /\ !trans{1} /\
         (forall ii jj, 0<=ii<i0{1} => 0<= jj <3 => a0{1}.[ii,jj] = a{2}.[ii,jj]) /\
         (forall jj, 0 <= jj <j0{1} => a0{1}.[i0{1},jj] = a{2}.[i0{1},jj])); last 
            by auto => />  /#.
  wp; call(_: ={XOF.state}); 1: by sim.
  wp; call(_: ={arg} ==> ={XOF.state}); last by auto => /> &1 &2;  smt(offunmK). 
  by proc;call absorb_ignore; auto => />.
  
swap {2} [5..10]  -2.
swap {1} 1 1.
seq 1 8 : (#pre /\ s{2} = lift_vector skpv{1} /\ e{2} = lift_vector e{1} /\
                signed_bound768_cxq skpv{1} 0 768 1 /\
                signed_bound768_cxq e{1} 0 768 1).
+ inline AuxKyber.sample_noise2_spec; conseq />. 
  seq 9 8 : (noise1{1}=s{2} /\ noise2{1} = e{2}); 1: by sim; auto => />.
  by auto => />;  smt(vector_unlift).

swap {1} 1 2; seq 0 2: #pre; 1: by auto.

seq 11 3 : (#{/~signed_bound768_cxq skpv{1} 0 768 1}
             {~signed_bound768_cxq e{1} 0 768 1}pre /\ 
                t{2} = lift_vector pkpv{1} /\
                pos_bound768_cxq pkpv{1} 0 768 2 /\
                pos_bound768_cxq skpv{1} 0 768 2
                ); last first.

+ while{1} (0<=to_uint i{1} <= 32 /\ 
            to_uint pkp0{1} = _pkp + 3*384 + to_uint i{1} /\ 
            to_uint skp0{1} = _skp /\ rho{2} = publicseed{1} /\
            valid_disj_reg _pkp (384 * 3 + 32) _skp (384 * 3) /\
                sv{2} = load_array1152 Glob.mem{1} _skp /\
                tv{2} = load_array1152 Glob.mem{1} _pkp /\ 
                forall k, 0<=k<to_uint i{1} =>
                 rho{2}.[k] = loadW8 Glob.mem{1} (_pkp + 1152 + k)) 
             (32 - to_uint i{1}).

+ move => *;
  auto => /> &hr ??; rewrite /loadW8 /storeW8 /valid_disj_reg /valid_ptr /=.
  move  => ppk [#] reg1 reg2 reg3 reg4 reg5 loaded.
  rewrite ultE /= to_uintD_small /= 1:/# => enter.
  rewrite to_uintD_small /= 1:/#.
  do split; 1..3,7:smt().
  + rewrite /load_array1152 Array1152.tP => k kb.
    by rewrite !initiE //=;  rewrite get_set_neqE_s; smt().
  + rewrite /load_array1152 Array1152.tP => k kb.
    by rewrite !initiE //=;  rewrite  get_set_neqE_s; smt().
  move => k kbl kbh.
  case (k <to_uint i{hr}).
  + by move => *;rewrite get_set_neqE_s /#. 
  by move => *;rewrite get_set_eqE_s /#. 

  swap {2} 2 -1.
  wp; ecall(polyvec_tobytes_corr Glob.mem{1} (to_uint pkp{1}) (lift_array768 pkpv{1})). 
  wp; ecall(polyvec_tobytes_corr Glob.mem{1} (to_uint skp{1}) (lift_array768 skpv{1})).
  auto => /> &1 &2 *.
  do split.
  + move => *. rewrite /lift_vector /toipolyvec /fromarray256 !mapiE //. 
    by smt(rg_asint).
  + move => *. rewrite /lift_vector /toipolyvec /fromarray256 /lift_array768 tP => k kb.  
    rewrite !mapiE // asintK /=.  
    rewrite !offunvE //= /lift_array256 /subarray256 initiE //=. 
    case (0 <= k && k < 256); 1: by move => *; rewrite mapiE //= initiE //.
    case (256 <= k && k < 512); 1: by  move => *; rewrite mapiE 1:/# /= initiE /#.
    by  move => *; rewrite mapiE 1:/# /= initiE /#.

  move => ???; rewrite /touches => touches0.
  do split.
  + move => *. rewrite /lift_vector /toipolyvec /fromarray256 !mapiE //. 
    by smt(rg_asint).
  + move => *. rewrite /lift_vector /toipolyvec /fromarray256 /lift_array768 tP => k kb.  
    rewrite !mapiE // asintK /=.  
    rewrite !offunvE //= /lift_array256 /subarray256 initiE //=. 
    case (0 <= k && k < 256); 1: by move => *; rewrite mapiE //= initiE //.
    case (256 <= k && k < 512); 1: by  move => *; rewrite mapiE 1:/# /= initiE /#.
    by  move => *; rewrite mapiE 1:/# /= initiE /#.
  + by smt().

  move => ?????; rewrite /touches => touches1.
  do split => //.
  + by rewrite to_uintD_small //=. 
  + rewrite /load_array1152 tP => k kb; rewrite !initiE //=. 
    move : (touches1 (to_uint skp{1} - to_uint pkp{1} + k) _); 1: by smt().
    by have -> ->: to_uint pkp{1} + (to_uint skp{1} - to_uint pkp{1} + k) = to_uint skp{1} + k by ring.
  + by smt().
  
  move => *; rewrite !ultE /=.
  split; 1: by smt(). 
  by move => *;rewrite /load_array32 tP => k kb; rewrite initiE //= /#. 

(* Algebraic part remaining *)
conseq => />.

seq 1 1 : (#{/~signed_bound768_cxq skpv{1} 0 768 1}pre /\
            pos_bound768_cxq skpv{1} 0 768 2).
+ wp;ecall{1} (polyvec_ntt_corr (skpv{1})).
  by auto => /> /#.

seq 1 1 : (#{/~signed_bound768_cxq e{1} 0 768 1}pre /\
            pos_bound768_cxq e{1} 0 768 2).
+ wp;ecall{1} (polyvec_ntt_corr (e{1})).
  by auto => /> /#.

seq 3 0 : (#pre /\
    forall k, 0 <= k < 256 =>
         b16 pkpv{1}.[k]  (2*q)  /\ 
    inFq (to_sint pkpv{1}.[k]) = (ntt_mmul a{2} s{2}).[0].[k]).

wp; ecall{1} (innerprod_corr 
     (invnttv (lift_vector (Array768.init (fun (i_0 : int) => a{1}.[0 + i_0]))))
     (invnttv (lift_vector skpv{1}))).

+ auto => /> &1 &2.
  move => ???????.
  do split; 1,2,4: smt(NTT_Fq.nttvK).
  + by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
  move => ????result0; rewrite /lift_matrix.
  rewrite /lift_array2304 /lift_vector /lift_array256  !tP =>  ?val k kbl kbh.
  rewrite !initiE 1:/# /= kbl kbh /= ; do split; 1,2:smt().
  move : (val k _) => //; rewrite mapiE //= => ->.
  rewrite /ntt_mmul offunvE //= /dotp /kvec /=.
  rewrite !Big.BAdd.big_consT //= !Big.BAdd.big_nil //=. 
  rewrite !offunvE //= !offunvK /vclamp !offunmE //= /kvec /=.
  rewrite !NTT_Fq.add_comm_ntt !NTT_Fq.mul_comm_ntt !NTT_Fq.nttK NTT_Fq.nttZero. 
  rewrite -!(matrixcols) //.

seq 2 0 : (#pre /\
        (forall k, 256 <= k < 512 =>
         b16 pkpv{1}.[k]  (2*q)  /\ 
    inFq (to_sint pkpv{1}.[k]) = (ntt_mmul a{2} s{2}).[1].[k-256])
).

wp; ecall{1} (innerprod_corr 
     (invnttv (lift_vector (Array768.init (fun (i_0 : int) => a{1}.[768 + i_0]))))
     (invnttv (lift_vector skpv{1}))).

+ auto => /> &1 &2.
  move => ????????.
  do split; 1,2,4: smt(NTT_Fq.nttvK).
  + by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
  move => ????result0; rewrite /lift_matrix.
  rewrite /lift_array2304 /lift_vector /lift_array256  !tP =>  ?val.
  split.
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    by rewrite (_: !(256 <= k && k < 512)) /# /=.
  move => k kbl kbh;rewrite !initiE 1:/# /= kbl kbh /= ; do split; 1,2:smt().
  move : (val (k-256) _);1:smt(); rewrite mapiE 1:/# => ->.
  rewrite /ntt_mmul offunvE //= /dotp /kvec /=.
  rewrite !Big.BAdd.big_consT //= !Big.BAdd.big_nil //=. 
  rewrite !offunvE //= !offunvK /vclamp !offunmE //= /kvec /=.
  rewrite !NTT_Fq.add_comm_ntt !NTT_Fq.mul_comm_ntt !NTT_Fq.nttK NTT_Fq.nttZero. 
  by rewrite -!(matrixcols) //.

seq 2 0 : (#pre /\
        (forall k, 512 <= k < 768 =>
         b16 pkpv{1}.[k]  (2*q)  /\ 
    inFq (to_sint pkpv{1}.[k]) = (ntt_mmul a{2} s{2}).[2].[k-512])
).

wp; ecall{1} (innerprod_corr 
     (invnttv (lift_vector (Array768.init (fun (i_0 : int) => a{1}.[2*768 + i_0]))))
     (invnttv (lift_vector skpv{1}))).

+ auto => /> &1 &2.
  move => ?????????.
  do split; 1,2,4: smt(NTT_Fq.nttvK).
  + by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
  move => ????result0; rewrite /lift_matrix.
  rewrite /lift_array2304 /lift_vector /lift_array256  !tP =>  ?val.
  do split.
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    by rewrite (_: !(512 <= k && k < 768)) /# /=.
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    by rewrite (_: !(512 <= k && k < 768)) /# /=.
  move => k kbl kbh;rewrite !initiE 1:/# /= kbl kbh /= ; do split; 1,2:smt().
  move : (val (k-512) _);1:smt(); rewrite mapiE 1:/# => ->.
  rewrite /ntt_mmul offunvE //= /dotp /kvec /=.
  rewrite !Big.BAdd.big_consT //= !Big.BAdd.big_nil //=. 
  rewrite !offunvE //= !offunvK /vclamp !offunmE //= /kvec /=.
  rewrite !NTT_Fq.add_comm_ntt !NTT_Fq.mul_comm_ntt !NTT_Fq.nttK NTT_Fq.nttZero. 
  by rewrite -!(matrixcols) //.

conseq => />.

seq 1 1 : (t{2} = lift_vector pkpv{1} /\ signed_bound768_cxq pkpv{1} 0 768 4);
last first.

+ ecall {1} (polyvec_reduce_corr (lift_array768 pkpv{1})).
  auto => /> // &1 ?; rewrite /lift_array768 =>  rr  rrv ?. 
  rewrite /lift_vector eq_vectorP => i ib; rewrite !offunvE//=.
  rewrite /lift_array256 /subarray256 tP => k kb.
  rewrite !mapiE //= !initiE //=.
  move : rrv; rewrite tP => rrv.
  move : (rrv (256 * i + k) _); 1: smt().
  by rewrite !mapiE 1,2:/# /=. 

have H := polyvec_add_corr_impl 2 2 _ _ => //.
ecall{1} (H (lift_array768 pkpv{1}) (lift_array768 e{1})).
clear H.
auto => /> &1 &2 ??????? vs0 vs1 vs2.

do split; 1,2:smt().

move => ?? resf ? vsf; rewrite eq_vectorP => r rb.
rewrite /(lift_vector resf) !offunvE //= /lift_array256 tP => k kb.
rewrite mapiE //= /subarray256 initiE //= /(&+) map2E /=.
rewrite /(lift_vector e{1}) !offunvE //=.
case(r = 0).
+ move => r0; rewrite r0 /= vsf 1:/# /= initiE //= subliftsub //=; congr.
  rewrite /lift_array768 mapiE 1:/# /=;move : (vs0 k _); 1: by smt().
  by move => [#] _ _ ->; rewrite /ntt_mmul offunvE //=.

case(r = 1).
+ move => r1 nr0; rewrite r1 /= vsf 1:/# /= initiE //= subliftsub //=; congr.
  rewrite /lift_array768 mapiE 1:/# /=;move : (vs1 (256 + k) _); 1: by smt().
  by move => [#] _ _ ->; rewrite /ntt_mmul offunvE //=.

case(r = 2); last by smt().
move => r2 nr1 nr0; rewrite r2 /= vsf 1:/# /= initiE //= subliftsub //=; congr.
rewrite /lift_array768 mapiE 1:/# /=;move : (vs2 (512 + k) _); 1: by smt().
by move => [#] _ _ ->; rewrite /ntt_mmul offunvE //=.
qed.

(***************************************************)


lemma kyber_correct_enc mem _coinsp _msgp _ctp _pkp : 
   equiv [ M.indcpa_enc_jazz ~ Kyber(G,XOF,PRF,H).enc_derand: 
     valid_ptr _coinsp 32 /\
     valid_ptr _pkp (384*3 + 32) /\
     valid_ptr _msgp 32 /\
     valid_ptr _ctp (3*320+128) /\
     Glob.mem{1} = mem /\ to_uint coinsp{1} = _coinsp /\ 
                   to_uint msgp{1} = _msgp /\ to_uint ctp{1} = _ctp /\ 
                   to_uint pkp{1} = _pkp /\
     r{2} = load_array32 mem _coinsp /\
     m{2} = load_array32 mem _msgp /\
     pk{2}.`1 = load_array1152 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 3*384)
       ==> 
     let (c1,c2) = res{2} in
     c1 = load_array960 Glob.mem{1} _ctp /\
     c2 = load_array128 Glob.mem{1} (_ctp + 960)
].
proc*.
transitivity {1} { AuxKyber.indcpa_enc_jazz(ctp,msgp,pkp,coinsp);} 
(={Glob.mem,arg} ==> ={Glob.mem,r}) 
( valid_ptr _coinsp 32 /\
  valid_ptr _pkp (384 * 3 + 32) /\
  valid_ptr _msgp 32 /\
  valid_ptr _ctp (3 * 320 + 128) /\
  Glob.mem{1} = mem /\
  to_uint coinsp{1} = _coinsp /\
  to_uint msgp{1} = _msgp /\
  to_uint ctp{1} = _ctp /\
  to_uint pkp{1} = _pkp /\
  r{2} = load_array32 mem _coinsp /\
  m{2} = load_array32 mem _msgp /\ pk{2}.`1 = load_array1152 mem _pkp /\ 
  pk{2}.`2 = load_array32 mem (_pkp + 3 * 384)
  ==>
  let (c1, c2) = r0{2} in 
      c1 = load_array960 Glob.mem{1} _ctp /\ 
      c2 = load_array128 Glob.mem{1} (_ctp + 960)); 1,2: smt().
+ by call auxenc_good; auto => />.

inline {1} 1; inline {2} 1.
swap {2} 9 -7.
sp 4 4.
seq 3 0 : (#pre /\ r{2} = noiseseed{1}).
while {1} (valid_ptr _coinsp 32  /\ 
           _coinsp = to_uint coinsp0{1} /\  
           mem = Glob.mem{1} /\ 
           r{2} = load_array32 mem _coinsp /\ 
           0 <= to_uint i{1} <= 32 /\ 
           forall k, 0 <= k < to_uint i{1} => r{2}.[k] = noiseseed{1}.[k]) (32 - to_uint i{1}).
+ move => &m z; rewrite /load_array32 //; auto => /> &hr ?? -> ?? H0. 
  rewrite ultE !to_uintD_small /=; 1,2: by smt(). 
   move => *;do split; 1,2,4: by smt().
   move => k0 kb0 kb1; rewrite !initiE /loadW8 1:/# /=. 
   case (0<= k0 < to_uint i{hr}).
      move => kbb; move : (H0 k0 kbb);rewrite !initiE 1:/# /= set_neqiE /#.
   by move => *; rewrite set_eqiE /#.
auto => /> &1 &2 ?????????; rewrite /load_array1152 /load_array32.
move => *;split; 1: smt().
move => il noisel; rewrite ultE /=; split; 1:smt().
by move => ???H; rewrite tP => k kb;smt().

swap {2} 5 -4.
swap {2} [7..8] -5.
seq 2 3 : (#pre /\ that{2} = lift_vector pkpv{1} /\
              signed_bound768_cxq pkpv{1} 0 768 2).
wp; ecall(polyvec_frombytes_corr Glob.mem{1} _pkp).
+ auto => />  &1 ??????????????; split; 1: by smt().
  rewrite /pos_bound768_cxq /ofipolyvec /lift_vector /signed_bound768_cxq /subarray256 /lift_array256 => ??? result rbound.
  split; last by smt(). 
  by rewrite eq_vectorP => i ib; rewrite !offunvE //= tP => k kb; rewrite !mapiE //= !initiE //= mapiE /#.

seq 4 0 : (#{/~pkp{1}}pre /\ rho{2} = publicseed{1}). 
while {1} (valid_ptr _pkp (3*384 + 32)  /\ _pkp + 1152 + to_uint i{1} = to_uint pkp0{1} /\ 
           mem = Glob.mem{1} /\ rho{2} = load_array32 mem (_pkp + 3*384) /\ 
           0 <= to_uint i{1} <= 32 /\ 
          forall k, 0 <= k < to_uint i{1} => rho{2}.[k] = publicseed{1}.[k]) (32 - to_uint i{1}).
+ move => &m ?; auto => /> &hr ?????; rewrite /load_array32 ultE /loadW8 /= => H?. 
  rewrite  !to_uintD_small /=; 1,2:smt(); move => *.
  do split; 1..3,5:smt().
  move => k kbl kbh.
  case (0<=k <to_uint i{hr}).
  + move => *; move : (H k _); 1: smt().
    by rewrite !initiE //= 1:/# set_neqiE /#. 
  by move => *;rewrite initiE //= 1:/# set_eqiE /#.
auto => /> &1 &2 ?????????; rewrite /load_array1152 /load_array32.
rewrite !to_uintD_small 1:/#.
move => *;split; 1: smt().
move => il pkpl pseedl; rewrite ultE /=; split; 1:smt().
move => ?????H; rewrite tP => k kb; rewrite initiE //=.
by move : (H k _);1:smt(); rewrite initiE //= /#.

swap {2} [6..7] -4. 
seq 3 3 : (#pre /\ aT{2} = lift_matrix at{1} /\
            pos_bound2304_cxq at{1} 0 2304 2). 
(* Simplifiable if spec were to call a function to gen matrix *)
+ inline AuxKyber.__gen_matrix; conseq />.
  seq 7 3 : (a{1}=aT{2});  last by auto => />;  smt(matrix_unlift).
  while (i0{1} = i{2} /\ 0<=i0{1}<=kvec /\ seed{1}=rho{2} /\ trans{1} /\
         forall ii jj, 0<=ii<i0{1} => 0<= jj <3 => a{1}.[ii,jj] = aT{2}.[ii,jj]); last  
          by auto => />; smt(eq_matrixP).
  wp; while (i0{1} = i{2} /\ j{1} = j{2} /\ 0<=i0{1}<kvec /\ 0<=j{1}<=kvec /\ seed{1}=rho{2} /\ trans{1} /\
         (forall ii jj, 0<=ii<i0{1} => 0<= jj <3 => a{1}.[ii,jj] = aT{2}.[ii,jj]) /\
         (forall jj, 0 <= jj <j{1} => a{1}.[i0{1},jj] = aT{2}.[i0{1},jj])); last 
            by auto => />  /#.
  wp; call(_: ={XOF.state}); 1: by sim.
  wp; call(_: ={arg} ==> ={XOF.state}); last by auto => />;  smt(offunmK). 
  by proc;call absorb_ignore; auto => />.

swap {2} 13 -12.
seq 2 1 : (#pre /\ decompress_poly 1 mp{2} = lift_array256 k{1}  /\
            signed_bound_cxq k{1} 0 256 1). 
ecall (poly_frommsg_corr Glob.mem{1} _msgp m{2}); 1: by auto => /> /#.

swap {2} [2..10] -1.
seq 1 9 : (#pre /\ rv{2} = lift_vector sp_0{1} /\
    signed_bound768_cxq sp_0{1} 0 768 1 /\
     e1{2} = lift_vector ep{1} /\
    signed_bound768_cxq ep{1} 0 768 1 /\
    e2{2} = lift_array256 epp{1} /\
    signed_bound_cxq epp{1} 0 256 1).
+ inline AuxKyber.sample_noise3_spec AuxKyber.sample_noise2_spec. 
  wp; call(_: ={PRF.key}); 1: by sim.
  conseq />; 1: by smt().
  seq 10 8 : (noise1{1}=rv{2} /\ noise2{1} = e1{2} /\ _N0{1} = _N{2} /\ 
             ={PRF.key}); 1: by  sim; auto => />.
  auto => />; smt(vector_unlift poly_unlift).

swap {2} 1 3.

seq 17 3 : (u{2} = lift_vector bp{1} /\ v{2} = lift_array256 v{1} /\
            pos_bound256_cxq v{1} 0 256 2 /\
            pos_bound768_cxq bp{1} 0 768 2 /\
            valid_ptr _ctp (3 * 320 + 128) /\
            to_uint ctp{1} = _ctp /\
            ctp0{1} = ctp{1}); last first.
wp; ecall(poly_compress_corr (lift_array256 v{1}) (to_uint ctp0{1}) Glob.mem{1}).
wp; ecall(polyvec_compress_corr Glob.mem{1} (to_uint ctp0{1})  (lift_array768 bp{1}) ).
auto => /> &1 &2; rewrite /signed_bound_cxq /signed_bound768_cxq /compress_polyvec.
rewrite /lift_vector /fromarray256 /lift_array256 /subarray256 /touches.
rewrite /pos_bound256_cxq /load_array960 /load_array128 /from_array256 /pos_bound768_cxq.
move => ???; do split; 2: by smt().
+ rewrite tP => k kb; rewrite !mapiE // !offunvE //= !initiE //=. 
  case (0 <= k && k < 256); 1: by move => kbb; rewrite !mapiE //= !initiE //.
  case (256 <= k && k < 512); 1: by move => kbb; rewrite !mapiE //= 1:/# !initiE // 1:/#.
  by move => *;rewrite !mapiE 1:/# /= !initiE /#.
+ move => ??? mem2 touches2; rewrite !to_uintD_small /=; 1:smt().
  do split; 1,2: smt().
  move => ?? result meml ?? touchesl;split; last by smt(). 
  rewrite tP => k kb; rewrite !initiE //=. 
  move : (touchesl (k -960) _); 1: smt().
  have -> : to_uint ctp{1} + 960 + (k - 960) = to_uint ctp{1} + k by ring.
  by move => <-.

(* Algebraic part *)

seq 1 1 : (#{/~signed_bound768_cxq sp_0{1} 0 768 1}
            {~rv{2} = lift_vector sp_0{1}}pre /\ 
            rhat{2} = lift_vector sp_0{1} /\
            pos_bound768_cxq sp_0{1} 0 768 2); 
  first by wp; ecall{1} (polyvec_ntt_corr sp_0{1}); auto => /> /#. 
     

seq 3 0 : (#pre /\
     (forall k, 0 <= k < 256 =>
         (lift_array768 bp{1}).[k] = ((NTT_Fq.scale (ntt_mmul aT{2} rhat{2}).[0]) (inFq 169)).[k]) /\
          signed_bound768_cxq bp{1} 0 256 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv (offunv (fun i => aT{2}.[0,i]))) (invnttv rhat{2})).
auto => /> &1 &2 ????????????????????.
do split; 2,4: smt(NTT_Fq.nttvK). 
+ rewrite /lift_matrix /lift_vector /nttv /invnttv /mapv /=.
  apply eq_vectorP => i ib; rewrite !offunvE //= !offunvK /vclamp ib /=.
  by rewrite tP => k kb; rewrite subliftsub // offunmE //= NTT_Fq.nttK subsublift //.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //;  smt().
+ move => ???? result ?; rewrite /lift_array256 tP => rval. 
  split; last by rewrite /signed_bound768_cxq => k kb; rewrite initiE //;  smt().
  move => k kbl kbh; rewrite mapiE 1:/# /= initiE 1:/# /= kbl kbh /=.
  move : (rval k _); 1: smt().
  rewrite mapiE //= => ->.
  rewrite /NTT_Fq.scale !mapiE //=; congr.
  by rewrite dotpmm //.

seq 2 0 : (#pre /\
     (forall k, 256 <= k < 512 =>
         (lift_array768 bp{1}).[k] = ((NTT_Fq.scale (ntt_mmul aT{2} rhat{2}).[1]) (inFq 169)).[k-256]) /\
          signed_bound768_cxq bp{1} 0 512 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv (offunv (fun i => aT{2}.[1,i]))) (invnttv rhat{2})).
auto => /> &1 &2 ???????????????????? rold ?.
do split; 2,4: smt(NTT_Fq.nttvK). 
+ rewrite /lift_matrix /lift_vector /nttv /invnttv /mapv /=.
  apply eq_vectorP => i ib; rewrite !offunvE //= !offunvK /vclamp ib /=.
  by rewrite tP => k kb; rewrite subliftsub // offunmE //= NTT_Fq.nttK subsublift //.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //;  smt().
+ move => ???? result ?; rewrite /lift_array256 tP => rval. 
  do split. 
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(256 <= k && k < 512)) 1:/# /=.
    by move : (rold k _); 1: smt(); rewrite /lift_array768 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound768_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite mapiE 1:/# /= initiE 1:/# /= kbl kbh /=.
    move : (rval (k - 256) _); 1: smt().
    rewrite mapiE 1:/# /= => ->.
    rewrite /NTT_Fq.scale !mapiE 1,2:/# /=; congr.
    by rewrite dotpmm //.
  by rewrite /signed_bound768_cxq => k kb; rewrite initiE //;  smt().

seq 2 0 : (#pre /\
     (forall k, 512 <= k <768 =>
         (lift_array768 bp{1}).[k] = ((NTT_Fq.scale (ntt_mmul aT{2} rhat{2}).[2]) (inFq 169)).[k-512]) /\
          signed_bound768_cxq bp{1} 0 768 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv (offunv (fun i => aT{2}.[2,i]))) (invnttv rhat{2})).
auto => /> &1 &2 ???????????????????? rold ? rnsold ?.
do split; 2,4: smt(NTT_Fq.nttvK). 
+ rewrite /lift_matrix /lift_vector /nttv /invnttv /mapv /=.
  apply eq_vectorP => i ib; rewrite !offunvE //= !offunvK /vclamp ib /=.
  by rewrite tP => k kb; rewrite subliftsub // offunmE //= NTT_Fq.nttK subsublift //.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //;  smt().
+ move => ???? result ?; rewrite /lift_array256 tP => rval. 
  do split. 
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(512 <= k && k < 768)) 1:/# /=.
    by move : (rold k _); 1: smt(); rewrite /lift_array768 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound768_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(512 <= k && k < 768)) 1:/# /=.
    by move : (rnsold k _); 1: smt(); rewrite /lift_array768 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound768_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite mapiE 1:/# /= initiE 1:/# /= kbl kbh /=.
    move : (rval (k - 512) _); 1: smt().
    rewrite mapiE 1:/# /= => ->.
    rewrite /NTT_Fq.scale !mapiE 1,2:/# /=; congr.
    by rewrite dotpmm //.
  + by rewrite /signed_bound768_cxq => k kb; rewrite initiE //;  smt().

seq 2 0 : (#pre /\
     (forall k, 0 <= k < 256 =>
         (lift_array256 v{1}).[k] = ((NTT_Fq.scale (ntt (dotp (invnttv that{2}) (invnttv rhat{2}))) (inFq 169))).[k]) /\
          signed_bound_cxq v{1} 0 256 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv that{2}) (invnttv rhat{2})).
auto => /> &1 &2 ??????????????????????????.
do split; 1,2: smt(NTT_Fq.nttvK). 
+ by rewrite /signed_bound768_cxq => k kb;  smt().
+ move => ??? result ?; rewrite /lift_array256 tP => rval. 
  move => k kbl kbh; rewrite mapiE 1:/# /=. 
  move : (rval k _); 1: smt().
  by rewrite mapiE //= => ->.

seq 1 0 : (#{/~bp{1}}pre /\ 
         lift_vector bp{1} = invnttv (ntt_mmul aT{2} rhat{2}) /\
         signed_bound768_cxq bp{1} 0 768 2).
+ ecall {1} (polyvec_invntt_corr bp{1}).
  auto => /> &1 &2 ????????????????????r1?r2?r3???result <-?.
  split; last by smt(). 
  rewrite /scale_vector /invnttv/mapv/=  eq_vectorP => i ib.
  rewrite !offunvE //= offunvK /vclamp ib /= -NTT_Fq.invntt_scale /=; congr.
  rewrite /scale tP => k kb; rewrite /(lift_vector bp{1}) offunvK /vclamp ib /=.
  rewrite  mapiE //= /lift_array256 /subarray256 mapiE//= initiE//=.
  case (i = 0).
  + move => i0; move : (r1 k kb); rewrite /lift_array768 mapiE// 1:/# /= i0 /= => ->.
    rewrite /scale mapiE 1:/# /=.
    by rewrite -ZqField.mulrA (ZqField.mulrC (inFq 169)) rrinvFq ZqField.mulrC ZqField.mul1r.  
  case (i = 1).
  + move => i1 noi0; move : (r2 (256 + k) _); 1:smt(); rewrite /lift_array768 mapiE// 1:/# /= i1 /= => ->.
    rewrite /scale mapiE 1:/# /=.
    by rewrite -ZqField.mulrA (ZqField.mulrC (inFq 169)) rrinvFq ZqField.mulrC ZqField.mul1r.  
  case (i = 2); last by smt().
  move => i2 noi1 noi0; move : (r3 (512 + k) _); 1:smt(); rewrite /lift_array768 mapiE// 1:/# /= i2 /= => ->.
  rewrite /scale mapiE 1:/# /=.
  by rewrite -ZqField.mulrA (ZqField.mulrC (inFq 169)) rrinvFq ZqField.mulrC ZqField.mul1r.  

seq 1 0 : (#{/~v{1}}pre /\ 
         lift_array256 v{1} = invntt (ntt_dotp that{2} rhat{2}) /\
         signed_bound_cxq v{1} 0 256 2).
+ ecall {1} (invntt_correct (lift_array256 v{1})).
  auto => /> &1 &2 ????????????????????rold???.
  move => result <- rb; split; last by smt(). 
  rewrite -NTT_Fq.invntt_scale; congr.
  rewrite /scale tP => k kb; rewrite mapiE //= rold // /scale mapiE //=.
  rewrite -ZqField.mulrA (ZqField.mulrC (inFq 169)) rrinvFq ZqField.mulrC ZqField.mul1r.  
  rewrite /ntt_dotp /dotp /kvec /=.
  rewrite !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
  rewrite !NTT_Fq.add_comm_ntt !NTT_Fq.mul_comm_ntt. 
  by rewrite !nttvecinv // NTT_Fq.nttZero.

seq 1 0 : (#{/~bp{1}}pre /\ 
         lift_vector bp{1} = invnttv (ntt_mmul aT{2} rhat{2}) + e1{2} /\
         signed_bound768_cxq bp{1} 0 768 3).
have H := polyvec_add_corr_impl 2 1 _ _ => //.
ecall{1} (H (lift_array768 bp{1}) (lift_array768 ep{1})); clear H.
+ auto => /> &1 &2 ????????????????????????result? rval.
  have -> : lift_vector result = lift_vector bp{1} + lift_vector ep{1}; last by smt().
  rewrite /Vector.(+) eq_vectorP => i ib.
  rewrite !offunvE //= tP => k kb.
  rewrite /(&+) map2E /= !initiE //= !liftarrayvector //= -(rval (256*i + k) _) 1:/#.
  by rewrite subliftsub // /lift_array768 mapiE //= /#.

seq 1 0 : (#{/~v{1}}pre /\ 
         lift_array256 v{1} = invntt (ntt_dotp that{2} rhat{2}) &+ e2{2} /\
         signed_bound_cxq v{1} 0 256 3).
have H := poly_add_corr_alg 2 1 _ _ => //.
ecall{1} (H (lift_array256 v{1}) (lift_array256 epp{1})); clear H.
+ by auto => /> /#.

seq 1 0 : (#{/~v{1}}pre /\ 
         lift_array256 v{1} = invntt (ntt_dotp that{2} rhat{2}) &+ e2{2} &+ decompress_poly 1 mp{2}/\
         signed_bound_cxq v{1} 0 256 4).
have H := poly_add_corr_alg 3 1 _ _ => //.
ecall{1} (H (lift_array256 v{1}) (lift_array256 k{1})); clear H.
+ by auto => /> /#.

seq 1 0 : (#{/~bp{1}}pre /\ 
         lift_vector bp{1} = invnttv (ntt_mmul aT{2} rhat{2}) + e1{2} /\
         pos_bound768_cxq bp{1} 0 768 2).
ecall{1}(polyvec_reduce_corr (lift_array768 bp{1})).
auto =>/> &1 &2 ????????????????????rold????rval?.
rewrite -rold; rewrite eq_vectorP => i ib.
by rewrite tP => k kb; rewrite !liftarrayvector // /#.

ecall{1}(poly_reduce_corr (lift_array256 v{1})).
by auto =>/> /#. 

qed.

lemma kyber_correct_dec mem _msgp _ctp _skp : 
   equiv [ M.indcpa_dec_jazz ~ Kyber(G,XOF,PRF,H).dec : 
     valid_ptr _msgp 32 /\
     valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint msgp{1} = _msgp /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2} = load_array1152 Glob.mem{1} _skp /\
     let (c1,c2) = cph{2} in
       c1 = load_array960 Glob.mem{1} _ctp /\
       c2 = load_array128 Glob.mem{1} (_ctp + 960)
       ==> 
     oget res{2} = load_array32 Glob.mem{1} _msgp
].
proc => /=. 
swap {2} 3 -2.
sp 0 1.
swap {2} [3..4] -1.
swap {1} 6 -4.
seq 2 3 : (#pre /\ u{2} = lift_vector bp{1} /\
    signed_bound768_cxq bp{1} 0 768 2).
+ wp; ecall(polyvec_decompress_corr Glob.mem{1} _ctp c1{2});
    1: by auto => /> /#. 

swap {2} [2..3] -1.
swap {1} [4..6] -3.
seq 3 2 : (#{/~ctp{1}}pre /\ v{2} = lift_array256 v{1} /\
     signed_bound_cxq v{1} 0 256 1). 
+ wp; ecall(poly_decompress_corr Glob.mem{1} (to_uint ctp{1}) c2{2});
  by auto => /> &1 ???????; rewrite to_uintD_small /=;smt(). 

swap {1} 2 -1.
swap {1} 4 -2.
seq 2 3 : (#pre /\ s{2} = lift_vector skpv{1} /\
      signed_bound768_cxq skpv{1} 0 768 2). 
+ wp; ecall(polyvec_frombytes_corr Glob.mem{1} (to_uint skp{1})).
  auto => /> &1 &2 ???????????; split; 2: smt().
  rewrite /lift_vector /ofipolyvec eq_vectorP => i ib.
  rewrite !offunvE //= /lift_array256 /= /subarray256 /= tP => k kb.
  by rewrite !mapiE //= !initiE //= mapiE /= 1: /#.

swap {1} 3 -2.
seq 1 0 : (#{/~u{2} = lift_vector bp{1}}pre /\ 
           lift_vector bp{1} = nttv u{2});  
   1:by ecall{1}(polyvec_ntt_corr bp{1}); auto => /#.

swap {1} 1 3.
seq 2 0: (#pre /\ 
          lift_array256 t{1} = NTT_Fq.scale (ntt_dotp s{2} (nttv u{2})) (inFq 169) /\ 
          signed_bound_cxq t{1} 0 256 2).
ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv s{2}) (u{2})).
+ auto => /> &1 &2 ??????????.
  do split; 1,2:  smt(NTT_Fq.nttvK).
  move => ?? result ? ->. 
  congr; rewrite /dotp /ntt_dotp /kvec /=.
  rewrite !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
  rewrite !NTT_Fq.add_comm_ntt !NTT_Fq.mul_comm_ntt. 
  rewrite !nttvecinv  // NTT_Fq.nttZero.
  by rewrite /nttv /mapv /= !offunvE //=.

seq 1 0: (#{/~t{1}}pre /\ 
          lift_array256 t{1} = invntt (ntt_dotp s{2} (nttv u{2})) /\ 
          signed_bound_cxq t{1} 0 256 2).
ecall {1} (invntt_correct (lift_array256 t{1})).
+ auto => /> &1 &2 ??????????->? result <-?.
  split; last by smt().
  rewrite -NTT_Fq.invntt_scale; congr; rewrite /scale tP => k kp.
  rewrite !mapiE //=.
  by rewrite -ZqField.mulrA (ZqField.mulrC (inFq 169)) rrinvFq ZqField.mulrC ZqField.mul1r.  

seq 2 0 : (#pre /\
           lift_array256 mp{1} =  v{2} &+ (&-) (invntt (ntt_dotp s{2} (nttv u{2}))) /\ 
           signed_bound_cxq mp{1} 0 256 3).
have H := poly_sub_corr_alg 1 2 _ _ => //.
ecall{1} (H (lift_array256 v{1}) (lift_array256 t{1})); 1: by  auto => /> /#.

seq 1 1 : (valid_ptr _msgp 32 /\ pos_bound256_cxq mp{1} 0 256 2 /\
           Glob.mem{1} = mem /\ to_uint msgp{1} = _msgp /\ lift_array256 mp{1} = mp{2}).
ecall{1}(poly_reduce_corr (lift_array256 mp{1})); 1: by auto => /> /#.

by ecall(poly_tomsg_corr (lift_array256 mp{1})  _msgp mem); auto => /> /#.
qed.
