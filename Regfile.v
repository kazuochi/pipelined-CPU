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
 input [1:0] regToMem,
 output [15:0] dataToMem,
 input move,
 input immediate,
 output [15:0] address,
 input set_quarter
 );
 
 reg[15:0] reg0=0, reg1=0, reg2=0, reg3=0, adr=0, math=0, cmp=0, cnt=0, _writeData=0, _writeReg=0;

 
 
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
						  
assign dataToMem =  regToMem == 0 ? reg0 :
						  regToMem == 1 ? reg1 :
						  regToMem == 2 ? reg2 :
						  regToMem == 3 ? reg3 : 0;
						  
assign address = adr;

		
always @(posedge clk) begin
	_writeData = writeData;
	_writeReg = writeReg;
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
		
		case (_writeReg)
		
			3'b000: begin
				if(set_quarter)
				begin
					case(readReg1)
						0: begin reg0[3:0]	= _writeData[3:0]; end
						1: begin reg0[7:4] 	= _writeData[3:0]; end
						2: begin reg0[11:8] 	= _writeData[3:0]; end
						3: begin reg0[15:12] = _writeData[3:0]; end
						endcase
				end
				else
				begin
					reg0 = _writeData;
				end
			end
			
			3'b001: begin
				if(set_quarter)
				begin
					case(readReg1)
						0: begin reg1[3:0]	= _writeData[3:0]; end
						1: begin reg1[7:4] 	= _writeData[3:0]; end
						2: begin reg1[11:8] 	= _writeData[3:0]; end
						3: begin reg1[15:12] = _writeData[3:0]; end
						endcase
				end
				else
				begin
					reg1 = _writeData;
				end
			end
			
			3'b010: begin
				if(set_quarter)
				begin
					case(readReg1)
						0: begin reg2[3:0]	= _writeData[3:0]; end
						1: begin reg2[7:4] 	= _writeData[3:0]; end
						2: begin reg2[11:8] 	= _writeData[3:0]; end
						3: begin reg2[15:12] = _writeData[3:0]; end
						endcase
				end
				else
				begin
					reg2 = _writeData;
				end
			end
			
			3'b011: begin
				if(set_quarter)
				begin
					case(readReg1)
						0: begin reg3[3:0]	= _writeData[3:0]; end
						1: begin reg3[7:4] 	= _writeData[3:0]; end
						2: begin reg3[11:8] 	= _writeData[3:0]; end
						3: begin reg3[15:12] = _writeData[3:0]; end
						endcase
				end
				else
				begin
					reg3 = _writeData;
				end
			end
			
			3'b100: begin
				if(set_quarter)
				begin
					case(readReg1)
						0: begin adr[3:0]	= _writeData[3:0]; end
						1: begin adr[7:4] 	= _writeData[3:0]; end
						2: begin adr[11:8] 	= _writeData[3:0]; end
						3: begin adr[15:12] = _writeData[3:0]; end
						endcase
				end
				else
				begin
					adr = _writeData;
				end
			end
			
			3'b101: begin
				if(set_quarter)
				begin
					case(readReg1)
						0: begin math[3:0]	= _writeData[3:0]; end
						1: begin math[7:4] 	= _writeData[3:0]; end
						2: begin math[11:8] 	= _writeData[3:0]; end
						3: begin math[15:12] = _writeData[3:0]; end
						endcase
				end
				else
				begin
					math = _writeData;
				end
			end
			
			3'b110: begin
				if(set_quarter)
				begin
					case(readReg1)
						0: begin cmp[3:0]	= _writeData[3:0]; end
						1: begin cmp[7:4] 	= _writeData[3:0]; end
						2: begin cmp[11:8] 	= _writeData[3:0]; end
						3: begin cmp[15:12] = _writeData[3:0]; end
						endcase
				end
				else
				begin
					cmp = _writeData;
				end
			end
			
			3'b111: begin
				if(set_quarter)
				begin
					case(readReg1)
						0: begin cnt[3:0]	= _writeData[3:0]; end
						1: begin cnt[7:4] 	= _writeData[3:0]; end
						2: begin cnt[11:8] 	= _writeData[3:0]; end
						3: begin cnt[15:12] = _writeData[3:0]; end
						endcase
				end
				else
				begin
					cnt = _writeData;
				end
			end
			
		endcase
	end
end
endmodule

	 