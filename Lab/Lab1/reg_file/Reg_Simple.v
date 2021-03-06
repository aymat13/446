module Reg_Simple
	#(parameter W=5) (clk, reset, data, out);
	
	input wire clk,reset;
	input wire [W-1:0] data;
	output reg [W-1:0] out;
	
	always @(posedge clk) begin
		if(reset==1'b1) out <= 0;
		else out <= data;
	end
	
endmodule
