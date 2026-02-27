from Jasmin require import JByte_array.

require import BArray512 BArray1536.

clone SubByteArray as SBArray1536_512  with theory Asmall <= BArray512,
                                            theory Abig <= BArray1536.
