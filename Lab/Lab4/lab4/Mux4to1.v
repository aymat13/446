module Mux4to1
	#(parameter W = 2) (in0,in1,in2,in3,select,out);
	
	input wire [W-1:0] in0,in1,in2,in3;
	input wire [1:0] select;
	output reg [W-1:0] out;
	
	always @* begin
		case(select)
			2'b00: out=in0;
			2'b01: out=in1;
			2'b10: out=in2;
			2'b11: out=in3;
		endcase
	end
	
endmodule