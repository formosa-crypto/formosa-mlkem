require import AllCore IntDiv List.
require import Jkem_avx2 Jkem_avx2_stack  MLKEM_InnerPKE_avx2 MLKEM.
from Jasmin require import JModel_x86.

require import Array32 Array33 Array64 Array148 Array256 Array384 Array768 Array960 Array128 Array1088 Array1152 Array1184 Array2304 Array2400.
require import Array8 WArray32 WArray33 Array300 WArray64 WArray1184 WArray2400.
import MLKEM InnerPKE.

require import MLKEMFCLib WArray384.

op load_array1184 (m : global_mem_t) (p : address) : W8.t Array1184.t = 
      (Array1184.init (fun (i : int) => m.[p + i])).

lemma poly_to_bytes_stack_equiv _mem _pos _a :
   0 <= _pos <= 1184+2*384 =>
   equiv [ Jkem_avx2_stack.M._i_poly_tobytes
           ~ Jkem_avx2.M(Syscall)._poly_tobytes :
   Glob.mem{2} = _mem /\ arg{2}.`1 = W64.of_int _pos /\ arg{1}.`2 = arg{2}.`2 /\ arg{1}.`2 = _a ==>
  Glob.mem{2} =
  stores _mem _pos
    (to_list res{1}.`1) /\ res{1}.`2 = res{2}].
move => Hpos;proc => /=.
unroll for {1} ^while; unroll for{2} ^while.
seq 40 40 : (Glob.mem{2} = _mem /\ rp{2} = (of_int _pos)%W64 /\ ={a,jqx16_p,qx16,t0,t1,t2,t3,t4,t5,t6,t7,ttt});  1: by conseq />;sim.

seq 7 7 : (rp{2} = (of_int _pos)%W64 /\ ={a, jqx16_p, qx16, t0, t1, t2, t3, t4, t5, t6, t7,ttt} /\
   Glob.mem{2} = stores _mem _pos (take 192 (to_list rp{1}))).
+ auto => /> &1 &2. 
  rewrite /storeW256 !of_uintK !modz_small; 1..6: by auto => /#. 
  apply JMemory.mem_eq_ext => p. 
  rewrite !get_storesE !size_take 1:/# !size_to_list size_map !iotaredE !size_map !size_iota /max /=.
  case (_pos <= p && p < _pos + 192) => *; last by smt().
  rewrite nth_take 1,2:/# (nth_change_dfl witness W8.zero (Array384.to_list _)); 1: by rewrite size_to_list 1:/#.
  rewrite get_to_list initiE 1:/#.
  case (_pos + 160 <= p && p < _pos + 192) => *.
  + rewrite get8_set256_directE 1,2:/# ifT 1:/# (nth_map witness);1:  smt(size_iota).   by rewrite nth_iota /#.
  case ( _pos + 128 <= p && p < _pos + 160) => *.
  + rewrite get8_set256_directE 1,2:/# ifF 1:/# (nth_map witness);1:  smt(size_iota)
.   rewrite nth_iota 1: /#.
    rewrite /get8 initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifT /#. 
  case (_pos + 96 <= p && p < _pos + 128) => *.
  + rewrite get8_set256_directE 1,2:/# ifF 1:/# (nth_map witness);1:  smt(size_iota)
.   rewrite nth_iota 1: /#.
    rewrite /get8 initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifT /#.
  case (_pos + 64 <= p && p < _pos + 96) => *.
  + rewrite get8_set256_directE 1,2:/# ifF 1:/# (nth_map witness);1:  smt(size_iota)
.   rewrite nth_iota 1: /#.
    rewrite /get8 initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifT /#.
  case (_pos + 32 <= p && p < _pos + 64) => *.
  + rewrite get8_set256_directE 1,2:/# ifF 1:/# (nth_map witness);1:  smt(size_iota)
.   rewrite nth_iota 1: /#.
    rewrite /get8 initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifT /#.
  + rewrite ifT 1:/#.     
    rewrite /get8  /set256_direct initiE 1:/# /= ifF 1:/# (nth_map witness);1:  smt(size_iota)
.   rewrite nth_iota 1: /#.  
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1: /#.
    by rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifT /#.

seq 35 35 : (#pre);  1: by conseq />;sim.
auto => /> &1 &2.
rewrite /storeW256 !of_uintK !modz_small; 1..6: by auto => /#. 
apply JMemory.mem_eq_ext => p. 
rewrite !get_storesE !size_to_list !size_take 1:/# !size_to_list size_map !iotaredE !size_map !size_iota /max /=.
case (_pos <= p && p < _pos + 384) => *; last by smt().
rewrite (nth_change_dfl witness W8.zero (Array384.to_list _)); 1: by rewrite size_to_list 1:/#.
rewrite get_to_list initiE 1:/#.
  case (_pos + 352 <= p && p < _pos + 384) => *.
  + rewrite get8_set256_directE 1,2:/# ifT 1:/# (nth_map witness);1:  smt(size_iota).   by rewrite nth_iota /#.
  case ( _pos + 320 <= p && p < _pos + 352) => *.
  + rewrite get8_set256_directE 1,2:/# ifF 1:/# (nth_map witness);1:  smt(size_iota)
.   rewrite nth_iota 1: /#.
    rewrite /get8 initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifT /#. 
  case (_pos + 288 <= p && p < _pos + 320) => *.
  + rewrite get8_set256_directE 1,2:/# ifF 1:/# (nth_map witness);1:  smt(size_iota)
.   rewrite nth_iota 1: /#.
    rewrite /get8 initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifT /#.
  case (_pos + 256 <= p && p < _pos + 288) => *.
  + rewrite get8_set256_directE 1,2:/# ifF 1:/# (nth_map witness);1:  smt(size_iota)
.   rewrite nth_iota 1: /#.
    rewrite /get8 initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifT /#.
  case (_pos + 224 <= p && p < _pos + 256) => *.
  + rewrite get8_set256_directE 1,2:/# ifF 1:/# (nth_map witness);1:  smt(size_iota)
.   rewrite nth_iota 1: /#.
    rewrite /get8 initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifT /#.
  case (_pos + 192 <= p && p < _pos + 224) => *.
  + rewrite get8_set256_directE 1,2:/# ifF 1:/# (nth_map witness);1:  smt(size_iota)
.   rewrite nth_iota 1: /#.
    rewrite /get8 initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifT /#.
  + rewrite ifT 1:/#.     
    rewrite /get8  /set256_direct initiE 1:/# /= ifF 1:/# nth_take 1,2:/# (nth_map witness) /=;1:  smt(size_iota)
.   rewrite nth_iota 1: /#.  
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1:/#.
    rewrite initiE 1:/# initiE 1:/# /= /set256_direct initiE 1:/# /= ifF 1: /#.
    by rewrite initiE /#.
qed.

lemma polyvec_to_bytes_stack_equiv _mem _pos:
   0 <= _pos <= 1184 =>
   equiv [ Jkem_avx2_stack.M.__i_polyvec_tobytes
           ~ Jkem_avx2.M(Syscall).__polyvec_tobytes :
   Glob.mem{2} = _mem /\ arg{2}.`1 = W64.of_int _pos /\ arg{1}.`2 = arg{2}.`2 ==>
  Glob.mem{2} =
  stores _mem _pos
    (take 1152
       (to_list res{1}))].
move => Hpos;proc => /=.
seq 3 3 : (
Glob.mem{2} = (stores _mem _pos (take 384 (to_list r{1}))) /\ pp{2} = (of_int _pos)%W64 /\ ={a}
).
+ exlim (init (fun (i : int) => a{1}.[0 + i]))%Array256 => _a.
  wp;call (poly_to_bytes_stack_equiv _mem _pos _a) => /=;1: by smt().
  auto => /> &1 r.
  + congr;apply (eq_from_nth witness); rewrite ?size_take ?size_to_list /=; 1,2:smt().
    move => k kb;rewrite nth_take 1,2:/#. 
    by rewrite get_to_list initiE /#.
 
seq 3 3 : (
Glob.mem{2} = (stores _mem _pos (take (2*384) (to_list r{1}))) /\ pp{2} = (of_int (_pos + 384))%W64 /\ ={a}
).
+ exlim Glob.mem{2}, a{1} => _mem2 _a2.
  wp;call (poly_to_bytes_stack_equiv _mem2 (_pos+384) ((init (fun (i : int) => _a2.[256 + i]))%Array256)) => /=; 1: by smt().
  auto => /> &1  rrl;apply mem_eq_ext => p.
  rewrite !get_storesE !size_to_list !size_take 1..2:/# !size_to_list /=. 
  case (_pos + 384 <= p < _pos + 768) => H.
  + rewrite ifT 1:/#. 
    rewrite nth_take 1,2:/# -!(nth_change_dfl W8.zero witness) ?size_to_list 1,2:/#.
    by rewrite !get_to_list initiE /#.
  case (_pos <= p < _pos + 384) => H1.
  + rewrite ifT 1:/#. 
    rewrite !nth_take 1..4:/# -!(nth_change_dfl W8.zero witness) ?size_take ?size_to_list 1..2:/#.
    by rewrite !get_to_list initiE /#.
  + by smt().

seq 3 3 : (
Glob.mem{2} = (stores _mem _pos (take (3*384) (to_list r{1}))) /\ pp{2} = (of_int (_pos + 2*384))%W64 /\ ={a}
).
+ exlim Glob.mem{2}, a{1} => _mem3 _a3.
  wp;call (poly_to_bytes_stack_equiv _mem3 (_pos+2*384) ((init (fun (i : int) => _a3.[512 + i]))%Array256)) => /=; 1: by smt().
  auto => /> &1  rrl;apply mem_eq_ext => p.
  rewrite !get_storesE !size_to_list !size_take 1..2:/# !size_to_list /=. 
  case (_pos + 768 <= p < _pos + 1152) => H.
  + rewrite ifT 1:/#. 
    rewrite nth_take 1,2:/# -!(nth_change_dfl W8.zero witness) ?size_to_list 1,2:/#.
    by rewrite !get_to_list initiE /#.
  case (_pos <= p < _pos + 768) => H1.
  + rewrite ifT 1:/#. 
    rewrite !nth_take 1..4:/# -!(nth_change_dfl W8.zero witness) ?size_take ?size_to_list 1..2:/#.
    by rewrite !get_to_list initiE /#.
  + by smt().

by auto => />.
qed.

lemma polyvec_from_bytes_stack_equiv:
   equiv [ Jkem_avx2_stack.M.__i_polyvec_frombytes
           ~ Jkem_avx2.M(Syscall).__polyvec_frombytes :
   to_uint arg{2} = 0 /\
   load_array1152 Glob.mem{2} 0 = arg{1} ==> ={res}].
admitted.

op load_array1088 (m : global_mem_t) (p : address) : W8.t Array1088.t = Array1088.init (fun (i : int) => m.[p + i]).

lemma polyvec_decompress_stack_equiv:
   equiv [ Jkem_avx2_stack.M.__i_polyvec_decompress
           ~ Jkem_avx2.M(Syscall).__polyvec_decompress :
   to_uint arg{2} = 1152 /\
   load_array1088 Glob.mem{2} 1152 = arg{1} ==> ={res}].
admitted.

lemma poly_decompress_stack_equiv:
   equiv [ Jkem_avx2_stack.M._i_poly_decompress
           ~ Jkem_avx2.M(Syscall)._poly_decompress :
   to_uint arg{2}.`2 = 1152+960 /\
   load_array128 Glob.mem{2} (1152+960) = arg{1}.`2 ==> ={res}].
admitted.

