module Hazard_Detection_unit(

input  clk,
input  [3:0]ID_EX_regWrite,  
input  [3:0]EX_MEM_regWrite,
input  [3:0]MEM_WB_regWrite, 
input  [3:0]regRead0,   //connected from control unit. 
input  [3:0]regRead1,   //connected from control unit.
output IF_ID_Write,     //connect to IF_ID latch
output pc_write,        //connect to Fetch_Unit
output stall            //connect to ID_EX latch

);

reg _IF_ID_Write, _pc_write, _stall;

assign IF_ID_Write = _IF_ID_Write;
assign pc_write = _pc_write;
assign stall = _stall;



always@(posedge clk)  //send stall signals when modules are updated. 
begin

	if(regRead0 == ID_EX_regWrite) 
	begin
		_IF_ID_Write <= 0; //don't update IF_ID latch
		_pc_write = 0;      //don't update pc_counter
		_stall <= 1;        //stall
	end
	
	else if(regRead1 == ID_EX_regWrite) 
	begin
		_IF_ID_Write <= 0; //don't update IF_ID latch
		_pc_write = 0;      //don't update pc_counter
		_stall <= 1;        //stall
	end
	
	else if(regRead0 == EX_MEM_regWrite) 
	begin
		_IF_ID_Write <= 0; //don't update IF_ID latch
		_pc_write = 0;      //don't update pc_counter
		_stall <= 1;        //stall
	end
	
	else if(regRead1 == EX_MEM_regWrite) 
	begin
		_IF_ID_Write <= 0; //don't update IF_ID latch
		_pc_write = 0;      //don't update pc_counter
		_stall <= 1;        //stall
	end
	
	else if(regRead0 == MEM_WB_regWrite) 
	begin
		_IF_ID_Write <= 0; //don't update IF_ID latch
		_pc_write = 0;      //don't update pc_counter
		_stall <= 1;        //stall
	end
	
	else if(regRead1 == MEM_WB_regWrite) 
	begin
		_IF_ID_Write <= 0; //don't update IF_ID latch
		_pc_write = 0;      //don't update pc_counter
		_stall <= 1;        //stall
	end
	
	else
	begin
		_IF_ID_Write <= 1; 
		_pc_write = 1;      
		_stall <= 0;        
	end

end

endmodule