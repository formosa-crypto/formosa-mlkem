require import AllCore List IntDiv QFABV StdOrder.

from Jasmin require import JModel_x86 JArray.

import BitEncoding BS2Int BitChunking IntOrder.

(*[size_flatten] (for uniform inner lists) *)
lemma size_flatten' ['a] sz (ss: 'a list list):
 (forall x, x\in ss => size x = sz) =>
 size (flatten ss) = sz*size ss.
proof.
move=> H; rewrite size_flatten.
rewrite StdBigop.Bigint.sumzE.
rewrite StdBigop.Bigint.BIA.big_map.
rewrite -(StdBigop.Bigint.BIA.eq_big_seq (fun _ => sz)) /=.
 by move=> x Hx; rewrite /(\o) /= H.
by rewrite StdBigop.Bigint.big_constz count_predT.
qed.

lemma flatten_ctt_inj ['a] (n : int) (s s' : 'a list list):
     0 < n =>
     (forall (x : 'a list), x \in s => size x = n) =>
     (forall (x : 'a list), x \in s' => size x = n) =>
     flatten s = flatten s' <=> s = s'.
move=> Hn H1 H2; split; last by auto.
move => Hf.
have ? : size s = size s'.
+ have ? := size_flatten_ctt n s _;1:smt().
  have ? := size_flatten_ctt n s' _;1:smt().
  have ? : n * size s' = n * size s.
  have : size (flatten s) = size (flatten s') by smt(). smt().
  by smt().
apply (eq_from_nth []); 1:smt().
move => i ib.
apply (eq_from_nth witness);1:smt(mem_nth).
     move => ii iib.


have -> : nth witness (nth [] s i) ii  = nth witness (flatten s) (i * n + ii). rewrite (nth_flatten witness n). rewrite allP => /#. 
have : 0 <= ii < n. 
have n_sz : size (nth [] s i) = n.
apply H1. smt(mem_nth). smt(). move => ii_bnd.
have -> : (i * n + ii) %/ n = i. 
have -> : (i * n + ii) %/ n = i + (ii %/ n); smt(@IntDiv).
have -> : (i * n + ii) %% n = ii %% n by smt(@IntDiv).
have -> : ii %% n = ii by smt(@IntDiv). trivial.

have -> : nth witness (nth [] s' i) ii = nth witness (flatten s') (i * n + ii). 
rewrite (nth_flatten witness n). rewrite allP => /#. 
have : 0 <= ii < n. 
have n_sz : size (nth [] s' i) = n. smt(mem_nth).
have : size (nth [] s' i) = size (nth [] s i) by smt(mem_nth).
smt(). move => ii_bnd2.
have -> : (i * n + ii) %/ n = i. 
have -> : (i * n + ii) %/ n = i + (ii %/ n); smt(@IntDiv).
have -> : (i * n + ii) %% n = ii %% n by smt(@IntDiv).
have -> : ii %% n = ii by smt(@IntDiv). trivial. smt().
qed.


(* ----------- BEGIN BOOL BINDINGS ---------- *)
op bool2bits (b : bool) : bool list = [b].
op bits2bool (b: bool list) : bool = List.nth false b 0.

op i2b (i : int) = (i %% 2 <> 0).
op b2si (b: bool) = 0.

bind bitstring bool2bits bits2bool b2i b2si i2b bool 1.
realize size_tolist by auto.
realize tolistP by auto.

realize oflistP by rewrite /bool2bits /bits2bool;smt(size_eq1).
realize ofintP by rewrite /bits2bool /int2bs => i; rewrite (nth_mkseq false) //. 
realize touintP by rewrite /bool2bits /= => bv; rewrite bs2int_cons bs2int_nil //=.
realize tosintP by move => bv => //. 
realize gt0_size by done.
    
bind op bool (/\) "and".
realize bvandP by move=> bv1 bv2; rewrite /bool2bits /#.


(* ------------- BEGIN W8 Bindings -------------------- *)

bind bitstring W8.w2bits W8.bits2w W8.to_uint W8.to_sint W8.of_int W8.t 8.
realize size_tolist by auto.
realize tolistP by auto.
realize oflistP by smt(W8.bits2wK). 
realize ofintP by move => *;rewrite /of_int int2bs_mod //=.
realize tosintP. move => bv /=;rewrite /to_sint /smod /BVA_Top_JWord_W8_t.msb.
have -> /=: nth false (w2bits bv) (8 - 1) = 2 ^ (8 - 1) <= to_uint bv; last by smt().
rewrite /to_uint. 
rewrite -{2}(cat_take_drop 7 (w2bits bv)).
rewrite bs2int_cat size_take 1:// W8.size_w2bits /=.
rewrite -bs2int_div 1:// /= get_to_uint /=.
rewrite -bs2int_mod 1:// /= /to_uint.
by smt(bs2int_range mem_range W8.size_w2bits pow2_8).
qed.
realize touintP by smt().
realize gt0_size by done.

(* -------------------------------------------------------------------- *)
bind op [W8.t & bool] W8."_.[_]" "get".
realize le_size by done.
realize eq1_size by done.
realize bvgetP by done.

(* -------------------------------------------------------------------- *)
bind op [bool & W8.t] W8.init "init".
realize size_1 by auto.
realize bvinitP.
move=> f; apply (eq_from_nth false).
 rewrite (size_flatten' 1).
  move=> x /mkseqP [y [Hy ->]] /=.
  exact BVA_Top_Pervasive_bool.size_tolist.
  rewrite size_w2bits size_mkseq; smt(W8.gt0_size).
rewrite size_w2bits => i Hi.
rewrite get_w2bits (BitEncoding.BitChunking.nth_flatten false 1 _).
 apply/List.allP => x /mkseqP [y [Hy ->]] /=.
 exact BVA_Top_Pervasive_bool.size_tolist.
by rewrite (:i %% 1 = 0) 1:/# nth_mkseq 1:/# /bool2bits initiE /=.
qed.

(* -------------------------------------------------------------------- *)
bind op W8.t W8.andw "and".

realize bvandP.
proof.
move=> w1 w2; apply/(eq_from_nth witness).
- by rewrite size_map size_zip !size_w2bits.
rewrite size_w2bits => i rg_i; rewrite (nth_map witness) /=.
- by rewrite size_zip !size_w2bits.
rewrite nth_zip_cond /= size_zip !size_w2bits lez_minl 1:// /=.
rewrite 2?iftrue ~-1:/# /=.
rewrite [nth _ (w2bits w1) _](nth_change_dfl false) ?size_w2bits 1:/#.
rewrite [nth _ (w2bits w2) _](nth_change_dfl false) ?size_w2bits 1:/#.
by rewrite !get_w2bits w2bitsE nth_mkseq //#.
qed.

bind op W8.t W8.orw "or".

realize bvorP. 
move => bv1 bv2. 
apply (eq_from_nth false); 1: by smt(size_map size_zip W8.size_w2bits).
move => i ib;rewrite !W8.get_w2bits orwE.
rewrite (nth_map (false,false) false) /=; 1: by smt(size_map size_zip W8.size_w2bits).  
rewrite !(nth_zip false false) //=;congr; rewrite -W8.get_w2bits.
qed.

bind op [W8.t & W8.t] W8.(`>>`) "shrs".
realize bvshrsP.
rewrite /(`>>`) => bv1 bv2.
by rewrite W8.to_uint_shr; 1:smt(W8.to_uint_cmp).
qed.

op srl_8 (w1 w2 : W8.t) : W8.t =
  w1 `>>>` W8.to_uint w2.

bind op [W8.t] srl_8 "shr".
realize bvshrP.
rewrite /shr_8 => bv1 bv2.
by rewrite W8.to_uint_shr; 1:smt(W8.to_uint_cmp).
qed.


op sll_8 (w1 w2 : W8.t) : W8.t =
  w1 `<<<` to_uint w2.

bind op [W8.t] sll_8 "shl".
realize bvshlP.
rewrite /shl_8 => bv1 bv2.
by rewrite W8.to_uint_shl; 1:smt(W8.to_uint_cmp).
qed.

(* ------------- END W8 Bindings -------------------- *)

abstract theory JCircuits.

op size : int.

clone import BitWordSH as W with op size <- size.


bind bitstring W.w2bits W.bits2w W.to_uint W.to_sint W.of_int W.t size.
realize size_tolist by auto.
realize tolistP by auto.
realize oflistP by smt(W.bits2wK). 
realize ofintP by move => *;  rewrite /of_int int2bs_mod.
realize tosintP. 
move => bv /=. rewrite /to_sint /smod.
have <- /=: nth false (w2bits bv) (JCircuits.size - 1) = 2 ^ (JCircuits.size - 1) <= to_uint bv; last first. 
rewrite /to_uint. 
rewrite -{2}(cat_take_drop (JCircuits.size - 1) (w2bits bv)).
rewrite bs2int_cat size_take 1://. 
smt(W.gt0_size).
rewrite -bs2int_div 1:// /=. smt(W.gt0_size). rewrite get_to_uint /=.
rewrite -bs2int_mod 1:// /= /to_uint. smt(W.gt0_size).
have -> : 0 <= JCircuits.size - 1 < JCircuits.size by smt(W.gt0_size). 
rewrite /msb.
case (JCircuits.size <= 1) => sz.
have : 1 = JCircuits.size by smt(W.gt0_size). smt().
have -> /=: JCircuits.size <> 1 by smt(W.gt0_size).
case (bv.[JCircuits.size - 1]) => msb.
rewrite -touintP.
move : msb. 
rewrite get_to_uint. 
move => [] _ bnd. smt().
smt(get_to_uint).
simplify.
rewrite get_to_uint. 
have -> : 0 <= JCircuits.size - 1 < JCircuits.size = true by smt(W.gt0_size).
simplify.
case (2 ^ (JCircuits.size - 1) <= to_uint bv) => val.
have E : to_uint bv < 2 * (2 ^ (JCircuits.size - 1)) by rewrite -exprS; smt(W.gt0_size to_uint_cmp).
have E2 : to_uint bv %/ (2 ^ (JCircuits.size - 1)) = 1 by smt(divz_eqP).
smt(@IntDiv). 
smt(@IntDiv to_uint_cmp).
qed.
realize touintP by smt().
realize gt0_size by done.
    
bind op W.t W.( + ) "add".
realize bvaddP by exact W.to_uintD.

bind op W.t W.( * ) "mul".
realize bvmulP by exact W.to_uintM. 


bind op [bool & W.t] W.\ult "ult".
realize bvultP by move=> bv1 bv2; rewrite W.ultE /#.

bind op [bool & W.t] W.\slt "slt".
realize bvsltP by move=> w1 w2; rewrite W.sltE /#.

bind op [W.t & bool] W."_.[_]" "get".
realize le_size by smt(W.gt0_size).
realize eq1_size by done.
realize bvgetP by done.

bind op [bool & W.t] W.init "init".
realize size_1 by done.
realize bvinitP.
move=> f; apply (eq_from_nth false).
 rewrite (size_flatten' 1).
  move=> x /mkseqP [y [Hy ->]] /=.
  exact BVA_Top_Pervasive_bool.size_tolist.
  rewrite size_w2bits size_mkseq; smt(W.gt0_size).
rewrite size_w2bits => i Hi.
rewrite get_w2bits (BitEncoding.BitChunking.nth_flatten false 1 _).
 apply/List.allP => x /mkseqP [y [Hy ->]] /=.
 exact BVA_Top_Pervasive_bool.size_tolist.
by rewrite (:i %% 1 = 0) 1:/# nth_mkseq 1:/# /bool2bits initiE /=.
qed.

bind op W.t W.andw "and".
realize bvandP. 
rewrite /andw /map2 => bv1 bv2.
apply (eq_from_nth false);1: rewrite size_map size_zip !size_w2bits /#. 
move => i; rewrite size_w2bits /= => ib.
rewrite initiE 1:/# (nth_map (false,false)) /=;1: rewrite size_zip !size_w2bits /#. 
by rewrite !nth_zip /=;1:smt(W16.size_w2bits).
qed.


bind op W.t W.orw "or".
realize bvorP. 
rewrite /orw /map2 => bv1 bv2.
apply (eq_from_nth false);1: rewrite size_map size_zip !size_w2bits /#. 
move => i; rewrite size_w2bits /= => ib.
rewrite initiE 1:/# (nth_map (false,false)) /=;1: rewrite size_zip !size_w2bits /#. 
by rewrite !nth_zip /=;1:smt(W16.size_w2bits).
qed.

bind op W.t W.(+^) "xor".
realize bvxorP.
move => bv1 bv2.
apply (eq_from_nth false); 1: rewrite !size_map size_zip !size_w2bits /#. 
move => i; rewrite size_w2bits /= => ib.
rewrite (nth_map (false,false)) /=; 1: rewrite size_zip !size_w2bits /#. 
by rewrite !nth_zip /=; 1:smt(W64.size_w2bits).
qed.


bind op [W.t] W.invw "not".
realize bvnotP.
move=> bv1.
apply (eq_from_nth false); 1: rewrite !size_map size_w2bits /#. 
move => i; rewrite size_w2bits /= => ib.
by rewrite (nth_map false) 1:// /= /#.
qed.


(* FIXME: Might not be needed anymore *)
op W_sub (a : W.t, b: W.t) : W.t = 
  a - b.

bind op W.t W_sub "sub".
realize bvsubP by rewrite /W_sub => bv1 bv2; rewrite W.to_uintD to_uintN /=; smt(@IntDiv).

op sll (w1 w2 : W.t) : W.t =
  W.(`<<<`) w1 (W.to_uint w2).

bind op [W.t] sll "shl".
realize bvshlP.
rewrite /shl_16 => bv1 bv2.
by rewrite W.to_uint_shl; 1:smt(W.to_uint_cmp).
qed.

op sra (w1 w2 : W.t) : W.t =
W.sar w1 (to_uint w2).

(* ------------------ V TO ADD TO JWORD.ec V --------------------- *)

(* 
lemma W_to_sint_pos (w: W.t):
 to_uint w < 2^(JCircuits.size - 1) =>
 to_sint w = to_uint w.
proof.
rewrite to_sintE /smod /= => H.
by rewrite ifF 1:/#.
qed.
*)

lemma W_get_ule (w: W.t) k:
 w.[k] => 2^k <= W.to_uint w.
proof.
rewrite get_to_uint => [[Hk H]].
smt(W.to_uint_cmp gt0_pow2).
qed.

lemma W_msbE (w: W.t):
 msb w <=> w.[JCircuits.size-1].
proof.
rewrite /msb; split; last by apply W_get_ule.
rewrite get_to_uint => H.
have L0: 0 < to_uint w %/ 2^(JCircuits.size-1).
 move: H; rewrite /=; smt(W.to_uint_cmp @IntDiv W.gt0_size).
have: to_uint w \in range (1 * 2^(JCircuits.size-1)) ((1 + 1) * 2^(JCircuits.size-1)).
 rewrite /range /= mem_iota; split => //=.
 move: (W.to_uint_cmp w) => /=. 
 have -> : 2 ^ (JCircuits.size - 1) +
(2 * 2 ^ (JCircuits.size - 1) - 2 ^ (JCircuits.size - 1)) = 
2 * 2 ^ (JCircuits.size - 1) by smt(). 
rewrite -exprS. smt(W.gt0_size).
smt(@IntDiv W.gt0_size to_uint_cmp).
rewrite -eq_div_range //. smt(W.gt0_size gt0_pow2). smt(W.gt0_size).
qed.


lemma iotaE (i n: int) : 1 <= n => iota_ i n = iota_ i (n-1) ++ [i+n-1].
proof.
pose n' := n-1.
have -> : n = n' + 1 by trivial.
elim/natind: (n').

move => n2 nb nb2.
rewrite iotaS. smt().
rewrite iota0; trivial.
rewrite iota0; trivial.
smt().
move => n2 N IH np1.
rewrite iotaS; [trivial |].
smt().
rewrite addrC iota_addl.
rewrite IH. smt(). simplify.
rewrite map_cat. do! simplify. 
rewrite -cat_cons.
rewrite -iota_addl.
rewrite addrC.
rewrite -iotaS; trivial.
smt().
qed.

lemma W_min_sintE:
 W.of_int W.min_sint
 = W.zero.[JCircuits.size-1 <- true].
proof.
rewrite to_uint_eq of_uintK /= to_uint_bits /bits /mkseq -iotaredE /=.
have:= bs2int_pow2 (JCircuits.size-1) 0.
+ rewrite nseq0 /max -mkseq_nseq /mkseq -iotaredE /=. 
  rewrite bs2int_cat size_map /iotared size_iota.
  have -> : bs2int [true] = 1.
  have -> : [true] = (true :: nseq 0 false) by smt(nseq0_le).
  by rewrite bs2int1 => //=.

have -> :(map (fun (_ : int) => false) (iota_ 0 (JCircuits.size - 1))) = nseq (JCircuits.size - 1) false by rewrite map_nseq size_iota; smt(W.gt0_size).

rewrite bs2int_nseq_false => //= />.
have -> : max 0 (JCircuits.size - 1) = (JCircuits.size - 1) by smt(W.gt0_size).
move => st.

have -> : W.min_sint %% W.modulus = 2 ^ (JCircuits.size - 1).
+ rewrite -(emodz_eq W.modulus 1 _).
  + by smt(mem_range_mod W.gt0_size gt0_pow2 to_uint_cmp).
  have -> : (1 * W.modulus + W.min_sint %% W.modulus) %% W.modulus = 
     (1 * W.modulus + W.min_sint) %% W.modulus by smt(@IntDiv).
  + have -> : (1 * W.modulus + W.min_sint) = 2 ^ (JCircuits.size - 1).
    + have -> : W.modulus = 2 * 2 ^ (JCircuits.size - 1) by rewrite -exprS; smt(W.gt0_size).
      by smt(@IntDiv W.gt0_size to_uint_cmp gt0_pow2 exprS).
  rewrite modz_small.
  + apply bound_abs;split; 1: by smt(gt0_pow2).
    move => a.
    rewrite st; case (0 < JCircuits.size - 1) => ?; smt(@StdOrder.IntOrder @Ring.IntID).
  by smt().

have -> : (map ("_.[_]" W.zero.[JCircuits.size - 1 <- true]) (iota_ 0 JCircuits.size)) = nseq (JCircuits.size - 1) false ++ [true].
+ rewrite iotaE; 1: smt(W.gt0_size).
  rewrite map_cat map1 get_setE /=;1: smt(W.gt0_size).
  apply eqseq_cat => /=; 1: by rewrite size_map size_nseq size_iota //=.
  have -> : (JCircuits.size - 1) = size (iota_ 0 (JCircuits.size - 1)) by smt(size_iota W.gt0_size).
  rewrite -(map_nseq false (iota_ 0 (JCircuits.size - 1))) size_iota.
  have -> : (max 0 (JCircuits.size - 1)) = JCircuits.size - 1 by smt(W.gt0_size).
  apply eq_in_map => x bnd.
  by rewrite set_neqiE; smt(mem_iota).

have -> : nseq (JCircuits.size - 1) false ++ [true] = (nseq (JCircuits.size - 1) false ++ (true :: nseq 0 false)).
+ apply eqseq_cat=> //.
  by rewrite nseq0 //=.
  
by rewrite bs2int_pow2;smt(W.gt0_size).
qed.

lemma W_msb_sar (w: W.t) k:
 0 <= k =>
 msb (sar w k) = msb w.
proof.
move=> Hk.
rewrite !W_msbE /(`|>>>`) /sar /=.
rewrite initE. simplify.
have -> : min (JCircuits.size - 1) (JCircuits.size - 1 + k) = JCircuits.size - 1 by smt().
have -> : 0 <= JCircuits.size - 1 < JCircuits.size by smt(W.gt0_size). trivial.
qed.

lemma W_msb_sign (w: W.t):
 msb w <=> to_sint w < 0.
proof.
rewrite /msb to_sintE /smod.
by move: (W.to_uint_cmp w); smt().
qed.

lemma W_to_sint_neg (w: W.t):
 msb w =>
 to_sint w  = to_uint w - W.modulus.
proof.
rewrite /msb to_sintE /smod.
by move: (W.to_uint_cmp w); smt().
qed.

lemma W_to_sint_pos (w: W.t):
 !msb w =>
 to_sint w  = to_uint w.
proof.
rewrite /msb to_sintE /smod.
by move: (W.to_uint_cmp w); smt().
qed.

lemma W_sar_pos (w: W.t) k:
 0 <= k =>
 !msb w =>
 sar w k = w `>>>` k.
proof.
rewrite W_msbE /= => Hk Hpos.
apply W.ext_eq => i Hi.
rewrite /(`|>>>`) initiE //=.
rewrite /(`>>>`) Hi /=.
case: (JCircuits.size-1 < (i + k)) => E.
 by rewrite lez_minl 1:/# eq_sym get_out /#.
by rewrite lez_minr 1:/#.
qed.

lemma W_shl_onew k:
 0 < k =>
 W.onew `>>>` k
 = W.of_int (2^(max 0 (JCircuits.size - k)) -1).
proof.
move => Hk.
apply W.ext_eq => i Hi.
by rewrite /(`>>>`) initiE  //= /#.
qed.

lemma W_sarE_neg (w: W.t) k:
 0 <= k =>
 msb w =>
 sar w k 
 = (w `>>>` k) `|` invw (W.onew `>>>` k).
proof.
rewrite W_msbE /= => Hk Hmsb.
apply W.ext_eq => i Hi.
rewrite /(`|>>>`) initiE //=.
rewrite /(`>>>`) !Hi //=.
have ->/=: 0 <= i + k by smt().
case: (i + k < JCircuits.size) => C.
 by rewrite lez_minr 1:/#.
by rewrite lez_minl 1:/# Hmsb.
qed.

lemma W_to_uint_sar_neg (w: W.t) k:
 0 <= k =>
 msb w =>
 to_uint (sar w k)
 = W.modulus + (to_sint w %/ 2^k).
proof.
move=> Hk Hmbs.
have [Hw0 Hw1]:= W.to_uint_cmp w.
rewrite W_sarE_neg // W.to_uint_orw_disjoint.
 apply W.ext_eq => i Hi.
 rewrite /(`>>`) /(`>>>`) /= !initiE Hi //=.
 have ->/=: 0 <= i + k by smt().
 case: (i + k < JCircuits.size) => C //=.
 by rewrite get_out /#.
case: (k = 0) => Ek0.
 rewrite !Ek0 /= to_uint_shr 1:/#.
 rewrite to_uint_invw to_uint_shr 1:/#.
 by rewrite W_to_sint_neg // to_uint_onew /#.
case: (JCircuits.size <= k) => Eksz.
 rewrite to_uint_shr 1:/# divz_small /=.
apply bound_abs.
split; [ smt(to_uint_cmp) | ] => a.
 have : W.modulus <= 2 ^ k.
 apply ler_weexpn2l; [ trivial | trivial ]. smt().

 have ->: to_sint w %/ 2 ^ k = -1.
  rewrite W_to_sint_neg //.
  have ->: to_uint w - W.modulus
           = - (W.modulus - to_uint w) by ring.
  rewrite divNz.
    by rewrite subr_gt0; apply Hw1.
   smt(expr_gt0).
  rewrite divz_small //.
  apply bound_abs; split.
   rewrite /= in Hw1.
   by rewrite /= /#.
  move=> ?.
  apply (ltr_le_trans W.modulus); first smt().
  apply ler_weexpn2l; [ trivial | trivial].
 rewrite to_uint_invw to_uint_shr 1:/# to_uint_onew divz_small //.
 apply bound_abs; split; first smt(W.gt0_size gt0_pow2).
 move=> ?; apply (ltr_le_trans W.modulus); first smt().
 by apply ler_weexpn2l.
rewrite to_uint_shr; first smt(to_uint_cmp).
rewrite W_shl_onew; first smt(to_uint_cmp).
rewrite lez_maxr 1:/# to_uint_invw.
rewrite of_uintK modz_small.
 apply bound_abs; split; first smt(@IntDiv).
 move => ?.
 have /=?: 2 ^ (JCircuits.size - k) <= W.modulus.
  by apply ler_weexpn2l => // /#.
 by rewrite /= /#.
have Hkk: W.modulus = 2^(JCircuits.size-k) * 2^k.
 rewrite -exprD_nneg // 1:/#.
 by rewrite -addzA /=.
have ->: W.max_uint - (2 ^ (JCircuits.size - k) - 1)
         = W.modulus - W.modulus %/ 2^k.
 rewrite {3}Hkk mulzK /#.
rewrite addzC -addzA; congr.
rewrite addzC W_to_sint_neg //.
have ->: (to_uint w - W.modulus)
 = to_uint w + (- 2^(JCircuits.size-k)) * 2^k.
 by rewrite Hkk; ring.
rewrite divzMDr 1:/# addzC; congr.
have ->: W.modulus = 2^(JCircuits.size - k + k).
 by congr; smt().
congr.
by rewrite exprD_nneg 1:/# // /#.
qed.

lemma W_sar_div (w1 : W.t) k:
 0 <= k =>
 to_sint (sar w1 k)
 = to_sint w1 %/ 2 ^ k.
proof.
case: (msb w1) => Hk C.
 rewrite W_to_sint_neg 1:W_msb_sar //.
 rewrite W_to_uint_sar_neg // /#.
rewrite W_to_sint_pos 1:W_msb_sar //.
by rewrite W_sar_pos // to_uint_shr /#.
qed.

(* ------------------ A TO ADD TO JWORD.ec A --------------------- *)

bind op [W.t] sra "ashr".
realize bvashrP.
move=> bv1 bv2. 
rewrite W_sar_div; smt(W.to_uint_cmp).
qed.

op shr (w1 w2 : W.t) : W.t =
  w1 `>>>` W.to_uint w2.

bind op [W.t] shr "shr".
realize bvshrP.
rewrite /shr => bv1 bv2; rewrite W.to_uint_shr; 1:smt(W.to_uint_cmp); trivial.
qed.

bind op [W.t & W8.t] W.(`<<`) "shls".
realize bvshlsP.
rewrite /(`>>`) => bv1 bv2.
by rewrite W.to_uint_shl; smt(W8.to_uint_cmp).
qed.

bind op [W.t & W8.t] W.(`>>`) "shrs".
realize bvshrsP.
rewrite /(`>>`) => bv1 bv2.
by rewrite W.to_uint_shr; smt(W8.to_uint_cmp).
qed.


bind op [W.t & W8.t] W.(`|>>`) "ashrs".
realize bvashrsP.
rewrite /(`|>>`) => bv1 bv2.
rewrite W_sar_div; 1:smt(W8.to_uint_cmp); trivial.
qed.

op rol (w1 w2 : W.t) = w1 `|<<<|` to_uint w2.

bind op [W.t] rol "rol".
realize bvrolP.
rewrite /rol => bv1 bv2 i Hi.
rewrite !get_w2bits. 
smt(rolE initiE).
qed.
end JCircuits.

clone BitWordSH as W17 with op size <- 17.


clone import JCircuits as JC17 with
  op size <= 17,
  theory W <= W17.

  
abstract theory JCircuits2.
  op sizeS : int.
  op sizeB : int.

  axiom le_size : 0 <= sizeS <= sizeB.

  
  clone import BitWordSH as WS with op size <- sizeS.
  clone import BitWordSH as WB with op size <- sizeB.
  
  clone import W_WS as W2 with
    op sizeS <- sizeS, 
    op sizeB <- sizeB,
    theory WS <- WS,
    theory WB <- WB.

  clone import JCircuits as JCS with op size <- sizeS, theory W <- WS.

  clone import JCircuits as JCB with op size <- sizeB, theory W <- WB.
  
  lemma le_modulus : 0 <= WS.modulus <= WB.modulus.
  proof.
  split. smt(gt0_size gt0_pow2). move => _.
  apply ler_weexpn2l; [ trivial | split ]. 
  smt(WS.gt0_size). move => _. apply le_size.
  qed.

  bind op [WB.t & WS.t] truncateu'S "truncate".
  realize le_size by apply le_size.
  realize bvtruncateP.
move => mv. rewrite /truncateu'S /w2bits take_mkseq 1:// /= /w2bits. 
apply JCircuits2.le_size.
apply (eq_from_nth witness);1: by smt(size_mkseq).
move => i; rewrite size_mkseq /= /max /= => ib.
rewrite !nth_mkseq 1..2:// /of_int /to_uint /= 1..2:/# get_bits2w 1:/# 1:// 
        nth_mkseq 1:// /= 1:/# get_to_uint 1:// /= /to_uint /=.
have -> /=: (0 <= i && i < sizeB) by smt(JCircuits2.le_size).
pose a := BitEncoding.BS2Int.bs2int (w2bits mv). 
rewrite {1}(divz_eq a (2^(sizeS-i)*2^i)) !mulrA divzMDl;
   1: by smt(StdOrder.IntOrder.expr_gt0).
rewrite dvdz_modzDl; 1: by
 have ->  : 2^(sizeS-i) = 2^((sizeS-i-1)+1); [ by smt() |
    rewrite exprS 1:/#; smt(dvdz_mull dvdz_mulr)].  
by have -> : (2 ^ (sizeS - i) * 2 ^ i) = WS.modulus; 
  [ rewrite -StdBigop.Bigint.Num.Domain.exprD_nneg 
     1,2:/# /= -!addrA /= | done ].
qed.

bind op [WS.t & WB.t] zeroextu'B "zextend".
realize le_size by apply le_size.
realize bvzextendP.
move => bv; rewrite /zeroextu'B /= of_uintK /= modz_small 2://. 
apply bound_abs. 
split. smt(WS.to_uint_cmp).
move => bnd.
smt(WB.to_uint_cmp WS.to_uint_cmp JCircuits2.le_modulus).
qed.
end JCircuits2.  

clone import JCircuits2 as JC2 with
  op sizeS <- 17,
  op sizeB <- 17,
  theory WS <- W17,
  theory WB <- W17.  

abstract theory JCArray.
  op size : int.

  axiom gt0_size : 0 < size.
 
  clone import PolyArray as A with op size <- size.
  bind array A."_.[_]" A."_.[_<-_]" A.to_list A.of_list A.t size.
  realize gt0_size by apply gt0_size.
  realize tolistP by done.
  realize get_setP by smt(A.get_setE).
  realize eqP by smt(A.tP).
  realize get_out by smt(A.get_out).
end JCArray.


abstract theory JCArrayBS.
  op size_arr : int.
  op size_bs : int.

  clone import PolyArray as A with op size <- size_arr.
  clone import BitWordSH as BV with op size <- size_bs.

  clone import JCircuits as JCBV with 
    op size <- size_bs,
    theory W <- BV.

  clone import JCArray as JCA with
    op size <- size_arr,
    theory A <- A.

  op init (f: int -> BV.t) : BV.t A.t = A.init f.

  bind op [BV.t & A.t] init "ainit".
  realize bvainitP.
  rewrite /init => f.
  rewrite BVA_Top_JCArray_A_t.tolistP.
  apply eq_in_mkseq => i i_bnd.
  smt(A.initE).
  qed.
end JCArrayBS.

abstract theory JCArraySlice.
  op size_arr : int.
  op size_bs_arr : int.
  op size_bs : int.

  axiom le_size : size_bs <= size_bs_arr * size_arr.

  clone import PolyArray as A with op size <- size_arr.
  clone import BitWordSH as BVA with op size <- size_bs_arr.
  clone import BitWordSH as BV with op size <- size_bs.

  clone import JCircuits as JCBV with op size <- size_bs, theory W <- BV.
  clone import JCArray as JCA with op size <- size_arr, theory A <- A.
  clone import JCircuits as JCBVA with op size <- size_bs_arr, theory W <- BVA.

  clone import JCArrayBS as JCABS with 
    op size_arr <- size_arr, 
    op size_bs <- size_bs_arr,
    theory A <- A,
    theory BV <- BVA, 
    theory JCBV <- JCBVA,
    theory JCA <- JCA.

  op sliceget (arr: BVA.t A.t) (offset: int) : BV.t = 
   (*if 8 %| offset then 
    get256_direct ((init64 (fun (i_0 : int) => arr.[i_0])))%WArray32 (offset %/ 8) 
   else *)
    BV.bits2w (take size_bs (drop offset (flatten (map BVA.w2bits (to_list arr))))).

  bind op [BVA.t & BV.t & A.t] sliceget "asliceget".
realize bvaslicegetP.
move => /= arr offset; rewrite /sliceget4_64_256 /= => H k kb. 
smt(BV.get_bits2w).
qed.
  realize le_size by apply le_size.

lemma size_flatten_BVA_w2bits (a : BVA.t list) :
  (size (flatten (map BVA.w2bits (a))))  = size_bs_arr * size a.
proof.
  rewrite size_flatten -map_comp /(\o) /=.
  rewrite StdBigop.Bigint.sumzE /= StdBigop.Bigint.BIA.big_mapT /(\o) /=. 
  rewrite StdBigop.Bigint.big_constz count_predT /#.
qed.



  op sliceset (arr: BVA.t A.t) (offset: int) (bv: BV.t) : BVA.t A.t =
    A.of_list witness (map BVA.bits2w (chunk size_bs_arr (take offset (flatten (map BVA.w2bits (to_list arr))) ++ w2bits bv ++
  drop (offset + size_bs) (flatten (map BVA.w2bits (to_list arr)))))).

  bind op [BVA.t & BV.t & A.t] sliceset "asliceset".
  realize le_size by apply le_size.
  realize bvaslicesetP.
move => arr offset bv H /= k kb; rewrite /sliceset /=. 
+ rewrite of_listK; 1: rewrite size_map size_chunk 1:// !size_cat size_take 1:/#.
  rewrite size_flatten_BVA_w2bits A.size_to_list.
  have -> : offset < size_bs_arr * size_arr by smt(BV.gt0_size).
  have -> : (if true then offset else size_bs_arr * size_arr) = offset by auto.
  rewrite BV.size_w2bits size_drop. smt(BV.gt0_size).
  rewrite size_flatten_BVA_w2bits A.size_to_list. 
  have -> : (offset + size_bs + max 0 (size_bs_arr * size_arr - (offset + size_bs))) = size_bs_arr * size_arr; smt().
  rewrite -(map_comp BVA.w2bits BVA.bits2w) /(\o). 
  have := eq_in_map ((fun (x : bool list) => w2bits ((bits2w x))%BVA)) idfun (chunk size_bs_arr
        (take offset (flatten (map BVA.w2bits (to_list arr))) ++ w2bits bv ++
         drop (offset + size_bs) (flatten (map BVA.w2bits (to_list arr))))).
  rewrite iffE => [#] ->. move => x x_in //=. rewrite BVA.bits2wK. 
  apply (in_chunk_size size_bs_arr (take offset (flatten (map BVA.w2bits (to_list arr))) ++ w2bits bv ++
         drop (offset + size_bs) (flatten (map BVA.w2bits (to_list arr)))) x).
  have : 0 < size_bs_arr * size_arr by smt(). move => kb2.
  smt(BVA.gt0_size).

  smt(in_chunk_size BVA.bits2wK BV.bits2wK).
  smt().
  (* rewrite iffE => [#] -> * /=; 1: by smt(in_chunk_size BVA.bits2wK). *)
  rewrite map_id /= chunkK 1://;1: rewrite !size_cat size_take 1:/#.
  rewrite size_flatten_BVA_w2bits A.size_to_list BV.size_w2bits size_drop. 
  smt(BV.gt0_size).
  have -> : offset < size_bs_arr * size_arr by smt(BV.gt0_size).
  have -> : (if true then offset else size_bs_arr * size_arr) = offset by smt().
  rewrite size_flatten_BVA_w2bits A.size_to_list.
  have -> : max 0 (size_bs_arr * size_arr - (offset + size_bs)) = (size_bs_arr * size_arr - (offset + size_bs)) by smt(). smt().
  rewrite !nth_cat !size_cat /=.
  rewrite size_take 1:/# size_flatten_BVA_w2bits A.size_to_list.
  have -> : offset < size_bs_arr * size_arr by smt(BV.gt0_size).
  have -> : (if true then offset else size_bs_arr * size_arr) = offset by smt().
  case (k < offset) => k_off.
  rewrite nth_take. smt(BV.gt0_size). auto.
  rewrite (nth_flatten _ size_bs_arr). 
  rewrite all_map /preim. 
  have -> : (fun x => size (BVA.w2bits x) = size_bs_arr) = (fun x => true).
  smt(BVA.size_w2bits). rewrite allP => /#.
  case ( k < offset + size_bs) => k_off2 />.
  have -> : offset <= k = false by smt(). smt(). 
  rewrite nth_drop; smt(BV.gt0_size).
  case ( k < offset + size_bs) => k_off2. smt().
  have -> : (offset <= k && false) = false by trivial.
  rewrite ifF //= nth_drop; smt(BV.gt0_size). qed.
end JCArraySlice.

