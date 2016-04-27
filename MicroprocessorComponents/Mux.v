`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    Mux
//////////////////////////////////////////////////////////////////////////////////
module Mux #(parameter width = 32)
				(input sel,
				 input [width-1:0] in1, in2,
				 output reg [width-1:0] out);

	always@* begin
		if (~sel) out <= in1;
		else out <= in2;
	end

endmodule

module tb_mux;
	reg sel;
	reg [31:0] in1, in2;
	wire [31:0] out;
	
	Mux m1 (.sel(sel), .in1(in1), .in2(in2), .out(out));
	
	initial begin
		in1 = 1;
		in2 = 2;
		sel = 0;
		#5 sel = 1;
	end

endmodule
