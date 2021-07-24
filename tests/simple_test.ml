
let simple_literals =
  let i8 = 42u in
  Format.printf "%a\n" Stdint.Uint8.printer i8 ;
  let i16 = 42U in
  Format.printf "%a\n" Stdint.Uint16.printer i16 ;
  let s8 = 42s in
  Format.printf "%a\n" Stdint.Int8.printer s8 ;
  let s16 = 42S in
  Format.printf "%a\n" Stdint.Int16.printer s16

let hex_literals = 
  Format.printf "%a\n" Stdint.Uint16.printer_hex Stdint.Uint16.(0xDDAAU + 0xAADDU)
