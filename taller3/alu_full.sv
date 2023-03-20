module alu #(parameter N=4)(input [N-1:0] a, b, input[3:0] operacion, output [N-1:0] resultado, 
									 output zero, neg, carry);
	logic[N:0] rs, rr;
	logic[N-1:0] r_and, r_or, r_xor, r_shiftR, r_shiftL;
	
	arith_alu AU(a, b, rs, rr);
	logic_alu LU(a, b, r_and, r_or, r_xor, r_shiftR, r_shiftL);
	multiplexor mp(rs, rr, r_and, r_or, r_xor, r_shiftR, r_shiftL, selec, r);
	
	assign result = r;
	
endmodule 

module banderaN(input signo, input [3:0] selec, output N);
	logic N_aux;
	always @ (selec) begin
		if(selec = 0001)
			N_aux = signo;
		else
			N_aux = 0;
		end
	assign N = N_aux;
endmodule

module banderaZ#(parameter N=4)(input [N-1:0] i0, i1, i2, i3, i4, i5, i6, input[3:0] s, output [N-1:0] Z);
	input[3:0] Z_aux;
	always @(s) begin 
		case (s)
			0:
				Z_aux = !(i0|i0);
			1:
				Z_aux = !(i1|i1);
			2:
				Z_aux = !(i2|i2);
			3:
				Z_aux = !(i3|i3);
			4:
				Z_aux = !(i4|i4);
			5:
				Z_aux = !(i5|i5);
			6:
				Z_aux = !(i6|i6);
			default: 
				Z_aux = 0;
		endcase
	end
	assign Z = Z_aux;
endmodule

module banderaC(input rs, input [3:0] s, output C);
	logic C_aux;
	always @ (rs, s) begin
		if (s == 0000) begin
			C_aux = rs;
		end
		else begin 
			c_aux = 0;
		end
	end
	assign C = C_aux;
endmodule

module banderaV();
endmodule 