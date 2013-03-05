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
// CREATED		"Fri Mar 01 23:14:25 2013"

module Pipelined_CPU(
	clk,
	clk10,
	init,
	clk12,
	clk13,
	stall,
	clk14,
	stall15,
	clk16,
	clk17,
	clk18,
	clk19,
	halted
);


input wire	clk;
input wire	clk10;
input wire	init;
input wire	clk12;
input wire	clk13;
input wire	stall;
input wire	clk14;
input wire	stall15;
input wire	clk16;
input wire	clk17;
input wire	clk18;
input wire	clk19;
output wire	halted;

wire	[8:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[3:0] SYNTHESIZED_WIRE_6;
wire	[1:0] SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	[3:0] SYNTHESIZED_WIRE_9;
wire	[1:0] SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[3:0] SYNTHESIZED_WIRE_52;
wire	[1:0] SYNTHESIZED_WIRE_16;
wire	[3:0] SYNTHESIZED_WIRE_17;
wire	[3:0] SYNTHESIZED_WIRE_18;
wire	[1:0] SYNTHESIZED_WIRE_19;
wire	[15:0] SYNTHESIZED_WIRE_20;
wire	[3:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	[15:0] SYNTHESIZED_WIRE_26;
wire	[15:0] SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	[15:0] SYNTHESIZED_WIRE_32;
wire	[1:0] SYNTHESIZED_WIRE_33;
wire	[15:0] SYNTHESIZED_WIRE_34;
wire	[15:0] SYNTHESIZED_WIRE_35;
wire	[3:0] SYNTHESIZED_WIRE_36;
wire	[15:0] SYNTHESIZED_WIRE_37;
wire	[15:0] SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	[15:0] SYNTHESIZED_WIRE_42;
wire	[15:0] SYNTHESIZED_WIRE_43;
wire	[1:0] SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	[1:0] SYNTHESIZED_WIRE_46;
wire	[15:0] SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	[15:0] SYNTHESIZED_WIRE_50;
wire	[15:0] SYNTHESIZED_WIRE_51;





Control_Unit	b2v_inst(
	.clk(clk),
	.instruction_in(SYNTHESIZED_WIRE_0),
	.start(SYNTHESIZED_WIRE_22),
	.branch(SYNTHESIZED_WIRE_23),
	.write(SYNTHESIZED_WIRE_1),
	.move(SYNTHESIZED_WIRE_2),
	.MemtoReg(SYNTHESIZED_WIRE_4),
	.MemWrite(SYNTHESIZED_WIRE_5),
	.jump_sign(SYNTHESIZED_WIRE_25),
	.immediate(SYNTHESIZED_WIRE_3),
	.halted(halted),
	.ALUOp(SYNTHESIZED_WIRE_6),
	.quarter(SYNTHESIZED_WIRE_7),
	.readReg0(SYNTHESIZED_WIRE_8),
	.readReg1(SYNTHESIZED_WIRE_9),
	.regToMem(SYNTHESIZED_WIRE_10),
	.write_reg(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst.add = 5'b00000;
	defparam	b2v_inst.be = 5'b01111;
	defparam	b2v_inst.bez = 5'b10001;
	defparam	b2v_inst.bgte = 5'b10011;
	defparam	b2v_inst.bltz = 5'b10010;
	defparam	b2v_inst.bne = 5'b10000;
	defparam	b2v_inst.evl = 5'b10101;
	defparam	b2v_inst.evu = 5'b10100;
	defparam	b2v_inst.halt = 5'b11010;
	defparam	b2v_inst.jump = 5'b11000;
	defparam	b2v_inst.ld = 5'b10110;
	defparam	b2v_inst.mathToAdr = 5'b01001;
	defparam	b2v_inst.mv = 5'b00010;
	defparam	b2v_inst.mvAdr = 5'b00100;
	defparam	b2v_inst.mvCnt = 5'b01100;
	defparam	b2v_inst.mvMath = 5'b00111;
	defparam	b2v_inst.mvToAdr = 5'b00011;
	defparam	b2v_inst.mvToCnt = 5'b01101;
	defparam	b2v_inst.mvToMath = 5'b01000;
	defparam	b2v_inst.rsAdr = 5'b00101;
	defparam	b2v_inst.rsCnt = 5'b01110;
	defparam	b2v_inst.setCnt = 5'b01011;
	defparam	b2v_inst.seti = 5'b00110;
	defparam	b2v_inst.setReg = 5'b01010;
	defparam	b2v_inst.st = 5'b10111;
	defparam	b2v_inst.sub = 5'b00001;
	defparam	b2v_inst.toBeDefined = 5'b11011;
	defparam	b2v_inst.zeroReg = 5'b11001;


IF_ID_Latch	b2v_inst1(
	.clk(clk13),
	.write(SYNTHESIZED_WIRE_1),
	.move(SYNTHESIZED_WIRE_2),
	.immediate(SYNTHESIZED_WIRE_3),
	.ReadMem(SYNTHESIZED_WIRE_4),
	.WriteMem(SYNTHESIZED_WIRE_5),
	.stall(stall),
	.ALU_operation(SYNTHESIZED_WIRE_6),
	.quarter(SYNTHESIZED_WIRE_7),
	.readReg0(SYNTHESIZED_WIRE_8),
	.readReg1(SYNTHESIZED_WIRE_9),
	.regToMem(SYNTHESIZED_WIRE_10),
	.writeReg(SYNTHESIZED_WIRE_11),
	.o_write(SYNTHESIZED_WIRE_30),
	.o_move(SYNTHESIZED_WIRE_13),
	.o_immediate(SYNTHESIZED_WIRE_14),
	.o_ReadMem(SYNTHESIZED_WIRE_28),
	.o_WriteMem(SYNTHESIZED_WIRE_29),
	.o_ALU_operation(SYNTHESIZED_WIRE_52),
	.o_quarter(SYNTHESIZED_WIRE_33),
	.o_readReg0(SYNTHESIZED_WIRE_17),
	.o_readReg1(SYNTHESIZED_WIRE_18),
	.o_regToMem(SYNTHESIZED_WIRE_19),
	.o_writeReg(SYNTHESIZED_WIRE_21));


Regfile	b2v_inst2(
	.clk(clk18),
	.write(SYNTHESIZED_WIRE_12),
	.move(SYNTHESIZED_WIRE_13),
	.immediate(SYNTHESIZED_WIRE_14),
	.ALU_operation(SYNTHESIZED_WIRE_52),
	.quarter(SYNTHESIZED_WIRE_16),
	.readReg0(SYNTHESIZED_WIRE_17),
	.readReg1(SYNTHESIZED_WIRE_18),
	.regToMem(SYNTHESIZED_WIRE_19),
	.writeData(SYNTHESIZED_WIRE_20),
	.writeReg(SYNTHESIZED_WIRE_21),
	.taken(SYNTHESIZED_WIRE_24),
	.address(SYNTHESIZED_WIRE_27),
	.dataToMem(SYNTHESIZED_WIRE_32),
	.readData0(SYNTHESIZED_WIRE_34),
	.readData1(SYNTHESIZED_WIRE_35));
	defparam	b2v_inst2.eq = 7;
	defparam	b2v_inst2.ez = 6;
	defparam	b2v_inst2.gte = 4;
	defparam	b2v_inst2.ltz = 5;
	defparam	b2v_inst2.ne = 8;


Fetch_Unit	b2v_inst3(
	.clk(clk10),
	.start(SYNTHESIZED_WIRE_22),
	.branch(SYNTHESIZED_WIRE_23),
	.taken(SYNTHESIZED_WIRE_24),
	.jump_sign(SYNTHESIZED_WIRE_25),
	.init(init),
	.pc_in(SYNTHESIZED_WIRE_26),
	.target(SYNTHESIZED_WIRE_27),
	.fetched_instruction(SYNTHESIZED_WIRE_0),
	.pc_out(SYNTHESIZED_WIRE_26));


ID_EX_latch	b2v_inst4(
	.clk(clk16),
	.ReadMem(SYNTHESIZED_WIRE_28),
	.WriteMem(SYNTHESIZED_WIRE_29),
	.write(SYNTHESIZED_WIRE_30),
	.ALUOp(SYNTHESIZED_WIRE_52),
	.DataIn(SYNTHESIZED_WIRE_32),
	.quarter(SYNTHESIZED_WIRE_33),
	.readData0(SYNTHESIZED_WIRE_34),
	.readData1(SYNTHESIZED_WIRE_35),
	.o_ReadMem(SYNTHESIZED_WIRE_39),
	.o_WriteMem(SYNTHESIZED_WIRE_40),
	.o_write(SYNTHESIZED_WIRE_41),
	.o_ALUOp(SYNTHESIZED_WIRE_36),
	.o_DataIn(SYNTHESIZED_WIRE_43),
	.o_quarter(SYNTHESIZED_WIRE_44),
	.o_readData0(SYNTHESIZED_WIRE_37),
	.o_readData1(SYNTHESIZED_WIRE_38));


ALU	b2v_inst5(
	.clk(clk19),
	.operation(SYNTHESIZED_WIRE_36),
	.readData0(SYNTHESIZED_WIRE_37),
	.readData1(SYNTHESIZED_WIRE_38),
	.result(SYNTHESIZED_WIRE_42));
	defparam	b2v_inst5.add = 0;
	defparam	b2v_inst5.eq = 7;
	defparam	b2v_inst5.evenLower = 3;
	defparam	b2v_inst5.evenUpper = 2;
	defparam	b2v_inst5.ez = 6;
	defparam	b2v_inst5.gte = 4;
	defparam	b2v_inst5.ltz = 5;
	defparam	b2v_inst5.ne = 8;
	defparam	b2v_inst5.sub = 1;


EX_MEM_latch	b2v_inst6(
	.clk(clk17),
	.ReadMem(SYNTHESIZED_WIRE_39),
	.WriteMem(SYNTHESIZED_WIRE_40),
	.write(SYNTHESIZED_WIRE_41),
	.DataAddress(SYNTHESIZED_WIRE_42),
	.DataIn(SYNTHESIZED_WIRE_43),
	.quarter(SYNTHESIZED_WIRE_44),
	.o_ReadMem(SYNTHESIZED_WIRE_48),
	.o_WriteMem(SYNTHESIZED_WIRE_49),
	.o_write(SYNTHESIZED_WIRE_45),
	.o_DataAddress(SYNTHESIZED_WIRE_50),
	.o_DataIn(SYNTHESIZED_WIRE_51),
	.o_quarter(SYNTHESIZED_WIRE_46));


MEM_WB_Latch	b2v_inst7(
	.clk(clk14),
	.write(SYNTHESIZED_WIRE_45),
	.stall(stall15),
	.quarter(SYNTHESIZED_WIRE_46),
	.writeData(SYNTHESIZED_WIRE_47),
	.o_write(SYNTHESIZED_WIRE_12),
	.o_quarter(SYNTHESIZED_WIRE_16),
	.o_writeData(SYNTHESIZED_WIRE_20));


RAM	b2v_inst8(
	.clk(clk12),
	.ReadMem(SYNTHESIZED_WIRE_48),
	.WriteMem(SYNTHESIZED_WIRE_49),
	.DataAddress(SYNTHESIZED_WIRE_50),
	.DataIn(SYNTHESIZED_WIRE_51),
	.DataOut(SYNTHESIZED_WIRE_47));


endmodule
