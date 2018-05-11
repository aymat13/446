// Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus Prime License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition"
// CREATED		"Fri May 11 05:25:26 2018"

module datapath(
	PCWrite,
	clk,
	IRWrite,
	LRWrite,
	reset,
	AddrSrc,
	RegWrite,
	ALUSrcA,
	ALUControl,
	ALUSrcB,
	PCSrc,
	ReadData,
	RegSrc,
	ResultSrc,
	sh,
	addr,
	Flags,
	Instr,
	LR_data,
	write_data
);


input wire	PCWrite;
input wire	clk;
input wire	IRWrite;
input wire	LRWrite;
input wire	reset;
input wire	AddrSrc;
input wire	RegWrite;
input wire	ALUSrcA;
input wire	[2:0] ALUControl;
input wire	[1:0] ALUSrcB;
input wire	[1:0] PCSrc;
input wire	[15:0] ReadData;
input wire	[1:0] RegSrc;
input wire	[1:0] ResultSrc;
input wire	[2:0] sh;
output wire	[7:0] addr;
output wire	[3:0] Flags;
output wire	[15:0] Instr;
output wire	[7:0] LR_data;
output wire	[7:0] write_data;

wire	[3:0] Flags_ALTERA_SYNTHESIZED;
wire	[15:0] Instr_ALTERA_SYNTHESIZED;
wire	[7:0] SYNTHESIZED_WIRE_26;
wire	[7:0] SYNTHESIZED_WIRE_27;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_28;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_29;
wire	[7:0] SYNTHESIZED_WIRE_11;
wire	[7:0] SYNTHESIZED_WIRE_30;
wire	[7:0] SYNTHESIZED_WIRE_13;
wire	[7:0] SYNTHESIZED_WIRE_14;
wire	[7:0] SYNTHESIZED_WIRE_16;
wire	[2:0] SYNTHESIZED_WIRE_18;
wire	[2:0] SYNTHESIZED_WIRE_19;
wire	[7:0] SYNTHESIZED_WIRE_31;
wire	[7:0] SYNTHESIZED_WIRE_24;

assign	LR_data = SYNTHESIZED_WIRE_11;
assign	write_data = SYNTHESIZED_WIRE_29;




Mux2to1	b2v_Addrsrc_mux(
	.select(AddrSrc),
	.i0(SYNTHESIZED_WIRE_26),
	.i1(SYNTHESIZED_WIRE_27),
	.out(addr));
	defparam	b2v_Addrsrc_mux.W = 8;


constantValueGenerator	b2v_const1(
	.bus_out(SYNTHESIZED_WIRE_24));
	defparam	b2v_const1.C = 1;
	defparam	b2v_const1.W = 8;


Reg_Simple	b2v_data_A(
	.clk(clk),
	.reset(reset),
	.data(SYNTHESIZED_WIRE_2),
	.out(SYNTHESIZED_WIRE_31));
	defparam	b2v_data_A.W = 8;


Reg_Simple	b2v_data_B(
	.clk(clk),
	.reset(reset),
	.data(SYNTHESIZED_WIRE_3),
	.out(SYNTHESIZED_WIRE_29));
	defparam	b2v_data_B.W = 8;


Reg_Simple	b2v_DR(
	.clk(clk),
	.reset(reset),
	.data(ReadData[7:0]),
	.out(SYNTHESIZED_WIRE_14));
	defparam	b2v_DR.W = 8;


ALU	b2v_inst14(
	.Control(ALUControl),
	.SrcA(SYNTHESIZED_WIRE_4),
	.SrcB(SYNTHESIZED_WIRE_28),
	.CO(Flags_ALTERA_SYNTHESIZED[0]),
	.OVF(Flags_ALTERA_SYNTHESIZED[1]),
	.N(Flags_ALTERA_SYNTHESIZED[2]),
	.Z(Flags_ALTERA_SYNTHESIZED[3]),
	.Result(SYNTHESIZED_WIRE_30));
	defparam	b2v_inst14.W = 8;


shifter	b2v_inst19(
	.rd(SYNTHESIZED_WIRE_28),
	.sh(sh),
	.ra(SYNTHESIZED_WIRE_16));


Reg_WE	b2v_IR(
	.clk(clk),
	.reset(reset),
	.we(IRWrite),
	.data(ReadData),
	.out(Instr_ALTERA_SYNTHESIZED));
	defparam	b2v_IR.W = 16;


Reg_WE	b2v_LR(
	.clk(clk),
	.reset(reset),
	.we(LRWrite),
	.data(SYNTHESIZED_WIRE_26),
	.out(SYNTHESIZED_WIRE_11));
	defparam	b2v_LR.W = 8;


Reg_WE	b2v_PC(
	.clk(clk),
	.reset(reset),
	.we(PCWrite),
	.data(SYNTHESIZED_WIRE_8),
	.out(SYNTHESIZED_WIRE_26));
	defparam	b2v_PC.W = 8;


Mux4to1	b2v_PCSrc_mux(
	.in0(SYNTHESIZED_WIRE_27),
	.in1(SYNTHESIZED_WIRE_29),
	.in2(SYNTHESIZED_WIRE_11),
	.in3(Instr_ALTERA_SYNTHESIZED[7:0]),
	.select(PCSrc),
	.out(SYNTHESIZED_WIRE_8));
	defparam	b2v_PCSrc_mux.W = 8;


Mux2to1	b2v_Regsrc1(
	.select(RegSrc[1]),
	.i0(Instr_ALTERA_SYNTHESIZED[7:5]),
	.i1(Instr_ALTERA_SYNTHESIZED[10:8]),
	.out(SYNTHESIZED_WIRE_18));
	defparam	b2v_Regsrc1.W = 3;


Mux2to1	b2v_Regsrc2(
	.select(RegSrc[0]),
	.i0(Instr_ALTERA_SYNTHESIZED[2:0]),
	.i1(Instr_ALTERA_SYNTHESIZED[10:8]),
	.out(SYNTHESIZED_WIRE_19));
	defparam	b2v_Regsrc2.W = 3;


Reg_Simple	b2v_result(
	.clk(clk),
	.reset(reset),
	.data(SYNTHESIZED_WIRE_30),
	.out(SYNTHESIZED_WIRE_13));
	defparam	b2v_result.W = 8;


Mux4to1	b2v_result_mux(
	.in0(SYNTHESIZED_WIRE_13),
	.in1(SYNTHESIZED_WIRE_14),
	.in2(SYNTHESIZED_WIRE_30),
	.in3(SYNTHESIZED_WIRE_16),
	.select(ResultSrc),
	.out(SYNTHESIZED_WIRE_27));
	defparam	b2v_result_mux.W = 8;


regfile	b2v_RF(
	.clk(clk),
	.reset(reset),
	.we3(RegWrite),
	.r7(SYNTHESIZED_WIRE_27),
	.ra1(SYNTHESIZED_WIRE_18),
	.ra2(SYNTHESIZED_WIRE_19),
	.wa3(Instr_ALTERA_SYNTHESIZED[10:8]),
	.wd3(SYNTHESIZED_WIRE_27),
	.rd1(SYNTHESIZED_WIRE_2),
	.rd2(SYNTHESIZED_WIRE_3));


Mux2to1	b2v_srcA_mux(
	.select(ALUSrcA),
	.i0(SYNTHESIZED_WIRE_31),
	.i1(SYNTHESIZED_WIRE_26),
	.out(SYNTHESIZED_WIRE_4));
	defparam	b2v_srcA_mux.W = 8;


Mux4to1	b2v_srcB_mux(
	.in0(SYNTHESIZED_WIRE_29),
	.in1(Instr_ALTERA_SYNTHESIZED[7:0]),
	.in2(SYNTHESIZED_WIRE_24),
	.in3(SYNTHESIZED_WIRE_31),
	.select(ALUSrcB),
	.out(SYNTHESIZED_WIRE_28));
	defparam	b2v_srcB_mux.W = 8;

assign	Flags = Flags_ALTERA_SYNTHESIZED;
assign	Instr = Instr_ALTERA_SYNTHESIZED;

endmodule
