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
// CREATED		"Wed Apr 18 22:29:24 2018"

module arm(
	clk,
	reset,
	Instr,
	ReadData,
	MemWrite,
	ALUResult,
	Flags,
	PC,
	WriteData
);


input wire	clk;
input wire	reset;
input wire	[31:0] Instr;
input wire	[31:0] ReadData;
output wire	MemWrite;
output wire	[31:0] ALUResult;
output wire	[3:0] Flags;
output wire	[31:0] PC;
output wire	[31:0] WriteData;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[2:0] SYNTHESIZED_WIRE_9;
wire	[1:0] SYNTHESIZED_WIRE_10;





controller	b2v_inst(
	.clk(clk),
	.reset(reset),
	.CO(SYNTHESIZED_WIRE_0),
	.N(SYNTHESIZED_WIRE_1),
	.Z(SYNTHESIZED_WIRE_2),
	.OVF(SYNTHESIZED_WIRE_3),
	.Instr(Instr[31:12]),
	.MemWrite(MemWrite),
	.PCsrc(SYNTHESIZED_WIRE_4),
	.LR(SYNTHESIZED_WIRE_8),
	.RegWrite(SYNTHESIZED_WIRE_6),
	.ALUSrc(SYNTHESIZED_WIRE_7),
	.RegSrc(SYNTHESIZED_WIRE_5),
	.ALUControl(SYNTHESIZED_WIRE_9),
	.Flags(Flags),
	.MemtoReg(SYNTHESIZED_WIRE_10));


datapath	b2v_inst1(
	.PCsrc(SYNTHESIZED_WIRE_4),
	.RegSrc(SYNTHESIZED_WIRE_5),
	.RegWrite(SYNTHESIZED_WIRE_6),
	.ALUSrc(SYNTHESIZED_WIRE_7),
	.Shift_LR(SYNTHESIZED_WIRE_8),
	.clk(clk),
	.reset(reset),
	.ALUControl(SYNTHESIZED_WIRE_9),
	.Instr(Instr),
	.MemtoReg(SYNTHESIZED_WIRE_10),
	.ReadData(ReadData),
	.Z(SYNTHESIZED_WIRE_2),
	.N(SYNTHESIZED_WIRE_1),
	.OVF(SYNTHESIZED_WIRE_3),
	.CO(SYNTHESIZED_WIRE_0),
	.ALUResult(ALUResult),
	.PC(PC),
	.WriteData(WriteData));


endmodule
