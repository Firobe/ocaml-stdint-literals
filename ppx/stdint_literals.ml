open Ppxlib

let rewriter kind loc s =
  let number = Ast_builder.Default.pexp_constant ~loc
      (Parsetree.Pconst_integer (s, None)) in
  [%expr [%e (kind loc)] [%e number]]

module Converter = struct
  let u8 loc = [%expr Stdint.Uint8.of_int]
  let u16 loc = [%expr Stdint.Uint16.of_int]
  let u32 loc = [%expr Stdint.Uint32.of_int]
  let u64 loc = [%expr Stdint.Uint64.of_int]
  let u128 loc = [%expr Stdint.Uint128.of_int]
  let s8 loc = [%expr Stdint.Int8.of_int]
  let s16 loc = [%expr Stdint.Int16.of_int]
  let s128 loc = [%expr Stdint.Int128.of_int]
end

module Rule = struct
  open Ppxlib.Context_free.Rule

  let u8 = constant Constant_kind.Integer 'u' (rewriter Converter.u8)
  let u16 = constant Constant_kind.Integer 'U' (rewriter Converter.u16)
  let u32 = constant Constant_kind.Integer 'i' (rewriter Converter.u32)
  let u64 = constant Constant_kind.Integer 'I' (rewriter Converter.u64)
  let u128 = constant Constant_kind.Integer 'w' (rewriter Converter.u128)
  let s8 = constant Constant_kind.Integer 's' (rewriter Converter.s8)
  let s16 = constant Constant_kind.Integer 'S' (rewriter Converter.s16)
  let s128 = constant Constant_kind.Integer 'W' (rewriter Converter.s128)

  let all = [u8; u16; u32; u64; u128; s8; s16; s128]
end

let () = Driver.register_transformation ~rules:Rule.all "Constant rewriting"
