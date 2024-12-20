require import AllCore IntDiv List.
require import Jkem_avx2 Jkem_avx2_stack  MLKEM_InnerPKE_avx2 MLKEM.
from Jasmin require import JModel_x86.

require import Array32 Array33 Array64 Array148 Array256 Array768 Array960 Array128 Array1088 Array1152 Array1184 Array2304 Array2400.
require import Array8 WArray32 WArray33 Array300 WArray64 WArray1184 WArray2400.
import MLKEM InnerPKE.

module Mix = {
  
  proc __indcpa_keypair(pk : W8.t Array1184.t, sk : W8.t Array2400.t, randomnessp : W8.t Array32.t) :
    W8.t Array1184.t * W8.t Array2400.t = {
    var aux : int;
    var aux_4 : W8.t Array1152.t;
    var aux_3 : W16.t Array256.t;
    var aux_2 : W16.t Array256.t;
    var aux_1 : W16.t Array256.t;
    var aux_0 : W16.t Array256.t;
    var i : int;
    var t64 : W64.t;
    var inbuf : W8.t Array33.t;
    var buf : W8.t Array64.t;
    var publicseed : W8.t Array32.t;
    var noiseseed : W8.t Array32.t;
    var transposed : W64.t;
    var aa : W16.t Array2304.t;
    var nonce : W8.t;
    var skpv : W16.t Array768.t;
    var e : W16.t Array768.t;
    var pkpv : W16.t Array768.t;
    
    aa <- witness;
    buf <- witness;
    e <- witness;
    inbuf <- witness;
    noiseseed <- witness;
    pkpv <- witness;
    publicseed <- witness;
    skpv <- witness;
    aux <- 32 %/ 8;
    i <- 0;
    while (i < aux){
      t64 <- (get64 ((init8 (fun (i_0 : int) => randomnessp.[i_0])))%WArray32 i)%WArray32;
      inbuf <-
        (init
           ((get8
               ((set64 ((init8 (fun (i_0 : int) => (inbuf.[i_0])%Array33)))%WArray33 i t64))%WArray33))%WArray33)%Array33;
      i <- i + 1;
    }
    inbuf.[32] <- mask03u8;
    buf <@ M._sha3_512A_A33(buf, inbuf);
    aux <- 32 %/ 8;
    i <- 0;
    while (i < aux){
      t64 <- get64 ((init8 (fun (i_0 : int) => buf.[i_0])))%WArray64 i;
      publicseed <-
        (init
           ((get8 ((set64 ((init8 (fun (i_0 : int) => publicseed.[i_0])))%WArray32 i t64))%WArray32))%WArray32)%Array32;
      t64 <- get64 ((init8 (fun (i_0 : int) => buf.[i_0])))%WArray64 (i + 32 %/ 8);
      noiseseed <-
        (init
           ((get8 ((set64 ((init8 (fun (i_0 : int) => noiseseed.[i_0])))%WArray32 i t64))%WArray32))%WArray32)%Array32;
      i <- i + 1;
    }
    transposed <- W64.zero;
    aa <@ Jkem_avx2.M(Syscall)._gen_matrix_avx2(aa, publicseed, transposed);
    nonce <- W8.zero;
    (aux_3, aux_2, aux_1, aux_0) <@
      M._poly_getnoise_eta1_4x((init (fun (i_0 : int) => (skpv.[0 + i_0])%Array768))%Array256,
                               (init (fun (i_0 : int) => (skpv.[256 + i_0])%Array768))%Array256,
                               (init (fun (i_0 : int) => (skpv.[2 * 256 + i_0])%Array768))%Array256,
                               (init (fun (i_0 : int) => (e.[0 + i_0])%Array768))%Array256,
                               noiseseed, nonce);
    skpv <-
      (init
         (fun (i_0 : int) =>
            if 0 <= i_0 && i_0 < 0 + 256 then (aux_3.[i_0 - 0])%Array256 else (skpv.[i_0])%Array768))%Array768;
    skpv <-
      (init
         (fun (i_0 : int) =>
            if 256 <= i_0 && i_0 < 256 + 256 then (aux_2.[i_0 - 256])%Array256
            else (skpv.[i_0])%Array768))%Array768;
    skpv <-
      (init
         (fun (i_0 : int) =>
            if 2 * 256 <= i_0 && i_0 < 2 * 256 + 256 then (aux_1.[i_0 - 2 * 256])%Array256
            else (skpv.[i_0])%Array768))%Array768;
    e <-
      (init
         (fun (i_0 : int) =>
            if 0 <= i_0 && i_0 < 0 + 256 then (aux_0.[i_0 - 0])%Array256 else (e.[i_0])%Array768))%Array768;
    nonce <- (of_int 4)%W8;
    (aux_3, aux_2, aux_1, aux_0) <@
      M._poly_getnoise_eta1_4x((init (fun (i_0 : int) => (e.[256 + i_0])%Array768))%Array256,
                               (init (fun (i_0 : int) => (e.[2 * 256 + i_0])%Array768))%Array256,
                               (init (fun (i_0 : int) => (pkpv.[0 + i_0])%Array768))%Array256,
                               (init (fun (i_0 : int) => (pkpv.[256 + i_0])%Array768))%Array256,
                               noiseseed, nonce);
    e <-
      (init
         (fun (i_0 : int) =>
            if 256 <= i_0 && i_0 < 256 + 256 then (aux_3.[i_0 - 256])%Array256
            else (e.[i_0])%Array768))%Array768;
    e <-
      (init
         (fun (i_0 : int) =>
            if 2 * 256 <= i_0 && i_0 < 2 * 256 + 256 then (aux_2.[i_0 - 2 * 256])%Array256
            else (e.[i_0])%Array768))%Array768;
    pkpv <-
      (init
         (fun (i_0 : int) =>
            if 0 <= i_0 && i_0 < 0 + 256 then (aux_1.[i_0 - 0])%Array256 else (pkpv.[i_0])%Array768))%Array768;
    pkpv <-
      (init
         (fun (i_0 : int) =>
            if 256 <= i_0 && i_0 < 256 + 256 then (aux_0.[i_0 - 256])%Array256
            else (pkpv.[i_0])%Array768))%Array768;
    skpv <@ Jkem_avx2.M(Syscall).__polyvec_ntt(skpv);
    e <@ Jkem_avx2.M(Syscall).__polyvec_ntt(e);
    i <- 0;
    while (i < 3){
      aux_3 <@
        M.__polyvec_pointwise_acc((init (fun (i_0 : int) => (pkpv.[i * 256 + i_0])%Array768))%Array256,
                                  (init (fun (i_0 : int) => (aa.[i * (3 * 256) + i_0])%Array2304))%Array768,
                                  skpv);
      pkpv <-
        (init
           (fun (i_0 : int) =>
              if i * 256 <= i_0 && i_0 < i * 256 + 256 then (aux_3.[i_0 - i * 256])%Array256
              else (pkpv.[i_0])%Array768))%Array768;
      aux_3 <@ Jkem_avx2.M(Syscall)._poly_frommont((init (fun (i_0 : int) => (pkpv.[i * 256 + i_0])%Array768))%Array256);
      pkpv <-
        (init
           (fun (i_0 : int) =>
              if i * 256 <= i_0 && i_0 < i * 256 + 256 then (aux_3.[i_0 - i * 256])%Array256
              else (pkpv.[i_0])%Array768))%Array768;
      i <- i + 1;
    }
    pkpv <@ Jkem_avx2.M(Syscall).__polyvec_add2(pkpv, e);
    pkpv <@ Jkem_avx2.M(Syscall).__polyvec_reduce(pkpv);
    aux_4 <@ M.__i_polyvec_tobytes((init (fun (i_0 : int) => sk.[0 + i_0]))%Array1152, skpv);
    sk <- (init (fun (i_0 : int) => if 0 <= i_0 && i_0 < 0 + 1152 then aux_4.[i_0 - 0] else sk.[i_0]))%Array2400;
    aux_4 <@ M.__i_polyvec_tobytes((init (fun (i_0 : int) => pk.[0 + i_0]))%Array1152, pkpv);
    pk <- (init (fun (i_0 : int) => if 0 <= i_0 && i_0 < 0 + 1152 then aux_4.[i_0 - 0] else pk.[i_0]))%Array1184;
    aux <- 32 %/ 8;
    i <- 0;
    while (i < aux){
      t64 <- (get64 ((init8 (fun (i_0 : int) => publicseed.[i_0])))%WArray32 i)%WArray32;
      pk <-
        (init (get8 (set64_direct ((init8 (fun (i_0 : int) => pk.[i_0])))%WArray1184 ((i + 3 * 384 %/ 8) * 8) t64)))%Array1184;
      i <- i + 1;
    }
    
    return (pk, sk);
  }
  
  proc __indcpa_enc(ct : W8.t Array1088.t, msgp : W8.t Array32.t, pk : W8.t Array1184.t, noiseseed : W8.t Array32.t) :
    W8.t Array1088.t = {
    var aux : int;
    var aux_5 : W8.t Array128.t;
    var aux_4 : W8.t Array960.t;
    var aux_3 : W16.t Array256.t;
    var aux_2 : W16.t Array256.t;
    var aux_1 : W16.t Array256.t;
    var aux_0 : W16.t Array256.t;
    var pkpv : W16.t Array768.t;
    var w : int;
    var t64 : W64.t;
    var publicseed : W8.t Array32.t;
    var k : W16.t Array256.t;
    var s_noiseseed : W8.t Array32.t;
    var transposed : W64.t;
    var aat : W16.t Array2304.t;
    var lnoiseseed : W8.t Array32.t;
    var nonce : W8.t;
    var sp_0 : W16.t Array768.t;
    var ep : W16.t Array768.t;
    var epp : W16.t Array256.t;
    var bp : W16.t Array768.t;
    var v : W16.t Array256.t;
    
    aat <- witness;
    bp <- witness;
    ep <- witness;
    epp <- witness;
    k <- witness;
    lnoiseseed <- witness;
    pkpv <- witness;
    publicseed <- witness;
    s_noiseseed <- witness;
    sp_0 <- witness;
    v <- witness;
    pkpv <@ M.__i_polyvec_frombytes((init (fun (i : int) => pk.[0 + i]))%Array1152);
    aux <- 32 %/ 8;
    w <- 0;
    while (w < aux){
      t64 <- get64_direct ((init8 (fun (i : int) => pk.[i])))%WArray1184 ((3 * 384 %/ 8 + w) * 8);
      publicseed <-
        (init
           ((get8 ((set64 ((init8 (fun (i : int) => publicseed.[i])))%WArray32 w t64))%WArray32))%WArray32)%Array32;
      w <- w + 1;
    }
    k <@ M._i_poly_frommsg(k, msgp);
    s_noiseseed <- noiseseed;
    transposed <- W64.one;
    aat <@ Jkem_avx2.M(Syscall)._gen_matrix_avx2(aat, publicseed, transposed);
    lnoiseseed <- s_noiseseed;
    nonce <- W8.zero;
    (aux_3, aux_2, aux_1, aux_0) <@
      M._poly_getnoise_eta1_4x((init (fun (i : int) => (sp_0.[0 + i])%Array768))%Array256,
                               (init (fun (i : int) => (sp_0.[256 + i])%Array768))%Array256,
                               (init (fun (i : int) => (sp_0.[2 * 256 + i])%Array768))%Array256,
                               (init (fun (i : int) => (ep.[0 + i])%Array768))%Array256, lnoiseseed,
                               nonce);
    sp_0 <-
      (init
         (fun (i : int) =>
            if 0 <= i && i < 0 + 256 then (aux_3.[i - 0])%Array256 else (sp_0.[i])%Array768))%Array768;
    sp_0 <-
      (init
         (fun (i : int) =>
            if 256 <= i && i < 256 + 256 then (aux_2.[i - 256])%Array256 else (sp_0.[i])%Array768))%Array768;
    sp_0 <-
      (init
         (fun (i : int) =>
            if 2 * 256 <= i && i < 2 * 256 + 256 then (aux_1.[i - 2 * 256])%Array256
            else (sp_0.[i])%Array768))%Array768;
    ep <-
      (init
         (fun (i : int) =>
            if 0 <= i && i < 0 + 256 then (aux_0.[i - 0])%Array256 else (ep.[i])%Array768))%Array768;
    lnoiseseed <- s_noiseseed;
    nonce <- (of_int 4)%W8;
    (aux_3, aux_2, aux_1, aux_0) <@
      M._poly_getnoise_eta1_4x((init (fun (i : int) => (ep.[256 + i])%Array768))%Array256,
                               (init (fun (i : int) => (ep.[2 * 256 + i])%Array768))%Array256, epp,
                               (init (fun (i : int) => (bp.[0 + i])%Array768))%Array256, lnoiseseed,
                               nonce);
    ep <-
      (init
         (fun (i : int) =>
            if 256 <= i && i < 256 + 256 then (aux_3.[i - 256])%Array256 else (ep.[i])%Array768))%Array768;
    ep <-
      (init
         (fun (i : int) =>
            if 2 * 256 <= i && i < 2 * 256 + 256 then (aux_2.[i - 2 * 256])%Array256
            else (ep.[i])%Array768))%Array768;
    epp <- aux_1;
    bp <-
      (init
         (fun (i : int) =>
            if 0 <= i && i < 0 + 256 then (aux_0.[i - 0])%Array256 else (bp.[i])%Array768))%Array768;
    sp_0 <@ Jkem_avx2.M(Syscall).__polyvec_ntt(sp_0);
    w <- 0;
    while (w < 3){
      aux_3 <@
        M.__polyvec_pointwise_acc((init (fun (i : int) => (bp.[w * 256 + i])%Array768))%Array256,
                                  (init (fun (i : int) => (aat.[w * (3 * 256) + i])%Array2304))%Array768,
                                  sp_0);
      bp <-
        (init
           (fun (i : int) =>
              if w * 256 <= i && i < w * 256 + 256 then (aux_3.[i - w * 256])%Array256
              else (bp.[i])%Array768))%Array768;
      w <- w + 1;
    }
    v <@ Jkem_avx2.M(Syscall).__polyvec_pointwise_acc(v, pkpv, sp_0);
    bp <@ Jkem_avx2.M(Syscall).__polyvec_invntt(bp);
    v <@ Jkem_avx2.M(Syscall)._poly_invntt(v);
    bp <@ Jkem_avx2.M(Syscall).__polyvec_add2(bp, ep);
    v <@ Jkem_avx2.M(Syscall)._poly_add2(v, epp);
    v <@ Jkem_avx2.M(Syscall)._poly_add2(v, k);
    bp <@ Jkem_avx2.M(Syscall).__polyvec_reduce(bp);
    v <@ Jkem_avx2.M(Syscall).__poly_reduce(v);
    aux_4 <@ M.__i_polyvec_compress((init (fun (i : int) => ct.[0 + i]))%Array960, bp);
    ct <- (init (fun (i : int) => if 0 <= i && i < 0 + 960 then aux_4.[i - 0] else ct.[i]))%Array1088;
    (aux_5, aux_3) <@ M._i_poly_compress((init (fun (i : int) => ct.[3 * 320 + i]))%Array128, v);
    ct <- (init (fun (i : int) => if 3 * 320 <= i && i < 3 * 320 + 128 then aux_5.[i - 3 * 320] else ct.[i]))%Array1088;
    v <- aux_3;
    
    return ct;
  }
  
  proc __indcpa_dec(msgp : W8.t Array32.t, ct : W8.t Array1088.t, sk : W8.t Array1152.t) : W8.t Array32.t = {
    var bp : W16.t Array768.t;
    var v : W16.t Array256.t;
    var skpv : W16.t Array768.t;
    var t : W16.t Array256.t;
    var mp : W16.t Array256.t;
    
    bp <- witness;
    mp <- witness;
    skpv <- witness;
    t <- witness;
    v <- witness;
    bp <@ M.__i_polyvec_decompress(ct);
    v <@ M._i_poly_decompress(v, (init (fun (i : int) => ct.[3 * 320 + i]))%Array128);
    skpv <@ M.__i_polyvec_frombytes(sk);
    bp <@ Jkem_avx2.M(Syscall).__polyvec_ntt(bp);
    t <@ Jkem_avx2.M(Syscall).__polyvec_pointwise_acc(t, skpv, bp);
    t <@ Jkem_avx2.M(Syscall)._poly_invntt(t);
    mp <@ Jkem_avx2.M(Syscall)._poly_sub(mp, v, t);
    mp <@ Jkem_avx2.M(Syscall).__poly_reduce(mp);
    (msgp, mp) <@ M._i_poly_tomsg(msgp, mp);
    
    return msgp;
  }
  
}.

equiv aux_dumpstate : 
  M.a64____dumpstate_array_avx2 ~ M.a64____dumpstate_array_avx2 :
   ={buf, offset, lEN, st} ==> ={res}.
proc => /=.
sp;if;1: by auto.
seq 1 1 : (={buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;seq 1 1 : (={buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
seq 1 1 : (={buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;seq 1 1 : (={buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
qed.

equiv aux_buflen_dumpstate : 
M.aBUFLEN____dumpstate_array_avx2 ~ Jkem_avx2.M(Syscall).aBUFLEN____dumpstate_array_avx2 : ={buf, offset, lEN, st}  ==> ={res}.
proc => /=.
sp;if;1: by auto.
seq 1 1 : (={buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;seq 1 1 : (={buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
seq 1 1 : (={buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;seq 1 1 : (={buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
qed.

equiv aux_buflen_dumpstate1 : 
Jkem_avx2.M(Syscall).aBUFLEN____dumpstate_array_avx2 ~ Jkem_avx2.M(Syscall).aBUFLEN____dumpstate_array_avx2 : ={buf, offset, lEN, st}  ==> ={res}.
proc => /=.
sp;if;1: by auto.
seq 1 1 : (={buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;seq 1 1 : (={buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
seq 1 1 : (={buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;seq 1 1 : (={buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
qed.

equiv aux_buflen_dumpstate2 :
     M.a64____dumpstate_array_avx2 ~ Jkem_avx2.M(Syscall).a64____dumpstate_array_avx2 :
  ={buf, offset, lEN, st} ==> ={res}.
proc => /=.
sp;if;1: by auto.
seq 1 1 : (={buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;seq 1 1 : (={buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,_0,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
seq 1 1 : (={buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;seq 1 1 : (={buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA}); 1: by sim. 
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
sp;if;1: by auto.
sp;seq 1 1 : (={t,t128_0,t128_1,buf, offset, lEN, st,buf, dELTA,t256_0,t256_1,t256_2,t256_3}); by sim. 
by sim.
qed.


equiv mlkem_correct_kg_avx2_stack_mix  : 
M.__indcpa_keypair  ~ Mix.__indcpa_keypair  : ={arg} ==> ={res}.
proc => /=. 
sim (M.a64____dumpstate_array_avx2 ~ M.a64____dumpstate_array_avx2 :
   true)
   (M.aBUFLEN____dumpstate_array_avx2 ~ Jkem_avx2.M(Syscall).aBUFLEN____dumpstate_array_avx2 : true) => /=; [ by apply aux_dumpstate | by apply aux_buflen_dumpstate].
qed.

equiv aux_invntt : 
  M._poly_invntt ~ Jkem_avx2.M(Syscall)._poly_invntt : ={arg} ==> ={res}.
proc. 
by unroll for {1} ^while; unroll for {2} ^while; sim.
qed.

equiv mlkem_correct_enc_avx2_stack_mix  : 
M.__indcpa_enc  ~ Mix.__indcpa_enc  : ={arg} ==> ={res}.
proc => /=. 
sim (M._poly_invntt ~ Jkem_avx2.M(Syscall)._poly_invntt : (true))
 (M.aBUFLEN____dumpstate_array_avx2 ~ Jkem_avx2.M(Syscall).aBUFLEN____dumpstate_array_avx2 : true) => /=;
   [ by apply aux_buflen_dumpstate | by apply aux_invntt].
qed.

equiv mlkem_correct_dec_avx2_stack_mix  : 
M.__indcpa_dec  ~ Mix.__indcpa_dec  : ={arg} ==> ={res}.
proc => /=. 
sim (M._poly_invntt ~ Jkem_avx2.M(Syscall)._poly_invntt : (true)); by apply aux_invntt.
qed.

require import MLKEMFCLib.

op load_array1184 (m : global_mem_t) (p : address) : W8.t Array1184.t = 
      (Array1184.init (fun (i : int) => m.[p + i])).

lemma polyvec_to_bytes_stack_equiv _mem _pos:
   0 <= _pos <= 1184 =>
   equiv [ Jkem_avx2_stack.M.__i_polyvec_tobytes
           ~ Jkem_avx2.M(Syscall).__polyvec_tobytes :
   Glob.mem{2} = _mem /\ arg{2}.`1 = W64.of_int _pos /\ arg{1}.`2 = arg{2}.`2 ==>
  Glob.mem{2} =
  stores _mem _pos
    (take 1152
       (to_list res{1}))].
admitted.


import InnerPKE.
equiv mlkem_correct_kg_avx2_stack  : 
M.__indcpa_keypair  ~ InnerPKE.kg_derand :
arg{1}.`3 = arg{2} ==> 
    res{2}.`2 = Array1152.init ("_.[_]" res{1}.`2) /\
    res{2}.`1.`1 = (init (fun (i : int) => res{1}.`1.[i]))%Array1152 /\
    res{2}.`1.`2 = (init (fun (i : int) => res{1}.`1.[i + 1152]))%Array32.
proc* => //. 
transitivity {1} {r <@ Mix.__indcpa_keypair(pk,sk,randomnessp); }
    (={pk,sk,randomnessp} ==> ={r})
    (randomnessp{1} = coins{2} ==> 
    r{2}.`2 = Array1152.init ("_.[_]" r{1}.`2) /\
    r{2}.`1.`1 = (init (fun (i : int) => r{1}.`1.[i]))%Array1152 /\
    r{2}.`1.`2 = (init (fun (i : int) => r{1}.`1.[i + 1152]))%Array32);1,2:smt().
+ by call mlkem_correct_kg_avx2_stack_mix;auto.


pose _pkp := W64.of_int 0.
pose _skp := W64.of_int (384 * 3 + 32). 
transitivity {1} {Jkem_avx2.M(Jkem_avx2.Syscall).__indcpa_keypair(_pkp, _skp, randomnessp);} 
(={randomnessp} /\ 
  Glob.mem{2} = witness /\
    randomnessp{1} = randomnessp{2}  ==> 
    Glob.mem{2} = stores (stores witness<:global_mem_t> (384 * 3 + 32) (take 1152 (to_list r{1}.`2))) 0 (to_list r{1}.`1)) 
(   Glob.mem{1} = witness /\ 
       randomnessp{1} = coins{2}
    ==> 
    let (pk, sk) = r{2} in
    let (t, rho) = pk in
        sk = load_array1152 Glob.mem{1} (384 * 3 + 32) /\
        t = load_array1152 Glob.mem{1} 0 /\ 
        rho = load_array32 Glob.mem{1} (1152));1: smt(); last 
    by call (mlkem_correct_kg_avx2 witness 0 (384 * 3 + 32));auto => /> /#.
+  move => /= &1 &m &2; rewrite (:r{2} = (r{2}.`1,r{2}.`2)) 1:/# /=
        (:r{2}.`1 = (r{2}.`1.`1,r{2}.`1.`2)) 1:/# /= => [#] -> [#] -> -> ->.
   do split;rewrite tP => i ib; rewrite initiE 1:/# /= !get_storesE /=.
   + by move => *; rewrite !size_take /= 1:/# !size_to_list /= ifF 1:/# ifT 1:/#  take_mkseq 1:/# initiE 1:/# /= nth_mkseq /#. 
   + by move => *; rewrite !size_take /= 1:/# !size_to_list /= ifT 1:/# initiE 1:/# /= nth_mkseq /#. 
   + by move => *; rewrite !size_take /= 1:/# !size_to_list /= ifT 1:/# initiE 1:/# /= nth_mkseq /#. 


inline {1} 1; inline {2} 1.
sp 3 3.
seq 12 12 : (#pre /\ ={aa,buf,e,inbuf,noiseseed,pkpv,publicseed,skpv}); 1: by conseq />;sim.

seq 1 1 : #pre.
+ conseq />; inline {1} 1; inline {2} 1.
  by sim (M.a64____dumpstate_array_avx2 ~ Jkem_avx2.M(Syscall).a64____dumpstate_array_avx2 :true) => /=;apply aux_buflen_dumpstate2.

seq 23 23 : #pre.
conseq />. 
by sim 
   (Jkem_avx2.M(Syscall).aBUFLEN____dumpstate_array_avx2 ~ 
    Jkem_avx2.M(Syscall).aBUFLEN____dumpstate_array_avx2 : true) => /=; apply aux_buflen_dumpstate1.

wp => /=.

seq 2 1 :
  (#{/~Glob.mem{2} = witness}{~sk0{1}=sk{1}}pre /\
  Glob.mem{2} = stores witness (384 * 3 + 32) (take 1152 (to_list sk0{1}))).
+ wp;conseq />.
  call (polyvec_to_bytes_stack_equiv (witness<: global_mem_t>) 1184 _).
  auto => /> &1 ? /= rr; congr.
  apply (eq_from_nth witness).
  + by rewrite !size_take 1,2:/# !size_to_list /=.
  move => i; rewrite size_take 1:/# size_to_list /= => ib.
  by rewrite !nth_take 1..4:/# get_to_list initiE 1:/# /= /#.

seq 2 1 :
  (#{/~Glob.mem{2}}{~pk0{1}=pk{1}}pre /\
  Glob.mem{2} = stores (stores witness (384 * 3 + 32) (take 1152 (to_list sk0{1}))) 0 (take 1152 (to_list pk0{1}))).
+ wp;conseq />.
  exlim (stores witness (384 * 3 + 32) (take 1152 (to_list sk0{1}))) => memp.
  call (polyvec_to_bytes_stack_equiv memp 0).
  auto => /> &1 ? rr;congr.
  apply (eq_from_nth witness).
  + by rewrite !size_take 1,2:/# !size_to_list /=.
  move => i; rewrite size_take 1:/# size_to_list /= => ib.
  by rewrite !nth_take 1..4:/# get_to_list initiE 1:/# /= /#.

while (#{/~Glob.mem{2}}{~pkp{2}}pre /\ ={aux,i} /\ aux{1} = 4 /\ 0 <= i{1} <= 4 /\
     to_uint pkp{2} = 1152+8*i{1} /\
     
  Glob.mem{2} = stores (stores witness (384 * 3 +32) (take 1152 (to_list sk0{1}))) 0 (take (1152 + 8*i{1}) (to_list pk0{1}))); last by  auto => />;smt(take_size Array1184.size_to_list).

auto => /> &1 &2 ????;do split;1,2:smt().
+ by rewrite to_uintD_small /#. 
rewrite /storeW64.
pose memp := (stores witness 1184 (take 1152 (to_list sk0{1}))).
apply mem_eq_ext => add.
rewrite !get_storesE !size_take 1..3:/# !size_to_list.
case (0 <= add < 1184+1152 /\ !(1152 + (i{2} + 1) * 8 <= add < 1184)); last first.
+ move => *.
  by rewrite ifF 1:/# ifF 1:/# ifF 1:/# ifF 1:/#.
move => ?.
case (0 <= add < 1152).
+ move => *.
  rewrite ifF 1:/# ifT 1:/# ifT 1:/#.
  rewrite nth_take 1,2:/#.
  rewrite nth_take 1,2:/#.
  rewrite /to_list nth_mkseq 1:/# /= nth_mkseq 1:/# /= initiE 1:/# /=.
  by rewrite get8_set64_directE 1,2:/# ifF 1:/# /get8 initiE /#.
move => ?.
case (1184 <= add < 1184 + 1152).
+ move => *.
  by rewrite ifF 1:/# ifF 1:/# ifT 1:/# ifF /#.
move => ?.
case (1152 <= add < 1152 + 8*i{2}).
+ move => *.
  rewrite size_map iotaredE size_iota /max /=. 
  rewrite ifF 1:/# ifT 1:/# ifT 1:/#.
  rewrite nth_take 1,2:/#.
  rewrite nth_take 1,2:/#.
  rewrite /to_list nth_mkseq 1:/# /= nth_mkseq 1:/# /= initiE 1:/# /=.
  by rewrite get8_set64_directE 1,2:/# ifF 1:/# /get8 initiE /#.
+ move => *.
  rewrite size_map iotaredE size_iota /max /=. 
  rewrite ifT 1:/# ifT 1:/#.
  rewrite (nth_map witness);1: smt(size_iota).
  rewrite nth_iota  1:/#.
  rewrite nth_take 1,2:/#.
  rewrite /to_list nth_mkseq 1:/# /= initiE 1:/# /=.
  by rewrite get8_set64_directE 1,2:/# ifT 1:/# /get8 /#.
qed.

equiv aux_invntt2 : 
  Jkem_avx2.M(Syscall)._poly_invntt ~ Jkem_avx2.M(Syscall)._poly_invntt : ={arg} ==> ={res}.
proc. 
by unroll for {1} ^while; unroll for {2} ^while; sim.
qed.


lemma polyvec_from_bytes_stack_equiv:
   equiv [ Jkem_avx2_stack.M.__i_polyvec_frombytes
           ~ Jkem_avx2.M(Syscall).__polyvec_frombytes :
   to_uint arg{2} = 0 /\
   load_array1152 Glob.mem{2} 0 = arg{1} ==> ={res}].
admitted.


equiv mlkem_correct_enc_avx2_stack  : 
M.__indcpa_enc  ~ InnerPKE.enc_derand :
arg{1}.`2 = arg{2}.`2 /\ arg{1}.`4 = arg{2}.`3 /\
   Array1152.init(fun i => arg{1}.`3.[i]) = arg{2}.`1.`1 /\
   Array32.init(fun i => arg{1}.`3.[i+1152]) = arg{2}.`1.`2 ==>
   Array960.init(fun i => res{1}.[i]) = res{2}.`1 /\
   Array128.init(fun i => res{1}.[i+960]) = res{2}.`2.
proc* => //. 
transitivity {1} {r <@ Mix.__indcpa_enc(ct, msgp, pk, noiseseed); }
    (={ct, msgp, pk, noiseseed} ==> ={r})
    (msgp{1} = m{2} /\ noiseseed{1} = coins{2} /\
   Array1152.init(fun i => pk{1}.[i]) = pk{2}.`1 /\
   Array32.init(fun i => pk{1}.[i+1152]) = pk{2}.`2 ==>
   Array960.init(fun i => r{1}.[i]) = r{2}.`1 /\
   Array128.init(fun i => r{1}.[i+960]) = r{2}.`2);1,2:smt().
+ by call mlkem_correct_enc_avx2_stack_mix;auto.

pose _pkp := W64.of_int 0.

transitivity {1} {r <@ Jkem_avx2.M(Jkem_avx2.Syscall).__indcpa_enc_1(ct, msgp, _pkp, noiseseed); }
    (msgp{1} = msgp{2} /\ noiseseed{1} = noiseseed{2} /\ ct{1} = ct{2} /\
     load_array1184 Glob.mem{2} 0 = pk{1} ==> ={r})
     (noiseseed{1} = coins{2} /\ msgp{1} = m{2} /\
     load_array1152 Glob.mem{1} 0 = pk{2}.`1 /\
      load_array32 Glob.mem{1} 1152 = pk{2}.`2
     ==> 
     Array960.init(fun i => r{1}.[i]) = r{2}.`1 /\
   Array128.init(fun i => r{1}.[i+960]) = r{2}.`2); 2: smt();last first.
+ by ecall (mlkem_correct_enc_1_avx2 (Glob.mem{1})  0); auto => /> /#. 
+ move => /> &1 &2; rewrite !tP => ??.
  exists (stores (stores witness 0 (to_list pk{2}.`1)) 1152 (to_list pk{2}.`2)) ct{1} m{2} coins{2} => /=.
  do split. 
  + rewrite /load_array1184 tP => k kb.
    rewrite initiE 1:/# /= !get_storesE size_to_list size_to_list; smt(@Array1152 @Array32 @Array1184).
  + rewrite /load_array1152 tP => k kb.
    rewrite initiE 1:/# /= !get_storesE size_to_list size_to_list; smt(@Array1152 @Array32 @Array1184).
  + rewrite /load_array32 tP => k kb.
    rewrite initiE 1:/# /= !get_storesE size_to_list size_to_list; smt(@Array1152 @Array32 @Array1184).

inline {1} 1; inline {2} 1.
sp 3 3.
seq 12 12 : (#pre /\ ={aat,noiseseed0,bp,ep,epp,k,lnoiseseed,pkpv,publicseed,s_noiseseed,sp_0,v}); 1: by conseq />;sim.

seq 1 1 : #pre.
+ conseq />. 
  call polyvec_from_bytes_stack_equiv.
  auto => /> &2.
  rewrite /load_array1152 /load_array1184 tP => ??.
  by rewrite initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.

seq 3 3 : #pre.
+ admit. 

by sim (Jkem_avx2.M(Syscall)._poly_invntt ~ Jkem_avx2.M(Syscall)._poly_invntt : (true))
 (Jkem_avx2.M(Syscall).aBUFLEN____dumpstate_array_avx2 ~ Jkem_avx2.M(Syscall).aBUFLEN____dumpstate_array_avx2 : true)  (M.a64____dumpstate_array_avx2 ~ Jkem_avx2.M(Syscall).a64____dumpstate_array_avx2 :true) => /=;[ apply aux_buflen_dumpstate1 | apply aux_invntt2]. 
qed.


equiv mlkem_correct_dec_avx2_stack  : 
M.__indcpa_dec  ~ InnerPKE.dec :
arg{1}.`3 = arg{2}.`1 /\ 
Array960.init(fun i => arg{1}.`2.[i]) = arg{2}.`2.`1 /\
Array128.init(fun i => arg{1}.`2.[i+960]) = arg{2}.`2.`2  ==>
   ={res}.
proc*.
transitivity {1} {r <@ Mix.__indcpa_dec(msgp, ct, sk); }
    (={msgp, ct, sk} ==> ={r})
    (sk{1} = sk{2} /\ 
Array960.init(fun i => ct{1}.[i]) = cph{2}.`1 /\
Array128.init(fun i => ct{1}.[i+960]) = cph{2}.`2  ==>
   ={r});1,2:smt().
+ by call mlkem_correct_dec_avx2_stack_mix;auto.
admitted.
