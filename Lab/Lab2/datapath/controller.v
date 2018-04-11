module Controller(R0_sign,R1_sign,AC_sign,OVF,Z,N,E_out,clk,LOAD,COMP,CLR,Q0,ALP_op,
					R0_we,R1_we,srcA_sel,srcB_sel,ALU_op,AC_lr,AC_ps,ACsrc_sel,Qsrc_sel,
					Q_lr,Q_ps,R0src_sel,R1src_sel,R0_res,R1_res,AC_res,Q_res,ERR,E_in,Esrc_sel);
					
					input wire R0_sign,R1_sign,AC_sign,OVF,Z,N,E_out,clk,LOAD,COMP,CLR,Q0;
					input wire [2:0] ALP_op;
					
					output reg R0_we,R1_we,AC_lr,AC_ps,Q_lr,Q_ps,R0_res,R1_res,AC_res,Q_res,ERR,E_in,ACsrc_sel;
					
					output reg [1:0] srcA_sel,srcB_sel,R0src_sel,R1src_sel,Esrc_sel,Qsrc_sel;
					output reg [2:0] ALU_op;
					
					parameter SIZE = 5;
					parameter LOADING = 5'b00000,
								 ADD = 5'b00001,
								 SUB = 5'b00010,
								 AND = 5'b00011,
								 OR = 5'b00100,
								 EXOR = 5'b00101,
								 BIC = 5'b00110,
								 MUL = 5'b00111,
								 MUL_START = 5'b01000,
								 MUL_ASR = 5'b01001,
								 CLEAR = 5'b01011,
								 THE_END = 5'b01100,
								 COMPLEMENT0_1 = 5'b01101,
								 COMPLEMENT0_2 = 5'b01110,
								 COMPLEMENT1_1 = 5'b01111,
								 COMPLEMENT1_2 = 5'b10000,
								 DIV_DECIDE = 5'b10001,
								 DIV = 5'b10010,
								 DIV_START = 5'b10011,
								 DIV_SUB = 5'b10100,
								 DIV_QorAC = 5'b10101,
								 DIV_END = 5'b10110;
					
					reg [SIZE-1:0] state;
					reg [SIZE-1:0] next_state = LOADING;
					reg [3:0] counter;
					reg comp0,comp1,neg,flag_divend;
					
					always@(state) 
					begin : FSM_Comb
						case(state)
							LOADING: begin	
								R0_res=0;
								R1_res=0;
								AC_res=0;
								Q_res=0;
								if(LOAD==1 || COMP==1) begin
									R0_we=1;
									R1_we=1;
									R1src_sel=2'b10;
									R0src_sel=2'b10;
									if(COMP==1) begin
										case(ALP_op)
											3'b000: next_state = ADD;
											3'b001: next_state = SUB;
											3'b010: next_state = MUL;
											3'b011: next_state = DIV_DECIDE;
											3'b100: next_state = AND;
											3'b101: next_state = OR;
											3'b110: next_state = EXOR;
											3'b111: next_state = BIC;
										endcase
									end
									else next_state = THE_END;
								end
							end
							ADD: begin
								ALU_op=3'b000;
								srcA_sel=2'b00;
								srcB_sel=2'b10;
								R0src_sel=2'b01;
								R1_res=1;
								R0_we=1;
								next_state = THE_END;
							end
							SUB: begin
								ALU_op=3'b001;
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
								ALU_op=3'b011;
								srcA_sel=2'b01;
								srcB_sel=2'b11;
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
								Qsrc_sel=2'b00;
								R0_we=0;
								R1_we=0;
								Esrc_sel=2'b10;
								counter=8;
								next_state=MUL_START;
							end
							MUL_START: begin
								AC_res=0;
								if(counter==0) begin
									AC_ps=1;
									Q_ps=1;
									ACsrc_sel=1;
									Qsrc_sel=2'b01;
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
										Q_ps=1;
										Qsrc_sel=2'b01;
										AC_ps=1;
										ACsrc_sel=0;
										Esrc_sel=2'b11;
										next_state=MUL_ASR;
									end
									else if ({Q0,E_out} == 2'b01) begin
										ALU_op=3'b000;
										srcA_sel=2'b10;
										srcB_sel=2'b10;
										R1_we=0;
										R0_we=0;
										Q_ps=1;
										Qsrc_sel=2'b01;
										AC_ps=1;
										ACsrc_sel=0;
										Esrc_sel=2'b11;
										next_state=MUL_ASR;
									end
									else begin
									AC_ps=1;
									Q_ps=1;
									ACsrc_sel=1;
									Qsrc_sel=2'b01;
									Esrc_sel=2'b11;
									next_state = MUL_ASR;
									end
								end
							end
							MUL_ASR: begin
								R0_we=0;
								R1_we=0;
								AC_ps=0;
								AC_lr=1;
								Q_ps=0;
								Q_lr=1;
								Esrc_sel=2'b01;
								counter=counter-1;
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
								R0_we=0;
								R1_we=0;
								if(ALP_op==3'b011) ERR=neg;
								else ERR=OVF;
							end
							DIV_DECIDE: begin
								case({R1_sign,R0_sign})
									2'b00: begin
										comp0=0;
										comp1=0;
										neg=0;
									end
									2'b01: begin
										comp0=1;
										comp1=0;
										neg=1;
									end
									2'b10: begin
										comp0=0;
										comp1=1;
										neg=1;
									end
									2'b11: begin
										comp0=1;
										comp1=1;
										neg=0;
									end
								endcase
								flag_divend=0;
								if(comp0==1) next_state=COMPLEMENT0_1;
								else if(comp1==1) next_state=COMPLEMENT1_1;
								else next_state=DIV;
							end
							COMPLEMENT0_1: begin
								srcA_sel=2'b00; //srcA = R0_out
								srcB_sel=2'b00; //srcB = 255
								R0src_sel=2'b01;
								R0_we=1;
								R1_we=0;
								ALU_op=3'b110; //EXOR Op for ALU
								next_state=COMPLEMENT0_2;
							end
							COMPLEMENT0_2: begin
								srcA_sel=2'b00; //srcA=R0_out
								srcB_sel=2'b01; //srcB=1
								R0src_sel=2'b01;
								R0_we=1;
								R1_we=0;
								ALU_op=3'b000; //ADD op for ALU
								if(flag_divend==1) next_state=THE_END;
								else begin
									if(comp1==1) next_state=COMPLEMENT1_1;
									else next_state=DIV;
								end
							end
							COMPLEMENT1_1: begin
								srcA_sel=2'b01; //srcA=R1_out
								srcB_sel=2'b00;
								R1src_sel=2'b01;
								R0_we=0;
								R1_we=1;
								ALU_op=3'b110;
								next_state=COMPLEMENT1_2;
							end
							COMPLEMENT1_2: begin
								srcA_sel=2'b01;
								srcB_sel=2'b01;
								R1src_sel=2'b01;
								R0_we=0;
								R1_we=1;
								ALU_op=3'b000;
								next_state=DIV;
							end
							DIV: begin
								AC_res=1;
								Qsrc_sel=2'b10;
								counter=8;
								Q_ps=1;
								next_state=DIV_START;
							end
							DIV_START: begin
								if(counter==0) begin
									AC_ps=1;
									Q_ps=1;
									ACsrc_sel=1;
									Qsrc_sel=2'b01;
									R0_we=1;
									R1_we=1;
									R0src_sel=2'b00;
									R1src_sel=2'b00;
									next_state = DIV_END;
								end
								else begin
									R0_we=0;
									R1_we=0;
									AC_res=0;
									AC_ps=0;
									AC_lr=0;
									Q_ps=0;
									Q_lr=0;
									next_state=DIV_SUB;
								end
							end
							DIV_SUB: begin
								Q_ps=1;
								Qsrc_sel=2'b01;
								AC_ps=1;
								ACsrc_sel=0;
								ALU_op=3'b001; //SUB
								srcA_sel=2'b10; //AC
								srcB_sel=2'b11; //R0
								next_state=DIV_QorAC;
							end
							DIV_QorAC: begin
								if(AC_sign==1) begin
									Q_ps=1;
									Qsrc_sel=2'b01;
									AC_ps=1;
									ACsrc_sel=0;
									srcA_sel=2'b10;
									srcB_sel=2'b11;
									ALU_op=3'b000; //Restoring R0 again
									counter=counter-1;
								end
								else begin
									//Else we will put Q0=1
									Q_ps=1;
									Qsrc_sel=2'b11;
									srcA_sel=2'b11;
									srcB_sel=2'b01;
									ALU_op=3'b101;
									AC_ps=1;
									ACsrc_sel=1;
									counter=counter-1;
								end
								next_state=DIV_START;
							end
							DIV_END: begin
								if(neg==1) begin
									flag_divend=1;
									R0_we=0;
									R1_we=0;
									next_state=COMPLEMENT0_1;
								end
								else begin
									R0_we=0;
									R1_we=0;
									next_state=THE_END;
								end
							end
							default: next_state = LOADING;
						endcase
					end
					
					always@(posedge clk) 
					begin : FSM_Seq
						if(CLR == 1) state <= CLEAR;
						else state <= next_state;				
					end
					

					
endmodule
