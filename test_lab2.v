module test_lab2#(parameter W = 8);
reg clk;
reg [W-1:0] a_r;
reg [W-1:0] b_r;
wire [W:0] sum;
wire is_odd;
// The design under test is our adder
Lab2 dut ( .clk(clk)
,.inA(a_r)
,.inB(b_r)
,.out(sum)
,.isOdd(is_odd)
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
a_r = 0;
b_r = 0;
@(negedge clk);
a_r = 1;
b_r = 1;
@(negedge clk);
a_r = 5;
b_r = 6;
@(negedge clk);
a_r = 2;
b_r = 2;
@(negedge clk);
a_r = 3;
b_r = 3;
@(negedge clk);
a_r = 1;
b_r = 8;
end // initial begin
endmodule // test_adder