require import AllCore ZModP IntDiv Distr List DList.
from Jasmin require import JWord.
require import Array3 Array32 Array128 Array256 Array320.
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


(****************************************************)
(*               The finite field Zq/Fq             *)
(****************************************************)

op q : int = 3329 axiomatized by qE.
axiom prime_q : prime q.

clone import ZModField as Zq with 
  op p <- q 
  rename "zmod" as "Fq"
  proof  prime_p by apply prime_q.

(* Signed representation: could go in ZModField *)

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

lemma compress_sint x d : 
   0 <= d => 2^d < q =>
   compress d x = inFq (round ((2^d)%r / q%r * (as_sint x)%r) %% 2^d).
proof.
move => dlb dub;rewrite /compress /as_sint => />; congr.
case ((q - 1) %/ 2 < asint x); last by auto. 
case (x = Zq.zero); first by smt(@Zq).
move => H H0. 
pose xr := ((2 ^ d)%r * (asint x - q)%r / q%r).
have H1 : floor (xr + inv 2%r) <> ceil (xr + inv 2%r) by admit. (* checked in sage *)
rewrite (round_notie xr H1).
have -> : -xr =  (2 ^ d)%r - (2 ^ d)%r * (asint x)%r / q%r by smt(@Real).
rewrite round_add.
have -> : - (2 ^ d + round (- (2 ^ d)%r * (asint x)%r / q%r)) = (- 2^d) + (- round (- (2 ^ d)%r * (asint x)%r / q%r)) by smt().
rewrite -modzDm.
have -> : (- 2 ^ d) %% 2 ^ d = 0 by smt(@IntDiv).
simplify.
pose xr' := ((2 ^ d)%r * (asint x)%r / q%r).
have H2 : floor (xr' + inv 2%r) <> ceil (xr' + inv 2%r) by admit. (* checked in sage *)
rewrite (round_notie xr' H2). 
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
   multiplications and summing over the columns *)
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

op pe_R = pe^256.

module type G_t = {
   proc sample() : (W8.t Array32.t) *  (W8.t Array32.t)
}.

module type XOF_t = {
   proc init(rho :  W8.t Array32.t, i j : int) : unit
   proc next_byte() : W8.t
}.

module Parse(XOF : XOF_t) = {
   proc sample_real() : poly = {
      var j, bi, bi1, bi2, d1, d2;
      var aa : poly;
      j <- 0;
      while (j < 256) {
         bi  <@ XOF.next_byte();
         bi1 <@ XOF.next_byte();
         bi2 <@ XOF.next_byte();
         d1 <- to_uint bi        + 256 * (to_uint bi1 %% 16);
         d2 <- to_uint bi1 %/ 16 + 16  * to_uint bi2;
         if (d1 < q)                { aa.[j] <- inFq d1; j <- j + 1; }
         if ((d2 < q) && (j < 256)) { aa.[j] <- inFq d2; j <- j + 1; }
      }
      return aa;
   }

   proc sample_ideal() : poly = {
      var aa;
      aa <$ duni_R;
      return aa;
   }
}.

module type PRF_t = {
   proc init(sig : W8.t Array32.t) : unit
   proc next_bytes(_N : int) : W8.t Array128.t
}.

(* To Do *)
op bytes2bits32 : W8.t Array32.t -> bool Array256.t.
op bytes2bits128 : W8.t Array128.t -> bool Array1024.t.
op bytes2bits320 : W8.t Array320.t -> bool Array2560.t.
op bytes2bits384 : W8.t Array384.t -> bool Array3072.t.

module CBD2(PRF : PRF_t) = {
   proc sample_real(_N : int) : poly = {
      var bits,i,a,b,bytes;
      var rr : poly;
      bytes <@ PRF.next_bytes(_N);
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

We need to add here the mathematical specification of the NTT in
a way that roughly matches what is described in the spec.

Then we will have an NTT.ec file where we prove that 1) the imperative
specs are equivalent to these operators and 2) that these operators have
the properties we require to show that Kyber is correct up to some
decryption failure bound.

We should have no axioms below.

*)

op ntt : poly -> poly.
op invntt : poly -> poly.

(*  The end goal is to connect  this to polynomial algebra, which  should
    give us a notion of complex multiplication that can be plugged in to
    a theorem which we axiomatize below. *)

op cmplx_mul (a :Fq * Fq, b : Fq * Fq, zzeta : Fq) =
     (a.`2 * b.`2 * zzeta + a.`1*b.`1, 
      a.`1 * b.`2 + a.`2 * b.`1).

op dcmplx_mul(a1 : Fq * Fq, b1 : Fq * Fq, 
              a2 : Fq * Fq, b2 : Fq * Fq, zzeta : Fq) = 
     (cmplx_mul a1 b1 zzeta, cmplx_mul a2 b2 (-zzeta)).

op basemul : poly -> poly -> poly.

op zetas_const : Fq Array128.t.
op zetas_inv_const : Fq Array128.t.

axiom basemul_sem (ap bp rs: poly) :
   rs = basemul ap bp <=> 
   forall k, 0 <= k < 64 =>
     ((rs.[4*k],rs.[4*k+1]),(rs.[4*k+2],rs.[4*k+3])) =
         (dcmplx_mul (ap.[4*k],ap.[4*k+1]) (bp.[4*k],bp.[4*k+1])
            (ap.[4*k+2],ap.[4*k+3]) (bp.[4*k+2],bp.[4*k+3]) (zetas_const.[k+64])).

op scale(p : poly, c : Fq) : poly =  Array256.map (fun x => x * c) p.

axiom invnttK : cancel ntt invntt.
axiom nttK : cancel invntt ntt.
axiom nttZero : ntt Poly.zero = Poly.zero.

axiom ntt_scale p c : ntt (scale p c) = scale (ntt p) c.

lemma invntt_scale p c : invntt (scale p c) = scale (invntt p) c.
proof.
rewrite (_: p = ntt (invntt p)); first by rewrite nttK.
by rewrite -ntt_scale {1}invnttK  nttK.
qed.

axiom add_comm_ntt (pa pb : poly):
  ntt (pa &+ pb) = (ntt pa) &+ (ntt pb).

axiom mul_comm_ntt (pa pb : poly):
  ntt (pa &* pb) = basemul (ntt pa) (ntt pb).

lemma mul_scale_ntt (pa pb : poly) (c : Fq) : 
  invntt (scale (basemul (ntt pa) (ntt pb)) c) = 
   scale (pa &* pb) c by
 smt(mul_comm_ntt ntt_scale invnttK).

lemma add_scale_ntt (pa pb : poly) (c : Fq) : 
  invntt (scale ((ntt pa) &+ (ntt pb)) c) = 
   scale (pa &+ pb) c by
 smt(add_comm_ntt ntt_scale invnttK).

lemma scale1 (p : poly) :
   scale p (Zq.one) = p.
proof.
rewrite /scale.
apply Array256.ext_eq => *.
rewrite mapiE => />.
smt(@Zq).
qed.

(* END: NTT *)


module EncDec = {
   proc decode12(bytes : W8.t Array384.t) : poly = {
       var bits,i,j,fi;
       var r : poly;
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
    type R <- poly,
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

type sk = (W8.t Array384.t) Array3.t.
type pk = (W8.t Array384.t) Array3.t * W8.t Array32.t.
type msg = W8.t Array32.t.

module Kyber(G : G_t, XOF : XOF_t, PRF : PRF_t) = {
  proc key_gen() : pk * sk = {
     var rho, sig, i, j, _N,c,t,tb,sb;
     var tv,sv : (W8.t Array384.t) Array3.t;
     var a : matrix;
     var s,e : vector;
     (rho,sig) <@ G.sample();
     _N <- 0; 
     i <- 0;
     while (i < kvec) {
        j <- 0;
        while (j < kvec) {
           XOF.init(rho,i,j);
           c <@ Parse(XOF).sample_real();
           a.[(i,j)] <- c;
           j <- j + 1;
        }
        i <- i + 1;
     }      
     PRF.init(sig);
     i <- 0;
     while (i < kvec) {
        c <@ CBD2(PRF).sample_real(_N);
        s <- set s i c;
        i <- i + 1;
        _N <- _N + 1;
     }         
     i <- 0;
     while (i < kvec) {
        c <@ CBD2(PRF).sample_real(_N);
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
       sb <@ EncDec.encode12(t.[i]); sv.[i] <- sb;
       i <- i + 1;
     }
     return ((tv,rho),sv);
  }

  proc enc(pkey : pk, m : msg) : (W8.t Array320.t) Array3.t * W8.t Array128.t = {
      var _N,i,j,c,tb,tv,rho,r,e1,e2,rhat,u,v,mp,c2,c1i;
      var that : vector;
      var a : matrix;
      var c1 : (W8.t Array320.t) Array3.t;
      (tv,rho) <- pkey;
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
           XOF.init(rho,i,j);
           c <@ Parse(XOF).sample_real();
           a.[(i,j)] <- c;
           j <- j + 1;
        }
        i <- i + 1;
      }           
      i <- 0;
      while (i < kvec) {
        c <@ CBD2(PRF).sample_real(_N);
        r <- set r i c;
        i <- i + 1;
        _N <- _N + 1;
      }         
      i <- 0;
      while (i < kvec) {
        c <@ CBD2(PRF).sample_real(_N);
        e1 <- set e1 i c;
        i <- i + 1;
        _N <- _N + 1;
      }      
      e2 <@ CBD2(PRF).sample_real(_N);
      rhat <- nttv r;
      u <- (a *^ rhat) + e1;
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

  proc dec(skey : sk, c1 : (W8.t Array320.t) Array3.t, c2 : W8.t Array128.t) : W8.t Array32.t = {
      var m,mp,i,ui,v,si;
      var u,s : vector;
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
         si <@ EncDec.decode12(skey.[i]);
         s <- set s i (decompress_poly 12 si);
         i <- i + 1;
      }
      mp <- v &+ ((&-) (invntt (dotp s (nttv u))));
      m <@ EncDec.encode1(compress_poly 1 mp);
      return m;
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

op pv = pe_R^(kvec).
op pm = pe_R^(kvec^2).

op under_noise_bound (p : poly) (b : int) =
     all (fun cc => `| as_sint cc| < b) p.

op cv_bound : int = 104. (* this is the compress error bound for d = 4 *)
op fail_prob : real. (* Need to compute exact value or replace
                        with suitable bound *)

op epsilon_hack : real. (* Assumed simplification loss *)

clone import MLWE_PKE as MLWEPKE with 
  type HMLWE.Matrix_.R <- poly,
  op HMLWE.Matrix_.ZR.(+) <- Poly.(&+),
  op HMLWE.Matrix_.ZR.([-]) <- Poly.(&-),
  op HMLWE.Matrix_.ZR.zeror <- Poly.zero,
  op HMLWE.Matrix_.ZR.oner <- Poly.one,
  pred HMLWE.Matrix_.ZR.unit <- fun x => x = Poly.one,
  op HMLWE.Matrix_.ZR.( * ) <- Poly.(&*),
  op HMLWE.Matrix_.size <- kvec,
  type HMLWE.Matrix_.Matrix.matrix <- matrix,
  type HMLWE.Matrix_.vector <- vector,
  op HMLWE.Matrix_.Vector.tofunv <- tofunv,
  op HMLWE.duni_R <- duni_R,
  op HMLWE.dshort_R <- dshort_R,
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
  proof HMLWE.dshort_R_ll  by apply dshort_R_ll
  proof HMLWE.duni_R_ll by apply duni_R_ll
  proof HMLWE.duni_R_fu 
  proof HMLWE.Matrix_.ge0_size by smt(kvec_ge3)
  proof HMLWE.Matrix_.ZR.addrA by admit
  proof HMLWE.Matrix_.ZR.addrC by admit
  proof HMLWE.Matrix_.ZR.add0r by admit
  proof HMLWE.Matrix_.ZR.addNr by admit
  proof HMLWE.Matrix_.ZR.oner_neq0 by admit
  proof HMLWE.Matrix_.ZR.mulrA by admit
  proof HMLWE.Matrix_.ZR.mulrC by admit
  proof HMLWE.Matrix_.ZR.mul1r by admit
  proof HMLWE.Matrix_.ZR.mulrDl by admit
  proof HMLWE.Matrix_.ZR.mulVr by admit
  proof HMLWE.Matrix_.ZR.unitP by admit
  proof HMLWE.Matrix_.ZR.unitout by admit
  proof HMLWE.Matrix_.ZR.mulf_eq0 by admit
  proof encode_noise
  proof good_decode
  proof cv_bound_valid
  proof noise_commutes. 
  (* fixme: this clone is a mess. 
     check unproved axioms coming from ring theories *)

realize HMLWE.duni_R_fu.
proof.
  rewrite /is_full /Poly.duni_R => p.
  rewrite supp_dmap; exists (Array256.to_list p).
  split.
    rewrite supp_dlist //; split; first by rewrite size_to_list.
    rewrite allP => *. 
    by rewrite -supp_duni_elem 1: smt(@ZModField).
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

section.



import ROM_ Lazy.
declare module A : CAdversary {-LRO}.
axiom All (O <: POracle{-A}):
     islossless O.o =>
     islossless A(O).find.

(* This is an assumption on what loss there could be wrt 
   correctness because we consider rounding of uniform 
   and independent coefficients *)
axiom correctness_hack &m :
  `| Pr[CorrectnessNoiseApprox.main() @ &m : res] - 
     Pr[CorrectnessBound.main() @ &m : res] | <= epsilon_hack.

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

lemma kyber_correctness &m : 
 Pr[ AdvCorrectness(MLWE_PKE,A,LRO).main() @ &m : res]  >=
  1%r - fail_prob - epsilon_hack
  by  apply (correctness_bound A All correctness_hack fail_prob &m).
end section.

(* AT THIS POINT WE HAVE THE REFINED THEORETICAL ABSTRACTION
   AND THE SPEC. The theoretical abstraction is still working
   over arrays over Fq/bools, rather than byte encodings.
   We can prove security and correctness of the spec via
   a reduction, which is probably easier than defining operators
   for the encoding/decoding functions and include them in
   the refinement. *)

