
module ConditionCheck(input logic [3:0] cond, input logic [1:0] flags32, flags10, 
								output logic condEX);
	
	
	always_comb begin
	
		case (cond)
			4'b000:
				condEX = flags32[0];
			4'b0001:
				condEX = !flags32[0];
			4'b0010:
				condEX = flags10[1];
			4'b0011:
				condEX = !flags10[1];
			4'b0100:
				condEX = flags32[1];
			4'b0101:
				condEX = !flags32[1];
			4'b0110:
				condEX = flags10[0];
			4'b0111:
				condEX = !flags10[0];
			4'b1000:
				condEX = (!flags32[1])&(flags10[1]);
			4'b1001:
				condEX = (!flags32[1])|(flags10[1]);
			4'b1010:
				condEX = !(flags32[1]^flags10[0]);
			4'b1011:
				condEX = (flags32[1]^flags10[0]);
			4'b1100:
				condEX = (!flags32[0])&(!(flags32[1]^flags10[0]));
			4'b1101:
				condEX = (flags32[0])|((flags32[1]^flags10[0]));
			4'b1110:
				condEX = 1;
			default:
				condEX = 1;
			
		endcase
	end

endmodule