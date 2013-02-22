`timescale 1ns / 1ps
module InstructionROM2(
	input clk,
   input [15:0]pc, 
	output [8:0] instruction);
	
reg [8:0]_instOut;
assign instruction = _instOut;

parameter
		add			= 5'b00000,
		sub    		= 5'b00001,
		mv				= 5'b00010,
		setAdr    	= 5'b00011,
		mvAdr			= 5'b00100,
		rsAdr			= 5'b00101,
		seti			= 5'b00110,
		mvMath		= 5'b00111,
		mvToMath		= 5'b01000,
		mathToAdr	= 5'b01001,
		setReg		= 5'b01010,
		setCnt		= 5'b01011,
		mvCnt		   = 5'b01100,
		mvToCnt		= 5'b01101,
		rsCnt			= 5'b01110,
		be				= 5'b01111,
		bne			= 5'b10000,
		bez			= 5'b10001,
		bltz		   = 5'b10010,
		bgte			= 5'b10011,
		evu			= 5'b10100,
		evl			= 5'b10101,
		ld				= 5'b10110,
		st		   	= 5'b10111,
		jump			= 5'b11000,
		zeroReg		= 5'b11001,
		halt			= 5'b11010,
		toBeDefined	= 5'b11011;

always @ (*)
begin
    case(pc)
		  //----- Factorial Begin
        1:  begin _instOut={seti,			4'b0000}; end
        2:  begin _instOut={mathToAdr,		4'b0000}; end
		  3:  begin _instOut={zeroReg,		4'b0000}; end
		  4:  begin _instOut={ld,				4'b0010}; end
		  5:  begin _instOut={mv,				4'b1001}; end
		  6:  begin _instOut={seti,			4'b0001}; end
		  7:  begin _instOut={sub,				4'b0110}; end
		  8:  begin _instOut={mv,				4'b1011}; end
		  9:  begin _instOut={rsAdr,			4'b0001}; end
		  10: begin _instOut={seti,			4'b1000}; end
		  11: begin _instOut={mathToAdr,		4'b0000}; end
		  12: begin _instOut={seti,			4'b0001}; end
		  13: begin _instOut={mathToAdr,		4'b0100}; end
		  14: begin _instOut={bez,				4'b1100}; end		
		  //----- Multiply Begin
		  //$0=total, $1=op1, $2=op2 
		  15: begin _instOut={rsAdr,			4'b0001}; end
		  16: begin _instOut={seti,			4'b1001}; end
		  17: begin _instOut={mathToAdr,		4'b0000}; end
		  18: begin _instOut={bez,				4'b1000}; end
		  19: begin _instOut={mvToMath,		4'b0000}; end
		  20: begin _instOut={add,				4'b0100}; end
		  21: begin _instOut={seti,			4'b0001}; end
		  22: begin _instOut={sub,				4'b1010}; end
		  23: begin _instOut={rsAdr,			4'b0000}; end
		  24: begin _instOut={seti,			4'b1011}; end
		  25: begin _instOut={mathToAdr,		4'b0000}; end
		  26: begin _instOut={jump,			4'b0000}; end
		  //----- Multiply End
		  27: begin _instOut={mv,				4'b0001}; end
		  28: begin _instOut={zeroReg,		4'b0000}; end
		  29: begin _instOut={seti,			4'b0001}; end
		  30: begin _instOut={sub,				4'b1111}; end
		  31: begin _instOut={mv,				4'b1110}; end
		  32: begin _instOut={rsAdr,			4'b0000}; end
		  33: begin _instOut={seti,			4'b1100}; end
		  34: begin _instOut={mathToAdr,		4'b0000}; end
		  35: begin _instOut={seti,			4'b0001}; end
		  36: begin _instOut={mathToAdr,		4'b0100}; end
		  37: begin _instOut={jump,			4'b0000}; end
		  //----- Factorial End
		  38: begin _instOut={rsAdr,			4'b0001}; end
		  39: begin _instOut={seti,			4'b1111}; end
		  40: begin _instOut={mathToAdr,		4'b0000}; end
		  41: begin _instOut={zeroReg,		4'b0000}; end
		  42: begin _instOut={st,				4'b0001}; end		  
		  
        default: begin _instOut={halt,			4'b0000}; end //halt
    endcase

end
endmodule



















