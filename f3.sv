module f3(input I0, I1, I2, I3, 
			 output S2);

	assign S2 = (!I0&&I1)|(I1&&I2);
	
endmodule
