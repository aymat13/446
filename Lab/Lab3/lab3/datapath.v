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
// CREATED		"Thu Apr 19 23:20:59 2018"

module datapath(
	PCsrc,
	clk,
	reset,
	RegSrc,
	RegWrite,
	ALUSrc,
	Shift_LR,
	ALUControl,
	Instr,
	MemtoReg,
	ReadData,
	Z,
	N,
	OVF,
	CO,
	ALUResult,
	PC,
	WriteData
);


input wire	PCsrc;
input wire	clk;
input wire	reset;
input wire	RegSrc;
input wire	RegWrite;
input wire	ALUSrc;
input wire	Shift_LR;
input wire	[2:0] ALUControl;
input wire	[31:0] Instr;
input wire	[1:0] MemtoReg;
input wire	[31:0] ReadData;
output wire	Z;
output wire	N;
output wire	OVF;
output wire	CO;
output wire	[31:0] ALUResult;
output wire	[31:0] PC;
output wire	[31:0] WriteData;

wire	[31:0] PCNext;
wire	[31:0] PCPlus4;
wire	[31:0] PCPlus8;
wire	[3:0] RA2;
wire	[31:0] Result;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_10;

assign	ALUResult = SYNTHESIZED_WIRE_7;
assign	PC = SYNTHESIZED_WIRE_4;
assign	WriteData = SYNTHESIZED_WIRE_12;




Mux2to1	b2v_a2mux(
	.select(RegSrc),
	.i0(Instr[3:0]),
	.i1(Instr[15:12]),
	.out(RA2));
	defparam	b2v_a2mux.W = 4;


ALU	b2v_ALUU(
	.Control(ALUControl),
	.SrcA(SYNTHESIZED_WIRE_11),
	.SrcB(SYNTHESIZED_WIRE_1),
	.CO(CO),
	.OVF(OVF),
	.N(N),
	.Z(Z),
	.Result(SYNTHESIZED_WIRE_7));
	defparam	b2v_ALUU.W = 32;


constantValueGenerator	b2v_const4(
	.bus_out(SYNTHESIZED_WIRE_13));
	defparam	b2v_const4.C = 4;
	defparam	b2v_const4.W = 32;


extend	b2v_ex(
	.Instr(Instr[11:0]),
	.ExtImm(SYNTHESIZED_WIRE_10));


shifter	b2v_inst(
	.lr(Shift_LR),
	.rb(SYNTHESIZED_WIRE_11),
	.rc(SYNTHESIZED_WIRE_12),
	.ra(SYNTHESIZED_WIRE_8));


Mux2to1	b2v_PCmux(
	.select(PCsrc),
	.i0(PCPlus4),
	.i1(Result),
	.out(PCNext));
	defparam	b2v_PCmux.W = 32;


adder	b2v_PCp4(
	.a(SYNTHESIZED_WIRE_4),
	.b(SYNTHESIZED_WIRE_13),
	.sum(PCPlus4));
	defparam	b2v_PCp4.W = 32;


adder	b2v_PCp8(
	.a(PCPlus4),
	.b(SYNTHESIZED_WIRE_13),
	.sum(PCPlus8));
	defparam	b2v_PCp8.W = 32;


Reg_Simple	b2v_PCreg(
	.clk(clk),
	.reset(reset),
	.data(PCNext),
	.out(SYNTHESIZED_WIRE_4));
	defparam	b2v_PCreg.W = 32;


Mux4to1	b2v_resultmux(
	.in0(SYNTHESIZED_WIRE_7),
	.in1(ReadData),
	.in2(SYNTHESIZED_WIRE_8),
	
	.select(MemtoReg),
	.out(Result));
	defparam	b2v_resultmux.W = 32;


regfile	b2v_RF(
	.clk(clk),
	.reset(reset),
	.we3(RegWrite),
	.r15(PCPlus8),
	.ra1(Instr[19:16]),
	.ra2(RA2),
	.wa3(Instr[15:12]),
	.wd3(Result),
	.rd1(SYNTHESIZED_WIRE_11),
	.rd2(SYNTHESIZED_WIRE_12));


Mux2to1	b2v_srcbmux(
	.select(ALUSrc),
	.i0(SYNTHESIZED_WIRE_12),
	.i1(SYNTHESIZED_WIRE_10),
	.out(SYNTHESIZED_WIRE_1));
	defparam	b2v_srcbmux.W = 32;


endmodule
