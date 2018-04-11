module Reg_Shift 
	#(parameter W = 5) (clk, reset, ps_select, lr_select, data, input_left, input_right, out);
	
	input wire clk,reset,ps_select, lr_select;
	input wire [W-1:0] data;
	input wire input_left, input_right;
	
	output reg [W-1:0] out;
	
	always @(posedge clk) begin
		if(reset==1) out<=0; //Synchronous reset
		else begin
			if(ps_select==1) begin
				out <= data; //If Parallel/Serial select=1 then load parallel data
			end
			else begin //Otherwise check for left/right shif signal
				if(lr_select == 1) begin //if lr=1 shift right
					out <= {input_left, out[W-1:1]};
				end
				else begin //lr=0 so shift left
					out <= {out[W-2:0],input_right};
				end
			end
		end
	end
endmodule
