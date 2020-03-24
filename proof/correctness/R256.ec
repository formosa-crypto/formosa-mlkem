require import List Int IntExtra IntDiv CoreMap IntDiv.
from Jasmin require  import JModel JMemory.

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

theory KyberPoly.

clone import R256.
import Fq.
import ZModP.

type elem = W16.t.

op q = W16.of_int 3329 axiomatized by qE.

op add (a b : W16.t) = (a + b).

op bw16 (a : W16.t) i =
     0 <= i <= 15 /\ (* signed 15 bits at most *)
     -2^i <= to_sint a < 2^i.

lemma add_corr (a b : W16.t) (a' b' : zmod) (asz bsz : int): 
   asz < 15 => bsz < 15 =>
   a' = inzmod (W16.to_sint a) =>
   b' = inzmod (W16.to_sint b) =>
   bw16 a asz => 
   bw16 b bsz =>
     inzmod (W16.to_sint (add a b)) = a' + b' /\
           bw16 (add a b) (max asz bsz + 1).
admitted.
(* slow 
proof
rewrite /bw16 /add !to_sintE !_smodE => />.
move => ?? ?? [#?] ?? [#?] ??.

have bounds_asz : 0 < 2^asz <= 16384; first by split; [ apply gt0_pow2 | move => *; apply (pow_Mle asz 14 _) => /# ].
have bounds_bsz : 0 < 2^bsz <= 16384; first by split; [ apply gt0_pow2 | move => *; apply (pow_Mle bsz 14 _) => /#].
have bounds_a : (0 <= to_uint a < 32768) \/ (65536 - 32768 <= to_uint a < 65536); first by smt.
have bounds_as1 : (0 <= to_uint a < 32768 => 0 <= to_uint a < 2^asz). smt.
have bounds_as2 : (65536 - 32768 <= to_uint a < 65536 => 65536 -2^asz <= to_uint a < 65536). smt.
have bounds_b : (0 <= to_uint b < 32768) \/ (65536 - 32768 <= to_uint b < 65536); first by smt.
have bounds_bs1 : (0 <= to_uint b < 32768 => 0 <= to_uint b < 2^bsz). smt.
have bounds_bs2 : (65536 - 32768 <= to_uint b < 65536 => 65536 -2^bsz <= to_uint b < 65536). smt.

split.
case(to_uint a + to_uint b < W16.modulus) => /= *.
rewrite to_uintD_small; first by smt(@W16).
smt(@ZModP @W16).

rewrite (_: to_uint (a + b) = to_uint a + to_uint b - W16.modulus).
   have ? : (to_uint a + to_uint b < 2 * W16.modulus). smt.  
   have ? : (to_uint a + to_uint b = (to_uint a + to_uint b) %% W16.modulus + W16.modulus); smt.
smt(@ZModP @W16).

split. 
smt(@IntExtra @W16).

have bound : ((max asz bsz + 1) <= 15); first by  smt().
have boundd : (2^(max asz bsz + 1) <= 32768); first by smt.  
have bounddd : (2^asz < 2^(max asz bsz + 1)); first by admit.
have boundddd : (2^bsz < 2^(max asz bsz + 1)); first by  admit.
move : bound boundd bounddd boundddd; pose x := 2 ^ (max asz bsz + 1).
move => *.

elim bounds_a.
elim bounds_b.
move => *.
rewrite to_uintD_small;  by smt(@IntExtra @W16).
case(to_uint a + to_uint b < W16.modulus) => /= *.
rewrite to_uintD_small;  by smt(@W16).
rewrite (_: to_uint (a + b) = to_uint a + to_uint b - W16.modulus).
   have ? : (to_uint a + to_uint b < 2 * W16.modulus). smt.  
   have ? : (to_uint a + to_uint b = (to_uint a + to_uint b) %% W16.modulus + W16.modulus); smt.
smt(@IntExtra @W16).

elim bounds_b.
move => *.
case(to_uint a + to_uint b < W16.modulus) => /= *.
rewrite to_uintD_small;  by smt(@W16).
rewrite (_: to_uint (a + b) = to_uint a + to_uint b - W16.modulus).
   have ? : (to_uint a + to_uint b < 2 * W16.modulus). smt.  
   have ? : (to_uint a + to_uint b = (to_uint a + to_uint b) %% W16.modulus + W16.modulus); smt.
smt(@IntExtra @W16).

move => *.
case(to_uint a + to_uint b < W16.modulus) => /= *.
rewrite to_uintD_small;  by smt(@W16).
rewrite (_: to_uint (a + b) = to_uint a + to_uint b - W16.modulus).
   have ? : (to_uint a + to_uint b < 2 * W16.modulus). smt.  
   have ? : (to_uint a + to_uint b = (to_uint a + to_uint b) %% W16.modulus + W16.modulus); smt.
smt(@IntExtra @W16).

qed.
*)

require import NTT_Fq.

clone import NTT_Fq with
   op ZModP.p <- Fq.q,
   type ZModP.zmod <- zmod,
   theory ZModP.Sub <- Sub,
   op ZModP.inzmod <- inzmod,
   op ZModP.asint <- asint. (* .. *)

require import Poly_ntt.
print M.

require import Array256.
import Fq.SignedReductions.

print M.
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
move => *. 
move : H; rewrite ultE of_uintK => />; smt(@W16 @W64).
move => *.
wp. sp.
exists* t, j.
elim* => t j.
print barret_reduct_corr.
call (barret_reduct_corr _a.[to_uint j]).
by auto => />;smt(@W64 @Array256).
qed.

op lift_array (p : W16.t Array256.t) =
  Array256.map (fun x => inzmod (W16.to_sint x)) p.

op load_array_from_mem(mem : global_mem_t, ptr : W64.t) : W16.t Array256.t.

axiom load_array_from_memE mem ptr i :
   0 <= i < 256 =>
     loadW16 mem (W64.to_uint ptr + 2* i) = (load_array_from_mem mem ptr).[i].

print NTT_Fq.NTT.
print lift_array_from_mem.
equiv ntt_correct &m :
  NTT_Fq.NTT.ntt ~ M.poly_ntt : 
        r{1} = lift_array rp{2} /\ 
        zetas{1} = lift_array (load_array_from_mem Glob.mem{2} zetasp{2}) ==> 
            res{1} = lift_array res{2} /\
            all (fun x => 0<= W16.to_sint x < 2*Fq.q) res{2}.
proc.
seq 3 2 : 
    (forall k, 0 <= k < 256 => 
       (-32768 < to_sint rp{2}.[k] < 32768 /\
       r{1} = lift_array rp{2})); last first.
exists * r{1}, rp{2}.
elim* => r1 rp2.
call {2} (_:  
     forall i, 0 <= i < 256 =>
             to_sint rp.[i] = (map (fun (x : W16.t) => to_sint x) rp2).[i]
     ==> 
     forall i, 0 <= i < 256 =>
             to_sint res.[i] =
             BREDC (map (fun (x : W16.t) => to_sint x) rp2).[i] 26). 
apply (poly_reduct_corr (Array256.map (fun x => (W16.to_sint x)) rp2)).
skip. move => &1 &2 [#] ???.
split.
move => i ibnd; first by smt (@Array256).
move => ???.
split.
+ rewrite (Array256.ext_eq r{1} (lift_array result)) //=.
   move => x xb;rewrite /lift_array  mapiE //=  (H3 x xb) mapiE => />.
   move : (BREDCp_corr (to_sint rp2.[x]) 26 _ _ _ _ _);
      first 5 by smt(@Fq).  
   move : (H1 x xb);rewrite Array256.tP => [# ] ??? [#] ???.
   move : (H6 x xb);rewrite /lift_array mapiE => /> *;smt(@ZModP).
+ rewrite allP => i ib />.  
  rewrite  (H3 i ib) mapiE => />.
  move : (BREDCp_corr (to_sint rp2.[i]) 26 _ _ _ _ _);smt(@Fq @ZModP).
admitted.

end KyberPoly.