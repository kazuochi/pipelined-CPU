module Pipelined_CPU(
	output done
);

reg _clk;
wire clk;
assign clk = _clk;

initial
begin
	_clk = 0;
end
always #10 _clk = !_clk;


wire \halt_WB-FETCH ;
wire init;
wire[15:0] pc;
wire \branch_X-FETCH ;
wire \taken_REG-FETCH ;
wire jump_sign;
wire[15:0] \target_REG-FETCH ;
wire[8:0] instruction;

Fetch_Unit fetch_unit(
				.clk(clk),
				.init(init),
				.halt(0),
				.pc_in(pc),
				.pc_out(pc),
				.fetched_instruction(instruction),
				.branch(branch_X-FETCH),
				.taken( \taken_REG-FETCH ),
				.jump_sign(jump_sign),
				.target( \target_REG-FETCH )
);
			

//Control_Unit to IF/ID Latch
wire \halt_CNTRL-IFID ;
wire \branch_CNTRL-IFID ;
wire[3:0] \readReg0_CNTRL-IFID ;
wire[3:0] \readReg1_CNTRL-IFID ;
wire[3:0] \write_reg_CNTRL-IFID ;
wire \write_CNTRL-IFID ;
wire \move_CNTRL-IFID ;
wire[3:0] \ALUOp_CNTRL-IFID ;
wire \readMem_CNTRL-IFID ;
wire \writeMem_CNTRL-IFID ;
wire[1:0] \regToMem_CNTRL-IFID ;
wire \jump_sign_CNTRL-IFID ;
wire \immediate_CNTRL-IFID ;
wire[1:0] \quarter_CNTRL-IFID ;
wire stall;
			
Control_Unit control_unit(
	.clk(clk),
	.instruction_in(instruction),
	.stall(stall),
	.halt_signal( \halt_CNTRL-IFID ),
	.branch		( \branch_CNTRL-IFID ),
	.readReg0	( \readReg0_CNTRL-IFID ),
	.readReg1	( \readReg1_CNTRL-IFID ),
	.write_reg	( \write_reg_CNTRL-IFID ),
	.write		( \write_CNTRL-IFID ),
	.move			( \move_CNTRL-IFID ),
	.ALUOp		( \ALUOp_CNTRL-IFID ),
	.readMem		( \readMem_CNTRL-IFID ),
	.writeMem	( \writeMem_CNTRL-IFID ),
	.regToMem	( \regToMem_CNTRL-IFID ),
	.jump_sign	( \jump_sign_CNTRL-IFID ),
	.immediate	( \immediate_CNTRL-IFID ),
	.quarter		( \quarter_CNTRL-IFID ),
	.halted		(done)
);

//IFID Wires out
wire \write_IFID-IDEX ;
wire[3:0] \writeReg_IFID-IDEX ;
wire[3:0] \readReg0_IFID-REG ;
wire[3:0] \readReg1_IFID-REG ;
wire[1:0] \regToMem_IFID-REG ;
wire \move_IFID-REG ;
wire \immediate_IFID-REG ;
wire[1:0] \quarter_IFID-IDEX ;
wire[3:0] \ALU_operation_IFID-IDEX&REG ;
wire \readMem_IFID-IDEX ;
wire \writeMem_IFID-IDEX ;

IF_ID_Latch if_id_latch(
	.clk(clk),
	.write( \write_CNTRL-IFID ),
	.writeReg( \write_reg_CNTRL-IFID ),
	.readReg0( \readReg0_CNTRL-IFID ),
	.readReg1( \readReg1_CNTRL-IFID ),
	.regToMem( \regToMem_CNTRL-IFID ),
	.move( \move_CNTRL-IFID ),
	.immediate( \immediate_CNTRL-IFID ),
	.quarter( \quarter_CNTRL-IFID ),
	.ALU_operation( \ALUOp_CNTRL-IFID ),
	.ReadMem( \readMem_CNTRL-IFID ),
	.WriteMem( \writeMem_CNTRL-IFID ),
	.o_write( \write_IFID-IDEX ),
	.o_writeReg( \writeReg_IFID-IDEX ),
	.o_readReg0( \readReg0_IFID-REG ),
	.o_readReg1( \readReg1_IFID-REG ),
	.o_regToMem( \regToMem_IFID-REG ),
	.o_move( \move_IFID-REG ),
	.o_immediate( \immediate_IFID-REG ),
	.o_quarter( \quarter_IFID-IDEX ),
	.o_ALU_operation( \ALU_operation_IFID-IDEX&REG ),
	.o_ReadMem( \readMem_IFID-IDEX ),
	.o_WriteMem( \writeMem_IFID-IDEX )
);


wire \write_MEMWB-REG ;
wire[3:0] \writeReg_MEMWB-REG ;
wire[15:0] \writeData_MEMWB-REG ;
wire[15:0] \readData0_REG-IDEX ;
wire[15:0] \readData1_REG-IDEX ;
wire[15:0] \dataToMem_REG-IDEX ;
wire[1:0] \quarter_MEMWB-REG ;

Regfile regfile(
	.clk(clk),
	.write( \write_MEMWB-REG ),
	.writeReg( \writeReg_MEMWB-REG ),
	.writeData( \writeData_MEMWB-REG ),
	.readReg0( \readReg0_IFID-REG ),
	.readData0( \readData0_REG-IDEX ),
	.readReg1( \readReg1_IFID-REG ),
	.readData1( \readData1_REG-IDEX ),
	.regToMem( \regToMem_IFID-REG ),
	.dataToMem( \dataToMem_REG-IDEX ),
	.move( \move_IFID-REG ),
	.immediate( \immediate_IFID-REG ),
	.target( \target_REG-FETCH ),
	.quarter( \quarter_MEMWB-REG ),
	.ALU_operation( \ALU_operation_IFID-IDEX&REG ),
	.taken( \taken_REG-FETCH )
);


endmodule