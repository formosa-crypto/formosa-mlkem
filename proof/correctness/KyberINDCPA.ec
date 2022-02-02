require import AllCore.
from Jasmin require import JModel.
require import Fq Kyber KyberPoly KyberPolyVec.
require import Array3 Array32 Array64 Array128 Array168.

require import Jindcpa.

import KyberPoly KyberPolyVec.

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
    buf <@ M.sha3512_32 (buf, inbuf);
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

(* Won't prove we only touch passed in regions *)
(* We model G exactly as the implementation does it *)
lemma kyber_correct_kg mem _pkp _skp _randomnessp : 
   equiv [ Kyber(G,XOF,PRF,H).kg ~ M.indcpa_keypair_jazz : 
       Glob.mem{2} = mem /\ to_uint pkp{2} = _pkp /\ to_uint skp{2} = _skp /\ to_uint randomnessp{2} = _randomnessp /\
       Glob.mem{1} = mem /\ to_uint G.randomnessp{1} = _randomnessp /\
       valid_range W8 mem _pkp (384*3+32) /\
       valid_range W8 mem _skp (384*3)
        ==> 
       let (pk,sk) = res{1} in let (t,rho) = pk in
         sk.[0] = load_array384 Glob.mem{2} _skp /\
         sk.[1] = load_array384 Glob.mem{2} (_skp+384) /\
         sk.[2] = load_array384 Glob.mem{2} (_skp+2*384) /\
         t.[0] = load_array384 Glob.mem{2} _pkp /\
         t.[1] = load_array384 Glob.mem{2} (_pkp+384) /\
         t.[2] = load_array384 Glob.mem{2} (_pkp+2*384) /\
         rho = load_array32 Glob.mem{2} (_pkp+3*384)
 ].
proc.
swap {1} 6 -5.
swap {2} 4 -3.
swap {2} [6..7] -4.
swap {2} 12 -8.
swap {2} [16..21] -11.
seq 1 10 : (#pre /\ rho{1} = publicseed{2} /\ sig{1} = noiseseed{2}).
+ by inline *; conseq => />; sim; auto => />; smt(W64.to_uintK W64.to_uint_small).
swap {1} [7..8] -5.
swap {2} [12..13] -8.
seq 3 5 : (#pre /\ a{1} = lift_matrix (a0{2},a1{2},a2{2}) /\
            signed_bound768_cxq a0{2} 0 768 2 /\
            signed_bound768_cxq a1{2} 0 768 2 /\
            signed_bound768_cxq a2{2} 0 768 2). 
inline M.gen_matrix. (* Need to define XOF such that this works. *)
admit. (* To Do: HUGE *)
swap {1} [5..10]  -2.
swap {2} 6 -4.
swap {2} [4..6] -1.
swap {2} [9..22] -3.
seq 8 19 : (#pre /\ s{1} = lift_vector skpv{2} /\ e{1} = lift_vector e{2} /\
                signed_bound768_cxq skpv{2} 0 768 2 /\
                signed_bound768_cxq e{2} 0 768 2).
admit. (* To Do: Define PRF so that this works *)
seq 5 14 : (#pre /\ t{1} = lift_vector pkpv{2} /\
                signed_bound768_cxq pkpv{2} 0 768 2). 
seq 2 1: #pre; first by auto.
sp 0 2.
exists * s{1}, e{1}, skpv{2}, e{2} .
elim * => _s1 _e1 _s2 _e2.
seq 1 1 : (#{/~_s1}{~_s2}pre /\ s{1} = nttv _s1).
by call {2} (polyvec_ntt_corr _s2); auto => /> * /#. 
seq 1 1 : (#{/~_e1}{~_e2}pre /\ e{1} = nttv _e1).
by call {2} (polyvec_ntt_corr _e2); auto => /> * /#. 
(*****)
seq 0 2 : (#pre /\
    signed_bound_cxq poly0{2} 0 256 2 /\ lift_array256 poly0{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector).
    conseq => />.
transitivity {2} {poly0 <@ Aux.inner_product(a0,skpv); } 
    ((spkp{2} = pkp{2} /\
   sskp{2} = skp{2} /\
   Glob.mem{2} = mem /\
   to_uint (pkp{2}, skp{2}, randomnessp{2}).`1 = _pkp /\
   to_uint (pkp{2}, skp{2}, randomnessp{2}).`2 = _skp /\
   to_uint (pkp{2}, skp{2}, randomnessp{2}).`3 = _randomnessp /\
   Glob.mem{1} = mem /\
   to_uint G.randomnessp{1} = _randomnessp /\
   valid_range W8 mem _pkp (384 * 3 + 32) /\
   valid_range W8 mem _skp (384 * 3) /\
   rho{1} = publicseed{2} /\
   sig{1} = noiseseed{2} /\
   a{1} = lift_matrix (a0{2}, a1{2}, a2{2}) /\
   signed_bound768_cxq a0{2} 0 768 2 /\
   signed_bound768_cxq a1{2} 0 768 2 /\
   signed_bound768_cxq a2{2} 0 768 2 /\
   s{1} = lift_vector skpv{2} /\
   e{1} = lift_vector e{2} /\
   signed_bound768_cxq skpv{2} 0 768 2 /\ signed_bound768_cxq e{2} 0 768 2 /\ s{1} = nttv _s1) /\
  e{1} = nttv _e1 
    ==> 
  signed_bound_cxq poly0{2} 0 256 2 /\
  lift_array256 poly0{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector)
 
   ((spkp{2} = pkp{2} /\
   sskp{2} = skp{2} /\
   Glob.mem{2} = mem /\
   to_uint (pkp{2}, skp{2}, randomnessp{2}).`1 = _pkp /\
   to_uint (pkp{2}, skp{2}, randomnessp{2}).`2 = _skp /\
   to_uint (pkp{2}, skp{2}, randomnessp{2}).`3 = _randomnessp /\
   Glob.mem{1} = mem /\
   to_uint G.randomnessp{1} = _randomnessp /\
   valid_range W8 mem _pkp (384 * 3 + 32) /\
   valid_range W8 mem _skp (384 * 3) /\
   signed_bound768_cxq a0{2} 0 768 2 /\
   signed_bound768_cxq a1{2} 0 768 2 /\
   signed_bound768_cxq a2{2} 0 768 2 /\
   signed_bound768_cxq skpv{2} 0 768 2 /\ signed_bound768_cxq e{2} 0 768 2)/\
   ={a0,skpv}
    ==> 
 ={a0,poly0,skpv}).
+ by smt(). 
+ by smt(). 
+ by ecall {2} (innerprod_corr (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2})));auto => />;smt(NTT_Fq.NTT_Fq.nttvK). 
+ inline {1} 1. 
  wp; call(_: true); 1: by sim.
  wp; call(_: true); 1: by sim.
  by auto => />. 
(*****)
seq 0 2 : (#pre /\
    signed_bound_cxq poly1{2} 0 256 2 /\ lift_array256 poly1{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a1{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector).
    conseq => />.
transitivity {2} {poly1 <@ Aux.inner_product(a1,skpv); } 
    (((spkp{2} = pkp{2} /\
    sskp{2} = skp{2} /\
    Glob.mem{2} = mem /\
    to_uint (pkp{2}, skp{2}, randomnessp{2}).`1 = _pkp /\
    to_uint (pkp{2}, skp{2}, randomnessp{2}).`2 = _skp /\
    to_uint (pkp{2}, skp{2}, randomnessp{2}).`3 = _randomnessp /\
    Glob.mem{1} = mem /\
    to_uint G.randomnessp{1} = _randomnessp /\
    valid_range W8 mem _pkp (384 * 3 + 32) /\
    valid_range W8 mem _skp (384 * 3) /\
    rho{1} = publicseed{2} /\
    sig{1} = noiseseed{2} /\
    a{1} = lift_matrix (a0{2}, a1{2}, a2{2}) /\
    signed_bound768_cxq a0{2} 0 768 2 /\
    signed_bound768_cxq a1{2} 0 768 2 /\
    signed_bound768_cxq a2{2} 0 768 2 /\
    s{1} = lift_vector skpv{2} /\
    e{1} = lift_vector e{2} /\
    signed_bound768_cxq skpv{2} 0 768 2 /\ signed_bound768_cxq e{2} 0 768 2 /\ s{1} = nttv _s1) /\
   e{1} = nttv _e1) /\
  signed_bound_cxq poly0{2} 0 256 2 /\
  lift_array256 poly0{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector 
    ==> 
  signed_bound_cxq poly1{2} 0 256 2 /\
  lift_array256 poly1{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a1{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector)
 
   (((spkp{2} = pkp{2} /\
    sskp{2} = skp{2} /\
    Glob.mem{2} = mem /\
    to_uint (pkp{2}, skp{2}, randomnessp{2}).`1 = _pkp /\
    to_uint (pkp{2}, skp{2}, randomnessp{2}).`2 = _skp /\
    to_uint (pkp{2}, skp{2}, randomnessp{2}).`3 = _randomnessp /\
    Glob.mem{1} = mem /\
    to_uint G.randomnessp{1} = _randomnessp /\
    valid_range W8 mem _pkp (384 * 3 + 32) /\
    valid_range W8 mem _skp (384 * 3) /\
    signed_bound768_cxq a0{2} 0 768 2 /\
    signed_bound768_cxq a1{2} 0 768 2 /\
    signed_bound768_cxq a2{2} 0 768 2 /\
    signed_bound768_cxq skpv{2} 0 768 2 /\ signed_bound768_cxq e{2} 0 768 2)) /\
  signed_bound_cxq poly0{2} 0 256 2 /\
  lift_array256 poly0{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector /\
   ={a1,skpv}
    ==> 
 ={a1,poly1,skpv}).
+ by smt(). 
+ by smt(). 
+ by ecall {2} (innerprod_corr (invnttv (lift_vector a1{2})) (invnttv (lift_vector skpv{2})));auto => />;smt(NTT_Fq.NTT_Fq.nttvK). 
+ inline {1} 1. 
  wp; call(_: true); 1: by sim.
  wp; call(_: true); 1: by sim.
  by auto => />. 
(*****)
seq 0 2 : (#pre /\
    signed_bound_cxq poly2{2} 0 256 2 /\ lift_array256 poly2{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a2{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector).
    conseq => />.
transitivity {2} {poly2 <@ Aux.inner_product(a2,skpv); } 
    ((((spkp{2} = pkp{2} /\
     sskp{2} = skp{2} /\
     Glob.mem{2} = mem /\
     to_uint (pkp{2}, skp{2}, randomnessp{2}).`1 = _pkp /\
     to_uint (pkp{2}, skp{2}, randomnessp{2}).`2 = _skp /\
     to_uint (pkp{2}, skp{2}, randomnessp{2}).`3 = _randomnessp /\
     Glob.mem{1} = mem /\
     to_uint G.randomnessp{1} = _randomnessp /\
     valid_range W8 mem _pkp (384 * 3 + 32) /\
     valid_range W8 mem _skp (384 * 3) /\
     rho{1} = publicseed{2} /\
     sig{1} = noiseseed{2} /\
     a{1} = lift_matrix (a0{2}, a1{2}, a2{2}) /\
     signed_bound768_cxq a0{2} 0 768 2 /\
     signed_bound768_cxq a1{2} 0 768 2 /\
     signed_bound768_cxq a2{2} 0 768 2 /\
     s{1} = lift_vector skpv{2} /\
     e{1} = lift_vector e{2} /\
     signed_bound768_cxq skpv{2} 0 768 2 /\ signed_bound768_cxq e{2} 0 768 2 /\ s{1} = nttv _s1) /\
    e{1} = nttv _e1) /\
   signed_bound_cxq poly0{2} 0 256 2 /\
   lift_array256 poly0{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector) /\
  signed_bound_cxq poly1{2} 0 256 2 /\
  lift_array256 poly1{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a1{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector 
    ==> 
  signed_bound_cxq poly2{2} 0 256 2 /\
  lift_array256 poly2{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a2{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector)
 
   ((((spkp{2} = pkp{2} /\
     sskp{2} = skp{2} /\
     Glob.mem{2} = mem /\
     to_uint (pkp{2}, skp{2}, randomnessp{2}).`1 = _pkp /\
     to_uint (pkp{2}, skp{2}, randomnessp{2}).`2 = _skp /\
     to_uint (pkp{2}, skp{2}, randomnessp{2}).`3 = _randomnessp /\
     Glob.mem{1} = mem /\
     to_uint G.randomnessp{1} = _randomnessp /\
     valid_range W8 mem _pkp (384 * 3 + 32) /\
     valid_range W8 mem _skp (384 * 3) /\
     signed_bound768_cxq a0{2} 0 768 2 /\
     signed_bound768_cxq a1{2} 0 768 2 /\
     signed_bound768_cxq a2{2} 0 768 2 /\
     signed_bound768_cxq skpv{2} 0 768 2 /\ signed_bound768_cxq e{2} 0 768 2)) /\
   signed_bound_cxq poly0{2} 0 256 2 /\
   lift_array256 poly0{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector) /\
  signed_bound_cxq poly1{2} 0 256 2 /\
  lift_array256 poly1{2} = ntt ((Matrix_.Vector.dotp (invnttv (lift_vector a1{2})) (invnttv (lift_vector skpv{2}))))%Matrix_.Vector /\
   ={a2,skpv}
    ==> 
 ={a2,poly2,skpv}).
+ by smt(). 
+ by smt(). 
+ by ecall {2} (innerprod_corr (invnttv (lift_vector a2{2})) (invnttv (lift_vector skpv{2})));auto => />;smt(NTT_Fq.NTT_Fq.nttvK). 
+ inline {1} 1. 
  wp; call(_: true); 1: by sim.
  wp; call(_: true); 1: by sim.
  by auto => />. 
print polyvec_frompolys_corr.
admit. (* almost there *)
admit. (* just storing in memory *)
qed.

lemma kyber_correct_enc mem _coinsp _msgp _ctp : 
   equiv [ Kyber(G,XOF,PRF,H).enc ~ M.indcpa_enc_jazz : 
     valid_range W8 mem _coinsp 32 /\
     valid_range W8 mem _msgp 32 /\
     valid_range W8 mem _ctp (3*320+128) /\
     Glob.mem{1} = mem /\ to_uint coinsp{2} = _coinsp /\ to_uint msgp{2} = _msgp /\ to_uint ctp{2} = _ctp /\
     PRF.key{1} = load_array32 mem _coinsp /\
     m{1} = load_array32 mem _msgp
       ==> 
     let (c1,c2) = res{1} in
     c1.[0] = load_array320 Glob.mem{2} _ctp /\
     c1.[1] = load_array320 Glob.mem{2} (_ctp + 320) /\
     c1.[2] = load_array320 Glob.mem{2} (_ctp + 640) /\
     c2 = load_array128 Glob.mem{2} (_ctp + 960)
].
proc.
swap {1} 6 -5; sp 1 0.
swap {2} 8 -7.
swap {2} [17..18] -15.
seq 0 3 : (#pre /\ PRF.key{1} = noiseseed{2}).  admit. (* easy todo *)
swap {1} 5 -4.
swap {1} [7..8] -5.
swap {2} 8 -7.
swap {2} 16 -14.
seq 3 2 : (#pre /\ that{1} = lift_vector pkpv{2}). (* add bounds *)
admit. (* easy todo *)
swap {2} 11 -10.
swap {2} [15..17] -13.
seq 0 4 : (#pre /\ rho{1} = publicseed{2}). 
admit. (* easy todo *)
swap {1} [6..7] -4.
swap {2} [15..16] -11. 
seq 3 5 : (#pre /\ aT{1} = lift_matrix (at0{2},at1{2},at2{2})). (* add bounds *)
inline M.gen_matrix. (* Need to define XOF such that this works. *)
admit. (* To Do: HUGE but same as kg*)
swap {1} 12 -11.
swap {2} 4 -3.
swap {2} 11 -9.
seq 1 2 : (#pre /\ mp{1} = lift_array256 k{2}). (* add bounds *)
admit. (* easy todo *)
swap {1} [3..6] -2.
swap {2} [4..7] -3.
swap {2} [10..16] -5.
seq 4 11 : (#pre /\ rv{1} = lift_vector sp_0{2} /\ _N{1} = 3). (* add bounds *)
admit. (* To Do: Define PRF so that this works. same as kg *)
swap {1} 2 -1.
swap {1} [3..4] -1.
swap {2} 2 -1.
swap {2} [6..12] -4.
seq 3 8 : (#pre /\ e1{1} = lift_vector ep{2} /\ _N{1} = 6). (* add bounds *)
admit. (* To Do: Define PRF so that this works. same as kg *)
swap {1} 2 -1.
swap {2} 2 -1.
swap {2} [5..6] -3.
seq 1 3 : (#pre /\ e2{1} = lift_array256 epp{2}). (* add bounds *)
admit. (* To Do: Define PRF so that this works. same as kg *)
swap {1} [2..4] -1.
swap {2} [4..16] -1.
seq 3 15 : (rhat{1} = lift_vector sp_0{2} /\ u{1} = lift_vector bp{2} /\ v{1} = lift_array256 v{2}).  (* To Do: specify algebraic part *)
admit. (*  already done. Recover it *)
admit. (* just storing in memory *)
qed.

lemma kyber_correct_dec mem _msgp _ctp : 
   equiv [ Kyber(G,XOF,PRF,H).dec ~ M.indcpa_dec_jazz : 
     valid_range W8 mem _msgp 32 /\
     valid_range W8 mem _ctp (3*320+128) /\
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
seq 3 2 : (#pre /\ u{1} = lift_vector bp{2}). (* add bounds *)
admit. (*easy to do *)
swap {1} [2..3] -1.
swap {2} [4..6] -3.
seq 2 3 : (#pre /\ v{1} = lift_array256 v{2}). (* add bounds *)
admit. (*easy to do *)
swap {2} 2 -1.
swap {2} 4 -2.
seq 3 2 : (#pre /\ s{1} = lift_vector skpv{2}). (* add bounds *)
admit. (* easy to do *)
seq 1 7 : (mp{1} = lift_array256 mp{2}).(* To Do: specify algebraic part *)
admit. (*  already done. Recover it *)
admit. (* easy to do *)
qed.
