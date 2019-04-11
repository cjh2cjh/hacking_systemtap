# table of content
* [generate](#generate)
* [compile](#compile)
* [analyze](#analyze)

## generate
* generated files are under '/tmp/stapXXXXXX/'
* generated files are produced by 'translate_pass' in 
  'translate.cxx', includes:
  * Makefile
  * stap_XXXXX_aux_0.c
  * stap_XXXXX_src.c
  * stapconf_xxxxxxxxxxxxxxxxxxxx_xxx.h
  * stap-symbols.h

## compile
* use 'kbuild' to compile the module
* generated files after compiled, includes:
  * stap_XXXXX.ko, this is the target module file
  * Module.symvers, what?
  * stap_XXXXX.mod.c
  * modules.order, what?
  * built-in.o
  * stap_XXXXX_src.i, the make target?

## analyze
* init/exit entry of the module specified by 'module_init'
  and 'module_exit'
* 'module_init' and 'module_exit' are defined in 
  'runtime/linux/uprobes/uprobes.c' and
  'runtime/linux/uprobes2/uprobes.c', 
  if macro 'UTRACE_ACTION_RESUME' was not define, we use
  'runtime/linux/uprobes2/uprobes.c', otherwise, we use
  'runtime/linux/uprobes/uprobes.c'.

