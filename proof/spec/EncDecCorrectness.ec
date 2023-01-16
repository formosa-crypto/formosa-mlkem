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

module EncDecAux = {

  proc encode10_vec_aux(u : ipolyvec) : W8.t Array960.t = {
      var c : W8.t Array960.t;
      var i,j,t0,t1,t2,t3;
      c <- witness;
      i <- 0; 
      while (i < 768) {
         j <- i %/ 4 * 5;
         t0 <- u.[i];
         t1 <- u.[i + 1];
         t2 <- u.[i + 2];
         t3 <- u.[i + 3];
         c.[j] <- W8.of_int t0; 
         c.[j+1] <-  W8.of_int (t0 %/ 2^8 + t1 * 2^2); 
         c.[j+2] <-  W8.of_int (t1 %/ 2^6 + t2 * 2^4); 
         c.[j+3] <-  W8.of_int (t2 %/ 2^4 + t3 * 2^6); 
         c.[j+4] <-  W8.of_int (t3 %/ 2^2);
         i <- i + 4;
      }
      return c;
   }

   proc decode10_vec_aux(u : W8.t Array960.t) : ipolyvec = {
      var c : ipolyvec;
      var i,j,t0,t1,t2,t3,t4;
      c <- witness;
      i <- 0; 
      while (i < 768) {
         j <- i %/ 4 * 5;
         t0 <- u.[j]; t1 <- u.[j + 1]; t2 <- u.[j + 2]; t3 <- u.[j + 3]; t4 <- u.[j + 4];
         c.[i] <- to_uint t0 + (to_uint t1 %% 2^2) * 2^8;
         c.[i + 1] <-  to_uint t1 %/ 2^2 + (to_uint t2 %% 2^4) * 2^6;
         c.[i + 2] <-  to_uint t2 %/ 2^4 + (to_uint t3 %% 2^6) * 2^4;
         c.[i + 3] <-  to_uint t3 %/ 2^6 + (to_uint t4) * 2^2;
         i <- i + 4;
      }
      return c;
   }

proc decode12_aux(a : W8.t Array384.t) : ipoly = {
    var i : int;
    var r : ipoly;
    
    r <- witness;
    i <- 0;
    while (i < 128){
      r.[i * 2 + 0] <- to_uint a.[3 * i] + to_uint a.[3 * i + 1] %% 2 ^ 4 * W8.modulus;
      r.[i * 2 + 1] <- to_uint a.[3 * i + 2] * 2 ^ 4 + to_uint a.[3 * i + 1] %/ 2 ^ 4;
      i <- i + 1;
    }
    
    return r;
  }

  proc encode12_aux(a : ipoly) : W8.t Array384.t = {
    var fi1 : int;
    var fi2 : int;
    var i : int;
    var j : int;
    var r : W8.t Array384.t;
    
    r <- witness;
    j <- 0;
    i <- 0;
    while (i < 256){
      fi1 <- a.[i];
      fi2 <- a.[i + 1];
      r.[j] <- (of_int fi1)%W8;
      j <- j + 1;
      r.[j] <- (of_int (fi2 %% 2 ^ 4 * 2 ^ 4 + fi1 %/ W8.modulus))%W8;
      j <- j + 1;
      r.[j] <- (of_int (fi2 %/ 2 ^ 4))%W8;
      j <- j + 1;
      i <- i + 2;
    }
    
    return r;
  }

proc encode12_vec_aux(a : ipolyvec) : W8.t t = {
    var a1 : W8.t Array384.t;
    var a2 : W8.t Array384.t;
    var a3 : W8.t Array384.t;
    
    a1 <@ encode12_aux(subarray256 a 0);
    a2 <@ encode12_aux(subarray256 a 1);
    a3 <@ encode12_aux(subarray256 a 2);
    
    return fromarray384 a1 a2 a3;
  }

proc decode12_vec_aux(a : W8.t t) : ipolyvec = {
    var a1 : ipoly;
    var a2 : ipoly;
    var a3 : ipoly;
    
    a1 <@ decode12_aux(subarray384 a 0);
    a2 <@ decode12_aux(subarray384 a 1);
    a3 <@ decode12_aux(subarray384 a 2);
    
    return fromarray256 a1 a2 a3;
  }
}.



(* We just need to worry about the aux ones, since procs are equivalent.
   This is because the loop structure is too far fetched for proc op. *)
equiv decode10_vec_aux : 
   EncDec.decode10_vec ~ EncDecAux.decode10_vec_aux : ={arg} ==> ={res}.
proc. 
wp; while (={i,c,u} /\ 0 <= i{1} <= 768 /\ i{1} %% 4 = 0 /\ j{1} = i{1} %/ 4 * 5); last by auto => /> /#.
by auto => /> /#. 
qed.

equiv encode10_vec_aux : 
   EncDec.encode10_vec ~ EncDecAux.encode10_vec_aux : ={arg} ==> ={res}.
proc. 
wp; while (={i,c,u} /\ 0 <= i{1} <= 768 /\ i{1} %% 4 = 0 /\ j{1} = i{1} %/ 4 * 5); last by auto => /> /#.
by auto => /> /#. 
qed.

equiv decode12_vec_aux : 
   EncDec.decode12_vec ~ EncDecAux.decode12_vec_aux : ={arg} ==> ={res} by sim.

equiv encode12_vec_aux : 
   EncDec.encode12_vec ~ EncDecAux.encode12_vec_aux : ={arg} ==> ={res} by sim.

(* These come directly from the code. We need to show
   that decode implements the same thing, and then show
   that encode inverts them. *)
proc op encode4 = EncDec.encode4.
proc op encode1 = EncDec.encode1.
proc op encode10_vec_aux = EncDecAux.encode10_vec_aux.
proc op encode12_aux = EncDec.encode12.
proc op encode12_vec_aux = EncDecAux.encode12_vec_aux.

proc op decode4 = EncDec.decode4.
proc op decode1 = EncDec.decode1.
proc op decode10_vec_aux = EncDecAux.decode10_vec_aux.
proc op decode12_aux = EncDecAux.decode12_aux.
proc op decode12_vec_aux = EncDecAux.decode12_vec_aux.

(* These ones still require inlining *)
op op_EncDec_encode12_vec(a : ipolyvec) : W8.t Array1152.t =
   fromarray384 (encode12_aux (subarray256 a 0))
                (encode12_aux (subarray256 a 1))
                (encode12_aux (subarray256 a 2)).

lemma sem_op_EncDec_encode12_vec _a :
  encode12_vec_aux _a = op_EncDec_encode12_vec _a
     by rewrite /encode12_vec_aux /op_EncDec_encode12_vec /=.
   

op op_EncDec_decode12_vec(a : W8.t Array1152.t) : ipolyvec = 
   fromarray256 (decode12_aux (subarray384 a 0))
                (decode12_aux (subarray384 a 1))
                (decode12_aux (subarray384 a 2)).

lemma sem_op_EncDec_decode12_vec _a :
  decode12_vec_aux _a = op_EncDec_decode12_vec _a
     by rewrite /decode12_vec_aux /op_EncDec_decode12_vec /=.

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

lemma sem_decode1_corr : sem_decode1 = decode1.
proof.
apply fun_ext => x.
rewrite /decode1 /sem_decode1 /=. 
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
       by smt(size_BytesToBits size_chunk Array32.size_to_list).
  move => b Hb; have : b = x.[i].[j]; last by  move => <-; rewrite Hb bs2int_cons bs2int_nil /=.
  have ->  : (b = nth witness [b] 0) by auto.
  rewrite -Hb. 
  rewrite (nth_nth_chunk 1 (8 * i + j) 0 (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1,3: by smt().
       by smt(size_BytesToBits size_chunk Array32.size_to_list).
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
have -> : 256 = size (flatten (map W8.w2bits (to_list x))); 
   1:        by smt(size_BytesToBits size_chunk Array32.size_to_list).
rewrite take_size.
rewrite tP /= => i ib.
rewrite get_of_list 1:ib (nth_map (witness<:bool list>) 0);
1: by  rewrite !size_chunk /=;        by smt(size_BytesToBits size_chunk Array32.size_to_list).
  have /= [<- ]:= (Array256.tP (Array256.init (fun i => bs2int (nth witness (chunk 1 (flatten (map W8.w2bits (to_list x)))) i))) (iteri 32 g witness));[| by apply ib | by smt(Array256.initiE)].
rewrite /of_list -(Array256.init_set witness) -JUtils.iotaredE /=.
do 32!(rewrite iteriS_rw;1: by smt()). 
by rewrite iteri0 /=.
qed.


lemma sem_decode4_corr : sem_decode4 = decode4.
proof.
apply fun_ext => x.
rewrite /decode4 /sem_decode4 /=. 
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
  + rewrite size_bits //;  by smt(size_chunksBytesToBits size_chunk Array128.size_to_list).
   move => k; rewrite size_bits //= => kb.
    rewrite (nth_nth_chunk 4 (2 * i) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1..3:  by smt(size_BytesToBits Array128.size_to_list).

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
  + rewrite size_bits //; by smt(size_chunksBytesToBits Array128.size_to_list).

    move => k; rewrite size_bits //= => kb.
    case (k < 4); last first. 
    + move => H; rewrite !nth_default;
       by smt(size_bits size_BytesToBits size_chunk Array128.size_to_list).
    move => *;rewrite (nth_nth_chunk 4 (2 * i + 1) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=;1..3:by smt(size_BytesToBits Array128.size_to_list).
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
have -> : 1024 = size (flatten (map W8.w2bits (to_list x))); 
   1:by smt(size_BytesToBits Array128.size_to_list).
rewrite take_size tP /= => i ib.
rewrite get_of_list 1:ib (nth_map (witness<:bool list>) 0);
1: by  rewrite !size_chunk /=; by smt(size_BytesToBits Array128.size_to_list).
  have /= [<- ]:= (Array256.tP (Array256.init (fun i => bs2int (nth witness (chunk 4 (flatten (map W8.w2bits (to_list x)))) i))) (iteri 128 g witness));[| by apply ib | by smt(Array256.initiE)].
rewrite /of_list -(Array256.init_set witness) -JUtils.iotaredE /=.
do 128!(rewrite iteriS_rw;1: by smt()). 
by rewrite iteri0 /=.
qed.

lemma sem_decode1K  : cancel decode1  encode1.
rewrite /cancel /encode1 /= => x. 
do 32!(rewrite iteriS_rw;1: by smt()); rewrite iteri0 => //=.
have /= H : forall i, 0 <= i < 32 =>
    iteri 8 (fun (j : int) (r : W8.t) => (of_int (to_uint r + (decode1 x).[8*i+j] * 2 ^ j))%W8) W8.zero = x.[i]; last first.
  have HH := (Array32.init_set witness (fun i => x.[i])). 
  rewrite {33}(_: x = Array32.init (fun (i : int) => x.[i])).
  + rewrite tP => k kb; rewrite initiE /#.
  by rewrite -HH -JUtils.iotaredE /= -!H //.

move => i ib.
do 8!(rewrite iteriS_rw;1: by smt()); rewrite iteri0 => //=.
rewrite !of_uintK /= -!sem_decode1_corr /sem_decode1 /decode /= !get_of_list 1..8:/#.
do 8!(
do ((rewrite (nth_map witness);
   1: rewrite  size_chunk //=;1: smt(size_take_le size_BytesToBits Array32.size_to_list))); 
do ((rewrite (nth_map witness);
   1: rewrite  size_iota //=;1: smt(size_take_le size_BytesToBits Array32.size_to_list)))). 
have -> /= : (size (take 256 (BytesToBits (to_list x)))) = 256 by smt(size_take_le size_BytesToBits Array32.size_to_list).
rewrite !(nth_iota) 1..8:/# /=. 
do 8!(
rewrite (take_nth false 0) /=; 1: by 
rewrite size_drop_le 1:/# size_take_le //=; smt(size_BytesToBits Array32.size_to_list)). 
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

lemma sem_decode4K  : cancel decode4  encode4.
rewrite /cancel /encode4 /= => x. 
do 128!(rewrite iteriS_rw;1: by smt()); rewrite iteri0 => //=.
have H : forall i j, 0 <= i < 255 => i%%2 = 0 /\ j=i+1 => W8.of_int ((decode4 x).[i] + (decode4 x).[j]*16) = x.[i%/2]; last first.
+ rewrite !H; first 256 by smt().  rewrite /=. 
  have  := (Array128.init_set witness (fun i => x.[i])). 
  rewrite -JUtils.iotaredE /= => ->.
  by rewrite tP => k kb; rewrite initiE //=.

move => i j ib [imod jval]; rewrite jval -sem_decode4_corr /sem_decode4.
rewrite to_uint_eq /= of_uintK /=.
rewrite /decode /BytesToBits !Array256.get_of_list /=; 1,2:smt().
have -> : 1024 = size (flatten (map W8.w2bits (to_list x))); 
  1: smt(size_BytesToBits Array128.size_to_list).
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1,2:
by  rewrite !size_chunk /=; smt(size_BytesToBits Array128.size_to_list). 
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 4 (flatten (map W8.w2bits (to_list x)))) i)) = 4 by
    smt(size_chunksBytesToBits Array128.size_to_list).

  have -> : (size (nth witness (chunk 4 (flatten (map W8.w2bits (to_list x)))) (i+1))) = 4 by
       smt(size_chunksBytesToBits Array128.size_to_list).

  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (4*i+i0)))).
  + move => k kb /=. 
    rewrite (nth_nth_chunk 4 i k (flatten (map W8.w2bits (to_list x))) false witness false) => //; last by smt(mem_range).
    smt(size_BytesToBits Array128.size_to_list).

  rewrite(StdBigop.Bigint.BIA.eq_big_seq (fun (i0 : int) =>
       2 ^ i0 * b2i (nth false (nth witness (chunk 4 (flatten (map W8.w2bits (to_list x)))) (i + 1)) i0)) (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (4*(i+1)+i0)))).
  + move => k kb /=.
    rewrite (nth_nth_chunk 4 (i+1) k (flatten (map W8.w2bits (to_list x))) false witness false) => //; last by smt(mem_range).
    smt(size_BytesToBits Array128.size_to_list).

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


lemma sem_decode12_corr : sem_decode12 = decode12_aux.
proof.
apply fun_ext => x.
rewrite /decode12_aux /sem_decode12 /=.
pose f := fun i j => bs2int (nth witness (chunk 12 (flatten (map W8.w2bits (to_list x)))) (2*i+j)).
pose g := (fun (i : int) (r : ipoly) => r.[i * 2 <- f i 0].[i * 2 + 1 <- f i 1]).
rewrite (eq_iteri _ g  _ _).
+ move => i a ib /=;rewrite /g /= /f /=.
  congr;[congr |]. 
  + have //= -> := W8.to_uint_bits.
    have //= <- := W8.bits_divmod (x.[3*i+1]) 0 4.
    rewrite (mulrC _ 256).
    have -> : 256 = 2^(size ((bits x.[3 * i] 0 8))); 1: by rewrite size_bits //=.
    have /= <- := bs2int_cat (bits x.[3 * i] 0 8) (bits x.[3 * i + 1] 0 4).
    congr; apply (eq_from_nth witness); 1: by
        smt(size_cat W8.size_bits size_chunksBytesToBits Array384.size_to_list).
    move => k; rewrite size_cat !size_bits //= => kb.
    rewrite (nth_nth_chunk 12 (2 * i) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
       1..3:by smt(size_BytesToBits Array384.size_to_list).
  rewrite (nth_flatten witness 8);1: smt(List.allP List.mapP W8.size_w2bits). 
  rewrite (nth_map witness) => /=; 1: by  rewrite size_to_list; smt(). 
  by rewrite nth_cat size_bits //=;smt(nth_mkseq). 

+ have //= -> := W8.to_uint_bits.
  have //= := W8.bits_divmod (x.[3*i+1]) 4 4; rewrite modz_small /=; 
    1: smt(W8.to_uint_cmp JUtils.pow2_8). 
  move => <-;  rewrite (mulrC _ 16) (addrC _ (bs2int (bits x.[3 * i + 1] 4 4))).
  have -> : 16 = 2^(size ((bits x.[3 * i + 1] 4 4))); 1: by rewrite size_bits //=.
  have /= <- := bs2int_cat (bits x.[3 * i + 1] 4 4) (bits x.[3 * i + 2] 0 8).
  congr; apply (eq_from_nth witness).
 + rewrite size_cat !size_bits //=;
     1: by smt(size_cat W8.size_bits size_chunksBytesToBits Array384.size_to_list).
  move => k; rewrite size_cat !size_bits //= => kb.
  rewrite (nth_nth_chunk 12 (2 * i + 1) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
       1..3:by smt(size_BytesToBits Array384.size_to_list).
  rewrite (nth_flatten witness 8);1: smt(List.allP List.mapP W8.size_w2bits). 
  rewrite (nth_map witness) => /=; 1: by  rewrite size_to_list; smt(). 
  by rewrite nth_cat size_bits //=;smt(nth_mkseq). 

rewrite /decode /BytesToBits /=.
have -> : 3072 = size (flatten (map W8.w2bits (to_list x))); 1:by smt(size_BytesToBits Array384.size_to_list).
rewrite take_size tP /= => i ib.
rewrite get_of_list 1:ib (nth_map (witness<:bool list>) 0); 1: by smt(size_chunk size_BytesToBits Array384.size_to_list).
have /= [<- ]:= (Array256.tP (Array256.init (fun i => bs2int (nth witness (chunk 12 (flatten (map W8.w2bits (to_list x)))) i))) (iteri 128 g witness));[| by apply ib | by smt(Array256.initiE)].
rewrite /of_list -(Array256.init_set witness) -JUtils.iotaredE /=.
do 128!(rewrite iteriS_rw;1: by smt()). 
by rewrite iteri0 /=.
qed.

lemma sem_decode12K  : cancel decode12_aux  encode12_aux.
rewrite /cancel /encode12_aux /= => x. 
do 128!(rewrite iteriS_rw;1: by smt()); rewrite iteri0 => //=.

have H : forall i j, 0 <= i < 256 => i%%2 = 1 => j=i-1 => W8.of_int ((decode12_aux x).[i] %% 16 * 16 + (decode12_aux x).[j] %/ 256) = x.[12*i %/ 8]; last first.
  + do 128!(rewrite H 1..3:/# /=). 

have H1 : forall i, 0 <= i < 256 => i%%2 = 0 =>  W8.of_int (decode12_aux x).[i] = x.[12*i %/ 8 ]; last first.
  + do 128!(rewrite H1 1..2:/# /=). 

have H2 : forall i, 0 <= i < 256 => i%%2 = 1 =>  W8.of_int ((decode12_aux x).[i] %/ 16) = x.[12*i %/ 8 + 1]; last first.
  + do 128!(rewrite H2 1..2:/# /=). 

  have  := (Array384.init_set witness (fun i => x.[i])).
  rewrite -JUtils.iotaredE /= => ->.
  by rewrite tP => k kb; rewrite initiE //=.

move => i ib imod; rewrite -sem_decode12_corr /sem_decode12.
rewrite to_uint_eq /= of_uintK /=.
rewrite /decode /BytesToBits !Array256.get_of_list /=; 1:smt().
have -> : 3072 = size (flatten (map W8.w2bits (to_list x))) by smt(Array384.size_to_list size_BytesToBits).
rewrite take_size /= !(nth_map (witness<:bool list>) 0); 1:
   by  rewrite !size_chunk /=;by smt(Array384.size_to_list size_BytesToBits).
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 12 (flatten (map W8.w2bits (to_list x)))) i)) = 12 by smt(size_chunksBytesToBits Array384.size_to_list).

  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (12*i+i0)))).
  + move => k kb /=; rewrite (nth_nth_chunk 12 i k (flatten (map W8.w2bits (to_list x))) false witness false) => //;  by smt(Array384.size_to_list size_BytesToBits mem_range).
    do 12!(rewrite range_ltn /=;1 :smt()); rewrite range_geq //=. 
    do 12!(rewrite StdBigop.Bigint.BIA.big_consT /=); rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  rewrite !(nth_flatten false 8) /=; first 12 by  rewrite allP => k /=; smt(mapP W8.size_w2bits). 
 rewrite /to_uint /bs2int /=. 
   do 8!(rewrite range_ltn /=;1 :smt()). rewrite range_geq //=. 
    do 8!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  do 12!(
  do 1!(rewrite (nth_map witness); 1: by rewrite size_to_list /#); 
  do 1!(rewrite (nth_map witness); 1: by rewrite size_iota /#)). 
  rewrite !nth_iota 1..12:/#. 
  by rewrite !get_w2bits /=; smt().

move => i ib imod; rewrite -sem_decode12_corr /sem_decode12.
rewrite to_uint_eq /= of_uintK /=.
rewrite /decode /BytesToBits !Array256.get_of_list /=; 1:smt().
have -> : 3072 = size (flatten (map W8.w2bits (to_list x))) by smt(Array384.size_to_list size_BytesToBits).
rewrite take_size /= !(nth_map (witness<:bool list>) 0); 1:
   by  rewrite !size_chunk /=;by smt(Array384.size_to_list size_BytesToBits).
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 12 (flatten (map W8.w2bits (to_list x)))) i)) = 12 by smt(size_chunksBytesToBits Array384.size_to_list).

  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (12*i+i0)))).
  + move => k kb /=; rewrite (nth_nth_chunk 12 i k (flatten (map W8.w2bits (to_list x))) false witness false) => //;  by smt(Array384.size_to_list size_BytesToBits mem_range).
    do 12!(rewrite range_ltn /=;1 :smt()); rewrite range_geq //=. 
    do 12!(rewrite StdBigop.Bigint.BIA.big_consT /=); rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  rewrite !(nth_flatten false 8) /=; first 12 by  rewrite allP => k /=; smt(mapP W8.size_w2bits). 
 rewrite /to_uint /bs2int /=. 
   do 8!(rewrite range_ltn /=;1 :smt()). rewrite range_geq //=. 
    do 8!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  do 12!(
  do 1!(rewrite (nth_map witness); 1: by rewrite size_to_list /#); 
  do 1!(rewrite (nth_map witness); 1: by rewrite size_iota /#)). 
  rewrite !nth_iota 1..12:/#. 
  by rewrite !get_w2bits /=; smt().

move => i j ib imod jval; rewrite jval -sem_decode12_corr /sem_decode12.
rewrite to_uint_eq /= of_uintK /=.
rewrite /decode /BytesToBits !Array256.get_of_list /=; 1,2:smt().
have -> : 3072 = size (flatten (map W8.w2bits (to_list x))) by smt(Array384.size_to_list size_BytesToBits).
rewrite !take_size /= !(nth_map (witness<:bool list>) 0); 1,2:
   by  rewrite !size_chunk /=;by smt(Array384.size_to_list size_BytesToBits).
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 12 (flatten (map W8.w2bits (to_list x)))) i)) = 12 by smt(size_chunksBytesToBits Array384.size_to_list).
  have -> : (size (nth witness (chunk 12 (flatten (map W8.w2bits (to_list x)))) (i-1))) = 12 by smt(size_chunksBytesToBits Array384.size_to_list).

  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (12*i+i0)))).
  + move => k kb /=. 
    rewrite (nth_nth_chunk 12 i k (flatten (map W8.w2bits (to_list x))) false witness false) => //;  smt(size_iota size_BytesToBits mem_range size_chunksBytesToBits Array384.size_to_list).

  rewrite(StdBigop.Bigint.BIA.eq_big_seq (fun (i0 : int) =>
       2 ^ i0 * b2i (nth false (nth witness (chunk 12 (flatten (map W8.w2bits (to_list x)))) (i-1)) i0)) (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (12*(i-1) +i0)))).
  + move => k kb /=; rewrite (nth_nth_chunk 12 (i-1) k (flatten (map W8.w2bits (to_list x))) false witness false) => //;  smt(size_iota size_BytesToBits mem_range size_chunksBytesToBits Array384.size_to_list).

  do 12!(rewrite range_ltn /=;1 :smt()). rewrite range_geq //=. 
  do 12!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  rewrite !(nth_flatten false 8) /=; first 12 by  rewrite allP => k /=; smt(mapP W8.size_w2bits).

  do 12!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  rewrite !(nth_flatten false 8) /=; first 12 by  rewrite allP => k /=; smt(mapP W8.size_w2bits).  

  rewrite /to_uint /bs2int /=.   
  do 8!(rewrite range_ltn /=;1 :smt()). rewrite range_geq //=. 
  
  
   do 12!(
  do 1!(rewrite (nth_map witness); 1: by rewrite size_to_list /#); 
  do 1!(rewrite (nth_map witness); 1: by rewrite size_iota /#)). 
  rewrite !nth_iota 1..12:/#. 
  rewrite !get_w2bits /=. 
   do 12!(
  do 1!(rewrite (nth_map witness); 1: by rewrite size_to_list /#); 
  do 1!(rewrite (nth_map witness); 1: by rewrite size_iota /#)). 
  rewrite !nth_iota 1..12:/#. 
  rewrite !get_w2bits /=. 
    do 8!(rewrite StdBigop.Bigint.BIA.big_consT /=). rewrite !StdBigop.Bigint.BIA.big_nil /=. 
  smt().

qed.

lemma sem_decode12_vec_corr : sem_decode12_vec = decode12_vec_aux.
proof.
apply fun_ext => x.
rewrite /decode12_vec_aux /sem_decode12_vec /= /=.
rewrite -sem_decode12_corr /sem_decode12 /= tP => k kb.
have H : forall v idx, 0 <= v < 3 => 0 <= idx < 256 =>
     nth 0 (decode_vec 12 (BytesToBits (to_list x))) (256*v + idx) =
     nth 0 (decode 12 (BytesToBits (to_list (subarray384 x v)))) (idx);
       last first.
rewrite (Array768.get_of_list _ _ _ kb) /=.
have -> : k = 256 * (k %/ 256) + k %% 256  by smt().
rewrite H 1..2: /# /fromarray256 initiE 1:/# /=.
case (0 <= k < 256).
+ move => *;rewrite ifT 1:/# get_of_list /#.
case (256 <= k < 512).
+ move => *;rewrite ifF 1:/# ifT 1:/# get_of_list /#.
move => *;rewrite ifF 1:/# ifF 1:/# get_of_list /#.

move => v idx vb idxb.
have S1 : size (take 9216 (BytesToBits (to_list x))) = 9216 by smt(size_BytesToBits size_take_le Array1152.size_to_list).
have S2 : size (take 3072 (BytesToBits (to_list (subarray384 x v)))) = 3072  by smt(size_BytesToBits size_take_le Array384.size_to_list).
rewrite /decode /decode_vec !(nth_map witness) /=.
+ by rewrite size_chunk 1:/# S1 /#.
+ by rewrite size_iota 1:/# S2 /#.
+ by rewrite size_chunk 1:/# S2 /#.
+ by rewrite size_iota 1:/# S2 /#.
congr => /=.
rewrite S1 S2 /= !nth_iota 1,2:/# /=.
apply (eq_from_nth witness); 1: by rewrite !size_take_le 1..2:/# !size_drop_le /#.
move => i; rewrite size_take_le 1:/# size_drop_le 1..2:/#.
move => [ibl ]; rewrite ifT;1: by smt(size_BytesToBits size_take_le Array1152.size_to_list).
move => ibh; rewrite !nth_take 1..4:/# !nth_drop 1..4:/# !nth_take 1..4:/#.
rewrite !(nth_flatten witness 8) /=; 1..2:by smt(List.allP mapP size_flatten W8.size_w2bits).

rewrite !(nth_map witness) /=; 1..4: smt(Array1152.size_to_list size_iota Array384.size_to_list).
by rewrite !nth_iota 1..2:/# /= /subarray384 initiE 1:/# /= /#.
qed. 

lemma subarray256K ['a] (a b c : 'a Array256.t) :
     subarray256 (fromarray256 a b c) 0 = a /\
     subarray256 (fromarray256 a b c) 1 = b /\
     subarray256 (fromarray256 a b c) 2 = c
by rewrite /subarray256 /fromarray256; do split; rewrite tP => k kb; rewrite initiE 1:/# /= initiE 1:/# /=; [ rewrite ifT 1:/# /=| rewrite ifF 1:/# /= ifT 1:/# /= | rewrite ifF 1:/#  /= ifF 1: /# /=].

lemma fromarray384K ['a] (x : 'a Array1152.t) :
     fromarray384 (subarray384 x 0) 
                  (subarray384 x 1)
                  (subarray384 x 2) = x.
 rewrite /fromarray384 /subarray384; rewrite tP => k kb; rewrite initiE 1:/# /=.
 case(0<=k<384); 1: by move => *; rewrite initiE /#.
 case(384<=k<768); by move => *; rewrite initiE /#.
qed.


lemma sem_decode12_vecK  : cancel decode12_vec_aux  encode12_vec_aux.
rewrite /cancel /encode12_vec_aux /decode12_vec_aux /= => x.
move : (subarray256K (decode12_aux (subarray384 x 0)) (decode12_aux (subarray384 x 1))
           (decode12_aux (subarray384 x 2))) => [->[->->]].
rewrite !sem_decode12K.
by apply fromarray384K.
qed.

lemma sem_decode10_vec_corr : sem_decode10_vec = decode10_vec_aux.
proof.
apply fun_ext => x.
rewrite /decode10_vec_aux /sem_decode10_vec /=.
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
   by smt(size_BytesToBits size_chunk Array960.size_to_list size_map).
  move => k; rewrite size_cat !size_bits //= => kb.
    rewrite (nth_nth_chunk 10 (4*i) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=;  1..3:  by smt(size_BytesToBits Array960.size_to_list).
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
   + by rewrite size_cat !size_bits //=;  by smt(size_chunksBytesToBits Array960.size_to_list size_map).

    move => k; rewrite size_cat !size_bits //= => kb.
    rewrite (nth_nth_chunk 10 (4*i + 1) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1..3: by smt(size_BytesToBits Array960.size_to_list).
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
   + by rewrite size_cat !size_bits //=;  by smt(size_chunksBytesToBits Array960.size_to_list size_map).
    move => k; rewrite size_cat !size_bits //= => kb.
    rewrite (nth_nth_chunk 10 (4*i + 2) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1..3: by smt(size_BytesToBits Array960.size_to_list).
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
   + rewrite size_cat !size_bits //=;by smt(size_chunksBytesToBits Array960.size_to_list size_map).
    move => k; rewrite size_cat !size_bits //= => kb.
    rewrite (nth_nth_chunk 10 (4*i + 3) k (flatten (map W8.w2bits (to_list x))) witness witness witness) /=; 
        1..3: by smt(size_BytesToBits Array960.size_to_list).
  rewrite (nth_flatten witness 8).
  + rewrite allP => w /=; rewrite mapP => Hx. 
    by elim Hx => ww [_ ->]; rewrite W8.size_w2bits. 
  rewrite (nth_map witness) => /=; 1: by  rewrite size_to_list; smt(). 
  rewrite nth_cat size_bits //=.
  case (k < 2);move => *;rewrite /bits /w2bits /= !nth_mkseq /= /#. 


rewrite /decode_vec /BytesToBits /=.
have -> : 7680 = size (flatten (map W8.w2bits (to_list x))); 1:by smt(size_BytesToBits Array960.size_to_list).
rewrite take_size tP /= => i ib.
rewrite get_of_list 1:ib (nth_map (witness<:bool list>) 0);
  1: by  rewrite !size_chunk /=;by smt(size_BytesToBits Array960.size_to_list).
  pose cc := iteri 192 g (witness, witness, witness, witness, witness, witness, witness).
  have -> /= : cc = (cc.`1,cc.`2,cc.`3,cc.`4,cc.`5,cc.`6,cc.`7); 1: smt().
  have /= [<- ]:= (Array768.tP (Array768.init (fun i => bs2int (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) i))) cc.`1); [| by apply ib | by smt(Array768.initiE)].
rewrite /of_list -(Array768.init_set witness) -JUtils.iotaredE /=.
rewrite /cc;do 192!(rewrite iteriS_rw;1: by smt()). 
by rewrite iteri0 /=.
qed.


lemma sem_decode10_vecK  : cancel decode10_vec_aux  encode10_vec_aux.
rewrite /cancel /encode10_vec_aux /= => x.
pose cc := iteri 192 _ _.
have -> /= : cc = (cc.`1,cc.`2,cc.`3,cc.`4,cc.`5,cc.`6) by smt().

have H4 : forall i j (v : W8.t Array960.t), 0 <= i < 960 => i%%5 = 4 => j = i %/ 5 * 4 + 3 => 
  v.[i <- W8.of_int ((sem_decode10_vec x).[j] %/ 4) ] = v.[i <- x.[i]].
+ move => i j v ib imod jval. congr.
  rewrite /sem_decode10_vec  to_uint_eq /= of_uintK /=.
rewrite /decode_vec /BytesToBits !Array768.get_of_list /=; 1:smt().
have -> : 7680 = size (flatten (map W8.w2bits (to_list x))); 1:by smt(size_BytesToBits Array960.size_to_list).
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1:
by  rewrite !size_chunk /=; by smt(size_BytesToBits Array960.size_to_list).
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j)) = 10
    by smt(size_chunksBytesToBits Array960.size_to_list).
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
have -> : 7680 = size (flatten (map W8.w2bits (to_list x))); 1:by smt(size_BytesToBits Array960.size_to_list).
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1,2:
by  rewrite !size_chunk /=; smt(size_BytesToBits Array960.size_to_list).
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j)) = 10
    by smt(size_chunksBytesToBits Array960.size_to_list).
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) k)) = 10
        by smt(size_chunksBytesToBits Array960.size_to_list).
  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ 
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*k+i0)))).
  + move => kk kkb /=. 
    rewrite (nth_nth_chunk 10 k kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last    by smt(mem_range). by smt(size_BytesToBits Array960.size_to_list).

  rewrite (StdBigop.Bigint.BIA.eq_big_seq 
     (fun (i0 : int) => 2 ^ i0 * b2i (nth false (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j) i0))
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*j+i0)))).
  + move => kk kkb //=.
    rewrite (nth_nth_chunk 10 j kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last   by smt(mem_range).
       by smt(size_BytesToBits Array960.size_to_list).


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
have -> : 7680 = size (flatten (map W8.w2bits (to_list x)));1: by smt(size_BytesToBits Array960.size_to_list).
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1,2:
by  rewrite !size_chunk /=; by smt(size_BytesToBits Array960.size_to_list).
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j)) = 10
    by smt(size_chunksBytesToBits Array960.size_to_list).
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) k)) = 10
     by smt(size_chunksBytesToBits Array960.size_to_list).

  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ 
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*k+i0)))).
  + move => kk kkb /=. 
    rewrite (nth_nth_chunk 10 k kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last    by smt(mem_range).
      by smt(size_BytesToBits Array960.size_to_list).

  rewrite (StdBigop.Bigint.BIA.eq_big_seq 
     (fun (i0 : int) => 2 ^ i0 * b2i (nth false (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j) i0))
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*j+i0)))).
  + move => kk kkb //=.
    rewrite (nth_nth_chunk 10 j kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last   by smt(mem_range).
        by smt(size_BytesToBits Array960.size_to_list).

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
have -> : 7680 = size (flatten (map W8.w2bits (to_list x))); 1: by smt(size_BytesToBits Array960.size_to_list).
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1,2:
by  rewrite !size_chunk /=;  by smt(size_BytesToBits Array960.size_to_list).
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j)) = 10
    by  smt(size_chunksBytesToBits Array960.size_to_list).
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) k)) = 10
     by smt(size_chunksBytesToBits Array960.size_to_list).

  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ 
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*k+i0)))).
  + move => kk kkb /=. 
    rewrite (nth_nth_chunk 10 k kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last    by smt(mem_range).
        by smt(size_BytesToBits Array960.size_to_list).

  rewrite (StdBigop.Bigint.BIA.eq_big_seq 
     (fun (i0 : int) => 2 ^ i0 * b2i (nth false (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) j) i0))
     (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*j+i0)))).
  + move => kk kkb //=.
    rewrite (nth_nth_chunk 10 j kk (flatten (map W8.w2bits (to_list x))) false witness false) => //; last   by smt(mem_range).
         by smt(size_BytesToBits Array960.size_to_list).

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
have -> : 7680 = size (flatten (map W8.w2bits (to_list x))); 1:
     by smt(size_BytesToBits Array960.size_to_list).
rewrite take_size /=.
rewrite !(nth_map (witness<:bool list>) 0); 1:
by  rewrite !size_chunk /=;  by smt(size_BytesToBits Array960.size_to_list). 
  rewrite /bs2int. 
  have -> : (size (nth witness (chunk 10 (flatten (map W8.w2bits (to_list x)))) i)) = 10
      by smt(size_chunksBytesToBits Array960.size_to_list).
  rewrite (StdBigop.Bigint.BIA.eq_big_seq _ (fun (i0 : int) => 2^i0 * b2i (nth false (flatten (map W8.w2bits (to_list x))) (10*i+i0)))).
  + move => k kb /=. 
    rewrite (nth_nth_chunk 10 i k (flatten (map W8.w2bits (to_list x))) false witness false) => //; last by smt(mem_range).
       by smt(size_BytesToBits Array960.size_to_list).
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


