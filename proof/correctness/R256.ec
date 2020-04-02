require import List Int IntExtra IntDiv CoreMap IntDiv.
from Jasmin require  import JModel JMemory.

(*
MOVE ELSEWHERE
*)

lemma to_sintD_small : (forall (a b : W16.t), 
    -W16.modulus %/2 <= to_sint a + to_sint b < W16.modulus %/2 =>
    to_sint (a + b) = to_sint a + to_sint b).
proof. 
move => a b.
  rewrite !W16.to_sintE !/smod => />.
  move : (W16.to_uint_cmp a) (W16.to_uint_cmp b) => /> *.
  have sumbnd : to_uint a + to_uint b < 65536+65536 ; first  by smt(). 
  case (65536  <= to_uint a + to_uint b).
+    move => *; rewrite (_:  to_uint (a + b)= (to_uint a +  to_uint b) - 65536);
       [rewrite to_uintD => />; by  smt(@IntDiv @W16) |  smt(@W16)].
+    move => *; rewrite (_:  to_uint (a + b)= (to_uint a +  to_uint b));
       [rewrite to_uintD_small => />; by  smt(@IntDiv @W16) |  smt(@W16)].
qed.


lemma to_sintB_small : (forall (a b : W16.t), 
    -W16.modulus %/2 <= to_sint a - to_sint b < W16.modulus %/2 =>
    to_sint (a - b) = to_sint a - to_sint b).
proof.
  move => a b.
  rewrite !W16.to_sintE !/smod => />.
  move : (W16.to_uint_cmp a) (W16.to_uint_cmp b). 
  case (to_uint b <= to_uint a).
+ case(32768 <= to_uint a); 
    by move => *;
      rewrite (_:  to_uint (a - b)= (to_uint a -  to_uint b)); smt(@W16 @IntDiv).
+ case(32768 <= to_uint a);  by 
    move => /> *; rewrite (_:  to_uint (a - b)= (to_uint a -  to_uint b) + 65536);
      [rewrite to_uintD to_uintN => />;  smt(@W16 @IntDiv)| smt(@W16 @IntDiv)].
qed.

lemma to_sintM_small : (forall (a b : W16.t), 
    -W16.modulus %/2 <= to_sint a * to_sint b < W16.modulus %/2 =>
    to_sint (a * b) = to_sint a * to_sint b).
proof.
move => a b.
  rewrite !W16.to_sintE !/smod => />.
  move : (W16.to_uint_cmp a) (W16.to_uint_cmp b) => *.
  case(32768 <= to_uint a);
    case(32768 <= to_uint b);
      by case (65536  <= to_uint a * to_uint b);
       move => *;rewrite to_uintM  => />;  smt(@W16 @IntDiv). 
qed.

lemma to_sintN (a : W16.t) : 
      -W16.modulus %/2 < to_sint a < W16.modulus %/2 =>
      to_sint (- a) = - to_sint a.
proof. 
    rewrite !to_sintE /smod !to_uintN=> /> *. 
    move : (W16.to_uint_cmp a) => /> *. 
    case (to_uint a = 0); first by smt(@IntDiv @W16).
    case (to_uint a = 65535); first by smt(@W16).
    move => *.
    rewrite (_: (- to_uint a) %% 65536 = 65536 - to_uint a);
           smt(@IntDiv @W16 @IntExtra).
qed.

(*
END MOVE ELSEWHERE
*)

require import Poly.
require import Fq.

theory R256.

op n : int =  256 axiomatized by nE.
op e : int = 17 axiomatized by eE.

clone include PolyQPrincipalIdeal
  with type elem <- Fq.ZModP.zmod,
         op Poly.Elem.zeror  <- Fq.ZModP.zero ,
         op Poly.Elem.oner   <- Fq.ZModP.one  ,
         op Poly.Elem.( + )  <- Fq.ZModP.( + ),
         op Poly.Elem.([-])  <- Fq.ZModP.([-]),
         op Poly.Elem.( * )  <- Fq.ZModP.( * ),
         op Poly.Elem.invr   <- Fq.ZModP.inv  ,
       pred Poly.Elem.unit   <- Fq.ZModP.unit ,
         op P                <- Poly.( + ) (Poly.exp Poly.X n)  Poly.one.

end R256.

export R256.

theory KyberPoly.

import Fq.
import ZModP.

op q = W16.of_int 3329 axiomatized by qE.
op b16 (a : W16.t) (b : int) = 
     -b <= to_sint a < b axiomatized by b16E.

op bpos16 (a : W16.t) (b : int) = 
     0 <= to_sint a < b  axiomatized by bpos16E.

op bw16 (a : W16.t) i =
     -2^i <= to_sint a < 2^i  axiomatized by bw16E.

hint simplify b16E.
hint simplify bpos16E.
hint simplify bw16E.

op add (a b : W16.t) = (a + b).

lemma add_corr (a b : W16.t) (a' b' : zmod) (asz bsz : int): 
   0 <= asz < 15 => 0 <= bsz < 15 =>
   a' = inzmod (W16.to_sint a) =>
   b' = inzmod (W16.to_sint b) =>
   bw16 a asz => 
   bw16 b bsz =>
     inzmod (W16.to_sint (add a b)) = a' + b' /\
           bw16 (add a b) (max asz bsz + 1).
proof.
rewrite /add  => />.
pose aszb := 2^asz.
pose bszb := 2^bsz.
move => ?? ?? ?? ??.
have bounds_asz : 0 < aszb <= 16384;
  first by split; [ apply gt0_pow2 | move => *; apply (pow_Mle asz 14 _) => /#].
have bounds_bsz : 0 < bszb <= 16384; 
  first by split; [ apply gt0_pow2 | move => *; apply (pow_Mle bsz 14 _) => /#].
rewrite !to_sintD_small => />; first by  by smt().

split; first by smt(@ZModP).

case (max asz bsz = asz).
+ move => maxx; rewrite maxx;
  rewrite (_: 2^(asz + 1) = aszb * 2); smt(@W16 @IntExtra). 
+ move => maxx; rewrite (_: max asz bsz = bsz); 
    [by smt() | by rewrite (_: 2^(bsz + 1) = bszb * 2); smt(@W16 @IntExtra)]. 
qed.

import Fq.SignedReductions.
require import NTT_Fq.

clone import NTT_Fq with
   op ZModP.p <- Fq.q,
   type ZModP.zmod <- zmod,
   op ZModP.zero  <- Fq.ZModP.zero,
   op ZModP.one   <- Fq.ZModP.one  ,
   op ZModP.( + )  <- Fq.ZModP.( + ),
   op ZModP.([-])  <- Fq.ZModP.([-]),
   op ZModP.( * )  <- Fq.ZModP.( * ),
   op ZModP.inv   <- Fq.ZModP.inv  ,
   op ZModP.inzmod <- inzmod,
   op ZModP.asint <- asint. (* .. *)

require import Jasmin_poly.
print M.

require import Array256.

lemma poly_reduct_corr:
    forall (_a : int Array256.t),
      phoare[ M.poly_reduce :
           (forall i, 0<= i < 256 =>
              (to_sint rp.[i]) = _a.[i]) ==> 
           forall i, 0<= i < 256 =>
              to_sint res.[i] = BREDC _a.[i] 26]= 1%r.
proof.
move => _a.
proc.
while (0 <= to_uint j <= 256 /\ 
       (forall k, 0 <= k < to_uint j => to_sint rp.[k] = (BREDC _a.[k] 26)) /\
       (forall k, to_uint j <= k < 256 => to_sint rp.[k] =  _a.[k]))
       (256 - to_uint j) ; last first.
auto => />. 
move => &ht H.
split; first by smt().
move => ??; move : H; rewrite ultE of_uintK => />; smt(@W16 @W64).
move => *;wp; sp; exists* t, j; elim* => t j; call (barret_reduct_corr _a.[to_uint j]); 
 auto => />;smt(@W64 @Array256).
qed.

op lift_array (p : W16.t Array256.t) =
  Array256.map (fun x => inzmod (W16.to_sint x)) p.

op array_mont (p : zmod Array256.t) =
  Array256.map (fun x => x *  (inzmod R)) p.

op load_array_from_mem(mem : global_mem_t, ptr : W64.t) : W16.t Array256.t.

axiom load_array_from_memE mem ptr i :
   0 <= i < 256 =>
     loadW16 mem (W64.to_uint ptr + 2* i) = (load_array_from_mem mem ptr).[i].

op ntt_bound_zetas(zetas : W16.t Array256.t) : bool =
   forall k, 0 <= k < 256 => bpos16  zetas.[k] Fq.q.

op log2(n : int) : int.

(* TODO: use easycrypt's native log to base *)
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

op ntt_bound_coefs(coefs : W16.t Array256.t, l u c : int) : bool =
   forall k, l <= k < u => b16 coefs.[k] (c*Fq.q).

(*******DIRECT *******)

equiv ntt_correct &m :
  NTT_Fq.NTT.ntt ~ M.poly_ntt : 
        to_uint zetasp{2}  < W64.modulus - 514 /\
        r{1} = lift_array rp{2} /\ 
        array_mont zetas{1} = 
           lift_array (load_array_from_mem Glob.mem{2} zetasp{2}) /\
        ntt_bound_zetas (load_array_from_mem Glob.mem{2} zetasp{2}) /\
        ntt_bound_coefs rp{2} 0 256 2
          ==> 
            res{1} = lift_array res{2} /\
            all (fun x => bpos16 x (2*Fq.q)) res{2}.
proc.
(* Dealing with final barret reduction *)
seq 3 2 :  (r{1} = lift_array rp{2}); last first.
exists * r{1}, rp{2}; elim* => r1 rp2.
call {2} (_:  
     forall i, 0 <= i < 256 =>
             to_sint rp.[i] = (map (fun (x : W16.t) => to_sint x) rp2).[i]
     ==> 
     forall i, 0 <= i < 256 =>
             to_sint res.[i] =
             BREDC (map (fun (x : W16.t) => to_sint x) rp2).[i] 26). 
apply (poly_reduct_corr (Array256.map (fun x => (W16.to_sint x)) rp2)).
skip; move => &1 &2 [#] ???.
split; first by smt (@Array256).

move => ???.
have bnds : (forall k, 0 <= k < 256 => bw16 rp{2}.[k] 15). 
by move => k kb />; rewrite to_sintE /smod => />;
      move : (W16.to_uint_cmp ( rp{2}.[k]));smt().

split.

+ rewrite (Array256.ext_eq r{1} (lift_array result)) //=.
   move => x xb;rewrite /lift_array  mapiE //=  (H3 x xb) mapiE => />.
   move : (BREDCp_corr (to_sint rp2.[x]) 26 _ _ _ _ _);
      first 5 by smt(@Fq bw16E).  
   move : (H1);rewrite Array256.tP => [# ] ? [#] ???.
   move : (H4 x xb);rewrite /lift_array mapiE => /> *;smt(@ZModP).

+ rewrite allP => i ib />; rewrite (H3 i ib) mapiE => />.
  move : (BREDCp_corr (to_sint rp2.[i]) 26 _ _ _ _ _);smt(@Fq @ZModP bw16E).
(***********************************)

sp;exists *zetasp{2};elim* => zetasp2.

(* Outer loop *)
while (
   to_uint zetasp{2} + 512 - (k{1}-1)*2 < W64.modulus /\
   r{1} = lift_array rp{2} /\
   array_mont zetas{1} = lift_array
              (load_array_from_mem Glob.mem{2} zetasp2) /\
   len{1} = to_uint len{2} /\
   (exists l, 0 <= l <= 7 /\ len{1} = 2^l) /\
   1 <= k{1} <= 256 /\
   to_uint zetasp{2} = to_uint zetasp2 + (k{1}-1)*2 /\
   2*k{1}*len{1} = 256 /\
   ntt_bound_zetas (load_array_from_mem Glob.mem{2} zetasp2) /\ 
   ntt_bound_coefs rp{2} 0 256 (9 - log2 len{1})); last by
    auto => />; move => *; split; [ by smt() |
                           split; [exists 7 => />; smt()| by smt(logs log2E)]].
wp; exists* k{1}; elim* => k1 l.

(* Middle loop *)
while (#{/~k1=k{1}}
        {~2*k{1}*len{1} = 256}
        {~ntt_bound_coefs rp{2} 0 256 (9 - log2 len{1})}pre /\ 
       2*k1*len{1}= 256 /\
       start{1} = to_uint start{2} /\
       0 <= start{1} <= 256 /\
       start{1} = 2*(k{1} - k1)*len{1} /\
       2* (k{1} - k1) * to_uint len{2} <= 256 /\
       (* Nasty carry inv *)
       ntt_bound_coefs  rp{2} 0 256 (9 - log2 len{1} + 1) /\
       ntt_bound_coefs  rp{2} start{1} 256 (9 - log2 len{1})
       ); last first.
auto => />; move => *.
split; first by move : H9; rewrite /ntt_bound_coefs => />; smt(@Fq).
move => *;rewrite uleE !shr_div => />.
split; last by  
   rewrite (logdiv2 (to_uint len{2}) (log2 (to_uint len{2}))); 
    [ smt(@W64) | smt(log2E) | smt(@W64) ]. 
 by  exists (l-1); smt(@IntExtra).

wp.

(* Inner loop *)
while (#{/~start{1} = 2*(k{1} - k1) * len{1}}
        {~ntt_bound_coefs  rp{2} start{1} 256 (9 - log2 len{1})} pre /\
       zeta_{1}  *  (inzmod R) = inzmod (to_sint zeta_0{2}) /\  
       0 <= to_sint zeta_0{2} < Fq.q /\
       start{1} = 2*((k{1}-1) - k1) * len{1} /\
       W64.to_uint cmp{2} = start{1} + len{1} /\ 
       j{1} = to_uint j{2} /\
       start{1} <= j{1} <= start{1} + len{1} /\
       (
       ntt_bound_coefs  rp{2} (j{1}) (start{1} + len{1}) (9 - log2 len{1}) /\
       ntt_bound_coefs  rp{2} (j{1} + len{1}) 256 (9 - log2 len{1})
       )
       );last first. 
auto => />. 
move => &1 &2 ?? ?? lenpow2 ?? ?? ??????? cbdloose cbdtight ?? => />.

split.

(* Initialization *) 
split; last by rewrite ultE to_uintD_small; by smt(@W64).
split; first by  rewrite !to_uintD_small of_uintK => />;smt(@IntExtra @W64).

split. 
rewrite to_uintD_small H5 => />; first by smt(@W64). 
rewrite (_: 
   (to_uint zetasp2 + (k{1} - 1) * 2 + 2) = 
   (to_uint zetasp2 + 2 * k{1} )); first by ring. 
rewrite (load_array_from_memE (Glob.mem{2}) ( zetasp2) (k{1})) //= /array_mont; smt(@Array256 @ZModP).

split.
move : H6; rewrite /ntt_bound_zetas => AA; move : (AA (k{1}) _); first by smt().
rewrite -(load_array_from_memE (Glob.mem{2}) zetasp2); first by smt().
rewrite (_: to_uint (zetasp{2} + (of_int 2)%W64) = to_uint zetasp2 + 2 * k{1}); [ by rewrite to_uintD_small; smt(@W64) | by smt(@W64)].
rewrite to_uintD_small; have ? : ((to_uint start{2} + to_uint len{2}) < 256). smt. smt(@W16 @Array256 @Fq). smt. smt(@W16 @Array256 @Fq).

(* Termination *)
move => *.
split.
rewrite (_:to_uint j_R = to_uint start{2} + to_uint len{2}); first by smt().
split; [ by rewrite !to_uintD_small => />;  by smt(@W64) | by smt(@W64) ].
by rewrite ultE /of_uingK to_uintD_small; smt(@W64).

(* Preservation *)
wp; sp; exists* t{2}, zeta_0{2}; elim* => t2 zeta_02.
call {2} (_:
   to_sint a = to_sint t2 /\ to_sint b = to_sint zeta_02   
   ==> 
  to_sint res = SREDC (to_sint t2 * to_sint zeta_02)
); first by apply (fqmul_corr (to_sint t2) (to_sint zeta_02)).
skip => />.
move => &1 &2 [#] ?? ?? ?? ?? bzetas ???? ?? bloose ?? zetaval ?? -> cmp ?? btightsmall btightlarge ??? resval.

move : btightlarge; rewrite /ntt_bound_coefs => /> btightlarge. 
 move : (btightlarge (to_uint (j{2} + len{2})) _);
 rewrite to_uintD_small; first 3 by smt(@W16).  
move : btightsmall; rewrite /ntt_bound_coefs => /> btightsmall. 
 move : (btightsmall (to_uint (j{2})) _); first by smt(@W16).
move => jbound jlenboundl llenboundh.

have bound1 : 2 <= to_uint len{2}; first by smt().
have bound2 : (9 - log2 (to_uint len{2})) * Fq.q <= 8*Fq.q; first by smt(@Fq logs).
have bound3 : -8*Fq.q <=  to_sint rp{2}.[to_uint j{2} + to_uint len{2}]<= 8*Fq.q; first by smt().
have bound4 : -8*Fq.q <=  to_sint rp{2}.[to_uint j{2}]<= 8*Fq.q; first by smt().
have bound5 : (-R %/ 2 * Fq.q < -8*Fq.q*Fq.q ); first by smt(@Fq).

move :resval; rewrite to_uintD_small; first by smt(@W64). move => resval.

move : (SREDCp_corr (to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2}) _ _); 
  first 2 by have ? : (-R %/ 2 * Fq.q < -8*Fq.q*Fq.q ); smt(@Fq). 
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
case (k0 <> to_uint j{2} /\ k0 <> to_uint j{2} + to_uint len{2}); first by 
  move => *; rewrite !Array256.set_neqiE; smt(@W64). 
  case (k0 = to_uint j{2}). 
  move => *;rewrite !Array256.set_eqiE;  smt(@W64).
  move => *; rewrite (_:k0 = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_neqiE; first 2 by smt(@W64). 
  rewrite Array256.set_eqiE; by smt(@W64). 
(* part 2 *)
move => *.
case (k0 <> to_uint j{2} /\ k0 <> to_uint j{2} + to_uint len{2}); first by 
  move => *; rewrite !Array256.set_neqiE; smt(@W64). 
  case (k0 = to_uint j{2}). 
  move => *;rewrite !Array256.set_eqiE;  smt(@W64).
  move => *; rewrite (_:k0 = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_neqiE; first 2 by smt(@W64). 
  rewrite Array256.set_eqiE; by smt(@W64). 

split; last first.
(* looser bound *)
move => *.
rewrite (_: (10 - log2 (to_uint len{2})) * Fq.q = 
            ( Fq.q) + ( (9 - log2 (to_uint len{2})) * Fq.q)); first by ring.
case (k0 <> to_uint j{2} /\ k0 <> to_uint j{2} + to_uint len{2}). 
  move => *; rewrite !Array256.set_neqiE; first 4 by smt(@W64). 
       by move : bloose; rewrite /ntt_bound_coefs; smt().
    
  case (k0 = to_uint j{2}). 
  move => *;rewrite !Array256.set_eqiE; first 2 by smt(@W64).
  rewrite to_sintD_small;  by smt(@Fq).
  move => *;rewrite Array256.set_neqiE; first 2 by smt(@W64). 
  rewrite Array256.set_eqiE; first 2 by smt(@W64). 
  rewrite to_sintB_small;   by smt(@Fq).

(*****************)
(* One goal *)
apply Array256.ext_eq.
move => x xb => />.
rewrite /lift_array !mapiE => />; first 2  by smt(@W64 @W16). 

case (x <> to_uint j{2}). 
+ case (x <> to_uint j{2} + to_uint len{2}); first by smt(@Array256).
   move => *.
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite to_sintB_small; first by smt(@Fq).

   rewrite !inzmodB.
   rewrite (_: inzmod (to_sint result) = 
     inzmod (to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2} * 169)); first by smt( @ZModP).
   rewrite !inzmodM -zetaval.
   rewrite (_: inzmod (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * (zeta_{1} * inzmod R) * inzmod 169 = 
     inzmod (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * ((zeta_{1} * inzmod R) * inzmod 169)); first by ring.
   rewrite (_: (zeta_{1} * inzmod R) * inzmod 169 = zeta_{1}); first by smt(@ZModP RRinv).
    by ring.

+ case (x <> to_uint j{2} + to_uint len{2}); last by smt(@Array256).
   move => *; rewrite (_: x = to_uint j{2}); first by smt().
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite to_sintD_small; first by smt(@Fq).

   rewrite !inzmodD.
   rewrite (_: inzmod (to_sint result) = 
      inzmod ((to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2} * 169))); first by smt(@ZModP).
      rewrite !inzmodM -zetaval. 
   rewrite (_: inzmod (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * (zeta_{1} * inzmod R) * inzmod 169 = 
     inzmod (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * ((zeta_{1} * inzmod R) * inzmod 169)); first by ring.
   rewrite (_: (zeta_{1} * inzmod R) * inzmod 169 = zeta_{1}); first by smt(@ZModP RRinv).
   by ring; smt(@ZModP @Array256). 
qed.

(*******INVERSE *******)

print M.

equiv invntt_correct &m :
  NTT_Fq.NTT.invntt ~ M.poly_invntt : 
        to_uint zetasp{2}  < W64.modulus - 514 /\
        r{1} = lift_array rp{2} /\ 
        array_mont zetas_inv{1} = 
           lift_array (load_array_from_mem Glob.mem{2} zetasp{2}) /\
        ntt_bound_zetas (load_array_from_mem Glob.mem{2} zetasp{2}) /\
        ntt_bound_coefs rp{2} 0 256 4
          ==> 
            res{1} = lift_array res{2} /\
            all (fun x => b16 x (Fq.q + 1)) res{2}.
proc.
(* Dealing with final loop *)
seq 3 4 :  (to_uint zetasp{2}  < W64.modulus - 514 /\
            r{1} = lift_array rp{2} /\
            array_mont zetas_inv{1} = 
               lift_array (load_array_from_mem Glob.mem{2} zetasp{2}) /\
            ntt_bound_zetas (load_array_from_mem Glob.mem{2} zetasp{2}) /\
            ntt_bound_coefs rp{2} 0 256 4); last first.
while (j{1} = to_uint j{2} /\
       0 <= j{1} <= 256 /\
       r{1} = lift_array rp{2} /\
       zetas_inv.[127]{1} * inzmod R  = inzmod (to_sint zeta_0{2}) /\
       bpos16 zeta_0{2} (Fq.q) /\
       ntt_bound_coefs rp{2} 0 256 4 /\
       (forall k, 0 <= k < j{1} =>
           b16 rp{2}.[k] (Fq.q + 1))
); last first. 
  wp;skip; move => &1 &2 [#] ? -> zvals zbnd???.
  split; last by smt(@W64 b16E @Array256).
  split; last by rewrite ultE;  smt(@W64).
  split; first by smt(@W64).
  split; first by smt().
  split; first by smt().
  split.
  move : zvals; rewrite /lift_array /array_mont 
        /zeta_0_R W64.to_uintD of_uintK modz_small => />.
        split; [ by smt(@W64)|  by auto => />; smt].
  rewrite (load_array_from_memE Glob.mem{2} zetasp{2} 127 _) => />;
    by  smt(@Array256 @ZModP).
  split; last by smt().
  move : zbnd; rewrite /ntt_bound_zetas /zeta_0_R W64.to_uintD 
  of_uintK modz_small => />. 
    split; [ by smt(@W64)|  by auto => />; smt].
  rewrite (load_array_from_memE Glob.mem{2} zetasp{2} 127 _) => /#.

sp;wp;exists* t{2},zeta_0{2}; elim* => t2 zeta_02 jj rr. 
call {2} (_:
   to_sint a = to_sint t2 /\ to_sint b = to_sint zeta_02   
   ==> 
  to_sint res = SREDC (to_sint t2 * to_sint zeta_02)
); first by apply (fqmul_corr (to_sint t2) (to_sint zeta_02)).
skip => />; move => &1 &2 ?? zetaval zbl zbh cbound tightbound ?? ? resval.

move : cbound; rewrite /ntt_bound_coefs => /> cbound. 
move : (cbound (to_uint j{2}) _) => />.
move => jboundl jboundh.

have bound4 : -4*Fq.q <=  to_sint rp{2}.[to_uint j{2}]<= 4*Fq.q; first by smt().
have bound5 : (-R %/ 2 * Fq.q < -4*Fq.q*Fq.q ); first by smt(@Fq).

move :resval; rewrite to_uintD_small; first by smt(@W64). move => resval.

move : (SREDCp_corr (to_sint rp{2}.[to_uint j{2}] * to_sint zeta_0{2}) _ _).
 smt(@Fq).  have ? : (-R %/ 2 * Fq.q < -4*Fq.q*Fq.q );  by smt(@Fq).

move => *.
split. 
split; first by smt(@W64).
split; first by smt(@W64).
split; last first.
split. 

move => *.
case (k0 = to_uint j{2}).
   by move => ->; rewrite !Array256.set_eqiE; smt(@W64). 
   by move => *;rewrite !Array256.set_neqiE; smt(@W64). 
move => *.
case (k0 = to_uint j{2}).
   by move => ->; rewrite !Array256.set_eqiE; smt(@W64). 
   by move => *;rewrite !Array256.set_neqiE; smt(@W64). 

apply ext_eq.
move => x xbnd.
   rewrite /lift_array !mapiE; first 2 by smt().
   case (x = to_uint j{2}).
   move => ->; rewrite !Array256.set_eqiE; first 4 by smt(@W64). 
   rewrite (_: zetas_inv{1}.[127] = inzmod (to_sint zeta_0{2} * 169)).
       rewrite inzmodM -zetaval.
       rewrite (_: zetas_inv{1}.[127] * inzmod R * inzmod 169 =
                    zetas_inv{1}.[127] * (inzmod R * inzmod 169)); first by ring.
   smt(@ZModP RRinv). smt(@ZModP).
   move => *; rewrite !Array256.set_neqiE; by smt(@Array256). 

by rewrite ultE; smt(@W64).

(***********************************)

wp;sp;exists *zetasp{2};elim* => zetasp2.
(* Outer loop *)
while (
   to_uint zetasp{2} + 512 - (k{1}-1)*2 < W64.modulus  /\
   r{1} = lift_array rp{2} /\
   array_mont zetas_inv{1} = lift_array
              (load_array_from_mem Glob.mem{2} zetasp2) /\
   len{1} = to_uint len{2} /\
   (exists l, 1 <= l <= 8 /\ len{1} = 2^l) /\
   0 <= k{1} <= 256 /\
   to_uint zetasp{2} = to_uint zetasp2 + (k{1})*2 /\
   k{1} * len{1} = 128 * (len{1} - 2) /\
   ntt_bound_zetas (load_array_from_mem Glob.mem{2} zetasp2) /\ 
   ntt_bound_coefs rp{2} 0 256 4 ); last by
      auto => />; move => &1 &2 ????; split; 
        [smt(@W64) | exists (1);  smt(logs)].

wp; exists* k{1}; elim* => k1 l.

(* Middle loop *)
while (#{/~k1=k{1}}
        {~k{1} * len{1} = 128 * (len{1} - 2)}pre /\ 
       k1 * len{1} = 128 * (len{1} - 2) /\
       start{1} = to_uint start{2} /\
       0 <= start{1} <= 256 /\
       start{1} = 2*(k{1} - k1)*len{1} /\
       2* (k{1} - k1) * to_uint len{2} <= 256 /\
       (* Nasty carry inv *)
       ntt_bound_coefs  rp{2} 0 256 4); last first.
auto => />; move => *.
rewrite /(W64.(`<<`)) !uleE !of_uintK !to_uint_shl=> />.
split; last by smt(@W64).
split; first by rewrite modz_small; smt(@IntExtra).
split; last by smt(). 
exists (l+1); smt(@IntExtra log2E logs).

wp.

(* Inner loop *)
while (#{/~start{1} = 2*(k{1} - k1) * len{1}} pre /\
       zeta_{1}  *  (inzmod R) = inzmod (to_sint zeta_0{2}) /\  
       0 <= to_sint zeta_0{2} < Fq.q /\
       start{1} = 2*((k{1}-1) - k1) * len{1} /\
       W64.to_uint cmp{2} = start{1} + len{1} /\ 
       j{1} = to_uint j{2} /\
       start{1} <= j{1} <= start{1} + len{1}); last first.
auto => />. 
move => &1 &2 ?zetasd ??lenpow2 ??? zbnd cbd ????????? => />.

split.

(* Initialization *) 
split; last by rewrite ultE to_uintD_small; by smt(@W64).
split.
split.
by smt(@IntExtra @W64).
split; first by smt().
split; first by smt(@W64).
split; first by rewrite !to_uintD_small; by smt(@W64).
by smt().

split. 
move : zetasd; rewrite H4 mulzC //=  (load_array_from_memE (Glob.mem{2}) 
   (zetasp2) (k{1})) //= /array_mont /lift_array; first by smt(@W64).
rewrite (_: 
  inzmod (to_sint (load_array_from_mem Glob.mem{2} zetasp2).[k{1}]) = 
  (map (fun (x : W16.t) => inzmod (to_sint x)) 
     (load_array_from_mem Glob.mem{2} zetasp2)).[k{1}]); first by 
       rewrite mapiE; smt(@W64 @Array256 @ZModP).
 move => <-; rewrite mapiE;  smt(@W64 @Array256 @ZModP).

split; last by rewrite to_uintD_small;  smt(@W64).

move : zbnd; rewrite /ntt_bound_zetas => zbnd; 
  move : (zbnd (k{1}) _); first by smt(@W64).
by rewrite -(load_array_from_memE (Glob.mem{2}) zetasp2);smt(@W64).

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
          bpos16 m{2} (2*Fq.q)).
call {2}  (barret_reduct_corr (to_sint m2)) => />; first by  smt().
auto => />.
move => &1 &2 [#] ?? ?? ?? ?? bzetas  cbnd ??? ??? ?? zetaval ?? -> ? ????? resval.

move : cbnd; rewrite /ntt_bound_coefs => /> cbnd. 
 move : (cbnd (to_uint (j{2} + len{2})) _).
 rewrite to_uintD_small;   by smt(@W16 @W64). move => jlenbound.
 move : (cbnd (to_uint j{2}) _); first by by smt(@W64). move => jbound.

move : resval.
rewrite !to_uintD_small; first by smt(@W64).
move  :  (BREDCp_corr (to_sint (rp{2}.[to_uint j{2} + to_uint len{2}] + rp{2}.[to_uint j{2}])) 26 _ _ _ _ _) => />; first 3 by smt(@Fq).
by smt(@Fq @W16 @ZModP).

by move => ??? resval; smt(@Fq @W16 @ZModP).

(* Dealing with the multiplication *)
sp.

exists* t{2}, zeta_0{2}; elim* => t2 zeta_02 tr rpr.
call {2} (_:
   to_sint a = to_sint t2 /\ to_sint b = to_sint zeta_02   
   ==> 
  to_sint res = SREDC (to_sint t2 * to_sint zeta_02)
); first by apply (fqmul_corr (to_sint t2) (to_sint zeta_02)).
skip => />.
move => &1 &2 [#] ?? ?? ?? ?? bzetas cbnd ??? ?? bloose ?? zetaval ?? -> cmp ???? ???? resval.

move : cbnd; rewrite /ntt_bound_coefs => /> cbnd. 
 move : (cbnd (to_uint (j{2} + len{2})) _); first by smt(@W16 @W64).
 rewrite !to_uintD_small;  first 2  by smt(@W16 @W64). move => /> jlenboundl jlenboundh.
 move : (cbnd (to_uint j{2}) _); first by smt(@W64). move => /> jboundl jboundh.

have bound1 : 2 <= to_uint len{2}; first by smt(@IntExtra).
have bound2 : (-R %/ 2 < -4*Fq.q ); first by smt(@Fq).
have bound3 : (-R %/ 2 * Fq.q < -4*Fq.q*Fq.q ); first by smt(@Fq).
have bound4 : - 4 * Fq.q <= to_sint (- rpr.[to_uint j{2} + to_uint len{2}]) <= 4 * Fq.q; first by smt(@Fq to_sintN @W16). 

move : resval.
rewrite !to_uintD_small; first by smt(@W64).
move : (SREDCp_corr (to_sint (rpr.[to_uint j{2}] - rpr.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2}) _ _) => />; first  by smt(@Fq).
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
case (k0 <> to_uint j{2} /\ k0 <> to_uint j{2} + to_uint len{2}); first by 
  move => *; rewrite !Array256.set_neqiE; smt(@W64). 
  case (k0 = to_uint j{2}). 
  move =>  ->;rewrite Array256.set_neqiE; first 2  by smt(@W64). 
  rewrite Array256.set_eqiE;   by smt(@W64). 
  move => *; rewrite (_:k0 = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_eqiE; first 2 by smt(@W64). 
 rewrite resval; smt(@Fq).

(* part 2 *)
move => *.
case (k0 <> to_uint j{2} /\ k0 <> to_uint j{2} + to_uint len{2}); first by 
  move => *; rewrite !Array256.set_neqiE; smt(@W64). 
  case (k0 = to_uint j{2}). 
  move => *. rewrite Array256.set_neqiE; first 2 by smt(@W64).
  move => *. rewrite Array256.set_eqiE; by smt(@W64).
  move => *; rewrite (_:k0 = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_eqiE;  by smt(@W64). 

(*****************)
(* One goal *)
apply Array256.ext_eq.
move => x xb => />.
rewrite /lift_array !mapiE => />; first 2  by smt(@W64 @W16). 

case (x <> to_uint j{2} + to_uint len{2}). 
+ case (x <> to_uint j{2}); first by smt(@Array256).
   move => *.
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite H20.
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
     inzmod (SREDC (to_sint (rpr.[to_uint j{2}] - rpr.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2})) = 
     inzmod ((to_sint (rpr.[to_uint j{2}] - rpr.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2} * 169))); first by smt(@ZModP).
   rewrite (_: zeta_{1} = inzmod (to_sint zeta_0{2} * 169)).
       rewrite inzmodM -zetaval.
       rewrite (_: zeta_{1} * inzmod R * inzmod 169 =
                    zeta_{1} * (inzmod R * inzmod 169)); first by ring.
   smt(@ZModP RRinv). 
   rewrite !to_sintD_small; first  by smt(@Fq @W64).
   rewrite !to_sintN; first  by smt(@Fq @W64).
   by rewrite -inzmodB !inzmodM; ring.
qed.


(* COMPLEX MULTIPLICATION *)

print M.

lemma fqmul_corrr:
  forall (_a _b : int), hoare[ M.fqmul : to_sint a = _a /\ to_sint b = _b ==> to_sint res = SREDC (_a * _b)]. admitted. (* we have a phoare version, but here we need the hoare version *)


op complex_mul (a :zmod * zmod, b : zmod * zmod, zzeta : zmod) =
     (a.`2 * b.`2 * zzeta * (inzmod 169) + a.`1*b.`1  * (inzmod 169), 
      a.`1 * b.`2  * (inzmod 169) + a.`2 * b.`1  * (inzmod 169)).

op double_mul(a1 : zmod * zmod, b1 : zmod * zmod, 
              a2 : zmod * zmod, b2 : zmod * zmod, zzeta : zmod) = 
     (complex_mul a1 b1 zzeta, complex_mul a2 b2 (-zzeta)).

op base_mul(ap bp : zmod Array256.t, zetas : zmod Array256.t, rs : zmod Array256.t, i : int) : bool = 
   forall k, 0 <= k < i =>
     ((rs.[4*k],rs.[4*k+1]),(rs.[4*k+2],rs.[4*k+3])) =
         (double_mul (ap.[4*k],ap.[4*k+1]) (bp.[4*k],bp.[4*k+1])
                    (ap.[4*k+2],ap.[4*k+3]) (bp.[4*k+2],bp.[4*k+3]) (zetas.[k+64])).

lemma poly_basemul_corr:
    forall (_ap _bp _zetas: zmod Array256.t),
      hoare[ M.poly_basemul :
        to_uint zetas  < W64.modulus - 514 /\
        array_mont _zetas = 
           lift_array (load_array_from_mem Glob.mem zetas) /\
           _ap = lift_array ap /\
           _bp = lift_array bp /\
           ntt_bound_zetas (load_array_from_mem Glob.mem zetas) /\
           ntt_bound_coefs ap 0 256 2 /\
           ntt_bound_coefs bp 0 256 2 ==>
             ntt_bound_coefs res 0 256 4 /\
             base_mul _ap _bp _zetas (lift_array res) 64].
proof.
move => *.
proc.
exists* zetas. elim* => zzetas.
seq 4 : (#{/~ntt_bound_zetas (load_array_from_mem Glob.mem zetas)}
          {~array_mont _zetas = lift_array (load_array_from_mem Glob.mem zetas)}
          {~zzetas=zetas}
          {~to_uint zetas < W64.modulus - 514}pre /\ 
          to_uint zzetas < W64.modulus - 514 /\
          ntt_bound_zetas (load_array_from_mem Glob.mem  zzetas) /\
          array_mont _zetas = lift_array (load_array_from_mem Glob.mem zzetas) /\
          to_uint zetas = to_uint zzetas + 128 /\
          aux = 64 /\ i = 0). auto => />. move => *. rewrite to_uintD_small;smt(@W64).

while (#{/~i=0}pre /\
    0<= i <= 64/\
    ntt_bound_coefs rp 0 (4*i) 4 /\
    base_mul _ap _bp _zetas (lift_array rp) i); last first. auto => />.
    move => *. split; first by smt(). 
    move => *. have ? : i0 = 64. smt(). move : H8 H9; rewrite H10 => />. 

move => *.

seq 1 : (#pre /\ inzmod (to_sint zeta_0) = _zetas.[64+i] * inzmod R /\
             bpos16 zeta_0 Fq.q).

auto => />.
move => &hr ?? pbnd zbnd mnt off ?????.
rewrite (_: 
  to_uint (zetas{hr} + (W64.of_int (2 * i{hr}))) = 
  to_uint zzetas + (2*(i{hr}+64))). 
rewrite to_uintD_small; smt(@W64).
rewrite(load_array_from_memE (Glob.mem{hr}) zzetas (i{hr} + 64) _). smt(). 
move :mnt zbnd; rewrite /ntt_bound_zetas /array_mont /lift_array. 
move => ? zbnd.
split; first by smt(@Array256).
move : (zbnd (i{hr} + 64) _);  smt(@Fq).

(* First complex multiplication *)

seq  13 : (#pre /\
           (inzmod (to_sint rp.[4*i]),inzmod (to_sint rp.[4*i+1])) = 
             complex_mul (inzmod (to_sint ap.[4*i]),inzmod (to_sint ap.[4*i+1])) 
                         (inzmod (to_sint bp.[4*i]),inzmod (to_sint bp.[4*i+1])) 
                         (_zetas.[64+i]) /\
             b16 rp.[4*i] (4*Fq.q) /\ b16 rp.[4*i+1] (4*Fq.q)).


sp;wp.
seq 4 : (#pre /\
          inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+1]) * inzmod (to_sint bp.[4*i+1]) * 
           _zetas.[64+i] * (inzmod 169)  + 
           inzmod (to_sint ap.[4*i]) * inzmod (to_sint bp.[4*i])  * (inzmod 169) /\
           b16 r0 (4*Fq.q)
        ).
seq 1 : (#pre /\
           inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+1]) * inzmod (to_sint bp.[4*i+1])  * (inzmod 169) /\
           b16 r0 (2*Fq.q)).
ecall (fqmul_corrr (to_sint a1) (to_sint b1)).
auto => />. 
move => &hr bas bbs zbnd pbnd mnt off ????? zval zbl zbh ? rval.

move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr} + 1] * to_sint bp{hr}.[4 * i{hr} + 1]) _ _) => />; first by smt(@Fq). 

move : bas; rewrite /ntt_bound_coefs => /> bas. 
 move : (bas ( (4*i{hr} + 1)) _); first by smt().
 move : (bas (4*i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /ntt_bound_coefs => /> bbs. 
 move : (bbs ( (4*i{hr} + 1)) _); first by smt().
 move : (bbs (4*i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.

smt(@Fq @W16).
by rewrite eq_inzmod -rval !inzmodM; smt(@Fq).

seq 1 : (#{/~ a1 = a1}{~ b1 = b1}
          {~inzmod (to_sint r0) = inzmod (to_sint ap.[4 * i + 1]) * inzmod (to_sint bp.[4 * i + 1]) * inzmod 169}pre /\
           inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+1]) * inzmod (to_sint bp.[4*i+1]) *
               _zetas.[i+64] * (inzmod 169) /\
           b16 r0 (2*Fq.q)).
ecall (fqmul_corrr (to_sint r0) (to_sint zeta_0)).
auto => />. 
move => &hr bas bbs zbnd pbnd mnt off ????? zval zbl zbh r0val ???rval.

move : (SREDCp_corr (to_sint r0{hr} * to_sint zeta_0{hr}) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rval !inzmodM r0val. 

move => ?? ->.

split; first by  smt(@Fq).
split; last by  smt(@Fq).

rewrite zval.
have ? : (inzmod (to_sint ap{hr}.[4 * i{hr} + 1]) * inzmod (to_sint bp{hr}.[4 * i{hr} + 1]) * inzmod 169 *
(_zetas.[64 + i{hr}] * inzmod R) * inzmod 169 =
inzmod (to_sint ap{hr}.[4 * i{hr} + 1]) * inzmod (to_sint bp{hr}.[4 * i{hr} + 1]) * inzmod 169 *
_zetas.[64 + i{hr}] * (inzmod (R * 169))
); first by  rewrite inzmodM; ring. by smt(@ZModP RRinv).

wp.
ecall (fqmul_corrr (to_sint a0) (to_sint b0)).
auto => />. 
move => &hr bas bbs zbnd pbnd mnt off ????? zval zbl zbh r0val ???rval.

move : bas; rewrite /ntt_bound_coefs => /> bas. 
 move : (bas ( (4*i{hr} + 1)) _); first by smt().
 move : (bas (4*i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /ntt_bound_coefs => /> bbs. 
 move : (bbs ( (4*i{hr} + 1)) _); first by smt().
 move : (bbs (4*i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.

move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr}] * to_sint bp{hr}.[4 * i{hr}]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rval !inzmodM. 
move => ?? rrval.

rewrite !to_sintD_small. smt(@Fq).
split.
rewrite  !inzmodD rrval H5 => /#.
by smt(@Fq).

ecall (fqmul_corrr (to_sint a1) (to_sint b0)).
ecall (fqmul_corrr (to_sint a0) (to_sint b1)).

auto => />.

move => &hr bas bbs zbnd pbnd mnt off ????? zval zbl zbh r0val ??? rval ?rvall. 

move : bas; rewrite /ntt_bound_coefs => /> bas. 
 move : (bas ( (4*i{hr} + 1)) _); first by smt().
 move : (bas (4*i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /ntt_bound_coefs => /> bbs. 
 move : (bbs ( (4*i{hr} + 1)) _); first by smt().
 move : (bbs (4*i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.

split. split.

move => k kl kh.
case (k = 4 * i{hr}). smt(@Array256 @Fq). 
case (k = 4 * i{hr}+1). smt(@Array256 @Fq). 

move => *.
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 

move : H1. rewrite /ntt_bound_coefs => *. 
move : (H1 k). rewrite b16E.
smt(@Fq).

rewrite /base_mul.
move => k kb.
rewrite /lift_array !mapiE; first 12 by smt(). 

rewrite !Array256.set_neqiE; first 16 by smt(@W64). 

simplify => />.

move : H2; rewrite /base_mul => *.

move : (H2 k kb).
rewrite /lift_array !mapiE; first 12 by smt(). 
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

seq 1 : (#{/~inzmod (to_sint zeta_0) = _zetas.[64 + i] * inzmod R}
          {~bpos16 zeta_0 Fq.q}pre /\
          inzmod (to_sint zeta_0) = - _zetas.[64 + i] * inzmod R /\
          -Fq.q < to_sint zeta_0 <= 0).
auto => />. move => *. split. rewrite to_sintN => />. smt. 
smt(@ZModP). rewrite to_sintN. smt. smt.

seq  13 : (#pre /\
           (inzmod (to_sint rp.[4*i+2]),inzmod (to_sint rp.[4*i+3])) = 
             complex_mul (inzmod (to_sint ap.[4*i+2]),inzmod (to_sint ap.[4*i+3])) 
                         (inzmod (to_sint bp.[4*i+2]),inzmod (to_sint bp.[4*i+3])) 
                         (-_zetas.[64+i]) /\
             b16 rp.[4*i+2] (4*Fq.q) /\ b16 rp.[4*i+3] (4*Fq.q)).

sp;wp.
seq 4 : (#pre /\
          inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+3]) * inzmod (to_sint bp.[4*i+3]) * 
           (-_zetas.[64+i]) * (inzmod 169)  + 
           inzmod (to_sint ap.[4*i+2]) * inzmod (to_sint bp.[4*i+2])  * (inzmod 169) /\
           b16 r0 (4*Fq.q)
        ).
seq 1 : (#pre /\
           inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+3]) * inzmod (to_sint bp.[4*i+3])  * (inzmod 169) /\
           b16 r0 (2*Fq.q)).
ecall (fqmul_corrr (to_sint a1) (to_sint b1)).
auto => />. 
move => &hr bas bbs zbnd pbnd mnt off ??????????? zval zbl zbh ? rval.

move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr} + 3] * to_sint bp{hr}.[4 * i{hr} + 3]) _ _) => />; first by smt(@Fq). 

move : bas; rewrite /ntt_bound_coefs => /> bas. 
 move : (bas ( (4*i{hr} + 3)) _); first by smt().
 move : (bas (4*i{hr}+2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /ntt_bound_coefs => /> bbs. 
 move : (bbs ( (4*i{hr} + 3)) _); first by smt().
 move : (bbs (4*i{hr}+2) _); first by smt(@W64). move => bibnd bi1bnd.

smt(@Fq @W16).
by rewrite eq_inzmod -rval !inzmodM; smt(@Fq).

seq 1 : (#{~inzmod (to_sint r0) = inzmod (to_sint ap.[4 * i + 3]) * inzmod (to_sint bp.[4 * i + 3]) * inzmod 169}pre /\
           inzmod (to_sint r0) = 
           inzmod (to_sint ap.[4*i+3]) * inzmod (to_sint bp.[4*i+3]) *
               -_zetas.[i+64] * (inzmod 169) /\
           b16 r0 (2*Fq.q)).
ecall (fqmul_corrr (to_sint r0) (to_sint zeta_0)).
auto => />. 
move => &hr bas bbs zbnd pbnd mnt off ??????????? zval zbl zbh r0val ???rval.

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
inzmod (to_sint ap{hr}.[4 * i{hr} + 3]) * inzmod (to_sint bp{hr}.[4 * i{hr} + 3]) *
- _zetas.[64 + i{hr}]  * inzmod 169 * (inzmod R * inzmod 169)
); first by ring. 
move : aux; rewrite (_: (inzmod R * inzmod 169)= inzmod (R*169)); first by rewrite inzmodM.
move : RRinv; rewrite eq_inzmod => ->.  smt(@ZModP). 

wp.
ecall (fqmul_corrr (to_sint a0) (to_sint b0)).
auto => />. 
move => &hr bas bbs zbnd pbnd mnt off ??????????? zval zbl zbh r0val ???rval.

move : bas; rewrite /ntt_bound_coefs => /> bas. 
 move : (bas ( (4*i{hr} + 3)) _); first by smt().
 move : (bas (4*i{hr} + 2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /ntt_bound_coefs => /> bbs. 
 move : (bbs ( (4*i{hr} + 3)) _); first by smt().
 move : (bbs (4*i{hr} + 2) _); first by smt(@W64). move => bibnd bi1bnd.

move : (SREDCp_corr (to_sint ap{hr}.[4 * i{hr} + 2] * to_sint bp{hr}.[4 * i{hr} + 2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inzmod -rval !inzmodM. 
move => ?? rrval.

rewrite !to_sintD_small. smt(@Fq).
split.
rewrite  !inzmodD rrval H11. ring.  smt(@ZModP). 
smt(@Fq).

ecall (fqmul_corrr (to_sint a1) (to_sint b0)).
ecall (fqmul_corrr (to_sint a0) (to_sint b1)).

auto => />.


move => &hr bas bbs zbnd pbnd mnt off ??????????? zval zbl zbh r0val ??? rval ?rvall. 

move : bas; rewrite /ntt_bound_coefs => /> bas. 
 move : (bas ( (4*i{hr} + 3)) _); first by smt().
 move : (bas (4*i{hr}+2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /ntt_bound_coefs => /> bbs. 
 move : (bbs ( (4*i{hr} + 3)) _); first by smt().
 move : (bbs (4*i{hr} + 2) _); first by smt(@W64). move => bibnd bi1bnd.

split. split.

move => k kl kh.
case (k = 4 * i{hr}+2). smt(@Array256 @Fq). 
case (k = 4 * i{hr}+3). smt(@Array256 @Fq). 

move => *.
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 

move : H1. rewrite /ntt_bound_coefs => *. 
move : (H1 k). rewrite b16E.
smt(@Fq).

split. 

rewrite /base_mul.
move => k kb.
rewrite /lift_array !mapiE; first 12 by smt(). 

rewrite !Array256.set_neqiE; first 16 by smt(@W64). 

simplify => />.

move : H2; rewrite /base_mul => *.

move : (H2 k kb).
rewrite /lift_array !mapiE; first 12 by smt(). 
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
move => *.
split.  smt(@W64).
split. 
rewrite /ntt_bound_coefs => /> k kb.
case (k < 4*i{hr}).
   move : H7; rewrite /ntt_bound_coefs => /> *.
move : (H7 k _); smt().
case (k = 4*i{hr}); smt(@Array256 @Fq).

rewrite /base_mul =>  k kb.
case (k < i{hr}). 
   move : H8; rewrite /base_mul => /> *.
   move : (H8 k _); rewrite /double_mul /complex_mul => />; first  by smt(). 
move => *. 
rewrite (_: k = i{hr}); first by smt().
rewrite /double_mul /complex_mul /lift_array.
split. split. 
rewrite !mapiE; first 6 by smt() => />. 
rewrite !mapiE; first 6 by smt() => />. 
rewrite !mapiE; first 6 by smt() => />. 
smt().
qed.

end KyberPoly.
