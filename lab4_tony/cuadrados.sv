

module cuadrados(input logic [9:0]cuentaX,cuentaY, input int xlim0, xlim1, ylim0, ylim1,
				  output logic enable);
				  
		assign enable = (((cuentaX > xlim0) & (cuentaX < xlim1)) &
								((cuentaY > ylim0) & (cuentaY < ylim1)))? 1:0;


endmodule