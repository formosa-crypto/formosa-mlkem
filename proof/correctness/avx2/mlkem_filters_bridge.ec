require import AllCore List.
from Jasmin require import JModel_x86.
from JazzEC require import Array32 Array536 Array2048.

from CryptoSpecs require import Correctness.
from JazzEC require import Jkem_avx2 (* Mlkem_filter48 *).

abbrev bufl (buf: W8.t Array536.t) = to_list buf.

op buf_subl (buf: W8.t Array536.t) (first last: int): W8.t list =
 take (last-first) (drop first (bufl buf)).

lemma buf_subl0 buf s e:
 (e <= s)%Int =>
 buf_subl buf s e = [].
proof. by rewrite /buf_subl /#. qed.

lemma size_buf_subl buf bstart bend:
 0 <= bstart <= bend <= 536 =>
 size (buf_subl buf bstart bend) = bend - bstart.
proof.
by move=> H; rewrite size_take 1:/# size_drop 1:/# size_to_list /#.
qed.

lemma buf_sublE buf (i j: int):
 0 <= i <= j <= 536 =>
 buf_subl buf i j = sub buf i (j-i).
proof.
move=> H; rewrite /buf_subl /sub.
apply (eq_from_nth witness).
 by rewrite size_take 1:/# size_drop 1:/# !size_mkseq /#.
move=> k.
rewrite size_take 1:/# size_drop 1:/# size_to_list => Hk.
by rewrite nth_take 1..2:/# nth_drop 1..2:/# !nth_mkseq /#.
qed.

lemma sub2buf_subl (buf: W8.t Array536.t) (k len: int):
 0 <= k <= k+len <= 536 =>
 sub buf k len = buf_subl buf k (k+len).
proof.
move=> H; rewrite /buf_subl /sub.
apply (eq_from_nth witness).
 rewrite size_take 1:/# size_drop 1:/# !size_mkseq /#.
move=> i; rewrite size_mkseq => Hi.
by rewrite nth_take 1..2:/# nth_drop 1..2:/# !nth_mkseq /#.
qed.

lemma buf_subl_cat buf (o k n:int):
 0 <= o <= k <= n =>
 buf_subl buf o  k ++ buf_subl buf k n = buf_subl buf o n.
proof.
move=> H; rewrite /buf_subl /=.
rewrite -(cat_take_drop (k-o) (take (n-o) _)).
rewrite take_take ifT 1:/#; congr.
rewrite drop_take 1,2:/#; congr; first smt().
by rewrite drop_drop /#.
qed.

lemma buf_subl_sub buf o k n l:
 0 <= o <= k <= n =>
 buf_subl buf o n = l =>
 buf_subl buf o k = take (k-o) l.
proof.
move=> H; rewrite /buf_subl => <-.
by rewrite take_take ifT 1:/#.
qed.

op auxdata_ok (load_shuffle mask bounds ones: W256.t)
              (sst:  W8.t Array2048.t) : bool =
 load_shuffle = W32u8.pack32 (to_list Jkem_avx2.sample_load_shuffle)
 /\ mask = Jkem_avx2.sample_mask
 /\ bounds = Jkem_avx2.sample_q
 /\ ones = Jkem_avx2.sample_ones
 /\ sst = Jkem_avx2.sample_shuffle_table.

from JazzEC require import WArray512 Array40 Array256 Array56 WArray536 WArray2048.
require import IntDiv.

require import Mlkem_filter48_bindings.
require import Mlkem_filter48.

lemma vmov64_ext_256 b :
  zeroextu256 (VMOV_64 b) = zextend_64_256 b.
proof.
rewrite /VMOV_64 zeroextu256E /=. 
rewrite -(W2u64.unpack64K W128.zero)  unpack64E.
pose c := W2u128.pack2_t _.
have -> : c = W4u64.zeroextu256 b
  by rewrite /c zeroextu256E !init_of_list -!iotaredE /= !get_zero. 
by rewrite to_uint_eq to_uint_zeroextu256 BVA_zextend_Top_JWord_W64_t_Top_JWord_W256_t.bvzextendP . 
qed.

lemma vmov64_ext_128 b :
  VMOV_64 b = zextend_64_128 b.
proof.
rewrite /VMOV_64. 
pose c := W2u64.pack2_t _.
have -> : c = W2u64.zeroextu128 b
  by rewrite /c zeroextu128E !init_of_list -!iotaredE /=.
by rewrite to_uint_eq to_uint_zeroextu128 -BVA_zextend_Top_JWord_W64_t_Top_JWord_W128_t.bvzextendP . 
qed.

lemma sliceget_8_64_2048_get64 a i :
 0 <= i < 256 =>
 get64 ((WArray2048.init8 (Array2048."_.[_]" a))) i =
    sliceget_8_64_2048 a (64 * i).
proof. 
move => ib.
    rewrite /sliceget_8_64_2048 get64E /pack8_t. 
    rewrite -{1}W8u8.unpack8K.
    rewrite -(W8u8.unpack8K 
         (W64.init (fun (j : int) => a.[(64 * i + j) %/ 8].[(64 * i + j) %% 8]))).
    congr;apply W8u8.Pack.ext_eq => k kb.
    rewrite !unpack8E !initiE 1,2:/# /=;congr.
    apply W64.init_ext => x xb /=;congr. 
    do 2!(rewrite initiE 1:/# /=);  smt(W64.to_uint_cmp). 
    by  smt(W64.to_uint_cmp).
qed.

lemma poprng w : W64.to_uint w < 256 => 0 <= to_uint (POPCNT_64 w).`6 <= 8.
move => H.
rewrite /POPCNT_64 /flags_w /rflags_of_popcnt /= !of_uintK /=.
split => *;1:smt().
rewrite modz_small;1: smt(count_ge0 count_size W64.size_w2bits pow2_64).
rewrite -(cat_take_drop 8) count_cat.
have [->] := (count_eq0 idfun (drop 8 (w2bits w))).
+ rewrite -all_predC /predC /idfun /=; apply (all_nthP _ _ false).
  move => i; rewrite size_drop 1://   size_w2bits /max /= => ib.
  rewrite nth_drop 1,2:/# get_w2bits -b2i_eq0 b2i_get 1:/#.
  have : 256 <= 2 ^ (8 + i); last by smt(W64.to_uint_cmp).
  by  smt(pow2_8 StdOrder.IntOrder.ler_weexpn2r ).

move => /= *.
smt(count_size size_take W64.size_w2bits).
qed.

lemma get_below (_p : W16.t Array256.t) i _ctr v :
   0 <= _ctr <= 256 - 8 =>
   0 <= i < _ctr =>
 (((init
    (fun (i0 : int) =>
       get16
         (set128_direct ((init16 ("_.[_]" _p)))%WArray512 (2 * _ctr) v)
         i0))))%Array256.[i] =
_p.[i].
proof. 
    move => *.
    rewrite initiE 1:/# /=.
    rewrite wordP => k kb.
    rewrite /get16_direct /set128_direct /pack2_t.
    rewrite initiE 1:/# /=.
    rewrite initiE 1:/# /=.
    rewrite initiE 1:/# /=.
    rewrite initiE 1:/# /=.
    rewrite ifF;1:smt().
    rewrite bits8_div 1:/# /=. 
    have -> : (2 * i + k %/ 8) %/ 2 = i by smt().
    have -> : 8 * ((2 * i + k %/ 8) %% 2) = if 8 <= k then 8 else 0 by smt().
    case (8 <= k) => /= *. 
    + rewrite of_intwE /= /int_bit /= (modz_small _ 256);1: smt(W16.to_uint_cmp pow2_16).
      rewrite -divz_mulp 1:/#; 1:smt(StdOrder.IntOrder.expr_gt0).
      rewrite -pow2_8 -exprD_nneg 1,2:/# -b2i_get 1,2:/#. 
    rewrite of_intwE /= /int_bit dvdz_mod_div 1:/#; 1,2:smt(StdOrder.IntOrder.expr_gt0 @IntDiv pow2_8).
    have -> : 256 %/ 2 ^ (k %% 8) = 2^(8 - k%%8) by rewrite -pow2_8 expz_div 1,2:/#.    have /= ->:= modz_mod_pow2 (to_uint _p.[i] %/ 2 ^ (k %% 8)) (8 - k%%8) 1.
    have -> /= : min (`|8 - k %% 8|) (`|1|) = 1;1: by smt().
    by smt(W16.b2i_get).
qed.

lemma get_in  (_p : W16.t Array256.t) i _ctr v k :
   0 <= k < 16 =>
   0 <=_ctr <= 256 - 8 =>
    _ctr <= i < _ctr+8 =>
((init
    (fun (i0 : int) =>
       get16 (set128_direct ((init16 ("_.[_]" _p)))%WArray512 (2 * _ctr) v) i0)))%Array256.[i].[k] = 
   v.[(i-_ctr)*16 + k].
move => *.
    rewrite initiE 1:/# /=.
    rewrite /get16_direct /set128_direct /pack2_t.
    rewrite initiE 1:/# /=.
    rewrite initiE 1:/# /=.
    rewrite initiE 1:/# /=.
    rewrite initiE 1:/# /=.
    rewrite ifT;1:smt().
    rewrite bits8_div 1:/# /=.
    rewrite of_intwE /= /int_bit /=.
    have -> : (8 * (2 * i + k %/ 8 - 2 * _ctr)) = if 8 <= k 
        then (i - _ctr) * 16 + 8 else (i - _ctr) * 16 by smt().
    case (8 <= k) => /= *.
    + rewrite dvdz_mod_div 1:/#; 1,2:smt(StdOrder.IntOrder.expr_gt0 @IntDiv pow2_8).
      rewrite -divz_mulp; 1,2:smt(StdOrder.IntOrder.expr_gt0).
      rewrite -exprD_nneg 1,2:/#.
       have -> : 256 %/ 2 ^ (k %% 8) = 2^(8 - k%%8) by rewrite -pow2_8 expz_div 1,2:/#.
      have /= ->:= modz_mod_pow2 (to_uint v %/ 2 ^ ((i - _ctr) * 16 + 8 + k %% 8)) (8 - k%%8) 1. 
      have -> /=: min (`|8 - k %% 8|) (`|1|) = 1 by smt().
      by smt(W128.b2i_get).
    rewrite dvdz_mod_div 1:/#; 1,2:smt(StdOrder.IntOrder.expr_gt0 @IntDiv pow2_8).
    rewrite -divz_mulp; 1,2:smt(StdOrder.IntOrder.expr_gt0).
    have -> : 256 %/ 2 ^ (k %% 8) = 2^(8 - k%%8) by rewrite -pow2_8 expz_div 1,2:/#.
    have <- := (Ring.IntID.exprD_nneg 2 ((i - _ctr) * 16) (k %% 8));1,2:smt().
    have /= ->:= modz_mod_pow2 (to_uint v %/ 2 ^ ((i - _ctr) * 16 + k %% 8)) (8 - k%%8) 1. 
     have -> /=: min (`|8 - k %% 8|) (`|1|) = 1 by smt().
     by smt(W128.b2i_get).
qed.

lemma eq_low i1 i2 i (p1 p2 : W16.t Array256.t) (a : W16.t Array40.t) : 
   0 <= i1 => 0 <= i2 => i1+i2 <= 256 => 0 <= i < i1 =>
plist p1 (i1 + i2) =
   plist p2 i1 ++ mkseq ("_.[_]" a) i2 =>
  p1.[i] = p2.[i].
proof.
move => ?????.
have : nth witness (plist p1 (i1 + i2)) i = nth witness (plist p2 i1 ++ mkseq ("_.[_]" a) i2) i by smt().
rewrite /plist !nth_mkseq 1:/# => ->.
rewrite (nth_cat witness)  ifT; 1: smt(size_mkseq).
smt(nth_mkseq).
qed.

lemma eq_high i1 i2 i (p1 p2 : W16.t Array256.t) (a : W16.t Array40.t) : 
   0 <= i1 => 0 <= i2 => i1+i2 <= 256 => i1 <= i < i1+i2 =>
plist p1 (i1 + i2) =
   plist p2 i1 ++ mkseq ("_.[_]" a) i2 =>
  p1.[i] = a.[i-i1].
proof.
move => ?????.
have : nth witness (plist p1 (i1 + i2)) i = nth witness (plist p2 i1 ++ mkseq ("_.[_]" a) i2) i by smt().
rewrite /plist !nth_mkseq 1:/# => ->.
rewrite (nth_cat witness)  ifF; 1: smt(size_mkseq).
smt(nth_mkseq size_mkseq).
qed.

lemma bridge48 _ctr _offset _p : 
equiv [
Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter48 ~ Filter48.filter48 : 
  pol{1} = _p
/\  0 <= _offset /\  _offset + 56 <= 536 
/\  0 <= _ctr /\ _ctr + 32 <= 256 
/\  to_uint buf_offset{1} = _offset 
/\ to_uint  counter{1} = _ctr 
/\ bounds{1} = Mlkem_filter48.sample_q
/\ load_shuffle{1} = Mlkem_filter48.load_shuffle 
/\ mask{1} = Mlkem_filter48.sample_mask
/\ sst{1} = Mlkem_filter48.sample_shuffle_table 
/\ ones{1} = Mlkem_filter48.sample_ones
/\ (forall k, 0 <= k < 56 => buf{1}.[to_uint buf_offset{1} + k] = 
                   buf{2}.[k]) ==> 
  0 <= _offset /\  _offset + 56 <= 536 
/\  0 <= _ctr /\ _ctr + 32 <= 256 
/\ plist (res{1}.`1) (_ctr + to_uint res{2}.`2) =
plist _p _ctr ++ mkseq (Array40."_.[_]" res{2}.`1) (to_uint res{2}.`2) 
/\  to_uint res{1}.`2 = to_uint res{2}.`2 + _ctr
].
proc => /=.
seq 2 2 : (#pre /\ ={f0,f1}).
+ auto => /> &1 &2 *;split;congr;rewrite /sliceget_8_256_56 /=;
  (rewrite get256E -(W32u8.unpack8K (W256.init _));
  congr;apply W32u8.Pack.ext_eq => x xb;
  rewrite initiE 1:/# /= initiE;1:smt(W64.to_uint_cmp);
  rewrite wordP => k kb;
  by rewrite get_unpack8 1:/# /(\bits8) initiE 1:/# /= initiE 1:/# /= /#).
seq 15 14 : (#pre /\ ={good, t0_0} /\ to_uint t0_0{1} < 256).
+ auto => /> &1 &2 *;rewrite /protect_64 /=.
  have -> : 255 = 2^8 - 1 by auto. 
  by rewrite and_mod 1:/# /= of_uintK /=; smt(W64.to_uint_cmp pow2_64 modz_small).

seq 29 29 : (#{/~t0_0{1}}pre 
   /\ t0_0{1} = t0_0{2} + counter{1} 
   /\ t0_1{1} = t0_1{2} + counter{1} 
   /\ t1_0{1} = t1_0{2} + counter{1} 
   /\ t1_1{1} = t1_1{2} + counter{1} 
   /\ to_uint t0_0{2} <= 8 
   /\ to_uint t0_0{2} <= to_uint t0_1{2} <= to_uint t0_0{2} + 8 
   /\ to_uint t0_1{2} <=  to_uint t1_0{2} <= to_uint t0_1{2} + 8
   /\ to_uint t1_0{2} <= to_uint t1_1{2} <= to_uint t1_0{2} + 8 ).
auto => /> &1 &2 *;do split.
+ congr;congr;congr.
  + by rewrite vmov64_ext_256  sliceget_8_64_2048_get64;smt(W64.to_uint_cmp). 
  + by rewrite vmov64_ext_128  sliceget_8_64_2048_get64;1: by  
    rewrite (_: 255 = 2^8 - 1) 1://= !and_mod 1:/# /= /(`>>`) !to_uint_shr /=;[ by done | by rewrite !of_uintK /= /#].
  + rewrite vmov64_ext_256  vmov64_ext_128 sliceget_8_64_2048_get64;1:smt(W64.to_uint_cmp). 
    rewrite sliceget_8_64_2048_get64;1: rewrite (_: 255 = 2^8 - 1) 1://= !and_mod 1:/# /= /(`>>`) !to_uint_shr /=; [  by done | by rewrite !of_uintK /= /# | by done].
  + rewrite vmov64_ext_256  vmov64_ext_128.
    rewrite sliceget_8_64_2048_get64;1: rewrite (_: 255 = 2^8 - 1) 1://= !and_mod 1:/# /= /(`>>`) !to_uint_shr /=; [  by done | by rewrite !of_uintK /= /# | ].
    rewrite sliceget_8_64_2048_get64;1: rewrite (_: 255 = 2^8 - 1) 1://= !and_mod 1:/# /= /(`>>`) !to_uint_shr /=; [  by done | by rewrite !of_uintK /= /# | by done ].
  + by rewrite (_: 255 = 2^8 - 1) 1://= !and_mod 1:/# /= /(`>>`) !to_uint_shr /=;[ by done | by ring].
  + rewrite (_: 255 = 2^8 - 1) 1://= !and_mod 1,2:/# /= /(`>>`) !to_uint_shr /=;[ by done | by done | by ring]. 
  + rewrite (_: 255 = 2^8 - 1) 1://= !and_mod 1..3:/# /= /(`>>`) !to_uint_shr /=;[ by done | by done | by done | by ring].
  + smt(poprng). 
  + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
    by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
  + move => *. 
    have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
    by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
  + move => *. 
    rewrite !to_uintD_small /= .   
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
  + move => *. 
    rewrite !to_uintD_small /= .   
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
  + move => *. 
    rewrite !to_uintD_small /= .   
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 24)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 24)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
  + move => *. 
    rewrite !to_uintD_small /= .   
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 24)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 24)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      

wp 4 4;conseq (: _ ==> plist pol{1} (_ctr + to_uint t1_1{2}) = plist _p _ctr ++ mkseq ("_.[_]" out{2}) (to_uint t1_1{2})).
+ auto => /> *; rewrite to_uintD_small /=;smt(W64.to_uint_cmp pow2_64). 

seq 1 1 : (#{/~pol{1} = _p}pre /\ plist pol{1} (_ctr + to_uint t0_0{2}) = plist _p _ctr ++ mkseq ("_.[_]" out{2}) (to_uint t0_0{2})).
+ auto => /> &1 &2 *.
  rewrite /plist;apply (eq_from_nth witness). 
  + rewrite size_cat !size_mkseq;smt(W64.to_uint_cmp).
  move => i ib;rewrite nth_cat !size_mkseq.
  case (i < to_uint counter{1}) => *.
  + rewrite ifT 1:/#.
    rewrite !nth_mkseq; 1,2:smt(W64.to_uint_cmp).
    rewrite !to_uintM_small /=; 1:smt(W64.to_uint_cmp). 
    by rewrite get_below /#.
  + rewrite ifF 1:/#.
    rewrite !nth_mkseq;1,2: smt(W64.to_uint_cmp size_mkseq).
    rewrite !to_uintM_small /=; 1:smt(W64.to_uint_cmp). 
    rewrite wordP => k kb.
    rewrite get_in; 1..3:smt(W64.to_uint_cmp size_mkseq).
    rewrite /sliceset_16_128_40.
    rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
    rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
    rewrite ifT /=;1:smt(W64.to_uint_cmp size_mkseq).
    rewrite /extract_256_128 -get_w2bits -Bindings.BVA_truncate_Top_JWord_W256_t_Top_JWord_W128_t.bvtruncateP . 
    rewrite nth_take;1,2:smt(W64.to_uint_cmp size_mkseq).
    by rewrite initiE /=;smt(W64.to_uint_cmp size_mkseq).

seq 1 1 : (#{/~plist pol{1} (_ctr + to_uint t0_0{2}) = plist _p _ctr ++ mkseq ("_.[_]" out{2}) (to_uint t0_0{2})}pre /\ plist pol{1} (_ctr + to_uint t0_1{2}) = plist _p _ctr ++ mkseq ("_.[_]" out{2}) (to_uint t0_1{2})).
+ auto => /> &1 &2 12? H.
  rewrite /plist;apply (eq_from_nth witness). 
  + rewrite size_cat !size_mkseq;smt(W64.to_uint_cmp).
  move => i ib;rewrite nth_cat !size_mkseq.
  case (i < to_uint counter{1}) => *.
  + rewrite ifT 1:/#.
    rewrite !nth_mkseq; 1,2:smt(W64.to_uint_cmp).
    rewrite !to_uintM_small !to_uintD_small /=; 1..3:smt( W64.to_uint_cmp). 
    rewrite get_below;1..2: smt(W64.to_uint_cmp).
    by apply (eq_low (to_uint counter{1}) (to_uint t0_0{2}) i pol{1} _p out{2});smt(W64.to_uint_cmp).

  + rewrite ifF 1:/#.
    case (i < to_uint counter{1} + to_uint t0_0{2}) => *.
    + rewrite !nth_mkseq; 1,2:smt(W64.to_uint_cmp).
      rewrite !to_uintM_small !to_uintD_small /=; 1..3:smt( W64.to_uint_cmp). 
      rewrite get_below;1..2: smt(W64.to_uint_cmp).
      rewrite /sliceset_16_128_40.
      rewrite wordP => k kb.
      rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
      rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
      rewrite ifF /=;1:smt(W64.to_uint_cmp size_mkseq).
      congr; have -> :  i - max 0 (to_uint counter{1}) = i - to_uint counter{1}; 1:by smt(W64.to_uint_cmp).
      apply (eq_high (to_uint counter{1}) (to_uint t0_0{2}) i pol{1} _p  out{2}); smt(W64.to_uint_cmp).

  + rewrite !nth_mkseq;1,2: smt(W64.to_uint_cmp size_mkseq).
    rewrite !to_uintM_small !to_uintD_small /=;  1..3:smt(W64.to_uint_cmp). 
    rewrite wordP => k kb.
    rewrite get_in;1..2:  smt(W64.to_uint_cmp size_mkseq).
    by have ?: i < to_uint counter{1} + to_uint t0_1{2}; smt(size_mkseq).
    rewrite /sliceset_16_128_40.
    rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
    rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
    rewrite ifT /=;1:smt(W64.to_uint_cmp size_mkseq).
    rewrite /extract_256_128 /VEXTRACTI128 /= /b2i /= /(\bits128).
    rewrite !initiE /=;1..2:smt(W64.to_uint_cmp size_mkseq).
    by rewrite of_intwE /= /int_bit /= /#.

seq 1 1 : (#{/~plist pol{1} (_ctr + to_uint t0_1{2}) = plist _p _ctr ++ mkseq ("_.[_]" out{2}) (to_uint t0_1{2})}pre /\ plist pol{1} (_ctr + to_uint t1_0{2}) = plist _p _ctr ++ mkseq ("_.[_]" out{2}) (to_uint t1_0{2})).
+ auto => /> &1 &2 12? H.
  rewrite /plist;apply (eq_from_nth witness). 
  + rewrite size_cat !size_mkseq;smt(W64.to_uint_cmp).
  move => i ib;rewrite nth_cat !size_mkseq.
  case (i < to_uint counter{1}) => *.
  + rewrite ifT 1:/#.
    rewrite !nth_mkseq; 1,2:smt(W64.to_uint_cmp).
    rewrite !to_uintM_small !to_uintD_small /=; 1..3:smt( W64.to_uint_cmp). 
    rewrite get_below;1..2: smt(W64.to_uint_cmp).
    apply (eq_low (to_uint counter{1}) (to_uint t0_0{2}) i pol{1} _p out{2});1..4: smt(W64.to_uint_cmp size_mkseq). 
    move : H; rewrite /plist.
    have := mkseq_add ("_.[_]" out{2})  (to_uint t0_0{2}) (to_uint t0_1{2} - to_uint t0_0{2}) _ _;1,2:smt(W64.to_uint_cmp size_mkseq). 
    rewrite addrC -addrA /= => ->. 
    rewrite catA. 
    have -> : to_uint counter{1} + to_uint t0_1{2} = 
         (to_uint counter{1} + to_uint t0_0{2}) + (to_uint t0_1{2} - to_uint t0_0{2}) by ring.
    rewrite mkseq_add;1,2:smt(W64.to_uint_cmp size_mkseq).
    smt(@List).

  + rewrite ifF 1:/#.
    case (i < to_uint counter{1} + to_uint t0_1{2}) => *.
    + rewrite !nth_mkseq; 1,2:smt(W64.to_uint_cmp).
      rewrite !to_uintM_small !to_uintD_small /=; 1..3:smt( W64.to_uint_cmp). 
      rewrite get_below;1..2: smt(W64.to_uint_cmp).
      rewrite /sliceset_16_128_40.
      rewrite wordP => k kb.
      rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
      rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
      rewrite ifF /=;1:smt(W64.to_uint_cmp size_mkseq).
      congr; have -> :  i - max 0 (to_uint counter{1}) = i - to_uint counter{1}; 1:by smt(W64.to_uint_cmp).
      apply (eq_high (to_uint counter{1}) (to_uint t0_1{2}) i pol{1} _p  out{2}); smt(W64.to_uint_cmp).

  + rewrite !nth_mkseq;1,2: smt(W64.to_uint_cmp size_mkseq).
    rewrite !to_uintM_small !to_uintD_small /=;  1..3:smt(W64.to_uint_cmp). 
    rewrite wordP => k kb.
    rewrite get_in;1..2:  smt(W64.to_uint_cmp size_mkseq).
    by have ?: i < to_uint counter{1} + to_uint t1_0{2}; smt(size_mkseq).
    rewrite /sliceset_16_128_40.
    rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
    rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
    rewrite ifT /=;1:smt(W64.to_uint_cmp size_mkseq).
    rewrite /extract_256_128 -get_w2bits -Bindings.BVA_truncate_Top_JWord_W256_t_Top_JWord_W128_t.bvtruncateP . 
    rewrite nth_take;1,2:smt(W64.to_uint_cmp size_mkseq).
    by rewrite initiE /=;smt(W64.to_uint_cmp size_mkseq).

+ auto => /> &1 &2 12? H.
  rewrite /plist;apply (eq_from_nth witness). 
  + rewrite size_cat !size_mkseq;smt(W64.to_uint_cmp).
  move => i ib;rewrite nth_cat !size_mkseq.
  case (i < to_uint counter{1}) => *.
  + rewrite ifT 1:/#.
    rewrite !nth_mkseq; 1,2:smt(W64.to_uint_cmp).
    rewrite !to_uintM_small !to_uintD_small /=; 1..3:smt( W64.to_uint_cmp). 
    rewrite get_below;1..2: smt(W64.to_uint_cmp).
    apply (eq_low (to_uint counter{1}) (to_uint t0_1{2}) i pol{1} _p out{2});1..4: smt(W64.to_uint_cmp size_mkseq). 
    move : H; rewrite /plist.
    have := mkseq_add ("_.[_]" out{2})  (to_uint t0_1{2}) (to_uint t1_0{2} - to_uint t0_1{2}) _ _;1,2:smt(W64.to_uint_cmp size_mkseq). 
    rewrite addrC -addrA /= => ->. 
    rewrite catA. 
    have -> : to_uint counter{1} + to_uint t1_0{2} = 
         (to_uint counter{1} + to_uint t0_1{2}) + (to_uint t1_0{2} - to_uint t0_1{2}) by ring.
    rewrite mkseq_add;1,2:smt(W64.to_uint_cmp size_mkseq).
    smt(@List).

  + rewrite ifF 1:/#.
    case (i < to_uint counter{1} + to_uint t1_0{2}) => *.
    + rewrite !nth_mkseq; 1,2:smt(W64.to_uint_cmp).
      rewrite !to_uintM_small !to_uintD_small /=; 1..3:smt( W64.to_uint_cmp). 
      rewrite get_below;1..2: smt(W64.to_uint_cmp).
      rewrite /sliceset_16_128_40.
      rewrite wordP => k kb.
      rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
      rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
      rewrite ifF /=;1:smt(W64.to_uint_cmp size_mkseq).
      congr; have -> :  i - max 0 (to_uint counter{1}) = i - to_uint counter{1}; 1:by smt(W64.to_uint_cmp).
      apply (eq_high (to_uint counter{1}) (to_uint t1_0{2}) i pol{1} _p  out{2}); smt(W64.to_uint_cmp).

  + rewrite !nth_mkseq;1,2: smt(W64.to_uint_cmp size_mkseq).
    rewrite !to_uintM_small !to_uintD_small /=;  1..3:smt(W64.to_uint_cmp). 
    rewrite wordP => k kb.
    rewrite get_in;1..2:  smt(W64.to_uint_cmp size_mkseq).
    by have ?: i < to_uint counter{1} + to_uint t1_1{2}; smt(size_mkseq).
    rewrite /sliceset_16_128_40.
    rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
    rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
    rewrite ifT /=;1:smt(W64.to_uint_cmp size_mkseq).
    rewrite /extract_256_128 /VEXTRACTI128 /= /b2i /= /(\bits128).
    rewrite !initiE /=;1,2:smt(W64.to_uint_cmp size_mkseq).
    by rewrite of_intwE /= /int_bit /= /#.

qed.

import W12.
lemma buf_rejection_filter48_h _pol _ctr _buf _buf_offset:
hoare [
 Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter48
 :  counter = _ctr
   /\ W64.to_uint _buf_offset + 56 < 536
   /\  W64.to_uint _ctr <= 256-32 
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ auxdata_ok load_shuffle mask bounds ones sst
   ==>
   let l = rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint _buf_offset + 48))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ res.`2 = W64.of_int (to_uint _ctr + size l)].
proof. 
conseq  (bridge48 (to_uint _ctr) (to_uint _buf_offset) _pol)(filter48P (Array56.init (fun i => _buf.[to_uint _buf_offset+i]))).  
  + move => &1 [#] ??????;rewrite /auxdata_ok => [#] ->->->->->.
    exists ((Array56.init (fun (i : int) => _buf.[to_uint _buf_offset + i])), witness).
    auto => />; do split;1..6: smt(W64.to_uint_cmp). 
    + rewrite /Mlkem_filter48.load_shuffle /Mlkem_filter48.load_shuffle /u8_256_32.
      rewrite wordP => i ib;rewrite pack32wE 1:/# of_listK /= 1:/# initiE 1:/# /=;do      congr;rewrite /Mlkem_filter48.sample_load_shuffle.
      rewrite !get_of_list 1,2:/#. 
      by smt(@List).
  + by move => *; rewrite initiE /#. 
+ move => &1 &2 /=.
  rewrite /rejection16 /buf_subl /rejection /= -map_comp /(\o) /=.
  have -> : to_uint _buf_offset + 48 - to_uint _buf_offset = 48 by smt().
  move => [#] ???.
  pose xx := pmap _ _.
  pose yy := List.map _ _.
  have ? : map W12.to_uint xx = map W16.to_uint yy; last first.
  move => /= ? [# Hs1 Hs2] [# Hl1 Hl2] .
  split; last first. 
  + rewrite to_uint_eq Hs2 Hl2.
    rewrite of_uintK /= modz_small. 
  + rewrite /yy !size_map !size_filter /=; split; smt(@List take_oversize size_ge0 count_size size_filter size_bytes2coeffs W64.to_uint_cmp size_drop Array536.size_to_list).
    smt(size_map).
  + move :Hs1; rewrite Hl2.
    have ->: size xx = size yy by smt(size_map).
    move => ->.
    congr. 
    apply (eq_from_nth witness).
    + rewrite size_mkseq. smt(size_ge0).
    rewrite size_mkseq => i ib.
    rewrite nth_mkseq;1:smt(size_ge0).
    rewrite Hl1;1:smt(size_ge0 size_map).   
    rewrite to_uint_eq.
    rewrite -BVA_zextend_Top_Bindings_W12_t_Top_JWord_W16_t.bvzextendP.
    have : nth witness (map W12.to_uint xx) i  = nth witness (map W16.to_uint yy) i by smt().
    do 2!(rewrite (nth_map witness);1: smt(size_ge0 size_map)). 
    done.

(* THE MAIN LEMMA *)
rewrite /yy /bytes2coeffs.
have -> : BitEncoding.BitChunking.chunk 12 (JWordList.Bytes2Bits.bytes_to_bits (take 48 (drop (to_uint _buf_offset) (bufl _buf)))) =
    map W12.w2bits (map (fun i => sliceget_8_12_56 ((init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))%Array56 (12 * i)) (iota_ 0 32)); last first.

rewrite -map_comp -map_comp filter_map -map_comp.
rewrite /xx pmap_map -map_comp filter_map -map_comp /(\o) /preim /=.
apply (eq_from_nth witness).
+ rewrite !size_map !size_filter.
  elim (iota_ 0 32); 1: by auto.
  move => x l I.
  rewrite /= I;congr;congr.
  rewrite /predC1 W12.ultE /= /to_uint /#.
move => i ib.
congr.
elim (iota_ 0 32); 1: by auto.
move => x l.
pose F1 := (fun (x0 : int) =>
     to_uint
       (oget
          (if sliceget_8_12_56 ((init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))%Array56 (12 * x0) \ult
              (W12.of_int 3329) then
             Some (sliceget_8_12_56 ((init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))%Array56 (12 * x0))
           else None)%W12)).
pose P1 := (fun (x0 : int) =>
        predC1 None
          (if sliceget_8_12_56 ((init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))%Array56 (12 * x0) \ult
              (of_int 3329)%W12 then
             Some (sliceget_8_12_56 ((init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))%Array56 (12 * x0))
           else None)).
pose F2 := (fun (x0 : t) => to_uint ((of_int ((GFq.Zq.asint ((GFq.Zq.incoeff ((BitEncoding.BS2Int.bs2int (w2bits x0)))))))%GFq.Zq))%W16).
pose P2 := (fun (x0 : t) => (BitEncoding.BS2Int.bs2int (w2bits x0)) < GFq.q).
rewrite !filter_cons. 
case (P1 x) => /=.
+ move => HP1 ->.
  have HH /= : P2 (sliceget_8_12_56 ((init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))%Array56 (12 * x)).
    + move : HP1; rewrite /P1 /P2 /=.
    by rewrite /predC1 ultE /= /to_uint /#.
  rewrite HH /F1 /F2.
   rewrite /predC1 ultE /= GFq.Zq.incoeffK /=.
   pose a :=  (sliceget_8_12_56 ((init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))%Array56 (12 * x)).
  rewrite of_uintK /q /= modz_small 1:/# /to_uint /=.
  rewrite ifT 1:/# modz_small;smt(W12.to_uint_cmp).

+ move => HP1 ->.
  have HH /= : !P2 (sliceget_8_12_56 ((init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))%Array56 (12 * x)).
    + move : HP1; rewrite /P1 /P2 /=.
    by rewrite /predC1 ultE /= /to_uint /#.
  rewrite /= HH /F1 /F2 => />.

(* bit flipping *)
rewrite -map_comp.
have Hs : size
    ((BitEncoding.BitChunking.chunk 12 ((JWordList.Bytes2Bits.bytes_to_bits (take 48 (drop (to_uint _buf_offset) (bufl _buf))))))) = 32.
+ rewrite !size_map !size_iota /= /max /=.
  rewrite /bytes_to_bits size_flatten -map_comp /(\o). 
  rewrite StdBigop.Bigint.sumzE /to_list /= /mkseq -map_drop drop_iota;1: smt(W64.to_uint_cmp).
  by rewrite -map_take take_iota StdBigop.Bigint.BIA.big_map /(\o)  /= /predT /= -/predT StdBigop.Bigint.big_constz count_predT /= size_map size_iota /= /#. 

have Hs2 : size
    ((JWordList.Bytes2Bits.bytes_to_bits (take 48 (drop (to_uint _buf_offset) (bufl _buf))))) %/ 12 = 32.
  rewrite /bytes_to_bits size_flatten -map_comp /(\o).
  rewrite StdBigop.Bigint.sumzE /to_list /= /mkseq -map_drop drop_iota;1: smt(W64.to_uint_cmp).
  by rewrite -map_take take_iota StdBigop.Bigint.BIA.big_map /(\o)  /= /predT /= -/predT StdBigop.Bigint.big_constz count_predT /= size_map size_iota /= /#. 

apply (eq_from_nth witness);1: by rewrite Hs !size_map !size_iota /= /max /=.

rewrite Hs => i ib.
rewrite !(nth_map witness)/= /(\o) /=; 1,2: by smt(size_iota).
rewrite Hs2 nth_iota 1:/# /=.

have Hs3: 
size
      (take 12
         (drop (12 * i) ((JWordList.Bytes2Bits.bytes_to_bits (take 48 (drop (to_uint _buf_offset) (bufl _buf))))))) = 12 by smt(size_take size_drop).

apply (eq_from_nth witness);1: smt(W12.size_w2bits). 
rewrite Hs3;move => k kb.
rewrite nth_take 1,2:/# nth_drop 1,2:/# /w2bits nth_mkseq 1:/# /=.
rewrite /bytes_to_bits /sliceget_8_12_56 initiE 1:/# /= initiE 1:/# /=.
have -> := BitEncoding.BitChunking.nth_flatten witness 8 (map W8.w2bits (take 48 (drop (to_uint _buf_offset) (bufl _buf)))) (12*i+k) _.
+ rewrite allP => x.
  rewrite mapP => He; elim He => vv /=;smt(W8.size_w2bits).
  rewrite (nth_map witness);1: by smt(size_take size_drop Array536.size_to_list).
  rewrite /w2bits nth_mkseq 1:/# /= nth_take 1,2:/# nth_drop /#.
 qed.

lemma buf_rejection_filter48_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter48
 by islossless.

lemma buf_rejection_filter48_ph _pol _ctr _buf _buf_offset:
phoare  [Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter48
 : counter = _ctr
  /\  W64.to_uint _buf_offset + 56 < 536 
   /\ to_uint _ctr <= 256-32
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ auxdata_ok load_shuffle mask bounds ones sst
   ==>
   let l = rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint _buf_offset + 48))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ res.`2 = W64.of_int (to_uint _ctr + size l)] = 1%r.
proof. 
conseq buf_rejection_filter48_ll (buf_rejection_filter48_h _pol _ctr _buf _buf_offset).  smt().
qed.

hoare buf_rejection_filter24_h _pol _ctr _buf _buf_offset:
 Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter24
 : counter = _ctr
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ auxdata_ok load_shuffle mask bounds ones sst
   ==>
   let l = take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint _buf_offset + 24)))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ res.`2 = W64.of_int (to_uint _ctr + size l).
proof.
admitted.

lemma buf_rejection_filter24_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter24
 by islossless.

phoare buf_rejection_filter24_ph _pol _ctr _buf _buf_offset:
 [Jkem_avx2.M(Jkem_avx2.Syscall).__gen_matrix_buf_rejection_filter24
 : counter = _ctr
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ auxdata_ok load_shuffle mask bounds ones sst
   ==>
   let l = take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint _buf_offset + 24)))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ res.`2 = W64.of_int (to_uint _ctr + size l)] = 1%r.
proof.
by conseq buf_rejection_filter24_ll (buf_rejection_filter24_h _pol _ctr _buf _buf_offset).
qed.
