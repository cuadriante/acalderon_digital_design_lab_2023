
`timescale 1 ps / 1 ps
module rom_TB();
	
	logic aclr, clk;
	logic [15:0] address;
	logic [7:0] q;
	RomDataMem ROM(aclr,
	address,
	clk,
	q);

	initial begin
		address = 0;
		aclr = 0;
		clk = 0;
		#40
		aclr = 1;
		#40
		aclr = 0;
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		address = 1;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
	
	end
endmodule