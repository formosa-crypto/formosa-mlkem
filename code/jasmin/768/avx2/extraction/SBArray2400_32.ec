from Jasmin require import JByte_array.

require import BArray32 BArray2400.

clone SubByteArray as SBArray2400_32  with theory Asmall <= BArray32,
                                           theory Abig <= BArray2400.
