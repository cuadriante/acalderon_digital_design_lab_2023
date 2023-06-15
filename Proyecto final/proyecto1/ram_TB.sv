
`timescale 1 ps / 1 ps
module ram_TB();
	logic aclr_a, aclr_b;
	logic	[15:0]  address_a;
	logic	[15:0]  address_b;
	logic	  clk;
	logic	  clock_b;
	logic	[7:0]  data_a;
	logic	[7:0]  data_b;
	logic	  wren_a;
	logic	  wren_b;
	logic	[7:0]  q_a;
	logic	[7:0]  q_b;
	RamDataMem DATAMEM(
	aclr_a,
	aclr_b,
	address_a,
	address_b,
	clk,
	clock_b,
	data_a,
	data_b,
	wren_a,
	wren_b,
	q_a,
	q_b);

	initial begin
		address_a = 0;
		aclr_a = 0;
		clk = 0;
		#200
		aclr_a = 1;
		#200
		aclr_a = 0;
		#200
		clk = 0;
		#200
		clk = 1;
		#200
		clk = 0;
		address_a = 1 ;
		#200
		clk = 1;
		#200
		clk = 0;
	end
endmodule