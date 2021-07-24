open Stdint

let simple_literals =
  let u8 = 42u in
  let u16 = 42U in
  let u32 = 42i in
  let u64 = 42I in
  let u128 = 42w in
  let s8 = 42s in
  let s16 = 42S in
  let s32 = 42l in
  let s64 = 42L in
  let s128 = 42W in
  Format.printf "%a\n" Uint8.printer u8 ;
  Format.printf "%a\n" Uint16.printer u16 ;
  Format.printf "%a\n" Uint32.printer u32 ;
  Format.printf "%a\n" Uint64.printer u64 ;
  Format.printf "%a\n" Uint128.printer u128 ;
  Format.printf "%a\n" Int8.printer s8 ;
  Format.printf "%a\n" Int16.printer s16 ;
  Format.printf "%a\n" Int32.printer s32 ;
  Format.printf "%a\n" Int64.printer s64 ;
  Format.printf "%a\n" Int128.printer s128

let hex_literals = 
  Format.printf "%a\n" Uint16.printer_hex Uint16.(0xDDAAU + 0xAADDU)
