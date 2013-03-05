`timescale 1ns / 1ps
module test_fetch_unit;
	reg _clk;
	reg [15:0] _pc_in;
	reg _start;
	reg _branch;
	reg [15:0] _target;
	reg _taken;
	wire [15:0] _pc_out;
	wire [8:0] _fetched_instruction;

 Fetch_Unit dut(
	.clk(_clk),
	.pc_in(_pc_in),
	.start(_start),
	.branch(_branch),
	.target(_target),
	.taken(_taken),
	.pc_out(_pc_out),
	.fetched_instruction(_fetched_instruction)
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
		 _pc_in = 0;
		 _start = 0;
		 _branch = 0;
		 _target = 0;
		 _taken = 0;
		
		//output value 1 is expected
		@(negedge _clk); 
		 _pc_in = 0;
		 _start = 0;
		 _branch = 0;
		 _target = 0;
		 _taken = 0;
		 
		//test start = 1 expected output = 0
		@(negedge _clk);
		 _pc_in = 1;
		 _start = 1;
		 _branch = 0;
		 _target = 0;
		 _taken = 0;
		
		//test branch = 1 expected output = 4
		@(negedge _clk);
		 _pc_in = 0;
		 _start = 0;
		 _branch = 1;
		 _target = 16'b0000000000000100;
		 _taken = 1;
		 
		 //test branch = 1 expected output = 5
		@(negedge _clk);
		 _pc_in = 4;
		 _start = 0;
		 _branch = 1;
		 _target = 16'b0000000000000100;
		 _taken = 0;
	end
	
endmodule
 