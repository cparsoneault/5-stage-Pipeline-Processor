`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    Register, parameterized
//////////////////////////////////////////////////////////////////////////////////
module nbitEnReg #(parameter width = 32)
							(input [width-1:0] din,
							input clk, rst, en, clr,
							output reg [width-1:0] dout);
	always@(posedge clk) begin
		if (rst || clr) dout <= 0;
		else if (en) dout <= din;
		else dout <= dout;
	end
endmodule

module tb_nbitEnReg;
	parameter width = 32;
	reg clk, rst, en, clr;
	reg [width-1:0] pcIn;
	wire [width-1:0] pcOut;
	
	nbitEnReg #(.width(width)) t1 (.din(pcIn), .clk(clk), .rst(rst), .en(en), .clr(clr), .dout(pcOut));
	
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin
		pcIn = 0; rst = 1; clr = 0;
		#10 rst = 0;
		#5 pcIn = 25;
		#5 en = 1;
		#10 pcIn = 1;
		#10 pcIn = 255;
		#5 clr = 1;
	end
endmodule
