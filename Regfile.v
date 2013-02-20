`timescale 1ns / 1ps
module Regfile
(input clk,
 input write,
 input [3:0] writeReg,
 input [15:0] writeData,
 input [3:0] readReg0,
 output [15:0] readData0,
 input [3:0] readReg1,
 output [15:0] readData1,
 output [15:0] regToMem,
 input move,
 input immediate,
 output [15:0] address,
 input set_quarter
 );
 
 reg[15:0] reg0, reg1, reg2, reg3, adr, math, cmp, cnt, _writeData, _writeReg, _regToMem;
 
 
 assign readData0 = readReg0 == 0 ? reg0 :
						  readReg0 == 1 ? reg1 :
						  readReg0 == 2 ? reg2 :
						  readReg0 == 3 ? reg3 : 
						  readReg0 == 4 ? adr :
						  readReg0 == 5 ? math:
						  readReg0 == 6 ? cmp :
						  readReg0 == 7 ? cnt : 0;
						  
 assign readData1 = readReg1 == 0 ? reg0 :
						  readReg1 == 1 ? reg1 :
						  readReg1 == 2 ? reg2 :
						  readReg1 == 3 ? reg3 :
						  readReg1 == 4 ? adr :
						  readReg1 == 5 ? math:
						  readReg1 == 6 ? cmp :
						  readReg1 == 7 ? cnt : 0;	
						  
assign regToMem = _regToMem;
assign address = adr;

		
always @(posedge clk) begin
	_writeData = writeData;
	_writeReg = writeReg;
	_regToMem = writeReg;
	if(immediate)
	begin
		_writeData = readReg0;
	end
	if(move)
	begin
		_writeData = readData0;
	end
	
	if (write)
	begin
		if(set_quarter)
		begin
			case(readReg1)
				0: begin _writeData = _writeData[3:0]; end
				1: begin _writeData = _writeData[7:4]; end
				2: begin _writeData = _writeData[11:8]; end
				3: begin _writeData = _writeData[15:12]; end
				endcase
		end
		
		case (_writeReg)
			3'b000: begin
				reg0 <= _writeData;
			end
			3'b001: begin
				reg1 <= _writeData;
			end
			3'b010: begin
				reg2 <= _writeData;
			end
			3'b011: begin
				reg3 <= _writeData;
			end
			3'b100: begin
				adr <= _writeData;
			end
			3'b101: begin
				math <= _writeData;
			end
			3'b110: begin
				cmp <= _writeData;
			end
			3'b111: begin
				cnt <= _writeData;
			end
		endcase
	end
end
endmodule

	 