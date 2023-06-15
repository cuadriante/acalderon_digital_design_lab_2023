module plus_n #(parameter N=32)(input [N-1:0] i, input [N-1:0] n, output [N-1:0] result);
	
	assign result = i + n; 

endmodule