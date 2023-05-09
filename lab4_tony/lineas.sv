
module lineas(input logic [9:0]cuentaX,cuentaY,
				  output logic enable);
				  
		assign enable = ((cuentaX > 150) & (cuentaX < 170) | (cuentaX > 320) & (cuentaX < 340) | (cuentaX > 490) & (cuentaX < 510) |
								(cuentaY > 110) & (cuentaY < 130) | (cuentaY > 230) & (cuentaY < 250) | (cuentaY > 350) & (cuentaY < 370))? 1:0;


endmodule