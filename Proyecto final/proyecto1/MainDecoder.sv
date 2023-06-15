
module MainDecoder(input logic [1:0] op, input logic func5, func0, 
					output logic branch, memtoReg, memW, aluSrc, regW, aluOp,
					output logic [1:0] immSrc,  regSrc);
	
	assign branch = (op == 2'b10);
	assign memtoReg = (op == 2'b01) & (func0 == 1'b1);
	assign memW = (op == 2'b01) & (func0 == 1'b0);
	assign aluSrc = !((op == 00) & (func5 == 1'b0));
	assign immSrc[1] = 0;
	assign immSrc[0] = (op == 2'b10)|(op == 2'b01);
	assign regW = !( ((op == 2'b01)&(func0 == 0)) | (op == 2'b10) );
	assign regSrc[1] = ((op == 2'b01)&(func0 == 0));
	assign regSrc[0] = (op == 2'b10);
	assign aluOp = (op == 2'b00)|(op == 2'b10);

endmodule


