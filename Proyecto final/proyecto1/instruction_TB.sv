

module instruction_TB();
	
	logic clk, rst;
	logic [31:0] pc, ins;
	InstructionMemory IM(clk,rst,pc,ins);
	initial begin
	pc = 0;
	rst = 0;
	#40
	rst = 1;
	#40
	rst = 0;
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