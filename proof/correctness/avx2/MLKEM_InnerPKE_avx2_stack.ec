require import AllCore IntDiv List.
require import Jkem_avx2_stack MLKEM.
from Jasmin require import JModel_x86.

require import Array32 Array64 Array148 Array960 Array128 Array1088 Array1152 Array1184 Array2400.
require import Array8 Array300 WArray64 WArray1184 WArray2400.
import MLKEM InnerPKE.

require import MLKEM_KEM_avx2.

equiv mlkem_correct_kg_avx2_stack  : 
M.__indcpa_keypair  ~ InnerPKE.InnerPKE.kg_derand :
arg{1}.`3 = arg{2} ==> 
    res{2}.`2 = Array1152.init ("_.[_]" res{1}.`2) /\
    res{2}.`1.`1 = (init (fun (i : int) => res{1}.`1.[i]))%Array1152 /\
    res{2}.`1.`2 = (init (fun (i : int) => res{1}.`1.[i + 1152]))%Array32.
admitted.

equiv mlkem_correct_enc_avx2_stack  : 
M.__indcpa_enc  ~ InnerPKE.InnerPKE.enc_derand :
arg{1}.`2 = arg{2}.`2 /\ arg{1}.`4 = arg{2}.`3 /\
   Array1152.init(fun i => arg{1}.`3.[i]) = arg{2}.`1.`1 /\
   Array32.init(fun i => arg{1}.`3.[i+1152]) = arg{2}.`1.`2 ==>
   Array960.init(fun i => res{1}.[i]) = res{2}.`1 /\
   Array128.init(fun i => res{1}.[i+960]) = res{2}.`2.
admitted.

equiv mlkem_correct_dec_avx2_stack  : 
M.__indcpa_dec  ~ InnerPKE.InnerPKE.dec :
arg{1}.`3 = arg{2}.`1 /\ 
Array960.init(fun i => arg{1}.`2.[i]) = arg{2}.`2.`1 /\
Array128.init(fun i => arg{1}.`2.[i+960]) = arg{2}.`2.`2  ==>
   ={res}.
admitted.
