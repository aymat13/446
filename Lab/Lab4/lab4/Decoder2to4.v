module Decoder2to4 (input0, input1, o0, o1, o2, o3);

	input wire input0, input1;
	output wire o0, o1, o2, o3;
	
	assign o0 = ~input0 & ~input1;
	assign o1 = input0 & ~input1;
	assign o2 = ~input0 & input1;
	assign o3 = input0 & input1;
	
endmodule
	