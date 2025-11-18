require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array1152 Array1088 Array960 Array1410 Array768 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8 Array2.
from JazzEC require import WArray512 WArray128 WArray384 WArray32 WArray16 WArray1410 WArray160 WArray960 WArray1152 WArray1536.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem768.
from JazzEC require import Jkem768_avx2.
require import MLKEM_PolyVec_avx2_prevec.
require import MLKEM_Poly_avx2_prevec.
require import NTT_avx2 NTT_avx2_ntt NTT_avx2_invntt.
require import Fqmul_avx2 Red_x16_avx2.
require import Fq.
require import NTT_Fq.
require import MLKEM_Poly.
require import MLKEM_PolyVec.
require import MLKEM_avx2_auxlemmas.
require import MLKEM_Poly_avx2_proof.
require import MLKEM_PolyVec_avx2_proof.
require import MLKEM_Poly_avx2_vec.
require import MLKEM_PolyVec_avx2_vec.
require import MLKEM_InnerPKE.
require import MLKEMFCLib.

import GFq Rq Symmetric Symmetric768 Serialization Serialization768 Sampling VecMat VecMat768 InnerPKE768 MLKEM768 Correctness768 Fq SignedReductions.

import Zq.
import ZModP.
import Fq_avx2.
import NTT_Avx2.
import MLKEM_Poly.
import MLKEM_PolyVec.

import MLKEM_PolyAVX.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import MLKEM_PolyVecAVXVec.

require import Bindings.


import KMatrix Vector.

from JazzEC require import WArray1088 WArray2048.
require import Bindings BitEncoding.
import BitChunking BS2Int.


from JazzEC require import WArray384.

op frombytes_circuit(c : W12.t) : W16.t = 
  zeroextu16 c.


lemma polyvec_frombytes_ll : islossless Jkem768_avx2.M.__i_polyvec_frombytes.
proc; inline *;wp. 
  while (0 <= i <= 4) (4-i); last by  auto =>  /> /#.
move => *. cfold 3. unroll for ^while;auto => /> /#.
qed.

op  perm_nttunpackv(i : int) : int =  nth (-1) 
  [0; 8; 16; 24; 32; 40; 48; 56; 64; 72; 80; 88; 96; 104; 112; 120; 1; 9; 17; 25; 33; 41; 49; 57; 65; 73; 81; 89; 97;
     105; 113; 121; 2; 10; 18; 26; 34; 42; 50; 58; 66; 74; 82; 90; 98; 106; 114; 122; 3; 11; 19; 27; 35; 43; 51; 59;
     67; 75; 83; 91; 99; 107; 115; 123; 4; 12; 20; 28; 36; 44; 52; 60; 68; 76; 84; 92; 100; 108; 116; 124; 5; 13; 21;
     29; 37; 45; 53; 61; 69; 77; 85; 93; 101; 109; 117; 125; 6; 14; 22; 30; 38; 46; 54; 62; 70; 78; 86; 94; 102; 110;
     118; 126; 7; 15; 23; 31; 39; 47; 55; 63; 71; 79; 87; 95; 103; 111; 119; 127; 128; 136; 144; 152; 160; 168; 176;
     184; 192; 200; 208; 216; 224; 232; 240; 248; 129; 137; 145; 153; 161; 169; 177; 185; 193; 201; 209; 217; 225; 233;
     241; 249; 130; 138; 146; 154; 162; 170; 178; 186; 194; 202; 210; 218; 226; 234; 242; 250; 131; 139; 147; 155; 163;
     171; 179; 187; 195; 203; 211; 219; 227; 235; 243; 251; 132; 140; 148; 156; 164; 172; 180; 188; 196; 204; 212; 220;
     228; 236; 244; 252; 133; 141; 149; 157; 165; 173; 181; 189; 197; 205; 213; 221; 229; 237; 245; 253; 134; 142; 150;
     158; 166; 174; 182; 190; 198; 206; 214; 222; 230; 238; 246; 254; 135; 143; 151; 159; 167; 175; 183; 191; 199; 207;
     215; 223; 231; 239; 247; 255; 256; 264; 272; 280; 288; 296; 304; 312; 320; 328; 336; 344; 352; 360; 368; 376; 257;
     265; 273; 281; 289; 297; 305; 313; 321; 329; 337; 345; 353; 361; 369; 377; 258; 266; 274; 282; 290; 298; 306; 314;
     322; 330; 338; 346; 354; 362; 370; 378; 259; 267; 275; 283; 291; 299; 307; 315; 323; 331; 339; 347; 355; 363; 371;
     379; 260; 268; 276; 284; 292; 300; 308; 316; 324; 332; 340; 348; 356; 364; 372; 380; 261; 269; 277; 285; 293; 301;
     309; 317; 325; 333; 341; 349; 357; 365; 373; 381; 262; 270; 278; 286; 294; 302; 310; 318; 326; 334; 342; 350; 358;
     366; 374; 382; 263; 271; 279; 287; 295; 303; 311; 319; 327; 335; 343; 351; 359; 367; 375; 383; 384; 392; 400; 408;
     416; 424; 432; 440; 448; 456; 464; 472; 480; 488; 496; 504; 385; 393; 401; 409; 417; 425; 433; 441; 449; 457; 465;
     473; 481; 489; 497; 505; 386; 394; 402; 410; 418; 426; 434; 442; 450; 458; 466; 474; 482; 490; 498; 506; 387; 395;
     403; 411; 419; 427; 435; 443; 451; 459; 467; 475; 483; 491; 499; 507; 388; 396; 404; 412; 420; 428; 436; 444; 452;
     460; 468; 476; 484; 492; 500; 508; 389; 397; 405; 413; 421; 429; 437; 445; 453; 461; 469; 477; 485; 493; 501; 509;
     390; 398; 406; 414; 422; 430; 438; 446; 454; 462; 470; 478; 486; 494; 502; 510; 391; 399; 407; 415; 423; 431; 439;
     447; 455; 463; 471; 479; 487; 495; 503; 511; 512; 520; 528; 536; 544; 552; 560; 568; 576; 584; 592; 600; 608; 616;
     624; 632; 513; 521; 529; 537; 545; 553; 561; 569; 577; 585; 593; 601; 609; 617; 625; 633; 514; 522; 530; 538; 546;
     554; 562; 570; 578; 586; 594; 602; 610; 618; 626; 634; 515; 523; 531; 539; 547; 555; 563; 571; 579; 587; 595; 603;
     611; 619; 627; 635; 516; 524; 532; 540; 548; 556; 564; 572; 580; 588; 596; 604; 612; 620; 628; 636; 517; 525; 533;
     541; 549; 557; 565; 573; 581; 589; 597; 605; 613; 621; 629; 637; 518; 526; 534; 542; 550; 558; 566; 574; 582; 590;
     598; 606; 614; 622; 630; 638; 519; 527; 535; 543; 551; 559; 567; 575; 583; 591; 599; 607; 615; 623; 631; 639; 640;
     648; 656; 664; 672; 680; 688; 696; 704; 712; 720; 728; 736; 744; 752; 760; 641; 649; 657; 665; 673; 681; 689; 697;
     705; 713; 721; 729; 737; 745; 753; 761; 642; 650; 658; 666; 674; 682; 690; 698; 706; 714; 722; 730; 738; 746; 754;
     762; 643; 651; 659; 667; 675; 683; 691; 699; 707; 715; 723; 731; 739; 747; 755; 763; 644; 652; 660; 668; 676; 684;
     692; 700; 708; 716; 724; 732; 740; 748; 756; 764; 645; 653; 661; 669; 677; 685; 693; 701; 709; 717; 725; 733; 741;
     749; 757; 765; 646; 654; 662; 670; 678; 686; 694; 702; 710; 718; 726; 734; 742; 750; 758; 766; 647; 655; 663; 671;
     679; 687; 695; 703; 711; 719; 727; 735; 743; 751; 759; 767] i. 

op  perm_nttpackv(i : int) =  nth (-1) 
  [0; 16; 32; 48; 64; 80; 96; 112; 1; 17; 33; 49; 65; 81; 97; 113; 2; 18; 34; 50; 66; 82; 98; 114; 3; 19; 35; 51;
        67; 83; 99; 115; 4; 20; 36; 52; 68; 84; 100; 116; 5; 21; 37; 53; 69; 85; 101; 117; 6; 22; 38; 54; 70; 86; 102;
        118; 7; 23; 39; 55; 71; 87; 103; 119; 8; 24; 40; 56; 72; 88; 104; 120; 9; 25; 41; 57; 73; 89; 105; 121; 10; 26;
        42; 58; 74; 90; 106; 122; 11; 27; 43; 59; 75; 91; 107; 123; 12; 28; 44; 60; 76; 92; 108; 124; 13; 29; 45; 61;
        77; 93; 109; 125; 14; 30; 46; 62; 78; 94; 110; 126; 15; 31; 47; 63; 79; 95; 111; 127; 128; 144; 160; 176; 192;
        208; 224; 240; 129; 145; 161; 177; 193; 209; 225; 241; 130; 146; 162; 178; 194; 210; 226; 242; 131; 147; 163;
        179; 195; 211; 227; 243; 132; 148; 164; 180; 196; 212; 228; 244; 133; 149; 165; 181; 197; 213; 229; 245; 134;
        150; 166; 182; 198; 214; 230; 246; 135; 151; 167; 183; 199; 215; 231; 247; 136; 152; 168; 184; 200; 216; 232;
        248; 137; 153; 169; 185; 201; 217; 233; 249; 138; 154; 170; 186; 202; 218; 234; 250; 139; 155; 171; 187; 203;
        219; 235; 251; 140; 156; 172; 188; 204; 220; 236; 252; 141; 157; 173; 189; 205; 221; 237; 253; 142; 158; 174;
        190; 206; 222; 238; 254; 143; 159; 175; 191; 207; 223; 239; 255; 256; 272; 288; 304; 320; 336; 352; 368; 257;
        273; 289; 305; 321; 337; 353; 369; 258; 274; 290; 306; 322; 338; 354; 370; 259; 275; 291; 307; 323; 339; 355;
        371; 260; 276; 292; 308; 324; 340; 356; 372; 261; 277; 293; 309; 325; 341; 357; 373; 262; 278; 294; 310; 326;
        342; 358; 374; 263; 279; 295; 311; 327; 343; 359; 375; 264; 280; 296; 312; 328; 344; 360; 376; 265; 281; 297;
        313; 329; 345; 361; 377; 266; 282; 298; 314; 330; 346; 362; 378; 267; 283; 299; 315; 331; 347; 363; 379; 268;
        284; 300; 316; 332; 348; 364; 380; 269; 285; 301; 317; 333; 349; 365; 381; 270; 286; 302; 318; 334; 350; 366;
        382; 271; 287; 303; 319; 335; 351; 367; 383; 384; 400; 416; 432; 448; 464; 480; 496; 385; 401; 417; 433; 449;
        465; 481; 497; 386; 402; 418; 434; 450; 466; 482; 498; 387; 403; 419; 435; 451; 467; 483; 499; 388; 404; 420;
        436; 452; 468; 484; 500; 389; 405; 421; 437; 453; 469; 485; 501; 390; 406; 422; 438; 454; 470; 486; 502; 391;
        407; 423; 439; 455; 471; 487; 503; 392; 408; 424; 440; 456; 472; 488; 504; 393; 409; 425; 441; 457; 473; 489;
        505; 394; 410; 426; 442; 458; 474; 490; 506; 395; 411; 427; 443; 459; 475; 491; 507; 396; 412; 428; 444; 460;
        476; 492; 508; 397; 413; 429; 445; 461; 477; 493; 509; 398; 414; 430; 446; 462; 478; 494; 510; 399; 415; 431;
        447; 463; 479; 495; 511; 512; 528; 544; 560; 576; 592; 608; 624; 513; 529; 545; 561; 577; 593; 609; 625; 514;
        530; 546; 562; 578; 594; 610; 626; 515; 531; 547; 563; 579; 595; 611; 627; 516; 532; 548; 564; 580; 596; 612;
        628; 517; 533; 549; 565; 581; 597; 613; 629; 518; 534; 550; 566; 582; 598; 614; 630; 519; 535; 551; 567; 583;
        599; 615; 631; 520; 536; 552; 568; 584; 600; 616; 632; 521; 537; 553; 569; 585; 601; 617; 633; 522; 538; 554;
        570; 586; 602; 618; 634; 523; 539; 555; 571; 587; 603; 619; 635; 524; 540; 556; 572; 588; 604; 620; 636; 525;
        541; 557; 573; 589; 605; 621; 637; 526; 542; 558; 574; 590; 606; 622; 638; 527; 543; 559; 575; 591; 607; 623;
        639; 640; 656; 672; 688; 704; 720; 736; 752; 641; 657; 673; 689; 705; 721; 737; 753; 642; 658; 674; 690; 706;
        722; 738; 754; 643; 659; 675; 691; 707; 723; 739; 755; 644; 660; 676; 692; 708; 724; 740; 756; 645; 661; 677;
        693; 709; 725; 741; 757; 646; 662; 678; 694; 710; 726; 742; 758; 647; 663; 679; 695; 711; 727; 743; 759; 648;
        664; 680; 696; 712; 728; 744; 760; 649; 665; 681; 697; 713; 729; 745; 761; 650; 666; 682; 698; 714; 730; 746;
        762; 651; 667; 683; 699; 715; 731; 747; 763; 652; 668; 684; 700; 716; 732; 748; 764; 653; 669; 685; 701; 717;
        733; 749; 765; 654; 670; 686; 702; 718; 734; 750; 766; 655; 671; 687; 703; 719; 735; 751; 767] i. 

lemma perm_nttunpackv_rng i :
  0 <= i < 768 => 0<= perm_nttunpackv i <768.
proof.
  have : all (fun i => 0 <= perm_nttunpackv i < 768) (iota_ 0 768).
  + by rewrite /perm_nttunpackv  -iotaredE /=.
  move => H Hi; rewrite allP in H; move : (H i _);by smt(mem_iota). 
qed.

lemma perm_nttpackv_rng i :
  0 <= i < 768 => 0<= perm_nttpackv i <768.
proof.
  have : all (fun i => 0 <= perm_nttpackv i < 768) (iota_ 0 768).
  + by rewrite /perm_nttpackv  -iotaredE /=.
  move => H Hi; rewrite allP in H; move : (H i _);by smt(mem_iota). 
qed. 


lemma post_lane_commute_out_aligned_perm ['a 'b 'c]
    (lic : 'a list) 
    (lo : 'c list) 
    (tobitsic : 'a -> bool list)
    (ofbitsic : bool list -> 'a)
    (tobitsi : 'b -> bool list)
    (ofbitsi : bool list -> 'b)
    (tobitso : 'c -> bool list)
    (ofbitso : bool list -> 'c)
    (f : 'b -> 'c)
    (nic ni no  : int) 
    (perm : int -> int)
    (permi : int -> int):
  0 < nic =>  0 < ni => 0 < no => 
  ni %| nic*size lic =>
  size lo = (nic*size lic) %/ ni =>
  (forall x, size (tobitsic x) = nic) =>
  (forall x, ofbitsic (tobitsic x) = x) =>
  (forall x, size (tobitsi x) = ni) =>
  (forall x, ofbitsi (tobitsi x) = x) =>
  (forall x, size x = ni => tobitsi (ofbitsi x) = x) =>
  (forall x, size (tobitso x) = no) =>
  (forall x, ofbitso (tobitso x) = x) =>
  (forall ii, 0 <= ii < size lo => 0 <= perm ii < size lo) =>
  (forall ii, 0 <= ii < size lo => permi (perm ii) = ii) =>
map f (map ofbitsi (chunk ni (flatten (map tobitsic lic)))) =
mkseq (fun (i1 : int) => nth witness
(map ofbitso (chunk no (flatten (map tobitso lo)))) (permi i1)) 
   (size (map ofbitso (chunk no (flatten (map tobitso lo))))) => 
   lo =
   mkseq (fun (i1 : int) => nth witness 
      (map f (map ofbitsi (chunk ni (flatten (map tobitsic lic)))))
         (perm i1)) (size ((map f (map ofbitsi (chunk ni (flatten (map tobitsic lic))))))).
move => ??????????????; rewrite  !map_chunk_flatten_id 1..3:/#.
move => H.
apply (eq_from_nth witness).
+ rewrite size_mkseq. 
  rewrite !size_map size_iota (EclibExtra.size_flatten' nic);1:smt(mapP).
  rewrite size_map; smt(size_ge0).   
move => i ib.
rewrite nth_mkseq /=.
+ rewrite !size_map size_iota (EclibExtra.size_flatten' nic);1:smt(mapP).
  rewrite size_map; smt(size_ge0).   
rewrite H.
rewrite nth_mkseq /=;1,2:smt().
qed.

lemma nttpermsK i :
 0 <= i < 768 => 
   perm_nttpackv (perm_nttunpackv i) = i.
proof.
move => Hi.
have : all (fun i => perm_nttpackv (perm_nttunpackv i) = i) (iota_ 0 768); 
  last by rewrite allP /= => H; rewrite H; smt(mem_iota).
rewrite  /perm_nttunpackv /perm_nttpackv /nttpackv /nttunpackv.
rewrite /nttpack /nttunpack /subarray256 -iotaredE /=;do split;smt().
qed. 

lemma nttpermsKi i :
 0 <= i < 768 => 
   perm_nttunpackv (perm_nttpackv i) = i.
proof.
move => Hi.
have : all (fun i => perm_nttunpackv (perm_nttpackv i) = i) (iota_ 0 768); 
  last by rewrite allP /= => H; rewrite H; smt(mem_iota).
rewrite  /perm_nttunpackv /perm_nttpackv /nttpackv /nttunpackv.
rewrite /nttpack /nttunpack /subarray256 -iotaredE /=;do split;smt().
qed. 

lemma polyvec_frombytes_corr_h (_aw : W8.t Array1152.t): 
    hoare [Jkem768_avx2.M.__i_polyvec_frombytes  :
             a = _aw
              ==>
             lift_array768 res = nttunpackv (map incoeff (decode12_vec _aw))  /\
             pos_bound768_cxq res 0 768  2].
proc; inline *.
proc change ^while.1: (init_256_16 (fun (i_0 : int) => r.[256 * i + i_0])); 1: by auto.
proc change ^while.2: (init_384_8 (fun (i_0 : int) => a.[384 * i + i_0])  ); 1: by auto.
proc change ^while.3: (sliceget16_16_256 maskx16 0); 1: by auto.
proc change ^while.^while.1 : (sliceget384_8_256 ap (192*i0*8)); 1: by auto => /> /#.
proc change ^while.^while.2 : (sliceget384_8_256 ap ((192*i0+32)*8)); 1: by auto => /> /#.
proc change ^while.^while.3 : (sliceget384_8_256 ap ((192*i0+64)*8)); 1: by auto => /> /#.
proc change ^while.^while.4 : (sliceget384_8_256 ap ((192*i0+96)*8)); 1: by auto => /> /#.
proc change ^while.^while.5 : (sliceget384_8_256 ap ((192*i0+128)*8)); 1: by auto => /> /#.
proc change ^while.^while.6 : (sliceget384_8_256 ap ((192*i0+160)*8)); 1: by auto => /> /#.
proc change ^while.^while.101 : (sliceset256_16_256 rp (8*i0 *256) t6);1: by auto => /> /#.
proc change ^while.^while.102 : (sliceset256_16_256 rp ((8*i0+1) *256) t7);1: by auto => /> /#.
proc change ^while.^while.103 : (sliceset256_16_256 rp ((8*i0+2) *256) t8);1: by auto => /> /#.
proc change ^while.^while.104 : (sliceset256_16_256 rp ((8*i0+3) *256) t9);1: by auto => /> /#.
proc change ^while.^while.105 : (sliceset256_16_256 rp ((8*i0+4) *256) t4);1: by auto => /> /#.
proc change ^while.^while.106 : (sliceset256_16_256 rp ((8*i0+5) *256) t10);1: by auto => /> /#.
proc change ^while.^while.107 : (sliceset256_16_256 rp ((8*i0+6) *256) t11);1: by auto => /> /#.
proc change ^while.^while.108 : (sliceset256_16_256 rp ((8*i0+7) *256) tt);1: by auto => /> /#.
proc change ^while.7: (init_768_16 (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux.[i_0 - 256 * i] else r.[i_0])); 1: by auto.

unroll for ^while.
do 3!(unroll for ^while).
cfold ^i0<-.
wp -2. 

bdep 12 16 [_aw] [a] [r] frombytes_circuit pcond_true12 perm_nttpackv. 

(* BDEP pre conseq *)
+ by move => &hr />; rewrite allP /pcond_true12 /=. 

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= <- rr; rewrite /= !flatten1.

move => H1; have H2 := post_lane_commute_out_aligned_perm (to_list a{hr}) (to_list rr) W8.w2bits W8.bits2w W12.w2bits W12.bits2w W16.w2bits W16.bits2w  frombytes_circuit 8 12 16 perm_nttunpackv perm_nttpackv _ _ _ _ _ _ _ _ _ _ _ _ _ _ _;1..12:
smt(Array1152.size_to_list Array768.size_to_list W16.bits2wK BVA_Top_Bindings_W12_t.oflistP).
+ smt(perm_nttunpackv_rng Array768.size_to_list).
+ move => ?; rewrite Array768.size_to_list => ?;smt(nttpermsK). 

  have /=? := decode_range_vec 0 (to_list a{hr}) 12 _ _;1,2:smt(Array1152.size_to_list).

+ by smt().

have H3 : 
  map frombytes_circuit (map W12.bits2w (chunk 12 (flatten (map W8.w2bits (to_list a{hr}))))) =
   to_list (map W16.of_int  (decode12_vec a{hr})).
+ rewrite /decode12_vec Array768.map_of_list Array768.of_listK;1:by rewrite !size_map /decode size_iota size_BytesToBits size_to_list /#.
  rewrite /decode -map_comp -(map_comp _ BS2Int.bs2int) /=.
  apply eq_in_map => x xb.
  rewrite /(\o) /frombytes_circuit /zeroextu16.
  have ? : size x = 12 by smt(@BitChunking).
  congr;rewrite /to_uint W12.bits2wK;1 :  by smt(@BitChunking).
  done.

split.
+ rewrite tP => i ib.
  rewrite mapiE 1:/# /= initiE 1:/# /=.
  case (0<=i<256) => *.
  + rewrite /nttunpack initiE 1:/# /= /subarray256 initiE /=;1:smt( nttunpack_inbounds).
    rewrite mapiE /=;1:smt( nttunpack_inbounds).
    rewrite -(Array768.get_to_list rr) H2 H3 /decode12.
    rewrite nth_mkseq /=;1: by smt(Array768.size_to_list).
    + rewrite  mapiE;1: by smt(perm_nttunpackv_rng).
    congr; rewrite of_sintK /=.
     rewrite /smod /= ifF. 
     + rewrite /decode12_vec get_of_list;1: smt(perm_nttunpackv_rng). 
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite modz_small. 
    + rewrite /decode12_vec get_of_list; 1: smt(perm_nttunpackv_rng).
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite /perm_nttunpackv /nttunpackv initiE 1:/# /= /#.

  case (256<=i<512) => *.
  + rewrite /nttunpack initiE 1:/# /= /subarray256 initiE /=;1:smt( nttunpack_inbounds).
    rewrite mapiE /=;1:smt( nttunpack_inbounds).
    rewrite -(Array768.get_to_list rr) H2 H3 /decode12.
    rewrite nth_mkseq /=;1: by smt(Array768.size_to_list).
    + rewrite  mapiE;1: by smt(perm_nttunpackv_rng).
    congr; rewrite of_sintK /=.
     rewrite /smod /= ifF. 
     + rewrite /decode12_vec get_of_list;1: smt(perm_nttunpackv_rng). 
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite modz_small. 
    + rewrite /decode12_vec get_of_list; 1: smt(perm_nttunpackv_rng).
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite /perm_nttunpackv /nttunpackv initiE 1:/# /= /#.


  + rewrite /nttunpack initiE 1:/# /= /subarray256 initiE /=;1:smt( nttunpack_inbounds).
    rewrite mapiE /=;1:smt( nttunpack_inbounds).
    rewrite -(Array768.get_to_list rr) H2 H3 /decode12.
    rewrite nth_mkseq /=;1: by smt(Array768.size_to_list).
    + rewrite  mapiE;1: by smt(perm_nttunpackv_rng).
    congr; rewrite of_sintK /=.
     rewrite /smod /= ifF. 
     + rewrite /decode12_vec get_of_list;1: smt(perm_nttunpackv_rng). 
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite modz_small. 
    + rewrite /decode12_vec get_of_list; 1: smt(perm_nttunpackv_rng).
       by have /= := decode_rng (to_list a{hr}) 12 (perm_nttunpackv i) _;smt(). 
    rewrite /perm_nttunpackv /nttunpackv initiE 1:/# /= /#.

  rewrite /pos_bound768_cxq qE /= => k kb. 
  have /=? := decode_range_vec witness (to_list a{hr}) 12 _ _;1..2:smt(Array1152.size_to_list).
  rewrite -get_to_list  H2 H3 /decode12_vec.
  rewrite nth_mkseq /=;1: by rewrite size_map size_iota /#. 
  rewrite get_of_list;1:smt(perm_nttunpackv_rng). 
  rewrite (nth_map witness);1:smt(perm_nttunpackv_rng). 
rewrite of_sintK /= /smod /= ifF;1:smt(@Zq perm_nttunpackv_rng).
  rewrite modz_small;1,2:  smt(perm_nttunpackv_rng).  
   
qed.


lemma polyvec_frombytes_corr (_aw : W8.t Array1152.t): 
    phoare [Jkem768_avx2.M.__i_polyvec_frombytes  :
             a = _aw
              ==>
             lift_array768 res = nttunpackv (map incoeff (decode12_vec _aw))  /\
             pos_bound768_cxq res 0 768  2] = 1%r
  by conseq polyvec_frombytes_ll (polyvec_frombytes_corr_h _aw).

lemma polyvec_frombytes_equiv :
    equiv [Jkem768_avx2.M.__i_polyvec_frombytes ~Jkem768.M.__i_polyvec_frombytes :
             a{1}=ap{2} ==>
             lift_array768 res{1} = nttunpackv (lift_array768 res{2}) /\
             pos_bound768_cxq res{1} 0 768 2 /\
             pos_bound768_cxq res{2} 0 768 2 ].
proc*.
ecall{1} (polyvec_frombytes_corr a{1}).
ecall{2} (MLKEM_PolyVec.polyvec_frombytes_corr ap{2}).
auto => /> &2 rr1 -> ? rr2 -> ? //.
qed.
