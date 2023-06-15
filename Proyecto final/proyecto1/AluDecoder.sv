
module AluDecoder(input logic aluOp, func0, input logic [3:0] func41, output logic [1:0] aluControl, flagW);

	assign aluControl[1] = (aluOp == 1'b1)&((func41 == 4'b0000)|(func41 == 4'b1100));
	assign aluControl[0] = (aluOp == 1'b1)&((func41 == 4'b0010)|(func41 == 4'b1100)|func41 == 4'b1010);
	assign flagW[1] = (func0 == 1'b1);
	assign flagW[0] = ((aluOp == 1'b1)&(func41 == 4'b0100)&(func0 == 1'b1))|
						((aluOp == 1'b1)&(func41 == 4'b0010)&(func0 == 1'b1));

endmodule