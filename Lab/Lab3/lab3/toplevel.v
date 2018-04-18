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
// CREATED		"Thu Apr 19 00:31:23 2018"

module toplevel(
	reset,
	clk,
	C,
	N,
	Z,
	OVF
);


input wire	reset;
input wire	clk;
output wire	C;
output wire	N;
output wire	Z;
output wire	OVF;

wire	[3:0] Flags;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;





imem	b2v_inst(
	.adr(SYNTHESIZED_WIRE_0),
	.inst(SYNTHESIZED_WIRE_4));


dmem	b2v_inst2(
	.clk(clk),
	.we(SYNTHESIZED_WIRE_1),
	.a(SYNTHESIZED_WIRE_2),
	.wd(SYNTHESIZED_WIRE_3),
	.rd(SYNTHESIZED_WIRE_5));


arm	b2v_inst3(
	.reset(reset),
	.clk(clk),
	.Instr(SYNTHESIZED_WIRE_4),
	.ReadData(SYNTHESIZED_WIRE_5),
	.MemWrite(SYNTHESIZED_WIRE_1),
	.ALUResult(SYNTHESIZED_WIRE_2),
	.Flags(Flags),
	.PC(SYNTHESIZED_WIRE_0),
	.WriteData(SYNTHESIZED_WIRE_3));

assign	C = Flags[1];
assign	N = Flags[3];
assign	Z = Flags[2];
assign	OVF = Flags[0];

endmodule
