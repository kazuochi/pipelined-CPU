`timescale 1ns / 1ps
module SingleCycleCPU(
	input init,
	output done
);
reg clk;

initial
begin
	clk = 0;
	forever #10 clk = !clk;
end

wire [15:0] pc_out;
wire[8:0] fetched_instruction;
wire [15:0] readData0, readData1;
wire [15:0] result, taken, address;
wire [15:0] DataOut, dataToMem;
wire [3:0] readReg0, readReg1, writeReg, ALUOp;
wire start, branch, write, move, MemtoReg, MemWrite, jump_sign, immediate;
wire [1:0] regToMem, quarter;

Fetch_Unit fetchUnit(
				.clk(clk),
				.pc_in(pc_out), //pc-in start 0
				.start(start),
				.branch(branch),
				.target(address),
				.taken(taken),
				.jump_sign(jump_sign),
				.pc_out(pc_out),
				.fetched_instruction(fetched_instruction),
				.init(init)
			);

			
Control_Unit control(
		 clk,
		 fetched_instruction,
		 start,
		 branch,
		 readReg0,
		 readReg1,
		 writeReg,
		 write,
		 move,
		 ALUOp,
		 MemtoReg,
		 MemWrite,
		 regToMem,
		 jump_sign,
		 immediate,
		 quarter,
		 done
);

IF_ID_Latch(	
   clk,
	write,
	writeReg,
	readReg0,
	readReg1,
	regToMem,
	move,
	immediate,
	quarter,
	ALUOp,
	MemtoReg,
	MemWrite,
	DataAddress,  //input for RAM
	stall,
	o_write,        //ID
   o_writeReg,     //ID
	o_readReg0,     //ID
	o_readReg1,     //ID
	o_regToMem,     //ID
   o_move,         //ID
   o_immediate,    //ID
	o_quarter,      //ID
	o_ALU_operation,
	o_DataAddress,
	o_ReadMem,
	o_WriteMem
);

Regfile regfile( 
				.clk(clk),
				.write(o_write),
				.writeReg(o_writeReg),
				.writeData(DataOut),
				.readReg0(o_readReg0), 
				.readData0(readData0), //out
				.readReg1(o_readReg1),
				.readData1(readData1), //out
				.regToMem(o_regToMem),
				.dataToMem(dataToMem),  //out
				.move(o_move),
				.immediate(o_immediate),
				.address(address),    //out
				.quarter(o_quarter)
			);

ID_EX_latch(




);
			
ALU alu(
			.clk(clk),
			.operation(ALUOp),
			.readData0(readData0),
			.readData1(readData1),
			.result(result),
			.taken(taken)
);


EX_MEM_latch(



);

RAM ram(
	.clk(clk),
	.DataAddress(result),
	.ReadMem(MemtoReg),
	.WriteMem(MemWrite),
	.DataIn(dataToMem),
	.DataOut(DataOut)
);


			
endmodule
