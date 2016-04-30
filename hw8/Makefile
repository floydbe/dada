all:
	gcc -m32 -o infect infect.c
	./infect target_code.bin infected_target_code.bin
	objdump -D infected_target_code.bin > infected_target_code.obj
call:
	gcc -m32 -o infect infect_with_call.c
virus:
	gcc -m32 -S virus.c
obj:
	objdump -D target_code.bin > target_code.obj
	objdump -D infected_target_code.bin > infected_target_code.obj
