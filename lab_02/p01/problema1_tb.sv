module problema1_tb();
		logic I0, I1, I2, I3,
				S0, S1, S2, S3, S4;
				
		decodificador deco(I0, I1, I2, I3, S0, S1, S2, S3, S4,
				  HEX_0_0, HEX_0_1, HEX_0_2, HEX_0_3, HEX_0_4, HEX_0_5, HEX_0_6,
				  HEX_1_0, HEX_1_1, HEX_1_2, HEX_1_3, HEX_1_4, HEX_1_5, HEX_1_6);
			
		initial begin 
		
		// CASO 1	(0)	entrada: 0 0 0 0 		esperado: 0 0 0 0 0
		I0=0; I1=0; I2=0; I3=0;
		#100;
		
		// CASO 2	(2)	entrada: 0 0 1 0 		esperado: 0 0 0 1 0
		I0=0; I1=0; I2=1; I3=0;
		#100;
		
		// CASO 3	(4)	entrada: 0 1 0 0 		esperado: 0 0 1 0 0
		I0=0; I1=1; I2=0; I3=0;
		#100;
		
		// CASO 4	(7)	entrada: 0 1 1 1 		esperado: 0 0 1 1 1
		I0=0; I1=1; I2=1; I3=1;
		#100;
		
		// CASO 5	(10)	entrada: 1 0 1 0 		esperado: 1 0 0 0 0
		I0=1; I1=0; I2=1; I3=0;
		#100;
		
		// CASO 6	(11)	entrada: 1 0 1 1 		esperado: 1 0 0 0 1
		I0=1; I1=0; I2=1; I3=1;
		#100;
		
		// CASO 7	(14)	entrada: 1 1 1 0 		esperado: 1 0 1 0 0
		I0=1; I1=1; I2=1; I3=0;
		#100;
		
		// CASO 8	(15)	entrada: 1 1 1 1 		esperado: 1 0 1 0 1
		I0=1; I1=1; I2=1; I3=1;
		#100;
		
		end
		
endmodule
		
		
		
		
		
		
