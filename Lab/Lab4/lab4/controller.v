module controller(input wire clk,reset,
						input wire [3:0] ALUFlags,
						input wire [15:0] Instr,
						output reg [1:0] PCSrc,RegSrc,ALUSrcB,ResultSrc,
						output reg PCWrite,LRWrite,AddrSrc,IRWrite,RegWrite,ALUSrcA,MemWrite,
						output reg [2:0] ALUControl,sh,
						output wire [3:0] Flags
						);
						
	parameter 	FETCH = 4'b0000, 
					DECODE = 4'b0001,
					STR = 4'b0010,
					LDR_reg0 = 4'b0011,
					LDR_reg1 = 4'b0100,
					LDR_imm = 4'b0101,
					EXECR = 4'b0110,
					SHIFT = 4'b0111,
					BRANCH = 4'b1000;
	reg [3:0] state = FETCH;
	reg [3:0] next_state = FETCH;
	reg ALUOp, FlagWrite, Branch, NoFlag;
	
	Reg_WE #(2) flagreg1 (clk,reset,FlagWrite,ALUFlags[3:2],Flags[3:2]);
	Reg_WE #(2) flagreg0 (clk,reset,FlagWrite,ALUFlags[1:0],Flags[1:0]);	
	
	//MAIN FSM
	always@(state) begin
		case(state)
			FETCH: begin
				NoFlag = 1;
				MemWrite = 0;
				AddrSrc = 0;
				IRWrite = 1;
				ALUSrcA = 1;
				ALUSrcB = 2'b10;
				ResultSrc = 10;
				PCWrite = 1;
				RegWrite = 0;
				ALUOp = 0;
				next_state = DECODE;
			end
			DECODE: begin
				NoFlag = 0;
				PCWrite = 0;
				IRWrite = 0;
				case(Instr[15:14])
					2'b00: next_state = EXECR; //DP OP
					2'b01: begin
						if(Instr[13]) begin
							if(Instr[12]) next_state = LDR_imm;
							else next_state = LDR_reg0;
						end
						else next_state = STR;
					end
					2'b10: next_state = BRANCH; //Branch
					2'b11: next_state = SHIFT; //Shift
				endcase
			end
			STR: begin
				ALUSrcB = 2'b11;
				sh = 3'b111;
				ResultSrc = 2'b11;
				AddrSrc = 1;
				MemWrite  = 1;
				next_state = FETCH;
			end
			LDR_reg0: begin
				ALUSrcB = 2'b00;
				sh = 3'b111;
				ResultSrc = 2'b11;
				AddrSrc = 1;
				next_state = LDR_reg1;
			end
			LDR_reg1: begin
				ResultSrc = 2'b01;
				RegWrite = 1;
				next_state = FETCH;
			end
			LDR_imm: begin
				ALUSrcB = 2'b01;
				sh = 3'b111;
				ResultSrc = 2'b11;
				RegWrite = 1;
				next_state = FETCH;
			end
			EXECR: begin
				ALUOp = 1;
				ALUSrcA = 0;
				ALUSrcB = 2'b00;
				ResultSrc = 2'b10;
				RegWrite = 1;
				next_state = FETCH;
			end
			SHIFT: begin
				sh = Instr[13:11];
				ALUSrcB = 2'b00;
				ResultSrc = 2'b11;
				RegWrite = 1;
				next_state = FETCH;
			end
			BRANCH: begin
				if(Branch)	PCWrite = 1;
				else PCWrite = 0;
				next_state = FETCH;
			end
		endcase
	end
	
	always@(posedge clk) begin
		if(reset) state <= FETCH;
		else state <= next_state;
	end
	
	
	//Instruction Decoder
	always @* begin
		case(Instr[15:14]) //Group ID
			2'b00: RegSrc = 2'b00; //DP Operations
			2'b01: begin
				if(Instr[13]) begin
					if(Instr[12]) RegSrc = 2'b00; //LDR with imm.
					else RegSrc = 2'b00; //LDR with register
				end else begin
					RegSrc = 2'b10; //STR
				end
			end
			2'b10: RegSrc = 2'b00; //Branch Operations
			2'b11: RegSrc = 2'b01; //Shifting
		endcase
	end
	
	//ALU Decoder
	always @* begin
		if(ALUOp) begin
			FlagWrite = 1;
			case(Instr[13:11])
				3'b000: ALUControl = 3'b000; //ADD
				3'b001: ALUControl = 3'b001; //SUB
				3'b010: ALUControl = 3'b100; //AND
				3'b011: ALUControl = 3'b101; //ORR
				3'b100: ALUControl = 3'b110; //EXOR
				default: ALUControl = 3'b000;
			endcase
		end else begin
			FlagWrite = 0;
			ALUControl = 3'b000;
		end
		FlagWrite = FlagWrite & ~(NoFlag);
	end
	
	//PCLogic
	always @* begin
		if(Instr[15:14] == 2'b10) begin //If it's a Branch instruction
			case(Instr[13:11]) 
				3'b000: Branch = 1; //UNCONDITIONAL
				3'b001: begin //BRANCH IF ZERO
					if(Flags[3] == 1) Branch = 1;
					else Branch = 0;
				end
				3'b010: begin //BRANCH IF NOT ZERO
					if(Flags[3] == 1) Branch = 0;
					else Branch = 1;
				end
				3'b011: begin //BRANCH IF CARRY IS SET
					if(Flags[0] == 1) Branch = 1;
					else Branch = 0;
				end
				3'b100: begin // BRANCH IF CARRY IS CLEAR
					if(Flags[0] == 1) Branch = 0;
					else Branch = 1;
				end
				3'b111: Branch = 1;
				default: Branch = 1;
			endcase
			if(Branch == 1) begin
				case(Instr[10:9])
					2'b00: begin  //No Link No indirect, takes the 8 bit imm value as address!
						PCSrc = 2'b11;
						LRWrite = 0;
					end
					2'b01: begin
						PCSrc = 2'b11; //Copy LR on branch
						LRWrite = 1;
					end
					2'b10: begin //Indirect Branching
						LRWrite = 0;
						if(Instr[2:0] == 3'b111) begin
							PCSrc = 2'b10; //LR as its output!
						end else begin
							PCSrc=2'b01; //Rm as its output!
						end
					end
				endcase
			end
			
			else begin
				LRWrite = 0;
				PCSrc = 2'b00;
			end
			
		end else begin
			PCSrc = 2'b00;
			LRWrite = 0;
		end
	end

endmodule
