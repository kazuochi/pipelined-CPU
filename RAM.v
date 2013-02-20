`timescale 1ns / 1ps
module RAM(
input clk,
input [15:0] DataAddress,
input ReadMem,
input WriteMem,
input [15:0] DataIn,
output [15:0] DataOut
);

reg[15:0] InternalDataOut;
reg [15:0] my_memory[0:255];

assign DataOut = InternalDataOut;
initial begin	
	$readmemh("H:\\Documents\\Lab2\\initMem.list", my_memory);
end

always @ (ReadMem or DataAddress)
	if(ReadMem) 
		begin
			InternalDataOut = my_memory[DataAddress];
		end 
	else 
		begin	
			InternalDataOut = DataAddress;
		end
	
always @ (posedge clk)
	if(WriteMem) 
	begin
		my_memory[DataAddress] <= DataIn;
	end

	
endmodule