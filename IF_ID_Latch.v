`timescale 1ns / 1ps
module IF_ID_Latch
(
	input clk,
	input write,
	input [4:0] writeReg,
	input [3:0] readReg0,
	input [3:0] readReg1,
	input [1:0] regToMem,
	input move,
	input immediate,
	input [1:0] quarter,
	input [3:0]ALU_operation,
	input ReadMem,
	input WriteMem,
	input jump_sign,
	input branch,
	output o_write,
	output [4:0] o_writeReg,
	output [3:0] o_readReg0,
	output [3:0] o_readReg1,
	output [1:0] o_regToMem,
	output o_move,
	output o_immediate,
	output [1:0] o_quarter,
	output [3:0] o_ALU_operation,
	output o_ReadMem,
	output o_WriteMem,
	output o_jump_sign,
	output o_branch,
	input hazard_detected

 );
 
 reg _write, _move, _immediate, _ReadMem, _WriteMem, _jump_sign, _branch, __write, __move, __immediate, __ReadMem, __WriteMem, __jump_sign, __branch;
 reg [3:0]  _readReg0, _readReg1, _ALU_operation, __readReg0, __readReg1, __ALU_operation;
 reg [4:0] _writeReg,__writeReg;
 reg [1:0] _regToMem, __regToMem,__quarter,_quarter;
 integer _dynamic_count;
 integer _cycle_count;
 
 initial begin
 _dynamic_count = 0;
 _cycle_count = 0;
 end
 
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
 assign o_jump_sign     =  __jump_sign;
 assign o_branch        =  __branch;
 
 always @(negedge clk) begin
	if(hazard_detected)
		begin
			_cycle_count   = _cycle_count + 1;
			_write			= 0;
			_move				= 0;
			_immediate		= 0;
			_quarter			= 0;
			_ReadMem			= 0;
			_WriteMem		= 0;
			_writeReg		= 5'b11111;
			_readReg0		= 0;
			_readReg1		= 0;
			_ALU_operation	= 0;
			_regToMem      = 0;
			_jump_sign     = 0;
			_branch        = 0;
		end
	else
		begin
		   _cycle_count   = _cycle_count + 1;
		 	_dynamic_count = _dynamic_count + 1;
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
			_jump_sign     = jump_sign;
			_branch        = branch;
		end
	
 end
 
 always @(posedge clk) begin
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
		__jump_sign    = _jump_sign;
		__branch       = _branch;
 end

endmodule