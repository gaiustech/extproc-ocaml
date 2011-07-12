# Makefile for OCaml EXTPROC example

all:	test.c libextproc_add.so
	gcc test.c -o test -L. -lextproc_add -L`ocamlopt -where` -ldl -lcamlrun -lcurses -lm

libextproc_add.so:	c_extproc_add.o caml_extproc_add.o
	gcc -shared -Wl,-E -o libextproc_add.so c_extproc_add.o caml_extproc_add.o -L`ocamlopt -where` -ldl -lcamlrun -lcurses -lm

c_extproc_add.o:	extproc_add.c
	gcc -g3 -o c_extproc_add.o -I`ocamlopt -where` -c extproc_add.c

caml_extproc_add.o:	extproc_add.ml
	ocamlc -output-obj -o caml_extproc_add.o extproc_add.ml
clean:
	rm *.o *.cm* test *.so

# End of file
