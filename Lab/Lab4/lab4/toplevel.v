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
// CREATED		"Fri May 11 05:03:13 2018"

module toplevel(
	clk,
	reset,
	Flags,
	LR
);


input wire	clk;
input wire	reset;
output wire	[3:0] Flags;
output wire	[7:0] LR;

wire	[15:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;





processor	b2v_inst(
	.clk(clk),
	.reset(reset),
	.ReadData(SYNTHESIZED_WIRE_0),
	.MemWrite(SYNTHESIZED_WIRE_1),
	.addr(SYNTHESIZED_WIRE_2),
	.Flags(Flags),
	.LR_data(LR),
	.write_data(SYNTHESIZED_WIRE_3));


dmem	b2v_inst1(
	.clk(clk),
	.we(SYNTHESIZED_WIRE_1),
	.a(SYNTHESIZED_WIRE_2),
	.wd(SYNTHESIZED_WIRE_3),
	.rd(SYNTHESIZED_WIRE_0));


endmodule
