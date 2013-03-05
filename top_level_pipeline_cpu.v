// Copyright (C) 1991-2012 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 32-bit"
// VERSION		"Version 12.0 Build 263 08/02/2012 Service Pack 2 SJ Full Version"
// CREATED		"Mon Mar 04 19:01:08 2013"

module top_level_pipeline_cpu(
);



wire	clk;

Pipelined_CPU	Pipelined_CPU(
	.clk(clk),
	.clk10(clk),
	.stall(0),
	.clk12(clk),
	.clk13(clk),
	.clk14(clk),
	.clk16(clk),
	.clk17(clk),
	.clk18(clk),
	.clk19(clk)
	);


Clock	b2v_inst1(
	.clk(clk));


endmodule
