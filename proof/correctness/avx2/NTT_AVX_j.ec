require import AllCore List Int IntDiv Ring StdOrder.

from Jasmin require import JModel.

require import Array256 Array16.
require import WArray512.

require import NTT_AVX_Fq.

(******* *)

require import Kyber.
import Zq.

require import KyberPoly.
import KyberPoly.

require import Montgomery16.
require import Jkem_avx2 Jkem.

import IntOrder.

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



(*
lemma R2C_pack16 f k:
 0 <= k < 16 =>
 (R2C (W16u16.pack16_t f)).[k] = f.[k].
proof. by move=> Hk; rewrite /R2C initiE //= pack16bE. qed.
*)
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

lemma sint_bnd_ltR bL bR x:
 sint_bnd bL (bR-1) x <=> bL <= to_sint x < bR by smt().



(** IMPLEMENTATION RELATIONS
  (obs: perhaps a nice use-case for type-classes...) *)

abbrev inFqW16 (w: W16.t) : Fq = inFq (W16.to_sint w).

(** Implementation relation (signed bounded) *)
abbrev Iu16 y x = x = inFqW16 y.

op Iu16_sb (n: int) (y: W16.t) (x: Fq) =
 Iu16 y x /\ sint_bnd (-n*q) (n*q-1) y.

lemma Iu16_sbE n y x:
 Iu16_sb n y x <=> x = inFqW16 y /\ (-n*q) <= to_sint y < (n*q).
proof. rewrite /Iu16_sb; split => |> * /#. qed.

(** Implementation relation (Scaled form, signed bounded) *)
abbrev Iu16S_sb s (n: int) (y: W16.t) (x: Fq) =
 Iu16_sb n y (x*s).

(** Implementation relation (Montgomery form, signed bounded) *)
abbrev Iu16M_sb (n: int) (y: W16.t) (x: Fq) =
 Iu16S_sb (inFq W16.modulus) n y x.

(** Implementation relation (unsigned bounded) *)
op Iu16_ub (n: int) (y: W16.t) (x: Fq) =
 x = inFqW16 y /\ sint_bnd 0 (n*q-1) y.

lemma Iu16_ubE n y x:
 Iu16_ub n y x <=> x = inFqW16 y /\ 0 <= to_sint y < (n*q).
proof. rewrite /Iu16_ub; split => |> * /#. qed.

lemma Iu16_ub_of_int n:
 0 <= n < 3329 =>
 Iu16_ub 1 (W16.of_int n) (inFq n).
proof. by move=> /> *; rewrite of_sintK smod_small /#. qed.

(** Implementation relation (Scaled form, signed bounded) *)
abbrev Iu16S_ub s (n: int) (y: W16.t) (x: Fq) =
 Iu16_ub n y (x*s).

(** Implementation relation (Montgomery form, unsigned bounded) *)
abbrev Iu16M_ub (n: int) (y: W16.t) (x: Fq) =
 Iu16S_ub (inFq W16.modulus) n y x.

(** Implementation relation over chunks *)
abbrev I16u16 y (x:Fq Array16.t) = 
 all (fun k=>Iu16 (R2C y).[k] x.[k]) (iota_ 0 16).

abbrev I16u16_sb (n:int) (y: W256.t) (x: Fq Array16.t) =
 all (fun k=> Iu16_sb n (R2C y).[k] x.[k]) (iota_ 0 16).

abbrev I16u16S_sb z (n:int) (y: W256.t) (x: Fq Array16.t) =
 all (fun k=> Iu16S_sb z n (R2C y).[k] x.[k]) (iota_ 0 16).

abbrev I16u16M_sb (n:int) (y: W256.t) (x: Fq Array16.t) =
 all (fun k=> Iu16M_sb n (R2C y).[k] x.[k]) (iota_ 0 16).

lemma I16u16_sb_map n (z: Fq) x y:
 I16u16_sb n y (Array16.map (( * ) z) x) = I16u16S_sb z n y x.
proof. by rewrite -{1 2}iotaredE /= /#. qed.

lemma I16u16S_sb_map n (z1 z2: Fq) x y:
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

abbrev I16u16_ub (n:int) (y: W256.t) (x: Fq Array16.t) =
 all (fun k=> Iu16_ub n (R2C y).[k] x.[k]) (iota_ 0 16).

lemma I16u16_ub_sb n y x: I16u16_ub n y x => I16u16_sb n y x.
proof.
move=> /List.allP H; apply/List.allP => i Hi /=.
move: (H i Hi) => [Hv Hb]; split; first done.
by apply (sint_bndW _ _ _ _ _ _ _ Hb); smt().
qed.

abbrev I16u16S_ub z (n:int) (y: W256.t) (x: Fq Array16.t) =
 all (fun k=> Iu16S_ub z n (R2C y).[k] x.[k]) (iota_ 0 16).
 
abbrev I16u16M_ub (n:int) (y: W256.t) (x: Fq Array16.t) =
 all (fun k=> Iu16M_ub n (R2C y).[k] x.[k]) (iota_ 0 16).

(** Implementation relation over polynomials *)
abbrev I256u16_sb (n:int) (y: W16.t Array256.t ) (x: Fq Array256.t) =
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

abbrev I256u16_ub (n:int) (y: W16.t Array256.t ) (x: Fq Array256.t) =
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

abbrev I256u16S_sb z (n:int) (y: W16.t Array256.t ) (x: Fq Array256.t) =
 all (fun k=> I16u16S_sb z n (P2R y k) (P2C x k)) (iota_ 0 16).

lemma I256u16S_sbP z n y x:
 I256u16S_sb z n y x
 <=> all (fun k=> Iu16S_sb z n y.[k] x.[k]) (iota_ 0 256).
proof. by rewrite -iotaredE /= !P2R2C /P2C /pchunk !initiE //=. qed.

lemma I256u16S_sbE z n y x:
 I256u16S_sb z n y x
 <=>  NTT_Properties.scale x z = lift_array256 y /\ signed_bound_cxq y 0 256 n.
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
have ->: x.[k]*z = (NTT_Properties.scale x z).[k].
 by rewrite /NTT_Properties.scale mapiE /#.
by rewrite E mapiE 1:/# /= /Iu16_sb sint_bnd_ltR /#.
qed.

(* not needed...
abbrev I256u16M_ub (n:int) (y: W16.t Array256.t ) (x: Fq Array256.t) =
 all (fun k=> I16u16M_ub n (P2R y k) (P2C x k)) (iota_ 0 16).

lemma I256u16M_ubP n y x:
 I256u16M_ub n y x
 <=> all (fun k=> Iu16M_ub n y.[k] x.[k]) (iota_ 0 256).
proof. by rewrite -iotaredE /= !P2R2C /P2C /pchunk !initiE //=. qed.
*)

(* precomputed multiplications between zetas and qinv *)
op qinv16u16M (x y: JWord.W256.t) =
 all (fun i=> (R2C x).[i] = (R2C y).[i] * (W16.of_int 62209)) (iota_ 0 16).

lemma qinv16u16M_bits16 x y:
 qinv16u16M x y <=> forall k, 0 <= k < 16 =>
  x \bits16 k
  = W16.( *) (y \bits16 k) (W16.of_int 62209).
proof. by rewrite /qinv16u16M allP_range /R2C -!iotaredE. qed.


(*
op x16_spec (n: int) (x: JWord.W256.t) =
 forall i, 0 <= i < 16 =>
  (x \bits16 i)%JWord.W16u16 = W16.of_int n.
*)
op x16_spec (n: int) (x: JWord.W256.t) =
 all (fun i=> (R2C x).[i] = W16.of_int n) (iota_ 0 16).

lemma x16_spec_bits16 n x:
 x16_spec n x <=> forall k, 0 <= k < 16 =>
x \bits16 k = W16.of_int n.
proof. by rewrite /x16_spec allP_range /R2C -!iotaredE. qed.

(*
lemma C2RbiE a k:
 0 <= k < 16 =>
 C2R a \bits16 k = a.[k].
proof. by move=> Hk; rewrite -{-1}(C2RK a) /R2C initiE. qed.
*)

lemma x16_spec_C2R n a:
 x16_spec n (C2R a) <=> all (fun i=>a.[i]=W16.of_int n) (iotared 0 16).
proof.
rewrite iotaredE /x16_spec -!allP_range.
split.
 by move=> H k Hk /=; rewrite -(H k Hk) C2RK.
by move=> H k Hk /=; rewrite C2RK -(H k Hk).
qed.

(* Handling expanded zetas table *)
require import Array400 WArray800.
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

require import WArray32.
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

(* Barret reduction *)

require import Fq.

(*
 op BREDC(a bits : int) =
   let t = smod (a * (2^bits %/ q + 1)) (R^2) %/ 2^bits * q in
      smod (a %% R + (-t) %% R) R.
*)

op sbred16 (x: W16.t): W16.t =
 x - (wmulhs x (W16.of_int 20159) `|>>` (W8.of_int 10)) * (W16.of_int q).

import Fq.SignedReductions.

(* a generalized version of [Montegomery.SignedReductions.smod_div] *)
lemma smod_R2_R (x y: W16.t) :
 smod (to_sint x * to_sint y) (R ^ 2) %/ R
 = smod (to_sint x * to_sint y %/ R) R.
proof.
rewrite !smodE expr2.
have ->: R * R %/ 2 <= to_sint x * to_sint y %% (R * R)
         = R %/ 2 <= to_sint x * to_sint y %/ R %% R.
 by rewrite /R -divz_mod_mul // /#.
case: (R %/ 2 <= to_sint x * to_sint y %/ R %% R) => E.
 rewrite divzDr.
  by rewrite dvdzN dvdz_mulr dvdzz.
 by rewrite divz_mod_mul /R /#.
by rewrite divz_mod_mul /R /#.
qed.

(*
lemma smod_to_sint_mod x:
 W16.smod (W16.to_sint x %% W16.modulus) = to_sint x.
proof.
rewrite /to_sint /smod /=.
by move: (W16.to_uint_cmp x); smt().
qed.
*)
lemma to_sintN_cgr (x: W16.t):
 W16.to_sint (-x) %% R = (- to_sint x) %% R.
proof.
rewrite /to_sint !to_uintN /smod /=.
case: (to_uint x = 0) => [->//|] E.
case: (to_uint x = 32768) => [->//|] E2.
have Eminus: (- to_uint x) %% 65536 = 65536 - to_uint x.
 rewrite {1}(_:-to_uint x=(65536%%65536) - to_uint x) 1:modzz //.
 by rewrite modzDml modz_small; move: (W16.to_uint_cmp x); smt().
case: (32768 <= to_uint x) => C2.
 have ->: !32768 <= (- to_uint x) %% 65536 by smt().
 smt().
have X: 32768 <= (- to_uint x) %% 65536 by smt().
smt().
qed.

lemma smod_mod x:
 W16.smod x %% R = x %% R.
proof.
rewrite /smod.
case: ( 2 ^ (16 - 1) <= x) => ?//.
by rewrite -modzDmr -modzNm modzz.
qed.

lemma to_sintH x y:
 W16.to_sint (W16.wmulhs x y)
 = W16.smod (to_sint x * to_sint y %/ R %% R).
proof.
rewrite to_sint_wmulhs /R /smod /=.
case: (to_sint x * to_sint y %/ 65536 < 0) => E.
 have ->: to_sint x * to_sint y %/ 65536 %% 65536
  = R + to_sint x * to_sint y %/ 65536.
  move: (W16.to_sint_cmp x) (W16.to_sint_cmp y) => /= Bx By.
  move:(to_sintH_bnd x y _ _ _ _ Bx By _ _ _ _) => //=.
  rewrite to_sint_wmulhs /= => BxyH.  
  by rewrite -modzDl modz_small /R /= /#.
 have ->: 2 ^ (16 - 1) <= R + to_sint x * to_sint y %/ Montgomery16.R.
  move: (W16.to_sint_cmp x) (W16.to_sint_cmp y) => /= Bx By.
  move:(to_sintH_bnd x y _ _ _ _ Bx By _ _ _ _) => //=.
  by rewrite to_sint_wmulhs /R /= /#.
 by rewrite /R; smt().
have ->: to_sint x * to_sint y %/ Montgomery16.R %% Montgomery16.R
  = to_sint x * to_sint y %/ Montgomery16.R.
 move: (W16.to_sint_cmp x) (W16.to_sint_cmp y) => /= Bx By.
 move:(to_sintH_bnd x y _ _ _ _ Bx By _ _ _ _) => //=.
 rewrite to_sint_wmulhs /= => BxyH.  
 by rewrite modz_small /R /= /#.
have ->: !2 ^ (16 - 1) <= to_sint x * to_sint y %/ Montgomery16.R.
 move: (W16.to_sint_cmp x) (W16.to_sint_cmp y) => /= Bx By.
 move:(to_sintH_bnd x y _ _ _ _ Bx By _ _ _ _) => //=.
 by rewrite to_sint_wmulhs /R /= /#.
by rewrite /R; smt().
qed.

lemma to_sint_SAR (a : W16.t):
 to_sint (a `|>>` (of_int 10)%W8)
 = to_sint a %/ 2 ^ 10.
proof.
rewrite Fq.SAR_sem10 of_sintK /to_sint /smod /=.
move: (W16.to_uint_cmp a); smt().
qed.

lemma sbred16_eq x:
 Fq.SignedReductions.BREDC (W16.to_sint x) 26
 = W16.to_sint (sbred16 x).
proof.
rewrite /Fq.SignedReductions.BREDC /Fq.SignedReductions.R /sbred16 /q /=.
rewrite /= (_:67108864=2^10*65536) 1:// divzMl //.
rewrite (_:4294967296=65536*65536) 1://.
have E20159: 20159 = to_sint (W16.of_int 20159)
 by rewrite of_sintK /smod /=.
rewrite {1}E20159 smod_R2_R //.
rewrite !Fq.smod_W16 {1}to_sintD; congr.
rewrite -modzDm eq_sym -modzDm eq_sym; congr; congr => //; congr.
 by rewrite !to_sint_mod; move: (W16.to_uint_cmp x); smt().
rewrite -to_sintH.
rewrite -!to_sint_SAR /=. 
have E3329: 3329=to_sint (W16.of_int 3329).
 by rewrite of_sintK /smod /=.
rewrite {1}E3329 to_sintN_cgr modz_mod to_sintM.
rewrite eq_sym -modzNm smod_mod modz_mod.
by rewrite /R /#.
qed.

lemma sbred16_spec x y:
  y = inFqW16 x =>
  Iu16_ub 2 (sbred16 x) y.
proof.
move => ->. rewrite /Iu16_ub -sbred16_eq.
move: (Fq.SignedReductions.BREDCp_corr (to_sint x) 26 _ _ _ _ _ _).
+ by rewrite /Fq.SignedReductions.R /q /=.
+ by rewrite /Fq.SignedReductions.R /q /=.
+ by rewrite /Fq.SignedReductions.R /q /=.
+ by rewrite /Fq.SignedReductions.R /q /=.
+ by move: (W16.to_sint_cmp x); rewrite /Fq.SignedReductions.R /q /= /#.
+ move=> n.
  by rewrite /barrett_pred /barrett_pred_low /barrett_pred_high
       /barrett_fun /barrett_fun_aux /q /Fq.SignedReductions.R /= /#.
smt().
qed.


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
 rewrite /Zq.(+) !inFqK -eq_inFq modzDm to_sintD_small //.
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


abbrev mul1x16 (y: Fq): Fq Array16.t -> Fq Array16.t =
 Array16.map (( *) y).

lemma mul1x16_comp y z x:
 mul1x16 y (mul1x16 z x) = mul1x16 (z*y) x.
proof. by rewrite tP => i Hi; rewrite !mapiE //=; ring. qed.

abbrev mul1x256 (y: Fq): Fq Array256.t -> Fq Array256.t =
 Array256.map (( *) y). 

abbrev mul16x16 = Array16.map2 Zq.( *).

lemma P2C_mul1x16 x (l: Fq Array16.t list) k:
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

abbrev sint32_bnd xL xH x =
 xL <= W32.to_sint x <= xH.

lemma nosmt modzD_sint32 (x y: W32.t):
 (to_sint x + to_sint y) %% W32.modulus
 = (to_uint x + to_uint y) %% W32.modulus.
proof.
rewrite /to_sint /smod.
case: (2 ^ (32 - 1) <= to_uint x);
 case: (2 ^ (32 - 1) <= to_uint y); smt().
qed.

lemma nosmt to_sint32D (x y: W32.t):
 to_sint (x+y)
 = W32.smod ((to_sint x + to_sint y)%%W32.modulus). 
proof.
by rewrite {1}/W32.to_sint to_uintD modzD_sint32.
qed.

lemma nosmt smod32_small (x: int):
 -2^(32-1) <= x < 2^(32-1) => 
 W32.smod (x %% W32.modulus) = x.
proof.
move => [/= Hl Hh]. 
rewrite /smod; case: (x < 0) => C.
 by have ->/#: 2 ^ (32 - 1) <= x %% W32.modulus by smt().
by have ->/#: ! 2 ^ (32 - 1) <= x %% W32.modulus by smt().
qed.

lemma nosmt to_sint32D_small (x y: W32.t):
 W32.min_sint <= to_sint x + to_sint y <= W32.max_sint =>
 to_sint (x+y) = to_sint x + to_sint y.
proof.
move=> /=?; rewrite to_sint32D smod32_small /= /#.
qed.

lemma to_sint32D_bnd (x y : W32.t) (xL xH yL yH : int):
  sint32_bnd xL xH x =>
  sint32_bnd yL yH y =>
  W32.min_sint <= xL + yL =>
  xH + yH <= W32.max_sint =>
  sint32_bnd (xL + yL) (xH + yH) (x + y).
proof.
by move=> /> *; rewrite to_sint32D_small /#. 
qed.
(*
lemma nosmt modzN_sint32 (x: W32.t):
 (- to_sint x) %% W32.modulus
 = (- to_uint x) %% W32.modulus.
proof.
rewrite /to_sint /smod.
case: (2 ^ (32 - 1) <= to_uint x); smt().
qed.

lemma nosmt to_sint32N (x: W32.t):
 to_sint (-x)
 = W32.smod ((-to_sint x) %% W32.modulus).
proof.
by rewrite {1}/W32.to_sint to_uintN modzN_sint32.
qed.
*)
lemma nosmt modzB_sint32 (x y: W32.t):
 (to_sint x - to_sint y) %% W32.modulus
 = (to_uint x - to_uint y) %% W32.modulus.
proof.
rewrite /to_sint /smod.
case: (2 ^ (32 - 1) <= to_uint x);
 case: (2 ^ (32 - 1) <= to_uint y); smt().
qed.

lemma nosmt to_sint32B (x y: W32.t):
 to_sint (x-y)
 = W32.smod ((to_sint x - to_sint y)%%W32.modulus). 
proof.
rewrite {1}/W32.to_sint to_uintD to_uintN modzB_sint32 /#.
qed.

lemma to_sint32B_small (x y: W32.t):
 W32.min_sint <= to_sint x - to_sint y <= W32.max_sint =>
 to_sint (x-y) = to_sint x - to_sint y.
proof.
by move=> /= ?; rewrite to_sint32B smod32_small /= /#.
qed.


lemma to_sint32B_bnd (x y : W32.t) (xL xH yL yH : int):
  sint32_bnd xL xH x =>
  sint32_bnd yL yH y =>
  W32.min_sint <= xL - yH =>
  xH-yL <= W32.max_sint =>
  sint32_bnd (xL-yH) (xH-yL) (x - y).
proof.
by move=> /> *; rewrite to_sint32B_small /#.
qed.

lemma int_bnd_div xL xH x y:
 0 < y =>
 (xL <= x <= xH)%Int =>
 (xL %/ y) <= (x %/ y) <= (xH %/ y)
by smt(). 

lemma sint_bnd_u32H bL bH (x: W32.t) (xh xl: W16.t):
 to_sint x = to_sint xh * W16.modulus + to_uint xl =>
 sint32_bnd bL bH x =>
 sint_bnd (bL %/ W16.modulus) (bH %/ W16.modulus) xh.
proof.
move=> -> H.
have <-: (to_sint xh * Montgomery16.R + to_uint xl) %/ W16.modulus = to_sint xh.
 rewrite edivz_eq //.
 by move: (W16.to_uint_cmp xl); smt().
by apply int_bnd_div.
qed.

lemma sint32_bnd_u16H bL bH (xh xl: W16.t) (x: W32.t):
 to_sint x = to_sint xh * W16.modulus + to_uint xl =>
 sint_bnd bL bH xh =>
 sint32_bnd (bL*W16.modulus) ((bH+1)*W16.modulus-1) x.
proof.
move=> -> H.
split.
 by move: (W16.to_uint_cmp xl); smt().
by move=> _; move: (W16.to_uint_cmp xl); smt().
qed.

lemma W32_shr16_bits16H (w: W32.t):
 w `>>` (W8.of_int 16) \bits16 1 = W16.zero.
proof.
by apply W16.all_eq_eq; rewrite shr_shrw 1://.
qed.

lemma VPSRL_8u32_16 x k:
 0 <= k < 16 =>
 (VPSRL_8u32 x (W8.of_int 16)) \bits16 k
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
by rewrite /VPBLENDW_256 /VPBLENDW_128 /= /W8.of_int /int2bs /mkseq -iotaredE /=.
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

(* require import AVX2_Ops. *)

lemma W32_unpack16E (x: W32.t):
 x = pack2 [x \bits16 0; x \bits16 1].
proof.
rewrite -{1}unpack16K /unpack16 /=; congr.
by rewrite init_of_list -iotaredE /=.
qed.

lemma nosmt modz_sint32 (x: W32.t):
 (to_sint x) %% W16.modulus
 = (to_uint x) %% W16.modulus.
proof.
rewrite /to_sint /smod.
case: (2 ^ (32 - 1) <= to_uint x) => Cx.
 have ->: W32.modulus = W16.modulus * W16.modulus by done.
 by rewrite -modzDm -modzNm -modzMm modzz /= modz_mod.
done.
qed.

lemma to_sint32_bits16 (x: W32.t):
 to_sint x = W16.to_sint (x \bits16 1) * W16.modulus + W16.to_uint (x \bits16 0).
proof.
rewrite (divz_eq (to_sint x) W16.modulus) modz_sint32.
rewrite !bits16_div //=; congr.
 congr; rewrite !to_sintE !of_uintK modz_small /smod.
  by move: (W32.to_uint_cmp x); smt().
 case: (2^(32-1) <= to_uint x) => /= E.
  have ->/=: 2^(16-1) <= to_uint x %/ 65536 by rewrite /= /#.
  smt().
 have ->/=: ! 32768 <= to_uint x %/ 65536 by rewrite /= /#.
 done.
by rewrite of_uintK.
qed.

lemma to_sint_pack2 l h:
 W32.to_sint (W2u16.pack2 [l;h])
 = to_sint h*W16.modulus + to_uint l.
proof. by rewrite to_sint32_bits16 pack2bE. qed.


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

op I16u16LH_sb (b:int) (yl yh: W256.t) (x: Fq Array16.t) =
 all (fun k=> x.[k] = inFq (to_sint (pack2 [yl \bits16 k; yh \bits16 k]))
              /\ sint32_bnd (-b) b (pack2 [yl \bits16 k; yh \bits16 k]))
     (iota_ 0 16).

op I16u32AB_sb (b:int) (yA yB: W256.t) (x: Fq Array16.t) =
 all (fun k=> let y = (if k%/4%%2=0 then yA else yB) \bits32 (k%%4) + 4*(k%/8)
              in x.[k] = inFq (to_sint y)
                 /\ sint32_bnd (-b) b y )
     (iota_ 0 16).

phoare deinterleave_u16_ph b _x:
 [ Jkem_avx2.M.__w256_deinterleave_u16:
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
do 15! (split; first by
 rewrite packus_4u32_0H 1:/# /= VPBLENDW_256_170 //= 1:/#
         packus_4u32_0H 1:/# W256_bits128_bits16 //= VPSRL_8u32_16 //= /#).
by  rewrite packus_4u32_0H 1:/# /= VPBLENDW_256_170 //= 1:/#
      packus_4u32_0H 1:/# W256_bits128_bits16 //= VPSRL_8u32_16 //= /#.
qed.

phoare interleave_u16_ph b _x:
 [ Jkem_avx2.M.__w256_interleave_u16:
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
proof. by move => [??] [??]; rewrite to_sint_wmuls16 /#. qed.

phoare wmul_16u16_ph n _x _y:
  [ Jkem_avx2.M.__wmul_16u16:
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
rewrite /VPMULL_16u16 /VPMULH_16u16 /= !to_sint_wmuls16 !inFqM.
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
by rewrite !to_sint32D_small 1..16:/# !inFqD /#. 
qed.

lemma sub_16u32AB_sb b xA xB x yA yB y:
 I16u32AB_sb b xA xB x =>
 I16u32AB_sb b yA yB y =>
 b+b <= W32.max_sint =>
 I16u32AB_sb (b+b) (VPSUB_8u32 xA yA) (VPSUB_8u32 xB yB) (map2 Zq.(-) x y).
proof.
rewrite /I16u32AB_sb -iotaredE /VPSUB_8u32 /= => |> *.
have ?: W32.min_sint <= b+b <= W32.max_sint by smt().
by rewrite !to_sint32B_small 1..16:/# !inFqB /#. 
qed.

lemma fqmulprecomp16x_ll: 
 islossless Jkem_avx2.M.__fqmulprecomp16x 
by islossless.


lemma mulR_inv (a b : Fq) :
  (a * inFq Montgomery16.R = b) <=> (a = b * inFq Montgomery16.Rinv).
proof.
have := RRinv; rewrite /R /Rinv => />.
rewrite -!Zq.ComRing.mulrA -!inFqM /= inFq_mod => ->.
by rewrite -inFq_mod !ZqField.mulr1.
qed.

hoare fqmulprecomp16x_h n _a _b: 
 Jkem_avx2.M.__fqmulprecomp16x :
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
smt(W16.WRingA.mulrC W16.WRingA.mulrAC). 
move :(Ha i _); first smt(mem_iota).
rewrite initiE 1:/#.
rewrite /Iu16_ub -andaE. 
rewrite mulR_inv. apply andaW => /= Ha1 Ha2.
move :(Hb i). rewrite mem_iota initiE 1:/#. rewrite Hi1 Hi2 /=. rewrite /Iu16_sb -andaE. apply andaW => Hb1 Hb2.
rewrite /map2 initiE // /=. rewrite Ha1 Hb1. 
have := (Montgomery16.REDCmul16_correct (b{m} \bits16 i) (ah{m} \bits16 i)). rewrite (_:Montgomery16.q=q) 1:/#. rewrite Ha2 /=. 
rewrite -andaE. rewrite eq_inFq. apply andaW => H1 H2. rewrite H1. split. rewrite !inFqM. rewrite -!Zq.ComRing.mulrA. smt(Zq.ComRing.mulrC Zq.ComRing.mulrA).
smt().
qed.

phoare fqmulprecomp16x_ph n _a _b:
 [ Jkem_avx2.M.__fqmulprecomp16x :
   x16_spec q qx16 /\
   qinv16u16M al ah /\
   I16u16M_ub 1 ah _a /\
   I16u16_sb n b _b
   ==> I16u16_sb 1 res (mul16x16 _a _b) ] = 1%r.
proof. by conseq fqmulprecomp16x_ll (fqmulprecomp16x_h n _a _b). qed.

lemma mont_red_ll:
 islossless Jkem_avx2.M.__mont_red
by islossless.

hoare mont_red_h _x:
 Jkem_avx2.M.__mont_red:
  x16_spec q qx16 /\
  x16_spec 62209 qinvx16 /\
  I16u16LH_sb 88657928 lo hi _x
  ==>
  I16u16S_sb (inFq 169) 1 res _x.
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
 rewrite H1 to_sint_pack2 /= inFq_mod (inFq_mod 169).
 by rewrite -inFqM inFq_mod modzMm /q -HHA /#.
smt().
qed.

phoare mont_red_ph _x:
 [ Jkem_avx2.M.__mont_red:
   x16_spec q qx16 /\
   x16_spec 62209 qinvx16 /\
   I16u16LH_sb 88657928 lo hi _x
   ==>
   I16u16S_sb (inFq 169) 1 res _x ] = 1%r.
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
 Jkem_avx2.M.__schoolbook16x ~ NTT_AVX.__cmplx_mulx16:
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
 I16u16S_sb (inFq 169) 1 res{1}.`1 res{2}.`1 /\
 I16u16S_sb (inFq 169) 1 res{1}.`2 res{2}.`2.
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
 rewrite !map2iE 1..3:// inFqN; ring. 
 by rewrite ZqField.mulr1; ring.
move=> HriAB [riL riH] /= HriLH.
move: (add_16u32AB_sb _ _ _ _ _ _ _ Hbc Had) => /= H.
apply (I16u32AB_sb_eqx _ _ _ _ _ H); rewrite tP => k Hk /=.
rewrite map2iE 1:// initiE 1:// /cmplx_mul /=.
by rewrite !map2iE 1..2://; ring.
qed.


(** Butterfly *)

lemma nosmt REDCmul16Fq (x y: W16.t):
 sint_bnd 0 (q-1) y =>
 inFqW16 (Montgomery16.REDCmul16 x y)
 = inFqW16 x * inFqW16 y * inFq Montgomery16.Rinv
 /\ sint_bnd (-(q-1)) (q-1) (Montgomery16.REDCmul16 x y).
proof.
move: (Montgomery16.REDCmul16_correct x y).
rewrite /Montgomery16.q /q /Montgomery16.Rinv.
move => H1 H2; move: (H1 H2) => {H1} {H2} [H1 H2].
split => //.
by rewrite -(inFqM_mod (to_sint x)) -inFqM_mod /q modzMml -H1 /#.
qed.

lemma butterfly_r (c:int) xl xr z rxl rxr rzM rzMqinv rq:
 (c+1)*q <= W16.max_sint =>
 rq = W16.of_int q =>
 Iu16_sb c rxl xl =>
 Iu16_sb c rxr xr =>
 Iu16M_ub 1 rzM z =>
 rzMqinv = rzM * (W16.of_int 62209) =>
 Iu16_sb (c+1) 
   (wmulhs rzM rxr + rxl - wmulhs (rzMqinv * rxr) rq)
   (xl+z*xr).
proof.
move => Hbnd Hq [-> Hxl] [-> Hxr] [HzM HzBnd] ->.
have ->: wmulhs rzM rxr + rxl - wmulhs (rzM * (of_int 62209)%W16 * rxr) rq
 = rxl + (wmulhs rzM rxr - wmulhs (rzM * (of_int 62209)%W16 * rxr) rq) by ring.
apply Iu16_sbD; first 2 done.
pose t := (_ + - _)%W16.
have ->: t = Montgomery16.REDCmul16 rxr rzM.
 rewrite /t /REDC16 /Montgomery16.q /Montgomery16.qinv Hq /q /=.
 congr.
  by rewrite /wmulhs /#.
 by congr; congr; ring.
have := Montgomery16.REDCmul16_correct rxr rzM _.
 smt().
rewrite (_:Montgomery16.q=q) 1:/#; move => /= [H1 H2].
split.
 rewrite -(asintK z) -inFqM -eq_inFq H1.
 have Hone: Kyber.Zq.one = inFq Montgomery16.R * inFq Montgomery16.Rinv. 
  by rewrite -inFqM -eq_inFq -Montgomery16.RRinv /#.
 have ->: z = inFqW16 rzM * inFq Montgomery16.Rinv. 
  by rewrite -(ZqField.mul1r z) ZqField.mulrC Hone ZqField.mulrA HzM.
 by rewrite -inFqM inFqK modzMml /#.
rewrite /=; apply (sint_bndW _ _ _ _ _ _ _ H2); smt().
qed.

lemma butterfly16x_rE (n:int) xl xr z rxl rxr rzM rzMqinv rq16x:
 (n+1)*q <= W16.max_sint =>
 I16u16_sb n rxl xl =>
 I16u16_sb n rxr xr =>
 qinv16u16M rzMqinv rzM =>
 I16u16M_ub 1 rzM z =>
 x16_spec q rq16x =>
 I16u16_sb (n+1)
  (VPSUB_16u16 (VPADD_16u16 (VPMULH_16u16 rzM rxr) rxl) (VPMULH_16u16 (VPMULL_16u16 rzMqinv rxr) rq16x))
  (Array16.init (fun i=>xl.[i]+z.[i]*xr.[i])).
proof.
rewrite -3!allP_range.
move=> Hbnd Hl Hr /qinv16u16M_bits16 Hqinv Hz /x16_spec_bits16 Hq.
rewrite /VPSUB_16u16 /VPADD_16u16 /VPMULH_16u16 /VPMULL_16u16 /= -iotaredE /R2C /=.
do 15! (split; first by apply butterfly_r; [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv]).
by apply butterfly_r; [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv].
qed.

lemma butterfly_l (c:int) xl xr z rxl rxr rzM rzMqinv rq:
 (c+1)*q <= W16.max_sint =>
 rq = W16.of_int q =>
 Iu16_sb c rxl xl =>
 Iu16_sb c rxr xr =>
 Iu16M_ub 1 rzM z =>
 rzMqinv = rzM * (W16.of_int 62209) =>
 Iu16_sb (c+1) 
   (wmulhs (rzMqinv * rxr) rq + (rxl - wmulhs rzM rxr))
   (xl-z*xr).
proof.
move => Hbnd Hq [-> Hxl] [-> Hxr] [HzM HzBnd] ->.
have ->: wmulhs (rzM * (of_int 62209)%W16 * rxr) rq + (rxl - wmulhs rzM rxr)
 = rxl - (wmulhs rzM rxr - wmulhs (rzM * (of_int 62209)%W16 * rxr) rq) by ring.
apply Iu16_sbD; first 2 by done.
pose t := (- _)%W16.
have ->: t = - Montgomery16.REDCmul16 rxr rzM.
 rewrite /t /REDC16 /Montgomery16.q /Montgomery16.qinv Hq /q /=.
 congr; congr.
  by rewrite /wmulhs /#.
 by congr; congr; ring.
have := Montgomery16.REDCmul16_correct rxr rzM _.
 smt().
rewrite (_:Montgomery16.q=q) 1:/#; move => /= [H1 H2].
have /=H2':= to_sintN_bnd _ _ _ H2 _.
 smt().
split.
 rewrite to_sintN_small 1:/# inFqN; congr.
 rewrite -(asintK z) -inFqM -eq_inFq H1.
 have Hone: Kyber.Zq.one = inFq Montgomery16.R * inFq Montgomery16.Rinv. 
  by rewrite -inFqM -eq_inFq -Montgomery16.RRinv /#.
 have ->: z = inFqW16 rzM * inFq Montgomery16.Rinv. 
  by rewrite -(ZqField.mul1r z) ZqField.mulrC Hone ZqField.mulrA HzM.
 by rewrite -inFqM inFqK modzMml /#.
rewrite /=; apply (sint_bndW _ _ _ _ _ _ _ H2'); smt().
qed.

lemma butterfly16x_lE (n:int) xl xr z rxl rxr rzM rzMqinv rq16x:
 (n+1)*q <= W16.max_sint =>
 I16u16_sb n rxl xl =>
 I16u16_sb n rxr xr =>
 qinv16u16M rzMqinv rzM =>
 I16u16M_ub 1 rzM z =>
 x16_spec q rq16x =>
 I16u16_sb (n+1)
  (VPADD_16u16 (VPMULH_16u16 (VPMULL_16u16 rzMqinv rxr) rq16x) (VPSUB_16u16 rxl (VPMULH_16u16 rzM rxr)))
  (Array16.init (fun i=>xl.[i]-z.[i]*xr.[i])).
proof.
rewrite -3!allP_range.
move=> Hbnd Hl Hr /qinv16u16M_bits16 Hqinv Hz /x16_spec_bits16 Hq.
rewrite /VPSUB_16u16 /VPADD_16u16 /VPMULH_16u16 /VPMULL_16u16 /= -iotaredE /R2C /=.
do 15! (split; first by apply butterfly_l; [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv]).
by apply butterfly_l; [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv].
qed.

equiv butterfly64x_eq c:
 NTT_AVX.__butterfly64x ~ Jkem_avx2.M.__butterfly64x :
 (c+1)*q <= W16.max_sint /\
 I16u16_sb c rl0{2} rl0t{1} /\
 I16u16_sb c rl1{2} rl1t{1} /\
 I16u16_sb c rl2{2} rl2t{1} /\
 I16u16_sb c rl3{2} rl3t{1} /\
 I16u16_sb c rh0{2} rh0t{1} /\
 I16u16_sb c rh1{2} rh1t{1} /\
 I16u16_sb c rh2{2} rh2t{1} /\
 I16u16_sb c rh3{2} rh3t{1} /\
 qinv16u16M zl0{2} zh0{2} /\
 qinv16u16M zl1{2} zh1{2} /\
 I16u16M_ub 1 zh0{2} z0{1} /\
 I16u16M_ub 1 zh1{2} z1{1} /\
 x16_spec q qx16{2}
 ==>
 I16u16_sb (c+1) res{2}.`1 res{1}.`1 /\
 I16u16_sb (c+1) res{2}.`2 res{1}.`2 /\
 I16u16_sb (c+1) res{2}.`3 res{1}.`3 /\
 I16u16_sb (c+1) res{2}.`4 res{1}.`4 /\
 I16u16_sb (c+1) res{2}.`5 res{1}.`5 /\
 I16u16_sb (c+1) res{2}.`6 res{1}.`6 /\
 I16u16_sb (c+1) res{2}.`7 res{1}.`7 /\
 I16u16_sb (c+1) res{2}.`8 res{1}.`8.
proof.
proc; sp 1 0; simplify.
wp; skip => |> &1 &2 Hbnd H0 H1 H2 H3 H4 H5 H6 H7 Hqinv0 Hqinv1 Hzl Hzh Hq.
do 4! (split; first by apply butterfly16x_rE).
do 3! (split; first by apply butterfly16x_lE).
by apply butterfly16x_lE.
qed.

(** SHUFFLE Ops *)

lemma __shuffle8_ll: islossless Jkem_avx2.M.__shuffle8 by islossless.

hoare __shuffle8_h na nb _a _b:
 Jkem_avx2.M.__shuffle8:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle8 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle8 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPERM2I128 /=.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE.
rewrite ifT.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE.
rewrite ifT.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE.
rewrite /of_int /int2bs /mkseq -iotaredE /=
    !b2i0 !b2i1 /shuffle8 /=.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
smt().
qed.

phoare __shuffle8_ph' n _a _b:
 [ Jkem_avx2.M.__shuffle8:
   I16u16_sb n a _a /\ I16u16_sb n b _b
   ==> I16u16_sb n res.`1 (shuffle8 _a _b).`1
       /\ I16u16_sb n res.`2 (shuffle8 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle8_ll (__shuffle8_h n n _a _b). qed.

phoare __shuffle8_ph na nb _a _b:
 [ Jkem_avx2.M.__shuffle8:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle8 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle8 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle8_ll (__shuffle8_h na nb _a _b). qed.

lemma __shuffle4_ll: islossless Jkem_avx2.M.__shuffle4 by islossless.

hoare __shuffle4_h na nb _a _b:
 Jkem_avx2.M.__shuffle4:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle4 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle4 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPUNPCKL_4u64 /VPUNPCKH_4u64 /VPUNPCKL_2u64 /VPUNPCKH_2u64 /= /shuffle4 /= /interleave_gen /get_lo_2u64 /get_hi_2u64 /=.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
by rewrite -!iotaredE /= /#.
qed.

phoare __shuffle4_ph na nb _a _b:
 [ Jkem_avx2.M.__shuffle4:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle4 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle4 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle4_ll (__shuffle4_h na nb _a _b). qed.

lemma __shuffle2_ll: islossless Jkem_avx2.M.__shuffle2 by islossless.

require import AVX2_Ops.
hoare __shuffle2_h na nb _a _b:
 Jkem_avx2.M.__shuffle2:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle2 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle2 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPBLENDD_256 /VMOVSLDUP_8u32 /VMOVSLDUP_4u32 /VPSRL_4u64 /shuffle2 /= /int_bit /=.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
rewrite -!iotaredE /= => |>.
by rewrite !bits64_shr32_bits16 /= /#.
qed.

phoare __shuffle2_ph na nb _a _b:
 [ Jkem_avx2.M.__shuffle2:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle2 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle2 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle2_ll (__shuffle2_h na nb _a _b). qed.

lemma __shuffle1_ll: islossless Jkem_avx2.M.__shuffle1 by islossless.

hoare __shuffle1_h na nb _a _b:
 Jkem_avx2.M.__shuffle1:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle1 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle1 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPBLENDW_256 /VPBLENDW_128 /VPSLL_8u32 /VPSRL_8u32 /shuffle1 /= W2u128_W16u16 /int_bit /=.
rewrite /= !bits32_shl16_bits16H // !bits32_shr16_bits16L //=.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
by rewrite -!iotaredE /= => |> /#.
qed.

phoare __shuffle1_ph na nb _a _b:
 [ Jkem_avx2.M.__shuffle1:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle1 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle1 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle1_ll (__shuffle1_h na nb _a _b). qed.

(* Poly reduction *)
lemma __red16x_ll: islossless Jkem_avx2.M.__red16x by islossless.

hoare __red16x_h n y:
 Jkem_avx2.M.__red16x :
    x16_spec q qx16 /\
    x16_spec 20159 vx16 /\
    I16u16_sb n r y ==> I16u16_ub 2 res y.
proof.
proc; simplify.
wp; skip => |> &m.
rewrite !x16_spec_bits16 => Hq Hv.
rewrite -!iotaredE /VPSUB_16u16 /VPMULL_16u16 /VPMULH_16u16 /VPSRA_16u16 /R2C /= => |> *.
move: (sbred16_spec).
smt(sbred16_spec).
qed.

phoare __red16x_ph n x:
 [ Jkem_avx2.M.__red16x :
    x16_spec q qx16 /\
    x16_spec 20159 vx16 /\
    I16u16_sb n r x ==> I16u16_ub 2 res x ] = 1%r.
proof. by conseq __red16x_ll (__red16x_h n x). qed.

phoare __red16x_sb_ph n x:
 [ Jkem_avx2.M.__red16x :
    x16_spec q qx16 /\
    x16_spec 20159 vx16 /\
    I16u16_sb n r x ==> I16u16_sb 2 res x ] = 1%r.
proof. 
proc*.
call (__red16x_ph n x).
by skip => /> *; apply I16u16_ub_sb.
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
    (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
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
    (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
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
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
      r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (8+196*i);
      zeta1 <- z2u256 zetasp (24+196*i);
      (r0, r4) <@ Jkem_avx2.M.__shuffle8 (r0, r4);
      (r1, r5) <@ Jkem_avx2.M.__shuffle8 (r1, r5);
      (r2, r6) <@ Jkem_avx2.M.__shuffle8 (r2, r6);
      (r3, r7) <@ Jkem_avx2.M.__shuffle8 (r3, r7);
      (r0, r4, r1, r5, r2, r6, r3, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r4, r1, r5, r2,
      r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (40+196*i);
      zeta1 <- z2u256 zetasp (56+196*i);
      (r0, r2) <@ Jkem_avx2.M.__shuffle4 (r0, r2);
      (r4, r6) <@ Jkem_avx2.M.__shuffle4 (r4, r6);
      (r1, r3) <@ Jkem_avx2.M.__shuffle4 (r1, r3);
      (r5, r7) <@ Jkem_avx2.M.__shuffle4 (r5, r7);
      (r0, r2, r4, r6, r1, r3, r5, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r2, r4, r6, r1,
      r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (72+196*i);
      zeta1 <- z2u256 zetasp (88+196*i);
      (r0, r1) <@ Jkem_avx2.M.__shuffle2 (r0, r1);
      (r2, r3) <@ Jkem_avx2.M.__shuffle2 (r2, r3);
      (r4, r5) <@ Jkem_avx2.M.__shuffle2 (r4, r5);
      (r6, r7) <@ Jkem_avx2.M.__shuffle2 (r6, r7);
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
      r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (104+196*i);
      zeta1 <- z2u256 zetasp (120+196*i);
      (r0, r4) <@ Jkem_avx2.M.__shuffle1 (r0, r4);
      (r1, r5) <@ Jkem_avx2.M.__shuffle1 (r1, r5);
      (r2, r6) <@ Jkem_avx2.M.__shuffle1 (r2, r6);
      (r3, r7) <@ Jkem_avx2.M.__shuffle1 (r3, r7);
      (r0, r4, r1, r5, r2, r6, r3, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r4, r1, r5, r2,
      r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (136+196*i);
      zeta1 <- z2u256 zetasp (168+196*i);
      zeta2 <- z2u256 zetasp (152+196*i);
      zeta3 <- z2u256 zetasp (184+196*i);
      (r0, r4, r2, r6, r1, r5, r3, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r4, r2, r6, r1,
      r5, r3, r7, zeta0, zeta1, zeta2, zeta3, qx16);
      vx16 <- C2R vx16_op;
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      r4 <@ Jkem_avx2.M.__red16x (r4, qx16, vx16);
      r2 <@ Jkem_avx2.M.__red16x (r2, qx16, vx16);
      r6 <@ Jkem_avx2.M.__red16x (r6, qx16, vx16);
      r1 <@ Jkem_avx2.M.__red16x (r1, qx16, vx16);
      r5 <@ Jkem_avx2.M.__red16x (r5, qx16, vx16);
      r3 <@ Jkem_avx2.M.__red16x (r3, qx16, vx16);
      r7 <@ Jkem_avx2.M.__red16x (r7, qx16, vx16);
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
      (r0, r1, r4, r5, r2, r3, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
      r4, r5, r2, r3, r6, r7, zeta0, zeta1, zeta2, zeta3, qx16);
      (* 8 8 1 1 8 8 1 1 - 4 *)
      vx16 <- C2R vx16_op;
      zeta0 <- z2u256 zetasp (64 + (196 * i));
      zeta1 <- z2u256 zetasp (80 + (196 * i));
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      r1 <@ Jkem_avx2.M.__red16x (r1, qx16, vx16);
      r4 <@ Jkem_avx2.M.__red16x (r4, qx16, vx16);
      r5 <@ Jkem_avx2.M.__red16x (r5, qx16, vx16);      
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
      r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 4 4 2 2 1 1 1 1 - 0 *)
      (r0, r1) <@ Jkem_avx2.M.__shuffle1 (r0, r1);
      (r2, r3) <@ Jkem_avx2.M.__shuffle1 (r2, r3);
      (r4, r5) <@ Jkem_avx2.M.__shuffle1 (r4, r5);
      (r6, r7) <@ Jkem_avx2.M.__shuffle1 (r6, r7);
      zeta0 <- z2u256 zetasp (96 + (196 * i));
      zeta1 <- z2u256 zetasp (112 + (196 * i));
      (r0, r2, r4, r6, r1, r3, r5, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r2,
      r4, r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 1 4 1 2 1 2 1 - 1 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      (r0, r2) <@ Jkem_avx2.M.__shuffle2 (r0, r2);
      (r4, r6) <@ Jkem_avx2.M.__shuffle2 (r4, r6);
      (r1, r3) <@ Jkem_avx2.M.__shuffle2 (r1, r3);
      (r5, r7) <@ Jkem_avx2.M.__shuffle2 (r5, r7);
      zeta0 <- z2u256 zetasp (128 + (196 * i));
      zeta1 <- z2u256 zetasp (144 + (196 * i));
      (r0, r4, r1, r5, r2, r6, r3, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r4,
      r1, r5, r2, r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 2 1 1 4 2 1 1 - 1 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      (r0, r4) <@ Jkem_avx2.M.__shuffle4 (r0, r4);
      (r1, r5) <@ Jkem_avx2.M.__shuffle4 (r1, r5);
      (r2, r6) <@ Jkem_avx2.M.__shuffle4 (r2, r6);
      (r3, r7) <@ Jkem_avx2.M.__shuffle4 (r3, r7);
      zeta0 <- z2u256 zetasp (160 + (196 * i));
      zeta1 <- z2u256 zetasp (176 + (196 * i));
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
      r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 4 2 2 1 1 1 1 - 1 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      (r0, r1) <@ Jkem_avx2.M.__shuffle8 (r0, r1);
      (r2, r3) <@ Jkem_avx2.M.__shuffle8 (r2, r3);
      (r4, r5) <@ Jkem_avx2.M.__shuffle8 (r4, r5);
      (r6, r7) <@ Jkem_avx2.M.__shuffle8 (r6, r7);
      zeta0 <- VPBROADCAST_8u32 (z2u32 zetasp (192 + (196 * i)));
      zeta1 <- VPBROADCAST_8u32 (z2u32 zetasp (194 + (196 * i)));
      (r0, r2, r4, r6, r1, r3, r5, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r2,
      r4, r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 1 4 1 2 1 2 1 - 1 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
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
    flox16 <- C2R flox16_op;
    fhix16 <- C2R fhix16_op;
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
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
        r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 4 8 4 4 1 1 1 1 *)
      rp <- PUR rp (8+4*i) r4;
      rp <- PUR rp (9+4*i) r5;
      rp <- PUR rp (10+4*i) r6;
      rp <- PUR rp (11+4*i) r7;
      r0 <@ Jkem_avx2.M.__fqmulprecomp16x (r0, flox16, fhix16, qx16);
      r1 <@ Jkem_avx2.M.__fqmulprecomp16x (r1, flox16, fhix16, qx16);
      r2 <@ Jkem_avx2.M.__fqmulprecomp16x (r2, flox16, fhix16, qx16);
      r3 <@ Jkem_avx2.M.__fqmulprecomp16x (r3, flox16, fhix16, qx16);
      rp <- PUR rp (0+4*i) r0;
      rp <- PUR rp (1+4*i) r1;
      rp <- PUR rp (2+4*i) r2;
      rp <- PUR rp (3+4*i) r3;
      i <- i + 1;
    }
    return (rp);
  }
  proc _invntt2 (rp:W16.t Array256.t) : W16.t Array256.t = {
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
      (r0, r1, r4, r5, r2, r3, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
      r4, r5, r2, r3, r6, r7, zeta0, zeta1, zeta2, zeta3, qx16);
      (* 4 4 1 1 4 4 1 1 *) (* 8 8 1 1 8 8 1 1 - 4 *)
      vx16 <- C2R vx16_op;
      zeta0 <- z2u256 zetasp (64 + (196 * i));
      zeta1 <- z2u256 zetasp (80 + (196 * i));
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
      r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 8 2 2 1 1 1 1 *) (* 4 4 2 2 1 1 1 1 - 0 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      r1 <@ Jkem_avx2.M.__red16x (r1, qx16, vx16);      
      (r0, r1) <@ Jkem_avx2.M.__shuffle1 (r0, r1);
      (r2, r3) <@ Jkem_avx2.M.__shuffle1 (r2, r3);
      (r4, r5) <@ Jkem_avx2.M.__shuffle1 (r4, r5);
      (r6, r7) <@ Jkem_avx2.M.__shuffle1 (r6, r7);
      zeta0 <- z2u256 zetasp (96 + (196 * i));
      zeta1 <- z2u256 zetasp (112 + (196 * i));
      (r0, r2, r4, r6, r1, r3, r5, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r2,
      r4, r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (*.4 1 4 1 2 1 2 1 *) (* 8 1 4 1 2 1 2 1 - 1 *)
      (r0, r2) <@ Jkem_avx2.M.__shuffle2 (r0, r2);
      (r4, r6) <@ Jkem_avx2.M.__shuffle2 (r4, r6);
      (r1, r3) <@ Jkem_avx2.M.__shuffle2 (r1, r3);
      (r5, r7) <@ Jkem_avx2.M.__shuffle2 (r5, r7);
      zeta0 <- z2u256 zetasp (128 + (196 * i));
      zeta1 <- z2u256 zetasp (144 + (196 * i));
      (r0, r4, r1, r5, r2, r6, r3, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r4,
      r1, r5, r2, r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 2 1 1 4 2 1 1 *) (* 8 2 1 1 2 2 1 1 - 1 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      (r0, r4) <@ Jkem_avx2.M.__shuffle4 (r0, r4);
      (r1, r5) <@ Jkem_avx2.M.__shuffle4 (r1, r5);
      (r2, r6) <@ Jkem_avx2.M.__shuffle4 (r2, r6);
      (r3, r7) <@ Jkem_avx2.M.__shuffle4 (r3, r7);
      zeta0 <- z2u256 zetasp (160 + (196 * i));
      zeta1 <- z2u256 zetasp (176 + (196 * i));
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
      r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 4 2 2 1 1 1 1 *) (* 4 4 2 2 1 1 1 1 - 0 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      (r0, r1) <@ Jkem_avx2.M.__shuffle8 (r0, r1);
      (r2, r3) <@ Jkem_avx2.M.__shuffle8 (r2, r3);
      (r4, r5) <@ Jkem_avx2.M.__shuffle8 (r4, r5);
      (r6, r7) <@ Jkem_avx2.M.__shuffle8 (r6, r7);
      zeta0 <- VPBROADCAST_8u32 (z2u32 zetasp (192 + (196 * i)));
      zeta1 <- VPBROADCAST_8u32 (z2u32 zetasp (194 + (196 * i)));
      (r0, r2, r4, r6, r1, r3, r5, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r2,
      r4, r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 1 4 1 2 1 2 1 *) (* 8 1 4 1 2 1 2 1 - 1 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
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
    flox16 <- C2R flox16_op;
    fhix16 <- C2R fhix16_op;
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
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
        r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 4 8 4 4 1 1 1 1 *)
      rp <- PUR rp (8+4*i) r4;
      rp <- PUR rp (9+4*i) r5;
      rp <- PUR rp (10+4*i) r6;
      rp <- PUR rp (11+4*i) r7;
      r0 <@ Jkem_avx2.M.__fqmulprecomp16x (r0, flox16, fhix16, qx16);
      r1 <@ Jkem_avx2.M.__fqmulprecomp16x (r1, flox16, fhix16, qx16);
      r2 <@ Jkem_avx2.M.__fqmulprecomp16x (r2, flox16, fhix16, qx16);
      r3 <@ Jkem_avx2.M.__fqmulprecomp16x (r3, flox16, fhix16, qx16);
      rp <- PUR rp (0+4*i) r0;
      rp <- PUR rp (1+4*i) r1;
      rp <- PUR rp (2+4*i) r2;
      rp <- PUR rp (3+4*i) r3;
      i <- i + 1;
    }
    return (rp);
  }
  proc __ntt_level0 (rp:W16.t Array256.t) : W16.t Array256.t = {
    var zetasp:W16.t Array400.t;
    var qx16:W256.t;
    var zeta0:W256.t;
    var zeta1:W256.t;
    var r0:W256.t;
    var r1:W256.t;
    var r2:W256.t;
    var r3:W256.t;
    var r4:W256.t;
    var r5:W256.t;
    var r6:W256.t;
    var r7:W256.t;
    zetasp <- witness;
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
    (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
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
    (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
    r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
    rp <- PUR rp 4 r0;
    rp <- PUR rp 5 r1;
    rp <- PUR rp 6 r2;
    rp <- PUR rp 7 r3;
    rp <- PUR rp 12 r4;
    rp <- PUR rp 13 r5;
    rp <- PUR rp 14 r6;
    rp <- PUR rp 15 r7;
    return (rp);
  }
  proc __ntt_level1t6 (rp:W16.t Array256.t) : W16.t Array256.t = {
    var zetasp:W16.t Array400.t;
    var qx16:W256.t;
    var i:int;
    var zeta0:W256.t;
    var zeta1:W256.t;
    var r0:W256.t;
    var r1:W256.t;
    var r2:W256.t;
    var r3:W256.t;
    var r4:W256.t;
    var r5:W256.t;
    var r6:W256.t;
    var r7:W256.t;
    var zeta2:W256.t;
    var zeta3:W256.t;
    var vx16:W256.t;
    zetasp <- witness;
    zetasp <- zetas_op;
    qx16 <- C2R qx16_op;
    i <- 0;
    while (i < 2) {
      zeta0 <- VPBROADCAST_8u32 (z2u32 zetasp (4+196*i));
      zeta1 <- VPBROADCAST_8u32 (z2u32 zetasp (6+196*i));
      r0 <- P2R rp (0+8*i);
      r1 <- P2R rp (1+8*i);
      r2 <- P2R rp (2+8*i);
      r3 <- P2R rp (3+8*i);
      r4 <- P2R rp (4+8*i);
      r5 <- P2R rp (5+8*i);
      r6 <- P2R rp (6+8*i);
      r7 <- P2R rp (7+8*i);
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
      r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (8+196*i);
      zeta1 <- z2u256 zetasp (24+196*i);
      (r0, r4) <@ Jkem_avx2.M.__shuffle8 (r0, r4);
      (r1, r5) <@ Jkem_avx2.M.__shuffle8 (r1, r5);
      (r2, r6) <@ Jkem_avx2.M.__shuffle8 (r2, r6);
      (r3, r7) <@ Jkem_avx2.M.__shuffle8 (r3, r7);
      (r0, r4, r1, r5, r2, r6, r3, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r4, r1, r5, r2,
      r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (40+196*i);
      zeta1 <- z2u256 zetasp (56+196*i);
      (r0, r2) <@ Jkem_avx2.M.__shuffle4 (r0, r2);
      (r4, r6) <@ Jkem_avx2.M.__shuffle4 (r4, r6);
      (r1, r3) <@ Jkem_avx2.M.__shuffle4 (r1, r3);
      (r5, r7) <@ Jkem_avx2.M.__shuffle4 (r5, r7);
      (r0, r2, r4, r6, r1, r3, r5, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r2, r4, r6, r1,
      r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (72+196*i);
      zeta1 <- z2u256 zetasp (88+196*i);
      (r0, r1) <@ Jkem_avx2.M.__shuffle2 (r0, r1);
      (r2, r3) <@ Jkem_avx2.M.__shuffle2 (r2, r3);
      (r4, r5) <@ Jkem_avx2.M.__shuffle2 (r4, r5);
      (r6, r7) <@ Jkem_avx2.M.__shuffle2 (r6, r7);
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r1, r2, r3, r4,
      r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (104+196*i);
      zeta1 <- z2u256 zetasp (120+196*i);
      (r0, r4) <@ Jkem_avx2.M.__shuffle1 (r0, r4);
      (r1, r5) <@ Jkem_avx2.M.__shuffle1 (r1, r5);
      (r2, r6) <@ Jkem_avx2.M.__shuffle1 (r2, r6);
      (r3, r7) <@ Jkem_avx2.M.__shuffle1 (r3, r7);
      (r0, r4, r1, r5, r2, r6, r3, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r4, r1, r5, r2,
      r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <- z2u256 zetasp (136+196*i);
      zeta1 <- z2u256 zetasp (168+196*i);
      zeta2 <- z2u256 zetasp (152+196*i);
      zeta3 <- z2u256 zetasp (184+196*i);
      (r0, r4, r2, r6, r1, r5, r3, r7) <@ Jkem_avx2.M.__butterfly64x (r0, r4, r2, r6, r1,
      r5, r3, r7, zeta0, zeta1, zeta2, zeta3, qx16);
      vx16 <- C2R vx16_op;
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      r4 <@ Jkem_avx2.M.__red16x (r4, qx16, vx16);
      r2 <@ Jkem_avx2.M.__red16x (r2, qx16, vx16);
      r6 <@ Jkem_avx2.M.__red16x (r6, qx16, vx16);
      r1 <@ Jkem_avx2.M.__red16x (r1, qx16, vx16);
      r5 <@ Jkem_avx2.M.__red16x (r5, qx16, vx16);
      r3 <@ Jkem_avx2.M.__red16x (r3, qx16, vx16);
      r7 <@ Jkem_avx2.M.__red16x (r7, qx16, vx16);
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
  proc __invntt_levels0t5 (rp:W16.t Array256.t) : W16.t Array256.t = {
    var zetasp:W16.t Array400.t;
    var qx16:W256.t;
    var i:int;
    var zeta0:W256.t;
    var zeta1:W256.t;
    var zeta2:W256.t;
    var zeta3:W256.t;
    var r0:W256.t;
    var r1:W256.t;
    var r2:W256.t;
    var r3:W256.t;
    var r4:W256.t;
    var r5:W256.t;
    var r6:W256.t;
    var r7:W256.t;
    var vx16:W256.t;
    zetasp <- witness;
    zetasp <- zetas_inv_op;
    qx16 <- C2R qx16_op;
    vx16 <- C2R vx16_op;
    i <- 0;
    while (i < 2) {
      zeta0 <- z2u256 zetasp (0 + (196 * i));
      zeta1 <- z2u256 zetasp (32 + (196 * i));
      zeta2 <- z2u256 zetasp (16 + (196 * i));
      zeta3 <- z2u256 zetasp (48 + (196 * i));
      r0 <- P2R rp (0+8*i);
      r1 <- P2R rp (1+8*i);
      r2 <- P2R rp (2+8*i);
      r3 <- P2R rp (3+8*i);
      r4 <- P2R rp (4+8*i);
      r5 <- P2R rp (5+8*i);
      r6 <- P2R rp (6+8*i);
      r7 <- P2R rp (7+8*i);
      (r0, r1, r4, r5, r2, r3, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
      r4, r5, r2, r3, r6, r7, zeta0, zeta1, zeta2, zeta3, qx16);
      (* 4 4 1 1 4 4 1 1 *)
      zeta0 <- z2u256 zetasp (64 + (196 * i));
      zeta1 <- z2u256 zetasp (80 + (196 * i));
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
      r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 8 2 2 1 1 1 1 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      r1 <@ Jkem_avx2.M.__red16x (r1, qx16, vx16);      
      (r0, r1) <@ Jkem_avx2.M.__shuffle1 (r0, r1);
      (r2, r3) <@ Jkem_avx2.M.__shuffle1 (r2, r3);
      (r4, r5) <@ Jkem_avx2.M.__shuffle1 (r4, r5);
      (r6, r7) <@ Jkem_avx2.M.__shuffle1 (r6, r7);
      zeta0 <- z2u256 zetasp (96 + (196 * i));
      zeta1 <- z2u256 zetasp (112 + (196 * i));
      (r0, r2, r4, r6, r1, r3, r5, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r2,
      r4, r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (*.4 1 4 1 2 1 2 1 *)
      (r0, r2) <@ Jkem_avx2.M.__shuffle2 (r0, r2);
      (r4, r6) <@ Jkem_avx2.M.__shuffle2 (r4, r6);
      (r1, r3) <@ Jkem_avx2.M.__shuffle2 (r1, r3);
      (r5, r7) <@ Jkem_avx2.M.__shuffle2 (r5, r7);
      zeta0 <- z2u256 zetasp (128 + (196 * i));
      zeta1 <- z2u256 zetasp (144 + (196 * i));
      (r0, r4, r1, r5, r2, r6, r3, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r4,
      r1, r5, r2, r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 2 1 1 4 2 1 1 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      (r0, r4) <@ Jkem_avx2.M.__shuffle4 (r0, r4);
      (r1, r5) <@ Jkem_avx2.M.__shuffle4 (r1, r5);
      (r2, r6) <@ Jkem_avx2.M.__shuffle4 (r2, r6);
      (r3, r7) <@ Jkem_avx2.M.__shuffle4 (r3, r7);
      zeta0 <- z2u256 zetasp (160 + (196 * i));
      zeta1 <- z2u256 zetasp (176 + (196 * i));
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
      r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 4 2 2 1 1 1 1 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      (r0, r1) <@ Jkem_avx2.M.__shuffle8 (r0, r1);
      (r2, r3) <@ Jkem_avx2.M.__shuffle8 (r2, r3);
      (r4, r5) <@ Jkem_avx2.M.__shuffle8 (r4, r5);
      (r6, r7) <@ Jkem_avx2.M.__shuffle8 (r6, r7);
      zeta0 <- VPBROADCAST_8u32 (z2u32 zetasp (192 + (196 * i)));
      zeta1 <- VPBROADCAST_8u32 (z2u32 zetasp (194 + (196 * i)));
      (r0, r2, r4, r6, r1, r3, r5, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r2,
      r4, r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 8 1 4 1 2 1 2 1 *)
      r0 <@ Jkem_avx2.M.__red16x (r0, qx16, vx16);
      rp <- PUR rp (0+8*i) r0; (* 2 *)
      rp <- PUR rp (1+8*i) r2; (* 4 *)
      rp <- PUR rp (2+8*i) r4; (* 2 *)
      rp <- PUR rp (3+8*i) r6; (* 2 *)
      rp <- PUR rp (4+8*i) r1; (* 1 *)
      rp <- PUR rp (5+8*i) r3; (* 1 *)
      rp <- PUR rp (6+8*i) r5; (* 1 *)
      rp <- PUR rp (7+8*i) r7; (* 1 *)
      i <- i + 1;
    }
    return (rp);
  }
  
  proc __invntt_level6 (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;
    
    var zetasp:W16.t Array400.t;
    var qx16:W256.t;
    var zeta0:W256.t;
    var zeta1:W256.t;
    var i:int;
    var r0:W256.t;
    var r1:W256.t;
    var r2:W256.t;
    var r3:W256.t;
    var r4:W256.t;
    var r5:W256.t;
    var r6:W256.t;
    var r7:W256.t;
    var flox16:W256.t;
    var fhix16:W256.t;
    zetasp <- witness;
    zetasp <- zetas_inv_op;
    qx16 <- C2R qx16_op;
    zeta0 <- VPBROADCAST_8u32 (z2u32 zetasp 392);
    zeta1 <- VPBROADCAST_8u32 (z2u32 zetasp 394);
    i <- 0;
    while (i < 2) {
      r0 <- P2R rp (0+4*i); (* 2 *)
      r1 <- P2R rp (1+4*i); (* 4 *)
      r2 <- P2R rp (2+4*i); (* 2 *)
      r3 <- P2R rp (3+4*i); (* 2 *)
      r4 <- P2R rp (8+4*i); (* 2 *)
      r5 <- P2R rp (9+4*i); (* 4 *)
      r6 <- P2R rp (10+4*i); (* 2 *)
      r7 <- P2R rp (11+4*i); (* 2 *)
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ Jkem_avx2.M.__invntt___butterfly64x (r0, r1,
      r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (* 4 8 4 4 1 1 1 1 *)
      flox16 <- C2R flox16_op;
      fhix16 <- C2R fhix16_op;
      rp <- PUR rp (8+4*i) r4;
      rp <- PUR rp (9+4*i) r5;
      rp <- PUR rp (10+4*i) r6;
      rp <- PUR rp (11+4*i) r7;
      r0 <@ Jkem_avx2.M.__fqmulprecomp16x (r0, flox16, fhix16, qx16);
      r1 <@ Jkem_avx2.M.__fqmulprecomp16x (r1, flox16, fhix16, qx16);
      r2 <@ Jkem_avx2.M.__fqmulprecomp16x (r2, flox16, fhix16, qx16);
      r3 <@ Jkem_avx2.M.__fqmulprecomp16x (r3, flox16, fhix16, qx16);
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
    (are, aim) <@ Jkem_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 0);
    rp <- PUR rp 0 are;
    rp <- PUR rp 1 aim;
    are <- P2R ap 2;
    aim <- P2R ap 3;
    bre <- P2R bp 2;
    bim <- P2R bp 3;
    (are, aim) <@ Jkem_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 1);
    rp <- PUR rp 2 are;
    rp <- PUR rp 3 aim;

    zetaqinv <- z2u256 zetas_op 168;
    zeta_0 <- z2u256 zetas_op 184;
    are <- P2R ap 4;
    aim <- P2R ap 5;
    bre <- P2R bp 4;
    bim <- P2R bp 5;
    (are, aim) <@ Jkem_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 0);
    rp <- PUR rp 4 are;
    rp <- PUR rp 5 aim;
    are <- P2R ap 6;
    aim <- P2R ap 7;
    bre <- P2R bp 6;
    bim <- P2R bp 7;
    (are, aim) <@ Jkem_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 1);
    rp <- PUR rp 6 are;
    rp <- PUR rp 7 aim;


    zetaqinv <- z2u256 zetas_op 332;
    zeta_0 <- z2u256 zetas_op 348;
    are <- P2R ap 8;
    aim <- P2R ap 9;
    bre <- P2R bp 8;
    bim <- P2R bp 9;
    (are, aim) <@ Jkem_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 0);
    rp <- PUR rp 8 are;
    rp <- PUR rp 9 aim;
    are <- P2R ap 10;
    aim <- P2R ap 11;
    bre <- P2R bp 10;
    bim <- P2R bp 11;
    (are, aim) <@ Jkem_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 1);
    rp <- PUR rp 10 are;
    rp <- PUR rp 11 aim;

    zetaqinv <- z2u256 zetas_op 364;
    zeta_0 <- z2u256 zetas_op 380;
    are <- P2R ap 12;
    aim <- P2R ap 13;
    bre <- P2R bp 12;
    bim <- P2R bp 13;
    (are, aim) <@ Jkem_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 0);
    rp <- PUR rp 12 are;
    rp <- PUR rp 13 aim;
    are <- P2R ap 14;
    aim <- P2R ap 15;
    bre <- P2R bp 14;
    bim <- P2R bp 15;
    (are, aim) <@ Jkem_avx2.M.__schoolbook16x(are, aim, bre, bim, zeta_0, zetaqinv, qx16, qinvx16, 1);
    rp <- PUR rp 14 are;
    rp <- PUR rp 15 aim;

    return rp;
  }

}.

equiv basemul_avx2_eq_:
 Jkem_avx2.M._poly_basemul ~ Tmp._poly_basemul:
 ={rp,ap,bp} ==> ={res}.
proof.
proc.
seq 8 8: (={rp,ap,bp,qx16,qinvx16,zeta_0,zetaqinv,are,aim,bre,bim}).
 by wp; skip; rewrite /z2u256 !P2RE //. 
seq 1 1: #pre.
 by sim.
seq 6 6: (#pre).
 by wp; skip; rewrite !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 8 8: (#pre).
 by wp; skip; rewrite /z2u256 !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 6 6: (#pre).
 by wp; skip; rewrite !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 8 8: (#pre).
 by wp; skip; rewrite /z2u256 !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 6 6: (#pre).
 by wp; skip; rewrite !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 8 8: (#pre).
 by wp; skip; rewrite /z2u256 !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
seq 6 6: (#pre).
 by wp; skip; rewrite !P2RE // !PURE //. 
seq 1 1: #pre.
 by sim.
by wp; skip; rewrite !PURE //. 
qed.

equiv ntt_avx2_eq_:
 Jkem_avx2.M._poly_ntt ~ Tmp._ntt:
 ={rp} ==> ={res}.
proof.
proc.
seq 13 12: (={rp,r0,r1,r2,r3,r4,r5,r6,r7,zetasp,zeta0,zeta1,qx16}).
 by wp; skip; rewrite !P2RE //. 
seq 1 1: #pre.
 by sim.
seq 16 16: #pre.
 by wp; skip => />; rewrite !P2RE // !PURE //.
seq 1 1: #pre.
 by sim.
seq 5 5: (0 <= i{2} /\ ={i} /\ #pre).
 by wp; skip => />; rewrite !PURE //.
while (#pre).
 seq 7 7: (#pre).
  by auto => /> *; rewrite !P2RE /#.
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
  by wp; skip; rewrite /C2R /vx16_op /#.
 seq 8 8: (#pre).
  by conseq />; sim.
 by wp; skip => |> *; rewrite !PURE 1..8:/# !mulrDr !mulrA /= /#.
by auto => />.
qed.

equiv invntt_avx2_eq_:
 Jkem_avx2.M._poly_invntt ~ Tmp._invntt:
 ={rp} ==> ={res}.
proof.
proc.
seq 4 3: (i{2}=0 /\ ={i,rp,zetasp,qx16}).
 by wp; skip; rewrite /C2R //.
seq 6 6: (#pre /\ ={r0,r2,r4,r6,zeta0,zeta1,flox16,fhix16}).
 wp; while (0 <= i{2} /\ #[/2:]pre /\ (i{2}=0 \/ ={r0,r2,r4,r6})).
  seq 12 12: (i{2} < 2 /\ #[/:5]pre /\ ={r0,r1,r2,r3,r4,r5,r6,r7,zeta0,zeta1,zeta2,zeta3}).
   by auto => /> *; rewrite /z2u256 !mulrDr !mulrA !P2RE /#.
  seq 1 1: (#pre).
   by conseq />; sim.
  seq 3 3: (#pre /\ ={vx16}).
   by auto => /> *; rewrite /z2u256 !mulrDr !mulrA /#.
  seq 9 9: (#pre).
   by conseq />; sim.
  seq 2 2: (#pre).
   by auto => /> *; rewrite /z2u256 !mulrDr !mulrA /#.
  seq 6 6: (#pre).
   by conseq />; sim.
  seq 2 2: (#pre).
   by auto => /> *; rewrite /z2u256 !mulrDr !mulrA /#.
  seq 6 6: (#pre).
   by conseq />; sim.
  seq 2 2: (#pre).
   by auto => /> *; rewrite /z2u256 !mulrDr !mulrA /#.
  seq 6 6: (#pre).
   by conseq />; sim.
  seq 2 2: (#pre).
   by auto => /> *; rewrite /z2u32 /#. 
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
 seq 4 4: (#pre).
  by wp; skip => /> *; rewrite /C2R !PURE /#. 
 seq 4 4: (#pre).   
  by conseq />; sim.
 by wp; skip => /> *; rewrite !PURE /#. 
by auto.
qed.

equiv poly_basemul_avx2_eq:
 Jkem_avx2.M._poly_basemul ~ NTT_AVX.__basemul:
 a{2}=lift_array256 ap{1} /\ signed_bound_cxq ap{1} 0 256 2
 /\ b{2}=lift_array256 bp{1} /\ signed_bound_cxq bp{1} 0 256 2
 ==>
 NTT_Properties.scale res{2} (inFq 169) = lift_array256 res{1} /\
 signed_bound_cxq res{1} 0 256 1.
proof.
transitivity Tmp._poly_basemul
 ( ={rp,ap,bp} ==> ={res} )
 ( I256u16_sb 2 ap{1} a{2} /\ I256u16_sb 2 bp{1} b{2}
   ==> I256u16S_sb (inFq 169) 1 res{1} res{2} ).
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
!inFqM_mod /q /= !Iu16_ub_of_int.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (inFq 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 2) /\
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
          all (fun k => I16u16S_sb (inFq 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 4)).
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
  by rewrite /xx -iotaredE /= /zetas_op !z2u256E 1..2:// !C2RK /jzetas_exp /= -!inFqM_mod /q /= !Iu16_ub_of_int.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (inFq 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 6) /\
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
          all (fun k => I16u16S_sb (inFq 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 8)).
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
  by rewrite /xx -iotaredE /= /zetas_op !z2u256E 1..2:// !C2RK /jzetas_exp /= -!inFqM_mod /q /= !Iu16_ub_of_int.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (inFq 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 10) /\
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
          all (fun k => I16u16S_sb (inFq 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 12)).
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
  by rewrite /xx -iotaredE /= /zetas_op !z2u256E 1..2:// !C2RK /jzetas_exp /= -!inFqM_mod /q /= !Iu16_ub_of_int.
 split; first apply Ha; smt(mem_iota).
 split; first apply Ha; smt(mem_iota).
 by split; apply Hb; smt(mem_iota).
seq 3 3: (#[/:4]pre /\
          all (fun k => I16u16S_sb (inFq 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 14) /\
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
          all (fun k => I16u16S_sb (inFq 169) 1 (P2R rp{1} k) (P2C r{2} k)) (iota_ 0 16)).
 wp; call cmpl_mulx16_eq; auto => &1 &2 /> _ _ Hq.
 rewrite -{2}iotaredE /= => /> ??.
 move=> Hz *; rewrite -{2}iotaredE /=.
 by rewrite (P2RS rp{1}) (P2CS r{2}) !PUR_i //= !PUC_i //= !P2R_i //= !P2C_i //=.
by auto.
qed.

equiv poly_ntt_avx2_eq:
 Jkem_avx2.M._poly_ntt ~ NTT_AVX.ntt:
 rp{2}=lift_array256 rp{1} /\ signed_bound_cxq rp{1} 0 256 2 ==>
 res{2}=lift_array256 res{1} /\
 pos_bound256_cxq res{1} 0 256 2.
proof.
symmetry; simplify.
transitivity Tmp._ntt
 ( I256u16_sb 2 rp{2} rp{1} ==> I256u16_ub 2 res{2} res{1} )
 ( ={rp} ==> ={res} ); last by symmetry; conseq ntt_avx2_eq_.
  by move=> |> &2 H; exists arg{2}; rewrite I256u16_sbE. 
 by move => &1 &m &2 /= ??; rewrite -I256u16_ubE /#.
proc.
seq 6 35: (x16_spec q qx16{2} /\ zetasp{2}=zetas_op  /\ i{2}=0 /\
  I16u16_sb 3 (P2R rp{2} 8) (P2C rp{1} 8) /\
  I16u16_sb 3 (P2R rp{2} 9) (P2C rp{1} 9) /\
  I16u16_sb 3 (P2R rp{2} 10) (P2C rp{1} 10) /\
  I16u16_sb 3 (P2R rp{2} 11) (P2C rp{1} 11) /\
  I16u16_sb 3 (P2R rp{2} 12) (P2C rp{1} 12) /\
  I16u16_sb 3 (P2R rp{2} 13) (P2C rp{1} 13) /\
  I16u16_sb 3 (P2R rp{2} 14) (P2C rp{1} 14) /\
  I16u16_sb 3 (P2R rp{2} 15) (P2C rp{1} 15) /\
  I16u16_sb 3 (P2R rp{2} 0) (P2C rp{1} 0) /\
  I16u16_sb 3 (P2R rp{2} 1) (P2C rp{1} 1) /\
  I16u16_sb 3 (P2R rp{2} 2) (P2C rp{1} 2) /\
  I16u16_sb 3 (P2R rp{2} 3) (P2C rp{1} 3) /\
  I16u16_sb 3 r0{2} (P2C rp{1} 4) /\
  I16u16_sb 3 r1{2} (P2C rp{1} 5) /\
  I16u16_sb 3 r2{2} (P2C rp{1} 6) /\
  I16u16_sb 3 r3{2} (P2C rp{1} 7)).
 wp; call (butterfly64x_eq 2).
 wp; call (butterfly64x_eq 2).
 wp; skip => &1 &2 Hpre qx16 z0R z1R /=.
 have ->: 3 * q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zR !z2u32E //= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /= !R2C_pack16 //=. 
 have ->: x16_spec q qx16.
  by rewrite x16_spec_C2R /q /=.
 pose z1L:= Array16.init _.
 have ->: I16u16M_ub 1 z1R z1L.
  by move: Iu16_ub_of_int; rewrite /z1L /z1R /zR /zetas_op !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -inFqM_mod /q /= !Iu16_ub_of_int.
 move: Hpre; rewrite -{2}iotaredE /= => |> *.
 rewrite (P2RS rp{2}) /= !PUR_i //= !P2R_i //= => |> *.
 rewrite (P2RS rp{2}) /= !PUR_i //= => |> *.
 by rewrite !P2R_i 1..40:// !P2C_i //.
unroll {2} 1; rcondt {2} 1.
 by move=> &m; skip => /=.
seq 10 8: (#[/:11]pre /\
  I16u16_sb 4 r0{2} r0a{1} /\
  I16u16_sb 4 r1{2} r1a{1} /\
  I16u16_sb 4 r2{2} r2a{1} /\
  I16u16_sb 4 r3{2} r3a{1} /\
  I16u16_sb 4 r4{2} r4a{1} /\
  I16u16_sb 4 r5{2} r5a{1} /\
  I16u16_sb 4 r6{2} r6a{1} /\
  I16u16_sb 4 r7{2} r7a{1} ).
 wp; call (butterfly64x_eq 3); wp; skip => &1 &2 Hpre z0R z1R |>.
 move: Hpre => |> *.
 have ->:  4 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zetas_op !z2u32E 1..2:/# /VPBROADCAST_8u32 /qinv16u16M -iotaredE /= !R2C_pack16 //=.
 pose z1L:= Array16.init _.
 have ->: I16u16M_ub 1 z1R z1L.
  by move: Iu16_ub_of_int; rewrite /z1L /z1R /zR /zetas_op !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -inFqM_mod /q /= !Iu16_ub_of_int.
 done.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 5 r0{2} r0c{1} /\
  I16u16_sb 5 r1{2} r1c{1} /\
  I16u16_sb 5 r2{2} r2c{1} /\
  I16u16_sb 5 r3{2} r3c{1} /\
  I16u16_sb 5 r4{2} r4c{1} /\
  I16u16_sb 5 r5{2} r5c{1} /\
  I16u16_sb 5 r6{2} r6c{1} /\
  I16u16_sb 5 r7{2} r7c{1} ).
 wp; call (butterfly64x_eq 4).
 ecall {2} (__shuffle8_ph 4 4 r3a{1} r7a{1}).
 ecall {2} (__shuffle8_ph 4 4 r2a{1} r6a{1}).
 ecall {2} (__shuffle8_ph 4 4 r1a{1} r5a{1}).
 ecall {2} (__shuffle8_ph 4 4 r0a{1} r4a{1}).
 wp; skip => &1 &2 |> /=; rewrite ler_maxr 1:// => *.
 have ->:  5 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 zetas_op 8) (z2u256 zetas_op 24).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE /=.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 pose xx := List.all _ _.
 have: xx.
   by rewrite /xx -iotaredE /= /zetas_op !z2u256E 1..2:// !C2RK /jzetas_exp /= -!inFqM_mod /q /= !Iu16_ub_of_int. 
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 6 r0{2} r0e{1} /\
  I16u16_sb 6 r1{2} r1e{1} /\
  I16u16_sb 6 r2{2} r2e{1} /\
  I16u16_sb 6 r3{2} r3e{1} /\
  I16u16_sb 6 r4{2} r4e{1} /\
  I16u16_sb 6 r5{2} r5e{1} /\
  I16u16_sb 6 r6{2} r6e{1} /\
  I16u16_sb 6 r7{2} r7e{1} ).
 wp; call (butterfly64x_eq 5).
 ecall {2} (__shuffle4_ph 5 5 r5c{1} r7c{1}).
 ecall {2} (__shuffle4_ph 5 5 r1c{1} r3c{1}).
 ecall {2} (__shuffle4_ph 5 5 r4c{1} r6c{1}).
 ecall {2} (__shuffle4_ph 5 5 r0c{1} r2c{1}).
 wp; skip => &1 &2 |> /=; rewrite ler_maxr 1:// => *.
 have ->:  6 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 jzetas_exp 40) (z2u256 jzetas_exp 56).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /jzetas_exp /= -!inFqM_mod /q /= !Iu16_ub_of_int /q /=.
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 7 r0{2} r0g{1} /\
  I16u16_sb 7 r1{2} r1g{1} /\
  I16u16_sb 7 r2{2} r2g{1} /\
  I16u16_sb 7 r3{2} r3g{1} /\
  I16u16_sb 7 r4{2} r4g{1} /\
  I16u16_sb 7 r5{2} r5g{1} /\
  I16u16_sb 7 r6{2} r6g{1} /\
  I16u16_sb 7 r7{2} r7g{1} ).
 wp; call (butterfly64x_eq 6).
 ecall {2} (__shuffle2_ph 6 6 r6e{1} r7e{1}).
 ecall {2} (__shuffle2_ph 6 6 r4e{1} r5e{1}).
 ecall {2} (__shuffle2_ph 6 6 r2e{1} r3e{1}).
 ecall {2} (__shuffle2_ph 6 6 r0e{1} r1e{1}).
 wp; skip => &1 &2 |>; rewrite ler_maxr 1:// => *.
 have ->:  7 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 jzetas_exp 72) (z2u256 jzetas_exp 88).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /jzetas_exp /= -!inFqM_mod /q /= !Iu16_ub_of_int /q /=.
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 8 r0{2} r0i{1} /\
  I16u16_sb 8 r1{2} r1i{1} /\
  I16u16_sb 8 r2{2} r2i{1} /\
  I16u16_sb 8 r3{2} r3i{1} /\
  I16u16_sb 8 r4{2} r4i{1} /\
  I16u16_sb 8 r5{2} r5i{1} /\
  I16u16_sb 8 r6{2} r6i{1} /\
  I16u16_sb 8 r7{2} r7i{1} ).
 wp; call (butterfly64x_eq 7).
 ecall {2} (__shuffle1_ph 7 7 r3g{1} r7g{1}).
 ecall {2} (__shuffle1_ph 7 7 r2g{1} r6g{1}).
 ecall {2} (__shuffle1_ph 7 7 r1g{1} r5g{1}).
 ecall {2} (__shuffle1_ph 7 7 r0g{1} r4g{1}).
 wp; skip => &1 &2 |>; rewrite ler_maxr 1:// => *.
 have ->:  8 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 jzetas_exp 104) (z2u256 jzetas_exp 120).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /jzetas_exp /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 by rewrite /xx => {xx} -> |> *.
seq 11 23: (#[/:2]pre /\ i{2}=1 /\ 
  I16u16_ub 2 (P2R rp{2} 0) (P2C rp8{1} 0) /\
  I16u16_ub 2 (P2R rp{2} 1) (P2C rp8{1} 1) /\
  I16u16_ub 2 (P2R rp{2} 2) (P2C rp8{1} 2) /\
  I16u16_ub 2 (P2R rp{2} 3) (P2C rp8{1} 3) /\
  I16u16_ub 2 (P2R rp{2} 4) (P2C rp8{1} 4) /\
  I16u16_ub 2 (P2R rp{2} 5) (P2C rp8{1} 5) /\
  I16u16_ub 2 (P2R rp{2} 6) (P2C rp8{1} 6) /\
  I16u16_ub 2 (P2R rp{2} 7) (P2C rp8{1} 7) /\ #[/4:11]pre).
 wp; ecall {2} (__red16x_ph 9 r7j{1}).
 ecall {2} (__red16x_ph 9 r3j{1}).
 ecall {2} (__red16x_ph 9 r5j{1}).
 ecall {2} (__red16x_ph 9 r1j{1}).
 ecall {2} (__red16x_ph 9 r6j{1}).
 ecall {2} (__red16x_ph 9 r2j{1}).
 ecall {2} (__red16x_ph 9 r4j{1}).
 ecall {2} (__red16x_ph 9 r0j{1}).
 wp; call (butterfly64x_eq 8).
 wp; skip => &1 &2 |> *.
 have ->:  9 * q <= 32767 by rewrite /q /=.
 have ->: qinv16u16M (z2u256 jzetas_exp 136) (z2u256 jzetas_exp 152).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 have ->: qinv16u16M (z2u256 jzetas_exp 168) (z2u256 jzetas_exp 184).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /jzetas_exp /= -!inFqM_mod /q /= !Iu16_ub_of_int /q /=.
 rewrite /xx => {xx} ->; pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /jzetas_exp /= -!inFqM_mod /q /= !Iu16_ub_of_int /q /=.
 rewrite /xx => {xx} -> |> *.
 have ->: x16_spec 20159 (C2R vx16_op).
  by rewrite x16_spec_C2R /q /=.
 move => |> *.
 rewrite (P2RS rp{2}) /= !PUR_i //= !P2R_i //= => |> *.
 by rewrite (P2CS rp{1}) /= !PUC_i //= !P2C_i //= => |> *.
(* second iteration *)
unroll {2} 1; rcondt {2} 1.
 by move=> &m; skip.
seq 10 8: (#[/:11]pre /\
  I16u16_sb 4 r0{2} r0l{1} /\
  I16u16_sb 4 r1{2} r1l{1} /\
  I16u16_sb 4 r2{2} r2l{1} /\
  I16u16_sb 4 r3{2} r3l{1} /\
  I16u16_sb 4 r4{2} r4l{1} /\
  I16u16_sb 4 r5{2} r5l{1} /\
  I16u16_sb 4 r6{2} r6l{1} /\
  I16u16_sb 4 r7{2} r7l{1} ).
 rcondf {2} 3; first by auto.
 wp; call (butterfly64x_eq 3); wp; skip => &1 &2 |> *.
 have ->:  4 * q <= 32767 by rewrite /q.
 pose z0R := VPBROADCAST_8u32 _.
 pose z1R := VPBROADCAST_8u32 _.
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zR !z2u32E 1..2://= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /R2C /zetas_op /=.
 pose z1L:= Array16.init _.
 have ->: I16u16M_ub 1 z1R z1L.
  by rewrite /z1L /z1R /zR !z2u32E 1..2://= /VPBROADCAST_8u32 /R2C -iotaredE /= -inFqM_mod /q !Iu16_ub_of_int /#. 
 done.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 5 r0{2} r0n{1} /\
  I16u16_sb 5 r1{2} r1n{1} /\
  I16u16_sb 5 r2{2} r2n{1} /\
  I16u16_sb 5 r3{2} r3n{1} /\
  I16u16_sb 5 r4{2} r4n{1} /\
  I16u16_sb 5 r5{2} r5n{1} /\
  I16u16_sb 5 r6{2} r6n{1} /\
  I16u16_sb 5 r7{2} r7n{1} ).
 wp; call (butterfly64x_eq 4).
 ecall {2} (__shuffle8_ph 4 4 r3l{1} r7l{1}).
 ecall {2} (__shuffle8_ph 4 4 r2l{1} r6l{1}).
 ecall {2} (__shuffle8_ph 4 4 r1l{1} r5l{1}).
 ecall {2} (__shuffle8_ph 4 4 r0l{1} r4l{1}).
 wp; skip => &1 &2 |> /=; rewrite ler_maxr 1:// => *.
 have ->:  5 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 zetas_op 204) (z2u256 zetas_op 220).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas /= -!inFqM_mod /q /= !Iu16_ub_of_int /q /=.
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 6 r0{2} r0p{1} /\
  I16u16_sb 6 r1{2} r1p{1} /\
  I16u16_sb 6 r2{2} r2p{1} /\
  I16u16_sb 6 r3{2} r3p{1} /\
  I16u16_sb 6 r4{2} r4p{1} /\
  I16u16_sb 6 r5{2} r5p{1} /\
  I16u16_sb 6 r6{2} r6p{1} /\
  I16u16_sb 6 r7{2} r7p{1} ).
 wp; call (butterfly64x_eq 5).
 ecall {2} (__shuffle4_ph 5 5 r5n{1} r7n{1}).
 ecall {2} (__shuffle4_ph 5 5 r1n{1} r3n{1}).
 ecall {2} (__shuffle4_ph 5 5 r4n{1} r6n{1}).
 ecall {2} (__shuffle4_ph 5 5 r0n{1} r2n{1}).
 wp; skip => &1 &2 |> /=; rewrite ler_maxr 1:// => *.
 have ->:  6 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 zetas_op 236) (z2u256 zetas_op 252).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q /=.
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 7 r0{2} r0r{1} /\
  I16u16_sb 7 r1{2} r1r{1} /\
  I16u16_sb 7 r2{2} r2r{1} /\
  I16u16_sb 7 r3{2} r3r{1} /\
  I16u16_sb 7 r4{2} r4r{1} /\
  I16u16_sb 7 r5{2} r5r{1} /\
  I16u16_sb 7 r6{2} r6r{1} /\
  I16u16_sb 7 r7{2} r7r{1} ).
 wp; call (butterfly64x_eq 6).
 ecall {2} (__shuffle2_ph 6 6 r6p{1} r7p{1}).
 ecall {2} (__shuffle2_ph 6 6 r4p{1} r5p{1}).
 ecall {2} (__shuffle2_ph 6 6 r2p{1} r3p{1}).
 ecall {2} (__shuffle2_ph 6 6 r0p{1} r1p{1}).
 wp; skip => &1 &2 |>; rewrite ler_maxr 1:// => *.
 have ->:  7 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 zetas_op 268) (z2u256 zetas_op 284).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 8 r0{2} r0t{1} /\
  I16u16_sb 8 r1{2} r1t{1} /\
  I16u16_sb 8 r2{2} r2t{1} /\
  I16u16_sb 8 r3{2} r3t{1} /\
  I16u16_sb 8 r4{2} r4t{1} /\
  I16u16_sb 8 r5{2} r5t{1} /\
  I16u16_sb 8 r6{2} r6t{1} /\
  I16u16_sb 8 r7{2} r7t{1} ).
 wp; call (butterfly64x_eq 7).
 ecall {2} (__shuffle1_ph 7 7 r3r{1} r7r{1}).
 ecall {2} (__shuffle1_ph 7 7 r2r{1} r6r{1}).
 ecall {2} (__shuffle1_ph 7 7 r1r{1} r5r{1}).
 ecall {2} (__shuffle1_ph 7 7 r0r{1} r4r{1}).
 wp; skip => &1 &2 |>; rewrite ler_maxr 1:// => *.
 have ->:  8 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 zetas_op 300) (z2u256 zetas_op 316).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q /=.
 by rewrite /xx => {xx} -> |> *.
rcondf {2} 24; first by (move=> *; inline*; wp; auto).
wp; ecall {2} (__red16x_ph 9 r7u{1}).
ecall {2} (__red16x_ph 9 r3u{1}).
ecall {2} (__red16x_ph 9 r5u{1}).
ecall {2} (__red16x_ph 9 r1u{1}).
ecall {2} (__red16x_ph 9 r6u{1}).
ecall {2} (__red16x_ph 9 r2u{1}).
ecall {2} (__red16x_ph 9 r4u{1}).
ecall {2} (__red16x_ph 9 r0u{1}).
wp; call (butterfly64x_eq 8).
wp; skip => &1 &2 |> *.
have ->:  9 * q <= 32767 by rewrite /q.
have ->: qinv16u16M (z2u256 zetas_op 332) (z2u256 zetas_op 348).
 rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
 by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
have ->: qinv16u16M (z2u256 zetas_op 364) (z2u256 zetas_op 380).
 rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
 by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
pose xx := List.all _ _.
have: xx.
 by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q /=.
rewrite /xx => {xx} ->; pose xx := List.all _ _.
have: xx.
 by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q /=.
rewrite /xx => {xx} -> |> *.
have Hvx16: x16_spec 20159 (C2R vx16_op).
 by rewrite x16_spec_C2R /q /=.
move => |> *.
by rewrite (P2RS rp{2}) (P2CS rp8{1}) /= !PUR_i //= !PUC_i //= -{2}iotaredE /= !P2R_i //= !P2C_i //=.
qed.

lemma wmulhsC x y: W16.wmulhs x y = W16.wmulhs y x by smt().

lemma invbutterfly_r (n1 n2:int) xl xr z rxl rxr rzM rzMqinv rq:
 (n1+n2)*q <= W16.max_sint =>
 rq = W16.of_int q =>
 Iu16_sb n1 rxl xl =>
 Iu16_sb n2 rxr xr =>
 Iu16M_ub 1 rzM z =>
 rzMqinv = rzM * (W16.of_int 62209) =>
 Iu16_sb 1
   (wmulhs rzM (rxl-rxr) - wmulhs rq (rzMqinv * (rxl-rxr)))
   (z*(xl-xr)).
proof.
move => /= Hbnd Hq [-> Hxl] [-> Hxr] [HzM HzBnd] ->.
rewrite wmulhsC; pose t := (wmulhs _ _ - _)%W16.
have ->: t = Montgomery16.REDCmul16 (rxl - rxr) rzM.
 rewrite /t /REDC16 /Montgomery16.q /Montgomery16.qinv Hq /q /=; congr.
 by rewrite wmulhsC; congr; congr; ring.
have := Montgomery16.REDCmul16_correct (rxl-rxr) rzM _.
 smt().
rewrite (_:Montgomery16.q=q) 1:/#; move => /= [H1 H2].
split.
 rewrite -(asintK z) -inFqM -eq_inFq H1.
 have Hone: Kyber.Zq.one = inFq Montgomery16.R * inFq Montgomery16.Rinv. 
  by rewrite -inFqM -eq_inFq -Montgomery16.RRinv /#.
 have ->: z = inFqW16 rzM * inFq Montgomery16.Rinv. 
  by rewrite -(ZqField.mul1r z) ZqField.mulrC Hone ZqField.mulrA HzM.
 by rewrite -inFqM !inFqK modzMml to_sintB_small /#.
by rewrite /=; apply (sint_bndW _ _ _ _ _ _ _ H2); smt().
qed.

lemma invntt_butterfly16xE (n1 n2:int) xl xr z rxl rxr rzM rzMqinv rq16x:
 (n1+n2)*q <= W16.max_sint =>
 I16u16_sb n1 rxl xl =>
 I16u16_sb n2 rxr xr =>
 qinv16u16M rzMqinv rzM =>
 I16u16M_ub 1 rzM z =>
 x16_spec q rq16x =>
 I16u16_sb 1
  (VPSUB_16u16
    (VPMULH_16u16 
      rzM
      (VPSUB_16u16 rxl rxr))
    (VPMULH_16u16
      rq16x
      (VPMULL_16u16 
        rzMqinv
        (VPSUB_16u16 rxl rxr))))
  (Array16.init (fun i=>z.[i]*(xl.[i]-xr.[i]))).
proof.
rewrite -3!allP_range.
move=> Hbnd Hl Hr /qinv16u16M_bits16 Hqinv Hz /x16_spec_bits16 Hq.
rewrite /VPSUB_16u16 /VPADD_16u16 /VPMULH_16u16 /VPMULL_16u16 /= -iotaredE /R2C /=.
do 15! (split; first by apply (invbutterfly_r n1 n2); [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv]).
by apply (invbutterfly_r n1 n2); [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv].
qed.

lemma I16u16S_ub_mul1x16 z1 z2 n x y:
 I16u16S_ub z1 n y (mul1x16 z2 x) = I16u16S_ub (z1*z2) n y x.
proof.
rewrite -iotaredE /Iu16_ub /=.
do 15! (congr; first by (congr; congr; ring)).
by (congr; congr; ring).
qed.

lemma invntt_butterfly16xE_last (n1 n2:int) xl xr z rxl rxr rzM rzMqinv rq16x:
 (n1+n2)*q <= W16.max_sint =>
 I16u16_sb n1 rxl xl =>
 I16u16_sb n2 rxr xr =>
 qinv16u16M rzMqinv rzM =>
 I16u16S_ub (inFq 1441) 1 rzM z =>
 x16_spec q rq16x =>
 I16u16S_sb (inFq 3303 * inFq 65536) 1
  (VPSUB_16u16
    (VPMULH_16u16 
      rzM
      (VPSUB_16u16 rxl rxr))
    (VPMULH_16u16
      rq16x
      (VPMULL_16u16 
        rzMqinv
        (VPSUB_16u16 rxl rxr))))
  (Array16.init (fun i=>z.[i]*(xl.[i]-xr.[i]))).
proof.
move => Hn Hxl Hxr Hzqinv.
have ->: inFq 1441 = inFq W16.modulus * inFq 512.
 by rewrite -inFqM_mod /q /=.
rewrite -I16u16S_ub_mul1x16 => Hz Hq.
move: (invntt_butterfly16xE _ _ _ _ (mul1x16 (inFq 512) z) _ _ _ _ _ Hn Hxl Hxr Hzqinv Hz Hq).
move=> /List.allP H; apply/List.allP => x Hx /=.
move: (H x Hx); rewrite /Iu16_sb; move => [<- ->] /=.
have ->: inFq 3303 * inFq 65536 = inFq 512 by rewrite -inFqM_mod /q /=.
by move: Hx; rewrite mem_iota => ?; rewrite !initiE 1..2:/# /= !mapiE 1:/# /=; ring.
qed.

lemma invntt_butterfly16xE_l (n1 n2:int) rh rl h l:
 (n1+n2)*q <= W16.max_sint =>
 I16u16_sb n1 rl l => 
 I16u16_sb n2 rh h => 
 I16u16_sb (n1 + n2) (VPADD_16u16 rh rl)
  (Array16.init (fun i=> l.[i] + h.[i])).
proof.
rewrite addzC; move=> Hn; rewrite -2!allP_range.
rewrite /VPADD_16u16 /= /R2C /= => Hl Hr.
rewrite -iotaredE /=.
do 15! (split; first by rewrite (ZqField.addrC l.[_] h.[_]); apply Iu16_sbD; [assumption|apply Hr|apply Hl]).
by rewrite (ZqField.addrC l.[_] h.[_]); apply Iu16_sbD; [assumption|apply Hr|apply Hl].
qed.

equiv invntt_butterfly64x_eq c0 c1 c2 c3 c4 c5 c6 c7:
 NTT_AVX.__invntt___butterfly64x
 ~ Jkem_avx2.M.__invntt___butterfly64x :
 MAX (MAX (c0+c4) (c1+c5))%Int
     (MAX (c2+c6) (c3+c7))%Int * q
  <= W16.max_sint /\
 I16u16_sb c0 rl0{2} rl0t{1} /\
 I16u16_sb c1 rl1{2} rl1t{1} /\
 I16u16_sb c2 rl2{2} rl2t{1} /\
 I16u16_sb c3 rl3{2} rl3t{1} /\
 I16u16_sb c4 rh0{2} rh0t{1} /\
 I16u16_sb c5 rh1{2} rh1t{1} /\
 I16u16_sb c6 rh2{2} rh2t{1} /\
 I16u16_sb c7 rh3{2} rh3t{1} /\
 qinv16u16M zl0{2} zh0{2} /\
 qinv16u16M zl1{2} zh1{2} /\
 I16u16M_ub 1 zh0{2} z0{1} /\
 I16u16M_ub 1 zh1{2} z1{1} /\
 x16_spec q qx16{2}
 ==>
 I16u16_sb (c0+c4) res{2}.`1 res{1}.`1 /\
 I16u16_sb (c1+c5) res{2}.`2 res{1}.`2 /\
 I16u16_sb (c2+c6) res{2}.`3 res{1}.`3 /\
 I16u16_sb (c3+c7) res{2}.`4 res{1}.`4 /\
 I16u16_sb 1 res{2}.`5 res{1}.`5 /\
 I16u16_sb 1 res{2}.`6 res{1}.`6 /\
 I16u16_sb 1 res{2}.`7 res{1}.`7 /\
 I16u16_sb 1 res{2}.`8 res{1}.`8.
proof.
proc; sp 1 0; simplify.
wp; skip => |> &1 &2 Hbnd H0 H1 H2 H3 H4 H5 H6 H7 Hqinv0 Hqinv1 Hzl Hzh Hq.
do 4! (split; first by apply invntt_butterfly16xE_l; smt()).
split; first by apply (invntt_butterfly16xE c0 c4); smt().
split; first by apply (invntt_butterfly16xE c1 c5); smt().
split; first by apply (invntt_butterfly16xE c2 c6); smt().
by apply (invntt_butterfly16xE c3 c7); smt().
qed.

equiv invntt_butterfly64x_eq_last c0 c1 c2 c3 c4 c5 c6 c7:
 NTT_AVX.__invntt___butterfly64x
 ~ Jkem_avx2.M.__invntt___butterfly64x :
 MAX (MAX (c0+c4) (c1+c5))%Int
     (MAX (c2+c6) (c3+c7))%Int * q
  <= W16.max_sint /\
 I16u16_sb c0 rl0{2} rl0t{1} /\
 I16u16_sb c1 rl1{2} rl1t{1} /\
 I16u16_sb c2 rl2{2} rl2t{1} /\
 I16u16_sb c3 rl3{2} rl3t{1} /\
 I16u16_sb c4 rh0{2} rh0t{1} /\
 I16u16_sb c5 rh1{2} rh1t{1} /\
 I16u16_sb c6 rh2{2} rh2t{1} /\
 I16u16_sb c7 rh3{2} rh3t{1} /\
 qinv16u16M zl0{2} zh0{2} /\
 qinv16u16M zl1{2} zh1{2} /\
 I16u16S_ub (inFq 1441) 1 zh0{2} z0{1} /\
 I16u16S_ub (inFq 1441) 1 zh1{2} z1{1} /\
 x16_spec q qx16{2}
 ==>
 I16u16_sb (c0+c4) res{2}.`1 res{1}.`1 /\
 I16u16_sb (c1+c5) res{2}.`2 res{1}.`2 /\
 I16u16_sb (c2+c6) res{2}.`3 res{1}.`3 /\
 I16u16_sb (c3+c7) res{2}.`4 res{1}.`4 /\
 I16u16S_sb (inFq 3303 * inFq 65536) 1 res{2}.`5 res{1}.`5 /\
 I16u16S_sb (inFq 3303 * inFq 65536) 1 res{2}.`6 res{1}.`6 /\
 I16u16S_sb (inFq 3303 * inFq 65536) 1 res{2}.`7 res{1}.`7 /\
 I16u16S_sb (inFq 3303 * inFq 65536) 1 res{2}.`8 res{1}.`8.
proof.
proc; sp 1 0; simplify.
wp; skip => |> &1 &2 Hbnd H0 H1 H2 H3 H4 H5 H6 H7 Hqinv0 Hqinv1 Hzl Hzh Hq.
do 4! (split; first by apply invntt_butterfly16xE_l; smt()).
split; first by apply (invntt_butterfly16xE_last c0 c4); smt().
split; first by apply (invntt_butterfly16xE_last c1 c5); smt().
split; first by apply (invntt_butterfly16xE_last c2 c6); smt().
by apply (invntt_butterfly16xE_last c3 c7); smt().
qed.


phoare fq_mulprecomp16x_aux _n _r:
 [ Jkem_avx2.M.__fqmulprecomp16x :
   x16_spec q qx16 /\
   x16_spec 1441 ah /\
   x16_spec (-10079) al /\
   I16u16_sb _n b _r
   ==> I16u16S_sb (inFq 3303*inFq W16.modulus) 1 res _r ] = 1%r.
proof.
conseq (fqmulprecomp16x_ph _n (Array16.create (inFq 512)) _r) => /> &m.
 rewrite /x16_spec /qinv16u16M /R2C !allP => Hq Ha Hqinv Hb; split => k Hk /=.
  move: (Hq _ Hk) (Ha _ Hk) (Hqinv _ Hk) (Hb _ Hk) => {Hq Ha Hqinv Hb} /=.
  rewrite !initiE; first 4 smt(mem_iota).
  move=> Hq -> -> Hb; smt().
 move: (Hq _ Hk) (Ha _ Hk) (Hqinv _ Hk) (Hb _ Hk) => {Hq Ha Hqinv Hb} /=.
 rewrite createE !initiE; first 5 smt(mem_iota).
 move=> /= _ -> _ _.
 rewrite -inFqM inFq_mod /q /=.
 by apply Iu16_ub_of_int.
move=> |> *; split.
 rewrite !List.allP /R2C /= => H k Hk.
 move: Hk (H _ Hk); rewrite mem_iota /= => {H} |> ??.
 rewrite createE !initiE 1:/# /=.
 rewrite -inFqM inFq_mod /q map2iE 1:/# /=.
 by rewrite initiE 1:/# /= /#.
rewrite !List.allP /R2C /= => H k Hk.
move: Hk (H _ Hk); rewrite mem_iota /= => {H} |> ??.
rewrite createE !initiE 1:/# /=.
rewrite -inFqM inFq_mod /q map2iE 1:/# /=.
by rewrite initiE 1:/# /= /#.
qed.

equiv poly_invntt_avx2_eq:
 Jkem_avx2.M._poly_invntt ~ NTT_AVX.invntt:
 rp{2}=lift_array256 rp{1} /\ signed_bound_cxq rp{1} 0 256 4 ==>
 mul1x256 (inFq W16.modulus) res{2}=lift_array256 res{1} /\
 signed_bound_cxq res{1} 0 256 1.
proof.
symmetry; transitivity Tmp._invntt
 ( I256u16_sb 4 rp{2} rp{1} ==> I256u16S_sb (inFq W16.modulus) 1 res{2} res{1} )
 ( ={rp} ==> ={res} ); last by symmetry; conseq invntt_avx2_eq_.
  by move=> |> &2 H; exists arg{2}; rewrite I256u16_sbE. 
 move => &1 &m &2 /= H <-; rewrite -I256u16_sbE .
 move: H; rewrite -{2 4}iotaredE => |> *.
 by rewrite !P2C_map // !I16u16_sb_map /#.
proc.
unroll{2} 4; rcondt{2} 4; first by auto.
seq 11 16: (x16_spec q qx16{2} /\ zetasp{2}=zetas_inv_op  /\ i{2}=0 /\
  I16u16_sb 4 (P2R rp{2} 8) (P2C rp{1} 8) /\
  I16u16_sb 4 (P2R rp{2} 9) (P2C rp{1} 9) /\
  I16u16_sb 4 (P2R rp{2} 10) (P2C rp{1} 10) /\
  I16u16_sb 4 (P2R rp{2} 11) (P2C rp{1} 11) /\
  I16u16_sb 4 (P2R rp{2} 12) (P2C rp{1} 12) /\
  I16u16_sb 4 (P2R rp{2} 13) (P2C rp{1} 13) /\
  I16u16_sb 4 (P2R rp{2} 14) (P2C rp{1} 14) /\
  I16u16_sb 4 (P2R rp{2} 15) (P2C rp{1} 15) /\
  I16u16_sb 8 r0{2} r0a{1} /\
  I16u16_sb 8 r1{2} r1a{1} /\
  I16u16_sb 1 r2{2} r2a{1} /\
  I16u16_sb 1 r3{2} r3a{1} /\
  I16u16_sb 8 r4{2} r4a{1} /\
  I16u16_sb 8 r5{2} r5a{1} /\
  I16u16_sb 1 r6{2} r6a{1} /\
  I16u16_sb 1 r7{2} r7a{1}).
 call (invntt_butterfly64x_eq 4 4 4 4 4 4 4 4).
 wp; skip => &1 &2.
 rewrite -{2}iotaredE /= => [#] |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z2R := z2u256 _ _.
 pose z3R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 pose z3L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 have ->: qinv16u16M z2R z3R.
  rewrite /z2R /z3R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 clear xx; pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z3R /z3L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 have ->: x16_spec q (C2R qx16_op).
  by rewrite x16_spec_C2R /q /=.
 by clear xx z0R z1R z2R z3R z1L z3L => |>.
seq 2 8: (#[/:11]pre /\ x16_spec 20159 vx16{2} /\
  I16u16_sb 4 r0{2} r0b{1} /\
  I16u16_sb 4 r1{2} r1b{1} /\
  I16u16_sb 2 r2{2} r2b{1} /\
  I16u16_sb 2 r3{2} r3b{1} /\
  I16u16_sb 1 r4{2} r4b{1} /\
  I16u16_sb 1 r5{2} r5b{1} /\
  I16u16_sb 1 r6{2} r6b{1} /\
  I16u16_sb 1 r7{2} r7b{1} ).
 call (invntt_butterfly64x_eq 2 2 1 1 2 2 1 1).
 ecall {2} (__red16x_sb_ph 8 r5a{1}).
 ecall {2} (__red16x_sb_ph 8 r4a{1}).
 ecall {2} (__red16x_sb_ph 8 r1a{1}).
 ecall {2} (__red16x_sb_ph 8 r0a{1}).
 wp; skip => |> &1 &2 *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 4*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 move => |> *.
 have ->: x16_spec 20159 (C2R vx16_op).
  by rewrite x16_spec_C2R /q /=.
 done.
seq 6 7: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0d{1} /\
  I16u16_sb 1 r1{2} r1d{1} /\
  I16u16_sb 4 r2{2} r2d{1} /\
  I16u16_sb 1 r3{2} r3d{1} /\
  I16u16_sb 2 r4{2} r4d{1} /\
  I16u16_sb 1 r5{2} r5d{1} /\
  I16u16_sb 2 r6{2} r6d{1} /\
  I16u16_sb 1 r7{2} r7d{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle1_ph 1 1 r6b{1} r7b{1}).
 ecall {2} (__shuffle1_ph 1 1 r4b{1} r5b{1}).
 ecall {2} (__shuffle1_ph 2 2 r2b{1} r3b{1}).
 ecall {2} (__shuffle1_ph 4 4 r0b{1} r1b{1}).
 have Emax: forall x, max x x = x by done. 
 wp; skip => |> &1 &2; rewrite !Emax => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0f{1} /\
  I16u16_sb 2 r1{2} r1f{1} /\
  I16u16_sb 1 r2{2} r2f{1} /\
  I16u16_sb 1 r3{2} r3f{1} /\
  I16u16_sb 4 r4{2} r4f{1} /\
  I16u16_sb 2 r5{2} r5f{1} /\
  I16u16_sb 1 r6{2} r6f{1} /\
  I16u16_sb 1 r7{2} r7f{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle2_ph 1 1 r5d{1} r7d{1}).
 ecall {2} (__shuffle2_ph 1 1 r1d{1} r3d{1}).
 ecall {2} (__shuffle2_ph 2 2 r4d{1} r6d{1}).
 ecall {2} (__shuffle2_ph 2 4 r0d{1} r2d{1}).
 ecall {2} (__red16x_sb_ph 8 r0d{1}).
 have Emax: forall x, max x x = x by done. 
 wp; skip => |> &1 &2; rewrite !Emax => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z0R /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0h{1} /\
  I16u16_sb 4 r1{2} r1h{1} /\
  I16u16_sb 2 r2{2} r2h{1} /\
  I16u16_sb 2 r3{2} r3h{1} /\
  I16u16_sb 1 r4{2} r4h{1} /\
  I16u16_sb 1 r5{2} r5h{1} /\
  I16u16_sb 1 r6{2} r6h{1} /\
  I16u16_sb 1 r7{2} r7h{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle4_ph 1 1 r3f{1} r7f{1}).
 ecall {2} (__shuffle4_ph 1 1 r2f{1} r6f{1}).
 ecall {2} (__shuffle4_ph 2 2 r1f{1} r5f{1}).
 ecall {2} (__shuffle4_ph 2 4 r0f{1} r4f{1}).
 ecall {2} (__red16x_sb_ph 8 r0f{1}).
 wp; skip => |> &1 &2; rewrite !lez_maxr 1..3:/# => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z0R /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0j{1} /\
  I16u16_sb 1 r1{2} r1j{1} /\
  I16u16_sb 4 r2{2} r2j{1} /\
  I16u16_sb 1 r3{2} r3j{1} /\
  I16u16_sb 2 r4{2} r4j{1} /\
  I16u16_sb 1 r5{2} r5j{1} /\
  I16u16_sb 2 r6{2} r6j{1} /\
  I16u16_sb 1 r7{2} r7j{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle8_ph 1 1 r6h{1} r7h{1}).
 ecall {2} (__shuffle8_ph 1 1 r4h{1} r5h{1}).
 ecall {2} (__shuffle8_ph 2 2 r2h{1} r3h{1}).
 ecall {2} (__shuffle8_ph 2 4 r0h{1} r1h{1}).
 ecall {2} (__red16x_sb_ph 8 r0h{1}).
 wp; skip => |> &1 &2; rewrite !lez_maxr 1..3:/# => |> *.
 pose z0R := VPBROADCAST_8u32 _.
 pose z1R := VPBROADCAST_8u32 _.
 pose z1L := Array16.init _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zetas_inv_op !z2u32E //= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /R2C /=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1L /z1R !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -inFqM_mod /q /= /zetas_inv_op !initiE //= !Iu16_ub_of_int /q /=.
 by move => |> *.
rcondt{2} 2; first by move=> *; inline*; auto.
unroll{2} 11; rcondt{2} 11; first by move=> *; inline*; auto.
seq 19 23: (#[/:2]pre /\ i{2}=1 /\ 
   I16u16_sb 2 (P2R rp{2} 0) (P2C rp8{1} 0) /\
   I16u16_sb 4 (P2R rp{2} 1) (P2C rp8{1} 1) /\
   I16u16_sb 2 (P2R rp{2} 2) (P2C rp8{1} 2) /\
   I16u16_sb 2 (P2R rp{2} 3) (P2C rp8{1} 3) /\
   I16u16_sb 1 (P2R rp{2} 4) (P2C rp8{1} 4) /\
   I16u16_sb 1 (P2R rp{2} 5) (P2C rp8{1} 5) /\
   I16u16_sb 1 (P2R rp{2} 6) (P2C rp8{1} 6) /\
   I16u16_sb 1 (P2R rp{2} 7) (P2C rp8{1} 7) /\
   I16u16_sb 8 r0{2} r0l{1} /\
   I16u16_sb 8 r1{2} r1l{1} /\
   I16u16_sb 1 r2{2} r2l{1} /\
   I16u16_sb 1 r3{2} r3l{1} /\
   I16u16_sb 8 r4{2} r4l{1} /\
   I16u16_sb 8 r5{2} r5l{1} /\
   I16u16_sb 1 r6{2} r6l{1} /\
   I16u16_sb 1 r7{2} r7l{1} ).
 call (invntt_butterfly64x_eq 4 4 4 4 4 4 4 4).
 wp; ecall {2} (__red16x_sb_ph 8 r0j{1}).
 wp; skip => &1 &2 |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z2R := z2u256 _ _.
 pose z3R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 pose z3L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 have ->: qinv16u16M z2R z3R.
  rewrite /z2R /z3R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 rewrite (P2RS rp{2}) !PUR_i //= !P2R_i //= (P2CS rp{1}) !PUC_i //= !P2C_i //= => |>. 
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 clear xx; pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z3R /z3L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 2 8: (#[/:11]pre /\ x16_spec 20159 vx16{2} /\
   I16u16_sb 4 r0{2} r0m{1} /\
   I16u16_sb 4 r1{2} r1m{1} /\
   I16u16_sb 2 r2{2} r2m{1} /\
   I16u16_sb 2 r3{2} r3m{1} /\
   I16u16_sb 1 r4{2} r4m{1} /\
   I16u16_sb 1 r5{2} r5m{1} /\
   I16u16_sb 1 r6{2} r6m{1} /\
   I16u16_sb 1 r7{2} r7m{1} ).
 call (invntt_butterfly64x_eq 2 2 1 1 2 2 1 1).
 ecall {2} (__red16x_sb_ph 8 r5l{1}).
 ecall {2} (__red16x_sb_ph 8 r4l{1}).
 ecall {2} (__red16x_sb_ph 8 r1l{1}).
 ecall {2} (__red16x_sb_ph 8 r0l{1}).
 wp; skip => |> &1 &2 *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 4*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 move => |> *.
 have ->: x16_spec 20159 (C2R vx16_op).
  by rewrite x16_spec_C2R /q /=.
 done.
seq 6 7: (#[/:12]pre /\
   I16u16_sb 8 r0{2} r0o{1} /\
   I16u16_sb 1 r1{2} r1o{1} /\
   I16u16_sb 4 r2{2} r2o{1} /\
   I16u16_sb 1 r3{2} r3o{1} /\
   I16u16_sb 2 r4{2} r4o{1} /\
   I16u16_sb 1 r5{2} r5o{1} /\
   I16u16_sb 2 r6{2} r6o{1} /\
   I16u16_sb 1 r7{2} r7o{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle1_ph 1 1 r6m{1} r7m{1}).
 ecall {2} (__shuffle1_ph 1 1 r4m{1} r5m{1}).
 ecall {2} (__shuffle1_ph 2 2 r2m{1} r3m{1}).
 ecall {2} (__shuffle1_ph 4 4 r0m{1} r1m{1}).
 have Emax: forall x, max x x = x by done. 
 wp; skip => |> &1 &2; rewrite !Emax => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
   I16u16_sb 8 r0{2} r0q{1} /\
   I16u16_sb 2 r1{2} r1q{1} /\
   I16u16_sb 1 r2{2} r2q{1} /\
   I16u16_sb 1 r3{2} r3q{1} /\
   I16u16_sb 4 r4{2} r4q{1} /\
   I16u16_sb 2 r5{2} r5q{1} /\
   I16u16_sb 1 r6{2} r6q{1} /\
   I16u16_sb 1 r7{2} r7q{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle2_ph 1 1 r5o{1} r7o{1}).
 ecall {2} (__shuffle2_ph 1 1 r1o{1} r3o{1}).
 ecall {2} (__shuffle2_ph 2 2 r4o{1} r6o{1}).
 ecall {2} (__shuffle2_ph 2 4 r0o{1} r2o{1}).
 ecall {2} (__red16x_sb_ph 8 r0o{1}).
 have Emax: forall x, max x x = x by done.
 wp; skip => |> &1 &2; rewrite !Emax => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0s{1} /\
  I16u16_sb 4 r1{2} r1s{1} /\
  I16u16_sb 2 r2{2} r2s{1} /\
  I16u16_sb 2 r3{2} r3s{1} /\
  I16u16_sb 1 r4{2} r4s{1} /\
  I16u16_sb 1 r5{2} r5s{1} /\
  I16u16_sb 1 r6{2} r6s{1} /\
  I16u16_sb 1 r7{2} r7s{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle4_ph 1 1 r3q{1} r7q{1}).
 ecall {2} (__shuffle4_ph 1 1 r2q{1} r6q{1}).
 ecall {2} (__shuffle4_ph 2 2 r1q{1} r5q{1}).
 ecall {2} (__shuffle4_ph 2 4 r0q{1} r4q{1}).
 ecall {2} (__red16x_sb_ph 8 r0q{1}).
 wp; skip => |> &1 &2; rewrite !lez_maxr 1..3:/# => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z0R /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!inFqM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0u{1} /\
  I16u16_sb 1 r1{2} r1u{1} /\
  I16u16_sb 4 r2{2} r2u{1} /\
  I16u16_sb 1 r3{2} r3u{1} /\
  I16u16_sb 2 r4{2} r4u{1} /\
  I16u16_sb 1 r5{2} r5u{1} /\
  I16u16_sb 2 r6{2} r6u{1} /\
  I16u16_sb 1 r7{2} r7u{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle8_ph 1 1 r6s{1} r7s{1}).
 ecall {2} (__shuffle8_ph 1 1 r4s{1} r5s{1}).
 ecall {2} (__shuffle8_ph 2 2 r2s{1} r3s{1}).
 ecall {2} (__shuffle8_ph 2 4 r0s{1} r1s{1}).
 ecall {2} (__red16x_sb_ph 8 r0s{1}).
 wp; skip => |> &1 &2; rewrite !lez_maxr 1..3:/# => |> *.
 pose z0R := VPBROADCAST_8u32 _.
 pose z1R := VPBROADCAST_8u32 _.
 pose z1L := Array16.init _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zetas_inv_op !z2u32E //= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /R2C /=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1L /z1R !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -inFqM_mod /q /= /zetas_inv_op !initiE //= !Iu16_ub_of_int /q /=.
 by move => |> *.
rcondf{2} 2; first by move=> *; inline*; auto.
rcondf{2} 7; first by move=> *; inline*; auto.
unroll{2} 12; rcondt{2} 12; first by move => *; inline*; auto.
rcondt{2} 12; first by move => *; inline*; auto.
seq 13 33: (#[/:2]pre /\ x16_spec (-10079) flox16{2} /\
            x16_spec 1441 fhix16{2} /\ i{2}=1 /\ 
   I16u16S_sb (inFq 3303*inFq W16.modulus) 1 (P2R rp{2} 0) r0a{1} /\
   I16u16S_sb (inFq 3303*inFq W16.modulus) 1 (P2R rp{2} 1) r1a{1} /\
   I16u16S_sb (inFq 3303*inFq W16.modulus) 1 (P2R rp{2} 2) r2a{1} /\
   I16u16S_sb (inFq 3303*inFq W16.modulus) 1 (P2R rp{2} 3) r3a{1} /\
   I16u16_sb 1 (P2R rp{2} 4) r0b{1} /\
   I16u16_sb 1 (P2R rp{2} 5) r1b{1} /\
   I16u16_sb 1 (P2R rp{2} 6) r2b{1} /\
   I16u16_sb 1 (P2R rp{2} 7) r3b{1} /\
   I16u16S_sb (inFq 3303*inFq W16.modulus) 1 (P2R rp{2} 8) r4a{1} /\
   I16u16S_sb (inFq 3303*inFq W16.modulus) 1 (P2R rp{2} 9) r5a{1} /\
   I16u16S_sb (inFq 3303*inFq W16.modulus) 1 (P2R rp{2} 10) r6a{1} /\
   I16u16S_sb (inFq 3303*inFq W16.modulus) 1 (P2R rp{2} 11) r7a{1} /\
   I16u16_sb 1 (P2R rp{2} 12) r4b{1} /\
   I16u16_sb 1 (P2R rp{2} 13) r5b{1} /\
   I16u16_sb 1 (P2R rp{2} 14) r6b{1} /\
   I16u16_sb 1 (P2R rp{2} 15) r7b{1} /\
   zeta0{2} = VPBROADCAST_8u32 (z2u32 zetas_inv_op 392) /\
   zeta1{2} = VPBROADCAST_8u32 (z2u32 zetas_inv_op 394) /\
   fhix16{2} = C2R fhix16_op /\
   flox16{2} = C2R flox16_op /\
   zeta0{1} = Array16.init (fun (_ : int) => inFq 1600) ).
 wp.
 ecall {2} (fq_mulprecomp16x_aux 4 r3a{1}).
 ecall {2} (fq_mulprecomp16x_aux 4 r2a{1}).
 ecall {2} (fq_mulprecomp16x_aux 8 r1a{1}).
 ecall {2} (fq_mulprecomp16x_aux 4 r0a{1}).
 wp; call (invntt_butterfly64x_eq_last 2 4 2 2 2 4 2 2).
 wp; ecall {2} (__red16x_sb_ph 8 r0u{1}).
 skip => |> &1 &2 *.
 pose z0R := VPBROADCAST_8u32 _.
 pose z1R := VPBROADCAST_8u32 _.
 pose z1L := Array16.init _.
 rewrite (P2RS rp{2}) !PUR_i //= !P2R_i //= (P2CS rp8{1}) !PUC_i //= !P2C_i //= => |>.
 have ->: 8*q <= 32767 by rewrite /q /=.
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zetas_inv_op !z2u32E //= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /R2C /=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1L /z1R !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -!inFqM_mod /q /= /zetas_inv_op !initiE //= !Iu16_ub_of_int /q /=.
 move => |> *.
 have ->: x16_spec 1441 (C2R fhix16_op).
  by rewrite x16_spec_C2R /=.
 have ->: x16_spec (-10079) (C2R flox16_op).
  by rewrite x16_spec_C2R /=.
 move => |> *.
 by rewrite !PUR_i //= !P2R_i //=.
unroll{2} 1; rcondt{2} 1; first by auto.
rcondf{2} 1; first by auto.
rcondf{2} 23; first by move=> *; inline*; auto.
wp.
ecall {2} (fq_mulprecomp16x_aux 2 r3c{1}).
ecall {2} (fq_mulprecomp16x_aux 2 r2c{1}).
ecall {2} (fq_mulprecomp16x_aux 2 r1c{1}).
ecall {2} (fq_mulprecomp16x_aux 2 r0c{1}).
wp; call (invntt_butterfly64x_eq_last 1 1 1 1 1 1 1 1).
wp; skip => |> &1 &2 *.
pose z0R := VPBROADCAST_8u32 _.
pose z1R := VPBROADCAST_8u32 _.
pose z1L := Array16.init _.
have ->: 2*q <= 32767 by smt().
have ->: qinv16u16M z0R z1R.
 by rewrite /z0R /z1R /zetas_inv_op !z2u32E //= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /R2C /=.
pose xx := List.all _ _.
have ->: xx.
 by rewrite /xx /z1L /z1R !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -!inFqM_mod /q /= /zetas_inv_op !initiE //= !Iu16_ub_of_int /q /=.
move => |> *.
rewrite (P2RS rp{2}) !PUR_i //=.
rewrite -{2}iotaredE /= !P2R_i //=.
by rewrite !P2C_map //= !I16u16S_sb_map !P2C_i //=.
qed.

