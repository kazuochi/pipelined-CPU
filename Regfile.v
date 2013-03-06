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
 output [15:0] target,
 input [1:0] quarter,
 input [3:0]ALU_operation,
 output taken
 );
 
 reg[15:0] reg0=0, reg1=0, reg2=0, reg3=0, adr=0, math=0, cmp=0, cnt=0, _writeData=0, _writeReg=0, _readData0;
 reg _taken;

 
 
 assign readData0 = immediate == 1 ? readReg0 :
						  readReg0 == 0 ? reg0 :
						  readReg0 == 1 ? reg1 :
						  readReg0 == 2 ? reg2 :
						  readReg0 == 3 ? reg3 :
						  readReg0 == 4 ? adr  :
						  readReg0 == 5 ? math :
						  readReg0 == 6 ? cmp  :
						  readReg0 == 7 ? cnt  : 0;
 
 assign readData1 = immediate== 1 ? 0    :
						  move	  == 1 ? 0    :
						  readReg1 == 0 ? reg0 :
						  readReg1 == 1 ? reg1 :
						  readReg1 == 2 ? reg2 :
						  readReg1 == 3 ? reg3 :
						  readReg1 == 4 ? adr  :
						  readReg1 == 5 ? math :
						  readReg1 == 6 ? cmp  :
						  readReg1 == 7 ? cnt  : 0;	
						  
assign dataToMem =  regToMem == 0 ? reg0 :
						  regToMem == 1 ? reg1 :
						  regToMem == 2 ? reg2 :
						  regToMem == 3 ? reg3 : 0;
						  
assign target   = adr;
assign taken 	  = _taken;

parameter
		gte			= 4,
		ltz			= 5,
		ez				= 6,
		eq				= 7,
		ne				= 8;
		
always @(*) begin
	_writeData = writeData;
	_writeReg = writeReg;
	
	case(ALU_operation)
		
		gte: begin
			if(readData0 >= readData1)
			begin
				_taken <= 1;
			end
			else
			begin
				_taken <= 0;
			end
		end
		ltz: begin
			if(readData0[15] == 1)  //assuming readData0 cannot be large positive values
			begin
				_taken <= 1;
			end
			else
			begin
				_taken <= 0;
			end
		end
		ez: begin
			if(readData0 == 0)
			begin
				_taken <= 1;
			end
			else
			begin
				_taken <= 0;
			end
		end
		eq: begin
			if(readData0 == readData1)
			begin
				_taken <= 1;
			end
			else
			begin
				_taken <= 0;
			end
		end
		ne: begin
			if(readData0 != readData1)
			begin
				_taken <= 1;
			end
			else
			begin
				_taken <= 0;
			end
		end
		default: begin end
		
	endcase
	
	
	if (write)
	begin
		
		case (_writeReg)
		
			3'b000: begin
				
				case(quarter)
					0: begin reg0[3:0]	= _writeData[3:0]; end
					1: begin reg0[7:4] 	= _writeData[3:0]; end
					2: begin reg0[11:8] 	= _writeData[3:0]; end
					3: begin reg0[15:12] = _writeData[3:0]; end
					default: begin reg0 			= _writeData; end
				endcase
				
			end
			
			3'b001: begin
				
				case(quarter)
					0: begin reg1[3:0]	= _writeData[3:0]; end
					1: begin reg1[7:4] 	= _writeData[3:0]; end
					2: begin reg1[11:8] 	= _writeData[3:0]; end
					3: begin reg1[15:12] = _writeData[3:0]; end
					default: begin reg1 = _writeData; end
				endcase
				
			end
			
			3'b010: begin
				
				case(quarter)
					0: begin reg2[3:0]	= _writeData[3:0]; end
					1: begin reg2[7:4] 	= _writeData[3:0]; end
					2: begin reg2[11:8] 	= _writeData[3:0]; end
					3: begin reg2[15:12] = _writeData[3:0]; end
					default: begin reg2 = _writeData; end
				endcase
				
			end
			
			3'b011: begin
				
				case(quarter)
					0: begin reg3[3:0]	= _writeData[3:0]; end
					1: begin reg3[7:4] 	= _writeData[3:0]; end
					2: begin reg3[11:8] 	= _writeData[3:0]; end
					3: begin reg3[15:12] = _writeData[3:0]; end
					default: begin reg3 = _writeData; end
				endcase
				
			end
			
			3'b100: begin
				
				case(quarter)
					0: begin adr[3:0]	= _writeData[3:0]; end
					1: begin adr[7:4] 	= _writeData[3:0]; end
					2: begin adr[11:8] 	= _writeData[3:0]; end
					3: begin adr[15:12] = _writeData[3:0]; end
					default: begin adr = _writeData; end
				endcase
				
			end
			
			3'b101: begin
				
				case(quarter)
					0: begin math[3:0]	= _writeData[3:0]; end
					1: begin math[7:4] 	= _writeData[3:0]; end
					2: begin math[11:8] 	= _writeData[3:0]; end
					3: begin math[15:12] = _writeData[3:0]; end
					default: begin math = _writeData; end
				endcase
				
			end
			
			3'b110: begin

				case(quarter)
					0: begin cmp[3:0]	= _writeData[3:0]; end
					1: begin cmp[7:4] 	= _writeData[3:0]; end
					2: begin cmp[11:8] 	= _writeData[3:0]; end
					3: begin cmp[15:12] = _writeData[3:0]; end
					default: begin cmp = _writeData; end
				endcase
			end
			
			3'b111: begin
				
				case(quarter)
					0: begin cnt[3:0]	= _writeData[3:0]; end
					1: begin cnt[7:4] 	= _writeData[3:0]; end
					2: begin cnt[11:8] 	= _writeData[3:0]; end
					3: begin cnt[15:12] = _writeData[3:0]; end
					default: begin cnt = _writeData; end
				endcase
				
			end
			
		endcase
	end
end
endmodule

	 