.SUFFIXES .erl .beam .yrl

.erl.beam:
	erlc -W $<

MODS = ex ex_lid unit_test

all:	${MODS:%=%.beam} ex ex_drv.so
		@erl -noshell -s unit_test start

ex: ex.c erl_comm.c ex_driver.c
	gcc -o ex ex.c erl_comm.c ex_driver.c

ex_drv.so: ex_lid.c ex.c
	gcc -arch i386 -I /