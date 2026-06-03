(* General EC imports *)
require import AllCore.

from Jasmin require import JWord.

from JazzEC require import Array32 Array33 Array64 Array160 Array1408 Array1536.

(* Imports of "lower-level" MLKEM spec parts *)
require import Rq.
require import Symmetric.
import Symmetric1024.
require import Sampling.
require import VecMat.
require import Serialization.
import Serialization1024 VecMat1024 PolyMat PolyVec.

theory InnerPKE1024.

type pkey = W8.t Array1536.t * W8.t Array32.t.
type skey = W8.t Array1536.t.
type plaintext = W8.t Array32.t.
type ciphertext = W8.t Array1408.t * W8.t Array160.t.

abbrev G_coins_ds(coins : W8.t Array32.t) = 
   G_coins (Array33.init (fun i => if i < 32 then coins.[i] else W8.of_int kvec)).

module InnerPKE1024 = {

  (* Spec gives a derandomized enc that matches this code *)
  proc kg_derand(coins: W8.t Array32.t) : pkey * skey = {
    var rho, sig, i, j, _N,c,t;
    var tv,sv : W8.t Array1536.t;
    var a : polymat;
    var s,e : polyvec;
    a <- witness;
    e <- witness;
    s <- witness;
    sv <- witness;
    tv <- witness;
    (rho,sig) <- G_coins_ds coins;
    _N <- 0; 
    i <- 0;
    while (i < kvec) {
      j <- 0;
      while (j < kvec) {
        XOF.init(rho, j, i);
        c <@ Parse(XOF).sample();
        a.[(i,j)] <- c;
        j <- j + 1;
      }
      i <- i + 1;
    }      
    i <- 0;
    while (i < kvec) {
      c <@ CBD2.sample(PRF sig (W8.of_int _N));
      s <- s.[i<-c];
      _N <- _N + 1;
      i <- i + 1;
    }         
    i <- 0;
    while (i < kvec) {
      c <@ CBD2.sample(PRF sig (W8.of_int _N));
      e <- e.[i<-c];
      _N <- _N + 1;
      i <- i + 1;
    }      
    s <- nttv s;
    e <- nttv e; 
    t <- ntt_mmul a s + e;
    tv <- encode12_vec(toipolyvec t); (* minimum residues *)
    sv <- encode12_vec(toipolyvec s); (* minimum residues *)
    return ((tv,rho),sv);
  }


  (* Spec gives a derandomized enc that matches this code *)
  proc enc_derand(pk : pkey, m : plaintext, coins : W8.t Array32.t) : ciphertext = {
    var _N,i,j,c,tv,rho,e2,rhat,u,v,mp,c2,thati;
    var that : polyvec;
    var aT : polymat;
    var c1 : W8.t Array1408.t;
    var rv,e1 : polyvec;
    aT <- witness;
    c1 <- witness;
    e1 <- witness;
    rv <- witness;
    that <- witness;
    (tv,rho) <- pk;
    _N <- 0;
    thati <- decode12_vec(tv); 
    that <- ofipolyvec thati;
    i <- 0;
    while (i < kvec) {
      j <- 0;
      while (j < kvec) {
        XOF.init(rho, i, j);
        c <@ Parse(XOF).sample();
        aT.[(i,j)] <- c; (* this is the transposed matrix *)
        j <- j + 1;
      }
      i <- i + 1;
    } 
    i <- 0;
    while (i < kvec) {
      c <@ CBD2.sample(PRF coins (W8.of_int _N));
      rv <- rv.[i<-c];
      _N <- _N + 1;
      i <- i + 1;
    }         
    i <- 0;
    while (i < kvec) {
      c <@ CBD2.sample(PRF coins (W8.of_int _N));
      e1 <- e1.[i<-c];
      _N <- _N + 1;
      i <- i + 1;
    }      
    e2 <@ CBD2.sample(PRF coins (W8.of_int _N));
    rhat <- nttv rv;
    u <- invnttv (ntt_mmul aT rhat) + e1;
    mp <- decode1(m);
    v <- invntt (ntt_dotp that rhat) &+ e2 &+ decompress_poly 1 mp; 
    c1 <- encode11_vec(compress_polyvec 11 u); 
    c2 <- encode5(compress_poly 5 v);
    return (c1,c2);
  }

  proc dec(sk : skey, cph : ciphertext) : plaintext = {
    var m,mp,ui,v,vi,si, c1, c2;
    var u,s : polyvec;
    u <- witness;
    s <- witness;
    (c1,c2) <- cph;
    ui <- decode11_vec(c1);
    u <- decompress_polyvec 11 ui;
    vi <- decode5(c2);
    v <- decompress_poly 5 vi;
    si <- decode12_vec(sk);
    s <- ofipolyvec si;
    mp <- v &+ ((&-) (invntt (ntt_dotp s (nttv u))));
    m <- encode1(compress_poly 1 mp);
    return m;
  }
}.

end InnerPKE1024.
