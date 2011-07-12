-- SQL for OCaml EXTPROC demo

conn / as sysdba
create or replace library gaius.extproc_add as '/home/gaius/Projects/extproc-ocaml/libextproc_add.so';
/
grant execute on gaius.extproc_add to gaius;

conn gaius/abc123

create or replace function add_two(x in binary_integer, y in binary_integer) return binary_integer as language c name "add_two" library extproc_add;
/

select add_two(1,2) from dual;

-- end of file