module lab1_datapath_tb ();

	reg const_sel,load_sel,clk,Acps;
	reg [7:0] in;
	wire [7:0] out;
	
	lab1_datapath DUT (const_sel,clk,load_sel,Acps,in,out);
	
	integer i,j;
	
	initial begin
		Acps=0;
		clk=0;
		in = 8'b10101010;
		#1000;
	end
	
	always @* begin
			for(j=0;j<100;j=j+1) begin
				clk = clk ^ 1'b1;
				#5;
				//For now the frequency is too high but it's just for simulation
			end
	end 
	always @(posedge clk) begin
			$display("Burdayim");
			const_sel=0;
			load_sel=1;
			#30;
			const_sel=1;
			#30;
			const_sel=0;
			load_sel=0;
			in=8'b1101_1000;
			#10;
			Acps=1;
			#10;
			Acps=0;
			#90;
			if(out != 8'b0001_1011)
				$display ("ERROR!");
			else
				$display ("NO PROB MATE!");
	end
endmodule
