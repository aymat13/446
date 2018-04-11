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
// CREATED		"Tue Mar 27 17:50:25 2018"

module lab1_datapath(
	const_sel,
	clk,
	load_sel,
	ACps,
	in,
	out
);


input wire	const_sel;
input wire	clk;
input wire	load_sel;
input wire	ACps;
input wire	[7:0] in;
output wire	[7:0] out;

wire	[7:0] AC_Out;
wire	[7:0] ALU_Out;
wire	[0:0] SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_1;
wire	[0:2] SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_19;
wire	[7:0] SYNTHESIZED_WIRE_14;
wire	[7:0] SYNTHESIZED_WIRE_15;
wire	[7:0] SYNTHESIZED_WIRE_17;

assign	SYNTHESIZED_WIRE_1 = 1;
assign	SYNTHESIZED_WIRE_4 = 0;




Reg_Shift	b2v_AC(
	.clk(clk),
	.reset(SYNTHESIZED_WIRE_18),
	.ps_select(ACps),
	.lr_select(SYNTHESIZED_WIRE_1),
	.input_left(SYNTHESIZED_WIRE_18),
	.input_right(SYNTHESIZED_WIRE_18),
	.data(ALU_Out),
	.out(AC_Out));
	defparam	b2v_AC.W = 8;


constantValueGenerator	b2v_const_0(
	.bus_out(SYNTHESIZED_WIRE_19));
	defparam	b2v_const_0.C = 0;
	defparam	b2v_const_0.W = 8;


constantValueGenerator	b2v_const_1(
	.bus_out(SYNTHESIZED_WIRE_17));
	defparam	b2v_const_1.C = 1;
	defparam	b2v_const_1.W = 8;


ALU	b2v_inst(
	.Control(SYNTHESIZED_WIRE_4),
	.SrcA(SYNTHESIZED_WIRE_5),
	.SrcB(SYNTHESIZED_WIRE_6),
	
	
	
	
	.Result(ALU_Out));
	defparam	b2v_inst.W = 8;



constantValueGenerator	b2v_inst2(
	.bus_out(SYNTHESIZED_WIRE_18));
	defparam	b2v_inst2.C = 0;
	defparam	b2v_inst2.W = 1;


Reg_Shift	b2v_Q(
	.clk(clk),
	.reset(SYNTHESIZED_WIRE_18),
	.ps_select(SYNTHESIZED_WIRE_18),
	.lr_select(SYNTHESIZED_WIRE_18),
	.input_left(SYNTHESIZED_WIRE_18),
	.input_right(AC_Out[0]),
	.data(SYNTHESIZED_WIRE_19),
	.out(SYNTHESIZED_WIRE_15));
	defparam	b2v_Q.W = 8;


Reg_Simple	b2v_RegA(
	.clk(clk),
	.reset(SYNTHESIZED_WIRE_18),
	.data(in),
	.out(SYNTHESIZED_WIRE_5));
	defparam	b2v_RegA.W = 8;


Reg_Simple	b2v_RegB(
	.clk(clk),
	.reset(SYNTHESIZED_WIRE_18),
	.data(SYNTHESIZED_WIRE_14),
	.out(out));
	defparam	b2v_RegB.W = 8;


Mux2to1	b2v_RegBSelect(
	.select(load_sel),
	.i0(SYNTHESIZED_WIRE_15),
	.i1(ALU_Out),
	.out(SYNTHESIZED_WIRE_14));
	defparam	b2v_RegBSelect.W = 8;


Mux2to1	b2v_SrcBSelect(
	.select(const_sel),
	.i0(SYNTHESIZED_WIRE_19),
	.i1(SYNTHESIZED_WIRE_17),
	.out(SYNTHESIZED_WIRE_6));
	defparam	b2v_SrcBSelect.W = 8;



endmodule
