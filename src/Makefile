
# Makefile for busy-wait IO library
#
XCC = gcc
AS	= as
AR	= ar
CFLAGS  = -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings
# -msoft-float: use software for floating point

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs-32: always create a complete stack frame

ARFLAGS = rcs
LIBDIR= ../libs

BWIO = bwio.a
BWIO_DEP = bwio.o

BUFIO = bufio.a
BUFIO_DEP = iobuffer.o

all: $(BWIO) $(BUFIO) 

%.o: %.c
	$(XCC) -S $(CFLAGS) $<
	$(AS) $(ASFLAGS) -o $@ $(@:.o=.s)

$(BWIO): $(BWIO_DEP)
	$(AR) $(ARFLAGS) lib$@ $^

$(BUFIO): $(BUFIO_DEP)
	$(AR) $(ARFLAGS) lib$@ $^

clean:
	$(RM) -f *.s *.a *.o