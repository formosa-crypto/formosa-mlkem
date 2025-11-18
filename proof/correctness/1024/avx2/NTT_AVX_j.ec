require import AllCore List Int IntDiv Ring StdOrder.

from Jasmin require import JModel.

from JazzEC require import Array256 Array16 WArray32.
from JazzEC require import WArray512.
from JazzEC require import Array400 WArray800.


require import NTT_AVX_Fq_basemul MLKEMFCLib.

(******* *)

from CryptoSpecs require import GFq Correctness1024.

require import Fq.
import Zq.

require import MLKEM_Poly.
import MLKEM_Poly.


require AVX2_Ops.
require import Montgomery16.
from JazzEC require import Jkem1024_avx2 Jkem1024.

import IntOrder.

(** LEMMATA *)

lemma allP_range (P: int -> bool) n:
 (forall k, 0 <= k < n => P k) <=> all P (iota_ 0 n).
proof.
split.
 move=> H; apply/List.allP.
 by move=> k; rewrite mem_iota /#.
move => /List.allP H k Hk.
by apply H; rewrite mem_iota /#.
qed.

lemma bits64_shr32_bits16 (w: W256.t) (k i: int):
 0 <= k < 4 => 0 <= i < 2 =>
 ((w \bits64 k)%W256 `>>` (W8.of_int 32))%W64 \bits16 i
 = w \bits16 4*k+2+i.
proof.
move=> Hk; move: i; rewrite allP_range.
move: k Hk; rewrite allP_range -!iotaredE /= => />. 
by do split; apply W16.all_eq_eq; rewrite /all_eq /=;
 rewrite /(`>>`) of_uintK shrwE //=.
qed.

lemma bits32_shl16_bits16H (w: W256.t) k:
 0 <= k < 8 => 
 (w \bits32 k) `<<` W8.of_int 16 \bits16 1
 = w \bits16 2*k.
proof.
move: k; rewrite allP_range -!iotaredE /= => />. 
by do split; apply W16.all_eq_eq; rewrite /all_eq /=;
 rewrite /(`<<`) of_uintK shlwE //=.
qed.

lemma bits32_shr16_bits16L (w: W256.t) k:
 0 <= k < 8 => 
 (w \bits32 k) `>>` W8.of_int 16 \bits16 0
 = w \bits16 2*k + 1.
proof.
move: k; rewrite allP_range -!iotaredE /= => />. 
by do split; apply W16.all_eq_eq; rewrite /all_eq /=;
 rewrite /(`>>`) of_uintK shrwE //=.
qed.



lemma R2C_pack16 k l:
 0 <= k < 16 =>
 (R2C (W16u16.pack16 l)).[k] = nth W16.zero l k.
proof. move=> Hk; rewrite /R2C initiE //= pack16bE //= get_of_list //. 
qed.


lemma P2C_map ['a] (f: 'a -> 'a) a k: 
 0 <= k < 16 =>
 P2C (Array256.map f a) k = map f (P2C a k).
proof.
move => Hk; rewrite /P2C /pchunk initiE //= Array16.mapE // tP => i Hi.
by rewrite !initiE //= mapiE 1:/# initiE //=.
qed.

lemma R2C_map2 f x y k:
 0 <= k < 16 =>
 (R2C (W16u16.map2 f x y)).[k] = f (R2C x).[k] (R2C y).[k].
proof. by move: k; rewrite allP_range -iotaredE /R2C. qed.

(** scaling *)
abbrev mul1x16 (y: coeff): coeff Array16.t -> coeff Array16.t =
 Array16.map (( *) y).

lemma mul1x16_comp y z x:
 mul1x16 y (mul1x16 z x) = mul1x16 (z*y) x.
proof. by rewrite tP => i Hi; rewrite !mapiE //=; ring. qed.

abbrev mul1x256 (y: coeff): coeff Array256.t -> coeff Array256.t =
 Array256.map (( *) y). 

abbrev mul16x16 = Array16.map2 Zq.( *).

lemma P2C_mul1x16 x (l: coeff Array16.t list) k:
  size l = 16 =>
  0 <= k < 16 =>
  P2C (Array256.init (fun i=>(CS2P l).[i]*x)) k
  = mul1x16 x (nth witness l k).
proof.
move=> Hsize Hk.
have ->: Array256.init (fun i => (CS2P l).[i]*x)
         = CS2P (List.map (Array16.map (fun y=>y*x)) l).
 rewrite tP => i Hi /=.
 rewrite initiE 1:/# /=.
 rewrite /CS2P /punchunk !initiE //= !get_of_list 1..2:/#.
 by rewrite (nth_map witness) 1:/# mapE initiE 1:/# /=. 
rewrite P2C_i 1://.
 by rewrite size_map.
by rewrite (nth_map witness) 1..2://; smt().
qed.


(** IMPLEMENTATION RELATIONS
  (obs: perhaps a nice use-case for type-classes...) *)

abbrev incoeffW16 (w: W16.t) : coeff = incoeff (W16.to_sint w).

(** Implementation relation (signed bounded) *)
abbrev Iu16 y x = x = incoeffW16 y.

op Iu16_sb (n: int) (y: W16.t) (x: coeff) =
 Iu16 y x /\ sint_bnd (-n*q) (n*q-1) y.

lemma Iu16_sbE n y x:
 Iu16_sb n y x <=> x = incoeffW16 y /\ (-n*q) <= to_sint y < (n*q).
proof. by rewrite /Iu16_sb; split => |> * /#. qed.

lemma Iu16_sbD (b1 b2:int) x y rx ry:
 (b1+b2)*q <= W16.max_sint =>
 Iu16_sb b1 rx x =>
 Iu16_sb b2 ry y =>
 Iu16_sb (b1+b2) (rx+ry) (x+y).
proof.
move => H [-> Hx] [-> Hy].
have Emin: -(b1*q+b2*q) = -b1*q + -b2*q by ring.
have Emax: (b1*q-1) + (b2*q-1) = (b1+b2)*q - 2 by ring.
have Hmin: W16.min_sint <= -(b1+b2)*q.
 have ?: W16.min_sint <= -W16.max_sint by done.
 by apply ler_opp2; apply (ler_trans W16.max_sint).
split.
 rewrite /Zq.(+) !incoeffK -eq_incoeff modzDm to_sintD_small //.
 split => *.
  by apply (ler_trans (- (b1 + b2)*q)) => // /#.
 apply (ler_trans ( (b1*q-1) + (b2*q-1))); first smt(). 
 apply (ler_trans ( (b1*q-1) + (b2*q-1))); first smt(). 
 by rewrite Emax; apply (ler_trans ((b1+b2)*q)) => // /#.
apply (sint_bndW _ ((-b1*q) - b2*q) (b1*q - 1 + (b2*q - 1))).
  smt().
 smt().
apply to_sintD_bnd => //.
 by rewrite -Emin -mulrDl.
rewrite Emax; apply (ler_trans ((b1+b2)*q)) => // /#.
qed.



(** Implementation relation (Scaled form, signed bounded) *)
abbrev Iu16S_sb s (n: int) (y: W16.t) (x: coeff) =
 Iu16_sb n y (x*s).

(** Implementation relation (Montgomery form, signed bounded) *)
abbrev Iu16M_sb (n: int) (y: W16.t) (x: coeff) =
 Iu16S_sb (incoeff W16.modulus) n y x.

(** Implementation relation (unsigned bounded) *)
op Iu16_ub (n: int) (y: W16.t) (x: coeff) =
 x = incoeffW16 y /\ sint_bnd 0 (n*q-1) y.

lemma Iu16_ubE n y x:
 Iu16_ub n y x <=> x = incoeffW16 y /\ 0 <= to_sint y < (n*q).
proof. rewrite /Iu16_ub; split => |> * /#. qed.

lemma Iu16_ub_of_int n:
 0 <= n < 3329 =>
 Iu16_ub 1 (W16.of_int n) (incoeff n).
proof. by move=> /> *; rewrite of_sintK smod_small /#. qed.

(** Implementation relation (Scaled form, signed bounded) *)
abbrev Iu16S_ub s (n: int) (y: W16.t) (x: coeff) =
 Iu16_ub n y (x*s).

(** Implementation relation (Montgomery form, unsigned bounded) *)
abbrev Iu16M_ub (n: int) (y: W16.t) (x: coeff) =
 Iu16S_ub (incoeff W16.modulus) n y x.

(** Implementation relation over chunks *)
abbrev I16u16 y (x:coeff Array16.t) = 
 all (fun k=>Iu16 (R2C y).[k] x.[k]) (iota_ 0 16).

abbrev I16u16_sb (n:int) (y: W256.t) (x: coeff Array16.t) =
 all (fun k=> Iu16_sb n (R2C y).[k] x.[k]) (iota_ 0 16).

abbrev I16u16S_sb z (n:int) (y: W256.t) (x: coeff Array16.t) =
 all (fun k=> Iu16S_sb z n (R2C y).[k] x.[k]) (iota_ 0 16).

abbrev I16u16M_sb (n:int) (y: W256.t) (x: coeff Array16.t) =
 all (fun k=> Iu16M_sb n (R2C y).[k] x.[k]) (iota_ 0 16).

lemma I16u16_sb_map n (z: coeff) x y:
 I16u16_sb n y (Array16.map (( * ) z) x) = I16u16S_sb z n y x.
proof. by rewrite -{1 2}iotaredE /= /#. qed.

lemma I16u16S_sb_map n (z1 z2: coeff) x y:
 I16u16S_sb z1 n y (Array16.map (( * ) z2) x)
 = I16u16S_sb (z2*z1) n y x.
proof.
rewrite -!I16u16_sb_map.
pose a1 := Array16.map _ _.
pose a2 := Array16.map _ _.
have: a1=a2.
 rewrite /a1 /a2 tP => i Hi.
 by rewrite !mapiE //=; ring.
by move => ->.
qed.

abbrev I16u16_ub (n:int) (y: W256.t) (x: coeff Array16.t) =
 all (fun k=> Iu16_ub n (R2C y).[k] x.[k]) (iota_ 0 16).

lemma I16u16_ub_sb n y x: I16u16_ub n y x => I16u16_sb n y x.
proof.
move=> /List.allP H; apply/List.allP => i Hi /=.
move: (H i Hi) => [Hv Hb]; split; first done.
by apply (sint_bndW _ _ _ _ _ _ _ Hb); smt().
qed.

abbrev I16u16S_ub z (n:int) (y: W256.t) (x: coeff Array16.t) =
 all (fun k=> Iu16S_ub z n (R2C y).[k] x.[k]) (iota_ 0 16).
 
abbrev I16u16M_ub (n:int) (y: W256.t) (x: coeff Array16.t) =
 all (fun k=> Iu16M_ub n (R2C y).[k] x.[k]) (iota_ 0 16).

(** Implementation relation over polynomials *)
abbrev I256u16_sb (n:int) (y: W16.t Array256.t ) (x: coeff Array256.t) =
 all (fun k=> I16u16_sb n (P2R y k) (P2C x k)) (iota_ 0 16).

lemma I256u16_sbP n y x:
 I256u16_sb n y x
 <=> all (fun k=> Iu16_sb n y.[k] x.[k]) (iota_ 0 256).
proof. by rewrite -iotaredE /= !P2R2C /P2C /pchunk !initiE //=. qed.

lemma I256u16_sbE n y x:
 I256u16_sb n y x
 <=>  x = lift_array256 y /\ signed_bound_cxq y 0 256 n.
proof.
rewrite I256u16_sbP allP; split.
 move => H; split.
  rewrite tP /lift_array256 => k Hk.
  have /=Hi:= H k _; first by rewrite mem_iota /= /#.
  by rewrite mapiE 1:// /#.
 rewrite /signed_bound_cxq => k Hk.
 by have /=?/# := H k _; first by rewrite mem_iota /= /#.
move=> [-> Hb] k; rewrite mem_iota /= /lift_array256 => Hk.
by rewrite mapiE 1:/# /= /Iu16_sb sint_bnd_ltR /#.
qed.

abbrev I256u16_ub (n:int) (y: W16.t Array256.t ) (x: coeff Array256.t) =
 all (fun k=> I16u16_ub n (P2R y k) (P2C x k)) (iota_ 0 16).

lemma I256u16_ubP n y x:
 I256u16_ub n y x
 <=> all (fun k=> Iu16_ub n y.[k] x.[k]) (iota_ 0 256).
proof. by rewrite -iotaredE /= !P2R2C /P2C /pchunk !initiE //=. qed.

lemma I256u16_ubE n y x:
 I256u16_ub n y x
 <=>  x = lift_array256 y /\ pos_bound256_cxq y 0 256 n.
proof.
rewrite I256u16_ubP allP; split.
 move => H; split.
  rewrite tP /lift_array256 => k Hk.
  have /=Hi:= H k _; first by rewrite mem_iota /= /#.
  by rewrite mapiE 1:// /#.
 rewrite /pos_bound256_cxq => k Hk.
 by have /=?/# := H k _; first by rewrite mem_iota /= /#.
move=> [-> Hb] k; rewrite mem_iota /= /lift_array256 => Hk.
by rewrite mapiE 1:/# /= /Iu16_sb /#.
qed.

abbrev I256u16S_sb z (n:int) (y: W16.t Array256.t ) (x: coeff Array256.t) =
 all (fun k=> I16u16S_sb z n (P2R y k) (P2C x k)) (iota_ 0 16).

lemma I256u16S_sbP z n y x:
 I256u16S_sb z n y x
 <=> all (fun k=> Iu16S_sb z n y.[k] x.[k]) (iota_ 0 256).
proof. by rewrite -iotaredE /= !P2R2C /P2C /pchunk !initiE //=. qed.

lemma I256u16S_sbE z n y x:
 I256u16S_sb z n y x
 <=>  scale x z = lift_array256 y /\ signed_bound_cxq y 0 256 n.
proof.
rewrite I256u16S_sbP allP; split.
 move => H; split.
  rewrite tP /lift_array256 => k Hk.
  have /=Hi:= H k _; first by rewrite mem_iota /= /#.
  by rewrite !mapiE 1..2:// /= /#.
 rewrite /signed_bound_cxq => k Hk.
 by have /=?/# := H k _; first by rewrite mem_iota /= /#.
move=> [E Hb] k; rewrite mem_iota /= /lift_array256 => Hk.
rewrite /Iu16_sb. 
have ->: x.[k]*z = (scale x z).[k].
 by rewrite /scale mapiE /#.
by rewrite E mapiE 1:/# /= /Iu16_sb sint_bnd_ltR /#.
qed.

(* precomputed multiplications between zetas and qinv *)
op qinv16u16M (x y: JWord.W256.t) =
 all (fun i=> (R2C x).[i] = (R2C y).[i] * (W16.of_int 62209)) (iota_ 0 16).

lemma qinv16u16M_bits16 x y:
 qinv16u16M x y <=> forall k, 0 <= k < 16 =>
  x \bits16 k
  = W16.( *) (y \bits16 k) (W16.of_int 62209).
proof. by rewrite /qinv16u16M allP_range /R2C -!iotaredE. qed.

(* constants... *)
op x16_spec (n: int) (x: JWord.W256.t) =
 all (fun i=> (R2C x).[i] = W16.of_int n) (iota_ 0 16).

lemma x16_spec_bits16 n x:
 x16_spec n x <=> forall k, 0 <= k < 16 =>
x \bits16 k = W16.of_int n.
proof. by rewrite /x16_spec allP_range /R2C -!iotaredE. qed.

lemma x16_spec_C2R n a:
 x16_spec n (C2R a) <=> all (fun i=>a.[i]=W16.of_int n) (iotared 0 16).
proof.
rewrite iotaredE /x16_spec -!allP_range.
split.
 by move=> H k Hk /=; rewrite -(H k Hk) C2RK.
by move=> H k Hk /=; rewrite C2RK -(H k Hk).
qed.

(* Handling expanded zetas table *)
op z2u32 (a: W16.t Array400.t) (i: int): W32.t =
 get32_direct (WArray800.init16 (fun i => a.[i])) (2*i).

lemma z2u32E a k:
 0 <= k && k < 399 =>
 z2u32 a k = W2u16.pack2 [a.[k]; a.[k+1]].
proof.
move=> Hk.
have ?: 0 <= 2*k && 2*k + 3 < 800 by smt().
rewrite /z2u32 /get32_direct.
rewrite -(pack2_bits8 a.[k]) -(pack2_bits8 a.[k+1]).
rewrite W2u16_W4u8; congr.
by apply W4u8.Pack.all_eq_eq; rewrite /all_eq /= /init16 !initiE /#.
qed.

op z2u256 (a: W16.t Array400.t) (i: int): W256.t =
 get256_direct (WArray800.init16 (fun i => a.[i])) (2*i).

lemma z2u256E a k:
 0 <= k < 384 =>
 z2u256 a k = C2R (Array16.init (fun i => a.[k+i])).
proof.
move=> Hk.
rewrite /z2u256 /C2R /get256_direct; congr.
apply W32u8.Pack.ext_eq => /= i Hi.
rewrite /init16 !initiE //=.
rewrite WArray32.initiE //=.
rewrite !initiE 1..2:/# /=.
congr.
 by rewrite mulrC divzMDl.
by rewrite mulrC modzMDl.
qed.


(* Preprocessed implementation to control the expansion of defs.
   Things that change wrt the implementation:
    - global constants are turned operators (they are extracted as abbrevs);
    - get and set expressions are turned into corresponding operators.
   One should consider if such a transformation should be incorporated on the
   EC extraction.
 *)
op zetas_op = jzetas_exp.
op qx16_op = jqx16.
op qinvx16_op = jqinvx16.
op vx16_op = jvx16.
op zetas_inv_op = jzetas_inv_exp.
op flox16_op = jflox16.
op fhix16_op = jfhix16.
module Tmp = {
  proc _ntt (rp:W16.t Array256.t) : W16.t Array256.t = {   
    var zetasp: W16.t Array400.t;
    var qx16, vx16: W256.t;
    var zeta0, zeta1, zeta2, zeta3: W256.t;
    var r0, r1, r2, r3, r4, r5, r6, r7: W256.t;
    var i: int;
    zetasp <- zetas_op;
    qx16 <- C2R qx16_op;
    zeta0 <- VPBROADCAST_8u32 (z2u32 zetasp 0);
    zeta1 <- VPBROADCAST_8u32 (z2u32 zetasp 2);
    r0 <- P2R rp 0;
    r1 <- P2R rp 1;
    r2 <- P2R rp 2;
    r3 <- P2R rp 3;
    r4 <- P2R rp 8;
    r5 <- P2R rp 9;
    r6 <- P2R rp 10;
    r7 <- P2R rp 11;
    (r0, r1, r2, r3, r4, r5, r6, r7) <@Jkem1024_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
    r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
    rp <- PUR rp 0 r0;
    rp <- PUR rp 1 r1;
    rp <- PUR rp 2 r2;
    rp <- PUR rp 3 r3;
    rp <- PUR rp 8 r4;
    rp <- PUR rp 9 r5;
    rp <- PUR rp 10 r6;
    rp <- PUR rp 11 r7;
    r0 <- P2R rp 4;
    r1 <- P2R rp 5;
    r2 <- P2R rp 6;
    r3 <- P2R rp 7;
    r4 <- P2R rp 12;
    r5 <- P2R rp 13;
    r6 <- P2R rp 14;
    r7 <- P2R rp 15;
    (r0, r1, r2, r3, r4, r5, r6, r7) <@Jkem1024_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
    r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
    rp <- PUR rp 12 r4;
    rp <- PUR rp 13 r5;
    rp <- PUR rp 14 r6;
    rp <- PUR rp 15 r7;
    i <- 0;
    while (i < 2) {
      zeta0 <- VPBROADCAST_8u32 (z2u32 zetasp (4+196*i));
      zeta1 <- VPBROADCAST_8u32 (z2u32 zetasp (6+196*i));
      if (i = 0) {
        r4 <- r0;
        r5 <- r1;
        r6 <- r2;
        r7 <- r3;
      } else {
        r4 <- P2R rp (4+8*i);
        r5 <- P2R rp (5+8*i);
        r6 <- P2R rp (6+8*i);
        r7 <- P2R rp (7+8*i);
      }
      r0 <- P2R rp (0+8*i);
      r1 <- P2R rp (1+8*i);
      r2 <- P2R rp (2+8*i);
      r3 <- P2R rp (3+8*i);
      (r0, r1, r2, r3, r4, r5, r6, r7) <@Jkem1024_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
      r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (8+196*i);
      zeta1 <- z2u256 zetasp (24+196*i);
      (r0, r4) <@Jkem1024_avx2.M.__shuffle8 (r0, r4);
      (r1, r5) <@Jkem1024_avx2.M.__shuffle8 (r1, r5);
      (r2, r6) <@Jkem1024_avx2.M.__shuffle8 (r2, r6);
      (r3, r7) <@Jkem1024_avx2.M.__shuffle8 (r3, r7);
      (r0, r4, r1, r5, r2, r6, r3, r7) <@Jkem1024_avx2.M.__butterfly64x (r0, r4, r1, r5, r2,
      r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (40+196*i);
      zeta1 <- z2u256 zetasp (56+196*i);
      (r0, r2) <@Jkem1024_avx2.M.__shuffle4 (r0, r2);
      (r4, r6) <@Jkem1024_avx2.M.__shuffle4 (r4, r6);
      (r1, r3) <@Jkem1024_avx2.M.__shuffle4 (r1, r3);
      (r5, r7) <@Jkem1024_avx2.M.__shuffle4 (r5, r7);
      (r0, r2, r4, r6, r1, r3, r5, r7) <@Jkem1024_avx2.M.__butterfly64x (r0, r2, r4, r6, r1,
      r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (72+196*i);
      zeta1 <- z2u256 zetasp (88+196*i);
      (r0, r1) <@Jkem1024_avx2.M.__shuffle2 (r0, r1);
      (r2, r3) <@Jkem1024_avx2.M.__shuffle2 (r2, r3);
      (r4, r5) <@Jkem1024_avx2.M.__shuffle2 (r4, r5);
      (r6, r7) <@Jkem1024_avx2.M.__shuffle2 (r6, r7);
      (r0, r1, r2, r3, r4, r5, r6, r7) <@Jkem1024_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
      r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (104+196*i);
      zeta1 <- z2u256 zetasp (120+196*i);
      (r0, r4) <@Jkem1024_avx2.M.__shuffle1 (r0, r4);
      (r1, r5) <@Jkem1024_avx2.M.__shuffle1 (r1, r5);
      (r2, r6) <@Jkem1024_avx2.M.__shuffle1 (r2, r6);
      (r3, r7) <@Jkem1024_avx2.M.__shuffle1 (r3, r7);
      (r0, r4, r1, r5, r2, r6, r3, r7) <@Jkem1024_avx2.M.__butterfly64x (r0, r4, r1, r5, r2,
      r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (136+196*i);
      zeta1 <- z2u256 zetasp (168+196*i);
      zeta2 <- z2u256 zetasp (152+196*i);
      zeta3 <- z2u256 zetasp (184+196*i);
      (r0, r4, r2, r6, r1, r5, r3, r7) <@Jkem1024_avx2.M.__butterfly64x (r0, r4, r2, r6, r1,
      r5, r3, r7, zeta0, zeta1, zeta2, zeta3, qx16);
      vx16 <- C2R vx16_op;
      r0 <@Jkem1024_avx2.M.__red16x (r0, qx16, vx16);
      r4 <@Jkem1024_avx2.M.__red16x (r4, qx16, vx16);
      r2 <@Jkem1024_avx2.M.__red16x (r2, qx16, vx16);
      r6 <@Jkem1024_avx2.M.__red16x (r6, qx16, vx16);
      r1 <@Jkem1024_avx2.M.__red16x (r1, qx16, vx16);
      r5 <@Jkem1024_avx2.M.__red16x (r5, qx16, vx16);
      r3 <@Jkem1024_avx2.M.__red16x (r3, qx16, vx16);
      r7 <@Jkem1024_avx2.M.__red16x (r7, qx16, vx16);
      rp <- PUR rp (0+8*i) r0;
      rp <- PUR rp (1+8*i) r4;
      rp <- PUR rp (2+8*i) r1;
      rp <- PUR rp (3+8*i) r5;
      rp <- PUR rp (4+8*i) r2;
      rp <- PUR rp (5+8*i) r6;
      rp <- PUR rp (6+8*i) r3;
      rp <- PUR rp (7+8*i) r7;
      i <- i + 1;
    }
    return (rp);
  }
  proc _invntt (rp:W16.t Array256.t) : W16.t Array256.t = {
    var zetasp: W16.t Array400.t;
    var qx16, vx16, flox16, fhix16: W256.t;
    var i: int;
    var zeta0, zeta1, zeta2, zeta3: W256.t;
    var r0, r1, r2, r3, r4, r5, r6, r7: W256.t;
    zetasp <- zetas_inv_op;
    qx16 <- C2R qx16_op;
    i <- 0;
    while (i < 2) {
      zeta0 <- z2u256 zetasp (0 + (196 * i));
      zeta2 <- z2u256 zetasp (16 + (196 * i));
      zeta1 <- z2u256 zetasp (32 + (196 * i));
      zeta3 <- z2u256 zetasp (48 + (196 * i));
      r0 <- P2R rp (0+8*i);
      r1 <- P2R rp (1+8*i);
      r2 <- P2R rp (2+8*i);
      r3 <- P2R rp (3+8*i);
      r4 <- P2R rp (4+8*i);
      r5 <- P2R rp (5+8*i);
      r6 <- P2R rp (6+8*i);
      r7 <- P2R rp (7+8*i);
      (r0, r1, r4, r5, r2, r3, r6, r7) <@Jkem1024_avx2.M.__invntt___butterfly64x (r0, r1,
      r4, r5, r2, r3, r6, r7, zeta0, zeta1, zeta2, zeta3, qx16);
      (* 8 8 1 1 8 8 1 1 - 4 *)
      vx16 <- C2R vx16_op;
      zeta0 <- z2u256 zetasp (64 + (196 * i));
      zeta1 <- z2u256 zetasp (80 + (196 * i));
      r0 <@Jkem1024_avx2.M.__red16x (r0, qx16, vx16);
      r1 <@Jkem1024_avx2.M.__red16x (r1, qx16, vx16);
      r4 <@Jkem1024_avx2.M.__red16x (r4, qx16, vx16);
      r5 <@Jkem1024_avx2.M.__red16x (r5, qx16, vx16);      
      (r0, r1, r2, r3, r4, r5, r6, r7) <@Jkem1024_avx2.M.__invntt___butterfly64x (r0, r1,
      r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 4 4 2 2 1 1 1 1 - 0 *)
      (r0, r1) <@Jkem1024_avx2.M.__shuffle1 (r0, r1);
      (r2, r3) <@Jkem1024_avx2.M.__shuffle1 (r2, r3);
      (r4, r5) <@Jkem1024_avx2.M.__shuffle1 (r4, r5);
      (r6, r7) <@Jkem1024_avx2.M.__shuffle1 (r6, r7);
      zeta0 <- z2u256 zetasp (96 + (196 * i));
      zeta1 <- z2u256 zetasp (112 + (196 * i));
      (r0, r2, r4, r6, r1, r3, r5, r7) <@Jkem1024_avx2.M.__invntt___butterfly64x (r0, r2,
      r4, r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 1 4 1 2 1 2 1 - 1 *)
      r0 <@Jkem1024_avx2.M.__red16x (r0, qx16, vx16);
      (r0, r2) <@Jkem1024_avx2.M.__shuffle2 (r0, r2);
      (r4, r6) <@Jkem1024_avx2.M.__shuffle2 (r4, r6);
      (r1, r3) <@Jkem1024_avx2.M.__shuffle2 (r1, r3);
      (r5, r7) <@Jkem1024_avx2.M.__shuffle2 (r5, r7);
      zeta0 <- z2u256 zetasp (128 + (196 * i));
      zeta1 <- z2u256 zetasp (144 + (196 * i));
      (r0, r4, r1, r5, r2, r6, r3, r7) <@Jkem1024_avx2.M.__invntt___butterfly64x (r0, r4,
      r1, r5, r2, r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 2 1 1 4 2 1 1 - 1 *)
      r0 <@Jkem1024_avx2.M.__red16x (r0, qx16, vx16);
      (r0, r4) <@Jkem1024_avx2.M.__shuffle4 (r0, r4);
      (r1, r5) <@Jkem1024_avx2.M.__shuffle4 (r1, r5);
      (r2, r6) <@Jkem1024_avx2.M.__shuffle4 (r2, r6);
      (r3, r7) <@Jkem1024_avx2.M.__shuffle4 (r3, r7);
      zeta0 <- z2u256 zetasp (160 + (196 * i));
      zeta1 <- z2u256 zetasp (176 + (196 * i));
      (r0, r1, r2, r3, r4, r5, r6, r7) <@Jkem1024_avx2.M.__invntt___butterfly64x (r0, r1,
      r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 4 2 2 1 1 1 1 - 1 *)
      r0 <@Jkem1024_avx2.M.__red16x (r0, qx16, vx16);
      (r0, r1) <@Jkem1024_avx2.M.__shuffle8 (r0, r1);
      (r2, r3) <@Jkem1024_avx2.M.__shuffle8 (r2, r3);
      (r4, r5) <@Jkem1024_avx2.M.__shuffle8 (r4, r5);
      (r6, r7) <@Jkem1024_avx2.M.__shuffle8 (r6, r7);
      zeta0 <- VPBROADCAST_8u32 (z2u32 zetasp (192 + (196 * i)));
      zeta1 <- VPBROADCAST_8u32 (z2u32 zetasp (194 + (196 * i)));
      (r0, r2, r4, r6, r1, r3, r5, r7) <@Jkem1024_avx2.M.__invntt___butterfly64x (r0, r2,
      r4, r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 1 4 1 2 1 2 1 - 1 *)
      r0 <@Jkem1024_avx2.M.__red16x (r0, qx16, vx16);
      if (i = 0) {
      rp <- PUR rp (0+8*i) r0; (* 2 *)
      rp <- PUR rp (1+8*i) r2; (* 4 *)
      rp <- PUR rp (2+8*i) r4; (* 2 *)
      rp <- PUR rp (3+8*i) r6; (* 2 *)
      }
      rp <- PUR rp (4+8*i) r1; (* 1 *)
      rp <- PUR rp (5+8*i) r3; (* 1 *)
      rp <- PUR rp (6+8*i) r5; (* 1 *)
      rp <- PUR rp (7+8*i) r7; (* 1 *)
      i <- i + 1;
    }
    zeta0 <- VPBROADCAST_8u32 (z2u32 zetasp 392);
    zeta1 <- VPBROADCAST_8u32 (z2u32 zetasp 394);
    i <- 0;
    while (i < 2) {
      if (i = 0) {
        r7 <- r6;
        r6 <- r4;
        r5 <- r2;
        r4 <- r0;
      } else {
        r4 <- P2R rp (8+4*i); (* 2 *)
        r5 <- P2R rp (9+4*i); (* 4 *)
        r6 <- P2R rp (10+4*i); (* 2 *)
        r7 <- P2R rp (11+4*i); (* 2 *)
      }
      r0 <- P2R rp (0+4*i); (* 2 *)
      r1 <- P2R rp (1+4*i); (* 4 *)
      r2 <- P2R rp (2+4*i); (* 2 *)
      r3 <- P2R rp (3+4*i); (* 2 *)
      (r0, r1, r2, r3, r4, r5, r6, r7) <@Jkem1024_avx2.M.__invntt___butterfly64x (r0, r1,
        r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 4 8 4 4 1 1 1 1 *)
      flox16 <- C2R flox16_op;
      fhix16 <- C2R fhix16_op;
      rp <- PUR rp (8+4*i) r4;
      rp <- PUR rp (9+4*i) r5;
      rp <- PUR rp (10+4*i) r6;
      rp <- PUR rp (11+4*i) r7;
      r0 <@Jkem1024_avx2.M.__fqmulprecomp16x (r0, flox16, fhix16, qx16);
      r1 <@Jkem1024_avx2.M.__fqmulprecomp16x (r1, flox16, fhix16, qx16);
      r2 <@Jkem1024_avx2.M.__fqmulprecomp16x (r2, flox16, fhix16, qx16);
      r3 <@Jkem1024_avx2.M.__fqmulprecomp16x (r3, flox16, fhix16, qx16);
      rp <- PUR rp (0+4*i) r0;
      rp <- PUR rp (1+4*i) r1;
      rp <- PUR rp (2+4*i) r2;
      rp <- PUR rp (3+4*i) r3;
      i <- i + 1;
    }
    return (rp);
  }
  proc _poly_basemul (rp:W16.t Array256.t, ap:W16.t Array256.t,
                      bp:W16.t Array256.t) : W16.t Array256.t = {
    var qx16:W256.t;
    var qinvx16:W256.t;
    var zeta_0, zetaqinv:W256.t;
    var are, aim, bre, bim;
    
    qx16 <- C2R qx16_op;
    qinvx16 <- C2R qinvx16_op;

    zetaqinv <- z2u256 zetas_op 136;
    zeta_0 <- z2u256 zetas_op 152;
    are <- P2R ap 0;
    aim <- P2R ap 1;
    bre <- P2R bp 0;
    bim <- P2R bp 1;
    (are, aim) <@Jkem1024_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 0);
    rp <- PUR rp 0 are;
    rp <- PUR rp 1 aim;
    are <- P2R ap 2;
    aim <- P2R ap 3;
    bre <- P2R bp 2;
    bim <- P2R bp 3;
    (are, aim) <@Jkem1024_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 1);
    rp <- PUR rp 2 are;
    rp <- PUR rp 3 aim;

    zetaqinv <- z2u256 zetas_op 168;
    zeta_0 <- z2u256 zetas_op 184;
    are <- P2R ap 4;
    aim <- P2R ap 5;
    bre <- P2R bp 4;
    bim <- P2R bp 5;
    (are, aim) <@Jkem1024_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 0);
    rp <- PUR rp 4 are;
    rp <- PUR rp 5 aim;
    are <- P2R ap 6;
    aim <- P2R ap 7;
    bre <- P2R bp 6;
    bim <- P2R bp 7;
    (are, aim) <@Jkem1024_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 1);
    rp <- PUR rp 6 are;
    rp <- PUR rp 7 aim;


    zetaqinv <- z2u256 zetas_op 332;
    zeta_0 <- z2u256 zetas_op 348;
    are <- P2R ap 8;
    aim <- P2R ap 9;
    bre <- P2R bp 8;
    bim <- P2R bp 9;
    (are, aim) <@Jkem1024_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 0);
    rp <- PUR rp 8 are;
    rp <- PUR rp 9 aim;
    are <- P2R ap 10;
    aim <- P2R ap 11;
    bre <- P2R bp 10;
    bim <- P2R bp 11;
    (are, aim) <@Jkem1024_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 1);
    rp <- PUR rp 10 are;
    rp <- PUR rp 11 aim;

    zetaqinv <- z2u256 zetas_op 364;
    zeta_0 <- z2u256 zetas_op 380;
    are <- P2R ap 12;
    aim <- P2R ap 13;
    bre <- P2R bp 12;
    bim <- P2R bp 13;
    (are, aim) <@Jkem1024_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 0);
    rp <- PUR rp 12 are;
    rp <- PUR rp 13 aim;
    are <- P2R ap 14;
    aim <- P2R ap 15;
    bre <- P2R bp 14;
    bim <- P2R bp 15;
    (are, aim) <@Jkem1024_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 1);
    rp <- PUR rp 14 are;
    rp <- PUR rp 15 aim;

    return rp;
  }

}.

(***********************************)
(* Preprocessed <=> Implementation *)
(***********************************)

equiv basemul_avx2_eq_:
Jkem1024_avx2.M._poly_basemul ~ Tmp._poly_basemul:
 ={rp,ap,bp} ==> ={res}.
proof.
proc.
seq 8 8: (={rp,ap,bp,qx16,qinvx16,zeta_0,zetaqinv,are,aim,bre,bim}).
 by wp; skip => &1 &2; rewrite /z2u256 !P2RE //. 
seq 1 1: #pre.
 by sim.
seq 6 6: (#pre).
 by wp; skip => &1 &2; rewrite !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 8 8: (#pre).
 by wp; skip => &1 &2; rewrite /z2u256 !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 6 6: (#pre).
 by wp; skip => &1 &2; rewrite !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 8 8: (#pre).
 by wp; skip => &1 &2; rewrite /z2u256 !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 6 6: (#pre).
 by wp; skip => &1 &2; rewrite !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 8 8: (#pre).
 by wp; skip => &1 &2; rewrite /z2u256 !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 6 6: (#pre).
 by wp; skip => &1 &2; rewrite !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
by wp; skip => &1 &2; rewrite !PURE //. 
qed.

equiv ntt_avx2_eq_:
Jkem1024_avx2.M._poly_ntt ~ Tmp._ntt:
 ={rp} ==> ={res}.
proof.
proc.
sp 0 1.
seq 11 11: (#pre /\ ={r0,r1,r2,r3,r4,r5,r6,r7,zeta0,zeta1,qx16}).
 by wp; skip => &1 &2; rewrite !P2RE //. 
seq 1 1: #pre.
 by conseq />; sim.
seq 16 16: #pre.
 by wp; skip => /> &m; rewrite !P2RE // !PURE //.
seq 1 1: #pre.
 by conseq />;sim.
seq 5 5: (0 <= i{2} /\ ={i} /\ #pre).
 by wp; skip => /> &m; rewrite !PURE //.
while (#pre).
 seq 7 7: (#pre). 
 case (i{1} = 0).
 + rcondt{1} ^if; 1 : by auto. 
   rcondt{2} ^if; 1 : by auto. 
   by auto => /> *; rewrite !P2RE /#.
 + rcondf{1} ^if; 1 : by auto. 
   rcondf{2} ^if; 1 : by auto. 
   auto => /> *; do split;1..8: by rewrite /zetas_op !P2RE //= /#. 
   rewrite /zetas_op /= /z2u32 /=; do congr; smt().
   rewrite /zetas_op /= /z2u32 /=; do congr; smt().
 seq 1 1: (#pre).
  by conseq />; sim.
 seq 2 2: (#pre).
  by auto => /> *; rewrite /z2u256 !mulrDr !mulrA /=.
 seq 5 5: (#pre).
  by conseq />; sim.
 seq 2 2: (#pre).
  by auto => /> *; rewrite /z2u256 !mulrDr !mulrA /=.
 seq 5 5: (#pre).
  by conseq />; sim.
 seq 2 2: (#pre).
  by auto => /> *; rewrite /z2u256 !mulrDr !mulrA /=.
 seq 5 5: (#pre).
  by conseq />; sim.
 seq 2 2: (#pre).
  by auto => /> *; rewrite /z2u256 !mulrDr !mulrA /=.
 seq 5 5: (#pre).
  by conseq />; sim.
 seq 4 4: (={zeta2,zeta3} /\ #pre).
  by auto => /> *; rewrite /z2u256 !mulrDr !mulrA /=.
 seq 1 1: (#pre).
  by conseq />; sim.
 seq 1 1: (={vx16} /\ #pre).
  by wp; skip => &1 &2; rewrite /C2R /vx16_op /#.
 seq 8 8: (#pre).
  by conseq />; sim.
 by wp; skip => |> *; rewrite !PURE 1..8:/# !mulrDr !mulrA /= /#.
by auto => />.
qed.

equiv invntt_avx2_eq_:
Jkem1024_avx2.M._poly_invntt ~ Tmp._invntt:
 ={rp} ==> ={res}.
proof.
proc.
sp 0 1.
seq 2 2: (i{2}=0 /\ ={i,rp,qx16} /\ zetasp{2} = zetas_inv_op).
 by wp; skip => &1 &2; rewrite /C2R //.
seq 4 4: (#pre /\ ={r0,r2,r4,r6,zeta0,zeta1}).
 wp; while (0 <= i{2} /\ #[/2:]pre /\ (i{2}=0 \/ ={r0,r2,r4,r6})).
  seq 12 12: (i{2} < 2 /\ #[/:5]pre /\ ={r0,r1,r2,r3,r4,r5,r6,r7,zeta0,zeta1,zeta2,zeta3}).
   auto => /> *; do split;1..8: by rewrite /zetas_op !P2RE //= /#. 
   rewrite /zetas_inv_op /= /z2u256 /=;  smt().
   rewrite /zetas_inv_op /= /z2u256 /=; smt().
   rewrite /zetas_inv_op /= /z2u256 /=;  smt().
   rewrite /zetas_inv_op /= /z2u256 /=; smt().

  seq 1 1: (#pre).
   by conseq />; sim.
  seq 3 3: (#pre /\ ={vx16}).
   auto => /> *; rewrite /zetas_inv_op /= /z2u256 !mulrDr !mulrA /#.
  seq 9 9: (#pre).
   by conseq />; sim.
  seq 2 2: (#pre).
   by auto => /> *; rewrite /zetas_inv_op /=/z2u256 !mulrDr !mulrA /#.
  seq 6 6: (#pre).
   by conseq />; sim.
  seq 2 2: (#pre).
   by auto => /> *; rewrite /zetas_inv_op /= /z2u256 !mulrDr !mulrA /#.
  seq 6 6: (#pre).
   by conseq />; sim.
  seq 2 2: (#pre).
   by auto => /> *; rewrite/zetas_inv_op /= /z2u256 !mulrDr !mulrA /#.
  seq 6 6: (#pre).
   by conseq />; sim.
  seq 2 2: (#pre).
   by auto => /> *; rewrite /zetas_inv_op /= /z2u32 /#. 
  seq 2 2: (#pre).
   by conseq />; sim.
  if => //.
   by wp; skip => /> *; rewrite !PURE 1..8:/# /= /#.
  by wp; skip => /> *; rewrite !PURE 1..4:/# /= !mulrDr !mulrA /= /#.
 by auto => /> * /#.
while (#[/2:]pre /\ 0 <= i{2}).
 seq 5 5: (={r1,r3,r5,r7} /\ #pre).
  if => //.
   by wp; skip => /> *; rewrite !P2RE /#. 
  by wp; skip => /> *; rewrite !P2RE /#. 
 seq 1 1: (#pre).   
  by conseq />; sim.
 seq 6 6: (#pre /\ ={flox16,fhix16}).
  wp; skip => /> *; rewrite /C2R !PURE 1..4:/#.
  rewrite tP => k kb.
  rewrite !initiE 1,2: /# /=.
  congr. congr. 
  rewrite tP => kk kkb.
  rewrite !initiE 1,2: /# /=;smt().
  by smt(). 
 seq 4 4: (#pre).   
  by conseq />; sim.
 wp; skip => /> *; rewrite !PURE 1..4:/#.
  do split; last by smt(). 
  rewrite tP; move  => k kb.
  rewrite !initiE 1,2: /# /=.
  congr. congr. 
  rewrite tP => kk kkb.
  rewrite !initiE 1,2: /# /=;smt().
  by smt(). 
by auto.
qed.


(************)
(** BASEMUL *)
(************)

lemma W32_shr16_bits16H (w: W32.t):
 w `>>` (W8.of_int 16) \bits16 1 = W16.zero.
proof.
by apply W16.all_eq_eq; rewrite shr_shrw 1://.
qed.

lemma VPSRL_8u32_16 x k:
 0 <= k < 16 =>
 (VPSRL_8u32 x (W128.of_int 16)) \bits16 k
 = if k%%2 = 0
   then x \bits16 k+1
   else W16.zero.
proof.
move => Hk; rewrite /VPSRL_8u32 /=.
rewrite {1}(divz_eq k 2) mulrC -W256_bits32_bits16 1:/# pack8bE 1:/# /=.
have: k\in iota_ 0 16 by smt(mem_iota).
move: {Hk} k; apply/List.allP; rewrite -iotaredE /=.
rewrite !bits32_shr16_bits16L //=.
by rewrite !W32_shr16_bits16H.
qed.

lemma VPBLENDW_256_170 x1 x2 k:
 0 <= k < 16 =>
 (VPBLENDW_256 x1 x2 (W8.of_int 170)) \bits16 k
 = if k%%2 = 0
   then x1 \bits16 k
   else x2 \bits16 k.
proof.
move=> Hk; have: k \in iota_ 0 16 by smt(mem_iota).
move: {Hk} k; apply/List.allP; rewrite -iotaredE /=.
by rewrite /VPBLENDW_256 /VPBLENDW_128 /=. 
qed.

(* Simpler definition for [packus_4u32] *)
op packus_4u32_alt (w : W128.t) : W64.t =
 let pack =
   (fun (n : int) =>
      if w \bits16 2*n+1 = W16.zero
      then w \bits16 2*n
      else if w \bits16 2*n+1 \slt W16.zero
           then W16.zero
           else W16.onew)
 in pack4 [pack 0; pack 1; pack 2; pack 3].

lemma packus_4u32E w:
 packus_4u32 w = packus_4u32_alt w.
proof.
rewrite /packus_4u32 /packus_4u32_alt. 
pose P1:= fun n =>
      if w \bits32 n \slt W32.zero then W16.zero
      else if (of_int W16.max_uint)%W32 \sle (w \bits32 n) then (of_int W16.max_uint)%W16 else w \bits16 2 * n.
pose P2:= fun n =>
     if (w \bits16 2 * n + 1) = W16.zero then w \bits16 2 * n
     else if w \bits16 2 * n + 1 \slt W16.zero then W16.zero else W16.onew.
rewrite /=.
have E: forall k, 0 <= k < 4 => P1 k = P2 k.
 move=> k Hk; rewrite /P1 /P2 =>  {P1} {P2}.
 pose x32:= w\bits32 k.
 pose xH:= w\bits16 2*k+1.
 pose xL:= w\bits16 2*k.
 have Hx: to_sint x32 = to_sint xH*W16.modulus + to_uint xL.
  by rewrite /x32 /xH /xL /= to_sint32_bits16 W128_bits32_bits16.
 case: (xH = W16.zero) => C1.
  rewrite ifF.
   rewrite /(\slt) Hx C1 /to_sint /smod /=.
   move: (W16.to_uint_cmp xL); smt().
  case: (to_uint xL = 65535) => E.
   have E2: to_sint x32 = 65535.
    by rewrite Hx C1 E to_sintE /smod /=.
   rewrite /(\sle) E2 of_sintK /smod /=.
   by rewrite -E to_uintK.
  rewrite ifF //.
  rewrite /(\sle) Hx C1 /= /to_sint /smod /=.
  by move: (W16.to_uint_cmp xL); smt().
 case: (xH \slt W16.zero).
  rewrite /(\slt) {2}/W16.to_sint /smod /= => C2.
  rewrite ifT // /(\slt) Hx /= /W32.to_sint /smod /=.
  by move: (W16.to_uint_cmp xL); smt().
 rewrite /(\slt) {2}/W16.to_sint /smod /= => C2.
 rewrite ifF.
  rewrite Hx /W32.to_sint /smod /=.
  by move: (W16.to_uint_cmp xL); smt().
 rewrite ifT.
  rewrite /(\sle) Hx of_sintK /smod /=.
  have ?: to_sint xH <> 0.
   move: C1; apply contra => <-.
   move: C2; rewrite to_sintE /smod /= => H.
   case: (32768 <= to_uint xH) => C.
    move: H; rewrite C /=.
    by move: (W16.to_uint_cmp xH); smt().
   by rewrite to_uintK.
  by move: (W16.to_uint_cmp xL); smt().
 by rewrite /W16.onew.
by rewrite !E //.
qed.

lemma packus_4u32_0H k (w: W128.t):
 0 <= k < 4 =>
 w \bits16 2*k+1 = W16.zero => 
 packus_4u32 w \bits16 k = w \bits16 2*k.
proof.
move=> Hk; have: k\in iota_ 0 4 by smt(mem_iota).
move: {Hk} k; apply/List.allP; rewrite -iotaredE /=.
by rewrite !packus_4u32E /packus_4u32_alt /= /#.
qed.

lemma VPACKUS_8u32_0H k (w1 w2: W256.t):
 k \in iota_ 0 8 =>
 (forall k, k\in iota_ 0 8 =>
   w1 \bits16 2*k+1 = W16.zero
   /\ w2 \bits16 2*k+1 = W16.zero) =>
 VPACKUS_8u32 w1 w2 \bits16 k
 = if k%/4 %% 2 = 0
   then w1 \bits16 2*(k%%4) + 8*(k%/8)
   else w2 \bits16 2*(k%%4) + 8*(k%/8).
proof.
move=> Hk.
move=> /List.allP; rewrite -iotaredE /= => |>*.
rewrite /VPACKUS_8u32 /VPACKUS_4u32 /=.
move: k Hk; apply/List.allP; rewrite -iotaredE /=.
by rewrite !packus_4u32_0H //.
qed.

op I16u16LH_sb (b:int) (yl yh: W256.t) (x: coeff Array16.t) =
 all (fun k=> x.[k] = incoeff (to_sint (pack2 [yl \bits16 k; yh \bits16 k]))
              /\ sint32_bnd (-b) b (pack2 [yl \bits16 k; yh \bits16 k]))
     (iota_ 0 16).

op I16u32AB_sb (b:int) (yA yB: W256.t) (x: coeff Array16.t) =
 all (fun k=> let y = (if k%/4%%2=0 then yA else yB) \bits32 (k%%4) + 4*(k%/8)
              in x.[k] = incoeff (to_sint y)
                 /\ sint32_bnd (-b) b y )
     (iota_ 0 16).

phoare deinterleave_u16_ph b _x:
 [Jkem1024_avx2.M.__w256_deinterleave_u16:
   x16_spec 0 _zero /\
   I16u32AB_sb b a0 a1 _x
   ==>
   I16u16LH_sb b res.`1 res.`2 _x
 ] = 1%r.
proof.
proc; auto.
move=> &m |> /x16_spec_bits16 Hzero.
rewrite /I16u32AB_sb /I16u16LH_sb -iotaredE /= /VPACKUS_8u32 /VPACKUS_4u32 /=.
do 8!
 (pose X:= a0{m} \bits32 _;
  rewrite (W32_unpack16E X) /X W256_bits32_bits16 1:// /= => {X}).
do 8!
 (pose X:= a1{m} \bits32 _;
  rewrite (W32_unpack16E X) /X W256_bits32_bits16 1:// /= => {X}).
move=> |> *.
do split; 
(rewrite !packus_4u32_0H /=; 1..3: 
rewrite ?VPBLENDW_256_170 /#;[
by rewrite VPSRL_8u32_16 1:/#/=|
by  rewrite VPBLENDW_256_170 /= 1:/#
      VPSRL_8u32_16 /= /#]).
qed.

phoare interleave_u16_ph b _x:
 [Jkem1024_avx2.M.__w256_interleave_u16:
   I16u16LH_sb b al ah _x
   ==>
   I16u32AB_sb b res.`1 res.`2 _x
 ] = 1%r.
proof.
proc; wp; auto => &m |>.
by rewrite /I16u32AB_sb /I16u16LH_sb -iotaredE /= => |> *.
qed.

op wmuls16 (x y: W16.t): W32.t =
 pack2 [x*y; wmulhs x y].

lemma to_sint_wmuls16 x y:
 to_sint (wmuls16 x y) = to_sint x * to_sint y.
proof. by rewrite /wmuls16 to_sint_pack2 -wmulsE. qed.

lemma wmuls16P n x y _x _y:
 Iu16_sb n x _x =>
 Iu16_sb n y _y =>
 sint32_bnd (-n*n*q*q) (n*n*q*q) (wmuls16 x y).
proof. 
have ->: - n * n * q * q = -(n * q)*(n*q) by ring.
have ->: n * n * q * q = ( n * q)*(n*q) by ring.
rewrite /Iu16_sb to_sint_wmuls16.
pose k:= n*q.
pose a:= to_sint x.
pose b:= to_sint y.
move=> [?[??]][?[??]].
case: (0 <= a); case: (0 <= b) => C1 C2.
+ smt(ler_pmul).
+ pose bb := -b.
  have ?: - (k*k) <= a*bb && a*bb <= k*k;
  smt(ler_opp2 ler_pmul).
+ pose aa := -a.
  have ?: - (k*k) <= aa*b && aa*b <= k*k;
  smt(ler_opp2 ler_pmul).
+ pose aa := -a.
  pose bb := -b.
  have ?: - (k*k) <= aa*bb && aa*bb <= k*k;
  smt(ler_opp2 ler_pmul).
qed.

phoare wmul_16u16_ph n _x _y:
  [Jkem1024_avx2.M.__wmul_16u16:
    I16u16_sb n x _x /\
    I16u16_sb n y _y
    ==>
    I16u32AB_sb (n*n*q*q) res.`1 res.`2 (map2 Zq.( * ) _x _y)
  ] = 1%r.
proof.
proc; simplify; auto.
call (interleave_u16_ph (n * n * q * q) (mul16x16 _x _y)).
wp; auto => &m.
rewrite /I16u16LH_sb  -!iotaredE /R2C /= !andaE => [#]
 Hx0 Hx1 Hx2 Hx3 Hx4 Hx5 Hx6 Hx7 Hx8 Hx9 HxA HxB HxC HxD HxE HxF
 Hy0 Hy1 Hy2 Hy3 Hy4 Hy5 Hy6 Hy7 Hy8 Hy9 HyA HyB HyC HyD HyE HyF.
move: (wmuls16P _ _ _ _ _ Hx0 Hy0) => Hxy0.
move: (wmuls16P _ _ _ _ _ Hx1 Hy1) => Hxy1.
move: (wmuls16P _ _ _ _ _ Hx2 Hy2) => Hxy2.
move: (wmuls16P _ _ _ _ _ Hx3 Hy3) => Hxy3.
move: (wmuls16P _ _ _ _ _ Hx4 Hy4) => Hxy4.
move: (wmuls16P _ _ _ _ _ Hx5 Hy5) => Hxy5.
move: (wmuls16P _ _ _ _ _ Hx6 Hy6) => Hxy6.
move: (wmuls16P _ _ _ _ _ Hx7 Hy7) => Hxy7.
move: (wmuls16P _ _ _ _ _ Hx8 Hy8) => Hxy8.
move: (wmuls16P _ _ _ _ _ Hx9 Hy9) => Hxy9.
move: (wmuls16P _ _ _ _ _ HxA HyA) => HxyA.
move: (wmuls16P _ _ _ _ _ HxB HyB) => HxyB.
move: (wmuls16P _ _ _ _ _ HxC HyC) => HxyC.
move: (wmuls16P _ _ _ _ _ HxD HyD) => HxyD.
move: (wmuls16P _ _ _ _ _ HxE HyE) => HxyE.
move: (wmuls16P _ _ _ _ _ HxF HyF) => HxyF.
rewrite /VPMULL_16u16 /VPMULH_16u16 /= !to_sint_wmuls16 !incoeffM.
do 15!
 (split; first by (split; [congr; smt() | rewrite -to_sint_wmuls16 /#])).
by (split; [congr; smt() | rewrite -to_sint_wmuls16 /#]).
qed.

lemma add_16u32AB_sb b xA xB x yA yB y:
 I16u32AB_sb b xA xB x =>
 I16u32AB_sb b yA yB y =>
 b+b <= W32.max_sint =>
 I16u32AB_sb (b+b) (VPADD_8u32 xA yA) (VPADD_8u32 xB yB) (map2 Zq.(+) x y).
proof.
rewrite /I16u32AB_sb -iotaredE /VPADD_8u32 /= => |> *.
have ?: W32.min_sint <= b+b <= W32.max_sint by smt().
by rewrite !to_sint32D_small 1..16:/# !incoeffD /#. 
qed.

lemma sub_16u32AB_sb b xA xB x yA yB y:
 I16u32AB_sb b xA xB x =>
 I16u32AB_sb b yA yB y =>
 b+b <= W32.max_sint =>
 I16u32AB_sb (b+b) (VPSUB_8u32 xA yA) (VPSUB_8u32 xB yB) (map2 Zq.(-) x y).
proof.
rewrite /I16u32AB_sb -iotaredE /VPSUB_8u32 /= => |> *.
have ?: W32.min_sint <= b+b <= W32.max_sint by smt().
by rewrite !to_sint32B_small 1..16:/# !incoeffB /#. 
qed.

lemma fqmulprecomp16x_ll: 
 islossless Jkem1024_avx2.M.__fqmulprecomp16x 
by islossless.


lemma mulR_inv (a b : coeff) :
  (a * incoeff Montgomery16.R = b) <=> (a = b * incoeff Montgomery16.Rinv).
proof.
have := Montgomery16.RRinv; rewrite /R /Rinv /q => />.
rewrite -!Zq.ComRing.mulrA -!incoeffM /= incoeff_mod.
by rewrite incoeff_mod /q /= !ZqField.mulr1.
qed.

hoare fqmulprecomp16x_h n _a _b: 
Jkem1024_avx2.M.__fqmulprecomp16x :
   x16_spec q qx16 /\
   qinv16u16M al ah /\
   I16u16M_ub 1 ah _a /\
   I16u16_sb n b _b
   ==> I16u16_sb 1 res (mul16x16 _a _b).
proof.
proc; auto => |> &m.
rewrite !x16_spec_bits16 /qinv16u16M !allP => |> Hq Hqinv Ha Hb.
have:  forall (i : int),0 <= i < 16 => (al{m} \bits16 i) = (ah{m} \bits16 i) * (W16.of_int 62209).
 move => i Hi; move :(Hqinv i).
 rewrite mem_iota /R2C /= !initiE /#.
move => Hqinv' i; rewrite mem_iota => /> Hi1 Hi2.
rewrite /Iu16_sb !initiE // /=.
rewrite (_: (VPSUB_16u16 (VPMULH_16u16 ah{m} b{m}) (VPMULH_16u16 (VPMULL_16u16 al{m} b{m}) qx16{m}) \bits16 i) = Montgomery16.REDCmul16 (b{m} \bits16 i) (ah{m} \bits16 i) ).
rewrite /VPMULH_16u16 /VPMULL_16u16 /VPSUB_16u16 /R2C /REDC16 => />.
rewrite !bits16_W16u16 /=. 
rewrite ifT //. 
rewrite !Hq //. 
rewrite !Hqinv' //. 
rewrite W16u16.Pack.of_listE W16u16.Pack.initE /=. 
rewrite ifT //. 
case (i=0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-1 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-2 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-3 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-4 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-5 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-6 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-7 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-8 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-9 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-10 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-11 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-12 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-13 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-14 = 0); 1: smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move => *; case(i-15 = 0);  smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move :(Ha i _); first smt(mem_iota).
rewrite initiE 1:/#.
rewrite /Iu16_ub -andaE. 
rewrite mulR_inv. apply andaW => /= Ha1 Ha2.
move :(Hb i). rewrite mem_iota initiE 1:/#. rewrite Hi1 Hi2 /=. rewrite /Iu16_sb -andaE. apply andaW => Hb1 Hb2.
rewrite /map2 initiE // /=. rewrite Ha1 Hb1. 
have := (Montgomery16.REDCmul16_correct (b{m} \bits16 i) (ah{m} \bits16 i)). rewrite (_:Montgomery16.q=q) 1:/#. rewrite Ha2 /=. 
rewrite -andaE. rewrite eq_incoeff. apply andaW => H1 H2. rewrite H1. split. rewrite !incoeffM. rewrite -!Zq.ComRing.mulrA. smt(Zq.ComRing.mulrC Zq.ComRing.mulrA).
smt().
qed.

phoare fqmulprecomp16x_ph n _a _b:
 [Jkem1024_avx2.M.__fqmulprecomp16x :
   x16_spec q qx16 /\
   qinv16u16M al ah /\
   I16u16M_ub 1 ah _a /\
   I16u16_sb n b _b
   ==> I16u16_sb 1 res (mul16x16 _a _b) ] = 1%r.
proof. by conseq fqmulprecomp16x_ll (fqmulprecomp16x_h n _a _b). qed.

lemma mont_red_ll:
 islossless Jkem1024_avx2.M.__mont_red
by islossless.

hoare mont_red_h _x:
Jkem1024_avx2.M.__mont_red:
  x16_spec q qx16 /\
  x16_spec 62209 qinvx16 /\
  I16u16LH_sb 88657928 lo hi _x
  ==>
  I16u16S_sb (incoeff 169) 1 res _x.
proof.
proc; simplify; auto.
move => &m |>.
rewrite /x16_spec /I16u16LH_sb /R2C !allP => Hq Hqinv H k Hk /=.
move: Hk (Hq _ Hk) (Hqinv _ Hk) (H _ Hk).
rewrite mem_iota /=; move => [Hk1 Hk2].
rewrite !initiE //; move=> {Hq Hqinv H} Hq Hqinv [H1 H2].
have:= sint_bnd_u32H _ _ _ (hi{m}\bits16 k) (lo{m}\bits16 k) _ H2.
 by rewrite to_sint_pack2.
rewrite /= => {H2} H2.
move: (Montgomery16.REDC16_correct (-1353) 1352 (lo{m}\bits16 k) _ _ _ H2) => //=.
rewrite /Iu16_sb /REDC16 /Montgomery16.qinv /= -andaE.
rewrite /q /Montgomery16.Rinv /=; move => [HHA HHB].
rewrite /VPSUB_16u16 /VPMULH_16u16 /VPMULL_16u16 /= !bits16_W16u16 Hk1 Hk2 //=.
pose X:= W16u16.Pack.of_list _.
have ->: X.[k] = (hi{m} \bits16 k) - wmulhs ((lo{m} \bits16 k) * (qinvx16{m} \bits16 k)) (qx16{m} \bits16 k).
 have: k\in iota_ 0 16 by smt(mem_iota).
 by move:(k); apply/List.allP; rewrite -iotaredE /X.
clear X; rewrite Hq Hqinv /q /=; split.
 rewrite H1 to_sint_pack2 /= incoeff_mod (incoeff_mod 169).
 by rewrite -incoeffM incoeff_mod modzMm /q -HHA /#.
smt().
qed.

phoare mont_red_ph _x:
 [Jkem1024_avx2.M.__mont_red:
   x16_spec q qx16 /\
   x16_spec 62209 qinvx16 /\
   I16u16LH_sb 88657928 lo hi _x
   ==>
   I16u16S_sb (incoeff 169) 1 res _x ] = 1%r.
proof. by conseq mont_red_ll (mont_red_h _x). qed.


lemma I16u32AB_sb_eqx b yA yB x1 x2:
 I16u32AB_sb b yA yB x1 =>
 x1=x2 =>
 I16u32AB_sb b yA yB x2.
proof. by move=> H <-. qed.

lemma I16u16_sbW n1 n2 y x:
 I16u16_sb n1 y x =>
 n1 <= n2 =>
 I16u16_sb n2 y x.
proof.
move=> /List.allP H Hn; apply/List.allP => k Hk /=.
move: (H k Hk) => {H} [H1 H2]; split => //.
by apply (sint_bndW _ _ _ _ _ _ _ H2); smt().
qed.

equiv cmpl_mulx16_eq:
Jkem1024_avx2.M.__schoolbook16x ~ NTT_AVX.__cmplx_mulx16:
 I16u16_sb 2 are{1} are{2} /\
 I16u16_sb 2 aim{1} aim{2} /\
 I16u16_sb 2 bre{1} bre{2} /\
 I16u16_sb 2 bim{1} bim{2} /\
 qinv16u16M zetaqinv{1} zeta_0{1} /\
 I16u16M_ub 1 zeta_0{1} zetas{2}  /\
 x16_spec q qx16{1} /\
 x16_spec 62209 qinvx16{1} /\
 sign{2} = (sign{1} <> 0)
 ==>
 I16u16S_sb (incoeff 169) 1 res{1}.`1 res{2}.`1 /\
 I16u16S_sb (incoeff 169) 1 res{1}.`2 res{2}.`2.
proof.
proc; simplify.
sp 0 2.
ecall {1} (mont_red_ph rim{2}).
ecall {1} (mont_red_ph rre{2}).
ecall {1} (deinterleave_u16_ph 88657928 rim{2}).
ecall {1} (deinterleave_u16_ph 88657928 rre{2}).
wp.
ecall {1} (wmul_16u16_ph 2 (map2 Zq.( * ) zetas{2} aim{2}) bim{2}).
ecall {1} (wmul_16u16_ph 2 aim{2} bre{2}).
ecall {1} (wmul_16u16_ph 2 are{2} bim{2}).
ecall {1} (wmul_16u16_ph 2 are{2} bre{2}).
ecall {1} (fqmulprecomp16x_ph 2 zetas{2} aim{2}).
auto; rewrite /q => &1 &2 |> Hare Haim Hbre Hbim Hzinv Hz Hq Hqinv zaim Hzaim.
move=> [ac0 ac1] /= Hac.
move=> [ad0 ad1] /= Had.
move=> [bc0 bc1] /= Hbc.
have ->/=: I16u16_sb 2 zaim (mul16x16 zetas{2} aim{2}).
 by apply (I16u16_sbW _ _ _ _ Hzaim).
move=> [zbd0 zbd1] /= Hzbd.
have ->: x16_spec 0 W256.zero.
 by rewrite /x16_spec -iotaredE /R2C /= !W16u16.get_zero.
move => |>; split.
 split.
  move: (add_16u32AB_sb _ _ _ _ _ _ _ Hac Hzbd) => /= H.
  apply (I16u32AB_sb_eqx _ _ _ _ _ H); rewrite tP => k Hk /=.
  rewrite map2iE 1:// initiE 1:// /cmplx_mul /=.
  by rewrite !map2iE 1..3:// ZqField.mul1r; ring.
 move=> HriAB [riL riH] /= HriLH.
 move: (add_16u32AB_sb _ _ _ _ _ _ _ Hbc Had) => /= H.
 apply (I16u32AB_sb_eqx _ _ _ _ _ H); rewrite tP => k Hk /=.
 rewrite map2iE 1:// initiE 1:// /cmplx_mul /=.
 by rewrite !map2iE 1..2://; ring.
move=> Hsign; split.
 move: (sub_16u32AB_sb _ _ _ _ _ _ _ Hac Hzbd) => /= H.
 apply (I16u32AB_sb_eqx _ _ _ _ _ H); rewrite tP => k Hk /=.
 rewrite map2iE 1:// initiE 1:// /cmplx_mul /=.
 rewrite !map2iE 1..3:// incoeffN; ring. 
 by rewrite ZqField.mulr1; ring.
move=> HriAB [riL riH] /= HriLH.
move: (add_16u32AB_sb _ _ _ _ _ _ _ Hbc Had) => /= H.
apply (I16u32AB_sb_eqx _ _ _ _ _ H); rewrite tP => k Hk /=.
rewrite map2iE 1:// initiE 1:// /cmplx_mul /=.
by rewrite !map2iE 1..2://; ring.
qed.

equiv poly_basemul_avx2_eq:
Jkem1024_avx2.M._poly_basemul ~ NTT_AVX.__basemul:
 a{2}=lift_array256 ap{1} /\ signed_bound_cxq ap{1} 0 256 2
 /\ b{2}=lift_array256 bp{1} /\ signed_bound_cxq bp{1} 0 256 2
 ==>
 scale res{2} (incoeff 169) = lift_array256 res{1} /\
 signed_bound_cxq res{1} 0 256 1.
proof.
transitivity Tmp._poly_basemul
 ( ={rp,ap,bp} ==> ={res} )
 ( I256u16_sb 2 ap{1} a{2} /\ I256u16_sb 2 bp{1} b{2}
   ==> I256u16S_sb (incoeff 169) 1 res{1} res{2} ).
   by move=> |> &1 &2 *; exists arg{1}; rewrite !I256u16_sbE //. 
  by move => &1 &m &2 /= ->?; rewrite -!I256u16S_sbE //. 
 by conseq basemul_avx2_eq_; smt().
proc; simplify.
seq 8 5: (#pre /\ x16_spec q qx16{1} /\ x16_spec 62209 qinvx16{1} /\
          qinv16u16M zetaqinv{1} zeta_0{1} /\
          I16u16M_ub 1 zeta_0{1} zetas{2} /\
          I16u16_sb 2 are{1} are{2} /\
          I16u16_sb 2 aim{1} aim{2} /\
          I16u16_sb 2 bre{1} bre{2} /\
          I16u16_sb 2 bim{1} bim{2}).
 auto => &1 &2 |> /List.allP Ha /List.allP Hb.
 have ->: x16_spec q (C2R qx16_op).
  by rewrite x16_spec_C2R /q /=.
 have ->: x16_spec 62209 (C2R qinvx16_op).
  by rewrite x16_spec_C2R /q /=.
 have -> |>: qinv16u16M (z2u256 zetas_op 136) (z2u256 zetas_op 152).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE /=.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /jzetas_exp /=.
 pose xx := I16u16S_ub _ _ _ _.
 have ->/=: xx.
  by rewrite /xx -iotaredE /= /zetas_op !z2u256E 1..2:// !C2RK /jzetas_exp /= -
!incoeffM_mod /q /= !Iu16_ub_of_int.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (incoeff 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 2) /\
          #[/:5,6]pre).
 wp; call cmpl_mulx16_eq; auto => &1 &2 /> _ _ Hq Hzqinv Hz *.
 rewrite -{2}iotaredE /=.
 by rewrite (P2RS rp{1}) (P2CS r{2}) !PUR_i //= !PUC_i //= !P2R_i //= !P2C_i //=.
seq 4 4: (#pre /\
          I16u16_sb 2 are{1} are{2} /\
          I16u16_sb 2 aim{1} aim{2} /\
          I16u16_sb 2 bre{1} bre{2} /\
          I16u16_sb 2 bim{1} bim{2}).
 auto => &1 &2 |> /List.allP Ha /List.allP Hb *.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (incoeff 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 4)).
 wp; call cmpl_mulx16_eq; auto => &1 &2 /> _ _ Hq.
 rewrite -{2}iotaredE /= => /> ??.
 move=> Hz *; rewrite -{2}iotaredE /=.
 by rewrite (P2RS rp{1}) (P2CS r{2}) !PUR_i //= !PUC_i //= !P2R_i //= !P2C_i //=.
seq 6 5: (#pre /\ 
          qinv16u16M zetaqinv{1} zeta_0{1} /\
          I16u16M_ub 1 zeta_0{1} zetas{2} /\
          I16u16_sb 2 are{1} are{2} /\
          I16u16_sb 2 aim{1} aim{2} /\
          I16u16_sb 2 bre{1} bre{2} /\
          I16u16_sb 2 bim{1} bim{2}).
 auto => &1 &2 |> /List.allP Ha /List.allP Hb *.
 have ->: qinv16u16M (z2u256 zetas_op 168) (z2u256 zetas_op 184).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE /=.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /jzetas_exp /=.
 pose xx := List.all _ _.
 have ->/=: xx.
  by rewrite /xx -iotaredE /= /zetas_op !z2u256E 1..2:// !C2RK /jzetas_exp /= -!incoeffM_mod /q /= !Iu16_ub_of_int.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (incoeff 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 6) /\
          #[/6,7]pre).
 wp; call cmpl_mulx16_eq; auto => &1 &2 /> _ _ Hq.
 rewrite -{2}iotaredE /= => /> ??.
 move=> Hz *; rewrite -{2}iotaredE /=.
 by rewrite (P2RS rp{1}) (P2CS r{2}) !PUR_i //= !PUC_i //= !P2R_i //= !P2C_i //=.
seq 4 4: (#pre /\
          I16u16_sb 2 are{1} are{2} /\
          I16u16_sb 2 aim{1} aim{2} /\
          I16u16_sb 2 bre{1} bre{2} /\
          I16u16_sb 2 bim{1} bim{2}).
 auto => &1 &2 |> /List.allP Ha /List.allP Hb *.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (incoeff 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 8)).
 wp; call cmpl_mulx16_eq; auto => &1 &2 /> _ _ Hq.
 rewrite -{2}iotaredE /= => /> ??.
 move=> Hz *; rewrite -{2}iotaredE /=.
 by rewrite (P2RS rp{1}) (P2CS r{2}) !PUR_i //= !PUC_i //= !P2R_i //= !P2C_i //=.
seq 6 5: (#pre /\ 
          qinv16u16M zetaqinv{1} zeta_0{1} /\
          I16u16M_ub 1 zeta_0{1} zetas{2} /\
          I16u16_sb 2 are{1} are{2} /\
          I16u16_sb 2 aim{1} aim{2} /\
          I16u16_sb 2 bre{1} bre{2} /\
          I16u16_sb 2 bim{1} bim{2}).
 auto => &1 &2 |> /List.allP Ha /List.allP Hb *.
 have ->: qinv16u16M (z2u256 zetas_op 332) (z2u256 zetas_op 348).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE /=.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /jzetas_exp /=.
 pose xx := List.all _ _.
 have ->/=: xx.
  by rewrite /xx -iotaredE /= /zetas_op !z2u256E 1..2:// !C2RK /jzetas_exp /= -!incoeffM_mod /q /= !Iu16_ub_of_int.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (incoeff 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 10) /\
          #[/6,7]pre).
 wp; call cmpl_mulx16_eq; auto => &1 &2 /> _ _ Hq.
 rewrite -{2}iotaredE /= => /> ??.
 move=> Hz *; rewrite -{2}iotaredE /=.
 by rewrite (P2RS rp{1}) (P2CS r{2}) !PUR_i //= !PUC_i //= !P2R_i //= !P2C_i //=.
seq 4 4: (#pre /\
          I16u16_sb 2 are{1} are{2} /\
          I16u16_sb 2 aim{1} aim{2} /\
          I16u16_sb 2 bre{1} bre{2} /\
          I16u16_sb 2 bim{1} bim{2}).
 auto => &1 &2 |> /List.allP Ha /List.allP Hb *.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (incoeff 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 12)).
 wp; call cmpl_mulx16_eq; auto => &1 &2 /> _ _ Hq.
 rewrite -{2}iotaredE /= => /> ??.
 move=> Hz *; rewrite -{2}iotaredE /=.
 by rewrite (P2RS rp{1}) (P2CS r{2}) !PUR_i //= !PUC_i //= !P2R_i //= !P2C_i //=.
seq 6 5: (#pre /\ 
          qinv16u16M zetaqinv{1} zeta_0{1} /\
          I16u16M_ub 1 zeta_0{1} zetas{2} /\
          I16u16_sb 2 are{1} are{2} /\
          I16u16_sb 2 aim{1} aim{2} /\
          I16u16_sb 2 bre{1} bre{2} /\
          I16u16_sb 2 bim{1} bim{2}).
 auto => &1 &2 |> /List.allP Ha /List.allP Hb *.
 have ->: qinv16u16M (z2u256 zetas_op 364) (z2u256 zetas_op 380).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE /=.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /jzetas_exp /=.
 pose xx := List.all _ _.
 have ->/=: xx.
  by rewrite /xx -iotaredE /= /zetas_op !z2u256E 1..2:// !C2RK /jzetas_exp /= -!incoeffM_mod /q /= !Iu16_ub_of_int.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (incoeff 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 14) /\
          #[/6,7]pre).
 wp; call cmpl_mulx16_eq; auto => &1 &2 /> _ _ Hq.
 rewrite -{2}iotaredE /= => /> ??.
 move=> Hz *; rewrite -{2}iotaredE /=.
 by rewrite (P2RS rp{1}) (P2CS r{2}) !PUR_i //= !PUC_i //= !P2R_i //= !P2C_i //=.
seq 4 4: (#pre /\
          I16u16_sb 2 are{1} are{2} /\
          I16u16_sb 2 aim{1} aim{2} /\
          I16u16_sb 2 bre{1} bre{2} /\
          I16u16_sb 2 bim{1} bim{2}).
 auto => &1 &2 |> /List.allP Ha /List.allP Hb *.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (incoeff 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 16)).
 wp; call cmpl_mulx16_eq; auto => &1 &2 /> _ _ Hq.
 rewrite -{2}iotaredE /= => /> ??.
 move=> Hz *; rewrite -{2}iotaredE /=.
 by rewrite (P2RS rp{1}) (P2CS r{2}) !PUR_i 1..4:/# /= !PUC_i /= 1..4:/# !P2R_i /= 1..32:/# !P2C_i /=.
by auto.
qed.
