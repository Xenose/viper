
NAME=binary

CC=clang
INCLUDE=-I./include
LIBS=-lm -lc -lvulkan -lglfw -lGL -lGLEW -llua
 
O_DEBUG_FLAGS=-g3 -O0
DEBUG_FLAGS=-g3 -rdynamic -O0

ODIR="tmp"
SDIR="source"

SOURCES=$(wildcard source/*/*/*/*.c source/*/*/*.c source/*/*.c source/*.c)
OBJECTS=$(SOURCES:c=o)

## compiles each file into there o-file
%.o: %.c
	$(CC) -S -mllvm --x86-asm-syntax=intel $< ${INCLUDE} -o "tmp/assembly/$(subst /,_,"$@.asm")"
	$(CC) ${O_DEBUG_FLAGS} ${INCLUDE}  -c $< -o "tmp/$(subst /,_,"$@.o")"

viper: $(OBJECTS)
	$(CC) ${DEBUG_FLAGS} $(LIBS) ${INCLUDE}  tmp/*.o source_test.c -o "build/$(NAME)"
	$(CC) ${DEBUG_FLAGS} $(LIBS) ${INCLUDE}  tmp/*.o tests/source.c -o "build/test_$(NAME)"

test: $(OBJECTS)
	$(CC) ${DEBUG_FLAGS} $(LIBS) ${INCLUDE}  tmp/*.o source_test.c -o "build/$(NAME)"

clean:
	rm -f tmp/.o
	rm -f tmp/assembly/*
	rm -f tmp/*.o
