(* Miscellaneous results on some constructions from the EC and Jasmin libraries *)
require import Core Int IntDiv List.


lemma take_nseq ['a] n1 n2 (x: 'a):
 take n1 (nseq n2 x) = nseq (min n1 n2) x.
proof.
elim/natind: n2 n1.
 by move=> n Hn n1; rewrite !nseq0_le // /#.
move=> n Hn IH n1; case: (n1 <= 0) => /=.
 by move=> ?; rewrite take_le0 // nseq0_le // /#.
rewrite -ltzNge=> H; rewrite nseqS // take_cons H /=.
have ->: min n1 (n + 1) = (min (n1-1) n)+1.
 rewrite /min; case: (n1 < n+1) => ?.
  by have ->/=: n1 - 1 < n by smt().
 by have ->/=: !(n1 - 1 < n) by smt().
by rewrite nseqS /min /#.
qed.

lemma drop_nseq ['a] n1 n2 (x: 'a):
 0 <= n1 => drop n1 (nseq n2 x) = nseq (n2-n1) x.
proof.
elim/natind: n1 n2.
 move=> n Hn n2 Hn'; have ->: n=0 by smt().
 by rewrite drop0.
move=> n Hn IH n2 Hn'.
case: (n2 <= 0) => /= ?.
 by rewrite !nseq0_le // /#.
have ->: n2 = n2 - 1 + 1 by smt().
by rewrite nseqS 1:/# drop_cons ltzS Hn /= IH //; congr; smt().
qed.

lemma dropS ['a] (l: 'a list) n:
 0 <= n =>
 drop (n + 1) l = behead (drop n l).
proof.
elim: l n => [|x xs] //= IH n Hn.
have ->/=: !(n+1 <= 0) by smt().
case: (n=0).
 by move=> -> /=; rewrite drop0.
move=> ?; have ->/=: !(n<=0) by smt().
by rewrite -IH /#.
qed.

(* a variant of [drop_cat] that is more convenient in some cases *)
lemma drop_cat' ['a] (n : int) (s1 s2 : 'a list):
 drop n (s1 ++ s2)
 = if n <= size s1 then drop n s1 ++ s2 else drop (n - size s1) s2.
proof.
case: (n=size s1) => [->//=|C].
 by rewrite drop_cat /= drop0 drop_size.
by rewrite drop_cat /#.
qed.

lemma foldl_dropS ['a 'b] d i f (z:'b) (l: 'a list):
 0 <= i < size l =>
 foldl f z (drop i l)
= foldl f (f z (nth d l i)) (drop (i+1) l).
proof.
move=> Hi; rewrite dropS 1:/#.
rewrite -(head_behead (drop i _) d) /=. 
 by rewrite -size_eq0 size_drop /#.
apply eq_foldl => //.
by rewrite -nth0_head nth_drop /#.
qed.

lemma size_take_min ['a] n (s: 'a list):
 0 <= n =>
 size (take n s) = min n (size s).
proof. by move=> Hn; rewrite size_take. qed.

(* a variant of [size_take] that is more convenient in some cases *)
lemma size_take' ['a] n (s: 'a list):
 0 <= n => size (take n s) = if n <= size s then n else size s.
proof.
move=> Hn; rewrite size_take //.
case: (n = size s) => E; first by rewrite E.
case: (n <= size s) => H.
 by rewrite (: n < size s) /#.
by rewrite (: ! n < size s) /#.
qed.

(* likewise for [take_cat] *)
lemma take_cat' ['a] n (s1 s2: 'a list):
 take n (s1++s2) = if n <= size s1 then take n s1 else s1 ++ take (n-size s1) s2.
proof.
rewrite take_cat //.
case: (n = size s1) => E.
 by rewrite !E /= take0 cats0 take_size.
case: (n <= size s1) => H.
 by rewrite (: n < size s1) /#.
by rewrite (: ! n < size s1) /#.
qed.

lemma take_catX ['a] (n : int) (s1 s2 : 'a list):
    take n (s1 ++ s2) = take n s1 ++ take (n - size s1) s2.
proof.
rewrite take_cat.
case: (n < size s1) => C.
 by rewrite (take_le0 (n-size s1)) 1:/# cats0.
by rewrite (take_oversize n) // /#.
qed.

(* likewise for [take_take] *)
lemma take_take' n1 n2 (l: 'a list):
 take n1 (take n2 l) = take (min n1 n2) l.
proof. elim: l n1 n2 => //= x xs IH n1 n2; smt(). qed.

lemma size_take_le_size ['a] n (l: 'a list):
 0 <= n =>
 size (take n l) <= size l.
proof. by move=> H; rewrite size_take // /#. qed.

(* a stronger variant of [size_takel] *)
lemma size_takel' ['a] n (s: 'a list):
 size (take n s) = n <=> 0 <= n <= size s.
proof.
elim: s n => //=.
 smt().
move=> x xs IH n.
case: (n <= 0) => //=.
 by move=> Hn; split; smt(size_ge0).
by move=> Hn; move: (IH (n-1)) => /#.
qed.

lemma size_take_lt ['a] n (s: 'a list):
 size (take n s) < n <=> size s < n.
proof.
split => H; have ?: 0 <= n by smt(size_ge0).
 move: H; rewrite size_take // /#.
move: H; rewrite size_take // /#.
qed.

lemma size_filter_le ['a] (p: 'a -> bool) (l: 'a list):
 size (filter p l) <= size l.
proof.
by rewrite size_filter count_size.
qed.

(* likewise for [size_flatten] (uniform inner lists) *)
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


lemma size_behead ['a] (l:'a list):
 size (behead l) = max 0 (size l - 1).
proof. by case: l => [|x xs] /=; rewrite /max //=; smt(size_ge0). qed.

lemma behead_map ['a 'b] (f:'a->'b) (l:'a list):
 behead (map f l) = map f (behead l)
by elim: l.

lemma behead_mkseq ['a] (f : int -> 'a) n:
 behead (mkseq f n) = mkseq (fun i=> f (1+i)) (n-1).
proof.
elim/natind: n => /=.
 by move=> n Hn; rewrite !mkseq0_le /#.
by move=> n Hn IH; rewrite addzC mkseq_add // mkseq1.
qed.

(* slightly more general version *)
lemma take_mkseq' ['a] n (f: int -> 'a) k:
 0 <= n => take n (mkseq f k) = mkseq f (min n k).
proof.
elim/natind: n => //=.
 move=> n Hn1 Hn2; have ->: n=0 by smt().
 by rewrite take0 mkseq0_le /#.
move => n Hn IH H.
case: (n < k) => E.
 rewrite lez_minl 1:/#.
 rewrite (take_nth (f n)); first by rewrite size_mkseq /#.
 rewrite IH // mkseqS // lez_minl 1:/#; congr.
 by rewrite nth_mkseq.
by rewrite lez_minr 1:/# take_oversize // size_mkseq /#.
qed.

lemma behead_take ['a] n (s: 'a list):
 behead (take n s) = take (n-1) (behead s).
proof.
move: s=> [|x xs] //=.
case: (n <= 0) => C //.
by rewrite take_le0 /#.
qed.

lemma drop_take ['a] n1 n2 (bs: 'a list):
 0 <= n1 =>
 drop n1 (take n2 bs)
 = take (n2-n1) (drop n1 bs).
elim/natind: n1 n2.
 move=> n1 Hn1 n2 Hn2.
 have ->/=: n1=0 by smt().
 by rewrite !drop0.
move=> n Hn0 IH n2 Hn1.
rewrite !dropS // IH // behead_take; congr.
smt().
qed.

(* a more general version *)
lemma nth_map' ['a 'b] (da: 'a) (f: 'a -> 'b) (l: 'a list) db i:
 f da = db =>
 nth db (map f l) i = f (nth da l i).
proof.
move => Hf.
case: (0 <= i && i < size l) => C.
 by rewrite (nth_map da) //.
by rewrite !nth_out; smt(size_map).
qed.

(* TO JUtils ?? *)
from Jasmin require import JUtils.

lemma map2_nilr ['a, 'b, 'c] (f : 'a -> 'b -> 'c) l:
 map2 f l [] = [].
proof.
rewrite -size_eq0 size_map2 /=; smt(size_ge0).
qed.

lemma map2_nill ['a, 'b, 'c] (f : 'a -> 'b -> 'c) l:
 map2 f [] l = [].
proof.
rewrite -size_eq0 size_map2 /=; smt(size_ge0).
qed.

lemma take_map2 ['a 'b 'c] (f:'a -> 'b -> 'c) n l1 l2:
 take n (JUtils.map2 f l1 l2) = JUtils.map2 f (take n l1) (take n l2).
proof.
elim: l1 l2 n => [|x xs IH] [|y ys] n //=; case:(n<=0) => // E.
by rewrite IH.
qed.

lemma drop_map2 ['a 'b 'c] (f:'a -> 'b -> 'c) n l1 l2:
 drop n (JUtils.map2 f l1 l2) = JUtils.map2 f (drop n l1) (drop n l2).
proof.
elim: l1 l2 n => [|x xs IH] [|y ys] n //=; case:(n<=0) => // E.
  by case: (drop (n - 1) ys) => [|? ?]. 
 by case: (drop (n - 1) xs) => [|? ?]. 
by rewrite IH.
qed.

lemma map2_nseq0r ['a 'b] (f:'a -> 'b -> 'a) x0 n l:
 size l = n =>
 (forall y, f y x0 = y) =>
 JUtils.map2 f l (nseq n x0) = l.
proof.
elim/natind: n l.
 move=> n Hn l Hl H.
 have E: n=0 by smt(size_ge0).
 by move: Hl; rewrite E size_eq0 nseq0 => ->.
move=> n Hn IH [|x xs] //=; first smt().
by move=> Hsz H; rewrite nseqS //= H IH /#.
qed.


(* TO JWord *)
from Jasmin require import JWord.
import Ring.IntID.

lemma W8_bits2w_nil:
 W8.bits2w [] = W8.zero.
proof. by apply W8.ext_eq => i Hi; rewrite /bits2w initiE //=. qed.

(* slightly more general version of W8.bits2K *)
lemma W8_bits2wK' l:
 size l <= 8 =>
 W8.w2bits (W8.bits2w l) = l ++ nseq (8 - size l) false.
proof.
move=> H; apply (eq_from_nth false).
 by rewrite size_w2bits size_cat size_nseq; smt(size_ge0).
move=> i; rewrite size_w2bits => Hi.
rewrite get_w2bits get_bits2w 1:// nth_cat.
case: (i < size l) => C //.
case: ((i - size l) < (8 - size l)) => C2.
 by rewrite !nth_nseq 1:/# nth_out /#.
smt(nth_out).
qed.

lemma W8_bits2w_cat_nseq0 bs n:
 W8.bits2w (bs ++ nseq n false)
 = W8.bits2w bs.
proof.
apply W8.ext_eq => i Hi.
rewrite /bits2w !initiE //= nth_cat.
case: (i < size bs) => C //.
rewrite !nth_nseq_if nth_out; smt(size_ge0).
qed.

lemma W64_bits2w_nil:
 W64.bits2w [] = W64.zero.
proof. by apply W64.ext_eq => i Hi; rewrite /bits2w initiE //=. qed.

lemma W64_bits2w_nseq0 n:
 W64.bits2w (nseq n false)
 = W64.zero.
proof.
apply W64.ext_eq => i Hi.
by rewrite /bits2w initiE //= nth_nseq_if /#.
qed.

lemma W64_bits2wK' l:
 size l <= 64 =>
 W64.w2bits (W64.bits2w l) = l ++ nseq (64 - size l) false.
proof.
move=> H; apply (eq_from_nth false).
 by rewrite size_w2bits size_cat size_nseq; smt(size_ge0).
move=> i; rewrite size_w2bits => Hi.
rewrite get_w2bits get_bits2w 1:// nth_cat.
case: (i < size l) => C //.
case: ((i - size l) < (64 - size l)) => C2.
 by rewrite !nth_nseq 1:/# nth_out /#.
smt(nth_out).
qed.

lemma W64_bits2w_cat_nseq0 bs n:
 W64.bits2w (bs ++ nseq n false)
 = W64.bits2w bs.
proof.
apply W64.ext_eq => i Hi.
rewrite /bits2w !initiE //= nth_cat.
case: (i < size bs) => C //.
rewrite !nth_nseq_if nth_out; smt(size_ge0).
qed.

lemma W8u8_to_listK w: pack8 (W8u8.to_list w) = w.
proof.
apply W64.ext_eq => k Hk.
rewrite -(W8u8.unpack8K w); congr; congr.
rewrite of_listE unpack8E; apply W8u8.Pack.all_eq_eq.
by rewrite /all_eq /=.
qed.

lemma W8u8_to_list_pack8 l: 
 size l <= 8 => W8u8.to_list (W8u8.pack8 l) = l ++ nseq (8-size l) W8.zero.
proof.
move=> Hl; apply (eq_from_nth W8.zero).
 by rewrite /= size_cat size_nseq /#.
move => i Hi; rewrite /= in Hi.
have: (i \in iotared 0 8) by smt().
move: {Hi} i; rewrite -allP /=.
rewrite !W8u8.pack8bE // !get_of_list //.
by rewrite !nth_cat; smt(nth_nseq nth_out).
qed.

lemma W8u8_pack8_nil: W8u8.pack8 [] = W64.zero.
proof.
apply W64.ext_eq => k Hk.
by rewrite pack8E initiE //= get_of_list 1:/# /=.
qed.

lemma W8u8_to_listE (w: W64.t):
 W8u8.to_list w = W8u8.Pack.to_list (unpack8 w).
proof.
by rewrite W8u8.unpack8E W8u8.Pack.to_listE /mkseq -iotaredE /=.
qed.

lemma W8u8_unpack8_inj: injective W8u8.unpack8.
proof.
move=> w1 w2.
rewrite !unpack8E => E.
apply W64.ext_eq => k Hk.
rewrite !get_bits8 1..2://; congr.
have /= <-:= W8u8.Pack.initiE (fun (i : int) => w1 \bits8 i) (k%/8) _.
 smt().
by rewrite E W8u8.Pack.initiE /#.
qed.

lemma W8u8_to_list_inj:
 injective W8u8.to_list.
proof.
by move=> w1 w2; rewrite !W8u8_to_listE => /W8u8.Pack.to_list_inj /W8u8_unpack8_inj.
qed.

(*
(** sets a specific byte of a 64-bit word *)
op w64_set_u8 (w:W64.t, pos: int, x: W8.t): W64.t =
 pack8_t (unpack8 w).[pos <- x].

op w64_xor_u8 (w: W64.t, pos: int, x: W8.t): W64.t =
 let w8u8 = unpack8 w in pack8_t w8u8.[pos <- w8u8.[pos] `^` x].
*)

lemma W64_rol0 (w: W64.t):
 w `|<<<|` 0 = w.
proof.
apply W64.ext_eq => i Hi.
by rewrite rolE /= !initiE //= /#.
qed.

lemma W8_to_uint_set (w:W8.t) i b:
 0 <= i < 8 =>
 to_uint w.[i <- b]
 = to_uint w + (b2i b - b2i w.[i]) * 2^i.
proof.
(* proof by evaluation 
move=> Hi.
rewrite !to_uint_bits /bits /mkseq -iotaredE /=.
rewrite  /bs2int /big /range -iotaredE /predT /=.
have: (i \in iota_ 0 8) by smt(mem_iota).
by move: {Hi} i; rewrite -allP -iotaredE /= /#.
*)
(* proof avoiding evaluation... *)
move=> Hi; rewrite !to_uint_bits /bs2int.
have L: forall w, W8.bits w 0 W8.size = w2bits w.
 by rewrite /bits /w2bits /#.
rewrite !L.
rewrite (StdBigop.Bigint.BIA.bigD1_cond _ _ _ i) //. 
  by rewrite size_w2bits mem_range.
 by apply range_uniq.
rewrite addrC eq_sym.
rewrite (StdBigop.Bigint.BIA.bigD1_cond _ _ _ i) //=. 
  by rewrite mem_range.
 by apply range_uniq.
rewrite -addrA addrC -addrA; congr.
apply StdBigop.Bigint.BIA.eq_bigr. 
 move => k; rewrite /predI /predT /predC1 /= => Hk.
 by rewrite get_setE //= Hk //=.
by rewrite get_setE //=; ring.
qed.

lemma W64_to_uint_set (w:W64.t) i b:
 0 <= i < 64 =>
 to_uint w.[i <- b]
 = to_uint w + (b2i b - b2i w.[i]) * 2^i.
proof.
(* proof avoiding evaluation... *)
move=> Hi; rewrite !to_uint_bits /bs2int.
have L: forall w, W64.bits w 0 W64.size = w2bits w.
 by rewrite /bits /w2bits /#.
rewrite !L.
rewrite (StdBigop.Bigint.BIA.bigD1_cond _ _ _ i) //. 
  by rewrite size_w2bits mem_range.
 by apply range_uniq.
rewrite addrC eq_sym.
rewrite (StdBigop.Bigint.BIA.bigD1_cond _ _ _ i) //=. 
  by rewrite mem_range.
 by apply range_uniq.
rewrite -addrA addrC -addrA; congr.
apply StdBigop.Bigint.BIA.eq_bigr. 
 move => k; rewrite /predI /predT /predC1 /= => Hk.
 by rewrite get_setE //= Hk //=.
by rewrite get_setE //=; ring.
qed.

(* end JWord*)

