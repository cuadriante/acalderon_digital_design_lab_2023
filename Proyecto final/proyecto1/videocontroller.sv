

module videocontroller (input logic [9:0]
							  cuentaX,cuentaY, output logic [16:0] vga_addr);
	
	
	logic [16:0] cuentaX_dir, cuentaY_dir;
	assign cuentaX_dir[9:0] = cuentaX[9:0];
	assign cuentaY_dir[9:0] = cuentaY[9:0];
	assign cuentaX_dir[16:10] = 7'd0;
	assign cuentaY_dir[16:10] = 7'd0;
	
	assign vga_addr = 256*cuentaY_dir + cuentaX_dir;
				  
endmodule