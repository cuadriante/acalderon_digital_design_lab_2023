module f4(input I0, I1, I2, I3, 
			 output S3);

	assign S3 = (I0&&I1&&I2)|(!I0&&I2);
	
endmodule
