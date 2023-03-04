module f1(input I0, I1, I2, I3, 
			 output S0);

	assign S0 = (I0&&I1)|(I0&&I2);
	
endmodule
