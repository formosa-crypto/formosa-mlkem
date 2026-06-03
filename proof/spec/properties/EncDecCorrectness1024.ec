require import AllCore IntDiv List Ring.

from Jasmin require import JWord.

from JazzEC require import Array25 Array32 Array34 Array64 Array160 Array168 Array256 Array384.
from JazzEC require import Array1024 Array1408 Array1024 Array1088 Array1184 Array1536.

require import GFq Rq Serialization Correctness1024.
require import BitEncoding.
import BitChunking BS2Int.
(*---*) import IntID.
import Serialization1024.

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
rewrite (nth_change_dfl x0 x2) //.
split; smt(JUtils.divz_cmp size_ge0).
qed.

lemma size_BytesToBits l : size (BytesToBits l) = 8 * size l by
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= /= /#. 

lemma size_chunksBytesToBits l k n : 
   0 < k => 0 <= n < 8 * size l %/ k =>
   size ((nth witness (chunk k (BytesToBits l))) n) = k.
move => kb nb.
+ have  /= [_ ->] := (all_nthP (fun l => size l = k) (chunk k (flatten (map W8.w2bits l))) witness); 1,3: by smt(List.allP in_chunk_size).
   by  rewrite !size_chunk /=; [ by smt() | ];
     rewrite size_flatten /= StdBigop.Bigint.sumzE /= -map_comp /(\o) /=;
     rewrite !StdBigop.Bigint.BIA.big_mapT /= /(\o) /=;
     rewrite !StdBigop.Bigint.big_constz /=;
     rewrite !count_predT /= /#. 
qed.

lemma size_take_le  ['a] (n : int) (s : 'a list):
   0 <= n => size (take n s) = if n <= size s then n else size s
  by smt(size_take).

lemma size_drop_le ['a] (n : int) (s : 'a list): 
    0 <= n => 0 <= size s - n => size (drop n s) = if 0 <= size s - n then size s - n else 0
by smt(size_drop).

lemma pow2_8 : 2^8 = 256 by [].

lemma subarray384K0 (a b c d : W8.t Array384.t):
   subarray384
        (fromarray384 a b c d) 0 = a.
proof.
rewrite /subarray384 /fromarray384 tP => k kb.
by rewrite initiE 1:/# /= initiE 1:/# /= /= kb /=.
qed.

lemma subarray384K1 (a b c d : W8.t Array384.t):
   subarray384
        (fromarray384 a b c d) 1 = b.
proof.
rewrite /subarray384 /fromarray384 tP => k kb.
by rewrite initiE 1:/# /= initiE 1:/# /= /= ifF /#. 
qed.

lemma subarray384K2 (a b c d : W8.t Array384.t):
   subarray384
        (fromarray384 a b c d) 2 = c.
proof.
rewrite /subarray384 /fromarray384 tP => k kb.
by rewrite initiE 1:/# /= initiE 1:/# /= /= ifF /#. 
qed.

lemma subarray384K3 (a b c d : W8.t Array384.t):
   subarray384
        (fromarray384 a b c d) 3 = d.
proof.
rewrite /subarray384 /fromarray384 tP => k kb.
by rewrite initiE 1:/# /= initiE 1:/# /= /= ifF /#. 
qed.

lemma fromarray256K ['a] (x : 'a Array1024.t) :
     fromarray256 (subarray256 x 0) 
                  (subarray256 x 1)
                  (subarray256 x 2)
                  (subarray256 x 3) = x.
 rewrite /fromarray256 /subarray256; rewrite tP => k kb; rewrite initiE 1:/# /=.
 case(0<=k<256); 1: by move => *; rewrite initiE /#.
 case(256<=k<512); 1: by move => *; rewrite initiE /#.
 case(512<=k<768); by move => *; rewrite initiE /#.
qed.


lemma BitsToBytesK x : 8 %| size x => BytesToBits (BitsToBytes x) = x.
move => Hx.
rewrite /BitsToBytes /BytesToBits.
rewrite -map_comp /(\o) /=.
have [H _]:= (eq_in_map (fun (x0 : bool list) => w2bits (W8.bits2w x0)) idfun (chunk 8 x)).
rewrite H;1: by move => x0 memX0 /=; rewrite W8.bits2wK; smt(in_chunk_size).
rewrite map_id chunkK //.
qed.

lemma BytesToBitsK x : (BitsToBytes (BytesToBits x)) = x.
rewrite /BitsToBytes /BytesToBits.
rewrite flattenK;1,2: smt(mapP W8.size_w2bits).
rewrite -map_comp /(\o).
have [H _]:= (eq_in_map (fun (x0 : W8.t) => W8.bits2w (W8.w2bits x0)) idfun x).
rewrite H;1: by move => x0 memX0 /=.
by smt(map_id).
qed.

lemma encodeK n l : 
    1 <= n <= 12 => 8 %| n*size l => all (fun i => 0 <= i < 2^n) l => l  = (decode n) (encode n l).
move => Hn Hsize Hrng.
rewrite /encode /decode /cancel.
have Hsize' : size l = size (map bs2int (chunk n (BytesToBits (BitsToBytes (flatten (map (int2bs n) l)))))).
+ rewrite size_map BitsToBytesK. 
  + rewrite (EclibExtra.size_flatten' n);1:by smt(mapP size_int2bs).
    rewrite size_map /#. 
  rewrite size_chunk 1:/#.
  rewrite (EclibExtra.size_flatten' n);1:by smt(mapP size_int2bs).
  by rewrite size_map mulrC mulzK /#.
apply (eq_from_nth witness);1: by exact Hsize'.
move => i ib.
rewrite  (nth_map []); 1:smt(size_map).
rewrite BitsToBytesK. 
+ rewrite (EclibExtra.size_flatten' n);1:by smt(mapP size_int2bs).
  by rewrite size_map /#.
rewrite JWordList.nth_chunk 1,2:/#.
+ rewrite (EclibExtra.size_flatten' n);1:by smt(mapP size_int2bs).
  rewrite size_map (: n*i + n = n * (i+1)) 1:/#. 
  by apply StdOrder.IntOrder.ler_pmul2l; smt(). 
have -> : (take n (drop (n * i) (flatten (map (int2bs n) l)))) = (nth [] (map (int2bs n) l) i); last first.
- rewrite (nth_map witness) // int2bsK 1:/# //.
  by move/List.allP: Hrng; apply; rewrite mem_nth.
apply (eq_from_nth witness).
+ rewrite size_take_le 1:/# ifT.
  + rewrite size_drop 1:/# (EclibExtra.size_flatten' n);1:smt(mapP size_int2bs). 
    rewrite size_map /max (: n * size l - n * i = n * (size l - i)) 1:/#.
    rewrite (: 0 < n * (size l - i)) /=;1:smt(StdOrder.IntOrder.divr_gt0). 
    have := StdOrder.IntOrder.ler_pmul2l n _ 1 (size l -i);smt().
    by rewrite (nth_map witness _ _ _ _ ib) size_int2bs /#.    
move => ii iib. 
have ? : size (take n (drop (n * i) (flatten (map (int2bs n) l)))) = n. 
rewrite size_take_le 1:/# ifT //. 
  + rewrite size_drop 1:/# (EclibExtra.size_flatten' n);1:smt(mapP size_int2bs). 
    rewrite size_map /max (: n * size l - n * i = n * (size l - i)) 1:/#.
    rewrite (: 0 < n * (size l - i)) /=.
    have := StdOrder.IntOrder.divr_gt0 n (size l - i) _ _;1..3:smt(). 
    by have := StdOrder.IntOrder.ler_pmul2l n _ 1 (size l -i);smt().
have {2}-> : ii = (i*n + ii) %% n by rewrite modzMDl modz_small; smt().
have {2}-> : i = (i*n + ii) %/ n by smt().
rewrite -nth_flatten;1: by rewrite allP => x; rewrite mapP => He /=;elim He;smt(size_int2bs).
rewrite nth_take 1,2:/# nth_drop 1,2:/#. 
by smt().
qed.

lemma size_decode k n l :
 1 <= k <= 4  =>
 1 <= n <= 12 => size l = k*32*n =>  size (decode n l) = k*256. 
move => Hn Hsize.
rewrite /decode size_map size_chunk 1:/# /BytesToBits (EclibExtra.size_flatten' 8);1:smt(mapP W8.size_w2bits).
by rewrite size_map /#.
qed.

lemma size_encode k n l :
 1 <= k <= 4  =>
 1 <= n <= 12 => size l = k*256 =>  size (encode n l) = k*32*n. 
move => Hn Hsize.
rewrite /encode size_map size_chunk 1:/# /BytesToBits (EclibExtra.size_flatten' n); 1:smt(mapP size_int2bs).
by rewrite size_map /#.
qed.


lemma size_BytesToBits_list l : 
  size (BytesToBits l) = 8*size l.
rewrite /BytesToBits (EclibExtra.size_flatten' 8).
+ move => x; rewrite mapP => He; elim He;smt(W8.size_w2bits).
by rewrite size_map.
qed.

lemma decodeK n l :
  1 <= n <= 12 => n %| 8*size l => l = (encode n) (decode n l).
move => Hn Hsize.
rewrite /encode /decode /cancel.
have Hsize' : size l = size (BitsToBytes (flatten (map (int2bs n) (map bs2int (chunk n (BytesToBits l)))))).
+ rewrite /BitsToBytes size_map size_chunk 1:/# (EclibExtra.size_flatten' n).
  + move => x; rewrite mapP => He;elim He.
    smt(size_int2bs).
  rewrite !size_map size_iota /BytesToBits (EclibExtra.size_flatten' 8).
  + move => x; rewrite mapP => He;elim He.
    smt(W8.size_w2bits).
  rewrite size_map.
  rewrite /max;case (0 < 8 * size l %/ n);1:smt().
  smt(divz_ge0 size_ge0).
rewrite -map_comp /(\o). 
have [ H _] := eq_in_map (fun (x : bool list) => int2bs n (bs2int x)) idfun (chunk n (BytesToBits l)).
rewrite H /=; 1:smt(in_chunk_size bs2intK).
rewrite map_id chunkK 1:/#. 
rewrite size_BytesToBits_list /#.
by rewrite BytesToBitsK.
qed.

lemma sem_decode1K  : cancel decode1  encode1.
rewrite /cancel /encode1 /decode1 => x.
rewrite of_listK;1: by rewrite (size_decode 1); [by smt() | by smt()| by rewrite Array32.size_to_list /= | ].
rewrite -decodeK 1:/#;1:smt().
by apply Array32.to_listK.
qed.


lemma sem_decode5K  : cancel decode5  encode5.
rewrite /cancel /encode5 /decode5 => x.
rewrite of_listK;1: by rewrite (size_decode 1); [by smt() | by smt()|  by rewrite Array160.size_to_list /= | ].
rewrite -decodeK 1:/#;1:smt(Array160.size_to_list).
by apply Array160.to_listK.
qed.

lemma sem_decode12K  : cancel decode12  encode12.
rewrite /cancel /encode12 /decode12 => x.
rewrite of_listK;1: by rewrite (size_decode 1); [by smt() | by smt()|  by rewrite Array384.size_to_list /= | ].
rewrite -decodeK 1:/#;1: smt(Array384.size_to_list).
by apply Array384.to_listK.
qed.

lemma subarray256K ['a] (a b c d : 'a Array256.t) :
     subarray256 (fromarray256 a b c d) 0 = a /\
     subarray256 (fromarray256 a b c d) 1 = b /\
     subarray256 (fromarray256 a b c d) 2 = c /\
     subarray256 (fromarray256 a b c d) 3 = d
by rewrite /subarray256 /fromarray256 !tP;do split => k kb; rewrite initiE 1:kb /= initiE 1:/# /=;[rewrite ifT 1:/# | 
                          rewrite ifF 1:/# ifT 1:/# |
                          rewrite ifF 1:/# ifF 1:/# ifT 1:/# |
                          rewrite !ifF 1..3:/# ].

lemma fromarray384K ['a] (x : 'a Array1536.t) :
     fromarray384 (subarray384 x 0) 
                  (subarray384 x 1)
                  (subarray384 x 2)
                  (subarray384 x 3) = x.
proof.
rewrite /subarray384 /fromarray384 tP => k kb.
rewrite initiE 1:kb /=;smt(Array384.initiE).
qed.

lemma sem_decode12_vecK  : cancel decode12_vec  encode12_vec.
rewrite /cancel /encode12_vec /decode12_vec => x.
apply tP => k kb.
rewrite get_of_list //. 
rewrite of_listK /=;1: by rewrite (size_decode 4) /=;  [by smt() | by smt()|  by rewrite Array1536.size_to_list /= | ].
rewrite -decodeK 1:/#;1: smt(Array1536.size_to_list). 
rewrite (nth_change_dfl witness W8.zero);1: smt(Array1536.size_to_list). 
by smt().
qed.

lemma sem_decode11_vecK  : cancel decode11_vec  encode11_vec.
rewrite /cancel /encode11_vec /decode11_vec => x.
apply Array1408.tP => k kb.
rewrite get_of_list //. 
rewrite of_listK /=;1: by rewrite (size_decode 4) /=;  [by smt() | by smt()|  by rewrite Array1408.size_to_list /= | ].
rewrite -decodeK 1:/#;1: smt(Array1408.size_to_list). 
rewrite (nth_change_dfl witness W8.zero);1: smt(Array1408.size_to_list). 
by smt().
qed.


lemma sem_encode1K (x : ipoly) : 
   (forall i, 0 <= i < 256 => 0 <= x.[i] < 2) =>
     x = (decode1 (encode1 x)).
move => Hi;rewrite /encode1 /decode1.
apply Array256.tP => k kb.
rewrite get_of_list // of_listK; 1: by rewrite (size_encode 1) /=;  [by smt() | by smt()|  by rewrite Array256.size_to_list /= | ].
rewrite -encodeK 1:/#;[smt(Array256.size_to_list) | rewrite /= allP /= /to_list;smt(mkseqP) | ].
rewrite -(get_to_list ).
by rewrite (nth_change_dfl witness 0);1: smt(Array256.size_to_list). 
qed.

lemma sem_encode5K (x : ipoly) : 
   (forall i, 0 <= i < 256 => 0 <= x.[i] < 32) =>
     x =  decode5 (encode5 x).
move => Hi;rewrite /encode5 /decode5.
apply Array256.tP => k kb.
rewrite get_of_list // of_listK; 1: by rewrite (size_encode 1) /=;  [by smt() | by smt()|  by rewrite Array256.size_to_list /= | ].
rewrite -encodeK 1:/#;[smt(Array256.size_to_list) | rewrite /= allP /= /to_list;smt(mkseqP) | ].
rewrite -(get_to_list ).
by rewrite (nth_change_dfl witness 0);1: smt(Array256.size_to_list). 
qed.

lemma sem_encode11_vecK (x : ipolyvec) : 
   (forall i, 0 <= i < 1408 => 0 <= x.[i] < 1408) =>
     x =  decode11_vec (encode11_vec x).
move => Hi;rewrite /encode10_vec /decode10_vec.
apply Array1024.tP => k kb.
rewrite get_of_list // of_listK; 1: by rewrite (size_encode 4) /=;  [by smt() | by smt()|  by rewrite Array1024.size_to_list /= | ].
rewrite -encodeK 1:/#;[smt(Array1024.size_to_list) | rewrite /= allP /= /to_list;smt(mkseqP) | ].
rewrite -(get_to_list ).
by rewrite (nth_change_dfl witness 0);1: smt(Array1024.size_to_list). 
qed.


lemma sem_encode12_vecK (x : ipolyvec) : 
   (forall i, 0 <= i < 1024 => 0 <= x.[i] < 4096) =>
     x =  decode12_vec (encode12_vec x).
move => Hi;rewrite /encode12_vec /decode12_vec.
apply Array1024.tP => k kb.
rewrite get_of_list // of_listK; 1: by rewrite (size_encode 4) /=;  [by smt() | by smt()|  by rewrite Array1024.size_to_list /= | ].
rewrite -encodeK 1:/#;[smt(Array1024.size_to_list) | rewrite /= allP /= /to_list;smt(mkseqP) | ].
rewrite -(get_to_list ).
by rewrite (nth_change_dfl witness 0);1: smt(Array1024.size_to_list). 
qed.

require import BitEncoding.  
import BS2Int BitChunking.
lemma sem_decode1_bnd a k : 0<=k<256 => 0<= (decode1 a).[k] < 2.
move => ?; rewrite /decode1 get_of_list // /decode (nth_map witness).
+ by rewrite size_chunk 1:/# size_BytesToBits size_to_list //=.
have := bs2int_le2Xs (nth witness (chunk 1 (BytesToBits (to_list a))) k).
rewrite size_nth_chunk //=;1: by rewrite size_BytesToBits size_to_list //=.
by smt(bs2int_ge0).
qed.
