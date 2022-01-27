require import AllCore List IntDiv CoreMap IntDiv Real.
from Jasmin require  import JModel JMemory.
require import W16extra Array256 Array128.
require import Fq.
require import NTT_Fq.
require import Kyber.

hint simplify range_ltn, range_geq.

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
   log2 1   = 0.
proof.
  do split; first 7 by smt(pow2_7 pow2_6 pow2_5 pow2_4 pow2_3 pow2_2 pow2_1 log2E log2pos).
  by rewrite (log2E 1 0) //.
qed.

lemma logdiv2 n l :
  1 < n =>
  n = 2^l =>
  log2 (n %/2) = log2 n - 1. 
proof. by move => *; rewrite (log2E (n %/ 2) (log2 n - 1)); smt(@Ring.IntID log2E). qed.
(**************)

theory KyberPoly.

import Fq. 
import Zq.

import SignedReductions.

op lift_array256 (p : W16.t Array256.t) =
  Array256.map (fun x => inFq (W16.to_sint x)) p.

op lift_array128 (p : W16.t Array128.t) =
  Array128.map (fun x => inFq (W16.to_sint x)) p.

op array_mont (p : Fq Array128.t) =
  Array128.map (fun x => x *  (inFq R)) p.


op array_mont_inv (p : Fq Array128.t) =
  let vv = Array128.map (fun x => x *  (inFq R)) p in
      vv.[127 <- p.[127] * (inFq R) * (inFq R)].

op load_array_from_mem(mem : global_mem_t, ptr : W64.t) : W16.t Array256.t.

axiom load_array_from_memE mem ptr i :
   0 <= i < 256 =>
     loadW16 mem (W64.to_uint ptr + 2* i) = (load_array_from_mem mem ptr).[i].

op signed_bound_cxq(coefs : W16.t Array256.t, l u c : int) : bool =
   forall k, l <= k < u => b16 coefs.[k] (c*q).

op minimum_residues(zetas : W16.t Array128.t) : bool =
   forall k, 0 <= k < 128 => bpos16  zetas.[k] q.

op pos_bound256_cxq (coefs : W16.t Array256.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

op pos_bound256_b (coefs : W16.t Array256.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] b.

require import Jindcpa.

lemma m1true x :
  0 <= x < 16 =>
    (W16.of_int 65535).[x].
proof.
move => *.
rewrite of_intwE => />.
rewrite /int_bit => />. 
case (x = 0); first by smt(@Ring.IntID) => />.
move => *; case(x=1); first by auto => />.
move => *; case(x=2); first by auto => />.
move => *; case(x=3); first by auto => />.
move => *; case(x=4); first by auto => />.
move => *; case(x=5); first by auto => />.
move => *; case(x=6); first by auto => />.
move => *; case(x=7); first by auto => />.
move => *; case(x=8); first by auto => />.
move => *; case(x=9); first by auto => />.
move => *; case(x=10); first by auto => />.
move => *; case(x=11); first by auto => />.
move => *; case(x=12); first by auto => />.
move => *; case(x=13); first by auto => />.
move => *; case(x=14); first by auto => />.
move => *; case(x=15); first by auto => />.
smt().
qed.

lemma getsign x :
      (x \slt W16.zero => x `|>>` (of_int 15)%W8 = (of_int 65535)%W16) /\
      (W16.zero \sle x => x `|>>` (of_int 15)%W8 = W16.zero).
proof.
rewrite /(`|>>`) sarE sltE sleE !to_sintE /smod => />.
split; move => hh.
  have  xb : (32768 <= to_uint x); first by smt(W16.to_uint_cmp).
  apply W16.ext_eq => k kb; rewrite initiE => />.
  rewrite (_: min 15 (k+15) = 15); first by smt().
  by rewrite m1true // get_to_uint => />;smt().
have  xb : (0 <= to_uint x < 32768).
   split; first by smt().
   case (32768 <= to_uint x).
      move => *.
      have ? : false;  move : (W16.to_uint_cmp x) => />; smt().
      smt(). 
move => *.
  apply W16.ext_eq => k kb; rewrite initiE => />.
  rewrite (_: min 15 (k+15) = 15); first by smt().
  by rewrite get_to_uint => />;smt().
qed.

lemma poly_csubq_corr_h ap :
      hoare[ M.poly_csubq :
           ap = lift_array256 rp /\
           pos_bound256_cxq rp 0 256 2 
           ==>
           ap = lift_array256 res /\
           pos_bound256_cxq res 0 256 1 ].
proof.
move => *.
proc.
while (ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 2 /\ pos_bound256_cxq rp 0 (to_uint i) 1 /\ 0 <= to_uint i<=256).
seq 2 : (#pre /\ t = rp.[to_uint i] - W16.of_int 3329); first by auto => />.
seq 3 : (#pre /\ 
        (t \slt W16.zero => b = W16.of_int q) /\ 
        (W16.zero \sle t => b = W16.of_int 0)).
seq 2 : (#pre /\ 
        (t \slt W16.zero => b = W16.of_int (W16.modulus -1)) /\ 
        (W16.zero \sle t => b = W16.of_int 0)).
auto => /> &hr H H0 H1 H2 H3.
pose x := rp{hr}.[to_uint i{hr}] - (of_int 3329)%W16.
smt (getsign @W16).
auto => />.
move =>  &hr H H0 H1 H2 H3 H4 H5.
split. 
move => asp.
rewrite (H4 asp) qE  => />. 
apply W16.ext_eq => /> *.
rewrite m1true => />.
move => asp.
by rewrite (H5 asp)=> />. 
auto => />.
move => &hr H H0 H1 H2 H3 H4 H5 />.
split. 
case (rp{hr}.[to_uint i{hr}] - (of_int 3329)%W16 \slt W16.zero).
move => asp.
rewrite (H4 asp) qE => />. 
rewrite /lift_array256 => />.
apply Array256.ext_eq => /> x *.
rewrite mapiE => />.
rewrite mapiE => />.
case (x = to_uint i{hr}); last by smt(@Array256).
move => ->.
rewrite set_eqiE => />.
smt(@W64).
by rewrite (_: rp{hr}.[to_uint i{hr}] - (of_int 3329)%W16 + (of_int 3329)%W16 = rp{hr}.[to_uint i{hr}]);  ring.

move => H6.
have asp : (W16.zero \sle rp{hr}.[to_uint i{hr}] - (of_int 3329)%W16); first by smt(@W16).
rewrite (H5 asp) => />. 
apply Array256.ext_eq => /> x *.
rewrite mapiE => />.
rewrite mapiE => />.
case (x = to_uint i{hr}); last by smt(@Array256).
move => ->.
rewrite set_eqiE => />.
smt(@W64).
rewrite to_sintD_small => />.
move : H; rewrite /pos_bound256_cxq => bnd.
move : (bnd (to_uint i{hr}) _); first by smt(@W64).
auto => />.
rewrite qE => /> *.
split. 

(****)
rewrite to_sintN.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: 2 ^ (16 - 1) <= 3329 <=> false. smt().
simplify.
done.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: 2 ^ (16 - 1) <= 3329 <=> false. smt().
simplify.
smt().
(****)

(****)
rewrite to_sintN.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: 2 ^ (16 - 1) <= 3329 <=> false. smt().
simplify.
done.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: 2 ^ (16 - 1) <= 3329 <=> false. smt().
simplify.
smt().
(****)

rewrite inFqD. ring. 
rewrite to_sintE /smod to_uintN => />. 

(***)
have ?: 3329 %% q = 0.
rewrite qE.
smt().
rewrite inFqN.
rewrite /zero.
have ->: - - inFq 3329 = inFq 3329. smt(@Zq).
rewrite -eq_inFq.
smt().
(***)

move : H H0; rewrite /pos_bound256_cxq => />  H H0.
split.
move => k.
case (to_uint i{hr} = k); last first.
move => H6 H7 H8.
rewrite set_neqiE => />; first 2 by smt(@W64).
by move : (H k); rewrite /bpos16 => /#.

move => H6 H7 H8.
rewrite set_eqiE => />; first 2 by smt(@W64).
case (rp{hr}.[to_uint i{hr}] - (of_int 3329)%W16 \slt W16.zero).
move => asp.
rewrite (H4 asp) qE => />.
rewrite (_: rp{hr}.[to_uint i{hr}] - (of_int 3329)%W16 + (of_int 3329)%W16 =  (rp{hr}.[to_uint i{hr}])); first by ring.
split; first by smt(@W16 @Ring.IntID @JWord.W16.WRingA).

(*****)
move => *.
rewrite to_sint_unsigned.
done.
rewrite -to_sint_unsigned.
done.
move : (H (to_uint i{hr})).
rewrite H6 H7 H8.
simplify.
rewrite qE.
simplify.
smt().
(*****)

move => H9.
rewrite (H5 _); first by smt(@W16).
auto => />.
split.

(******)
move : H9.
rewrite sltE.
rewrite to_sintB_small.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (to_uint i{hr})).
rewrite H6 H7 H8.
simplify.
rewrite qE.
simplify.
smt().
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move => *.
smt().
(******)

move => H10.
rewrite to_sintD_small => />.
rewrite to_sintN => />. 
rewrite of_sintK => />.
rewrite /smod => />.
split.

(******)
move : H9.
rewrite sltE.
rewrite to_sintB_small.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (to_uint i{hr})).
rewrite H6 H7 H8.
simplify.
rewrite qE.
simplify.
smt().
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move => *.
smt().
(******)

move => H11. 

(******)
move : H9.
rewrite sltE.
rewrite to_sintB_small.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (to_uint i{hr})).
rewrite H6 H7 H8.
simplify.
rewrite qE.
simplify.
smt().
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move => *.
move : H10 H11.
rewrite to_sintB_small.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (to_uint i{hr})).
rewrite H6 H7 H8.
simplify.
rewrite qE.
simplify.
smt().
rewrite of_sintK /=.
rewrite /smod /=.
move => *.
move : (H (to_uint i{hr})).
rewrite H6 H7 H8.
simplify.
rewrite qE.
simplify.
smt().
(******)

rewrite qE to_sintN of_sintK => />.
rewrite /smod => />. 

move : (H (to_uint i{hr})).
rewrite H6 H7 H8.
simplify.
rewrite qE.
simplify.
rewrite /smod /=.
smt().

split; last by smt(@W64).

move => k.
case (0 <= k < to_uint i{hr}).
move => *.
move : (H0 k _) => /> *.
by rewrite !set_neqiE => />; smt(@W64).

(*********)
(*********)

move => H6 H7 H8.
rewrite !set_eqiE => />; first 2 by smt(@W64).

case (rp{hr}.[to_uint i{hr}] - (of_int 3329)%W16 \slt W16.zero).
move => asp.
rewrite (H4 asp) qE => />.
rewrite (_: rp{hr}.[to_uint i{hr}] - (of_int 3329)%W16 + (of_int 3329)%W16 =  (rp{hr}.[to_uint i{hr}])); first by ring.
split.
smt(@W64).

(******)
move => H9.
have ?: 0 < k \/ to_uint i{hr} <= k.
smt().
have ?: to_uint i{hr} <= k.
smt().
have ?: to_uint i{hr} = k.
smt(@W64).
move : asp.
rewrite sltE.
rewrite to_sintB_small.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (to_uint i{hr})).
move : H3 H0; rewrite ultE qE => /> *.
smt(@W64).
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move => *.
smt().
(******)

move => H9.
rewrite (H5 _); first by smt(@W16).
auto => />.
split.

(******)
move : H9.
rewrite sltE.
rewrite to_sintB_small.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (to_uint i{hr})).
move : H3 H0; rewrite ultE qE => /> *.
smt(@W64).
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.
move => *.
smt().
(******)

move => H10.
rewrite to_sintD_small => />.
rewrite to_sintN => />. 
rewrite of_sintK => />.
rewrite /smod => />.
split.

(******)
move : H9.
rewrite sltE.
rewrite to_sintB_small.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (to_uint i{hr})).
move : H3 H0; rewrite ultE qE => /> *.
smt(@W64).
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.

move => *.
smt().
(******)

move => H11. 

(******)
move : H9.
rewrite sltE.
rewrite to_sintB_small.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (to_uint i{hr})).
move : H3 H0; rewrite ultE qE => /> *.
smt(@W64).
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.

move => *.
move : H10 H11.
rewrite to_sintB_small.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (to_uint i{hr})).
move : H3 H0; rewrite ultE qE => /> *.
smt(@W64).
rewrite of_sintK /=.
rewrite /smod /=.

move => *.
move : (H (to_uint i{hr})).
move : H3 H0; rewrite ultE qE => /> *.
smt(@W64).
(******)

rewrite qE to_sintN of_sintK => />.
rewrite /smod => />. 

(******)
have H11: 0 < k \/ to_uint i{hr} <= k.
smt().
have H12: to_uint i{hr} <= k.
smt().
have H13: to_uint i{hr} = k.
smt(@W64).

move : H9.
rewrite sltE.
rewrite to_sintB_small.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (to_uint i{hr})).
move : H3 H0; rewrite ultE qE => /> H0 H3 H9.
smt(@W64).
rewrite of_sintK /=.
rewrite /smod /=.
have ->: to_sint W16.zero = 0.
rewrite to_sintE.
rewrite to_uint0.
rewrite /smod /=.
done.

move => H9.
move : H10.
rewrite to_sintB_small.
rewrite of_sintK.
simplify.
rewrite /smod.
simplify.
move : (H (to_uint i{hr})).
move : H3 H0; rewrite ultE qE => /> H0 H3 H10.
smt(@W64).
rewrite of_sintK /=.
rewrite /smod /=.
move => H10.
move : H H0 H9 H10; rewrite qE => />.
pose aa := to_sint rp{hr}.[to_uint i{hr}]; smt(@W64).
(******)

auto => />. 
move => *; split; 1:smt(). 
move => i0 rp0.
rewrite ultE =>  /> /#.
qed.

lemma poly_csubq_ll : islossless M.poly_csubq.
proof.
proc.
while (0 <= to_uint i <= 256) (256 - to_uint i); auto => />.
rewrite ultE => ??? /> ?.
rewrite to_uintD_small;smt(@W64).
smt(@W64).
qed.

lemma poly_csubq_corr ap :
      phoare[ M.poly_csubq :
           ap = lift_array256 rp /\
           pos_bound256_cxq rp 0 256 2 
           ==>
           ap = lift_array256 res /\
           pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_csubq_ll (poly_csubq_corr_h ap). 

lemma formula2 x :
  0 <= x < 3329 =>
   (x * 2 + 1665) * (268435456 %/ 3329) %% 4294967296 %/ 268435456 = (x * 2 +1664) %/ 3329 %% 16.
proof.
  have ? :
   (all
     (fun x => (x * 2 + 1665) * (268435456 %/ 3329 ) %% 4294967296 %/ 268435456 = (x * 2 +1664) %/ 3329 %% 16)
     (range 0 3329)).
by [].
by smt().
qed.

lemma formula3 x :
  0 <= x < 3329 =>
((of_int ((x * 2 + 1664) %/ 3329 %% 2))%W32 = W32.one) =
! -833 < (if 1664 <  x then x - 3329 else  x) < 833.
proof.
  have ? :
   (all
     (fun x => (( ((x * 2 + 1664) %/ 3329 %% 2)) = 1) =
! -833 < (if 1664 <  x then x - 3329 else  x) < 833)
     (range 0 3329)).
by [].
smt(@W32).
qed.

lemma poly_tomsg_corr_h _a : 
    hoare[ M.poly_tomsg :
             (* need some region validity on rp for 32 bytes *)
             pos_bound256_cxq a 0 256 2 /\
             lift_array256 a = _a ==>
           (* lift from region of 32 bytes from rp converted 
              to bool array is encoding of poly or decodes to poly
             map (fun x => x  = W32.one) res = m_decode _a /\ *)
             lift_array256 res = _a /\
             pos_bound256_cxq res 0 256 1].
admitted.
(*
proof.
proc.
seq 1 : #pre; first by auto => />.
swap 2 1.
unroll for 4.
unroll for 130.
unroll for 126.
unroll for 122.
unroll for 118.
unroll for 114.
unroll for 110.
unroll for 106.
unroll for 102.
unroll for 98.
unroll for 94.
unroll for 90.
unroll for 86.
unroll for 82.
unroll for 78.
unroll for 74.
unroll for 70.
unroll for 66.
unroll for 62.
unroll for 58.
unroll for 54.
unroll for 50.
unroll for 46.
unroll for 42.
unroll for 38.
unroll for 34.
unroll for 30.
unroll for 26.
unroll for 22.
unroll for 18.
unroll for 14.
unroll for 10.
unroll for 6.
seq 1: (pos_bound256_cxq a 0 256 1 /\ lift_array256 a = _a).
ecall (poly_csubq_corr_h _a) => />. smt(). auto => />. smt().
auto => />.
move => *.
rewrite (_:
rp{hr}.[0 <-
    (((zeroextu32 a{hr}.[0] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[1 <-
    (((zeroextu32 a{hr}.[1] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[2 <-
    (((zeroextu32 a{hr}.[2] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[3 <-
    (((zeroextu32 a{hr}.[3] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[4 <-
    (((zeroextu32 a{hr}.[4] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[5 <-
    (((zeroextu32 a{hr}.[5] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[6 <-
    (((zeroextu32 a{hr}.[6] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[7 <-
    (((zeroextu32 a{hr}.[7] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[8 <-
    (((zeroextu32 a{hr}.[8] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[9 <-
    (((zeroextu32 a{hr}.[9] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[10 <-
    (((zeroextu32 a{hr}.[10] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[11 <-
    (((zeroextu32 a{hr}.[11] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[12 <-
    (((zeroextu32 a{hr}.[12] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[13 <-
    (((zeroextu32 a{hr}.[13] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[14 <-
    (((zeroextu32 a{hr}.[14] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[15 <-
    (((zeroextu32 a{hr}.[15] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[16 <-
    (((zeroextu32 a{hr}.[16] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[17 <-
    (((zeroextu32 a{hr}.[17] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[18 <-
    (((zeroextu32 a{hr}.[18] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[19 <-
    (((zeroextu32 a{hr}.[19] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[20 <-
    (((zeroextu32 a{hr}.[20] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[21 <-
    (((zeroextu32 a{hr}.[21] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[22 <-
    (((zeroextu32 a{hr}.[22] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[23 <-
    (((zeroextu32 a{hr}.[23] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[24 <-
    (((zeroextu32 a{hr}.[24] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[25 <-
    (((zeroextu32 a{hr}.[25] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[26 <-
    (((zeroextu32 a{hr}.[26] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[27 <-
    (((zeroextu32 a{hr}.[27] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[28 <-
    (((zeroextu32 a{hr}.[28] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[29 <-
    (((zeroextu32 a{hr}.[29] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[30 <-
    (((zeroextu32 a{hr}.[30] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[31 <-
    (((zeroextu32 a{hr}.[31] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[32 <-
    (((zeroextu32 a{hr}.[32] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[33 <-
    (((zeroextu32 a{hr}.[33] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[34 <-
    (((zeroextu32 a{hr}.[34] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[35 <-
    (((zeroextu32 a{hr}.[35] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[36 <-
    (((zeroextu32 a{hr}.[36] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[37 <-
    (((zeroextu32 a{hr}.[37] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[38 <-
    (((zeroextu32 a{hr}.[38] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[39 <-
    (((zeroextu32 a{hr}.[39] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[40 <-
    (((zeroextu32 a{hr}.[40] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[41 <-
    (((zeroextu32 a{hr}.[41] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[42 <-
    (((zeroextu32 a{hr}.[42] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[43 <-
    (((zeroextu32 a{hr}.[43] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[44 <-
    (((zeroextu32 a{hr}.[44] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[45 <-
    (((zeroextu32 a{hr}.[45] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[46 <-
    (((zeroextu32 a{hr}.[46] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[47 <-
    (((zeroextu32 a{hr}.[47] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[48 <-
    (((zeroextu32 a{hr}.[48] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[49 <-
    (((zeroextu32 a{hr}.[49] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[50 <-
    (((zeroextu32 a{hr}.[50] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[51 <-
    (((zeroextu32 a{hr}.[51] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[52 <-
    (((zeroextu32 a{hr}.[52] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[53 <-
    (((zeroextu32 a{hr}.[53] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[54 <-
    (((zeroextu32 a{hr}.[54] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[55 <-
    (((zeroextu32 a{hr}.[55] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[56 <-
    (((zeroextu32 a{hr}.[56] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[57 <-
    (((zeroextu32 a{hr}.[57] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[58 <-
    (((zeroextu32 a{hr}.[58] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[59 <-
    (((zeroextu32 a{hr}.[59] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[60 <-
    (((zeroextu32 a{hr}.[60] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[61 <-
    (((zeroextu32 a{hr}.[61] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[62 <-
    (((zeroextu32 a{hr}.[62] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[63 <-
    (((zeroextu32 a{hr}.[63] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[64 <-
    (((zeroextu32 a{hr}.[64] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[65 <-
    (((zeroextu32 a{hr}.[65] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[66 <-
    (((zeroextu32 a{hr}.[66] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[67 <-
    (((zeroextu32 a{hr}.[67] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[68 <-
    (((zeroextu32 a{hr}.[68] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[69 <-
    (((zeroextu32 a{hr}.[69] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[70 <-
    (((zeroextu32 a{hr}.[70] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[71 <-
    (((zeroextu32 a{hr}.[71] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[72 <-
    (((zeroextu32 a{hr}.[72] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[73 <-
    (((zeroextu32 a{hr}.[73] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[74 <-
    (((zeroextu32 a{hr}.[74] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[75 <-
    (((zeroextu32 a{hr}.[75] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[76 <-
    (((zeroextu32 a{hr}.[76] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[77 <-
    (((zeroextu32 a{hr}.[77] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[78 <-
    (((zeroextu32 a{hr}.[78] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[79 <-
    (((zeroextu32 a{hr}.[79] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[80 <-
    (((zeroextu32 a{hr}.[80] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[81 <-
    (((zeroextu32 a{hr}.[81] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[82 <-
    (((zeroextu32 a{hr}.[82] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[83 <-
    (((zeroextu32 a{hr}.[83] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[84 <-
    (((zeroextu32 a{hr}.[84] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[85 <-
    (((zeroextu32 a{hr}.[85] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[86 <-
    (((zeroextu32 a{hr}.[86] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[87 <-
    (((zeroextu32 a{hr}.[87] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[88 <-
    (((zeroextu32 a{hr}.[88] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[89 <-
    (((zeroextu32 a{hr}.[89] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[90 <-
    (((zeroextu32 a{hr}.[90] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[91 <-
    (((zeroextu32 a{hr}.[91] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[92 <-
    (((zeroextu32 a{hr}.[92] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[93 <-
    (((zeroextu32 a{hr}.[93] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[94 <-
    (((zeroextu32 a{hr}.[94] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[95 <-
    (((zeroextu32 a{hr}.[95] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[96 <-
    (((zeroextu32 a{hr}.[96] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[97 <-
    (((zeroextu32 a{hr}.[97] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[98 <-
    (((zeroextu32 a{hr}.[98] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[99 <-
    (((zeroextu32 a{hr}.[99] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[100 <-
    (((zeroextu32 a{hr}.[100] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[101 <-
    (((zeroextu32 a{hr}.[101] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[102 <-
    (((zeroextu32 a{hr}.[102] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[103 <-
    (((zeroextu32 a{hr}.[103] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[104 <-
    (((zeroextu32 a{hr}.[104] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[105 <-
    (((zeroextu32 a{hr}.[105] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[106 <-
    (((zeroextu32 a{hr}.[106] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[107 <-
    (((zeroextu32 a{hr}.[107] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[108 <-
    (((zeroextu32 a{hr}.[108] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[109 <-
    (((zeroextu32 a{hr}.[109] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[110 <-
    (((zeroextu32 a{hr}.[110] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[111 <-
    (((zeroextu32 a{hr}.[111] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[112 <-
    (((zeroextu32 a{hr}.[112] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[113 <-
    (((zeroextu32 a{hr}.[113] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[114 <-
    (((zeroextu32 a{hr}.[114] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[115 <-
    (((zeroextu32 a{hr}.[115] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[116 <-
    (((zeroextu32 a{hr}.[116] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[117 <-
    (((zeroextu32 a{hr}.[117] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[118 <-
    (((zeroextu32 a{hr}.[118] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[119 <-
    (((zeroextu32 a{hr}.[119] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[120 <-
    (((zeroextu32 a{hr}.[120] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[121 <-
    (((zeroextu32 a{hr}.[121] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[122 <-
    (((zeroextu32 a{hr}.[122] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[123 <-
    (((zeroextu32 a{hr}.[123] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[124 <-
    (((zeroextu32 a{hr}.[124] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[125 <-
    (((zeroextu32 a{hr}.[125] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[126 <-
    (((zeroextu32 a{hr}.[126] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[127 <-
    (((zeroextu32 a{hr}.[127] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[128 <-
    (((zeroextu32 a{hr}.[128] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[129 <-
    (((zeroextu32 a{hr}.[129] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[130 <-
    (((zeroextu32 a{hr}.[130] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[131 <-
    (((zeroextu32 a{hr}.[131] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[132 <-
    (((zeroextu32 a{hr}.[132] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[133 <-
    (((zeroextu32 a{hr}.[133] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[134 <-
    (((zeroextu32 a{hr}.[134] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[135 <-
    (((zeroextu32 a{hr}.[135] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[136 <-
    (((zeroextu32 a{hr}.[136] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[137 <-
    (((zeroextu32 a{hr}.[137] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[138 <-
    (((zeroextu32 a{hr}.[138] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[139 <-
    (((zeroextu32 a{hr}.[139] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[140 <-
    (((zeroextu32 a{hr}.[140] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[141 <-
    (((zeroextu32 a{hr}.[141] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[142 <-
    (((zeroextu32 a{hr}.[142] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[143 <-
    (((zeroextu32 a{hr}.[143] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[144 <-
    (((zeroextu32 a{hr}.[144] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[145 <-
    (((zeroextu32 a{hr}.[145] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[146 <-
    (((zeroextu32 a{hr}.[146] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[147 <-
    (((zeroextu32 a{hr}.[147] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[148 <-
    (((zeroextu32 a{hr}.[148] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[149 <-
    (((zeroextu32 a{hr}.[149] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[150 <-
    (((zeroextu32 a{hr}.[150] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[151 <-
    (((zeroextu32 a{hr}.[151] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[152 <-
    (((zeroextu32 a{hr}.[152] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[153 <-
    (((zeroextu32 a{hr}.[153] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[154 <-
    (((zeroextu32 a{hr}.[154] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[155 <-
    (((zeroextu32 a{hr}.[155] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[156 <-
    (((zeroextu32 a{hr}.[156] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[157 <-
    (((zeroextu32 a{hr}.[157] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[158 <-
    (((zeroextu32 a{hr}.[158] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[159 <-
    (((zeroextu32 a{hr}.[159] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[160 <-
    (((zeroextu32 a{hr}.[160] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[161 <-
    (((zeroextu32 a{hr}.[161] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[162 <-
    (((zeroextu32 a{hr}.[162] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[163 <-
    (((zeroextu32 a{hr}.[163] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[164 <-
    (((zeroextu32 a{hr}.[164] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[165 <-
    (((zeroextu32 a{hr}.[165] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[166 <-
    (((zeroextu32 a{hr}.[166] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[167 <-
    (((zeroextu32 a{hr}.[167] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[168 <-
    (((zeroextu32 a{hr}.[168] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[169 <-
    (((zeroextu32 a{hr}.[169] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[170 <-
    (((zeroextu32 a{hr}.[170] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[171 <-
    (((zeroextu32 a{hr}.[171] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[172 <-
    (((zeroextu32 a{hr}.[172] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[173 <-
    (((zeroextu32 a{hr}.[173] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[174 <-
    (((zeroextu32 a{hr}.[174] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[175 <-
    (((zeroextu32 a{hr}.[175] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[176 <-
    (((zeroextu32 a{hr}.[176] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[177 <-
    (((zeroextu32 a{hr}.[177] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[178 <-
    (((zeroextu32 a{hr}.[178] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[179 <-
    (((zeroextu32 a{hr}.[179] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[180 <-
    (((zeroextu32 a{hr}.[180] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[181 <-
    (((zeroextu32 a{hr}.[181] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[182 <-
    (((zeroextu32 a{hr}.[182] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[183 <-
    (((zeroextu32 a{hr}.[183] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[184 <-
    (((zeroextu32 a{hr}.[184] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[185 <-
    (((zeroextu32 a{hr}.[185] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[186 <-
    (((zeroextu32 a{hr}.[186] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[187 <-
    (((zeroextu32 a{hr}.[187] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[188 <-
    (((zeroextu32 a{hr}.[188] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[189 <-
    (((zeroextu32 a{hr}.[189] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[190 <-
    (((zeroextu32 a{hr}.[190] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[191 <-
    (((zeroextu32 a{hr}.[191] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[192 <-
    (((zeroextu32 a{hr}.[192] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[193 <-
    (((zeroextu32 a{hr}.[193] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[194 <-
    (((zeroextu32 a{hr}.[194] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[195 <-
    (((zeroextu32 a{hr}.[195] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[196 <-
    (((zeroextu32 a{hr}.[196] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[197 <-
    (((zeroextu32 a{hr}.[197] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[198 <-
    (((zeroextu32 a{hr}.[198] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[199 <-
    (((zeroextu32 a{hr}.[199] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[200 <-
    (((zeroextu32 a{hr}.[200] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[201 <-
    (((zeroextu32 a{hr}.[201] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[202 <-
    (((zeroextu32 a{hr}.[202] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[203 <-
    (((zeroextu32 a{hr}.[203] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[204 <-
    (((zeroextu32 a{hr}.[204] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[205 <-
    (((zeroextu32 a{hr}.[205] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[206 <-
    (((zeroextu32 a{hr}.[206] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[207 <-
    (((zeroextu32 a{hr}.[207] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[208 <-
    (((zeroextu32 a{hr}.[208] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[209 <-
    (((zeroextu32 a{hr}.[209] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[210 <-
    (((zeroextu32 a{hr}.[210] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[211 <-
    (((zeroextu32 a{hr}.[211] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[212 <-
    (((zeroextu32 a{hr}.[212] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[213 <-
    (((zeroextu32 a{hr}.[213] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[214 <-
    (((zeroextu32 a{hr}.[214] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[215 <-
    (((zeroextu32 a{hr}.[215] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[216 <-
    (((zeroextu32 a{hr}.[216] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[217 <-
    (((zeroextu32 a{hr}.[217] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[218 <-
    (((zeroextu32 a{hr}.[218] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[219 <-
    (((zeroextu32 a{hr}.[219] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[220 <-
    (((zeroextu32 a{hr}.[220] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[221 <-
    (((zeroextu32 a{hr}.[221] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[222 <-
    (((zeroextu32 a{hr}.[222] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[223 <-
    (((zeroextu32 a{hr}.[223] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[224 <-
    (((zeroextu32 a{hr}.[224] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[225 <-
    (((zeroextu32 a{hr}.[225] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[226 <-
    (((zeroextu32 a{hr}.[226] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[227 <-
    (((zeroextu32 a{hr}.[227] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[228 <-
    (((zeroextu32 a{hr}.[228] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[229 <-
    (((zeroextu32 a{hr}.[229] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[230 <-
    (((zeroextu32 a{hr}.[230] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[231 <-
    (((zeroextu32 a{hr}.[231] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[232 <-
    (((zeroextu32 a{hr}.[232] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[233 <-
    (((zeroextu32 a{hr}.[233] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[234 <-
    (((zeroextu32 a{hr}.[234] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[235 <-
    (((zeroextu32 a{hr}.[235] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[236 <-
    (((zeroextu32 a{hr}.[236] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[237 <-
    (((zeroextu32 a{hr}.[237] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[238 <-
    (((zeroextu32 a{hr}.[238] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[239 <-
    (((zeroextu32 a{hr}.[239] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[240 <-
    (((zeroextu32 a{hr}.[240] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[241 <-
    (((zeroextu32 a{hr}.[241] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[242 <-
    (((zeroextu32 a{hr}.[242] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[243 <-
    (((zeroextu32 a{hr}.[243] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[244 <-
    (((zeroextu32 a{hr}.[244] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[245 <-
    (((zeroextu32 a{hr}.[245] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[246 <-
    (((zeroextu32 a{hr}.[246] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[247 <-
    (((zeroextu32 a{hr}.[247] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[248 <-
    (((zeroextu32 a{hr}.[248] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[249 <-
    (((zeroextu32 a{hr}.[249] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[250 <-
    (((zeroextu32 a{hr}.[250] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[251 <-
    (((zeroextu32 a{hr}.[251] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[252 <-
    (((zeroextu32 a{hr}.[252] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[253 <-
    (((zeroextu32 a{hr}.[253] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[254 <-
    (((zeroextu32 a{hr}.[254] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one].[255 <-
    (((zeroextu32 a{hr}.[255] `<<` W8.one) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one] =
List.foldl (fun (aa : W32.t Array256.t) i => aa.[i <- 
  (((W2u16.zeroextu32 (a{hr}.[i])%Array256 `<<` W8.one)%W16 + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) `&` W32.one]) rp{hr} (iota_ 0 256)).
by rewrite -iotaredE => [].
rewrite init_set /m_decode.
split.
apply Array256.ext_eq => /> *.
rewrite !mapiE => />.
rewrite initiE => />.
rewrite /zeroextu32  qE /(`<<`) /(`>>`) to_sintE /smod => />.
have ? : (0 <= to_uint a{hr}.[x] < 3329). 
move : H; rewrite /pos_bound256_cxq qE => /> *.
move : (H x _);  first by smt().
rewrite to_sintE /smod => />. 

smt(@W16 @Ring.IntID @JWord.W16.WRingA @IntDiv to_sint_unsigned).

rewrite (_: (if 32768 <= to_uint a{hr}.[x] then to_uint a{hr}.[x] - 65536 else to_uint a{hr}.[x]) = to_uint a{hr}.[x]); first by smt(@W16).
auto => />.
rewrite W32.shlMP; first by smt().
rewrite (_: W32.one = W32.masklsb 1); first by rewrite /max /=.
rewrite W32.and_mod. by rewrite /max /=.
rewrite /max /=.
rewrite W32.to_uint_shr; first by smt().
rewrite !W32.of_uintK.
pose xx := (to_uint a{hr}.[x] * 2 + 1665) * 80635 %% W32.modulus %/ 2 ^ 28.
rewrite /balasint.
rewrite inFqK qE.
rewrite (_: to_uint a{hr}.[x] %% 3329 = to_uint a{hr}.[x]). smt().
rewrite /xx => />.
pose xxx := (to_uint a{hr}.[x] * 2 + 1665).
pose yy := xxx * 80635 %% 4294967296 %/ 268435456 %%2.
have ? : (0 <= yy < 2). smt(@W16).
rewrite /yy.
rewrite (_: 80635 = 268435456 %/ 3329). smt().
rewrite /xxx.
rewrite formula2 => />.
rewrite (_: (to_uint a{hr}.[x] * 2 + 1664) %/ 3329 %% 16 %% 2 = 
   (to_uint a{hr}.[x] * 2 + 1664) %/ 3329 %% 2); first by smt().
rewrite formula3 => />. smt().
move => ???.
rewrite !initiE //=. 
rewrite (_: W32.one = W32.masklsb 1); first by rewrite /max /=.
rewrite !W32.and_mod. by rewrite /max /=.
rewrite /max /=.
by  smt(@IntDiv).
qed.
*)

lemma poly_tomsg_ll : islossless  M.poly_tomsg.
proc.
while (0 <= i <= 32) (32-i); last by wp; call (poly_csubq_ll); auto =>  /> /#.
move => *.
wp.
while (0 <= j <= 8) (8-j); last by auto =>  /> /#.
move => *.
by auto => /> /#.
qed.

lemma poly_tomsg_corr _a : 
    phoare[ M.poly_tomsg :
             (* need some region validity on rp for 32 bytes *)
             pos_bound256_cxq a 0 256 2 /\
             lift_array256 a = _a ==>
           (* lift from region of 32 bytes from rp converted 
              to bool array is encoding of poly or decodes to poly
             map (fun x => x  = W32.one) res = m_decode _a /\ *)
             lift_array256 res = _a /\
             pos_bound256_cxq res 0 256 1] = 1%r
  by conseq poly_tomsg_ll (poly_tomsg_corr_h _a).

lemma poly_frommsg_corr_h _a : 
    hoare[ M.poly_frommsg :
             true
             (* need some region validity on rp for 32 bytes plus the lift
                of mem region decodes to _a *)
              ==>
             pos_bound256_cxq res 0 256 1 /\
             lift_array256 res = m_encode _a].
admitted.
(*
proof.
proc.
unroll for 3.
auto => />.
rewrite (_: 
(witness.[0 <- (if _a.[0] then W16.one else W16.zero) * (of_int 1665)%W16].[1 <-
    (if _a.[1] then W16.one else W16.zero) * (of_int 1665)%W16].[2 <-
    (if _a.[2] then W16.one else W16.zero) * (of_int 1665)%W16].[3 <-
    (if _a.[3] then W16.one else W16.zero) * (of_int 1665)%W16].[4 <-
    (if _a.[4] then W16.one else W16.zero) * (of_int 1665)%W16].[5 <-
    (if _a.[5] then W16.one else W16.zero) * (of_int 1665)%W16].[6 <-
    (if _a.[6] then W16.one else W16.zero) * (of_int 1665)%W16].[7 <-
    (if _a.[7] then W16.one else W16.zero) * (of_int 1665)%W16].[8 <-
    (if _a.[8] then W16.one else W16.zero) * (of_int 1665)%W16].[9 <-
    (if _a.[9] then W16.one else W16.zero) * (of_int 1665)%W16].[10 <-
    (if _a.[10] then W16.one else W16.zero) * (of_int 1665)%W16].[11 <-
    (if _a.[11] then W16.one else W16.zero) * (of_int 1665)%W16].[12 <-
    (if _a.[12] then W16.one else W16.zero) * (of_int 1665)%W16].[13 <-
    (if _a.[13] then W16.one else W16.zero) * (of_int 1665)%W16].[14 <-
    (if _a.[14] then W16.one else W16.zero) * (of_int 1665)%W16].[15 <-
    (if _a.[15] then W16.one else W16.zero) * (of_int 1665)%W16].[16 <-
    (if _a.[16] then W16.one else W16.zero) * (of_int 1665)%W16].[17 <-
    (if _a.[17] then W16.one else W16.zero) * (of_int 1665)%W16].[18 <-
    (if _a.[18] then W16.one else W16.zero) * (of_int 1665)%W16].[19 <-
    (if _a.[19] then W16.one else W16.zero) * (of_int 1665)%W16].[20 <-
    (if _a.[20] then W16.one else W16.zero) * (of_int 1665)%W16].[21 <-
    (if _a.[21] then W16.one else W16.zero) * (of_int 1665)%W16].[22 <-
    (if _a.[22] then W16.one else W16.zero) * (of_int 1665)%W16].[23 <-
    (if _a.[23] then W16.one else W16.zero) * (of_int 1665)%W16].[24 <-
    (if _a.[24] then W16.one else W16.zero) * (of_int 1665)%W16].[25 <-
    (if _a.[25] then W16.one else W16.zero) * (of_int 1665)%W16].[26 <-
    (if _a.[26] then W16.one else W16.zero) * (of_int 1665)%W16].[27 <-
    (if _a.[27] then W16.one else W16.zero) * (of_int 1665)%W16].[28 <-
    (if _a.[28] then W16.one else W16.zero) * (of_int 1665)%W16].[29 <-
    (if _a.[29] then W16.one else W16.zero) * (of_int 1665)%W16].[30 <-
    (if _a.[30] then W16.one else W16.zero) * (of_int 1665)%W16].[31 <-
    (if _a.[31] then W16.one else W16.zero) * (of_int 1665)%W16].[32 <-
    (if _a.[32] then W16.one else W16.zero) * (of_int 1665)%W16].[33 <-
    (if _a.[33] then W16.one else W16.zero) * (of_int 1665)%W16].[34 <-
    (if _a.[34] then W16.one else W16.zero) * (of_int 1665)%W16].[35 <-
    (if _a.[35] then W16.one else W16.zero) * (of_int 1665)%W16].[36 <-
    (if _a.[36] then W16.one else W16.zero) * (of_int 1665)%W16].[37 <-
    (if _a.[37] then W16.one else W16.zero) * (of_int 1665)%W16].[38 <-
    (if _a.[38] then W16.one else W16.zero) * (of_int 1665)%W16].[39 <-
    (if _a.[39] then W16.one else W16.zero) * (of_int 1665)%W16].[40 <-
    (if _a.[40] then W16.one else W16.zero) * (of_int 1665)%W16].[41 <-
    (if _a.[41] then W16.one else W16.zero) * (of_int 1665)%W16].[42 <-
    (if _a.[42] then W16.one else W16.zero) * (of_int 1665)%W16].[43 <-
    (if _a.[43] then W16.one else W16.zero) * (of_int 1665)%W16].[44 <-
    (if _a.[44] then W16.one else W16.zero) * (of_int 1665)%W16].[45 <-
    (if _a.[45] then W16.one else W16.zero) * (of_int 1665)%W16].[46 <-
    (if _a.[46] then W16.one else W16.zero) * (of_int 1665)%W16].[47 <-
    (if _a.[47] then W16.one else W16.zero) * (of_int 1665)%W16].[48 <-
    (if _a.[48] then W16.one else W16.zero) * (of_int 1665)%W16].[49 <-
    (if _a.[49] then W16.one else W16.zero) * (of_int 1665)%W16].[50 <-
    (if _a.[50] then W16.one else W16.zero) * (of_int 1665)%W16].[51 <-
    (if _a.[51] then W16.one else W16.zero) * (of_int 1665)%W16].[52 <-
    (if _a.[52] then W16.one else W16.zero) * (of_int 1665)%W16].[53 <-
    (if _a.[53] then W16.one else W16.zero) * (of_int 1665)%W16].[54 <-
    (if _a.[54] then W16.one else W16.zero) * (of_int 1665)%W16].[55 <-
    (if _a.[55] then W16.one else W16.zero) * (of_int 1665)%W16].[56 <-
    (if _a.[56] then W16.one else W16.zero) * (of_int 1665)%W16].[57 <-
    (if _a.[57] then W16.one else W16.zero) * (of_int 1665)%W16].[58 <-
    (if _a.[58] then W16.one else W16.zero) * (of_int 1665)%W16].[59 <-
    (if _a.[59] then W16.one else W16.zero) * (of_int 1665)%W16].[60 <-
    (if _a.[60] then W16.one else W16.zero) * (of_int 1665)%W16].[61 <-
    (if _a.[61] then W16.one else W16.zero) * (of_int 1665)%W16].[62 <-
    (if _a.[62] then W16.one else W16.zero) * (of_int 1665)%W16].[63 <-
    (if _a.[63] then W16.one else W16.zero) * (of_int 1665)%W16].[64 <-
    (if _a.[64] then W16.one else W16.zero) * (of_int 1665)%W16].[65 <-
    (if _a.[65] then W16.one else W16.zero) * (of_int 1665)%W16].[66 <-
    (if _a.[66] then W16.one else W16.zero) * (of_int 1665)%W16].[67 <-
    (if _a.[67] then W16.one else W16.zero) * (of_int 1665)%W16].[68 <-
    (if _a.[68] then W16.one else W16.zero) * (of_int 1665)%W16].[69 <-
    (if _a.[69] then W16.one else W16.zero) * (of_int 1665)%W16].[70 <-
    (if _a.[70] then W16.one else W16.zero) * (of_int 1665)%W16].[71 <-
    (if _a.[71] then W16.one else W16.zero) * (of_int 1665)%W16].[72 <-
    (if _a.[72] then W16.one else W16.zero) * (of_int 1665)%W16].[73 <-
    (if _a.[73] then W16.one else W16.zero) * (of_int 1665)%W16].[74 <-
    (if _a.[74] then W16.one else W16.zero) * (of_int 1665)%W16].[75 <-
    (if _a.[75] then W16.one else W16.zero) * (of_int 1665)%W16].[76 <-
    (if _a.[76] then W16.one else W16.zero) * (of_int 1665)%W16].[77 <-
    (if _a.[77] then W16.one else W16.zero) * (of_int 1665)%W16].[78 <-
    (if _a.[78] then W16.one else W16.zero) * (of_int 1665)%W16].[79 <-
    (if _a.[79] then W16.one else W16.zero) * (of_int 1665)%W16].[80 <-
    (if _a.[80] then W16.one else W16.zero) * (of_int 1665)%W16].[81 <-
    (if _a.[81] then W16.one else W16.zero) * (of_int 1665)%W16].[82 <-
    (if _a.[82] then W16.one else W16.zero) * (of_int 1665)%W16].[83 <-
    (if _a.[83] then W16.one else W16.zero) * (of_int 1665)%W16].[84 <-
    (if _a.[84] then W16.one else W16.zero) * (of_int 1665)%W16].[85 <-
    (if _a.[85] then W16.one else W16.zero) * (of_int 1665)%W16].[86 <-
    (if _a.[86] then W16.one else W16.zero) * (of_int 1665)%W16].[87 <-
    (if _a.[87] then W16.one else W16.zero) * (of_int 1665)%W16].[88 <-
    (if _a.[88] then W16.one else W16.zero) * (of_int 1665)%W16].[89 <-
    (if _a.[89] then W16.one else W16.zero) * (of_int 1665)%W16].[90 <-
    (if _a.[90] then W16.one else W16.zero) * (of_int 1665)%W16].[91 <-
    (if _a.[91] then W16.one else W16.zero) * (of_int 1665)%W16].[92 <-
    (if _a.[92] then W16.one else W16.zero) * (of_int 1665)%W16].[93 <-
    (if _a.[93] then W16.one else W16.zero) * (of_int 1665)%W16].[94 <-
    (if _a.[94] then W16.one else W16.zero) * (of_int 1665)%W16].[95 <-
    (if _a.[95] then W16.one else W16.zero) * (of_int 1665)%W16].[96 <-
    (if _a.[96] then W16.one else W16.zero) * (of_int 1665)%W16].[97 <-
    (if _a.[97] then W16.one else W16.zero) * (of_int 1665)%W16].[98 <-
    (if _a.[98] then W16.one else W16.zero) * (of_int 1665)%W16].[99 <-
    (if _a.[99] then W16.one else W16.zero) * (of_int 1665)%W16].[100 <-
    (if _a.[100] then W16.one else W16.zero) * (of_int 1665)%W16].[101 <-
    (if _a.[101] then W16.one else W16.zero) * (of_int 1665)%W16].[102 <-
    (if _a.[102] then W16.one else W16.zero) * (of_int 1665)%W16].[103 <-
    (if _a.[103] then W16.one else W16.zero) * (of_int 1665)%W16].[104 <-
    (if _a.[104] then W16.one else W16.zero) * (of_int 1665)%W16].[105 <-
    (if _a.[105] then W16.one else W16.zero) * (of_int 1665)%W16].[106 <-
    (if _a.[106] then W16.one else W16.zero) * (of_int 1665)%W16].[107 <-
    (if _a.[107] then W16.one else W16.zero) * (of_int 1665)%W16].[108 <-
    (if _a.[108] then W16.one else W16.zero) * (of_int 1665)%W16].[109 <-
    (if _a.[109] then W16.one else W16.zero) * (of_int 1665)%W16].[110 <-
    (if _a.[110] then W16.one else W16.zero) * (of_int 1665)%W16].[111 <-
    (if _a.[111] then W16.one else W16.zero) * (of_int 1665)%W16].[112 <-
    (if _a.[112] then W16.one else W16.zero) * (of_int 1665)%W16].[113 <-
    (if _a.[113] then W16.one else W16.zero) * (of_int 1665)%W16].[114 <-
    (if _a.[114] then W16.one else W16.zero) * (of_int 1665)%W16].[115 <-
    (if _a.[115] then W16.one else W16.zero) * (of_int 1665)%W16].[116 <-
    (if _a.[116] then W16.one else W16.zero) * (of_int 1665)%W16].[117 <-
    (if _a.[117] then W16.one else W16.zero) * (of_int 1665)%W16].[118 <-
    (if _a.[118] then W16.one else W16.zero) * (of_int 1665)%W16].[119 <-
    (if _a.[119] then W16.one else W16.zero) * (of_int 1665)%W16].[120 <-
    (if _a.[120] then W16.one else W16.zero) * (of_int 1665)%W16].[121 <-
    (if _a.[121] then W16.one else W16.zero) * (of_int 1665)%W16].[122 <-
    (if _a.[122] then W16.one else W16.zero) * (of_int 1665)%W16].[123 <-
    (if _a.[123] then W16.one else W16.zero) * (of_int 1665)%W16].[124 <-
    (if _a.[124] then W16.one else W16.zero) * (of_int 1665)%W16].[125 <-
    (if _a.[125] then W16.one else W16.zero) * (of_int 1665)%W16].[126 <-
    (if _a.[126] then W16.one else W16.zero) * (of_int 1665)%W16].[127 <-
    (if _a.[127] then W16.one else W16.zero) * (of_int 1665)%W16].[128 <-
    (if _a.[128] then W16.one else W16.zero) * (of_int 1665)%W16].[129 <-
    (if _a.[129] then W16.one else W16.zero) * (of_int 1665)%W16].[130 <-
    (if _a.[130] then W16.one else W16.zero) * (of_int 1665)%W16].[131 <-
    (if _a.[131] then W16.one else W16.zero) * (of_int 1665)%W16].[132 <-
    (if _a.[132] then W16.one else W16.zero) * (of_int 1665)%W16].[133 <-
    (if _a.[133] then W16.one else W16.zero) * (of_int 1665)%W16].[134 <-
    (if _a.[134] then W16.one else W16.zero) * (of_int 1665)%W16].[135 <-
    (if _a.[135] then W16.one else W16.zero) * (of_int 1665)%W16].[136 <-
    (if _a.[136] then W16.one else W16.zero) * (of_int 1665)%W16].[137 <-
    (if _a.[137] then W16.one else W16.zero) * (of_int 1665)%W16].[138 <-
    (if _a.[138] then W16.one else W16.zero) * (of_int 1665)%W16].[139 <-
    (if _a.[139] then W16.one else W16.zero) * (of_int 1665)%W16].[140 <-
    (if _a.[140] then W16.one else W16.zero) * (of_int 1665)%W16].[141 <-
    (if _a.[141] then W16.one else W16.zero) * (of_int 1665)%W16].[142 <-
    (if _a.[142] then W16.one else W16.zero) * (of_int 1665)%W16].[143 <-
    (if _a.[143] then W16.one else W16.zero) * (of_int 1665)%W16].[144 <-
    (if _a.[144] then W16.one else W16.zero) * (of_int 1665)%W16].[145 <-
    (if _a.[145] then W16.one else W16.zero) * (of_int 1665)%W16].[146 <-
    (if _a.[146] then W16.one else W16.zero) * (of_int 1665)%W16].[147 <-
    (if _a.[147] then W16.one else W16.zero) * (of_int 1665)%W16].[148 <-
    (if _a.[148] then W16.one else W16.zero) * (of_int 1665)%W16].[149 <-
    (if _a.[149] then W16.one else W16.zero) * (of_int 1665)%W16].[150 <-
    (if _a.[150] then W16.one else W16.zero) * (of_int 1665)%W16].[151 <-
    (if _a.[151] then W16.one else W16.zero) * (of_int 1665)%W16].[152 <-
    (if _a.[152] then W16.one else W16.zero) * (of_int 1665)%W16].[153 <-
    (if _a.[153] then W16.one else W16.zero) * (of_int 1665)%W16].[154 <-
    (if _a.[154] then W16.one else W16.zero) * (of_int 1665)%W16].[155 <-
    (if _a.[155] then W16.one else W16.zero) * (of_int 1665)%W16].[156 <-
    (if _a.[156] then W16.one else W16.zero) * (of_int 1665)%W16].[157 <-
    (if _a.[157] then W16.one else W16.zero) * (of_int 1665)%W16].[158 <-
    (if _a.[158] then W16.one else W16.zero) * (of_int 1665)%W16].[159 <-
    (if _a.[159] then W16.one else W16.zero) * (of_int 1665)%W16].[160 <-
    (if _a.[160] then W16.one else W16.zero) * (of_int 1665)%W16].[161 <-
    (if _a.[161] then W16.one else W16.zero) * (of_int 1665)%W16].[162 <-
    (if _a.[162] then W16.one else W16.zero) * (of_int 1665)%W16].[163 <-
    (if _a.[163] then W16.one else W16.zero) * (of_int 1665)%W16].[164 <-
    (if _a.[164] then W16.one else W16.zero) * (of_int 1665)%W16].[165 <-
    (if _a.[165] then W16.one else W16.zero) * (of_int 1665)%W16].[166 <-
    (if _a.[166] then W16.one else W16.zero) * (of_int 1665)%W16].[167 <-
    (if _a.[167] then W16.one else W16.zero) * (of_int 1665)%W16].[168 <-
    (if _a.[168] then W16.one else W16.zero) * (of_int 1665)%W16].[169 <-
    (if _a.[169] then W16.one else W16.zero) * (of_int 1665)%W16].[170 <-
    (if _a.[170] then W16.one else W16.zero) * (of_int 1665)%W16].[171 <-
    (if _a.[171] then W16.one else W16.zero) * (of_int 1665)%W16].[172 <-
    (if _a.[172] then W16.one else W16.zero) * (of_int 1665)%W16].[173 <-
    (if _a.[173] then W16.one else W16.zero) * (of_int 1665)%W16].[174 <-
    (if _a.[174] then W16.one else W16.zero) * (of_int 1665)%W16].[175 <-
    (if _a.[175] then W16.one else W16.zero) * (of_int 1665)%W16].[176 <-
    (if _a.[176] then W16.one else W16.zero) * (of_int 1665)%W16].[177 <-
    (if _a.[177] then W16.one else W16.zero) * (of_int 1665)%W16].[178 <-
    (if _a.[178] then W16.one else W16.zero) * (of_int 1665)%W16].[179 <-
    (if _a.[179] then W16.one else W16.zero) * (of_int 1665)%W16].[180 <-
    (if _a.[180] then W16.one else W16.zero) * (of_int 1665)%W16].[181 <-
    (if _a.[181] then W16.one else W16.zero) * (of_int 1665)%W16].[182 <-
    (if _a.[182] then W16.one else W16.zero) * (of_int 1665)%W16].[183 <-
    (if _a.[183] then W16.one else W16.zero) * (of_int 1665)%W16].[184 <-
    (if _a.[184] then W16.one else W16.zero) * (of_int 1665)%W16].[185 <-
    (if _a.[185] then W16.one else W16.zero) * (of_int 1665)%W16].[186 <-
    (if _a.[186] then W16.one else W16.zero) * (of_int 1665)%W16].[187 <-
    (if _a.[187] then W16.one else W16.zero) * (of_int 1665)%W16].[188 <-
    (if _a.[188] then W16.one else W16.zero) * (of_int 1665)%W16].[189 <-
    (if _a.[189] then W16.one else W16.zero) * (of_int 1665)%W16].[190 <-
    (if _a.[190] then W16.one else W16.zero) * (of_int 1665)%W16].[191 <-
    (if _a.[191] then W16.one else W16.zero) * (of_int 1665)%W16].[192 <-
    (if _a.[192] then W16.one else W16.zero) * (of_int 1665)%W16].[193 <-
    (if _a.[193] then W16.one else W16.zero) * (of_int 1665)%W16].[194 <-
    (if _a.[194] then W16.one else W16.zero) * (of_int 1665)%W16].[195 <-
    (if _a.[195] then W16.one else W16.zero) * (of_int 1665)%W16].[196 <-
    (if _a.[196] then W16.one else W16.zero) * (of_int 1665)%W16].[197 <-
    (if _a.[197] then W16.one else W16.zero) * (of_int 1665)%W16].[198 <-
    (if _a.[198] then W16.one else W16.zero) * (of_int 1665)%W16].[199 <-
    (if _a.[199] then W16.one else W16.zero) * (of_int 1665)%W16].[200 <-
    (if _a.[200] then W16.one else W16.zero) * (of_int 1665)%W16].[201 <-
    (if _a.[201] then W16.one else W16.zero) * (of_int 1665)%W16].[202 <-
    (if _a.[202] then W16.one else W16.zero) * (of_int 1665)%W16].[203 <-
    (if _a.[203] then W16.one else W16.zero) * (of_int 1665)%W16].[204 <-
    (if _a.[204] then W16.one else W16.zero) * (of_int 1665)%W16].[205 <-
    (if _a.[205] then W16.one else W16.zero) * (of_int 1665)%W16].[206 <-
    (if _a.[206] then W16.one else W16.zero) * (of_int 1665)%W16].[207 <-
    (if _a.[207] then W16.one else W16.zero) * (of_int 1665)%W16].[208 <-
    (if _a.[208] then W16.one else W16.zero) * (of_int 1665)%W16].[209 <-
    (if _a.[209] then W16.one else W16.zero) * (of_int 1665)%W16].[210 <-
    (if _a.[210] then W16.one else W16.zero) * (of_int 1665)%W16].[211 <-
    (if _a.[211] then W16.one else W16.zero) * (of_int 1665)%W16].[212 <-
    (if _a.[212] then W16.one else W16.zero) * (of_int 1665)%W16].[213 <-
    (if _a.[213] then W16.one else W16.zero) * (of_int 1665)%W16].[214 <-
    (if _a.[214] then W16.one else W16.zero) * (of_int 1665)%W16].[215 <-
    (if _a.[215] then W16.one else W16.zero) * (of_int 1665)%W16].[216 <-
    (if _a.[216] then W16.one else W16.zero) * (of_int 1665)%W16].[217 <-
    (if _a.[217] then W16.one else W16.zero) * (of_int 1665)%W16].[218 <-
    (if _a.[218] then W16.one else W16.zero) * (of_int 1665)%W16].[219 <-
    (if _a.[219] then W16.one else W16.zero) * (of_int 1665)%W16].[220 <-
    (if _a.[220] then W16.one else W16.zero) * (of_int 1665)%W16].[221 <-
    (if _a.[221] then W16.one else W16.zero) * (of_int 1665)%W16].[222 <-
    (if _a.[222] then W16.one else W16.zero) * (of_int 1665)%W16].[223 <-
    (if _a.[223] then W16.one else W16.zero) * (of_int 1665)%W16].[224 <-
    (if _a.[224] then W16.one else W16.zero) * (of_int 1665)%W16].[225 <-
    (if _a.[225] then W16.one else W16.zero) * (of_int 1665)%W16].[226 <-
    (if _a.[226] then W16.one else W16.zero) * (of_int 1665)%W16].[227 <-
    (if _a.[227] then W16.one else W16.zero) * (of_int 1665)%W16].[228 <-
    (if _a.[228] then W16.one else W16.zero) * (of_int 1665)%W16].[229 <-
    (if _a.[229] then W16.one else W16.zero) * (of_int 1665)%W16].[230 <-
    (if _a.[230] then W16.one else W16.zero) * (of_int 1665)%W16].[231 <-
    (if _a.[231] then W16.one else W16.zero) * (of_int 1665)%W16].[232 <-
    (if _a.[232] then W16.one else W16.zero) * (of_int 1665)%W16].[233 <-
    (if _a.[233] then W16.one else W16.zero) * (of_int 1665)%W16].[234 <-
    (if _a.[234] then W16.one else W16.zero) * (of_int 1665)%W16].[235 <-
    (if _a.[235] then W16.one else W16.zero) * (of_int 1665)%W16].[236 <-
    (if _a.[236] then W16.one else W16.zero) * (of_int 1665)%W16].[237 <-
    (if _a.[237] then W16.one else W16.zero) * (of_int 1665)%W16].[238 <-
    (if _a.[238] then W16.one else W16.zero) * (of_int 1665)%W16].[239 <-
    (if _a.[239] then W16.one else W16.zero) * (of_int 1665)%W16].[240 <-
    (if _a.[240] then W16.one else W16.zero) * (of_int 1665)%W16].[241 <-
    (if _a.[241] then W16.one else W16.zero) * (of_int 1665)%W16].[242 <-
    (if _a.[242] then W16.one else W16.zero) * (of_int 1665)%W16].[243 <-
    (if _a.[243] then W16.one else W16.zero) * (of_int 1665)%W16].[244 <-
    (if _a.[244] then W16.one else W16.zero) * (of_int 1665)%W16].[245 <-
    (if _a.[245] then W16.one else W16.zero) * (of_int 1665)%W16].[246 <-
    (if _a.[246] then W16.one else W16.zero) * (of_int 1665)%W16].[247 <-
    (if _a.[247] then W16.one else W16.zero) * (of_int 1665)%W16].[248 <-
    (if _a.[248] then W16.one else W16.zero) * (of_int 1665)%W16].[249 <-
    (if _a.[249] then W16.one else W16.zero) * (of_int 1665)%W16].[250 <-
    (if _a.[250] then W16.one else W16.zero) * (of_int 1665)%W16].[251 <-
    (if _a.[251] then W16.one else W16.zero) * (of_int 1665)%W16].[252 <-
    (if _a.[252] then W16.one else W16.zero) * (of_int 1665)%W16].[253 <-
    (if _a.[253] then W16.one else W16.zero) * (of_int 1665)%W16].[254 <-
    (if _a.[254] then W16.one else W16.zero) * (of_int 1665)%W16].[255 <-
    (if _a.[255] then W16.one else W16.zero) * (of_int 1665)%W16])%Array256
=
List.foldl (fun (a : W16.t Array256.t) i => a.[i <- (if _a.[i] then W16.one else W16.zero) * (W16.of_int 1665)]) witness (iota_ 0 256)).
by rewrite -iotaredE =>[].
rewrite init_set.
split. 
rewrite /pos_bound256_cxq.
move => /= *.
rewrite initiE => />.
by case (_a.[k]); rewrite to_sintE /smod qE => />. 
rewrite /m_encode /trueval /falseval qE /lift_array256 /=.
apply Array256.ext_eq => /> *.
rewrite !mapiE => />.
rewrite initiE => />.
by case (_a.[x]); rewrite to_sintE /smod => />. 
qed.
*)

lemma poly_frommsg_ll : islossless  M.poly_frommsg
 by proc; while (0 <= i <= 32) (32-i);  by  auto =>  /> /#.

lemma poly_frommsg_corr _a : 
    phoare[ M.poly_frommsg :
             true
             (* need some region validity on rp for 32 bytes plus the lift
                of mem region decodes to _a *)
              ==>
             pos_bound256_cxq res 0 256 1 /\
             lift_array256 res = m_encode _a] = 1%r
   by conseq poly_frommsg_ll (poly_frommsg_corr_h _a).


lemma poly_frommont_corr_h _a : 
    hoare[ M.poly_frommont :
             map W16.to_sint rp = _a ==>
             map W16.to_sint res = map (fun x => SREDC (x * ((R^2) %% q))) _a].
proc.
while (0 <= to_uint i <= 256 /\ dmont = W16.of_int 1353 /\
       (forall k, 0 <= k < to_uint i =>
          W16.to_sint rp.[k] =  SREDC (_a.[k] * ((R^2) %% q))) /\
       (forall k, to_uint i <= k < 256 =>
          W16.to_sint rp.[k] = _a.[k])); last first.
auto => /> &hr. 
split; first by smt(@Array256).
move => i0 rp0 H H0 H1 H2 H3. 
move : H2; rewrite (_: to_uint i0 = 256); first by move : H; rewrite ultE;  smt(@W64).
move => H2.
apply Array256.ext_eq.
move => x H4. 
rewrite mapiE; first by smt().
rewrite mapiE; first by smt().
by rewrite (H2 x H4) => />. 
sp. wp.
ecall (fqmul_corr_h (to_sint r) (to_sint dmont)).
auto => /> &hr H H0 H1 H2 H3 result H4.
split.
smt(@W64).
split.
move => k H5.
case (k < to_uint i{hr}).
move => *.
rewrite set_neqiE; first 2 by smt(@W64).
apply (H1 k _); first by smt().
move => *.
rewrite (_: k = to_uint i{hr}); first by smt(@W64).
rewrite set_eqiE; first 2 by smt(@W64).
rewrite H4. 
rewrite (H2 (to_uint i{hr}) _); first by smt(@W64).
rewrite /R qE. simplify.
congr. rewrite of_sintK => />. 
rewrite expr0 /=.
by rewrite /smod /=.
move => k H5 H6.
rewrite -(H2 k). move : H5;  rewrite to_uintD; by smt(@W64).
move : H5; rewrite to_uintD.
move : H3; rewrite ultE /=.
move => *.
rewrite set_neqiE; by smt(@W64).
qed.

lemma poly_sub_corr _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>  
      hoare[ M._poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] - _b.[k]]. 
proof.
move => H H0.
proc. 
while (
           0 <= to_uint i <= 256 /\
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (to_uint i) (ab + bb) /\ 
           forall k, 0 <= k < to_uint i =>
              inFq (to_sint rp.[k]) = _a.[k] - _b.[k]
); last first. 
auto => />. 
move => &hr H1 H2. 
do split. 
smt(@Array256). 
smt().
move => i rp H3 H4 H5 H6 k.
move : H3; rewrite ultE => />.
smt(@Array256).

wp; skip.
move => &hr [#] H1 H2 H3 H4 H5 H6 H7 H8 H9.
split; first by smt(@W64).
split; first by smt(@W64).
split; first by smt(@W64).
split; first by smt(@W64).
split; first by smt(@W64).

move : H9; rewrite ultE => /> *.

split; last first. 
move => k *.
case (k < to_uint i{hr}); first by move => *; smt(@Array256). 

move => *; rewrite (_: k = to_uint i{hr}) => />; first by smt(@W64).
rewrite set_eqiE; first 2 by smt(@W64).

move : (sub_corr ap{hr}.[to_uint i{hr}] bp{hr}.[to_uint i{hr}] _a.[to_uint i{hr}] _b.[to_uint i{hr}] 14 14 _ _ _ _ _ _) => />.
by smt(@Array256). 
by smt(@Array256). 
move :  H5; rewrite /signed_bound_cxq => />. move => *; split;  smt(@Fq).
move :  H6; rewrite /signed_bound_cxq => />. move => *; split; smt(@Fq).

rewrite /signed_bound_cxq.
move => k.
case (k < to_uint  i{hr}); first by move => *; move : H7; rewrite /signed_bound_cxq;smt(@Array256). 

move => *; rewrite (_: k = to_uint i{hr}) => />; first by smt(@W64).

move : H5; rewrite /signed_bound_cxq =>  H5.
move : (H5 (to_uint i{hr}) _); first by smt(@W64).
move : H6; rewrite /signed_bound_cxq =>  H6.
move : (H6 (to_uint i{hr}) _); first  by smt(@W64).
move => *.
rewrite /rp0.
rewrite set_eqiE; first 2 by smt(@W64).
by rewrite !to_sintB_small => />; by smt(@W16 @Ring.IntID @JWord.W16.WRingA @IntDiv to_sint_unsigned b16E qE).
qed.

lemma poly_add_corr _a _b ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      hoare[ M._poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k]]. 
proof.
move => H H0.
proc. 
while (
           0 <= to_uint i <= 256 /\
           (forall k, to_uint i <= k < 256 =>
              inFq (to_sint rp.[k]) = _a.[k]) /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp (to_uint i) 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (to_uint i) (ab + bb) /\ 
           forall k, 0 <= k < to_uint i =>
              inFq (to_sint rp.[k]) = _a.[k] + _b.[k]
); last first. 
auto => />. 
move => &hr H1 H2. 
do split. 
smt(@Array256). 
smt().
smt(@Array256).
move => i rp H3.
move : H3; rewrite ultE.
smt(@Array256).

wp; skip.
move => &hr [#] H1 H2 H3 H4 H5 H6 H7 H8 H9 rp0 i0.
move : H9; rewrite ultE => /> H9.
split; first by smt(@W64).
rewrite (_: to_uint i0 = to_uint i{hr} + 1); first  by rewrite to_uintD_small; smt(@W64).
split. 
  move => k *; move : (H3 k _);  first by smt(). 
  by rewrite /rp0 set_neqiE => /#.
split.
  move : H5; rewrite /signed_bound_cxq => H5 k *.
  move : (H5 k _); first by smt(). 
  by rewrite /rp0 set_neqiE => /#.

split.
  move : H7; rewrite /signed_bound_cxq => H7 k *.

case (k < to_uint i{hr}). 
+ move => *. move : (H7 k _); first by smt(). 
  by rewrite /rp0 set_neqiE => /#.

+ move => *;  rewrite /rp0 set_eqiE; 1,2 : smt(@W64).  
  move : (add_corr_qv rp{hr}.[to_uint i{hr}] bp{hr}.[to_uint i{hr}] _a.[to_uint i{hr}] _b.[to_uint i{hr}] 6 3 _ _ _ _ _ _) => />; first 2by smt(@Array256 @Fq). 

  move : H5; rewrite /signed_bound_cxq =>  H5.
  move : (H5 k _); first by smt(). by smt(@Fq b16E).
  move : H6; rewrite /signed_bound_cxq =>  H6.
  move : (H6 k _);  by smt(@Fq).

  move => *. 
  rewrite to_sintD_small => />.
  move : H5; rewrite /signed_bound_cxq =>  H5.
  move : (H5 (to_uint i{hr}) _); first by smt().
  move : H6; rewrite /signed_bound_cxq =>  H6.
  move : (H6 (to_uint i{hr}) _); first  by smt().
  move => *. 
  smt(@W16  b16E qE).

  move : H5; rewrite /signed_bound_cxq =>  H5.
  move : (H5 (to_uint i{hr}) _); first by smt().
  move : H6; rewrite /signed_bound_cxq =>  H6.
  move : (H6 (to_uint i{hr}) _); first  by smt().
  move => *.
  smt(@W16  b16E qE).

move =>  k *.
case (k < to_uint i{hr}). 
  move => *. move : (H8 k _); first by smt(). 
  by rewrite /rp0 set_neqiE => /#.
  move =>  *.
move => *; rewrite (_: k =to_uint i{hr}) => />; first by smt().
rewrite /rp0.
rewrite set_eqiE; first 2 by smt().

  move : (add_corr_qv rp{hr}.[to_uint i{hr}] bp{hr}.[to_uint i{hr}] _a.[to_uint i{hr}] _b.[to_uint i{hr}] 6 3 _ _ _ _ _ _) => />; first 2 by smt(@Array256 @Fq). 

  move : H5; rewrite /signed_bound_cxq =>  H5.
  move : (H5 k _); by smt(@Fq b16E).
  move : H6; rewrite /signed_bound_cxq =>  H6.
  move : (H6 k _);  by smt(@Fq).
qed.

lemma poly_reduce_corr_h (_a : Fq Array256.t):
      hoare[ M.__poly_reduce :
          _a = lift_array256 rp ==> 
          _a = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16  res.[k] (2*q)].
proof.
proc.
exists *rp; elim* => _rp.
conseq (_:
  _rp = rp /\
 (forall i, 0<= i < 256 =>
              inFq (to_sint rp.[i]) = _a.[i]) ==> 
           forall i, 0<= i < 256 =>
              to_sint rp.[i] = BREDC (to_sint _rp.[i]) 26
). 
move => &hr.
rewrite /lift_array256 => /> i H H0.
rewrite mapiE => />.
move => &hr.
rewrite /lift_array256 => /> _rp0 H.
split.
apply Array256.ext_eq => /> x *.
rewrite !mapiE => />.
move : (H x _) => />.
move : (BREDCp_corr (to_sint rp{hr}.[x]) 26 _ _ _ _ _ _) => />.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.

rewrite ?qE /R => />. 

split.
rewrite to_sintE.
have ?: 0 <= to_uint rp{hr}.[x] < W16.modulus by rewrite to_uint_cmp.
rewrite /smod /=.
case (32768 <= to_uint rp{hr}.[x]) => ?.
smt().
smt().

move => *.
rewrite !to_sintE.
rewrite /smod.
move : (W16.to_uint_cmp rp{hr}.[x]); smt().

move => a. rewrite /R /= => *.
rewrite qE /=.
split.
rewrite /Barrett_kyber_general.barrett_pred_low.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().
rewrite /Barrett_kyber_general.barrett_pred_high.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().

by smt(@W16 @Ring.IntID @JWord.W16.WRingA @IntDiv to_sint_unsigned b16E qE).

move => k *.
move : (H k _) => /> *.
move : (BREDCp_corr (to_sint rp{hr}.[k]) 26 _ _ _ _ _ _) => />.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.

rewrite ?qE /R => />. 

split.
rewrite to_sintE.
have ?: 0 <= to_uint rp{hr}.[k] < W16.modulus by rewrite to_uint_cmp.
rewrite /smod /=.
case (32768 <= to_uint rp{hr}.[k]) => ?.
smt().
smt().

move => *.
rewrite !to_sintE.
rewrite /smod.
move : (W16.to_uint_cmp rp{hr}.[k]); smt().

move => a. rewrite /R /= => *.
rewrite qE /=.
split.
rewrite /Barrett_kyber_general.barrett_pred_low.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().
rewrite /Barrett_kyber_general.barrett_pred_high.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().

by smt(@W16 @Ring.IntID @JWord.W16.WRingA @IntDiv to_sint_unsigned b16E).

while (0 <= to_uint j <= 256 /\ 
       (forall k, 0 <= k < to_uint j => to_sint rp.[k] = (BREDC (to_sint _rp.[k]) 26)) /\
       (forall k, to_uint j <= k < 256 => to_sint rp.[k] =  (to_sint _rp.[k]))); last first.
auto => /> H. 
split; first by smt().
move => ??; move : H; rewrite ultE of_uintK => />; smt(@W16 @W64).
move => *;wp; sp; ecall (barrett_reduce_corr_h (to_sint _rp.[to_uint j])); 
 auto => />. 

move => &hr H H0 H1 H2 H3; do split.
smt(@W64 @Array256).
move => H4 result H5; do split.
smt(@W64 @Array256).
smt(@W64 @Array256).
move => k H6 H7.
smt(@W64 @Array256).
move => k H6 H7.
rewrite get_setE.
move : H6. 
rewrite to_uintD_small.
smt().
smt().
have ->: k = to_uint j{hr} <=> false.
move : H6. 
rewrite to_uintD_small.
smt().
smt().
simplify.
rewrite (H2 k).
move : H6. 
rewrite to_uintD_small.
smt().
smt().
done.
qed.

lemma poly_reduce_ll:
  islossless M.__poly_reduce.
proof.
proc;while (0 <= to_uint j <= 256) (256 - to_uint j).
move => z;inline *; auto => />. 
move =>  &hr H H0 H1; do split.
smt(@W64).
smt(@W64).
move : H1.
rewrite ultE.
rewrite of_uintK /=.
move => *.
rewrite to_uintD_small.
smt().
smt().
auto => />; smt(@W64). 
qed.

lemma poly_reduce_corr (_a : Fq Array256.t):
      phoare[ M.__poly_reduce :
          _a = lift_array256 rp ==> 
          _a = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16  res.[k] (2*q)] = 1%r.
proof. by conseq poly_reduce_ll (poly_reduce_corr_h _a). qed.

lemma formula x :
  0 <= x < 3329 =>
   (x * 16 + 1665) * (268435456 %/ 3329) %% 4294967296 %/ 268435456 = (x * 16 +1664) %/ 3329 %% 16.
proof.
  have ? :
   (all
     (fun x => (x * 16 + 1665) * (268435456 %/ 3329 ) %% 4294967296 %/ 268435456 = (x * 16 +1664) %/ 3329 %% 16)
     (range 0 3329)).
by [] => />.
by smt().
qed.

lemma roundcimpl (a : W16.t) :
  bpos16 a q =>
  inFq
  (to_sint (truncateu16
         ((((zeroextu32 a `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`
           (of_int 28)%W8) `&`
          (of_int 15)%W32))) = compress 4 (inFq (to_sint a)).
proof.
rewrite -compress_alt_compress //; first smt(qE).
rewrite /zeroextu32 /truncateu16 /compress_alt qE => /> *.
rewrite (_: W32.of_int 15 = W32.masklsb 4); first by rewrite /max /=.
rewrite W32.and_mod => />. 
rewrite W32.of_uintK to_sintE.
rewrite /(`<<`) /(`>>`).
rewrite W32.shlMP; first by smt().
rewrite W32.to_uint_shr; first by smt().
rewrite W16.of_uintK.
congr.
rewrite inFqK.
rewrite to_sintE.
rewrite qE.
auto => />.
rewrite IntDiv.pmod_small. rewrite /max /=. smt(@W32).
rewrite IntDiv.pmod_small. rewrite /max /=. smt(@W32).
rewrite (IntDiv.pmod_small _ 3329). smt(@W16).
rewrite (_: (smod (to_uint a))%W16 = to_uint a). smt(@W16).
pose xx := (to_uint a * 16 + 1665).
rewrite W32.of_uintK /max => />.
pose yy := xx * 80635 %% 4294967296 %/ 268435456 %%16.
have ? : (0 <= yy < 2^16). smt(@W16).
rewrite (_: W16.smod yy =  yy). 
rewrite /smod.
simplify.
have ->: 32768 <= yy <=> false.
smt().
simplify.
done.
rewrite /yy.
rewrite (_: 80635 = 268435456 %/ 3329). smt(). 
rewrite (_: xx * (268435456 %/ 3329 ) %% 4294967296 %/ 268435456 
  = (xx -1) %/ 3329 %% 16); last by smt().
   have ? : 0 <= to_uint a < 3329. smt (@W16 to_sint_unsigned). 
rewrite /xx.
move : (formula (to_uint a)).
smt().
qed.

lemma roundcimpl_rng (a : W16.t) :
  bpos16 a q =>
  0 <= to_sint (truncateu16
         ((((zeroextu32 a `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>`
           (of_int 28)%W8) `&`
          (of_int 15)%W32)) < 16.
proof.
rewrite to_sintE; move => /> *.
rewrite (_: W32.of_int 15 = W32.masklsb 4); first by rewrite /max /=.
rewrite W32.and_mod => />. 
pose xx := (W32.of_int
             (to_uint
                (((zeroextu32 a `<<` (of_int 4)%W8) + (of_int 1665)%W32) * (of_int 80635)%W32 `>>` (of_int 28)%W8) %%
              16)).
have ? : 0<= to_uint  xx < 16; first by smt(@W32).
have ? : 0<= to_uint  (truncateu16 xx) < 16.
  rewrite /truncateu16; smt(@W16 @W32).
  by rewrite /max /= /smod;  smt(@W16).
qed.

lemma poly_compress_h ap :
      hoare[ M._poly_compress :
           ap = lift_array256 a /\
           pos_bound256_cxq a 0 256 2 
           (* missing some precondition on the validity of rp *)
           ==>
           (* Array256.map (compress 4) ap = decode 4 (region rp 128)   /\ nothing else touched /\ *)
           ap = lift_array256 res /\
           pos_bound256_cxq res 0 256 1 ].
admitted. 
(* 
proc.
seq 1 : (ap = lift_array256 a /\
           pos_bound256_cxq a 0 256 1).
call (poly_csubq_corr_h ap) => />; first by auto => />.
while (ap = lift_array256 a /\
       pos_bound256_cxq a 0 256 1 /\
       (forall k,
          0 <= k < 2* to_uint i =>
           inFq (W16.to_sint r.[k]) = roundc ap.[k]) /\
       (forall k,
            0<= k < 2*i  => 0<= to_sint r.[k] < 16) /\
       0 <= i <= 128); last first.
auto => />  *.
split. smt().
move => *. 
split; last  by smt().
move : H1; rewrite /lift_array256 => *.
apply Array256.ext_eq => /> *.
move : (H1 x _) => />; first by smt().
by rewrite !mapiE => /> ->.
auto => />.
move => *.
split.
move => *.
case (k <2*i{hr}) => /> *.
rewrite set_neqiE; first 2 by smt().
rewrite set_neqiE; first 2 by smt().
by apply (H0 k _) => />.
case (k = 2*i{hr}) => /> *.
rewrite set_neqiE; first 2 by smt().
rewrite set_eqiE; first 2 by smt().
rewrite /lift_array256 mapiE => />; first by smt().
apply (roundcimpl a{hr}.[2 * i{hr}]).
  move : H; rewrite /pos_bound256_cxq => /> *.
  by move : (H (2*i{hr}) _); smt().
rewrite (_: k = 2*i{hr} + 1); first by smt().
rewrite set_eqiE; first 2 by smt().
rewrite /lift_array256 mapiE => />; first by smt().
apply (roundcimpl a{hr}.[2 * i{hr} + 1]).
  move : H; rewrite /pos_bound256_cxq => /> *.
  by move : (H (2*i{hr} + 1) _); smt().

split; last by smt().

move : H H1; rewrite /pos_bound256_cxq => /> *.
case (k <2*i{hr}) => /> *.
rewrite set_neqiE; first 2 by smt().
rewrite set_neqiE; first 2 by smt().
by smt().
case (k = 2*i{hr}) => /> *.
rewrite set_neqiE; first 2 by smt().
rewrite set_eqiE; first 2 by smt().
by move : (roundcimpl_rng a{hr}.[2*i{hr}]); smt().
rewrite (_: k = 2*i{hr} + 1); first by smt().
rewrite set_eqiE; first 2 by smt().
by move : (roundcimpl_rng a{hr}.[2*i{hr} + 1]); smt().
qed.
*)

lemma poly_compress_ll : islossless M._poly_compress.
proc.
while (0 <= to_uint i <= 128) (128-to_uint i); last by wp; call (poly_csubq_ll); auto =>  />; smt(@W64).
move => *;  auto => /> &hr H H0.
by rewrite ultE => H1; smt(@W64).
qed.

lemma poly_compress_round_corr ap :
      phoare[ M._poly_compress :
           ap = lift_array256 a /\
           pos_bound256_cxq a 0 256 2 
           (* missing some precondition on the validity of rp *)
           ==>
           (* Array256.map (compress 4) ap = decode 4 (region rp 128)   /\ nothing else touched /\ *)
           ap = lift_array256 res /\
           pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_compress_ll (poly_compress_h ap).

lemma mul_mod_add_mod (x y z m : int) :
 (x * y %% m + z) %% m = (x * y + z) %% m.
proof. by move => *; rewrite -modzDm modz_mod modzDm. qed.


lemma poly_decompress ap :
      hoare[ M._poly_decompress :
           true
           (* add some memory region bound on ap  /\ *)
           (* lift memory region ap = encode 4 lift memory region  /\ *)
           ==>
           Array256.map (decompress 4) ap = lift_array256 res /\
           signed_bound_cxq res 0 256 1
           (* we probably need also to say that memory is untouched *) ] . 
admitted.
(*
proof.
proc.
while (#pre /\ 0 <= i <= 128 /\
     (forall k, 0 <= k < i*2 => rp.[k] = ((r.[k] * W16.of_int 3329) + W16.of_int 8) `>>` W8.of_int 4)).
  wp; skip => /> *; do split; first 2 by smt().
  move => k *.
    rewrite get_setE 1:/#.
    case (k = 2 * i{hr} + 1) => ?.
      by rewrite H6.
    rewrite get_setE 1:/#.
    case (k = 2 * i{hr}) => ?.
      by rewrite H7.
    by smt().
wp; skip => /> *; do split; first by smt().
  move => *.
  have ?: forall (k : int), 0 <= k && k < 256 => 
                            rp0.[k] = r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8 by smt().
  move : H; rewrite /pos_bound256_b.
  have ->: (forall (k0 : int), 0 <= k0 && k0 < 256 => bpos16 r{hr}.[k0] 16) =
          (forall (k0 : int), 0 <= k0 && k0 < 256 => 0 <= to_sint r{hr}.[k0] < 16) by done.
  move => *; split.
    + rewrite /lift_array256 tP => k *.
      rewrite mapE initE /= H5 /= mapE initE /= H5 /= mapE initE /= H5 /= unroundcE /= inFqK qE /= modz_small.
        by move : (H k); rewrite H5 /= /#.
      rewrite -eq_inFq H4 //.
      rewrite (W16.to_sintE (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8)) /smod /=.
      have ->: 32768 <= to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8) <=> false.
        rewrite shr_div_le // /=.
        have ?: to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16) < 2^16.
          by move : (W16.to_uint_cmp (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16)).
        by smt.
      rewrite shr_div_le /= // to_uintD of_uintK /= to_uintM of_uintK /= mul_mod_add_mod -!divz_mod_mul // qE //.
      congr; congr.
      by rewrite -to_sint_unsigned 1:/# (pmod_small _ 65536) => /#.

    + rewrite /signed_bound_cxq => k *.
      rewrite b16E; split; rewrite H4 //.
      rewrite (W16.to_sintE (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8)) /smod /=.
      have ->: 32768 <= to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8) <=> false.
        rewrite shr_div_le // /=.
        have ?: to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16) < 2^16.
          by move : (W16.to_uint_cmp (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16)).
        by smt. 
      rewrite shr_div_le /= // to_uintD of_uintK /= to_uintM of_uintK /= mul_mod_add_mod qE //.
      by rewrite -to_sint_unsigned 1:/# (pmod_small _ 65536) => /#.
      move => ?.
      rewrite (W16.to_sintE (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8)) /smod /=.
      have ->: 32768 <= to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8) <=> false.
        rewrite shr_div_le // /=.
        have ?: to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16) < 2^16.
          by move : (W16.to_uint_cmp (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16)).
        by smt. 
      rewrite shr_div_le /= // to_uintD of_uintK /= to_uintM of_uintK /= mul_mod_add_mod qE //.
      by rewrite -to_sint_unsigned 1:/# (pmod_small _ 65536) => /#.
qed.
*)



(*******DIRECT NTT *******)

import Jindcpa.

lemma zeta_bound :
   minimum_residues jzetas.
 proof.
rewrite /minimum_residues qE.
apply/(allP jzetas (fun x => bpos16 x 3329)).
simplify.
rewrite (_: 
  (fun (x : W16.t) => 0 <= to_sint x < 3329) = 
  (fun (x : W16.t) => 0 <= (if 32768 <= to_uint x then to_uint x - 65536 else to_uint x) < 3329)).
apply/fun_ext => x *.
by rewrite to_sintE /smod => />.
by rewrite /all -iotaredE; cbv delta.
qed. 

equiv ntt_correct_aux :
  NTT_Fq.NTT.ntt ~ Mderand.poly_ntt : 
        r{1} = lift_array256 rp{2} /\ 
        array_mont zetas{1} = 
           lift_array128  jzetas /\
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
split.
move : cbnd; rewrite /signed_bound_cxq => />. move => *;split;smt(@Fq).
move => *;rewrite uleE !shr_div => />.
split; last by  
   rewrite (logdiv2 (to_uint len{2}) (log2 (to_uint len{2}))); 
    [ smt(@W64) | smt(log2E) | smt(@W64) ]. 
 by exists (l-1); smt(@Ring.IntID). 


wp.

(* Inner loop *)
while (#{/~start{1} = 2*(zetasctr{1} - zetasctr1) * len{1}}
        {~signed_bound_cxq  rp{2} start{1} 256 (9 - log2 len{1})} pre /\
       zeta_{1}  *  (inFq R) = inFq (to_sint zeta_0{2}) /\  
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
split; first rewrite !to_uintD_small of_uintK => />. 
smt(@Ring.IntID @W64).
split.
smt(@Ring.IntID @W64).
split.
smt(@Ring.IntID @W64).
smt(@W64).
split. 
rewrite to_uintD_small  => />; first by smt(@W64). 
move : H; rewrite /array_mont /lift_array128 => *.
have HH : (forall x, 0 <= x < 128 =>
  (map (transpose Kyber_.FqField.( * ) (inFq R)) zetas{1}).[x] = (map (fun (x0 : W16.t) => inFq (to_sint x0)) jzetas).[x]). 
by rewrite H. 
have ? : (to_uint zetasctr{2}  < 127); first by smt(@W64).
move : (HH (to_uint zetasctr{2} + 1)_); first by smt().
rewrite mapiE; first   by smt(@W64). 
rewrite mapiE; first   by smt(@W64 @FqField).
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
have bound2 : (9 - log2 (to_uint len{2})) * Kyber_.q <= 8*Kyber_.q. 
 rewrite qE (log2E (to_uint len{2}) l) //.
case (l = 0) => ?.
move : H1.
rewrite H18.
simplify.
smt().
smt().

have bound3 : -8*Kyber_.q <=  to_sint rp{2}.[to_uint j{2} + to_uint len{2}]<= 8*Kyber_.q; first by smt().
have bound4 : -8*Kyber_.q <=  to_sint rp{2}.[to_uint j{2}]<= 8*Kyber_.q; first by smt().
have bound5 : (-R %/ 2 * Kyber_.q < -8*Kyber_.q*Kyber_.q ); first by smt(@Fq).

move :resval; rewrite to_uintD_small; first by smt(@W64). move => resval.

move : (SREDCp_corr (to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2}) _ _); first by rewrite /R qE /=.
rewrite /R qE /=.
split.

move : bound3 bound4.
rewrite qE /=.
move => /> *. smt(@W16 @Fq @FqField).
move : bound3 bound4.
rewrite qE /=.
move => /> *. smt(@W16 @Fq @FqField).

rewrite -!resval. move => sredc.

split; last first.
split.
rewrite ultE.
rewrite to_uintD_small.
smt().
rewrite to_uint1.
smt().
rewrite ultE.
rewrite to_uintD_small.
smt().
rewrite to_uint1.
smt().

split; last first.
split.
rewrite to_uintD_small. smt().
by rewrite to_uint1.
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
       move : bloose; rewrite /signed_bound_cxq. 
rewrite (log2E (to_uint len{2}) l) //.
rewrite qE /=.
move => *.
move : (H21 k).
rewrite H18 H19 /=.
smt().
    
  case (k = to_uint j{2}). 
  move => *;rewrite !Array256.set_eqiE; first 2 by smt(@W64).
rewrite (log2E (to_uint len{2}) l) //.
rewrite qE /= => *.
rewrite to_sintD_small. 
simplify.
split.
move : bound3 bound4.
rewrite qE /=.
move => /> *. smt(@W16 @Fq @FqField).
move : bound3 bound4.
rewrite qE /=.
move => /> *. smt(@W16 @Fq @FqField).
split.
move : resval.
rewrite /SREDC.
rewrite /R qE /=.
rewrite expr0.
simplify.
smt.
move : resval.
rewrite /SREDC.
rewrite /R qE /=.
rewrite expr0.
simplify.
smt.
  move => *;rewrite Array256.set_neqiE. 
split.
smt.
smt().
smt().
  rewrite Array256.set_eqiE; first 2 by smt(@W64). 
  rewrite to_sintB_small; smt(@W16 @Fq @FqField).


(*****************)
(* One goal *)
apply Array256.ext_eq.
move => x xb => />.
rewrite /lift_array256 !mapiE => />. 
split.
smt(@W64).
smt().
split.
smt(@W64).
smt().

case (x <> to_uint j{2}). 
+ case (x <> to_uint j{2} + to_uint len{2}).
   move => *.
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
      rewrite mapiE; first by smt(). by auto => />. 
   move => *.
   rewrite Array256.set_neqiE. 
split.
smt(@W64).
smt().
done.
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE. 
split.
smt(@W64).
smt().
done.
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite to_sintB_small; first by smt(@W16 @Fq @FqField).

   rewrite !inFqB.
   rewrite (_: inFq (to_sint result) = 
     inFq (to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2} * 169)); first by smt( @FqField).
   rewrite !inFqM -zetaval.
   rewrite (_: inFq (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * (zeta_{1} * inFq R) * inFq 169 = 
     inFq (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * ((zeta_{1} * inFq R) * inFq 169)); first by ring.
   rewrite (_: (zeta_{1} * inFq R) * inFq 169 = zeta_{1}). 
have ->: zeta_{1} * inFq R * inFq 169 = zeta_{1} * (inFq R * inFq 169).
smt(@FqField).
have ->: inFq R * inFq 169 = inFq 1.
have ->: inFq R * inFq 169 = inFq (R * 169).
smt(@FqField).
have ?: Fqcgr (R * 169) 1.
smt(RRinv).
rewrite -eq_inFq.
done.
smt (@FqField).
    by ring.

+ case (x <> to_uint j{2} + to_uint len{2}); last by smt(@Array256).
   move => *; rewrite (_: x = to_uint j{2}); first by smt().
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite to_sintD_small; first by smt(@W16 @Fq @FqField).

   rewrite !inFqD.
   rewrite (_: inFq (to_sint result) = 
      inFq ((to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2} * 169))); first by smt(@FqField).
      rewrite !inFqM -zetaval. 
   rewrite (_: inFq (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * (zeta_{1} * inFq R) * inFq 169 = 
     inFq (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * ((zeta_{1} * inFq R) * inFq 169)); first by ring.
   rewrite (_: (zeta_{1} * inFq R) * inFq 169 = zeta_{1}).
have ->: zeta_{1} * inFq R * inFq 169 = zeta_{1} * (inFq R * inFq 169).
smt(@FqField).
have ->: inFq R * inFq 169 = inFq 1.
have ->: inFq R * inFq 169 = inFq (R * 169).
smt(@FqField).
have ?: Fqcgr (R * 169) 1.
smt(RRinv).
rewrite -eq_inFq.
done.
smt (@FqField).

   ring.
rewrite mapE.
rewrite initE.
have ->: 0 <= to_uint j{2} && to_uint j{2} < 256.
split.
smt().
smt().
simplify.
smt(@FqField).
qed.

import NTT_Fq.
lemma ntt_correct _r :
   phoare[ Mderand.poly_ntt :
        _r = lift_array256 rp /\ 
        array_mont zetas_const = 
           lift_array128  jzetas /\
        signed_bound_cxq rp 0 256 2
          ==> 
            ntt _r = lift_array256 res /\
            forall k, 0<=k<256 => bpos16 res.[k] (2*Kyber_.q)] = 1%r.
proof.
bypr.
move => &m [#] *.
apply (eq_trans _ (Pr[NTT.ntt(_r,zetas_const) @ &m :
   ntt _r = res])).
have ? : (
Pr[NTT.ntt(_r, zetas_const) @ &m : ntt _r = res] = 
Pr[Mderand.poly_ntt(rp{m}) @ &m :
   ntt _r = lift_array256 res /\ forall (k : int), 0 <= k < 256 => bpos16 res.[k] (2 * q)]); last by rewrite H2.
byequiv ntt_correct_aux.
smt(). smt().
byphoare (ntt_spec _r). smt(). smt().
qed.

(*******INVERSE *******)

lemma zetainv_bound :
   minimum_residues jzetas_inv.
proof.
rewrite /minimum_residues qE.
apply/(allP jzetas_inv (fun x => bpos16 x 3329)).
simplify.
rewrite (_: 
  (fun (x : W16.t) => 0 <= to_sint x < 3329) = 
  (fun (x : W16.t) => 0 <= (if 32768 <= to_uint x then to_uint x - 65536 else to_uint x) < 3329)).
apply/fun_ext => x *.
rewrite to_sintE /smod => />.
by rewrite /all -iotaredE; cbv delta.
qed. 

lemma expr_pos (b e : int) :
  0 <= b => 0 <= e => 0 <= b ^ e.
proof.
move => ?.
elim e.
rewrite expr0.
done.
move => *.
rewrite exprS.
done.
smt().
qed.

equiv invntt_correct_aux :
  NTT_Fq.NTT.invntt ~ Mderand.poly_invntt : 
        r{1} = lift_array256 rp{2} /\ 
        array_mont_inv zetas_inv{1} = 
           lift_array128  jzetas_inv /\
        signed_bound_cxq rp{2} 0 256 2
          ==> 
            map (fun x => x * (inFq R)) res{1} = lift_array256 res{2} /\
            forall k, 0<=k<256 => b16 res{2}.[k] (Kyber_.q+1).
proc.
(* Dealing with final loop *)
seq 3 5 :  (r{1} = lift_array256 rp{2} /\
         zetasp{2} = jzetas_inv /\
        array_mont_inv zetas_inv{1} = 
           lift_array128  jzetas_inv /\
        signed_bound_cxq rp{2} 0 256 4
); last first.
while (j{1} = to_uint j{2} /\
       0 <= j{1} <= 256 /\
       (forall k, (0 <= k < j{1} =>
            r{1}.[k] * inFq R = inFq (to_sint rp{2}.[k])) /\
                   (j{1} <= k < 256 =>
            r{1}.[k] = inFq (to_sint rp{2}.[k]))

       ) /\
       zetas_inv.[127]{1} * inFq R * inFq R  = inFq (to_sint jzetas_inv.[127]) /\
       zeta_0{2} = jzetas_inv.[127] /\
       signed_bound_cxq rp{2} 0 256 4 /\
       (forall k, 0 <= k < j{1} =>
           b16 rp{2}.[k] (Kyber_.q + 1))
); last first. 
  wp;skip; move => &1 &2 [#] -> zp zvals zbnd??.
  split.
  do split.
  + move => *; split; first by smt().
    by move => *; rewrite /lift_array256 /= mapE /= initiE //.
  + move : zvals; rewrite /array_mont_inv /lift_array128 !mapE /=. 
    rewrite Array128.tP => *.
    move : (H 127 _) => //.
  + by rewrite /zeta_0_R zp.
  + by apply zbnd.
  + by smt(@W64 b16E @Array256).
  move => ????? ;rewrite !ultE /=.
  move => ? [#] ???. 
  rewrite (_: j_L = 256); first by smt().
  move => *.
  split.
  + rewrite /lift_array256 !mapE.
    apply Array256.ext_eq => x xb.
    rewrite !initiE //=.
    move : (H4 x) => [#] *.
    by rewrite (H9 _) //.
  + by apply H8.

sp;wp;ecall{2} (fqmul_corr (to_sint t{2}) (to_sint jzetas_inv.[127])).

skip => />; move => &1 &2 ???? zetaval  cbound tightbound ???resval.

move : cbound; rewrite /signed_bound_cxq => /> cbound. 
move : (cbound (to_uint j{2}) _) => />.
move => jboundl jboundh.

have bound4 : -4*Kyber_.q <=  to_sint rp{2}.[to_uint j{2}]<= 4*Kyber_.q; first by smt().
have bound5 : (-R %/ 2 * Kyber_.q < -4*Kyber_.q*Kyber_.q ); first by smt(@Fq).

move :resval; rewrite to_uintD_small; first by smt(@W64). move => resval.

move : (SREDCp_corr (to_sint rp{2}.[to_uint j{2}] * to_sint ((W16.of_int 1441))) _ _).
by rewrite /R qE /=.
have ? : (-R %/ 2 * Kyber_.q < -4*Kyber_.q* to_sint ((of_int 1441))%W16 ).
   by rewrite /R qE to_sintE => />; smt(@W16).
simplify => />. move : (cbound (to_uint j{2}) _); first  by smt(@Fq @W16).
move => * />. 
by move : H3 jboundl jboundh; rewrite ultE qE /R !to_sintE /smod => />;smt(@W16).

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

move => *.
split; last by smt(@Array256).

move => *.
case (k = to_uint j{2}).
   move => ->; rewrite !Array256.set_eqiE //. 
rewrite (_: r_L.[to_uint j{2}] * zetas_inv{1}.[127] * inFq R = 
   r_L.[to_uint j{2}] * zetas_inv{1}.[127] * inFq R * (inFq R * (inFq 169))).
have zzz: Fqcgr (R * 169) 1.
smt(RRinv).
move : zzz; rewrite eq_inFq inFqM => ->.
rewrite -FqField.oneE asintK.
by ring.

rewrite ComRing.mulrA.
rewrite resval.
move : (H1 (to_uint j{2})) => [#] *.
rewrite (H8 _) //.
rewrite (_: inFq (SREDC (to_sint rp{2}.[to_uint j{2}] * to_sint ((of_int 1441))%W16)) = 
   inFq ((to_sint rp{2}.[to_uint j{2}] * to_sint ((of_int 1441))%W16 * 169))); first by smt(@FqField).
have ?: Fqcgr (R * 169) 1.
smt(RRinv).
rewrite !inFqM /= of_sintK /=.
move : H9; rewrite eq_inFq inFqM.
move => *.
rewrite (_: inFq (to_sint rp{2}.[to_uint j{2}]) * zetas_inv{1}.[127] * inFq R * inFq R * inFq 169 = inFq (to_sint rp{2}.[to_uint j{2}]) * inFq (to_sint ((of_int 1441))%W16) * inFq 169). smt(@FqField).
rewrite (_: to_sint ((of_int 1441))%W16 = W16.smod 1441).
by rewrite /smod to_sintE /smod /=; smt(@W16).
done.

by move => *;rewrite !Array256.set_neqiE; smt(@W64). 
by move : H3; rewrite !ultE to_uintD_small; smt(@W64).

(***********************************)

sp.
(* Outer loop *)
while (
   zetasp{2} = jzetas_inv /\
   r{1} = lift_array256 rp{2} /\
   array_mont_inv zetas_inv{1} = lift_array128 jzetas_inv /\
   len{1} = to_uint len{2} /\
   (exists l, 1 <= l <= 8 /\ len{1} = 2^l) /\
   0 <= zetasctr{1} <= 128 /\
   zetasctr{1} = to_uint zetasctr{2} /\
   zetasctr{1} * len{1} = 128 * (len{1} - 2) /\
   signed_bound_cxq rp{2} 0 256 4); last first.
auto => />. move => &1 &2 ?cbnd.
split; first by exists (1);  smt(logs).
move : cbnd; rewrite /signed_bound_cxq. rewrite /b16 qE;smt().

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
split; first by rewrite modz_small; smt().
split; last by smt(). 
exists (l+1); smt(@Ring.IntID log2E logs).

wp.

(* Inner loop *)
while (#{/~start{1} = 2*(zetasctr{1} - zetasctr1) * len{1}} pre /\
       zeta_{1}  *  (inFq R) = inFq (to_sint zeta_0{2}) /\  
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
split; last first.
smt.
rewrite to_uintD_small; smt(@W64).

split. 
move : zetasd; rewrite /array_mont_inv /lift_array128.
move => zz.
have ? :(forall k, 0 <= k < 127 => 
  (map (transpose Kyber_.FqField.( * ) (inFq R)) zetas_inv{1}).[k] = (map (fun (x : W16.t) => inFq (to_sint x)) jzetas_inv).[k]).
rewrite -zz /= => *. rewrite set_neqiE //; first by smt().
move : (H12 (to_uint zetasctr{2})_); first by smt().
rewrite mapiE; first by smt().
rewrite mapiE; first by smt().
by simplify => />.

split; last first.
rewrite to_uintD_small. smt(). 
simplify.
have ?: 0 <= to_uint len{2}.
rewrite lenpow2.
rewrite expr_pos.
done.
smt(). 
smt().

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
          inFq (to_sint m{2}) = inFq(to_sint (s{2} + t{2})) /\ 
          bpos16 m{2} (2*Kyber_.q)).
ecall {2}  (barrett_reduce_corr (to_sint m2)) => />; first by  smt().
auto => />.
move => &1 &2 [#] ?? ?? ??   cbnd ?????? ?? zetaval ?? -> ?????? resval.

move : cbnd; rewrite /signed_bound_cxq => /> cbnd. 
 move : (cbnd (to_uint (j{2} + len{2})) _).
 rewrite to_uintD_small.   by smt(@W16 @W64). split. 
smt(@W64).
 by smt(@W16 @W64). move => jlenbound.
 move : (cbnd (to_uint j{2}) _); first by by smt(@W64). move => jbound.

move : resval.
rewrite !to_uintD_small; first by smt(@W64).
move : H12 H6 H19; rewrite !ultE uleE => *.
move  :  (BREDCp_corr (to_sint (rp{2}.[to_uint j{2} + to_uint len{2}] + rp{2}.[to_uint j{2}])) 26 _ _ _ _ _ _) => />; first 3 by rewrite /R; smt(@Fq).

move : jlenbound jbound cbnd; rewrite qE /R !to_uintD_small /=; 1: by smt(@W16).
move => jlenbound jbound cbnd.
rewrite to_sintD_small. split. 

move : jlenbound jbound.
rewrite -to_uintD_small.
smt().
smt().
move : jlenbound jbound.
rewrite -to_uintD_small.
smt().
smt().

move : jlenbound jbound.
rewrite /R => /> *.
rewrite -to_uintD_small.
smt().
rewrite to_uintD_small.
smt().
smt().

rewrite /R qE /=. move => a .
smt(@Barrett_kyber_general).

by move => ? resval; smt(@FqField).

(* Dealing with the multiplication *)
sp.

ecall {2} (fqmul_corr (to_sint t{2}) (to_sint zeta_0{2})).
skip => />.
move => &1 &2 rP_R [#] ?   ????? cbnd ??? ?? ? ?? zetaval ?? -> cmp ???? ???? resval.

move : cbnd; rewrite /signed_bound_cxq => /> cbnd. 
 move : (cbnd (to_uint (j{2} + len{2})) _). 
rewrite !to_uintD_small.
smt().
split.
have ?: 0 <= to_uint len{2}.
rewrite H2.
rewrite expr_pos.
done. smt(). 
move : (W64.to_uint_cmp j{2}) (W64.to_uint_cmp len{2}); smt(). 
smt(@W16 @W64).
 rewrite !to_uintD_small;  first 2  by smt(@W16 @W64). move => /> jlenboundl jlenboundh.
 move : (cbnd (to_uint j{2}) _); first by smt(@W64). move => /> jboundl jboundh.

have bound1 : 2 <= to_uint len{2}; first by smt(@Ring.IntID).
have bound2 : (-R %/ 2 < -4*Kyber_.q ); first by smt(@Fq).
have bound3 : (-R %/ 2 * Kyber_.q < -4*Kyber_.q*Kyber_.q ) by rewrite /R qE /=.

move : resval.
rewrite !to_uintD_small; first by smt(@W64).
move : (SREDCp_corr (to_sint (rP_R.[to_uint j{2}] - rP_R.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2}) _ _) => />; first by rewrite /R qE.
 rewrite !to_sintD_small => />.  

rewrite !to_sintN; by smt(@Fq @FqField @W16).
rewrite !to_sintN;  by smt(@Fq @FqField @W16).

 move => resbl resbh rescong resval.

split; last first. 
split.
rewrite ultE to_uintD_small 1:/# of_uintK /=.
rewrite cmp.
done.
rewrite ultE to_uintD_small 1:/# of_uintK /=.
rewrite cmp.
done.

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
smt. 
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
rewrite /lift_array256 !mapiE => />.
split.
smt(@W64).
smt().
split.
have ?: 0 <= to_uint len{2}.
smt(expr_pos).
rewrite /lift_array256 /=. 
move : (W64.to_uint_cmp j{2}) (W64.to_uint_cmp len{2}); smt(). 
smt().

case (x <> to_uint j{2} + to_uint len{2}). 
+ case (x <> to_uint j{2}). 
move => *.
rewrite Array256.set_neqiE.
split.
have ?: 0 <= to_uint len{2}.
smt(expr_pos).
smt(@W64).
smt().
done.
rewrite Array256.set_neqiE.
split.
smt(@W64).
smt().
done.
rewrite Array256.set_neqiE.
split.
have ?: 0 <= to_uint len{2}.
smt(expr_pos).
smt(@W64).
smt().
done.
rewrite Array256.set_neqiE.
split.
smt(@W64).
smt().
done.
rewrite mapiE.
done.
done.
   move => *.
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite H19.
   rewrite !to_sintD_small to_uintD_small; first  by smt().
   simplify => />. smt(@Fq @W16).
   simplify => />. smt(@Fq @W16).
   by rewrite !inFqD; ring.

+ case (x <> to_uint j{2}); last by smt(@Array256).
   move => *; rewrite (_: x = to_uint j{2}  + to_uint len{2}); first by smt().
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_eqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE. 
split.
smt(@W64).
smt().
smt().
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite mapiE; first by smt(@W64).
   rewrite resval => />. 
   rewrite (_: 
     inFq (SREDC (to_sint (rP_R.[to_uint j{2}] - rP_R.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2})) = 
     inFq ((to_sint (rP_R.[to_uint j{2}] - rP_R.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2} * 169))); first by smt(@FqField).
   rewrite (_: zeta_{1} = inFq (to_sint zeta_0{2} * 169)).
       rewrite inFqM -zetaval.
       rewrite (_: zeta_{1} * inFq R * inFq 169 =
                    zeta_{1} * (inFq R * inFq 169)); first by ring.
have ->: inFq R * inFq 169 = inFq 1.
have ->: inFq R * inFq 169 = inFq (R * 169).
smt(@FqField).
have ?: Fqcgr (R * 169) 1.
smt(RRinv).
rewrite -eq_inFq.
done.
smt (@FqField). 
 
   rewrite !to_sintD_small. rewrite to_sintN /R => />;  smt(@Fq @W16). 
   rewrite !to_sintN. 
move : jboundl jboundh.
rewrite /R qE /=.
smt(@Fq @W16 @FqField).
   by rewrite -inFqB !inFqM; ring.
qed.

lemma invntt_correct _r :
   phoare[ Mderand.poly_invntt :
        _r = lift_array256 rp /\ 
        array_mont_inv zetas_inv_const = 
           lift_array128  jzetas_inv /\
        signed_bound_cxq rp 0 256 2
          ==> 
            scale (invntt _r) (inFq R) = lift_array256 res /\
            forall k, 0<=k<256 => b16 res.[k] (Kyber_.q+1)] = 1%r.
proof.
bypr.
move => &m [#] *.
apply (eq_trans _ (Pr[NTT.invntt( _r,zetas_inv_const) @ &m :
   invntt _r = res])).
have ? : (
Pr[NTT.invntt(_r, zetas_inv_const) @ &m : invntt _r = res] = 
Pr[Mderand.poly_invntt(rp{m}) @ &m :
  invntt (map (fun x => x * (inFq R)) _r) = lift_array256 res /\ forall (k : int), 0 <= k < 256 => b16 res.[k] (q+1)]); last first.  rewrite H2.
by rewrite invntt_scale.
byequiv invntt_correct_aux.
smt().
move => ??.
rewrite invntt_scale /scale.  
move => [#] ??.
split. 
move => ->. 
split; last by apply H3.
by apply H2.
move =>  [#] ??.
move : H4; rewrite -H2.
rewrite tP !mapE.
move => *.
apply Array256.ext_eq.
move => x xb.
move : (H4 x xb).
rewrite !initiE //=.
have ? : (inFq R <> FqField.zero); first by rewrite /R; smt(@FqField qE).
by move : (FqField.FqpField.mulIf (inFq R) H6) => /#.
byphoare (invntt_spec _r). smt(). smt().
qed.


(* COMPLEX MULTIPLICATION IN MONTGOMERY MULTIPLICATION WITH SOME EXTRA
   CONSTANTS THAT ARE LEFT AROUND. THEY SHOULD BE  TRIVIAL TO MATCH WITH
   THE SPECS IN NTT_Fq, SO MAYBE THEY ARE NOT ACTUALLY NEEDED. *)

op complex_mul (a :Fq * Fq, b : Fq * Fq, zzeta : Fq) =
     (a.`2 * b.`2 * zzeta * (inFq 169) + a.`1*b.`1  * (inFq 169), 
      a.`1 * b.`2  * (inFq 169) + a.`2 * b.`1  * (inFq 169)).

op double_mul(a1 : Fq * Fq, b1 : Fq * Fq, 
              a2 : Fq * Fq, b2 : Fq * Fq, zzeta : Fq) = 
     (complex_mul a1 b1 zzeta, complex_mul a2 b2 (-zzeta)).

op base_mul(ap bp : Fq Array256.t, zetas : Fq Array128.t, 
            rs : Fq Array256.t, i : int) : bool = 
   forall k, 0 <= k < i %/ 4 =>
     ((rs.[4*k],rs.[4*k+1]),(rs.[4*k+2],rs.[4*k+3])) =
         (double_mul (ap.[4*k],ap.[4*k+1]) (bp.[4*k],bp.[4*k+1])
                    (ap.[4*k+2],ap.[4*k+3]) (bp.[4*k+2],bp.[4*k+3]) (zetas.[k+64])).


lemma poly_basemul_corr _ap _bp _zetas:
      hoare[ Mderand.poly_basemul :
        array_mont _zetas = 
           lift_array128 jzetas /\
           _ap = lift_array256 ap /\
           _bp = lift_array256 bp /\
           signed_bound_cxq ap 0 256 2 /\
           signed_bound_cxq bp 0 256 2 ==>
             signed_bound_cxq res 0 256 3 /\
             base_mul _ap _bp _zetas (lift_array256 res) 256].
proof.
move => *.
proc.
seq 2 : #pre; first by auto => />.
while (#pre /\ srp = rp /\
    0<= to_uint i <= 256 /\ to_uint i %% 4 = 0 /\
    to_uint zetasctr = to_uint i %/ 4 + 64 /\
    signed_bound_cxq rp 0 (to_uint i) 3 /\
    base_mul _ap _bp _zetas (lift_array256 rp) (to_uint i)); last first. 
    auto => />.
    move => &hr ???. 
    move => *; split; first by smt(). 
    move => ???. 
    rewrite ultE => /> ????. have -> : to_uint i0 = 256; first by smt(@W64). 
    by auto  => />. 

seq 3 : (#{/~to_uint zetasctr = to_uint i %/ 4 + 64}pre /\ inFq (to_sint zeta_0) = 
            _zetas.[to_uint i %/4 + 64] * inFq R /\ 
            to_uint zetasctr - 1 = to_uint i %/ 4 + 64 /\
             bpos16 zeta_0 Kyber_.q).

auto => />.
move => &hr mnt abnd bbnd?? ??? rbndrval.
rewrite ultE => /> *.
move :mnt; rewrite /minimum_residues /array_mont /lift_array128. 
move => ?.
split; first by  smt(@Array128).
split; first by rewrite to_uintD_small H2; smt(@W64).
move : zeta_bound; rewrite /minimum_residues =>/>.
by rewrite qE to_sintE => />; smt(@W16).

(* First complex multiplication *)

exists* (to_uint i). elim*=>ii.

seq 6 : (#pre /\ a0 = ap.[ii] /\ a1 = ap.[ii+1] /\ b0 = bp.[ii] /\ b1 = bp.[ii+1]).
    auto => /> &hr. rewrite (_: i{hr} + W64.one - W64.one = i{hr}); first by ring. 
    rewrite ultE => /> ????????. rewrite to_uintD_small; by smt(@W64).

seq  14 : (#{/~ii = to_uint i}
            {~to_uint i %% 4 = 0}
            {~inFq (to_sint zeta_0) = _zetas.[to_uint i %/ 4 + 64] * inFq R }
            {~bpos16 zeta_0 Kyber_.q}pre /\
            ii + 2 = to_uint i /\ to_uint i %% 4 = 2 /\
           inFq (to_sint zeta_0) = -_zetas.[to_uint i %/ 4 + 64] * inFq R  /\
           -Kyber_.q < to_sint zeta_0 <= 0 /\
           (inFq (to_sint rp.[ii]),inFq (to_sint rp.[ii+1])) = 
             complex_mul (inFq (to_sint ap.[ii]),inFq (to_sint ap.[ii+1])) 
                         (inFq (to_sint bp.[ii]),inFq (to_sint bp.[ii+1])) 
                         (_zetas.[ii %/4 + 64]) /\
             b16 rp.[ii] (3*Kyber_.q) /\ b16 rp.[ii+1] (3*Kyber_.q)).

seq 4 : (#pre /\
          inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+1]) * inFq (to_sint bp.[ii+1]) * 
           _zetas.[ii %/4 + 64] * (inFq 169)  + 
           inFq (to_sint ap.[ii]) * inFq (to_sint bp.[ii])  * (inFq 169) /\
           b16 r0 (3*Kyber_.q)
        ).


seq 1 : (#pre /\
           inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+1]) * inFq (to_sint bp.[ii+1])  * (inFq 169) /\
           b16 r0 (q+1)).
ecall (fqmul_corr_h (to_sint a1) (to_sint b1)).
auto => />. 
move => &hr mont bas bbs ??? pbnd  ?????? ? rval.

move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr} + 1] * to_sint bp{hr}.[to_uint i{hr} + 1]) _ _) => />; first by smt(@Fq). 

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (to_uint i{hr} + 1)) _); first by smt(@W64).
 move : (bas (to_uint i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (to_uint i{hr} + 1)) _); first by smt(@W64).
 move : (bbs (to_uint i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.
rewrite /R qE /=.
split.
move : ai1bnd.
rewrite /R qE => /> *.
smt. 
move : ai1bnd.
rewrite /R qE => /> *.
smt. 

by rewrite eq_inFq -rval !inFqM; smt(@Fq).

seq 1 : (#{~inFq (to_sint r0) = inFq (to_sint ap.[ii + 1]) * inFq (to_sint bp.[ii + 1]) * inFq 169}pre /\
           inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+1]) * inFq (to_sint bp.[ii+1]) *
               _zetas.[ii %/ 4 + 64] * (inFq 169) /\
           b16 r0 (q+1)).
ecall (fqmul_corr_h (to_sint r0) (to_sint zeta_0)).
auto => />. 
move => &hr mont bas bbs ???pbndt  ??zetaval ??? r0val ???rval.

move : (SREDCp_corr (to_sint r0{hr} * to_sint zeta_0{hr}) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM r0val. 

move => ?? ->.

split; first by  smt(@Fq).
split; last by  smt(@Fq).

rewrite zetaval.
have ? : (inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 *
(_zetas.[to_uint i{hr} %/4 + 64] * inFq R) * inFq 169 =
inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 *
_zetas.[to_uint i{hr} %/4 + 64] * (inFq (R * 169))
); first by  rewrite inFqM; ring. 

have ->: inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 *
(_zetas.[to_uint i{hr} %/ 4 + 64] * inFq R) * inFq 169 = 
inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 *
_zetas.[to_uint i{hr} %/4 + 64] * (inFq R * inFq 169).
smt(@FqField).
have ->: inFq R * inFq 169 = inFq 1.
have ->: inFq R * inFq 169 = inFq (R * 169).
smt(@FqField).
have ?: Fqcgr (R * 169) 1.
smt(RRinv).
rewrite -eq_inFq.
done.
have ->: inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 * _zetas.[ to_uint i{hr}  %/4 + 64] *
inFq 1 = inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 * _zetas.[to_uint i{hr} %/4 + 64].
smt(@FqField).
have ->: inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 * _zetas.[to_uint i{hr} %/ 4 + 64] = inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * (inFq 169 * _zetas.[to_uint i{hr} %/ 4 + 64]).
smt(@FqField).
smt(@FqField).

wp.
ecall (fqmul_corr_h (to_sint a0) (to_sint b0)).
auto => />. 
move => &hr mnt bas bbs ??? rbnd rv ? zval ????? r0val ?rval.

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (to_uint i{hr} + 1)) _); first by smt(@W64).
 move : (bas (to_uint i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (to_uint i{hr} + 1)) _); first by smt(@W64).
 move : (bbs (to_uint i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.

move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}] * to_sint bp{hr}.[to_uint i{hr}]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.

rewrite !to_sintD_small. smt(@Fq).
split.
rewrite  !inFqD rrval. 
by smt(@Fq). 
by smt(@Fq).

(**************)
wp.

ecall (fqmul_corr_h (to_sint a1) (to_sint b0)).
ecall (fqmul_corr_h (to_sint a0) (to_sint b1)).

auto => />.

move => &hr mnt bas bbs ??? rbnd rv ? zval ??? r0val ??? rval ?rvall. 

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (to_uint i{hr} + 1)) _); first by smt(@W64).
 move : (bas (to_uint i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (to_uint i{hr} + 1)) _); first by smt(@W64).
 move : (bbs (to_uint i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.

rewrite !to_uintD_small; first 2 by smt(@W64).
move : H2; rewrite !ultE => /> *.

split.

split; first by smt(@W64).
split; first by smt(@W64).

split.

move => k kl kh.
case (k = to_uint  i{hr}). 
  move =>*; rewrite Array256.set_neqiE; first 2 by smt(). rewrite qE. smt(@Array256). 
case (k = to_uint i{hr}+1). 
  move => *. rewrite Array256.set_eqiE; first 2 by smt(). 
   rewrite qE to_sintD_small => />.

(*********************)
(*********************)

move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}] * to_sint bp{hr}.[to_uint i{hr} + 1]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr} + 1] * to_sint bp{hr}.[to_uint i{hr}]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

smt(@Fq).


move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}] * to_sint bp{hr}.[to_uint i{hr} + 1]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr} + 1] * to_sint bp{hr}.[to_uint i{hr}]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

smt(@Fq).



(*********************)
(********************)
move => *.
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 

move : rbnd; rewrite /signed_bound_cxq => rbnd. 
move : (rbnd k). rewrite b16E.
smt(@Fq).

split.

rewrite /base_mul.

move =>  k kb.

rewrite /lift_array256 !mapiE; first 12 by smt(). 
rewrite !Array256.set_neqiE; first 16 by smt(@W64). 

simplify => />.

move : rv; rewrite /base_mul => rv.

move : (rv k _); first by smt().
rewrite /lift_array256 !mapiE; first 12 by smt(). 
simplify => />.

rewrite !to_uintD_small; first by smt(@W64).

split; first by smt(@W64).
smt(@Fq).

split; first by smt(@W64).

split.
move : H4 H5 zval; rewrite qE => *.
rewrite to_sintN. smt(@W16).
rewrite (_: (to_uint i{hr} + 2) %/ 4 = to_uint i{hr} %/4); first  by smt().
ring. rewrite FqField.ComRing.mulrC -H8 inFqN. 
by  ring.

move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}] * to_sint bp{hr}.[to_uint i{hr} + 1]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr} + 1] * to_sint bp{hr}.[to_uint i{hr}]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 


split.  
move : H4 H5 zval; rewrite qE => *.
rewrite to_sintN; smt(@W16).
 
split.  rewrite !to_sintD_small. by smt(qE @W16). 
rewrite inFqD.
rewrite rrval rrvall. smt(@FqP).

rewrite to_sintD_small; smt(@Fq).

(* Second complex multiplication *)

seq 6 : (#{/~a0 = ap.[ii]}{~a1 = ap.[ii+1]}{~b0 = bp.[ii]}{~b1 = bp.[ii+1]}pre /\ 
         a0 = ap.[ii+2] /\ a1 = ap.[ii+3] /\ 
         b0 = bp.[ii+2] /\ b1 = bp.[ii+3]).
    auto => /> &hr. 
    rewrite (_: i{hr} + W64.one - W64.one = i{hr}); first by ring. 
    rewrite ultE => /> ????????????????????. 
    rewrite to_uintD_small; by smt(@W64).

seq  13 : (#{/~ii + 2 = to_uint i}
            {~to_uint i %% 4 = 2}
            {~i \ult W64.of_int 256}
            {~to_uint zetasctr{hr} - 1 = to_uint i{hr} %/ 4 + 64}
            {~inFq (to_sint zeta_0) = - _zetas.[to_uint i %/ 4 + 64] * inFq R}pre /\
            ii + 4 = to_uint i /\ to_uint i %% 4 = 0 /\ to_uint i <= 256 /\ to_uint zetasctr{hr} = to_uint i{hr} %/ 4 + 64 /\
            inFq (to_sint zeta_0) = - _zetas.[to_uint i %/ 4 - 1 + 64] * inFq R /\
           (inFq (to_sint rp.[ii+2]),inFq (to_sint rp.[ii+3])) = 
             complex_mul (inFq (to_sint ap.[ii+2]),inFq (to_sint ap.[ii+3])) 
                         (inFq (to_sint bp.[ii+2]),inFq (to_sint bp.[ii+3])) 
                         (-_zetas.[ii %/4 + 64]) /\
             b16 rp.[ii+2] (3*Kyber_.q) /\ b16 rp.[ii+3] (3*Kyber_.q)).

wp.
seq 4 : (#pre /\
          inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+3]) * inFq (to_sint bp.[ii+3]) * 
           (-_zetas.[ii %/4 + 64]) * (inFq 169)  + 
           inFq (to_sint ap.[ii+2]) * inFq (to_sint bp.[ii+2])  * (inFq 169) /\
           b16 r0 (3*Kyber_.q)
        ).
seq 1 : (#pre /\
           inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+3]) * inFq (to_sint bp.[ii+3])  * (inFq 169) /\
           b16 r0 (q+1)).
ecall (fqmul_corr_h (to_sint a1) (to_sint b1)).
auto => />. 
move => &hr mont bas bbs ?? rb rv ???? zval zbl zbh ??????? rval.

move : (SREDCp_corr (to_sint ap{hr}.[ii + 3] * to_sint bp{hr}.[ii + 3]) _ _) => />; first by smt(@Fq). 

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (ii + 3)) _); first by smt().
 move : (bas (ii+2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (ii + 3)) _); first by smt().
 move : (bbs (ii+2) _); first by smt(@W64). move => bibnd bi1bnd.
rewrite /R qE /=.
split.
move : ai1bnd.
rewrite /R qE => /> *.
smt. 
move : ai1bnd.
rewrite /R qE => /> *.
smt. 

by rewrite eq_inFq -rval !inFqM; smt(@Fq).

seq 1 : (#{~inFq (to_sint r0) = inFq (to_sint ap.[ii + 3]) * inFq (to_sint bp.[ii + 3]) * inFq 169}pre /\
           inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+3]) * inFq (to_sint bp.[ii+3]) *
               -_zetas.[ii %/4 +64] * (inFq 169) /\
           b16 r0 (q+1)).
ecall (fqmul_corr_h (to_sint r0) (to_sint zeta_0)).
auto => />.
move => &hr mont bas bbs ?? rb rv ???? zval zbl zbh ?????? r0val ???rval.

move : (SREDCp_corr (to_sint r0{hr} * to_sint zeta_0{hr}) _ _) => />.
  by smt(@Fq). 
  by smt(@Fq). 

rewrite eq_inFq -rval !inFqM r0val. 

move => ?? ->.

split; first by  smt(@Fq).
split; last by  smt(@Fq).

rewrite zval.
have aux : (inFq (to_sint ap{hr}.[ii + 3]) * inFq (to_sint bp{hr}.[ii + 3]) * inFq 169 *
- _zetas.[ii %/4 + 64] * inFq R * inFq 169 =
(inFq R * inFq 169) * inFq (to_sint ap{hr}.[ii + 3]) * inFq (to_sint bp{hr}.[ii + 3]) *
- _zetas.[ii %/4 + 64]  * inFq 169
); first by ring. 
move : aux.
rewrite (_: (inFq R * inFq 169)= inFq (R*169)); first by rewrite inFqM.
move : RRinv; rewrite eq_inFq => ->.
rewrite (_: inFq 1 = Kyber_.FqField.one); first by smt(@FqField). 
rewrite FqField.ComRing.mul1r. 
pose a := inFq (to_sint ap{hr}.[ii + 3]).
pose b := inFq (to_sint bp{hr}.[ii + 3]).
rewrite (_: to_uint i{hr} %/ 4 = ii %/ 4). smt().
pose z := _zetas.[ii %/ 4 + 64].
pose c := inFq 169.
pose d := inFq R.
move => XX; rewrite -XX. 
by ring.

wp.
ecall (fqmul_corr_h (to_sint a0) (to_sint b0)).
auto => />. 
move => &hr mont bas bbs ?? rb rv ???? zval zbl zbh ?????? r0val ???rval.

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (ii + 3)) _); first by smt().
 move : (bas (ii + 2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (ii + 3)) _); first by smt().
 move : (bbs (ii + 2) _); first by smt(@W64). move => bibnd bi1bnd.

move : (SREDCp_corr (to_sint ap{hr}.[ii + 2] * to_sint bp{hr}.[ii + 2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.

rewrite !to_sintD_small. smt(@Fq).
split.
rewrite  !inFqD rrval H12.  by  ring.
smt(@Fq).

ecall (fqmul_corr_h (to_sint a1) (to_sint b0)).
ecall (fqmul_corr_h (to_sint a0) (to_sint b1)).

auto => />.
move => &hr mont bas bbs ?? rb rv ???? zval zbl zbh ?????? r0val ???rval ?rvall. 

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (ii + 3)) _); first by smt().
 move : (bas (ii+2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (ii + 3)) _); first by smt().
 move : (bbs (ii + 2) _); first by smt(@W64). move => bibnd bi1bnd.

rewrite !to_uintD_small; first 2 by smt(@W64).
move : H1; rewrite !ultE => /> *.

split.

split; first by smt(@W64).
split; first by smt(@W64).

split.

move => k kl kh.
case (k = ii + 2). 
  move => *.
  rewrite Array256.set_neqiE; first 2 by smt(@W64).
  rewrite Array256.set_eqiE; first by smt(@W64). smt().  smt(@Array256 @Fq). 
  move => *.
  case (k = ii + 3).  
  move => *.
  rewrite Array256.set_eqiE; first 2 by smt(@W64). 
  rewrite to_sintD_small => />. 

move : (SREDCp_corr (to_sint ap{hr}.[ii+2] * to_sint bp{hr}.[ii + 3]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[ii + 3] * to_sint bp{hr}.[ii+2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

smt(@Fq).

move : (SREDCp_corr (to_sint ap{hr}.[ii+2] * to_sint bp{hr}.[ii + 3]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[ii + 3] * to_sint bp{hr}.[ii+2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

smt(@Fq).






move => *.

rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 

move : rb; rewrite /signed_bound_cxq => rb. 
move : (rb k). rewrite b16E.
smt(@Fq).


split.

rewrite /base_mul.

rewrite -H3.

rewrite (_: (ii + 2 + 2) %/ 4 = ii %/4 + 1). smt().

move => k kb.
rewrite /lift_array256 !mapiE; first 12 by smt(). 

case (k < ii %/4); last first.
(**************)
move => *.
have -> : k = ii %/4; first by smt(). 
have -> : 4 * (ii %/4) = ii; first by smt(). 
simplify.
move => *; rewrite Array256.set_neqiE; first 2 by smt(@W64). 
move => *; rewrite Array256.set_neqiE; first 2 by smt(@W64). 
move => *; rewrite Array256.set_neqiE; first 2 by smt(@W64). 
move => *; rewrite Array256.set_neqiE; first 2 by smt(@W64). 
move => *; rewrite Array256.set_neqiE; first 2 by smt(@W64). 
move => *; rewrite Array256.set_eqiE; first 2 by smt(@W64). 
move => *; rewrite Array256.set_eqiE; first 2 by smt(@W64). 
move :  H5 H6.
rewrite (_: odflt witness ((Sub.insub (to_sint rp{hr}.[ii] %% q)))%Sub 
    =  inFq (to_sint rp{hr}.[ii])). smt(@Sub).
rewrite (_: odflt witness ((Sub.insub (to_sint rp{hr}.[ii +1] %% q)))%Sub 
    =  inFq (to_sint rp{hr}.[ii + 1])). smt(@Sub).
move => H5 H6.
rewrite H5 H6 /double_mul /complex_mul => />.

move : (SREDCp_corr (to_sint ap{hr}.[ii+2] * to_sint bp{hr}.[ii + 3]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[ii + 3] * to_sint bp{hr}.[ii+2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

move : H14 H15 H16 H17; rewrite qE => *.
rewrite to_sintD_small =>  />. smt(@W16).

rewrite inFqD. rewrite rrval rrvall. by ring. 

(********************)
move => *.
move => *; rewrite !Array256.set_neqiE; first 16 by smt(@W64). 

move : rv; rewrite /base_mul => rv.

move : (rv k _); first by smt().
rewrite /lift_array256 !mapiE; first 12 by smt(). 
simplify => />.


rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
smt(qE).

split; first by smt(). 
split; first by smt(). 
split; first by smt(). 
split; first by smt(). 

move : (SREDCp_corr (to_sint ap{hr}.[ii+2] * to_sint bp{hr}.[ii + 3]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[ii + 3] * to_sint bp{hr}.[ii+2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

split. 
rewrite (_: (to_uint i{hr} + 2) %/ 4 + 63 = to_uint i{hr} %/ 4 + 64).
smt(@IntDiv).
smt().

rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 

move : H13 H14 H15 H16; rewrite qE => *.
rewrite to_sintD_small =>  />. smt(@W16).
rewrite inFqD. 
split; first by rewrite rrval rrvall; rewrite /complex_mul => />. 
smt(qE).

(**** FINAL GOAL *)
by  auto => />.
qed.

import NTT_Fq.

lemma basemul_scales ap bp rs :
 base_mul ap bp zetas_const rs 256 =>
  rs = scale (basemul ap bp) (inFq 169). 
rewrite /base_mul /double_mul /basemul /scale /complex_mul => /> *.
apply Array256.ext_eq => /> *.
move : (H (x %/4) _) => /> *; first by smt().
rewrite mapiE; first by smt().
move : (basemul_sem ap bp ((basemul ap bp))); rewrite /dcmplx_mul /cmplx_mul => /> *.
case (x %%4 = 0).
move => *.
move : (H6 (x %/ 4) _); first by smt().
move => [#] *.
rewrite (_: (basemul ap bp).[x] = 
  ap.[4 * (x %/4) + 1] * bp.[4 * (x %/4) + 1] * zetas_const.[(x %/4) + 64] + ap.[4 * (x %/4)] * bp.[4 * (x %/4)]). smt().
rewrite (_: x = 4 * (x %/ 4)); first by smt().
rewrite H2. 
rewrite (_: 4 * (x %/ 4) %/ 4 = (x %/ 4)); first by smt(). 
by ring.
case (x %%4 = 1).
move => *.
move : (H6 (x %/ 4) _); first by smt().
move => [#] *.
rewrite (_: (basemul ap bp).[x] = 
  ap.[4 * (x %/ 4)] * bp.[4 * (x %/ 4) + 1] + ap.[4 * (x %/ 4) + 1] * bp.[4 * (x %/ 4)]). smt().
rewrite (_: x = 4 * (x %/ 4) + 1); first by smt().
rewrite H3. 
rewrite (_: (4 * (x %/ 4) + 1) %/ 4 = (x %/ 4)); first by smt(). 
by ring.
case (x %%4 = 2).
move => *.
move : (H6 (x %/ 4) _); first by smt().
move => [#] *.
rewrite (_: (basemul ap bp).[x] = 
  ap.[4 * (x %/ 4) + 3] * bp.[4 * (x %/ 4) + 3] * - zetas_const.[x %/ 4 + 64] +
     ap.[4 * (x %/ 4) + 2] * bp.[4 * (x %/ 4) + 2]). smt().
rewrite (_: x = 4 * (x %/ 4) + 2); first by smt().
rewrite H4. 
rewrite (_: (4 * (x %/ 4) + 2) %/ 4 = (x %/ 4)); first by smt(). 
by ring.
case (x %%4 = 3).
move => *.
move : (H6 (x %/ 4) _); first by smt().
move => [#] *.
rewrite (_: (basemul ap bp).[x] = 
  ap.[4 * (x %/ 4) + 2] * bp.[4 * (x %/ 4) + 3] + ap.[4 * (x %/ 4) + 3] * bp.[4 * (x %/ 4) + 2]). smt().
rewrite (_: x = 4 * (x %/ 4) + 3); first by smt().
rewrite H5. 
rewrite (_: (4 * (x %/ 4) + 3) %/ 4 = (x %/ 4)); first by smt(). 
by ring.
smt().
qed.



end KyberPoly.
