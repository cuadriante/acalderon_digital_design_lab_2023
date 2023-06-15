


module divisorClock(input logic clock, 
	               output logic clock_25);

	   reg [15:0] cnt;
	   
		//------------------------------------Divisor de Clock-------------------------------
	   always @(posedge clock)
      {clock_25, cnt} <= cnt + 16'h8000; // El clock de la DE1-SoC es de 50MHz, para llegar a 25MHz se debe dividir por 2-> (2^(16))/2 = 32768 ->Hex = 8000;
		

endmodule