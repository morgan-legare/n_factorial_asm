CC = gcc
AS = nasm
DEBUG = -g3 -O0
ARCH = -m32
PIE = -no-pie -fno-pie
STACK = -z noexecstack
CFLAGS = $(ARCH) $(PIE) $(DEBUG) -Wall
LDFLAGS = $(ARCH) $(PIE) $(STACK)
ASFLAGS = -g -f elf32 -F dwarf

PROG = n_fact

all: $(PROG)

$(PROG): $(PROG).o
	$(CC) $(LDFLAGS) -o $@ $^

$(PROG).o: $(PROG).asm
	$(AS) $(ASFLAGS) -l $(PROG).lst $<

clean:
	rm -f $(PROG) *.s *.o *.lst *~ \#*

