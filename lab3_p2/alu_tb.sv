
module alu_tb();
	 logic [3:0] a,b;
	 logic op;
	 logic [2:0] counter;
	 logic [3:0] resultado;
	 logic [6:0] display;
	 logic cout, zero, neg, overflow;
	 //logic [3:0] r_and, r_or, r_xor, r_shiftR, r_shiftL;
	 
									 
	alu aluuu(a, b, op, counter, resultado, cout, zero, neg, overflow, display);
	
	//logic_alu laluuu(a, b, r_and, r_or, r_xor, r_shiftR, r_shiftL);

	initial begin
		op = 0;
		a = 8;
		b = 8;
		// 0000 a + b
		
		#100
		op = 1;
		a = 5;
		b = 3;
		#100
		a=1;


	end
endmodule
