`timescale 1ns / 1ps
module Clock(
	output clk
);
reg _clk=0;
assign clk = _clk;

initial
begin
	_clk = 0;
	forever #10 _clk = !_clk;
end
endmodule