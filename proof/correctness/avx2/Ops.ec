require import List Int Ring IntExtra IntDiv CoreMap.
import Ring.IntID.
from Jasmin require import JModel JArray JWord_array.

require import Array2p Array4p Array8p Array16p Array32p WArray128p WArray160p.

type t8u32 = W32.t Array8.t.
type t4u32 = W32.t Array4.t.
type t16u16 = W16.t Array16.t.
type t8u16 = W16.t Array8.t.
type t32u8 = W8.t Array32.t.
type t16u8 = W8.t Array16.t.
type t2u64 = W64.t Array2.t.
type t4u64 = W64.t Array4.t.
type t2u128 = W128.t Array2.t.

hint simplify W8.of_intwE @0.

lemma pack2_bits32 (w: W64.t):
   pack2 [w \bits32 0; w \bits32 1] = w.
proof. by apply W2u32.allP. qed.

lemma pack16_bits16 (w: W256.t):
    pack16 [w \bits16 0; w \bits16 1; w \bits16 2; w \bits16 3; w \bits16 4; w \bits16 5; w \bits16 6; w \bits16 7;
    w \bits16 8; w \bits16 9; w \bits16 10; w \bits16 11; w \bits16 12; w \bits16 13; w \bits16 14; w \bits16 15] = w.
proof. by apply W16u16.allP. qed.

lemma pack2_bits32_red (w1 w2: W64.t):
   w1 = w2 =>
   pack2 [w1 \bits32 0; w2 \bits32 1] = w1.
proof. by move=> ->; apply pack2_bits32. qed.

lemma pack2_bits8 (w: W16.t):
   pack2 [w \bits8 0; w \bits8 1] = w.
proof. by apply W2u8.allP. qed.

lemma pack2_bits16 (w: W32.t):
   pack2 [w \bits16 0; w \bits16 1] = w.
proof. by apply W2u16.allP. qed.

lemma pack8_bits8 (w: W64.t):
    pack8 [w \bits8 0; w \bits8 1; w \bits8 2; w \bits8 3; w \bits8 4; w \bits8 5; w \bits8 6; w \bits8 7] = w.
proof. by apply W8u8.allP. qed.

hint simplify pack2_bits32_red @0.

module Ops = {
  proc itruncate_4u64_2u64(t : t4u64) : t2u64 = {
       return Array2.of_list witness [ t.[0]; t.[1] ];
  }

  proc get_128(vv : t4u64 Array4.t, i : int, o : int) : W64.t = {
    return vv.[i].[o];
  }

  proc iVPBROADCAST_2u128(v: W128.t) : t2u128 = {
    var r: t2u128;

    r.[0] <-v;
    r.[1] <-v;

    return r;
  }

  proc iVPBROADCAST_2u128_8u32(v: t4u32) : t8u32 = {
    var r: t8u32;

    r <- Array8.init (fun i => v.[i %% 4]);

    return r;
  }

  proc iVPBROADCAST_2u128_32u8(v: t16u8): t32u8 = {
    var r: t32u8;

    r <- Array32.init (fun i => v.[i %% 16]);

    return r;
  }

  proc iVPBROADCAST_4u64(v : W64.t) : t4u64 = {
    var r : t4u64;
    r.[0] <-v;
    r.[1] <-v;
    r.[2] <-v;
    r.[3] <-v;
    return r;
  }

 proc iVPBROADCAST_8u32(v : W32.t) : t8u32 = {
    var r : t8u32;

    r.[0] <- v;
    r.[1] <- v;
    r.[2] <- v;
    r.[3] <- v;
    r.[4] <- v;
    r.[5] <- v;
    r.[6] <- v;
    r.[7] <- v;

    return r;
  }

  proc iVPBROADCAST_16u16(v : W16.t) : t16u16 = {
    var r : t16u16;

    r.[0] <- v;
    r.[1] <- v;
    r.[2] <- v;
    r.[3] <- v;
    r.[4] <- v;
    r.[5] <- v;
    r.[6] <- v;
    r.[7] <- v;
    r.[8] <- v;
    r.[9] <- v;
    r.[10] <- v;
    r.[11] <- v;
    r.[12] <- v;
    r.[13] <- v;
    r.[14] <- v;
    r.[15] <- v;

    return r;
  }

  proc iVPMULH_256(x y: t16u16) : t16u16 = {
    var r : t16u16;
    r.[0] <- wmulhs x.[0] y.[0];
    r.[1] <- wmulhs x.[1] y.[1];
    r.[2] <- wmulhs x.[2] y.[2];
    r.[3] <- wmulhs x.[3] y.[3];
    r.[4] <- wmulhs x.[4] y.[4];
    r.[5] <- wmulhs x.[5] y.[5];
    r.[6] <- wmulhs x.[6] y.[6];
    r.[7] <- wmulhs x.[7] y.[7];
    r.[8] <- wmulhs x.[8] y.[8];
    r.[9] <- wmulhs x.[9] y.[9];
    r.[10] <- wmulhs x.[10] y.[10];
    r.[11] <- wmulhs x.[11] y.[11];
    r.[12] <- wmulhs x.[12] y.[12];
    r.[13] <- wmulhs x.[13] y.[13];
    r.[14] <- wmulhs x.[14] y.[14];
    r.[15] <- wmulhs x.[15] y.[15];

    return r;
  }

  proc iVPMULL_16u16(x y: t16u16) : t16u16 = {
    var r : t16u16;
    r.[0] <- x.[0] * y.[0];
    r.[1] <- x.[1] * y.[1];
    r.[2] <- x.[2] * y.[2];
    r.[3] <- x.[3] * y.[3];
    r.[4] <- x.[4] * y.[4];
    r.[5] <- x.[5] * y.[5];
    r.[6] <- x.[6] * y.[6];
    r.[7] <- x.[7] * y.[7];
    r.[8] <- x.[8] * y.[8];
    r.[9] <- x.[9] * y.[9];
    r.[10] <- x.[10] * y.[10];
    r.[11] <- x.[11] * y.[11];
    r.[12] <- x.[12] * y.[12];
    r.[13] <- x.[13] * y.[13];
    r.[14] <- x.[14] * y.[14];
    r.[15] <- x.[15] * y.[15];

    return r;
  }

  proc iVPMULU_256 (x y:t4u64) : t4u64 = {
    var r : t4u64;
    r.[0] <- mulu64 x.[0] y.[0];
    r.[1] <- mulu64 x.[1] y.[1];
    r.[2] <- mulu64 x.[2] y.[2];
    r.[3] <- mulu64 x.[3] y.[3];
    return r;
  }

  proc iVPMULHRS_256 (x y: t16u16) : t16u16 = {
    var r : t16u16;

    r.[0] <- round_scalew ((W16.to_sint x.[0]) * (W16.to_sint y.[0]));
    r.[1] <- round_scalew ((W16.to_sint x.[1]) * (W16.to_sint y.[1]));
    r.[2] <- round_scalew ((W16.to_sint x.[2]) * (W16.to_sint y.[2]));
    r.[3] <- round_scalew ((W16.to_sint x.[3]) * (W16.to_sint y.[3]));
    r.[4] <- round_scalew ((W16.to_sint x.[4]) * (W16.to_sint y.[4]));
    r.[5] <- round_scalew ((W16.to_sint x.[5]) * (W16.to_sint y.[5]));
    r.[6] <- round_scalew ((W16.to_sint x.[6]) * (W16.to_sint y.[6]));
    r.[7] <- round_scalew ((W16.to_sint x.[7]) * (W16.to_sint y.[7]));
    r.[8] <- round_scalew ((W16.to_sint x.[8]) * (W16.to_sint y.[8]));
    r.[9] <- round_scalew ((W16.to_sint x.[9]) * (W16.to_sint y.[9]));
    r.[10] <- round_scalew ((W16.to_sint x.[10]) * (W16.to_sint y.[10]));
    r.[11] <- round_scalew ((W16.to_sint x.[11]) * (W16.to_sint y.[11]));
    r.[12] <- round_scalew ((W16.to_sint x.[12]) * (W16.to_sint y.[12]));
    r.[13] <- round_scalew ((W16.to_sint x.[13]) * (W16.to_sint y.[13]));
    r.[14] <- round_scalew ((W16.to_sint x.[14]) * (W16.to_sint y.[14]));
    r.[15] <- round_scalew ((W16.to_sint x.[15]) * (W16.to_sint y.[15]));

    return r;
  }

  proc iVPMADDUBSW_256(x y: t32u8): t16u16 = {
    var r : t16u16;

    r.[0] <- packssw ((W8.to_uint x.[0]) * (W8.to_sint y.[0]) + (W8.to_uint x.[1]) * (W8.to_sint y.[1]));
    r.[1] <- packssw ((W8.to_uint x.[2]) * (W8.to_sint y.[2]) + (W8.to_uint x.[3]) * (W8.to_sint y.[3]));
    r.[2] <- packssw ((W8.to_uint x.[4]) * (W8.to_sint y.[4]) + (W8.to_uint x.[5]) * (W8.to_sint y.[5]));
    r.[3] <- packssw ((W8.to_uint x.[6]) * (W8.to_sint y.[6]) + (W8.to_uint x.[7]) * (W8.to_sint y.[7]));
    r.[4] <- packssw ((W8.to_uint x.[8]) * (W8.to_sint y.[8]) + (W8.to_uint x.[9]) * (W8.to_sint y.[9]));
    r.[5] <- packssw ((W8.to_uint x.[10]) * (W8.to_sint y.[10]) + (W8.to_uint x.[11]) * (W8.to_sint y.[11]));
    r.[6] <- packssw ((W8.to_uint x.[12]) * (W8.to_sint y.[12]) + (W8.to_uint x.[13]) * (W8.to_sint y.[13]));
    r.[7] <- packssw ((W8.to_uint x.[14]) * (W8.to_sint y.[14]) + (W8.to_uint x.[15]) * (W8.to_sint y.[15]));
    r.[8] <- packssw ((W8.to_uint x.[16]) * (W8.to_sint y.[16]) + (W8.to_uint x.[17]) * (W8.to_sint y.[17]));
    r.[9] <- packssw ((W8.to_uint x.[18]) * (W8.to_sint y.[18]) + (W8.to_uint x.[19]) * (W8.to_sint y.[19]));
    r.[10] <- packssw ((W8.to_uint x.[20]) * (W8.to_sint y.[20]) + (W8.to_uint x.[21]) * (W8.to_sint y.[21]));
    r.[11] <- packssw ((W8.to_uint x.[22]) * (W8.to_sint y.[22]) + (W8.to_uint x.[23]) * (W8.to_sint y.[23]));
    r.[12] <- packssw ((W8.to_uint x.[24]) * (W8.to_sint y.[24]) + (W8.to_uint x.[25]) * (W8.to_sint y.[25]));
    r.[13] <- packssw ((W8.to_uint x.[26]) * (W8.to_sint y.[26]) + (W8.to_uint x.[27]) * (W8.to_sint y.[27]));
    r.[14] <- packssw ((W8.to_uint x.[28]) * (W8.to_sint y.[28]) + (W8.to_uint x.[29]) * (W8.to_sint y.[29]));
    r.[15] <- packssw ((W8.to_uint x.[30]) * (W8.to_sint y.[30]) + (W8.to_uint x.[31]) * (W8.to_sint y.[31]));

    return r;
  }

  proc ivadd64u256(x y:t4u64) : t4u64 = {
    var r : t4u64;
    r.[0] <- x.[0] + y.[0];
    r.[1] <- x.[1] + y.[1];
    r.[2] <- x.[2] + y.[2];
    r.[3] <- x.[3] + y.[3];
    return r;
  }

  proc ivadd32u256(x y:t8u32) : t8u32 = {
    var r : t8u32;
    r.[0] <- x.[0] + y.[0];
    r.[1] <- x.[1] + y.[1];
    r.[2] <- x.[2] + y.[2];
    r.[3] <- x.[3] + y.[3];
    r.[4] <- x.[4] + y.[4];
    r.[5] <- x.[5] + y.[5];
    r.[6] <- x.[6] + y.[6];
    r.[7] <- x.[7] + y.[7];

    return r;
  }

  proc ivadd16u256(x y:t16u16) : t16u16 = {
    var r : t16u16;
    r.[0] <- x.[0] + y.[0];
    r.[1] <- x.[1] + y.[1];
    r.[2] <- x.[2] + y.[2];
    r.[3] <- x.[3] + y.[3];
    r.[4] <- x.[4] + y.[4];
    r.[5] <- x.[5] + y.[5];
    r.[6] <- x.[6] + y.[6];
    r.[7] <- x.[7] + y.[7];
    r.[8] <- x.[8] + y.[8];
    r.[9] <- x.[9] + y.[9];
    r.[10] <- x.[10] + y.[10];
    r.[11] <- x.[11] + y.[11];
    r.[12] <- x.[12] + y.[12];
    r.[13] <- x.[13] + y.[13];
    r.[14] <- x.[14] + y.[14];
    r.[15] <- x.[15] + y.[15];

    return r;
  }

  proc ivsub32u256(x y: t8u32) : t8u32 = {
    var r : t8u32;
    r.[0] <- x.[0] - y.[0];
    r.[1] <- x.[1] - y.[1];
    r.[2] <- x.[2] - y.[2];
    r.[3] <- x.[3] - y.[3];
    r.[4] <- x.[4] - y.[4];
    r.[5] <- x.[5] - y.[5];
    r.[6] <- x.[6] - y.[6];
    r.[7] <- x.[7] - y.[7];

    return r;
  }

  proc ivsub16u256(x y: t16u16) : t16u16 = {
    var r : t16u16;
    r.[0] <- x.[0] - y.[0];
    r.[1] <- x.[1] - y.[1];
    r.[2] <- x.[2] - y.[2];
    r.[3] <- x.[3] - y.[3];
    r.[4] <- x.[4] - y.[4];
    r.[5] <- x.[5] - y.[5];
    r.[6] <- x.[6] - y.[6];
    r.[7] <- x.[7] - y.[7];
    r.[8] <- x.[8] - y.[8];
    r.[9] <- x.[9] - y.[9];
    r.[10] <- x.[10] - y.[10];
    r.[11] <- x.[11] - y.[11];
    r.[12] <- x.[12] - y.[12];
    r.[13] <- x.[13] - y.[13];
    r.[14] <- x.[14] - y.[14];
    r.[15] <- x.[15] - y.[15];

    return r;
  }

  (* FIXME: equiv *)
  proc iload4u64 (mem:global_mem_t, p:W64.t) : t4u64 = {
    var r : t4u64;
    r.[0] <- loadW64 mem (to_uint p);
    r.[1] <- loadW64 mem (to_uint (p + W64.of_int 8));
    r.[2] <- loadW64 mem (to_uint (p + W64.of_int 16));
    r.[3] <- loadW64 mem (to_uint (p + W64.of_int 24));
    return r;
  }

  (* TODO: equiv *)
  proc iload16u16 (mem: global_mem_t, p: W64.t) : t16u16 = {
    var r : t16u16;

    r.[0] <- loadW16 mem (to_uint p);
    r.[1] <- loadW16 mem (to_uint (p + W64.of_int 2));
    r.[2] <- loadW16 mem (to_uint (p + W64.of_int 4));
    r.[3] <- loadW16 mem (to_uint (p + W64.of_int 6));
    r.[4] <- loadW16 mem (to_uint (p + W64.of_int 8));
    r.[5] <- loadW16 mem (to_uint (p + W64.of_int 10));
    r.[6] <- loadW16 mem (to_uint (p + W64.of_int 12));
    r.[7] <- loadW16 mem (to_uint (p + W64.of_int 14));
    r.[8] <- loadW16 mem (to_uint (p + W64.of_int 16));
    r.[9] <- loadW16 mem (to_uint (p + W64.of_int 18));
    r.[10] <- loadW16 mem (to_uint (p + W64.of_int 20));
    r.[11] <- loadW16 mem (to_uint (p + W64.of_int 22));
    r.[12] <- loadW16 mem (to_uint (p + W64.of_int 24));
    r.[13] <- loadW16 mem (to_uint (p + W64.of_int 26));
    r.[14] <- loadW16 mem (to_uint (p + W64.of_int 28));
    r.[15] <- loadW16 mem (to_uint (p + W64.of_int 30));

    return r;
  }

  proc istore32u8 (mem: global_mem_t, p: W64.t, w: t32u8): global_mem_t = {

    mem <- storeW8 mem (to_uint p + 0) w.[0];
    mem <- storeW8 mem (to_uint p + 1) w.[1];
    mem <- storeW8 mem (to_uint p + 2) w.[2];
    mem <- storeW8 mem (to_uint p + 3) w.[3];
    mem <- storeW8 mem (to_uint p + 4) w.[4];
    mem <- storeW8 mem (to_uint p + 5) w.[5];
    mem <- storeW8 mem (to_uint p + 6) w.[6];
    mem <- storeW8 mem (to_uint p + 7) w.[7];
    mem <- storeW8 mem (to_uint p + 8) w.[8];
    mem <- storeW8 mem (to_uint p + 9) w.[9];
    mem <- storeW8 mem (to_uint p + 10) w.[10];
    mem <- storeW8 mem (to_uint p + 11) w.[11];
    mem <- storeW8 mem (to_uint p + 12) w.[12];
    mem <- storeW8 mem (to_uint p + 13) w.[13];
    mem <- storeW8 mem (to_uint p + 14) w.[14];
    mem <- storeW8 mem (to_uint p + 15) w.[15];
    mem <- storeW8 mem (to_uint p + 16) w.[16];
    mem <- storeW8 mem (to_uint p + 17) w.[17];
    mem <- storeW8 mem (to_uint p + 18) w.[18];
    mem <- storeW8 mem (to_uint p + 19) w.[19];
    mem <- storeW8 mem (to_uint p + 20) w.[20];
    mem <- storeW8 mem (to_uint p + 21) w.[21];
    mem <- storeW8 mem (to_uint p + 22) w.[22];
    mem <- storeW8 mem (to_uint p + 23) w.[23];
    mem <- storeW8 mem (to_uint p + 24) w.[24];
    mem <- storeW8 mem (to_uint p + 25) w.[25];
    mem <- storeW8 mem (to_uint p + 26) w.[26];
    mem <- storeW8 mem (to_uint p + 27) w.[27];
    mem <- storeW8 mem (to_uint p + 28) w.[28];
    mem <- storeW8 mem (to_uint p + 29) w.[29];
    mem <- storeW8 mem (to_uint p + 30) w.[30];
    mem <- storeW8 mem (to_uint p + 31) w.[31];

    return mem;
  }

  proc iVPACKUS_8u32(x y: t8u32): t16u16 = {
    var r : t16u16;

    r.[0] <-
      if x.[0] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle x.[0] then (W16.of_int W16.max_uint)
      else x.[0] \bits16 0;
    r.[1] <-
      if x.[1] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle x.[1] then (W16.of_int W16.max_uint)
      else x.[1] \bits16 0;
    r.[2] <-
      if x.[2] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle x.[2] then (W16.of_int W16.max_uint)
      else x.[2] \bits16 0;
    r.[3] <-
      if x.[3] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle x.[3] then (W16.of_int W16.max_uint)
      else x.[3] \bits16 0;
    r.[4] <-
      if y.[0] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle y.[0] then (W16.of_int W16.max_uint)
      else y.[0] \bits16 0;
    r.[5] <-
      if y.[1] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle y.[1] then (W16.of_int W16.max_uint)
      else y.[1] \bits16 0;
    r.[6] <-
      if y.[2] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle y.[2] then (W16.of_int W16.max_uint)
      else y.[2] \bits16 0;
    r.[7] <-
      if y.[3] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle y.[3] then (W16.of_int W16.max_uint)
      else y.[3] \bits16 0;
    r.[8] <-
      if x.[4] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle x.[4] then (W16.of_int W16.max_uint)
      else x.[4] \bits16 0;
    r.[9] <-
      if x.[5] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle x.[5] then (W16.of_int W16.max_uint)
      else x.[5] \bits16 0;
    r.[10] <-
      if x.[6] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle x.[6] then (W16.of_int W16.max_uint)
      else x.[6] \bits16 0;
    r.[11] <-
      if x.[7] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle x.[7] then (W16.of_int W16.max_uint)
      else x.[7] \bits16 0;
    r.[12] <-
      if y.[4] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle y.[4] then (W16.of_int W16.max_uint)
      else y.[4] \bits16 0;
    r.[13] <-
      if y.[5] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle y.[5] then (W16.of_int W16.max_uint)
      else y.[5] \bits16 0;
    r.[14] <-
      if y.[6] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle y.[6] then (W16.of_int W16.max_uint)
      else y.[6] \bits16 0;
    r.[15] <-
      if y.[7] \slt W32.zero then W16.zero
      else if (W32.of_int W16.max_uint) \sle y.[7] then (W16.of_int W16.max_uint)
      else y.[7] \bits16 0;

    return r;
  }

  proc iVPACKUS_16u16(x y: t16u16) : t32u8 = {
    var r: t32u8;

    r.[0] <- packus16 x.[0];
    r.[1] <- packus16 x.[1];
    r.[2] <- packus16 x.[2];
    r.[3] <- packus16 x.[3];
    r.[4] <- packus16 x.[4];
    r.[5] <- packus16 x.[5];
    r.[6] <- packus16 x.[6];
    r.[7] <- packus16 x.[7];
    r.[8] <- packus16 y.[0];
    r.[9] <- packus16 y.[1];
    r.[10] <- packus16 y.[2];
    r.[11] <- packus16 y.[3];
    r.[12] <- packus16 y.[4];
    r.[13] <- packus16 y.[5];
    r.[14] <- packus16 y.[6];
    r.[15] <- packus16 y.[7];
    r.[16] <- packus16 x.[8];
    r.[17] <- packus16 x.[9];
    r.[18] <- packus16 x.[10];
    r.[19] <- packus16 x.[11];
    r.[20] <- packus16 x.[12];
    r.[21] <- packus16 x.[13];
    r.[22] <- packus16 x.[14];
    r.[23] <- packus16 x.[15];
    r.[24] <- packus16 y.[8];
    r.[25] <- packus16 y.[9];
    r.[26] <- packus16 y.[10];
    r.[27] <- packus16 y.[11];
    r.[28] <- packus16 y.[12];
    r.[29] <- packus16 y.[13];
    r.[30] <- packus16 y.[14];
    r.[31] <- packus16 y.[15];

    return r;
  }

  proc iVPACKSS_16u16(x y: t16u16) : t32u8 = {
    var r: t32u8;

    r.[0] <- packss16 x.[0];
    r.[1] <- packss16 x.[1];
    r.[2] <- packss16 x.[2];
    r.[3] <- packss16 x.[3];
    r.[4] <- packss16 x.[4];
    r.[5] <- packss16 x.[5];
    r.[6] <- packss16 x.[6];
    r.[7] <- packss16 x.[7];
    r.[8] <- packss16 y.[0];
    r.[9] <- packss16 y.[1];
    r.[10] <- packss16 y.[2];
    r.[11] <- packss16 y.[3];
    r.[12] <- packss16 y.[4];
    r.[13] <- packss16 y.[5];
    r.[14] <- packss16 y.[6];
    r.[15] <- packss16 y.[7];
    r.[16] <- packss16 x.[8];
    r.[17] <- packss16 x.[9];
    r.[18] <- packss16 x.[10];
    r.[19] <- packss16 x.[11];
    r.[20] <- packss16 x.[12];
    r.[21] <- packss16 x.[13];
    r.[22] <- packss16 x.[14];
    r.[23] <- packss16 x.[15];
    r.[24] <- packss16 y.[8];
    r.[25] <- packss16 y.[9];
    r.[26] <- packss16 y.[10];
    r.[27] <- packss16 y.[11];
    r.[28] <- packss16 y.[12];
    r.[29] <- packss16 y.[13];
    r.[30] <- packss16 y.[14];
    r.[31] <- packss16 y.[15];

    return r;
  }

  proc iVPERM2I128(x y:t4u64, p : W8.t) : t4u64 = {
    var r : t4u64;
    r <- witness;
    r.[0] <-
      let n = 0 in
      if p.[n + 3] then W64.of_int 0
      else
        let w = if p.[n+1] then y else x in
        if p.[n] then w.[2] else w.[0];
    r.[1] <-
      let n = 0 in
      if p.[n + 3] then W64.of_int 0
      else
        let w = if p.[n+1] then y else x in
        if p.[n] then w.[3] else w.[1];
    r.[2] <-
      let n = 4 in
      if p.[n + 3] then W64.of_int 0
      else
        let w = if p.[n+1] then y else x in
        if p.[n] then w.[2] else w.[0];
    r.[3] <-
      let n = 4 in
      if p.[n + 3] then W64.of_int 0
      else
        let w = if p.[n+1] then y else x in
        if p.[n] then w.[3] else w.[1];

    return r;
  }

  proc iVPERM2I128_16u16(x y: t16u16, p: W8.t): t16u16 = {
    var r: t16u16;

    r <- Array16.init(fun i => 
                      let n = 4 * (i %/ 8) in
                      if p.[n + 3] then W16.zero
                      else
                        let w = if p.[n + 1] then y else x in
                        if p.[n] then w.[8 + i %% 8] else w.[i %% 8]);

    return r;
  }

  proc iVPERM2I128o(x y:t2u128, p : W8.t) : t2u128 = {
    var r : t2u128;
    r <- witness;
    r.[0] <-
      if p.[3] then W128.zero
      else
        let w = if p.[1] then y else x in
        if p.[0] then w.[1] else w.[0];
    r.[1] <-
      let n = 0 in
      if p.[7] then W128.zero
      else
        let w = if p.[5] then y else x in
        if p.[4] then w.[1] else w.[0];

    return r;
  }

  proc iVPERMQ(x :t4u64, p : W8.t) : t4u64 = {
    var r : t4u64;

    r.[0] <- x.[ (to_uint p      ) %% 4 ];
    r.[1] <- x.[ (to_uint p %/  4) %% 4 ];
    r.[2] <- x.[ (to_uint p %/ 16) %% 4 ];
    r.[3] <- x.[ (to_uint p %/ 64) %% 4 ];

    return r;
  }


  proc iVPERMQ_32u8(x :t32u8, p : W8.t) : t32u8 = {
    var r : t32u8;

    r <- Array32.init (fun i => x.[8 * ((to_uint p %/ (Ring.IntID.(^) 4 (i %/ 8))) %% 4) + i %% 8]);
    (* r.[0] <- x.[ (to_uint p *)
    (* r.[0] <- x.[ *)
    (* r.[0] <- x.[ (to_uint p      ) %% 4 ]; *)
    (* r.[1] <- x.[ (to_uint p %/  4) %% 4 ]; *)
    (* r.[2] <- x.[ (to_uint p %/ 16) %% 4 ]; *)
    (* r.[3] <- x.[ (to_uint p %/ 64) %% 4 ]; *)

    return r;
  }

  proc iVPERMD(x p: t8u32) : t8u32 = {
    var r : t8u32;

    r <- witness;
    r.[0] <- x.[ (to_uint p.[0]) %% 8 ];
    r.[1] <- x.[ (to_uint p.[1]) %% 8 ];
    r.[2] <- x.[ (to_uint p.[2]) %% 8 ];
    r.[3] <- x.[ (to_uint p.[3]) %% 8 ];
    r.[4] <- x.[ (to_uint p.[4]) %% 8 ];
    r.[5] <- x.[ (to_uint p.[5]) %% 8 ];
    r.[6] <- x.[ (to_uint p.[6]) %% 8 ];
    r.[7] <- x.[ (to_uint p.[7]) %% 8 ];

    return r;
  }

  proc iVPSRLDQ_256(x:t4u64, p : W8.t) : t4u64 = {
    var r : t4u64;
    r <- witness;

    r.[0] <-
      if to_uint p = 8 then x.[1]
      else let i = min (to_uint p) 16 in
      if i < 8 then (x.[0] `>>>` 8 * i) `|` (x.[1] `<<<` (64 - 8 * i))
      else x.[1] `>>>` 8 * (i - 8);

    r.[1] <-
      let i = min (to_uint p) 16 in
      if i < 8 then x.[1] `>>>` 8 * i
      else W64.zero;

    r.[2] <-
      if to_uint p = 8 then x.[3]
      else let i = min (to_uint p) 16 in
      if i < 8 then (x.[2] `>>>` 8 * i) `|` (x.[3] `<<<` (64 - 8 * i))
      else x.[3] `>>>` 8 * (i - 8);

    r.[3] <-
      let i = min (to_uint p) 16 in
      if i < 8 then x.[3] `>>>` 8 * i
      else W64.zero;

    return r;
  }

  proc iVPUNPCKH_4u64(x y:t4u64) : t4u64 = {
    var r : t4u64;
    r.[0] <- x.[1];
    r.[1] <- y.[1];
    r.[2] <- x.[3];
    r.[3] <- y.[3];
    return r;
  }

  proc iVPUNPCKH_4u64_16u16(x y: t16u16): t16u16 = {
    var r: t16u16;

    r <- Array16.init (fun i => if ((i %/ 4 %% 2) = 0) then x.[8 * (i %/ 8) + 4 + (i %% 4)] else y.[8 * (i %/ 8) + 4 + (i %% 4)]);

    return r;
  }

  proc iVPUNPCKL_4u64 (x y:t4u64) : t4u64 = {
    var r : t4u64;
    r.[0] <- x.[0];
    r.[1] <- y.[0];
    r.[2] <- x.[2];
    r.[3] <- y.[2];
    return r;
  }

  proc iVPUNPCKL_4u64_16u16(x y: t16u16): t16u16 = {
    var r: t16u16;

    r <- Array16.init (fun i => if ((i %/ 4 %% 2) = 0) then x.[8 * (i %/ 8) + (i %% 4)] else y.[8 * (i %/ 8) + (i %% 4)]);

    return r;
  }

  proc iVPUNPCKH_16u16(x y:t16u16) : t16u16 = {
    var r : t16u16;

    r.[0] <- x.[4];
    r.[1] <- y.[4];
    r.[2] <- x.[5];
    r.[3] <- y.[5];
    r.[4] <- x.[6];
    r.[5] <- y.[6];
    r.[6] <- x.[7];
    r.[7] <- y.[7];
    r.[8] <- x.[12];
    r.[9] <- y.[12];
    r.[10] <- x.[13];
    r.[11] <- y.[13];
    r.[12] <- x.[14];
    r.[13] <- y.[14];
    r.[14] <- x.[15];
    r.[15] <- y.[15];

    return r;
  }

  proc iVPUNPCKL_16u16 (x y:t16u16) : t16u16 = {
    var r : t16u16;

    r.[0] <- x.[0];
    r.[1] <- y.[0];
    r.[2] <- x.[1];
    r.[3] <- y.[1];
    r.[4] <- x.[2];
    r.[5] <- y.[2];
    r.[6] <- x.[3];
    r.[7] <- y.[3];
    r.[8] <- x.[8];
    r.[9] <- y.[8];
    r.[10] <- x.[9];
    r.[11] <- y.[9];
    r.[12] <- x.[10];
    r.[13] <- y.[10];
    r.[14] <- x.[11];
    r.[15] <- y.[11];

    return r;
  }

  proc iVEXTRACTI128(x:t4u64, p : W8.t) : t2u64 = {
    var r : t2u64;
    r <- witness;
    r.[0] <- if p.[0] then x.[2] else x.[0];
    r.[1] <- if p.[0] then x.[3] else x.[1];
    return r;
  }

  proc iVPEXTR_64(x:t2u64, p : W8.t) : W64.t = {
    return x.[to_uint p];
  }

  proc iVPSRA_16u16 (x: t16u16, y: W8.t) : t16u16 = {
    var r : t16u16;

    r <- Array16.init (fun i => x.[i] `|>>` y);

    return r;
  }

  proc iVPSLL_16u16 (x: t16u16, y: W8.t) : t16u16 = {
    var r : t16u16;

    r <- Array16.init (fun i => x.[i] `<<` y);

    return r;
  }

  proc iVPSRL_8u32 (x: t8u32, y: W8.t) : t8u32 = {
    var r : t8u32;
    r.[0] <- x.[0] `>>` y;
    r.[1] <- x.[1] `>>` y;
    r.[2] <- x.[2] `>>` y;
    r.[3] <- x.[3] `>>` y;
    r.[4] <- x.[4] `>>` y;
    r.[5] <- x.[5] `>>` y;
    r.[6] <- x.[6] `>>` y;
    r.[7] <- x.[7] `>>` y;

    return r;
  }

  proc ivshr64u256 (x: t4u64, y: W8.t) : t4u64 = {
    var r : t4u64;
    r.[0] <- x.[0] `>>` y;
    r.[1] <- x.[1] `>>` y;
    r.[2] <- x.[2] `>>` y;
    r.[3] <- x.[3] `>>` y;
    return r;
  }

  proc ivshl64u256 (x: t4u64, y: W8.t) : t4u64 = {
    var r : t4u64;
    r.[0] <- x.[0] `<<` y;
    r.[1] <- x.[1] `<<` y;
    r.[2] <- x.[2] `<<` y;
    r.[3] <- x.[3] `<<` y;
    return r;
  }



  proc iVPSRLV_4u64 (x: t4u64, y: t4u64) : t4u64 = {
    var r : t4u64;
    r.[0] <- x.[0] `>>>` W64.to_uint y.[0];
    r.[1] <- x.[1] `>>>` W64.to_uint y.[1];
    r.[2] <- x.[2] `>>>` W64.to_uint y.[2];
    r.[3] <- x.[3] `>>>` W64.to_uint y.[3];
    return r;
  }

  proc iVPSLLV_4u64 (x: t4u64, y:  t4u64) : t4u64 = {
    var r : t4u64;
    r.[0] <- x.[0] `<<<` W64.to_uint y.[0];
    r.[1] <- x.[1] `<<<` W64.to_uint y.[1];
    r.[2] <- x.[2] `<<<` W64.to_uint y.[2];
    r.[3] <- x.[3] `<<<` W64.to_uint y.[3];
    return r;
  }

  proc iVPSLLV_8u32 (x: t8u32, y:  t8u32) : t8u32 = {
    var r : t8u32;

    r <- Array8.init (fun i => x.[i] `<<<` W32.to_uint y.[i]);

    return r;
  }

  proc iland4u64  (x y:t4u64) : t4u64 = {
    var r : t4u64;
    r.[0] <- x.[0] `&` y.[0];
    r.[1] <- x.[1] `&` y.[1];
    r.[2] <- x.[2] `&` y.[2];
    r.[3] <- x.[3] `&` y.[3];
    return r;
  }

  proc ilor4u64 (x y:t4u64) : t4u64 = {
    var r : t4u64;
    r.[0] <- x.[0] `|` y.[0];
    r.[1] <- x.[1] `|` y.[1];
    r.[2] <- x.[2] `|` y.[2];
    r.[3] <- x.[3] `|` y.[3];
    return r;
  }

  proc ivpand16u16 (x y: t16u16) : t16u16 = {
    var r : t16u16;

    r <- Array16.init (fun i => x.[i] `&` y.[i]);

    return r;
  }

  proc ilandn4u64(x y:t4u64) : t4u64 = {
    var r : t4u64;
    r.[0] <- invw x.[0] `&` y.[0];
    r.[1] <- invw x.[1] `&` y.[1];
    r.[2] <- invw x.[2] `&` y.[2];
    r.[3] <- invw x.[3] `&` y.[3];
    return r;
  }

  proc ilxor4u64(x y:t4u64) : t4u64 = {
    var r : t4u64;
    r.[0] <- x.[0] `^` y.[0];
    r.[1] <- x.[1] `^` y.[1];
    r.[2] <- x.[2] `^` y.[2];
    r.[3] <- x.[3] `^` y.[3];
    return r;
  }

  proc ilxor16u16 (x y: t16u16) : t16u16 = {
    var r : t16u16;

    r.[0] <- x.[0] `^` y.[0];
    r.[1] <- x.[1] `^` y.[1];
    r.[2] <- x.[2] `^` y.[2];
    r.[3] <- x.[3] `^` y.[3];
    r.[4] <- x.[4] `^` y.[4];
    r.[5] <- x.[5] `^` y.[5];
    r.[6] <- x.[6] `^` y.[6];
    r.[7] <- x.[7] `^` y.[7];
    r.[8] <- x.[8] `^` y.[8];
    r.[9] <- x.[9] `^` y.[9];
    r.[10] <- x.[10] `^` y.[10];
    r.[11] <- x.[11] `^` y.[11];
    r.[12] <- x.[12] `^` y.[12];
    r.[13] <- x.[13] `^` y.[13];
    r.[14] <- x.[14] `^` y.[14];
    r.[15] <- x.[15] `^` y.[15];

    return r;
  }

  proc iVPBLENDD_256(x y:t4u64, p : W8.t) : t4u64 = {
    var r : t4u64;
    r <- witness;
    r.[0] <-
      if p.[0] = p.[1] then
        let w = if p.[0] then y else x in
        w.[0]
      else
        let w0 = if p.[0] then y else x in
        let w1 = if p.[1] then y else x in
        W2u32.pack2 [w0.[0] \bits32 0; w1.[0] \bits32 1];
    r.[1] <-
      if p.[2] = p.[3] then
        let w = if p.[2] then y else x in
        w.[1]
      else
        let w0 = if p.[2] then y else x in
        let w1 = if p.[3] then y else x in
        W2u32.pack2 [w0.[1] \bits32 0; w1.[1] \bits32 1];
    r.[2] <-
      if p.[4] = p.[5] then
        let w = if p.[4] then y else x in
        w.[2]
      else
        let w0 = if p.[4] then y else x in
        let w1 = if p.[5] then y else x in
        W2u32.pack2 [w0.[2] \bits32 0; w1.[2] \bits32 1];
    r.[3] <-
      if p.[6] = p.[7] then
        let w = if p.[6] then y else x in
        w.[3]
      else
        let w0 = if p.[6] then y else x in
        let w1 = if p.[7] then y else x in
        W2u32.pack2 [w0.[3] \bits32 0; w1.[3] \bits32 1];

    return r;
  }

  proc iVPBLENDW_256(x y:t16u16, p : W8.t) : t16u16 = {
    var r : t16u16;
    r <- witness;
    r.[0] <- if p.[0] then y.[0] else x.[0];
    r.[1] <- if p.[1] then y.[1] else x.[1];
    r.[2] <- if p.[2] then y.[2] else x.[2];
    r.[3] <- if p.[3] then y.[3] else x.[3];
    r.[4] <- if p.[4] then y.[4] else x.[4];
    r.[5] <- if p.[5] then y.[5] else x.[5];
    r.[6] <- if p.[6] then y.[6] else x.[6];
    r.[7] <- if p.[7] then y.[7] else x.[7];
    r.[8] <- if p.[0] then y.[8] else x.[8];
    r.[9] <- if p.[1] then y.[9] else x.[9];
    r.[10] <- if p.[2] then y.[10] else x.[10];
    r.[11] <- if p.[3] then y.[11] else x.[11];
    r.[12] <- if p.[4] then y.[12] else x.[12];
    r.[13] <- if p.[5] then y.[13] else x.[13];
    r.[14] <- if p.[6] then y.[14] else x.[14];
    r.[15] <- if p.[7] then y.[15] else x.[15];

    return r;
  }

  (* FIXME:
  proc iVPSHUFD_256 (x :t4u64, p : W8.t) : t4u64 = {
    var r : t4u64;
    r <- witness;
    r.[0] <-
      let m = W8.to_uint p in
      let p1 = (m %/ (2^(2*0)))%%4 in
      let p2 = (m %/ (2^(2*1)))%%4 in
      if p1 %/ 2 = p2 %/ 2 /\ p1 %% 2 = 0 /\ p2 %% 2 = 1 then
        x.[p1 %/ 2]
      else
        pack2 [x.[p1 %/ 2] \bits32 p1 %% 2; x.[p2 %/ 2] \bits32 p2 %% 2];

    r.[1] <-
      let m = W8.to_uint p in
      let p1 = (m %/ (2^(2*2)))%%4 in
      let p2 = (m %/ (2^(2*3)))%%4 in
      if p1 %/ 2 = p2 %/ 2 /\ p1 %% 2 = 0 /\ p2 %% 2 = 1 then
        x.[p1 %/ 2]
      else
        pack2 [x.[p1 %/ 2] \bits32 p1 %% 2; x.[p2 %/ 2] \bits32 p2 %% 2];

    r.[2] <-
      let m = W8.to_uint p in
      let p1 = (m %/ (2^(2*0)))%%4 in
      let p2 = (m %/ (2^(2*1)))%%4 in
      if p1 %/ 2 = p2 %/ 2 /\ p1 %% 2 = 0 /\ p2 %% 2 = 1 then
        x.[p1 %/ 2 + 2]
      else
        pack2 [x.[p1 %/ 2 + 2] \bits32 p1 %% 2; x.[p2 %/ 2 + 2] \bits32 p2 %% 2];

    r.[3] <-
      let m = W8.to_uint p in
      let p1 = (m %/ (2^(2*2)))%%4 in
      let p2 = (m %/ (2^(2*3)))%%4 in
      if p1 %/ 2 = p2 %/ 2 /\ p1 %% 2 = 0 /\ p2 %% 2 = 1 then
        x.[p1 %/ 2 + 2]
      else
        pack2 [x.[p1 %/ 2 + 2] \bits32 p1 %% 2; x.[p2 %/ 2 + 2] \bits32 p2 %% 2];
    return r;
  }
  *)

  proc iVPSHUFD_256 (x :t8u32, p : W8.t) : t8u32 = {
    var r : t8u32;

    r <- Array8.init (fun i => let m = W8.to_uint p in
                               let pi = 4 * (i %/ 4) + (m %/ (Ring.IntID.(^) 2 (2*(i %% 4)))) %% 4 in
                               x.[pi]);
(*
    r <- witness;
    r.[0] <-
      let m = W8.to_uint p in
      let pi = (m %/ (2^(2*0)))%%4 in
      x.[pi];

    r.[1] <-
      let m = W8.to_uint p in
      let pi = (m %/ (2^(2*1)))%%4 in
      x.[pi];

    r.[2] <-
      let m = W8.to_uint p in
      let pi = (m %/ (2^(2*2)))%%4 in
      x.[pi];

    r.[3] <-
      let m = W8.to_uint p in
      let pi = (m %/ (2^(2*3)))%%4 in
      x.[pi];

    r.[4] <-
      let m = W8.to_uint p in
      let pi = (m %/ (2^(2*0)))%%4 in
      x.[4 + pi];

    r.[5] <-
      let m = W8.to_uint p in
      let pi = (m %/ (2^(2*1)))%%4 in
      x.[4 + pi];

    r.[6] <-
      let m = W8.to_uint p in
      let pi = (m %/ (2^(2*2)))%%4 in
      x.[4 + pi];

    r.[7] <-
      let m = W8.to_uint p in
      let pi = (m %/ (2^(2*3)))%%4 in
      x.[4 + pi];
*)
    return r;
  }

  proc iVPSHUFB_256 (x: t32u8, m: t32u8): t32u8 = {
    var r: t32u8;

    r <- Array32.init (fun i => let k = W8.to_uint m.[i] in
                               if 128 <= k then W8.zero
                               else x.[16 * (i %/ 16) + k %% 16]);
    return r;
  }

  proc iVPMOVMSKB_u256_u32(x: t32u8): W32.t = {
    var rb: bool list;

    rb <- mkseq (fun i => W8.msb(x.[i])) 32;

    return W32.bits2w(rb);
  }
}.

type vt2u64 = W128.t.
type vt8u16 = W128.t.
type vt4u32 = W128.t.
type vt16u8 = W128.t.
type vt4u64 = W256.t.
type vt8u32 = W256.t.
type vt16u16 = W256.t.
type vt32u8 = W256.t.
type vt2u128 = W256.t.

module OpsV = {
  proc itruncate_4u64_2u64(t : vt4u64) : vt2u64 = {
       return truncateu128 t;
  }

  proc get_128(vv : vt4u64 Array4.t, i : int, o : int) : W64.t = {
    return (get64 (WArray128.init256 (fun i2 => vv.[i2])) (o+4*i));
  }

  proc iVPBROADCAST_2u128(v : W128.t) : vt2u128 = {
    return VPBROADCAST_2u128 v;
  }

  proc iVPBROADCAST_2u128_8u32(v : vt4u32) : vt8u32 = {
    return VPBROADCAST_2u128 v;
  }

  proc iVPBROADCAST_2u128_32u8(v : vt16u8) : vt32u8 = {
    return VPBROADCAST_2u128 v;
  }

  proc iVPBROADCAST_4u64(v : W64.t) : vt4u64 = {
    return VPBROADCAST_4u64 v;
  }

  proc iVPBROADCAST_8u32(v : W32.t) : vt8u32 = {
    return VPBROADCAST_8u32 v;
  }

  proc iVPBROADCAST_16u16(v : W16.t) : vt16u16 = {
    return VPBROADCAST_16u16 v;
  }

  proc iVPMULH_256 (x y: vt16u16) : vt16u16 = {
    return VPMULH_16u16 x y;
  }

  proc iVPMULL_16u16 (x y: vt16u16) : vt16u16 = {
    return VPMULL_16u16 x y;
  }

  proc iVPMULU_256 (x y:vt4u64) : vt4u64 = {
    return VPMULU_256 x y;
  }

  proc iVPMULHRS_256(x y: vt16u16): vt16u16 = {
    return VPMULHRSW_256 x y;
  }

  proc iVPMADDUBSW_256(x y: vt32u8): vt16u16 = {
    return VPMADDUBSW_256 x y;
  }

  proc ivadd64u256(x y:vt4u64) : vt4u64 = {
    return VPADD_4u64 x y;
  }

  proc ivadd32u256(x y:vt8u32) : vt8u32 = {
    return VPADD_8u32 x y;
  }

  proc ivadd16u256(x y:vt16u16) : vt16u16 = {
    return VPADD_16u16 x y;
  }

  proc ivsub32u256(x y: vt8u32) : vt8u32 = {
    return VPSUB_8u32 x y;
  }

  proc ivsub16u256(x y: vt16u16) : vt16u16 = {
    return VPSUB_16u16 x y;
  }

  proc iload4u64 (mem: global_mem_t, p:W64.t) : vt4u64 = {
    return loadW256 mem (to_uint p);
  }

  proc iload16u16 (mem: global_mem_t, p: W64.t) : vt16u16 = {
    return loadW256 mem (to_uint p);
  }

  proc istore32u8 (mem: global_mem_t, p: W64.t, w: vt32u8): global_mem_t = {
    return storeW256 mem (W64.to_uint p) w;
  }

  proc iVPACKUS_8u32(x y: vt8u32) : vt16u16 = {
    return VPACKUS_8u32 x y;
  }

  proc iVPACKUS_16u16(x y: vt16u16) : vt32u8 = {
    return VPACKUS_16u16 x y;
  }

  proc iVPACKSS_16u16(x y: vt16u16) : vt32u8 = {
    return VPACKSS_16u16 x y;
  }

  proc iVPERM2I128(x y:vt4u64, p : W8.t) : vt4u64 = {
    return VPERM2I128 x y p;
  }

  proc iVPERM2I128_16u16(x y: vt16u16, p: W8.t): vt16u16 = {
    return VPERM2I128 x y p;
  }

  proc iVPERM2I128o(x y:vt2u128, p : W8.t) : vt2u128 = {
    return VPERM2I128 x y p;
  }

  proc iVPERMQ(x :vt4u64, p : W8.t) : vt4u64 = {
    return VPERMQ x p;
  }

  proc iVPERMQ_32u8(x: vt32u8, p : W8.t) : vt32u8 = {
    return VPERMQ x p;
  }

  proc iVPERMD(x p: vt8u32) : vt8u32 = {
    return VPERMD x p;
 }

  proc iVPSRLDQ_256(x:vt4u64, p : W8.t) : vt4u64 = {
    return VPSRLDQ_256 x p;
  }

  proc iVPUNPCKH_4u64(x y:vt4u64) : vt4u64 = {
    return VPUNPCKH_4u64 x y;
  }

  proc iVPUNPCKH_4u64_16u16(x y: vt16u16): vt16u16 = {
    return VPUNPCKH_4u64 x y;
  }

  proc iVPUNPCKL_4u64 (x y:vt4u64) : vt4u64 = {
    return VPUNPCKL_4u64 x y;
  }

  proc iVPUNPCKL_4u64_16u16(x y: vt16u16): vt16u16 = {
    return VPUNPCKL_4u64 x y;
  }

  proc iVPUNPCKH_16u16(x y:vt16u16) : vt16u16 = {
    return VPUNPCKH_16u16 x y;
  }

  proc iVPUNPCKL_16u16 (x y:vt16u16) : vt16u16 = {
    return VPUNPCKL_16u16 x y;
  }

  proc iVEXTRACTI128(x:vt4u64, p : W8.t) : vt2u64 = {
    return VEXTRACTI128 x p;
  }

  proc iVPEXTR_64(x:vt2u64, p : W8.t) : W64.t = {
    return VPEXTR_64 x p;
  }

  proc iVPSRA_16u16 (x: vt16u16, y: W8.t) : vt16u16 = {
    return VPSRA_16u16 x y;
  }

  proc iVPSLL_16u16 (x: vt16u16, y: W8.t) : vt16u16 = {
    return VPSLL_16u16 x y;
  }

  proc iVPSRL_8u32 (x: vt8u32, y: W8.t) : vt8u32 = {
    return VPSRL_8u32 x y;
  }

  proc ivshr64u256 (x: vt4u64, y: W8.t) : vt4u64 = {
    return VPSRL_4u64 x y;
  }

  proc ivshl64u256 (x: vt4u64, y: W8.t) : vt4u64 = {
    return VPSLL_4u64 x y;
  }

  proc iVPSRLV_4u64 (x: vt4u64, y: vt4u64) : vt4u64 = {
    return VPSRLV_4u64 x y;
  }

  proc iVPSLLV_4u64 (x: vt4u64, y: vt4u64) : vt4u64 = {
    return VPSLLV_4u64 x y;
  }

  proc iVPSLLV_8u32 (x: vt8u32, y: vt8u32) : vt8u32 = {
    return VPSLLV_8u32 x y;
  }

  proc ivpand16u16 (x: vt16u16, y: vt16u16) : vt16u16 = {
    return VPAND_256 x y;
  }

  proc iland4u64  (x y: vt4u64) : vt4u64 = {
    return x `&` y;
  }

  proc ilor4u64 (x y: vt4u64) : vt4u64 = {
    return x `|` y;
  }

  proc ilandn4u64(x y: vt4u64) : vt4u64 = {
    return VPANDN_256 x y;
  }

  proc ilxor4u64(x y: vt4u64) : vt4u64 = {
    return x `^` y;
  }

  proc ilxor16u16(x y: vt16u16) : vt16u16 = {
    return x `^` y;
  }

  proc iVPBLENDD_256(x y:vt4u64, p : W8.t) :  vt4u64 = {
    return VPBLENDD_256 x y p;
  }

  proc iVPBLENDW_256(x y:vt16u16, p : W8.t) :  vt16u16 = {
    return VPBLENDW_256 x y p;
  }
  (*
  proc iVPSHUFD_256 (x :vt4u64, p : W8.t) : vt4u64 = {
    return VPSHUFD_256 x p;
  }
  *)

  proc iVPSHUFD_256 (x :vt8u32, p : W8.t) : vt8u32 = {
    return VPSHUFD_256 x p;
  }

  proc iVPSHUFB_256 (x: vt32u8, m: vt32u8): vt32u8 = {
    return VPSHUFB_256 x m;
  }

  proc iVPMOVMSKB_u256_u32(x: vt32u8): W32.t = {
    return VPMOVMSKB_u256_u32 x;
  }
}.

op is16u8 (x: t16u8) (xv: vt16u8) = xv = W16u8.pack16 [x.[0]; x.[1]; x.[2]; x.[3]; x.[4]; x.[5]; x.[6]; x.[7];
  x.[8]; x.[9]; x.[10]; x.[11]; x.[12]; x.[13]; x.[14]; x.[15]].
op is8u16 (x: t8u16) (xv: vt8u16) = xv = W8u16.pack8 [x.[0]; x.[1]; x.[2]; x.[3]; x.[4]; x.[5]; x.[6]; x.[7]].
op is4u32 (x: t4u32) (xv: vt4u32) = xv = W4u32.pack4 [x.[0]; x.[1]; x.[2]; x.[3]].
op is2u64 (x: t2u64) (xv: vt2u64)  = xv = W2u64.pack2 [x.[0]; x.[1]].

op is32u8 (x: t32u8) (xv: vt32u8) = xv = W32u8.pack32 [x.[0]; x.[1]; x.[2]; x.[3]; x.[4]; x.[5]; x.[6]; x.[7];
                                                        x.[8]; x.[9]; x.[10]; x.[11]; x.[12]; x.[13]; x.[14]; x.[15];
                                                        x.[16]; x.[17]; x.[18]; x.[19]; x.[20]; x.[21]; x.[22]; x.[23];
                                                        x.[24]; x.[25]; x.[26]; x.[27]; x.[28]; x.[29]; x.[30]; x.[31]].
op is16u16 (x: t16u16) (xv: vt16u16) = xv = W16u16.pack16 [x.[0]; x.[1]; x.[2]; x.[3]; x.[4]; x.[5]; x.[6]; x.[7];
  x.[8]; x.[9]; x.[10]; x.[11]; x.[12]; x.[13]; x.[14]; x.[15]].
op is8u32 (x: t8u32) (xv: vt8u32) = xv = W8u32.pack8 [x.[0]; x.[1]; x.[2]; x.[3]; x.[4]; x.[5]; x.[6]; x.[7]].
op is4u64 (x: t4u64) (xv: vt4u64) = xv = W4u64.pack4 [x.[0]; x.[1]; x.[2]; x.[3]].
op is2u128 (x: t2u128) (xv: vt2u128) = xv = W2u128.pack2 [x.[0]; x.[1]].


(* TODO *)
lemma ivadd16u256_spec x_ y_ : hoare[Ops.ivadd16u256 : x = x_ /\ y = y_ ==> forall i, res.[i] = x_.[i] + y_.[i]].
admitted.

equiv eq_itruncate_4u64_2u64 : Ops.itruncate_4u64_2u64 ~ OpsV.itruncate_4u64_2u64 : is4u64 t{1} t{2} ==> is2u64 res{1} res{2}.
proof.
  proc; skip => &1 &2; rewrite /is2u64 /is4u64 => -> /=.
  apply (Core.can_inj _ _ W128.to_uintK).
  rewrite to_uint_truncateu128.
  rewrite - (W128.to_uint_small (to_uint (pack4 [t{1}.[0]; t{1}.[1]; t{1}.[2]; t{1}.[3]]) %% W128.modulus)).
  + by apply modz_cmp.
  congr; apply W128.wordP => i hi.
  rewrite W128.of_intwE hi W2u64.pack2wE 1:// /=.
  rewrite /int_bit /= modz_mod.
  have /= -> := modz_pow2_div 128 i; 1:smt().
  rewrite (modz_dvd_pow 1 (128 - i) _ 2) 1:/# /=.
  have : (to_uint (pack4 [t{1}.[0]; t{1}.[1]; t{1}.[2]; t{1}.[3]]) %/ (IntExtra.(^) 2 i) %% 2 <> 0) =
            (pack4 [t{1}.[0]; t{1}.[1]; t{1}.[2]; t{1}.[3]]).[i].
  + rewrite -{2}(W256.to_uintK (pack4 [t{1}.[0]; t{1}.[1]; t{1}.[2]; t{1}.[3]])) W256.of_intwE /int_bit (modz_small _ W256.modulus) 2:/#.
    by have /= := W256.to_uint_cmp  (pack4 [t{1}.[0]; t{1}.[1]; t{1}.[2]; t{1}.[3]]);rewrite /(`|_|).
  rewrite W4u64.pack4wE 1:/#.
  case: (i < 64) => hi'.
  admit.
  (* FIXME
  + by rewrite divz_small 1:/#.
  *)
  have -> // : i %/ 64 = 1.
  have -> : i = (i -64) + 1 * 64 by done.
  rewrite divzMDr 1://; smt(divz_small).
  admit.
qed.

op is4u64_4 (x:t4u64 Array4.t) (xv:vt4u64 Array4.t) =
  xv = Array4.init (fun i => W4u64.pack4 [x.[i].[0]; x.[i].[1]; x.[i].[2]; x.[i].[3]]).

lemma get8_pack4u64 ws j:
  W4u64.pack4_t ws \bits8 j =
    if 0 <= j < 32 then ws.[j %/ 8] \bits8 (j %% 8) else W8.zero.
proof.
  rewrite pack4E W8.wordP => i hi.
  rewrite bits8E /= initE hi /= initE.
  have -> /= : (0 <= j * 8 + i < 256) <=> (0 <= j < 32) by smt().
  case : (0 <= j < 32) => hj //=.
  rewrite bits8E /= initE.
  have -> : (j * 8 + i) %/ 64 = j %/ 8.
  + rewrite {1}(divz_eq j 8) mulzDl mulzA /= -addzA divzMDl //.
    by rewrite (divz_small _ 64) //; smt (modz_cmp).
  rewrite hi /=;congr.
  rewrite {1}(divz_eq j 8) mulzDl mulzA /= -addzA modzMDl modz_small //; smt (modz_cmp).
qed.

equiv eq_get_128 : Ops.get_128 ~ OpsV.get_128 : is4u64_4 vv{1} vv{2} /\ ={i,o} /\ 0 <= i{1} < 4 /\ 0 <= o{1} < 4 ==> ={res}.
proof.
  proc;skip;rewrite /is4u64_4 => /> &1 &2 h1 h2 h3 h4.
  rewrite /init256 get64E -(W8u8.unpack8K vv{1}.[i{2}].[o{2}]);congr.
  apply W8u8.Pack.packP => j hj.
  (* FIXME
  rewrite W8u8.Pack.initiE 1:// initiE 1:// /= initiE 1:/# /=.
  have -> : (8 * (o{2} + 4 * i{2}) + j) = (o{2} * 8 + j) + i{2} * 32 by ring.
  have ? : 0 <= o{2} * 8 + j < `|32| by smt().
  rewrite modzMDr divzMDr 1:// divz_small 1:// modz_small 1:// /=.
  rewrite Array4.initiE 1:// /= get8_pack4u64.
  have /= <- := W4u64.Pack.init_of_list (fun j => vv{1}.[i{2}].[j]).
  rewrite divzMDl 1:// divz_small 1:// modzMDl /= initiE 1:// modz_small 1:// /#.
  *)
  admit.
qed.

equiv eq_ivadd64u256: Ops.ivadd64u256 ~ OpsV.ivadd64u256 : is4u64 x{1} x{2} /\ is4u64 y{1} y{2} ==> is4u64 res{1} res{2}.
proof. by proc;wp;skip;rewrite /is4u64 /VPADD_4u64. qed.

equiv eq_iVPMULH_256 : Ops.iVPMULH_256 ~ OpsV.iVPMULH_256: is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. proc; by wp; skip; rewrite /is16u16 /VPMULH. qed.

equiv eq_iVPMULL_16u16 : Ops.iVPMULL_16u16 ~ OpsV.iVPMULL_16u16: is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. proc; by wp; skip; rewrite /is16u16 /VPMULH. qed.

equiv eq_iVPMULU_256 : Ops.iVPMULU_256 ~ OpsV.iVPMULU_256 : is4u64 x{1} x{2} /\ is4u64 y{1} y{2} ==> is4u64 res{1} res{2}.
proof. by proc;wp;skip;rewrite /is4u64 => /> &1; rewrite /VPMULU_256. qed.

equiv eq_iVPMULHRS_256 : Ops.iVPMULHRS_256 ~ OpsV.iVPMULHRS_256 : is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. by proc;wp;skip;rewrite /is16u16 => /> &1; rewrite /VPMULHRSW_256 /round_scalew. qed.

equiv eq_ivadd32u256: Ops.ivadd32u256 ~ OpsV.ivadd32u256 : is8u32 x{1} x{2} /\ is8u32 y{1} y{2} ==> is8u32 res{1} res{2}.
proof. by proc;wp;skip;rewrite /is8u32 /VPADD_8u32. qed.

equiv eq_ivadd16u256: Ops.ivadd16u256 ~ OpsV.ivadd16u256 : is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. by proc;wp;skip;rewrite /is16u16 /VPADD_16u16. qed.

equiv eq_ivsub32u256: Ops.ivsub32u256 ~ OpsV.ivsub32u256 : is8u32 x{1} x{2} /\ is8u32 y{1} y{2} ==> is8u32 res{1} res{2}.
proof. by proc;wp;skip;rewrite /is8u32 /VPSUB_8u32. qed.

equiv eq_ivsub16u256: Ops.ivsub16u256 ~ OpsV.ivsub16u256 : is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. by proc;wp;skip;rewrite /is16u16 /VPSUB_16u16. qed.

equiv eq_iVPBROADCAST_2u128 : Ops.iVPBROADCAST_2u128 ~ OpsV.iVPBROADCAST_2u128 : ={v} ==> is2u128 res{1} res{2}.
proof.
  proc; wp; skip.
  move => &1 &2 v_eq.
  rewrite /is2u128 /VPBROADCAST_2u128.
  rewrite get_setE //=.
  rewrite -createL.
  apply W2u128.wordP => i i_bnds.
  do rewrite -get_unpack128 //=.
  rewrite createiE // get_of_list //.
  smt(@List).
qed.

equiv eq_iVPBROADCAST_2u128_8u32: Ops.iVPBROADCAST_2u128_8u32 ~ OpsV.iVPBROADCAST_2u128_8u32: is4u32 v{1} v{2} ==> is8u32 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is4u32 /is8u32 => &1 &2 />; cbv delta.
  apply W8u32.allP => />.
  do (rewrite nth_mkseq 1:/# //=).
qed.

equiv eq_iVPBROADCAST_2u128_32u8: Ops.iVPBROADCAST_2u128_32u8 ~ OpsV.iVPBROADCAST_2u128_32u8: is16u8 v{1} v{2} ==> is32u8 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is16u8 /is32u8 => &1 &2 />; cbv delta.
  apply W32u8.allP => />.
  do (rewrite nth_mkseq 1:/# //=).
qed.

equiv eq_iVPBROADCAST_4u64 : Ops.iVPBROADCAST_4u64 ~ OpsV.iVPBROADCAST_4u64 : ={v} ==> is4u64 res{1} res{2}.
proof.
  proc => /=. wp. skip.
  move => &1 &2 v_eq.
  rewrite /is4u64 /VPBROADCAST_4u64 v_eq.
  rewrite get_setE //=.
  rewrite -createL.
  apply W4u64.wordP => i i_bnds.
  do rewrite -get_unpack64 //=.
  rewrite createiE // get_of_list //.
  smt(@List).
qed.

equiv eq_iVPBROADCAST_8u32 : Ops.iVPBROADCAST_8u32 ~ OpsV.iVPBROADCAST_8u32 : ={v} ==> is8u32 res{1} res{2}.
proof.
  proc => /=. wp. skip.
  move => &1 &2 v_eq.
  rewrite /is8u32 /VPBROADCAST_8u32 v_eq.
  rewrite get_setE //=.
  rewrite -createL.
  apply W8u32.wordP => i i_bnds.
  do rewrite -get_unpack32 //=.
  rewrite createiE // get_of_list //.
  smt(@List).
qed.

equiv eq_iVPBROADCAST_16u16 : Ops.iVPBROADCAST_16u16 ~ OpsV.iVPBROADCAST_16u16 : ={v} ==> is16u16 res{1} res{2}.
proof.
  proc => /=. wp. skip.
  move => &1 &2 v_eq.
  rewrite /is16u16 /VPBROADCAST_16u16 v_eq.
  rewrite get_setE //=.
  rewrite -createL.
  apply W16u16.wordP => i i_bnds.
  do rewrite -get_unpack16 //=.
  rewrite createiE // get_of_list //.
  smt(@List).
qed.

equiv eq_iload4u64: Ops.iload4u64 ~ OpsV.iload4u64 : ={mem, p} /\ to_uint p{1} + 32 <= W64.modulus ==> is4u64 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is4u64 => /> &2 hp.
  rewrite /loadW256 -(W32u8.unpack8K (W4u64.pack4 _));congr.
  apply W32u8.Pack.packP => j hj.
  rewrite initiE 1:// W32u8.get_unpack8 1:// /= get8_pack4u64 hj /=.
  (* FIXME
  have /= <- := W4u64.Pack.init_of_list (fun j => loadW64 mem{2} (to_uint (p{2} + W64.of_int (8 * j)))).
  have ? : 0 <= j %/ 8 < 4 by rewrite ltz_divLR // lez_divRL.
  have ? := modz_cmp j 8.
  rewrite initiE 1:// /loadW64 /= pack8bE 1:// initiE 1:// /=.
  have heq : to_uint (W64.of_int (8 * (j %/ 8))) = 8 * (j %/ 8).
  + by rewrite of_uintK modz_small 2:// /= /#.
  rewrite to_uintD_small heq 1:/#; smt (edivzP).
  *)
  admit.
qed.

equiv eq_istore32u8: Ops.istore32u8 ~ OpsV.istore32u8 : ={mem, p} /\ is32u8 w{1} w{2} ==> ={res}.
proof.
  proc.
  wp. skip.
  simplify.
  move => &1 &2 [#] mem_eq p_eq w_eq.
  rewrite /storeW256 /storeW8 /stores => />.
  rewrite mem_eq p_eq w_eq.
  do (rewrite -get_unpack8 1://=).
  rewrite pack32K.
  smt(@List @Int @W32u8).
qed.

equiv eq_iVPACKUS_8u32 : Ops.iVPACKUS_8u32 ~ OpsV.iVPACKUS_8u32 : is8u32 x{1} x{2} /\ is8u32 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. proc; wp; skip; rewrite /is8u32 /VPACKUS_8u32 /packus_4u32 //=. qed.

equiv eq_iVPACKUS_16u16 : Ops.iVPACKUS_16u16 ~ OpsV.iVPACKUS_16u16 : is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is32u8 res{1} res{2}.
proof.
proc; wp; skip; rewrite /is16u16 /VPACKUS_16u16 /packus_8u16 //=.
qed.

equiv eq_iVPACKSS_16u16 : Ops.iVPACKSS_16u16 ~ OpsV.iVPACKSS_16u16 : is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is32u8 res{1} res{2}.
proof.
proc; wp; skip; rewrite /is16u16 /VPACKSS_16u16 /packss_8u16 /packss16 //=.
qed.

equiv eq_iVPERM2I128 : Ops.iVPERM2I128 ~ OpsV.iVPERM2I128 :
  is4u64 x{1} x{2} /\ is4u64 y{1} y{2} /\ ={p} ==> is4u64 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is4u64 => /> &1 &2; cbv delta.
  rewrite -(W8.to_uintK' p{2}) !of_intwE /=.
  apply W2u128.allP => /=.
  case: (W8.int_bit (to_uint p{2}) 3) => ?.
  + split; 1: by apply W2u64.allP; cbv delta.
    case: (W8.int_bit (to_uint p{2}) 7) => ?; 1: by apply W2u64.allP; cbv delta.
    by case: (W8.int_bit (to_uint p{2}) 5) => ?; case: (W8.int_bit (to_uint p{2}) 4).
  split.
  + by case: (W8.int_bit (to_uint p{2}) 1) => ?; case: (W8.int_bit (to_uint p{2}) 0).
  case: (W8.int_bit (to_uint p{2}) 7) => ?;  1: by apply W2u64.allP; cbv delta.
  by case: (W8.int_bit (to_uint p{2}) 5) => ?; case: (W8.int_bit (to_uint p{2}) 4).
qed.

equiv eq_iVPERM2I128o: Ops.iVPERM2I128o ~ OpsV.iVPERM2I128o :
  is2u128 x{1} x{2} /\ is2u128 y{1} y{2} /\ ={p} ==> is2u128 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is2u128 => /> &1 &2.
  rewrite /VPERM2I128 /=.
  apply W2u128.allP => />.
  case (p{2}.[3]) => ?.
  + split; 1: by trivial.
    case(p{2}.[7]) => ?; trivial.
    by case(p{2}.[5]) => ?; case(p{2}.[4]).
  split.
  + by case(p{2}.[1]) => ?; case(p{2}.[0]).
  case(p{2}.[7]) => ?; trivial.
  by case (p{2}.[5]) => ?; case (p{2}.[4]).
qed.


equiv eq_iVPERM2I128_16u16: Ops.iVPERM2I128_16u16 ~ OpsV.iVPERM2I128_16u16 :
  is16u16 x{1} x{2} /\ is16u16 y{1} y{2} /\ ={p} ==> is16u16 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is16u16 => /> &1 &2; cbv delta.
  rewrite -(W8.to_uintK' p{2}) !of_intwE /=.
  apply W2u128.allP => /=.
  case: (W8.int_bit (to_uint p{2}) 3) => p_3.
  + split; first by apply W8u16.allP; cbv delta.
    case: (W8.int_bit (to_uint p{2}) 7) => p_7; first by apply W8u16.allP; cbv delta.
    by case: (W8.int_bit (to_uint p{2}) 5) => p_5; case: (W8.int_bit (to_uint p{2}) 4).
  split.
  + by case: (W8.int_bit (to_uint p{2}) 1) => p_1; case: (W8.int_bit (to_uint p{2}) 0).
  case: (W8.int_bit (to_uint p{2}) 7) => p_7;  1: by apply W8u16.allP; cbv delta.
  by case: (W8.int_bit (to_uint p{2}) 5) => p_5; case: (W8.int_bit (to_uint p{2}) 4).
qed.


lemma pack4_bits64 (x:t4u64) (i:int): 0 <= i < 4 =>
    pack4 [x.[0]; x.[1]; x.[2]; x.[3]] \bits64 i = x.[i].
proof.
  move => i_i.
  rewrite -get_unpack64 1:i_i pack4K //=.
  rewrite get_of_list 1:i_i //=.
  smt(@Array4 @List).
qed.

equiv eq_iVPERMQ : Ops.iVPERMQ ~ OpsV.iVPERMQ : is4u64 x{1} x{2} /\ ={p} ==> is4u64 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is4u64 => /> &1 &2.
  by rewrite /VPERMQ /= !pack4_bits64 ?modz_cmp.
qed.

lemma pack32_bits64 (x: t32u8) (i:int): 0 <= i < 4 =>
   pack32
     [x.[0]; x.[1]; x.[2]; x.[3]; x.[4]; x.[5]; x.[6];
        x.[7]; x.[8]; x.[9]; x.[10]; x.[11]; x.[12];
        x.[13]; x.[14]; x.[15]; x.[16]; x.[17]; x.[18];
        x.[19]; x.[20]; x.[21]; x.[22]; x.[23]; x.[24];
        x.[25]; x.[26]; x.[27]; x.[28]; x.[29]; x.[30];
        x.[31]] \bits64 i
    = pack8 [x.[8 * i]; x.[8 * i + 1]; x.[8 * i + 2]; x.[8 * i + 3];
            x.[8 * i + 4]; x.[8 * i + 5]; x.[8 * i + 6]; x.[8 * i + 7]].
proof.
admit. (* FIXME: by have /= <- [#|] -> := mema_iota 0 8.*) qed.

equiv eq_iVPERMQ_32u8 : Ops.iVPERMQ_32u8 ~ OpsV.iVPERMQ_32u8 : is32u8 x{1} x{2} /\ ={p} ==> is32u8 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is32u8 => /> &1 &2.
  rewrite /VPERMQ /= !pack32_bits64.
  rewrite modz_cmp 1://=.
  rewrite modz_cmp 1://=.
  rewrite modz_cmp 1://=.
  rewrite modz_cmp 1://=.
  apply W256.ext_eq.
  move => k k_i.
  rewrite (_: pack4
        [pack8
         [x{1}.[8 * (to_uint p{2} %% 4)]; x{1}.[8 * (to_uint p{2} %% 4) + 1];
            x{1}.[8 * (to_uint p{2} %% 4) + 2];
            x{1}.[8 * (to_uint p{2} %% 4) + 3];
            x{1}.[8 * (to_uint p{2} %% 4) + 4];
            x{1}.[8 * (to_uint p{2} %% 4) + 5];
            x{1}.[8 * (to_uint p{2} %% 4) + 6];
            x{1}.[8 * (to_uint p{2} %% 4) + 7]];
         pack8
           [x{1}.[8 * (to_uint p{2} %/ 4 %% 4)];
              x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 1];
              x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 2];
              x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 3];
              x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 4];
              x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 5];
              x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 6];
              x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 7]];
         pack8
           [x{1}.[8 * (to_uint p{2} %/ 16 %% 4)];
              x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 1];
              x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 2];
              x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 3];
              x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 4];
              x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 5];
              x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 6];
              x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 7]];
         pack8
           [x{1}.[8 * (to_uint p{2} %/ 64 %% 4)];
              x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 1];
              x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 2];
              x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 3];
              x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 4];
              x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 5];
              x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 6];
              x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 7]]] =
      pack32 
         [x{1}.[8 * (to_uint p{2} %% 4)];
          x{1}.[8 * (to_uint p{2} %% 4) + 1];
          x{1}.[8 * (to_uint p{2} %% 4) + 2];
          x{1}.[8 * (to_uint p{2} %% 4) + 3];
          x{1}.[8 * (to_uint p{2} %% 4) + 4];
          x{1}.[8 * (to_uint p{2} %% 4) + 5];
          x{1}.[8 * (to_uint p{2} %% 4) + 6];
          x{1}.[8 * (to_uint p{2} %% 4) + 7];
          x{1}.[8 * (to_uint p{2} %/ 4 %% 4)];
          x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 1];
          x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 2];
          x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 3];
          x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 4];
          x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 5];
          x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 6];
          x{1}.[8 * (to_uint p{2} %/ 4 %% 4) + 7];
          x{1}.[8 * (to_uint p{2} %/ 16 %% 4)];
          x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 1];
          x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 2];
          x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 3];
          x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 4];
          x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 5];
          x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 6];
          x{1}.[8 * (to_uint p{2} %/ 16 %% 4) + 7];
          x{1}.[8 * (to_uint p{2} %/ 64 %% 4)];
          x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 1];
          x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 2];
          x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 3];
          x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 4];
          x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 5];
          x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 6];
          x{1}.[8 * (to_uint p{2} %/ 64 %% 4) + 7]]).
    smt(@List @W8u8 @W4u64 @W32u8).
  rewrite (_: Ring.IntID.(^) 4 0 = 1). smt(@Int @Ring.IntID).
  smt(@IntDiv).
qed.

lemma pack8_bits32 (x:t8u32) (i:int): 0 <= i < 8 =>
    pack8 [x.[0]; x.[1]; x.[2]; x.[3]; x.[4]; x.[5]; x.[6]; x.[7]] \bits32 i = x.[i].
proof.
  move => i_i.
  rewrite -get_unpack32 1:i_i pack8K //=.
  rewrite get_of_list 1:i_i //=.
  smt(@Array8 @List).
qed.

equiv eq_iVPERMD : Ops.iVPERMD ~ OpsV.iVPERMD : is8u32 x{1} x{2} /\ is8u32 p{1} p{2} ==> is8u32 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is8u32 => /> &1.
  rewrite /VPERMD /permd /= !pack8_bits32 ?modz_cmp //.
qed.

lemma lsr_2u64 (w1 w2:W64.t) (x:int) : 0 <= x <= 64 =>
  pack2 [w1; w2] `>>>` x = pack2 [(w1 `>>>` x) `|` (w2 `<<<` 64 - x); w2 `>>>` x].
proof.
  move=> hx;apply W128.wordP => i hi.
  rewrite pack2wE 1://.
  rewrite W128.shrwE hi /=.
  case: (i < 64) => hi1.
  + have [-> ->] /=: i %/ 64 = 0 /\ i %% 64 = i by smt(edivzP).
    rewrite pack2wE 1:/#.
    have -> : 0 <= i < 64 by smt().
    case: (i + x < 64) => hix.
    + have [-> ->] /= : (i + x) %/ 64 = 0 /\ (i + x) %% 64 = i + x by smt(edivzP).
      by rewrite (W64.get_out w2) 1:/#.
    have [-> ->] /= : (i + x) %/ 64 = 1 /\ (i + x) %% 64 = i - (64 - x) by smt(edivzP).
    by rewrite (W64.get_out w1) 1:/#.
  have [-> ->] /= : i %/ 64 = 1 /\ i %% 64 = i - 64 by smt(edivzP).
  case (i + x < 128) => hix;last by rewrite W128.get_out 1:/# W64.get_out 1:/#.
  rewrite pack2wE 1:/#.
  have -> /= : 0 <= i - 64 < 64 by smt().
  by have [-> ->] : (i + x) %/ 64 = 1 /\ (i + x) %% 64 = i - 64 + x by smt(edivzP).
qed.

lemma lsr_2u64_64 (w1 w2:W64.t) (x:int) : 64 <= x <= 128 =>
  pack2 [w1; w2] `>>>` x = pack2 [(w2 `>>>` (x - 64)); W64.zero].
proof.
  move=> hx;apply W128.wordP => i hi.
  rewrite pack2wE 1://.
  rewrite W128.shrwE hi /=.
  case: (i < 64) => hi1.
  + have [-> ->] /=: i %/ 64 = 0 /\ i %% 64 = i by smt(edivzP).
    case: (i + x < 128) => ?.
    + rewrite pack2wE 1:/#.
      by have -> /= /# : (i + x) %/ 64 = 1 by smt().
    by rewrite W128.get_out 1:/# W64.get_out 1:/#.
  have [-> ->] /= : i %/ 64 = 1 /\ i %% 64 = i - 64 by smt(edivzP).
  by rewrite W128.get_out 1:/#.
qed.

lemma lsr_0 (w:W64.t) : w `<<<` 0 = w.
proof. by apply W64.wordP => i hi; rewrite W64.shlwE hi. qed.

equiv eq_iVPSRLDQ_256: Ops.iVPSRLDQ_256 ~ OpsV.iVPSRLDQ_256 :
  is4u64 x{1} x{2} /\ ={p} ==> is4u64 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is4u64 => /> &1 &2; cbv delta.
  case: (to_uint p{2} = 8) => [-> | ?] /=.
  + by rewrite !lsr_2u64 //= !lsr_0.
  pose i := if to_uint p{2} < 16 then to_uint p{2} else 16.
  case: (i < 8) => ?.
  + rewrite !lsr_2u64 //=; smt (W8.to_uint_cmp).
  by rewrite !lsr_2u64_64 1,2:/# /= /#.
qed.

equiv eq_iVPUNPCKH_4u64: Ops.iVPUNPCKH_4u64 ~ OpsV.iVPUNPCKH_4u64 : is4u64 x{1} x{2} /\ is4u64 y{1} y{2} ==> is4u64 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is4u64 => />; cbv delta. qed.

equiv eq_iVPUNPCKL_4u64: Ops.iVPUNPCKL_4u64 ~ OpsV.iVPUNPCKL_4u64 : is4u64 x{1} x{2} /\ is4u64 y{1} y{2} ==> is4u64 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is4u64 => />; cbv delta. qed.

equiv eq_iVPUNPCKH_4u64_16u16: Ops.iVPUNPCKH_4u64_16u16 ~ OpsV.iVPUNPCKH_4u64_16u16 : is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is16u16 => &1 &2 />; cbv delta; apply W16u16.allP. qed.

equiv eq_iVPUNPCKL_4u64_16u16: Ops.iVPUNPCKL_4u64_16u16 ~ OpsV.iVPUNPCKL_4u64_16u16 : is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is16u16 => &1 &2 />; cbv delta; apply W16u16.allP. qed.

equiv eq_iVPUNPCKH_16u16: Ops.iVPUNPCKH_16u16 ~ OpsV.iVPUNPCKH_16u16 : is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. proc; wp; skip; rewrite /is16u16 => />; cbv delta. admit. (* FIXME *) qed.

equiv eq_iVPUNPCKL_16u16: Ops.iVPUNPCKL_16u16 ~ OpsV.iVPUNPCKL_16u16 : is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. proc; wp; skip; rewrite /is16u16 => />; cbv delta. admit. (* FIXME *) qed.

equiv eq_iVEXTRACTI128: Ops.iVEXTRACTI128 ~ OpsV.iVEXTRACTI128 :
  is4u64 x{1} x{2} /\ ={p} ==> is2u64 res{1} res{2}.
proof.
  proc; wp; skip;rewrite /is4u64 /is2u64 /VEXTRACTI128 => /> &1 &2.
  by case: (p{2}.[0]) => ?; cbv delta.
qed.

equiv eq_iVPEXTR_64: Ops.iVPEXTR_64 ~ OpsV.iVPEXTR_64 : is2u64 x{1} x{2} /\ ={p} /\ (p{1} = W8.of_int 0 \/ p{2} = W8.of_int 1)==> res{1} = res{2}.
proof. by proc; skip; rewrite /is2u64 /VPEXTR_64 => /> &1 &2 [] -> /=. qed.

equiv eq_iVPSLL_16u16: Ops.iVPSLL_16u16 ~ OpsV.iVPSLL_16u16: is16u16 x{1} x{2} /\ ={y} ==> is16u16 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is16u16 /VPSLL_16u16. qed.

equiv eq_iVPSRL_8u32: Ops.iVPSRL_8u32 ~ OpsV.iVPSRL_8u32: is8u32 x{1} x{2} /\ ={y} ==> is8u32 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is8u32 /VPSRL_8u32. qed.

equiv eq_iVPSRA_16u16: Ops.iVPSRA_16u16 ~ OpsV.iVPSRA_16u16: is16u16 x{1} x{2} /\ ={y} ==> is16u16 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is16u16 /VPSRA_16u16. qed.

equiv eq_ivshr64u256: Ops.ivshr64u256 ~ OpsV.ivshr64u256 : is4u64 x{1} x{2} /\ ={y} ==> is4u64 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is4u64 /VPSRL_4u64. qed.

equiv eq_ivshl64u256: Ops.ivshl64u256 ~ OpsV.ivshl64u256 : is4u64 x{1} x{2} /\ ={y} ==> is4u64 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is4u64 /VPSLL_4u64. qed.

equiv eq_ivpand16u16: Ops.ivpand16u16 ~ OpsV.ivpand16u16 : is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is16u16. qed.

equiv eq_iland4u64: Ops.iland4u64 ~ OpsV.iland4u64 : is4u64 x{1} x{2} /\ is4u64 y{1} y{2} ==> is4u64 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is4u64. qed.

equiv eq_ilor4u64: Ops.ilor4u64 ~ OpsV.ilor4u64 : is4u64 x{1} x{2} /\ is4u64 y{1} y{2} ==> is4u64 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is4u64. qed.

equiv eq_ilandn4u64 : Ops.ilandn4u64 ~ OpsV.ilandn4u64 : is4u64 x{1} x{2} /\ is4u64 y{1} y{2} ==> is4u64 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is4u64 => />; cbv delta. qed.

equiv eq_ilxor4u64: Ops.ilxor4u64 ~ OpsV.ilxor4u64 : is4u64 x{1} x{2} /\ is4u64 y{1} y{2} ==> is4u64 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is4u64. qed.

equiv eq_ilxor16u16: Ops.ilxor16u16 ~ OpsV.ilxor16u16 : is16u16 x{1} x{2} /\ is16u16 y{1} y{2} ==> is16u16 res{1} res{2}.
proof. by proc; wp; skip; rewrite /is16u16. qed.

equiv eq_iVPSRLV_4u64 : Ops.iVPSRLV_4u64 ~ OpsV.iVPSRLV_4u64 : is4u64 x{1} x{2} /\ is4u64 y{1} y{2} ==> is4u64 res{1} res{2}.
proof. by proc;wp; skip; rewrite /is4u64 => />; cbv delta. qed.

equiv eq_iVPSLLV_4u64 : Ops.iVPSLLV_4u64 ~ OpsV.iVPSLLV_4u64 : is4u64 x{1} x{2} /\ is4u64 y{1} y{2} ==> is4u64 res{1} res{2}.
proof. by proc;wp; skip; rewrite /is4u64 => />; cbv delta. qed.

equiv eq_iVPSLLV_8u32 : Ops.iVPSLLV_8u32 ~ OpsV.iVPSLLV_8u32 : is8u32 x{1} x{2} /\ is8u32 y{1} y{2} ==> is8u32 res{1} res{2}.
proof. by proc;wp; skip; rewrite /is8u32 => />; cbv delta. qed.

equiv eq_iVPBLENDD_256 : Ops.iVPBLENDD_256 ~ OpsV.iVPBLENDD_256 :
  is4u64 x{1} x{2} /\ is4u64 y{1} y{2} /\ ={p}
  ==>
  is4u64 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is4u64 /VPBLENDD_256 => /> &1 &2 /=.
  apply W8u32.allP => /=.
  split; 1: by case: (p{2}.[0] = p{2}.[1]); case: (p{2}.[0]).
  split; 1: by case: (p{2}.[0] = p{2}.[1]) => [->|]; case: (p{2}.[1]).
  split; 1: by case: (p{2}.[2] = p{2}.[3]); case: (p{2}.[2]).
  split; 1: by case: (p{2}.[2] = p{2}.[3]) => [->|];case: (p{2}.[3]).
  split; 1: by case: ( p{2}.[4] = p{2}.[5]); case: (p{2}.[4]).
  split; 1: by case: ( p{2}.[4] = p{2}.[5]) => [->|]; case: (p{2}.[5]).
  split; 1: by case: (p{2}.[6] = p{2}.[7]); case: (p{2}.[6]).
  by case: (p{2}.[6] = p{2}.[7]) => [->|]; case: (p{2}.[7]).
qed.

equiv eq_iVPBLENDW_256 : Ops.iVPBLENDW_256 ~ OpsV.iVPBLENDW_256 :
  is16u16 x{1} x{2} /\ is16u16 y{1} y{2} /\ ={p}
  ==>
  is16u16 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is16u16 /VPBLENDW_256 => /> &1 &2 /=.
  apply W16u16.allP => /=.
  split; 1: by case (p{2}.[0]).
  split; 1: by case (p{2}.[1]).
  split; 1: by case (p{2}.[2]).
  split; 1: by case (p{2}.[3]).
  split; 1: by case (p{2}.[4]).
  split; 1: by case (p{2}.[5]).
  split; 1: by case (p{2}.[6]).
  split; 1: by case (p{2}.[7]).
  split; 1: by case (p{2}.[0]).
  split; 1: by case (p{2}.[1]).
  split; 1: by case (p{2}.[2]).
  split; 1: by case (p{2}.[3]).
  split; 1: by case (p{2}.[4]).
  split; 1: by case (p{2}.[5]).
  split; 1: by case (p{2}.[6]).
  by case (p{2}.[7]).
qed.

(*
equiv eq_iVPSHUFD_256 : Ops.iVPSHUFD_256 ~ OpsV.iVPSHUFD_256 :
  is4u64 x{1} x{2} /\ ={p} ==> is4u64 res{1} res{2}.
proof.
  proc; wp; skip; rewrite /is4u64 => /> &1 &2; apply W8u32.allP; cbv delta.
  have heq0 : forall (w: t4u64) i, 0 <= i < 2 => (W2u64.Pack.of_list [w.[0]; w.[1]]).[i] = w.[i].
  + admit. (* FIXME: by move=> w i /(mema_iota 0 2) /= [#|] -> /=.*)
  have heq1 : forall (w: t4u64) i, 0 <= i < 2 => (W2u64.Pack.of_list [w.[2]; w.[3]]).[i] = w.[i+2].
  + admit. (* FIXME: by move=> w i /(mema_iota 0 2) /= [#|] -> /=.*)
  have hmod : forall x, 0 <= x %%4 %/2 < 2 by smt().
  do !(rewrite bits32_W2u64_red 1:modz_cmp 1:// heq0 1:hmod /=).
  do !(rewrite bits32_W2u64_red 1:modz_cmp 1:// heq1 1:hmod /=).
  split.
  + admit.
  (* FIXME
  by case: (to_uint p{2} %% 4 %/ 2 = to_uint p{2} %/ 4 %% 4 %/ 2 /\
         to_uint p{2} %% 4 %% 2 = 0 /\ to_uint p{2} %/ 4 %% 4 %% 2 = 1) => [ [# -> ->] |]. *)
  split.
  + admit.
  (* FIXME
  by case: (to_uint p{2} %% 4 %/ 2 = to_uint p{2} %/ 4 %% 4 %/ 2 /\
         to_uint p{2} %% 4 %% 2 = 0 /\ to_uint p{2} %/ 4 %% 4 %% 2 = 1) => [ [# -> _ ->] |].*)
  split.
  + admit.
  (* FIXME
  by case: (to_uint p{2} %/ 16 %% 4 %/ 2 = to_uint p{2} %/ 64 %% 4 %/ 2 /\
         to_uint p{2} %/ 16 %% 4 %% 2 = 0 /\ to_uint p{2} %/ 64 %% 4 %% 2 = 1) => [[# -> ->] |]. *)
  split.
  + admit.
  (* FIXME
  by case: (to_uint p{2} %/ 16 %% 4 %/ 2 = to_uint p{2} %/ 64 %% 4 %/ 2 /\
         to_uint p{2} %/ 16 %% 4 %% 2 = 0 /\ to_uint p{2} %/ 64 %% 4 %% 2 = 1) => [[# -> _ ->] |]. *)
  split.
  + admit.
  (* FIXME
  by case: (to_uint p{2} %% 4 %/ 2 = to_uint p{2} %/ 4 %% 4 %/ 2 /\
         to_uint p{2} %% 4 %% 2 = 0 /\ to_uint p{2} %/ 4 %% 4 %% 2 = 1) => [[# -> ->]|]. *)
  split.
  + admit.
  (* FIXME
  by case: (to_uint p{2} %% 4 %/ 2 = to_uint p{2} %/ 4 %% 4 %/ 2 /\
         to_uint p{2} %% 4 %% 2 = 0 /\ to_uint p{2} %/ 4 %% 4 %% 2 = 1) => [[# -> _ ->]|]. *)
  split.
  + admit.
  (* FIXME
  by case: (to_uint p{2} %/ 16 %% 4 %/ 2 = to_uint p{2} %/ 64 %% 4 %/ 2 /\
         to_uint p{2} %/ 16 %% 4 %% 2 = 0 /\ to_uint p{2} %/ 64 %% 4 %% 2 = 1) => [[# -> ->]|]. *)
  admit.
  (* FIXME
  by case: (to_uint p{2} %/ 16 %% 4 %/ 2 = to_uint p{2} %/ 64 %% 4 %/ 2 /\
       to_uint p{2} %/ 16 %% 4 %% 2 = 0 /\ to_uint p{2} %/ 64 %% 4 %% 2 = 1) => [[# -> _ ->]|].*)
qed.
*)

equiv eq_iVPSHUFD_256 : Ops.iVPSHUFD_256 ~ OpsV.iVPSHUFD_256 :
  is8u32 x{1} x{2} /\ ={p} ==> is8u32 res{1} res{2}.
proof.
  proc; wp; skip.
  rewrite /is8u32 /VPSHUFD_256 /VPSHUFD_128 /VPSHUFD_128_B /=.
  move => &1 &2 [#] eq_x eq_p.
  rewrite eq_p eq_x //=.
  do (rewrite -get_unpack32 1:/# pack4K //=).
  do (rewrite get_of_list 1:/#).
  smt(@Array4 @Array8 @List).
qed.

equiv eq_iVPSHUFB_256 : Ops.iVPSHUFB_256 ~ OpsV.iVPSHUFB_256:
  is32u8 x{1} x{2} /\ is32u8 m{1} m{2} ==> is32u8 res{1} res{2}.
proof.
proc; wp; skip.
rewrite  /is32u8 /VPSHUFB_256 /VPSHUFB_128 /VPSHUFB_128_B /=. auto => />.

move => &1.
do 32?(rewrite -get_unpack8 1:modz_cmp 1:// pack16K).

have x_lh_ls_get: forall k, 0 <= k < 16 => [x{1}.[0]; x{1}.[1]; x{1}.[2]; x{1}.[3]; x{1}.[4]; x{1}.[5]; x{1}.[6];
                                       x{1}.[7]; x{1}.[8]; x{1}.[9]; x{1}.[10]; x{1}.[11]; x{1}.[12];
                                       x{1}.[13]; x{1}.[14]; x{1}.[15]].[k] = x{1}.[k].
  move => k k_bnds. smt(@Array16).

have x_uh_ls_get: forall k, 0 <= k < 16 => [x{1}.[16]; x{1}.[17]; x{1}.[18]; x{1}.[19]; x{1}.[20]; x{1}.[21];
                                             x{1}.[22]; x{1}.[23]; x{1}.[24]; x{1}.[25]; x{1}.[26];
                                             x{1}.[27]; x{1}.[28]; x{1}.[29]; x{1}.[30]; x{1}.[31]].[k] = x{1}.[16 + k].
  move => k k_bnds. smt(@Array16 @Array32).

do 32?(rewrite get_of_list 1:modz_cmp 1://).
do 32?(rewrite x_lh_ls_get 1:modz_cmp 1:// || rewrite x_uh_ls_get 1:modz_cmp 1://).
trivial.
qed.

equiv eq_iVPMOVMSKB_u256_u32 : Ops.iVPMOVMSKB_u256_u32 ~ OpsV.iVPMOVMSKB_u256_u32:
  is32u8 x{1} x{2} ==> ={res}.
proof.
proc; wp; skip.
rewrite /is32u8 /VPMOVMSKB_u256_u32 /=.
move => &1 &2 x_eq.
rewrite x_eq.
rewrite -get_unpack8 //=.
apply W32.wordP.
move => i i_bnds.
do rewrite get_bits2w //.
rewrite nth_mkseq => />.
rewrite /msb.
smt(@List).
qed.

equiv eq_iVPMADDUBSW_256: Ops.iVPMADDUBSW_256 ~ OpsV.iVPMADDUBSW_256 :
  is32u8 x{1} x{2} /\ is32u8 y{1} y{2} ==> is16u16 res{1} res{2}.
proof.
proc; wp; skip.
rewrite /is32u8 /VPMADDUBSW_256 /=.
move => &1 &2 [#] x_eq y_eq.
rewrite x_eq y_eq.
rewrite -get_unpack8 //=.
rewrite /is16u16.
do rewrite get_setE //=.
apply W16u16.wordP => /=.
move => i i_i.
rewrite -get_unpack16 //=.
rewrite -get_unpack16 //=.
do rewrite haddE.
do rewrite map_cons.
smt(@List @W16u16).
qed.
