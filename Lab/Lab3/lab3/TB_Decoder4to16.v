module TB_Decoder4to16 ();

	reg 			in0,
					in1,
					in2,
					in3;
				
	wire 			out0,
					out1,
					out2,
					out3,
					out4,
					out5,
					out6,
					out7,
					out8,
					out9,
					out10,
					out11,
					out12,
					out13,
					out14,
					out15;
					
	Decoder4to16 DUT (	in0,
	in1, 
	in2, 
	in3,
	out0,
	out1,
	out2,
	out3,
	out4,
	out5,
	out6,
	out7,
	out8,
	out9,
	out10,
	out11,
	out12,
	out13,
	out14,
	out15
);
	reg [19:0] mem [15:0];
	integer i;
	
	initial begin
		$readmemb("C:/Users/AhmetSalih/Desktop/EE446_Desktop/lab1/test_vectors/TB_Vector_Decoder4to16.txt" , mem);
		#1000;
	end
	always @(*) begin
	for(i=0;i<16;i=i+1) begin
		in3 = mem[i][19];
		in2 = mem[i][18];
		in1 = mem[i][17];
		in0 = mem[i][16];
		#10;
		if({out15,out14,out13,out12,out11,out10,out9,out8,out7,out6,out5,out4,out3,out2,out1,out0} == mem[i][15:0]) 
			$display ("No Error in %1d th row", i+1);
		else
			$display ("Error in %1d th row", i+1);
	end
	end
endmodule
