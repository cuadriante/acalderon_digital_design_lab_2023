module InstructionMemory(input clk,rst,
								input [31:0] pc,
								output [31:0] ins);
  
	logic [7:0] rom [4000:0];
	logic [31:0] outaux;
	
	initial $readmemh("program.mem", rom);
	
	always_ff @(posedge clk or posedge rst) begin
	
		outaux = {rom[pc], rom[pc+1], rom[pc+2], rom[pc+3]};
	
	end

	assign ins = outaux;


endmodule
