from Jasmin require import JByte_array.

require import BArray32 BArray1600.

clone SubByteArray as SBArray1600_32  with theory Asmall <= BArray32,
                                           theory Abig <= BArray1600.
