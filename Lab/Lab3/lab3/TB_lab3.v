module TB_lab3();
	reg clk;
	reg reset;
	wire OVF,N,Z,C;
	// instantiate device to be tested
	toplevel DUT(reset, clk, C, N, Z, OVF);
	integer j;
	// initialize test
	initial
	begin
		clk = 0 ;
		reset <= 1; # 22; reset <= 0;
	end
	// generate clock to sequence tests
	always @* begin
			for(j=0;j<100;j=j+1) begin
				clk = clk ^ 1'b1;
				#5;
				//For now the frequency is too high but it's just for simulation
			end
	end
endmodule
