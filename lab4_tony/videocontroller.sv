
module videocontroller(input logic clk_25, win, lose, input int arrayin[15:0],
							  input logic [9:0] cuentaX,cuentaY, 
							  output logic [7:0] r,g,b);

	

	
	logic vlineas;
	lineas ln(cuentaX,cuentaY,vlineas);
	
	
	
	//cada cuadrados
	logic cuadrados_enable[15:0];
	cuadrados c0(cuentaX, cuentaY, 0, 150, 0, 110, cuadrados_enable[0]);
	cuadrados c1(cuentaX, cuentaY, 170, 320, 0, 110, cuadrados_enable[1]);
	cuadrados c2(cuentaX, cuentaY, 340, 490, 0, 110, cuadrados_enable[2]);
	cuadrados c3(cuentaX, cuentaY, 510, 640, 0, 110, cuadrados_enable[3]);
	
	cuadrados c4(cuentaX, cuentaY, 0, 150, 130, 230, cuadrados_enable[4]);
	cuadrados c5(cuentaX, cuentaY, 170, 320, 130, 230, cuadrados_enable[5]);
	cuadrados c6(cuentaX, cuentaY, 340, 490, 130, 230, cuadrados_enable[6]);
	cuadrados c7(cuentaX, cuentaY, 510, 640, 130, 230, cuadrados_enable[7]);
	
	cuadrados c8(cuentaX, cuentaY, 0, 150, 250, 350, cuadrados_enable[8]);
	cuadrados c9(cuentaX, cuentaY, 170, 320, 250, 350, cuadrados_enable[9]);
	cuadrados c10(cuentaX, cuentaY, 340, 490, 250, 350, cuadrados_enable[10]);
	cuadrados c11(cuentaX, cuentaY, 510, 640, 250, 350, cuadrados_enable[11]);
	
	cuadrados c12(cuentaX, cuentaY, 0, 150, 370, 480, cuadrados_enable[12]);
	cuadrados c13(cuentaX, cuentaY, 170, 320, 370, 480, cuadrados_enable[13]);
	cuadrados c14(cuentaX, cuentaY, 340, 490, 370, 480, cuadrados_enable[14]);
	cuadrados c15(cuentaX, cuentaY, 510, 640, 370, 480, cuadrados_enable[15]);
	
	
	
	
	colorSelect cl(vlineas,cuadrados_enable,win,lose,arrayin,r,g,b);
	
	
endmodule