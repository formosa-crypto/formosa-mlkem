from Jasmin require import JByte_array.

require import BArray512 BArray4608.

clone SubByteArray as SBArray4608_512  with theory Asmall <= BArray512,
                                            theory Abig <= BArray4608.
