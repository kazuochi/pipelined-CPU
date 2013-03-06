`timescale 1ns / 1ps
module Fetch_Unit (
				input clk,
				input init,
				input halt,
				input [15:0] pc_in,
				output [15:0] pc_out,
				output [8:0] fetched_instruction,
				input branch,
				input taken,
				input jump_sign,
				input [15:0] target
			);
reg [15:0] next_pc = 0;
reg initialized;

initial 
begin
	next_pc = 0;
end

assign pc_out = next_pc;

InstructionROM_test rom(
	.clk(clk),
	.pc(pc_out),
	.instruction(fetched_instruction)
);

always @(*)
begin
	if(init && !initialized)
	begin
		next_pc = 0;
		initialized = 1;
	end

	if(!halt)
	begin
		if (branch == 1)
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
	else
	begin
		next_pc = 0;
	end
end




	
endmodule
