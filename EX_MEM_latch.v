`timescale 1ns / 1ps
module EX_MEM_latch(
	input clk,
	input  [15:0] DataAddress,      //data path to RAM
	output [15:0] o_DataAddress,
	input  		  ReadMem,
	input        WriteMem,         //control signal to RAM
	output 		 o_ReadMem,  
	output       o_WriteMem,
	input  [1:0]  quarter,			 //data path to regfile
	output [1:0] o_quarter,
	input  [15:0] DataIn,				//Data path to RAM
	output [15:0] o_DataIn,
	input write,
	output o_write,
	input [3:0] writeReg,
	output [3:0] o_writeReg
);

reg[15:0] _DataAddress, _DataIn;
reg [3:0] _writeReg;
reg[1:0]  _quarter;
reg _ReadMem, _WriteMem, _write;

reg[15:0] __DataAddress, __DataIn;
reg [3:0] __writeReg;
reg[1:0]  __quarter;
reg __ReadMem, __WriteMem, __write;

assign o_DataAddress = __DataAddress;
assign o_ReadMem = __ReadMem;
assign o_WriteMem = __WriteMem;
assign o_quarter = __quarter;
assign o_DataIn = __DataIn;
assign o_write = __write;
assign o_writeReg = __writeReg;


//input & write to registers
always@(negedge clk)
begin

	_DataAddress <= DataAddress;
	_ReadMem <= ReadMem;
	_quarter <= quarter;
	_DataIn <= DataIn;
	_write <= write;
	_writeReg <= writeReg;

end


//output
always@(posedge clk)
begin
	__DataAddress <= _DataAddress;
	__ReadMem <= _ReadMem;
	__quarter <= _quarter;
	__DataIn <= _DataIn;
	__write <= _write;
	__writeReg <= _writeReg;

end


endmodule