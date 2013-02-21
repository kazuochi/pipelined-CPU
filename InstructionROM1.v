`timescale 1ns / 1ps
module InstructionROM1(
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
        1:  begin _instOut={seti,        4'b0001}; end //$math = 1
        2:  begin _instOut={mathToAdr,   4'b0000}; end //$adr=0000 0000 0000 0001
        3:  begin _instOut={zeroReg,     4'b0001}; end //$1 = 0
        4:  begin _instOut={ld,          4'b0100}; end //$0 = mem[1]
		  5:  begin _instOut={rsCnt,       4'b0111}; end //$cnt = 0
		  6:  begin _instOut={seti,        4'b0010}; end //$math = 0010 (2nd 1/4) for Inst#8
        7:  begin _instOut={mvMath,      4'b0001}; end //$1 = $math = 2
        8:  begin _instOut={setCnt,      4'b0101}; end //$cnt = 0000 0000 0010 0000 = 32'
		  9:  begin _instOut={mvMath,      4'b0000}; end //$1 = 0 //Array Index
        10: begin _instOut={rsAdr,       4'b0001}; end //jump to positive direction
        11: begin _instOut={seti,        4'b1110}; end //$math = 1110
        12: begin _instOut={mathToAdr,   4'b0000}; end //$adr = 0000 0000 0000 1110
        13: begin _instOut={seti,        4'b0010}; end //$math = 0010
        14: begin _instOut={mathToAdr,   4'b0100}; end //$adr = 0000 0000 0010 1110
        default: begin _instOut ={halt,        4'b0000}; end //Put whatever you want 
    endcase

end
endmodule