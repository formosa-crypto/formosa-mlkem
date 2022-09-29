require import AllCore List IntDiv Ring StdOrder BitEncoding.

require import Fq NTT_Fq NTTAlgebra.


import Kyber.
import NTT_Properties.

import Zq IntOrder BitReverse.
import NTTequiv.


from Jasmin require import JModel.
require import Array16 Array128  Array256 Array400.
require import Array16_extra.
require import Array128_extra.
require import Array256_extra.
require import Array400 WArray32 WArray800 WArray512.



(* MOVE TO: JWord_array.ec *)
lemma get16_set256E t x y w :
 0 <= x => 32*(x + 1) <= 512 =>
 get16 (WArray512.set256 t x w) y
 = if 32*x <= 2*y < 32*(x+1)
   then w \bits16 (y - 16*x)
   else get16 t y.
proof.        
move=> hx hs; rewrite get16E.
case: ( 32*x <= 2*y < 32*(x+1) ). 
 rewrite mulrDr /= => Hy.
 rewrite -(W2u8.unpack8K (w \bits16 (y-16*x))) unpack8E; congr.
 by rewrite -W2u8.Pack.all_eqP /all_eq /= -/WArray512.get8
      !get8_set256_directE 1..4:/# Hy /= /#.
rewrite mulrDr /= => Hy.
rewrite -(W2u8.unpack8K (get16 t y)) unpack8E; congr.
rewrite -W2u8.Pack.all_eqP /all_eq /= -/WArray512.get8
      !get8_set256_directE 1..4:/#.
by rewrite  Hy /= get16E pack2bE // ifF /#. 
qed.

lemma get16_init16 f i:
 0 <= 2*i < 512 =>
 get16 (WArray512.init16 f) i
 = f i.
proof.
move => Hi.
rewrite get16E /init16 /=.
rewrite -(W2u8.unpack8K (f i)) /unpack8K; congr.
by rewrite -W2u8.Pack.all_eqP /all_eq /= !initiE /#.
qed.
(* END MOVE *)



lemma pack2_bits8 (w: W16.t):
 pack2 [w \bits8 0; w \bits8 1] = w.
proof.
rewrite -{-1}(W2u8.unpack8K w) unpack8E; congr.
by apply W2u8.Pack.all_eq_eq; rewrite /all_eq.
qed.

op pchunk ['a] (p: 'a Array256.t): ('a Array16.t) Array16.t =
 Array16.init (fun i=> Array16.init (fun j=> p.[i*16+j])).

op punchunk ['a] (c: ('a Array16.t) Array16.t): 'a Array256.t =
 Array256.init (fun i=>c.[i%/16].[i%%16]).

lemma pchunkK ['a] (p: 'a Array256.t):
 punchunk (pchunk p) = p.
proof.
rewrite /pchunk /punchunk tP /= => i Hi.
rewrite initiE //= initiE //= 1:/#.
by rewrite initiE /#.
qed.

lemma punchunkK ['a] (p: ('a Array16.t) Array16.t):
 pchunk (punchunk p) = p.
proof.
rewrite /pchunk /punchunk tP /= => i Hi.
rewrite initiE //= tP => j Hj.
by rewrite initiE //= initiE /#.
qed.

op C2R (c: W16.t Array16.t): W256.t = 
 get256 (WArray32.init16 (fun i=>c.[i])) 0.

op R2C (r: W256.t): W16.t Array16.t =
 Array16.init (fun i=> r \bits16 i).

lemma C2RK c:
 R2C (C2R c) = c.
proof.
rewrite /C2R /R2C.
apply Array16.all_eq_eq.
by rewrite /all_eq /get256_direct /= !initiE //= !pack2_bits8.
qed.

lemma R2CK r:
 C2R (R2C r) = r.
proof.
rewrite /C2R /R2C /=.
apply W256.all_eq_eq.
by rewrite /all_eq /get256_direct /= !initiE //= !pack2_bits8.
qed.

op P2C ['a] (p: 'a Array256.t) (i:int): 'a Array16.t =
 (pchunk p).[i].
op P2R (p: W16.t Array256.t) (i: int): W256.t =
 C2R (P2C p i).

lemma P2R2C p i:
 R2C (P2R p i) = P2C p i.
proof. by rewrite /P2R C2RK. qed.

op CS2P ['a] (l: ('a Array16.t) list): 'a Array256.t =
 punchunk (Array16.of_list witness l).

lemma P2CS ['a] (p: 'a Array256.t):
 p = CS2P (map (P2C p) (iotared 0 16)).
proof.
rewrite /CS2P -{1}pchunkK; congr.
by apply Array16.all_eq_eq; rewrite /all_eq /#.
qed.

op RS2P (l: W256.t list): W16.t Array256.t =
 CS2P (map R2C l).

lemma P2RS (p: W16.t Array256.t):
 p = RS2P (map (P2R p) (iotared 0 16)).
proof.
rewrite /RS2P /CS2P -{1}pchunkK; congr.
rewrite -map_comp /(\o).
have ->: (fun i=> R2C (P2R p i)) = P2C p.
 by rewrite fun_ext => x; rewrite P2R2C.
by apply Array16.all_eq_eq; rewrite /all_eq /#.
qed.

lemma P2RE (p: W16.t Array256.t) (i: int):
 0 <= i < 16 =>
 P2R p i
 = get256_direct (WArray512.init16 (fun i => p.[i])) (32*i).
proof.
move=> Hi.
rewrite /P2R /P2C /pchunk /C2R initiE //=.
rewrite get256E /get256_direct /=; congr.
apply W32u8.Pack.ext_eq => k Hk.
do ! (rewrite initiE 1:/# /=). 
smt().
qed.

op PUC ['a] (p: 'a Array256.t) (i:int) (x: 'a Array16.t) =
 punchunk (pchunk p).[i <- x].
op PUR (p: W16.t Array256.t) (i: int) (x: W256.t): W16.t Array256.t =
 PUC p i (R2C x).

lemma PURE (p: W16.t Array256.t) i x:
 0 <= i < 16 =>
 PUR p i x =
 Array256.init
  (get16 (set256_direct (WArray512.init16 (fun i => p.[i])) (32*i) x)).
proof.
move=> Hi; rewrite /PUR /PUC /punchunk tP => j Hj.
rewrite !initiE 1..2:/# /=.
rewrite get_setE 1:// get16_set256E 1..2:/#.
case: (j %/ 16 = i) => E.
 rewrite -E ifT 1:/#.
 have ->: j - 16 * (j %/ 16) = j %% 16
  by smt(divz_eq).
 by rewrite /r2c initiE 1:/#.
rewrite ifF 1:/# /pchunk initiE 1:/# /=.
rewrite initiE 1:/# /=.
have ->: j %/ 16 * 16 + j %% 16 = j by smt(divz_eq).
by rewrite get16_init16 /#.
qed.



lemma P2C_i ['a] (cs: ('a Array16.t) list) k:
 0 <= k && k < 16 => size cs = 16 =>
 P2C (CS2P cs) k = (nth witness cs k).
proof.
move=> Hk Hcs.
by rewrite /CS2P /P2C punchunkK get_of_list //.
qed.
(*
hint simplify P2C_i.
*)
lemma P2R_i rs k:
 0 <= k && k < 16 => size rs = 16 =>
 P2R (RS2P rs) k = (nth witness rs k).
proof.
move=> Hk Hrs.
rewrite /RS2P /P2R P2C_i //; first by rewrite size_map.
by rewrite (nth_map witness) 1:/# R2CK.
qed.
(*
hint simplify P2R_i.
*)
(* "upd" is equivalent to "put", but intended to be evaluated *)
op upd ['a] (xs: 'a list) n x =
 with xs = "[]" => "[]"
 with xs = (::) y ys => if n=0 then x::ys else y::(upd ys (n-1) x).

lemma nth_upd ['a] (xs: 'a list) d k x i:
 0 <= k < size xs =>
 nth d (upd xs k x) i = if i=k then x else nth d xs i.
proof.
elim: xs k i => //=.
 smt().
move=> y ys IH k i Hk.
case: (i=k) => E.
 case: (k=0) => Ek.
  smt().
 by rewrite ifF 1:/# IH 1:/# ifT 1:/#.
case: (k=0) => Ek.
 smt().
case: (i=0) => Ei //.
by rewrite IH 1:/# ifF 1:/#.
qed.

lemma map_upd ['a 'b] (f: 'a -> 'b) xs k x:
 map f (upd xs k x) = upd (map f xs) k (f x).
proof.
elim: xs k => // y ys IH k /=.
case: (k=0) => E //.
by congr; apply IH.
qed.

lemma PUC_i ['a] cs k (x: 'a Array16.t):
 0 <= k < 16 => size cs = 16 =>
 PUC (CS2P cs) k x = CS2P (upd cs k x).
proof.
move=> Hk Hcs.
rewrite /xs2p /PUC /CS2P; congr.
rewrite tP => i Hi.
case: (i=k) => E.
 by rewrite set_eqiE // get_of_list // nth_upd 1:/# E.
by rewrite set_neqiE // punchunkK !get_of_list // nth_upd 1:/# E.
qed.
(*
hint simplify PUC_i.
*)
lemma PUR_i rs k x:
 0 <= k < 16 => size rs = 16 =>
 PUR (RS2P rs) k x = RS2P (upd rs k x).
proof.
move=> Hk Hrs.
rewrite /PUR /RS2P PUC_i //.
 by rewrite size_map.
by congr; rewrite map_upd.
qed.
(*
hint simplify PUR_i.
*)



(* misc utils *)
lemma rangered (n m :int) :
  range n m = iotared n (m-n).
  rewrite iotaredE /range => />. qed.

lemma ifsplit (b : bool) (t e r : 'a) :
   (b => (t = r)) => (!b => (e = r)) =>
       (if b then t else e) = r 
   by move => Ht Hf; case b; auto.

lemma and_imply2 (p q r : bool) :
  p /\ (p => q => r) => ((p => q) => r).
  smt(). qed.

lemma falsify (p : bool) : 
  false => p.
  auto. qed.

(*
op perm128 ['a] (p: int list) (a: 'a Array128.t): 'a Array128.t =
 Array128.init (fun i=> a.[nth witness p i]).
*)

op perm_ntt ['a] (p: int list) (a: 'a Array256.t): 'a Array256.t =
  Array256.init (fun i => if i < 128 then a.[nth witness p i] else a.[128 + nth witness p (i-128)]). 


(* Auxiliary proofs on NTTAlgebra *)

abbrev len_avx2S (k:int) = 128 %/ (2^k).
abbrev len_avx2K (k:int) = nth witness [128;64;32;16;8;4;2] k.

lemma len_avx2_equiv (k:int) : 0 <= k < 7 =>
  len_avx2S k = len_avx2K k.
rewrite -mem_range rangered => />.
do 7!(move => Hk; case Hk => />). qed.

abbrev zetasctr_avx2S (k:int) = foldl (fun c k => c + 128 %/ len_avx2S k) 0 (range 0 k).
abbrev zetasctr_avx2K (k:int) = nth witness [0;1;3;7;15;31;63] k.

lemma zetasctr_avx2_equiv (k:int) : 0 <= k < 7 =>
  zetasctr_avx2S k = zetasctr_avx2K k.
rewrite -mem_range rangered => />.
do 7!(try (move => Hk; case Hk => />); first by rewrite rangered => />). qed.

abbrev block_avx2S k = (128 %/ 2 ^ (7 - k)).
abbrev block_avx2K k = nth witness [1;2;4;8;16;32;64] k.

lemma block_avx2_equiv k : 0 <= k < 7 =>
  block_avx2S k = block_avx2K k.
  rewrite -mem_range rangered => />.
  do 7!(move => Hk; case Hk => />). qed.

lemma r_bsrev_ntt_inner_foldl_iE zetas len start r (k:int) :
  0 <= start => start + len*2 <= 256 => 0 <= k <= len =>
  forall i, (r_bsrev_ntt_inner_foldl zetas len start r k).[i] =
  if start <= i < start + k then r.[i] + zetas.[(256 %/ len + start %/ len) %/ 2] * r.[i + len]
  else if start + len <= i < start + len + k then r.[i-len] - zetas.[(256 %/ len + start %/ len) %/ 2] * r.[i]
  else r.[i].  
move => /> H1 H2. elim/natind:k => />.
(*zero*)
move => n *. rewrite /r_bsrev_ntt_inner_foldl rangered => />. rewrite (_:n=0) => />; smt(). 
(*succ*)
move => n Hn Hrec Hk Hn2 i.
rewrite /r_bsrev_ntt_inner_foldl rangeSr => />. rewrite foldl_map /= foldl_rcons => />.
rewrite /r_bsrev_ntt_inner_foldl foldl_map /r_bsrev_ntt_inner in Hrec => />.
rewrite /r_bsrev_ntt_inner => />. rewrite get_set2_add_mulr_if => />; 1..3: by smt(mem_range).
rewrite !Hrec => />; by smt(). qed.

lemma r_bsrev_ntt_outer_foldl_iE zetas len r (k:int) :
  0 < len =>
  0 <= k <= 128 %/ len =>
  forall i, (r_bsrev_ntt_outer_foldl zetas len r k).[i] =
  if 0 <= i < k*len*2 then
  if i %/ len %% 2 = 0 then r.[i] + zetas.[(256 %/ len + (i %/ len)) %/ 2] * r.[i+len]
  else r.[i-len] - zetas.[(256 %/ len + (i%/len-1)) %/ 2] * r.[i]
  else r.[i].
move=> Hlen; elim/natind:k => />.
(*zero*)
move => n *. rewrite /r_bsrev_ntt_outer_foldl rangered => />. rewrite (_:n=0) => />; smt(). 
(*succ*)
move => n Hn1 Hrec Hn2 Hn3 i.
rewrite /r_bsrev_ntt_outer_foldl rangeSr => />. rewrite foldl_map /= foldl_rcons => />.
rewrite /r_bsrev_ntt_outer_foldl foldl_map in Hrec => />.
rewrite /r_bsrev_ntt_outer r_bsrev_ntt_inner_foldl_iE => />; 1..3: by smt(). 
rewrite !Hrec => />; 1..3: by smt(). clear Hrec.
case (0 <= i) => />Hi1; last smt().
case (i < n * len * 2) => />Hi2; first smt().
case (i < n * (len*2)+len) => /> Hi3. 
 rewrite (_:i %/ len = n*2) 2:/#.
 by rewrite divz_eqP // /#.
case (i < n * (len * 2) + len + len) => />Hi4; last smt().
by rewrite (_:i%/len = n*2+1) => /> /#.
qed.

(* simpler definition that greatly speeds up proofs below *)
lemma r_avx2_ntt_spec zetas r k : 0 <= k < 7 =>
  r_avx2_ntt zetas r k = Array256.init (fun i =>
    if (i %/ len_avx2K k) %% 2 = 0 then r.[i] + zetas.[zetasctr_avx2K k + i %/ (len_avx2K k*2) + 1]*r.[i+len_avx2K k] else r.[i-len_avx2K k] + (- zetas.[zetasctr_avx2K k + (i-len_avx2K k) %/ (len_avx2K k*2) + 1]*r.[i])
  ).
proof.
move => Hk. rewrite /r_avx2_ntt /r_bsrev_ntt tP => />i Hi1 Hi2.
rewrite r_bsrev_ntt_outer_foldl_iE => />.
  smt(expr_gt0).
 rewrite block_avx2_equiv /#. 
rewrite initiE Hi1 => />.
move :Hk; rewrite -mem_range rangered => />.
do 8!(try (move => Hk; case Hk => />); first by smt()). 
qed.

(* NTT AVX intermediate implementation *)

(*theory NTT_AVX_Fq.*)

op shuffle8 ['a] (r1 r2: 'a Array16.t): 'a Array16.t * 'a Array16.t =
  ( Array16.init (fun i => if 0 <= i < 8 then r1.[i%%8] else r2.[i%%8])
  , Array16.init (fun i => if 0 <= i < 8 then r1.[i%%8+8] else r2.[i%%8+8])
  ) axiomatized by shuffle8E.

op shuffle4 ['a] (r1 r2: 'a Array16.t): 'a Array16.t * 'a Array16.t =
  ( Array16.init (fun i =>
    if 0 <= i < 4 then r1.[i%%4]
    else if 4 <= i < 8 then r2.[i%%4]
    else if 8 <= i < 12 then r1.[i%%4+8]
    else r2.[i%%4+8]
    )
  , Array16.init (fun i =>
    if 0 <= i < 4 then r1.[i%%4+4]
    else if 4 <= i < 8 then r2.[i%%4+4]
    else if 8 <= i < 12 then r1.[i%%4+12]
    else r2.[i%%4+12]
    )
  ) axiomatized by shuffle4E.

op shuffle2 ['a] (r1 r2: 'a Array16.t): 'a Array16.t * 'a Array16.t =
  ( Array16.init (fun i =>
    if 0 <= i < 2 then r1.[i%%2]
    else if 2 <= i < 4 then r2.[i%%2]
    else if 4 <= i < 6 then r1.[i%%2+4]
    else if 6 <= i < 8 then r2.[i%%2+4]
    else if 8 <= i < 10 then r1.[i%%2+8]
    else if 10 <= i < 12 then r2.[i%%2+8]
    else if 12 <= i < 14 then r1.[i%%2+12]
    else r2.[i%%2+12]
    )
  , Array16.init (fun i =>
    if 0 <= i < 2 then r1.[i%%2+2]
    else if 2 <= i < 4 then r2.[i%%2+2]
    else if 4 <= i < 6 then r1.[i%%2+6]
    else if 6 <= i < 8 then r2.[i%%2+6]
    else if 8 <= i < 10 then r1.[i%%2+10]
    else if 10 <= i < 12 then r2.[i%%2+10]
    else if 12 <= i < 14 then r1.[i%%2+14]
    else r2.[i%%2+14]
    )
  ) axiomatized by shuffle2E.

op shuffle1 ['a] (r1 r2: 'a Array16.t): 'a Array16.t * 'a Array16.t =
  ( Array16.of_list witness [r1.[0];r2.[0];r1.[2];r2.[2];r1.[4];r2.[4];r1.[6];r2.[6];r1.[8];r2.[8];r1.[10];r2.[10];r1.[12];r2.[12];r1.[14];r2.[14]]
  , Array16.of_list witness [r1.[1];r2.[1];r1.[3];r2.[3];r1.[5];r2.[5];r1.[7];r2.[7];r1.[9];r2.[9];r1.[11];r2.[11];r1.[13];r2.[13];r1.[15];r2.[15]]
  ) axiomatized by shuffle1E.

(* These are imperative specifications of the NTT algorithms whose control
   structure matches what is implemented.  *)

(* permutation that nttpack128 applies to the input indexes *)
op perm_nttpack128 : int list =
  [0; 16; 32; 48; 64; 80; 96; 112; 1; 17; 33; 49; 65; 81; 97; 113;
   2; 18; 34; 50; 66; 82; 98; 114; 3; 19; 35; 51; 67; 83; 99; 115;
   4; 20; 36; 52; 68; 84; 100; 116; 5; 21; 37; 53; 69; 85; 101; 117;
   6; 22; 38; 54; 70; 86; 102; 118; 7; 23; 39; 55; 71; 87; 103; 119;
   8; 24; 40; 56; 72; 88; 104; 120; 9; 25; 41; 57; 73; 89; 105; 121;
   10; 26; 42; 58; 74; 90; 106; 122; 11; 27; 43; 59; 75; 91; 107; 123;
   12; 28; 44; 60; 76; 92; 108; 124; 13; 29; 45; 61; 77; 93; 109; 125;
   14; 30; 46; 62; 78; 94; 110; 126; 15; 31; 47; 63; 79; 95; 111; 127]
  axiomatized by perm_nttpack128E.

(* permutation that nttunpack128 applies to the input indexes *)
op perm_nttunpack128 : int list =
  [0;8;16;24;32;40;48;56;64;72;80;88;96;104;112;120;
  1;9;17;25;33;41;49;57;65;73;81;89;97;105;113;121;
  2;10;18;26;34;42;50;58;66;74;82;90;98;106;114;122;
  3;11;19;27;35;43;51;59;67;75;83;91;99;107;115;123;
  4;12;20;28;36;44;52;60;68;76;84;92;100;108;116;124;
  5;13;21;29;37;45;53;61;69;77;85;93;101;109;117;125;
  6;14;22;30;38;46;54;62;70;78;86;94;102;110;118;126;
  7;15;23;31;39;47;55;63;71;79;87;95;103;111;119;127]
  axiomatized by perm_nttunpack128E.

module NTT_AVX = {

proc __nttpack128(r0 r1 r2 r3 r4 r5 r6 r7: Fq Array16.t): Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t = {
  
  var r0a,r1a,r2a,r3a,r4a,r5a,r6a,r7a : Fq Array16.t;
  var r0b,r1b,r2b,r3b,r4b,r5b,r6b,r7b : Fq Array16.t;
  var r0c,r1c,r2c,r3c,r4c,r5c,r6c,r7c : Fq Array16.t;
  var r0d,r1d,r2d,r3d,r4d,r5d,r6d,r7d : Fq Array16.t;

  (r0a, r1a) <- shuffle1 r0 r1;
  (r2a, r3a) <- shuffle1 r2 r3;
  (r4a, r5a) <- shuffle1 r4 r5;
  (r6a, r7a) <- shuffle1 r6 r7;

  (r0b, r2b) <- shuffle2 r0a r2a;
  (r4b, r6b) <- shuffle2 r4a r6a;
  (r1b, r3b) <- shuffle2 r1a r3a;
  (r5b, r7b) <- shuffle2 r5a r7a;

  (r0c, r4c) <- shuffle4 r0b r4b;
  (r1c, r5c) <- shuffle4 r1b r5b;
  (r2c, r6c) <- shuffle4 r2b r6b;
  (r3c, r7c) <- shuffle4 r3b r7b;

  (r0d, r1d) <- shuffle8 r0c r1c;
  (r2d, r3d) <- shuffle8 r2c r3c;
  (r4d, r5d) <- shuffle8 r4c r5c;
  (r6d, r7d) <- shuffle8 r6c r7c;

  return (r0d, r2d, r4d, r6d, r1d, r3d, r5d, r7d);
}

proc __butterfly64x(rl0t rl1t rl2t rl3t rh0t rh1t rh2t rh3t z0 z1: Fq Array16.t) : Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t * Fq Array16.t = {

  var rl0, rl1, rl2, rl3, rh0, rh1, rh2, rh3;

  rh0 <- Array16.init (fun i => rl0t.[i] + -(z0.[i] * rh0t.[i]));
  rl0 <- Array16.init (fun i => rl0t.[i] + z0.[i] * rh0t.[i]);
  
  rh1 <- Array16.init (fun i => rl1t.[i] + -(z0.[i] * rh1t.[i]));
  rl1 <- Array16.init (fun i => rl1t.[i] + z0.[i] * rh1t.[i]);
  
  rh2 <- Array16.init (fun i => rl2t.[i] + -(z1.[i] * rh2t.[i]));
  rl2 <- Array16.init (fun i => rl2t.[i] + z1.[i] * rh2t.[i]);
  
  rh3 <- Array16.init (fun i => rl3t.[i] + -(z1.[i] * rh3t.[i]));
  rl3 <- Array16.init (fun i => rl3t.[i] + z1.[i] * rh3t.[i]);
  
  return (rl0, rl1, rl2, rl3, rh0, rh1, rh2, rh3);
}

(* This procedure handles the iteration where the butterflies touch both halves
   of the 256-position array. For all the other rounds, the implementation does
   roughly the same process on each 128 position half. See loop *)

proc __ntt_level0 (rp : Fq Array256.t) : Fq Array256.t = {

  var  zeta1 : Fq Array16.t;
  var r0, r1, r2, r3, r4, r5, r6, r7 : Fq Array16.t;
  var r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a : Fq Array16.t;
  var r0b, r1b, r2b, r3b, r4b, r5b, r6b, r7b : Fq Array16.t;
  var r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c : Fq Array16.t;

  (r0,r1,r2,r3,r0b,r1b,r2b,r3b) <- (P2C rp 0, P2C rp 1, P2C rp 2, P2C rp 3, P2C rp 4, P2C rp 5, P2C rp 6, P2C rp 7);
  (r4,r5,r6,r7,r4b,r5b,r6b,r7b) <- (P2C rp 8, P2C rp 9, P2C rp 10, P2C rp 11, P2C rp 12, P2C rp 13, P2C rp 14, P2C rp 15);

  zeta1 <- Array16.init (fun i => inFq 1729);

  (r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a) <@ 
      __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta1, zeta1);

  (r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c) <@ 
      __butterfly64x(r0b, r1b, r2b, r3b, r4b, r5b, r6b, r7b, zeta1, zeta1);
      
 return CS2P [r0a;r1a;r2a;r3a;r0c;r1c;r2c;r3c;r4a;r5a;r6a;r7a;r4c;r5c;r6c;r7c];

}

proc __ntt_level1(rp : Fq Array256.t) : Fq Array256.t = {

  var zeta1,zeta1k : Fq Array16.t; 
  var r0, r1, r2, r3, r4, r5, r6, r7 : Fq Array16.t;
  var r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a : Fq Array16.t;
  var r0k, r1k, r2k, r3k, r4k, r5k, r6k, r7k : Fq Array16.t;
  var r0l, r1l, r2l, r3l, r4l, r5l, r6l, r7l : Fq Array16.t;

  (r0,r1,r2,r3,r4,r5,r6,r7) <- (P2C rp 0, P2C rp 1, P2C rp 2, P2C rp 3, P2C rp 4, P2C rp 5, P2C rp 6, P2C rp 7);
  (r0k,r1k,r2k,r3k,r4k,r5k,r6k,r7k) <- (P2C rp 8, P2C rp 9, P2C rp 10, P2C rp 11, P2C rp 12, P2C rp 13, P2C rp 14, P2C rp 15);

  (* first 128 *)
  zeta1 <- Array16.init (fun i => inFq 2580);

  (r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a) <@ 
       __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta1, zeta1);
       
  (* second 128 *)
       
  zeta1k <- Array16.init (fun i => inFq 3289);

  (r0l, r1l, r2l, r3l, r4l, r5l, r6l, r7l) <@ 
      __butterfly64x(r0k, r1k, r2k, r3k, r4k, r5k, r6k, r7k, zeta1k, zeta1k);
    
  return CS2P [r0a;r1a;r2a;r3a;r4a;r5a;r6a;r7a;r0l;r1l;r2l;r3l;r4l;r5l;r6l;r7l];
}

proc __ntt_level2(rp : Fq Array256.t) : Fq Array256.t = {

  var zeta1b, zeta1m : Fq Array16.t; 
  var r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a : Fq Array16.t;
  var r0b, r1b, r2b, r3b, r4b, r5b, r6b, r7b : Fq Array16.t;
  var r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c : Fq Array16.t;
  var r0l, r1l, r2l, r3l, r4l, r5l, r6l, r7l : Fq Array16.t;
  var r0m, r1m, r2m, r3m, r4m, r5m, r6m, r7m : Fq Array16.t;
  var r0n, r1n, r2n, r3n, r4n, r5n, r6n, r7n : Fq Array16.t;

  (r0a,r1a,r2a,r3a,r4a,r5a,r6a,r7a) <- (P2C rp 0, P2C rp 1, P2C rp 2, P2C rp 3, P2C rp 4, P2C rp 5, P2C rp 6, P2C rp 7);
  (r0l,r1l,r2l,r3l,r4l,r5l,r6l,r7l) <- (P2C rp 8, P2C rp 9, P2C rp 10, P2C rp 11, P2C rp 12, P2C rp 13, P2C rp 14, P2C rp 15);

  zeta1b <- Array16.of_list witness
             [ inFq 2642; inFq 2642; inFq 2642; inFq 2642; inFq 2642; inFq 2642; inFq 2642; inFq 2642;
               inFq 630; inFq 630; inFq 630; inFq 630; inFq 630; inFq 630; inFq 630; inFq 630 ];

  (r0b,r4b) <- shuffle8 r0a r4a;
  (r1b,r5b) <- shuffle8 r1a r5a;
  (r2b,r6b) <- shuffle8 r2a r6a;
  (r3b,r7b) <- shuffle8 r3a r7a;

  (r0c, r4c, r1c, r5c, r2c, r6c, r3c, r7c) <@ 
      __butterfly64x(r0b, r4b, r1b, r5b, r2b, r6b, r3b, r7b, zeta1b, zeta1b);
  
  zeta1m <- Array16.of_list witness
             [ inFq 1897; inFq 1897; inFq 1897; inFq 1897; inFq 1897; inFq 1897; inFq 1897; inFq 1897; 
               inFq 848; inFq 848; inFq 848; inFq 848; inFq 848; inFq 848; inFq 848; inFq 848 ];

  (r0m,r4m) <- shuffle8 r0l r4l;
  (r1m,r5m) <- shuffle8 r1l r5l;
  (r2m,r6m) <- shuffle8 r2l r6l;
  (r3m,r7m) <- shuffle8 r3l r7l;

  (r0n, r4n, r1n, r5n, r2n, r6n, r3n, r7n) <@ 
      __butterfly64x(r0m, r4m, r1m, r5m, r2m, r6m, r3m, r7m, zeta1m, zeta1m);
      
  return CS2P [r0c;r4c;r1c;r5c;r2c;r6c;r3c;r7c;r0n;r4n;r1n;r5n;r2n;r6n;r3n;r7n];

}
  
proc __ntt_level3(rp : Fq Array256.t) : Fq Array256.t = {
  var zeta1d, zeta1o : Fq Array16.t; 
  var r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c : Fq Array16.t;
  var r0d, r1d, r2d, r3d, r4d, r5d, r6d, r7d : Fq Array16.t;
  var r0e, r1e, r2e, r3e, r4e, r5e, r6e, r7e : Fq Array16.t;
  var r0n, r1n, r2n, r3n, r4n, r5n, r6n, r7n : Fq Array16.t;
  var r0o, r1o, r2o, r3o, r4o, r5o, r6o, r7o : Fq Array16.t;
  var r0p, r1p, r2p, r3p, r4p, r5p, r6p, r7p : Fq Array16.t;
  var r1_,r2_,r3_,r4_,r5_,r6_,r7_,r8_,r9_,r10_,r11_,r12_,r13_,r14_,r15_,r16_ : Fq Array16.t;

  (r0c, r4c, r1c, r5c, r2c, r6c, r3c, r7c) <- (P2C rp 0, P2C rp 1, P2C rp 2, P2C rp 3, P2C rp 4, P2C rp 5, P2C rp 6, P2C rp 7);
  (r0n, r4n, r1n, r5n, r2n, r6n, r3n, r7n) <- (P2C rp 8, P2C rp 9, P2C rp 10, P2C rp 11, P2C rp 12, P2C rp 13, P2C rp 14, P2C rp 15);
  
  zeta1d <- Array16.of_list witness
             [ inFq 1062; inFq 1062; inFq 1062; inFq 1062; 
               inFq 1919; inFq 1919; inFq 1919; inFq 1919; 
               inFq 193; inFq 193; inFq 193; inFq 193; 
               inFq 797; inFq 797; inFq 797; inFq 797 ];

  (r0d,r2d) <- shuffle4 r0c r2c;
  (r4d,r6d) <- shuffle4 r4c r6c;
  (r1d,r3d) <- shuffle4 r1c r3c;
  (r5d,r7d) <- shuffle4 r5c r7c;

  (r0e, r2e, r4e, r6e, r1e, r3e, r5e, r7e) <@ 
       __butterfly64x(r0d, r2d, r4d, r6d, r1d, r3d, r5d, r7d, zeta1d, zeta1d);

  zeta1o <- Array16.of_list witness
             [ inFq 2786; inFq 2786; inFq 2786; inFq 2786; 
               inFq 3260; inFq 3260; inFq 3260; inFq 3260; 
               inFq 569; inFq 569; inFq 569; inFq 569; 
               inFq 1746; inFq 1746; inFq 1746; inFq 1746 ];

  (r0o,r2o) <- shuffle4 r0n r2n;
  (r4o,r6o) <- shuffle4 r4n r6n;
  (r1o,r3o) <- shuffle4 r1n r3n;
  (r5o,r7o) <- shuffle4 r5n r7n;
  
  (r0p, r2p, r4p, r6p, r1p, r3p, r5p, r7p) <@ 
       __butterfly64x(r0o, r2o, r4o, r6o, r1o, r3o, r5o, r7o, zeta1o, zeta1o);

  return CS2P [r0e;r2e;r4e;r6e;r1e;r3e;r5e;r7e;r0p;r2p;r4p;r6p;r1p;r3p;r5p;r7p];      
}

proc __ntt_level4(rp : Fq Array256.t) : Fq Array256.t = {

  var zeta1f, zeta1q : Fq Array16.t; 
  var r0e, r1e, r2e, r3e, r4e, r5e, r6e, r7e : Fq Array16.t;
  var r0f, r1f, r2f, r3f, r4f, r5f, r6f, r7f : Fq Array16.t;
  var r0g, r1g, r2g, r3g, r4g, r5g, r6g, r7g : Fq Array16.t;
  var r0p, r1p, r2p, r3p, r4p, r5p, r6p, r7p : Fq Array16.t;
  var r0q, r1q, r2q, r3q, r4q, r5q, r6q, r7q : Fq Array16.t;
  var r0r, r1r, r2r, r3r, r4r, r5r, r6r, r7r : Fq Array16.t;
  var rp1, rp2, rp3, rp4, rp5, rp6, rp7, rp8 : Fq Array256.t;

  (r0e,r2e,r4e,r6e,r1e,r3e,r5e,r7e) <- (P2C rp 0, P2C rp 1, P2C rp 2, P2C rp 3, P2C rp 4, P2C rp 5, P2C rp 6, P2C rp 7);
  (r0p,r2p,r4p,r6p,r1p,r3p,r5p,r7p) <- (P2C rp 8, P2C rp 9, P2C rp 10, P2C rp 11, P2C rp 12, P2C rp 13, P2C rp 14, P2C rp 15);
  
  zeta1f <- Array16.of_list witness
             [ inFq 296; inFq 296; inFq 2447; inFq 2447; 
               inFq 1339; inFq 1339; inFq 1476; inFq 1476; 
               inFq 3046; inFq 3046; inFq 56; inFq 56; 
               inFq 2240; inFq 2240; inFq 1333; inFq 1333 ];

  (r0f, r1f) <- shuffle2 r0e r1e;
  (r2f, r3f) <- shuffle2 r2e r3e;
  (r4f, r5f) <- shuffle2 r4e r5e;
  (r6f, r7f) <- shuffle2 r6e r7e;

  (r0g, r1g, r2g, r3g, r4g, r5g, r6g, r7g) <@ 
         __butterfly64x(r0f, r1f, r2f, r3f, r4f, r5f, r6f, r7f, zeta1f, zeta1f);
  
  zeta1q <- Array16.of_list witness
             [ inFq 1426; inFq 1426; inFq 2094; inFq 2094; 
               inFq 535; inFq 535; inFq 2882; inFq 2882; 
               inFq 2393; inFq 2393; inFq 2879; inFq 2879; 
               inFq 1974; inFq 1974; inFq 821; inFq 821 ];

  (r0q, r1q) <- shuffle2 r0p r1p;
  (r2q, r3q) <- shuffle2 r2p r3p;
  (r4q, r5q) <- shuffle2 r4p r5p;
  (r6q, r7q) <- shuffle2 r6p r7p;

  (r0r, r1r, r2r, r3r, r4r, r5r, r6r, r7r) <@ 
         __butterfly64x(r0q, r1q, r2q, r3q, r4q, r5q, r6q, r7q, zeta1q, zeta1q);

  return CS2P [r0g;r1g;r2g;r3g;r4g;r5g;r6g;r7g;r0r;r1r;r2r;r3r;r4r;r5r;r6r;r7r];

}

proc __ntt_level5(rp : Fq Array256.t) : Fq Array256.t = {

  var zeta1h, zeta1s : Fq Array16.t; 
  
  var r0g, r1g, r2g, r3g, r4g, r5g, r6g, r7g : Fq Array16.t;
  var r0h, r1h, r2h, r3h, r4h, r5h, r6h, r7h : Fq Array16.t;
  var r0i, r1i, r2i, r3i, r4i, r5i, r6i, r7i : Fq Array16.t;
  var r0r, r1r, r2r, r3r, r4r, r5r, r6r, r7r : Fq Array16.t;
  var r0s, r1s, r2s, r3s, r4s, r5s, r6s, r7s : Fq Array16.t;
  var r0t, r1t, r2t, r3t, r4t, r5t, r6t, r7t : Fq Array16.t;
  var rp1, rp2, rp3, rp4, rp5, rp6, rp7, rp8 : Fq Array256.t;

  (r0g,r1g,r2g,r3g,r4g,r5g,r6g,r7g) <- (P2C rp 0, P2C rp 1, P2C rp 2, P2C rp 3, P2C rp 4, P2C rp 5, P2C rp 6, P2C rp 7);
  (r0r,r1r,r2r,r3r,r4r,r5r,r6r,r7r) <- (P2C rp 8, P2C rp 9, P2C rp 10, P2C rp 11, P2C rp 12, P2C rp 13, P2C rp 14, P2C rp 15);
 
  zeta1h <- Array16.of_list witness
             [ inFq 289; inFq 331; inFq 3253; inFq 1756; inFq 1197; inFq 2304; inFq 2277; inFq 2055; inFq 650; inFq 1977; inFq 2513; inFq 632; inFq 2865; inFq 33; inFq 1320; inFq 1915 ];

  (r0h,r4h) <- shuffle1 r0g r4g;
  (r1h,r5h) <- shuffle1 r1g r5g;
  (r2h,r6h) <- shuffle1 r2g r6g;
  (r3h,r7h) <- shuffle1 r3g r7g;

  ( r0i, r4i, r1i, r5i, r2i, r6i, r3i, r7i ) <@ 
       __butterfly64x(r0h, r4h, r1h, r5h, r2h, r6h, r3h, r7h, zeta1h, zeta1h);
  
  zeta1s <- Array16.of_list witness
             [ inFq 2319; inFq 1435; inFq 807; inFq 452; inFq 1438; inFq 2868; inFq 1534; inFq 2402; inFq 2647; inFq 2617; inFq 1481; inFq 648; inFq 2474; inFq 3110; inFq 1227; inFq 910 ];

  (r0s,r4s) <- shuffle1 r0r r4r;
  (r1s,r5s) <- shuffle1 r1r r5r;
  (r2s,r6s) <- shuffle1 r2r r6r;
  (r3s,r7s) <- shuffle1 r3r r7r;

  ( r0t, r4t, r1t, r5t, r2t, r6t, r3t, r7t ) <@ 
       __butterfly64x(r0s, r4s, r1s, r5s, r2s, r6s, r3s, r7s, zeta1s, zeta1s);
  
  return CS2P [r0i;r4i;r1i;r5i;r2i;r6i;r3i;r7i;r0t;r4t;r1t;r5t;r2t;r6t;r3t;r7t];
}
  
proc __ntt_level6(rp : Fq Array256.t) : Fq Array256.t = {

  var zeta2i, zeta3i, zeta2t, zeta3t : Fq Array16.t; 
  var r0i, r1i, r2i, r3i, r4i, r5i, r6i, r7i : Fq Array16.t;
  var r0j, r1j, r2j, r3j, r4j, r5j, r6j, r7j : Fq Array16.t;
  var r0t, r1t, r2t, r3t, r4t, r5t, r6t, r7t : Fq Array16.t;
  var r0u, r1u, r2u, r3u, r4u, r5u, r6u, r7u : Fq Array16.t;
  
  (r0i,r4i,r1i,r5i,r2i,r6i,r3i,r7i) <- (P2C rp 0, P2C rp 1, P2C rp 2, P2C rp 3, P2C rp 4, P2C rp 5, P2C rp 6, P2C rp 7);
  (r0t,r4t,r1t,r5t,r2t,r6t,r3t,r7t) <- (P2C rp 8, P2C rp 9, P2C rp 10, P2C rp 11, P2C rp 12, P2C rp 13, P2C rp 14, P2C rp 15);
  
  zeta2i <- Array16.of_list witness
             [ inFq 17; inFq 583; inFq 1637; inFq 2288; inFq 1409; inFq 3281; inFq 756; inFq 3015; 
               inFq 1703; inFq 2789; inFq 1847; inFq 1461; inFq 939; inFq 2437; inFq 733; inFq 268 ];
  zeta3i <- Array16.of_list witness
             [ inFq 2761; inFq 2649; inFq 723; inFq 1100; inFq 2662; inFq 233; inFq 2156; inFq 3050; 
               inFq 1651; inFq 1789; inFq 952; inFq 2687; inFq 2308; inFq 2388; inFq 2337; inFq 641 ];
           
  (r0j, r4j, r2j, r6j, r1j, r5j, r3j, r7j) <@ 
        __butterfly64x(r0i, r4i, r2i, r6i, r1i, r5i, r3i, r7i, zeta2i, zeta3i);

  zeta2t <- Array16.of_list witness
             [ inFq 1584; inFq 2037; inFq 375; inFq 2090; inFq 1063; inFq 2773; inFq 2099; inFq 2466;
               inFq 2804; inFq 403; inFq 1143; inFq 2775; inFq 1722; inFq 1874; inFq 2110; inFq 885 ];
  zeta3t <- Array16.of_list witness
             [ inFq 2298; inFq 3220; inFq 2549; inFq 1645; inFq 319; inFq 757; inFq 561; inFq 2594;
               inFq 1092; inFq 1026; inFq 2150; inFq 886; inFq 1212; inFq 1029; inFq 2935; inFq 2154 ];

  (r0u, r4u, r2u, r6u, r1u, r5u, r3u, r7u) <@ 
        __butterfly64x(r0t, r4t, r2t, r6t, r1t, r5t, r3t, r7t, zeta2t, zeta3t);
  
  return CS2P [r0j;r4j;r1j;r5j;r2j;r6j;r3j;r7j;r0u;r4u;r1u;r5u;r2u;r6u;r3u;r7u];
}

proc __ntt_level1t6(rp : Fq Array256.t) : Fq Array256.t = {

  var zeta1, zeta1b, zeta1d : Fq Array16.t; 
  var zeta1f, zeta1h, zeta2i, zeta3i : Fq Array16.t; 
  var zeta1k, zeta1m, zeta1o : Fq Array16.t; 
  var zeta1q, zeta1s, zeta2t, zeta3t : Fq Array16.t; 
  var r0, r1, r2, r3, r4, r5, r6, r7 : Fq Array16.t;
  var r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a : Fq Array16.t;
  var r0b, r1b, r2b, r3b, r4b, r5b, r6b, r7b : Fq Array16.t;
  var r0c, r1c, r2c, r3c, r4c, r5c, r6c, r7c : Fq Array16.t;
  var r0d, r1d, r2d, r3d, r4d, r5d, r6d, r7d : Fq Array16.t;
  var r0e, r1e, r2e, r3e, r4e, r5e, r6e, r7e : Fq Array16.t;
  var r0f, r1f, r2f, r3f, r4f, r5f, r6f, r7f : Fq Array16.t;
  var r0g, r1g, r2g, r3g, r4g, r5g, r6g, r7g : Fq Array16.t;
  var r0h, r1h, r2h, r3h, r4h, r5h, r6h, r7h : Fq Array16.t;
  var r0i, r1i, r2i, r3i, r4i, r5i, r6i, r7i : Fq Array16.t;
  var r0j, r1j, r2j, r3j, r4j, r5j, r6j, r7j : Fq Array16.t;
  var r0k, r1k, r2k, r3k, r4k, r5k, r6k, r7k : Fq Array16.t;
  var r0l, r1l, r2l, r3l, r4l, r5l, r6l, r7l : Fq Array16.t;
  var r0m, r1m, r2m, r3m, r4m, r5m, r6m, r7m : Fq Array16.t;
  var r0n, r1n, r2n, r3n, r4n, r5n, r6n, r7n : Fq Array16.t;
  var r0o, r1o, r2o, r3o, r4o, r5o, r6o, r7o : Fq Array16.t;
  var r0p, r1p, r2p, r3p, r4p, r5p, r6p, r7p : Fq Array16.t;
  var r0q, r1q, r2q, r3q, r4q, r5q, r6q, r7q : Fq Array16.t;
  var r0r, r1r, r2r, r3r, r4r, r5r, r6r, r7r : Fq Array16.t;
  var r0s, r1s, r2s, r3s, r4s, r5s, r6s, r7s : Fq Array16.t;
  var r0t, r1t, r2t, r3t, r4t, r5t, r6t, r7t : Fq Array16.t;
  var r0u, r1u, r2u, r3u, r4u, r5u, r6u, r7u : Fq Array16.t;
  var r0x, r1x, r2x, r3x, r4x, r5x, r6x, r7x : Fq Array16.t;
  var rp1, rp2, rp3, rp4, rp5, rp6, rp7, rp8 : Fq Array256.t;
  var rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16 : Fq Array256.t;

(**** LEFT-HALF*****)

  (* level 1 *)

   zeta1 <- Array16.init (fun i => inFq 2580);

    r0 <- P2C rp 0;
    r1 <- P2C rp 1;
    r2 <- P2C rp 2;
    r3 <- P2C rp 3;
    r4 <- P2C rp 4;
    r5 <- P2C rp 5;
    r6 <- P2C rp 6;
    r7 <- P2C rp 7;

    (r0a, r1a, r2a, r3a, r4a, r5a, r6a, r7a) <@ 
        __butterfly64x(r0, r1, r2, r3, r4, r5, r6, r7, zeta1, zeta1);

    (* level 2 *)

  zeta1b <- Array16.of_list witness
             [ inFq 2642; inFq 2642; inFq 2642; inFq 2642; inFq 2642; inFq 2642; inFq 2642; inFq 2642;
               inFq 630; inFq 630; inFq 630; inFq 630; inFq 630; inFq 630; inFq 630; inFq 630 ];


    (r0b,r4b) <- shuffle8 r0a r4a;
    (r1b,r5b) <- shuffle8 r1a r5a;
    (r2b,r6b) <- shuffle8 r2a r6a;
    (r3b,r7b) <- shuffle8 r3a r7a;

    (r0c, r4c, r1c, r5c, r2c, r6c, r3c, r7c) <@ 
        __butterfly64x(r0b, r4b, r1b, r5b, r2b, r6b, r3b, r7b, zeta1b, zeta1b);
    
    (* level 3 *)

  zeta1d <- Array16.of_list witness
             [ inFq 1062; inFq 1062; inFq 1062; inFq 1062; 
               inFq 1919; inFq 1919; inFq 1919; inFq 1919; 
               inFq 193; inFq 193; inFq 193; inFq 193; 
               inFq 797; inFq 797; inFq 797; inFq 797 ];

    (r0d,r2d) <- shuffle4 r0c r2c;
    (r4d,r6d) <- shuffle4 r4c r6c;
    (r1d,r3d) <- shuffle4 r1c r3c;
    (r5d,r7d) <- shuffle4 r5c r7c;

    (r0e, r2e, r4e, r6e, r1e, r3e, r5e, r7e) <@ 
         __butterfly64x(r0d, r2d, r4d, r6d, r1d, r3d, r5d, r7d, zeta1d, zeta1d);

    (* level 4 *)

  zeta1f <- Array16.of_list witness
             [ inFq 296; inFq 296; inFq 2447; inFq 2447; 
               inFq 1339; inFq 1339; inFq 1476; inFq 1476; 
               inFq 3046; inFq 3046; inFq 56; inFq 56; 
               inFq 2240; inFq 2240; inFq 1333; inFq 1333 ];


    (r0f, r1f) <- shuffle2 r0e r1e;
    (r2f, r3f) <- shuffle2 r2e r3e;
    (r4f, r5f) <- shuffle2 r4e r5e;
    (r6f, r7f) <- shuffle2 r6e r7e;

    (r0g, r1g, r2g, r3g, r4g, r5g, r6g, r7g) <@ 
           __butterfly64x(r0f, r1f, r2f, r3f, r4f, r5f, r6f, r7f, zeta1f, zeta1f);

    (* level 5 *)

  zeta1h <- Array16.of_list witness
             [ inFq 289; inFq 331; inFq 3253; inFq 1756; inFq 1197; inFq 2304; inFq 2277; inFq 2055; inFq 650; inFq 1977; inFq 2513; inFq 632; inFq 2865; inFq 33; inFq 1320; inFq 1915 ];


    (r0h,r4h) <- shuffle1 r0g r4g;
    (r1h,r5h) <- shuffle1 r1g r5g;
    (r2h,r6h) <- shuffle1 r2g r6g;
    (r3h,r7h) <- shuffle1 r3g r7g;

    ( r0i, r4i, r1i, r5i, r2i, r6i, r3i, r7i ) <@ 
         __butterfly64x(r0h, r4h, r1h, r5h, r2h, r6h, r3h, r7h, zeta1h, zeta1h);

    (* level 6 *)

  zeta2i <- Array16.of_list witness
             [ inFq 17; inFq 583; inFq 1637; inFq 2288; inFq 1409; inFq 3281; inFq 756; inFq 3015; 
               inFq 1703; inFq 2789; inFq 1847; inFq 1461; inFq 939; inFq 2437; inFq 733; inFq 268 ];
  zeta3i <- Array16.of_list witness
             [ inFq 2761; inFq 2649; inFq 723; inFq 1100; inFq 2662; inFq 233; inFq 2156; inFq 3050; 
               inFq 1651; inFq 1789; inFq 952; inFq 2687; inFq 2308; inFq 2388; inFq 2337; inFq 641 ];


    (r0j, r4j, r2j, r6j, r1j, r5j, r3j, r7j) <@ 
          __butterfly64x(r0i, r4i, r2i, r6i, r1i, r5i, r3i, r7i, zeta2i, zeta3i);

    
    rp1 <- PUC rp 0 r0j;
    rp2 <- PUC rp1 1 r4j;
    rp3 <- PUC rp2 2 r1j;
    rp4 <- PUC rp3 3 r5j;
    rp5 <- PUC rp4 4 r2j;
    rp6 <- PUC rp5 5 r6j;
    rp7 <- PUC rp6 6 r3j;
    rp8 <- PUC rp7 7 r7j;

(**** RIGHT-HALF*****)

  (* level 1 *)

  zeta1k <- Array16.init (fun i => inFq 3289);

    r0k <- P2C rp 8;
    r1k <- P2C rp 9;
    r2k <- P2C rp 10;
    r3k <- P2C rp 11;
    r4k <- P2C rp 12;
    r5k <- P2C rp 13;
    r6k <- P2C rp 14;
    r7k <- P2C rp 15;

    (r0l, r1l, r2l, r3l, r4l, r5l, r6l, r7l) <@ 
        __butterfly64x(r0k, r1k, r2k, r3k, r4k, r5k, r6k, r7k, zeta1k, zeta1k);

    (* level 2 *)

  zeta1m <- Array16.of_list witness
             [ inFq 1897; inFq 1897; inFq 1897; inFq 1897; inFq 1897; inFq 1897; inFq 1897; inFq 1897; 
               inFq 848; inFq 848; inFq 848; inFq 848; inFq 848; inFq 848; inFq 848; inFq 848 ];

    (r0m,r4m) <- shuffle8 r0l r4l;
    (r1m,r5m) <- shuffle8 r1l r5l;
    (r2m,r6m) <- shuffle8 r2l r6l;
    (r3m,r7m) <- shuffle8 r3l r7l;

    (r0n, r4n, r1n, r5n, r2n, r6n, r3n, r7n) <@ 
        __butterfly64x(r0m, r4m, r1m, r5m, r2m, r6m, r3m, r7m, zeta1m, zeta1m);

    (* level 3 *)

  zeta1o <- Array16.of_list witness
             [ inFq 2786; inFq 2786; inFq 2786; inFq 2786; 
               inFq 3260; inFq 3260; inFq 3260; inFq 3260; 
               inFq 569; inFq 569; inFq 569; inFq 569; 
               inFq 1746; inFq 1746; inFq 1746; inFq 1746 ];


    (r0o,r2o) <- shuffle4 r0n r2n;
    (r4o,r6o) <- shuffle4 r4n r6n;
    (r1o,r3o) <- shuffle4 r1n r3n;
    (r5o,r7o) <- shuffle4 r5n r7n;

    (r0p, r2p, r4p, r6p, r1p, r3p, r5p, r7p) <@ 
         __butterfly64x(r0o, r2o, r4o, r6o, r1o, r3o, r5o, r7o, zeta1o, zeta1o);

    (* level 4 *)

  zeta1q <- Array16.of_list witness
             [ inFq 1426; inFq 1426; inFq 2094; inFq 2094; 
               inFq 535; inFq 535; inFq 2882; inFq 2882; 
               inFq 2393; inFq 2393; inFq 2879; inFq 2879; 
               inFq 1974; inFq 1974; inFq 821; inFq 821 ];

    (r0q, r1q) <- shuffle2 r0p r1p;
    (r2q, r3q) <- shuffle2 r2p r3p;
    (r4q, r5q) <- shuffle2 r4p r5p;
    (r6q, r7q) <- shuffle2 r6p r7p;

    (r0r, r1r, r2r, r3r, r4r, r5r, r6r, r7r) <@ 
           __butterfly64x(r0q, r1q, r2q, r3q, r4q, r5q, r6q, r7q, zeta1q, zeta1q);

    (* level 5 *)

  zeta1s <- Array16.of_list witness
             [ inFq 2319; inFq 1435; inFq 807; inFq 452; inFq 1438; inFq 2868; inFq 1534; inFq 2402; inFq 2647; inFq 2617; inFq 1481; inFq 648; inFq 2474; inFq 3110; inFq 1227; inFq 910 ];

    (r0s,r4s) <- shuffle1 r0r r4r;
    (r1s,r5s) <- shuffle1 r1r r5r;
    (r2s,r6s) <- shuffle1 r2r r6r;
    (r3s,r7s) <- shuffle1 r3r r7r;

    ( r0t, r4t, r1t, r5t, r2t, r6t, r3t, r7t ) <@ 
         __butterfly64x(r0s, r4s, r1s, r5s, r2s, r6s, r3s, r7s, zeta1s, zeta1s);

    (* level 6 *)

  zeta2t <- Array16.of_list witness
             [ inFq 1584; inFq 2037; inFq 375; inFq 2090; inFq 1063; inFq 2773; inFq 2099; inFq 2466;
               inFq 2804; inFq 403; inFq 1143; inFq 2775; inFq 1722; inFq 1874; inFq 2110; inFq 885 ];
  zeta3t <- Array16.of_list witness
             [ inFq 2298; inFq 3220; inFq 2549; inFq 1645; inFq 319; inFq 757; inFq 561; inFq 2594;
               inFq 1092; inFq 1026; inFq 2150; inFq 886; inFq 1212; inFq 1029; inFq 2935; inFq 2154 ];

    (r0u, r4u, r2u, r6u, r1u, r5u, r3u, r7u) <@ 
          __butterfly64x(r0t, r4t, r2t, r6t, r1t, r5t, r3t, r7t, zeta2t, zeta3t);

    rp9  <- PUC rp8 8 r0u;
    rp10 <-  PUC rp9 9 r4u;
    rp11 <-  PUC rp10 10 r1u;
    rp12 <- PUC rp11 11 r5u;
    rp13 <- PUC rp12 12 r2u;
    rp14 <- PUC rp13 13 r6u;
    rp15 <- PUC rp14 14 r3u;
    rp16 <- PUC rp15 15 r7u;

    return rp16;
 }

 proc ntt(r : Fq Array256.t,  zetas : Fq Array400.t) : Fq Array256.t = {
  var rp0,rp6 : Fq Array256.t;
  rp0 <@ __ntt_level0(r);
  rp6 <@ __ntt_level1t6(rp0);
  return rp6;
 }
 
 proc ntt0t6(r : Fq Array256.t) : Fq Array256.t = {
  var rp0,rp1,rp2,rp3,rp4,rp5,rp6;
  rp0 <@ __ntt_level0(r);
  rp1 <@ __ntt_level1(rp0);
  rp2 <@ __ntt_level2(rp1);
  rp3 <@ __ntt_level3(rp2);
  rp4 <@ __ntt_level4(rp3);
  rp5 <@ __ntt_level5(rp4);
  rp6 <@ __ntt_level6(rp5);
  return rp6;
 }

}.

(* pack consistent with packing permutation *)
(*
require import Array8.
op CS2H ['a] (l: 'a Array16.t list): 'a Array128.t =
 Array128.init (fun i=> (Array8.of_list witness l).[i%/16].[i%%16]).

hoare __nttpack128_perm r :
  NTT_AVX.__nttpack128 : r=CS2H [r0;r1;r2;r3;r4;r5;r6;r7] ==> res = perm128 perm_nttpack128 r.
  proc. inline *; wp; auto => />. rewrite prod8.
  do 8!(try split; first by apply Array16_extra.tP_red => i; simplify; rewrite !shuffle8E !shuffle4E !shuffle2E !shuffle1E !perm_nttpack128E => />; do 16!(move => Hi; case Hi => />)). qed.
*)

(* equivalence between full-inline-SSA and level-by-level ntt avx2 *)
lemma ntt0t6_ntt : 
  equiv [ NTT_AVX.ntt ~ NTT_AVX.ntt0t6 : ={r} ==> ={res}].
proc; simplify.
seq 1 1: (={rp0}).
 by inline *; auto. 
inline{1} NTT_AVX.__ntt_level1t6.
(* level 1 *) (* [loc(zeta1k)..loc(r0l)] - (loc(zeta1k)-loc(r0a)-1) *)
swap{1} [47..56] -35.
seq 21 1: (CS2P [r0a;r1a;r2a;r3a;r4a;r5a;r6a;r7a;r0l;r1l;r2l;r3l;r4l;r5l;r6l;r7l]{1} = rp1{2}).
 by inline *; auto.
(* level 2 *) (* [loc(zeta1m)..loc(r0n)] - (loc(zeta1m)-loc(r0c)-1) *)
swap{1} [36..41] -29.
seq 12 1: (CS2P [r0c;r4c;r1c;r5c;r2c;r6c;r3c;r7c;r0n;r4n;r1n;r5n;r2n;r6n;r3n;r7n]{1} = rp2{2}).
 by inline *; auto => /> *; rewrite !P2C_i.
(* level 3 *) (* [loc(zeta1o)..loc(r0p)] - (loc(zeta1o)-loc(r0e)-1) *)
swap{1} [30..35] -23.
seq 12 1: (CS2P [r0e;r2e;r4e;r6e;r1e;r3e;r5e;r7e;r0p;r2p;r4p;r6p;r1p;r3p;r5p;r7p]{1} = rp3{2}).
 by inline *; auto => /> *; rewrite !P2C_i.
(* level 4 *) (* [loc(zeta1q)..loc(r0r)] - (loc(zeta1q)-loc(r0g)-1) *)
swap{1} [24..29] -17.
seq 12 1: (CS2P [r0g;r1g;r2g;r3g;r4g;r5g;r6g;r7g;r0r;r1r;r2r;r3r;r4r;r5r;r6r;r7r]{1} = rp4{2}).
 by inline *; auto => /> *; rewrite !P2C_i.
(* level 5 *) (* [loc(zeta1s)..loc(r0t)] - (loc(zeta1s)-loc(r0i)-1) *)
swap{1} [18..23] -11.
seq 12 1: (CS2P [r0i;r4i;r1i;r5i;r2i;r6i;r3i;r7i;r0t;r4t;r1t;r5t;r2t;r6t;r3t;r7t]{1} = rp5{2}).
 by inline *; auto => /> *; rewrite !P2C_i.
(* level 6 *) (* [loc(zeta2t)..loc(r0u)] - (loc(zeta2t)-loc(r0j)-1) *)
swap{1} [12..14] -8.
seq 6 1: (CS2P [r0j;r4j;r1j;r5j;r2j;r6j;r3j;r7j;r0u;r4u;r1u;r5u;r2u;r6u;r3u;r7u]{1} = rp6{2}).
 by inline *; auto => /> *; rewrite !P2C_i.
(* return *)
inline *; auto => /> &1.
by rewrite (P2CS rp{1}) !PUC_i.
qed.

op perm_level2 : int list =
  [0;1;2;3;4;5;6;7;16;17;18;19;20;21;22;23;32;33;34;35;36;37;38;39;48;49;50;51;52;53;54;55;64;65;66;67;68;69;70;71;80;81;82;83;84;85;86;87;96;97;98;99;100;101;102;103;112;113;114;115;116;117;118;119;8;9;10;11;12;13;14;15;24;25;26;27;28;29;30;31;40;41;42;43;44;45;46;47;56;57;58;59;60;61;62;63;72;73;74;75;76;77;78;79;88;89;90;91;92;93;94;95;104;105;106;107;108;109;110;111;120;121;122;123;124;125;126;127] axiomatized by perm_level2E.

op perm_level3 : int list =
  [0;1;2;3;16;17;18;19;32;33;34;35;48;49;50;51;64;65;66;67;80;81;82;83;96;97;98;99;112;113;114;115;4;5;6;7;20;21;22;23;36;37;38;39;52;53;54;55;68;69;70;71;84;85;86;87;100;101;102;103;116;117;118;119;8;9;10;11;24;25;26;27;40;41;42;43;56;57;58;59;72;73;74;75;88;89;90;91;104;105;106;107;120;121;122;123;12;13;14;15;28;29;30;31;44;45;46;47;60;61;62;63;76;77;78;79;92;93;94;95;108;109;110;111;124;125;126;127] axiomatized by perm_level3E.

op perm_level4 : int list =
  [0;1;16;17;32;33;48;49;64;65;80;81;96;97;112;113;2;3;18;19;34;35;50;51;66;67;82;83;98;99;114;115;4;5;20;21;36;37;52;53;68;69;84;85;100;101;116;117;6;7;22;23;38;39;54;55;70;71;86;87;102;103;118;119;8;9;24;25;40;41;56;57;72;73;88;89;104;105;120;121;10;11;26;27;42;43;58;59;74;75;90;91;106;107;122;123;12;13;28;29;44;45;60;61;76;77;92;93;108;109;124;125;14;15;30;31;46;47;62;63;78;79;94;95;110;111;126;127] axiomatized by perm_level4E.

op perm_level5 : int list =
  [0;16;32;48;64;80;96;112;1;17;33;49;65;81;97;113;2;18;34;50;66;82;98;114;3;19;35;51;67;83;99;115;4;20;36;52;68;84;100;116;5;21;37;53;69;85;101;117;6;22;38;54;70;86;102;118;7;23;39;55;71;87;103;119;8;24;40;56;72;88;104;120;9;25;41;57;73;89;105;121;10;26;42;58;74;90;106;122;11;27;43;59;75;91;107;123;12;28;44;60;76;92;108;124;13;29;45;61;77;93;109;125;14;30;46;62;78;94;110;126;15;31;47;63;79;95;111;127] axiomatized by perm_level5E.

lemma ntt_avx_0_ll : islossless NTT_AVX.__ntt_level0 by islossless.
lemma ntt_avx_1_ll : islossless NTT_AVX.__ntt_level1 by islossless.
lemma ntt_avx_2_ll : islossless NTT_AVX.__ntt_level2 by islossless.
lemma ntt_avx_3_ll : islossless NTT_AVX.__ntt_level3 by islossless.
lemma ntt_avx_4_ll : islossless NTT_AVX.__ntt_level4 by islossless.
lemma ntt_avx_5_ll : islossless NTT_AVX.__ntt_level5 by islossless.
lemma ntt_avx_6_ll : islossless NTT_AVX.__ntt_level6 by islossless.

hoare ntt_avx_0 r:
  NTT_AVX.__ntt_level0 : rp = r ==> res = r_avx2_ntt NTT_Fq.zetas r 0.
proof.
proc; inline *; wp; auto => /> /=.
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />. 
apply tP_red => i /=.
do 255! (move => Hi; case Hi; first done).
by move=> ->; rewrite !initiE.
qed.

lemma ntt_avx_0_pr r:
  phoare [NTT_AVX.__ntt_level0 : rp = r ==> res = r_avx2_ntt NTT_Fq.zetas r 0] = 1%r.
proof. conseq ntt_avx_0_ll (ntt_avx_0 r) => />. qed.

hoare ntt_avx_1 r:
  NTT_AVX.__ntt_level1 : rp = r ==> res = r_avx2_ntt NTT_Fq.zetas r 1.
proof.
proc; inline *; wp; auto => />.
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red => i /=.
do 255! (move => Hi; case Hi; first done).
by move=> ->; rewrite !initiE.
qed.

lemma ntt_avx_1_pr r:
  phoare [NTT_AVX.__ntt_level1 : rp = r ==> res = r_avx2_ntt NTT_Fq.zetas r 1] = 1%r.
conseq ntt_avx_1_ll (ntt_avx_1 r) => />. qed.


hoare ntt_avx_2 r:
  NTT_AVX.__ntt_level2 : rp = r ==> perm_ntt perm_level2 res = r_avx2_ntt NTT_Fq.zetas r 2.
proof.
proc; inline *; wp; auto => />.
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red => i /=.
do 255! (move => [->|];
first by (rewrite /perm_ntt /perm_level2 initiE 1:// /= /CS2P initiE 1:// /= !shuffle8E /P2C /pchunk /=)).
by move=> ->; rewrite !perm_level2E !shuffle8E !initiE.
qed.

lemma ntt_avx_2_pr r:
  phoare [NTT_AVX.__ntt_level2 : rp = r ==> perm_ntt perm_level2 res = r_avx2_ntt NTT_Fq.zetas r 2] = 1%r.
conseq ntt_avx_2_ll (ntt_avx_2 r) => />. qed.

hoare ntt_avx_3 r:
  NTT_AVX.__ntt_level3 : perm_ntt perm_level2 rp = r ==> perm_ntt perm_level3 res = r_avx2_ntt NTT_Fq.zetas r 3.
proof.
proc; inline *; wp; auto => /> &1. 
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red => i /=.
do 255! (move => [->|];
first by (rewrite /perm_ntt /perm_level2 /perm_level3 initiE 1:// /= /CS2P initiE 1:// /= !shuffle4E /P2C /pchunk /=)).
by move=> ->; rewrite /perm_level2 /perm_level3 !shuffle4E !initiE.
qed.

lemma ntt_avx_3_pr r:
  phoare [NTT_AVX.__ntt_level3 : perm_ntt perm_level2 rp = r ==> perm_ntt perm_level3 res = r_avx2_ntt NTT_Fq.zetas r 3] = 1%r.
conseq ntt_avx_3_ll (ntt_avx_3 r) => />. qed.

hoare ntt_avx_4 r:
  NTT_AVX.__ntt_level4 : perm_ntt perm_level3 rp = r ==> perm_ntt perm_level4 res = r_avx2_ntt NTT_Fq.zetas r 4.
proof.
proc; inline *; wp; auto => /> &1. 
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red => i /=.
do 255! (move => [->|];
first by (rewrite /perm_ntt /perm_level3 /perm_level4 initiE 1:// /= /CS2P initiE 1:// /= /shuffle2 /P2C /pchunk /=)).
by move=> ->; rewrite /perm_level3 /perm_level4 /shuffle2 !initiE.
qed.

lemma ntt_avx_4_pr r:
  phoare [NTT_AVX.__ntt_level4 : perm_ntt perm_level3 rp = r ==> perm_ntt perm_level4 res = r_avx2_ntt NTT_Fq.zetas r 4] = 1%r.
conseq ntt_avx_4_ll (ntt_avx_4 r) => />. qed.

hoare ntt_avx_5 r:
  NTT_AVX.__ntt_level5 : perm_ntt perm_level4 rp = r ==> perm_ntt perm_level5 res = r_avx2_ntt NTT_Fq.zetas r 5.
proof.
proc; inline *; wp; auto => /> &1. 
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red => i /=.
do 255! (move => [->|];
first by (rewrite /perm_ntt /perm_level4 /perm_level5 initiE 1:// /= /CS2P initiE 1:// /= /shuffle1 /P2C /pchunk /=)).
by move=> ->; rewrite /perm_level4 /perm_level5 /shuffle1 !initiE.
qed.

lemma ntt_avx_5_pr r:
  phoare [NTT_AVX.__ntt_level5 : perm_ntt perm_level4 rp = r ==> perm_ntt perm_level5 res = r_avx2_ntt NTT_Fq.zetas r 5] = 1%r.
conseq ntt_avx_5_ll (ntt_avx_5 r) => />. qed.

hoare ntt_avx_6 r:
  NTT_AVX.__ntt_level6 : perm_ntt perm_level5 rp = r ==> perm_ntt perm_nttpack128 res = r_avx2_ntt NTT_Fq.zetas r 6.
proof.
proc; inline *; wp; auto => /> &1. 
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red => i /=.
do 255! (move => [->|];
first by (rewrite /perm_ntt /perm_level5 /perm_nttpack128 initiE 1:// /= /CS2P initiE 1:// /= /P2C /pchunk /=)).
by move=> ->; rewrite /perm_level5 /perm_nttpack128 !initiE.
qed.

lemma ntt_avx_6_pr r:
  phoare [NTT_AVX.__ntt_level6 : perm_ntt perm_level5 rp = r ==> perm_ntt perm_nttpack128 res = r_avx2_ntt NTT_Fq.zetas r 6] = 1%r.
conseq ntt_avx_6_ll (ntt_avx_6 r) => />. qed.

(** Main Theorem in this module: abstract Fq-based AVX implementation and original NTT specification are equivalent **)
lemma ntt_avx_equiv : 
     equiv [ NTT_AVX.ntt ~ NTT_avx2.ntt :
          r{1} = NTT_avx2.r{2} /\ NTT_avx2.zetas{2} = NTT_Fq.zetas 
          ==> perm_ntt perm_nttpack128 res{1} = res{2}].
proc*.
transitivity{1} { r0 <@ NTT_AVX.ntt0t6(r); }
  (={r,zetas} ==> ={r0})
  (r{1} = NTT_avx2.r{2} /\ NTT_avx2.zetas{2}=NTT_Fq.zetas  ==> perm_ntt perm_nttpack128 r0{1}=r{2}) => //.
  by move => /> &1 &2 /#. 
call ntt0t6_ntt. auto => />.
inline NTT_AVX.ntt0t6 NTT_avx2.ntt.
(*level 0*)
rcondt{2} 2; auto => />.
seq 2 3 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ rp0{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=1 ).
ecall {1} (ntt_avx_0_pr r1{1}).
 by auto => /> *; rewrite from_to_arrays16.
(*level 1*)
exlim NTT_avx2.r{2} => r0.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ rp1{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=2 ).
 by ecall {1} (ntt_avx_1_pr r0); auto.
(*level 2*)
exlim NTT_avx2.r{2} => r1.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ perm_ntt perm_level2 rp2{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=3 ).
 by call{1} (ntt_avx_2_pr r1); auto.
(*level 3*)
exlim NTT_avx2.r{2} => r2.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ perm_ntt perm_level3 rp3{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=4 ).
 by call{1} (ntt_avx_3_pr r2); auto.
(*level 4*)
exlim NTT_avx2.r{2} => r3.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ perm_ntt perm_level4 rp4{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=5 ).
 by call{1} (ntt_avx_4_pr r3); auto.
(*level 5*)
exlim NTT_avx2.r{2} => r4.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ perm_ntt perm_level5 rp5{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=6 ).
 by call{1} (ntt_avx_5_pr r4); auto.
(*level 6*)
exlim NTT_avx2.r{2} => r5.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ perm_ntt perm_nttpack128 rp6{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=7 ).
 by call{1} (ntt_avx_6_pr r5); auto.
(*exit*)
rcondf{2} 1; auto => />.
qed.

