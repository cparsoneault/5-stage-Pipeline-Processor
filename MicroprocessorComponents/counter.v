`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    counter
//////////////////////////////////////////////////////////////////////////////////
module counter #(parameter width = 32)
		(input [width-1:0] din,
		 output reg [width-1:0] dout);

	always@* dout <= din + 1;

endmodule

module tb_counter;
	reg [31:0] in;
	wire [31:0] out;
	
	counter c1 (.din(in), .dout(out));
	
	initial begin
		in = 1;
		#5 in = 2;
	end
endmodule
	