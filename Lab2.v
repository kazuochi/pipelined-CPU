`timescale 1ns / 1ps
module Lab2#(parameter W = 8)
(
input clk,
input [W-1:0] inA, inB,
output [W:0] out,
output isOdd
);
reg [W-1:0] regA, regB;
reg [W:0] regOut;
reg regOdd;
wire [W:0] wireOut;
assign wireOut = regA + regB;
assign out = regOut;
assign isOdd = regOdd;
always@(posedge clk)
begin
regA <= inA;
regB <= inB;
regOut <= wireOut;
regOdd <= (out[0] == 1) ? 1: 0;
end
endmodule