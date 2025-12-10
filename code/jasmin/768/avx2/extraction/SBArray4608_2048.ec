from Jasmin require import JByte_array.

require import BArray2048 BArray4608.

clone SubByteArray as SBArray4608_2048  with theory Asmall <= BArray2048,
                                             theory Abig <= BArray4608.
