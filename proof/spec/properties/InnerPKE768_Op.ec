(* Operator-form spec module InnerPKE_Op, relocated from MLKEMSecurity768.ec
   so correctness proofs can target it without dragging the security-side
   sampler scaffolding (Hmodule, MLKEM_PRGs, NPRF/PRF clones, H_sem,
   prg_kg_sem).  The three equivs InnerPKE_Op.* ~ InnerPKE768.* are
   re-proven using only Correctness768.ec lemmas (parse_sem, sampleA_sem,
   cbd2sample's proc-op definition).

   MLKEMSecurity768.ec should `require import` this file and discard its
   own redundant copies of these defs/equivs. *)

require import AllCore IntDiv Distr List DList.
from Jasmin require import JWord.
from JazzEC require import Array25 Array32 Array33 Array64 Array128 Array168
                            Array256 Array384 Array768 Array960 Array1024
                            Array1152.

from Spec require import GFq Rq Parameters VecMat Sampling Symmetric Serialization.
from Spec require import KPKE Correctness768 EncDecCorrectness
                          MLKEMLib.

import Zq MLKEMParams PolyVec PolyMat Serialization KPKE.
import KMatrix Vector.
import Symmetric.

(* H is just a renaming wrapper: sampleA factored through inverse-NTT.
   nttm (H rho) = sampleA rho via nttmK. *)
op H(rho : W8.t Array32.t) : polymat = invnttm (sampleA rho).

(* Operator-form PRG composing G_coins_ds with CBD2 sampling.  s, e are
   the two noise polyvecs. *)
op prg_kg_inner(coins : W8.t Array32.t) : W8.t Array32.t * polyvec * polyvec =
  ((G_coins_ds coins).`1,
   KVec.init (fun i => samplePolyCBD (Symmetric.PRF (G_coins_ds coins).`2 (W8.of_int i))),
   KVec.init (fun i => samplePolyCBD (Symmetric.PRF (G_coins_ds coins).`2 (W8.of_int (i + kvec))))).

op prg_enc_inner(coins : W8.t Array32.t) : polyvec * polyvec * poly =
  (KVec.init (fun i => samplePolyCBD (Symmetric.PRF coins (W8.of_int i))),
   KVec.init (fun i => samplePolyCBD (Symmetric.PRF coins (W8.of_int (i + kvec)))),
   samplePolyCBD (Symmetric.PRF coins (W8.of_int (2 * kvec)))).

(* CBD2.sample's proc-op bridge.  Belongs in Correctness768.ec alongside
   sampleA_sem; co-located here pending that relocation. *)
lemma cbd2sample_ph b :
  phoare [SamplePolyCBD.sample : arg = b ==> res = samplePolyCBD b] = 1%r.
proof.
bypr => &m0 ->.
have /= <- := samplePolyCBD_opsem &m0 (samplePolyCBD b) b.
done.
qed.

(* get-after-set on the concrete polyvec is KVec.get_setE; the sampleA
   accessor is now Correctness768.sampleAE — both used directly below. *)

module InnerPKE_Op = {

  proc kg_derand(coins : W8.t Array32.t) : pkey * skey = {
    var t, rho;
    var tv, sv : W8.t BytesPKVec.t;
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
    var c1 : W8.t BytesCtVec.t;
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
    c1 <- encode_vec (compress_polyvec du u);
    c2 <- encode_poly (compress_poly dv v);
    return (c1, c2);
  }

}.

(* === Top-level correctness equivs.  Re-proven directly using only
       Correctness768.ec lemmas; no sampler-bridge indirection. === *)

equiv kg_op_eq :
  InnerPKE_Op.kg_derand ~ KPKE.keygen :
  ={arg} ==> ={res}.
proof.
proc.
(* Align tails (encode12_vec, ntt_mmul, nttv s, nttv e) via wp -- 6 LHS stmts
   and 13 RHS stmts (everything from G_coins_ds onward except the matrix +
   noise whiles, which wp steps over by treating them as opaque). *)
wp 6 13.
(* Match witness inits: shift RHS `a<-witness` past the other 4 witnesses
   so the first 4 stmts on each side align. *)
swap {2} 1 4.
seq 4 4 : #pre; 1: by auto.
(* Step LHS into context: (rho,s,e)<-prg_kg_inner coins; a<-nttm(H rho). *)
sp 2 0.
(* Step RHS: consume a<-witness (one-sided, ignored); (rho,sig)<-G_coins_ds coins;
   _N<-0; then unfold prg_kg_inner so rho{1}=(G_coins_ds coins{1}).`1=rho{2}. *)
sp 0 3.
(* === Matrix while: prove a{2} = sampleA rho{2} = nttm (H rho{1}) = a{1}. === *)
seq 0 2 : (rho{1} = rho{2} /\ sig{2} = (G_coins_ds coins{1}).`2 /\
           a{1} = nttm (H rho{1}) /\ a{2} = sampleA rho{2} /\
           s{1} = (prg_kg_inner coins{1}).`2 /\
           e{1} = (prg_kg_inner coins{1}).`3 /\
           _N{2} = 0).
+ (* Drive RHS matrix while; LHS is empty.  Outer while invariant builds
     a{2} row-by-row; inner while invariant builds a row column-by-column;
     inner body uses parse_sem to characterize Parse(XOF).sample as
     parse rho j i, matching sampleA rho.[i,j]'s definition. *)
  sp 0 1.
  while {2} (0 <= i{2} <= kvec /\ rho{1} = rho{2} /\
             sig{2} = (G_coins_ds coins{1}).`2 /\ _N{2} = 0 /\
             a{1} = nttm (H rho{1}) /\
             s{1} = (prg_kg_inner coins{1}).`2 /\
             e{1} = (prg_kg_inner coins{1}).`3 /\
             (forall ii jj, 0 <= ii < i{2} => 0 <= jj < kvec =>
                (a{2}.[ii, jj])%PolyMat = ((sampleA rho{2}).[ii, jj])%PolyMat))
            (kvec - i{2}).
  + (* outer-body: j<-0; inner while; i<-i+1 *)
    move => &m z; wp.
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
      +  move => &hr Hi Hj ??? H H0 ??? Hst;do split;1..2,4..:smt(sampleAE get_setmE gt0_k).
         move => k??.
         case (k < j{hr}) => ?; 1: by smt(sampleAE get_setmE gt0_k).
         have -> : k = j{hr} by smt().
         by smt(sampleAE get_setmE gt0_k).

    auto => /> /#.
  + auto => />.
    move => &hr; split;1:smt(sampleAE get_setmE gt0_k).
    move => ar ir /=;do split => ??????; 1:by smt(sampleAE get_setmE gt0_k).
    move => ? Hind.
    apply eq_polymatP => ii jj Hi Hj; rewrite Hind /#.
(* === Noise-s while: prove s{2} = prg_kg_inner.`2 via cbd2sample. === *)
seq 0 2 : (rho{1} = rho{2} /\
           a{1} = nttm (H rho{1}) /\ a{2} = sampleA rho{2} /\
           s{1} = (prg_kg_inner coins{1}).`2 /\
           s{2} = (prg_kg_inner coins{1}).`2 /\
           e{1} = (prg_kg_inner coins{1}).`3 /\
           sig{2} = (G_coins_ds coins{1}).`2 /\
           _N{2} = kvec).
+ (* noise-s while body *)
  sp 0 1.
  while {2} (0 <= i{2} <= kvec /\ rho{1} = rho{2} /\
             sig{2} = (G_coins_ds coins{1}).`2 /\ _N{2} = i{2} /\
             a{1} = nttm (H rho{1}) /\ a{2} = sampleA rho{2} /\
             s{1} = (prg_kg_inner coins{1}).`2 /\
             e{1} = (prg_kg_inner coins{1}).`3 /\
             (forall ii, 0 <= ii < i{2} =>
                (s{2}.[ii])
                  = samplePolyCBD (Symmetric.PRF sig{2} (W8.of_int ii))))
            (kvec - i{2}).
  + move => &m z; wp.
    exists * sig, _N; elim * => _sig _N.
    call (cbd2sample_ph (Symmetric.PRF _sig (W8.of_int _N))).
    auto => /> &hr [#] ? Hbnd Hgi Hvar; do split;1..2,4..:smt().
    + move => k Hk0 Hk1; case (k < _N) => ?.
      + by rewrite KVec.get_setE /=; smt().
      have -> : k = _N by smt().
      by rewrite KVec.get_setE /= /#.
    
  auto => /> &1 &2; split; 1: smt(gt0_k).
  move => ir sr;split;1:smt(gt0_k).
  move => ??Hbnd ?; rewrite /prg_kg_inner /=;split;2:smt().
  apply KVec.tP => i Hi.
  by rewrite KVec.initiE //=; smt(KVec.get_setE).
(* === Noise-e while: same shape, _N starts at kvec. === *)
+ (* noise-e while body *)
  sp 0 1.
  while {2} (0 <= i{2} <= kvec /\ rho{1} = rho{2} /\
             sig{2} = (G_coins_ds coins{1}).`2 /\ _N{2} = i{2} + kvec /\
             a{1} = nttm (H rho{1}) /\ a{2} = sampleA rho{2} /\
             s{1} = (prg_kg_inner coins{1}).`2 /\
             s{2} = (prg_kg_inner coins{1}).`2 /\
             e{1} = (prg_kg_inner coins{1}).`3 /\
             (forall ii, 0 <= ii < i{2} =>
                (e{2}.[ii])
                  = samplePolyCBD (Symmetric.PRF sig{2} (W8.of_int (ii + kvec)))))
            (kvec - i{2}).
  + move => &m z; wp.
    exists * sig, _N; elim * => _sig _N.
    call (cbd2sample_ph (Symmetric.PRF _sig (W8.of_int _N))).
    auto => /> &hr [#] ? Hbnd Hgi Hvar; do split; smt(KVec.get_setE gt0_k).

  auto => /> &1 &2; split; 1: smt(gt0_k).
  move => ir er;split;1:smt(gt0_k).
  move => ???Hbnd;congr;congr; rewrite /prg_kg_inner /=; apply KVec.tP => i Hi.
  do congr; 1: by rewrite /H nttmK.
  rewrite KVec.tP => k kb.
  by rewrite Hbnd 1:/# KVec.initiE //=; smt(KVec.get_setE).
qed.

equiv enc_op_eq :
  InnerPKE_Op.enc_derand ~ KPKE.encrypt :
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
      + move => &hr Hi Hj ??? H H0 ??? Hst; do split; 1..2,4..: smt(sampleAE get_setmE trmxE).
        move => k ??.
        case (k < j{hr}) => ?; 1: by smt(sampleAE get_setmE trmxE).
        have -> : k = j{hr} by smt().
        by rewrite get_setmE 1..4:/# /= trmxE 1,2:/# sampleAE 1,2:/#.
    auto => /> /#.
  + auto => />.
    move => &hr; split; 1: smt(sampleAE get_setmE trmxE gt0_k).
    move => ar ir /=; do split => ??????; 1: by smt(sampleAE get_setmE trmxE).
    move => Hind.
    apply eq_polymatP => ii jj Hi Hj; rewrite Hind /#.
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
                (rv{2}.[ii])
                  = samplePolyCBD (Symmetric.PRF coins{2} (W8.of_int ii))))
            (kvec - i{2}).
  + move => &m z; wp.
    exists * coins, _N; elim * => _coins _N.
    call (cbd2sample_ph (Symmetric.PRF _coins (W8.of_int _N))).
    auto => /> &hr [#] ? Hbnd Hgi Hvar; do split; smt(KVec.get_setE gt0_k).
  auto => /> &1; split; 1: smt(gt0_k).
  move => ir rr; split; 1: smt(gt0_k).
  move => Hreq ??Hv; rewrite /prg_enc_inner /=; split; 2: smt().
  apply KVec.tP => i Hi.
  by rewrite KVec.initiE //=; smt().
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
                (e1{2}.[ii])
                  = samplePolyCBD (Symmetric.PRF coins{2} (W8.of_int (ii + kvec)))))
            (kvec - i{2}).
  + move => &m z; wp.
    exists * coins, _N; elim * => _coins _N.
    call (cbd2sample_ph (Symmetric.PRF _coins (W8.of_int _N))).
    auto => /> &hr [#] ? Hbnd Hgi Hvar; do split; smt(KVec.get_setE gt0_k).
  auto => /> &1; split; 1: smt(gt0_k).
  move => ir er; split; 1: smt(gt0_k).
  move => Hreq ?Hbnd Hv; rewrite /prg_enc_inner /=; split; 2: smt().
  apply KVec.tP => i Hi.
  by rewrite KVec.initiE //=; smt().
wp;ecall {2} (cbd2sample_ph (Symmetric.PRF coins{2} (W8.of_int (2*kvec)))).
auto => /> &1.
do congr.
+ (* aT{1} = aT{2}: nttm (trmx (H rho{1})) = trmx (sampleA rho{2}).
     Unfold H = invnttm sampleA; commute trmx with invnttm (both element-wise);
     cancel nttm/invnttm via nttK. *)
  rewrite /H; apply eq_polymatP => i j Hi Hj.
  by rewrite nttmE 1,2:/# trmxE 1,2:/# invnttmE 1,2:/# trmxE 1,2:/# nttK.
qed.

(* dec is already operator-form in InnerPKE768; no Op variant needed.
   If we want symmetry, we can define InnerPKE_Op.dec as a literal copy
   (modulo the plaintext type) and prove a trivial equiv -- skipped for
   now since the dec AVX2 proof already lands directly on InnerPKE768.dec. *)
