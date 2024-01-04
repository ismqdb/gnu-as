# Makefile for 64-bit GAS program on Linux using as

AS = as
LD = ld

ASFLAGS = -g --64 --gstabs

TARGET = sample
SRC = sample.s

all: $(TARGET)

$(TARGET): $(SRC)
	$(AS) $(ASFLAGS) -o $(TARGET).o $(SRC)
	$(LD) -m elf_x86_64 -o $(TARGET) $(TARGET).o

.PHONY: clean run

clean:
	rm -f $(TARGET) $(TARGET).o

run: $(TARGET)
	./$(TARGET)
