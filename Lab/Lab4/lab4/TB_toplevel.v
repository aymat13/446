module TB_toplevel();
	reg clk,reset;
	wire [3:0] Flags;
	wire [7:0] LR;
	toplevel DUT(clk,reset,Flags,LR);
	
	integer j;
	
	initial begin
		clk = 0;
		reset = 1; #22; reset = 0;
	end
	
	always @* begin
			for(j=0;j<1000;j=j+1) begin
				clk = clk ^ 1'b1;
				#5;
				//For now the frequency is too high but it's just for simulation
			end
	end
	
endmodule
