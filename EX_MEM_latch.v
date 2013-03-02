`timescale 1ns / 1ps
module EX_MEM_latch(
	input clk,
	input  [15:0] DataAddress,      //data path to RAM
	output [15:0] o_DataAddress,
	input  [1:0]  ReadMem,
	input        WriteMem,         //control signal to RAM
	output [1:0] o_ReadMem,  
	output       o_WriteMem,
	input  [1:0]  quarter,			 //data path to regfile
	output [1:0] o_quarter,
	input  [15:0] DataIn,				//Data path to RAM
	output [15:0] o_DataIn
);

reg[15:0] _DataAddress, _DataIn;
reg[1:0] _ReadMem, _quarter;
reg _WriteMem;

reg[15:0] __DataAddress, __DataIn;
reg[1:0] __ReadMem, __quarter;
reg __WriteMem;

assign o_DataAddress = __DataAddress;
assign o_ReadMem = __ReadMem;
assign o_WriteMem = __WriteMem;
assign o_quarter = __quarter;
assign o_DataIn = __DataIn;


//input & write to registers
always@(negedge clk)
begin

	_DataAddress <= DataAddress;
	_ReadMem <= ReadMem;
	_quarter <= quarter;
	_DataIn <= DataIn;

end


//output
always@(posedge clk)
begin
	__DataAddress <= _DataAddress;
	__ReadMem <= _ReadMem;
	__quarter <= _quarter;
	__DataIn <= _DataIn;

end


endmodule