
module Extend(input logic [23:0] immediate, input logic [1:0] immSrc, output logic [31:0] extImm);

	always_comb begin
	
		case (immSrc) 
		
			2'b00: begin
				extImm[31:8] = 24'd0;
				extImm[7:0] = immediate[7:0];
			end
			2'b01: begin
				extImm[31:12] = 20'd0;
				extImm[11:0] = immediate[11:0];
			end
			2'b10: begin
				extImm[31:24] = 8'd0;
				extImm[23:0] = immediate[23:0];
			end
			default: begin
				extImm[31:8] = 24'd0;
				extImm[7:0] = immediate[7:0];
			end
		endcase
	
	end

endmodule