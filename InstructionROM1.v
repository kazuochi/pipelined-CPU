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
		mvToAdr    	= 5'b00011,
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
		  9:  begin _instOut={seti,        4'b0000}; end //$math = 0 
		  10: begin _instOut={mvMath,      4'b0001}; end //$1 = 0 //Array Index
        11: begin _instOut={rsAdr,       4'b0001}; end //jump to positive direction
        12: begin _instOut={seti,        4'b1010}; end //$math = 1010
        13: begin _instOut={mathToAdr,   4'b0000}; end //$adr = 0000 0000 0000 1010
        14: begin _instOut={seti,        4'b0011}; end //$math = 0011
        15: begin _instOut={mathToAdr,   4'b0100}; end //$adr = 0000 0000 0011 1010				58 instructions to Done:
		  16: begin _instOut={bez,         4'b0000}; end //LOOP:  if mem[1] is 0, jump Done:
		  17: begin _instOut={mvCnt,       4'b0010}; end //$2 = $cnt = 32
		  18: begin _instOut={mvToAdr,     4'b1000}; end //$adr = $2 = 32
		  19: begin _instOut={zeroReg,     4'b0011}; end //$3 = 0
		  20: begin _instOut={ld,          4'b1110}; end //$2 = mem[32]
		  21: begin _instOut={evu,         4'b1011}; end //check value of $2. if upper-half of adr 32 has even # of 1. Save 1 to $3 if even, 0 otherwise.
		  22: begin _instOut={seti,        4'b0001}; end //$math = 1
		  23: begin _instOut={add,         4'b0101}; end //$1++ increment array index
		  24: begin _instOut={rsAdr,       4'b0001}; end //jump to positive direction
		  25: begin _instOut={seti,        4'b0011}; end //offset = 3
		  26: begin _instOut={mathToAdr,   4'b0000}; end //$adr = 0011;
		  27: begin _instOut={bez,         4'b1100}; end //if $3 == 0, jump Odd1:
		  28: begin _instOut={seti,        4'b0001}; end //$math = 1
		  29: begin _instOut={sub,         4'b0000}; end //$0 = $0-1; 
		  30: begin _instOut={seti,        4'b1000}; end //$math = 1000       ODD1:
		  31: begin _instOut={mathToAdr,   4'b0000}; end //$adr =1000
		  32: begin _instOut={seti,        4'b0010}; end //$math = 0010
		  33: begin _instOut={mathToAdr,   4'b0100}; end //$adr == 0010 1000
		  34: begin _instOut={bez,         4'b0000}; end //if mem[1] is 0, jump Done:				 40 instructions to Done:
		  35: begin _instOut={evl,         4'b1011}; end //check value of $2. if lower-half of adr 32 has even # of 1. Save 1 to $3 if even, 0 otherwise.
		  36: begin _instOut={seti,        4'b0001}; end //$math = 1      
		  37: begin _instOut={add,         4'b0101}; end //$1++ increment array index
		  38: begin _instOut={rsAdr,       4'b0001}; end //jump to positive direction
		  39: begin _instOut={seti,        4'b0011}; end //$math = 3       
		  40: begin _instOut={mathToAdr,   4'b0000}; end //$adr = 0011  //set offset to ODD2:
		  41: begin _instOut={bez,         4'b1100}; end //if result of ev == 0, jump Odd2:
		  42: begin _instOut={seti,        4'b0001}; end //$math = 1      
		  43: begin _instOut={sub,         4'b0000}; end //$0 = $0-1; //count even
		  44: begin _instOut={seti,        4'b1010}; end //$math           ODD2:
		  45: begin _instOut={mathToAdr,   4'b0000}; end //$adr =  1010
		  46: begin _instOut={seti,        4'b0001}; end //$math = 0001
		  47: begin _instOut={mathToAdr,   4'b0100}; end //$adr == 0001 1010						
		  48: begin _instOut={bez,         4'b0000}; end //if mem[1] is 0, jump Done:				26 instructions to Done:
		  49: begin _instOut={mvCnt,       4'b1010}; end //move $cnt to $2
		  50: begin _instOut={seti,        4'b0001}; end //$math = 1  
		  51: begin _instOut={add,         4'b1010}; end //$2++ increment count
		  52: begin _instOut={mvToCnt,     4'b1000}; end //$cnt = $2 
		  53: begin _instOut={rsAdr,       4'b0001}; end //jump to positive direction
		  54: begin _instOut={seti,        4'b1000}; end //$math = 1000       //offset to Cont 8     #if $cnt == 79 set $1 = 127 and jump Done:
		  55: begin _instOut={mathToAdr,   4'b0000}; end //$adr = 1000
		  56: begin _instOut={seti,        4'b1111}; end //$math = 1111 
		  57: begin _instOut={mvMath,      4'b0011}; end //$3 = 1111
		  58: begin _instOut={seti,        4'b0100}; end //$math = 0100
		  59: begin _instOut={setReg,      4'b0111}; end //$3 = 0100 1111 (79)
		  60: begin _instOut={bne,         4'b0111}; end //$1 != 79 jump $adr(Cont:) #8 instructions Cont:
		  61: begin _instOut={seti,        4'b1111}; end //$math = 1111
		  62: begin _instOut={mvMath,      4'b0001}; end //$1 = 1111
		  63: begin _instOut={seti,        4'b0111}; end //$math = 0111
		  64: begin _instOut={setReg,      4'b0101}; end //$1 = 0111 1111 (127)
		  65: begin _instOut={seti,        4'b0111}; end //$math = 0111  								7 instructions to Done:
		  66: begin _instOut={mathToAdr,   4'b0000}; end //$adr = offset
		  67: begin _instOut={jump,        4'b0000}; end //jump to Done:
		  68: begin _instOut={rsAdr,       4'b0000}; end //jump to negative direction     Cont: 
		  69: begin _instOut={seti,        4'b1001}; end //$math = 1001   offset to Loop:
		  70: begin _instOut={mathToAdr,   4'b0000}; end //$adr 
		  71: begin _instOut={seti,        4'b0011}; end //$math = 0011   
		  72: begin _instOut={mathToAdr,   4'b0100}; end //set offset to Loop: //-57 instructions to Loop:
		  73: begin _instOut={jump,        4'b0000}; end //jump to Loop:
		  74: begin _instOut={rsAdr,       4'b0000}; end //jump to negative direction     Done: 
		  75: begin _instOut={seti,        4'b0001}; end //$math = 1
		  76: begin _instOut={sub,         4'b0101}; end //$1--
		  77: begin _instOut={seti,        4'b0110}; end //$math = 0110  
		  78: begin _instOut={mathToAdr,   4'b0100}; end //$addr = 0110 0000
		  79: begin _instOut={zeroReg,     4'b0011}; end //$3 = 0
		  80: begin _instOut={st,          4'b1101}; end //store $1 (array index) to mem[96]
		  81: begin _instOut ={halt,       4'b0000}; end //halt
        default: begin _instOut ={halt,  4'b0000}; end //halt
    endcase

end
endmodule