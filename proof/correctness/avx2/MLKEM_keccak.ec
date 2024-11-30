require import AllCore IntDiv List.
from Jasmin require import JModel.

require import FIPS202_Keccakf1600.
require import Keccak1600_Spec Keccakf1600_Spec.

print Keccak1600_Spec.
require import Jkem_avx2.

print Jkem_avx2.

require import Array1 Array2 Array32 Array64.

(*
hoare sha3_256A_M1184_h _in:
 M(Syscall)._sha3_256A_M1184
 : in_0 = _in ==> to_list res = SHA3_256 _in.
*)

hoare sha3_512A_A32_h _in:
 M(Syscall)._sha3_512A_A32
 : in_0 = _in
 ==> to_list res = SHA3_512 (to_list _in).
admitted.

(*
hoare shake256_M32__M32_M1088_h _in0 _in1:
 M(Syscall)._shake256_M32__M32_M1088
 : in0 = _in0 /\ in1 = _in1
 ==> res = SHAKE256 (to_list _in) 32.
admitted.
*)

(*
_shake256x4_A128__A32_A1
*)

(*
hoare shake128_absorb_A32_A2_h _seed _pos:
 M(Syscall)._shake128_absorb_A32_A2
 : seed = _seed /\ pos = _pos
 ==> res = stavx2_from_st25 (SHAKE128_ABSORB (to_list _seed ++ to_list _pos)).
admitted.
*)

(*
_shake128x4_absorb_A32_A2
*)

(*
_shake128_squeeze3blocks
*)

(*
_shake128_next_state
*)

(*
_shake128x4_squeeze3blocks
*)

