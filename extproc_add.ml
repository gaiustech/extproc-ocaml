(* Example of implementing an EXTPROC in OCaml *)

(* The OCaml function to make available to SQL *)
let caml_add_two x y = x + y

(* Register this function with C *)
let () =
  Callback.register "caml_add_two" caml_add_two

(* End of file *)
