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
// CREATED		"Fri Apr 06 09:06:45 2018"

module lab2(
	clk,
	LOAD,
	COMP,
	CLR,
	ALP_op,
	R0_in,
	R1_in,
	ERR,
	R0_out,
	R1_out
);


input wire	clk;
input wire	LOAD;
input wire	COMP;
input wire	CLR;
input wire	[2:0] ALP_op;
input wire	[7:0] R0_in;
input wire	[7:0] R1_in;
output wire	ERR;
output wire	[7:0] R0_out;
output wire	[7:0] R1_out;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	[2:0] SYNTHESIZED_WIRE_21;
wire	[1:0] SYNTHESIZED_WIRE_22;
wire	[1:0] SYNTHESIZED_WIRE_23;
wire	[1:0] SYNTHESIZED_WIRE_24;
wire	[1:0] SYNTHESIZED_WIRE_25;
wire	[1:0] SYNTHESIZED_WIRE_26;
wire	[1:0] SYNTHESIZED_WIRE_27;

assign	SYNTHESIZED_WIRE_19 = 0;




Controller	b2v_inst(
	.R0_sign(SYNTHESIZED_WIRE_0),
	.R1_sign(SYNTHESIZED_WIRE_1),
	.AC_sign(SYNTHESIZED_WIRE_2),
	.OVF(SYNTHESIZED_WIRE_3),
	.Z(SYNTHESIZED_WIRE_4),
	.N(SYNTHESIZED_WIRE_5),
	.E_out(SYNTHESIZED_WIRE_6),
	.clk(clk),
	.LOAD(LOAD),
	.COMP(COMP),
	.CLR(CLR),
	.Q0(SYNTHESIZED_WIRE_7),
	.ALP_op(ALP_op),
	.R0_we(SYNTHESIZED_WIRE_10),
	.R1_we(SYNTHESIZED_WIRE_18),
	.AC_lr(SYNTHESIZED_WIRE_15),
	.AC_ps(SYNTHESIZED_WIRE_14),
	.ACsrc_sel(SYNTHESIZED_WIRE_16),
	.Q_lr(SYNTHESIZED_WIRE_11),
	.Q_ps(SYNTHESIZED_WIRE_9),
	.R0_res(SYNTHESIZED_WIRE_12),
	.R1_res(SYNTHESIZED_WIRE_17),
	.AC_res(SYNTHESIZED_WIRE_13),
	.Q_res(SYNTHESIZED_WIRE_8),
	.ERR(ERR),
	.E_in(SYNTHESIZED_WIRE_20),
	.ALU_op(SYNTHESIZED_WIRE_21),
	.Esrc_sel(SYNTHESIZED_WIRE_22),
	.Qsrc_sel(SYNTHESIZED_WIRE_23),
	.R0src_sel(SYNTHESIZED_WIRE_24),
	.R1src_sel(SYNTHESIZED_WIRE_25),
	.srcA_sel(SYNTHESIZED_WIRE_26),
	.srcB_sel(SYNTHESIZED_WIRE_27));

	defparam	b2v_inst.ADD = 5'b00001;
	defparam	b2v_inst.AND = 5'b00011;
	defparam	b2v_inst.BIC = 5'b00110;
	defparam	b2v_inst.CLEAR = 5'b01011;
	defparam	b2v_inst.COMPLEMENT0_1 = 5'b01101;
	defparam	b2v_inst.COMPLEMENT0_2 = 5'b01110;
	defparam	b2v_inst.COMPLEMENT1_1 = 5'b01111;
	defparam	b2v_inst.COMPLEMENT1_2 = 5'b10000;
	defparam	b2v_inst.DIV = 5'b10010;
	defparam	b2v_inst.DIV_DECIDE = 5'b10001;
	defparam	b2v_inst.DIV_END = 5'b10110;
	defparam	b2v_inst.DIV_QorAC = 5'b10101;
	defparam	b2v_inst.DIV_START = 5'b10011;
	defparam	b2v_inst.DIV_SUB = 5'b10100;
	defparam	b2v_inst.EXOR = 5'b00101;
	defparam	b2v_inst.LOADING = 5'b00000;
	defparam	b2v_inst.MUL = 5'b00111;
	defparam	b2v_inst.MUL_ASR = 5'b01001;
	defparam	b2v_inst.MUL_START = 5'b01000;
	defparam	b2v_inst.OR = 5'b00100;
	defparam	b2v_inst.SIZE = 5;
	defparam	b2v_inst.SUB = 5'b00010;
	defparam	b2v_inst.THE_END = 5'b01100;


datapath	b2v_inst3(
	.clk(clk),
	.Q_res(SYNTHESIZED_WIRE_8),
	.Q_ps(SYNTHESIZED_WIRE_9),
	.R0_we(SYNTHESIZED_WIRE_10),
	.Q_lr(SYNTHESIZED_WIRE_11),
	.R0_res(SYNTHESIZED_WIRE_12),
	.AC_res(SYNTHESIZED_WIRE_13),
	.AC_ps(SYNTHESIZED_WIRE_14),
	.AC_lr(SYNTHESIZED_WIRE_15),
	.ACsrc_sel(SYNTHESIZED_WIRE_16),
	.R1_res(SYNTHESIZED_WIRE_17),
	.R1_we(SYNTHESIZED_WIRE_18),
	.err_rst(SYNTHESIZED_WIRE_19),
	.E_input(SYNTHESIZED_WIRE_20),
	.ALU_op(SYNTHESIZED_WIRE_21),
	.Esrc_sel(SYNTHESIZED_WIRE_22),
	.Qsrc_sel(SYNTHESIZED_WIRE_23),
	.R0_in(R0_in),
	.R0src_sel(SYNTHESIZED_WIRE_24),
	.R1_in(R1_in),
	.R1src_sel(SYNTHESIZED_WIRE_25),
	.srcA_sel(SYNTHESIZED_WIRE_26),
	.srcB_sel(SYNTHESIZED_WIRE_27),
	.N(SYNTHESIZED_WIRE_5),
	.Z(SYNTHESIZED_WIRE_4),
	.AC_sign(SYNTHESIZED_WIRE_2),
	.R0_sign(SYNTHESIZED_WIRE_0),
	.R1_sign(SYNTHESIZED_WIRE_1),
	.E(SYNTHESIZED_WIRE_6),
	.ERR(SYNTHESIZED_WIRE_3),
	.Q0(SYNTHESIZED_WIRE_7),
	.R0_out(R0_out),
	.R1_out(R1_out));



endmodule
