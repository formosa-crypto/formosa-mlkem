require import AllCore.
from Jasmin require import JModel.
require import Fq Kyber KyberPoly KyberPolyVec W16extra NTT_Fq.
require import Array32 Array64 Array128 Array168 Array256 Array768 Array1152 Array2304.

require import Jindcpa.

import KyberPoly KyberPolyVec.
import Matrix_.
import Vector.
import Fq.
import Zq.

module H : KyberPKE.RO.POracle = {
  proc o(x : KyberPKE.RO.in_t) : KyberPKE.RO.out_t = { return witness;  }
}.

module (G : G_t) (H : KyberPKE.RO.POracle) = {
  var randomnessp : W64.t 

  proc sample() : W8.t Array32.t * W8.t Array32.t = { 
    var i,j,c;
    var inbuf : W8.t Array32.t;
    var buf : W8.t Array64.t;
    var publicseed : W8.t Array32.t;
    var noiseseed  : W8.t Array32.t;

    inbuf <- witness; 
    buf <- witness;
    publicseed <- witness;
    noiseseed <- witness;

    i <- (W64.of_int 0);
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (randomnessp + i)));
      inbuf.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
    }
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
  proc init(rho : W8.t Array32.t, i : int, j : int) : unit = {}
  proc next_bytes() : W8.t Array168.t = { return witness; }
}.

module (PRF : PRF_t) (O : KyberPKE.RO.POracle) = {
  var key : W8.t Array32.t
  proc init(sig : W8.t Array32.t) : unit = {}
  proc next_bytes(_N : int) : W8.t Array128.t = { return witness; }
}.

op valid_disj_reg(p1 : address, l1 : int, p2 : address, l2 : int) =
      valid_ptr p1 l1 /\ valid_ptr p2 l2 /\ ((p1 + l1) <= p2  || (p2 + l2) <= p1).


module AuxKG= {
proc sample_seeds(randomnessp : W64.t) : W8.t Array32.t * W8.t Array32.t = {
    var i,j,c;
    var inbuf:W8.t Array32.t;
    var buf:W8.t Array64.t;
    var publicseed:W8.t Array32.t;
    var noiseseed:W8.t Array32.t;

    inbuf <- witness;
    buf <- witness;
    publicseed <- witness;
    noiseseed <- witness;

    i <- (W64.of_int 0);
    
    while ((i \ult (W64.of_int 32))) {
      c <- (loadW8 Glob.mem (W64.to_uint (randomnessp + i)));
      inbuf.[(W64.to_uint i)] <- c;
      i <- (i + (W64.of_int 1));
    }
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

proc sample_noise(noiseseed:W8.t Array32.t) : W16.t Array768.t * W16.t Array768.t= {
    var nonce,aux;
    var skpv:W16.t Array768.t;    
    var e:W16.t Array768.t;    
    e <- witness;
    skpv <- witness;
    nonce <- (W8.of_int 0);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => skpv.[0 + i_0])),
    noiseseed, nonce);
    skpv <- Array768.init
            (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else skpv.[i]);
    nonce <- (W8.of_int 1);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => skpv.[256 + i_0])),
    noiseseed, nonce);
    skpv <- Array768.init
            (fun i => if 256 <= i < 256 + 256 then aux.[i-256]
            else skpv.[i]);
    nonce <- (W8.of_int 2);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => skpv.[(2 * 256) + i_0])),
    noiseseed, nonce);
    skpv <- Array768.init
            (fun i => if (2 * 256) <= i < (2 * 256) + 256
            then aux.[i-(2 * 256)] else skpv.[i]);
    nonce <- (W8.of_int 3);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => e.[0 + i_0])),
    noiseseed, nonce);
    e <- Array768.init
         (fun i => if 0 <= i < 0 + 256 then aux.[i-0] else e.[i]);
    nonce <- (W8.of_int 4);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => e.[256 + i_0])),
    noiseseed, nonce);
    e <- Array768.init
         (fun i => if 256 <= i < 256 + 256 then aux.[i-256] else e.[i]);
    nonce <- (W8.of_int 5);
    aux <@ M._poly_getnoise ((Array256.init (fun i_0 => e.[(2 * 256) + i_0])),
    noiseseed, nonce);
    e <- Array768.init
         (fun i => if (2 * 256) <= i < (2 * 256) + 256 then aux.[i-(2 * 256)]
         else e.[i]);
    return (skpv,e);
}
proc indcpa_keypair_jazz (pkp:W64.t, skp:W64.t, randomnessp:W64.t) : unit = {
    var aux: W16.t Array256.t;
    
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


    (publicseed,noiseseed) <@ sample_seeds(randomnessp);

    a <- witness;
    zero <- (W64.of_int 0);
    a <@ M.__gen_matrix (publicseed, zero);

    pkpv <- witness;               

    (skpv,e) <@ sample_noise(noiseseed);

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
}.

equiv auxkg_good :
  M.indcpa_keypair_jazz ~ AuxKG.indcpa_keypair_jazz :
     ={Glob.mem,arg} ==> ={Glob.mem,res}. 
proc. 
inline AuxKG.sample_seeds AuxKG.sample_noise Aux.inner_product.
swap {1} 4 -3.
swap {1} 3 -1.
swap {1} [11..13] -8.
swap {1} 8 -5.
swap {1} 10 -7.
swap {1} [14..16] -6.
seq 10 12 : (#pre /\ ={publicseed, noiseseed}); 1: by sim.
swap {1} [7..8] -5.
seq 3 3 : (#pre /\ ={a}); 1: by sim.
swap {1} [6..23] -2.
seq 21 23 : (#pre /\ ={skpv,e,pkpv}); 1: by  sim; auto => />. 
swap{1} [1..2] 16.

seq 2 2 : (#pre); 1: by sim.

seq 4 6 : #pre.

+ wp;call(_: true); 1: by sim. 
  wp;call(_:true); 1: by sim.
  auto => /> &1 result /=. 
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

(* We model G exactly as the implementation does it *)
lemma kyber_correct_kg mem _pkp _skp _randomnessp : 
   equiv [ M.indcpa_keypair_jazz ~ Kyber(G,XOF,PRF,H).kg : 
       Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp /\ to_uint skp{1} = _skp /\ 
       to_uint randomnessp{1} = _randomnessp /\
       Glob.mem{2} = mem /\ to_uint G.randomnessp{2} = _randomnessp /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3)
        ==> 
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk = load_array1152 Glob.mem{1} _skp /\
         t = load_array1152 Glob.mem{1} _pkp  /\
         rho = load_array32 Glob.mem{1} (_pkp+1152)].
proc*.
transitivity {1} { AuxKG.indcpa_keypair_jazz(pkp, skp, randomnessp);} 
(={Glob.mem,arg} ==> ={Glob.mem,r}) 
(   Glob.mem{1} = mem /\
    to_uint pkp{1} = _pkp /\
    to_uint skp{1} = _skp /\
    to_uint randomnessp{1} = _randomnessp /\
    Glob.mem{2} = mem /\ to_uint G.randomnessp{2} = _randomnessp /\ 
    valid_disj_reg _pkp (384 * 3 + 32) _skp (384 * 3)
    ==> 
    let (pk, sk) = r{2} in
    let (t, rho) = pk in
        sk = load_array1152 Glob.mem{1} _skp /\
        t = load_array1152 Glob.mem{1} _pkp /\ 
        rho = load_array32 Glob.mem{1} (_pkp + 1152)); 1,2: smt().
+ by call auxkg_good; auto => />.

inline {1} 1; inline {2} 1.

sp 3 0.

swap {2} 6 -5.
seq 1 1 : (#pre /\ rho{2} = publicseed{1} /\ sig{2} = noiseseed{1}).
+ by inline G(H).sample; inline AuxKG.sample_seeds; conseq => />; sim; auto => />; smt(W64.to_uintK W64.to_uint_small).

swap {2} [7..8] -5.
seq 3 3 : (#pre /\ a{2} = lift_matrix a{1} /\
            pos_bound2304_cxq a{1} 0 2304 2). 
admit. (* To Do: HUGE *)

swap {2} [5..10]  -2.
swap {1} 1 1.
seq 1 8 : (#pre /\ s{2} = lift_vector skpv{1} /\ e{2} = lift_vector e{1} /\
                signed_bound768_cxq skpv{1} 0 768 1 /\
                signed_bound768_cxq e{1} 0 768 1).
admit. (* To Do: Define PRF so that this works *)

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
    inFq (to_sint pkpv{1}.[k]) = (a{2} *^ s{2}).[0].[k]).

wp; ecall{1} (innerprod_corr 
     (invnttv (lift_vector (Array768.init (fun (i_0 : int) => a{1}.[0 + i_0]))))
     (invnttv (lift_vector skpv{1}))).

+ auto => /> &1 &2.
  move => ?????????.
  do split; 1,2,4: smt(NTT_Fq.nttvK).
  + rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
  + move => ???? result0 ?? k kbl kbh.
    rewrite !initiE 1:/# /= kbl kbh /= ; do split; 1,2:smt().
    admit.

seq 2 0 : (#pre /\
        (forall k, 256 <= k < 512 =>
         b16 pkpv{1}.[k]  (2*q)  /\ 
    inFq (to_sint pkpv{1}.[k]) = (a{2} *^ s{2}).[1].[k])
).

wp; ecall{1} (innerprod_corr 
     (invnttv (lift_vector (Array768.init (fun (i_0 : int) => a{1}.[768 + i_0]))))
     (invnttv (lift_vector skpv{1}))).

+ auto => /> &1 &2.
  move => ??????????.
  do split; 1,2,4: smt(NTT_Fq.nttvK).
  + by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
  move => ???? result0 ??. 
  split.
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    by rewrite (_: !(256 <= k && k < 512)) /# /=.
  move => k klb khb ; rewrite !initiE 1:/# /=; do split; 1,2:smt().
  rewrite klb khb /=. admit.

seq 2 0 : (#pre /\
        (forall k, 512 <= k < 768 =>
         b16 pkpv{1}.[k]  (2*q)  /\ 
    inFq (to_sint pkpv{1}.[k]) = (a{2} *^ s{2}).[2].[k])
).

wp; ecall{1} (innerprod_corr 
     (invnttv (lift_vector (Array768.init (fun (i_0 : int) => a{1}.[2*768 + i_0]))))
     (invnttv (lift_vector skpv{1}))).

+ auto => /> &1 &2.
  move => ???????????.
  do split; 1,2,4: smt(NTT_Fq.nttvK).
  + by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
  move => ???? result0 ??. 
  do split.
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    by rewrite (_: !(512 <= k && k < 768)) /# /=.
  + move => k klb khb; rewrite !initiE 1:/# /=; do split; 1,2:smt().
    by rewrite (_: !(512 <= k && k < 768)) /# /=.
  move => k klb khb ; rewrite !initiE 1:/# /=; do split; 1,2:smt().
  rewrite klb khb /=. admit.
  
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
auto => /> &1 &2 ????????? vs0 vs1 vs2.

do split; 1,2:smt().

move => ?? resf ? vsf. admit.
qed.

lemma kyber_correct_enc mem _coinsp _msgp _ctp _pkp : 
   equiv [ M.indcpa_enc_jazz ~ Kyber(G,XOF,PRF,H).enc: 
     valid_ptr _coinsp 32 /\
     valid_ptr _pkp (384*3 + 32) /\
     valid_ptr _msgp 32 /\
     valid_ptr _ctp (3*320+128) /\
     Glob.mem{1} = mem /\ to_uint coinsp{1} = _coinsp /\ 
                   to_uint msgp{1} = _msgp /\ to_uint ctp{1} = _ctp /\ 
                   to_uint pkp{1} = _pkp /\
     PRF.key{2} = load_array32 mem _coinsp /\
     m{2} = load_array32 mem _msgp /\
     pk{2}.`1 = load_array1152 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 3*384)
       ==> 
     let (c1,c2) = res{2} in
     c1 = load_array960 Glob.mem{2} _ctp /\
     c2 = load_array128 Glob.mem{2} (_ctp + 960)
].
proc => /=.
swap {2} 6 -5.
sp 0 1.
swap {1} 6 -5.
swap {1} [12..13] -10.
seq 3 0 : (#pre /\ PRF.key{2} = noiseseed{1}).
while {1} (valid_ptr _coinsp 32  /\ 
           _coinsp = to_uint coinsp{1} /\  
           mem = Glob.mem{1} /\ 
           PRF.key{2} = load_array32 mem _coinsp /\ 
           0 <= to_uint i{1} <= 32 /\ 
           forall k, 0 <= k < to_uint i{1} => PRF.key{2}.[k] = noiseseed{1}.[k]) (32 - to_uint i{1}).
+ move => &m z; rewrite /load_array32 //; auto => /> &hr ??? ? H. 
  rewrite ultE !to_uintD_small /=; 1,2: by smt(). 
   move => *;do split; 1,2,4: by smt().
   move => k0 kb0 kb1; rewrite !initiE /loadW8 1:/# /=. 
   case (0<= k0 < to_uint i{hr}); first by 
      move => kbb; move : (H k0 kbb); rewrite initiE 1:/#  set_neqiE /#.
   by move => *; rewrite set_eqiE /#.
auto => /> &1 &2 ???????; rewrite /load_array1152 /load_array32.
split; 1: smt().
move => il noisel; rewrite ultE /=; split; 1:smt().
move => ???H; rewrite tP => k kb; rewrite initiE //=.
by move : (H k _);1:smt(); rewrite initiE //= /#.

swap {2} 5 -4.
swap {2} [7..8] -5.
swap {1} 6 -5.
swap {1} 11 -9.
seq 2 3 : (#pre /\ that{2} = lift_vector pkpv{1} /\
              signed_bound768_cxq pkpv{1} 0 768 2).
wp; ecall(polyvec_frombytes_corr Glob.mem{1} _pkp).
+ auto => />  &1 ????????; split; 1: by smt().
  rewrite /pos_bound768_cxq /ofipolyvec /lift_vector /signed_bound768_cxq /subarray256 /lift_array256 => ?? result rbound.
  split; last by smt(). 
  by rewrite eq_vectorP => i ib; rewrite !offunvE //= tP => k kb; rewrite !mapiE //= !initiE //= mapiE /#.

swap {1} 6 -5.
swap {1} [10..12] -8.
seq 4 0 : (#{/~pkp{1}}pre /\ rho{2} = publicseed{1}). 
while {1} (valid_ptr _pkp (3*384 + 32)  /\ _pkp + 1152 + to_uint i{1} = to_uint pkp{1} /\ 
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
auto => /> &1 &2 ????????; rewrite /load_array1152 /load_array32.
rewrite !to_uintD_small 1:/#.
split; 1: smt().
move => il pkpl pseedl; rewrite ultE /=; split; 1:smt().
move => ????H; rewrite tP => k kb; rewrite initiE //=.
by move : (H k _);1:smt(); rewrite initiE //= /#.

swap {1} [10..11] -8.
swap {2} [6..7] -4. 
seq 3 3 : (#pre /\ aT{2} = lift_matrix at{1} /\
            pos_bound2304_cxq at{1} 0 2304 2). 
admit. (* To Do: HUGE but same as kg*)

swap {2} 12 -11.
swap {1} 4 -3.
swap {1} 8 -6.
seq 2 1 : (#pre /\ decompress_poly 1 mp{2} = lift_array256 k{1}  /\
            signed_bound_cxq k{1} 0 256 1). 
ecall (poly_frommsg_corr Glob.mem{1} _msgp m{2}); 1: by auto => /> /#.

swap {1} [3..6] -2.
swap {2} [4..7] -3.
swap {2} [10..16] -5.
seq 9 25 : (#pre /\ rv{1} = lift_vector sp_0{2} /\
    signed_bound768_cxq sp_0{2} 0 768 2 /\
     e1{1} = lift_vector ep{2} /\
    signed_bound768_cxq ep{2} 0 768 2 /\
    e2{1} = lift_array256 epp{2} /\
    signed_bound_cxq epp{2} 0 768 2). 
admit. (* To Do: Define PRF so that this works. same as kg *)
seq 3 13 : (u{1} = lift_vector bp{2} /\ v{1} = lift_array256 v{2} /\
    signed_bound_cxq v{2} 0 256 2 /\
    signed_bound768_cxq bp{2} 0 768 2).  
(****)
(****)
sp 1 0.
seq 0 1 : ( #{/~sp_0{2}}pre /\ rhat{1} = lift_vector sp_0{2} /\
        signed_bound768_cxq sp_0{2} 0 768 2).
by ecall {2} (polyvec_ntt_corr sp_0{2}); auto => /> * /#. 
(*****)
seq 0 1 : (#pre /\
    signed_bound_cxq poly0{2} 0 256 2 /\ lift_array256 poly0{2} = 
       NTT_Fq.NTT_Fq.scale (ntt (dotp (invnttv (lift_vector at0{2})) 
                                      (invnttv (lift_vector sp_0{2})))) (inFq 169)).
    conseq => />. 
   ecall{2} (polyvec_pointwise_acc_corr_alg 
        (invnttv (lift_vector at0{2})) (invnttv ((lift_vector sp_0{2})))).
    by auto => /> &1 &2 *; rewrite !NTT_Fq.NTT_Fq.nttvK /=.
seq 0 1 : (#pre /\
    signed_bound_cxq poly1{2} 0 256 2 /\ lift_array256 poly1{2} = 
       NTT_Fq.NTT_Fq.scale (ntt (dotp (invnttv (lift_vector at1{2})) 
                                      (invnttv (lift_vector sp_0{2})))) (inFq 169)).
    conseq => />. 
   ecall{2} (polyvec_pointwise_acc_corr_alg 
        (invnttv (lift_vector at1{2})) (invnttv ((lift_vector sp_0{2})))).
    by auto => /> &1 &2 *; rewrite !NTT_Fq.NTT_Fq.nttvK /=.
seq 0 1 : (#pre /\
    signed_bound_cxq poly2{2} 0 256 2 /\ lift_array256 poly2{2} = 
       NTT_Fq.NTT_Fq.scale (ntt (dotp (invnttv (lift_vector at2{2})) 
                                      (invnttv (lift_vector sp_0{2})))) (inFq 169)).
 conseq => />. 
   ecall{2} (polyvec_pointwise_acc_corr_alg 
        (invnttv (lift_vector at2{2})) (invnttv ((lift_vector sp_0{2})))).
    by auto => /> &1 &2 *; rewrite !NTT_Fq.NTT_Fq.nttvK /=.

seq 0 1 : (#pre /\
             signed_bound768_cxq bp{2} 0 768 2 /\
             (scale_vector (nttv (invnttm aT{1} *^ invnttv rhat{1})) (inFq 169)) = lift_vector bp{2}).
ecall {2} (polyvec_frompolys_corr poly0{2} poly1{2} poly2{2}
         (NTT_Fq.NTT_Fq.scale (ntt (dotp (invnttv (lift_vector at0{2})) (invnttv (lift_vector sp_0{2})))) (inFq 169))
         (NTT_Fq.NTT_Fq.scale (ntt (dotp (invnttv (lift_vector at1{2})) (invnttv (lift_vector sp_0{2})))) (inFq 169))
         (NTT_Fq.NTT_Fq.scale (ntt (dotp (invnttv (lift_vector at2{2})) (invnttv (lift_vector sp_0{2})))) (inFq 169)) 2).
auto => /> &1 &2.
move => 8? rvv *.
split; first by smt().
move => 8? H23 H24 H25.
rewrite rvv /lift_vector /lift_matrix /lift_polyvec /nttv /invnttm /invnttv /mapv /mapm /kvec => />.
rewrite eq_vectorP /kvec =>  i ib.
rewrite !offunvE /kvec => />.
rewrite  !offunvK /vclamp /kvec => />.
rewrite  !offunmK /mclamp /kvec ib  => />.

case (i = 0).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite !initiE => />.
rewrite (H23 k kb) /=.
rewrite /lift_vector /lift_polyvec /=.
rewrite /kvec /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunmE //=.
rewrite /kvec /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunvE //=.
by rewrite  !offunvK /vclamp /kvec => />. 

move => *.
case (i = 1).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite !initiE => />.
rewrite addrC (H24 k _) //=.
rewrite /lift_vector /lift_polyvec /=.
rewrite /kvec /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunmE //=.
rewrite /kvec /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunvE //=.
by rewrite  !offunvK /vclamp /kvec => />. 
 

move => *.
case (i = 2).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite !initiE => />.
rewrite addrC (H25 k kb) /=.
rewrite /lift_vector /lift_polyvec /=.
rewrite /kvec /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunmE //=.
rewrite /kvec /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunvE //=.
by rewrite  !offunvK /vclamp /kvec => />. 

smt().

(****)
seq 0 1 : (#pre /\
    signed_bound_cxq v{2} 0 256 2 /\ lift_array256 v{2} = 
       NTT_Fq.NTT_Fq.scale (ntt (dotp (invnttv (lift_vector pkpv{2})) 
                                      (invnttv (lift_vector sp_0{2})))) (inFq 169)).
    conseq => />. 
   ecall{2} (polyvec_pointwise_acc_corr_alg 
        (invnttv (lift_vector pkpv{2})) (invnttv ((lift_vector sp_0{2})))).
    by auto => /> &1 &2 *; rewrite !NTT_Fq.NTT_Fq.nttvK /=.

seq 0 1 : (#{/~bp{2}}pre /\
signed_bound768_cxq bp{2} 0 768 2 /\
   ((invnttm aT{1}) *^ (invnttv rhat{1})) = lift_vector bp{2}).
ecall {2} (polyvec_invntt_corr bp{2}).
auto=> />.
move  => &1 &2 8? -> 8? <- ?? result <- ?.
split; first by rewrite /signed_bound768_cxq;smt(@Array768 qE).
rewrite /scale_vector /( *^) /invnttm /invnttv /nttv /nttm /mapv /mapm /=.
rewrite !offunmK /mclamp /kvec !offunvK /vclamp /kvec /=.
rewrite eq_vectorP /kvec =>  i ib.
rewrite !offunvE //=. 
rewrite !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunvE //=. 
rewrite !offunmE //=. 
case (i = 0).
move => -> //=.
rewrite NTT_Fq.NTT_Fq.invntt_scale NTT_Fq.NTT_Fq.invnttK.
rewrite tP => k kb.
rewrite /scale mapE initiE //= mapE initiE //=.
have ? : (inFq 169 * inFq SignedReductions.R) = Zq.one; by smt(@SignedReductions @Zq).

case (i = 1).
move => -> //=.
rewrite NTT_Fq.NTT_Fq.invntt_scale NTT_Fq.NTT_Fq.invnttK.
rewrite tP => k kb.
rewrite /scale mapE initiE //= mapE initiE //=.
have ? : (inFq 169 * inFq SignedReductions.R) = Zq.one; by smt(@SignedReductions @Zq).

case (i = 2).
move => -> //=.
rewrite NTT_Fq.NTT_Fq.invntt_scale NTT_Fq.NTT_Fq.invnttK.
rewrite tP => k kb.
rewrite /scale mapE initiE //= mapE initiE //=.
have ? : (inFq 169 * inFq SignedReductions.R) = Zq.one; by smt(@SignedReductions @Zq).

smt().

(****)
seq 0 1 : (#{/~v{2}}pre /\
signed_bound_cxq v{2} 0 256 2 /\
   (dotp (invnttv that{1}) (invnttv rhat{1})) = lift_array256 v{2}).
ecall {2} (invntt_correct (lift_array256 v{2})).
auto=> />.
move  => &1 &2 8? -> 8? -> ?? result <-?. 
split; 1 : smt().
rewrite /invnttv /nttv /mapv /=.
rewrite /kvec !offunvK /vclamp /kvec /=.
rewrite /dotp /kvec /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunvE //=. 
rewrite NTT_Fq.NTT_Fq.invntt_scale NTT_Fq.NTT_Fq.invnttK.
rewrite tP => k kb.
rewrite /scale mapE initiE //= mapE initiE //=.
have ? : (inFq 169 * inFq SignedReductions.R) = Zq.one; by smt(@SignedReductions @Zq).

(******)
seq 0 1 : (#{/~bp{2}}pre /\
    signed_bound768_cxq bp{2} 0 768 4 /\ invnttm aT{1} *^ invnttv rhat{1} + e1{1} = lift_vector bp{2}{2}).
ecall {2} (polyvec_add_corr (lift_array768 bp{2}) (lift_array768 ep{2}) 2 2).
auto => /> &1 &2 8? -> 8? -> ? H17 result H18 H19.
(***************************************)
rewrite /Vector.(+) /lift_vector /lift_polyvec eq_vectorP /kvec => i ib.
rewrite !offunvE //=.
rewrite !offunvE //=.
rewrite tP => t tb.
rewrite !initiE //=.
rewrite (H19 (i*256+t) _); 1: by smt().
rewrite /Poly.(&+) /lift_array768 map2E !mapE !initiE //=; 1,2: smt().
by rewrite !initiE.


(**************)

seq 0 1 : (#{/~v{2}}pre /\
signed_bound_cxq v{2} 0 256 4 /\
   (lift_array256 v{2} = (dotp (invnttv that{1}) (invnttv rhat{1}) &+ e2{1}))).
ecall {2} (KyberPolyVec.poly_add_corr_ph (lift_array256 v{2}) (lift_array256 epp{2}) (2) (2)).
auto=> />.
move  => 19? <- ??.
split; 1: smt().
move => ? result  ? H20.
rewrite /lift_array256 /= /Poly.(&+) /= map2E /= !mapE //=. 
apply Array256.ext_eq => x xb.
rewrite !initiE //= .
rewrite !initiE //= .
rewrite (H20 (x) _); first by smt().
by rewrite /lift_array256 /= !mapE /= !initiE //=.

(**************)

seq 0 1 : (#{/~v{2}}pre /\
signed_bound_cxq v{2} 0 256 5 /\
   (lift_array256 v{2} = ((dotp (invnttv that{1}) (invnttv rhat{1}) &+ e2{1})) &+ decompress_poly 1 mp{1}) ).
ecall {2} (KyberPolyVec.poly_add_corr_ph (lift_array256 v{2}) (lift_array256 k{2}) (4) (1)).
auto=> />.
move  => &1 &2 4? <- 14?  <- ?? H20.
rewrite /lift_array256 /= /Poly.(&+) /= map2E /= !mapE //=. 
apply Array256.ext_eq => x xb.
rewrite !initiE //= .
rewrite !initiE //= .
rewrite (H20 (x) _); first by smt().
by rewrite /lift_array256 /= !mapE /= !initiE //=.

(*****)
seq 0 1 : (#{/~bp{2}}pre /\
pos_bound768_cxq bp{2} 0 768 2 /\
    invnttm aT{1} *^ invnttv rhat{1} + e1{1} = lift_vector bp{2}).
ecall {2} (polyvec_reduce_corr (lift_array768 bp{2})).
auto => />.
move => &1 &2 17? -> ?? result H H0.
rewrite /lift_array768 /lift_vector /lift_polyvec /=.
rewrite eq_vectorP /kvec => i ib.
rewrite  !offunvE /vclamp /kvec //=.
move : H; rewrite /lift_array768 !mapE Array768.tP Array256.tP => H k kb.
move : (H (k + i * 256) _); 1: smt(). 
by rewrite !initiE; smt().

(********)
(*****)
seq 0 1 : (#{/~v{2}}pre /\
pos_bound256_cxq v{2} 0 256 2 /\
   (lift_array256 v{2} = ((dotp (invnttv that{1}) (invnttv rhat{1}) &+ e2{1} &+ decompress_poly 1 mp{1})))).
ecall {2} (poly_reduce_corr (lift_array256 v{2})).
by auto => /> /#.

(*****)

auto => />.

move => &1 &2 17? <- ? ->.

do split. 

rewrite NTT_Fq.NTT_Fq.invnttvK /nttv /invnttv /invnttm /mapv /mapm /lift_vector /ntt_mmul /lift_polyvec /( *^) /=.
rewrite !offunvK /vclamp /kvec //=.
rewrite eq_vectorP /kvec => i ib.
rewrite  !offunvE /vclamp /kvec //=.
rewrite  !offunvE /vclamp /kvec //=.
rewrite ib /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=. 
rewrite  !offunmE  /mclamp /kvec //=.
rewrite  /lift_matrix /mapm /=. 
rewrite !offunmK  /mclamp /kvec ib //=.
rewrite  !offunvE /vclamp /kvec //=.

by rewrite !NTT_Fq.NTT_Fq.add_comm_invntt !NTT_Fq.NTT_Fq.mul_comm_invntt !NTT_Fq.NTT_Fq.invnttK NTT_Fq.NTT_Fq.invnttzero.
 
ring.

rewrite /nttv /invnttv /mapv /ntt_dotp /dotp /kvec /=.
rewrite  !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=. 
rewrite  !offunvE /vclamp /kvec //=.

rewrite !offunvK  /vclamp /kvec//=.

rewrite !NTT_Fq.NTT_Fq.add_comm_invntt.
have -> :
  (basemul (lift_polyvec pkpv{2} 0) (ntt (tofunv rv{1} 0))) = 
  (basemul (ntt (invntt (lift_polyvec pkpv{2} 0))) (ntt (tofunv rv{1} 0))) by rewrite NTT_Fq.NTT_Fq.nttK.
have -> :
  (basemul (lift_polyvec pkpv{2} 1) (ntt (tofunv rv{1} 1))) = 
  (basemul (ntt (invntt (lift_polyvec pkpv{2} 1))) (ntt (tofunv rv{1} 1))) by rewrite NTT_Fq.NTT_Fq.nttK.
have -> :
  (basemul (lift_polyvec pkpv{2} 2) (ntt (tofunv rv{1} 2))) = 
  (basemul (ntt (invntt (lift_polyvec pkpv{2} 2))) (ntt (tofunv rv{1} 2))) by rewrite NTT_Fq.NTT_Fq.nttK.
rewrite !NTT_Fq.NTT_Fq.mul_comm_invntt !NTT_Fq.NTT_Fq.nttK.
ring.
rewrite NTT_Fq.NTT_Fq.invnttzero.  
smt(@ZR).

smt().
smt().

(****)
admit. (* just storing in memory *)
qed.

lemma kyber_correct_dec mem _msgp _ctp : 
   equiv [ Kyber(G,XOF,PRF,H).dec ~ M.indcpa_dec_jazz : 
     valid_ptr _msgp 32 /\
     valid_ptr _ctp (3*320+128) /\
     Glob.mem{1} = mem /\ to_uint msgp{2} = _msgp /\ to_uint ctp{2} = _ctp /\
     let (c1,c2) = cph{1} in
     c1.[0] = load_array320 Glob.mem{2} _ctp /\
     c1.[1] = load_array320 Glob.mem{2} (_ctp + 320) /\
     c1.[2] = load_array320 Glob.mem{2} (_ctp + 640) /\
     c2 = load_array128 Glob.mem{2} (_ctp + 960)
       ==> 
     oget res{1} = load_array32 mem _msgp
].
proc. 
swap {1} 3 -2.
sp 1 0.
swap {1} [3..4] -1.
swap {2} 6 -4.
seq 3 2 : (#pre /\ u{1} = lift_vector bp{2} /\
    signed_bound768_cxq bp{2} 0 768 2).
admit. (*easy to do *)
swap {1} [2..3] -1.
swap {2} [4..6] -3.
seq 2 3 : (#pre /\ v{1} = lift_array256 v{2} /\
     signed_bound_cxq v{2} 0 256 1). 
admit. (*easy to do *)
swap {2} 2 -1.
swap {2} 4 -2.
seq 3 2 : (#pre /\ s{1} = lift_vector skpv{2} /\
      signed_bound768_cxq skpv{2} 0 768 2). (* add bounds *)
admit. (* easy to do *)
seq 1 7 : (mp{1} = lift_array256 mp{2} /\ 
       signed_bound_cxq mp{2} 0 256 2). 

(***)
seq 0 3 : ( #{/~bp{2}}pre /\ nttv u{1} = lift_vector bp{2} /\
        signed_bound768_cxq bp{2} 0 768 2).
by ecall {2} (polyvec_ntt_corr bp{2}); auto => /> * /#. 

seq 0 1 : (#pre /\
    signed_bound_cxq t{2} 0 256 2 /\ lift_array256 t{2} = 
       NTT_Fq.NTT_Fq.scale (ntt (dotp (invnttv (lift_vector skpv{2})) 
                                      (invnttv (lift_vector bp{2})))) (inFq 169)).
    conseq => />. 
   ecall{2} (polyvec_pointwise_acc_corr_alg 
        (invnttv (lift_vector skpv{2})) (invnttv ((lift_vector bp{2})))).
    by auto => /> &1 &2 *; rewrite !NTT_Fq.NTT_Fq.nttvK /=.
 
(****)
seq 0 1 : (#{/~t{2}}pre /\
signed_bound_cxq t{2} 0 256 2 /\
   (dotp (invnttv (lift_vector skpv{2})) (invnttv (lift_vector bp{2}))) = lift_array256 t{2}).
ecall {2} (invntt_correct (lift_array256 t{2})).
auto=> />.
move  => &1 &2 12? -> result <-?. 
split; 1 : smt().
rewrite /invnttv /nttv /mapv /=.
rewrite /kvec !offunvK /vclamp /kvec /=.
rewrite /dotp /kvec /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunvE //=. 
rewrite NTT_Fq.NTT_Fq.invntt_scale NTT_Fq.NTT_Fq.invnttK.
rewrite tP => k kb.
rewrite /scale mapE initiE //= mapE initiE //=.
have ? : (inFq 169 * inFq SignedReductions.R) = Zq.one; by smt(@SignedReductions @Zq).

(******)
(******)

seq 0 1 : (#pre /\
  lift_array256 mp{2} = 
    v{1} &+ ((&-) (dotp (invnttv s{1}) u{1}))  /\
     signed_bound_cxq mp{2} 0 256 3).
have H1 : 0 <= 1 && 1 <= 4 by smt().
have H2 : 0 <= 2 && 2 <= 4 by smt().
exists * v{1}, (dotp (invnttv s{1}) u{1}).
elim* => pa pb.
call {2} (poly_sub_corr pa pb 1 2 H1 H2).
auto => />.
move => &1 &2; rewrite /lift_vector /nttv /mapv /= eq_vectorP /lift_polyvec => 9? H ?? <-.
split. 
rewrite /dotp /kvec /=.
rewrite  !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=.
rewrite /invnttv /mapv !offunvE //=.
rewrite /kvec !offunvK /vclamp /kvec /=.
have -> : u{1}.[0] =
   invntt ((init (fun (i : int) => inFq (to_sint bp{2}.[i]))))%Array256.
by move : (H 0); rewrite /kvec /= !offunvE //=; smt(NTT_Fq.NTT_Fq.nttK NTT_Fq.NTT_Fq.invnttK).
have -> : u{1}.[1] =
   invntt ((init (fun (i : int) => inFq (to_sint bp{2}.[256 + i]))))%Array256.
by move : (H 1); rewrite /kvec /= !offunvE //=; smt(addrC NTT_Fq.NTT_Fq.nttK NTT_Fq.NTT_Fq.invnttK).
have -> : u{1}.[2] =
   invntt ((init (fun (i : int) => inFq (to_sint bp{2}.[512 + i]))))%Array256.
by move : (H 2); rewrite /kvec /= !offunvE //=; smt(addrC NTT_Fq.NTT_Fq.nttK NTT_Fq.NTT_Fq.invnttK).
smt().

move => ? result ?HH.
rewrite /lift_array256 tP => k kb.
rewrite !mapE !initiE //=.
rewrite (HH k _) //=.
rewrite /lift_array256 //=.
rewrite !mapE !initiE //=.
rewrite /(&-) /(&+) /= mapE map2E /= !initiE //=.
rewrite /invnttv /mapv //=.
rewrite /kvec !offunvK /vclamp /kvec /=.
rewrite /dotp /kvec /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunvE //=. 
rewrite /(&+) /= !map2E /= !initiE //=.
rewrite !initiE //=.
rewrite !initiE //=.
rewrite !initiE //=.
by rewrite !initiE //=.

(*****)
seq 0 1 : (#{/~mp{2}}pre /\
pos_bound256_cxq mp{2} 0 256 2 /\
   (lift_array256 mp{2} =  (v{1} &+ (&-) (dotp (invnttv s{1}) u{1})))).
ecall {2} (poly_reduce_corr (lift_array256 mp{2})).
by auto => /> /#.


auto => />.
move => &1 &2 12? ?? ->.
split; last by smt().

congr. congr.

rewrite /ntt_dotp /lift_vector /nttv /dotp /invnttv /kvec /mapv /=.
rewrite /kvec !offunvK /vclamp /kvec /=.
rewrite /dotp /kvec /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunvE //=. 
rewrite !NTT_Fq.NTT_Fq.add_comm_invntt.
have -> : (lift_polyvec skpv{2} 0) = ntt (invntt (lift_polyvec skpv{2} 0)) by smt(NTT_Fq.NTT_Fq.nttK).
have -> : (lift_polyvec skpv{2} 1) = ntt (invntt (lift_polyvec skpv{2} 1)) by smt(NTT_Fq.NTT_Fq.nttK).
have -> : (lift_polyvec skpv{2} 2) = ntt (invntt (lift_polyvec skpv{2} 2)) by smt(NTT_Fq.NTT_Fq.nttK).
rewrite -!NTT_Fq.NTT_Fq.mul_comm_ntt.
rewrite NTT_Fq.NTT_Fq.invnttzero !NTT_Fq.NTT_Fq.nttK.
by rewrite !NTT_Fq.NTT_Fq.invnttK.


admit. (* writing to memory *)
qed.
