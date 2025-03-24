ifndef ICARUS
    ICARUS = iverilog -Wall
endif

#RTLS = darksimv.v ../rtl/darksocv.v ../rtl/darkuart.v ../rtl/darkriscv.v ../rtl/darkpll.v
RTLS = gmrv.v 
#../rtl/socriscv32.v ../rtl/memory_ram.v ../rtl/memory_rom.v 
INCS = /home/fana/main/riscv1/rtl/conf.vh
XSIM = gmrv #asline darksoc
VCDS = gmrv.vcd
VVPS = gmrv.vvp

.PRECIOUS: $(VCDS)	# Do not delete the trace file if simulation is aborted
.PHONY: $(VCDS)		# Always run the simulation

#SRCS = ../src/darksocv.mem
SRCS = ../rtl/memory_rom_init.hex

DEPS = $(SRCS) $(RTLS) $(INCS)

all: $(VCDS)
	@echo simulation okee.

clean:
	-rm $(VCDS) $(XSIM) $(VVPS)

$(VCDS): $(XSIM)
	./$(XSIM)


$(XSIM): $(DEPS)
	$(ICARUS) -I ../rtl -o $(XSIM) $(RTLS)
