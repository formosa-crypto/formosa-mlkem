require import AllCore IntDiv FloorCeil StdOrder RealExp List.
require import ZModP Ring.
require import Distr DList DistrExtra DMap DInterval.
from Jasmin require import JWord.
require import Array25 Array32 Array34 Array64 Array128 Array168 Array256 Array384.
require import Array768 Array960 Array1024 Array1088 Array1184 Array1152.

(*---*) import RField RealOrder IntOrder IntID.

require import Kyber.
require import BitEncoding.
import BitChunking BS2Int.

(* These come directly from the code. We need to show
   that decode implements the same thing, and then show
   that encode inverts them. *)
proc op op_EncDec_encode12 = EncDec.encode12.
proc op op_EncDec_encode4 = EncDec.encode4.
proc op op_EncDec_encode1 = EncDec.encode1.
proc op op_EncDec_encode10_vec = EncDec.encode10_vec_aux.

proc op op_EncDec_decode12 = EncDec.decode12.
proc op op_EncDec_decode4 = EncDec.decode4.
proc op op_EncDec_decode1 = EncDec.decode1.
proc op op_EncDec_decode10_vec = EncDec.decode10_vec_aux.

(* These ones still require inlining *)
op op_EncDec_encode12_vec(a : ipolyvec) : W8.t Array1152.t =
   Array1152.init (fun i => 
        if 0<=i<384 
        then (op_EncDec_encode12 (Array256.init (fun k => a.[k]))).[i]
        else if 384<=i<768
             then (op_EncDec_encode12 (Array256.init (fun k => a.[k+256]))).[i-384]
             else (op_EncDec_encode12 (Array256.init (fun k => a.[k+512]))).[i-768]).
   
op op_EncDec_decode12_vec(a : W8.t Array1152.t) : ipolyvec = 
   Array768.init (fun i => 
        if 0<=i<256 
        then (op_EncDec_decode12 (Array384.init (fun k => a.[k]))).[i]
        else if 256<=i<512
             then (op_EncDec_decode12 (Array384.init (fun k => a.[k+384]))).[i-256]
             else (op_EncDec_decode12 (Array384.init (fun k => a.[k+768]))).[i-512]).

(* FixMe: Move *)
lemma iteriS_rw ['a] (n : int) (opr : int -> 'a -> 'a) (x : 'a) :
  0 < n => iteri n opr x = opr (n - 1) (iteri (n - 1) opr x).
proof. smt(iteriS). qed.

lemma mkseqSr_rw ['a] (f : int -> 'a) (n : int) :
  0 < n => mkseq f n = f 0 :: mkseq (fun i => f (i+1)) (n-1).
proof. move => *. have H : exists i, n = i+1 by smt().
elim H => i H0 /=; rewrite H0 /(\o) /=.
have := mkseqSr f i _; 1: by smt().
rewrite /(\o) => /= => - /#. 
qed.

lemma nth_nth_chunk ['a]  (r i j : int) (l : 'a list) x0 x1 x2 :
   0 <= r =>
   0 <= i < size l %/ r =>
   0 <= j < r => nth x0 (nth x1 (chunk r l) i) j = nth x2 l (r*i+j).
proof. 
move => *.
rewrite /chunk /= nth_mkseq 1:/# /= nth_take 1,2:/# /= nth_drop 1,2:/#. 
by rewrite (nth_change_dfl x0 x2) /#.
qed.


lemma sem_decode10_vec_corr : sem_decode10_vec = op_EncDec_decode10_vec.
proof.
apply fun_ext => x.
rewrite /op_EncDec_decode10_vec /sem_decode10_vec /=.
pose f := fun (i j : int) => bs2int (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) (4*i+j)).
  pose g := (fun (i : int) (rj : ipolyvec*int*W8.t*W8.t*W8.t*W8.t*W8.t)  => (rj.`1.[4*i <- f i 0].[4*i + 1 <- f i 1].[4*i + 2 <- f i 2].[4*i + 3 <- f i 3], i * 5,x.[i * 5],x.[i * 5 + 1],x.[i * 5 + 2],x.[i * 5 + 3],x.[i * 5 + 4])).
rewrite (eq_iteri _ g  _ _).
+ move => i a ib /=. 
  rewrite (_: a = (a.`1,a.`2,a.`3,a.`4,a.`5,a.`6,a.`7)) 1:/# /g /= /f /=.
  have -> /= : 4*i%/4*5 = i * 5 by smt().
  congr;[congr;[ congr;[congr | ] | ] | ].
  + have //= -> := W8.to_uint_bits.
    have //= <- := W8.bits_divmod (x.[i*5+1]) 0 2.
    rewrite (mulrC _ 256).
    have -> : 256 = 2^(size ((bits x.[i * 5] 0 8))); 1: by rewrite size_bits //=.
    have /= <- := bs2int_cat (bits x.[i * 5] 0 8) (bits x.[i * 5 + 1] 0 2).
    congr; apply (eq_from_nth witness).
   + rewrite size_cat !size_bits //=.
      + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
   rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 
    move => k; rewrite size_cat !size_bits //= => kb.
    rewrite (nth_nth_chunk 10 (4*i) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1,3: by smt().
  + by rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
       rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
       rewrite !StdBigop.Bigint.big_constz /=;
       rewrite !count_predT /= !size_iota /= /max /= /#.
  rewrite (nth_flatten witness 8).
  + rewrite allP => w /=; rewrite mapP => Hx. 
    by elim Hx => ww [_ ->]; rewrite W8.size_w2bits. 
  rewrite (nth_map witness) => /=; 1: by  rewrite size_to_list; smt(). 
  rewrite nth_cat size_bits //=.
  case (k < 8);move => *;rewrite /bits /w2bits /= !nth_mkseq /= /#. 

  + have //= := W8.bits_divmod (x.[i*5+1]) 2 6;rewrite modz_small; 1: by  move : W8.to_uint_cmp => /=;  rewrite ger0_def /#. 
    move => <-.
    have //= <- := W8.bits_divmod (x.[i*5+2]) 0 4.
    rewrite (mulrC _ 64).
    have -> : 64 = 2^(size ((bits x.[i * 5 + 1] 2 6))); 1: by rewrite size_bits //=.
    have /= <- := bs2int_cat (bits x.[i * 5 + 1] 2 6) (bits x.[i * 5 + 2] 0 4).
    congr; apply (eq_from_nth witness).
   + rewrite size_cat !size_bits //=.
      + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
   rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 
    move => k; rewrite size_cat !size_bits //= => kb.
    rewrite (nth_nth_chunk 10 (4*i + 1) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1,3: by smt().
  + by rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
       rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
       rewrite !StdBigop.Bigint.big_constz /=;
       rewrite !count_predT /= !size_iota /= /max /= /#.
  rewrite (nth_flatten witness 8).
  + rewrite allP => w /=; rewrite mapP => Hx. 
    by elim Hx => ww [_ ->]; rewrite W8.size_w2bits. 
  rewrite (nth_map witness) => /=; 1: by  rewrite size_to_list; smt(). 
  rewrite nth_cat size_bits //=.
  case (k < 6);move => *;rewrite /bits /w2bits /= !nth_mkseq /= /#. 

  + have //= := W8.bits_divmod (x.[i*5+2]) 4 4;rewrite modz_small; 1: by  move : W8.to_uint_cmp => /=;  rewrite ger0_def /#. 
    move => <-.
    have //= <- := W8.bits_divmod (x.[i*5+3]) 0 6.
    rewrite (mulrC _ 16).
    have -> : 16 = 2^(size ((bits x.[i * 5 + 2] 4 4))); 1: by rewrite size_bits //=.
    have /= <- := bs2int_cat (bits x.[i * 5 + 2] 4 4) (bits x.[i * 5 + 3] 0 6).
    congr; apply (eq_from_nth witness).
   + rewrite size_cat !size_bits //=.
      + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
   rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 
    move => k; rewrite size_cat !size_bits //= => kb.
    rewrite (nth_nth_chunk 10 (4*i + 2) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1,3: by smt().
  + by rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
       rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
       rewrite !StdBigop.Bigint.big_constz /=;
       rewrite !count_predT /= !size_iota /= /max /= /#.
  rewrite (nth_flatten witness 8).
  + rewrite allP => w /=; rewrite mapP => Hx. 
    by elim Hx => ww [_ ->]; rewrite W8.size_w2bits. 
  rewrite (nth_map witness) => /=; 1: by  rewrite size_to_list; smt(). 
  rewrite nth_cat size_bits //=.
  case (k < 4);move => *;rewrite /bits /w2bits /= !nth_mkseq /= /#. 

  + have //= := W8.bits_divmod (x.[i*5+3]) 6 2;rewrite modz_small; 1: by  move : W8.to_uint_cmp => /=;  rewrite ger0_def /#. 
    move => <-.
    have //= -> := W8.to_uint_bits.
    rewrite (mulrC _ 4).
    have -> : 4 * bs2int (bits x.[i * 5 + 4] 0 8) = 2^(size ((bits x.[i * 5 + 3] 6 2))) * bs2int (bits x.[i * 5 + 4] 0 8); 1: by rewrite size_bits //=.
    have /= <- := bs2int_cat (bits x.[i * 5 + 3] 6 2) (bits x.[i * 5 + 4] 0 8).
    congr; apply (eq_from_nth witness).
   + rewrite size_cat !size_bits //=.
      + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
   rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 
    move => k; rewrite size_cat !size_bits //= => kb.
    rewrite (nth_nth_chunk 10 (4*i + 3) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1,3: by smt().
  + by rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
       rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
       rewrite !StdBigop.Bigint.big_constz /=;
       rewrite !count_predT /= !size_iota /= /max /= /#.
  rewrite (nth_flatten witness 8).
  + rewrite allP => w /=; rewrite mapP => Hx. 
    by elim Hx => ww [_ ->]; rewrite W8.size_w2bits. 
  rewrite (nth_map witness) => /=; 1: by  rewrite size_to_list; smt(). 
  rewrite nth_cat size_bits //=.
  case (k < 2);move => *;rewrite /bits /w2bits /= !nth_mkseq /= /#. 


rewrite /decode_vec /BytesToBits /=.
have -> : 7680 = size (flatten (map W8.w2bits (to_list x))); 1:by
 rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /=.
rewrite take_size.
rewrite tP /= => i ib.
rewrite get_of_list 1:ib (nth_map (witness<:bool list>) 0);
1: by  rewrite !size_chunk /=; [ by smt() | ];
  rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= 1:ib. 
  pose cc := iteri 192 g (witness, witness, witness, witness, witness, witness, witness).
  have -> /= : cc = (cc.`1,cc.`2,cc.`3,cc.`4,cc.`5,cc.`6,cc.`7); 1: smt().
  have /= [<- ]:= (Array768.tP (Array768.init (fun i => bs2int (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) i))) cc.`1); [| by apply ib | by smt(Array768.initiE)].
rewrite /of_list -(Array768.init_set witness) -JUtils.iotaredE /=.
rewrite /cc;do 192!(rewrite iteriS_rw;1: by smt()). 
by rewrite iteri0 /=.
qed.












lemma sem_decode10K  : cancel op_EncDec_decode10_vec  op_EncDec_encode10_vec.
rewrite /cancel /op_EncDec_encode10_vec /= => x.
pose cc := iteri 192 _ _.
have -> /= : cc = (cc.`1,cc.`2,cc.`3,cc.`4,cc.`5,cc.`6) by smt().

have H4 : forall i j (v : W8.t Array960.t), 0 <= i < 960 => i%%5 = 4 => j = i %/ 5 * 4 + 3 => 
  v.[i <- W8.of_int ((sem_decode10_vec x).[j] %/ 4) ] = v.[i <- x.[i]].
+ move => i j v ib imod jval. congr.
  rewrite /sem_decode10_vec  to_uint_eq /= of_uintK /=.
rewrite /decode_vec /BytesToBits !Array768.get_of_list /=; 1:smt().
have -> : 7680 = size (flatten (map W8.w2bits (to_list x))); 1:by
 rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /=.
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1:
by  rewrite !size_chunk /=; [ by smt() | ];
  rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#. 
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j)) = 10.
    + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
    by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 
  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*j+i0)))).
  + move => k kb /=. 
    rewrite (nth_nth_chunk 10 j k (flatten (map W8.w2bits (to_list x))) false witness false) => //; last by smt(mem_range).
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#.
  do 10!(rewrite range_ltn /=;1 :smt()). rewrite range_geq //=. 
    do 10!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  rewrite !(nth_flatten false 8) /=; first 10 by  rewrite allP => k /=; smt(mapP W8.size_w2bits). 
rewrite !(nth_map witness); first 20 by smt(size_iota Array960.size_to_list).
rewrite !(nth_iota); first 10 by smt().
rewrite !W8.get_w2bits /=.
have -> : 
(b2i x.[10 * j %/ 8].[10 * j %% 8] +
 (2 * b2i x.[(10 * j + 1) %/ 8].[(10 * j + 1) %% 8] +
  (4 * b2i x.[(10 * j + 2) %/ 8].[(10 * j + 2) %% 8] +
   (8 * b2i x.[(10 * j + 3) %/ 8].[(10 * j + 3) %% 8] +
    (16 * b2i x.[(10 *j + 4) %/ 8].[(10 * j + 4) %% 8] +
     (32 * b2i x.[(10 * j + 5) %/ 8].[(10 * j + 5) %% 8] +
      (64 * b2i x.[(10 * j + 6) %/ 8].[(10 * j + 6) %% 8] +
       (128 * b2i x.[(10 * j + 7) %/ 8].[(10 * j + 7) %% 8] +
        (256 * b2i x.[(10 * j + 8) %/ 8].[(10 * j + 8) %% 8] + 512 * b2i x.[(10 * j + 9) %/ 8].[(10 * j + 9) %% 8]))))))))) %/ 4 %%
256 = 
( b2i x.[(10 * j + 2) %/ 8].[(10 * j + 2) %% 8] +
   (2 * b2i x.[(10 * j + 3) %/ 8].[(10 * j + 3) %% 8] +
    (4 * b2i x.[(10 * j + 4) %/ 8].[(10 * j + 4) %% 8] +
     (8 * b2i x.[(10 * j + 5) %/ 8].[(10 * j + 5) %% 8] +
      (16 * b2i x.[(10 * j + 6) %/ 8].[(10 * j + 6) %% 8] +
       (32 * b2i x.[(10 * j + 7) %/ 8].[(10 * j + 7) %% 8] +
        (64 * b2i x.[(10 * j + 8) %/ 8].[(10 * j + 8) %% 8] + 128 * b2i x.[(10 * j + 9) %/ 8].[(10 * j + 9) %% 8]))))))) %%
256 by smt().
have H : forall k, 2<=k<10 => (10*j + k) %/8 = i by smt().
rewrite !H //=. 
have H1 : forall k, 2<=k<10 => (10*j+k) %%8 = k - 2 by smt().
rewrite !H1 //=.
rewrite modz_small 1:/#.
rewrite to_uintE /= /w2bits /=.
do 8!(rewrite mkseqSr_rw //=); rewrite mkseq0 //=.
do 8!(rewrite bs2int_cons /=); rewrite bs2int_nil //=.
by ring.

have H3 : forall i j k (v : W8.t Array960.t), 0 <= i < 960 => i%%5 = 3 => k = i %/ 5 * 4 + 2 => j = i %/ 5 * 4 + 3 => 
  v.[i <- W8.of_int ((sem_decode10_vec x).[k] %/ 16 + (sem_decode10_vec x).[j] * 64) ] = v.[i <- x.[i]]. 
+ move => i j k v ib imod kval jval. congr.
  rewrite /sem_decode10_vec  to_uint_eq /= of_uintK /=.
rewrite /decode_vec /BytesToBits !Array768.get_of_list /=; 1,2:smt().
have -> : 7680 = size (flatten (map W8.w2bits (to_list x))); 1:by
 rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /=.
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1,2:
by  rewrite !size_chunk /=; [ by smt() | ];
  rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#. 
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j)) = 10.
    + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
    by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#.
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) k)) = 10.
    + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
    by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#.

  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ 
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*k+i0)))).
  + move => kk kkb /=. 
    rewrite (nth_nth_chunk 10 k kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last    by smt(mem_range).
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#.

  rewrite (StdBigop.Bigint.BIA.eq_big_seq 
     (fun (i0 : int) => 2 ^ i0 * b2i (nth false (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j) i0))
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*j+i0)))).
  + move => kk kkb //=.
    rewrite (nth_nth_chunk 10 j kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last   by smt(mem_range).
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#.


  do 10!(rewrite range_ltn /=;1 :smt()). rewrite range_geq //=. 
    do 10!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
    do 10!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  rewrite !(nth_flatten false 8) /=; first 20 by  rewrite allP => kk /=; smt(mapP W8.size_w2bits). 
rewrite !(nth_map witness); first 40 by smt(size_iota Array960.size_to_list).
rewrite !(nth_iota); first 20 by smt().
rewrite !W8.get_w2bits /=.
have ->  : 
((b2i x.[10 * k %/ 8].[10 * k %% 8] +
  (2 * b2i x.[(10 * k + 1) %/ 8].[(10 * k + 1) %% 8] +
   (4 * b2i x.[(10 * k + 2) %/ 8].[(10 * k + 2) %% 8] +
    (8 * b2i x.[(10 * k + 3) %/ 8].[(10 * k + 3) %% 8] +
     (16 * b2i x.[(10 * k + 4) %/ 8].[(10 * k + 4) %% 8] +
      (32 * b2i x.[(10 * k + 5) %/ 8].[(10 * k + 5) %% 8] +
       (64 * b2i x.[(10 * k + 6) %/ 8].[(10 * k + 6) %% 8] +
        (128 * b2i x.[(10 * k + 7) %/ 8].[(10 * k + 7) %% 8] +
         (256 * b2i x.[(10 * k + 8) %/ 8].[(10 * k + 8) %% 8] + 512 * b2i x.[(10 * k + 9) %/ 8].[(10 * k + 9) %% 8]))))))))) %/
 16   = 
b2i x.[(10 * k + 4) %/ 8].[(10 * k + 4) %% 8] +
      (2 * b2i x.[(10 * k + 5) %/ 8].[(10 * k + 5) %% 8] +
       (4 * b2i x.[(10 * k + 6) %/ 8].[(10 * k + 6) %% 8] +
        (8 * b2i x.[(10 * k + 7) %/ 8].[(10 * k + 7) %% 8] +
         (16 * b2i x.[(10 * k + 8) %/ 8].[(10 * k + 8) %% 8] + 32 * b2i x.[(10 * k + 9) %/ 8].[(10 * k + 9) %% 8])))))   by smt().
have H : forall kk, 4<=kk<10 => (10*k + kk) %/8 = i by smt().
do 6!(rewrite H //=). 
have H1 : forall kk, 4<=kk<10 => (10*k + kk) %% 8 = kk -4  by smt ().  
do 6!(rewrite H1 //=).
have H2 : forall kk, 0<=kk<2 => (10*j + kk) %/8 = i  by smt().
do 1!(rewrite H2 //=).  move : (H2 0 _); 1: by smt(). move => //= ->.
have H3 : forall kk, 0<=kk<2 => (10*j+kk) %%8 = kk + 6 by smt().  
do 1!(rewrite H3 //=). move : (H3 0 _); 1: by smt(). move => //= ->.
have H5 : forall kk, 2<=kk<10 => (10*j + kk) %/8 = i + 1  by smt().
do 8!(rewrite H5 //=). 
have H6 : forall kk, 2<=kk<10 => (10*j+kk) %%8 = kk - 2 by smt().  
do 8!(rewrite H6 //=). 

have -> : 
(b2i x.[i].[0] +
 (2 * b2i x.[i].[1] + (4 * b2i x.[i].[2] + (8 * b2i x.[i].[3] + (16 * b2i x.[i].[4] + 32 * b2i x.[i].[5])))) +
 (b2i x.[i].[6] +
  (2 * b2i x.[i].[7] +
   (4 * b2i x.[i + 1].[0] +
    (8 * b2i x.[i + 1].[1] +
     (16 * b2i x.[i + 1].[2] +
      (32 * b2i x.[i + 1].[3] +
       (64 * b2i x.[i + 1].[4] + (128 * b2i x.[i + 1].[5] + (256 * b2i x.[i + 1].[6] + 512 * b2i x.[i + 1].[7]))))))))) *
 64) %%
256  = 
(b2i x.[i].[0] +
 (2 * b2i x.[i].[1] + (4 * b2i x.[i].[2] + (8 * b2i x.[i].[3] + (16 * b2i x.[i].[4] + 32 * b2i x.[i].[5])))) +
 (64*b2i x.[i].[6] +
  (128*  b2i x.[i].[7]))) by smt().

rewrite to_uintE /= /w2bits /=.
do 8!(rewrite mkseqSr_rw //=); rewrite mkseq0 //=.
do 8!(rewrite bs2int_cons /=); rewrite bs2int_nil //=.
by ring.

have H2 : forall i j k (v : W8.t Array960.t), 0 <= i < 960 => i%%5 = 2 => k = i %/ 5 * 4 + 1 => j = i %/ 5 * 4 + 2 => 
  v.[i <- W8.of_int ((sem_decode10_vec x).[k] %/ 64 + (sem_decode10_vec x).[j] * 16) ] = v.[i <- x.[i]]. 
+ move => i j k v ib imod kval jval. congr.
  rewrite /sem_decode10_vec  to_uint_eq /= of_uintK /=.
rewrite /decode_vec /BytesToBits !Array768.get_of_list /=; 1,2:smt().
have -> : 7680 = size (flatten (map W8.w2bits (to_list x))); 1:by
 rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /=.
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1,2:
by  rewrite !size_chunk /=; [ by smt() | ];
  rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#. 
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j)) = 10.
    + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
    by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#.
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) k)) = 10.
    + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
    by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#.

  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ 
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*k+i0)))).
  + move => kk kkb /=. 
    rewrite (nth_nth_chunk 10 k kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last    by smt(mem_range).
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#.

  rewrite (StdBigop.Bigint.BIA.eq_big_seq 
     (fun (i0 : int) => 2 ^ i0 * b2i (nth false (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j) i0))
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*j+i0)))).
  + move => kk kkb //=.
    rewrite (nth_nth_chunk 10 j kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last   by smt(mem_range).
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#.


  do 10!(rewrite range_ltn /=;1 :smt()). rewrite range_geq //=. 
    do 10!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
    do 10!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  rewrite !(nth_flatten false 8) /=; first 20 by  rewrite allP => kk /=; smt(mapP W8.size_w2bits). 
rewrite !(nth_map witness); first 40 by smt(size_iota Array960.size_to_list).
rewrite !(nth_iota); first 20 by smt().
rewrite !W8.get_w2bits /=.
have ->  : 
((b2i x.[10 * k %/ 8].[10 * k %% 8] +
  (2 * b2i x.[(10 * k + 1) %/ 8].[(10 * k + 1) %% 8] +
   (4 * b2i x.[(10 * k + 2) %/ 8].[(10 * k + 2) %% 8] +
    (8 * b2i x.[(10 * k + 3) %/ 8].[(10 * k + 3) %% 8] +
     (16 * b2i x.[(10 * k + 4) %/ 8].[(10 * k + 4) %% 8] +
      (32 * b2i x.[(10 * k + 5) %/ 8].[(10 * k + 5) %% 8] +
       (64 * b2i x.[(10 * k + 6) %/ 8].[(10 * k + 6) %% 8] +
        (128 * b2i x.[(10 * k + 7) %/ 8].[(10 * k + 7) %% 8] +
         (256 * b2i x.[(10 * k + 8) %/ 8].[(10 * k + 8) %% 8] + 512 * b2i x.[(10 * k + 9) %/ 8].[(10 * k + 9) %% 8])))))))))) %/
 64 = 
b2i x.[(10 * k + 6) %/ 8].[(10 * k + 6) %% 8] +
        2 * b2i x.[(10 * k + 7) %/ 8].[(10 * k + 7) %% 8] +
4 * b2i x.[(10 * k + 8) %/ 8].[(10 * k + 8) %% 8] + 8 * b2i x.[(10 * k + 9) %/ 8].[(10 * k + 9) %% 8] by smt().
have H : forall kk, 6<=kk<10 => (10*k + kk) %/8 = i by smt().
do 4!(rewrite H //=). 
have H1 : forall kk, 6<=kk<10 => (10*k + kk) %% 8 = kk - 6  by smt ().  
do 4!(rewrite H1 //=).
have H2 : forall kk, 0<=kk<4 => (10*j + kk) %/8 = i  by smt().
do 3!(rewrite H2 //=).  move : (H2 0 _); 1: by smt(). move => //= ->.
have H5 : forall kk, 0<=kk<4 => (10*j+kk) %%8 = kk + 4 by smt().  
do 3!(rewrite H5 //=). move : (H5 0 _); 1: by smt(). move => //= ->.
have H6 : forall kk, 4<=kk<10 => (10*j + kk) %/8 = i + 1  by smt().
do 6!(rewrite H6 //=). 
have H7 : forall kk, 4<=kk<10 => (10*j+kk) %%8 = kk - 4 by smt().  
do 6!(rewrite H7 //=). 

have -> : 
(b2i x.[i ].[0] + 2 * b2i x.[i ].[1] + 4 * b2i x.[i ].[2] + 8 * b2i x.[i ].[3] +
 (b2i x.[i ].[4] +
  (2 * b2i x.[i ].[5] +
   (4 * b2i x.[i ].[6] +
    (8 * b2i x.[i ].[7] +
     (16 * b2i x.[i + 1].[0] +
      (32 * b2i x.[i + 1].[1] + (64 * b2i x.[i + 1].[2] + (128 * b2i x.[i + 1].[3] + (256 * b2i x.[i + 1].[4] + 512 * b2i x.[i + 1].[5]))))))))) *
 16) %%
256  = 
b2i x.[i ].[0] + 2 * b2i x.[i ].[1] + 4 * b2i x.[i].[2] + 8 * b2i x.[i].[3] +
 16*b2i x.[i ].[4] +
  32 * b2i x.[i ].[5] +
   64 * b2i x.[i].[6] +
    128 * b2i x.[i ].[7] by smt().

rewrite to_uintE /= /w2bits /=.
do 8!(rewrite mkseqSr_rw //=); rewrite mkseq0 //=.
do 8!(rewrite bs2int_cons /=); rewrite bs2int_nil //=.
by ring.

have H1 : forall i j k (v : W8.t Array960.t), 0 <= i < 960 => i%%5 = 1 => k = i %/ 5 * 4  => j = i %/ 5 * 4 + 1 => 
  v.[i <- W8.of_int ((sem_decode10_vec x).[k] %/ 256 + (sem_decode10_vec x).[j] * 4) ] = v.[i <- x.[i]]. 
+ move => i j k v ib imod kval jval. congr.
  rewrite /sem_decode10_vec  to_uint_eq /= of_uintK /=.
rewrite /decode_vec /BytesToBits !Array768.get_of_list /=; 1,2:smt().
have -> : 7680 = size (flatten (map W8.w2bits (to_list x))); 1:by
 rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /=.
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1,2:
by  rewrite !size_chunk /=; [ by smt() | ];
  rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#. 
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j)) = 10.
    + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
    by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#.
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) k)) = 10.
    + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
    by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#.

  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ 
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*k+i0)))).
  + move => kk kkb /=. 
    rewrite (nth_nth_chunk 10 k kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last    by smt(mem_range).
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#.

  rewrite (StdBigop.Bigint.BIA.eq_big_seq 
     (fun (i0 : int) => 2 ^ i0 * b2i (nth false (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j) i0))
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*j+i0)))).
  + move => kk kkb //=.
    rewrite (nth_nth_chunk 10 j kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last   by smt(mem_range).
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#.


  do 10!(rewrite range_ltn /=;1 :smt()). rewrite range_geq //=. 
    do 10!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
    do 10!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  rewrite !(nth_flatten false 8) /=; first 20 by  rewrite allP => kk /=; smt(mapP W8.size_w2bits). 
rewrite !(nth_map witness); first 40 by smt(size_iota Array960.size_to_list).
rewrite !(nth_iota); first 20 by smt().
rewrite !W8.get_w2bits /=.
have ->  : 
((b2i x.[10 * k %/ 8].[10 * k %% 8] +
  (2 * b2i x.[(10 * k + 1) %/ 8].[(10 * k + 1) %% 8] +
   (4 * b2i x.[(10 * k + 2) %/ 8].[(10 * k + 2) %% 8] +
    (8 * b2i x.[(10 * k + 3) %/ 8].[(10 * k + 3) %% 8] +
     (16 * b2i x.[(10 * k + 4) %/ 8].[(10 * k + 4) %% 8] +
      (32 * b2i x.[(10 * k + 5) %/ 8].[(10 * k + 5) %% 8] +
       (64 * b2i x.[(10 * k + 6) %/ 8].[(10 * k + 6) %% 8] +
        (128 * b2i x.[(10 * k + 7) %/ 8].[(10 * k + 7) %% 8] +
         (256 * b2i x.[(10 * k + 8) %/ 8].[(10 * k + 8) %% 8] + 512 * b2i x.[(10 * k + 9) %/ 8].[(10 * k + 9) %% 8])))))))))) %/
 256 = 
b2i x.[(10 * k + 8) %/ 8].[(10 * k + 8) %% 8] + 2 * b2i x.[(10 * k + 9) %/ 8].[(10 * k + 9) %% 8] by smt().
have H : forall kk, 8<=kk<10 => (10*k + kk) %/8 = i by smt().
do 2!(rewrite H //=). 
have H1 : forall kk, 8<=kk<10 => (10*k + kk) %% 8 = kk-8  by smt ().  
do 2!(rewrite H1 //=).
have H5 : forall kk, 0<=kk<6 => (10*j + kk) %/8 = i  by smt().
do 5!(rewrite H5 //=).  move : (H5 0 _); 1: by smt(). move => //= ->.
have H6 : forall kk, 0<=kk<6 => (10*j+kk) %%8 = kk + 2 by smt().  
do 5!(rewrite H6 //=). move : (H6 0 _); 1: by smt(). move => //= ->.
have H7 : forall kk, 6<=kk<10 => (10*j + kk) %/8 = i + 1  by smt().
do 4!(rewrite H7 //=). 
have H8 : forall kk, 6<=kk<10 => (10*j+kk) %%8 = kk - 6 by smt().  
do 4!(rewrite H8 //=). 

have -> : 
(b2i x.[i].[0] + 2 * b2i x.[i].[1] +
 (b2i x.[i].[2] +
  (2 * b2i x.[i].[3] +
   (4 * b2i x.[i].[4] +
    (8 * b2i x.[i].[5] +
     (16 * b2i x.[i].[6] +
      (32 * b2i x.[i].[7] +
       (64 * b2i x.[i + 1].[0] + (128 * b2i x.[i + 1].[1] + (256 * b2i x.[i + 1].[2] + 512 * b2i x.[i + 1].[3]))))))))) *
 4) %%
256 = 
(b2i x.[i].[0] + 2 * b2i x.[i].[1] +
 (4*b2i x.[i].[2] +
  (8 * b2i x.[i].[3] +
   (16 * b2i x.[i].[4] +
    (32 * b2i x.[i].[5] +
     (64 * b2i x.[i].[6] +
      (128 * b2i x.[i].[7]))))))) by smt().

rewrite to_uintE /= /w2bits /=.
do 8!(rewrite mkseqSr_rw //=); rewrite mkseq0 //=.
do 8!(rewrite bs2int_cons /=); rewrite bs2int_nil //=.
by ring.

have H0 : forall i j (v : W8.t Array960.t), 0 <= i < 768 => i%%4 = 0 => j = i %/ 4 * 5 => 
  v.[j <- W8.of_int (sem_decode10_vec x).[i]] = v.[j <- x.[j]].
+ move => i j v ib imod jval. congr.
  rewrite /sem_decode10_vec  to_uint_eq /= of_uintK /=.
rewrite /decode_vec /BytesToBits !Array768.get_of_list /=; 1:smt().
have -> : 7680 = size (flatten (map W8.w2bits (to_list x))); 1:by
 rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /=.
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1:
by  rewrite !size_chunk /=; [ by smt() | ];
  rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#. 
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) i)) = 10.
    + have  /= [_ ->] := (all_nthP (fun l => size l = 10) (chunk 10 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
    by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 
  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*i+i0)))).
  + move => k kb /=. 
    rewrite (nth_nth_chunk 10 i k (flatten (map W8.w2bits (to_list x))) false witness false) => //; last by smt(mem_range).
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#.
  do 10!(rewrite range_ltn /=;1 :smt()). rewrite range_geq //=. 
    do 10!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  rewrite !(nth_flatten false 8) /=; first 10 by  rewrite allP => k /=; smt(mapP W8.size_w2bits). 
rewrite !(nth_map witness); first 20 by smt(size_iota Array960.size_to_list).
rewrite !(nth_iota); first 10 by smt().
rewrite !W8.get_w2bits /=.
have -> : 
(b2i x.[10 * i %/ 8].[10 * i %% 8] +
 (2 * b2i x.[(10 * i + 1) %/ 8].[(10 * i + 1) %% 8] +
  (4 * b2i x.[(10 * i + 2) %/ 8].[(10 * i + 2) %% 8] +
   (8 * b2i x.[(10 * i + 3) %/ 8].[(10 * i + 3) %% 8] +
    (16 * b2i x.[(10 * i + 4) %/ 8].[(10 * i + 4) %% 8] +
     (32 * b2i x.[(10 * i + 5) %/ 8].[(10 * i + 5) %% 8] +
      (64 * b2i x.[(10 * i + 6) %/ 8].[(10 * i + 6) %% 8] +
       (128 * b2i x.[(10 * i + 7) %/ 8].[(10 * i + 7) %% 8] +
        (256 * b2i x.[(10 * i + 8) %/ 8].[(10 * i + 8) %% 8] + 512 * b2i x.[(10 * i + 9) %/ 8].[(10 * i + 9) %% 8]))))))))) %%
256 = 
(b2i x.[10 * i %/ 8].[10 * i %% 8] +
 (2 * b2i x.[(10 * i + 1) %/ 8].[(10 * i + 1) %% 8] +
  (4 * b2i x.[(10 * i + 2) %/ 8].[(10 * i + 2) %% 8] +
   (8 * b2i x.[(10 * i + 3) %/ 8].[(10 * i + 3) %% 8] +
    (16 * b2i x.[(10 * i + 4) %/ 8].[(10 * i + 4) %% 8] +
     (32 * b2i x.[(10 * i + 5) %/ 8].[(10 * i + 5) %% 8] +
      (64 * b2i x.[(10 * i + 6) %/ 8].[(10 * i + 6) %% 8] +
       (128 * b2i x.[(10 * i + 7) %/ 8].[(10 * i + 7) %% 8]
        )))))))) %%
256 by smt().
have H : forall k, 0<=k<8 => (10*i + k) %/8 = j by smt().
rewrite !H //=; move : (H 0 _); rewrite //= => ->.
have H6 : forall k, 0<=k<8 => (10*i+k) %%8 = k by smt().
rewrite !H6 //=; move : (H6 0 _); rewrite //= => ->.
rewrite modz_small 1:/#.
rewrite to_uintE /= /w2bits /=.
do 8!(rewrite mkseqSr_rw //=); rewrite mkseq0 //=.
do 8!(rewrite bs2int_cons /=); rewrite bs2int_nil //=.
by ring.

rewrite sem_decode10_vec_corr in H4.
rewrite sem_decode10_vec_corr in H3.
rewrite sem_decode10_vec_corr in H2.
rewrite sem_decode10_vec_corr in H1.
rewrite sem_decode10_vec_corr in H0.

rewrite /cc; do 192!(rewrite iteriS_rw;1: by smt()); rewrite iteri0; 1: by smt().

simplify.

do 192!(rewrite H0 1..3:/#).
do 192!(rewrite H1 1..4:/#).
do 192!(rewrite H2 1..4:/#).
do 192!(rewrite H3 1..4:/#).
do 192!(rewrite H4 1..3:/#).
simplify.

  have  := (Array960.init_set witness (fun i => x.[i])). 
  rewrite -JUtils.iotaredE /= => ->.
  by rewrite tP => k kb; rewrite initiE //=.

qed.


lemma sem_decode1_corr : sem_decode1 = op_EncDec_decode1.
proof.
apply fun_ext => x.
rewrite /op_EncDec_decode1 /sem_decode1 /=. 
pose f := fun i j => bs2int (nth witness (chunk 1 (flatten (map W8.w2bits (to_list x)))) (8*i+j)).
pose g := (fun (i : int) (r : ipoly) =>
     r.[i * 8 <- f i 0].[i * 8 + 1 <- f i 1].[i * 8 + 2 <- f i 2].[i * 8 + 3 <- f i 3].[
       i * 8 + 4 <- f i 4].[i * 8 + 5 <- f i 5].[i * 8 + 6 <- 
       f i 6].[i * 8 + 7 <- f i 7]).
rewrite (eq_iteri _ g  _ _).
+ move => i a ib /=. 
  rewrite /g /= /f /=.
  have H : forall j, 0<=j<8 => b2i x.[i].[j] = bs2int (nth witness (chunk 1 (flatten (map W8.w2bits (to_list x)))) (8 * i + j)); 
   last by rewrite !H; first 8 by smt().
  move => j jb.
  have [H _]:= (size_eq1 ((nth witness (chunk 1 (flatten (map W8.w2bits (to_list x)))) (8 * i + j)))).
  elim (H _).
  + have  /= [_ ->] := (all_nthP (fun l => size l = 1) (chunk 1 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
  by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 
  move => b Hb; have : b = x.[i].[j]; last by  move => <-; rewrite Hb bs2int_cons bs2int_nil /=.
  have ->  : (b = nth witness [b] 0) by auto.
  rewrite -Hb. 
  rewrite (nth_nth_chunk 1 (8 * i + j) 0 (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1,3: by smt().
  + by rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
       rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
       rewrite !StdBigop.Bigint.big_constz /=;
       rewrite !count_predT /= !size_iota /= /max /= /#.
       rewrite (nth_flatten witness 8).
  + rewrite allP => w /=; rewrite mapP => Hx. 
    by elim Hx => ww [_ ->]; rewrite W8.size_w2bits. 
  rewrite (nth_map witness); 1: by  rewrite Array32.size_to_list; smt(). 
  rewrite get_to_list.
  have -> : ((8*i+j) %/ 8) = i by smt().
  have -> : ((8*i+j) %% 8) = j by smt().
  rewrite -get_w2bits.
  by rewrite (nth_change_dfl witness false) /#.

rewrite /decode /BytesToBits /=.
have -> : 256 = size (flatten (map W8.w2bits (to_list x))); 1:by
 rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /=.
rewrite take_size.
rewrite tP /= => i ib.
rewrite get_of_list 1:ib (nth_map (witness<:bool list>) 0);
1: by  rewrite !size_chunk /=; [ by smt() | ];
  rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= 1:ib. 
  have /= [<- ]:= (Array256.tP (Array256.init (fun i => bs2int (nth witness (chunk 1 (flatten (map W8.w2bits (to_list x)))) i))) (iteri 32 g witness));[| by apply ib | by smt(Array256.initiE)].
rewrite /of_list -(Array256.init_set witness) -JUtils.iotaredE /=.
do 32!(rewrite iteriS_rw;1: by smt()). 
by rewrite iteri0 /=.
qed.


lemma sem_decode4_corr : sem_decode4 = op_EncDec_decode4.
proof.
apply fun_ext => x.
rewrite /op_EncDec_decode4 /sem_decode4 /=. 
pose f := fun i j => bs2int (nth witness (chunk 4 (flatten (map W8.w2bits (to_list x)))) (2*i+j)).
pose g := (fun (i : int) (r : ipoly) => r.[i * 2 <- f i 0].[i * 2 + 1 <- f i 1]).
rewrite (eq_iteri _ g  _ _).
+ move => i a ib /=. 
  rewrite /g /= /f /=.
  have H : to_uint x.[i] %% 16 = bs2int (nth witness (chunk 4 (flatten (map W8.w2bits (to_list x)))) (2 * i)) /\ to_uint x.[i] %/ 16 = bs2int (nth witness (chunk 4 (flatten (map W8.w2bits (to_list x)))) (2 * i + 1)); last by  move : H => [-> ->] //.  
have //= <- := W8.bits_divmod (x.[i]) 0 4.
have //= := W8.bits_divmod (x.[i]) 4 4; rewrite modz_small /=; 1: smt(W8.to_uint_cmp JUtils.pow2_8). move => <-.
split.
+ congr; apply (eq_from_nth witness).
  + rewrite size_bits //.
      + have  /= [_ ->] := (all_nthP (fun l => size l = 4) (chunk 4 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
  by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 
    move => k; rewrite size_bits //= => kb.
    rewrite (nth_nth_chunk 4 (2 * i) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1,3: by smt().
  + by rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
       rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
       rewrite !StdBigop.Bigint.big_constz /=;
       rewrite !count_predT /= !size_iota /= /max /= /#.
       rewrite (nth_flatten witness 8).
  + rewrite allP => w /=; rewrite mapP => Hx. 
    by elim Hx => ww [_ ->]; rewrite W8.size_w2bits. 
  rewrite (nth_map witness) => /=; 1: by  rewrite size_iota; smt(). 
  rewrite (nth_iota _ _ _ _ kb) /=.
  rewrite (nth_map witness) => /=; 1: by  rewrite size_to_list; smt(). 
  have -> : ((4 * (2 * i) + k) %/ 8) = i by smt().
  have -> : ((4 * (2 * i) + k)) %% 8 = k by smt().
  rewrite -get_w2bits.
  by rewrite (nth_change_dfl witness false) /#.
        
+ congr. apply (eq_from_nth witness).
  + rewrite size_bits //.
      + have  /= [_ ->] := (all_nthP (fun l => size l = 4) (chunk 4 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
  by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 

    move => k; rewrite size_bits //= => kb.
    case (k < 4); last first. 
    + move => H; rewrite !nth_default. 
      rewrite /size_bits; 1: smt().
      rewrite size_chunk; 1: smt().
      + by rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
           rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
           rewrite !StdBigop.Bigint.big_constz /=;
           rewrite !count_predT /= !size_iota /= /max /= /#. 
      by smt(). by smt().
    move => *;rewrite (nth_nth_chunk 4 (2 * i + 1) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=;1,3: by smt().
  + by rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
       rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
       rewrite !StdBigop.Bigint.big_constz /=;
       rewrite !count_predT /= !size_iota /= /max /= /#.
       rewrite (nth_flatten witness 8).
  + rewrite allP => w /=; rewrite mapP => Hx. 
    by elim Hx => ww [_ ->]; rewrite W8.size_w2bits. 
  rewrite (nth_map witness) => /=; 1: by  rewrite size_iota; smt(). 
  rewrite (nth_iota _ _ _ _ kb) /=.
  rewrite (nth_map witness) => /=; 1: by  rewrite size_to_list; smt(). 
  have -> : (4 * (2 * i + 1) + k) %/ 8 = i by smt().
  have -> : (4 * (2 * i + 1) + k) %% 8 = 4 + k by smt().
  rewrite -get_w2bits.
  by rewrite (nth_change_dfl witness false) /#.

rewrite /decode /BytesToBits /=.
have -> : 1024 = size (flatten (map W8.w2bits (to_list x))); 1:by
 rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /=.
rewrite take_size.
rewrite tP /= => i ib.
rewrite get_of_list 1:ib (nth_map (witness<:bool list>) 0);
1: by  rewrite !size_chunk /=; [ by smt() | ];
  rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= 1:ib. print Array256.tP.
  have /= [<- ]:= (Array256.tP (Array256.init (fun i => bs2int (nth witness (chunk 4 (flatten (map W8.w2bits (to_list x)))) i))) (iteri 128 g witness));[| by apply ib | by smt(Array256.initiE)].
rewrite /of_list -(Array256.init_set witness) -JUtils.iotaredE /=.
do 128!(rewrite iteriS_rw;1: by smt()). 
by rewrite iteri0 /=.
qed.

lemma sem_decode12_corr : sem_decode12 = op_EncDec_decode12.
proof.
apply fun_ext => x.
rewrite /op_EncDec_decode12 /sem_decode12 /=.
pose f := fun i j => bs2int (nth witness (chunk 12 (flatten (map W8.w2bits (to_list x)))) (2*i+j)).
pose g := (fun (i : int) (r : ipoly) => r.[i * 2 <- f i 0].[i * 2 + 1 <- f i 1]).
rewrite (eq_iteri _ g  _ _).
+ move => i a ib /=. 
  rewrite /g /= /f /=.
  congr;[congr |]. 
  + have //= -> := W8.to_uint_bits.
    have //= <- := W8.bits_divmod (x.[3*i+1]) 0 4.
    rewrite (mulrC _ 256).
    have -> : 256 = 2^(size ((bits x.[3 * i] 0 8))); 1: by rewrite size_bits //=.
    have /= <- := bs2int_cat (bits x.[3 * i] 0 8) (bits x.[3 * i + 1] 0 4).
    congr; apply (eq_from_nth witness).
   + rewrite size_cat !size_bits //=.
      + have  /= [_ ->] := (all_nthP (fun l => size l = 12) (chunk 12 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
  by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 
    move => k; rewrite size_cat !size_bits //= => kb.
    rewrite (nth_nth_chunk 12 (2 * i) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1,3: by smt().
  + by rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
       rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
       rewrite !StdBigop.Bigint.big_constz /=;
       rewrite !count_predT /= !size_iota /= /max /= /#.
       rewrite (nth_flatten witness 8).
  + rewrite allP => w /=; rewrite mapP => Hx. 
    by elim Hx => ww [_ ->]; rewrite W8.size_w2bits. 
  rewrite (nth_map witness) => /=; 1: by  rewrite size_to_list; smt(). 
  rewrite nth_cat size_bits //=.
  case (k < 8);move => *;rewrite /bits /w2bits /= !nth_mkseq /= /#. 

  + have //= -> := W8.to_uint_bits.
    have //= := W8.bits_divmod (x.[3*i+1]) 4 4; rewrite modz_small /=; 1: smt(W8.to_uint_cmp JUtils.pow2_8). move => <-.  rewrite (mulrC _ 16) (addrC _ (bs2int (bits x.[3 * i + 1] 4 4))).
    have -> : 16 = 2^(size ((bits x.[3 * i + 1] 4 4))); 1: by rewrite size_bits //=.
    have /= <- := bs2int_cat (bits x.[3 * i + 1] 4 4) (bits x.[3 * i + 2] 0 8).
    congr; apply (eq_from_nth witness).
   + rewrite size_cat !size_bits //=.
      + have  /= [_ ->] := (all_nthP (fun l => size l = 12) (chunk 12 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
  by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 
    move => k; rewrite size_cat !size_bits //= => kb.
    rewrite (nth_nth_chunk 12 (2 * i + 1) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1,3: by smt().
  + by rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
       rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
       rewrite !StdBigop.Bigint.big_constz /=;
       rewrite !count_predT /= !size_iota /= /max /= /#.
       rewrite (nth_flatten witness 8).
  + rewrite allP => w /=; rewrite mapP => Hx. 
    by elim Hx => ww [_ ->]; rewrite W8.size_w2bits. 
  rewrite (nth_map witness) => /=; 1: by  rewrite size_to_list; smt(). 
  rewrite nth_cat size_bits //=.
  case (k < 4);move => *;rewrite /bits /w2bits /= !nth_mkseq /= /#. 

rewrite /decode /BytesToBits /=.
have -> : 3072 = size (flatten (map W8.w2bits (to_list x))); 1:by
 rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /=.
rewrite take_size.
rewrite tP /= => i ib.
rewrite get_of_list 1:ib (nth_map (witness<:bool list>) 0);
1: by  rewrite !size_chunk /=; [ by smt() | ];
  rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= 1:ib. print Array256.tP.
  have /= [<- ]:= (Array256.tP (Array256.init (fun i => bs2int (nth witness (chunk 12 (flatten (map W8.w2bits (to_list x)))) i))) (iteri 128 g witness));[| by apply ib | by smt(Array256.initiE)].
rewrite /of_list -(Array256.init_set witness) -JUtils.iotaredE /=.
do 128!(rewrite iteriS_rw;1: by smt()). 
by rewrite iteri0 /=.
qed.


lemma size_take_le  ['a] (n : int) (s : 'a list):
   0 <= n => size (take n s) = if n <= size s then n else size s
  by smt(size_take).

print size_drop.

lemma size_drop_le ['a] (n : int) (s : 'a list): 
    0 <= n => 0 <= size s - n => size (drop n s) = if 0 <= size s - n then size s - n else 0
by smt(size_drop).

lemma sem_decode12_vec_corr : sem_decode12_vec = op_EncDec_decode12_vec.
proof.
apply fun_ext => x.
rewrite /op_EncDec_decode12_vec /sem_decode12_vec /= /=.
rewrite -sem_decode12_corr /sem_decode12 /= tP => k kb.
rewrite eq_sym Array768.initiE /= 1:kb. 
case (0 <= k && k < 256).
+ move => kbb;rewrite !initiE 1,2:/# /= !(nth_map witness) /=. 
  + rewrite size_chunk // size_take //=; split; 1: smt().
    move => ?; rewrite ifF /BytesToBits /= size_flatten
    /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max //= /#.
  + rewrite size_iota /= size_take //=; split; 1: smt().
    move => ?; rewrite ifF /BytesToBits /= size_flatten
    /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max //= /#.
  + rewrite size_chunk // size_take //=; split; 1: smt().
    move => ?; rewrite ifF /BytesToBits /= size_flatten
    /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max //= /#.
  + rewrite size_iota /= size_take //=; split; 1: smt().
    move => ?; rewrite ifF /BytesToBits /= size_flatten
    /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max //= /# /=.

  congr => //=. 
  have H3072 /= : (size (take 3072 (BytesToBits (to_list ((init ("_.[_]" x)))%Array384)))) =
                3072  by 
      rewrite size_take_le //=;
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
      rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
      rewrite !StdBigop.Bigint.big_constz /=;
      rewrite !count_predT /= size_iota /max //= /#. 
  have H9216 /= : (size (take 9216 (BytesToBits (to_list x)))) =
                9216 by 
      rewrite size_take_le //=;
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
      rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
      rewrite !StdBigop.Bigint.big_constz /=;
      rewrite !count_predT /= size_iota /max //= /#. 
    rewrite H3072 H9216 /=.
   have -> /= : nth witness (iota_ 0 256) k = k by rewrite nth_iota /#. 
   have -> /= : nth witness (iota_ 0 768) k = k by rewrite nth_iota /#. 
  apply (eq_from_nth witness) => //=.
  + rewrite !size_take_le //= !ifT; 1,2:
      by rewrite size_drop_le /= 1:/# ?H3072 ?H9216 /#. 
    by smt().
    
move => i ib.
rewrite !nth_take //; 1,2: by smt(size_take).
rewrite !nth_drop //; 1..4: by smt(). 
rewrite !nth_take //; 1..2: by smt(size_take size_drop).
rewrite /BytesToBits !(nth_flatten witness 8); last first.
+ rewrite !(nth_map witness). admit. rewrite size_iota /=. admit. admit. rewrite size_iota /=. admit.
rewrite !(nth_iota). admit. admit.
congr;congr => /=; rewrite initiE //=. admit.
admit.
admit.

admitted.

lemma sem_decode1K  : cancel op_EncDec_decode1  op_EncDec_encode1.
rewrite /cancel /op_EncDec_encode1 /= => x. 
do 32!(rewrite iteriS_rw;1: by smt()); rewrite iteri0 => //=.
have /= H : forall i, 0 <= i < 32 =>
    iteri 8 (fun (j : int) (r : W8.t) => (of_int (to_uint r + (op_EncDec_decode1 x).[8*i+j] * 2 ^ j))%W8) W8.zero = x.[i]; last first.
  have HH := (Array32.init_set witness (fun i => x.[i])). 
  rewrite {33}(_: x = Array32.init (fun (i : int) => x.[i])).
  + rewrite tP => k kb; rewrite initiE /#.
  by rewrite -HH -JUtils.iotaredE /= -!H //.

move => i ib.
do 8!(rewrite iteriS_rw;1: by smt()); rewrite iteri0 => //=.
rewrite !of_uintK /= -!sem_decode1_corr /sem_decode1 /decode /= !get_of_list 1..8:/#.
do 8!(do (rewrite (nth_map witness); 1: by
   rewrite  size_chunk //= size_take_le //= ifT 2:/#;
    rewrite /BytesToBits size_flatten  /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
      rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
      rewrite !StdBigop.Bigint.big_constz /=;
      rewrite !count_predT /= size_iota /max //= /#); 
 do (rewrite (nth_map witness); 1: by
 rewrite size_iota /= /max size_take_le //= ifT; 
   rewrite /BytesToBits size_flatten  /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
      rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
      rewrite !StdBigop.Bigint.big_constz /=;
      rewrite !count_predT /= size_iota /max //= /#)) => /=. 
have -> /= : (size (take 256 (BytesToBits (to_list x)))) = 256
 by rewrite size_take_le //= ifT 2:/#;
    rewrite /BytesToBits size_flatten  /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
      rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
      rewrite !StdBigop.Bigint.big_constz /=;
      rewrite !count_predT /= size_iota /max //= /#.
rewrite !(nth_iota) 1..8:/# /=. 
do 8!(
rewrite (take_nth false 0) /=;1:
(rewrite size_drop_le 1:/# size_take_le //= ifT 2:/#; 
   rewrite /BytesToBits size_flatten  /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
      rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
      rewrite !StdBigop.Bigint.big_constz /=;
      rewrite !count_predT /= size_iota /max //= /#) => /=).
rewrite !take0 !bs2int_rcons /= !bs2int_nil /= !(modz_small _ 256) /= 1..127:/#. 
rewrite !(nth_drop) /= 1..16:/#.
rewrite !(nth_take) /= 1..16:/#.
rewrite /BytesToBits !(nth_flatten _ 8); 1..8: by 
rewrite allP => k /=; rewrite mapP =>  Hk; elim Hk => l ->; rewrite size_w2bits /=. 
rewrite !(nth_map witness); first 16 by smt(size_iota Array32.size_to_list).
rewrite !(nth_iota); first 8 by smt().
rewrite !W8.get_w2bits /=.
have H : forall j, 0<=j<8 => (8*i+j) %/8 = i by smt().
rewrite !H //=; move : (H 0 _); rewrite //= => ->.
have H1 : forall j, 0<=j<8 => (8*i+j) %%8 = j by smt().
rewrite !H1 //=; move : (H1 0 _); rewrite //= => ->.
rewrite to_uint_eq /= of_uintK /= modz_small 1:/#.
rewrite to_uintE /= /w2bits /=.
do 8!(rewrite mkseqSr_rw //=); rewrite mkseq0 //=.
do 8!(rewrite bs2int_cons /=); rewrite bs2int_nil //=.
by ring.
qed.

lemma sem_decode4K  : cancel op_EncDec_decode4  op_EncDec_encode4.
rewrite /cancel /op_EncDec_encode4 /= => x. 
do 128!(rewrite iteriS_rw;1: by smt()); rewrite iteri0 => //=.
have H : forall i j, 0 <= i < 255 => i%%2 = 0 /\ j=i+1 => W8.of_int ((op_EncDec_decode4 x).[i] + (op_EncDec_decode4 x).[j]*16) = x.[i%/2]; last first.
+ rewrite !H; first 256 by smt().  rewrite /=. 
  have  := (Array128.init_set witness (fun i => x.[i])). 
  rewrite -JUtils.iotaredE /= => ->.
  by rewrite tP => k kb; rewrite initiE //=.
move => i j ib [imod jval]; rewrite jval -sem_decode4_corr /sem_decode4.
rewrite to_uint_eq /= of_uintK /=.
rewrite /decode /BytesToBits !Array256.get_of_list /=; 1,2:smt().
have -> : 1024 = size (flatten (map W8.w2bits (to_list x))); 1:by
 rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /=.
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1,2:
by  rewrite !size_chunk /=; [ by smt() | ];
  rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#. 
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 4 (flatten (map W8.w2bits (to_list x)))) i)) = 4.
    + have  /= [_ ->] := (all_nthP (fun l => size l = 4) (chunk 4 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
    by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 

  have -> : (size (nth witness (chunk 4 (flatten (map W8.w2bits (to_list x)))) (i+1))) = 4. 
    + have  /= [_ ->] := (all_nthP (fun l => size l = 4) (chunk 4 (flatten (map W8.w2bits (to_list x)))) witness); 
         1,3: by smt(List.allP mem_nth size_chunk in_chunk_size size_flatten W8.size_w2bits).
    by rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= size_iota /max /= /#. 

  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (4*i+i0)))).
  + move => k kb /=. 
    rewrite (nth_nth_chunk 4 i k (flatten (map W8.w2bits (to_list x))) false witness false) => //; last by smt(mem_range).
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#.
  rewrite(StdBigop.Bigint.BIA.eq_big_seq (fun (i0 : int) =>
       2 ^ i0 * b2i (nth false (nth witness (chunk 4 (flatten (map W8.w2bits (to_list x)))) (i + 1)) i0)) (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (4*(i+1)+i0)))).
  + move => k kb /=.
    rewrite (nth_nth_chunk 4 (i+1) k (flatten (map W8.w2bits (to_list x))) false witness false) => //; last by smt(mem_range).
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
  rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
  rewrite !StdBigop.Bigint.big_constz /=;
  rewrite !count_predT /= size_iota /max /= /#.
    rewrite -/bs2int. do 4!(rewrite range_ltn /=;1 :smt()). rewrite range_geq //=. 
    do 8!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  rewrite !(nth_flatten false 8) /=; first 8 by  rewrite allP => k /=; smt(mapP W8.size_w2bits).  rewrite /to_uint /bs2int /=. 
   do 8!(rewrite range_ltn /=;1 :smt()). rewrite range_geq //=. 
    do 8!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  rewrite !mulrDl /= -!mulrA !(mulrC _ 16) !mulrA /= !addrA modz_small; 1: by smt().
  rewrite !(mulrC 4 _) (_: 8 = 2*4) 1:/# -!mulz_modl // !divzMpr //. 
  rewrite !divmod_mul // -!(mulrC 4) /=.
  have -> : i %% 2 = 0 by smt().
  have -> : (i + 1) %% 2 = 1 by smt().
  have -> /= : (i + 1) %/ 2 = i %/ 2 by smt().
  have -> : (nth [] (map W8.w2bits (to_list x)) (i %/ 2)) = W8.w2bits x.[i %/ 2].
  rewrite (nth_map witness); 1: by rewrite size_to_list /#. 
  by rewrite get_to_list.
  by rewrite !get_w2bits.
qed.

(* To Do
lemma sem_decode12K : cancel sem_decode12 sem_encode12 by admit.
lemma sem_decode12_vecK  : cancel sem_decode12_vec  sem_encode12_vec  by admit. (* to do *)
*)
(* These have missing preconditions; move to KyberProperties and fix. 
lemma sem_encode4K  : cancel sem_encode4  sem_decode4  by admit. (* to do *)
lemma sem_encode1K  : cancel sem_encode1  sem_decode1  by admit. (* to do *)
lemma sem_encode12_vecK  : cancel sem_encode12_vec  sem_decode12_vec  by admit. (* to do *)
lemma sem_encode10_vecK  : cancel sem_encode10_vec  sem_decode10_vec  by admit. (* to do *)
lemma sem_decode1_bnd a k : 0<=k<256 => 0<= (sem_decode1 a).[k] < 2 by admit. (* to do *)
*)
(* These are all replaced by proc op 
phoare sem_decode12 a : [ EncDec.decode12 : arg = a ==>  res = sem_decode12 a ] = 1%r by admit. (* reify *)
phoare sem_decode4  a : [ EncDec.decode4  : arg = a ==>  res = sem_decode4  a ] = 1%r by admit. (* reify *)
phoare sem_decode1  a : [ EncDec.decode1  : arg = a ==>  res = sem_decode1  a ] = 1%r by admit. (* reify *)
phoare sem_encode12 a : [ EncDec.encode12 : arg = a ==>  res = sem_encode12 a ] = 1%r by admit. (* reify *)
phoare sem_encode4  a : [ EncDec.encode4  : arg = a ==>  res = sem_encode4  a ] = 1%r by admit. (* reify *)
phoare sem_encode1  a : [ EncDec.encode1  : arg = a ==>  res = sem_encode1  a ] = 1%r by admit. (* reify *)

phoare sem_decode12_vec a : [ EncDec.decode12_vec : arg = a ==> res = sem_decode12_vec a ] = 1%r by admit. (* reify *)
phoare sem_decode10_vec a : [ EncDec.decode10_vec : arg = a ==> res = sem_decode10_vec a ] = 1%r by admit. (* reify *)
phoare sem_encode12_vec a : [ EncDec.encode12_vec : arg = a ==> res = sem_encode12_vec a ] = 1%r by admit. (* reify *)
phoare sem_encode10_vec a : [ EncDec.encode10_vec : arg = a ==> res = sem_encode10_vec a ] = 1%r by admit. (* reify *)
*)
