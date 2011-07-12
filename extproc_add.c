/* Example of implementing an EXTPROC in OCaml - C stub */


#include <stdio.h>
#include <stdlib.h>
#include <caml/mlvalues.h>
#include <caml/callback.h>

int initialized = FALSE;

int add_two(int x, int y) {
  if (!initialized) {
    caml_startup();
  }
}

/* End of file */
