module alu #(parameter N=32)(input [N-1:0] a, b, input op, output reg[2:0] counter, output [N-1:0] resultado, 
									 output cout, zero, neg, overflow, output [6:0] display);
	logic[N:0] rs, rr;
	reg[N-1:0] r_and, r_or, r_xor, r_shiftR, r_shiftL, resultado_s, resultado_r, resultado_aux;
	
	
	logic cout_aux , neg_aux, zero_aux, overflow_aux;
	logic cout_aux_s, neg_aux_s, zero_aux_s, overflow_aux_s;
	logic cout_aux_r, neg_aux_r, zero_aux_r, overflow_aux_r;
	
	initial counter = 0;
	
	
	reg [6:0] disp;
	
	logic [N-1:0] aux;
	logic_alu LU(a, b, r_and, r_or, r_xor, r_shiftR, r_shiftL);
	arith_alu AUS(a, b, 0, resultado_s, cout_aux_s, neg_aux_s, zero_aux_s, overflow_aux_s);
	arith_alu AUR(a, b, 1, resultado_r, cout_aux_r, neg_aux_r, zero_aux_r, overflow_aux_r);
	
	

	always @(posedge op) begin
	
		if (counter < 3'b110) begin
			counter <= counter + 1'b1;
		end else begin
			counter <= 3'b000;
		end
	end
	
	always @* begin
	case (counter)
	
		3'b000: // a + b
		 resultado_aux = resultado_s;
		 
		3'b001: // a - b
		 resultado_aux = resultado_r;
		
		3'b010:
			resultado_aux = {3'b000,r_and[0]};

		3'b011:
			resultado_aux = {3'b000,r_or[0]};

		3'b100:
			resultado_aux = {3'b000,r_xor[0]};

		3'b101:
			resultado_aux = {3'b000,r_shiftR[0]};

		3'b110:
			resultado_aux = {3'b000,r_shiftL[0]};
	
		default: resultado_aux = 4'b0000;
	endcase
	end
	
	always @* begin
		
		if (counter == 3'b000) begin
			cout_aux = cout_aux_s;
			neg_aux = neg_aux_s;
			zero_aux = zero_aux_s;
			overflow_aux = overflow_aux_s;
			
		end else if (counter == 3'b001) begin
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
	
	
	always @*
	case (resultado)
	4'b0000 :      	//Hexadecimal 0
	disp = 7'b0000001; 
	4'b0001 :    		//Hexadecimal 1
	disp = 7'b1001111  ; 
	4'b0010 :  		// Hexadecimal 2
	disp = 7'b0010010 ; 
	4'b0011 : 		// Hexadecimal 3
	disp = 7'b0000110 ; 
	4'b0100 :		// Hexadecimal 4
	disp = 7'b1001100 ; 
	4'b0101 :		// Hexadecimal 5
	disp = 7'b0100100 ;  
	4'b0110 :		// Hexadecimal 6
	disp = 7'b0100000 ; 
	4'b0111 :		// Hexadecimal 7
	disp = 7'b0001111; 
	4'b1000 :     		 //Hexadecimal 8
	disp = 7'b0000000;
	4'b1001 :    		//Hexadecimal 9
	disp = 7'b0000100 ; 
	4'b1010 :  		// Hexadecimal A
	disp = 7'b0001000 ; 
	4'b1011 : 		// Hexadecimal B
	disp = 7'b1100000;
	4'b1100 :		// Hexadecimal C
	disp = 7'b0110001 ;  
	4'b1101 :		// Hexadecimal D
	disp = 7'b1000010 ;  
	4'b1110 :		// Hexadecimal E
	disp = 7'b0110000 ; 
	4'b1111 :		// Hexadecimal F
	disp = 7'b0111000 ; 
	endcase
	
	assign display = disp;
	
endmodule 