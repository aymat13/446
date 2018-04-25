module regfile (	input wire clk,reset,
						input wire we3,
						input wire [3:0] ra1,ra2,wa3,
						input wire [31:0] wd3,r15,
						output wire [31:0] rd1,rd2);
						
		reg [31:0] rf [14:0];
		
		always@(posedge clk) begin
			if(reset) begin
				rf[14] <= 32'h0000_0000;
				rf[13] <= 32'h0000_0000;
				rf[12] <= 32'h0000_0000;
				rf[11] <= 32'h0000_0000;
				rf[10] <= 32'h0000_0000;
				rf[9] <= 32'h0000_0000;
				rf[8] <= 32'h0000_0000;
				rf[7] <= 32'h0000_0000;
				rf[6] <= 32'h0000_0000;
				rf[5] <= 32'h0000_0000;
				rf[4] <= 32'h0000_0000;
				rf[3] <= 32'h0000_0000;
				rf[2] <= 32'h0000_0000;
				rf[1] <= 32'h0000_0000;
				rf[0] <= 32'h0000_0000;
			end
			if(we3) rf[wa3] <= wd3;
		end
		
		assign rd1 = (ra1 == 4'b1111) ? r15 : rf[ra1];
		assign rd2 = (ra2 == 4'b1111) ? r15 : rf[ra2];
endmodule
