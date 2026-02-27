from Jasmin require import JByte_array.

require import BArray2048 BArray8192.

clone SubByteArray as SBArray8192_2048  with theory Asmall <= BArray2048,
                                             theory Abig <= BArray8192.
