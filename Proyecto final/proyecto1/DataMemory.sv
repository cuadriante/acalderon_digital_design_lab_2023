

module DataMemory(input clk,rst,
						input [13:0] address,
						input writeEnable,
						input [31:0] writeData,
						output [31:0] data);
						
	logic [31:0] ram [2047:0];
	logic [31:0] aux;
	
	
	initial $readmemb("ram.mem",ram);
	
	

	always @ (negedge clk)
	begin
		if(writeEnable)
			ram[address] = writeData;
		
	
	end
	
	always @ (posedge clk)
	begin
		aux = ram[address];
		
	
	end
	
	assign data = aux;



endmodule
