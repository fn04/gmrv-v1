
module memory_ram
	#(
		parameter RAM_ORIGIN  = 32'h400,		// RAM Memory Map
		parameter RAM_LENGTH  = 32'h100,		// RAM size 32 KB
		parameter MEM_BIT		 = 8,
		parameter MEM_SIZE	 = 256
	)
	(
	output [31:0]		oRAM_DATA, 			// output Data
	input  [31:0]		iRAM_DATA, 			// input Data
	input					iRAM_CE,     			// input Chip Enable
	input 				iRAM_RD, 					// input Read Enable
	input 				iRAM_WR, 					// input Write Enable
	input [31:0]			iRAM_ADDR, 		// input Address
	input					iRAM_RST,
	input					iRAM_CLK					// input clock
	);

	reg  [31:0] mem [0:MEM_SIZE-1];	//memory size 256*4 bytes = 1KB
	wire [MEM_BIT-1:0]  tmp_addr;
	wire [31:0] tmp_data;
	wire 			is_mem_valid;
	
	assign is_mem_valid 	= ((iRAM_ADDR >= RAM_ORIGIN) & (iRAM_ADDR < RAM_ORIGIN + RAM_LENGTH)) ? 1 : 0;
	assign tmp_addr 		= (iRAM_ADDR - RAM_ORIGIN) >> 2;
	assign tmp_data 		= (iRAM_CE && iRAM_RD) ? mem[tmp_addr] : 32'h0;
	assign oRAM_DATA 		= (is_mem_valid == 1) ? tmp_data : 32'h0;

	initial begin
		$readmemh("rtl/memory_ram_init.hex", mem, 0, MEM_SIZE-1);
	end

	always @(posedge iRAM_CLK or negedge iRAM_RST)
	begin
		//$display("RAM -> CE: %b, RD: %b, WR: %b, iRAM_ADDR: 0x%x, oRAM_DATA: 0x%x, iRAM_DATA: 0x%x ismemvalid = 0x%x",iRAM_CE, iRAM_RD, iRAM_WR, iRAM_ADDR, oRAM_DATA, iRAM_DATA, is_mem_valid);

		if(iRAM_WR==1)
		begin
			if(is_mem_valid==1)
			begin
				mem[tmp_addr] = iRAM_DATA;
				$writememh("/home/fana/main/riscv1/rtl/memory_ram_init.hex", mem);
				//$display("mem : 0x%x", mem[tmp_addr]);
			end
		end
	end

	//  always @(posedge iRAM_CLK or negedge iRAM_RST) begin
    //     if (iRAM_WR)
    //         mem[tmp_addr] <= iRAM_DATA; // Penulisan data ke memori
    // end

    // always @(posedge iRAM_CLK or negedge iRAM_RST) begin
    //     oram_data <= mem[tmp_addr]; // Pembacaan data dari memori
    // end

endmodule


