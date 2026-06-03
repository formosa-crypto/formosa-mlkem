(* Operator-form spec module InnerPKE_Op for MLKEM-1024, mirror of
   InnerPKE768_Op.ec but parameterized for kvec=4 and the 1024-specific
   array sizes (sk/pk Array1536, ciphertext (Array1408, Array160)) and
   compression widths (11 for u, 5 for v). *)

require import AllCore IntDiv Distr List DList.
from Jasmin require import JWord.
from JazzEC require import Array25 Array32 Array33 Array64 Array128 Array168
                            Array256 Array384 Array768 Array960 Array1024
                            Array1152 Array1408 Array1536 Array160.

from Spec require import GFq Rq VecMat Sampling Symmetric Serialization.
from Spec require import InnerPKE1024 Correctness1024 EncDecCorrectness1024
                          MLKEMLib.

import Zq VecMat1024 PolyVec PolyMat Symmetric1024 Serialization1024 InnerPKE1024.
import KMatrix Vector.
import Symmetric.

(* H is just a renaming wrapper: sampleA factored through inverse-NTT.
   nttm (H rho) = sampleA rho via nttmK. *)
op H(rho : W8.t Array32.t) : polymat = invnttm (sampleA rho).

(* Operator-form PRG composing G_coins_ds with CBD2 sampling.  s, e are
   the two noise polyvecs. *)
op prg_kg_inner(coins : W8.t Array32.t) : W8.t Array32.t * polyvec * polyvec =
  ((G_coins_ds coins).`1,
   KMatrix.Vector.offunv (fun i => cbd2sample (Symmetric.PRF (G_coins_ds coins).`2 (W8.of_int i))),
   KMatrix.Vector.offunv (fun i => cbd2sample (Symmetric.PRF (G_coins_ds coins).`2 (W8.of_int (i + kvec))))).

op prg_enc_inner(coins : W8.t Array32.t) : polyvec * polyvec * poly =
  (KMatrix.Vector.offunv (fun i => cbd2sample (Symmetric.PRF coins (W8.of_int i))),
   KMatrix.Vector.offunv (fun i => cbd2sample (Symmetric.PRF coins (W8.of_int (i + kvec)))),
   cbd2sample (Symmetric.PRF coins (W8.of_int (2 * kvec)))).

(* CBD2.sample's proc-op bridge.  Belongs in Correctness1024.ec alongside
   sampleA_sem; co-located here pending that relocation. *)
lemma cbd2sample_ph b :
  phoare [CBD2.sample : arg = b ==> res = cbd2sample b] = 1%r.
proof.
bypr => &m0 ->.
have /= <- := cbd2sample_opsem &m0 (cbd2sample b) b.
done.
qed.

(* Polyvec get-after-set, co-located from the 768 mirror. *)
lemma getv_setvE x i j (v : polyvec) :
  (v.[i <- x].[j])%Vector
    = if (0 <= j < kvec) then if (i = j) then x else (v.[j])%Vector else Rq.zero
  by smt(setvE getvE getv_out offunvE).

(* sampleA accessor: unfolds the 9-set chain of sampleA's definition.
   (Same proof shape as 768, kvec=4 just means one more set chain hop
   inside sampleA's def, handled by the same setmE/offunmK/mclamp chain.) *)
lemma sampleA_getE sd i j :
  0 <= i < kvec => 0 <= j < kvec =>
  ((sampleA sd).[i, j])%PolyMat = parse sd (W8.of_int j) (W8.of_int i).
proof.
move => Hi Hj.
rewrite /sampleA !setmE !getmE offunmE /= 1:/#.
by rewrite !offunmK /mclamp /kvec /= !Hi !Hj /#.
qed.

module InnerPKE_Op = {

  proc kg_derand(coins : W8.t Array32.t) : pkey * skey = {
    var t, rho;
    var tv, sv : W8.t Array1536.t;
    var a : polymat;
    var s, e : polyvec;
    e <- witness;
    s <- witness;
    sv <- witness;
    tv <- witness;
    (rho, s, e) <- prg_kg_inner coins;
    a <- nttm (H rho);
    s <- nttv s;
    e <- nttv e;
    t <- (ntt_mmul a s + e)%PolyVec;
    tv <- encode12_vec (toipolyvec t);
    sv <- encode12_vec (toipolyvec s);
    return ((tv, rho), sv);
  }

  proc enc_derand(pk : pkey, m : plaintext, r : W8.t Array32.t) : ciphertext = {
    var tv, rho, rv, e1, e2, rhat, u, v, mp, c2, thati;
    var that : polyvec;
    var aT : polymat;
    var c1 : W8.t Array1408.t;
    aT <- witness;
    c1 <- witness;
    e1 <- witness;
    rv <- witness;
    that <- witness;
    (rv, e1, e2) <- prg_enc_inner r;
    (tv, rho) <- pk;
    thati <- decode12_vec tv;
    that <- ofipolyvec thati;
    aT <- nttm (trmx (H rho));
    rhat <- nttv rv;
    u <- (invnttv (ntt_mmul aT rhat) + e1)%PolyVec;
    mp <- decode1 m;
    v <- invntt (ntt_dotp that rhat) &+ e2 &+ decompress_poly 1 mp;
    c1 <- encode11_vec (compress_polyvec 11 u);
    c2 <- encode5 (compress_poly 5 v);
    return (c1, c2);
  }

}.

(* === Top-level correctness equivs.  Re-proven directly using only
       Correctness1024.ec lemmas; no sampler-bridge indirection. === *)

equiv kg_op_eq :
  InnerPKE_Op.kg_derand ~ InnerPKE1024.kg_derand :
  ={arg} ==> ={res}.
proof.
proc.
(* Align tails via wp -- 6 LHS stmts and 13 RHS stmts. *)
wp 6 13.
swap {2} 1 4.
seq 4 4 : #pre; 1: by auto.
sp 2 0.
sp 0 3.
seq 0 2 : (rho{1} = rho{2} /\ sig{2} = (G_coins_ds coins{1}).`2 /\
           a{1} = nttm (H rho{1}) /\ a{2} = sampleA rho{2} /\
           s{1} = (prg_kg_inner coins{1}).`2 /\
           e{1} = (prg_kg_inner coins{1}).`3 /\
           _N{2} = 0).
+ sp 0 1.
  while {2} (0 <= i{2} <= kvec /\ rho{1} = rho{2} /\
             sig{2} = (G_coins_ds coins{1}).`2 /\ _N{2} = 0 /\
             a{1} = nttm (H rho{1}) /\
             s{1} = (prg_kg_inner coins{1}).`2 /\
             e{1} = (prg_kg_inner coins{1}).`3 /\
             (forall ii jj, 0 <= ii < i{2} => 0 <= jj < kvec =>
                (a{2}.[ii, jj])%PolyMat = ((sampleA rho{2}).[ii, jj])%PolyMat))
            (kvec - i{2}).
  + move => &m z; wp.
    while (0 <= j <= kvec /\ rho = rho{m} /\
           (forall jj, 0 <= jj < j =>
              (a.[i, jj])%PolyMat = ((sampleA rho).[i, jj])%PolyMat) /\
           (forall ii jj, 0 <= ii < i => 0 <= jj < kvec =>
              (a.[ii, jj])%PolyMat = ((sampleA rho).[ii, jj])%PolyMat) /\
           0 <= i < kvec)
          (kvec - j).
    + move => z2; wp.
      exists * rho, (W8.of_int j), (W8.of_int i).
      elim * => _rho _j _i.
      pose _st := SHAKE128_ABSORB_34 _rho _j _i.
      have parsesem := parse_sem _st _rho _j _i _; 1: smt().
      call parsesem; inline XOF.init; auto => />.
      +  move => &hr Hi Hj ??? H H0 ??? Hst;do split;1..2,4..:smt(sampleA_getE setmE getmE offunmE).
         move => k??.
         case (k < j{hr}) => ?; 1: by smt(sampleA_getE setmE getmE offunmE).
         have -> : k = j{hr} by smt().
         rewrite  setmE getmE /= offunmE 1:/# /=.
         by smt(sampleA_getE setmE getmE offunmE).

    auto => /> /#.
  + auto => />.
    move => &hr; split;1:smt(sampleA_getE setmE getmE offunmE).
    move => ar ir /=;do split => ??????; 1:by smt(sampleA_getE setmE getmE offunmE).
    move => ?; rewrite getmE => Hind.
    apply eq_matrixP => ii jj Hr; rewrite Hind /#.
seq 0 2 : (rho{1} = rho{2} /\
           a{1} = nttm (H rho{1}) /\ a{2} = sampleA rho{2} /\
           s{1} = (prg_kg_inner coins{1}).`2 /\
           s{2} = (prg_kg_inner coins{1}).`2 /\
           e{1} = (prg_kg_inner coins{1}).`3 /\
           sig{2} = (G_coins_ds coins{1}).`2 /\
           _N{2} = kvec).
+ sp 0 1.
  while {2} (0 <= i{2} <= kvec /\ rho{1} = rho{2} /\
             sig{2} = (G_coins_ds coins{1}).`2 /\ _N{2} = i{2} /\
             a{1} = nttm (H rho{1}) /\ a{2} = sampleA rho{2} /\
             s{1} = (prg_kg_inner coins{1}).`2 /\
             e{1} = (prg_kg_inner coins{1}).`3 /\
             (forall ii, 0 <= ii < i{2} =>
                (s{2}.[ii])%Vector
                  = cbd2sample (Symmetric.PRF sig{2} (W8.of_int ii))))
            (kvec - i{2}).
  + move => &m z; wp.
    exists * sig, _N; elim * => _sig _N.
    call (cbd2sample_ph (Symmetric.PRF _sig (W8.of_int _N))).
    auto => /> &hr [#] ? Hbnd Hgi Hvar; do split;1..2,4..:smt().
    + move => k Hk0 Hk1; case (k < _N) => ?.
      + by rewrite getv_setvE /=; smt().
      have -> : k = _N by smt().
      by rewrite getv_setvE /= /#.

  auto => /> &1 &2; split; 1: smt().
  move => ir sr;split;1:smt().
  move => ??Hbnd ?; rewrite /prg_kg_inner /=;split;2:smt().
  apply eq_vectorP => i Hi.
  by rewrite offunvE //=; smt(getv_setvE).
+ sp 0 1.
  while {2} (0 <= i{2} <= kvec /\ rho{1} = rho{2} /\
             sig{2} = (G_coins_ds coins{1}).`2 /\ _N{2} = i{2} + kvec /\
             a{1} = nttm (H rho{1}) /\ a{2} = sampleA rho{2} /\
             s{1} = (prg_kg_inner coins{1}).`2 /\
             s{2} = (prg_kg_inner coins{1}).`2 /\
             e{1} = (prg_kg_inner coins{1}).`3 /\
             (forall ii, 0 <= ii < i{2} =>
                (e{2}.[ii])%Vector
                  = cbd2sample (Symmetric.PRF sig{2} (W8.of_int (ii + kvec)))))
            (kvec - i{2}).
  + move => &m z; wp.
    exists * sig, _N; elim * => _sig _N.
    call (cbd2sample_ph (Symmetric.PRF _sig (W8.of_int _N))).
    auto => /> &hr [#] ? Hbnd Hgi Hvar; do split;1..2,4..:smt().
    + move => k Hk0 Hk1; case (k < i{hr}) => ?.
      + by rewrite getv_setvE /=; smt().
      have -> : k = i{hr} by smt().
      by rewrite getv_setvE /= /#.

  auto => /> &1 &2; split; 1: smt().
  move => ir er;split;1:smt().
  move => ???Hbnd;congr;congr; rewrite /prg_kg_inner /=; apply eq_vectorP => i Hi.
  do congr; 1: by rewrite /H nttmK.
  rewrite eq_vectorP => k kb.
  by rewrite Hbnd 1:/# offunvE //=; smt(getv_setvE).
qed.

equiv enc_op_eq :
  InnerPKE_Op.enc_derand ~ InnerPKE1024.enc_derand :
  ={arg} ==> ={res}.
proof.
proc.
seq 5 5 : #pre; 1: by auto.
sp 5 0.
sp 0 4.
seq 0 2 : (r{1} = coins{2} /\ m{1} = m{2} /\
           rho{1} = rho{2} /\
           that{1} = that{2} /\
           rv{1} = (prg_enc_inner r{1}).`1 /\
           e1{1} = (prg_enc_inner r{1}).`2 /\
           e2{1} = (prg_enc_inner r{1}).`3 /\
           aT{1} = nttm (trmx (H rho{1})) /\
           aT{2} = trmx (sampleA rho{2}) /\
           _N{2} = 0).
+ sp 0 1.
  while {2} (0 <= i{2} <= kvec /\ r{1} = coins{2} /\ m{1} = m{2} /\
             rho{1} = rho{2} /\
             that{1} = that{2} /\ _N{2} = 0 /\
             rv{1} = (prg_enc_inner r{1}).`1 /\
             e1{1} = (prg_enc_inner r{1}).`2 /\
             e2{1} = (prg_enc_inner r{1}).`3 /\
             aT{1} = nttm (trmx (H rho{1})) /\
             (forall ii jj, 0 <= ii < i{2} => 0 <= jj < kvec =>
                (aT{2}.[ii, jj])%PolyMat = ((trmx (sampleA rho{2})).[ii, jj])%PolyMat))
            (kvec - i{2}).
  + move => &m z; wp.
    while (0 <= j <= kvec /\ rho = rho{m} /\
           (forall jj, 0 <= jj < j =>
              (aT.[i, jj])%PolyMat = ((trmx (sampleA rho)).[i, jj])%PolyMat) /\
           (forall ii jj, 0 <= ii < i => 0 <= jj < kvec =>
              (aT.[ii, jj])%PolyMat = ((trmx (sampleA rho)).[ii, jj])%PolyMat) /\
           0 <= i < kvec)
          (kvec - j).
    + move => z2; wp.
      exists * rho, (W8.of_int i), (W8.of_int j).
      elim * => _rho _i _j.
      pose _st := SHAKE128_ABSORB_34 _rho _i _j.
      have parsesem := parse_sem _st _rho _i _j _; 1: smt().
      call parsesem; inline XOF.init; auto => />.
      + move => &hr Hi Hj ??? H H0 ??? Hst; do split; 1..2,4..: smt(sampleA_getE setmE getmE offunmE trmxE).
        move => k ??.
        case (k < j{hr}) => ?; 1: by smt(sampleA_getE setmE getmE offunmE trmxE).
        have -> : k = j{hr} by smt().
        rewrite setmE getmE /= offunmE 1:/# /=.
        by smt(sampleA_getE setmE getmE offunmE trmxE).
    auto => /> /#.
  + auto => />.
    move => &hr; split; 1: smt(sampleA_getE setmE getmE offunmE trmxE).
    move => ar ir /=; do split => ??????; 1: by smt(sampleA_getE setmE getmE offunmE trmxE).
    rewrite /trmx getmE => Hind.
    apply eq_matrixP => ii jj Hr; rewrite Hind /#.
seq 0 2 : (r{1} = coins{2} /\ m{1} = m{2} /\
           rho{1} = rho{2} /\
           that{1} = that{2} /\
           rv{1} = (prg_enc_inner r{1}).`1 /\
           rv{2} = (prg_enc_inner r{1}).`1 /\
           e1{1} = (prg_enc_inner r{1}).`2 /\
           e2{1} = (prg_enc_inner r{1}).`3 /\
           aT{1} = nttm (trmx (H rho{1})) /\
           aT{2} = trmx (sampleA rho{2}) /\
           _N{2} = kvec).
+ sp 0 1.
  while {2} (0 <= i{2} <= kvec /\ r{1} = coins{2} /\ m{1} = m{2} /\
             rho{1} = rho{2} /\
             that{1} = that{2} /\ _N{2} = i{2} /\
             rv{1} = (prg_enc_inner r{1}).`1 /\
             e1{1} = (prg_enc_inner r{1}).`2 /\
             e2{1} = (prg_enc_inner r{1}).`3 /\
             aT{1} = nttm (trmx (H rho{1})) /\
             aT{2} = trmx (sampleA rho{2}) /\
             (forall ii, 0 <= ii < i{2} =>
                (rv{2}.[ii])%Vector
                  = cbd2sample (Symmetric.PRF coins{2} (W8.of_int ii))))
            (kvec - i{2}).
  + move => &m z; wp.
    exists * coins, _N; elim * => _coins _N.
    call (cbd2sample_ph (Symmetric.PRF _coins (W8.of_int _N))).
    auto => /> &hr [#] ? Hbnd Hgi Hvar; do split; 1..2,4..: smt().
    + move => k Hk0 Hk1; case (k < _N) => ?.
      + by rewrite getv_setvE /=; smt().
      have -> : k = _N by smt().
      by rewrite getv_setvE /= /#.
  auto => /> &1; split; 1: smt().
  move => ir rr; split; 1: smt().
  move => Hreq ??Hv; rewrite /prg_enc_inner /=; split; 2: smt().
  apply eq_vectorP => i Hi.
  rewrite offunvE //=; have := Hv i _; 1: smt().
  by rewrite -getvE => ->.
seq 0 2 : (r{1} = coins{2} /\ m{1} = m{2} /\
           rho{1} = rho{2} /\
           that{1} = that{2} /\
           rv{1} = (prg_enc_inner r{1}).`1 /\
           rv{2} = (prg_enc_inner r{1}).`1 /\
           e1{1} = (prg_enc_inner r{1}).`2 /\
           e1{2} = (prg_enc_inner r{1}).`2 /\
           e2{1} = (prg_enc_inner r{1}).`3 /\
           aT{1} = nttm (trmx (H rho{1})) /\
           aT{2} = trmx (sampleA rho{2}) /\
           _N{2} = 2 * kvec).
+ sp 0 1.
  while {2} (0 <= i{2} <= kvec /\ r{1} = coins{2} /\ m{1} = m{2} /\
             rho{1} = rho{2} /\
             that{1} = that{2} /\ _N{2} = i{2} + kvec /\
             rv{1} = (prg_enc_inner r{1}).`1 /\
             rv{2} = (prg_enc_inner r{1}).`1 /\
             e1{1} = (prg_enc_inner r{1}).`2 /\
             e2{1} = (prg_enc_inner r{1}).`3 /\
             aT{1} = nttm (trmx (H rho{1})) /\
             aT{2} = trmx (sampleA rho{2}) /\
             (forall ii, 0 <= ii < i{2} =>
                (e1{2}.[ii])%Vector
                  = cbd2sample (Symmetric.PRF coins{2} (W8.of_int (ii + kvec)))))
            (kvec - i{2}).
  + move => &m z; wp.
    exists * coins, _N; elim * => _coins _N.
    call (cbd2sample_ph (Symmetric.PRF _coins (W8.of_int _N))).
    auto => /> &hr [#] ? Hbnd Hgi Hvar; do split; 1..2,4..: smt().
    + move => k Hk0 Hk1; case (k < i{hr}) => ?.
      + by rewrite getv_setvE /=; smt().
      have -> : k = i{hr} by smt().
      by rewrite getv_setvE /= /#.
  auto => /> &1; split; 1: smt().
  move => ir er; split; 1: smt().
  move => Hreq ?Hbnd Hv; rewrite /prg_enc_inner /=; split; 2: smt().
  apply eq_vectorP => i Hi.
  rewrite offunvE //=; have := Hv i _; 1: smt().
  by rewrite -getvE => ->.
wp;ecall {2} (cbd2sample_ph (Symmetric.PRF coins{2} (W8.of_int (2*kvec)))).
auto => /> &1.
do congr.
+ rewrite /H; apply eq_matrixP => i j [Hi Hj].
by rewrite /nttm /invnttm !mapmE  offunmE 1:/# /= trmxE /=; smt(offunmE nttK).
qed.

(* dec is already operator-form in InnerPKE1024; no Op variant needed. *)
