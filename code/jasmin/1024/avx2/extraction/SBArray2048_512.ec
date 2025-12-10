from Jasmin require import JByte_array.

require import BArray512 BArray2048.

clone SubByteArray as SBArray2048_512  with theory Asmall <= BArray512,
                                            theory Abig <= BArray2048.
