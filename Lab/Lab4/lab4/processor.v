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
// CREATED		"Fri May 11 05:02:30 2018"

module processor(
	clk,
	reset,
	ReadData,
	MemWrite,
	addr,
	Flags,
	LR_data,
	write_data
);


input wire	clk;
input wire	reset;
input wire	[15:0] ReadData;
output wire	MemWrite;
output wire	[7:0] addr;
output wire	[3:0] Flags;
output wire	[7:0] LR_data;
output wire	[7:0] write_data;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[2:0] SYNTHESIZED_WIRE_6;
wire	[1:0] SYNTHESIZED_WIRE_7;
wire	[1:0] SYNTHESIZED_WIRE_8;
wire	[1:0] SYNTHESIZED_WIRE_9;
wire	[1:0] SYNTHESIZED_WIRE_10;
wire	[2:0] SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	[15:0] SYNTHESIZED_WIRE_13;





datapath	b2v_inst(
	.LRWrite(SYNTHESIZED_WIRE_0),
	.AddrSrc(SYNTHESIZED_WIRE_1),
	.RegWrite(SYNTHESIZED_WIRE_2),
	.ALUSrcA(SYNTHESIZED_WIRE_3),
	.PCWrite(SYNTHESIZED_WIRE_4),
	.IRWrite(SYNTHESIZED_WIRE_5),
	.clk(clk),
	.reset(reset),
	.ALUControl(SYNTHESIZED_WIRE_6),
	.ALUSrcB(SYNTHESIZED_WIRE_7),
	.PCSrc(SYNTHESIZED_WIRE_8),
	.ReadData(ReadData),
	.RegSrc(SYNTHESIZED_WIRE_9),
	.ResultSrc(SYNTHESIZED_WIRE_10),
	.sh(SYNTHESIZED_WIRE_11),
	.addr(addr),
	.Flags(SYNTHESIZED_WIRE_12),
	.Instr(SYNTHESIZED_WIRE_13),
	.LR_data(LR_data),
	.write_data(write_data));


controller	b2v_inst1(
	.clk(clk),
	.reset(reset),
	.ALUFlags(SYNTHESIZED_WIRE_12),
	.Instr(SYNTHESIZED_WIRE_13),
	.PCWrite(SYNTHESIZED_WIRE_4),
	.LRWrite(SYNTHESIZED_WIRE_0),
	.AddrSrc(SYNTHESIZED_WIRE_1),
	.IRWrite(SYNTHESIZED_WIRE_5),
	.RegWrite(SYNTHESIZED_WIRE_2),
	.ALUSrcA(SYNTHESIZED_WIRE_3),
	.MemWrite(MemWrite),
	.ALUControl(SYNTHESIZED_WIRE_6),
	.ALUSrcB(SYNTHESIZED_WIRE_7),
	.Flags(Flags),
	.PCSrc(SYNTHESIZED_WIRE_8),
	.RegSrc(SYNTHESIZED_WIRE_9),
	.ResultSrc(SYNTHESIZED_WIRE_10),
	.sh(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst1.DECODE = 3'b001;
	defparam	b2v_inst1.EXECR = 3'b110;
	defparam	b2v_inst1.FETCH = 3'b000;
	defparam	b2v_inst1.LDR_imm = 3'b101;
	defparam	b2v_inst1.LDR_reg0 = 3'b011;
	defparam	b2v_inst1.LDR_reg1 = 3'b100;
	defparam	b2v_inst1.SHIFT = 3'b111;
	defparam	b2v_inst1.STR = 3'b010;


endmodule
