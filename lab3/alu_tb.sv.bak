

module tb_alu;
 // Inputs
 reg [3:0] input1;
 reg [3:0] input2;
 // Outputs
 wire [3:0] answer;
 wire cout;
 wire neg;
 wire zero;
 wire overflow;
 wire display;

 // Instantiate the Unit Under Test (UUT)
 alu uut (
  .input1(input1), 
  .input2(input2),
  .answer(answer),
  .cout(cout),
  .neg(neg),
  .zero(zero),
  .overflow(overflow),
  .display(display)
 );

 initial begin
  // Initialize Inputs
  input1 = 0;
  input2 = 0;
  #100;
  input1 = 4;
  input2 = 8;
  #100;
  // Add stimulus here
 end
      
endmodule