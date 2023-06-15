
module pcRegister(input logic clk, rst, input logic [32:0] pcin, output logic [32:0] pcout);

	
	always @ (posedge clk or posedge rst) begin
		
		if (rst) pcout = 0;
		else
		pcout = pcin;
	
	end

endmodule