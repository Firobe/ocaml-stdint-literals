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
  let patterns = Converter.[
      ('u', u8);
      ('U', u16);
      ('i', u32);
      ('I', u64);
      ('w', u128);
      ('s', s8);
      ('S', s16);
      ('W', s128)
    ]

  let rule_of_pattern (ch, conv) =
    Ppxlib.Context_free.Rule.(constant Constant_kind.Integer ch (rewriter conv))

  let all = List.map rule_of_pattern patterns
end

let () = Driver.register_transformation ~rules:Rule.all "Constant rewriting"
