`timescale 1 ps / 1 ps
module program_tb();
	
	logic clk, rst;
	logic  [7:0]r,g,b;
	logic clk_25;
	logic H_SYNC, V_SYNC, SYNC_B, SYNC_BLANK;
	
	procesadorArm PARM(clk, rst, r,g,b, clk_25,
				H_SYNC, V_SYNC, SYNC_B, SYNC_BLANK);
	
	initial begin 

		clk = 0;
		rst = 0;
		#40
		rst = 1;
		#40
		rst = 0;
		#40
		
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		
		
		#40
		clk = 1;
		#40
		clk = 0;
		
		#40
		clk = 1;
		#40
		clk = 0;
		
		#40
		clk = 1;
		#40
		clk = 0;
		
		#40
		clk = 1;
		#40
		clk = 0;
		
		#40
		clk = 1;
		#40
		clk = 0;
		
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		/*

		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		#40
		clk = 1;
		#40
		clk = 0;
		*/
	end
	

endmodule