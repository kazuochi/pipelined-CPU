`timescale 1ns / 1ps
module Hazard_Detection_unit(

input  clk,
input  [4:0]ID_EX_writeReg,  
input  [4:0]EX_MEM_writeReg,
input  [4:0]MEM_WB_writeReg, 
input  [3:0]regRead0,   //connected from control unit. 
input  [3:0]regRead1,   //connected from control unit.
input  branch,
input  branch_jump,
input  taken,
output pc_write,        //connect to Fetch_Unit
output stall,
output hazard_detected           

);


reg  _pc_write, _stall, _hazard_detected;

initial
begin
_pc_write = 1;
end

assign pc_write = _pc_write;
assign stall = _stall;
assign hazard_detected = _hazard_detected;



always@(*)  //send stall signals when modules are updated. 
begin
   //if branch or jump is detected at control unit while previous instructions are unpdating $adr, stall.
	if(branch_jump && (ID_EX_writeReg   == 5'b00100)
	|| branch_jump && (EX_MEM_writeReg  == 5'b00100)
	|| branch_jump && (MEM_WB_writeReg  == 5'b00100)
	|| regRead0 == ID_EX_writeReg
	|| regRead1 == ID_EX_writeReg
	|| regRead0 == EX_MEM_writeReg
	|| regRead1 == EX_MEM_writeReg
	|| regRead0 == MEM_WB_writeReg
	|| regRead1 == MEM_WB_writeReg)
	begin
		_hazard_detected <= 1;
		_pc_write <= 0;     //don't update pc_counter
		_stall <= 1;        //insert nop
	end
	
	else
	begin
	   _hazard_detected <= 0;
		_pc_write <= 1;      
		_stall <= 0;        
	end
	
	if(taken)
	begin
		_hazard_detected <= 1;
	end

end

endmodule