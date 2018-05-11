module regfile (	input wire clk,reset,
						input wire we3,
						input wire [2:0] ra1,ra2,wa3,
						input wire [7:0] wd3,r7,
						output wire [7:0] rd1,rd2);
						
		reg [7:0] rf [7:0];
		
		always@(posedge clk) begin
			if(reset) begin
				rf[7] <= 8'h00;
				rf[6] <= 8'h00;
				rf[5] <= 8'h00;
				rf[4] <= 8'h00;
				rf[3] <= 8'h00;
				rf[2] <= 8'h00;
				rf[1] <= 8'h00;
				rf[0] <= 8'h00;
			end
			if(we3) rf[wa3] <= wd3;
		end
		
		assign rd1 = (ra1 == 3'b111) ? r7 : rf[ra1];
		assign rd2 = (ra2 == 3'b111) ? r7 : rf[ra2];
endmodule
