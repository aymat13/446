module Reg_WE
	#(parameter W=5) (clk, reset, we, data, out);
	
	input wire clk,reset,we;
	input wire [W-1:0] data;
	output reg [W-1:0] out;
	
	always @(posedge clk) begin
		if(reset==1'b1) out <= 0;
		else begin
			if(we == 1'b1) out <= data;
		end		
	end
	
endmodule
