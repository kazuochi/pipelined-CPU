`timescale 1ns / 1ps
module Fetch_Unit (
				input clk,
				input [15:0] pc_in,
				input start,
				input branch,
				input [15:0] target,
				input taken,
				input jump_sign,
				output [15:0] pc_out,
				output [8:0] fetched_instruction,
				input init
			);
reg [15:0] next_pc = 0;
reg initialized;
reg halt = 0;
reg jumped = 0;

initial 
begin
	next_pc = 0;
end

assign pc_out = next_pc;

InstructionROM2 rom(
	.clk(clk),
	.pc(pc_out),
	.instruction(fetched_instruction)
);

always @(negedge clk)
begin
if(!halt)
	begin
	if (start == 1)
	begin
		next_pc <= 0;
		halt = 1;
	end
	
	else if (branch == 1)
	begin
		if(taken == 1)
		begin
			if(jump_sign)
			begin
				next_pc <= pc_in + target;
			end
			else
			begin
				next_pc <= pc_in - target;
			end
		end
		
		else
		begin
			next_pc <= pc_in + 1;
		end
	end
	
	else
	begin
		next_pc <= pc_in + 1;
	end
	
	end
	
end

always@(*)
if(init && !initialized)
begin
	next_pc = 0;
	initialized = 1;
end
	
endmodule
