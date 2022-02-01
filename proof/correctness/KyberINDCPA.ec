require import AllCore.
from Jasmin require import JModel.
require import Fq Kyber KyberPoly KyberPolyVec KyberAlgebra.
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
seq 1 1 : #pre.
exists* (lift_array768 skpv{2}).
elim* => s2.
call {2} (polyvec_ntt_corr s2).
auto => />. 
move => *. split. smt().
conseq => />.

(*
seq 3 : #pre; first by auto => />.
(******)
seq 2 : (#pre /\
   lift_vector a0 = row_i (ntt_matrix (H sd)) 0 /\
   lift_vector a1 = row_i (ntt_matrix (H sd)) 1 /\
   lift_vector a2 = row_i (ntt_matrix (H sd)) 2 /\
   signed_bound768_cxq a0 0 768 2 /\
   signed_bound768_cxq a1 0 768 2 /\
   signed_bound768_cxq a2 0 768 2).
ecall (gen_matrix sd).
auto => /> &hr ??? -> *.
rewrite /row_i /lift_vector /lift_matrix /ntt_matrix /lift_polyvec => />.
do split.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
(******)
seq 1 : (#{/~skpv}pre /\
   lift_vector skpv = polyvec_ntt s_ /\
   signed_bound768_cxq skpv 0 768 2
   ).
ecall(polyvec_ntt_correct (lift_array768 skpv)).
skip => /> &hr ?.
rewrite /row_i /lift_vector /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split; last  by smt(@Array768). 
rewrite eq_vectorP  => /> *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H13 =>  />.
case (i = 0).
move => -> />.
rewrite -H9 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />.
rewrite  mapiE; first by smt().
by auto => />.
move => *.
case (i = 1).
move => -> />.
rewrite -H10 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by auto => />.
case (i = 2).
move => -> />.
rewrite -H11 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by auto => />.
smt().
(******)
seq 1 : (#{/~e}pre /\
   lift_vector e = polyvec_ntt e_ /\
   signed_bound768_cxq e 0 768 2
   ).
ecall(polyvec_ntt_correct (lift_array768 e)).
skip => /> &hr ?.
rewrite /row_i /lift_vector /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split;  last  by smt(@Array768). 
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H14 =>  />.
case (i = 0).
move => -> />.
rewrite -H10 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />.
rewrite  mapiE; first by smt().
by auto => />.
move => *.
case (i = 1).
move => -> />.
rewrite -H11 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by auto => />.
case (i = 2).
move => -> />.
rewrite -H12 => />.
congr. 
apply Array256.ext_eq => x xb.
rewrite !initiE => />. 
rewrite nth_mkseq => />. 
rewrite  mapiE; first by smt().
by auto => />.
smt().
(*****)
seq 1 : (#pre /\
    signed_bound_cxq poly0 0 256 2 /\ lift_array256 poly0 = ntt ((row_i (H sd) 0) `<*>` s_)).
call (innerprod_corr (row_i (H sd) 0) s_ H).
auto => /> &hr.
rewrite  /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split. 
(*****)
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H10.
case (i = 0).
move => iis0.
apply Array256.ext_eq => x xb.
move : H0.
rewrite iis0 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H sd))%MLWEPKE.H_MLWE.[0, 0]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H sd))%MLWEPKE.H_MLWE).[0, i0])).[0]).
by rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H0.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 1).
move => iis1.
apply Array256.ext_eq => x xb.
move : H0.
rewrite iis1 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H sd))%MLWEPKE.H_MLWE.[0, 1]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H sd))%MLWEPKE.H_MLWE).[0, i0])).[1]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H0.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 2).
move => iis2.
apply Array256.ext_eq => x xb.
move : H0.
rewrite iis2 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H sd))%MLWEPKE.H_MLWE.[0, 2]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H sd))%MLWEPKE.H_MLWE).[0, i0])).[2]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H0.
rewrite offunvE => />.
by rewrite initiE.
smt().
(*****)
by rewrite H6.
(****)
(*****)
seq 1 : (#pre /\
    signed_bound_cxq poly1 0 256 2 /\ lift_array256 poly1 = ntt ((row_i (H sd) 1) `<*>` s_)).
call (innerprod_corr (row_i (H sd) 1) s_ H).
auto => /> &hr.
rewrite  /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split. 
(*****)
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H12.
case (i = 0).
move => iis0.
apply Array256.ext_eq => x xb.
move : H1.
rewrite iis0 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H sd))%MLWEPKE.H_MLWE.[1, 0]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H sd))%MLWEPKE.H_MLWE).[1, i0])).[0]).
by rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H1.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 1).
move => iis1.
apply Array256.ext_eq => x xb.
move : H1.
rewrite iis1 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H sd))%MLWEPKE.H_MLWE.[1, 1]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H sd))%MLWEPKE.H_MLWE).[1, i0])).[1]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H1.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 2).
move => iis2.
apply Array256.ext_eq => x xb.
move : H1.
rewrite iis2 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H sd))%MLWEPKE.H_MLWE.[1, 2]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H sd))%MLWEPKE.H_MLWE).[1, i0])).[2]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H1.
rewrite offunvE => />.
by rewrite initiE.
smt().
(*****)
by rewrite H6.
(****)
(*****)
seq 1 : (#pre /\
    signed_bound_cxq poly2 0 256 2 /\ lift_array256 poly2 = ntt ((row_i (H sd) 2) `<*>` s_)).
call (innerprod_corr (row_i (H sd) 2) s_ H).
auto => /> &hr.
rewrite  /lift_polyvec /polyvec_ntt /pos_bound768_cxq  /signed_bound768_cxq /lift_array768 /sub => /> *.
split. 
(*****)
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
rewrite offunvK /vclamp H14.
case (i = 0).
move => iis0.
apply Array256.ext_eq => x xb.
move : H2.
rewrite iis0 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H sd))%MLWEPKE.H_MLWE.[2, 0]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H sd))%MLWEPKE.H_MLWE).[2, i0])).[0]).
by rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H2.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 1).
move => iis1.
apply Array256.ext_eq => x xb.
move : H2.
rewrite iis1 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H sd))%MLWEPKE.H_MLWE.[2, 1]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H sd))%MLWEPKE.H_MLWE).[2, i0])).[1]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H2.
rewrite offunvE => />.
by rewrite initiE.
move => *.
case (i = 2).
move => iis2.
apply Array256.ext_eq => x xb.
move : H2.
rewrite iis2 /row_i => /> *.
rewrite !initiE => />. 
rewrite (_: (ntt ((H sd))%MLWEPKE.H_MLWE.[2, 2]) = 
   (offunv (fun (i0 : int) => (ntt_matrix ((H sd))%MLWEPKE.H_MLWE).[2, i0])).[2]).
rewrite /ntt_matrix offunvE //= offunmE  => />.
rewrite -H2.
rewrite offunvE => />.
by rewrite initiE.
smt().
(*****)
by rewrite H6.
(*********************************)
seq 1 : (#pre /\
             signed_bound768_cxq pkpv 0 768 2 /\
             polyvec_ntt (H(sd) *^ s_) = lift_vector pkpv).
ecall (polyvec_frompolys_corr_h poly0 poly1 poly2
         (ntt (row_i ((H sd))%MLWEPKE.H_MLWE 0 `<*>` s_))
         (ntt (row_i ((H sd))%MLWEPKE.H_MLWE 1 `<*>` s_))
         (ntt (row_i ((H sd))%MLWEPKE.H_MLWE 2 `<*>` s_)) 2  ).
auto => /> &hr.
move => *.
split; first by smt().
rewrite /(`<*>`); move => *.

rewrite /lift_vector /polyvec_ntt /lift_polyvec => />.
rewrite eq_vectorP  =>  *.
rewrite !offunvE => />.
case (i = 0).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite initiE => />.
rewrite (H23 k kb).
rewrite /row_i => />.
do congr.
rewrite  /( *^) offunvK /vclamp. 
rewrite /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=. 
by rewrite !offunvE => />.
case (i = 1).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite initiE => />.
rewrite  (_: 256 + k = k + 256); first by smt().
rewrite (H24 k kb) =>/> *.
rewrite /row_i => />.
do congr.
rewrite  /( *^) offunvK /vclamp. 
rewrite /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=. 
by rewrite !offunvE => />.
case (i = 2).
move => -> />. 
apply Array256.ext_eq => k kb.
rewrite initiE => />.
rewrite  (_: 512 + k = k + 512); first by smt().
rewrite (H25 k kb) =>/> *.
rewrite /row_i => />.
do congr.
rewrite  /( *^) offunvK /vclamp. 
rewrite /dotp /= !Big.BAdd.big_consT /= !Big.BAdd.big_nil /=. 
by rewrite !offunvE => />.
smt().
seq 1 : (#{/~pkpv}pre /\
    signed_bound768_cxq pkpv 0 768 4 /\ polyvec_ntt ((H sd)%MLWEPKE.H_MLWE *^ s_ + e_) = lift_vector pkpv).
exists *(lift_array768 pkpv) ,(lift_array768 e). elim * => _p _e.
call (polyvec_add_corr _p _e 2 2).
auto => /> *.
(***************************************)
rewrite polyvec_ntt_add.
rewrite H17 -H8 /lift_vector /polyvec_ntt /lift_polyvec //=.
rewrite !eq_vectorP  //=  => *.
rewrite !offunvE //=.
rewrite /(Poly.(+)) map2E //=.
apply Array256.ext_eq => x xb. 
rewrite !initiE //=.
case (i = 0).
move => -> //=.
rewrite !initiE => //=.
move : (H19 x _); first by smt().
rewrite /lift_array768 //= !mapiE //=; first  2 by smt().
rewrite  -ZModField.inzmodD.
by move => ->.
case (i = 1).
move => -> //=.
rewrite !initiE => //=.
move : (H19 (256 + x) _); first by smt().
rewrite /lift_array768 //= !mapiE //=; first  2 by smt().
rewrite  -ZModField.inzmodD.
by move => ->.
case (i = 2).
move => -> //=.
rewrite !initiE => //=.
move : (H19 (512 + x) _); first by smt().
rewrite /lift_array768 //= !mapiE //=; first  2 by smt().
rewrite  -ZModField.inzmodD.
by move => ->.
by smt().
(***************************************)
ecall (polyvec_reduce_corr (lift_array768 pkpv)).
auto => /> *.
split; last by rewrite /signed_bound768_cxq;smt(@Array768).
move : H17 H18; rewrite /polyvec_ntt  /lift_vector /lift_array768 /lift_polyvec  !mapE.
rewrite (Array768.tP 
  ((Array768.init (fun (i : int) => (fun (x : W16.t) => (ZModField.inzmod (to_sint x))%ZModField) pkpv{hr}.[i])))
  ((Array768.init (fun (i : int) => (fun (x : W16.t) => (ZModField.inzmod (to_sint x))%ZModField) result.[i])))).
rewrite !eq_vectorP  //=  => *.
rewrite (H17 i H20) //.
rewrite !offunvE //=.
apply Array256.ext_eq => k kb.
case  (i = 0).
move => -> //=.
move  : (H18 k _) => //; first by smt().
rewrite !initiE; first 4 by smt().
by move => ->.
move => *.
case  (i = 1).
move => -> //=.
move  : (H18 (256 + k) _) => //; first by smt().
rewrite !initiE; first 4 by smt().
by move => ->.
move => *.
case  (i = 2).
move => -> //=.
move  : (H18 (512 + k) _) => //; first by smt().
rewrite !initiE; first 4 by smt().
by move => ->.
by smt().
qed.
*)
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
