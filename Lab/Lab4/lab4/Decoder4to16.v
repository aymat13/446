module Decoder4to16 
(	in0,
	in1, 
	in2, 
	in3,
	out0,
	out1,
	out2,
	out3,
	out4,
	out5,
	out6,
	out7,
	out8,
	out9,
	out10,
	out11,
	out12,
	out13,
	out14,
	out15
);

	input wire 	in0,
					in1,
					in2,
					in3;
				
	output wire out0,
					out1,
					out2,
					out3,
					out4,
					out5,
					out6,
					out7,
					out8,
					out9,
					out10,
					out11,
					out12,
					out13,
					out14,
					out15;
				
	assign out0 = (~in3) & (~in2) & (~in1) & (~in0);
	assign out1 = (~in3) & (~in2) & (~in1) & (in0);
	assign out2 = (~in3) & (~in2) & (in1) & (~in0);
	assign out3 = (~in3) & (~in2) & (in1) & (in0);
	assign out4 = (~in3) & (in2) & (~in1) & (~in0);
	assign out5 = (~in3) & (in2) & (~in1) & (in0);
	assign out6 = (~in3) & (in2) & (in1) & (~in0);
	assign out7 = (~in3) & (in2) & (in1) & (in0);
	assign out8 = (in3) & (~in2) & (~in1) & (~in0);
	assign out9 = (in3) & (~in2) & (~in1) & (in0);
	assign out10 = (in3) & (~in2) & (in1) & (~in0);
	assign out11 = (in3) & (~in2) & (in1) & (in0);
	assign out12 = (in3) & (in2) & (~in1) & (~in0);
	assign out13 = (in3) & (in2) & (~in1) & (in0);
	assign out14 = (in3) & (in2) & (in1) & (~in0);
	assign out15 = (in3) & (in2) & (in1) & (in0);
	
	
endmodule
