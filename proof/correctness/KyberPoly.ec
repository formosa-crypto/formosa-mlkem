require import List Int IntExtra IntDiv CoreMap IntDiv.
from Jasmin require  import JModel JMemory.
require import W16extra Array256 Array128.
require import Fq.
require import NTT_Fq.

(* TODO: use easycrypt's native log to base *)
op log2(n : int) : int.

axiom log2E n l : 0 <= l => n = 2^l => log2 n = l.
axiom log2pos n : 1 <= n => 0 <= log2 n.

lemma logs :
   log2 128 = 7 /\
   log2 64  = 6 /\
   log2 32  = 5 /\
   log2 16  = 4 /\
   log2 8   = 3 /\
   log2 4   = 2 /\
   log2 2   = 1 /\
   log2 1   = 0
  by smt(pow0 pow2_1 pow2_2 pow2_3 pow2_4 pow2_5 pow2_6 pow2_7  log2E log2pos).

lemma logdiv2 n l :
  1 < n =>
  n = 2^l =>
  log2 (n %/2) = log2 n - 1 by smt(@IntExtra log2E). 
(**************)


theory KyberPoly.

import Fq. 
import Kyber_.
import ZModRing.


import SignedReductions.

op lift_array256 (p : W16.t Array256.t) =
  Array256.map (fun x => inzmod (W16.to_sint x)) p.

op lift_array128 (p : W16.t Array128.t) =
  Array128.map (fun x => inzmod (W16.to_sint x)) p.

op array_mont (p : zmod Array128.t) =
  Array128.map (fun x => x *  (inzmod R)) p.

op load_array_from_mem(mem : global_mem_t, ptr : W64.t) : W16.t Array256.t.

axiom load_array_from_memE mem ptr i :
   0 <= i < 256 =>
     loadW16 mem (W64.to_uint ptr + 2* i) = (load_array_from_mem mem ptr).[i].

op signed_bound_cxq(coefs : W16.t Array256.t, l u c : int) : bool =
   forall k, l <= k < u => b16 coefs.[k] (c*Kyber_.q).

op minimum_residues(zetas : W16.t Array128.t) : bool =
   forall k, 0 <= k < 128 => bpos16  zetas.[k] Kyber_.q.

require import IndcpaDerand.
print Mderand.

lemma poly_add_corr _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>  
      hoare[ Mderand.poly_add :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inzmod (to_sint res.[k]) = _a.[k] + _b.[k]]. 
move => *.
proc. 
while (
           0 <= i <= 256 /\
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 i (ab + bb) /\ 
           forall k, 0 <= k < i =>
              inzmod (to_sint rp.[k]) = _a.[k] + _b.[k]
); last by auto => />; smt(@Array256 @Fq). 

wp; skip.
move => &hr [#] *.
split; first by smt().
split; first by smt().
split; first by smt().
split; first by smt().
split; first by smt().

split; last first. 
move => *.

case (k < i{hr}); first by move => *; smt(@Array256). 

move => *; rewrite (_: k =i{hr}) => />; first by smt().
rewrite set_eqiE; first 2 by smt().

move : (add_corr ap{hr}.[i{hr}] bp{hr}.[i{hr}] _a.[i{hr}] _b.[i{hr}] 14 14 _ _ _ _ _ _) => />; first 2 by smt(@Array256 @Fq). 
move : H5; rewrite /signed_bound_cxq =>  *.
move : (H5 k _); by smt(@Fq b16E).
move : H6; rewrite /signed_bound_cxq =>  *.
move : (H6 k _);  by smt(@Fq).

rewrite /signed_bound_cxq.
move => *.
case (k < i{hr}); first by move => *; move : H7; rewrite /signed_bound_cxq;smt(@Array256). 

move => *; rewrite (_: k =i{hr}) => />; first by smt().

move : H5; rewrite /signed_bound_cxq =>  *.
move : (H5 i{hr} _); first by smt().
move : H6; rewrite /signed_bound_cxq =>  *.
move : (H6 i{hr} _); first  by smt().
move => *.
rewrite /rp0.
rewrite set_eqiE; first 2 by smt().
rewrite !to_sintD_small; smt(@W16 @Fq b16E).
qed.

lemma poly_reduce_corr_h (_a : zmod Array256.t):
      hoare[ Mderand.poly_reduce :
          _a = lift_array256 rp ==> 
          _a = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16  res.[k] (2*Kyber_.q)].
proof.
proc.
exists *rp; elim* => _rp.
conseq (_:
  _rp = rp /\
 (forall i, 0<= i < 256 =>
              inzmod (to_sint rp.[i]) = _a.[i]) ==> 
           forall i, 0<= i < 256 =>
              to_sint rp.[i] = BREDC (to_sint _rp.[i]) 26
). 
move => &hr.
rewrite /lift_array256 => /> *.
rewrite mapiE => />.
move => &hr.
rewrite /lift_array256 => /> *.
split.
apply Array256.ext_eq => /> *.
rewrite !mapiE => />.
move : (H x _) => />.
move : (BREDCp_corr (to_sint rp{hr}.[x]) 26 _ _ _ _ _ _) => />; first 4 by smt(@Fq @W16).
rewrite qE /R => />; smt(@Barrett_kyber_general). by smt(@Fq @W16 @ZModRing).

move => *.
move : (H k _) => />.
move : (BREDCp_corr (to_sint rp{hr}.[k]) 26 _ _ _ _ _ _) => />; first 4 by smt(@Fq @W16).
rewrite qE /R => />; smt(@Barrett_kyber_general). by smt(@Fq @W16 @ZModRing).

while (0 <= to_uint j <= 256 /\ 
       (forall k, 0 <= k < to_uint j => to_sint rp.[k] = (BREDC (to_sint _rp.[k]) 26)) /\
       (forall k, to_uint j <= k < 256 => to_sint rp.[k] =  (to_sint _rp.[k]))); last first.
auto => />. 
move => &ht H.
split; first by smt().
move => ??; move : H; rewrite ultE of_uintK => />; smt(@W16 @W64).
move => *;wp; sp; ecall (barrett_reduce_corr_h (to_sint _rp.[to_uint j])); 
 auto => />;smt(@W64 @Array256).
qed.

lemma poly_reduce_ll:
  islossless Mderand.poly_reduce
 by proc;while (0 <= to_uint j <= 256) (256 - to_uint j); 
   move=>*;inline *; auto => />;smt(@W64).

lemma poly_reduce_corr (_a : zmod Array256.t):
      phoare[ Mderand.poly_reduce :
          _a = lift_array256 rp ==> 
          _a = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16  res.[k] (2*Kyber_.q)] = 1%r.
proof. by conseq poly_reduce_ll (poly_reduce_corr_h _a). qed.

op pos_bound256_cxq (coefs : W16.t Array256.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

lemma poly_csubq_corr ap ab :
    1 < ab<9 =>
      hoare[ Mderand.poly_csubq :
           ap = lift_array256 rp /\
           pos_bound256_cxq rp 0 256 ab 
           ==>
           ap = lift_array256 res /\
           pos_bound256_cxq res 0 256 (ab-1) ] 
. 
move => *.
proc.
admitted.

lemma poly_compress_round_corr ap :
      hoare[ Mderand.poly_compress_round :
           ap = lift_array256 a /\
           pos_bound256_cxq a 0 256 1 
           ==>
           Array256.map Poly.roundc ap = lift_array256 res /\
           pos_bound256_cxq res 0 256 1 ] 
. 
move => *.
proc.
admitted.

(*******DIRECT NTT *******)

import Indcpa.
lemma zeta_bound :
   minimum_residues jzetas.
admitted.
(* proof.
rewrite /minimum_residues.
apply/(allP jzetas (fun x => bpos16 x q)).
auto => />.
progress; by smt(@W16 @Fq).
qed. 
*)

equiv ntt_correct &m :
  NTT_Fq.NTT.ntt ~ Mderand.poly_ntt : 
        r{1} = lift_array256 rp{2} /\ 
        array_mont zetas{1} = 
           lift_array128  jzetas{2} /\
        signed_bound_cxq rp{2} 0 256 2
          ==> 
            res{1} = lift_array256 res{2} /\
            forall k, 0<=k<256 => bpos16 res{2}.[k] (2*Kyber_.q).
proc.
(* Dealing with final barret reduction *)
seq 3 5 :  (r{1} = lift_array256 rp{2}); last first.
ecall{2} (poly_reduce_corr (lift_array256 rp{2})).
skip; move => &1 &2 [#] ?? [#] ? bres.
split; first by smt (@Array256).
by apply bres.

(***********************************)

seq 0 1: #pre; first by auto => />. 
sp.

(* Outer loop *)
while (
   zetasp{2} = jzetas /\
   r{1} = lift_array256 rp{2} /\
   array_mont zetas{1} = lift_array128 jzetas /\
   len{1} = to_uint len{2} /\
   zetasctr{1} = to_uint zetasctr{2}/\
   (exists l, 0 <= l <= 7 /\ len{1} = 2^l) /\
   0 <= zetasctr{1} <= 127 /\
   2*(zetasctr{1}+1)*len{1} = 256 /\
   signed_bound_cxq rp{2} 0 256 (9 - log2 len{1})); last 
    by auto => />; move => *; split; [exists 7 => />; smt()| by smt(logs log2E)].
wp; exists* zetasctr{1}; elim* => zetasctr1 l.

(* Middle loop *)
while (#{/~zetasctr1=zetasctr{1}}
        {~2*(zetasctr{1}+1)*len{1} = 256}
        {~signed_bound_cxq rp{2} 0 256 (9 - log2 len{1})}pre /\ 
       2*(zetasctr1+1)*len{1}= 256 /\
       start{1} = to_uint start{2} /\
       0 <= start{1} <= 256 /\
       start{1} = 2*(zetasctr{1} - zetasctr1)*len{1} /\
       2* (zetasctr{1} - zetasctr1 ) * to_uint len{2} <= 256 /\
       (* Nasty carry inv *)
       signed_bound_cxq  rp{2} 0 256 (9 - log2 len{1} + 1) /\
       signed_bound_cxq  rp{2} start{1} 256 (9 - log2 len{1})
       ); last first.
auto => />; move => &1 &2 zmont ????? cinv cbnd ??.
split; first by  move : cbnd; rewrite /signed_bound_cxq => />; smt(@Fq).
move => *;rewrite uleE !shr_div => />.
split; last by  
   rewrite (logdiv2 (to_uint len{2}) (log2 (to_uint len{2}))); 
    [ smt(@W64) | smt(log2E) | smt(@W64) ]. 
 by  exists (l-1); smt(@IntExtra).

wp.

(* Inner loop *)
while (#{/~start{1} = 2*(zetasctr{1} - zetasctr1) * len{1}}
        {~signed_bound_cxq  rp{2} start{1} 256 (9 - log2 len{1})} pre /\
       zeta_{1}  *  (inzmod R) = inzmod (to_sint zeta_0{2}) /\  
       0 <= to_sint zeta_0{2} < Kyber_.q /\
       start{1} = 2*(zetasctr{1} -1 - zetasctr1) * len{1} /\
       W64.to_uint cmp{2} = start{1} + len{1} /\ 
       j{1} = to_uint j{2} /\
       start{1} <= j{1} <= start{1} + len{1} /\
       (
       signed_bound_cxq  rp{2} (j{1}) (start{1} + len{1}) (9 - log2 len{1}) /\
       signed_bound_cxq  rp{2} (j{1} + len{1}) 256 (9 - log2 len{1})
       )
       );last first. 
auto => />. 
move => &1 &2 ?? ? lenpow2 ??? ?? ???? cbdloose cbdtight ?? => />.

split.

(* Initialization *) 
split; last by rewrite ultE to_uintD_small; by smt(@W64).
split; first by rewrite !to_uintD_small of_uintK => />; smt(@IntExtra @W64).
split. 
rewrite to_uintD_small  => />; first by smt(@W64). 
move : H; rewrite /array_mont /lift_array128 => *.
have HH : (forall x, 0 <= x < 128 =>
  (map (transpose Kyber_.ZModRing.( * ) (inzmod R)) zetas{1}).[x] = (map (fun (x0 : W16.t) => inzmod (to_sint x0)) jzetas).[x]). 
by rewrite H. 
have ? : (to_uint zetasctr{2}  < 127); first by smt(@W64).
move : (HH (to_uint zetasctr{2} + 1)_); first by smt().
rewrite mapiE; first   by smt(@W64). 
rewrite mapiE; first   by smt(@W64 @ZModRing).
split.
have ? : (to_uint zetasctr{2}  < 127); first by smt(@W64).
move : zeta_bound; rewrite /minimum_residues => /> AA; move : (AA (to_uint zetasctr{2} + 1) _); first by smt(@W64).
rewrite !to_uintD_small; first 2 by smt(@W32).
move => *.
split;  first  by smt().
split; first  by smt().
split; first  by smt().
move : cbdtight; rewrite /signed_bound_cxq => *.
have ? : (to_uint start{2} + to_uint len{2} <= 256).
rewrite -H6 H9; first by smt(@W64).
split; move => *; move : (H15 k _); by smt().


(* Termination *)
move => *.
split.
rewrite (_:to_uint j_R = to_uint start{2} + to_uint len{2}); first by smt().
split; [ by rewrite !to_uintD_small => />;  by smt(@W64) | by smt(@W64) ].
by rewrite ultE /of_uingK to_uintD_small; smt(@W64).

(* Preservation *)
wp; sp. 
ecall {2} (fqmul_corr (to_sint t{2}) (to_sint zeta_0{2})).
skip => />.
move => &1 &2 [#] mont ?? ?? ?? ??  ??? bloose ?? zetaval ?? -> cmp ?? btightsmall btightlarge ??? resval.

move : btightlarge; rewrite /signed_bound_cxq => /> btightlarge. 
 move : (btightlarge (to_uint (j{2} + len{2})) _);
 rewrite to_uintD_small; first 3 by smt(@W16).  
move : btightsmall; rewrite /signed_bound_cxq => /> btightsmall. 
 move : (btightsmall (to_uint (j{2})) _); first by smt(@W16).
move => jbound jlenboundl llenboundh.

have bound1 : 2 <= to_uint len{2}; first by smt(). 
have bound2 : (9 - log2 (to_uint len{2})) * Kyber_.q <= 8*Kyber_.q; first by rewrite qE; auto => />; move :  H H0 H1 logs; smt(to_uint_small).
have bound3 : -8*Kyber_.q <=  to_sint rp{2}.[to_uint j{2} + to_uint len{2}]<= 8*Kyber_.q; first by smt().
have bound4 : -8*Kyber_.q <=  to_sint rp{2}.[to_uint j{2}]<= 8*Kyber_.q; first by smt().
have bound5 : (-R %/ 2 * Kyber_.q < -8*Kyber_.q*Kyber_.q ); first by smt(@Fq).

move :resval; rewrite to_uintD_small; first by smt(@W64). move => resval.

move : (SREDCp_corr (to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2}) _ _); 
  first 2 by have ? : (-R %/ 2 * Kyber_.q < -8*Kyber_.q*Kyber_.q ); smt(@Fq). 
rewrite -!resval. move => sredc.

split; last by smt(@W64).
split; last first.
split; first by smt(@W64).
split; first by smt().

(********* bounding carries *)
(* tighter bound *)
move => *.

split; last first.
(* part 1*)
move => *.
case (k <> to_uint j{2} /\ k <> to_uint j{2} + to_uint len{2}); first by 
  move => *; rewrite !Array256.set_neqiE; smt(@W64). 
  case (k = to_uint j{2}). 
  move => *;rewrite !Array256.set_eqiE;  smt(@W64).
  move => *; rewrite (_:k = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_neqiE; first 2 by smt(@W64). 
  rewrite Array256.set_eqiE; by smt(@W64). 
(* part 2 *)
move => *.
case (k <> to_uint j{2} /\ k <> to_uint j{2} + to_uint len{2}); first by 
  move => *; rewrite !Array256.set_neqiE; smt(@W64). 
  case (k = to_uint j{2}). 
  move => *;rewrite !Array256.set_eqiE;  smt(@W64).
  move => *; rewrite (_:k = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_neqiE; first 2 by smt(@W64). 
  rewrite Array256.set_eqiE; by smt(@W64). 

split; last first.
(* looser bound *)
move => *.
rewrite (_: (10 - log2 (to_uint len{2})) * Kyber_.q = 
            ( Kyber_.q) + ( (9 - log2 (to_uint len{2})) * Kyber_.q)); first by ring.
case (k <> to_uint j{2} /\ k <> to_uint j{2} + to_uint len{2}). 
  move => *; rewrite !Array256.set_neqiE; first 4 by smt(@W64). 
       by move : bloose; rewrite /signed_bound_cxq; smt().
    
  case (k = to_uint j{2}). 
  move => *;rewrite !Array256.set_eqiE; first 2 by smt(@W64).
  rewrite to_sintD_small;  by smt(@Fq).
  move => *;rewrite Array256.set_neqiE; first 2 by smt(@W64). 
  rewrite Array256.set_eqiE; first 2 by smt(@W64). 
  rewrite to_sintB_small;   by smt(@Fq).

(*****************)
(* One goal *)
apply Array256.ext_eq.
move => x xb => />.
rewrite /lift_array256 !mapiE => />; first 2  by smt(@W64 @W16). 

case (x <> to_uint j{2}). 
+ case (x <> to_uint j{2} + to_uint len{2}).
   move => *.
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
      rewrite mapiE; first by smt(). by auto => />. 
   move => *.
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite to_sintB_small; first by smt(@Fq).

   rewrite !inzmodB.
   rewrite (_: inzmod (to_sint result) = 
     inzmod (to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2} * 169)); first by smt( @ZModRing).
   rewrite !inzmodM -zetaval.
   rewrite (_: inzmod (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * (zeta_{1} * inzmod R) * inzmod 169 = 
     inzmod (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * ((zeta_{1} * inzmod R) * inzmod 169)); first by ring.
   rewrite (_: (zeta_{1} * inzmod R) * inzmod 169 = zeta_{1}); first by smt(@ZModRing RRinv).
    by ring.

+ case (x <> to_uint j{2} + to_uint len{2}); last by smt(@Array256).
   move => *; rewrite (_: x = to_uint j{2}); first by smt().
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite to_sintD_small; first by smt(@Fq).

   rewrite !inzmodD.
   rewrite (_: inzmod (to_sint result) = 
      inzmod ((to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2} * 169))); first by smt(@ZModRing).
      rewrite !inzmodM -zetaval. 
   rewrite (_: inzmod (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * (zeta_{1} * inzmod R) * inzmod 169 = 
     inzmod (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * ((zeta_{1} * inzmod R) * inzmod 169)); first by ring.
   rewrite (_: (zeta_{1} * inzmod R) * inzmod 169 = zeta_{1}); first by smt(@ZModRing RRinv).
   by ring; smt(@ZModRing @Array256). 
qed.

(*******INVERSE *******)

print Mderand.

lemma zetainv_bound :
   minimum_residues jzetas_inv.
admitted.
(*
proof.
rewrite /minimum_residues.
apply/(allP jzetas_inv (fun x => bpos16 x q)).
auto => />.
rewrite !qE. rewrite !of_sintK => />.
qed. 
*)

equiv invntt_correct &m :
  NTT_Fq.NTT.invntt ~ Mderand.poly_invntt : 
        r{1} = lift_array256 rp{2} /\ 
        array_mont zetas_inv{1} = 
           lift_array128  jzetas_inv{2} /\
        signed_bound_cxq rp{2} 0 256 2
          ==> 
            res{1} = lift_array256 res{2} /\
            forall k, 0<=k<256 => b16 res{2}.[k] (Kyber_.q+1).
proc.
(* Dealing with final loop *)
seq 3 5 :  (r{1} = lift_array256 rp{2} /\
         zetasp{2} = jzetas_inv{2} /\
        array_mont zetas_inv{1} = 
           lift_array128  jzetas_inv{2} /\
        signed_bound_cxq rp{2} 0 256 4
); last first.
while (j{1} = to_uint j{2} /\
       0 <= j{1} <= 256 /\
       r{1} = lift_array256 rp{2} /\
       zetas_inv.[127]{1} * inzmod R  = inzmod (to_sint jzetas_inv{2}.[127]) /\
       zeta_0{2} = jzetas_inv{2}.[127] /\
       signed_bound_cxq rp{2} 0 256 4 /\
       (forall k, 0 <= k < j{1} =>
           b16 rp{2}.[k] (Kyber_.q + 1))
); last first. 
  wp;skip; move => &1 &2 [#] -> zp zvals zbnd??.
  split; last by smt(@W64 b16E @Array256).
  split; last by rewrite ultE;  smt(@W64).
  split; first by smt(@W64).
  split; first by smt().
  split; first by smt().
  split.
  move : zvals; rewrite /lift_array128 /array_mont => zvals.
have HH : (forall x, 0 <= x < 128 =>
  (map (transpose Kyber_.ZModRing.( * ) (inzmod R)) zetas_inv{1}).[x] = 
   (map (fun (x0 : W16.t) => inzmod (to_sint x0)) jzetas_inv).[x]). 
by rewrite zvals. 
move : (HH (127)_); first by smt().
rewrite mapiE => />.  
split; first by  rewrite /zeta_0_R zp.
split; last  by smt().
move : zbnd; rewrite /signed_bound_cxq; smt(@Array256).

sp;wp;ecall{2} (fqmul_corr (to_sint t{2}) (to_sint jzetas_inv.[127])).

skip => />; move => &1 &2 ?? zetaval  cbound tightbound ???resval.

move : cbound; rewrite /signed_bound_cxq => /> cbound. 
move : (cbound (to_uint j{2}) _) => />.
move => jboundl jboundh.

have bound4 : -4*Kyber_.q <=  to_sint rp{2}.[to_uint j{2}]<= 4*Kyber_.q; first by smt().
have bound5 : (-R %/ 2 * Kyber_.q < -4*Kyber_.q*Kyber_.q ); first by smt(@Fq).

move :resval; rewrite to_uintD_small; first by smt(@W64). move => resval.

move : (SREDCp_corr (to_sint rp{2}.[to_uint j{2}] * to_sint ((W16.of_int 1441))) _ _).
 smt(@Fq).  
have ? : (-R %/ 2 * Kyber_.q < -4*Kyber_.q* to_sint ((of_int 1441))%W16 ); first   by smt(@Fq @W16).
simplify => />. move : (cbound (to_uint j{2}) _); first  by smt(@Fq).
move => * />. 
split; smt(@W16 @Fq).

move => *.
split. 
split; first by smt(@W64).
split; first by smt(@W64).
split; last first.
split. 

move => *.
case (k = to_uint j{2}).
   move => ->; rewrite !Array256.set_eqiE; smt(@W64). 
   by move => *;rewrite !Array256.set_neqiE; smt(@W64). 
move => *.
case (k = to_uint j{2}).
   by move => ->; rewrite !Array256.set_eqiE; smt(@W64). 
   by move => *;rewrite !Array256.set_neqiE; smt(@W64). 

apply Array256.ext_eq.
move => x xbnd.
   rewrite /lift_array256 !mapiE; first 2 by smt().
   case (x = to_uint j{2}).
   move => ->; rewrite !Array256.set_eqiE; first 4 by smt(@W64). 
   rewrite (_: zetas_inv{1}.[127] = inzmod (to_sint ((W16.of_int 1441)) * 169)).
       rewrite inzmodM -zetaval.
       rewrite (_: zetas_inv{1}.[127] * inzmod R * inzmod 169 =
                    zetas_inv{1}.[127] * (inzmod R * inzmod 169)); first by ring.
   smt(@ZModRing RRinv). smt(@ZModRing).
   move => *; rewrite !Array256.set_neqiE; by smt(@Array256). 

by rewrite ultE; smt(@W64).

(***********************************)

sp.
(* Outer loop *)
while (
   zetasp{2} = jzetas_inv /\
   r{1} = lift_array256 rp{2} /\
   array_mont zetas_inv{1} = lift_array128 jzetas_inv /\
   len{1} = to_uint len{2} /\
   (exists l, 1 <= l <= 8 /\ len{1} = 2^l) /\
   0 <= zetasctr{1} <= 128 /\
   zetasctr{1} = to_uint zetasctr{2} /\
   zetasctr{1} * len{1} = 128 * (len{1} - 2) /\
   signed_bound_cxq rp{2} 0 256 4); last first.
auto => />. move => &1 &2 ?cbnd.
split; first by exists (1);  smt(logs).
move : cbnd; rewrite /signed_bound_cxq;smt(@Array256 @Fq).

wp; exists* zetasctr{1}; elim* => zetasctr1 l.

(* Middle loop *)
while (#{/~zetasctr1=zetasctr{1}}
        {~zetasctr{1} * len{1} = 128 * (len{1} - 2)}pre /\ 
       zetasctr1 * len{1} = 128 * (len{1} - 2) /\
       start{1} = to_uint start{2} /\
       0 <= start{1} <= 256 /\
       start{1} = 2*(zetasctr{1} - zetasctr1)*len{1} /\
       2* (zetasctr{1} - zetasctr1) * to_uint len{2} <= 256 /\
       (* Nasty carry inv *)
       signed_bound_cxq  rp{2} 0 256 4); last first.
auto => />; move => *.
rewrite /(W64.(`<<`)) !uleE !of_uintK !to_uint_shl=> />.
split; last by smt(@W64).
split; first by rewrite modz_small; smt(@IntExtra).
split; last by smt(). 
exists (l+1); smt(@IntExtra log2E logs).

wp.

(* Inner loop *)
while (#{/~start{1} = 2*(zetasctr{1} - zetasctr1) * len{1}} pre /\
       zeta_{1}  *  (inzmod R) = inzmod (to_sint zeta_0{2}) /\  
       0 <= to_sint zeta_0{2} < Kyber_.q /\
       start{1} = 2*((zetasctr{1}-1) - zetasctr1) * len{1} /\
       W64.to_uint cmp{2} = start{1} + len{1} /\ 
       j{1} = to_uint j{2} /\
       start{1} <= j{1} <= start{1} + len{1}); last first.
auto => />. 
move => &1 &2 zetasd ?? lenpow2 ?? cbd ????????? => />.

split.

(* Initialization *) 
split; last by rewrite ultE to_uintD_small; by smt(@W64).
split.
split.
by smt(@W64).
split; first by smt().
split; last by smt( logs log2E).
rewrite to_uintD_small; smt(@W64).

split. 
move : zetasd; rewrite /array_mont /lift_array128.
move => zz.
have ? :(forall k, 0 <= k < 128 => 
  (map (transpose Kyber_.ZModRing.( * ) (inzmod R)) zetas_inv{1}).[k] = (map (fun (x : W16.t) => inzmod (to_sint x)) jzetas_inv).[k]).
by rewrite zz.
move : (H12 (to_uint zetasctr{2})_); first by smt().
rewrite mapiE; first by smt().
rewrite mapiE; first by smt().
simplify => />.

split; last by rewrite to_uintD_small;  smt(@W64).

move : zetainv_bound; rewrite /minimum_residues => zbnd; 
  move : (zbnd (to_uint zetasctr{2}) _);  smt(@W64).

(* Termination *)
move => *.
split.
rewrite (_:to_uint j_R = to_uint start{2} + to_uint len{2}); first by smt().
split; [ by rewrite !to_uintD_small => />;  by smt(@W64) | by smt(@W64) ].
by rewrite ultE /of_uingK to_uintD_small; smt(@W64).

(* Preservation *)

(*  Dealing with barrett reduction *)
wp; sp; exists* m{2}; elim* => m2.
seq 0 1 : (#{/~m2=m{2}}{~ m{2} = s{2} + t{2}}pre /\ 
          inzmod (to_sint m{2}) = inzmod(to_sint (s{2} + t{2})) /\ 
          bpos16 m{2} (2*Kyber_.q)).
ecall {2}  (barrett_reduce_corr (to_sint m2)) => />; first by  smt().
auto => />.
move => &1 &2 [#] ?? ?? ??   cbnd ?????? ?? zetaval ?? -> ?????? resval.

move : cbnd; rewrite /signed_bound_cxq => /> cbnd. 
 move : (cbnd (to_uint (j{2} + len{2})) _).
 rewrite to_uintD_small;   by smt(@W16 @W64). move => jlenbound.
 move : (cbnd (to_uint j{2}) _); first by by smt(@W64). move => jbound.

move : resval.
rewrite !to_uintD_small; first by smt(@W64).
move  :  (BREDCp_corr (to_sint (rp{2}.[to_uint j{2} + to_uint len{2}] + rp{2}.[to_uint j{2}])) 26 _ _ _ _ _ _) => />; first 3 by smt(@Fq).
move : jlenbound jbound cbnd; rewrite qE /R !to_uintD_small => /> *; first by smt(@W16). 
rewrite to_sintD_small; smt(@W16). rewrite /R qE; smt(@Barrett_kyber_general).

by move => ? resval; smt(@ZModRing).

(* Dealing with the multiplication *)
sp.

ecall {2} (fqmul_corr (to_sint t{2}) (to_sint zeta_0{2})).
skip => />.
move => &1 &2 rP_R [#] ?   ????? cbnd ??? ?? ? ?? zetaval ?? -> cmp ???? ???? resval.

move : cbnd; rewrite /signed_bound_cxq => /> cbnd. 
 move : (cbnd (to_uint (j{2} + len{2})) _); first by smt(@W16 @W64).
 rewrite !to_uintD_small;  first 2  by smt(@W16 @W64). move => /> jlenboundl jlenboundh.
 move : (cbnd (to_uint j{2}) _); first by smt(@W64). move => /> jboundl jboundh.

have bound1 : 2 <= to_uint len{2}; first by smt(@IntExtra).
have bound2 : (-R %/ 2 < -4*Kyber_.q ); first by smt(@Fq).
have bound3 : (-R %/ 2 * Kyber_.q < -4*Kyber_.q*Kyber_.q ); first by smt(@Fq).

move : resval.
rewrite !to_uintD_small; first by smt(@W64).
move : (SREDCp_corr (to_sint (rP_R.[to_uint j{2}] - rP_R.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2}) _ _) => />; first  by smt(@Fq).
 rewrite !to_sintD_small => />.  

rewrite !to_sintN;  by smt(@Fq).
rewrite !to_sintN;  by smt(@Fq).

 move => resbl resbh rescong resval.

split; last by smt(@W64).
split; last smt(@W64).

(********* bounding carries *)
split; last first.
split.
(* part 1*)
move => *.
case (k <> to_uint j{2} /\ k <> to_uint j{2} + to_uint len{2}); first by 
  move => *; rewrite !Array256.set_neqiE; smt(@W64). 
  case (k = to_uint j{2}). 
  move =>  ->;rewrite Array256.set_neqiE; first 2  by smt(@W64). 
  rewrite Array256.set_eqiE;   by smt(@W64). 
  move => *; rewrite (_:k = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_eqiE; first 2 by smt(@W64). 
 rewrite resval; smt(@Fq).

(* part 2 *)
move => *.
case (k <> to_uint j{2} /\ k <> to_uint j{2} + to_uint len{2}); first by 
  move => *; rewrite !Array256.set_neqiE; smt(@W64). 
  case (k = to_uint j{2}). 
  move => *. rewrite Array256.set_neqiE; first 2 by smt(@W64).
  move => *. rewrite Array256.set_eqiE; by smt(@W64).
  move => *; rewrite (_:k = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_eqiE;  by smt(@W64). 

(*****************)
(* One goal *)
apply Array256.ext_eq.
move => x xb => />.
rewrite /lift_array256 !mapiE => />; first 2  by smt(@W64 @W16). 

case (x <> to_uint j{2} + to_uint len{2}). 
+ case (x <> to_uint j{2}); first by smt(@Array256).
   move => *.
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite H19.
   rewrite !to_sintD_small to_uintD_small; first  by smt(@Fq @W64).
   simplify => />. smt(@Fq @W16).
   simplify => />. smt(@Fq @W16).
   by rewrite !inzmodD; ring.

+ case (x <> to_uint j{2}); last by smt(@Array256).
   move => *; rewrite (_: x = to_uint j{2}  + to_uint len{2}); first by smt().
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_eqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE; first 2 by smt(@W64). 
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite mapiE; first by smt(@W64).
   rewrite resval => />. 
   rewrite (_: 
     inzmod (SREDC (to_sint (rP_R.[to_uint j{2}] - rP_R.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2})) = 
     inzmod ((to_sint (rP_R.[to_uint j{2}] - rP_R.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2} * 169))); first by smt(@ZModRing).
   rewrite (_: zeta_{1} = inzmod (to_sint zeta_0{2} * 169)).
       rewrite inzmodM -zetaval.
       rewrite (_: zeta_{1} * inzmod R * inzmod 169 =
                    zeta_{1} * (inzmod R * inzmod 169)); first by ring.
   smt(@ZModRing RRinv). 
   rewrite !to_sintD_small. rewrite to_sintN /R => />;  smt(@Fq @W16). 
   rewrite !to_sintN; first  by smt(@Fq @W64).
   by rewrite -inzmodB !inzmodM; ring.
qed.

(* COMPLEX MULTIPLICATION *)

print Mderand.

op complex_mul (a :zmod * zmod, b : zmod * zmod, zzeta : zmod) =
     (a.`2 * b.`2 * zzeta * (inzmod 169) + a.`1*b.`1  * (inzmod 169), 
      a.`1 * b.`2  * (inzmod 169) + a.`2 * b.`1  * (inzmod 169)).

op double_mul(a1 : zmod * zmod, b1 : zmod * zmod, 
              a2 : zmod * zmod, b2 : zmod * zmod, zzeta : zmod) = 
     (complex_mul a1 b1 zzeta, complex_mul a2 b2 (-zzeta)).

op base_mul(ap bp : zmod Array256.t, zetas : zmod Array128.t, rs : zmod Array256.t, i : int) : bool = 
   forall k, 0 <= k < i =>
     ((rs.[4*k],rs.[4*k+1]),(rs.[4*k+2],rs.[4*k+3])) =
         (double_mul (ap.[4*k],ap.[4*k+1]) (bp.[4*k],bp.[4*k+1])
                    (ap.[4*k+2],ap.[4*k+3]) (bp.[4*k+2],bp.[4*k+3]) (zetas.[k+64])).

print Mderand.

lemma poly_basemul_corr _ap _bp _zetas:
      hoare[ Mderand.poly_basemul :
        array_mont _zetas = 
           lift_array128 jzetas /\
           _ap = lift_array256 ap /\
           _bp = lift_array256 bp /\
           signed_bound_cxq ap 0 256 2 /\
           signed_bound_cxq bp 0 256 2 ==>
             signed_bound_cxq res 0 256 4 /\
             base_mul _ap _bp _zetas (lift_array256 res) 64].
proof.
move => *.
proc.
seq 2 : #pre; first by auto => />.
sp.
while (#{/~i=0}{~zetasctr = W64.of_int 64}pre /\
    0<= i <= 64/\
    to_uint zetasctr = i + 64 /\
    signed_bound_cxq rp 0 (4*i) 4 /\
    base_mul _ap _bp _zetas (lift_array256 rp) i); last first. 
    auto => />.
    move => *; split; first by smt(). 
    move => *; have ? : i0 = 64; first by smt(). 
    by move : H6 H7; rewrite H8 => />. 

seq 2 : (#{/~to_uint zetasctr = i + 64}pre /\ inzmod (to_sint zeta_0) = 
            _zetas.[i + 64] * inzmod R /\
            to_uint zetasctr - 1 = i + 64 /\
             bpos16 zeta_0 Kyber_.q).

auto => />.
move => &hr mnt abnd bbnd? ??? rbndrval ?.
move :mnt; rewrite /minimum_residues /array_mont /lift_array128. 
move => ?.
split; first by rewrite H1; smt(@Array128).
split; first by rewrite to_uintD_small H1; smt(@W64).
move : zeta_bound; rewrite /minimum_residues =>/>.
by rewrite qE to_sintE => />; smt(@W16).

(* First complex multiplication *)

seq  13 : (#pre /\
           (inzmod (to_sint rp.[4*i]),inzmod (to_sint rp.[4*i+1])) = 
             complex_mul (inzmod (to_sint ap.[4*i]),inzmod (to_sint ap.[4*i+1])) 
                         (inzmod (to_sint bp.[4*i]),inzmod (to_sint bp.[4*i+1])) 
                         (_zetas.[64+i]) /\
             b16 rp.[4*i] (4*Kyber_.q) /\ b16 rp.[4*i+1] (4*Kyber_.q)).


sp;wp.
seq 4 : (#pre /\
          inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+1]) * inzmod (to_sint bp.[4*i+1]) * 
           _zetas.[64+i] * (inzmod 169)  + 
           inzmod (to_sint ap.[4*i]) * inzmod (to_sint bp.[4*i])  * (inzmod 169) /\
           b16 r0 (4*Kyber_.q)
        ).
seq 1 : (#pre /\
           inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+1]) * inzmod (to_sint bp.[4*i+1])  * (inzmod 169) /\
           b16 r0 (2*Kyber_.q)).
ecall (fqmul_corr_h (to_sint a1) (to_sint b1)).
auto => />. 
move => &hr mont bas bbs ?? pbnd  ?????? ? rval.

move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr} + 1] * to_sint bp{hr}.[4 * i{hr} + 1]) _ _) => />; first by smt(@Fq). 

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (4*i{hr} + 1)) _); first by smt().
 move : (bas (4*i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (4*i{hr} + 1)) _); first by smt().
 move : (bbs (4*i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.

smt(@Fq @W16).
by rewrite eq_inzmod -rval !inzmodM; smt(@Fq).

seq 1 : (#{~inzmod (to_sint r0) = inzmod (to_sint ap.[4 * i + 1]) * inzmod (to_sint bp.[4 * i + 1]) * inzmod 169}pre /\
           inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+1]) * inzmod (to_sint bp.[4*i+1]) *
               _zetas.[i+64] * (inzmod 169) /\
           b16 r0 (2*Kyber_.q)).
ecall (fqmul_corr_h (to_sint r0) (to_sint zeta_0)).
auto => />. 
move => &hr mont bas bbs ??pbndt  ??zetaval ??? r0val ???rval.

move : (SREDCp_corr (to_sint r0{hr} * to_sint zeta_0{hr}) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rval !inzmodM r0val. 

move => ?? ->.

split; first by  smt(@Fq).
split; last by  smt(@Fq).

rewrite zetaval.
have ? : (inzmod (to_sint ap{hr}.[4 * i{hr} + 1]) * inzmod (to_sint bp{hr}.[4 * i{hr} + 1]) * inzmod 169 *
(_zetas.[64 + i{hr}] * inzmod R) * inzmod 169 =
inzmod (to_sint ap{hr}.[4 * i{hr} + 1]) * inzmod (to_sint bp{hr}.[4 * i{hr} + 1]) * inzmod 169 *
_zetas.[64 + i{hr}] * (inzmod (R * 169))
); first by  rewrite inzmodM; ring. by smt(@ZModRing RRinv).

wp.
ecall (fqmul_corr_h (to_sint a0) (to_sint b0)).
auto => />. 
move => &hr mnt bas bbs ?? rbnd rv ? zval ????? r0val ?rval.

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (4*i{hr} + 1)) _); first by smt().
 move : (bas (4*i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (4*i{hr} + 1)) _); first by smt().
 move : (bbs (4*i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.

move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr}] * to_sint bp{hr}.[4 * i{hr}]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rval !inzmodM. 
move => ?? rrval.

rewrite !to_sintD_small. smt(@Fq).
split.
rewrite  !inzmodD rrval => /#.
by smt(@Fq).

ecall (fqmul_corr_h (to_sint a1) (to_sint b0)).
ecall (fqmul_corr_h (to_sint a0) (to_sint b1)).

auto => />.

move => &hr mnt bas bbs ?? rbnd rv ? zval ??? r0val ??? rval ?rvall. 

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (4*i{hr} + 1)) _); first by smt().
 move : (bas (4*i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (4*i{hr} + 1)) _); first by smt().
 move : (bbs (4*i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.

split. split.

move => k kl kh.
case (k = 4 * i{hr}). smt(@Array256 @Fq). 
case (k = 4 * i{hr}+1). smt(@Array256 @Fq). 

move => *.
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 

move : rbnd; rewrite /signed_bound_cxq => rbnd. 
move : (rbnd k). rewrite b16E.
smt(@Fq).

rewrite /base_mul.
move => k kb.
rewrite /lift_array256 !mapiE; first 12 by smt(). 

rewrite !Array256.set_neqiE; first 16 by smt(@W64). 

simplify => />.

move : rv; rewrite /base_mul => rv.

move : (rv k kb).
rewrite /lift_array256 !mapiE; first 12 by smt(). 
simplify => />.

move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr}] * to_sint bp{hr}.[4 * i{hr} + 1]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rval !inzmodM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr} + 1] * to_sint bp{hr}.[4 * i{hr}]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rvall !inzmodM. 
move => ?? rrvall.

rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 


rewrite !to_sintD_small. smt(@Fq @W16).
rewrite r0val inzmodD rrval rrvall.
split. split; by ring.
smt(@W16 @Fq).

(* Second complex multiplication *)

seq 1 : (#{/~inzmod (to_sint zeta_0) = _zetas.[i + 64] * inzmod R}
          {~bpos16 zeta_0 Kyber_.q}pre /\
          inzmod (to_sint zeta_0) = - _zetas.[i + 64] * inzmod R /\
          -Kyber_.q < to_sint zeta_0 <= 0).
auto => />. 
move => *. split. rewrite to_sintN => />. 
move : H9 H10. 
rewrite to_sintE /smod qE => />; smt(@W16).
smt(@ZModRing). 
rewrite to_sintN => />.  
move : H9 H10; rewrite qE => />; smt(@W16). 
move : H9 H10; rewrite qE => />; smt(@W16). 

seq  13 : (#pre /\
           (inzmod (to_sint rp.[4*i+2]),inzmod (to_sint rp.[4*i+3])) = 
             complex_mul (inzmod (to_sint ap.[4*i+2]),inzmod (to_sint ap.[4*i+3])) 
                         (inzmod (to_sint bp.[4*i+2]),inzmod (to_sint bp.[4*i+3])) 
                         (-_zetas.[64+i]) /\
             b16 rp.[4*i+2] (4*Kyber_.q) /\ b16 rp.[4*i+3] (4*Kyber_.q)).

sp;wp.
seq 4 : (#pre /\
          inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+3]) * inzmod (to_sint bp.[4*i+3]) * 
           (-_zetas.[64+i]) * (inzmod 169)  + 
           inzmod (to_sint ap.[4*i+2]) * inzmod (to_sint bp.[4*i+2])  * (inzmod 169) /\
           b16 r0 (4*Kyber_.q)
        ).
seq 1 : (#pre /\
           inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+3]) * inzmod (to_sint bp.[4*i+3])  * (inzmod 169) /\
           b16 r0 (2*Kyber_.q)).
ecall (fqmul_corr_h (to_sint a1) (to_sint b1)).
auto => />. 
move => &hr mont bas bbs ?? rb rv ???????? zval zbl zbh ? rval.

move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr} + 3] * to_sint bp{hr}.[4 * i{hr} + 3]) _ _) => />; first by smt(@Fq). 

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (4*i{hr} + 3)) _); first by smt().
 move : (bas (4*i{hr}+2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (4*i{hr} + 3)) _); first by smt().
 move : (bbs (4*i{hr}+2) _); first by smt(@W64). move => bibnd bi1bnd.

smt(@Fq @W16).
by rewrite eq_inzmod -rval !inzmodM; smt(@Fq).

seq 1 : (#{~inzmod (to_sint r0) = inzmod (to_sint ap.[4 * i + 3]) * inzmod (to_sint bp.[4 * i + 3]) * inzmod 169}pre /\
           inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+3]) * inzmod (to_sint bp.[4*i+3]) *
               -_zetas.[i+64] * (inzmod 169) /\
           b16 r0 (2*Kyber_.q)).
ecall (fqmul_corr_h (to_sint r0) (to_sint zeta_0)).
auto => />.
move => &hr mont bas bbs ?? rb rv ???????? zval zbl zbh  r0val ???rval.

move : (SREDCp_corr (to_sint r0{hr} * to_sint zeta_0{hr}) _ _) => />.
  by smt(@Fq). 
  by smt(@Fq). 

rewrite eq_inzmod -rval !inzmodM r0val. 

move => ?? ->.

split; first by  smt(@Fq).
split; last by  smt(@Fq).

rewrite zval.
have aux : (inzmod (to_sint ap{hr}.[4 * i{hr} + 3]) * inzmod (to_sint bp{hr}.[4 * i{hr} + 3]) * inzmod 169 *
- _zetas.[64 + i{hr}] * inzmod R * inzmod 169 =
(inzmod R * inzmod 169) * inzmod (to_sint ap{hr}.[4 * i{hr} + 3]) * inzmod (to_sint bp{hr}.[4 * i{hr} + 3]) *
- _zetas.[64 + i{hr}]  * inzmod 169
); first by ring. 
move : aux.
rewrite (_: (inzmod R * inzmod 169)= inzmod (R*169)); first by rewrite inzmodM.
move : RRinv; rewrite eq_inzmod => ->.
rewrite (_: inzmod 1 = Kyber_.ZModRing.one); first by smt(@ZModRing). 
rewrite ZModRing.ComRing.mul1r. 
rewrite (_: i{hr} + 64 = 64+ i{hr}); first by ring.
pose a := inzmod (to_sint ap{hr}.[4 * i{hr} + 3]).
pose b := inzmod (to_sint bp{hr}.[4 * i{hr} + 3]).
pose z := _zetas.[64 + i{hr}].
pose c := inzmod 169.
pose d := inzmod R.
move => XX; rewrite -XX. 
by ring.

wp.
ecall (fqmul_corr_h (to_sint a0) (to_sint b0)).
auto => />. 
move => &hr mont bas bbs ?? rb rv ???????? zval zbl zbh  r0val ???rval.

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (4*i{hr} + 3)) _); first by smt().
 move : (bas (4*i{hr} + 2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (4*i{hr} + 3)) _); first by smt().
 move : (bbs (4*i{hr} + 2) _); first by smt(@W64). move => bibnd bi1bnd.

move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr} + 2] * to_sint bp{hr}.[4 * i{hr} + 2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rval !inzmodM. 
move => ?? rrval.

rewrite !to_sintD_small. smt(@Fq).
split.
rewrite  !inzmodD rrval H10.
rewrite (_: i{hr} + 64 = 64+ i{hr});  by ring.
smt(@Fq).

ecall (fqmul_corr_h (to_sint a1) (to_sint b0)).
ecall (fqmul_corr_h (to_sint a0) (to_sint b1)).

auto => />.
move => &hr mont bas bbs ?? rb rv ???????? zval zbl zbh  r0val ???rval ?rvall. 

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (4*i{hr} + 3)) _); first by smt().
 move : (bas (4*i{hr}+2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (4*i{hr} + 3)) _); first by smt().
 move : (bbs (4*i{hr} + 2) _); first by smt(@W64). move => bibnd bi1bnd.

split. split.

move => k kl kh.
case (k = 4 * i{hr}+2). smt(@Array256 @Fq). 
case (k = 4 * i{hr}+3). smt(@Array256 @Fq). 

move => *.
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 

move : rb. rewrite /signed_bound_cxq => rb. 
move : (rb k). rewrite b16E.
smt(@Fq).

split. 

rewrite /base_mul.
move => k kb.
rewrite /lift_array256 !mapiE; first 12 by smt(). 

rewrite !Array256.set_neqiE; first 16 by smt(@W64). 

simplify => />.

move : rv; rewrite /base_mul => rv.

move : (rv k kb).
rewrite /lift_array256 !mapiE; first 12 by smt(). 
simplify => />.

move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr}+2] * to_sint bp{hr}.[4 * i{hr} + 3]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rval !inzmodM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr} + 3] * to_sint bp{hr}.[4 * i{hr}+2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rvall !inzmodM. 
move => ?? rrvall.

rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 

split ;  by smt().


move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr}+2] * to_sint bp{hr}.[4 * i{hr} + 3]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rval !inzmodM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr} + 3] * to_sint bp{hr}.[4 * i{hr}+2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rvall !inzmodM. 
move => ?? rrvall.

rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 


rewrite !to_sintD_small. smt(@Fq).
rewrite r0val inzmodD rrval rrvall.
split. split; by ring.
smt(@W16 @Fq).

(**** FINAL GOAL *)
 auto => />.
move => &hr mont bas bbs ?? rb rv ???????? zval zbl zbh  r0val ???rval ?. 

split; first by  smt(@W64).
split; first by smt().
split.
rewrite /signed_bound_cxq => /> k kb.
case (k < 4*i{hr}).
   move : rb; rewrite /signed_bound_cxq => /> /#. 
case (k = 4*i{hr}); smt(@Array256 @Fq).

rewrite /base_mul =>  k kb.
case (k < i{hr}). 
   move => *.
   move : rv; rewrite /base_mul => /> rv.
   move : (rv k _); rewrite /double_mul /complex_mul => /> /#. 
move => *. 
rewrite (_: k = i{hr}); first by smt().
rewrite /double_mul /complex_mul /lift_array256.
split. split. 
rewrite !mapiE; first 6 by smt() => />. 
rewrite !mapiE; first 6 by smt() => />. 
rewrite !mapiE; first 6 by smt() => />. 
smt().
qed.

end KyberPoly.
