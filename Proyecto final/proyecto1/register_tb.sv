module register_tb();
	logic clk,rst,we3;
	logic [3:0]  ra1, ra2, ra3;
	logic [31:0] wd3, r15;
	logic [31:0] rd1, rd2;
	RegisterFile RF(clk,rst,we3, 
               ra1, ra2, ra3, 
               wd3, r15,
               rd1, rd2);
	
	
	initial begin
	
		clk = 0;
		rst = 0;
		#40
		rst = 1;
		#40
		rst = 0;
		ra3 = 1;
		wd3 = 15;
		we3 = 1;
		#40
		clk = 1;
		#40
		clk = 0;
	
	end


endmodule