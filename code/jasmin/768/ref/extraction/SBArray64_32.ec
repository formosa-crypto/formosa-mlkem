from Jasmin require import JByte_array.

require import BArray32 BArray64.

clone SubByteArray as SBArray64_32  with theory Asmall <= BArray32,
                                         theory Abig <= BArray64.
