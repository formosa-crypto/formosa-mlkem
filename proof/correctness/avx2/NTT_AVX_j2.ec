require import AllCore List Int IntDiv Ring StdOrder.

from Jasmin require import JModel.

require import Array256 Array16.
require import WArray512.

require import NTT_AVX_Fq2.

(*
op c2r (c: W16.t Array16.t): W256.t = 
 get256 (WArray32.init16 (fun i=>c.[i])) 0.

op r2c (r: W256.t): W16.t Array16.t =
 Array16.init (fun i=> r \bits16 i).

lemma c2rK c:
 r2c (c2r c) = c.
proof.
rewrite /c2r /r2c.
apply Array16.all_eq_eq.
by rewrite /all_eq /get256_direct /= !initiE //= !pack2_bits8.
qed.

lemma r2cK r:
 c2r (r2c r) = r.
proof.
rewrite /c2r /r2c /=.
apply W256.all_eq_eq.
by rewrite /all_eq /get256_direct /= !initiE //= !pack2_bits8.
qed.

op p2c ['a] (p: 'a Array256.t) (i:int): 'a Array16.t =
 (pchunk p).[i].
op p2r (p: W16.t Array256.t) (i: int): W256.t =
 c2r (p2c p i).

lemma p2r2c p i:
 r2c (p2r p i) = p2c p i.
proof. by rewrite /p2r c2rK. qed.

op cs2p ['a] (l: ('a Array16.t) list): 'a Array256.t =
 punchunk (Array16.of_list witness l).

lemma p2cs ['a] (p: 'a Array256.t):
 p = cs2p (map (p2c p) (iotared 0 16)).
proof.
rewrite /cs2p -{1}pchunkK; congr.
by apply Array16.all_eq_eq; rewrite /all_eq /#.
qed.

op rs2p (l: W256.t list): W16.t Array256.t =
 cs2p (map r2c l).

lemma p2rl (p: W16.t Array256.t):
 p = rs2p (map (p2r p) (iotared 0 16)).
proof.
rewrite /rs2p /cs2p -{1}pchunkK; congr.
rewrite -map_comp /(\o).
have ->: (fun i=> r2c (p2r p i)) = p2c p.
 by rewrite fun_ext => x; rewrite p2r2c.
by apply Array16.all_eq_eq; rewrite /all_eq /#.
qed.

lemma p2rE (p: W16.t Array256.t) (i: int):
 0 <= i < 16 =>
 p2r p i
 = get256_direct (WArray512.init16 (fun i => p.[i])) (32*i).
proof.
move=> Hi.
rewrite /p2r /p2c /pchunk /c2r initiE //=.
rewrite get256E /get256_direct /=; congr.
apply W32u8.Pack.ext_eq => k Hk.
do ! (rewrite initiE 1:/# /=). 
smt().
qed.

op pUc ['a] (p: 'a Array256.t) (i:int) (x: 'a Array16.t) =
 punchunk (pchunk p).[i <- x].
op pUr (p: W16.t Array256.t) (i: int) (x: W256.t): W16.t Array256.t =
 pUc p i (r2c x).

lemma pUrE (p: W16.t Array256.t) i x:
 0 <= i < 16 =>
 pUr p i x =
 Array256.init
  (get16 (set256_direct (WArray512.init16 (fun i => p.[i])) (32*i) x)).
proof.
move=> Hi; rewrite /pUr /pUc /punchunk tP => j Hj.
rewrite !initiE 1..2:/# /=.
rewrite get_setE 1:// get16_set256E 1..2:/#.
case: (j %/ 16 = i) => E.
 rewrite -E ifT 1:/#.
 have ->: j - 16 * (j %/ 16) = j %% 16
  by smt(divz_eq).
 by rewrite /r2c initiE 1:/#.
rewrite ifF 1:/# /pchunk initiE 1:/# /=.
rewrite initiE 1:/# /=.
have ->: j %/ 16 * 16 + j %% 16 = j by smt(divz_eq).
by rewrite get16_init16 /#.
qed.



lemma p2c_i ['a] (cs: ('a Array16.t) list) k:
 0 <= k && k < 16 => size cs = 16 =>
 p2c (cs2p cs) k = (nth witness cs k).
proof.
move=> Hk Hcs.
by rewrite /cs2p /p2c punchunkK get_of_list //.
qed.

hint simplify p2c_i.

lemma p2r_i rs k:
 0 <= k && k < 16 => size rs = 16 =>
 p2r (rs2p rs) k = (nth witness rs k).
proof.
move=> Hk Hrs.
rewrite /rs2p /p2r p2c_i //; first by rewrite size_map.
by rewrite (nth_map witness) 1:/# r2cK.
qed.

hint simplify p2r_i.


(* "upd" is equivalent to "put", but intended to be evaluated *)
op upd ['a] (xs: 'a list) n x =
 with xs = "[]" => "[]"
 with xs = (::) y ys => if n=0 then x::ys else y::(upd ys (n-1) x).

lemma nth_upd ['a] (xs: 'a list) d k x i:
 0 <= k < size xs =>
 nth d (upd xs k x) i = if i=k then x else nth d xs i.
proof.
elim: xs k i => //=.
 smt().
move=> y ys IH k i Hk.
case: (i=k) => E.
 case: (k=0) => Ek.
  smt().
 by rewrite ifF 1:/# IH 1:/# ifT 1:/#.
case: (k=0) => Ek.
 smt().
case: (i=0) => Ei //.
by rewrite IH 1:/# ifF 1:/#.
qed.

lemma map_upd ['a 'b] (f: 'a -> 'b) xs k x:
 map f (upd xs k x) = upd (map f xs) k (f x).
proof.
elim: xs k => // y ys IH k /=.
case: (k=0) => E //.
by congr; apply IH.
qed.

lemma pUc_i ['a] cs k (x: 'a Array16.t):
 0 <= k < 16 => size cs = 16 =>
 pUc (cs2p cs) k x = cs2p (upd cs k x).
proof.
move=> Hk Hcs.
rewrite /xs2p /pUc /cs2p; congr.
rewrite tP => i Hi.
case: (i=k) => E.
 by rewrite set_eqiE // get_of_list // nth_upd 1:/# E.
by rewrite set_neqiE // punchunkK !get_of_list // nth_upd 1:/# E.
qed.

hint simplify pUc_i.


lemma pUr_i rs k x:
 0 <= k < 16 => size rs = 16 =>
 pUr (rs2p rs) k x = rs2p (upd rs k x).
proof.
move=> Hk Hrs.
rewrite /pUr /rs2p pUc_i //.
 by rewrite size_map.
by congr; rewrite map_upd.
qed.

hint simplify pUr_i.



(*
require import Array400 WArray32 WArray800 WArray512.

lemma wa32_xpd (a: WArray32.t):
 exists l,
  size l = 32 /\ a = WArray32.of_list l.
admitted.

lemma wa32_t b:
 (get256 ((init16 (fun (i : int) => W16.one)))%WArray32 0) = b.
pose a:= WArray32.init16 _.
have []:= (wa32_xpd a).
do 33! (move => [|?] //=).
move=> ->.
rewrite get256E /=.
rewrite init_of_list /= -iotaredE /WArray32.of_list /= initiE //=.
(* MAU!!! *)
abort.
*)
*)
(******* *)

require import Kyber.
import Zq.

require import Montgomery16.
require import Jkem_avx2 Jkem.

import IntOrder.

abbrev inFqW16 (w: W16.t) : Fq = inFq (W16.to_sint w).

(** Implementation relation (signed bounded) *)
op ImplW16_sbnd (bnd: int) (x: Fq) (y: W16.t) =
 x = inFqW16 y /\ sint_bnd (-bnd) bnd y.

(** Implementation relation (Montgomery form, signed bounded) *)
op ImplW16M_sbnd (bnd: int) (x: Fq) (y: W16.t) =
 x * inFq W16.modulus = inFqW16 y /\ sint_bnd (-bnd) bnd y.

(** Implementation relation over chunks *)
(*
abbrev Impl16W16 (x: Fq Array16.t) (y: W256.t) =
 x = map inFqW16 (r2c y).
(*
 forall i, 0 <= i < 16 =>
  x.[i] = inFqW16 (y \bits16 i)%JWord.W16u16.
*)
lemma Impl16W16P x y:
 Impl16W16 x y =>
 forall k,
 0 <= k < 16 => x.[k] = inFqW16 (r2c y).[k].
proof.
by move=> -> k Hk; rewrite mapiE //= /#.
qed.
*)
lemma R2C_pack16 f k:
 (R2C (W16u16.pack16_t f)).[k] = f.[k].
admitted.

op Impl16W16_ubnd (bnd:int) (x: Fq Array16.t) (y: W256.t) =
 x = map inFqW16 (R2C y)
 /\ all (sint_bnd 0 bnd) (R2C y).



op Impl16W16_sbnd (bnd:int) (x: Fq Array16.t) (y: W256.t) =
 x = map inFqW16 (R2C y)
 /\ all (sint_bnd (-bnd) bnd) (R2C y).

lemma Impl16W16_sbndP bnd  (x: Fq Array16.t) (y: JWord.W256.t):
 Impl16W16_sbnd bnd x y <=>
 forall k, 
 0 <= k < 16 =>
 ImplW16_sbnd bnd x.[k] (R2C y).[k].
proof.
split.
 move=> [-> /Array16.allP H2] k Hk.
 by rewrite mapiE //= /#.
move=> H; split.
 rewrite tP => i Hi /=.
 have [-> HH] := H i Hi.
 by rewrite mapiE //.
apply/Array16.allP => i Hi /=.
by have [_ ?] := H i Hi.
qed.

(** Implementation relation over chunks (Montgomery form) *)
op Impl16W16M_sbnd (bnd:int) (x: Fq Array16.t) (y: JWord.W256.t) =
 map (( *) (inFq W16.modulus)) x = map inFqW16 (R2C y)
 /\ all (sint_bnd (-bnd) bnd) (R2C y).

lemma Impl16W16M_sbndP bnd  (x: Fq Array16.t) (y: JWord.W256.t):
 Impl16W16M_sbnd bnd x y <=>
 forall k, 
 0 <= k < 16 =>
 ImplW16M_sbnd bnd x.[k] (R2C y).[k].
proof.
split.
 move=> /Impl16W16_sbndP H k Hk; move: (H k Hk) => {H} [H1 H2]; split.
  by rewrite -H1 mapiE 1://; ring.
 done.
move=> H.
apply/Impl16W16_sbndP => k Hk.
rewrite mapiE 1://.
by move: (H k Hk); rewrite /ImplW16M_sbnd /#.
qed.

lemma Impl16W16M_sbndPall bnd  (x: Fq Array16.t) (y: JWord.W256.t):
 Impl16W16M_sbnd bnd x y <=>
 all (fun k=> ImplW16M_sbnd bnd x.[k] (R2C y).[k]) (iotared 0 16).
admitted.


require import KyberPoly.
import KyberPoly.


op Impl256W16_sbnd (bnd:int) (x: Fq Array256.t) (y: W16.t Array256.t) =
 x = map inFqW16 y
 /\ all (sint_bnd (-bnd) bnd) y.

lemma Impl256W16_sbndP bnd (x: Fq Array256.t) y:
 Impl256W16_sbnd bnd x y <=>
 forall k, 0 <= k < 16 => Impl16W16_sbnd bnd (P2C x k) (P2R y k).
proof.
admit.
qed.

lemma Impl256W16_sbndPall bnd x y:
Impl256W16_sbnd bnd x y <=>
all (fun i=> Impl16W16_sbnd bnd (P2C x i) (P2R y i)) (iotared 0 16).
admitted.



lemma Impl256W16_sbndE nq (x: Fq Array256.t) y:
 Impl256W16_sbnd (nq * q) x y <=>
 x = lift_array256 y /\  signed_bound_cxq y 0 256 nq.
proof.
split.
 move=> [-> /Array256.allP H2] k Hk. 
 move: (H2 k Hk) => /=.
 admit (* MISMATCH BETWEEN sint_bnd e W16extra.b16: -bnd <= x "<" bnd*).
admit.
qed.

op Impl256W16_ubnd (bnd:int) (x: Fq Array256.t) (y: W16.t Array256.t) =
 x = map inFqW16 y
 /\ all (sint_bnd 0 bnd) y.

lemma Impl256W16_ubndP bnd (x: Fq Array256.t) y:
 Impl256W16_ubnd bnd x y <=>
 forall k, 0 <= k < 16 => Impl16W16_ubnd bnd (P2C x k) (P2R y k).
proof.
admit.
qed.

lemma Impl256W16_ubndPall bnd x y:
Impl256W16_ubnd bnd x y <=>
all (fun i=> Impl16W16_ubnd bnd (P2C x i) (P2R y i)) (iotared 0 16).
admitted.



lemma Impl256W16_ubndE nq (x: Fq Array256.t) y:
 Impl256W16_ubnd (nq * q) x y <=>
 x = lift_array256 y /\  pos_bound256_cxq y 0 256 nq.
proof.
split.
 move=> [-> /Array256.allP H2] k Hk. 
 move: (H2 k Hk) => /=.
 admit (* mismatch for bounds... *).
admit.
qed.


(*
 forall i, 0 <= i < 16 =>
  x.[i] * inFq W16.modulus = inFqW16 (y \bits16 i)%JWord.W16u16.
*)
(*
 forall i, 0 <= i < 16 =>
  x.[i] = inFqW16 (y \bits16 i)%JWord.W16u16 /\
  sint_bnd (y \bits16 i)%JWord.W16u16 (-bnd) bnd.
*)
(*
op ImplM16u16_qinv (x: Fq Array16.t) (y: JWord.W256.t) =
 forall i, 0 <= i < 16 =>
 x.[i] = inFqW16 (y \bits16 i)%JWord.W16u16 * inFq W16.modulus.
*)

op qinv16W16M (x y: JWord.W256.t) =
 forall i, 0 <= i < 16 =>
  (x \bits16 i)%JWord.W16u16
  = (y \bits16 i)%JWord.W16u16 * (W16.of_int 62209).

(* (r2c x).[i] = (r2c y).[i] * (W16.of_int 62209) *)
op x16_spec (n: int) (x: JWord.W256.t) =
 forall i, 0 <= i < 16 =>
  (x \bits16 i)%JWord.W16u16 = W16.of_int n.

(*
op vx16_spec (x: JWord.W256.t) =
 forall i, 0 <= i < 16 =>
  (x \bits16 i)%JWord.W16u16 = W16.of_int 20159.
*)

lemma x16_from_C2R n a:
 x16_spec n (C2R a) <=> all (fun i=>a.[i]=W16.of_int n) (iotared 0 16).
 admitted.

lemma nosmt REDCmul16Fq (x y: W16.t):
 sint_bnd (- q) (q) y =>
 inFqW16 (Montgomery16.REDCmul16 x y)
 = inFqW16 x * inFqW16 y * inFq Montgomery16.Rinv
 /\ sint_bnd (-q) (q) (Montgomery16.REDCmul16 x y).
proof.
move: (Montgomery16.REDCmul16_correct x y).
rewrite /Montgomery16.q /q /Montgomery16.Rinv.
move => H1 H2; move: (H1 H2) => {H1} {H2} [H1 H2].
split => //.
rewrite -(inFqM_mod (to_sint x)) -inFqM_mod /q modzMml -H1 /#.
qed.

lemma ImplW16_sbndD (b1 b2:int) x y rx ry:
 b1+b2 <= W16.max_sint =>
 ImplW16_sbnd b1 x rx =>
 ImplW16_sbnd b2 y ry =>
 ImplW16_sbnd (b1+b2) (x+y) (rx+ry).
proof.
move => H [-> Hx] [-> Hy]; split.
 rewrite addE /ulift2 /=.
 admit.
have E: -(b1+b2) = -b1 + -b2 by ring.
rewrite E; apply to_sintD_bnd => //.
rewrite -E. 
apply (ler_trans (-W16.max_sint)).
 smt().
by apply ler_opp2.
qed.

lemma butterflyD (bnd:int) xl xr z rxl rxr rzM rzMqinv rq:
 bnd + q <= W16.max_sint =>
 rq = W16.of_int q =>
 ImplW16_sbnd bnd xl rxl =>
 ImplW16_sbnd bnd xr rxr =>
 ImplW16M_sbnd q z rzM =>
 rzMqinv = rzM * (W16.of_int 62209) =>
 ImplW16_sbnd (bnd+q) (xl+z*xr)
 (wmulhs rzM rxr + rxl - wmulhs (rzMqinv * rxr) rq).
proof.
move => Hbnd Hq [-> Hxl] [-> Hxr] [HzM HzBnd] ->.
have ->: wmulhs rzM rxr + rxl - wmulhs (rzM * (of_int 62209)%W16 * rxr) rq
 = rxl + (wmulhs rzM rxr - wmulhs (rzM * (of_int 62209)%W16 * rxr) rq) by ring.
apply ImplW16_sbndD => //.
admit.
qed.

lemma R2C_map2 f x y k:
 (R2C (W16u16.map2 f x y)).[k] = f (R2C x).[k] (R2C y).[k].
admitted.

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

equiv butterfly64x_eq bnd:
 NTT_AVX.__butterfly64x ~ Jkem_avx2.M.__butterfly64x :
 bnd + q <= W16.max_sint /\
 Impl16W16_sbnd bnd rl0t{1} rl0{2} /\
 Impl16W16_sbnd bnd rl1t{1} rl1{2} /\
 Impl16W16_sbnd bnd rl2t{1} rl2{2} /\
 Impl16W16_sbnd bnd rl3t{1} rl3{2} /\
 Impl16W16_sbnd bnd rh0t{1} rh0{2} /\
 Impl16W16_sbnd bnd rh1t{1} rh1{2} /\
 Impl16W16_sbnd bnd rh2t{1} rh2{2} /\
 Impl16W16_sbnd bnd rh3t{1} rh3{2} /\
 qinv16W16M zl0{2} zh0{2} /\
 qinv16W16M zl1{2} zh1{2} /\
 Impl16W16M_sbnd q z0{1} zh0{2} /\
 Impl16W16M_sbnd q z1{1} zh1{2} /\
 x16_spec q qx16{2}
 ==>
 Impl16W16_sbnd (bnd+q) res{1}.`1 res{2}.`1 /\
 Impl16W16_sbnd (bnd+q) res{1}.`2 res{2}.`2 /\
 Impl16W16_sbnd (bnd+q) res{1}.`3 res{2}.`3 /\
 Impl16W16_sbnd (bnd+q) res{1}.`4 res{2}.`4 /\
 Impl16W16_sbnd (bnd+q) res{1}.`5 res{2}.`5 /\
 Impl16W16_sbnd (bnd+q) res{1}.`6 res{2}.`6 /\
 Impl16W16_sbnd (bnd+q) res{1}.`7 res{2}.`7 /\
 Impl16W16_sbnd (bnd+q) res{1}.`8 res{2}.`8.
proof.
proc; sp 1 0; simplify.
wp; skip => |> &1 &2 Hbnd H0 H1 H2 H3 H4 H5 H6 H7 Hqinv0 Hqinv1 Hq Hzl Hzh.
do 4! (split; first by apply butterfly16x_rE => // /#).
do 3! (split; first by apply butterfly16x_lE => //).
by apply butterfly16x_lE => //.
qed.

hoare __shuffle8_h _a _b:
 Jkem_avx2.M.__shuffle8:
 a = _a /\ b = _b ==>
 res = (C2R (shuffle8 (R2C _a) (R2C _b)).`1, C2R (shuffle8 (R2C _a) (R2C _b)).`2).
admitted.

lemma __shuffle8_ll: islossless Jkem_avx2.M.__shuffle8 by islossless.

phoare __shuffle8_spec _a _b:
 [ Jkem_avx2.M.__shuffle8:
   a = _a /\ b = _b ==>
    res = (C2R (shuffle8 (R2C _a) (R2C _b)).`1, C2R (shuffle8 (R2C _a) (R2C _b)).`2) ] = 1%r. 
admitted.

lemma Impl16W16_shuffle8 bnd a ra b rb:
 Impl16W16_sbnd bnd a ra =>
 Impl16W16_sbnd bnd b rb =>
 Impl16W16_sbnd bnd (shuffle8 a b).`1 (C2R (shuffle8 (R2C ra) (R2C rb)).`1)
 /\ Impl16W16_sbnd bnd (shuffle8 a b).`2 (C2R (shuffle8 (R2C ra) (R2C rb)).`2).
admitted.

hoare __shuffle4_h _a _b:
 Jkem_avx2.M.__shuffle4:
 a = _a /\ b = _b ==>
 res = (C2R (shuffle4 (R2C _a) (R2C _b)).`1, C2R (shuffle4 (R2C _a) (R2C _b)).`2).
admitted.

lemma __shuffle4_ll: islossless Jkem_avx2.M.__shuffle4 by islossless.

phoare __shuffle4_spec _a _b:
 [ Jkem_avx2.M.__shuffle4:
   a = _a /\ b = _b ==>
   res = (C2R (shuffle4 (R2C _a) (R2C _b)).`1, C2R (shuffle4 (R2C _a) (R2C _b)).`2) ] = 1%r
by conseq __shuffle4_ll (__shuffle4_h _a _b).

lemma Impl16W16_shuffle4 bnd a ra b rb:
 Impl16W16_sbnd bnd a ra =>
 Impl16W16_sbnd bnd b rb =>
 Impl16W16_sbnd bnd (shuffle4 a b).`1 (C2R (shuffle4 (R2C ra) (R2C rb)).`1)
 /\ Impl16W16_sbnd bnd (shuffle4 a b).`2 (C2R (shuffle4 (R2C ra) (R2C rb)).`2).
admitted.

hoare __shuffle2_h _a _b:
 Jkem_avx2.M.__shuffle2:
 a = _a /\ b = _b ==>
 res = (C2R (shuffle2 (R2C _a) (R2C _b)).`1, C2R (shuffle2 (R2C _a) (R2C _b)).`2).
admitted.

lemma __shuffle2_ll: islossless Jkem_avx2.M.__shuffle2 by islossless.

phoare __shuffle2_spec _a _b:
 [ Jkem_avx2.M.__shuffle2:
   a = _a /\ b = _b ==>
   res = (C2R (shuffle2 (R2C _a) (R2C _b)).`1, C2R (shuffle2 (R2C _a) (R2C _b)).`2) ] = 1%r
by conseq __shuffle2_ll (__shuffle2_h _a _b).

lemma Impl16W16_shuffle2 bnd a ra b rb:
 Impl16W16_sbnd bnd a ra =>
 Impl16W16_sbnd bnd b rb =>
 Impl16W16_sbnd bnd (shuffle2 a b).`1 (C2R (shuffle2 (R2C ra) (R2C rb)).`1)
 /\ Impl16W16_sbnd bnd (shuffle2 a b).`2 (C2R (shuffle2 (R2C ra) (R2C rb)).`2).
admitted.

hoare __shuffle1_h _a _b:
 Jkem_avx2.M.__shuffle1:
 a = _a /\ b = _b ==>
 res = (C2R (shuffle1 (R2C _a) (R2C _b)).`1, C2R (shuffle1 (R2C _a) (R2C _b)).`2).
admitted.

lemma __shuffle1_ll: islossless Jkem_avx2.M.__shuffle1 by islossless.

phoare __shuffle1_spec _a _b:
 [ Jkem_avx2.M.__shuffle1:
   a = _a /\ b = _b ==>
   res = (C2R (shuffle1 (R2C _a) (R2C _b)).`1, C2R (shuffle1 (R2C _a) (R2C _b)).`2) ] = 1%r
by conseq __shuffle1_ll (__shuffle1_h _a _b).

lemma Impl16W16_shuffle1 bnd a ra b rb:
 Impl16W16_sbnd bnd a ra =>
 Impl16W16_sbnd bnd b rb =>
 Impl16W16_sbnd bnd (shuffle1 a b).`1 (C2R (shuffle1 (R2C ra) (R2C rb)).`1)
 /\ Impl16W16_sbnd bnd (shuffle1 a b).`2 (C2R (shuffle1 (R2C ra) (R2C rb)).`2).
admitted.

(* ZETAS!!! *)
require import Array400 WArray800.
op z2u32 (a: W16.t Array400.t) (i: int): W32.t =
 get32_direct (WArray800.init16 (fun i => a.[i])) (2*i).

lemma z2u32E a k:
 z2u32 a k = W2u16.pack2 [a.[k]; a.[k+1]].
admitted.

op z2u256 (a: W16.t Array400.t) (i: int): W256.t =
 get256_direct (WArray800.init16 (fun i => a.[i])) (2*i).

lemma z2u256E a k:
 z2u256 a k = C2R (Array16.init (fun i => a.[k+i])).
admitted.


(*op x32 x = 32*x.
op p2r (a: W16.t Array256.t) (i: int): W256.t =
 get256_direct (WArray512.init16 (fun i => a.[i])) (32*i).
op pUr (a: W16.t Array256.t) (i: int) (x: W256.t): W16.t Array256.t =
 Array256.init
  (WArray512.get16 (WArray512.set256_direct (WArray512.init16 (fun i => a.[i])) (32*i) x)).
*)

(*

print nth.
lemma xxx (x1 x2 x3 x4 x:int): nth witness [x1; x2; x3; x4] 2 = x.
rewrite /=.
abort.


lemma xxx (x1 x2 x3 x4 y:int) x: upd [x1; x2; x3; x4] 2 y = x.
rewrite /=.
abort.

op rs2p (rs: W256.t list): W16.t Array256.t =
 punchunk (Array16.of_list witness (map r2c rs)).

lemma l2p_eq a:
 exists x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15,
  a = rs2p [x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15].
admitted.

lemma p2r_i rs k:
 0 <= k < 16 =>
 p2r (rs2p rs) k = (nth witness rs k).
admitted.

hint simplify p2r_i.

lemma xxx x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x:
 p2r (rs2p [x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15]) 12 = x.
rewrite /=.
abort.

lemma pUr_i rs k x:
 0 <= k < 16 =>
 pUr (rs2p rs) k x = rs2p (upd rs k x).
admitted.

hint simplify pUr_i.

op p2rs (p: W16.t Array256.t): W256.t list =
 map c2r (to_list (pchunk p)).

lemma p2rs_eq p:
 p = rs2p (map (p2r p) (iotared 0 16)).
admitted.

(*
lemma pUr_start p k x:
 0 <= k < 16 =>
 pUr p k x = l2p (upd (map (p2r p) (iotared 0 16)) k x).
by move=> *; rewrite {1}p2l_eq pUr_i.
qed.
*)

lemma xxx x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x y:
 pUr (rs2p [x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15]) 12 y = x.
rewrite /=.
abort.


(*
abbrev r2c (r: W256.t) (i: int): W16.t.
op rUc (r: W256.t) (i: int) (x: W16.t) : W256.t.
*)
*)

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

(*
op lift_array256 (p : W16.t Array256.t) : Fq Array256.t = map (fun (x : W16.t) => inFq (to_sint x)) p.
*)
(*
lemma pre_xpd rp1 rp2 k:
 rp1 = lift_array256 rp2
 /\ signed_bound_cxq rp2 0 256 k
 =>
 Impl16u16_sbnd (k*q) r0_1 r0_2
 /\ Impl16u16_sbnd (k*q) r1_1 r1_2
 *)

equiv __ntt_level0_eq:
 NTT_AVX.__ntt_level0 ~ Jkem_avx2.M.__ntt_level0:
 rp{1}=lift_array256 rp{2} /\
 signed_bound_cxq rp{2} 0 256 2
 ==>
 res{1}=lift_array256 res{2} /\
 signed_bound_cxq res{2} 0 256 3.
proof.
transitivity Tmp.__ntt_level0
 ( rp{1}=lift_array256 rp{2} /\
 signed_bound_cxq rp{2} 0 256 2 ==>
 res{1}=lift_array256 res{2} /\
 signed_bound_cxq res{2} 0 256 3 )
 ( ={rp} ==> ={res} );
  last by symmetry; conseq __ntt_level0_eq_.
  smt().
 done.
conseq (_: Impl256W16_sbnd (2*q) arg{1} arg{2} ==> Impl256W16_sbnd (2*q+q) res{1} res{2}); first 2 by smt(Impl256W16_sbndE).
proc; simplify.
(*
rp{1} = lift_array256 rp{2} /\ signed_bound_cxq rp{2} 0 256 2
*)
inline NTT_AVX.__ntt_level0.
(*
r0 <- (get256 ((init16 (fun (i : int) => rp.[i])))%WArray512.WArray512 0)%WArray512.WArray512
*)
seq 0 5: (#pre /\
 x16_spec q qx16{2} /\
 zeta0{2} = W16u16.pack16_t (W16u16.Pack.create (W16.of_int 31499)) /\
 zeta1{2} = W16u16.pack16_t (W16u16.Pack.create (W16.of_int 2571))).
 auto => &1 &2 ?; rewrite /= !z2u32E !initiE //= => |>.
 split; first by rewrite x16_from_C2R /q.
 split.
  rewrite /VPBROADCAST_8u32 -iotaredE /=; congr.
  by apply W16u16.Pack.all_eq_eq; rewrite /all_eq.
 rewrite /VPBROADCAST_8u32 -iotaredE /=; congr.
 by apply W16u16.Pack.all_eq_eq; rewrite /all_eq.
seq 3 8: (Impl16W16_sbnd (2*q) r0{1} r0{2} /\
          Impl16W16_sbnd (2*q) r1{1} r1{2} /\
          Impl16W16_sbnd (2*q) r2{1} r2{2} /\
          Impl16W16_sbnd (2*q) r3{1} r3{2} /\
          Impl16W16_sbnd (2*q) r4{1} r4{2} /\
          Impl16W16_sbnd (2*q) r5{1} r5{2} /\
          Impl16W16_sbnd (2*q) r6{1} r6{2} /\
          Impl16W16_sbnd (2*q) r7{1} r7{2} /\
          Impl16W16_sbnd (2*q) r0b{1} (P2R rp{2} 4) /\
          Impl16W16_sbnd (2*q) r1b{1} (P2R rp{2} 5) /\
          Impl16W16_sbnd (2*q) r2b{1} (P2R rp{2} 6) /\
          Impl16W16_sbnd (2*q) r3b{1} (P2R rp{2} 7) /\ 
          Impl16W16_sbnd (2*q) r4b{1} (P2R rp{2} 12) /\
          Impl16W16_sbnd (2*q) r5b{1} (P2R rp{2} 13) /\
          Impl16W16_sbnd (2*q) r6b{1} (P2R rp{2} 14) /\
          Impl16W16_sbnd (2*q) r7b{1} (P2R rp{2} 15) /\ 
          Impl16W16M_sbnd q zeta1{1} zeta1{2} /\
          qinv16W16M zeta0{2} zeta1{2} /\
          x16_spec q qx16{2}).
 conseq |>.
 wp; skip => |> &1 &2 /Impl256W16_sbndPall /= |> *.
 split.
  rewrite Impl16W16M_sbndP => k Hk.
  by rewrite R2C_pack16 !initiE //= /ImplW16M_sbnd W16.of_sintK -inFqM_mod /q.
 by move => k Hk; rewrite !pack16bE // !initiE //= /#.
(* alternativa:
 have L: forall a b, qinv16W16M a b = all (fun i=>(R2C a).[i]=(R2C b).[i]*W16.of_int 62209) (iotared 0 16). admit.
 by rewrite L /= R2C_pack16 !initiE //=.
*)
seq 1 1: (Impl16W16_sbnd (2*q+q) r0a{1} r0{2} /\
          Impl16W16_sbnd (2*q+q) r1a{1} r1{2} /\
          Impl16W16_sbnd (2*q+q) r2a{1} r2{2} /\
          Impl16W16_sbnd (2*q+q) r3a{1} r3{2} /\
          Impl16W16_sbnd (2*q+q) r4a{1} r4{2} /\
          Impl16W16_sbnd (2*q+q) r5a{1} r5{2} /\
          Impl16W16_sbnd (2*q+q) r6a{1} r6{2} /\
          Impl16W16_sbnd (2*q+q) r7a{1} r7{2} /\ #[/9:]pre).
 wp; call (butterfly64x_eq (2*q)).
 by auto => |> * /#.
seq 0 16: (Impl16W16_sbnd (2*q) r0b{1} r0{2} /\
           Impl16W16_sbnd (2*q) r1b{1} r1{2} /\
           Impl16W16_sbnd (2*q) r2b{1} r2{2} /\
           Impl16W16_sbnd (2*q) r3b{1} r3{2} /\ 
           Impl16W16_sbnd (2*q) r4b{1} r4{2} /\
           Impl16W16_sbnd (2*q) r5b{1} r5{2} /\
           Impl16W16_sbnd (2*q) r6b{1} r6{2} /\
           Impl16W16_sbnd (2*q) r7b{1} r7{2} /\ 
           Impl16W16_sbnd (2*q+q) r0a{1} (P2R rp{2} 0) /\
           Impl16W16_sbnd (2*q+q) r1a{1} (P2R rp{2} 1) /\
           Impl16W16_sbnd (2*q+q) r2a{1} (P2R rp{2} 2) /\
           Impl16W16_sbnd (2*q+q) r3a{1} (P2R rp{2} 3) /\
           Impl16W16_sbnd (2*q+q) r4a{1} (P2R rp{2} 8) /\
           Impl16W16_sbnd (2*q+q) r5a{1} (P2R rp{2} 9) /\
           Impl16W16_sbnd (2*q+q) r6a{1} (P2R rp{2} 10) /\
           Impl16W16_sbnd (2*q+q) r7a{1} (P2R rp{2} 11) /\
           #[/-3:]pre).
 auto => |> &1 &2 *.
 by rewrite (P2RS rp{2}) /= !PUR_i //= !P2R_i //=.
seq 1 1 : (Impl16W16_sbnd (2*q+q) r0c{1} r0{2} /\
           Impl16W16_sbnd (2*q+q) r1c{1} r1{2} /\
           Impl16W16_sbnd (2*q+q) r2c{1} r2{2} /\
           Impl16W16_sbnd (2*q+q) r3c{1} r3{2} /\ 
           Impl16W16_sbnd (2*q+q) r4c{1} r4{2} /\
           Impl16W16_sbnd (2*q+q) r5c{1} r5{2} /\
           Impl16W16_sbnd (2*q+q) r6c{1} r6{2} /\
           Impl16W16_sbnd (2*q+q) r7c{1} r7{2} /\
           #[/9:]pre).
 wp; call (butterfly64x_eq (2*q)) => />.
 by auto => /#.
auto => |> &1 &2 *.
rewrite (P2RS rp{2}) /= !PUR_i //=.
apply/Impl256W16_sbndPall => /=.
by rewrite !P2C_i //= !P2R_i //=.
qed.

equiv __ntt_level1t6_eq:
 NTT_AVX.__ntt_level1t6 ~ Jkem_avx2.M.__ntt_level1t6:
 rp{1}=lift_array256 rp{2} /\
 signed_bound_cxq rp{2} 0 256 3
 ==>
 res{1}=lift_array256 res{2} /\
 pos_bound256_cxq res{2} 0 256 2.
proof.
transitivity Tmp.__ntt_level1t6
 ( rp{1}=lift_array256 rp{2} /\
   signed_bound_cxq rp{2} 0 256 3 ==>
   res{1}=lift_array256 res{2} /\
   pos_bound256_cxq res{2} 0 256 2 )
 ( ={rp} ==> ={res} );
  last by symmetry; conseq __ntt_level1t6_eq_.
  smt().
 done.
conseq (_: Impl256W16_sbnd (3*q) arg{1} arg{2} ==> Impl256W16_ubnd (2*q) res{1} res{2}).
  smt(Impl256W16_sbndE).
 smt(Impl256W16_ubndE).
proc; simplify.
unroll {2} 5; rcondt {2} 5.
 by move=> &m; wp;skip => /=.
seq 9 14: (i{2}=0 /\ zetasp{2} = jzetas_exp /\ 
  x16_spec q qx16{2} /\
  Impl16W16_sbnd (3*q) (P2C rp{1} 8) (P2R rp{2} 8) /\
  Impl16W16_sbnd (3*q) (P2C rp{1} 9) (P2R rp{2} 9) /\
  Impl16W16_sbnd (3*q) (P2C rp{1} 10) (P2R rp{2} 10) /\
  Impl16W16_sbnd (3*q) (P2C rp{1} 11) (P2R rp{2} 11) /\
  Impl16W16_sbnd (3*q) (P2C rp{1} 12) (P2R rp{2} 12) /\
  Impl16W16_sbnd (3*q) (P2C rp{1} 13) (P2R rp{2} 13) /\
  Impl16W16_sbnd (3*q) (P2C rp{1} 14) (P2R rp{2} 14) /\
  Impl16W16_sbnd (3*q) (P2C rp{1} 15) (P2R rp{2} 15) /\
  Impl16W16M_sbnd q zeta1{1} zeta1{2} /\
  qinv16W16M zeta0{2} zeta1{2} /\
  Impl16W16_sbnd (3*q) r0{1} r0{2} /\
  Impl16W16_sbnd (3*q) r1{1} r1{2} /\
  Impl16W16_sbnd (3*q) r2{1} r2{2} /\
  Impl16W16_sbnd (3*q) r3{1} r3{2} /\
  Impl16W16_sbnd (3*q) r4{1} r4{2} /\
  Impl16W16_sbnd (3*q) r5{1} r5{2} /\
  Impl16W16_sbnd (3*q) r6{1} r6{2} /\
  Impl16W16_sbnd (3*q) r7{1} r7{2}).
 wp; skip => &1 &2 |> H; rewrite !z2u32E !initiE //=. 
 move:H; rewrite Impl256W16_sbndPall /= => |> *.
 split; first by rewrite x16_from_C2R /q.
 split.
  by rewrite Impl16W16M_sbndPall /VPBROADCAST_8u32 -iotaredE /=
          R2C_pack16 !initiE //= /ImplW16M_sbnd W16.of_sintK -inFqM_mod /q.
 move => k Hk. 
  rewrite /VPBROADCAST_8u32 -iotaredE /= !pack16bE //=.
 rewrite !initiE //=.
  by apply W16u16.Pack.all_eq_eq; rewrite /all_eq.
  
seq 1 1 : (#[/:13]pre /\
  Impl16W16_sbnd (3*q+q) r0a{1} r0{2} /\
  Impl16W16_sbnd (3*q+q) r1a{1} r1{2} /\
  Impl16W16_sbnd (3*q+q) r2a{1} r2{2} /\
  Impl16W16_sbnd (3*q+q) r3a{1} r3{2} /\
  Impl16W16_sbnd (3*q+q) r4a{1} r4{2} /\
  Impl16W16_sbnd (3*q+q) r5a{1} r5{2} /\
  Impl16W16_sbnd (3*q+q) r6a{1} r6{2} /\
  Impl16W16_sbnd (3*q+q) r7a{1} r7{2}).
 by call (butterfly64x_eq (3*q)); skip => |> /= /#.
seq 5 6: (#[/:11]pre /\
  Impl16W16M_sbnd q zeta1b{1} zeta1{2} /\
  qinv16W16M zeta0{2} zeta1{2} /\
  Impl16W16_sbnd (3*q+q) r0b{1} r0{2} /\
  Impl16W16_sbnd (3*q+q) r1b{1} r1{2} /\
  Impl16W16_sbnd (3*q+q) r2b{1} r2{2} /\
  Impl16W16_sbnd (3*q+q) r3b{1} r3{2} /\
  Impl16W16_sbnd (3*q+q) r4b{1} r4{2} /\
  Impl16W16_sbnd (3*q+q) r5b{1} r5{2} /\
  Impl16W16_sbnd (3*q+q) r6b{1} r6{2} /\
  Impl16W16_sbnd (3*q+q) r7b{1} r7{2}).
 ecall {2} (__shuffle8_spec r3{2} r7{2}).
 ecall {2} (__shuffle8_spec r2{2} r6{2}).
 ecall {2} (__shuffle8_spec r1{2} r5{2}).
 ecall {2} (__shuffle8_spec r0{2} r4{2}).
 wp; skip => |> *.
 split.
search z2u256.
  rewrite z2u256.
  admit.
 split.
  admit.
 smt(Impl16W16_shuffle8).
seq 1 1 : (#[/:13]pre /\
  Impl16W16_sbnd (3*q+q+q) r0c{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q) r1c{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q) r2c{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q) r3c{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q) r4c{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q) r5c{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q) r6c{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q) r7c{1} r7{2}).
 by call (butterfly64x_eq (3*q+q)); skip => |> /= /#.
seq 5 6: (#[/:11]pre /\
  Impl16W16M_sbnd q zeta1d{1} zeta1{2} /\
  qinv16W16M zeta0{2} zeta1{2} /\
  Impl16W16_sbnd (3*q+q+q) r0d{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q) r1d{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q) r2d{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q) r3d{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q) r4d{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q) r5d{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q) r6d{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q) r7d{1} r7{2}).
 ecall {2} (__shuffle4_spec r5{2} r7{2}).
 ecall {2} (__shuffle4_spec r1{2} r3{2}).
 ecall {2} (__shuffle4_spec r4{2} r6{2}).
 ecall {2} (__shuffle4_spec r0{2} r2{2}).
 wp; skip => |> *.
 admit.
seq 1 1 : (#[/:13]pre /\
  Impl16W16_sbnd (3*q+q+q+q) r0e{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r1e{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r2e{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r3e{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r4e{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r5e{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r6e{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r7e{1} r7{2}).
 by call (butterfly64x_eq (3*q+q+q)); skip => |> /= /#.
seq 5 6: (#[/:11]pre /\
  Impl16W16M_sbnd q zeta1f{1} zeta1{2} /\
  qinv16W16M zeta0{2} zeta1{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r0f{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r1f{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r2f{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r3f{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r4f{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r5f{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r6f{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r7f{1} r7{2}).
 ecall {2} (__shuffle2_spec r6{2} r7{2}).
 ecall {2} (__shuffle2_spec r4{2} r5{2}).
 ecall {2} (__shuffle2_spec r2{2} r3{2}).
 ecall {2} (__shuffle2_spec r0{2} r1{2}).
 wp; skip => |> *.
 admit.
seq 1 1 : (#[/:13]pre /\
  Impl16W16_sbnd (3*q+q+q+q+q) r0g{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r1g{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r2g{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r3g{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r4g{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r5g{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r6g{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r7g{1} r7{2}).
 by call (butterfly64x_eq (3*q+q+q+q)); skip => |> /= /#.
seq 5 6: (#[/:11]pre /\
  Impl16W16M_sbnd q zeta1h{1} zeta1{2} /\
  qinv16W16M zeta0{2} zeta1{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r0h{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r1h{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r2h{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r3h{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r4h{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r5h{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r6h{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r7h{1} r7{2}).
 ecall {2} (__shuffle1_spec r3{2} r7{2}).
 ecall {2} (__shuffle1_spec r2{2} r6{2}).
 ecall {2} (__shuffle1_spec r1{2} r5{2}).
 ecall {2} (__shuffle1_spec r0{2} r4{2}).
 wp; skip => |> *.
 admit.
seq 1 1 : (#[/:13]pre /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r0i{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r1i{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r2i{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r3i{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r4i{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r5i{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r6i{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r7i{1} r7{2}).
 by call (butterfly64x_eq (3*q+q+q+q+q)); skip => |> /= /#.
seq 2 4: (#[/:11]pre /\
  Impl16W16M_sbnd q zeta2i{1} zeta2{2} /\
  qinv16W16M zeta0{2} zeta2{2} /\
  Impl16W16M_sbnd q zeta3i{1} zeta3{2} /\
  qinv16W16M zeta1{2} zeta3{2} /\ #[/-8:]pre).
 admit.
seq 1 2: (#[/:13]pre /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r0j{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r1j{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r2j{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r3j{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r4j{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r5j{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r6j{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r7j{1} r7{2} /\
  vx16_spec vx16{2}).
 wp; call (butterfly64x_eq (3*q+q+q+q+q+q)).
 skip => |> /= *.
 progress.
  smt().
 admit (*vx16_spec (C2R jvx16)*).
seq 0 8: (#[/:11]pre /\
  Impl16W16_ubnd (2*q) r0j{1} r0{2} /\
  Impl16W16_ubnd (2*q) r1j{1} r1{2} /\
  Impl16W16_ubnd (2*q) r2j{1} r2{2} /\
  Impl16W16_ubnd (2*q) r3j{1} r3{2} /\
  Impl16W16_ubnd (2*q) r4j{1} r4{2} /\
  Impl16W16_ubnd (2*q) r5j{1} r5{2} /\
  Impl16W16_ubnd (2*q) r6j{1} r6{2} /\
  Impl16W16_ubnd (2*q) r7j{1} r7{2}).
 admit (* red16x *).
seq 8 9: (i{2}=1 /\ #[/2,3]pre /\
  Impl16W16_ubnd (2*q) (P2C rp8{1} 0) (P2R rp{2} 0) /\
  Impl16W16_ubnd (2*q) (P2C rp8{1} 1) (P2R rp{2} 1) /\
  Impl16W16_ubnd (2*q) (P2C rp8{1} 2) (P2R rp{2} 2) /\
  Impl16W16_ubnd (2*q) (P2C rp8{1} 3) (P2R rp{2} 3) /\
  Impl16W16_ubnd (2*q) (P2C rp8{1} 4) (P2R rp{2} 4) /\
  Impl16W16_ubnd (2*q) (P2C rp8{1} 5) (P2R rp{2} 5) /\
  Impl16W16_ubnd (2*q) (P2C rp8{1} 6) (P2R rp{2} 6) /\
  Impl16W16_ubnd (2*q) (P2C rp8{1} 7) (P2R rp{2} 7) /\
  #[/4:11]pre).
 wp; skip => |> &1 &2 *.
 by rewrite (P2CS rp{1}) /= !PUC_i //= !P2C_i //= (P2RS rp{2}) /= !PUR_i //= !P2R_i //=.
unroll {2} 1; rcondt {2} 1; first by move=> &m; auto.
seq 9 10: (#[/:11]pre /\
  qinv16W16M zeta0{2} zeta1{2} /\  
  Impl16W16M_sbnd q zeta1k{1} zeta1{2} /\
  Impl16W16_sbnd (3*q) r0k{1} r0{2} /\
  Impl16W16_sbnd (3*q) r1k{1} r1{2} /\
  Impl16W16_sbnd (3*q) r2k{1} r2{2} /\
  Impl16W16_sbnd (3*q) r3k{1} r3{2} /\
  Impl16W16_sbnd (3*q) r4k{1} r4{2} /\
  Impl16W16_sbnd (3*q) r5k{1} r5{2} /\
  Impl16W16_sbnd (3*q) r6k{1} r6{2} /\
  Impl16W16_sbnd (3*q) r7k{1} r7{2}).
 admit.
seq 1 1: (#[/:11]pre /\
  Impl16W16_sbnd (3*q+q) r0l{1} r0{2} /\
  Impl16W16_sbnd (3*q+q) r1l{1} r1{2} /\
  Impl16W16_sbnd (3*q+q) r2l{1} r2{2} /\
  Impl16W16_sbnd (3*q+q) r3l{1} r3{2} /\
  Impl16W16_sbnd (3*q+q) r4l{1} r4{2} /\
  Impl16W16_sbnd (3*q+q) r5l{1} r5{2} /\
  Impl16W16_sbnd (3*q+q) r6l{1} r6{2} /\
  Impl16W16_sbnd (3*q+q) r7l{1} r7{2}).
 by call (butterfly64x_eq (3*q)); skip => |> /= /#.
seq 5 6: (#[/:11]pre /\
  qinv16W16M zeta0{2} zeta1{2} /\  
  Impl16W16M_sbnd q zeta1m{1} zeta1{2} /\
  Impl16W16_sbnd (3*q+q) r0m{1} r0{2} /\
  Impl16W16_sbnd (3*q+q) r1m{1} r1{2} /\
  Impl16W16_sbnd (3*q+q) r2m{1} r2{2} /\
  Impl16W16_sbnd (3*q+q) r3m{1} r3{2} /\
  Impl16W16_sbnd (3*q+q) r4m{1} r4{2} /\
  Impl16W16_sbnd (3*q+q) r5m{1} r5{2} /\
  Impl16W16_sbnd (3*q+q) r6m{1} r6{2} /\
  Impl16W16_sbnd (3*q+q) r7m{1} r7{2}).
 ecall {2} (__shuffle8_spec r3{2} r7{2}).
 ecall {2} (__shuffle8_spec r2{2} r6{2}).
 ecall {2} (__shuffle8_spec r1{2} r5{2}).
 ecall {2} (__shuffle8_spec r0{2} r4{2}).
 wp; skip => |> *.
 admit.
seq 1 1: (#[/:11]pre /\
  Impl16W16_sbnd (3*q+q+q) r0n{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q) r1n{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q) r2n{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q) r3n{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q) r4n{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q) r5n{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q) r6n{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q) r7n{1} r7{2}).
 by call (butterfly64x_eq (3*q+q)); skip => |> /= /#.
seq 5 6: (#[/:11]pre /\
  qinv16W16M zeta0{2} zeta1{2} /\  
  Impl16W16M_sbnd q zeta1o{1} zeta1{2} /\
  Impl16W16_sbnd (3*q+q+q) r0o{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q) r1o{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q) r2o{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q) r3o{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q) r4o{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q) r5o{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q) r6o{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q) r7o{1} r7{2}).
 ecall {2} (__shuffle4_spec r5{2} r7{2}).
 ecall {2} (__shuffle4_spec r1{2} r3{2}).
 ecall {2} (__shuffle4_spec r4{2} r6{2}).
 ecall {2} (__shuffle4_spec r0{2} r2{2}).
 wp; skip => |> *.
 admit.
seq 1 1: (#[/:11]pre /\
  Impl16W16_sbnd (3*q+q+q+q) r0p{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r1p{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r2p{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r3p{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r4p{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r5p{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r6p{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r7p{1} r7{2}).
 by call (butterfly64x_eq (3*q+q+q)); skip => |> /= /#.
seq 5 6: (#[/:11]pre /\
  qinv16W16M zeta0{2} zeta1{2} /\  
  Impl16W16M_sbnd q zeta1q{1} zeta1{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r0q{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r1q{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r2q{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r3q{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r4q{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r5q{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r6q{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q) r7q{1} r7{2}).
 ecall {2} (__shuffle2_spec r6{2} r7{2}).
 ecall {2} (__shuffle2_spec r4{2} r5{2}).
 ecall {2} (__shuffle2_spec r2{2} r3{2}).
 ecall {2} (__shuffle2_spec r0{2} r1{2}).
 wp; skip => |> *.
 admit.
seq 1 1: (#[/:11]pre /\
  Impl16W16_sbnd (3*q+q+q+q+q) r0r{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r1r{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r2r{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r3r{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r4r{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r5r{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r6r{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r7r{1} r7{2}).
 by call (butterfly64x_eq (3*q+q+q+q)); skip => |> /= /#.
seq 5 6: (#[/:11]pre /\
  qinv16W16M zeta0{2} zeta1{2} /\  
  Impl16W16M_sbnd q zeta1s{1} zeta1{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r0s{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r1s{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r2s{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r3s{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r4s{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r5s{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r6s{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q) r7s{1} r7{2}).
 ecall {2} (__shuffle1_spec r3{2} r7{2}).
 ecall {2} (__shuffle1_spec r2{2} r6{2}).
 ecall {2} (__shuffle1_spec r1{2} r5{2}).
 ecall {2} (__shuffle1_spec r0{2} r4{2}).
 wp; skip => |> *.
 admit.
seq 1 1: (#[/:11]pre /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r0t{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r1t{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r2t{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r3t{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r4t{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r5t{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r6t{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q) r7t{1} r7{2}).
 by call (butterfly64x_eq (3*q+q+q+q+q)); skip => |> /= /#.
seq 2 4: (#[/:11]pre /\ #[/-8:]pre /\
  qinv16W16M zeta0{2} zeta2{2} /\  
  Impl16W16M_sbnd q zeta2t{1} zeta2{2} /\
  qinv16W16M zeta1{2} zeta2{2} /\  
  Impl16W16M_sbnd q zeta3t{1} zeta3{2}).
 admit.
seq 1 2: (#[/:11]pre /\ vx16_spec vx16{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r0u{1} r0{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r1u{1} r1{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r2u{1} r2{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r3u{1} r3{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r4u{1} r4{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r5u{1} r5{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r6u{1} r6{2} /\
  Impl16W16_sbnd (3*q+q+q+q+q+q+q) r7u{1} r7{2}).
 wp; call (butterfly64x_eq (3*q+q+q+q+q*q)).
 auto => |> *.
 admit.
seq 0 8: (#[/:11]pre /\
  Impl16W16_ubnd (2*q) r0u{1} r0{2} /\
  Impl16W16_ubnd (2*q) r1u{1} r1{2} /\
  Impl16W16_ubnd (2*q) r2u{1} r2{2} /\
  Impl16W16_ubnd (2*q) r3u{1} r3{2} /\
  Impl16W16_ubnd (2*q) r4u{1} r4{2} /\
  Impl16W16_ubnd (2*q) r5u{1} r5{2} /\
  Impl16W16_ubnd (2*q) r6u{1} r6{2} /\
  Impl16W16_ubnd (2*q) r7u{1} r7{2}).
 admit (* red16x *).
seq 8 9: ( i{2} = 2 /\ Impl256W16_ubnd (2*q) rp16{1} rp{2} ).
(*
  Impl16W16_ubnd (2*q) (P2C rp16{1} 0) (P2R rp{2} 0) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 1) (P2R rp{2} 1) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 2) (P2R rp{2} 2) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 3) (P2R rp{2} 3) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 4) (P2R rp{2} 4) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 5) (P2R rp{2} 5) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 6) (P2R rp{2} 6) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 7) (P2R rp{2} 7) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 8) (P2R rp{2} 8) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 9) (P2R rp{2} 9) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 10) (P2R rp{2} 10) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 11) (P2R rp{2} 11) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 12) (P2R rp{2} 12) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 13) (P2R rp{2} 13) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 14) (P2R rp{2} 14) /\
  Impl16W16_ubnd (2*q) (P2C rp16{1} 15) (P2R rp{2} 15)).*)
 wp; skip => |> &1 &2 *.
 rewrite (P2CS rp8{1}) /= !PUC_i //= ?P2C_i //= (P2RS rp{2}) /= !PUR_i //= ?P2R_i //=.
 by rewrite Impl256W16_ubndPall /= !P2C_i //= !P2R_i //=.
rcondf {2} 1; first by move=> &m; auto.
by skip => |>.
qed.




equiv _poly_ntt_eq:
 NTT_AVX.ntt ~Jkem_avx2.M._poly_ntt:
 r{1}=lift_array256 rp{2} /\ signed_bound_cxq rp{2} 0 256 2 ==>
 res{1}=lift_array256 res{2} /\
 pos_bound256_cxq res{2} 0 256 2.
proof.
proc; simplify.
call __ntt_level1t6_eq.
by call __ntt_level0_eq.
qed.
























(*
r0 <- (get256 ((init16 (fun (i : int) => rp.[i])))%WArray512.WArray512 0)%WArray512.WArray512
*)

proc; simplify.
admit.
qed.


lemma wa32_xpd (a: WArray32.t):
 exists l,
  size l = 32 /\ a = WArray32.of_list l.
admitted.

print iotared.
lemma wa32_xpd2 (a: WArray32.t):
  a = WArray32.of_list (map (fun i=>a.[i]) (iotared 0 32)).
admitted.

lemma wa32_t b:
 (get256 ((init16 (fun (i : int) => jqx16.[i])))%WArray32 0) = b.
pose a:= WArray32.init16 _.
have []:= (wa32_xpd a).
do 33! (move => [|?] //=); last smt(size_ge0).
move=> ->.
rewrite get256E.
rewrite init_of_list /= -iotaredE /WArray32.of_list /= initiE //=.
abort.

lemma wa32_t2 b:
 (get256 ((init16 (fun (i : int) => jqx16.[i])))%WArray32 0) = b.
pose a:= WArray32.init16 _.
have /= ->:= (wa32_xpd2 a).
rewrite get256E.
rewrite init_of_list /= -iotaredE /WArray32.of_list /= initiE //=.
abort.

lemma wa800_xpd (a: WArray800.t):
 exists l,
  size l = 800 /\ a = WArray800.of_list l.
admitted.

lemma wa800_xpd2 (a: WArray800.t):
 a = WArray800.of_list (map (fun i=>a.[i]) (iotared 0 800)).
proof.
rewrite iotaredE tP => i Hi.
by rewrite -init_of_list initiE.
qed.

lemma wa800_t b:
 (get256 ((init16 (fun (i : int) => jzetas_exp.[i])))%WArray800 0) = b.
pose a:= WArray800.init16 _.
have []:= (wa800_xpd a).
time do 801! (move => [//|?]); last smt(size_ge0).
move=> ->.
rewrite get256E
 init_of_list /= -iotaredE /WArray800.of_list /= initiE //=.
abort.

lemma wa800_t2 b:
 (get256 ((init16 (fun (i : int) => jzetas_exp.[i])))%WArray800 6) = b.
pose a:= WArray800.init16 _.
time have /= ->:= (wa800_xpd2 a).
rewrite get256E
 init_of_list /= -iotaredE /WArray800.of_list /= !initiE //=.
(*rewrite /(\bits8) /=.*)
abort.


(*
print W16u16.pack16_t.
lemma xxx512 k (a: W16.t Array256.t):
 WArray512.WArray512.get256_direct (WArray512.WArray512.init16 (fun i => a.[i])) k
 = W16u16.pack16_t (W16u16.Pack.init (fun i => a.[k+i])).
admitted.

lemma xxx32 (a: W16.t Array16.t):
 WArray32.WArray32.get256_direct (WArray32.WArray32.init16 (fun i => a.[i])) 0
 = W16u16.pack16_t (W16u16.Pack.init (fun i => a.[i])).
admitted.

lemma fill16 (a: W16.t Array256.t) x k:
Array256.init
       (fun i =>                                  (WArray512.WArray512.get16 (WArray512.WArray512.set256 (WArray512.WArray512.init16 (fun i0 => a.[i0])) k x) i))
= Array256.fill (fun i => x \bits16 i) (k*16) 16 a.
admitted.

require import WArray512.
lemma set_get_def (v : W16.t Array256.t) (w: W256.t) i j :
    0 <= i < 16 => 0 <= j < 256 =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16)
      else v.[j].
admitted.

lemma set_get_eq (v: W16.t Array256.t) (w: W256.t) i j:
    0 <= i < 16 => 0 <= j < 256 => 16 * i <= j < 16 * i + 16 =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      w \bits16 j %% 16.
proof. 
  by move => h1 h2 h3; rewrite set_get_def // h3.
qed.

lemma set_get_diff (v: W16.t Array256.t) (w: W256.t) i j:
    0 <= i < 16 => 0 <= j < 256 => !(16 * i <= j < 16 * i + 16) =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      v.[j].
proof.
  move => h1 h2 h3; rewrite set_get_def // h3. auto.
qed.

lemma get_set_get_eqb (v: W16.t Array256.t) (w: W256.t) i:
  0 <= i < 16 => forall k, 0 <= k < i*16 =>
  v.[k] = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof. 
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i. smt().
  simplify.
  rewrite set_get_def => /#.
qed.

lemma get_set_get_eqa (v: W16.t Array256.t) (w: W256.t) i:
  0 <= i < 16 => forall k, i*16 + 16 <= k < 256 =>
  v.[k] = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof.
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i => /#.
  simplify.
  rewrite set_get_def => /#.
qed.

lemma get_set_get_diff (v: W16.t Array256.t) (w: vt16u16) i:
  0 <= i < 16 => forall k, i*16 <= k < i*16 + 16 =>
  w \bits16 (k%%16) = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof. 
  move => i_i k k_i.
  rewrite Array256.initiE.
  move : i_i k_i => /#.
  simplify.
  rewrite set_get_def => /#.
qed.
(*
rp <- Array256.init
       (fun i =>                                  (WArray512.WArray512.get16 (WArray512.WArray512.set256 (WArray512.WArray512.init16 (fun (i0 : int) => rp.[i0]) 15 r7) i))).
*)
*)

print Array256.sub.
op p2a ['a] (x: 'a Array256.t) (i: int): 'a Array16.t.

print c2r.
 


(*
proc __butterfly64x(rs : arrays8, z0 z1 z2 z3 : Fq Array16.t) : arrays8 = {


XXXXX

  proc __butterfly64x(rl0 : JWord.W256.t, rl1 : JWord.W256.t, rl2 : JWord.W256.t, rl3 : JWord.W256.t, rh0 : JWord.W256.t, rh1 : JWord.W256.t, rh2 : JWord.W256.t, rh3 : JWord.W256.t, zl0 : JWord.W256.t, zl1 : JWord.W256.t, zh0 : JWord.W256.t, zh1 : JWord.W256.t, qx16 : JWord.W256.t) :
    JWord.W256.t * JWord.W256.t * JWord.W256.t * JWord.W256.t * JWord.W256.t * JWord.W256.t * JWord.W256.t *
    JWord.W256.t = {

  proc __ntt_level0(rp : JWord.W16.t Array256.t) : JWord.W16.t Array256.t = {

  proc __ntt_level1t6(rp : JWord.W16.t Array256.t) : JWord.W16.t Array256.t = {


zeta0 <-
        (get256_direct ((init16 (fun (i_0 : int) => zetasp.[i_0])))%WArray800.WArray800 (208 + 392 * i))%WArray800.WArray800;

(r0, r4) <@ Jkem_avx2.M.__shuffle1(r0, r4);

Jkem_avx2.M.__butterfly64x(r0, r4, r2, r6, r1, r5, r3, r7, zeta0, zeta1, zeta2, zeta3, qx16);
_butterflyx64.

equiv _poly_ntt_eq:
 Jkem_avx2.M._poly_ntt ~ NTT_AVX.ntt :
 r{2}=lift_array256 rp{1} /\ signed_bound_cxq rp{1} 0 256 2 ==>
 res{2}=lift_array256 res{1} /\
 pos_bound256_cxq res{1} 0 256 2.
proof.
admit.
qed.

op zetas400 : int Array400.t =
 Array400.of_list witness
(*    L0 *)   [ 31499 ; 31499 ; 2571 ; 2571
(*  L1_l *)   ; 14746 ; 14746 ; 2970 ; 2970
(*  L2_l *)   ; 13525 ; 13525 ; 13525 ; 13525 ; 13525 ; 13525 ; 13525 ; 13525 ; 53134 ; 53134 ; 53134 ; 53134 ; 53134 ; 53134 ; 53134 ; 53134 ; 1493 ; 1493 ; 1493 ; 1493 ; 1493 ; 1493 ; 1493 ; 1493 ; 1422 ; 1422 ; 1422 ; 1422 ; 1422 ; 1422 ; 1422 ; 1422
(*  L3_l *)   ; 44630 ; 44630 ; 44630 ; 44630 ; 27758 ; 27758 ; 27758 ; 27758 ; 61737 ; 61737 ; 61737 ; 61737 ; 49846 ; 49846 ; 49846 ; 49846 ; 3158 ; 3158 ; 3158 ; 3158 ; 622 ; 622 ; 622 ; 622 ; 1577 ; 1577 ; 1577 ; 1577 ; 182 ; 182 ; 182 ; 182
(*  L4_l *)   ; 59709 ; 59709 ; 17364 ; 17364 ; 39176 ; 39176 ; 36479 ; 36479 ; 5572 ; 5572 ; 64434 ; 64434 ; 21439 ; 21439 ; 39295 ; 39295 ; 573 ; 573 ; 2004 ; 2004 ; 264 ; 264 ; 383 ; 383 ; 2500 ; 2500 ; 1458 ; 1458 ; 1727 ; 1727 ; 3199 ; 3199
(*  L5_l *)   ; 59847 ; 59020 ; 1497 ; 30967 ; 41972 ; 20179 ; 20711 ; 25081 ; 52740 ; 26617 ; 16065 ; 53095 ; 9135 ; 64887 ; 39550 ; 27837 ; 1223 ; 652 ; 2777 ; 1015 ; 2036 ; 1491 ; 3047 ; 1785 ; 516 ; 3321 ; 3009 ; 2663 ; 1711 ; 2167 ; 126 ; 1469
(*  L6_l *)   ; 65202 ; 54059 ; 33310 ; 20494 ; 37798 ; 945 ; 50654 ; 6182 ; 32011 ; 10631 ; 29176 ; 36775 ; 47051 ; 17561 ; 51106 ; 60261 ; 2226 ; 555 ; 2078 ; 1550 ; 422 ; 177 ; 3038 ; 1574 ; 3083 ; 1159 ; 2552 ; 2727 ; 1739 ; 2457 ; 418 ; 3173 ; 11182 ; 13387 ; 51303 ; 43881 ; 13131 ; 60950 ; 23093 ; 5493 ; 33034 ; 30318 ; 46795 ; 12639 ; 20100 ; 18525 ; 19529 ; 52918 ; 430 ; 843 ; 871 ; 105 ; 587 ; 3094 ; 2869 ; 1653 ; 778 ; 3182 ; 1483 ; 1119 ; 644 ; 349 ; 329 ; 3254
(*  L1_r *)   ; 788 ; 788 ; 1812 ; 1812
(*  L2_r *)   ; 28191 ; 28191 ; 28191 ; 28191 ; 28191 ; 28191 ; 28191 ; 28191 ; 48842 ; 48842 ; 48842 ; 48842 ; 48842 ; 48842 ; 48842 ; 48842 ; 287 ; 287 ; 287 ; 287 ; 287 ; 287 ; 287 ; 287 ; 202 ; 202 ; 202 ; 202 ; 202 ; 202 ; 202 ; 202
(*  L3_r *)   ; 10690 ; 10690 ; 10690 ; 10690 ; 1359 ; 1359 ; 1359 ; 1359 ; 54335 ; 54335 ; 54335 ; 54335 ; 31164 ; 31164 ; 31164 ; 31164 ; 962 ; 962 ; 962 ; 962 ; 2127 ; 2127 ; 2127 ; 2127 ; 1855 ; 1855 ; 1855 ; 1855 ; 1468 ; 1468 ; 1468 ; 1468
(*  L4_r *)   ; 37464 ; 37464 ; 24313 ; 24313 ; 55004 ; 55004 ; 8800 ; 8800 ; 18427 ; 18427 ; 8859 ; 8859 ; 26676 ; 26676 ; 49374 ; 49374 ; 2648 ; 2648 ; 1017 ; 1017 ; 732 ; 732 ; 608 ; 608 ; 1787 ; 1787 ; 411 ; 411 ; 3124 ; 3124 ; 1758 ; 1758
(*  L5_r *)   ; 19884 ; 37287 ; 49650 ; 56638 ; 37227 ; 9076 ; 35338 ; 18250 ; 13427 ; 14017 ; 36381 ; 52780 ; 16832 ; 4312 ; 41381 ; 47622 ; 2476 ; 3239 ; 3058 ; 830 ; 107 ; 1908 ; 3082 ; 2378 ; 2931 ; 961 ; 1821 ; 2604 ; 448 ; 2264 ; 677 ; 2054
(*  L6_r *)   ; 34353 ; 25435 ; 58154 ; 24392 ; 44610 ; 10946 ; 24215 ; 16990 ; 10336 ; 57603 ; 43035 ; 10907 ; 31637 ; 28644 ; 23998 ; 48114 ; 817 ; 603 ; 1322 ; 1864 ; 2114 ; 1218 ; 2455 ; 2142 ; 2144 ; 2051 ; 1819 ; 2459 ; 3221 ; 996 ; 958 ; 1522 ; 20297 ; 2146 ; 15356 ; 33152 ; 59257 ; 50634 ; 54492 ; 14470 ; 44039 ; 45338 ; 23211 ; 48094 ; 41677 ; 45279 ; 7757 ; 23132 ; 1097 ; 610 ; 2044 ; 384 ; 3193 ; 1994 ; 220 ; 1670 ; 1799 ; 794 ; 2475 ; 478 ; 3021 ; 991 ; 1869 ; 1628
(* trail *)   ; 0 ; 0 ; 0 ; 0 ].

