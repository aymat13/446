module Controller(R0_sign,R1_sign,OVF,Z,N,E_out,clk,LOAD,COMP,CLR,Q0,ALP_op,
					R0_we,R1_we,srcA_sel,srcB_sel,ALU_op,AC_lr,AC_ps,
					Q_lr,Q_ps,R0src_sel,R1src_sel,R0_res,R1_res,AC_res,Q_res,ERR,E_in,Esrc_sel);
					
					input wire R0_sign,R1_sign,OVF,Z,N,E_out,clk,LOAD,COMP,CLR,Q0;
					input wire [2:0] ALP_op;
					
					output reg R0_we,R1_we,AC_lr,AC_ps,Q_lr,Q_ps,R0_res,R1_res,AC_res,Q_res,ERR,E_in;
					
					output reg [1:0] srcA_sel,srcB_sel,R0src_sel,R1src_sel,Esrc_sel;
					output reg [2:0] ALU_op;
					
					parameter SIZE = 4;
					parameter LOADING = 4'b0000,
								 ADD = 4'b0001,
								 SUB = 4'b0010,
								 AND = 4'b0011,
								 OR = 4'b0100,
								 EXOR = 4'b0101,
								 BIC = 4'b0110,
								 MUL = 4'b0111,
								 MUL_START = 4'b1000,
								 MUL_ASR = 4'b1001,
								 CLEAR = 4'b1011,
								 THE_END = 4'b1100,
								 COMPLEMENT0 = 4'b1101,
								 COMPLEMENT1 = 4'b1110;
					
					reg [SIZE-1:0] state,next_state;
					
					always@(state) 
					begin : FSM_Comb
						next_state = LOADING;
						case(state)
							LOADING: begin
								if(LOAD==1) begin
									R0_we=1;
									R1_we=1;
									R1src_sel=2'b10;
									R0src_sel=2'b10;
									if(COMP==1) begin
										case(ALP_op)
											3'b000: next_state = ADD;
											3'b001: next_state = SUB;
											3'b010: next_state = MUL;
											3'b011: next_state = CLEAR;
											3'b100: next_state = AND;
											3'b101: next_state = OR;
											3'b110: next_state = EXOR;
											3'b111: next_state = BIC;
										endcase
									end
									else next_state = LOADING;
								end
							end
							ADD: begin
								ALU_op=3'b000;
								ERR=OVF;
								srcA_sel=2'b00;
								srcB_sel=2'b10;
								R0src_sel=2'b01;
								R1_res=1;
								R0_we=1;
								next_state = THE_END;
							end
							SUB: begin
								ALU_op=3'b001;
								ERR=OVF;
								srcA_sel=2'b00;
								srcB_sel=2'b10;
								R0src_sel=2'b01;
								R1_res=1;
								R0_we=1;
								next_state = THE_END;
							end
							AND: begin
								ALU_op=3'b100;
								srcA_sel=2'b00;
								srcB_sel=2'b10;
								R0src_sel=2'b01;
								R1_res=1;
								R0_we=1;
								next_state = THE_END;
							end
							OR: begin
								ALU_op=3'b101;
								srcA_sel=2'b00;
								srcB_sel=2'b10;
								R0src_sel=2'b01;
								R1_res=1;
								R0_we=1;
								next_state = THE_END;
							end
							EXOR: begin
								ALU_op=3'b110;
								srcA_sel=2'b00;
								srcB_sel=2'b10;
								R0src_sel=2'b01;
								R1_res=1;
								R0_we=1;
								next_state = THE_END;
							end
							BIC: begin
								ALU_op=3'b111;
								srcA_sel=2'b00;
								srcB_sel=2'b10;
								R0src_sel=2'b01;
								R1_res=1;
								R0_we=1;
								next_state = THE_END;
							end
							MUL: begin
								AC_res=1;
								E_in=0;
								srcA_sel=2'b00;
								srcB_sel=2'b11;
								ALU_op=3'b000;
								Q_ps=1;
								R0_we=1;
								R1_we=0;
								R0src_sel=2'b11;
								Esrc_sel=2'b10;
								next_state=MUL_START;
							end
							MUL_START: begin
								if(Z==1) begin
									R0_we=1;
									R1_we=1;
									R0src_sel=2'b00;
									R1src_sel=2'b00;
									next_state = THE_END;
								end
								else begin
									if({Q0,E_out} == 2'b10) begin
										ALU_op=3'b001;
										srcA_sel=2'b10;
										srcB_sel=2'b10;
										R1_we=0;
										R0_we=0;
										AC_ps=1;
										next_state=MUL_ASR;
									end
									else if ({Q0,E_out} == 2'b01) begin
										ALU_op=3'b000;
										srcA_sel=2'b10;
										srcB_sel=2'b10;
										R1_we=0;
										R0_we=0;
										AC_ps=1;
										next_state=MUL_ASR;
									end
									else next_state = MUL_ASR;
								end
							end
							MUL_ASR: begin
								srcA_sel=2'b00;
								srcB_sel=2'b10;
								ALU_op=3'b001;
								R0_we=1;
								R1_we=0;
								R0src_sel=2'b01;
								AC_ps=0;
								AC_lr=1;
								Q_ps=0;
								Q_lr=1;
								Esrc_sel=2'b01;
								next_state=MUL_START;
							end
							CLEAR: begin
								R0_res=1;
								R1_res=1;
								AC_res=1;
								Q_res=1;
								next_state=LOADING;
							end
							THE_END: begin
								if(LOAD==1) next_state=LOADING;
								else next_state=THE_END;
							end
							COMPLEMENT0: begin
								
							end
							COMPLEMENT1: begin
							
							end
							default: next_state = LOAD;
						endcase
					end
					
					always@(posedge clk) 
					begin : FSM_Seq
						if(CLR == 1) state <= CLEAR;
						else state <= next_state;				
					end
					

					
endmodule
