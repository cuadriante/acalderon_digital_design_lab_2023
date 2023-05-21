module ecualizador_histograma(input [3:0] a, b, input logic [31: 0] c, d, input logic sel, output [3:0] r1, output [31:0] r2, output [31:0] r3);

	mux_2_to_1 mux21_2 (a, b, sel, r1);
	mux_2_to_1 #(32) mux21_32 (c, d, sel, r2);
	plus_n #(32) plus4_32 (r2, 4, r3);

endmodule