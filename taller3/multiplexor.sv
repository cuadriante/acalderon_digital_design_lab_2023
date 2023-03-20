module multiplexor#(parameter N=4)(input [N-1:0] i0, i1, i2, i3, i4, i5, i6, input[3:0] s, output [N-1:0] out);
	input[3:0] out_aux
	always @(s) begin 
		case (s)
			0:
				out_aux = i0;
			1:
				out_aux = i1;
			2:
				out_aux = i2;
			3:
				out_aux = i3;
			4:
				out_aux = i4;
			5:
				out_aux = i5;
			6:
				out_aux = i6;
			default: 
				out_aux = 0;
		endcase
	end
	assign out = out_aux;
endmodule