require import AllCore IntDiv.
from Jasmin require import JModel.

require import Array16 Array25 Array32 Array33 Array128 Array136 Array256 Array768 Array960 Array1024 Array1088 Array2304.

require import MLKEM_InnerPKE NTT_avx2 MLKEMFCLib.

import NTT_Avx2.

require import Jkem_avx2 Jkem.

import GFq Rq Sampling Serialization Symmetric VecMat InnerPKE MLKEM Fq Correctness.
import PolyMat.
import KMatrix.Matrix.

module HmoduleLow = {
   proc __gen_matrix(sd : W8.t Array32.t, trans : bool) : W16.t Array2304.t = {
       var aa : polymat;
       if (trans) {
          aa <@ Hmodule.sampleAT(sd);
       }
       else {
          aa <@ Hmodule.sampleA(sd);
       }
       return (unlift_matrix aa);
   }
}.

equiv Hmodule_connection :
   HmoduleLow.__gen_matrix ~ AuxMLKEM.__gen_matrix :
    ={arg} ==> ={res}.
proc. 
case (trans{1});last first.
+ rcondf{1} 1; 1: by auto.
  inline {1} 1;wp. 
  conseq (: _ ==> ={a}) => //.  
  while (0<=i{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i} /\ !trans{1} /\
         (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat);
   last by auto => />;smt(eq_matrixP getmE). 
  wp;conseq />;1:smt().
  while (0<=i{1}<kvec /\ 0<=j{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i,j} /\ !trans{1} /\
         (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat /\
         (forall kk, 0<=kk<j{1} => a{1}.[i{1},kk] = a{2}.[i{1},kk])%PolyMat);
   last by auto => />;smt(getmE). 
   inline XOF.init; sp;wp. 
   exlim rho{2}, i0{2}, j0{2}  => _rho _i _j.
   call {2} (parse_sem (SHAKE128_ABSORB_34 _rho (W8.of_int _i) (W8.of_int _j)) _rho (W8.of_int _i) (W8.of_int _j)).
   by auto => />;smt(setmE getmE offunmE tofunmK).
rcondt{1} 1; 1: by auto.
inline {1} 1;wp. 
conseq (: _ ==> ={a}) => //.  
while (0<=i{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i} /\ trans{1} /\
       (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat);
 last by auto => />;smt(eq_matrixP getmE). 
wp;conseq />;1:smt().
while (0<=i{1}<kvec /\ 0<=j{1}<=kvec /\ sd0{1} = seed{2} /\ ={trans,i,j} /\ trans{1} /\
       (forall kk jj, 0<=kk<i{1} => 0<=jj<kvec => a{1}.[kk,jj] = a{2}.[kk,jj])%PolyMat /\
       (forall kk, 0<=kk<j{1} => a{1}.[i{1},kk] = a{2}.[i{1},kk])%PolyMat);
 last by auto => />;smt(getmE). 
 inline XOF.init; sp;wp. 
 exlim rho{2}, i0{2}, j0{2}  => _rho _i _j.
 call {2} (parse_sem (SHAKE128_ABSORB_34 _rho (W8.of_int _i) (W8.of_int _j)) _rho (W8.of_int _i) (W8.of_int _j)).
 by auto => />;smt(setmE getmE offunmE tofunmK).
qed.

phoare Hmodule_low_sem _sd b :
 [  HmoduleLow.__gen_matrix : arg=(_sd,b) ==> res = if b 
                                             then unlift_matrix (trmx (sampleA _sd)) 
                                             else unlift_matrix (sampleA _sd) ] = 1%r. 
proc;case trans;last first.
+ rcondf 1;1: by auto. 
  by call (sampleA_sem _sd);auto => />.
rcondt 1;1: by auto. 
call (sampleAT_sem _sd);auto => />.
qed.

phoare nttunpack_corr a :
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._nttunpack : arg = a ==> res = nttunpack a] = 1%r.
admitted. (* proved in indcpa *)

phoare sample_last _rho :
 [ Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_sample_one_polynomial :
   rho = _rho /\ rc = W16.of_int (2*256+2) ==> 
   res.`1 = subarray256 (subarray768 (unlift_matrix (sampleA _rho)) 2) 2 ] = 1%r.
admitted.

op subarray1024 ['a] (x : 'a Array2304.t) (i : int) : 'a Array1024.t = 
        Array1024.init (fun (k : int) => x.[1024 * i + k]).

lemma sample_four _sd _rc b :
 (_rc = 0 \/ _rc = 4) =>
 phoare
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_sample_four_polynomials :
   rho = _sd /\ mat_entry = W64.of_int _rc /\ transposed = W64.of_int (b2i b) ==> 
   res.`1 = subarray1024 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) (_rc %% 3) ] = 1%r.
admitted.

timeout 1.
phoare _gen_matrix_avx2_sem _sd b :
 [  Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_avx2 : arg.`2 = _sd /\ arg.`3 = W64.of_int (b2i b)
                                         ==> res = if b 
                                             then nttunpackm (unlift_matrix (trmx (sampleA _sd))) 
                                             else nttunpackm (unlift_matrix (sampleA _sd)) ] = 1%r. 
proc => /=. 
while (0<=i<=3 /\ rho = _sd /\ 
    ((forall kk, 0 <= kk < i => subarray768 matrix kk = nttunpackv (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))) /\
     (forall kk, i <= kk < 3 => subarray768 matrix kk = (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))) (kvec-i).
+ move => *;wp => />;1:smt(). 
  while (0<=i<3 /\ 0 <= j <= 3 /\ rho = _sd /\
    ((forall kk, 0 <= kk < i => subarray768 matrix kk = nttunpackv (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))) /\
     (forall kk, i+1 <= kk < 3 => subarray768 matrix kk = (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk)) /\
     (forall kk, 0 <= kk < j => subarray256 (subarray768 matrix i) kk = nttunpack (subarray256 (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) i) kk)) /\
     (forall kk, j <= kk < 3 => subarray256 (subarray768 matrix i) kk = subarray256 (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) i) kk)) (kvec-j); last first.
  + auto => /> &hr ?? H H0 ?;do split;1..3:smt().
    + move => j0 m;do split;1:smt().
      move => ??? H1 H2 H3 H4;do split;1,2,4..:smt(). 
      move => kk kkbl kkbh;case(kk=i{hr});2: by smt().
      move => ->;rewrite /nttunpackv /= tP => ii iib.
      rewrite !initiE //=.
      case(0 <= ii && ii < 256).
      + by move => kb;rewrite -H3 1:/# initiE //= initiE /#.
      case(256 <= ii && ii < 512).
      + by  move => ?kb;rewrite -H3 1:/# initiE 1:/# //= initiE /#.
      by  move => ?kb;rewrite -H3 1:/# initiE 1:/# //= initiE /#.
  move => *.
  exlim matrix, i, j => _m _i _j.
  wp;call(nttunpack_corr ((init (fun (i_0 : int) => _m.[_i * (3 * 256) + _j * 256 + i_0]))%Array256)).
  auto => /> ?? H H0 H1 H2 H3 H4 ?;do split; 1,2,7..:smt(). 
  + move => ii??. 
    rewrite  tP => kk kkb.
    have -> : (subarray768
   ((init
       (fun (i_0 : int) =>
          if _i * 768 + _j * 256 <= i_0 && i_0 < _i * 768 + _j * 256 + 256 then
            (nttunpack ((init (fun (i_0_0 : int) => _m.[_i * 768 + _j * 256 + i_0_0])))%Array256).[
            i_0 - (_i * 768 + _j * 256)]
          else _m.[i_0])))%Array2304 ii) =
          subarray768 _m ii; last by smt().
     by rewrite tP => jj jjb; rewrite !initiE //= initiE 1:/# /= ifF 1:/#.  
 + move => ii iibl iibh.    
    have -> : (subarray768
   ((init
       (fun (i_0 : int) =>
          if _i * 768 + _j * 256 <= i_0 && i_0 < _i * 768 + _j * 256 + 256 then
            (nttunpack ((init (fun (i_0_0 : int) => _m.[_i * 768 + _j * 256 + i_0_0])))%Array256).[
            i_0 - (_i * 768 + _j * 256)]
          else _m.[i_0])))%Array2304 ii) =
          subarray768 _m ii; last by smt().
     by rewrite tP => jj jjb; rewrite !initiE //= initiE 1:/# /= ifF 1:/#.  
 + move => ii iibl iibh.
   case (ii = _j); last first.  
   + move => iibb;rewrite -H3 1:/#.
     rewrite /subarray256 /subarray768 tP => *.
     by rewrite !initiE //= !initiE //= 1,2:/# initiE /#.
   move => ->. 
   rewrite /subarray256 /subarray768  tP => *.
   rewrite initiE //= initiE 1:/# /= initiE 1:/# /= ifT 1:/#;congr;2:smt().
   congr;rewrite tP => i0 i0b; rewrite !initiE 1,2:/# /= initiE 1:/# /=.
   move : (H4 _j _); 1:smt().
   rewrite tP => H4u. 
   move : (H4u i0 _);1:smt().
   by smt(Array768.initiE Array256.initiE).

 + move => ii iibl iibh.
   rewrite -H4 1:/#.
   rewrite /subarray256 /subarray768  tP => *.
   by rewrite initiE //= initiE 1:/# /= initiE 1:/# /= ifF 1:/# initiE 1:/# /= initiE /#. 

wp 15;conseq (_:  (forall kk, 0 <= kk < 3 =>  subarray768 matrix kk = (subarray768 (unlift_matrix (if b then trmx (sampleA _sd) else (sampleA _sd))) kk))).
move =>/> m0 H; split;1:smt().
case b => hb.
+ move => i1 m1 *; split;1: smt(). 
  move => ???H0 H1. 
  rewrite /nttunpackm tP => k kb; rewrite !initiE //=.
  case (0 <= k && k < 768).
  + by move => kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.  
  case (768 <= k && k < 1536).
  + by move =>? kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.  
  by move =>? kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.
move => i1 m1 *; split;1: smt(). 
move => ???H0 H1. 
rewrite /nttunpackm tP => k kb; rewrite !initiE //=.
case (0 <= k && k < 768).
+ by move => kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.  
case (768 <= k && k < 1536).
+ by move =>? kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.  
by move =>? kbb;rewrite -H0 1:/# /subarray768 initiE 1:/# /=.

unroll for 9.
wp;call (sample_last _sd). 
wp;call (sample_four _sd 4 b _).
wp;call (sample_four _sd 0 b _).

auto => /> &hr a -> a0 -> a1 -> row ??.
congr; rewrite tP => kk ?.
pose xx := (unlift_matrix (if b then trmx (sampleA _sd) else sampleA _sd)).[kk].
rewrite initiE 1:/# /=.
case (2048 <= kk && kk < 2304).
+ move => lastpos;rewrite /subarray256 /subarray768 initiE 1:/# /= initiE 1:/# /=.
  rewrite /xx;  case (!(b = true)); 1: by smt().
  move => /= ->;rewrite /unlift_matrix !initiE 1,2:/# /=;congr;congr.
  by rewrite /trmx offunmE 1:/# /= /#.

move => notlast.
rewrite initiE 1:/# /=.
case (1024 <= kk && kk < 2048).
+ by move => middlepos;rewrite /subarray1024 initiE /#.
move => *;rewrite initiE 1:/# /=.
by rewrite /subarray1024 initiE /#.
qed.

equiv genmatrixequiv_aux b : 
    Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_avx2    ~   AuxMLKEM.__gen_matrix :
 rho{1} = seed{2} /\ transposed{1} = (of_int (b2i b))%W64 /\ trans{2} = b ==>
res{1} = nttunpackm res{2} /\ pos_bound2304_cxq res{1} 0 2304 2 /\ pos_bound2304_cxq res{2} 0 2304 2.
proc* => //.
transitivity {2} { r <@ HmoduleLow.__gen_matrix(seed,trans); }
    (rho{1} = seed{2} /\ transposed{1} = (W64.of_int (b2i b)) /\ trans{2} = b ==> 
     r{1} = nttunpackm r{2} /\ pos_bound2304_cxq r{1} 0 2304 2 /\ pos_bound2304_cxq r{2} 0 2304 2)
    (={seed,trans} ==> ={r});1,2:smt();last by call Hmodule_connection => />.
ecall {2} (Hmodule_low_sem seed{2} trans{2}) => /=.
ecall {1} (_gen_matrix_avx2_sem rho{1} trans{2}) => /=.
auto => /> &1;split;1:smt().
split; 2: by smt(matrix_unlift).
rewrite /nttunpack /nttunpackm.
rewrite /pos_bound2304_cxq => k kb.
case b => Hb.
+ rewrite !initiE //=. 
  case (0<= k < 768).  
  + move => kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix (trmx (sampleA seed{1}))) 0))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
  case (768<= k < 1536).  
  + move => ? kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix (trmx (sampleA seed{1}))) 1))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
  move => ??; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix (trmx (sampleA seed{1}))) 2))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
+ rewrite !initiE //=. 
  case (0<= k < 768).  
  + move => kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix ( (sampleA seed{1}))) 0))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
  case (768<= k < 1536).  
  + move => ? kbb; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix ( (sampleA seed{1}))) 1))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
  move => ??; have : (all (fun (c : W16.t) => 0 <= to_sint c && to_sint c < 2 * q)
   (nttunpackv (subarray768 (unlift_matrix ( (sampleA seed{1}))) 2))); last by smt(Array768.allP).
   rewrite nttunpackv_pred allP => kk kkb /=; rewrite /subarray768 initiE //=.  
   by smt(matrix_unlift).
qed.
