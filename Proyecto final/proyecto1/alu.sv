module alu #(parameter N=32)(input [N-1:0] a, b, input logic[1:0] aluControl, output [N-1:0] resultado, 
									 output cout, zero, neg, overflow);
	logic[N:0] rs, rr;
	reg[N-1:0] r_and, r_or, r_xor, r_shiftR, r_not, r_shiftL, resultado_s, resultado_r, resultado_aux;
	
	logic [N-1:0] shiftR1;
	logic [N-1:0] shiftR2;
	logic cout_aux , neg_aux, zero_aux, overflow_aux;
	logic cout_aux_s, neg_aux_s, zero_aux_s, overflow_aux_s;
	logic cout_aux_r, neg_aux_r, zero_aux_r, overflow_aux_r;
		
	
	
	logic [N-1:0] aux;
	logic_alu LU(a, b, r_and, r_or, r_xor, r_shiftR, r_shiftL, r_not);
	arith_alu AUS(a, b, 0, resultado_s, cout_aux_s, neg_aux_s, zero_aux_s, overflow_aux_s, shiftR1);
	arith_alu AUR(a, b, 1, resultado_r, cout_aux_r, neg_aux_r, zero_aux_r, overflow_aux_r, shiftR2);
	
	
	always @* begin
	case (aluControl)
		2'b00:
			resultado_aux = resultado_s;
		2'b01:
			resultado_aux = resultado_r;
		2'b10:
			resultado_aux = r_and;
		2'b11:
			resultado_aux = resultado_s;
	
		default: resultado_aux = 32'd0;
	endcase
	end
	
	
	always_comb begin
		
		if (aluControl == 2'b00) begin
			cout_aux = cout_aux_s;
			neg_aux = neg_aux_s;
			zero_aux = zero_aux_s;
			overflow_aux = overflow_aux_s;
			
		end else if (aluControl == 2'b01) begin
			cout_aux = cout_aux_r;
			neg_aux = neg_aux_r;
			zero_aux = zero_aux_r;
			overflow_aux = overflow_aux_r;
			
		end else begin
			cout_aux = 0;
			neg_aux = 0;
			zero_aux = 0;
			overflow_aux = 0;
			
		end
		
	end
	
	
	assign resultado = resultado_aux;
	assign cout = cout_aux;
	assign neg = neg_aux;
	assign zero = zero_aux;
	assign overflow = overflow_aux;
	
	
endmodule 