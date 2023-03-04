module decodificador(input I0, I1, I2, I3,
							output S4, S3, S2, S1, S0);
							
	f1(I0, I1, I2, I3, S0);
	f2(I0, I1, I2, I3, S1);
	f3(I0, I1, I2, I3, S2);
	f4(I0, I1, I2, I3, S3);
	f5(I0, I1, I2, I3, S4);

endmodule