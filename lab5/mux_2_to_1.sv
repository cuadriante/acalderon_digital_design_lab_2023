module mux_2_to_1 #(parameter N=2)(input [N-1:0] i1, i2, input logic sel, output [N-1:0] result);
	
	always @* begin
    if (sel)
      result = i1;
    else
      result = i2;
  end

endmodule