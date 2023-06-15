module mux_3_to_1_32 #(parameter N=8)(input [N-1:0] i1, i2, i3, input logic [1:0] sel, output logic [N-1:0] result);
	
	always_comb begin
		case (sel)
		2'b00:
			result = i1;
		2'b01:
			result = i2;
		2'b10:
			result = i3;
		default:
			result = 0;
		endcase
	end

endmodule