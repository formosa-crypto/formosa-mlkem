require import AllCore IntDiv List.
from Jasmin require import JModel.
require import Array25 Array32 Array33 Array128 Array136 Array256 Array768 Array960 Array1088 Array2304.
require import List_extra.
require import KyberPoly  KyberPolyVec KyberINDCPA.
require import KyberPoly_avx2_proof.
require import KyberPoly_avx2_vec.
require import KyberPoly_avx2_prevec.
require import KyberPolyvec_avx2_proof.
require import KyberPolyvec_avx2_vec.
require import Jkem_avx2 Jkem.
require import NTT_avx2.
require import NTT_Fq NTT_AVX_Fq.
require import Kyber_AVX_ref_lowlevel_equivs.
require import Montgomery16.
import Kyber.
import KyberSpec.
import KyberPoly.
import KyberPolyVec.
import KyberPolyvecAVX.
import KyberPolyAVXVec.
import NTT_Avx2.
import WArray136 WArray32.

(* move somewhere else *)

lemma bits8_W32u8 ws i :
  W32u8.pack32_t ws \bits8 i = if 0 <= i < 32 then ws.[i] else W8.zero.
apply W8.wordP => j hj.
case (0 <= i < 32) => hi. rewrite  W32u8.pack32bE //. rewrite get_out //. qed.

lemma ianda a b c : a => (b => c) => ((a => b) => c). smt(). qed.

lemma if_eq (a:bool) (b c d:'a) : (a => (b=d)) => (!a => (c=d)) => (if a then b else c) = d.
move => T F. case a => />. qed.

(* shake assumptions *)

op SHAKE256_ABSORB4x_33 : W8.t Array33.t -> W8.t Array33.t -> W8.t Array33.t -> W8.t Array33.t -> W256.t Array25.t.
op SHAKE256_SQUEEZENBLOCKS4x : W256.t Array25.t -> W256.t Array25.t * W8.t Array136.t * W8.t Array136.t * W8.t Array136.t * W8.t Array136.t.

axiom shake_absorb4x state seed1 seed2 seed3 seed4 : 
   phoare [ Jkem_avx2.M._shake256_absorb4x_33 : 
               arg = (state,seed1,seed2,seed3,seed4) ==>
               res = SHAKE256_ABSORB4x_33 seed1 seed2 seed3 seed4 ] = 1%r.

axiom shake_squeezenblocks4x state buf1 buf2 buf3 buf4 : 
   phoare [ Jkem_avx2.M.__shake256_squeezenblocks4x : 
               arg = (state,buf1,buf2,buf3,buf4) ==>
               res = SHAKE256_SQUEEZENBLOCKS4x state ] = 1%r.

axiom shake4x_equiv (sn1 sn2 sn3 sn4: W8.t Array33.t) (s1 s2 s3 s4 : W8.t Array32.t) n1 n2 n3 n4 :
  s1 = Array32.init (fun i => sn1.[i]) =>
  s2 = Array32.init (fun i => sn2.[i]) =>
  s3 = Array32.init (fun i => sn3.[i]) =>
  s4 = Array32.init (fun i => sn4.[i]) =>
  n1 = sn1.[32] => n2 = sn2.[32] => n3 = sn3.[32] => n4 = sn4.[32] =>
  Array128.init ("_.[_]" (SHAKE256_SQUEEZENBLOCKS4x (SHAKE256_ABSORB4x_33 sn1 sn2 sn3 sn4)).`2) = SHAKE256_33_128 s1 n1 /\
  Array128.init ("_.[_]" (SHAKE256_SQUEEZENBLOCKS4x (SHAKE256_ABSORB4x_33 sn1 sn2 sn3 sn4)).`3) = SHAKE256_33_128 s2 n2 /\
  Array128.init ("_.[_]" (SHAKE256_SQUEEZENBLOCKS4x (SHAKE256_ABSORB4x_33 sn1 sn2 sn3 sn4)).`4) = SHAKE256_33_128 s3 n3 /\
  Array128.init ("_.[_]" (SHAKE256_SQUEEZENBLOCKS4x (SHAKE256_ABSORB4x_33 sn1 sn2 sn3 sn4)).`5) = SHAKE256_33_128 s4 n4.

axiom sha3equiv : 
 equiv [ (* is this in the sha3 paper? *)
 Jkem_avx2.M._sha3_512_32 ~ M._sha3512_32 : ={arg} ==> ={res}].

lemma sha3ll : islossless M._shake256_128_33.
proc. 
while (0<=i<=128) (128 - i);1 : by move => *; auto => /> /#.
wp; call (_: true).
+ while (0<=to_uint rctr <= 192 /\ to_uint rctr %% 8 = 0) (192 - to_uint rctr); last by
    auto => /> ?; rewrite ultE;  smt(W64.to_uint_cmp W64.to_uintD_small).
  move => *; wp; conseq (_: _ ==> true); 1: by 
    auto => /> &hr; rewrite ultE /= => [#] ???; rewrite !to_uintD_small /=;  smt(W64.to_uint_cmp).
    call(_: true); 1: by islossless.
    wp; call(_: true).
    + by do 11!(unroll for ^while); islossless.
    call(_: true).
    + by do 7!(unroll for ^while); islossless.
    call(_: true).
    + while (0<=x<=5) (5 - x);last by auto => /> /#.
      move => *;wp;  while (0<=y<=5) (5 - y);last by auto => /> /#.
      move => *;inline 1;wp;sp => /=; conseq (_: _ ==> true); 1: by smt().
      call(_: true). 
    + by (unroll for ^while); islossless.
    by auto => />.
    call(_: true). 
    + by do 13!(unroll for ^while); islossless.
    by auto => />.
conseq (_: true); 1: by smt().
by inline *; do 2!(unroll for ^while); islossless.
qed.
  
equiv genmatrixequiv b :
  Jkem_avx2.M.__gen_matrix ~  M.__gen_matrix :
    arg{1}.`1 = arg{2}.`1 /\ arg{1}.`2 = b2i b /\ arg{2}.`2 =  W64.of_int (b2i b) ==>
    res{1} = nttunpackm res{2} /\
    pos_bound2304_cxq res{1} 0 2304 2 /\
    pos_bound2304_cxq res{2} 0 2304 2.
admitted. (* this is the gen_matrix avx2 equiv *)

lemma lift768_nttunpack (v : W16.t Array768.t):
  lift_array768 (nttunpackv v) = nttunpackv (lift_array768 v).
rewrite /lift_array768 /nttunpackv tP => k kb.
rewrite mapiE //= !initiE //=.
case (0<=k <256).
+ move => *; rewrite /subarray256 /nttunpack !initiE //=.
  pose a:=nttunpack_idx.[k].
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite mapiE //=. smt(nttunpack_bnd Array256.allP).
case (256<=k <512).
+ move => *; rewrite /subarray256 /nttunpack !initiE //=. smt(). smt().
  pose a:=nttunpack_idx.[k-256].
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
  rewrite mapiE //=. smt(nttunpack_bnd Array256.allP).
move => *; rewrite /subarray256 /nttunpack !initiE //=. smt(). smt().
pose a:=nttunpack_idx.[k-512].
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite initiE //=. smt(nttunpack_bnd Array256.allP).
rewrite mapiE //=. smt(nttunpack_bnd Array256.allP).
qed.

module GetNoiseAVX2 = {
   proc _poly_getnoise_eta1_4x(aux3 aux2 aux1 aux0 : W16.t Array256.t,
                               noiseseed : W8.t Array32.t, 
                               nonce : W8.t) : 
      W16.t Array256.t * W16.t Array256.t * W16.t Array256.t * W16.t Array256.t = {
      var n3, n2, n1, n0 : W8.t;
      var aux_3, aux_2, aux_1, aux_0 : W16.t Array256.t;
      n0 <- nonce + W8.of_int 3;
      n1 <- nonce + W8.of_int 2;
      n2 <- nonce + W8.of_int 1;
      n3 <- nonce;
      aux_3 <@ M._poly_getnoise(aux3,noiseseed,n3);
      aux_2 <@ M._poly_getnoise(aux2,noiseseed,n2);
      aux_1 <@ M._poly_getnoise(aux1,noiseseed,n1);
      aux_0 <@ M._poly_getnoise(aux0,noiseseed,n0);
      return (aux_3, aux_2, aux_1, aux_0);
  }

  proc sample_noise_kg(skpv pkpv e : W16.t Array768.t, noiseseed:W8.t Array32.t) : W16.t Array768.t * W16.t Array768.t ={
     var nonce : W8.t;
     var aux_3, aux_2, aux_1, aux_0 : W16.t Array256.t;
                nonce <- (W8.of_int 0);
                (aux_3, aux_2, aux_1,
                aux_0) <@ _poly_getnoise_eta1_4x ((Array256.init (fun i_0 => skpv.[0 + i_0])),
                (Array256.init (fun i_0 => skpv.[256 + i_0])),
                (Array256.init (fun i_0 => skpv.[(2 * 256) + i_0])),
                (Array256.init (fun i_0 => e.[0 + i_0])), noiseseed, nonce);
                skpv <- Array768.init
                        (fun i_0 => if 0 <= i_0 < 0 + 256 then aux_3.[i_0-0]
                        else skpv.[i_0]);
                skpv <- Array768.init
                        (fun i_0 => if 256 <= i_0 < 256 + 256
                        then aux_2.[i_0-256] else skpv.[i_0]);
                skpv <- Array768.init
                        (fun i_0 => if (2 * 256) <= i_0 < (2 * 256) + 256
                        then aux_1.[i_0-(2 * 256)] else skpv.[i_0]);
                e <- Array768.init
                     (fun i_0 => if 0 <= i_0 < 0 + 256 then aux_0.[i_0-0]
                     else e.[i_0]);
                nonce <- (W8.of_int 4);
                (aux_3, aux_2, aux_1,
                aux_0) <@ _poly_getnoise_eta1_4x ((Array256.init (fun i_0 => e.[256 + i_0])),
                (Array256.init (fun i_0 => e.[(2 * 256) + i_0])),
                (Array256.init (fun i_0 => pkpv.[0 + i_0])),
                (Array256.init (fun i_0 => pkpv.[256 + i_0])), noiseseed,
                nonce);
                e <- Array768.init
                     (fun i_0 => if 256 <= i_0 < 256 + 256
                     then aux_3.[i_0-256] else e.[i_0]);
                e <- Array768.init
                     (fun i_0 => if (2 * 256) <= i_0 < (2 * 256) + 256
                     then aux_2.[i_0-(2 * 256)] else e.[i_0]);
     return (skpv,e);
  }

  proc samplenoise_enc(sp_0 ep bp : W16.t Array768.t, epp : W16.t Array256.t, noiseseed:W8.t Array32.t) : W16.t Array768.t * W16.t Array768.t * W16.t Array768.t * W16.t Array256.t  = {
     var nonce : W8.t;
     var aux_2, aux_1, aux_0, aux : W16.t Array256.t;
                nonce <- (W8.of_int 0);
                (aux_2, aux_1, aux_0,
                aux) <@ _poly_getnoise_eta1_4x ((Array256.init (fun i_0 => sp_0.[0 + i_0])),
                (Array256.init (fun i_0 => sp_0.[256 + i_0])),
                (Array256.init (fun i_0 => sp_0.[(2 * 256) + i_0])),
                (Array256.init (fun i_0 => ep.[0 + i_0])), noiseseed,
                nonce);
                sp_0 <- Array768.init
                        (fun i_0 => if 0 <= i_0 < 0 + 256 then aux_2.[i_0-0]
                        else sp_0.[i_0]);
                sp_0 <- Array768.init
                        (fun i_0 => if 256 <= i_0 < 256 + 256
                        then aux_1.[i_0-256] else sp_0.[i_0]);
                sp_0 <- Array768.init
                        (fun i_0 => if (2 * 256) <= i_0 < (2 * 256) + 256
                        then aux_0.[i_0-(2 * 256)] else sp_0.[i_0]);
                ep <- Array768.init
                      (fun i_0 => if 0 <= i_0 < 0 + 256 then aux.[i_0-0]
                      else ep.[i_0]);
                nonce <- (W8.of_int 4);
                (aux_2, aux_1, aux_0,
                aux) <@ _poly_getnoise_eta1_4x ((Array256.init (fun i_0 => ep.[256 + i_0])),
                (Array256.init (fun i_0 => ep.[(2 * 256) + i_0])), epp,
                (Array256.init (fun i_0 => bp.[0 + i_0])), noiseseed,
                nonce);
                ep <- Array768.init
                      (fun i_0 => if 256 <= i_0 < 256 + 256
                      then aux_2.[i_0-256] else ep.[i_0]);
                ep <- Array768.init
                      (fun i_0 => if (2 * 256) <= i_0 < (2 * 256) + 256
                      then aux_1.[i_0-(2 * 256)] else ep.[i_0]);
                epp <- aux_0;
                bp <- Array768.init
                      (fun i_0 => if 0 <= i_0 < 0 + 256 then aux.[i_0-0]
                      else bp.[i_0]);
                return (sp_0,ep,bp, epp);

  }

  proc __poly_getnoise (rp:W16.t Array256.t, buf:W8.t Array128.t) : W16.t Array256.t = {
    var i,j:W64.t;
    var a,b,c:W8.t;
    var t:W16.t;

    i <- (W64.of_int 0);
    j <- (W64.of_int 0);
    while ((i \ult (W64.of_int 128))) {
      c <- buf.[(W64.to_uint i)];
      a <- c;
      a <- (a `&` (W8.of_int 85));
      c <- (c `>>` (W8.of_int 1));
      c <- (c `&` (W8.of_int 85));
      c <- (c + a);
      a <- c;
      a <- (a `&` (W8.of_int 3));
      b <- c;
      b <- (b `>>` (W8.of_int 2));
      b <- (b `&` (W8.of_int 3));
      a <- (a - b);
      t <- (sigextu16 a);
      rp.[(W64.to_uint j)] <- t;
      a <- c;
      a <- (a `>>` (W8.of_int 4));
      a <- (a `&` (W8.of_int 3));
      b <- (c `>>` (W8.of_int 6));
      b <- (b `&` (W8.of_int 3));
      a <- (a - b);
      t <- (sigextu16 a);
      j <- (j + (W64.of_int 1));
      rp.[(W64.to_uint j)] <- t;
      i <- (i + (W64.of_int 1));
      j <- (j + (W64.of_int 1));
    }
    return (rp);
  }
  proc _poly_getnoise (rp:W16.t Array256.t, seed:W8.t Array32.t,nonce:W8.t) : W16.t Array256.t = {
    var buf:W8.t Array128.t;
    var r;

    buf <- witness;
    buf <@ M._shake256_128_33 (buf,Array33.init (fun i => if i=32 then nonce else seed.[i]));
    r <@ __poly_getnoise(rp,buf);
    return r;
  }
  proc __poly_getnoise_eta1_4x(aux3 aux2 aux1 aux0 : W16.t Array256.t,
                               noiseseed : W8.t Array32.t, 
                               nonce : W8.t) : 
      W16.t Array256.t * W16.t Array256.t * W16.t Array256.t * W16.t Array256.t = {
      var n3, n2, n1, n0 : W8.t;
      var aux_3, aux_2, aux_1, aux_0 : W16.t Array256.t;
      n0 <- nonce + W8.of_int 3;
      n1 <- nonce + W8.of_int 2;
      n2 <- nonce + W8.of_int 1;
      n3 <- nonce;
      aux_3 <@ _poly_getnoise(aux3,noiseseed,n3);
      aux_2 <@ _poly_getnoise(aux2,noiseseed,n2);
      aux_1 <@ _poly_getnoise(aux1,noiseseed,n1);
      aux_0 <@ _poly_getnoise(aux0,noiseseed,n0);
      return (aux_3, aux_2, aux_1, aux_0);
  }
}.

equiv getnoise_split : 
  M._poly_getnoise ~ GetNoiseAVX2._poly_getnoise : ={arg} ==> ={res}.
proc; wp; sp => />. 
seq 2 0 : (srp{1}=rp{1} /\ ={buf,rp,seed,nonce} /\ extseed{1}=Array33.init (fun i => if i=32 then nonce{1} else seed{1}.[i]) ).
wp. while{1} (0 <= k{1} <= 32 /\ (forall i, 0 <= i < k{1} => extseed{1}.[i]=seed{1}.[i])) (32-k{1}).
auto => /> &m H1 H2 H3 H4. split. split. smt(). move => i Hi1 Hi2. rewrite get_setE 1:/#. smt(). smt().
auto => /> &m. split. move => i Hi1 Hi2. rewrite !get_out /#. move => extseed k. split. smt(). move => H1 H2 H3 H4. rewrite tP => i Hi. rewrite !initiE 1:/# => />. rewrite get_setE 1:/#. smt().
seq 1 1 : (#pre).
call (_:true). auto => />. sim. auto => />.  
inline *. sim. qed.

abbrev noise_evens (buf:W8.t Array128.t) (i:W64.t) = (sigextu16 (((((buf.[(W64.to_uint i)] `>>` (W8.of_int 1)) `&` (W8.of_int 85)) + (buf.[(W64.to_uint i)] `&` (W8.of_int 85))) `&` (W8.of_int 3)) - (((((buf.[(W64.to_uint i)] `>>` (W8.of_int 1)) `&` (W8.of_int 85)) + (buf.[(W64.to_uint i)] `&` (W8.of_int 85))) `>>` (W8.of_int 2)) `&` (W8.of_int 3)))).

abbrev noise_odds (buf:W8.t Array128.t) (i:W64.t) = (sigextu16 ((((((buf.[(W64.to_uint i)] `>>` (W8.of_int 1)) `&` (W8.of_int 85)) + (buf.[(W64.to_uint i)] `&` (W8.of_int 85))) `>>` (W8.of_int 4)) `&` (W8.of_int 3)) - (((((buf.[(W64.to_uint i)] `>>` (W8.of_int 1)) `&` (W8.of_int 85)) + (buf.[(W64.to_uint i)] `&` (W8.of_int 85))) `>>` (W8.of_int 6)) `&` (W8.of_int 3)))).

equiv getnoise_1x_equiv_avx :
  Jkem_avx2.M.__poly_cbd_eta1 ~ GetNoiseAVX2.__poly_getnoise : ={arg} ==> ={res}.
proc; wp => />. rcondt{1} 1. auto => />. inline *; wp; sp => />. 
async while
  [ (fun x => i < x), i{1} + 1 ]
  [ (fun x => W64.to_uint i < 32*x), i{1} + 1 ]
  (i{1} < 4 /\ W64.to_uint i{2} < 128) (!(i{1} < 4))
  :( aux{1}=4 /\ 0 <= i{1} /\ buf0{1} = (Array128.init (fun i => buf{1}.[i])) /\ mask55_s{1} = (W32.of_int 1431655765) /\ mask33_s{1} = (W32.of_int 858993459) /\ mask03_s{1} = (W32.of_int 50529027) /\ mask0F_s{1} = (W32.of_int 252645135) /\ mask55{1} = VPBROADCAST_8u32 mask55_s{1} /\ mask33{1} = VPBROADCAST_8u32 mask33_s{1} /\ mask03{1} = VPBROADCAST_8u32 mask03_s{1} /\ mask0F{1} = VPBROADCAST_8u32 mask0F_s{1}
  /\ j{2} = W64.of_int 2 * i{2}
  /\ ={buf} /\ W64.to_uint i{2}= 32 * i{1} /\ (forall k, 0 <= k < i{1} * 64 => rp0{1}.[k] = rp{2}.[k])
  ) => //=.
(*invariants*)
move => /> &1 &2 H1 H2 H3 H4 H5 H6. rewrite ultE of_uintK //= H6 //=. smt().
move => /> &1 &2 H1 H2 H3 H4 H5. case H4 => />. rewrite ultE of_uintK //=. smt(). 
move => /> &1 &2 H1 H2 H3 H4 H5 H6. rewrite ultE of_uintK //= H2. smt().
move => &2. auto => />. 
move => &1. auto => /> &m H1 H2 H3 H4 H5 H6. split. smt(). split. smt(). move => k Hk1 Hk2. rewrite H3 //=. rewrite !set_neqiE /#.
(*inner*)
move => v1 v2. conseq (_:_ ==> aux{1} = 4 /\ 0 <= i{1} /\ j{2} = (of_int 2)%W64 * i{2} /\ ={buf} /\ to_uint i{2} = 32 * i{1} /\ forall (k : int), 0 <= k && k < i{1} * 64 => rp0{1}.[k] = rp{2}.[k]). auto => />.
rcondt{1} 1. auto => /> &hr H1 H2 H3 H4. smt(). 
rcondf{1} 31. auto => />.
seq 30 0 : ( aux{1} = 4 /\ 0 <= i{1}-1 < 4 /\ j{2} = (of_int 2)%W64 * i{2} /\ ={buf} /\ to_uint i{2} = 32 * (i{1}-1) /\ (forall (k : int), 0 <= k && k < (i{1}-1) * 64 => rp0{1}.[k] = rp{2}.[k]) /\ v2 = i{1} /\ (forall k, 0 <= k < 32 => rp0{1}.[(i{1}-1)*64+k*2]=noise_evens buf{1} (W64.of_int ((i{1}-1)*32+k)) /\ rp0{1}.[(i{1}-1)*64+k*2+1]=noise_odds buf{1} (W64.of_int ((i{1}-1)*32+k))) ).
(* avx2 (64 bits) vs ori (32 * 2 bits) equiv *)
auto => /> &1 &2. rewrite !ultE of_uintK => /> H1 H2 H3 H4 H5 H6. split.
move => k Hk1 Hk2. rewrite initiE //= 1:/#. rewrite get16_set256E 1..2:/# ifF 1:/#. rewrite get16_init16 1:/# initiE //= 1:/#. rewrite get16_set256E 1..2:/# ifF 1:/#. rewrite get16_init16 1:/# initiE //= 1:/#. rewrite get16_set256E 1..2:/# ifF 1:/#. rewrite get16_init16 1:/# initiE //= 1:/#. rewrite get16_set256E 1..2:/# ifF 1:/#. rewrite get16_init16 1:/#. rewrite H3 //=.
admit. (*move => k Hk1 Hk2. rewrite !initiE //= 1..2:/#. rewrite !get16_set256E //= 1..4:/#. rewrite !bits16_W16u16. 

split.
+ rewrite !initiE //= 1:/#. rewrite !get16_set256E //= 1..2:/#. progress.
  apply if_eq => />. move => K1 K2. rewrite bits16_W16u16. rewrite ifT 1:/#. rewrite get_of_list 1:/#. rewrite nth_onth onth_map (onth_nth witness) //= 1:/#. 

rewrite wordP => i Hi. rewrite bits16iE 1:/#. rewrite pack16wE 1:/#.


apply bits16_W16u8.*)
(*while*)
while{2}
  (v2 = i{1} /\ ={buf} /\ 0 <= i{1}-1 < 4 /\ 32 * (i{1}-1) <= W64.to_uint i{2} /\ i{2} \ule W64.of_int 32 * W64.of_int i{1} /\ j{2} = W64.of_int 2 * i{2} /\ (forall k, (0 <= k && k < W64.to_uint j{2}) => rp0{1}.[k] = rp{2}.[k]) /\ (forall k, 0 <= k < 32 => rp0{1}.[(i{1}-1)*64+k*2]=noise_evens buf{1} (W64.of_int ((i{1}-1)*32+k)) /\ rp0{1}.[(i{1}-1)*64+k*2+1]=noise_odds buf{1} (W64.of_int ((i{1}-1)*32+k))) )
  (128 - W64.to_uint i{2}).
move => /> &m z. auto => /> &m2. rewrite !uleE ultE !of_uintK //= => H1 H2 H3 H4 H5 H6 H7 H8. rewrite to_uintM_small !of_uintK //= 1:/#. rewrite !to_uintD_small !of_uintK //= 1:/#. rewrite to_uintM_small !of_uintK //= 1..2:/#. rewrite to_uintM_small !of_uintK //= 1..2:/#. split. split. smt(). split. smt(). split. rewrite W64.WRingA.mulrDr //=. move => k Hk1. rewrite to_uintM_small !of_uintK 1:/# //= => Hk2.
case (k < 2 * W64.to_uint i{m2}) => /> Hk3.
 rewrite !set_neqiE 1..4:/#. rewrite H5 //=. rewrite to_uintM_small !of_uintK //= 1:/#.
case (k=2 * to_uint i{m2} + 1) => />.
 rewrite set_eqiE //= 1:/#. move :(H6 (W64.to_uint i{m2} - 32*(i{m}-1))). apply ianda. smt(). rewrite (_: (i{m}-1) * 64 + (to_uint i{m2} - 32 * (i{m}-1)) * 2 = 2 * to_uint i{m2}). smt(). move => /> H9 H10. rewrite H10 //. rewrite (_: ((W64.of_int ((i{m}-1) * 32 + (to_uint i{m2} - 32 * (i{m}-1))))) = i{m2}) //=. rewrite mulrC addrCA subrr addr0 to_uintK //.
 move => Hk4. have ->: k = 2* to_uint i{m2}. smt(). rewrite set_neqiE //= 1..2:/#. rewrite set_eqiE //= 1:/#. move :(H6 (W64.to_uint i{m2} - 32*(i{m}-1))). apply ianda. smt(). rewrite (_: (i{m}-1) * 64 + (to_uint i{m2} - 32 * (i{m}-1)) * 2 = 2 * to_uint i{m2}). smt(). rewrite (_: (W64.of_int ((i{m}-1) * 32 + (to_uint i{m2} - 32 * (i{m}-1)))) = i{m2} ) //=. rewrite mulrC addrCA subrr addr0 to_uintK //. smt().
auto => /> &1 &2. rewrite !uleE !of_uintK //= => H1 H2 H3 H4 H5. split. split. smt(). split. smt(). move => k Hk1. rewrite to_uintM_small !of_uintK //= 1:/#. move => Hk2. rewrite H4 //. smt(). move => iR rpR. split. rewrite !uleE !ultE of_uintK //= => R1 R2 R3 R4. smt(). rewrite negb_and uleE ultE !of_uintK //= => R5 R6 R7 R8. split. smt(). split. smt(). move => k Hk1 Hk2. rewrite R8 //=. rewrite to_uintM_small !of_uintK //= 1..2:/#. 
(*lossless*)
rcondf 1; auto => /> &1 H1 H2 H3. smt().
rcondf 1; auto => /> &2 H1 H2 H3. smt().
(*end*)
auto => /> iL rp0L iR rpR H1 H2 H3 H4 H5. rewrite tP => k Hk. rewrite H5 //= /#.
qed.

equiv getnoise_4x_split : 
  GetNoiseAVX2._poly_getnoise_eta1_4x ~ GetNoiseAVX2.__poly_getnoise_eta1_4x : ={arg} ==> ={res}.
proc; wp; sp => />. call getnoise_split => />. call getnoise_split => />. call getnoise_split => />. call getnoise_split => />. auto => />. qed.

equiv getnoiseequiv_avx : 
   Jkem_avx2.M._poly_getnoise_eta1_4x ~ GetNoiseAVX2._poly_getnoise_eta1_4x : ={arg} ==> ={res}.
proc*. 
transitivity{2} { r <@ GetNoiseAVX2.__poly_getnoise_eta1_4x(aux3,aux2,aux1,aux0,noiseseed,nonce); } ((r0{1}, r1{1}, r2{1}, r3{1}, seed{1}, nonce{1}) = (aux3{2}, aux2{2}, aux1{2}, aux0{2}, noiseseed{2}, nonce{2}) ==> ={r}) (={aux3,aux2,aux1,aux0,noiseseed,nonce} ==> ={r}); last first.
symmetry. call getnoise_4x_split => />. auto => />. smt(). smt().
(*main proof*)
inline Jkem_avx2.M._poly_getnoise_eta1_4x GetNoiseAVX2.__poly_getnoise_eta1_4x GetNoiseAVX2._poly_getnoise. swap{2} [30..31] 5. swap{2} [23..24] 10. swap{2} [16..17] 15.
seq 25 30 : (
    r00{1}=rp{2}  /\ Array128.init (fun (i : int) => buf0{1}.[i]) =buf{2}
 /\ r10{1}=rp0{2} /\ Array128.init (fun (i : int) => buf1{1}.[i]) =buf0{2}
 /\ r20{1}=rp1{2} /\ Array128.init (fun (i : int) => buf2{1}.[i]) =buf1{2}
 /\ r30{1}=rp2{2} /\ Array128.init (fun (i : int) => buf3{1}.[i]) =buf2{2}
).
sp => />.
ecall{2} (shake256_33_128 buf2{2} (Array33.init (fun i => if i = 32 then nonce4{2} else seed2{2}.[i]))); wp => />.
ecall{2} (shake256_33_128 buf1{2} (Array33.init (fun i => if i = 32 then nonce3{2} else seed1{2}.[i]))); wp => />.
ecall{2} (shake256_33_128 buf0{2} (Array33.init (fun i => if i = 32 then nonce2{2} else seed0{2}.[i]))); wp => />.
ecall{2} (shake256_33_128 buf{2} (Array33.init (fun i=> if i = 32 then nonce1{2} else seed{2}.[i]))); wp => />.
ecall{1} (shake_squeezenblocks4x state{1} buf0{1} buf1{1} buf2{1} buf3{1}); wp => />.
ecall{1} (shake_absorb4x state{1} (Array33.init (fun i => buf0{1}.[i])) (Array33.init (fun i => buf1{1}.[i])) (Array33.init (fun i => buf2{1}.[i])) (Array33.init (fun i => buf3{1}.[i])) ); wp => />.
auto => /> &2. rewrite shake4x_equiv => />.
rewrite tP => k Hk; rewrite !initiE //= 1..3:/#; rewrite ifF 1:/#; rewrite /get8 /init8 set_neqiE 1..2:/#; rewrite initiE //= 1:/#; rewrite initiE //= 1:/#; rewrite set256E initiE //= 1:/#; rewrite ifT //; rewrite /get256_direct bits8_W32u8 //=; rewrite ifT //; rewrite initiE //=; rewrite initiE //=.
rewrite tP => k Hk; rewrite !initiE //= 1..3:/#; rewrite ifF 1:/#; rewrite /get8 /init8 set_neqiE 1..2:/#; rewrite initiE //= 1:/#; rewrite initiE //= 1:/#; rewrite set256E initiE //= 1:/#; rewrite ifT //; rewrite /get256_direct bits8_W32u8 //=; rewrite ifT //; rewrite initiE //=; rewrite initiE //=.
rewrite tP => k Hk; rewrite !initiE //= 1..3:/#; rewrite ifF 1:/#; rewrite /get8 /init8 set_neqiE 1..2:/#; rewrite initiE //= 1:/#; rewrite initiE //= 1:/#; rewrite set256E initiE //= 1:/#; rewrite ifT //; rewrite /get256_direct bits8_W32u8 //=; rewrite ifT //; rewrite initiE //=; rewrite initiE //=.
rewrite tP => k Hk; rewrite !initiE //= 1..3:/#; rewrite ifF 1:/#; rewrite /get8 /init8 set_neqiE 1..2:/#; rewrite initiE //= 1:/#; rewrite initiE //= 1:/#; rewrite set256E initiE //= 1:/#; rewrite ifT //; rewrite /get256_direct bits8_W32u8 //=; rewrite ifT //; rewrite initiE //=; rewrite initiE //=.
wp. call getnoise_1x_equiv_avx => />.
wp. call getnoise_1x_equiv_avx => />.
wp. call getnoise_1x_equiv_avx => />.
wp. call getnoise_1x_equiv_avx => />.
auto => />. qed.

lemma polygetnoise_ll : islossless M._poly_getnoise.
proc. 
while (0 <= to_uint i <= 128) (128 - to_uint i);
  1: by move => z; auto => />;rewrite  ultE /= => &hr ???; rewrite !to_uintD_small /=; smt(to_uint_cmp).
wp; call sha3ll; wp; while (0<=k<=32) (32 -k); 1: by move => z; auto=> /> /#.
auto => /> *; do split; 1:smt(). 
by move => *; rewrite ultE /=; smt().
qed.

equiv getnoiseequiv : 
   M._poly_getnoise ~ M._poly_getnoise :
   ={arg} ==> ={res} /\
   signed_bound_cxq res{1} 0 256 1.
have H : forall &m a,
   Pr[ M._poly_getnoise(a) @ &m : forall k, 0<=k<256 => -5 < to_sint res.[k] < 5] = 1%r.
+ move => &m a.
  have -> : 1%r = Pr [ CBD2(KPRF).sample(a.`2,to_uint a.`3) @ &m : true].
  + byphoare => //.
    proc; inline *; while (0<=i<=128) (128-i); 1: by move => z; auto => /> /#. 
    by auto => /> /#.
  by byequiv get_noise_sample_noise => //.
have HH0 : hoare [ M._poly_getnoise : true ==> forall k, 0<=k<256 => -5 < to_sint res.[k] < 5].
+ hoare; bypr => //= &m; rewrite Pr[mu_not].
  have -> : Pr[M._poly_getnoise(rp{m}, seed{m}, nonce{m}) @ &m : true] = 1%r.
  + by byphoare => //; apply polygetnoise_ll.
  smt().
have HHH : equiv [  M._poly_getnoise ~ M._poly_getnoise : ={arg} ==> ={res} ] by sim.
conseq HHH HH0.
move => *; rewrite /signed_bound_cxq /b16 qE /#.
qed.

lemma kyber_correct_kg_avx2 mem _pkp _skp _randomnessp : 
   equiv [ Jkem_avx2.M.__indcpa_keypair ~ Kyber(KHS,XOF,KPRF,H).kg_derand : 
       Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp /\ to_uint skp{1} = _skp /\ 
       to_uint randomnessp{1} = _randomnessp /\
       seed{2} = Array32.init(fun i=> loadW8 Glob.mem{1} (to_uint randomnessp{1}  + i)) /\
       valid_ptr (to_uint randomnessp{1}) 32 /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3)
        ==> 
       touches2 Glob.mem{1} mem _pkp (384*3+32) _skp (384*3) /\
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk = load_array1152 Glob.mem{1} _skp /\
         t = load_array1152 Glob.mem{1} _pkp  /\
         rho = load_array32 Glob.mem{1} (_pkp+1152)].
proc*.
transitivity {1} { Jkem.M.__indcpa_keypair(pkp, skp, randomnessp);} 
(={Glob.mem,pkp,skp,randomnessp} /\ 
  Glob.mem{1} = mem /\
    to_uint pkp{1} = _pkp /\
    to_uint skp{1} = _skp /\
    to_uint randomnessp{1} = _randomnessp /\ 
       valid_ptr (to_uint randomnessp{1}) 32 /\
    valid_disj_reg _pkp (384 * 3 + 32) _skp (384 * 3) ==> ={Glob.mem}) 
(   Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp /\ to_uint skp{1} = _skp /\ 
       to_uint randomnessp{1} = _randomnessp /\
       seed{2} = Array32.init(fun i=> loadW8 Glob.mem{1} (to_uint randomnessp{1}  + i)) /\
       valid_ptr (to_uint randomnessp{1}) 32 /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3)
    ==> 
    touches2 Glob.mem{1} mem _pkp (384*3+32) _skp (384*3) /\
    let (pk, sk) = r{2} in
    let (t, rho) = pk in
        sk = load_array1152 Glob.mem{1} _skp /\
        t = load_array1152 Glob.mem{1} _pkp /\ 
        rho = load_array32 Glob.mem{1} (_pkp + 1152)); 1,2: smt(); 
   last by call(kyber_correct_kg mem _pkp _skp _randomnessp); auto => />. 

inline{1} 1; inline {2} 1;  sim 43 60. 

call (polyvec_tobytes_equiv _pkp).
call (polyvec_tobytes_equiv _skp).
wp;conseq />. smt().
ecall (polyvec_reduce_equiv (lift_array768 pkpv{2})).

have H := polyvec_add2_equiv 2 2 _ _ => //.
ecall (H (lift_array768 pkpv{2}) (lift_array768 e{2})); clear H.
unroll for {1} 37.

sp 3 3.

seq 17 17  : (#pre /\ ={publicseed, noiseseed,sskp,spkp,e,skpv,pkpv} /\ sskp{2} = skp{1} /\ spkp{2} = pkp{1}); 1: by
 sp; conseq />; sim 2 2; call( sha3equiv); conseq />; sim. 

seq 1 2 : (#pre /\ aa{1} = nttunpackm a{2} /\
           pos_bound2304_cxq aa{1} 0 2304 2 /\
           pos_bound2304_cxq a{2} 0 2304 2); 1: by 
   conseq />; call (genmatrixequiv false); auto => />.

swap {1} [11..12] 2.

seq 10 18 : (#pre  /\
    signed_bound768_cxq skpv{1} 0 768 1 /\
    signed_bound768_cxq e{1} 0 768 1 /\
    signed_bound768_cxq skpv{2} 0 768 1 /\
    signed_bound768_cxq e{2} 0 768 1). 
+ conseq />.
  transitivity {1} { (skpv,e) <@ GetNoiseAVX2.sample_noise_kg(skpv,pkpv,e,noiseseed);} (={noiseseed,skpv,pkpv,e} ==> ={skpv,e}) 
   (
   ((pkp0{2} = pkp{2} /\
    skp0{2} = skp{2} /\
    randomnessp0{2} = randomnessp{2} /\
    pkp0{1} = pkp{1} /\
    skp0{1} = skp{1} /\
    randomnessp0{1} = randomnessp{1} /\
    ={Glob.mem, pkp, skp, randomnessp} /\
    Glob.mem{1} = mem /\
    to_uint pkp{1} = _pkp /\
    to_uint skp{1} = _skp /\
    to_uint randomnessp{1} = _randomnessp /\
    valid_ptr (to_uint randomnessp{1}) 32 /\ valid_disj_reg _pkp (384 * 3 + 32) _skp (384 * 3)) /\
   ={publicseed, noiseseed, sskp, spkp, skpv, pkpv, e}) /\
  aa{1} = nttunpackm a{2} /\ pos_bound2304_cxq aa{1} 0 2304 2 /\ pos_bound2304_cxq a{2} 0 2304 2
   ==> 
    ={skpv, e} /\
  signed_bound768_cxq skpv{1} 0 768 1 /\
  signed_bound768_cxq e{1} 0 768 1 /\ signed_bound768_cxq skpv{2} 0 768 1 /\ signed_bound768_cxq e{2} 0 768 1
  ); 1,2:smt().
  + by inline {2} 1;do 2!(wp; call getnoiseequiv_avx);auto => />. 
  inline {1} 1. inline GetNoiseAVX2._poly_getnoise_eta1_4x.
  wp; do 2!(call{1} (_: true ==> true); 1: by apply polygetnoise_ll).
  do 6!(wp; call  getnoiseequiv); auto => />.
  move => &1 &2 ????????R?; split.
  + by rewrite tP => k kb; rewrite !initiE //= initiE /#.
  move => ?R0?; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R1?????; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R2?; do split. 
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  rewrite /signed_bound768_cxq => x xb /=.
  rewrite !initiE //= fun_if. 
  case (512 <= x && x < 768); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  case (256 <= x && x < 512); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  by smt().

seq 2 2 : (#{/~skpv{1}}{~e{1}}{~skpv{2}}{~e{2}}pre /\ 
           lift_array768 skpv{1} = nttunpackv (lift_array768 skpv{2}) /\
           lift_array768 e{1} = nttunpackv (lift_array768 e{2}) /\
           pos_bound768_cxq skpv{1} 0 768 2 /\
           pos_bound768_cxq skpv{2} 0 768 2 /\
           pos_bound768_cxq e{1} 0 768 2 /\
           pos_bound768_cxq e{2} 0 768 2); 1: 
 by  conseq />; call (nttequiv); call (nttequiv); auto => /> /#.

(* First ip *)

seq 8 4: (#{/~pkpv{2}}pre /\ 
              lift_array256 (subarray256 pkpv{1} 0) = nttunpack (lift_array256 (subarray256 pkpv{2} 0)) /\
              signed_bound768_cxq pkpv{1} 0 256 2 /\
              signed_bound768_cxq pkpv{2} 0 256 2 /\ i{1} = 1).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE // 1:/# /= kb /= initiE //=. 
+ rewrite /signed_bound768_cxq => k kb; rewrite initiE //=. 
+ rewrite /unpackm /unpackv /=.
  rewrite !initiE // 1:/# /= kb /= initiE //=.
  rewrite fun_if. 
  case (0<=k<256).
  + move => kbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray768 a{2} 0).[256 * 0 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array768.initiE). smt().
  case (256<=k<512).
  + move => kbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray768 a{2} 0).[256 * 1 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array768.initiE). smt(). auto.
  case (512<=k<768).
  + move => kbbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray768 a{2} 0).[256 * 2 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array768.initiE). smt(). auto.
  by smt().
+ move : H10; rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ move : H8; rewrite /pos_bound768_cxq /signed_bound_768_cxq; smt(Array768.initiE).
+ move : H10; rewrite /pos_bound768_cxq /signed_bound_768_cxq; smt(Array768.initiE).

move => H15 H16 H17 H18 H19 r1 r2 H20 H21 H22;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H20; rewrite /lift_array256 tP => H20.
  move : (H20 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

move => H23 r3 r4 H24 H25 H26;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H24; rewrite /lift_array256 tP => H24.
  move : (H24 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).


+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

(* Second ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 1) = nttunpack (lift_array256 (subarray256 pkpv{2} 1)) /\
              signed_bound768_cxq pkpv{1} 256 512 2 /\
              signed_bound768_cxq pkpv{2} 256 512 2 /\ i{1} = 2).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H18 H19 H20 H21 H22 r1 r2 H23 H24 H25;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1,2: smt(nttunpack_bnd Array256.allP).
  move : H23; rewrite /lift_array256 tP => H23.
  move : (H23 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

move => H26 r3 r4 H27 H28 H29;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H15; rewrite /lift_array256 /subarray256 tP => H15.
  move : (H15 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H27; rewrite /lift_array256 /subarray256 tP => H27.
  move : (H27 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

(* Third ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 2) = nttunpack (lift_array256 (subarray256 pkpv{2} 2)) /\
              signed_bound768_cxq pkpv{1} 512 768 2 /\
              signed_bound768_cxq pkpv{2} 512 768 2).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H21 H22 H23 H24 H25 r1 r2 H26 H27 H28;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1,2: smt(nttunpack_bnd Array256.allP).
  move : H26; rewrite /lift_array256 tP => H26.
  move : (H26 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

  move => H29 r3 r4 H30 H31 H32;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H15; rewrite /lift_array256 /subarray256 tP => H15.
  move : (H15 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H18; rewrite /lift_array256 /subarray256 tP => H18.
  move : (H18 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H30; rewrite /lift_array256 /subarray256 tP => H30.
  move : (H30 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().


auto => />.

move => &1 &2 ???????????????H1??H2??H3??. 
do split.
+ smt().
+ smt(). 
+ rewrite /lift_array256 /subarray256 tP in H1.
  rewrite /lift_array256 /subarray256 tP in H2.
  rewrite /lift_array256 /subarray256 tP in H3.
  rewrite /nttpackv tP => k kb.
  rewrite initiE //=.
  case (0 <= k && k < 256).
  + move => kbb.
    move : (H1 (nttpack_idx.[k]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack !initiE //=; 1..2: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite /lift_array768 /subarray256 /=.
    pose c := nttpack_idx.[k].
  rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite /nttpack initiE //=.
  rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().
  case (256 <= k && k < 512).
  + move => kbb ?.
    move : (H2 (nttpack_idx.[k-256]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k-256].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /lift_array768 /subarray256 /=.
    pose c := nttpack_idx.[k-256].
  rewrite /nttpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-256. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

  + move => *.
    move : (H3 (nttpack_idx.[k-512]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k-512].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /lift_array768 /subarray256 /=.
    pose c := nttpack_idx.[k-512].
  rewrite /nttpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-512. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

+  smt(unpackvK).
+ smt().
+ smt().
by smt(unpackvK).
qed.

(***************************************************)

lemma kyber_correct_enc_0_avx2 mem _ctp _pkp : 
   equiv [ Jkem_avx2.M.__indcpa_enc_0 ~ Kyber(KHS,XOF,KPRF,H).enc_derand: 
     valid_ptr _pkp (384*3 + 32) /\
     valid_ptr _ctp (3*320+128) /\
     Glob.mem{1} = mem /\ 
     msgp{1} = m{2} /\ 
     to_uint sctp{1} = _ctp /\ 
     to_uint pkp{1} = _pkp /\
     noiseseed{1} = r{2} /\
     pk{2}.`1 = load_array1152 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 3*384)
       ==> 
     touches Glob.mem{1} mem _ctp (3*320+128) /\
     let (c1,c2) = res{2} in
     c1 = load_array960 Glob.mem{1} _ctp /\
     c2 = load_array128 Glob.mem{1} (_ctp + 960)
].
proc*.
transitivity {1} { Jkem.M.__indcpa_enc(sctp,msgp,pkp,noiseseed);} 
(={Glob.mem,msgp,pkp,noiseseed,sctp} /\
  valid_ptr _pkp (384 * 3 + 32) /\
  valid_ptr _ctp (3 * 320 + 128) /\
  Glob.mem{1} = mem /\
  to_uint sctp{1} = _ctp /\
  to_uint pkp{1} = _pkp
   ==> ={Glob.mem,r}) 
( valid_ptr _pkp (384 * 3 + 32) /\
  valid_ptr _ctp (3 * 320 + 128) /\
  Glob.mem{1} = mem /\
  msgp{1} = m{2} /\
  to_uint sctp{1} = _ctp /\
  to_uint pkp{1} = _pkp /\
  noiseseed{1} = r{2} /\
  pk{2}.`1 = load_array1152 mem _pkp /\ 
  pk{2}.`2 = load_array32 mem (_pkp + 3 * 384)
  ==>
  touches Glob.mem{1} mem _ctp (3*320+128) /\
  let (c1, c2) = r0{2} in 
      c1 = load_array960 Glob.mem{1} _ctp /\ 
      c2 = load_array128 Glob.mem{1} (_ctp + 960)); 1,2: smt();  
   last by call(kyber_correct_enc mem _ctp _pkp); auto => />. 

inline{1} 1; inline {2} 1. wp.

seq 49 57 : (={ctp,Glob.mem} /\
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
    lift_array256 v{1} = lift_array256 v{2} /\ 
    valid_ptr (to_uint ctp{1}) 128); last by
  exists *Glob.mem{1}, (to_uint ctp{1}); elim* => memm _p; call (compressequiv memm _p); auto.

seq 47 55 : (={ctp,Glob.mem} /\
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
     pos_bound768_cxq bp{1} 0 768 2 /\
     pos_bound768_cxq bp{2} 0 768 2 /\
    lift_array256 v{1} = lift_array256 v{2} /\ 
    lift_array768 bp{1} = lift_array768 bp{2} /\ 
    valid_ptr (to_uint ctp{1}) (128+3*320)); last by
  exists *Glob.mem{1}, (to_uint ctp{1}); elim* => memm _p; wp;call (compressequivvec memm _p); auto => />;
   move => *; rewrite !to_uintD_small /= /#.

wp;conseq />.
call (reduceequiv_noperm).
ecall (polyvec_reduce_equiv_noperm (lift_array768 bp{2})).
call (addequiv_noperm 4 2 _ _) => //.
call (addequiv_noperm 2 2 _ _) => //.

have H := polyvec_add2_equiv_noperm 2 2 _ _ => //.
ecall (H (lift_array768 bp{2}) (lift_array768 ep{2})); clear H.


unroll for {1} 38.

swap {1} 3 -2; swap {2} 3 -2; seq 1 1: (#pre /\ ={pkp0} /\ pkp0{2}=pkp{1}); 1: by auto.
sp 3 3.
swap {1} 18 -1. (* avoid dealing with stack noise seed *)

seq 17 15  : (#pre /\ ={publicseed, bp,ep,epp,v,sp_0,k} /\
           pos_bound256_cxq k{1} 0 256 1 /\
           pos_bound256_cxq k{2} 0 256 1 /\
           lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
           pos_bound768_cxq pkpv{1} 0 768 2 /\
           pos_bound768_cxq pkpv{2} 0 768 2 /\
           aat{1} = nttunpackm aat{2} /\
           pos_bound2304_cxq aat{1} 0 2304 2 /\
           pos_bound2304_cxq aat{2} 0 2304 2). 
+ call (genmatrixequiv true).
  call frommsgequiv_noperm. conseq />. smt().
  conseq (_: _ ==> lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
       pos_bound768_cxq pkpv{1} 0 768 2 /\ pos_bound768_cxq pkpv{2} 0 768 2 /\ ={publicseed,pkp0,bp,ep,epp,v,sp_0,Glob.mem} /\ pkp0{2} = pkp{1}).
  auto => /> &2 ????????? rl rr H H0 H1 ?????. 
  + rewrite tP => k kb.
    move : H; rewrite /lift_array256 tP => H.
    move : (H k kb); rewrite !mapiE //=. 
    move : H0 H1; rewrite /pos_bound256_cxq /bpos16 /= => H0 H1.
    move : (H0 k kb) (H1 k kb).
    rewrite -Zq.eq_inFq /= qE. 
    move => HH0 HH1; rewrite !modz_small; 1,2: smt( StdOrder.IntOrder.gtr0_norm).    
    move : HH0 HH1; rewrite /to_sint /smod /= => HH0 HH1.
    rewrite  ifF. smt(W16.to_uint_cmp). 
    rewrite  ifF. smt(W16.to_uint_cmp). 
    smt(W16.to_uint_eq).
  seq 12 10 : (#{/~publicseed{2}}post /\ ={publicseed}).
  wp;sp; conseq />.
  call (polyvec_frombytes_equiv).
  auto => />. smt(). 
  conseq />. sim.

sp 2 0.
(* swap {1} [11..12] 2. *)

seq 12 20 : (#{/~bp{1}=bp{2}}pre  /\
    signed_bound768_cxq sp_0{1} 0 768 1 /\
    signed_bound768_cxq ep{1} 0 768 1 /\
    signed_bound_cxq epp{1} 0 256 1 /\
    signed_bound768_cxq sp_0{2} 0 768 1 /\
    signed_bound768_cxq ep{2} 0 768 1 /\ 
    signed_bound_cxq epp{1} 0 256 1).
+ conseq />.
  transitivity {1} { (sp_0,ep,bp,epp) <@ GetNoiseAVX2.samplenoise_enc(sp_0,ep,bp, epp,noiseseed);} (lnoiseseed{1} = noiseseed{2} /\ ={sp_0,ep,bp,epp} ==> ={sp_0,ep,epp}) 
   (
   s_noiseseed{1} = noiseseed0{1} /\
  lnoiseseed{1} = s_noiseseed{1} /\
  (sctp0{2} = sctp{2} /\
   msgp0{2} = msgp{2} /\
   noiseseed0{2} = noiseseed{2} /\
   sctp0{1} = sctp{1} /\
   msgp0{1} = msgp{1} /\
   noiseseed0{1} = noiseseed{1} /\
   (={Glob.mem, msgp, pkp, noiseseed, sctp} /\
    valid_ptr _pkp (384 * 3 + 32) /\
    valid_ptr _ctp (3 * 320 + 128) /\ Glob.mem{1} = mem /\ to_uint sctp{1} = _ctp /\ to_uint pkp{1} = _pkp) /\
   ={pkp0}) /\
  ={publicseed, bp, ep, epp, v, sp_0, k} /\
  pos_bound256_cxq k{1} 0 256 1 /\
  pos_bound256_cxq k{2} 0 256 1 /\
  lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
  pos_bound768_cxq pkpv{1} 0 768 2 /\
  pos_bound768_cxq pkpv{2} 0 768 2 /\
  aat{1} = nttunpackm aat{2} /\ pos_bound2304_cxq aat{1} 0 2304 2 /\ pos_bound2304_cxq aat{2} 0 2304 2
   ==> 
    ={ep, epp, sp_0} /\
  signed_bound768_cxq sp_0{1} 0 768 1 /\
  signed_bound768_cxq ep{1} 0 768 1 /\
  signed_bound_cxq epp{1} 0 256 1 /\
  signed_bound768_cxq sp_0{2} 0 768 1 /\ signed_bound768_cxq ep{2} 0 768 1 /\ signed_bound_cxq epp{1} 0 256 1
  ); 1,2:smt().
  + by inline {2} 1;do 2!(wp; call getnoiseequiv_avx);auto => />. 
  inline {1} 1. inline GetNoiseAVX2._poly_getnoise_eta1_4x.
  wp; call{1} (_: true ==> true); 1: by apply polygetnoise_ll.
  do 7!(wp; call  getnoiseequiv); auto => />.
  move => &1 &2 ??????????R?; split.
  + by rewrite tP => k kb; rewrite !initiE //= initiE /#.
  move => ?R0?; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R1?????; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R2???; do split.
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  rewrite /signed_bound768_cxq => x xb /=.
  rewrite !initiE //= fun_if. 
  case (512 <= x && x < 768); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  case (256 <= x && x < 512); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  by smt().

seq 1 1 : (#{/~sp_0{1}}{~sp_0{2}}pre /\ 
           lift_array768 sp_0{1} = nttunpackv (lift_array768 sp_0{2}) /\
           pos_bound768_cxq sp_0{1} 0 768 2 /\
           pos_bound768_cxq sp_0{2} 0 768 2); 1: 
 by  conseq />; call (nttequiv); auto => /> /#.

(* First ip *)

seq 4 2 : (#pre /\ 
              lift_array256 (subarray256 bp{1} 0) = nttunpack (lift_array256 (subarray256 bp{2} 0)) /\
              signed_bound768_cxq bp{1} 0 256 4 /\
              signed_bound768_cxq bp{2} 0 256 2 /\ w{1} = 1).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE // 1:/# /= kb /= initiE //=. 
+ rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
+ rewrite /signed_bound768_cxq => k kb; smt(). 
+ rewrite /signed_bound768_cxq => *; rewrite initiE //=; smt().
+ by smt().

move => H15 H16 H17 H18 H19 r1 r2 H20 H21 H22;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H20; rewrite /lift_array256 tP => H20.
  move : (H20 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

(* Second ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 1) = nttunpack (lift_array256 (subarray256 bp{2} 1)) /\
              signed_bound768_cxq bp{1} 256 512 4 /\
              signed_bound768_cxq bp{2} 256 512 2 /\ w{1} = 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H18 H19 H20 H21 H22 r1 r2 H23 H24 H25;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H15; rewrite /lift_array256 /subarray256 tP => H15.
  move : (H15 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1: /# /=. 
  move : H23; rewrite /lift_array256 tP => H23.
  move : (H23 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

(* Third ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 2) = nttunpack (lift_array256 (subarray256 bp{2} 2)) /\
              signed_bound768_cxq bp{1} 512 768 4 /\
              signed_bound768_cxq bp{2} 512 768 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H121 H22 H23 H24 H25 r1 r2 H26 H27 H28;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H15; rewrite /lift_array256 /subarray256 tP => H15.
  move : (H15 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H18; rewrite /lift_array256 tP => H18.
  move : (H18 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1: /# /=. 
  move : H26; rewrite /lift_array256 tP => H26.
  move : (H26 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

(* Fourth ip *)

seq 1 1: (#{/~v{1}}pre /\ lift_array256 v{1} = nttunpack (lift_array256 v{2}) /\
              signed_bound_cxq v{1} 0 256 4 /\
              signed_bound_cxq v{2} 0 256 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23; do split.
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 

(* INV NTT!!! *)
seq 1 1 : (#{/~bp{2}}{~bp{1}}pre /\ lift_array768 bp{1} = lift_array768 bp{2} /\ signed_bound768_cxq bp{1} 0 768 2 /\ signed_bound768_cxq bp{2} 0 768 2).
conseq />.  call(invnttequiv). auto => />. move => &1 &2 ???????????????H1??H0??H?????; split.
+ do split; 2,3: by smt().
  rewrite /nttunpackv.
  rewrite tP => k kb; rewrite initiE //=.
  move : H H0 H1; rewrite !tP => H H0 H1.
  case (0 <= k < 256).
  + move => kkb; move : (H1 k kkb). rewrite subliftsub //= => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  case (256 <= k < 512).
  + move => nkkb kkb. move : (H0 (k-256) _); 1: smt(). rewrite subliftsub //= 1: /# => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  move => *.
  move : (H (k-512) _); 1: smt(). rewrite subliftsub //= 1: /# => ->. 
  congr;congr.
  rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
  rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  smt().

seq 1 1 : (#{/~v{2}}{~v{1}}pre /\ lift_array256 v{1} = lift_array256 v{2} /\ signed_bound_cxq v{1} 0 256 2 /\ signed_bound_cxq v{2} 0 256 2).
conseq />.  call(polyinvnttequiv). auto => />. smt().

auto => /> /#.
qed.


(***************************************************)

lemma kyber_correct_enc_1_avx2 mem _pkp : 
   equiv [ Jkem_avx2.M.__indcpa_enc_1 ~ Kyber(KHS,XOF,KPRF,H).enc_derand: 
     valid_ptr _pkp (384*3 + 32) /\
     Glob.mem{1} = mem /\ 
     msgp{1} = m{2} /\ 
     to_uint pkp{1} = _pkp /\
     noiseseed{1} = r{2} /\
     pk{2}.`1 = load_array1152 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 3*384)
       ==> 
     Glob.mem{1} = mem /\
     let (c1,c2) = res{2} in
     c1 = Array960.init (fun i => res{1}.[i]) /\
     c2 = Array128.init (fun i => res{1}.[i+960])
].
proc*.
transitivity {1} { r <@ Jkem.M.__iindcpa_enc(ctp,msgp,pkp,noiseseed);} 
(={Glob.mem,ctp,msgp,pkp,noiseseed} /\
  valid_ptr _pkp (384 * 3 + 32) /\
  Glob.mem{1} = mem /\
  to_uint pkp{1} = _pkp 
   ==> ={Glob.mem,r} /\ Glob.mem{1} = mem) 
( valid_ptr _pkp (384 * 3 + 32) /\
  Glob.mem{1} = mem /\
  msgp{1} = m{2} /\
  to_uint pkp{1} = _pkp /\
  noiseseed{1} = r{2} /\
  pk{2}.`1 = load_array1152 mem _pkp /\ 
  pk{2}.`2 = load_array32 mem (_pkp + 3 * 384) 
  ==>
  Glob.mem{1} = mem /\
  r{1} = (Array1088.init (fun (i : int) => if 0 <= i && i < 960 then r0{2}.`1.[i] else r0{2}.`2.[i - 960])));[ by smt() | | | by call(kyber_correct_ienc mem _pkp); auto => />].
  + move => /> c1 c2. 
    rewrite !tP;split;move => *.
    + by rewrite !initiE // 1:/# /= /#.
    by rewrite !initiE //= !initiE 1:/# /= /#.

inline{1} 1; inline {2} 1. wp.

seq 51 59 : (={ctp0,Glob.mem} /\ Glob.mem{1} = mem /\
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
    lift_array256 v{1} = lift_array256 v{2}); last by
  exists *Glob.mem{1}; elim* => memm; call (compressequiv_1 memm); auto => />; smt(Array1088.tP Array1088.initiE).

seq 49 57 : (={ctp0,Glob.mem} /\ Glob.mem{1} = mem /\
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
     pos_bound768_cxq bp{1} 0 768 2 /\
     pos_bound768_cxq bp{2} 0 768 2 /\
    lift_array256 v{1} = lift_array256 v{2} /\ 
    lift_array768 bp{1} = lift_array768 bp{2}); last 
  exists *Glob.mem{1}; elim* => memm; wp;call (compressequivvec_1 memm); auto => />; smt(Array1088.tP Array1088.initiE).

wp;conseq />.
call (reduceequiv_noperm).
ecall (polyvec_reduce_equiv_noperm (lift_array768 bp{2})).
call (addequiv_noperm 4 2 _ _) => //.
call (addequiv_noperm 2 2 _ _) => //.

have H := polyvec_add2_equiv_noperm 2 2 _ _ => //.
ecall (H (lift_array768 bp{2}) (lift_array768 ep{2})); clear H.


unroll for {1} 40.

swap {1} 3 -2; swap {2} 3 -2; seq 1 1: (#pre /\ ={pkp0} /\ pkp0{2} = pkp{1}); 1: by auto.
sp 3 3.
swap {1} 19 1. (* avoid dealing with stack noise seed *)

seq 19 17  : (#pre /\ ={publicseed, bp,ep,epp,v,sp_0,k,sctp} /\
           pos_bound256_cxq k{1} 0 256 1 /\
           pos_bound256_cxq k{2} 0 256 1 /\
           lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
           pos_bound768_cxq pkpv{1} 0 768 2 /\
           pos_bound768_cxq pkpv{2} 0 768 2 /\
           aat{1} = nttunpackm aat{2} /\
           pos_bound2304_cxq aat{1} 0 2304 2 /\
           pos_bound2304_cxq aat{2} 0 2304 2). 
+ call (genmatrixequiv true).
  wp;call frommsgequiv_noperm. conseq />. smt().
  conseq (_: _ ==> lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
       pos_bound768_cxq pkpv{1} 0 768 2 /\ pos_bound768_cxq pkpv{2} 0 768 2 /\ ={publicseed,pkp0,bp,ep,epp,v,sp_0,sctp,Glob.mem} /\ pkp0{2} = pkp{1}).
  auto => /> &2 ??????? rl rr H H0 H1 ?????. 
  + rewrite tP => k kb.
    move : H; rewrite /lift_array256 tP => H.
    move : (H k kb); rewrite !mapiE //=. 
    move : H0 H1; rewrite /pos_bound256_cxq /bpos16 /= => H0 H1.
    move : (H0 k kb) (H1 k kb).
    rewrite -Zq.eq_inFq /= qE. 
    move => HH0 HH1; rewrite !modz_small; 1,2: smt( StdOrder.IntOrder.gtr0_norm).    
    move : HH0 HH1; rewrite /to_sint /smod /= => HH0 HH1.
    rewrite  ifF. smt(W16.to_uint_cmp). 
    rewrite  ifF. smt(W16.to_uint_cmp). 
    smt(W16.to_uint_eq).
  seq 14 12 : (#{/~publicseed{2}}post /\ ={publicseed}).
  wp;sp; conseq />.
  call (polyvec_frombytes_equiv).
  auto => />. smt().
  conseq />. sim.
sp 2 0.
(* swap {1} [11..12] 2. *)

seq 12 20 : (#{/~bp{1}=bp{2}}pre  /\
    signed_bound768_cxq sp_0{1} 0 768 1 /\
    signed_bound768_cxq ep{1} 0 768 1 /\
    signed_bound_cxq epp{1} 0 256 1 /\
    signed_bound768_cxq sp_0{2} 0 768 1 /\
    signed_bound768_cxq ep{2} 0 768 1 /\ 
    signed_bound_cxq epp{1} 0 256 1).
+ conseq />.
  transitivity {1} { (sp_0,ep,bp,epp) <@ GetNoiseAVX2.samplenoise_enc(sp_0,ep,bp, epp,noiseseed);} (lnoiseseed{1} = noiseseed{2} /\ ={sp_0,ep,bp,epp} ==> ={sp_0,ep,epp}) 
   (
   s_noiseseed{1} = noiseseed0{1} /\
  lnoiseseed{1} = s_noiseseed{1} /\
  (ctp0{2} = ctp{2} /\
   msgp0{2} = msgp{2} /\
   noiseseed0{2} = noiseseed{2} /\
   ctp0{1} = ctp{1} /\
   msgp0{1} = msgp{1} /\
   noiseseed0{1} = noiseseed{1} /\
   (={Glob.mem, msgp, pkp, noiseseed} /\ valid_ptr _pkp (384 * 3 + 32) /\ Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp) /\
   ={pkp0}) /\
  ={publicseed, bp, ep, epp, v, sp_0, k} /\
  pos_bound256_cxq k{1} 0 256 1 /\
  pos_bound256_cxq k{2} 0 256 1 /\
  lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
  pos_bound768_cxq pkpv{1} 0 768 2 /\
  pos_bound768_cxq pkpv{2} 0 768 2 /\
  aat{1} = nttunpackm aat{2} /\ pos_bound2304_cxq aat{1} 0 2304 2 /\ pos_bound2304_cxq aat{2} 0 2304 2
   ==> 
    ={ep, epp, sp_0} /\
  signed_bound768_cxq sp_0{1} 0 768 1 /\
  signed_bound768_cxq ep{1} 0 768 1 /\
  signed_bound_cxq epp{1} 0 256 1 /\
  signed_bound768_cxq sp_0{2} 0 768 1 /\ signed_bound768_cxq ep{2} 0 768 1 /\ signed_bound_cxq epp{1} 0 256 1
  ); 1,2:smt().
  + by inline {2} 1;do 2!(wp; call getnoiseequiv_avx);auto => />. 
  inline {1} 1. inline GetNoiseAVX2._poly_getnoise_eta1_4x.
  wp; call{1} (_: true ==> true); 1: by apply polygetnoise_ll.
  do 7!(wp; call  getnoiseequiv); auto => />.
  move => &1 &2 ????????R?; split.
  + by rewrite tP => k kb; rewrite !initiE //= initiE /#.
  move => ?R0?; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R1?????; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R2???; do split.
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  rewrite /signed_bound768_cxq => x xb /=.
  rewrite !initiE //= fun_if. 
  case (512 <= x && x < 768); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  case (256 <= x && x < 512); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  by smt().

seq 1 1 : (#{/~sp_0{1}}{~sp_0{2}}pre /\ 
           lift_array768 sp_0{1} = nttunpackv (lift_array768 sp_0{2}) /\
           pos_bound768_cxq sp_0{1} 0 768 2 /\
           pos_bound768_cxq sp_0{2} 0 768 2); 1: 
 by  conseq />; call (nttequiv); auto => /> /#.

(* First ip *)

seq 4 2 : (#pre /\ 
              lift_array256 (subarray256 bp{1} 0) = nttunpack (lift_array256 (subarray256 bp{2} 0)) /\
              signed_bound768_cxq bp{1} 0 256 4 /\
              signed_bound768_cxq bp{2} 0 256 2 /\ w{1} = 1).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE // 1:/# /= kb /= initiE //=. 
+ rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
+ rewrite /signed_bound768_cxq => k kb; smt(). 
+ rewrite /signed_bound768_cxq => *; rewrite initiE //=; smt().
+ by smt().

move => H15 H16 H17 H18 H19 r1 r2 H20 H21 H22;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H20; rewrite /lift_array256 tP => H20.
  move : (H20 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

(* Second ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 1) = nttunpack (lift_array256 (subarray256 bp{2} 1)) /\
              signed_bound768_cxq bp{1} 256 512 4 /\
              signed_bound768_cxq bp{2} 256 512 2 /\ w{1} = 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H18 H19 H20 H21 H22 r1 r2 H23 H24 H25;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H13; rewrite /lift_array256 /subarray256 tP => H13.
  move : (H13 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1: /# /=. 
  move : H23; rewrite /lift_array256 tP => H23.
  move : (H23 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

(* Third ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 2) = nttunpack (lift_array256 (subarray256 bp{2} 2)) /\
              signed_bound768_cxq bp{1} 512 768 4 /\
              signed_bound768_cxq bp{2} 512 768 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H121 H22 H23 H24 H25 r1 r2 H26 H27 H28;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H13; rewrite /lift_array256 /subarray256 tP => H13.
  move : (H13 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H16; rewrite /lift_array256 tP => H16.
  move : (H16 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1: /# /=. 
  move : H26; rewrite /lift_array256 tP => H26.
  move : (H26 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

(* Fourth ip *)

seq 1 1: (#{/~v{1}}pre /\ lift_array256 v{1} = nttunpack (lift_array256 v{2}) /\
              signed_bound_cxq v{1} 0 256 4 /\
              signed_bound_cxq v{2} 0 256 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21; do split.
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 

(* INV NTT!!! *)
seq 1 1 : (#{/~bp{2}}{~bp{1}}pre /\ lift_array768 bp{1} = lift_array768 bp{2}  /\ signed_bound768_cxq bp{1} 0 768 2 /\ signed_bound768_cxq bp{2} 0 768 2).
conseq />.  call(invnttequiv). auto => />. move => &1 &2 ?????????????H1??H0??H?????; split.
+ do split; 2,3: by smt().
  rewrite /nttunpackv.
  rewrite tP => k kb; rewrite initiE //=.
  move : H H0 H1; rewrite !tP => H H0 H1.
  case (0 <= k < 256).
  + move => kkb; move : (H1 k kkb). rewrite subliftsub //= => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  case (256 <= k < 512).
  + move => nkkb kkb. move : (H0 (k-256) _); 1: smt(). rewrite subliftsub //= 1: /# => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  move => *.
  move : (H (k-512) _); 1: smt(). rewrite subliftsub //= 1: /# => ->. 
  congr;congr.
  rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
  rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  smt().

seq 1 1 : (#{/~v{2}}{~v{1}}pre /\ lift_array256 v{1} = lift_array256 v{2} /\ signed_bound_cxq v{1} 0 256 2 /\ signed_bound_cxq v{2} 0 256 2).
conseq />.  call(polyinvnttequiv). auto => />. smt().

auto => /> /#.
qed.


lemma kyber_correct_dec mem _ctp _skp : 
   equiv [ Jkem_avx2.M.__indcpa_dec_1 ~ Kyber(KHS,XOF,KPRF,H).dec : 
     valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2} = load_array1152 Glob.mem{1} _skp /\
     let (c1,c2) = cph{2} in
       c1 = load_array960 Glob.mem{1} _ctp /\
       c2 = load_array128 Glob.mem{1} (_ctp + 960)
       ==> 
     Glob.mem{1} = mem /\
     res{1} = oget res{2}
].
proc*.
transitivity {1} { r <@ Jkem.M.__indcpa_dec(msgp,ctp,skp);} 
(={Glob.mem,ctp,skp} /\
  valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp 
   ==> ={Glob.mem,r} /\ Glob.mem{1} = mem) 
( valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2} = load_array1152 Glob.mem{1} _skp /\
     let (c1,c2) = cph{2} in
       c1 = load_array960 Glob.mem{1} _ctp /\
       c2 = load_array128 Glob.mem{1} (_ctp + 960)
       ==> 
     Glob.mem{1} = mem /\
     r{1} = oget r{2}); 1,2: smt();  
   last by call(kyber_correct_dec mem _ctp _skp); auto => />. 

inline{1} 1; inline {2} 1.
wp; ecall (tomsgequiv_noperm).
call (reduceequiv_noperm).
call (subequiv_noperm 2 2 _ _) => //.
call(polyinvnttequiv).
call pointwiseequiv.
call(nttequiv).
call (polyvec_frombytes_equiv).
ecall (poly_decompress_equiv mem (_ctp + 3*320)).
wp; call (polyvec_decompress_equiv mem _ctp).
auto => />.
move => &2 ????; split; 1: smt().
move => ????; do split; 1:smt(). 
+ by rewrite to_uintD_small /=; 1: smt().
move => ????? r0 ? rl1 rr1 ???; do split; 1,2: smt().
move => ? rl2 rr2 ???; do split; 1..4: smt().
move => ???? rl3 rr3 ???. do split; smt().
qed.
