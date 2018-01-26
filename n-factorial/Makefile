CC = nasm
CCFLAG = -f elf64
LD = ld
LDFLAG = -m elf_x86_64
TARGET = solve
OBJECT = $(TARGET).o

all: $(TARGET)

$(TARGET): $(OBJECT)
	$(LD) $(LDFLAG) -o $@ $?

$(OBJECT): $(TARGET).asm
	$(CC) $(CCFLAG) $?

.PHONY: clean

clean:
	$(RM) $(TARGET) $(OBJECT)
