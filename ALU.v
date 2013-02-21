`timescale 1ns / 1ps
module ALU(
input clk,
input [3:0]operation,
input [15:0]readData0,
input [15:0]readData1,
output [15:0]result,
output taken
);

reg[0:4] i = 0;
integer count = 0;
reg [15:0]internalResult = 0;
reg _taken;

assign taken = _taken;
assign result = internalResult;

parameter	
		add			= 0,
		sub    		= 1,
		evenUpper	= 2,
		evenLower	= 3,
		gte			= 4,
		ltz			= 5,
		ez				= 6,
		eq				= 7,
		ne				= 8;
		
always @(*) begin
	case (operation)
		add: begin
			internalResult = readData0 + readData1;
			
		end
		sub: begin
			internalResult = readData0 - readData1;
		end
		evenUpper: begin
			for(i=8; i<16; i = i+1)
			begin
				count = count + (readData0[i]&1);
			end
			if(count%2==0)
			begin
				internalResult <= 1;
			end
			else
			begin
				internalResult <= 0;
			end
		end
		evenLower: begin
			for(i=0; i<8; i = i+1)
			begin
				count = count +(readData0[i]&1);
			end
			if(count%2==0)
			begin
				internalResult <= 1;
			end
			else
			begin
				internalResult <= 0;
			end
		end
		gte: begin
			if(readData0 >= readData1)
			begin
				_taken <= 1;
			end
			else
			begin
				_taken <= 0;
			end
		end
		ltz: begin
			if(readData0[15] == 1)  //assuming readData0 cannot be large positive values
			begin
				_taken <= 1;
			end
			else
			begin
				_taken <= 0;
			end
		end
		ez: begin
			if(readData0 == 0)
			begin
				_taken <= 1;
			end
			else
			begin
				_taken <= 0;
			end
		end
		eq: begin
			if(readData0 == readData1)
			begin
				_taken <= 1;
			end
			else
			begin
				_taken <= 0;
			end
		end
		ne: begin
			if(readData0 != readData1)
			begin
				_taken <= 1;
			end
			else
			begin
				_taken <= 0;
			end
		end
	endcase
end
endmodule

