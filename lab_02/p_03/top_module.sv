module top_module (
    input clk,
    input reset,
    output reg [5:0] seg_out1,
    output reg [5:0] seg_out2,
    output reg [5:0] seg_out3,
    output reg [5:0] seg_out4,
    output reg [5:0] seg_out5,
    output reg [5:0] seg_out6
);

reg [5:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        counter <= 6'b111111;
    end else begin
        counter <= counter - 1;
    end
end

assign {seg_out6, seg_out5, seg_out4, seg_out3, seg_out2, seg_out1} = counter;

endmodule

