
module Decoder(input logic [1:0] op, input logic [5:0] funct, input logic [3:0] Rd, 
					output logic [1:0] flagW, immSrc, regSrc, aluControl, output logic pcs, regW, memW, memtoReg,
					aluSrc);
	
	logic branch, aluOp;	
	MainDecoder M0(op, funct[5], funct[0], 
					branch, memtoReg, memW, aluSrc, regW, aluOp,
					immSrc,  regSrc);
	
	PCLogic L0(Rd, branch, regW, pcs);
	AluDecoder A0(aluOp, funct[0], funct[4:1], aluControl, flagW);
	


endmodule