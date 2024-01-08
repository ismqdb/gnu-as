# Makefile for 64-bit GAS program on Linux using as

AS = as
LD = ld

ASFLAGS = -g --64 --gstabs

TARGET = sample
SRC = sample.s
DEP1_TAR = dep1
DEP1 = $(DEP1_TAR).s

all: $(TARGET)

$(TARGET): $(SRC)
	$(AS) $(ASFLAGS) -o $(DEP1_TAR).o $(DEP1)
	$(AS) $(ASFLAGS) -o $(TARGET).o $(SRC)
	$(LD) -m elf_x86_64 -o $(TARGET) $(TARGET).o $(DEP1_TAR).o

.PHONY: clean run

clean:
	rm -f $(TARGET) $(TARGET).o $(DEP1_TAR).o

run: $(TARGET)
	./$(TARGET)
