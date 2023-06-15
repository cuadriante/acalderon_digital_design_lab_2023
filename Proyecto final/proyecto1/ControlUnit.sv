
module ControlUnit(input logic clk, rst, input logic [3:0] cond, aluFlags, rd,
						input logic [1:0] op, input logic [5:0] funct, 
						output logic pcSrc, regWrite, memWrite, memtoReg,
						aluSrc, output logic [1:0] immSrc, regSrc, aluControl);
	
	logic [1:0] flagW;
	logic pcs, regW, memW;
	
	Decoder D0(op, funct, rd, 
					flagW, immSrc, regSrc, aluControl, pcs, regW, memW, memtoReg,
					aluSrc);
	ConditionLogic C1(cond, aluFlags, flagW, 
						pcs, regW, memW, clk, rst, pcSrc, regWrite, memWrite);


endmodule