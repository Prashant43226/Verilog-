`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:11 07/21/2020 
// Design Name: 
// Module Name:    fifo1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fifo(
		 input[3:0] data_in,
		 input push,
		 input pop,
		 output reg[3:0] data_out 
    );
	 
reg[1:0] count=2'd0;
reg [3:0] data_arr[3:0];
integer i;

always@(*)
begin
if(push)
begin
count=count+1;
for(i=0;i<3;i=i+1)
begin
data_arr[i+1]<=data_arr[i];
data_arr[0]<=data_in;
end
end
else if(pop)
begin
data_out=data_arr[0];
count=count-1;
end
end

endmodule
