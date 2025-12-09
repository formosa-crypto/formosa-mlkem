(* ----- *) require import AllCore IntDiv List StdBigop.
from Jasmin require import JModel.
require import Bindings.
(* ----- *) require import Genbindings Mlkem_filters_bindings.
(* ----- *) (* - *) import W8 W12 W512 BitEncoding BS2Int BitChunking.

from JazzEC require import Array2048 Array256 Array64 Array56 Array48 Array40 Array32 Array24 Array16.

(* -------------------------------------------------------------------- *)
abbrev filter_permq = W8.of_int (
  (0 %% (2 ^ 2)) + ((2 ^ 2) * ((1 %% (2 ^ 2)) + ((2 ^ 2) * ((1 %% (2 ^ 2)) + ((2 ^ 2) * 2)))))
).

(* -------------------------------------------------------------------- *)
abbrev sample_load_shuffle = Array32.of_list witness [
  (W8.of_int  0); (W8.of_int  1); (W8.of_int  1); (W8.of_int  2); (W8.of_int  3);
  (W8.of_int  4); (W8.of_int  4); (W8.of_int  5); (W8.of_int  6); (W8.of_int  7);
  (W8.of_int  7); (W8.of_int  8); (W8.of_int  9); (W8.of_int 10); (W8.of_int 10);
  (W8.of_int 11); (W8.of_int  4); (W8.of_int  5); (W8.of_int  5); (W8.of_int  6);
  (W8.of_int  7); (W8.of_int  8); (W8.of_int  8); (W8.of_int  9); (W8.of_int 10);
  (W8.of_int 11); (W8.of_int 11); (W8.of_int 12); (W8.of_int 13);
  (W8.of_int 14); (W8.of_int 14); (W8.of_int 15)
].

(* -------------------------------------------------------------------- *)
op load_shuffle = u8_256_32 sample_load_shuffle.

(* -------------------------------------------------------------------- *)
abbrev sample_q = W256.of_int
  5881923629679188442283784376194736327817742869488325897419002016668082834689.

(* -------------------------------------------------------------------- *)
abbrev sample_mask = W256.of_int
  7235349132933696807194982583513801520701008426120364839270295361446620368895.

(* -------------------------------------------------------------------- *)
abbrev sample_ones = W256.of_int
  454086624460063511464984254936031011189294057512315937409637584344757371137.

(* -------------------------------------------------------------------- *)
op sample_shuffle_table = Array2048.of_list witness [
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 8); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 8); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 8); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 8); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 8); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int ( 8); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int ( 8); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (10); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int (10); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int (10); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int (10); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int (10); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int (10); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int (10); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int (10);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int (10); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int (10); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int (10); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int (10); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 8); W8.of_int (10); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 8); W8.of_int (10); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 8); W8.of_int (10); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int ( 8); W8.of_int (10); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 8); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 8); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 8); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 8); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int ( 8); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int ( 8); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (10); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int (10); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int (10); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int (10); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int (10); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int (10); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int (10); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int (10);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int (10); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int (10); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int (10); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int (10); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 8); W8.of_int (10); W8.of_int (12); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 8); W8.of_int (10); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 8); W8.of_int (10); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10); W8.of_int (12);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (12); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int ( 8); W8.of_int (10); W8.of_int (12); W8.of_int (-1);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 8); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 8); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 8); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 8); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 8); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int ( 8); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int ( 8); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (10); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int (10); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int (10); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int (10); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int (10); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int (10); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int (10); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int (10);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int (10); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int (10); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int (10); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int (10); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 8); W8.of_int (10); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 8); W8.of_int (10); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 8); W8.of_int (10); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int ( 8); W8.of_int (10); W8.of_int (14); W8.of_int (-1);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 8); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 8); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 8); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 8); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int ( 8); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int ( 8); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int (10); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int (10); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int (10); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int (10); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int (10); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int (10); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int (10); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int (10);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int (10); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int (10); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int (10); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int (10);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int (10); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int ( 8); W8.of_int (10); W8.of_int (12); W8.of_int (14);
  W8.of_int (-1); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 8); W8.of_int (10); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 8); W8.of_int (10); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10); W8.of_int (12);
  W8.of_int (14); W8.of_int (-1); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8); W8.of_int (10);
  W8.of_int (12); W8.of_int (14); W8.of_int (-1); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6); W8.of_int ( 8);
  W8.of_int (10); W8.of_int (12); W8.of_int (14); W8.of_int (-1);
  W8.of_int ( 0); W8.of_int ( 2); W8.of_int ( 4); W8.of_int ( 6);
  W8.of_int ( 8); W8.of_int (10); W8.of_int (12); W8.of_int (14)
].


(* -------------------------------------------------------------------- *)
module Filters = {
  proc filter24 (buf : W8.t Array32.t, out : W16.t Array16.t) : W16.t Array16.t * W64.t = {
    var f0:W256.t;
    var g0:W256.t;
    var g1:W256.t;
    var good:W64.t;
    var t0_0:W64.t;
    var shuffle_0:W256.t;
    var _of_:bool;
    var _cf_:bool;
    var _sf_:bool;
    var _zf_:bool;
    var t0_1:W64.t;
    var shuffle_0_1:W128.t;
    var shuffle_t:W256.t;
    var  _0:bool;
    var  _1:bool;
    var t128:W128.t;

    f0 <- (VPERMQ (sliceget_8_256_32 buf 0) filter_permq);
    f0 <- (VPSHUFB_256 f0 load_shuffle);
    g0 <- (VPSRL_16u16 f0 (W128.of_int 4));
    f0 <- (VPBLEND_16u16 f0 g0 (W8.of_int 170));
    f0 <- (VPAND_256 f0 sample_mask);
    g0 <- (VPCMPGT_16u16 sample_q f0);
    g1 <- (set0_256);
    g0 <- (VPACKSS_16u16 g0 g1);
    good <- zeroextu64 (MOVEMASK_32u8 g0);

    t0_0 <- good;
    t0_0 <- (t0_0 `&` (W64.of_int 255));
    shuffle_0 <- zextend_64_256 (sliceget_8_64_2048 sample_shuffle_table (64 * W64.to_uint t0_0));
    (_of_, _cf_, _sf_,  _0, _zf_, t0_0) <- (POPCNT_64 t0_0);
    t0_0 <- (t0_0 + W64.of_int 0);

    t0_1 <- good;
    t0_1 <- (t0_1 `>>` (W8.of_int 16));
    t0_1 <- (t0_1 `&` (W64.of_int 255));
    shuffle_0_1 <- zextend_64_128 (sliceget_8_64_2048 sample_shuffle_table (64 * W64.to_uint t0_1));
    (_of_, _cf_, _sf_,  _1, _zf_, t0_1) <- (POPCNT_64 t0_1);
    t0_1 <- (t0_1 + t0_0);

    shuffle_0 <- (VINSERTI128 shuffle_0 shuffle_0_1 (W8.of_int 1));
    shuffle_t <- (VPADD_32u8 shuffle_0 sample_ones);
    shuffle_0 <- (VPUNPCKL_32u8 shuffle_0 shuffle_t);

    f0 <- (VPSHUFB_256 f0 shuffle_0);

    out <- sliceset_16_128_16 out                      0  (extract_256_128 f0   0);
    out <- sliceset_16_128_16 out (16 * W64.to_uint t0_0) (extract_256_128 f0 128);
    
    return (out, t0_1);
  }
  proc filter48 (buf : W8.t Array56.t, out : W16.t Array40.t) : W16.t Array40.t * W64.t = {
    var f0:W256.t;
    var f1:W256.t;
    var g0:W256.t;
    var g1:W256.t;
    var good:W64.t;
    var t0_0:W64.t;
    var shuffle_0:W256.t;
    var _of_:bool;
    var _cf_:bool;
    var _sf_:bool;
    var _zf_:bool;
    var t0_1:W64.t;
    var shuffle_0_1:W128.t;
    var t1_0:W64.t;
    var shuffle_1:W256.t;
    var t1_1:W64.t;
    var shuffle_1_1:W128.t;
    var shuffle_t:W256.t;
    var  _0:bool;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;

    f0 <- (VPERMQ (sliceget_8_256_56 buf 0) filter_permq);
    f1 <- (VPERMQ (sliceget_8_256_56 buf (24 * 8)) filter_permq);
    f0 <- (VPSHUFB_256 f0 load_shuffle);
    f1 <- (VPSHUFB_256 f1 load_shuffle);
    g0 <- (VPSRL_16u16 f0 (W128.of_int 4));
    g1 <- (VPSRL_16u16 f1 (W128.of_int 4));
    f0 <- (VPBLEND_16u16 f0 g0 (W8.of_int 170));
    f1 <- (VPBLEND_16u16 f1 g1 (W8.of_int 170));
    f0 <- (VPAND_256 f0 sample_mask);
    f1 <- (VPAND_256 f1 sample_mask);
    g0 <- (VPCMPGT_16u16 sample_q f0);
    g1 <- (VPCMPGT_16u16 sample_q f1);
    g0 <- (VPACKSS_16u16 g0 g1);
    good <- zeroextu64 (MOVEMASK_32u8 g0);

    t0_0 <- good;
    t0_0 <- (t0_0 `&` (W64.of_int 255));
    shuffle_0 <- zextend_64_256 (sliceget_8_64_2048 sample_shuffle_table (64 * W64.to_uint t0_0));
    (_of_, _cf_, _sf_,  _0, _zf_, t0_0) <- (POPCNT_64 t0_0);
    t0_0 <- (t0_0 + W64.of_int 0);

    t0_1 <- good;
    t0_1 <- (t0_1 `>>` (W8.of_int 16));
    t0_1 <- (t0_1 `&` (W64.of_int 255));
    shuffle_0_1 <- zextend_64_128 (sliceget_8_64_2048 sample_shuffle_table (64 * W64.to_uint t0_1));
    (_of_, _cf_, _sf_,  _3, _zf_, t0_1) <- (POPCNT_64 t0_1);
    t0_1 <- (t0_1 + t0_0);

    t1_0 <- good;
    t1_0 <- (t1_0 `>>` (W8.of_int 8));
    t1_0 <- (t1_0 `&` (W64.of_int 255));
    shuffle_1 <- zextend_64_256 (sliceget_8_64_2048 sample_shuffle_table (64 * W64.to_uint t1_0));
    (_of_, _cf_, _sf_,  _2, _zf_, t1_0) <- (POPCNT_64 t1_0);
    t1_0 <- (t1_0 + t0_1);

    t1_1 <- good;
    t1_1 <- (t1_1 `>>` (W8.of_int 24));
    t1_1 <- (t1_1 `&` (W64.of_int 255));
    shuffle_1_1 <- zextend_64_128 (sliceget_8_64_2048 sample_shuffle_table (64 * W64.to_uint t1_1));
    (_of_, _cf_, _sf_,  _3, _zf_, t1_1) <- (POPCNT_64 t1_1);
    t1_1 <- (t1_1 + t1_0);

    shuffle_0 <- (VINSERTI128 shuffle_0 shuffle_0_1 (W8.of_int 1));
    shuffle_1 <- (VINSERTI128 shuffle_1 shuffle_1_1 (W8.of_int 1));
    shuffle_t <- (VPADD_32u8 shuffle_0 sample_ones);
    shuffle_0 <- (VPUNPCKL_32u8 shuffle_0 shuffle_t);
    shuffle_t <- (VPADD_32u8 shuffle_1 sample_ones);
    shuffle_1 <- (VPUNPCKL_32u8 shuffle_1 shuffle_t);

    f0 <- (VPSHUFB_256 f0 shuffle_0);
    f1 <- (VPSHUFB_256 f1 shuffle_1);

    out <- sliceset_16_128_40 out                      0  (extract_256_128 f0   0);
    out <- sliceset_16_128_40 out (16 * W64.to_uint t0_0) (extract_256_128 f0 128);
    out <- sliceset_16_128_40 out (16 * W64.to_uint t0_1) (extract_256_128 f1   0);
    out <- sliceset_16_128_40 out (16 * W64.to_uint t1_0) (extract_256_128 f1 128);

    return (out, t1_1);
  }
}.

(* -------------------------------------------------------------------- *)
op predT_W12 (_ : W12.t) = true.
op predT_W16 (_ : W16.t) = true.

(* -------------------------------------------------------------------- *)
op ltq (w : W16.t) = w \slt W16.of_int 3329.

(* -------------------------------------------------------------------- *)
op perm (i : int) =
  nth (-1) [
     0;  1;  2;  3;  4;  5;  6;  7;
    16; 17; 18; 19; 20; 21; 22; 23;
     8;  9; 10; 11; 12; 13; 14; 15;
    24; 25; 26; 27; 28; 29; 30; 31
  ] i.

section.
(* -------------------------------------------------------------------- *)
hint simplify W8.get_to_uint.
hint simplify mkseq0, mkseqSr_minus.


(* -------------------------------------------------------------------- *)
lemma chunk1E ['a] (xs : 'a list) : chunk 1 xs = map (fun x => [x]) xs.
proof.
apply: (eq_from_nth []); first by rewrite size_chunk 1:// divz1 size_map.
rewrite size_chunk 1:// divz1 => i rgi.
rewrite nth_mkseq 1:divz1 1:// /= (nth_map witness) 1:// /=.
apply/(eq_from_nth witness); first by rewrite size_take 1:// size_drop /#.
move=> j; rewrite size_take 1:// size_drop ~-1:/#.
move=> rgj; have ->>: j = 0 by smt().
by rewrite nth_take ~-1:/# nth_drop ~-1:/#.
qed.

(* -------------------------------------------------------------------- *)
lemma count_map_idfun ['a] (p : 'a -> bool) (s : 'a list) :
  count p s = count idfun (map p s).
proof. by elim: s => [//|x s ih] /=; congr. qed.

(* -------------------------------------------------------------------- *)
lemma pmap_map_comp ['a 'b 'c] (f : 'a -> 'b) (g : 'b -> 'c option) s :
  pmap g (List.map f s) = pmap (g \o f) s.
proof. by elim: s => [//|x s ih] @/(\o) /=; case: (g _). qed.

(* -------------------------------------------------------------------- *)
lemma map_pmap_comp ['a 'b 'c] (f : 'a -> 'b option) (g : 'b -> 'c) s :
  map g (pmap f s) = pmap (fun x => omap g (f x)) s.
proof. by elim: s => [//|x s ih] @/(\o) /=; case: (f _). qed.


bind op [W16.t & W128.t & Array16.t] sliceset_16_128_16 "asliceset".
realize le_size by auto.
realize bvaslicesetP by admit.

(* -------------------------------------------------------------------- *)
lemma filter24P _buf : hoare[Filters.filter24 : buf = _buf ==>
  let ws =
    pmap
      (fun i =>
        let w = sliceget_8_12_24 (Array24.init(fun i => _buf.[i])) (12 * i) in
        if w \ult (W12.of_int 3329) then Some w else None)
      (iota_ 0 16) in

     (forall i, 0 <= i < size ws => res.`1.[i] = zextend_12_16 ws.[i])
  /\ (W64.to_uint res.`2 = size ws)
].
proof.
proc; conseq (_ : _buf = buf ==> _); first done.

(* ==================================================================== *)
(* First part: extracting all the 12-bit words from the input buffer    *)
seq ^g0<-{2} & -1 : (#pre /\ 
          init_array16_w16 (fun i => extract_256_16 f0 (16 * i)) =
          init_array16_w16 (fun i => zextend_12_16 (sliceget_8_12_24 (init_array24_w8 (fun (i : int) => buf.[i])) (12 * i)))); 1: by circuit.
  
(* ==================================================================== *)
(* Second part: parallel comparison                                     *)
seq ^good<- : (#pre /\ 
  W16.init (fun i =>  good.[perm i]) = W16.init (fun i => extract_256_16 f0 (16 * i) \slt W16.of_int 3329)
).
- by conseq />; circuit.

(* ==================================================================== *)
(* Third part: extracting values                                        *)
alias shf0_0 := (sliceget_8_64_2048 _ _) @ ^shuffle_0<-.
alias shf0_1 := (sliceget_8_64_2048 _ _) @ ^shuffle_0_1<-.

proc change circuit ^t0_0<- +2 { t0_0 <- zextend_8_64 (extract_64_8 good 0); }.
alias good0_0 := (extract_64_8 good 0) @ ^t0_0<-.
case <- ^t0_0<-{2} & -1; kill ^shuffle_0<- & +1 !5; first by auto.
proc rewrite ^t0_0<-{2} popcount_64E.
cfold ^t0_0<-; swap ^shuffle_0<- @^shuffle_0<-{2}.
kill ^t0_0<-{-1}; first by auto.

proc rewrite ^t0_1<-{2} shift64RE.
proc change circuit ^t0_1<- +3 { t0_1 <- zextend_8_64 (extract_64_8 good 16); }.
alias good0_1 := (extract_64_8 good 16) @ ^t0_1<-.
case <- ^t0_1<-{2} & -1; kill ^shuffle_0_1<- & +1 !5; first by auto.
proc rewrite ^t0_1<-{2} popcount_64E.
cfold ^t0_1<-; swap ^shuffle_0_1<- @^shuffle_0<- & +1.

  (* FIXME! ADD TACTIC THAT USES NEW CIRCUIT TACTIC TO SOLVE THIS  *)
proc change  (* [
  (shf0_0_16 shf0_1_16 : W128.t)
  (f0_0 f0_1 : W128.t)
] *) [^shuffle_0<- +5] 
: [
  (shf0_0_16 shf0_1_16 : W128.t)
  (f0_0 f0_1 : W128.t)
] {
  f0_0 <- extract_256_128 f0 0;
  f0_1 <- extract_256_128 f0 128;
  shf0_0_16 <- VPUNPCKL_16u8 shf0_0 (VPINC_8u8 shf0_0);
  f0_0      <- VPSHUFB_128 f0_0 shf0_0_16;

  shf0_1_16 <- VPUNPCKL_16u8 shf0_1 (VPINC_8u8 shf0_1);
  f0_1      <- VPSHUFB_128 f0_1 shf0_1_16;
  f0 <- Mlkem_filters_bindings.concat_2u128 f0_0 f0_1;
}.
circuit.

swap ^f0_0<- @^good0_0<-.
swap [^shf0_0_16<- .. ^shf0_0_16<- & +1] @^good0_0<- & +2.
cfold ^f0_0<- 4; proc rewrite ^shf0_0<- zextend_8_64P.

swap ^f0_1<- @^good0_1<-.
swap [^shf0_1_16<- .. ^shf0_1_16<- & +1] @^good0_1<- & +2.
cfold ^f0_1<- 4; proc rewrite ^shf0_1<- zextend_8_64P.

pose P (o : int) (g : W8.t) (f : W256.t) (f_0 : W128.t) :=
  let w =
    pmap
      (fun i => if g.[i] then Some (extract_256_16 f (o + 16 * i)) else None)
      (iotared 0 8) in
  all (fun i => w.[i] = extract_128_16 f_0 (16 * i)) (iotared 0 (size w)).

sp 1; seq ^f0_0<- : (#pre /\ P 0 good0_0 f0 f0_0). 
extens [good0_0] : by circuit simplify; trivial.

sp 1; seq ^f0_1<- : (#pre /\ P 128 good0_1 f0 f0_1).
move => //>.
conseq (: _ ==> P 128 good0_1 f0 f0_1). move => //>.
extens [good0_1] : by circuit simplify; trivial.

(* ==================================================================== *)
(* Part four: write filtered values in the output buffer                *)
cfold ^f0<-; wp -2.

pose ws (b : int) (m : int) :=
  pmap
    (fun i =>
       let w = sliceget_8_12_24 (Array24.init (fun i => _buf.[i])) (12 * i) in
       if w \ult (W12.of_int 3329) then Some w else None)
    (iota_ b m).

have ws_cat: forall (m n : int), 0 <= m => 0 <= n => ws 0 (m + n) = ws 0 m ++ ws m n.
- move=> m n ge0_m ge0_n @/ws; rewrite !pmap_map -map_cat -filter_cat -map_cat.
  by rewrite iota_add /=.

have sz_ws: forall b m, 0 <= m => size (ws b m) <= m.
- move=> b m g0_m @/ws; rewrite pmap_map size_map.
  rewrite size_filter &(lez_trans _ _ _ (count_size _ _)).
  by rewrite size_map size_iota /#.

have ge0_sz_ws: forall b m, 0 <= size (ws b m) by move=> *; apply: size_ge0.

have size_ws_00: size (ws 0 0) = 0 by rewrite /ws iota0.

pose Q (_out : W16.t Array16.t) (b m : int) :=
  forall i, 0 <= i < size (ws b m) => _out.[size (ws 0 b) + i] = zextend_12_16 (ws b m).[i].

have weak_ltq : forall (w : W12.t),
  zextend_12_16 w \slt (W16.of_int 3329) = w \ult (W12.of_int 3329).
- move=> w; rewrite !(ultE, sltE) !to_sintK_small 1:// to_uintK_small 1://.
  rewrite to_sint_unsigned -1:zextend_12_16P -1://.
  rewrite to_sintE /smod iffalse; last smt(W16.to_uint_cmp).
  rewrite zextend_12_16P lezNgt /=.  
  by have [_ /=] /# := W12.to_uint_cmp w.

have Q_step: forall o i, 0 <= i => Q o 0 i => Q o i 8 => Q o 0 (i + 8).
- move=> o i ge0_i h0 hS j rgj; rewrite size_ws_00 /=.
  rewrite ws_cat ~-1:// nth_cat; case: (j < size (ws 0 i)).
  - by move=> lt; rewrite -h0 ~-1:/# size_ws_00.
  move=> gt; move: rgj; rewrite ws_cat ~-1:// size_cat => rgj.
  by rewrite -hS /#.

have slicesetE: forall o b i w,
  0 <= i < 8 => 0 <= b => b + i < 16 =>
    (sliceset_16_128_16 o (16 * b) w).[b + i] = extract_128_16 w (16 * i).
- move=> o b i w rgi ge0_b ltb ; apply/W16.ext_eq => j rgj.
  rewrite initE iftrue 1:/# /= initE rgj /=.
  by rewrite iftrue ~-1:/# extract_128_16E 1://; smt().

have sliceset_outE: forall o b i w,
  0 <= i < b => b < 16 => (sliceset_16_128_16 o (16 * b) w).[i] = o.[i].
- move=> o b i w rgi ltb; apply/W16.ext_eq => j rgj.
  by rewrite initE iftrue 1:/# /= initE rgj /= iffalse 1:/#.

have extractE: forall f_0 f_1 i k, 0 <= i <= 128 - 16 => 0 <= k < 2 =>
  extract_128_16
    (extract_256_128 (Mlkem_filters_bindings.concat_2u128 f_0 f_1) (128 * k)) i
  = extract_128_16 [f_0; f_1].[k] i.
- move=> f_0 f_1 i k rgi rgk; apply/W16.ext_eq => l rgl.
  rewrite !extract_128_16E ~-1:// extract_256_128E 1:/#.
  rewrite /concat_2u128 /pack2 /pack2_t initE iftrue 1:/# /=.
  rewrite of_listE /= initE /= iftrue 1:/#; smt().

have popcnt_64E: forall w, popcount_64 w = W64.of_int (count idfun (W64.w2bits w)).
- move=> w; rewrite /popcount_64 /POPCNT_64 /= /flags_w.
  by case: (W64.ALU.rflags_of_popcnt _).

pose w' (_g : W64.t) (_f0 : W256.t) i :=
  pmap
    (fun (j : int) =>
      if (extract_64_8 _g (perm (8 * i))).[j] then
        Some (extract_256_16 [_f0].[i %/ 2] (128 * (i %% 2) + 16 * j))
      else None)
    (iota_ 0 8).

seq 0 : ((forall i, 0 <= i < 2 =>
  w' good f0 i = map zextend_12_16 (ws (8 * i) 8)
) /\ #pre); first skip=> |> &hr hext hgood 2? i ge0_i lti.
- have hext': forall j, 0 <= j < 16 =>
    zextend_12_16 (sliceget_8_12_24 (Array24.init (fun i => _buf.[i])) (12 * j))
    = extract_256_16 [f0{hr}].[j %/ 16] (16 * (j - 16 * (j %/ 16))).
  - move=> j rgj;move : hgood; rewrite wordP => hgood.
    move : hext; rewrite tP => hext.
    have := hext ((j - 16 * (j %/ 16))) _; 1: by smt().
    rewrite !Array16.initiE /=;1,2:smt().
    rewrite ifT 1:/# => ->.
    apply/ W16.ext_eq=> l rgl.
    by smt().
  rewrite /w' /ws eq_sym map_pmap_comp (iota_addl (8 * i) 0).
  rewrite pmap_map_comp /(\o) /= &(eq_in_pmap).
  move=> j /mem_iota /= [ge_j lt_j].
  rewrite (fun_if (omap zextend_12_16)) /= hext' 1:/#; congr.
  - rewrite -get_to_uint extract_64_8E 1:/# /= -weak_ltq hext' 1:/#.
    have ->: perm (8 * i) + j = perm (8 * i + j).
    - by rewrite /perm /=; smt().
    move : hgood; rewrite wordP => hgood.
    have := hgood (8 * i + j) _;1 : by smt().
    rewrite !initiE 1,2:/# /=.
    move => ->; congr; apply/W16.ext_eq => k rgk.
    rewrite extract_256_16E 1:// extract_256_16E 1://.
    by rewrite /concat_2u256 /#.
  congr; apply/W16.ext_eq => k rgk; rewrite !extract_256_16E ~-1://.
  have -> /=: (8 * i + j) %/ 16 = i %/ 2 by smt().
  congr; rewrite modzE #ring.

seq 0 : ((forall i, 0 <= i < 2 =>
    size (ws (8 * i) 8) =
      to_uint (popcount_64 (zextend_8_64 (extract_64_8 good (perm (8 * i)))))
) /\ #pre); first skip=> |> &hr hw'E 4? i ge0_i lt_i.
- rewrite popcnt_64E w2bits_zextend_8_64E count_cat.
  rewrite addzC count_pred0_eq_in /=.
  - by move=> b; rewrite mem_nseq => -[_ <-].
  rewrite of_uintK -(size_map zextend_12_16) -hw'E ~-1:/# /w' /=.
   rewrite pmap_map size_map size_filter count_map_idfun.
   rewrite [_ %% W64.modulus]pmod_small.
   - rewrite count_ge0 /= &(ltz_trans 9) -1://.
     rewrite (ltzS _ 8) -{2}(W8.size_w2bits (extract_64_8 good{hr} (perm (8 * i)))).
     by rewrite count_size.
   congr; rewrite -map_comp /(\o); apply/(eq_from_nth witness).
   - by rewrite size_map size_iota lez_maxr 1:// size_w2bits.
   move=> j; rewrite size_map size_iota lez_maxr 1://.
   move=> rgj; rewrite (nth_map witness) /= 1:size_iota 1:/#.
   rewrite nth_iota 1:// /= rgj /= (fun_if (predC1 None)) /predC1 /=.
   by rewrite (nth_change_dfl false) 1:size_w2bits 1:// /= rgj /=.

seq 1 : (#pre
  /\ (size (ws 0 8) = W64.to_uint (popcount_64 (zextend_8_64 good0_0)))
  /\ Q out 0 8
).
- auto=> &hr |> szpop hw' hext hgood + _ - @/P.
  rewrite iotaredE (_ : pmap _ _ = w' good{hr} f0{hr} 0) 1:// /=.
  have /= h'E := hw' 0 //; move=> /= /List.allP /= h.
  split; first by rewrite (szpop 0).
  move=> i rgi; have sz_w': size (w' good{hr} f0{hr} 0) <= 8.
  - by rewrite h'E size_map &(sz_ws).
  rewrite size_ws_00 /= (slicesetE _ 0 i) ~-1:/#.
  rewrite (extractE _ _ _ 0) ~-1:/#.
  move/(congr1 (fun xs => nth witness xs i)): (h'E) => /=.
  rewrite (nth_map witness) 1:// => <-; rewrite h 2://.
  by rewrite mem_iota h'E size_map /#.

seq 1 : (#{/~{out}}pre
  /\ (size (ws 8 8) = W64.to_uint (popcount_64 (zextend_8_64 good0_1)))
  /\ Q out 0 16
).
- auto=> &hr |> szpop hw' hext hgood _ + h8 - @/P.
  rewrite iotaredE (_ : pmap _ _ = w' good{hr} f0{hr} 1) 1:// /=.
  have /= h'E := hw' 1 //; move=> /= /List.allP /= h Q8.
  split; first by rewrite (szpop 1).
  apply: (Q_step _ 8) => /=; first done.
  - move=> i rgi; rewrite size_ws_00 /= sliceset_outE ~-1:/#.
    by have := Q8 i rgi; rewrite size_ws_00; apply.
  move=> i rgi; have sz_w': size (w' good{hr} f0{hr} 1) <= 8.
  - by rewrite h'E size_map &(sz_ws).
  rewrite -h8 /= (slicesetE _ (size (ws 0 8)) i) ~-1:/#.
  rewrite (extractE _ _ _ 1) ~-1:/#.
  move/(congr1 (fun xs => nth witness xs i)): (h'E) => /=.
  rewrite (nth_map witness) 1:// => <-; rewrite h 2://.
  by rewrite mem_iota h'E size_map /#.

wp; skip => |> &hr szpop hw' 4? sz1 sz2 Q16; split.
- move=> i ge0_i; rewrite -/(ws _ _) => lti.
  by have := Q16 i //; rewrite size_ws_00.
- rewrite -/(ws _ _) ?to_uintD_small; ~-1: smt().
  rewrite -(szpop 0) 1:// -(szpop 1) 1:// /=.
  rewrite (ws_cat 8 8) ~-1:// size_cat.
  by ring.
qed.

(* -------------------------------------------------------------------- *)

(* -------------------------------------------------------------------- *)
lemma filter48P _buf : hoare[Filters.filter48 : buf = _buf ==>
  let ws =
    pmap
      (fun i =>
        let w = sliceget_8_12_48 (Array48.init (fun i => _buf.[i])) (12 * i) in
        if w \ult (W12.of_int 3329) then Some w else None)
      (iota_ 0 32) in

     (forall i, 0 <= i < size ws => res.`1.[i] = zextend_12_16 ws.[i])
  /\ (W64.to_uint res.`2 = size ws)
].
proof.
proc; conseq (_ : _buf = buf ==> _); first done.

(* ==================================================================== *)
(* First part: extracting all the 12-bit words from the input buffer    *)
seq ^g0<-{2} & -1 : (#pre /\ forall i, 0 <= i < 32 =>
  extract_512_16 (concat_2u256 f0 f1) (16 * i)
    = zextend_12_16 (sliceget_8_12_48 (Array48.init (fun i => buf.[i])) (12 * i))
  ).
- bdep 12 16 [_buf[Array48.t:0]] [buf[Array48.t:0]] [f0; f1] zextend_12_16 predT_W12. 
  - by move=> |>; apply/all_predT.
  move=> |> _f0 _f1 eq i ge0_i lt32_i.
  apply/W16.ext_eq => j rg_j; rewrite extract_512_16E ~-1://.
  move/(congr1 (fun xs => nth witness xs i)): eq => /=.
  rewrite flatten1 -map_comp (nth_map witness) /(\o) /=.
  - by rewrite size_chunk 1:// size_flatten_W8_w2bits size_to_list /#.
  rewrite -sliceget_8_12_48_chunkE ~-1:/# => ->.
  rewrite (nth_map witness) /=.
  - rewrite size_chunk 1:// flatten_cons flatten1.
    by rewrite size_cat !size_w2bits /#.
  by rewrite -w2bits_concat_2u256 -(bits2w_chunk_w2bits_16_512E witness) ~-1:/#.

(* ==================================================================== *)
(* Second part: parallel comparison                                     *)
seq ^good<- : (#pre /\ forall i, 0 <= i < 32 =>
  good.[perm i] <=> extract_512_16 (concat_2u256 f0 f1) (16 * i) \slt W16.of_int 3329
).
    - exists* f0, f1; elim* => _f0 _f1.
  bdep 16 1 [_f0; _f1] [f0; f1] [good] ltq predT_W16 perm.
  - by move=> |> *; apply/all_predT.
  move=> |> &hr _g eq i ge0_i lt32_i; apply/iffE/eq_iff.
  move/(congr1 (fun xs => nth false xs i)): eq => /eq_sym /=.
  rewrite flatten1 chunk1E -map_comp size_map size_w2bits.
  rewrite nth_mkseq 1:/# /= (nth_map false) /(\o) /= 1:/#.
  rewrite /bits2bool /= => ->; rewrite -map_comp /(\o) /=.
  rewrite (nth_map witness) /= 1:size_chunk 1://.
  - by rewrite flatten_cons flatten1 size_cat !size_w2bits /#.
  rewrite -w2bits_concat_2u256 /ltq; congr.
  apply/W16.ext_eq => j rgj; rewrite bits2w_chunk_w2bits_16_512E ~-1:/#.
  by rewrite extract_512_16E ~-1:/#.

(* ==================================================================== *)
(* Third part: extracting values                                        *)
alias shf0_0 := (sliceget_8_64_2048 _ _) @ ^shuffle_0<-.
alias shf0_1 := (sliceget_8_64_2048 _ _) @ ^shuffle_0_1<-.
alias shf1_0 := (sliceget_8_64_2048 _ _) @ ^shuffle_1<-.
alias shf1_1 := (sliceget_8_64_2048 _ _) @ ^shuffle_1_1<-.

proc change circuit ^t0_0<- +2 { t0_0 <- zextend_8_64 (extract_64_8 good 0); }.
alias good0_0 := (extract_64_8 good 0) @ ^t0_0<-.
case <- ^t0_0<-{2} & -1; kill ^shuffle_0<- & +1 !5; first by auto.
proc rewrite ^t0_0<-{2} popcount_64E.
cfold ^t0_0<-; swap ^shuffle_0<- @^shuffle_0<-{2}.
kill ^t0_0<-{-1}; first by auto.

proc rewrite ^t0_1<-{2} shift64RE.
proc change circuit ^t0_1<- +3 { t0_1 <- zextend_8_64 (extract_64_8 good 16); }.
alias good0_1 := (extract_64_8 good 16) @ ^t0_1<-.
case <- ^t0_1<-{2} & -1; kill ^shuffle_0_1<- & +1 !5; first by auto.
proc rewrite ^t0_1<-{2} popcount_64E.
cfold ^t0_1<-; swap ^shuffle_0_1<- @^shuffle_0<- & +1.
kill ^t0_1<-{-1}; first by auto.

proc rewrite ^t1_0<-{2} shift64RE.
proc change circuit ^t1_0<- +3 { t1_0 <- zextend_8_64 (extract_64_8 good 8); }.
alias good1_0 := (extract_64_8 good 8) @ ^t1_0<-.
case <- ^t1_0<-{2} & -1; kill ^shuffle_1<- & +1 !5; first by auto.
proc rewrite ^t1_0<-{2} popcount_64E.
cfold ^t1_0<-; swap ^shuffle_1<- @^shuffle_1<-{2}.
kill ^t1_0<-{-1}; first by auto.

proc rewrite ^t1_1<-{2} shift64RE.
proc change circuit ^t1_1<- +3 { t1_1 <- zextend_8_64 (extract_64_8 good 24); }.
alias good1_1 := (extract_64_8 good 24) @ ^t1_1<-.
case <- ^t1_1<-{2} & -1; kill ^shf1_1<- & +2 !5; first by auto.
proc rewrite ^t1_1<-{2} popcount_64E.
cfold ^t1_1<-; swap ^shuffle_1_1<- @^shuffle_1<-{2}.

proc change circuit [
  (shf0_0_16 shf0_1_16 shf1_0_16 shf1_1_16 : W128.t)
  (f0_0 f0_1 f1_0 f1_1 : W128.t)
] ^shuffle_0<- +12
{
  f0_0 <- extract_256_128 f0 0;
  f0_1 <- extract_256_128 f0 128;
  f1_0 <- extract_256_128 f1 0;
  f1_1 <- extract_256_128 f1 128;

  shf0_0_16 <- VPUNPCKL_16u8 shf0_0 (VPINC_8u8 shf0_0);
  f0_0      <- VPSHUFB_128 f0_0 shf0_0_16;

  shf0_1_16 <- VPUNPCKL_16u8 shf0_1 (VPINC_8u8 shf0_1);
  f0_1      <- VPSHUFB_128 f0_1 shf0_1_16;

  shf1_0_16 <- VPUNPCKL_16u8 shf1_0 (VPINC_8u8 shf1_0);
  f1_0      <- VPSHUFB_128 f1_0 shf1_0_16;

  shf1_1_16 <- VPUNPCKL_16u8 shf1_1 (VPINC_8u8 shf1_1);
  f1_1      <- VPSHUFB_128 f1_1 shf1_1_16;

  f0 <- Mlkem_filters_bindings.concat_2u128 f0_0 f0_1;
  f1 <- Mlkem_filters_bindings.concat_2u128 f1_0 f1_1;
}.

swap ^f0_0<- @^good0_0<-.
swap [^shf0_0_16<- .. ^shf0_0_16<- & +1] @^good0_0<- & +2.
cfold ^f0_0<- 4; proc rewrite ^shf0_0<- zextend_8_64P.

swap ^f0_1<- @^good0_1<-.
swap [^shf0_1_16<- .. ^shf0_1_16<- & +1] @^good0_1<- & +2.
cfold ^f0_1<- 4; proc rewrite ^shf0_1<- zextend_8_64P.

swap ^f1_0<- @^good1_0<-.
swap [^shf1_0_16<- .. ^shf1_0_16<- & +1] @^good1_0<- & +2.
cfold ^f1_0<- 4; proc rewrite ^shf1_0<- zextend_8_64P.

swap ^f1_1<- @^good1_1<-.
swap [^shf1_1_16<- .. ^shf1_1_16<- & +1] @^good1_1<- & +2.
cfold ^f1_1<- 4; proc rewrite ^shf1_1<- zextend_8_64P.

pose P (o : int) (g : W8.t) (f : W256.t) (f_0 : W128.t) :=
  let w =
    pmap
      (fun i => if g.[i] then Some (extract_256_16 f (o + 16 * i)) else None)
      (iotared 0 8) in
  all (fun i => w.[i] = extract_128_16 f_0 (16 * i)) (iotared 0 (size w)).

sp 1; seq ^f0_0<- : (#pre /\ P 0 good0_0 f0 f0_0).
- by bdep bitstring [f0] [P 0 good0_0 f0 f0_0] good0_0; move=> |>.

sp 1; seq ^f0_1<- : (#pre /\ P 128 good0_1 f0 f0_1).
- by bdep bitstring [f0] [P 128 good0_1 f0 f0_1] good0_1; move=> |>.

sp 1; seq ^f1_0<- : (#pre /\ P 0 good1_0 f1 f1_0).
- by bdep bitstring [f1] [P 0 good1_0 f1 f1_0] good1_0; move=> |>.

sp 1; seq ^f1_1<- : (#pre /\ P 128 good1_1 f1 f1_1).
- by bdep bitstring [f1] [P 128 good1_1 f1 f1_1] good1_1; move=> |>.

(* ==================================================================== *)
(* Part four: write filtered values in the output buffer                *)
cfold ^f0<-; cfold ^f1<-; wp -2.

pose ws (b : int) (m : int) :=
  pmap
    (fun i =>
       let w = sliceget_8_12_48 (Array48.init (fun i => _buf.[i])) (12 * i) in
       if w \ult (W12.of_int 3329) then Some w else None)
    (iota_ b m).

have ws_cat: forall (m n : int), 0 <= m => 0 <= n => ws 0 (m + n) = ws 0 m ++ ws m n.
- move=> m n ge0_m ge0_n @/ws; rewrite !pmap_map -map_cat -filter_cat -map_cat.
  by rewrite iota_add /=.

have sz_ws: forall b m, 0 <= m => size (ws b m) <= m.
- move=> b m g0_m @/ws; rewrite pmap_map size_map.
  rewrite size_filter &(lez_trans _ _ _ (count_size _ _)).
  by rewrite size_map size_iota /#.

have ge0_sz_ws: forall b m, 0 <= size (ws b m) by move=> *; apply: size_ge0.

have size_ws_00: size (ws 0 0) = 0 by rewrite /ws iota0.

pose Q (_out : W16.t Array40.t) (b m : int) :=
  forall i, 0 <= i < size (ws b m) => _out.[size (ws 0 b) + i] = zextend_12_16 (ws b m).[i].

have weak_ltq : forall (w : W12.t),
  zextend_12_16 w \slt (W16.of_int 3329) = w \ult (W12.of_int 3329).
- move=> w; rewrite !(ultE, sltE) !to_sintK_small 1:// to_uintK_small 1://.
  rewrite to_sint_unsigned -1:zextend_12_16P -1://.
  rewrite to_sintE /smod iffalse; last smt(W16.to_uint_cmp).
  rewrite zextend_12_16P lezNgt /=.  
  by have [_ /=] /# := W12.to_uint_cmp w.

have Q_step: forall o i, 0 <= i => Q o 0 i => Q o i 8 => Q o 0 (i + 8).
- move=> o i ge0_i h0 hS j rgj; rewrite size_ws_00 /=.
  rewrite ws_cat ~-1:// nth_cat; case: (j < size (ws 0 i)).
  - by move=> lt; rewrite -h0 ~-1:/# size_ws_00.
  move=> gt; move: rgj; rewrite ws_cat ~-1:// size_cat => rgj.
  by rewrite -hS /#.

have slicesetE: forall o b i w,
  0 <= i < 8 => 0 <= b => b + i < 40 =>
    (sliceset_16_128_40 o (16 * b) w).[b + i] = extract_128_16 w (16 * i).
- move=> o b i w rgi ge0_b ltb ; apply/W16.ext_eq => j rgj.
  rewrite initE iftrue 1:/# /= initE rgj /=.
  by rewrite iftrue ~-1:/# extract_128_16E 1://; smt().

have sliceset_outE: forall o b i w,
  0 <= i < b => b < 40 => (sliceset_16_128_40 o (16 * b) w).[i] = o.[i].
- move=> o b i w rgi ltb; apply/W16.ext_eq => j rgj.
  by rewrite initE iftrue 1:/# /= initE rgj /= iffalse 1:/#.

have extractE: forall f_0 f_1 i k, 0 <= i <= 128 - 16 => 0 <= k < 2 =>
  extract_128_16
    (extract_256_128 (Mlkem_filters_bindings.concat_2u128 f_0 f_1) (128 * k)) i
  = extract_128_16 [f_0; f_1].[k] i.
- move=> f_0 f_1 i k rgi rgk; apply/W16.ext_eq => l rgl.
  rewrite !extract_128_16E ~-1:// extract_256_128E 1:/#.
  rewrite /concat_2u128 /pack2 /pack2_t initE iftrue 1:/# /=.
  rewrite of_listE /= initE /= iftrue 1:/#; smt().

have popcnt_64E: forall w, popcount_64 w = W64.of_int (count idfun (W64.w2bits w)).
- move=> w; rewrite /popcount_64 /POPCNT_64 /= /flags_w.
  by case: (W64.ALU.rflags_of_popcnt _).

pose w' (_g : W64.t) (_f0 _f1 : W256.t) i :=
  pmap
    (fun (j : int) =>
      if (extract_64_8 _g (perm (8 * i))).[j] then
        Some (extract_256_16 [_f0; _f1].[i %/ 2] (128 * (i %% 2) + 16 * j))
      else None)
    (iota_ 0 8).

seq 0 : ((forall i, 0 <= i < 4 =>
  w' good f0 f1 i = map zextend_12_16 (ws (8 * i) 8)
) /\ #pre); first skip=> |> &hr hext hgood 4? i ge0_i lti.
- have hext': forall j, 0 <= j < 32 =>
    zextend_12_16 (sliceget_8_12_48 (Array48.init (fun i => _buf.[i])) (12 * j))
    = extract_256_16 [f0{hr}; f1{hr}].[j %/ 16] (16 * (j - 16 * (j %/ 16))).
  - move=> j rgj; rewrite -hext 1:/#; apply/ W16.ext_eq=> l rgl.
    rewrite extract_256_16E 1:// extract_512_16E 1:// initE.
    by rewrite iftrue 1:/#; smt().
  rewrite /w' /ws eq_sym map_pmap_comp (iota_addl (8 * i) 0).
  rewrite pmap_map_comp /(\o) /= &(eq_in_pmap).
  move=> j /mem_iota /= [ge_j lt_j].
  rewrite (fun_if (omap zextend_12_16)) /= hext' 1:/#; congr.
  - rewrite -get_to_uint extract_64_8E 1:/# /= -weak_ltq hext' 1:/#.
    have ->: perm (8 * i) + j = perm (8 * i + j).
    - by rewrite /perm /=; smt().
    rewrite hgood 1:/#; congr; apply/W16.ext_eq => k rgk.
    rewrite extract_256_16E 1:// extract_512_16E 1://.
    by rewrite /concat_2u256 initE iftrue 1:/# /=; smt().
  congr; apply/W16.ext_eq => k rgk; rewrite !extract_256_16E ~-1://.
  have -> /=: (8 * i + j) %/ 16 = i %/ 2 by smt().
  congr; rewrite modzE #ring.

seq 0 : ((forall i, 0 <= i < 4 =>
    size (ws (8 * i) 8) =
      to_uint (popcount_64 (zextend_8_64 (extract_64_8 good (perm (8 * i)))))
) /\ #pre); first skip=> |> &hr hw'E 6? i ge0_i lt4_i.
- rewrite popcnt_64E w2bits_zextend_8_64E count_cat.
  rewrite addzC count_pred0_eq_in /=.
  - by move=> b; rewrite mem_nseq => -[_ <-].
  rewrite of_uintK -(size_map zextend_12_16) -hw'E ~-1:/# /w' /=.
   rewrite pmap_map size_map size_filter count_map_idfun.
   rewrite [_ %% W64.modulus]pmod_small.
   - rewrite count_ge0 /= &(ltz_trans 9) -1://.
     rewrite (ltzS _ 8) -{2}(W8.size_w2bits (extract_64_8 good{hr} (perm (8 * i)))).
     by rewrite count_size.
   congr; rewrite -map_comp /(\o); apply/(eq_from_nth witness).
   - by rewrite size_map size_iota lez_maxr 1:// size_w2bits.
   move=> j; rewrite size_map size_iota lez_maxr 1://.
   move=> rgj; rewrite (nth_map witness) /= 1:size_iota 1:/#.
   rewrite nth_iota 1:// /= rgj /= (fun_if (predC1 None)) /predC1 /=.
   by rewrite (nth_change_dfl false) 1:size_w2bits 1:// /= rgj /=.

seq 1 : (#pre
  /\ (size (ws 0 8) = W64.to_uint (popcount_64 (zextend_8_64 good0_0)))
  /\ Q out 0 8
).
- auto=> &hr |> szpop hw' hext hgood + _ _ _ - @/P.
  rewrite iotaredE (_ : pmap _ _ = w' good{hr} f0{hr} f1{hr} 0) 1:// /=.
  have /= h'E := hw' 0 //; move=> /= /List.allP /= h.
  split; first by rewrite (szpop 0).
  move=> i rgi; have sz_w': size (w' good{hr} f0{hr} f1{hr} 0) <= 8.
  - by rewrite h'E size_map &(sz_ws).
  rewrite size_ws_00 /= (slicesetE _ 0 i) ~-1:/#.
  rewrite (extractE _ _ _ 0) ~-1:/#.
  move/(congr1 (fun xs => nth witness xs i)): (h'E) => /=.
  rewrite (nth_map witness) 1:// => <-; rewrite h 2://.
  by rewrite mem_iota h'E size_map /#.

seq 1 : (#{/~{out}}pre
  /\ (size (ws 8 8) = W64.to_uint (popcount_64 (zextend_8_64 good0_1)))
  /\ Q out 0 16
).
- auto=> &hr |> szpop hw' hext hgood _ + _ _ h8 - @/P.
  rewrite iotaredE (_ : pmap _ _ = w' good{hr} f0{hr} f1{hr} 1) 1:// /=.
  have /= h'E := hw' 1 //; move=> /= /List.allP /= h Q8.
  split; first by rewrite (szpop 1).
  apply: (Q_step _ 8) => /=; first done.
  - move=> i rgi; rewrite size_ws_00 /= sliceset_outE ~-1:/#.
    by have := Q8 i rgi; rewrite size_ws_00; apply.
  move=> i rgi; have sz_w': size (w' good{hr} f0{hr} f1{hr} 1) <= 8.
  - by rewrite h'E size_map &(sz_ws).
  rewrite -h8 /= (slicesetE _ (size (ws 0 8)) i) ~-1:/#.
  rewrite (extractE _ _ _ 1) ~-1:/#.
  move/(congr1 (fun xs => nth witness xs i)): (h'E) => /=.
  rewrite (nth_map witness) 1:// => <-; rewrite h 2://.
  by rewrite mem_iota h'E size_map /#.

seq 1 : (#{/~{out}}pre
  /\ (size (ws 16 8) = W64.to_uint (popcount_64 (zextend_8_64 good1_0)))
  /\ Q out 0 24
).
- auto=> &hr |> szpop hw' hext hgood _ _ + _ h8 h8' - @/P.
  rewrite iotaredE (_ : pmap _ _ = w' good{hr} f0{hr} f1{hr} 2) 1:// /=.
  have /= h'E := hw' 2 //; move=> /= /List.allP /= h Q16.
  split; first by rewrite (szpop 2).
  rewrite to_uintD_small; ~-1: smt().
  rewrite -h8 -h8' [size _ + size _]addzC -size_cat -ws_cat ~-1:// /=.
  apply: (Q_step _ 16) => /=; first done.
  - move=> i rgi; rewrite size_ws_00 /= sliceset_outE ~-1:/#.
    by have := Q16 i rgi; rewrite size_ws_00; apply.
  - move=> i rgi; have sz_w': size (w' good{hr} f0{hr} f1{hr} 2) <= 8.
    - by rewrite h'E size_map &(sz_ws).
    rewrite (slicesetE _ (size (ws 0 16)) i) ~-1:/#.
    rewrite (extractE _ _ _ 0) ~-1:/#.
    move/(congr1 (fun xs => nth witness xs i)): (h'E) => /=.
    rewrite (nth_map witness) 1:// => <-; rewrite h 2://.
    by rewrite mem_iota h'E size_map /#.

seq 1 : (#{/~{out}}pre
  /\ (size (ws 24 8) = W64.to_uint (popcount_64 (zextend_8_64 good1_1)))
  /\ Q out 0 32
).
- auto=> &hr |> szpop hw' hext hgood _ _ _ + h8 h8' h8'' - @/P.
  rewrite iotaredE (_ : pmap _ _ = w' good{hr} f0{hr} f1{hr} 3) 1:// /=.
  have /= h'E := hw' 3 //; move=> /= /List.allP /= h Q24.
  split; first by rewrite (szpop 3).
  rewrite 2?to_uintD_small; ~-1: smt().
  rewrite -h8 -h8' -h8''.
  rewrite [size (ws 8 8) + size _]addzC -size_cat -ws_cat ~-1:// /=.
  rewrite [size _ + size _]addzC -size_cat -ws_cat ~-1:// /=.
  apply: (Q_step _ 24) => /=; first done.
  - move=> i rgi; rewrite size_ws_00 /= sliceset_outE ~-1:/#.
    by have := Q24 i rgi; rewrite size_ws_00; apply.
  - move=> i rgi; have sz_w': size (w' good{hr} f0{hr} f1{hr} 3) <= 8.
    - by rewrite h'E size_map &(sz_ws).
    rewrite (slicesetE _ (size (ws 0 24)) i) ~-1:/#.
    rewrite (extractE _ _ _ 1) ~-1:/#.
    move/(congr1 (fun xs => nth witness xs i)): (h'E) => /=.
    rewrite (nth_map witness) 1:// => <-; rewrite h 2://.
    by rewrite mem_iota h'E size_map /#.

wp; skip => |> &hr szpop hw' 6? sz1 sz2 sz3 sz4 Q32; split.
- move=> i ge0_i; rewrite -/(ws _ _) => lti.
  by have := Q32 i //; rewrite size_ws_00.
- rewrite -/(ws _ _) ?to_uintD_small; ~-1: smt().
  rewrite -(szpop 0) 1:// -(szpop 1) 1:// -(szpop 2) 1:// -(szpop 3) 1:// /=.
  rewrite eq_sym; rewrite (ws_cat 24 8) ~-1:// size_cat.
  rewrite (ws_cat 16 8) ~-1:// size_cat.
  rewrite (ws_cat 8 8) ~-1:// size_cat.
  by ring.
qed.


end section.
