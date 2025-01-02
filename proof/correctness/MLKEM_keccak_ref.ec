require import AllCore IntDiv List.

from CryptoSpecs require export FIPS202_Keccakf1600 FIPS202_SHA3_Spec.
from CryptoSpecs require export Keccak1600_Spec Keccakf1600_Spec.


(***THESE ASSUMPTIONS MAP SHA OPERATORS FROM SPEC TO CODE IN
    THE IMPLEMENTATION ****)

from CryptoSpecs require import Symmetric.
require import MLKEMFCLib.

from Jasmin require import JModel.

from JazzEC require import Array1152 Array960 Array128 Array64 Array34 Array33 Array32.
from JazzEC require import Jkem.

axiom sha3_512_33_64 seed : 
   phoare [Jkem.M(Jkem.Syscall)._sha3512_33 : 
               arg.`2 = seed ==>
               Array32.init(fun i => res.[i]) = (SHA3_512_33_64 seed).`1 /\
               Array32.init(fun i => res.[32 + i]) = (SHA3_512_33_64 seed).`2  ] = 1%r.

axiom shake_absorb (seed : W8.t Array34.t): 
   phoare [Jkem.M(Jkem.Syscall)._shake128_absorb34 : 
               arg.`2 = seed ==>
               res = SHAKE128_ABSORB_34 
                         (Array32.init (fun k => seed.[k])) (seed.[32]) (seed.[33]) ] = 1%r.

axiom shake_squeeze state : 
   phoare [Jkem.M(Jkem.Syscall)._shake128_squeezeblock : 
               arg.`1 = state ==>
               res = SHAKE128_SQUEEZE_168 state ] = 1%r.

axiom shake256_33_128 seed : 
   phoare [Jkem.M(Jkem.Syscall)._shake256_128_33 : 
               arg.`2 = seed ==>
               res = SHAKE256_33_128 (Array32.init (fun i => seed.[i])) seed.[32] ] = 1%r.


axiom shake256_33_128_ll: islossless M(Syscall)._shake256_128_33.



axiom pkH_sha mem _ptr: 
    phoare [Jkem.M(Jkem.Syscall)._isha3_256 :
          arg.`2 = W64.of_int _ptr /\
          arg.`3 = W64.of_int (3*384+32) /\
          valid_ptr _ptr 1184 /\
          Glob.mem = mem
          ==> 
          Glob.mem = mem /\
          res = SHA3_256_1184_32
            (Array1152.init (fun k =>  mem.[_ptr+k]),
            (Array32.init (fun k => mem.[_ptr+1152+k])))] = 1%r.

axiom j_shake mem _pout _pin1 _pin2: 
    phoare [Jkem.M(Syscall)._shake256_1120_32  :
          arg = (W64.of_int _pout,W64.of_int _pin1,W64.of_int _pin2) /\
          valid_ptr _pout 32 /\
          valid_ptr _pin1 32 /\
          valid_ptr _pin2 1088 /\
          Glob.mem = mem
          ==> 
          touches Glob.mem mem _pout 32 /\
          (Array32.init (fun k =>  Glob.mem.[_pout+k])) = 
             SHAKE_256_1120_32 (Array32.init (fun k => mem.[_pin1+k])) 
                            (Array960.init (fun k => mem.[_pin2+k]), Array128.init (fun k => mem.[_pin2+960+k])) ] = 1%r.

axiom sha_g buf: 
    phoare [Jkem.M(Jkem.Syscall)._sha3_512_64 :
          arg.`2 = buf
          ==> 
          let bytes = SHA3_512_64_64 (Array32.init (fun k => buf.[k])) 
                                     (Array32.init (fun k => buf.[k+32])) in
          res = Array64.init (fun k => if k < 32 then bytes.`1.[k] else bytes.`2.[k-32])] = 1%r.


(*
axiom sha3_512_33_64 buf seed : 
   phoare [Jkem.M(Jkem.Syscall)._sha3512_33 : 
               arg = (buf,seed) ==>
               Array32.init(fun i => res.[i]) = (SHA3_512_33_64 seed).`1 /\
               Array32.init(fun i => res.[32 + i]) = (SHA3_512_33_64 seed).`2  ] = 1%r.

axiom shake_absorb (seed : W8.t Array34.t) state : 
   phoare [Jkem.M(Jkem.Syscall)._shake128_absorb34 : 
               arg = (state,seed) ==>
               res = SHAKE128_ABSORB_34 
                         (Array32.init (fun k => seed.[k])) (seed.[32]) (seed.[33]) ] = 1%r.

axiom shake_squeeze buf state : 
   phoare [Jkem.M(Jkem.Syscall)._shake128_squeezeblock : 
               arg = (state,buf) ==>
               res = SHAKE128_SQUEEZE_168 state ] = 1%r.

axiom shake256_33_128 buf seed : 
   phoare [Jkem.M(Jkem.Syscall)._shake256_128_33 : 
               arg = (buf,seed) ==>
               res = SHAKE256_33_128 (Array32.init (fun i => seed.[i])) seed.[32] ] = 1%r.


axiom pkH_sha mem _ptr inp: 
    phoare [Jkem.M(Jkem.Syscall)._isha3_256 :
          arg = (inp,W64.of_int _ptr,W64.of_int (3*384+32)) /\
          valid_ptr _ptr 1184 /\
          Glob.mem = mem
          ==> 
          Glob.mem = mem /\
          res = SHA3_256_1184_32
            (Array1152.init (fun k =>  mem.[_ptr+k]),
            (Array32.init (fun k => mem.[_ptr+1152+k])))] = 1%r.

axiom j_shake mem _pout _pin1 _pin2: 
    phoare [Jkem.M(Syscall)._shake256_1120_32  :
          arg = (W64.of_int _pout,W64.of_int _pin1,W64.of_int _pin2) /\
          valid_ptr _pout 32 /\
          valid_ptr _pin1 32 /\
          valid_ptr _pin2 1088 /\
          Glob.mem = mem
          ==> 
          touches Glob.mem mem _pout 32 /\
          (Array32.init (fun k =>  Glob.mem.[_pout+k])) = 
             SHAKE_256_1120_32 (Array32.init (fun k => mem.[_pin1+k])) 
                            (Array960.init (fun k => mem.[_pin2+k]), Array128.init (fun k => mem.[_pin2+960+k])) ] = 1%r.

axiom sha_g buf inp: 
    phoare [Jkem.M(Jkem.Syscall)._sha3_512_64 :
          arg = (inp,buf)
          ==> 
          let bytes = SHA3_512_64_64 (Array32.init (fun k => buf.[k])) 
                                     (Array32.init (fun k => buf.[k+32])) in
          res = Array64.init (fun k => if k < 32 then bytes.`1.[k] else bytes.`2.[k-32])] = 1%r.

*)
