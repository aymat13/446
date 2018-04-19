module dmem (	input wire clk,we,
					input wire [31:0] a,wd,
					output wire [31:0] rd);

		reg [31:0] RAM [63:0];
		
		initial begin
			$readmemh("C:/Users/aymat/Documents/GitHub/446/Lab/Lab3/lab3/initial_data.txt",RAM);
		end
		assign rd = RAM[a[31:2]];
		
		always @(posedge clk) begin
			if(we) RAM[a[31:2]] <= wd;
		end
endmodule
