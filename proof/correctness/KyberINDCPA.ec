require import AllCore.
from Jasmin require import JModel.
require import Fq Kyber KyberPoly KyberPolyVec.
require import Array3 Array32 Array64 Array128 Array168 Array256 Array768.

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

(* Won't prove we only touch passed in regions *)
op valid_ptr(p : address, l : int) = 0 <= p /\ 0 <= l /\ p + l < W64.modulus.
op valid_disj_reg(p1 : address, l1 : int, p2 : address, l2 : int) =
      valid_ptr p1 l1 => valid_ptr p2 l2 => ((p1 + l1) <= p2  || (p2 + l2) <= p1).

(* We model G exactly as the implementation does it *)
lemma kyber_correct_kg mem _pkp _skp _randomnessp : 
   equiv [ Kyber(G,XOF,PRF,H).kg ~ M.indcpa_keypair_jazz : 
       Glob.mem{2} = mem /\ to_uint pkp{2} = _pkp /\ to_uint skp{2} = _skp /\ to_uint randomnessp{2} = _randomnessp /\
       Glob.mem{1} = mem /\ to_uint G.randomnessp{1} = _randomnessp /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3)
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
    signed_bound_cxq poly0{2} 0 256 2 /\ lift_array256 poly0{2} = ntt ((dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2}))))).
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
   valid_disj_reg _pkp (384*3+32) _skp (384*3) /\
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
  lift_array256 poly0{2} = ntt ((dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2})))))
 
   ((spkp{2} = pkp{2} /\
   sskp{2} = skp{2} /\
   Glob.mem{2} = mem /\
   to_uint (pkp{2}, skp{2}, randomnessp{2}).`1 = _pkp /\
   to_uint (pkp{2}, skp{2}, randomnessp{2}).`2 = _skp /\
   to_uint (pkp{2}, skp{2}, randomnessp{2}).`3 = _randomnessp /\
   Glob.mem{1} = mem /\
   to_uint G.randomnessp{1} = _randomnessp /\
   valid_disj_reg _pkp (384*3+32) _skp (384*3) /\
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
    signed_bound_cxq poly1{2} 0 256 2 /\ lift_array256 poly1{2} = ntt ((dotp (invnttv (lift_vector a1{2})) (invnttv (lift_vector skpv{2}))))).
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
    valid_disj_reg _pkp (384*3+32) _skp (384*3) /\
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
  lift_array256 poly0{2} = ntt ((dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2})))) 
    ==> 
  signed_bound_cxq poly1{2} 0 256 2 /\
  lift_array256 poly1{2} = ntt ((dotp (invnttv (lift_vector a1{2})) (invnttv (lift_vector skpv{2})))))
 
   (((spkp{2} = pkp{2} /\
    sskp{2} = skp{2} /\
    Glob.mem{2} = mem /\
    to_uint (pkp{2}, skp{2}, randomnessp{2}).`1 = _pkp /\
    to_uint (pkp{2}, skp{2}, randomnessp{2}).`2 = _skp /\
    to_uint (pkp{2}, skp{2}, randomnessp{2}).`3 = _randomnessp /\
    Glob.mem{1} = mem /\
    to_uint G.randomnessp{1} = _randomnessp /\
    valid_disj_reg _pkp (384*3+32) _skp (384*3) /\
    signed_bound768_cxq a0{2} 0 768 2 /\
    signed_bound768_cxq a1{2} 0 768 2 /\
    signed_bound768_cxq a2{2} 0 768 2 /\
    signed_bound768_cxq skpv{2} 0 768 2 /\ signed_bound768_cxq e{2} 0 768 2)) /\
  signed_bound_cxq poly0{2} 0 256 2 /\
  lift_array256 poly0{2} = ntt ((dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2})))) /\
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
    signed_bound_cxq poly2{2} 0 256 2 /\ lift_array256 poly2{2} = ntt ((dotp (invnttv (lift_vector a2{2})) (invnttv (lift_vector skpv{2}))))).
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
     valid_disj_reg _pkp (384*3+32) _skp (384*3) /\
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
   lift_array256 poly0{2} = ntt ((dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2}))))) /\
  signed_bound_cxq poly1{2} 0 256 2 /\
  lift_array256 poly1{2} = ntt ((dotp (invnttv (lift_vector a1{2})) (invnttv (lift_vector skpv{2})))) 
    ==> 
  signed_bound_cxq poly2{2} 0 256 2 /\
  lift_array256 poly2{2} = ntt ((dotp (invnttv (lift_vector a2{2})) (invnttv (lift_vector skpv{2})))))
 
   ((((spkp{2} = pkp{2} /\
     sskp{2} = skp{2} /\
     Glob.mem{2} = mem /\
     to_uint (pkp{2}, skp{2}, randomnessp{2}).`1 = _pkp /\
     to_uint (pkp{2}, skp{2}, randomnessp{2}).`2 = _skp /\
     to_uint (pkp{2}, skp{2}, randomnessp{2}).`3 = _randomnessp /\
     Glob.mem{1} = mem /\
     to_uint G.randomnessp{1} = _randomnessp /\
     valid_disj_reg _pkp (384*3+32) _skp (384*3) /\
     signed_bound768_cxq a0{2} 0 768 2 /\
     signed_bound768_cxq a1{2} 0 768 2 /\
     signed_bound768_cxq a2{2} 0 768 2 /\
     signed_bound768_cxq skpv{2} 0 768 2 /\ signed_bound768_cxq e{2} 0 768 2)) /\
   signed_bound_cxq poly0{2} 0 256 2 /\
   lift_array256 poly0{2} = ntt ((dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2}))))) /\
  signed_bound_cxq poly1{2} 0 256 2 /\
  lift_array256 poly1{2} = ntt ((dotp (invnttv (lift_vector a1{2})) (invnttv (lift_vector skpv{2})))) /\
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
(*********************************)
seq 0 1 : (#pre /\
             signed_bound768_cxq pkpv{2} 0 768 2 /\
             nttv (invnttm a{1} *^ invnttv s{1}) = lift_vector pkpv{2}).
ecall {2} (polyvec_frompolys_corr poly0{2} poly1{2} poly2{2}
         (ntt (dotp (invnttv (lift_vector a0{2})) (invnttv (lift_vector skpv{2}))))
         (ntt (dotp (invnttv (lift_vector a1{2})) (invnttv (lift_vector skpv{2}))))
         (ntt (dotp (invnttv (lift_vector a2{2})) (invnttv (lift_vector skpv{2})))) 2).
auto => /> &1 &2.
move => *.
split; first by smt().
move => 8? H23 H24 H25.

rewrite /lift_vector /lift_matrix /lift_polyvec /nttv /invnttm /invnttv /mapv /mapm /kvec => />.
rewrite eq_vectorP /kvec =>  i ib.
rewrite !offunvE /kvec => />.
rewrite  !offunvK /vclamp /kvec => />.
rewrite  !offunmK /mclamp /kvec ib => />.
case (i = 0).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite !initiE => />.
rewrite (H23 k kb) /=.
do congr.
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
rewrite addrC (H24 k kb) /=.
do congr.
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
do congr.
rewrite /lift_vector /lift_polyvec /=.
rewrite /kvec /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunmE //=.
rewrite /kvec /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunvE //=.
by rewrite  !offunvK /vclamp /kvec => />.
smt().


seq 0 1 : (#{/~pkpv{2}}pre /\
    signed_bound768_cxq pkpv{2} 0 768 4 /\ nttv (invnttm a{1} *^ invnttv s{1} + invnttv e{1}) = lift_vector pkpv{2}).
ecall {2} (polyvec_add_corr (lift_array768 pkpv{2}) (lift_array768 e{2}) 2 2).
auto => /> 18? H17 result H18 H19.
(***************************************)
rewrite nttv_add.
rewrite H17 NTT_Fq.NTT_Fq.nttvK /lift_vector /nttv /lift_polyvec //=. 
rewrite !eq_vectorP  //=  => i ib.
rewrite !offunvE //=.
rewrite /(Poly.(&+)) map2E //=.
apply Array256.ext_eq => x xb. 
rewrite !initiE //=.
case (i = 0).
move => -> //=.
rewrite !initiE => //=.
move : (H19 x _); first by smt().
by rewrite /lift_array768 //= !mapiE //=; smt(). 

move => *.
case (i = 1).
move => -> //=.
rewrite !initiE => //=.
move : (H19 (256 + x) _); first by smt().
by rewrite /lift_array768 //= !mapiE //=; smt(). 

move => *.
case (i = 2).
move => -> //=.
rewrite !initiE => //=.
move : (H19 (512 + x) _); first by smt().
by rewrite /lift_array768 //= !mapiE //=; smt(). 

by smt().

(***************************************)
ecall {2} (polyvec_reduce_corr (lift_array768 pkpv{2})).
auto => /> &1 &2 16? H17 result H18 H19.
split; last by rewrite /signed_bound768_cxq;smt(@Array768).
move : H17 H18; rewrite /ntt_mmul /nttv /invnttv /invnttm /mapm /mapv  /lift_vector /lift_matrix /lift_array768 /lift_polyvec  !mapE.
rewrite (Array768.tP 
  ((Array768.init (fun (i : int) => (fun (x : W16.t) => (inFq (to_sint x))) pkpv{2}.[i])))
  ((Array768.init (fun (i : int) => (fun (x : W16.t) => (inFq (to_sint x))) result.[i])))).
rewrite !eq_vectorP  //=  => H17 H18 i ib.
rewrite !offunvE //= /kvec //=.
rewrite/= !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunvE //= /kvec //=.

case  (i = 0).
move => i0 //=.
move : (H17 i _) => //.
rewrite !offunvE //= /kvec i0 //=.
have -> : ((init (fun (i1 : int) => inFq (to_sint result.[i1])))%Array256 =
           (Array256.init (fun (i1 : int) => inFq (to_sint pkpv{2}.[i1])))).
+ apply Array256.ext_eq => k kb. 
  by move : (H18 k _); 1:smt(); rewrite !initiE //= /#.
move => <-.
rewrite /( *^).
rewrite  !offunmK /mclamp /kvec /=.
rewrite  !offunvK /vclamp /kvec /=.
rewrite !offunvE //=.
rewrite !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunmE //=.
rewrite !offunvE //=.
rewrite !NTT_Fq.NTT_Fq.add_comm_ntt.
have mul_comm_invntt : forall a b, ntt (invntt a &* invntt b) = basemul a b by smt(NTT_Fq.NTT_Fq.mul_comm_ntt NTT_Fq.NTT_Fq.nttK).
rewrite !mul_comm_invntt.
by smt(@NTT_Fq).

move => *.
case  (i = 1).
move => i1 //=.
move : (H17 i _) => //.
rewrite !offunvE //= /kvec i1 //=.
have -> : ((init (fun (i1 : int) => inFq (to_sint result.[256+i1])))%Array256 =
           (Array256.init (fun (i1 : int) => inFq (to_sint pkpv{2}.[256+i1])))).
+ apply Array256.ext_eq => k kb. 
  by move : (H18 (k+ 256) _); 1:smt(); rewrite !initiE //= /#.
move => <-.
rewrite /( *^).
rewrite  !offunmK /mclamp /kvec /=.
rewrite  !offunvK /vclamp /kvec /=.
rewrite !offunvE //=.
rewrite !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunmE //=.
rewrite !offunvE //=.
rewrite !NTT_Fq.NTT_Fq.add_comm_ntt.
have mul_comm_invntt : forall a b, ntt (invntt a &* invntt b) = basemul a b by smt(NTT_Fq.NTT_Fq.mul_comm_ntt NTT_Fq.NTT_Fq.nttK).
rewrite !mul_comm_invntt.
by smt(@NTT_Fq).

move => *.
case  (i = 2).
move => i1 //=.
move : (H17 i _) => //.
rewrite !offunvE //= /kvec i1 //=.
have -> : ((init (fun (i1 : int) => inFq (to_sint result.[512+i1])))%Array256 =
           (Array256.init (fun (i1 : int) => inFq (to_sint pkpv{2}.[512+i1])))).
+ apply Array256.ext_eq => k kb. 
  by move : (H18 (k+ 512) _); 1:smt(); rewrite !initiE //= /#.
move => <-.
rewrite /( *^).
rewrite  !offunmK /mclamp /kvec /=.
rewrite  !offunvK /vclamp /kvec /=.
rewrite !offunvE //=.
rewrite !Big.BAdd.big_consT /= !Big.BAdd.big_nil => />. 
rewrite !offunmE //=.
rewrite !offunvE //=.
rewrite !NTT_Fq.NTT_Fq.add_comm_ntt.
have mul_comm_invntt : forall a b, ntt (invntt a &* invntt b) = basemul a b by smt(NTT_Fq.NTT_Fq.mul_comm_ntt NTT_Fq.NTT_Fq.nttK).
rewrite !mul_comm_invntt.
by smt(@NTT_Fq).
smt().
admit. (* just storing in memory *)
qed.

lemma kyber_correct_enc mem _coinsp _msgp _ctp _pkp : 
   equiv [ Kyber(G,XOF,PRF,H).enc ~ M.indcpa_enc_jazz : 
     valid_ptr _coinsp 32 /\
     valid_ptr _pkp (384*3 + 32) /\
     valid_ptr _msgp 32 /\
     valid_ptr _ctp (3*320+128) /\
     Glob.mem{2} = mem /\ to_uint coinsp{2} = _coinsp /\ to_uint msgp{2} = _msgp /\ to_uint ctp{2} = _ctp /\ to_uint pkp{2} = _pkp /\
     PRF.key{1} = load_array32 mem _coinsp /\
     m{1} = load_array32 mem _msgp /\
     pk{1}.`1.[0] = load_array384 mem _pkp /\
     pk{1}.`1.[2] = load_array384 mem (_pkp + 384) /\
     pk{1}.`1.[3] = load_array384 mem (_pkp + 2*384) /\
     pk{1}.`2 = load_array32 mem (_pkp + 3*384)
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
seq 0 3 : (#pre /\ PRF.key{1} = noiseseed{2}).
while {2} (valid_ptr _coinsp 32  /\ _coinsp = to_uint coinsp{2} /\  
           mem = Glob.mem{2} /\ PRF.key{1} = load_array32 mem _coinsp /\ 
           0 <= to_uint i{2} <= 32 /\ 
           forall k, 0 <= k < to_uint i{2} => PRF.key{1}.[k] = noiseseed{2}.[k]) (32 - to_uint i{2}).
+ move => &m z; rewrite /load_array32 //; auto => /> &hr ??? ? H ?. 
    do split; 1,2: by smt(@W64).
    + move => k0 kb0 kb1. rewrite /load_array32 initiE //=; 1:  smt(@W64).
      rewrite to_uintD_small; 1: smt(@W64).
      case (0<= k0 < to_uint i{hr}). 
      + move => *; rewrite set_neqiE; 1,2: smt(@W64). 
        move : (H k0 _); 1: smt(). 
        by rewrite initiE => //; smt().
      + move => *; have -> : k0 = to_uint i{hr}; 1: smt(@W64).
        rewrite get_setE /=; 1,2: smt(@W64). 
        by rewrite to_uintD_small; smt(@W64).
    + auto => />; move => *; split; 1: smt(). 
      move => iR noise; split; 1: smt(@W64). 
      rewrite ultE /load_array32 /= => 3?.
      have -> : to_uint iR = 32; 1: smt(@W64).
      by move => H; rewrite tP => i ib; smt().
swap {1} 5 -4.
swap {1} [7..8] -5.
swap {2} 8 -7.
swap {2} 16 -14.
seq 3 2 : (#pre /\ that{1} = lift_vector pkpv{2} /\
    signed_bound768_cxq pkpv{2} 0 768 2).
admit. (* easy todo *)
swap {2} 11 -10.
swap {2} [15..17] -13.
seq 0 4 : (#{~pkp{2}}pre /\ rho{1} = publicseed{2}). 
while {2} (valid_ptr _pkp (3*384 + 32)  /\ _pkp + 1152 + to_uint i{2} = to_uint pkp{2} /\ mem = Glob.mem{2} /\ pk{1}.`2 = load_array32 mem (_pkp + 3*384) /\ 0 <= to_uint i{2} <= 32 /\ forall k, 0 <= k < to_uint i{2} => pk{1}.`2.[k] = publicseed{2}.[k]) (32 - to_uint i{2}).
+ move => &m z; auto => /> &hr; rewrite /load_array32 ultE Array32.tP => ?? ppp HH ?? H ?. 
  do split. 
    rewrite !to_uintD_small; smt(@W64). 
    rewrite !to_uintD_small; smt(@W64).  
    rewrite !to_uintD_small; smt(@W64).
    move => k ?.
    rewrite !to_uintD_small;1: smt(@W64).
    move => ?.
    case (0 <= k < to_uint i{hr}); smt(@Array32 @W64).
    rewrite !to_uintD_small; smt(@W64).
    auto => /> &1 &2 12?. 
    do split. 
    rewrite !to_uintD_small; smt(@W64).
     smt().
    move => ir pkr pseed; rewrite ultE /load_array32 Array32.tP.
    do split. 
     smt(@W64).
     move => ????H i ?.
     rewrite initiE //= -(H i _) //=; 1: smt(@W64). 
    by rewrite initiE //=.

swap {1} [6..7] -4.
swap {2} [15..16] -11. 
seq 3 5 : (#pre /\ aT{1} = lift_matrix (at0{2},at1{2},at2{2}) /\
            signed_bound768_cxq at0{2} 0 768 2 /\
            signed_bound768_cxq at1{2} 0 768 2 /\
            signed_bound768_cxq at2{2} 0 768 2).
inline M.__gen_matrix. (* Need to define XOF such that this works. *)
admit. (* To Do: HUGE but same as kg*)
swap {1} 12 -11.
swap {2} 4 -3.
swap {2} 11 -9.
seq 1 2 : (#pre /\ decompress_poly 1 mp{1} = lift_array256 k{2}  /\
            signed_bound_cxq k{2} 0 256 1). 
admit. (* easy todo *)
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
