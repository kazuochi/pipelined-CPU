`timescale 1ns / 1ps
module Pipelined_CPU(
	input __clk,
	output done
);

reg _clk;
wire clk;

assign clk = _clk;

initial
begin
	_clk = __clk;
	_clk = 0;
end
always #10 _clk = !_clk;


wire \halt_CNTRL-FETCH ;
wire init;
wire[15:0] pc;
wire \branch_IFID-FETCH ;
wire \jump_sign_IFID-FETCH ;
wire \taken_REG-FETCH ;
wire[15:0] \target_REG-FETCH ;
wire[8:0] instruction;


wire \pc_write_HZ-FETCH ;
wire \stall_HZ-CNTRL ;
wire \hazard_detected_HZ-IFID ;

Fetch_Unit fetch_unit(
				.clk(clk),
				.init(1'b1),
				.halt( \halt_CNTRL-FETCH ),
				.pc_in(pc),
				.pc_out(pc),
				.fetched_instruction(instruction),
				.branch( \branch_IFID-FETCH ),
				.taken( \taken_REG-FETCH ),
				.jump_sign( \jump_sign_IFID-FETCH ),
				.target( \target_REG-FETCH ),
				.pc_write( \pc_write_HZ-FETCH )
);
			

//Control_Unit to IF/ID Latch
wire \halt_CNTRL-IFID ;
wire \branch_CNTRL-IFID ;
wire[3:0] \readReg0_CNTRL-IFID ;
wire[3:0] \readReg1_CNTRL-IFID ;
wire[4:0] \write_reg_CNTRL-IFID ;
wire \write_CNTRL-IFID ;
wire \move_CNTRL-IFID ;
wire[3:0] \ALUOp_CNTRL-IFID ;
wire \readMem_CNTRL-IFID ;
wire \writeMem_CNTRL-IFID ;
wire[1:0] \regToMem_CNTRL-IFID ;
wire \jump_sign_CNTRL-IFID ;
wire \immediate_CNTRL-IFID ;
wire[1:0] \quarter_CNTRL-IFID ;
wire \branch_jump_CTRL-HZ ;
			
Control_Unit control_unit(
	.clk(clk),
	.instruction_in(instruction),
	.stall( \stall_HZ-CNTRL ),
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
	.halted		( \halt_CNTRL-FETCH ),
	.branch_jump( \branch_jump_CTRL-HZ )
);

//IFID Wires out
wire \write_IFID-IDEX ;
wire[4:0] \writeReg_IFID-IDEX ;
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
	.jump_sign(\jump_sign_CNTRL-IFID ),
	.branch( \branch_CNTRL-IFID ),
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
	.o_WriteMem( \writeMem_IFID-IDEX ),
	.o_jump_sign( \jump_sign_IFID-FETCH ),
	.o_branch(\branch_IFID-FETCH ),
	.hazard_detected( \hazard_detected_HZ-IFID )
); 



wire[15:0] \readData0_REG-IDEX ;
wire[15:0] \readData1_REG-IDEX ;
wire[15:0] \dataToMem_REG-IDEX ;

wire        \write_MEMWB-REG ;
wire [1:0]  \quarter_MEMWB-REG ;
wire [15:0] \writeData_MEMWB-REG ;
wire [4:0]  \writeReg_MEMWB-REG ;

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


wire [15:0] \readData0_IDEX-ALU ;
wire [15:0] \readData1_IDEX-ALU ;
wire [3:0]  \ALUOp_IDEX-ALU ;
wire        \ReadMem_IDEX-EXMEM ;
wire        \WriteMem_IDEX-EXMEM ;
wire [15:0] \DataIn_IDEX-EXMEM ; 
wire [1:0]  \quarter_IDEX-EXMEM ;
wire        \write_IDEX-EXMEM ;
wire [4:0]  \writeReg_IDEX-EXMEM ;

ID_EX_latch id_ex_latch(
	.clk(clk),
	.readData0( \readData0_REG-IDEX ), //datapath to ALU
	.readData1( \readData1_REG-IDEX ),
	.o_readData0( \readData0_IDEX-ALU ),
   .o_readData1( \readData1_IDEX-ALU ),
	.ALUOp( \ALU_operation_IFID-IDEX&REG ),			//control signal to ALU
	.o_ALUOp( \ALUOp_IDEX-ALU ),
	.ReadMem( \readMem_IFID-IDEX ),
	.WriteMem( \writeMem_IFID-IDEX ),     //control signal to RAM
	.o_ReadMem( \ReadMem_IDEX-EXMEM ),  
	.o_WriteMem( \WriteMem_IDEX-EXMEM ),
	.DataIn( \dataToMem_REG-IDEX ),     //data path for RAM
	.o_DataIn( \DataIn_IDEX-EXMEM ),
	.quarter( \quarter_IFID-IDEX ),      //data path to regfile
	.o_quarter( \quarter_IDEX-EXMEM ),
	.write( \write_IFID-IDEX ),
	.o_write( \write_IDEX-EXMEM ),
	.writeReg( \writeReg_IFID-IDEX ),
	.o_writeReg( \writeReg_IDEX-EXMEM )
);

wire [15:0] \result_ALU-EXMEM ;
ALU alu(
	.clk(clk),
	.operation( \ALUOp_IDEX-ALU ),
	.readData0( \readData0_IDEX-ALU ),
	.readData1( \readData1_IDEX-ALU ),
	.result( \result_ALU-EXMEM )
);


wire [15:0]  \DataAddress_EXMEM-RAM ;
wire         \ReadMem_EXMEM-RAM ;
wire         \WriteMem_EXMEM-RAM ;
wire [1:0]   \quarter_EXMEM-MEMWB ;
wire [15:0]  \DataIn_EXMEM-RAM ;
wire         \write_EXMEM-MEMWB ;
wire [4:0]   \writeReg_EXMEM-MEMWB ;

EX_MEM_latch ex_mem_latch(
	.clk(clk),
	.DataAddress( \result_ALU-EXMEM ),        //data path to RAM
	.o_DataAddress( \DataAddress_EXMEM-RAM ),
	.ReadMem( \ReadMem_IDEX-EXMEM ),
	.WriteMem( \WriteMem_IDEX-EXMEM ),         //control signal to RAM
	.o_ReadMem( \ReadMem_EXMEM-RAM ),  
	.o_WriteMem( \WriteMem_EXMEM-RAM ),
	.quarter( \quarter_IDEX-EXMEM ),			   //data path to regfile
	.o_quarter( \quarter_EXMEM-MEMWB ),
	.DataIn( \DataIn_IDEX-EXMEM ),				//Data path to RAM
	.o_DataIn( \DataIn_EXMEM-RAM ),
	.write( \write_IDEX-EXMEM ),
	.o_write( \write_EXMEM-MEMWB ),
	.writeReg( \writeReg_IDEX-EXMEM ),
	.o_writeReg( \writeReg_EXMEM-MEMWB )
);

wire [15:0] \DataOut_RAM-MEMWB ;
RAM ram(
	.clk(clk),
	.DataAddress( \DataAddress_EXMEM-RAM ),
	.ReadMem( \ReadMem_EXMEM-RAM ),
	.WriteMem( \WriteMem_EXMEM-RAM ),
	.DataIn( \DataIn_EXMEM-RAM ),
	.DataOut( \DataOut_RAM-MEMWB )
);



MEM_WB_Latch mem_wb_latch(
	.clk(clk),
	.write( \write_EXMEM-MEMWB ),
	.quarter( \quarter_EXMEM-MEMWB ),
	.writeReg( \writeReg_EXMEM-MEMWB ),
	.o_write( \write_MEMWB-REG ),
	.o_quarter( \quarter_MEMWB-REG ),
	.writeData( \DataOut_RAM-MEMWB ),
	.o_writeData( \writeData_MEMWB-REG ),
	.o_writeReg( \writeReg_MEMWB-REG )
);


Hazard_Detection_unit hazard_detection_unit(

.clk(clk),
.ID_EX_writeReg( \writeReg_IFID-IDEX ),  
.EX_MEM_writeReg( \writeReg_IDEX-EXMEM ),
.MEM_WB_writeReg( \writeReg_EXMEM-MEMWB ), 
.regRead0( \readReg0_CNTRL-IFID ),   //connected from control unit. 
.regRead1( \readReg1_CNTRL-IFID ),   //connected from control unit.
.branch( \branch_IFID-FETCH ),
.branch_jump( \branch_jump_CTRL-HZ ),
.taken( \taken_REG-FETCH ),
.pc_write( \pc_write_HZ-FETCH ),        //connect to Fetch_Unit
.stall( \stall_HZ-CNTRL ),
.hazard_detected( \hazard_detected_HZ-IFID )          
);	


endmodule
