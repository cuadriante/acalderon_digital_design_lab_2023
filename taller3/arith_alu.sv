

//N_bit_adder



module arith_alu(input1, input2, option, answer, cout, neg, zero, overflow, display);
	parameter N=4;
	
	input [N-1:0] input1, input2;
	input option;
	output [N-1:0] answer;
	output cout, neg, zero, overflow;
	
	output [6:0] display;
	reg [6:0] disp;

	reg neg_a = 0;
	reg cout_a = 0;
	reg neg_b = 0;
	reg cout_b = 0;
	reg zero_a = 0;
	reg over_a = 0;
	
	
	reg eq, gr, sm;
	reg eq1, gr1, sm1;
	
	reg [N-1:0] answers;
	reg [N-1:0] answerr;
	reg [N-1:0] answerp;
	
	n_bit_adder U0(.input1(input1), .input2(input2), .answer(answers), .cout(cout_b));
	n_bit_substractor U1(.input1(input1), .input2(input2), .answer(answerr), .neg(neg_b));
	
	always @* begin
	if (option == 0) begin
		answerp = answers;
		cout_a = cout_b;
	end else if (option == 1) begin
		answerp = answerr;
		neg_a = neg_b;
	end
	end
	
	resultado U2(.answerp(answerp), .cout(cout_a), .zero_a(zero_a), .over_a(over_a));
	
	
	always @*
	case (answerp)
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
	assign overflow = over_a;
	assign zero = zero_a;
	assign neg = neg_a;
	assign cout = cout_a;
	assign answer = answerp;
	


endmodule



module resultado(answerp, cout,zero_a, over_a);
	parameter N=4;
	input [N-1:0] answerp;
	input cout;
	output zero_a, over_a;
	reg zero_b = 0;
	reg over_b = 0;
	
	reg[N-1:0] zero_comp = 4'b0000;
	reg[N-1:0] overflow_comp = 4'b1111;
	reg eq, gr, sm;
	reg eq1, gr1, sm1;
	
	n_bit_compare U2(.a(answerp), .b(zero_comp), .equal(eq), .greater(gr), .smaller(sm));
	n_bit_compare U3(.a(overflow_comp), .b(answerp), .equal(eq1), .greater(gr1), .smaller(sm1));
	
	always @* begin
	if (cout == 0) begin
		zero_b = eq;
		over_b = 0;
	end else begin
		zero_b = 0;
		over_b = eq1;
	end
	end
	
	assign zero_a = zero_b;
	assign over_a = over_b;

endmodule 


module n_bit_substractor(input1, input2, answer, neg);
	parameter N=4;
	input [N-1:0] input1,input2;
   output [N-1:0] answer;
	output neg;
	wire cout;
	reg  neg_assign;
	wire equal, greater, smaller;
	wire eq, gr, sm;
	reg [N-1:0] input1_sub, input2_sub;
	parameter cin = 1;
	
	
	
	n_bit_compare U0(.a(input1), .b(input2), .equal(equal), .greater(greater), .smaller(smaller));
	assign eq = equal;
	assign gr = greater;
	assign sm = smaller;
	always @* begin
	if (sm==1) begin
		input1_sub = input2;
		input2_sub = ~(input1);
		neg_assign = 1;
		
	end else begin
		input1_sub = input1;
		input2_sub = ~(input2);
		neg_assign = 0;
	end
	end
	assign neg = neg_assign;
	n_bit_adder_sub U1(.input1(input1_sub),.input2(input2_sub), .cin(cin), .answer(answer), .cout(cout));
	

endmodule

module n_bit_adder(input1, input2, answer, cout);
	parameter N=4;
	input [N-1:0] input1,input2;
   output [N-1:0] answer;
	output cout;
	parameter cin = 0;
	n_bit_adder_sub U0(.input1(input1),.input2(input2), .cin(cin), .answer(answer), .cout(cout));
	

endmodule

module n_bit_adder_sub(input1,input2, cin, answer, cout);
	parameter N=4;
	input [N-1:0] input1,input2;
	input cin;
   output [N-1:0] answer;
	output cout;
   wire  carry_out;
   wire [N-1:0] carry;
   genvar i;
   generate 
		for(i=0;i<N;i=i+1)
			begin: generate_N_bit_Adder
				if(i==0) 
					full_adder f(input1[0],input2[0],cin,answer[0],carry[0]);
				else
					full_adder f(input1[i],input2[i],carry[i-1],answer[i],carry[i]);
			end
		assign carry_out = carry[N-1];
		assign cout = carry_out;
   endgenerate
endmodule 





module full_adder(x,y,c_in,s,c_out);
   input x,y,c_in;
   output s,c_out;
	assign s = (x^y) ^ c_in;
	assign c_out = (y&c_in)| (x&y) | (x&c_in);
endmodule // full_adder



module n_bit_compare(a,b,equal,greater, smaller);
	
	parameter N=4;
	input [N-1:0] a, b;
	output equal, greater, smaller;
	
	
	assign equal = (a==b);
	assign greater = (a>b);
	assign smaller = (a<b);
	

endmodule


 

module bit_compare(a, b, equal, greater, smaller);
	input a, b;
	output equal, greater, smaller;
	assign equal = ~(a ^ b);
	assign greater = (~b)&a;
	assign smaller = (~a)&b;
	

endmodule