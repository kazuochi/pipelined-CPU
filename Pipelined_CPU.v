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
input wire	clk16;
input wire	clk17;
input wire	clk18;
input wire	clk19;
output wire	halted;


wire	[8:0] _instruction_in;
wire	_write;
wire	_move;
wire	_immediate;
wire	_ReadMem;
wire	SYNTHESIZED_WIRE_5;
wire	[3:0] _ALU_operation;
wire	[1:0] _quarter;
wire	[3:0] _readReg0;
wire	[3:0] _readReg1;
wire	[1:0] _regToMem;
wire	[3:0] _writeReg;
wire	SYNTHESIZED_WIRE_12;
wire	_o_move;
wire	_o_immediate;
wire	[3:0] _o_ALU_operation;
wire	[1:0] SYNTHESIZED_WIRE_16;
wire	[3:0] _o_readReg0;
wire	[3:0] _o_readReg1;
wire	[1:0] _o_regToMem;
wire	[15:0] SYNTHESIZED_WIRE_20;
wire	[3:0] _o_writeReg;
wire	_start;

wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	[15:0] SYNTHESIZED_WIRE_26;
wire	[15:0] SYNTHESIZED_WIRE_27;
wire	_o_ReadMem;
wire	_o_WriteMem;
wire	_o_write;
wire	[15:0] SYNTHESIZED_WIRE_32;
wire	[1:0] _o_quarter;
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
wire 	CNTRL_TO_IF_ID_WriteMem;
wire	[3:0] CNTRL_TO_IF_ID_writeReg;
wire	[3:0] ID_EX_TO_EX_MEM_writeReg;
wire	[3:0] IF_ID_TO_ID_EX_writeReg;
wire	[3:0] EX_MEM_TO_MEM_WB_writeReg;
wire	[3:0] MEM_WB_TO_Regfile_writeReg;



Control_Unit	Control_Unit(
	.clk(clk),
	.instruction_in(_instruction_in),
	.start(_start),
	.branch(SYNTHESIZED_WIRE_23),
	.write(_write),
	.move(_move),
	.MemtoReg(_ReadMem),
	.MemWrite(CNTRL_TO_IF_ID_WriteMem),
	.jump_sign(SYNTHESIZED_WIRE_25),
	.immediate(_immediate),
	.halted(halted),
	.ALUOp(_ALU_operation),
	.quarter(_quarter),
	.readReg0(_readReg0),
	.readReg1(_readReg1),
	.regToMem(_regToMem),
	.write_reg(CNTRL_TO_IF_ID_writeReg));
	defparam	Control_Unit.add = 5'b00000;
	defparam	Control_Unit.be = 5'b01111;
	defparam	Control_Unit.bez = 5'b10001;
	defparam	Control_Unit.bgte = 5'b10011;
	defparam	Control_Unit.bltz = 5'b10010;
	defparam	Control_Unit.bne = 5'b10000;
	defparam	Control_Unit.evl = 5'b10101;
	defparam	Control_Unit.evu = 5'b10100;
	defparam	Control_Unit.halt = 5'b11010;
	defparam	Control_Unit.jump = 5'b11000;
	defparam	Control_Unit.ld = 5'b10110;
	defparam	Control_Unit.mathToAdr = 5'b01001;
	defparam	Control_Unit.mv = 5'b00010;
	defparam	Control_Unit.mvAdr = 5'b00100;
	defparam	Control_Unit.mvCnt = 5'b01100;
	defparam	Control_Unit.mvMath = 5'b00111;
	defparam	Control_Unit.mvToAdr = 5'b00011;
	defparam	Control_Unit.mvToCnt = 5'b01101;
	defparam	Control_Unit.mvToMath = 5'b01000;
	defparam	Control_Unit.rsAdr = 5'b00101;
	defparam	Control_Unit.rsCnt = 5'b01110;
	defparam	Control_Unit.setCnt = 5'b01011;
	defparam	Control_Unit.seti = 5'b00110;
	defparam	Control_Unit.setReg = 5'b01010;
	defparam	Control_Unit.st = 5'b10111;
	defparam	Control_Unit.sub = 5'b00001;
	defparam	Control_Unit.toBeDefined = 5'b11011;
	defparam	Control_Unit.zeroReg = 5'b11001;


IF_ID_Latch	IF_ID_Latch(
	.clk(clk13),
	.write(_write),
	.move(_move),
	.immediate(_immediate),
	.ReadMem(_ReadMem),
	.WriteMem(CNTRL_TO_IF_ID_WriteMem),
	.stall(stall),
	.ALU_operation(_ALU_operation),
	.quarter(_quarter),
	.readReg0(_readReg0),
	.readReg1(_readReg1),
	.regToMem(_regToMem),
	.writeReg(CNTRL_TO_IF_ID_writeReg),
	.o_write(_o_write),
	.o_move(_o_move),
	.o_immediate(_o_immediate),
	.o_ReadMem(_o_ReadMem),
	.o_WriteMem(_o_WriteMem),
	.o_ALU_operation(_o_ALU_operation),
	.o_quarter(_o_quarter),
	.o_readReg0(_o_readReg0),
	.o_readReg1(_o_readReg1),
	.o_regToMem(_o_regToMem),
	.o_writeReg(ID_EX_TO_EX_MEM_writeReg));


Regfile	Regfile(
	.clk(clk18),
	.write(SYNTHESIZED_WIRE_12),
	.move(_o_move),
	.immediate(_o_immediate),
	.ALU_operation(_o_ALU_operation),
	.quarter(SYNTHESIZED_WIRE_16),
	.readReg0(_o_readReg0),
	.readReg1(_o_readReg1),
	.regToMem(_o_regToMem),
	.writeData(SYNTHESIZED_WIRE_20),
	.writeReg(_o_writeReg),
	.taken(SYNTHESIZED_WIRE_24),
	.address(SYNTHESIZED_WIRE_27),
	.dataToMem(SYNTHESIZED_WIRE_32),
	.readData0(SYNTHESIZED_WIRE_34),
	.readData1(SYNTHESIZED_WIRE_35));

	defparam	Regfile.eq = 7;
	defparam	Regfile.ez = 6;
	defparam	Regfile.gte = 4;
	defparam	Regfile.ltz = 5;
	defparam	Regfile.ne = 8;


Fetch_Unit	Fetch_Unit(
	.clk(clk10),
	.start(_start),
	.branch(SYNTHESIZED_WIRE_23),
	.taken(SYNTHESIZED_WIRE_24),
	.jump_sign(SYNTHESIZED_WIRE_25),
	.init(init),
	.pc_in(SYNTHESIZED_WIRE_26),
	.target(SYNTHESIZED_WIRE_27),
	.fetched_instruction(_instruction_in),
	.pc_out(SYNTHESIZED_WIRE_26));


ID_EX_latch	ID_EX_latch(
	.clk(clk16),
	.ReadMem(_o_ReadMem),
	.WriteMem(_o_WriteMem),
	.write(_o_write),
	.writeReg(IF_ID_TO_ID_EX_writeReg),
	.ALUOp(_o_ALU_operation),
	.DataIn(SYNTHESIZED_WIRE_32),
	.quarter(_o_quarter),
	.readData0(SYNTHESIZED_WIRE_34),
	.readData1(SYNTHESIZED_WIRE_35),
	.o_ReadMem(SYNTHESIZED_WIRE_39),
	.o_WriteMem(SYNTHESIZED_WIRE_40),
	.o_write(SYNTHESIZED_WIRE_41),
	.o_writeReg(ID_EX_TO_EX_MEM_writeReg),
	.o_ALUOp(SYNTHESIZED_WIRE_36),
	.o_DataIn(SYNTHESIZED_WIRE_43),
	.o_quarter(SYNTHESIZED_WIRE_44),
	.o_readData0(SYNTHESIZED_WIRE_37),
	.o_readData1(SYNTHESIZED_WIRE_38));


ALU	ALU(
	.clk(clk19),
	.operation(SYNTHESIZED_WIRE_36),
	.readData0(SYNTHESIZED_WIRE_37),
	.readData1(SYNTHESIZED_WIRE_38),
	.result(SYNTHESIZED_WIRE_42));
	defparam	ALU.add = 0;
	defparam	ALU.eq = 7;
	defparam	ALU.evenLower = 3;
	defparam	ALU.evenUpper = 2;
	defparam	ALU.ez = 6;
	defparam	ALU.gte = 4;
	defparam	ALU.ltz = 5;
	defparam	ALU.ne = 8;
	defparam	ALU.sub = 1;


EX_MEM_latch	EX_MEM_latch(
	.clk(clk17),
	.ReadMem(SYNTHESIZED_WIRE_39),
	.WriteMem(SYNTHESIZED_WIRE_40),
	.write(SYNTHESIZED_WIRE_41),
	.writeReg(ID_EX_TO_EX_MEM_writeReg),
	.DataAddress(SYNTHESIZED_WIRE_42),
	.DataIn(SYNTHESIZED_WIRE_43),
	.quarter(SYNTHESIZED_WIRE_44),
	.o_ReadMem(SYNTHESIZED_WIRE_48),
	.o_WriteMem(SYNTHESIZED_WIRE_49),
	.o_write(SYNTHESIZED_WIRE_45),
	.o_writeReg(EX_MEM_TO_MEM_WB_writeReg),
	.o_DataAddress(SYNTHESIZED_WIRE_50),
	.o_DataIn(SYNTHESIZED_WIRE_51),
	.o_quarter(SYNTHESIZED_WIRE_46));


MEM_WB_Latch	MEM_WB_Latch(
	.clk(clk14),
	.write(SYNTHESIZED_WIRE_45),
	.quarter(SYNTHESIZED_WIRE_46),
	.writeData(SYNTHESIZED_WIRE_47),
	.writeReg(EX_MEM_TO_MEM_WB_writeReg),
	.o_write(SYNTHESIZED_WIRE_12),
	.o_quarter(SYNTHESIZED_WIRE_16),
	.o_writeData(SYNTHESIZED_WIRE_20),
	.o_writeReg(MEM_WB_TO_Regfile_writeReg));


RAM	RAM(
	.clk(clk12),
	.ReadMem(SYNTHESIZED_WIRE_48),
	.WriteMem(SYNTHESIZED_WIRE_49),
	.DataAddress(SYNTHESIZED_WIRE_50),
	.DataIn(SYNTHESIZED_WIRE_51),
	.DataOut(SYNTHESIZED_WIRE_47));


endmodule
