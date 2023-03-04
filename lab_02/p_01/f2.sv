module f2(input I0, I1, I2, I3, 
			 output S1);

	assign S1 = (I0&&!I1&&!I2);
	
endmodule
