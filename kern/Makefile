
TARGET  = kernel.elf
XCC     = gcc
AS      = as
LD      = ld
CFLAGS  = -c -fPIC -ffreestanding -Wall -I. -I../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs: always generate a complete stack frame

LDFLAGS = -init main -Map $(TARGET:.elf=.map) -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib
LIBS = -lbufio -lbwio -lstdlib -lgcc

SRCS = $(wildcard *.c)
ASMS = $(SRCS:.c=.s)
OBJECTS = $(ASMS:.s=.o)


all: $(TARGET)

%.o: %.c
	$(XCC) -S $(CFLAGS) $<
	$(AS) $(ASFLAGS) -o $@ $(@:.o=.s)

$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $(OBJECTS) $(LIBS)

install:
	chmod a+r $(TARGET)
	cp $(TARGET) /u/cs452/tftp/ARM/nillerbr

clean:
	$(RM) -f $(TARGET) *.s *.o $(TARGET:.elf=.map)

