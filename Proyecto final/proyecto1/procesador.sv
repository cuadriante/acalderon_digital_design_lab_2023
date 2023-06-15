
module procesador(input logic clk, rst, clk_vga,  input logic [16:0] vga_addr, output logic [7:0] ram_vga);
	
	logic [31:0] instruction;
	logic [31:0] pc;
	logic [31:0] pcUse;
	logic [31:0] dataRead, dataWrite;
	logic memWrite;
	logic [17:0] addr;
	logic [1:0] select; 
	logic [16:0] out_addr;
	logic [7:0] i1, i2, i3, data_write_noUse, data_read_noUse;
	logic [7:0] result;
	
	initial begin
		
		pc = 0;
		pcUse = 0;
		
	end
	
	pcRegister P0(clk, rst, pc, pcUse);
	InstructionMemory IM(clk,rst, pcUse, instruction);
	cpu CPU(clk, rst, instruction, dataRead, pcUse, pc, dataWrite, memWrite, addr);
	ChipSet CS(addr, select, out_addr);
	mux_3_to_1_32 MUX(i1, i2, i3, select, result);
	RamDataMem DRAM(rst, rst, out_addr,vga_addr,clk,clk_vga,dataWrite[7:0],data_write_noUse,memWrite,1'b0,i1,ram_vga);
	RomDataMem DROM(rst, out_addr, clk, i2);
	
	assign dataRead[7:0] = result;
	assign dataRead[31:8] = 0;
	
endmodule