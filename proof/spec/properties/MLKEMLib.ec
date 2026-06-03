require import AllCore FloorCeil IntDiv StdOrder List. 

(**************************************************)
(* Results   needed for compression/decompression *)
(**************************************************)
(**************************************************)
(* Move to ECLib?                                 *)
(**************************************************)

import RField RealOrder.

lemma floorDz (x:int) y:
 floor (x%r + y) = x + floor y.
proof.
rewrite (floorE (x+floor y)) //.
smt(floor_bound).
qed.

lemma le_floorE n x:
 (n <= floor x) = (n%r <= x)
by smt(floor_bound).

lemma floor_ltE x n:
 (floor x < n) = (x < n%r)
by smt(floor_bound).

lemma divz_floor (x y: int):
 0 < y =>
 x %/ y = floor (x%r / y%r).
proof.
move=> gt0.
have ->: x%r / y%r = (x %/ y)%r + (x %% y)%r / y%r.
 by rewrite {1}(divz_eq x y); field; smt(). 
rewrite floorDz.
have ?: 0%r <= (x %% y)%r / y%r < 1%r. 
  rewrite ltr_pdivr_mulr /=; 1: smt().
  split; smt(le_fromint RealOrder.divr_ge0).
by smt(floor_bound).
qed.

lemma modz_floor (x y: int):
 0 < y =>
 x %% y = x - y * floor (x%r / y%r).
proof.
move=> gt0.
rewrite -divz_floor //; smt(divz_eq).
qed.


op frac (x: real) = x - (floor x)%r.

lemma frac_bound x: 0%r <= frac x < 1%r
by smt(floor_bound).

lemma fracDz x n: frac (n%r + x) = frac x
  by have := floorDz n x; rewrite /frac => -> /= /#.

lemma floor_frac_eq x: x = (floor x)%r + frac x
by smt().

lemma frac0_dvdz (m n: int):
 0 < n =>
 frac (m%r / n%r) = 0%r <=> n %| m.
proof. 
move=> ygt0; rewrite dvdzE modz_floor // /frac. 
split; rewrite -divz_floor; 1,3:smt(). 
+ move => H; have -> : n * (m %/ n) = m; last by ring.
  rewrite mulrC -eq_fromint fromintM.
  by have ->: (m %/ n)%r  = m%r / n%r; smt().
move => H.
by have -> : m = n * (m %/ n); smt().
qed.

lemma from_int_frac n: frac n%r = 0%r
by smt(from_int_floor).

lemma frac_halfP x:
 frac x = inv 2%r => frac (2%r*x) = 0%r.
proof.
move => E; rewrite (floor_frac_eq x) /= mulrDr.
by rewrite -fromintM fracDz E divrr // from_int_frac.
qed.

lemma frac_halfN x:
 frac (2%r*x) <> 0%r => frac x <> inv 2%r
by smt(frac_halfP).

lemma frac_div_eq0 (m n: int):
 0 < n =>
 frac (m%r / n%r) = 0%r
 <=> n %| m.
proof.
move=> gt0.
split => H.
 have E: m%r / n%r = (m %/ n)%r.
  rewrite (floor_frac_eq (m%r / n%r)) H/= divz_floor /#.
 have : m%r = (m %/ n)%r * n%r + (m %% n)%r by smt(divz_eq).
 by rewrite -E dvdzE /#.
have : m%r = (m %/ n)%r * n%r + (m %% n)%r.
+ have := divz_eq m n;smt().
rewrite H /= => ->.
rewrite /frac.
have -> : ((m %/ n)%r * n%r / n%r) = (m %/ n)%r by smt().
by have := floorE (m%/n); smt(). 
qed.

lemma frac_inv_gt1 x: 1%r < x => frac (inv x) = inv x.
proof. by move=> H; rewrite /frac; smt(floor_bound). qed.


require import GFq.

lemma round_mono (x y: real):
 x <= y => round x <= round y
by smt(floor_mono).

lemma round_divz x y:
 0 < y => 
 round (x%r / y%r) = (2*x+y) %/ (2*y).
proof.
move=> H; rewrite /round.
have ->: x%r / y%r + inv 2%r = (2* x + y)%r / (2*y)%r.
 rewrite fromintD !fromintM; field; smt().
by rewrite divz_floor /#.
qed.

lemma roundDz (x:int) y:
 round (x%r + y) = x + round y.
proof. by rewrite /round -addrA floorDz. qed.

lemma from_int_round n: round n%r = n.
proof. by rewrite /round (floorE n) /#. qed. 

lemma round_ge0 x: 0%r <= x => 0 <= round x
by smt(floor_bound).

lemma round_bound x:
 x - inv(2%r) < (round x)%r <= x + inv(2%r)
by smt(floor_bound).

lemma le_roundE n x:
 (n <= round x) = (n%r <= x + inv 2%r)
by smt(le_floorE).

lemma round_ltE x n:
 (round x < n) = (x + inv 2%r < n%r)
by smt(floor_ltE).


lemma roundN x:
 frac x <> inv 2%r => round (-x) = -round x.
proof.
move => H.
pose nn := round (-x).
have <-:= floorE (round x) (-nn%r+inv 2%r).
 have [??]:= round_bound (-x).
 have ?: -nn%r < x + inv 2%r by smt().
 have ?: x - inv 2%r <= -nn%r by smt().
 have ?: x - inv 2%r < -nn%r.
  have /#: x - inv 2%r <> -nn%r.
  apply (contra _ (frac x = inv 2%r)).
  move => E.
  have ->: x = (-nn)%r + inv 2%r by smt().
   by rewrite fracDz frac_inv_gt1 /#.
  smt().
 smt(round_bound). 
by rewrite -fromintN floorDz; smt(floorE).
qed.


lemma normP (a epsilon: int):
 `| a | <= epsilon <=> -epsilon <= a <= epsilon
by smt().

(***********************************)
(* Lemmas about distributions for 
   rej sampling proofs.            *)
(***********************************)

require import Distr DList DistrExtra DMap. 

lemma flatten_rcons ['a] (l: 'a list list) x:
 flatten (rcons l x) = flatten l ++ x.
proof.
elim: l => /=.
 by rewrite flatten_cons !flatten_nil cats0.
by move=> y l IH; rewrite !flatten_cons IH catA.
qed.


lemma dlist_mul ['a] (d: 'a distr) (k n: int):
 0 <= k => 0 <= n =>
 dlist d (k*n) = dmap (dlist (dlist d k) n) flatten.
proof.
move=> Hk; elim/natind: n.
 move=> n Hn0 Hn; have ->/=: n=0 by smt().
 by rewrite !dlist0 // dmap_dunit flatten_nil.
move=> n Hn IH _; have->: k*(n+1) = k + k*n by ring.
rewrite dlist_add // 1:/# dlistS //.
rewrite dmap_comp IH // dmap_dprodR dmap_comp /(\o) /=.
apply eq_dmap; move => [xh xt] /=.
by rewrite flatten_cons.
qed.



(* JASMIN ECLIB *)
from Jasmin require import JWord JUtils.

(* JWord.ec *)
import BitEncoding BitChunking BS2Int.
import IntOrder.

lemma W8all_words_uniq: uniq W8.all_words.
proof.
rewrite /W8.all_words map_inj_in_uniq.
 move=> x y; rewrite !mem_iota => /= ?? H.
 have: x %% W8.modulus = y %% W8.modulus.
  by rewrite -!W8.of_uintK H.
 by rewrite !modz_small /#.
by apply iota_uniq.
qed.

lemma dword1E w:
 mu1 W8.dword w = inv (W8.modulus%r).
proof.
have ?:= W8all_words_uniq.
rewrite /W8.dword /duniform undup_id //.
rewrite MRat.dratE count_uniq_mem //.
rewrite W8.all_wordsP b2i1.
rewrite /W8.all_words size_map size_iota /=.
by rewrite ler_maxr.
qed.

lemma dword1E_bits w:
 mu1 (dmap (dlist {0,1} W8.size) W8.bits2w) w = inv (W8.modulus)%r.
proof.
rewrite dmap1E /(\o) /=.
rewrite (mu_eq_support _ _ (pred1 (w2bits w))).
 move=> l; rewrite supp_dlist //=; move=> [E _].
 rewrite /pred1.
 apply eqboolP; split => H.
  by rewrite -H W8.bits2wK.
 by rewrite H W8.w2bitsK.
rewrite dlist1E // W8.size_w2bits /=.
rewrite (StdBigop.Bigreal.BRM.eq_bigr _ _ (fun _=>inv 2%r)).
 by move=> i _ /=; rewrite DBool.dbool1E /#. 
rewrite StdBigop.Bigreal.mulr_const.
rewrite W8.size_w2bits.
by rewrite RealOrder.Domain.exprVn // fromintXn //.
qed.

lemma dword_bits:
 W8.dword = dmap (dlist {0,1} 8) W8.bits2w.
proof.
apply eq_distr => w.
by rewrite dword1E dword1E_bits.
qed.

require import DInterval.
lemma dword_ibits:
 W8.dword = dmap (dbits 8) W8.of_int.
proof.
apply eq_distr => w.
rewrite dword1E dmap1E /(\o) /=.
rewrite (mu_eq_support _ _ (pred1 (to_uint w))).
 move=> x; rewrite supp_dinter //= => E.
 rewrite /pred1.
 apply eqboolP; split => H.
  by rewrite -H W8.of_uintK modz_small /#.
 by rewrite H W8.to_uintK.
rewrite dinter1E.
rewrite (_: 0 <= to_uint w <= 255) //=.
by move: (W8.to_uint_cmp w) => /= /#.
qed.

(* JArray.ec *)
from JazzEC require import Array256 Array32 Array64 Array128 Array168.
(* useful for loop-invariants: relating arrays and lists... *)
op a256l ['a] (a:'a Array256.t) (l:'a list) k: bool = size l = k /\ 
 forall i, 0 <= i < k => a.[i] = nth witness l i.

lemma a256l_rcons ['a] a l (x:'a) k:
 0 <= k < 256 =>
 a256l a l k => 
 a256l a.[k <- x] (rcons l x) (k+1).
proof.
move=> Hk; rewrite /a256l; move=> [Hsize H].
rewrite size_rcons Hsize; split => // i Hi.
rewrite get_setE // nth_rcons Hsize.
case: (i=k) => E.
 by rewrite E.
by rewrite H /#.
qed.

lemma a256l_of_list ['a] a (l: 'a list):
 a256l a l 256 =>
 a = Array256.of_list witness l.
proof.
move=> [Hsize H].
apply Array256.ext_eq => i Hi.
by rewrite H // get_of_list //.
qed.



op darray32 ['a] (d: 'a distr): ('a Array32.t) distr =
 dmap (dlist d 32) (Array32.of_list witness).

lemma darray32_ll ['a] (d: 'a distr):
 is_lossless d => is_lossless (darray32 d).
proof.  by rewrite /darray32 => ?; apply dmap_ll; apply dlist_ll. qed.

(*
module Sample_darray32 = {
 proc sample(d: W8.t distr) = {
  var w;
  w <$ darray32 d;
  return w;
 }
 proc sampleL(d: W8.t distr) = {
  var l;
   l <$ dlist d 32;
   return Array32.of_list witness l;
  }
}.
*)

clone DMapSampling as MSa32 with
 type t1 <- W8.t list,
 type t2 <- W8.t Array32.t.

clone DMapSampling as MSa64 with
 type t1 <- W8.t list,
 type t2 <- W8.t Array64.t.

clone DProd.ProdSampling as PSlw with
 type t1 <- W8.t list,
 type t2 <- W8.t list.

clone DMapSampling as MSll with
 type t1 <- W8.t list * W8.t list,
 type t2 <- W8.t list.

op darray64 ['a] (d: 'a distr): ('a Array64.t) distr =
 dmap (dlist d 64) (Array64.of_list witness).

lemma darray64_ll ['a] (d: 'a distr):
 is_lossless d => is_lossless (darray64 d).
proof.  by rewrite /darray64 => ?; apply dmap_ll; apply dlist_ll. qed.

module Sample_64_2x32 = {
 proc sample() = {
  var w;
  w <$ darray64 W8.dword;
  return w;
 }
 proc sample2() = {
  var w1, w2;
  w1 <$ darray32 W8.dword;
  w2 <$ darray32 W8.dword;
  return (w1, w2);
 }
}.

lemma aux_64_32x32 (l1 l2: W8.t list) a:
 size l1 = 32 => 
 a = Array64.of_list witness (l1++l2) =>
 Array32.init (fun i => a.[i]) = Array32.of_list witness l1 /\
 Array32.init (fun i => a.[32+i]) = Array32.of_list witness l2.
proof.
move=> Hl1 ->.
have X: forall (l: W8.t list), Array32.of_list witness l = Array32.init (fun i => nth witness l i).
 move=> l; rewrite tP => i Hi.
 by rewrite get_of_list // initE Hi.
rewrite !X !tP.
split => i Hi;  rewrite !initE !Hi /= get_of_list 1:/# nth_cat.
 by have ->:i < size l1 by smt().
by have ->/#:! 32+i < size l1 by smt().
qed.

equiv sample_64_2x32_eq:
 Sample_64_2x32.sample ~ Sample_64_2x32.sample2:
 true ==> res{2}.`1 = Array32.init (fun i=>res{1}.[i]) /\ res{2}.`2 = Array32.init (fun i=>res{1}.[i+32]).
proof.
proc.
transitivity {1} { w <@ MSa64.S.sample(dlist W8.dword 64, Array64.of_list witness); }
 ( true ==> ={w} )
 ( true ==> w1{2} = Array32.init (fun (i : int) => w{1}.[i]) /\
            w2{2} = Array32.init (fun (i : int) => w{1}.[i+32]) ) => //=.
- by inline*; auto.
transitivity {1} { w <@ MSa64.S.map(dlist W8.dword 64, Array64.of_list witness); }
 ( true ==> ={w} )
 ( true ==> w1{2} = Array32.init (fun (i : int) => w{1}.[i]) /\
            w2{2} = Array32.init (fun (i : int) => w{1}.[i+32]) ) => //=.
- by call MSa64.sample.
transitivity {2} 
 { w1 <@ MSa32.S.sample(dlist W8.dword 32, Array32.of_list witness); 
   w2 <@ MSa32.S.sample(dlist W8.dword 32, Array32.of_list witness); }
 ( true ==> w1{2} = Array32.init (fun (i : int) => w{1}.[i]) /\
            w2{2} = Array32.init (fun (i : int) => w{1}.[i+32]) )
 ( true ==> ={w1, w2} ) => //=; last first.
- by inline*; auto.
transitivity {2} 
 { w1 <@ MSa32.S.map(dlist W8.dword 32, Array32.of_list witness); 
   w2 <@ MSa32.S.map(dlist W8.dword 32, Array32.of_list witness); }
 ( true ==> w1{2} = Array32.init (fun (i : int) => w{1}.[i]) /\
            w2{2} = Array32.init (fun (i : int) => w{1}.[i+32]) )
 ( true ==> ={w1, w2} ) => //=; last first.
- by symmetry; do 2! call MSa32.sample.
inline*.
swap{1} 2 1; swap {2} 6 1; swap {2} 2 1; swap {2} [3..4] 2; wp.
conseq (_:_ ==> size r1{2}=32 /\ r1{1}=r1{2}++r10{2}).
 move=> /> l1 l2 H.
 move: (aux_64_32x32 l1 l2 (of_list witness (l1 ++ l2))%Array64 H).
 by move => [<- <-] /#.
transitivity {2} { (r1,r10) <@ PSlw.S.sample2(dlist W8.dword 32, dlist W8.dword 32); }
 ( true ==> size r1{2} = 32 /\  r1{1} = r1{2} ++ r10{2} )
 ( true ==> ={r1, r10} ) => //=; last by inline*; auto.
transitivity {2} { (r1,r10) <@ PSlw.S.sample(dlist W8.dword 32, dlist W8.dword 32); }
 ( true ==> size r1{2} = 32 /\  r1{1} = r1{2} ++ r10{2} )
 ( true ==> ={r1, r10} ) => //=; last by call PSlw.sample_sample2.
inline*; wp; simplify.
transitivity {1} { r1 <@ MSll.S.sample(dlist W8.dword 32 `*` dlist W8.dword 32, fun ll:_*_=>ll.`1 ++ ll.`2); }
 ( true ==> ={r1} )
 ( true ==> size r{2}.`1 = 32 /\ r1{1} = r{2}.`1 ++ r{2}.`2 ) => //=.
- by inline*; auto => />; rewrite (_:64=32+32) 1:/# dlist_add /#.
transitivity {1} { r1 <@ MSll.S.map(dlist W8.dword 32 `*` dlist W8.dword 32, fun ll:_*_=>ll.`1 ++ ll.`2); }
 ( true ==> ={r1} )
 ( true ==> size r{2}.`1 = 32 /\ r1{1} = r{2}.`1 ++ r{2}.`2 ) => //=; first by call MSll.sample.
by inline*; auto => /> ll; rewrite supp_dprod supp_dlist /#.
qed.

op darray128 ['a] (d: 'a distr): ('a Array128.t) distr =
 dmap (dlist d 128) (Array128.of_list witness).

(* proof-templates (to be included in the DArray theory...) *)
lemma darray128_ll ['a] (d: 'a distr):
 is_lossless d => is_lossless (darray128 d).
proof. by rewrite /darray128 => ?; apply dmap_ll; apply dlist_ll. qed.

lemma supp_darray128 ['a] (d: 'a distr) a:
 a \in darray128 d <=> all (support d) (Array128.to_list a).
proof.
rewrite /darray128 supp_dmap; split.
 move=> [x]; rewrite supp_dlist // => /> *.
 by rewrite Array128.of_listK // /#.
move=> H; exists (to_list a); rewrite supp_dlist // H Array128.size_to_list /=.
by rewrite Array128.to_listK.
qed.

lemma darray128_uni ['a] (d: 'a distr):
 is_uniform d => is_uniform (darray128 d).
proof.
rewrite /darray128=> ?; apply dmap_uni_in_inj.
 move=> x y; rewrite !supp_dlist //; move => [? _] [? _] H.
 by rewrite -(Array128.of_listK witness x) // H of_listK.
by apply dlist_uni.
qed.

lemma darray128_fu ['a] (d: 'a distr):
 is_full d => is_full (darray128 d).
proof.
rewrite /darray128 => H; apply dmap_fu_in.
move=> x; exists (to_list x); rewrite to_listK supp_dlist //=.
rewrite Array128.size_to_list /= allP => *.
by apply H.
qed.


op darray168 ['a] (d: 'a distr): ('a Array168.t) distr =
 dmap (dlist d 168) (Array168.of_list witness).

(* ... *)


op darray256 ['a] (d: 'a distr): ('a Array256.t) distr =
 dmap (dlist d 256) (Array256.of_list witness).

lemma darray256_ll ['a] (d: 'a distr):
 is_lossless d => is_lossless (darray256 d).
proof.  by rewrite /darray256 => ?; apply dmap_ll; apply dlist_ll. qed.

lemma supp_darray256 ['a] (d: 'a distr) a:
 a \in darray256 d <=> all (support d) (Array256.to_list a).
proof.
rewrite /darray256 supp_dmap; split.
 move=> [x]; rewrite supp_dlist // => /> *.
 by rewrite Array256.of_listK // /#.
move=> H; exists (to_list a); rewrite supp_dlist // H Array256.size_to_list /=.
by rewrite Array256.to_listK.
qed.

lemma darray256_uni ['a] (d: 'a distr):
 is_uniform d => is_uniform (darray256 d).
proof.
rewrite /darray256=> ?; apply dmap_uni_in_inj.
 move=> x y; rewrite !supp_dlist //; move => [? _] [? _] H.
 by rewrite -(Array256.of_listK witness x) // H of_listK.
by apply dlist_uni.
qed.

lemma darray256_fu ['a] (d: 'a distr):
 is_full d => is_full (darray256 d).
proof.
rewrite /darray256 => H; apply dmap_fu_in.
move=> x; exists (to_list x); rewrite to_listK supp_dlist //=.
rewrite Array256.size_to_list /= allP => *.
by apply H.
qed.




