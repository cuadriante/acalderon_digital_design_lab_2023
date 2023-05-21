module plus_n #(parameter N=2)(input [N-1:0] i, input n, output [N-1:0] result);
	
	assign result = i + n; 

endmodule