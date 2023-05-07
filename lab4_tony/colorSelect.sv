module colorSelect(input logic vlineas, input logic cuadrados_enable[15:0],input logic win, input logic lose, input int arrayin[15:0], output logic [7:0] r,g,b);
	
	logic [23:0] out_mux, out_mux_0, out_mux_1, out_mux_2, out_mux_3, out_mux_4,out_mux_5,
	out_mux_6, out_mux_7, out_mux_8, out_mux_9, out_mux_10, out_mux_11, out_mux_12, out_mux_13,
	out_mux_14, out_mux_15;
	
	color_cuadrado c0(arrayin[0], out_mux_0);
	color_cuadrado c1(arrayin[1], out_mux_1);
	color_cuadrado c2(arrayin[2], out_mux_2);
	color_cuadrado c3(arrayin[3], out_mux_3);
	color_cuadrado c4(arrayin[4], out_mux_4);
	color_cuadrado c5(arrayin[5], out_mux_5);
	color_cuadrado c6(arrayin[6], out_mux_6);
	color_cuadrado c7(arrayin[7], out_mux_7);
	color_cuadrado c8(arrayin[8], out_mux_8);
	color_cuadrado c9(arrayin[9], out_mux_9);
	color_cuadrado c10(arrayin[10], out_mux_10);
	color_cuadrado c11(arrayin[11], out_mux_11);
	color_cuadrado c12(arrayin[12], out_mux_12);
	color_cuadrado c13(arrayin[13], out_mux_13);
	color_cuadrado c14(arrayin[14], out_mux_14);
	color_cuadrado c15(arrayin[15], out_mux_15);
	
	
	always @(vlineas or win or lose or cuadrados_enable[0] or cuadrados_enable[1] or cuadrados_enable[2]
		or cuadrados_enable[3] or cuadrados_enable[4] or cuadrados_enable[5] or cuadrados_enable[6]
		or cuadrados_enable[7] or cuadrados_enable[8] or cuadrados_enable[9] or cuadrados_enable[10] 
		or cuadrados_enable[11] or cuadrados_enable[12] or cuadrados_enable[13] or cuadrados_enable[14]
		or cuadrados_enable[15]) begin
		
		
		
		case({vlineas,win,lose, cuadrados_enable[0], cuadrados_enable[1], cuadrados_enable[2], cuadrados_enable[3],
		cuadrados_enable[4], cuadrados_enable[5], cuadrados_enable[6], cuadrados_enable[7], cuadrados_enable[8],
		cuadrados_enable[9], cuadrados_enable[10], cuadrados_enable[11], cuadrados_enable[12], cuadrados_enable[13],
		cuadrados_enable[14], cuadrados_enable[15]})
		
			18'b0000000000000000000 : out_mux <= 24'b111111111111111111111111; // Nada
			18'b1000000000000000000 : out_mux <= 24'b111111111111111111111111; //Lineas
			18'b1100000000000000000 : out_mux <= 24'b000000001111111100000000; //Lineas victoria
			18'b1010000000000000000 : out_mux <= 24'b111111110000000000000000; //Lineas derrota
			18'b0001000000000000000 : out_mux <= out_mux_0; //posicion 0
			18'b0000100000000000000 : out_mux <= out_mux_1; //posicion 1
			18'b0000010000000000000 : out_mux <= out_mux_2; //posicion 2
			18'b0000001000000000000 : out_mux <= out_mux_3; //posicion 3
			18'b0000000100000000000 : out_mux <= out_mux_4; //posicion 4
			18'b0000000010000000000 : out_mux <= out_mux_5; //posicion 5
			18'b0000000001000000000 : out_mux <= out_mux_6; //posicion 6
			18'b0000000000100000000 : out_mux <= out_mux_7; //posicion 7
			18'b0000000000010000000 : out_mux <= out_mux_8; //posicion 8
			18'b0000000000001000000 : out_mux <= out_mux_9; //posicion 9
			18'b0000000000000100000 : out_mux <= out_mux_10; //posicion 10
			18'b0000000000000010000 : out_mux <= out_mux_11; //posicion 11
			18'b0000000000000001000 : out_mux <= out_mux_12; //posicion 12
			18'b0000000000000000100 : out_mux <= out_mux_13; //posicion 13
			18'b0000000000000000010 : out_mux <= out_mux_14; //posicion 14
			18'b0000000000000000001 : out_mux <= out_mux_15; //posicion 14
			
			default: out_mux <= 24'b000000000000000000000000;
		endcase
		

	end
	
	
	
	assign r = out_mux[23:16];
		
	assign g = out_mux[15:8];
		
	assign b = out_mux[7:0];

endmodule