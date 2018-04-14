module TB_Mux16to1 
	#(parameter W = 4) ();
		
	reg [W-1:0] in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15;
	reg [3:0] select;
	wire [W-1:0] out;
	
	reg [71:0] mem [15:0]; 
	
	Mux16to1 DUT
	(
	in0,
	in1,
	in2,
	in3,
	in4,
	in5,
	in6,
	in7,
	in8,
	in9,
	in10,
	in11,
	in12,
	in13,
	in14,
	in15,
	select,
	out
	);
	integer i;
	
	initial begin
		$readmemb("C:/Users/AhmetSalih/Desktop/EE446_Desktop/lab1/test_vectors/Mux16to1_tb_vector.txt" , mem);
		#1000;
	end
	always @(*) begin
	for(i=0;i<16;i=i+1) begin
		in0 = mem[i][71:68];
		in1 = mem[i][67:64];
		in2 = mem[i][63:60];
		in3 = mem[i][59:56];
		in4 = mem[i][55:52];
		in5 = mem[i][51:48];
		in6 = mem[i][47:44];
		in7 = mem[i][43:40];
		in8 = mem[i][39:36];
		in9 = mem[i][35:32];
		in10 = mem[i][31:28];
		in11 = mem[i][27:24];
		in12 = mem[i][23:20];
		in13 = mem[i][19:16];
		in14 = mem[i][15:12];
		in15 = mem[i][11:8];
		select = mem[i][7:4];
		#10;
		if(out == mem[i][3:0]) 
			$display ("No Error in %1d th row", i);
		else
			$display ("Error in %1d th row", i);
	end
	end
endmodule
