module alu #(parameter N=4)(input [N-1:0] a, b, input[2:0] op, output [N-1:0] resultado, 
									 output cout, zero, neg, overflow);
	logic[N:0] rs, rr;
	logic[N-1:0] r_and, r_or, r_xor, r_shiftR, r_shiftL, resultado_s, resultado_r, resultado_aux;
	logic cout_aux, neg_aux, zero_aux, overflow_aux;
	logic cout_aux_s, neg_aux_s, zero_aux_s, overflow_aux_s;
	logic cout_aux_r, neg_aux_r, zero_aux_r, overflow_aux_r;
	logic [6:0] display_s, display_r;
	
	logic [N-1:0] aux;
	logic_alu LU(a, b, r_and, r_or, r_xor, r_shiftR, r_shiftL);
	arith_alu AUS(a, b, 0, resultado_s, cout_aux_s, neg_aux_s, zero_aux_s, overflow_aux_s, display_s);
	arith_alu AUR(a, b, 1, resultado_r, cout_aux_r, neg_aux_r, zero_aux_r, overflow_aux_r, display_r);

	always @(op) begin
	case (op)
		3'b000: // a + b
		 resultado_aux = resultado_s;
		 

		3'b001: // a - b
		 resultado_aux = resultado_r;
		
			
			
		3'b010:
			resultado_aux = r_and;

		3'b011:
			resultado_aux = r_or;

		3'b100:
			resultado_aux = r_xor;

		3'b101:
			resultado_aux = r_shiftR;

		3'b110:
			resultado_aux = r_shiftL;
	
		default: resultado_aux = 0;
	endcase
	end

	//assign resultado = 4'b0000;
	assign resultado = resultado_s;
	assign cout = cout_aux;
	assign neg = neg_aux;
	assign zero = zero_aux;
	assign overflow = overflow_aux;
	
endmodule 
