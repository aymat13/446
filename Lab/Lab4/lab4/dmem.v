module dmem (	input wire clk,we,
					input wire [7:0] a,wd,
					output wire [15:0] rd);

		reg [15:0] RAM [63:0]; //32 of them is for instructions, rest is for data
		
		initial begin
			$readmemb("C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab4/lab4/program.txt",RAM);
		end
		assign rd = RAM[a[7:0]];
		
		always @(posedge clk) begin
			if(we) RAM[a[7:0]] <= {8'h00,wd};
		end
endmodule
