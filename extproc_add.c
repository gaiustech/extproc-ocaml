/* Example of implementing an EXTPROC in OCaml - C stub */

#include <stdio.h>
#include <stdlib.h>
#include <caml/mlvalues.h>
#include <caml/callback.h>
#include "extproc_add.h"

value* caml_add_two = NULL;

int add_two(int x, int y) {
  /* if the shared lib has been unloaded, or is being loaded for the first
     time, call the OCaml initialization */
  if (caml_add_two == NULL) {
    caml_startup(NULL); /* no argv */
    caml_add_two = caml_named_value("caml_add_two");
  }

  return Int_val(caml_callback2(*caml_add_two, Val_int(x), Val_int(y)));
}

/* End of file */
