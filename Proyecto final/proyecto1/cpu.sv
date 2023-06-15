
module cpu(input logic clk, rst, input logic [31:0] instruction, input logic [31:0] dataRead, input logic [31:0] pc,
				output logic [31:0] pcOut, dataWrite, output logic memWrite, 
				output [17:0] addr);
	
	logic [3:0] aluFlags;
	logic pcSrc, regWrite, memtoReg, aluSrc;
	logic [1:0] immSrc, regSrc, aluControl;
	logic [3:0] a1, a2, a3;
	logic [31:0] pc_plus_4;
	logic [31:0] pc_plus_8;
	logic [31:0] rd1, rd2, wd3, r15;
	logic [31:0] extImm, aluResult, srcB, resultPc;
	

	
	ControlUnit C0(clk, rst, instruction[31:28], aluFlags, instruction[15:12],
						instruction[27:26], instruction[25:20], 
						pcSrc, regWrite, memWrite, memtoReg,
						aluSrc, immSrc, regSrc, aluControl);
	
	mux_2_to_1_4 M0(4'd15, instruction[19:16], regSrc[0], a1);
	mux_2_to_1_4 M1(instruction[15:12], instruction[3:0], regSrc[1], a2);
	
	
	plus_n P4(pc, 32'd4, pc_plus_4);
	plus_n P8(pc_plus_4, 32'd4, pc_plus_8);
	
	RegisterFile R0(clk,rst, regWrite, 
               a1, a2, instruction[15:12], 
               resultPc, pc_plus_8,
               rd1, rd2);
	
	Extend E0(instruction[23:0], immSrc, extImm);
	mux_2_to_1_32 M2(extImm, rd2, aluSrc, srcB);
	
	alu A0(rd1, srcB, aluControl, aluResult, aluFlags[1], aluFlags[2], aluFlags[3], aluFlags[0]);
	
	mux_2_to_1_32 M3(dataRead, aluResult, memtoReg, resultPc);
	mux_2_to_1_32 M4(resultPc, pc_plus_4, pcSrc, pcOut);
	
	
	assign addr = aluResult;
	assign dataWrite = rd2;
	

endmodule