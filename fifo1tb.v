`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:28:50 06/12/2020
// Design Name:   fifo
// Module Name:   D:/Xilinx/fifo/fifo_tb1.v
// Project Name:  fifo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fifo_tb1;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] data_in;
	reg push;
	reg pop;

	// Outputs
	wire [3:0] data_out;
	wire fifo_full;
	wire fifo_empty;

	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.clk(clk), 
		.reset(reset), 
		.data_in(data_in), 
		.push(push), 
		.pop(pop), 
		.data_out(data_out), 
		.fifo_full(fifo_full), 
		.fifo_empty(fifo_empty)
	);
      
		//initialise clock
	   initial
		begin
		clk=#1 0;
		repeat(500)
		#5 clk=~clk;
		end
		
		//reset 
		initial 
		begin
		reset= 1;
		#10
		reset=#1 0;
		end
		
		initial
		begin
		//first push
		@(posedge clk)
		push=1;
		pop=0;
		data_in=4'b0010;
		
		
		//second push
		@(posedge clk)
		push=1;
		pop=0;
		data_in=4'b0100;
		
		
		//first pop
		@(posedge clk)
		pop=1;
		push=0;
		
		
		//third push
		@(posedge clk)
		push=1;
		pop=0;
		data_in=4'b0101;
		
		
		//fourth push
		@(posedge clk)
		push=1;
		pop=0;
		data_in=4'b0110;
		
		
		//fifth push
		@(posedge clk)
		push=1;
		pop=0;
		data_in=4'b1100;
		
		
				
		//second pop
		@(posedge clk)
		pop=1;
		push=0;
		
		//third pop
		@(posedge clk)
		pop=1;
		push=0;
		
		end
     
		
		
 endmodule

