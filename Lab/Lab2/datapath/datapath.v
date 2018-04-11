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
// CREATED		"Fri Apr 06 08:16:52 2018"

module datapath(
	R0_res,
	R0_we,
	R1_res,
	R1_we,
	err_rst,
	Q_lr,
	Q_ps,
	Q_res,
	AC_res,
	AC_ps,
	AC_lr,
	clk,
	E_input,
	ACsrc_sel,
	ALU_op,
	Esrc_sel,
	Qsrc_sel,
	R0_in,
	R0src_sel,
	R1_in,
	R1src_sel,
	srcA_sel,
	srcB_sel,
	N,
	Z,
	E,
	ERR,
	Q0,
	R0_sign,
	R1_sign,
	AC_sign,
	R0_out,
	R1_out
);


input wire	R0_res;
input wire	R0_we;
input wire	R1_res;
input wire	R1_we;
input wire	err_rst;
input wire	Q_lr;
input wire	Q_ps;
input wire	Q_res;
input wire	AC_res;
input wire	AC_ps;
input wire	AC_lr;
input wire	clk;
input wire	E_input;
input wire	ACsrc_sel;
input wire	[2:0] ALU_op;
input wire	[1:0] Esrc_sel;
input wire	[1:0] Qsrc_sel;
input wire	[7:0] R0_in;
input wire	[1:0] R0src_sel;
input wire	[7:0] R1_in;
input wire	[1:0] R1src_sel;
input wire	[1:0] srcA_sel;
input wire	[1:0] srcB_sel;
output wire	N;
output wire	Z;
output wire	E;
output wire	ERR;
output wire	Q0;
output wire	R0_sign;
output wire	R1_sign;
output wire	AC_sign;
output wire	[7:0] R0_out;
output wire	[7:0] R1_out;

wire	[7:0] AC_out;
wire	[1:0] E_in;
wire	[1:0] E_out;
wire	[7:0] Q_out;
wire	[7:0] R0_out_ALTERA_SYNTHESIZED;
wire	[7:0] R1_out_ALTERA_SYNTHESIZED;
wire	[7:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[7:0] SYNTHESIZED_WIRE_11;
wire	[7:0] SYNTHESIZED_WIRE_13;
wire	[7:0] SYNTHESIZED_WIRE_14;
wire	[7:0] SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_5 = 0;




Reg_Shift	b2v_AC(
	.clk(clk),
	.reset(AC_res),
	.ps_select(AC_ps),
	.lr_select(AC_lr),
	.input_left(AC_out[7]),
	.input_right(Q_out[7]),
	.data(SYNTHESIZED_WIRE_0),
	.out(AC_out));
	defparam	b2v_AC.W = 8;


Mux2to1	b2v_ACsrc(
	.select(ACsrc_sel),
	.i0(SYNTHESIZED_WIRE_16),
	.i1(AC_out),
	.out(SYNTHESIZED_WIRE_0));
	defparam	b2v_ACsrc.W = 8;

assign	SYNTHESIZED_WIRE_2 = AC_out[7];



constantValueGenerator	b2v_cons1(
	.bus_out(SYNTHESIZED_WIRE_15));
	defparam	b2v_cons1.C = 1;
	defparam	b2v_cons1.W = 8;


constantValueGenerator	b2v_cons8(
	.bus_out(SYNTHESIZED_WIRE_13));
	defparam	b2v_cons8.C = 8;
	defparam	b2v_cons8.W = 8;


constantValueGenerator	b2v_const255(
	.bus_out(SYNTHESIZED_WIRE_14));
	defparam	b2v_const255.C = 255;
	defparam	b2v_const255.W = 8;


constantValueGenerator	b2v_const8(
	.bus_out(SYNTHESIZED_WIRE_10));
	defparam	b2v_const8.C = 8;
	defparam	b2v_const8.W = 8;


Reg_Simple	b2v_ERRE(
	.clk(clk),
	.reset(err_rst),
	.data(E_in),
	.out(E_out));
	defparam	b2v_ERRE.W = 2;


Mux4to1	b2v_Esrc(
	.in0(SYNTHESIZED_WIRE_2),
	.in1(Q_out[0]),
	.in2(E_input),
	.in3(E_out[1]),
	.select(Esrc_sel),
	.out(E_in[1]));
	defparam	b2v_Esrc.W = 1;


ALU	b2v_inst(
	.Control(ALU_op),
	.SrcA(SYNTHESIZED_WIRE_3),
	.SrcB(SYNTHESIZED_WIRE_4),
	
	.OVF(E_in[0]),
	.N(N),
	.Z(Z),
	.Result(SYNTHESIZED_WIRE_16));
	defparam	b2v_inst.W = 8;



Reg_Shift	b2v_Q(
	.clk(clk),
	.reset(Q_res),
	.ps_select(Q_ps),
	.lr_select(Q_lr),
	.input_left(AC_out[0]),
	.input_right(SYNTHESIZED_WIRE_5),
	.data(SYNTHESIZED_WIRE_6),
	.out(Q_out));
	defparam	b2v_Q.W = 8;


Mux4to1	b2v_Qsrc(
	.in0(R0_out_ALTERA_SYNTHESIZED),
	.in1(Q_out),
	.in2(R1_out_ALTERA_SYNTHESIZED),
	.in3(SYNTHESIZED_WIRE_16),
	.select(Qsrc_sel),
	.out(SYNTHESIZED_WIRE_6));
	defparam	b2v_Qsrc.W = 8;


Reg_WE	b2v_R0(
	.clk(clk),
	.reset(R0_res),
	.we(R0_we),
	.data(SYNTHESIZED_WIRE_8),
	.out(R0_out_ALTERA_SYNTHESIZED));
	defparam	b2v_R0.W = 8;


Mux4to1	b2v_R0src(
	.in0(Q_out),
	.in1(SYNTHESIZED_WIRE_16),
	.in2(R0_in),
	.in3(SYNTHESIZED_WIRE_10),
	.select(R0src_sel),
	.out(SYNTHESIZED_WIRE_8));
	defparam	b2v_R0src.W = 8;


Reg_WE	b2v_R1(
	.clk(clk),
	.reset(R1_res),
	.we(R1_we),
	.data(SYNTHESIZED_WIRE_11),
	.out(R1_out_ALTERA_SYNTHESIZED));
	defparam	b2v_R1.W = 8;


Mux4to1	b2v_R1src(
	.in0(AC_out),
	.in1(SYNTHESIZED_WIRE_16),
	.in2(R1_in),
	.in3(SYNTHESIZED_WIRE_13),
	.select(R1src_sel),
	.out(SYNTHESIZED_WIRE_11));
	defparam	b2v_R1src.W = 8;


Mux4to1	b2v_srcA(
	.in0(R0_out_ALTERA_SYNTHESIZED),
	.in1(R1_out_ALTERA_SYNTHESIZED),
	.in2(AC_out),
	.in3(Q_out),
	.select(srcA_sel),
	.out(SYNTHESIZED_WIRE_3));
	defparam	b2v_srcA.W = 8;


Mux4to1	b2v_srcB(
	.in0(SYNTHESIZED_WIRE_14),
	.in1(SYNTHESIZED_WIRE_15),
	.in2(R1_out_ALTERA_SYNTHESIZED),
	.in3(R0_out_ALTERA_SYNTHESIZED),
	.select(srcB_sel),
	.out(SYNTHESIZED_WIRE_4));
	defparam	b2v_srcB.W = 8;

assign	E = E_out[1];
assign	ERR = E_out[0];
assign	Q0 = Q_out[0];
assign	R0_sign = R0_out_ALTERA_SYNTHESIZED[7];
assign	R1_sign = R1_out_ALTERA_SYNTHESIZED[7];
assign	AC_sign = AC_out[7];
assign	R0_out = R0_out_ALTERA_SYNTHESIZED;
assign	R1_out = R1_out_ALTERA_SYNTHESIZED;

endmodule
