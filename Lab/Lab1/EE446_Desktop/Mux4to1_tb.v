module Mux4to1_tb 
	#(parameter W = 2) ();
		
	reg [W-1:0] i0, i1, i2, i3;
	reg [1:0] select;
	wire [W-1:0] out;
	
	reg [11:0] mem [3:0]; 
	
	Mux4to1 DUT(i0,i1,i2,i3,select,out);
	integer i;
	
	initial begin
		$readmemb("C:/Users/AhmetSalih/Desktop/EE446_Desktop/test_vectors/Mux4to1_tb_vector.txt" , mem);
		#1000;
	end
	always @(*) begin
	for(i=0;i<4;i=i+1) begin
		i0 = mem[i][11:10];
		i1 = mem[i][9:8];
		i2 = mem[i][7:6];
		i3 = mem[i][5:4];
		select = mem[i][3:2];
		#10;
		if(out == mem[i][1:0]) 
			$display ("No Error in %1d th row", i+1);
		else
			$display ("Error in %1d th row", i+1);
	end
	end
endmodule
