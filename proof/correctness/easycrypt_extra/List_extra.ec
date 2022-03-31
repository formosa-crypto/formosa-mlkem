require import AllCore StdOrder List Ring Int IntDiv.
(*---*) import IntOrder.
require import Ring_extra IntDiv_extra.

(*-----------------------------------------------------------------------------*)

lemma all_predI p1 p2 (s : 'a list): all (predI p1 p2) s = (all p1 s /\ all p2 s).
proof. by elim: s => //= x s ->; rewrite /predI /=; case: (p1 x); case (p2 x). qed.


(*-----------------------------------------------------------------------------*)

lemma mem_count ['a] x (s : 'a list) : (x \in s) <=> (0 < count (pred1 x) s).
proof.
  elim: s => //= hs ts IHs; rewrite /b2i {1}/pred1 (eq_sym x).
  by case (hs = x) => /= _ //; rewrite addrC ltzS count_ge0.
qed.


(*-----------------------------------------------------------------------------*)

(*TODO: should be called mkseqSr, and the following one mkseqS.*)
(* print mkseqS. *)

lemma mkseqSr ['a] (f : int -> 'a) n : 0 <= n => mkseq f (n + 1) = f 0 :: mkseq (f \o ((+)%Int 1)) n.
proof. by move => le0n; rewrite /mkseq iotaS //= map_comp -iota_addl. qed.

lemma mkseq_nseq ['a] n (x : 'a) :
  mkseq (fun _ => x) n = nseq n x.
proof.
  case (0 <= n) => [le0n|/ltzNge/ltzW len0]; last by rewrite mkseq0_le // nseq0_le.
  elim n le0n => [|n le0n]; first by rewrite mkseq0 nseq0.
  by rewrite nseqSr // mkseqS // => ->.
qed.


(*-----------------------------------------------------------------------------*)

lemma foldr_comp ['a, 'b, 'c] (f1 : 'b -> 'a -> 'a) (f2 : 'c -> 'b) z s : foldr (f1 \o f2) z s = foldr f1 z (map f2 s).
proof. by elim s => //= hs ts ->; rewrite /(\o). qed.

lemma eq_foldr ['a, 'b] (f1 f2 : 'a -> 'b -> 'b) z1 z2 s1 s2 :
  (forall x , f1 x = f2 x) =>
  z1 = z2 =>
  s1 = s2 =>
  foldr f1 z1 s1 = foldr f2 z2 s2.
proof. by move => Heq <<- <<-; elim s1 => //= hs1 ts1 ->; rewrite Heq. qed.

lemma eq_in_foldr ['a, 'b] (f1 f2 : 'a -> 'b -> 'b) z1 z2 s1 s2 :
  (forall x,  x \in s1 => f1 x = f2 x) =>
  z1 = z2 =>
  s1 = s2 =>
  foldr f1 z1 s1 = foldr f2 z2 s2.
proof. by move => Heq <<- <<-; elim s1 Heq => //= hs1 ts1 IHs1 Heq; rewrite IHs1 => [x Hin|]; rewrite Heq // Hin. qed.

lemma foldr_zip_nseq ['a,'b,'c] (f : 'a -> 'b -> 'c -> 'c) x z s :
  foldr (f x) z s = foldr (fun p => f (fst p) (snd p)) z (zip (nseq (size s) x) s).
proof.
  elim s => [|hs ts IHs] /=; first by rewrite nseq0.
  by rewrite addrC nseqS ?size_ge0 //= IHs.
qed.

(*TODO: why is it not using left_commutative? Modify.*)
(* print foldr_perm. *)

op left_commutative_in ['b 'a] o (z : 'b) (s : 'a list) =
  forall x y ,
    x \in s =>
    y \in s =>
    o x (o y z) = o y (o x z).

lemma foldr_perm_in ['b 'a] o (s1 s2 : 'a list) :
  (forall (z : 'b) , left_commutative_in o z s1) =>
  perm_eq s1 s2 =>
  (forall (z : 'b) , foldr o z s1 = foldr o z s2).
proof.
  elim: s1 s2 => [|h1 t1 IHs1] s2 Hlci Heqs12 /=.
  + by have -> //: s2 = []; apply/perm_eq_small/perm_eq_sym.
  have/perm_eq_mem/(_ h1) := Heqs12; rewrite mem_head /=.
  move/splitPr => [h2 t2] ->> z; rewrite foldr_cat /=.
  move: Heqs12; rewrite -(cat1s h1 t2) catA perm_eq_sym.
  rewrite perm_catCA /= perm_cons perm_eq_sym => Heqs1_.
  move: (IHs1 _ _ Heqs1_); first by move => w a b Has1 Hbs1; apply/Hlci => /=; right.
  move => ->; rewrite foldr_cat; have Heqin:= (perm_eq_mem _ _ Heqs1_).
  have {Heqs1_ Heqin Hlci} Hlci: forall z , left_commutative_in o z (h1 :: h2).
  + by move => w a b /= [->>|Hat1] [->>|Hbt2]; apply/Hlci => //=; right; rewrite Heqin mem_cat; left.
  elim: h2 Hlci => [|x h2 {IHs1} IHs1 Hlci] //=.
  rewrite -IHs1; first by move => w a b /= [->>|Has1] [->>|Hbs1] //; apply/Hlci => //=; rewrite ?Has1 ?Hbs1.
  by rewrite Hlci.
qed.


(*-----------------------------------------------------------------------------*)

lemma rev_drop ['a] n (s : 'a list) :
  0 <= n <= size s =>
  rev (drop n s) = take (size s - n) (rev s).
proof.
  move => [le0n lensizes]; rewrite -(cat_take_drop n s) drop_size_cat.
  + by rewrite size_take //; move: lensizes => [->|->>].
  rewrite rev_cat size_cat size_take // size_drop // ler_maxr ?subr_ge0 // !addrA /=.
  have ->: ((if n < size s then n else size s) = n) by move: lensizes => [->|->>].
  rewrite (addrC n) -(addrA (size _)) /= take_size_cat //.
  by rewrite size_rev size_drop // ler_maxr // subr_ge0.
qed.

lemma drop_mkseq ['a] (f : int -> 'a) k n :
  0 <= k <= n =>
  drop k (mkseq f n) = mkseq (f \o ((+) k)) (n - k).
proof.
  move => [le0k lekn]; move: (mkseq_add f k (n - k) _ _) => //; first by apply subr_ge0.
  by rewrite addrA addrAC /= => ->; rewrite drop_size_cat // size_mkseq ler_maxr.
qed.

lemma rev_take ['a] n (s : 'a list) :
  0 <= n <= size s =>
  rev (take n s) = drop (size s - n) (rev s).
proof.
  move => [? ?]; apply rev_inj; rewrite revK rev_drop.
  + by rewrite size_rev subr_ge0 ler_subl_addr -ler_subl_addl.
  by rewrite revK size_rev opprD opprK addrA.
qed.

lemma take_mkseq ['a] (f : int -> 'a) k n :
  0 <= k <= n =>
  take k (mkseq f n) = mkseq f k.
proof.
  move => [le0k lekn]; move: (mkseq_add f k (n - k) _ _) => //; first by apply subr_ge0.
  by rewrite addrA addrAC /= => ->; rewrite take_size_cat // size_mkseq ler_maxr.
qed.


(*-----------------------------------------------------------------------------*)

lemma perm_eqP_pred1 ['a] (s1 s2 : 'a list) : perm_eq s1 s2 <=> forall (x : 'a), count (pred1 x) s1 = count (pred1 x) s2.
proof.
  rewrite perm_eqP; split => [Heq x|Heq p]; first by apply/Heq.
  elim s1 s2 Heq => [s2 /= Heq|hs1 ts1 IHs1 s2 /= Heq].
  + elim: s2 Heq => //= hs2 ts2 IHs2 Heq.
    move: (Heq hs2); rewrite /b2i /pred1 /= eqz_leq => -[_].
    by rewrite addrC -ltzE ltzNge count_ge0.
  move: IHs1 => /(_ (rem hs1 s2)) => ->.
  + move => x; move: (Heq hs1) (Heq x) => {Heq}.
    rewrite {1}/b2i {1}/pred1 /= => Heqhs1.
    rewrite (count_rem (pred1 x) s2 hs1); last by apply addrI.
    by rewrite mem_count -Heqhs1 addrC ltzS count_ge0.
  move: (Heq hs1) => {Heq}.
  rewrite {1}/b2i {1}/pred1 /= => Heqhs1.
  rewrite (count_rem p s2 hs1) //.
  by rewrite mem_count -Heqhs1 addrC ltzS count_ge0.
qed.


(*-----------------------------------------------------------------------------*)

lemma mem_range_incl (m1 n1 m2 n2 i : int) :
  m2 <= m1 =>
  n1 <= n2 =>
  i \in range m1 n1 =>
  i \in range m2 n2.
proof. by rewrite !mem_range => ? ? [? ?]; split;[apply/(lez_trans m1)|move => _; apply/(ltr_le_trans n1)]. qed.

lemma mem_range_addl (m n x y : int) :
  x + y \in range m n <=> y \in range (m - x) (n - x).
proof. by rewrite !mem_range ler_subl_addl ltr_subr_addl. qed.

lemma mem_range_addr (m n x y : int) :
  x + y \in range m n <=> x \in range (m - y) (n - y).
proof. by rewrite addrC mem_range_addl. qed.

lemma mem_range_add2 (m1 n1 m2 n2 x y : int) :
  x \in range m1 n1 =>
  y \in range m2 n2 =>
  x + y \in range (m1 + m2) (n1 + n2 - 1).
proof. by rewrite !mem_range => -[? ?] [? ?]; rewrite ler_add //= ltr_subr_addl addrA ler_lt_add // lez_add1r. qed.

lemma mem_range_opp (m n x : int) :
  -x \in range m n <=> x \in range (- n + 1) (- m + 1).
proof. by rewrite !mem_range -ltzE ltzS ler_oppr ltr_oppl. qed.

lemma mem_range_subl (m n x y : int) :
  x - y \in range m n <=> y \in range (- n + x + 1) (- m + x + 1).
proof. by rewrite mem_range_addl mem_range_opp !opprD. qed.

lemma mem_range_subr (m n x y : int) :
  x - y \in range m n <=> x \in range (m + y) (n + y).
proof. by rewrite mem_range_addr. qed.

lemma mem_range_mull (m n x y : int) :
  0 < x =>
  x * y \in range m n <=> y \in range (m %\ x) (n %\ x).
proof. by move => lt0x; rewrite !mem_range lez_NdivNRL // ltz_NdivNLR // !(mulrC y). qed.

lemma mem_range_mulr (m n x y : int) :
  0 < y =>
  x * y \in range m n <=> x \in range (m %\ y) (n %\ y).
proof. by rewrite mulrC; apply/mem_range_mull. qed.

lemma mem_range_mod (x y : int) :
  y <> 0 =>
  x %% y \in range 0 `|y|.
proof. by move => neqy0; rewrite mem_range modz_ge0 // ltz_mod. qed.

lemma mem_range_mul (m1 n1 m2 n2 x y : int) :
  0 <= m1 =>
  0 <= m2 =>
  x \in range m1 n1 =>
  y \in range m2 n2 =>
  x * y \in range (m1 * m2) (n1 * n2 - n1 - n2 + 2).
proof.
  rewrite !mem_range => le0m1 le0m2 [lem1x ltxn1] [lem2x ltn2]; split; first by apply ler_pmul.
  move => _; rewrite ltzE -ler_subr_addr /=; move: (ler_pmul x (n1 - 1) y (n2 - 1)).
  by rewrite mulrDl !mulrDr mulNr mulrN /= !addrA => -> //;
  [apply/(lez_trans m1)|apply/(lez_trans m2)|apply/ltzS|apply/ltzS].
qed.

lemma mem_range_add_mul (m n l x y : int) :
  x \in range 0 l =>
  y \in range m n =>
  x + l * y \in range (m * l) (n * l).
proof.
  move => Hx_range Hy_range; rewrite mem_range_addl mem_range_mull; first by apply/(ler_lt_trans x); move/mem_range: Hx_range.
  move: Hy_range; apply/mem_range_incl.
  + rewrite lez_NdivNRL; first by apply/(ler_lt_trans x); move/mem_range: Hx_range.
    by rewrite ler_subl_addr ler_addl; move/mem_range: Hx_range.
  rewrite -ltzS -ltr_subl_addr ltz_NdivNLR; first by apply/(ler_lt_trans x); move/mem_range: Hx_range.
  by rewrite mulrDl mulNr /= ler_lt_sub //; move/mem_range: Hx_range.
qed.

lemma mem_range_add_mul_eq (x1 y1 x2 y2 l : int) :
  x1 \in range 0 l =>
  x2 \in range 0 l =>
  x1 + l * y1 = x2 + l * y2 <=>
  x1 = x2 /\ y1 = y2.
proof.
  move => /mem_range [le0x1 ltx1l] /mem_range [le0x2 ltx2l]; split => [Heq|[->> ->>] //]; split.
  + move: (congr1 (transpose (%%)%IntID l) _ _ Heq) => /=.
    by rewrite !(mulrC l) !modzMDr !pmod_small.
  move: (congr1 (transpose (%/)%IntID l) _ _ Heq) => /=.
  rewrite !(mulrC l) !divzMDr; try by apply/gtr_eqF/(ler_lt_trans x1).
  by rewrite !pdiv_small.
qed.


(*TODO: remove all lemmas below.*)
(*-----------------------------------------------------------------------------*)

lemma range_incl (x min1 max1 min2 max2 : int) :
  min2 <= min1 =>
  max1 <= max2 =>
  x \in range min1 max1 =>
  x \in range min2 max2.
proof. by rewrite !mem_range => ? ? [? ?]; split;[apply/(lez_trans min1)|move => _; apply/(ltr_le_trans max1)]. qed.

lemma range_add (x y min max : int) :
  x \in range min max =>
  x + y \in range (min + y) (max + y).
proof. by rewrite !mem_range => -[? ?]; rewrite ler_add2r ltr_add2r. qed.

lemma add_range (x y min1 max1 min2 max2 : int) :
  x \in range min1 max1 =>
  y \in range min2 max2 =>
  x + y \in range (min1 + min2) (max1 + max2 - 1).
proof. by rewrite !mem_range => -[? ?] [? ?]; rewrite ler_add //= ltr_subr_addl addrA ler_lt_add // lez_add1r. qed.

lemma range_sub (x y min max : int) :
  x \in range min max =>
  y - x \in range (y + 1 - max) (y + 1 - min).
proof. 
  rewrite !mem_range => -[leminx ltxmax].
  rewrite -!addrA ler_add2l ltr_add2l -!(opprB _ 1).
  by rewrite ler_opp2 ltr_opp2 -ltzS /= ltxmax /= ltzE.
qed.

lemma range_mul x m n a :
  0 < a =>
  x \in range m n =>
  x * a \in range (m * a) ((n - 1) * a + 1).
proof. by rewrite !mem_range => le0a [? ?]; rewrite ltzS !ler_pmul2r //; split => // _; rewrite -ltzS. qed.

lemma range_mul_add (x y min max len : int) :
  x \in range min max =>
  y \in range 0 len =>
  x * len + y \in range (min * len) (max * len).
proof.
  move => /mem_range [le_x ltx_] /mem_range [le_y lty_]; apply/mem_range; split => [|_].
  + by apply/ler_paddr => //; apply/ler_wpmul2r => //; apply/ltzW/(ler_lt_trans y).
  move: (ler_lt_add (x * len) ((max - 1) * len) _ _ _ lty_); last by rewrite -mulrD1l.
  apply/ler_wpmul2r; first by apply/ltzW/(ler_lt_trans y).
  by apply/ltzS.
qed.

lemma range_mul_add_eq (x1 y1 x2 y2 len : int) :
  y1 \in range 0 len =>
  y2 \in range 0 len =>
  x1 * len + y1 = x2 * len + y2 <=>
  x1 = x2 /\ y1 = y2.
proof.
  move => /mem_range [le_y1 lty1_] /mem_range [le_y2 lty2_]; split => [Heq|[->> ->>] //]; split.
  + move: (congr1 (transpose (%/)%IntID len) _ _ Heq) => /=.
    rewrite !divzMDl; try by apply/gtr_eqF/(ler_lt_trans y1).
    by rewrite !pdiv_small.
  move: (congr1 (transpose (%%)%IntID len) _ _ Heq) => /=.
  by rewrite !modzMDl !pmod_small.
qed.
