module multiplexor#(parameter N=4)(input [N-1:0] a, b, c,d, e, f, g, input [3:0] ss, output [N-1:0] salida);
logic [N-1:0] aux;

always @(ss) begin
	case (ss)
		0:
			aux = a;

		1:
			aux = b;
			
		2:
			aux = c;

		3:
			aux = d;

			
		4:
			aux = e;

		5:
			aux = f;

		6:
			aux = g;


	
		default: aux = 0;
	endcase
	
end

assign salida = aux;	


endmodule