module TB_shifter ();

	reg [31:0] rb,rc;
	wire [31:0] ra;
	reg lr;
	
	reg [96:0] mem [3:0]; 
	
	shifter DUT(rb,rc,lr,ra);
	integer i;
	
	initial begin
		$readmemb("C:/Users/AhmetSalih/Desktop/EE446_Desktop/lab1/test_vectors/shifter_tb_vector.txt" , mem);
		#1000;
	end
	always @(*) begin
	for(i=0;i<4;i=i+1) begin
		rb = mem[i][96:65];
		rc = mem[i][64:33];
		lr = mem[i][32];
		#10;
		if(ra == mem[i][31:0]) 
			$display ("No Error in %1d th row", i+1);
		else
			$display ("Error in %1d th row", i+1);
	end
	end
endmodule
