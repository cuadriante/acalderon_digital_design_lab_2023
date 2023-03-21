module alu #(parameter N=4)(input [N-1:0] a, b, input[3:0] selec, output [N-1:0] resultado, 
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
		if(selec == 0001)
			N_aux = signo;
		else
			N_aux = 0;
		end
	assign N = N_aux;
endmodule

module banderaZ#(parameter N=4)(input [N:0] a, b, c,d,e, f, g, input [3:0] ss, output  flag);
logic aux;

always @(ss) begin
	case (ss)
		0:
			aux = !(a|a);

		1:
			aux = !(b|b);
			
		2:
			aux = !(c|c);

		3:
			aux = !(d|d);

			
		4:
			aux = !(e|e);

		5:
			aux = !(f|f);

		6:
			aux = !(g|g);

	
		default: aux = 0;
	endcase
	
end

assign flag = aux;	


endmodule

module banderaC(input rs, input [3:0] s, output C);
	logic aux;
	always @ (rs, s) begin
		if (s == 0000) begin
			aux = rs;
		end
		else begin 
			aux = 0;
		end
	end
	assign C = aux;
endmodule

module banderaV();
endmodule 