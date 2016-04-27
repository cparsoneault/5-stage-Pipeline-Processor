`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    Controller
//////////////////////////////////////////////////////////////////////////////////
module Controller#(parameter codeWidth = 6, MainDecodeOut = 12)
			(input [codeWidth-1:0] OpCode, Funct,
			 output [MainDecodeOut-1:0] DecodeOut,
			 output [3:0] ALUControlOut);
			 
	wire [3:0] ALUOpIn;
	
	MainDecoder #(.opWidth(codeWidth), .ALUOpWidth(4)) d1
			(.opCode(OpCode), .ALUOp(ALUOpIn), .RegWrite(DecodeOut[MainDecodeOut-1]), .RegDst(DecodeOut[MainDecodeOut-2]),
			.ALUSrc(DecodeOut[MainDecodeOut-3]), .Branch(DecodeOut[MainDecodeOut-4]), .MemWrite(DecodeOut[MainDecodeOut-5]), 
			.MemtoReg(DecodeOut[MainDecodeOut-6]), .Jump(DecodeOut[MainDecodeOut-7]), .Pop(DecodeOut[MainDecodeOut-8]),
			.Push(DecodeOut[MainDecodeOut-9]), .Bne(DecodeOut[MainDecodeOut-10]), .Jal(DecodeOut[MainDecodeOut-11]),
			.Jr(DecodeOut[MainDecodeOut-12]));
	
	ALUDecoder #(.opWidth(codeWidth), .ALUOpWidth(4)) ad1
						(.ALUDecodeIn(ALUOpIn), .functionCode(Funct), .ALUControl(ALUControlOut));
	

endmodule

module MainDecoder #(parameter opWidth = 6, ALUOpWidth = 3)
					(input [opWidth-1:0] opCode,
					 output reg [ALUOpWidth-1:0] ALUOp,
					 output reg RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, Jump, Pop, Push, Bne, Jal, Jr);
					 
	parameter rType = 6'b000000;//Valid Op Codes
	parameter addi = 6'b001000;
	parameter andi = 6'b001100;
	parameter ori = 6'b001101;
	parameter slti = 6'b001010;
	parameter xori = 6'b001110;
	parameter lw = 6'b100011;
	parameter sw = 6'b101011;
	parameter beq = 6'b000100;
	parameter bne = 6'b000101;
	parameter j = 6'b000010;
	parameter push = 6'b111111;
	parameter pop = 6'b111110;
	parameter jal = 6'b000011;
	parameter jr = 6'b111101;
	//parameter lui = 6'b001111;
					 
	always@* begin
		case (opCode)
		
			rType: 	begin ALUOp <= 4'b0010; //tells ALU to read function field
								RegWrite <= 1;
								RegDst <= 1;
								ALUSrc <= 0;
								Branch <= 0;	
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end
						
			addi: 	begin ALUOp <= 4'b0000; //ALUAdd
								RegWrite <= 1;
								RegDst <= 0;
								ALUSrc <= 1;	
								Branch <= 0;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end
						
			andi: 	begin ALUOp <= 4'b0011; //ALUand
								RegWrite <= 1;
								RegDst <= 0;
								ALUSrc <= 1;	
								Branch <= 0;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end
						
			ori: 	begin ALUOp <= 4'b0100; //ALUor
								RegWrite <= 1;
								RegDst <= 0;
								ALUSrc <= 1;	
								Branch <= 0;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end

			slti: 	begin ALUOp <= 4'b0101; //ALUslt
								RegWrite <= 1;
								RegDst <= 0;
								ALUSrc <= 1;	
								Branch <= 0;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end

			xori: 	begin ALUOp <= 4'b0110; //ALUxor
								RegWrite <= 1;
								RegDst <= 0;
								ALUSrc <= 1;	
								Branch <= 0;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end
						
			lw: 		begin ALUOp <= 4'b0000; //ALUAdd
								RegWrite <= 1;
								RegDst <= 0;
								ALUSrc <= 1;	
								Branch <= 0;
								MemWrite <= 0;
								MemtoReg <= 1;
								Jump <= 0;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end
						
			sw: 		begin ALUOp <= 4'b0000;
								RegWrite <= 0;
								RegDst <= 0;
								ALUSrc <= 1;	
								Branch <= 0;
								MemWrite <= 1;
								MemtoReg <= 0;
								Jump <= 0;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end
						
			beq: 		begin ALUOp <= 4'b0001; //ALUSubtract
								RegWrite <= 0;
								RegDst <= 0;
								ALUSrc <= 0;	
								Branch <= 1;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end
			
			bne: 		begin ALUOp <= 4'b0001; //ALUSubtract
								RegWrite <= 0;
								RegDst <= 0;
								ALUSrc <= 0;	
								Branch <= 1;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
								Pop <= 0;
								Push <= 0;
								Bne <= 1;
								Jal <= 0;
								Jr <= 0;
						end
						
			j:			begin 
								Branch <= 0;
								RegWrite <= 0;
								RegDst <= 0;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 1;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end
			
			jal:			begin 
								Branch <= 0;
								RegWrite <= 1;
								RegDst <= 0;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 1;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 1;
								Jr <= 0;
						end
						
			jr:			begin 
								Branch <= 0;
								RegWrite <= 0;
								RegDst <= 0;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 1;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 1;
								Jr <= 1;
						end
			
			push:		begin ALUOp <= 4'b0000;
								RegWrite <= 0;
								RegDst <= 0;
								ALUSrc <= 0;
								Branch <= 0;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
								Pop <= 0;
								Push <= 1;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end
						
			pop:		begin ALUOp <= 4'b0000;
								RegWrite <= 1;
								RegDst <= 0;
								ALUSrc <= 0;
								Branch <= 0;
								MemWrite <= 0;
								MemtoReg <= 1;
								Jump <= 0;
								Pop <= 1;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end
						
			default:	begin ALUOp <= 4'b0000;
								RegWrite <= 0;
								RegDst <= 0;
								ALUSrc <= 0;	
								Branch <= 0;
								MemWrite <= 0;
								MemtoReg <= 0;
								Jump <= 0;
								Pop <= 0;
								Push <= 0;
								Bne <= 0;
								Jal <= 0;
								Jr <= 0;
						end
						
		endcase
	end
endmodule

module ALUDecoder #(parameter opWidth = 6, ALUOpWidth = 4)
						(input [ALUOpWidth-1:0] ALUDecodeIn,
						 input [opWidth-1:0] functionCode,
						 output reg [3:0] ALUControl);
	//ALUDecodeIn start					 
	parameter addOp = 4'b0000;
	parameter subOp = 4'b0001;
	parameter ALUOp = 4'b0010;
	parameter andOp = 4'b0011;
	parameter orOp  = 4'b0100;
	parameter sltOp = 4'b0101;
	parameter xorOp = 4'b0110;
	//ALUDecodeIn end
	
	//functionCode start
	parameter funcAdd = 6'b100000;
	parameter funcSub = 6'b100010;
	parameter funcSlt = 6'b101010;
	parameter funcAnd = 6'b100100;
	parameter funcOr = 6'b100101;
	parameter funcXor = 6'b100110;
	parameter funcSll = 6'b000001;
	parameter funcSrl = 6'b000010;
	parameter funcSra = 6'b000011;
	parameter funcSllv = 6'b000100;
	parameter funcSrlv = 6'b000110;
	parameter funcSrav = 6'b100001;
	parameter funcMult = 6'b011000;
	//functionCode end
	
	//ALUControl start
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
	parameter ALUmul = 4'b1100; //a*b
	//ALUControl end
	
	always@* begin
		case (ALUDecodeIn)
			addOp: ALUControl <= ALUadd;
			subOp: ALUControl <= ALUsub;
			andOp: ALUControl <= ALUand;
			orOp: ALUControl <= ALUor;
			sltOp: ALUControl <= ALUslt;
			xorOp: ALUControl <= ALUxor;
			ALUOp: case (functionCode)
						funcAnd: ALUControl <= ALUand;
						funcOr: ALUControl <= ALUor;
						funcAdd: ALUControl <= ALUadd;
						funcSub: ALUControl <= ALUsub;
						funcSlt: ALUControl <= ALUslt;
						funcXor: ALUControl <= ALUxor;
						funcSll: ALUControl <= ALUsll;
						funcSrl: ALUControl <= ALUsrl;
						funcSra: ALUControl <= ALUsra;
						funcMult: ALUControl <= ALUmul;
						funcSllv: ALUControl <= ALUsll;
						funcSrlv: ALUControl <= ALUsrl;
						funcSrav: ALUControl <= ALUsra;
						default: ALUControl <= ALUand;
					 endcase
			default: ALUControl <= ALUand;
		endcase
	end
						 
endmodule

module tb_Controller;
	parameter addi = 6'b001000; //addi output = 1010000
	parameter lw = 6'b100011;	//lw output = 1010010
	parameter sw = 6'b101011;	//sw output = 0X101X0
	parameter beq = 6'b000100; 	//beq output = 0X010X0
	parameter j = 6'b000010;	//j output = 0XXX0X1
	parameter rType = 6'b000000; //rType output = 1100000
											//default output = 0XXX0XX
											
	parameter andi = 6'b001100;	//same output as addi
	parameter ori = 6'b001101;
	parameter slti = 6'b001010;
	parameter xori = 6'b001110;
	
	parameter funcAdd = 6'b100000;	//ALU output = 010
	parameter funcSub = 6'b100010;	//ALU output = 110
	parameter funcSlt = 6'b101010;	//ALU output = 111
	parameter funcAnd = 6'b100100;	//ALU output = 000
	parameter funcOr = 6'b100101;		//ALU output = 001
												//only occurs if rType or addi
												//default output = 000;
	parameter funcXor = 6'b100110;
	parameter funcSll = 6'b000001;
	parameter funcSrl = 6'b000010;
	parameter funcSra = 6'b000011;
	parameter funcSllv = 6'b000100;
	parameter funcSrlv = 6'b000110;
	parameter funcSrav = 6'b100001;
	parameter funcMult = 6'b011000;
	
	parameter c = 6;
	parameter m = 7;
	reg [c-1:0] opIn, functIn;
	wire [3:0] out;
	wire [6:0] decoded;
	
	Controller #(.codeWidth(c), .MainDecodeOut(m)) c1
			(.OpCode(opIn), .Funct(functIn), .DecodeOut(decoded), .ALUControlOut(out));
			
	initial begin
	opIn = 0; functIn = 0;
	#5 opIn = lw;
	#5 opIn = sw;
	#5 opIn = beq;
	#5 opIn = j; functIn = funcAdd;
	#5 opIn = addi;
	#5 opIn = andi;
	#5 opIn = ori;
	#5 opIn = slti;
	#5 opIn = xori;
	#5 opIn = rType;
	#5 functIn = funcSub;
	#5 functIn = funcSlt;
	#5 functIn = funcAnd;
	#5 functIn = funcOr;
	#5 functIn = funcXor;	
	#5 functIn = funcSll;
	#5 functIn = funcSrl;
	#5 functIn = funcSra;
	#5 functIn = funcSllv;
	#5 functIn = funcSrlv;
	#5 functIn = funcSrav;
	#5 functIn = funcMult;
	end

endmodule
