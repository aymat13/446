module Reg_Shift_tb 
	#(parameter W=5)();
	
	reg clk,reset,ps_select,lr_select,input_left,input_right;
	reg [W-1:0] data;
	wire [W-1:0] out;
	
	reg [14:0] mem [6:0];
	
	Reg_Shift DUT (clk, reset, ps_select, lr_select, data, input_left, input_right, out);
	
	integer i,j;
	
	initial begin
		clk=0;
		$readmemb("C:/Users/AhmetSalih/Desktop/EE446_Desktop/test_vectors/lab1_registerfile_tb_vector.txt" , mem);
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
			for(i=0;i<7;i=i+1) begin
			reset = mem[i][14];
			ps_select = mem[i][13];
			lr_select = mem[i][12];
			input_left = mem[i][11];
			input_right = mem[i][10];
			data = mem[i][9:5];
			#10;
			if(out == mem[i][4:0])	
				$display ("No Error in %1d th row", i+1);
			else
				$display ("Error in %1d th row", i+1);
			end
	end
endmodule
