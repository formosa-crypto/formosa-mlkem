require import AllCore IntDiv List.
from Jasmin require import JModel.
require import Array32 Array128 Array768 Array960 Array1088 Array2304.
require import KyberPoly  KyberPolyVec KyberINDCPA.
require import KyberPoly_avx2_proof.
require import KyberPolyvec_avx2_proof.
require import Jkem_avx2 Jkem.

import Kyber.
import KyberSpec.
import KyberPoly.
import KyberPolyVec.
import KyberPolyvecAVX.

equiv sha3equiv :
 Jkem_avx2.M._sha3_512_32 ~ M._sha3512_32 : ={arg} ==> ={res}.
admitted. 

op unpackm(v : 'a Array2304.t) = 
   Array2304.init (fun i =>
      if 0 <= i < 768 
      then (unpackv (subarray768 v 0)).[i]
      else if 768 <= i < 2*768
           then (unpackv (subarray768 v 1)).[i-768]
           else (unpackv (subarray768 v 2)).[i-2*768]).

op packm(v : 'a Array2304.t) = 
   Array2304.init (fun i =>
      if 0 <= i < 768 
      then (packv (subarray768 v 0)).[i]
      else if 768 <= i < 2*768
           then (packv (subarray768 v 1)).[i-768]
           else (packv (subarray768 v 2)).[i-2*768]).


equiv genmatrixequiv b :
  Jkem_avx2.M.__gen_matrix ~  M.__gen_matrix :
    arg{1}.`1 = arg{2}.`1 /\ arg{1}.`2 = b2i b /\ arg{2}.`2 =  W64.of_int (b2i b) ==>
    res{2} = unpackm res{1}.
admitted.

lemma kyber_correct_kg_avx2 mem _pkp _skp _randomnessp : 
   equiv [ Jkem_avx2.M.__indcpa_keypair ~ Kyber(KHS,XOF,KPRF,H).kg_derand : 
       Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp /\ to_uint skp{1} = _skp /\ 
       to_uint randomnessp{1} = _randomnessp /\
       seed{2} = Array32.init(fun i=> loadW8 Glob.mem{1} (to_uint randomnessp{1}  + i)) /\
       valid_ptr (to_uint randomnessp{1}) 32 /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3)
        ==> 
       touches2 Glob.mem{1} mem _pkp (384*3+32) _skp (384*3) /\
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk = load_array1152 Glob.mem{1} _skp /\
         t = load_array1152 Glob.mem{1} _pkp  /\
         rho = load_array32 Glob.mem{1} (_pkp+1152)].
proc*.
transitivity {1} { Jkem.M.__indcpa_keypair(pkp, skp, randomnessp);} 
(={Glob.mem,pkp,skp,randomnessp} /\ 
  Glob.mem{1} = mem /\
    to_uint pkp{1} = _pkp /\
    to_uint skp{1} = _skp /\
    to_uint randomnessp{1} = _randomnessp /\ 
       valid_ptr (to_uint randomnessp{1}) 32 /\
    valid_disj_reg _pkp (384 * 3 + 32) _skp (384 * 3) ==> ={Glob.mem}) 
(   Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp /\ to_uint skp{1} = _skp /\ 
       to_uint randomnessp{1} = _randomnessp /\
       seed{2} = Array32.init(fun i=> loadW8 Glob.mem{1} (to_uint randomnessp{1}  + i)) /\
       valid_ptr (to_uint randomnessp{1}) 32 /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3)
    ==> 
    touches2 Glob.mem{1} mem _pkp (384*3+32) _skp (384*3) /\
    let (pk, sk) = r{2} in
    let (t, rho) = pk in
        sk = load_array1152 Glob.mem{1} _skp /\
        t = load_array1152 Glob.mem{1} _pkp /\ 
        rho = load_array32 Glob.mem{1} (_pkp + 1152)); 1,2: smt(); 
   last by call(kyber_correct_kg mem _pkp _skp _randomnessp); auto => />. 

inline{1} 1; inline {2} 1. sim. 

call KyberPolyvecAVX.polyvec_tobytes_corr.
call KyberPolyvecAVX.polyvec_tobytes_corr.
wp;conseq />.
ecall (KyberPolyvecAVX.polyvec_reduce_corr (lift_array768 pkpv{1})).

have H := KyberPolyvecAVX.polyvec_add2_corr 2 2 _ _ => //.
ecall (H (lift_array768 pkpv{1}) (lift_array768 e{1})); clear H.
unroll for {1} 37.

sp 3 3.

seq 17 17  : (#pre /\ ={publicseed, noiseseed}); 1:  by conseq />; sim;  call( sha3equiv); conseq />; sim. 

seq 1 2 : (#pre /\ a{2} = unpackm aa{1}); 1: by 
   conseq />; call (genmatrixequiv false); auto => />.

swap {1} [11..12] 2.

seq 10 18 : (#pre /\ ={skpv,e}); 1: by admit. (* to do *)

swap {2} [7..8] -5.
seq 2 3 : (#pre /\ a{2} = lift_matrix a{1} /\
            pos_bound2304_cxq a{1} 0 2304 2).
+ inline AuxKyber.__gen_matrix; conseq />.
  seq 6 3 : (a0{1}=a{2}); last by auto => />;  smt(matrix_unlift).
  while (i0{1} = i{2} /\ 0<=i0{1}<=kvec /\ seed0{1}=rho{2} /\ !trans{1} /\
         forall ii jj, 0<=ii<i0{1} => 0<= jj <3 => a0{1}.[ii,jj] = a{2}.[ii,jj]); last  first.
          auto => />; smt(eq_matrixP).
  wp; while (i0{1} = i{2} /\ j{1} = j{2} /\ 0<=i0{1}<kvec /\ 0<=j{1}<=kvec /\ seed0{1}=rho{2} /\ !trans{1} /\
         (forall ii jj, 0<=ii<i0{1} => 0<= jj <3 => a0{1}.[ii,jj] = a{2}.[ii,jj]) /\
         (forall jj, 0 <= jj <j{1} => a0{1}.[i0{1},jj] = a{2}.[i0{1},jj])); last 
            by auto => />  /#.
  wp; call(_: ={XOF.state}); 1: by sim.
  wp; call(_: ={arg} ==> ={XOF.state}); last by auto => /> &1 &2;  smt(offunmK). 
  by sim.
  
swap {2} [5..9]  -2.
swap {1} 1 1.
seq 1 7 : (#pre /\ s{2} = lift_vector skpv{1} /\ e{2} = lift_vector e{1} /\
                signed_bound768_cxq skpv{1} 0 768 1 /\
                signed_bound768_cxq e{1} 0 768 1).
+ inline AuxKyber.sample_noise2_spec; conseq />. 
  seq 8 7 : (noise1{1}=s{2} /\ noise2{1} = e{2}); 1: by sim; auto => />.
  by auto => />;  smt(vector_unlift).

swap {1} 1 2; seq 0 2: #pre; 1: by auto.

seq 11 3 : (#{/~signed_bound768_cxq skpv{1} 0 768 1}
             {~signed_bound768_cxq e{1} 0 768 1}pre /\ 
                t{2} = lift_vector pkpv{1} /\
                pos_bound768_cxq pkpv{1} 0 768 2 /\
                pos_bound768_cxq skpv{1} 0 768 2
                ); last first.

+ while{1} (0<=i{1} <= _aux{1} /\ _aux{1} = 4 /\
            to_uint pkp0{1} = _pkp + 3*384 + i{1} * 8 /\ 
            to_uint skp0{1} = _skp /\ rho{2} = publicseed{1} /\
            valid_disj_reg _pkp (384 * 3 + 32) _skp (384 * 3) /\
            touches2 Glob.mem{1} mem _pkp (384 * 3 + 32) _skp (384 * 3) /\
                sv{2} = load_array1152 Glob.mem{1} _skp /\
                tv{2} = load_array1152 Glob.mem{1} _pkp /\ 
                forall k, 0<=k<i{1}*8 =>
                 rho{2}.[k] = loadW8 Glob.mem{1} (_pkp + 1152 + k)) 
             (4 - i{1}).

+ move => *;
  auto => /> &hr ??; rewrite /loadW8 /storeW8 /valid_disj_reg /valid_ptr /=.
  move  => ppk [#] reg1 reg2 reg3 reg4 reg5 touches2 loaded enter.
  rewrite to_uintD_small /= 1:/#.
  do split; 1..3,8:smt().
  + by rewrite /touches2 /= => a ab1 ab2; rewrite /storeW64 /= /stores /=  !get_set_neqE_s /#.
  + rewrite /load_array1152 Array1152.tP => k kb.
    by rewrite !initiE //= /storeW64 /= /stores /=  !get_set_neqE_s /#.
  + rewrite /load_array1152 Array1152.tP => k kb.
    by rewrite !initiE //=/storeW64 /= /stores /=  !get_set_neqE_s /#.
  move => k kbl kbh.
  case (k <i{hr} * 8).
  + by move => *;rewrite /storeW64 /= /stores /=  !get_set_neqE_s /#.
  move => *.  rewrite /storeW64 /= /stores /=.
  rewrite !get64E !pack8bE // !initiE //= /init8 !initiE 1..8: /#. 
  by smt(get_set_neqE_s get_set_eqE_s).

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
  + rewrite /touches2 /= => a ab1 ab2. 
    have ? := (touches1 (a - to_uint pkp{1}) _); 1: by smt().
    by have ? := (touches0 (a - to_uint skp{1}) _); by smt().
  + rewrite /load_array1152 tP => k kb; rewrite !initiE //=. 
    move : (touches1 (to_uint skp{1} - to_uint pkp{1} + k) _); 1: by smt().
    by have -> ->: to_uint pkp{1} + (to_uint skp{1} - to_uint pkp{1} + k) = to_uint skp{1} + k by ring.
  + by smt().
  
  move => * /=.
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
  do split; 1,2,4: smt(nttvK).
  + by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
  move => ????result0; rewrite /lift_matrix.
  rewrite /lift_array2304 /lift_vector /lift_array256  !tP =>  ?val k kbl kbh.
  rewrite !initiE 1:/# /= kbl kbh /= ; do split; 1,2:smt().
  move : (val k _) => //; rewrite mapiE //= => ->.
  rewrite /ntt_mmul offunvE //= /dotp /kvec /=.
  rewrite !Big.BAdd.big_consT //= !Big.BAdd.big_nil //=. 
  rewrite !offunvE //= !offunvK /vclamp !offunmE //= /kvec /=.
  rewrite !add_comm_ntt !mul_comm_ntt !nttK nttZero. 
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
  do split; 1,2,4: smt(nttvK).
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
  rewrite !add_comm_ntt !mul_comm_ntt !nttK nttZero. 
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
  do split; 1,2,4: smt(nttvK).
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
  rewrite !add_comm_ntt !mul_comm_ntt !nttK nttZero. 
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

lemma kyber_correct_enc_0_avx2 mem _ctp _pkp : 
   equiv [ Jkem_avx2.M.__indcpa_enc_0 ~ Kyber(KHS,XOF,KPRF,H).enc_derand: 
     valid_ptr _pkp (384*3 + 32) /\
     valid_ptr _ctp (3*320+128) /\
     Glob.mem{1} = mem /\ 
     msgp{1} = m{2} /\ 
     to_uint sctp{1} = _ctp /\ 
     to_uint pkp{1} = _pkp /\
     noiseseed{1} = r{2} /\
     pk{2}.`1 = load_array1152 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 3*384)
       ==> 
     touches Glob.mem{1} mem _ctp (3*320+128) /\
     let (c1,c2) = res{2} in
     c1 = load_array960 Glob.mem{1} _ctp /\
     c2 = load_array128 Glob.mem{1} (_ctp + 960)
].
proc*.
transitivity {1} { Jkem.M.__indcpa_enc(sctp,msgp,pkp,noiseseed);} 
(={Glob.mem,msgp,pkp,noiseseed,sctp} /\
  valid_ptr _pkp (384 * 3 + 32) /\
  valid_ptr _ctp (3 * 320 + 128) /\
  Glob.mem{1} = mem /\
  to_uint sctp{1} = _ctp /\
  to_uint pkp{1} = _pkp
   ==> ={Glob.mem,r}) 
( valid_ptr _pkp (384 * 3 + 32) /\
  valid_ptr _ctp (3 * 320 + 128) /\
  Glob.mem{1} = mem /\
  msgp{1} = m{2} /\
  to_uint sctp{1} = _ctp /\
  to_uint pkp{1} = _pkp /\
  noiseseed{1} = r{2} /\
  pk{2}.`1 = load_array1152 mem _pkp /\ 
  pk{2}.`2 = load_array32 mem (_pkp + 3 * 384)
  ==>
  touches Glob.mem{1} mem _ctp (3*320+128) /\
  let (c1, c2) = r0{2} in 
      c1 = load_array960 Glob.mem{1} _ctp /\ 
      c2 = load_array128 Glob.mem{1} (_ctp + 960)); 1,2: smt();  
   last by call(kyber_correct_enc mem _ctp _pkp); auto => />. 

inline{1} 1; inline {2} 1.
admitted. (* We should change the axv2 indcpa file to remove useless differences to the ref *)

(***************************************************)

lemma kyber_correct_enc_1_avx2 mem _pkp : 
   equiv [ Jkem_avx2.M.__indcpa_enc_1 ~ Kyber(KHS,XOF,KPRF,H).enc_derand: 
     valid_ptr _pkp (384*3 + 32) /\
     Glob.mem{1} = mem /\ 
     msgp{1} = m{2} /\ 
     to_uint pkp{1} = _pkp /\
     noiseseed{1} = r{2} /\
     pk{2}.`1 = load_array1152 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 3*384)
       ==> 
     Glob.mem{1} = mem /\
     let (c1,c2) = res{2} in
     c1 = Array960.init (fun i => res{1}.[i]) /\
     c2 = Array128.init (fun i => res{1}.[i+960])
].
proc*.
transitivity {1} { r <@ Jkem.M.__iindcpa_enc(witness,msgp,pkp,noiseseed);} 
(={Glob.mem,msgp,pkp,noiseseed} /\
  valid_ptr _pkp (384 * 3 + 32) /\
  Glob.mem{1} = mem /\
  to_uint pkp{1} = _pkp 
   ==> ={Glob.mem,r} /\ Glob.mem{1} = mem) 
( valid_ptr _pkp (384 * 3 + 32) /\
  Glob.mem{1} = mem /\
  msgp{1} = m{2} /\
  to_uint pkp{1} = _pkp /\
  noiseseed{1} = r{2} /\
  pk{2}.`1 = load_array1152 mem _pkp /\ 
  pk{2}.`2 = load_array32 mem (_pkp + 3 * 384)
  ==>
  Glob.mem{1} = mem /\
  r{1} = (Array1088.init (fun (i : int) => if 0 <= i && i < 960 then r0{2}.`1.[i] else r0{2}.`2.[i - 960])));[ by smt() | | | by call(kyber_correct_ienc mem _pkp); auto => />].
  + move => /> c1 c2. 
    rewrite !tP;split;move => *.
    + by rewrite !initiE // 1:/# /= /#.
    by rewrite !initiE //= !initiE 1:/# /= /#.

inline{1} 1; inline {2} 1.
admitted. (* this proof should be almost identical to the prev one *)


lemma kyber_correct_dec mem _ctp _skp : 
   equiv [ Jkem_avx2.M.__indcpa_dec_1 ~ Kyber(KHS,XOF,KPRF,H).dec : 
     valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2} = load_array1152 Glob.mem{1} _skp /\
     let (c1,c2) = cph{2} in
       c1 = load_array960 Glob.mem{1} _ctp /\
       c2 = load_array128 Glob.mem{1} (_ctp + 960)
       ==> 
     Glob.mem{1} = mem /\
     res{1} = oget res{2}
].
proc*.
transitivity {1} { r <@ Jkem.M.__indcpa_dec(msgp,ctp,skp);} 
(={Glob.mem,ctp,skp} /\
  valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp 
   ==> ={Glob.mem,r} /\ Glob.mem{1} = mem) 
( valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2} = load_array1152 Glob.mem{1} _skp /\
     let (c1,c2) = cph{2} in
       c1 = load_array960 Glob.mem{1} _ctp /\
       c2 = load_array128 Glob.mem{1} (_ctp + 960)
       ==> 
     Glob.mem{1} = mem /\
     r{1} = oget r{2}); 1,2: smt();  
   last by call(kyber_correct_dec mem _ctp _skp); auto => />. 

inline{1} 1; inline {2} 1.
admitted. (* this one is a lot easier *)
