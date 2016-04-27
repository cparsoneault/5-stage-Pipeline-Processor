`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    HazardUnit
//////////////////////////////////////////////////////////////////////////////////
module HazardUnit #(parameter width = 32, wordLength = 32)
		(input [$clog2(width)-1:0] rsD, rsE, rtD, rtE, WriteRegE, WriteRegM, WriteRegW,
		 input RegWriteM, RegWriteW, RegWriteE, MemtoRegE, MemtoRegM, BranchD,
		 input rst,
		 output reg [1:0] ForwardAE, ForwardBE,
		 output reg StallF, StallD, FlushE,
		 output reg ForwardAD, ForwardBD);
		 
	reg lwstall, branchstall;
		 
	always@* begin //Forwarding logic
		if ((rsE != 0) && (rsE == WriteRegM) && RegWriteM)
			ForwardAE = 2'b10;
		else if ((rsE != 0) && (rsE == WriteRegW) && RegWriteW)
			ForwardAE = 2'b01;
		else ForwardAE = 2'b00;
	end
	
	always@* begin //Forwarding logic
		if ((rtE != 0) && (rtE == WriteRegM) && RegWriteM)
			ForwardBE = 2'b10;
		else if ((rtE != 0) && (rtE == WriteRegW) && RegWriteW)
			ForwardBE = 2'b01;
		else ForwardBE = 2'b00;
	end
	
	always@* begin //stall logic
		lwstall = ((rsD == rtE) || (rtD == rtE)) && MemtoRegE;
	end
	
	always@* begin //branch logic
		ForwardAD = (rsD != 0) && (rsD == WriteRegM) && RegWriteM;
		ForwardBD = (rtD != 0) && (rtD == WriteRegM) && RegWriteM;
		branchstall = (BranchD && RegWriteE && (WriteRegE == rsD || WriteRegE == rtD))
							||
							(BranchD && MemtoRegM && (WriteRegM == rsD || WriteRegM == rtD));
	end

	always@* begin
		StallF = lwstall || branchstall;
		StallD = StallF;
		FlushE = StallD;
	end
	
//	always@* begin
//		if (rst) begin lwstall = 0;
//							branchstall = 0;
//					end
//		else ;
//	end

endmodule

module tb_HazardUnit;
	parameter w = 32;
	parameter wL = 32;
	reg [$clog2(w)-1:0] rsd, rse, rtd, rte, writerege, writeregm, writeregw;
	reg regwritem, regwritew, regwritee, memtorege, memtoregm, branchd, rst;
	wire [1:0] forwardae, forwardbe;
	wire stallf, stalld, flushe, forwardad, forwardbd;
	
	HazardUnit #(.width(w), .wordLength(wL)) t1
		(.rsD(rsd), .rsE(rse), .rtD(rtd), .rtE(rte), .WriteRegE(writerege), .WriteRegM(writeregm), .WriteRegW(writeregw),
		 .RegWriteM(regwritem), .RegWriteW(regwritew), .RegWriteE(regwritee), .MemtoRegE(memtorege), .MemtoRegM(memtoregm), .BranchD(branchd),
		 .ForwardAE(forwardae), .ForwardBE(forwardbe), .rst(rst),
		 .StallF(stallf), .StallD(stalld), .FlushE(flushe),
		 .ForwardAD(forwardad), .ForwardBD(forwardbd));
	
	initial begin
		rst = 1;
		rsd = 0; rse = 0; rtd = 0; rte = 0;
		writerege = 0; writeregm = 0; writeregw = 0;
		regwritem = 0; regwritew = 0; memtorege = 0;
		memtoregm = 0; branchd = 0; regwritee = 0;
		#5 rst = 0;
		#5 regwritem = 1; rse = 2; writeregm = 2;	//forwardae = 10
		#5 regwritem = 0; writeregm = 0; regwritew = 1; writeregw = 2; //forwardae = 01
		#5 regwritew = 0; writeregw = 0; rse = 0;
		#5 memtorege = 1; rsd = 2; rte = 2;	//lwstall = 1, stallf = stalld = flushe = 1
		#5 rsd = 0; rtd = 2;	//lwstall = 1, stallf = stalld = flushe = 1
		#5 rtd = 0; rte = 0; regwritem = 1; rsd = 2;
		writeregm = 2; //forwardad = 1
		#5 rsd = 0; rtd = 2; //forwardbd = 1
		#5 memtorege = 0;
		#5 writeregm = 0; regwritem = 0; rtd = 0;
		#5 branchd = 1; regwritee = 1; writerege = 5; rsd = 5; //branchstall = 1
		#5 rsd = 0; rtd = 5;	//branchstall = 1
		#5 writerege = 0; regwritee = 0; memtoregm = 1; writeregm = 5; //branchstall = 1
		#5 rtd = 0; rsd = 5;
	end
	
endmodule
