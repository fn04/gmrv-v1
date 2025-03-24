SHELL := /bin/bash

ifndef HOST_CC
    HOST_CC = gcc
    HOST_CFLAGS = -Wall -Wno-incompatible-library-redeclaration -I../common -O0
endif

ifndef CROSS
    ARCH = rv32i

    ABI = ilp32e

    # CROSS = riscv64-linux-gnu
    CROSS = riscv64-unknown-elf
    
    CCPATH = /usr/bin

    # HARVARD = 1
endif

ifndef BUILD
    BUILD = $(shell date -R)
endif

ifndef DARKLIBC
    DARKLIBC = /home/fana/main/riscv1/src/darklibc
endif

    CC = $(CCPATH)/$(CROSS)-gcc
    AS = $(CCPATH)/$(CROSS)-as
    LD = $(CCPATH)/$(CROSS)-ld
    AR = $(CCPATH)/$(CROSS)-ar
    RL = $(CCPATH)/$(CROSS)-ranlib
    OC = $(CCPATH)/$(CROSS)-objcopy
    OD = $(CCPATH)/$(CROSS)-objdump
   CPP = $(CCPATH)/$(CROSS)-cpp

CCFLAGS = -Wall -fcommon -ffreestanding -O1
CCFLAGS += -march=$(ARCH) -mabi=$(ABI) -I$(DARKLIBC)/include
CCFLAGS += -D__RISCV__ -DBUILD="\"$(BUILD)\"" -DARCH="\"$(ARCH)\""
#CCFLAGS += -DSMALL # enable this to make FW smaller!
ASFLAGS = -march=$(ARCH)
ARFLAGS = -rcs
LDFLAGS = -Map=$(PROJ).map -m elf32lriscv -static -gc-sections  --entry=main -Ttext=0 -T$(PROJ).ld
LDLIBS  = $(DARKLIBC)/darklibc.a
CPFLAGS = -P 

CCFLAGS += -mcmodel=medany -mexplicit-relocs # relocable clode

ifdef HARVARD
	CPFLAGS +=  -DHARVARD=1
endif

ifdef SMALL
    CCFLAGS += -DSMALL
endif

OCFLAGS = -O binary # --reverse-bytes=4 # workaround for darkriscv big-endian blockrams
ODFLAGS = -D

APP = integral
#APP = permutasi

PROJ = cobaduls
OBJS = $(PROJ).o
ASMS = $(PROJ).s
SRCS = $(PROJ).c
LINK = $(PROJ).ld
ELEP = $(PROJ).elf
LIBS = $(PROJ).a $(DARKLIBC)/darklibc.a 
DEPS = $(SRCS) $(ASMS) $(OBJS) $(LIBS) $(PROJ).lds $(PROJ).ld  $(DARKLIBC)/darklibc.a

TARGETS1 = $(PROJ).a
TARGETS2 = $(PROJ).bin
TARGETS3 = $(PROJ).mem
TARGETS4 = $(PROJ).o
TARGETS5 = $(PROJ).out
TARGETSa = $(PROJ).rom.mem
TARGETSb = $(PROJ).ram.mem

.PHONY: all

all: $(ASMS) $(TARGETS1) $(TARGETS2) $(TARGETSa) $(TARGETSb) $(TARGETS4) $(TARGETS3) $(LIBS) $(PROJ).a $(LINK)
#	@echo sources ok for $(TARGETS).

res:
	-rm -f $(ASMS) $(OBJS) $(PROJ).{S,s,bin,lst,map,ram,rom,x86,text,data,bin,ld,o,mem,rom.mem,ram.mem,a,out,elf} $(PROJ)_uart.bin

clean: 

%.o: %.s Makefile
	$(AS) $(ASFLAGS) -c $< -o $@

%.s: %.c Makefile
	$(CC) $(CCFLAGS) -S $< -o $@

$(PROJ).a: $(OBJS) 
	$(AR) $(ARFLAGS) $@ $(OBJS)
	$(RL) $@
	
$(PROJ).out: $(OBJS) $(PROJ).ld $(LIBS)
	$(RL) $(LDLIBS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)
	$(OD) $(ODFLAGS) $@ > $(PROJ).S

$(PROJ).ld: $(PROJ).lds Makefile
	$(CPP) $(CPFLAGS) $(PROJ).lds $(PROJ).ld

$(PROJ).bin: $(PROJ).out
	$(OC) $(OCFLAGS) $< $(PROJ).bin

$(ELEP): $(PROJ).out
	$(LD) $(LDFLAGS) -o $@ $<

# Rule untuk menampilkan informasi dari file ELF
objdumps: $(ELEP)
	$(OD) $(ODFLAGS) $(ELEP)

$(PROJ).mem: $(PROJ).out
	hexdump -ve '1/4 "%08x\n"' $(PROJ).bin > $@ 
	wc -l $@
	@echo mem ok.

$(PROJ).ram.mem: $(PROJ).out
	$(OC) $(OCFLAGS) $< $(PROJ).data --only-section .*data*
	hexdump -ve '1/4 "%08x\n"' $(PROJ).data > $@
	#xxd -p -c 4 -g 4 $< > $@
	wc -l $@
	@echo ram ok.

$(PROJ).rom.mem: $(PROJ).out
	$(OC) $(OCFLAGS) $< $(PROJ).text --only-section .*text* 
	hexdump -ve '1/4 "%08x\n"' $(PROJ).text > $@
	#xxd -p -c 4 -g 4 $< > $@
	wc -l $@
	@echo rom ok.
