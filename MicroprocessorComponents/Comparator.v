`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    Comparator
//////////////////////////////////////////////////////////////////////////////////
module Comparator #(parameter width = 32)
				(input [width-1:0] in1, in2,
				output reg out);

	always@* begin
		if (in1 == in2)
			out <= 1;
		else out <= 0;
	end

endmodule

module tb_Comparator;
	parameter w = 32;
	reg [w-1:0] op1, op2;
	wire out1;
	
	Comparator #(.width(w)) t1
		(.in1(op1), .in2(op2), .out(out1));
		
	initial begin
		op1 = 25; op2 = 0;
		#20 op2 = 10;
		#20 op2 = 25;
		#20 op2 = 45;
	end
endmodule
