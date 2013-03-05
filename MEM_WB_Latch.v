`timescale 1ns / 1ps
module MEM_WB_Latch
(
	input clk,
	input write,
	input [1:0]quarter,
	input [3:0] writeReg,
	output o_write,
	output [1:0]o_quarter,
	input [15:0] writeData,
	output [15:0] o_writeData,
	output [3:0] o_writeReg
 );
 
 reg _write, __write;
 reg [1:0]_quarter, __quarter;
 reg [15:0] _writeData, __writeData;
 reg [3:0] _writeReg, __writeReg;
 
 assign o_write 			= 	__write;
 assign o_quarter 		= 	__quarter;
 assign o_writeData     = __writeData;
 assign o_writeReg		= __writeReg;
 
 
 always @(negedge clk) begin
	begin
		_write			= write;
		_quarter			= quarter;
		_writeData		= writeData;
		_writeReg		= writeReg;
	end
 end
 
 always @(posedge clk) begin
	begin
		__write			= _write;
		__quarter		= _quarter;
		__writeData		= _writeData;
		__writeReg		= _writeReg;
	end
 end

endmodule