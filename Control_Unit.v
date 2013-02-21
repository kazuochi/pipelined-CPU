`timescale 1ns / 1ps
module Control_Unit(
	input clk,
	input [8:0] instruction_in,
	output start,
	output branch,
	output[3:0]readReg0,
	output[3:0]readReg1,
	output[3:0]write_reg,
	output write,
	output move,
	output [3:0] ALUOp,
	output MemtoReg,
	output MemWrite,
	output jump_sign,
	output immediate,
	output set_quarter
);

   reg _start;
	reg _branch;
	reg[3:0] r0;
	reg[3:0] r1;
	reg[3:0] _wr;
	reg _write;
	reg _move;
	reg [3:0] aop;
	reg m2r;
	reg mw;
	reg _jump_sign;
	reg imm;
	reg _set_quarter;
	
	assign start = _start;
	assign branch = _branch;
	assign readReg0 = r0;
	assign readReg1 = r1;
	assign write_reg = _wr;
	assign write = _write;
	assign move = _move;
	assign ALUOp = aop;
	assign MemtoReg = m2r;
	assign MemWrite = mw;
	assign jump_sign = _jump_sign;
	assign immediate = imm;
	assign set_quarter = _set_quarter;
	
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
		
		
		
always @(*)
	begin
	case(instruction_in[8:4])
	
	add: begin  //ADD
			r0 <= instruction_in[3:2];
			r1 <= 5; //$math
			_wr <= instruction_in[1:0];
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			aop = 4'b0000;
			_move <= 0;
			imm <= 0;
			_set_quarter <= 0;
			
		end
		
	sub: begin  //SUB
	      r0 <= instruction_in[3:2];
			r1 <= 5; //$math
			_wr <= instruction_in[1:0];
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			aop = 4'b0001;
			_move <= 0;
			imm <= 0;
			_set_quarter <= 0;
			
		end
		
    mv: begin //MV
         r0 <= instruction_in[3:2];
    		r1 <= 5; //DC
			_wr <= instruction_in[1:0];
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 1;
			imm <= 0;
			_set_quarter <= 0;
			
    end
	 
	 setAdr: begin 
			r0 <= instruction_in[3:2];
    		//r1 <= 5; //DC
			_wr <= 4;
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 1;
			imm <= 0;
			_set_quarter <= 0;
		end
		
	 mvAdr: begin  
			r0 <= 4;
			//r1 <= 5; //$math
			_wr <= instruction_in[1:0];
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 1;
			imm <= 0;
			_set_quarter <= 0;
	 end
	
	 rsAdr: begin  
			r0 <= 0;
			//r1 <= 5; //$math
			_wr <= 4;
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 0;
			imm <= 1;
			_set_quarter <= 0;
			_jump_sign = instruction_in[0];
	 end
		
	 seti: begin  
			r0 <= instruction_in[3:0];
			//r1 <= 5; //$math
			_wr <= 5; //$math
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 0;
			imm <= 1;
			_set_quarter <= 0;
	 end
		
		mvMath: begin  
			r0 <= 5;
			//r1 <= 5; //$math
			_wr <= instruction_in[1:0];
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 1;
			imm <= 0;
			_set_quarter <= 0;
		end
		
		mvToMath: begin  
			r0 <= instruction_in[3:2];
			//r1 <= instruction_in[3:2];
			_wr <= 5; //$math
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 1;
			imm <= 0;
			_set_quarter <= 0;
		end
		
		
		mathToAdr: begin  
			r0 <= 5; //$math
			//r1 <= 5; 
			_wr <= 4; //$adr
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 1;
			imm <= 0;
			_set_quarter <= 1;
		end
		
		setReg: begin  
			r0 <= 5; 
			r1 <= instruction_in[3:2];  //$math
			_wr <= instruction_in[1:0]; 
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 1;
			imm <= 0;
			_set_quarter <= 1;
		end
		
		setCnt: begin  
			r0 <= instruction_in[1:0]; 
			r1 <= instruction_in[3:2];  //$math
			_wr <= 7; //$cnt
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 0;
			imm <= 0;
			_set_quarter <= 1;
		end
		
		mvCnt: begin  
			r0 <= 7; 
			//r1 <= instruction_in[3:2];  //$math
			_wr <= instruction_in[1:0]; 
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 1;
			imm <= 0;
			_set_quarter <= 0;
		end
		
		mvToCnt: begin  
			r0 <= instruction_in[3:2]; 
			//r1 <= instruction_in[3:2];  //$math
			_wr <= 7; 
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 1;
			imm <= 0;
			_set_quarter <= 0;
		end
		
		rsCnt: begin  
			r0 <= 0; 
			//r1 <= instruction_in[3:2];  //$math
			_wr <= 7; 
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_start <= 0;
			_move <= 0;
			imm <= 1;
			_set_quarter <= 0;
		end
		
		halt: begin //halt
			  _branch = 0;
			  _start <= 1;
		 end
		 
		zeroReg: begin //zeroReg
				r0 = 0;
			  _start = 0;
			  _branch = 0;
			  _write <= 1;
			  imm <= 1;
			  _move = 0;
			  _wr <= instruction_in[1:0];
		 end
		 
		jump: begin //jump
			  _write = 0;
			  _start = 0;
			  _branch <= 1;
			  r0 <= 0;
			  r1 <= 0;
			  aop = 4'b0111; //eq
		 end
		 
		 st: begin //str
			  _start = 0;
			  _branch <= 0;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= 4; //adr reg
			  _wr <= instruction_in[1:0];
			  aop = 4'b0000; //add
		 end
		 
		ld: begin //ld
			  _start = 0;
			  _branch <= 0;
			  _write <= 1;
			  m2r <= 1;
			  imm = 0;
			  r0 <= instruction_in[3:2];
			  r1 <= 4; //adr reg
			  _wr <= instruction_in[1:0];
			  aop = 4'b0000; //add
		 end
		 
		 evl: begin //evl
			  _start = 0;
			  _branch <= 0;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= 0;
			  _wr <= instruction_in[1:0];
			  aop = 4'b0011; //even_lower
		 end
		 
		 evu: begin //evu
			  _start = 0;
			  _branch <= 0;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= 0;
			  _wr <= instruction_in[1:0];
			  aop = 4'b0010; //even_upper
		 end
		 
		 bgte: begin //bgte
			  _start = 0;
			  _branch <= 1;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= instruction_in[1:0];
			  aop = 4'b0100; //gte
		 end
		 
		 bltz: begin //bltz
			  _start = 0;
			  _branch <= 1;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= instruction_in[1:0];
			  aop = 4'b0101; //ltz
		 end    
		 
		 bez: begin //bez
			  _start = 0;
			  _branch <= 1;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= instruction_in[1:0];
			  aop = 4'b0110; //ez
		 end
		 
		 bne: begin //bne
			  _start = 0;
			  _branch <= 1;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= instruction_in[1:0];
			  aop = 4'b1000; //ne
		 end
		 
		 be: begin //be
			  _start = 0;
			  _branch <= 1;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= instruction_in[1:0];
			  aop = 4'b0111; //ne
		 end
		
	
	
	 
	 
	endcase
end


endmodule