#!/usr/bin/python

print "q = 7681"
print "Zq = Integers(q)"

print "w = Zq(3844)"
print "psi = Zq(62)"

print "R.<",
for i in range(255):
    print "f"+str(i)+",",
print "f255> = PolynomialRing(Zq,256)"


# NTT
for i in range(256):
    print "g"+str(i)+" = 0"
    for j in range(0,256):
        print "g"+str(i)+" += psi^"+str(j)+"*f"+str(j)+"*w^("+str(i*j)+")"


# INVNTT
for i in range(256):
    print "h"+str(i)+" = 0"
    for j in range(0,256):
        print "h"+str(i)+" += g"+str(j)+"*w^("+str(-i*j)+")"
    print "h"+str(i)+" *= Zq(256^(-1))"
    print "h"+str(i)+" *= psi^(-"+str(i)+")"



# Check equality
for i in range(256):
    print "print h"+str(i)+" == f"+str(i)
