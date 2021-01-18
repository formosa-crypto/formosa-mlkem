require import AllCore Distr List SmtMap Dexcepted.
require (****) RndExcept StdOrder PKE H_MLWE.

theory MLWE_PKE.

clone import H_MLWE.

import StdOrder.IntOrder R Matrix_ Big.BAdd.
import H_MLWE_ROM Lazy.

type plaintext.
type ciphertext.

clone import PKE with 
  type pkey = (seed * vector),
  type skey = vector,
  type plaintext <- plaintext,
  type ciphertext <- ciphertext.
  (* proof *. reveals irrelevant axiom on qD,
     FIXME: we need to clean this in PKE *)

type raw_ciphertext = vector * R.

op m_encode : plaintext -> R. 
op m_decode : R -> plaintext.

op c_encode : raw_ciphertext -> ciphertext.
op c_decode : ciphertext -> raw_ciphertext.

(******************************************************************)
(*                    The Encryption Scheme                       *)

module ConcreteH : Oracle = {
  proc init() = {}
  proc o(sd : seed) = { return H sd;}
}.

module MLWE_PKE(H: POracle) : Scheme = {
  proc kg() : pkey * skey = {
    var sd,s,e,_A,t;
    sd <$ dseed;
    s  <$ dshort;
    e  <$ dshort;
    _A <@ H.o(sd);
    t  <- _A *^ s + e;
    return ((sd,t),s);
  }
  
  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var sd,t,r,e1,e2,_A,u,v;
    (sd,t) <- pk;
    r  <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    _A <@ H.o(sd);
    u  <- m_transpose _A *^ r + e1;
    v  <- (t `<*>` r) +& e2 +& (m_encode m);
    return (c_encode (u,v));
  }
  
  proc dec(sk : skey, c : ciphertext) : plaintext option = {
    var u,v;
    (u,v) <- c_decode c;
    return Some (m_decode (v -& (sk `<*>` u)));
  }
}.

module MLWE_PKE_H = MLWE_PKE(ConcreteH).

(******************************************************************)
(*                    Game Hopping Security                       *)
(******************************************************************)

(* Hop 1 *)

module MLWE_PKE1 = {
  proc kg() : pkey * skey = {
    var sd,s,t;
    sd <$ dseed;
    s  <$ dshort;
    t  <$ duni;
    return ((sd,t),s);
  }

  include MLWE_PKE_H [-kg]

}.

module B1(A : Adversary) : Adv_T = {

  proc kg(sd : seed, t : vector) : pkey * skey = {
    return ((sd,t),witness);
  }
  
  proc guess(sd : seed, t : vector, uv : vector * R) : bool = {
    var pk, sk, m0, m1, c, b, b';
    (pk,sk) <@ kg(sd,uv.`1);
    (m0, m1) <@ A.choose(pk);
    b <$ {0,1};
    c <@ MLWE_PKE_H.enc(pk, if b then m1 else m0);
    b' <@ A.guess(c);
    return b' = b;
  }
}.

section.

declare module A : Adversary.

lemma hop1_left &m: 
  Pr[CPA(MLWE_PKE_H,A).main() @ &m : res] =
  Pr[H_MLWE(B1(A)).main(false,false) @ &m : res].
proof.
byequiv => //. 
proc; inline *. 
wp; call(:true); auto => /=. 
call (:true); wp.
rnd{2}; wp; do 3! rnd{2}; auto.
qed.

lemma hop1_right &m: 
  Pr[H_MLWE(B1(A)).main(false,true) @ &m : res] = 
  Pr[CPA(MLWE_PKE1,A).main() @ &m : res].
proof.
byequiv => //.
proc;inline *. 
wp; call(:true); auto => /=.
call(:true); wp => /=.
rnd{1}; wp; do 2! rnd{1}.
rnd; wp; rnd{1}; auto.
qed.

end section.

(* Hop 2 *)

module MLWE_PKE2 = {

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
    var u, v;
    u <$duni;
    v <$duni_R;
    return (c_encode (u,v +& m_encode m));
  }

  include MLWE_PKE1 [-enc]

}.

module B2(A : Adversary) : Adv_T = {

  proc kg(sd : seed, t : vector) : pkey * skey = {
    return ((sd,t),witness);
  }
  
  proc enc(pk : pkey, m : plaintext, uv : vector * R) : ciphertext = {
    return (c_encode (uv.`1, uv.`2 +& m_encode m));
  }
  
  proc guess(sd : seed, t : vector, uv : vector * R) : bool = {
    var pk, sk, m0, m1, c, b, b';
    (pk,sk) <@ kg(sd,t);
    (m0, m1) <@ A.choose(pk);
    b <$ {0,1};
    c <@ enc(pk, if b then m1 else m0,uv);
    b' <@ A.guess(c);
    return b' = b;
  }

}.

section.

declare module A : Adversary.

lemma hop2_left &m: 
  Pr[CPA(MLWE_PKE1,A).main() @ &m : res] =
  Pr[H_MLWE(B2(A)).main(true,false) @ &m : res].
proof.
byequiv => //.
proc; inline *. 
swap {2} 7 -5.
swap {2} [11..12] -8.
swap {2} [14..17] -9.
seq 4 7 : (#pre /\ ={sd,t,pk} /\ pk{2}.`1 = sd{2} /\ pk{2}.`2 = t{2});
  first by wp;rnd; rnd{1}; rnd; auto.
swap {2} [11..13] -9.
by wp; call(_: true); wp; rnd{2}; wp; rnd; rnd{2}; wp; 
   rnd; rnd; wp; rnd; call(_: true); auto.
qed.

lemma hop2_right &m: 
  Pr[H_MLWE(B2(A)).main(true,true) @ &m : res] = 
  Pr[CPA(MLWE_PKE2,A).main() @ &m : res].
proof.
byequiv => //.
proc; inline *. 
swap {1} 7 -5.
swap {1} [11..12] -8.
swap {1} [14..17] -9.
seq 7 4 : (#pre /\ ={sd,t,pk} /\ pk{2}.`1 = sd{2} /\ pk{2}.`2 = t{2});
   first by wp;rnd;  rnd{2}; rnd; auto. 
swap {1} [11..13] -9.
by wp; call(_: true);wp;rnd;wp;rnd{1};rnd;wp;rnd{1};rnd{1};wp;rnd; 
   call(_: true); auto.
qed.

end section.

(* Final game analysis *)

section.

declare module A : Adversary.
axiom A_guess_ll : islossless A.guess.
axiom A_choose_ll : islossless A.choose.

local module Game2(A : Adversary) = {
  proc main() = {
    var sd, s, t, m0, m1, u, v, b, b';
    sd <$ dseed;
    s <$ dshort;
    t <$ duni;
    (m0, m1) <@ A.choose((sd,t));
    u <$duni;
    v <$duni_R;
    b' <@ A.guess(c_encode (u,v));
    b <$ {0,1};
    return b = b';
  }
}.

local lemma game2_equiv &m : 
  Pr[CPA(MLWE_PKE2,A).main() @ &m : res] = 
  Pr[Game2(A).main() @ &m : res].
proof.
byequiv => //.
proc; inline *.
swap {2} 8 -3.
call(_: true); wp.
rnd (fun z, z +& m_encode (if b then m1 else m0){2})
    (fun z, z -& m_encode (if b then m1 else m0){2}).
auto; call (_:true).
auto => /> *; split => *; [ ring | split => *; [ring | smt()]].
qed.

local lemma game2_prob &m :
  Pr[Game2(A).main() @ &m : res] = 1%r / 2%r.
proof.
byphoare => //. 
proc.
rnd  (pred1 b')=> //=.
conseq (: _ ==> true).
+ by move=> />; apply DBool.dbool1E.
islossless; [ apply A_guess_ll | apply A_choose_ll].
qed.

lemma main_theorem &m :
  Pr[CPA(MLWE_PKE_H,A).main() @ &m : res] -  1%r / 2%r =
    Pr[H_MLWE(B1(A)).main(false,false) @ &m : res] -
       Pr[H_MLWE(B1(A)).main(false,true) @ &m : res] + 
    Pr[H_MLWE(B2(A)).main(true,false) @ &m : res] -
       Pr[H_MLWE(B2(A)).main(true,true) @ &m : res].
proof.
rewrite (hop1_left A &m).
rewrite (hop1_right A &m).
rewrite (hop2_left A &m).
rewrite (hop2_right A &m).
rewrite (game2_equiv &m).
rewrite (game2_prob &m).
by ring.
qed.

end section.


(******************************************************************)
(*                        Correctness                             *)
(* We consider adversarial correctness, where the attacker can    *)
(* choose the message where correctness is checked after seeing   *)
(* the public-key. This setting seems to be the one in which      *)
(* failure probability is considered in the FO construction.      *)
(* We need to model H as a random oracle as we will assume A is   *)
(* uniform random. Strictly speaking we should probably model it  *)
(* as a QROM (to discuss)                                         *)
(******************************************************************)

module type CAdversary(H : POracle) = {
  proc find(pk: pkey, sk : skey) : plaintext
}.

module type SchemeRO(H : POracle) = {
  include Scheme
}.

module AdvCorrectness(S : SchemeRO, A : CAdversary, O : Oracle) = {
  proc main() : bool = {
    var pk, sk, c, m, m';
    O.init();
    (pk,sk) <@ S(O).kg();
    m <@ A(O).find(pk,sk);
    c <@ S(O).enc(pk, m);
    m' <@ S(O).dec(sk,c);

    return m' = Some m;
  }
}.

(* We want to prove a concrete bound on the probability of failure
   for Kyber. We will do so generically by first showing at this
   level that it all comes down to the noise distribution. *)

(* We express rounding errors as additive noise *)

op noise_exp _A s e r e1 e2 m = 
    let t = _A *^ s + e in
    let u = m_transpose _A *^ r + e1 in
    let v = (t `<*>` r) +& e2 +& (m_encode m) in
    let (u',v') = c_decode (c_encode (u,v)) in
        v' -& (s `<*>` u') -& (m_encode m).

(* We can derive the noise expression by introducing
   operators that compute the rounding error *)

op rnd_err_v : R -> R.
op rnd_err_u : vector -> vector.

axiom encode_noise u v :
   c_decode (c_encode (u,v)) = 
      (u + rnd_err_u u, v +& rnd_err_v v).

lemma matrix_props1 _A s e r :
  (_A *^ s + e) `<*>` r = 
  (s ^* m_transpose _A `<*>` r) +& (e `<*>` r).
proof. by rewrite dotpDl -mulmxTv trmxK. qed.

lemma matrix_props2 s _A r e1 cu :
  s `<*>` (m_transpose _A *^ r + e1 + cu) = 
  (s ^* m_transpose _A `<*>` r) +& 
    (s `<*>` e1) +& (s `<*>` cu).
proof. by rewrite !dotpDr dotpC dotp_mulmxv dotpC. qed.

lemma noise_exp_val _A s e r e1 e2 m :
  noise_exp _A s e r e1 e2 m = 
  let t = _A *^ s + e in
  let u = m_transpose _A *^ r + e1 in
  let v = (t `<*>` r) +& e2 +& (m_encode m) in
  let cu = rnd_err_u u in
  let cv = rnd_err_v v in
  ((e `<*>` r) -& (s `<*>` e1) -& (s `<*>` cu) +& e2) +& cv.
proof.
  rewrite /noise_exp /= encode_noise /= matrix_props1 matrix_props2; ring. 
qed.

(* The above noise expression is computed over the abstract
   rings that define the scheme. Noise bounds are checked and
   computed over the integers. *)

op max_noise : int.
op under_noise_bound : R -> int -> bool.

axiom good_decode m n :
  under_noise_bound n max_noise =>
  m_decode (m_encode m +& n) = m.

(* We now rewrite the correctness game in terms of noise *)

module AdvCorrectnessNoise(A : CAdversary, O : Oracle) = {
  proc main() = {
    var sd,s,e,_A,r,e1,e2,m,n;
    O.init();
    sd <$ dseed;
    _A <@ O.o(sd);
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    m <@ A(O).find((sd,_A *^ s + e),s);
    n <- noise_exp _A s e r e1 e2 m;
    return (!under_noise_bound n max_noise);
  }
}.

section.

declare module A : CAdversary {LRO}.
axiom A_ll (O <: POracle{A}): islossless O.o => islossless A(O).find.

lemma correctness &m :
  Pr[ AdvCorrectness(MLWE_PKE,A,LRO).main() @ &m : res]  >=
  1%r - Pr[ AdvCorrectnessNoise(A,LRO).main() @ &m : res].
proof.
rewrite (_: 1%r - Pr[ AdvCorrectnessNoise(A,LRO).main() @ &m : res] =
   Pr[ AdvCorrectnessNoise(A,LRO).main() @ &m : !res]).
rewrite Pr[mu_not]; congr => //. 
+ byphoare => //.
  by islossless; apply (A_ll LRO); islossless.
byequiv => //.
proc. 
inline MLWE_PKE(LRO).dec MLWE_PKE(LRO).enc MLWE_PKE(LRO).kg.
swap {2} 5 -2.
swap {2} 12 -8.
swap {2} [13..14] -6.
seq 9 14 : ( 
           ={LRO.m,e2,e1,r,s,e,sd} /\
           sd0{2} = sd{2} /\
           m0{2} = m{1} /\ 
           m0{2} = m{2} /\ 
           pk0.`1{2} = sd{2} /\
           pk0.`2{2} = t{2} /\
           sk{2} = s{2} /\
           t{2} = _A{2} *^ s{2} + e{2} /\
           t0{2} = t{2} /\
           pk0{2}.`1 \in LRO.m{2} /\
           _A{2} = _A{1} /\
           oget LRO.m{2}.[pk0.`1{2}] = _A{2}); last first.
+ inline *. auto => /> &2 -> ????.
  rewrite  encode_noise.
  rewrite (_: 
     (((oget LRO.m{2}.[pk0{2}.`1] *^ s{2} + e{2}) `<*>` r{2}) +&
     e2{2} +& m_encode m{2} +&
     rnd_err_v
       (((oget LRO.m{2}.[pk0{2}.`1] *^ s{2} + e{2}) `<*>` r{2}) +&
        e2{2} +& m_encode m{2}) -&
     (s{2} `<*>`
      (m_transpose (oget LRO.m{2}.[pk0{2}.`1]) *^ r{2} + e1{2} +
       rnd_err_u (m_transpose (oget LRO.m{2}.[pk0{2}.`1]) *^ r{2} + e1{2})))) = 
  m_encode m{2} +& noise_exp (oget LRO.m{2}.[pk0{2}.`1]) s{2} e{2} r{2} e1{2}
                     e2{2} m{2}); last by apply good_decode.
  by rewrite noise_exp_val /= matrix_props1 matrix_props2; ring.

auto => /=. 
seq 8 10 : ( #pre /\
           ={LRO.m,r,s,e,e1,e2,sd,_A} /\
           pk.`1{2} = sd{2} /\
           pk.`2{2} = t{2} /\
           sk{2} = s{2} /\
           t{2} = _A{2} *^ s{2} + e{2} /\
           pk{2}.`1 \in LRO.m{2} /\
           oget LRO.m{2}.[sd{2}] = _A{2}); last first.
+ exlim _A{2}, pk{2}.`1 => _A sd.
  call(_: ={glob LRO} /\ oget LRO.m{2}.[sd] = _A /\ sd \in LRO.m{2} ). 
  + by proc; auto => />; smt(get_setE).
  by auto => /> /#.
by inline *; auto;  smt(get_setE).
qed.

end section.

(* Now we shift things to make the upper bound computable as 
   based on a max over all messages. *)
op cv_bound : int.
axiom cv_bound_valid _A s e r e2 m :
  s \in dshort =>
  e \in dshort =>
  _A \in duni_matrix =>
  r \in dshort =>
  e2 \in dshort_R =>
  let t = _A *^ s + e in
  let v = (t `<*>` r) +& e2 +& (m_encode m) in
  under_noise_bound (rnd_err_v v) cv_bound.

axiom noise_commutes n n' (b : int) : 
  under_noise_bound n' b =>
  under_noise_bound n (max_noise - b) =>
  under_noise_bound (n +& n') max_noise.

op noise_exp_part_simpl u s e r e1 e2 = 
  let cu = rnd_err_u u in 
  ((e `<*>` r) -& (s `<*>` e1) -& (s `<*>` cu) +& e2 ).

op noise_exp_part _A s e r e1 e2 = 
  let u = m_transpose _A *^ r + e1 in
  noise_exp_part_simpl u s e r e1 e2.

module CorrectnessNoiseApprox = {
  proc main() = {
    var s,e,_A,r,e1,e2,n,u;
    _A <$ duni_matrix;
    r <$ dshort;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    u <- m_transpose _A *^ r + e1;
    n <- noise_exp_part_simpl u s e r e1 e2;
    return (!under_noise_bound n (max_noise - cv_bound));
  }
}.

(* FIXME: prove this lemma *)
axiom dshort0 : mu1 dshort zerov < 1%r.
axiom dshort_R_unit x : x \in dshort_R => x <> R.zeror => unit x.

(* FIXME move this *) 
lemma supp_dvector (d: R distr) v i: v \in dvector d => 0 <= i < Matrix_.size => v.[i] \in d.
move=> /supp_dmap [l /=] [] /supp_djoin [].
rewrite size_nseq ler_maxr 1:ge0_size => hl /allP /= hz -> hi.
rewrite offunvE 1:// &(hz (d, nth witness l i)) hl.
by apply/mem_zip_nseqL/mem_nth;rewrite -hl.
qed.

lemma dshort_unit : 
  forall v, v \in dshort \ pred1 zerov => exists i, 0 <= i < Matrix_.size /\ unit v.[i].
proof.
  move=> v /supp_dexcepted @/pred1 [] /supp_dvector hvi hv.
  case: (exists (i : int), (0 <= i && i < Matrix_.size) /\ unit v.[i]) => //. 
  move=> /negb_exists hunit; apply/hv/eq_vectorP; smt (dshort_R_unit).
qed.

(* FIXME: move this in RndExcept *)
abstract theory RndExcept1.

module type ADV = {
   proc main (r:vector) : bool
}.

module G1 (A:ADV) = {
  proc main () = {
    var r, b;
    r <$ dshort;
    b <- A.main(r);
    return b;
  }
}.

module G2 (A:ADV) = {
  proc main () = {
    var r, b;
    r <$ dshort \ pred1 zerov;
    b <- A.main(r);
    return b;
  }
}.

section.

declare module A:ADV.

local clone import RndExcept with
  type input <- unit,
  type t     <- vector,
  op   d     <- fun _ => dshort,
  type out   <- bool
  proof *.
realize d_ll. by move=> *; apply dshort_ll. qed.

local clone import Adversary with
  op test <- fun _ X => X = [Vector.zerov]
  proof *.
realize test_spec.
proof.
move=> _ X ->.
apply Dexcepted.dexcepted_ll; 1: by apply dshort_ll.
rewrite (mu_eq _ _ (pred1 zerov)) 1:// &(dshort0).
qed.

local clone import Bad
  proof *.

local module MADV (A:ADV) (O:SAMPLE_ADV)= {
  proc main () = {
    var r, b;
    r <@ O.sample((), [zerov]);
    b <- A.main(r);
    return b;
  }
}.


lemma Pr_except : islossless A.main =>
  forall &m, `| Pr[G1(A).main() @ &m : res] - Pr[G2(A).main() @ &m : res] | <= 
               mu1 dshort zerov.
proof.
  move=> A_ll &m.
  have /= := pr_A_upto (<:MADV(A)) _ (fun b _ => b) &m.
  + by move=> O O_ll; proc; call (A_ll); call O_ll.
  have : Pr[G1(A).main() @ &m : res] = 
         Pr[Main(R(Sample), MADV(A)).main() @ &m : res].
  + byequiv => //.  
    proc; inline *. rcondt{2} ^if; 1: by auto.
    by sim; auto. 
  have -> : Pr[G2(A).main() @ &m : res] =
            Pr[Main(R(SampleE), MADV(A)).main() @ &m : res].
  + byequiv => //.
    proc; inline *; rcondt{2} ^if; 1: by auto.
    by sim; auto.
  have /# : Pr[Main(R(SampleB), MADV(A)).main() @ &m : SampleB.bad] <= mu1 dshort zerov.
  byphoare => //.
  proc; inline *; rcondt ^if; 1: by auto.
  wp; seq 10 : SampleB.bad (mu1 dshort zerov) 1%r _ 0%r => //.
  + by wp; rnd (pred1 zerov); auto.
  by conseq (_: false).
qed.

end section.

end RndExcept1.

section.

declare module A : CAdversary {LRO}.
axiom All (O <: POracle{A}): islossless O.o => islossless A(O).find.

lemma correctness_slack &m :
  Pr[ AdvCorrectnessNoise(A,LRO).main() @ &m : res]<=
  Pr[ CorrectnessNoiseApprox.main() @ &m : res].
proof.
byequiv => //.
proc.
seq 8 6 : (#pre /\ ={s,e,_A,r,e1,e2} /\
            s{2} \in dshort /\
            e{2} \in dshort /\
           _A{2} \in duni_matrix /\
           r{2} \in dshort /\
           e2{2} \in dshort_R ).
+ inline *; auto => />; smt(get_setE mem_empty).
wp;call {1} (_: true ==> true). 
+ by apply (All LRO); smt(LRO_o_ll duni_matrix_ll).
skip;auto => />.
move => &1 &2 ssup esup _Asup rsup e2sup; rewrite noise_exp_val /=.
smt (noise_commutes cv_bound_valid).
qed.

lemma correctness_approx &m :
  Pr[ AdvCorrectness(MLWE_PKE,A,LRO).main() @ &m : res]  >=
  1%r - Pr[ CorrectnessNoiseApprox.main() @ &m : res].
proof. move : (correctness A All &m) (correctness_slack &m) => /#. qed.

(* Finally we just need to compute a concrete probability *)
(* Which we will bound in simplified form *)

lemma dmatrix_dvector (v : vector) i :
  0 <= i < Matrix_.size => unit v.[i] =>
  dmap duni_matrix (fun A => A *^ v) = duni.
proof.
move=> rg_i ut_vi; rewrite /duni_matrix dmatrix_dvector dmap_comp /(\o).
have -> : Matrix_.size = i + (Matrix_.size - (i + 1) + 1) by ring.
rewrite -cat_nseq 1,2:/# nseqS 1:/# djoin_perm_s1s dmap_dlet -/duni.
pose D := _ `*` _; rewrite -{2}(dlet_cst D duni).
+ by apply/dprod_ll; split; apply/djoin_ll=> d; rewrite mem_nseq => -[_ <-]; apply/duni_ll.
apply in_eq_dlet => //= ls /supp_dprod [] + _ - /supp_djoin [] + _.
rewrite size_nseq ler_maxr 1:/# => ->>; rewrite dmap_comp /(\o) /=.
move: rg_i ut_vi; (pose k := size  ls.`1) => rg_k ut_vk.
pose size := Matrix_.size; pose f (x : vector) :=  
  offunv (fun i => x.[i] * v.[k] + bigi (predC1 k)
    (fun j => (nth witness (ls.`1 ++ x :: ls.`2) j).[i] * v.[j]) 0 size).
rewrite -(eq_dmap duni f) => /= [x|].
+ apply eq_vectorP => i rg_i; rewrite /f mulmxvE offunvE //=.  
  rewrite (bigD1 _ _ k) 1:mem_range // 1:range_uniq /=; congr. 
  + by rewrite offunmE 1:/# /= nth_cat ltzz /= subrr. 
  by apply congr_big_seq => //= i0 /mem_range ? _ _; rewrite offunmE 1:/#.
pose finv (y : vector) := 
  offunv (fun i => (y.[i] - bigi (predC1 k)
    (fun j => (nth witness (ls.`1 ++ witness :: ls.`2) j).[i] * v.[j]) 0 size) / v.[k]).
apply (dmap_bij duni duni f finv).
+ by move=> x _; apply/duni_fu.
+ by move=> *; apply duni_funi.
+ move=> x _ @/f @/finv; apply: eq_vectorP => i rg_i.
  do! rewrite offunvE //=; pose z1 := big _ _ _; pose z2 := big _ _ _.
  rewrite (_ : z2 = z1); last first.
  + by rewrite -addrA subrr addr0 mulrK.
  by apply: eq_bigr => j @/predC1 ne_jk /=; do 2! congr; smt(nth_cat).
+ move=> x _ @/f @/finv; apply: eq_vectorP => i rg_i.
  do! rewrite offunvE //=; pose z1 := big _ _ _; pose z2 := big _ _ _.
  rewrite mulrAC mulrK //; rewrite (_ : z2 = z1); last first.
  + by rewrite -addrA addNr addr0.
  by apply: eq_bigr => j @/predC1 ne_jk /=; do 2! congr; smt(nth_cat).
qed.

(* We will jump to this game where instead of the real
   distribution of u and r, we use an idealized one where
   they are independent. *)
module CorrectnessBound = {
  proc main() = {
    var s,e,u,r,e1,e2,n;
    s <$ dshort;
    e <$ dshort;
    u <$ duni;
    r <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    n <- noise_exp_part_simpl u s e r e1 e2;
    return (!under_noise_bound n (max_noise - cv_bound));
  }
}.

local clone import RndExcept1 as RndExcept1'.

local module AdvCorrectnessBound = {
  proc main(r:vector) = {
    var s,e,u,e1,e2,n;
    s <$ dshort;
    e <$ dshort;
    u <$ duni;
    e1 <$ dshort;
    e2 <$ dshort_R;
    n <- noise_exp_part_simpl u s e r e1 e2;
    return (!under_noise_bound n (max_noise - cv_bound));
  }
}.

local module AdvCorrectnessNoiseApprox = {
  proc main(r:vector) = {
    var s,e,_A,e1,e2,n,u;
    _A <$ duni_matrix;
    s <$ dshort;
    e <$ dshort;
    e1 <$ dshort;
    e2 <$ dshort_R;
    u <- m_transpose _A *^ r + e1;
    n <- noise_exp_part_simpl u s e r e1 e2;
    return (!under_noise_bound n (max_noise - cv_bound));
  }
}.

import Vector.ZModule.

local module AUX = {
  proc f (r:vector) = {
    var _A;
    _A <$ duni_matrix;
    return _A *^ r;
  }

  proc g () = {
    var u;
    u <$ duni;
    return u;
  } 
}.

local equiv AUX_fg : AUX.f ~ AUX.g : r{1} \in dshort \ pred1 zerov ==> ={res}.
proof.
bypr (res{1}) (res{2}) => // &1 &2 a /dshort_unit [i [h1 h2]].
have -> : Pr[AUX.g() @ &2 : res = a] = mu1 duni a.
+ byphoare => //.
  by proc; rnd; skip.
have -> : Pr[AUX.f(r{1}) @ &1 : res = a] = 
            mu1 (dmap duni_matrix (fun _A => _A *^ r{1})) a.
+ byphoare (: r = r{1} ==> res = a) => //.
  by proc; rnd; skip => />; rewrite (dmapE duni_matrix).
by rewrite (dmatrix_dvector r{1} i h1 h2).
qed.

local equiv NoiseApprox_Bound : 
  G2(AdvCorrectnessNoiseApprox).main ~ G2(AdvCorrectnessBound).main : true ==> ={res}.
proof.
  proc; inline *; swap 2 5; wp.
  rewrite /noise_exp_part /noise_exp_part_simpl /=.
  swap{1} [1..2] 4; swap{2} 1 2. 
  swap{2} [3..4] 2.
  seq 5 5 : (={e,e1,e2,r,s} /\ r{1} \in dshort \ pred1 zerov); 1: by auto.
  conseq (_: u{2} = m_transpose _A{1} *^ r{1} + e1{1}); 1: done.
  transitivity{1} { _A <$ duni_matrix; }
    ( ={r,e1} ==> _A{1} = m_transpose _A{2} /\ ={r,e1})
    ( r{1} \in dshort \ pred1 zerov ==> u{2} = _A{1} *^ r{1} + e1{1} ) => />; 1:smt().
  + by move=> *; rewrite trmxK.
  + rnd m_transpose; skip => />.
    by split=> *; rewrite trmxK.
  transitivity{1} { u <- AUX.f(r); }
    ( ={r,e1} ==> _A{1} *^ r{1} = u{2} /\ ={e1})
    ( r{1} \in dshort \ pred1 zerov ==> u{2} = u{1} + e1{1} ) => />; 1:smt().
  + by inline *; auto.
  transitivity{1} { u <@ AUX.g(); } 
    ( ={e1} /\ r{1} \in dshort \ pred1 zerov ==> ={u,e1})
    ( true ==> u{2} = u{1} + e1{1} ) => />; 1: smt(); last first.
  + inline *;wp.
    rnd (fun u => u + e1{1}) (fun u => u + - e1{1}); skip => /> &1; split => *.
    + by rewrite addrNK.
    by rewrite -addrA subrr addr0.
  by call AUX_fg.
qed.

(* This jump is assumed to introduce no slack in the
   Kyber proposal. 
   We need to figure out how to bound it. *)
(* FIXME *)
op epsilon_hack : real = 2%r * mu1 dshort zerov.

lemma correctness_hack &m :
  `| Pr[CorrectnessNoiseApprox.main() @ &m : res] - 
     Pr[CorrectnessBound.main() @ &m : res] | <= epsilon_hack 
.
proof.
  have := Pr_except AdvCorrectnessNoiseApprox _ &m.
  + by islossless.
  have :=  Pr_except AdvCorrectnessBound _ &m.
  + by islossless.
  have -> : Pr[G1(AdvCorrectnessBound).main() @ &m : res] = 
            Pr[CorrectnessBound.main() @ &m : res].
  + byequiv => //.
    by proc; inline *; swap{2} 4 - 3; wp; sim.
  have -> : Pr[G1(AdvCorrectnessNoiseApprox).main() @ &m : res] =
            Pr[CorrectnessNoiseApprox.main() @ &m : res].
  + byequiv => //.
    by proc; inline *; swap{2} 2 -1; wp; sim.
  have -> /# :
    Pr[G2(AdvCorrectnessNoiseApprox).main() @ &m : res] =
    Pr[G2(AdvCorrectnessBound).main() @ &m : res].
  by byequiv NoiseApprox_Bound.
qed.
   
op fail_prob : real.

axiom fail_prob &m : 
  Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob.

lemma correctness_bound &m :
  Pr[ AdvCorrectness(MLWE_PKE,A,LRO).main() @ &m : res]  >=
  1%r - fail_prob - epsilon_hack.
proof.
move: (fail_prob &m) (correctness_hack &m) (correctness_approx &m) => /#.
qed.

end section.

end MLWE_PKE.
