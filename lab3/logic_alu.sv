module logic_alu#(parameter N=4)(input [N-1:0] a, b, 
											output [N-1:0] r_and, r_or, r_xor, r_shiftR, r_shiftL, r_not);
	
	and_gate u1(a, b, r_and);
	or_gate u2(a, b, r_or);
	xor_gate u3(a, b, r_xor);
	shiftR_gate u4(a, b, r_shiftR);
	shiftL_gate u5(a, b, r_shiftL);
	not_gate u6(a, b, r_not);
endmodule

module and_gate#(parameter N=4)(input [N-1:0] a, b, output [N-1:0] r_and_gate);
  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin: nbit_and
      and t(r_and_gate[i], a[i], b[i]);
    end
  endgenerate 
endmodule




module or_gate#(parameter N=4)(input [N-1:0] a, b, output [N-1:0] r_or_gate);
	genvar i;
   generate
    for (i = 0; i < N; i = i + 1) begin: nbit_or
      or t(r_or_gate[i], a[i], b[i]);
    end
  endgenerate 
endmodule

module xor_gate#(parameter N=4)(input [N-1:0] a, b, output [N-1:0] r_xor_gate);
	genvar i;
	generate
    for (i = 0; i < N; i = i + 1) begin: nbit_xor
      or t(r_xor_gate[i], a[i], b[i]);
    end
  endgenerate 
endmodule

module not_gate#(parameter N=4)(input [N-1:0] a, b, output [N-1:0] r_not_gate);
    genvar i;
   generate
    for (i = 0; i < N; i = i + 1) begin: nbit_not
      not t(r_not_gate[i], a[i]);
    end
  endgenerate 
endmodule

module shiftR_gate#(parameter N=4)(input [N-1:0] a, b, output [N-1:0] r_shiftR_gate);
	genvar i;
	assign r_shiftR_gate[N-1] = 0;
	generate
    for (i = 0; i < N - 1; i = i + 1) begin: nbit_shiftR
			assign r_shiftR_gate[N-2-i] = a[N-1-i];    
	 end
  endgenerate 
endmodule

module shiftL_gate#(parameter N=4)(input [N-1:0] a, b, output [N-1:0] r_shiftL_gate);
		genvar i;
		assign r_shiftL_gate[0] = 0;
		generate
		for (i = 1; i < N; i = i + 1) begin: nbit_shiftL
			assign r_shiftL_gate[i] = a[i-1];
		end
		endgenerate 
endmodule


