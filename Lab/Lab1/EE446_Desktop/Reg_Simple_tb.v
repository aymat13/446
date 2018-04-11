module Reg_Simple_tb 
	#(parameter W=5)();
	
	reg clk,reset;
	reg [W-1:0] data;
	wire [W-1:0] out;
	
	reg [10:0] mem [3:0];
	
	Reg_Simple DUT (clk, reset, data, out);
	
	integer i,j;
	
	initial begin
		clk=0;
		$readmemb("C:/Users/AhmetSalih/Desktop/EE446_Desktop/test_vectors/Reg_Simple_tb_vector.txt" , mem);
		#1000;
	end
	always @* begin
			for(j=0;j<100;j=j+1) begin
				clk = clk ^ 1'b1;
				#5;
				//For now the frequency is too high but it's just for simulation
			end
	end
	always @*
	begin
			for(i=0;i<4;i=i+1) begin
			reset = mem[i][10];
			data = mem[i][9:5];
			#13;
			if(out == mem[i][4:0])	
				$display ("No Error in %1d th row", i+1);
			else
				$display ("Error in %1d th row", i+1);
			end
	end
endmodule
