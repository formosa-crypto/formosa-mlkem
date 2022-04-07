require import AllCore ZModP IntDiv Distr List DList PKE_Ext.
from Jasmin require import JWord.
require import Array32 Array64 Array128 Array168 Array256 Array384.
require import Array768 Array960 Array1024 Array1152.

(**************************************************)
(* Aux stuff needed for compression/decompression *)
(**************************************************)

lemma ceil_floor x : (ceil x)%r <> x => ceil x = floor x + 1.
proof. smt(ceil_bound floor_bound). qed.

lemma floor_ceil x : (floor x)%r <> x => floor x = ceil x - 1.
proof. smt(ceil_bound floor_bound). qed.

lemma ceilN x : (ceil x)%r <> x => ceil x = -(ceil (-x)) + 1.
proof. smt(ceil_bound floor_bound). qed.

lemma floorN x : (floor x)%r <> x => floor x = -(floor (-x)) - 1.
proof. smt(ceil_bound floor_bound). qed.

lemma ceil_floor_int(x : real) : (floor x)%r = x <=> (ceil x)%r = x by smt(@Real). 

(* Are these needed? *)
axiom notintS (x : real): (floor x)%r <> x => (floor (x + 1%r))%r <> x + 1%r.
axiom floorS (x : real) : floor (x + 1%r) = floor x + 1. 

lemma floor_shift (x : real) (y : int) : floor (x + y%r) = floor x + y. 
proof.
have poscase : forall xx n , 
   0 <= n =>  floor (xx + n%r) = floor xx + n 
     by move => xx n;elim /natind:n;smt(@Real floorS).
case (y < 0); last by smt().
case ((floor x)%r = x); first by smt(@Real).
move => notint yneg; rewrite floorN => //; first last. 
+ have -> : -(x + y%r) = -x + ((-y)%r) by smt().
  rewrite (poscase (-x) (-y)); 1 : smt().
  rewrite floorN => //; smt(@Real).
+ have -> : y%r = (-((-y)%r)); 1 : smt().
have ynegpos : (0 <= -y); 1 : smt(). 
move : ynegpos; elim /natind:(-y); smt(floorS).
qed.

(* These could go somewhere in Real *)
op round(x : real) : int = floor (x + inv 2%r).

lemma round_notie (x : real) : 
   floor (x + inv 2%r) <> ceil (x + inv 2%r)  => round x = -(round (-x))
      by smt(floorN floor_shift @Real).

lemma round_tie (x : real) : 
   floor (x + inv 2%r) = ceil (x + inv 2%r) => round x =  -(round (-x)) + 1
     by rewrite /round; smt(@Real).

lemma round_add (x : real) (y : int) :
    round (y%r + x) = y + round x by rewrite /round; smt(floor_shift @Real).
(**************************************************)
(**************************************************)
(**************************************************)

(* We will model the three usages of SHA3 family 
   components as independent random oracles 

G = fn _sha3512_32(reg ptr u8[64] out, reg const ptr u8[32] in) -> stack u8[64]
XOF =
fn _shake128_absorb34(reg ptr u64[25] state, reg const ptr u8[34] in) -> reg ptr u64[25]
fn _shake128_squeezeblock(reg ptr u64[25] state, reg ptr u8[SHAKE128_RATE] out) -> 
    reg ptr u64[25], reg ptr u8[SHAKE128_RATE] => RATE is 168
PRF = fn _shake256_128_33(reg ptr u8[128] out, reg const ptr u8[33] in) -> stack u8[128]

*)

clone import PKE_Ext as KyberPKE with
  type RO.in_t = W8.t Array32.t * W8.t * W8.t * int,
  type RO.out_t = W8.t Array168.t,
  type pkey = W8.t Array1152.t * W8.t Array32.t,
  type skey = W8.t Array1152.t,
  type plaintext = W8.t Array32.t,
  type ciphertext = W8.t Array960.t * W8.t Array128.t.

(****************************************************)
(*               The finite field Zq/Fq             *)
(****************************************************)

op q : int = 3329 axiomatized by qE.
axiom prime_q : prime q.

clone import ZModField as Zq with 
  op p <- q 
  rename "zmod" as "Fq"
  rename "ZModp" as "Zq"
  proof  prime_p by apply prime_q.

(* Signed representation: could go in Fq *)

op as_sint(x : Fq) = if (q-1) %/ 2 < asint x then asint x - q else asint x.
lemma as_sint_range x :  - (q-1) %/2 <= as_sint x <= (q-1) %/2 by smt(rg_asint).

(* Compression and decompression are used as operations between 
   polynomials over Fq, but we first define the basic operations 
   over coefficients. *)
op compress(d : int, x : Fq) : int = round ((2^d)%r / q%r * (asint x)%r) %% 2^d.
op decompress(d : int, x : int) : Fq = inFq (round (q%r / (2^d)%r * x%r)).

(* This, however, raises the issue of how to convert from Zq to
   the reals when computing the error bounds. 
   Compression seems to be robust to using either
   asint or assint as we prove below. Decompression *must* use
   asint, as it assumes an input between 0..2^d-1. *)

axiom noties_s d x xr : (* Checked in Sage *)
   0 <= d => 2^d < q => x <> Zq.zero =>
        xr = ((2 ^ d)%r * (as_sint x)%r / q%r) =>
          floor (xr + inv 2%r) <> ceil (xr + inv 2%r).

axiom noties_u d x xr : (* Checked in Sage *)
   0 <= d => 2^d < q => x <> Zq.zero =>
        xr = ((2 ^ d)%r * (asint x)%r / q%r) =>
          floor (xr + inv 2%r) <> ceil (xr + inv 2%r).

lemma compress_sint x d : 
   0 <= d => 2^d < q =>
   compress d x = round ((2^d)%r / q%r * (as_sint x)%r) %% 2^d.
proof.
move => dlb dub;rewrite /compress => />.
case ((q - 1) %/ 2 < asint x); last by rewrite /as_sint; auto => />. 
case (x = Zq.zero); first by smt(@Zq).
move => H H0. 
pose xr := ((2 ^ d)%r * (as_sint x)%r / q%r).
rewrite (round_notie xr (noties_s d x xr dlb dub H _)) => //.
have -> : -xr =  (2 ^ d)%r - (2 ^ d)%r * (asint x)%r / q%r by rewrite /xr /as_sint; smt(@Real).
rewrite round_add.
have -> : - (2 ^ d + round (- (2 ^ d)%r * (asint x)%r / q%r)) = (- 2^d) + (- round (- (2 ^ d)%r * (asint x)%r / q%r)) by smt().
rewrite -modzDm.
have -> : (- 2 ^ d) %% 2 ^ d = 0 by smt(modzNm modz0). 
simplify.
pose xr' := ((2 ^ d)%r * (asint x)%r / q%r).
rewrite (round_notie xr' (noties_u d x xr' dlb dub H _)) => //.
by rewrite modz_mod.
qed.


(* These operations introduce a rounding error, which we see additively *)
op compress_err(d : int, c: Fq) : Fq =  (decompress d (compress d c)) + (-c).

lemma decompress_errE c d : 
   0 <= d => 2^d < q => decompress d (compress d c) = c + (compress_err d c)
   by rewrite /compress_err => *; ring.

(* This lemma is stated in the Spec *)
lemma compress_decompress x x' d : 
   0 <= d => 2^d < q =>
    x' = decompress d (compress d x) =>
     `| as_sint (x' - x) | <= round (q%r / (2^(d+1))%r).
(* The alternative using as_sint x' - as_sint x does not hold (checked in sage). *)
admitted. (* compress and decompress max distance  (checked in sage). *)

(* As a corollary we get a bound on the additive error term *)
lemma compress_err_bound c d : 
   0 <= d => 2^d < q =>
     `| as_sint (compress_err d c) | <= round (q%r / (2^(d+1))%r)
    by smt(compress_decompress).

(*******************************************************)
(* This is an extension of the spec with alternative   *)
(*   ways to compute compression and decompression, as *)
(*   well as defining rounding errors additively       *)
(*******************************************************)

(* This is the implementation of compress d in C/Jasmin for d = 1,4 *)
op compress_alt(d : int, c : Fq) : int =
    (asint c * 2^d + ((q + 1) %/ 2)) * (2^28 %/ q) %/ 2^28 %% 2^d.

lemma compress_alt_compress c d :    
   1 <= d <=4 =>
      compress_alt d c = compress d c.
admitted. (* alternative compress[1,2,4] expression: checked in sage *)

(* This is the implementation of compress d in C/Jasmin for d = 10 *)
op compress_alt_large (c : Fq) : int = 
   (asint c * 2 ^ 10 + (q + 1) %/ 2) * (2 ^ 32 %/ q) %/ 2 ^ 32 %% 2 ^ 10.

lemma compress_alt_compress_large (c : Fq): 
    compress_alt_large c = compress 10 c.
admitted. (* alternative compress[10] expression : checked in Sage *)

(* This is the implementation of decompress d in C/Jasmin *)
op decompress_alt(d : int, c : int) : Fq = 
    inFq (((c * q + 2^(d-1)) %/ 2^d)).

lemma decompress_alt_decompress c d : 
   0 < d => d<=10 =>
    decompress_alt d c = decompress d c.
admitted. (* alternative decompress expression: checked in sage *)

(** End extension *)

(* Encoding/decoding of Booleans as field elements *)
op trueval : Fq = inFq ((q+1) %/ 2).
op falseval : Fq = Zq.zero.

lemma trueval_int : asint trueval = ((q+1) %/ 2) by smt(@Zq).
lemma falseval_int : asint falseval = 0 by smt(@Zq).

op b_encode(b: bool): Fq =
  if b then trueval else falseval.

lemma b_encode_int (b : bool) :
   asint (b_encode b) = 
    if b then (q+1) %/ 2 else 0 by smt(trueval_int falseval_int).

op b_decode(c: Fq) : bool = ! `| as_sint c| < q %/ 4 + 1.

(* The spec uses compress and decompress to do encode/decode,
   so these should be true *)
lemma b_encode_sem c :
 b_encode c = decompress 1 (if c then 1 else 0)
by rewrite /b_encode -decompress_alt_decompress /decompress_alt //; smt(qE).


lemma b_decode_sem c :
   compress 1 c = if b_decode c then 1 else 0
by rewrite /b_decode -compress_alt_compress /compress_alt //=; smt(qE rg_asint).

(****************************************************)
(*               Distributions over Fq              *)
(*   We will have two views: the operator semantics *)
(*  will be used to reason about security/failures. *)
(*  The equivalent imperative version will be used  *)
(*  to relate the security proof to the implem.     *)
(*  These distrubutions over Fq are then used to    *)
(*  define distributions over poly/R by sampling    *)
(*  each coefficient independently.                 *)
(****************************************************)

(* The binomial distribution over a field element *)

op [lossless]dshort_elem : Fq distr. 

(* Definition of the support *)
axiom supp_dshort_elem x : 
   x \in dshort_elem <=>
    let xsi = if q %/2 <= asint x 
               then asint x - q 
               else asint x
    in -2 <= xsi <= 2.

(* Probability of each value in the support *)
axiom dshort_elem1E_2 : mu1 dshort_elem (inFq 2) = 1%r / 16%r.
axiom dshort_elem1E_m2 : mu1 dshort_elem (inFq (q-2)) = 1%r / 16%r.
axiom dshort_elem1E_1 : mu1 dshort_elem (inFq 1) = 1%r / 4%r.
axiom dshort_elem1E_m1 : mu1 dshort_elem (inFq (q-1)) = 1%r / 4%r.
axiom dshort_elem1E_0 : mu1 dshort_elem (inFq (0)) = 3%r / 8%r. 

(* The uniform distribution over a field element *)

op [lossless]duni_elem : Fq distr.

(* Definition of the support *)
axiom supp_duni_elem x : 0 <= asint x < q <=> x \in duni_elem.

(* The probability of each value in the support. *)
op pe = 1%r /q%r.
axiom duni_elem1E x : mu1 duni_elem x = pe.

lemma duni_elem_uni : is_uniform duni_elem 
   by rewrite /is_uniform => *; rewrite !duni_elem1E.

lemma duni_elem_fu : is_full duni_elem by 
   rewrite /is_full /support => x; rewrite duni_elem1E; smt(qE).

(*****************************************************)
(* Representations of polynomials in Zq[X]/(X^256+1) *)
(*****************************************************)

theory Poly.

(* Fixme: These definitions should come from a polynomial theory? *)

type poly = Fq Array256.t.

op zero : poly = Array256.create Zq.zero.
op one : poly = zero.[0<-Zq.one].

(* Ring multiplication: schoolbook multiplication in this
   ring is essentially generating a square matrix of coefficient
   multiplications and summing over the columns. 
   Fix me: should we just pass the ntt base mul when we
   instantiate MLWE? *)
op (&*) (pa pb : poly) : poly =
  Array256.init (fun (i : int) => foldr (fun (k : int) (ci : Fq) =>
     if (0 <= i - k) 
     then ci + pa.[k] * pb.[i - k] 
     else ci - pa.[k] * pb.[256 - (i - k)]) 
      Zq.zero (iota_ 0 256)).

op (&+) (pa pb : poly) : poly = 
  map2 (fun a b : Fq  => Zq.(+) a b) pa pb.

op (&-) (p : poly) : poly =  map Zq.([-]) p.

(* End Fixme *)

(* Compression/decompression of polys *)

op compress_poly(d : int, p : poly) : int Array256.t =  map (compress d) p.

op decompress_poly(d : int, p : int Array256.t) : poly =  map (decompress d) p.

op compress_poly_err(d : int, p : poly) : poly =  map (compress_err d) p.

lemma round_poly_errE p d : p &+ (compress_poly_err d p) = decompress_poly d (compress_poly d p).
proof. 
rewrite /compress_poly_err /decompress_poly /(&+); apply Array256.ext_eq => /> x xl xh.
rewrite map2iE //= mapiE //= !mapiE // /compress_err. by ring.
qed.

(* The distribution of ring elements of small norm as an operator *)

op dshort_R : poly distr =  dmap (dlist dshort_elem 256) (Array256.of_list witness).

lemma dshort_R_ll : is_lossless dshort_R
 by rewrite /dshort_R; apply dmap_ll; apply dlist_ll; apply dshort_elem_ll.

(* The uniform distribution of ring elements as an operator *)

op duni_R : poly distr =  dmap (dlist duni_elem 256) (Array256.of_list witness).

lemma duni_R_ll : is_lossless duni_R
 by rewrite /duni_R; apply dmap_ll; apply dlist_ll; apply duni_elem_ll.

lemma duni_R_uni : is_uniform duni_R.
  rewrite /Poly.duni_R => x y xin yin.
  apply (dmap_uni_in_inj _ _ _) => //; last by
    apply dlist_uni; apply duni_elem_uni.
  move => x0 y0 inx iny; rewrite /of_list tP => H.
  apply (eq_from_nth witness); 1: by smt(supp_dlist_size).
  move => i; have -> : size x0 = 256 by smt(supp_dlist_size).
  by move => ib; move : (H i ib); rewrite !initiE /=.
qed.

lemma duni_R_fu : is_full duni_R.
  rewrite /is_full /Poly.duni_R => p.
  rewrite supp_dmap; exists (Array256.to_list p).
  split.
    rewrite supp_dlist //; split; first by rewrite size_to_list.
    rewrite allP => *. 
    by rewrite -supp_duni_elem; smt(@Zq).
    by rewrite Array256.to_listK.
qed.

module type G_t(O : RO.POracle) = {
   proc sample(seed : W8.t Array32.t) : (W8.t Array32.t) *  (W8.t Array32.t)
}.

module type XOF_t(O : RO.POracle) = {
   proc init(rho :  W8.t Array32.t, i j : W8.t) : unit
   proc next_bytes() : W8.t Array168.t
}.

(* We take some liberty to specify parse using a XOF that
   returns 168 bytes at a time, which is what the Kyber
   implementation does. *)
module Parse(XOF : XOF_t, O : RO.POracle) = {
   proc sample_real() : poly = {
      var j, b168, bi, bi1, bi2, d1, d2,k;
      var aa : poly;
      aa <- witness;
      j <- 0;
      while (j < 256) {
         b168 <@ XOF(O).next_bytes();
         k <- 0;
         while ((j < 256) && (k < 168)) {
            bi  <- b168.[k];
            bi1 <- b168.[k+1];
            bi2 <- b168.[k+2];
            k <- k + 3;
            d1 <- to_uint bi        + 256 * (to_uint bi1 %% 16);
            d2 <- to_uint bi1 %/ 16 + 16  * to_uint bi2;
            if (d1 < q)                { aa.[j] <- inFq d1; j <- j + 1; }
            if ((d2 < q) && (j < 256)) { aa.[j] <- inFq d2; j <- j + 1; }
         }
      }
      return aa;
   }

   proc sample_ideal() : poly = {
      var aa;
      aa <$ duni_R;
      return aa;
   }
}.

module type PRF_t(O : RO.POracle) = {
   proc init(sig : W8.t Array32.t) : unit
   proc next_bytes(_N : W8.t) : W8.t Array128.t
}.

module CBD2(PRF : PRF_t, O : RO.POracle) = {
   proc sample_real(_N : int) : poly = {
      var i,j,a,b,bytes;
      var rr : poly;
      rr <- witness;
      bytes <@ PRF(O).next_bytes(W8.of_int _N);
      i <- 0; j <- 0;
      while (i < 128) { (* unroll loop body once to match code *)
        a <- b2i bytes.[i].[j %% 2 * 4 + 0] + b2i bytes.[i].[j %% 2 * 4 + 1];
        b <- b2i bytes.[i].[j %% 2 * 4 + 2] + b2i bytes.[i].[j %% 2 * 4 + 3];
        rr.[j] <- inFq  (a - b);
        j <- j + 1;
        a <- b2i bytes.[i].[j %% 2 * 4 + 0] + b2i bytes.[i].[j %% 2 * 4 + 1];
        b <- b2i bytes.[i].[j %% 2 * 4 + 2] + b2i bytes.[i].[j %% 2 * 4 + 3];
        rr.[j] <- inFq  (a - b);
        j <- j + 1;
        i <- i + 1;
      }
      return rr;
   }

   proc sample_ideal() : poly = {
      var rr;
      rr <$ dshort_R;
      return rr;
   }
}.

(* The NTT operation over ring elements 

We give here the mathematical specification of the NTT in
a way that roughly matches what is described in the spec.

Then we will have an NTT.ec file where we prove that 1) the imperative
specs are equivalent to these operators and 2) that these operators have
the properties we require to show that Kyber is correct up to some
decryption failure bound.

*)

require (****) Bigalg.
  clone import Bigalg.BigComRing as BigDom with
    type  CR.t     <- Fq,
      op  CR.zeror <- Zq.zero,
      op  CR.oner  <- Zq.one,
      op  CR.(+)   <- Zq.(+),
      op  CR.([-]) <- Zq.([-]),
      op  CR.( * ) <- Zq.( * ),
      op  CR.invr  <- Zq.inv,
    pred  CR.unit  <- Zq.unit
    proof CR.*.

  realize CR.addrA     by apply ZqRing.addrA.
  realize CR.addrC     by apply ZqRing.addrC.
  realize CR.add0r     by apply ZqRing.add0r.
  realize CR.addNr     by apply ZqRing.addNr.
  realize CR.oner_neq0 by apply ZqRing.oner_neq0.
  realize CR.mulrA     by apply ZqRing.mulrA.
  realize CR.mulrC     by apply ZqRing.mulrC.
  realize CR.mul1r     by apply ZqRing.mul1r.
  realize CR.mulrDl    by apply ZqRing.mulrDl.
  realize CR.mulVr     by apply ZqRing.mulVr.
  realize CR.unitP     by apply ZqRing.unitP.
  realize CR.unitout   by apply ZqRing.unitout.

op zroot = inFq 17.

op br(i : int) = BitEncoding.BS2Int.bs2int (BitEncoding.BS2Int.int2bs 7 i).

op ntt(p : poly) = Array256.init (fun i => 
   if i %% 2  = 0 
   then let ii = i %/ 2  in 
        BAdd.bigi predT (fun j => p.[2*j]   * ZqRing.exp zroot ((2 * br ii + 1) * j)) 0 128
   else let ii = (i-1) %/ 2 in 
        BAdd.bigi predT (fun j => p.[2*j+1] * ZqRing.exp zroot ((2 * br ii + 1) * j)) 0 128) 
           axiomatized by nttE.

op invntt(p : poly) = Array256.init (fun i => 
   if i %% 2  = 0 
   then let ii = i %/ 2  in 
        BAdd.bigi predT (fun j => (inv (inFq 128)) * p.[2*j] * ZqRing.exp zroot (-((2 * br ii + 1) * j))) 0 128
   else let ii = (i-1) %/ 2 in 
        BAdd.bigi predT (fun j => (inv (inFq 128)) * p.[2*j+1] * ZqRing.exp zroot (-((2 * br ii + 1) * j))) 0 128) 
          axiomatized by invnttE.

(* This is multiplication of two degree-1 polynomials in Fq
    modulo X^2 - zroot.
  
    (a1 + a2 X) * (b1 + b2 X) mod (X^2 - zroot) = 

    (a2b2zroot + a1b1) + (a1b2 + a2b1)X 


    And its extension to two products, one over   
    (X^2 - zroot) and another one over (X^2 + zroot)
 *)
op cmplx_mul (a :Fq * Fq, b : Fq * Fq, zzeta : Fq) : Fq * Fq =
     (a.`2 * b.`2 * zzeta + a.`1*b.`1, a.`1 * b.`2 + a.`2 * b.`1).

(* The base multiplication in the NTT domain is defined in the
   spec as follows. *)

op basemul(a b : poly) :  poly = Array256.init (fun i =>
   if i %% 2  = 0 
   then let ii = i %/ 2     in 
       (cmplx_mul (a.[2*ii],a.[2*ii+1]) (b.[2*ii],b.[2*ii+1]) (ZqRing.exp zroot ((2 * br ii + 1)))).`1
   else let ii = (i-1) %/ 2 in 
       (cmplx_mul (a.[2*ii],a.[2*ii+1]) (b.[2*ii],b.[2*ii+1]) (ZqRing.exp zroot ((2 * br ii + 1)))).`2).


(* END: NTT *)

end Poly.

export Poly.

op kvec : int = 3. 
(* axiom kvec_ge3 : 3 <= kvec. *)

require Matrix.
clone import Matrix as KMatrix with
    op size <- kvec,
    type ZR.t = poly,
    op ZR.zeror <- Poly.zero,
    op ZR.oner <- Poly.one,
    pred ZR.unit = fun x => x = Poly.one,
    op ZR.(+) <- Poly.(&+),
    op ZR.([-]) <- Poly.(&-),
    op ZR.( * ) <- Poly.(&*)
    proof ZR.addrA by admit (* poly theory? *)
    proof ZR.addrC by admit (* poly theory? *)
    proof ZR.add0r by admit (* poly theory? *)
    proof ZR.addNr by admit (* poly theory? *)
    proof ZR.oner_neq0 by admit  (* poly theory? *)
    proof ZR.mulrA by admit  (* poly theory? *)
    proof ZR.mulrC by admit (* poly theory? *)
    proof ZR.mul1r by admit (* poly theory? *)
    proof ZR.mulrDl by admit  (* poly theory? *)
    proof ZR.mulVr by admit (* poly theory? *)
    proof ZR.unitP by admit (* poly theory? *)
    proof ZR.unitout by admit (* poly theory? *)
    proof ZR.mulf_eq0 by admit. (* poly theory? *)

instance ring with R
  op rzero = Poly.zero
  op rone  = Poly.one
  op add   = Poly.(&+)
  op opp   = Poly.(&-)
  op mul   = Poly.(&*)
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

import Vector.

(* This should be added to matrix *)
 op "_.[_<-_]" (m : matrix) (ij : int * int) (c : poly) : matrix = 
     offunm (fun i j => if (i,j) = ij then c else (tofunm m) i j).
 
op set (v : vector) (i : int) (c : poly) : vector = 
     offunv (fun i' => if i = i' then c else (tofunv v) i').

op mapm(f : poly -> poly, m : matrix) = offunm (fun i j => f (tofunm m i j)).
op mapv(f : poly -> poly, v : vector) = offunv (fun i => f (tofunv v i)).
(***********)

op nttv v = mapv ntt v.
op nttm m = mapm ntt m.
op invnttv v = mapv invntt v.
op invnttm m = mapm invntt m.

op ntt_mmul(m : matrix, v : vector) : vector = 
   offunv (fun (i : int) => (Big.BAdd.bigi predT (fun (j : int) => basemul m.[i, j] v.[j]) 0 kvec)).

op ntt_dotp(v1 v2 : vector) : poly = 
   Big.BAdd.bigi predT (fun (i : int) => basemul v1.[i] v2.[i]) 0 kvec.

(****************)
(****************)
(*  Encoding    *)
(****************)
(****************)

type ipoly = int Array256.t.
op toipoly(p : poly) : ipoly = map asint p.
op ofipoly(p : ipoly)  : poly = map inFq p.

type ipolyvec = int Array768.t.

op [a] subarray256(x : 'a Array768.t, i : int) =
   Array256.init (fun k => x.[256*i + k]).

op [a] fromarray256(a0 a1 a2 : 'a Array256.t) : 'a Array768.t = 
   Array768.init (fun k => if 0 <= k < 256
                  then a0.[k]
                  else if 256 <= k < 512
                       then a1.[k-256] 
                       else a2.[k-512]).   

op [a] subarray384(x : 'a Array1152.t, i : int) =
   Array384.init (fun k => x.[384*i + k]).

op [a] fromarray384(a0 a1 a2 : 'a Array384.t) : 'a Array1152.t = 
   Array1152.init (fun k => if 0 <= k < 384
                  then a0.[k]
                  else if 384 <= k < 768
                       then a1.[k-384] 
                       else a2.[k-768]).   

op toipolyvec(p : vector) : ipolyvec = map asint (fromarray256 p.[0] p.[1] p.[2]).

op ofipolyvec(p : ipolyvec) =  offunv (fun k => map inFq (subarray256 p k)).

op compress_polyvec(d : int, p : vector) : ipolyvec =  
        map (compress d) (fromarray256 p.[0] p.[1] p.[2]).

op decompress_polyvec(d : int, p : ipolyvec) =  
        offunv (fun k => map (decompress d) (subarray256 p k)).

(* To avoid loop matching pain with the implementation
   we adopt the same control structure and specify EncDec
   in a more palattable way. *)

module EncDec = {

   proc decode12(a : W8.t Array384.t) : ipoly = {
       var i;
       var r : ipoly;
       r <- witness;
       i <- 0;
       while (i < 128) {
          r.[i*2+0]  <- to_uint a.[3*i] + to_uint a.[3*i+1] %% 2^4 * 2^8;
          r.[i*2+1]  <- to_uint a.[3*i+2] * 2^4 + to_uint a.[3*i+1] %/ 2^4;
          i <- i + 1;
       }
       return r;
   }

   proc decode4(a : W8.t Array128.t) : ipoly = {
       var i;
       var r : ipoly;
       r <- witness;
       i <- 0;
       while (i < 128) {
          r.[i*2+0]  <- to_uint a.[i] %% 16;
          r.[i*2+1]  <- to_uint a.[i] %/ 16;
          i <- i + 1;
       }
       return r;
   }

   proc decode1(a : W8.t Array32.t) : ipoly = {
       var i;
       var r : ipoly;
       r <- witness;
       i <- 0;
       while (i < 32) {
          r.[i*8+0] <- b2i a.[i].[0];
          r.[i*8+1] <- b2i a.[i].[1];
          r.[i*8+2] <- b2i a.[i].[2];
          r.[i*8+3] <- b2i a.[i].[3];
          r.[i*8+4] <- b2i a.[i].[4];
          r.[i*8+5] <- b2i a.[i].[5];
          r.[i*8+6] <- b2i a.[i].[6];
          r.[i*8+7] <- b2i a.[i].[7];
          i<-i+1;
       }
       return r;
   }

   proc encode12(a : ipoly) : W8.t Array384.t = {
       var fi1,fi2,i,j;
       var r : W8.t Array384.t;
       r <- witness;
       i <- 0; j <- 0;
       while (i < 256) {
          fi1 <- a.[i]; i <- i + 1;
          fi2 <- a.[i]; i <- i + 1;
          r.[j] <- W8.of_int fi1;                               j <- j + 1;
          r.[j] <- W8.of_int ((fi2 %% 2^4) * 2^4 + fi1 %/ 2^8); j <- j + 1;
          r.[j] <- W8.of_int (fi2 %/ 2^4);                      j <- j + 1;
       }
       return r;
   }

   proc encode4(p : ipoly) : W8.t Array128.t = {
       var fi,fi1,i,j;
       var r : W8.t Array128.t;
       r <- witness;
       i <- 0; j <- 0;
       while (i < 128) {
          fi <- p.[j]; j <- j + 1;
          fi1 <- p.[j]; j <- j + 1; 
          r.[i] <- W8.of_int (fi + fi1 * 2^4); i <- i + 1;
       }
       return r;
   }

   proc encode1(a : ipoly) : W8.t Array32.t = {
       var i,j,r;
       var ra : W8.t Array32.t;
       ra <- witness;
       i <- 0;
       while (i < 32) {
          r <- W8.zero;
          j <- 0;
          while (j < 8) {
             r <- W8.of_int (to_uint r + a.[8*i+j] * 2^j);
             j <- j + 1;
          }
          ra.[i] <- r;
          i <- i + 1;
       }
       return ra;      
   }

(* Extension to vectors *)

   proc encode10_vec(u : ipolyvec) : W8.t Array960.t = {
      var c : W8.t Array960.t;
      var i,j,t0,t1,t2,t3;
      c <- witness;
      i <- 0; j <- 0;
      while (i < 768) {
         t0 <- u.[i];
         t1 <- u.[i + 1];
         t2 <- u.[i + 2];
         t3 <- u.[i + 3];
         c.[j] <- W8.of_int t0; j <- j + 1;
         c.[j] <-  W8.of_int (t0 %/ 2^8 + t1 * 2^2); j <- j + 1;
         c.[j] <-  W8.of_int (t1 %/ 2^6 + t2 * 2^4); j <- j + 1;
         c.[j] <-  W8.of_int (t2 %/ 2^4 + t3 * 2^6); j <- j + 1;
         c.[j] <-  W8.of_int (t3 %/ 2^2); j <- j + 1;
         i <- i + 4;
      }
      return c;
   }

   proc encode12_vec(a : ipolyvec) : W8.t Array1152.t = {
      var a1, a2, a3;
      a1 <@ encode12(subarray256 a 0);
      a2 <@ encode12(subarray256 a 1);
      a3 <@ encode12(subarray256 a 2);
      return fromarray384 a1 a2 a3;
   }

   proc decode10_vec(u : W8.t Array960.t) : ipolyvec = {
      var c : ipolyvec;
      var i,j,t0,t1,t2,t3,t4;
      c <- witness;
      i <- 0; j <- 0;
      while (i < 768) {
         t0 <- u.[j]; t1 <- u.[j + 1]; t2 <- u.[j + 2]; t3 <- u.[j + 3]; t4 <- u.[j + 4];
         c.[i] <- to_uint t0 + (to_uint t1 %% 2^2) * 2^8;         i <- i + 1;
         c.[i] <-  to_uint t1 %/ 2^2 + (to_uint t2 %% 2^4) * 2^6; i <- i + 1;
         c.[i] <-  to_uint t2 %/ 2^4 + (to_uint t3 %% 2^6) * 2^4; i <- i + 1;
         c.[i] <-  to_uint t3 %/ 2^6 + (to_uint t4) * 2^2;        i <- i + 1;
         j <- j + 5;
      }
      return c;
   }

   proc decode12_vec(a : W8.t Array1152.t) : ipolyvec = {
      var a1, a2, a3;
      a1 <@ decode12(subarray384 a 0);
      a2 <@ decode12(subarray384 a 1);
      a3 <@ decode12(subarray384 a 2);
      return fromarray256 a1 a2 a3;
   }

}.

(****************)
(****************)
(* THE SPEC     *)
(****************)
(****************)

op [lossless]srand : W8.t Array32.t distr.

module Kyber(G : G_t, XOF : XOF_t, PRF : PRF_t, O : RO.POracle) : Scheme = {

  (* Spec gives a derandomized enc that matches this code *)
  proc kg_derand(seed: W8.t Array32.t) : pkey * skey = {
     var rho, sig, i, j, _N,c,t;
     var tv,sv : W8.t Array1152.t;
     var a : matrix;
     var s,e : vector;
     a <- witness;
     e <- witness;
     s <- witness;
     sv <- witness;
     tv <- witness;
     (rho,sig) <@ G(O).sample(seed);
     _N <- 0; 
     i <- 0;
     while (i < kvec) {
        j <- 0;
        while (j < kvec) {
           XOF(O).init(rho,W8.of_int j,W8.of_int i);
           c <@ Parse(XOF,O).sample_real();
           a.[(i,j)] <- c;
           j <- j + 1;
        }
        i <- i + 1;
     }      
     PRF(O).init(sig);
     i <- 0;
     while (i < kvec) {
        c <@ CBD2(PRF,O).sample_real(_N);
        s <- set s i c;
        _N <- _N + 1;
        i <- i + 1;
     }         
     i <- 0;
     while (i < kvec) {
        c <@ CBD2(PRF,O).sample_real(_N);
        e <- set e i c;
        _N <- _N + 1;
        i <- i + 1;
     }      
     s <- nttv s;
     e <- nttv e; 
     t <- ntt_mmul a s + e;
     tv <@ EncDec.encode12_vec(toipolyvec t); (* minimum residues *)
     sv <@ EncDec.encode12_vec(toipolyvec s); (* minimum residues *)
     return ((tv,rho),sv);
  }

  proc kg() : pkey * skey = {
     var s,kp;
     s <$ srand;
     kp <@ kg_derand(s);
     return kp;
  }

  (* Spec gives a derandomized enc that matches this code *)
  proc enc_derand(pk : pkey, m : plaintext, r : W8.t Array32.t) : ciphertext = {
      var _N,i,j,c,tv,rho,rv,e1,e2,rhat,u,v,mp,c2,thati;
      var that : vector;
      var aT : matrix;
      var c1 : W8.t Array960.t;
      aT <- witness;
      c1 <- witness;
      e1 <- witness;
      rv <- witness;
      that <- witness;
      (tv,rho) <- pk;
      _N <- 0;
      thati <@ EncDec.decode12_vec(tv); 
      that <- ofipolyvec thati;
      i <- 0;
      while (i < kvec) {
        j <- 0;
        while (j < kvec) {
           XOF(O).init(rho,W8.of_int i, W8.of_int j);
           c <@ Parse(XOF,O).sample_real();
           aT.[(i,j)] <- c; (* this is the transposed matrix *)
           j <- j + 1;
        }
        i <- i + 1;
      } 
      PRF(O).init(r);     
      i <- 0;
      while (i < kvec) {
        c <@ CBD2(PRF,O).sample_real(_N);
        rv <- set rv i c;
        _N <- _N + 1;
        i <- i + 1;
      }         
      i <- 0;
      while (i < kvec) {
        c <@ CBD2(PRF,O).sample_real(_N);
        e1 <- set e1 i c;
        _N <- _N + 1;
        i <- i + 1;
      }      
      e2 <@ CBD2(PRF,O).sample_real(_N);
      rhat <- nttv rv;
      u <- invnttv (ntt_mmul aT rhat) + e1;
      mp <@ EncDec.decode1(m);
      v <- invntt (ntt_dotp that rhat) &+ e2 &+ decompress_poly 1 mp; 
      c1 <@ EncDec.encode10_vec(compress_polyvec 10 u); 
      c2 <@ EncDec.encode4(compress_poly 4 v);
      return (c1,c2);
  }

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
     var r,c;
     r <$ srand;
     c <@ enc_derand(pk,m,r);
     return c;
  }

  proc dec(sk : skey, cph : ciphertext) : plaintext option = {
      var m,mp,ui,v,vi,si, c1, c2;
      var u,s : vector;
      u <- witness;
      s <- witness;
      (c1,c2) <- cph;
      ui <@ EncDec.decode10_vec(c1);
      u <- decompress_polyvec 10 ui;
      vi <@ EncDec.decode4(c2);
      v <- decompress_poly 4 vi;
      si <@ EncDec.decode12_vec(sk);
      s <- ofipolyvec si;
      mp <- v &+ ((&-) (invntt (ntt_dotp s (nttv u))));
      m <@ EncDec.encode1(compress_poly 1 mp);
      return Some m;
  }

}.

(* Cloning rationale:

- We clone ZModField to get Zq.

- We clone PKE and to get security definitions and
  fix the RO type to match a XOF that takes 
  a rho and two bytes as seed, and then an
  integer to decide which block we want.

- We clone Matrix with the ring we define over
  Fq Array256.t.

*)
