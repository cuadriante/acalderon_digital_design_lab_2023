
module ConditionLogic(input logic [3:0] cond, aluFlags, input logic [1:0] flagW, 
						input logic pcs, regW, memW, clk, rst, output logic pcSrc, regWrite, memWrite);

	logic condEx;
	logic[3:0] aluFlagsAux;
	logic[1:0] flagWrite;
	
	ConditionCheck H0(cond, aluFlagsAux[3:2], aluFlagsAux[1:0], condEx);
	
	
	always @ (negedge clk) begin
		
		if (flagWrite[1] == 1) begin
			aluFlagsAux[3:2] = aluFlags[3:2];
		end
		
		if (flagWrite[0] == 1) begin
			aluFlagsAux[1:0] = aluFlags[1:0];
		end
		
	end
	
	
	
	assign pcSrc = condEx & pcs;
	assign regWrite = condEx & regW;
	assign memWrite = condEx & memW;
	assign flagWrite = {condEx & flagW[1], condEx & flagW[0]};

endmodule