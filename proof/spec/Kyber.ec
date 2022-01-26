require import AllCore ZModP IntDiv Distr List DList PKE.
from Jasmin require import JWord.
require import Array3 Array32 Array64 Array128 Array168 Array256 Array320.
require import Array384 Array768 Array1024 Array2560 Array3072.

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
fn _shake128_squeezeblock(reg ptr u64[25] state, reg ptr u8[SHAKE128_RATE] out) -> reg ptr u64[25], reg ptr u8[SHAKE128_RATE] => RATE is 168

PRF = fn _shake256_128_33(reg ptr u8[128] out, reg const ptr u8[33] in) -> stack u8[128]

*)
clone import PKE as KyberPKE with
  type RO.in_t = (unit option) * ((W8.t Array32.t * int *int * int) option) * ((W8.t Array32.t * int) option),
  type RO.out_t = W8.t Array64.t * W8.t Array168.t * W8.t Array128.t,
  type pkey = (W8.t Array384.t) Array3.t * W8.t Array32.t,
  type skey = (W8.t Array384.t) Array3.t,
  type plaintext = W8.t Array32.t,
  type ciphertext = (W8.t Array320.t) Array3.t * W8.t Array128.t.

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
op compress(d : int, x : Fq) : Fq = inFq (round ((2^d)%r / q%r * (asint x)%r) %% 2^d).
op decompress(d : int, x : Fq) : Fq = inFq (round (q%r / (2^d)%r * (asint x)%r)).

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
   compress d x = inFq (round ((2^d)%r / q%r * (as_sint x)%r) %% 2^d).
proof.
move => dlb dub;rewrite /compress => />; congr.
case ((q - 1) %/ 2 < asint x); last by rewrite /as_sint; auto => />. 
case (x = Zq.zero); first by smt(@Zq).
move => H H0. 
pose xr := ((2 ^ d)%r * (as_sint x)%r / q%r).
rewrite (round_notie xr (noties_s d x xr dlb dub H _)) => //.
have -> : -xr =  (2 ^ d)%r - (2 ^ d)%r * (asint x)%r / q%r by rewrite /xr /as_sint; smt(@Real).
rewrite round_add.
have -> : - (2 ^ d + round (- (2 ^ d)%r * (asint x)%r / q%r)) = (- 2^d) + (- round (- (2 ^ d)%r * (asint x)%r / q%r)) by smt().
rewrite -modzDm.
have -> : (- 2 ^ d) %% 2 ^ d = 0 by smt(@IntDiv).
simplify.
pose xr' := ((2 ^ d)%r * (asint x)%r / q%r).
rewrite (round_notie xr' (noties_u d x xr' dlb dub H _)) => //.
smt(@IntDiv).
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
admitted.

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

(* This is the implementation of compress d in C/Jasmin *)
op compress_alt(d : int, c : Fq) : Fq =
    inFq (((asint c * 2^d + (q %/ 2)) %/q) %% 2^d).

lemma compress_alt_compress c d :    
   0 <= d => 2^d < q =>
      compress_alt d c = compress d c.
proof. move => *; rewrite /compress_alt /compress /round; congr;congr; congr.
rewrite StdBigop.Bigreal.Num.Domain.mulrC StdBigop.Bigreal.Num.Domain.mulrA.
admitted.

(* This is the implementation of decompress d in C/Jasmin *)
op decompress_alt(d : int, c : Fq) : Fq = 
    inFq (((asint c * q + 2^(d-1)) %/ 2^d)).

lemma decompress_alt_decompress c d : 
   0 <= d => 2^d < q =>
    decompress_alt d c = decompress d c.
proof. move => *; rewrite /decompress_alt /decompress /round; congr.
rewrite StdBigop.Bigreal.Num.Domain.mulrC StdBigop.Bigreal.Num.Domain.mulrA.
admitted.

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
 b_encode c = decompress 1 (if c then inFq 1 else inFq 0).
admitted.

lemma b_decode_sem c :
   compress 1 c = if b_decode c then inFq 1 else inFq 0.
admitted.

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

op dshort_elem : Fq distr. 

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

(* The distribution is lossless *)
axiom dshort_elem_ll : is_lossless dshort_elem.

(* The uniform distribution over a field element *)

op duni_elem : Fq distr.

(* Definition of the support *)
axiom supp_duni_elem x : 0 <= asint x < q <=> x \in duni_elem.

(* The probability of each value in the support. *)
op pe = 1%r /q%r.
axiom duni_elem1E x : mu1 duni_elem x = pe.

(* The distribution is lossless *)
axiom duni_elem_ll : is_lossless duni_elem.

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

op (&-) (p : poly) : poly = 
  map Zq.([-]) p.

(* End Fixme *)

(* Compression/decompression of polys *)

op compress_poly(d : int, p : poly) : poly =  map (compress d) p.

op decompress_poly(d : int, p : poly) : poly =  map (decompress d) p.

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

module type G_t(O : RO.POracle) = {
   proc sample() : (W8.t Array32.t) *  (W8.t Array32.t)
}.

module type XOF_t(O : RO.POracle) = {
   proc init(rho :  W8.t Array32.t, i j : int) : unit
   proc next_bytes() : W8.t Array168.t
}.

(* We take some liberty to specify parse using a XOF that
   returns 168 bytes at a time, which is what the Kyber
   implementation does. *)
module Parse(XOF : XOF_t, O : RO.POracle) = {
   proc sample_real() : poly = {
      var j, b168, bi, bi1, bi2, d1, d2,k;
      var aa : poly;
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
   proc next_bytes(_N : int) : W8.t Array128.t
}.

(* To Do *)
op bytes2bits32 : W8.t Array32.t -> bool Array256.t.
op bytes2bits128 : W8.t Array128.t -> bool Array1024.t.
op bytes2bits320 : W8.t Array320.t -> bool Array2560.t.
op bytes2bits384 : W8.t Array384.t -> bool Array3072.t.

module CBD2(PRF : PRF_t, O : RO.POracle) = {
   proc sample_real(_N : int) : poly = {
      var bits,i,a,b,bytes;
      var rr : poly;
      bytes <@ PRF(O).next_bytes(_N);
      bits <- bytes2bits128 bytes;
      i <- 0;
      while (i < 256) {
        a <- b2i bits.[4*i] + b2i bits.[4*i+1];
        b <- b2i bits.[4*i + 2] + b2i  bits.[4*i+3];
        rr.[i] <- inFq  (a - b);
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
    type  CR.t     <= Fq,
      op  CR.zeror <= Zq.zero,
      op  CR.oner  <= Zq.one,
      op  CR.(+)   <= Zq.(+),
      op  CR.([-]) <= Zq.([-]),
      op  CR.( * ) <= Zq.( * ),
      op  CR.invr  <= Zq.inv,
    pred  CR.unit  <= Zq.unit
    proof CR.*.

  realize CR.addrA     by admit.
  realize CR.addrC     by admit.
  realize CR.add0r     by admit.
  realize CR.addNr     by admit.
  realize CR.oner_neq0 by admit.
  realize CR.mulrA     by admit.
  realize CR.mulrC     by admit.
  realize CR.mul1r     by admit.
  realize CR.mulrDl    by admit.
  realize CR.mulVr     by admit.
  realize CR.unitP     by admit.
  realize CR.unitout   by admit.

op zroot = inFq 17.

op br(i : int) = BitEncoding.BS2Int.bs2int (BitEncoding.BS2Int.int2bs 7 i).

op ntt(p : poly) = Array256.init (fun i => 
   if i %% 2  = 0 
   then let ii = i %/ 2     in BAdd.bigi predT (fun j => p.[2*j]   * ZqRing.exp zroot ((2 * br ii + 1) * j)) 0 128
   else let ii = (i-1) %/ 2 in BAdd.bigi predT (fun j => p.[2*j+1] * ZqRing.exp zroot ((2 * br ii + 1) * j)) 0 128).

op invntt(p : poly) = Array256.init (fun i => 
   if i %% 2  = 0 
   then let ii = i %/ 2     in BAdd.bigi predT (fun j => (inv (inFq 128)) * p.[2*j] * ZqRing.exp zroot (-((2 * br ii + 1) * j))) 0 128
   else let ii = (i-1) %/ 2 in BAdd.bigi predT (fun j => (inv (inFq 128)) * p.[2*j+1] * ZqRing.exp zroot (-((2 * br ii + 1) * j))) 0 128).

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


module EncDec = {
   proc decode12(bytes : W8.t Array384.t) : poly = {
       var bits,i,j,fi;
       var r : poly;
       r <- witness;
       bits <- bytes2bits384 bytes;
       i <- 0;
       while (i < 256) {
          fi <- 0;
          j <- 0;
          while (j < 12) {
            fi <- fi + b2i bits.[i*12 + j] * 2^j;
            j <- j + 1; 
          }
          r.[i] <- inFq fi;
          i <- i + 1;
       }
       return r;
   }

   proc decode10(bytes : W8.t Array320.t) : poly = {
       var bits,i,j,fi;
       var r : poly;
       r <- witness;
       bits <- bytes2bits320 bytes;
       i <- 0;
       while (i < 256) {
          fi <- 0;
          j <- 0;
          while (j < 10) {
            fi <- fi + b2i bits.[i*10 + j] * 2^j;
            j <- j + 1; 
          }
          r.[i] <- inFq fi;
          i <- i + 1;
       }
       return r;
   }

   proc decode4(bytes : W8.t Array128.t) : poly = {
       var bits,i,j,fi;
       var r : poly;
       r <- witness;
       bits <- bytes2bits128 bytes;
       i <- 0;
       while (i < 256) {
          fi <- 0;
          j <- 0;
          while (j < 4) {
            fi <- fi + b2i bits.[i*4 + j] * 2^j;
            j <- j + 1; 
          }
          r.[i] <- inFq fi;
          i <- i + 1;
       }
       return r;
   }

   proc decode1(bytes : W8.t Array32.t) : poly = {
       var bits,i,fi;
       var r : poly;
       r <- witness;
       bits <- bytes2bits32 bytes;
       i <- 0;
       while (i < 256) {
          fi <- b2i bits.[i];
          r.[i] <- inFq fi;
          i <- i + 1;
       }
       return r;
   }

   (* To Do: this is defined in the spec as the inverse of
      the above, so we can choose the implementation
      that best suits us and prove equivalence. *)

   proc encode12(p : poly) : W8.t Array384.t = {
       var fi,fi1,i,k;
       var r : W8.t Array384.t;
       r <- witness;
       i <- 0; k <- 0;
       while (i < 256) {
          fi <- asint p.[i];
          fi1 <- asint p.[i+1];
          r.[k] <- witness;
          r.[k+1] <- witness;
          r.[k+2] <- witness;
          i <- i + 2;
          k <- k + 3;
       }
       return r;
   }

   proc encode10(p : poly) : W8.t Array320.t = {
       var fi,fi1,fi2,fi3,i,k;
       var r : W8.t Array320.t;
       r <- witness;
       i <- 0; k <- 0;
       while (i < 256) {
          fi <- asint p.[i];
          fi1 <- asint p.[i+1];
          fi2 <- asint p.[i+2];
          fi3 <- asint p.[i+3];
          r.[k] <- witness;
          r.[k+1] <- witness;
          r.[k+2] <- witness;
          r.[k+3] <- witness;
          r.[k+4] <- witness;
          i <- i + 4;
          k <- k + 5;
       }
       return r;
   }

   proc encode4(p : poly) : W8.t Array128.t = {
       var fi,fi1,i,k;
       var r : W8.t Array128.t;
       r <- witness;
       i <- 0; k <- 0;
       while (i < 256) {
          fi <- asint p.[i];
          fi1 <- asint p.[i+1];
          r.[k] <- witness;
          i <- i + 2;
          k <- k + 1;
       }
       return r;
   }

   proc encode1(p : poly) : W8.t Array32.t = {
       var fi,fi1,fi2,fi3,fi4,fi5,fi6,fi7,i,k;
       var r : W8.t Array32.t;
       r <- witness;
       i <- 0; k <- 0;
       while (i < 256) {
          fi <- asint p.[i];
          fi1 <- asint p.[i+1];
          fi2 <- asint p.[i+2];
          fi3 <- asint p.[i+3];
          fi4 <- asint p.[i+4];
          fi5 <- asint p.[i+5];
          fi6 <- asint p.[i+6];
          fi7 <- asint p.[i+7];
          r.[k] <- witness;
          i <- i + 8;
          k <- k + 1;
       }
       return r;
   }

}.

end Poly.

export Poly.

op kvec : int. 
axiom kvec_ge3 : 3 <= kvec.


require Matrix.
clone import Matrix as Matrix_ with
    op size <- kvec,
    type ZR.t <- poly,
    op ZR.zeror <- Poly.zero,
    op ZR.oner <- Poly.one,
    pred ZR.unit <- fun x => x = Poly.one,
    op ZR.(+) <- Poly.(&+),
    op ZR.([-]) <- Poly.(&-),
    op ZR.( * ) <- Poly.(&*)
    proof ZR.addrA by admit
    proof ZR.addrC by admit
    proof ZR.add0r by admit
    proof ZR.addNr by admit
    proof ZR.oner_neq0 by admit
    proof ZR.mulrA by admit
    proof ZR.mulrC by admit
    proof ZR.mul1r by admit
    proof ZR.mulrDl by admit
    proof ZR.mulVr by admit
    proof ZR.unitP by admit
    proof ZR.unitout by admit
    proof ZR.mulf_eq0 by admit.



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

(****************)
(****************)
(* THE SPEC     *)
(****************)
(****************)

module Kyber(G : G_t, XOF : XOF_t, PRF : PRF_t, O : RO.POracle) : Scheme = {
  proc kg() : pkey * skey = {
     var rho, sig, i, j, _N,c,t,tb,sb;
     var tv,sv : (W8.t Array384.t) Array3.t;
     var a : matrix;
     var s,e : vector;
     (rho,sig) <@ G(O).sample();
     _N <- 0; 
     i <- 0;
     while (i < kvec) {
        j <- 0;
        while (j < kvec) {
           XOF(O).init(rho,i,j);
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
        i <- i + 1;
        _N <- _N + 1;
     }         
     i <- 0;
     while (i < kvec) {
        c <@ CBD2(PRF,O).sample_real(_N);
        e <- set e i c;
        i <- i + 1;
        _N <- _N + 1;
     }      
     s <- nttv s;
     e <- nttv e; 
     t <- a *^ s + e;
     i <- 0;
     while (i < 3) {
       tb <@ EncDec.encode12(t.[i]); tv.[i] <- tb;
       sb <@ EncDec.encode12(s.[i]); sv.[i] <- sb;
       i <- i + 1;
     }
     return ((tv,rho),sv);
  }

  proc enc(pk : pkey, m : plaintext) : ciphertext = {
      var _N,i,j,c,tb,tv,rho,r,e1,e2,rhat,u,v,mp,c2,c1i;
      var that : vector;
      var aT : matrix;
      var c1 : (W8.t Array320.t) Array3.t;
      (tv,rho) <- pk;
      _N <- 0;
      (* Spec is silly here *)
      i <- 0;
      while (i < 3) {
        tb <@ EncDec.decode12(tv.[i]); 
        that <- set that 0 tb;
        i <- i + 1;
      }
      i <- 0;
      while (i < kvec) {
        j <- 0;
        while (j < kvec) {
           XOF(O).init(rho,i,j);
           c <@ Parse(XOF,O).sample_real();
           aT.[(j,i)] <- c; (* this is the transposed matrix *)
           j <- j + 1;
        }
        i <- i + 1;
      }           
      i <- 0;
      while (i < kvec) {
        c <@ CBD2(PRF,O).sample_real(_N);
        r <- set r i c;
        i <- i + 1;
        _N <- _N + 1;
      }         
      i <- 0;
      while (i < kvec) {
        c <@ CBD2(PRF,O).sample_real(_N);
        e1 <- set e1 i c;
        i <- i + 1;
        _N <- _N + 1;
      }      
      e2 <@ CBD2(PRF,O).sample_real(_N);
      rhat <- nttv r;
      u <- invnttv (aT *^ rhat) + e1;
      mp <@ EncDec.decode1(m);
      v <- invntt (dotp that r) &+ e2 &+ decompress_poly 1 mp; 
      i <- 0;
      while (i < 3) {
         c1i <@ EncDec.encode10(compress_poly 10 u.[i]); 
         c1.[i] <- c1i;
         i <- i + 1;
      }
      c2 <@ EncDec.encode4(compress_poly 4 v);
      return (c1,c2);
  }

  proc dec(sk : skey, cph : ciphertext) : plaintext option = {
      var m,mp,i,ui,v,si, c1, c2;
      var u,s : vector;
      (c1,c2) <- cph;
      i <- 0;
      while (i < 3) {
         ui <@ EncDec.decode10(c1.[i]);
         u <- set u i (decompress_poly 10 ui);
         i <- i + 1;
      }
      v <@ EncDec.decode4(c2);
      v <- decompress_poly 4 v;
      i <- 0;
      while (i < 3) {
         si <@ EncDec.decode12(sk.[i]);
         s <- set s i (decompress_poly 12 si);
         i <- i + 1;
      }
      mp <- v &+ ((&-) (invntt (dotp s (nttv u))));
      m <@ EncDec.encode1(compress_poly 1 mp);
      return Some m;
  }

}.


(**********************************)
(**********************************)
(**********************************)
(* Now we instantiate the abstract
   encryption scheme and prove 
   equivalence                    *)
(**********************************)
(**********************************)
(**********************************)

require (***) MLWE_PKE.

type plaintext = bool Array256.t.
type ciphertext = vector * poly.
op m_encode(m : plaintext) : poly = Array256.map b_encode m.
op m_decode(p : poly) : plaintext = Array256.map b_decode p. 
op c_encode(c :  ciphertext) : vector * poly = 
      (mapv (compress_poly 10) c.`1, compress_poly 4 c.`2).
op c_decode = fun (c : vector * poly) => 
      (mapv (decompress_poly 10) c.`1, decompress_poly 4 c.`2).
op rnd_err_v = compress_poly_err 4. 
op rnd_err_u = mapv (compress_poly_err 10). 
op max_noise = q %/ 4.

op pe_R = pe^256.
op pv = pe_R^(kvec).
op pm = pe_R^(kvec^2).

op under_noise_bound (p : poly) (b : int) =
     all (fun cc => `| as_sint cc| < b) p.

op cv_bound : int = 104. (* this is the compress error bound for d = 4 *)
op fail_prob : real. (* Need to compute exact value or replace
                        with suitable bound *)

op epsilon_hack : real. (* Assumed simplification loss *)

clone import MLWE_PKE as MLWEPKE with 
  type MLWE_.Matrix_.ZR.t <- poly,
  op MLWE_.Matrix_.ZR.(+) <- Poly.(&+),
  op MLWE_.Matrix_.ZR.([-]) <- Poly.(&-),
  op MLWE_.Matrix_.ZR.zeror <- Poly.zero,
  op MLWE_.Matrix_.ZR.oner <- Poly.one,
  pred MLWE_.Matrix_.ZR.unit <- fun x => x = Poly.one,
  op MLWE_.Matrix_.ZR.( * ) <- Poly.(&*),
  op MLWE_.Matrix_.size <- kvec,
  type MLWE_.Matrix_.Matrix.matrix <- matrix,
  type MLWE_.Matrix_.vector <- vector,
  op MLWE_.Matrix_.Vector.tofunv <- tofunv,
  op MLWE_.duni_R <- duni_R,
  op MLWE_.dshort_R <- dshort_R,
  type MLWE_.seed <- W8.t Array32.t,
  (*type MLWE_.RO.in_t <- W8.t Array32.t, *)
  (* op invr : poly -> poly *)
  type plaintext <- plaintext,
  type ciphertext <- ciphertext,
  op m_encode <- m_encode,
  op m_decode <- m_decode,
  op c_encode <- c_encode,
  op c_decode <- c_decode, 
  op rnd_err_v <- rnd_err_v,
  op rnd_err_u <- rnd_err_u,
  op under_noise_bound <- under_noise_bound,
  op max_noise <- max_noise,
  op cv_bound <- cv_bound,
  op fail_prob <- fail_prob,
  op epsilon_hack <- epsilon_hack
  proof MLWE_.dshort_R_ll  by apply dshort_R_ll
  proof MLWE_.duni_R_ll by apply duni_R_ll
  proof MLWE_.duni_R_fu 
  proof MLWE_.Matrix_.ge0_size by smt(kvec_ge3)
  proof MLWE_.Matrix_.ZR.addrA by admit
  proof MLWE_.Matrix_.ZR.addrC by admit
  proof MLWE_.Matrix_.ZR.add0r by admit
  proof MLWE_.Matrix_.ZR.addNr by admit
  proof MLWE_.Matrix_.ZR.oner_neq0 by admit
  proof MLWE_.Matrix_.ZR.mulrA by admit
  proof MLWE_.Matrix_.ZR.mulrC by admit
  proof MLWE_.Matrix_.ZR.mul1r by admit
  proof MLWE_.Matrix_.ZR.mulrDl by admit
  proof MLWE_.Matrix_.ZR.mulVr by admit
  proof MLWE_.Matrix_.ZR.unitP by admit
  proof MLWE_.Matrix_.ZR.unitout by admit
  proof MLWE_.Matrix_.ZR.mulf_eq0 by admit
  proof encode_noise
  proof good_decode
  proof cv_bound_valid
  proof noise_commutes. 
  (* fixme: this clone is a mess. 
     check unproved axioms coming from ring theories *)

realize MLWE_.duni_R_fu.
proof.
  rewrite /is_full /Poly.duni_R => p.
  rewrite supp_dmap; exists (Array256.to_list p).
  split.
    rewrite supp_dlist //; split; first by rewrite size_to_list.
    rewrite allP => *. 
    by rewrite -supp_duni_elem; smt(@Zq).
    by rewrite Array256.to_listK.
qed.

realize encode_noise.
admitted.
(* This proof doesn't work because of the matrix clone and vector operations types 
move => /> *.
rewrite /c_decode /c_encode => />.
split; last  by rewrite round_poly_errE.
rewrite /round_poly /round_poly_err /roundc_err  => />.
apply eq_vectorP => /> *.
rewrite offunvE 1:/# offunvE 1:/# /=.
apply Array256.ext_eq => /> *.
rewrite mapiE 1:// map2iE 1:// mapiE 1:// /= PolyVec.roundc_errE.  
congr => />.
smt.
qed.*)

realize good_decode.
rewrite /under_noise_bound /m_encode /m_decode /b_encode /b_decode /trueval /falseval  qE  => m n hgood.
apply Array256.ext_eq => /> x h0x hx256.
rewrite mapiE; first by smt().
auto => />.
rewrite /Poly.(&+) map2E => />. 
rewrite initiE; first by smt().
rewrite /as_sint => />.
rewrite Zq.addE  qE => />.
rewrite mapiE /=; first by smt().
have ? : -832 < (if 1664 < asint n.[x] then asint n.[x] - 3329 else asint n.[x])< 832; last first. 
+ case (m.[x]). move => * />. rewrite inFqK qE => />. 
  case (1664 < asint n.[x]); smt().  
  by move => *; case (1664 < asint n.[x]); smt(@Zq). 
pose F := fun (cc : int) (c : Fq) => if `|cc| < `|as_sint c| then as_sint c else cc.
move: hgood; rewrite allP  => *.
rewrite /balasint; smt(qE).
qed.

realize cv_bound_valid.
admitted. (* We need concrete distributions *)

realize noise_commutes.
move => n n' b H H0.
move : H H0; rewrite /under_noise_bound.
rewrite !allP.
move => Hn Hnp i ib.
move : (Hn i ib). 
move : (Hnp i ib) => /=. 
rewrite /as_sint /Poly.(&+) /= map2E !initiE //= addE qE /=  !StdOrder.IntOrder.ltr_norml /= => Hni Hnpi.
by smt().
qed.

(* This is an assumption on what loss there could be wrt 
   correctness because we consider rounding of uniform 
   and independent coefficients *)
axiom correctness_hack &m :
  `| Pr[CorrectnessNoiseApprox.main() @ &m : res] - 
     Pr[CorrectnessBound.main() @ &m : res] | <= epsilon_hack.

section.

declare module A <: MLWEPKE.PKE_.CAdversaryRO {MLWE_.RO.Lazy.LRO}.
axiom All (O <: MLWE_.RO.POracle{A}):
     islossless O.o =>
     islossless A(O).find.


(* This is the  exact bound one gets assuming the rounding
   of uniform and independent coefficients *)
lemma fail_prob &m : 
   Pr[ CorrectnessBound.main() @ &m : res] <= fail_prob.
byphoare.
proc.
auto => />.
rewrite /comp_distr /noise_exp_final /noise_exp_part /rdistr.
rewrite /good_noise /cv_bound /noise_val.
admitted. (* We need concrete distributions *)

lemma kyber_refined_correctness &m : 
 Pr[ MLWEPKE.PKE_.CGameROM(MLWEPKE.PKE_.CorrectnessAdv,MLWEPKE.MLWE_PKE,A,MLWE_.RO.Lazy.LRO).main() @ &m : res]  >=
  1%r - fail_prob - epsilon_hack
  by  apply (correctness_bound A &m).
end section.

(* AT THIS POINT WE HAVE THE REFINED THEORETICAL ABSTRACTION
   AND THE SPEC. The theoretical abstraction is still working
   over arrays over Fq/bools, rather than byte encodings.
   We can prove security and correctness of the spec via
   a reduction, which is probably easier than defining operators
   for the encoding/decoding functions and include them in
   the refinement. *)

(* We wrap the refined abstraction with encoding/decoding
   algorithms first. *)

module WrapUnwrap  = {

  proc wrap_keys(trho : PKE_.pkey, s : PKE_.skey) : KyberPKE.pkey * KyberPKE.skey = {
     var i,tb,sb;
     var tv,sv : (W8.t Array384.t) Array3.t;
     tv <- witness;
     sv <- witness;
     i <- 0;
     while (i < 3) {
       tb <@ EncDec.encode12(trho.`1.[i]); tv.[i] <- tb;
       sb <@ EncDec.encode12(s.[i]); sv.[i] <- sb;
       i <- i + 1;
     }
     return ((tv,trho.`2),sv);
  }

  proc unwrap_keys(trho : KyberPKE.pkey, s : KyberPKE.skey) : PKE_.pkey * PKE_.skey = {
     var i,tb,sb;
     var tv,sv : vector;
     tv <- witness;
     sv <- witness;
     i <- 0;
     while (i < 3) {
       tb <@ EncDec.decode12(trho.`1.[i]); tv <- set tv i tb;
       sb <@ EncDec.decode12(s.[i]); sv <- set sv i sb;
       i <- i + 1;
     }
     return ((tv,trho.`2),sv);
  }

  proc wrap_sk(s : PKE_.skey) : KyberPKE.skey = {
     var i,sb;
     var sv : (W8.t Array384.t) Array3.t;
     sv <- witness;
     i <- 0;
     while (i < 3) {
       sb <@ EncDec.encode12(s.[i]); sv.[i] <- sb;
       i <- i + 1;
     }
     return sv;
  }

  proc unwrap_sk(s : KyberPKE.skey) : PKE_.skey = {
     var i,sb;
     var sv : vector;
     sv <- witness;
     i <- 0;
     while (i < 3) {
       sb <@ EncDec.decode12(s.[i]); sv <- set sv i sb;
       i <- i + 1;
     }
     return sv;
  }

  proc wrap_pk(trho : PKE_.pkey) : KyberPKE.pkey = {
     var i,tb;
     var tv : (W8.t Array384.t) Array3.t;
     tv <- witness;
     i <- 0;
     while (i < 3) {
       tb <@ EncDec.encode12(trho.`1.[i]); tv.[i] <- tb;
       i <- i + 1;
     }
     return (tv,trho.`2);
  }

  proc unwrap_pk(trho : KyberPKE.pkey) : PKE_.pkey = {
     var i,tb;
     var tv : vector;
     tv <- witness;
     i <- 0;
     while (i < 3) {
       tb <@ EncDec.decode12(trho.`1.[i]); tv <- set tv i tb;
       i <- i + 1;
     }
     return (tv,trho.`2);
  }

  proc wrap_ciphertext(c : ciphertext) : KyberPKE.ciphertext = {
      var i,u,v,c2,c1i;
      var that : vector;
      var a : matrix;
      var c1 : (W8.t Array320.t) Array3.t;
      that <- witness;
      a <- witness;
      c1 <- witness;
      (u,v) <- c;
      i <- 0;
      while (i < 3) {
         c1i <@ EncDec.encode10(u.[i]); 
         c1.[i] <- c1i;
         i <- i + 1;
      }
      c2 <@ EncDec.encode4(v);
      return (c1,c2);
  }

  proc unwrap_ciphertext(c : KyberPKE.ciphertext) : ciphertext = {
      var i,u,v,c2,c1i;
      var that : (W8.t Array384.t) Array3.t;
      var a : matrix;
      var c1 : vector;
      that <- witness;
      a <- witness;
      c1 <- witness;
      (u,v) <- c;
      i <- 0;
      while (i < 3) {
         c1i <@ EncDec.decode10(u.[i]); 
         c1 <- set c1 i c1i;
         i <- i + 1;
      }
      c2 <@ EncDec.decode4(v);
      return (c1,c2);
  }

  proc wrap_plaintext(m : plaintext) : KyberPKE.plaintext = {
      var mp;
      mp <@ EncDec.encode1(m_encode m);
      return mp;
  }

  proc unwrap_plaintext(m : KyberPKE.plaintext) : plaintext = {
      var mp;
      mp <@ EncDec.decode1(m);
      return m_decode mp;
  }

}.

module (WrapMLWEPKE(XOF : XOF_t) : KyberPKE.SchemeRO) (O : KyberPKE.RO.POracle) = {
  module H : MLWE_.RO.POracle = {
      proc o(x : W8.t Array32.t) : matrix = { 
          (* we just sample matrices as Kyber does and will
             need to prove this is the same as generating a 
             random matrix. Note that we need to invert
             the NTT. *)
          var i,j,c;
          var a : matrix;
          a <- witness;
          i <- 0;
          while (i < kvec) {
            j <- 0;
            while (j < kvec) {
               XOF(O).init(x,i,j);
               c <@ Parse(XOF,O).sample_real();
               a.[(i,j)] <- c;
               j <- j + 1;
           }
           i <- i + 1;
          }      
          return invnttm a; 
      }
  }

  proc kg() : KyberPKE.pkey * KyberPKE.skey = {
     var pk,sk,kp;
     var tv,sv : (W8.t Array384.t) Array3.t;
     kp <@ MLWEPKE.MLWE_PKE(H).kg();
     (pk,sk) <@ WrapUnwrap.wrap_keys(kp);
     return (pk,sk);
  }

  proc enc(pk : KyberPKE.pkey, m : KyberPKE.plaintext) : KyberPKE.ciphertext = {
      var pks,c,cs,mp;
      var that : vector;
      var a : matrix;
      var c1 : (W8.t Array320.t) Array3.t;
      pks <@ WrapUnwrap.unwrap_pk(pk);
      mp <@ WrapUnwrap.unwrap_plaintext(m);
      cs <@ MLWEPKE.MLWE_PKE(H).enc(pks,mp);
      c <@ WrapUnwrap.wrap_ciphertext(cs);
      return c;
  }

  proc dec(sk : KyberPKE.skey, cph : KyberPKE.ciphertext) : KyberPKE.plaintext option = {
      var sks,cphs,m,mp;
      var u,s : vector;
      sks <@ WrapUnwrap.unwrap_sk(sk);
      cphs <@ WrapUnwrap.unwrap_ciphertext(cph);
      mp <@ MLWEPKE.MLWE_PKE(H).dec(sks,cphs);
      m <@ WrapUnwrap.wrap_plaintext(oget mp);
      return Some m;
  }

}.

(* We now specify the various components used by Kyber in the ROM *)

module (G : G_t) (O : RO.POracle) = {
   proc sample() : (W8.t Array32.t) *  (W8.t Array32.t) = {
        var bb;
        var r1, r2 : W8.t Array32.t;
        bb <@ O.o((Some (), None, None));
        r1 <- Array32.init (fun i => bb.`1.[i]);
        r2 <- Array32.init (fun i => bb.`1.[i+32]);
        return (r1,r2);
   }
}.

module (XOF :  XOF_t) (O : RO.POracle) = {
   var _rho : W8.t Array32.t
   var _i, _j : int
   var count : int

   proc init(rho :  W8.t Array32.t, i j : int) : unit = {
      _rho <- rho;
      _i <- i;
      _j <- j;
      count <- 0;
   }
   proc next_bytes() : W8.t Array168.t = {
        var bb;
        bb <@ O.o((None, Some (_rho,_i,_j,count), None));
        return bb.`2;
   }
}.

module (PRF : PRF_t) (O : RO.POracle) = {
   var _sig : W8.t Array32.t

   proc init(sig : W8.t Array32.t) : unit = {
       _sig <- sig;
   }
   proc next_bytes(_N : int) : W8.t Array128.t = {
        var bb;
        bb <@ O.o((None, None, Some (_sig,_N)));
        return bb.`3;
   }
}.

(* The first proof goal shows that encoding/decoding and using rejection sampling
   are irrelevant, so that our wrapper has the same correctness and security as
   the refined abstract scheme.  *)

section.

declare module Ac <: KyberPKE.CAdversaryRO {MLWE_.RO.Lazy.LRO}.
declare module As <: KyberPKE.AdversaryRO {MLWE_.RO.Lazy.LRO}.

(* These modules are reductions. They just encode/decode things coming from the
   refined game to the scheme adversary.  *)

module KRO(O : PKE_.RO.POracle) : KyberPKE.RO.POracle = {
    proc o(x : RO.in_t) : RO.out_t = { 
      (* Sure enough this seems
      to imply simulating a random oracle returning bytes to feed to the
      XOF using one that gives us random matrices. lol
      A nice thing could be done in these random oracles with rejection
      sampling and indifferenciability. *)
       return witness;
    }
}.

module (Bc(A : KyberPKE.CAdversaryRO) : MLWEPKE.PKE_.CAdversaryRO) (O : MLWE_.RO.POracle) = {
   proc find(pk : PKE_.pkey, sk : PKE_.skey) : plaintext = {
      var kpa, ma, m;
      kpa <@ WrapUnwrap.wrap_keys((pk,sk));
      ma <@ A(KRO(O)).find(kpa);
      m <@ WrapUnwrap.unwrap_plaintext(ma);
      return m;
   }
}.

module (Bs(A : KyberPKE.AdversaryRO) : MLWEPKE.PKE_.AdversaryRO) (O : MLWE_.RO.POracle) = {
   proc choose(pk : PKE_.pkey) : plaintext * plaintext = {
      var pka, m1m2, m1, m2;
      pka <@ WrapUnwrap.wrap_pk(pk);
      m1m2 <@ A(KRO(O)).choose(pka);
      m1 <@ WrapUnwrap.unwrap_plaintext(m1m2.`1);
      m2 <@ WrapUnwrap.unwrap_plaintext(m1m2.`2);
      return (m1,m2);
   }

   proc guess(c : ciphertext) : bool = {
      var ca,b;
      ca <@ WrapUnwrap.wrap_ciphertext(c);
      b <@ A(KRO(O)).guess(ca);
      return b;
   }
}.

lemma wrap_correctness &m :  
  Pr[ KyberPKE.CGameROM(KyberPKE.CorrectnessAdv,WrapMLWEPKE(XOF),Ac,KyberPKE.RO.Lazy.LRO).main() @ &m : res] =
  Pr[ MLWEPKE.PKE_.CGameROM(MLWEPKE.PKE_.CorrectnessAdv,MLWEPKE.MLWE_PKE,Bc(Ac),MLWE_.RO.Lazy.LRO).main() @ &m : res].
admitted.

lemma wrap_security &m :  
  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,WrapMLWEPKE(XOF),As,KyberPKE.RO.Lazy.LRO).main() @ &m : res] =
  Pr[ MLWEPKE.PKE_.CPAGameROM(MLWEPKE.PKE_.CPA,MLWEPKE.MLWE_PKE,Bs(As),MLWE_.RO.Lazy.LRO).main() @ &m : res].
admitted.

end section.

(* The second proof goal is to show that the way in which the spec defines
   the various operations of the schemes, e.g., using NTT and the likes  *)

section.

declare module As <: KyberPKE.AdversaryRO  {MLWE_.RO.Lazy.LRO,MLWE_.B, MLWE_.Bt}.

declare module Ac <: KyberPKE.CAdversaryRO  {MLWE_.RO.Lazy.LRO}.

(* In the ROM there should be no PRF loss *)
lemma wrap_equiv_corr &m :  
  Pr[ KyberPKE.CGameROM(KyberPKE.CorrectnessAdv,WrapMLWEPKE(XOF),Ac,KyberPKE.RO.Lazy.LRO).main() @ &m : res] =
  Pr[ KyberPKE.CGameROM(KyberPKE.CorrectnessAdv,Kyber(G,XOF,PRF),Ac,KyberPKE.RO.Lazy.LRO).main() @ &m : res].
proof.
byequiv => //.
proc.
inline {1} 2.
inline {2} 2.
admitted. (* a bunch of equivs that need to be proved once and for all *)

lemma wrap_equiv_security &m :  
  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,WrapMLWEPKE(XOF),As,KyberPKE.RO.Lazy.LRO).main() @ &m : res] =
  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,Kyber(G,XOF,PRF),As,KyberPKE.RO.Lazy.LRO).main() @ &m : res].
byequiv => //.
proc.
inline {1} 2.
inline {2} 2.
admitted. (* a bunch of equivs that need to be proved once and for all *)

(* The following are corollarys that give us Kyber correctness and security *)

lemma KyberCorrectness &m : 
  Pr[ KyberPKE.CGameROM(KyberPKE.CorrectnessAdv,Kyber(G,XOF,PRF),Ac,KyberPKE.RO.Lazy.LRO).main() @ &m : res] >=
      1%r - fail_prob - epsilon_hack.
proof.
rewrite -wrap_equiv_corr.
rewrite (wrap_correctness Ac).
apply (kyber_refined_correctness (Bc(Ac))&m). 
qed.

lemma KyberSecurity &m :
  Pr[ KyberPKE.CPAGameROM(KyberPKE.CPA,Kyber(G,XOF,PRF),As,KyberPKE.RO.Lazy.LRO).main() @ &m : res] - 1%r / 2%r =
      Pr[MLWE_.MLWE(MLWE_.B(B1ROM(Bs(As)), MLWE_.RO.Lazy.LRO)).main(false) @ &m : res] -
      Pr[MLWE_.MLWE(MLWE_.B(B1ROM(Bs(As)), MLWE_.RO.Lazy.LRO)).main(true) @ &m : res] +
      Pr[MLWE_.MLWE(MLWE_.Bt(B2ROM(Bs(As)), MLWE_.RO.Lazy.LRO)).main(false) @ &m : res] -
      Pr[MLWE_.MLWE(MLWE_.Bt(B2ROM(Bs(As)), MLWE_.RO.Lazy.LRO)).main(true) @ &m : res].
rewrite -wrap_equiv_security.
rewrite (wrap_security As).
apply (main_theorem_h (Bs(As))). 
qed.

end section.

(* At this point we will have that the spec is as correct and secure as the refined abstract Kyber. We can start the implementation correctness proof. We first move to an alternative version of the scheme that separates random samplings from algebraic computations. *)

