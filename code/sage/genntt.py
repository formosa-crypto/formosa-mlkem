#!/usr/bin/python

print "q = 3329"
print "z = 17"

print "Zq = Integers(q)"
print "R.<",
for i in range(255):
    print "f"+str(i)+",",
print "f255> = PolynomialRing(Zq,256)"

br7 = [  0,  64,  32,  96,  16,  80,  48, 112,   8,  72,  40, 104,  24,  88,  56, 120, 
         4,  68,  36, 100,  20,  84,  52, 116,  12,  76,  44, 108,  28,  92,  60, 124, 
         2,  66,  34,  98,  18,  82,  50, 114,  10,  74,  42, 106,  26,  90,  58, 122, 
         6,  70,  38, 102,  22,  86,  54, 118,  14,  78,  46, 110,  30,  94,  62, 126, 
         1,  65,  33,  97,  17,  81,  49, 113,   9,  73,  41, 105,  25,  89,  57, 121, 
         5,  69,  37, 101,  21,  85,  53, 117,  13,  77,  45, 109,  29,  93,  61, 125, 
         3,  67,  35,  99,  19,  83,  51, 115,  11,  75,  43, 107,  27,  91,  59, 123, 
         7,  71,  39, 103,  23,  87,  55, 119,  15,  79,  47, 111,  31,  95,  63, 127];

# NTT
for i in range(128):
    print "g"+str(2*i)+" = 0"
    for j in range(0,128):
        print "g"+str(2*i)+" += f"+str(2*j)+"*z^((2*"+str(br7[i])+"+1)*"+str(j)+")"
for i in range(128):
    print "g"+str(2*i+1)+" = 0"
    for j in range(0,128):
        print "g"+str(2*i+1)+" += f"+str(2*j+1)+"*z^((2*"+str(br7[i])+"+1)*"+str(j)+")"


# TODO: replace by INVNTT
for i in range(256):
    print "h"+str(i)+" = f"+str(i)

# Check equality
for i in range(256):
    print "print h"+str(i)+" == f"+str(i)
