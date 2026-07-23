require import AllCore IntDiv CoreMap List Distr.

from Jasmin require import JModel_x86.

import SLH64.

require import
Array1 Array2 Array4 Array5 Array6 Array7 Array8 Array16 Array24 Array25
Array32 Array33 Array64 Array128 Array256 Array384 Array400 Array536 Array768
Array960 Array1024 Array1088 Array1120 Array1152 Array1184 Array2048
Array2144 Array2304 Array2400 WArray1 WArray2 WArray4 WArray8 WArray16
WArray32 WArray33 WArray40 WArray64 WArray128 WArray160 WArray192 WArray200
WArray224 WArray256 WArray384 WArray512 WArray536 WArray800 WArray960
WArray1088 WArray1120 WArray1152 WArray1184 WArray1536 WArray2048 WArray2144
WArray2400 WArray4608.

abbrev gen_matrix_indexes =
((Array32.of_list witness)
[(W8.of_int 0); (W8.of_int 0); (W8.of_int 1); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 0); (W8.of_int 0); (W8.of_int 1); (W8.of_int 1); (W8.of_int 1);
(W8.of_int 2); (W8.of_int 1); (W8.of_int 0); (W8.of_int 2); (W8.of_int 1);
(W8.of_int 2); (W8.of_int 0); (W8.of_int 0); (W8.of_int 0); (W8.of_int 1);
(W8.of_int 0); (W8.of_int 2); (W8.of_int 1); (W8.of_int 0); (W8.of_int 1);
(W8.of_int 1); (W8.of_int 1); (W8.of_int 2); (W8.of_int 2); (W8.of_int 0);
(W8.of_int 2); (W8.of_int 1)]).

abbrev sample_shuffle_table =
((Array2048.of_list witness)
[(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 2); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 2); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 4); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 4); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 2); (W8.of_int 4); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 2); (W8.of_int 4); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 6); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 6); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 2); (W8.of_int 6); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 2); (W8.of_int 6); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 4); (W8.of_int 6); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 4); (W8.of_int 6); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 2); (W8.of_int 4); (W8.of_int 6); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 2); (W8.of_int 4); (W8.of_int 6); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 8);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 8); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2);
(W8.of_int 8); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 2); (W8.of_int 8); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4);
(W8.of_int 8); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 4); (W8.of_int 8); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 8); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 2); (W8.of_int 4); (W8.of_int 8); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 6);
(W8.of_int 8); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 6); (W8.of_int 8); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2);
(W8.of_int 6); (W8.of_int 8); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 2); (W8.of_int 6); (W8.of_int 8); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 2); (W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 10); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 10);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 10);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 10);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 6); (W8.of_int 10);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6);
(W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 6); (W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 10); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 8); (W8.of_int 10);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 8);
(W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 8);
(W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 8); (W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 8);
(W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 8); (W8.of_int 10); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 6); (W8.of_int 8);
(W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 10); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int 10);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 6); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 6); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 8); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 8);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 8);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 8); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 8);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 8); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 6); (W8.of_int 8);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 10); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 10);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 10);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 10); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 10);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 10); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 10); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 10); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 6); (W8.of_int 10);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6);
(W8.of_int 10); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 10); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 6); (W8.of_int 10); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 10); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 10); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 10); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 10); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 8); (W8.of_int 10);
(W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 8); (W8.of_int 10); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 6); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 4); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 6); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 8); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 8); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 2); (W8.of_int 8); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 2); (W8.of_int 8); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 4); (W8.of_int 8); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 4); (W8.of_int 8); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 2); (W8.of_int 4); (W8.of_int 8); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 2); (W8.of_int 4); (W8.of_int 8); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 2); (W8.of_int 6); (W8.of_int 8); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 2); (W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 10); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 10);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 10);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 10); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 10);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 10); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 10); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 10); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 6); (W8.of_int 10);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6);
(W8.of_int 10); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 10); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 6); (W8.of_int 10); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 10); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 10); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 10); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 10); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 8); (W8.of_int 10);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 8); (W8.of_int 10); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 6); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 4); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 6); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 8); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 8); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 2); (W8.of_int 8); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 2); (W8.of_int 8); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 4); (W8.of_int 8); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 8); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 2); (W8.of_int 4); (W8.of_int 8); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 6); (W8.of_int 8);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int 10); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 10); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 10); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 10);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 4); (W8.of_int 10); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4); (W8.of_int 10);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4); (W8.of_int 10);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 10); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 6); (W8.of_int 10); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6); (W8.of_int 10);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6); (W8.of_int 10);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 6);
(W8.of_int 10); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 4); (W8.of_int 6); (W8.of_int 10);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 10); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 10); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 10); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 2); (W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 4); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2);
(W8.of_int 4); (W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int 6); (W8.of_int 8); (W8.of_int 10);
(W8.of_int 12); (W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 6); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 2); (W8.of_int 6); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 6); (W8.of_int 8);
(W8.of_int 10); (W8.of_int 12); (W8.of_int 14); (W8.of_int (-1));
(W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 0);
(W8.of_int 4); (W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int 12);
(W8.of_int 14); (W8.of_int (-1)); (W8.of_int 2); (W8.of_int 4);
(W8.of_int 6); (W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int 14);
(W8.of_int (-1)); (W8.of_int 0); (W8.of_int 2); (W8.of_int 4); (W8.of_int 6);
(W8.of_int 8); (W8.of_int 10); (W8.of_int 12); (W8.of_int 14)]).

abbrev sample_q =
(W256.of_int
5881923629679188442283784376194736327817742869488325897419002016668082834689).

abbrev sample_mask =
(W256.of_int
7235349132933696807194982583513801520701008426120364839270295361446620368895).

abbrev sample_ones =
(W256.of_int
454086624460063511464984254936031011189294057512315937409637584344757371137).

abbrev sample_load_shuffle =
((Array32.of_list witness)
[(W8.of_int 0); (W8.of_int 1); (W8.of_int 1); (W8.of_int 2); (W8.of_int 3);
(W8.of_int 4); (W8.of_int 4); (W8.of_int 5); (W8.of_int 6); (W8.of_int 7);
(W8.of_int 7); (W8.of_int 8); (W8.of_int 9); (W8.of_int 10); (W8.of_int 10);
(W8.of_int 11); (W8.of_int 4); (W8.of_int 5); (W8.of_int 5); (W8.of_int 6);
(W8.of_int 7); (W8.of_int 8); (W8.of_int 8); (W8.of_int 9); (W8.of_int 10);
(W8.of_int 11); (W8.of_int 11); (W8.of_int 12); (W8.of_int 13);
(W8.of_int 14); (W8.of_int 14); (W8.of_int 15)]).

abbrev pvc_shufbidx_s =
((Array32.of_list witness)
[(W8.of_int 0); (W8.of_int 1); (W8.of_int 2); (W8.of_int 3); (W8.of_int 4);
(W8.of_int 8); (W8.of_int 9); (W8.of_int 10); (W8.of_int 11); (W8.of_int 12);
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int 9); (W8.of_int 10);
(W8.of_int 11); (W8.of_int 12); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1)); (W8.of_int (-1));
(W8.of_int 0); (W8.of_int 1); (W8.of_int 2); (W8.of_int 3); (W8.of_int 4);
(W8.of_int 8)]).

abbrev pvc_sllvdidx_s = (W64.of_int 12).

abbrev pvc_shift2_s = (W64.of_int 288230380513787905).

abbrev pvc_mask_s = (W16.of_int 1023).

abbrev pvc_shift1_s = (W16.of_int 4096).

abbrev pvc_off_s = (W16.of_int 15).

abbrev pvd_mask_s = (W32.of_int 2145394680).

abbrev pvd_sllvdidx_s = (W64.of_int 4).

abbrev pvd_shufbdidx_s =
((Array32.of_list witness)
[(W8.of_int 0); (W8.of_int 1); (W8.of_int 1); (W8.of_int 2); (W8.of_int 2);
(W8.of_int 3); (W8.of_int 3); (W8.of_int 4); (W8.of_int 5); (W8.of_int 6);
(W8.of_int 6); (W8.of_int 7); (W8.of_int 7); (W8.of_int 8); (W8.of_int 8);
(W8.of_int 9); (W8.of_int 2); (W8.of_int 3); (W8.of_int 3); (W8.of_int 4);
(W8.of_int 4); (W8.of_int 5); (W8.of_int 5); (W8.of_int 6); (W8.of_int 7);
(W8.of_int 8); (W8.of_int 8); (W8.of_int 9); (W8.of_int 9); (W8.of_int 10);
(W8.of_int 10); (W8.of_int 11)]).

abbrev pvd_q_s = (W32.of_int 218182660).

abbrev pd_shift_s = (W32.of_int 8390656).

abbrev pd_mask_s = (W32.of_int 15728655).

abbrev pd_jshufbidx =
((Array32.of_list witness)
[(W8.of_int 0); (W8.of_int 0); (W8.of_int 0); (W8.of_int 0); (W8.of_int 1);
(W8.of_int 1); (W8.of_int 1); (W8.of_int 1); (W8.of_int 2); (W8.of_int 2);
(W8.of_int 2); (W8.of_int 2); (W8.of_int 3); (W8.of_int 3); (W8.of_int 3);
(W8.of_int 3); (W8.of_int 4); (W8.of_int 4); (W8.of_int 4); (W8.of_int 4);
(W8.of_int 5); (W8.of_int 5); (W8.of_int 5); (W8.of_int 5); (W8.of_int 6);
(W8.of_int 6); (W8.of_int 6); (W8.of_int 6); (W8.of_int 7); (W8.of_int 7);
(W8.of_int 7); (W8.of_int 7)]).

abbrev pc_permidx_s =
((Array8.of_list witness)
[(W32.of_int 0); (W32.of_int 4); (W32.of_int 1); (W32.of_int 5);
(W32.of_int 2); (W32.of_int 6); (W32.of_int 3); (W32.of_int 7)]).

abbrev pc_shift2_s = (W16.of_int 4097).

abbrev pc_mask_s = (W16.of_int 15).

abbrev pc_shift1_s = (W16.of_int 512).

abbrev pfm_idx_s =
((Array16.of_list witness)
[(W8.of_int 0); (W8.of_int 1); (W8.of_int 4); (W8.of_int 5); (W8.of_int 8);
(W8.of_int 9); (W8.of_int 12); (W8.of_int 13); (W8.of_int 2); (W8.of_int 3);
(W8.of_int 6); (W8.of_int 7); (W8.of_int 10); (W8.of_int 11); (W8.of_int 14);
(W8.of_int 15)]).

abbrev pfm_shift_s =
((Array4.of_list witness)
[(W32.of_int 3); (W32.of_int 2); (W32.of_int 1); (W32.of_int 0)]).

abbrev rOL8 =
((Array1.of_list witness)
[(W256.of_int
 13620818001941277694121380808605999856886653716761013959207994299728839901191
 )]
).

abbrev rOL56 =
((Array1.of_list witness)
[(W256.of_int
 10910488462195273559651782724632284871561478246514020268633800075540923875841
 )]
).

abbrev kECCAK_RHOTATES_RIGHT =
((Array6.of_list witness)
[(W256.of_int 144373339913893657577751063007562604548177214458152943091773);
(W256.of_int 232252764209307188274174373867837442080505530800860351692863);
(W256.of_int 156927543384667019098616994515559168111335794127330162507795);
(W256.of_int 351517697181654122777866749001917765472957616589092975280182);
(W256.of_int 276192476357013953622045746931053922384479139705868246843454);
(W256.of_int 313855086769334038206421612937983674734430261968315659321364)]).

abbrev kECCAK_RHOTATES_LEFT =
((Array6.of_list witness)
[(W256.of_int 257361171150853911329517531560668107745210100483895842570243);
(W256.of_int 169481746855440380633094220700393270212881784141188433969153);
(W256.of_int 244806967680080549808651600052671544182051520814718623154221);
(W256.of_int 50216813883093446129401845566312946820429698352955810381834);
(W256.of_int 125542034707733615285222847637176789908908175236180538818562);
(W256.of_int 87879424295413530700846981630247037558957052973733126340652)]).

abbrev kECCAK1600_RC =
((Array24.of_list witness)
[(W64.of_int 1); (W64.of_int 32898); (W64.of_int (-9223372036854742902));
(W64.of_int (-9223372034707259392)); (W64.of_int 32907);
(W64.of_int 2147483649); (W64.of_int (-9223372034707259263));
(W64.of_int (-9223372036854743031)); (W64.of_int 138); (W64.of_int 136);
(W64.of_int 2147516425); (W64.of_int 2147483658); (W64.of_int 2147516555);
(W64.of_int (-9223372036854775669)); (W64.of_int (-9223372036854742903));
(W64.of_int (-9223372036854743037)); (W64.of_int (-9223372036854743038));
(W64.of_int (-9223372036854775680)); (W64.of_int 32778);
(W64.of_int (-9223372034707292150)); (W64.of_int (-9223372034707259263));
(W64.of_int (-9223372036854742912)); (W64.of_int 2147483649);
(W64.of_int (-9223372034707259384))]).

abbrev jdmontx16 =
((Array16.of_list witness)
[(W16.of_int 1353); (W16.of_int 1353); (W16.of_int 1353); (W16.of_int 1353);
(W16.of_int 1353); (W16.of_int 1353); (W16.of_int 1353); (W16.of_int 1353);
(W16.of_int 1353); (W16.of_int 1353); (W16.of_int 1353); (W16.of_int 1353);
(W16.of_int 1353); (W16.of_int 1353); (W16.of_int 1353); (W16.of_int 1353)]).

abbrev mqinvx16 =
((Array16.of_list witness)
[(W16.of_int 15099); (W16.of_int 15099); (W16.of_int 15099);
(W16.of_int 15099); (W16.of_int 15099); (W16.of_int 15099);
(W16.of_int 15099); (W16.of_int 15099); (W16.of_int 15099);
(W16.of_int 15099); (W16.of_int 15099); (W16.of_int 15099);
(W16.of_int 15099); (W16.of_int 15099); (W16.of_int 15099);
(W16.of_int 15099)]).

abbrev hhqx16 =
((Array16.of_list witness)
[(W16.of_int 832); (W16.of_int 832); (W16.of_int 832); (W16.of_int 832);
(W16.of_int 832); (W16.of_int 832); (W16.of_int 832); (W16.of_int 832);
(W16.of_int 832); (W16.of_int 832); (W16.of_int 832); (W16.of_int 832);
(W16.of_int 832); (W16.of_int 832); (W16.of_int 832); (W16.of_int 832)]).

abbrev hqx16_m1 =
((Array16.of_list witness)
[(W16.of_int 1664); (W16.of_int 1664); (W16.of_int 1664); (W16.of_int 1664);
(W16.of_int 1664); (W16.of_int 1664); (W16.of_int 1664); (W16.of_int 1664);
(W16.of_int 1664); (W16.of_int 1664); (W16.of_int 1664); (W16.of_int 1664);
(W16.of_int 1664); (W16.of_int 1664); (W16.of_int 1664); (W16.of_int 1664)]).

abbrev hqx16_p1 =
((Array16.of_list witness)
[(W16.of_int 1665); (W16.of_int 1665); (W16.of_int 1665); (W16.of_int 1665);
(W16.of_int 1665); (W16.of_int 1665); (W16.of_int 1665); (W16.of_int 1665);
(W16.of_int 1665); (W16.of_int 1665); (W16.of_int 1665); (W16.of_int 1665);
(W16.of_int 1665); (W16.of_int 1665); (W16.of_int 1665); (W16.of_int 1665)]).

abbrev maskx16 =
((Array16.of_list witness)
[(W16.of_int 4095); (W16.of_int 4095); (W16.of_int 4095); (W16.of_int 4095);
(W16.of_int 4095); (W16.of_int 4095); (W16.of_int 4095); (W16.of_int 4095);
(W16.of_int 4095); (W16.of_int 4095); (W16.of_int 4095); (W16.of_int 4095);
(W16.of_int 4095); (W16.of_int 4095); (W16.of_int 4095); (W16.of_int 4095)]).

abbrev jflox16 =
((Array16.of_list witness)
[(W16.of_int (-10079)); (W16.of_int (-10079)); (W16.of_int (-10079));
(W16.of_int (-10079)); (W16.of_int (-10079)); (W16.of_int (-10079));
(W16.of_int (-10079)); (W16.of_int (-10079)); (W16.of_int (-10079));
(W16.of_int (-10079)); (W16.of_int (-10079)); (W16.of_int (-10079));
(W16.of_int (-10079)); (W16.of_int (-10079)); (W16.of_int (-10079));
(W16.of_int (-10079))]).

abbrev jfhix16 =
((Array16.of_list witness)
[(W16.of_int 1441); (W16.of_int 1441); (W16.of_int 1441); (W16.of_int 1441);
(W16.of_int 1441); (W16.of_int 1441); (W16.of_int 1441); (W16.of_int 1441);
(W16.of_int 1441); (W16.of_int 1441); (W16.of_int 1441); (W16.of_int 1441);
(W16.of_int 1441); (W16.of_int 1441); (W16.of_int 1441); (W16.of_int 1441)]).

abbrev jvx16 =
((Array16.of_list witness)
[(W16.of_int 20159); (W16.of_int 20159); (W16.of_int 20159);
(W16.of_int 20159); (W16.of_int 20159); (W16.of_int 20159);
(W16.of_int 20159); (W16.of_int 20159); (W16.of_int 20159);
(W16.of_int 20159); (W16.of_int 20159); (W16.of_int 20159);
(W16.of_int 20159); (W16.of_int 20159); (W16.of_int 20159);
(W16.of_int 20159)]).

abbrev jqinvx16 =
((Array16.of_list witness)
[(W16.of_int (-3327)); (W16.of_int (-3327)); (W16.of_int (-3327));
(W16.of_int (-3327)); (W16.of_int (-3327)); (W16.of_int (-3327));
(W16.of_int (-3327)); (W16.of_int (-3327)); (W16.of_int (-3327));
(W16.of_int (-3327)); (W16.of_int (-3327)); (W16.of_int (-3327));
(W16.of_int (-3327)); (W16.of_int (-3327)); (W16.of_int (-3327));
(W16.of_int (-3327))]).

abbrev jqx16 =
((Array16.of_list witness)
[(W16.of_int 3329); (W16.of_int 3329); (W16.of_int 3329); (W16.of_int 3329);
(W16.of_int 3329); (W16.of_int 3329); (W16.of_int 3329); (W16.of_int 3329);
(W16.of_int 3329); (W16.of_int 3329); (W16.of_int 3329); (W16.of_int 3329);
(W16.of_int 3329); (W16.of_int 3329); (W16.of_int 3329); (W16.of_int 3329)]).

abbrev jzetas_inv_exp =
((Array400.of_list witness)
[(W16.of_int (-23131)); (W16.of_int (-7756)); (W16.of_int 20258);
(W16.of_int 23860); (W16.of_int 17443); (W16.of_int (-23210));
(W16.of_int 20199); (W16.of_int 21498); (W16.of_int (-14469));
(W16.of_int 11045); (W16.of_int 14903); (W16.of_int 6280);
(W16.of_int 32385); (W16.of_int (-15355)); (W16.of_int (-2145));
(W16.of_int (-20296)); (W16.of_int 1701); (W16.of_int 1460);
(W16.of_int 2338); (W16.of_int 308); (W16.of_int 2851); (W16.of_int 854);
(W16.of_int 2535); (W16.of_int 1530); (W16.of_int 1659); (W16.of_int 3109);
(W16.of_int 1335); (W16.of_int 136); (W16.of_int 2945); (W16.of_int 1285);
(W16.of_int 2719); (W16.of_int 2232); (W16.of_int 17423);
(W16.of_int (-23997)); (W16.of_int (-28643)); (W16.of_int (-31636));
(W16.of_int (-10906)); (W16.of_int 22502); (W16.of_int 7934);
(W16.of_int (-10335)); (W16.of_int (-16989)); (W16.of_int (-24214));
(W16.of_int (-10945)); (W16.of_int 20927); (W16.of_int (-24391));
(W16.of_int 7383); (W16.of_int (-25434)); (W16.of_int 31184);
(W16.of_int 1807); (W16.of_int 2371); (W16.of_int 2333); (W16.of_int 108);
(W16.of_int 870); (W16.of_int 1510); (W16.of_int 1278); (W16.of_int 1185);
(W16.of_int 1187); (W16.of_int 874); (W16.of_int 2111); (W16.of_int 1215);
(W16.of_int 1465); (W16.of_int 2007); (W16.of_int 2726); (W16.of_int 2512);
(W16.of_int 17915); (W16.of_int 24156); (W16.of_int (-4311));
(W16.of_int (-16831)); (W16.of_int 12757); (W16.of_int 29156);
(W16.of_int (-14016)); (W16.of_int (-13426)); (W16.of_int (-18249));
(W16.of_int 30199); (W16.of_int (-9075)); (W16.of_int 28310);
(W16.of_int 8899); (W16.of_int 15887); (W16.of_int 28250);
(W16.of_int (-19883)); (W16.of_int 1275); (W16.of_int 2652);
(W16.of_int 1065); (W16.of_int 2881); (W16.of_int 725); (W16.of_int 1508);
(W16.of_int 2368); (W16.of_int 398); (W16.of_int 951); (W16.of_int 247);
(W16.of_int 1421); (W16.of_int 3222); (W16.of_int 2499); (W16.of_int 271);
(W16.of_int 90); (W16.of_int 853); (W16.of_int 16163); (W16.of_int 16163);
(W16.of_int (-26675)); (W16.of_int (-26675)); (W16.of_int (-8858));
(W16.of_int (-8858)); (W16.of_int (-18426)); (W16.of_int (-18426));
(W16.of_int (-8799)); (W16.of_int (-8799)); (W16.of_int 10533);
(W16.of_int 10533); (W16.of_int (-24312)); (W16.of_int (-24312));
(W16.of_int 28073); (W16.of_int 28073); (W16.of_int 1571); (W16.of_int 1571);
(W16.of_int 205); (W16.of_int 205); (W16.of_int 2918); (W16.of_int 2918);
(W16.of_int 1542); (W16.of_int 1542); (W16.of_int 2721); (W16.of_int 2721);
(W16.of_int 2597); (W16.of_int 2597); (W16.of_int 2312); (W16.of_int 2312);
(W16.of_int 681); (W16.of_int 681); (W16.of_int (-31163));
(W16.of_int (-31163)); (W16.of_int (-31163)); (W16.of_int (-31163));
(W16.of_int 11202); (W16.of_int 11202); (W16.of_int 11202);
(W16.of_int 11202); (W16.of_int (-1358)); (W16.of_int (-1358));
(W16.of_int (-1358)); (W16.of_int (-1358)); (W16.of_int (-10689));
(W16.of_int (-10689)); (W16.of_int (-10689)); (W16.of_int (-10689));
(W16.of_int 1861); (W16.of_int 1861); (W16.of_int 1861); (W16.of_int 1861);
(W16.of_int 1474); (W16.of_int 1474); (W16.of_int 1474); (W16.of_int 1474);
(W16.of_int 1202); (W16.of_int 1202); (W16.of_int 1202); (W16.of_int 1202);
(W16.of_int 2367); (W16.of_int 2367); (W16.of_int 2367); (W16.of_int 2367);
(W16.of_int 16695); (W16.of_int 16695); (W16.of_int 16695);
(W16.of_int 16695); (W16.of_int 16695); (W16.of_int 16695);
(W16.of_int 16695); (W16.of_int 16695); (W16.of_int (-28190));
(W16.of_int (-28190)); (W16.of_int (-28190)); (W16.of_int (-28190));
(W16.of_int (-28190)); (W16.of_int (-28190)); (W16.of_int (-28190));
(W16.of_int (-28190)); (W16.of_int 3127); (W16.of_int 3127);
(W16.of_int 3127); (W16.of_int 3127); (W16.of_int 3127); (W16.of_int 3127);
(W16.of_int 3127); (W16.of_int 3127); (W16.of_int 3042); (W16.of_int 3042);
(W16.of_int 3042); (W16.of_int 3042); (W16.of_int 3042); (W16.of_int 3042);
(W16.of_int 3042); (W16.of_int 3042); (W16.of_int (-787));
(W16.of_int (-787)); (W16.of_int 1517); (W16.of_int 1517);
(W16.of_int 12619); (W16.of_int (-19528)); (W16.of_int (-18524));
(W16.of_int (-20099)); (W16.of_int (-12638)); (W16.of_int 18742);
(W16.of_int (-30317)); (W16.of_int 32503); (W16.of_int (-5492));
(W16.of_int (-23092)); (W16.of_int 4587); (W16.of_int (-13130));
(W16.of_int 21656); (W16.of_int 14234); (W16.of_int (-13386));
(W16.of_int (-11181)); (W16.of_int 75); (W16.of_int 3000); (W16.of_int 2980);
(W16.of_int 2685); (W16.of_int 2210); (W16.of_int 1846); (W16.of_int 147);
(W16.of_int 2551); (W16.of_int 1676); (W16.of_int 460); (W16.of_int 235);
(W16.of_int 2742); (W16.of_int 3224); (W16.of_int 2458); (W16.of_int 2486);
(W16.of_int 2899); (W16.of_int 5276); (W16.of_int 14431);
(W16.of_int (-17560)); (W16.of_int 18486); (W16.of_int 28762);
(W16.of_int (-29175)); (W16.of_int (-10630)); (W16.of_int (-32010));
(W16.of_int (-6181)); (W16.of_int 14883); (W16.of_int (-944));
(W16.of_int 27739); (W16.of_int (-20493)); (W16.of_int 32227);
(W16.of_int 11478); (W16.of_int 335); (W16.of_int 156); (W16.of_int 2911);
(W16.of_int 872); (W16.of_int 1590); (W16.of_int 602); (W16.of_int 777);
(W16.of_int 2170); (W16.of_int 246); (W16.of_int 1755); (W16.of_int 291);
(W16.of_int 3152); (W16.of_int 2907); (W16.of_int 1779); (W16.of_int 1251);
(W16.of_int 2774); (W16.of_int 1103); (W16.of_int (-27836));
(W16.of_int 25987); (W16.of_int 650); (W16.of_int (-9134));
(W16.of_int 12442); (W16.of_int (-16064)); (W16.of_int (-26616));
(W16.of_int 12797); (W16.of_int (-25080)); (W16.of_int (-20710));
(W16.of_int (-20178)); (W16.of_int 23565); (W16.of_int (-30966));
(W16.of_int (-1496)); (W16.of_int 6517); (W16.of_int 5690);
(W16.of_int 1860); (W16.of_int 3203); (W16.of_int 1162); (W16.of_int 1618);
(W16.of_int 666); (W16.of_int 320); (W16.of_int 8); (W16.of_int 2813);
(W16.of_int 1544); (W16.of_int 282); (W16.of_int 1838); (W16.of_int 1293);
(W16.of_int 2314); (W16.of_int 552); (W16.of_int 2677); (W16.of_int 2106);
(W16.of_int 26242); (W16.of_int 26242); (W16.of_int (-21438));
(W16.of_int (-21438)); (W16.of_int 1103); (W16.of_int 1103);
(W16.of_int (-5571)); (W16.of_int (-5571)); (W16.of_int 29058);
(W16.of_int 29058); (W16.of_int 26361); (W16.of_int 26361);
(W16.of_int (-17363)); (W16.of_int (-17363)); (W16.of_int 5828);
(W16.of_int 5828); (W16.of_int 130); (W16.of_int 130); (W16.of_int 1602);
(W16.of_int 1602); (W16.of_int 1871); (W16.of_int 1871); (W16.of_int 829);
(W16.of_int 829); (W16.of_int 2946); (W16.of_int 2946); (W16.of_int 3065);
(W16.of_int 3065); (W16.of_int 1325); (W16.of_int 1325); (W16.of_int 2756);
(W16.of_int 2756); (W16.of_int 15691); (W16.of_int 15691);
(W16.of_int 15691); (W16.of_int 15691); (W16.of_int 3800); (W16.of_int 3800);
(W16.of_int 3800); (W16.of_int 3800); (W16.of_int (-27757));
(W16.of_int (-27757)); (W16.of_int (-27757)); (W16.of_int (-27757));
(W16.of_int 20907); (W16.of_int 20907); (W16.of_int 20907);
(W16.of_int 20907); (W16.of_int 3147); (W16.of_int 3147); (W16.of_int 3147);
(W16.of_int 3147); (W16.of_int 1752); (W16.of_int 1752); (W16.of_int 1752);
(W16.of_int 1752); (W16.of_int 2707); (W16.of_int 2707); (W16.of_int 2707);
(W16.of_int 2707); (W16.of_int 171); (W16.of_int 171); (W16.of_int 171);
(W16.of_int 171); (W16.of_int 12403); (W16.of_int 12403); (W16.of_int 12403);
(W16.of_int 12403); (W16.of_int 12403); (W16.of_int 12403);
(W16.of_int 12403); (W16.of_int 12403); (W16.of_int (-13524));
(W16.of_int (-13524)); (W16.of_int (-13524)); (W16.of_int (-13524));
(W16.of_int (-13524)); (W16.of_int (-13524)); (W16.of_int (-13524));
(W16.of_int (-13524)); (W16.of_int 1907); (W16.of_int 1907);
(W16.of_int 1907); (W16.of_int 1907); (W16.of_int 1907); (W16.of_int 1907);
(W16.of_int 1907); (W16.of_int 1907); (W16.of_int 1836); (W16.of_int 1836);
(W16.of_int 1836); (W16.of_int 1836); (W16.of_int 1836); (W16.of_int 1836);
(W16.of_int 1836); (W16.of_int 1836); (W16.of_int (-14745));
(W16.of_int (-14745)); (W16.of_int 359); (W16.of_int 359);
(W16.of_int (-5236)); (W16.of_int (-5236)); (W16.of_int 1932);
(W16.of_int 1932); (W16.of_int 0); (W16.of_int 0); (W16.of_int 0);
(W16.of_int 0)]).

abbrev jzetas_exp =
((Array400.of_list witness)
[(W16.of_int 31499); (W16.of_int 31499); (W16.of_int 2571);
(W16.of_int 2571); (W16.of_int 14746); (W16.of_int 14746); (W16.of_int 2970);
(W16.of_int 2970); (W16.of_int 13525); (W16.of_int 13525);
(W16.of_int 13525); (W16.of_int 13525); (W16.of_int 13525);
(W16.of_int 13525); (W16.of_int 13525); (W16.of_int 13525);
(W16.of_int (-12402)); (W16.of_int (-12402)); (W16.of_int (-12402));
(W16.of_int (-12402)); (W16.of_int (-12402)); (W16.of_int (-12402));
(W16.of_int (-12402)); (W16.of_int (-12402)); (W16.of_int 1493);
(W16.of_int 1493); (W16.of_int 1493); (W16.of_int 1493); (W16.of_int 1493);
(W16.of_int 1493); (W16.of_int 1493); (W16.of_int 1493); (W16.of_int 1422);
(W16.of_int 1422); (W16.of_int 1422); (W16.of_int 1422); (W16.of_int 1422);
(W16.of_int 1422); (W16.of_int 1422); (W16.of_int 1422);
(W16.of_int (-20906)); (W16.of_int (-20906)); (W16.of_int (-20906));
(W16.of_int (-20906)); (W16.of_int 27758); (W16.of_int 27758);
(W16.of_int 27758); (W16.of_int 27758); (W16.of_int (-3799));
(W16.of_int (-3799)); (W16.of_int (-3799)); (W16.of_int (-3799));
(W16.of_int (-15690)); (W16.of_int (-15690)); (W16.of_int (-15690));
(W16.of_int (-15690)); (W16.of_int 3158); (W16.of_int 3158);
(W16.of_int 3158); (W16.of_int 3158); (W16.of_int 622); (W16.of_int 622);
(W16.of_int 622); (W16.of_int 622); (W16.of_int 1577); (W16.of_int 1577);
(W16.of_int 1577); (W16.of_int 1577); (W16.of_int 182); (W16.of_int 182);
(W16.of_int 182); (W16.of_int 182); (W16.of_int (-5827));
(W16.of_int (-5827)); (W16.of_int 17364); (W16.of_int 17364);
(W16.of_int (-26360)); (W16.of_int (-26360)); (W16.of_int (-29057));
(W16.of_int (-29057)); (W16.of_int 5572); (W16.of_int 5572);
(W16.of_int (-1102)); (W16.of_int (-1102)); (W16.of_int 21439);
(W16.of_int 21439); (W16.of_int (-26241)); (W16.of_int (-26241));
(W16.of_int 573); (W16.of_int 573); (W16.of_int 2004); (W16.of_int 2004);
(W16.of_int 264); (W16.of_int 264); (W16.of_int 383); (W16.of_int 383);
(W16.of_int 2500); (W16.of_int 2500); (W16.of_int 1458); (W16.of_int 1458);
(W16.of_int 1727); (W16.of_int 1727); (W16.of_int 3199); (W16.of_int 3199);
(W16.of_int (-5689)); (W16.of_int (-6516)); (W16.of_int 1497);
(W16.of_int 30967); (W16.of_int (-23564)); (W16.of_int 20179);
(W16.of_int 20711); (W16.of_int 25081); (W16.of_int (-12796));
(W16.of_int 26617); (W16.of_int 16065); (W16.of_int (-12441));
(W16.of_int 9135); (W16.of_int (-649)); (W16.of_int (-25986));
(W16.of_int 27837); (W16.of_int 1223); (W16.of_int 652); (W16.of_int 2777);
(W16.of_int 1015); (W16.of_int 2036); (W16.of_int 1491); (W16.of_int 3047);
(W16.of_int 1785); (W16.of_int 516); (W16.of_int 3321); (W16.of_int 3009);
(W16.of_int 2663); (W16.of_int 1711); (W16.of_int 2167); (W16.of_int 126);
(W16.of_int 1469); (W16.of_int (-334)); (W16.of_int (-11477));
(W16.of_int (-32226)); (W16.of_int 20494); (W16.of_int (-27738));
(W16.of_int 945); (W16.of_int (-14882)); (W16.of_int 6182);
(W16.of_int 32011); (W16.of_int 10631); (W16.of_int 29176);
(W16.of_int (-28761)); (W16.of_int (-18485)); (W16.of_int 17561);
(W16.of_int (-14430)); (W16.of_int (-5275)); (W16.of_int 2226);
(W16.of_int 555); (W16.of_int 2078); (W16.of_int 1550); (W16.of_int 422);
(W16.of_int 177); (W16.of_int 3038); (W16.of_int 1574); (W16.of_int 3083);
(W16.of_int 1159); (W16.of_int 2552); (W16.of_int 2727); (W16.of_int 1739);
(W16.of_int 2457); (W16.of_int 418); (W16.of_int 3173); (W16.of_int 11182);
(W16.of_int 13387); (W16.of_int (-14233)); (W16.of_int (-21655));
(W16.of_int 13131); (W16.of_int (-4586)); (W16.of_int 23093);
(W16.of_int 5493); (W16.of_int (-32502)); (W16.of_int 30318);
(W16.of_int (-18741)); (W16.of_int 12639); (W16.of_int 20100);
(W16.of_int 18525); (W16.of_int 19529); (W16.of_int (-12618));
(W16.of_int 430); (W16.of_int 843); (W16.of_int 871); (W16.of_int 105);
(W16.of_int 587); (W16.of_int 3094); (W16.of_int 2869); (W16.of_int 1653);
(W16.of_int 778); (W16.of_int 3182); (W16.of_int 1483); (W16.of_int 1119);
(W16.of_int 644); (W16.of_int 349); (W16.of_int 329); (W16.of_int 3254);
(W16.of_int 788); (W16.of_int 788); (W16.of_int 1812); (W16.of_int 1812);
(W16.of_int 28191); (W16.of_int 28191); (W16.of_int 28191);
(W16.of_int 28191); (W16.of_int 28191); (W16.of_int 28191);
(W16.of_int 28191); (W16.of_int 28191); (W16.of_int (-16694));
(W16.of_int (-16694)); (W16.of_int (-16694)); (W16.of_int (-16694));
(W16.of_int (-16694)); (W16.of_int (-16694)); (W16.of_int (-16694));
(W16.of_int (-16694)); (W16.of_int 287); (W16.of_int 287); (W16.of_int 287);
(W16.of_int 287); (W16.of_int 287); (W16.of_int 287); (W16.of_int 287);
(W16.of_int 287); (W16.of_int 202); (W16.of_int 202); (W16.of_int 202);
(W16.of_int 202); (W16.of_int 202); (W16.of_int 202); (W16.of_int 202);
(W16.of_int 202); (W16.of_int 10690); (W16.of_int 10690); (W16.of_int 10690);
(W16.of_int 10690); (W16.of_int 1359); (W16.of_int 1359); (W16.of_int 1359);
(W16.of_int 1359); (W16.of_int (-11201)); (W16.of_int (-11201));
(W16.of_int (-11201)); (W16.of_int (-11201)); (W16.of_int 31164);
(W16.of_int 31164); (W16.of_int 31164); (W16.of_int 31164); (W16.of_int 962);
(W16.of_int 962); (W16.of_int 962); (W16.of_int 962); (W16.of_int 2127);
(W16.of_int 2127); (W16.of_int 2127); (W16.of_int 2127); (W16.of_int 1855);
(W16.of_int 1855); (W16.of_int 1855); (W16.of_int 1855); (W16.of_int 1468);
(W16.of_int 1468); (W16.of_int 1468); (W16.of_int 1468);
(W16.of_int (-28072)); (W16.of_int (-28072)); (W16.of_int 24313);
(W16.of_int 24313); (W16.of_int (-10532)); (W16.of_int (-10532));
(W16.of_int 8800); (W16.of_int 8800); (W16.of_int 18427); (W16.of_int 18427);
(W16.of_int 8859); (W16.of_int 8859); (W16.of_int 26676); (W16.of_int 26676);
(W16.of_int (-16162)); (W16.of_int (-16162)); (W16.of_int 2648);
(W16.of_int 2648); (W16.of_int 1017); (W16.of_int 1017); (W16.of_int 732);
(W16.of_int 732); (W16.of_int 608); (W16.of_int 608); (W16.of_int 1787);
(W16.of_int 1787); (W16.of_int 411); (W16.of_int 411); (W16.of_int 3124);
(W16.of_int 3124); (W16.of_int 1758); (W16.of_int 1758); (W16.of_int 19884);
(W16.of_int (-28249)); (W16.of_int (-15886)); (W16.of_int (-8898));
(W16.of_int (-28309)); (W16.of_int 9076); (W16.of_int (-30198));
(W16.of_int 18250); (W16.of_int 13427); (W16.of_int 14017);
(W16.of_int (-29155)); (W16.of_int (-12756)); (W16.of_int 16832);
(W16.of_int 4312); (W16.of_int (-24155)); (W16.of_int (-17914));
(W16.of_int 2476); (W16.of_int 3239); (W16.of_int 3058); (W16.of_int 830);
(W16.of_int 107); (W16.of_int 1908); (W16.of_int 3082); (W16.of_int 2378);
(W16.of_int 2931); (W16.of_int 961); (W16.of_int 1821); (W16.of_int 2604);
(W16.of_int 448); (W16.of_int 2264); (W16.of_int 677); (W16.of_int 2054);
(W16.of_int (-31183)); (W16.of_int 25435); (W16.of_int (-7382));
(W16.of_int 24392); (W16.of_int (-20926)); (W16.of_int 10946);
(W16.of_int 24215); (W16.of_int 16990); (W16.of_int 10336);
(W16.of_int (-7933)); (W16.of_int (-22501)); (W16.of_int 10907);
(W16.of_int 31637); (W16.of_int 28644); (W16.of_int 23998);
(W16.of_int (-17422)); (W16.of_int 817); (W16.of_int 603); (W16.of_int 1322);
(W16.of_int 1864); (W16.of_int 2114); (W16.of_int 1218); (W16.of_int 2455);
(W16.of_int 2142); (W16.of_int 2144); (W16.of_int 2051); (W16.of_int 1819);
(W16.of_int 2459); (W16.of_int 3221); (W16.of_int 996); (W16.of_int 958);
(W16.of_int 1522); (W16.of_int 20297); (W16.of_int 2146); (W16.of_int 15356);
(W16.of_int (-32384)); (W16.of_int (-6279)); (W16.of_int (-14902));
(W16.of_int (-11044)); (W16.of_int 14470); (W16.of_int (-21497));
(W16.of_int (-20198)); (W16.of_int 23211); (W16.of_int (-17442));
(W16.of_int (-23859)); (W16.of_int (-20257)); (W16.of_int 7757);
(W16.of_int 23132); (W16.of_int 1097); (W16.of_int 610); (W16.of_int 2044);
(W16.of_int 384); (W16.of_int 3193); (W16.of_int 1994); (W16.of_int 220);
(W16.of_int 1670); (W16.of_int 1799); (W16.of_int 794); (W16.of_int 2475);
(W16.of_int 478); (W16.of_int 3021); (W16.of_int 991); (W16.of_int 1869);
(W16.of_int 1628); (W16.of_int 0); (W16.of_int 0); (W16.of_int 0);
(W16.of_int 0)]).

abbrev jzetas_inv =
((Array128.of_list witness)
[(W16.of_int 1701); (W16.of_int 1807); (W16.of_int 1460); (W16.of_int 2371);
(W16.of_int 2338); (W16.of_int 2333); (W16.of_int 308); (W16.of_int 108);
(W16.of_int 2851); (W16.of_int 870); (W16.of_int 854); (W16.of_int 1510);
(W16.of_int 2535); (W16.of_int 1278); (W16.of_int 1530); (W16.of_int 1185);
(W16.of_int 1659); (W16.of_int 1187); (W16.of_int 3109); (W16.of_int 874);
(W16.of_int 1335); (W16.of_int 2111); (W16.of_int 136); (W16.of_int 1215);
(W16.of_int 2945); (W16.of_int 1465); (W16.of_int 1285); (W16.of_int 2007);
(W16.of_int 2719); (W16.of_int 2726); (W16.of_int 2232); (W16.of_int 2512);
(W16.of_int 75); (W16.of_int 156); (W16.of_int 3000); (W16.of_int 2911);
(W16.of_int 2980); (W16.of_int 872); (W16.of_int 2685); (W16.of_int 1590);
(W16.of_int 2210); (W16.of_int 602); (W16.of_int 1846); (W16.of_int 777);
(W16.of_int 147); (W16.of_int 2170); (W16.of_int 2551); (W16.of_int 246);
(W16.of_int 1676); (W16.of_int 1755); (W16.of_int 460); (W16.of_int 291);
(W16.of_int 235); (W16.of_int 3152); (W16.of_int 2742); (W16.of_int 2907);
(W16.of_int 3224); (W16.of_int 1779); (W16.of_int 2458); (W16.of_int 1251);
(W16.of_int 2486); (W16.of_int 2774); (W16.of_int 2899); (W16.of_int 1103);
(W16.of_int 1275); (W16.of_int 2652); (W16.of_int 1065); (W16.of_int 2881);
(W16.of_int 725); (W16.of_int 1508); (W16.of_int 2368); (W16.of_int 398);
(W16.of_int 951); (W16.of_int 247); (W16.of_int 1421); (W16.of_int 3222);
(W16.of_int 2499); (W16.of_int 271); (W16.of_int 90); (W16.of_int 853);
(W16.of_int 1860); (W16.of_int 3203); (W16.of_int 1162); (W16.of_int 1618);
(W16.of_int 666); (W16.of_int 320); (W16.of_int 8); (W16.of_int 2813);
(W16.of_int 1544); (W16.of_int 282); (W16.of_int 1838); (W16.of_int 1293);
(W16.of_int 2314); (W16.of_int 552); (W16.of_int 2677); (W16.of_int 2106);
(W16.of_int 1571); (W16.of_int 205); (W16.of_int 2918); (W16.of_int 1542);
(W16.of_int 2721); (W16.of_int 2597); (W16.of_int 2312); (W16.of_int 681);
(W16.of_int 130); (W16.of_int 1602); (W16.of_int 1871); (W16.of_int 829);
(W16.of_int 2946); (W16.of_int 3065); (W16.of_int 1325); (W16.of_int 2756);
(W16.of_int 1861); (W16.of_int 1474); (W16.of_int 1202); (W16.of_int 2367);
(W16.of_int 3147); (W16.of_int 1752); (W16.of_int 2707); (W16.of_int 171);
(W16.of_int 3127); (W16.of_int 3042); (W16.of_int 1907); (W16.of_int 1836);
(W16.of_int 1517); (W16.of_int 359); (W16.of_int 758); (W16.of_int 1441)]).

abbrev jzetas =
((Array128.of_list witness)
[(W16.of_int 2285); (W16.of_int 2571); (W16.of_int 2970); (W16.of_int 1812);
(W16.of_int 1493); (W16.of_int 1422); (W16.of_int 287); (W16.of_int 202);
(W16.of_int 3158); (W16.of_int 622); (W16.of_int 1577); (W16.of_int 182);
(W16.of_int 962); (W16.of_int 2127); (W16.of_int 1855); (W16.of_int 1468);
(W16.of_int 573); (W16.of_int 2004); (W16.of_int 264); (W16.of_int 383);
(W16.of_int 2500); (W16.of_int 1458); (W16.of_int 1727); (W16.of_int 3199);
(W16.of_int 2648); (W16.of_int 1017); (W16.of_int 732); (W16.of_int 608);
(W16.of_int 1787); (W16.of_int 411); (W16.of_int 3124); (W16.of_int 1758);
(W16.of_int 1223); (W16.of_int 652); (W16.of_int 2777); (W16.of_int 1015);
(W16.of_int 2036); (W16.of_int 1491); (W16.of_int 3047); (W16.of_int 1785);
(W16.of_int 516); (W16.of_int 3321); (W16.of_int 3009); (W16.of_int 2663);
(W16.of_int 1711); (W16.of_int 2167); (W16.of_int 126); (W16.of_int 1469);
(W16.of_int 2476); (W16.of_int 3239); (W16.of_int 3058); (W16.of_int 830);
(W16.of_int 107); (W16.of_int 1908); (W16.of_int 3082); (W16.of_int 2378);
(W16.of_int 2931); (W16.of_int 961); (W16.of_int 1821); (W16.of_int 2604);
(W16.of_int 448); (W16.of_int 2264); (W16.of_int 677); (W16.of_int 2054);
(W16.of_int 2226); (W16.of_int 430); (W16.of_int 555); (W16.of_int 843);
(W16.of_int 2078); (W16.of_int 871); (W16.of_int 1550); (W16.of_int 105);
(W16.of_int 422); (W16.of_int 587); (W16.of_int 177); (W16.of_int 3094);
(W16.of_int 3038); (W16.of_int 2869); (W16.of_int 1574); (W16.of_int 1653);
(W16.of_int 3083); (W16.of_int 778); (W16.of_int 1159); (W16.of_int 3182);
(W16.of_int 2552); (W16.of_int 1483); (W16.of_int 2727); (W16.of_int 1119);
(W16.of_int 1739); (W16.of_int 644); (W16.of_int 2457); (W16.of_int 349);
(W16.of_int 418); (W16.of_int 329); (W16.of_int 3173); (W16.of_int 3254);
(W16.of_int 817); (W16.of_int 1097); (W16.of_int 603); (W16.of_int 610);
(W16.of_int 1322); (W16.of_int 2044); (W16.of_int 1864); (W16.of_int 384);
(W16.of_int 2114); (W16.of_int 3193); (W16.of_int 1218); (W16.of_int 1994);
(W16.of_int 2455); (W16.of_int 220); (W16.of_int 2142); (W16.of_int 1670);
(W16.of_int 2144); (W16.of_int 1799); (W16.of_int 2051); (W16.of_int 794);
(W16.of_int 1819); (W16.of_int 2475); (W16.of_int 2459); (W16.of_int 478);
(W16.of_int 3221); (W16.of_int 3021); (W16.of_int 996); (W16.of_int 991);
(W16.of_int 958); (W16.of_int 1869); (W16.of_int 1522); (W16.of_int 1628)]).

module M = {
  proc __shuffle8 (a:W256.t, b:W256.t) : W256.t * W256.t = {
    var r0:W256.t;
    var r1:W256.t;
    r0 <- (VPERM2I128 a b (W8.of_int 32));
    r1 <- (VPERM2I128 a b (W8.of_int 49));
    return (r0, r1);
  }
  proc __shuffle4 (a:W256.t, b:W256.t) : W256.t * W256.t = {
    var r0:W256.t;
    var r1:W256.t;
    r0 <- (VPUNPCKL_4u64 a b);
    r1 <- (VPUNPCKH_4u64 a b);
    return (r0, r1);
  }
  proc __shuffle2 (a:W256.t, b:W256.t) : W256.t * W256.t = {
    var t0:W256.t;
    var t1:W256.t;
    t0 <- (VMOVSLDUP_256 b);
    t0 <- (VPBLEND_8u32 a t0 (W8.of_int 170));
    a <- (VPSRL_4u64 a (W128.of_int 32));
    t1 <- (VPBLEND_8u32 a b (W8.of_int 170));
    return (t0, t1);
  }
  proc __shuffle1 (a:W256.t, b:W256.t) : W256.t * W256.t = {
    var r0:W256.t;
    var r1:W256.t;
    var t0:W256.t;
    var t1:W256.t;
    t0 <- (VPSLL_8u32 b (W128.of_int 16));
    r0 <- (VPBLEND_16u16 a t0 (W8.of_int 170));
    t1 <- (VPSRL_8u32 a (W128.of_int 16));
    r1 <- (VPBLEND_16u16 t1 b (W8.of_int 170));
    return (r0, r1);
  }
  proc __nttunpack128 (r0:W256.t, r1:W256.t, r2:W256.t, r3:W256.t, r4:W256.t,
                       r5:W256.t, r6:W256.t, r7:W256.t) : W256.t * W256.t *
                                                          W256.t * W256.t *
                                                          W256.t * W256.t *
                                                          W256.t * W256.t = {
    
    (r0, r4) <@ __shuffle8 (r0, r4);
    (r1, r5) <@ __shuffle8 (r1, r5);
    (r2, r6) <@ __shuffle8 (r2, r6);
    (r3, r7) <@ __shuffle8 (r3, r7);
    (r0, r2) <@ __shuffle4 (r0, r2);
    (r4, r6) <@ __shuffle4 (r4, r6);
    (r1, r3) <@ __shuffle4 (r1, r3);
    (r5, r7) <@ __shuffle4 (r5, r7);
    (r0, r1) <@ __shuffle2 (r0, r1);
    (r2, r3) <@ __shuffle2 (r2, r3);
    (r4, r5) <@ __shuffle2 (r4, r5);
    (r6, r7) <@ __shuffle2 (r6, r7);
    (r0, r4) <@ __shuffle1 (r0, r4);
    (r1, r5) <@ __shuffle1 (r1, r5);
    (r2, r6) <@ __shuffle1 (r2, r6);
    (r3, r7) <@ __shuffle1 (r3, r7);
    return (r0, r4, r1, r5, r2, r6, r3, r7);
  }
  proc _nttunpack (rp:W16.t Array256.t) : W16.t Array256.t = {
    var r0:W256.t;
    var r1:W256.t;
    var r2:W256.t;
    var r3:W256.t;
    var r4:W256.t;
    var r5:W256.t;
    var r6:W256.t;
    var r7:W256.t;
    r0 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 0));
    r1 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 1));
    r2 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 2));
    r3 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 3));
    r4 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 4));
    r5 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 5));
    r6 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 6));
    r7 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 7));
    (r0, r1, r2, r3, r4, r5, r6, r7) <@ __nttunpack128 (r0, r1, r2, r3, 
    r4, r5, r6, r7);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 0) 
    r0)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 1) 
    r1)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 2) 
    r2)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 3) 
    r3)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 4) 
    r4)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 5) 
    r5)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 6) 
    r6)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 7) 
    r7)));
    r0 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 8));
    r1 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 9));
    r2 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 10));
    r3 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 11));
    r4 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 12));
    r5 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 13));
    r6 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 14));
    r7 <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 15));
    (r0, r1, r2, r3, r4, r5, r6, r7) <@ __nttunpack128 (r0, r1, r2, r3, 
    r4, r5, r6, r7);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 8) 
    r0)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 9) 
    r1)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 10)
    r2)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 11)
    r3)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 12)
    r4)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 13)
    r5)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 14)
    r6)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 15)
    r7)));
    return rp;
  }
  proc __csubq (r:W256.t, qx16:W256.t) : W256.t = {
    var t:W256.t;
    r <- (VPSUB_16u16 r qx16);
    t <- (VPSRA_16u16 r (W128.of_int 15));
    t <- (VPAND_256 t qx16);
    r <- (VPADD_16u16 t r);
    return r;
  }
  proc __red16x (r:W256.t, qx16:W256.t, vx16:W256.t) : W256.t = {
    var x:W256.t;
    x <- (VPMULH_16u16 r vx16);
    x <- (VPSRA_16u16 x (W128.of_int 10));
    x <- (VPMULL_16u16 x qx16);
    r <- (VPSUB_16u16 r x);
    return r;
  }
  proc __fqmulprecomp16x (b:W256.t, al:W256.t, ah:W256.t, qx16:W256.t) : 
  W256.t = {
    var x:W256.t;
    x <- (VPMULL_16u16 al b);
    b <- (VPMULH_16u16 ah b);
    x <- (VPMULH_16u16 x qx16);
    b <- (VPSUB_16u16 b x);
    return b;
  }
  proc __fqmulx16 (a:W256.t, b:W256.t, qx16:W256.t, qinvx16:W256.t) : W256.t = {
    var rd:W256.t;
    var rhi:W256.t;
    var rlo:W256.t;
    rhi <- (VPMULH_16u16 a b);
    rlo <- (VPMULL_16u16 a b);
    rlo <- (VPMULL_16u16 rlo qinvx16);
    rlo <- (VPMULH_16u16 rlo qx16);
    rd <- (VPSUB_16u16 rhi rlo);
    return rd;
  }
  proc __HAS_FEATURE (sELECTION:int, fEATURES:int) : bool = {
    var b:bool;
    b <-
    (((W256.of_int fEATURES) `&` (W256.of_int sELECTION)) <> (W256.of_int 0));
    return b;
  }
  proc __SHLQ (x:W64.t, shbytes:int) : W64.t = {
    
    if ((shbytes <> 0)) {
      x <- (x `<<` (W8.of_int (8 * shbytes)));
    } else {
      
    }
    return x;
  }
  proc __SHLQ_256 (x:W256.t, shbytes:int) : W256.t = {
    
    if ((shbytes <> 0)) {
      x <- (VPSLL_4u64 x (W128.of_int (8 * shbytes)));
    } else {
      
    }
    return x;
  }
  proc __KECCAK_F (pERMUTATION:int) : int = {
    var perm:int;
    perm <- (W256.to_uint ((W256.of_int pERMUTATION) `&` (W256.of_int 255)));
    return perm;
  }
  proc __KECCAK_Fx4 (pERMUTATION:int) : int = {
    var perm:int;
    perm <-
    (W256.to_uint ((W256.of_int pERMUTATION) `&` (W256.of_int 65280)));
    return perm;
  }
  proc keccakf1600_index (x:int, y:int) : int = {
    var r:int;
    r <- ((x %% 5) + (5 * (y %% 5)));
    return r;
  }
  proc keccakf1600_rho_offsets (i:int) : int = {
    var r:int;
    var x:int;
    var y:int;
    var t:int;
    var z:int;
    r <- 0;
    x <- 1;
    y <- 0;
    t <- 0;
    while ((t < 24)) {
      if ((i = (x + (5 * y)))) {
        r <- ((((t + 1) * (t + 2)) %/ 2) %% 64);
      } else {
        
      }
      z <- (((2 * x) + (3 * y)) %% 5);
      x <- y;
      y <- z;
      t <- (t + 1);
    }
    return r;
  }
  proc keccakf1600_rhotates (x:int, y:int) : int = {
    var r:int;
    var i:int;
    i <@ keccakf1600_index (x, y);
    r <@ keccakf1600_rho_offsets (i);
    return r;
  }
  proc __andn_u64_ref (a:W64.t, b:W64.t) : W64.t = {
    var t:W64.t;
    var hAS_BMI:bool;
    hAS_BMI <@ __HAS_FEATURE (1, ((1 + 2) + 4));
    if (hAS_BMI) {
      t <- ((invw a) `&` b);
    } else {
      t <- a;
      t <- (invw t);
      t <- (t `&` b);
    }
    return t;
  }
  proc __rol_u64_ref (x:W64.t, i:int) : W64.t = {
    var t:W64.t;
    var hAS_BMI2:bool;
    var  _0:bool;
    var  _1:bool;
    hAS_BMI2 <@ __HAS_FEATURE (2, ((1 + 2) + 4));
    if (hAS_BMI2) {
      if ((i <> 0)) {
        t <- (RORX_64 x (W8.of_int ((64 - i) %% 64)));
      } else {
        t <- x;
      }
    } else {
      if ((i <> 0)) {
        ( _0,  _1, t) <- (ROL_64 x (W8.of_int i));
      } else {
        t <- x;
      }
    }
    return t;
  }
  proc __theta_sum_ref (a:W64.t Array25.t) : W64.t Array5.t = {
    var c:W64.t Array5.t;
    var x:int;
    var y:int;
    c <- witness;
    x <- 0;
    while ((x < 5)) {
      c.[x] <- a.[(x + 0)];
      x <- (x + 1);
    }
    y <- 1;
    while ((y < 5)) {
      x <- 0;
      while ((x < 5)) {
        c.[x] <- (c.[x] `^` a.[(x + (y * 5))]);
        x <- (x + 1);
      }
      y <- (y + 1);
    }
    return c;
  }
  proc __theta_rol_ref (c:W64.t Array5.t) : W64.t Array5.t = {
    var aux:W64.t;
    var d:W64.t Array5.t;
    var x:int;
    d <- witness;
    x <- 0;
    while ((x < 5)) {
      d.[x] <- c.[((x + 1) %% 5)];
      aux <@ __rol_u64_ref (d.[x], 1);
      d.[x] <- aux;
      d.[x] <- (d.[x] `^` c.[(((x - 1) + 5) %% 5)]);
      x <- (x + 1);
    }
    return d;
  }
  proc __rol_sum_ref (a:W64.t Array25.t, d:W64.t Array5.t, y:int) : W64.t Array5.t = {
    var aux:W64.t;
    var b:W64.t Array5.t;
    var x:int;
    var x_:int;
    var y_:int;
    var r:int;
    b <- witness;
    x <- 0;
    while ((x < 5)) {
      x_ <- ((x + (3 * y)) %% 5);
      y_ <- x;
      r <@ keccakf1600_rhotates (x_, y_);
      b.[x] <- a.[(x_ + (y_ * 5))];
      b.[x] <- (b.[x] `^` d.[x_]);
      aux <@ __rol_u64_ref (b.[x], r);
      b.[x] <- aux;
      x <- (x + 1);
    }
    return b;
  }
  proc __set_row_ref (e:W64.t Array25.t, b:W64.t Array5.t, y:int) : W64.t Array25.t = {
    var x:int;
    var x1:int;
    var x2:int;
    var t:W64.t;
    x <- 0;
    while ((x < 5)) {
      x1 <- ((x + 1) %% 5);
      x2 <- ((x + 2) %% 5);
      t <@ __andn_u64_ref (b.[x1], b.[x2]);
      t <- (t `^` b.[x]);
      e.[(x + (y * 5))] <- t;
      x <- (x + 1);
    }
    return e;
  }
  proc _pround_ref (e:W64.t Array25.t, a:W64.t Array25.t) : W64.t Array25.t = {
    var c:W64.t Array5.t;
    var d:W64.t Array5.t;
    var y:int;
    var b:W64.t Array5.t;
    b <- witness;
    c <- witness;
    d <- witness;
    c <@ __theta_sum_ref (a);
    d <@ __theta_rol_ref (c);
    y <- 0;
    while ((y < 5)) {
      b <@ __rol_sum_ref (a, d, y);
      e <@ __set_row_ref (e, b, y);
      y <- (y + 1);
    }
    return e;
  }
  proc __keccakf1600_ref (a:W64.t Array25.t) : W64.t Array25.t = {
    var s_e:W64.t Array25.t;
    var e:W64.t Array25.t;
    var rC:W64.t Array24.t;
    var rc:W64.t;
    var c:int;
    rC <- witness;
    e <- witness;
    s_e <- witness;
    e <- s_e;
    c <- 0;
    (* Erased call to spill *)
    e <@ _pround_ref (e, a);
    (a, e) <- (swap_ e a);
    rC <- kECCAK1600_RC;
    rc <- rC.[c];
    e.[0] <- (e.[0] `^` rc);
    a <@ _pround_ref (a, e);
    (a, e) <- (swap_ e a);
    rC <- kECCAK1600_RC;
    rc <- rC.[(c + 1)];
    a.[0] <- (a.[0] `^` rc);
    (* Erased call to unspill *)
    c <- (c + 2);
    while ((c < (24 - 1))) {
      (* Erased call to spill *)
      e <@ _pround_ref (e, a);
      (a, e) <- (swap_ e a);
      rC <- kECCAK1600_RC;
      rc <- rC.[c];
      e.[0] <- (e.[0] `^` rc);
      a <@ _pround_ref (a, e);
      (a, e) <- (swap_ e a);
      rC <- kECCAK1600_RC;
      rc <- rC.[(c + 1)];
      a.[0] <- (a.[0] `^` rc);
      (* Erased call to unspill *)
      c <- (c + 2);
    }
    return a;
  }
  proc _keccakf1600_ref (a:W64.t Array25.t) : W64.t Array25.t = {
    
    a <@ __keccakf1600_ref (a);
    return a;
  }
  proc __pround_basic_inlined (e:W64.t Array25.t, a:W64.t Array25.t) : 
  W64.t Array25.t = {
    var c679:W64.t Array5.t;
    var x682:W64.t;
    var t684:W64.t;
    var t685:W64.t;
    var d762:W64.t Array5.t;
    var x687:W64.t;
    var t689:W64.t;
    var t690:W64.t;
    var x692:W64.t;
    var t694:W64.t;
    var t695:W64.t;
    var x697:W64.t;
    var t699:W64.t;
    var t700:W64.t;
    var x702:W64.t;
    var t704:W64.t;
    var t705:W64.t;
    var t708:W64.t;
    var b0712:W64.t;
    var t715:W64.t;
    var x717:W64.t;
    var b1720:W64.t;
    var t723:W64.t;
    var x725:W64.t;
    var b2728:W64.t;
    var t731:W64.t;
    var x733:W64.t;
    var b3736:W64.t;
    var t739:W64.t;
    var x741:W64.t;
    var b4744:W64.t;
    var t745:W64.t;
    var t746:W64.t;
    var t747:W64.t;
    var t748:W64.t;
    var t749:W64.t;
    var t750:W64.t;
    var t751:W64.t;
    var t752:W64.t;
    var t753:W64.t;
    var t754:W64.t;
    var t755:W64.t;
    var t756:W64.t;
    var t757:W64.t;
    var t758:W64.t;
    var t759:W64.t;
    var t760:W64.t;
    var t763:W64.t;
    var x765:W64.t;
    var t767:W64.t;
    var t771:W64.t;
    var x773:W64.t;
    var b1776:W64.t;
    var t779:W64.t;
    var x781:W64.t;
    var b2784:W64.t;
    var t787:W64.t;
    var x789:W64.t;
    var b3792:W64.t;
    var t795:W64.t;
    var x797:W64.t;
    var b4800:W64.t;
    var t801:W64.t;
    var t802:W64.t;
    var t803:W64.t;
    var t804:W64.t;
    var t805:W64.t;
    var t806:W64.t;
    var t807:W64.t;
    var t808:W64.t;
    var t809:W64.t;
    var t810:W64.t;
    var t811:W64.t;
    var t812:W64.t;
    var t813:W64.t;
    var t814:W64.t;
    var t815:W64.t;
    var t816:W64.t;
    var t819:W64.t;
    var x821:W64.t;
    var b0824:W64.t;
    var t827:W64.t;
    var x829:W64.t;
    var b1832:W64.t;
    var t835:W64.t;
    var x837:W64.t;
    var b2840:W64.t;
    var t843:W64.t;
    var x845:W64.t;
    var b3848:W64.t;
    var t851:W64.t;
    var x853:W64.t;
    var b4856:W64.t;
    var t857:W64.t;
    var t858:W64.t;
    var t859:W64.t;
    var t860:W64.t;
    var t861:W64.t;
    var t862:W64.t;
    var t863:W64.t;
    var t864:W64.t;
    var t865:W64.t;
    var t866:W64.t;
    var u867:W64.t;
    var u868:W64.t;
    var t869:W64.t;
    var t870:W64.t;
    var t871:W64.t;
    var t872:W64.t;
    var t873:W64.t;
    var t874:W64.t;
    var t877:W64.t;
    var x879:W64.t;
    var b0882:W64.t;
    var t885:W64.t;
    var x887:W64.t;
    var b1890:W64.t;
    var t893:W64.t;
    var x895:W64.t;
    var b2898:W64.t;
    var t901:W64.t;
    var x903:W64.t;
    var b3906:W64.t;
    var t909:W64.t;
    var x911:W64.t;
    var b4914:W64.t;
    var t915:W64.t;
    var t916:W64.t;
    var t917:W64.t;
    var t918:W64.t;
    var t919:W64.t;
    var t920:W64.t;
    var t921:W64.t;
    var t922:W64.t;
    var t923:W64.t;
    var t924:W64.t;
    var u925:W64.t;
    var u926:W64.t;
    var t927:W64.t;
    var t928:W64.t;
    var t929:W64.t;
    var t930:W64.t;
    var t931:W64.t;
    var t932:W64.t;
    var t935:W64.t;
    var x937:W64.t;
    var b0940:W64.t;
    var t943:W64.t;
    var x945:W64.t;
    var b1948:W64.t;
    var t951:W64.t;
    var x953:W64.t;
    var b2956:W64.t;
    var t959:W64.t;
    var x961:W64.t;
    var b3964:W64.t;
    var t967:W64.t;
    var x969:W64.t;
    var b4972:W64.t;
    var t973:W64.t;
    var t974:W64.t;
    var t975:W64.t;
    var t976:W64.t;
    var u977:W64.t;
    var u978:W64.t;
    var t979:W64.t;
    var t980:W64.t;
    var t981:W64.t;
    var t982:W64.t;
    var t983:W64.t;
    var t984:W64.t;
    var t985:W64.t;
    var t986:W64.t;
    var t987:W64.t;
    var t988:W64.t;
    var t989:W64.t;
    var t990:W64.t;
    var  _0:bool;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    var  _6:bool;
    var  _7:bool;
    var  _8:bool;
    var  _9:bool;
    var  _10:bool;
    var  _11:bool;
    var  _12:bool;
    var  _13:bool;
    var  _14:bool;
    var  _15:bool;
    var  _16:bool;
    var  _17:bool;
    var  _18:bool;
    var  _19:bool;
    var  _20:bool;
    var  _21:bool;
    var  _22:bool;
    var  _23:bool;
    var  _24:bool;
    var  _25:bool;
    var  _26:bool;
    var  _27:bool;
    var  _28:bool;
    var  _29:bool;
    var  _30:bool;
    var  _31:bool;
    var  _32:bool;
    var  _33:bool;
    var  _34:bool;
    var  _35:bool;
    var  _36:bool;
    var  _37:bool;
    var  _38:bool;
    var  _39:bool;
    var  _40:bool;
    var  _41:bool;
    var  _42:bool;
    var  _43:bool;
    var  _44:bool;
    var  _45:bool;
    var  _46:bool;
    var  _47:bool;
    var  _48:bool;
    var  _49:bool;
    var  _50:bool;
    var  _51:bool;
    var  _52:bool;
    var  _53:bool;
    var  _54:bool;
    var  _55:bool;
    var  _56:bool;
    var  _57:bool;
    c679 <- witness;
    d762 <- witness;
    c679.[0] <- a.[0];
    c679.[1] <- a.[1];
    c679.[2] <- a.[2];
    c679.[3] <- a.[3];
    c679.[4] <- a.[4];
    c679.[0] <- (c679.[0] `^` a.[5]);
    c679.[1] <- (c679.[1] `^` a.[6]);
    c679.[2] <- (c679.[2] `^` a.[7]);
    c679.[3] <- (c679.[3] `^` a.[8]);
    c679.[4] <- (c679.[4] `^` a.[9]);
    c679.[0] <- (c679.[0] `^` a.[10]);
    c679.[1] <- (c679.[1] `^` a.[11]);
    c679.[2] <- (c679.[2] `^` a.[12]);
    c679.[3] <- (c679.[3] `^` a.[13]);
    c679.[4] <- (c679.[4] `^` a.[14]);
    c679.[0] <- (c679.[0] `^` a.[15]);
    c679.[1] <- (c679.[1] `^` a.[16]);
    c679.[2] <- (c679.[2] `^` a.[17]);
    c679.[3] <- (c679.[3] `^` a.[18]);
    c679.[4] <- (c679.[4] `^` a.[19]);
    c679.[0] <- (c679.[0] `^` a.[20]);
    c679.[1] <- (c679.[1] `^` a.[21]);
    c679.[2] <- (c679.[2] `^` a.[22]);
    c679.[3] <- (c679.[3] `^` a.[23]);
    c679.[4] <- (c679.[4] `^` a.[24]);
    x682 <- c679.[1];
    ( _0,  _1, t684) <- (ROL_64 x682 (W8.of_int 1));
    t685 <- (t684 `^` c679.[4]);
    d762.[0] <- t685;
    x687 <- c679.[2];
    ( _2,  _3, t689) <- (ROL_64 x687 (W8.of_int 1));
    t690 <- (t689 `^` c679.[0]);
    d762.[1] <- t690;
    x692 <- c679.[3];
    ( _4,  _5, t694) <- (ROL_64 x692 (W8.of_int 1));
    t695 <- (t694 `^` c679.[1]);
    d762.[2] <- t695;
    x697 <- c679.[4];
    ( _6,  _7, t699) <- (ROL_64 x697 (W8.of_int 1));
    t700 <- (t699 `^` c679.[2]);
    d762.[3] <- t700;
    x702 <- c679.[0];
    ( _8,  _9, t704) <- (ROL_64 x702 (W8.of_int 1));
    t705 <- (t704 `^` c679.[3]);
    d762.[4] <- t705;
    t708 <- a.[0];
    b0712 <- (t708 `^` d762.[0]);
    t715 <- a.[6];
    x717 <- (t715 `^` d762.[1]);
    ( _10,  _11, b1720) <- (ROL_64 x717 (W8.of_int 44));
    t723 <- a.[12];
    x725 <- (t723 `^` d762.[2]);
    ( _12,  _13, b2728) <- (ROL_64 x725 (W8.of_int 43));
    t731 <- a.[18];
    x733 <- (t731 `^` d762.[3]);
    ( _14,  _15, b3736) <- (ROL_64 x733 (W8.of_int 21));
    t739 <- a.[24];
    x741 <- (t739 `^` d762.[4]);
    ( _16,  _17, b4744) <- (ROL_64 x741 (W8.of_int 14));
    t745 <- b1720;
    t746 <- (t745 `|` b2728);
    t747 <- (t746 `^` b0712);
    e.[0] <- t747;
    t748 <- b2728;
    t749 <- (invw t748);
    t750 <- (t749 `|` b3736);
    t751 <- (t750 `^` b1720);
    e.[1] <- t751;
    t752 <- b3736;
    t753 <- (t752 `&` b4744);
    t754 <- (t753 `^` b2728);
    e.[2] <- t754;
    t755 <- b0712;
    t756 <- (t755 `|` b4744);
    t757 <- (t756 `^` b3736);
    e.[3] <- t757;
    t758 <- b0712;
    t759 <- (t758 `&` b1720);
    t760 <- (t759 `^` b4744);
    e.[4] <- t760;
    t763 <- a.[3];
    x765 <- (t763 `^` d762.[3]);
    ( _18,  _19, t767) <- (ROL_64 x765 (W8.of_int 28));
    t771 <- a.[9];
    x773 <- (t771 `^` d762.[4]);
    ( _20,  _21, b1776) <- (ROL_64 x773 (W8.of_int 20));
    t779 <- a.[10];
    x781 <- (t779 `^` d762.[0]);
    ( _22,  _23, b2784) <- (ROL_64 x781 (W8.of_int 3));
    t787 <- a.[16];
    x789 <- (t787 `^` d762.[1]);
    ( _24,  _25, b3792) <- (ROL_64 x789 (W8.of_int 45));
    t795 <- a.[22];
    x797 <- (t795 `^` d762.[2]);
    ( _26,  _27, b4800) <- (ROL_64 x797 (W8.of_int 61));
    t801 <- b1776;
    t802 <- (t801 `|` b2784);
    t803 <- (t802 `^` t767);
    e.[5] <- t803;
    t804 <- b2784;
    t805 <- (t804 `&` b3792);
    t806 <- (t805 `^` b1776);
    e.[6] <- t806;
    t807 <- b4800;
    t808 <- (invw t807);
    t809 <- (t808 `|` b3792);
    t810 <- (t809 `^` b2784);
    e.[7] <- t810;
    t811 <- t767;
    t812 <- (t811 `|` b4800);
    t813 <- (t812 `^` b3792);
    e.[8] <- t813;
    t814 <- t767;
    t815 <- (t814 `&` b1776);
    t816 <- (t815 `^` b4800);
    e.[9] <- t816;
    t819 <- a.[1];
    x821 <- (t819 `^` d762.[1]);
    ( _28,  _29, b0824) <- (ROL_64 x821 (W8.of_int 1));
    t827 <- a.[7];
    x829 <- (t827 `^` d762.[2]);
    ( _30,  _31, b1832) <- (ROL_64 x829 (W8.of_int 6));
    t835 <- a.[13];
    x837 <- (t835 `^` d762.[3]);
    ( _32,  _33, b2840) <- (ROL_64 x837 (W8.of_int 25));
    t843 <- a.[19];
    x845 <- (t843 `^` d762.[4]);
    ( _34,  _35, b3848) <- (ROL_64 x845 (W8.of_int 8));
    t851 <- a.[20];
    x853 <- (t851 `^` d762.[0]);
    ( _36,  _37, b4856) <- (ROL_64 x853 (W8.of_int 18));
    t857 <- b1832;
    t858 <- (t857 `|` b2840);
    t859 <- (t858 `^` b0824);
    e.[10] <- t859;
    t860 <- b2840;
    t861 <- (t860 `&` b3848);
    t862 <- (t861 `^` b1832);
    e.[11] <- t862;
    t863 <- b3848;
    t864 <- (invw t863);
    t865 <- (t864 `&` b4856);
    t866 <- (t865 `^` b2840);
    e.[12] <- t866;
    u867 <- b0824;
    u868 <- (u867 `|` b4856);
    t869 <- b3848;
    t870 <- (invw t869);
    t871 <- (t870 `^` u868);
    e.[13] <- t871;
    t872 <- b0824;
    t873 <- (t872 `&` b1832);
    t874 <- (t873 `^` b4856);
    e.[14] <- t874;
    t877 <- a.[4];
    x879 <- (t877 `^` d762.[4]);
    ( _38,  _39, b0882) <- (ROL_64 x879 (W8.of_int 27));
    t885 <- a.[5];
    x887 <- (t885 `^` d762.[0]);
    ( _40,  _41, b1890) <- (ROL_64 x887 (W8.of_int 36));
    t893 <- a.[11];
    x895 <- (t893 `^` d762.[1]);
    ( _42,  _43, b2898) <- (ROL_64 x895 (W8.of_int 10));
    t901 <- a.[17];
    x903 <- (t901 `^` d762.[2]);
    ( _44,  _45, b3906) <- (ROL_64 x903 (W8.of_int 15));
    t909 <- a.[23];
    x911 <- (t909 `^` d762.[3]);
    ( _46,  _47, b4914) <- (ROL_64 x911 (W8.of_int 56));
    t915 <- b1890;
    t916 <- (t915 `&` b2898);
    t917 <- (t916 `^` b0882);
    e.[15] <- t917;
    t918 <- b2898;
    t919 <- (t918 `|` b3906);
    t920 <- (t919 `^` b1890);
    e.[16] <- t920;
    t921 <- b3906;
    t922 <- (invw t921);
    t923 <- (t922 `|` b4914);
    t924 <- (t923 `^` b2898);
    e.[17] <- t924;
    u925 <- b0882;
    u926 <- (u925 `&` b4914);
    t927 <- b3906;
    t928 <- (invw t927);
    t929 <- (t928 `^` u926);
    e.[18] <- t929;
    t930 <- b0882;
    t931 <- (t930 `|` b1890);
    t932 <- (t931 `^` b4914);
    e.[19] <- t932;
    t935 <- a.[2];
    x937 <- (t935 `^` d762.[2]);
    ( _48,  _49, b0940) <- (ROL_64 x937 (W8.of_int 62));
    t943 <- a.[8];
    x945 <- (t943 `^` d762.[3]);
    ( _50,  _51, b1948) <- (ROL_64 x945 (W8.of_int 55));
    t951 <- a.[14];
    x953 <- (t951 `^` d762.[4]);
    ( _52,  _53, b2956) <- (ROL_64 x953 (W8.of_int 39));
    t959 <- a.[15];
    x961 <- (t959 `^` d762.[0]);
    ( _54,  _55, b3964) <- (ROL_64 x961 (W8.of_int 41));
    t967 <- a.[21];
    x969 <- (t967 `^` d762.[1]);
    ( _56,  _57, b4972) <- (ROL_64 x969 (W8.of_int 2));
    t973 <- b1948;
    t974 <- (invw t973);
    t975 <- (t974 `&` b2956);
    t976 <- (t975 `^` b0940);
    e.[20] <- t976;
    u977 <- b2956;
    u978 <- (u977 `|` b3964);
    t979 <- b1948;
    t980 <- (invw t979);
    t981 <- (t980 `^` u978);
    e.[21] <- t981;
    t982 <- b3964;
    t983 <- (t982 `&` b4972);
    t984 <- (t983 `^` b2956);
    e.[22] <- t984;
    t985 <- b0940;
    t986 <- (t985 `|` b4972);
    t987 <- (t986 `^` b3964);
    e.[23] <- t987;
    t988 <- b0940;
    t989 <- (t988 `&` b1948);
    t990 <- (t989 `^` b4972);
    e.[24] <- t990;
    return e;
  }
  proc __not_lane_basic (st:W64.t Array25.t, idx:int) : W64.t Array25.t = {
    var t:W64.t;
    t <- st.[idx];
    t <- (invw t);
    st.[idx] <- t;
    return st;
  }
  proc __complement_lanes_basic (st:W64.t Array25.t) : W64.t Array25.t = {
    
    st <@ __not_lane_basic (st, 1);
    st <@ __not_lane_basic (st, 2);
    st <@ __not_lane_basic (st, 8);
    st <@ __not_lane_basic (st, 12);
    st <@ __not_lane_basic (st, 17);
    st <@ __not_lane_basic (st, 20);
    return st;
  }
  proc __keccakf1600_basic (a:W64.t Array25.t) : W64.t Array25.t = {
    var s_e:W64.t Array25.t;
    var e:W64.t Array25.t;
    var rC:W64.t Array24.t;
    var rc:W64.t;
    var c:int;
    rC <- witness;
    e <- witness;
    s_e <- witness;
    a <@ __complement_lanes_basic (a);
    e <- s_e;
    c <- 0;
    (* Erased call to spill *)
    e <@ __pround_basic_inlined (e, a);
    (a, e) <- (swap_ e a);
    rC <- kECCAK1600_RC;
    rc <- rC.[c];
    e.[0] <- (e.[0] `^` rc);
    a <@ __pround_basic_inlined (a, e);
    (a, e) <- (swap_ e a);
    rC <- kECCAK1600_RC;
    rc <- rC.[(c + 1)];
    a.[0] <- (a.[0] `^` rc);
    (* Erased call to unspill *)
    c <- (c + 2);
    while ((c < (24 - 1))) {
      (* Erased call to spill *)
      e <@ __pround_basic_inlined (e, a);
      (a, e) <- (swap_ e a);
      rC <- kECCAK1600_RC;
      rc <- rC.[c];
      e.[0] <- (e.[0] `^` rc);
      a <@ __pround_basic_inlined (a, e);
      (a, e) <- (swap_ e a);
      rC <- kECCAK1600_RC;
      rc <- rC.[(c + 1)];
      a.[0] <- (a.[0] `^` rc);
      (* Erased call to unspill *)
      c <- (c + 2);
    }
    a <@ __complement_lanes_basic (a);
    return a;
  }
  proc _keccakf1600_basic (a:W64.t Array25.t) : W64.t Array25.t = {
    
    a <@ __keccakf1600_basic (a);
    return a;
  }
  proc keccakf1600_opt_loop_body (rax:W64.t, rbp:W64.t, rdi:W64.t, r13:W64.t,
                                  r10:W64.t, r11:W64.t, r8:W64.t, rsi:W64.t,
                                  r15:W64.t, rbx:W64.t, a:W64.t Array25.t,
                                  e:W64.t Array25.t) : W64.t * W64.t *
                                                       W64.t * W64.t *
                                                       W64.t * W64.t *
                                                       W64.t * W64.t *
                                                       W64.t * W64.t *
                                                       W64.t Array25.t *
                                                       W64.t Array25.t = {
    var cnt:W64.t;
    var rcx:W64.t;
    var rdx:W64.t;
    var r9:W64.t;
    var r12:W64.t;
    var r14:W64.t;
    var rC:W64.t Array24.t;
    rC <- witness;
    e.[0] <- r11;
    e.[1] <- rdi;
    cnt <- rax;
    e.[2] <- rsi;
    rcx <- a.[15];
    rcx <- (rcx `^` r8);
    rax <- rdi;
    rax <- (rax `^` a.[5]);
    rax <- (rax `^` rcx);
    rdx <- a.[16];
    rdx <- (rdx `^` rsi);
    rcx <- a.[11];
    rsi <- a.[6];
    rcx <- (rcx `^` rsi);
    rcx <- (rcx `^` rdx);
    rdx <- a.[17];
    rdx <- (rdx `^` r15);
    r9 <- r13;
    r9 <- (r9 `^` a.[7]);
    r9 <- (r9 `^` rdx);
    rdx <- r10;
    rdx <- (rdx `^` a.[23]);
    r12 <- a.[13];
    r12 <- (r12 `^` a.[8]);
    r12 <- (r12 `^` rdx);
    rdx <- r11;
    rdx <- (rdx `^` rbx);
    r14 <- a.[14];
    r14 <- (r14 `^` a.[9]);
    r14 <- (r14 `^` rdx);
    rax <- (rax `^` rbp);
    rcx <- (rcx `^` a.[1]);
    r9 <- (r9 `^` a.[2]);
    rdi <- a.[3];
    r12 <- (r12 `^` rdi);
    r14 <- (r14 `^` a.[4]);
    rdx <- (RORX_64 r12 (W8.of_int 63));
    rdx <- (rdx `^` rcx);
    e.[10] <- rdx;
    r11 <- (RORX_64 rcx (W8.of_int 63));
    r11 <- (r11 `^` r14);
    e.[9] <- r11;
    rcx <- (RORX_64 r14 (W8.of_int 63));
    rcx <- (rcx `^` r9);
    r9 <- (RORX_64 r9 (W8.of_int 63));
    r9 <- (r9 `^` rax);
    rax <- (RORX_64 rax (W8.of_int 63));
    rax <- (rax `^` r12);
    rbp <- (rbp `^` r11);
    rsi <- (rsi `^` r9);
    r11 <- r9;
    r9 <- (RORX_64 rsi (W8.of_int 20));
    r13 <- (r13 `^` rdx);
    r14 <- (RORX_64 r13 (W8.of_int 21));
    r10 <- (r10 `^` rcx);
    r10 <- (RORX_64 r10 (W8.of_int 43));
    rbx <- (rbx `^` rax);
    rbx <- (RORX_64 rbx (W8.of_int 50));
    rsi <- ((invw rbx) `&` rbp);
    rsi <- (rsi `^` r10);
    a.[6] <- rsi;
    rsi <- ((invw r14) `&` r10);
    r10 <- ((invw r10) `&` rbx);
    r10 <- (r10 `^` r14);
    e.[8] <- r10;
    r12 <- ((invw r9) `&` r14);
    rC <- kECCAK1600_RC;
    r14 <- cnt;
    r12 <- (r12 `^` rC.[(W64.to_uint (r14 + (W64.of_int 2)))]);
    r12 <- (r12 `^` rbp);
    rsi <- (rsi `^` r9);
    e.[6] <- rsi;
    r9 <- ((invw rbp) `&` r9);
    r9 <- (r9 `^` rbx);
    e.[7] <- r9;
    rdi <- (rdi `^` rcx);
    rdx <- rcx;
    r9 <- (RORX_64 rdi (W8.of_int 36));
    rsi <- a.[9];
    rsi <- (rsi `^` rax);
    r10 <- (RORX_64 rsi (W8.of_int 44));
    rsi <- e.[1];
    r13 <- e.[9];
    rsi <- (rsi `^` r13);
    rsi <- (RORX_64 rsi (W8.of_int 61));
    rdi <- a.[16];
    rcx <- r11;
    rdi <- (rdi `^` r11);
    rdi <- (RORX_64 rdi (W8.of_int 19));
    rbp <- e.[10];
    r15 <- (r15 `^` rbp);
    rbx <- (RORX_64 r15 (W8.of_int 3));
    r15 <- ((invw rbx) `&` r9);
    r15 <- (r15 `^` rdi);
    e.[1] <- r15;
    r15 <- ((invw rsi) `&` rdi);
    rdi <- ((invw rdi) `&` rbx);
    rdi <- (rdi `^` rsi);
    e.[5] <- rdi;
    rsi <- ((invw r10) `&` rsi);
    rsi <- (rsi `^` r9);
    a.[16] <- rsi;
    r15 <- (r15 `^` r10);
    a.[3] <- r15;
    rsi <- ((invw r9) `&` r10);
    rsi <- (rsi `^` rbx);
    a.[9] <- rsi;
    rsi <- a.[1];
    rsi <- (rsi `^` r11);
    rsi <- (RORX_64 rsi (W8.of_int 63));
    rdi <- a.[7];
    rdi <- (rdi `^` rbp);
    rdi <- (RORX_64 rdi (W8.of_int 58));
    r9 <- a.[13];
    r9 <- (r9 `^` rdx);
    r9 <- (RORX_64 r9 (W8.of_int 39));
    r10 <- e.[0];
    r10 <- (r10 `^` rax);
    r10 <- (RORX_64 r10 (W8.of_int 56));
    r14 <- r13;
    r8 <- (r8 `^` r13);
    r8 <- (RORX_64 r8 (W8.of_int 46));
    r11 <- ((invw r8) `&` rsi);
    r11 <- (r11 `^` r10);
    a.[13] <- r11;
    r11 <- ((invw r9) `&` r10);
    r13 <- ((invw r10) `&` r8);
    r13 <- (r13 `^` r9);
    r9 <- ((invw rdi) `&` r9);
    r9 <- (r9 `^` rsi);
    a.[7] <- r9;
    r11 <- (r11 `^` rdi);
    e.[4] <- r11;
    rsi <- ((invw rsi) `&` rdi);
    rsi <- (rsi `^` r8);
    e.[0] <- rsi;
    rsi <- a.[4];
    rsi <- (rsi `^` rax);
    rsi <- (RORX_64 rsi (W8.of_int 37));
    rdi <- a.[5];
    rdi <- (rdi `^` r14);
    rdi <- (RORX_64 rdi (W8.of_int 28));
    r8 <- a.[11];
    r8 <- (r8 `^` rcx);
    r8 <- (RORX_64 r8 (W8.of_int 54));
    r9 <- a.[17];
    r9 <- (r9 `^` rbp);
    r11 <- (RORX_64 r9 (W8.of_int 49));
    r9 <- a.[23];
    r9 <- (r9 `^` rdx);
    rbx <- (RORX_64 r9 (W8.of_int 8));
    r10 <- ((invw rbx) `&` rsi);
    r10 <- (r10 `^` r11);
    r15 <- ((invw r8) `&` r11);
    r11 <- ((invw r11) `&` rbx);
    r11 <- (r11 `^` r8);
    a.[17] <- r11;
    r8 <- ((invw rdi) `&` r8);
    r8 <- (r8 `^` rsi);
    a.[23] <- r8;
    r15 <- (r15 `^` rdi);
    a.[5] <- r15;
    rsi <- ((invw rsi) `&` rdi);
    rsi <- (rsi `^` rbx);
    a.[11] <- rsi;
    rsi <- rbp;
    rsi <- (rsi `^` a.[2]);
    rdx <- (rdx `^` a.[8]);
    rax <- (rax `^` a.[14]);
    rdi <- r14;
    rdi <- (rdi `^` a.[15]);
    rcx <- (rcx `^` e.[2]);
    rsi <- (RORX_64 rsi (W8.of_int 2));
    rdx <- (RORX_64 rdx (W8.of_int 9));
    rax <- (RORX_64 rax (W8.of_int 25));
    rdi <- (RORX_64 rdi (W8.of_int 23));
    rcx <- (RORX_64 rcx (W8.of_int 62));
    r9 <- ((invw rcx) `&` rsi);
    r9 <- (r9 `^` rdi);
    a.[15] <- r9;
    r14 <- ((invw rax) `&` rdi);
    r11 <- ((invw rdi) `&` rcx);
    r11 <- (r11 `^` rax);
    rax <- ((invw rdx) `&` rax);
    rax <- (rax `^` rsi);
    rbp <- rax;
    a.[14] <- rax;
    r14 <- (r14 `^` rdx);
    e.[2] <- r14;
    rdi <- ((invw rsi) `&` rdx);
    rdi <- (rdi `^` rcx);
    rax <- r8;
    rax <- (rax `^` a.[7]);
    rsi <- a.[16];
    rsi <- (rsi `^` rbp);
    rsi <- (rsi `^` rax);
    rbp <- a.[3];
    rax <- rbp;
    rax <- (rax `^` e.[6]);
    rdx <- r15;
    rdx <- (rdx `^` e.[4]);
    rdx <- (rdx `^` rax);
    rax <- e.[5];
    rax <- (rax `^` a.[17]);
    r8 <- r11;
    r8 <- (r8 `^` e.[8]);
    r8 <- (r8 `^` rax);
    rbx <- a.[13];
    rbx <- (rbx `^` e.[1]);
    rcx <- r9;
    rcx <- (rcx `^` a.[6]);
    rcx <- (rcx `^` rbx);
    rbx <- e.[7];
    rbx <- (rbx `^` rdi);
    rax <- e.[0];
    rax <- (rax `^` a.[9]);
    rax <- (rax `^` rbx);
    rsi <- (rsi `^` r12);
    rdx <- (rdx `^` r14);
    r8 <- (r8 `^` r13);
    rcx <- (rcx `^` r10);
    r14 <- a.[11];
    rax <- (rax `^` r14);
    r15 <- (RORX_64 rcx (W8.of_int 63));
    r15 <- (r15 `^` rdx);
    rbx <- (RORX_64 rdx (W8.of_int 63));
    rbx <- (rbx `^` rax);
    r9 <- (RORX_64 rax (W8.of_int 63));
    r9 <- (r9 `^` r8);
    r8 <- (RORX_64 r8 (W8.of_int 63));
    r8 <- (r8 `^` rsi);
    rdx <- (RORX_64 rsi (W8.of_int 63));
    rdx <- (rdx `^` rcx);
    r12 <- (r12 `^` rbx);
    rbp <- (rbp `^` r8);
    rax <- (RORX_64 rbp (W8.of_int 20));
    r13 <- (r13 `^` r15);
    rcx <- (RORX_64 r13 (W8.of_int 21));
    r10 <- (r10 `^` r9);
    rsi <- (RORX_64 r10 (W8.of_int 43));
    rdi <- (rdi `^` rdx);
    rdi <- (RORX_64 rdi (W8.of_int 50));
    r10 <- ((invw rdi) `&` r12);
    r10 <- (r10 `^` rsi);
    a.[3] <- r10;
    r10 <- ((invw rcx) `&` rsi);
    rsi <- ((invw rsi) `&` rdi);
    rsi <- (rsi `^` rcx);
    a.[2] <- rsi;
    rbp <- ((invw rax) `&` rcx);
    rcx <- cnt;
    rC <- kECCAK1600_RC;
    rbp <- (rbp `^` rC.[(W64.to_uint (rcx + (W64.of_int 3)))]);
    rbp <- (rbp `^` r12);
    e.[9] <- rbp;
    r10 <- (r10 `^` rax);
    a.[1] <- r10;
    rax <- ((invw r12) `&` rax);
    rax <- (rax `^` rdi);
    a.[4] <- rax;
    rax <- a.[6];
    rax <- (rax `^` r9);
    rax <- (RORX_64 rax (W8.of_int 36));
    rcx <- a.[9];
    rcx <- (rcx `^` rdx);
    rcx <- (RORX_64 rcx (W8.of_int 44));
    rsi <- a.[7];
    rsi <- (rsi `^` rbx);
    rsi <- (RORX_64 rsi (W8.of_int 61));
    rdi <- a.[5];
    rdi <- (rdi `^` r8);
    rdi <- (RORX_64 rdi (W8.of_int 19));
    r11 <- (r11 `^` r15);
    r10 <- (RORX_64 r11 (W8.of_int 3));
    r11 <- ((invw r10) `&` rax);
    r11 <- (r11 `^` rdi);
    a.[8] <- r11;
    r11 <- ((invw rsi) `&` rdi);
    rdi <- ((invw rdi) `&` r10);
    rdi <- (rdi `^` rsi);
    a.[7] <- rdi;
    rsi <- ((invw rcx) `&` rsi);
    rsi <- (rsi `^` rax);
    a.[5] <- rsi;
    r11 <- (r11 `^` rcx);
    a.[6] <- r11;
    rax <- ((invw rax) `&` rcx);
    rax <- (rax `^` r10);
    a.[9] <- rax;
    rax <- e.[6];
    rax <- (rax `^` r8);
    rax <- (RORX_64 rax (W8.of_int 63));
    rcx <- e.[5];
    rcx <- (rcx `^` r15);
    rcx <- (RORX_64 rcx (W8.of_int 58));
    rsi <- a.[13];
    rsi <- (rsi `^` r9);
    rsi <- (RORX_64 rsi (W8.of_int 39));
    rdi <- r14;
    rdi <- (rdi `^` rdx);
    rdi <- (RORX_64 rdi (W8.of_int 56));
    r10 <- a.[14];
    r10 <- (r10 `^` rbx);
    r10 <- (RORX_64 r10 (W8.of_int 46));
    r11 <- ((invw r10) `&` rax);
    r11 <- (r11 `^` rdi);
    a.[13] <- r11;
    r11 <- ((invw rsi) `&` rdi);
    r13 <- ((invw rdi) `&` r10);
    r13 <- (r13 `^` rsi);
    rdi <- ((invw rcx) `&` rsi);
    rdi <- (rdi `^` rax);
    r11 <- (r11 `^` rcx);
    a.[11] <- r11;
    rax <- ((invw rax) `&` rcx);
    rax <- (rax `^` r10);
    a.[14] <- rax;
    rax <- e.[7];
    rax <- (rax `^` rdx);
    rax <- (RORX_64 rax (W8.of_int 37));
    rcx <- a.[16];
    rcx <- (rcx `^` rbx);
    rcx <- (RORX_64 rcx (W8.of_int 28));
    rsi <- e.[4];
    rsi <- (rsi `^` r8);
    r11 <- (RORX_64 rsi (W8.of_int 54));
    rsi <- a.[17];
    rsi <- (rsi `^` r15);
    r14 <- (RORX_64 rsi (W8.of_int 49));
    rsi <- a.[15];
    rsi <- (rsi `^` r9);
    r12 <- (RORX_64 rsi (W8.of_int 8));
    r10 <- ((invw r12) `&` rax);
    r10 <- (r10 `^` r14);
    rsi <- ((invw r11) `&` r14);
    r14 <- ((invw r14) `&` r12);
    r14 <- (r14 `^` r11);
    a.[17] <- r14;
    r11 <- ((invw rcx) `&` r11);
    r11 <- (r11 `^` rax);
    a.[15] <- r11;
    rsi <- (rsi `^` rcx);
    a.[16] <- rsi;
    r11 <- ((invw rax) `&` rcx);
    r11 <- (r11 `^` r12);
    r15 <- (r15 `^` e.[8]);
    r9 <- (r9 `^` e.[1]);
    rdx <- (rdx `^` e.[0]);
    rbx <- (rbx `^` a.[23]);
    r8 <- (r8 `^` e.[2]);
    rax <- (RORX_64 r15 (W8.of_int 2));
    rcx <- (RORX_64 r9 (W8.of_int 9));
    rdx <- (RORX_64 rdx (W8.of_int 25));
    r9 <- (RORX_64 rbx (W8.of_int 23));
    r14 <- (RORX_64 r8 (W8.of_int 62));
    r8 <- ((invw r14) `&` rax);
    r8 <- (r8 `^` r9);
    a.[23] <- r8;
    rsi <- ((invw rdx) `&` r9);
    r15 <- ((invw r9) `&` r14);
    r15 <- (r15 `^` rdx);
    r8 <- ((invw rcx) `&` rdx);
    r8 <- (r8 `^` rax);
    rsi <- (rsi `^` rcx);
    rbx <- ((invw rax) `&` rcx);
    rbx <- (rbx `^` r14);
    rcx <- cnt;
    rcx <- (rcx + (W64.of_int 2));
    rax <- rcx;
    rbp <- e.[9];
    return (rax, rbp, rdi, r13, r10, r11, r8, rsi, r15, rbx, a, e);
  }
  proc __keccakf1600_opt (a:W64.t Array25.t) : W64.t Array25.t = {
    var rax:W64.t;
    var rbp:W64.t;
    var rdi:W64.t;
    var r13:W64.t;
    var r10:W64.t;
    var r11:W64.t;
    var r8:W64.t;
    var rsi:W64.t;
    var r15:W64.t;
    var rbx:W64.t;
    var e:W64.t Array25.t;
    e <- witness;
    rax <- (W64.of_int 0);
    rax <- (rax - (W64.of_int 2));
    rbp <- a.[0];
    rdi <- a.[10];
    r13 <- a.[12];
    r10 <- a.[18];
    r11 <- a.[19];
    r8 <- a.[20];
    rsi <- a.[21];
    r15 <- a.[22];
    rbx <- a.[24];
    (rax, rbp, rdi, r13, r10, r11, r8, rsi, r15, rbx, a, e) <@ keccakf1600_opt_loop_body (
    rax, rbp, rdi, r13, r10, r11, r8, rsi, r15, rbx, a, e);
    while ((rax \ult (W64.of_int 22))) {
      (rax, rbp, rdi, r13, r10, r11, r8, rsi, r15, rbx, a, e) <@ keccakf1600_opt_loop_body (
      rax, rbp, rdi, r13, r10, r11, r8, rsi, r15, rbx, a, e);
    }
    a.[0] <- rbp;
    a.[10] <- rdi;
    a.[12] <- r13;
    a.[18] <- r10;
    a.[19] <- r11;
    a.[20] <- r8;
    a.[21] <- rsi;
    a.[22] <- r15;
    a.[24] <- rbx;
    return a;
  }
  proc _keccakf1600_opt (a:W64.t Array25.t) : W64.t Array25.t = {
    
    a <@ __keccakf1600_opt (a);
    return a;
  }
  proc __keccakf1600_pround_avx2 (state:W256.t Array7.t) : W256.t Array7.t = {
    var c00:W256.t;
    var c14:W256.t;
    var t2:W256.t;
    var t4:W256.t;
    var t0:W256.t;
    var t1:W256.t;
    var d14:W256.t;
    var d00:W256.t;
    var t3:W256.t;
    var t5:W256.t;
    var t6:W256.t;
    var t7:W256.t;
    var t8:W256.t;
    c00 <-
    (VPSHUFD_256 state.[2]
    (W8.of_int
    ((2 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((3 %% (2 ^ 2)) + ((2 ^ 2) * ((0 %% (2 ^ 2)) + ((2 ^ 2) * 1))))))));
    c14 <- (state.[5] `^` state.[3]);
    t2 <- (state.[4] `^` state.[6]);
    c14 <- (c14 `^` state.[1]);
    c14 <- (c14 `^` t2);
    t4 <-
    (VPERMQ c14
    (W8.of_int
    ((3 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((0 %% (2 ^ 2)) + ((2 ^ 2) * ((1 %% (2 ^ 2)) + ((2 ^ 2) * 2))))))));
    c00 <- (c00 `^` state.[2]);
    t0 <-
    (VPERMQ c00
    (W8.of_int
    ((2 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((3 %% (2 ^ 2)) + ((2 ^ 2) * ((0 %% (2 ^ 2)) + ((2 ^ 2) * 1))))))));
    t1 <- (c14 \vshr64u256 (W128.of_int 63));
    t2 <- (c14 \vadd64u256 c14);
    t1 <- (t1 `|` t2);
    d14 <-
    (VPERMQ t1
    (W8.of_int
    ((1 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((2 %% (2 ^ 2)) + ((2 ^ 2) * ((3 %% (2 ^ 2)) + ((2 ^ 2) * 0))))))));
    d00 <- (t1 `^` t4);
    d00 <-
    (VPERMQ d00
    (W8.of_int
    ((0 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((0 %% (2 ^ 2)) + ((2 ^ 2) * ((0 %% (2 ^ 2)) + ((2 ^ 2) * 0))))))));
    c00 <- (c00 `^` state.[0]);
    c00 <- (c00 `^` t0);
    t0 <- (c00 \vshr64u256 (W128.of_int 63));
    t1 <- (c00 \vadd64u256 c00);
    t1 <- (t1 `|` t0);
    state.[2] <- (state.[2] `^` d00);
    state.[0] <- (state.[0] `^` d00);
    d14 <-
    (VPBLEND_8u32 d14 t1
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t4 <-
    (VPBLEND_8u32 t4 c00
    (W8.of_int
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    d14 <- (d14 `^` t4);
    t3 <- (VPSLLV_4u64 state.[2] kECCAK_RHOTATES_LEFT.[0]);
    state.[2] <- (VPSRLV_4u64 state.[2] kECCAK_RHOTATES_RIGHT.[0]);
    state.[2] <- (state.[2] `|` t3);
    state.[3] <- (state.[3] `^` d14);
    t4 <- (VPSLLV_4u64 state.[3] kECCAK_RHOTATES_LEFT.[2]);
    state.[3] <- (VPSRLV_4u64 state.[3] kECCAK_RHOTATES_RIGHT.[2]);
    state.[3] <- (state.[3] `|` t4);
    state.[4] <- (state.[4] `^` d14);
    t5 <- (VPSLLV_4u64 state.[4] kECCAK_RHOTATES_LEFT.[3]);
    state.[4] <- (VPSRLV_4u64 state.[4] kECCAK_RHOTATES_RIGHT.[3]);
    state.[4] <- (state.[4] `|` t5);
    state.[5] <- (state.[5] `^` d14);
    t6 <- (VPSLLV_4u64 state.[5] kECCAK_RHOTATES_LEFT.[4]);
    state.[5] <- (VPSRLV_4u64 state.[5] kECCAK_RHOTATES_RIGHT.[4]);
    state.[5] <- (state.[5] `|` t6);
    state.[6] <- (state.[6] `^` d14);
    t3 <-
    (VPERMQ state.[2]
    (W8.of_int
    ((1 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((3 %% (2 ^ 2)) + ((2 ^ 2) * ((0 %% (2 ^ 2)) + ((2 ^ 2) * 2))))))));
    t4 <-
    (VPERMQ state.[3]
    (W8.of_int
    ((1 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((3 %% (2 ^ 2)) + ((2 ^ 2) * ((0 %% (2 ^ 2)) + ((2 ^ 2) * 2))))))));
    t7 <- (VPSLLV_4u64 state.[6] kECCAK_RHOTATES_LEFT.[5]);
    t1 <- (VPSRLV_4u64 state.[6] kECCAK_RHOTATES_RIGHT.[5]);
    t1 <- (t1 `|` t7);
    state.[1] <- (state.[1] `^` d14);
    t5 <-
    (VPERMQ state.[4]
    (W8.of_int
    ((3 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((2 %% (2 ^ 2)) + ((2 ^ 2) * ((1 %% (2 ^ 2)) + ((2 ^ 2) * 0))))))));
    t6 <-
    (VPERMQ state.[5]
    (W8.of_int
    ((2 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((0 %% (2 ^ 2)) + ((2 ^ 2) * ((3 %% (2 ^ 2)) + ((2 ^ 2) * 1))))))));
    t8 <- (VPSLLV_4u64 state.[1] kECCAK_RHOTATES_LEFT.[1]);
    t2 <- (VPSRLV_4u64 state.[1] kECCAK_RHOTATES_RIGHT.[1]);
    t2 <- (t2 `|` t8);
    t7 <- (VPSRLDQ_256 t1 (W8.of_int 8));
    t0 <- ((invw t1) `&` t7);
    state.[3] <-
    (VPBLEND_8u32 t2 t6
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    t8 <-
    (VPBLEND_8u32 t4 t2
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    state.[5] <-
    (VPBLEND_8u32 t3 t4
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    t7 <-
    (VPBLEND_8u32 t2 t3
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    state.[3] <-
    (VPBLEND_8u32 state.[3] t4
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    t8 <-
    (VPBLEND_8u32 t8 t5
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    state.[5] <-
    (VPBLEND_8u32 state.[5] t2
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    t7 <-
    (VPBLEND_8u32 t7 t6
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    state.[3] <-
    (VPBLEND_8u32 state.[3] t5
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t8 <-
    (VPBLEND_8u32 t8 t6
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    state.[5] <-
    (VPBLEND_8u32 state.[5] t6
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t7 <-
    (VPBLEND_8u32 t7 t4
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    state.[3] <- ((invw state.[3]) `&` t8);
    state.[5] <- ((invw state.[5]) `&` t7);
    state.[6] <-
    (VPBLEND_8u32 t5 t2
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    t8 <-
    (VPBLEND_8u32 t3 t5
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    state.[3] <- (state.[3] `^` t3);
    state.[6] <-
    (VPBLEND_8u32 state.[6] t3
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    t8 <-
    (VPBLEND_8u32 t8 t4
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    state.[5] <- (state.[5] `^` t5);
    state.[6] <-
    (VPBLEND_8u32 state.[6] t4
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t8 <-
    (VPBLEND_8u32 t8 t2
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    state.[6] <- ((invw state.[6]) `&` t8);
    state.[6] <- (state.[6] `^` t6);
    state.[4] <-
    (VPERMQ t1
    (W8.of_int
    ((2 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((3 %% (2 ^ 2)) + ((2 ^ 2) * ((1 %% (2 ^ 2)) + ((2 ^ 2) * 0))))))));
    t8 <-
    (VPBLEND_8u32 state.[4] state.[0]
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    state.[1] <-
    (VPERMQ t1
    (W8.of_int
    ((1 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((2 %% (2 ^ 2)) + ((2 ^ 2) * ((3 %% (2 ^ 2)) + ((2 ^ 2) * 0))))))));
    state.[1] <-
    (VPBLEND_8u32 state.[1] state.[0]
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    state.[1] <- ((invw state.[1]) `&` t8);
    state.[2] <-
    (VPBLEND_8u32 t4 t5
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    t7 <-
    (VPBLEND_8u32 t6 t4
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    state.[2] <-
    (VPBLEND_8u32 state.[2] t6
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    t7 <-
    (VPBLEND_8u32 t7 t3
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    state.[2] <-
    (VPBLEND_8u32 state.[2] t3
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t7 <-
    (VPBLEND_8u32 t7 t5
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    state.[2] <- ((invw state.[2]) `&` t7);
    state.[2] <- (state.[2] `^` t2);
    t0 <-
    (VPERMQ t0
    (W8.of_int
    ((0 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((0 %% (2 ^ 2)) + ((2 ^ 2) * ((0 %% (2 ^ 2)) + ((2 ^ 2) * 0))))))));
    state.[3] <-
    (VPERMQ state.[3]
    (W8.of_int
    ((3 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((2 %% (2 ^ 2)) + ((2 ^ 2) * ((1 %% (2 ^ 2)) + ((2 ^ 2) * 0))))))));
    state.[5] <-
    (VPERMQ state.[5]
    (W8.of_int
    ((1 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((3 %% (2 ^ 2)) + ((2 ^ 2) * ((0 %% (2 ^ 2)) + ((2 ^ 2) * 2))))))));
    state.[6] <-
    (VPERMQ state.[6]
    (W8.of_int
    ((2 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((0 %% (2 ^ 2)) + ((2 ^ 2) * ((3 %% (2 ^ 2)) + ((2 ^ 2) * 1))))))));
    state.[4] <-
    (VPBLEND_8u32 t6 t3
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    t7 <-
    (VPBLEND_8u32 t5 t6
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    state.[4] <-
    (VPBLEND_8u32 state.[4] t5
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    t7 <-
    (VPBLEND_8u32 t7 t2
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((0 %% (2 ^ 1)) + ((2 ^ 1) * 0))))))))))))))
    ));
    state.[4] <-
    (VPBLEND_8u32 state.[4] t2
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t7 <-
    (VPBLEND_8u32 t7 t3
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    state.[4] <- ((invw state.[4]) `&` t7);
    state.[0] <- (state.[0] `^` t0);
    state.[1] <- (state.[1] `^` t1);
    state.[4] <- (state.[4] `^` t4);
    return state;
  }
  proc __keccakf1600_avx2 (state:W256.t Array7.t) : W256.t Array7.t = {
    var round_constants:W64.t Array24.t;
    var rc:W256.t;
    var r:int;
    round_constants <- witness;
    round_constants <- kECCAK1600_RC;
    r <- 0;
    state <@ __keccakf1600_pround_avx2 (state);
    rc <- (VPBROADCAST_4u64 round_constants.[r]);
    state.[0] <- (state.[0] `^` rc);
    r <- (r + 1);
    while ((r < 24)) {
      state <@ __keccakf1600_pround_avx2 (state);
      rc <- (VPBROADCAST_4u64 round_constants.[r]);
      state.[0] <- (state.[0] `^` rc);
      r <- (r + 1);
    }
    return state;
  }
  proc __stavx2_pack (st:W64.t Array25.t) : W256.t Array7.t = {
    var state:W256.t Array7.t;
    var t128_1:W128.t;
    var t128_0:W128.t;
    var r:W64.t;
    var t256_0:W256.t;
    var t256_1:W256.t;
    var t256_2:W256.t;
    state <- witness;
    state.[0] <-
    (VPBROADCAST_4u64
    (get64_direct (WArray200.init64 (fun i => st.[i])) (8 * 0)));
    state.[1] <-
    (get256_direct (WArray200.init64 (fun i => st.[i])) (1 * 8));
    t128_1 <- (VMOV_64 st.[5]);
    state.[3] <-
    (get256_direct (WArray200.init64 (fun i => st.[i])) (6 * 8));
    t128_0 <- (VMOV_64 st.[10]);
    state.[4] <-
    (get256_direct (WArray200.init64 (fun i => st.[i])) (11 * 8));
    r <- st.[15];
    t128_1 <- (VPINSR_2u64 t128_1 r (W8.of_int 1));
    state.[5] <-
    (get256_direct (WArray200.init64 (fun i => st.[i])) (16 * 8));
    r <- st.[20];
    t128_0 <- (VPINSR_2u64 t128_0 r (W8.of_int 1));
    t256_0 <- (zeroextu256 t128_0);
    t256_0 <- (VINSERTI128 t256_0 t128_1 (W8.of_int 1));
    state.[2] <- t256_0;
    state.[6] <-
    (get256_direct (WArray200.init64 (fun i => st.[i])) (21 * 8));
    t256_0 <-
    (VPBLEND_8u32 state.[3] state.[5]
    (W8.of_int
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t256_1 <-
    (VPBLEND_8u32 state.[6] state.[4]
    (W8.of_int
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t256_2 <-
    (VPBLEND_8u32 state.[4] state.[3]
    (W8.of_int
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    state.[3] <-
    (VPBLEND_8u32 t256_0 t256_1
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    state.[4] <-
    (VPBLEND_8u32 t256_1 t256_0
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t256_0 <-
    (VPBLEND_8u32 state.[5] state.[6]
    (W8.of_int
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    state.[5] <-
    (VPBLEND_8u32 t256_0 t256_2
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    state.[6] <-
    (VPBLEND_8u32 t256_2 t256_0
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    return state;
  }
  proc __stavx2_unpack (st:W64.t Array25.t, state:W256.t Array7.t) : 
  W64.t Array25.t = {
    var t128_0:W128.t;
    var t256_0:W256.t;
    var t256_1:W256.t;
    var t256_2:W256.t;
    var t256_3:W256.t;
    var t128_1:W128.t;
    var t256_4:W256.t;
    t128_0 <- (truncateu128 state.[0]);
    st.[0] <- (VMOVLPD t128_0);
    st <-
    (Array25.init
    (WArray200.get64
    (WArray200.set256_direct (WArray200.init64 (fun i => st.[i])) (1 * 8)
    state.[1])));
    t256_0 <-
    (VPBLEND_8u32 state.[3] state.[4]
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t256_1 <-
    (VPBLEND_8u32 state.[4] state.[3]
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t256_2 <-
    (VPBLEND_8u32 state.[5] state.[6]
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t256_3 <-
    (VPBLEND_8u32 state.[6] state.[5]
    (W8.of_int
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    t128_1 <- (VEXTRACTI128 state.[2] (W8.of_int 1));
    st.[5] <- (VMOVLPD t128_1);
    t256_4 <-
    (VPBLEND_8u32 t256_0 t256_3
    (W8.of_int
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    st <-
    (Array25.init
    (WArray200.get64
    (WArray200.set256_direct (WArray200.init64 (fun i => st.[i])) (6 * 8)
    t256_4)));
    t128_0 <- (truncateu128 state.[2]);
    st.[10] <- (VMOVLPD t128_0);
    t256_4 <-
    (VPBLEND_8u32 t256_3 t256_1
    (W8.of_int
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    st <-
    (Array25.init
    (WArray200.get64
    (WArray200.set256_direct (WArray200.init64 (fun i => st.[i])) (11 * 8)
    t256_4)));
    st.[15] <- (VMOVHPD t128_1);
    t256_4 <-
    (VPBLEND_8u32 t256_2 t256_0
    (W8.of_int
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    st <-
    (Array25.init
    (WArray200.get64
    (WArray200.set256_direct (WArray200.init64 (fun i => st.[i])) (16 * 8)
    t256_4)));
    st.[20] <- (VMOVHPD t128_0);
    t256_4 <-
    (VPBLEND_8u32 t256_1 t256_2
    (W8.of_int
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((1 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) +
    ((2 ^ 1) *
    ((0 %% (2 ^ 1)) + ((2 ^ 1) * ((1 %% (2 ^ 1)) + ((2 ^ 1) * 1))))))))))))))
    ));
    st <-
    (Array25.init
    (WArray200.get64
    (WArray200.set256_direct (WArray200.init64 (fun i => st.[i])) (21 * 8)
    t256_4)));
    return st;
  }
  proc _keccakf1600_st25_avx2 (st25:W64.t Array25.t) : W64.t Array25.t = {
    var state:W256.t Array7.t;
    state <- witness;
    state <@ __stavx2_pack (st25);
    state <@ __keccakf1600_avx2 (state);
    st25 <@ __stavx2_unpack (st25, state);
    return st25;
  }
  proc _keccakf1600 (a:W64.t Array25.t) : W64.t Array25.t = {
    var kECCAK_F:int;
    kECCAK_F <@ __KECCAK_F ((2 + 512));
    if ((kECCAK_F = 2)) {
      a <@ _keccakf1600_opt (a);
    } else {
      if ((kECCAK_F = 1)) {
        a <@ _keccakf1600_basic (a);
      } else {
        if ((kECCAK_F = 3)) {
          a <@ _keccakf1600_st25_avx2 (a);
        } else {
          a <@ _keccakf1600_ref (a);
        }
      }
    }
    return a;
  }
  proc __state_init (st:W64.t Array25.t) : W64.t Array25.t = {
    var hAS_AVX2:bool;
    var z64:W64.t;
    var z256:W256.t;
    var i:int;
    hAS_AVX2 <@ __HAS_FEATURE (4, ((1 + 2) + 4));
    if (hAS_AVX2) {
      z256 <- (set0_256);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set256 (WArray200.init64 (fun i_0 => st.[i_0])) 0 z256)));
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set256 (WArray200.init64 (fun i_0 => st.[i_0])) 1 z256)));
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set256 (WArray200.init64 (fun i_0 => st.[i_0])) 2 z256)));
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set256 (WArray200.init64 (fun i_0 => st.[i_0])) 3 z256)));
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set256 (WArray200.init64 (fun i_0 => st.[i_0])) 4 z256)));
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set256 (WArray200.init64 (fun i_0 => st.[i_0])) 5 z256)));
      st.[24] <- (W64.of_int 0);
    } else {
      z64 <- (W64.of_int 0);
      i <- 0;
      while ((i < 25)) {
        st.[i] <- z64;
        i <- (i + 1);
      }
    }
    return st;
  }
  proc __addratebit (st:W64.t Array25.t, _RATE8:int) : W64.t Array25.t = {
    
    st <-
    (Array25.init
    (WArray200.get64
    (WArray200.set8_direct (WArray200.init64 (fun i => st.[i])) (_RATE8 - 1)
    ((get8_direct (WArray200.init64 (fun i => st.[i])) (_RATE8 - 1)) `^`
    (W8.of_int 128)))));
    return st;
  }
  proc __4u64x4_u256x4 (y0:W256.t, y1:W256.t, y2:W256.t, y3:W256.t) : 
  W256.t * W256.t * W256.t * W256.t = {
    var x0:W256.t;
    var x1:W256.t;
    var x2:W256.t;
    var x3:W256.t;
    x0 <- (VPERM2I128 y0 y2 (W8.of_int 32));
    x1 <- (VPERM2I128 y1 y3 (W8.of_int 32));
    x2 <- (VPERM2I128 y0 y2 (W8.of_int 49));
    x3 <- (VPERM2I128 y1 y3 (W8.of_int 49));
    y0 <- (VPUNPCKL_4u64 x0 x1);
    y1 <- (VPUNPCKH_4u64 x0 x1);
    y2 <- (VPUNPCKL_4u64 x2 x3);
    y3 <- (VPUNPCKH_4u64 x2 x3);
    return (y0, y1, y2, y3);
  }
  proc _keccakf1600_4x_pround (e:W256.t Array25.t, a:W256.t Array25.t,
                               r8:W256.t, r56:W256.t) : W256.t Array25.t = {
    var c_571:W256.t Array5.t;
    var d_619:W256.t Array5.t;
    var t_574:W256.t;
    var t_577:W256.t;
    var t_580:W256.t;
    var t_583:W256.t;
    var t_586:W256.t;
    var b_606:W256.t Array5.t;
    var t_593:W256.t;
    var t_596:W256.t;
    var t_599:W256.t;
    var t_602:W256.t;
    var t_607:W256.t;
    var t_608:W256.t;
    var t_609:W256.t;
    var t_610:W256.t;
    var t_611:W256.t;
    var t_612:W256.t;
    var t_613:W256.t;
    var t_614:W256.t;
    var t_615:W256.t;
    var t_616:W256.t;
    var b_638:W256.t Array5.t;
    var t_622:W256.t;
    var t_625:W256.t;
    var t_628:W256.t;
    var t_631:W256.t;
    var t_634:W256.t;
    var t_639:W256.t;
    var t_640:W256.t;
    var t_641:W256.t;
    var t_642:W256.t;
    var t_643:W256.t;
    var t_644:W256.t;
    var t_645:W256.t;
    var t_646:W256.t;
    var t_647:W256.t;
    var t_648:W256.t;
    var b_671:W256.t Array5.t;
    var t_655:W256.t;
    var t_658:W256.t;
    var t_661:W256.t;
    var t_667:W256.t;
    var t_672:W256.t;
    var t_673:W256.t;
    var t_674:W256.t;
    var t_675:W256.t;
    var t_676:W256.t;
    var t_677:W256.t;
    var t_678:W256.t;
    var t_679:W256.t;
    var t_680:W256.t;
    var t_681:W256.t;
    var b_704:W256.t Array5.t;
    var t_688:W256.t;
    var t_691:W256.t;
    var t_694:W256.t;
    var t_697:W256.t;
    var t_705:W256.t;
    var t_706:W256.t;
    var t_707:W256.t;
    var t_708:W256.t;
    var t_709:W256.t;
    var t_710:W256.t;
    var t_711:W256.t;
    var t_712:W256.t;
    var t_713:W256.t;
    var t_714:W256.t;
    var b_736:W256.t Array5.t;
    var t_720:W256.t;
    var t_723:W256.t;
    var t_726:W256.t;
    var t_729:W256.t;
    var t_732:W256.t;
    var t_737:W256.t;
    var t_738:W256.t;
    var t_739:W256.t;
    var t_740:W256.t;
    var t_741:W256.t;
    var t_742:W256.t;
    var t_743:W256.t;
    var t_744:W256.t;
    var t_745:W256.t;
    var t_746:W256.t;
    b_606 <- witness;
    b_638 <- witness;
    b_671 <- witness;
    b_704 <- witness;
    b_736 <- witness;
    c_571 <- witness;
    d_619 <- witness;
    c_571.[0] <- a.[0];
    c_571.[1] <- a.[1];
    c_571.[2] <- a.[2];
    c_571.[3] <- a.[3];
    c_571.[4] <- a.[4];
    c_571.[0] <- (c_571.[0] `^` a.[5]);
    c_571.[1] <- (c_571.[1] `^` a.[6]);
    c_571.[2] <- (c_571.[2] `^` a.[7]);
    c_571.[3] <- (c_571.[3] `^` a.[8]);
    c_571.[4] <- (c_571.[4] `^` a.[9]);
    c_571.[0] <- (c_571.[0] `^` a.[10]);
    c_571.[1] <- (c_571.[1] `^` a.[11]);
    c_571.[2] <- (c_571.[2] `^` a.[12]);
    c_571.[3] <- (c_571.[3] `^` a.[13]);
    c_571.[4] <- (c_571.[4] `^` a.[14]);
    c_571.[0] <- (c_571.[0] `^` a.[15]);
    c_571.[1] <- (c_571.[1] `^` a.[16]);
    c_571.[2] <- (c_571.[2] `^` a.[17]);
    c_571.[3] <- (c_571.[3] `^` a.[18]);
    c_571.[4] <- (c_571.[4] `^` a.[19]);
    c_571.[0] <- (c_571.[0] `^` a.[20]);
    c_571.[1] <- (c_571.[1] `^` a.[21]);
    c_571.[2] <- (c_571.[2] `^` a.[22]);
    c_571.[3] <- (c_571.[3] `^` a.[23]);
    c_571.[4] <- (c_571.[4] `^` a.[24]);
    d_619.[0] <- c_571.[1];
    t_574 <- (VPSLL_4u64 d_619.[0] (W128.of_int 1));
    d_619.[0] <- (VPSRL_4u64 d_619.[0] (W128.of_int 63));
    d_619.[0] <- (d_619.[0] `|` t_574);
    d_619.[0] <- (d_619.[0] `^` c_571.[4]);
    d_619.[1] <- c_571.[2];
    t_577 <- (VPSLL_4u64 d_619.[1] (W128.of_int 1));
    d_619.[1] <- (VPSRL_4u64 d_619.[1] (W128.of_int 63));
    d_619.[1] <- (d_619.[1] `|` t_577);
    d_619.[1] <- (d_619.[1] `^` c_571.[0]);
    d_619.[2] <- c_571.[3];
    t_580 <- (VPSLL_4u64 d_619.[2] (W128.of_int 1));
    d_619.[2] <- (VPSRL_4u64 d_619.[2] (W128.of_int 63));
    d_619.[2] <- (d_619.[2] `|` t_580);
    d_619.[2] <- (d_619.[2] `^` c_571.[1]);
    d_619.[3] <- c_571.[4];
    t_583 <- (VPSLL_4u64 d_619.[3] (W128.of_int 1));
    d_619.[3] <- (VPSRL_4u64 d_619.[3] (W128.of_int 63));
    d_619.[3] <- (d_619.[3] `|` t_583);
    d_619.[3] <- (d_619.[3] `^` c_571.[2]);
    d_619.[4] <- c_571.[0];
    t_586 <- (VPSLL_4u64 d_619.[4] (W128.of_int 1));
    d_619.[4] <- (VPSRL_4u64 d_619.[4] (W128.of_int 63));
    d_619.[4] <- (d_619.[4] `|` t_586);
    d_619.[4] <- (d_619.[4] `^` c_571.[3]);
    b_606.[0] <- a.[0];
    b_606.[0] <- (b_606.[0] `^` d_619.[0]);
    b_606.[1] <- a.[6];
    b_606.[1] <- (b_606.[1] `^` d_619.[1]);
    t_593 <- (VPSLL_4u64 b_606.[1] (W128.of_int 44));
    b_606.[1] <- (VPSRL_4u64 b_606.[1] (W128.of_int 20));
    b_606.[1] <- (b_606.[1] `|` t_593);
    b_606.[2] <- a.[12];
    b_606.[2] <- (b_606.[2] `^` d_619.[2]);
    t_596 <- (VPSLL_4u64 b_606.[2] (W128.of_int 43));
    b_606.[2] <- (VPSRL_4u64 b_606.[2] (W128.of_int 21));
    b_606.[2] <- (b_606.[2] `|` t_596);
    b_606.[3] <- a.[18];
    b_606.[3] <- (b_606.[3] `^` d_619.[3]);
    t_599 <- (VPSLL_4u64 b_606.[3] (W128.of_int 21));
    b_606.[3] <- (VPSRL_4u64 b_606.[3] (W128.of_int 43));
    b_606.[3] <- (b_606.[3] `|` t_599);
    b_606.[4] <- a.[24];
    b_606.[4] <- (b_606.[4] `^` d_619.[4]);
    t_602 <- (VPSLL_4u64 b_606.[4] (W128.of_int 14));
    b_606.[4] <- (VPSRL_4u64 b_606.[4] (W128.of_int 50));
    b_606.[4] <- (b_606.[4] `|` t_602);
    t_607 <- (VPANDN_256 b_606.[1] b_606.[2]);
    t_608 <- (t_607 `^` b_606.[0]);
    e.[0] <- t_608;
    t_609 <- (VPANDN_256 b_606.[2] b_606.[3]);
    t_610 <- (t_609 `^` b_606.[1]);
    e.[1] <- t_610;
    t_611 <- (VPANDN_256 b_606.[3] b_606.[4]);
    t_612 <- (t_611 `^` b_606.[2]);
    e.[2] <- t_612;
    t_613 <- (VPANDN_256 b_606.[4] b_606.[0]);
    t_614 <- (t_613 `^` b_606.[3]);
    e.[3] <- t_614;
    t_615 <- (VPANDN_256 b_606.[0] b_606.[1]);
    t_616 <- (t_615 `^` b_606.[4]);
    e.[4] <- t_616;
    b_638.[0] <- a.[3];
    b_638.[0] <- (b_638.[0] `^` d_619.[3]);
    t_622 <- (VPSLL_4u64 b_638.[0] (W128.of_int 28));
    b_638.[0] <- (VPSRL_4u64 b_638.[0] (W128.of_int 36));
    b_638.[0] <- (b_638.[0] `|` t_622);
    b_638.[1] <- a.[9];
    b_638.[1] <- (b_638.[1] `^` d_619.[4]);
    t_625 <- (VPSLL_4u64 b_638.[1] (W128.of_int 20));
    b_638.[1] <- (VPSRL_4u64 b_638.[1] (W128.of_int 44));
    b_638.[1] <- (b_638.[1] `|` t_625);
    b_638.[2] <- a.[10];
    b_638.[2] <- (b_638.[2] `^` d_619.[0]);
    t_628 <- (VPSLL_4u64 b_638.[2] (W128.of_int 3));
    b_638.[2] <- (VPSRL_4u64 b_638.[2] (W128.of_int 61));
    b_638.[2] <- (b_638.[2] `|` t_628);
    b_638.[3] <- a.[16];
    b_638.[3] <- (b_638.[3] `^` d_619.[1]);
    t_631 <- (VPSLL_4u64 b_638.[3] (W128.of_int 45));
    b_638.[3] <- (VPSRL_4u64 b_638.[3] (W128.of_int 19));
    b_638.[3] <- (b_638.[3] `|` t_631);
    b_638.[4] <- a.[22];
    b_638.[4] <- (b_638.[4] `^` d_619.[2]);
    t_634 <- (VPSLL_4u64 b_638.[4] (W128.of_int 61));
    b_638.[4] <- (VPSRL_4u64 b_638.[4] (W128.of_int 3));
    b_638.[4] <- (b_638.[4] `|` t_634);
    t_639 <- (VPANDN_256 b_638.[1] b_638.[2]);
    t_640 <- (t_639 `^` b_638.[0]);
    e.[5] <- t_640;
    t_641 <- (VPANDN_256 b_638.[2] b_638.[3]);
    t_642 <- (t_641 `^` b_638.[1]);
    e.[6] <- t_642;
    t_643 <- (VPANDN_256 b_638.[3] b_638.[4]);
    t_644 <- (t_643 `^` b_638.[2]);
    e.[7] <- t_644;
    t_645 <- (VPANDN_256 b_638.[4] b_638.[0]);
    t_646 <- (t_645 `^` b_638.[3]);
    e.[8] <- t_646;
    t_647 <- (VPANDN_256 b_638.[0] b_638.[1]);
    t_648 <- (t_647 `^` b_638.[4]);
    e.[9] <- t_648;
    b_671.[0] <- a.[1];
    b_671.[0] <- (b_671.[0] `^` d_619.[1]);
    t_655 <- (VPSLL_4u64 b_671.[0] (W128.of_int 1));
    b_671.[0] <- (VPSRL_4u64 b_671.[0] (W128.of_int 63));
    b_671.[0] <- (b_671.[0] `|` t_655);
    b_671.[1] <- a.[7];
    b_671.[1] <- (b_671.[1] `^` d_619.[2]);
    t_658 <- (VPSLL_4u64 b_671.[1] (W128.of_int 6));
    b_671.[1] <- (VPSRL_4u64 b_671.[1] (W128.of_int 58));
    b_671.[1] <- (b_671.[1] `|` t_658);
    b_671.[2] <- a.[13];
    b_671.[2] <- (b_671.[2] `^` d_619.[3]);
    t_661 <- (VPSLL_4u64 b_671.[2] (W128.of_int 25));
    b_671.[2] <- (VPSRL_4u64 b_671.[2] (W128.of_int 39));
    b_671.[2] <- (b_671.[2] `|` t_661);
    b_671.[3] <- a.[19];
    b_671.[3] <- (b_671.[3] `^` d_619.[4]);
    b_671.[3] <- (VPSHUFB_256 b_671.[3] r8);
    b_671.[4] <- a.[20];
    b_671.[4] <- (b_671.[4] `^` d_619.[0]);
    t_667 <- (VPSLL_4u64 b_671.[4] (W128.of_int 18));
    b_671.[4] <- (VPSRL_4u64 b_671.[4] (W128.of_int 46));
    b_671.[4] <- (b_671.[4] `|` t_667);
    t_672 <- (VPANDN_256 b_671.[1] b_671.[2]);
    t_673 <- (t_672 `^` b_671.[0]);
    e.[10] <- t_673;
    t_674 <- (VPANDN_256 b_671.[2] b_671.[3]);
    t_675 <- (t_674 `^` b_671.[1]);
    e.[11] <- t_675;
    t_676 <- (VPANDN_256 b_671.[3] b_671.[4]);
    t_677 <- (t_676 `^` b_671.[2]);
    e.[12] <- t_677;
    t_678 <- (VPANDN_256 b_671.[4] b_671.[0]);
    t_679 <- (t_678 `^` b_671.[3]);
    e.[13] <- t_679;
    t_680 <- (VPANDN_256 b_671.[0] b_671.[1]);
    t_681 <- (t_680 `^` b_671.[4]);
    e.[14] <- t_681;
    b_704.[0] <- a.[4];
    b_704.[0] <- (b_704.[0] `^` d_619.[4]);
    t_688 <- (VPSLL_4u64 b_704.[0] (W128.of_int 27));
    b_704.[0] <- (VPSRL_4u64 b_704.[0] (W128.of_int 37));
    b_704.[0] <- (b_704.[0] `|` t_688);
    b_704.[1] <- a.[5];
    b_704.[1] <- (b_704.[1] `^` d_619.[0]);
    t_691 <- (VPSLL_4u64 b_704.[1] (W128.of_int 36));
    b_704.[1] <- (VPSRL_4u64 b_704.[1] (W128.of_int 28));
    b_704.[1] <- (b_704.[1] `|` t_691);
    b_704.[2] <- a.[11];
    b_704.[2] <- (b_704.[2] `^` d_619.[1]);
    t_694 <- (VPSLL_4u64 b_704.[2] (W128.of_int 10));
    b_704.[2] <- (VPSRL_4u64 b_704.[2] (W128.of_int 54));
    b_704.[2] <- (b_704.[2] `|` t_694);
    b_704.[3] <- a.[17];
    b_704.[3] <- (b_704.[3] `^` d_619.[2]);
    t_697 <- (VPSLL_4u64 b_704.[3] (W128.of_int 15));
    b_704.[3] <- (VPSRL_4u64 b_704.[3] (W128.of_int 49));
    b_704.[3] <- (b_704.[3] `|` t_697);
    b_704.[4] <- a.[23];
    b_704.[4] <- (b_704.[4] `^` d_619.[3]);
    b_704.[4] <- (VPSHUFB_256 b_704.[4] r56);
    t_705 <- (VPANDN_256 b_704.[1] b_704.[2]);
    t_706 <- (t_705 `^` b_704.[0]);
    e.[15] <- t_706;
    t_707 <- (VPANDN_256 b_704.[2] b_704.[3]);
    t_708 <- (t_707 `^` b_704.[1]);
    e.[16] <- t_708;
    t_709 <- (VPANDN_256 b_704.[3] b_704.[4]);
    t_710 <- (t_709 `^` b_704.[2]);
    e.[17] <- t_710;
    t_711 <- (VPANDN_256 b_704.[4] b_704.[0]);
    t_712 <- (t_711 `^` b_704.[3]);
    e.[18] <- t_712;
    t_713 <- (VPANDN_256 b_704.[0] b_704.[1]);
    t_714 <- (t_713 `^` b_704.[4]);
    e.[19] <- t_714;
    b_736.[0] <- a.[2];
    b_736.[0] <- (b_736.[0] `^` d_619.[2]);
    t_720 <- (VPSLL_4u64 b_736.[0] (W128.of_int 62));
    b_736.[0] <- (VPSRL_4u64 b_736.[0] (W128.of_int 2));
    b_736.[0] <- (b_736.[0] `|` t_720);
    b_736.[1] <- a.[8];
    b_736.[1] <- (b_736.[1] `^` d_619.[3]);
    t_723 <- (VPSLL_4u64 b_736.[1] (W128.of_int 55));
    b_736.[1] <- (VPSRL_4u64 b_736.[1] (W128.of_int 9));
    b_736.[1] <- (b_736.[1] `|` t_723);
    b_736.[2] <- a.[14];
    b_736.[2] <- (b_736.[2] `^` d_619.[4]);
    t_726 <- (VPSLL_4u64 b_736.[2] (W128.of_int 39));
    b_736.[2] <- (VPSRL_4u64 b_736.[2] (W128.of_int 25));
    b_736.[2] <- (b_736.[2] `|` t_726);
    b_736.[3] <- a.[15];
    b_736.[3] <- (b_736.[3] `^` d_619.[0]);
    t_729 <- (VPSLL_4u64 b_736.[3] (W128.of_int 41));
    b_736.[3] <- (VPSRL_4u64 b_736.[3] (W128.of_int 23));
    b_736.[3] <- (b_736.[3] `|` t_729);
    b_736.[4] <- a.[21];
    b_736.[4] <- (b_736.[4] `^` d_619.[1]);
    t_732 <- (VPSLL_4u64 b_736.[4] (W128.of_int 2));
    b_736.[4] <- (VPSRL_4u64 b_736.[4] (W128.of_int 62));
    b_736.[4] <- (b_736.[4] `|` t_732);
    t_737 <- (VPANDN_256 b_736.[1] b_736.[2]);
    t_738 <- (t_737 `^` b_736.[0]);
    e.[20] <- t_738;
    t_739 <- (VPANDN_256 b_736.[2] b_736.[3]);
    t_740 <- (t_739 `^` b_736.[1]);
    e.[21] <- t_740;
    t_741 <- (VPANDN_256 b_736.[3] b_736.[4]);
    t_742 <- (t_741 `^` b_736.[2]);
    e.[22] <- t_742;
    t_743 <- (VPANDN_256 b_736.[4] b_736.[0]);
    t_744 <- (t_743 `^` b_736.[3]);
    e.[23] <- t_744;
    t_745 <- (VPANDN_256 b_736.[0] b_736.[1]);
    t_746 <- (t_745 `^` b_736.[4]);
    e.[24] <- t_746;
    return e;
  }
  proc __keccakf1600_avx2x4_ref (a:W256.t Array25.t) : W256.t Array25.t = {
    var rC:W64.t Array24.t;
    var s_e:W256.t Array25.t;
    var e:W256.t Array25.t;
    var r8:W256.t;
    var r56:W256.t;
    var rc:W256.t;
    var t:W256.t;
    var c:int;
    rC <- witness;
    e <- witness;
    s_e <- witness;
    rC <- kECCAK1600_RC;
    e <- s_e;
    r8 <- rOL8.[0];
    r56 <- rOL56.[0];
    c <- 0;
    while ((c < 24)) {
      rc <- (VPBROADCAST_4u64 rC.[c]);
      e <@ _keccakf1600_4x_pround (e, a, r8, r56);
      t <- (rc `^` e.[0]);
      e.[0] <- t;
      (a, e) <- (swap_ e a);
      rc <- (VPBROADCAST_4u64 rC.[(c + 1)]);
      a <@ _keccakf1600_4x_pround (a, e, r8, r56);
      t <- (rc `^` a.[0]);
      a.[0] <- t;
      (a, e) <- (swap_ e a);
      c <- (c + 2);
    }
    return a;
  }
  proc _keccakf1600_avx2x4_ref (a:W256.t Array25.t) : W256.t Array25.t = {
    
    a <@ __keccakf1600_avx2x4_ref (a);
    return a;
  }
  proc __rol_4u64_rho56 (a:W256.t) : W256.t = {
    var r:W256.t;
    r <- (VPSHUFB_256 a rOL56.[0]);
    return r;
  }
  proc __rol_4u64_rho8 (a:W256.t) : W256.t = {
    var r:W256.t;
    r <- (VPSHUFB_256 a rOL8.[0]);
    return r;
  }
  proc __rol_4u64 (a:W256.t, o:int) : W256.t = {
    var r:W256.t;
    var t256:W256.t;
    r <- (VPSLL_4u64 a (W128.of_int o));
    t256 <- (VPSRL_4u64 a (W128.of_int (64 - o)));
    r <- (r `|` t256);
    return r;
  }
  proc __prepare_theta (a_4x:W256.t Array25.t) : W256.t * W256.t * W256.t *
                                                 W256.t * W256.t = {
    var ca:W256.t;
    var ce:W256.t;
    var ci:W256.t;
    var co:W256.t;
    var cu:W256.t;
    ca <- a_4x.[20];
    ca <- (ca `^` a_4x.[15]);
    ca <- (ca `^` a_4x.[10]);
    ca <- (ca `^` a_4x.[5]);
    ca <- (ca `^` a_4x.[0]);
    ce <- a_4x.[21];
    ce <- (ce `^` a_4x.[16]);
    ce <- (ce `^` a_4x.[11]);
    ce <- (ce `^` a_4x.[6]);
    ce <- (ce `^` a_4x.[1]);
    ci <- a_4x.[22];
    ci <- (ci `^` a_4x.[17]);
    ci <- (ci `^` a_4x.[12]);
    ci <- (ci `^` a_4x.[7]);
    ci <- (ci `^` a_4x.[2]);
    co <- a_4x.[23];
    co <- (co `^` a_4x.[18]);
    co <- (co `^` a_4x.[13]);
    co <- (co `^` a_4x.[8]);
    co <- (co `^` a_4x.[3]);
    cu <- a_4x.[24];
    cu <- (cu `^` a_4x.[19]);
    cu <- (cu `^` a_4x.[14]);
    cu <- (cu `^` a_4x.[9]);
    cu <- (cu `^` a_4x.[4]);
    return (ca, ce, ci, co, cu);
  }
  proc __first (ca:W256.t, ce:W256.t, ci:W256.t, co:W256.t, cu:W256.t) : 
  W256.t * W256.t * W256.t * W256.t * W256.t = {
    var da:W256.t;
    var de:W256.t;
    var di:W256.t;
    var do_0:W256.t;
    var du:W256.t;
    var ce1:W256.t;
    var ci1:W256.t;
    var co1:W256.t;
    var cu1:W256.t;
    var ca1:W256.t;
    ce1 <@ __rol_4u64 (ce, 1);
    da <- (cu `^` ce1);
    ci1 <@ __rol_4u64 (ci, 1);
    de <- (ca `^` ci1);
    co1 <@ __rol_4u64 (co, 1);
    di <- (ce `^` co1);
    cu1 <@ __rol_4u64 (cu, 1);
    do_0 <- (ci `^` cu1);
    ca1 <@ __rol_4u64 (ca, 1);
    du <- (co `^` ca1);
    return (da, de, di, do_0, du);
  }
  proc __second_even (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t,
                      rc_index:W256.t, ca:W256.t, ce:W256.t, ci:W256.t,
                      co:W256.t, cu:W256.t, da:W256.t, de:W256.t, di:W256.t,
                      do_0:W256.t, du:W256.t) : W256.t Array25.t *
                                                W256.t Array25.t * W256.t *
                                                W256.t * W256.t * W256.t *
                                                W256.t = {
    var t256:W256.t;
    var bba:W256.t;
    var bbe:W256.t;
    var bbi:W256.t;
    var bbo:W256.t;
    var bbu:W256.t;
    t256 <- a_4x.[0];
    t256 <- (t256 `^` da);
    a_4x.[0] <- t256;
    bba <- t256;
    t256 <- a_4x.[6];
    t256 <- (t256 `^` de);
    a_4x.[6] <- t256;
    bbe <@ __rol_4u64 (t256, 44);
    t256 <- a_4x.[12];
    t256 <- (t256 `^` di);
    a_4x.[12] <- t256;
    bbi <@ __rol_4u64 (t256, 43);
    t256 <- (VPANDN_256 bbe bbi);
    t256 <- (t256 `^` bba);
    t256 <- (t256 `^` rc_index);
    e_4x.[0] <- t256;
    ca <- t256;
    t256 <- a_4x.[18];
    t256 <- (t256 `^` do_0);
    a_4x.[18] <- t256;
    bbo <@ __rol_4u64 (t256, 21);
    t256 <- (VPANDN_256 bbi bbo);
    t256 <- (t256 `^` bbe);
    e_4x.[1] <- t256;
    ce <- t256;
    t256 <- a_4x.[24];
    t256 <- (t256 `^` du);
    a_4x.[24] <- t256;
    bbu <@ __rol_4u64 (t256, 14);
    t256 <- (VPANDN_256 bbo bbu);
    t256 <- (t256 `^` bbi);
    e_4x.[2] <- t256;
    ci <- t256;
    t256 <- (VPANDN_256 bbu bba);
    t256 <- (t256 `^` bbo);
    e_4x.[3] <- t256;
    co <- t256;
    t256 <- (VPANDN_256 bba bbe);
    t256 <- (t256 `^` bbu);
    e_4x.[4] <- t256;
    cu <- t256;
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc __third_even (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t, ca:W256.t,
                     ce:W256.t, ci:W256.t, co:W256.t, cu:W256.t, da:W256.t,
                     de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : 
  W256.t Array25.t * W256.t Array25.t * W256.t * W256.t * W256.t * W256.t *
  W256.t = {
    var t256:W256.t;
    var bga:W256.t;
    var bge:W256.t;
    var bgi:W256.t;
    var bgo:W256.t;
    var bgu:W256.t;
    t256 <- a_4x.[3];
    t256 <- (t256 `^` do_0);
    a_4x.[3] <- t256;
    bga <@ __rol_4u64 (t256, 28);
    t256 <- a_4x.[9];
    t256 <- (t256 `^` du);
    a_4x.[9] <- t256;
    bge <@ __rol_4u64 (t256, 20);
    t256 <- a_4x.[10];
    t256 <- (t256 `^` da);
    a_4x.[10] <- t256;
    bgi <@ __rol_4u64 (t256, 3);
    t256 <- (VPANDN_256 bge bgi);
    t256 <- (t256 `^` bga);
    e_4x.[5] <- t256;
    ca <- (ca `^` t256);
    t256 <- a_4x.[16];
    t256 <- (t256 `^` de);
    a_4x.[16] <- t256;
    bgo <@ __rol_4u64 (t256, 45);
    t256 <- (VPANDN_256 bgi bgo);
    t256 <- (t256 `^` bge);
    e_4x.[6] <- t256;
    ce <- (ce `^` t256);
    t256 <- a_4x.[22];
    t256 <- (t256 `^` di);
    a_4x.[22] <- t256;
    bgu <@ __rol_4u64 (t256, 61);
    t256 <- (VPANDN_256 bgo bgu);
    t256 <- (t256 `^` bgi);
    e_4x.[7] <- t256;
    ci <- (ci `^` t256);
    t256 <- (VPANDN_256 bgu bga);
    t256 <- (t256 `^` bgo);
    e_4x.[8] <- t256;
    co <- (co `^` t256);
    t256 <- (VPANDN_256 bga bge);
    t256 <- (t256 `^` bgu);
    e_4x.[9] <- t256;
    cu <- (cu `^` t256);
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc __fourth_even (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t,
                      ca:W256.t, ce:W256.t, ci:W256.t, co:W256.t, cu:W256.t,
                      da:W256.t, de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : 
  W256.t Array25.t * W256.t Array25.t * W256.t * W256.t * W256.t * W256.t *
  W256.t = {
    var t256:W256.t;
    var bka:W256.t;
    var bke:W256.t;
    var bki:W256.t;
    var bko:W256.t;
    var bku:W256.t;
    t256 <- a_4x.[1];
    t256 <- (t256 `^` de);
    a_4x.[1] <- t256;
    bka <@ __rol_4u64 (t256, 1);
    t256 <- a_4x.[7];
    t256 <- (t256 `^` di);
    a_4x.[7] <- t256;
    bke <@ __rol_4u64 (t256, 6);
    t256 <- a_4x.[13];
    t256 <- (t256 `^` do_0);
    a_4x.[13] <- t256;
    bki <@ __rol_4u64 (t256, 25);
    t256 <- (VPANDN_256 bke bki);
    t256 <- (t256 `^` bka);
    e_4x.[10] <- t256;
    ca <- (ca `^` t256);
    t256 <- a_4x.[19];
    t256 <- (t256 `^` du);
    a_4x.[19] <- t256;
    bko <@ __rol_4u64_rho8 (t256);
    t256 <- (VPANDN_256 bki bko);
    t256 <- (t256 `^` bke);
    e_4x.[11] <- t256;
    ce <- (ce `^` t256);
    t256 <- a_4x.[20];
    t256 <- (t256 `^` da);
    a_4x.[20] <- t256;
    bku <@ __rol_4u64 (t256, 18);
    t256 <- (VPANDN_256 bko bku);
    t256 <- (t256 `^` bki);
    e_4x.[12] <- t256;
    ci <- (ci `^` t256);
    t256 <- (VPANDN_256 bku bka);
    t256 <- (t256 `^` bko);
    e_4x.[13] <- t256;
    co <- (co `^` t256);
    t256 <- (VPANDN_256 bka bke);
    t256 <- (t256 `^` bku);
    e_4x.[14] <- t256;
    cu <- (cu `^` t256);
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc __fifth_even (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t, ca:W256.t,
                     ce:W256.t, ci:W256.t, co:W256.t, cu:W256.t, da:W256.t,
                     de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : 
  W256.t Array25.t * W256.t Array25.t * W256.t * W256.t * W256.t * W256.t *
  W256.t = {
    var t256:W256.t;
    var bma:W256.t;
    var bme:W256.t;
    var bmi:W256.t;
    var bmo:W256.t;
    var bmu:W256.t;
    t256 <- a_4x.[4];
    t256 <- (t256 `^` du);
    a_4x.[4] <- t256;
    bma <@ __rol_4u64 (t256, 27);
    t256 <- a_4x.[5];
    t256 <- (t256 `^` da);
    a_4x.[5] <- t256;
    bme <@ __rol_4u64 (t256, 36);
    t256 <- a_4x.[11];
    t256 <- (t256 `^` de);
    a_4x.[11] <- t256;
    bmi <@ __rol_4u64 (t256, 10);
    t256 <- (VPANDN_256 bme bmi);
    t256 <- (t256 `^` bma);
    e_4x.[15] <- t256;
    ca <- (ca `^` t256);
    t256 <- a_4x.[17];
    t256 <- (t256 `^` di);
    a_4x.[17] <- t256;
    bmo <@ __rol_4u64 (t256, 15);
    t256 <- (VPANDN_256 bmi bmo);
    t256 <- (t256 `^` bme);
    e_4x.[16] <- t256;
    ce <- (ce `^` t256);
    t256 <- a_4x.[23];
    t256 <- (t256 `^` do_0);
    a_4x.[23] <- t256;
    bmu <@ __rol_4u64_rho56 (t256);
    t256 <- (VPANDN_256 bmo bmu);
    t256 <- (t256 `^` bmi);
    e_4x.[17] <- t256;
    ci <- (ci `^` t256);
    t256 <- (VPANDN_256 bmu bma);
    t256 <- (t256 `^` bmo);
    e_4x.[18] <- t256;
    co <- (co `^` t256);
    t256 <- (VPANDN_256 bma bme);
    t256 <- (t256 `^` bmu);
    e_4x.[19] <- t256;
    cu <- (cu `^` t256);
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc __sixth_even (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t, ca:W256.t,
                     ce:W256.t, ci:W256.t, co:W256.t, cu:W256.t, da:W256.t,
                     de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : 
  W256.t Array25.t * W256.t Array25.t * W256.t * W256.t * W256.t * W256.t *
  W256.t = {
    var t256:W256.t;
    var bsa:W256.t;
    var bse:W256.t;
    var bsi:W256.t;
    var bso:W256.t;
    var bsu:W256.t;
    t256 <- a_4x.[2];
    t256 <- (t256 `^` di);
    a_4x.[2] <- t256;
    bsa <@ __rol_4u64 (t256, 62);
    t256 <- a_4x.[8];
    t256 <- (t256 `^` do_0);
    a_4x.[8] <- t256;
    bse <@ __rol_4u64 (t256, 55);
    t256 <- a_4x.[14];
    t256 <- (t256 `^` du);
    a_4x.[14] <- t256;
    bsi <@ __rol_4u64 (t256, 39);
    t256 <- (VPANDN_256 bse bsi);
    t256 <- (t256 `^` bsa);
    e_4x.[20] <- t256;
    ca <- (ca `^` t256);
    t256 <- a_4x.[15];
    t256 <- (t256 `^` da);
    a_4x.[15] <- t256;
    bso <@ __rol_4u64 (t256, 41);
    t256 <- (VPANDN_256 bsi bso);
    t256 <- (t256 `^` bse);
    e_4x.[21] <- t256;
    ce <- (ce `^` t256);
    t256 <- a_4x.[21];
    t256 <- (t256 `^` de);
    a_4x.[21] <- t256;
    bsu <@ __rol_4u64 (t256, 2);
    t256 <- (VPANDN_256 bso bsu);
    t256 <- (t256 `^` bsi);
    e_4x.[22] <- t256;
    ci <- (ci `^` t256);
    t256 <- (VPANDN_256 bsu bsa);
    t256 <- (t256 `^` bso);
    e_4x.[23] <- t256;
    co <- (co `^` t256);
    t256 <- (VPANDN_256 bsa bse);
    t256 <- (t256 `^` bsu);
    e_4x.[24] <- t256;
    cu <- (cu `^` t256);
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc __second_odd (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t,
                     rc_index:W256.t, ca:W256.t, ce:W256.t, ci:W256.t,
                     co:W256.t, cu:W256.t, da:W256.t, de:W256.t, di:W256.t,
                     do_0:W256.t, du:W256.t) : W256.t Array25.t *
                                               W256.t Array25.t * W256.t *
                                               W256.t * W256.t * W256.t *
                                               W256.t = {
    var t256:W256.t;
    var bba:W256.t;
    var bbe:W256.t;
    var bbi:W256.t;
    var bbo:W256.t;
    var bbu:W256.t;
    t256 <- a_4x.[0];
    t256 <- (t256 `^` da);
    a_4x.[0] <- t256;
    bba <- t256;
    t256 <- a_4x.[6];
    t256 <- (t256 `^` de);
    a_4x.[6] <- t256;
    bbe <@ __rol_4u64 (t256, 44);
    t256 <- a_4x.[12];
    t256 <- (t256 `^` di);
    a_4x.[12] <- t256;
    bbi <@ __rol_4u64 (t256, 43);
    t256 <- (VPANDN_256 bbe bbi);
    t256 <- (t256 `^` bba);
    t256 <- (t256 `^` rc_index);
    e_4x.[0] <- t256;
    ca <- t256;
    t256 <- a_4x.[18];
    t256 <- (t256 `^` do_0);
    a_4x.[18] <- t256;
    bbo <@ __rol_4u64 (t256, 21);
    t256 <- (VPANDN_256 bbi bbo);
    t256 <- (t256 `^` bbe);
    e_4x.[1] <- t256;
    ce <- t256;
    t256 <- a_4x.[24];
    t256 <- (t256 `^` du);
    a_4x.[24] <- t256;
    bbu <@ __rol_4u64 (t256, 14);
    t256 <- (VPANDN_256 bbo bbu);
    t256 <- (t256 `^` bbi);
    e_4x.[2] <- t256;
    ci <- t256;
    t256 <- (VPANDN_256 bbu bba);
    t256 <- (t256 `^` bbo);
    e_4x.[3] <- t256;
    co <- t256;
    t256 <- (VPANDN_256 bba bbe);
    t256 <- (t256 `^` bbu);
    e_4x.[4] <- t256;
    cu <- t256;
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc __third_odd (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t, ca:W256.t,
                    ce:W256.t, ci:W256.t, co:W256.t, cu:W256.t, da:W256.t,
                    de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : W256.t Array25.t *
                                                                    W256.t Array25.t *
                                                                    W256.t *
                                                                    W256.t *
                                                                    W256.t *
                                                                    W256.t *
                                                                    W256.t = {
    var t256:W256.t;
    var bga:W256.t;
    var bge:W256.t;
    var bgi:W256.t;
    var bgo:W256.t;
    var bgu:W256.t;
    t256 <- a_4x.[3];
    t256 <- (t256 `^` do_0);
    a_4x.[3] <- t256;
    bga <@ __rol_4u64 (t256, 28);
    t256 <- a_4x.[9];
    t256 <- (t256 `^` du);
    a_4x.[9] <- t256;
    bge <@ __rol_4u64 (t256, 20);
    t256 <- a_4x.[10];
    t256 <- (t256 `^` da);
    a_4x.[10] <- t256;
    bgi <@ __rol_4u64 (t256, 3);
    t256 <- (VPANDN_256 bge bgi);
    t256 <- (t256 `^` bga);
    e_4x.[5] <- t256;
    ca <- (ca `^` t256);
    t256 <- a_4x.[16];
    t256 <- (t256 `^` de);
    a_4x.[16] <- t256;
    bgo <@ __rol_4u64 (t256, 45);
    t256 <- (VPANDN_256 bgi bgo);
    t256 <- (t256 `^` bge);
    e_4x.[6] <- t256;
    ce <- (ce `^` t256);
    t256 <- a_4x.[22];
    t256 <- (t256 `^` di);
    a_4x.[22] <- t256;
    bgu <@ __rol_4u64 (t256, 61);
    t256 <- (VPANDN_256 bgo bgu);
    t256 <- (t256 `^` bgi);
    e_4x.[7] <- t256;
    ci <- (ci `^` t256);
    t256 <- (VPANDN_256 bgu bga);
    t256 <- (t256 `^` bgo);
    e_4x.[8] <- t256;
    co <- (co `^` t256);
    t256 <- (VPANDN_256 bga bge);
    t256 <- (t256 `^` bgu);
    e_4x.[9] <- t256;
    cu <- (cu `^` t256);
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc __fourth_odd (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t, ca:W256.t,
                     ce:W256.t, ci:W256.t, co:W256.t, cu:W256.t, da:W256.t,
                     de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : 
  W256.t Array25.t * W256.t Array25.t * W256.t * W256.t * W256.t * W256.t *
  W256.t = {
    var t256:W256.t;
    var bka:W256.t;
    var bke:W256.t;
    var bki:W256.t;
    var bko:W256.t;
    var bku:W256.t;
    t256 <- a_4x.[1];
    t256 <- (t256 `^` de);
    a_4x.[1] <- t256;
    bka <@ __rol_4u64 (t256, 1);
    t256 <- a_4x.[7];
    t256 <- (t256 `^` di);
    a_4x.[7] <- t256;
    bke <@ __rol_4u64 (t256, 6);
    t256 <- a_4x.[13];
    t256 <- (t256 `^` do_0);
    a_4x.[13] <- t256;
    bki <@ __rol_4u64 (t256, 25);
    t256 <- (VPANDN_256 bke bki);
    t256 <- (t256 `^` bka);
    e_4x.[10] <- t256;
    ca <- (ca `^` t256);
    t256 <- a_4x.[19];
    t256 <- (t256 `^` du);
    a_4x.[19] <- t256;
    bko <@ __rol_4u64_rho8 (t256);
    t256 <- (VPANDN_256 bki bko);
    t256 <- (t256 `^` bke);
    e_4x.[11] <- t256;
    ce <- (ce `^` t256);
    t256 <- a_4x.[20];
    t256 <- (t256 `^` da);
    a_4x.[20] <- t256;
    bku <@ __rol_4u64 (t256, 18);
    t256 <- (VPANDN_256 bko bku);
    t256 <- (t256 `^` bki);
    e_4x.[12] <- t256;
    ci <- (ci `^` t256);
    t256 <- (VPANDN_256 bku bka);
    t256 <- (t256 `^` bko);
    e_4x.[13] <- t256;
    co <- (co `^` t256);
    t256 <- (VPANDN_256 bka bke);
    t256 <- (t256 `^` bku);
    e_4x.[14] <- t256;
    cu <- (cu `^` t256);
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc __fifth_odd (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t, ca:W256.t,
                    ce:W256.t, ci:W256.t, co:W256.t, cu:W256.t, da:W256.t,
                    de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : W256.t Array25.t *
                                                                    W256.t Array25.t *
                                                                    W256.t *
                                                                    W256.t *
                                                                    W256.t *
                                                                    W256.t *
                                                                    W256.t = {
    var t256:W256.t;
    var bma:W256.t;
    var bme:W256.t;
    var bmi:W256.t;
    var bmo:W256.t;
    var bmu:W256.t;
    t256 <- a_4x.[4];
    t256 <- (t256 `^` du);
    a_4x.[4] <- t256;
    bma <@ __rol_4u64 (t256, 27);
    t256 <- a_4x.[5];
    t256 <- (t256 `^` da);
    a_4x.[5] <- t256;
    bme <@ __rol_4u64 (t256, 36);
    t256 <- a_4x.[11];
    t256 <- (t256 `^` de);
    a_4x.[11] <- t256;
    bmi <@ __rol_4u64 (t256, 10);
    t256 <- (VPANDN_256 bme bmi);
    t256 <- (t256 `^` bma);
    e_4x.[15] <- t256;
    ca <- (ca `^` t256);
    t256 <- a_4x.[17];
    t256 <- (t256 `^` di);
    a_4x.[17] <- t256;
    bmo <@ __rol_4u64 (t256, 15);
    t256 <- (VPANDN_256 bmi bmo);
    t256 <- (t256 `^` bme);
    e_4x.[16] <- t256;
    ce <- (ce `^` t256);
    t256 <- a_4x.[23];
    t256 <- (t256 `^` do_0);
    a_4x.[23] <- t256;
    bmu <@ __rol_4u64_rho56 (t256);
    t256 <- (VPANDN_256 bmo bmu);
    t256 <- (t256 `^` bmi);
    e_4x.[17] <- t256;
    ci <- (ci `^` t256);
    t256 <- (VPANDN_256 bmu bma);
    t256 <- (t256 `^` bmo);
    e_4x.[18] <- t256;
    co <- (co `^` t256);
    t256 <- (VPANDN_256 bma bme);
    t256 <- (t256 `^` bmu);
    e_4x.[19] <- t256;
    cu <- (cu `^` t256);
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc __sixth_odd (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t, ca:W256.t,
                    ce:W256.t, ci:W256.t, co:W256.t, cu:W256.t, da:W256.t,
                    de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : W256.t Array25.t *
                                                                    W256.t Array25.t *
                                                                    W256.t *
                                                                    W256.t *
                                                                    W256.t *
                                                                    W256.t *
                                                                    W256.t = {
    var t256:W256.t;
    var bsa:W256.t;
    var bse:W256.t;
    var bsi:W256.t;
    var bso:W256.t;
    var bsu:W256.t;
    t256 <- a_4x.[2];
    t256 <- (t256 `^` di);
    a_4x.[2] <- t256;
    bsa <@ __rol_4u64 (t256, 62);
    t256 <- a_4x.[8];
    t256 <- (t256 `^` do_0);
    a_4x.[8] <- t256;
    bse <@ __rol_4u64 (t256, 55);
    t256 <- a_4x.[14];
    t256 <- (t256 `^` du);
    a_4x.[14] <- t256;
    bsi <@ __rol_4u64 (t256, 39);
    t256 <- (VPANDN_256 bse bsi);
    t256 <- (t256 `^` bsa);
    e_4x.[20] <- t256;
    ca <- (ca `^` t256);
    t256 <- a_4x.[15];
    t256 <- (t256 `^` da);
    a_4x.[15] <- t256;
    bso <@ __rol_4u64 (t256, 41);
    t256 <- (VPANDN_256 bsi bso);
    t256 <- (t256 `^` bse);
    e_4x.[21] <- t256;
    ce <- (ce `^` t256);
    t256 <- a_4x.[21];
    t256 <- (t256 `^` de);
    a_4x.[21] <- t256;
    bsu <@ __rol_4u64 (t256, 2);
    t256 <- (VPANDN_256 bso bsu);
    t256 <- (t256 `^` bsi);
    e_4x.[22] <- t256;
    ci <- (ci `^` t256);
    t256 <- (VPANDN_256 bsu bsa);
    t256 <- (t256 `^` bso);
    e_4x.[23] <- t256;
    co <- (co `^` t256);
    t256 <- (VPANDN_256 bsa bse);
    t256 <- (t256 `^` bsu);
    e_4x.[24] <- t256;
    cu <- (cu `^` t256);
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc __second_last (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t,
                      rc_index:W256.t, da:W256.t, de:W256.t, di:W256.t,
                      do_0:W256.t, du:W256.t) : W256.t Array25.t *
                                                W256.t Array25.t = {
    var t256:W256.t;
    var bba:W256.t;
    var bbe:W256.t;
    var bbi:W256.t;
    var bbo:W256.t;
    var bbu:W256.t;
    t256 <- a_4x.[0];
    t256 <- (t256 `^` da);
    a_4x.[0] <- t256;
    bba <- t256;
    t256 <- a_4x.[6];
    t256 <- (t256 `^` de);
    a_4x.[6] <- t256;
    bbe <@ __rol_4u64 (t256, 44);
    t256 <- a_4x.[12];
    t256 <- (t256 `^` di);
    a_4x.[12] <- t256;
    bbi <@ __rol_4u64 (t256, 43);
    t256 <- (VPANDN_256 bbe bbi);
    t256 <- (t256 `^` bba);
    t256 <- (t256 `^` rc_index);
    e_4x.[0] <- t256;
    t256 <- a_4x.[18];
    t256 <- (t256 `^` do_0);
    a_4x.[18] <- t256;
    bbo <@ __rol_4u64 (t256, 21);
    t256 <- (VPANDN_256 bbi bbo);
    t256 <- (t256 `^` bbe);
    e_4x.[1] <- t256;
    t256 <- a_4x.[24];
    t256 <- (t256 `^` du);
    a_4x.[24] <- t256;
    bbu <@ __rol_4u64 (t256, 14);
    t256 <- (VPANDN_256 bbo bbu);
    t256 <- (t256 `^` bbi);
    e_4x.[2] <- t256;
    t256 <- (VPANDN_256 bbu bba);
    t256 <- (t256 `^` bbo);
    e_4x.[3] <- t256;
    t256 <- (VPANDN_256 bba bbe);
    t256 <- (t256 `^` bbu);
    e_4x.[4] <- t256;
    return (a_4x, e_4x);
  }
  proc __third_last (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t, da:W256.t,
                     de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : 
  W256.t Array25.t * W256.t Array25.t = {
    var t256:W256.t;
    var bga:W256.t;
    var bge:W256.t;
    var bgi:W256.t;
    var bgo:W256.t;
    var bgu:W256.t;
    t256 <- a_4x.[3];
    t256 <- (t256 `^` do_0);
    a_4x.[3] <- t256;
    bga <@ __rol_4u64 (t256, 28);
    t256 <- a_4x.[9];
    t256 <- (t256 `^` du);
    a_4x.[9] <- t256;
    bge <@ __rol_4u64 (t256, 20);
    t256 <- a_4x.[10];
    t256 <- (t256 `^` da);
    a_4x.[10] <- t256;
    bgi <@ __rol_4u64 (t256, 3);
    t256 <- (VPANDN_256 bge bgi);
    t256 <- (t256 `^` bga);
    e_4x.[5] <- t256;
    t256 <- a_4x.[16];
    t256 <- (t256 `^` de);
    a_4x.[16] <- t256;
    bgo <@ __rol_4u64 (t256, 45);
    t256 <- (VPANDN_256 bgi bgo);
    t256 <- (t256 `^` bge);
    e_4x.[6] <- t256;
    t256 <- a_4x.[22];
    t256 <- (t256 `^` di);
    a_4x.[22] <- t256;
    bgu <@ __rol_4u64 (t256, 61);
    t256 <- (VPANDN_256 bgo bgu);
    t256 <- (t256 `^` bgi);
    e_4x.[7] <- t256;
    t256 <- (VPANDN_256 bgu bga);
    t256 <- (t256 `^` bgo);
    e_4x.[8] <- t256;
    t256 <- (VPANDN_256 bga bge);
    t256 <- (t256 `^` bgu);
    e_4x.[9] <- t256;
    return (a_4x, e_4x);
  }
  proc __fourth_last (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t,
                      da:W256.t, de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : 
  W256.t Array25.t * W256.t Array25.t = {
    var t256:W256.t;
    var bka:W256.t;
    var bke:W256.t;
    var bki:W256.t;
    var bko:W256.t;
    var bku:W256.t;
    t256 <- a_4x.[1];
    t256 <- (t256 `^` de);
    a_4x.[1] <- t256;
    bka <@ __rol_4u64 (t256, 1);
    t256 <- a_4x.[7];
    t256 <- (t256 `^` di);
    a_4x.[7] <- t256;
    bke <@ __rol_4u64 (t256, 6);
    t256 <- a_4x.[13];
    t256 <- (t256 `^` do_0);
    a_4x.[13] <- t256;
    bki <@ __rol_4u64 (t256, 25);
    t256 <- (VPANDN_256 bke bki);
    t256 <- (t256 `^` bka);
    e_4x.[10] <- t256;
    t256 <- a_4x.[19];
    t256 <- (t256 `^` du);
    a_4x.[19] <- t256;
    bko <@ __rol_4u64_rho8 (t256);
    t256 <- (VPANDN_256 bki bko);
    t256 <- (t256 `^` bke);
    e_4x.[11] <- t256;
    t256 <- a_4x.[20];
    t256 <- (t256 `^` da);
    a_4x.[20] <- t256;
    bku <@ __rol_4u64 (t256, 18);
    t256 <- (VPANDN_256 bko bku);
    t256 <- (t256 `^` bki);
    e_4x.[12] <- t256;
    t256 <- (VPANDN_256 bku bka);
    t256 <- (t256 `^` bko);
    e_4x.[13] <- t256;
    t256 <- (VPANDN_256 bka bke);
    t256 <- (t256 `^` bku);
    e_4x.[14] <- t256;
    return (a_4x, e_4x);
  }
  proc __fifth_last (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t, da:W256.t,
                     de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : 
  W256.t Array25.t * W256.t Array25.t = {
    var t256:W256.t;
    var bma:W256.t;
    var bme:W256.t;
    var bmi:W256.t;
    var bmo:W256.t;
    var bmu:W256.t;
    t256 <- a_4x.[4];
    t256 <- (t256 `^` du);
    a_4x.[4] <- t256;
    bma <@ __rol_4u64 (t256, 27);
    t256 <- a_4x.[5];
    t256 <- (t256 `^` da);
    a_4x.[5] <- t256;
    bme <@ __rol_4u64 (t256, 36);
    t256 <- a_4x.[11];
    t256 <- (t256 `^` de);
    a_4x.[11] <- t256;
    bmi <@ __rol_4u64 (t256, 10);
    t256 <- (VPANDN_256 bme bmi);
    t256 <- (t256 `^` bma);
    e_4x.[15] <- t256;
    t256 <- a_4x.[17];
    t256 <- (t256 `^` di);
    a_4x.[17] <- t256;
    bmo <@ __rol_4u64 (t256, 15);
    t256 <- (VPANDN_256 bmi bmo);
    t256 <- (t256 `^` bme);
    e_4x.[16] <- t256;
    t256 <- a_4x.[23];
    t256 <- (t256 `^` do_0);
    a_4x.[23] <- t256;
    bmu <@ __rol_4u64_rho56 (t256);
    t256 <- (VPANDN_256 bmo bmu);
    t256 <- (t256 `^` bmi);
    e_4x.[17] <- t256;
    t256 <- (VPANDN_256 bmu bma);
    t256 <- (t256 `^` bmo);
    e_4x.[18] <- t256;
    t256 <- (VPANDN_256 bma bme);
    t256 <- (t256 `^` bmu);
    e_4x.[19] <- t256;
    return (a_4x, e_4x);
  }
  proc __sixth_last (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t, da:W256.t,
                     de:W256.t, di:W256.t, do_0:W256.t, du:W256.t) : 
  W256.t Array25.t * W256.t Array25.t = {
    var t256:W256.t;
    var bsa:W256.t;
    var bse:W256.t;
    var bsi:W256.t;
    var bso:W256.t;
    var bsu:W256.t;
    t256 <- a_4x.[2];
    t256 <- (t256 `^` di);
    a_4x.[2] <- t256;
    bsa <@ __rol_4u64 (t256, 62);
    t256 <- a_4x.[8];
    t256 <- (t256 `^` do_0);
    a_4x.[8] <- t256;
    bse <@ __rol_4u64 (t256, 55);
    t256 <- a_4x.[14];
    t256 <- (t256 `^` du);
    a_4x.[14] <- t256;
    bsi <@ __rol_4u64 (t256, 39);
    t256 <- (VPANDN_256 bse bsi);
    t256 <- (t256 `^` bsa);
    e_4x.[20] <- t256;
    t256 <- a_4x.[15];
    t256 <- (t256 `^` da);
    a_4x.[15] <- t256;
    bso <@ __rol_4u64 (t256, 41);
    t256 <- (VPANDN_256 bsi bso);
    t256 <- (t256 `^` bse);
    e_4x.[21] <- t256;
    t256 <- a_4x.[21];
    t256 <- (t256 `^` de);
    a_4x.[21] <- t256;
    bsu <@ __rol_4u64 (t256, 2);
    t256 <- (VPANDN_256 bso bsu);
    t256 <- (t256 `^` bsi);
    e_4x.[22] <- t256;
    t256 <- (VPANDN_256 bsu bsa);
    t256 <- (t256 `^` bso);
    e_4x.[23] <- t256;
    t256 <- (VPANDN_256 bsa bse);
    t256 <- (t256 `^` bsu);
    e_4x.[24] <- t256;
    return (a_4x, e_4x);
  }
  proc _theta_rho_pi_chi_iota_prepare_theta_even (a_4x:W256.t Array25.t,
                                                  e_4x:W256.t Array25.t,
                                                  rc_index:W256.t, ca:W256.t,
                                                  ce:W256.t, ci:W256.t,
                                                  co:W256.t, cu:W256.t) : 
  W256.t Array25.t * W256.t Array25.t * W256.t * W256.t * W256.t * W256.t *
  W256.t = {
    var da:W256.t;
    var de:W256.t;
    var di:W256.t;
    var do_0:W256.t;
    var du:W256.t;
    (da, de, di, do_0, du) <@ __first (ca, ce, ci, co, cu);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ __second_even (a_4x, e_4x, rc_index,
    ca, ce, ci, co, cu, da, de, di, do_0, du);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ __third_even (a_4x, e_4x, ca, 
    ce, ci, co, cu, da, de, di, do_0, du);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ __fourth_even (a_4x, e_4x, ca, 
    ce, ci, co, cu, da, de, di, do_0, du);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ __fifth_even (a_4x, e_4x, ca, 
    ce, ci, co, cu, da, de, di, do_0, du);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ __sixth_even (a_4x, e_4x, ca, 
    ce, ci, co, cu, da, de, di, do_0, du);
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc _theta_rho_pi_chi_iota_prepare_theta_odd (a_4x:W256.t Array25.t,
                                                 e_4x:W256.t Array25.t,
                                                 rc_index:W256.t, ca:W256.t,
                                                 ce:W256.t, ci:W256.t,
                                                 co:W256.t, cu:W256.t) : 
  W256.t Array25.t * W256.t Array25.t * W256.t * W256.t * W256.t * W256.t *
  W256.t = {
    var da:W256.t;
    var de:W256.t;
    var di:W256.t;
    var do_0:W256.t;
    var du:W256.t;
    (da, de, di, do_0, du) <@ __first (ca, ce, ci, co, cu);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ __second_odd (a_4x, e_4x, rc_index,
    ca, ce, ci, co, cu, da, de, di, do_0, du);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ __third_odd (a_4x, e_4x, ca, 
    ce, ci, co, cu, da, de, di, do_0, du);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ __fourth_odd (a_4x, e_4x, ca, 
    ce, ci, co, cu, da, de, di, do_0, du);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ __fifth_odd (a_4x, e_4x, ca, 
    ce, ci, co, cu, da, de, di, do_0, du);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ __sixth_odd (a_4x, e_4x, ca, 
    ce, ci, co, cu, da, de, di, do_0, du);
    return (a_4x, e_4x, ca, ce, ci, co, cu);
  }
  proc __theta_rho_pi_chi_iota (a_4x:W256.t Array25.t, e_4x:W256.t Array25.t,
                                rc_index:W256.t, ca:W256.t, ce:W256.t,
                                ci:W256.t, co:W256.t, cu:W256.t) : W256.t Array25.t *
                                                                   W256.t Array25.t = {
    var da:W256.t;
    var de:W256.t;
    var di:W256.t;
    var do_0:W256.t;
    var du:W256.t;
    (da, de, di, do_0, du) <@ __first (ca, ce, ci, co, cu);
    (a_4x, e_4x) <@ __second_last (a_4x, e_4x, rc_index, da, de, di, 
    do_0, du);
    (a_4x, e_4x) <@ __third_last (a_4x, e_4x, da, de, di, do_0, du);
    (a_4x, e_4x) <@ __fourth_last (a_4x, e_4x, da, de, di, do_0, du);
    (a_4x, e_4x) <@ __fifth_last (a_4x, e_4x, da, de, di, do_0, du);
    (a_4x, e_4x) <@ __sixth_last (a_4x, e_4x, da, de, di, do_0, du);
    return (a_4x, e_4x);
  }
  proc __keccakf1600_avx2x4_alt (a_4x:W256.t Array25.t) : W256.t Array25.t = {
    var rC:W64.t Array24.t;
    var ca:W256.t;
    var ce:W256.t;
    var ci:W256.t;
    var co:W256.t;
    var cu:W256.t;
    var rc_index:W256.t;
    var e_4x:W256.t Array25.t;
    e_4x <- witness;
    rC <- witness;
    rC <- kECCAK1600_RC;
    (ca, ce, ci, co, cu) <@ __prepare_theta (a_4x);
    rc_index <- (VPBROADCAST_4u64 rC.[0]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[1]);
    (e_4x, a_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_odd (
    e_4x, a_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[2]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[3]);
    (e_4x, a_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_odd (
    e_4x, a_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[4]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[5]);
    (e_4x, a_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_odd (
    e_4x, a_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[6]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[7]);
    (e_4x, a_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_odd (
    e_4x, a_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[8]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[9]);
    (e_4x, a_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_odd (
    e_4x, a_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[10]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[11]);
    (e_4x, a_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_odd (
    e_4x, a_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[12]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[13]);
    (e_4x, a_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_odd (
    e_4x, a_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[14]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[15]);
    (e_4x, a_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_odd (
    e_4x, a_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[16]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[17]);
    (e_4x, a_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_odd (
    e_4x, a_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[18]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[19]);
    (e_4x, a_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_odd (
    e_4x, a_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[20]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[21]);
    (e_4x, a_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_odd (
    e_4x, a_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[22]);
    (a_4x, e_4x, ca, ce, ci, co, cu) <@ _theta_rho_pi_chi_iota_prepare_theta_even (
    a_4x, e_4x, rc_index, ca, ce, ci, co, cu);
    rc_index <- (VPBROADCAST_4u64 rC.[23]);
    (e_4x, a_4x) <@ __theta_rho_pi_chi_iota (e_4x, a_4x, rc_index, ca, 
    ce, ci, co, cu);
    return a_4x;
  }
  proc _keccakf1600_avx2x4_alt (a:W256.t Array25.t) : W256.t Array25.t = {
    
    a <@ __keccakf1600_avx2x4_alt (a);
    return a;
  }
  proc __f1600_loopbody_native (st:W256.t Array25.t, rol8:W256.t Array1.t,
                                rol56:W256.t Array1.t, rC:W64.t Array24.t,
                                i:int, y10:W256.t, y14:W256.t, y8:W256.t,
                                y15:W256.t, y9:W256.t, y13:W256.t, y3:W256.t,
                                y7:W256.t, y2:W256.t) : W256.t Array25.t *
                                                        W256.t * W256.t *
                                                        W256.t * W256.t *
                                                        W256.t * W256.t *
                                                        W256.t * W256.t *
                                                        W256.t = {
    var i0:int;
    var i1:int;
    var i2:int;
    var i3:int;
    var i4:int;
    var i5:int;
    var i6:int;
    var i7:int;
    var i8:int;
    var i9:int;
    var i10:int;
    var i11:int;
    var i12:int;
    var i13:int;
    var i14:int;
    var i15:int;
    var i16:int;
    var i17:int;
    var i18:int;
    var i19:int;
    var i20:int;
    var i21:int;
    var i22:int;
    var i23:int;
    var y4:W256.t;
    var y0:W256.t;
    var y11:W256.t;
    var y12:W256.t;
    var y1:W256.t;
    var y6:W256.t;
    var y5:W256.t;
    i0 <- 0;
    i1 <- 1;
    i2 <- 2;
    i3 <- 3;
    i4 <- 4;
    i5 <- 5;
    i6 <- 6;
    i7 <- 9;
    i8 <- 10;
    i9 <- 13;
    i10 <- 14;
    i11 <- 16;
    i12 <- 17;
    i13 <- 19;
    i14 <- 20;
    i15 <- 23;
    i16 <- 7;
    i17 <- 8;
    i18 <- 11;
    i19 <- 12;
    i20 <- 15;
    i21 <- 18;
    i22 <- 21;
    i23 <- 22;
    y4 <- st.[i5];
    y0 <- (y9 `^` st.[i14]);
    st.[i16] <- y9;
    y9 <- y10;
    y11 <- st.[i6];
    y12 <- st.[i11];
    st.[i18] <- y3;
    y1 <- (y4 `^` st.[i8]);
    y10 <- st.[i2];
    st.[i17] <- y4;
    y12 <- (y12 `^` y3);
    y6 <- st.[i1];
    y4 <- st.[i10];
    st.[i21] <- y14;
    y0 <- (y0 `^` y1);
    y1 <- (y11 `^` y8);
    y11 <- (y7 `^` st.[i12]);
    st.[i20] <- y10;
    y12 <- (y12 `^` y1);
    y1 <- (y9 `^` y15);
    y3 <- st.[i7];
    st.[i19] <- y8;
    y11 <- (y11 `^` y1);
    y1 <- (y14 `^` st.[i9]);
    y12 <- (y12 `^` y6);
    y8 <- st.[i3];
    y11 <- (y11 `^` y10);
    y10 <- (y13 `^` st.[i15]);
    y3 <- (y3 `^` y4);
    st.[i22] <- y4;
    y4 <- (VPSRL_4u64 y12 (W128.of_int 63));
    y5 <- (VPSRL_4u64 y11 (W128.of_int 63));
    y0 <- (y0 `^` st.[i0]);
    y10 <- (y10 `^` y1);
    y1 <- st.[i4];
    y10 <- (y10 `^` y8);
    y14 <- y1;
    y1 <- (y2 `^` st.[i13]);
    st.[i23] <- y14;
    y1 <- (y1 `^` y3);
    y3 <- (VPSLL_4u64 y12 (W128.of_int 1));
    y3 <- (y3 `|` y4);
    y4 <- (VPSLL_4u64 y11 (W128.of_int 1));
    y1 <- (y1 `^` y14);
    y4 <- (y4 `|` y5);
    y14 <- (VPSRL_4u64 y10 (W128.of_int 63));
    y3 <- (y3 `^` y1);
    y5 <- (VPSLL_4u64 y10 (W128.of_int 1));
    y4 <- (y4 `^` y0);
    y5 <- (y5 `|` y14);
    y6 <- (y4 `^` y6);
    y5 <- (y5 `^` y12);
    y12 <- (VPSRL_4u64 y1 (W128.of_int 63));
    y1 <- (VPSLL_4u64 y1 (W128.of_int 1));
    y7 <- (y5 `^` y7);
    y9 <- (y5 `^` y9);
    y1 <- (y1 `|` y12);
    y12 <- (y3 `^` st.[i0]);
    y1 <- (y1 `^` y11);
    y11 <- (VPSRL_4u64 y0 (W128.of_int 63));
    y0 <- (VPSLL_4u64 y0 (W128.of_int 1));
    y13 <- (y1 `^` y13);
    y8 <- (y1 `^` y8);
    y0 <- (y0 `|` y11);
    y0 <- (y0 `^` y10);
    y10 <- (y4 `^` st.[i6]);
    y2 <- (y0 `^` y2);
    y11 <- (VPSRL_4u64 y10 (W128.of_int 20));
    y10 <- (VPSLL_4u64 y10 (W128.of_int 44));
    y10 <- (y10 `|` y11);
    y11 <- (y5 `^` y15);
    y15 <- (VPBROADCAST_4u64 rC.[(W64.to_uint (W64.of_int i))]);
    y14 <- (VPSRL_4u64 y11 (W128.of_int 21));
    y11 <- (VPSLL_4u64 y11 (W128.of_int 43));
    y11 <- (y11 `|` y14);
    y14 <- ((invw y10) `&` y11);
    y14 <- (y14 `^` y15);
    y15 <- (y14 `^` y12);
    y14 <- (VPSRL_4u64 y13 (W128.of_int 43));
    y13 <- (VPSLL_4u64 y13 (W128.of_int 21));
    st.[i0] <- y15;
    y13 <- (y13 `|` y14);
    y14 <- ((invw y11) `&` y13);
    y15 <- (y14 `^` y10);
    y14 <- (VPSRL_4u64 y2 (W128.of_int 50));
    y2 <- (VPSLL_4u64 y2 (W128.of_int 14));
    st.[i1] <- y15;
    y2 <- (y2 `|` y14);
    y14 <- ((invw y13) `&` y2);
    y11 <- (y14 `^` y11);
    st.[i2] <- y11;
    y11 <- ((invw y2) `&` y12);
    y12 <- ((invw y12) `&` y10);
    y11 <- (y11 `^` y13);
    st.[i3] <- y11;
    y11 <- (y12 `^` y2);
    y2 <- (VPSRL_4u64 y8 (W128.of_int 36));
    y8 <- (VPSLL_4u64 y8 (W128.of_int 28));
    st.[i4] <- y11;
    y8 <- (y8 `|` y2);
    y2 <- (y0 `^` st.[i7]);
    y10 <- (VPSRL_4u64 y2 (W128.of_int 44));
    y2 <- (VPSLL_4u64 y2 (W128.of_int 20));
    y2 <- (y2 `|` y10);
    y10 <- (y3 `^` st.[i8]);
    y11 <- (VPSRL_4u64 y10 (W128.of_int 61));
    y10 <- (VPSLL_4u64 y10 (W128.of_int 3));
    y10 <- (y10 `|` y11);
    y11 <- ((invw y2) `&` y10);
    y11 <- (y11 `^` y8);
    st.[i5] <- y11;
    y11 <- (y4 `^` st.[i11]);
    y12 <- (VPSRL_4u64 y11 (W128.of_int 19));
    y11 <- (VPSLL_4u64 y11 (W128.of_int 45));
    y11 <- (y11 `|` y12);
    y12 <- ((invw y10) `&` y11);
    y12 <- (y12 `^` y2);
    st.[i6] <- y12;
    y12 <- (VPSRL_4u64 y7 (W128.of_int 3));
    y7 <- (VPSLL_4u64 y7 (W128.of_int 61));
    y7 <- (y7 `|` y12);
    y12 <- ((invw y11) `&` y7);
    y10 <- (y12 `^` y10);
    y12 <- ((invw y7) `&` y8);
    y8 <- ((invw y8) `&` y2);
    y2 <- (VPSRL_4u64 y6 (W128.of_int 63));
    y6 <- (VPSLL_4u64 y6 (W128.of_int 1));
    y14 <- (y12 `^` y11);
    y6 <- (y6 `|` y2);
    y2 <- (VPSRL_4u64 y9 (W128.of_int 58));
    y12 <- (y8 `^` y7);
    y9 <- (VPSLL_4u64 y9 (W128.of_int 6));
    st.[i7] <- y12;
    y7 <- (y0 `^` st.[i13]);
    y9 <- (y9 `|` y2);
    y2 <- (y1 `^` st.[i9]);
    y7 <- (VPSHUFB_256 y7 rol8.[0]);
    y11 <- (VPSRL_4u64 y2 (W128.of_int 39));
    y2 <- (VPSLL_4u64 y2 (W128.of_int 25));
    y11 <- (y11 `|` y2);
    y2 <- ((invw y9) `&` y11);
    y8 <- ((invw y11) `&` y7);
    y12 <- (y2 `^` y6);
    y2 <- (y3 `^` st.[i14]);
    y8 <- (y8 `^` y9);
    st.[i8] <- y12;
    y12 <- (VPSRL_4u64 y2 (W128.of_int 46));
    y2 <- (VPSLL_4u64 y2 (W128.of_int 18));
    y2 <- (y12 `|` y2);
    y12 <- ((invw y7) `&` y2);
    y15 <- (y12 `^` y11);
    y11 <- ((invw y2) `&` y6);
    y6 <- ((invw y6) `&` y9);
    y12 <- (y11 `^` y7);
    st.[i9] <- y12;
    y12 <- (y6 `^` y2);
    y6 <- (y0 `^` st.[i23]);
    y0 <- (y0 `^` st.[i22]);
    st.[i10] <- y12;
    y2 <- (VPSRL_4u64 y6 (W128.of_int 37));
    y6 <- (VPSLL_4u64 y6 (W128.of_int 27));
    y2 <- (y2 `|` y6);
    y6 <- (y3 `^` st.[i17]);
    y3 <- (y3 `^` st.[i16]);
    y7 <- (VPSRL_4u64 y6 (W128.of_int 28));
    y6 <- (VPSLL_4u64 y6 (W128.of_int 36));
    y7 <- (y7 `|` y6);
    y6 <- (y4 `^` st.[i19]);
    y4 <- (y4 `^` st.[i18]);
    y12 <- (VPSRL_4u64 y6 (W128.of_int 54));
    y6 <- (VPSLL_4u64 y6 (W128.of_int 10));
    y12 <- (y12 `|` y6);
    y6 <- (y5 `^` st.[i12]);
    y5 <- (y5 `^` st.[i20]);
    y9 <- ((invw y7) `&` y12);
    y11 <- (VPSRL_4u64 y6 (W128.of_int 49));
    y6 <- (VPSLL_4u64 y6 (W128.of_int 15));
    y9 <- (y9 `^` y2);
    y11 <- (y11 `|` y6);
    y6 <- ((invw y12) `&` y11);
    y6 <- (y6 `^` y7);
    st.[i11] <- y6;
    y6 <- (y1 `^` st.[i15]);
    y1 <- (y1 `^` st.[i21]);
    y6 <- (VPSHUFB_256 y6 rol56.[0]);
    y13 <- ((invw y11) `&` y6);
    y13 <- (y13 `^` y12);
    st.[i12] <- y13;
    y13 <- ((invw y6) `&` y2);
    y2 <- ((invw y2) `&` y7);
    y2 <- (y2 `^` y6);
    y6 <- (VPSRL_4u64 y4 (W128.of_int 62));
    y13 <- (y13 `^` y11);
    st.[i13] <- y2;
    y2 <- (VPSRL_4u64 y5 (W128.of_int 2));
    y5 <- (VPSLL_4u64 y5 (W128.of_int 62));
    y2 <- (y2 `|` y5);
    y5 <- (VPSRL_4u64 y1 (W128.of_int 9));
    y1 <- (VPSLL_4u64 y1 (W128.of_int 55));
    y4 <- (VPSLL_4u64 y4 (W128.of_int 2));
    y1 <- (y5 `|` y1);
    y5 <- (VPSRL_4u64 y0 (W128.of_int 25));
    y4 <- (y6 `|` y4);
    y0 <- (VPSLL_4u64 y0 (W128.of_int 39));
    y5 <- (y5 `|` y0);
    y0 <- ((invw y1) `&` y5);
    y0 <- (y0 `^` y2);
    st.[i14] <- y0;
    y0 <- (VPSRL_4u64 y3 (W128.of_int 23));
    y3 <- (VPSLL_4u64 y3 (W128.of_int 41));
    y0 <- (y0 `|` y3);
    y7 <- ((invw y0) `&` y4);
    y3 <- ((invw y5) `&` y0);
    y7 <- (y7 `^` y5);
    y5 <- ((invw y4) `&` y2);
    y2 <- ((invw y2) `&` y1);
    y5 <- (y5 `^` y0);
    y3 <- (y3 `^` y1);
    y2 <- (y2 `^` y4);
    st.[i15] <- y5;
    return (st, y10, y14, y8, y15, y9, y13, y3, y7, y2);
  }
  proc __regs_fetch (st:W256.t Array25.t) : W256.t * W256.t * W256.t *
                                            W256.t * W256.t * W256.t *
                                            W256.t * W256.t * W256.t = {
    var y10:W256.t;
    var y14:W256.t;
    var y8:W256.t;
    var y15:W256.t;
    var y9:W256.t;
    var y13:W256.t;
    var y3:W256.t;
    var y7:W256.t;
    var y2:W256.t;
    y10 <- st.[7];
    y14 <- st.[8];
    y8 <- st.[11];
    y15 <- st.[12];
    y9 <- st.[15];
    y13 <- st.[18];
    y3 <- st.[21];
    y7 <- st.[22];
    y2 <- st.[24];
    return (y10, y14, y8, y15, y9, y13, y3, y7, y2);
  }
  proc __regs_unfetch (st:W256.t Array25.t, y10:W256.t, y14:W256.t,
                       y8:W256.t, y15:W256.t, y9:W256.t, y13:W256.t,
                       y3:W256.t, y7:W256.t, y2:W256.t) : W256.t Array25.t = {
    
    st.[7] <- y10;
    st.[8] <- y14;
    st.[11] <- y8;
    st.[12] <- y15;
    st.[15] <- y9;
    st.[18] <- y13;
    st.[21] <- y3;
    st.[22] <- y7;
    st.[24] <- y2;
    return st;
  }
  proc __keccakf1600_avx2x4_nat (st:W256.t Array25.t) : W256.t Array25.t = {
    var y10:W256.t;
    var y14:W256.t;
    var y8:W256.t;
    var y15:W256.t;
    var y9:W256.t;
    var y13:W256.t;
    var y3:W256.t;
    var y7:W256.t;
    var y2:W256.t;
    var rol8:W256.t Array1.t;
    var rol56:W256.t Array1.t;
    var rc:W64.t Array24.t;
    var i:int;
    rc <- witness;
    rol56 <- witness;
    rol8 <- witness;
    (y10, y14, y8, y15, y9, y13, y3, y7, y2) <@ __regs_fetch (st);
    rol8 <- rOL8;
    rol56 <- rOL56;
    rc <- kECCAK1600_RC;
    i <- 0;
    (st, y10, y14, y8, y15, y9, y13, y3, y7, y2) <@ __f1600_loopbody_native (
    st, rol8, rol56, rc, i, y10, y14, y8, y15, y9, y13, y3, y7, y2);
    i <- (i + 1);
    while ((i < 24)) {
      (st, y10, y14, y8, y15, y9, y13, y3, y7, y2) <@ __f1600_loopbody_native (
      st, rol8, rol56, rc, i, y10, y14, y8, y15, y9, y13, y3, y7, y2);
      i <- (i + 1);
    }
    st <@ __regs_unfetch (st, y10, y14, y8, y15, y9, y13, y3, y7, y2);
    return st;
  }
  proc _keccakf1600_avx2x4_nat (st:W256.t Array25.t) : W256.t Array25.t = {
    
    st <@ __keccakf1600_avx2x4_nat (st);
    return st;
  }
  proc _keccakf1600_avx2x4 (a:W256.t Array25.t) : W256.t Array25.t = {
    var kECCAK_F:int;
    kECCAK_F <@ __KECCAK_Fx4 ((2 + 512));
    if ((kECCAK_F = 256)) {
      a <@ _keccakf1600_avx2x4_alt (a);
    } else {
      if ((kECCAK_F = 512)) {
        a <@ _keccakf1600_avx2x4_nat (a);
      } else {
        a <@ _keccakf1600_avx2x4_ref (a);
      }
    }
    return a;
  }
  proc __state_init_avx2x4 (st:W256.t Array25.t) : W256.t Array25.t = {
    var z256:W256.t;
    var i:int;
    z256 <- (set0_256);
    i <- 0;
    while ((i < (32 * 25))) {
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set256_direct (WArray800.init256 (fun i_0 => st.[i_0])) 
      i z256)));
      i <- (i + 32);
    }
    return st;
  }
  proc __addratebit_avx2x4 (st:W256.t Array25.t, rATE8:int) : W256.t Array25.t = {
    var t64:W64.t;
    var t256:W256.t;
    t64 <- (W64.of_int (1 `<<` (((8 * rATE8) - 1) %% 64)));
    t256 <- (VPBROADCAST_4u64 t64);
    t256 <- (t256 `^` st.[((rATE8 - 1) %/ 8)]);
    st.[((rATE8 - 1) %/ 8)] <- t256;
    return st;
  }
  proc a1____a_ilen_read_upto8_at (buf:W8.t Array1.t, offset:int, dELTA:int,
                                   lEN:int, tRAIL:int, cUR:int, aT:int) : 
  int * int * int * int * W64.t = {
    var w:W64.t;
    var t16:W64.t;
    var t8:W64.t;
    if (((((lEN < 0) \/ (aT < cUR)) \/ ((cUR + 8) <= aT)) \/
        ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray1.init8 (fun i => buf.[i])) (offset + dELTA));
        w <@ __SHLQ (w, (aT - cUR));
        dELTA <- (dELTA + ((cUR + 8) - aT));
        lEN <- (lEN - ((cUR + 8) - aT));
        aT <- (cUR + 8);
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray1.init8 (fun i => buf.[i])) (offset + dELTA)));
          w <@ __SHLQ (w, (aT - cUR));
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          lEN <- (lEN - (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          aT <- (((cUR + 8) <= (aT + 4)) ? (cUR + 8) : (aT + 4));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT < (cUR + 8)) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray1.init8 (fun i => buf.[i])) (offset + dELTA)));
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          lEN <- (lEN - (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          t16 <@ __SHLQ (t16, (aT - cUR));
          w <- (w `|` t16);
          aT <- (((cUR + 8) <= (aT + 2)) ? (cUR + 8) : (aT + 2));
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (1 <= lEN))) {
          t8 <-
          (zeroextu64
          (get8_direct (WArray1.init8 (fun i => buf.[i])) (offset + dELTA)));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
          t8 <@ __SHLQ (t8, (aT - cUR));
          w <- (w `|` t8);
          aT <- (aT + 1);
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (tRAIL <> 0))) {
          t8 <- (W64.of_int (tRAIL %% 256));
          t8 <- (t8 `<<` (W8.of_int (8 * (aT - cUR))));
          w <- (w `|` t8);
          aT <- (aT + 1);
          tRAIL <- 0;
        } else {
          
        }
      }
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a1____addstate_avx2x4 (st:W256.t Array25.t, aT:int,
                              buf0:W8.t Array1.t, buf1:W8.t Array1.t,
                              buf2:W8.t Array1.t, buf3:W8.t Array1.t,
                              offset:int, _LEN:int, _TRAILB:int) : W256.t Array25.t *
                                                                   int * int = {
    var dELTA:int;
    var aT8:int;
    var t0:W64.t;
    var t1:W64.t;
    var t2:W64.t;
    var t3:W64.t;
    var at:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    var  _3:int;
    var  _4:int;
    var  _5:int;
    var  _6:int;
    var  _7:int;
    var  _8:int;
    var  _9:int;
    var  _10:int;
    var  _11:int;
    var  _12:int;
    var  _13:int;
    var  _14:int;
    var  _15:int;
    var  _16:int;
    var  _17:int;
    var  _18:int;
    var  _19:int;
    var  _20:int;
    var  _21:int;
    var  _22:int;
    var  _23:int;
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if (((aT8 %% 8) <> 0)) {
      ( _0,  _1,  _2,  _3, t0) <@ a1____a_ilen_read_upto8_at (buf0, offset,
      dELTA, _LEN, _TRAILB, aT, aT8);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i]))
      ((4 * (aT %/ 8)) + 0)
      ((get64 (WArray800.init256 (fun i => st.[i])) ((4 * (aT %/ 8)) + 0)) `^`
      t0))));
      ( _4,  _5,  _6,  _7, t1) <@ a1____a_ilen_read_upto8_at (buf1, offset,
      dELTA, _LEN, _TRAILB, aT, aT8);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i]))
      ((4 * (aT %/ 8)) + 1)
      ((get64 (WArray800.init256 (fun i => st.[i])) ((4 * (aT %/ 8)) + 1)) `^`
      t1))));
      ( _8,  _9,  _10,  _11, t2) <@ a1____a_ilen_read_upto8_at (buf2, 
      offset, dELTA, _LEN, _TRAILB, aT, aT8);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i]))
      ((4 * (aT %/ 8)) + 2)
      ((get64 (WArray800.init256 (fun i => st.[i])) ((4 * (aT %/ 8)) + 2)) `^`
      t2))));
      (dELTA, _LEN, _TRAILB, aT8, t3) <@ a1____a_ilen_read_upto8_at (
      buf3, offset, dELTA, _LEN, _TRAILB, aT, aT8);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i]))
      ((4 * (aT %/ 8)) + 3)
      ((get64 (WArray800.init256 (fun i => st.[i])) ((4 * (aT %/ 8)) + 3)) `^`
      t3))));
      aT <- aT8;
    } else {
      
    }
    offset <- (offset + dELTA);
    at <- (4 * (aT %/ 8));
    while ((at < ((4 * (aT %/ 8)) + (4 * (_LEN %/ 8))))) {
      t0 <- (get64_direct (WArray1.init8 (fun i => buf0.[i])) offset);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 0)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 0)) `^` t0))));
      t1 <- (get64_direct (WArray1.init8 (fun i => buf1.[i])) offset);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 1)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 1)) `^` t1))));
      t2 <- (get64_direct (WArray1.init8 (fun i => buf2.[i])) offset);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 2)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 2)) `^` t2))));
      t3 <- (get64_direct (WArray1.init8 (fun i => buf3.[i])) offset);
      offset <- (offset + 8);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 3)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 3)) `^` t3))));
      at <- (at + 4);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      ( _12,  _13,  _14,  _15, t0) <@ a1____a_ilen_read_upto8_at (buf0,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 0)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 0)) `^` t0))));
      ( _16,  _17,  _18,  _19, t1) <@ a1____a_ilen_read_upto8_at (buf1,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 1)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 1)) `^` t1))));
      ( _20,  _21,  _22,  _23, t2) <@ a1____a_ilen_read_upto8_at (buf2,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 2)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 2)) `^` t2))));
      (dELTA, _LEN, _TRAILB, aT, t3) <@ a1____a_ilen_read_upto8_at (buf3,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 3)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 3)) `^` t3))));
      offset <- (offset + dELTA);
    } else {
      
    }
    return (st, aT, offset);
  }
  proc a1____absorb_avx2x4 (st:W256.t Array25.t, aT:int, buf0:W8.t Array1.t,
                            buf1:W8.t Array1.t, buf2:W8.t Array1.t,
                            buf3:W8.t Array1.t, _TRAILB:int, _RATE8:int) : 
  W256.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 1;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a1____addstate_avx2x4 (st, aT, buf0, buf1, 
      buf2, buf3, offset, (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      st <@ _keccakf1600_avx2x4 (st);
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a1____addstate_avx2x4 (st, 0, buf0, buf1, 
        buf2, buf3, offset, _RATE8, 0);
        st <@ _keccakf1600_avx2x4 (st);
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a1____addstate_avx2x4 (st, aT, buf0, buf1, buf2, 
    buf3, offset, _LEN, _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit_avx2x4 (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a2____a_ilen_read_upto8_at (buf:W8.t Array2.t, offset:int, dELTA:int,
                                   lEN:int, tRAIL:int, cUR:int, aT:int) : 
  int * int * int * int * W64.t = {
    var w:W64.t;
    var t16:W64.t;
    var t8:W64.t;
    if (((((lEN < 0) \/ (aT < cUR)) \/ ((cUR + 8) <= aT)) \/
        ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray2.init8 (fun i => buf.[i])) (offset + dELTA));
        w <@ __SHLQ (w, (aT - cUR));
        dELTA <- (dELTA + ((cUR + 8) - aT));
        lEN <- (lEN - ((cUR + 8) - aT));
        aT <- (cUR + 8);
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray2.init8 (fun i => buf.[i])) (offset + dELTA)));
          w <@ __SHLQ (w, (aT - cUR));
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          lEN <- (lEN - (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          aT <- (((cUR + 8) <= (aT + 4)) ? (cUR + 8) : (aT + 4));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT < (cUR + 8)) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray2.init8 (fun i => buf.[i])) (offset + dELTA)));
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          lEN <- (lEN - (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          t16 <@ __SHLQ (t16, (aT - cUR));
          w <- (w `|` t16);
          aT <- (((cUR + 8) <= (aT + 2)) ? (cUR + 8) : (aT + 2));
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (1 <= lEN))) {
          t8 <-
          (zeroextu64
          (get8_direct (WArray2.init8 (fun i => buf.[i])) (offset + dELTA)));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
          t8 <@ __SHLQ (t8, (aT - cUR));
          w <- (w `|` t8);
          aT <- (aT + 1);
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (tRAIL <> 0))) {
          t8 <- (W64.of_int (tRAIL %% 256));
          t8 <- (t8 `<<` (W8.of_int (8 * (aT - cUR))));
          w <- (w `|` t8);
          aT <- (aT + 1);
          tRAIL <- 0;
        } else {
          
        }
      }
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a2____addstate (st:W64.t Array25.t, aT:int, buf:W8.t Array2.t,
                       offset:int, _LEN:int, _TRAILB:int) : W64.t Array25.t *
                                                            int * int = {
    var inc:int;
    var hAS_AVX2:bool;
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var t256:W256.t;
    var i:int;
    var t128:W128.t;
    var at:int;
    hAS_AVX2 <@ __HAS_FEATURE (4, ((1 + 2) + 4));
    dELTA <- 0;
    if (((aT %% 8) <> 0)) {
      aT8 <- (8 * (aT %/ 8));
      (dELTA, _LEN, _TRAILB, aT, w) <@ a2____a_ilen_read_upto8_at (buf,
      offset, dELTA, _LEN, _TRAILB, aT8, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    if (hAS_AVX2) {
      inc <- (_LEN %/ 32);
      i <- 0;
      while ((i < inc)) {
        t256 <-
        (get256_direct (WArray2.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 32);
        t256 <-
        (t256 `^`
        (get256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i)) t256)));
        i <- (i + 1);
      }
      if ((16 <= (_LEN %% 32))) {
        t128 <-
        (get128_direct (WArray2.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 16);
        t128 <-
        (t128 `^`
        (get128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32)) t128)));
      } else {
        
      }
      if ((8 <= (_LEN %% 16))) {
        w <-
        (get64_direct (WArray2.init8 (fun i_0 => buf.[i_0])) (offset + dELTA)
        );
        dELTA <- (dELTA + 8);
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 16) * 16))
        ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
         (aT + ((_LEN %/ 16) * 16))) `^`
        w))));
      } else {
        
      }
    } else {
      at <- (aT %/ 8);
      offset <- (offset + dELTA);
      dELTA <- 0;
      while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
        w <- (get64_direct (WArray2.init8 (fun i_0 => buf.[i_0])) offset);
        offset <- (offset + 8);
        st.[at] <- (st.[at] `^` w);
        at <- (at + 1);
      }
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      aT8 <- aT;
      (dELTA, _LEN, _TRAILB, aT, w) <@ a2____a_ilen_read_upto8_at (buf,
      offset, dELTA, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    offset <- (offset + dELTA);
    return (st, aT, offset);
  }
  proc a2____absorb (st:W64.t Array25.t, aT:int, buf:W8.t Array2.t,
                     _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 2;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a2____addstate (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600 (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a2____addstate (st, 0, buf, offset, _RATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600 (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a2____addstate (st, aT, buf, offset, _LEN, _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a2____addstate_avx2x4 (st:W256.t Array25.t, aT:int,
                              buf0:W8.t Array2.t, buf1:W8.t Array2.t,
                              buf2:W8.t Array2.t, buf3:W8.t Array2.t,
                              offset:int, _LEN:int, _TRAILB:int) : W256.t Array25.t *
                                                                   int * int = {
    var dELTA:int;
    var aT8:int;
    var t0:W64.t;
    var t1:W64.t;
    var t2:W64.t;
    var t3:W64.t;
    var at:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    var  _3:int;
    var  _4:int;
    var  _5:int;
    var  _6:int;
    var  _7:int;
    var  _8:int;
    var  _9:int;
    var  _10:int;
    var  _11:int;
    var  _12:int;
    var  _13:int;
    var  _14:int;
    var  _15:int;
    var  _16:int;
    var  _17:int;
    var  _18:int;
    var  _19:int;
    var  _20:int;
    var  _21:int;
    var  _22:int;
    var  _23:int;
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if (((aT8 %% 8) <> 0)) {
      ( _0,  _1,  _2,  _3, t0) <@ a2____a_ilen_read_upto8_at (buf0, offset,
      dELTA, _LEN, _TRAILB, aT, aT8);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i]))
      ((4 * (aT %/ 8)) + 0)
      ((get64 (WArray800.init256 (fun i => st.[i])) ((4 * (aT %/ 8)) + 0)) `^`
      t0))));
      ( _4,  _5,  _6,  _7, t1) <@ a2____a_ilen_read_upto8_at (buf1, offset,
      dELTA, _LEN, _TRAILB, aT, aT8);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i]))
      ((4 * (aT %/ 8)) + 1)
      ((get64 (WArray800.init256 (fun i => st.[i])) ((4 * (aT %/ 8)) + 1)) `^`
      t1))));
      ( _8,  _9,  _10,  _11, t2) <@ a2____a_ilen_read_upto8_at (buf2, 
      offset, dELTA, _LEN, _TRAILB, aT, aT8);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i]))
      ((4 * (aT %/ 8)) + 2)
      ((get64 (WArray800.init256 (fun i => st.[i])) ((4 * (aT %/ 8)) + 2)) `^`
      t2))));
      (dELTA, _LEN, _TRAILB, aT8, t3) <@ a2____a_ilen_read_upto8_at (
      buf3, offset, dELTA, _LEN, _TRAILB, aT, aT8);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i]))
      ((4 * (aT %/ 8)) + 3)
      ((get64 (WArray800.init256 (fun i => st.[i])) ((4 * (aT %/ 8)) + 3)) `^`
      t3))));
      aT <- aT8;
    } else {
      
    }
    offset <- (offset + dELTA);
    at <- (4 * (aT %/ 8));
    while ((at < ((4 * (aT %/ 8)) + (4 * (_LEN %/ 8))))) {
      t0 <- (get64_direct (WArray2.init8 (fun i => buf0.[i])) offset);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 0)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 0)) `^` t0))));
      t1 <- (get64_direct (WArray2.init8 (fun i => buf1.[i])) offset);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 1)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 1)) `^` t1))));
      t2 <- (get64_direct (WArray2.init8 (fun i => buf2.[i])) offset);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 2)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 2)) `^` t2))));
      t3 <- (get64_direct (WArray2.init8 (fun i => buf3.[i])) offset);
      offset <- (offset + 8);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 3)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 3)) `^` t3))));
      at <- (at + 4);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      ( _12,  _13,  _14,  _15, t0) <@ a2____a_ilen_read_upto8_at (buf0,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 0)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 0)) `^` t0))));
      ( _16,  _17,  _18,  _19, t1) <@ a2____a_ilen_read_upto8_at (buf1,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 1)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 1)) `^` t1))));
      ( _20,  _21,  _22,  _23, t2) <@ a2____a_ilen_read_upto8_at (buf2,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 2)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 2)) `^` t2))));
      (dELTA, _LEN, _TRAILB, aT, t3) <@ a2____a_ilen_read_upto8_at (buf3,
      offset, 0, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set64 (WArray800.init256 (fun i => st.[i])) (at + 3)
      ((get64 (WArray800.init256 (fun i => st.[i])) (at + 3)) `^` t3))));
      offset <- (offset + dELTA);
    } else {
      
    }
    return (st, aT, offset);
  }
  proc a2____absorb_avx2x4 (st:W256.t Array25.t, aT:int, buf0:W8.t Array2.t,
                            buf1:W8.t Array2.t, buf2:W8.t Array2.t,
                            buf3:W8.t Array2.t, _TRAILB:int, _RATE8:int) : 
  W256.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 2;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a2____addstate_avx2x4 (st, aT, buf0, buf1, 
      buf2, buf3, offset, (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      st <@ _keccakf1600_avx2x4 (st);
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a2____addstate_avx2x4 (st, 0, buf0, buf1, 
        buf2, buf3, offset, _RATE8, 0);
        st <@ _keccakf1600_avx2x4 (st);
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a2____addstate_avx2x4 (st, aT, buf0, buf1, buf2, 
    buf3, offset, _LEN, _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit_avx2x4 (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a32____a_ilen_read_upto8_at (buf:W8.t Array32.t, offset:int,
                                    dELTA:int, lEN:int, tRAIL:int, cUR:int,
                                    aT:int) : int * int * int * int * W64.t = {
    var w:W64.t;
    var t16:W64.t;
    var t8:W64.t;
    if (((((lEN < 0) \/ (aT < cUR)) \/ ((cUR + 8) <= aT)) \/
        ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray32.init8 (fun i => buf.[i])) (offset + dELTA));
        w <@ __SHLQ (w, (aT - cUR));
        dELTA <- (dELTA + ((cUR + 8) - aT));
        lEN <- (lEN - ((cUR + 8) - aT));
        aT <- (cUR + 8);
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray32.init8 (fun i => buf.[i])) (offset + dELTA))
          );
          w <@ __SHLQ (w, (aT - cUR));
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          lEN <- (lEN - (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          aT <- (((cUR + 8) <= (aT + 4)) ? (cUR + 8) : (aT + 4));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT < (cUR + 8)) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray32.init8 (fun i => buf.[i])) (offset + dELTA))
          );
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          lEN <- (lEN - (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          t16 <@ __SHLQ (t16, (aT - cUR));
          w <- (w `|` t16);
          aT <- (((cUR + 8) <= (aT + 2)) ? (cUR + 8) : (aT + 2));
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (1 <= lEN))) {
          t8 <-
          (zeroextu64
          (get8_direct (WArray32.init8 (fun i => buf.[i])) (offset + dELTA)));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
          t8 <@ __SHLQ (t8, (aT - cUR));
          w <- (w `|` t8);
          aT <- (aT + 1);
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (tRAIL <> 0))) {
          t8 <- (W64.of_int (tRAIL %% 256));
          t8 <- (t8 `<<` (W8.of_int (8 * (aT - cUR))));
          w <- (w `|` t8);
          aT <- (aT + 1);
          tRAIL <- 0;
        } else {
          
        }
      }
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a32____a_ilen_read_bcast_upto8_at (buf:W8.t Array32.t, offset:int,
                                          dELTA:int, lEN:int, tRAIL:int,
                                          cUR:int, aT:int) : int * int *
                                                             int * int *
                                                             W256.t = {
    var w256:W256.t;
    var w:W64.t;
    var t128:W128.t;
    if (((((lEN < 0) \/ (aT < cUR)) \/ ((cUR + 8) <= aT)) \/
        ((lEN = 0) /\ (tRAIL = 0)))) {
      w256 <- (set0_256);
    } else {
      if ((8 <= lEN)) {
        w256 <-
        (VPBROADCAST_4u64
        (get64_direct (WArray32.init8 (fun i => buf.[i])) (offset + dELTA)));
        w256 <@ __SHLQ_256 (w256, (aT - cUR));
        dELTA <- (dELTA + ((cUR + 8) - aT));
        lEN <- (lEN - ((cUR + 8) - aT));
        aT <- (cUR + 8);
      } else {
        (dELTA, lEN, tRAIL, aT, w) <@ a32____a_ilen_read_upto8_at (buf,
        offset, dELTA, lEN, tRAIL, cUR, aT);
        t128 <- (VMOV_64 w);
        w256 <- (VPBROADCAST_4u64 (truncateu64 t128));
      }
    }
    return (dELTA, lEN, tRAIL, aT, w256);
  }
  proc a32____a_ilen_write_upto8 (buf:W8.t Array32.t, offset:int, dELTA:int,
                                  lEN:int, w:W64.t) : W8.t Array32.t * int *
                                                      int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (Array32.init
        (WArray32.get8
        (WArray32.set64_direct (WArray32.init8 (fun i => buf.[i]))
        (offset + dELTA) w)));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (Array32.init
          (WArray32.get8
          (WArray32.set32_direct (WArray32.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu32 w))));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (Array32.init
          (WArray32.get8
          (WArray32.set16_direct (WArray32.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu16 w))));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (Array32.init
          (WArray32.get8
          (WArray32.set8_direct (WArray32.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu8 w))));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc a32____addstate (st:W64.t Array25.t, aT:int, buf:W8.t Array32.t,
                        offset:int, _LEN:int, _TRAILB:int) : W64.t Array25.t *
                                                             int * int = {
    var inc:int;
    var hAS_AVX2:bool;
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var t256:W256.t;
    var i:int;
    var t128:W128.t;
    var at:int;
    hAS_AVX2 <@ __HAS_FEATURE (4, ((1 + 2) + 4));
    dELTA <- 0;
    if (((aT %% 8) <> 0)) {
      aT8 <- (8 * (aT %/ 8));
      (dELTA, _LEN, _TRAILB, aT, w) <@ a32____a_ilen_read_upto8_at (buf,
      offset, dELTA, _LEN, _TRAILB, aT8, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    if (hAS_AVX2) {
      inc <- (_LEN %/ 32);
      i <- 0;
      while ((i < inc)) {
        t256 <-
        (get256_direct (WArray32.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 32);
        t256 <-
        (t256 `^`
        (get256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i)) t256)));
        i <- (i + 1);
      }
      if ((16 <= (_LEN %% 32))) {
        t128 <-
        (get128_direct (WArray32.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 16);
        t128 <-
        (t128 `^`
        (get128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32)) t128)));
      } else {
        
      }
      if ((8 <= (_LEN %% 16))) {
        w <-
        (get64_direct (WArray32.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 8);
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 16) * 16))
        ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
         (aT + ((_LEN %/ 16) * 16))) `^`
        w))));
      } else {
        
      }
    } else {
      at <- (aT %/ 8);
      offset <- (offset + dELTA);
      dELTA <- 0;
      while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
        w <- (get64_direct (WArray32.init8 (fun i_0 => buf.[i_0])) offset);
        offset <- (offset + 8);
        st.[at] <- (st.[at] `^` w);
        at <- (at + 1);
      }
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      aT8 <- aT;
      (dELTA, _LEN, _TRAILB, aT, w) <@ a32____a_ilen_read_upto8_at (buf,
      offset, dELTA, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    offset <- (offset + dELTA);
    return (st, aT, offset);
  }
  proc a32____absorb (st:W64.t Array25.t, aT:int, buf:W8.t Array32.t,
                      _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 32;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a32____addstate (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600 (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a32____addstate (st, 0, buf, offset, _RATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600 (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a32____addstate (st, aT, buf, offset, _LEN, _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a32____dumpstate (buf:W8.t Array32.t, offset:int, _LEN:int,
                         st:W64.t Array25.t) : W8.t Array32.t * int = {
    var inc:int;
    var hAS_AVX2:bool;
    var dELTA:int;
    var t:W64.t;
    var j:int;
    var t256:W256.t;
    var t128:W128.t;
    var i:int;
    var  _0:int;
    hAS_AVX2 <@ __HAS_FEATURE (4, ((1 + 2) + 4));
    dELTA <- 0;
    if (hAS_AVX2) {
      inc <- (_LEN %/ 32);
      j <- 0;
      while ((j < inc)) {
        t256 <-
        (get256_direct (WArray200.init64 (fun i_0 => st.[i_0])) (32 * j));
        buf <-
        (Array32.init
        (WArray32.get8
        (WArray32.set256_direct (WArray32.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA) t256)));
        dELTA <- (dELTA + 32);
        j <- (j + 1);
      }
      if ((16 <= (_LEN %% 32))) {
        t128 <-
        (get128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        ((_LEN %/ 32) * 32));
        buf <-
        (Array32.init
        (WArray32.get8
        (WArray32.set128_direct (WArray32.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA) t128)));
        dELTA <- (dELTA + 16);
      } else {
        
      }
      if ((8 <= (_LEN %% 16))) {
        t <-
        (get64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        ((_LEN %/ 16) * 16));
        buf <-
        (Array32.init
        (WArray32.get8
        (WArray32.set64_direct (WArray32.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA) t)));
        dELTA <- (dELTA + 8);
      } else {
        
      }
    } else {
      i <- 0;
      while ((i < (_LEN %/ 8))) {
        t <- st.[i];
        buf <-
        (Array32.init
        (WArray32.get8
        (WArray32.set64_direct (WArray32.init8 (fun i_0 => buf.[i_0])) 
        offset t)));
        offset <- (offset + 8);
        i <- (i + 1);
      }
    }
    if ((0 < (_LEN %% 8))) {
      t <- st.[(_LEN %/ 8)];
      (buf, dELTA,  _0) <@ a32____a_ilen_write_upto8 (buf, offset, dELTA,
      (_LEN %% 8), t);
    } else {
      
    }
    offset <- (offset + dELTA);
    return (buf, offset);
  }
  proc a32____squeeze (st:W64.t Array25.t, buf:W8.t Array32.t, _RATE8:int) : 
  W64.t Array25.t * W8.t Array32.t = {
    var offset:int;
    var i:int;
    offset <- 0;
    i <- 0;
    while ((i < (32 %/ _RATE8))) {
      i <- (i + 1);
      (* Erased call to spill *)
      st <@ _keccakf1600 (st);
      (* Erased call to unspill *)
      (buf, offset) <@ a32____dumpstate (buf, offset, _RATE8, st);
    }
    if ((0 < (32 %% _RATE8))) {
      (* Erased call to spill *)
      st <@ _keccakf1600 (st);
      (* Erased call to unspill *)
      (buf, offset) <@ a32____dumpstate (buf, offset, (32 %% _RATE8), st);
    } else {
      
    }
    return (st, buf);
  }
  proc a32____addstate_bcast_avx2x4 (st:W256.t Array25.t, aT:int,
                                     buf:W8.t Array32.t, offset:int,
                                     _LEN:int, _TRAILB:int) : W256.t Array25.t *
                                                              int * int = {
    var dELTA:int;
    var aT8:int;
    var w:W256.t;
    var at:int;
    dELTA <- 0;
    aT8 <- aT;
    aT <- (8 * (aT %/ 8));
    if (((aT8 %% 8) <> 0)) {
      (dELTA, _LEN, _TRAILB, aT8, w) <@ a32____a_ilen_read_bcast_upto8_at (
      buf, offset, dELTA, _LEN, _TRAILB, aT, aT8);
      w <- (w `^` st.[(aT %/ 8)]);
      st.[(aT %/ 8)] <- w;
      aT <- aT8;
    } else {
      
    }
    offset <- (offset + dELTA);
    at <- (32 * (aT %/ 8));
    while ((at < (32 * ((aT %/ 8) + (_LEN %/ 8))))) {
      w <-
      (VPBROADCAST_4u64
      (get64_direct (WArray32.init8 (fun i => buf.[i])) offset));
      offset <- (offset + 8);
      w <- (w `^` (get256_direct (WArray800.init256 (fun i => st.[i])) at));
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set256_direct (WArray800.init256 (fun i => st.[i])) at w)));
      at <- (at + 32);
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      (dELTA, _LEN, _TRAILB, aT, w) <@ a32____a_ilen_read_bcast_upto8_at (
      buf, offset, 0, _LEN, _TRAILB, aT, aT);
      w <- (w `^` (get256_direct (WArray800.init256 (fun i => st.[i])) at));
      st <-
      (Array25.init
      (WArray800.get256
      (WArray800.set256_direct (WArray800.init256 (fun i => st.[i])) at w)));
      offset <- (offset + dELTA);
    } else {
      
    }
    return (st, aT, offset);
  }
  proc a32____absorb_bcast_avx2x4 (st:W256.t Array25.t, aT:int,
                                   buf:W8.t Array32.t, _TRAILB:int,
                                   _RATE8:int) : W256.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 32;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a32____addstate_bcast_avx2x4 (st, aT, buf, 
      offset, (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      st <@ _keccakf1600_avx2x4 (st);
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a32____addstate_bcast_avx2x4 (st, 0, buf,
        offset, _RATE8, 0);
        st <@ _keccakf1600_avx2x4 (st);
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a32____addstate_bcast_avx2x4 (st, aT, buf, offset, 
    _LEN, _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit_avx2x4 (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a33____a_ilen_read_upto8_at (buf:W8.t Array33.t, offset:int,
                                    dELTA:int, lEN:int, tRAIL:int, cUR:int,
                                    aT:int) : int * int * int * int * W64.t = {
    var w:W64.t;
    var t16:W64.t;
    var t8:W64.t;
    if (((((lEN < 0) \/ (aT < cUR)) \/ ((cUR + 8) <= aT)) \/
        ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray33.init8 (fun i => buf.[i])) (offset + dELTA));
        w <@ __SHLQ (w, (aT - cUR));
        dELTA <- (dELTA + ((cUR + 8) - aT));
        lEN <- (lEN - ((cUR + 8) - aT));
        aT <- (cUR + 8);
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray33.init8 (fun i => buf.[i])) (offset + dELTA))
          );
          w <@ __SHLQ (w, (aT - cUR));
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          lEN <- (lEN - (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          aT <- (((cUR + 8) <= (aT + 4)) ? (cUR + 8) : (aT + 4));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT < (cUR + 8)) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray33.init8 (fun i => buf.[i])) (offset + dELTA))
          );
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          lEN <- (lEN - (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          t16 <@ __SHLQ (t16, (aT - cUR));
          w <- (w `|` t16);
          aT <- (((cUR + 8) <= (aT + 2)) ? (cUR + 8) : (aT + 2));
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (1 <= lEN))) {
          t8 <-
          (zeroextu64
          (get8_direct (WArray33.init8 (fun i => buf.[i])) (offset + dELTA)));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
          t8 <@ __SHLQ (t8, (aT - cUR));
          w <- (w `|` t8);
          aT <- (aT + 1);
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (tRAIL <> 0))) {
          t8 <- (W64.of_int (tRAIL %% 256));
          t8 <- (t8 `<<` (W8.of_int (8 * (aT - cUR))));
          w <- (w `|` t8);
          aT <- (aT + 1);
          tRAIL <- 0;
        } else {
          
        }
      }
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a33____addstate (st:W64.t Array25.t, aT:int, buf:W8.t Array33.t,
                        offset:int, _LEN:int, _TRAILB:int) : W64.t Array25.t *
                                                             int * int = {
    var inc:int;
    var hAS_AVX2:bool;
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var t256:W256.t;
    var i:int;
    var t128:W128.t;
    var at:int;
    hAS_AVX2 <@ __HAS_FEATURE (4, ((1 + 2) + 4));
    dELTA <- 0;
    if (((aT %% 8) <> 0)) {
      aT8 <- (8 * (aT %/ 8));
      (dELTA, _LEN, _TRAILB, aT, w) <@ a33____a_ilen_read_upto8_at (buf,
      offset, dELTA, _LEN, _TRAILB, aT8, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    if (hAS_AVX2) {
      inc <- (_LEN %/ 32);
      i <- 0;
      while ((i < inc)) {
        t256 <-
        (get256_direct (WArray33.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 32);
        t256 <-
        (t256 `^`
        (get256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i)) t256)));
        i <- (i + 1);
      }
      if ((16 <= (_LEN %% 32))) {
        t128 <-
        (get128_direct (WArray33.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 16);
        t128 <-
        (t128 `^`
        (get128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32)) t128)));
      } else {
        
      }
      if ((8 <= (_LEN %% 16))) {
        w <-
        (get64_direct (WArray33.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 8);
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 16) * 16))
        ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
         (aT + ((_LEN %/ 16) * 16))) `^`
        w))));
      } else {
        
      }
    } else {
      at <- (aT %/ 8);
      offset <- (offset + dELTA);
      dELTA <- 0;
      while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
        w <- (get64_direct (WArray33.init8 (fun i_0 => buf.[i_0])) offset);
        offset <- (offset + 8);
        st.[at] <- (st.[at] `^` w);
        at <- (at + 1);
      }
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      aT8 <- aT;
      (dELTA, _LEN, _TRAILB, aT, w) <@ a33____a_ilen_read_upto8_at (buf,
      offset, dELTA, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    offset <- (offset + dELTA);
    return (st, aT, offset);
  }
  proc a33____absorb (st:W64.t Array25.t, aT:int, buf:W8.t Array33.t,
                      _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 33;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a33____addstate (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600 (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a33____addstate (st, 0, buf, offset, _RATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600 (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a33____addstate (st, aT, buf, offset, _LEN, _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a64____a_ilen_read_upto8_at (buf:W8.t Array64.t, offset:int,
                                    dELTA:int, lEN:int, tRAIL:int, cUR:int,
                                    aT:int) : int * int * int * int * W64.t = {
    var w:W64.t;
    var t16:W64.t;
    var t8:W64.t;
    if (((((lEN < 0) \/ (aT < cUR)) \/ ((cUR + 8) <= aT)) \/
        ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray64.init8 (fun i => buf.[i])) (offset + dELTA));
        w <@ __SHLQ (w, (aT - cUR));
        dELTA <- (dELTA + ((cUR + 8) - aT));
        lEN <- (lEN - ((cUR + 8) - aT));
        aT <- (cUR + 8);
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray64.init8 (fun i => buf.[i])) (offset + dELTA))
          );
          w <@ __SHLQ (w, (aT - cUR));
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          lEN <- (lEN - (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          aT <- (((cUR + 8) <= (aT + 4)) ? (cUR + 8) : (aT + 4));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT < (cUR + 8)) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray64.init8 (fun i => buf.[i])) (offset + dELTA))
          );
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          lEN <- (lEN - (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          t16 <@ __SHLQ (t16, (aT - cUR));
          w <- (w `|` t16);
          aT <- (((cUR + 8) <= (aT + 2)) ? (cUR + 8) : (aT + 2));
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (1 <= lEN))) {
          t8 <-
          (zeroextu64
          (get8_direct (WArray64.init8 (fun i => buf.[i])) (offset + dELTA)));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
          t8 <@ __SHLQ (t8, (aT - cUR));
          w <- (w `|` t8);
          aT <- (aT + 1);
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (tRAIL <> 0))) {
          t8 <- (W64.of_int (tRAIL %% 256));
          t8 <- (t8 `<<` (W8.of_int (8 * (aT - cUR))));
          w <- (w `|` t8);
          aT <- (aT + 1);
          tRAIL <- 0;
        } else {
          
        }
      }
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a64____a_ilen_write_upto8 (buf:W8.t Array64.t, offset:int, dELTA:int,
                                  lEN:int, w:W64.t) : W8.t Array64.t * int *
                                                      int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (Array64.init
        (WArray64.get8
        (WArray64.set64_direct (WArray64.init8 (fun i => buf.[i]))
        (offset + dELTA) w)));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (Array64.init
          (WArray64.get8
          (WArray64.set32_direct (WArray64.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu32 w))));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (Array64.init
          (WArray64.get8
          (WArray64.set16_direct (WArray64.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu16 w))));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (Array64.init
          (WArray64.get8
          (WArray64.set8_direct (WArray64.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu8 w))));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc a64____addstate (st:W64.t Array25.t, aT:int, buf:W8.t Array64.t,
                        offset:int, _LEN:int, _TRAILB:int) : W64.t Array25.t *
                                                             int * int = {
    var inc:int;
    var hAS_AVX2:bool;
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var t256:W256.t;
    var i:int;
    var t128:W128.t;
    var at:int;
    hAS_AVX2 <@ __HAS_FEATURE (4, ((1 + 2) + 4));
    dELTA <- 0;
    if (((aT %% 8) <> 0)) {
      aT8 <- (8 * (aT %/ 8));
      (dELTA, _LEN, _TRAILB, aT, w) <@ a64____a_ilen_read_upto8_at (buf,
      offset, dELTA, _LEN, _TRAILB, aT8, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    if (hAS_AVX2) {
      inc <- (_LEN %/ 32);
      i <- 0;
      while ((i < inc)) {
        t256 <-
        (get256_direct (WArray64.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 32);
        t256 <-
        (t256 `^`
        (get256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i)) t256)));
        i <- (i + 1);
      }
      if ((16 <= (_LEN %% 32))) {
        t128 <-
        (get128_direct (WArray64.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 16);
        t128 <-
        (t128 `^`
        (get128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32)) t128)));
      } else {
        
      }
      if ((8 <= (_LEN %% 16))) {
        w <-
        (get64_direct (WArray64.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 8);
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 16) * 16))
        ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
         (aT + ((_LEN %/ 16) * 16))) `^`
        w))));
      } else {
        
      }
    } else {
      at <- (aT %/ 8);
      offset <- (offset + dELTA);
      dELTA <- 0;
      while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
        w <- (get64_direct (WArray64.init8 (fun i_0 => buf.[i_0])) offset);
        offset <- (offset + 8);
        st.[at] <- (st.[at] `^` w);
        at <- (at + 1);
      }
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      aT8 <- aT;
      (dELTA, _LEN, _TRAILB, aT, w) <@ a64____a_ilen_read_upto8_at (buf,
      offset, dELTA, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    offset <- (offset + dELTA);
    return (st, aT, offset);
  }
  proc a64____absorb (st:W64.t Array25.t, aT:int, buf:W8.t Array64.t,
                      _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 64;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a64____addstate (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600 (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a64____addstate (st, 0, buf, offset, _RATE8, 0);
        (* Erased call to spill *)
        st <@ _keccakf1600 (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a64____addstate (st, aT, buf, offset, _LEN, _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a64____dumpstate (buf:W8.t Array64.t, offset:int, _LEN:int,
                         st:W64.t Array25.t) : W8.t Array64.t * int = {
    var inc:int;
    var hAS_AVX2:bool;
    var dELTA:int;
    var t:W64.t;
    var j:int;
    var t256:W256.t;
    var t128:W128.t;
    var i:int;
    var  _0:int;
    hAS_AVX2 <@ __HAS_FEATURE (4, ((1 + 2) + 4));
    dELTA <- 0;
    if (hAS_AVX2) {
      inc <- (_LEN %/ 32);
      j <- 0;
      while ((j < inc)) {
        t256 <-
        (get256_direct (WArray200.init64 (fun i_0 => st.[i_0])) (32 * j));
        buf <-
        (Array64.init
        (WArray64.get8
        (WArray64.set256_direct (WArray64.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA) t256)));
        dELTA <- (dELTA + 32);
        j <- (j + 1);
      }
      if ((16 <= (_LEN %% 32))) {
        t128 <-
        (get128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        ((_LEN %/ 32) * 32));
        buf <-
        (Array64.init
        (WArray64.get8
        (WArray64.set128_direct (WArray64.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA) t128)));
        dELTA <- (dELTA + 16);
      } else {
        
      }
      if ((8 <= (_LEN %% 16))) {
        t <-
        (get64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        ((_LEN %/ 16) * 16));
        buf <-
        (Array64.init
        (WArray64.get8
        (WArray64.set64_direct (WArray64.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA) t)));
        dELTA <- (dELTA + 8);
      } else {
        
      }
    } else {
      i <- 0;
      while ((i < (_LEN %/ 8))) {
        t <- st.[i];
        buf <-
        (Array64.init
        (WArray64.get8
        (WArray64.set64_direct (WArray64.init8 (fun i_0 => buf.[i_0])) 
        offset t)));
        offset <- (offset + 8);
        i <- (i + 1);
      }
    }
    if ((0 < (_LEN %% 8))) {
      t <- st.[(_LEN %/ 8)];
      (buf, dELTA,  _0) <@ a64____a_ilen_write_upto8 (buf, offset, dELTA,
      (_LEN %% 8), t);
    } else {
      
    }
    offset <- (offset + dELTA);
    return (buf, offset);
  }
  proc a64____squeeze (st:W64.t Array25.t, buf:W8.t Array64.t, _RATE8:int) : 
  W64.t Array25.t * W8.t Array64.t = {
    var offset:int;
    var i:int;
    offset <- 0;
    i <- 0;
    while ((i < (64 %/ _RATE8))) {
      i <- (i + 1);
      (* Erased call to spill *)
      st <@ _keccakf1600 (st);
      (* Erased call to unspill *)
      (buf, offset) <@ a64____dumpstate (buf, offset, _RATE8, st);
    }
    if ((0 < (64 %% _RATE8))) {
      (* Erased call to spill *)
      st <@ _keccakf1600 (st);
      (* Erased call to unspill *)
      (buf, offset) <@ a64____dumpstate (buf, offset, (64 %% _RATE8), st);
    } else {
      
    }
    return (st, buf);
  }
  proc a128____a_ilen_write_upto8 (buf:W8.t Array128.t, offset:int,
                                   dELTA:int, lEN:int, w:W64.t) : W8.t Array128.t *
                                                                  int * int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (Array128.init
        (WArray128.get8
        (WArray128.set64_direct (WArray128.init8 (fun i => buf.[i]))
        (offset + dELTA) w)));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (Array128.init
          (WArray128.get8
          (WArray128.set32_direct (WArray128.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu32 w))));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (Array128.init
          (WArray128.get8
          (WArray128.set16_direct (WArray128.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu16 w))));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (Array128.init
          (WArray128.get8
          (WArray128.set8_direct (WArray128.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu8 w))));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc a128____dumpstate_avx2x4 (buf0:W8.t Array128.t, buf1:W8.t Array128.t,
                                 buf2:W8.t Array128.t, buf3:W8.t Array128.t,
                                 offset:int, _LEN:int, st:W256.t Array25.t) : 
  W8.t Array128.t * W8.t Array128.t * W8.t Array128.t * W8.t Array128.t * int = {
    var x0:W256.t;
    var x1:W256.t;
    var x2:W256.t;
    var x3:W256.t;
    var t0:W64.t;
    var t1:W64.t;
    var t2:W64.t;
    var t3:W64.t;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    var  _3:int;
    var  _4:int;
    var  _5:int;
    var  _6:int;
    var  _7:int;
    i <- 0;
    while ((i < (32 * (_LEN %/ 32)))) {
      x0 <-
      (get256_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (0 * 32)));
      x1 <-
      (get256_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (1 * 32)));
      x2 <-
      (get256_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (2 * 32)));
      x3 <-
      (get256_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (3 * 32)));
      i <- (i + 32);
      (x0, x1, x2, x3) <@ __4u64x4_u256x4 (x0, x1, x2, x3);
      buf0 <-
      (Array128.init
      (WArray128.get8
      (WArray128.set256_direct (WArray128.init8 (fun i_0 => buf0.[i_0]))
      offset x0)));
      buf1 <-
      (Array128.init
      (WArray128.get8
      (WArray128.set256_direct (WArray128.init8 (fun i_0 => buf1.[i_0]))
      offset x1)));
      buf2 <-
      (Array128.init
      (WArray128.get8
      (WArray128.set256_direct (WArray128.init8 (fun i_0 => buf2.[i_0]))
      offset x2)));
      buf3 <-
      (Array128.init
      (WArray128.get8
      (WArray128.set256_direct (WArray128.init8 (fun i_0 => buf3.[i_0]))
      offset x3)));
      offset <- (offset + 32);
    }
    while ((i < (8 * (_LEN %/ 8)))) {
      t0 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (0 * 8)));
      buf0 <-
      (Array128.init
      (WArray128.get8
      (WArray128.set64_direct (WArray128.init8 (fun i_0 => buf0.[i_0]))
      offset t0)));
      t1 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (1 * 8)));
      buf1 <-
      (Array128.init
      (WArray128.get8
      (WArray128.set64_direct (WArray128.init8 (fun i_0 => buf1.[i_0]))
      offset t1)));
      t2 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (2 * 8)));
      buf2 <-
      (Array128.init
      (WArray128.get8
      (WArray128.set64_direct (WArray128.init8 (fun i_0 => buf2.[i_0]))
      offset t2)));
      t3 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (3 * 8)));
      buf3 <-
      (Array128.init
      (WArray128.get8
      (WArray128.set64_direct (WArray128.init8 (fun i_0 => buf3.[i_0]))
      offset t3)));
      i <- (i + 8);
      offset <- (offset + 8);
    }
    if ((0 < (_LEN %% 8))) {
      t0 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (0 * 8)));
      (buf0,  _0,  _1) <@ a128____a_ilen_write_upto8 (buf0, offset, 0,
      (_LEN %% 8), t0);
      t1 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (1 * 8)));
      (buf1,  _2,  _3) <@ a128____a_ilen_write_upto8 (buf1, offset, 0,
      (_LEN %% 8), t1);
      t2 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (2 * 8)));
      (buf2,  _4,  _5) <@ a128____a_ilen_write_upto8 (buf2, offset, 0,
      (_LEN %% 8), t2);
      t3 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (3 * 8)));
      (buf3,  _6,  _7) <@ a128____a_ilen_write_upto8 (buf3, offset, 0,
      (_LEN %% 8), t3);
      offset <- (offset + (_LEN %% 8));
    } else {
      
    }
    return (buf0, buf1, buf2, buf3, offset);
  }
  proc a128____squeeze_avx2x4 (st:W256.t Array25.t, buf0:W8.t Array128.t,
                               buf1:W8.t Array128.t, buf2:W8.t Array128.t,
                               buf3:W8.t Array128.t, _RATE8:int) : W256.t Array25.t *
                                                                   W8.t Array128.t *
                                                                   W8.t Array128.t *
                                                                   W8.t Array128.t *
                                                                   W8.t Array128.t = {
    var _LEN:int;
    var iTERS:int;
    var lO:int;
    var offset:int;
    var i:int;
    offset <- 0;
    _LEN <- 128;
    iTERS <- (_LEN %/ _RATE8);
    lO <- (_LEN %% _RATE8);
    if ((0 < iTERS)) {
      i <- 0;
      while ((i < iTERS)) {
        st <@ _keccakf1600_avx2x4 (st);
        (buf0, buf1, buf2, buf3, offset) <@ a128____dumpstate_avx2x4 (
        buf0, buf1, buf2, buf3, offset, _RATE8, st);
        i <- (i + 1);
      }
    } else {
      
    }
    if ((0 < lO)) {
      st <@ _keccakf1600_avx2x4 (st);
      (buf0, buf1, buf2, buf3, offset) <@ a128____dumpstate_avx2x4 (buf0,
      buf1, buf2, buf3, offset, lO, st);
    } else {
      
    }
    return (st, buf0, buf1, buf2, buf3);
  }
  proc a1184____a_ilen_read_upto8_at (buf:W8.t Array1184.t, offset:int,
                                      dELTA:int, lEN:int, tRAIL:int, cUR:int,
                                      aT:int) : int * int * int * int * W64.t = {
    var w:W64.t;
    var t16:W64.t;
    var t8:W64.t;
    if (((((lEN < 0) \/ (aT < cUR)) \/ ((cUR + 8) <= aT)) \/
        ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray1184.init8 (fun i => buf.[i])) (offset + dELTA));
        w <@ __SHLQ (w, (aT - cUR));
        dELTA <- (dELTA + ((cUR + 8) - aT));
        lEN <- (lEN - ((cUR + 8) - aT));
        aT <- (cUR + 8);
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray1184.init8 (fun i => buf.[i]))
          (offset + dELTA)));
          w <@ __SHLQ (w, (aT - cUR));
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          lEN <- (lEN - (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          aT <- (((cUR + 8) <= (aT + 4)) ? (cUR + 8) : (aT + 4));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT < (cUR + 8)) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray1184.init8 (fun i => buf.[i]))
          (offset + dELTA)));
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          lEN <- (lEN - (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          t16 <@ __SHLQ (t16, (aT - cUR));
          w <- (w `|` t16);
          aT <- (((cUR + 8) <= (aT + 2)) ? (cUR + 8) : (aT + 2));
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (1 <= lEN))) {
          t8 <-
          (zeroextu64
          (get8_direct (WArray1184.init8 (fun i => buf.[i])) (offset + dELTA)
          ));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
          t8 <@ __SHLQ (t8, (aT - cUR));
          w <- (w `|` t8);
          aT <- (aT + 1);
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (tRAIL <> 0))) {
          t8 <- (W64.of_int (tRAIL %% 256));
          t8 <- (t8 `<<` (W8.of_int (8 * (aT - cUR))));
          w <- (w `|` t8);
          aT <- (aT + 1);
          tRAIL <- 0;
        } else {
          
        }
      }
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a1184____addstate (st:W64.t Array25.t, aT:int, buf:W8.t Array1184.t,
                          offset:int, _LEN:int, _TRAILB:int) : W64.t Array25.t *
                                                               int * int = {
    var inc:int;
    var hAS_AVX2:bool;
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var t256:W256.t;
    var i:int;
    var t128:W128.t;
    var at:int;
    hAS_AVX2 <@ __HAS_FEATURE (4, ((1 + 2) + 4));
    dELTA <- 0;
    if (((aT %% 8) <> 0)) {
      aT8 <- (8 * (aT %/ 8));
      (dELTA, _LEN, _TRAILB, aT, w) <@ a1184____a_ilen_read_upto8_at (
      buf, offset, dELTA, _LEN, _TRAILB, aT8, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    if (hAS_AVX2) {
      inc <- (_LEN %/ 32);
      i <- 0;
      while ((i < inc)) {
        t256 <-
        (get256_direct (WArray1184.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 32);
        t256 <-
        (t256 `^`
        (get256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i)) t256)));
        i <- (i + 1);
      }
      if ((16 <= (_LEN %% 32))) {
        t128 <-
        (get128_direct (WArray1184.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 16);
        t128 <-
        (t128 `^`
        (get128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32)) t128)));
      } else {
        
      }
      if ((8 <= (_LEN %% 16))) {
        w <-
        (get64_direct (WArray1184.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 8);
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 16) * 16))
        ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
         (aT + ((_LEN %/ 16) * 16))) `^`
        w))));
      } else {
        
      }
    } else {
      at <- (aT %/ 8);
      offset <- (offset + dELTA);
      dELTA <- 0;
      while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
        w <- (get64_direct (WArray1184.init8 (fun i_0 => buf.[i_0])) offset);
        offset <- (offset + 8);
        st.[at] <- (st.[at] `^` w);
        at <- (at + 1);
      }
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      aT8 <- aT;
      (dELTA, _LEN, _TRAILB, aT, w) <@ a1184____a_ilen_read_upto8_at (
      buf, offset, dELTA, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    offset <- (offset + dELTA);
    return (st, aT, offset);
  }
  proc a1184____absorb (st:W64.t Array25.t, aT:int, buf:W8.t Array1184.t,
                        _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 1184;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a1184____addstate (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600 (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a1184____addstate (st, 0, buf, offset, _RATE8,
        0);
        (* Erased call to spill *)
        st <@ _keccakf1600 (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a1184____addstate (st, aT, buf, offset, _LEN, _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc a1120____a_ilen_read_upto8_at (buf:W8.t Array1120.t, offset:int,
                                      dELTA:int, lEN:int, tRAIL:int, cUR:int,
                                      aT:int) : int * int * int * int * W64.t = {
    var w:W64.t;
    var t16:W64.t;
    var t8:W64.t;
    if (((((lEN < 0) \/ (aT < cUR)) \/ ((cUR + 8) <= aT)) \/
        ((lEN = 0) /\ (tRAIL = 0)))) {
      w <- (W64.of_int 0);
    } else {
      if ((8 <= lEN)) {
        w <-
        (get64_direct (WArray1120.init8 (fun i => buf.[i])) (offset + dELTA));
        w <@ __SHLQ (w, (aT - cUR));
        dELTA <- (dELTA + ((cUR + 8) - aT));
        lEN <- (lEN - ((cUR + 8) - aT));
        aT <- (cUR + 8);
      } else {
        if ((4 <= lEN)) {
          w <-
          (zeroextu64
          (get32_direct (WArray1120.init8 (fun i => buf.[i]))
          (offset + dELTA)));
          w <@ __SHLQ (w, (aT - cUR));
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          lEN <- (lEN - (((cUR + 8) <= (aT + 4)) ? ((cUR + 8) - aT) : 4));
          aT <- (((cUR + 8) <= (aT + 4)) ? (cUR + 8) : (aT + 4));
        } else {
          w <- (W64.of_int 0);
        }
        if (((aT < (cUR + 8)) /\ (2 <= lEN))) {
          t16 <-
          (zeroextu64
          (get16_direct (WArray1120.init8 (fun i => buf.[i]))
          (offset + dELTA)));
          dELTA <-
          (dELTA + (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          lEN <- (lEN - (((cUR + 8) <= (aT + 2)) ? ((cUR + 8) - aT) : 2));
          t16 <@ __SHLQ (t16, (aT - cUR));
          w <- (w `|` t16);
          aT <- (((cUR + 8) <= (aT + 2)) ? (cUR + 8) : (aT + 2));
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (1 <= lEN))) {
          t8 <-
          (zeroextu64
          (get8_direct (WArray1120.init8 (fun i => buf.[i])) (offset + dELTA)
          ));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
          t8 <@ __SHLQ (t8, (aT - cUR));
          w <- (w `|` t8);
          aT <- (aT + 1);
        } else {
          
        }
        if (((aT < (cUR + 8)) /\ (tRAIL <> 0))) {
          t8 <- (W64.of_int (tRAIL %% 256));
          t8 <- (t8 `<<` (W8.of_int (8 * (aT - cUR))));
          w <- (w `|` t8);
          aT <- (aT + 1);
          tRAIL <- 0;
        } else {
          
        }
      }
    }
    return (dELTA, lEN, tRAIL, aT, w);
  }
  proc a1120____addstate (st:W64.t Array25.t, aT:int, buf:W8.t Array1120.t,
                          offset:int, _LEN:int, _TRAILB:int) : W64.t Array25.t *
                                                               int * int = {
    var inc:int;
    var hAS_AVX2:bool;
    var dELTA:int;
    var aT8:int;
    var w:W64.t;
    var t256:W256.t;
    var i:int;
    var t128:W128.t;
    var at:int;
    hAS_AVX2 <@ __HAS_FEATURE (4, ((1 + 2) + 4));
    dELTA <- 0;
    if (((aT %% 8) <> 0)) {
      aT8 <- (8 * (aT %/ 8));
      (dELTA, _LEN, _TRAILB, aT, w) <@ a1120____a_ilen_read_upto8_at (
      buf, offset, dELTA, _LEN, _TRAILB, aT8, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    if (hAS_AVX2) {
      inc <- (_LEN %/ 32);
      i <- 0;
      while ((i < inc)) {
        t256 <-
        (get256_direct (WArray1120.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 32);
        t256 <-
        (t256 `^`
        (get256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set256_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + (32 * i)) t256)));
        i <- (i + 1);
      }
      if ((16 <= (_LEN %% 32))) {
        t128 <-
        (get128_direct (WArray1120.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 16);
        t128 <-
        (t128 `^`
        (get128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32))));
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 32) * 32)) t128)));
      } else {
        
      }
      if ((8 <= (_LEN %% 16))) {
        w <-
        (get64_direct (WArray1120.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA));
        dELTA <- (dELTA + 8);
        st <-
        (Array25.init
        (WArray200.get64
        (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        (aT + ((_LEN %/ 16) * 16))
        ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
         (aT + ((_LEN %/ 16) * 16))) `^`
        w))));
      } else {
        
      }
    } else {
      at <- (aT %/ 8);
      offset <- (offset + dELTA);
      dELTA <- 0;
      while ((at < ((aT %/ 8) + (_LEN %/ 8)))) {
        w <- (get64_direct (WArray1120.init8 (fun i_0 => buf.[i_0])) offset);
        offset <- (offset + 8);
        st.[at] <- (st.[at] `^` w);
        at <- (at + 1);
      }
    }
    aT <- (aT + (8 * (_LEN %/ 8)));
    _LEN <- (_LEN %% 8);
    if (((0 < _LEN) \/ ((_TRAILB %% 256) <> 0))) {
      aT8 <- aT;
      (dELTA, _LEN, _TRAILB, aT, w) <@ a1120____a_ilen_read_upto8_at (
      buf, offset, dELTA, _LEN, _TRAILB, aT, aT);
      st <-
      (Array25.init
      (WArray200.get64
      (WArray200.set64_direct (WArray200.init64 (fun i_0 => st.[i_0])) 
      aT8 ((get64_direct (WArray200.init64 (fun i_0 => st.[i_0])) aT8) `^` w)
      )));
    } else {
      
    }
    offset <- (offset + dELTA);
    return (st, aT, offset);
  }
  proc a1120____absorb (st:W64.t Array25.t, aT:int, buf:W8.t Array1120.t,
                        _TRAILB:int, _RATE8:int) : W64.t Array25.t * int = {
    var _LEN:int;
    var iTERS:int;
    var offset:int;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    offset <- 0;
    _LEN <- 1120;
    if ((_RATE8 <= (aT + _LEN))) {
      (st,  _0, offset) <@ a1120____addstate (st, aT, buf, offset,
      (_RATE8 - aT), 0);
      _LEN <- (_LEN - (_RATE8 - aT));
      aT <- 0;
      (* Erased call to spill *)
      st <@ _keccakf1600 (st);
      (* Erased call to unspill *)
      iTERS <- (_LEN %/ _RATE8);
      i <- 0;
      while ((i < iTERS)) {
        (st,  _1, offset) <@ a1120____addstate (st, 0, buf, offset, _RATE8,
        0);
        (* Erased call to spill *)
        st <@ _keccakf1600 (st);
        (* Erased call to unspill *)
        i <- (i + 1);
      }
      _LEN <- (_LEN %% _RATE8);
    } else {
      
    }
    (st, aT,  _2) <@ a1120____addstate (st, aT, buf, offset, _LEN, _TRAILB);
    if ((_TRAILB <> 0)) {
      st <@ __addratebit (st, _RATE8);
    } else {
      
    }
    return (st, aT);
  }
  proc aBUFLEN____a_ilen_write_upto8 (buf:W8.t Array536.t, offset:int,
                                      dELTA:int, lEN:int, w:W64.t) : 
  W8.t Array536.t * int * int = {
    
    if ((0 < lEN)) {
      if ((8 <= lEN)) {
        buf <-
        (Array536.init
        (WArray536.get8
        (WArray536.set64_direct (WArray536.init8 (fun i => buf.[i]))
        (offset + dELTA) w)));
        dELTA <- (dELTA + 8);
        lEN <- (lEN - 8);
      } else {
        if ((4 <= lEN)) {
          buf <-
          (Array536.init
          (WArray536.get8
          (WArray536.set32_direct (WArray536.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu32 w))));
          w <- (w `>>` (W8.of_int 32));
          dELTA <- (dELTA + 4);
          lEN <- (lEN - 4);
        } else {
          
        }
        if ((2 <= lEN)) {
          buf <-
          (Array536.init
          (WArray536.get8
          (WArray536.set16_direct (WArray536.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu16 w))));
          w <- (w `>>` (W8.of_int 16));
          dELTA <- (dELTA + 2);
          lEN <- (lEN - 2);
        } else {
          
        }
        if ((1 <= lEN)) {
          buf <-
          (Array536.init
          (WArray536.get8
          (WArray536.set8_direct (WArray536.init8 (fun i => buf.[i]))
          (offset + dELTA) (truncateu8 w))));
          dELTA <- (dELTA + 1);
          lEN <- (lEN - 1);
        } else {
          
        }
      }
    } else {
      
    }
    return (buf, dELTA, lEN);
  }
  proc aBUFLEN____dumpstate (buf:W8.t Array536.t, offset:int, _LEN:int,
                             st:W64.t Array25.t) : W8.t Array536.t * int = {
    var inc:int;
    var hAS_AVX2:bool;
    var dELTA:int;
    var t:W64.t;
    var j:int;
    var t256:W256.t;
    var t128:W128.t;
    var i:int;
    var  _0:int;
    hAS_AVX2 <@ __HAS_FEATURE (4, ((1 + 2) + 4));
    dELTA <- 0;
    if (hAS_AVX2) {
      inc <- (_LEN %/ 32);
      j <- 0;
      while ((j < inc)) {
        t256 <-
        (get256_direct (WArray200.init64 (fun i_0 => st.[i_0])) (32 * j));
        buf <-
        (Array536.init
        (WArray536.get8
        (WArray536.set256_direct (WArray536.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA) t256)));
        dELTA <- (dELTA + 32);
        j <- (j + 1);
      }
      if ((16 <= (_LEN %% 32))) {
        t128 <-
        (get128_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        ((_LEN %/ 32) * 32));
        buf <-
        (Array536.init
        (WArray536.get8
        (WArray536.set128_direct (WArray536.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA) t128)));
        dELTA <- (dELTA + 16);
      } else {
        
      }
      if ((8 <= (_LEN %% 16))) {
        t <-
        (get64_direct (WArray200.init64 (fun i_0 => st.[i_0]))
        ((_LEN %/ 16) * 16));
        buf <-
        (Array536.init
        (WArray536.get8
        (WArray536.set64_direct (WArray536.init8 (fun i_0 => buf.[i_0]))
        (offset + dELTA) t)));
        dELTA <- (dELTA + 8);
      } else {
        
      }
    } else {
      i <- 0;
      while ((i < (_LEN %/ 8))) {
        t <- st.[i];
        buf <-
        (Array536.init
        (WArray536.get8
        (WArray536.set64_direct (WArray536.init8 (fun i_0 => buf.[i_0]))
        offset t)));
        offset <- (offset + 8);
        i <- (i + 1);
      }
    }
    if ((0 < (_LEN %% 8))) {
      t <- st.[(_LEN %/ 8)];
      (buf, dELTA,  _0) <@ aBUFLEN____a_ilen_write_upto8 (buf, offset, 
      dELTA, (_LEN %% 8), t);
    } else {
      
    }
    offset <- (offset + dELTA);
    return (buf, offset);
  }
  proc aBUFLEN____dumpstate_avx2x4 (buf0:W8.t Array536.t,
                                    buf1:W8.t Array536.t,
                                    buf2:W8.t Array536.t,
                                    buf3:W8.t Array536.t, offset:int,
                                    _LEN:int, st:W256.t Array25.t) : 
  W8.t Array536.t * W8.t Array536.t * W8.t Array536.t * W8.t Array536.t * int = {
    var x0:W256.t;
    var x1:W256.t;
    var x2:W256.t;
    var x3:W256.t;
    var t0:W64.t;
    var t1:W64.t;
    var t2:W64.t;
    var t3:W64.t;
    var i:int;
    var  _0:int;
    var  _1:int;
    var  _2:int;
    var  _3:int;
    var  _4:int;
    var  _5:int;
    var  _6:int;
    var  _7:int;
    i <- 0;
    while ((i < (32 * (_LEN %/ 32)))) {
      x0 <-
      (get256_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (0 * 32)));
      x1 <-
      (get256_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (1 * 32)));
      x2 <-
      (get256_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (2 * 32)));
      x3 <-
      (get256_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (3 * 32)));
      i <- (i + 32);
      (x0, x1, x2, x3) <@ __4u64x4_u256x4 (x0, x1, x2, x3);
      buf0 <-
      (Array536.init
      (WArray536.get8
      (WArray536.set256_direct (WArray536.init8 (fun i_0 => buf0.[i_0]))
      offset x0)));
      buf1 <-
      (Array536.init
      (WArray536.get8
      (WArray536.set256_direct (WArray536.init8 (fun i_0 => buf1.[i_0]))
      offset x1)));
      buf2 <-
      (Array536.init
      (WArray536.get8
      (WArray536.set256_direct (WArray536.init8 (fun i_0 => buf2.[i_0]))
      offset x2)));
      buf3 <-
      (Array536.init
      (WArray536.get8
      (WArray536.set256_direct (WArray536.init8 (fun i_0 => buf3.[i_0]))
      offset x3)));
      offset <- (offset + 32);
    }
    while ((i < (8 * (_LEN %/ 8)))) {
      t0 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (0 * 8)));
      buf0 <-
      (Array536.init
      (WArray536.get8
      (WArray536.set64_direct (WArray536.init8 (fun i_0 => buf0.[i_0]))
      offset t0)));
      t1 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (1 * 8)));
      buf1 <-
      (Array536.init
      (WArray536.get8
      (WArray536.set64_direct (WArray536.init8 (fun i_0 => buf1.[i_0]))
      offset t1)));
      t2 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (2 * 8)));
      buf2 <-
      (Array536.init
      (WArray536.get8
      (WArray536.set64_direct (WArray536.init8 (fun i_0 => buf2.[i_0]))
      offset t2)));
      t3 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (3 * 8)));
      buf3 <-
      (Array536.init
      (WArray536.get8
      (WArray536.set64_direct (WArray536.init8 (fun i_0 => buf3.[i_0]))
      offset t3)));
      i <- (i + 8);
      offset <- (offset + 8);
    }
    if ((0 < (_LEN %% 8))) {
      t0 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (0 * 8)));
      (buf0,  _0,  _1) <@ aBUFLEN____a_ilen_write_upto8 (buf0, offset, 0,
      (_LEN %% 8), t0);
      t1 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (1 * 8)));
      (buf1,  _2,  _3) <@ aBUFLEN____a_ilen_write_upto8 (buf1, offset, 0,
      (_LEN %% 8), t1);
      t2 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (2 * 8)));
      (buf2,  _4,  _5) <@ aBUFLEN____a_ilen_write_upto8 (buf2, offset, 0,
      (_LEN %% 8), t2);
      t3 <-
      (get64_direct (WArray800.init256 (fun i_0 => st.[i_0]))
      ((4 * i) + (3 * 8)));
      (buf3,  _6,  _7) <@ aBUFLEN____a_ilen_write_upto8 (buf3, offset, 0,
      (_LEN %% 8), t3);
      offset <- (offset + (_LEN %% 8));
    } else {
      
    }
    return (buf0, buf1, buf2, buf3, offset);
  }
  proc _sha3_512A_A33 (out:W8.t Array64.t, in_0:W8.t Array33.t) : W8.t Array64.t = {
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:W64.t Array25.t;
     _1 <- witness;
    st <- witness;
    st <@ __state_init (st);
    (st,  _0) <@ a33____absorb (st, 0, in_0, 6, 72);
    ( _1, out) <@ a64____squeeze (st, out, 72);
    return out;
  }
  proc _sha3_512A_A64 (out:W8.t Array64.t, in_0:W8.t Array64.t) : W8.t Array64.t = {
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:W64.t Array25.t;
     _1 <- witness;
    st <- witness;
    (* Erased call to spill *)
    st <@ __state_init (st);
    (st,  _0) <@ a64____absorb (st, 0, in_0, 6, 72);
    (* Erased call to unspill *)
    ( _1, out) <@ a64____squeeze (st, out, 72);
    return out;
  }
  proc _shake256x4_A128__A32_A1 (out0:W8.t Array128.t, out1:W8.t Array128.t,
                                 out2:W8.t Array128.t, out3:W8.t Array128.t,
                                 seed:W8.t Array32.t, nonces:W8.t Array4.t) : 
  W8.t Array128.t * W8.t Array128.t * W8.t Array128.t * W8.t Array128.t = {
    var st_s:W256.t Array25.t;
    var st:W256.t Array25.t;
    var  _0:int;
    var  _1:int;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ __state_init_avx2x4 (st);
    (st,  _0) <@ a32____absorb_bcast_avx2x4 (st, 0, seed, 0, 136);
    (st,  _1) <@ a1____absorb_avx2x4 (st, 32,
    (Array1.init (fun i => nonces.[(0 + i)])),
    (Array1.init (fun i => nonces.[(1 + i)])),
    (Array1.init (fun i => nonces.[(2 + i)])),
    (Array1.init (fun i => nonces.[(3 + i)])), 31, 136);
    (st, out0, out1, out2, out3) <@ a128____squeeze_avx2x4 (st, out0, 
    out1, out2, out3, 136);
    return (out0, out1, out2, out3);
  }
  proc _shake128_absorb_A32_A2 (st:W64.t Array25.t, seed:W8.t Array32.t,
                                pos:W8.t Array2.t) : W64.t Array25.t = {
    var  _0:int;
    var  _1:int;
    st <@ __state_init (st);
    (st,  _0) <@ a32____absorb (st, 0, seed, 0, 168);
    (st,  _1) <@ a2____absorb (st, 32, pos, 31, 168);
    return st;
  }
  proc _shake128x4_absorb_A32_A2 (st:W256.t Array25.t, seed:W8.t Array32.t,
                                  pos:W8.t Array8.t) : W256.t Array25.t = {
    var aT:int;
    var  _0:int;
    st <@ __state_init_avx2x4 (st);
    (st, aT) <@ a32____absorb_bcast_avx2x4 (st, 0, seed, 0, 168);
    (st,  _0) <@ a2____absorb_avx2x4 (st, 32,
    (Array2.init (fun i => pos.[(0 + i)])),
    (Array2.init (fun i => pos.[(2 + i)])),
    (Array2.init (fun i => pos.[(4 + i)])),
    (Array2.init (fun i => pos.[(6 + i)])), 31, 168);
    return st;
  }
  proc _shake128_squeeze3blocks (st:W64.t Array25.t, buf:W8.t Array536.t) : 
  W64.t Array25.t * W8.t Array536.t = {
    var ms:W64.t;
    var offset:int;
    (* Erased call to spill *)
    st <@ _keccakf1600 (st);
    (* Erased call to unspill *)
    ms <- (init_msf);
    buf <- (protect_ptr buf ms);
    offset <- 0;
    (buf, offset) <@ aBUFLEN____dumpstate (buf, offset, 168, st);
    (* Erased call to spill *)
    st <@ _keccakf1600 (st);
    (* Erased call to unspill *)
    ms <- (init_msf);
    buf <- (protect_ptr buf ms);
    (buf, offset) <@ aBUFLEN____dumpstate (buf, offset, 168, st);
    (* Erased call to spill *)
    st <@ _keccakf1600 (st);
    (* Erased call to unspill *)
    ms <- (init_msf);
    buf <- (protect_ptr buf ms);
    (buf, offset) <@ aBUFLEN____dumpstate (buf, offset, 200, st);
    return (st, buf);
  }
  proc _shake128_next_state (buf:W8.t Array536.t) : W8.t Array536.t = {
    var st:W64.t Array25.t;
    var ms:W64.t;
    st <- witness;
    (* Erased call to spill *)
    st <-
    (Array25.init
    (fun i => (get64 (WArray536.init8 (fun i => buf.[i]))
              ((2 * (168 %/ 8)) + i)))
    );
    st <@ _keccakf1600 (st);
    (* Erased call to unspill *)
    ms <- (init_msf);
    buf <- (protect_ptr buf ms);
    buf <-
    (Array536.init
    (WArray536.get8
    (WArray536.init8
    (fun i => (if ((8 * (2 * (168 %/ 8))) <= i < ((8 * (2 * (168 %/ 8))) +
                                                 200)) then (WArray200.get8
                                                            (WArray200.init64
                                                            (fun i => st.[i])
                                                            )
                                                            (i -
                                                            (8 *
                                                            (2 * (168 %/ 8))))
                                                            ) else (
                                                                   WArray536.get8
                                                                   (
                                                                   WArray536.init8
                                                                   (fun i => 
                                                                   buf.[
                                                                   i])) 
                                                                   i)))
    )));
    return buf;
  }
  proc _shake128x4_squeeze3blocks (st:W256.t Array25.t, buf:W8.t Array2144.t) : 
  W256.t Array25.t * W8.t Array2144.t = {
    var buf0:W8.t Array536.t;
    var buf1:W8.t Array536.t;
    var buf2:W8.t Array536.t;
    var buf3:W8.t Array536.t;
    var offset:int;
    buf0 <- witness;
    buf1 <- witness;
    buf2 <- witness;
    buf3 <- witness;
    buf0 <- (Array536.init (fun i => buf.[((0 * 536) + i)]));
    buf1 <- (Array536.init (fun i => buf.[((1 * 536) + i)]));
    buf2 <- (Array536.init (fun i => buf.[((2 * 536) + i)]));
    buf3 <- (Array536.init (fun i => buf.[((3 * 536) + i)]));
    offset <- 0;
    st <@ _keccakf1600_avx2x4 (st);
    (buf0, buf1, buf2, buf3, offset) <@ aBUFLEN____dumpstate_avx2x4 (
    buf0, buf1, buf2, buf3, offset, 168, st);
    st <@ _keccakf1600_avx2x4 (st);
    (buf0, buf1, buf2, buf3, offset) <@ aBUFLEN____dumpstate_avx2x4 (
    buf0, buf1, buf2, buf3, offset, 168, st);
    st <@ _keccakf1600_avx2x4 (st);
    (buf0, buf1, buf2, buf3, offset) <@ aBUFLEN____dumpstate_avx2x4 (
    buf0, buf1, buf2, buf3, offset, 200, st);
    buf <-
    (Array2144.init
    (fun i => (if ((0 * 536) <= i < ((0 * 536) + 536)) then buf0.[(i -
                                                                  (0 * 536))] else 
              buf.[i]))
    );
    buf <-
    (Array2144.init
    (fun i => (if ((1 * 536) <= i < ((1 * 536) + 536)) then buf1.[(i -
                                                                  (1 * 536))] else 
              buf.[i]))
    );
    buf <-
    (Array2144.init
    (fun i => (if ((2 * 536) <= i < ((2 * 536) + 536)) then buf2.[(i -
                                                                  (2 * 536))] else 
              buf.[i]))
    );
    buf <-
    (Array2144.init
    (fun i => (if ((3 * 536) <= i < ((3 * 536) + 536)) then buf3.[(i -
                                                                  (3 * 536))] else 
              buf.[i]))
    );
    return (st, buf);
  }
  proc _sha3_256A_A1184 (out:W8.t Array32.t, in_0:W8.t Array1184.t) : 
  W8.t Array32.t = {
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:W64.t Array25.t;
     _1 <- witness;
    st <- witness;
    (* Erased call to spill *)
    st <@ __state_init (st);
    (st,  _0) <@ a1184____absorb (st, 0, in_0, 6, 136);
    (* Erased call to unspill *)
    ( _1, out) <@ a32____squeeze (st, out, 136);
    return out;
  }
  proc _shake256_A32__A1120 (out:W8.t Array32.t, in_0:W8.t Array1120.t) : 
  W8.t Array32.t = {
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:W64.t Array25.t;
     _1 <- witness;
    st <- witness;
    (* Erased call to spill *)
    st <@ __state_init (st);
    (st,  _0) <@ a1120____absorb (st, 0, in_0, 31, 136);
    (* Erased call to unspill *)
    ( _1, out) <@ a32____squeeze (st, out, 136);
    return out;
  }
  proc _poly_add2 (rp:W16.t Array256.t, bp:W16.t Array256.t) : W16.t Array256.t = {
    var i:int;
    var a:W256.t;
    var b:W256.t;
    var r:W256.t;
    i <- 0;
    while ((i < 16)) {
      a <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * i));
      b <- (get256_direct (WArray512.init16 (fun i_0 => bp.[i_0])) (32 * i));
      r <- (VPADD_16u16 a b);
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      (32 * i) r)));
      i <- (i + 1);
    }
    return rp;
  }
  proc _poly_csubq (rp:W16.t Array256.t) : W16.t Array256.t = {
    var qx16:W256.t;
    var i:int;
    var r:W256.t;
    qx16 <- (get256 (WArray32.init16 (fun i_0 => jqx16.[i_0])) 0);
    i <- 0;
    while ((i < 16)) {
      r <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * i));
      r <@ __csubq (r, qx16);
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      (32 * i) r)));
      i <- (i + 1);
    }
    return rp;
  }
  proc __w256_interleave_u16 (al:W256.t, ah:W256.t) : W256.t * W256.t = {
    var a0:W256.t;
    var a1:W256.t;
    a0 <- (VPUNPCKL_16u16 al ah);
    a1 <- (VPUNPCKH_16u16 al ah);
    return (a0, a1);
  }
  proc __w256_deinterleave_u16 (_zero:W256.t, a0:W256.t, a1:W256.t) : 
  W256.t * W256.t = {
    var al:W256.t;
    var ah:W256.t;
    al <- (VPBLEND_16u16 a0 _zero (W8.of_int 170));
    ah <- (VPBLEND_16u16 a1 _zero (W8.of_int 170));
    al <- (VPACKUS_8u32 al ah);
    a0 <- (VPSRL_8u32 a0 (W128.of_int 16));
    a1 <- (VPSRL_8u32 a1 (W128.of_int 16));
    ah <- (VPACKUS_8u32 a0 a1);
    return (al, ah);
  }
  proc __mont_red (lo:W256.t, hi:W256.t, qx16:W256.t, qinvx16:W256.t) : 
  W256.t = {
    var m:W256.t;
    m <- (VPMULL_16u16 lo qinvx16);
    m <- (VPMULH_16u16 m qx16);
    lo <- (VPSUB_16u16 hi m);
    return lo;
  }
  proc __wmul_16u16 (x:W256.t, y:W256.t) : W256.t * W256.t = {
    var xy0:W256.t;
    var xy1:W256.t;
    var xyL:W256.t;
    var xyH:W256.t;
    xyL <- (VPMULL_16u16 x y);
    xyH <- (VPMULH_16u16 x y);
    (xy0, xy1) <@ __w256_interleave_u16 (xyL, xyH);
    return (xy0, xy1);
  }
  proc __schoolbook16x (are:W256.t, aim:W256.t, bre:W256.t, bim:W256.t,
                        zeta_0:W256.t, zetaqinv:W256.t, qx16:W256.t,
                        qinvx16:W256.t, sign:int) : W256.t * W256.t = {
    var x0:W256.t;
    var y0:W256.t;
    var zaim:W256.t;
    var ac0:W256.t;
    var ac1:W256.t;
    var ad0:W256.t;
    var ad1:W256.t;
    var bc0:W256.t;
    var bc1:W256.t;
    var zbd0:W256.t;
    var zbd1:W256.t;
    var x1:W256.t;
    var y1:W256.t;
    var _zero:W256.t;
    zaim <@ __fqmulprecomp16x (aim, zetaqinv, zeta_0, qx16);
    (ac0, ac1) <@ __wmul_16u16 (are, bre);
    (ad0, ad1) <@ __wmul_16u16 (are, bim);
    (bc0, bc1) <@ __wmul_16u16 (aim, bre);
    (zbd0, zbd1) <@ __wmul_16u16 (zaim, bim);
    if ((sign = 0)) {
      x0 <- (VPADD_8u32 ac0 zbd0);
      x1 <- (VPADD_8u32 ac1 zbd1);
    } else {
      x0 <- (VPSUB_8u32 ac0 zbd0);
      x1 <- (VPSUB_8u32 ac1 zbd1);
    }
    y0 <- (VPADD_8u32 bc0 ad0);
    y1 <- (VPADD_8u32 bc1 ad1);
    _zero <- (set0_256);
    (x0, x1) <@ __w256_deinterleave_u16 (_zero, x0, x1);
    (y0, y1) <@ __w256_deinterleave_u16 (_zero, y0, y1);
    x0 <@ __mont_red (x0, x1, qx16, qinvx16);
    y0 <@ __mont_red (y0, y1, qx16, qinvx16);
    return (x0, y0);
  }
  proc _poly_basemul (rp:W16.t Array256.t, ap:W16.t Array256.t,
                      bp:W16.t Array256.t) : W16.t Array256.t = {
    var qx16:W256.t;
    var qinvx16:W256.t;
    var zetaqinv:W256.t;
    var zeta_0:W256.t;
    var are:W256.t;
    var aim:W256.t;
    var bre:W256.t;
    var bim:W256.t;
    qx16 <- (get256_direct (WArray32.init16 (fun i => jqx16.[i])) 0);
    qinvx16 <- (get256_direct (WArray32.init16 (fun i => jqinvx16.[i])) 0);
    zetaqinv <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 272);
    zeta_0 <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 304);
    are <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 0));
    aim <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 1));
    bre <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 0));
    bim <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 1));
    (are, aim) <@ __schoolbook16x (are, aim, bre, bim, zeta_0, zetaqinv,
    qx16, qinvx16, 0);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 0)
    are)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 1)
    aim)));
    are <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 2));
    aim <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 3));
    bre <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 2));
    bim <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 3));
    (are, aim) <@ __schoolbook16x (are, aim, bre, bim, zeta_0, zetaqinv,
    qx16, qinvx16, 1);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 2)
    are)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 3)
    aim)));
    zetaqinv <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 336);
    zeta_0 <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 368);
    are <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 4));
    aim <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 5));
    bre <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 4));
    bim <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 5));
    (are, aim) <@ __schoolbook16x (are, aim, bre, bim, zeta_0, zetaqinv,
    qx16, qinvx16, 0);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 4)
    are)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 5)
    aim)));
    are <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 6));
    aim <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 7));
    bre <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 6));
    bim <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 7));
    (are, aim) <@ __schoolbook16x (are, aim, bre, bim, zeta_0, zetaqinv,
    qx16, qinvx16, 1);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 6)
    are)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 7)
    aim)));
    zetaqinv <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 664);
    zeta_0 <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 696);
    are <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 8));
    aim <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 9));
    bre <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 8));
    bim <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 9));
    (are, aim) <@ __schoolbook16x (are, aim, bre, bim, zeta_0, zetaqinv,
    qx16, qinvx16, 0);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 8)
    are)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 9)
    aim)));
    are <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 10));
    aim <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 11));
    bre <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 10));
    bim <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 11));
    (are, aim) <@ __schoolbook16x (are, aim, bre, bim, zeta_0, zetaqinv,
    qx16, qinvx16, 1);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 10)
    are)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 11)
    aim)));
    zetaqinv <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 728);
    zeta_0 <-
    (get256_direct (WArray800.init16 (fun i => jzetas_exp.[i])) 760);
    are <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 12));
    aim <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 13));
    bre <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 12));
    bim <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 13));
    (are, aim) <@ __schoolbook16x (are, aim, bre, bim, zeta_0, zetaqinv,
    qx16, qinvx16, 0);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 12)
    are)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 13)
    aim)));
    are <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 14));
    aim <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * 15));
    bre <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 14));
    bim <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * 15));
    (are, aim) <@ __schoolbook16x (are, aim, bre, bim, zeta_0, zetaqinv,
    qx16, qinvx16, 1);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 14)
    are)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * 15)
    aim)));
    return rp;
  }
  proc _i_poly_frombytes (rp:W16.t Array256.t, ap:W8.t Array384.t) : 
  W16.t Array256.t = {
    var mask:W256.t;
    var i:int;
    var t0:W256.t;
    var t1:W256.t;
    var t2:W256.t;
    var t3:W256.t;
    var t4:W256.t;
    var t5:W256.t;
    var tt:W256.t;
    var t6:W256.t;
    var t7:W256.t;
    var t8:W256.t;
    var t9:W256.t;
    var t10:W256.t;
    var t11:W256.t;
    mask <- (get256 (WArray32.init16 (fun i_0 => maskx16.[i_0])) 0);
    i <- 0;
    while ((i < 2)) {
      t0 <-
      (get256_direct (WArray384.init8 (fun i_0 => ap.[i_0])) (192 * i));
      t1 <-
      (get256_direct (WArray384.init8 (fun i_0 => ap.[i_0])) ((192 * i) + 32)
      );
      t2 <-
      (get256_direct (WArray384.init8 (fun i_0 => ap.[i_0])) ((192 * i) + 64)
      );
      t3 <-
      (get256_direct (WArray384.init8 (fun i_0 => ap.[i_0])) ((192 * i) + 96)
      );
      t4 <-
      (get256_direct (WArray384.init8 (fun i_0 => ap.[i_0]))
      ((192 * i) + 128));
      t5 <-
      (get256_direct (WArray384.init8 (fun i_0 => ap.[i_0]))
      ((192 * i) + 160));
      (tt, t3) <@ __shuffle8 (t0, t3);
      (t0, t4) <@ __shuffle8 (t1, t4);
      (t1, t5) <@ __shuffle8 (t2, t5);
      (t2, t4) <@ __shuffle4 (tt, t4);
      (tt, t1) <@ __shuffle4 (t3, t1);
      (t3, t5) <@ __shuffle4 (t0, t5);
      (t0, t1) <@ __shuffle2 (t2, t1);
      (t2, t3) <@ __shuffle2 (t4, t3);
      (t4, t5) <@ __shuffle2 (tt, t5);
      (t6, t3) <@ __shuffle1 (t0, t3);
      (t0, t4) <@ __shuffle1 (t1, t4);
      (t1, t5) <@ __shuffle1 (t2, t5);
      t7 <- (VPSRL_16u16 t6 (W128.of_int 12));
      t8 <- (VPSLL_16u16 t3 (W128.of_int 4));
      t7 <- (VPOR_256 t7 t8);
      t6 <- (VPAND_256 mask t6);
      t7 <- (VPAND_256 mask t7);
      t8 <- (VPSRL_16u16 t3 (W128.of_int 8));
      t9 <- (VPSLL_16u16 t0 (W128.of_int 8));
      t8 <- (VPOR_256 t8 t9);
      t8 <- (VPAND_256 mask t8);
      t9 <- (VPSRL_16u16 t0 (W128.of_int 4));
      t9 <- (VPAND_256 mask t9);
      t10 <- (VPSRL_16u16 t4 (W128.of_int 12));
      t11 <- (VPSLL_16u16 t1 (W128.of_int 4));
      t10 <- (VPOR_256 t10 t11);
      t4 <- (VPAND_256 mask t4);
      t10 <- (VPAND_256 mask t10);
      t11 <- (VPSRL_16u16 t1 (W128.of_int 8));
      tt <- (VPSLL_16u16 t5 (W128.of_int 8));
      t11 <- (VPOR_256 t11 tt);
      t11 <- (VPAND_256 mask t11);
      tt <- (VPSRL_16u16 t5 (W128.of_int 4));
      tt <- (VPAND_256 mask tt);
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0])) (8 * i) t6))
      );
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((8 * i) + 1) t7)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((8 * i) + 2) t8)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((8 * i) + 3) t9)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((8 * i) + 4) t4)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((8 * i) + 5) t10)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((8 * i) + 6) t11)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((8 * i) + 7) tt)));
      i <- (i + 1);
    }
    return rp;
  }
  proc _poly_frommont (rp:W16.t Array256.t) : W16.t Array256.t = {
    var inc:int;
    var qx16:W256.t;
    var qinvx16:W256.t;
    var dmontx16:W256.t;
    var i:int;
    var t:W256.t;
    qx16 <- (get256 (WArray32.init16 (fun i_0 => jqx16.[i_0])) 0);
    qinvx16 <- (get256 (WArray32.init16 (fun i_0 => jqinvx16.[i_0])) 0);
    dmontx16 <- (get256 (WArray32.init16 (fun i_0 => jdmontx16.[i_0])) 0);
    inc <- (256 %/ 16);
    i <- 0;
    while ((i < inc)) {
      t <- (get256 (WArray512.init16 (fun i_0 => rp.[i_0])) i);
      t <@ __fqmulx16 (t, dmontx16, qx16, qinvx16);
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0])) i t)));
      i <- (i + 1);
    }
    return rp;
  }
  proc _i_poly_frommsg (rp:W16.t Array256.t, ap:W8.t Array32.t) : W16.t Array256.t = {
    var hqs:W256.t;
    var shift:W256.t;
    var idx:W256.t;
    var f:W256.t;
    var i:int;
    var g3:W256.t;
    var g0:W256.t;
    var g1:W256.t;
    var g2:W256.t;
    var h0:W256.t;
    var h2:W256.t;
    var h1:W256.t;
    var h3:W256.t;
    hqs <- (get256 (WArray32.init16 (fun i_0 => hqx16_p1.[i_0])) 0);
    shift <-
    (VPBROADCAST_2u128
    (get128 (WArray16.init32 (fun i_0 => pfm_shift_s.[i_0])) 0));
    idx <-
    (VPBROADCAST_2u128
    (get128 (WArray16.init8 (fun i_0 => pfm_idx_s.[i_0])) 0));
    f <- (get256 (WArray32.init8 (fun i_0 => ap.[i_0])) 0);
    i <- 0;
    while ((i < 4)) {
      g3 <- (VPSHUFD_256 f (W8.of_int (85 * i)));
      g3 <- (VPSLLV_8u32 g3 shift);
      g3 <- (VPSHUFB_256 g3 idx);
      g0 <- (VPSLL_16u16 g3 (W128.of_int 12));
      g1 <- (VPSLL_16u16 g3 (W128.of_int 8));
      g2 <- (VPSLL_16u16 g3 (W128.of_int 4));
      g0 <- (VPSRA_16u16 g0 (W128.of_int 15));
      g1 <- (VPSRA_16u16 g1 (W128.of_int 15));
      g2 <- (VPSRA_16u16 g2 (W128.of_int 15));
      g3 <- (VPSRA_16u16 g3 (W128.of_int 15));
      g0 <- (VPAND_256 g0 hqs);
      g1 <- (VPAND_256 g1 hqs);
      g2 <- (VPAND_256 g2 hqs);
      g3 <- (VPAND_256 g3 hqs);
      h0 <- (VPUNPCKL_4u64 g0 g1);
      h2 <- (VPUNPCKH_4u64 g0 g1);
      h1 <- (VPUNPCKL_4u64 g2 g3);
      h3 <- (VPUNPCKH_4u64 g2 g3);
      g0 <- (VPERM2I128 h0 h1 (W8.of_int 32));
      g2 <- (VPERM2I128 h0 h1 (W8.of_int 49));
      g1 <- (VPERM2I128 h2 h3 (W8.of_int 32));
      g3 <- (VPERM2I128 h2 h3 (W8.of_int 49));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0])) (2 * i) g0))
      );
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((2 * i) + 1) g1)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((2 * i) + 8) g2)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      (((2 * i) + 8) + 1) g3)));
      i <- (i + 1);
    }
    return rp;
  }
  proc __cbd2 (rp:W16.t Array256.t, buf:W8.t Array128.t) : W16.t Array256.t = {
    var inc:int;
    var mask55_s:W32.t;
    var mask33_s:W32.t;
    var mask03_s:W32.t;
    var mask0F_s:W32.t;
    var mask55:W256.t;
    var mask33:W256.t;
    var mask03:W256.t;
    var mask0F:W256.t;
    var i:int;
    var f0:W256.t;
    var f1:W256.t;
    var f2:W256.t;
    var f3:W256.t;
    var t:W128.t;
    mask55_s <- (W32.of_int 1431655765);
    mask33_s <- (W32.of_int 858993459);
    mask03_s <- (W32.of_int 50529027);
    mask0F_s <- (W32.of_int 252645135);
    mask55 <- (VPBROADCAST_8u32 mask55_s);
    mask33 <- (VPBROADCAST_8u32 mask33_s);
    mask03 <- (VPBROADCAST_8u32 mask03_s);
    mask0F <- (VPBROADCAST_8u32 mask0F_s);
    inc <- (256 %/ 64);
    i <- 0;
    while ((i < inc)) {
      f0 <- (get256 (WArray128.init8 (fun i_0 => buf.[i_0])) i);
      f1 <- (VPSRL_16u16 f0 (W128.of_int 1));
      f0 <- (VPAND_256 mask55 f0);
      f1 <- (VPAND_256 mask55 f1);
      f0 <- (VPADD_32u8 f0 f1);
      f1 <- (VPSRL_16u16 f0 (W128.of_int 2));
      f0 <- (VPAND_256 mask33 f0);
      f1 <- (VPAND_256 mask33 f1);
      f0 <- (VPADD_32u8 f0 mask33);
      f0 <- (VPSUB_32u8 f0 f1);
      f1 <- (VPSRL_16u16 f0 (W128.of_int 4));
      f0 <- (VPAND_256 mask0F f0);
      f1 <- (VPAND_256 mask0F f1);
      f0 <- (VPSUB_32u8 f0 mask03);
      f1 <- (VPSUB_32u8 f1 mask03);
      f2 <- (VPUNPCKL_32u8 f0 f1);
      f3 <- (VPUNPCKH_32u8 f0 f1);
      t <- (truncateu128 f2);
      f0 <- (VPMOVSX_16u8_16u16 t);
      t <- (VEXTRACTI128 f2 (W8.of_int 1));
      f1 <- (VPMOVSX_16u8_16u16 t);
      t <- (truncateu128 f3);
      f2 <- (VPMOVSX_16u8_16u16 t);
      t <- (VEXTRACTI128 f3 (W8.of_int 1));
      f3 <- (VPMOVSX_16u8_16u16 t);
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0])) (4 * i) f0))
      );
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((4 * i) + 1) f2)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((4 * i) + 2) f1)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((4 * i) + 3) f3)));
      i <- (i + 1);
    }
    return rp;
  }
  proc __poly_cbd_eta1 (rp:W16.t Array256.t, buf:W8.t Array128.t) : W16.t Array256.t = {
    
    rp <@ __cbd2 (rp, (Array128.init (fun i => buf.[(0 + i)])));
    return rp;
  }
  proc _poly_getnoise_eta1_4x (r0:W16.t Array256.t, r1:W16.t Array256.t,
                               r2:W16.t Array256.t, r3:W16.t Array256.t,
                               seed:W8.t Array32.t, nonce:W8.t) : W16.t Array256.t *
                                                                  W16.t Array256.t *
                                                                  W16.t Array256.t *
                                                                  W16.t Array256.t = {
    var buf0_s:W8.t Array128.t;
    var buf0:W8.t Array128.t;
    var buf1_s:W8.t Array128.t;
    var buf1:W8.t Array128.t;
    var buf2_s:W8.t Array128.t;
    var buf2:W8.t Array128.t;
    var buf3_s:W8.t Array128.t;
    var buf3:W8.t Array128.t;
    var nonces:W8.t Array4.t;
    var  _0:W64.t;
    buf0 <- witness;
    buf0_s <- witness;
    buf1 <- witness;
    buf1_s <- witness;
    buf2 <- witness;
    buf2_s <- witness;
    buf3 <- witness;
    buf3_s <- witness;
    nonces <- witness;
    buf0 <- buf0_s;
    buf1 <- buf1_s;
    buf2 <- buf2_s;
    buf3 <- buf3_s;
    (* Erased call to spill *)
    nonces.[0] <- nonce;
    nonce <- (nonce + (W8.of_int 1));
    nonces.[1] <- nonce;
    nonce <- (nonce + (W8.of_int 1));
    nonces.[2] <- nonce;
    nonce <- (nonce + (W8.of_int 1));
    nonces.[3] <- nonce;
    (buf0, buf1, buf2, buf3) <@ _shake256x4_A128__A32_A1 (buf0, buf1, 
    buf2, buf3, seed, nonces);
     _0 <- (init_msf);
    (* Erased call to unspill *)
    r0 <@ __poly_cbd_eta1 (r0, buf0);
    r1 <@ __poly_cbd_eta1 (r1, buf1);
    r2 <@ __poly_cbd_eta1 (r2, buf2);
    r3 <@ __poly_cbd_eta1 (r3, buf3);
    return (r0, r1, r2, r3);
  }
  proc __invntt___butterfly64x (rl0:W256.t, rl1:W256.t, rl2:W256.t,
                                rl3:W256.t, rh0:W256.t, rh1:W256.t,
                                rh2:W256.t, rh3:W256.t, zl0:W256.t,
                                zl1:W256.t, zh0:W256.t, zh1:W256.t,
                                qx16:W256.t) : W256.t * W256.t * W256.t *
                                               W256.t * W256.t * W256.t *
                                               W256.t * W256.t = {
    var t0:W256.t;
    var t1:W256.t;
    var t2:W256.t;
    var t3:W256.t;
    t0 <- (VPSUB_16u16 rl0 rh0);
    t1 <- (VPSUB_16u16 rl1 rh1);
    t2 <- (VPSUB_16u16 rl2 rh2);
    rl0 <- (VPADD_16u16 rh0 rl0);
    rl1 <- (VPADD_16u16 rh1 rl1);
    rh0 <- (VPMULL_16u16 zl0 t0);
    rl2 <- (VPADD_16u16 rh2 rl2);
    rh1 <- (VPMULL_16u16 zl0 t1);
    t3 <- (VPSUB_16u16 rl3 rh3);
    rl3 <- (VPADD_16u16 rh3 rl3);
    rh2 <- (VPMULL_16u16 zl1 t2);
    rh3 <- (VPMULL_16u16 zl1 t3);
    t0 <- (VPMULH_16u16 zh0 t0);
    t1 <- (VPMULH_16u16 zh0 t1);
    t2 <- (VPMULH_16u16 zh1 t2);
    t3 <- (VPMULH_16u16 zh1 t3);
    rh0 <- (VPMULH_16u16 qx16 rh0);
    rh1 <- (VPMULH_16u16 qx16 rh1);
    rh2 <- (VPMULH_16u16 qx16 rh2);
    rh3 <- (VPMULH_16u16 qx16 rh3);
    rh0 <- (VPSUB_16u16 t0 rh0);
    rh1 <- (VPSUB_16u16 t1 rh1);
    rh2 <- (VPSUB_16u16 t2 rh2);
    rh3 <- (VPSUB_16u16 t3 rh3);
    return (rl0, rl1, rl2, rl3, rh0, rh1, rh2, rh3);
  }
  proc _poly_invntt (rp:W16.t Array256.t) : W16.t Array256.t = {
    var qx16:W256.t;
    var i:int;
    var zeta0:W256.t;
    var zeta1:W256.t;
    var zeta2:W256.t;
    var zeta3:W256.t;
    var r0:W256.t;
    var r1:W256.t;
    var r2:W256.t;
    var r3:W256.t;
    var r4:W256.t;
    var r5:W256.t;
    var r6:W256.t;
    var r7:W256.t;
    var vx16:W256.t;
    var flox16:W256.t;
    var fhix16:W256.t;
    qx16 <- (get256 (WArray32.init16 (fun i_0 => jqx16.[i_0])) 0);
    i <- 0;
    while ((i < 2)) {
      zeta0 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (0 + (392 * i)));
      zeta1 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (64 + (392 * i)));
      zeta2 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (32 + (392 * i)));
      zeta3 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (96 + (392 * i)));
      r0 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 0) + (256 * i)));
      r1 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 1) + (256 * i)));
      r2 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 2) + (256 * i)));
      r3 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 3) + (256 * i)));
      r4 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 4) + (256 * i)));
      r5 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 5) + (256 * i)));
      r6 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 6) + (256 * i)));
      r7 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 7) + (256 * i)));
      (r0, r1, r4, r5, r2, r3, r6, r7) <@ __invntt___butterfly64x (r0, 
      r1, r4, r5, r2, r3, r6, r7, zeta0, zeta1, zeta2, zeta3, qx16);
      vx16 <- (get256 (WArray32.init16 (fun i_0 => jvx16.[i_0])) 0);
      zeta0 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (128 + (392 * i)));
      zeta1 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (160 + (392 * i)));
      r0 <@ __red16x (r0, qx16, vx16);
      r1 <@ __red16x (r1, qx16, vx16);
      r4 <@ __red16x (r4, qx16, vx16);
      r5 <@ __red16x (r5, qx16, vx16);
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ __invntt___butterfly64x (r0, 
      r1, r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      (r0, r1) <@ __shuffle1 (r0, r1);
      (r2, r3) <@ __shuffle1 (r2, r3);
      (r4, r5) <@ __shuffle1 (r4, r5);
      (r6, r7) <@ __shuffle1 (r6, r7);
      zeta0 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (192 + (392 * i)));
      zeta1 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (224 + (392 * i)));
      (r0, r2, r4, r6, r1, r3, r5, r7) <@ __invntt___butterfly64x (r0, 
      r2, r4, r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      r0 <@ __red16x (r0, qx16, vx16);
      (r0, r2) <@ __shuffle2 (r0, r2);
      (r4, r6) <@ __shuffle2 (r4, r6);
      (r1, r3) <@ __shuffle2 (r1, r3);
      (r5, r7) <@ __shuffle2 (r5, r7);
      zeta0 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (256 + (392 * i)));
      zeta1 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (288 + (392 * i)));
      (r0, r4, r1, r5, r2, r6, r3, r7) <@ __invntt___butterfly64x (r0, 
      r4, r1, r5, r2, r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      r0 <@ __red16x (r0, qx16, vx16);
      (r0, r4) <@ __shuffle4 (r0, r4);
      (r1, r5) <@ __shuffle4 (r1, r5);
      (r2, r6) <@ __shuffle4 (r2, r6);
      (r3, r7) <@ __shuffle4 (r3, r7);
      zeta0 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (320 + (392 * i)));
      zeta1 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (352 + (392 * i)));
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ __invntt___butterfly64x (r0, 
      r1, r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      r0 <@ __red16x (r0, qx16, vx16);
      (r0, r1) <@ __shuffle8 (r0, r1);
      (r2, r3) <@ __shuffle8 (r2, r3);
      (r4, r5) <@ __shuffle8 (r4, r5);
      (r6, r7) <@ __shuffle8 (r6, r7);
      zeta0 <-
      (VPBROADCAST_8u32
      (get32_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (384 + (392 * i))));
      zeta1 <-
      (VPBROADCAST_8u32
      (get32_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0]))
      (388 + (392 * i))));
      (r0, r2, r4, r6, r1, r3, r5, r7) <@ __invntt___butterfly64x (r0, 
      r2, r4, r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      r0 <@ __red16x (r0, qx16, vx16);
      if ((i = 0)) {
        rp <-
        (Array256.init
        (WArray512.get16
        (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 0) + (256 * i)) r0)));
        rp <-
        (Array256.init
        (WArray512.get16
        (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 1) + (256 * i)) r2)));
        rp <-
        (Array256.init
        (WArray512.get16
        (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 2) + (256 * i)) r4)));
        rp <-
        (Array256.init
        (WArray512.get16
        (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 3) + (256 * i)) r6)));
      } else {
        
      }
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 4) + (256 * i)) r1)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 5) + (256 * i)) r3)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 6) + (256 * i)) r5)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 7) + (256 * i)) r7)));
      i <- (i + 1);
    }
    zeta0 <-
    (VPBROADCAST_8u32
    (get32_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0])) 784));
    zeta1 <-
    (VPBROADCAST_8u32
    (get32_direct (WArray800.init16 (fun i_0 => jzetas_inv_exp.[i_0])) 788));
    i <- 0;
    while ((i < 2)) {
      if ((i = 0)) {
        r7 <- r6;
        r6 <- r4;
        r5 <- r2;
        r4 <- r0;
      } else {
        r4 <-
        (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 8) + (128 * i)));
        r5 <-
        (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 9) + (128 * i)));
        r6 <-
        (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 10) + (128 * i)));
        r7 <-
        (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 11) + (128 * i)));
      }
      r0 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 0) + (128 * i)));
      r1 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 1) + (128 * i)));
      r2 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 2) + (128 * i)));
      r3 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 3) + (128 * i)));
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ __invntt___butterfly64x (r0, 
      r1, r2, r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      flox16 <- (get256 (WArray32.init16 (fun i_0 => jflox16.[i_0])) 0);
      fhix16 <- (get256 (WArray32.init16 (fun i_0 => jfhix16.[i_0])) 0);
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 8) + (128 * i)) r4)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 9) + (128 * i)) r5)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 10) + (128 * i)) r6)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 11) + (128 * i)) r7)));
      r0 <@ __fqmulprecomp16x (r0, flox16, fhix16, qx16);
      r1 <@ __fqmulprecomp16x (r1, flox16, fhix16, qx16);
      r2 <@ __fqmulprecomp16x (r2, flox16, fhix16, qx16);
      r3 <@ __fqmulprecomp16x (r3, flox16, fhix16, qx16);
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 0) + (128 * i)) r0)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 1) + (128 * i)) r1)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 2) + (128 * i)) r2)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 3) + (128 * i)) r3)));
      i <- (i + 1);
    }
    return rp;
  }
  proc __butterfly64x (rl0:W256.t, rl1:W256.t, rl2:W256.t, rl3:W256.t,
                       rh0:W256.t, rh1:W256.t, rh2:W256.t, rh3:W256.t,
                       zl0:W256.t, zl1:W256.t, zh0:W256.t, zh1:W256.t,
                       qx16:W256.t) : W256.t * W256.t * W256.t * W256.t *
                                      W256.t * W256.t * W256.t * W256.t = {
    var t0:W256.t;
    var t1:W256.t;
    var t2:W256.t;
    var t3:W256.t;
    var t4:W256.t;
    var t5:W256.t;
    var t6:W256.t;
    var t7:W256.t;
    t0 <- (VPMULL_16u16 zl0 rh0);
    t1 <- (VPMULH_16u16 zh0 rh0);
    t2 <- (VPMULL_16u16 zl0 rh1);
    t3 <- (VPMULH_16u16 zh0 rh1);
    t4 <- (VPMULL_16u16 zl1 rh2);
    t5 <- (VPMULH_16u16 zh1 rh2);
    t6 <- (VPMULL_16u16 zl1 rh3);
    t7 <- (VPMULH_16u16 zh1 rh3);
    t0 <- (VPMULH_16u16 t0 qx16);
    t2 <- (VPMULH_16u16 t2 qx16);
    t4 <- (VPMULH_16u16 t4 qx16);
    t6 <- (VPMULH_16u16 t6 qx16);
    rh1 <- (VPSUB_16u16 rl1 t3);
    rl1 <- (VPADD_16u16 t3 rl1);
    rh0 <- (VPSUB_16u16 rl0 t1);
    rl0 <- (VPADD_16u16 t1 rl0);
    rh3 <- (VPSUB_16u16 rl3 t7);
    rl3 <- (VPADD_16u16 t7 rl3);
    rh2 <- (VPSUB_16u16 rl2 t5);
    rl2 <- (VPADD_16u16 t5 rl2);
    rh0 <- (VPADD_16u16 t0 rh0);
    rl0 <- (VPSUB_16u16 rl0 t0);
    rh1 <- (VPADD_16u16 t2 rh1);
    rl1 <- (VPSUB_16u16 rl1 t2);
    rh2 <- (VPADD_16u16 t4 rh2);
    rl2 <- (VPSUB_16u16 rl2 t4);
    rh3 <- (VPADD_16u16 t6 rh3);
    rl3 <- (VPSUB_16u16 rl3 t6);
    return (rl0, rl1, rl2, rl3, rh0, rh1, rh2, rh3);
  }
  proc _poly_ntt (rp:W16.t Array256.t) : W16.t Array256.t = {
    var qx16:W256.t;
    var zeta0:W256.t;
    var zeta1:W256.t;
    var r0:W256.t;
    var r1:W256.t;
    var r2:W256.t;
    var r3:W256.t;
    var r4:W256.t;
    var r5:W256.t;
    var r6:W256.t;
    var r7:W256.t;
    var i:int;
    var zeta2:W256.t;
    var zeta3:W256.t;
    var vx16:W256.t;
    qx16 <- (get256 (WArray32.init16 (fun i_0 => jqx16.[i_0])) 0);
    zeta0 <-
    (VPBROADCAST_8u32
    (get32 (WArray800.init16 (fun i_0 => jzetas_exp.[i_0])) 0));
    zeta1 <-
    (VPBROADCAST_8u32
    (get32 (WArray800.init16 (fun i_0 => jzetas_exp.[i_0])) 1));
    r0 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 0));
    r1 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 1));
    r2 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 2));
    r3 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 3));
    r4 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 8));
    r5 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 9));
    r6 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 10));
    r7 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 11));
    (r0, r1, r2, r3, r4, r5, r6, r7) <@ __butterfly64x (r0, r1, r2, r3, 
    r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 0) r0)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 1) r1)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 2) r2)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 3) r3)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 8) r4)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 9) r5)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 10) r6)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 11) r7)));
    r0 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 4));
    r1 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 5));
    r2 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 6));
    r3 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 7));
    r4 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 12));
    r5 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 13));
    r6 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 14));
    r7 <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * 15));
    (r0, r1, r2, r3, r4, r5, r6, r7) <@ __butterfly64x (r0, r1, r2, r3, 
    r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 12) r4)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 13) r5)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 14) r6)));
    rp <-
    (Array256.init
    (WArray512.get16
    (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
    (32 * 15) r7)));
    i <- 0;
    while ((i < 2)) {
      zeta0 <-
      (VPBROADCAST_8u32
      (get32_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (8 + (392 * i))));
      zeta1 <-
      (VPBROADCAST_8u32
      (get32_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (12 + (392 * i))));
      if ((i = 0)) {
        r4 <- r0;
        r5 <- r1;
        r6 <- r2;
        r7 <- r3;
      } else {
        r4 <-
        (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 4) + (256 * i)));
        r5 <-
        (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 5) + (256 * i)));
        r6 <-
        (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 6) + (256 * i)));
        r7 <-
        (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
        ((32 * 7) + (256 * i)));
      }
      r0 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 0) + (256 * i)));
      r1 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 1) + (256 * i)));
      r2 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 2) + (256 * i)));
      r3 <-
      (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 3) + (256 * i)));
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ __butterfly64x (r0, r1, r2, 
      r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (16 + (392 * i)));
      zeta1 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (48 + (392 * i)));
      (r0, r4) <@ __shuffle8 (r0, r4);
      (r1, r5) <@ __shuffle8 (r1, r5);
      (r2, r6) <@ __shuffle8 (r2, r6);
      (r3, r7) <@ __shuffle8 (r3, r7);
      (r0, r4, r1, r5, r2, r6, r3, r7) <@ __butterfly64x (r0, r4, r1, 
      r5, r2, r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (80 + (392 * i)));
      zeta1 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (112 + (392 * i)));
      (r0, r2) <@ __shuffle4 (r0, r2);
      (r4, r6) <@ __shuffle4 (r4, r6);
      (r1, r3) <@ __shuffle4 (r1, r3);
      (r5, r7) <@ __shuffle4 (r5, r7);
      (r0, r2, r4, r6, r1, r3, r5, r7) <@ __butterfly64x (r0, r2, r4, 
      r6, r1, r3, r5, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (144 + (392 * i)));
      zeta1 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (176 + (392 * i)));
      (r0, r1) <@ __shuffle2 (r0, r1);
      (r2, r3) <@ __shuffle2 (r2, r3);
      (r4, r5) <@ __shuffle2 (r4, r5);
      (r6, r7) <@ __shuffle2 (r6, r7);
      (r0, r1, r2, r3, r4, r5, r6, r7) <@ __butterfly64x (r0, r1, r2, 
      r3, r4, r5, r6, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (208 + (392 * i)));
      zeta1 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (240 + (392 * i)));
      (r0, r4) <@ __shuffle1 (r0, r4);
      (r1, r5) <@ __shuffle1 (r1, r5);
      (r2, r6) <@ __shuffle1 (r2, r6);
      (r3, r7) <@ __shuffle1 (r3, r7);
      (r0, r4, r1, r5, r2, r6, r3, r7) <@ __butterfly64x (r0, r4, r1, 
      r5, r2, r6, r3, r7, zeta0, zeta0, zeta1, zeta1, qx16);
      zeta0 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (272 + (392 * i)));
      zeta2 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (304 + (392 * i)));
      zeta1 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (336 + (392 * i)));
      zeta3 <-
      (get256_direct (WArray800.init16 (fun i_0 => jzetas_exp.[i_0]))
      (368 + (392 * i)));
      (r0, r4, r2, r6, r1, r5, r3, r7) <@ __butterfly64x (r0, r4, r2, 
      r6, r1, r5, r3, r7, zeta0, zeta1, zeta2, zeta3, qx16);
      vx16 <- (get256 (WArray32.init16 (fun i_0 => jvx16.[i_0])) 0);
      r0 <@ __red16x (r0, qx16, vx16);
      r4 <@ __red16x (r4, qx16, vx16);
      r2 <@ __red16x (r2, qx16, vx16);
      r6 <@ __red16x (r6, qx16, vx16);
      r1 <@ __red16x (r1, qx16, vx16);
      r5 <@ __red16x (r5, qx16, vx16);
      r3 <@ __red16x (r3, qx16, vx16);
      r7 <@ __red16x (r7, qx16, vx16);
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 0) + (256 * i)) r0)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 1) + (256 * i)) r4)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 2) + (256 * i)) r1)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 3) + (256 * i)) r5)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 4) + (256 * i)) r2)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 5) + (256 * i)) r6)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 6) + (256 * i)) r3)));
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      ((32 * 7) + (256 * i)) r7)));
      i <- (i + 1);
    }
    return rp;
  }
  proc __poly_reduce (rp:W16.t Array256.t) : W16.t Array256.t = {
    var qx16:W256.t;
    var vx16:W256.t;
    var i:int;
    var r:W256.t;
    qx16 <- (get256 (WArray32.init16 (fun i_0 => jqx16.[i_0])) 0);
    vx16 <- (get256 (WArray32.init16 (fun i_0 => jvx16.[i_0])) 0);
    i <- 0;
    while ((i < 16)) {
      r <- (get256_direct (WArray512.init16 (fun i_0 => rp.[i_0])) (32 * i));
      r <@ __red16x (r, qx16, vx16);
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      (32 * i) r)));
      i <- (i + 1);
    }
    return rp;
  }
  proc _poly_sub (rp:W16.t Array256.t, ap:W16.t Array256.t,
                  bp:W16.t Array256.t) : W16.t Array256.t = {
    var i:int;
    var a:W256.t;
    var b:W256.t;
    var r:W256.t;
    i <- 0;
    while ((i < 16)) {
      a <- (get256_direct (WArray512.init16 (fun i_0 => ap.[i_0])) (32 * i));
      b <- (get256_direct (WArray512.init16 (fun i_0 => bp.[i_0])) (32 * i));
      r <- (VPSUB_16u16 a b);
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256_direct (WArray512.init16 (fun i_0 => rp.[i_0]))
      (32 * i) r)));
      i <- (i + 1);
    }
    return rp;
  }
  proc _i_poly_tobytes (rp:W8.t Array384.t, a:W16.t Array256.t) : W8.t Array384.t *
                                                                  W16.t Array256.t = {
    var i:int;
    var t0:W256.t;
    var t1:W256.t;
    var t2:W256.t;
    var t3:W256.t;
    var t4:W256.t;
    var t5:W256.t;
    var t6:W256.t;
    var t7:W256.t;
    var tt:W256.t;
    var ttt:W256.t;
    a <@ _poly_csubq (a);
    i <- 0;
    while ((i < 2)) {
      t0 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) (8 * i));
      t1 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) ((8 * i) + 1));
      t2 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) ((8 * i) + 2));
      t3 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) ((8 * i) + 3));
      t4 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) ((8 * i) + 4));
      t5 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) ((8 * i) + 5));
      t6 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) ((8 * i) + 6));
      t7 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) ((8 * i) + 7));
      tt <- (VPSLL_16u16 t1 (W128.of_int 12));
      tt <- (tt `|` t0);
      t0 <- (VPSRL_16u16 t1 (W128.of_int 4));
      t1 <- (VPSLL_16u16 t2 (W128.of_int 8));
      t0 <- (t0 `|` t1);
      t1 <- (VPSRL_16u16 t2 (W128.of_int 8));
      t2 <- (VPSLL_16u16 t3 (W128.of_int 4));
      t1 <- (t1 `|` t2);
      t2 <- (VPSLL_16u16 t5 (W128.of_int 12));
      t2 <- (t2 `|` t4);
      t3 <- (VPSRL_16u16 t5 (W128.of_int 4));
      t4 <- (VPSLL_16u16 t6 (W128.of_int 8));
      t3 <- (t3 `|` t4);
      t4 <- (VPSRL_16u16 t6 (W128.of_int 8));
      t5 <- (VPSLL_16u16 t7 (W128.of_int 4));
      t4 <- (t4 `|` t5);
      (ttt, t0) <@ __shuffle1 (tt, t0);
      (tt, t2) <@ __shuffle1 (t1, t2);
      (t1, t4) <@ __shuffle1 (t3, t4);
      (t3, tt) <@ __shuffle2 (ttt, tt);
      (ttt, t0) <@ __shuffle2 (t1, t0);
      (t1, t4) <@ __shuffle2 (t2, t4);
      (t2, ttt) <@ __shuffle4 (t3, ttt);
      (t3, tt) <@ __shuffle4 (t1, tt);
      (t1, t4) <@ __shuffle4 (t0, t4);
      (t0, t3) <@ __shuffle8 (t2, t3);
      (t2, ttt) <@ __shuffle8 (t1, ttt);
      (t1, t4) <@ __shuffle8 (tt, t4);
      rp <-
      (Array384.init
      (WArray384.get8
      (WArray384.set256_direct (WArray384.init8 (fun i_0 => rp.[i_0]))
      (192 * i) t0)));
      rp <-
      (Array384.init
      (WArray384.get8
      (WArray384.set256_direct (WArray384.init8 (fun i_0 => rp.[i_0]))
      ((192 * i) + 32) t2)));
      rp <-
      (Array384.init
      (WArray384.get8
      (WArray384.set256_direct (WArray384.init8 (fun i_0 => rp.[i_0]))
      ((192 * i) + 64) t1)));
      rp <-
      (Array384.init
      (WArray384.get8
      (WArray384.set256_direct (WArray384.init8 (fun i_0 => rp.[i_0]))
      ((192 * i) + 96) t3)));
      rp <-
      (Array384.init
      (WArray384.get8
      (WArray384.set256_direct (WArray384.init8 (fun i_0 => rp.[i_0]))
      ((192 * i) + 128) ttt)));
      rp <-
      (Array384.init
      (WArray384.get8
      (WArray384.set256_direct (WArray384.init8 (fun i_0 => rp.[i_0]))
      ((192 * i) + 160) t4)));
      i <- (i + 1);
    }
    return (rp, a);
  }
  proc _i_poly_tomsg (rp:W8.t Array32.t, a:W16.t Array256.t) : W8.t Array32.t *
                                                               W16.t Array256.t = {
    var inc:int;
    var px16:W16.t Array16.t;
    var hq:W256.t;
    var hhq:W256.t;
    var i:int;
    var f0:W256.t;
    var f1:W256.t;
    var g0:W256.t;
    var g1:W256.t;
    var c:W32.t;
    px16 <- witness;
    a <@ _poly_csubq (a);
    px16 <- hqx16_m1;
    hq <- (get256 (WArray32.init16 (fun i_0 => px16.[i_0])) 0);
    px16 <- hhqx16;
    hhq <- (get256 (WArray32.init16 (fun i_0 => px16.[i_0])) 0);
    inc <- (256 %/ 32);
    i <- 0;
    while ((i < inc)) {
      f0 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) (2 * i));
      f1 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) ((2 * i) + 1));
      f0 <- (VPSUB_16u16 hq f0);
      f1 <- (VPSUB_16u16 hq f1);
      g0 <- (VPSRA_16u16 f0 (W128.of_int 15));
      g1 <- (VPSRA_16u16 f1 (W128.of_int 15));
      f0 <- (VPXOR_256 f0 g0);
      f1 <- (VPXOR_256 f1 g1);
      f0 <- (VPSUB_16u16 f0 hhq);
      f1 <- (VPSUB_16u16 f1 hhq);
      f0 <- (VPACKSS_16u16 f0 f1);
      f0 <- (VPERMQ f0 (W8.of_int 216));
      c <- (MOVEMASK_32u8 f0);
      rp <-
      (Array32.init
      (WArray32.get8
      (WArray32.set32 (WArray32.init8 (fun i_0 => rp.[i_0])) i c)));
      i <- (i + 1);
    }
    return (rp, a);
  }
  proc _i_poly_compress (rp:W8.t Array128.t, a:W16.t Array256.t) : W8.t Array128.t *
                                                                   W16.t Array256.t = {
    var inc:int;
    var x16p:W16.t Array16.t;
    var v:W256.t;
    var shift1:W256.t;
    var mask:W256.t;
    var shift2:W256.t;
    var permidx:W256.t;
    var i:int;
    var f0:W256.t;
    var f1:W256.t;
    var f2:W256.t;
    var f3:W256.t;
    x16p <- witness;
    a <@ _poly_csubq (a);
    x16p <- jvx16;
    v <- (get256 (WArray32.init16 (fun i_0 => x16p.[i_0])) 0);
    shift1 <- (VPBROADCAST_16u16 pc_shift1_s);
    mask <- (VPBROADCAST_16u16 pc_mask_s);
    shift2 <- (VPBROADCAST_16u16 pc_shift2_s);
    permidx <- (get256 (WArray32.init32 (fun i_0 => pc_permidx_s.[i_0])) 0);
    inc <- (256 %/ 64);
    i <- 0;
    while ((i < inc)) {
      f0 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) (4 * i));
      f1 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) ((4 * i) + 1));
      f2 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) ((4 * i) + 2));
      f3 <- (get256 (WArray512.init16 (fun i_0 => a.[i_0])) ((4 * i) + 3));
      f0 <- (VPMULH_16u16 f0 v);
      f1 <- (VPMULH_16u16 f1 v);
      f2 <- (VPMULH_16u16 f2 v);
      f3 <- (VPMULH_16u16 f3 v);
      f0 <- (VPMULHRS_16u16 f0 shift1);
      f1 <- (VPMULHRS_16u16 f1 shift1);
      f2 <- (VPMULHRS_16u16 f2 shift1);
      f3 <- (VPMULHRS_16u16 f3 shift1);
      f0 <- (VPAND_256 f0 mask);
      f1 <- (VPAND_256 f1 mask);
      f2 <- (VPAND_256 f2 mask);
      f3 <- (VPAND_256 f3 mask);
      f0 <- (VPACKUS_16u16 f0 f1);
      f2 <- (VPACKUS_16u16 f2 f3);
      f0 <- (VPMADDUBSW_256 f0 shift2);
      f2 <- (VPMADDUBSW_256 f2 shift2);
      f0 <- (VPACKUS_16u16 f0 f2);
      f0 <- (VPERMD permidx f0);
      rp <-
      (Array128.init
      (WArray128.get8
      (WArray128.set256_direct (WArray128.init8 (fun i_0 => rp.[i_0]))
      (32 * i) f0)));
      i <- (i + 1);
    }
    return (rp, a);
  }
  proc _i_poly_decompress (rp:W16.t Array256.t, a:W8.t Array128.t) : 
  W16.t Array256.t = {
    var inc:int;
    var x16p:W16.t Array16.t;
    var q:W256.t;
    var x32p:W8.t Array32.t;
    var shufbidx:W256.t;
    var mask:W256.t;
    var shift:W256.t;
    var i:int;
    var h:W128.t;
    var sh:W128.t;
    var f:W256.t;
    x16p <- witness;
    x32p <- witness;
    x16p <- jqx16;
    q <- (get256 (WArray32.init16 (fun i_0 => x16p.[i_0])) 0);
    x32p <- pd_jshufbidx;
    shufbidx <- (get256 (WArray32.init8 (fun i_0 => x32p.[i_0])) 0);
    mask <- (VPBROADCAST_8u32 pd_mask_s);
    shift <- (VPBROADCAST_8u32 pd_shift_s);
    inc <- (256 %/ 16);
    i <- 0;
    while ((i < inc)) {
      h <-
      (zeroextu128
      (get64_direct (WArray128.init8 (fun i_0 => a.[i_0])) (8 * i)));
      sh <- h;
      f <- (VPBROADCAST_2u128 sh);
      f <- (VPSHUFB_256 f shufbidx);
      f <- (VPAND_256 f mask);
      f <- (VPMULL_16u16 f shift);
      f <- (VPMULHRS_16u16 f q);
      rp <-
      (Array256.init
      (WArray512.get16
      (WArray512.set256 (WArray512.init16 (fun i_0 => rp.[i_0])) i f)));
      i <- (i + 1);
    }
    return rp;
  }
  proc __polyvec_add2 (r:W16.t Array768.t, b:W16.t Array768.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var i:int;
    i <- 0;
    while ((i < 3)) {
      aux <@ _poly_add2 ((Array256.init (fun i_0 => r.[((256 * i) + i_0)])),
      (Array256.init (fun i_0 => b.[((256 * i) + i_0)])));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __polyvec_csubq (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var i:int;
    i <- 0;
    while ((i < 3)) {
      aux <@ _poly_csubq ((Array256.init (fun i_0 => r.[((256 * i) + i_0)])));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __polyvec_invntt (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var i:int;
    i <- 0;
    while ((i < 3)) {
      aux <@ _poly_invntt ((Array256.init (fun i_0 => r.[((256 * i) + i_0)])));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __polyvec_ntt (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var i:int;
    i <- 0;
    while ((i < 3)) {
      aux <@ _poly_ntt ((Array256.init (fun i_0 => r.[((256 * i) + i_0)])));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __polyvec_reduce (r:W16.t Array768.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var i:int;
    i <- 0;
    while ((i < 3)) {
      aux <@ __poly_reduce ((Array256.init (fun i_0 => r.[((256 * i) + i_0)])
                            ));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __i_polyvec_frombytes (a:W8.t Array1152.t) : W16.t Array768.t = {
    var aux:W16.t Array256.t;
    var r:W16.t Array768.t;
    var i:int;
    r <- witness;
    i <- 0;
    while ((i < 3)) {
      aux <@ _i_poly_frombytes ((Array256.init
                                (fun i_0 => r.[((256 * i) + i_0)])),
      (Array384.init (fun i_0 => a.[((384 * i) + i_0)])));
      r <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  r.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __i_polyvec_tobytes (r:W8.t Array1152.t, a:W16.t Array768.t) : 
  W8.t Array1152.t = {
    var aux_0:W16.t Array256.t;
    var aux:W8.t Array384.t;
    var i:int;
    i <- 0;
    while ((i < 3)) {
      (aux, aux_0) <@ _i_poly_tobytes ((Array384.init
                                       (fun i_0 => r.[((384 * i) + i_0)])),
      (Array256.init (fun i_0 => a.[((256 * i) + i_0)])));
      r <-
      (Array1152.init
      (fun i_0 => (if ((384 * i) <= i_0 < ((384 * i) + 384)) then aux.[
                                                                  (i_0 -
                                                                  (384 * i))] else 
                  r.[i_0]))
      );
      a <-
      (Array768.init
      (fun i_0 => (if ((256 * i) <= i_0 < ((256 * i) + 256)) then aux_0.[
                                                                  (i_0 -
                                                                  (256 * i))] else 
                  a.[i_0]))
      );
      i <- (i + 1);
    }
    return r;
  }
  proc __polyvec_pointwise_acc (r:W16.t Array256.t, a:W16.t Array768.t,
                                b:W16.t Array768.t) : W16.t Array256.t = {
    var t:W16.t Array256.t;
    var i:int;
    t <- witness;
    r <@ _poly_basemul (r, (Array256.init (fun i_0 => a.[(0 + i_0)])),
    (Array256.init (fun i_0 => b.[(0 + i_0)])));
    i <- 1;
    while ((i < 3)) {
      t <@ _poly_basemul (t,
      (Array256.init (fun i_0 => a.[((256 * i) + i_0)])),
      (Array256.init (fun i_0 => b.[((256 * i) + i_0)])));
      r <@ _poly_add2 (r, t);
      i <- (i + 1);
    }
    return r;
  }
  proc __i_polyvec_decompress (rp:W8.t Array1088.t) : W16.t Array768.t = {
    var inc:int;
    var r:W16.t Array768.t;
    var q:W256.t;
    var shufbidx:W256.t;
    var sllvdidx:W256.t;
    var mask:W256.t;
    var i:int;
    var k:int;
    var f:W256.t;
    r <- witness;
    q <- (VPBROADCAST_8u32 pvd_q_s);
    shufbidx <-
    (get256 (WArray32.init8 (fun i_0 => pvd_shufbdidx_s.[i_0])) 0);
    sllvdidx <- (VPBROADCAST_4u64 pvd_sllvdidx_s);
    mask <- (VPBROADCAST_8u32 pvd_mask_s);
    k <- 0;
    while ((k < 3)) {
      inc <- (256 %/ 16);
      i <- 0;
      while ((i < inc)) {
        f <-
        (get256_direct (WArray1088.init8 (fun i_0 => rp.[i_0]))
        ((320 * k) + (20 * i)));
        f <- (VPERMQ f (W8.of_int 148));
        f <- (VPSHUFB_256 f shufbidx);
        f <- (VPSLLV_8u32 f sllvdidx);
        f <- (VPSRL_16u16 f (W128.of_int 1));
        f <- (VPAND_256 f mask);
        f <- (VPMULHRS_16u16 f q);
        r <-
        (Array768.init
        (WArray1536.get16
        (WArray1536.set256 (WArray1536.init16 (fun i_0 => r.[i_0]))
        ((16 * k) + i) f)));
        i <- (i + 1);
      }
      k <- (k + 1);
    }
    return r;
  }
  proc __i_polyvec_compress (rp:W8.t Array960.t, a:W16.t Array768.t) : 
  W8.t Array960.t = {
    var inc:int;
    var x16p:W16.t Array16.t;
    var v:W256.t;
    var v8:W256.t;
    var off:W256.t;
    var shift1:W256.t;
    var mask:W256.t;
    var shift2:W256.t;
    var sllvdidx:W256.t;
    var shufbidx:W256.t;
    var i:int;
    var f0:W256.t;
    var f1:W256.t;
    var f2:W256.t;
    var t0:W128.t;
    var t1:W128.t;
    x16p <- witness;
    a <@ __polyvec_csubq (a);
    x16p <- jvx16;
    v <- (get256 (WArray32.init16 (fun i_0 => x16p.[i_0])) 0);
    v8 <- (VPSLL_16u16 v (W128.of_int 3));
    off <- (VPBROADCAST_16u16 pvc_off_s);
    shift1 <- (VPBROADCAST_16u16 pvc_shift1_s);
    mask <- (VPBROADCAST_16u16 pvc_mask_s);
    shift2 <- (VPBROADCAST_4u64 pvc_shift2_s);
    sllvdidx <- (VPBROADCAST_4u64 pvc_sllvdidx_s);
    shufbidx <-
    (get256 (WArray32.init8 (fun i_0 => pvc_shufbidx_s.[i_0])) 0);
    inc <- ((3 * 256) %/ 16);
    i <- 0;
    while ((i < inc)) {
      f0 <- (get256 (WArray1536.init16 (fun i_0 => a.[i_0])) i);
      f1 <- (VPMULL_16u16 f0 v8);
      f2 <- (VPADD_16u16 f0 off);
      f0 <- (VPSLL_16u16 f0 (W128.of_int 3));
      f0 <- (VPMULH_16u16 f0 v);
      f2 <- (VPSUB_16u16 f1 f2);
      f1 <- (VPANDN_256 f1 f2);
      f1 <- (VPSRL_16u16 f1 (W128.of_int 15));
      f0 <- (VPSUB_16u16 f0 f1);
      f0 <- (VPMULHRS_16u16 f0 shift1);
      f0 <- (VPAND_256 f0 mask);
      f0 <- (VPMADDWD_256 f0 shift2);
      f0 <- (VPSLLV_8u32 f0 sllvdidx);
      f0 <- (VPSRL_4u64 f0 (W128.of_int 12));
      f0 <- (VPSHUFB_256 f0 shufbidx);
      t0 <- (truncateu128 f0);
      t1 <- (VEXTRACTI128 f0 (W8.of_int 1));
      t0 <- (VPBLEND_8u16 t0 t1 (W8.of_int 224));
      rp <-
      (Array960.init
      (WArray960.get8
      (WArray960.set128_direct (WArray960.init8 (fun i_0 => rp.[i_0]))
      (20 * i) t0)));
      rp <-
      (Array960.init
      (WArray960.get8
      (WArray960.set32_direct (WArray960.init8 (fun i_0 => rp.[i_0]))
      ((20 * i) + 16) (VPEXTR_32 t1 (W8.of_int 0)))));
      i <- (i + 1);
    }
    return rp;
  }
  proc __gen_matrix_buf_rejection_filter48 (pol:W16.t Array256.t,
                                            counter:W64.t,
                                            buf:W8.t Array536.t,
                                            buf_offset:W64.t,
                                            load_shuffle:W256.t, mask:W256.t,
                                            bounds:W256.t,
                                            sst:W8.t Array2048.t,
                                            ones:W256.t, ms:W64.t) : 
  W16.t Array256.t * W64.t = {
    var f0:W256.t;
    var f1:W256.t;
    var g0:W256.t;
    var g1:W256.t;
    var good:W64.t;
    var t0_0:W64.t;
    var shuffle_0:W256.t;
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
    var  _4:bool;
    var  _5:bool;
    var  _6:bool;
    var  _7:bool;
    var  _8:bool;
    var  _9:bool;
    var  _10:bool;
    var  _11:bool;
    var  _12:bool;
    var  _13:bool;
    var  _14:bool;
    var  _15:bool;
    var  _16:bool;
    var  _17:bool;
    var  _18:bool;
    var  _19:bool;
    f0 <-
    (VPERMQ
    (get256_direct (WArray536.init8 (fun i => buf.[i]))
    ((W64.to_uint buf_offset) + 0))
    (W8.of_int
    ((0 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((1 %% (2 ^ 2)) + ((2 ^ 2) * ((1 %% (2 ^ 2)) + ((2 ^ 2) * 2))))))));
    f1 <-
    (VPERMQ
    (get256_direct (WArray536.init8 (fun i => buf.[i]))
    ((W64.to_uint buf_offset) + 24))
    (W8.of_int
    ((0 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((1 %% (2 ^ 2)) + ((2 ^ 2) * ((1 %% (2 ^ 2)) + ((2 ^ 2) * 2))))))));
    f0 <- (VPSHUFB_256 f0 load_shuffle);
    f1 <- (VPSHUFB_256 f1 load_shuffle);
    g0 <- (VPSRL_16u16 f0 (W128.of_int 4));
    g1 <- (VPSRL_16u16 f1 (W128.of_int 4));
    f0 <- (VPBLEND_16u16 f0 g0 (W8.of_int 170));
    f1 <- (VPBLEND_16u16 f1 g1 (W8.of_int 170));
    f0 <- (VPAND_256 f0 mask);
    f1 <- (VPAND_256 f1 mask);
    g0 <- (VPCMPGT_16u16 bounds f0);
    g1 <- (VPCMPGT_16u16 bounds f1);
    g0 <- (VPACKSS_16u16 g0 g1);
    good <- (zeroextu64 (MOVEMASK_32u8 g0));
    (* Erased call to declassify *)
    good <- (protect_64 good ms);
    t0_0 <- good;
    t0_0 <- (t0_0 `&` (W64.of_int 255));
    shuffle_0 <-
    (zeroextu256
    (VMOV_64 (get64 (WArray2048.init8 (fun i => sst.[i])) (W64.to_uint t0_0))
    ));
    ( _0,  _1,  _2,  _3,  _4, t0_0) <- (POPCNT_64 t0_0);
    t0_0 <- (t0_0 + counter);
    t0_1 <- good;
    t0_1 <- (t0_1 `>>` (W8.of_int 16));
    t0_1 <- (t0_1 `&` (W64.of_int 255));
    shuffle_0_1 <-
    (VMOV_64 (get64 (WArray2048.init8 (fun i => sst.[i])) (W64.to_uint t0_1))
    );
    ( _5,  _6,  _7,  _8,  _9, t0_1) <- (POPCNT_64 t0_1);
    t0_1 <- (t0_1 + t0_0);
    t1_0 <- good;
    t1_0 <- (t1_0 `>>` (W8.of_int 8));
    t1_0 <- (t1_0 `&` (W64.of_int 255));
    shuffle_1 <-
    (zeroextu256
    (VMOV_64 (get64 (WArray2048.init8 (fun i => sst.[i])) (W64.to_uint t1_0))
    ));
    ( _10,  _11,  _12,  _13,  _14, t1_0) <- (POPCNT_64 t1_0);
    t1_0 <- (t1_0 + t0_1);
    t1_1 <- good;
    t1_1 <- (t1_1 `>>` (W8.of_int 24));
    t1_1 <- (t1_1 `&` (W64.of_int 255));
    shuffle_1_1 <-
    (VMOV_64 (get64 (WArray2048.init8 (fun i => sst.[i])) (W64.to_uint t1_1))
    );
    ( _15,  _16,  _17,  _18,  _19, t1_1) <- (POPCNT_64 t1_1);
    t1_1 <- (t1_1 + t1_0);
    shuffle_0 <- (VINSERTI128 shuffle_0 shuffle_0_1 (W8.of_int 1));
    shuffle_1 <- (VINSERTI128 shuffle_1 shuffle_1_1 (W8.of_int 1));
    shuffle_t <- (VPADD_32u8 shuffle_0 ones);
    shuffle_0 <- (VPUNPCKL_32u8 shuffle_0 shuffle_t);
    shuffle_t <- (VPADD_32u8 shuffle_1 ones);
    shuffle_1 <- (VPUNPCKL_32u8 shuffle_1 shuffle_t);
    f0 <- (VPSHUFB_256 f0 shuffle_0);
    f1 <- (VPSHUFB_256 f1 shuffle_1);
    pol <-
    (Array256.init
    (WArray512.get16
    (WArray512.set128_direct (WArray512.init16 (fun i => pol.[i]))
    (W64.to_uint ((W64.of_int 2) * counter)) (truncateu128 f0))));
    pol <-
    (Array256.init
    (WArray512.get16
    (WArray512.set128_direct (WArray512.init16 (fun i => pol.[i]))
    (W64.to_uint ((W64.of_int 2) * t0_0)) (VEXTRACTI128 f0 (W8.of_int 1)))));
    pol <-
    (Array256.init
    (WArray512.get16
    (WArray512.set128_direct (WArray512.init16 (fun i => pol.[i]))
    (W64.to_uint ((W64.of_int 2) * t0_1)) (truncateu128 f1))));
    pol <-
    (Array256.init
    (WArray512.get16
    (WArray512.set128_direct (WArray512.init16 (fun i => pol.[i]))
    (W64.to_uint ((W64.of_int 2) * t1_0)) (VEXTRACTI128 f1 (W8.of_int 1)))));
    counter <- t1_1;
    return (pol, counter);
  }
  proc __write_u128_boundchk (pol:W16.t Array256.t, ctr:W64.t, data:W128.t,
                              ms:W64.t) : W16.t Array256.t * W64.t = {
    var condition_8:bool;
    var data_u64:W64.t;
    var condition_4:bool;
    var condition_2:bool;
    var condition_1:bool;
    condition_8 <- (ctr \ule (W64.of_int (256 - 8)));
    if (condition_8) {
      ms <- (update_msf condition_8 ms);
      pol <-
      (Array256.init
      (WArray512.get16
      (WArray512.set128_direct (WArray512.init16 (fun i => pol.[i]))
      (2 * (W64.to_uint ctr)) data)));
    } else {
      ms <- (update_msf (! condition_8) ms);
      data_u64 <- (MOVV_64 (truncateu64 data));
      condition_4 <- (ctr \ule (W64.of_int (256 - 4)));
      if (condition_4) {
        ms <- (update_msf condition_4 ms);
        pol <-
        (Array256.init
        (WArray512.get16
        (WArray512.set64_direct (WArray512.init16 (fun i => pol.[i]))
        (2 * (W64.to_uint ctr)) data_u64)));
        data_u64 <- (VPEXTR_64 data (W8.of_int 1));
        ctr <- (ctr + (W64.of_int 4));
      } else {
        ms <- (update_msf (! condition_4) ms);
      }
      condition_2 <- (ctr \ule (W64.of_int (256 - 2)));
      if (condition_2) {
        ms <- (update_msf condition_2 ms);
        pol <-
        (Array256.init
        (WArray512.get16
        (WArray512.set32_direct (WArray512.init16 (fun i => pol.[i]))
        (2 * (W64.to_uint ctr)) (truncateu32 data_u64))));
        data_u64 <- (data_u64 `>>` (W8.of_int 32));
        ctr <- (ctr + (W64.of_int 2));
      } else {
        ms <- (update_msf (! condition_2) ms);
      }
      condition_1 <- (ctr \ule (W64.of_int (256 - 1)));
      if (condition_1) {
        ms <- (update_msf condition_1 ms);
        pol <-
        (Array256.init
        (WArray512.get16
        (WArray512.set16_direct (WArray512.init16 (fun i => pol.[i]))
        (2 * (W64.to_uint ctr)) (truncateu16 data_u64))));
      } else {
        ms <- (update_msf (! condition_1) ms);
      }
    }
    return (pol, ms);
  }
  proc __gen_matrix_buf_rejection_filter24 (pol:W16.t Array256.t,
                                            counter:W64.t,
                                            buf:W8.t Array536.t,
                                            buf_offset:W64.t,
                                            load_shuffle:W256.t, mask:W256.t,
                                            bounds:W256.t,
                                            sst:W8.t Array2048.t,
                                            ones:W256.t, ms:W64.t) : 
  W16.t Array256.t * W64.t * W64.t = {
    var f0:W256.t;
    var g0:W256.t;
    var g1:W256.t;
    var good:W64.t;
    var t0_0:W64.t;
    var shuffle_0:W256.t;
    var t0_1:W64.t;
    var shuffle_0_1:W128.t;
    var shuffle_t:W256.t;
    var t128:W128.t;
    var  _0:bool;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
    var  _6:bool;
    var  _7:bool;
    var  _8:bool;
    var  _9:bool;
    f0 <-
    (VPERMQ
    (get256_direct (WArray536.init8 (fun i => buf.[i]))
    ((W64.to_uint buf_offset) + 0))
    (W8.of_int
    ((0 %% (2 ^ 2)) +
    ((2 ^ 2) *
    ((1 %% (2 ^ 2)) + ((2 ^ 2) * ((1 %% (2 ^ 2)) + ((2 ^ 2) * 2))))))));
    f0 <- (VPSHUFB_256 f0 load_shuffle);
    g0 <- (VPSRL_16u16 f0 (W128.of_int 4));
    f0 <- (VPBLEND_16u16 f0 g0 (W8.of_int 170));
    f0 <- (VPAND_256 f0 mask);
    g0 <- (VPCMPGT_16u16 bounds f0);
    g1 <- (set0_256);
    g0 <- (VPACKSS_16u16 g0 g1);
    good <- (zeroextu64 (MOVEMASK_32u8 g0));
    (* Erased call to declassify *)
    good <- (protect_64 good ms);
    t0_0 <- good;
    t0_0 <- (t0_0 `&` (W64.of_int 255));
    shuffle_0 <-
    (zeroextu256
    (VMOV_64 (get64 (WArray2048.init8 (fun i => sst.[i])) (W64.to_uint t0_0))
    ));
    ( _0,  _1,  _2,  _3,  _4, t0_0) <- (POPCNT_64 t0_0);
    t0_0 <- (t0_0 + counter);
    t0_1 <- good;
    t0_1 <- (t0_1 `>>` (W8.of_int 16));
    t0_1 <- (t0_1 `&` (W64.of_int 255));
    shuffle_0_1 <-
    (VMOV_64 (get64 (WArray2048.init8 (fun i => sst.[i])) (W64.to_uint t0_1))
    );
    ( _5,  _6,  _7,  _8,  _9, t0_1) <- (POPCNT_64 t0_1);
    t0_1 <- (t0_1 + t0_0);
    shuffle_0 <- (VINSERTI128 shuffle_0 shuffle_0_1 (W8.of_int 1));
    shuffle_t <- (VPADD_32u8 shuffle_0 ones);
    shuffle_0 <- (VPUNPCKL_32u8 shuffle_0 shuffle_t);
    f0 <- (VPSHUFB_256 f0 shuffle_0);
    t128 <- (truncateu128 f0);
    (pol, ms) <@ __write_u128_boundchk (pol, counter, t128, ms);
    t128 <- (VEXTRACTI128 f0 (W8.of_int 1));
    (pol, ms) <@ __write_u128_boundchk (pol, t0_0, t128, ms);
    counter <- t0_1;
    return (pol, counter, ms);
  }
  proc _gen_matrix_buf_rejection (pol:W16.t Array256.t, counter:W64.t,
                                  buf:W8.t Array536.t, buf_offset:W64.t) : 
  W16.t Array256.t * W64.t = {
    var ms:W64.t;
    var load_shuffle:W256.t;
    var mask:W256.t;
    var bounds:W256.t;
    var ones:W256.t;
    var sst:W8.t Array2048.t;
    var saved_buf_offset:W64.t;
    var condition_loop:bool;
    sst <- witness;
    ms <- (init_msf);
    load_shuffle <-
    (get256 (WArray32.init8 (fun i => sample_load_shuffle.[i])) 0);
    mask <- sample_mask;
    bounds <- sample_q;
    ones <- sample_ones;
    sst <- sample_shuffle_table;
    saved_buf_offset <- buf_offset;
    buf_offset <- buf_offset;
    condition_loop <- (buf_offset \ult (W64.of_int (((3 * 168) - 48) + 1)));
    while (condition_loop) {
      ms <- (update_msf condition_loop ms);
      condition_loop <- (counter \ult (W64.of_int ((256 - 32) + 1)));
      if (condition_loop) {
        ms <- (update_msf condition_loop ms);
        (pol, counter) <@ __gen_matrix_buf_rejection_filter48 (pol, counter,
        buf, buf_offset, load_shuffle, mask, bounds, sst, ones, ms);
        saved_buf_offset <- (saved_buf_offset + (W64.of_int 48));
        buf_offset <- saved_buf_offset;
        buf_offset <- (protect_64 buf_offset ms);
      } else {
        ms <- (update_msf (! condition_loop) ms);
        buf_offset <- (W64.of_int (3 * 168));
      }
      condition_loop <-
      (buf_offset \ult (W64.of_int (((3 * 168) - 48) + 1)));
    }
    ms <- (update_msf (! condition_loop) ms);
    buf_offset <- saved_buf_offset;
    buf_offset <- (protect_64 buf_offset ms);
    condition_loop <- (buf_offset \ult (W64.of_int (((3 * 168) - 24) + 1)));
    while (condition_loop) {
      ms <- (update_msf condition_loop ms);
      condition_loop <- (counter \ult (W64.of_int 256));
      if (condition_loop) {
        ms <- (update_msf condition_loop ms);
        (* Erased call to spill *)
        (pol, counter, ms) <@ __gen_matrix_buf_rejection_filter24 (pol,
        counter, buf, buf_offset, load_shuffle, mask, bounds, sst, ones, 
        ms);
        (* Erased call to unspill *)
        buf_offset <- (protect_64 buf_offset ms);
        buf_offset <- (buf_offset + (W64.of_int 24));
      } else {
        ms <- (update_msf (! condition_loop) ms);
        buf_offset <- (W64.of_int (3 * 168));
      }
      condition_loop <-
      (buf_offset \ult (W64.of_int (((3 * 168) - 24) + 1)));
    }
    return (pol, counter);
  }
  proc gen_matrix_get_indexes (b:W64.t, _t:W64.t) : W64.t = {
    var t:W64.t;
    var idxs:W8.t Array32.t;
    idxs <- witness;
    idxs <- gen_matrix_indexes;
    t <- _t;
    t <- (t `<<` (W8.of_int (3 + 1)));
    b <- (b + t);
    t <- (get64_direct (WArray32.init8 (fun i => idxs.[i])) (W64.to_uint b));
    return t;
  }
  proc __gen_matrix_fill_polynomial (pol:W16.t Array256.t,
                                     buf:W8.t Array536.t) : W16.t Array256.t *
                                                            W8.t Array536.t = {
    var buf_offset:W64.t;
    var counter:W64.t;
    buf_offset <- (W64.of_int 0);
    counter <- (W64.of_int 0);
    (pol, counter) <@ _gen_matrix_buf_rejection (pol, counter, buf,
    buf_offset);
    buf_offset <- (W64.of_int (2 * 168));
    while ((counter \ult (W64.of_int 256))) {
      (* Erased call to spill *)
      buf <@ _shake128_next_state (buf);
      (* Erased call to unspill *)
      (pol, counter) <@ _gen_matrix_buf_rejection (pol, counter, buf,
      buf_offset);
    }
    return (pol, buf);
  }
  proc _gen_matrix_sample_four_polynomials (polx4:W16.t Array1024.t,
                                            buf:W8.t Array2144.t,
                                            rho:W8.t Array32.t,
                                            pos_entry:W64.t, transposed:W64.t) : 
  W16.t Array1024.t * W8.t Array2144.t = {
    var aux:W64.t;
    var indexes:W8.t Array8.t;
    var state:W256.t Array25.t;
    var stx4:W256.t Array25.t;
    var bufp:W8.t Array536.t;
    var pol:W16.t Array256.t;
    var ms:W64.t;
    var  _0:W256.t Array25.t;
     _0 <- witness;
    bufp <- witness;
    indexes <- witness;
    pol <- witness;
    state <- witness;
    stx4 <- witness;
    aux <@ gen_matrix_get_indexes (pos_entry, transposed);
    indexes <-
    (Array8.init
    (WArray8.get8
    (WArray8.set64_direct (WArray8.init8 (fun i => indexes.[i])) 0 aux)));
    stx4 <- state;
    stx4 <@ _shake128x4_absorb_A32_A2 (stx4, rho, indexes);
    ( _0, buf) <@ _shake128x4_squeeze3blocks (stx4, buf);
    (* Erased call to spill *)
    bufp <- (Array536.init (fun i => buf.[((536 * 0) + i)]));
    pol <- (Array256.init (fun i => polx4.[((0 * 256) + i)]));
    (pol, bufp) <@ __gen_matrix_fill_polynomial (pol, bufp);
    (* Erased call to unspill *)
    ms <- (init_msf);
    buf <- (protect_ptr buf ms);
    buf <-
    (Array2144.init
    (fun i => (if ((536 * 0) <= i < ((536 * 0) + 536)) then bufp.[(i -
                                                                  (536 * 0))] else 
              buf.[i]))
    );
    polx4 <-
    (Array1024.init
    (fun i => (if ((0 * 256) <= i < ((0 * 256) + 256)) then pol.[(i -
                                                                 (0 * 256))] else 
              polx4.[i]))
    );
    (* Erased call to spill *)
    bufp <- (Array536.init (fun i => buf.[((536 * 1) + i)]));
    pol <- (Array256.init (fun i => polx4.[((1 * 256) + i)]));
    (pol, bufp) <@ __gen_matrix_fill_polynomial (pol, bufp);
    (* Erased call to unspill *)
    ms <- (init_msf);
    buf <- (protect_ptr buf ms);
    buf <-
    (Array2144.init
    (fun i => (if ((536 * 1) <= i < ((536 * 1) + 536)) then bufp.[(i -
                                                                  (536 * 1))] else 
              buf.[i]))
    );
    polx4 <-
    (Array1024.init
    (fun i => (if ((1 * 256) <= i < ((1 * 256) + 256)) then pol.[(i -
                                                                 (1 * 256))] else 
              polx4.[i]))
    );
    (* Erased call to spill *)
    bufp <- (Array536.init (fun i => buf.[((536 * 2) + i)]));
    pol <- (Array256.init (fun i => polx4.[((2 * 256) + i)]));
    (pol, bufp) <@ __gen_matrix_fill_polynomial (pol, bufp);
    (* Erased call to unspill *)
    ms <- (init_msf);
    buf <- (protect_ptr buf ms);
    buf <-
    (Array2144.init
    (fun i => (if ((536 * 2) <= i < ((536 * 2) + 536)) then bufp.[(i -
                                                                  (536 * 2))] else 
              buf.[i]))
    );
    polx4 <-
    (Array1024.init
    (fun i => (if ((2 * 256) <= i < ((2 * 256) + 256)) then pol.[(i -
                                                                 (2 * 256))] else 
              polx4.[i]))
    );
    (* Erased call to spill *)
    bufp <- (Array536.init (fun i => buf.[((536 * 3) + i)]));
    pol <- (Array256.init (fun i => polx4.[((3 * 256) + i)]));
    (pol, bufp) <@ __gen_matrix_fill_polynomial (pol, bufp);
    (* Erased call to unspill *)
    ms <- (init_msf);
    buf <- (protect_ptr buf ms);
    buf <-
    (Array2144.init
    (fun i => (if ((536 * 3) <= i < ((536 * 3) + 536)) then bufp.[(i -
                                                                  (536 * 3))] else 
              buf.[i]))
    );
    polx4 <-
    (Array1024.init
    (fun i => (if ((3 * 256) <= i < ((3 * 256) + 256)) then pol.[(i -
                                                                 (3 * 256))] else 
              polx4.[i]))
    );
    return (polx4, buf);
  }
  proc __gen_matrix_sample_one_polynomial (pol:W16.t Array256.t,
                                           buf:W8.t Array536.t,
                                           rho:W8.t Array32.t, rc:W16.t) : 
  W16.t Array256.t * W8.t Array536.t = {
    var pos:W8.t Array2.t;
    var st:W64.t Array25.t;
    var ms:W64.t;
    var  _0:W64.t Array25.t;
     _0 <- witness;
    pos <- witness;
    st <- witness;
    (* Erased call to spill *)
    pos <-
    (Array2.init
    (WArray2.get8 (WArray2.set16 (WArray2.init8 (fun i => pos.[i])) 0 rc)));
    st <@ _shake128_absorb_A32_A2 (st, rho, pos);
    (* Erased call to unspill *)
    ms <- (init_msf);
    buf <- (protect_ptr buf ms);
    ( _0, buf) <@ _shake128_squeeze3blocks (st, buf);
    (* Erased call to unspill *)
    (pol, buf) <@ __gen_matrix_fill_polynomial (pol, buf);
    return (pol, buf);
  }
  proc _gen_matrix_avx2 (matrix:W16.t Array2304.t, rho:W8.t Array32.t,
                         transposed:W64.t) : W16.t Array2304.t = {
    var aux:W16.t Array256.t;
    var aux_0:W8.t Array536.t;
    var buf_s:W8.t Array2144.t;
    var buf:W8.t Array2144.t;
    var i:int;
    var pos_entry:W64.t;
    var polx4:W16.t Array1024.t;
    var pol:W16.t Array256.t;
    var rc:W16.t;
    var j:int;
    buf <- witness;
    buf_s <- witness;
    pol <- witness;
    polx4 <- witness;
    (* Erased call to spill *)
    buf <- buf_s;
    i <- 0;
    while ((i < 2)) {
      pos_entry <- (W64.of_int (8 * i));
      (* Erased call to spill *)
      polx4 <-
      (Array1024.init (fun i_0 => matrix.[(((4 * i) * 256) + i_0)]));
      (* Erased call to unspill *)
      (polx4, buf) <@ _gen_matrix_sample_four_polynomials (polx4, buf, 
      rho, pos_entry, transposed);
      (* Erased call to unspill *)
      matrix <-
      (Array2304.init
      (fun i_0 => (if (((i * 4) * 256) <= i_0 < (((i * 4) * 256) + 1024)) then 
                  polx4.[(i_0 - ((i * 4) * 256))] else matrix.[i_0]))
      );
      i <- (i + 1);
    }
    (* Erased call to spill *)
    pol <- (Array256.init (fun i_0 => matrix.[((8 * 256) + i_0)]));
    rc <- (W16.of_int 514);
    (aux, aux_0) <@ __gen_matrix_sample_one_polynomial (pol,
    (Array536.init (fun i_0 => buf.[((536 * 0) + i_0)])), rho, rc);
    pol <- aux;
    buf <-
    (Array2144.init
    (fun i_0 => (if ((536 * 0) <= i_0 < ((536 * 0) + 536)) then aux_0.[
                                                                (i_0 -
                                                                (536 * 0))] else 
                buf.[i_0]))
    );
    (* Erased call to unspill *)
    matrix <-
    (Array2304.init
    (fun i_0 => (if ((8 * 256) <= i_0 < ((8 * 256) + 256)) then pol.[
                                                                (i_0 -
                                                                (8 * 256))] else 
                matrix.[i_0]))
    );
    i <- 0;
    while ((i < 3)) {
      j <- 0;
      while ((j < 3)) {
        aux <@ _nttunpack ((Array256.init
                           (fun i_0 => matrix.[(((i * (3 * 256)) + (j * 256)) +
                                               i_0)])
                           ));
        matrix <-
        (Array2304.init
        (fun i_0 => (if (((i * (3 * 256)) + (j * 256)) <= i_0 < (((i *
                                                                  (3 * 256)) +
                                                                 (j * 256)) +
                                                                256)) then 
                    aux.[(i_0 - ((i * (3 * 256)) + (j * 256)))] else 
                    matrix.[i_0]))
        );
        j <- (j + 1);
      }
      i <- (i + 1);
    }
    return matrix;
  }
  proc __indcpa_keypair (pk:W8.t Array1184.t, sk:W8.t Array1152.t,
                         randomnessp:W8.t Array32.t) : W8.t Array1184.t *
                                                       W8.t Array1152.t = {
    var aux:W16.t Array256.t;
    var aux_0:W16.t Array256.t;
    var aux_1:W16.t Array256.t;
    var aux_2:W16.t Array256.t;
    var aux_3:W8.t Array1152.t;
    var inc:int;
    var i:int;
    var t64:W64.t;
    var inbuf:W8.t Array33.t;
    var buf:W8.t Array64.t;
    var publicseed:W8.t Array32.t;
    var noiseseed:W8.t Array32.t;
    var transposed:W64.t;
    var aa:W16.t Array2304.t;
    var nonce:W8.t;
    var skpv:W16.t Array768.t;
    var e:W16.t Array768.t;
    var pkpv:W16.t Array768.t;
    aa <- witness;
    buf <- witness;
    e <- witness;
    inbuf <- witness;
    noiseseed <- witness;
    pkpv <- witness;
    publicseed <- witness;
    skpv <- witness;
    (* Erased call to spill *)
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (get64 (WArray32.init8 (fun i_0 => randomnessp.[i_0])) i);
      inbuf <-
      (Array33.init
      (WArray33.get8
      (WArray33.set64 (WArray33.init8 (fun i_0 => inbuf.[i_0])) i t64)));
      i <- (i + 1);
    }
    inbuf.[32] <- (W8.of_int 3);
    buf <@ _sha3_512A_A33 (buf, inbuf);
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (get64 (WArray64.init8 (fun i_0 => buf.[i_0])) i);
      (* Erased call to declassify *)
      publicseed <-
      (Array32.init
      (WArray32.get8
      (WArray32.set64 (WArray32.init8 (fun i_0 => publicseed.[i_0])) i t64)));
      t64 <- (get64 (WArray64.init8 (fun i_0 => buf.[i_0])) (i + (32 %/ 8)));
      noiseseed <-
      (Array32.init
      (WArray32.get8
      (WArray32.set64 (WArray32.init8 (fun i_0 => noiseseed.[i_0])) i t64)));
      i <- (i + 1);
    }
    transposed <- (W64.of_int 0);
    aa <@ _gen_matrix_avx2 (aa, publicseed, transposed);
    nonce <- (W8.of_int 0);
    (aux, aux_0, aux_1, aux_2) <@ _poly_getnoise_eta1_4x ((Array256.init
                                                          (fun i_0 => 
                                                          skpv.[(0 + i_0)])),
    (Array256.init (fun i_0 => skpv.[(256 + i_0)])),
    (Array256.init (fun i_0 => skpv.[((2 * 256) + i_0)])),
    (Array256.init (fun i_0 => e.[(0 + i_0)])), noiseseed, nonce);
    skpv <-
    (Array768.init
    (fun i_0 => (if (0 <= i_0 < (0 + 256)) then aux.[(i_0 - 0)] else 
                skpv.[i_0]))
    );
    skpv <-
    (Array768.init
    (fun i_0 => (if (256 <= i_0 < (256 + 256)) then aux_0.[(i_0 - 256)] else 
                skpv.[i_0]))
    );
    skpv <-
    (Array768.init
    (fun i_0 => (if ((2 * 256) <= i_0 < ((2 * 256) + 256)) then aux_1.[
                                                                (i_0 -
                                                                (2 * 256))] else 
                skpv.[i_0]))
    );
    e <-
    (Array768.init
    (fun i_0 => (if (0 <= i_0 < (0 + 256)) then aux_2.[(i_0 - 0)] else 
                e.[i_0]))
    );
    nonce <- (W8.of_int 4);
    (aux, aux_0, aux_1, aux_2) <@ _poly_getnoise_eta1_4x ((Array256.init
                                                          (fun i_0 => 
                                                          e.[(256 + i_0)])),
    (Array256.init (fun i_0 => e.[((2 * 256) + i_0)])),
    (Array256.init (fun i_0 => pkpv.[(0 + i_0)])),
    (Array256.init (fun i_0 => pkpv.[(256 + i_0)])), noiseseed, nonce);
    e <-
    (Array768.init
    (fun i_0 => (if (256 <= i_0 < (256 + 256)) then aux.[(i_0 - 256)] else 
                e.[i_0]))
    );
    e <-
    (Array768.init
    (fun i_0 => (if ((2 * 256) <= i_0 < ((2 * 256) + 256)) then aux_0.[
                                                                (i_0 -
                                                                (2 * 256))] else 
                e.[i_0]))
    );
    pkpv <-
    (Array768.init
    (fun i_0 => (if (0 <= i_0 < (0 + 256)) then aux_1.[(i_0 - 0)] else 
                pkpv.[i_0]))
    );
    pkpv <-
    (Array768.init
    (fun i_0 => (if (256 <= i_0 < (256 + 256)) then aux_2.[(i_0 - 256)] else 
                pkpv.[i_0]))
    );
    skpv <@ __polyvec_ntt (skpv);
    e <@ __polyvec_ntt (e);
    i <- 0;
    while ((i < 3)) {
      aux <@ __polyvec_pointwise_acc ((Array256.init
                                      (fun i_0 => pkpv.[((i * 256) + i_0)])),
      (Array768.init (fun i_0 => aa.[((i * (3 * 256)) + i_0)])), skpv);
      pkpv <-
      (Array768.init
      (fun i_0 => (if ((i * 256) <= i_0 < ((i * 256) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (i * 256))] else 
                  pkpv.[i_0]))
      );
      aux <@ _poly_frommont ((Array256.init
                             (fun i_0 => pkpv.[((i * 256) + i_0)])));
      pkpv <-
      (Array768.init
      (fun i_0 => (if ((i * 256) <= i_0 < ((i * 256) + 256)) then aux.[
                                                                  (i_0 -
                                                                  (i * 256))] else 
                  pkpv.[i_0]))
      );
      i <- (i + 1);
    }
    pkpv <@ __polyvec_add2 (pkpv, e);
    pkpv <@ __polyvec_reduce (pkpv);
    (* Erased call to unspill *)
    sk <@ __i_polyvec_tobytes (sk, skpv);
    aux_3 <@ __i_polyvec_tobytes ((Array1152.init (fun i_0 => pk.[(0 + i_0)])
                                  ),
    pkpv);
    pk <-
    (Array1184.init
    (fun i_0 => (if (0 <= i_0 < (0 + 1152)) then aux_3.[(i_0 - 0)] else 
                pk.[i_0]))
    );
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (get64 (WArray32.init8 (fun i_0 => publicseed.[i_0])) i);
      pk <-
      (Array1184.init
      (WArray1184.get8
      (WArray1184.set64_direct (WArray1184.init8 (fun i_0 => pk.[i_0]))
      ((i + ((3 * 384) %/ 8)) * 8) t64)));
      i <- (i + 1);
    }
    return (pk, sk);
  }
  proc __indcpa_enc (ct:W8.t Array1088.t, msgp:W8.t Array32.t,
                     pk:W8.t Array1184.t, noiseseed:W8.t Array32.t) : 
  W8.t Array1088.t = {
    var aux:W16.t Array256.t;
    var aux_0:W16.t Array256.t;
    var aux_1:W16.t Array256.t;
    var aux_2:W16.t Array256.t;
    var aux_4:W8.t Array128.t;
    var aux_3:W8.t Array960.t;
    var inc:int;
    var pkpv:W16.t Array768.t;
    var w:int;
    var t64:W64.t;
    var publicseed:W8.t Array32.t;
    var k:W16.t Array256.t;
    var transposed:W64.t;
    var aat:W16.t Array2304.t;
    var nonce:W8.t;
    var sp_0:W16.t Array768.t;
    var ep:W16.t Array768.t;
    var epp:W16.t Array256.t;
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;
    aat <- witness;
    bp <- witness;
    ep <- witness;
    epp <- witness;
    k <- witness;
    pkpv <- witness;
    publicseed <- witness;
    sp_0 <- witness;
    v <- witness;
    (* Erased call to spill *)
    pkpv <@ __i_polyvec_frombytes ((Array1152.init (fun i => pk.[(0 + i)])));
    inc <- (32 %/ 8);
    w <- 0;
    while ((w < inc)) {
      t64 <-
      (get64_direct (WArray1184.init8 (fun i => pk.[i]))
      ((((3 * 384) %/ 8) + w) * 8));
      (* Erased call to declassify *)
      publicseed <-
      (Array32.init
      (WArray32.get8
      (WArray32.set64 (WArray32.init8 (fun i => publicseed.[i])) w t64)));
      w <- (w + 1);
    }
    k <@ _i_poly_frommsg (k, msgp);
    transposed <- (W64.of_int 1);
    aat <@ _gen_matrix_avx2 (aat, publicseed, transposed);
    (* Erased call to unspill *)
    nonce <- (W8.of_int 0);
    (aux, aux_0, aux_1, aux_2) <@ _poly_getnoise_eta1_4x ((Array256.init
                                                          (fun i => sp_0.[
                                                                    (0 + 
                                                                    i)])
                                                          ),
    (Array256.init (fun i => sp_0.[(256 + i)])),
    (Array256.init (fun i => sp_0.[((2 * 256) + i)])),
    (Array256.init (fun i => ep.[(0 + i)])), noiseseed, nonce);
    sp_0 <-
    (Array768.init
    (fun i => (if (0 <= i < (0 + 256)) then aux.[(i - 0)] else sp_0.[i])));
    sp_0 <-
    (Array768.init
    (fun i => (if (256 <= i < (256 + 256)) then aux_0.[(i - 256)] else 
              sp_0.[i]))
    );
    sp_0 <-
    (Array768.init
    (fun i => (if ((2 * 256) <= i < ((2 * 256) + 256)) then aux_1.[(i -
                                                                   (2 * 256))] else 
              sp_0.[i]))
    );
    ep <-
    (Array768.init
    (fun i => (if (0 <= i < (0 + 256)) then aux_2.[(i - 0)] else ep.[i])));
    nonce <- (W8.of_int 4);
    (aux, aux_0, aux_1, aux_2) <@ _poly_getnoise_eta1_4x ((Array256.init
                                                          (fun i => ep.[
                                                                    (256 + 
                                                                    i)])
                                                          ),
    (Array256.init (fun i => ep.[((2 * 256) + i)])), epp,
    (Array256.init (fun i => bp.[(0 + i)])), noiseseed, nonce);
    ep <-
    (Array768.init
    (fun i => (if (256 <= i < (256 + 256)) then aux.[(i - 256)] else ep.[i]))
    );
    ep <-
    (Array768.init
    (fun i => (if ((2 * 256) <= i < ((2 * 256) + 256)) then aux_0.[(i -
                                                                   (2 * 256))] else 
              ep.[i]))
    );
    epp <- aux_1;
    bp <-
    (Array768.init
    (fun i => (if (0 <= i < (0 + 256)) then aux_2.[(i - 0)] else bp.[i])));
    sp_0 <@ __polyvec_ntt (sp_0);
    w <- 0;
    while ((w < 3)) {
      aux <@ __polyvec_pointwise_acc ((Array256.init
                                      (fun i => bp.[((w * 256) + i)])),
      (Array768.init (fun i => aat.[((w * (3 * 256)) + i)])), sp_0);
      bp <-
      (Array768.init
      (fun i => (if ((w * 256) <= i < ((w * 256) + 256)) then aux.[(i -
                                                                   (w * 256))] else 
                bp.[i]))
      );
      w <- (w + 1);
    }
    v <@ __polyvec_pointwise_acc (v, pkpv, sp_0);
    bp <@ __polyvec_invntt (bp);
    v <@ _poly_invntt (v);
    bp <@ __polyvec_add2 (bp, ep);
    v <@ _poly_add2 (v, epp);
    v <@ _poly_add2 (v, k);
    bp <@ __polyvec_reduce (bp);
    v <@ __poly_reduce (v);
    (* Erased call to unspill *)
    aux_3 <@ __i_polyvec_compress ((Array960.init (fun i => ct.[(0 + i)])),
    bp);
    ct <-
    (Array1088.init
    (fun i => (if (0 <= i < (0 + 960)) then aux_3.[(i - 0)] else ct.[i])));
    (aux_4, aux) <@ _i_poly_compress ((Array128.init
                                      (fun i => ct.[((3 * 320) + i)])),
    v);
    ct <-
    (Array1088.init
    (fun i => (if ((3 * 320) <= i < ((3 * 320) + 128)) then aux_4.[(i -
                                                                   (3 * 320))] else 
              ct.[i]))
    );
    v <- aux;
    return ct;
  }
  proc __indcpa_dec (msgp:W8.t Array32.t, ct:W8.t Array1088.t,
                     sk:W8.t Array1152.t) : W8.t Array32.t = {
    var bp:W16.t Array768.t;
    var v:W16.t Array256.t;
    var skpv:W16.t Array768.t;
    var t:W16.t Array256.t;
    var mp:W16.t Array256.t;
    bp <- witness;
    mp <- witness;
    skpv <- witness;
    t <- witness;
    v <- witness;
    bp <@ __i_polyvec_decompress (ct);
    v <@ _i_poly_decompress (v,
    (Array128.init (fun i => ct.[((3 * 320) + i)])));
    skpv <@ __i_polyvec_frombytes (sk);
    bp <@ __polyvec_ntt (bp);
    t <@ __polyvec_pointwise_acc (t, skpv, bp);
    t <@ _poly_invntt (t);
    mp <@ _poly_sub (mp, v, t);
    mp <@ __poly_reduce (mp);
    (msgp, mp) <@ _i_poly_tomsg (msgp, mp);
    return msgp;
  }
  proc __verify (ct:W8.t Array1088.t, ctpc:W8.t Array1088.t) : W64.t = {
    var inc:int;
    var cnd:W64.t;
    var t64:W64.t;
    var h:W256.t;
    var i:int;
    var f:W256.t;
    var g:W256.t;
    var zf:bool;
    var  _0:bool;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    cnd <- (W64.of_int 0);
    t64 <- (W64.of_int 1);
    h <- (set0_256);
    inc <- (((3 * 320) + 128) %/ 32);
    i <- 0;
    while ((i < inc)) {
      f <-
      (get256_direct (WArray1088.init8 (fun i_0 => ctpc.[i_0])) (32 * i));
      g <- (get256_direct (WArray1088.init8 (fun i_0 => ct.[i_0])) (32 * i));
      f <- (VPXOR_256 f g);
      h <- (VPOR_256 h f);
      i <- (i + 1);
    }
    ( _0,  _1,  _2,  _3, zf) <- (VPTEST_256 h h);
    cnd <- ((! zf) ? t64 : cnd);
    return cnd;
  }
  proc __cmov (dst:W8.t Array32.t, src:W8.t Array32.t, cnd:W64.t) : W8.t Array32.t = {
    var scnd:W64.t;
    var m:W256.t;
    var f:W256.t;
    var g:W256.t;
    cnd <- (- cnd);
    scnd <- cnd;
    m <- (VPBROADCAST_4u64 scnd);
    f <- (get256_direct (WArray32.init8 (fun i => src.[i])) 0);
    g <- (get256_direct (WArray32.init8 (fun i => dst.[i])) 0);
    f <- (BLENDV_32u8 f g m);
    dst <-
    (Array32.init
    (WArray32.get8
    (WArray32.set256_direct (WArray32.init8 (fun i => dst.[i])) 0 f)));
    return dst;
  }
  proc __crypto_kem_keypair_jazz (pk:W8.t Array1184.t, sk:W8.t Array2400.t,
                                  randomnessp:W8.t Array64.t) : W8.t Array1184.t *
                                                                W8.t Array2400.t = {
    var inc:int;
    var s_randomnessp:W8.t Array64.t;
    var randomnessp1:W8.t Array32.t;
    var skcpa:W8.t Array1152.t;
    var sk_s:W8.t Array2400.t;
    var i:int;
    var t64:W64.t;
    var hpk:W8.t Array32.t;
    hpk <- witness;
    randomnessp1 <- witness;
    s_randomnessp <- witness;
    sk_s <- witness;
    skcpa <- witness;
    s_randomnessp <- randomnessp;
    randomnessp1 <- (Array32.init (fun i_0 => randomnessp.[(0 + i_0)]));
    skcpa <- (Array1152.init (fun i_0 => sk.[(0 + i_0)]));
    sk_s <- sk;
    (pk, skcpa) <@ __indcpa_keypair (pk, skcpa, randomnessp1);
    sk <- sk_s;
    sk <-
    (Array2400.init
    (fun i_0 => (if (0 <= i_0 < (0 + 1152)) then skcpa.[(i_0 - 0)] else 
                sk.[i_0]))
    );
    inc <- (((3 * 384) + 32) %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <- (get64 (WArray1184.init8 (fun i_0 => pk.[i_0])) i);
      sk <-
      (Array2400.init
      (WArray2400.get8
      (WArray2400.set64_direct (WArray2400.init8 (fun i_0 => sk.[i_0]))
      ((((3 * 384) %/ 8) + i) * 8) t64)));
      i <- (i + 1);
    }
    (* Erased call to spill *)
    hpk <-
    (Array32.init (fun i_0 => sk.[(((3 * 384) + ((3 * 384) + 32)) + i_0)]));
    hpk <@ _sha3_256A_A1184 (hpk, pk);
    (* Erased call to unspill *)
    sk <-
    (Array2400.init
    (fun i_0 => (if (((3 * 384) + ((3 * 384) + 32)) <= i_0 < (((3 * 384) +
                                                              ((3 * 384) +
                                                              32)) +
                                                             32)) then 
                hpk.[(i_0 - ((3 * 384) + ((3 * 384) + 32)))] else sk.[i_0]))
    );
    randomnessp <- s_randomnessp;
    inc <- (32 %/ 8);
    i <- 0;
    while ((i < inc)) {
      t64 <-
      (get64 (WArray64.init8 (fun i_0 => randomnessp.[i_0])) ((32 %/ 8) + i));
      sk <-
      (Array2400.init
      (WArray2400.get8
      (WArray2400.set64_direct (WArray2400.init8 (fun i_0 => sk.[i_0]))
      ((((((3 * 384) + ((3 * 384) + 32)) + 32) %/ 8) + i) * 8) t64)));
      i <- (i + 1);
    }
    return (pk, sk);
  }
  proc __crypto_kem_enc_jazz (ct:W8.t Array1088.t, shk:W8.t Array32.t,
                              pk:W8.t Array1184.t, randomnessp:W8.t Array32.t) : 
  W8.t Array1088.t * W8.t Array32.t = {
    var aux:W8.t Array32.t;
    var b:W256.t;
    var buf:W8.t Array64.t;
    var kr:W8.t Array64.t;
    var k:W256.t;
    buf <- witness;
    kr <- witness;
    (* Erased call to spill *)
    b <- (get256 (WArray32.init8 (fun i => randomnessp.[i])) 0);
    buf <-
    (Array64.init
    (WArray64.get8 (WArray64.set256 (WArray64.init8 (fun i => buf.[i])) 0 b))
    );
    aux <@ _sha3_256A_A1184 ((Array32.init (fun i => buf.[(32 + i)])), pk);
    buf <-
    (Array64.init
    (fun i => (if (32 <= i < (32 + 32)) then aux.[(i - 32)] else buf.[i])));
    kr <@ _sha3_512A_A64 (kr, buf);
    (* Erased call to unspill *)
    ct <@ __indcpa_enc (ct, (Array32.init (fun i => buf.[(0 + i)])), 
    pk, (Array32.init (fun i => kr.[(32 + i)])));
    (* Erased call to unspill *)
    k <- (get256 (WArray64.init8 (fun i => kr.[i])) 0);
    shk <-
    (Array32.init
    (WArray32.get8 (WArray32.set256 (WArray32.init8 (fun i => shk.[i])) 0 k))
    );
    return (ct, shk);
  }
  proc __crypto_kem_dec_jazz (shk:W8.t Array32.t, ct:W8.t Array1088.t,
                              sk:W8.t Array2400.t) : W8.t Array32.t = {
    var aux:W8.t Array32.t;
    var inc:int;
    var z:W256.t;
    var zp_ct:W8.t Array1120.t;
    var skp:W8.t Array1152.t;
    var buf:W8.t Array64.t;
    var k:W256.t;
    var kr:W8.t Array64.t;
    var ctc:W8.t Array1088.t;
    var cnd:W64.t;
    var j:int;
    var c:W256.t;
    buf <- witness;
    ctc <- witness;
    kr <- witness;
    skp <- witness;
    zp_ct <- witness;
    (* Erased call to spill *)
    z <-
    (get256_direct (WArray2400.init8 (fun i => sk.[i]))
    ((((3 * 384) + ((3 * 384) + 32)) + (2 * 32)) - 32));
    zp_ct <-
    (Array1120.init
    (WArray1120.get8
    (WArray1120.set256 (WArray1120.init8 (fun i => zp_ct.[i])) 0 z)));
    skp <- (Array1152.init (fun i => sk.[(0 + i)]));
    aux <@ __indcpa_dec ((Array32.init (fun i => buf.[(0 + i)])), ct, skp);
    buf <-
    (Array64.init
    (fun i => (if (0 <= i < (0 + 32)) then aux.[(i - 0)] else buf.[i])));
    k <-
    (get256_direct (WArray2400.init8 (fun i => sk.[i]))
    ((3 * 384) + ((3 * 384) + 32)));
    buf <-
    (Array64.init
    (WArray64.get8 (WArray64.set256 (WArray64.init8 (fun i => buf.[i])) 1 k))
    );
    kr <@ _sha3_512A_A64 (kr, buf);
    (* Erased call to unspill *)
    ctc <@ __indcpa_enc (ctc, (Array32.init (fun i => buf.[(0 + i)])),
    (Array1184.init (fun i => sk.[((3 * 384) + i)])),
    (Array32.init (fun i => kr.[(32 + i)])));
    (* Erased call to unspill *)
    cnd <@ __verify (ct, ctc);
    (* Erased call to spill *)
    inc <- (((3 * 320) + 128) %/ 32);
    j <- 0;
    while ((j < inc)) {
      c <- (get256 (WArray1088.init8 (fun i => ct.[i])) j);
      zp_ct <-
      (Array1120.init
      (WArray1120.get8
      (WArray1120.set256 (WArray1120.init8 (fun i => zp_ct.[i]))
      ((32 %/ 32) + j) c)));
      j <- (j + 1);
    }
    (* Erased call to unspill *)
    shk <@ _shake256_A32__A1120 (shk, zp_ct);
    (* Erased call to unspill *)
    shk <@ __cmov (shk, (Array32.init (fun i => kr.[(0 + i)])), cnd);
    return shk;
  }
  proc jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand (public_key:W8.t Array1184.t,
                                                          secret_key:W8.t Array2400.t,
                                                          coins:W8.t Array64.t) : 
  W8.t Array1184.t * W8.t Array2400.t * W64.t = {
    var r:W64.t;
    var  _0:W64.t;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
     _0 <- (init_msf);
    (public_key, secret_key) <@ __crypto_kem_keypair_jazz (public_key,
    secret_key, coins);
    ( _1,  _2,  _3,  _4,  _5, r) <- (set0_64);
    return (public_key, secret_key, r);
  }
  proc jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand (ciphertext:W8.t Array1088.t,
                                                      shared_secret:W8.t Array32.t,
                                                      public_key:W8.t Array1184.t,
                                                      coins:W8.t Array32.t) : 
  W8.t Array1088.t * W8.t Array32.t * W64.t = {
    var r:W64.t;
    var  _0:W64.t;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
     _0 <- (init_msf);
    public_key <- public_key;
    (ciphertext, shared_secret) <@ __crypto_kem_enc_jazz (ciphertext,
    shared_secret, public_key, coins);
    ( _1,  _2,  _3,  _4,  _5, r) <- (set0_64);
    return (ciphertext, shared_secret, r);
  }
  proc jade_kem_mlkem_mlkem768_amd64_avx2_dec (shared_secret:W8.t Array32.t,
                                               ciphertext:W8.t Array1088.t,
                                               secret_key:W8.t Array2400.t) : 
  W8.t Array32.t * W64.t = {
    var r:W64.t;
    var  _0:W64.t;
    var  _1:bool;
    var  _2:bool;
    var  _3:bool;
    var  _4:bool;
    var  _5:bool;
     _0 <- (init_msf);
    shared_secret <@ __crypto_kem_dec_jazz (shared_secret, ciphertext,
    secret_key);
    ( _1,  _2,  _3,  _4,  _5, r) <- (set0_64);
    return (shared_secret, r);
  }
}.
