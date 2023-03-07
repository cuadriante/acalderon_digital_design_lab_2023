// Copyright (C) 2022  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

module top_module
(
// {ALTERA_ARGS_BEGIN} DO NOT REMOVE THIS LINE!

	clk,
	reset,
	seg_out1,
	seg_out2,
	seg_out3,
	seg_out4,
	seg_out5,
	seg_out6,
	rst,
	CLK,
	segment,
	LED,
	SSEG_AN,
	SSEG_CA,
	SW
// {ALTERA_ARGS_END} DO NOT REMOVE THIS LINE!

);

// {ALTERA_IO_BEGIN} DO NOT REMOVE THIS LINE!
input			clk;
input			reset;
output	[5:0]	seg_out1;
output	[5:0]	seg_out2;
output	[5:0]	seg_out3;
output	[5:0]	seg_out4;
output	[5:0]	seg_out5;
output	[5:0]	seg_out6;
input			rst;
input			CLK;
input	[0:6]	segment;
input	[0:3]	LED;
input	[0:7]	SSEG_AN;
input	[0:7]	SSEG_CA;
input	[0:3]	SW;

// {ALTERA_IO_END} DO NOT REMOVE THIS LINE!
// {ALTERA_MODULE_BEGIN} DO NOT REMOVE THIS LINE!
// {ALTERA_MODULE_END} DO NOT REMOVE THIS LINE!
endmodule
