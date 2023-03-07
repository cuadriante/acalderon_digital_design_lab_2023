module down_counter_6bit(
  input wire clk,
  output reg [5:0] count
);

always @(posedge clk)
  if(count == 6'b000000)
    count <= 6'b111111;
  else
    count <= count - 1;

endmodule
