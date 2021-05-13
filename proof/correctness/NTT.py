def int2bs (n):
    return [((n // (2 ** k)) % 2) for k in range (8)]
    
def bs2int (l):
    n = 0
    for k in range (8):
        n += l[k] * (2**k)
    return n

def bitrev (n):
    return (bs2int(list(reversed(int2bs(n)))))

class exponent:

    def __init__(self):
        self.f = [[[0 for y in range (2**k)] for x in range (2**k)] for k in range (8)]

    def pp(self, m):
        for k in range (min(m, 8)):
            for x in range (2**k):
                print(self.f[k][x])
            print()

    def pp_bitrev(self, m):
        for k in range (min(m, 8)):
            for x in range (2**k):
                print(list(map(bitrev, self.f[k][x])))
            print()
    
    def fill_inductive(self):
        for k in range (7):
            p = 2**k
            for x in range (p):
                for y in range (p):
                    self.f[k+1][x][y]       = ((self.f[k][x][y]                             ) % 256)
                    self.f[k+1][x][p+y]     = ((self.f[k][x][y] + (2*x+1) * (2**(6-k))      ) % 256)
                    self.f[k+1][p+x][y]     = ((self.f[k][x][y]                             ) % 256)
                    self.f[k+1][p+x][p+y]   = ((self.f[k][x][y] + (2*x+1) * (2**(6-k)) + 128) % 256)
    
    def fill_prevision(self):
        for k in range (8):
            p = 2**k
            for x in range (p):
                for y in range (p):
                    self.f[k][x][y] = ((2*x + 1) * bitrev(2 * (y % (2**k)))) % 256

e_inductive = exponent()
e_prevision = exponent()
e_inductive.fill_inductive()
e_prevision.fill_prevision()
#e_inductive.pp(4)
#e_prevision.pp(4)
print(e_inductive.f == e_prevision.f)