`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:14:39 02/18/2014 
// Design Name: 
// Module Name:    SingleCycleProcessor 
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
module SingleCycleProcessor #(parameter width = 32, wordLength = 32)
			(input clk, rst, RegWrite, MemWrite,
			 input [2:0] ALUop,
			 output [width-1:0] RD1, RD2, ALUOut, ReadD, WriteMem);

	wire [$clog2(width)-1:0] pcOut, pcPlusOne;
	wire [width-1:0] instr;
	wire [width-1:0] SrcA, SrcB;
	wire [width-1:0] ALUresult;
	wire [width-1:0] ReadData, WriteData;
	
	nbitReg #(.width($clog2(width))) PC (.din(pcPlusOne), .clk(clk), .rst(rst), .dout(pcOut));
	InstructionMemory #(.width(width), .wordLength(wordLength)) iMem
		(.din(pcOut), .dout(instr));
	RegisterFile #(.width(width), .wordLength(wordLength)) rFile
		(.addr1(instr[25:21]), .addr2(instr[20:16]), .addr3(instr[20:16]), .clk(clk), .write(RegWrite), .writeValue(ReadData), .r1(SrcA), .r2(WriteData));
	DataMemory #(.width(width), .wordLength(wordLength)) dMem
		(.clk(clk), .write(MemWrite), .wIn(WriteData), .din(ALUresult[4:0]), .dout(ReadData));
	ALU #(.width(width)) ALU1 (.op1(SrcA), .op2(SrcB), .sel(ALUop), .out(ALUresult));
	SignExtend #(.in(width/2), .out(width)) SignEx (.din(instr[15:0]), .dout(SrcB)); //sign extends offset
	Increment #(.width($clog2(width))) pcInc (.din(pcOut), .dout(pcPlusOne)); //just adds one to PC
	
	assign RD1 = SrcA;
	assign RD2 = SrcB;
	assign ALUOut = ALUresult;
	assign ReadD = ReadData;
	assign WriteMem = WriteData;

endmodule

module tb_SingleCycleProcessor;
	parameter w = 32;
	parameter WL = 32;
	reg clk, rst, write1, write2;
	reg [2:0] ALUsel;
	wire [w-1:0] RD1, RD2, ALUOut, ReadD, WriteMem;
	
	SingleCycleProcessor #(.width(w), .wordLength(WL)) test1
		(.clk(clk), .rst(rst), .RegWrite(write1), .MemWrite(write2), .ALUop(ALUsel),
			.RD1(RD1), .RD2(RD2), .ALUOut(ALUOut), .ReadD(ReadD), .WriteMem(WriteMem));
			
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin
	//$readmemb("dMem.txt", tb_SingleCycleProcessor.uut.SingleCycleProcessor.dMem.mem);
	//$readmemb("rFile.txt", tb_SingleCycleProcessor.uut.SingleCycleProcessor.rFile.rFile);
	//$readmemb("loadInst.txt", tb_SingleCycleProcessor.uut.SingleCycleProcessor.iMem.instructionMem);
	ALUsel = 3'b010; write1 = 1; write2 = 0; rst = 1;
	#11 rst = 0;
	end
endmodule
