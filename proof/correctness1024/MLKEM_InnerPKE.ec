require import AllCore IntDiv List.

from Jasmin require import JModel.

from CryptoSpecs require import GFq Rq Serialization Symmetric Sampling VecMat InnerPKE1024 Correctness1024.
import Serialization1024 Symmetric1024 VecMat1024.

require import MLKEM_Poly MLKEM_PolyVec W16extra NTT_Fq.

from JazzEC require import Array25 Array32 Array33 Array34 Array64 Array128 Array160 Array168 Array256 Array1024.
from JazzEC require import Array1408 Array1152 Array4096 Array1568 Array1536 WArray32 WArray33 WArray64.

from JazzEC require import Jkem1024.

require import MLKEMFCLib.
import PolyVec PolyMat InnerPKE1024.
import MLKEM_Poly MLKEM_PolyVec.

import KMatrix.
import Vector.
import Zq.

op lift_matrix( a : W16.t Array4096.t) : polymat =
   Matrix.offunm (fun i j => subarray256 (subarray1024 (lift_array4096 a) i) j).

lemma matrixcols (m : 'a Array4096.t) (f : 'a -> 'b) i j : 0 <= i < 4 => 0<=j <4 =>
    Array256.map f (subarray256 ((Array1024.init ((fun (i_0 : int) => m.[j*1024 + i_0])))) i) =
                      (subarray256 (subarray1024 (map f m) j) i).
move => ib jb;rewrite /subarray256 /subarray1024 tP => k kb.
by rewrite mapiE //= !initiE //= !initiE 1,2:/# /= mapiE /#.
qed. 


op unlift_matrix(a : polymat) = Array4096.init 
   (fun i => W16.of_int (asint (a.[i %/ 1024,i %% 1024 %/ 256].[i %% 256]))%Matrix).

lemma matrix_unlift a : 
    lift_matrix (unlift_matrix a) = a /\
    pos_bound4096_cxq (unlift_matrix a) 0 4096 2.
proof.
split. 
+ rewrite /lift_matrix /unlift_matrix eq_matrixP => i j bounds.
  rewrite offunmE //= /subarray256 /subarray768 /lift_array4096 /= tP => k kb.
  rewrite initiE //= initiE 1:/# /= mapiE 1:/# /= initiE 1:/# /= /to_sint /smod /=.
  rewrite !of_uintK /= !(modz_small _ 65536); 1: smt(rg_asint). 
  rewrite !(mulzC 1024) !(edivz_eq) 1:/# !(emodz_eq) 1:/# fun_if !asintK. 
  rewrite !(mulzC 256) !(edivz_eq) 1:/#. 
  rewrite (_: i*1024 = (4*i)*256) 1:/# !modzMDl.
  by smt(rg_asint).
rewrite /unlift_matrix /pos_bound4096_cxq => k kb; rewrite initiE //=.
rewrite to_sint_unsigned.
+ rewrite /to_sint of_uintK /= modz_small; 1: by smt(rg_asint). 
  by rewrite /smod /=; smt(rg_asint qE).
rewrite of_uintK /= modz_small; 1: by smt(rg_asint). 
  by rewrite /smod /=; smt(rg_asint qE).
qed.


require import MLKEM_keccak_ref.

(** AS AN INTERMEDIATE STEP WE RESHUFFLE THE EXTRACTED CODE TO BETTER
    MATCH THE STRUCTURE OF THE SPEC AND PROVE EQUIVALENCE *)
module AuxMLKEM= {

proc __gen_matrix(seed : W8.t Array32.t, trans : bool) : W16.t Array4096.t = {
  var a: polymat;
  var i, j,c;
  a <- witness;                       
  i <- 0;                       
  while (i < kvec) {                  
    j <- 0;                          
    while (j < kvec) {                
      XOF.init(seed, if trans then i else j, 
                        if trans then j else i);        
      c <@ Parse(XOF).sample();
      a <- (a.[i, j <- c])%MLKEM1024;         
      j <- j + 1;                      
    }                                 
    i <- i + 1;                       
  }                                   
  return unlift_matrix a;
}

proc sample_noise2_jasmin(noiseseed:W8.t Array32.t) : W16.t Array1024.t * W16.t Array1024.t = {
    var nonce,aux;
    var noise1:W16.t Array1024.t;    
    var noise2:W16.t Array1024.t;    
    noise1 <- witness;
    noise2 <- witness;
    nonce <- (W8.of_int 0);
    aux <@Jkem1024.M(Jkem1024.Syscall)._poly_getnoise ((Array256.init (fun i_0 => noise1.[0 + i_0])),
    noiseseed, nonce);
    noise1 <- Array1024.init
            (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else noise1.[i]);
    nonce <- (W8.of_int 1);
    aux <@Jkem1024.M(Jkem1024.Syscall)._poly_getnoise ((Array256.init (fun i_0 => noise1.[256 + i_0])),
    noiseseed, nonce);
    noise1 <- Array1024.init
            (fun i => if 256 <= i < 256 + 256 then aux.[i-256]
            else noise1.[i]);
    nonce <- (W8.of_int 2);
    aux <@Jkem1024.M(Jkem1024.Syscall)._poly_getnoise ((Array256.init (fun i_0 => noise1.[(2 * 256) + i_0])),
    noiseseed, nonce);
    noise1 <- Array1024.init
            (fun i => if (2 * 256) <= i < (2 * 256) + 256
            then aux.[i-(2 * 256)] else noise1.[i]);
    nonce <- (W8.of_int 3);
    aux <@Jkem1024.M(Jkem1024.Syscall)._poly_getnoise ((Array256.init (fun i_0 => noise1.[(3 * 256) + i_0])),
    noiseseed, nonce);
    noise1 <- Array1024.init
            (fun i => if (3 * 256) <= i < (3 * 256) + 256
            then aux.[i-(3 * 256)] else noise1.[i]);
    nonce <- (W8.of_int 4);
    aux <@Jkem1024.M(Jkem1024.Syscall)._poly_getnoise ((Array256.init (fun i_0 => noise2.[0 + i_0])),
    noiseseed, nonce);
    noise2 <- Array1024.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else noise2.[i]);
    nonce <- (W8.of_int 5);
    aux <@Jkem1024.M(Jkem1024.Syscall)._poly_getnoise ((Array256.init (fun i_0 => noise2.[256 + i_0])),
    noiseseed, nonce);
    noise2 <- Array1024.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else noise2.[i]);
    nonce <- (W8.of_int 6);
    aux <@Jkem1024.M(Jkem1024.Syscall)._poly_getnoise ((Array256.init (fun i_0 => noise2.[(2 * 256) + i_0])),
    noiseseed, nonce);
    noise2 <- Array1024.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else noise2.[i]);
    nonce <- (W8.of_int 7);
    aux <@Jkem1024.M(Jkem1024.Syscall)._poly_getnoise ((Array256.init (fun i_0 => noise2.[(3 * 256) + i_0])),
    noiseseed, nonce);
    noise2 <- Array1024.init
         (fun i => if (3 * 256) <= i < (3 * 256) + 256 then aux.[i-(3 * 256)]
         else noise2.[i]);
    return (noise1,noise2);
}

proc sample_noise2_spec(noiseseed:W8.t Array32.t) : W16.t Array1024.t * W16.t Array1024.t * int= {
  var noise1, noise2, _N,i,c;
  noise1 <- witness;                     
  noise2 <- witness;                      
  _N <- 0;                      
  i <- 0;                             
  while (i < kvec) {  
    c <@ CBD2.sample(PRF noiseseed (W8.of_int _N));
    noise1 <- (noise1.[i<-c])%PolyVec;                   
    _N <- _N + 1;                     
    i <- i + 1;                       
  }                                  
  i <- 0;                             
  while (i < kvec) {                 
    c <@ CBD2.sample(PRF noiseseed (W8.of_int _N));
    noise2 <- (noise2.[i<-c])%PolyVec;                   
    _N <- _N + 1;                     
    i <- i + 1;                       
  }                                  

  return (unlift_polyvec noise1,unlift_polyvec noise2,_N);
}

proc sample_noise3_jasmin(noiseseed:W8.t Array32.t) : W16.t Array1024.t * W16.t Array1024.t * W16.t Array256.t= {
  var noise1, noise2, nonce,noise3;
  (noise1,noise2) <@ sample_noise2_jasmin(noiseseed);
  nonce <- (W8.of_int 8);
  noise3 <- witness;
  noise3 <@Jkem1024.M(Jkem1024.Syscall)._poly_getnoise (noise3,noiseseed, nonce);
  return (noise1,noise2,noise3);
}

proc sample_noise3_spec(noiseseed:W8.t Array32.t) : W16.t Array1024.t * W16.t Array1024.t * W16.t Array256.t= {
  var e, s, _N,e2, bytes;
  (s,e,_N) <@ sample_noise2_spec(noiseseed);
  bytes <- PRF noiseseed (W8.of_int _N);         
  e2 <@ CBD2.sample(bytes);
  return (s,e, unlift_poly e2);
}

proc indcpa_keypair_jazz (pkp:W64.t, skp:W64.t, seed:W8.t Array32.t) : unit = {
    var aux: W16.t Array256.t;
    var _N : int;
    var spkp:W64.t;
    var sskp:W64.t;
    var i:int;
    var c:W8.t;
    var publicseed:W8.t Array32.t;
    var noiseseed:W8.t Array32.t;
    var zero:W64.t;
    var a:W16.t Array4096.t;
    var nonce:W8.t;
    var skpv:W16.t Array1024.t;
    var e:W16.t Array1024.t;
    var pkpv:W16.t Array1024.t;
    var buf2 : W8.t Array32.t * W8.t Array32.t;
    var buf : W8.t Array64.t;
    var _aux : int;
    var t64 : W64.t;


    buf2 <- G_coins_ds seed;
    buf <- Array64.init (fun k => if 0<=k<32 then buf2.`1.[k] else buf2.`2.[k-32]);

    publicseed <- witness;
    noiseseed <- witness;

    _aux <- (32 %/ 8);
    i <- 0;
    while (i < _aux) {
      t64 <- (get64 (WArray64.init8 (fun i => buf.[i])) i);
      publicseed <-
      Array32.init
      (WArray32.get8 (WArray32.set64 (WArray32.init8 (fun i => publicseed.[i])) i (t64)));
      t64 <- (get64 (WArray64.init8 (fun i => buf.[i])) (i + 32 %/ 8));
      noiseseed <-
      Array32.init
      (WArray32.get8 (WArray32.set64 (WArray32.init8 (fun i => noiseseed.[i])) i (t64)));
      i <- i + 1;
    }

    a <- witness;
    a <@ __gen_matrix (publicseed,false);

    pkpv <- witness;               

    (skpv,e,_N) <@ sample_noise2_spec(noiseseed);

    skpv <@Jkem1024.M(Jkem1024.Syscall).__polyvec_ntt (skpv);
    e <@Jkem1024.M(Jkem1024.Syscall).__polyvec_ntt (e);

    aux <@ Aux.inner_product ((Array1024.init (fun i_0 => a.[0 + i_0])),skpv);
    pkpv <- Array1024.init (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else pkpv.[i]);
    aux <@ Aux.inner_product((Array1024.init (fun i_0 => a.[4*256 + i_0])),skpv);
    pkpv <- Array1024.init (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else pkpv.[i]);
    aux <@ Aux.inner_product ((Array1024.init (fun i_0 => a.[(2 * (4 * 256)) + i_0])), skpv);
    pkpv <- Array1024.init (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)] else pkpv.[i]);
    aux <@ Aux.inner_product ((Array1024.init (fun i_0 => a.[(3 * (4 * 256)) + i_0])), skpv);
    pkpv <- Array1024.init (fun i => if (3 * 256) <= i < (3 * 256) + 256 then aux.[i-(3 * 256)] else pkpv.[i]);

    pkpv <@Jkem1024.M(Jkem1024.Syscall).__polyvec_add2 (pkpv,e);
    pkpv <@Jkem1024.M(Jkem1024.Syscall).__polyvec_reduce (pkpv);

    spkp <- pkp;
    sskp <- skp;
    pkp <- spkp;
    skp <- sskp;

   Jkem1024.M(Jkem1024.Syscall).__polyvec_tobytes (skp, skpv);
   Jkem1024.M(Jkem1024.Syscall).__polyvec_tobytes (pkp, pkpv);
    pkp <- (pkp + (W64.of_int (4 * 384)));
    
    _aux <- (32 %/ 8);
    i <- 0;
    while (i < _aux) {
      t64 <- (get64 (WArray32.init8 (fun i => publicseed.[i])) i);
      Glob.mem <-
      storeW64 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))) (t64);
      pkp <- (pkp + (W64.of_int 8));
      i <- i + 1;
    }
    return ();
  }

  proc redcompr(ctp:W64.t,bp:W16.t Array1024.t) : unit = {
    bp <@Jkem1024.M(Jkem1024.Syscall).__polyvec_reduce (bp);
    Jkem1024.M(Jkem1024.Syscall).__polyvec_compress (ctp, bp);
  }

  proc indcpa_enc_jazz (ctp:W64.t, msgp:W8.t Array32.t, pkp:W64.t, noiseseed : W8.t Array32.t) : unit = {
    var aux: W16.t Array256.t;
    
    var sctp:W64.t;
    var i:W64.t;
    var c:W8.t;
    var pkpv:W16.t Array1024.t;
    var publicseed:W8.t Array32.t;
    var k:W16.t Array256.t;
    var one:W64.t;
    var at:W16.t Array4096.t;
    var nonce:W8.t;
    var sp_0:W16.t Array1024.t;
    var ep:W16.t Array1024.t;
    var epp:W16.t Array256.t;
    var bp:W16.t Array1024.t;
    var v:W16.t Array256.t;
    var t64 : W64.t;

    pkpv <- witness;
    pkpv <@Jkem1024.M(Jkem1024.Syscall).__polyvec_frombytes (pkp);

    publicseed <- witness;
    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (4 * 384)));
    
    while ((i \ult (W64.of_int (32 %/ 8)))) {
      t64 <- (loadW64 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))));
      publicseed <-
      Array32.init
      (WArray32.get8 (WArray32.set64_direct (WArray32.init8 (fun i => publicseed.[i])) (8 * (W64.to_uint i)) (t64)));
      pkp <- (pkp + (W64.of_int 8));
      i <- (i + (W64.of_int 1));
    }

    at <- witness;
    one <- (W64.of_int 1);
    at <@ __gen_matrix (publicseed,true);

    k <- witness;
    k <@Jkem1024.M(Jkem1024.Syscall)._i_poly_frommsg (k, msgp);

    (sp_0,ep,epp) <@ sample_noise3_spec(noiseseed);

    sp_0 <@Jkem1024.M(Jkem1024.Syscall).__polyvec_ntt (sp_0);

    bp <- witness;

    aux <@Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc ((Array1024.init (fun i_0 => at.[0 + i_0])),
    sp_0);
    bp <- Array1024.init
          (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else bp.[i]);
    aux <@Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc ((Array1024.init (fun i_0 => at.[4*256 + i_0])),
    sp_0);
    bp <- Array1024.init
          (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else bp.[i]);
    aux <@Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc ((Array1024.init (fun i_0 => at.[(2 * (4*256)) + i_0])),
    sp_0);
    bp <- Array1024.init
          (fun i => if (2 * 256) <= i < (2 * 256) + 256
          then aux.[i-(2 * 256)] else bp.[i]);
    aux <@Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc ((Array1024.init (fun i_0 => at.[(3 * (4*256)) + i_0])),
    sp_0);
    bp <- Array1024.init
          (fun i => if (3 * 256) <= i < (3 * 256) + 256
          then aux.[i-(3 * 256)] else bp.[i]);

    v <- witness;
    v <@Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc (pkpv, sp_0);

    bp <@Jkem1024.M(Jkem1024.Syscall).__polyvec_invntt (bp);
    v <@Jkem1024.M(Jkem1024.Syscall)._poly_invntt (v);

    bp <@Jkem1024.M(Jkem1024.Syscall).__polyvec_add2 (bp, ep);
    v <@Jkem1024.M(Jkem1024.Syscall)._poly_add2 (v, epp);
    v <@Jkem1024.M(Jkem1024.Syscall)._poly_add2 (v, k);

    v <@Jkem1024.M(Jkem1024.Syscall).__poly_reduce (v);

    sctp <- ctp;
    ctp <- sctp;

    redcompr(ctp,bp);

    ctp <- (ctp + (W64.of_int (4 * 352)));
    v <@Jkem1024.M(Jkem1024.Syscall)._poly_compress (ctp, v);

    return ();
  }

  proc iredcompr(ctp: W8.t Array1568.t,bp:W16.t Array1024.t) : W8.t Array1408.t = {
    var aux_0 : W8.t Array1408.t;
    bp <@Jkem1024.M(Jkem1024.Syscall).__polyvec_reduce (bp);
    aux_0 <@Jkem1024.M(Jkem1024.Syscall).__i_polyvec_compress (Array1408.init (fun (i_0 : int) =>  ctp.[0 + i_0]),
    bp);
    return aux_0;
  }

  proc iindcpa_enc_jazz (ctp: W8.t Array1568.t, msgp:W8.t Array32.t, pkp:W64.t, noiseseed : W8.t Array32.t) : W8.t Array1568.t = {
    var aux_1: W8.t Array160.t;
    var aux_0: W8.t Array1408.t;
    var aux: W16.t Array256.t;
    var sctp: W8.t Array1568.t;
    var i:W64.t;
    var c:W8.t;
    var pkpv:W16.t Array1024.t;
    var publicseed:W8.t Array32.t;
    var k:W16.t Array256.t;
    var one:W64.t;
    var at:W16.t Array4096.t;
    var nonce:W8.t;
    var sp_0:W16.t Array1024.t;
    var ep:W16.t Array1024.t;
    var epp:W16.t Array256.t;
    var bp:W16.t Array1024.t;
    var v:W16.t Array256.t;
    var t64 : W64.t;

    sctp <- ctp;

    pkpv <- witness;
    pkpv <@Jkem1024.M(Jkem1024.Syscall).__polyvec_frombytes (pkp);

    publicseed <- witness;
    i <- (W64.of_int 0);
    pkp <- (pkp + (W64.of_int (4 * 384)));
    
    while ((i \ult (W64.of_int (32 %/ 8)))) {
      t64 <- (loadW64 Glob.mem (W64.to_uint (pkp + (W64.of_int 0))));
      publicseed <-
      Array32.init
      (WArray32.get8 (WArray32.set64_direct (WArray32.init8 (fun i => publicseed.[i])) (8 * (W64.to_uint i)) (t64)));
      pkp <- (pkp + (W64.of_int 8));
      i <- (i + (W64.of_int 1));
    }

    at <- witness;
    one <- (W64.of_int 1);
    at <@ __gen_matrix (publicseed,true);

    k <- witness;
    k <@Jkem1024.M(Jkem1024.Syscall)._i_poly_frommsg (k, msgp);

    (sp_0,ep,epp) <@ sample_noise3_spec(noiseseed);

    sp_0 <@Jkem1024.M(Jkem1024.Syscall).__polyvec_ntt (sp_0);

    bp <- witness;

    aux <@Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc ((Array1024.init (fun i_0 => at.[0 + i_0])),
    sp_0);
    bp <- Array1024.init
          (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else bp.[i]);
    aux <@Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc ((Array1024.init (fun i_0 => at.[4*256 + i_0])),
    sp_0);
    bp <- Array1024.init
          (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else bp.[i]);
    aux <@Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc ((Array1024.init (fun i_0 => at.[(2 * (4*256)) + i_0])),
    sp_0);
    bp <- Array1024.init
          (fun i => if (2 * 256) <= i < (2 * 256) + 256
          then aux.[i-(2 * 256)] else bp.[i]);
    aux <@Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc ((Array1024.init (fun i_0 => at.[(3 * (4*256)) + i_0])),
    sp_0);
    bp <- Array1024.init
          (fun i => if (3 * 256) <= i < (3 * 256) + 256
          then aux.[i-(3 * 256)] else bp.[i]);

    v <- witness;
    v <@Jkem1024.M(Jkem1024.Syscall).__polyvec_pointwise_acc (pkpv, sp_0);

    bp <@Jkem1024.M(Jkem1024.Syscall).__polyvec_invntt (bp);
    v <@Jkem1024.M(Jkem1024.Syscall)._poly_invntt (v);

    bp <@Jkem1024.M(Jkem1024.Syscall).__polyvec_add2 (bp, ep);
    v <@Jkem1024.M(Jkem1024.Syscall)._poly_add2 (v, epp);
    v <@Jkem1024.M(Jkem1024.Syscall)._poly_add2 (v, k);

    v <@Jkem1024.M(Jkem1024.Syscall).__poly_reduce (v); 

    ctp <- sctp;

    aux_0 <@ iredcompr(ctp,bp);
    ctp <- Array1568.init
           (fun i => if 0 <= i < 0 + 1408 then aux_0.[i-0] else ctp.[i]);
    (aux_1,
    aux) <@Jkem1024.M(Jkem1024.Syscall)._i_poly_compress ((Array160.init (fun i_0 => ctp.[(4 * 352) + i_0])),
    v);
    ctp <- Array1568.init
           (fun i => if (4 * 352) <= i < (4 * 352) + 160
           then aux_1.[i-(4 * 352)] else ctp.[i]);
    v <- aux;
    return (ctp);
  }

}.

(*
equiv squeezeblock_ignore :
 Jkem1024.M(Jkem1024.Syscall)._shake128_squeezeblock ~Jkem1024.M(Jkem1024.Syscall)._shake128_squeezeblock :
   arg{1}.`1 = arg{2}.`1 ==> ={res}.
proof.
proc => /=; seq 1 1: (#pre); 1: by call(_:true) => /=;  sim.
while (={i} /\ 0<=i{1}<=168 /\ ={state} /\ forall k, 0<=k<i{1} => out{1}.[k] = out{2}.[k]);
  1: by auto => />; smt(Array168.set_eqiE Array168.set_neqiE).
auto => /> *; split; 1: by smt().
by move => *;rewrite tP => k kb; smt().
qed.
*)

(* 
equiv absorb_ignore :
 Jkem1024.M(Jkem1024.Syscall)._shake128_absorb34 ~Jkem1024.M(Jkem1024.Syscall)._shake128_absorb34 :
   arg{1}.`2 = arg{2}.`2 ==> ={res}.
proof.
proc; seq 1 1: (#pre /\ ={state}); last by sim.
call(_: true ==> ={res}); last by auto => />.
proc; while (={i} /\ 0<=i{1}<=25 /\ forall k, 0<=k<i{1} => state{1}.[k] = state{2}.[k]);
     1: by auto => />; smt(Array25.set_eqiE Array25.set_neqiE).
auto => /> *; split; 1: by smt().
by move => *;rewrite tP => k kb; smt().
qed. 

equiv shake33_ignore :
 Jkem1024.M(Jkem1024.Syscall)._shake256_33_128 ~Jkem1024.M(Jkem1024.Syscall)._shake256_33_128 :
   arg{1}.`2 = arg{2}.`2 ==> ={res}.
proof.
proc=> /=. 
swap {1} 2 -1; swap {1} 4 -2.
swap {2} 2 -1; swap {2} 4 -2.
seq 2 2: (#pre /\ ={state}).
+ call(_: true ==> ={res}); last by auto => />.
  proc; while (={i} /\ 0<=i{1}<=25 /\ forall k, 0<=k<i{1} => state{1}.[k] = state{2}.[k]);
     1: by auto => />; smt(Array25.set_eqiE Array25.set_neqiE).
  auto => /> *; split; 1: by smt().
  by move => *;rewrite tP => k kb; smt().
seq 7 7 : (={state}); 1: by sim.
while (={i,state} /\ 0<=i{1}<=128 /\ forall k, 0<=k<i{1} => out{1}.[k] = out{2}.[k]);
  1: by auto => />; smt(Array128.set_eqiE Array128.set_neqiE).
  auto => /> *; split; 1: by smt().
  by move => *;rewrite tP => k kb; smt().
qed. 
*)

equiv auxgenmatrix_good :
 Jkem1024.M(Jkem1024.Syscall).__gen_matrix ~ AuxMLKEM.__gen_matrix :
    transposed{1} = (if trans{2} then W64.one else W64.zero) /\ ={seed} ==> ={res}.
proc => /=. 
inline Parse(XOF).sample.
inline Jkem1024.M(Jkem1024.Syscall).__rej_uniform.

seq 7 1: (={seed} /\ stransposed{1} = (if trans{2} then W64.one else W64.zero)); 1: by auto.

seq 2 0 : (#pre /\ forall k, 0<=k<32 => extseed {1}.[k] = seed{2}.[k]).
+ conseq => />; 1: smt().
  while{1} (#pre /\ 0<=j{1}<=32 /\
      forall k, 0<=k<j{1} => extseed {1}.[k] = seed{2}.[k]) (32-j{1}); 
         last by auto => /#.
  auto => /> &hr *; do split; 1..2,4..: by smt().
  by move => k kb ?; case (k < j{hr}); move => *; 
    smt(Array34.set_neqiE Array34.set_eqiE).

while(#pre /\ ={i} /\ 0<=i{1}<=4 /\ 
   forall k, 0 <= k < i{1}*1024 => 
         (a{2}.[k %/ 1024,k %% 1024 %/ 256])%Matrix.[k %% 256] = incoeff (to_sint r{1}.[k]) /\
         bpos16 r{1}.[k] q); last first.
+ auto => /> &1 &2 ?; rewrite /kvec;split; 1: smt().
  move => extseed r1 a2 i ?????;rewrite  /unlift_matrix tP => H k kb.
  rewrite initiE //=;move : (H k _); 1:smt(); move => [#] ->??.
  by rewrite incoeffK modz_small 1:/# to_sint_unsigned 1: /# to_uintK. 

wp;while(stransposed{1} = (if trans{2} then W64.one else W64.zero) /\
         (forall (k0 : int), 0 <= k0 && k0 < 32 => extseed{1}.[k0] = seed{2}.[k0]) /\
         ={i,j} /\ 0<=i{2}<=4 /\ 0<=j{2}<=4  /\ i{1} < 4 /\
   forall k, 0 <= k < i{2}*1024 + j{2}*256 => 
         (a{2}.[k %/ 1024,k %% 1024 %/ 256])%Matrix.[k %% 256] = incoeff (to_sint r{1}.[k]) /\
         bpos16 r{1}.[k] q); last by auto => /> /#.

seq 5 4 : (#pre /\ lift_array256 poly{1} = aa{2} /\
            forall k, 0 <= k < 256 =>
               bpos16 poly{1}.[k] q); last first.

+ wp; conseq />.
  * move => &1 &2 [] [] [] -> [] ? [] [] -> -> [] ? [] ? [] ? ? ? [] ? ? ? [] [] ? ? H /=.
    do split => //; 1,2: smt().
    by move => ??; rewrite -H /#.
  while{1}
   (0 <= to_uint k{1} <= 256
    /\ forall (k0 : int), 0 <= k0 < to_uint k{1} => rij{1}.[k0] = poly{1}.[k0])
   (256 - to_uint k{1}).
  * auto => /> 4?.
    rewrite ultE /= to_uintD_small 1:/# to_uint_small //.
    smt(Array256.get_setE).
  auto => /> &1 &2 [#] 9? hpoly; split; 1: smt().
  move => rij kl; rewrite ultE /=; split; 1: smt().
  move => hkl 2? heq; split; 1: smt().
  move => k ??.
  rewrite initiE 1:/# /=.
  rewrite /lift_array256 setmE /= offunmE /= 1:/#.
  have -> /= : k < i{2} * 1024 + j{2} * 256 + 256 by smt().
  have -> : (k %/ 1024 = i{2} /\ k %% 1024 %/ 256 = j{2}) <=> i{2} * 1024 + j{2} * 256 <= k by smt().
  case: (i{2} * 1024 + j{2} * 256 <= k); 2: smt().
  by rewrite mapiE /#.

conseq />; 1: by smt().

seq 3 1 : (
   ={i, j} /\
   (0 <= i{2} && i{2} < 4) /\
   (0 <= j{2} && j{2} < 4) /\
   (forall (k0 : int), 0 <= k0 && k0 < 32 => extseed{1}.[k0] = seed{2}.[k0]) /\
   (forall (k0 : int),
     0 <= k0 && k0 < i{2} * 1024 + j{2} * 256 =>
     (a{2}.[k0 %/ 1024, k0 %% 1024 %/ 256])%Matrix.[k0 %% 256] = 
        incoeff (to_sint r{1}.[k0]) /\ bpos16 r{1}.[k0] q) /\
   state{1} = XOF.state{2}).
+ inline XOF.init.
  ecall {1} (shake_absorb extseed{1}).
  auto => /> &1 &2 *; split. 
  case(trans{2}).
  + by rewrite oner_neq0 //= /=.
  move => * /=; split => /=. 
  by move => *;rewrite !set_neqiE /#.
  congr; rewrite tP => k kb; rewrite initiE //=.
  by rewrite !set_neqiE /#. 

  case(trans{2}).
  move => * /=; split => /=. 
  by move => *;rewrite !set_neqiE /#.
  congr; rewrite tP => k kb; rewrite initiE //=.
  by rewrite !set_neqiE /#. 

  by smt().

(* sampling loop *)

while(to_uint ctr{1} = j0{2} /\ 0<= j0{2} <= 256 /\ state{1} = XOF.state{2} /\
  (forall (k0 : int), 0 <= k0 => k0 < 32 => extseed{1}.[k0] = seed{2}.[k0]) /\
  (forall (k0 : int),
    0 <= k0 => k0 < j0{2} => incoeff (to_sint poly{1}.[k0]) = aa{2}.[k0]) /\ 
  (forall (k0 : int),
    0 <= k0 => k0 < j0{2} => 0 <= to_sint poly{1}.[k0] /\ to_sint poly{1}.[k0] < q)); last first.
+ auto => /> &1 &2??????; do split; 1..3: by smt().
  move => ctrl polyl aar; rewrite ultE /= => *; split; last by smt().
  by rewrite /lift_array256 tP => k kb; rewrite mapiE //= /#.

swap {1} 2 -1; seq 1 1 : (#pre /\ buf{1} = b168{2}).
+ inline XOF.next_bytes; conseq />.
  ecall {1} (shake_squeeze state{1}).
  by auto => />. 

wp; conseq />.
splitwhile{1} ^while : to_uint ctr0 < 256.
while{1} (!(to_uint pos{1} < 166 /\ to_uint ctr0{1} < 256) /\ 
      (cond{1} => to_uint pos{1} < 166) /\ #post) (168 - to_uint pos{1}).
+ move => &h z; rcondf ^if; auto => /> &m; rewrite !ultE /= /#.

while(0<=j0{2}<=256 /\ 0<=k{2}<=168 /\to_uint ctr0{1} = j0{2} /\ buf0{1} = b168{2} /\
    (cond{1} => to_uint pos{1} < 166) /\ 
    to_uint pos{1} = k{2} /\ k{2} %% 3 = 0 /\
   (forall (k0 : int), 
           0 <=  k0 < j0{2} => 
              incoeff (to_sint rp{1}.[k0]) = aa{2}.[k0]) /\
   (forall (k0 : int), 
        0 <= k0 < j0{2} => 
            0 <= to_sint rp{1}.[k0] /\ to_sint rp{1}.[k0] < q));
  last first.

+ auto => /> &1 &2 *; do split; 1,2: smt().
  move => ctrl rpl aar kr => *; do split; 1, 2, 3:  smt().
  * by  rewrite ultE /=.
  * by  rewrite ultE /=.
  by smt().

rcondt{1} ^if; first by move => &m; auto => &h /> *; rewrite ultE.

seq 17 6 : (#{/~k{2} < 168}{/~pos{1} \ult (of_int (168 - 2))%W64}{/~cond{1}}pre /\ to_uint val1{1} = d1{2} /\ to_uint val2{1} = d2{2}); 
  1: by auto => /> &1 &2 *; do split; rewrite ?ultE ?to_uintD_small // ?mergebytes // ?mergebytes2 // /#. 

seq 4 2 : (to_uint ctr0{1} = j0{2} /\
           to_uint pos{1} = k{2} /\
           #{/~pos{1} \ult (of_int (168 - 2))%W64}
            {/~cond{1}}post).

+ sp 1 0; if; 1: by move => &1 &2; rewrite ultE qE; smt().
  + sp 3 2; if{2}.
    + rcondt{1} 2; 1: by move => *; auto => /> *; rewrite ultE; smt().
      rcondt{1} 4; 1: by move => *; auto => /> *; rewrite ultE /= to_uintD_small /= /#.
      auto => /> &1 aar ctrl rpl 8?; rewrite ultE /= => *; do split; 2..3:smt().
      + rewrite to_uintD_small /= /#.
      + rewrite to_uintD_small /= /#.
      + move => k0 ??; rewrite to_uintD_small /= 1:/#.
        case (k0 < to_uint ctrl); 1: by move => *; rewrite !set_neqiE /#.        move => *;rewrite !get_setE 1..4:/#.
          by rewrite to_sint_unsigned; rewrite /to_sint /smod /=; smt(W16.to_uint_cmp).

      move => k0 ??; rewrite to_uintD_small /= 1:/#.
      case (k0 < to_uint ctrl); 1: by move => *; rewrite !set_neqiE /#.
      move => *; case (k0 = to_uint ctrl). 
      + move => *; rewrite set_neqiE 1,2:/# set_eqiE 1,2:/#.
        by rewrite to_sint_unsigned; rewrite /to_sint /smod /=; smt(W16.to_uint_cmp).
      move => *;have -> : (k0 = to_uint ctrl + 1) by smt(). 
      rewrite set_eqiE 1,2:/#.
      by rewrite to_sint_unsigned; rewrite /to_sint /smod /=; smt(W16.to_uint_cmp).
     
    sp 1 0;if{1}; last first. 
    + auto => /> &1  aar ctr0 rpl; rewrite !ultE /= => *;  do split; 2..3: smt().
      + by rewrite to_uintD_small /= /#. 
      + by rewrite to_uintD_small /= /#. 
      + move => k0??;case (k0 < to_uint ctr0); 1: by move => *; rewrite !set_neqiE /#.
        move => *;have -> : (k0 = to_uint ctr0) by smt(). 
        rewrite set_eqiE 1,2:/# set_eqiE 1,2:/#.
        by rewrite to_sint_unsigned; rewrite /to_sint /smod /=; smt(W16.to_uint_cmp).
      move => k0 ??; case (k0 < to_uint ctr0); 1: by move => *; rewrite !set_neqiE /#.
      move => *;have -> : (k0 = to_uint ctr0) by smt(). 
      rewrite set_eqiE 1,2:/#.
      by rewrite to_sint_unsigned; rewrite /to_sint /smod /=; smt(W16.to_uint_cmp).
    rcondf{1} 3. 
    + move => *; auto => /> &1; rewrite !ultE /= => *.
      by rewrite  ultE /= to_uintD_small /= /#.  
    auto => /> &1  aar ctr0 rpl; rewrite !ultE /= => *;  do split; 2..3: smt().
    + by rewrite to_uintD_small /= /#. 
    + by rewrite to_uintD_small /= /#. 
    + move => k0??;case (k0 < to_uint ctr0); 1: by move => *; rewrite !set_neqiE /#.
      move => *;have -> : (k0 = to_uint ctr0) by smt(). 
      rewrite set_eqiE 1,2:/# set_eqiE 1,2:/#.
      by rewrite to_sint_unsigned; rewrite /to_sint /smod /=; smt(W16.to_uint_cmp).
    move => k0 ??; case (k0 < to_uint ctr0); 1: by move => *; rewrite !set_neqiE /#.
    move => *;have -> : (k0 = to_uint ctr0) by smt(). 
    rewrite set_eqiE 1,2:/#.
    by rewrite to_sint_unsigned; rewrite /to_sint /smod /=; smt(W16.to_uint_cmp).

  sp 2 0; if{2}.
  + rcondt{1} 1; 1: by move => *; auto => /> *; rewrite ultE /#.
    rcondt{1} 3; 1: by move => *; auto => /> *; rewrite ultE /#.
    auto => /> &1 &2 8?; rewrite ultE /= => *; do split; 2..3:smt().
    + rewrite to_uintD_small /= /#.
    + rewrite to_uintD_small /= /#.
    + move => k0 ??;  case (k0 < to_uint ctr0{1}); 1: by move => *; rewrite !set_neqiE /#.
      move => *;have -> : (k0 = to_uint ctr0{1}) by smt(). 
      rewrite set_eqiE 1,2:/# set_eqiE 1,2:/#.
      by rewrite to_sint_unsigned; rewrite /to_sint /smod /=; smt(W16.to_uint_cmp).
    move => k0 ??; case (k0 < to_uint ctr0{1}); 1: by move => *; rewrite !set_neqiE /#.
    move => *;have -> : (k0 = to_uint ctr0{1}) by smt(). 
    rewrite set_eqiE 1,2:/#.
    by rewrite to_sint_unsigned; rewrite /to_sint /smod /=; smt(W16.to_uint_cmp).
     
  if{1}; last by auto => />. 
  rcondf{1} 3; 1: by move => *; auto => /> &1; rewrite !ultE /= /#.
  by auto => />.  

auto => /> &1 &2 *; rewrite ultE /#.

qed.

lemma sigextu16_to_sint (a : W8.t) :  W16.to_sint (sigextu16 a) = to_sint a.
rewrite /sigextu16 of_sintK /smod /=.
case (0 <= to_sint a).
+ by smt(modz_small W8.to_uint_cmp pow2_8).
move => *.
pose x := -to_sint a; have ->: to_sint a = -x by auto.
by rewrite !modNz; smt(modz_small W8.to_uint_cmp pow2_8).
qed.

lemma W8_of_sintK_signed a:
    - W8.modulus %/ 2 <= a < W8.modulus %/ 2 =>
      to_sint (W8.of_int a) = a.
move => /= *; rewrite of_sintK /smod /=.
case (0 <= a); 1: smt(modz_small W8.to_uint_cmp pow2_8).
pose x := -a; have ->: a = -x by auto.
by smt(modNz modz_small W8.to_uint_cmp pow2_8).
qed.

lemma W8_to_sintB_small (a b : W8.t):
    - W8.modulus %/ 2 <= to_sint a - to_sint b && to_sint a - to_sint b < W8.modulus %/ 2 =>
    to_sint (a - b) = to_sint a - to_sint b.
move => /= *.
rewrite -(W8_of_sintK_signed (to_sint a - to_sint b)) //= of_intD of_intN.
have -> : W8.of_int (to_sint a) = a. 
+ by rewrite /to_sint /smod fun_if /= of_intD of_intN to_uintK /= subr0 /#. 
have -> : W8.of_int (to_sint b) = b. 
+ by rewrite /to_sint /smod fun_if /= of_intD of_intN to_uintK /= subr0 /#. 
done.
qed.

lemma rearrange1 a b c d :
  a + 4 * b + 16 * c + 64 * d = (32*d + 8*c + 2*b)*2 + a by ring.

lemma rearrange2 a b c d :
  a + 4 * b + 16 * c + 64 * d = (16*d + 4*c + b)*4 + a by ring.

lemma rearrange3 a b c d :
  a + 4 * b + 16 * c + 64 * d = (8*d + 2*c)*8 + (b * 4 + a) by ring.

lemma rearrange4 a b c d :
  a + 4 * b + 16 * c + 64 * d = (4*d + c)*16 + (b * 4 + a) by ring.

lemma rearrange5 a b c d :
  a + 4 * b + 16 * c + 64 * d = (2*d)*32 + (16*c + b * 4 + a) by ring.

lemma rearrange6 a b c d :
  a + 4 * b + 16 * c + 64 * d = d*64 + (16*c + b * 4 + a) by ring.

lemma even85bits a: 
   a `&` W8.of_int 85 = 
          W8.of_int (b2i a.[0] + 4*b2i a.[2] + 16*b2i a.[4] + 64*b2i a.[6]).
proof.
apply W8.ext_eq => x xb; rewrite /W8.(`&`) map2E /= initiE //=.
rewrite !W8.of_intE /= /int2bs /mkseq /= -iotaredE /=.
case (x = 0); 1: by move => -> /=; rewrite (modz_small _ 256); smt(mod2_b2i).
case (x = 1); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange1 edivz_eq /#.
case (x = 2); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange2 edivz_eq;smt(mod2_b2i).
case (x = 3); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange3 edivz_eq /#.
case (x = 4); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange4 edivz_eq;smt(mod2_b2i).
case (x = 5); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange5 edivz_eq /#.
case (x = 6); 1: by move => -> /=; rewrite (modz_small _ 256) 1:/# rearrange6 edivz_eq;smt(mod2_b2i).
move => *;have -> /= : x = 7 by smt().
by rewrite (modz_small _ 256) /#. 
qed.

lemma nice_shift (a : W8.t) i :
   1 <= i < 8 => b2i a.[i] = b2i (a `>>>` 1).[i-1] by smt(shrwE).

lemma odd85bits (a : W8.t): 
  (a `>>>` 1) `&` W8.of_int 85 = 
          W8.of_int (b2i a.[1] + 4*b2i a.[3] + 16*b2i a.[5] + 64*b2i a.[7]).
proof.
rewrite (nice_shift a 1) // (nice_shift a 3) // (nice_shift a 5) // (nice_shift a 7) //.
by apply even85bits.
qed.

lemma mask85_sum (a : W8.t) (i : int) :
  0 <= i < 4 => 
      to_uint ((((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8)) `>>` W8.of_int (2*i)) %% 4 = 
      b2i a.[2*i] + b2i a.[2*i + 1].
proof.
move=> hi.
rewrite /(`>>`)   W8.to_uint_small /= 1:/#.
rewrite (modz_small (2*i)) 1:/# W8.to_uint_shr 1:/#.
rewrite to_uintD modz_pow2_div 1:/#.
have -> : 4 = 2^2 by done.
rewrite JUtils.modz_mod_pow2.
have -> : min (`|8 - 2 * i|) (`|2|) = 2 by smt().
rewrite odd85bits even85bits !W8.to_uint_small /= 1,2:/#. 
rewrite -(W8.to_uintK' a).
have := W8.to_uint_cmp a. 
move: (to_uint a) => {a} x hx.
rewrite !W8.of_intwE /=.
move /mem_range: hi; rewrite /range -JUtils.iotaredE.
apply: List.allP i => /=.
move /mem_range: hx; rewrite /range -JUtils.iotaredE.
apply: List.allP x.
by cbv delta.
qed.

lemma parallel_noisesum_low (a : W8.t) :
  to_uint ((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8) %% 4 -
  to_uint ((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8 `>>` (of_int 2)%W8) %% 4 =
     b2i a.[0] + b2i a.[1] - (b2i a.[2] + b2i a.[3]).
have -> : to_uint ((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8) %% 4 = 
          to_uint (((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8) `>>` W8.of_int 0) %% 4
  by rewrite /(`>>`) /= to_uint_shr //=.
by move : (mask85_sum a 0) => /= ->; move : (mask85_sum a 1) => /= ->.
qed.

lemma parallel_noisesum_high (a : W8.t) :
  to_uint ((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8 `>>` (of_int 4)%W8) %% 4 -
  to_uint ((a `>>` W8.one) `&` (of_int 85)%W8 + a `&` (of_int 85)%W8 `>>` (of_int 6)%W8) %% 4 =
    b2i a.[4] + b2i a.[5] - (b2i a.[6] + b2i a.[7]).
by move : (mask85_sum a 2) => /= ->; move : (mask85_sum a 3) => /= ->.
qed.

equiv get_noise_sample_noise :
  Jkem1024.M(Jkem1024.Syscall)._poly_getnoise ~ CBD2.sample :
   arg{2} = PRF arg{1}.`2 arg{1}.`3
   ==> 
   lift_array256 res{1} = res{2} /\
   forall k, 0<=k<256 => -5 < to_sint res{1}.[k] < 5.
proc => /=. 
seq 8 0 : (buf{1} = bytes{2}).
+ ecall{1} (shake256_33_128 extseed{1}); wp.
  while{1}(0<=k{1}<=32 /\ 
    forall i, 0<=i<k{1} => extseed{1}.[i] = seed{1}.[i]) (32 - k{1}); last first.
  + auto => /> &1 *; split; 1: smt().
    move => extseed kl *; split; 1: smt().
    move => *; rewrite -/PRF;congr;rewrite Array32.tP => *.
    by rewrite   initiE //= set_neqiE //= /#.
  move => &m z; auto => /> &hr ????; do split; 1,2,4: smt().
  by move => i0 i0b; case(i0 < k{hr}); move=> *;  smt(Array33.set_eqiE Array33.set_neqiE).

while(#pre /\ to_uint i{1} = i{2} /\ 0 <= i{2} <= 128 /\ j{2} = 2*i{2} /\
       (forall k, 0<=k<2*i{2} =>
          incoeff (to_sint rp{1}.[k]) = rr{2}.[k]) /\
       (forall k, 0<=k<j{2} =>
          -5 < to_sint rp{1}.[k] < 5)); last first.
   auto => /> &1 *; split; 1: smt().
   move => i ???????; have -> : 2*to_uint i = 256 by smt().
   rewrite /lift_array256 tP; move => *;split; last by smt().
   by move => *; rewrite mapiE //=;smt().

auto => /> &1 &2; rewrite !ultE /= => *.
rewrite to_uintD_small /= 1:/#. do split; 1..3: smt().
+ move => k kbl. rewrite !to_uintD_small !to_uintM_small /= 1..3:/# => kbh.
  case (k < 2 * to_uint i{1}); 1: by move => *;rewrite !set_neqiE /#.
  case (k = 2 * to_uint i{1}).
  + move => -> *. rewrite set_neqiE 1:/# !get_setE 1..3:/# ifF 1:/# !ifT 1,2:/#.
    congr.
    rewrite sigextu16_to_sint (_: 3 = 2^2 -1) // !and_mod //= W8_of_sintK_signed /=; 1: smt(). 
    have ->  /= : 2 * to_uint i{1} %% 2 = 0 by smt().
    by apply parallel_noisesum_low.
  move => *; have ? : k = 2 * to_uint i{1} + 1 by smt().
  do 2! (rewrite set_eqiE 1,2:/#); congr.
  rewrite sigextu16_to_sint (_: 3 = 2^2 -1) // !and_mod //= W8_of_sintK_signed /=; 1: smt(). 
  have ->  /= : (2 * to_uint i{1} + 1) %% 2 = 1 by smt().
  by apply parallel_noisesum_high.
move => k kbl. rewrite !to_uintD_small !to_uintM_small /= 1..3:/# => kbh.
case (k < 2 * to_uint i{1}); 1: by move => *;rewrite !set_neqiE /#.
case (k = 2 * to_uint i{1}).
+ move => *; rewrite set_neqiE 1,2:/# set_eqiE 1,2:/#.
  by rewrite sigextu16_to_sint (_: 3 = 2^2 -1) // !and_mod //= W8_of_sintK_signed /=; smt(). 
move => *; have ? : k = 2 * to_uint i{1} + 1 by smt().
by rewrite set_eqiE 1,2:/# sigextu16_to_sint (_: 3 = 2^2 -1) // 
     !and_mod //= W8_of_sintK_signed /=; smt(). 
qed.

equiv sample_noise_good2 _key :
  AuxMLKEM.sample_noise2_jasmin ~ AuxMLKEM.sample_noise2_spec :
    _key = noiseseed{1} /\ ={noiseseed} 
    ==> res{1}.`1 = res{2}.`1 /\ 
                     res{1}.`2 = res{2}.`2 /\ 
                     res{2}.`3 = 8.
proc => /=.
unroll for {2} 7; unroll for {2} 5.
seq 2 2 : (#pre); 1:by auto.
seq 3 3 : (#pre /\ lift_array256 (subarray256 noise1{1} 0) = (noise1{2}.[0])%Vector /\ _N{2}=0 /\ 
              (forall k, 0<=k<256 => -5 < to_sint noise1{1}.[k] < 5)).
wp; call (get_noise_sample_noise); auto => /> *; split.
+ rewrite /lift_array256 /subarray256 /= tP => k kb.
  rewrite !mapiE //= initiE //= initiE 1:/# /= kb /=.
  by rewrite  /= setvE /= offunvE 1:/# /= !mapiE /#.
by move => k kbl kbh;rewrite !initiE 1:/# /= kbl kbh /= /#.

seq 3 3 : (#{/~_N{2}}{~i{2}}{~noise1{1}}pre /\ _N{2}=1 /\ 
              lift_array256 (subarray256 noise1{1} 0) = (noise1{2}.[0])%Vector /\
              lift_array256 (subarray256 noise1{1} 1) = (noise1{2}.[1])%Vector /\ 
              (forall k, 0<=k<512 => -5 < to_sint noise1{1}.[k] < 5)).
wp; call (get_noise_sample_noise); auto => /> &1 &2 H *; do split. 
+ move : H; rewrite /lift_array256 /subarray256 setvE /= offunvE 1:/# /= !tP =>H k kb.
  move : (H k kb);rewrite !mapiE //= !initiE //= 1:/# /= /#. 
+ move : H; rewrite /lift_array256 /subarray256 setvE /= offunvE 1:/# /= !tP =>H k kb.
  by move : (H k kb);rewrite !mapiE //= !initiE //= !initiE //= /#. 
by move => k kbl kbh;rewrite !initiE 1:/# /= /#.

seq 3 3 : (#{/~_N{2}}{~i{2}}{~noise1{1}}pre /\ _N{2}=2 /\ 
              lift_array256 (subarray256 noise1{1} 0) = (noise1{2}.[0])%Vector /\
              lift_array256 (subarray256 noise1{1} 1) = (noise1{2}.[1])%Vector /\ 
              lift_array256 (subarray256 noise1{1} 2) = (noise1{2}.[2])%Vector /\ 
              (forall k, 0<=k<768 => -5 < to_sint noise1{1}.[k] < 5)).
wp; call (get_noise_sample_noise); auto => /> &1 &2 H H1 *; do split. 
+ move : H; rewrite /lift_array256 /subarray256 setvE /= offunvE 1:/# /= !tP =>H k kb.
  move : (H k kb);rewrite !mapiE //= !initiE //= 1:/# /= /#. 
+ move : H; rewrite /lift_array256 /subarray256 setvE /= offunvE 1:/# /= !tP =>H k kb.
   move : (H k kb);rewrite !mapiE //= !initiE //= !initiE //= 1: /#. 
   move : H1; rewrite /lift_array256 /subarray256 /= !tP =>H1.
  move : (H1 (k) _); 1:smt(). rewrite !mapiE //= !initiE //= /#. 
+ move : H; rewrite /lift_array256 /subarray256 setvE /= offunvE 1:/# /= !tP =>H k kb.
   move : (H k kb);rewrite !mapiE //= !initiE //= !initiE //= 1: /#. 
   move : H1; rewrite /lift_array256 /subarray256 /= !tP =>H1.
  move : (H1 (k) _); 1:smt(). rewrite !mapiE //= !initiE //= /#. 

by move => k kbl kbh;rewrite !initiE 1:/# /= /#.

seq 3 3 : (#{/~_N{2}}{~i{2}}{~noise1{1}}pre /\ _N{2}=3 /\
              lift_polyvec noise1{1} = noise1{2} /\
              (forall k, 0<=k<1024 => -5 < to_sint noise1{1}.[k] < 5)).
wp; call (get_noise_sample_noise); auto => /> &1 &2 H0 H1 H2 *; split; 
   last  by  move => *; rewrite !initiE //= /#.
move : H0 H1 H2; rewrite /lift_vector /lift_array256 /subarray256  setvE /= eq_vectorP /= !tP =>H0 H1 H2 r rb.
rewrite !offunvE /= 1..2:/# !tP => k kb. 
case (r = 0).
+ move => *; have -> /= : !3=r by smt().
  by move : (H0 k kb);rewrite !mapiE //= !initiE //= !initiE //= /#. 
case (r = 1).
+ move => *; have -> /= : !3=r by smt().
  by move : (H1 k kb);rewrite !mapiE //= !initiE //= !initiE //= /#. 
case (r = 2).
+ move => *; have -> /= : !3=r by smt().
  by move : (H2 k kb);rewrite !mapiE //= !initiE //= !initiE //= /#. 
move => *; have -> /= : 3 = r by smt(). 
by rewrite !mapiE //= !initiE //= !initiE //= /#. 

seq 3 4 : (#{/~_N{2}}{~i{2}}pre /\ lift_array256 (subarray256 noise2{1} 0) = (noise2{2}.[0])%Vector /\ _N{2}=4 /\
              (forall k, 0<=k<256 => -5 < to_sint noise2{1}.[k] < 5)).
wp; call (get_noise_sample_noise); auto => /> &1 &2 *; split.
+ rewrite /lift_array256 /subarray256 setvE /= offunvE 1:/# /= tP => k kb.
  by rewrite !mapiE //= initiE //= initiE 1:/# /= kb /=.
by move => k kbl kbh;rewrite !initiE 1:/# /= kbl kbh /= /#.

seq 3 3 : (#{/~_N{2}}{~i{2}}{~noise2{1}}pre /\ _N{2}=5 /\
              lift_array256 (subarray256 noise2{1} 0) = (noise2{2}.[0])%Vector /\
              lift_array256 (subarray256 noise2{1} 1) = (noise2{2}.[1])%Vector /\ 
              (forall k, 0<=k<512 => -5 < to_sint noise2{1}.[k] < 5)).
wp; call (get_noise_sample_noise); auto => /> &1 &2 ?H *; do split. 
+ move : H; rewrite /lift_array256 /subarray256 setvE /= offunvE 1:/# /= !tP =>H k kb.
  by move : (H k kb);rewrite !mapiE //= !initiE //= 1:/# /= /#. 
+ move : H; rewrite /lift_array256 /subarray256 setvE /= offunvE 1:/# /= !tP =>H k kb.
  by move : (H k kb);rewrite !mapiE //= !initiE //= !initiE //= /#. 
by move => k kbl kbh;rewrite !initiE 1:/# /= /#.

seq 3 3 : (#{/~_N{2}}{~i{2}}{~noise2{1}}pre /\ _N{2}=6 /\
              lift_array256 (subarray256 noise2{1} 0) = (noise2{2}.[0])%Vector /\
              lift_array256 (subarray256 noise2{1} 1) = (noise2{2}.[1])%Vector /\ 
              lift_array256 (subarray256 noise2{1} 2) = (noise2{2}.[2])%Vector /\ 
              (forall k, 0<=k<768 => -5 < to_sint noise2{1}.[k] < 5)).
wp; call (get_noise_sample_noise); auto => /> &1 &2 ?H H1 *; do split. 
+ move : H; rewrite /lift_array256 /subarray256 setvE /= offunvE 1:/# /= !tP =>H k kb.
  by move : (H k kb);rewrite !mapiE //= !initiE //= 1:/# /= /#. 
+ move : H; rewrite /lift_array256 /subarray256 setvE /= offunvE 1:/# /= !tP =>H k kb.
  move : (H k kb);rewrite !mapiE //= !initiE //= !initiE //= 1:/#. 
move : H1; rewrite /lift_array256 /subarray256 /= !tP =>H1.
  by move : (H1 k kb);rewrite !mapiE //= !initiE //=  /#. 
+ move : H; rewrite /lift_array256 /subarray256 setvE /= offunvE 1:/# /= !tP =>H k kb.
  move : (H k kb);rewrite !mapiE //= !initiE //= !initiE //= 1:/#. 
move : H1; rewrite /lift_array256 /subarray256 /= !tP =>H1.
  by move : (H1 k kb);rewrite !mapiE //= !initiE //=  /#. 
by move => k kbl kbh;rewrite !initiE 1:/# /= /#.

seq 3 3 : (#{/~_N{2}}{~i{2}}{~noise2{1}}pre /\ _N{2}=7 /\
              lift_polyvec noise2{1} = noise2{2} /\
              (forall k, 0<=k<1024 => -5 < to_sint noise2{1}.[k] < 5)).
wp; call (get_noise_sample_noise); auto => /> &1 &2 ?H0 H1 H2 *; split; 
   last by  move => *; rewrite !initiE //= /#.
move : H0 H1 H2; rewrite /lift_vector /lift_array256 /subarray256  setvE /= eq_vectorP /= !tP =>H0 H1 H2 r rb.
rewrite !offunvE /= 1,2:/# !tP => k kb. 
case (r = 0).
+ move => *; have -> /= : !3=r by smt().
  by move : (H0 k kb);rewrite !mapiE //= !initiE //= !initiE //= /#. 
case (r = 1).
+ move => *; have -> /= : !3=r by smt().
  by move : (H1 k kb);rewrite !mapiE //= !initiE //= !initiE //= /#. 
case (r = 2).
+ move => *; have -> /= : !3=r by smt().
  by move : (H2 k kb);rewrite !mapiE //= !initiE //= !initiE //= /#. 
move => *; have -> /= : 3 = r by smt(). 
by rewrite !mapiE //= !initiE //= !initiE //= /#. 

by auto => /> &1 H H0; rewrite /lift_vector /unlift_vector !tP /subarray256 /lift_array256;split;
  move => i ib; rewrite initiE //= offunvE 1:/# /= mapiE 1:/# /= initiE 1:/# /=;smt(inFq_to_sint qE).
qed.

equiv sample_noise_good3 :
  AuxMLKEM.sample_noise3_jasmin ~ AuxMLKEM.sample_noise3_spec :
    ={noiseseed} ==> ={res}.
proc.
call get_noise_sample_noise.
wp; ecall (sample_noise_good2 noiseseed{2}).
auto => /> &1 resl resr ???; split; 1: smt().
move => ? resl0.
rewrite /unlift_poly /lift_array256 tP /= => bd k kbnd.
rewrite !initiE //= !mapiE //=. 
by smt(inFq_to_sint).
qed.


equiv auxkg_good :
 Jkem1024.M(Jkem1024.Syscall).__indcpa_keypair ~ AuxMLKEM.indcpa_keypair_jazz :
     ={Glob.mem} /\ ={arg}
     ==> ={Glob.mem,res}. 
proc => /=. 
inline Aux.inner_product.
swap {1} 4 -3.
swap {1} 3 -1.
swap {1} [11..14] -8.
swap {1} 9 -6.
swap {1} 11 -8.
swap {1} [15..18] -6.
seq 12 7 : (#pre /\ ={publicseed, noiseseed}).
+ swap {1} [5..9] -2. 
  seq 7 2 : (#pre /\ ={buf}); last by sim; auto => />.   
  wp;ecall {1} (sha3_512_33_64 inbuf{1}).
  conseq />; 1: by move => /> &2 inb H rr Hrr1 Hrr2; 
     rewrite (H rr Hrr1 Hrr2). 
  wp;while {1} (0<= i{1} <= inc{1} /\ inc{1} = 4 /\
              seed{2} = randomnessp{1} /\
             forall k, 0<= k < i{1} * 8 =>
                    inbuf{1}.[k] = seed{2}.[k]) (32- i{1} * 8);
    last first. 
  + auto => /> &1 ; split; 1: smt().
    move => il inbufl /=; split; 1: smt().
    move => ???H rs.
    have -> : inbufl.[32 <- (of_int 4)%W8] = Array33.init (fun i => if i < 32 then seed{1}.[i] else W8.of_int kvec).
    +  by rewrite tP => k kb; smt(Array33.get_setE Array33.initiE).
    rewrite !tP => H0 H1 k kb.
    case (k < 32) => *.
    + move : (H0 k _); 1:smt().
      by rewrite !initiE /#.
    move : (H1 (k-32) _); 1:smt().
    by rewrite !initiE /#.
  move => *; auto => /> &hr ??? /==> *.
  split; 2: smt(); split; 1: smt().
  move => k kb ?; case (k < i{hr} * 8).
  + move => *; rewrite initiE /= 1:/#  get8_set64_directE 1,2:/#. 
    case (8 * i{hr} <= k && k < 8 * i{hr} + 8); 1: by smt().
    by move => *; rewrite /get8 /init8 initiE /#.
  move => *; rewrite /get8 /init8 initiE 1: /# /=.
  case (k < i{hr} * 8). 
  + move => *; rewrite set64E initiE /= /#.
  case (8 * i{hr} <= k && k < 8 * i{hr} + 8).
  move => *. rewrite set64E initiE /= 1:/#.
  rewrite ifT 1:/# get64E !pack8bE 1:/# !initiE 1:/# /= /init8 !initiE /#. 
  move => *. rewrite set64E initiE /= 1:/#.
  by rewrite ifF 1:/#  !initiE /#.

swap {1} [9..10] -7.
seq 3 2 : (#pre /\ ={a}); 1: by call auxgenmatrix_good; auto => />.

swap {1} [3..4] -2; seq 2 0 : #pre; 1: by auto.
swap {1} [4..5] -3;sp 2 0.
swap {1} 2 27.
swap {2} 1 8.

seq 26 1 : (#{/~randomnessp{1}=seed{2}}{/~r_noiseseed{1}}pre /\ ={skpv,e}).
transitivity {1} {(skpv,e) <@ AuxMLKEM.sample_noise2_jasmin(s_noiseseed);}
     (={Glob.mem,publicseed,s_noiseseed,noiseseed,spkp,sskp,a} 
         ==> 
           ={sskp,spkp,e,Glob.mem,publicseed,s_noiseseed,noiseseed,a,skpv,e})
     (={Glob.mem,pkp,skp,publicseed,noiseseed,pkp,skp,a} 
        /\ s_noiseseed{1} = noiseseed{2}
         /\ spkp{1} = pkp{2} /\ sskp{1} = skp{2} ==> 
          spkp{1} = pkp{2} /\ sskp{1} = skp{2}
         /\ s_noiseseed{1} = noiseseed{2}
        /\   ={skpv,e,Glob.mem,pkp,skp,publicseed,noiseseed,a,skpv,e});1,2:  smt().
+ by inline  AuxMLKEM.sample_noise2_jasmin; sim; auto => />. 
by conseq />; ecall (sample_noise_good2 noiseseed{2}) ; auto => />.

seq 2 2 : (#pre); 1:by sim.

seq 5 7 : (#pre /\ ={pkpv}).

+ wp;call(_: true); 1: by sim. 
  wp;call(_:true); 1: by sim.
  auto => />  result /=. 
  do split.
  + by rewrite tP => x xb; rewrite !initiE 1,2:/# /= xb /=.
  + move => *; rewrite tP => x xb; rewrite !initiE 1,2:/# /= !initiE /#.

seq 4 6 : #pre.

+ wp;call(_: true); 1: by sim. 
  wp;call(_:true); 1: by sim.
  auto => /> &2 result /=. 
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
 Jkem1024.M(Jkem1024.Syscall).__indcpa_enc ~ AuxMLKEM.indcpa_enc_jazz :
     ={Glob.mem,arg} ==> ={Glob.mem,res}. 
proc. 
swap {1} 6 -5.
swap {1} 12 -10.
seq 2 2 : (#pre /\ ={pkpv}); 1: by sim.

swap {1} 6 -5.
swap {1} [11..13] -9.
seq 4 4 : (#pre /\ ={publicseed}); 1: by sim.

swap {1} 11 -9.
seq 2 3 : (#pre /\ aat{1}=at{2}); 1: by call auxgenmatrix_good;auto => />.

swap {1} 4 -3.
swap {1} 9 -7.

seq 2 2 : (#pre /\ ={k}); 1: by sim.

swap {1} [2..3] -1.
swap {1} 4 -3.
swap {1} [5..26] -1.
swap {1} 5 37.
swap {1} 25 8.

seq 31 1 : (#pre /\ ={sp_0,ep,epp}); last by inline AuxMLKEM.redcompr;swap {1} 18 1;sim.

swap {1} 5 -3.
swap {1} 4 26.

transitivity {1} {s_noiseseed <- noiseseed; (sp_0,ep,epp) <@ AuxMLKEM.sample_noise3_jasmin(s_noiseseed);}
     (={Glob.mem,msgp,pkp,pkpv,noiseseed,publicseed,k} /\ aat{1} = aat{2} /\ sctp{1} = sctp{2} ==>
          ={Glob.mem,msgp,pkp,pkpv,noiseseed,publicseed,k,sp_0,ep,epp} /\ aat{1} = aat{2} /\ sctp{1} = sctp{2} )
      (={Glob.mem,msgp,pkp,pkpv,noiseseed,publicseed,k} /\ aat{1} = at{2} /\ sctp{1} = ctp{2} ==> 
          ={Glob.mem,msgp,pkp,pkpv,noiseseed,publicseed,k,sp_0,ep,epp}  /\ aat{1} = at{2} /\ sctp{1} = ctp{2} ); 1, 2: smt().
+ seq 2 1 : (={s_noiseseed} /\ #pre); first by auto.
  by inline  AuxMLKEM.sample_noise3_jasmin AuxMLKEM.sample_noise2_jasmin; sim; auto.
by conseq />; call sample_noise_good3; auto => />.
qed.

equiv auxienc_good :
 Jkem1024.M(Jkem1024.Syscall).__iindcpa_enc ~ AuxMLKEM.iindcpa_enc_jazz :
     ={Glob.mem,arg} ==> ={Glob.mem,res}. 
proc. 
swap {1} 6 -5.
swap {1} 14 -12.
swap {2} 1 28.
seq 2 2 : (#pre /\ ={pkpv}); 1: by sim.

swap {1} 6 -5.
swap {1} [13..15] -11.
seq 4 4 : (#pre /\ ={publicseed}); 1: by sim.

swap {1} 13 -11.
seq 2 3 : (#pre /\ aat{1}=at{2}); 1: by call auxgenmatrix_good;auto => />.

swap {1} 4 -3.
swap {1} 11 -9.

seq 2 2 : (#pre /\ ={k}); 1: by sim.
swap {1} [2..3] -1.
swap {1} 5 -4.
swap {1} [8..27] -1.

swap {1} 3 31.
swap {1} 3 33.
(* swap {1} 27 3. *)

swap {1} 6 46.
swap {1} 1 50.

seq 32 1 : (#pre /\ ={sp_0,ep,epp}).
transitivity {1} {s_noiseseed <- noiseseed; (sp_0,ep,epp) <@ AuxMLKEM.sample_noise3_jasmin(s_noiseseed);}
     (={Glob.mem,msgp,pkp,pkpv,noiseseed,publicseed,k} /\ aat{1} = aat{2} /\ ctp{1} = ctp{2} ==> 
          ={Glob.mem,msgp,pkp,pkpv,noiseseed,publicseed,k,sp_0,ep,epp} /\ aat{1} = aat{2} /\ ctp{1} = ctp{2} )
      (={Glob.mem,msgp,pkp,pkpv,noiseseed,publicseed,k} /\ aat{1} = at{2} /\ ctp{1} = ctp{2} ==> 
          ={Glob.mem,msgp,pkp,pkpv,noiseseed,publicseed,k,sp_0,ep,epp}  /\ aat{1} = at{2} /\ ctp{1} = ctp{2} ); 1,2:   smt(). 
+ by inline  AuxMLKEM.sample_noise3_jasmin AuxMLKEM.sample_noise2_jasmin; sim; auto => />.
+ by conseq />; call sample_noise_good3; auto => />.

 by swap {1} 17 1; inline {2} AuxMLKEM.iredcompr; sim.
qed.

(******* CORRECTNESS PROOFS TOP LEVEL ************)

op touches2 (m m' : global_mem_t) (p1 : address) (len1 : int) (p2 : address) (len2 : int) : bool =
  forall (a : int), ! (p1 <=  a < p1+len1) =>  ! (p2 <=  a < p2+len2) => m'.[a] = m.[a].

(* FIXME: disambiguate 768 *)

lemma subliftsub (a : W16.t Array1024.t) i k: 0<=i <4 => 0<=k<256 =>
    (lift_array256 (subarray256 a i)).[k] = (lift_array1024 a).[256*i+k].
move => ib kb; rewrite /subarray256 /lift_array256 /lift_array1024.
by rewrite !mapiE 1,2:/# /= !initiE /#.
qed.

lemma subsublift (a : W16.t Array4096.t) i j k:
  0 <= i < 4 => 0<= j < 4 => 0 <=  k < 256 =>
  (subarray256 (subarray1024 (lift_array4096 a) i) j).[k] =
(lift_array1024 ((init (fun x => a.[i*1024 + x])))%Array1024).[256 * j + k].
move => *; rewrite /subarray256 /subarray1024 /lift_array4096 /lift_array1024.
by rewrite !mapiE 1:/# /= !initiE 1,2:/# /= !initiE 1:/# /= mapiE /#.
qed.

lemma toipolivec_lift _v :
  toipolyvec (lift_polyvec _v) = map asint (lift_array1024 _v).
rewrite /toipolyvec /lift_polyvec /lift_array1024 /fromarray256;congr => /=;rewrite tP => k kb.
rewrite mapiE 1:/# /= initiE 1:/# /= /lift_array256 /subarray256.
case (0<=k<256) => * /=.
+ by rewrite getvE offunvE /= 1:/# mapiE 1:/# /= initiE 1:/# /=.
case (256<=k<512) => * /=.
+ by rewrite getvE offunvE /= 1:/# mapiE 1:/# /= initiE 1:/# /=.
case (512<=k<768) => * /=.
+ by rewrite getvE offunvE /= 1:/# mapiE 1:/# /= initiE 1:/# /=.
by rewrite getvE offunvE /= 1:/# mapiE 1:/# /= initiE 1:/# /=.
qed.



import InnerPKE1024.

lemma mlkem_correct_kg mem _pkp _skp  : 
   equiv [Jkem1024.M(Jkem1024.Syscall).__indcpa_keypair ~ InnerPKE1024.kg_derand : 
       Glob.mem{1} = mem /\ to_uint spkp{1} = _pkp /\ to_uint sskp{1} = _skp /\ 
       randomnessp{1} = coins{2} /\
       valid_disj_reg _pkp (384*4+32) _skp (384*4)
        ==> 
       touches2 Glob.mem{1} mem _pkp (384*4+32) _skp (384*4) /\
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk = load_array1536 Glob.mem{1} _skp /\
         t = load_array1536 Glob.mem{1} _pkp  /\
         rho = load_array32 Glob.mem{1} (_pkp+1536)].
proc*.
transitivity {1} { AuxMLKEM.indcpa_keypair_jazz(spkp, sskp, randomnessp);} 
(={Glob.mem,spkp,sskp,randomnessp} ==> ={Glob.mem,r}) 
(   Glob.mem{1} = mem /\
    to_uint spkp{1} = _pkp /\
    to_uint sskp{1} = _skp /\
    randomnessp{1} = coins{2}  /\
    valid_disj_reg _pkp (384 * 4 + 32) _skp (384 * 4)
    ==> 
    touches2 Glob.mem{1} mem _pkp (384*4+32) _skp (384*4) /\
    let (pk, sk) = r{2} in
    let (t, rho) = pk in
        sk = load_array1536 Glob.mem{1} _skp /\
        t = load_array1536 Glob.mem{1} _pkp /\ 
        rho = load_array32 Glob.mem{1} (_pkp + 1536)); 1,2: smt().
+ by call auxkg_good; auto => />.

inline {1} 1; inline {2} 1.

sp 2 0.

swap {2} 7 -5.
seq 8 2  : (#pre /\ rho{2} = publicseed{1} /\ sig{2} = noiseseed{1}).
+ sp 3 2.
  conseq => />.
  while {1} (0<=i{1}<=_aux{1} /\ _aux{1} = 4 /\ 
             buf{1} = Array64.init (fun (k : int) => if 0 <= k && k < 32 then rho{2}.[k] else sig{2}.[k - 32]) /\
              forall k, 0<=k< i{1}*8 => publicseed{1}.[k] = rho{2}.[k] /\ 
                                        noiseseed{1}.[k] = sig{2}.[k])
              (4 - i{1}); last first.
   auto => /> &1 &2 ?????.
   split. 
    by smt(Array64.tP).
   move=> *; split; first smt().
   by move=> *; split; rewrite Array32.tP /#.

  move => *; auto => /> &1 /= => ????. 
  do split; 1..2,4:smt().
  move => k kbl kbh. 
  case (k<i{1}*8). 
  + move => *; rewrite !initiE /= 1,2:/# !get8_set64_directE 1..4:/#. 
    case (8 * i{1} <= k && k < 8 * i{1} + 8).
    + by move => *; rewrite !get64E !pack8bE 1..2:/# !initiE 1..2:/# /= /init8 !initiE /#. 
    by move => *; rewrite /get8 /init8 !initiE /#.
  move => *; rewrite !initiE 1,2:/# !get8_set64_directE 1..4:/#.
  case (8 * i{1} <= k && k < 8 * i{1} + 8); last 
    by move => *; rewrite /get8 /init8 !initiE /#.
  by rewrite !get64E !pack8bE 1..2:/# !initiE 1..2:/# /= /init8 !initiE /#. 

swap {2} [7..8] -5.
seq 2 3 : (#pre /\ a{2} = lift_matrix a{1} /\
            pos_bound4096_cxq a{1} 0 4096 2).
+ inline AuxMLKEM.__gen_matrix; conseq />.
  seq 6 3 : (a0{1}=a{2}); last by auto => />;  smt(matrix_unlift).
  while (i0{1} = i{2} /\ 0<=i0{1}<=kvec /\ seed0{1}=rho{2} /\ !trans{1} /\
         forall ii jj, 0<=ii<i0{1} => 0<= jj <4 => (a0{1}.[ii,jj] = a{2}.[ii,jj])%Matrix); last  first.
          auto => />; smt(eq_matrixP).
  wp; while (i0{1} = i{2} /\ j{1} = j{2} /\ 0<=i0{1}<kvec /\ 0<=j{1}<=kvec /\ seed0{1}=rho{2} /\ !trans{1} /\
         (forall ii jj, 0<=ii<i0{1} => 0<= jj <4 => (a0{1}.[ii,jj] = a{2}.[ii,jj])%Matrix) /\
         (forall jj, 0 <= jj <j{1} => (a0{1}.[i0{1},jj] = a{2}.[i0{1},jj])%Matrix)); last 
            by auto => />  /#.
  wp; call(_: ={XOF.state}); 1: by sim.
  wp; call(_: ={arg} ==> ={XOF.state}); 1: by sim. 
  by auto => /> &1 &2;smt(offunmK setmE). 
  
swap {2} [5..9]  -2.
swap {1} 1 1.
seq 1 7 : (#pre /\ s{2} = lift_polyvec skpv{1} /\ e{2} = lift_polyvec e{1} /\
                signed_bound1024_cxq skpv{1} 0 1024 1 /\
                signed_bound1024_cxq e{1} 0 1024 1).
+ inline AuxMLKEM.sample_noise2_spec; conseq />. 
  seq 8 7 : (noise1{1}=s{2} /\ noise2{1} = e{2}); 
    1: by sim; auto => />.
  by auto => />;  smt(vector_unlift).

swap {1} 1 2; seq 0 2: #pre; 1: by auto.

seq 13 3 : (#{/~signed_bound1024_cxq skpv{1} 0 1024 1}
             {~signed_bound1024_cxq e{1} 0 1024 1}pre /\ 
                t{2} = lift_polyvec pkpv{1} /\
                pos_bound1024_cxq pkpv{1} 0 1024 2 /\
                pos_bound1024_cxq skpv{1} 0 1024 2
                ); last first.

+ while{1} (0<=i{1} <= _aux{1} /\ _aux{1} = 4 /\
            to_uint pkp{1} = _pkp + 4*384 + i{1} * 8 /\ 
            to_uint skp{1} = _skp /\ rho{2} = publicseed{1} /\
            valid_disj_reg _pkp (384 * 4 + 32) _skp (384 * 4) /\
            touches2 Glob.mem{1} mem _pkp (384 * 4 + 32) _skp (384 * 4) /\
                sv{2} = load_array1536 Glob.mem{1} _skp /\
                tv{2} = load_array1536 Glob.mem{1} _pkp /\ 
                forall k, 0<=k<i{1}*8 =>
                 rho{2}.[k] = loadW8 Glob.mem{1} (_pkp + 1536 + k)) 
             (4 - i{1}).

+ move => *;
  auto => /> &hr ??; rewrite /loadW8 /storeW8 /valid_disj_reg /valid_ptr /=.
  move  => ppk [#] reg1 reg2 reg3 reg4 reg5 touches2 loaded enter.
  rewrite to_uintD_small /= 1:/#.
  do split; 1..3,8:smt().
  + by rewrite /touches2 /= => a ab1 ab2; rewrite /storeW64 /= /stores /=  !get_set_neqE_s /#.
  + rewrite /load_array1536 Array1536.tP => k kb.
    by rewrite !initiE //= /storeW64 /= /stores /=  !get_set_neqE_s /#.
  + rewrite /load_array1536 Array1536.tP => k kb.
    by rewrite !initiE //=/storeW64 /= /stores /=  !get_set_neqE_s /#.
  move => k kbl kbh.
  case (k <i{hr} * 8).
  + by move => *;rewrite /storeW64 /= /stores /=  !get_set_neqE_s /#.
  move => *.  rewrite /storeW64 /= /stores /=.
  rewrite !get64E !pack8bE // !initiE //= /init8 !initiE 1..8: /#. 
  by smt(get_set_neqE_s get_set_eqE_s).

  swap {2} 2 -1.
  wp; ecall {1} (polyvec_tobytes_corr Glob.mem{1} (to_uint pkp{1}) (lift_array1024 pkpv{1})). 
  wp; ecall {1} (polyvec_tobytes_corr Glob.mem{1} (to_uint skp{1}) (lift_array1024 skpv{1})).
  auto => /> &1 &2.
  move => ????????; rewrite /touches => touches0.
  move => Hl1;do split; 1:smt().
  move => ???touches1 Hl2;do split;1:by  rewrite to_uintD_small //=. 
  + rewrite /touches2 /= => a ab1 ab2. 
    have ? := (touches1 (a - to_uint spkp{1}) _); 1: by smt().
    by have ? := (touches0 (a - to_uint sskp{1}) _); by smt().
  + rewrite /load_array1152 tP => k kb; rewrite !initiE //=. 
    move : (touches1 (to_uint sskp{1} - to_uint spkp{1} + k) _); 1: by smt().
    have -> ->: to_uint spkp{1} + (to_uint sskp{1} - to_uint spkp{1} + k) = to_uint sskp{1} + k by ring. 
    + move : Hl1;rewrite /load_array1536 /encode12_vec tP => Hl.
      move : (Hl k _); 1:smt().
      rewrite initiE 1:/# /= get_of_list 1:/# /= => ->. 
      by do congr; apply toipolivec_lift.
    + move : Hl2;rewrite /load_array1536 /encode12_vec !tP => Hl k kb.
      move : (Hl k _); 1:smt().
      rewrite initiE 1:/# /= !get_of_list 1,2:/# /= => ->. 
      by do congr; apply toipolivec_lift. 
  + by smt().

  move => * /=.
  split; 1: by smt(). 
  by move => *;rewrite /load_array32 tP => k kb; rewrite initiE //= /#. 

(* Algebraic part remaining *)
conseq => />.

seq 1 1 : (#{/~signed_bound1024_cxq skpv{1} 0 1024 1}pre /\
            pos_bound1024_cxq skpv{1} 0 1024 2).
+ wp;ecall{1} (polyvec_ntt_corr (skpv{1})).
  by auto => /> /#.

seq 1 1 : (#{/~signed_bound1024_cxq e{1} 0 1024 1}pre /\
            pos_bound1024_cxq e{1} 0 1024 2).
+ wp;ecall{1} (polyvec_ntt_corr (e{1})).
  by auto => /> /#.

seq 3 0 : (#pre /\
    forall k, 0 <= k < 256 =>
         b16 pkpv{1}.[k]  (2*q)  /\ 
    incoeff (to_sint pkpv{1}.[k]) = ((ntt_mmul a{2} s{2}).[0])%Vector.[k]).

wp; ecall{1} (innerprod_corr 
     (invnttv (lift_polyvec (Array1024.init ("_.[_]" a{1}))))
     (invnttv (lift_polyvec skpv{1}))).

+ auto => /> &1 &2.
  move => ???????.
  do split; 1,2,4: smt(nttvK).
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#.
  move => ????result0; rewrite /lift_matrix.
  rewrite /lift_array2304 /lift_polyvec /lift_array256 /invnttv !tP =>  ?val k kbl kbh.
  rewrite !initiE 1:/# /= kbl kbh /= ; do split; 1,2:smt().
  move : (val k _) => //; rewrite mapiE //= => ->.
  rewrite /ntt_mmul !getvE offunvE //= /dotp /kvec /=.
  rewrite !Big.BAdd.big_consT //= !Big.BAdd.big_nil //=. 
  rewrite  !mapvE !setvE !offunvE //= !getmE !offunmE //= !offunvK /vclamp  /kvec /=.
  rewrite !add_comm_ntt !mul_comm_ntt !nttK nttZero. 
  rewrite -!(matrixcols) //=.
  have -> : (init ("_.[_]" a{1}))%Array1024 = 
               (init (fun (i_0 : int) => a{1}.[i_0]))%Array1024 by smt(Array1024.tP).
  by congr;ring.
seq 2 0 : (#pre /\
        (forall k, 256 <= k < 512 =>
         b16 pkpv{1}.[k]  (2*q)  /\ 
    incoeff (to_sint pkpv{1}.[k]) = ((ntt_mmul a{2} s{2}).[1])%Vector.[k-256])
).

wp; ecall{1} (innerprod_corr 
     (invnttv (lift_polyvec (Array1024.init (fun (i_0 : int) => a{1}.[1024 + i_0]))))
     (invnttv (lift_polyvec skpv{1}))).

+ auto => /> &1 &2.
  move => ???????H.
  do split; 1,2,4: smt(nttvK).
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#.
  move => ????result0; rewrite /lift_matrix.
  rewrite /lift_array2304 /lift_polyvec /lift_array256 /invnttv !tP =>  ?val.
  split.
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    rewrite (_: !(256 <= k && k < 512)) 1:/# /=.
    move : (H k _); 1: smt(). move => [_ ->]. 
    congr;congr;congr. 
    + by rewrite /lift_matrix; congr => /= /#. 
    by rewrite /lift_polyvec;congr => /= /#.
  move => k kbl kbh;rewrite !initiE 1:/# /= kbl kbh /= ; do split; 1,2:smt().
  move : (val (k-256) _);1:smt(); rewrite mapiE 1:/# => ->.
  rewrite /ntt_mmul !getvE offunvE //= /dotp /kvec /=.
  rewrite !Big.BAdd.big_consT //= !Big.BAdd.big_nil //=. 
  rewrite !mapvE !setvE !offunvE //= !getmE !offunmE //= !offunvK /vclamp  /kvec /=.
  rewrite !add_comm_ntt !mul_comm_ntt !nttK nttZero. 
  rewrite -!(matrixcols) //=.
  by congr;ring.

seq 2 0 : (#pre /\
        (forall k, 512 <= k < 768 =>
         b16 pkpv{1}.[k]  (2*q)  /\ 
    incoeff (to_sint pkpv{1}.[k]) = ((ntt_mmul a{2} s{2}).[2])%Vector.[k-512])
).

wp; ecall{1} (innerprod_corr 
     (invnttv (lift_polyvec (Array1024.init (fun (i_0 : int) => a{1}.[2*1024 + i_0]))))
     (invnttv (lift_polyvec skpv{1}))).

+ auto => /> &1 &2.
  move => ???????H H0.
  do split; 1,2,4: smt(nttvK).
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#.
  move => ????result0; rewrite /lift_matrix.
  rewrite /lift_array2304 /lift_vector /lift_array256 /invnttv !tP =>  ?val.
  do split.
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    rewrite (_: !(512 <= k && k < 768)) 1:/# /=.
    move : (H k _); 1:  smt().
    move => [_ ->]. 
    congr;congr;congr;rewrite /lift_matrix; congr => /= /#. 
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    rewrite (_: !(512 <= k && k < 768))1: /# /=.
    move : (H0 k _); 1: smt().
    move => [_ ->]. 
    congr;congr;congr;rewrite /lift_matrix; congr => /= /#. 
  move => k kbl kbh;rewrite !initiE 1:/# /= kbl kbh /= ; do split; 1,2:smt().
  move : (val (k-512) _);1:smt(); rewrite mapiE 1:/# => ->.
  rewrite /ntt_mmul !mapvE !setvE !offunvE //= /dotp /kvec /=.
  rewrite !Big.BAdd.big_consT //= !Big.BAdd.big_nil //=. 
  rewrite !getvE !offunvE //= !offunvK /vclamp !getmE !offunmE //= /kvec /=.
  rewrite !add_comm_ntt !mul_comm_ntt !nttK nttZero. 
  rewrite -!(matrixcols) //= /lift_array256.
  by congr;ring.

seq 2 0 : (#pre /\
        (forall k, 768 <= k < 1024 =>
         b16 pkpv{1}.[k]  (2*q)  /\ 
    incoeff (to_sint pkpv{1}.[k]) = ((ntt_mmul a{2} s{2}).[3])%Vector.[k-768])
).

wp; ecall{1} (innerprod_corr 
     (invnttv (lift_polyvec (Array1024.init (fun (i_0 : int) => a{1}.[3*1024 + i_0]))))
     (invnttv (lift_polyvec skpv{1}))).

+ auto => /> &1 &2.
  move => ???????H H0 H1.
  do split; 1,2,4: smt(nttvK).
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#.
  move => ????result0; rewrite /lift_matrix.
  rewrite /lift_array2304 /lift_vector /lift_array256 /invnttv !tP =>  ?val.
  do split.
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    rewrite (_: !(768 <= k && k < 1024)) 1:/# /=.
    move : (H k _); 1:  smt().
    move => [_ ->]. 
    congr;congr;congr;rewrite /lift_matrix; congr => /= /#. 
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    rewrite (_: !(768 <= k && k < 1024))1: /# /=.
    move : (H0 k _); 1: smt().
    move => [_ ->]. 
    congr;congr;congr;rewrite /lift_matrix; congr => /= /#. 
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    rewrite (_: !(768 <= k && k < 1024))1: /# /=.
    move : (H1 k _); 1: smt().
    move => [_ ->]. 
    congr;congr;congr;rewrite /lift_matrix; congr => /= /#. 
  move => k kbl kbh;rewrite !initiE 1:/# /=  kbl kbh /= ; do split; 1,2:smt().
  move : (val (k-768) _);1:smt(); rewrite mapiE 1:/# => ->.
  rewrite /ntt_mmul !mapvE !setvE !offunvE //= /dotp /kvec /=.
  rewrite !Big.BAdd.big_consT //= !Big.BAdd.big_nil //=. 
  rewrite !getvE !offunvE //= !offunvK /vclamp !getmE !offunmE //= /kvec /=.
  rewrite !add_comm_ntt !mul_comm_ntt !nttK nttZero. 
  rewrite -!(matrixcols) //= /lift_array256.
  by congr;ring.

conseq => />.

seq 1 1 : (t{2} = lift_polyvec pkpv{1} /\ signed_bound1024_cxq pkpv{1} 0 1024 4);
last first.

+ ecall {1} (polyvec_reduce_corr (lift_array1024 pkpv{1})).
  auto => /> // &1 ?; rewrite /lift_array1024 =>  rr  rrv ?. 
  rewrite /lift_polyvec eq_vectorP => i ib; rewrite !offunvE//=.
  rewrite /lift_array256 /subarray256 tP => k kb.
  rewrite !mapiE //= !initiE //=.
  move : rrv; rewrite tP => rrv.
  move : (rrv (256 * i + k) _); 1: smt().
  by rewrite !mapiE 1,2:/# /=. 

have H := polyvec_add_corr_impl 2 2 _ _ => //.
ecall{1} (H (lift_array1024 pkpv{1}) (lift_array1024 e{1})).
clear H.
auto => /> &1 &2 ???????; rewrite  /= => vs0 vs1 vs2 vs3.

do split; 1,2:smt().

move => ?? resf ? vsf; rewrite eq_vectorP => r rb.
rewrite tP  /= polyvecD Vector.offunD  /(&+) !map2E /= => k kb.
rewrite !initiE 1:/# /=.
case(r = 0). 
+ move => r0; rewrite r0 /=. 
  move : (vs0 k kb) => [? <-].
  rewrite /lift_polyvec !offunvE 1,2:/# /= !subliftsub 1..4:/# /=. 
  by smt(Array1024.mapiE).
case(r = 1). 
+ move => r1; rewrite r1 /=. 
  move : (vs1 (k + 256) _); 1: smt().
  move  => [? <-].
  rewrite /lift_polyvec !offunvE 1,2:/# /= !subliftsub 1..4:/# /=. 
  by smt(Array1024.mapiE).
case(r = 2). 
+ move => r2; rewrite r2 /=. 
  move : (vs2 (k + 512) _); 1: smt().
  move  => [? <-].
  rewrite /lift_polyvec !offunvE 1,2:/# /= !subliftsub 1..4:/# /=. 
  by smt(Array1024.mapiE).
move => *.
have -> : r= 3 by smt(). 
move : (vs3 (k + 768) _); 1: smt().
move  => [? <-].
rewrite /lift_polyvec !offunvE 1,2:/# /= !subliftsub 1..4:/# /=. 
by smt(Array1024.mapiE).
qed.

(***************************************************)
lemma decode_rng l n i : 0< n => 0 <= nth 0 (decode n l) i < 2^n.
move => *.
case (0<=i < size (decode n l)) =>  H.
+ have := mem_nth 0  (decode n l) i H.  
  rewrite mapP => Hp;elim Hp =>x [Hx ->].
  smt(BitEncoding.BS2Int.bs2int_ge0 StdOrder.IntOrder.ler_weexpn2l 
   size_ge0 BitEncoding.BitChunking.in_chunk_size BitEncoding.BS2Int.bs2int_le2Xs).
smt(nth_out StdOrder.IntOrder.expr_gt0).
qed.


lemma ofipolyvec_lift vi vw :
  all (fun i => 0 <= i < 32768) vi =>
  lift_array1024 vw = map incoeff vi =>
  ofipolyvec vi = lift_polyvec vw.
rewrite allP /= => ?.
rewrite /lift_array1024 tP => H.
rewrite /ofipolyvec /lift_polyvec !setvE /= eq_vectorP => r rb.
rewrite !offunvE 1,2:/# /= !offunvK /vclamp /= /subarray256 /lift_array256.
case(3 = r). 
+ move => r0; rewrite r0 /=. 
  rewrite tP => k kb; rewrite !mapiE 1,2:/#  /= !initiE 1,2:/# /=.
  have := H (256*r+k) _;1:smt().
  rewrite !mapiE /#. 
case(2 = r). 
+ move => r0?; rewrite r0 /= ifT 1:/#. 
  rewrite tP => k kb; rewrite !mapiE 1,2:/#  /= !initiE 1,2:/# /=.
  have := H (256*r+k) _;1:smt().
  rewrite !mapiE /#. 
case(1 = r). 
+ move => r0??; rewrite r0 /= ifT 1:/# ifT 1:/#. 
  rewrite tP => k kb; rewrite !mapiE 1,2:/#  /= !initiE 1,2:/# /=.
  have := H (256*r+k) _;1:smt().
  rewrite !mapiE /#. 
move => *.
have -> /= : r= 0 by smt(). 
rewrite !ifT 1..3:/#.
rewrite tP => k kb; rewrite !mapiE 1,2:/#  /= !initiE 1,2:/# /=.
have := H (256*r+k) _;1:smt().
rewrite !mapiE /#. 
qed.


lemma mlkem_correct_enc mem _ctp _pkp : 
   equiv [Jkem1024.M(Jkem1024.Syscall).__indcpa_enc ~ InnerPKE1024.enc_derand: 
     valid_ptr _pkp (384*4 + 32) /\
     valid_ptr _ctp (4*352+160) /\
     Glob.mem{1} = mem /\ 
     msgp{1} = m{2} /\ 
     to_uint sctp{1} = _ctp /\ 
     to_uint pkp{1} = _pkp /\
     noiseseed{1} = coins{2} /\
     pk{2}.`1 = load_array1536 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 4*384)
       ==> 
     touches Glob.mem{1} mem _ctp (4*352+160) /\
     let (c1,c2) = res{2} in
     c1 = load_array1408 Glob.mem{1} _ctp /\
     c2 = load_array160 Glob.mem{1} (_ctp + 1408)
].
proc*.
transitivity {1} { AuxMLKEM.indcpa_enc_jazz(sctp,msgp,pkp,noiseseed);} 
(={Glob.mem,msgp,pkp,noiseseed,sctp} ==> ={Glob.mem,r}) 
( valid_ptr _pkp (384 * 4 + 32) /\
  valid_ptr _ctp (4 * 352 + 160) /\
  Glob.mem{1} = mem /\
  msgp{1} = m{2} /\
  to_uint sctp{1} = _ctp /\
  to_uint pkp{1} = _pkp /\
  noiseseed{1} = coins{2} /\
  pk{2}.`1 = load_array1536 mem _pkp /\ 
  pk{2}.`2 = load_array32 mem (_pkp + 4 * 384)
  ==>
  touches Glob.mem{1} mem _ctp (4*352+160) /\
  let (c1, c2) = r{2} in 
      c1 = load_array1408 Glob.mem{1} _ctp /\ 
      c2 = load_array160 Glob.mem{1} (_ctp + 1408)); 1,2: smt().
+ by call auxenc_good; auto => />.

inline {1} 1; inline {2} 1.
swap {2} 9 -7.
sp 4 4.

swap {2} 5 -4.
swap {2} [7..8] -5.
seq 2 3 : (#pre /\ that{2} = lift_polyvec pkpv{1} /\
              signed_bound1024_cxq pkpv{1} 0 1024 2).
wp; ecall {1} (polyvec_frombytes_corr Glob.mem{1} _pkp).
+ auto => />  &1 ????; split; 1: by smt().
  move => ????rbound;split;last by smt().
  pose xx := (load_array1536 mem (to_uint pkp{1})).
  apply ofipolyvec_lift;last by smt().
  move : rbound; rewrite allP /pos_bound1024_cxq /bpos16 => rbound.
  move => k kb; have := rbound k kb. rewrite /= /decode12_vec !get_of_list 1:/#.
  have /=? /#:= decode_rng (BytesToBits (to_list (load_array1536 mem (to_uint pkp{1})))) 12 k.

seq 4 0 : (#{/~pkp{1}}pre /\ rho{2} = publicseed{1}). 
while {1} (valid_ptr _pkp (4*384 + 32)  /\ _pkp + 1536 + to_uint i{1} * 8 = to_uint pkp0{1} /\ 
           mem = Glob.mem{1} /\ rho{2} = load_array32 mem (_pkp + 4*384) /\ 
           0 <= to_uint i{1} <= 4 /\ 
          forall k, 0 <= k < to_uint i{1} * 8 => rho{2}.[k] = publicseed{1}.[k]) (4 - to_uint i{1}).
+ move => &m ?; auto => /> &hr ?????; rewrite /load_array32 ultE /loadW8 /= => H?. 
  rewrite  !to_uintD_small /=; 1,2:smt(); move => *.
  do split; 1..3,5:smt().
  move => k kbl kbh.
  case (0<=k <to_uint i{hr}*8).
  + move => *; move : (H k _); 1: smt().
    rewrite !initiE 1,2:/# get8_set64_directE 1,2:/# /=.
    case (8 * to_uint i{hr} <= k && k < 8 * to_uint i{hr} + 8).
    + move => *; rewrite /loadW8 /loadW64 pack8bE 1:/# !initiE /= /#. 
    by move => *; rewrite /get8 /init8 initiE /#.
  move => *;rewrite !initiE 1,2:/# get8_set64_directE 1,2:/# /=.
  case (8 * to_uint i{hr} <= k && k < 8 * to_uint i{hr} + 8).
  + move => *; rewrite /loadW8 /loadW64 pack8bE 1:/# !initiE /= /#. 
  by move => *; rewrite /get8 /init8 initiE /#.

auto => /> &1 &2 ????; rewrite /load_array1536 /load_array32.
rewrite !to_uintD_small 1:/#.
move => *;split; 1: smt().
move => il pkpl pseedl; rewrite ultE /=; split; 1:smt().
move => ????H; rewrite tP => k kb; rewrite initiE //=.
by move : (H k _);1:smt(); rewrite initiE //= /#.

swap {2} [6..7] -4. 
seq 3 3 : (#pre /\ aT{2} = lift_matrix at{1} /\
            pos_bound4096_cxq at{1} 0 4096 2). 
(* Simplifiable if spec were to call a function to gen matrix *)
+ inline AuxMLKEM.__gen_matrix; conseq />.
  seq 7 3 : (a{1}=aT{2});  last by auto => />;  smt(matrix_unlift).
  while (i0{1} = i{2} /\ 0<=i0{1}<=kvec /\ seed{1}=rho{2} /\ trans{1} /\
         forall ii jj, 0<=ii<i0{1} => 0<= jj <4 => (a{1}.[ii,jj])%Matrix = (aT{2}.[ii,jj])%Matrix); last
          by auto => /> *; apply: eq_matrixP; smt().
  wp; while (i0{1} = i{2} /\ j{1} = j{2} /\ 0<=i0{1}<kvec /\ 0<=j{1}<=kvec /\ seed{1}=rho{2} /\ trans{1} /\
         (forall ii jj, 0<=ii<i0{1} => 0<= jj <4 => (a{1}.[ii,jj])%Matrix = (aT{2}.[ii,jj])%Matrix) /\
         (forall jj, 0 <= jj <j{1} => (a{1}.[i0{1},jj])%Matrix = (aT{2}.[i0{1},jj]))%Matrix); last 
            by auto => />  /#.
  wp; call(_: ={XOF.state}); 1: by sim.
  wp; call(_: ={arg} ==> ={XOF.state}); 1: by sim. 
  by auto => />; smt(getmE setmE offunmK). 

swap {2} 12 -11.
seq 2 1 : (#pre /\ decompress_poly 1 mp{2} = lift_array256 k{1}  /\
            signed_bound_cxq k{1} 0 256 1). 
ecall{1} (poly_frommsg_corr m{2}); 1: by auto => /> /#.

swap {2} [2..9] -1.
seq 1 8 : (#pre /\ rv{2} = lift_polyvec sp_0{1} /\
    signed_bound1024_cxq sp_0{1} 0 1024 1 /\
     e1{2} = lift_polyvec ep{1} /\
    signed_bound1024_cxq ep{1} 0 1024 1 /\
    e2{2} = lift_array256 epp{1} /\
    signed_bound_cxq epp{1} 0 256 1).
+ inline AuxMLKEM.sample_noise3_spec AuxMLKEM.sample_noise2_spec. 
  wp; call(_: true); 1: by sim.
  conseq />; 1: by smt().
  seq 9 8 : (noise1{1}=rv{2} /\ noise2{1} = e1{2} /\ _N0{1} = _N{2} /\ 
             noiseseed1{1} = coins{2}); 
    1: by  sp 2 0; conseq />; sim; auto => />.
  by auto => />;  smt(vector_unlift poly_unlift).

swap {2} 1 3.

inline {1} AuxMLKEM.redcompr.
swap {1} [22..23] -4.
seq 20 3 : (u{2} = lift_polyvec bp0{1} /\ v{2} = lift_array256 v{1} /\
            pos_bound256_cxq v{1} 0 256 2 /\
            pos_bound1024_cxq bp0{1} 0 1024 2 /\
            valid_ptr _ctp (4 * 352 + 160) /\
            to_uint ctp{1} = _ctp /\
            Glob.mem{1} = mem); last first.
wp; ecall{1}(poly_compress_corr (lift_array256 v{1}) (to_uint ctp{1}) Glob.mem{1}).
wp; ecall{1}(polyvec_compress_corr Glob.mem{1} (to_uint ctp{1})  (lift_array1024 bp0{1}) ).
auto => /> &1 &2; rewrite /signed_bound_cxq /signed_bound1024_cxq.
move => ???;split;1:smt().
move => ?? mem1; rewrite  /touches /load_array1408 /compress_polyvec /load_array160 /lift_array1024 /fromarray256.
move => t1 rr1; do split;rewrite to_uintD_small /=;1..5: smt(W64.to_uint_cmp).
move => ?? mem2 t2 rr2;do split.
+ move => i ib;rewrite -t1 1:/#. 
  have ->: to_uint ctp{1} + i = to_uint ctp{1} + 1408 + (i - 1408) by ring.
  by rewrite t2 /#.
+ have -> : Array1408.init (fun (i0 : int) => mem2.[to_uint ctp{1} + i0])
       = Array1408.init (fun (i0 : int) => mem1.[to_uint ctp{1} + i0]).
  + rewrite tP => i ib; rewrite !initiE 1,2:/# /=.
    have ->: to_uint ctp{1} + i = to_uint ctp{1} + 1408 + (i - 1408) by ring.
    rewrite -t2 /#. 
  rewrite rr1;rewrite tP => k kb;do congr.
  rewrite tP => i ib; rewrite initiE 1:/# /= !mapiE // !getvE !offunvE //=.
  rewrite /lift_array256 /subarray256.
  case (0 <= i && i < 256); 1: by  move => kbb; rewrite !mapiE /= 1:/# !initiE /= /#.
  case (256 <= i && i < 512); 1: by move => kbb; rewrite !mapiE //= 1:/# !initiE // 1:/#.
  case (512 <= i && i < 768); 1: by move => kbb; rewrite !mapiE //= 1:/# !initiE // 1:/#.
  by move => *;rewrite !mapiE 1:/# /= !initiE /#. 
+ by smt().

(* Algebraic part *)

seq 1 1 : (#{/~signed_bound1024_cxq sp_0{1} 0 1024 1}
            {~rv{2} = lift_polyvec sp_0{1}}pre /\ 
            rhat{2} = lift_polyvec sp_0{1} /\
            pos_bound1024_cxq sp_0{1} 0 1024 2); 
  first by wp; ecall{1} (polyvec_ntt_corr sp_0{1}); auto => /> /#. 
     

seq 3 0 : (#pre /\
     (forall k, 0 <= k < 256 =>
         (lift_array1024 bp{1}).[k] = ((scale ((ntt_mmul aT{2} rhat{2}).[0])%Vector) (incoeff 169)).[k]) /\
          signed_bound1024_cxq bp{1} 0 256 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv (offunv (fun i => (aT{2}.[0,i])%PolyMat))) (invnttv rhat{2})).
auto => /> &1 &2 ???????????.
do split; 2,4: smt(nttvK). 
+ rewrite /lift_matrix /lift_polyvec /nttv /invnttv !mapvE /=.
  apply eq_vectorP => i ib; rewrite  !offunvE //= !offunvK /vclamp ib /=.
  by rewrite tP => k kb; rewrite subliftsub // !getmE offunmE //= nttK subsublift //.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
+ move => ???? result ?; rewrite /lift_array256 tP => rval. 
  split; last by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  move => k kbl kbh; rewrite mapiE 1:/# /= initiE 1:/# /= kbl kbh /=.
  move : (rval k _); 1: smt().
  rewrite mapiE //= => ->.
  rewrite /scale !mapiE //=; congr.
  by rewrite dotpmm // !getvE.

seq 2 0 : (#pre /\
     (forall k, 256 <= k < 512 =>
         (lift_array1024 bp{1}).[k] = ((scale ((ntt_mmul aT{2} rhat{2}).[1])%PolyVec) (incoeff 169)).[k-256]) /\
          signed_bound1024_cxq bp{1} 0 512 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv (offunv (fun i => (aT{2}.[1,i])%PolyMat))) (invnttv rhat{2})).
auto => /> &1 &2 ??????????? rold ?.
do split; 2,4: smt(nttvK). 
+ rewrite /lift_matrix /lift_polyvec /nttv /invnttv !mapvE /=.
  apply eq_vectorP => i ib; rewrite !offunvE //= !offunvK /vclamp ib /=.
  by rewrite tP => k kb; rewrite subliftsub // !getmE offunmE //= nttK subsublift //.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
+ move => ???? result ?; rewrite /lift_array256 tP => rval. 
  do split. 
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(256 <= k && k < 512)) 1:/# /=.
    by move : (rold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite mapiE 1:/# /= initiE 1:/# /= kbl kbh /=.
    move : (rval (k - 256) _); 1: smt().
    rewrite mapiE 1:/# /= => ->.
    rewrite /scale !mapiE 1,2:/# /=; congr.
    by rewrite dotpmm //.
  by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().

seq 2 0 : (#pre /\
     (forall k, 512 <= k <768 =>
         (lift_array1024 bp{1}).[k] = ((scale ((ntt_mmul aT{2} rhat{2}).[2])%PolyVec) (incoeff 169)).[k-512]) /\
          signed_bound1024_cxq bp{1} 0 768 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv (offunv (fun i => (aT{2}.[2,i]))%PolyMat)) (invnttv rhat{2})).
auto => /> &1 &2 ??????????? rold ? rnsold ?.
do split; 2,4: smt(nttvK). 
+ rewrite /lift_matrix /lift_polyvec /nttv /invnttv !mapvE /=.
  apply eq_vectorP => i ib; rewrite !offunvE //= !offunvK /vclamp ib /=.
  by rewrite tP => k kb; rewrite subliftsub // !getmE offunmE //= nttK subsublift //.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
+ move => ???? result ?; rewrite /lift_array256 tP => rval. 
  do split. 
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(512 <= k && k < 768)) 1:/# /=.
    by move : (rold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(512 <= k && k < 768)) 1:/# /=.
    by move : (rnsold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite mapiE 1:/# /= initiE 1:/# /= kbl kbh /=.
    move : (rval (k - 512) _); 1: smt().
    rewrite mapiE 1:/# /= => ->.
    rewrite /scale !mapiE 1,2:/# /=; congr.
    by rewrite dotpmm //.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().

seq 2 0 : (#pre /\
     (forall k, 768 <= k <1024 =>
         (lift_array1024 bp{1}).[k] = ((scale ((ntt_mmul aT{2} rhat{2}).[3])%PolyVec) (incoeff 169)).[k-768]) /\
          signed_bound1024_cxq bp{1} 0 1024 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv (offunv (fun i => (aT{2}.[3,i]))%PolyMat)) (invnttv rhat{2})).
auto => /> &1 &2 ??????????? rold ? rnsold ? rnnsold ?.
do split; 2,4: smt(nttvK). 
+ rewrite /lift_matrix /lift_polyvec /nttv /invnttv !mapvE /=.
  apply eq_vectorP => i ib; rewrite !offunvE //= !offunvK /vclamp ib /=.
  by rewrite tP => k kb; rewrite subliftsub // !getmE offunmE //= nttK subsublift //.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
+ move => ???? result ?; rewrite /lift_array256 tP => rval. 
  do split. 
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(768 <= k && k < 1024)) 1:/# /=.
    by move : (rold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(768 <= k && k < 1024)) 1:/# /=.
    by move : (rnsold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(768 <= k && k < 1024)) 1:/# /=.
    by move : (rnnsold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite mapiE 1:/# /= initiE 1:/# /= kbl kbh /=.
    move : (rval (k - 768) _); 1: smt().
    rewrite mapiE 1:/# /= => ->.
    rewrite /scale !mapiE 1,2:/# /=; congr.
    by rewrite dotpmm //.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().

seq 2 0 : (#pre /\
     (forall k, 0 <= k < 256 =>
         (lift_array256 v{1}).[k] = ((scale (ntt (dotp (invnttv that{2}) (invnttv rhat{2}))) (incoeff 169))).[k]) /\
          signed_bound_cxq v{1} 0 256 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv that{2}) (invnttv rhat{2})).
auto => /> &1 &2 ???????????????????.
do split; 1,2: smt(nttvK). 
+ by rewrite /signed_bound1024_cxq => k kb;  smt().
+ move => ??? result ?; rewrite /lift_array256 tP => rval. 
  move => k kbl kbh; rewrite mapiE 1:/# /=. 
  move : (rval k _); 1: smt().
  by rewrite mapiE //= => ->.

seq 1 0 : (#{/~bp{1}}pre /\ 
         lift_polyvec bp{1} = invnttv (ntt_mmul aT{2} rhat{2}) /\
         signed_bound1024_cxq bp{1} 0 1024 2).
+ ecall {1} (polyvec_invntt_corr bp{1}).
  auto => /> &1 &2 ???????????r1?r2?r3?r4???;split;1:smt(). 
  move => ?result <-?;  split; last by smt(). 
  rewrite /scale_polyvec /invnttv !mapvE /=  eq_vectorP => i ib.
  rewrite !offunvE //= offunvK /vclamp ib /= -invntt_scale /=; congr.
  rewrite /scale tP => k kb; rewrite /(lift_polyvec bp{1}) offunvK /vclamp ib /=.
  rewrite  mapiE //= /lift_array256 /subarray256 mapiE//= initiE//=.
  case (i = 0).
  + move => i0; move : (r1 k kb); rewrite /lift_array1024 mapiE// 1:/# /= i0 /= => ->.
    rewrite /scale mapiE 1:/# /=.
    by rewrite -ZqField.mulrA (ZqField.mulrC (incoeff 169)) rrinvcoeff ZqField.mulrC ZqField.mul1r.  
  case (i = 1).
  + move => i1 noi0; move : (r2 (256 + k) _); 1:smt(); rewrite /lift_array1024 mapiE// 1:/# /= i1 /= => ->.
    rewrite /scale mapiE 1:/# /=.
    by rewrite !getvE -ZqField.mulrA (ZqField.mulrC (incoeff 169)) rrinvcoeff ZqField.mulrC ZqField.mul1r.  
  case (i = 2).
  + move => i2 noi0 noi1; move : (r3 (512 + k) _); 1:smt(); rewrite /lift_array1024 mapiE// 1:/# /= i2 /= => ->.
    rewrite /scale mapiE 1:/# /=.
    by rewrite !getvE -ZqField.mulrA (ZqField.mulrC (incoeff 169)) rrinvcoeff ZqField.mulrC ZqField.mul1r.  
  case (i = 3); last by smt().
  move => i3 noi2 noi1 noi0; move : (r4 (768 + k) _); 1:smt(); rewrite /lift_array1024 mapiE//  1:/# /= i3 /= => ->.
  rewrite /scale mapiE 1:/# /=.
  by rewrite !getvE -ZqField.mulrA (ZqField.mulrC (incoeff 169)) rrinvcoeff ZqField.mulrC ZqField.mul1r.  

seq 1 0 : (#{/~v{1}}pre /\ 
         lift_array256 v{1} = invntt (ntt_dotp that{2} rhat{2}) /\
         signed_bound_cxq v{1} 0 256 2).
+ ecall {1} (invntt_correct (lift_array256 v{1})).
  auto => /> &1 &2 ???????????rold???; split;1:by smt().
  move=> ?result <- rb; split; last by smt(). 
  rewrite -invntt_scale; congr.
  rewrite /scale tP => k kb; rewrite mapiE //= rold // /scale mapiE //=.
  rewrite -ZqField.mulrA (ZqField.mulrC (incoeff 169)) rrinvcoeff ZqField.mulrC ZqField.mul1r.  
  rewrite /ntt_dotp /dotp /kvec /=.
  rewrite !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
  rewrite !add_comm_ntt !mul_comm_ntt.
  by rewrite -!getvE !nttvecinv // nttZero; congr;ring.

seq 1 0 : (#{/~bp{1}}pre /\ 
         lift_polyvec bp{1} = (invnttv (ntt_mmul aT{2} rhat{2}) + e1{2})%PolyVec /\
         signed_bound1024_cxq bp{1} 0 1024 3).
have H := polyvec_add_corr_impl 2 1 _ _ => //.
ecall{1} (H (lift_array1024 bp{1}) (lift_array1024 ep{1})); clear H.
+ auto => /> &1 &2 ???????????????result? rval.
  have -> : lift_polyvec result = (lift_polyvec bp{1} + lift_polyvec ep{1})%PolyVec; last by smt().
  rewrite polyvecD /Vector.(+) eq_vectorP => i ib.
  rewrite !offunvE //= tP => k kb.
  rewrite  /(&+) map2E /= !initiE //= !liftarrayvector //= -(rval (256*i + k) _) 1:/#.
  by rewrite subliftsub // /lift_array1024 mapiE //= /#.

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

seq 2 0 : (#pre /\ 
         lift_polyvec bp0{1} = (invnttv (ntt_mmul aT{2} rhat{2}) + e1{2})%PolyVec /\
         pos_bound1024_cxq bp0{1} 0 1024 2).
ecall{1}(polyvec_reduce_corr (lift_array1024 bp0{1})).
auto =>/> &1 &2 ???????????rold????rval?.
rewrite -rold; rewrite eq_vectorP => i ib.
by rewrite tP => k kb; rewrite !liftarrayvector // /#.

ecall{1}(poly_reduce_corr (lift_array256 v{1})).
by auto =>/> /#. 

qed.

lemma mlkem_correct_ienc mem _pkp : 
   equiv [Jkem1024.M(Jkem1024.Syscall).__iindcpa_enc ~ InnerPKE1024.enc_derand: 
     valid_ptr _pkp (384*4 + 32) /\
     Glob.mem{1} = mem /\ 
     msgp{1} = m{2} /\ 
     to_uint pkp{1} = _pkp /\
     noiseseed{1} = coins{2} /\
     pk{2}.`1 = load_array1536 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 4*384)
       ==> 
     Glob.mem{1} = mem /\
     res{1} = Array1568.init (fun i => if 0<=i<1408 then res{2}.`1.[i] else res{2}.`2.[i-1408])
].
proc*.
transitivity {1} { r <@ AuxMLKEM.iindcpa_enc_jazz(ctp,msgp,pkp,noiseseed);} 
(={Glob.mem,msgp,pkp,noiseseed,ctp} ==> ={Glob.mem,r}) 
( valid_ptr _pkp (384 * 4 + 32) /\
  Glob.mem{1} = mem /\
  msgp{1} = m{2} /\
  to_uint pkp{1} = _pkp /\
  noiseseed{1} = coins{2} /\
  pk{2}.`1 = load_array1536 mem _pkp /\ 
  pk{2}.`2 = load_array32 mem (_pkp + 4 * 384)
  ==>
  Glob.mem{1} = mem /\
     r{1} = Array1568.init (fun i => if 0<=i<1408 then r{2}.`1.[i] else r{2}.`2.[i-1408])); 1,2: smt().
+ by call auxienc_good; auto => />.

inline {1} 1; inline {2} 1.
swap {2} 9 -7.
sp 5 4.

swap {2} 5 -4.
swap {2} [7..8] -5.
seq 2 3 : (#pre /\ that{2} = lift_polyvec pkpv{1} /\
              signed_bound1024_cxq pkpv{1} 0 1024 2).
wp; ecall{1}(polyvec_frombytes_corr Glob.mem{1} _pkp).
+ auto => />  &1 ??; split; 1: by smt().
  move => ????rbound;split;last by smt().
  pose xx := (load_array1536 mem (to_uint pkp{1})).
  apply ofipolyvec_lift;last by smt().
  move : rbound; rewrite allP /pos_bound1024_cxq /bpos16 => rbound.
  move => k kb; have := rbound k kb. rewrite /= /decode12_vec !get_of_list 1:/#.
  have /=? /#:= decode_rng (BytesToBits (to_list (load_array1536 mem (to_uint pkp{1})))) 12 k.


seq 4 0 : (#{/~pkp{1}}pre /\ rho{2} = publicseed{1}). 
while {1} (valid_ptr _pkp (4*384 + 32)  /\ _pkp + 1536 + to_uint i{1} * 8 = to_uint pkp0{1} /\ 
           mem = Glob.mem{1} /\ rho{2} = load_array32 mem (_pkp + 4*384) /\ 
           0 <= to_uint i{1} <= 4 /\ 
          forall k, 0 <= k < to_uint i{1} * 8 => rho{2}.[k] = publicseed{1}.[k]) (4 - to_uint i{1}).
+ move => &m ?; auto => /> &hr ?????; rewrite /load_array32 ultE /loadW8 /= => H?. 
  rewrite  !to_uintD_small /=; 1,2:smt(); move => *.
  do split; 1..3,5:smt().
  move => k kbl kbh.
  case (0<=k <to_uint i{hr}*8).
  + move => *; move : (H k _); 1: smt().
    rewrite !initiE 1,2:/# get8_set64_directE 1,2:/# /=.
    case (8 * to_uint i{hr} <= k && k < 8 * to_uint i{hr} + 8).
    + move => *; rewrite /loadW8 /loadW64 pack8bE 1:/# !initiE /= /#. 
    by move => *; rewrite /get8 /init8 initiE /#.
  move => *;rewrite !initiE 1,2:/# get8_set64_directE 1,2:/# /=.
  case (8 * to_uint i{hr} <= k && k < 8 * to_uint i{hr} + 8).
  + move => *; rewrite /loadW8 /loadW64 pack8bE 1:/# !initiE /= /#. 
  by move => *; rewrite /get8 /init8 initiE /#.

auto => /> &1 &2 ??; rewrite /load_array1152 /load_array32.
rewrite !to_uintD_small 1:/#.
move => *;split; 1: smt().
move => il pkpl pseedl; rewrite ultE /=; split; 1:smt().
move => ????H; rewrite tP => k kb; rewrite initiE //=.
by move : (H k _);1:smt(); rewrite initiE //= /#.

swap {2} [6..7] -4. 
seq 3 3 : (#pre /\ aT{2} = lift_matrix at{1} /\
            pos_bound4096_cxq at{1} 0 4096 2). 
(* Simplifiable if spec were to call a function to gen matrix *)
+ inline AuxMLKEM.__gen_matrix; conseq />.
  seq 7 3 : (a{1}=aT{2});  last by auto => />;  smt(matrix_unlift).
  while (i0{1} = i{2} /\ 0<=i0{1}<=kvec /\ seed{1}=rho{2} /\ trans{1} /\
         forall ii jj, 0<=ii<i0{1} => 0<= jj <4 => (a{1}.[ii,jj])%Matrix = (aT{2}.[ii,jj])%Matrix); last
          by auto => /> *; apply: eq_matrixP; smt().
  wp; while (i0{1} = i{2} /\ j{1} = j{2} /\ 0<=i0{1}<kvec /\ 0<=j{1}<=kvec /\ seed{1}=rho{2} /\ trans{1} /\
         (forall ii jj, 0<=ii<i0{1} => 0<= jj <4 => (a{1}.[ii,jj])%Matrix = (aT{2}.[ii,jj])%Matrix) /\
         (forall jj, 0 <= jj <j{1} => (a{1}.[i0{1},jj])%Matrix = (aT{2}.[i0{1},jj]))%Matrix); last 
            by auto => />  /#.
  wp; call(_: ={XOF.state}); 1: by sim.
  wp; call(_: ={arg} ==> ={XOF.state}); 1: by sim. 
  by auto => />; smt(getmE setmE offunmK). 

swap {2} 12 -11.
seq 2 1 : (#pre /\ decompress_poly 1 mp{2} = lift_array256 k{1}  /\
            signed_bound_cxq k{1} 0 256 1). 
ecall{1} (poly_frommsg_corr m{2}); 1: by auto => /> /#.

swap {2} [2..9] -1.
seq 1 8 : (#pre /\ rv{2} = lift_polyvec sp_0{1} /\
    signed_bound1024_cxq sp_0{1} 0 1024 1 /\
     e1{2} = lift_polyvec ep{1} /\
    signed_bound1024_cxq ep{1} 0 1024 1 /\
    e2{2} = lift_array256 epp{1} /\
    signed_bound_cxq epp{1} 0 256 1).
+ inline AuxMLKEM.sample_noise3_spec AuxMLKEM.sample_noise2_spec. 
  wp; call(_: true); 1: by sim.
  conseq />; 1: by smt().
  seq 9 8 : (noise1{1}=rv{2} /\ noise2{1} = e1{2} /\ _N0{1} = _N{2} /\ 
             noiseseed1{1} = coins{2}); 
    1: by  sp 2 0; conseq />; sim; auto => />.
  by auto => />;  smt(vector_unlift poly_unlift).

swap {2} 1 3.

inline {1} AuxMLKEM.iredcompr.
swap {1} [21..22] -3.

seq 20 3 : (u{2} = lift_polyvec bp0{1} /\ v{2} = lift_array256 v{1} /\
            pos_bound256_cxq v{1} 0 256 2 /\
            pos_bound1024_cxq bp0{1} 0 1024 2 /\
            Glob.mem{1} = mem); last first.

wp; ecall{1}(i_poly_compress_corr (lift_array256 v{1})).
wp; ecall{1}(i_polyvec_compress_corr (lift_array1024 bp0{1}) ).
auto => /> &1?? t1 rr1 ?. 
rewrite tP => k kb;rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
case (0<=k<1408) => *.
+ rewrite ifF 1:/#;do congr.
  rewrite tP => i ib; rewrite !mapiE 1..3:/# /=;do congr.
  rewrite initiE 1:/# /= !getvE !offunvE //=.
  rewrite /lift_array256 /subarray256.
  case (0 <= i && i < 256); 1: by  move => kbb; rewrite !mapiE /= 1:/# !initiE /= /#.
  case (256 <= i && i < 512); 1: by move => kbb; rewrite !mapiE //= 1:/# !initiE // 1:/#.
  case (512 <= i && i < 768); 1: by move => kbb; rewrite !mapiE //= 1:/# !initiE // 1:/#.
  by move => *;rewrite !mapiE 1:/# /= !initiE /#. 
+ by smt().

(* Algebraic part *)

seq 1 1 : (#{/~signed_bound1024_cxq sp_0{1} 0 1024 1}
            {~rv{2} = lift_polyvec sp_0{1}}pre /\ 
            rhat{2} = lift_polyvec sp_0{1} /\
            pos_bound1024_cxq sp_0{1} 0 1024 2); 
  first by wp; ecall{1} (polyvec_ntt_corr sp_0{1}); auto => /> /#. 
     

seq 3 0 : (#pre /\
     (forall k, 0 <= k < 256 =>
         (lift_array1024 bp{1}).[k] = ((scale ((ntt_mmul aT{2} rhat{2}).[0])%Vector) (incoeff 169)).[k]) /\
          signed_bound1024_cxq bp{1} 0 256 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv (offunv (fun i => (aT{2}.[0,i])%PolyMat))) (invnttv rhat{2})).
auto => /> &1 &2 ?????????.
do split; 2,4: smt(nttvK). 
+ rewrite /lift_matrix /lift_polyvec /nttv /invnttv !mapvE /=.
  apply eq_vectorP => i ib; rewrite  !offunvE //= !offunvK /vclamp ib /=.
  by rewrite tP => k kb; rewrite subliftsub // !getmE offunmE //= nttK subsublift //.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
+ move => ???? result ?; rewrite /lift_array256 tP => rval. 
  split; last by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  move => k kbl kbh; rewrite mapiE 1:/# /= initiE 1:/# /= kbl kbh /=.
  move : (rval k _); 1: smt().
  rewrite mapiE //= => ->.
  rewrite /scale !mapiE //=; congr.
  by rewrite dotpmm // !getvE.

seq 2 0 : (#pre /\
     (forall k, 256 <= k < 512 =>
         (lift_array1024 bp{1}).[k] = ((scale ((ntt_mmul aT{2} rhat{2}).[1])%PolyVec) (incoeff 169)).[k-256]) /\
          signed_bound1024_cxq bp{1} 0 512 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv (offunv (fun i => (aT{2}.[1,i])%PolyMat))) (invnttv rhat{2})).
auto => /> &1 &2 ????????? rold ?.
do split; 2,4: smt(nttvK). 
+ rewrite /lift_matrix /lift_polyvec /nttv /invnttv !mapvE /=.
  apply eq_vectorP => i ib; rewrite !offunvE //= !offunvK /vclamp ib /=.
  by rewrite tP => k kb; rewrite subliftsub // !getmE offunmE //= nttK subsublift //.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
+ move => ???? result ?; rewrite /lift_array256 tP => rval. 
  do split. 
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(256 <= k && k < 512)) 1:/# /=.
    by move : (rold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite mapiE 1:/# /= initiE 1:/# /= kbl kbh /=.
    move : (rval (k - 256) _); 1: smt().
    rewrite mapiE 1:/# /= => ->.
    rewrite /scale !mapiE 1,2:/# /=; congr.
    by rewrite dotpmm //.
  by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().


seq 2 0 : (#pre /\
     (forall k, 512 <= k < 768 =>
         (lift_array1024 bp{1}).[k] = ((scale ((ntt_mmul aT{2} rhat{2}).[2])%PolyVec) (incoeff 169)).[k-512]) /\
          signed_bound1024_cxq bp{1} 0 768 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv (offunv (fun i => (aT{2}.[2,i])%PolyMat))) (invnttv rhat{2})).
auto => /> &1 &2 ????????? rold ? rnold ?.
do split; 2,4: smt(nttvK). 
+ rewrite /lift_matrix /lift_polyvec /nttv /invnttv !mapvE /=.
  apply eq_vectorP => i ib; rewrite !offunvE //= !offunvK /vclamp ib /=.
  by rewrite tP => k kb; rewrite subliftsub // !getmE offunmE //= nttK subsublift //.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
+ move => ???? result ?; rewrite /lift_array256 tP => rval. 
  do split. 
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(512 <= k && k < 768)) 1:/# /=.
    by move : (rold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(512 <= k && k < 768)) 1:/# /=.
    by move : (rnold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite mapiE 1:/# /= initiE 1:/# /=  kbl kbh /=.
    move : (rval (k - 512) _); 1: smt().
    rewrite mapiE 1:/# /= => ->.
    rewrite /scale !mapiE 1,2:/# /=; congr.
    by rewrite dotpmm //.
  by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().

seq 2 0 : (#pre /\
     (forall k, 768 <= k <1024 =>
         (lift_array1024 bp{1}).[k] = ((scale ((ntt_mmul aT{2} rhat{2}).[3])%PolyVec) (incoeff 169)).[k-768]) /\
          signed_bound1024_cxq bp{1} 0 1024 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv (offunv (fun i => (aT{2}.[3,i]))%PolyMat)) (invnttv rhat{2})).
auto => /> &1 &2 ????????? rold ? rnsold ? rnnsold ?.
do split; 2,4: smt(nttvK). 
+ rewrite /lift_matrix /lift_polyvec /nttv /invnttv !mapvE /=.
  apply eq_vectorP => i ib; rewrite !offunvE //= !offunvK /vclamp ib /=.
  by rewrite tP => k kb; rewrite subliftsub // !getmE offunmE //= nttK subsublift //.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
+ move => ???? result ?; rewrite /lift_array256 tP => rval. 
  do split. 
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(768 <= k && k < 1024)) 1:/# /=.
    by move : (rold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(768 <= k && k < 1024)) 1:/# /=.
    by move : (rnsold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite !mapiE 1,2:/# /= !initiE 1:/# /= (_: !(768 <= k && k < 1024)) 1:/# /=.
    by move : (rnnsold k _); 1: smt(); rewrite /lift_array1024 mapiE 1:/# /= /scale mapiE 1:/# /=.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().
  + move => k kbl kbh; rewrite mapiE 1:/# /= initiE 1:/# /= kbl kbh /=.
    move : (rval (k - 768) _); 1: smt().
    rewrite mapiE 1:/# /= => ->.
    rewrite /scale !mapiE 1,2:/# /=; congr.
    by rewrite dotpmm //.
  + by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //;  smt().

seq 2 0 : (#pre /\
     (forall k, 0 <= k < 256 =>
         (lift_array256 v{1}).[k] = ((scale (ntt (dotp (invnttv that{2}) (invnttv rhat{2}))) (incoeff 169))).[k]) /\
          signed_bound_cxq v{1} 0 256 2).

wp; ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv that{2}) (invnttv rhat{2})).
auto => /> &1 &2 ?????????????????.
do split; 1,2: smt(nttvK). 
+ by rewrite /signed_bound1024_cxq => k kb;  smt().
+ move => ??? result ?; rewrite /lift_array256 tP => rval. 
  move => k kbl kbh; rewrite mapiE 1:/# /=. 
  move : (rval k _); 1: smt().
  by rewrite mapiE //= => ->.

seq 1 0 : (#{/~bp{1}}pre /\ 
         lift_polyvec bp{1} = invnttv (ntt_mmul aT{2} rhat{2}) /\
         signed_bound1024_cxq bp{1} 0 1024 2).
+ ecall {1} (polyvec_invntt_corr bp{1}).
  auto => /> &1 &2 ?????????r1?r2?r3?r4???;split;1:smt(). 
  move => ?result <-?;  split; last by smt(). 
  rewrite /scale_polyvec /invnttv !mapvE /=  eq_vectorP => i ib.
  rewrite !offunvE //= offunvK /vclamp ib /= -invntt_scale /=; congr.
  rewrite /scale tP => k kb; rewrite /(lift_polyvec bp{1}) offunvK /vclamp ib /=.
  rewrite  mapiE //= /lift_array256 /subarray256 mapiE//= initiE//=.
  case (i = 0).
  + move => i0; move : (r1 k kb); rewrite /lift_array1024 mapiE// 1:/# /= i0 /= => ->.
    rewrite /scale mapiE 1:/# /=.
    by rewrite -ZqField.mulrA (ZqField.mulrC (incoeff 169)) rrinvcoeff ZqField.mulrC ZqField.mul1r.  
  case (i = 1).
  + move => i1 noi0; move : (r2 (256 + k) _); 1:smt(); rewrite /lift_array1024 mapiE// 1:/# /= i1 /= => ->.
    rewrite /scale mapiE 1:/# /=.
    by rewrite !getvE -ZqField.mulrA (ZqField.mulrC (incoeff 169)) rrinvcoeff ZqField.mulrC ZqField.mul1r.  
  case (i = 2).
  + move => i2 noi1 noi0; move : (r3 (512 + k) _); 1:smt(); rewrite /lift_array1024 mapiE// 1:/# /= i2 /= => ->.
    rewrite /scale mapiE 1:/# /=.
    by rewrite !getvE -ZqField.mulrA (ZqField.mulrC (incoeff 169)) rrinvcoeff ZqField.mulrC ZqField.mul1r.  
  case (i = 3); last by smt().
  move => i3 noi2 noi1 noi0; move : (r4 (768 + k) _); 1:smt(); rewrite /lift_array1024 mapiE// 1:/# /= i3 /= => ->.
  rewrite /scale mapiE 1:/# /=.
  by rewrite !getvE -ZqField.mulrA (ZqField.mulrC (incoeff 169)) rrinvcoeff ZqField.mulrC ZqField.mul1r.  

seq 1 0 : (#{/~v{1}}pre /\ 
         lift_array256 v{1} = invntt (ntt_dotp that{2} rhat{2}) /\
         signed_bound_cxq v{1} 0 256 2).
+ ecall {1} (invntt_correct (lift_array256 v{1})).
  auto => /> &1 &2 ?????????rold???; split;1:by smt().
  move=> ?result <- rb; split; last by smt(). 
  rewrite -invntt_scale; congr.
  rewrite /scale tP => k kb; rewrite mapiE //= rold // /scale mapiE //=.
  rewrite -ZqField.mulrA (ZqField.mulrC (incoeff 169)) rrinvcoeff ZqField.mulrC ZqField.mul1r.  
  rewrite /ntt_dotp /dotp /kvec /=.
  rewrite !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
  rewrite !add_comm_ntt !mul_comm_ntt.
  by rewrite -!getvE !nttvecinv // nttZero; congr;ring.

seq 1 0 : (#{/~bp{1}}pre /\ 
         lift_polyvec bp{1} = (invnttv (ntt_mmul aT{2} rhat{2}) + e1{2})%PolyVec /\
         signed_bound1024_cxq bp{1} 0 1024 3).
have H := polyvec_add_corr_impl 2 1 _ _ => //.
ecall{1} (H (lift_array1024 bp{1}) (lift_array1024 ep{1})); clear H.
+ auto => /> &1 &2 ?????????????result? rval.
  have -> : lift_polyvec result = (lift_polyvec bp{1} + lift_polyvec ep{1})%PolyVec; last by smt().
  rewrite polyvecD /Vector.(+) eq_vectorP => i ib.
  rewrite !offunvE //= tP => k kb.
  rewrite  /(&+) map2E /= !initiE //= !liftarrayvector //= -(rval (256*i + k) _) 1:/#.
  by rewrite subliftsub // /lift_array1024 mapiE //= /#.

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

seq 2 0 : (#pre /\ 
         lift_polyvec bp0{1} = (invnttv (ntt_mmul aT{2} rhat{2}) + e1{2})%PolyVec /\
         pos_bound1024_cxq bp0{1} 0 1024 2).
ecall{1}(polyvec_reduce_corr (lift_array1024 bp0{1})).
auto =>/> &1 &2 ?????????rold????rval?.
rewrite -rold; rewrite eq_vectorP => i ib.
by rewrite tP => k kb; rewrite !liftarrayvector // /#.

ecall{1}(poly_reduce_corr (lift_array256 v{1})).
by auto =>/> /#. 

qed.


lemma mlkem_correct_dec mem _ctp _skp : 
   equiv [Jkem1024.M(Jkem1024.Syscall).__indcpa_dec ~ InnerPKE1024.dec : 
     valid_ptr _ctp (4*352+160) /\
     valid_ptr _skp 1536 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2} = load_array1536 Glob.mem{1} _skp /\
     let (c1,c2) = cph{2} in
       c1 = load_array1408 Glob.mem{1} _ctp /\
       c2 = load_array160 Glob.mem{1} (_ctp + 1408)
       ==> 
     Glob.mem{1} = mem /\
     res{1} =  res{2}
].
proc => /=. 
swap {2} 3 -2.
sp 0 1.
swap {2} [3..4] -1.
swap {1} 6 -4.
seq 2 3 : (#pre /\ u{2} = lift_polyvec bp{1} /\
    signed_bound1024_cxq bp{1} 0 1024 2).
+ wp; ecall{1}(polyvec_decompress_corr Glob.mem{1} _ctp c1{2});
    1: by auto => /> /#. 

swap {2} [2..3] -1.
swap {1} [4..6] -3.
seq 3 2 : (#{/~ctp{1}}pre /\ v{2} = lift_array256 v{1} /\
     signed_bound_cxq v{1} 0 256 1). 
+ wp; ecall{1}(poly_decompress_corr Glob.mem{1} (to_uint ctp{1}) c2{2});
  by auto => /> &1 ?????; rewrite to_uintD_small /=;smt(). 

swap {1} 2 -1.
swap {1} 4 -2.
seq 2 3 : (#pre /\ s{2} = lift_polyvec skpv{1} /\
      signed_bound1024_cxq skpv{1} 0 1024 2). 
+ wp; ecall{1}(polyvec_frombytes_corr Glob.mem{1} (to_uint skp{1})).
  auto => /> &1 &2 ?????????rbound; split; 2: smt().
  pose xx := (load_array1536 mem (to_uint skp{1})).
  apply ofipolyvec_lift;2:smt().
  move : rbound; rewrite allP /pos_bound1024_cxq /bpos16 => rbound.
  move => k kb; have := rbound k kb;rewrite  /= /decode12_vec !get_of_list 1:/#.
  have /=?/# := decode_rng (BytesToBits (to_list (load_array1536 mem (to_uint skp{1})))) 12 k.

swap {1} 3 -2.
seq 1 0 : (#{/~u{2} = lift_polyvec bp{1}}pre /\ 
           lift_polyvec bp{1} = nttv u{2});  
   1:by ecall{1}(polyvec_ntt_corr bp{1}); auto => /#.

swap {1} 1 3.
seq 2 0: (#pre /\ 
          lift_array256 t{1} = scale (ntt_dotp s{2} (nttv u{2})) (incoeff 169) /\ 
          signed_bound_cxq t{1} 0 256 2).
ecall {1} (polyvec_pointwise_acc_corr_alg (invnttv s{2}) (u{2})).
+ auto => /> &1 &2 ????????.
  do split; 1,2:  smt(nttvK).
  move => ?? result ? ->. 
  congr; rewrite /dotp /ntt_dotp /kvec /lift_polyvec /invnttv  /=.
  rewrite !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
  rewrite !add_comm_ntt !mul_comm_ntt -!getvE. 
  rewrite !nttvecinv  // nttZero.
  rewrite /nttv !mapvE /=  /= !getvE  !offunvE //= /Vector."_.[_]".
  by ring.

seq 1 0: (#{/~t{1}}pre /\ 
          lift_array256 t{1} = invntt (ntt_dotp s{2} (nttv u{2})) /\ 
          signed_bound_cxq t{1} 0 256 2).
ecall {1} (invntt_correct (lift_array256 t{1})).
+ auto => /> &1 &2 ????????->?; split; 1: smt(). 
  move => ?result <-?;   split; last by smt().
  rewrite -invntt_scale; congr; rewrite /scale tP => k kp.
  rewrite !mapiE //=.
  by rewrite -ZqField.mulrA (ZqField.mulrC (incoeff 169)) rrinvcoeff ZqField.mulrC ZqField.mul1r.  

seq 2 0 : (#pre /\
           lift_array256 mp{1} =  v{2} &+ (&-) (invntt (ntt_dotp s{2} (nttv u{2}))) /\ 
           signed_bound_cxq mp{1} 0 256 3).
have H := poly_sub_corr_alg 1 2 _ _ => //.
ecall{1} (H (lift_array256 v{1}) (lift_array256 t{1})); 1: by  auto => /> /#.

seq 1 1 : (pos_bound256_cxq mp{1} 0 256 2 /\
           Glob.mem{1} = mem /\ lift_array256 mp{1} = mp{2}).
ecall{1}(poly_reduce_corr (lift_array256 mp{1})); 1: by auto => /> /#.

by ecall{1}(poly_tomsg_corr (lift_array256 mp{1})); auto => /> /#.
qed.
