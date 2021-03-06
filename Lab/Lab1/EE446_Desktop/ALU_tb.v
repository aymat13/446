module ALU_tb 
	#(parameter W=5) ();
	
	//W-bit Inputs
	reg [W-1:0] SrcA, SrcB;
	//3 bit Control Signal
	reg [2:0] Control;
	//N-bit Result
	wire [W-1:0] Result;
	//Status Flags
	wire CO, OVF, N, Z;
	
	reg [21:0] mem [12:0];
	
	ALU DUT (SrcA, SrcB, Control, Result, CO, OVF, N, Z);
	
	integer i;
	
	initial begin
		$readmemb("C:/Users/AhmetSalih/Desktop/EE446_Desktop/test_vectors/ALU_tb_vector.txt" , mem);
		#1000;
	end
	always @*
	begin
			for(i=0;i<13;i=i+1) begin
			SrcA = mem[i][21:17];
			SrcB = mem[i][16:12];
			Control = mem[i][11:9];
			#10;
			if({Result,CO,OVF,N,Z} == mem[i][8:0])	
				$display ("No Error in %1d th row", i+1);
			else
				$display ("Error in %1d th row", i+1);
			end
	end
endmodule
