module logic_alu#(parameter N=4)(input [N-1:0] a, b, 
											output [N-1:0] r_and, r_or, r_xor, r_shiftR, r_shiftL);
	
	and_gate u1(a, b, r_and);
	or_gate u2(a, b, r_or);
	xor_gate u3(a, b, r_xor);
	shiftR_gate u4(a, r_shiftR);
	shiftL_gate u5(a, r_shiftL);
	
endmodule

module and_gate#(parameter N=4)(input a, b, output r_and_gate);
	assign r_and_gate = a&&b;
endmodule

module or_gate#(parameter N=4)(input a, b, output r_or_gate);
	assign r_or_gate = a|b;
endmodule

module xor_gate#(parameter N=4)(input a, b, output r_xor_gate);
	assign r_xor_gate = a^b;
endmodule

module shiftR_gate#(parameter N=4)(input a, b, output r_shiftR_gate);
	assign r_shiftR_gate = a>>b;
endmodule

module shiftL_gate#(parameter N=4)(input a, b, output r_shiftL_gate);
	assign r_shiftL_gate = a<<b;
endmodule
