
module RegisterFile(input  logic clk,rst,we3, 
               input  logic [3:0]  ra1, ra2, ra3, 
               input  logic [31:0] wd3, r15,
               output logic [31:0] rd1, rd2);

	logic [14:0][31:0] rf;
	
	
		
	
	always_ff @(negedge clk or posedge rst) begin
	
	
		if(rst) begin
			/*
			rf[0] = 65535;
			*/
			rf[0] = 0;
			rf[1] = 1;
			rf[14:2] = 32'd0;
		end
		else begin
			if (we3) rf[ra3] <= wd3;
		end
	end



	assign rd1 = (ra1 == 4'b1111) ? r15 : rf[ra1];
	assign rd2 = (ra2 == 4'b1111) ? r15 : rf[ra2];
  
  

endmodule
