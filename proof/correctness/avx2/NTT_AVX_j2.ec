require import AllCore List Int IntDiv Ring StdOrder.

from Jasmin require import JModel.

require import Array256 Array16.
require import WArray512.

require import NTT_AVX_Fq2.

(******* *)

require import Kyber.
import Zq.

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
move=> Hk Hi.
admit.
qed.
 
lemma bits32_shl16_bits16H (w: W256.t) k:
 0 <= k < 8 => 
 (w \bits32 k) `<<` W8.of_int 16 \bits16 1
 = w \bits16 2*k.
proof.
move=> Hk.
admit.
qed.

lemma bits32_shr16_bits16L (w: W256.t) k:
 0 <= k < 8 => 
 (w \bits32 k) `>>` W8.of_int 16 \bits16 0
 = w \bits16 2*k + 1.
proof.
move=> Hk.
admit.
qed.





lemma R2C_pack16 f k:
 0 <= k < 16 =>
 (R2C (W16u16.pack16_t f)).[k] = f.[k].
proof. by move=> Hk; rewrite /R2C initiE //= pack16bE. qed.

lemma R2C_map2 f x y k:
 0 <= k < 16 =>
 (R2C (W16u16.map2 f x y)).[k] = f (R2C x).[k] (R2C y).[k].
proof. by move: k; rewrite allP_range -iotaredE /R2C. qed.

lemma sint_bnd_ltR bL bR x:
 sint_bnd bL (bR-1) x <=> bL <= to_sint x < bR by smt().


require import KyberPoly.
import KyberPoly.


(** IMPLEMENTATION RELATIONS
  (obs: perhaps a nice use-case for type-classes...) *)

abbrev inFqW16 (w: W16.t) : Fq = inFq (W16.to_sint w).

(** Implementation relation (signed bounded) *)
op Iu16_sb (n: int) (y: W16.t) (x: Fq) =
 x = inFqW16 y /\ sint_bnd (-n*q) (n*q-1) y.

lemma Iu16_sbE n y x:
 Iu16_sb n y x <=> x = inFqW16 y /\ (-n*q) <= to_sint y < (n*q).
proof. rewrite /Iu16_sb; split => |> * /#. qed.

(** Implementation relation (Montgomery form, signed bounded) *)
abbrev Iu16M_sb (n: int) (y: W16.t) (x: Fq) =
 Iu16_sb n y (x*inFq W16.modulus).

(** Implementation relation (unsigned bounded) *)
op Iu16_ub (n: int) (y: W16.t) (x: Fq) =
 x = inFqW16 y /\ sint_bnd 0 (n*q-1) y.

lemma Iu16_ubE n y x:
 Iu16_ub n y x <=> x = inFqW16 y /\ 0 <= to_sint y < (n*q).
proof. rewrite /Iu16_ub; split => |> * /#. qed.

(** Implementation relation (Montgomery form, unsigned bounded) *)
abbrev Iu16M_ub (n: int) (y: W16.t) (x: Fq) =
 Iu16_ub n y (x*inFq W16.modulus).


(** Implementation relation over chunks *)
abbrev I16u16_sb (n:int) (y: W256.t) (x: Fq Array16.t) =
 all (fun k=> Iu16_sb n (R2C y).[k] x.[k]) (iota_ 0 16).

abbrev I16u16_ub (n:int) (y: W256.t) (x: Fq Array16.t) =
 all (fun k=> Iu16_ub n (R2C y).[k] x.[k]) (iota_ 0 16).

abbrev I16u16M_sb (n:int) (y: W256.t) (x: Fq Array16.t) =
 all (fun k=> Iu16M_sb n (R2C y).[k] x.[k]) (iota_ 0 16).

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

(* ?not needed?
abbrev I256u16M_sb (n:int) (y: W16.t Array256.t ) (x: Fq Array256.t) =
 all (fun k=> I16u16M_sb n (P2R y k) (P2C x k)) (iota_ 0 16).

lemma I256u16M_sbP n y x:
 I256u16M_sb n y x
 <=> all (fun k=> Iu16M_sb n y.[k] x.[k]) (iota_ 0 256).
proof. by rewrite -iotaredE /= !P2R2C /P2C /pchunk !initiE //=. qed.

abbrev I256u16M_ub (n:int) (y: W16.t Array256.t ) (x: Fq Array256.t) =
 all (fun k=> I16u16M_ub n (P2R y k) (P2C x k)) (iota_ 0 16).

lemma I256u16M_uP n y x:
 I256u16M_ub n y x
 <=> all (fun k=> Iu16M_ub n y.[k] x.[k]) (iota_ 0 256).
proof. by rewrite -iotaredE /= !P2R2C /P2C /pchunk !initiE //=. qed.
*)

(* precomputed multiplications between zetas and qinv *)
op qinv16W16M (x y: JWord.W256.t) =
 forall i, 0 <= i < 16 =>
  (x \bits16 i)%JWord.W16u16
  = (y \bits16 i)%JWord.W16u16 * (W16.of_int 62209).

(* (r2c x).[i] = (r2c y).[i] * (W16.of_int 62209) *)
op x16_spec (n: int) (x: JWord.W256.t) =
 forall i, 0 <= i < 16 =>
  (x \bits16 i)%JWord.W16u16 = W16.of_int n.

lemma C2RbiE a k:
 0 <= k < 16 =>
 C2R a \bits16 k = a.[k].
proof. by move=> Hk; rewrite -{-1}(C2RK a) /R2C initiE. qed.

lemma x16_from_C2R n a:
 x16_spec n (C2R a) <=> all (fun i=>a.[i]=W16.of_int n) (iotared 0 16).
proof.
rewrite iotaredE -allP_range /x16_spec.
by split => H k Hk /=; move: (H k Hk) => <-; rewrite C2RbiE.
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

lemma z2u256E a k:
 0 <= k < 384 =>
 z2u256 a k = C2R (Array16.init (fun i => a.[k+i])).
proof.
move=> Hk.
rewrite /z2u256 /C2R /get256_direct; congr.
apply W32u8.Pack.ext_eq => /= i Hi.
rewrite /init16 !initiE //=.
rewrite WArray32.WArray32.initiE //=.
rewrite !initiE 1..2:/# /=.
congr.
 by rewrite mulrC divzMDl.
by rewrite mulrC modzMDl.
qed.

(* Barret reduction *)

require import Fq.
print Fq.SignedReductions.SREDC.

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
 by move: (W16.to_uint_cmp x); smt. (* FIXME *)
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
rewrite to_sint_wmulhs /R /smod.
case: (to_sint x * to_sint y %/ Montgomery16.R < 0) => E.
 have ->: to_sint x * to_sint y %/ Montgomery16.R %% Montgomery16.R
  = R + to_sint x * to_sint y %/ Montgomery16.R.
  move: (W16.to_sint_cmp x) (W16.to_sint_cmp y). smt.
 have ->: 2 ^ (16 - 1) <= R + to_sint x * to_sint y %/ Montgomery16.R.
  move: (W16.to_sint_cmp x) (W16.to_sint_cmp y). smt.
 by rewrite /R; smt().
have ->: to_sint x * to_sint y %/ Montgomery16.R %% Montgomery16.R
  = to_sint x * to_sint y %/ Montgomery16.R.
 move: (W16.to_sint_cmp x) (W16.to_sint_cmp y). smt.
have ->: !2 ^ (16 - 1) <= to_sint x * to_sint y %/ Montgomery16.R.
 move: (W16.to_sint_cmp x) (W16.to_sint_cmp y). smt.
rewrite /R; smt().
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
rewrite -(inFqM_mod (to_sint x)) -inFqM_mod /q modzMml -H1 /#.
qed.

lemma Iu16_sbD (b1 b2:int) x y rx ry:
 (b1+b2)*q <= W16.max_sint =>
 Iu16_sb b1 rx x =>
 Iu16_sb b2 ry y =>
 Iu16_sb (b1+b2) (rx+ry) (x+y).
proof.
move => H [-> Hx] [-> Hy]; split.
 rewrite /Zq.(+) !inFqK -eq_inFq modzDm to_sintD_small //.
 split.
  admit.
 admit.
have E: -(b1+b2)*q = -b1*q + -b2*q by ring.
rewrite E mulrDl -addrA; apply to_sintD_bnd => //.
  smt(). 
 have ->: (- b1 * q) - b2 * q = - (b1+b2)*q by ring.
 have ?: -W16.max_sint <= -(b1+b2)*q by admit.
apply (ler_trans (-W16.max_sint)).
  smt().
 by apply ler_opp2.
rewrite addrA -mulrDl. 
apply (ler_trans ((b1 + b2) * q)) => //.
by rewrite ler_subl_addr /#.
qed.

lemma butterflyD (c:int) xl xr z rxl rxr rzM rzMqinv rq:
 c*q + q <= W16.max_sint =>
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
apply Iu16_sbD => //.
 by rewrite mulrDl /=; apply Hbnd.
admit.
qed.

(*
lemma butterfly16x_rE (bnd:int) xl xr z rxl rxr rzM rzMqinv rq16x:
 bnd + q <= W16.max_sint =>
 Impl16W16_sbnd bnd xl rxl =>
 Impl16W16_sbnd bnd xr rxr =>
 qinv16W16M rzMqinv rzM =>
 Impl16W16M_sbnd q z rzM =>
 x16_spec q rq16x =>
 Impl16W16_sbnd (bnd+q)
  (Array16.init (fun i=>xl.[i]+z.[i]*xr.[i]))
  (VPSUB_16u16 (VPADD_16u16 (VPMULH_16u16 rzM rxr) rxl) (VPMULH_16u16 (VPMULL_16u16 rzMqinv rxr) rq16x)).
proof.
move=> Hbnd /Impl16W16_sbndP Hxl /Impl16W16_sbndP Hxr Hzinv Hz Hq.
apply/Impl16W16_sbndP => k Hk.
rewrite initiE //=.
rewrite /VPSUB_16u16 /VPADD_16u16 /VPMULH_16u16 /VPMULL_16u16.
rewrite !R2C_map2 /=.
apply butterflyD => //.
- admit.
- by apply Hxl.
- by apply Hxr.
- admit.
- admit.
qed.

lemma butterfly16x_lE bnd xl xr z rxl rxr rzM rzMqinv rq16x:
 Impl16W16_sbnd bnd xl rxl =>
 Impl16W16_sbnd bnd xr rxr =>
 qinv16W16M rzMqinv rzM =>
 Impl16W16M_sbnd q z rzM =>
 x16_spec q rq16x =>
 Impl16W16_sbnd (bnd+q)
  (Array16.init (fun i=>xl.[i]-z.[i]*xr.[i]))
  (VPADD_16u16 (VPMULH_16u16 (VPMULL_16u16 rzMqinv rxr) rq16x) (VPSUB_16u16 rxl (VPMULH_16u16 rzM rxr))).
proof.
move=> Hxl Hxr Hzinv Hz Hq.
apply /Impl16W16_sbndP => k Hk.

rewrite initiE 1:// /=.
rewrite /VPSUB_16u16 /VPADD_16u16 /VPMULH_16u16 /VPMULL_16u16 !R2C_map2 /=.

admit (*
(xl.[i] - z.[i] * xr.[i])%NTTAlgebra.NTTequiv.BigFq.CR =
inFqW16
  (wmulhs ((rzMqinv \bits16 i) * (rxr \bits16 i)) (rq16x \bits16 i) +
   ((rxl \bits16 i) - wmulhs (rzM \bits16 i) (rxr \bits16 i))) /\
sint_bnd
  (wmulhs ((rzMqinv \bits16 i) * (rxr \bits16 i)) (rq16x \bits16 i) +
   ((rxl \bits16 i) - wmulhs (rzM \bits16 i) (rxr \bits16 i))) (-q) q
*).
qed.
*)

equiv butterfly64x_eq c:
 NTT_AVX.__butterfly64x ~ Jkem_avx2.M.__butterfly64x :
 c*q + q <= W16.max_sint /\
 I16u16_sb c rl0{2} rl0t{1} /\
 I16u16_sb c rl1{2} rl1t{1} /\
 I16u16_sb c rl2{2} rl2t{1} /\
 I16u16_sb c rl3{2} rl3t{1} /\
 I16u16_sb c rh0{2} rh0t{1} /\
 I16u16_sb c rh1{2} rh1t{1} /\
 I16u16_sb c rh2{2} rh2t{1} /\
 I16u16_sb c rh3{2} rh3t{1} /\
 qinv16W16M zl0{2} zh0{2} /\
 qinv16W16M zl1{2} zh1{2} /\
 I16u16M_sb 1 zh0{2} z0{1} /\
 I16u16M_sb 1 zh1{2} z1{1} /\
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
admit (*
proc; sp 1 0; simplify.
wp; skip => |> &1 &2 Hbnd H0 H1 H2 H3 H4 H5 H6 H7 Hqinv0 Hqinv1 Hq Hzl Hzh.
do 4! (split; first by apply butterfly16x_rE => // /#).
do 3! (split; first by apply butterfly16x_lE => //).
by apply butterfly16x_lE => //.
*).
qed.

(** SHUFFLE Ops *)

lemma __shuffle8_ll: islossless Jkem_avx2.M.__shuffle8 by islossless.

hoare __shuffle8_h n _a _b:
 Jkem_avx2.M.__shuffle8:
   I16u16_sb n a _a /\ I16u16_sb n b _b
   ==> I16u16_sb n res.`1 (shuffle8 _a _b).`1
       /\ I16u16_sb n res.`2 (shuffle8 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPERM2I128 /=.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
rewrite ifT.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
rewrite ifF.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
rewrite ifT.
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
have ->: !((of_int 32))%W8.[0].
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
have ->: !((of_int 32))%W8.[4].
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
have ->: ((of_int 49))%W8.[0].
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
have ->: ((of_int 49))%W8.[4].
 by rewrite /W8.of_int /= /int2bs /mkseq -iotaredE /=.
rewrite !b2i0 !b2i1 /shuffle8 /=.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
by rewrite -!iotaredE /= /#.
qed.

phoare __shuffle8_ph n _a _b:
 [ Jkem_avx2.M.__shuffle8:
   I16u16_sb n a _a /\ I16u16_sb n b _b
   ==> I16u16_sb n res.`1 (shuffle8 _a _b).`1
       /\ I16u16_sb n res.`2 (shuffle8 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle8_ll (__shuffle8_h n _a _b). qed.

(* Do we need this?
hoare __shuffle8_h _a _b:
 Jkem_avx2.M.__shuffle8:
 a = _a /\ b = _b ==>
 res = (C2R (shuffle8 (R2C _a) (R2C _b)).`1, C2R (shuffle8 (R2C _a) (R2C _b)).`2).
admitted.
*)

lemma __shuffle4_ll: islossless Jkem_avx2.M.__shuffle4 by islossless.

hoare __shuffle4_h n _a _b:
 Jkem_avx2.M.__shuffle4:
   I16u16_sb n a _a /\ I16u16_sb n b _b
   ==> I16u16_sb n res.`1 (shuffle4 _a _b).`1
       /\ I16u16_sb n res.`2 (shuffle4 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPUNPCKL_4u64 /VPUNPCKH_4u64 /VPUNPCKL_2u64 /VPUNPCKH_2u64 /= /shuffle4 /= /interleave_gen /get_lo_2u64 /get_hi_2u64 /=.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
by rewrite -!iotaredE /= /#.
qed.

phoare __shuffle4_ph n _a _b:
 [ Jkem_avx2.M.__shuffle4:
   I16u16_sb n a _a /\ I16u16_sb n b _b
   ==> I16u16_sb n res.`1 (shuffle4 _a _b).`1
       /\ I16u16_sb n res.`2 (shuffle4 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle4_ll (__shuffle4_h n _a _b). qed.

lemma __shuffle2_ll: islossless Jkem_avx2.M.__shuffle2 by islossless.

hoare __shuffle2_h n _a _b:
 Jkem_avx2.M.__shuffle2:
   I16u16_sb n a _a /\ I16u16_sb n b _b
   ==> I16u16_sb n res.`1 (shuffle2 _a _b).`1
       /\ I16u16_sb n res.`2 (shuffle2 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPBLENDD_256 /VMOVSLDUP_8u32 /VMOVSLDUP_4u32 /VPSRL_4u64 /shuffle2 /=.
have ->: !((of_int 170))%W8.[0].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: ((of_int 170))%W8.[1].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: !((of_int 170))%W8.[2].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: ((of_int 170))%W8.[3].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: !((of_int 170))%W8.[4].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: ((of_int 170))%W8.[5].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: !((of_int 170))%W8.[6].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: ((of_int 170))%W8.[7].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
rewrite -!iotaredE /= => |>.
by rewrite !bits64_shr32_bits16 /= /#.
qed.

phoare __shuffle2_ph n _a _b:
 [ Jkem_avx2.M.__shuffle2:
   I16u16_sb n a _a /\ I16u16_sb n b _b
   ==> I16u16_sb n res.`1 (shuffle2 _a _b).`1
       /\ I16u16_sb n res.`2 (shuffle2 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle2_ll (__shuffle2_h n _a _b). qed.

lemma __shuffle1_ll: islossless Jkem_avx2.M.__shuffle1 by islossless.

hoare __shuffle1_h n _a _b:
 Jkem_avx2.M.__shuffle1:
   I16u16_sb n a _a /\ I16u16_sb n b _b
   ==> I16u16_sb n res.`1 (shuffle1 _a _b).`1
       /\ I16u16_sb n res.`2 (shuffle1 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPBLENDW_256 /VPBLENDW_128 /VPSLL_8u32 /VPSRL_8u32 /shuffle1 /=.
rewrite W2u128_W16u16.
have ->: !((of_int 170))%W8.[0].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: ((of_int 170))%W8.[1].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: !((of_int 170))%W8.[2].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: ((of_int 170))%W8.[3].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: !((of_int 170))%W8.[4].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: ((of_int 170))%W8.[5].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: !((of_int 170))%W8.[6].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
have ->: ((of_int 170))%W8.[7].
 by rewrite /W8.of_int /int2bs /mkseq -iotaredE.
rewrite /= !bits32_shl16_bits16H // !bits32_shr16_bits16L //=.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
by rewrite -!iotaredE /= => |>.
qed.

phoare __shuffle1_ph n _a _b:
 [ Jkem_avx2.M.__shuffle1:
   I16u16_sb n a _a /\ I16u16_sb n b _b
   ==> I16u16_sb n res.`1 (shuffle1 _a _b).`1
       /\ I16u16_sb n res.`2 (shuffle1 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle1_ll (__shuffle1_h n _a _b). qed.

(* Poly reduction *)
lemma __red16x_ll: islossless Jkem_avx2.M.__red16x by islossless.

hoare __red16x_h y:
 Jkem_avx2.M.__red16x :
    x16_spec q qx16 /\
    x16_spec 20159 vx16 /\
    I16u16_sb 9 r y ==> I16u16_ub 2 res y.
proof.
proc; simplify.
wp; skip => |> &m.
rewrite /x16_spec => Hq Hv.
rewrite -!iotaredE /VPSUB_16u16 /VPMULL_16u16 /VPMULH_16u16 /VPSRA_16u16 /R2C /= => |> *.
smt(sbred_spec).
qed.

phoare __red16x_ph x:
 [ Jkem_avx2.M.__red16x :
    x16_spec q qx16 /\
    x16_spec 20159 vx16 /\
    I16u16_sb 9 r x ==> I16u16_ub 2 res x ] = 1%r.
proof. by conseq __red16x_ll (__red16x_h x). qed.

(* Preprocessed implementation to control the expansion of defs. *)
module Tmp = {
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
    zetasp <- jzetas_exp;
    qx16 <- C2R jqx16;
    zeta0 <-
    VPBROADCAST_8u32 (z2u32 zetasp 0);
    zeta1 <-
    VPBROADCAST_8u32 (z2u32 zetasp 2);
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
    var aux: int;
    
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
    zetasp <- jzetas_exp;
    qx16 <- C2R jqx16;
    i <- 0;
    while (i < 2) {
      zeta0 <-
      VPBROADCAST_8u32 (z2u32 zetasp (4+196*i));
      zeta1 <-
      VPBROADCAST_8u32 (z2u32 zetasp (6+196*i));
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
      vx16 <- C2R jvx16;
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
}.

equiv __ntt_level0_eq_:
 Jkem_avx2.M.__ntt_level0 ~ Tmp.__ntt_level0:
 ={rp} ==> ={res}.
proc.
seq 13 13: (={rp,r0,r1,r2,r3,r4,r5,r6,r7,zeta0,zeta1,qx16}).
 by wp; skip; rewrite !P2RE //. 
seq 1 1: #pre.
 by sim.
seq 16 16: #pre.
 by wp; skip => />; rewrite !P2RE // !PURE //.
seq 1 1: #pre.
 by sim.
by wp; skip => />; rewrite !PURE //.
qed.

equiv __ntt_level1t6_eq_:
 Jkem_avx2.M.__ntt_level1t6 ~ Tmp.__ntt_level1t6:
 ={rp} ==> ={res}.
proc.
seq 3 3: (={zetasp,qx16,rp}).
 by auto => />.
while (0 <= i{2} /\ ={i,zetasp,qx16,rp}).
 seq 10 10: (#pre /\ ={zeta0,zeta1,r0,r1,r2,r3,r4,r5,r6,r7}).
  by auto => /> *; rewrite !P2RE /#.
 seq 1 1: (#pre).
  by conseq />; sim.
 seq 6 6: (#pre).
  conseq |>; sim; auto => |> *.
  by rewrite /z2u256 !mulrDr !mulrA /=.
 seq 1 1: (#pre).
  by conseq />; sim.
 seq 6 6: (#pre).
  conseq />; sim; auto => /> *.
  by rewrite /z2u256 !mulrDr !mulrA /=.
 seq 1 1: (#pre).
  by conseq />; sim.
 seq 6 6: (#pre).
  conseq />; sim; auto => /> *.
  by rewrite /z2u256 !mulrDr !mulrA /=.
 seq 1 1: (#pre).
  by conseq />; sim.
 seq 6 6: (#pre).
  conseq />; sim; auto => /> *.
  by rewrite /z2u256 !mulrDr !mulrA /=.
 seq 1 1: (#pre).
  by conseq />; sim.
 seq 4 4: (#pre /\ ={zeta2,zeta3}).
  auto => /> *.
  by rewrite /z2u256 !mulrDr !mulrA /=.
 seq 10 10: (#pre).
  conseq />; sim.
  auto => />.
  by sim.
 by auto => /> *; rewrite !PURE 1..8:/# !mulrDr !mulrA /= /#.
by auto => />.
qed.

equiv __ntt_level0_eq:
 NTT_AVX.__ntt_level0 ~ Jkem_avx2.M.__ntt_level0:
 I256u16_sb 2 rp{2} rp{1} ==> I256u16_sb 3 res{2} res{1}.
proof.
transitivity Tmp.__ntt_level0
 ( I256u16_sb 2 rp{2} rp{1} ==> I256u16_sb 3 res{2} res{1} )
 ( ={rp} ==> ={res} );
  last by symmetry; conseq __ntt_level0_eq_.
  by move=> |> &1 &2 H; exists arg{2}. 
 done.
proc; simplify.
inline NTT_AVX.__ntt_level0.
wp; call (butterfly64x_eq 2); simplify.
wp; call (butterfly64x_eq 2); simplify.
wp; skip => &1 &2 Hpre zR qx16 z0R z1R z1L.
have A1: 2 * q + q <= 32767 by smt().
have A2: qinv16W16M z0R z1R.
 admit.
have A3: x16_spec q qx16.
 admit.
have A4: all (fun (k : int) => Iu16_sb 1 (R2C z1R).[k] (z1L.[k] * inFq 65536)) (iota_ 0 16).
 admit.
move: Hpre; rewrite !A1 !A2 !A3 !A4 -{2}iotaredE /= => |> *.
rewrite (P2RS rp{2}) /= !PUR_i //= !P2R_i //= => |> *.
rewrite (P2RS rp{2}) /= !PUR_i //= => |> *.
by rewrite -{2}iotaredE /= !P2R_i //= !P2C_i //=.
qed.

equiv __ntt_level1t6_eq:
 NTT_AVX.__ntt_level1t6 ~ Jkem_avx2.M.__ntt_level1t6:
 I256u16_sb 3 rp{2} rp{1} ==> I256u16_ub 2 res{2} res{1}.
proof.
transitivity Tmp.__ntt_level1t6
 ( I256u16_sb 3 rp{2} rp{1} ==> I256u16_ub 2 res{2} res{1} )
 ( ={rp} ==> ={res} );
  last by symmetry; conseq __ntt_level1t6_eq_.
  move => &1 &2 *; exists arg{2}; smt().
 done.
proc.
unroll {2} 5; rcondt {2} 5.
 by move=> &m; wp;skip => /=.
seq 45 66: (i{2} = 1 /\ x16_spec q qx16{2} /\
  I16u16_ub 2 (P2R rp{2} 0) (P2C rp8{1} 0) /\
  I16u16_ub 2 (P2R rp{2} 1) (P2C rp8{1} 1) /\
  I16u16_ub 2 (P2R rp{2} 2) (P2C rp8{1} 2) /\
  I16u16_ub 2 (P2R rp{2} 3) (P2C rp8{1} 3) /\
  I16u16_ub 2 (P2R rp{2} 4) (P2C rp8{1} 4) /\
  I16u16_ub 2 (P2R rp{2} 5) (P2C rp8{1} 5) /\
  I16u16_ub 2 (P2R rp{2} 6) (P2C rp8{1} 6) /\
  I16u16_ub 2 (P2R rp{2} 7) (P2C rp8{1} 7) /\
  I16u16_sb 3 (P2R rp{2} 8) (P2C rp{1} 8) /\
  I16u16_sb 3 (P2R rp{2} 9) (P2C rp{1} 9) /\
  I16u16_sb 3 (P2R rp{2} 10) (P2C rp{1} 10) /\
  I16u16_sb 3 (P2R rp{2} 11) (P2C rp{1} 11) /\
  I16u16_sb 3 (P2R rp{2} 12) (P2C rp{1} 12) /\
  I16u16_sb 3 (P2R rp{2} 13) (P2C rp{1} 13) /\
  I16u16_sb 3 (P2R rp{2} 14) (P2C rp{1} 14) /\
  I16u16_sb 3 (P2R rp{2} 15) (P2C rp{1} 15) ).
 (* first iteration (first 128 coefs) *)
 wp.
 ecall {2} (__red16x_ph r7j{1}).
 ecall {2} (__red16x_ph r3j{1}).
 ecall {2} (__red16x_ph r5j{1}).
 ecall {2} (__red16x_ph r1j{1}).
 ecall {2} (__red16x_ph r6j{1}).
 ecall {2} (__red16x_ph r2j{1}).
 ecall {2} (__red16x_ph r4j{1}).
 ecall {2} (__red16x_ph r0j{1}).
 wp; call (butterfly64x_eq 8).
 wp; call (butterfly64x_eq 7).
 ecall {2} (__shuffle1_ph 7 r3g{1} r7g{1}).
 ecall {2} (__shuffle1_ph 7 r2g{1} r6g{1}).
 ecall {2} (__shuffle1_ph 7 r1g{1} r5g{1}).
 ecall {2} (__shuffle1_ph 7 r0g{1} r4g{1}).
 wp; call (butterfly64x_eq 6); simplify.
 ecall {2} (__shuffle2_ph 6 r6e{1} r7e{1}).
 ecall {2} (__shuffle2_ph 6 r4e{1} r5e{1}).
 ecall {2} (__shuffle2_ph 6 r2e{1} r3e{1}).
 ecall {2} (__shuffle2_ph 6 r0e{1} r1e{1}).
 wp; call (butterfly64x_eq 5); simplify.
 ecall {2} (__shuffle4_ph 5 r5c{1} r7c{1}).
 ecall {2} (__shuffle4_ph 5 r1c{1} r3c{1}).
 ecall {2} (__shuffle4_ph 5 r4c{1} r6c{1}).
 ecall {2} (__shuffle4_ph 5 r0c{1} r2c{1}).
 wp; call (butterfly64x_eq 4); simplify.
 ecall {2} (__shuffle8_ph 4 r3a{1} r7a{1}).
 ecall {2} (__shuffle8_ph 4 r2a{1} r6a{1}).
 ecall {2} (__shuffle8_ph 4 r1a{1} r5a{1}).
 ecall {2} (__shuffle8_ph 4 r0a{1} r4a{1}).
 wp; call (butterfly64x_eq 3); simplify.
 wp; skip => &1 &2 Hpre Hzetas qx16 z0R z1R z1L.
 have A1: 3 * q + q <= 32767 by smt().
 have A2: qinv16W16M z0R z1R.
  admit.
 have A3: x16_spec q qx16.
  admit.
 have A4: all (fun (k : int) => Iu16_sb 1 (R2C z1R).[k] (z1L.[k] * inFq 65536)) (iota_ 0 16).
  admit.
 move: Hpre; rewrite !A1 !A2 !A3 !A4 -{2}iotaredE /= => |> *.
 have A12: 4 * q + q <= 32767 by smt().
 have A22: qinv16W16M (z2u256 Hzetas 8) (z2u256 Hzetas 24).
  admit.
 pose a4 := List.all _ _.
 have A42: a4.
  admit.
 move => |> *.
 have A13: 5 * q + q <= 32767 by smt().
 have A23: qinv16W16M (z2u256 Hzetas 40) (z2u256 Hzetas 56).
  admit.
 pose a43 := List.all _ _.
 have A43: a43.
  admit.
 move => |> *.
 have A14: 6 * q + q <= 32767 by smt().
 have A24: qinv16W16M (z2u256 Hzetas 72) (z2u256 Hzetas 88).
  admit.
 pose a44 := List.all _ _.
 have A44: a44.
  admit.
 move => |> *.
 have A15: 7 * q + q <= 32767 by smt().
 have A25: qinv16W16M (z2u256 Hzetas 104) (z2u256 Hzetas 120).
  admit.
 pose a45 := List.all _ _.
 have A45: a45.
  admit.
 move => |> *.
 have A16: 8 * q + q <= 32767 by smt().
 have A26a: qinv16W16M (z2u256 Hzetas 136) (z2u256 Hzetas 152).
  admit.
 have A26b: qinv16W16M (z2u256 Hzetas 168) (z2u256 Hzetas 184).
  admit.
 pose a46a := List.all _ _.
 have A46: a46a.
  admit.
 pose a46b := List.all _ _.
 have A46b: a46b.
  admit.
 move => |> *.
 have Hvx16: x16_spec 20159 (C2R jvx16).
  admit.
 move => |> *.
 rewrite (P2RS rp{2}) /= !PUR_i //= !P2R_i //= => |> *.
 by rewrite (P2CS rp{1}) /= !PUC_i //= !P2C_i //= => |> *.
unroll {2} 1; rcondt {2} 1.
 by move=> &m; skip.
rcondf {2} 63.
 by move=> &m; inline*; wp; skip.
(* second iteration *)
wp.
ecall {2} (__red16x_ph r7u{1}).
ecall {2} (__red16x_ph r3u{1}).
ecall {2} (__red16x_ph r5u{1}).
ecall {2} (__red16x_ph r1u{1}).
ecall {2} (__red16x_ph r6u{1}).
ecall {2} (__red16x_ph r2u{1}).
ecall {2} (__red16x_ph r4u{1}).
ecall {2} (__red16x_ph r0u{1}).
wp; call (butterfly64x_eq 8).
wp; call (butterfly64x_eq 7).
ecall {2} (__shuffle1_ph 7 r3r{1} r7r{1}).
ecall {2} (__shuffle1_ph 7 r2r{1} r6r{1}).
ecall {2} (__shuffle1_ph 7 r1r{1} r5r{1}).
ecall {2} (__shuffle1_ph 7 r0r{1} r4r{1}).
wp; call (butterfly64x_eq 6); simplify.
ecall {2} (__shuffle2_ph 6 r6p{1} r7p{1}).
ecall {2} (__shuffle2_ph 6 r4p{1} r5p{1}).
ecall {2} (__shuffle2_ph 6 r2p{1} r3p{1}).
ecall {2} (__shuffle2_ph 6 r0p{1} r1p{1}).
wp; call (butterfly64x_eq 5); simplify.
ecall {2} (__shuffle4_ph 5 r5n{1} r7n{1}).
ecall {2} (__shuffle4_ph 5 r1n{1} r3n{1}).
ecall {2} (__shuffle4_ph 5 r4n{1} r6n{1}).
ecall {2} (__shuffle4_ph 5 r0n{1} r2n{1}).
wp; call (butterfly64x_eq 4); simplify.
ecall {2} (__shuffle8_ph 4 r3l{1} r7l{1}).
ecall {2} (__shuffle8_ph 4 r2l{1} r6l{1}).
ecall {2} (__shuffle8_ph 4 r1l{1} r5l{1}).
ecall {2} (__shuffle8_ph 4 r0l{1} r4l{1}).
wp; call (butterfly64x_eq 3); simplify.
wp; skip => &1 &2 [-> Hpre] z0R z1R z1L.
have A1: 3 * q + q <= 32767 by smt().
have A2: qinv16W16M z0R z1R.
 admit.
have A4: all (fun (k : int) => Iu16_sb 1 (R2C z1R).[k] (z1L.[k] * inFq 65536)) (iota_ 0 16).
 admit.
move: Hpre; rewrite !A1 !A2 !A4 => |> *.
have A12: 4 * q + q <= 32767 by smt().
have A22: qinv16W16M (z2u256 zetasp{2} 204) (z2u256 zetasp{2} 220).
 admit.
pose a4 := List.all _ _.
have A42: a4.
 admit.
move => |> *.
have A13: 5 * q + q <= 32767 by smt().
have A23: qinv16W16M (z2u256 zetasp{2} 236) (z2u256 zetasp{2} 252).
  admit.
pose a43 := List.all _ _.
have A43: a43.
 admit.
move => |> *.
have A14: 6 * q + q <= 32767 by smt().
have A24: qinv16W16M (z2u256 zetasp{2} 268) (z2u256 zetasp{2} 284).
 admit.
pose a44 := List.all _ _.
have A44: a44.
 admit.
move => |> *.
have A15: 7 * q + q <= 32767 by smt().
have A25: qinv16W16M (z2u256 zetasp{2} 300) (z2u256 zetasp{2} 316).
 admit.
pose a45 := List.all _ _.
have A45: a45.
 admit.
move => |> *.
have A16: 8 * q + q <= 32767 by smt().
have A26a: qinv16W16M (z2u256 zetasp{2} 332) (z2u256 zetasp{2} 348).
 admit.
have A26b: qinv16W16M (z2u256 zetasp{2} 364) (z2u256 zetasp{2} 380).
 admit.
pose a46a := List.all _ _.
have A46: a46a.
 admit.
pose a46b := List.all _ _.
have A46b: a46b.
 admit.
move => |> *.
have Hvx16: x16_spec 20159 (C2R jvx16).
 admit.
move => |> *.
by rewrite (P2RS rp{2}) (P2CS rp8{1}) /= !PUR_i //= !PUC_i //= -{2}iotaredE /= !P2R_i //= !P2C_i //=.
qed.


equiv _poly_ntt_eq:
 NTT_AVX.ntt ~Jkem_avx2.M._poly_ntt:
 r{1}=lift_array256 rp{2} /\ signed_bound_cxq rp{2} 0 256 2 ==>
 res{1}=lift_array256 res{2} /\
 pos_bound256_cxq res{2} 0 256 2.
proof.
proc.
conseq (_: I256u16_sb 2 rp{2} r{1} ==> I256u16_ub 2 rp{2} rp6{1} ).
  by move=> &1 &2; rewrite I256u16_sbE.
 by move => &1 &2 /= ???; rewrite -I256u16_ubE.
call __ntt_level1t6_eq.
by call __ntt_level0_eq.
qed.

