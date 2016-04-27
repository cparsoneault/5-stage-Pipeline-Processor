`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    aStack 
//////////////////////////////////////////////////////////////////////////////////
module aStack #(parameter width = 32, wordLength = 32)
				(input clk, rst, push, pop,
				 input [wordLength-1:0] din,
				 output empty, full,
				 output reg error,
				 output reg [$clog2(wordLength) - 1:0] sp,
				 output reg [wordLength-1:0] dout);

	reg [wordLength-1:0] myStack [width-1:0];
	always@(posedge clk) begin
		if (rst) begin
						sp <= 0;
						error <= 0;
					end
		else
			case({push,pop})
				2'b10: if (full) error <=1;
						 else begin
									myStack[sp] <= din;
									sp <= sp + 1;
									error <= 0;
								end
				2'b01: if (empty) error <= 1;
						 else begin
									dout <= myStack[sp-1];
									sp <= sp - 1;
									error <= 0;
								end
				2'b00: begin
							error <= 0;
							dout <= 0;
						 end
				default: begin
							end
			endcase
	end
	assign full = (sp == (width-1))? 1 : 0;
	assign empty = (sp == 0) ? 1:0;

endmodule

module tb_aStack;
	parameter w = 4;
	parameter wl = 32;
	wire empty, error, full;
	wire [$clog2(wl)-1:0] sp;
	wire [wl-1:0] dout;
	reg clk, rst, push, pop;
	reg [wl-1:0] din;


	aStack #(.width(w), .wordLength(wl)) teststack1 
				(.clk(clk), .push(push), .pop(pop), .rst(rst), .din(din),
				 .full(full), .empty(empty), .error(error), .sp(sp), .dout(dout));
	
	initial clk = 0;
	always #5 clk = ~clk;
	
	initial begin
					push = 0; pop = 0; rst = 1;
					din = 3;
					#11 push = 1; din = 4; rst = 0;
					#10 din = 5;
					#10 din = 6;
					#10 din = 7;
					#10 ;
					#10 ;
					#10 push = 0;
					#10 pop = 1;
			  end
endmodule
