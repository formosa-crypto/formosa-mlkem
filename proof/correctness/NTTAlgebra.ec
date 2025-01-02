(* Correction proof of the NTT *)

(* This file contains the correction proof of the procedures NTT.ntt and NTT.invntt from NTT_Fq. *)
(* The proof is made by game hopping, by proving that gradually less optimized versions of ntt and invntt are equivalent, *)
(* and then by proving that the most naive version is equivalent to a high level spec, which itself implies the spec required by the other proofs in hamlkem. *)
(* The equivalence is as follows: *)
(* NTT_Fq.NTT.(inv)ntt <=> NTT_opt.(inv)ntt <=> NTT_bsrev.(inv)ntt <=> NTT_naive.(inv)ntt *)
(*                                                                 <=> (inv)ntt_spec <=> (inv)ntt *)
(* Where the first line contains procedures and the second high level mathematical definitions. *)
(* The jump from NTT_Fq.NTT to NTT_opt is a reverse inlining that splits the ntt into 3 auxiliary functions, and the invntt into 4, to make proofs more modular. *)
(* The jump from NTT_opt to NTT_bsrev removes many easy to deal with optimizations, and NTT_bsrev only involves "for" loops, that are easier to deal with using For. *)
(* The jump from NTT_bsrev to NTT_naive changes the order of the two innermost "for" loops to go from bitreverse ordering to normal ordering. *)
(* The jump from NTT_naive to (inv)ntt_spec is the actual correction proof. *)
(* The jump from (inv)ntt_spec to (inv)ntt proves that the high level specification implies the specification needed outside of this file. *)

require import AllCore IntDiv List Ring ZModP StdOrder IntMin Number Real RealExp BitEncoding.
require import IntDiv_extra For.

from JazzEC require import Array128 Array256.

from CryptoSpecs require import GFq Rq Correctness.

require import Montgomery NTT_Fq MLKEMFCLib.

require Matrix.

import IntOrder BitReverse.

(*
(* Various clones needed *)
abstract theory DFT.
  clone import Ring.IDomain as Domain.

  clone import Bigalg.BigComRing as BigDom with
    type  CR.t     <= t,
      op  CR.zeror <= Domain.zeror,
      op  CR.oner  <= Domain.oner,
      op  CR.(+)   <= Domain.(+),
      op  CR.([-]) <= Domain.([-]),
      op  CR.( * ) <= Domain.( * ),
      op  CR.invr  <= Domain.invr,
    pred  CR.unit  <= Domain.unit
    proof CR.*.

  realize CR.addrA     by exact: Domain.addrA    .
  realize CR.addrC     by exact: Domain.addrC    .
  realize CR.add0r     by exact: Domain.add0r    .
  realize CR.addNr     by exact: Domain.addNr    .
  realize CR.oner_neq0 by exact: Domain.oner_neq0.
  realize CR.mulrA     by exact: Domain.mulrA    .
  realize CR.mulrC     by exact: Domain.mulrC    .
  realize CR.mul1r     by exact: Domain.mul1r    .
  realize CR.mulrDl    by exact: Domain.mulrDl   .
  realize CR.mulVr     by exact: Domain.mulVr    .
  realize CR.unitP     by exact: Domain.unitP    .
  realize CR.unitout   by exact: Domain.unitout  .

  op a : t.
  op n : { int | 0 < n } as gt0_n.

  hint exact : gt0_n.

  clone import Matrix with
    type  ZR.t     <= t,
      op  size     <= n,
      op  ZR.zeror <= Domain.zeror,
      op  ZR.oner  <= Domain.oner,
      op  ZR.(+)   <= Domain.(+),
      op  ZR.([-]) <= Domain.([-]),
      op  ZR.( * ) <= Domain.( * ),
      op  ZR.invr  <= Domain.invr,
    pred  ZR.unit  <= Domain.unit
    proof ZR.*, ge0_size.

  realize ZR.addrA     by exact: Domain.addrA    .
  realize ZR.addrC     by exact: Domain.addrC    .
  realize ZR.add0r     by exact: Domain.add0r    .
  realize ZR.addNr     by exact: Domain.addNr    .
  realize ZR.oner_neq0 by exact: Domain.oner_neq0.
  realize ZR.mulrA     by exact: Domain.mulrA    .
  realize ZR.mulrC     by exact: Domain.mulrC    .
  realize ZR.mul1r     by exact: Domain.mul1r    .
  realize ZR.mulrDl    by exact: Domain.mulrDl   .
  realize ZR.mulVr     by exact: Domain.mulVr    .
  realize ZR.unitP     by exact: Domain.unitP    .
  realize ZR.unitout   by exact: Domain.unitout  .
  realize ZR.mulf_eq0  by exact: Domain.mulf_eq0 .
  realize ge0_size     by apply/ltzW/gt0_n.
      
  (* `a` is a principle `n`-th root of unity *)
  axiom aXn_eq1 : exp a n = oner.

  axiom sum_aXi_eq0 : forall k, 0 < k < n =>
    BAdd.bigi predT (fun i => exp a (i * k)) 0 n = zeror.

  hint exact : aXn_eq1.

  lemma unit_a : unit a.
  proof. by apply/(@unitP _ (exp a (n - 1))); rewrite mulrC -exprS //; [smt(gt0_n)]. qed.

  hint exact : unit_a.

  lemma sum_aXi_dvd_eq0 : forall k, ! (n %| k) =>
    BAdd.bigi predT (fun i => exp a (i * k)) 0 n = zeror.
  proof.
  move=> k h; pose F i := exp a (i * (k %% n)).
  rewrite -(BAdd.eq_big_int _ _ F) => /= [i rg_i|] @/F => {F}.
    rewrite {2}(divz_eq k n) mulrDr exprD //.
    rewrite !(mulzC i) -mulrA mulrCA (@exprM _ n).
    by rewrite aXn_eq1 expr1z mul1r.
  apply: sum_aXi_eq0; rewrite ltz_pmod //=.
  rewrite ltr_neqAle modz_ge0 1:gtr_eqF //=.
  by rewrite eq_sym; apply: contra h => h; apply: dvdzE.
  qed.

  op dft (v : vector) =
    offunv (fun k => BAdd.bigi predT (fun j => v.[j] * exp a (j * k)) 0 n).

  op dftV (v : vector) =
    offunv (fun k => invr (ofint n) *
      BAdd.bigi predT (fun j => v.[j] * exp a (- (j * k))) 0 n).

  lemma dftK : unit (ofint n) => cancel dft dftV.
  proof.
  move=> ut_n v; apply/eq_vectorP=> i rg_i; rewrite offunvE //=.
  apply: (mulrI (ofint n)) => //; rewrite mulrA divrr // mul1r.
  pose F j := BAdd.bigi predT (fun j' => v.[j'] * exp a (j * (j' - i))) 0 n.
  rewrite -(BAdd.eq_big_int _ _ F) => /= [k rg_k @/F|].
    rewrite /dft !offunvE //= BAdd.mulr_suml.
    rewrite &(BAdd.eq_big_int) => /= k' rg_k'.
    by rewrite -mulrA -exprD // (@mulzC k' k) IntID.mulrBr.
  rewrite /F BAdd.exchange_big => {F} /=.
  pose F j' := v.[j'] * BAdd.bigi predT (fun j => exp a (j * (j' - i))) 0 n.
  rewrite -(BAdd.eq_big_int _ _ F) => /= [k rg_k @/F|].
    by rewrite BAdd.mulr_sumr.
  rewrite /F /= (BAdd.bigD1 _ _ i) 1,2:(mem_range, range_uniq) //=.
  rewrite BAdd.sumri_const 1:/# /= expr0 -/(ofint _) (@mulrC v.[i]).
  rewrite BAdd.big_seq_cond BAdd.big1 ?addr0 //= => j.
  case=> [/mem_range rg_j @/predC1 ne_ji] {F}.
  by rewrite sum_aXi_dvd_eq0 ?mulr0 //; apply/negP=> /dvdzP[q] /#.
  qed.

end DFT.
*)

from CryptoSpecs require import MLKEM.
import Zq.

theory NTTequiv.

  clone import Bigalg.BigComRing as BigFq with
    type  CR.t        <- coeff,
      op  CR.zeror <- Zq.zero,
      op  CR.oner  <- Zq.one,
      op  CR.(+)   <- Zq.(+),
      op  CR.([-]) <- Zq.([-]),
      op  CR.( * ) <- Zq.( * ),
      op  CR.invr  <- Zq.inv,
    pred  CR.unit  <- Zq.unit.

  (* In order to keep the same names for the variables, all subsequent NTT modules will use these. *)
  module NTT_vars = {
    var r                       : coeff Array256.t
    var zetas, zetas_inv        : coeff Array128.t
    var len, start, j, zetasctr : int
    var t, zeta_                : coeff
  }.

  (* Non inlined version of the NTT, where each while loop is separated into it's own function. *)
  module NTT_opt = {

    proc ntt_inner() = {
      NTT_vars.zetasctr <- NTT_vars.zetasctr + 1;
      NTT_vars.zeta_    <- NTT_vars.zetas.[NTT_vars.zetasctr]; 
      NTT_vars.j        <- NTT_vars.start;
      while (NTT_vars.j < NTT_vars.start + NTT_vars.len) {
        NTT_vars.t                             <- NTT_vars.zeta_ * NTT_vars.r.[NTT_vars.j + NTT_vars.len];
        NTT_vars.r.[NTT_vars.j + NTT_vars.len] <- NTT_vars.r.[NTT_vars.j] + (-NTT_vars.t);
        NTT_vars.r.[NTT_vars.j]                <- NTT_vars.r.[NTT_vars.j] + NTT_vars.t;
        NTT_vars.j                             <- NTT_vars.j + 1;
      }
      NTT_vars.start <- NTT_vars.j + NTT_vars.len;
    }

    proc ntt_outer() = {
      NTT_vars.start <- 0;
      while(NTT_vars.start < 256) {
        ntt_inner ();
      }
      NTT_vars.len <- NTT_vars.len %/ 2;
    }

    proc ntt() = {
      NTT_vars.zetasctr <- 0;
      NTT_vars.len      <- 128;
      while (2 <= NTT_vars.len) {
        ntt_outer();
      }     
      return NTT_vars.r;
    }

    proc invntt_inner() = {
      NTT_vars.zeta_    <- NTT_vars.zetas_inv.[NTT_vars.zetasctr]; 
      NTT_vars.zetasctr <- NTT_vars.zetasctr + 1;
      NTT_vars.j        <- NTT_vars.start;
      while (NTT_vars.j < NTT_vars.start + NTT_vars.len) {
        NTT_vars.t                             <- NTT_vars.r.[NTT_vars.j];
        NTT_vars.r.[NTT_vars.j]                <- NTT_vars.t + NTT_vars.r.[NTT_vars.j + NTT_vars.len];
        NTT_vars.r.[NTT_vars.j + NTT_vars.len] <- NTT_vars.t + (-NTT_vars.r.[NTT_vars.j + NTT_vars.len]);
        NTT_vars.r.[NTT_vars.j + NTT_vars.len] <- NTT_vars.zeta_ * NTT_vars.r.[NTT_vars.j + NTT_vars.len];
        NTT_vars.j                             <- NTT_vars.j + 1;
      }
      NTT_vars.start <- NTT_vars.j + NTT_vars.len;
    }

    proc invntt_outer() = {
      NTT_vars.start <- 0;
      while(NTT_vars.start < 256) {
        invntt_inner();
      }
      NTT_vars.len <- NTT_vars.len * 2;
    }

    proc invntt_post() = {
      NTT_vars.j <- 0;
      while (NTT_vars.j < 256) {
        NTT_vars.r.[NTT_vars.j] <- NTT_vars.r.[NTT_vars.j] * NTT_vars.zetas_inv.[127]; 
        NTT_vars.j              <- NTT_vars.j + 1;
      }
    }

    proc invntt() = {
      NTT_vars.zetasctr <- 0;
      NTT_vars.len      <- 2;
      while (NTT_vars.len <= 128) {
        invntt_outer();
      }
      invntt_post();
      return NTT_vars.r;
    }

  }.

  equiv inline_ntt :
    NTT_Fq.NTT.ntt ~ NTT_opt.ntt:
    arg{1} = (NTT_vars.r{2},NTT_vars.zetas{2}) ==>
    ={res}.
  proof.
    proc; inline {2} NTT_opt.ntt_outer; inline {2} NTT_opt.ntt_inner; wp.
    while(r{1}        = NTT_vars.r{2} /\
          zetas{1}    = NTT_vars.zetas{2} /\
          zetasctr{1} = NTT_vars.zetasctr{2} /\
          len{1}      = NTT_vars.len{2});
    [wp|by wp; skip].
    while(r{1}        = NTT_vars.r{2} /\
          zetas{1}    = NTT_vars.zetas{2} /\
          zetasctr{1} = NTT_vars.zetasctr{2} /\
          len{1}      = NTT_vars.len{2} /\
          start{1}    = NTT_vars.start{2});
    [wp|by wp; skip].
    while(r{1}        = NTT_vars.r{2} /\
          zetas{1}    = NTT_vars.zetas{2} /\
          zetasctr{1} = NTT_vars.zetasctr{2} /\
          len{1}      = NTT_vars.len{2} /\
          zeta_{1}    = NTT_vars.zeta_{2} /\
          start{1}    = NTT_vars.start{2} /\
          j{1}        = NTT_vars.j{2});
    [by wp; skip|by wp; skip].
  qed.

  equiv inline_invntt :
    NTT_Fq.NTT.invntt ~ NTT_opt.invntt:
    arg{1} = (NTT_vars.r{2},NTT_vars.zetas_inv{2}) ==>
    ={res}.
  proof.
    proc; inline {2} NTT_opt.invntt_outer; inline {2} NTT_opt.invntt_inner.
    inline {2} NTT_opt.invntt_post; wp.
    while(r{1}         = NTT_vars.r{2} /\
          zetas_inv{1} = NTT_vars.zetas_inv{2} /\
          j{1}         = NTT_vars.j{2});
    [by wp; skip|wp].
    while(r{1}         = NTT_vars.r{2} /\
          zetas_inv{1} = NTT_vars.zetas_inv{2} /\
          zetasctr{1}  = NTT_vars.zetasctr{2} /\
          len{1}       = NTT_vars.len{2});
    [wp|by wp; skip].
    while(r{1}         = NTT_vars.r{2} /\
          zetas_inv{1} = NTT_vars.zetas_inv{2} /\
          zetasctr{1}  = NTT_vars.zetasctr{2} /\
          len{1}       = NTT_vars.len{2} /\
          start{1}     = NTT_vars.start{2});
    [wp|by wp; skip].
    while(r{1}         = NTT_vars.r{2} /\
          zetas_inv{1} = NTT_vars.zetas_inv{2} /\
          zetasctr{1}  = NTT_vars.zetasctr{2} /\
          len{1}       = NTT_vars.len{2} /\
          zeta_{1}     = NTT_vars.zeta_{2} /\
          start{1}     = NTT_vars.start{2} /\
          j{1}         = NTT_vars.j{2});
    [by wp; skip|by wp; skip].
  qed.

  (* Less optimized version of the NTT: *)
  (* - the value of NTT_vars.zetasctr is computed at every loop run, instead of being continuously updated *)
  (* - NTT_vars.j is replaced by the stopping value of the loop of which it is the index after said loop *)
  module NTT_bsrev = {

    proc ntt_inner() = {
      NTT_vars.zetasctr <- (256 + NTT_vars.start) %/ (NTT_vars.len * 2);
      NTT_vars.zeta_    <- NTT_vars.zetas.[NTT_vars.zetasctr];
      NTT_vars.j        <- NTT_vars.start;
      while (NTT_vars.j < NTT_vars.start + NTT_vars.len) {
        NTT_vars.t                             <- NTT_vars.zeta_ * NTT_vars.r.[NTT_vars.j + NTT_vars.len];
        NTT_vars.r.[NTT_vars.j + NTT_vars.len] <- NTT_vars.r.[NTT_vars.j] + (-NTT_vars.t);
        NTT_vars.r.[NTT_vars.j]                <- NTT_vars.r.[NTT_vars.j] + NTT_vars.t;
        NTT_vars.j                             <- NTT_vars.j + 1;
      }
      NTT_vars.start <- NTT_vars.start + NTT_vars.len * 2;
    }

    proc ntt_outer() = {
      NTT_vars.start <- 0;
      while(NTT_vars.start < 256) {
        ntt_inner ();
      }
      NTT_vars.len <- NTT_vars.len %/ 2;
    }

    proc ntt() = {
      NTT_vars.len      <- 128;
      while (2 <= NTT_vars.len) {
        ntt_outer();
      }     
      return NTT_vars.r;
    }

    proc invntt_inner() = {
      NTT_vars.zetasctr <- 128 + (-512 + NTT_vars.start) %/ (NTT_vars.len * 2);
      NTT_vars.zeta_    <- NTT_vars.zetas_inv.[NTT_vars.zetasctr];
      NTT_vars.j        <- NTT_vars.start;
      while (NTT_vars.j < NTT_vars.start + NTT_vars.len) {
        NTT_vars.t                             <- NTT_vars.r.[NTT_vars.j];
        NTT_vars.r.[NTT_vars.j]                <- NTT_vars.t + NTT_vars.r.[NTT_vars.j + NTT_vars.len];
        NTT_vars.r.[NTT_vars.j + NTT_vars.len] <- NTT_vars.t + (-NTT_vars.r.[NTT_vars.j + NTT_vars.len]);
        NTT_vars.r.[NTT_vars.j + NTT_vars.len] <- NTT_vars.zeta_ * NTT_vars.r.[NTT_vars.j + NTT_vars.len];
        NTT_vars.j                             <- NTT_vars.j + 1;
      }
      NTT_vars.start <- NTT_vars.start + NTT_vars.len * 2;
    }

    proc invntt_outer() = {
      NTT_vars.start <- 0;
      while(NTT_vars.start < 256) {
        invntt_inner();
      }
      NTT_vars.len <- NTT_vars.len * 2;
    }

    proc invntt_post() = {
      NTT_vars.j <- 0;
      while (NTT_vars.j < 256) {
        NTT_vars.r.[NTT_vars.j] <- NTT_vars.r.[NTT_vars.j] * NTT_vars.zetas_inv.[127];
        NTT_vars.j              <- NTT_vars.j + 1;
      }
    }

    proc invntt() = {
      NTT_vars.len      <- 2;
      while (NTT_vars.len <= 128) {
        invntt_outer();
      }
      invntt_post();
      return NTT_vars.r;
    }

  }.

  op P_optimize_ntt (zetas1 zetas2 : coeff Array128.t) =
    zetas1 = zetas2 .

  op Q_optimize_ntt (_ : int) l1 (_ : int) (s : int * int * (coeff Array256.t * coeff Array256.t)) =
    ( l1 < 128 => s.`1 = s.`2 ) /\
    s.`1 + 1 = 256 %/ (l1 * 2) /\
    s.`3.`1 = s.`3.`2.

  op inv_optimize_ntt zetas1 zetas2 =
    RHL_FOR_NAT_DIV_GE2.inv
    2 2 2 2 128 128
    ( P_optimize_ntt zetas1 zetas2 )
    Q_optimize_ntt.

  op P_optimize_ntt_outer zetas1 zetas2 =
    RHL_FOR_NAT_DIV_GE2.context
    2 2 2 2 128 128
    ( P_optimize_ntt zetas1 zetas2 ).

  op Q_optimize_ntt_outer
    len1 (_ : int) s1 (_ : int) (s : int * int * (coeff Array256.t * coeff Array256.t)) =
    ( len1 < 128 \/ 0 < s1 => s.`1 = s.`2 ) /\
    s.`1 + 1 = (256 + s1) %/ (len1 * 2) /\
    s.`3.`1 = s.`3.`2.

  op inv_optimize_ntt_outer zetas1 zetas2 len1 len2 =
    RHL_FOR_INT_ADD_LT2.inv
      256 256 (len1 * 2) (len2 * 2) 0 0
      ( P_optimize_ntt_outer zetas1 zetas2 len1 len2 )
      ( Q_optimize_ntt_outer len1 ).

  op P_optimize_ntt_inner
    zetas1 zetas2 len1 len2 start1 start2 (zetasctr1 zetasctr2 : int) (zeta_1 zeta_2 : coeff) =
    RHL_FOR_INT_ADD_LT2.context
      256 256 (len1 * 2) (len2 * 2) 0 0
      ( P_optimize_ntt_outer zetas1 zetas2 len1 len2 )
      start1 start2 /\
    zetasctr1 = zetasctr2 /\
    zetasctr1 = (256 + start1) %/ (len1 * 2) /\
    zeta_1 = zeta_2.

  op Q_optimize_ntt_inner (_ _ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    s.`1 = s.`2.

  op inv_optimize_ntt_inner
    zetas1 zetas2 (len1 len2 start1 start2 zetasctr1 zetasctr2 : int) zeta_1 zeta_2 =
    RHL_FOR_INT_ADD_LT2.inv
      (start1 + len1) (start2 + len2) 1 1 start1 start2
      ( P_optimize_ntt_inner zetas1 zetas2 len1 len2 start1 start2 zetasctr1 zetasctr2 zeta_1 zeta_2 )
      Q_optimize_ntt_inner.

  equiv optimize_ntt_inner :
    NTT_opt.ntt_inner ~ NTT_bsrev.ntt_inner :
    inv_optimize_ntt_outer
      NTT_vars.zetas{1} NTT_vars.zetas{2}
      NTT_vars.len{1} NTT_vars.len{2}
      NTT_vars.start{1} NTT_vars.start{2}
      (NTT_vars.zetasctr{1}, NTT_vars.zetasctr{2},
       (NTT_vars.r{1}, NTT_vars.r{2})) /\
    NTT_vars.start{1} < 256 /\ NTT_vars.start{2} < 256 ==>
    inv_optimize_ntt_outer
      NTT_vars.zetas{1} NTT_vars.zetas{2}
      NTT_vars.len{1} NTT_vars.len{2}
      NTT_vars.start{1} NTT_vars.start{2}
      (NTT_vars.zetasctr{1}, NTT_vars.zetasctr{2},
       (NTT_vars.r{1}, NTT_vars.r{2})) /\
    (NTT_vars.start{1} < 256 <=> NTT_vars.start{2} < 256).
  proof.
    proc; wp.
    while (
      inv_optimize_ntt_inner
        NTT_vars.zetas{1} NTT_vars.zetas{2}
        NTT_vars.len{1} NTT_vars.len{2}
        NTT_vars.start{1} NTT_vars.start{2}
        NTT_vars.zetasctr{1} NTT_vars.zetasctr{2}
        NTT_vars.zeta_{1} NTT_vars.zeta_{2}
        NTT_vars.j{1} NTT_vars.j{2}
        (NTT_vars.r{1}, NTT_vars.r{2}) );
    wp.
    + skip => &1 &2; rewrite /inv_optimize_ntt_inner /=.
      apply/RHL_FOR_INT_ADD_LT2.inv_in => //=.
      - move => -[[[_]]] /= [k] [/mem_range mem_k_range] [->> ->>].
        rewrite (divz_pow_range _ _ _ mem_k_range) //=.
        by rewrite (exprSr_sub_range _ _ _ mem_k_range) //= expr_gt0.
      move => [[[_]]] /= [kl] [/mem_range mem_kl_range] [->> ->>].
      rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
      rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //.
      move => [ks] [/mem_range mem_ks_range] [->> ->>] [<<- [_<<-]] ? <<- kj.
      move => /mem_range mem_kj_range ->> ->>.
      by rewrite /Q_optimize_ntt_inner /= => <<-; rewrite !addrA //=.
    skip => &1 &2; rewrite {1}/inv_optimize_ntt_outer => inv_start.
    move: (RHL_FOR_INT_ADD_LT2.invP _ _ _ _ _ _ _ _ _ _ _ _ inv_start).
    + move => [_] /= [k] [/mem_range mem_k_range] [->> ->>].
      rewrite (divz_pow_range _ _ _ mem_k_range) //=.
      by rewrite (exprSr_sub_range _ _ _ mem_k_range) //=  expr_gt0.
    move => [[zetas_spec]] /= [kl] [/mem_range mem_kl_range] [->> ->>].
    rewrite (divz_pow_range _ _ _ mem_kl_range) //= mulr_gt0 ?expr_gt0 //.
    move => [ks] [/mem_range mem_ks_range] [->>] [->>] [/= imp_zetasctr] [eq_zetasctr <<-].
    split => //.
    + rewrite /inv_optimize_ntt_inner; apply/RHL_FOR_INT_ADD_LT2.inv_0_inv => //=; split.
      - move: inv_start; rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
        apply/RHL_FOR_INT_ADD_LT2.inv_context => //= _.
        by rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0.
      by rewrite zetas_spec eq_zetasctr.
    move => j1 r1 j2 r2 /=; rewrite /inv_optimize_ntt_inner.
    pose R (j1 _ : int) (s : coeff Array256.t * coeff Array256.t) :=
      inv_optimize_ntt_outer
        NTT_vars.zetas{1} NTT_vars.zetas{2} (2 ^ (7 - kl)) (2 ^ (7 - kl))
        (j1 + 2 ^ (7 - kl)) (ks * (2 ^ (7 - kl) * 2) + 2 ^ (7 - kl) * 2)
        (NTT_vars.zetasctr{1} + 1, (256 + ks * (2 ^ (7 - kl) * 2)) %/ (2 ^ (7 - kl) * 2), s) /\
      (j1 + 2 ^ (7 - kl) < 256 <=>
       ks * (2 ^ (7 - kl) * 2) + 2 ^ (7 - kl) * 2 < 256).
    apply/(RHL_FOR_INT_ADD_LT2.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
    rewrite /R ger_addl lerNgt expr_gt0 //= -lerNgt => {R inv_start}.
    rewrite eq_zetasctr zetas_spec (exprSr_sub_range _ _ _ mem_kl_range) //=.
    move => {eq_zetasctr zetas_spec}.
    rewrite ler_add2l addrAC /= divzMDr; [by rewrite gtr_eqF // expr_gt0|].
    rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //= -addrA -mulr2z intmulz.
    rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= .
    move => -[[P_optimize_ntt_outer _] _].
    move => {r1 r2} [r1 r2]; rewrite /Q_optimize_ntt_inner /= => <<-.
    rewrite /inv_optimize_ntt_outer (exprSr_sub_range _ _ _ mem_kl_range) //=; split => //=.
    rewrite expr_gt0 //= (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=; exists (ks + 1).
    rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= in mem_ks_range.
    rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //= in mem_ks_range.
    rewrite mulrDl /= le2_mem_range mem_range_addr /=; split.
    + by move: mem_ks_range; apply mem_range_incl.
    split => //=; rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= -mulrSl divzMDr.
    + by rewrite gtr_eqF // expr_gt0.
    by rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //= addrAC.
  qed.

  equiv optimize_ntt_outer :
    NTT_opt.ntt_outer ~ NTT_bsrev.ntt_outer :
    inv_optimize_ntt
      NTT_vars.zetas{1} NTT_vars.zetas{2}
      NTT_vars.len{1} NTT_vars.len{2}
      (NTT_vars.zetasctr{1},NTT_vars.zetasctr{2} ,
       (NTT_vars.r{1}, NTT_vars.r{2})) /\
    2 <= NTT_vars.len{1} /\ 2 <= NTT_vars.len{2} ==>
    inv_optimize_ntt
      NTT_vars.zetas{1} NTT_vars.zetas{2}
      NTT_vars.len{1} NTT_vars.len{2}
      (NTT_vars.zetasctr{1},NTT_vars.zetasctr{2} ,
       (NTT_vars.r{1}, NTT_vars.r{2})) /\
    (2 <= NTT_vars.len{1} <=> 2 <= NTT_vars.len{2}).
  proof.
    proc; wp.
    while (
      inv_optimize_ntt_outer
        NTT_vars.zetas{1} NTT_vars.zetas{2}
        NTT_vars.len{1} NTT_vars.len{2}
        NTT_vars.start{1} NTT_vars.start{2}
        (NTT_vars.zetasctr{1},NTT_vars.zetasctr{2} ,
         (NTT_vars.r{1}, NTT_vars.r{2})) );
    wp; first by call optimize_ntt_inner.
    skip => &1 &2; rewrite {1}/inv_optimize_ntt => inv_len.
    move: (RHL_FOR_NAT_DIV_GE2.invP _ _ _ _ _ _ _ _ _ _ _ _ inv_len); [by trivial|].
    move => [P] [k] [/mem_range mem_k_range] [->>] [->>]. 
    move: inv_len; rewrite /= (divz_pow_range _ _ _ mem_k_range) //= => inv_len inv_start.
    rewrite /= in mem_k_range; split => //.
    + rewrite /inv_optimize_ntt_outer; apply/RHL_FOR_INT_ADD_LT2.inv_0_inv => //=.
      - by rewrite (exprSr_sub_range _ _ _ mem_k_range) //= expr_gt0.
      by move: inv_len; apply/RHL_FOR_NAT_DIV_GE2.inv_context.
    move => {inv_len P inv_start} /=.
    move => r1 start1 zetasctr1 r2 start2 zetasctr2; rewrite /inv_optimize_ntt_outer.
    pose R (_ _ : int) s :=
      inv_optimize_ntt
        NTT_vars.zetas{1} NTT_vars.zetas{2} (2 ^ (7 - k) %/ 2) (2 ^ (7 - k) %/ 2) s.
    apply/(RHL_FOR_INT_ADD_LT2.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
    + by rewrite (exprSr_sub_range _ _ _ mem_k_range) //= expr_gt0.
    rewrite (exprSr_sub_range _ _ _ mem_k_range) //= expr_gt0 //= => -[zetas_spec _].
    move => {zetasctr1 zetasctr2 r1 r2} [zetasctr1 zetasctr2 [r1 r2]].
    rewrite (NdivzN_pow_sub_range _ _ _ mem_k_range) //=.
    rewrite (exprD_nneg_sub_range _ _ _ mem_k_range) //= /R => {R}.
    rewrite /Q_optimize_ntt_outer /= => -[<<-] [eq_zetasctr <<-].
    rewrite (exprSr_sub_range _ _ _ mem_k_range) //= in eq_zetasctr.
    rewrite (divz_pow_sub_range _ _ _ mem_k_range) //= in eq_zetasctr.
    rewrite /inv_optimize_ntt; split => //=; exists (k + 1).
    rewrite (pow_div1_sub_range _ _ _ mem_k_range) //=.
    rewrite  (divz_pow_add_range _ _ _ mem_k_range) //=; split.
    + by rewrite le2_mem_range mem_range_addr; move: mem_k_range; apply mem_range_incl.
    split => //=; rewrite (exprSr_sub_range _ _ _ mem_k_range) //=.
    by rewrite (divz_pow_sub_range _ _ _ mem_k_range).
  qed.

  equiv optimize_ntt :
    NTT_opt.ntt ~ NTT_bsrev.ntt :
    NTT_vars.r{1} = NTT_vars.r{2} /\
    NTT_vars.zetas{1} = NTT_vars.zetas{2} ==>
    ={res}.
  proof.
    proc.
    while (
      inv_optimize_ntt
        NTT_vars.zetas{1} NTT_vars.zetas{2}
        NTT_vars.len{1} NTT_vars.len{2}
        (NTT_vars.zetasctr{1},NTT_vars.zetasctr{2} ,
         (NTT_vars.r{1}, NTT_vars.r{2})) );
    wp; first by call optimize_ntt_outer.
    skip => &1 &2 [<<- ->>].
    rewrite /inv_optimize_ntt; split.
    + by rewrite RHL_FOR_NAT_DIV_GE2.inv_0.
    move => len1 r1 zetasctr1 len2 r2 zetasctr2.
    pose R (_ _ : int) (s : int * int * (coeff Array256.t * coeff Array256.t)) :=
      (s.`3.`1 = s.`3.`2).
    apply/(RHL_FOR_NAT_DIV_GE2.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
    by rewrite /R /Q_optimize_ntt => {R} _ [? ? [? ?]] /= [_] [_].
  qed.

  op P_optimize_invntt (zetas_inv1 zetas_inv2 : coeff Array128.t) =
    zetas_inv1 = zetas_inv2.

  op Q_optimize_invntt (k : int) l1 (_ : int) (s : int * int * (coeff Array256.t * coeff Array256.t)) =
    ( 2 < l1 => s.`1 - 1 = s.`2 ) /\
    s.`1 = 128 + (-512) %/ (l1 * 2) /\
    s.`3.`1 = s.`3.`2.

  op inv_optimize_invntt zetas_inv1 zetas_inv2 =
    RHL_FOR_NAT_MUL_LE2.inv
    128 128 2 2 2 2
    ( P_optimize_invntt zetas_inv1 zetas_inv2 )
    Q_optimize_invntt.

  op P_optimize_invntt_outer zetas_inv1 zetas_inv2 =
    RHL_FOR_NAT_MUL_LE2.context
    128 128 2 2 2 2
    ( P_optimize_invntt zetas_inv1 zetas_inv2 ).

  op Q_optimize_invntt_outer
    len1 (_ : int) s1 (_ : int) (s : int * int * (coeff Array256.t * coeff Array256.t)) =
    ( 2 < len1 \/ 0 < s1 => s.`1 - 1 = s.`2 ) /\
    s.`1 = 128 + (-512 + s1) %/ (len1 * 2) /\
    s.`3.`1 = s.`3.`2.

  op inv_optimize_invntt_outer zetas_inv1 zetas_inv2 len1 len2 =
    RHL_FOR_INT_ADD_LT2.inv
      256 256 (len1 * 2) (len2 * 2) 0 0
      ( P_optimize_invntt_outer zetas_inv1 zetas_inv2 len1 len2 )
      ( Q_optimize_invntt_outer len1 ).

  op P_optimize_invntt_inner
    zetas_inv1 zetas_inv2 len1 len2 start1 start2 (zetasctr1 zetasctr2 : int) (zeta_1 zeta_2 : coeff) =
    RHL_FOR_INT_ADD_LT2.context
      256 256 (len1 * 2) (len2 * 2) 0 0
      ( P_optimize_invntt_outer zetas_inv1 zetas_inv2 len1 len2 )
      start1 start2 /\
    zetasctr1 - 1 = zetasctr2 /\
    zetasctr1 = 128 + (-512 + start1) %/ (len1 * 2) + 1 /\
    zeta_1 = zeta_2.

  op Q_optimize_invntt_inner (_ _ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    s.`1 = s.`2.

  op inv_optimize_invntt_inner
    zetas_inv1 zetas_inv2 (len1 len2 start1 start2 zetasctr1 zetasctr2 : int) zeta_1 zeta_2 =
    RHL_FOR_INT_ADD_LT2.inv
      (start1 + len1) (start2 + len2) 1 1 start1 start2
      ( P_optimize_invntt_inner zetas_inv1 zetas_inv2 len1 len2 start1 start2 zetasctr1 zetasctr2 zeta_1 zeta_2 )
      Q_optimize_invntt_inner.

  op P_optimize_invntt_post (zetas_inv1 zetas_inv2 : coeff Array128.t) =
    zetas_inv1 = zetas_inv2.

  op Q_optimize_invntt_post (_ _ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    s.`1 = s.`2.

  op inv_optimize_invntt_post zetas_inv1 zetas_inv2 =
    RHL_FOR_INT_ADD_LT2.inv
      256 256 1 1 0 0
      ( P_optimize_invntt_post zetas_inv1 zetas_inv2 )
      ( Q_optimize_invntt_post ).

  equiv optimize_invntt_inner :
    NTT_opt.invntt_inner ~ NTT_bsrev.invntt_inner :
    inv_optimize_invntt_outer
      NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
      NTT_vars.len{1} NTT_vars.len{2}
      NTT_vars.start{1} NTT_vars.start{2}
      (NTT_vars.zetasctr{1}, NTT_vars.zetasctr{2},
       (NTT_vars.r{1}, NTT_vars.r{2})) /\
    NTT_vars.start{1} < 256 /\ NTT_vars.start{2} < 256 ==>
    inv_optimize_invntt_outer
      NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
      NTT_vars.len{1} NTT_vars.len{2}
      NTT_vars.start{1} NTT_vars.start{2}
      (NTT_vars.zetasctr{1}, NTT_vars.zetasctr{2},
       (NTT_vars.r{1}, NTT_vars.r{2})) /\
    (NTT_vars.start{1} < 256 <=> NTT_vars.start{2} < 256).
  proof.
    proc; wp.
    while (
      inv_optimize_invntt_inner
        NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
        NTT_vars.len{1} NTT_vars.len{2}
        NTT_vars.start{1} NTT_vars.start{2}
        NTT_vars.zetasctr{1} NTT_vars.zetasctr{2}
        NTT_vars.zeta_{1} NTT_vars.zeta_{2}
        NTT_vars.j{1} NTT_vars.j{2}
        (NTT_vars.r{1}, NTT_vars.r{2}) );
    wp.
    + skip => &1 &2; rewrite /inv_optimize_invntt_inner /=.
      apply/RHL_FOR_INT_ADD_LT2.inv_in => //=.
      - move => -[[[_]]] /= [k] [/mem_range mem_k_range] [->> ->>].
        rewrite (exprS_range _ _ _ mem_k_range) //=.
        by rewrite (exprSr_add_range _ _ _ mem_k_range) //= expr_gt0.
      move => [[[_]]] /= [kl] [/mem_range mem_kl_range] [->> ->>].
      rewrite (exprS_range _ _ _ mem_kl_range) //=.
      rewrite (exprSr_add_range _ _ _ mem_kl_range) //= expr_gt0 //.
      move => [ks] [/mem_range mem_ks_range] [->> ->>] [imp_zetasctr [_<<-]] ? <<- kj.
      move => /mem_range mem_kj_range ->> ->>.
      by rewrite /Q_optimize_invntt_inner /= => <<-; rewrite !addrA.
    skip => &1 &2; rewrite {1}/inv_optimize_invntt_outer => inv_start.
    move: (RHL_FOR_INT_ADD_LT2.invP _ _ _ _ _ _ _ _ _ _ _ _ inv_start).
    + move => [_] /= [k] [/mem_range mem_k_range] [->> ->>].
      rewrite (exprS_range _ _ _ mem_k_range) //=.
      by rewrite (exprSr_add_range _ _ _ mem_k_range) //=  expr_gt0.
    move => [[zetas_inv_spec]] /= [kl] [/mem_range mem_kl_range] [->> ->>].
    rewrite (exprS_range _ _ _ mem_kl_range) //= mulr_gt0 ?expr_gt0 //.
    move => [ks] [/mem_range mem_ks_range] [->>] [->>] /= [imp_zetasctr] [eq_zetasctr] /= <<-.
    split => //.
    + rewrite /inv_optimize_invntt_inner; apply/RHL_FOR_INT_ADD_LT2.inv_0_inv => //=; split.
      - move: inv_start; rewrite (exprS_range _ _ _ mem_kl_range) //=.
        apply/RHL_FOR_INT_ADD_LT2.inv_context => //= _.
        by rewrite (exprSr_add_range _ _ _ mem_kl_range) //= expr_gt0.
      by rewrite zetas_inv_spec /NTT_Fq.zetas_inv eq_zetasctr.
    move => j1 r1 j2 r2 /=; rewrite /inv_optimize_invntt_inner.
    pose R (j1 _ : int) (s : coeff Array256.t * coeff Array256.t) :=
      inv_optimize_invntt_outer
        NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2} (2 ^ (kl + 1)) (2 ^ (kl + 1))
        (j1 + 2 ^ (kl + 1)) (ks * (2 ^ (kl + 1) * 2) + 2 ^ (kl + 1) * 2)
        (NTT_vars.zetasctr{1} + 1,
         128 + ((-512) + ks * (2 ^ (kl + 1) * 2)) %/ (2 ^ (kl + 1) * 2), s) /\
      (j1 + 2 ^ (kl + 1) < 256 <=> ks * (2 ^ (kl + 1) * 2) + 2 ^ (kl + 1) * 2 < 256).
    apply/(RHL_FOR_INT_ADD_LT2.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
    rewrite /R ger_addl lerNgt expr_gt0 //= -lerNgt => {R inv_start}.
    rewrite eq_zetasctr zetas_inv_spec (exprSr_add_range _ _ _ mem_kl_range) //=.
    move => {eq_zetasctr zetas_inv_spec}.
    rewrite ler_add2l addrAC /= divzMDr; [by rewrite gtr_eqF // expr_gt0|].
    rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= -addrA -mulr2z intmulz.
    rewrite (exprSr_add_range _ _ _ mem_kl_range) //= .
    move => -[[P_optimize_invntt_outer _] _].
    move => {r1 r2} [r1 r2]; rewrite /Q_optimize_invntt_inner /= => <<-.
    rewrite /inv_optimize_invntt_outer (exprSr_add_range _ _ _ mem_kl_range) //=; split => //=.
    rewrite expr_gt0 //= mulNr /= (NdivzN_pow_add_range _ _ _ mem_kl_range) //=; exists (ks + 1).
    rewrite (exprSr_add_range _ _ _ mem_kl_range) //= in mem_ks_range.
    rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //= in mem_ks_range.
    rewrite mulrDl /= le2_mem_range mem_range_addr /=; split.
    + by move: mem_ks_range; apply mem_range_incl.
    split => //=; rewrite (exprSr_add_range _ _ _ mem_kl_range) //= -mulrSl divzMDr.
    + by rewrite gtr_eqF // expr_gt0.
    by rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= mulNr /= !addrA (IntID.addrAC _ _ 1).
  qed.

  equiv optimize_invntt_outer :
    NTT_opt.invntt_outer ~ NTT_bsrev.invntt_outer :
    inv_optimize_invntt
      NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
      NTT_vars.len{1} NTT_vars.len{2}
      (NTT_vars.zetasctr{1},NTT_vars.zetasctr{2} ,
       (NTT_vars.r{1}, NTT_vars.r{2})) /\
    NTT_vars.len{1} <= 128 /\ NTT_vars.len{2} <= 128 ==>
    inv_optimize_invntt
      NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
      NTT_vars.len{1} NTT_vars.len{2}
      (NTT_vars.zetasctr{1},NTT_vars.zetasctr{2} ,
       (NTT_vars.r{1}, NTT_vars.r{2})) /\
    (NTT_vars.len{1} <= 128 <=> NTT_vars.len{2} <= 128).
  proof.
    proc; wp.
    while (
      inv_optimize_invntt_outer
        NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
        NTT_vars.len{1} NTT_vars.len{2}
        NTT_vars.start{1} NTT_vars.start{2}
        (NTT_vars.zetasctr{1},NTT_vars.zetasctr{2} ,
         (NTT_vars.r{1}, NTT_vars.r{2})) );
    wp; first by call optimize_invntt_inner.
    skip => &1 &2; rewrite {1}/inv_optimize_invntt => inv_len.
    move: (RHL_FOR_NAT_MUL_LE2.invP _ _ _ _ _ _ _ _ _ _ _ _ inv_len); [by trivial|].
    move => [P] [k] [/mem_range mem_k_range] [->>] [->>]. 
    move: inv_len; rewrite /= (exprS_range _ _ _ mem_k_range) //= => inv_len inv_start.
    rewrite /= in mem_k_range; split => //.
    + rewrite /inv_optimize_invntt_outer; apply/RHL_FOR_INT_ADD_LT2.inv_0_inv => //=.
      - by rewrite (exprSr_add_range _ _ _ mem_k_range) //= expr_gt0.
      by move: inv_len; apply/RHL_FOR_NAT_MUL_LE2.inv_context.
    move => {inv_len P inv_start} /=.
    move => r1 start1 zetasctr1 r2 start2 zetasctr2; rewrite /inv_optimize_invntt_outer.
    rewrite (exprSr_add_range _ _ _ mem_k_range) //=.
    pose R (_ _ : int) s :=
      inv_optimize_invntt NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2} (2 ^ (k + 2)) (2 ^ (k + 2)) s.
    apply/(RHL_FOR_INT_ADD_LT2.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
    + by rewrite expr_gt0.
    rewrite expr_gt0 //= => -[zetas_spec _].
    move => {zetasctr1 zetasctr2 r1 r2} [zetasctr1 zetasctr2 [r1 r2]].
    rewrite (NdivzN_pow_add_range _ _ _ mem_k_range) //=.
    rewrite (exprD_nneg_sub_add_range _ _ _ mem_k_range) //= /R => {R}.
    rewrite /Q_optimize_invntt_outer /= => -[imp_zetasctr] [eq_zetasctr <<-].
    rewrite (exprSr_add_range _ _ _ mem_k_range) //= in eq_zetasctr.
    rewrite (divz_pow_add_range _ _ _ mem_k_range) //= in eq_zetasctr.
    rewrite /inv_optimize_invntt; split => //=; exists (k + 1).
    rewrite (exprS_add_range _ _ _ mem_k_range) //=; split.
    + by rewrite le2_mem_range mem_range_addr; move: mem_k_range; apply mem_range_incl.
    split => //=; rewrite (exprSr_add_range _ _ _ mem_k_range) //=.
    by rewrite (divz_pow_add_range _ _ _ mem_k_range).
  qed.

  equiv optimize_invntt_post :
    NTT_opt.invntt_post ~ NTT_bsrev.invntt_post :
    NTT_vars.r{1} = NTT_vars.r{2} /\
    NTT_vars.zetas_inv{1} = NTT_vars.zetas_inv{2} ==>
    NTT_vars.r{1} = NTT_vars.r{2}.
  proof.
    proc.
    while (
      inv_optimize_invntt_post
        NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
        NTT_vars.j{1} NTT_vars.j{2}
        (NTT_vars.r{1}, NTT_vars.r{2}) ).
    + wp; skip => &1 &2 /=; rewrite /inv_optimize_invntt_post.
      apply/RHL_FOR_INT_ADD_LT2.inv_in => //=.
      by move => -> ? <<- k mem_k_range ->> ->> /= <-.
    wp; skip => &1 &2 [<<- ->>]; rewrite /inv_optimize_invntt_post /=; split.
    + by apply/RHL_FOR_INT_ADD_LT2.inv_0_inv.
    move => j1 r1 j2 r2.
    pose R (_ _ : int) (s : coeff Array256.t * coeff Array256.t) :=
      (s.`1 = s.`2).
    by apply/(RHL_FOR_INT_ADD_LT2.inv_out _ _ _ _ _ _ _ _ _ R).
  qed.

  equiv optimize_invntt :
    NTT_opt.invntt ~ NTT_bsrev.invntt :
    NTT_vars.r{1} = NTT_vars.r{2} /\
    NTT_vars.zetas_inv{1} = NTT_vars.zetas_inv{2} ==>
    ={res}.
  proof.
    proc.
    call optimize_invntt_post.
    while (
      inv_optimize_invntt
        NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
        NTT_vars.len{1} NTT_vars.len{2}
        (NTT_vars.zetasctr{1},NTT_vars.zetasctr{2} ,
         (NTT_vars.r{1}, NTT_vars.r{2})) );
    wp; first by call optimize_invntt_outer.
    skip => &1 &2 [<<- ->>].
    rewrite /inv_optimize_invntt; split.
    + by apply/RHL_FOR_NAT_MUL_LE2.inv_0.
    move => len1 r1 zetasctr1 len2 r2 zetasctr2 /=.
    pose R (_ _ : int) (s : int * int * (coeff Array256.t * coeff Array256.t)) :=
      (s.`3.`1 = s.`3.`2).
    apply/(RHL_FOR_NAT_MUL_LE2.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
    by rewrite /R /Q_optimize_invntt => {R} _ [? ? [? ?]] /= [].
  qed.


  (* Compared to NTT_bsrev, the order of the two innermost loops is bitreversed. *)
  module NTT_naive = {

    proc ntt_inner() = {
      NTT_vars.zetasctr <- bsrev 8 ((NTT_vars.start * 2 + 1) * (128 %/ NTT_vars.len));
      NTT_vars.zeta_    <- NTT_vars.zetas.[NTT_vars.zetasctr];
      NTT_vars.j        <- 0;
      while (NTT_vars.j < 256) {
        NTT_vars.t <-
          NTT_vars.zeta_ * NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.len + NTT_vars.start)];
        NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.len + NTT_vars.start)] <-
          NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.start)] + (-NTT_vars.t);
        NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.start)] <-
          NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.start)] + NTT_vars.t;
        NTT_vars.j <- NTT_vars.j + NTT_vars.len * 2;
      }
      NTT_vars.start <- NTT_vars.start + 1;
    }

    proc ntt_outer() = {
      NTT_vars.start <- 0;
      while(NTT_vars.start < NTT_vars.len) {
        ntt_inner ();
      }
      NTT_vars.len <- NTT_vars.len * 2;
    }

    proc ntt() = {
      NTT_vars.len <- 1;
      while (NTT_vars.len <= 64) {
        ntt_outer();
      }     
      return NTT_vars.r;
    }

    proc invntt_inner() = {
      NTT_vars.zetasctr <- bsrev 8 ((NTT_vars.start * 2 + 1) * (128 %/ NTT_vars.len) - 2);
      NTT_vars.zeta_    <- NTT_vars.zetas_inv.[NTT_vars.zetasctr];
      NTT_vars.j        <- 0;
      while (NTT_vars.j < 256) {
        NTT_vars.t <-
          NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.start)];
        NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.start)] <-
          NTT_vars.t + NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.len + NTT_vars.start)];
        NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.len + NTT_vars.start)] <-
          NTT_vars.t + (-NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.len + NTT_vars.start)]);
        NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.len + NTT_vars.start)] <-
          NTT_vars.zeta_ * NTT_vars.r.[bsrev 8 (NTT_vars.j + NTT_vars.len + NTT_vars.start)];
        NTT_vars.j <- NTT_vars.j + NTT_vars.len * 2;
      }
      NTT_vars.start <- NTT_vars.start + 1;
    }

    proc invntt_outer() = {
      NTT_vars.start <- 0;
      while(NTT_vars.start < NTT_vars.len) {
        invntt_inner();
      }
      NTT_vars.len <- NTT_vars.len %/ 2;
    }

    proc invntt_post() = {
      NTT_vars.j <- 0;
      while (NTT_vars.j < 256) {
        NTT_vars.r.[bsrev 8 NTT_vars.j] <- NTT_vars.r.[bsrev 8 NTT_vars.j] * NTT_vars.zetas_inv.[127];
        NTT_vars.j              <- NTT_vars.j + 1;
      }
    }

    proc invntt() = {
      NTT_vars.len      <- 64;
      while (1 <= NTT_vars.len) {
        invntt_outer();
      }
      invntt_post();
      return NTT_vars.r;
    }

  }.

  op r_bsrev_ntt_inner (zetas : coeff Array128.t) len start r j =
    set2_add_mulr r
      zetas.[((256 %/ len) + (start %/ len)) %/ 2]
      j (j + len).

  op r_naive_ntt_inner (zetas : coeff Array128.t) len start (r : coeff Array256.t) j =
    perm (bsrev 8)
      ( set2_add_mulr (perm (bsrev 8) r)
          zetas.[bsrev 8 ((start * 2 + 1) * (128 %/ len))]
          (j + start) (j + len + start)).

  op r_bsrev_ntt_inner_foldl zetas len start r k =
    foldl (r_bsrev_ntt_inner zetas len start) r (map (( + )%Int start) (range 0 k)).

  op r_naive_ntt_inner_foldl zetas len start r k =
    foldl (r_naive_ntt_inner zetas len start) r (map (transpose ( * )%Int (len * 2)) (range 0 k)).

  op r_bsrev_ntt_outer zetas len r start =
    r_bsrev_ntt_inner_foldl zetas len start r len.

  op r_naive_ntt_outer zetas len r start =
    r_naive_ntt_inner_foldl zetas len start r (128 %/ len).

  op r_bsrev_ntt_outer_foldl zetas len r k =
    foldl (r_bsrev_ntt_outer zetas len) r (map (transpose ( * )%Int (len * 2)) (range 0 k)).

  op r_naive_ntt_outer_foldl zetas len r k =
    foldl (r_naive_ntt_outer zetas len) r (range 0 k).

  op r_bsrev_ntt zetas r len =
    r_bsrev_ntt_outer_foldl zetas len r (128 %/ len).

  op r_naive_ntt zetas r len =
    r_naive_ntt_outer_foldl zetas len r len.

  op P_bsrev_ntt (zetas1 zetas2 : coeff Array128.t) =
    zetas1 = zetas2.

  op Q_bsrev_ntt (_ _ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    s.`1 = s.`2.

  op inv_bsrev_ntt zetas1 zetas2 =
    RHL_FOR_NAT_DIV_GE_MUL_LE.inv
    2 64 2 2 128 1
    (P_bsrev_ntt zetas1 zetas2)
    Q_bsrev_ntt.

  op P_bsrev_ntt_outer zetas1 zetas2 =
    RHL_FOR_NAT_DIV_GE_MUL_LE.context
    2 64 2 2 128 1
    (P_bsrev_ntt zetas1 zetas2).

  op Q_bsrev_ntt_outer
    zetas1 zetas2 (len1 len2 : int) k (_ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    exists r ,
      s.`1 = r_bsrev_ntt_outer_foldl zetas1 len1 r k  /\
      s.`2 = r_naive_ntt_outer_foldl zetas2 len2 r k.

  op inv_bsrev_ntt_outer zetas1 zetas2 len1 len2 =
    RHL_FOR_INT_ADD_LT2.inv
      256 len2 (len1 * 2) 1 0 0
      ( P_bsrev_ntt_outer zetas1 zetas2 len1 len2 )
      ( Q_bsrev_ntt_outer zetas1 zetas2 len1 len2 ).

  op P_bsrev_ntt_inner
    zetas1 zetas2 len1 len2 start1 start2 (zeta_1 zeta_2 : coeff) =
    RHL_FOR_INT_ADD_LT2.context
      256 len2 (len1 * 2) 1 0 0
      ( P_bsrev_ntt_outer zetas1 zetas2 len1 len2 )
      start1 start2 /\
    zeta_1 = zetas1.[(256 + start1) %/ (len1 * 2)] /\
    zeta_2 = zetas2.[bsrev 8 ((start2 * 2 + 1) * (128 %/ len2))].

  op Q_bsrev_ntt_inner
    zetas1 zetas2 (len1 len2 start1 start2 : int) k (_ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    exists r ,
      s.`1 = r_bsrev_ntt_inner_foldl zetas1 len1 start1
               (r_bsrev_ntt_outer_foldl zetas1 len1 r (start1 %/ (len1 * 2))) k /\
      s.`2 = r_naive_ntt_inner_foldl zetas2 len2 start2
               (r_naive_ntt_outer_foldl zetas2 len2 r start2) k.

  op inv_bsrev_ntt_inner
    zetas1 zetas2 (len1 len2 start1 start2 : int) zeta_1 zeta_2 =
    RHL_FOR_INT_ADD_LT2.inv
      (start1 + len1) 256 1 (len2 * 2) start1 0
      ( P_bsrev_ntt_inner zetas1 zetas2 len1 len2 start1 start2 zeta_1 zeta_2 )
      ( Q_bsrev_ntt_inner zetas1 zetas2 len1 len2 start1 start2 ).

  lemma is_perm_bsrev_8 :
    is_perm (bsrev 8).
  proof.
    move: (bsrev_range_pow2_perm_eq 8 8) => /=.
    rewrite (eq_map (( * ) 1) idfun) => [? //=|].
    by rewrite map_id perm_eq_sym.
  qed.

  lemma mem_add_j_start_range kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    kj * 2 ^ (kl + 1) + ks \in range 0 256.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    rewrite mem_range_addr mem_range_mulr; [by rewrite expr_gt0|].
    move: mem_kj_range; apply mem_range_incl.
    + rewrite lez_NdivNRL /=; [by rewrite expr_gt0|].
      by rewrite ler_oppl; move: mem_ks_range; apply mem_range_le.
    rewrite opprD /= divzDl.
    + rewrite vp_le_pow_dvd // ler_norml /= le2_mem_range.
      by rewrite mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= opprD mulNr /=.
    rewrite divz_small // -mem_range; move: mem_ks_range; apply mem_range_incl => //.
    rewrite normrX ler_weexpn2l // ler_addl /=.
    by move: mem_kl_range; apply mem_range_le.
  qed.

  lemma mem_add_j_len_start_range kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    kj * 2 ^ (kl + 1) + 2 ^ kl + ks \in range 0 256.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    rewrite -addrA mem_range_addr mem_range_mulr; [by rewrite expr_gt0|].
    move: mem_kj_range; apply mem_range_incl.
    + rewrite lez_NdivNRL /=; [by rewrite expr_gt0|].
      by rewrite ler_oppl addr_ge0 ?expr_ge0 //; move: mem_ks_range; apply mem_range_le.
    rewrite opprD /= divzDl.
    + rewrite vp_le_pow_dvd // ler_norml /= le2_mem_range.
      by rewrite mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= opprD mulNr /=.
    rewrite divz_small // -mem_range normrX mem_range_addl.
    move: mem_ks_range; apply mem_range_incl => //=.
    + by rewrite ler_oppl expr_ge0.
    rewrite ler_subr_addr -mulr2z intmulz exprSr //.
    by move: mem_kl_range; apply mem_range_le.
  qed.

  lemma bsrev_mem_add_j_start_range kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    kj + ks * 2 ^ (8 - kl) \in range 0 256.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    rewrite mem_range_addr; move: mem_kj_range; apply mem_range_incl.
    + rewrite /= ler_oppl mulr_ge0; [|by rewrite expr_ge0].
      by move: mem_ks_range; apply mem_range_le.
    rewrite ler_subr_addr -ler_subr_addl -lez_divRL; [by rewrite expr_gt0|].
    move: mem_ks_range; apply mem_range_ge.
    rewrite -ler_subl_addr lez_divRL; [by rewrite expr_gt0|].
    rewrite ler_subr_addr mulrDl -exprD_nneg.
    + by move: mem_kl_range; apply mem_range_le.
    + by rewrite subr_ge0; move: mem_kl_range; apply mem_range_ge.
    rewrite addrA (IntID.addrAC kl) /= mulNr /= - addrA -ler_subr_addl /= addrC subr_le0.
    by rewrite ler_weexpn2l // ler_add2r /= subr_ge0; move: mem_kl_range; apply mem_range_ge.
  qed.

  lemma bsrev_mem_add_j_len_start_range kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    kj + 2 ^ (7 - kl) + ks * 2 ^ (8 - kl) \in range 0 256.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    rewrite -addrA mem_range_addr; move: mem_kj_range; apply mem_range_incl.
    + rewrite /= ler_oppl addr_ge0; [by rewrite expr_ge0|].
      rewrite  mulr_ge0; [|by rewrite expr_ge0].
      by move: mem_ks_range; apply mem_range_le.
    rewrite ler_subr_addr addrA -mulr2z intmulz (exprSr_sub_range _ _ _ mem_kl_range) //=.
    rewrite addrC -mulrSl -lez_divRL; [by rewrite expr_gt0|].
    rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //= -ltzE.
    by move: mem_ks_range; apply mem_range_gt.
  qed.

  lemma bsrev_start_range kl ks :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    bsrev 8 ks %/ 2 ^ (8 - kl) \in range 0 (2 ^ (kl + 1)).
  proof.
    move => mem_kl_range mem_ks_range.
    rewrite range_div_range /=; [by rewrite expr_gt0|].
    rewrite (exprD_nneg_add_sub_range _ _ _ mem_kl_range) //=.
    by move: (bsrev_range 8 ks); apply mem_range_incl.
  qed.

  lemma bsrev_len_start_range kl ks :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    2 ^ kl + bsrev 8 ks %/ 2 ^ (8 - kl) \in range 0 (2 ^ (kl + 1)).
  proof.
    move => mem_kl_range mem_ks_range.
    rewrite mem_range_addl range_div_range /=; [by rewrite expr_gt0|].
    rewrite exprSr; [by move: mem_kl_range; apply mem_range_le|].
    rewrite -(intmulz _ 2) mulr2z -addrA /= mulNr.
    rewrite (exprD_nneg_sub_range _ _ _ mem_kl_range) //=.
    by move: (bsrev_range 8 ks); apply mem_range_incl.
  qed.

  lemma add_j_start kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    bsrev 8 kj + bsrev 8 (ks * 2 ^ (8 - kl)) =
    bsrev 8 (kj + ks * 2 ^ (8 - kl)).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    rewrite (IntID.mulrC ks) bsrev_add.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    + move: mem_kj_range; apply mem_range_incl => //.
      by rewrite ler_weexpn2l // ler_add2r /= subr_ge0; move: mem_kl_range; apply mem_range_ge.
    by rewrite bsrev_mulr_pow2 // le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
  qed.

  lemma add_j_len_start kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    bsrev 8 kj + bsrev 8 (2 ^ (7 - kl)) + bsrev 8 (ks * 2 ^ (8 - kl)) =
    bsrev 8 (kj + 2 ^ (7 - kl) + ks * 2 ^ (8 - kl)).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    rewrite (IntID.mulrC ks) bsrev_add.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    + rewrite mem_range_addr; move: mem_kj_range; apply mem_range_incl => //.
      - by rewrite /= ler_oppl expr_ge0.
      by rewrite ler_subr_addr -mulr2z intmulz (exprSr_sub_range _ _ _ mem_kl_range).
    rewrite bsrev_mulr_pow2 //.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    congr; rewrite -(IntID.mulr1 (2 ^ (7 - _))) bsrev_add //=.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    rewrite bsrev1 // (divz_pow_sub_range _ _ _ mem_kl_range) //= bsrev_pow2.
    + by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    by rewrite opprD.
  qed.

  lemma perm_eq_inner kl ks :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    perm_eq
      (map
        (transpose Int.( * ) (2 ^ (kl + 1)))
        (range 0 (2 ^ (7 - kl))))
      (map
        (bsrev 8)
        (map
          (transpose (fun (x y : int) => x - y) (ks * 2 ^ (8 - kl)))
          (map
            ((+) (ks * 2 ^ (8 - kl)))
            (range 0 (2 ^ (7 - kl)))))).
  proof.
    move => mem_kl_range mem_ks_range.
    rewrite -!map_comp; apply uniq_perm_eq => //.
    + rewrite map_inj_in_uniq ?range_uniq // => x y _ _ /=.
      by apply/mulIf; rewrite gtr_eqF // expr_gt0.
    + rewrite map_inj_in_uniq ?range_uniq // => x y mem_x_range mem_y_range.
      rewrite /(\o) /= addrAC /= addrAC /=; apply/bsrev_injective => //.
      - move: mem_x_range; apply mem_range_incl => //=.
        by rewrite (expr_sub_le_range _ _ _ 8 mem_kl_range 2).
      move: mem_y_range; apply mem_range_incl => //=.
      by rewrite (expr_sub_le_range _ _ _ 8 mem_kl_range 2).
    move => x; split.
    + move => /mapP [y] [mem_y_range ->>].
      apply/mapP; exists (bsrev 8 (y * 2 ^ (kl + 1))).
      rewrite /(\o) /= addrAC /= bsrev_involutive //=.
      - rewrite mem_range_mulr; [by rewrite expr_gt0|].
        move: mem_y_range; apply mem_range_incl => //=.
        by rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range).
      rewrite mulrC bsrev_mulr_pow2.
      - by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply mem_range_incl.
      rewrite range_div_range /=; [by rewrite expr_gt0|].
      rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range) //=.
      by move: (bsrev_range 8 y).
    move => /mapP [y] [mem_y_range ->>].
    apply/mapP; exists (bsrev 8 (y * 2 ^ (kl + 1))).
    rewrite /(\o) /= addrAC /= (IntID.mulrC y) bsrev_mulr_pow2.
    + by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    rewrite range_div_range /=; [by rewrite expr_gt0|].
    rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range) //=.
    move: (bsrev_range 8 y) => -> /=.
    move: (bsrev_range_dvdz (kl + 1) 8 y _ _).
    + by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    + by rewrite opprD addrA addrAC.
    move => /dvdzP [q] ->; rewrite mulzK //.
    by rewrite gtr_eqF // expr_gt0.
  qed.

  lemma perm_eq_outer kl :
    kl \in range 0 7 =>
    perm_eq
      (range 0 (2 ^ kl))
      (map
        (bsrev 8)
        (map
          (transpose Int.( * ) (2 ^ (8 - kl)))
          (range 0 (2 ^ kl)))).
  proof.
    move => mem_kl_range.
    rewrite -!map_comp; apply uniq_perm_eq => //.
    + by rewrite range_uniq.
    + rewrite map_inj_in_uniq ?range_uniq // => x y mem_x_range mem_y_range.
      rewrite /(\o) /= => eq_; move: (bsrev_injective 8 _ _ _ _ _ eq_) => //=.
      - rewrite mem_range_mulr; [by rewrite expr_gt0|].
        move: mem_x_range; apply mem_range_incl => //=.
        by rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
      - rewrite mem_range_mulr; [by rewrite expr_gt0|].
        move: mem_y_range; apply mem_range_incl => //=.
        by rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
      by apply/mulIf; rewrite gtr_eqF // expr_gt0.
    move => x; split.
    + move => mem_x_range; apply/mapP; exists (bsrev 8 (x * 2 ^ (8 - kl))).
      rewrite /(\o) /= (IntID.mulrC x) bsrev_mulr_pow2.
      - by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
      move: (bsrev_range_dvdz (8 - kl) 8 x _ _).
      - by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
      - by rewrite opprD addrA addrAC.
      move => /dvdzP [q] eq_q; rewrite {2}eq_q mulzK //.
      - by rewrite gtr_eqF // expr_gt0.
      rewrite -eq_q bsrev_involutive //=.
      - move: mem_x_range; apply mem_range_incl => //=.
        by rewrite (expr_le_range _ _ _ 8 mem_kl_range).
      rewrite range_div_range /=; [by rewrite expr_gt0|].
      rewrite (exprD_nneg_sub_range _ _ _ mem_kl_range) //=.
      by move: (bsrev_range 8 x).
    move => /mapP [y] [mem_y_range ->>].
    rewrite /(\o) /= (IntID.mulrC y) bsrev_mulr_pow2.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    rewrite range_div_range /=; [by rewrite expr_gt0|].
    rewrite (exprD_nneg_sub_range _ _ _ mem_kl_range) //=.
    by move: (bsrev_range 8 y).
  qed.

  lemma inj_bs_drop_take k a1 a2 b1 b2 :
    a1 \in range 0 (2 ^ k) =>
    a2 \in range 0 (2 ^ k) =>
    b1 * 2 ^ k + a1 = b2 * 2 ^ k + a2 =>
    a1 = a2 /\ b1 = b2.
  proof.
    move => mem_a1_range mem_a2_range eq_.
    have: ((b1 * 2 ^ k + a1) %% (2 ^ k) =
           (b2 * 2 ^ k + a2) %% (2 ^ k)) by rewrite eq_.
    rewrite !modzMDl !modz_small.
    + by rewrite normrX -mem_range.
    + by rewrite normrX -mem_range.
    move => <<- /=.
    have: ((b1 * 2 ^ k + a1) %/ (2 ^ k) =
           (b2 * 2 ^ k + a1) %/ (2 ^ k)) by rewrite eq_.
    rewrite !divzMDl /=.
    + by rewrite gtr_eqF // expr_gt0.
    + by rewrite gtr_eqF // expr_gt0.
    rewrite divz_small //=.
    by rewrite normrX -mem_range.
  qed.

  lemma inj_bs_take_00 kl ks1 ks2 :
    kl \in range 0 7 =>
    ks1 \in range 0 (2 ^ kl) =>
    ks2 \in range 0 (2 ^ kl) =>
    bsrev 8 ks1 %/ 2 ^ (8 - kl) =
    bsrev 8 ks2 %/ 2 ^ (8 - kl) =>
    ks1 = ks2.
  proof.
    move => mem_kl_range mem_ks1_range mem_ks2_range.
    rewrite -!bsrev_mulr_pow2 /=.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    move => eq_; move: (bsrev_injective _ _ _ _ _ _ eq_) => //=.
    + rewrite mem_range_mull /=; [by rewrite expr_gt0|].
      by rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range).
    + rewrite mem_range_mull /=; [by rewrite expr_gt0|].
      by rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range).
    by apply mulfI; rewrite gtr_eqF // expr_gt0.
  qed.

  lemma inj_bs_take_01 kl ks1 ks2 :
    kl \in range 0 7 =>
    ks1 \in range 0 (2 ^ kl) =>
    ks2 \in range 0 (2 ^ kl) =>
    bsrev 8 ks1 %/ 2 ^ (8 - kl) =
    2 ^ kl + bsrev 8 ks2 %/ 2 ^ (8 - kl) =>
    false.
  proof.
    move => mem_kl_range mem_ks1_range mem_ks2_range eq_.
    have /negP/(_ eq_)//: (bsrev 8 ks1 %/ 2 ^ (8 - kl) <> 2 ^ kl + bsrev 8 ks2 %/ 2 ^ (8 - kl)).
    rewrite ltr_eqF // ltr_paddr //.
    + by rewrite divz_ge0; [rewrite expr_gt0|rewrite bsrev_ge0].
    rewrite ltz_divLR; [by rewrite expr_gt0|].
    rewrite (exprD_nneg_sub_range _ _ _ mem_kl_range) //=.
   by apply bsrev_lt_pow2.
  qed.

  lemma inj_bs_take_10 kl ks1 ks2 :
    kl \in range 0 7 =>
    ks1 \in range 0 (2 ^ kl) =>
    ks2 \in range 0 (2 ^ kl) =>
    2 ^ kl + bsrev 8 ks1 %/ 2 ^ (8 - kl) =
    bsrev 8 ks2 %/ 2 ^ (8 - kl) =>
    false.
  proof.
    move => mem_kl_range mem_ks1_range mem_ks2_range.
    by rewrite eq_sym; apply inj_bs_take_01.
  qed.

  lemma inj_bs_take_11 kl ks1 ks2 :
    kl \in range 0 7 =>
    ks1 \in range 0 (2 ^ kl) =>
    ks2 \in range 0 (2 ^ kl) =>
    2 ^ kl + bsrev 8 ks1 %/ 2 ^ (8 - kl) =
    2 ^ kl + bsrev 8 ks2 %/ 2 ^ (8 - kl) =>
    ks1 = ks2.
  proof.
    move => mem_kl_range mem_ks1_range mem_ks2_range.
    by move => /addzI; apply inj_bs_take_00.
  qed.

  lemma right_commutative_in_r_naive_ntt_inner_2 zetas kl r :
    kl \in range 0 7 =>
    right_commutative_in
      (fun r (p : int * int) => r_naive_ntt_inner zetas (bsrev 8 (2 ^ (7 - kl))) p.`1 r p.`2) r
      (allpairs
        (fun p1 p2 => (p1, p2))
        (map
          (bsrev 8)
          (map
            (transpose Int.( * ) (2 ^ (8 - kl)))
            (range 0 (2 ^ kl))))
        (map
          (transpose Int.( * ) (2 ^ (kl + 1)))
          (range 0 (2 ^ (7 - kl))))).
  proof.
    move => mem_kl_range [start1 j1] [start2 j2]; rewrite -!map_comp.
    move => /allpairsP [[start1' j1']] /=.
    move => [] /mapP [ks1] [mem_ks1_range ->>].
    move => [] /mapP [kj1] [mem_kj1_range ->>] [->> ->>].
    move => /allpairsP [[start2' j2']] /=.
    move => [] /mapP [ks2] [mem_ks2_range ->>].
    move => [] /mapP [kj2] [mem_kj2_range ->>] [->> ->>].
    move: is_perm_bsrev_8 => is_perm_bsrev_8.
    rewrite /r_naive_ntt_inner; congr.
    pose r':= (perm _ r); move: r' => {r} r.
    pose set2r1:= (set2_add_mulr r _ _ _).
    pose set2r2:= (set2_add_mulr r _ _ _).
    move: (perm_perm (bsrev 8) (bsrev 8) set2r1).
    move: (perm_perm (bsrev 8) (bsrev 8) set2r2).
    rewrite /(\o) /= => -> // -> //.
    rewrite (perm_id _ set2r1).
    + by move => x /mem_range ? /=; rewrite bsrev_involutive.
    rewrite (perm_id _ set2r2).
    + by move => x /mem_range ? /=; rewrite bsrev_involutive.
    rewrite /set2r1 /set2r2  /(\o) /= => {set2r1 set2r2}; rewrite bsrev_pow2.
    + by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    rewrite opprD /= (IntID.mulrC ks1) (IntID.mulrC ks2) !bsrev_mulr_pow2 /=.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    case: ((ks1 = ks2) /\ (kj1 = kj2)) => [[<<- <<-] //=|/negP nand_eq].
    rewrite set2_add_mulr_set2_add_mulr_swap //=.
    + rewrite mem_add_j_start_range //.
      rewrite range_div_range /=; [by rewrite expr_gt0|].
      rewrite (exprD_nneg_sub_range _ _ _ mem_kl_range) //=.
      by rewrite (bsrev_range 8).
    + rewrite mem_add_j_start_range //.
      rewrite range_div_range /=; [by rewrite expr_gt0|].
      rewrite (exprD_nneg_sub_range _ _ _ mem_kl_range) //=.
      by rewrite (bsrev_range 8).
    + rewrite mem_add_j_len_start_range //.
      rewrite range_div_range /=; [by rewrite expr_gt0|].
      rewrite (exprD_nneg_sub_range _ _ _ mem_kl_range) //=.
      by rewrite (bsrev_range 8).
    + rewrite mem_add_j_len_start_range //.
      rewrite range_div_range /=; [by rewrite expr_gt0|].
      rewrite (exprD_nneg_sub_range _ _ _ mem_kl_range) //=.
      by rewrite (bsrev_range 8).
    rewrite !negb_or; do!split; apply/negP => eq_; apply/nand_eq.
    + move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
      - by rewrite bsrev_start_range.
      - by rewrite bsrev_start_range.
      by move => {eq_} [eq_ <<-] /=; move: eq_; apply inj_bs_take_00.
    + rewrite -!addrA in eq_.
      move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
      - by rewrite bsrev_start_range.
      - by rewrite bsrev_len_start_range.
      by move => {eq_} /= => eq_; move: (inj_bs_take_01 _ _ _ _ _ _ eq_).
    + rewrite -!addrA in eq_.
      move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
      - by rewrite bsrev_start_range.
      - by rewrite bsrev_len_start_range.
      by move => {eq_} [eq_ <<-] /=; move: (inj_bs_take_01 _ _ _ _ _ _ eq_).
    + rewrite -!addrA in eq_.
      move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
      - by rewrite bsrev_start_range.
      - by rewrite bsrev_len_start_range.
      by move => {eq_} [eq_ <<-] /=; move: (inj_bs_take_01 _ _ _ _ _ _ eq_).
    + rewrite -!addrA in eq_.
      move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
      - by rewrite bsrev_start_range.
      - by rewrite bsrev_len_start_range.
      by move => {eq_} /= eq_; move: (inj_bs_take_01 _ _ _ _ _ _ eq_).
    rewrite -!addrA in eq_.
    move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
    + by rewrite bsrev_len_start_range.
    + by rewrite bsrev_len_start_range.
    by move => {eq_} [eq_ <<-] /=; move: (inj_bs_take_11 _ _ _ _ _ _ eq_).
  qed.

  lemma right_commutative_in_r_naive_ntt_inner zetas kl ks r :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    right_commutative_in
      (r_naive_ntt_inner zetas (bsrev 8 (2 ^ (7 - kl))) (bsrev 8 (ks * 2 ^ (8 - kl)))) r
      (map (transpose Int.( * ) (2 ^ (kl + 1))) (range 0 (2 ^ (7 - kl)))).
  proof.
    move => mem_kl_range mem_ks_range j1 j2 mem_j1 mem_j2.
    move: (right_commutative_in_r_naive_ntt_inner_2 zetas kl r _
             ((bsrev 8 (ks * 2 ^ (8 - kl))), j1)
             ((bsrev 8 (ks * 2 ^ (8 - kl))), j2) _ _ ) => //.
    + apply/allpairsP; exists ((bsrev 8 (ks * 2 ^ (8 - kl))), j1) => /=.
      by split => //; apply/(map_f (bsrev 8))/(map_f (transpose Int.( * ) (2 ^ (8 - kl)))).
    apply/allpairsP; exists ((bsrev 8 (ks * 2 ^ (8 - kl))), j2) => /=.
    by split => //; apply/(map_f (bsrev 8))/(map_f (transpose Int.( * ) (2 ^ (8 - kl)))).
  qed.

  lemma right_commutative_in_r_naive_ntt_outer zetas kl r :
    kl \in range 0 7 =>
    right_commutative_in (r_naive_ntt_outer zetas (bsrev 8 (2 ^ (7 - kl)))) r (range 0 (2 ^ kl)).
  proof.
    move => mem_kl_range ks1 ks2 mem_ks1_range mem_ks2_range.
    rewrite /r_naive_ntt_outer /r_naive_ntt_inner_foldl.
    pose f:= r_naive_ntt_inner zetas (bsrev 8 (2 ^ (7 - kl))); pose s:= (List.map _ _).
    rewrite (foldl_zip_nseq f ks1 r s).
    rewrite (foldl_zip_nseq f ks2 r s).
    rewrite (foldl_zip_nseq f ks1 (foldl _ _ _) s).
    rewrite (foldl_zip_nseq f ks2 (foldl _ _ _) s).
    rewrite -!foldl_cat -!zip_cat ?size_nseq ?ler_maxr ?size_ge0 //.
    apply foldl_perm_in => {r}.
    + move => r [start1 j1] [start2 j2] /mem_zip [].
      rewrite size_map size_range /= !mem_cat !mem_nseq /= ltzE => or_eq1.
      rewrite bsrev_pow2 ?opprD /= in or_eq1.
      - by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl.
      rewrite (divz_pow_range _ _ _ mem_kl_range) //= ler_maxr ? expr_ge0 // in or_eq1.
      rewrite (le_expr_sub_range _ _ _ 0 mem_kl_range) //= in or_eq1.
      rewrite orb_idl // => mem_j1 /mem_zip [].
      rewrite !mem_cat !mem_nseq /= ltzE => or_eq2.
      rewrite bsrev_pow2 ?opprD /= in or_eq2.
      - by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl.
      rewrite (divz_pow_range _ _ _ mem_kl_range) //= ler_maxr ? expr_ge0 // in or_eq2.
      rewrite (le_expr_sub_range _ _ _ 0 mem_kl_range) //= in or_eq2.
      rewrite orb_idl // => mem_j2; rewrite /f /= => {f}.
      move: (right_commutative_in_r_naive_ntt_inner_2
               zetas kl r _
               (start1, j1)
               (start2, j2) _ _) => //.
      - apply allpairsP; exists (start1, j1) => //=; split => //=.
        * rewrite -(perm_eq_mem _ _ (perm_eq_outer kl _)) //.
          by case: or_eq1 => [<<-|<<-].
        move: mem_j1; rewrite /s bsrev_pow2 ?opprD /=.
        * by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl.
        rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
        by rewrite (exprSr_range _ _ _ mem_kl_range) //=.
      apply allpairsP; exists (start2, j2) => //=; split => //=.
      - rewrite -(perm_eq_mem _ _ (perm_eq_outer kl _)) //.
        by case: or_eq2 => [<<-|<<-].
      move: mem_j2; rewrite /s bsrev_pow2 ?opprD /=.
      - by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl.
      rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
      by rewrite (exprSr_range _ _ _ mem_kl_range) //=.
    by rewrite !zip_cat ?size_nseq ?ler_maxr ?size_ge0 // perm_catC.
  qed.

  lemma eq_r_ntt_inner zetas kl ks kj r :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    r_bsrev_ntt_inner zetas (2 ^ (7 - kl))           (ks * 2 ^ (8 - kl))           r (kj + ks * 2 ^ (8 - kl)) =
    r_naive_ntt_inner zetas (bsrev 8 (2 ^ (7 - kl))) (bsrev 8 (ks * 2 ^ (8 - kl))) r (bsrev 8 kj).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range; rewrite /r_bsrev_ntt_inner /r_naive_ntt_inner.
    rewrite set2_add_mulr_permiE; [by rewrite is_perm_bsrev_8| | |].
    + by rewrite add_j_start //; pose n:= (_ + _)%Int; move: (bsrev_range 8 n).
    + by rewrite add_j_len_start //; pose n:= (_ + _ + _)%Int; move: (bsrev_range 8 n).
    pose r1:= set2_add_mulr _ _ _ _; pose r2:= set2_add_mulr _ _ _ _.
    move: (perm_perm (bsrev 8) (bsrev 8) r2 is_perm_bsrev_8).
    rewrite /(\o) /= => ->; rewrite perm_id //.
    + by move => x /mem_range mem_x_range /=; rewrite bsrev_involutive.
    rewrite /r1 /r2 => {r1 r2}.
    rewrite add_j_len_start // add_j_start // !bsrev_involutive //=.
    + by rewrite bsrev_mem_add_j_len_start_range.
    + by rewrite bsrev_mem_add_j_start_range.
    rewrite addrAC bsrev_pow2.
    + by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    rewrite opprD /= (divz_pow_range _ _ _ mem_kl_range) //=.
    rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //= div_mulr.
    + rewrite dvdz_exp2l // ler_add2r /= subr_ge0.
      by move: mem_kl_range; apply mem_range_ge.
    rewrite -exprD_subz //.
    + rewrite ler_add2r /= subr_ge0.
      by move: mem_kl_range; apply mem_range_ge.
    rewrite opprD /= !addrA (IntID.addrAC 8) /= -(IntID.addrA 1) /=.
    rewrite !(IntID.mulrC ks) mulrDl bsrev_mulr_pow2 /=.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    rewrite -mulrA (IntID.addrC (_ ^ _)%IntID (_ * _)%Int) (exprS_sub_range _ _ _ mem_kl_range) //=.
    move: (bsrev_add (8 - kl) 8 (2 ^ (7 - kl)) (bsrev 8 ks %/ 2 ^ (8 - kl)) _ _).
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    + rewrite mem_range expr_ge0 //=; apply/(ltr_le_trans (2 * 2 ^ (7 - kl))).
      - by rewrite -{1}(IntID.mul1r (2 ^ _)) ltr_pmul2r // expr_gt0.
      rewrite -exprS; [|by rewrite addrAC].
      by rewrite subr_ge0; move: mem_kl_range; apply mem_range_ge.
    rewrite (IntID.addrC (2 ^ _)) (IntID.mulrC (2 ^ _)) => ->.
    rewrite (IntID.addrC (bsrev _ _)) bsrev_pow2.
    + by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    rewrite opprD /= -bsrev_mulr_pow2.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    rewrite (IntID.mulrC (2 ^ (8 - _)) (_ %/ _)) divzK.
    + apply/bsrev_range_dvdz; [|by rewrite opprD].
      by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    rewrite bsrev_involutive //.
    + move: mem_ks_range; apply mem_range_incl => //.
      move: (ler_weexpn2l 2 _ kl 8 _) => //=.
      by rewrite le2_mem_range; move: mem_kl_range; apply mem_range_incl.
    rewrite exprS; [by move: mem_kl_range; apply mem_range_le|].
    by rewrite -mulrDr (IntID.mulrC 2) mulzK.
  qed.

  lemma eq_r_ntt_outer zetas kl ks r :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    r_bsrev_ntt_outer zetas (2 ^ (7 - kl))           r (ks * 2 ^ (8 - kl)) =
    r_naive_ntt_outer zetas (bsrev 8 (2 ^ (7 - kl))) r (bsrev 8 (ks * 2 ^ (8 - kl))).
  proof.
    move => mem_kl_range mem_ks_range; rewrite /r_bsrev_ntt_outer /r_naive_ntt_outer.
    rewrite /r_bsrev_ntt_inner_foldl /r_naive_ntt_inner_foldl.
    rewrite {2 3}bsrev_pow2; [by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl|].
    rewrite opprD addrA addrAC /= (exprSr_range _ _ _ mem_kl_range) //=.
    rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
    pose s1 := (List.map _ _); pose s2 := (List.map _ _).
    rewrite (foldl_perm_in _ s2 (map (bsrev 8) (map (transpose Int.(-) (ks * 2 ^ (8 - kl))) s1))).
    + by move => {r} r; apply right_commutative_in_r_naive_ntt_inner.
    + by rewrite perm_eq_inner.
    rewrite !foldl_map; apply eq_in_foldl => // {r} r kj mem_y_range /=.
    by rewrite addrAC /= (IntID.addrC _ kj) eq_r_ntt_inner.
  qed.

  lemma eq_r_ntt zetas kl r :
    kl \in range 0 7 =>
    r_bsrev_ntt zetas r (2 ^ (7 - kl)) =
    r_naive_ntt zetas r (bsrev 8 (2 ^ (7 - kl))).
  proof.
    move => mem_kl_range; rewrite /r_bsrev_ntt /r_naive_ntt.
    rewrite /r_bsrev_ntt_outer_foldl /r_naive_ntt_outer_foldl.
    rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
    rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
    rewrite {2}bsrev_pow2; [by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl|].
    rewrite opprD addrA addrAC /=.
    pose s1 := (List.map _ _); pose s2 := (range _ _).
    rewrite (foldl_perm_in _ s2 (map (bsrev 8) s1)).
    + by move => {r} r; apply right_commutative_in_r_naive_ntt_outer.
    + by rewrite perm_eq_outer.
    rewrite !foldl_map; apply eq_in_foldl => // {r} r kj mem_y_range /=.
    by rewrite eq_r_ntt_outer.
  qed.

  equiv bsrev_ntt_inner :
    NTT_bsrev.ntt_inner ~ NTT_naive.ntt_inner :
    inv_bsrev_ntt_outer
      NTT_vars.zetas{1} NTT_vars.zetas{2}
      NTT_vars.len{1} NTT_vars.len{2}
      NTT_vars.start{1} NTT_vars.start{2}
      (NTT_vars.r{1}, NTT_vars.r{2}) /\
    NTT_vars.start{1} < 256 /\ NTT_vars.start{2} < NTT_vars.len{2} ==>
    inv_bsrev_ntt_outer
      NTT_vars.zetas{1} NTT_vars.zetas{2}
      NTT_vars.len{1} NTT_vars.len{2}
      NTT_vars.start{1} NTT_vars.start{2}
      (NTT_vars.r{1}, NTT_vars.r{2}) /\
    (NTT_vars.start{1} < 256 <=> NTT_vars.start{2} < NTT_vars.len{2}).
  proof.
    proc; wp.
    while (
      inv_bsrev_ntt_inner
        NTT_vars.zetas{1} NTT_vars.zetas{2}
        NTT_vars.len{1} NTT_vars.len{2}
        NTT_vars.start{1} NTT_vars.start{2}
        NTT_vars.zeta_{1} NTT_vars.zeta_{2}
        NTT_vars.j{1} NTT_vars.j{2}
        (NTT_vars.r{1}, NTT_vars.r{2}) );
    wp.
    + skip => &1 &2; rewrite /inv_bsrev_ntt_inner /=.
      apply/RHL_FOR_INT_ADD_LT2.inv_in => //=.
      - move => -[[[<-]]] /= [kl] [/mem_range mem_kl_range] [->> ->>].
        rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
        rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //=.
        rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
        move => [ks] [/mem_range mem_ks_range] [->> ->>] _.
        rewrite (exprSr_range _ _ _ mem_kl_range) //= expr_gt0 //=.
        rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //=.
        by rewrite ger_addl addrAC /= lerNgt expr_gt0.
      move => [[[<-]]] /= [kl] [/mem_range mem_kl_range] [->> ->>].
      rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
      rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //.
      rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
      move => [ks] [/mem_range mem_ks_range] [->> ->>] [->> ->>].
      rewrite ger_addl addrAC /= lerNgt expr_gt0 //=.
      move => ? <<- kj mem_kj_range ->> ->>; rewrite /Q_bsrev_ntt_inner /=.
      move => [r] [->> ->>]; rewrite addrA /= mulrDl /= divzMDr //=.
      - by rewrite gtr_eqF // expr_gt0.
      exists r; rewrite /r_bsrev_ntt_inner_foldl /r_naive_ntt_inner_foldl rangeSr.
      - by move: mem_kj_range; apply mem_range_le.
      rewrite !map_rcons !foldl_rcons /=.
      rewrite (exprSr_range _ _ _ mem_kl_range) //=.
      rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
      rewrite mulzK; [by apply/gtr_eqF/expr_gt0|].
      rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
      pose r1:= (foldl _ _ _); pose r2:= (foldl _ _ _).
      move: r1 r2 => r1 r2; rewrite /r_bsrev_ntt_inner /r_naive_ntt_inner.
      rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
      rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
      rewrite mulrDl -mulrA (exprS_sub_range _ _ _ mem_kl_range) //=.
      rewrite div_mulr.
      - rewrite dvdz_exp2l ler_add2r /= subr_ge0.
        by move: mem_kl_range; apply mem_range_ge.
      rewrite div_pow //=.
      - rewrite ler_add2r /= subr_ge0.
        by move: mem_kl_range; apply mem_range_ge.
      rewrite opprD /= !addrA (IntID.addrAC 8) /= -(IntID.addrA 1) /=.
      rewrite exprSr; [by move: mem_kl_range; apply mem_range_le|].
      rewrite -mulrDl mulzK // (IntID.addrC ks) /=.
      rewrite (exprSr_range _ _ _ mem_kl_range) //=.
      rewrite set2_add_mulr_permiE; [by rewrite is_perm_bsrev_8| | | ].
      - by apply mem_add_j_start_range.
      - by apply mem_add_j_len_start_range.
      pose r':= set2_add_mulr _ _ _ _.
      move: (perm_perm _ (bsrev 8) r' is_perm_bsrev_8).
      rewrite /(\o) => -> /=; rewrite perm_id //=.
      by move => x /mem_range mem_x_range /=; rewrite bsrev_involutive.
    skip => &1 &2; rewrite {1}/inv_bsrev_ntt_outer => inv_start.
    move: (RHL_FOR_INT_ADD_LT2.invP _ _ _ _ _ _ _ _ _ _ _ _ inv_start).
    + move => [_] /= [k] [/mem_range mem_k_range] [->> ->>].
      rewrite (divz_pow_range _ _ _ mem_k_range) //=.
      rewrite (exprSr_sub_range _ _ _ mem_k_range) //= expr_gt0 //=.
      rewrite (NdivzN_pow_sub_range _ _ _ mem_k_range) //=.
      by rewrite lerNgt expr_gt0.
    move => [[eq_zetas]]; move: eq_zetas inv_start => <- inv_start.
    move => /= [kl] [/mem_range mem_kl_range] [->> ->>].
    move: inv_start; rewrite (divz_pow_range _ _ _ mem_kl_range) //= => inv_start.
    rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //=.
    rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
    move => [ks] [/mem_range mem_ks_range] [->>] [->>] [r] /= [->> ->>].
    split => //.
    + rewrite /inv_bsrev_ntt_inner ltr_addl expr_gt0 //=.
      apply/RHL_FOR_INT_ADD_LT2.inv_0_inv => //=.
      - move => _; rewrite (exprSr_range _ _ _ mem_kl_range) //= expr_gt0 //=.
        rewrite ger_addl lerNgt expr_gt0 //= addrAC /=.
        by rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= mulNr.
      - split; [move: inv_start; apply/RHL_FOR_INT_ADD_LT2.inv_context => //=|].
        * move => _; rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //=.
          rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
          by rewrite lerNgt expr_gt0.
        rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
        by rewrite (divz_pow_range _ _ _ mem_kl_range).
      exists r => //=; rewrite /r_bsrev_ntt_inner_foldl /r_naive_ntt_inner_foldl range_geq //=.
      by rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= mulzK // gtr_eqF // expr_gt0.
    move => j1 r1 j2 r2 /=; rewrite /inv_bsrev_ntt_inner.
    pose R (_ _ : int) (s : coeff Array256.t * coeff Array256.t) :=
      inv_bsrev_ntt_outer
        NTT_vars.zetas{1} NTT_vars.zetas{1}
        (2 ^ (7 - kl)) (2 ^ kl)
        (ks * 2 ^ (8 - kl) + 2 ^ (8 - kl))
        (ks + 1) s /\
      (ks * 2 ^ (8 - kl) + 2 ^ (8 - kl) < 256 <=> ks + 1 < 2 ^ kl).
    apply/(RHL_FOR_INT_ADD_LT2.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
    + rewrite /R ger_addl lerNgt expr_gt0 //= addrAC /= => _ {R inv_start}.
      rewrite (exprSr_range _ _ _ mem_kl_range) //= expr_gt0 //=.
      by rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range).
    rewrite /R ger_addl lerNgt expr_gt0 //= addrAC /= => {R inv_start}.
    rewrite divzMDr; [by rewrite gtr_eqF // expr_gt0|].
    rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
    rewrite (exprSr_range _ _ _ mem_kl_range) //=.
    rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range) //=.
    move => [[? _] _] {r1 r2 r} [r1 r2] [r] /= [->> ->>].
    rewrite -mulrSl -ltz_NdivNLR; [by rewrite expr_gt0|].
    rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
    split => //=; rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
    rewrite expr_gt0 //=; exists (ks + 1) => //=.
    rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
    rewrite le2_mem_range mem_range_addr /=; split.
    + by move: mem_ks_range; apply mem_range_incl.
    exists r => //=; rewrite /r_bsrev_ntt_outer_foldl /r_naive_ntt_outer_foldl.
    rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
    rewrite mulzK; [by rewrite gtr_eqF // expr_gt0|].
    rewrite rangeSr; [by move: mem_ks_range; apply mem_range_le|].
    rewrite map_rcons !foldl_rcons; pose r1:= (foldl _ _ _); pose r2:= (foldl _ _ _).
    move: r1 r2 => r1 r2; rewrite /r_bsrev_ntt_outer /r_naive_ntt_outer.
    by rewrite (divz_pow_range _ _ _ mem_kl_range).
  qed.

  equiv bsrev_ntt_outer :
    NTT_bsrev.ntt_outer ~ NTT_naive.ntt_outer :
    inv_bsrev_ntt
      NTT_vars.zetas{1} NTT_vars.zetas{2}
      NTT_vars.len{1} NTT_vars.len{2}
      (NTT_vars.r{1}, NTT_vars.r{2}) /\
    2 <= NTT_vars.len{1} /\ NTT_vars.len{2} <= 64 ==>
    inv_bsrev_ntt
      NTT_vars.zetas{1} NTT_vars.zetas{2}
      NTT_vars.len{1} NTT_vars.len{2}
      (NTT_vars.r{1}, NTT_vars.r{2}) /\
    (2 <= NTT_vars.len{1} <=> NTT_vars.len{2} <= 64).
  proof.
    proc; wp.
    while (
      inv_bsrev_ntt_outer
      NTT_vars.zetas{1} NTT_vars.zetas{2}
        NTT_vars.len{1} NTT_vars.len{2}
        NTT_vars.start{1} NTT_vars.start{2}
        (NTT_vars.r{1}, NTT_vars.r{2}) );
    wp; first by call bsrev_ntt_inner.
    skip => &1 &2; rewrite {1}/inv_bsrev_ntt => inv_len.
    move: (RHL_FOR_NAT_DIV_GE_MUL_LE .invP _ _ _ _ _ _ _ _ _ _ _ _ inv_len); [by trivial|].
    move => [P] [k] [/mem_range mem_k_range] [->>] [->>]. 
    move: inv_len; rewrite /= (divz_pow_range _ _ _ mem_k_range) //= => inv_len inv_start.
    rewrite /= in mem_k_range; rewrite expr_gt0 //=; split => //.
    + rewrite /inv_bsrev_ntt_outer; apply/RHL_FOR_INT_ADD_LT2.inv_0_inv => //=.
      - move => _; rewrite (exprSr_sub_range _ _ _ mem_k_range) //= expr_gt0 //=.
        by rewrite (NdivzN_pow_sub_range _ _ _ mem_k_range) //= lerNgt expr_gt0.
      - by move: inv_len; apply/RHL_FOR_NAT_DIV_GE_MUL_LE .inv_context.
      move: inv_start => {inv_len} => <- /=; exists NTT_vars.r{1} => /=.
      by rewrite /r_bsrev_ntt_outer_foldl /r_naive_ntt_outer_foldl range_geq.
    move => {inv_len inv_start} /=; move: P => <-.
    move => r1 start1 r2 start2; rewrite /inv_bsrev_ntt_outer.
    rewrite (exprSr_range _ _ _ mem_k_range) //=.
    rewrite (exprSr_sub_range _ _ _ mem_k_range) //=.
    rewrite (pow_div1_sub_range _ _ _ mem_k_range) //=.
    pose R (_ _ : int) s :=
      inv_bsrev_ntt NTT_vars.zetas{1} NTT_vars.zetas{1} (2 ^ (6 - k)) (2 ^ (k + 1)) s /\
      (2 <= 2 ^ (6 - k) <=> 2 ^ (k + 1) <= 64).
    apply/(RHL_FOR_INT_ADD_LT2.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
    + rewrite expr_gt0 //= (NdivzN_pow_sub_range _ _ _ mem_k_range) //=.
      by rewrite lerNgt expr_gt0.
    rewrite expr_gt0 //= (NdivzN_pow_sub_range _ _ _ mem_k_range) //=.
    rewrite (exprD_nneg_sub_range _ _ _ mem_k_range) //= /R => {R}.
    move => _ {r1 r2} [r1 r2] [r] /= [->> ->>]; split => //=; last first.
    + move: mem_k_range; rewrite (rangeSr 0 6) //= mem_rcons /=; case => [->> //=|mem_k_range].
      rewrite (expr_add_le_range _ _ _ 6 mem_k_range) //=.
      by rewrite (le_expr_sub_range _ _ _ 1 mem_k_range 2).
    rewrite /inv_bsrev_ntt; split => //=; exists (k + 1) => //=.
    rewrite (divz_pow_add_range _ _ _ mem_k_range) //=; split.
    + by rewrite le2_mem_range mem_range_addr; move: mem_k_range; apply mem_range_incl.
    rewrite /Q_bsrev_ntt /=; move: (eq_r_ntt NTT_vars.zetas{1} k r _) => //; rewrite /r_bsrev_ntt /r_naive_ntt bsrev_pow2.
    + by rewrite mem_range_subl; move: mem_k_range; apply mem_range_incl.
    by rewrite (divz_pow_sub_range _ _ _ mem_k_range) //= opprD.
  qed.

  equiv bsrev_ntt :
    NTT_bsrev.ntt ~ NTT_naive.ntt :
    ={NTT_vars.zetas, NTT_vars.r} ==>
    ={res}.
  proof.
    proc.
    while (
      inv_bsrev_ntt
        NTT_vars.zetas{1} NTT_vars.zetas{2}
        NTT_vars.len{1} NTT_vars.len{2}
        (NTT_vars.r{1}, NTT_vars.r{2}) );
    wp; first by call bsrev_ntt_outer.
    skip => &1 &2 [<<- <<-].
    rewrite /inv_bsrev_ntt; split.
    + by rewrite RHL_FOR_NAT_DIV_GE_MUL_LE.inv_0.
    move => len1 r1 len2 r2.
    pose R (_ _ : int) (s : coeff Array256.t * coeff Array256.t) :=
      (s.`1 = s.`2).
    by apply/(RHL_FOR_NAT_DIV_GE_MUL_LE.inv_out _ _ _ _ _ _ _ _ _ R).
  qed.

  op r_bsrev_invntt_inner (zetas_inv : coeff Array128.t) len start r j =
    set2_mul_addr r
      zetas_inv.[128 + ((-512) + start) %/ (len * 2)]
      j (j + len).

  op r_naive_invntt_inner (zetas_inv : coeff Array128.t) len start (r : coeff Array256.t) j =
    perm (bsrev 8)
      ( set2_mul_addr (perm (bsrev 8) r)
          zetas_inv.[bsrev 8 ((start * 2 + 1) * (128 %/ len) - 2)]
          (j + start) (j + len + start)).

  op r_bsrev_invntt_inner_foldl zetas_inv len start r k =
    foldl (r_bsrev_invntt_inner zetas_inv len start) r (map (( + )%Int start) (range 0 k)).

  op r_naive_invntt_inner_foldl zetas_inv len start r k =
    foldl (r_naive_invntt_inner zetas_inv len start) r (map (transpose ( * )%Int (len * 2)) (range 0 k)).

  op r_bsrev_invntt_outer zetas_inv len r start =
    r_bsrev_invntt_inner_foldl zetas_inv len start r len.

  op r_naive_invntt_outer zetas_inv len r start =
    r_naive_invntt_inner_foldl zetas_inv len start r (128 %/ len).

  op r_bsrev_invntt_outer_foldl zetas_inv len r k =
    foldl (r_bsrev_invntt_outer zetas_inv len) r (map (transpose ( * )%Int (len * 2)) (range 0 k)).

  op r_naive_invntt_outer_foldl zetas_inv len r k =
    foldl (r_naive_invntt_outer zetas_inv len) r (range 0 k).

  op r_bsrev_invntt_post (zetas_inv : coeff Array128.t) (r : coeff Array256.t) j =
    r.[j <- r.[j] * zetas_inv.[127]].

  op r_naive_invntt_post (zetas_inv : coeff Array128.t) (r : coeff Array256.t) j =
    perm (bsrev 8) ((perm (bsrev 8) r).[j <- (perm (bsrev 8) r).[j] * zetas_inv.[127]]).

  op r_bsrev_invntt_post_foldl zetas_inv r k =
    foldl (r_bsrev_invntt_post zetas_inv) r (range 0 k).

  op r_naive_invntt_post_foldl zetas_inv r k =
    foldl (r_naive_invntt_post zetas_inv) r (range 0 k).

  op r_bsrev_invntt zetas_inv r len =
    r_bsrev_invntt_outer_foldl zetas_inv len r (128 %/ len).

  op r_naive_invntt zetas_inv r len =
    r_naive_invntt_outer_foldl zetas_inv len r len.

  op P_bsrev_invntt (zetas_inv1 zetas_inv2 : coeff Array128.t) =
    zetas_inv1 = zetas_inv2.

  op Q_bsrev_invntt (_ _ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    s.`1 = s.`2.

  op inv_bsrev_invntt zetas_inv1 zetas_inv2 =
    RHL_FOR_NAT_MUL_LE_DIV_GE.inv
    128 1 2 2 2 64
    ( P_bsrev_invntt zetas_inv1 zetas_inv2 )
    Q_bsrev_invntt.

  op P_bsrev_invntt_post (zetas_inv1 zetas_inv2 : coeff Array128.t) =
    zetas_inv1 = zetas_inv2.

  op Q_bsrev_invntt_post zetas_inv1 zetas_inv2 k (_ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    exists r ,
      s.`1 = r_bsrev_invntt_post_foldl zetas_inv1 r k /\
      s.`2 = r_naive_invntt_post_foldl zetas_inv2 r k.

  op inv_bsrev_invntt_post zetas_inv1 zetas_inv2 =
    RHL_FOR_INT_ADD_LT2.inv
    256 256 1 1 0 0
    ( P_bsrev_invntt_post zetas_inv1 zetas_inv2 )
    ( Q_bsrev_invntt_post zetas_inv1 zetas_inv2 ).

  op P_bsrev_invntt_outer zetas_inv1 zetas_inv2 =
    RHL_FOR_NAT_MUL_LE_DIV_GE.context
    128 1 2 2 2 64
    ( P_bsrev_invntt zetas_inv1 zetas_inv2 ).

  op Q_bsrev_invntt_outer
    zetas_inv1 zetas_inv2 (len1 len2 : int) k (_ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    exists r ,
      s.`1 = r_bsrev_invntt_outer_foldl zetas_inv1 len1 r k  /\
      s.`2 = r_naive_invntt_outer_foldl zetas_inv2 len2 r k.

  op inv_bsrev_invntt_outer zetas_inv1 zetas_inv2 len1 len2 =
    RHL_FOR_INT_ADD_LT2.inv
      256 len2 (len1 * 2) 1 0 0
      ( P_bsrev_invntt_outer zetas_inv1 zetas_inv2 len1 len2 )
      ( Q_bsrev_invntt_outer zetas_inv1 zetas_inv2 len1 len2 ).

  op P_bsrev_invntt_inner
    zetas_inv1 zetas_inv2 len1 len2 start1 start2 (zeta_1 zeta_2 : coeff) =
    RHL_FOR_INT_ADD_LT2.context
      256 len2 (len1 * 2) 1 0 0
      ( P_bsrev_invntt_outer zetas_inv1 zetas_inv2 len1 len2 )
      start1 start2 /\
    zeta_1 = zetas_inv1.[128 + ((-512) + start1) %/ (len1 * 2)] /\
    zeta_2 = zetas_inv2.[bsrev 8 ((start2 * 2 + 1) * (128 %/ len2) - 2)].

  op Q_bsrev_invntt_inner zetas_inv1 zetas_inv2 (len1 len2 start1 start2 : int) k (_ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    exists r ,
      s.`1 = r_bsrev_invntt_inner_foldl zetas_inv1 len1 start1 (r_bsrev_invntt_outer_foldl zetas_inv1 len1 r (start1 %/ (len1 * 2))) k /\
      s.`2 = r_naive_invntt_inner_foldl zetas_inv2 len2 start2 (r_naive_invntt_outer_foldl zetas_inv2 len2 r start2) k.

  op inv_bsrev_invntt_inner
    zetas_inv1 zetas_inv2 (len1 len2 start1 start2 : int) zeta_1 zeta_2 =
    RHL_FOR_INT_ADD_LT2.inv
      (start1 + len1) 256 1 (len2 * 2) start1 0
      ( P_bsrev_invntt_inner zetas_inv1 zetas_inv2 len1 len2 start1 start2 zeta_1 zeta_2 )
      ( Q_bsrev_invntt_inner zetas_inv1 zetas_inv2 len1 len2 start1 start2 ).

  lemma mem_add_j_start_range_invntt kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    kj * 2 ^ (7 - kl) + ks \in range 0 256.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    move: (mem_add_j_start_range (6 - kl) ks kj).
    rewrite opprD /= (IntID.addrC 1) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma mem_add_j_len_start_range_invntt kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    kj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + ks \in range 0 256.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    move: (mem_add_j_len_start_range (6 - kl) ks kj).
    rewrite opprD /= (IntID.addrC 1) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma bsrev_mem_add_j_start_range_invntt kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    kj + ks * 2 ^ (kl + 2) \in range 0 256.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    move: (bsrev_mem_add_j_start_range (6 - kl) ks kj).
    rewrite opprD /= (IntID.addrC 1) (IntID.addrC 2) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma bsrev_mem_add_j_len_start_range_invntt kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    kj + 2 ^ (kl + 1) + ks * 2 ^ (kl + 2) \in range 0 256.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    move: (bsrev_mem_add_j_len_start_range (6 - kl) ks kj).
    rewrite opprD /= (IntID.addrC 1) (IntID.addrC 2) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma bsrev_start_range_invntt kl ks :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    bsrev 8 ks %/ 2 ^ (kl + 2) \in range 0 (2 ^ (7 - kl)).
  proof.
    move => mem_kl_range mem_ks_range.
    move: (bsrev_start_range (6 - kl) ks).
    rewrite opprD /= (IntID.addrC 2) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma bsrev_len_start_range_invntt kl ks :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    2 ^ (6 - kl) + bsrev 8 ks %/ 2 ^ (kl + 2) \in range 0 (2 ^ (7 - kl)).
  proof.
    move => mem_kl_range mem_ks_range.
    move: (bsrev_len_start_range (6 - kl) ks).
    rewrite opprD /= (IntID.addrC 2) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma add_j_start_invntt kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    bsrev 8 kj + bsrev 8 (ks * 2 ^ (kl + 2)) =
    bsrev 8 (kj + ks * 2 ^ (kl + 2)).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    move: (add_j_start (6 - kl) ks kj).
    rewrite opprD /= (IntID.addrC 1) (IntID.addrC 2) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma add_j_len_start_invntt kl ks kj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    bsrev 8 kj + bsrev 8 (2 ^ (kl + 1)) + bsrev 8 (ks * 2 ^ (kl + 2)) =
    bsrev 8 (kj + 2 ^ (kl + 1) + ks * 2 ^ (kl + 2)).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    move: (add_j_len_start (6 - kl) ks kj).
    rewrite opprD /= (IntID.addrC 1) (IntID.addrC 2) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma perm_eq_inner_invntt kl ks :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    perm_eq
      (map
        (transpose Int.( * ) (2 ^ (7 - kl)))
        (range 0 (2 ^ (kl + 1))))
      (map
        (bsrev 8)
        (map
          (transpose (fun (x y : int) => x - y) (ks * 2 ^ (kl + 2)))
          (map
            ((+) (ks * 2 ^ (kl + 2)))
            (range 0 (2 ^ (kl + 1)))))).
  proof.
    move => mem_kl_range mem_ks_range.
    move: (perm_eq_inner (6 - kl) ks).
    rewrite opprD /= (IntID.addrC 1) (IntID.addrC 2) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma perm_eq_outer_invntt kl :
    kl \in range 0 7 =>
    perm_eq
      (range 0 (2 ^ (6 - kl)))
      (map
        (bsrev 8)
        (map
          (transpose Int.( * ) (2 ^ (kl + 2)))
          (range 0 (2 ^ (6 - kl))))).
  proof.
    move => mem_kl_range.
    move: (perm_eq_outer (6 - kl)).
    rewrite opprD /= (IntID.addrC 2) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma inj_bs_take_00_invntt kl ks1 ks2 :
    kl \in range 0 7 =>
    ks1 \in range 0 (2 ^ (6 - kl)) =>
    ks2 \in range 0 (2 ^ (6 - kl)) =>
    bsrev 8 ks1 %/ 2 ^ (kl + 2) =
    bsrev 8 ks2 %/ 2 ^ (kl + 2) =>
    ks1 = ks2.
  proof.
    move => mem_kl_range mem_ks1_range mem_ks2_range ?.
    move: (inj_bs_take_00 (6 - kl) ks1 ks2).
    rewrite opprD /= (IntID.addrC 2) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma inj_bs_take_01_invntt kl ks1 ks2 :
    kl \in range 0 7 =>
    ks1 \in range 0 (2 ^ (6 - kl)) =>
    ks2 \in range 0 (2 ^ (6 - kl)) =>
    bsrev 8 ks1 %/ 2 ^ (kl + 2) =
    2 ^ (6 - kl) + bsrev 8 ks2 %/ 2 ^ (kl + 2) =>
    false.
  proof.
    move => mem_kl_range mem_ks1_range mem_ks2_range ?.
    move: (inj_bs_take_01 (6 - kl) ks1 ks2) => -> //.
    + by rewrite mem_range_subl.
    by rewrite opprD /= (IntID.addrC 2).
  qed.

  lemma inj_bs_take_10_invntt kl ks1 ks2 :
    kl \in range 0 7 =>
    ks1 \in range 0 (2 ^ (6 - kl)) =>
    ks2 \in range 0 (2 ^ (6 - kl)) =>
    2 ^ (6 - kl) + bsrev 8 ks1 %/ 2 ^ (kl + 2) =
    bsrev 8 ks2 %/ 2 ^ (kl + 2) =>
    false.
  proof.
    move => mem_kl_range mem_ks1_range mem_ks2_range ?.
    move: (inj_bs_take_10 (6 - kl) ks1 ks2) => -> //.
    + by rewrite mem_range_subl.
    by rewrite opprD /= (IntID.addrC 2).
  qed.

  lemma inj_bs_take_11_invntt kl ks1 ks2 :
    kl \in range 0 7 =>
    ks1 \in range 0 (2 ^ (6 - kl)) =>
    ks2 \in range 0 (2 ^ (6 - kl)) =>
    2 ^ (6 - kl) + bsrev 8 ks1 %/ 2 ^ (kl + 2) =
    2 ^ (6 - kl) + bsrev 8 ks2 %/ 2 ^ (kl + 2) =>
    ks1 = ks2.
  proof.
    move => mem_kl_range mem_ks1_range mem_ks2_range ?.
    move: (inj_bs_take_11 (6 - kl) ks1 ks2).
    rewrite opprD /= (IntID.addrC 2) => -> //.
    by rewrite mem_range_subl.
  qed.

  lemma perm_eq_post :
    perm_eq (range 0 256) (map (bsrev 8) (range 0 256)).
  proof.
    apply uniq_perm_eq => //.
    + by apply/range_uniq.
    + apply/map_inj_in_uniq; [|by apply/range_uniq].
      by move => x y mem_x_range mem_y_range; apply/bsrev_injective.
    move => x; split => [mem_x_range|].
    + apply/mapP; exists (bsrev 8 x); rewrite bsrev_involutive //=.
      by apply/(bsrev_range 8).
    by move => /mapP [y] [mem_y_range ->>]; apply/(bsrev_range 8).
  qed.

  lemma right_commutative_in_r_naive_invntt_inner_2 zetas_inv kl r :
    kl \in range 0 7 =>
    right_commutative_in
      (fun r (p : int * int) => r_naive_invntt_inner zetas_inv (bsrev 8 (2 ^ (kl + 1))) p.`1 r p.`2) r
      (allpairs
        (fun p1 p2 => (p1, p2))
        (map
          (bsrev 8)
          (map
            (transpose Int.( * ) (2 ^ (kl + 2)))
            (range 0 (2 ^ (6 - kl)))))
        (map
          (transpose Int.( * ) (2 ^ (7 - kl)))
          (range 0 (2 ^ (kl + 1))))).
  proof.
    move => mem_kl_range [start1 j1] [start2 j2]; rewrite -!map_comp.
    move => /allpairsP [[start1' j1']] /=.
    move => [] /mapP [ks1] [mem_ks1_range ->>].
    move => [] /mapP [kj1] [mem_kj1_range ->>] [->> ->>].
    move => /allpairsP [[start2' j2']] /=.
    move => [] /mapP [ks2] [mem_ks2_range ->>].
    move => [] /mapP [kj2] [mem_kj2_range ->>] [->> ->>].
    move: is_perm_bsrev_8 => is_perm_bsrev_8.
    rewrite /r_naive_invntt_inner; congr.
    pose r':= (perm _ r); move: r' => {r} r.
    pose set2r1:= (set2_mul_addr r _ _ _).
    pose set2r2:= (set2_mul_addr r _ _ _).
    move: (perm_perm (bsrev 8) (bsrev 8) set2r1).
    move: (perm_perm (bsrev 8) (bsrev 8) set2r2).
    rewrite /(\o) /= => -> // -> //.
    rewrite (perm_id _ set2r1).
    + by move => x /mem_range ? /=; rewrite bsrev_involutive.
    rewrite (perm_id _ set2r2).
    + by move => x /mem_range ? /=; rewrite bsrev_involutive.
    rewrite /set2r1 /set2r2  /(\o) /= => {set2r1 set2r2}; rewrite bsrev_pow2.
    + by rewrite mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    rewrite opprD /= (IntID.mulrC ks1) (IntID.mulrC ks2) !bsrev_mulr_pow2 /=.
    + by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    + by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    case: ((ks1 = ks2) /\ (kj1 = kj2)) => [[<<- <<-] //=|/negP nand_eq].
    rewrite set2_mul_addr_set2_mul_addr_swap //=.
    + rewrite mem_add_j_start_range_invntt //.
      rewrite range_div_range /=; [by rewrite expr_gt0|].
      rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range) //=.
      by rewrite (bsrev_range 8).
    + rewrite mem_add_j_start_range_invntt //.
      rewrite range_div_range /=; [by rewrite expr_gt0|].
      rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range) //=.
      by rewrite (bsrev_range 8).
    + rewrite (IntID.addrC _ 6) mem_add_j_len_start_range_invntt //.
      rewrite range_div_range /=; [by rewrite expr_gt0|].
      rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range) //=.
      by rewrite (bsrev_range 8).
    + rewrite (IntID.addrC _ 6) mem_add_j_len_start_range_invntt //.
      rewrite range_div_range /=; [by rewrite expr_gt0|].
      rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range) //=.
      by rewrite (bsrev_range 8).
    rewrite !negb_or; do!split; apply/negP => eq_; apply/nand_eq.
    + move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
      - by rewrite bsrev_start_range_invntt.
      - by rewrite bsrev_start_range_invntt.
      by move => {eq_} [eq_ <<-] /=; move: eq_; apply inj_bs_take_00_invntt.
    + rewrite -!addrA (IntID.addrC _ 6) in eq_.
      move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
      - by rewrite bsrev_start_range_invntt.
      - by rewrite bsrev_len_start_range_invntt.
      by move => {eq_} /= => eq_; move: (inj_bs_take_01_invntt _ _ _ _ _ _ eq_).
    + rewrite -!addrA (IntID.addrC _ 6) in eq_.
      move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
      - by rewrite bsrev_start_range_invntt.
      - by rewrite bsrev_len_start_range_invntt.
      by move => {eq_} [eq_ <<-] /=; move: (inj_bs_take_01_invntt _ _ _ _ _ _ eq_).
    + rewrite -!addrA (IntID.addrC _ 6) in eq_.
      move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
      - by rewrite bsrev_start_range_invntt.
      - by rewrite bsrev_len_start_range_invntt.
      by move => {eq_} [eq_ <<-] /=; move: (inj_bs_take_01_invntt _ _ _ _ _ _ eq_).
    + rewrite -!addrA (IntID.addrC _ 6) in eq_.
      move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
      - by rewrite bsrev_start_range_invntt.
      - by rewrite bsrev_len_start_range_invntt.
      by move => {eq_} /= eq_; move: (inj_bs_take_01_invntt _ _ _ _ _ _ eq_).
    rewrite -!addrA (IntID.addrC _ 6) in eq_.
    move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
    + by rewrite bsrev_len_start_range_invntt.
    + by rewrite bsrev_len_start_range_invntt.
    by move => {eq_} [eq_ <<-] /=; move: (inj_bs_take_11_invntt _ _ _ _ _ _ eq_).
  qed.

  lemma right_commutative_in_r_naive_invntt_inner zetas_inv kl ks r :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    right_commutative_in
      (r_naive_invntt_inner zetas_inv (bsrev 8 (2 ^ (kl + 1))) (bsrev 8 (ks * 2 ^ (kl + 2)))) r
      (map (transpose Int.( * ) (2 ^ (7 - kl))) (range 0 (2 ^ (kl + 1)))).
  proof.
    move => mem_kl_range mem_ks_range j1 j2 mem_j1 mem_j2.
    move: (right_commutative_in_r_naive_invntt_inner_2 zetas_inv kl r _
             ((bsrev 8 (ks * 2 ^ (kl + 2))), j1)
             ((bsrev 8 (ks * 2 ^ (kl + 2))), j2) _ _ ) => //.
    + apply/allpairsP; exists ((bsrev 8 (ks * 2 ^ (kl + 2))), j1) => /=.
      by split => //; apply/(map_f (bsrev 8))/(map_f (transpose Int.( * ) (2 ^ (kl + 2)))).
    apply/allpairsP; exists ((bsrev 8 (ks * 2 ^ (kl + 2))), j2) => /=.
    by split => //; apply/(map_f (bsrev 8))/(map_f (transpose Int.( * ) (2 ^ (kl + 2)))).
  qed.

  lemma right_commutative_in_r_naive_invntt_outer zetas_inv kl r :
    kl \in range 0 7 =>
    right_commutative_in (r_naive_invntt_outer zetas_inv (bsrev 8 (2 ^ (kl + 1)))) r (range 0 (2 ^ (6 - kl))).
  proof.
    move => mem_kl_range ks1 ks2 mem_ks1_range mem_ks2_range.
    rewrite /r_naive_invntt_outer /r_naive_invntt_inner_foldl.
    pose f:= r_naive_invntt_inner zetas_inv (bsrev 8 (2 ^ (kl + 1))); pose s:= (List.map _ _).
    rewrite (foldl_zip_nseq f ks1 r s).
    rewrite (foldl_zip_nseq f ks2 r s).
    rewrite (foldl_zip_nseq f ks1 (foldl _ _ _) s).
    rewrite (foldl_zip_nseq f ks2 (foldl _ _ _) s).
    rewrite -!foldl_cat -!zip_cat ?size_nseq ?ler_maxr ?size_ge0 //.
    apply foldl_perm_in => {r}.
    + move => r [start1 j1] [start2 j2] /mem_zip [].
      rewrite size_map size_range /= !mem_cat !mem_nseq /= ltzE => or_eq1.
      rewrite bsrev_pow2 ?opprD /= in or_eq1.
      - by rewrite mem_range_addr; move: mem_kl_range; apply mem_range_incl.
      rewrite addrC (divz_pow_sub_range _ _ _ mem_kl_range) //= ler_maxr ? expr_ge0 // in or_eq1.
      rewrite (le_expr_add_range _ _ _ 0 mem_kl_range) //= in or_eq1.
      rewrite orb_idl // => mem_j1 /mem_zip [].
      rewrite !mem_cat !mem_nseq /= ltzE => or_eq2.
      rewrite bsrev_pow2 ?opprD /= in or_eq2.
      - by rewrite mem_range_addr; move: mem_kl_range; apply mem_range_incl.
      rewrite addrC (divz_pow_sub_range _ _ _ mem_kl_range) //= ler_maxr ? expr_ge0 // in or_eq2.
      rewrite (le_expr_add_range _ _ _ 0 mem_kl_range) //= in or_eq2.
      rewrite orb_idl // => mem_j2; rewrite /f /= => {f}.
      move: (right_commutative_in_r_naive_invntt_inner_2
               zetas_inv kl r _
               (start1, j1)
               (start2, j2) _ _) => //.
      - apply allpairsP; exists (start1, j1) => //=; split => //=.
        * rewrite -(perm_eq_mem _ _ (perm_eq_outer_invntt kl _)) //.
          by case: or_eq1 => [<<-|<<-].
        move: mem_j1; rewrite /s bsrev_pow2 ?opprD /=.
        * by rewrite mem_range_addr; move: mem_kl_range; apply mem_range_incl.
        rewrite addrC (divz_pow_sub_range _ _ _ mem_kl_range) //=.
        by rewrite (exprSr_sub_range _ _ _ mem_kl_range).
      apply allpairsP; exists (start2, j2) => //=; split => //=.
      - rewrite -(perm_eq_mem _ _ (perm_eq_outer_invntt kl _)) //.
        by case: or_eq2 => [<<-|<<-].
      move: mem_j2; rewrite /s bsrev_pow2 ?opprD /=.
      - by rewrite mem_range_addr; move: mem_kl_range; apply mem_range_incl.
      rewrite addrC (divz_pow_sub_range _ _ _ mem_kl_range) //=.
      by rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
    by rewrite !zip_cat ?size_nseq ?ler_maxr ?size_ge0 // perm_catC.
  qed.

  lemma right_commutative_in_r_naive_invntt_post zetas_inv r :
    right_commutative_in (r_naive_invntt_post zetas_inv) r (range 0 256).
  proof.
    move => y z mem_y_range mem_z_range; rewrite /r_naive_invntt_post.
    congr; pose rr:= perm _ r; move: rr => {r} r.
    rewrite !set_permiE ?is_perm_bsrev_8 // -?mem_range //.
    + by rewrite (bsrev_range 8).
    + by rewrite (bsrev_range 8).
    do 4!(move: (perm_perm); rewrite /(\o) => ->; [by rewrite is_perm_bsrev_8|]).
    do 4!(rewrite perm_id; [by move => x /mem_range mem_x_range /=; rewrite bsrev_involutive|]).
    rewrite !bsrev_involutive //; case: (y = z) => [->> //|neqyz].
    rewrite !set_neqiE -?mem_range //; [by rewrite eq_sym|].
    by rewrite set_set_swap.
  qed.

  lemma eq_r_invntt_inner zetas_inv kl ks kj r :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    r_bsrev_invntt_inner zetas_inv (2 ^ (kl + 1)) (ks * 2 ^ (kl + 2)) r (kj + ks * 2 ^ (kl + 2)) =
    r_naive_invntt_inner zetas_inv (bsrev 8 (2 ^ (kl + 1))) (bsrev 8 (ks * 2 ^ (kl + 2))) r (bsrev 8 kj).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    rewrite /r_bsrev_invntt_inner /r_naive_invntt_inner.
    rewrite set2_mul_addr_permiE; [by rewrite is_perm_bsrev_8| | |].
    + by rewrite add_j_start_invntt //; pose n:= (_ + _)%Int; move: (bsrev_range 8 n).
    + by rewrite add_j_len_start_invntt //; pose n:= (_ + _ + _)%Int; move: (bsrev_range 8 n).
    pose r1:= set2_mul_addr _ _ _ _; pose r2:= set2_mul_addr _ _ _ _.
    move: (perm_perm (bsrev 8) (bsrev 8) r2 is_perm_bsrev_8).
    rewrite /(\o) /= => ->; rewrite perm_id //.
    + by move => x /mem_range mem_x_range /=; rewrite bsrev_involutive.
    rewrite /r1 /r2 => {r1 r2}.
    rewrite add_j_len_start_invntt // add_j_start_invntt // !bsrev_involutive //=.
    + by rewrite bsrev_mem_add_j_start_range_invntt.
    + by rewrite bsrev_mem_add_j_len_start_range_invntt.
    rewrite addrAC bsrev_pow2.
    + by rewrite mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    rewrite opprD /= (IntID.addrC _ 6) (divz_pow_sub_range _ _ _ mem_kl_range) //=.
    rewrite (exprSr_add_range _ _ _ mem_kl_range) //= divzMDr; [by apply/gtr_eqF/expr_gt0|].
    rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= mulNr /= addrA.
    have -> //: 128 + ks - 2 ^ (7 - kl) =
                bsrev 8 ((bsrev 8 (ks * 2 ^ (kl + 2)) * 2 + 1) * 2 ^ (kl + 1) - 2).
    rewrite addrAC (IntID.exprD_nneg 2 (kl + 1) 1) //.
    + by rewrite addr_ge0 //; move: mem_kl_range; apply mem_range_le.
    rewrite mulrA (IntID.mulrC _ (2 ^ 1)) bsrev_mulr_pow2 // divzK.
    + apply/bsrev_range_dvdz => //=; rewrite mem_range_mulr ?expr_gt0 //=.
      by rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range).
    rewrite mulrDl /= (IntID.mulrC ks (2 ^ _)) bsrev_mulr_pow2.
    + by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    rewrite eq_sym -addrA (IntID.addrC _ (_ - _)%Int) (IntID.mulrC _ (2 ^ _)).
    rewrite bsrev_add.
    + by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    + rewrite mem_range subr_ge0 ltr_subl_addr -ltr_subl_addl /= -{1}expr1.
      by apply/ler_weexpn2l => //=; rewrite -ler_subl_addr; move: mem_kl_range; apply/mem_range_le.
    rewrite -bsrev_mulr_pow2.
    + by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    rewrite (IntID.mulrC (2 ^ _)) divzK.
    + apply/bsrev_range_dvdz => //=.
      - by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply mem_range_incl.
      move: mem_ks_range; apply/mem_range_incl => //; apply/ler_weexpn2l => //.
      by rewrite opprD addrA addrAC /= ler_sub //= subr_ge0; move: mem_kl_range; apply/mem_range_ge.
    rewrite bsrev_involutive //=.
    + move: mem_ks_range; apply/mem_range_incl => //; have ->: 256 = 2 ^ 8 by trivial.
      apply/ler_weexpn2l/le2_mem_range => //; rewrite mem_range_subl.
      by move: mem_kl_range; apply/mem_range_incl.
    congr; have ->: 2 ^ (kl + 1) - 2 = 2 ^ 1 * (2 ^ kl - 1).
    + by rewrite expr1 mulrDr /= exprS //; move: mem_kl_range; apply mem_range_le.
    rewrite bsrev_mulr_pow2 // bsrev_cat_nseq_true_false.
    + by rewrite le2_mem_range; move: mem_kl_range; apply mem_range_incl.
    rewrite divzDl //=; congr; rewrite -IntID.mulN1r div_mulr.
    + rewrite -{1}expr1 dvdz_exp2l /= ler_subr_addl -ler_subr_addr.
      by move: mem_kl_range; apply/mem_range_ge.
    by rewrite (pow_div1_sub_range _ _ _ mem_kl_range) //= mulN1r.
  qed.

  lemma eq_r_invntt_outer zetas_inv kl ks r :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    r_bsrev_invntt_outer zetas_inv (2 ^ (kl + 1))           r (ks * 2 ^ (kl + 2)) =
    r_naive_invntt_outer zetas_inv (bsrev 8 (2 ^ (kl + 1))) r (bsrev 8 (ks * 2 ^ (kl + 2))).
  proof.
    move => mem_kl_range mem_ks_range; rewrite /r_bsrev_invntt_outer /r_naive_invntt_outer.
    rewrite /r_bsrev_invntt_inner_foldl /r_naive_invntt_inner_foldl.
    rewrite {2 3}bsrev_pow2; [by rewrite mem_range_addr; move: mem_kl_range; apply mem_range_incl|].
    rewrite opprD addrA addrAC /= (exprSr_sub_range _ _ _ mem_kl_range) //=.
    rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
    pose s1 := (List.map _ _); pose s2 := (List.map _ _).
    rewrite (foldl_perm_in _ s2 (map (bsrev 8) (map (transpose Int.(-) (ks * 2 ^ (kl + 2))) s1))).
    + by move => {r} r; apply right_commutative_in_r_naive_invntt_inner.
    + by rewrite perm_eq_inner_invntt.
    rewrite !foldl_map; apply eq_in_foldl => // {r} r kj mem_y_range /=.
    rewrite addrAC /= (IntID.addrC _ kj).
    by apply eq_r_invntt_inner.
  qed.

  lemma eq_r_invntt zetas_inv kl r :
    kl \in range 0 7 =>
    r_bsrev_invntt zetas_inv r (2 ^ (kl + 1)) =
    r_naive_invntt zetas_inv r (bsrev 8 (2 ^ (kl + 1))).
  proof.
    move => mem_kl_range; rewrite /r_bsrev_invntt /r_naive_invntt.
    rewrite /r_bsrev_invntt_outer_foldl /r_naive_invntt_outer_foldl.
    rewrite (exprSr_add_range _ _ _ mem_kl_range) //=.
    rewrite (divz_pow_add_range _ _ _ mem_kl_range) //=.
    rewrite {2}bsrev_pow2; [by rewrite mem_range_addr; move: mem_kl_range; apply mem_range_incl|].
    rewrite opprD addrA addrAC /=.
    pose s1 := (List.map _ _); pose s2 := (range _ _).
    rewrite (foldl_perm_in _ s2 (map (bsrev 8) s1)).
    + by move => {r} r; apply right_commutative_in_r_naive_invntt_outer.
    + by rewrite perm_eq_outer_invntt.
    rewrite !foldl_map; apply eq_in_foldl => // {r} r kj mem_y_range /=.
    by rewrite eq_r_invntt_outer.
  qed.

  lemma eq_r_bsrev_post zetas_inv r :
    r_bsrev_invntt_post_foldl zetas_inv r 256 =
    r_naive_invntt_post_foldl zetas_inv r 256.
  proof.
    rewrite /r_bsrev_invntt_post_foldl /r_naive_invntt_post_foldl.
    rewrite (foldl_perm_in (r_naive_invntt_post zetas_inv) _ (map (bsrev 8) (range 0 256))).
    + by move => {r} r; apply right_commutative_in_r_naive_invntt_post.
    + by apply/perm_eq_post.
    rewrite /r_bsrev_invntt_post /r_naive_invntt_post.
    rewrite foldl_map; apply eq_in_foldl => //.
    move => {r} r x mem_x_range /=; rewrite get_permiE.
    + by apply/mem_range/(bsrev_range 8).
    rewrite bsrev_involutive // set_permiE.
    + by apply is_perm_bsrev_8.
    + by apply/mem_range/(bsrev_range 8).
    rewrite bsrev_involutive //; move: perm_perm; rewrite /(\o) => ->.
    + by apply is_perm_bsrev_8.
    by rewrite perm_id // => y /mem_range mem_y_range /=; rewrite bsrev_involutive.
  qed.

  equiv bsrev_invntt_inner :
    NTT_bsrev.invntt_inner ~ NTT_naive.invntt_inner :
    inv_bsrev_invntt_outer
      NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
      NTT_vars.len{1} NTT_vars.len{2}
      NTT_vars.start{1} NTT_vars.start{2}
      (NTT_vars.r{1}, NTT_vars.r{2}) /\
    NTT_vars.start{1} < 256 /\ NTT_vars.start{2} < NTT_vars.len{2} ==>
    inv_bsrev_invntt_outer
      NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
      NTT_vars.len{1} NTT_vars.len{2}
      NTT_vars.start{1} NTT_vars.start{2}
      (NTT_vars.r{1}, NTT_vars.r{2}) /\
    (NTT_vars.start{1} < 256 <=> NTT_vars.start{2} < NTT_vars.len{2}).
  proof.
    proc; wp.
    while (
      inv_bsrev_invntt_inner
        NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
        NTT_vars.len{1} NTT_vars.len{2}
        NTT_vars.start{1} NTT_vars.start{2}
        NTT_vars.zeta_{1} NTT_vars.zeta_{2}
        NTT_vars.j{1} NTT_vars.j{2}
        (NTT_vars.r{1}, NTT_vars.r{2}) );
    wp.
    + skip => &1 &2 /=; rewrite /inv_bsrev_invntt_inner /=.
      apply/RHL_FOR_INT_ADD_LT2.inv_in => //=.
      - move => -[[[<-]]] /= [kl] [/mem_range mem_kl_range] [->> ->>].
        rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
        rewrite (exprS_range _ _ _ mem_kl_range) //=.
        rewrite (exprSr_add_range _ _ _ mem_kl_range) //= expr_gt0 //=.
        rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //=.
        move => [ks] [/mem_range mem_ks_range] [->> ->>] _.
        rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //=.
        rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
        by rewrite ger_addl addrAC /= lerNgt expr_gt0.
      move => [[[<-]]] /= [kl] [/mem_range mem_kl_range] [->> ->>].
      rewrite (exprS_range _ _ _ mem_kl_range) //=.
      rewrite (exprSr_add_range _ _ _ mem_kl_range) //= expr_gt0 //=.
      rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
      rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
      rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //=.
      rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
      move => [ks] [/mem_range mem_ks_range] [->> ->>] [->> ->>].
      rewrite ger_addl addrAC /= lerNgt expr_gt0 //=.
      move => ? <<- kj mem_kj_range ->> ->>; rewrite /Q_bsrev_invntt_inner /=.
      move => [r] [->> ->>]; rewrite addrA /= mulrDl /= -exprSr /=.
      - by rewrite addr_ge0 //; move: mem_kl_range; apply mem_range_le.
      rewrite mulzK; [by apply/gtr_eqF/expr_gt0|].
      exists r; rewrite /r_bsrev_invntt_inner_foldl /r_naive_invntt_inner_foldl rangeSr.
      - by move: mem_kj_range; apply mem_range_le.
      rewrite !map_rcons !foldl_rcons /=.
      rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
      pose r1:= (foldl _ _ _); pose r2:= (foldl _ _ _).
      move: r1 r2 => r1 r2; rewrite /r_bsrev_invntt_inner /r_naive_invntt_inner.
      rewrite (exprSr_add_range _ _ _ mem_kl_range) //=.
      rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
      rewrite set2_mul_addr_permiE; [by rewrite is_perm_bsrev_8| | | ].
      - by apply mem_add_j_start_range_invntt.
      - by apply mem_add_j_len_start_range_invntt.
      pose r':= set2_mul_addr _ _ _ _.
      move: (perm_perm _ (bsrev 8) r' is_perm_bsrev_8).
      rewrite /(\o) /= => -> /=; rewrite perm_id //.
      by move => x /mem_range mem_x_range /=; rewrite bsrev_involutive.
    skip => &1 &2; rewrite {1}/inv_bsrev_invntt_outer => inv_start.
    move: (RHL_FOR_INT_ADD_LT2.invP _ _ _ _ _ _ _ _ _ _ _ _ inv_start).
    + move => [eq_zetas_inv]; move: eq_zetas_inv inv_start => <- inv_start.
      move => /= [k] [/mem_range mem_k_range] [->> ->>].
      rewrite (exprS_range _ _ _ mem_k_range) //=.
      rewrite (exprSr_add_range _ _ _ mem_k_range) //= expr_gt0 //=.
      rewrite (NdivzN_pow_add_range _ _ _ mem_k_range) //=.
      rewrite (divz_pow_range _ _ _ mem_k_range) //=.
      by rewrite lerNgt expr_gt0.
    move => [[eq_zetas_inv]]; move: eq_zetas_inv inv_start => <- inv_start.
    move => /= [kl] [/mem_range mem_kl_range] [->> ->>].
    move: inv_start; rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
    rewrite (exprS_range _ _ _ mem_kl_range) //=.
    rewrite (exprSr_add_range _ _ _ mem_kl_range) //= expr_gt0 //= => inv_start.
    rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //=.
    rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
    move => [ks] [/mem_range mem_ks_range] [->>] [->>] [r] /= [->> ->>].
    split => //.
    + rewrite /inv_bsrev_invntt_inner ltr_addl expr_gt0 //=.
      rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
      apply/RHL_FOR_INT_ADD_LT2.inv_0_inv => //=.
      - move => _; rewrite expr_gt0 //=.
        rewrite ger_addl lerNgt expr_gt0 //= addrAC /=.
        by rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range).
      - split.
        * rewrite (exprSr_add_range _ _ _ mem_kl_range) //=.
          move: inv_start; apply/RHL_FOR_INT_ADD_LT2.inv_context => //=.
          rewrite expr_gt0 //= (NdivzN_pow_add_range _ _ _ mem_kl_range) //=.
          by rewrite lerNgt expr_gt0.
        rewrite divzMDr; [by apply/gtr_eqF/expr_gt0|].
        rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
        rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= mulNr /= addrA.
        rewrite (exprSr_add_range _ _ _ mem_kl_range) //= (IntID.addrC (-512)).
        rewrite divzMDl; [by apply/gtr_eqF/expr_gt0|].
        by rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= mulNr /= addrA.
      exists r => //=; rewrite /r_bsrev_invntt_inner_foldl /r_naive_invntt_inner_foldl range_geq //=.
      by rewrite (exprSr_add_range _ _ _ mem_kl_range) //= mulzK // gtr_eqF // expr_gt0.
    move => j1 r1 j2 r2 /=; rewrite /inv_bsrev_invntt_inner.
    pose R (_ _ : int) (s : coeff Array256.t * coeff Array256.t) :=
      inv_bsrev_invntt_outer
        NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{1}
        (2 ^ (kl + 1)) (2 ^ (6 - kl))
        (ks * 2 ^ (kl + 2) + 2 ^ (kl + 2))
        (ks + 1) s /\
      (ks * 2 ^ (kl + 2) + 2 ^ (kl + 2) < 256 <=> ks + 1 < 2 ^ (6 - kl)).
    apply/(RHL_FOR_INT_ADD_LT2.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
    + rewrite /R ger_addl lerNgt expr_gt0 //= addrAC /= => _ {R inv_start}.
      rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //=.
      by rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range).
    rewrite /R ger_addl lerNgt expr_gt0 //= addrAC /= => {R inv_start}.
    rewrite divzMDr; [by rewrite gtr_eqF // expr_gt0|].
    rewrite (divz_pow_add_range _ _ _ mem_kl_range) //=.
    rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
    rewrite (exprD_nneg_add_sub_range _ _ _ mem_kl_range) //=.
    move => [[? _] _] {r1 r2 r} [r1 r2] [r] /= [->> ->>].
    rewrite -mulrSl -ltz_NdivNLR; [by rewrite expr_gt0|].
    rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //=.
    split => //=; rewrite (exprSr_add_range _ _ _ mem_kl_range) //=.
    rewrite expr_gt0 //=; exists (ks + 1) => //=.
    rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //=.
    rewrite le2_mem_range mem_range_addr /=; split.
    + by move: mem_ks_range; apply mem_range_incl.
    exists r => //=; rewrite /r_bsrev_invntt_outer_foldl /r_naive_invntt_outer_foldl.
    rewrite (exprSr_add_range _ _ _ mem_kl_range) //=.
    rewrite mulzK; [by rewrite gtr_eqF // expr_gt0|].
    rewrite rangeSr; [by move: mem_ks_range; apply mem_range_le|].
    rewrite map_rcons !foldl_rcons; pose r1:= (foldl _ _ _); pose r2:= (foldl _ _ _).
    move: r1 r2 => r1 r2; rewrite /r_bsrev_invntt_outer /r_naive_invntt_outer.
    by rewrite (divz_pow_sub_range _ _ _ mem_kl_range).
  qed.

  equiv bsrev_invntt_outer :
    NTT_bsrev.invntt_outer ~ NTT_naive.invntt_outer :
    inv_bsrev_invntt
      NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
      NTT_vars.len{1} NTT_vars.len{2}
      (NTT_vars.r{1}, NTT_vars.r{2}) /\
    NTT_vars.len{1} <= 128 /\ 1 <= NTT_vars.len{2} ==>
    inv_bsrev_invntt
      NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
      NTT_vars.len{1} NTT_vars.len{2}
      (NTT_vars.r{1}, NTT_vars.r{2}) /\
    (NTT_vars.len{1} <= 128 <=> 1 <= NTT_vars.len{2}).
  proof.
    proc; wp.
    while (
      inv_bsrev_invntt_outer
        NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
        NTT_vars.len{1} NTT_vars.len{2}
        NTT_vars.start{1} NTT_vars.start{2}
        (NTT_vars.r{1}, NTT_vars.r{2}) );
    wp; first by call bsrev_invntt_inner.
    skip => &1 &2; rewrite {1}/inv_bsrev_invntt => inv_len.
    move: (RHL_FOR_NAT_MUL_LE_DIV_GE.invP _ _ _ _ _ _ _ _ _ _ _ _ inv_len); [by trivial|].
    move => [P] [k] [/mem_range mem_k_range] [->>] [->>]. 
    move: inv_len; rewrite /= (divz_pow_range _ _ _ mem_k_range) //= => inv_len inv_start.
    rewrite /= in mem_k_range; rewrite expr_gt0 //=; split => //.
    + rewrite /inv_bsrev_invntt_outer; apply/RHL_FOR_INT_ADD_LT2.inv_0_inv => //=.
      - move => _; rewrite (exprS_range _ _ _ mem_k_range) //=.
        rewrite (exprSr_add_range _ _ _ mem_k_range) //= expr_gt0 //=.
        by rewrite (NdivzN_pow_add_range _ _ _ mem_k_range) //= lerNgt expr_gt0.
      - by move: inv_len; apply/RHL_FOR_NAT_MUL_LE_DIV_GE.inv_context.
      move: inv_start => {inv_len} => <- /=; exists NTT_vars.r{1} => /=.
      by rewrite /r_bsrev_invntt_outer_foldl /r_naive_invntt_outer_foldl range_geq.
    move => {inv_len inv_start} /=; move: P => <-.
    move => r1 start1 r2 start2; rewrite /inv_bsrev_invntt_outer.
    rewrite (exprS_range _ _ _ mem_k_range) //=.
    rewrite (exprSr_add_range _ _ _ mem_k_range) //=.
    pose R (_ _ : int) s :=
      inv_bsrev_invntt 
      NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{1} (2 ^ (k + 2)) (2 ^ (6 - k) %/ 2) s /\
      (2 ^ (k + 2) <= 128 <=> 1 <= 2 ^ (6 - k) %/ 2).
    apply/(RHL_FOR_INT_ADD_LT2.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
    + rewrite expr_gt0 //= (NdivzN_pow_add_range _ _ _ mem_k_range) //=.
      by rewrite lerNgt expr_gt0.
    rewrite expr_gt0 //= (NdivzN_pow_add_range _ _ _ mem_k_range) //=.
    rewrite (exprD_nneg_sub_add_range _ _ _ mem_k_range) //= /R => {R}.
    move => _ {r1 r2} [r1 r2] [r] /= [->> ->>]; split => //=; last first.
    + move: mem_k_range; rewrite (rangeSr 0 6) //= mem_rcons /=; case => [->> //=|mem_k_range].
      rewrite (pow_div1_sub_range _ _ _ mem_k_range) //=.
      rewrite (expr_add_le_range _ _ _ 7 mem_k_range) //=.
      by rewrite (le_expr_sub_range _ _ _ 0 mem_k_range 2).
    rewrite /inv_bsrev_invntt; split => //=; exists (k + 1) => //=.
    rewrite (exprS_add_range _ _ _ mem_k_range) //=.
    split; [by rewrite le2_mem_range mem_range_addr; move: mem_k_range; apply mem_range_incl|].
    split.
    + move: mem_k_range; rewrite (rangeSr 0 6) //= mem_rcons /=; case => [->> //=|mem_k_range].
      rewrite (pow_div1_sub_range _ _ _ mem_k_range) //=.
      by rewrite (divz_pow_add_range _ _ _ mem_k_range).
    rewrite /Q_bsrev_invntt /=.
    move: (eq_r_invntt NTT_vars.zetas_inv{1} k r _) => //; rewrite /r_bsrev_invntt /r_naive_invntt bsrev_pow2.
    + by rewrite mem_range_addr; move: mem_k_range; apply mem_range_incl.
    by rewrite (divz_pow_add_range _ _ _ mem_k_range) //= opprD addrA addrAC.
  qed.

  equiv bsrev_invntt_post :
    NTT_bsrev.invntt_post ~ NTT_naive.invntt_post :
    ={NTT_vars.zetas_inv, NTT_vars.r} ==>
    ={NTT_vars.r}.
  proof.
    proc.
    while (
      inv_bsrev_invntt_post
        NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
        NTT_vars.j{1} NTT_vars.j{2}
        (NTT_vars.r{1}, NTT_vars.r{2}) );
    wp; skip => &1 &2.
    + rewrite /inv_bsrev_invntt_post /=.
      apply/RHL_FOR_INT_ADD_LT2.inv_in => //=.
      move => _ ? <<- k mem_k_range ->> ->> [r] [-> ->] /=.
      exists r => /=; rewrite /r_bsrev_invntt_post_foldl /r_naive_invntt_post_foldl.
      rewrite rangeSr; [by move: mem_k_range; apply mem_range_le|].
      rewrite !foldl_rcons /= {3}/r_bsrev_invntt_post /= {3}/r_naive_invntt_post.
      rewrite get_permiE; [by apply/mem_range|].
      pose r':= foldl _ _ _; rewrite set_permE; [by rewrite is_perm_bsrev_8|].
      rewrite -mem_range mem_k_range /=; pose r'':= _.[_ <- _]%Array256.
      move: (perm_perm (bsrev 8) (bsrev 8) r'').
      rewrite is_perm_bsrev_8 /(\o) /= => ->; rewrite perm_id //.
      by move => x /mem_range mem_x_range /=; rewrite (bsrev_involutive 8).
    move => [<<- <<-]; split; rewrite/inv_bsrev_invntt_post.
    + apply/RHL_FOR_INT_ADD_LT2.inv_0 => //=; exists NTT_vars.r{1}.
      rewrite /r_bsrev_invntt_post_foldl /r_naive_invntt_post_foldl /=.
      by rewrite range_geq.
    move => j1 r1 j2 r2.
    pose R (_ _ : int) (s : coeff Array256.t * coeff Array256.t) :=
      (s.`1 = s.`2).
    apply/(RHL_FOR_INT_ADD_LT2.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
    move => _ {r1 r2} [r1 r2] [r] /= [->> ->>]; rewrite /R => {R} /=.
    by apply/eq_r_bsrev_post.
  qed.

  equiv bsrev_invntt :
    NTT_bsrev.invntt ~ NTT_naive.invntt :
    ={NTT_vars.zetas_inv, NTT_vars.r} ==>
    ={res}.
  proof.
    proc; call bsrev_invntt_post.
    while (
      inv_bsrev_invntt
        NTT_vars.zetas_inv{1} NTT_vars.zetas_inv{2}
        NTT_vars.len{1} NTT_vars.len{2}
        (NTT_vars.r{1}, NTT_vars.r{2}) );
    wp; first by call bsrev_invntt_outer.
    skip => &1 &2 [<<- <<-].
    rewrite /inv_bsrev_invntt; split.
    + by rewrite RHL_FOR_NAT_MUL_LE_DIV_GE.inv_0.
    move => len1 r1 len2 r2.
    pose R (_ _ : int) (s : coeff Array256.t * coeff Array256.t) :=
      (s.`1 = s.`2).
    by apply/(RHL_FOR_NAT_MUL_LE_DIV_GE.inv_out _ _ _ _ _ _ _ _ _ R).
  qed.


  (*The NTT version to be used in the AVX2 equivalence proof.*)
  op r_avx2_ntt zetas r k =
    r_bsrev_ntt zetas r (2 ^ (7 - k)).

  op r_avx2_invntt zetas_inv r k =
    r_bsrev_invntt zetas_inv r (2 ^ (k + 1)).

  op r_avx2_invntt_post zetas_inv r =
    r_bsrev_invntt_post_foldl zetas_inv r 256.

  module NTT_avx2 = {

    var zetas, zetas_inv : coeff Array128.t
    var r : coeff Array256.t
    var k : int

    proc ntt() = {
      k <- 0;
      while (k < 7) {
        r <- r_avx2_ntt zetas r k;
        k <- k + 1;
      }
      return r;
    }

    proc invntt() = {
      k <- 0;
      while (k < 7) {
        r <- r_avx2_invntt zetas_inv r k;
        k <- k + 1;
      }
      r <- r_avx2_invntt_post zetas_inv r;
      return r;
    }

  }.

  op P_avx2_ntt (zetas1 zetas2 : coeff Array128.t) =
    zetas1 = zetas2.

  op Q_avx2_ntt (_ _ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    s.`1 = s.`2.

  op inv_avx2_ntt zetas1 zetas2 =
    RHL_FOR_NAT_DIV_GE_INT_ADD_LT.inv
    2 7 2 1 128 0
    (P_avx2_ntt zetas1 zetas2)
    Q_avx2_ntt.

  op P_avx2_ntt_outer zetas1 zetas2 =
    RHL_FOR_NAT_DIV_GE_INT_ADD_LT.context
    2 7 2 1 128 0
    (P_avx2_ntt zetas1 zetas2).

  op Q_avx2_ntt_outer
    zetas1 (len1 : int) r k (_ : int) (s : coeff Array256.t) =
    s = r_bsrev_ntt_outer_foldl zetas1 len1 r k.

  op inv_avx2_ntt_outer zetas1 zetas2 len1 len2 r =
    HL_FOR_INT_ADD_LT.inv
      256 (len1 * 2) 0
      ( P_avx2_ntt_outer zetas1 zetas2 len1 len2 )
      ( Q_avx2_ntt_outer zetas1 len1 r ).

  op P_avx2_ntt_inner
    zetas1 zetas2 len1 len2 start1 (zeta_1 : coeff) =
    HL_FOR_INT_ADD_LT.context
      256 (len1 * 2) 0
      ( P_avx2_ntt_outer zetas1 zetas2 len1 len2 )
      start1 /\
    zeta_1 = zetas1.[(256 + start1) %/ (len1 * 2)].

  op Q_avx2_ntt_inner
    zetas1 (len1 start1 : int) r k (_ : int) (s : coeff Array256.t) =
    s = r_bsrev_ntt_inner_foldl zetas1 len1 start1
          (r_bsrev_ntt_outer_foldl zetas1 len1 r (start1 %/ (len1 * 2))) k.

  op inv_avx2_ntt_inner
    zetas1 zetas2 (len1 len2 start1 : int) zeta_1 r =
    HL_FOR_INT_ADD_LT.inv
      (start1 + len1) 1 start1
      ( P_avx2_ntt_inner zetas1 zetas2 len1 len2 start1 zeta_1 )
      ( Q_avx2_ntt_inner zetas1 len1 start1 r ).

  equiv avx2_ntt :
    NTT_bsrev.ntt ~ NTT_avx2.ntt :
    NTT_vars.zetas{1} = NTT_avx2.zetas{2} /\
    NTT_vars.r{1} = NTT_avx2.r{2} ==>
    ={res}.
  proof.
    proc.
    while (
      inv_avx2_ntt
        NTT_vars.zetas{1} NTT_avx2.zetas{2}
        NTT_vars.len{1} NTT_avx2.k{2}
        (NTT_vars.r{1}, NTT_avx2.r{2}) );
    wp.
    + inline*; wp.
      while{1} (
        inv_avx2_ntt_outer
          NTT_vars.zetas{1} NTT_avx2.zetas{2}
          NTT_vars.len{1} NTT_avx2.k{2}
          NTT_avx2.r{2}
          NTT_vars.start{1} NTT_vars.r{1} ) (256 - NTT_vars.start{1}).
      - move => &2 v; wp.
        while (
          inv_avx2_ntt_inner
            NTT_vars.zetas NTT_avx2.zetas{2}
            NTT_vars.len NTT_avx2.k{2}
            NTT_vars.start NTT_vars.zeta_ NTT_avx2.r{2}
            NTT_vars.j NTT_vars.r ) (NTT_vars.start + NTT_vars.len - NTT_vars.j).
        * move => {v} v; wp; skip => &1 /= [inv_j <<-].
          rewrite opprD !addrA ltr_subl_addr ltzS /=.
          move: inv_j; rewrite /inv_avx2_ntt_inner.
          apply/HL_FOR_INT_ADD_LT.inv_in.
          move => [] [] [_] /= [kl] [/mem_range mem_kl_range] [-> _].
          rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
          rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //=.
          rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
          move => [ks] [/mem_range mem_ks_range ->] -> ? <<- kj.
          rewrite -ler_subr_addl /= lerNgt expr_gt0 //= addrAC /=.
          move => mem_kj_range ->; rewrite addrA /= => ->.
          rewrite divzMDr; [by apply/gtr_eqF/expr_gt0|].
          rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
          rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
          rewrite mulzK; [by apply/gtr_eqF/expr_gt0|].
          rewrite /Q_avx2_ntt_inner /r_bsrev_ntt_inner_foldl rangeSr.
          + by move: mem_kj_range; apply/mem_range_le.
          rewrite map_rcons foldl_rcons.
          rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
          rewrite mulzK; [by apply/gtr_eqF/expr_gt0|].
          pose r:= foldl _ _ _; move: r => r; rewrite /r_bsrev_ntt_inner.
          rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
          rewrite -(exprS_sub_range _ _ _ mem_kl_range 2 7) //=.
          rewrite mulrA mulzK; [by apply/gtr_eqF/expr_gt0|].
          rewrite -(exprSr_range _ _ _ mem_kl_range) //=.
          by rewrite -mulrDl (IntID.addrC _ ks) mulzK.
        wp; skip => &1; rewrite /inv_avx2_ntt_outer => -[inv_start <<-] /=.
        case/HL_FOR_INT_ADD_LT.invP: inv_start (inv_start) => -[<-] /=.
        move => [kl] [/mem_range mem_kl_range [-> ->]].
        rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
        rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //=.
        rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
        move => [ks] [/mem_range mem_ks_range] [-> ->] inv_start.
        rewrite divzMDr; [by apply/gtr_eqF/expr_gt0|].
        rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
        split.
        * rewrite /inv_avx2_ntt_inner; apply/HL_FOR_INT_ADD_LT.inv_0 => //=.
          + rewrite /P_avx2_ntt_inner (exprSr_sub_range _ _ _ mem_kl_range) //=; split.
            - by move/HL_FOR_INT_ADD_LT.inv_context: inv_start.
            rewrite divzMDr; [by apply/gtr_eqF/expr_gt0|].
            by rewrite (divz_pow_sub_range _ _ _ mem_kl_range).
          rewrite /Q_avx2_ntt_inner.
          rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
          rewrite mulzK; [by apply/gtr_eqF/expr_gt0|].
          by rewrite /r_bsrev_ntt_inner_foldl range_geq.
        move => j r; split.
        * by move => _; rewrite -lerNgt subr_le0.
        move => Ncondj1 inv_j; rewrite opprD addrA -ltr_subr_addl /= oppr_lt0 expr_gt0 //=.
        move: inv_start; apply/HL_FOR_INT_ADD_LT.inv_in => _ /=. 
        rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //= expr_gt0 //=.
        move => ? <<- ? _; move: (IntID.mulIf (2 ^ (8 - kl)) _); [by apply/gtr_eqF/expr_gt0|].
        move => inj_ /inj_ {inj_} <<-; rewrite mulrDl //= => _.
        move: Ncondj1 inv_j; rewrite /inv_avx2_ntt_inner.
        pose R (_ : int) s :=
          Q_avx2_ntt_outer NTT_vars.zetas{1} (2 ^ (7 - kl)) NTT_avx2.r{2} (ks + 1) (ks * 2 ^ (8 - kl) + 2 ^ (8 - kl)) s.
        apply/(HL_FOR_INT_ADD_LT.inv_out _ _ _ _ _ R) => //=; rewrite /R => {R} _ rr.
        rewrite -ler_subr_addl /= lerNgt expr_gt0 //= addrAC /= => ->.
        rewrite /Q_avx2_ntt_outer /r_bsrev_ntt_outer_foldl rangeSr.
        * by move: mem_ks_range; apply/mem_range_le.
        rewrite map_rcons foldl_rcons {2}/r_bsrev_ntt_outer.
        rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
        by rewrite mulzK //; apply/gtr_eqF/expr_gt0.
      wp; skip => &1 &2; rewrite {1}/inv_avx2_ntt => inv_len.
      move: (RHL_FOR_NAT_DIV_GE_INT_ADD_LT.invP _ _ _ _ _ _ _ _ _ _ _ _ inv_len); [by trivial|].
      move => and_; move: and_ inv_len => [<-] /= [kl] [/mem_range mem_kl_range] [->] [->] <-.
      rewrite (divz_pow_range _ _ _ mem_kl_range) //= => inv_len; split.
      - rewrite /inv_avx2_ntt_outer /HL_FOR_INT_ADD_LT.inv /=; split.
        * by move: inv_len; rewrite /P_avx2_ntt_outer; apply/RHL_FOR_NAT_DIV_GE_INT_ADD_LT.inv_context.
        rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
        rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
        rewrite expr_gt0 //=; exists 0 => //=; rewrite expr_ge0 //=; rewrite /Q_avx2_ntt_outer.
        by rewrite /r_bsrev_ntt_outer_foldl range_geq.
      move => r1 start1; split; [by move => _; rewrite subr_le0 lerNgt|].
      rewrite /inv_avx2_ntt_outer /inv_avx2_ntt => Ncondstart1 inv_start.
      move: inv_len; apply/RHL_FOR_NAT_DIV_GE_INT_ADD_LT.inv_in => //=.
      move => _ ? <<- ? _ _ <<- /=.
      rewrite (pow_div1_sub_range _ _ _ mem_kl_range) //=.
      rewrite (divz_pow_add_range _ _ _ mem_kl_range) //=.
      rewrite (divz_pow_range _ _ _ mem_kl_range) //= => _.
      move: Ncondstart1 inv_start.
      pose R (_ : int) s :=
        Q_avx2_ntt (kl + 1) (2 ^ (6 - kl)) (kl + 1) (s, r_avx2_ntt NTT_vars.zetas{1} NTT_vars.r{1} kl).
      apply/(HL_FOR_INT_ADD_LT.inv_out _ _ _ _ _ R) => //=; rewrite /R => {R} ? r.
      rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //=.
      rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
      rewrite (exprD_nneg_sub_range _ _ _ mem_kl_range) //=.
      move => ->; rewrite /Q_avx2_ntt /=; rewrite /r_avx2_ntt /r_bsrev_ntt.
      by rewrite (divz_pow_sub_range _ _ _ mem_kl_range).
    skip => &1 &2 [<<- <<-].
    rewrite /inv_avx2_ntt; split.
    + by rewrite RHL_FOR_NAT_DIV_GE_INT_ADD_LT.inv_0.
    move => len1 r1 k2 r2.
    pose R (_ _ : int) (s : coeff Array256.t * coeff Array256.t) :=
      (s.`1 = s.`2).
    by apply/(RHL_FOR_NAT_DIV_GE_INT_ADD_LT.inv_out _ _ _ _ _ _ _ _ _ R).
  qed.

  op P_avx2_invntt (zetas1 zetas2 : coeff Array128.t) =
    zetas1 = zetas2.

  op Q_avx2_invntt (_ _ _ : int) (s : coeff Array256.t * coeff Array256.t) =
    s.`1 = s.`2.

  op inv_avx2_invntt zetas1 zetas2 =
    RHL_FOR_NAT_MUL_LE_INT_ADD_LT.inv
    128 7 2 1 2 0
    (P_avx2_invntt zetas1 zetas2)
    Q_avx2_invntt.

  op P_avx2_invntt_post (zetas_inv1 zetas_inv2 : coeff Array128.t) =
    zetas_inv1 = zetas_inv2.

  op Q_avx2_invntt_post zetas_inv1 r k (_ : int) (s : coeff Array256.t) =
      s = r_bsrev_invntt_post_foldl zetas_inv1 r k.

  op inv_avx2_invntt_post zetas_inv1 zetas_inv2 r =
    HL_FOR_INT_ADD_LT.inv
    256 1 0
    ( P_avx2_invntt_post zetas_inv1 zetas_inv2 )
    ( Q_avx2_invntt_post zetas_inv1 r ).

  op P_avx2_invntt_outer zetas1 zetas2 =
    RHL_FOR_NAT_MUL_LE_INT_ADD_LT.context
    128 7 2 1 2 0
    (P_avx2_invntt zetas1 zetas2).

  op Q_avx2_invntt_outer
    zetas1 (len1 : int) r k (_ : int) (s : coeff Array256.t) =
    s = r_bsrev_invntt_outer_foldl zetas1 len1 r k.

  op inv_avx2_invntt_outer zetas1 zetas2 len1 len2 r =
    HL_FOR_INT_ADD_LT.inv
      256 (len1 * 2) 0
      ( P_avx2_invntt_outer zetas1 zetas2 len1 len2 )
      ( Q_avx2_invntt_outer zetas1 len1 r ).

  op P_avx2_invntt_inner
    zetas1 zetas2 len1 len2 start1 (zeta_1 : coeff) =
    HL_FOR_INT_ADD_LT.context
      256 (len1 * 2) 0
      ( P_avx2_invntt_outer zetas1 zetas2 len1 len2 )
      start1 /\
    zeta_1 = zetas1.[128 + ((-512) + start1) %/ (len1 * 2)].

  op Q_avx2_invntt_inner
    zetas1 (len1 start1 : int) r k (_ : int) (s : coeff Array256.t) =
    s = r_bsrev_invntt_inner_foldl zetas1 len1 start1
          (r_bsrev_invntt_outer_foldl zetas1 len1 r (start1 %/ (len1 * 2))) k.

  op inv_avx2_invntt_inner
    zetas1 zetas2 (len1 len2 start1 : int) zeta_1 r =
    HL_FOR_INT_ADD_LT.inv
      (start1 + len1) 1 start1
      ( P_avx2_invntt_inner zetas1 zetas2 len1 len2 start1 zeta_1 )
      ( Q_avx2_invntt_inner zetas1 len1 start1 r ).

  equiv avx2_invntt :
    NTT_bsrev.invntt ~ NTT_avx2.invntt :
    NTT_vars.zetas_inv{1} = NTT_avx2.zetas_inv{2} /\
    NTT_vars.r{1} = NTT_avx2.r{2} ==>
    ={res}.
  proof.
    proc; inline NTT_bsrev.invntt_post; wp.
    while{1} (
      inv_avx2_invntt_post
        NTT_vars.zetas_inv{1} NTT_avx2.zetas_inv{2}
        NTT_avx2.r{2}
        NTT_vars.j{1} NTT_vars.r{1} ) (256 - NTT_vars.j{1}).
    + move => &2 ?; wp; skip => &1 [inv_post <<-] /=.
      rewrite opprD addrA ltzE /=; move: inv_post.
      rewrite /inv_avx2_invntt_post; apply/HL_FOR_INT_ADD_LT.inv_in.
      move => ? ? /= <<- kj mem_kj_range -> /= ->.
      rewrite /Q_avx2_invntt_post /r_bsrev_invntt_post_foldl rangeSr.
      - by move: mem_kj_range; apply/mem_range_le.
      rewrite foldl_rcons; pose r:= foldl _ _ _; move: r => r.
      by rewrite /r_bsrev_invntt_post.
    wp.
    while (
      inv_avx2_invntt
        NTT_vars.zetas_inv{1} NTT_avx2.zetas_inv{2}
        NTT_vars.len{1} NTT_avx2.k{2}
        (NTT_vars.r{1}, NTT_avx2.r{2}) );
    wp.
    + inline*; wp.
      while{1} (
        inv_avx2_invntt_outer
          NTT_vars.zetas_inv{1} NTT_avx2.zetas_inv{2}
          NTT_vars.len{1} NTT_avx2.k{2}
          NTT_avx2.r{2}
          NTT_vars.start{1} NTT_vars.r{1} ) (256 - NTT_vars.start{1}).
      - move => &2 v; wp.
        while (
          inv_avx2_invntt_inner
            NTT_vars.zetas_inv NTT_avx2.zetas_inv{2}
            NTT_vars.len NTT_avx2.k{2}
            NTT_vars.start NTT_vars.zeta_ NTT_avx2.r{2}
            NTT_vars.j NTT_vars.r ) (NTT_vars.start + NTT_vars.len - NTT_vars.j).
        * move => {v} v; wp; skip => &1 /= [inv_j <<-].
          rewrite opprD !addrA ltr_subl_addr ltzS /=.
          move: inv_j; rewrite /inv_avx2_invntt_inner.
          apply/HL_FOR_INT_ADD_LT.inv_in.
          move => [] [] [_] /= [kl] [/mem_range mem_kl_range] [-> _].
          rewrite (exprS_range _ _ _ mem_kl_range) //=.
          rewrite (exprSr_add_range _ _ _ mem_kl_range) //= expr_gt0 //=.
          rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //=.
          move => [ks] [/mem_range mem_ks_range ->] -> ? <<- kj.
          rewrite -ler_subr_addl /= lerNgt expr_gt0 //= addrAC /=.
          move => mem_kj_range ->; rewrite addrA /= => ->.
          rewrite divzMDr; [by apply/gtr_eqF/expr_gt0|].
          rewrite (exprSr_add_range _ _ _ mem_kl_range) //=.
          rewrite mulzK; [by apply/gtr_eqF/expr_gt0|].
          rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= mulN1r addrA.
          rewrite /Q_avx2_invntt_inner /r_bsrev_invntt_inner_foldl rangeSr.
          + by move: mem_kj_range; apply/mem_range_le.
          rewrite map_rcons foldl_rcons.
          rewrite (exprSr_add_range _ _ _ mem_kl_range) //=.
          rewrite mulzK; [by apply/gtr_eqF/expr_gt0|].
          pose r:= foldl _ _ _; move: r => r; rewrite /r_bsrev_invntt_inner.
          rewrite (exprSr_add_range _ _ _ mem_kl_range) //=.
          rewrite divzMDr; [by apply/gtr_eqF/expr_gt0|].
          by rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= mulN1r addrA.
        wp; skip => &1; rewrite /inv_avx2_invntt_outer => -[inv_start <<-] /=.
        case/HL_FOR_INT_ADD_LT.invP: inv_start (inv_start) => -[<-] /=.
        move => [kl] [/mem_range mem_kl_range [-> ->]].
        rewrite (exprS_range _ _ _ mem_kl_range) //=.
        rewrite (exprSr_add_range _ _ _ mem_kl_range) //= expr_gt0 //=.
        rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //=.
        move => [ks] [/mem_range mem_ks_range] [-> ->] inv_start.
        rewrite divzMDr; [by apply/gtr_eqF/expr_gt0|].
        rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= mulN1r addrA.
        split.
        * rewrite /inv_avx2_invntt_inner; apply/HL_FOR_INT_ADD_LT.inv_0 => //=.
          + rewrite /P_avx2_invntt_inner (exprSr_add_range _ _ _ mem_kl_range) //=; split.
            - by move/HL_FOR_INT_ADD_LT.inv_context: inv_start.
            rewrite divzMDr; [by apply/gtr_eqF/expr_gt0|].
            by rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= mulN1r addrA.
          rewrite /Q_avx2_invntt_inner.
          rewrite (exprSr_add_range _ _ _ mem_kl_range) //=.
          rewrite mulzK; [by apply/gtr_eqF/expr_gt0|].
          by rewrite /r_bsrev_invntt_inner_foldl range_geq.
        move => j r; split.
        * by move => _; rewrite -lerNgt subr_le0.
        move => Ncondj1 inv_j; rewrite opprD addrA -ltr_subr_addl /= oppr_lt0 expr_gt0 //=.
        move: inv_start; apply/HL_FOR_INT_ADD_LT.inv_in => _ /=. 
        rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //= expr_gt0 //=.
        move => ? <<- ? _; move: (IntID.mulIf (2 ^ (kl + 2)) _); [by apply/gtr_eqF/expr_gt0|].
        move => inj_ /inj_ {inj_} <<-; rewrite mulrDl //= => _.
        move: Ncondj1 inv_j; rewrite /inv_avx2_invntt_inner.
        pose R (_ : int) s :=
          Q_avx2_invntt_outer NTT_vars.zetas_inv{1} (2 ^ (kl + 1)) NTT_avx2.r{2} (ks + 1) (ks * 2 ^ (kl + 2) + 2 ^ (kl + 2)) s.
        apply/(HL_FOR_INT_ADD_LT.inv_out _ _ _ _ _ R) => //=; rewrite /R => {R} _ rr.
        rewrite -ler_subr_addl /= lerNgt expr_gt0 //= addrAC /= => ->.
        rewrite /Q_avx2_invntt_outer /r_bsrev_invntt_outer_foldl rangeSr.
        * by move: mem_ks_range; apply/mem_range_le.
        rewrite map_rcons foldl_rcons {2}/r_bsrev_invntt_outer.
        rewrite (exprSr_add_range _ _ _ mem_kl_range) //=.
        by rewrite mulzK //; apply/gtr_eqF/expr_gt0.
      wp; skip => &1 &2; rewrite {1}/inv_avx2_invntt => inv_len.
      move: (RHL_FOR_NAT_MUL_LE_INT_ADD_LT.invP _ _ _ _ _ _ _ _ _ _ _ _ inv_len); [by trivial|].
      move => and_; move: and_ inv_len => [<-] /= [kl] [/mem_range mem_kl_range] [->] [->] <-.
      rewrite (exprS_range _ _ _ mem_kl_range) //= => inv_len; split.
      - rewrite /inv_avx2_invntt_outer /HL_FOR_INT_ADD_LT.inv /=; split.
        * by move: inv_len; rewrite /P_avx2_invntt_outer; apply/RHL_FOR_NAT_MUL_LE_INT_ADD_LT.inv_context.
        rewrite (exprSr_add_range _ _ _ mem_kl_range) //=.
        rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //=.
        rewrite expr_gt0 //=; exists 0 => //=; rewrite expr_ge0 //=; rewrite /Q_avx2_invntt_outer.
        by rewrite /r_bsrev_invntt_outer_foldl range_geq.
      move => r1 start1; split; [by move => _; rewrite subr_le0 lerNgt|].
      rewrite /inv_avx2_invntt_outer /inv_avx2_invntt => Ncondstart1 inv_start.
      move: inv_len; apply/RHL_FOR_NAT_MUL_LE_INT_ADD_LT.inv_in => //=.
      move => _ ? <<- ? _ _ <<- /=.
      rewrite (exprS_range _ _ _ mem_kl_range) //=.
      rewrite (exprS_add_range _ _ _ mem_kl_range) //=.
      rewrite (exprSr_add_range _ _ _ mem_kl_range) //= => _.
      move: Ncondstart1 inv_start.
      pose R (_ : int) s :=
        Q_avx2_invntt (kl + 1) (2 ^ (kl + 2)) (kl + 1) (s, r_avx2_invntt NTT_vars.zetas_inv{1} NTT_vars.r{1} kl).
      apply/(HL_FOR_INT_ADD_LT.inv_out _ _ _ _ _ R) => //=; rewrite /R => {R} ? r.
      rewrite (exprSr_add_range _ _ _ mem_kl_range) //= expr_gt0 //=.
      rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //=.
      rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range) //=.
      move => ->; rewrite /Q_avx2_invntt /=; rewrite /r_avx2_invntt /r_bsrev_invntt.
      by rewrite (divz_pow_add_range _ _ _ mem_kl_range).
    skip => &1 &2 [<<- <<-].
    rewrite /inv_avx2_invntt; split.
    + by rewrite RHL_FOR_NAT_MUL_LE_INT_ADD_LT.inv_0.
    move => len1 r1 k2 r2 Ncondlen1 Ncondk2 inv_len.
    rewrite /inv_avx2_invntt_post; split.
    + apply/HL_FOR_INT_ADD_LT.inv_0 => //=; move: Ncondlen1 Ncondk2 inv_len.
      pose R (_ _ : int) (s : coeff Array256.t * coeff Array256.t) :=
        Q_avx2_invntt_post NTT_vars.zetas_inv{1} s.`2 0 0 s.`1.
      apply/(RHL_FOR_NAT_MUL_LE_INT_ADD_LT.inv_out _ _ _ _ _ _ _ _ _ R) => //=.
      move => _ {r1 r2} [r1 r2] <-; rewrite /R /Q_avx2_invntt_post /= => {R}.
      by rewrite /r_bsrev_invntt_post_foldl range_geq.
    move => j1 r; rewrite subr_le0 lerNgt /=.
    pose R (_ : int) (s : coeff Array256.t) :=
      s = r_avx2_invntt_post NTT_vars.zetas_inv{1} r2.
    by apply/(HL_FOR_INT_ADD_LT.inv_out _ _ _ _ _ R).
  qed.

  op partial_ntt (p : coeff Array256.t, len start bsj : int) =
    BAdd.bigi
      predT
      (fun s =>
        (exp zroot ((2 * start + 1) * bsrev 8 ((s %% len) * 2))) *
        p.[bsrev 8 (bsj * len + s)])
      0 len.

  op partial_ntt_spec (r p : coeff Array256.t, len start bsj : int) =
    r.[bsrev 8 (bsj * len + start)] = partial_ntt p len start bsj.

  (* The spec of the ntt only used in this file. *)
  op ntt_spec r p =
    forall start bsj ,
      start \in range 0 128 =>
      bsj \in range 0 2 =>
      partial_ntt_spec r p 128 start bsj.

  op P_naive_ntt zetas =
    zetas = NTT_Fq.zetas.

  op Q_naive_ntt p (_ : int) len s =
    forall start bsj ,
      start \in range 0 len =>
      bsj \in range 0 (256 %/ len) =>
      partial_ntt_spec s p len start bsj.

  op inv_naive_ntt zetas p =
    HL_FOR_NAT_MUL_LE.inv
    64 2 1
    ( P_naive_ntt zetas)
    ( Q_naive_ntt p ).

  op P_naive_ntt_outer zetas =
    HL_FOR_NAT_MUL_LE.context
    64 2 1
    ( P_naive_ntt zetas ).

  op Q_naive_ntt_outer p len (_ : int) start s =
    forall start' bsj ,
      start' \in range 0 len =>
      if start' < start
      then
        (bsj \in range 0 (128 %/ len) =>
         partial_ntt_spec s p (len * 2) start' bsj /\
         partial_ntt_spec s p (len * 2) (len + start') bsj)
      else
        (bsj \in range 0 (256 %/ len) =>
         partial_ntt_spec s p len start' bsj).

  op inv_naive_ntt_outer zetas p len =
    HL_FOR_INT_ADD_LT.inv
      len 1 0
      ( P_naive_ntt_outer zetas len )
      ( Q_naive_ntt_outer p len ).

  op P_naive_ntt_inner zetas len start zeta_ =
    HL_FOR_INT_ADD_LT.context
    len 1 0
    ( P_naive_ntt_outer zetas len ) start /\
    zeta_ = exp zroot ((start * 2 + 1) * (64 %/ len)).

  op Q_naive_ntt_inner p len start (_ : int) j s =
    forall start' bsj ,
      start' \in range 0 len =>
      if start' < start
      then
        (bsj \in range 0 (128 %/ len) =>
         partial_ntt_spec s p (len * 2) start' bsj /\
         partial_ntt_spec s p (len * 2) (len + start') bsj)
      else if start' = start
      then
        (bsj \in range 0 (128 %/ len) =>
         if bsj * (len * 2) < j
         then
           partial_ntt_spec s p (len * 2) start' bsj /\
           partial_ntt_spec s p (len * 2) (len + start') bsj
         else
           partial_ntt_spec s p len start' (bsj * 2) /\
           partial_ntt_spec s p len start' (bsj * 2 + 1) )
      else
        (bsj \in range 0 (256 %/ len) =>
         partial_ntt_spec s p len start' bsj).

  op inv_naive_ntt_inner zetas p len start zeta_ =
    HL_FOR_INT_ADD_LT.inv
      256 (len * 2) 0
      ( P_naive_ntt_inner zetas len start zeta_ )
      ( Q_naive_ntt_inner p len start ).

  lemma start_disj k start :
    k \in range 0 7 =>
    start \in range 0 (2 ^ (k + 1)) =>
    start =         start %% 2 ^ k \/
    start = 2 ^ k + start %% 2 ^ k.
  proof.
    move => mem_k_range; rewrite -(exprSr_range _ _ _ mem_k_range) //= -intmulz mulr2z.
    rewrite (range_cat (2 ^ k)) ?expr_ge0 //; [by rewrite ler_addl expr_ge0|].
    rewrite mem_cat; case => mem_start_range.
    + by left; rewrite modz_small // normrX; apply mem_range.
    right; rewrite addrC -subr_eq -(modz_small (start - 2 ^ k) (2 ^ k)).
    + by rewrite normrX; apply/mem_range/mem_range_subr.
    by rewrite dvdz_modzDr // dvdzN dvdzz.
  qed.

  lemma mem_add_bsj_start_range kl start bsj :
    kl \in range 0 7 =>
    start \in range 0 (2 ^ kl) =>
    bsj \in range 0 (2 ^ (8 - kl)) =>
    bsj * 2 ^ kl + start \in range 0 256.
  proof.
    move => mem_kl_range mem_start_range mem_bsj_range.
    rewrite mem_range_addr mem_range_mulr; [by rewrite expr_gt0|].
    move: mem_bsj_range; apply mem_range_incl.
    + rewrite lez_NdivNRL /=; [by rewrite expr_gt0|].
      by rewrite ler_oppl; move: mem_start_range; apply mem_range_le.
    rewrite opprD /= divzDl.
    + rewrite vp_le_pow_dvd // ler_norml /= le2_mem_range.
      by move: mem_kl_range; apply mem_range_incl.
    rewrite (divz_pow_range _ _ _ mem_kl_range) //= opprD mulNr /=.
    rewrite divz_small // -mem_range; move: mem_start_range; apply mem_range_incl => //.
    by rewrite normrX.
  qed.

  lemma neq_bsrev00 kl ks kj start bsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    start \in range 0 (2 ^ kl) =>
    bsj \in range 0 (2 ^ (7 - kl)) =>
    ks <> start \/ kj <> bsj =>
    bsrev 8 (bsj * 2 ^ (kl + 1) + start) <> bsrev 8 (kj * 2 ^ (kl + 1) + ks).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_start_range mem_bsj_range.
    move => /negb_and /negP or_neq; apply/negP => eq_br.
    move: (bsrev_injective _ _ _ _ _ _ eq_br) => //.
    + by apply/mem_add_j_start_range.
    + by apply/mem_add_j_start_range.
    move => eq_; move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_).
    + move: mem_start_range; apply mem_range_incl => //.
      rewrite -(exprSr_range _ _ _ mem_kl_range) //= -intmulz mulr2z.
      by rewrite ler_addl expr_ge0.
    + move: mem_ks_range; apply mem_range_incl => //.
      rewrite -(exprSr_range _ _ _ mem_kl_range) //= -intmulz mulr2z.
      by rewrite ler_addl expr_ge0.
    by rewrite eq_sym (eq_sym bsj).
  qed.

  lemma neq_bsrev01 kl ks kj start bsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    start \in range 0 (2 ^ kl) =>
    bsj \in range 0 (2 ^ (7 - kl)) =>
    bsrev 8 (bsj * 2 ^ (kl + 1) + start) <> bsrev 8 (kj * 2 ^ (kl + 1) + 2 ^ kl + ks).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_start_range mem_bsj_range.
    apply/negP => eq_br; move: (bsrev_injective _ _ _ _ _ _ eq_br) => //.
    + by apply/mem_add_j_start_range.
    + by apply/mem_add_j_len_start_range.
    move => eq_.
    have: ((bsj * 2 ^ (kl + 1) + start) %% 2 ^ (kl + 1) =
           (kj * 2 ^ (kl + 1) + 2 ^ kl + ks) %% 2 ^ (kl + 1))
    by rewrite eq_.
    rewrite -addrA !modzMDl modz_small.
    + apply/mem_range; rewrite normrX.
      move: mem_start_range; apply mem_range_incl => //.
      rewrite -(exprSr_range _ _ _ mem_kl_range) //= -intmulz mulr2z.
      by rewrite ler_addl expr_ge0.
    rewrite modz_small.
    + apply/mem_range; rewrite normrX mem_range_addl.
      move: mem_ks_range; apply mem_range_incl => //.
      - by rewrite /= oppr_le0 expr_ge0.
      rewrite -(exprSr_range _ _ _ mem_kl_range) //= -intmulz mulr2z.
      by rewrite -addrA.
    move => {eq_} eq_.
    have: (start %/ (2 ^ kl) = (2 ^ kl + ks) %/ (2 ^ kl)) by rewrite eq_.
    rewrite divz_small; [by apply mem_range; rewrite normrX|].
    rewrite -{1}(IntID.mul1r (2 ^ _)) divzMDl.
    + by rewrite gtr_eqF // expr_gt0.
    by rewrite divz_small //=; apply mem_range; rewrite normrX.
  qed.

  lemma neq_bsrev10 kl ks kj start bsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    start \in range 0 (2 ^ kl) =>
    bsj \in range 0 (2 ^ (7 - kl)) =>
    bsrev 8 (bsj * 2 ^ (kl + 1) + 2 ^ kl + start) <> bsrev 8 (kj * 2 ^ (kl + 1) + ks).
  proof. by move => ? ? ? ? ?; rewrite eq_sym; apply neq_bsrev01. qed.

  lemma neq_bsrev11 kl ks kj start bsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    start \in range 0 (2 ^ kl) =>
    bsj \in range 0 (2 ^ (7 - kl)) =>
    ks <> start \/ kj <> bsj =>
    bsrev 8 (bsj * 2 ^ (kl + 1) + 2 ^ kl + start) <> bsrev 8 (kj * 2 ^ (kl + 1) + 2 ^ kl + ks).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_start_range mem_bsj_range or_neq.
    apply/negP => eq_br; move: (bsrev_injective _ _ _ _ _ _ eq_br) => //.
    + by apply/mem_add_j_len_start_range.
    + by apply/mem_add_j_len_start_range.
    move => eq_.
    have: ((bsj * 2 ^ (kl + 1) + 2 ^ kl + start) %% 2 ^ (kl + 1) =
           (kj * 2 ^ (kl + 1) + 2 ^ kl + ks) %% 2 ^ (kl + 1))
    by rewrite eq_.
    rewrite -!addrA !modzMDl modz_small.
    + apply/mem_range; rewrite normrX mem_range_addl.
      move: mem_start_range; apply mem_range_incl => //.
      - by rewrite /= oppr_le0 expr_ge0.
      rewrite -(exprSr_range _ _ _ mem_kl_range) //= -intmulz mulr2z.
      by rewrite -addrA.
    rewrite modz_small.
    + apply/mem_range; rewrite normrX mem_range_addl.
      move: mem_ks_range; apply mem_range_incl => //.
      - by rewrite /= oppr_le0 expr_ge0.
      rewrite -(exprSr_range _ _ _ mem_kl_range) //= -intmulz mulr2z.
      by rewrite -addrA.
    move => /addzI ->>; rewrite /= in or_neq.
    have: ((bsj * 2 ^ (kl + 1) + 2 ^ kl + ks) %/ (2 ^ (kl + 1)) =
           (kj * 2 ^ (kl + 1) + 2 ^ kl + ks) %/ (2 ^ (kl + 1)))
    by rewrite eq_.
    rewrite -!addrA !divzMDl.
    + by rewrite gtr_eqF // expr_gt0.
    + by rewrite gtr_eqF // expr_gt0.
    rewrite divz_small.
    + apply/mem_range; rewrite normrX mem_range_addl.
      move: mem_ks_range; apply mem_range_incl => //.
      - by rewrite /= oppr_le0 expr_ge0.
      rewrite -(exprSr_range _ _ _ mem_kl_range) //= -intmulz mulr2z.
      by rewrite -addrA.
    by rewrite /= eq_sym.
  qed.

  lemma neq_bsrev0 kl ks kj start bsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    start \in range 0 (2 ^ kl) =>
    bsj \in range 0 (2 ^ (8 - kl)) =>
    ks <> start \/ kj * 2 <> bsj =>
    bsrev 8 (bsj * 2 ^ kl + start) <> bsrev 8 (kj * 2 ^ (kl + 1) + ks).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_start_range mem_bsj_range or_neq.
    apply/negP => eq_br; move: (bsrev_injective _ _ _ _ _ _ eq_br) => //.
    + by apply/mem_add_bsj_start_range.
    + by apply/mem_add_j_start_range.
    rewrite -(exprS_range _ _ _ mem_kl_range) //= mulrA.
    apply/negP => eq_.
    move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_) => //.
    by move => [->> ->>]; rewrite /= in or_neq.
  qed.

  lemma neq_bsrev1 kl ks kj start bsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    start \in range 0 (2 ^ kl) =>
    bsj \in range 0 (2 ^ (8 - kl)) =>
    ks <> start \/ kj * 2 + 1 <> bsj =>
    bsrev 8 (bsj * 2 ^ kl + start) <> bsrev 8 (kj * 2 ^ (kl + 1) + 2 ^ kl + ks).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_start_range mem_bsj_range or_neq.
    apply/negP => eq_br; move: (bsrev_injective _ _ _ _ _ _ eq_br) => //.
    + by apply/mem_add_bsj_start_range.
    + by apply/mem_add_j_len_start_range.
    rewrite -(exprS_range _ _ _ mem_kl_range) //= mulrA.
    rewrite -mulrSl; apply/negP => eq_.
    move: (inj_bs_drop_take _ _ _ _ _ _ _ eq_) => //.
    by move => [->> ->>]; rewrite /= in or_neq.
  qed.

  lemma partial_ntt_spec_pre_neq1 kl ks kj start bsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    start \in range 0 (2 ^ kl) =>
    bsj \in range 0 (2 ^ (7 - kl)) =>
    ks <> start \/ kj <> bsj =>
    partial_ntt_spec r p (2 ^ (kl + 1)) start bsj =>
    partial_ntt_spec r p (2 ^ (kl + 1)) (2 ^ kl + start) bsj =>
    partial_ntt_spec
      (set2_add_mulr r (exp zroot ((ks * 2 + 1) * 2 ^ (6 - kl)))
        (bsrev 8 (kj * 2 ^ (kl + 1) + ks))
        (bsrev 8 (kj * 2 ^ (kl + 1) + 2 ^ kl + ks)))
      p (2 ^ (kl + 1)) start bsj.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_start_range mem_bsj_range or_neq.
    rewrite /partial_ntt_spec => eq_r_1 eq_r_2.
    rewrite set2_add_mulr_neqiE //.
    + by apply neq_bsrev00.
    by apply neq_bsrev01.
  qed.

  lemma partial_ntt_spec_pre_neq2 kl ks kj start bsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    start \in range 0 (2 ^ kl) =>
    bsj \in range 0 (2 ^ (7 - kl)) =>
    ks <> start \/ kj <> bsj =>
    partial_ntt_spec r p (2 ^ (kl + 1)) start bsj =>
    partial_ntt_spec r p (2 ^ (kl + 1)) (2 ^ kl + start) bsj =>
    partial_ntt_spec
      (set2_add_mulr r (exp zroot ((ks * 2 + 1) * 2 ^ (6 - kl)))
        (bsrev 8 (kj * 2 ^ (kl + 1) + ks))
        (bsrev 8 (kj * 2 ^ (kl + 1) + 2 ^ kl + ks)))
      p (2 ^ (kl + 1)) (2 ^ kl + start) bsj.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_start_range mem_bsj_range or_neq.
    rewrite /partial_ntt_spec => eq_r_1 eq_r_2.
    rewrite set2_add_mulr_neqiE //.
    + by rewrite addrA; apply neq_bsrev10.
    by rewrite addrA; apply neq_bsrev11.
  qed.

  lemma partial_ntt_spec_eq1 kl ks kj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    partial_ntt_spec r p (2 ^ kl) ks (kj * 2) =>
    partial_ntt_spec r p (2 ^ kl) ks (kj * 2 + 1) =>
    partial_ntt_spec
      (set2_add_mulr r (exp zroot ((ks * 2 + 1) * 2 ^ (6 - kl)))
        (bsrev 8 (kj * 2 ^ (kl + 1) + ks))
        (bsrev 8 (kj * 2 ^ (kl + 1) + 2 ^ kl + ks)))
        p (2 ^ (kl + 1)) ks kj.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    rewrite /partial_ntt_spec => eq_r_1 eq_r_2.
    rewrite set2_add_mulr_eq1iE //.
    + by apply neq_bsrev01.
    + by apply/(bsrev_range 8).
    rewrite -mulrA {1}(exprS_range _ _ _ mem_kl_range) //= in eq_r_1.
    rewrite {1}mulrDl -mulrA (exprS_range _ _ _ mem_kl_range) //= in eq_r_2.
    rewrite eq_r_1 eq_r_2 /partial_ntt BAdd.mulr_sumr.
    pose f s:=
      exp zroot ((2 * ks + 1) * bsrev 8 (s %% 2 ^ (kl + 1) * 2)) *
      p.[bsrev 8 (kj * 2 ^ (kl + 1) + s)].
    pose g:= (+)%Int (2 ^ kl).
    rewrite {1}(BAdd.eq_big_int _ _ _ f).
    + rewrite /f => {f g} i /mem_range mem_i_range /=.
      rewrite -mulrA (exprS_range _ _ _ mem_kl_range) //=.
      rewrite modz_small; [by apply/mem_range; rewrite normrX|].
      rewrite modz_small //; apply/mem_range; rewrite normrX.
      move: mem_i_range; apply/mem_range_incl => //.
      rewrite -(exprSr_range _ _ _ mem_kl_range) //= -intmulz mulr2z.
      by rewrite ler_addl expr_ge0. print eq_sym.
    rewrite eq_sym ZqRing.addrC -(ZqRing.subr_eq) eq_sym (BAdd.big_cat_int (2 ^ kl) 0 (2 ^ (kl + 1))).
    + by rewrite expr_ge0.
    + rewrite -(exprSr_range _ _ _ mem_kl_range) //= -intmulz mulr2z.
      by rewrite ler_addl expr_ge0.
    rewrite ZqRing.addrAC /= ZqRing.subrr ZqRing.add0r (BAdd.eq_big_int _ _ _ (f \o g)).
    + rewrite /f /g => {f g} i /mem_range mem_i_range /=.
      rewrite (IntID.mulrC _ 2) ZqRing.mulrA -ZqRing.exprD.
      - by rewrite unit_zroot_ring.
      rewrite -mulrDr /(\o) /= addrA; congr; last first.
      - by rewrite mulrDl -mulrA /= (exprS_range _ _ _ mem_kl_range).
      congr; congr; rewrite modz_small //; [by rewrite normrX -mem_range|].
      rewrite modz_small.
      - rewrite normrX -(exprSr_range _ _ _ mem_kl_range) //=.
        rewrite -(intmulz (_ ^ _)%IntID) mulr2z; apply/mem_range/mem_range_addl.
        move: mem_i_range; apply/mem_range_incl => //=.
        * by rewrite oppr_le0 expr_ge0.
        by move: (ger0_def 2) => /=; move => ->; rewrite -addrA.
      rewrite mulrDl (exprSr_range _ _ _ mem_kl_range) //=.
      rewrite (IntID.addrC (_ ^ _)%IntID (_ * _)%Int) -(IntID.mulr1 (_ ^ (_ + 1)%Int)%IntID).
      rewrite bsrev_add //=.
      - by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply mem_range_incl.
      - rewrite mem_range_mulr //= -(exprSr_range _ _ _ mem_kl_range) //=.
        by rewrite -mulNr mulzK.
      by rewrite bsrev1 //= (divz_pow_add_range _ _ _ mem_kl_range) //= (IntID.addrC (bsrev _ _)).
    rewrite -BAdd.big_mapT /g => {g}; congr; rewrite -range_add /= -mulr2z intmulz.
    by rewrite (exprSr_range _ _ _ mem_kl_range).
  qed.

  lemma partial_ntt_spec_eq2 kl ks kj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    partial_ntt_spec r p (2 ^ kl) ks (kj * 2) =>
    partial_ntt_spec r p (2 ^ kl) ks (kj * 2 + 1) =>
    partial_ntt_spec
      (set2_add_mulr r (exp zroot ((ks * 2 + 1) * 2 ^ (6 - kl)))
      (bsrev 8 (kj * 2 ^ (kl + 1) + ks))
      (bsrev 8 (kj * 2 ^ (kl + 1) + 2 ^ kl + ks)))
      p (2 ^ (kl + 1)) (2 ^ kl + ks) kj.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range.
    rewrite /partial_ntt_spec => eq_r_1 eq_r_2.
    rewrite set2_add_mulr_eq2iE //.
    + by apply neq_bsrev01.
    + by apply/(bsrev_range 8).
    + by rewrite !addrA.
    rewrite -mulrA {1}(exprS_range _ _ _ mem_kl_range) //= in eq_r_1.
    rewrite {1}mulrDl -mulrA (exprS_range _ _ _ mem_kl_range) //= in eq_r_2.
    rewrite eq_r_1 eq_r_2 /partial_ntt BAdd.mulr_sumr.
    pose f s:=
      exp zroot ((2 * (2 ^ kl + ks) + 1) * bsrev 8 (s %% 2 ^ (kl + 1) * 2)) *
      p.[bsrev 8 (kj * 2 ^ (kl + 1) + s)].
    pose g:= (+)%Int (2 ^ kl).
    rewrite {1}(BAdd.eq_big_int _ _ _ f).
    + rewrite /f => {f g} i /mem_range mem_i_range /=.
      rewrite -mulrA (exprS_range _ _ _ mem_kl_range) //=.
      rewrite modz_small; [by apply/mem_range; rewrite normrX|].
      rewrite modz_small //.
      - apply/mem_range; rewrite normrX; move: mem_i_range; apply/mem_range_incl => //.
        rewrite -(exprSr_range _ _ _ mem_kl_range) //= -intmulz mulr2z.
        by rewrite ler_addl expr_ge0.
      rewrite mulrDr (exprS_range _ _ _ mem_kl_range) //= -addrA.
      rewrite (IntID.mulrDl (_ ^ _)%IntID) ZqRing.exprD ?unit_zroot_ring //.
      rewrite -ZqRing.mulrA -{1}(ZqRing.mul1r (_ * _.[_]%Array256)%Zq); congr; rewrite eq_sym.
      rewrite exp_zroot_ring; pose m:= (_ * bsrev _ _).
      move: (dvdzE 256 m) => [-> //=]; [rewrite /m => {m}|by move => _; rewrite /q].
      move: (dvdz_mul (2 ^ (kl + 1)) (2 ^ (7 - kl)) (2 ^ (kl + 1)) (bsrev 8 (i * 2)) _ _).
      - by rewrite dvdzz.
      - rewrite bsrev_range_dvdz //=.
        * by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
        rewrite opprD /= addrC mem_range_mulr //=.
        rewrite -(exprSr_range _ _ _ mem_kl_range) //=.
        by rewrite -mulNr mulzK.
      by rewrite (exprD_nneg_add_sub_range _ _ _ mem_kl_range).
    rewrite eq_sym ZqRing.addrC -ZqRing.subr_eq eq_sym (BAdd.big_cat_int (2 ^ kl) 0 (2 ^ (kl + 1))).
    + by rewrite expr_ge0.
    + rewrite -(exprSr_range _ _ _ mem_kl_range) //= -intmulz mulr2z.
      by rewrite ler_addl expr_ge0.
    rewrite ZqRing.addrAC /= ZqRing.subrr ZqRing.add0r BAdd.sumrN (BAdd.eq_big_int _ _ _ (f \o g)).
    + rewrite /f /g => {f g} i /mem_range mem_i_range /=.
      rewrite (IntID.mulrC _ 2) ZqRing.mulrA -ZqRing.exprD.
      - by rewrite unit_zroot_ring.
      rewrite -mulrDr /(\o) /= addrA -ZqRing.mulN1r -incoeffN -exp_zroot_128_ring.
      rewrite ZqRing.mulrA -ZqRing.exprD; [by rewrite unit_zroot_ring|].
      congr; last first.
      - by rewrite mulrDl -mulrA /= (exprS_range _ _ _ mem_kl_range).
      rewrite modz_small //; [by rewrite normrX -mem_range|].
      rewrite modz_small.
      - rewrite normrX -(exprSr_range _ _ _ mem_kl_range) //=.
        rewrite -(intmulz (_ ^ _)%IntID) mulr2z; apply/mem_range/mem_range_addl.
        move: mem_i_range; apply/mem_range_incl => //=.
        * by rewrite oppr_le0 expr_ge0.
        by move: (ger0_def 2) => /=; move => ->; rewrite -addrA.
      rewrite (IntID.mulrDr 2) (IntID.mulrDl _ _ 2).
      rewrite (exprS_range _ _ _ mem_kl_range) //= (exprSr_range _ _ _ mem_kl_range) //=.
      rewrite (IntID.addrC _ (_ * 2)) -{2}(IntID.mulr1 (_ ^ (_ + 1))%IntID).
      rewrite bsrev_add //=.
      - by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply mem_range_incl.
      - rewrite mem_range_mulr //= -(exprSr_range _ _ _ mem_kl_range) //=.
        by rewrite -mulNr mulzK.
      rewrite bsrev1 //= (divz_pow_add_range _ _ _ mem_kl_range) //=.
      rewrite (IntID.addrC (bsrev _ _)) -addrA (IntID.mulrDl (2 ^ _) (_ * _ + _)%Int).
      rewrite ZqRing.exprD; [by rewrite unit_zroot_ring|].
      rewrite ZqRing.exprD; [by rewrite unit_zroot_ring|]; congr.
      rewrite mulrDr ZqRing.exprD; [by rewrite unit_zroot_ring|].
      rewrite (exprD_nneg_add_sub_range _ _ _ mem_kl_range) //=.
      rewrite -{1}(ZqRing.mulr1 (ZqRing.exp _ _)); congr; rewrite eq_sym.
      rewrite (exp_mod _ _ 256); [by rewrite exp_zroot_256|].
      move: (dvdzE 256 (2 ^ (kl + 1) * bsrev 8 (i * 2))) => [->]; [|by rewrite ZqField.expr0].
      move: (dvdz_mul (2 ^ (kl + 1)) (2 ^ (7 - kl)) (2 ^ (kl + 1)) (bsrev 8 (i * 2)) _ _).
      - by rewrite dvdzz.
      - rewrite bsrev_range_dvdz //=.
        * by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply mem_range_incl.
        rewrite opprD /= addrC mem_range_mulr //=.
        rewrite -(exprSr_range _ _ _ mem_kl_range) //=.
        by rewrite -mulNr mulzK.
      by rewrite (exprD_nneg_add_sub_range _ _ _ mem_kl_range).
    rewrite -BAdd.big_mapT /g => {g}; congr; rewrite -range_add /= -mulr2z intmulz.
    by rewrite (exprSr_range _ _ _ mem_kl_range).
  qed.

  lemma partial_ntt_spec_post_neq1 kl ks kj bsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    bsj \in range 0 (2 ^ (7 - kl)) =>
    kj <> bsj =>
    partial_ntt_spec r p (2 ^ kl) ks (bsj * 2) =>
    partial_ntt_spec r p (2 ^ kl) ks (bsj * 2 + 1) =>
    partial_ntt_spec
      (set2_add_mulr r (exp zroot ((ks * 2 + 1) * 2 ^ (6 - kl)))
        (bsrev 8 (kj * 2 ^ (kl + 1) + ks))
        (bsrev 8 (kj * 2 ^ (kl + 1) + 2 ^ kl + ks)))
        p (2 ^ kl) ks (bsj * 2).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_bsj_range neq.
    rewrite /partial_ntt_spec => eq_r_1 eq_r_2.
    rewrite set2_add_mulr_neqiE //.
    + by rewrite -mulrA (exprS_range _ _ _ mem_kl_range) //=; apply neq_bsrev00.
    by rewrite -mulrA (exprS_range _ _ _ mem_kl_range) //=; apply neq_bsrev01.
  qed.

  lemma partial_ntt_spec_post_neq2 kl ks kj bsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    bsj \in range 0 (2 ^ (7 - kl)) =>
    kj <> bsj =>
    partial_ntt_spec r p (2 ^ kl) ks (bsj * 2) =>
    partial_ntt_spec r p (2 ^ kl) ks (bsj * 2 + 1) =>
    partial_ntt_spec
      (set2_add_mulr r (exp zroot ((ks * 2 + 1) * 2 ^ (6 - kl)))
        (bsrev 8 (kj * 2 ^ (kl + 1) + ks))
        (bsrev 8 (kj * 2 ^ (kl + 1) + 2 ^ kl + ks)))
        p (2 ^ kl) ks (bsj * 2 + 1).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_bsj_range neq.
    rewrite /partial_ntt_spec => eq_r_1 eq_r_2.
    rewrite set2_add_mulr_neqiE //.
    + by rewrite mulrDl -mulrA (exprS_range _ _ _ mem_kl_range) //=; apply neq_bsrev10.
    by rewrite mulrDl -mulrA (exprS_range _ _ _ mem_kl_range) //=; apply neq_bsrev11.
  qed.

  lemma partial_ntt_spec_post_neq kl ks kj start bsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ kl) =>
    kj \in range 0 (2 ^ (7 - kl)) =>
    start \in range 0 (2 ^ kl) =>
    bsj \in range 0 (2 ^ (8 - kl)) =>
    ks <> start \/ ((kj * 2) <> bsj /\ (kj * 2 + 1) <> bsj) =>
    partial_ntt_spec r p (2 ^ kl) start bsj =>
    partial_ntt_spec
      (set2_add_mulr r (exp zroot ((ks * 2 + 1) * 2 ^ (6 - kl)))
        (bsrev 8 (kj * 2 ^ (kl + 1) + ks))
        (bsrev 8 (kj * 2 ^ (kl + 1) + 2 ^ kl + ks))) p (2 ^ kl) start bsj.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_start_range mem_bsj_range or_neq.
    rewrite /partial_ntt_spec => eq_r.
    rewrite set2_add_mulr_neqiE //.
    + by apply neq_bsrev0 => //; case: or_neq => [?|[? _]]; [left|right].
    by apply neq_bsrev1 => //; case: or_neq => [?|[_ ?]]; [left|right].
  qed.

  hoare naive_ntt_inner p :
    NTT_naive.ntt_inner:
      inv_naive_ntt_outer NTT_vars.zetas p NTT_vars.len NTT_vars.start NTT_vars.r /\
      NTT_vars.start < NTT_vars.len ==>
      inv_naive_ntt_outer NTT_vars.zetas p NTT_vars.len NTT_vars.start NTT_vars.r.
  proof.
    proc; wp.
    while (
      inv_naive_ntt_inner
        NTT_vars.zetas p NTT_vars.len NTT_vars.start NTT_vars.zeta_ NTT_vars.j NTT_vars.r);
    wp.
    + skip => &m /=; rewrite /inv_naive_ntt_inner; apply/HL_FOR_INT_ADD_LT.inv_in.
      move => [] [] [_] /= [kl] [/mem_range mem_kl_range] ->>.
      move => [ks] [/mem_range mem_ks_range] ->> ->>.
      rewrite (exprSr_range _ _ _ mem_kl_range) //= expr_gt0 //=.
      rewrite (NdivzN_pow_add_range _ _ _ mem_kl_range) //= => ? <<- kj mem_kj_range ->>.
      rewrite mulrDl /= => Q_ start bsj mem_start_range.
      move: (Q_ start) => {Q_}; rewrite mem_start_range /=.
      rewrite (exprSr_range _ _ _ mem_kl_range) //=.
      rewrite !(divz_pow_range _ _ _ mem_kl_range) //=.
      rewrite lerNgt expr_gt0 //= in mem_ks_range.
      case: (start < ks) => [lt_start_ks|Nlt_start_ks].
      - move => /(_ bsj) Q_ mem_bsj_range; move: Q_ => /(_ _) // [? ?].
        rewrite partial_ntt_spec_pre_neq1 //; [by left; rewrite gtr_eqF|].
        by rewrite partial_ntt_spec_pre_neq2 //; left; rewrite gtr_eqF.
      case: (start = ks) => [->>|neq_start_ks].
      - move => /(_ bsj) Q_ mem_bsj_range; move: Q_ => /(_ _) //.
        rewrite -mulrSl; do 2!(rewrite ltr_pmul2r ?expr_gt0 //).
        rewrite ltzS ler_eqVlt; case: (bsj < kj) => [lt_bsj_kj|Nlt_bsj_kj] /=.
        * move => [? ?]; rewrite partial_ntt_spec_pre_neq1 //; [by right; rewrite gtr_eqF|].
          by rewrite partial_ntt_spec_pre_neq2 //; right; rewrite gtr_eqF.
        case: (bsj = kj) => [->>|neq_bsj_kj] /=.
        * by move => [? ?]; rewrite partial_ntt_spec_eq1 // partial_ntt_spec_eq2.
        move => [? ?]; rewrite partial_ntt_spec_post_neq1 //; [by rewrite eq_sym|].
        by rewrite partial_ntt_spec_post_neq2 //; rewrite eq_sym.
      move => /(_ bsj) Q_ mem_bsj_range; move: Q_ => /(_ _) // ?.
      by rewrite partial_ntt_spec_post_neq //; left; rewrite eq_sym.
    skip => &m; rewrite /inv_naive_ntt_outer /inv_naive_ntt_inner => inv_; split.
    + apply/HL_FOR_INT_ADD_LT.inv_0 => //; [split|].
      - by move: inv_; rewrite /P_naive_ntt_inner; apply/HL_FOR_INT_ADD_LT.inv_context.
      - case/HL_FOR_INT_ADD_LT.invP: inv_ => -[->] /= [kl].
        move => [/mem_range mem_kl_range ->] [ks]; rewrite (lerNgt (2 ^ _)) expr_gt0 //=.
        move => [/mem_range mem_ks_range [-> _]].
        rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
        rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
        move: (exprSr_sub_range _ _ _ mem_kl_range 2 6) => <- //.
        rewrite mulrA (IntID.mulrC _ 2) -{1}(IntID.expr1 2) bsrev_mulr_pow2 //=.
        rewrite /NTT_Fq.zetas Array128.initiE /=.
        * apply/mem_range/range_div_range => //=; have ->: 256 = 2 ^ 8 by trivial.
          by apply/bsrev_range.
        rewrite divzK.
        * rewrite -{1}IntID.expr1; apply/bsrev_range_dvdz => //=.
          rewrite mem_range_mulr ?expr_gt0 //=.
          rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
          rewrite mem_range_addr mem_range_mulr //= opprD /= (IntID.addrC _ 1).
          by rewrite -(exprSr_range _ _ _ mem_kl_range) //= -mulNr divzMDr.
        rewrite bsrev_involutive //.
        rewrite mem_range_mulr ?expr_gt0 //=.
        rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
        rewrite mem_range_addr mem_range_mulr //= opprD /= (IntID.addrC _ 1).
        rewrite -(exprSr_add_range _ _ _ mem_kl_range 2 1) //= -mulNr divzMDr //=.
        move: mem_ks_range; apply/mem_range_incl => //.
        rewrite -(exprS_range _ _ _ mem_kl_range) //= -subr_ge0.
        by rewrite -mulN1r -mulrDl /= expr_ge0.
      move: inv_ => /HL_FOR_INT_ADD_LT.invP [[_]] [kl] /= [/mem_range mem_kl_range] ->>.
      rewrite lerNgt expr_gt0 //; move => /= [ks] [/mem_range mem_ks_range] [->>].
      move => Q_ start bsj mem_start_range; move: (Q_ start (bsj * 2 + 1) _) => //.
      move: (Q_ start (bsj * 2) _) => //; move: Q_ => /(_ start bsj _) //.
      rewrite (exprSr_range _ _ _ mem_kl_range) //=.
      rewrite !(divz_pow_range _ _ _ mem_kl_range) //=.
      case: (start < ks) => //= _; case: (start = ks) => //= _.
      move => _ Q_0 Q_1 mem_bsj_range; rewrite ltrNge mulr_ge0 ?expr_ge0 //=.
      - by move: mem_bsj_range; apply mem_range_le.
      rewrite Q_0; [apply/mem_range_mulr|] => //=.
      - move: mem_bsj_range; apply mem_range_incl => //.
        move: (IntID.exprSr 2 (7 - kl) _).
        * by rewrite subr_ge0; move: mem_kl_range; apply mem_range_ge.
        by rewrite addrAC /= => ->; rewrite -mulNr mulzK //=.
      rewrite Q_1; apply/mem_range_addr/mem_range_mulr => //=.
      move: mem_bsj_range; apply mem_range_incl => //.
      move: (IntID.exprSr 2 (7 - kl) _).
      - by rewrite subr_ge0; move: mem_kl_range; apply mem_range_ge.
      by rewrite addrAC /= => ->; rewrite opprD /= -mulNr divzMDl.
    apply/HL_FOR_INT_ADD_LT.inv_out => /=; move => [[[-> _] _] eq_zetas] r; move: inv_.
    move => /HL_FOR_INT_ADD_LT.invP [] [_] /= [kl] /= [/mem_range mem_kl_range] ->>.
    rewrite lerNgt expr_gt0 //; move => /= [ks] [/mem_range mem_ks_range] [->>].
    rewrite (exprSr_range _ _ _ mem_kl_range) //= expr_gt0 //=.
    rewrite (divz_pow_add_range _ _ _ mem_kl_range) //= !mulNr /=.
    move => _ [_] Q_; split => /=; [by exists kl => //=; apply/mem_range|].
    exists (ks + 1); rewrite le2_mem_range /= lerNgt expr_gt0 //=; split.
    + by apply/mem_range_addr; move: mem_ks_range; apply mem_range_incl.
    move => start bsj mem_start_range.
    rewrite (exprSr_range _ _ _ mem_kl_range) //=.
    rewrite !(divz_pow_range _ _ _ mem_kl_range) //=.
    move: Q_ => /(_ start bsj _) //; rewrite ltzS ler_eqVlt.
    rewrite (exprSr_range _ _ _ mem_kl_range) //=.
    rewrite !(divz_pow_range _ _ _ mem_kl_range) //=.
    case: (start < ks) => //= _; case: (start = ks) => //= ->>.
    rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range) //=.
    rewrite -ltz_divRL ?expr_gt0 //.
    + rewrite vp_le_pow_dvd // ler_norml /= le2_mem_range.
      by rewrite mem_range_addr; move: mem_kl_range; apply mem_range_incl.
    rewrite (divz_pow_add_range _ _ _ mem_kl_range) //=.
    move => Q_ mem_bsj_range; move: Q_ => /(_ _) //.
    by move: mem_bsj_range => /mem_range [_ ->].
  qed.

  hoare naive_ntt_outer p :
    NTT_naive.ntt_outer:
      inv_naive_ntt NTT_vars.zetas p NTT_vars.len NTT_vars.r /\ NTT_vars.len <= 64 ==>
      inv_naive_ntt NTT_vars.zetas p NTT_vars.len NTT_vars.r.
  proof.
    proc; wp.
    while (inv_naive_ntt_outer NTT_vars.zetas p NTT_vars.len NTT_vars.start NTT_vars.r); wp.
    + by call (naive_ntt_inner p).
    skip => &m; rewrite /inv_naive_ntt /inv_naive_ntt_outer => inv_; split.
    + apply/HL_FOR_INT_ADD_LT.inv_0 => //.
      - by move: inv_; rewrite /P_naive_ntt; apply/HL_FOR_NAT_MUL_LE.inv_context.
      move: inv_ => /HL_FOR_NAT_MUL_LE.invP [_] /= [k] [/mem_range mem_k_range] [->>].
      move => Q_ start bsj mem_start_range; rewrite ltrNge.
      rewrite (mem_range_le _ _ _ _ _ mem_start_range) //= => mem_bsj_range.
      by rewrite Q_.
    move => r start; move: start r; apply/HL_FOR_INT_ADD_LT.inv_out => /=.
    move => _ r [_]; move: inv_.
    pose R len s:=
      Q_naive_ntt_outer p len
        (if len <= 0 then 0 else len)
        (if len <= 0 then 0 else len) s.
    apply/(HL_FOR_NAT_MUL_LE.inv_in_outerloop _ _ _ _ _ R) => //=.
    move => _ ? <<- k mem_k_range ->>; rewrite /R => {R} //=.
    rewrite (exprSr_range _ _ _ mem_k_range) //= lerNgt expr_gt0 //=.
    move => _ Q_ start bsj mem_start_range mem_bsj_range.
    rewrite (divz_pow_add_range _ _ _ mem_k_range) //= in mem_bsj_range.
    move: (Q_ (start %% (2 ^ k)) bsj _).
    + by move: (mem_range_mod start (2 ^ k)); rewrite gtr_eqF // ?expr_gt0 //= normrX.
    rewrite ltz_pmod ?expr_gt0 //= (exprSr_range _ _ _ mem_k_range) //=.
    rewrite (divz_pow_range _ _ _ mem_k_range) //= => /(_ _) // [].
    by case: (start_disj k start _ _) => // [<-|<-].
  qed.

  hoare naive_ntt (p : coeff Array256.t) :
    NTT_naive.ntt :
      NTT_vars.zetas = NTT_Fq.zetas /\
      NTT_vars.r = p ==>
      ntt_spec res p.
  proof.
    proc.
    while (inv_naive_ntt NTT_vars.zetas p NTT_vars.len NTT_vars.r); wp.
    + by call (naive_ntt_outer p).
    skip => &m [->> <<-]; split.
    + rewrite /inv_naive_ntt; apply/HL_FOR_NAT_MUL_LE.inv_0 => //.
      move => start bsj /=; rewrite range_ltn // range_geq //= => ->>.
      move => mem_bsj_range; rewrite /partial_ntt_spec /partial_ntt /=.
      rewrite range_ltn // range_geq //= BAdd.big_consT BAdd.big_nil /=.
      by rewrite ZqRing.addr0 bsrev0 ZqRing.expr0 ZqRing.mul1r.
    apply/HL_FOR_NAT_MUL_LE.inv_out => _ r /= Q_ start bsj mem_start_range mem_bsj_range.
    by rewrite Q_.
  qed.

  op partial_invntt (p : coeff Array256.t, len start lbsj hbsj : int) =
    let len' = if 0 < len then len * 2 else 1 in
    BAdd.bigi
      predT
      (fun lb =>
        exp zroot (- ((lb * len' + start) * 2 + 1) * bsrev 8 ((lbsj * len') * 2)) *
        p.[bsrev 8 (hbsj * 128 + lb * len' + start)])
      0 (128 %/ len').

  op partial_invntt_spec (r p : coeff Array256.t, len start lbsj hbsj : int) =
    let len' = if 0 < len then len * 2 else 1 in
    r.[bsrev 8 (hbsj * 128 + lbsj * len' + start)] = partial_invntt p len start lbsj hbsj.

(* The spec of the invntt only used in this file. *)
  op invntt_spec (r p : coeff Array256.t) =
    forall lbsj hbsj ,
      lbsj \in range 0 128 =>
      hbsj \in range 0 2 =>
      r.[bsrev 8 (hbsj * 128 + lbsj)] = (partial_invntt p 0 0 lbsj hbsj) * NTT_Fq.scale127.

  op P_naive_invntt zetas_inv =
    zetas_inv = NTT_Fq.zetas_inv.

  op Q_naive_invntt p (_ : int) len s =
    let len' = if 0 < len then len * 2 else 1 in
    forall hbsj start lbsj,
      hbsj \in range 0 2 =>
      start \in range 0 len' =>
      lbsj \in range 0 (128 %/ len') =>
      partial_invntt_spec s p len start lbsj hbsj.

  op inv_naive_invntt zetas_inv p =
    HL_FOR_NAT_DIV_GE.inv
    1 2 64
    ( P_naive_invntt zetas_inv )
    ( Q_naive_invntt p ).

  op P_naive_invntt_post zetas_inv =
    zetas_inv = NTT_Fq.zetas_inv.

  op Q_naive_invntt_post (p : coeff Array256.t) (_ : int) j (s : coeff Array256.t) =
    forall bsj ,
      bsj \in range 0 256 =>
      s.[bsrev 8 bsj] =
      p.[bsrev 8 bsj] *
      if bsj \in range 0 j
      then NTT_Fq.scale127
      else Zq.one.

  op inv_naive_invntt_post zetas_inv p =
    HL_FOR_INT_ADD_LT.inv
    256 1 0
    ( P_naive_invntt_post zetas_inv )
    ( Q_naive_invntt_post p ).

  op P_naive_invntt_outer zetas_inv =
    HL_FOR_NAT_DIV_GE.context
    1 2 64
    ( P_naive_invntt zetas_inv ).

  op Q_naive_invntt_outer p len (_ : int) start s =
    forall hbsj start' lbsj ,
      hbsj \in range 0 2 =>
      start' \in range 0 len =>
      if start' < start
      then
        (lbsj \in range 0 (128 %/ len) =>
         partial_invntt_spec s p (len %/ 2) start' lbsj hbsj)
      else
        (lbsj \in range 0 (64 %/ len) =>
         partial_invntt_spec s p len start' lbsj hbsj /\
         partial_invntt_spec s p len (len + start') lbsj hbsj).

  op inv_naive_invntt_outer zetas_inv p len =
    HL_FOR_INT_ADD_LT.inv
      len 1 0
      ( P_naive_invntt_outer zetas_inv len )
      ( Q_naive_invntt_outer p len ).

  op P_naive_invntt_inner zetas_inv len start zeta_ =
    HL_FOR_INT_ADD_LT.context
    len 1 0
    ( P_naive_invntt_outer zetas_inv len ) start /\
    zeta_ = exp zroot (- (start * 2 + 1) * (64 %/ len)).

  op Q_naive_invntt_inner p len start (_ : int) j s =
    forall hbsj start' lbsj ,
      hbsj \in range 0 2 =>
      start' \in range 0 len =>
      if start' < start
      then
        (lbsj \in range 0 (128 %/ len) =>
         partial_invntt_spec s p (len %/ 2) start' lbsj hbsj)
      else if start' = start
      then
        (lbsj \in range 0 (64 %/ len) =>
         if hbsj * 128 + lbsj * (len * 2) < j
         then
           partial_invntt_spec s p (len %/ 2) start' (lbsj * 2) hbsj /\
           partial_invntt_spec s p (len %/ 2) start' (lbsj * 2 + 1) hbsj
         else
           partial_invntt_spec s p len start' lbsj hbsj /\
           partial_invntt_spec s p len (len + start') lbsj hbsj )
      else
        (lbsj \in range 0 (64 %/ len) =>
         partial_invntt_spec s p len start' lbsj hbsj /\
         partial_invntt_spec s p len (len + start') lbsj hbsj).

  op inv_naive_invntt_inner zetas_inv p len start zeta_ =
    HL_FOR_INT_ADD_LT.inv
      256 (len * 2) 0
      ( P_naive_invntt_inner zetas_inv len start zeta_ )
      ( Q_naive_invntt_inner p len start ).

  lemma bsj_disj bsj :
    bsj = bsj %/ 2 * 2 \/
    bsj = bsj %/ 2 * 2 + 1.
  proof.
    move: (mem_range_mod bsj 2); rewrite /= 2?range_ltn //= range_geq //=.
    by rewrite {3 5}(divz_eq bsj 2); case => ->.
  qed.

  lemma pow_if k :
    k \in range 0 7 =>
    (if 0 < 2 ^ (6 - k) %/ 2 then 2 ^ (6 - k) %/ 2 * 2 else 1) =
    2 ^ (6 - k).
  proof.
    rewrite (rangeSr 0 6) //= mem_rcons /=; case => [->> //=|mem_k_range].
    rewrite (pow_div1_sub_range _ _ _ mem_k_range) //= expr_gt0 //=.
    by rewrite (exprSr_sub_range _ _ _ mem_k_range).
  qed.

  lemma invntt_neq_bsrev00 kl ks kj hbsj start lbsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    hbsj \in range 0 2 =>
    start \in range 0 (2 ^ (6 - kl)) =>
    lbsj \in range 0 (2 ^ kl) =>
    ks <> start \/ kj <> hbsj * 2 ^ kl + lbsj =>
    bsrev 8 (hbsj * 128 + lbsj * 2 ^ (7 - kl) + start) <>
    bsrev 8 (kj * 2 ^ (7 - kl) + ks).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_hbsj_range mem_start_range mem_lbsj_range or_neq.
    move: (neq_bsrev00 (6 - kl) ks kj start (hbsj * 2 ^ kl + lbsj) _ _ _ _ _ _) => //.
    + by apply mem_range_subl.
    + by rewrite opprD /= addrC.
    + rewrite opprD /= addrC (IntID.addrC _ lbsj) mulrC.
      move: (mem_range_add_mul _ _ _ _ _ mem_lbsj_range mem_hbsj_range).
      by apply/mem_range_incl => //=; rewrite (exprS_range _ _ _ mem_kl_range).
    by rewrite addrAC /= mulrDl -mulrA (exprD_nneg_sub_range _ _ _ mem_kl_range).
  qed.

  lemma invntt_neq_bsrev01 kl ks kj hbsj start lbsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    hbsj \in range 0 2 =>
    start \in range 0 (2 ^ (6 - kl)) =>
    lbsj \in range 0 (2 ^ kl) =>
    bsrev 8 (hbsj * 128 + lbsj * 2 ^ (7 - kl) + start) <>
    bsrev 8 (kj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + ks).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_hbsj_range mem_start_range mem_lbsj_range.
    move: (neq_bsrev01 (6 - kl) ks kj start (hbsj * 2 ^ kl + lbsj) _ _ _ _ _) => //.
    + by apply mem_range_subl.
    + by rewrite opprD /= addrC.
    + rewrite opprD /= addrC (IntID.addrC _ lbsj) mulrC.
      move: (mem_range_add_mul _ _ _ _ _ mem_lbsj_range mem_hbsj_range).
      by apply/mem_range_incl => //=; rewrite (exprS_range _ _ _ mem_kl_range).
    by rewrite addrAC /= mulrDl -mulrA (exprD_nneg_sub_range _ _ _ mem_kl_range).
  qed.

  lemma invntt_neq_bsrev10 kl ks kj hbsj start lbsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    hbsj \in range 0 2 =>
    start \in range 0 (2 ^ (6 - kl)) =>
    lbsj \in range 0 (2 ^ kl) =>
    bsrev 8 (hbsj * 128 + lbsj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + start) <>
    bsrev 8 (kj * 2 ^ (7 - kl) + ks).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_hbsj_range mem_start_range mem_lbsj_range.
    move: (neq_bsrev10 (6 - kl) ks kj start (hbsj * 2 ^ kl + lbsj) _ _ _ _ _) => //.
    + by apply mem_range_subl.
    + by rewrite opprD /= addrC.
    + rewrite opprD /= addrC (IntID.addrC _ lbsj) mulrC.
      move: (mem_range_add_mul _ _ _ _ _ mem_lbsj_range mem_hbsj_range).
      by apply/mem_range_incl => //=; rewrite (exprS_range _ _ _ mem_kl_range).
    by rewrite addrAC /= mulrDl -mulrA (exprD_nneg_sub_range _ _ _ mem_kl_range) //= addrAC.
  qed.

  lemma invntt_neq_bsrev kl hbsj start lbsj :
    kl \in range 0 7 =>
    hbsj \in range 0 2 =>
    start \in range 0 (2 ^ (6 - kl)) =>
    lbsj \in range 0 (2 ^ kl) =>
    bsrev 8 (hbsj * 128 + lbsj * 2 ^ (7 - kl) + start) <>
    bsrev 8 (hbsj * 128 + lbsj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + start).
  proof.
    move => mem_kl_range mem_hbsj_range mem_start_range mem_lbsj_range.
    move: (invntt_neq_bsrev01 kl start (hbsj * 2 ^ kl + lbsj) hbsj start lbsj _ _ _ _ _ _) => //.
    + rewrite (IntID.addrC _ lbsj) mulrC.
      move: (mem_range_add_mul _ _ _ _ _ mem_lbsj_range mem_hbsj_range).
      by apply/mem_range_incl => //=; rewrite (exprS_range _ _ _ mem_kl_range).
    by rewrite mulrDl -mulrA (exprD_nneg_sub_range _ _ _ mem_kl_range).
  qed.

  lemma invntt_neq_bsrev11 kl ks kj hbsj start lbsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    hbsj \in range 0 2 =>
    start \in range 0 (2 ^ (6 - kl)) =>
    lbsj \in range 0 (2 ^ kl) =>
    ks <> start \/ kj <> hbsj * 2 ^ kl + lbsj =>
    bsrev 8 (hbsj * 128 + lbsj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + start) <>
    bsrev 8 (kj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + ks).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_hbsj_range mem_start_range mem_lbsj_range or_neq.
    move: (neq_bsrev11 (6 - kl) ks kj start (hbsj * 2 ^ kl + lbsj) _ _ _ _ _ _) => //.
    + by apply mem_range_subl.
    + by rewrite opprD /= addrC.
    + rewrite opprD /= addrC (IntID.addrC _ lbsj) mulrC.
      move: (mem_range_add_mul _ _ _ _ _ mem_lbsj_range mem_hbsj_range).
      by apply/mem_range_incl => //=; rewrite (exprS_range _ _ _ mem_kl_range).
    by rewrite addrAC /= mulrDl -mulrA (exprD_nneg_sub_range _ _ _ mem_kl_range) //= addrAC.
  qed.

  lemma invntt_neq_bsrev0 kl ks kj hbsj start lbsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    hbsj \in range 0 2 =>
    start \in range 0 (2 ^ (6 - kl)) =>
    lbsj \in range 0 (2 ^ (kl + 1)) =>
    ks <> start \/ kj * 2 <> hbsj * 2 ^ (kl + 1) + lbsj =>
    bsrev 8 (hbsj * 128 + lbsj * 2 ^ (6 - kl) + start) <>
    bsrev 8 (kj * 2 ^ (7 - kl) + ks).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_hbsj_range mem_start_range mem_lbsj_range or_neq.
    move: (neq_bsrev0 (6 - kl) ks kj start (hbsj * 2 ^ (kl + 1) + lbsj) _ _ _ _ _ _) => //.
    + by rewrite mem_range_subl.
    + by rewrite opprD /= addrC.
    + rewrite opprD /= (IntID.addrC 2) mulrC (IntID.addrC _ lbsj).
      move: (mem_range_add_mul _ _ _ _ _ mem_lbsj_range mem_hbsj_range) => /=.
      by rewrite (exprS_add_range _ _ _ mem_kl_range).
    by rewrite mulrDl -mulrA (exprD_nneg_add_sub_range _ _ _ mem_kl_range).
  qed.

  lemma invntt_neq_bsrev1 kl ks kj hbsj start lbsj :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    hbsj \in range 0 2 =>
    start \in range 0 (2 ^ (6 - kl)) =>
    lbsj \in range 0 (2 ^ (kl + 1)) =>
    ks <> start \/ (kj * 2 + 1) <> hbsj * 2 ^ (kl + 1) + lbsj =>
    bsrev 8 (hbsj * 128 + lbsj * 2 ^ (6 - kl) + start) <>
    bsrev 8 (kj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + ks).
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_hbsj_range mem_start_range mem_lbsj_range or_neq.
    move: (neq_bsrev1 (6 - kl) ks kj start (hbsj * 2 ^ (kl + 1) + lbsj) _ _ _ _ _ _) => //.
    + by rewrite mem_range_subl.
    + by rewrite opprD /= addrC.
    + rewrite opprD /= (IntID.addrC 2) mulrC (IntID.addrC _ lbsj).
      move: (mem_range_add_mul _ _ _ _ _ mem_lbsj_range mem_hbsj_range) => /=.
      by rewrite (exprS_add_range _ _ _ mem_kl_range).
    by rewrite mulrDl -mulrA (exprD_nneg_add_sub_range _ _ _ mem_kl_range).
  qed.

  lemma partial_invntt_spec_pre_neq kl ks kj hbsj start lbsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    hbsj \in range 0 2 =>
    start \in range 0 (2 ^ (6 - kl)) =>
    lbsj \in range 0 (2 ^ (kl + 1)) =>
    ks <> start \/ ((kj * 2) <> hbsj * 2 ^ (kl + 1) + lbsj /\ (kj * 2 + 1) <> hbsj * 2 ^ (kl + 1) + lbsj) =>
    partial_invntt_spec r p (2 ^ (6 - kl) %/ 2) start lbsj hbsj =>
    partial_invntt_spec
      (set2_mul_addr r (exp zroot (- (ks * 2 + 1) * 2 ^ kl))
        (bsrev 8 (kj * 2 ^ (7 - kl) + ks))
        (bsrev 8 (kj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + ks)))
      p (2 ^ (6 - kl) %/ 2) start lbsj hbsj.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_hbsjnge mem_start_range mem_lbsj_range.
    rewrite /partial_invntt_spec pow_if // => /= eq_r.
    rewrite set2_mul_addr_neqiE //.
    + by apply invntt_neq_bsrev0 => //=; case: eq_r => [-> //|[->]].
    by apply invntt_neq_bsrev1 => //=; case: eq_r => [-> //|[_ ->]].
  qed.

  lemma partial_invntt_spec_pre_neq1 kl ks kj hbsj lbsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    hbsj \in range 0 2 =>
    lbsj \in range 0 (2 ^ kl) =>
    hbsj * 2 ^ kl + lbsj < kj =>
    partial_invntt_spec r p (2 ^ (6 - kl) %/ 2) ks (lbsj * 2) hbsj =>
    partial_invntt_spec
      (set2_mul_addr r (exp zroot (- (ks * 2 + 1) * 2 ^ kl))
        (bsrev 8 (kj * 2 ^ (7 - kl) + ks))
        (bsrev 8 (kj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + ks)))
      p (2 ^ (6 - kl) %/ 2) ks (lbsj * 2) hbsj.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_hbsj_range mem_lbsj_range lt_ spec_.
    rewrite partial_invntt_spec_pre_neq //.
    + rewrite mem_range_mulr //=; move: mem_lbsj_range; apply mem_range_incl => //.
      by rewrite -(exprSr_range _ _ _ mem_kl_range) //= -mulNr mulzK.
    right; rewrite -(exprSr_range _ _ _ mem_kl_range) //= mulrA -mulrDl; split.
    + apply/negP => eq_; move: (mulIf 2 _ kj (hbsj * 2 ^ kl + lbsj) _) => //.
      by apply/negP/gtr_eqF.
    apply/negP => eq_; have: (kj * 2 + 1) %% 2 = ((hbsj * 2 ^ kl + lbsj) * 2) %% 2 by rewrite eq_.
    by rewrite modzMDl modzMl.
  qed.

  lemma partial_invntt_spec_pre_neq2 kl ks kj hbsj lbsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    hbsj \in range 0 2 =>
    lbsj \in range 0 (2 ^ kl) =>
    hbsj * 2 ^ kl + lbsj < kj =>
    partial_invntt_spec r p (2 ^ (6 - kl) %/ 2) ks (lbsj * 2 + 1) hbsj =>
    partial_invntt_spec
      (set2_mul_addr r (exp zroot (- (ks * 2 + 1) * 2 ^ kl))
        (bsrev 8 (kj * 2 ^ (7 - kl) + ks))
        (bsrev 8 (kj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + ks)))
      p (2 ^ (6 - kl) %/ 2) ks (lbsj * 2 + 1) hbsj.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_hbsj_range mem_lbsj_range lt_ spec_.
    rewrite partial_invntt_spec_pre_neq //.
    + rewrite mem_range_addr mem_range_mulr //=; move: mem_lbsj_range; apply mem_range_incl => //.
      by rewrite -(exprSr_range _ _ _ mem_kl_range) //= opprD -mulNr /= divzMDl.
    right; rewrite -(exprSr_range _ _ _ mem_kl_range) //= mulrA !addrA -mulrDl; split.
    + apply/negP => eq_; have: (kj * 2) %% 2 = ((hbsj * 2 ^ kl + lbsj) * 2 + 1) %% 2 by rewrite eq_.
      by rewrite modzMDl modzMl.
    apply/negP => /IntID.addIr eq_; move: (mulIf 2 _ kj (hbsj * 2 ^ kl + lbsj) _) => //.
    by apply/negP/gtr_eqF.
  qed.

  lemma ntt_eq_big_int_split f1 f2 f (a1 b1 a2 b2 a b : int) :
    a1 <= b1 =>
    b1 - a1 <= b - a =>
    b1 - a1 + b2 - a2 = b - a =>
    (forall x, x \in range 0 (b1 - a1) => f1 (a1 + x) = f (a + x)) =>
    (forall x, x \in range 0 (b2 - a2) => f2 (a2 + x) = f (a + b1 - a1 + x)) =>
    BAdd.bigi predT f1 a1 b1 + BAdd.bigi predT f2 a2 b2 =
    BAdd.bigi predT f a b.
  proof.
    move => le_ le_size eq_ eq_1 eq_2.
    pose g1:= (+)%Int (a - a1); rewrite (BAdd.eq_big_int _ _ f1 (f \o g1)) /g1 /= => {g1}.
    + move => y /mem_range mem_y_range; rewrite /(\o) /=.
      move: (eq_1 (y - a1) _); [by rewrite mem_range_subr /= -addrA|].
      by rewrite !addrA addrAC /= addrAC.
    pose g2:= (+)%Int (a + b1 - a1 - a2); rewrite (BAdd.eq_big_int _ _ f2 (f \o g2)) /g2 /= => {g2}.
    + move => y /mem_range mem_y_range; rewrite /(\o) /=.
      move: (eq_2 (y - a2) _); [by rewrite mem_range_subr /= -addrA|].
      by rewrite !addrA addrAC /= addrAC => ->; congr; congr; ring.
    rewrite -!BAdd.big_mapT -!range_add !addrA addrAC /=.
    have ->: b1 + a - a1 = a + (b1 - a1) by ring.
    have ->: a2 + a + b1 - a1 - a2 = a + (b1 - a1) by ring.
    have ->: b2 + a + b1 - a1 - a2 = a + (b1 - a1 + b2 - a2) by ring.
    rewrite eq_ eq_sym !addrA (IntID.addrAC a b) /=; apply/BAdd.big_cat_int.
    + by rewrite -addrA -ler_subl_addl /= subr_ge0.
    by rewrite -addrA -ler_subr_addl.
  qed.

  lemma invntt_eq_big_int_split f1 f2 f (a1 b1 a2 b2 a b : int) :
    a1 <= b1 =>
    b1 - a1 = b2 - a2 =>
    b1 - a1 + b2 - a2 = b - a =>
    (forall x, x \in range 0 (b1 - a1) => f1 (a1 + x) = f (a + x * 2)) =>
    (forall x, x \in range 0 (b2 - a2) => f2 (a2 + x) = f (a + x * 2 + 1)) =>
    BAdd.bigi predT f1 a1 b1 + BAdd.bigi predT f2 a2 b2 =
    BAdd.bigi predT f a b.
  proof.
    move => le_ eq_size eq_ eq_1 eq_2.
    pose g1 x:= a + (x - a1) * 2; rewrite (BAdd.eq_big_int _ _ f1 (f \o g1)) /g1 /= => {g1}.
    + move => y /mem_range mem_y_range; rewrite /(\o) /=.
      move: (eq_1 (y - a1) _); [by rewrite mem_range_subr /= -addrA|].
      by rewrite !addrA addrAC.
    pose g2 x:= a + (x - a2) * 2 + 1; rewrite (BAdd.eq_big_int _ _ f2 (f \o g2)) /g2 /= => {g2}.
    + move => y /mem_range mem_y_range; rewrite /(\o) /=.
      move: (eq_2 (y - a2) _); [by rewrite mem_range_subr /= -addrA|].
      by rewrite !addrA addrAC.
    rewrite -!BAdd.big_mapT -BAdd.big_cat; apply/BAdd.eq_big_perm/uniq_perm_eq.
    + rewrite cat_uniq !map_inj_in_uniq.
      - move => x y mem_x_range mem_y_range /=.
        move => /IntID.addrI ?; move: (mulIf 2 _ (x - a1) (y - a1) _) => //.
        by apply/IntID.addIr.
      - move => x y mem_x_range mem_y_range /=.
        move => /IntID.addIr /IntID.addrI ?; move: (mulIf 2 _ (x - a2) (y - a2) _) => //.
        by apply/IntID.addIr.
      rewrite !range_uniq /=; apply/negP => /hasP [x] [/mapP [x2] [mem_x2_range ->>]].
      move => /mapP [x1] [mem_x1_range {eq_} eq_]; rewrite /= -!addrA in eq_.
      move: eq_ => /IntID.addrI eq_.
      have: (((x2 - a2) * 2 + 1) %% 2 = ((x1 - a1) * 2) %% 2) by rewrite eq_.
      by rewrite modzMDl modzMl.
    + by rewrite range_uniq.
    move => x; rewrite mem_cat; split => [[|] /mapP [y] [mem_y_range ->>]|mem_x_range].
    + rewrite mem_range_addl mem_range_mulr // mem_range_addr /= -eq_.
      by rewrite -addrA -eq_size -mulr2z intmulz -mulNr mulzK //= -addrA.
    + rewrite mem_range_addr mem_range_addl mem_range_mulr // mem_range_addr /=.
      rewrite addrAC /= addrAC -eq_ -(IntID.addrA _ b2) eq_size -mulr2z intmulz opprD /=.
      by rewrite -mulNr divzMDl //= -addrA.
    case: (bsj_disj (x - a)) => eq_mod2; [left|right]; apply/mapP.
    + exists (a1 + (x - a) %/ 2) => /=; rewrite addrAC /= -eq_mod2 addrA addrAC /=.
      rewrite mem_range_addl range_div_range //= -intmulz mulr2z {2}eq_size addrA eq_.
      by rewrite mem_range_addr /= -addrA.
    exists (a2 + (x - a) %/ 2) => /=; rewrite (IntID.addrAC a2) /= -addrA -eq_mod2 addrA addrAC /=.
    rewrite mem_range_addl range_div_range //= -intmulz mulr2z -{1}eq_size addrA eq_.
    by rewrite mem_range_addr /= -addrA.
  qed.

  lemma partial_invntt_spec_eq1 kl ks hbsj lbsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    hbsj \in range 0 2 =>
    lbsj \in range 0 (2 ^ kl) =>
    partial_invntt_spec r p (2 ^ (6 - kl)) ks lbsj hbsj =>
    partial_invntt_spec r p (2 ^ (6 - kl)) (2 ^ (6 - kl) + ks) lbsj hbsj =>
    partial_invntt_spec
      (set2_mul_addr r (exp zroot (- (ks * 2 + 1) * 2 ^ kl))
        (bsrev 8 ((hbsj * 2 ^ kl + lbsj) * 2 ^ (7 - kl) + ks))
        (bsrev 8 ((hbsj * 2 ^ kl + lbsj) * 2 ^ (7 - kl) + 2 ^ (6 - kl) + ks)))
      p (2 ^ (6 - kl) %/ 2) ks (lbsj * 2) hbsj.
  proof.
    move => mem_kl_range mem_ks_range mem_hbsj_range mem_lbsj_range.
    rewrite /partial_invntt_spec expr_gt0 //=.
    rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= pow_if //.
    rewrite addrA mulrDl => eq_r_1 eq_r_2.
    rewrite -mulrA (exprD_nneg_sub_range _ _ _ mem_kl_range) //=.
    rewrite -mulrA (exprS_sub_range _ _ _ mem_kl_range) //=.
    rewrite set2_mul_addr_eq1iE //.
    + by apply/invntt_neq_bsrev.
    + by apply/(bsrev_range 8).
    rewrite eq_r_1 eq_r_2 /partial_invntt expr_gt0 //=.
    rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
    rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
    rewrite pow_if // (divz_pow_sub_range _ _ _ mem_kl_range) //=.
    apply/invntt_eq_big_int_split => //=; [by rewrite expr_ge0| | |].
    + by rewrite -mulr2z intmulz (exprSr_range _ _ _ mem_kl_range).
    + move => x mem_x_range; rewrite -!mulrA (exprS_sub_range _ _ _ mem_kl_range) //=; congr.
      rewrite (exp_mod _ _ _ exp_zroot_256) eq_sym (exp_mod _ _ _ exp_zroot_256) eq_sym.
      congr; rewrite !(exprSr_sub_range _ _ _ mem_kl_range) //=.
      by rewrite (exprS_sub_range _ _ _ mem_kl_range).
    move => x mem_x_range; rewrite !mulrDl -!mulrA (exprS_sub_range _ _ _ mem_kl_range) //= !addrA; congr.
    rewrite (exp_mod _ _ _ exp_zroot_256) eq_sym (exp_mod _ _ _ exp_zroot_256) eq_sym.
    congr; rewrite !(exprSr_sub_range _ _ _ mem_kl_range) //= !(exprS_sub_range _ _ _ mem_kl_range) //=.
    by rewrite !mulrA -(IntID.mulrA x 2) (exprS_sub_range _ _ _ mem_kl_range).
  qed.

  lemma partial_invntt_spec_eq2 kl ks hbsj lbsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    hbsj \in range 0 2 =>
    lbsj \in range 0 (2 ^ kl) =>
    partial_invntt_spec r p (2 ^ (6 - kl)) ks lbsj hbsj =>
    partial_invntt_spec r p (2 ^ (6 - kl)) (2 ^ (6 - kl) + ks) lbsj hbsj =>
    partial_invntt_spec
      (set2_mul_addr r (exp zroot (- (ks * 2 + 1) * 2 ^ kl))
        (bsrev 8 ((hbsj * 2 ^ kl + lbsj) * 2 ^ (7 - kl) + ks))
        (bsrev 8 ((hbsj * 2 ^ kl + lbsj) * 2 ^ (7 - kl) + 2 ^ (6 - kl) + ks)))
      p (2 ^ (6 - kl) %/ 2) ks (lbsj * 2 + 1) hbsj.
  proof.
    move => mem_kl_range mem_ks_range mem_hbsj_range mem_lbsj_range.
    rewrite /partial_invntt_spec expr_gt0 //=.
    rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= pow_if //.
    rewrite addrA mulrDl => eq_r_1 eq_r_2.
    rewrite -mulrA (exprD_nneg_sub_range _ _ _ mem_kl_range) //=.
    rewrite (IntID.mulrDl (lbsj * 2) 1) /= !addrA.
    rewrite -mulrA (exprS_sub_range _ _ _ mem_kl_range) //=.
    rewrite set2_mul_addr_eq2iE //.
    + by apply/invntt_neq_bsrev.
    + by apply/(bsrev_range 8).
    rewrite eq_r_1 eq_r_2 /partial_invntt expr_gt0 //=.
    rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
    rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
    rewrite pow_if // (divz_pow_sub_range _ _ _ mem_kl_range) //=.
    rewrite ZqRing.mulrDr ZqRing.mulrN -ZqRing.mulNr !BAdd.mulr_sumr.
    apply/invntt_eq_big_int_split => //=; [by rewrite expr_ge0| | |].
    + by rewrite -mulr2z intmulz (exprSr_range _ _ _ mem_kl_range).
    + move => x mem_x_range; rewrite -!mulrA (exprS_sub_range _ _ _ mem_kl_range) //= !ZqRing.mulrA; congr.
      rewrite -ZqRing.exprD ?unit_zroot_ring //.
      rewrite (exp_mod _ _ _ exp_zroot_256) eq_sym (exp_mod _ _ _ exp_zroot_256) eq_sym.
      congr; rewrite (* -!ZqRing.mulrA*) (IntID.mulrDl (lbsj * 2) 1) /= -!mulrA !(exprSr_sub_range _ _ _ mem_kl_range) //=.
      rewrite !(exprS_sub_range _ _ _ mem_kl_range) //=.
      rewrite (IntID.addrC (_ * _)%Int (2 ^ (7 - _))) (IntID.mulrC lbsj) bsrev_add.
      - by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply/mem_range_incl.
      - rewrite mem_range expr_ge0 //=; move: (exprS_sub_range _ _ _ mem_kl_range 2 7) => //= <-.
        by rewrite -subr_gt0 -{2}(IntID.mul1r (2 ^ (7 - kl))) -mulNr -mulrDl /= expr_gt0.
      rewrite -bsrev_mulr_pow2.
      - by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply/mem_range_incl.
      rewrite bsrev_pow2.
      - by rewrite mem_range_subl; move: mem_kl_range; apply/mem_range_incl.
      rewrite !opprD !addrA /= mulrDr; pose z:= (_ * bsrev _ _); move: z => z.
      rewrite !mulrDl /= -!mulrA (exprS_range _ _ _ mem_kl_range) //=.
      rewrite !(exprD_nneg_sub_add_range _ _ _ mem_kl_range) //= !opprD -!mulNr.
      by rewrite -!addrA modzMDl -modzDm eq_sym -modzDm.
    move => x mem_x_range; rewrite !mulrDl -!mulrA (exprS_sub_range _ _ _ mem_kl_range) //= !addrA !mulrA !ZqRing.mulrA; congr.
    rewrite -!(IntID.mulrA ks) -!(IntID.mulrA x) -!(IntID.mulrA lbsj) !(exprSr_sub_range _ _ _ mem_kl_range) //=.
    rewrite !(exprS_sub_range _ _ _ mem_kl_range) //= !(exprSr_sub_range _ _ _ mem_kl_range) //=.
    rewrite !(exprS_range _ _ _ mem_kl_range) //= !opprD /= -!mulNr !mulrA -!mulrDl.
    rewrite -{2}(IntID.mul1r (bsrev _ _)) -mulNr -mulrDl -{2}(IntID.mul1r (bsrev _ (_ + _)%Int)) -mulNr -mulrDl.
    rewrite -(ZqRing.mul1r (exp zroot (_ - _)%Int)) -ZqRing.mulNr -incoeffN -exp_zroot_128.
    rewrite -!ZqRing.exprD ?unit_zroot_ring //.
    rewrite (exp_mod _ _ _ exp_zroot_256) eq_sym (exp_mod _ _ _ exp_zroot_256) eq_sym.
    congr; rewrite (IntID.addrC (_ * _)%Int (2 ^ (7 - _))) (IntID.mulrC lbsj) bsrev_add.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply/mem_range_incl.
    + rewrite mem_range expr_ge0 //=; move: (exprS_sub_range _ _ _ mem_kl_range 2 7) => //= <-.
      by rewrite -subr_gt0 -{2}(IntID.mul1r (2 ^ (7 - kl))) -mulNr -mulrDl /= expr_gt0.
    rewrite -bsrev_mulr_pow2.
    + by rewrite le2_mem_range mem_range_subl; move: mem_kl_range; apply/mem_range_incl.
    rewrite bsrev_pow2.
    + by rewrite mem_range_subl; move: mem_kl_range; apply/mem_range_incl.
    rewrite !opprD !addrA /= mulrDr.
    pose z:= (_ * bsrev _ _); move: z => z.
    rewrite !mulrDl /= -!mulrA (exprS_range _ _ _ mem_kl_range) //= !mulNr !(IntID.mulrC _ (2 ^ kl)).
    rewrite !(exprD_nneg_sub_range _ _ _ mem_kl_range) //= -!mulNr.
    by rewrite -!addrA modzMDl -modzDm eq_sym -modzDm.
  qed.

  lemma partial_invntt_spec_post_neq1 kl ks kj hbsj start lbsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    hbsj \in range 0 2 =>
    start \in range 0 (2 ^ (6 - kl)) =>
    lbsj \in range 0 (2 ^ kl) =>
    ks <> start \/ kj <> hbsj * 2 ^ kl + lbsj =>
    partial_invntt_spec r p (2 ^ (6 - kl)) start lbsj hbsj =>
    partial_invntt_spec r p (2 ^ (6 - kl)) (2 ^ (6 - kl) + start) lbsj hbsj =>
    partial_invntt_spec
      (set2_mul_addr r (exp zroot (- (ks * 2 + 1) * 2 ^ kl))
        (bsrev 8 (kj * 2 ^ (7 - kl) + ks))
        (bsrev 8 (kj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + ks)))
      p (2 ^ (6 - kl)) start lbsj hbsj.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_hbsj_range mem_start_range mem_lbsj_range or_neq.
    rewrite /partial_invntt_spec => eq_r_1 eq_r_2 len'; rewrite /len' => {len'}.
    move: eq_r_1 eq_r_2; rewrite expr_gt0 //= (exprSr_sub_range _ _ _ mem_kl_range) //= => eq_r_1 eq_r_2.
    rewrite set2_mul_addr_neqiE //.
    + by apply/invntt_neq_bsrev00.
    by apply/invntt_neq_bsrev01.
  qed.

  lemma partial_invntt_spec_post_neq2 kl ks kj hbsj start lbsj r p :
    kl \in range 0 7 =>
    ks \in range 0 (2 ^ (6 - kl)) =>
    kj \in range 0 (2 ^ (kl + 1)) =>
    hbsj \in range 0 2 =>
    start \in range 0 (2 ^ (6 - kl)) =>
    lbsj \in range 0 (2 ^ kl) =>
    ks <> start \/ kj <> hbsj * 2 ^ kl + lbsj =>
    partial_invntt_spec r p (2 ^ (6 - kl)) start lbsj hbsj =>
    partial_invntt_spec r p (2 ^ (6 - kl)) (2 ^ (6 - kl) + start) lbsj hbsj =>
    partial_invntt_spec
      (set2_mul_addr r (exp zroot (- (ks * 2 + 1) * 2 ^ kl))
        (bsrev 8 (kj * 2 ^ (7 - kl) + ks))
        (bsrev 8 (kj * 2 ^ (7 - kl) + 2 ^ (6 - kl) + ks)))
      p (2 ^ (6 - kl)) (2 ^ (6 - kl) + start) lbsj hbsj.
  proof.
    move => mem_kl_range mem_ks_range mem_kj_range mem_hbsj_range mem_start_range mem_lbsj_range or_neq.
    rewrite /partial_invntt_spec => eq_r_1 eq_r_2 len'; rewrite /len' => {len'}.
    move: eq_r_1 eq_r_2; rewrite expr_gt0 //= (exprSr_sub_range _ _ _ mem_kl_range) //= => eq_r_1 eq_r_2.
    rewrite set2_mul_addr_neqiE //.
    + by rewrite addrA; apply invntt_neq_bsrev10.
    by rewrite addrA; apply invntt_neq_bsrev11.
  qed.

  hoare naive_invntt_inner p :
    NTT_naive.invntt_inner:
      inv_naive_invntt_outer NTT_vars.zetas_inv p NTT_vars.len NTT_vars.start NTT_vars.r /\
      NTT_vars.start < NTT_vars.len ==>
      inv_naive_invntt_outer NTT_vars.zetas_inv p NTT_vars.len NTT_vars.start NTT_vars.r.
  proof.
    proc; wp.
    while (
      inv_naive_invntt_inner
        NTT_vars.zetas_inv p NTT_vars.len NTT_vars.start NTT_vars.zeta_ NTT_vars.j NTT_vars.r);
    wp.
    + skip => &m /=; rewrite /inv_naive_invntt_inner; apply/HL_FOR_INT_ADD_LT.inv_in.
      move => [] [] [_] /= [kl] [/mem_range mem_kl_range] ->>.
      move => [ks] [/mem_range mem_ks_range] ->> ->>.
      rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
      rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //=.
      rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //= => ? <<- kj mem_kj_range ->>.
      rewrite mulrDl /= => Q_ hbsj start lbsj mem_hbsj_range mem_start_range.
      move: (Q_ hbsj start) => {Q_}; rewrite mem_hbsj_range mem_start_range /=.
      rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
      rewrite !(divz_pow_sub_range _ _ _ mem_kl_range) //=.
      rewrite (divz_pow_range _ _ _ mem_kl_range) //= in mem_ks_range.
      rewrite lerNgt expr_gt0 //= in mem_ks_range.
      case: (start < ks) => [lt_start_ks|Nlt_start_ks].
      - move => /(_ lbsj) Q_ mem_lbsj_range; move: Q_ => /(_ _) // ?.
        by rewrite partial_invntt_spec_pre_neq //; left; rewrite gtr_eqF.
      case: (start = ks) => [->>|neq_start_ks].
      - move => /(_ lbsj) Q_ mem_lbsj_range; move: Q_ => /(_ _) //.
        move: (exprD_nneg_add_sub_range _ _ _ mem_kl_range 2 7 0) => //= <-.
        rewrite mulrA -mulrDl -mulrSl; do 2!(rewrite ltr_pmul2r ?expr_gt0 //).
        rewrite ltzS ler_eqVlt.
        case: (hbsj * 2 ^ kl + lbsj < kj) => [lt_bsj_kj|Nlt_bsj_kj] /=.
        * by move => [? ?]; rewrite partial_invntt_spec_pre_neq1 // partial_invntt_spec_pre_neq2.
        case: (hbsj * 2 ^ kl + lbsj = kj) => [<<-|neq_bsj_kj] /=.
        * by move => [? ?]; rewrite partial_invntt_spec_eq1 // partial_invntt_spec_eq2.
        move => [? ?].
        rewrite partial_invntt_spec_post_neq1 //; [by right; rewrite eq_sym|].
        by rewrite partial_invntt_spec_post_neq2 //; right; rewrite eq_sym.
      move => /(_ lbsj) Q_ mem_lbsj_range; move: Q_ => /(_ _) // [? ?].
      rewrite partial_invntt_spec_post_neq1 //; [by left; rewrite eq_sym|].
      by rewrite partial_invntt_spec_post_neq2 //; left; rewrite eq_sym.
    skip => &m; rewrite /inv_naive_invntt_outer /inv_naive_invntt_inner => inv_; split.
    + apply/HL_FOR_INT_ADD_LT.inv_0 => //; [split|].
      - by move: inv_; rewrite /P_naive_invntt_inner; apply/HL_FOR_INT_ADD_LT.inv_context.
      - case/HL_FOR_INT_ADD_LT.invP: inv_ => -[->] /= [kl].
        move => [/mem_range mem_kl_range ->] [ks]; rewrite (divz_pow_range _ _ _ mem_kl_range) //=.
        rewrite (lerNgt (2 ^ _)) expr_gt0 //= => -[/mem_range mem_ks_range [-> _]].
        rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
        rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
        rewrite -(exprSr_range _ _ _ mem_kl_range) //= mulrA.
        rewrite -(IntID.mulN1r 2) -mulrDl (IntID.mulrC (_ - _)%Int 2).
        rewrite -{1}(IntID.expr1 2) bsrev_mulr_pow2 //=.
        rewrite mulrDl /= -mulrA (exprS_range _ _ _ mem_kl_range) //=.
        rewrite mulrC -addrA (IntID.addrC (2 ^ _ * _) (_ - 1)).
        rewrite /NTT_Fq.zetas_inv /= Array128.set_neqiE //.
        * apply/ltr_eqF/ltz_divLR => //=; rewrite bsrev_add.
          + by rewrite le2_mem_range mem_range_addr; move: mem_kl_range; apply/mem_range_incl.
          + apply/mem_range; split => [|_]; [by rewrite -ltzS /= expr_gt0|].
            rewrite ltzE /= ler_weexpn2l // -ler_subl_addl /=.
            by move: mem_kl_range; apply/mem_range_le.
          rewrite bsrev_cat_nseq_true_false.
          + by rewrite le2_mem_range; move: mem_kl_range; apply/mem_range_incl.
          rewrite addrAC -ltr_subr_addr /= -ltr_subr_addl addrAC /= (IntID.addrC (-2)).
          rewrite ltz_divLR ?expr_gt0 // mulrDl mulNr.
          rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range) //=.
          rewrite (exprS_add_range _ _ _ mem_kl_range) //=.
          move: (bsrev_range 8 ks); apply/mem_range_gt.
          rewrite ler_subr_addr -ler_subr_addl /=; have ->: 256 = 2 ^ 8 by trivial.
          apply/ler_weexpn2l => //; rewrite le2_mem_range mem_range_addr.
          by move: mem_kl_range; apply/mem_range_incl.
        rewrite Array128.initiE /=.
        * apply/mem_range/range_div_range => //=; have ->: 256 = 2 ^ 8 by trivial.
          by apply/bsrev_range.
        rewrite divzK.
        * rewrite -{1}IntID.expr1; apply/bsrev_range_dvdz => //=.
          move: (mem_range_add_mul _ _ (2 ^ (kl + 1)) (2 ^ kl - 1) _ _ mem_ks_range) => /=.
          + apply/mem_range; split => [|_]; [by rewrite -ltzS /= expr_gt0|].
            rewrite ltzE /=; apply/ler_weexpn2l => //; rewrite -ler_subl_addl /=.
            by move: mem_kl_range; apply/mem_range_le.
          by rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range).
        rewrite bsrev_involutive //.
        * move: (mem_range_add_mul _ _ (2 ^ (kl + 1)) (2 ^ kl - 1) _ _ mem_ks_range) => /=.
          + apply/mem_range; split => [|_]; [by rewrite -ltzS /= expr_gt0|].
            rewrite ltzE /=; apply/ler_weexpn2l => //; rewrite -ler_subl_addl /=.
            by move: mem_kl_range; apply/mem_range_le.
          rewrite (exprD_nneg_sub_add_range _ _ _ mem_kl_range) //=.
          by apply/mem_range_incl.
        by congr; ring.
      move: inv_ => /HL_FOR_INT_ADD_LT.invP [[_]] [kl] /= [/mem_range mem_kl_range] ->>.
      rewrite (divz_pow_range _ _ _ mem_kl_range) //= lerNgt expr_gt0 //=.
      move => /= [ks] [/mem_range mem_ks_range] [->>] Q_ hbsj start lbsj mem_hbsj_range mem_start_range.
      move: (Q_ hbsj start (lbsj * 2 + 1) _ _) => //; move: (Q_ hbsj start (lbsj * 2) _ _) => //.
      move: Q_ => /(_ hbsj start lbsj _ _) //; rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
      rewrite !(divz_pow_sub_range _ _ _ mem_kl_range) //=.
      case: (start < ks) => //= _; case: (start = ks) => //= _.
      move => Q_ _ _ mem_lbsj_range; rewrite ltrNge addr_ge0 /=.
      - by rewrite mulr_ge0 //; move: mem_hbsj_range; apply/mem_range_le.
      - by rewrite mulr_ge0 ?expr_ge0 //=; move: mem_lbsj_range; apply/mem_range_le.
      by rewrite Q_.
    apply/HL_FOR_INT_ADD_LT.inv_out => /=; move => [[[-> _] _] ?] r; move: inv_.
    move => /HL_FOR_INT_ADD_LT.invP [] [_] /= [kl] /= [/mem_range mem_kl_range] ->>.
    rewrite (divz_pow_range _ _ _ mem_kl_range) //= lerNgt expr_gt0 //=.
    move => /= [ks] [/mem_range mem_ks_range] [->>].
    rewrite (exprSr_sub_range _ _ _ mem_kl_range) //= expr_gt0 //=.
    rewrite (NdivzN_pow_sub_range _ _ _ mem_kl_range) //=.
    rewrite (exprD_nneg_add_sub_range _ _ _ mem_kl_range) //=.
    move => _ Q_; split => /=; [exists kl => //=; rewrite -mem_range mem_kl_range /=|].
    + by rewrite (divz_pow_range _ _ _ mem_kl_range).
    exists (ks + 1); rewrite le2_mem_range /= lerNgt expr_gt0 //=; split.
    + by apply/mem_range_addr; move: mem_ks_range; apply mem_range_incl.
    move => hbsj start lbsj mem_hbsj_range mem_start_range; rewrite !(divz_pow_sub_range _ _ _ mem_kl_range) //=.
    move: (Q_ hbsj start) => //; rewrite /Q_naive_invntt_inner; rewrite (exprSr_sub_range _ _ _ mem_kl_range) //=.
    rewrite !(divz_pow_sub_range _ _ _ mem_kl_range) //= mem_start_range /= => {Q_}.
    rewrite ltzS ler_eqVlt; case: (start < ks) => //= _; [by move => /(_ lbsj _)|].
    case: (start = ks) => //= [->> /(_ (lbsj %/ 2)) Q_ mem_lbsj_range|_ /(_ lbsj _) //].
    move: Q_; rewrite range_div_range //= (exprSr_range _ _ _ mem_kl_range) //=.
    move => /(_ _ _) //.
    rewrite -ltr_subr_addl -ltz_divRL ?expr_gt0 //.
    + apply/(dvdz_trans 128).
      - rewrite vp_le_pow_dvd // ler_norml /= le2_mem_range.
        by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl.
      by rewrite dvdzD // -mulNr dvdz_mull.
    rewrite divzDl.
    + rewrite vp_le_pow_dvd // ler_norml /= le2_mem_range.
      by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
    rewrite -mulNr -divzpMr.
    + rewrite vp_le_pow_dvd // ler_norml /= le2_mem_range.
      by rewrite mem_range_subl; move: mem_kl_range; apply mem_range_incl.
    rewrite (divz_pow_sub_range _ _ _ mem_kl_range) //=.
    rewrite ltz_divLR //= mulrDl -mulrA (exprSr_range _ _ _ mem_kl_range) //=.
    rewrite (IntID.mulrC _ 2)- mulrDl (mem_range_gt _ _ _ _ _ mem_lbsj_range) //=.
    + rewrite -subr_ge0 -{2}(IntID.mul1r (_ ^ _)%IntID) -mulNr -mulrDl addrAC /=.
      by rewrite mulr_ge0 ?expr_ge0 // subr_ge0; move: mem_hbsj_range; apply mem_range_ge.
    by move => [? ?]; case: (bsj_disj lbsj) => ->.
  qed.

  hoare naive_invntt_outer p :
    NTT_naive.invntt_outer:
      inv_naive_invntt NTT_vars.zetas_inv p NTT_vars.len NTT_vars.r /\ 1 <= NTT_vars.len ==>
      inv_naive_invntt NTT_vars.zetas_inv p NTT_vars.len NTT_vars.r.
  proof.
    proc; wp.
    while (inv_naive_invntt_outer NTT_vars.zetas_inv p NTT_vars.len NTT_vars.start NTT_vars.r); wp.
    + by call (naive_invntt_inner p).
    skip => &m; rewrite /inv_naive_invntt /inv_naive_invntt_outer => inv_; split.
    + apply/HL_FOR_INT_ADD_LT.inv_0 => //.
      - by move: inv_; rewrite /P_naive_invntt; apply/HL_FOR_NAT_DIV_GE.inv_context.
      move: inv_ => /HL_FOR_NAT_DIV_GE.invP [_] /= [k] [/mem_range mem_k_range] [->>].
      rewrite /Q_naive_invntt (divz_pow_range _ _ _ mem_k_range) //= expr_gt0 //=.
      rewrite (exprSr_sub_range _ _ _ mem_k_range) //= (divz_pow_sub_range _ _ _ mem_k_range) //=.
      move => Q_ hbsj start lbsj mem_hbsj_range mem_start_range.
      rewrite ltrNge (mem_range_le _ _ _ _ _ mem_start_range) //=.
      rewrite (divz_pow_sub_range _ _ _ mem_k_range) //= => mem_lbsj_range.
      rewrite !Q_ //=.
      - move: mem_start_range; apply/mem_range_incl => //=.
        apply/ler_weexpn2l => //=; rewrite ler_add2r /= subr_ge0.
        by move: mem_k_range; apply/mem_range_ge.
      rewrite mem_range_addl; move: mem_start_range; apply/mem_range_incl => //=.
      - by rewrite ler_oppl /= expr_ge0.
      by rewrite ler_subr_addr -mulr2z intmulz (exprSr_sub_range _ _ _ mem_k_range).
    move => r start; move: start r; apply/HL_FOR_INT_ADD_LT.inv_out => /=.
    move => _ r [_]; move: inv_.
    pose R len s:=
      Q_naive_invntt_outer p len
        (if len <= 0 then 0 else len)
        (if len <= 0 then 0 else len) s.
    apply/(HL_FOR_NAT_DIV_GE.inv_in_outerloop _ _ _ _ _ R) => //=.
    move => _ ? <<- k mem_k_range ->>; rewrite /R => {R} //=.
    rewrite (divz_pow_range _ _ _ mem_k_range) //= lerNgt expr_gt0 //=.
    move: mem_k_range; rewrite (rangeSr 0 6) // mem_rcons /=.
    rewrite /Q_naive_invntt_outer; case => [->> /=|mem_k_range] _.
    + move => Q_ len'; rewrite /len' => {len'} hbsj start lbsj /= mem_hbsj_range.
      rewrite range_ltn //= range_geq //= => ->> mem_lbsj_range.
      by move: Q_ => /(_ hbsj 0 lbsj _ _ _) //=; apply mem_range.
    rewrite (divz_pow_add_range _ _ _ mem_k_range) //=.
    rewrite (pow_div1_sub_range _ _ _ mem_k_range) //=.
    rewrite !(divz_pow_sub_range _ _ _ mem_k_range) //=.
    move => Q_ len'; rewrite /len' => {len'} hbsj start lbsj /=.
    rewrite expr_gt0 //= (exprSr_sub_range _ _ _ mem_k_range) //=.
    rewrite (divz_pow_sub_range _ _ _ mem_k_range) //= => mem_hbsj_range mem_start_range mem_lbsj_range.
    by move: Q_ => /(_ hbsj start lbsj _ _) //=; move: mem_start_range => /mem_range [_ ->] /= ->.
  qed.

  hoare naive_invntt_post (p : coeff Array256.t) :
    NTT_naive.invntt_post :
      NTT_vars.zetas_inv = NTT_Fq.zetas_inv /\
      NTT_vars.r = p ==>
      NTT_vars.r = Array256.map (transpose ( * )%Zq NTT_Fq.scale127) p.
  proof.
    proc.
    while (inv_naive_invntt_post NTT_vars.zetas_inv p NTT_vars.j NTT_vars.r); wp; skip => &m.
    + rewrite /inv_naive_invntt_post; apply/HL_FOR_INT_ADD_LT.inv_in.
      move => -> /= ? <<- k mem_k_range ->> /= Q_ i mem_i_range; move: Q_ => /(_ i _) //.
      rewrite rangeSr; [by move: mem_k_range; apply mem_range_le|].
      rewrite mem_rcons /= Array256.get_set_if -mem_range.
      rewrite (bsrev_range 8) /=.
      case: (i = k) => [->>|neqik] /=.
      - by rewrite mem_range /= ZqRing.mulr1 => ->.
      case: (bsrev 8 i = bsrev 8 k) => // eq_bsrev.
      by move: (bsrev_injective _ _ _ _ _ _ eq_bsrev) => // ->>.
    move => [-> <<-]; split.
    + rewrite /inv_naive_invntt_post; apply/HL_FOR_INT_ADD_LT.inv_0 => //.
      by move => j mem_j_range /=; rewrite range_geq //= ZqRing.mulr1.
    apply/HL_FOR_INT_ADD_LT.inv_out => _ r /= Q_.
    apply/Array256.tP => i /mem_range mem_i_range.
    move: Q_ => /(_ (bsrev 8 i) _); [by apply (bsrev_range 8)|].
    rewrite bsrev_involutive // => ->.
    rewrite Array256.mapiE /=; [by apply mem_range|].
    by rewrite (bsrev_range 8).
  qed.

  hoare naive_invntt (p : coeff Array256.t) :
    NTT_naive.invntt :
      NTT_vars.zetas_inv = NTT_Fq.zetas_inv /\
      NTT_vars.r = p ==>
      invntt_spec res p.
  proof.
    proc; rewrite /invntt_spec.
    pose p':= Array256.init (fun i => partial_invntt p 0 0 ((bsrev 8 i) %% 128) ((bsrev 8 i) %/ 128)).
    seq 3 : ( NTT_vars.r = Array256.map (transpose ( * )%Zq NTT_Fq.scale127) p');
    last first.
    + skip => &m -> hbsj lbsj mem_hbsj_range mem_lbsj_range.
      rewrite /p' => {p'}; rewrite Array256.mapiE /=.
      - by apply/mem_range/(bsrev_range 8).
      rewrite Array256.initiE //=; [by apply/mem_range/(bsrev_range 8)|].
      rewrite !bsrev_involutive //.
      - by rewrite addrC mulrC (mem_range_add_mul _ _ _ _ _ mem_hbsj_range mem_lbsj_range).
      rewrite divzMDl // modzMDl divz_small; [by apply/mem_range|].
      by rewrite modz_small //; apply/mem_range.
    call (naive_invntt_post p').
    while (inv_naive_invntt NTT_vars.zetas_inv p NTT_vars.len NTT_vars.r); wp.
    + by call (naive_invntt_outer p).
    skip => &m [-> <<-]; split.
    + rewrite /inv_naive_invntt; apply/HL_FOR_NAT_DIV_GE.inv_0 => //.
      move => len'; rewrite /len' => {len'} /= hbsj lbsj start.
      move => mem_hbsj_range mem_lbsj_range; rewrite range_ltn // range_geq //= => ->.
      move => len'; rewrite /len' => {len'} /=.
      rewrite /partial_invntt /= range_ltn // range_geq //= BAdd.big_consT BAdd.big_nil /=.
      by rewrite bsrev0 /= ZqRing.expr0 ZqRing.mul1r ZqRing.addr0.
    apply/HL_FOR_NAT_DIV_GE.inv_out => _ r /= Q_; split; [|by trivial].
    apply/Array256.tP => i /mem_range mem_i_range; rewrite /p' => {p'}.
    rewrite Array256.initiE /=; [by apply/mem_range|].
    rewrite /Q_naive_invntt in Q_.
    move: Q_ => /(_ (bsrev 8 i %/ 128) 0 (bsrev 8 i %% 128) _ _ _) /=; [ |by apply/mem_range| |].
    + by rewrite range_div_range //= (bsrev_range 8).
    + by rewrite (mem_range_mod _ 128).
    by rewrite /partial_invntt_spec /= -divz_eq bsrev_involutive.
  qed.

  lemma imp_ntt_spec p r :
    ntt_spec r p => r = ntt p.
  proof.
    rewrite /ntt_spec /partial_ntt_spec /partial_ntt /ntt => spec.
    apply tP => i /mem_range mem_i_range /=.
    rewrite Array256.initiE /=; [by apply mem_range|].
    rewrite {1 4}(divz_eq i 2).
    move: (mem_range_mod i 2 _) => //; rewrite range_ltn // range_ltn //.
    rewrite range_geq //=; case => eq_mod.
    + rewrite eq_mod /=; move: (spec (bsrev 8 (i %/ 2 * 2)) 0 _ _) => /=.
      - by apply/(bsrev_dvdz_range 7 8) => //=; apply/dvdz_mull/dvdzz.
      - by apply mem_range.
      rewrite bsrev_involutive // => {spec} [|->].
      - by rewrite mem_range_mulr // range_div_range.
      rewrite (BAdd.eq_big_perm _ _ _ (map (bsrev 7) (range 0 128))).
      - apply/uniq_perm_eq; [by apply/range_uniq| | ].
        * rewrite map_inj_in_uniq ?range_uniq // => x y mem_x_range mem_y_range.
          by apply/bsrev_injective.
        move => x; split => [mem_x_range|/mapP [y] [mem_y_range ->>]]; [apply/mapP; exists (bsrev 7 x)|].
        * by rewrite bsrev_involutive //= (bsrev_range 7).
        by rewrite (bsrev_range 7).
      rewrite BAdd.big_mapT; apply BigDom.BAdd.eq_big_int => j /mem_range mem_j_range; rewrite /(\o) /=.
      rewrite ZqRing.mulrC; congr; congr; [|congr].
      - by rewrite bsrev2_ge //= modz_small //; apply/mem_range.
      - congr; congr; rewrite /br; rewrite -(bsrev_involutive 8 (bsrev 7 _)) //=.
        * by move: (bsrev_range 7 (i %/ 2)); apply/mem_range_incl.
        congr; rewrite bsrev2_ge //= modz_small //; [|by rewrite mulrC].
        by apply/mem_range/range_div_range.
      rewrite modz_small; [by apply/mem_range/(bsrev_range 7)|].
      by rewrite mulrC (bsrev_mulr_pow2 1) // bsrev2_ge //= modz_small; [apply/mem_range|rewrite mulKz].
    rewrite eq_mod /=. move: (spec (bsrev 8 (i %/ 2 * 2)) 1 _ _) => /=.
    + by apply/(bsrev_dvdz_range 7 8) => //=; apply/dvdz_mull/dvdzz.
    + by apply mem_range.
    rewrite addrC (bsrev_add 7 8 _ 1) //.
    + by rewrite mulrC (bsrev_mulr_pow2 1 8) // range_div_range //= (bsrev_range 8).
    rewrite bsrev1 //= bsrev_involutive //= => {spec} [|->].
    + by rewrite mem_range_mulr // range_div_range.
    rewrite (BAdd.eq_big_perm _ _ _ (map (bsrev 7) (range 0 128))).
    + apply/uniq_perm_eq; [by apply/range_uniq| | ].
      - rewrite map_inj_in_uniq ?range_uniq // => x y mem_x_range mem_y_range.
        by apply/bsrev_injective.
      move => x; split => [mem_x_range|/mapP [y] [mem_y_range ->>]]; [apply/mapP; exists (bsrev 7 x)|].
      - by rewrite bsrev_involutive //= (bsrev_range 7).
      by rewrite (bsrev_range 7).
    rewrite BAdd.big_mapT; apply BigDom.BAdd.eq_big_int => j /mem_range mem_j_range; rewrite /(\o) /=.
    rewrite divzMDl //= ZqRing.mulrC; congr; congr; [|congr].
    + rewrite addrC (bsrev_add 7 8 _ 1) //.
      - by apply/(bsrev_range 7).
      by rewrite bsrev1 //= bsrev2_ge //= modz_small //; apply/mem_range.
    + congr; congr; rewrite /br; rewrite -(bsrev_involutive 8 (bsrev 7 _)) //=.
      - by move: (bsrev_range 7 (i %/ 2)); apply/mem_range_incl.
      congr; rewrite bsrev2_ge //= modz_small //; [|by rewrite mulrC].
      by apply/mem_range/range_div_range.
    rewrite modz_small; [by apply/mem_range/(bsrev_range 7)|].
    by rewrite mulrC (bsrev_mulr_pow2 1) // bsrev2_ge //= modz_small; [apply/mem_range|rewrite mulKz].
  qed.

  lemma imp_invntt_spec p r :
    invntt_spec r p => r = invntt p.
  proof.
    rewrite /invntt_spec /partial_invntt_spec /partial_invntt /invntt => /= spec.
    apply Array256.tP => i /mem_range mem_i_range /=.
    rewrite Array256.initiE /=; [by apply mem_range|].
    rewrite {1 4}(divz_eq i 2).
    move: (mem_range_mod i 2 _) => //; rewrite range_ltn // range_ltn //.
    rewrite range_geq //=; case => eq_mod.
    + rewrite eq_mod /=; move: (spec (bsrev 8 (i %/ 2 * 2)) 0 _ _) => /=.
      - by apply/(bsrev_dvdz_range 7 8) => //=; apply/dvdz_mull/dvdzz.
      - by apply mem_range.
      rewrite bsrev_involutive // => {spec} [|->].
      - by rewrite mem_range_mulr // range_div_range.
      rewrite (BAdd.eq_big_perm _ _ _ (map (bsrev 7) (range 0 128))).
      - apply/uniq_perm_eq; [by apply/range_uniq| | ].
        * rewrite map_inj_in_uniq ?range_uniq // => x y mem_x_range mem_y_range.
          by apply/bsrev_injective.
        move => x; split => [mem_x_range|/mapP [y] [mem_y_range ->>]]; [apply/mapP; exists (bsrev 7 x)|].
        * by rewrite bsrev_involutive //= (bsrev_range 7).
        by rewrite (bsrev_range 7).
      rewrite BAdd.big_mapT BAdd.mulr_suml.
      apply BigDom.BAdd.eq_big_int => j /mem_range mem_j_range; rewrite /(\o) /=.
      rewrite ZqRing.mulrC ZqRing.mulrA eq_sym ZqRing.mulrAC eq_sym; congr; last first.
      - by rewrite bsrev2_ge //= modz_small //; apply/mem_range.
      rewrite /br !(IntID.mulrC _ 2) (bsrev_mulr_pow2 1) //= bsrev_involutive //.
      - by rewrite mem_range_mull // range_div_range.
      by rewrite mulKz // NTT_Fq.scale127E.
    rewrite eq_mod /=. move: (spec (bsrev 8 (i %/ 2 * 2)) 1 _ _) => /=.
    + by apply/(bsrev_dvdz_range 7 8) => //=; apply/dvdz_mull/dvdzz.
    + by apply mem_range.
    rewrite addrC (bsrev_add 7 8 _ 1) //.
    + by rewrite mulrC (bsrev_mulr_pow2 1 8) // range_div_range //= (bsrev_range 8).
    rewrite bsrev1 //= bsrev_involutive //= => {spec} [|->].
    + by rewrite mem_range_mulr // range_div_range.
    rewrite (BAdd.eq_big_perm _ _ _ (map (bsrev 7) (range 0 128))).
    + apply/uniq_perm_eq; [by apply/range_uniq| | ].
      - rewrite map_inj_in_uniq ?range_uniq // => x y mem_x_range mem_y_range.
        by apply/bsrev_injective.
      move => x; split => [mem_x_range|/mapP [y] [mem_y_range ->>]]; [apply/mapP; exists (bsrev 7 x)|].
      - by rewrite bsrev_involutive //= (bsrev_range 7).
      by rewrite (bsrev_range 7).
    rewrite BAdd.big_mapT BAdd.mulr_suml.
    apply BigDom.BAdd.eq_big_int => j /mem_range mem_j_range; rewrite /(\o) /=.
    rewrite ZqRing.mulrC ZqRing.mulrA eq_sym ZqRing.mulrAC eq_sym divzMDl //=; congr; last first.
    + rewrite addrC (bsrev_add 7 8 _ 1) //.
      - by apply/(bsrev_range 7).
      by rewrite bsrev1 //= bsrev2_ge //= modz_small //; apply/mem_range.
    rewrite /br !(IntID.mulrC _ 2) (bsrev_mulr_pow2 1) //= bsrev_involutive //.
    + by rewrite mem_range_mull // range_div_range.
    by rewrite mulKz // NTT_Fq.scale127E.
  qed.

  hoare bsrev_ntt_spec (p : coeff Array256.t) :
    NTT_bsrev.ntt :
      NTT_vars.zetas = NTT_Fq.zetas /\
      NTT_vars.r = p ==>
      ntt_spec res p.
  proof. by conseq bsrev_ntt (naive_ntt p) => /#. qed.

  hoare opt_ntt_spec (p : coeff Array256.t) :
    NTT_opt.ntt :
      NTT_vars.zetas = NTT_Fq.zetas /\
      NTT_vars.r = p ==>
      ntt_spec res p.
  proof. by conseq optimize_ntt (bsrev_ntt_spec p) => /#. qed.

  hoare ntt_spec (p : coeff Array256.t) :
    NTT_Fq.NTT.ntt :
      arg =(p, NTT_Fq.zetas) ==>
      ntt_spec res p.
  proof. by conseq inline_ntt (opt_ntt_spec p) => /#. qed.

  hoare bsrev_invntt_spec (p : coeff Array256.t) :
    NTT_bsrev.invntt :
      NTT_vars.zetas_inv = NTT_Fq.zetas_inv /\
      NTT_vars.r = p ==>
      invntt_spec res p.
  proof. by conseq bsrev_invntt (naive_invntt p) => /#. qed.

  hoare opt_invntt_spec (p : coeff Array256.t) :
    NTT_opt.invntt :
      NTT_vars.zetas_inv = NTT_Fq.zetas_inv /\
      NTT_vars.r = p ==>
      invntt_spec res p.
  proof. by conseq optimize_invntt (bsrev_invntt_spec p) => /#. qed.

  hoare invntt_spec (p : coeff Array256.t) :
    NTT_Fq.NTT.invntt :
      arg =(p, NTT_Fq.zetas_inv) ==>
      invntt_spec res p.
  proof. by conseq inline_invntt (opt_invntt_spec p) => /#. qed.

end NTTequiv.

  (* THESE RESULTS ARE TOP LEVEL FOR THE CORRECTNESS PROOF *)

  hoare ntt_spec_h _r :
    NTT_Fq.NTT.ntt :
      arg = (_r, NTT_Fq.zetas) ==>
      res = ntt _r.
  proof.
    conseq (_: arg = (_r, NTT_Fq.zetas) ==> NTTequiv.ntt_spec res _r).
    + by move => &hr ??; apply NTTequiv.imp_ntt_spec.
    by proc*; call (NTTequiv.ntt_spec _r).
  qed.

  hoare invntt_spec_h _r :
    NTT_Fq.NTT.invntt :
      arg = (_r, NTT_Fq.zetas_inv) ==>
      res = invntt _r.
  proof.
    conseq (_: arg = (_r, NTT_Fq.zetas_inv) ==> NTTequiv.invntt_spec res _r).
    + by move => &hr ??; apply NTTequiv.imp_invntt_spec.
    by proc*; call (NTTequiv.invntt_spec _r).
  qed.

lemma ntt_spec _r : phoare[ NTT_Fq.NTT.ntt : arg = (_r,NTT_Fq.zetas) ==> res = ntt _r ] = 1%r
  by conseq NTT_Fq.ntt_spec_ll (ntt_spec_h _r); done.

lemma invntt_spec _r:
   phoare[NTT_Fq.NTT.invntt :
     arg=(_r,NTT_Fq.zetas_inv) ==> res = invntt _r ] = 1%r
  by conseq NTT_Fq.invntt_spec_ll (invntt_spec_h _r); done.

