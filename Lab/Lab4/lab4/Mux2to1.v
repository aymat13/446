module Mux2to1 
	#(parameter W = 3) (i0, i1, select, out);
	
	input [W-1:0] i0, i1;
	input select;
	output [W-1:0] out;

	assign out = (select) ? i1 : i0;

endmodule
