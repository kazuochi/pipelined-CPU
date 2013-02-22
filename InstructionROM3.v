`timescale 1ns / 1ps
module InstructionROM3(
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
        1:  begin _instOut={rsCnt,			4'b0000}; end
		  2:  begin _instOut={seti,			4'b0000}; end
		  3:  begin _instOut={setReg,			4'b0000}; end
		  4:  begin _instOut={seti,			4'b0010}; end
		  5:  begin _instOut={setReg,			4'b0100}; end
		  6:  begin _instOut={mvCnt,			4'b0001}; end
		  7:  begin _instOut={rsAdr,			4'b0001}; end
		  8:  begin _instOut={seti,			4'b1010}; end
		  9:  begin _instOut={mathToAdr,		4'b0000}; end
		  10: begin _instOut={seti,			4'b0100}; end
		  11: begin _instOut={mathToAdr,		4'b0001}; end
		  12: begin _instOut={bgte,			4'b0100}; end
		  13: begin _instOut={seti,			4'b0001}; end
		  14: begin _instOut={sub,				4'b0100}; end		
		  15: begin _instOut={rsAdr,			4'b0001}; end
		  16: begin _instOut={seti,			4'b1001}; end
		  17: begin _instOut={mathToAdr,		4'b0000}; end
		  18: begin _instOut={seti,			4'b0010}; end
		  19: begin _instOut={mathToAdr,		4'b0001}; end
		  20: begin _instOut={bltz,			4'b0000}; end
		  21: begin _instOut={rsAdr,			4'b0001}; end
		  22: begin _instOut={seti,			4'b0000}; end
		  23: begin _instOut={mathToAdr,		4'b0000}; end
		  24: begin _instOut={ld,				4'b0001}; end
		  25: begin _instOut={rsAdr,			4'b0001}; end
		  26: begin _instOut={seti,			4'b0111}; end
		  27: begin _instOut={mathToAdr,		4'b0000}; end
		  28: begin _instOut={seti,			4'b0001}; end
		  29: begin _instOut={mathToAdr,		4'b0001}; end
		  30: begin _instOut={bez,				4'b0100}; end
		  31: begin _instOut={mvCnt,			4'b0010}; end
		  32: begin _instOut={rsAdr,			4'b0001}; end
		  33: begin _instOut={seti,			4'b0000}; end
		  34: begin _instOut={mathToAdr,		4'b0000}; end
		  35: begin _instOut={seti,			4'b1111}; end
		  36: begin _instOut={mathToAdr,		4'b0001}; end
		  37: begin _instOut={ld,				4'b0101}; end
		  38: begin _instOut={ld,				4'b0011}; end
		  39: begin _instOut={rsAdr,			4'b0001}; end
		  40: begin _instOut={seti,			4'b1011}; end
		  41: begin _instOut={mathToAdr,		4'b0000}; end
		  42: begin _instOut={bne,				4'b1011}; end	
        43: begin _instOut={seti,			4'b0001}; end	
        44: begin _instOut={add,				4'b0101}; end	
        45: begin _instOut={rsAdr,			4'b0001}; end	
        46: begin _instOut={seti,			4'b0000}; end	
        47: begin _instOut={mathToAdr,		4'b0000}; end	
        48: begin _instOut={st,				4'b0001}; end	
        49: begin _instOut={rsAdr,			4'b0001}; end	
        50: begin _instOut={seti,			4'b1001}; end	
        51: begin _instOut={mathToAdr,		4'b0000}; end	
        52: begin _instOut={jump,			4'b0000}; end	
        53: begin _instOut={seti,			4'b0001}; end	
        54: begin _instOut={sub,				4'b0000}; end	
        55: begin _instOut={rsAdr,			4'b0000}; end	
        56: begin _instOut={seti,			4'b1101}; end	
        57: begin _instOut={mathToAdr,		4'b0000}; end	
        58: begin _instOut={seti,			4'b0010}; end	
        59: begin _instOut={mathToAdr,		4'b0001}; end	
        60: begin _instOut={jump,			4'b0000}; end	
        61: begin _instOut={mvCnt,			4'b0001}; end	
        62: begin _instOut={zeroReg,		4'b0010}; end	
        63: begin _instOut={rsAdr,			4'b0001}; end	
        64: begin _instOut={seti,			4'b0101}; end	
        65: begin _instOut={mathToAdr,		4'b0000}; end	
        66: begin _instOut={bez,				4'b0000}; end	
        67: begin _instOut={rsAdr,			4'b0001}; end	
        68: begin _instOut={seti,			4'b0011}; end	
        69: begin _instOut={mathToAdr,		4'b0000}; end	
        70: begin _instOut={jump,			4'b0000}; end	
        71: begin _instOut={seti,			4'b0001}; end	
        72: begin _instOut={add,				4'b1010}; end	
        73: begin _instOut={rsAdr,			4'b0001}; end	
        74: begin _instOut={seti,			4'b0000}; end	
        75: begin _instOut={mathToAdr,		4'b0000}; end	
        76: begin _instOut={st,				4'b0110}; end	
        77: begin _instOut={seti,			4'b0001}; end	
        78: begin _instOut={add,				4'b0101}; end	
        79: begin _instOut={setCnt,			4'b0001}; end	
        80: begin _instOut={rsAdr,			4'b0000}; end	
        81: begin _instOut={seti,			4'b1001}; end	
        82: begin _instOut={mathToAdr,		4'b0000}; end	
        83: begin _instOut={seti,			4'b0100}; end	
        84: begin _instOut={mathToAdr,		4'b0001}; end	
        85: begin _instOut={jump,			4'b0000}; end	
        
        default: begin _instOut = 9'b000000000; end //Put whatever you want 
    endcase

end
endmodule