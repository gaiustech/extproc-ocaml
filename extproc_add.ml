(* Example of implementing an EXTPROC in OCaml *)

(* The OCaml function to make available to SQL *)
let caml_add_ints x y = x + y

(* Register this function with C *)
let () =
  Callback.register "caml_add_ints" caml_add_ints

(* End of file *)
