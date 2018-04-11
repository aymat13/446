module Mux2to1_tb 
	#(parameter W = 2) ();
		
	reg [W-1:0] i0, i1;
	reg select;
	wire [W-1:0] out;
	
	reg [6:0] mem [1:0]; 
	
	Mux2to1 DUT(i0,i1,select,out);
	integer i;
	
	initial begin
		$readmemb("C:/Users/AhmetSalih/Desktop/EE446_Desktop/test_vectors/Mux2to1_tb_vector.txt" , mem);
		#1000;
	end
	always @(*) begin
	for(i=0;i<2;i=i+1) begin
		i0 = mem[i][4:3];
		i1 = mem[i][6:5];
		select = mem[i][2];
		#10;
		if(out == mem[i][1:0]) 
			$display ("No Error in %1d th row", i+1);
		else
			$display ("Error in %1d th row", i+1);
	end
	end
endmodule
