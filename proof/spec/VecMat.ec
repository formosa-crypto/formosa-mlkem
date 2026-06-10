require import AllCore List IntDiv.
require import Parameters Rq.
import MLKEMParams.
import Rq.RqTheory.

from Jasmin require import JArray.

(* ------------------------------------------------------------------ *)
(* Algebraic vector/matrix over the poly ring (Rq), at the TOP of the
   type hierarchy — mirroring formosa-mldsa's VM import above VecMat.
   It has its OWN vector/matrix types (NOT identified with the concrete
   polyvec); the concrete<->algebraic bridge is poly2alg/alg2poly below.
   Relocated from Correctness768 (was clone KMatrix + getvE/setvE axioms). *)
(* ------------------------------------------------------------------ *)
require Matrix.
clone import Matrix as KMatrix with
    op size <- kvec,
    type ZR.t <- poly,
    op ZR.zeror <- Rq.zero,
    op ZR.oner <- Rq.one,
    pred ZR.unit = Rq.unit,
    op ZR.(+) <- Rq.(&+),
    op ZR.([-]) <- Rq.(&-),
    op ZR.( * ) <- Rq.(&*),
    op ZR.invr <- Rq.invr
    proof ZR.addrA by smt(Rq.add_lift Rq.poly2polyrK addrA)
    proof ZR.addrC by smt(Rq.add_lift Rq.poly2polyrK addrC)
    proof ZR.add0r by smt(Rq.zero_lift Rq.add_lift Rq.poly2polyrK add0r Rq.polyr2polyK)
    proof ZR.addNr by smt(Rq.zero_lift Rq.sub_lift Rq.add_lift Rq.poly2polyrK addNr Rq.polyr2polyK)
    proof ZR.oner_neq0 by smt(Rq.zero_lift Rq.poly2polyrK Rq.one_lift oner_neq0)
    proof ZR.mulrA by smt(Rq.mul_lift Rq.poly2polyrK mulrA)
    proof ZR.mulrC by smt(Rq.mul_lift Rq.poly2polyrK mulrC)
    proof ZR.mul1r by smt(Rq.one_lift Rq.mul_lift Rq.poly2polyrK mul1r Rq.polyr2polyK)
    proof ZR.mulrDl by smt(Rq.add_lift Rq.mul_lift Rq.poly2polyrK mulrDl Rq.polyr2polyK)
    proof ZR.mulVr by smt(choicebP)
    proof ZR.unitP by smt()
    proof ZR.unitout by (move=> x H; rewrite /Rq.invr choiceb_dfl // /#)
    proof ge0_size by smt(gt0_k).

(* ------------------------------------------------------------------ *)
(* Vector/matrix layer over Zq[X]/(X^256+1), dimension k (FIPS ML-KEM).

   Parametric over the global parameter k (Parameters.ec, constrained by
   param_sets); the concrete variant is pinned by axioms in the per-variant
   avx2 prelude (k = 3 for ML-KEM-768, k = 4 for ML-KEM-1024) — mirroring
   formosa-mldsa-correctness's mldsa_65_prelude.ec (axiom kvec = 6). *)
(* ------------------------------------------------------------------ *)

clone export PolyArray as KVec with
  op size <- kvec
  proof ge0_size by smt(gt0_k).

clone export PolyArray as KMat with
  op size <- kvec * kvec
  proof ge0_size by smt(gt0_k).

theory PolyVec.

type polyvec = poly KVec.t.

op mapv (f : poly -> poly, v : polyvec) : polyvec = KVec.map f v.
op nttv v    = mapv ntt v.
op invnttv v = mapv invntt v.

op zerov : polyvec = KVec.init (fun _ => Rq.zero).

op (+) (v1 v2 : polyvec) : polyvec = KVec.init (fun i => v1.[i] &+ v2.[i]).

end PolyVec.

theory PolyMat.

type polymat = poly KMat.t.

op "_.[_]"    (m : polymat) (ij : int * int)            : poly    = KMat."_.[_]" m (ij.`1 * kvec + ij.`2).
op "_.[_<-_]" (m : polymat) (ij : int * int) (c : poly) : polymat = KMat."_.[_<-_]" m (ij.`1 * kvec + ij.`2) c.

op mapm (f : poly -> poly, m : polymat) : polymat = KMat.map f m.
op nttm m    = mapm ntt m.
op invnttm m = mapm invntt m.

op zerom : polymat = KMat.init (fun _ => Rq.zero).

(* concrete transpose (replaces the algebraic Matrix.trmx that the old
   `type matrix <- polymat` identification provided). *)
op trmx (m : polymat) : polymat = KMat.init (fun flat => m.[(flat %% kvec, flat %/ kvec)]).

lemma trmxE (m : polymat) i j :
  0 <= i < kvec => 0 <= j < kvec => (trmx m).[(i,j)] = m.[(j,i)].
proof.
move=> hi hj; rewrite /trmx {1}/"_.[_]" KMat.initiE 1:/# /=.
have ->: (i * kvec + j) %% kvec = j by rewrite modzMDl modz_small /#.
have ->: (i * kvec + j) %/ kvec = i by rewrite divzMDl 1:/# divz_small 1:/# /=.
done.
qed.

(* concrete get-after-set and extensionality on the flat KMat representation. *)
lemma get_setmE (m : polymat) i j i' j' (c : poly) :
  0 <= i < kvec => 0 <= j < kvec => 0 <= i' < kvec => 0 <= j' < kvec =>
  (m.[(i,j) <- c]).[(i',j')] = if (i' = i /\ j' = j) then c else m.[(i',j')].
proof.
move=> hi hj hi' hj'; rewrite {1}/"_.[_]" {1}/"_.[_<-_]" KMat.get_setE 1:/#.
have ->: (i' * kvec + j' = i * kvec + j) <=> (i' = i /\ j' = j) by smt().
by rewrite /"_.[_]".
qed.

lemma eq_polymatP (m1 m2 : polymat) :
  (forall i j, 0 <= i < kvec => 0 <= j < kvec => m1.[(i,j)] = m2.[(i,j)]) => m1 = m2.
proof.
move=> h; apply KMat.tP => f fb.
have ->: m1.[f] = m1.[(f %/ kvec, f %% kvec)] by rewrite /"_.[_]"; congr; smt(divz_eq).
have ->: m2.[f] = m2.[(f %/ kvec, f %% kvec)] by rewrite /"_.[_]"; congr; smt(divz_eq).
apply h; smt(gt0_k).
qed.

end PolyMat.

import PolyVec PolyMat.

op ntt_dotp (v1 v2 : polyvec) : poly =
  foldr (fun (i : int) (a : poly) => basemul v1.[i] v2.[i] &+ a) Rq.zero (iota_ 0 kvec).

op ntt_mmul (m : polymat, v : polyvec) : polyvec =
  KVec.init (fun (i : int) =>
    foldr (fun (j : int) (a : poly) => basemul m.[i, j] v.[j] &+ a) Rq.zero (iota_ 0 kvec)).

import Vector.

(* `ring` tactic instance for the poly ring (relocated from Correctness768). *)
instance ring with R
  op rzero = Rq.zero
  op rone  = Rq.one
  op add   = Rq.(&+)
  op opp   = Rq.(&-)
  op mul   = Rq.(&*)
  op expr  = ZR.exp
  op ofint = ZR.ofint

  proof oner_neq0 by apply ZR.oner_neq0
  proof addrA     by apply ZR.addrA
  proof addrC     by apply ZR.addrC
  proof addr0     by apply ZR.addr0
  proof addrN     by apply ZR.addrN
  proof mulr1     by apply ZR.mulr1
  proof mulrA     by apply ZR.mulrA
  proof mulrC     by apply ZR.mulrC
  proof mulrDl    by apply ZR.mulrDl
  proof expr0     by apply ZR.expr0
  proof ofint0    by apply ZR.ofint0
  proof ofint1    by apply ZR.ofint1
  proof exprS     by apply ZR.exprS
  proof ofintS    by apply ZR.ofintS
  proof ofintN    by apply ZR.ofintN.

(* ------------------------------------------------------------------ *)
(* Concrete <-> algebraic vector bridge.  Replaces the old
   `type vector <- polyvec` identification + the getvE/setvE/... axioms:
   the concrete KVec accessors reduce, so these are *proved* conversions. *)
(* ------------------------------------------------------------------ *)
op poly2alg (v : polyvec) : vector = offunv (fun i => v.[i]).
op alg2poly (av : vector) : polyvec = KVec.init (fun i => av.[i]).

lemma poly2algE v i : 0 <= i < kvec => (poly2alg v).[i] = v.[i].
proof. by move=> hi; rewrite /poly2alg offunvE //=. qed.

lemma alg2polyE av i : 0 <= i < kvec => (alg2poly av).[i] = av.[i].
proof. by move=> hi; rewrite /alg2poly KVec.initiE //=. qed.

lemma alg2polyK : cancel poly2alg alg2poly.
proof. by move=> v; apply KVec.tP => i hi; rewrite alg2polyE // poly2algE //. qed.

lemma poly2algK : cancel alg2poly poly2alg.
proof. by move=> av; apply eq_vectorP => i hi; rewrite poly2algE 1:/# alg2polyE //. qed.

(* concrete componentwise accessors (replace the deleted mapvE/getvE/polyvecD). *)
lemma nttvE (v : polyvec) i : 0 <= i < kvec => (nttv v).[i] = ntt (v.[i]).
proof. by move=> hi; rewrite /nttv /mapv KVec.mapiE 1:/#. qed.

lemma invnttvE (v : polyvec) i : 0 <= i < kvec => (invnttv v).[i] = invntt (v.[i]).
proof. by move=> hi; rewrite /invnttv /mapv KVec.mapiE 1:/#. qed.

lemma polyvec_addE (v1 v2 : polyvec) i : 0 <= i < kvec => (v1 + v2).[i] = v1.[i] &+ v2.[i].
proof. by move=> hi; rewrite /(+) KVec.initiE 1:/#. qed.

(* alg2poly is an additive morphism: algebraic vector add -> polyvec add. *)
lemma alg2poly_add (av1 av2 : vector) :
  alg2poly (av1 + av2) = alg2poly av1 + alg2poly av2.
proof. apply KVec.tP => i ib; smt(alg2polyE polyvec_addE offunD). qed.

lemma nttmE (m : polymat) i j : 0 <= i < kvec => 0 <= j < kvec => (nttm m).[(i,j)] = ntt (m.[(i,j)]).
proof. by move=> hi hj; rewrite /nttm /mapm /"_.[_]" KMat.mapiE 1:/#. qed.

lemma invnttmE (m : polymat) i j : 0 <= i < kvec => 0 <= j < kvec => (invnttm m).[(i,j)] = invntt (m.[(i,j)]).
proof. by move=> hi hj; rewrite /invnttm /mapm /"_.[_]" KMat.mapiE 1:/#. qed.

(* concrete <-> algebraic matrix bridge (analogue of poly2alg/alg2poly). *)
import KMatrix.Matrix.
op poly2almat (m : polymat) : matrix = offunm (fun i j => m.[(i,j)]).
op alg2polmat (am : matrix) : polymat = KMat.init (fun f => am.[f %/ kvec, f %% kvec]).

lemma poly2almatE (m : polymat) i j :
  0 <= i < kvec => 0 <= j < kvec => (poly2almat m).[i,j] = m.[(i,j)].
proof. by move=> hi hj; rewrite /poly2almat offunmE //=. qed.

(* poly2almat commutes with transpose (concrete trmx <-> algebraic trmx). *)
lemma poly2almat_trmx (m : polymat) :
  poly2almat (trmx m) = KMatrix.Matrix.trmx (poly2almat m).
proof.
apply KMatrix.Matrix.eq_matrixP => i j [hi hj].
rewrite poly2almatE 1,2:/# trmxE poly2almatE 1,2:/# trmxE /#.
qed.

(* foldr over a list = the poly-ring big-sum; the kvec-generic replacement
   for the old `rewrite /kvec -iotaredE` 3-term unfolding. *)
lemma nttsum_big (f : int -> poly) (s : int list) :
  foldr (fun (i : int) (a : poly) => f i &+ a) Rq.zero s
  = Big.BAdd.big predT f s.
proof.
elim: s => [|x l ih] /=.
+ by rewrite Big.BAdd.big_nil.
by rewrite Big.BAdd.big_cons {1}/predT /= ih.
qed.

lemma ntt_dotpE v1 v2 :
  ntt_dotp v1 v2 = Big.BAdd.bigi predT (fun (i : int) => basemul v1.[i] v2.[i]) 0 kvec.
proof. by rewrite /ntt_dotp nttsum_big /range /=. qed.

lemma ntt_mmulE m v :
   poly2alg (ntt_mmul m v) =
   offunv (fun (i : int) => Big.BAdd.bigi predT (fun (j : int) => basemul m.[i, j] v.[j]) 0 kvec).
proof.
apply eq_vectorP => i ib.
rewrite /poly2alg !offunvE //= /ntt_mmul KVec.initiE //=.
by rewrite nttsum_big /range /=.
qed.
