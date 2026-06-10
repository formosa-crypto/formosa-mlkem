(* General EC imports *)
require import AllCore.

from Jasmin require import JWord.

from JazzEC require import Array32 Array33.

(* Imports of "lower-level" MLKEM spec parts *)
require import Rq.
require import Parameters.
require import Sampling.
require import VecMat.
import VecMat.PolyVec VecMat.PolyMat.
require import Serialization.
require import Symmetric.

(* ------------------------------------------------------------------ *)
(* FIPS-203 K-PKE, parametric over the global variant params (k, du, dv).
   One variant per EC run; the concrete sizes are pinned by the per-variant
   avx2 prelude axioms. *)
(* ------------------------------------------------------------------ *)

type pkey = W8.t BytesPKVec.t * W8.t Array32.t.
type skey = W8.t BytesPKVec.t.
type plaintext = W8.t Array32.t.
type ciphertext = W8.t BytesCtVec.t * W8.t BytesPoly.t.

abbrev G_coins_ds (coins : W8.t Array32.t) =
   G_coins (Array33.init (fun i => if i < 32 then coins.[i] else W8.of_int kvec)).

module KPKE = {

  proc keygen(coins: W8.t Array32.t) : pkey * skey = {
    var rho, sig, i, j, _N, c, t;
    var tv, sv : W8.t BytesPKVec.t;
    var a : polymat;
    var s, e : polyvec;
    a <- witness;
    e <- witness;
    s <- witness;
    sv <- witness;
    tv <- witness;
    (rho, sig) <- G_coins_ds coins;
    _N <- 0;
    i <- 0;
    while (i < kvec) {
      j <- 0;
      while (j < kvec) {
        XOF.init(rho, j, i);
        c <@ SampleNTT(XOF).sample();
        a.[(i, j)] <- c;
        j <- j + 1;
      }
      i <- i + 1;
    }
    i <- 0;
    while (i < kvec) {
      c <@ SamplePolyCBD.sample(PRF sig (W8.of_int _N));
      s <- s.[i <- c];
      _N <- _N + 1;
      i <- i + 1;
    }
    i <- 0;
    while (i < kvec) {
      c <@ SamplePolyCBD.sample(PRF sig (W8.of_int _N));
      e <- e.[i <- c];
      _N <- _N + 1;
      i <- i + 1;
    }
    s <- nttv s;
    e <- nttv e;
    t <- ntt_mmul a s + e;
    tv <- encode12_vec(toipolyvec t);
    sv <- encode12_vec(toipolyvec s);
    return ((tv, rho), sv);
  }

  proc encrypt(pk : pkey, m : plaintext, coins : W8.t Array32.t) : ciphertext = {
    var _N, i, j, c, tv, rho, e2, rhat, u, v, mp, c2, thati;
    var that : polyvec;
    var aT : polymat;
    var c1 : W8.t BytesCtVec.t;
    var rv, e1 : polyvec;
    aT <- witness;
    c1 <- witness;
    e1 <- witness;
    rv <- witness;
    that <- witness;
    (tv, rho) <- pk;
    _N <- 0;
    thati <- decode12_vec(tv);
    that <- ofipolyvec thati;
    i <- 0;
    while (i < kvec) {
      j <- 0;
      while (j < kvec) {
        XOF.init(rho, i, j);
        c <@ SampleNTT(XOF).sample();
        aT.[(i, j)] <- c;
        j <- j + 1;
      }
      i <- i + 1;
    }
    i <- 0;
    while (i < kvec) {
      c <@ SamplePolyCBD.sample(PRF coins (W8.of_int _N));
      rv <- rv.[i <- c];
      _N <- _N + 1;
      i <- i + 1;
    }
    i <- 0;
    while (i < kvec) {
      c <@ SamplePolyCBD.sample(PRF coins (W8.of_int _N));
      e1 <- e1.[i <- c];
      _N <- _N + 1;
      i <- i + 1;
    }
    e2 <@ SamplePolyCBD.sample(PRF coins (W8.of_int _N));
    rhat <- nttv rv;
    u <- invnttv (ntt_mmul aT rhat) + e1;
    mp <- decode1(m);
    v <- invntt (ntt_dotp that rhat) &+ e2 &+ decompress_poly 1 mp;
    c1 <- encode_vec(compress_polyvec du u);
    c2 <- encode_poly(compress_poly dv v);
    return (c1, c2);
  }

  proc decrypt(sk : skey, cph : ciphertext) : plaintext = {
    var m, mp, ui, v, vi, si, c1, c2;
    var u, s : polyvec;
    u <- witness;
    s <- witness;
    (c1, c2) <- cph;
    ui <- decode_vec(c1);
    u <- decompress_polyvec du ui;
    vi <- decode_poly(c2);
    v <- decompress_poly dv vi;
    si <- decode12_vec(sk);
    s <- ofipolyvec si;
    mp <- v &+ ((&-) (invntt (ntt_dotp s (nttv u))));
    m <- encode1(compress_poly 1 mp);
    return m;
  }
}.
