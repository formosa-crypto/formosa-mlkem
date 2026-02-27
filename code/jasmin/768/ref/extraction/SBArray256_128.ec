from Jasmin require import JByte_array.

require import BArray128 BArray256.

clone SubByteArray as SBArray256_128  with theory Asmall <= BArray128,
                                           theory Abig <= BArray256.
