`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    ALU
//////////////////////////////////////////////////////////////////////////////////
module ALU #(parameter width = 32)
				(input signed [width-1:0] op1, op2,
				 input [3:0] sel,
				 output reg signed [width-1:0] out);
				 
		parameter ALUand = 4'b0000; //a & b
		parameter ALUor = 4'b0001;	// a | b
		parameter ALUadd = 4'b0010;	//a + b
		parameter ALUandnot = 4'b0100; //a&~b
		parameter ALUornot = 4'b0101; //a|~b
		parameter ALUsub = 4'b0110;	//a-b
		parameter ALUslt = 4'b0111;	//set less than. Output 1 if a < b, else output 0
		
		parameter ALUxor = 4'b1000; //a^b
		parameter ALUsll = 4'b1001; //a<<b
		parameter ALUsrl = 4'b1010; //a>>b
		parameter ALUsra = 4'b1011; //a>>b arithmetic
		parameter ALUmult = 4'b1100; //a*b
		
	
	always@* begin
		case (sel)
			ALUand:	out <= op1 & op2;
			ALUor:	out <= op1 | op2;
			ALUadd:	out <= op1 + op2;
			ALUandnot:	out <= op1 & (~op2);
			ALUornot:	out <= op1 | (~op2);
			ALUsub:	out <= op1 - op2;
			ALUslt:	if (op1 < op2) out <= 1;
						else out <= 0;
			ALUxor: out <= op1^op2;
			ALUsll: out <= op1<<op2;
			ALUsrl: out <= op1>>op2;
			ALUsra: out <= op1>>op2;
			ALUmult: out <= op1*op2;
			default: out <= 0;
		endcase
	end

endmodule

module tb_ALU;
	parameter w = 32;
	reg signed [w-1:0] in1, in2;
	reg [3:0] sel;
	wire signed [w-1:0] result;
	
	ALU #(.width(w)) t1 (.op1(in1), .op2(in2), .sel(sel), .out(result));
	
	initial begin
	in1 = -3; in2 = -1; sel = 0;
	#5 sel = 1;
	#5 sel = 2;
	#5 sel = 4;
	#5 sel = 5;
	#5 sel = 6;
	#5 sel = 7;
	#5 sel = 8;
	#5 sel = 9;
	#5 sel = 10;
	#5 sel = 11;
	#5 sel = 12;
	end
endmodule
