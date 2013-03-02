`timescale 1ns / 1ps
module MEM_WB_Latch
(
	input clk,
	input write,
	input [1:0]quarter,
	input stall,
	output o_write,
	output [1:0]o_quarter,
 );
 
 reg _write, [1:0]_quarter, __write, [1:0]__quarter;
 
 assign o_write 			= 	__write;
 assign o_quarter 		= 	__quarter;
 
 
 always @(negedge clk) begin
	if(!stall)
	begin
		_write			= write;
		_memToRg			= quarter;
	end
 end
 
 always @(posedge clk) begin
	if(!stall)
	begin
		__write			= _write;
		__quarter		= _quarter;
	end
 end

endmodule