from Jasmin require import JByte_array.

require import BArray512 BArray8192.

clone SubByteArray as SBArray8192_512  with theory Asmall <= BArray512,
                                            theory Abig <= BArray8192.
