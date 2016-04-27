`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    PipelineProcessor
//////////////////////////////////////////////////////////////////////////////////
module PipelineProcessor #(parameter width = 32, wordLength = 32)
		(input clk, rst,
		 output full, empty, error,
		 output[$clog2(width) - 1:0] sp);

//************** Wires ************//
//Fetch Stage Wires
wire [width-1:0] PCPlus1F, PCin, PCJin, PCF, RD;
wire PCFetch;

//Decode Stage Wires
wire [width-1:0] InstrD, PCPlus1D, RD1, RD2; //Read instruction, PC+1, Read Port 1/2
wire [width-1:0] forwardADMuxOut, forwardBDMuxOut, SignImmD;	//Output of Forwarding Mux's and Sign Extender
wire [width-1:0] PCBranchD, PCBranchD2; //PCBranchD = the value of PC calculated during a Branch
													// PCBranchD2 = Output of mux between Value of PC calculated for Branch and Value to Jr to.
wire RegWriteD, MemtoRegD, MemWriteD, ALUSrcD; //RegWrite, MemtoReg, MemWrite, and ALUSrc values for instr in Decode stage
wire RegDstD, BranchD, EqualD, JumpD, PCSrcD;	//RegDst, Branch, Comparator Output, Jump, and PCSrc for Decode stage
wire PushD, PopD, BneD, BeqBneOut, JalD, JrD;	//Push, Pop, Bne, Jal, and Jr values during decode stage,
																//BeqBneOut is output of Mux that decides whether Beq or Bne instr
wire [3:0] ALUControlD;	//Controller output for ALU control signal

//Execute Stage Wires
wire [width-1:0] RD1E, RD2E, SrcAE, SrcBE;	//Value of RD1, RD2 from decode stage, SrcAE and SrcBE input to ALU
wire [width-1:0] SignImmE, WriteDataE, ALUOutE; //Value output from Sign Extension from Decode Stage
																//WriteDataE: Data to be written to Memory
																//ALUOutE: Output of ALU during Execute stage
wire [4:0] RsE, RtE, RdE, WriteRegE, WriteRegEMuxOut;	//Source/Dest Registers during Execute stage
																		//WriteRegE: Register to write to
																		//WriteRegEMuxOut: Mux Output decided by Jal or register in Instr
wire RegWriteE, MemtoRegE, MemWriteE, ALUSrcE;	//RegWrite,MemtoReg,MemWrite, ALUSrc values in Execute stage
wire RegDstE;	//Register Destination in Execute stage
wire PushE, PopE, JalE; //Push, Pop and Jal signals in Execute
wire [3:0] ALUControlE;	//ALUControl for Instr in Execute stage

//Memory Stage Wires
wire [width-1:0] ALUOutM, WriteDataM, RDM, StackOut; //Output of ALU from Execute stage
																	//Data to be written to Memory
																	//Data read from Memory
																	//Data popped from stack
wire [width-1:0] MemoryStageOut;	//Output of Mux deciding between Read data from Memory or data from Stack
wire [4:0] WriteRegM;	//Register to be written to
wire RegWriteM, MemtoRegM, MemWriteM;	//Value of RegWrite, MemtoReg, MemWrite from Execute stage
wire PushM, PopM;	//Value of Push and Pop

//WriteBack Stage Wires
wire [width-1:0] ReadDataW, ALUOutW, ResultW;
wire [4:0] WriteRegW;
wire RegWriteW, MemtoRegW;

//Hazard Unit wires
wire StallF, StallD, ForwardAD;
wire ForwardBD, FlushE;
wire [1:0] ForwardAE, ForwardBE;
//*********************************//

////////////////////////////////////////
//Fetch Stage

Mux #(.width(width)) PCinMux
				(.sel(PCSrcD),
				 .in1(PCPlus1F), .in2(PCBranchD),
				.out(PCin));	//pcin mux
Mux #(.width(width)) PCinJumpMux
				(.sel(JumpD),
				 .in1(PCin), .in2(SignImmD),
				.out(PCJin));	//pcin mux for Jump				
nbitEnReg #(.width(width)) PC
				(.din(PCJin),
				.clk(clk), .rst(rst), .clr(1'b0), .en(~StallF),//////////////////////////////////////////////////////////////////////
				.dout(PCF));	//Program Counter reg
				
InstructionMemory #(.width(width), .wordLength(wordLength)) iMem
				(.din(PCF[4:0]), .dout(RD));	//Instruction Memory
		
counter #(.width(width)) PCPlusOne
				(.din(PCF), .dout(PCPlus1F));	//PCIncrementer

Mux #(.width(1)) PCFetchClrMux
				(.sel(JumpD),
				 .in1(PCSrcD), .in2(1'b1),
				.out(PCFetch));	//mux for endFetchStage clr signal
				//in1 carries result of BranchD && ComparatorOut
				//PCFetch = clr signal for the end of fetch stage; for flusing
				
nbitEnReg #(.width(2*width)) endFetchStage
				(.din({RD, PCPlus1F}), .clk(clk), .clr(PCFetch), .rst(rst),
				.en(~StallD), .dout({InstrD, PCPlus1D})); //End of Fetch stage///////////////////////////////////////////
////////////////////////////////////////

//========================================

////////////////////////////////////////
//Decode Stage

Controller c1
				(.OpCode(InstrD[31:26]), .Funct(InstrD[5:0]),
				.DecodeOut({RegWriteD, RegDstD, ALUSrcD, BranchD, MemWriteD, MemtoRegD, JumpD, PopD, PushD, BneD, JalD, JrD}),
				.ALUControlOut(ALUControlD)); //Control Unit

and and1 (PCSrcD, BranchD, BeqBneOut);
Comparator #(.width(width)) comparator1
				(.in1(forwardADMuxOut), .in2(forwardBDMuxOut), .out(EqualD)); //Comparator
		
RegisterFile #(.width(width), .wordLength(wordLength)) regFile
				(.addr1(InstrD[25:21]), .addr2(InstrD[20:16]), .addr3(WriteRegW), .clk(clk),
				.write(RegWriteW), .writeValue(ResultW), .r1(RD1), .r2(RD2)); //RegFile
		
SignExtend #(.in(16), .out(width)) t1
				(.din(InstrD[15:0]), .dout(SignImmD)); //Sign Extender

adder #(.width(width)) adder1
				(.op1(SignImmD), .op2(PCPlus1D), .sum(PCBranchD)); //Adder
				
Mux #(.width(width)) JrPcPlusOneMux	//Mux selects whether to use the Jump Reg or the branch calculation
				(.sel(JrD),
				 .in1(PCBranchD), .in2(RD1),
				 .out(PCBranchD2)); //Mux that decided whether to use Jr or Branch
				
Mux #(.width(width)) forwardADMux
				(.sel(1'b0),
				 .in1(RD1), .in2(ALUOutM),
				 .out(forwardADMuxOut)); //Mux Forward to SrcA
				 
Mux #(.width(width)) forwardBDMux
				(.sel(1'b0),
				 .in1(RD2), .in2(ALUOutM),
				 .out(forwardBDMuxOut)); //Mux forward to SrcB
				 
Mux #(.width(1)) BeqBneMux //this mux selects based on whether bne or beq, and inputs it into the and gate
				(.sel(BneD),
				 .in1(EqualD), .in2(~EqualD),
				 .out(BeqBneOut)); //selects based on whether Beq or Bne
				 
nbitEnReg #(.width(123)) endDecodeStage
				(.din({RegWriteD, MemtoRegD, MemWriteD, ALUControlD,
					ALUSrcD, RegDstD, RD1, RD2, InstrD[25:21],
					InstrD[20:16], InstrD[15:11], SignImmD, PushD, PopD, JalD}),
				.clk(clk), .clr(FlushE), .rst(rst), .en(1'b1),
				.dout({RegWriteE, MemtoRegE, MemWriteE, ALUControlE,
					ALUSrcE, RegDstE, RD1E, RD2E, RsE,
					RtE, RdE, SignImmE, PushE, PopE, JalE})); //End of Decode Stage
///////////////////////////////////////

//========================================

////////////////////////////////////////
//Execute Stage

Mux3to1 #(.width(width)) forwardAEMux
				(.in1(RD1E), .in2(ResultW), .in3(ALUOutM),
				.sel(ForwardAE), .dout(SrcAE));//////////////////////////////////////////////////////////////////////////////////////
				
Mux3to1 #(.width(width)) forwardBEMux
				(.in1(RD2E), .in2(ResultW), .in3(ALUOutM),
				.sel(ForwardBE), .dout(WriteDataE));////////////////////////////////////////////////////////////////////////////////////
				
Mux #(.width(width)) SrcBEMux
				(.sel(ALUSrcE),
				 .in1(WriteDataE), .in2(SignImmE),
				 .out(SrcBE));
				 
ALU #(.width(width)) ALUMain
				(.op1(SrcAE), .op2(SrcBE),
				.sel(ALUControlE), .out(ALUOutE));

Mux #(.width(5)) WriteRegEMux
				(.sel(RegDstE),
				 .in1(RtE), .in2(RdE),
				 .out(WriteRegE));
				 
Mux #(.width(5)) JalWriteRegMux //if jal is the operation, this Mux will output the value 31 (the Jump register)
				(.sel(JalE),
				 .in1(WriteRegE), .in2(5'b11111),
				 .out(WriteRegEMuxOut));

nbitReg #(.width(74)) endExecuteStage
				(.din({RegWriteE, MemtoRegE, MemWriteE,
					ALUOutE, WriteDataE, WriteRegEMuxOut, PushE, PopE}),
				.clk(clk), .rst(rst),
				.dout({RegWriteM, MemtoRegM, MemWriteM,
					ALUOutM, WriteDataM, WriteRegM, PushM, PopM})); //End of Execute Stage
///////////////////////////////////////

//========================================

////////////////////////////////////////
//Memory Stage

DataMemory #(.width(width + 16), .wordLength(wordLength)) dMem
				(.clk(clk), .write(MemWriteM), .wIn(WriteDataM),
				.din(ALUOutM[4:0]), .dout(RDM));

aStack #(.width(width), .wordLength(wordLength)) stack1 
				(.clk(clk), .push(PushM), .pop(PopM), .rst(rst), .din(WriteDataM),
				 .full(full), .empty(empty), .error(error), .sp(sp), .dout(StackOut));

Mux #(.width(width)) StackOrMemoryMux
				(.sel(PopM),
				 .in1(RDM), .in2(StackOut),
				 .out(MemoryStageOut)); //Mux, selects whether Popped data or memory's data is passed to next stage

				
nbitReg #(.width(71)) endMemStage
				(.din({RegWriteM, MemtoRegM,
					MemoryStageOut, ALUOutM, WriteRegM}),
				.clk(clk), .rst(rst),
				.dout({RegWriteW, MemtoRegW, ReadDataW,
					ALUOutW, WriteRegW})); //End of Memory Stage
////////////////////////////////////////

//========================================

////////////////////////////////////////
//WriteBack Stage

Mux #(.width(width)) WriteRegWMux
				(.sel(MemtoRegW),
				 .in1(ALUOutW), .in2(ReadDataW),
				 .out(ResultW)); //end of WriteBack Stage
////////////////////////////////////////

//========================================

////////////////////////////////////////
//Hazard Unit

HazardUnit #(.width(width), .wordLength(wordLength)) HazardControl
		(.rsD(InstrD[25:21]), .rsE(RsE), .rtD(InstrD[20:16]), .rtE(RtE),
			.WriteRegE(WriteRegE), .WriteRegM(WriteRegM), .WriteRegW(WriteRegW),
			.RegWriteM(RegWriteM), .RegWriteW(RegWriteW), .RegWriteE(RegWriteE),
			.MemtoRegE(MemtoRegE), .MemtoRegM(MemtoRegM), .BranchD(BranchD),
			.ForwardAE(ForwardAE), .ForwardBE(ForwardBE), .rst(rst),
			.StallF(StallF), .StallD(StallD), .FlushE(FlushE),
			.ForwardAD(ForwardAD), .ForwardBD(ForwardBD));
////////////////////////////////////////
endmodule

module tb_Pipeline;
	reg clk, rst;
	wire full, empty, error;
	parameter w = 32;
	parameter wL = 32;
	wire [$clog2(w) - 1:0] sp;
	
	PipelineProcessor #(.width(w), .wordLength(wL)) m1
				(.clk(clk), .rst(rst), .empty(empty), .full(full), .error(error),
				 .sp(sp));
				
	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin
		rst = 1;
		#92 rst = 0;
	end

endmodule