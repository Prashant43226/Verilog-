`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:14 07/21/2020 
// Design Name: 
// Module Name:    fifo_a 
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
       input clk,
		 input reset,
		 input[3:0] data_in,
		 input push,
		 input pop,
		 output reg[3:0] data_out,
       output reg fifo_empty,
       output reg fifo_full
       	 
    );
	 
reg[1:0] write_ptr=2'b00;
reg[1:0] read_ptr=2'b00;
reg [3:0] data_arr[3:0];
integer i;
reg[1:0] fifo_counter=2'b00;

always@(posedge clk)
begin
if(fifo_counter==2'b00)
begin
fifo_empty=1;
fifo_full=0;
end
else if(fifo_counter==2'b11)
begin
fifo_full=1;
fifo_empty=0;
end
else
begin
fifo_full=0;
fifo_empty=0;
end

if(push & (!fifo_full))
begin
data_arr[write_ptr]<=data_in;
write_ptr<=write_ptr+2'b01;
fifo_counter<=fifo_counter+2'b01;
end

else if(pop &(!fifo_empty))
begin
data_out<=data_arr[read_ptr];
read_ptr<=read_ptr+2'b01;
fifo_counter<=fifo_counter-2'b01;
end

else if((push &(!fifo_full))&(pop &(!fifo_empty)))
begin
fifo_counter<=fifo_counter;
write_ptr<=write_ptr;
read_ptr<=read_ptr;
data_arr[write_ptr]<=data_arr[write_ptr];
data_out<=data_out;
end

end
endmodule
