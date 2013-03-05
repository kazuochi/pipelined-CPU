`timescale 1ns / 1ps
module test_regfile;
 reg _clk;
 reg _write;
 reg [3:0] _writeReg;
 reg [15:0] _writeData;
 reg [3:0] _readReg0;
 wire [15:0] _readData0;
 reg [3:0] _readReg1;
 wire [15:0] _readData1;
 reg [15:0]_compare;
 
 Regfile dut (
	.clk(_clk)
	,.write(_write)
	,.writeReg(_writeReg)
	,.writeData(_writeData)
	,.readReg0(_readReg0)
	,.readData0(_readData0)
	,.readReg1(_readReg1)
   ,.readData1(_readData1)
   ,.compare(_compare)
 );
 
 // toggle the clock every 10ns
 initial
	begin	
		_clk = 0;
		forever #10 _clk = !_clk;
	end
	
  initial
		begin
		//initialize
		_write = 0;
		_writeReg = 0;
		_writeData = 0;
		_readReg0 = 0;
		_readReg1 = 0;
		_compare = 0;
		
		@(negedge _clk);
		//write 15 to $0
		_write = 1;
		_writeReg = 3'b000; //$0
		_writeData = 16'b0000000000000001; //1
		_readReg0 = 0;
		_readReg1 = 0;
		_compare = 0;
		
		@(negedge _clk);
		//write 7 to $1
		_write = 1;
		_writeReg = 3'b001; //$1
		_writeData = 16'b0000000000000010; //2
		_readReg0 = 3'b001; //read $0
		_readReg1 = 0;
		_compare = 0;
		
		@(negedge _clk);
		//write 7 to $1
		_write = 1;
		_writeReg = 3'b010; //$2
		_writeData = 16'b0000000000000011; //3
		_readReg0 = 3'b010; //read $0
		_readReg1 = 0;
		_compare = 0;
		
		@(negedge _clk);
		//write 7 to $1
		_write = 1;
		_writeReg = 3'b010; //$2
		_writeData = 16'b0000000000000100; //4
		_readReg0 = 3'b010; //read $0
		_readReg1 = 0;
		_compare = 1;
		
		@(negedge _clk);
		//write 7 to $1
		_write = 0;
		_writeReg = 3'b010; //$2
		_writeData = 16'b0000000000000101; //5
		_readReg0 = 3'b010; //read $0
		_readReg1 = 0;
		_compare = 1;
		
      end
endmodule
	
	
 
 