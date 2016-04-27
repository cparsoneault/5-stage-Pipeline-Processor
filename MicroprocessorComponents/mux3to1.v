`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    Mux3to1
//////////////////////////////////////////////////////////////////////////////////
module Mux3to1 #(parameter width = 32)
			(input [width-1:0] in1, in2, in3,
			 input [1:0] sel,
			 output reg [width-1:0] dout);

	always@* begin
		case (sel)
			2'b00: dout <= in1;
			2'b01: dout <= in2;
			2'b10: dout <= in3;
			default: dout <= 0;
		endcase
	end

endmodule

module tb_mux3to1;
	parameter w = 32;
	
	reg [1:0]select;
	reg [w-1:0] in1, in2, in3;
	wire [w-1:0] out;
	
	Mux3to1 #(.width(w)) m1 (.in1(in1), .in2(in2), .in3(in3), .sel(select), .dout(out));
	
	initial begin
		in1 = 2;
		in2 = 3;
		in3 = 4;
		select = 0;
		#20 select = 1;
		#20 select = 2;
	end

endmodule
