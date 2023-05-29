obj-m += ili.o
ili-objs += ili_main.o ili_utils.o ili_handler.o

all: ili.ko inst_test1 inst_test2 inst_test3 inst_test4 inst_test5

ili.ko:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) clean
	rm -f bad_inst

inst_test1: test1/inst_test.asm
	as -o $@.o $^
	ld -o $@ $@.o

inst_test2: test2/inst_test.asm
	as -o $@.o $^
	ld -o $@ $@.o

inst_test3: test3/inst_test.asm
	as -o $@.o $^
	ld -o $@ $@.o

inst_test4: test4/inst_test.asm
	as -o $@.o $^
	ld -o $@ $@.o

inst_test5: test5/inst_test.asm
	as -o $@.o $^
	ld -o $@ $@.o

$(KBUILD_EXTMOD)/ili_handler.o: ili_handler.asm
	as -o $@ $^
$(KBUILD_EXTMOD)/ili_handler.o: ili_handler.asm
	as -o $@ $^
