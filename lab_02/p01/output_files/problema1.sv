module problema1(input logic I0, I1, I2, I3, I4, b, 
				  output logic S0, S1, S2, S3, S4,
				  HEX_0_0, HEX_0_1, HEX_0_2, HEX_0_3, HEX_0_4, HEX_0_5, HEX_0_6,
				  HEX_1_0, HEX_1_1, HEX_1_2, HEX_1_3, HEX_1_4, HEX_1_5, HEX_1_6);

	// BCD ( S4 S3 S2 S1 S0 )
	assign S4 = (I0&&I1)|(I0&&I2);
	assign S3 = (I0&&!I1&&!I2);
	assign S2 = (!I0&&I1)|(I1&&I2);
	assign S1 = (I0&&I1&&!I2)|(!I0&&I2);
	assign S0 = (I3);
	
	
	//										( S3 S2 S1 S0 )
	// 7 segment digit - unidades (  A  B  C  D )
	assign HEX_0_0 = !((!S2&&!S0)|(S1)|(S2&&S0)|(S3));
	assign HEX_0_1 = !((!S2)|(!S1&&!S0)|(S1&&S0));
	assign HEX_0_2 = !((!S1)|(S0)|(S2));
	assign HEX_0_3 = !((!S2&&!S0)|(!S2&&S1)|(S2&&!S1&&S0)|(S3));
	assign HEX_0_4 = !((!S2&&!S0)|(S1&&!S0));
	assign HEX_0_5 = !((!S1&&!S0)|(S2&&!S1)|(S2&&!S0)|(S3));
	assign HEX_0_6 = !((!S2&&S1)|(S2&&!S1)|(S3)|(S2&&!S0));
	
	//									  (S7 S6 S5 S4 )
	// 7 segment digit - decenas ( A  B  C  D )
	assign S5 = 0; assign S6 = 0; assign S7 = 0;
	assign HEX_1_0 = !((!S6&&!S4)|(S5)|(S6&&S4)|(S7));
	assign HEX_1_1 = !((!S6)|(!S5&&!S4)|(S5&&S4));
	assign HEX_1_2 = !((!S5)|(S4)|(S6));
	assign HEX_1_3 = !((!S6&&!S4)|(!S6&&S5)|(S6&&!S5&&S4)|(S7));
	assign HEX_1_4 = !((!S6&&!S4)|(S5&&!S4));
	assign HEX_1_5 = !((!S5&&!S4)|(S6&&!S5)|(S6&&!S4)|(S7));
	assign HEX_1_6 = !((!S6&&S5)|(S6&&!S5)|(S7)|(S6&&!S4));
	
	// 7 segment digit - decenas
	
endmodule