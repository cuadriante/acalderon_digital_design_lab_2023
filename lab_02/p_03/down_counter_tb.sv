module down_counter_tb;
  parameter N2b = 2;
  parameter N4b = 4;
  parameter N6b = 6;
  parameter CLK_PERIOD = 10;

  reg clk;
  reg rst;
  reg rst1;
  wire [N2b-1:0] count2b;
  wire [N4b-1:0] count4b;
  wire [N6b-1:0] count6b;

  down_counter #(.N(N4b)) dut (
    .clk(clk),
    .rst(rst),
    .count(count4b)
  );
  down_counter #(.N(N6b)) dut1 (
    .clk(clk),
    .rst(rst),
    .count(count6b)
  );
  down_counter #(.N(N2b)) dut2 (
    .clk(clk),
    .rst(rst),
    .count(count2b)
  );
  initial begin
  clk = 0;
  forever #CLK_PERIOD clk = ~clk;
  end

  initial begin
    #10 rst = 1;
    #10 rst = 0;
    $display("\n--- 2bit ---\n");
    repeat (4) @(posedge clk) $display("%b", count2b);
    clk = 0;
    #10 rst = 1;
    #10 rst = 0;
    $display("\n--- 4bit ---\n");
    repeat (16) @(posedge clk) $display("%b", count4b);
    clk = 0;
    #10 rst = 1;
    #10 rst = 0;
    $display("\n--- 6bit ---\n");
    repeat (64) @(posedge clk) $display("%b", count6b);
    $finish;
  end

endmodule
