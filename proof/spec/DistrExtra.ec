require import AllCore List StdBigop StdOrder IntDiv Distr.
(*---*) import IntOrder Bigint MUniform Range.



(* ? Distr.ec *)

import Bigreal Bigreal.BRA.

lemma dlet1Efin ['a, 'b] (d : 'a distr) (f : 'a -> 'b distr) (b : 'b) s:
  Finite.is_finite_for (support d) s =>
  mu1 (dlet d f) b
  = BRA.big predT (fun (a : 'a) => mu1 d a * mu1 (f a) b) s.
proof.
move=> [Hun H].
rewrite dlet1E (RealSeries.sumE_fin _ s) //= => x.
rewrite RField.unitrM; move=> [??].
apply (H x); smt(ge0_mu1).
qed.

lemma take_rcons ['a] n (l: 'a list) x:
 take n (rcons l x) = if n <= size l then take n l else rcons l x.
proof.
rewrite -cats1 take_cat.
case: (n < size l) => C1.
 by rewrite (_:n<=size l) 1:/#.
case: (n=size l) => C2.
 by rewrite (_:n-size l<=0) 1:/# (_:n<=size l) 1:/# /= C2 take_size cats0.
by rewrite (_:!n-size l<=0) 1:/# (_:!n<=size l) 1:/#.
qed.

(* upgrade DList? *)
require import DList.
abstract theory ProgramDList.
  type t.

  module Sample = {
    proc sample(d: t distr, n:int): t list = {
      var r;

      r <$ dlist d n;
      return r;
    }
  }.

  module SampleCons = {
    proc sample(d: t distr, n:int): t list = {
      var r, rs;

      rs <$ dlist d (n - 1);
      r  <$ d;
      return r::rs;
    }
  }.

  module Loop = {
    proc sample(d: t distr, n:int): t list = {
      var i, r, l;

      i <- 0;
      l <- [];
      while (i < n) {
        r <$ d;
        l <- r :: l;
        i <- i + 1;
      }
      return l;
    }
  }.

  module LoopSnoc = {
    proc sample(d: t distr, n:int): t list = {
      var i, r, l;

      i <- 0;
      l <- [];
      while (i < n) {
        r <$ d;
        l <- l ++ [r];
        i <- i + 1;
      }
      return l;
    }
  }.

lemma pr_Sample (_d: t distr) _n &m xs:
 Pr[Sample.sample(_d,_n) @ &m: res = xs]
 = mu (dlist _d _n) (pred1 xs).
  proof. by byphoare (_: d = _d /\ n = _n ==> res = xs)=> //=; proc; rnd. qed.

equiv Sample_SampleCons_eq:
 Sample.sample ~ SampleCons.sample: 
  0 < n{1} /\ ={d,n} ==> ={res}.
proof.
bypr (res{1}) (res{2})=> //= &1 &2 xs [lt0_n] [<- <-].
rewrite (pr_Sample d{1} n{1} &1 xs); case (size xs = n{1})=> [En|].
case xs En lt0_n=> [|x xs E lt0_n]; 1:smt().
 rewrite -E dlistS1E.
 byphoare (_: d=d{1} /\ n = size xs + 1 ==> x::xs = res)=> //=; last by smt().
 proc; simplify.
 seq 1: (rs = xs) (mu (dlist d{1} (size xs)) (pred1 xs)) (mu d (pred1 x)) _ 0%r.
 + done.
 + by rnd (pred1 xs); skip; smt().
 + by rnd (pred1 x); skip; smt().
 + by hoare; auto; smt().
 + smt().
move=> len_xs; rewrite dlist1E 1:/# (_: n{1} <> size xs) /= 1:/#.
byphoare (_: n = n{1} ==> xs = res)=> //=; hoare.
by proc; auto => /> &m l; rewrite supp_dlist /#.
qed.

equiv Sample_Loop_eq: Sample.sample ~ Loop.sample: ={d,n} ==> ={res}.
proof.
proc*; exists* n{1}; elim* => _n.
move: (eq_refl _n); case (_n <= 0)=> //= h.
 by inline *; rcondf{2} 5;auto;smt (supp_dlist0 weight_dlist0).
have {h} h: 0 <= _n by smt ().
call (_: _n = n{1} /\ ={d,n} ==> ={res})=> //=.
elim _n h=> //= [|_n le0_n ih].
 proc; rcondf{2} 3; auto => /> *; split.
  smt(dlist0 dunit_ll).
 smt(supp_dlist size_eq0).
case (_n = 0)=> [-> | h].
 proc; rcondt{2} 3; 1:(by auto); rcondf{2} 6; 1:by auto.
 wp; rnd (fun x => head witness x) (fun x => [x]).
 auto => /> &1; split => [ rR ? | _ rL ].
  by rewrite dlist1E //= big_consT big_nil.
 by rewrite supp_dlist //;case rL => //=; smt (size_eq0).
transitivity SampleCons.sample
             (={d,n} /\ 0 < n{1} ==> ={res})
             (_n + 1 = n{1} /\ ={d,n} /\ 0 < n{1} ==> ={res})=> //=; 1:smt().
 by conseq Sample_SampleCons_eq.
proc; splitwhile{2} 3: (i < n - 1).
rcondt{2} 4; 1:by auto; while (i < n); auto; smt().
rcondf{2} 7; 1:by auto; while (i < n); auto; smt().
wp; rnd; simplify.
transitivity{1} { rs <@ Sample.sample(d, n - 1); }
                (={d,n} /\ 0 < n{1} ==> ={d,rs})
                (_n + 1 = n{1} /\ ={d,n} /\ 0 < n{1} ==> ={d} /\ rs{1} = l{2})=> //=; 1:smt().
 by inline *; auto.
transitivity{1} { rs <@ Loop.sample(d, n - 1); }
                (_n + 1 = n{1} /\ ={d,n} /\ 0 < n{1} ==> ={d,rs})
                (={d,n} /\ 0 < n{1} ==> ={d} /\ rs{1} = l{2})=> //=; 1:smt().
 by call ih; auto; smt().
inline *; wp; while (={i, d, n, l} /\ d0{1}=d{1} /\ n0{1} = n{1} - 1 /\ 0 < n{1}); auto; smt().
qed.

equiv Sample_LoopSnoc_eq: Sample.sample ~ LoopSnoc.sample: ={d,n} ==> ={res}.
proof.
proc*. transitivity{1} { r <@ Sample.sample(d,n);
                         r <- rev r;            }
                       (={d,n} ==> ={r})
                       (={d,n} ==> ={r})=> //=; 1:smt().
 inline *; wp; rnd rev; auto.
 move=> /> &2; split=> /= [|t {t}]; 1:smt(revK).
 split.
  move=> r; rewrite -/(support _ _); case (0 <= n{2})=> sign_n.
   rewrite supp_dlist 1://; move => [<-_].
   rewrite -{2}size_rev.
   apply dlist_perm_eq.
   by apply perm_eq_rev.
  rewrite dlist0 1:/# supp_dunit => -> /=.
  by rewrite rev_nil !dunit1E.
 by move=> H l*; rewrite revK /#.
transitivity{1} { r <@ Loop.sample(d,n);
                  r <- rev r;          }
                (={d,n} ==> ={r})
                (={d,n} ==> ={r})=> //=.
  smt().
 by wp; call Sample_Loop_eq.
inline *; wp. while (={i, d0, n0} /\ rev l{1} = l{2}); auto.
by move=> /> *; rewrite rev_cons cats1.
qed.

end ProgramDList.




(* ? DBits.ec *)
require import DInterval.

abbrev dbits n = dinter 0 (2^n - 1).

lemma dbits0: dbits 0 = dunit 0.
proof.
rewrite eq_distr => x.
by rewrite dinter1E dunit1E expr0 /#.
qed.

lemma dprod_dbits k1 k2:
  0 <= k1 => 0 <= k2 =>
  dbits k1 `*` dbits k2
  = dmap (dbits (k1+k2)) (fun x => (x%%2^k1, x%/2^k1)).
proof.
move=> Hk1 Hk2.
rewrite eq_distr; move => [x1 x2].
rewrite dprod1E dmap1E /(\o) !dinterE  /(=) /=.
have L: forall x N, size (filter (pred1 x) (range 0 N)) = b2i (0 <= x < N).
 move=> x N; rewrite size_filter count_uniq_mem.
  by apply range_uniq. 
 by rewrite mem_range.
rewrite !L size_filter; clear L.
rewrite (eq_in_count _ (fun x => x=(x2*2^k1+x1) /\ 0 <= x1 < 2^k1)).
 move => x /mem_range [Hx1 Hx2] /=.
 rewrite /pred1 /=; split.
  move => [<- <-] //.
  rewrite -divz_eq /=.
  smt(modz_ge0 ltz_mod expr_gt0).
 move => [-> [??]]; split.
  by rewrite addrC modzMDr modz_small /#.
 by rewrite addrC divzMDr 1:/# divz_small /#.
rewrite !ler_maxr; first 3 by smt(expr_gt0).
rewrite -!fromintM -exprD_nneg; first 2 by smt(expr_gt0).
congr.
have ->: forall (y:int) b l, uniq l => count (fun x => (x=y) /\ b) l = b2i (y \in l /\ b).
  move=> y b; case: b => Hb /=.
   by elim => //= x xs IH [Hxs Hun]; rewrite IH /#.
  by move=> H Hun; rewrite count_pred0 b2i0.
 by apply range_uniq.
case: (0 <= x1 && x1 < 2 ^ k1) => Hx1.
 rewrite !b2i1 /= mem_range; congr; congr.
 apply eq_iff; split => H.
  split; first smt(@IntOrder).
  move=>_; rewrite exprD_nneg 1..2:/#.
  have ->: 2 ^ k1 * 2 ^ k2 = 2 ^ k2 * 2 ^ k1 by smt().
  have ?: x2 * 2 ^ k1 < 2 ^ k2 * 2 ^ k1 by smt(@IntOrder).
  have  : x2 * 2 ^ k1 + 1*2^k1 <= 2 ^ k2 * 2 ^ k1; last by smt().
  by rewrite -Ring.IntID.mulrDl /#.
 split; 1: by smt().
 by move => *; smt(exprD_nneg expr_gt0).
by rewrite !b2i0.
qed.

lemma dbitsD k1 k2:
 0 <= k1 => 0 <= k2 =>
 dbits (k1+k2)
 = dmap (dbits k1 `*` dbits k2) (fun x:int*int=>x.`1 + x.`2 * 2^k1).
proof.
move=> Hk1 Hk2.
rewrite dprod_dbits // dmap_comp /(\o) //=.
by rewrite dmap_id_eq_in //=; smt(divz_eq).
qed.

require import BitEncoding DBool.
from Jasmin require JUtils.

import BitEncoding BitChunking BS2Int.

lemma dbits_bs k:
 0 <= k =>
 dbits k = dmap (dlist {0,1} k) bs2int.
proof.
elim/natind: k.
 move=> k ??; have ->: k=0 by smt().
 rewrite dlist0 1://.
 rewrite eq_distr; move => x.
 rewrite dinter1E dmap1E dunitE /(\o) /pred1 /=.
 by rewrite bs2int_nil /#.
move=> k Hk IH _.
rewrite 1!(addrC k) dbitsD //.
have ->: dbits 1 = dmap (dlist {0,1} 1) bs2int.
 rewrite dlist1 dmap_comp /(\o) /= eq_distr => x.
 by rewrite dinter1E dmap1E dboolE /(\o) /pred1 !JUtils.bs2int_cons !bs2int_nil /#.
rewrite dlist_add // IH //.
rewrite dmap_dprod !dmap_comp /(\o) /=.
apply eq_dmap_in => x /=.
rewrite supp_dprod !supp_dlist //; move=> [[E ?][??]].
by rewrite JUtils.bs2int_cat E expr1 /#.
qed.

op spreadbits (k n x: int): int list =
 mkseq (fun i=> x%/2^(i*k) %% 2^k) n.

lemma spreadbits0 k: spreadbits k 0 = fun n => [].
proof. by apply fun_ext => x; rewrite /spreadbits mkseq0. qed.

lemma spreadbitsS k n: 
 0 <= n =>
 spreadbits k (n+1) = 
 fun x => rcons (spreadbits k n x) (x %/ 2 ^ (n * k) %% 2 ^ k).
proof. 
move=> Hn.
by apply fun_ext => x; rewrite /spreadbits mkseqS //; congr.
qed.

op joinbits (k:int) (l: int list) = foldr (fun x r=>x+2^k*r) 0 l.

lemma spreadbits_modz k n x:
 0 <= n => 0 < k => 
 spreadbits k n x = spreadbits k n (x %% 2^(n*k)).
proof.
elim/natind: n k x.
 move=> n Hn0 k H0n Hk; have ->/=: n=0 by smt().
 by rewrite !spreadbits0.
move=> n Hn0 IH k x _ Hk.
rewrite spreadbitsS //= IH // mulrDl /= eq_sym IH //.
congr.
 by congr; apply modz_dvd_pow; smt().
by rewrite modz_pow2_div 1:/# addrC addrA (addrC _ (n*k)) /= modz_mod.
qed.

lemma dbits_spreadbits k n:
 0 <= n => 0 < k =>
 dmap (dbits (n*k)) (spreadbits k n)
 = dlist (dbits k) n.
proof.
elim/natind: n k.
 move=> n Hn0 k H0n; have ->/=: n=0 by smt().
 move=> H0; rewrite dlist0 // spreadbits0 /=.
 rewrite eq_distr; move => x. 
 by rewrite dmap_cst; first by apply dinter_ll.
move=> n Hn IH k size Hk.
rewrite dlistSr // mulrDl /=.
rewrite dbitsD 1..2:/# spreadbitsS //.
rewrite dmap_comp /(\o) /=.
rewrite -IH 1..2:/# dmap_dprodL.
rewrite !dmap_comp /(\o) /=.
apply eq_dmap_in.
move=> [x1 x2]; rewrite supp_dprod /= !supp_dinter; move => [H1 H2].
congr.
 by rewrite spreadbits_modz // modzMDr modz_small /#.
rewrite -{2}(modz_small x2 (2^k) _) 1:/#.
congr; congr.
by rewrite divzMDr; smt(expr_gt0).
qed.

module SplitBits = {
  proc sample_split(k1 k2: int) = {
    var x, a, b;
    x <$ dbits (k1+k2);
    a <- x %% 2^k1;
    b <- x %/ 2^k1;
    return (a,b);
  }
  proc sample_splitted(k1 k2: int) = {
    var a, b;
    a <$ dbits k1;
    b <$ dbits k2;
    return (a,b);
  }
}.

require import DMap DProd.
clone DMapSampling as MS with
 type t1 <- int,
 type t2 <- int*int.
clone ProdSampling as PS with
 type t1 <- int,
 type t2 <- int.

lemma dbits_split:
  equiv [ SplitBits.sample_split ~ SplitBits.sample_splitted
        : ={k1, k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={res} ].
proof.
proc; simplify.
transitivity {2} { (a,b) <@ PS.S.sample2(dbits k1, dbits k2); }
 ( ={k1,k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={a,b} )
 ( ={k1,k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={a,b} ).
- by move=> /> &m *; exists k1{m} k2{m} => /#.
- smt().
- transitivity {2} { (a,b) <@ PS.S.sample(dbits k1, dbits k2); }
   ( ={k1,k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={a,b} )
   ( ={k1,k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={a,b} ).
  + by move=> /> &m *; exists k1{m} k2{m} => /#.
  + smt().
  + inline*.
    transitivity {2} { (a,b) <@ MS.S.sample(dbits (k1+k2), fun x => (x%%2^k1, x%/2^k1)); }
     ( ={k1,k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={a,b} )
     ( ={k1,k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={a,b} ).
    * by move=> /> &m *; exists k1{m} k2{m} => /#.
    * smt().
    * transitivity {2} { (a,b) <@ MS.S.map(dbits (k1+k2), fun x => (x%%2^k1, x%/2^k1)); }
       ( ={k1,k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={a,b} )
       ( ={k1,k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={a,b} ).
      - by move=> /> &m *; exists k1{m} k2{m} => /#.
      - smt().
      - inline*; auto. 
      - by symmetry; call MS.sample; auto.
    * inline*; wp; rnd; wp; skip => /> &m Hk1 Hk2.
      by rewrite dprod_dbits.
  + by call PS.sample_sample2; auto.
- by inline*; auto.
qed.

module JoinBits = {
  proc sample_join(k1 k2: int) = {
    var a, b;
    a <$ dbits k1;
    b <$ dbits k2;
    return a + b * 2^k1;
  }
  proc sample_joined(k1 k2: int) = {
    var x;
    x <$ dbits (k1+k2);
    return x;
  }
}.

lemma dbits_join:
  equiv [ JoinBits.sample_join ~ JoinBits.sample_joined
        : ={k1, k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={res} ].
proof.
proc; simplify.
transitivity {1} { (a,b) <@ SplitBits.sample_split(k1,k2); }
 ( ={k1, k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={a,b,k1,k2} )
 ( ={k1, k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> a{1} + b{1} * 2 ^ k1{1} = x{2} ).
- by move => /> &m ??; exists k1{m} k2{m}.
- by [].
- transitivity {2} { (a,b) <@ SplitBits.sample_splitted(k1, k2); }
   ( ={k1, k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={a,b,k1,k2} )
   ( ={k1, k2} /\ 0 <= k1{1} /\ 0 <= k2{1} ==> ={a,b,k1,k2} ).
  + by move => /> &m ??; exists k1{m} k2{m}.
  + by [].
  + by inline*; wp; rnd; rnd; auto.
  + by symmetry; call dbits_split; auto.
- inline*; wp; rnd; wp; skip => /> &m Hk1 Hk2 x Hx.
  smt(divz_eq).
qed.

require import Binomial.

(* CENTERED BINOMIAL DISTRIBUTION *)
op mcbd (eta_ x: int) =
  (bin (2*eta_) (x+eta_))%r * (inv 2%r)^(2*eta_).

op dcbd (eta_: int): int distr =
 dmap (dbin (inv 2%r) (2*eta_)) (fun x => x-eta_).

lemma dbin1E_half n k:
 mu1 (dbin (inv 2%r) n) k = (bin n k)%r * (inv 2%r ^ n).
proof. by rewrite dbin1E; smt(@Real). qed.

lemma dcbd1E eta_ x:
 mu1 (dcbd eta_) x = mcbd eta_ x.
proof.
rewrite dmap1E /(\o) /=.
rewrite (mu_eq _ _ (pred1 (x+eta_))) 1:/#.
by rewrite dbin1E_half /#.
qed.

lemma gt0_bin n k:
 0 < bin n k <=> 0 <= k <= n.
proof.
split => [H|[]].
 apply contraT.
 rewrite andaE negb_and; move=> [?|?].
  by move: H; rewrite bin_lt0r /#.
 by move: H; rewrite bin_gt /#.
elim/natind: k n; first by smt(bin0).
move=> k Hk0 IH n _ Hkn.
rewrite (_:n=n-1+1) 1:/# binSn 1..2:/#.
move: (IH (n-1) _ _); smt(ge0_bin).
qed.

lemma supp_dcbd eta_ x:
 x\in (dcbd eta_) <=> -eta_ <= x <= eta_.
proof.
rewrite /support dcbd1E /mcbd.
have ->: (-eta_ <= x && x <= eta_) = (0 < bin (2 * eta_) (x + eta_))
 by smt(gt0_bin).
smt(@RealOrder).
qed.

lemma ll_dcbd eta_:
 0 <= eta_ =>
 is_lossless (dcbd eta_).
proof. by move=> Heta; apply dmap_ll; apply ll_dbin; smt(). qed.

lemma mcbd_2_2N: mcbd 2 (-2) = inv 16%r.
proof.
by rewrite /mcbd /= bin0 // RField.exprVn //= RField.fromintXn //=.
qed.

lemma bin_4_1: bin 4 1 = 4.
proof.
by rewrite (_:4=0+1+1+1+1) // (_:1=0+1) // !binSn // !bin0 // !bin0n !b2i0 /=.
qed.

lemma mcbd_2_1N: mcbd 2 (-1) = 4%r / 16%r.
proof.
by rewrite /mcbd /= bin_4_1 // RField.exprVn //= RField.fromintXn //=.
qed.

lemma bin_4_2: bin 4 2 = 6.
proof.
by rewrite (_:4=0+1+1+1+1) // (_:2=0+1+1) // !binSn // !bin0 // !bin0n !b2i0 /=.
qed.

lemma mcbd_2_0: mcbd 2 0 = 6%r / 16%r.
proof.
by rewrite /mcbd /= bin_4_2 // RField.exprVn //= RField.fromintXn //=.
qed.

lemma bin_4_3: bin 4 3 = 4.
proof.
rewrite (_:4=0+1+1+1+1) // (_:3=0+1+1+1) // !binSn // !bin0 // !bin0n /#.
qed.

lemma mcbd_2_1: mcbd 2 1 = 4%r / 16%r.
proof.
by rewrite /mcbd /= bin_4_3 // RField.exprVn //= RField.fromintXn //=.
qed.

lemma mcbd_2_2: mcbd 2 2 = inv 16%r.
proof.
by rewrite /mcbd /= binn // RField.exprVn //= RField.fromintXn //=.
qed.

lemma mcbd_3_3N: mcbd 3 (-3) = inv 64%r.
proof.
by rewrite /mcbd /= bin0 // RField.exprVn //= RField.fromintXn //=.
qed.

lemma bin_6_1: bin 6 1 = 6.
proof.
by rewrite (_:6=0+1+1+1+1+1+1) // (_:1=0+1) // !binSn // !bin0 // !bin0n !b2i0 /=.
qed.

lemma mcbd_3_2N: mcbd 3 (-2) = 6%r / 64%r.
proof.
by rewrite /mcbd /= bin_6_1 // RField.exprVn //= RField.fromintXn //=.
qed.

lemma bin_6_2: bin 6 2 = 15.
proof.
by rewrite (_:6=0+1+1+1+1+1+1) // (_:2=0+1+1) // !binSn // !bin0 // !bin0n !b2i0 /=. 
qed.

lemma mcbd_3_1N: mcbd 3 (-1) = 15%r / 64%r.
proof.
by rewrite /mcbd /= bin_6_2 // RField.exprVn //= RField.fromintXn //=.
qed.

lemma bin_6_3: bin 6 3 = 20.
proof.
by rewrite (_:6=0+1+1+1+1+1+1) // (_:3=0+1+1+1) // !binSn // !bin0 // !bin0n !b2i0 /=.
qed.

lemma mcbd_3_0: mcbd 3 0 = 20%r / 64%r.
proof.
by rewrite /mcbd /= bin_6_3 // RField.exprVn //= RField.fromintXn //=.
qed.

lemma bin_6_4: bin 6 4 = 15.
proof.
by rewrite (_:6=0+1+1+1+1+1+1) // (_:4=0+1+1+1+1) // !binSn // !bin0 // !bin0n !b2i0 /=. 
qed.

lemma mcbd_3_1: mcbd 3 1 = 15%r / 64%r.
proof.
by rewrite /mcbd /= bin_6_4 // RField.exprVn //= RField.fromintXn //=.
qed.

lemma bin_6_5: bin 6 5 = 6.
proof.
by rewrite (_:6=0+1+1+1+1+1+1) // (_:5=0+1+1+1+1+1) // !binSn // !bin0 // !bin0n !b2i0 /=.
qed.

lemma mcbd_3_2: mcbd 3 2 = 6%r / 64%r.
proof.
by rewrite /mcbd /= bin_6_5 // RField.exprVn //= RField.fromintXn //=.
qed.

lemma mcbd_3_3: mcbd 3 3 = inv 64%r.
proof.
by rewrite /mcbd /= binn // RField.exprVn //= RField.fromintXn //=.
qed.

(* remove redundant hypothesis from "binSn" *)
lemma binSn' n m:
     0 <= n => bin (n + 1) (m + 1) = bin n (m + 1) + bin n m.
proof.
case: (0 <= m) => Hm Hn.
 by rewrite binSn.
case: (m+1 < 0) => H.
 by rewrite !bin_lt0r //#.
have ->: (m+1 = 0) by smt().
by rewrite !bin0 1..2:/# bin_lt0r /#.
qed.

lemma aux n k:
 0 <= n =>
 bin (2*(n+1)) (k+(n+1))
 = 2*bin (2*n) (k+n) + bin (2*n) (k+n-1) + bin (2*n) (k+n+1).
proof.
move=> Hn.
have ->: 2*(n+1) = 2*n + 1 + 1 by ring.
rewrite addrA binSn' 1:/# binSn' 1:/# addrC.
by rewrite (_:k+n=k+n-1+1) 1:/# binSn' /#.
qed.


abbrev hamming_weight l = count (fun x=>x) l.

op dcbd_sample eta_ =
 dmap (dlist {0,1} eta_ `*` dlist {0,1} eta_)
      (fun ll:_*_ => hamming_weight ll.`1 - hamming_weight ll.`2).

lemma dcbd_sampleS eta_:
 0 <= eta_ =>
 dcbd_sample (eta_ + 1)
 = dmap (({0,1}`*`{0,1}) `*` (dlist {0,1} eta_ `*` dlist {0,1} eta_))
        (fun x:(_*_)*(_*_) => b2i x.`1.`1 - b2i x.`1.`2
           + hamming_weight x.`2.`1 - hamming_weight x.`2.`2).
proof.
move => Hn; rewrite /dcbd_sample dlistS // /dapply /=.
rewrite dmap_dprod dmap_comp /(\o) /=.
pose d1:= _ `*` _ `*` (_ `*` _).
pose d2:= {0,1} `*` {0,1} `*` _.
have ->:
 d1 = dmap d2 (fun x:(_*_)*(_*_) => 
               ((x.`1.`1,x.`2.`1),(x.`1.`2,x.`2.`2))).
 rewrite eq_distr; move => [[k11 k12][k21 k22]].
 rewrite !dmap1E.
 pose f := _\o _; have ->: f = pred1 ((k11,k21),(k12,k22)).
  by rewrite /f /pred1 fun_ext; move => [[??][??]] /#.
 by rewrite !dprod1E /#. 
rewrite dmap_comp /(\o).
apply eq_dmap_in; move => [[h1 h2][t1 t2]].
by rewrite !supp_dprod /=; move => [[??][??]] /#.
qed.

lemma dcbd_eq_sample eta_:
 0 <= eta_ =>
 dcbd eta_ = dcbd_sample eta_.
proof.
move=> Heta; rewrite eq_distr; move => k.
elim/natind: eta_ Heta k.
 move=> n ?? k; rewrite (_:n=0) 1:/# dcbd1E /mcbd RField.expr0 /=.
 rewrite /dcbd_sample dlist0 // dmap1E /(\o) /pred1 bin0n /=.
 case: (k=0) => [->|E].
  rewrite (mu_eq_support _ _ (fun x:_*_=>x.`1=[] /\ x.`2=[])).
   by move=> [l1 l2]; rewrite supp_dprod !supp_dunit /#.
  by rewrite (dprodE (pred1 []) (pred1 [])); smt(dunit1E).
 rewrite (mu_eq_support _ _ pred0).
  by move=> [l1 l2]; rewrite supp_dprod !supp_dunit /#.
 by rewrite mu0.
move=> n Hn IH _ k.
rewrite dcbd_sampleS // dmap_dprodE /=.
rewrite (dlet1Efin _ _ _ [(false,false);(false,true);(true,false);(true,true)]).
 move => [] /= x1 x2.
 by rewrite supp_dprod !supp_dbool /#.
rewrite /= !big_consT big_nil /=.
pose f (y:_*_) := hamming_weight y.`1 - hamming_weight y.`2.
pose fp (y:_*_) := 1 + hamming_weight y.`1 - hamming_weight y.`2.
pose fm (y:_*_) := -1 + hamming_weight y.`1 - hamming_weight y.`2.
rewrite (eq_dmap _ fm ((fun x=> -1 + x)\o f)) 1:/#.
rewrite (eq_dmap _ fp ((fun x=> 1 + x)\o f)) 1:/#.
rewrite -2!dmap_comp -/(dcbd_sample n).
rewrite (dmap1E_can _ (fun x=>(-1)+x) (fun x=>x+1)) //.
rewrite (dmap1E_can _ (fun x=>1+x) (fun x=>x-1)) //.
rewrite -!IH // !dprod1E !dbool1E /= !dcbd1E /mcbd.
rewrite aux // mulzDr /=.
have ->: inv 2%r ^ (2 * n + 2) = inv 2%r ^ (2 * n) / (2^2)%r.
 rewrite RField.exprD 1:/#; field; smt().
smt().
qed.



module RejSampling = {
 proc sample_upto(max: int) = {
  var x;
  x <$ [0..max];
  return x;
 }
 proc samplelist_upto(max n: int) = {
  var l;
  l <$ dlist [0..max] n;
  return l;
 }
 proc rsample(k max: int) = {
  var x;
  x <$ dbits k;
  while (max < x) {
   x <$ dbits k;  
  }
  return x;
 }
 proc rmodsample(k rmax max: int) = {
  var x;
  x <$ dbits k;
  while (rmax < x) {
   x <$ dbits k;  
  }
  return x %% (max+1);
 }
 proc rsamplelist(k max n: int) = {
  var x, i, j, y: int;
  var l;
  i <- 0;
  j <- 0;
  l <- [];
  while (j < n) {
   x <$ dbits k;
   if (x <= max) {
    l <- rcons l x;
    j <- j+1;
   }
   i <- i+1;
  }
  return l;
 }
 proc rsamplelist_chunked(k max n nchunk: int) = {
  var i, j, xn, x: int;
  var xp, xl, l: int list;
  i <- 0;
  j <- 0;
  l <- [];
  while (j < n) {
   xl <$ dlist (dbits k) nchunk;
   xn <- 0;
   while (j < n && xn < nchunk) {
    if ((nth 0 xl xn) <= max && j < n) {
     l <- rcons l (nth 0 xl xn);
     j <- j + 1;
    }
    xn <- xn+1;
   }
   i <- i+1;
  }
  return l;
 }
}.



require import Dexcepted.

clone WhileSampling as WS with
 type input <- int*int,
 type t <- int,
 op dt (i:int*int) = dbits i.`2.

equiv rsample_upto: 
 RejSampling.sample_upto ~ RejSampling.rsample: 
 ={max} /\ 0 <= max{2} < 2^k{2} ==> ={res}.
proof.
transitivity WS.SampleE.sample
 (0 <= max{1} < 2^i{2}.`2 /\ max{1}=i{2}.`1 /\ test{2} =(fun (i:int*int) x => i.`1 < x) ==> ={res})
 (i{1}.`1=max{2} /\ i{1}.`2=k{2} /\ test{1} =(fun (i:int*int) x => i.`1 < x ) ==> ={res}).
- move=> /> &m ??; exists ((max{m},k{m}),fun (i:_*_) x=>i.`1 < x)%Int; smt().
- done.
- proc; rnd; auto => /> &m ??; split.
   move=> x Hx.
   have HH: 0 <= x <= i{m}.`1.
    by move: Hx; rewrite supp_dexcepted supp_dinter /#.
   rewrite dexcepted1E.   
   rewrite (_:i{m}.`1 < x = false) 1:/#/=.
   rewrite !dinter1E.
   rewrite (_:0 <= x && x <= 2 ^ i{m}.`2 - 1) 1:/#/=.
   rewrite (_:0 <= x && x <= i{m}.`1) 1:/#/=.
   rewrite weight_dinter.
   rewrite (_:0 <= 2 ^ i{m}.`2 - 1).
    smt(StdOrder.IntOrder.expr_gt0).
   rewrite dinterE /= StdOrder.IntOrder.ler_maxr /=.
    smt(StdOrder.IntOrder.expr_gt0).
   rewrite (range_cat (i{m}.`1+1)) 1..2:/#.
   rewrite filter_cat eq_in_filter_pred0 /=.
    smt(mem_range).
   rewrite eq_in_filter_predT.
    smt(mem_range).
   rewrite size_range StdOrder.IntOrder.ler_maxr 1: /#.
   congr; pose a := (2 ^ i{m}.`2); pose b := i{m}.`1 . 
   rewrite RField.mulrDr /= RField.mulrC -RField.mulrN -RField.mulrN1 
           -RField.mulrA -(RField.mulrC a%r) (RField.mulrA a%r) RField.divrr 1:/# /=; by ring.
  move=> H x Hx.
  have HH: 0 <= x <= i{m}.`1.
   by move: Hx; rewrite supp_dinter /#.
  by rewrite supp_dexcepted supp_dinter /#.
- transitivity WS.SampleW.sample
   (={i,test} ==> ={res})
   (i{1}.`1=max{2} /\ i{1}.`2=k{2} /\ test{1} =(fun (m:_*_) x => m.`1 < x)%Int ==> ={res}).
  + by move=> /> &1 &2 *; exists (i{1},(fun (i:_*_) x => i.`1 < x)%Int); smt().
  + done.
  + conseq WS.sampleE_sampleW.
    move=> /> &1 &2 *; rewrite dinter_ll.
    smt(StdOrder.IntOrder.expr_gt0).
- proc; inline*; simplify.
  wp; while (test0{1}=(fun (i:_*_) x=>i.`1<x)%Int /\ r0{1}=x{2}/\i0{1}=(max{2},k{2})).
   by rnd; skip => /> &1 &2 *.
  by wp; rnd; skip => /> &m * /#.
qed.

clone DMapSampling as MS2 with
 type t1 <- int,
 type t2 <- int.

equiv rmodsample_upto: 
 RejSampling.sample_upto ~ RejSampling.rmodsample: 
 ={max} /\ 0 <= max{2} /\ 0 <= rmax{2} < 2^k{2} /\ (max{2}+1)%|(rmax{2}+1) ==> ={res}.
proof.
proc; simplify.
transitivity {2} { x <@ RejSampling.rsample(k, rmax); }
 ( ={max} /\ 0<=max{2} /\ 0 <= rmax{2} && rmax{2} < 2 ^ k{2} /\ (max{2}+1) %| (rmax{2}+1) ==> x{1}=x{2}%%(max{2}+1) )
 ( ={max} /\ ={k,rmax} /\ (0 <= rmax{2} && rmax{2} < 2 ^ k{2}) /\ (max{2}+1) %| (rmax{2}+1) ==> ={x,max} ).
- by move=> /> &m *; exists k{m} max{m} rmax{m}.
- done.
- transitivity {2} { x <@ RejSampling.sample_upto(rmax); }
   ( ={max} /\ 0<=max{2} /\ 0 <= rmax{2} && rmax{2} < 2 ^ k{2} /\ (max{2}+1) %| (rmax{2}+1) ==> x{1}=x{2}%%(max{2}+1) )
   ( ={max,rmax,k} /\ (0 <= rmax{2} && rmax{2} < 2 ^ k{2}) /\ (max{2}+1) %| (rmax{2}+1) ==> ={x,max} ).
  + by move=> /> &m *; exists k{m} max{m} rmax{m}.
  + done.
  + transitivity {2} { x <@ MS2.S.sample([0..rmax],fun x=>x%%(max+1)); }
     ( ={max} /\ 0<=max{2} /\ 0<=rmax{2} /\ (max{2}+1) %| (rmax{2}+1) ==> ={x} )
     ( ={max,rmax} /\ (0 <= rmax{2} && rmax{2} < 2 ^ k{2}) /\ (max{2}+1) %| (rmax{2}+1) ==> x{1}=x{2}%%(max{2}+1) ).
    * by move=> /> &m *; exists max{m} rmax{m}.
    * done.
    * inline*; wp; rnd; auto => /> &m *.
      by rewrite -(duni_range_dvd (rmax{m}+1) (max{m}+1)) /#.
    transitivity {1} { x <@ MS2.S.map([0..rmax], fun x=>x%%(max+1)); }
     (={max,rmax} ==> ={x})
     (={max,rmax} ==> ={rmax} /\ x{1} = x{2} %% (max{2} + 1)).
    * by move=> /> &m *; exists max{m} rmax{m}.
    * done.
    * by call MS2.sample; auto.
    by inline*; wp; rnd; auto.
  by call rsample_upto.
- by inline*; sim.
qed.

clone ProgramDList as LS with type t <- int.

equiv rsamplelist_upto: 
 RejSampling.samplelist_upto ~ RejSampling.rsamplelist: 
 ={max,n} /\ 0 <= max{2} < 2^k{2} ==> ={res}.
proof.
proc; simplify.
exlim n{1} => N; elim/natind: N => [|N HN IH].
 move=> n H0.
 rnd {1}.
 rcondf {2} 4.
  by move=> &m; wp; skip; smt().
 wp; skip => /> &m *.
 by rewrite !dlist0 //; smt(dunit_ll supp_dunit).
transitivity {1} { l <@ LS.SampleCons.sample([0..max],n); }
 ( 0 < n{1} /\ ={max,n} /\ 0 <= max{2} ==> ={l} )
 ( N+1 = n{1} /\ ={max,n} /\ 0 <= max{2} && max{2} < 2 ^ k{2} ==> ={l} ).
- by move=> /> &m *; exists max{m} (N+1); auto; smt().
- done.
- transitivity {1} { l <@ LS.Sample.sample([0..max], n); }
   ( 0 < n{1} /\ ={max,n} /\ 0 <= max{2} ==> ={l} )
   ( 0 < n{1} /\ ={max,n} /\ 0 <= max{2} ==> ={l} ).
  + by move=> /> &m *; exists max{m} n{m}; auto.
  + done.
  + by inline*; wp; rnd; wp; auto.
  + by call LS.Sample_SampleCons_eq; skip; smt().
  inline*.
  swap {1} 4 -1.
  transitivity {1}
   { r <$ [0..max];
     l <$ dlist [0..max] n;
     l <- r::l;
   }
   (N+1 = n{1} /\ N=n{2} /\ ={max} ==> ={l})
   (N = n{1} /\ N+1=n{2} /\ ={max} /\ 0 <= max{2} && max{2} < 2 ^ k{2} ==> ={l}).
  + by move=> /> &1 ??; exists max{1} (N); smt().
  + done.
  + by inline*; wp; rnd; wp; rnd; auto.
  transitivity {2}
   { i <- 0;
     j <- 0;
     while ( j<1 ) {
       y <$ dbits k;
       if (y <= max) {
         j <- j+1;
       }
       i <- i+1;
     }
     i <- 0;
     j <- 0;
     l <- [];
     while (j < n) {
       x <$ dbits k;
       if (x <= max) {
         l <- rcons l x;
         j <- j+1;
       }
       i <- i+1;
     }
     l <- y::l;
  }
  ( N=n{1} /\ ={max,n} /\ 0 <= max{2} && max{2} < 2 ^ k{2} ==> ={l})
  ( N=n{1} /\ N+1=n{2} /\ ={max,k} /\ 0 <= max{2} && max{2} < 2 ^ k{2} ==> ={l}).
  + by move=> /> &m *; exists k{m} max{m} N; auto.
  + done.
  + seq 1 3: (#pre /\ r{1}=y{2}).
     clear IH.
     transitivity {1} { r <@ RejSampling.sample_upto(max); }
      ( N = n{1} /\ ={max, n} 
       ==> N = n{1} /\ ={r,max,n}  )
      ( N = n{1} /\ ={max, n} /\ 0 <= max{2} && max{2} < 2 ^ k{2}
       ==> N = n{1} /\ r{1}=y{2} /\ ={max,n} /\ 0 <= max{2} && max{2} < 2 ^ k{2} ).
     * by move=> /> &m *; exists max{m} N.
     * done.
     * by inline*; wp; rnd; auto.
     transitivity {2} { y <@ RejSampling.rsample(k,max); }
      ( N = n{1} /\ ={max, n} /\ 0 <= max{2} && max{2} < 2 ^ k{2}
       ==> N = n{1} /\ r{1}=y{2} /\ ={max,n}  )
      ( N = n{1} /\ ={max,k,n} /\ 0 <= max{2} && max{2} < 2 ^ k{2}
       ==> N = n{1} /\ ={y,max,n} /\ 0 <= max{2} && max{2} < 2 ^ k{2} ).
     * by move=> /> &m *; exists k{m} max{m} N.
     * done.
     * by call rsample_upto. 
     inline*; wp.
     unroll {2} 3; rcondt {2} 3; first by auto.
     seq 3 4: (#pre /\ (k0,max0,x0){1}=(k,max,y){2} /\ (j=b2i (y<=max)){2}).
      by wp; rnd; auto.
     while (#pre).
      by wp; rnd; auto; smt(). 
     wp; skip; smt().
    inline*; wp; simplify.
    by conseq IH.
  + splitwhile {2} 4 : (j < 1).
    wp.
    while (j{1}+1=j{2} /\ #pre /\ y{1}::l{1} = l{2}).
     wp; rnd; skip => /> &1 &2 *; smt().
    wp; while (={j,k,max} /\ 0<=j{1}<=1 /\ (0<j{1} => l{2}=[y{1}]) /\ (0=j{1} => l{2}=[])).
     by wp; rnd; skip => /> &m * /#.
    by wp; skip => /> &1 &2 * /#.
qed.

equiv rsamplelist_chunked_upto: 
 RejSampling.samplelist_upto ~ RejSampling.rsamplelist_chunked: 
 ={max,n} /\ 0 <= n{2} /\ 0 <= max{2} < 2^k{2} /\ 0 < nchunk{2}
 ==> ={res}.
proof.
transitivity RejSampling.rsamplelist
 ( ={max,n} /\ 0 <= max{2} < 2^k{2} ==> ={res} )
 ( ={k,max,n} /\ 0 <= n{2} /\ 0 < nchunk{2} ==> ={res} ) => //.
  by move=> /> &1 &2 *; exists (k{2},max{1},n{1}); smt().
 by conseq rsamplelist_upto.
proc; simplify.
(* hop 1: rearrange loop-structure in nchunked units *)
transitivity {2}
 {   i <- 0;
  j <- 0;
  l <- [];
  while (j < n) {
   xn <- 0;
   while (xn < nchunk && j < n) {
    x <$ dbits k;
    if (x <= max ) {
     l <- rcons l x;
     j <- j + 1;
    }
    xn <- xn+1;
   }
   i <- i+1;
  }
 }
 ( ={k,max,n} /\ 0 <= n{2} /\ 0 < nchunk{2} ==> ={l} )
 ( ={k,max,n,nchunk} /\ 0 <= n{2} /\ 0 < nchunk{2} ==> ={l} ) => //.
  by move=> /> &1 &2 *; exists k{1} max{1} n{1} nchunk{1}.
 exlim nchunk{2} => _N.
 async while
  [ (fun x => i < _N*x), i{2}+1 ]
  [ (fun x => i < x), i{2}+1 ]
  ( j{1}<n{1} /\ j{2}<n{2}) ( ! j{2}<n{2} )
  : (={k,max,n,j,l} /\ (n{1}<=j{1} \/ i{1}=_N*i{2}) /\ 0<=i{1} /\ _N=nchunk{2} /\ 0 < _N).
 + by move=> /> &2 /#.
 + by move=> /> &2 /#.
 + by move=> /> &2 *. 
 + by move=> &2; wp; rnd; auto.
 + move=> /> &1; exfalso; smt().
 + move=> v1 v2.
   rcondt{2} 1; 1: by auto => /> /#.
   rcondf{2} 4.
    by move=> &m; wp; while true; auto.
   exlim i{1} => i0.
   wp; while (={k,max,n,k,j,l} /\ _N = nchunk{2} /\ 0<_N /\ (n{2}<=j{2} \/ i{1}=i{2}*_N+xn{2}) /\ xn{2}<=_N /\ 0<=i{1} /\ v1=i{2}+1 /\ v2=i{2}+1).
    by wp; auto => /> &1 &2 /#. 
   by wp; auto => /> /#. 
 + by rcondf 1; auto; smt().
 + by rcondf 1; auto; smt().
 by wp; auto.
(* hop 2: rearrange inner-loop *)
transitivity {2}
 { i <- 0;
  j <- 0;
  l <- [];
  while (j < n) {
   xl <- [];
   xp <- [];
   xn <- 0;
   while (xn < nchunk ) {
    x <$ dbits k;
    xl <- rcons xl x;
    if (x <= max && j < n) {
     xp <- rcons xp x;
     j <- j + 1;
    }
    xn <- xn+1;
   }
   l <- l ++ xp;
   i <- i+1;
  }
 }
 ( ={k,max,n,nchunk} /\ 0 <= n{2} /\ 0 < nchunk{2} ==> ={l} )
 ( ={k,max,n,nchunk} /\ 0 <= n{2} /\ 0 < nchunk{2} ==> ={l} ) => //>.
  by move=> /> &2 *; exists k{2} max{2} n{2} nchunk{2}.
 while (={k,max,n,nchunk,j,l} /\ j{2} <= n{2}).
  splitwhile {2} 4 :(j<n).
  wp; while {2} (={k,max,n,nchunk,j} /\ l{1}=l{2}++xp{2} /\
                 !(xn<nchunk /\ j<n){2}) (nchunk-xn){2}.
   move=> &m z0.
   rcondf 3; first by auto; smt().
   auto => /> &2 *; split.
    by rewrite dinter_ll; smt(expr_gt0).
   by move=> _ x _; split; smt(). 
  while (={k,max,n,nchunk,j,xn} /\ l{1}=l{2}++xp{2} /\ j{2} <= n{2}).
   auto => />; smt(rcons_cat).
  auto => /> *; smt(cats0).
 by auto => /> *. 
(* hop 3: pack sampling and functional rejection *)
transitivity {2}
 {   i <- 0;
  j <- 0;
  l <- [];
  while (j < n) {
   xl <$ dlist (dbits k) nchunk;
   xp <- take (n-j) (filter (fun x => x<= max) xl);
   l <- l ++ xp;
   j <- j + size xp;
   i <- i+1;
  }
 }
 ( ={k,max,n,nchunk} /\ 0 <= n{2} /\ 0 < nchunk{2} ==> ={l} )
 ( ={k,max,n,nchunk} /\ 0 <= n{2} /\ 0 < nchunk{2} ==> ={l} ) => //.
  by move=> /> &2 *; exists k{2} max{2} n{2} nchunk{2}.
 while (={k,max,n,nchunk,j,l} /\ j{2} <= n{2}); last by auto; smt().
 transitivity {1}
  { xl <@ LS.LoopSnoc.sample(dbits k, nchunk);
    xp <- take (n - j) (filter (transpose Int.(<=) max) xl);
    l <- l++xp;
    j <- j+size xp;
    i <- i+1;
   }
   ( ={k, max, n, nchunk, j, l} /\ j{2} < n{2} ==>
     ={k, max, n, nchunk, j, l} /\ j{2} <= n{2} /\ (j{1} < n{1} <=> j{2} < n{2}) )
   ( ={k, max, n, nchunk, j, l} /\ j{2} < n{2} ==>
     ={k, max, n, nchunk, j, l} /\ j{2} <= n{2} /\ (j{1} < n{1} <=> j{2} < n{2}) ) => //=.
   by move=> /> &2 *; exists j{2} k{2} l{2} max{2} n{2} nchunk{2}; smt().
  inline*; wp.
  exlim j{1} => j0.
  while (={k,max,n,nchunk} /\ (d, n0, i0, l0){2}=(dbits k{2}, nchunk{2}, xn{1}, xl{1}) /\
         j{2} = j0 /\ size xp{1} = j{1}-j0 /\
         xp{1} = take (n{2}-j0) (filter (fun x=>x<=max{2}) l0{2})).
   auto => /> &1&2 H0 ? x ?*; split.
    move=> Hx Hj. 
    split; first by rewrite cats1.
    split; first by rewrite size_rcons H0 /#. 
    rewrite cats1 filter_rcons /= Hx /=.
    by rewrite take_rcons; smt(take_oversize size_take).
   case: (x <= max{2}) => C1/=.
    rewrite cats1 filter_rcons /= C1 /= => C2.
    rewrite take_rcons.
    have: n{2}-j0 <= size (filter (transpose Int.(<=) max{2}) xl{1}).
     move: H0.
     case: (0 <= n{2} - j0) => C3.
      by rewrite size_take // /#.
     by rewrite take_le0; smt(size_ge0).
    smt().
   by rewrite cats1 filter_rcons /= C1.
  by auto => /> &2 *; smt(size_take).
 transitivity {1}
  { xl <@ LS.Sample.sample(dbits k, nchunk);
    xp <- take (n - j) (filter (transpose Int.(<=) max) xl);
    l <- l++xp;
    j <- j+size xp;
    i <- i+1;
   }
   ( ={k, max, n, nchunk, j, l} /\ j{2} <= n{2} /\ j{2} < n{2} ==>
     ={k, max, n, nchunk, j, l} )
   ( ={k, max, n, nchunk, j, l} /\ j{2} <= n{2} /\ j{2} < n{2} ==>
     ={k, max, n, nchunk, j, l} /\ j{2} <= n{2} /\ (j{1} < n{1} <=> j{2} < n{2}) ) => //=.
   by move=> /> &2 *; exists j{2} k{2} l{2} max{2} n{2} nchunk{2}; smt().
  by symmetry; wp; call LS.Sample_LoopSnoc_eq; auto.
 inline*; wp; rnd; auto => /> *.
 by rewrite size_take /#.
(* hop 4: rejection loop *)
transitivity {2}
 { i <- 0;
   j <- 0;
   l <- [];
   while (j < n) {
    xl <$ dlist (dbits k) nchunk;
    xn <- 0;
    while (xn < nchunk) {
     if (nth 0 xl xn <= max && j < n) {
      l <- rcons l (nth 0 xl xn);
      j <- j+1;
     }
     xn <- xn + 1;
    }
    i <- i + 1;
   }
 }
 ( ={k, max, n, nchunk} /\ 0 <= n{2} /\ 0 < nchunk{2}
   ==> ={l} )
 ( ={k,max,n,nchunk} /\ 0 <= n{2} /\ 0 < nchunk{2} ==> ={l} ); 1..2:smt(); first last.
 while (={k,max,n,nchunk,i,j,l} /\ 
        j{1} <= n{1} /\ 0 < nchunk{2}); last by auto.
 seq 1 1: (#pre /\ ={xl} /\ size xl{2}=nchunk{2}).
  by auto => /> *; smt(supp_dlist).
 splitwhile {1} 2: (j<n).
 swap {1} 4 -1.
 seq 3 3: (#[/1:9,12:]pre /\ ={xn} /\ (!xn{1} < nchunk{1} \/ !j{1} < n{1})).
  wp;
  while (={k,max,n,nchunk,i,j,l,xl,xn} /\ j{1} <= n{1} /\ (j{1} < n{1} <=> j{2} < n{2})).
   by auto => /> * /#.
  by auto => /> /#.
 case: (j{1} < n{1}).
  by rcondf{1} 1; auto => /> /#.
 exlim j{1} => j1.
 while {1} (#[/:12,14:]pre) (nchunk{1}-xn{1}).
  move=> &m z.
  by auto => /> /#.
 by auto => /> /#.
while (={k,max,n,nchunk,i,j,l} /\ size l{1}=j{1} /\
       j{1} <= n{1} /\ 0 < nchunk{2}); last by auto.
seq 1 1: (#pre /\ ={xl} /\ size xl{2}=nchunk{2}).
 auto => /> *; smt(supp_dlist).
wp.
while {2} (#[/1:5,8,9,13:]pre /\ ={xl} /\
           size xl{2}=nchunk{2} /\
           0 <= xn{2} <= nchunk{2} /\
           l{2} = l{1}++take (n{1}-j{1}) (filter (fun x => x <= max{2}) (take xn{2} xl{2})) /\
           j{2} = size l{2}) (nchunk{2}-xn{2}).
 move=> /> &1 z.
 auto => /> &2 Hn xnL _ xnR; split.
  move => /> C; rewrite size_cat=> H1; split.
   split; first smt().
   split.
    rewrite rcons_cat; congr.
    rewrite (take_nth 0) 1:/# filter_rcons /= C /=.
    have Hover: size (filter (transpose Int.(<=) max{1}) (take xn{2} xl{1})) <= n{1} - size l{1}.
     apply ltrW; rewrite -(ltz_add2l (size l{1})).
     by rewrite (addrC n{1}) addrA /=; smt(size_take).
    rewrite !(take_oversize (n{1}-size l{1})) //. 
    rewrite size_rcons -ltzE; smt(size_take).    
   by rewrite size_rcons size_cat /#.
  smt().
 rewrite andaE negb_and; move => [C|C].
  split; last smt().
  split; first smt().
  by congr; rewrite (take_nth 0) 1:/# filter_rcons /=C /#.
 split; last smt().
 split; first smt().
 move: C; rewrite !size_cat => C.
 congr. 
 have HH: n{1} - size l{1} <= size (filter (transpose Int.(<=) max{1}) (take xn{2} xl{1})) by smt(size_take).
 rewrite (take_nth 0); first smt(size_take).
 rewrite filter_rcons /=.
 case: (nth 0 xl{1} xn{2} <= max{1}) => E.
  rewrite take_rcons; smt(size_take).
 smt(size_take).
auto => /> &2 *.
split; first by rewrite take0 /= cats0 /#.
move => />*; split => /> *; first smt().
by rewrite !size_cat; smt(size_take take_oversize).
qed.

