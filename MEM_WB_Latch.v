`timescale 1ns / 1ps
module MEM_WB_Latch
(
	input clk,
	input write,
	input quarter,
	input stall,
	output o_write,
	output o_quarter,
 );
 
 reg _write, _quarter, __write, __quarter;
 
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