module down_counter #(parameter N = 8) (
  input clk,
  input rst,
  output reg [N-1:0] count
);

always @(posedge clk or posedge rst) begin
  if (rst) begin
    count <= {N{1'b1}};
  end
  else begin
    count <= count - 1;
  end
end

endmodule

