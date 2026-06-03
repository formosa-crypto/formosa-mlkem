require import Rq.

theory VecMat768.

op kvec : int = 3. 

theory PolyVec.

type polyvec.
op "_.[_]" (v : polyvec) (i : int) : poly.
op "_.[_<-_]" (v : polyvec) (i : int) (c : poly) : polyvec.
op mapv(f : poly -> poly, v : polyvec) : polyvec.
op nttv v = mapv ntt v.
op invnttv v = mapv invntt v.
op zerov : polyvec.
op (+) : polyvec -> polyvec -> polyvec.
end PolyVec.

theory PolyMat.
type polymat.
op "_.[_]" (m : polymat) (ij : int * int) : poly.
op "_.[_<-_]" (m : polymat) (ij : int * int) (c : poly) : polymat.
op mapm(f : poly -> poly, m : polymat) : polymat.
op nttm m = mapm ntt m.
op invnttm m = mapm invntt m.
op zerom : polymat. 
end PolyMat.

import PolyVec PolyMat.

op ntt_mmul(m : polymat, v : polyvec) : polyvec = 
   zerov.[0 <- basemul m.[0, 0] v.[0] &+ basemul m.[0, 1] v.[1] &+ basemul m.[0, 2] v.[2]]
        .[1 <- basemul m.[1, 0] v.[0] &+ basemul m.[1, 1] v.[1] &+ basemul m.[1, 2] v.[2]]
        .[2 <- basemul m.[2, 0] v.[0] &+ basemul m.[2, 1] v.[1] &+ basemul m.[2, 2] v.[2]].

op ntt_dotp(v1 v2 : polyvec) : poly = 
   basemul v1.[0] v2.[0] &+ basemul v1.[1] v2.[1] &+ basemul v1.[2] v2.[2].


end VecMat768.


theory VecMat1024.

op kvec : int = 4. 

theory PolyVec.
type polyvec.
op "_.[_]" (v : polyvec) (i : int) : poly.
op "_.[_<-_]" (v : polyvec) (i : int) (c : poly) : polyvec.
op mapv(f : poly -> poly, v : polyvec) : polyvec.
op nttv v = mapv ntt v.
op invnttv v = mapv invntt v.
op zerov : polyvec.
op (+) : polyvec -> polyvec -> polyvec.
end PolyVec.

theory PolyMat.
type polymat.
op "_.[_]" (m : polymat) (ij : int * int) : poly.
op "_.[_<-_]" (m : polymat) (ij : int * int) (c : poly) : polymat.
op mapm(f : poly -> poly, m : polymat) : polymat.
op nttm m = mapm ntt m.
op invnttm m = mapm invntt m.
op zerom : polymat. 
end PolyMat.

import PolyVec PolyMat.

op ntt_mmul(m : polymat, v : polyvec) : polyvec = 
   zerov.[0 <- basemul m.[0, 0] v.[0] &+ basemul m.[0, 1] v.[1] &+ basemul m.[0, 2] v.[2] &+ basemul m.[0, 3] v.[3]]
        .[1 <- basemul m.[1, 0] v.[0] &+ basemul m.[1, 1] v.[1] &+ basemul m.[1, 2] v.[2] &+ basemul m.[1, 3] v.[3]]
        .[2 <- basemul m.[2, 0] v.[0] &+ basemul m.[2, 1] v.[1] &+ basemul m.[2, 2] v.[2] &+ basemul m.[2, 3] v.[3]]
        .[3 <- basemul m.[3, 0] v.[0] &+ basemul m.[3, 1] v.[1] &+ basemul m.[3, 2] v.[2] &+ basemul m.[3, 3] v.[3]].

op ntt_dotp(v1 v2 : polyvec) : poly = 
   basemul v1.[0] v2.[0] &+ basemul v1.[1] v2.[1] &+ basemul v1.[2] v2.[2] &+ basemul v1.[3] v2.[3].


end VecMat1024.

