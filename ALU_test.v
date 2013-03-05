`timescale 1ns / 1ps
module ALU_test();
reg clk;
reg [3:0] op;
reg [15:0] a_r;
reg [15:0] b_r;
wire [15:0] _result;
wire [15:0] _compare;
// The design under test is our adder
	ALU arithmetic ( .clk(clk)
	,.operation(op)
	,.readData1(a_r)
	,.readData2(b_r)
	,.result(_result)
	,.compare(_compare)
	);
// Toggle the clock every 10 ns
initial
begin
	clk = 0;
	forever #10 clk = !clk;
end
// Test with a variety of inputs.
// Introduce new stimulus on the falling clock edge so that values
// will be on the input wires in plenty of time to be read by
// registers on the subsequent rising clock edge.
initial
	begin
		op = 0;
		a_r = 0;
		b_r = 0;
		@(negedge clk);
		op = 0;
		a_r = 1;
		b_r = 0;
		@(negedge clk);
		op = 0;
		a_r = 1;
		b_r = 3;
		@(negedge clk);
		op = 1;
		a_r = 1;
		b_r = 1;
		@(negedge clk);
		op = 2;
		a_r = 5;
		b_r = 6;
		@(negedge clk);
		op = 3;
		a_r = 2;
		b_r = 2;
		@(negedge clk);
		op = 4;
		a_r = 3;
		b_r = 3;
	end // initial begin
endmodule // test_adder