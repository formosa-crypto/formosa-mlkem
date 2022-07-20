

q = 3329
qinv = inverse_mod(-q,2^16) # 3327
minus_qinv = 2^16-qinv # 62209

def mzqinv(z):
    return (z*minus_qinv % 2^16)

brz = [2285, 2571, 2970, 1812, 1493, 1422, 287, 202, 3158, 622, 1577, 182, 962, 2127, 1855, 1468, 
       573, 2004, 264, 383, 2500, 1458, 1727, 3199, 2648, 1017, 732, 608, 1787, 411, 3124, 1758, 
       1223, 652, 2777, 1015, 2036, 1491, 3047, 1785, 516, 3321, 3009, 2663, 1711, 2167, 126, 1469, 
       2476, 3239, 3058, 830, 107, 1908, 3082, 2378, 2931, 961, 1821, 2604, 448, 2264, 677, 2054, 
       2226, 430, 555, 843, 2078, 871, 1550, 105, 422, 587, 177, 3094, 3038, 2869, 1574, 1653, 
       3083, 778, 1159, 3182, 2552, 1483, 2727, 1119, 1739, 644, 2457, 349, 418, 329, 3173, 3254, 
       817, 1097, 603, 610, 1322, 2044, 1864, 384, 2114, 3193, 1218, 1994, 2455, 220, 2142, 1670, 
       2144, 1799, 2051, 794, 1819, 2475, 2459, 478, 3221, 3021, 996, 991, 958, 1869, 1522, 1628]

zetas400 = [31499, 31499,  2571,  2571, 14746, 14746,  2970,  2970, 13525, 13525, 13525, 13525, 13525, 13525, 13525, 13525,
                       53134, 53134, 53134, 53134, 53134, 53134, 53134, 53134, 1493,  1493,  1493,  1493,  1493,  1493,  1493,  1493,
                        1422,  1422,  1422,  1422,  1422,  1422,  1422,  1422, 44630, 44630, 44630, 44630, 27758, 27758, 27758, 27758,
                       61737, 61737, 61737, 61737, 49846, 49846, 49846, 49846, 3158,  3158,  3158,  3158,   622,   622,   622,   622,
                        1577,  1577,  1577,  1577,   182,   182,   182,   182, 59709, 59709, 17364, 17364, 39176, 39176, 36479, 36479,
                        5572,  5572, 64434, 64434, 21439, 21439, 39295, 39295, 573,   573,  2004,  2004,   264,   264,   383,   383,
                        2500,  2500,  1458,  1458,  1727,  1727,  3199,  3199, 59847, 59020,  1497, 30967, 41972, 20179, 20711, 25081,
                       52740, 26617, 16065, 53095,  9135, 64887, 39550, 27837, 1223,   652,  2777,  1015,  2036,  1491,  3047,  1785,
                         516,  3321,  3009,  2663,  1711,  2167,   126,  1469, 65202, 54059, 33310, 20494, 37798,   945, 50654,  6182,
                       32011, 10631, 29176, 36775, 47051, 17561, 51106, 60261, 2226,   555,  2078,  1550,   422,   177,  3038,  1574,
                        3083,  1159,  2552,  2727,  1739,  2457,   418,  3173, 11182, 13387, 51303, 43881, 13131, 60950, 23093,  5493,
                       33034, 30318, 46795, 12639, 20100, 18525, 19529, 52918, 430,   843,   871,   105,   587,  3094,  2869,  1653,
                         778,  3182,  1483,  1119,   644,   349,   329,  3254, 788,   788,  1812,  1812, 28191, 28191, 28191, 28191,
                       28191, 28191, 28191, 28191, 48842, 48842, 48842, 48842, 48842, 48842, 48842, 48842,   287,   287,   287,   287,
                         287,   287,   287,   287,   202,   202,   202,   202, 202,   202,   202,   202, 10690, 10690, 10690, 10690,
                        1359,  1359,  1359,  1359, 54335, 54335, 54335, 54335, 31164, 31164, 31164, 31164,   962,   962,   962,   962,
                        2127,  2127,  2127,  2127,  1855,  1855,  1855,  1855, 1468,  1468,  1468,  1468, 37464, 37464, 24313, 24313,
                       55004, 55004,  8800,  8800, 18427, 18427,  8859,  8859, 26676, 26676, 49374, 49374,  2648,  2648,  1017,  1017,
                         732,   732,   608,   608,  1787,  1787,   411,   411, 3124,  3124,  1758,  1758, 19884, 37287, 49650, 56638,
                       37227,  9076, 35338, 18250, 13427, 14017, 36381, 52780, 16832,  4312, 41381, 47622,  2476,  3239,  3058,   830,
                         107,  1908,  3082,  2378,  2931,   961,  1821,  2604, 448,  2264,   677,  2054, 34353, 25435, 58154, 24392,
                       44610, 10946, 24215, 16990, 10336, 57603, 43035, 10907, 31637, 28644, 23998, 48114,   817,   603,  1322,  1864,
                        2114,  1218,  2455,  2142,  2144,  2051,  1819,  2459, 3221,   996,   958,  1522, 20297,  2146, 15356, 33152,
                       59257, 50634, 54492, 14470, 44039, 45338, 23211, 48094, 41677, 45279,  7757, 23132,  1097,   610,  2044,   384,
                        3193,  1994,   220,  1670,  1799,   794,  2475,   478, 3021,   991,  1869,  1628,     0,     0,     0,     0]

def mkrow(l,side=0):
    r = []
    start = int(2**l)
    for k in range(2**(l-1)):
        print(int(2**(5-l)),'*',start+k+side*2**(l-1))
        r += int(2**(5-l))*[brz[start+k+side*2**(l-1)]]
    return list(map(mzqinv, r)) + r

def mkrow6(side=0):
    rA = []
    rB = []
    ias = []
    ibs = []
    for k in range(16):
        rA.append(brz[64+2*k+side*32])
        ias.append(64+2*k+side*32)
        rB.append(brz[64+2*k+1+side*32])
        ibs.append(64+2*k+1+side*32)
    print(ias,ibs)
    return list(map(mzqinv, rA)) + rA + list(map(mzqinv, rB)) + rB

#Level 0
z400 = 2*[mzqinv(brz[1])] + 2*[brz[1]]
print('0',len(z400))
#Level 1
z400 += 2*[mzqinv(brz[2])] + 2*[brz[2]]
print('1',len(z400))
#Level 2
z400 += mkrow(2)
print('2',len(z400))
#Level 3
z400 += mkrow(3)
print('3',len(z400))
#Level 4
z400 += mkrow(4)
print('4',len(z400))
#Level 5
z400 += mkrow(5)
print('5',len(z400))
# Level 6
z400 += mkrow6()
print('6',len(z400))
#Level 1
z400 += 2*[mzqinv(brz[3])] + 2*[brz[3]]
print('1',len(z400))
#Level 2
z400 += mkrow(2,side=1)
print('2',len(z400))
#Level 3
z400 += mkrow(3,side=1)
print('3',len(z400))
#Level 4
z400 += mkrow(4,side=1)
print('4',len(z400))
#Level 5
z400 += mkrow(5,side=1)
print('5',len(z400))
# Level 6
z400 += mkrow6(side=1)
print('6',len(z400))
# trail
z400 += 4*[0]

def chkz400(zs):
    for i in range(len(zs)):
        if zs[i]!=zetas400[i]:
            print("Error at pos",i,":",zs[i],"!=",zetas400[i])


chkz400(z400)