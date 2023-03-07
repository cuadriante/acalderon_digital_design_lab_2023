module down_counter(clk, count);
  input clk;
  output reg [5:0] count;

  always @(posedge clk) begin
    if (count == 0) begin
      count <= 63;
    end else begin
      count <= count - 1;
    end
  end
endmodule

