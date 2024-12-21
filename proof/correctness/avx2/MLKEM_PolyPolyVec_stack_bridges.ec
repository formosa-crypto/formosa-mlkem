require import AllCore IntDiv List.
require import Jkem_avx2 Jkem_avx2_stack  MLKEM_InnerPKE_avx2 MLKEM.
from Jasmin require import JModel_x86.

require import Array32 Array33 Array64 Array148 Array256 Array384 Array768 Array960 Array128 Array1088 Array1152 Array1184 Array2304 Array2400.
require import Array8 WArray32 WArray33 Array300 WArray64 WArray1184 WArray2400.
import MLKEM InnerPKE.

require import MLKEMFCLib.

op load_array1184 (m : global_mem_t) (p : address) : W8.t Array1184.t = 
      (Array1184.init (fun (i : int) => m.[p + i])).

lemma poly_to_bytes_stack_equiv _mem _pos:
   0 <= _pos <= 1184+2*384 =>
   equiv [ Jkem_avx2_stack.M._i_poly_tobytes
           ~ Jkem_avx2.M(Syscall)._poly_tobytes :
   Glob.mem{2} = _mem /\ arg{2}.`1 = W64.of_int _pos /\ arg{1}.`2 = arg{2}.`2 ==>
  Glob.mem{2} =
  stores _mem _pos
    (to_list res{1}.`1)].
move => Hpos;proc => /=.
admitted.

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
+ wp;call (poly_to_bytes_stack_equiv _mem _pos) => /=;1: by smt().
  auto => />. admit.
seq 3 3 : (
Glob.mem{2} = (stores _mem _pos (take (2*384) (to_list r{1}))) /\ pp{2} = (of_int (_pos + 384))%W64 /\ ={a}
).
+ exlim Glob.mem{2} => _mem2.
  wp;call (poly_to_bytes_stack_equiv _mem2 (_pos+384)) => /=; 1: by smt().
  auto => />. admit.
seq 3 3 : (
Glob.mem{2} = (stores _mem _pos (take (3*384) (to_list r{1}))) /\ pp{2} = (of_int (_pos + 2*384))%W64 /\ ={a}
).
+ exlim Glob.mem{2} => _mem3.
  wp;call (poly_to_bytes_stack_equiv _mem3 (_pos+2*384)) => /=; 1: by smt().
  auto => />. admit.

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

