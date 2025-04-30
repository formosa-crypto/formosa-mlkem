#!/usr/bin/env python3
"""
Computes static nttpack/nttunpack permutation to map between bitreversed and AVX2 order
"""

def shuffle1(a,b):
  tmp = list(zip(a,b))
  r0 = []
  r1 = []
  for i in tmp[0::2]:
    r0.extend(list(i))
  for i in tmp[1::2]:
    r1.extend(list(i))
  return r0, r1

def shuffle2(a,b):
  r0 = []
  r1 = []
  r0[0:2] = a[0:2]
  r0[2:4] = b[0:2]
  r0[4:6] = a[4:6]
  r0[6:8] = b[4:6]
  r0[8:10] = a[8:10]
  r0[10:12] = b[8:10]
  r0[12:14] = a[12:14]
  r0[14:16] = b[12:14]
  r1[0:2] = a[2:4]
  r1[2:4] = b[2:4]
  r1[4:6] = a[6:8]
  r1[6:8] = b[6:8]
  r1[8:10] = a[10:12]
  r1[10:12] = b[10:12]
  r1[12:14] = a[14:16]
  r1[14:16] = b[14:16]
  return r0, r1

def shuffle4(a,b):
  r0 = []
  r1 = []
  r0[0:4] = a[0:4]
  r0[4:8] = b[0:4]
  r0[8:12] = a[8:12]
  r0[12:16] = b[8:12]
  r1[0:4] = a[4:8]
  r1[4:8] = b[4:8]
  r1[8:12] = a[12:16]
  r1[12:16] = b[12:16]
  return r0, r1

def shuffle8(a,b):
  r0 = []
  r1 = []
  r0[0:8] = a[0:8]
  r0[8:16] = b[0:8]
  r1[0:8] = a[8:16]
  r1[8:16] = b[8:16]
  return r0, r1

def nttpack128(r0, r1, r2, r3, r4, r5, r6, r7):
  r0, r1 = shuffle1(r0, r1)
  r2, r3 = shuffle1(r2, r3)
  r4, r5 = shuffle1(r4, r5)
  r6, r7 = shuffle1(r6, r7)

  r0, r2 = shuffle2(r0, r2)
  r4, r6 = shuffle2(r4, r6)
  r1, r3 = shuffle2(r1, r3)
  r5, r7 = shuffle2(r5, r7)

  r0, r4 = shuffle4(r0, r4)
  r1, r5 = shuffle4(r1, r5)
  r2, r6 = shuffle4(r2, r6)
  r3, r7 = shuffle4(r3, r7)

  r0, r1 = shuffle8(r0, r1)
  r2, r3 = shuffle8(r2, r3)
  r4, r5 = shuffle8(r4, r5)
  r6, r7 = shuffle8(r6, r7)

  return r0, r2, r4, r6, r1, r3, r5, r7

def nttunpack128(r0, r1, r2, r3, r4, r5, r6, r7):
  r0, r4 = shuffle8(r0, r4)
  r1, r5 = shuffle8(r1, r5)
  r2, r6 = shuffle8(r2, r6)
  r3, r7 = shuffle8(r3, r7)

  r0, r2 = shuffle4(r0, r2)
  r4, r6 = shuffle4(r4, r6)
  r1, r3 = shuffle4(r1, r3)
  r5, r7 = shuffle4(r5, r7)

  r0, r1 = shuffle2(r0, r1)
  r2, r3 = shuffle2(r2, r3)
  r4, r5 = shuffle2(r4, r5)
  r6, r7 = shuffle2(r6, r7)

  r0, r4 = shuffle1(r0, r4)
  r1, r5 = shuffle1(r1, r5)
  r2, r6 = shuffle1(r2, r6)
  r3, r7 = shuffle1(r3, r7)

  return r0, r4, r1, r5, r2, r6, r3, r7

def nttpack(a):
    r0 = a[0:16]
    r1 = a[16:32]
    r2 = a[32:48]
    r3 = a[48:64]
    r4 = a[64:80]
    r5 = a[80:96]
    r6 = a[96:112]
    r7 = a[112:128]
    r0, r1, r2, r3, r4, r5, r6, r7 = nttpack128(r0, r1, r2, r3, r4, r5, r6, r7)
    a[0:16] = r0 
    a[16:32] = r1  
    a[32:48] = r2  
    a[48:64] = r3  
    a[64:80] = r4  
    a[80:96] = r5  
    a[96:112] = r6
    a[112:128] = r7

    r0 = a[128:144]
    r1 = a[144:160]
    r2 = a[160:176]
    r3 = a[176:192]
    r4 = a[192:208]
    r5 = a[208:224]
    r6 = a[224:240]
    r7 = a[240:256]
    r0, r1, r2, r3, r4, r5, r6, r7 = nttpack128(r0, r1, r2, r3, r4, r5, r6, r7)
    a[128:144] = r0 
    a[144:160] = r1  
    a[160:176] = r2  
    a[176:192] = r3  
    a[192:208] = r4  
    a[208:224] = r5  
    a[224:240] = r6
    a[240:256] = r7

    return a

def nttunpack(a):
    r0 = a[0:16]
    r1 = a[16:32]
    r2 = a[32:48]
    r3 = a[48:64]
    r4 = a[64:80]
    r5 = a[80:96]
    r6 = a[96:112]
    r7 = a[112:128]
    r0, r1, r2, r3, r4, r5, r6, r7 = nttunpack128(r0, r1, r2, r3, r4, r5, r6, r7)
    a[0:16] = r0 
    a[16:32] = r1  
    a[32:48] = r2  
    a[48:64] = r3  
    a[64:80] = r4  
    a[80:96] = r5  
    a[96:112] = r6
    a[112:128] = r7

    r0 = a[128:144]
    r1 = a[144:160]
    r2 = a[160:176]
    r3 = a[176:192]
    r4 = a[192:208]
    r5 = a[208:224]
    r6 = a[224:240]
    r7 = a[240:256]
    r0, r1, r2, r3, r4, r5, r6, r7 = nttunpack128(r0, r1, r2, r3, r4, r5, r6, r7)
    a[128:144] = r0 
    a[144:160] = r1  
    a[160:176] = r2  
    a[176:192] = r3  
    a[192:208] = r4  
    a[208:224] = r5  
    a[224:240] = r6
    a[240:256] = r7

    return a

def unpacksem(a):
  b = []
  for i in range(0, 256):
    b.append(128 * (i // 128) + (i // 16 % 8) + (8 * (i % 16)))
  return b
  
def packsem(a):
  b = []
  for i in range(0, 256):
    b.append(128 * (i // 128) + 16 * (i % 8) + (i % 16 // 8) + 2 * (i % 128 // 16))
  return b

