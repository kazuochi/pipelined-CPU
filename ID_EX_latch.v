`timescale 1ns / 1ps
module ID_EX_latch(
	input clk,
	input [15:0] readData0, //datapath to ALU
	input [15:0] readData1,
	output [15:0] o_readData0,
	output [15:0] o_readData1,
	input [3:0] ALUOp,			//control signal to ALU
	output [3:0] o_ALUOp,
	input [1:0] ReadMem,
	input       WriteMem,     //control signal to RAM
	output [1:0] o_ReadMem,  
	output       o_WriteMem,
	input [15:0] DataIn,     //data path for RAM
	output [15:0] o_DataIn,
	input [1:0] quarter,      //data path to regfile
	output [1:0] o_quarter
);

reg [15:0] _readData0, _readData1, _DataIn;
reg [3:0]  _ALUOp;
reg [1:0] _ReadMem, _quarter;
reg _WriteMem;

reg [15:0] __readData0, __readData1, __DataIn;
reg [3:0]  __ALUOp;
reg [1:0]  __ReadMem, __quarter;
reg __WriteMem;

assign o_readData0 = __readData0;
assign o_readData1 = __readData1;
assign o_ALUOp  = __ALUOp;
assign o_ReadMem = __ReadMem;
assign o_WriteMem = __WriteMem;
assign o_DataIn = __DataIn;
assign o_quarter = __quarter;

//input & write to registers
always@(negedge clk)
begin
	_readData0 <= readData0;
	_readData1 <= readData1;
	_ALUOp     <= ALUOp;
	_ReadMem  <= ReadMem;
	_WriteMem  <= WriteMem; 
	_DataIn <= DataIn;
	_quarter <= quarter;
end

//output
always@(posedge clk)
begin
	__readData0 <= _readData0;
	__readData1 <= _readData1;
	__ALUOp     <= _ALUOp;
	__ReadMem  <= _ReadMem;
	__WriteMem  <= _WriteMem; 
	__DataIn <= _DataIn;
	__quarter <= _quarter;
end

endmodule