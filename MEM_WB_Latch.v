`timescale 1ns / 1ps
module MEM_WB_Latch
(
	input clk,
	input write,
	input [1:0]quarter,
	input stall,
	output o_write,
	output [1:0]o_quarter,
	input [15:0] writeData,
	output [15:0] o_writeData
 );
 
 reg _write, __write;
 reg [1:0]_quarter, __quarter;
 reg [15:0] _writeData, __writeData;
 
 assign o_write 			= 	__write;
 assign o_quarter 		= 	__quarter;
 assign o_writeData     = __writeData;
 
 
 always @(negedge clk) begin
	if(!stall)
	begin
		_write			= write;
		_quarter			= quarter;
		_writeData = writeData;
	end
 end
 
 always @(posedge clk) begin
	if(!stall)
	begin
		__write			= _write;
		__quarter		= _quarter;
		__writeData = _writeData;
	end
 end

endmodule