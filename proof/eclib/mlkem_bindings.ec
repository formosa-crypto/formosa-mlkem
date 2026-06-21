(* -------------------------------------------------------------------- *)
(* Circuit-only bindings (mldsa-style): just the AVX2 SIMD-intrinsic     *)
(* `bind circuit` block. All word/array/slice bindings now live in       *)
(* CircuitBindings.ec + the per-size XWord*/XArray* clone files, which    *)
(* consumers import directly.                                            *)
(* -------------------------------------------------------------------- *)
from Jasmin require import JModel_x86.

require import CircuitBindings.

(* filter AVX2 helpers (moved here when mlkem_filters_bindings.ec was dropped) *)
op VPINC_8u8 : W64.t -> W64.t.
op VPUNPCKL_16u8 : W64.t -> W64.t -> W128.t.
op popcount_64 (w : W64.t) : W64.t = (POPCNT_64 w).`6.
lemma popcount_64E (w : W64.t) : (POPCNT_64 w).`6 = popcount_64 w.
proof. done. qed.

(* BEGIN BIND CIRCUITS *)
bind circuit
    VPBROADCAST_16u16 <- "VPBROADCAST_16u16",
    VPBROADCAST_8u32 <- "VPBROADCAST_8u32",
    VPBROADCAST_4u64 <- "VPBROADCAST_4u64",
    VPMADDWD_256 <- "VPMADDWD_16u16",
    VPSLLV_8u32 <- "VPSLLV_8u32",
    VPSHUFB_256 <- "VPSHUFB_256",
    VEXTRACTI128 <- "VEXTRACTI128",
    VINSERTI128    <-   "VPINSERTI128",
    VPBLENDW_128 <- "VPBLENDW_128",
    BLENDV_16u8 <- "VPBLENDVB_128",
    VPEXTR_32 <- "VEXTRACTI32_256",
    W4u32.VPEXTR_32 <- "VEXTRACTI32_128", (* FIXME: WHY ARE WE USING THIS BINDING? *)
    VPMULH_16u16 <- "VPMULH_16u16",
    VPMULHRS_16u16 <- "VPMULHRS_16u16",
    VPMULL_16u16 <- "VPMULL_16u16",
    VPSUB_16u16 <- "VPSUB_16u16",
    VPADD_16u16 <- "VPADD_16u16",
    VPADD_32u8     <-   "VPADD_32u8",

    VPSHUFD_256 <- "VPSHUFD_256",
    VPERMQ <- "VPERMQ",
    VPERMD <- "VPERMD",
    VPSRL_4u64 <- "VPSRL_4u64",
    VPADD_4u64 <- "VPADD_4u64",
    VPBLENDD_256 <- "VPBLEND_8u32",
    VPSLLV_4u64 <- "VPSLLV_4u64",
    VPSRLV_4u64 <- "VPSRLV_4u64",
    VPSRLDQ_256 <- "VPSRLDQ_256",
    VPSRLV_8u32 <- "VPSRLV_8u32",
    VPSRLV_16u16 <- "VPSRLV_16u16",
    VPSRL_16u16 <- "VPSRL_16u16",
    VPSRA_16u16 <- "VPSRA_16u16",
    VPSLL_16u16 <- "VPSLL_16u16",
    VPSRL_8u32 <- "VPSRL_8u32",
    VPSLL_8u32 <- "VPSLL_8u32",
    VPSLL_4u64 <- "VPSLL_4u64",
    VPINSR_8u16 <- "VPINSR_8u16",
    VPBROADCAST_2u128 <- "VPBROADCAST_2u128",
    VPACKUS_16u16 <- "VPACKUS_16u16",
    VPMADDUBSW_256 <- "VPMADDUBSW_256",
    VPERM2I128 <- "VPERM2I128",
    VPUNPCKL_4u64 <- "VPUNPCKL_4u64",
    VPUNPCKH_4u64 <- "VPUNPCKH_4u64",
    VMOVSLDUP_256 <- "VMOVSLDUP_256",
    VPBLENDW_256 <- "VPBLENDW_256",
    VPACKSS_16u16 <- "VPACKSS_16u16",
    MOVEMASK_32u8 <- "VPMOVMSKB_u256u32",

    VPUNPCKL_32u8  <-   "VPUNPCKL_32u8",
    VPSHUFB_128    <-   "VPSHUFB_128",
    VPCMPGT_16u16  <-   "VPCMPGT_16u16",
    VPUNPCKL_16u8  <-   "VPUNPCKL_16u8",
    VPINC_8u8      <-   "VPINC_8u8"

    from "specs/avx2.spec".
