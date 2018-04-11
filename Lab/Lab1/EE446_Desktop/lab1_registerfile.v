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
// CREATED		"Tue Mar 27 03:01:29 2018"

module lab1_registerfile
#(parameter W = 8)
(
	we,
	clk,
	reset,
	in,
	sel1,
	sel2,
	sel_dest,
	out1,
	out2
);


input wire	we;
input wire	clk;
input wire	reset;
input wire	[W-1:0] in;
input wire	[1:0] sel1;
input wire	[1:0] sel2;
input wire	[1:0] sel_dest;
output wire	[W-1:0] out1;
output wire	[W-1:0] out2;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[W-1:0] SYNTHESIZED_WIRE_20;
wire	[W-1:0] SYNTHESIZED_WIRE_21;
wire	[W-1:0] SYNTHESIZED_WIRE_22;
wire	[W-1:0] SYNTHESIZED_WIRE_23;
wire	[W-1:0] SYNTHESIZED_WIRE_10;
wire	[W-1:0] SYNTHESIZED_WIRE_11;
wire	[W-1:0] SYNTHESIZED_WIRE_14;
wire	[W-1:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;





Decoder2to4	b2v_inst(
	.input0(sel_dest[0]),
	.input1(sel_dest[1]),
	.o0(SYNTHESIZED_WIRE_2),
	.o1(SYNTHESIZED_WIRE_3),
	.o2(SYNTHESIZED_WIRE_4),
	.o3(SYNTHESIZED_WIRE_5));


Reg_WE	b2v_inst10(
	.clk(clk),
	.reset(reset),
	.we(SYNTHESIZED_WIRE_0),
	.data(in),
	.out(SYNTHESIZED_WIRE_22));
	defparam	b2v_inst10.W = W;


Reg_WE	b2v_inst11(
	.clk(clk),
	.reset(reset),
	.we(SYNTHESIZED_WIRE_1),
	.data(in),
	.out(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst11.W = W;

assign	SYNTHESIZED_WIRE_18 = we & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_19 = we & SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_0 = we & SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_1 = we & SYNTHESIZED_WIRE_5;


Mux2to1	b2v_inst2(
	.select(sel1[0]),
	.i0(SYNTHESIZED_WIRE_20),
	.i1(SYNTHESIZED_WIRE_21),
	.out(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst2.W = W;


Mux2to1	b2v_inst3(
	.select(sel1[0]),
	.i0(SYNTHESIZED_WIRE_22),
	.i1(SYNTHESIZED_WIRE_23),
	.out(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst3.W = W;


Mux2to1	b2v_inst4(
	.select(sel1[1]),
	.i0(SYNTHESIZED_WIRE_10),
	.i1(SYNTHESIZED_WIRE_11),
	.out(out1));
	defparam	b2v_inst4.W = W;


Mux2to1	b2v_inst5(
	.select(sel2[0]),
	.i0(SYNTHESIZED_WIRE_20),
	.i1(SYNTHESIZED_WIRE_21),
	.out(SYNTHESIZED_WIRE_14));
	defparam	b2v_inst5.W = W;


Mux2to1	b2v_inst6(
	.select(sel2[1]),
	.i0(SYNTHESIZED_WIRE_14),
	.i1(SYNTHESIZED_WIRE_15),
	.out(out2));
	defparam	b2v_inst6.W = W;


Mux2to1	b2v_inst7(
	.select(sel2[0]),
	.i0(SYNTHESIZED_WIRE_22),
	.i1(SYNTHESIZED_WIRE_23),
	.out(SYNTHESIZED_WIRE_15));
	defparam	b2v_inst7.W = W;


Reg_WE	b2v_inst8(
	.clk(clk),
	.reset(reset),
	.we(SYNTHESIZED_WIRE_18),
	.data(in),
	.out(SYNTHESIZED_WIRE_20));
	defparam	b2v_inst8.W = W;


Reg_WE	b2v_inst9(
	.clk(clk),
	.reset(reset),
	.we(SYNTHESIZED_WIRE_19),
	.data(in),
	.out(SYNTHESIZED_WIRE_21));
	defparam	b2v_inst9.W = W;


endmodule
