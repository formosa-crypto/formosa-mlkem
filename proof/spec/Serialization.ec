(* General EC imports *)
require import AllCore IntDiv List.

from Jasmin require import JWord.

from JazzEC require import Array32 Array128 Array160 Array256 Array384 Array768 Array960 Array1024 Array1152 Array1408 Array1536.

import BitEncoding BS2Int BitChunking.


(* Imports of "lower-level" MLKEM spec parts *)
require import GFq.
import Zq.
require import Rq.

require import VecMat.

type ipoly = int Array256.t.
op toipoly(p : poly) : ipoly = map asint p.
op ofipoly(p : ipoly)  : poly = map incoeff p.

(* Encode/Decode Operators as Defined in the MLKEM Spec *)
op BytesToBits(bytes : W8.t list) : bool list = flatten (map W8.w2bits bytes).
op BitsToBytes(bits : bool list) : W8.t list = map W8.bits2w (chunk 8 bits).
op encode(l : int, ints : int list) : W8.t list = BitsToBytes (flatten (map (int2bs l) ints)).
op decode(l : int, bytes : W8.t list) : int list = map bs2int (chunk l (BytesToBits (bytes))).

op encode12(a : ipoly) :  W8.t Array384.t = Array384.of_list W8.zero (encode 12 (to_list a)).
op encode1(a : ipoly) :  W8.t Array32.t = Array32.of_list W8.zero (encode 1 (to_list a)).

op decode12(a : W8.t Array384.t) : ipoly = Array256.of_list 0 (decode 12 (to_list a)).
op decode1(a : W8.t Array32.t) : ipoly =  Array256.of_list 0 (decode 1 (to_list a)).

theory Serialization768.

import VecMat768 PolyVec PolyMat.

type ipolyvec = int Array768.t.

op [a] subarray256(x : 'a Array768.t, i : int) =
Array256.init (fun k => x.[256*i + k]).

op [a] fromarray256(a0 a1 a2 : 'a Array256.t) : 'a Array768.t = 
  Array768.init (fun k => if 0 <= k < 256
                        then a0.[k]
                        else if 256 <= k < 512
                             then a1.[k-256] 
                             else a2.[k-512]).   

op [a] subarray384(x : 'a Array1152.t, i : int) =
      Array384.init (fun k => x.[384*i + k]).

op [a] fromarray384(a0 a1 a2 : 'a Array384.t) : 'a Array1152.t = 
Array1152.init (fun k => if 0 <= k < 384
                         then a0.[k]
                         else if 384 <= k < 768
                         then a1.[k-384] 
                         else a2.[k-768]).   

op toipolyvec(p : polyvec) : ipolyvec = map asint (fromarray256 p.[0] p.[1] p.[2]).

op ofipolyvec(p : ipolyvec) : polyvec =  
    zerov.[0 <- map incoeff (subarray256 p 0)]
         .[1 <- map incoeff (subarray256 p 1)]
         .[2 <- map incoeff (subarray256 p 2)].

op compress_polyvec(d : int, p : polyvec) : ipolyvec =  
     map (compress d) (fromarray256 p.[0] p.[1] p.[2]).

op decompress_polyvec(d : int, p : ipolyvec) =  
    zerov.[0 <- map (decompress d) (subarray256 p 0)]
         .[1 <- map (decompress d) (subarray256 p 1)]
         .[2 <- map (decompress d) (subarray256 p 2)].


op encode4(a : ipoly) :  W8.t Array128.t = Array128.of_list W8.zero (encode 4 (to_list a)).

op decode4(a : W8.t Array128.t) : ipoly =  Array256.of_list 0 (decode 4 (to_list a)).

op encode10_vec(a :ipolyvec) : W8.t Array960.t =  Array960.of_list W8.zero (encode 10 (to_list a)).

op decode10_vec(a : W8.t Array960.t) : ipolyvec =  Array768.of_list 0 (decode 10 (to_list a)).

op encode12_vec(a :ipolyvec) : W8.t Array1152.t = Array1152.of_list W8.zero (encode 12 (to_list a)).

op decode12_vec(a : W8.t Array1152.t) : ipolyvec =  Array768.of_list 0 (decode 12 (to_list a)).

end Serialization768.

theory Serialization1024.

import VecMat1024 PolyVec PolyMat.

type ipolyvec = int Array1024.t.

op [a] subarray256(x : 'a Array1024.t, i : int) =
Array256.init (fun k => x.[256*i + k]).

op [a] fromarray256(a0 a1 a2 a3 : 'a Array256.t) : 'a Array1024.t = 
  Array1024.init (fun k => if 0 <= k < 256
                        then a0.[k]
                        else if 256 <= k < 512
                             then a1.[k - 256]
                             else if 512 <= k < 768
                                  then a2.[k-512] 
                                  else a3.[k-768]).   

op [a] subarray384(x : 'a Array1536.t, i : int) =
      Array384.init (fun k => x.[384*i + k]).

op [a] fromarray384(a0 a1 a2 a3 : 'a Array384.t) : 'a Array1536.t = 
Array1536.init (fun k => if 0 <= k < 384
                         then a0.[k]
                         else if 384 <= k < 768
                              then a1.[k-384] 
                              else if 768 <= k < 1152
                                   then a2.[k-768] 
                                   else a3.[k-1152]).   

op toipolyvec(p : polyvec) : ipolyvec = map asint (fromarray256 p.[0] p.[1] p.[2] p.[3]).

op ofipolyvec(p : ipolyvec) : polyvec =  
    zerov.[0 <- map incoeff (subarray256 p 0)]
         .[1 <- map incoeff (subarray256 p 1)]
         .[2 <- map incoeff (subarray256 p 2)]
         .[3 <- map incoeff (subarray256 p 3)].

op compress_polyvec(d : int, p : polyvec) : ipolyvec =  
     map (compress d) (fromarray256 p.[0] p.[1] p.[2] p.[3]).

op decompress_polyvec(d : int, p : ipolyvec) =  
    zerov.[0 <- map (decompress d) (subarray256 p 0)]
         .[1 <- map (decompress d) (subarray256 p 1)]
         .[2 <- map (decompress d) (subarray256 p 2)]
         .[3 <- map (decompress d) (subarray256 p 3)].


op encode5(a : ipoly) :  W8.t Array160.t =
   Array160.of_list W8.zero  (encode 5 (to_list a)).

op decode5(a : W8.t Array160.t) : ipoly = 
   Array256.of_list 0 (decode 5 (to_list a)).

op encode11_vec(a :ipolyvec) : W8.t Array1408.t = 
   Array1408.of_list W8.zero (encode 11 (to_list a)).

op decode11_vec(a : W8.t Array1408.t) : ipolyvec = 
   Array1024.of_list 0 (decode 11 (to_list a)).

op encode12_vec(a :ipolyvec) : W8.t Array1536.t = 
   Array1536.of_list W8.zero (encode 12 (to_list a)).

op decode12_vec(a : W8.t Array1536.t) : ipolyvec = 
   Array1024.of_list 0 (decode 12 (to_list a)).

end Serialization1024.

