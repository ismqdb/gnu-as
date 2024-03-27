# Makefile for GNU Assembly project

# Compiler and linker
CC = gcc

# Flags for the compiler
CFLAGS = -g -O0 -no-pie -fno-pie -lc -static 

# Source files
SRC_FILES = sample.s dep1.s dep1.c

# Object files
OBJ_FILES = $(SRC_FILES:.s=.o)

# Executable name
EXECUTABLE = sample

# Default target
all: $(EXECUTABLE)

# Rule to assemble source files into object files
%.o: %.s
	$(CC) $(CFLAGS) -c -o $@ $<

# Rule to link object files into the executable
$(EXECUTABLE): $(OBJ_FILES)
	$(CC) $(CFLAGS) -o $@ $^

# Clean target to remove object files and the executable
clean:
	rm -f $(OBJ_FILES) $(EXECUTABLE)