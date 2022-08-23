module AVX2Perm where
    
import Data.List

invperm :: [Int] -> [Int]
invperm xs = map fst $ sortOn snd $ zip [0..256] xs

r0a,r1a,r2a,r3a,r4a,r5a,r6a,r7a :: [Int]
r0a = [0..15]
r1a = [16..31]
r2a = [32..47]
r3a = [48..63]
r4a = [64..79]
r5a = [80..95]
r6a = [96..111]
r7a = [112..127]

s8 :: ([Int],[Int]) -> ([Int],[Int])
s8 (xs,ys) = (take 8 xs ++ take 8 ys,drop 8 xs ++ drop 8 ys)

split4 :: [Int] -> ([Int],[Int],[Int],[Int])
split4 xs = (x1,x2,x3,x4)
    where
    (x1,xs1) = splitAt 4 xs
    (x2,xs2) = splitAt 4 xs1
    (x3,x4) = splitAt 4 xs2

s4 :: ([Int],[Int]) -> ([Int],[Int])
s4 (xs,ys) = (x1 ++ y1 ++ x3 ++ y3, x2 ++ y2 ++ x4 ++ y4)
    where
    (x1,x2,x3,x4) = split4 xs
    (y1,y2,y3,y4) = split4 ys
    
split2 :: [Int] -> ([Int],[Int],[Int],[Int],[Int],[Int],[Int],[Int])
split2 xs = (x1,x2,x3,x4,x5,x6,x7,x8)
    where
    (x1,xs1) = splitAt 2 xs
    (x2,xs2) = splitAt 2 xs1
    (x3,xs3) = splitAt 2 xs2
    (x4,xs4) = splitAt 2 xs3
    (x5,xs5) = splitAt 2 xs4
    (x6,xs6) = splitAt 2 xs5
    (x7,x8) = splitAt 2 xs6
    
s2 :: ([Int],[Int]) -> ([Int],[Int])
s2 (xs,ys) = (x1 ++ y1 ++ x3 ++ y3 ++ x5 ++ y5 ++ x7 ++ y7,x2 ++ y2 ++ x4 ++ y4 ++ x6 ++ y6 ++ x8 ++ y8)
    where
    (x1,x2,x3,x4,x5,x6,x7,x8) = split2 xs
    (y1,y2,y3,y4,y5,y6,y7,y8) = split2 ys
    
s1 :: ([Int],[Int]) -> ([Int],[Int])
s1 (xs,ys) = ([x1,y1,x3,y3,x5,y5,x7,y7,x9,y9,x11,y11,x13,y13,x15,y15],[x2,y2,x4,y4,x6,y6,x8,y8,x10,y10,x12,y12,x14,y14,x16,y16])
    where
    [x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16] = xs
    [y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16] = ys

type L128 = ([Int],[Int],[Int],[Int],[Int],[Int],[Int],[Int])

nttpack :: L128 -> L128
nttpack (r0,r1,r2,r3,r4,r5,r6,r7) = (r0d,r2d,r4d,r6d,r1d,r3d,r5d,r7d)
    where
  (r0a, r1a) = s1 (r0,r1)
  (r2a, r3a) = s1 (r2,r3)
  (r4a, r5a) = s1 (r4,r5)
  (r6a, r7a) = s1 (r6,r7)
              
  (r0b, r2b) = s2 (r0a,r2a)
  (r4b, r6b) = s2 (r4a,r6a)
  (r1b, r3b) = s2 (r1a,r3a)
  (r5b, r7b) = s2 (r5a,r7a)
              
  (r0c, r4c) = s4 (r0b,r4b)
  (r1c, r5c) = s4 (r1b,r5b)
  (r2c, r6c) = s4 (r2b,r6b)
  (r3c, r7c) = s4 (r3b,r7b)
              
  (r0d, r1d) = s8 (r0c,r1c)
  (r2d, r3d) = s8 (r2c,r3c)
  (r4d, r5d) = s8 (r4c,r5c)
  (r6d, r7d) = s8 (r6c,r7c)
  
split128 :: [Int] -> L128
split128 r0 = (xs1,xs2,xs3,xs4,xs5,xs6,xs7,xs8)
    where
    (xs1,r1) = splitAt 16 r0
    (xs2,r2) = splitAt 16 r1
    (xs3,r3) = splitAt 16 r2
    (xs4,r4) = splitAt 16 r3
    (xs5,r5) = splitAt 16 r4
    (xs6,r6) = splitAt 16 r5
    (xs7,xs8) = splitAt 16 r6
  
join128 :: L128 -> [Int]
join128 (x1,x2,x3,x4,x5,x6,x7,x8) = x1 ++ x2 ++ x3 ++ x4 ++ x5 ++ x6 ++ x7 ++ x8  
  
nttpack' :: [Int] -> [Int]
nttpack' xs = join128 (nttpack (split128 xs))


unpack_perm :: [Int]
unpack_perm =  [0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120,
   1, 9, 17, 25, 33, 41, 49, 57, 65, 73, 81, 89, 97, 105, 113, 121,
   2, 10, 18, 26, 34, 42, 50, 58, 66, 74, 82, 90, 98, 106, 114, 122,
   3, 11, 19, 27, 35, 43, 51, 59, 67, 75, 83, 91, 99, 107, 115, 123,
   4, 12, 20, 28, 36, 44, 52, 60, 68, 76, 84, 92, 100, 108, 116, 124,
   5, 13, 21, 29, 37, 45, 53, 61, 69, 77, 85, 93, 101, 109, 117, 125,
   6, 14, 22, 30, 38, 46, 54, 62, 70, 78, 86, 94, 102, 110, 118, 126,
   7, 15, 23, 31, 39, 47, 55, 63, 71, 79, 87, 95, 103, 111, 119, 127]

(r0b,r4b) = s8(r0a,r4a)
(r1b,r5b) = s8(r1a,r5a)
(r2b,r6b) = s8(r2a,r6a)
(r3b,r7b) = s8(r3a,r7a)

lvl2 = r0b++r4b++r1b++r5b++r2b++r6b++r3b++r7b 

r0c = r0b
r4c = r4b
r1c = r1b
r5c = r5b
r2c = r2b
r6c = r6b
r3c = r3b
r7c = r7b

(r0d,r2d) = s4(r0c,r2c) 
(r4d,r6d) = s4(r4c,r6c)
(r1d,r3d) = s4(r1c,r3c)
(r5d,r7d) = s4(r5c,r7c)

lvl3 = r0d ++ r2d ++ r4d ++ r6d ++ r1d ++ r3d ++ r5d ++ r7d

r0e = r0d
r4e = r4d
r1e = r1d
r5e = r5d
r2e = r2d
r6e = r6d
r3e = r3d
r7e = r7d

(r0f,r1f) = s2(r0e,r1e)
(r2f,r3f) = s2(r2e,r3e)
(r4f,r5f) = s2(r4e,r5e)
(r6f,r7f) = s2(r6e,r7e)
 
lvl4 = r0f ++ r1f ++ r2f ++ r3f ++ r4f ++ r5f ++ r6f ++ r7f
 
r0g = r0f
r4g = r4f
r1g = r1f
r5g = r5f
r2g = r2f
r6g = r6f
r3g = r3f
r7g = r7f

(r0h,r4h) = s1(r0g,r4g)
(r1h,r5h) = s1(r1g,r5g)
(r2h,r6h) = s1(r2g,r6g)
(r3h,r7h) = s1(r3g,r7g)

r0i = r0h
r4i = r4h
r1i = r1h
r5i = r5h
r2i = r2h
r6i = r6h
r3i = r3h
r7i = r7h

lvl5 = r0i ++ r4i ++ r1i ++ r5i ++ r2i ++ r6i ++ r3i ++ r7i

(r0v, r4v, r1v, r5v, r2v, r6v, r3v, r7v) = nttpack(r0i, r4i, r1i, r5i, r2i, r6i, r3i, r7i)

lvl6 = r0v ++ r4v ++ r1v ++ r5v ++ r2v ++ r6v ++ r3v ++ r7v







