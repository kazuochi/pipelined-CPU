`timescale 1ns / 1ps
module Control_Unit(
	input clk,
	input [8:0] instruction_in,
	input stall,
	output halt_signal,
	output branch,
	output[3:0]readReg0,
	output[3:0]readReg1,
	output[4:0]write_reg,
	output write,
	output move,
	output [3:0] ALUOp,
	output readMem,
	output writeMem,
	output [1:0] regToMem,
	output jump_sign,
	output immediate,
	output [1:0] quarter,
	output halted,
	output branch_jump
);

   reg _halt_signal;
	reg _branch;
	reg[3:0] r0;
	reg[3:0] r1;
	reg[4:0] _wr;
	reg _write;
	reg _move;
	reg [3:0] aop;
	reg m2r;
	reg mw;
	reg _jump_sign;
	reg imm;
	reg [1:0] _quarter = 0;
	reg [1:0] _regToMem;
	reg _halt_signaled;
	reg _branch_jump;
	
	integer dynamic_counter = -1;
	
	initial
	begin
		_halt_signal = 1'b0;
		_halt_signaled = 1'b0;
	end
	
	assign halt_signal = _halt_signal;
	assign branch = _branch;
	assign readReg0 = r0;
	assign readReg1 = r1;
	assign write_reg = _wr;
	assign write = _write;
	assign move = _move;
	assign ALUOp = aop;
	assign readMem = m2r;
	assign writeMem = mw;
	assign jump_sign = _jump_sign;
	assign immediate = imm;
	assign quarter = _quarter;
	assign regToMem = _regToMem;
	assign halted = _halt_signaled;
	assign branch_jump = _branch_jump;
	
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
		
always@(instruction_in)
begin
	dynamic_counter = dynamic_counter + 1;
end
		
		
always @(*)
	begin
	_quarter = 2'bxx;	
	_halt_signal = 0;
	_halt_signaled = 0;
	_branch_jump = 0;
	_wr = 31;
	aop = 4'b0000;
	imm = 0;
	_move = 0;
	m2r = 0;
	mw = 0;
	_write = 0;
	case(instruction_in[8:4])
	
	add: begin  //ADD
			r0 <= instruction_in[3:2];
			r1 <= 5; //$math
			_wr <= instruction_in[1:0];
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			aop = 4'b0000;
			_move <= 0;
			imm <= 0;
			_regToMem = 2'bxx;
			
		end
		
	sub: begin  //SUB
	      r0 <= instruction_in[3:2];
			r1 <= 5; //$math
			_wr <= instruction_in[1:0];
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			aop = 4'b0001;
			_move <= 0;
			imm <= 0;
			_regToMem = 2'bxx;
			
		end
		
    mv: begin //MV
         r0 <= instruction_in[3:2];
    		r1 <= 5; //DC
			_wr <= instruction_in[1:0];
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 1;
			imm <= 0;
			_regToMem = 2'bxx;
			aop = 4'b0000;
			
    end
	 
	 mvToAdr: begin 
			r0 <= instruction_in[3:2];
    		//r1 <= 5; //DC
			_wr <= 4;
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 1;
			imm <= 0;
			_regToMem = 2'bxx;
		end
		
	 mvAdr: begin  
			r0 <= 4;
			//r1 <= 5; //$math
			_wr <= instruction_in[1:0];
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 1;
			imm <= 0;
			_regToMem = 2'bxx;
	 end
	
	 rsAdr: begin  
			r0 <= 0;
			//r1 <= 5; //$math
			_wr <= 4;
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 0;
			imm <= 1;
			_jump_sign = instruction_in[0];
			_regToMem = 2'bxx;
			aop = 4'b0000;
	 end
		
	 seti: begin  
			r0 <= instruction_in[3:0];
			//r1 <= 5; //$math
			_wr <= 5; //$math
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 0;
			imm <= 1;
			_regToMem = 2'bxx;
			_quarter = 2'bxx;
			aop = 4'b0000;
	 end
		
		mvMath: begin  
			r0 <= 5;
			//r1 <= 5; //$math
			_wr <= instruction_in[1:0];
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 1;
			imm <= 0;
			_regToMem = 2'bxx;
		end
		
		mvToMath: begin  
			r0 <= instruction_in[3:2];
			//r1 <= instruction_in[3:2];
			_wr <= 5; //$math
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 1;
			imm <= 0;
			_regToMem = 2'bxx;
		end
		
		
		mathToAdr: begin  
			r0 <= 5; //$math
			_quarter <= instruction_in[3:2]; 
			_wr <= 4; //$adr
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 1;
			imm <= 0;
			_regToMem = 2'bxx;
		end
		
		setReg: begin  
			r0 <= 5; //$math
			r1 <= 4'bxxxx;
			_quarter <= instruction_in[3:2];  
			_wr <= instruction_in[1:0]; 
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 1;
			imm <= 0;
			_regToMem = 2'bxx;
			aop = 4'b0000;
		end
		
		setCnt: begin  
			r0 <= instruction_in[1:0]; 
			r1 = 4'bxxxx;
			_quarter <= instruction_in[3:2];  
			_wr <= 7; //$cnt
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 1;
			imm <= 0;
			_regToMem = 2'bxx;
			aop = 4'b0000;
		end
		
		mvCnt: begin  
			r0 <= 7; 
			//r1 <= instruction_in[3:2];  //$math
			_wr <= instruction_in[1:0]; 
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 1;
			imm <= 0;
			_regToMem = 2'bxx;
		end
		
		mvToCnt: begin  
			r0 <= instruction_in[3:2]; 
			//r1 <= instruction_in[3:2];  //$math
			_wr <= 7; 
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 1;
			imm <= 0;
			_regToMem = 2'bxx;
		end
		
		rsCnt: begin  
			r0 <= 0; 
			//r1 <= instruction_in[3:2];  //$math
			_wr <= 7; 
			_write <= 1;
			mw <= 0;
			m2r <= 0;
			_branch <= 0;
			_halt_signal <= 0;
			_move <= 0;
			imm <= 1;
			_regToMem = 2'bxx;
		end
		
		halt: begin //halt
			  _branch = 0;
			  _halt_signal <= 1;
			  _halt_signaled <= 1;
		 end
		 
		zeroReg: begin //zeroReg
				r0 = 0;
			  _halt_signal = 0;
			  _branch = 0;
			  _write <= 1;
			  imm <= 1;
			  _move = 0;
			  _wr <= instruction_in[1:0];
			  _regToMem = 2'bxx;
		 end
		 
		jump: begin //jump
			  _write = 0;
			  _halt_signal = 0;
			  _branch <= 1;
			  _move = 0;
			  imm <= 0;
			  r0 <= 0;
			  r1 <= 0;
			  aop = 4'b0111; //eq
			  _regToMem = 2'bxx;
			  _branch_jump = 1;

		 end
		 
		 st: begin //str
			  _halt_signal = 0;
			  _branch <= 0;
			  _write <= 0;
			  _move = 0;
			  imm <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= 4; //adr reg
			  _regToMem = instruction_in[1:0];
			  mw <= 1;
			  aop = 4'b0000; //add
		 end
		 
		ld: begin //ld
			  _halt_signal = 0;
			  _branch <= 0;
			  _write <= 1;
			  _move = 0;
			  m2r <= 1;
			  imm = 0;
			  r0 <= instruction_in[3:2];
			  r1 <= 4; //adr reg
			  _wr <= instruction_in[1:0];
			  _regToMem = 2'bxx;
			  aop = 4'b0000; //add
		 end
		 
		 evl: begin //evl
			  _halt_signal = 0;
			  _branch <= 0;
			  _write <= 1;
			  r0 <= instruction_in[3:2];
			  r1 <= 0;
			  _move = 0;
			  _wr <= instruction_in[1:0];
			  aop = 4'b0011; //even_lower
			  _regToMem = 2'bxx;
			  m2r =0;
		 end
		 
		 evu: begin //evu
			  _halt_signal = 0;
			  _branch <= 0;
			  _write <= 1;
			  r0 <= instruction_in[3:2];
			  r1 <= 0;
			  _move = 0;
			  _wr <= instruction_in[1:0];
			  aop = 4'b0010; //even_upper
			  _regToMem = 2'bxx;
			  m2r =0;
		 end
		 
		 bgte: begin //bgte
			  _halt_signal = 0;
			  _branch <= 1;
			  _branch_jump = 1;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= instruction_in[1:0];
			  aop = 4'b0100; //gte
			  _regToMem = 2'bxx;
		 end
		 
		 bltz: begin //bltz
			  _halt_signal = 0;
			  _branch <= 1;
			  _branch_jump = 1;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= instruction_in[1:0];
			  aop = 4'b0101; //ltz
			  _regToMem = 2'bxx;
		 end    
		 
		 bez: begin //bez
			  _halt_signal = 0;
			  _branch <= 1;
			  _branch_jump = 1;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= instruction_in[1:0];
			  aop = 4'b0110; //ez
			  _regToMem = 2'bxx;
		 end
		 
		 bne: begin //bne
			  _halt_signal = 0;
			  _branch <= 1;
			  _branch_jump = 1;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= instruction_in[1:0];
			  aop = 4'b1000; //ne
			  _regToMem = 2'bxx;
		 end
		 
		 be: begin //be
			  _halt_signal = 0;
			  _branch <= 1;
			  _branch_jump = 1;
			  _write <= 0;
			  r0 <= instruction_in[3:2];
			  r1 <= instruction_in[1:0];
			  aop = 4'b0111; //ne
			  _regToMem = 2'bxx;
		 end
		 
		 default: begin 
				_branch = 0;
			  //_halt_signal <= 1;
			  //_halt_signaled <= 1;
		 end
	 
	endcase
end


endmodule