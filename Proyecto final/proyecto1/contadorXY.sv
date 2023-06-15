// Modulo contador de las posiciones x y y.
module contadorXY (input logic clk_25,
						output logic [9:0]cuentaX,
						output logic [9:0]cuentaY);
				
				logic[9:0] x= 10'd0;
				logic[9:0] y = 10'd0;
				
				always @(posedge clk_25)begin
					
					if (x == 10'd800) begin //cuando el contador X llega al maximo entonces cuentaX se vuelve 0 y le suma uno al contador y.
						x = 0; 
						y = y + 10'b1;
						
						if (y == 10'd525) // cuando el contador Y llega a su maximo entonces cuentaY se hace 0.
							y = 0;
						end
					else
						x = x + 10'b1;
						
				end
					
				assign cuentaX = x;
				assign cuentaY = y;
					

endmodule