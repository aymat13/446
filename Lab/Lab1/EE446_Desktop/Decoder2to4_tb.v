module Decoder2to4_tb ();
	wire ou0, ou1, ou2, ou3;
	reg in0, in1;
	Decoder2to4 DUT(in0, in1, ou0, ou1, ou2, ou3);
	reg [5:0] mem [3:0];
	integer i;
	
	initial begin
		$readmemb("C:/Users/AhmetSalih/Desktop/EE446_Desktop/test_vectors/Decoder_tb_vector.txt" , mem);
		#1000;
	end
	always @(*) begin
	for(i=0;i<4;i=i+1) begin
		in0 = mem[i][4];
		in1 = mem[i][5];
		#10;
		if({ou3,ou2,ou1,ou0} == mem[i][3:0]) 
			$display ("No Error in %1d th row", i+1);
		else
			$display ("Error in %1d th row", i+1);
	end
	end
endmodule
