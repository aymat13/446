module controller(input wire 				clk,reset,
						input wire [31:12] 	Instr,
						input wire CO,N,Z,OVF,
						output wire MemWrite,
						output reg PCsrc,LR,RegWrite,
						output wire [1:0] MemtoReg,
						output wire ALUSrc,RegSrc,
						output reg [2:0] ALUControl,
						output wire [3:0] Flags);

	reg NoWrite,FlagWrite;
	wire RegW,ALUOp;
	reg [6:0] controls;
	wire [5:0] Funct;
	wire [1:0] Op;
	wire [3:0] Rd;
	wire [3:0] ALUFlags;
	
	assign ALUFlags = {N,Z,CO,OVF};
	
	Reg_WE #(2) flagreg1 (clk,reset,FlagWrite,ALUFlags[3:2],Flags[3:2]);
	Reg_WE #(2) flagreg0 (clk,reset,FlagWrite,ALUFlags[1:0],Flags[1:0]);
	
	assign Funct = Instr[25:20];
	assign Op = Instr[27:26];
	assign Rd = Instr[15:12];
	
	//Main Decoder
	always @* begin
		casex(Op)
			2'b00: controls = 7'b0000101; //DP Instructions. No immidiate, we dont care about func5
			2'b01: begin
				if(Funct[0]) controls = 7'bx101100; //LDR Instruction
				else controls = 7'b11xx010; //STR Instruction
			end
			default: controls = 7'bx;
		endcase
	end
	
	assign {RegSrc,ALUSrc,MemtoReg,RegW,MemWrite,ALUOp} = controls;
	
	//ALU Decoder
	always @* begin
		if(ALUOp) begin
			case(Funct[4:1])
				4'b0100: begin
					ALUControl = 3'b000; //ADD
					NoWrite = 0;
					FlagWrite = 1;
				end
				4'b0010: begin
					ALUControl = 3'b001; //SUB
					NoWrite = 0;
					FlagWrite = 1;
				end
				4'b0000: begin 
					ALUControl = 3'b100; //AND
					NoWrite = 0;
					FlagWrite = 1;
				end
				4'b1100: begin 
					ALUControl = 3'b101; //ORR
					NoWrite = 0;
					FlagWrite = 1;
				end
				4'b1010: begin 
					ALUControl = 3'b001; //CMP
					NoWrite = 1;
					FlagWrite = 1;
				end
				4'b0001: begin
					ALUControl = 3'b000;
					LR = 0; //LSL
					NoWrite = 0;
					FlagWrite = 0;
				end
				4'b1000: begin
					ALUControl = 3'b000;
					LR = 1; //LSR
					NoWrite = 0;
					FlagWrite = 0;
				end
				default: ALUControl = 3'bx;
			endcase
			
			RegWrite = RegW & (~NoWrite);
		end
		else begin
			ALUControl = 3'b000; //Non DP Instuctions
			FlagWrite=0; // Don't Update Flags
		end
	end
	
	//PC Logic
	always @* begin
		PCsrc = (Rd == 4'b1111) & RegW;
	end
endmodule
