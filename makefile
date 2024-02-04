# Makefile for GNU Assembly project

# Compiler and linker
AS = as
LD = ld

# Flags for the assembler
ASFLAGS = -g --64 --gstabs

# Source files
SRC_FILES = sample.s dep1.s

# Object files
OBJ_FILES = $(SRC_FILES:.s=.o)

# Executable name
EXECUTABLE = sample

# Default target
all: $(EXECUTABLE)

# Rule to assemble source files into object files
%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

# Rule to link object files into the executable
$(EXECUTABLE): $(OBJ_FILES)
	$(LD) -no-pie -fno-pie -static -lc -shared -o $@ $^

# Clean target to remove object files and the executable
clean:
	rm -f $(OBJ_FILES) $(EXECUTABLE)