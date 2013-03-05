`timescale 1ns / 1ps
module IF_ID_Latch
(
	input clk,
	input write,
	input [3:0] writeReg,
	input [3:0] readReg0,
	input [3:0] readReg1,
	input [1:0] regToMem,
	input move,
	input immediate,
	input [1:0] quarter,
	input [3:0]ALU_operation,
	input ReadMem,
	input WriteMem,
	input stall,
	output o_write,
	output [3:0] o_writeReg,
	output [3:0] o_readReg0,
	output [3:0] o_readReg1,
	output [1:0] o_regToMem,
	output o_move,
	output o_immediate,
	output [1:0] o_quarter,
	output [3:0] o_ALU_operation,
	output o_ReadMem,
	output o_WriteMem
 );
 
 reg _write, _move, _immediate, _ReadMem, _WriteMem, __write, __move, __immediate, __ReadMem, __WriteMem;
 reg [3:0] _writeReg, _readReg0, _readReg1, _ALU_operation, __writeReg, __readReg0, __readReg1, __ALU_operation;
 reg [1:0] _regToMem, __regToMem,__quarter,_quarter;
 
 assign o_write 			= 	__write;
 assign o_writeReg 		= 	__writeReg;
 assign o_readReg0 		= 	__readReg0; 
 assign o_readReg1 		= 	__readReg1;
 assign o_regToMem 		= 	__regToMem;
 assign o_move 			= 	__move;
 assign o_immediate 		= 	__immediate;
 assign o_quarter 		= 	__quarter;
 assign o_ALU_operation	=	__ALU_operation;
 assign o_ReadMem			=	__ReadMem;
 assign o_WriteMem		=	__WriteMem;
 
 always @(negedge clk) begin
	if(!stall)
	begin
		_write			= write;
		_move				= move;
		_immediate		= immediate;
		_quarter			= quarter;
		_ReadMem			= ReadMem;
		_WriteMem		= WriteMem;
		_writeReg		= writeReg;
		_readReg0		= readReg0;
		_readReg1		= readReg1;
		_ALU_operation	= ALU_operation;
		_regToMem      = regToMem;
	end
 end
 
 always @(posedge clk) begin
	if(!stall)
	begin
		__write			= _write;
		__move			= _move;
		__immediate		= _immediate;
		__quarter		= _quarter;
		__ReadMem		= _ReadMem;
		__WriteMem		= _WriteMem;
		__writeReg		= _writeReg;
		__readReg0		= _readReg0;
		__readReg1		= _readReg1;
		__ALU_operation= _ALU_operation;
		__regToMem     = _regToMem;
		
	end
 end

endmodule