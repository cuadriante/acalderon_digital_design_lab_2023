module decodificador(input I0, I1, I2, I3,
							output S4, S3, S2, S1, S0);
							
	assign S0 = (I0&&I1)|(I0&&I2);
	assign S1 = (I0&&!I1&&!I2);
	assign S2 = (!I0&&I1)|(I1&&I2);
	assign S3 = (I0&&I1&&I2)|(!I0&&I2);
	assign S4 = (I3);

endmodule