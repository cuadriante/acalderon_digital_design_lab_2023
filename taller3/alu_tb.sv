
module alu_tb();
	 logic [3:0] a,b;
	 logic [2:0] op;
	 logic [3:0] resultado;
	 logic cout, zero, neg, carr;
	
	alu aluuu(a, b, op, resultado, cout, zero, neg, carr);
	
	//logic_alu laluuu(a, b, r_and, r_or, r_xor, r_shiftR, r_shiftL);

	initial begin
		op = 3'b010;
		a = 1;
		b = 0;
		// 0000 a + b
		
		#100
		a = 1;


	end
endmodule
