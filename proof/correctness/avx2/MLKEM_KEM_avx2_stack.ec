require import AllCore IntDiv List.
require import Jkem_avx2_stack MLKEM.
from Jasmin require import JModel_x86.

require import Array32 Array64 Array960 Array128 Array1088 Array1152 Array1184 Array2400.
import MLKEM.

print MLKEM.

lemma mlkem_kem_correct_kg   : 
   equiv [Jkem_avx2_stack.M.jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand ~ MLKEM.kg_derand : 
        coins{2}.`1 = Array32.init(fun i => coins{1}.[i]) /\
        coins{2}.`2 = Array32.init(fun i => coins{1}.[32 + i]) 
        ==> 
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk.`1 = Array1152.init(fun i => res{1}.`1.[i])  /\
         sk.`2.`1 = Array1152.init(fun i => res{1}.`1.[i+1152]) /\
         sk.`2.`2 = Array32.init(fun i => res{1}.`1.[i+1152+1152]) /\
         sk.`3 = Array32.init(fun i => res{1}.`1.[i+1152+1152 + 32]) /\
         sk.`4 = Array32.init(fun i => res{1}.`1.[i+1152+1152 + 32 + 32]) /\
         t = Array1152.init(fun i => res{1}.`2.[i]) /\  
         rho = Array32.init(fun i => res{1}.`2.[i+1152])].
admitted.

lemma mlkem_kem_correct_enc : 
   equiv [Jkem_avx2_stack.M.jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand ~ MLKEM.enc_derand: 
     coins{1} = coins{2} /\
     pk{2}.`1 = Array1152.init(fun i => public_key{1}.[i])  /\
     pk{2}.`2 = Array32.init(fun i => public_key{1}.[i+1152])
       ==> 
     let (c,k) = res{2} in
     c.`1 = Array960.init(fun i => res{1}.`1.[i]) /\
     c.`2 = Array128.init(fun i => res{1}.`1.[i+960])  /\
     k = res{1}.`2
].
admitted.

lemma mlkem_kem_correct_dec : 
   equiv [Jkem_avx2_stack.M.jade_kem_mlkem_mlkem768_amd64_avx2_dec ~ MLKEM.dec: 
      sk{2}.`1 = Array1152.init(fun i => secret_key{1}.[i])  /\
      sk{2}.`2.`1 = Array1152.init(fun i => secret_key{1}.[i+1152]) /\
      sk{2}.`2.`2 = Array32.init(fun i => secret_key{1}.[i+1152+1152]) /\
      sk{2}.`3 = Array32.init(fun i => secret_key{1}.[i+1152+1152 + 32]) /\
      sk{2}.`4 = Array32.init(fun i => secret_key{1}.[i+1152+1152 + 32 + 32]) /\
     let (c1,c2) = cph{2} in
         cph{2}.`1 = Array960.init(fun i => ciphertext{1}.[i]) /\
         cph{2}.`2 = Array128.init(fun i => ciphertext{1}.[i+960])  
       ==> 
     res{2} = res{1}.`1
].
admitted.
